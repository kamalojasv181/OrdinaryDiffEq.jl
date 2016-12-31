#=
Note about notation in the header/footer

u is previous value, at the end integrator.u = utmp, events occur, and then
u = integrator.u. Therefore `integrator.uprev === u`. This allows for the
events interface to use `u` as the value to check for events an mutate, but
`u` be the variable in the methods, and gets rid of the extra array `uprev`
by folding it with `u`

This also opens up `integrator.u === utmp`, the proposed value for `u`.
This reduces yet another copy operation and another temporary.

=#

type DEOptions{uEltype,uEltypeNoUnits,tTypeNoUnits,tType,F2,F3,F4,F5}
  maxiters::Int
  timeseries_steps::Int
  save_timeseries::Bool
  adaptive::Bool
  abstol::uEltype
  reltol::uEltypeNoUnits
  gamma::tTypeNoUnits
  qmax::tTypeNoUnits
  qmin::tTypeNoUnits
  dtmax::tType
  dtmin::tType
  internalnorm::F2
  progress::Bool
  progress_steps::Int
  progress_name::String
  progress_message::F5
  beta1::tTypeNoUnits
  beta2::tTypeNoUnits
  qoldinit::tTypeNoUnits
  dense::Bool
  saveat::Vector{tType}
  callback::F3
  isoutofdomain::F4
  calck::Bool
end

type ODEIntegrator{algType<:OrdinaryDiffEqAlgorithm,uType<:Union{AbstractArray,Number},tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O}
  sol::SolType
  u::uType
  k::ksEltype
  t::tType
  dt::tType
  f::F
  uprev::uType
  kprev::ksEltype
  tprev::tType
  Ts::Vector{tType}
  autodiff::Bool
  adaptiveorder::Int
  order::Int
  alg::algType
  rate_prototype::rateType
  notsaveat_idxs::Vector{Int}
  calcprevs::Bool
  dtcache::tType
  dt_mod::tTypeNoUnits
  tdir::Int
  iter::Int
  saveiter::Int
  saveiter_dense::Int
  cursaveat::Int
  event_cache::ECType
  kshortsize::Int
  reeval_fsal::Bool
  opts::O
end

@def ode_preamble begin
  local t::tType
  local dt::tType

  @unpack k,t,dt,Ts,autodiff,alg,rate_prototype = integrator
  u = integrator.uprev # See the note at the top
  utmp = integrator.u # See the note at the top
  f = integrator.f # Grab the pointer for the local scope. Updates automatically.

  Tfinal = Ts[end]

  local T::tType
  uEltypeNoUnits = typeof(integrator.opts.reltol)
  uEltype = typeof(integrator.opts.abstol)
  local Θ = one(t)/one(t) # No units
  local q::tTypeNoUnits = 0
  local dtpropose::tType = tType(0)
  local q11::tTypeNoUnits = 0
  local qold::tTypeNoUnits = integrator.opts.qoldinit
  if uType <: Number || !(typeof(integrator.opts.callback)<:Void)
    cache = ()
  end
  qminc = inv(integrator.opts.qmin) #facc1
  qmaxc = inv(integrator.opts.qmax) #facc2
  local EEst::tTypeNoUnits = zero(t/t)
  integrator.opts.progress && (prog = Juno.ProgressBar(name=integrator.opts.progress_name))
end

@def ode_loopheader begin
  integrator.iter += 1

  if integrator.opts.adaptive
    if integrator.tdir > 0
      dt = min(abs(dt),abs(T-t)) # Step to the end
    else
      dt = -min(abs(dt),abs(T-t))
    end
  elseif integrator.dtcache == 0 # Use tstops
    dt = integrator.tdir*abs(T-t)
  else # always try to step with dtcache
    dt = integrator.tdir*min(abs(integrator.dtcache),abs(T-t)) # Step to the end
  end

  if integrator.iter > integrator.opts.maxiters
    warn("Interrupted. Larger maxiters is needed.")
    ode_postamble!(integrator)
    return nothing
  end
  if dt == tType(0)
    warn("dt == 0. Aborting")
    ode_postamble!(integrator)
    return nothing
  end
  if any(isnan,u)
    warn("NaNs detected. Aborting")
    ode_postamble!(integrator)
    return nothing
  end

  if uType<:AbstractArray && !(typeof(integrator.opts.callback)<:Void)
    uidx = eachindex(u)
  end
end

@inline function ode_savevalues!(integrator)
  if !isempty(integrator.opts.saveat) # Perform saveat
    while integrator.cursaveat <= length(integrator.opts.saveat) && integrator.tdir*integrator.opts.saveat[integrator.cursaveat]<= integrator.tdir*integrator.t
      integrator.saveiter += 1
      if integrator.opts.saveat[integrator.cursaveat]!=integrator.t # If <t, interpolate
        curt = integrator.opts.saveat[integrator.cursaveat]
        ode_addsteps!(integrator.k,integrator.tprev,integrator.uprev,integrator.dt,integrator.alg,integrator.f)
        Θ = (curt - integrator.tprev)/integrator.dt
        val = ode_interpolant(Θ,integrator.dt,integrator.uprev,integrator.u,integrator.kprev,integrator.k,integrator.alg)
        copyat_or_push!(integrator.sol.t,integrator.saveiter,curt)
        copyat_or_push!(integrator.sol.u,integrator.saveiter,val)
      else # ==t, just save
        copyat_or_push!(integrator.sol.t,integrator.saveiter,integrator.t)
        copyat_or_push!(integrator.sol.u,integrator.saveiter,integrator.u)
        if integrator.opts.dense
          integrator.saveiter_dense += 1
          copyat_or_push!(integrator.sol.k,integrator.saveiter_dense,integrator.k)
          copyat_or_push!(integrator.notsaveat_idxs,integrator.saveiter_dense,integrator.saveiter)
        end
      end
      integrator.cursaveat+=1
    end
  end
  if integrator.opts.save_timeseries && integrator.iter%integrator.opts.timeseries_steps==0
    integrator.saveiter += 1
    copyat_or_push!(integrator.sol.u,integrator.saveiter,integrator.u)
    copyat_or_push!(integrator.sol.t,integrator.saveiter,integrator.t)
    if integrator.opts.dense
      integrator.saveiter_dense += 1
      copyat_or_push!(integrator.sol.k,integrator.saveiter_dense,integrator.k)
      copyat_or_push!(integrator.notsaveat_idxs,integrator.saveiter_dense,integrator.saveiter)
    end
  end
  if isspecialdense(integrator.alg)
    resize!(integrator.k,integrator.kshortsize)
  end
end

@inline function ode_postamble!(integrator)
  if integrator.sol.t[end] !=  integrator.t
    integrator.saveiter += 1
    copyat_or_push!(integrator.sol.t,integrator.saveiter,integrator.t)
    copyat_or_push!(integrator.sol.u,integrator.saveiter,integrator.u)
    if integrator.opts.dense
      integrator.saveiter_dense +=1
      copyat_or_push!(integrator.sol.k,integrator.saveiter_dense,integrator.k)
      copyat_or_push!(integrator.notsaveat_idxs,integrator.saveiter_dense,integrator.saveiter)
    end
  end
  integrator.opts.progress && Juno.done(prog)
end

@def pack_integrator begin
  integrator.dt = dt
  integrator.dt_mod = tTypeNoUnits(1)
  integrator.k = k
  integrator.t = t
  # integrator.u is already utmp if mutable (due to pointers)
  if !(uType <: AbstractArray)
    integrator.u = utmp
  end
end

@def unpack_integrator begin
  if uType <: AbstractArray
    recursivecopy!(u,integrator.u) # this is where the update of `u` from `utmp` occurs
  else
    u = integrator.u
  end
  t = integrator.t
end

@def ode_loopfooter begin
  if integrator.opts.adaptive
    q11 = EEst^integrator.opts.beta1
    q = q11/(qold^integrator.opts.beta2)
    q = max(qmaxc,min(qminc,q/integrator.opts.gamma))
    dtnew = dt/q
    ttmp = t + dt
    if !integrator.opts.isoutofdomain(ttmp,utmp) && EEst <= 1.0 # Accept
      t = ttmp
      qold = max(EEst,integrator.opts.qoldinit)
      if integrator.tdir > 0
        dtpropose = min(integrator.opts.dtmax,dtnew)
      else
        dtpropose = max(integrator.opts.dtmax,dtnew)
      end
      if integrator.tdir > 0
        dtpropose = max(dtpropose,integrator.opts.dtmin) #abs to fix complex sqrt issue at end
      else
        dtpropose = min(dtpropose,integrator.opts.dtmin) #abs to fix complex sqrt issue at end
      end
      @pack_integrator
      if !(typeof(integrator.opts.callback)<:Void)
        T = integrator.opts.callback(cache,T,Ts,integrator)
      else
        ode_savevalues!(integrator)
      end
      @unpack_integrator
      dt = integrator.dt_mod*dtpropose

      if isfsal(integrator.alg)
        if integrator.reeval_fsal || (typeof(integrator.alg)<:DP8 && !integrator.opts.calck)
          # Under these condtions, these algorithms are not FSAL anymore
          if uType <: AbstractArray
            f(t,u,fsalfirst)
          else
            fsalfirst = f(t,u)
          end
          integrator.reeval_fsal = false
        else
          if uType <: AbstractArray
            recursivecopy!(fsalfirst,fsallast)
          else
            fsalfirst = fsallast
          end
        end
      end

      if integrator.calcprevs
        integrator.tprev = t
        if !isspecialdense(integrator.alg) && integrator.opts.calck
          if ksEltype <: AbstractArray
            recursivecopy!(integrator.kprev,k)
          else
            integrator.kprev = k
          end
        end
      end
    else # Reject
      dt = dt/min(qminc,q11/integrator.opts.gamma)
    end
  else #Not adaptive
    t += dt

    @pack_integrator
    if !(typeof(integrator.opts.callback)<:Void)
      T = integrator.opts.callback(cache,T,Ts,integrator)
    else
      ode_savevalues!(integrator)
    end
    @unpack_integrator
    dt *= integrator.dt_mod

    if isfsal(integrator.alg)
      if integrator.reeval_fsal || (typeof(integrator.alg)<:DP8 && !integrator.opts.calck) || typeof(integrator.alg)<:Union{Rosenbrock23,Rosenbrock32}
        # Under these condtions, these algorithms are not FSAL anymore
        if uType <: AbstractArray
          f(t,u,fsalfirst)
        else
          fsalfirst = f(t,u)
        end
        integrator.reeval_fsal = false
      else
        if uType <: AbstractArray
          recursivecopy!(fsalfirst,fsallast)
        else
          fsalfirst = fsallast
        end
      end
    end

    if integrator.calcprevs
      integrator.tprev = t
      if !isspecialdense(integrator.alg) && integrator.opts.calck
        if ksEltype <: AbstractArray && !isspecialdense(integrator.alg)
          recursivecopy!(integrator.kprev,k)
        else
          integrator.kprev = k
        end
      end
    end
  end
  if integrator.opts.progress && integrator.iter%integrator.opts.progress_steps==0
    Juno.msg(prog,integrator.opts.progress_message(dt,t,u))
    Juno.progress(prog,t/Tfinal)
  end
end

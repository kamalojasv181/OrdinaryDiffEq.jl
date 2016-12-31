function ode_solve{uType<:Number,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O}(integrator::ODEIntegrator{Euler,uType,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O})
  @ode_preamble
  fsalfirst = f(t,u) # For the interpolation, needs k at the updated point
  @inbounds for T in Ts
    while integrator.tdir*t < integrator.tdir*T
      @ode_loopheader
      k = fsalfirst
      utmp = muladd(dt,k,u)
      k = f(t+dt,utmp) # For the interpolation, needs k at the updated point
      fsallast = k
      @ode_loopfooter
    end
  end
  ode_postamble!(integrator)
  nothing
end

function ode_solve{uType<:AbstractArray,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O}(integrator::ODEIntegrator{Euler,uType,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O})
  @ode_preamble
  uidx = eachindex(u)
  cache = alg_cache(alg,u,rate_prototype,uEltypeNoUnits,integrator.uprev,integrator.kprev)
  @unpack k,fsalfirst = cache
  fsallast = k
  f(t,u,fsalfirst) # For the interpolation, needs k at the updated point
  @inbounds for T in Ts
      while integrator.tdir*t < integrator.tdir*T
      @ode_loopheader
      for i in uidx
        utmp[i] = muladd(dt,fsalfirst[i],u[i])
      end
      f(t+dt,utmp,fsallast) # For the interpolation, needs k at the updated point
      @ode_loopfooter
    end
  end
  ode_postamble!(integrator)
  nothing
end

function ode_solve{uType<:Number,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O}(integrator::ODEIntegrator{Midpoint,uType,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O})
  @ode_preamble
  halfdt::tType = dt/2
  local du::rateType
  fsalfirst = f(t,u)
  @inbounds for T in Ts
    while integrator.tdir*t < integrator.tdir*T
      @ode_loopheader
      k = fsalfirst
      k = f(t+halfdt,u+halfdt*k)
      utmp = u + dt*k
      fsallast = f(t+dt,utmp) # For interpolation, then FSAL'd
      @ode_loopfooter
    end
  end
  ode_postamble!(integrator)
  nothing
end

function ode_solve{uType<:AbstractArray,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O}(integrator::ODEIntegrator{Midpoint,uType,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O})
  @ode_preamble
  halfdt::tType = dt/2
  uidx = eachindex(u)
  if integrator.opts.calck # Not initialized if not dense
    if integrator.calcprevs
      integrator.kprev = similar(rate_prototype)
    end
  end

  cache = alg_cache(alg,u,rate_prototype,uEltypeNoUnits,integrator.uprev,integrator.kprev)
  @unpack k,du,utilde,fsalfirst = cache
  fsallast = k
  f(t,u,fsalfirst) # FSAL for interpolation
  @inbounds for T in Ts
      while integrator.tdir*t < integrator.tdir*T
      @ode_loopheader
      for i in uidx
        utilde[i] = muladd(halfdt,fsalfirst[i],u[i])
      end
      f(t+halfdt,utilde,du)
      for i in uidx
        utmp[i] = muladd(dt,du[i],u[i])
      end
      f(t+dt,utmp,k)
      @ode_loopfooter
    end
  end
  ode_postamble!(integrator)
  nothing
end

function ode_solve{uType<:Number,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O}(integrator::ODEIntegrator{RK4,uType,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O})
  @ode_preamble
  halfdt::tType = dt/2
  local k₁::rateType
  local k₂::rateType
  local k₃::rateType
  local k₄::rateType
  local ttmp::tType
  fsalfirst = f(t,u)
  @inbounds for T in Ts
      while integrator.tdir*t < integrator.tdir*T
      @ode_loopheader
      k₁=fsalfirst
      ttmp = t+halfdt
      k₂ = f(ttmp,muladd(halfdt,k₁,u))
      k₃ = f(ttmp,muladd(halfdt,k₂,u))
      k₄ = f(t+dt,muladd(dt,k₃,u))
      utmp = muladd(dt/6,muladd(2,(k₂ + k₃),k₁+k₄),u)
      k = f(t+dt,utmp)
      fsallast = k
      @ode_loopfooter
    end
  end
  ode_postamble!(integrator)
  nothing
end

function ode_solve{uType<:AbstractArray,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O}(integrator::ODEIntegrator{RK4,uType,tType,tTypeNoUnits,ksEltype,SolType,rateType,F,ECType,O})
  @ode_preamble
  halfdt::tType = dt/2

  if integrator.calcprevs
    integrator.kprev = similar(rate_prototype)
  end

  uidx = eachindex(u)

  cache = alg_cache(alg,u,rate_prototype,uEltypeNoUnits,integrator.uprev,integrator.kprev)
  @unpack tmp,k₁,k₂,k₃,k₄,k = cache
  fsalfirst = k₁
  fsallast = k
  f(t,u,k₁) # pre-start FSAL
  @inbounds for T in Ts
    while integrator.tdir*t < integrator.tdir*T
      @ode_loopheader
      ttmp = t+halfdt
      for i in uidx
        tmp[i] = muladd(halfdt,k₁[i],u[i])
      end
      f(ttmp,tmp,k₂)
      for i in uidx
        tmp[i] = muladd(halfdt,k₂[i],u[i])
      end
      f(ttmp,tmp,k₃)
      for i in uidx
        tmp[i] = muladd(dt,k₃[i],u[i])
      end
      f(t+dt,tmp,k₄)
      for i in uidx
        utmp[i] = muladd(dt/6,muladd(2,(k₂[i] + k₃[i]),k₁[i] + k₄[i]),u[i])
      end
      f(t+dt,utmp,k)
      @ode_loopfooter
    end
  end
  ode_postamble!(integrator)
  nothing
end

struct IRKN3ConstantCache{T,T2} <: OrdinaryDiffEqConstantCache
  bconst1::T
  bconst2::T
  c1::T2
  a21::T
  b1::T
  b2::T
  bbar1::T
  bbar2::T
end

Base.@pure function IRKN3ConstantCache{T<:CompiledFloats,T2<:CompiledFloats}(::Type{T},::Type{T2})
  bconst1 = T(1.5)
  bconst2 = T(-0.5)
  c1 = T2(0.5)
  a21 = T(0.125)
  b1 = T(0.6666666666666666)
  b2 = T(0.8333333333333334)
  bbar1 = T(0.3333333333333333)
  bbar2 = T(0.4166666666666667)
  IRKN3ConstantCache(bconst1,bconst2,c1,a21,b1,b2,bbar1,bbar2)
end

function IRKN3ConstantCache(T::Type,T2::Type)
  bconst1 = T(3//2)
  bconst2 = T(-1//2)
  c1      = T2(1//2)
  a21     = T(1//8)
  b1      = T(2//3)
  b2      = T(5//6)
  bbar1   = T(1//3)
  bbar2   = T(5//12)
  IRKN3ConstantCache(bconst1,bconst2,c1,a21,b1,b2,bbar1,bbar2)
end

struct IRKN4ConstantCache{T,T2} <: OrdinaryDiffEqConstantCache
  bconst1::T
  bconst2::T
  c1::T2
  c2::T2
  a21::T
  # a31::T
  a32::T
  b1::T
  b2::T
  b3::T
  bbar1::T
  bbar2::T
  bbar3::T
end

Base.@pure function IRKN4ConstantCache{T<:CompiledFloats,T2<:CompiledFloats}(::Type{T},::Type{T2})
  bconst1 = T(1.5)
  bconst2 = T(-0.5)
  c1      = T2(0.25)
  c2      = T2(0.75)
  a21     = T(0.03125)
  # a31     = T(0)
  a32     = T(0.28125)
  b1      = T(1.0555555555555556)
  b2      = T(-0.16666666666666666)
  b3      = T(0.6111111111111112)
  bbar1   = T(-0.05555555555555555)
  bbar2   = T(0.2916666666666667)
  bbar3   = T(0.125)
  IRKN4ConstantCache(bconst1,bconst2,c1,c2,a21,a32,b1,b2,b3,bbar1,bbar2,bbar3)
end

function IRKN4ConstantCache(T::Type,T2::Type)
  bconst1 = T(3//2)
  bconst2 = T(-1//2)
  c1      = T2(1//4)
  c2      = T2(3//4)
  a21     = T(1//32)
  # a31     = T(0)
  a32     = T(9//32)
  b1      = T(19//18)
  b2      = T(-1//6)
  b3      = T(11//18)
  bbar1   = T(-1//18)
  bbar2   = T(7//24)
  bbar3   = T(1//8)
  IRKN4ConstantCache(bconst1,bconst2,c1,c2,a21,a32,b1,b2,b3,bbar1,bbar2,bbar3)
end

struct Nystrom5VelocityIndependentConstantCache{T,T2} <: OrdinaryDiffEqConstantCache
  c1::T2
  c2::T2
  a21::T
  a31::T
  a32::T
  a41::T
  a42::T
  a43::T
  bbar1::T
  bbar2::T
  bbar3::T
  b1::T
  b2::T
  b3::T
  b4::T
end

function Nystrom5VelocityIndependentConstantCache{T<:CompiledFloats,T2<:CompiledFloats}(::Type{T},::Type{T2})
  c1    = T2(0.2)
  c2    = T2(0.6666666666666666)
  # c3    = T2(1)
  a21   = T(0.02)
  a31   = T(-0.037037037037037035)
  a32   = T(0.25925925925925924)
  a41   = T(0.3)
  a42   = T(-0.05714285714285714)
  a43   = T(0.2571428571428571)
  bbar1 = T(0.041666666666666664)
  bbar2 = T(0.2976190476190476)
  bbar3 = T(0.16071428571428573)
  b1    = bbar1
  b2    = T(0.37202380952380953)
  b3    = T(0.48214285714285715)
  b4    = T(0.10416666666666667)
  Nystrom5VelocityIndependentConstantCache(c1, c2, a21, a31, a32, a41, a42, a43, bbar1, bbar2, bbar3, b1, b2, b3, b4)
end

function Nystrom5VelocityIndependentConstantCache(T::Type,T2::Type)
  c1    = T2(1//5)
  c2    = T2(2//3)
  # c3    = T2(1)
  a21   = T(1//50)
  a31   = T(-1//27)
  a32   = T(7//27)
  a41   = T(3//10)
  a42   = T(-2//35)
  a43   = T(9//35)
  bbar1 = T(14//336)
  bbar2 = T(100//336)
  bbar3 = T(54//336)
  b1    = bbar1
  b2    = T(125//336)
  b3    = T(162//336)
  b4    = T(35//336)
  Nystrom5VelocityIndependentConstantCache(c1, c2, a21, a31, a32, a41, a42, a43, bbar1, bbar2, bbar3, b1, b2, b3, b4)
end

struct DPRKN6ConstantCache{T,T2} <: OrdinaryDiffEqConstantCache
  c1::T2
  c2::T2
  c3::T2
  c4::T2
  c5::T2
  a21::T
  a31::T
  a32::T
  a41::T
  a42::T
  a43::T
  a51::T
  a52::T
  a53::T
  a54::T
  a61::T
  # a62::T
  a63::T
  a64::T
  a65::T
  b1::T
  # b2::T
  b3::T
  b4::T
  b5::T
  # b6::T
  bp1::T # bp denotes bprime
  # bp2::T
  bp3::T
  bp4::T
  bp5::T
  bp6::T
  btilde1::T
  btilde2::T
  btilde3::T
  btilde4::T
  btilde5::T
  # btilde6::T
  bptilde1::T
  # bptilde2::T
  bptilde3::T
  bptilde4::T
  bptilde5::T
  bptilde6::T
end

Base.@pure function DPRKN6ConstantCache{T<:CompiledFloats,T2<:CompiledFloats}(::Type{T},::Type{T2})
  c1 = T2(0.12929590313670442)
  c2 = T2(0.25859180627340883)
  c3 = T2(0.67029708261548)
  c4 = T2(0.9)
  c5 = T2(1.0)
  a21 = T(0.008358715283968025)
  a31 = T(0.011144953711957367)
  a32 = T(0.022289907423914734)
  a41 = T(0.1454747428010918)
  a42 = T(-0.22986064052264749)
  a43 = T(0.3090349872029675)
  a51 = T(-0.20766826295078997)
  a52 = T(0.6863667842925143)
  a53 = T(-0.19954927787234925)
  a54 = T(0.12585075653062489)
  a61 = T(0.07811016144349478)
  a63 = T(0.2882917411897668)
  a64 = T(0.12242553717457041)
  a65 = T(0.011172560192168035)
  b1 = T(0.07811016144349478)
  b3 = T(0.2882917411897668)
  b4 = T(0.12242553717457041)
  b5 = T(0.011172560192168035)
  bp1 = T(0.07811016144349478)
  bp3 = T(0.3888434787059826)
  bp4 = T(0.3713207579288423)
  bp5 = T(0.11172560192168035)
  bp6 = T(0.05)
  btilde1 = T(-0.9807490989269235)
  btilde2 = T(2.406751371924452)
  btilde3 = T(-1.559600370364267)
  btilde4 = T(0.12242553717457041)
  btilde5 = T(0.011172560192168035)
  bptilde1 = T(0.023504273504273504)
  bptilde3 = T(-0.07242330719764424)
  bptilde4 = T(0.17543989844952962)
  bptilde5 = T(-0.2765208647561589)
  bptilde6 = T(0.15)
  DPRKN6ConstantCache(c1, c2, c3, c4, c5, a21, a31, a32, a41, a42, a43, a51, a52, a53, a54, a61, a63, a64, a65, b1, b3, b4, b5, bp1, bp3, bp4, bp5, bp6, btilde1, btilde2, btilde3, btilde4, btilde5, bptilde1, bptilde3, bptilde4, bptilde5, bptilde6)
end

function DPRKN6ConstantCache(T::Type,T2::Type)
  R        = sqrt(big(8581))
  c1       = T2((209-R)/900)
  c2       = T2((209-R)/450)
  c3       = T2((209+R)/450)
  c4       = T2(9//10)
  c5       = T2(1)
  a21      = T((26131-209R)/81_0000)
  a31      = T((26131-209R)/60_7500)
  a32      = T((26131-209R)/30_3750)
  a41      = T((980403512254+7781688431R)/116944_6992_1875)
  a42      = T(-(126288_4486208+153854_81287R)/116944_6992_1875)
  a43      = T((7166_233_891_441+786_945_632_99R)/46_777_879_687_500)
  a51      = T(-9(329260+3181R)/2704_0000)
  a52      = T(27(35129+3331R)/1352_0000)
  a53      = T(-27(554358343+31040327R)/46406048_0000)
  a54      = T(153(8555_257-67973R)/274592_0000)
  a61      = T(329//4212)
  # a62      = T(0)
  a63      = T((8411_9543+366_727R)/4096_22616)
  a64      = T((8411_9543-366_727R)/4096_22616)
  a65      = T(200//17901)
  b1       = T(329//4212)
  # b2       = T(0)
  b3       = a63
  b4       = a64
  b5       = T(200//17901)
  # b6       = T(0)
  bp1      = b1
  # bp2      = b2
  bp3      = T((389225579+96856R)/10_2405_6540)
  bp4      = T((389225579-96856R)/10_2405_6540)
  bp5      = T(2000//17901)
  bp6      = T(1//20)
  btilde1  = T(329//4212 - (2701+23R)/4563)
  btilde2  = T((9829+131R)/9126)
  btilde3  = T((8411_9543+366_727R)/4096_22616 - 5(1798+17R)/9126)
  btilde4  = b4
  btilde5  = b5
  # btilde6  = T(0)
  bptilde1 = T(329//4212 - 115//2106)
  # btildep2 = T(0)
  bptilde3 = T((389225579+96856R)/10_2405_6540 - (8411_9543+366_727R)/2560_14135)
  bptilde4 = T((389225579-96856R)/10_2405_6540 - (8411_9543-366_727R)/2560_14135)
  bptilde5 = T(2000//17901 - 6950//17901)
  bptilde6 = T(1//20 + 1//10)
  DPRKN6ConstantCache(c1, c2, c3, c4, c5, a21, a31, a32, a41, a42, a43, a51, a52, a53, a54, a61, a63, a64, a65, b1, b3, b4, b5, bp1, bp3, bp4, bp5, bp6, btilde1, btilde2, btilde3, btilde4, btilde5, bptilde1, bptilde3, bptilde4, bptilde5, bptilde6)
end

struct DPRKN8ConstantCache{T,T2} <: OrdinaryDiffEqConstantCache
  c1::T2
  c2::T2
  c3::T2
  c4::T2
  c5::T2
  c6::T2
  c7::T2
  c8::T2
  a21::T
  a31::T
  a32::T
  a41::T
  a42::T
  a43::T
  a51::T
  a52::T
  a53::T
  a54::T
  a61::T
  a62::T
  a63::T
  a64::T
  a65::T
  a71::T
  a72::T
  a73::T
  a74::T
  a75::T
  a76::T
  a81::T
  a82::T
  a83::T
  a84::T
  a85::T
  a86::T
  a87::T
  a91::T
  # a92::T
  a93::T
  a94::T
  a95::T
  a96::T
  a97::T
  # a98::T
  b1::T
  # b2::T
  b3::T
  b4::T
  b5::T
  b6::T
  b7::T
  # b8::T
  # b9::T
  bp1::T
  # bp2::T
  bp3::T
  bp4::T
  bp5::T
  bp6::T
  bp7::T
  bp8::T
  # bp9::T
  btilde1::T
  # btilde2::T
  btilde3::T
  btilde4::T
  btilde5::T
  btilde6::T
  btilde7::T
  # btilde8::T
  # btilde9::T
  bptilde1::T
  # bptilde2::T
  bptilde3::T
  bptilde4::T
  bptilde5::T
  bptilde6::T
  bptilde7::T
  bptilde8::T
  bptilde9::T
end

function DPRKN8ConstantCache(T::Type,T2::Type)
  c1 = T2(1//20)
  c2 = T2(1//10)
  c3 = T2(3//10)
  c4 = T2(1//2)
  c5 = T2(7//10)
  c6 = T2(9//10)
  c7 = T2(1)
  c8 = T2(1)
  a21 = T(1//800)
  a31 = T(1//600)
  a32 = T(1//300)
  a41 = T(9//200)
  a42 = T(-9//100)
  a43 = T(9//100)
  a51 = T(-66701//197352)
  a52 = T(28325//32892)
  a53 = T(-2665//5482)
  a54 = T(2170//24669)
  a61 = T(2270_15747//30425_1000)
  a62 = T(-5489_7451//30425_100)
  a63 = T(12942_349//10141_700)
  a64 = T(-9499//304_251)
  a65 = T(539//9250)
  a71 = T(-11318_91597//9017_89000)
  a72 = T(4196_4921//1288_2700)
  a73 = T(-6663_147//3220_675)
  a74 = T(270_954//644_135)
  a75 = T(-108//5875)
  a76 = T(114//1645)
  a81 = T(138_369_59//3667458)
  a82 = T(-177_314_50//1833729)
  a83 = T(106_3919_505//15647_8208)
  a84 = T(-332_138_45//3911_9552)
  a85 = T(133_35//285_44)
  a86 = T(-705//14272)
  a87 = T(1645//57088)
  a91 = T(223//7938)
  # a92 = T(0)
  a93 = T(1175//8064)
  a94 = T(925//6048)
  a95 = T(41//448)
  a96 = T(925//14112)
  a97 = T(1175//72576)
  # a98 = T(0)
  b1 = T(223//7938)
  # b2 = T(0)
  b3 = T(1175//8064)
  b4 = T(925//6048)
  b5 = T(41//448)
  b6 = T(925//14112)
  b7 = T(1175//72576)
  # b8 = T(0)
  # b9 = T(0)
  bp1 = T(223//7938)
  # bp2 = T(0)
  bp3 = T(5875//36288)
  bp4 = T(4625//21168)
  bp5 = T(41//224)
  bp6 = T(4625//21168)
  bp7 = T(5875//36288)
  bp8 = T(223//7938)
  # bp9 = T(0)
  btilde1 = T(223//7938 - 7987_313//10994_1300)
  # btilde2 = T(0)
  btilde3 = T(1175//8064 - 1610_737//4467_4560)
  btilde4 = T(925//6048 - 10023_263//3350_5920)
  btilde5 = T(41//448 + 497_221//1240_9600)
  btilde6 = T(925//14112 - 1002_3263//7818_0480)
  btilde7 = T(1175//72576 - 1610_737//40207_1040)
  # btilde8 = T(0)
  # btilde9 = T(0)
  bptilde1 = T(223//7938 - 7987_313//10994_1300)
  # bptilde2 = T(0)
  bptilde3 = T(5875//36288 - 1610_737//4020_7104)
  bptilde4 = T(4625//21168 - 1002_3263//2345_4144)
  bptilde5 = T(41//224 + 497_221//620_4800)
  bptilde6 = T(4625//21168 - 1002_3263//2345_4144)
  bptilde7 = T(5875//36288 - 1610_737//40207_104)
  bptilde8 = T(223//7938 + 4251_941//5497_0650)
  bptilde9 = T(-3//20)
  DPRKN8ConstantCache(c1, c2, c3, c4, c5, c6, c7, c8, a21, a31, a32, a41, a42, a43, a51, a52, a53, a54, a61, a62, a63, a64, a65, a71, a72, a73, a74, a75, a76, a81, a82, a83, a84, a85, a86, a87, a91, a93, a94, a95, a96, a97, b1, b3, b4, b5, b6, b7, bp1, bp3, bp4, bp5, bp6, bp7, bp8, btilde1, btilde3, btilde4, btilde5, btilde6, btilde7, bptilde1, bptilde3, bptilde4, bptilde5, bptilde6, bptilde7, bptilde8, bptilde9)
end

Base.@pure function DPRKN8ConstantCache{T<:CompiledFloats,T2<:CompiledFloats}(::Type{T},::Type{T2})
  DPRKN8ConstantCache(
  T2(0.05),
  T2(0.1),
  T2(0.3),
  T2(0.5),
  T2(0.7),
  T2(0.9),
  T2(1.0),
  T2(1.0),
  T(0.00125),
  T(0.0016666666666666668),
  T(0.0033333333333333335),
  T(0.045),
  T(-0.09),
  T(0.09),
  T(-0.3379798532571243),
  T(0.8611516478170984),
  T(-0.48613644655235316),
  T(0.0879646519923791),
  T(0.7461462641043086),
  T(-1.804347430246737),
  T(1.2761518285888953),
  T(-0.031220932716737166),
  T(0.05827027027027027),
  T(-1.2551623461807584),
  T(3.257463187064823),
  T(-2.068866619575089),
  T(0.4206478455603251),
  T(-0.018382978723404254),
  T(0.06930091185410335),
  T(3.772901830095941),
  T(-9.669613121677195),
  T(6.7991544547851674),
  T(-0.8490343907823893),
  T(0.4671734865470852),
  T(-0.04939742152466368),
  T(0.028815162556053812),
  T(0.028092718568909044),
  T(0.1457093253968254),
  T(0.1529431216931217),
  T(0.09151785714285714),
  T(0.06554705215419501),
  T(0.01618992504409171),
  T(0.028092718568909044),
  T(0.1457093253968254),
  T(0.1529431216931217),
  T(0.09151785714285714),
  T(0.06554705215419501),
  T(0.01618992504409171),
  T(0.028092718568909044),
  T(0.1618992504409171),
  T(0.2184901738473167),
  T(0.18303571428571427),
  T(0.2184901738473167),
  T(0.1618992504409171),
  T(0.028092718568909044),
  T(-0.044557986852984274),
  T(0.10965442077101599),
  T(-0.14620589436135464),
  T(0.1315853049252192),
  T(-0.06265966901200913),
  T(0.012183824530112887),
  T(-0.044557986852984274),
  T(0.12183824530112887),
  T(-0.2088655633733638),
  T(0.2631706098504384),
  T(-0.2088655633733638),
  T(0.12183824530112887),
  T(0.10544201314701572),
  T(-0.15))
end

struct DPRKN12ConstantCache{T,T2} <: OrdinaryDiffEqConstantCache
  c1::T2
  c2::T2
  c3::T2
  c4::T2
  c5::T2
  c6::T2
  c7::T2
  c8::T2
  c9::T2
  c10::T2
  c11::T2
  c12::T2
  c13::T2
  c14::T2
  c15::T2
  c16::T2
  a21::T
  a31::T
  a32::T
  a41::T
  a42::T
  a43::T
  a51::T
  # a52::T
  a53::T
  a54::T
  a61::T
  # a62::T
  a63::T
  a64::T
  a65::T
  a71::T
  # a72::T
  a73::T
  a74::T
  a75::T
  a76::T
  a81::T
  # a82::T
  # a83::T
  a84::T
  a85::T
  a86::T
  a87::T
  a91::T
  # a92::T
  a93::T
  a94::T
  a95::T
  a96::T
  a97::T
  a98::T
  a101::T
  # a102::T
  a103::T
  a104::T
  a105::T
  a106::T
  a107::T
  a108::T
  a109::T
  a111::T
  # a112::T
  a113::T
  a114::T
  a115::T
  a116::T
  a117::T
  a118::T
  a119::T
  a1110::T
  a121::T
  # a122::T
  a123::T
  a124::T
  a125::T
  a126::T
  a127::T
  a128::T
  a129::T
  a1210::T
  a1211::T
  a131::T
  # a132::T
  a133::T
  a134::T
  a135::T
  a136::T
  a137::T
  a138::T
  a139::T
  a1310::T
  a1311::T
  a1312::T
  a141::T
  # a142::T
  a143::T
  a144::T
  a145::T
  a146::T
  a147::T
  a148::T
  a149::T
  a1410::T
  a1411::T
  a1412::T
  a1413::T
  a151::T
  # a152::T
  a153::T
  a154::T
  a155::T
  a156::T
  a157::T
  a158::T
  a159::T
  a1510::T
  a1511::T
  a1512::T
  a1513::T
  a1514::T
  a161::T
  # a162::T
  a163::T
  a164::T
  a165::T
  a166::T
  a167::T
  a168::T
  a169::T
  a1610::T
  a1611::T
  a1612::T
  a1613::T
  a1614::T
  a1615::T
  a171::T
  # a172::T
  a173::T
  a174::T
  a175::T
  a176::T
  a177::T
  a178::T
  a179::T
  a1710::T
  a1711::T
  a1712::T
  a1713::T
  a1714::T
  a1715::T
  # a1716::T
  b1::T
  # b2::T
  # b3::T
  # b4::T
  # b5::T
  # b6::T
  b7::T
  b8::T
  b9::T
  b10::T
  b11::T
  b12::T
  b13::T
  b14::T
  b15::T
  # b16::T
  # b17::T
  bp1::T
  # bp2::T
  # bp3::T
  # bp4::T
  # bp5::T
  # bp6::T
  bp7::T
  bp8::T
  bp9::T
  bp10::T
  bp11::T
  bp12::T
  bp13::T
  bp14::T
  bp15::T
  bp16::T
  bp17::T
  btilde1::T
  # btilde2::T
  # btilde3::T
  # btilde4::T
  # btilde5::T
  # btilde6::T
  btilde7::T
  btilde8::T
  btilde9::T
  btilde10::T
  btilde11::T
  btilde12::T
  btilde13::T
  btilde14::T
  btilde15::T
  # btilde16::T
  # btilde17::T
  bptilde1::T
  # bptilde2::T
  # bptilde3::T
  # bptilde4::T
  # bptilde5::T
  # bptilde6::T
  bptilde7::T
  bptilde8::T
  bptilde9::T
  bptilde10::T
  bptilde11::T
  bptilde12::T
  bptilde13::T
  bptilde14::T
  bptilde15::T
  bptilde16::T
  bptilde17::T
end

function DPRKN12ConstantCache(T::Type,T2::Type)
  c1 = T2(1//50)
  c2 = T2(1//25)
  c3 = T2(1//10)
  c4 = T2(2//15)
  c5 = T2(4//25)
  c6 = T2(1//20)
  c7 = T2(1//5)
  c8 = T2(1//4)
  c9 = T2(1//3)
  c10 = T2(1//2)
  c11 = T2(5//9)
  c12 = T2(3//4)
  c13 = T2(6//7)
  c14 = T2(8437//8926)
  c15 = T2(1)
  c16 = T2(1)
  a21 = T(1//5000)
  a31 = T(1//3750)
  a32 = T(1//1875)
  a41 = T(7//2400)
  a42 = T(-1//240)
  a43 = T(1//160)
  a51 = T(2//1215)
  # a52 = T(0)
  a53 = T(4//729)
  a54 = T(32//18225)
  a61 = T(152//78125)
  # a62 = T(0)
  a63 = T(1408//196875)
  a64 = T(2048//703125)
  a65 = T(432//546875)
  a71 = T(29//51200)
  # a72 = T(0)
  a73 = T(341//387072)
  a74 = T(-151//345600)
  a75 = T(243//716800)
  a76 = T(-11//110592)
  a81 = T(37//12000)
  # a82 = T(0)
  # a83 = T(0)
  a84 = T(2//1125)
  a85 = T(27//10000)
  a86 = T(5//3168)
  a87 = T(224//20625)
  a91 = T(100467472123373//27511470744477696)
  # a92 = T(0)
  a93 = T(101066550784375//25488568483854336)
  a94 = T(49478218404275//15475202293768704)
  a95 = T(21990175014231//2674726322379776)
  a96 = T(-3576386017671875//2723635603703291904)
  a97 = T(16163228153//1654104722787)
  a98 = T(38747524076705//10316801529179136)
  a101 = T(62178936641284701329//16772293867250014666848)
  # a102 = T(0)
  a103 = T(46108564356250//9072835168325103)
  a104 = T(1522561724950//1296119309760729)
  a105 = T(-45978886013453735443//2174186242050927827184)
  a106 = T(299403512366617849203125//4981371278573254356053856)
  a107 = T(15571226634087127616//774466927638876610083)
  a108 = T(-133736375367792139885//4717207650164066625051)
  a109 = T(7461389216//501451974639)
  a111 = T(501256914705531962342417557181//14270506505142656332600844507392)
  # a112 = T(0)
  a113 = T(-1143766215625//132752960853408)
  a114 = T(-6864570325//1185294293334)
  a115 = T(194348369382310456605879163404183//99893545535998594328205911551744)
  a116 = T(-94634958447010580589908066176109375//27549212808177898050085930321520256)
  a117 = T(-17006472665356285286219618514//155584463413110817059022733377)
  a118 = T(33530528814694461893884349656345//14270506505142656332600844507392)
  a119 = T(-13439782155791134368//17777268379678341919)
  a1110 = T(1441341768767571//13159456712985856)
  a121 = T(parse(BigInt, "105854110734231079069010159870911189747853")//parse(BigInt, "5156624149476760916008179453333467046288864"))
  # a122 = T(0)
  a123 = T(-144579793509250000//19842290513127000261)
  a124 = T(-101935644099967250//48188419817594143491)
  a125 = T(parse(BigInt, "1585474394319811696785932424388196965")//parse(BigInt, "1709257457318830856936350991091849456"))
  a126 = T(parse(BigInt, "-843499776333774172853009613469456309715703125")//parse(BigInt, "510505790798199330684809765880013237582597536"))
  a127 = T(parse(BigInt, "-15057703799298260121553794369056896088480")//parse(BigInt, "714327132646734138085088291809720015274157"))
  a128 = T(parse(BigInt, "1749840442221344572962864758990584360232600")//parse(BigInt, "1450300542040339007627300471250037606768743"))
  a129 = T(-11255775246405733991656178432768//27206626483067760480757659602193)
  a1210 = T(669010348769579696//7368057640845834597)
  a1211 = T(4598083098752//858563707934367)
  a131 = T(parse(BigInt, "-1639758773684715326849438048667467886824967397")//parse(BigInt, "11447568726280607813664651120965112496134881280"))
  # a132 = T(0)
  a133 = T(3942453384375//314673684985856)
  a134 = T(11737114158175//1719466921529856)
  a135 = T(-23710715033675876683332701739887457//4940189888325748664958546898558976)
  a136 = T(parse(BigInt, "498150575499633273684774666731162498301909124515625")//parse(BigInt, "87415924307623977386706008889913792042985180430336"))
  a137 = T(parse(BigInt, "64881557768202140428371179540010005713998551")//parse(BigInt, "85896810580242200654071863296887242202224768"))
  a138 = T(parse(BigInt, "-2336309182318568698279006266321563486172654055")//parse(BigInt, "18316109962048972501863441793544179993815810048"))
  a139 = T(-493399374030747471036018890494175//251658285736841065236836942273664)
  a1310 = T(418285003077108927126515545155//455369916679568501838710898688)
  a1311 = T(-15171723902781457//63532954684873728)
  a1312 = T(1501203688494867//9434957026426880)
  a141 = T(parse(BigInt, "34188549803371802849576690267872548602326398788953")//parse(BigInt, "42496542183406636759747616530102745233754251202880"))
  # a142 = T(0)
  a143 = T(-18971246281693750//1138830954584356089)
  a144 = T(-59230464334542700//2765732318276293359)
  a145 = T(parse(BigInt, "5147939981309774383134903239728881770043")//parse(BigInt, "305929030949718561059100251282184099064"))
  a146 = T(parse(BigInt, "-362572021355026772337065830211467821556305840522907812")//parse(BigInt, "324512095420929759624784749347170583153994213035432256"))
  a147 = T(parse(BigInt, "-60305503318319653518547439098565661266182518307816")//parse(BigInt, "17856872599361492097414471889911176856851308259643"))
  a148 = T(parse(BigInt, "-1036461878759982363277481306266144563833492657780645")//parse(BigInt, "67994467493450618815596186448164392374006801924608"))
  a149 = T(parse(BigInt, "128398681100219349205889126776607047000")//parse(BigInt, "7473801441221286756994805323613917077"))
  a1410 = T(-49156374556350058671822606102117//9039888303968618912866414995904)
  a1411 = T(12253036339964386945//8828680926314891943)
  a1412 = T(-647188390508758231059//1092148506009694282240)
  a1413 = T(10915833599872//368729913707897)
  a151 = T(parse(BigInt, "-4939337286263213195547765488387521892799075623007291241961609516532")//parse(BigInt, "5408250052307451520718178852915698257207815452080611897685945761264"))
  # a152 = T(0)
  a153 = T(7588799849596321243074032368290625//parse(BigInt, "3147217749590114939838670370597819616"))
  a154 = T(16870665568420512953501332587233725//955405388268427749593882076788623812)
  a155 = T(parse(BigInt, "-80864251591837801485030858227147601466956843757908779606")//parse(BigInt, "54447992506702009927986632715967769032585338753056786562"))
  a156 = T(parse(BigInt, "4610328329649866588704236006423149172472141907645890762410296050212")//parse(BigInt, "2135428689710103309390449198881479603148467934048051598947383737508"))
  a157 = T(parse(BigInt, "4159963831215576225909381034291748993887819834160487158570788681")//parse(BigInt, "1040533184037697645660563795162185415624171583014576682740416336"))
  a158 = T(parse(BigInt, "7381392142124351279433801934148706553542137071890521365664606664449580")//parse(BigInt, "259596002510757672994472584939953516345975141699869371088925396540699"))
  a159 = T(parse(BigInt, "-333683433458405281346882867597135977469443722954786270692")//parse(BigInt, "132102862435303266640535426836147775872819092781208127980"))
  a1510 = T(parse(BigInt, "426619379967412086875039012957475466130081426048213491790")//parse(BigInt, "55162410119399855550108207148248549410926885937244965785"))
  a1511 = T(parse(BigInt, "-630755628691078947314733435975762542732598947")//parse(BigInt, "333503232300511886435069380727586592765317456"))
  a1512 = T(parse(BigInt, "1522350657470125698997653827133798314909646891")//parse(BigInt, "1520094067152619944607524353149267399623188480"))
  a1513 = T(305575414262755427083262606101825880//parse(BigInt, "65839748482572312891297405431209259829"))
  a1514 = T(parse(BigInt, "256624643108055110568255672032710477795")//parse(BigInt, "22874609758516552135947898572671559986304"))
  a161 = T(parse(BigInt, "-571597862947184314270186718640978947715678864684269066846")//parse(BigInt, "2077055064880303907616135969012720011907767004397744786340"))
  # a162 = T(0)
  a163 = T(66981514290625//1829501741761029)
  a164 = T(43495576635800//4443075658562499)
  a165 = T(-127865248353371207265315478623656127//10401415428935853634424440540325344)
  a166 = T(parse(BigInt, "1316565142658075739557231574080234814338066993483960326560")//parse(BigInt, "92668695535091962564795912774190176478892159517481612467"))
  a167 = T(parse(BigInt, "3881494143728609118531066904799685950051960514138645179820")//parse(BigInt, "2446349095978358868919950548516272963929118212742344026549"))
  a168 = T(parse(BigInt, "162922667049680755852592453758428194006198229544701786842910")//parse(BigInt, "66288722243155885736983218667976563740242178853010092663614"))
  a169 = T(parse(BigInt, "-43986024977384568043684084266385512680544563954")//parse(BigInt, "4922783599524658241955780540171948284522386185"))
  a1610 = T(parse(BigInt, "285912200202585226675651763671663063668290787")//parse(BigInt, "65371192072964016939690070594254881767827200"))
  a1611 = T(-6776815256667778089672518929//3693654613173093729492918708)
  a1612 = T(398946554885847045598775476868169//344154261237450078839899047372800)
  a1613 = T(-76630698033396272//4432017119727044925)
  a1614 = T(28401702316003037//1469612686944417840)
  a1615 = T(66049942462586341419969330578128801//parse(BigInt, "12691068622536592094919763114637498325"))
  a171 = T(parse(BigInt, "83940754497395557520874219603241359529066454343054832302344735")//parse(BigInt, "64192596456995578553872477759926464976144474354415663868673233"))
  # a172 = T(0)
  a173 = T(892543892035485503125//51401651664490002607536)
  a174 = T(-12732238157949399705325//686579204375687891972088)
  a175 = T(parse(BigInt, "5290376174838819557032232941734928484252549")//parse(BigInt, "357179779572898187570048915214361602000384"))
  a176 = T(parse(BigInt, "26873229338017506937199991804717456666650215387938173031932210")//parse(BigInt, "2863980005760296740624015421425947092438943496681472214589916"))
  a177 = T(parse(BigInt, "-197649786681880330585741729796159873563741413724149351549277865")//parse(BigInt, "378029217824623393200881653405474359138017953416246216408422692"))
  a178 = T(parse(BigInt, "-100286075630483975704018828319990067604207336241794360144098685695")//parse(BigInt, "20486915674765670626893195919603679319429068544972409068469849579"))
  a179 = T(parse(BigInt, "87398661196965758104117684348440686081062878816711392590")//parse(BigInt, "2282122412587168891929052689609009868137678763277087160"))
  a1710 = T(parse(BigInt, "-7922242431969626895355493632206885458496418610471389")//parse(BigInt, "748272134517487495468365669337985635214015258726400"))
  a1711 = T(parse(BigInt, "2777643183645212014464950387658055285")//parse(BigInt, "1141545470045611737197667093465955392"))
  a1712 = T(parse(BigInt, "-1372659703515496442825084239977218110461")//parse(BigInt, "1313121960368535725613950174847107891200"))
  a1713 = T(6144417902699179309851023//85608793932459282773805825)
  a1714 = T(140294243355138853053241//64884622846351585391642880)
  a1715 = T(parse(BigInt, "168671028523891369934964082754523881107337")//parse(BigInt, "24062875279623260368388427013982199424119600"))
  # a1716 = T(0)
  b1 = T(63818747//5262156900)
  # b2 = T(0)
  # b3 = T(0)
  # b4 = T(0)
  # b5 = T(0)
  # b6 = T(0)
  b7 = T(22555300000000//261366897038247)
  b8 = T(1696514453125//6717619827072)
  b9 = T(-45359872//229764843)
  b10 = T(19174962087//94371046000)
  b11 = T(-19310468//929468925)
  b12 = T(16089185487681//146694672924800)
  b13 = T(1592709632//41841694125)
  b14 = T(52675701958271//4527711056573100)
  b15 = T(parse(BigInt, "12540904472870916741199505796420811396")//parse(BigInt, "2692319557780977037279406889319526430375"))
  # b16 = T(0)
  # b17 = T(0)
  bp1 = T(63818747//5262156900)
  # bp2 = T(0)
  # bp3 = T(0)
  # bp4 = T(0)
  # bp5 = T(0)
  # bp6 = T(0)
  bp7 = T(451106000000000//4965971043726693)
  bp8 = T(8482572265625//26870479308288)
  bp9 = T(-181439488//689294529)
  bp10 = T(57524886261//188742092000)
  bp11 = T(-38620936//929468925)
  bp12 = T(144802669389129//586778691699200)
  bp13 = T(6370838528//41841694125)
  bp14 = T(368729913707897//4527711056573100)
  bp15 = T(parse(BigInt, "111940113324845802831946788738852162520696")//parse(BigInt, "1316544263754897771229629968877248424453375"))
  bp16 = T(-113178587//12362232960)
  bp17 = T(1//40)

  btilde1 = T(63818747//5262156900 - 27121957//1594593000)
  # btilde2 = T(0)
  # btilde3 = T(0)
  # btilde4 = T(0)
  # btilde5 = T(0)
  # btilde6 = T(0)
  btilde7 = T(22555300000000//261366897038247 - 4006163300000//55441463008113)
  btilde8 = T(1696514453125//6717619827072 - 9466403125//25445529648)
  btilde9 = T(-45359872//229764843 + 163199648//406149975)
  btilde10 = T(19174962087//94371046000 - 23359833//69636250)
  btilde11 = T(-19310468//929468925 + 18491714//140828625)
  btilde12 = T(16089185487681//146694672924800 - 11052304606701//58344472186000)
  btilde13 = T(1592709632//41841694125 - 1191129152//44377554375)
  btilde14 = T(52675701958271//4527711056573100 - 2033811086741//124730332137000)
  btilde15 = T(parse(BigInt, "12540904472870916741199505796420811396")//parse(BigInt, "2692319557780977037279406889319526430375") - parse(BigInt, "3616943474975740389660406409450169802")//parse(BigInt, "951830146690244407118982233597812374375"))
  # btilde16 = T(0)
  # btilde17 = T(0)
  bptilde1 = T(63818747//5262156900 - 27121957//1594593000)
  # bptilde2 = T(0)
  # bptilde3 = T(0)
  # bptilde4 = T(0)
  # bptilde5 = T(0)
  # bptilde6 = T(0)
  bptilde7 = T(451106000000000//4965971043726693 - 4217014000000//55441463008113)
  bptilde8 = T(8482572265625//26870479308288 - 47332015625//101782118592)
  bptilde9 = T(-181439488//689294529 + 652798592//1218449925)
  bptilde10 = T(57524886261//188742092000 - 70079499//139272500)
  bptilde11 = T(-38620936//929468925 + 36983428//140828625)
  bptilde12 = T(144802669389129//586778691699200 - 99470741460309//233377888744000)
  bptilde13 = T(6370838528//41841694125 - 4764516608//44377554375)
  bptilde14 = T(368729913707897//4527711056573100 - 14236677607187//124730332137000)
  bptilde15 = T(parse(BigInt, "111940113324845802831946788738852162520696")//parse(BigInt, "1316544263754897771229629968877248424453375") - parse(BigInt, "198066487470143918516004831967805004004")//parse(BigInt, "2855490440070733221356946700793437123125"))
  bptilde16 = T(-113178587//12362232960 - 1//50)
  bptilde17 = T(1//40)
  DPRKN12ConstantCache(c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, a21, a31, a32, a41, a42, a43, a51, a53, a54, a61, a63, a64, a65, a71, a73, a74, a75, a76, a81, a84, a85, a86, a87, a91, a93, a94, a95, a96, a97, a98, a101, a103, a104, a105, a106, a107, a108, a109, a111, a113, a114, a115, a116, a117, a118, a119, a1110, a121, a123, a124, a125, a126, a127, a128, a129, a1210, a1211, a131, a133, a134, a135, a136, a137, a138, a139, a1310, a1311, a1312, a141, a143, a144, a145, a146, a147, a148, a149, a1410, a1411, a1412, a1413, a151, a153, a154, a155, a156, a157, a158, a159, a1510, a1511, a1512, a1513, a1514, a161, a163, a164, a165, a166, a167, a168, a169, a1610, a1611, a1612, a1613, a1614, a1615, a171, a173, a174, a175, a176, a177, a178, a179, a1710, a1711, a1712, a1713, a1714, a1715, b1, b7, b8, b9, b10, b11, b12, b13, b14, b15, bp1, bp7, bp8, bp9, bp10, bp11, bp12, bp13, bp14, bp15, bp16, bp17, btilde1, btilde7, btilde8, btilde9, btilde10, btilde11, btilde12, btilde13, btilde14, btilde15, bptilde1, bptilde7, bptilde8, bptilde9, bptilde10, bptilde11, bptilde12, bptilde13, bptilde14, bptilde15, bptilde16, bptilde17)
end

Base.@pure function DPRKN12ConstantCache{T<:CompiledFloats,T2<:CompiledFloats}(::Type{T},::Type{T2})
  DPRKN12ConstantCache(
  T2(2.0e-2),
  T2(4.0e-2),
  T2(1.0e-1),
  T2(1.33333333333333333333333333333e-1),
  T2(1.6e-1),
  T2(5.0e-2),
  T2(2.0e-1),
  T2(2.5e-1),
  T2(3.33333333333333333333333333333e-1),
  T2(5.0e-1),
  T2(5.55555555555555555555555555556e-1),
  T2(7.5e-1),
  T2(8.57142857142857142857142857143e-1),
  T2(9.45216222272014340129957427739e-1),
  T2(1.0e0),
  T2(1.0e0),
  T(2.0e-4),
  T(2.66666666666666666666666666667e-4),
  T(5.33333333333333333333333333333e-4),
  T(2.91666666666666666666666666667e-3),
  T(-4.16666666666666666666666666667e-3),
  T(6.25e-3),
  T(1.64609053497942386831275720165e-3),
  T(5.48696844993141289437585733882e-3),
  T(1.75582990397805212620027434842e-3),
  T(1.9456e-3),
  T(7.15174603174603174603174603175e-3),
  T(2.91271111111111111111111111111e-3),
  T(7.89942857142857142857142857143e-4),
  T(5.6640625e-4),
  T(8.80973048941798941798941798942e-4),
  T(-4.36921296296296296296296296296e-4),
  T(3.39006696428571428571428571429e-4),
  T(-9.94646990740740740740740740741e-5),
  T(3.08333333333333333333333333333e-3),
  T(1.77777777777777777777777777778e-3),
  T(2.7e-3),
  T(1.57828282828282828282828282828e-3),
  T(1.08606060606060606060606060606e-2),
  T(3.65183937480112971375119150338e-3),
  T(3.96517171407234306617557289807e-3),
  T(3.19725826293062822350093426091e-3),
  T(8.22146730685543536968701883401e-3),
  T(-1.31309269595723798362013884863e-3),
  T(9.77158696806486781562609494147e-3),
  T(3.75576906923283379487932641079e-3),
  T(3.70724106871850081019565530521e-3),
  T(5.08204585455528598076108163479e-3),
  T(1.17470800217541204473569104943e-3),
  T(-2.11476299151269914996229766362e-2),
  T(6.01046369810788081222573525136e-2),
  T(2.01057347685061881846748708777e-2),
  T(-2.83507501229335808430366774368e-2),
  T(1.48795689185819327555905582479e-2),
  T(3.51253765607334415311308293052e-2),
  T(-8.61574919513847910340576078545e-3),
  T(-5.79144805100791652167632252471e-3),
  T(1.94555482378261584239438810411e0),
  T(-3.43512386745651359636787167574e0),
  T(-1.09307011074752217583892572001e-1),
  T(2.3496383118995166394320161088e0),
  T(-7.56009408687022978027190729778e-1),
  T(1.09528972221569264246502018618e-1),
  T(2.05277925374824966509720571672e-2),
  T(-7.28644676448017991778247943149e-3),
  T(-2.11535560796184024069259562549e-3),
  T(9.27580796872352224256768033235e-1),
  T(-1.65228248442573667907302673325e0),
  T(-2.10795630056865698191914366913e-2),
  T(1.20653643262078715447708832536e0),
  T(-4.13714477001066141324662463645e-1),
  T(9.07987398280965375956795739516e-2),
  T(5.35555260053398504916870658215e-3),
  T(-1.43240788755455150458921091632e-1),
  T(1.25287037730918172778464480231e-2),
  T(6.82601916396982712868112411737e-3),
  T(-4.79955539557438726550216254291e0),
  T(5.69862504395194143379169794156e0),
  T(7.55343036952364522249444028716e-1),
  T(-1.27554878582810837175400796542e-1),
  T(-1.96059260511173843289133255423e0),
  T(9.18560905663526240976234285341e-1),
  T(-2.38800855052844310534827013402e-1),
  T(1.59110813572342155138740170963e-1),
  T(8.04501920552048948697230778134e-1),
  T(-1.66585270670112451778516268261e-2),
  T(-2.1415834042629734811731437191e-2),
  T(1.68272359289624658702009353564e1),
  T(-1.11728353571760979267882984241e1),
  T(-3.37715929722632374148856475521e0),
  T(-1.52433266553608456461817682939e1),
  T(1.71798357382154165620247684026e1),
  T(-5.43771923982399464535413738556e0),
  T(1.38786716183646557551256778839e0),
  T(-5.92582773265281165347677029181e-1),
  T(2.96038731712973527961592794552e-2),
  T(-9.13296766697358082096250482648e-1),
  T(2.41127257578051783924489946102e-3),
  T(1.76581226938617419820698839226e-2),
  T(-1.48516497797203838246128557088e1),
  T(2.15897086700457560030782161561e0),
  T(3.99791558311787990115282754337e0),
  T(2.84341518002322318984542514988e1),
  T(-2.52593643549415984378843352235e1),
  T(7.7338785423622373655340014114e0),
  T(-1.8913028948478674610382580129e0),
  T(1.00148450702247178036685959248e0),
  T(4.64119959910905190510518247052e-3),
  T(1.12187550221489570339750499063e-2),
  T(-2.75196297205593938206065227039e-1),
  T(3.66118887791549201342293285553e-2),
  T(9.7895196882315626246509967162e-3),
  T(-1.2293062345886210304214726509e1),
  T(1.42072264539379026942929665966e1),
  T(1.58664769067895368322481964272e0),
  T(2.45777353275959454390324346975e0),
  T(-8.93519369440327190552259086374e0),
  T(4.37367273161340694839327077512e0),
  T(-1.83471817654494916304344410264e0),
  T(1.15920852890614912078083198373e0),
  T(-1.72902531653839221518003422953e-2),
  T(1.93259779044607666727649875324e-2),
  T(5.20444293755499311184926401526e-3),
  T(1.30763918474040575879994562983e0),
  T(1.73641091897458418670879991296e-2),
  T(-1.8544456454265795024362115588e-2),
  T(1.48115220328677268968478356223e1),
  T(9.38317630848247090787922177126e0),
  T(-5.2284261999445422541474024553e0),
  T(-4.89512805258476508040093482743e1),
  T(3.82970960343379225625583875836e1),
  T(-1.05873813369759797091619037505e1),
  T(2.43323043762262763585119618787e0),
  T(-1.04534060425754442848652456513e0),
  T(7.17732095086725945198184857508e-2),
  T(2.16221097080827826905505320027e-3),
  T(7.00959575960251423699282781988e-3),
  T(0.012127868517185414),
  T(0.08629746251568875),
  T(0.2525469581187147),
  T(-0.1974186799326823),
  T(0.2031869190789726),
  T(-0.020775808077714918),
  T(0.10967804874502014),
  T(0.038065132526466504),
  T(0.01163406880432423),
  T(0.0046580297040248785),
  T(0.012127868517185414),
  T(0.09083943422704079),
  T(0.3156836976483934),
  T(-0.2632249065769097),
  T(0.3047803786184589),
  T(-0.041551616155429835),
  T(0.2467756096762953),
  T(0.15226053010586602),
  T(0.08143848163026961),
  T(0.08502571193890811),
  T(-0.009155189630077963),
  T(0.025),
  T(-0.004880833389821577),
  T(0.014038126584857338),
  T(-0.11947921920803832),
  T(0.20440246507662121),
  T(-0.1322681492223791),
  T(0.11053069299761689),
  T(-0.07975385787102851),
  T(0.011224330486437457),
  T(-0.004671596801593694),
  T(0.0008580413473282841),
  T(-0.004880833389821577),
  T(0.014776975352481408),
  T(-0.1493490240100479),
  T(0.2725366201021616),
  T(-0.19840222383356862),
  T(0.22106138599523378),
  T(-0.17944618020981415),
  T(0.04489732194574983),
  T(-0.03270117761115586),
  T(0.015662325288859434),
  T(-0.029155189630077964),
  T(0.025))
end


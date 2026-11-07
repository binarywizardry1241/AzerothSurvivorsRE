145979234: 0f28c1 movaps xmm0, xmm1
145979237: f30f590521058b01 mulss xmm0, dword ptr [rip + 0x18b0521]
14597923f: 0f28d6 movaps xmm2, xmm6
145979242: f3410fc296c801000001 cmpltss xmm2, dword ptr [r14 + 0x1c8]
14597924c: 0f28da movaps xmm3, xmm2
14597924f: 0f55d9 andnps xmm3, xmm1
145979252: 0f54d0 andps xmm2, xmm0
145979255: 0f56d3 orps xmm2, xmm3

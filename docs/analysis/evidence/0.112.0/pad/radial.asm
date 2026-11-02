1401b84e6: 410f28d0 movaps xmm2, xmm8
1401b84ea: 0f14d0 unpcklps xmm2, xmm0
1401b84ed: 0f59d2 mulps xmm2, xmm2
1401b84f0: 440f14c7 unpcklps xmm8, xmm7
1401b84f4: 0f14f9 unpcklps xmm7, xmm1
1401b84f7: 0f59ff mulps xmm7, xmm7
1401b84fa: 0f58fa addps xmm7, xmm2
1401b84fd: 0f51d7 sqrtps xmm2, xmm7
1401b8500: f30f12de movsldup xmm3, xmm6
1401b8504: 0fc2d301 cmpltps xmm2, xmm3
1401b8508: 0f14d2 unpcklps xmm2, xmm2
1401b850b: 0f14c1 unpcklps xmm0, xmm1
1401b850e: 440f16c0 movlhps xmm8, xmm0
1401b8512: 410f55d0 andnps xmm2, xmm8
1401b8516: 0f1116 movups xmmword ptr [rsi], xmm2

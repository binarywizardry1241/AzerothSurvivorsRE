1401bc486: 410f28d0 movaps xmm2, xmm8
1401bc48a: 0f14d0 unpcklps xmm2, xmm0
1401bc48d: 0f59d2 mulps xmm2, xmm2
1401bc490: 440f14c7 unpcklps xmm8, xmm7
1401bc494: 0f14f9 unpcklps xmm7, xmm1
1401bc497: 0f59ff mulps xmm7, xmm7
1401bc49a: 0f58fa addps xmm7, xmm2
1401bc49d: 0f51d7 sqrtps xmm2, xmm7
1401bc4a0: f30f12de movsldup xmm3, xmm6
1401bc4a4: 0fc2d301 cmpltps xmm2, xmm3
1401bc4a8: 0f14d2 unpcklps xmm2, xmm2
1401bc4ab: 0f14c1 unpcklps xmm0, xmm1
1401bc4ae: 440f16c0 movlhps xmm8, xmm0
1401bc4b2: 410f55d0 andnps xmm2, xmm8
1401bc4b6: 0f1116 movups xmmword ptr [rsi], xmm2

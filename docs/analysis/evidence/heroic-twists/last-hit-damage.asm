0000000145bce5cc f3410f108638050000             movss xmm0, dword ptr [r14 + 0x538]
0000000145bce5d5 f3410f5cc0                     subss xmm0, xmm8
0000000145bce5da f3410f118638050000             movss dword ptr [r14 + 0x538], xmm0
0000000145bce5e3 450f57c9                       xorps xmm9, xmm9
0000000145bce5e7 f3450f5ac8                     cvtss2sd xmm9, xmm8
0000000145bce5ec f3410f11bea8050000             movss dword ptr [r14 + 0x5a8], xmm7

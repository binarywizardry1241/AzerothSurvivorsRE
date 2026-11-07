14597c973: f30f108f5c010000 movss xmm1, dword ptr [rdi + 0x15c]
14597c97b: 0f2ef1 ucomiss xmm6, xmm1
14597c97e: 762f jbe 0x14597c9af
14597c980: f30f109758010000 movss xmm2, dword ptr [rdi + 0x158]
14597c988: f30f5ed1 divss xmm2, xmm1
14597c98c: 0f57c9 xorps xmm1, xmm1
14597c98f: f30f5fca maxss xmm1, xmm2
14597c993: 410f28d0 movaps xmm2, xmm8
14597c997: f30f5dd1 minss xmm2, xmm1
14597c99b: f30f11b75c010000 movss dword ptr [rdi + 0x15c], xmm6
14597c9a3: f30f59f2 mulss xmm6, xmm2
14597c9a7: f30f11b758010000 movss dword ptr [rdi + 0x158], xmm6
14597c9af: f30f108f60010000 movss xmm1, dword ptr [rdi + 0x160]
14597c9b7: 0f28d1 movaps xmm2, xmm1
14597c9ba: f30f5fd0 maxss xmm2, xmm0
14597c9be: 0f28c2 movaps xmm0, xmm2
14597c9c1: f30fc2c203 cmpunordss xmm0, xmm2
14597c9c6: 0f28d8 movaps xmm3, xmm0
14597c9c9: 0f55da andnps xmm3, xmm2
14597c9cc: 0f54c1 andps xmm0, xmm1
14597c9cf: 0f56c3 orps xmm0, xmm3
14597c9d2: f30f118760010000 movss dword ptr [rdi + 0x160], xmm0

145952579: f3410f5c442464 subss xmm0, dword ptr [r12 + 0x64]
145952580: f3410f104c2450 movss xmm1, dword ptr [r12 + 0x50]
145952587: 0f28d1 movaps xmm2, xmm1
14595258a: f30f5fd0 maxss xmm2, xmm0
14595258e: 0f28c2 movaps xmm0, xmm2
145952591: f30fc2c203 cmpunordss xmm0, xmm2
145952596: 0f28d8 movaps xmm3, xmm0
145952599: 0f55da andnps xmm3, xmm2
14595259c: 0f54c1 andps xmm0, xmm1
14595259f: 0f56c3 orps xmm0, xmm3
1459525a2: 0f28c8 movaps xmm1, xmm0
1459525a5: f30f5dce minss xmm1, xmm6
1459525a9: 0f28d1 movaps xmm2, xmm1
1459525ac: f30fc2d103 cmpunordss xmm2, xmm1
1459525b1: 0f54c2 andps xmm0, xmm2
1459525b4: 0f55d1 andnps xmm2, xmm1
1459525b7: 0f56d0 orps xmm2, xmm0

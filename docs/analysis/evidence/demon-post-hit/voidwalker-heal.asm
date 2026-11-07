1459570f0 4d85c0 test r8, r8
1459570f3 0f85c0020000 jne 0x1459573b9
1459570f9 ba0a000000 mov edx, 0xa
1459570fe 488d0d83452b01 lea rcx, [rip + 0x12b4583]
145957105 e8c66c0300 call 0x14598ddd0
14595710a 4c8b4538 mov r8, qword ptr [rbp + 0x38]
14595710e 498b4810 mov rcx, qword ptr [r8 + 0x10]
145957112 4d8b4018 mov r8, qword ptr [r8 + 0x18]
145957116 f3440f108380040000 movss xmm8, dword ptr [rbx + 0x480]
14595711f f30f1093e8040000 movss xmm2, dword ptr [rbx + 0x4e8]
145957127 0f28ca movaps xmm1, xmm2
14595712a f3410f58cc addss xmm1, xmm12
14595712f 0f28d9 movaps xmm3, xmm1
145957132 f3410f5dd8 minss xmm3, xmm8
145957137 0f28c3 movaps xmm0, xmm3
14595713a f30fc2c303 cmpunordss xmm0, xmm3
14595713f 0f28e0 movaps xmm4, xmm0
145957142 0f55e3 andnps xmm4, xmm3
145957145 0f54c1 andps xmm0, xmm1
145957148 0f56c4 orps xmm0, xmm4
14595714b f30f1183e8040000 movss dword ptr [rbx + 0x4e8], xmm0
145957153 0f28c8 movaps xmm1, xmm0
145957156 f30f5cca subss xmm1, xmm2
14595715a 440f2ec9 ucomiss xmm9, xmm1
14595715e 7371 jae 0x1459571d1

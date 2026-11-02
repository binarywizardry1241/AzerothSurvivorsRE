14595056b: f3410f10456c movss xmm0, dword ptr [r13 + 0x6c]
145950571: 0f57d2 xorps xmm2, xmm2
145950574: 0f2ec2 ucomiss xmm0, xmm2
145950577: f30f10851c010000 movss xmm0, dword ptr [rbp + 0x11c]
14595057f: 0f8668080000 jbe 0x145950ded
145950585: 410f28f1 movaps xmm6, xmm9
145950589: f3410f5c7540 subss xmm6, dword ptr [r13 + 0x40]
14595058f: 450f28f2 movaps xmm14, xmm10
145950593: f3450f5c7544 subss xmm14, dword ptr [r13 + 0x44]
145950599: 0f28c6 movaps xmm0, xmm6
14595059c: 410f28ce movaps xmm1, xmm14
1459505a0: e88a9b2a00 call 0x145bfa12f
1459505a5: 0f2ef8 ucomiss xmm7, xmm0
1459505a8: 0f86b00a0000 jbe 0x14595105e
1459505ae: f3410f10454c movss xmm0, dword ptr [r13 + 0x4c]
1459505b4: e9b10a0000 jmp 0x14595106a

145971a85 0f2eca ucomiss xmm1, xmm2
145971a88 0f83c0000000 jae 0x145971b4e
145971a8e f30f109f340a0000 movss xmm3, dword ptr [rdi + 0xa34]
145971a96 f3430f5c9c2e8c010000 subss xmm3, dword ptr [r14 + r13 + 0x18c]
145971aa0 f30f5eda divss xmm3, xmm2
145971aa4 f30f5fcb maxss xmm1, xmm3
145971aa8 f30f1015f0b74200 movss xmm2, dword ptr [rip + 0x42b7f0]
145971ab0 f30f5dd1 minss xmm2, xmm1
145971ab4 f2430f108c2e74010000 movsd xmm1, qword ptr [r14 + r13 + 0x174]
145971abe f2430f109c2e80010000 movsd xmm3, qword ptr [r14 + r13 + 0x180]
145971ac8 0f5cd9 subps xmm3, xmm1
145971acb f3440f12ca movsldup xmm9, xmm2
145971ad0 440f59cb mulps xmm9, xmm3
145971ad4 440f58c9 addps xmm9, xmm1
145971ad8 f3430f108c2e7c010000 movss xmm1, dword ptr [r14 + r13 + 0x17c]
145971ae2 f3470f10942e88010000 movss xmm10, dword ptr [r14 + r13 + 0x188]
145971aec f3440f5cd1 subss xmm10, xmm1
145971af1 f3440f59d2 mulss xmm10, xmm2
145971af6 f3440f58d1 addss xmm10, xmm1
145971afb eb65 jmp 0x145971b62
145971b4e f2470f108c2e80010000 movsd xmm9, qword ptr [r14 + r13 + 0x180]
145971b58 f3470f10942e88010000 movss xmm10, dword ptr [r14 + r13 + 0x188]
145971b62 410f28c8 movaps xmm1, xmm8
145971b66 f30f5dc8 minss xmm1, xmm0
145971b6a 4f8b7c2e18 mov r15, qword ptr [r14 + r13 + 0x18]
145971b6f 4983ffff cmp r15, -1
145971b73 740b je 0x145971b80
145971b75 4b8b442e30 mov rax, qword ptr [r14 + r13 + 0x30]
145971b7a 448b6040 mov r12d, dword ptr [rax + 0x40]
145971b7e eb00 jmp 0x145971b80
145971b80 f30f5af9 cvtss2sd xmm7, xmm1
145971b84 f20f108708070000 movsd xmm0, qword ptr [rdi + 0x708]
145971b8c f20f58c7 addsd xmm0, xmm7
145971b90 f20f118708070000 movsd qword ptr [rdi + 0x708], xmm0

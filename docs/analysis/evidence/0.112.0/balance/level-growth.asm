1458f2c39: 8b86e0040000 mov eax, dword ptr [rsi + 0x4e0]
1458f2c3f: 0f57c0 xorps xmm0, xmm0
1458f2c42: f3480f2ac0 cvtsi2ss xmm0, rax
1458f2c47: f30f580519e74b00 addss xmm0, dword ptr [rip + 0x4be719]
1458f2c4f: f3440f102df8ed4f00 movss xmm13, dword ptr [rip + 0x4fedf8]
1458f2c58: f3440f1025f35b4c00 movss xmm12, dword ptr [rip + 0x4c5bf3]
1458f2c61: f3440f59e0 mulss xmm12, xmm0
1458f2c66: f30f100df2a54b00 movss xmm1, dword ptr [rip + 0x4ba5f2]
1458f2c6e: 0f294d50 movaps xmmword ptr [rbp + 0x50], xmm1
1458f2c72: f3440f58e1 addss xmm12, xmm1
1458f2c77: 488b7d20 mov rdi, qword ptr [rbp + 0x20]
1458f2c7b: f30f109f84000000 movss xmm3, dword ptr [rdi + 0x84]
1458f2c83: f3440f1015f8a74b00 movss xmm10, dword ptr [rip + 0x4ba7f8]
1458f2c8c: f3480f2cc8 cvttss2si rcx, xmm0
1458f2c91: 31c0 xor eax, eax
1458f2c93: 450f57c0 xorps xmm8, xmm8
1458f2c97: 410f2ec0 ucomiss xmm0, xmm8
1458f2c9b: 0f42c8 cmovb ecx, eax
1458f2c9e: f3440f59d0 mulss xmm10, xmm0
1458f2ca3: 440f28d8 movaps xmm11, xmm0
1458f2ca7: 0f2e05963e4c00 ucomiss xmm0, dword ptr [rip + 0x4c3e96]
1458f2cae: baffffffff mov edx, 0xffffffff
1458f2cb3: 0f46d1 cmovbe edx, ecx
1458f2cb6: f3440f5815bda74b00 addss xmm10, dword ptr [rip + 0x4ba7bd]
1458f2cbf: ffc2 inc edx
1458f2cc1: 41b889888888 mov r8d, 0x88888889
1458f2cc7: 4c0fafc2 imul r8, rdx
1458f2ccb: 49c1e823 shr r8, 0x23
1458f2ccf: 4183f803 cmp r8d, 3
1458f2cd3: b903000000 mov ecx, 3
1458f2cd8: 410f42c8 cmovb ecx, r8d

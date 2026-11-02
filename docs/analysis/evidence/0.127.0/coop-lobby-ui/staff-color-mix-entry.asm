0x144eaabf0: push rsi
0x144eaabf1: push rdi
0x144eaabf2: sub rsp, 0xa8
0x144eaabf9: movaps xmmword ptr [rsp + 0x90], xmm12
0x144eaac02: movaps xmmword ptr [rsp + 0x80], xmm11
0x144eaac0b: movaps xmmword ptr [rsp + 0x70], xmm10
0x144eaac11: movaps xmmword ptr [rsp + 0x60], xmm9
0x144eaac17: movaps xmmword ptr [rsp + 0x50], xmm8
0x144eaac1d: movaps xmmword ptr [rsp + 0x40], xmm7
0x144eaac22: movaps xmmword ptr [rsp + 0x30], xmm6
0x144eaac27: movaps xmm6, xmm3
0x144eaac2a: mov rsi, rcx
0x144eaac2d: mov edi, dword ptr [rdx]
0x144eaac2f: movups xmm8, xmmword ptr [rdx + 4]
0x144eaac34: movss xmm9, dword ptr [rip + 0x1388283]
0x144eaac3d: subss xmm9, xmm3
0x144eaac42: lea rax, [rip + 0x209cfe3]
0x144eaac49: movsxd rcx, dword ptr [rax + rdi*4]
0x144eaac4d: add rcx, rax
0x144eaac50: jmp rcx

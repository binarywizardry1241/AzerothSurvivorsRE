1458f2cdc: 488b9590000000 mov rdx, qword ptr [rbp + 0x90]
1458f2ce3: 4c8b4228 mov r8, qword ptr [rdx + 0x28]
1458f2ce7: 4d85c0 test r8, r8
1458f2cea: 0f84d2000000 je 0x1458f2dc2
1458f2cf0: 450f28fd movaps xmm15, xmm13
1458f2cf4: 488b5220 mov rdx, qword ptr [rdx + 0x20]
1458f2cf8: 4e8d04c2 lea r8, [rdx + r8*8]
1458f2cfc: f3440f102d4bed4f00 movss xmm13, dword ptr [rip + 0x4fed4b]
1458f2d05: f30f102d8be64b00 movss xmm5, dword ptr [rip + 0x4be68b]
1458f2d0d: 450f57c9 xorps xmm9, xmm9
1458f2d11: f30f103d47a54b00 movss xmm7, dword ptr [rip + 0x4ba547]
1458f2d19: 4c8d0d54933101 lea r9, [rip + 0x1319354]
1458f2d20: 0f28e7 movaps xmm4, xmm7
1458f2d23: 0f28cf movaps xmm1, xmm7
1458f2d26: 0f28c7 movaps xmm0, xmm7
1458f2d29: 0f57d2 xorps xmm2, xmm2
1458f2d2c: 0f295540 movaps xmmword ptr [rbp + 0x40], xmm2
1458f2d30: 440f28f7 movaps xmm14, xmm7
1458f2d34: 0f299590000000 movaps xmmword ptr [rbp + 0x90], xmm2
1458f2d3b: eb20 jmp 0x1458f2d5d
1458f2d3d: 0f28b590000000 movaps xmm6, xmmword ptr [rbp + 0x90]
1458f2d44: f30f58f2 addss xmm6, xmm2
1458f2d48: 0f29b590000000 movaps xmmword ptr [rbp + 0x90], xmm6
1458f2d4f: 90 nop
1458f2d50: 4883c208 add rdx, 8
1458f2d54: 4c39c2 cmp rdx, r8
1458f2d57: 0f849b000000 je 0x1458f2df8
1458f2d5d: 448b12 mov r10d, dword ptr [rdx]
1458f2d60: f30f105204 movss xmm2, dword ptr [rdx + 4]
1458f2d65: 4f631491 movsxd r10, dword ptr [r9 + r10*4]
1458f2d69: 4d01ca add r10, r9
1458f2d6c: 41ffe2 jmp r10
1458f2d6f: f30f58e2 addss xmm4, xmm2
1458f2d73: ebdb jmp 0x1458f2d50
1458f2d75: f30f58ea addss xmm5, xmm2
1458f2d79: ebd5 jmp 0x1458f2d50
1458f2d7b: f3440f58f2 addss xmm14, xmm2
1458f2d80: ebce jmp 0x1458f2d50
1458f2d82: f3440f58ca addss xmm9, xmm2
1458f2d87: ebc7 jmp 0x1458f2d50
1458f2d89: f30f58ca addss xmm1, xmm2
1458f2d8d: ebc1 jmp 0x1458f2d50
1458f2d8f: f30f58d7 addss xmm2, xmm7
1458f2d93: f3440f59ea mulss xmm13, xmm2
1458f2d98: ebb6 jmp 0x1458f2d50
1458f2d9a: f3440f58e2 addss xmm12, xmm2
1458f2d9f: ebaf jmp 0x1458f2d50
1458f2da1: f30f58da addss xmm3, xmm2
1458f2da5: eba9 jmp 0x1458f2d50
1458f2da7: f3440f58d2 addss xmm10, xmm2
1458f2dac: eba2 jmp 0x1458f2d50
1458f2dae: 0f287540 movaps xmm6, xmmword ptr [rbp + 0x40]
1458f2db2: f30f58f2 addss xmm6, xmm2
1458f2db6: 0f297540 movaps xmmword ptr [rbp + 0x40], xmm6
1458f2dba: eb94 jmp 0x1458f2d50
1458f2dbc: f30f58c2 addss xmm0, xmm2
1458f2dc0: eb8e jmp 0x1458f2d50
1458f2dc2: f30f102dcee54b00 movss xmm5, dword ptr [rip + 0x4be5ce]
1458f2dca: 0f57c0 xorps xmm0, xmm0
1458f2dcd: 0f298590000000 movaps xmmword ptr [rbp + 0x90], xmm0
1458f2dd4: f30f101584a44b00 movss xmm2, dword ptr [rip + 0x4ba484]
1458f2ddc: 440f28f2 movaps xmm14, xmm2
1458f2de0: 0f57c9 xorps xmm1, xmm1
1458f2de3: 0f294d40 movaps xmmword ptr [rbp + 0x40], xmm1
1458f2de7: 0f28c2 movaps xmm0, xmm2
1458f2dea: 450f28fd movaps xmm15, xmm13
1458f2dee: 0f28ca movaps xmm1, xmm2
1458f2df1: 450f57c9 xorps xmm9, xmm9
1458f2df5: 0f28e2 movaps xmm4, xmm2

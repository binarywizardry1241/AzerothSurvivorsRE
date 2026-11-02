1458f2e01: 488b9680030000 mov rdx, qword ptr [rsi + 0x380]
1458f2e08: 4885d2 test rdx, rdx
1458f2e0b: 7448 je 0x1458f2e55
1458f2e0d: 4c8b8678030000 mov r8, qword ptr [rsi + 0x378]
1458f2e14: 48c1e203 shl rdx, 3
1458f2e18: 31c0 xor eax, eax
1458f2e1a: f30f10153ea44b00 movss xmm2, dword ptr [rip + 0x4ba43e]
1458f2e22: 0f295550 movaps xmmword ptr [rbp + 0x50], xmm2
1458f2e26: f30f10353aa44b00 movss xmm6, dword ptr [rip + 0x4ba43a]
1458f2e2e: 450f57c0 xorps xmm8, xmm8
1458f2e32: 458b1400 mov r10d, dword ptr [r8 + rax]
1458f2e36: 4c8d0d67923101 lea r9, [rip + 0x1319267]
1458f2e3d: 4f631c91 movsxd r11, dword ptr [r9 + r10*4]
1458f2e41: 4d01cb add r11, r9
1458f2e44: 0f57d2 xorps xmm2, xmm2
1458f2e47: f30f1195a8000000 movss dword ptr [rbp + 0xa8], xmm2
1458f2e4f: 4531d2 xor r10d, r10d
1458f2e52: 41ffe3 jmp r11
1458f2e55: f30f10350ba44b00 movss xmm6, dword ptr [rip + 0x4ba40b]
1458f2e5d: 0f57d2 xorps xmm2, xmm2
1458f2e60: f30f1195a8000000 movss dword ptr [rbp + 0xa8], xmm2
1458f2e68: eb00 jmp 0x1458f2e6a

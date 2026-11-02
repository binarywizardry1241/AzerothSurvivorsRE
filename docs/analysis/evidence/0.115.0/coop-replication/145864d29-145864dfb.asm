0x145864d29: mov rcx, qword ptr [rbp + 0x2e8]
0x145864d30: movss xmm7, dword ptr [rcx + 0x28]
0x145864d35: lea rcx, [rip + 0x17c7740]
0x145864d3c: movsxd rax, dword ptr [rcx + rax*4]
0x145864d40: add rax, rcx
0x145864d43: jmp rax
0x145864d45: xorps xmm0, xmm0
0x145864d48: ucomiss xmm0, dword ptr [r12 + 0x4c]
0x145864d4e: jb 0x14586515f
0x145864d54: movss xmm1, dword ptr [r12 + 0x50]
0x145864d5b: ucomiss xmm1, xmm0
0x145864d5e: jbe 0x14586515f
0x145864d64: mov byte ptr [rbp + 0x326], 1
0x145864d6b: lea rsi, [rip + 0x17c5d9e]
0x145864d72: mov edi, 0xd
0x145864d77: mov edx, 0xd
0x145864d7c: mov rcx, rsi
0x145864d7f: call 0x1458dff90
0x145864d84: nop
0x145864d85: mov r15, rdx
0x145864d88: test rax, rax
0x145864d8b: cmovne rsi, rax
0x145864d8f: cmove r15, rdi
0x145864d93: mov rax, qword ptr [rbp + 0x2f0]
0x145864d9a: mulss xmm11, dword ptr [rax + 0x44]
0x145864da0: mulss xmm11, dword ptr [r12 + 0x50]
0x145864da7: mulss xmm7, xmm11
0x145864dac: movss xmm0, dword ptr [rip + 0x92ff84]
0x145864db4: ucomiss xmm0, xmm7
0x145864db7: jae 0x145864de7
0x145864db9: addss xmm7, dword ptr [rip + 0x17a7b33]
0x145864dc1: movss xmm11, dword ptr [rip + 0x67b5c2]
0x145864dca: divss xmm7, xmm11
0x145864dcf: movaps xmm0, xmm7
0x145864dd2: call 0x145d1475d
0x145864dd7: movaps xmm7, xmm0
0x145864dda: mulss xmm7, xmm11
0x145864ddf: addss xmm7, dword ptr [rip + 0x92ff51]
0x145864de7: mov byte ptr [rbp + 0x326], 1
0x145864dee: lea rdi, [rbp + 0x1d0]
0x145864df5: mov rcx, rdi
0x145864df8: movaps xmm1, xmm7

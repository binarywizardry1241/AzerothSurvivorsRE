0000000140241bd7: cmp qword ptr [rdx + 0x10], 0
0000000140241bdc: je 0x140241d29
0000000140241be2: lea rcx, [rbp + 0x90]
0000000140241be9: call 0x145bc5b50
0000000140241bee: cmp byte ptr [rdi], 1
0000000140241bf1: jne 0x140241c12
0000000140241bf3: mov eax, dword ptr [rdi + 1]
0000000140241bf6: mov ecx, dword ptr [rdi + 4]
0000000140241bf9: mov dword ptr [rbp + 0x5a3], ecx
0000000140241bff: mov dword ptr [rbp + 0x5a0], eax
0000000140241c05: mov rax, qword ptr [rdi + 8]
0000000140241c09: movzx ecx, byte ptr [rdi + 0x10]
0000000140241c0d: mov r8b, 1
0000000140241c10: jmp 0x140241c23
0000000140241c12: mov rax, qword ptr [rdi + 8]
0000000140241c16: lock inc qword ptr [rax]
0000000140241c1a: jle 0x140242583
0000000140241c20: xor r8d, r8d
0000000140241c23: lea rdx, [rbp + 0x348]
0000000140241c2a: mov r9, qword ptr [rbp + 0xa0]
0000000140241c31: mov qword ptr [rbp + 0x5c8], r9
0000000140241c38: movups xmm0, xmmword ptr [rbp + 0x90]
0000000140241c3f: movups xmmword ptr [rbp + 0x5b8], xmm0
0000000140241c46: movups xmm0, xmmword ptr [rip + 0x5bac0e7]
0000000140241c4d: movups xmmword ptr [rbp + 0x841], xmm0
0000000140241c54: mov dword ptr [rbp + 0x851], 0x3f800000
0000000140241c5e: mov qword ptr [rbp + 0x5d0], 0
0000000140241c69: mov qword ptr [rbp + 0x5d8], 4
0000000140241c74: mov qword ptr [rbp + 0x5e0], 0
0000000140241c7f: mov byte ptr [rbp + 0x5e8], r8b
0000000140241c86: mov r8d, dword ptr [rbp + 0x5a0]
0000000140241c8d: mov r9d, dword ptr [rbp + 0x5a3]
0000000140241c94: mov dword ptr [rbp + 0x5e9], r8d
0000000140241c9b: mov dword ptr [rbp + 0x5ec], r9d
0000000140241ca2: mov qword ptr [rbp + 0x5f0], rax
0000000140241ca9: mov qword ptr [rbp + 0x5f8], rcx
0000000140241cb0: mov dword ptr [rbp + 0x600], 0x41600000
0000000140241cba: mov word ptr [rbp + 0x604], 0x190
0000000140241cc3: mov byte ptr [rbp + 0x606], 1
0000000140241cca: mov rax, qword ptr [rbp + 0x84d]
0000000140241cd1: mov qword ptr [rbp + 0x614], rax
0000000140241cd8: movups xmm0, xmmword ptr [rbp + 0x840]
0000000140241cdf: movups xmmword ptr [rbp + 0x607], xmm0
0000000140241ce6: mov dword ptr [rbp + 0x62c], r13d
0000000140241ced: movdqu xmm0, xmmword ptr [rip + 0x5b9205f]
0000000140241cf5: movdqu xmmword ptr [rbp + 0x61c], xmm0
0000000140241cfd: movq qword ptr [rbp + 0x630], xmm13
0000000140241d06: mov word ptr [rbp + 0x638], 1
0000000140241d0f: mov qword ptr [rbp + 0x5b0], r14
0000000140241d16: lea rcx, [rbp + 0x90]
0000000140241d1d: lea r8, [rbp + 0x5b0]
0000000140241d24: call 0x140221c50
0000000140241d29: mov rax, qword ptr [rsi + 0x10]
0000000140241d2d: test rax, rax
0000000140241d30: je 0x140241d6e
0000000140241d32: mov rsi, qword ptr [rsi + 8]
0000000140241d36: shl rax, 3
0000000140241d3a: lea r14, [rax + rax*2]
0000000140241d3e: xor r15d, r15d
0000000140241d41: lea r12, [rbp + 0x340]
0000000140241d48: nop dword ptr [rax + rax]
0000000140241d50: mov r8, qword ptr [rsi + r15 + 8]
0000000140241d55: mov r9, qword ptr [rsi + r15 + 0x10]
0000000140241d5a: mov rcx, r12
0000000140241d5d: mov rdx, rdi
0000000140241d60: call 0x14013abb0
0000000140241d65: add r15, 0x18
0000000140241d69: cmp r14, r15
0000000140241d6c: jne 0x140241d50

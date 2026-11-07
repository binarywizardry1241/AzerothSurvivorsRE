00000001458b5cb2: 48837dc000                     cmp qword ptr [rbp - 0x40], 0
00000001458b5cb7: 7461                           je 0x1458b5d1a
00000001458b5cb9: e842c574fa                     call 0x140002200
00000001458b5cbe: b920000000                     mov ecx, 0x20
00000001458b5cc3: ba01000000                     mov edx, 1
00000001458b5cc8: e8f3c474fa                     call 0x1400021c0
00000001458b5ccd: 4885c0                         test rax, rax
00000001458b5cd0: 0f8450080000                   je 0x1458b6526
00000001458b5cd6: 66c785980a00007e01             mov word ptr [rbp + 0xa98], 0x17e
00000001458b5cdf: 48c785800a000020000000         mov qword ptr [rbp + 0xa80], 0x20
00000001458b5cea: 488985880a0000                 mov qword ptr [rbp + 0xa88], rax
00000001458b5cf1: 48c785900a000000000000         mov qword ptr [rbp + 0xa90], 0
00000001458b5cfc: 488b8e100b0000                 mov rcx, qword ptr [rsi + 0xb10]
00000001458b5d03: 488b96180b0000                 mov rdx, qword ptr [rsi + 0xb18]
00000001458b5d0a: 4c8d8d800a0000                 lea r9, [rbp + 0xa80]
00000001458b5d11: 4989d8                         mov r8, rbx
00000001458b5d14: e8570bffff                     call 0x1458a6870
00000001458b5d19: 90                             nop
00000001458b5d1a: 488d8db8200000                 lea rcx, [rbp + 0x20b8]
00000001458b5d21: 488d55b0                       lea rdx, [rbp - 0x50]
00000001458b5d25: e876ea0800                     call 0x1459447a0
00000001458b5d2a: 90                             nop
00000001458b5d2b: c7851021000000000000           mov dword ptr [rbp + 0x2110], 0
00000001458b5d35: 48c785f820000000000000         mov qword ptr [rbp + 0x20f8], 0
00000001458b5d40: 48c7850021000001000000         mov qword ptr [rbp + 0x2100], 1
00000001458b5d4b: 48c7850821000000000000         mov qword ptr [rbp + 0x2108], 0
00000001458b5d56: 488bbdc0200000                 mov rdi, qword ptr [rbp + 0x20c0]
00000001458b5d5d: 4c8bb5c8200000                 mov r14, qword ptr [rbp + 0x20c8]
00000001458b5d64: 41b501                         mov r13b, 1
00000001458b5d67: 4d85f6                         test r14, r14
00000001458b5d6a: 0f84e7000000                   je 0x1458b5e57
00000001458b5d70: c6852e21000001                 mov byte ptr [rbp + 0x212e], 1
00000001458b5d77: 488d8df8200000                 lea rcx, [rbp + 0x20f8]
00000001458b5d7e: e86dd64d00                     call 0x145d933f0
00000001458b5d83: 90                             nop
00000001458b5d84: 488b8500210000                 mov rax, qword ptr [rbp + 0x2100]
00000001458b5d8b: c60004                         mov byte ptr [rax], 4
00000001458b5d8e: 48c7850821000001000000         mov qword ptr [rbp + 0x2108], 1
00000001458b5d99: 488b8df8200000                 mov rcx, qword ptr [rbp + 0x20f8]
00000001458b5da0: 48ffc9                         dec rcx
00000001458b5da3: b801000000                     mov eax, 1
00000001458b5da8: 4883f903                       cmp rcx, 3
00000001458b5dac: 0f8618070000                   jbe 0x1458b64ca
00000001458b5db2: 488b8d00210000                 mov rcx, qword ptr [rbp + 0x2100]
00000001458b5db9: 44893401                       mov dword ptr [rcx + rax], r14d
00000001458b5dbd: 4883850821000004               add qword ptr [rbp + 0x2108], 4
00000001458b5dc5: 4e8d3cf7                       lea r15, [rdi + r14*8]
00000001458b5dc9: 4c8db5f8200000                 lea r14, [rbp + 0x20f8]
00000001458b5dd0: 4989fc                         mov r12, rdi
00000001458b5dd3: 498b0c24                       mov rcx, qword ptr [r12]
00000001458b5dd7: c6852e21000001                 mov byte ptr [rbp + 0x212e], 1
00000001458b5dde: 4c89f2                         mov rdx, r14
00000001458b5de1: e88a270100                     call 0x1458c8570
00000001458b5de6: 90                             nop
00000001458b5de7: 4983c408                       add r12, 8
00000001458b5deb: 4d39fc                         cmp r12, r15
00000001458b5dee: 75e3                           jne 0x1458b5dd3
00000001458b5df0: ff8510210000                   inc dword ptr [rbp + 0x2110]
00000001458b5df6: 745f                           je 0x1458b5e57
00000001458b5df8: 0f1085f8200000                 movups xmm0, xmmword ptr [rbp + 0x20f8]
00000001458b5dff: 0f108d08210000                 movups xmm1, xmmword ptr [rbp + 0x2108]
00000001458b5e06: 0f298d900a0000                 movaps xmmword ptr [rbp + 0xa90], xmm1
00000001458b5e0d: 0f2985800a0000                 movaps xmmword ptr [rbp + 0xa80], xmm0
00000001458b5e14: c6852e21000000                 mov byte ptr [rbp + 0x212e], 0
00000001458b5e1b: 488d8d48150000                 lea rcx, [rbp + 0x1548]
00000001458b5e22: 488d95800a0000                 lea rdx, [rbp + 0xa80]
00000001458b5e29: e8c22b0000                     call 0x1458b89f0
00000001458b5e2e: 90                             nop
00000001458b5e2f: 488b8e100b0000                 mov rcx, qword ptr [rsi + 0xb10]
00000001458b5e36: 488b96180b0000                 mov rdx, qword ptr [rsi + 0xb18]
00000001458b5e3d: c6852e21000000                 mov byte ptr [rbp + 0x212e], 0
00000001458b5e44: 4c8d8d48150000                 lea r9, [rbp + 0x1548]
00000001458b5e4b: 4989d8                         mov r8, rbx
00000001458b5e4e: e81d0affff                     call 0x1458a6870
00000001458b5e53: 90                             nop
00000001458b5e54: 4531ed                         xor r13d, r13d
00000001458b5e57: 4488ad2e210000                 mov byte ptr [rbp + 0x212e], r13b
00000001458b5e5e: 488d8d800a0000                 lea rcx, [rbp + 0xa80]
00000001458b5e65: 4889f2                         mov rdx, rsi
00000001458b5e68: e8b3130000                     call 0x1458b7220
00000001458b5e6d: 90                             nop
00000001458b5e6e: 83bd800a000002                 cmp dword ptr [rbp + 0xa80], 2
00000001458b5e75: 750e                           jne 0x1458b5e85
00000001458b5e77: 4584ed                         test r13b, r13b
00000001458b5e7a: 0f85b2050000                   jne 0x1458b6432
00000001458b5e80: e9cb050000                     jmp 0x1458b6450
00000001458b5e85: 488d8d48150000                 lea rcx, [rbp + 0x1548]
00000001458b5e8c: 488d95800a0000                 lea rdx, [rbp + 0xa80]
00000001458b5e93: 41b8c80a0000                   mov r8d, 0xac8
00000001458b5e99: e89dca3300                     call 0x145bf293b

0x140626874: 498b8de0020000           mov rcx, qword ptr [r13 + 0x2e0]
0x14062687b: 4883f9fe                 cmp rcx, -2
0x14062687f: 0f8479020000             je 0x140626afe
0x140626885: 4883f9ff                 cmp rcx, -1
0x140626889: 0f857e020000             jne 0x140626b0d
0x14062688f: 498b85e8020000           mov rax, qword ptr [r13 + 0x2e8]
0x140626896: 488d0d07bf8705           lea rcx, [rip + 0x587bf07]
0x14062689d: 48630481                 movsxd rax, dword ptr [rcx + rax*4]
0x1406268a1: 4801c8                   add rax, rcx
0x1406268a4: ffe0                     jmp rax
0x1406268a6: 498b85f0020000           mov rax, qword ptr [r13 + 0x2f0]
0x1406268ad: 488983680a0000           mov qword ptr [rbx + 0xa68], rax
0x1406268b4: 48be0000000000000080     movabs rsi, 0x8000000000000000
0x1406268be: e9950e0000               jmp 0x140627758
0x1406268c3: 4c8babb8000000           mov r13, qword ptr [rbx + 0xb8]
0x1406268ca: 498d9588010000           lea rdx, [r13 + 0x188]
0x1406268d1: 498995e8030000           mov qword ptr [r13 + 0x3e8], rdx
0x1406268d8: 4d8db5f8040000           lea r14, [r13 + 0x4f8]
0x1406268df: 41c685f804000000         mov byte ptr [r13 + 0x4f8], 0
0x1406268e7: 4c8b83c0000000           mov r8, qword ptr [rbx + 0xc0]
0x1406268ee: 498995f0030000           mov qword ptr [r13 + 0x3f0], rdx
0x1406268f5: 4883c270                 add rdx, 0x70
0x1406268f9: 498db5f8030000           lea rsi, [r13 + 0x3f8]
0x140626900: 4c89b318020000           mov qword ptr [rbx + 0x218], r14
0x140626907: 4c8983c0000000           mov qword ptr [rbx + 0xc0], r8
0x14062690e: 4c898320020000           mov qword ptr [rbx + 0x220], r8
0x140626915: 4889f1                   mov rcx, rsi
0x140626918: e8c31d3f05               call 0x145a186e0
0x14062691d: 90                       nop
0x14062691e: 803e00                   cmp byte ptr [rsi], 0
0x140626921: 0f8576020000             jne 0x140626b9d
0x140626927: 4c8babb8000000           mov r13, qword ptr [rbx + 0xb8]
0x14062692e: 410fb685f9030000         movzx eax, byte ptr [r13 + 0x3f9]
0x140626936: 85c0                     test eax, eax
0x140626938: 0f8426010000             je 0x140626a64
0x14062693e: 83f801                   cmp eax, 1
0x140626941: 0f85bd070000             jne 0x140627104
0x140626947: 498b85f0030000           mov rax, qword ptr [r13 + 0x3f0]
0x14062694e: 49898508040000           mov qword ptr [r13 + 0x408], rax
0x140626955: 41c685f004000000         mov byte ptr [r13 + 0x4f0], 0
0x14062695d: 4c89b3c8000000           mov qword ptr [rbx + 0xc8], r14
0x140626964: 498d9508040000           lea rdx, [r13 + 0x408]
0x14062696b: 488d8b00050000           lea rcx, [rbx + 0x500]
0x140626972: 488993d8000000           mov qword ptr [rbx + 0xd8], rdx
0x140626979: 4d89f8                   mov r8, r15
0x14062697c: e88f47ffff               call 0x14061b110
0x140626981: 90                       nop
0x140626982: 488bbb00050000           mov rdi, qword ptr [rbx + 0x500]
0x140626989: 4883fffd                 cmp rdi, -3
0x14062698d: 0f84eb010000             je 0x140626b7e
0x140626993: 488bb308050000           mov rsi, qword ptr [rbx + 0x508]
0x14062699a: 488d9310050000           lea rdx, [rbx + 0x510]
0x1406269a1: 488d8b20030000           lea rcx, [rbx + 0x320]
0x1406269a8: 41b810010000             mov r8d, 0x110
0x1406269ae: e834375d05               call 0x145bfa0e7
0x1406269b3: 4c8babb8000000           mov r13, qword ptr [rbx + 0xb8]
0x1406269ba: 4180bdf004000003         cmp byte ptr [r13 + 0x4f0], 3
0x1406269c2: 4c8bb3c8000000           mov r14, qword ptr [rbx + 0xc8]
0x1406269c9: 7532                     jne 0x1406269fd
0x1406269cb: 4180bde804000003         cmp byte ptr [r13 + 0x4e8], 3
0x1406269d3: 7528                     jne 0x1406269fd
0x1406269d5: 4180bd4404000004         cmp byte ptr [r13 + 0x444], 4
0x1406269dd: 751e                     jne 0x1406269fd
0x1406269df: 498b9558040000           mov rdx, qword ptr [r13 + 0x458]
0x1406269e6: 4885d2                   test rdx, rdx
0x1406269e9: 7412                     je 0x1406269fd
0x1406269eb: 498b8d60040000           mov rcx, qword ptr [r13 + 0x460]
0x1406269f2: 41b801000000             mov r8d, 1
0x1406269f8: e8d3b79dff               call 0x1400021d0
0x1406269fd: 4883ffff                 cmp rdi, -1
0x140626a01: 7461                     je 0x140626a64
0x140626a03: 4883fffe                 cmp rdi, -2
0x140626a07: 0f8428070000             je 0x140627135
0x140626a0d: 4889bb00050000           mov qword ptr [rbx + 0x500], rdi
0x140626a14: 4889b308050000           mov qword ptr [rbx + 0x508], rsi
0x140626a1b: 488d8b10050000           lea rcx, [rbx + 0x510]
0x140626a22: 488d9320030000           lea rdx, [rbx + 0x320]
0x140626a29: 41b810010000             mov r8d, 0x110
0x140626a2f: e8b3365d05               call 0x145bfa0e7
0x140626a34: 498b8df0030000           mov rcx, qword ptr [r13 + 0x3f0]
0x140626a3b: 4c89b318020000           mov qword ptr [rbx + 0x218], r14
0x140626a42: 488b83c0000000           mov rax, qword ptr [rbx + 0xc0]
0x140626a49: 48898320020000           mov qword ptr [rbx + 0x220], rax
0x140626a50: 488d9300050000           lea rdx, [rbx + 0x500]
0x140626a57: e834423d05               call 0x1459fac90
0x140626a5c: 90                       nop
0x140626a5d: 4c8babb8000000           mov r13, qword ptr [rbx + 0xb8]
0x140626a64: 41c60601                 mov byte ptr [r14], 1
0x140626a68: 48be0400000000000080     movabs rsi, 0x8000000000000004
0x140626a72: 4889b3600a0000           mov qword ptr [rbx + 0xa60], rsi
0x140626a79: 4d8db588010000           lea r14, [r13 + 0x188]
0x140626a80: 4180bdd903000000         cmp byte ptr [r13 + 0x3d9], 0
0x140626a88: 0f84d4060000             je 0x140627162
0x140626a8e: e92a0d0000               jmp 0x1406277bd
0x140626a93: 48be0900000000000080     movabs rsi, 0x8000000000000009
0x140626a9d: 4883f9ff                 cmp rcx, -1
0x140626aa1: 74cf                     je 0x140626a72
0x140626aa3: 410f1085d0020000         movups xmm0, xmmword ptr [r13 + 0x2d0]
0x140626aab: 0f1183a80a0000           movups xmmword ptr [rbx + 0xaa8], xmm0
0x140626ab2: f3410f6f8590020000       movdqu xmm0, xmmword ptr [r13 + 0x290]
0x140626abb: f3410f6f8da0020000       movdqu xmm1, xmmword ptr [r13 + 0x2a0]
0x140626ac4: f3410f6f95b0020000       movdqu xmm2, xmmword ptr [r13 + 0x2b0]
0x140626acd: f3410f6f9dc0020000       movdqu xmm3, xmmword ptr [r13 + 0x2c0]
0x140626ad6: f30f7f9b980a0000         movdqu xmmword ptr [rbx + 0xa98], xmm3
0x140626ade: f30f7f93880a0000         movdqu xmmword ptr [rbx + 0xa88], xmm2
0x140626ae6: f30f7f8b780a0000         movdqu xmmword ptr [rbx + 0xa78], xmm1
0x140626aee: f30f7f83680a0000         movdqu xmmword ptr [rbx + 0xa68], xmm0
0x140626af6: 4889ce                   mov rsi, rcx
0x140626af9: e974ffffff               jmp 0x140626a72
0x140626afe: 48be0900000000000080     movabs rsi, 0x8000000000000009
0x140626b08: e94b0c0000               jmp 0x140627758
0x140626b0d: 4801c8                   add rax, rcx
0x140626b10: 48c1f93f                 sar rcx, 0x3f
0x140626b14: 4821c1                   and rcx, rax
0x140626b17: 488d059ebc8705           lea rax, [rip + 0x587bc9e]
0x140626b1e: 48630c88                 movsxd rcx, dword ptr [rax + rcx*4]
0x140626b22: 4801c1                   add rcx, rax
0x140626b25: ffe1                     jmp rcx
0x140626b27: 498d8590020000           lea rax, [r13 + 0x290]
0x140626b2e: f30f6f00                 movdqu xmm0, xmmword ptr [rax]
0x140626b32: f30f6f4810               movdqu xmm1, xmmword ptr [rax + 0x10]
0x140626b37: f30f6f5020               movdqu xmm2, xmmword ptr [rax + 0x20]
0x140626b3c: f30f6f5830               movdqu xmm3, xmmword ptr [rax + 0x30]
0x140626b41: f30f7f9b980a0000         movdqu xmmword ptr [rbx + 0xa98], xmm3
0x140626b49: f30f7f93880a0000         movdqu xmmword ptr [rbx + 0xa88], xmm2
0x140626b51: f30f7f8b780a0000         movdqu xmmword ptr [rbx + 0xa78], xmm1
0x140626b59: f30f7f83680a0000         movdqu xmmword ptr [rbx + 0xa68], xmm0
0x140626b61: 498b8520030000           mov rax, qword ptr [r13 + 0x320]
0x140626b68: 488983a80a0000           mov qword ptr [rbx + 0xaa8], rax
0x140626b6f: 48be0500000000000080     movabs rsi, 0x8000000000000005
0x140626b79: e9da0b0000               jmp 0x140627758
0x140626b7e: 488b83c8000000           mov rax, qword ptr [rbx + 0xc8]
0x140626b85: c60003                   mov byte ptr [rax], 3
0x140626b88: 488b8368010000           mov rax, qword ptr [rbx + 0x168]
0x140626b8f: 48c700feffffff           mov qword ptr [rax], 0xfffffffffffffffe
0x140626b96: b00a                     mov al, 0xa
0x140626b98: e97c350000               jmp 0x14062a119
0x140626b9d: 4c89b3c8000000           mov qword ptr [rbx + 0xc8], r14
0x140626ba4: 488b83b8000000           mov rax, qword ptr [rbx + 0xb8]
0x140626bab: 488b8000040000           mov rax, qword ptr [rax + 0x400]
0x140626bb2: 48898360080000           mov qword ptr [rbx + 0x860], rax
0x140626bb9: 488d8360080000           lea rax, [rbx + 0x860]
0x140626bc0: 48898300050000           mov qword ptr [rbx + 0x500], rax
0x140626bc7: 488d05226f5b05           lea rax, [rip + 0x55b6f22]
0x140626bce: 48898308050000           mov qword ptr [rbx + 0x508], rax
0x140626bd5: 488d0dac618605           lea rcx, [rip + 0x58661ac]
0x140626bdc: 488d9300050000           lea rdx, [rbx + 0x500]
0x140626be3: e8b8036005               call 0x145c26fa0
0x140626be8: 90                       nop
0x140626be9: 4889c6                   mov rsi, rax
0x140626bec: 488b8360080000           mov rax, qword ptr [rbx + 0x860]
0x140626bf3: 89c1                     mov ecx, eax
0x140626bf5: 83e103                   and ecx, 3
0x140626bf8: 8d51fe                   lea edx, [rcx - 2]
0x140626bfb: 83fa02                   cmp edx, 2
0x140626bfe: 4c8bb3c8000000           mov r14, qword ptr [rbx + 0xc8]
0x140626c05: 0f8223050000             jb 0x14062712e
0x140626c0b: 4885c9                   test rcx, rcx
0x140626c0e: 0f841a050000             je 0x14062712e
0x140626c14: 48ffc8                   dec rax
0x140626c17: 488d8b08050000           lea rcx, [rbx + 0x508]
0x140626c1e: 48898308050000           mov qword ptr [rbx + 0x508], rax
0x140626c25: c6830005000003           mov byte ptr [rbx + 0x500], 3
0x140626c2c: 4c89b318020000           mov qword ptr [rbx + 0x218], r14
0x140626c33: 488b83c0000000           mov rax, qword ptr [rbx + 0xc0]
0x140626c3a: 48898320020000           mov qword ptr [rbx + 0x220], rax
0x140626c41: e87a8b5b05               call 0x145bdf7c0
0x140626c46: 90                       nop
0x140626c47: e9e2040000               jmp 0x14062712e
0x140626c4c: 488b8368010000           mov rax, qword ptr [rbx + 0x168]
0x140626c53: 48c700feffffff           mov qword ptr [rax], 0xfffffffffffffffe
0x140626c5a: b004                     mov al, 4
0x140626c5c: e9b8340000               jmp 0x14062a119
0x140626c61: 48be0400000000000080     movabs rsi, 0x8000000000000004
0x140626c6b: e9e80a0000               jmp 0x140627758
0x140626c70: 48be0600000000000080     movabs rsi, 0x8000000000000006
0x140626c7a: e9d90a0000               jmp 0x140627758
0x140626c7f: 498b8598000000           mov rax, qword ptr [r13 + 0x98]
0x140626c86: f3410f6f8588000000       movdqu xmm0, xmmword ptr [r13 + 0x88]
0x140626c8f: 660f70c04e               pshufd xmm0, xmm0, 0x4e
0x140626c94: f3410f7f8500040000       movdqu xmmword ptr [r13 + 0x400], xmm0
0x140626c9d: 49898510040000           mov qword ptr [r13 + 0x410], rax
0x140626ca4: 41c6851904000000         mov byte ptr [r13 + 0x419], 0
0x140626cac: 498d8de8030000           lea rcx, [r13 + 0x3e8]
0x140626cb3: 48898bc0000000           mov qword ptr [rbx + 0xc0], rcx
0x140626cba: 4c89fa                   mov rdx, r15
0x140626cbd: e88edcffff               call 0x140624950
0x140626cc2: 90                       nop
0x140626cc3: 89c6                     mov esi, eax
0x140626cc5: 3c02                     cmp al, 2
0x140626cc7: 0f8489000000             je 0x140626d56
0x140626ccd: 488b8bb8000000           mov rcx, qword ptr [rbx + 0xb8]
0x140626cd4: 0fb68119040000           movzx eax, byte ptr [rcx + 0x419]
0x140626cdb: 83f804                   cmp eax, 4
0x140626cde: 743a                     je 0x140626d1a
0x140626ce0: 83f803                   cmp eax, 3
0x140626ce3: 7542                     jne 0x140626d27
0x140626ce5: 488b83b8000000           mov rax, qword ptr [rbx + 0xb8]
0x140626cec: 80b89805000003           cmp byte ptr [rax + 0x598], 3
0x140626cf3: 7532                     jne 0x140626d27
0x140626cf5: 488b83b8000000           mov rax, qword ptr [rbx + 0xb8]
0x140626cfc: 80b89005000003           cmp byte ptr [rax + 0x590], 3
0x140626d03: 7522                     jne 0x140626d27
0x140626d05: 488b83b8000000           mov rax, qword ptr [rbx + 0xb8]
0x140626d0c: 488d8860040000           lea rcx, [rax + 0x460]
0x140626d13: e8f87ffdff               call 0x1405fed10
0x140626d18: eb0d                     jmp 0x140626d27
0x140626d1a: 4881c120040000           add rcx, 0x420
0x140626d21: e85a83fdff               call 0x1405ff080
0x140626d26: 90                       nop
0x140626d27: 40f6c601                 test sil, 1
0x140626d2b: 740c                     je 0x140626d39
0x140626d2d: 48be0400000000000080     movabs rsi, 0x8000000000000004
0x140626d37: eb0a                     jmp 0x140626d43
0x140626d39: 48be0900000000000080     movabs rsi, 0x8000000000000009
0x140626d43: 4889b3600a0000           mov qword ptr [rbx + 0xa60], rsi
0x140626d4a: 4c8babb8000000           mov r13, qword ptr [rbx + 0xb8]
0x140626d51: e9090a0000               jmp 0x14062775f
0x140626d56: 488b8368010000           mov rax, qword ptr [rbx + 0x168]
0x140626d5d: 48c700feffffff           mov qword ptr [rax], 0xfffffffffffffffe
0x140626d64: b005                     mov al, 5
0x140626d66: e9ae330000               jmp 0x14062a119
0x140626d6b: 48be0700000000000080     movabs rsi, 0x8000000000000007
0x140626d75: e9de090000               jmp 0x140627758

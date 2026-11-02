0000000145d1227b 488d8de0010000                 lea rcx, [rbp + 0x1e0]
0000000145d12282 488d9528050000                 lea rdx, [rbp + 0x528]
0000000145d12289 e852141b00                     call 0x145ec36e0
0000000145d1228e 90                             nop 
0000000145d1228f 488d8d28050000                 lea rcx, [rbp + 0x528]
0000000145d12296 e8a5131b00                     call 0x145ec3640
0000000145d1229b 90                             nop 
0000000145d1229c 89c3                           mov ebx, eax
0000000145d1229e 8b85e0010000                   mov eax, dword ptr [rbp + 0x1e0]
0000000145d122a4 48898550050000                 mov qword ptr [rbp + 0x550], rax
0000000145d122ab 8b85e4010000                   mov eax, dword ptr [rbp + 0x1e4]
0000000145d122b1 48898560050000                 mov qword ptr [rbp + 0x560], rax
0000000145d122b8 488b85e8010000                 mov rax, qword ptr [rbp + 0x1e8]
0000000145d122bf 488985d8040000                 mov qword ptr [rbp + 0x4d8], rax
0000000145d122c6 488b85f0010000                 mov rax, qword ptr [rbp + 0x1f0]
0000000145d122cd 48898500050000                 mov qword ptr [rbp + 0x500], rax
0000000145d122d4 4c8ba5c8040000                 mov r12, qword ptr [rbp + 0x4c8]
0000000145d122db 4c69bdd0040000b8000000         imul r15, qword ptr [rbp + 0x4d0], 0xb8
0000000145d122e6 4d01e7                         add r15, r12
0000000145d122e9 488db5e0010000                 lea rsi, [rbp + 0x1e0]
0000000145d122f0 488dbd28050000                 lea rdi, [rbp + 0x528]
0000000145d122f7 4c8db550010000                 lea r14, [rbp + 0x150]
0000000145d122fe 6690                           nop 
0000000145d12300 4d39fc                         cmp r12, r15
0000000145d12303 0f84dd020000                   je 0x145d125e6
0000000145d12309 4d89e5                         mov r13, r12
0000000145d1230c 4981c4b8000000                 add r12, 0xb8
0000000145d12313 488b8538050000                 mov rax, qword ptr [rbp + 0x538]
0000000145d1231a 483b8530050000                 cmp rax, qword ptr [rbp + 0x530]
0000000145d12321 73dd                           jae 0x145d12300
0000000145d12323 4889f1                         mov rcx, rsi
0000000145d12326 4889fa                         mov rdx, rdi
0000000145d12329 e8b2131b00                     call 0x145ec36e0
0000000145d1232e 90                             nop 
0000000145d1232f 488b95e8010000                 mov rdx, qword ptr [rbp + 0x1e8]
0000000145d12336 4c8b85f0010000                 mov r8, qword ptr [rbp + 0x1f0]
0000000145d1233d 4c89f1                         mov rcx, r14
0000000145d12340 48899568050000                 mov qword ptr [rbp + 0x568], rdx
0000000145d12347 e844e41a00                     call 0x145ec0790
0000000145d1234c 90                             nop 
0000000145d1234d 498b5518                       mov rdx, qword ptr [r13 + 0x18]
0000000145d12351 4885d2                         test rdx, rdx
0000000145d12354 740f                           je 0x145d12365
0000000145d12356 498b4d20                       mov rcx, qword ptr [r13 + 0x20]
0000000145d1235a 41b801000000                   mov r8d, 1
0000000145d12360 e86bfe2efa                     call 0x1400021d0
0000000145d12365 4983c518                       add r13, 0x18
0000000145d12369 488b8560010000                 mov rax, qword ptr [rbp + 0x160]
0000000145d12370 49894510                       mov qword ptr [r13 + 0x10], rax
0000000145d12374 f30f6f8550010000               movdqu xmm0, xmmword ptr [rbp + 0x150]
0000000145d1237c f3410f7f4500                   movdqu xmmword ptr [r13], xmm0
0000000145d12382 488b95e0010000                 mov rdx, qword ptr [rbp + 0x1e0]
0000000145d12389 4885d2                         test rdx, rdx
0000000145d1238c 0f846effffff                   je 0x145d12300
0000000145d12392 41b801000000                   mov r8d, 1
0000000145d12398 488b8d68050000                 mov rcx, qword ptr [rbp + 0x568]
0000000145d1239f e82cfe2efa                     call 0x1400021d0
0000000145d123a4 e957ffffff                     jmp 0x145d12300

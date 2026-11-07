0000000145b2edbd 488b9580020000                 mov rdx, qword ptr [rbp + 0x280]
0000000145b2edc4 48399570020000                 cmp qword ptr [rbp + 0x270], rdx
0000000145b2edcb 0f8452060000                   je 0x145b2f423
0000000145b2edd1 488b8578020000                 mov rax, qword ptr [rbp + 0x278]
0000000145b2edd8 c6041020                       mov byte ptr [rax + rdx], 0x20
0000000145b2eddc 48ff8580020000                 inc qword ptr [rbp + 0x280]
0000000145b2ede3 488d3d9d42b301                 lea rdi, [rip + 0x1b3429d]
0000000145b2edea ba20000000                     mov edx, 0x20
0000000145b2edef 4889f9                         mov rcx, rdi
0000000145b2edf2 e869c1fbff                     call 0x145aeaf60
0000000145b2edf7 90                             nop
0000000145b2edf8 4989c6                         mov r14, rax
0000000145b2edfb 4889d3                         mov rbx, rdx
0000000145b2edfe 4c8dbda0000000                 lea r15, [rbp + 0xa0]
0000000145b2ee05 4c89f9                         mov rcx, r15
0000000145b2ee08 4489e2                         mov edx, r12d
0000000145b2ee0b e8a012f9ff                     call 0x145ac00b0
0000000145b2ee10 90                             nop
0000000145b2ee11 4d85f6                         test r14, r14
0000000145b2ee14 b820000000                     mov eax, 0x20
0000000145b2ee19 480f44d8                       cmove rbx, rax
0000000145b2ee1d 490f45fe                       cmovne rdi, r14
0000000145b2ee21 488d055142b301                 lea rax, [rip + 0x1b34251]
0000000145b2ee28 48898570010000                 mov qword ptr [rbp + 0x170], rax
0000000145b2ee2f 48c7857801000006000000         mov qword ptr [rbp + 0x178], 6
0000000145b2ee3a 4c89bd80010000                 mov qword ptr [rbp + 0x180], r15
0000000145b2ee41 4c89ad88010000                 mov qword ptr [rbp + 0x188], r13
0000000145b2ee48 48c744242001000000             mov qword ptr [rsp + 0x20], 1
0000000145b2ee51 488d8d88020000                 lea rcx, [rbp + 0x288]
0000000145b2ee58 4c8d8d70010000                 lea r9, [rbp + 0x170]
0000000145b2ee5f 4889fa                         mov rdx, rdi
0000000145b2ee62 4989d8                         mov r8, rbx
0000000145b2ee65 e8d6c4fbff                     call 0x145aeb340
0000000145b2ee6a 90                             nop
0000000145b2ee6b 488b9d90020000                 mov rbx, qword ptr [rbp + 0x290]
0000000145b2ee72 488bbd98020000                 mov rdi, qword ptr [rbp + 0x298]
0000000145b2ee79 488b8570020000                 mov rax, qword ptr [rbp + 0x270]
0000000145b2ee80 488b9580020000                 mov rdx, qword ptr [rbp + 0x280]
0000000145b2ee87 4829d0                         sub rax, rdx
0000000145b2ee8a 4839c7                         cmp rdi, rax
0000000145b2ee8d 4c8db570020000                 lea r14, [rbp + 0x270]
0000000145b2ee94 0f87b7050000                   ja 0x145b2f451
0000000145b2ee9a 4885ff                         test rdi, rdi
0000000145b2ee9d 741c                           je 0x145b2eebb
0000000145b2ee9f 48039578020000                 add rdx, qword ptr [rbp + 0x278]
0000000145b2eea6 4889d1                         mov rcx, rdx
0000000145b2eea9 4889da                         mov rdx, rbx
0000000145b2eeac 4989f8                         mov r8, rdi
0000000145b2eeaf e867cd4b00                     call 0x145febc1b
0000000145b2eeb4 488b9580020000                 mov rdx, qword ptr [rbp + 0x280]
0000000145b2eebb 4801fa                         add rdx, rdi
0000000145b2eebe 48899580020000                 mov qword ptr [rbp + 0x280], rdx
0000000145b2eec5 488b9588020000                 mov rdx, qword ptr [rbp + 0x288]
0000000145b2eecc 4885d2                         test rdx, rdx
0000000145b2eecf 740e                           je 0x145b2eedf
0000000145b2eed1 41b801000000                   mov r8d, 1
0000000145b2eed7 4889d9                         mov rcx, rbx
0000000145b2eeda e8f1324dfa                     call 0x1400021d0
0000000145b2eedf 488b95a0000000                 mov rdx, qword ptr [rbp + 0xa0]
0000000145b2eee6 4885d2                         test rdx, rdx
0000000145b2eee9 7412                           je 0x145b2eefd
0000000145b2eeeb 488b8da8000000                 mov rcx, qword ptr [rbp + 0xa8]
0000000145b2eef2 41b801000000                   mov r8d, 1
0000000145b2eef8 e8d3324dfa                     call 0x1400021d0
0000000145b2eefd 4c89b5a0000000                 mov qword ptr [rbp + 0xa0], r14
0000000145b2ef04 488d05d5314dfa                 lea rax, [rip - 0x5b2ce2b]
0000000145b2ef0b 488985a8000000                 mov qword ptr [rbp + 0xa8], rax
0000000145b2ef12 488d158e41b301                 lea rdx, [rip + 0x1b3418e]
0000000145b2ef19 488d8d70010000                 lea rcx, [rbp + 0x170]
0000000145b2ef20 4c8d85a0000000                 lea r8, [rbp + 0xa0]
0000000145b2ef27 e844fa4800                     call 0x145fbe970
0000000145b2ef2c 90                             nop
0000000145b2ef2d 488b8570010000                 mov rax, qword ptr [rbp + 0x170]
0000000145b2ef34 488985b0020000                 mov qword ptr [rbp + 0x2b0], rax
0000000145b2ef3b 488b9578010000                 mov rdx, qword ptr [rbp + 0x178]
0000000145b2ef42 4c8b8580010000                 mov r8, qword ptr [rbp + 0x180]
0000000145b2ef49 488d8d70010000                 lea rcx, [rbp + 0x170]
0000000145b2ef50 48899568020000                 mov qword ptr [rbp + 0x268], rdx
0000000145b2ef57 e8f4f40400                     call 0x145b7e450
0000000145b2ef5c 90                             nop
0000000145b2ef5d 488d9570010000                 lea rdx, [rbp + 0x170]
0000000145b2ef64 4889f1                         mov rcx, rsi
0000000145b2ef67 e86445feff                     call 0x145b134d0
0000000145b2ef6c 90                             nop
0000000145b2ef6d 488b95b0020000                 mov rdx, qword ptr [rbp + 0x2b0]
0000000145b2ef74 4885d2                         test rdx, rdx
0000000145b2ef77 7412                           je 0x145b2ef8b
0000000145b2ef79 41b801000000                   mov r8d, 1
0000000145b2ef7f 488b8d68020000                 mov rcx, qword ptr [rbp + 0x268]
0000000145b2ef86 e845324dfa                     call 0x1400021d0

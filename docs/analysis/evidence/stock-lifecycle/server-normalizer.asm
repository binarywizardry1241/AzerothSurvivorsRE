0x14590c6d0: 55                       push rbp
0x14590c6d1: 4157                     push r15
0x14590c6d3: 4156                     push r14
0x14590c6d5: 4154                     push r12
0x14590c6d7: 56                       push rsi
0x14590c6d8: 57                       push rdi
0x14590c6d9: 53                       push rbx
0x14590c6da: 4883ec50                 sub rsp, 0x50
0x14590c6de: 488d6c2450               lea rbp, [rsp + 0x50]
0x14590c6e3: 48c745f8feffffff         mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14590c6eb: 4889ce                   mov rsi, rcx
0x14590c6ee: 488b7a10                 mov rdi, qword ptr [rdx + 0x10]
0x14590c6f2: 488d47ef                 lea rax, [rdi - 0x11]
0x14590c6f6: 4883f8ef                 cmp rax, -0x11
0x14590c6fa: 7713                     ja 0x14590c70f
0x14590c6fc: c74608ffffffff           mov dword ptr [rsi + 8], 0xffffffff
0x14590c703: 48c706ffffffff           mov qword ptr [rsi], 0xffffffffffffffff
0x14590c70a: e983010000               jmp 0x14590c892
0x14590c70f: 4c8b7a08                 mov r15, qword ptr [rdx + 8]
0x14590c713: e8e85a6ffa               call 0x140002200
0x14590c718: ba01000000               mov edx, 1
0x14590c71d: 4889f9                   mov rcx, rdi
0x14590c720: e89b5a6ffa               call 0x1400021c0
0x14590c725: 4885c0                   test rax, rax
0x14590c728: 0f8476010000             je 0x14590c8a4
0x14590c72e: 48897de0                 mov qword ptr [rbp - 0x20], rdi
0x14590c732: 488945e8                 mov qword ptr [rbp - 0x18], rax
0x14590c736: 48c745f000000000         mov qword ptr [rbp - 0x10], 0
0x14590c73e: 4c01ff                   add rdi, r15
0x14590c741: 31db                     xor ebx, ebx
0x14590c743: 4c8d75e0                 lea r14, [rbp - 0x20]
0x14590c747: 660f1f840000000000       nop word ptr [rax + rax]
0x14590c750: 410fb617                 movzx edx, byte ptr [r15]
0x14590c754: 0fb6ca                   movzx ecx, dl
0x14590c757: 84c9                     test cl, cl
0x14590c759: 7815                     js 0x14590c770
0x14590c75b: 49ffc7                   inc r15
0x14590c75e: 488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0x14590c762: 4189cc                   mov r12d, ecx
0x14590c765: e996000000               jmp 0x14590c800
0x14590c76a: 660f1f440000             nop word ptr [rax + rax]
0x14590c770: 4189cc                   mov r12d, ecx
0x14590c773: 4183e41f                 and r12d, 0x1f
0x14590c777: 450fb64701               movzx r8d, byte ptr [r15 + 1]
0x14590c77c: 4183e03f                 and r8d, 0x3f
0x14590c780: 80f9df                   cmp cl, 0xdf
0x14590c783: 7645                     jbe 0x14590c7ca
0x14590c785: 410fb64f02               movzx ecx, byte ptr [r15 + 2]
0x14590c78a: 41c1e006                 shl r8d, 6
0x14590c78e: 83e13f                   and ecx, 0x3f
0x14590c791: 4409c1                   or ecx, r8d
0x14590c794: 80faf0                   cmp dl, 0xf0
0x14590c797: 724b                     jb 0x14590c7e4
0x14590c799: 410fb65703               movzx edx, byte ptr [r15 + 3]
0x14590c79e: 4983c704                 add r15, 4
0x14590c7a2: 4183e407                 and r12d, 7
0x14590c7a6: 41c1e412                 shl r12d, 0x12
0x14590c7aa: c1e106                   shl ecx, 6
0x14590c7ad: 83e23f                   and edx, 0x3f
0x14590c7b0: 09ca                     or edx, ecx
0x14590c7b2: 4409e2                   or edx, r12d
0x14590c7b5: 4189d4                   mov r12d, edx
0x14590c7b8: 488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0x14590c7bc: 4181fc80000000           cmp r12d, 0x80
0x14590c7c3: 723b                     jb 0x14590c800
0x14590c7c5: e998000000               jmp 0x14590c862
0x14590c7ca: 4983c702                 add r15, 2
0x14590c7ce: 41c1e406                 shl r12d, 6
0x14590c7d2: 4509c4                   or r12d, r8d
0x14590c7d5: 488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0x14590c7d9: 4181fc80000000           cmp r12d, 0x80
0x14590c7e0: 721e                     jb 0x14590c800
0x14590c7e2: eb7e                     jmp 0x14590c862
0x14590c7e4: 4983c703                 add r15, 3
0x14590c7e8: 41c1e40c                 shl r12d, 0xc
0x14590c7ec: 4409e1                   or ecx, r12d
0x14590c7ef: 4189cc                   mov r12d, ecx
0x14590c7f2: 488b55e0                 mov rdx, qword ptr [rbp - 0x20]
0x14590c7f6: 4181fc80000000           cmp r12d, 0x80
0x14590c7fd: 7363                     jae 0x14590c862
0x14590c7ff: 90                       nop
0x14590c800: 4183fc20                 cmp r12d, 0x20
0x14590c804: 725c                     jb 0x14590c862
0x14590c806: 4183fc7f                 cmp r12d, 0x7f
0x14590c80a: 7456                     je 0x14590c862
0x14590c80c: 4839d3                   cmp rbx, rdx
0x14590c80f: 742a                     je 0x14590c83b
0x14590c811: 418d4c249f               lea ecx, [r12 - 0x61]
0x14590c816: 4489e2                   mov edx, r12d
0x14590c819: 80e25f                   and dl, 0x5f
0x14590c81c: 83f91a                   cmp ecx, 0x1a
0x14590c81f: 0fb6ca                   movzx ecx, dl
0x14590c822: 410f43cc                 cmovae ecx, r12d
0x14590c826: 880c18                   mov byte ptr [rax + rbx], cl
0x14590c829: 48ffc3                   inc rbx
0x14590c82c: 48895df0                 mov qword ptr [rbp - 0x10], rbx
0x14590c830: 4939ff                   cmp r15, rdi
0x14590c833: 0f8517ffffff             jne 0x14590c750
0x14590c839: eb48                     jmp 0x14590c883
0x14590c83b: 48c744242001000000       mov qword ptr [rsp + 0x20], 1
0x14590c844: 41b801000000             mov r8d, 1
0x14590c84a: 41b901000000             mov r9d, 1
0x14590c850: 4c89f1                   mov rcx, r14
0x14590c853: 4889da                   mov rdx, rbx
0x14590c856: e815e12e00               call 0x145bfa970
0x14590c85b: 90                       nop
0x14590c85c: 488b45e8                 mov rax, qword ptr [rbp - 0x18]
0x14590c860: ebaf                     jmp 0x14590c811
0x14590c862: 44896608                 mov dword ptr [rsi + 8], r12d
0x14590c866: 48c706ffffffff           mov qword ptr [rsi], 0xffffffffffffffff
0x14590c86d: 4885d2                   test rdx, rdx
0x14590c870: 7420                     je 0x14590c892
0x14590c872: 488b4de8                 mov rcx, qword ptr [rbp - 0x18]
0x14590c876: 41b801000000             mov r8d, 1
0x14590c87c: e84f596ffa               call 0x1400021d0
0x14590c881: eb0f                     jmp 0x14590c892
0x14590c883: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x14590c887: 48894610                 mov qword ptr [rsi + 0x10], rax
0x14590c88b: 0f1045e0                 movups xmm0, xmmword ptr [rbp - 0x20]
0x14590c88f: 0f1106                   movups xmmword ptr [rsi], xmm0
0x14590c892: 4889f0                   mov rax, rsi
0x14590c895: 4883c450                 add rsp, 0x50
0x14590c899: 5b                       pop rbx
0x14590c89a: 5f                       pop rdi
0x14590c89b: 5e                       pop rsi
0x14590c89c: 415c                     pop r12
0x14590c89e: 415e                     pop r14
0x14590c8a0: 415f                     pop r15
0x14590c8a2: 5d                       pop rbp
0x14590c8a3: c3                       ret
0x14590c8a4: b901000000               mov ecx, 1
0x14590c8a9: 4889fa                   mov rdx, rdi
0x14590c8ac: e80aca4800               call 0x145d992bb
0x14590c8b1: 0f0b                     ud2

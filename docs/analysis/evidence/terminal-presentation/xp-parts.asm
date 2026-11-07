1400a3b7e 4c8d4510 lea r8, [rbp + 0x10]
1400a3b82 488d4dc8 lea rcx, [rbp - 0x38]
1400a3b86 4889ea mov rdx, rbp
1400a3b89 e852670800 call 0x14012a2e0
1400a3b8e 488b7dc8 mov rdi, qword ptr [rbp - 0x38]
1400a3b92 4883ffff cmp rdi, -1
1400a3b96 0f841e010000 je 0x1400a3cba
1400a3c20 4889d8 mov rax, rbx
1400a3c23 48c1e005 shl rax, 5
1400a3c27 488b4d38 mov rcx, qword ptr [rbp + 0x38]
1400a3c2b 49890c06 mov qword ptr [r14 + rax], rcx
1400a3c2f 488b4d30 mov rcx, qword ptr [rbp + 0x30]
1400a3c33 49894c0608 mov qword ptr [r14 + rax + 8], rcx
1400a3c38 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
1400a3c3c 410f11440610 movups xmmword ptr [r14 + rax + 0x10], xmm0
1400a3c42 48ffc3 inc rbx
1400a3c45 48895d28 mov qword ptr [rbp + 0x28], rbx
1400a3c49 4c89f9 mov rcx, r15
1400a3c4c 4c89e2 mov rdx, r12
1400a3c4f 4989f8 mov r8, rdi
1400a3c52 e889660800 call 0x14012a2e0
1400a3c57 90 nop
1400a3c58 488b45c8 mov rax, qword ptr [rbp - 0x38]
1400a3c5c 4883f8ff cmp rax, -1
1400a3c60 7443 je 0x1400a3ca5
1400a3c62 48894538 mov qword ptr [rbp + 0x38], rax
1400a3c66 488b45d0 mov rax, qword ptr [rbp - 0x30]
1400a3c6a 48894530 mov qword ptr [rbp + 0x30], rax
1400a3c6e 0f1006 movups xmm0, xmmword ptr [rsi]
1400a3c71 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
1400a3c75 483b5d18 cmp rbx, qword ptr [rbp + 0x18]
1400a3c79 75a5 jne 0x1400a3c20
1400a3c7b 48c744242020000000 mov qword ptr [rsp + 0x20], 0x20
1400a3c84 41b801000000 mov r8d, 1
1400a3c8a 41b908000000 mov r9d, 8
1400a3c90 4c89e9 mov rcx, r13
1400a3c93 4889da mov rdx, rbx
1400a3c96 e8d56cb505 call 0x145bfa970
1400a3c9b 90 nop
1400a3c9c 4c8b7520 mov r14, qword ptr [rbp + 0x20]
1400a3ca0 e97bffffff jmp 0x1400a3c20

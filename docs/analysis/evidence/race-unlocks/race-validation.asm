0000000145b35cb7  4d8b7e40               mov r15, qword ptr [r14 + 0x40]
0000000145b35cbb  4d85ff                 test r15, r15
0000000145b35cbe  0f849a000000           je 0x145b35d5e
0000000145b35cc4  4d8b6638               mov r12, qword ptr [r14 + 0x38]
0000000145b35cc8  31c0                   xor eax, eax
0000000145b35cca  660f1f440000           nop word ptr [rax + rax]
0000000145b35cd0  410fb60c04             movzx ecx, byte ptr [r12 + rax]
0000000145b35cd5  fec9                   dec cl
0000000145b35cd7  80f907                 cmp cl, 7
0000000145b35cda  777a                   ja 0x145b35d56
0000000145b35cdc  48ffc0                 inc rax
0000000145b35cdf  4939c7                 cmp r15, rax
0000000145b35ce2  75ec                   jne 0x145b35cd0
0000000145b35ce4  4883bd9000000000       cmp qword ptr [rbp + 0x90], 0
0000000145b35cec  745f                   je 0x145b35d4d
0000000145b35cee  488b8590000000         mov rax, qword ptr [rbp + 0x90]
0000000145b35cf5  488b5d60               mov rbx, qword ptr [rbp + 0x60]
0000000145b35cf9  488d3c03               lea rdi, [rbx + rax]
0000000145b35cfd  4983ff10               cmp r15, 0x10
0000000145b35d01  732d                   jae 0x145b35d30
0000000145b35d03  4889d8                 mov rax, rbx
0000000145b35d06  0fb608                 movzx ecx, byte ptr [rax]
0000000145b35d09  48ffc0                 inc rax
0000000145b35d0c  31d2                   xor edx, edx
0000000145b35d0e  6690                   nop
0000000145b35d10  41380c14               cmp byte ptr [r12 + rdx], cl
0000000145b35d14  740a                   je 0x145b35d20
0000000145b35d16  48ffc2                 inc rdx
0000000145b35d19  4939d7                 cmp r15, rdx
0000000145b35d1c  75f2                   jne 0x145b35d10
0000000145b35d1e  eb36                   jmp 0x145b35d56
0000000145b35d20  4839f8                 cmp rax, rdi
0000000145b35d23  75e1                   jne 0x145b35d06
0000000145b35d25  eb26                   jmp 0x145b35d4d
0000000145b35d27  660f1f840000000000     nop word ptr [rax + rax]
0000000145b35d30  0fb60b                 movzx ecx, byte ptr [rbx]
0000000145b35d33  4c89e2                 mov rdx, r12
0000000145b35d36  4d89f8                 mov r8, r15
0000000145b35d39  e8f2944400             call 0x145f7f230
0000000145b35d3e  90                     nop
0000000145b35d3f  4883f801               cmp rax, 1
0000000145b35d43  7511                   jne 0x145b35d56
0000000145b35d45  48ffc3                 inc rbx
0000000145b35d48  4839fb                 cmp rbx, rdi
0000000145b35d4b  75e3                   jne 0x145b35d30
0000000145b35d4d  4120f5                 and r13b, sil
0000000145b35d50  4180fd01               cmp r13b, 1
0000000145b35d54  7422                   je 0x145b35d78
0000000145b35d56  4531ff                 xor r15d, r15d
0000000145b35d59  e998020000             jmp 0x145b35ff6
0000000145b35d5e  4531ff                 xor r15d, r15d
0000000145b35d61  4883bd9000000000       cmp qword ptr [rbp + 0x90], 0
0000000145b35d69  0f8587020000           jne 0x145b35ff6
0000000145b35d6f  4120f5                 and r13b, sil
0000000145b35d72  0f847e020000           je 0x145b35ff6
0000000145b35d78  4c89f1                 mov rcx, r14
0000000145b35d7b  e8e0f6ffff             call 0x145b35460
0000000145b35d80  89c6                   mov esi, eax
0000000145b35d82  31c9                   xor ecx, ecx
0000000145b35d84  e837200200             call 0x145b57dc0

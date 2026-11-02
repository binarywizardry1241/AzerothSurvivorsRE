1459efc30 4156 push r14
1459efc32 56 push rsi
1459efc33 57 push rdi
1459efc34 55 push rbp
1459efc35 53 push rbx
1459efc36 4489c0 mov eax, r8d
1459efc39 4839d1 cmp rcx, rdx
1459efc3c 0f84c8010000 je 0x1459efe0a
1459efc42 4829ca sub rdx, rcx
1459efc45 48c1ea04 shr rdx, 4
1459efc49 49b8abaaaaaaaaaaaaaa movabs r8, 0xaaaaaaaaaaaaaaab
1459efc53 4c0fafc2 imul r8, rdx
1459efc57 498b11 mov rdx, qword ptr [r9]
1459efc5a 4531c9 xor r9d, r9d
1459efc5d 0f57c0 xorps xmm0, xmm0
1459efc60 eb35 jmp 0x1459efc97
1459efc62 bb04000000 mov ebx, 4
1459efc67 660f1f840000000000 nop word ptr [rax + rax]
1459efc70 31ed xor ebp, ebp
1459efc72 39df cmp edi, ebx
1459efc74 400f97c5 seta bpl
1459efc78 31ff xor edi, edi
1459efc7a 4139f3 cmp r11d, esi
1459efc7d 400f97c7 seta dil
1459efc81 0f45ef cmovne ebp, edi
1459efc84 4084ed test bpl, bpl
1459efc87 410f44c2 cmove eax, r10d
1459efc8b 49ffc1 inc r9
1459efc8e 4d39c1 cmp r9, r8
1459efc91 0f8473010000 je 0x1459efe0a
1459efc97 4f8d1449 lea r10, [r9 + r9*2]
1459efc9b 49c1e204 shl r10, 4
1459efc9f 42837c112000 cmp dword ptr [rcx + r10 + 0x20], 0
1459efca5 74e4 je 0x1459efc8b
1459efca7 f3420f104c1114 movss xmm1, dword ptr [rcx + r10 + 0x14]
1459efcae 0f2ec8 ucomiss xmm1, xmm0
1459efcb1 76d8 jbe 0x1459efc8b
1459efcb3 4901ca add r10, rcx
1459efcb6 458b5210 mov r10d, dword ptr [r10 + 0x10]
1459efcba 4181fab0020000 cmp r10d, 0x2b0
1459efcc1 7f1d jg 0x1459efce0
1459efcc3 4181faac000000 cmp r10d, 0xac
1459efcca 7426 je 0x1459efcf2
1459efccc 4181fa5c010000 cmp r10d, 0x15c
1459efcd3 741d je 0x1459efcf2
1459efcd5 ebb4 jmp 0x1459efc8b
1459efcd7 660f1f840000000000 nop word ptr [rax + rax]
1459efce0 4181fad4030000 cmp r10d, 0x3d4
1459efce7 7409 je 0x1459efcf2
1459efce9 4181fab1020000 cmp r10d, 0x2b1
1459efcf0 7599 jne 0x1459efc8b
1459efcf2 488b7208 mov rsi, qword ptr [rdx + 8]
1459efcf6 486b7a1058 imul rdi, qword ptr [rdx + 0x10], 0x58
1459efcfb 4531db xor r11d, r11d
1459efcfe 6690 nop
1459efd00 4c39df cmp rdi, r11
1459efd03 741b je 0x1459efd20
1459efd05 4a8b1c1e mov rbx, qword ptr [rsi + r11]
1459efd09 4983c358 add r11, 0x58
1459efd0d 394340 cmp dword ptr [rbx + 0x40], eax
1459efd10 75ee jne 0x1459efd00
1459efd12 468b5c1eb0 mov r11d, dword ptr [rsi + r11 - 0x50]
1459efd17 eb0d jmp 0x1459efd26
1459efd19 0f1f8000000000 nop dword ptr [rax]
1459efd20 41bb01000000 mov r11d, 1
1459efd26 31db xor ebx, ebx
1459efd28 0f1f840000000000 nop dword ptr [rax + rax]
1459efd30 4839df cmp rdi, rbx
1459efd33 743b je 0x1459efd70
1459efd35 4c8b341e mov r14, qword ptr [rsi + rbx]
1459efd39 4883c358 add rbx, 0x58
1459efd3d 45395640 cmp dword ptr [r14 + 0x40], r10d
1459efd41 75ed jne 0x1459efd30
1459efd43 8b741eb0 mov esi, dword ptr [rsi + rbx - 0x50]
1459efd47 4181fab0020000 cmp r10d, 0x2b0
1459efd4e 7e2e jle 0x1459efd7e
1459efd50 4181fad4030000 cmp r10d, 0x3d4
1459efd57 7453 je 0x1459efdac
1459efd59 4181fab1020000 cmp r10d, 0x2b1
1459efd60 753c jne 0x1459efd9e
1459efd62 bf03000000 mov edi, 3
1459efd67 3db0020000 cmp eax, 0x2b0
1459efd6c 7f47 jg 0x1459efdb5
1459efd6e eb6d jmp 0x1459efddd
1459efd70 be01000000 mov esi, 1
1459efd75 4181fab0020000 cmp r10d, 0x2b0
1459efd7c 7fd2 jg 0x1459efd50
1459efd7e 4181faac000000 cmp r10d, 0xac
1459efd85 744a je 0x1459efdd1
1459efd87 4181fa5c010000 cmp r10d, 0x15c
1459efd8e 750e jne 0x1459efd9e
1459efd90 bf02000000 mov edi, 2
1459efd95 3db0020000 cmp eax, 0x2b0
1459efd9a 7f19 jg 0x1459efdb5
1459efd9c eb3f jmp 0x1459efddd
1459efd9e bf04000000 mov edi, 4
1459efda3 3db0020000 cmp eax, 0x2b0
1459efda8 7f0b jg 0x1459efdb5
1459efdaa eb31 jmp 0x1459efddd
1459efdac 31ff xor edi, edi
1459efdae 3db0020000 cmp eax, 0x2b0
1459efdb3 7e28 jle 0x1459efddd
1459efdb5 3dd4030000 cmp eax, 0x3d4
1459efdba 743d je 0x1459efdf9
1459efdbc 3db1020000 cmp eax, 0x2b1
1459efdc1 0f859bfeffff jne 0x1459efc62
1459efdc7 bb03000000 mov ebx, 3
1459efdcc e99ffeffff jmp 0x1459efc70
1459efdd1 bf01000000 mov edi, 1
1459efdd6 3db0020000 cmp eax, 0x2b0
1459efddb 7fd8 jg 0x1459efdb5
1459efddd 3dac000000 cmp eax, 0xac
1459efde2 741c je 0x1459efe00
1459efde4 3d5c010000 cmp eax, 0x15c
1459efde9 0f8573feffff jne 0x1459efc62
1459efdef bb02000000 mov ebx, 2
1459efdf4 e977feffff jmp 0x1459efc70
1459efdf9 31db xor ebx, ebx
1459efdfb e970feffff jmp 0x1459efc70
1459efe00 bb01000000 mov ebx, 1
1459efe05 e966feffff jmp 0x1459efc70
1459efe0a 5b pop rbx
1459efe0b 5d pop rbp
1459efe0c 5f pop rdi
1459efe0d 5e pop rsi
1459efe0e 415e pop r14
1459efe10 c3 ret

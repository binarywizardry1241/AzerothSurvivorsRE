0000000145ec36e0 55                             push rbp
0000000145ec36e1 4157                           push r15
0000000145ec36e3 4156                           push r14
0000000145ec36e5 4154                           push r12
0000000145ec36e7 56                             push rsi
0000000145ec36e8 57                             push rdi
0000000145ec36e9 53                             push rbx
0000000145ec36ea 4883ec50                       sub rsp, 0x50
0000000145ec36ee 488d6c2450                     lea rbp, [rsp + 0x50]
0000000145ec36f3 48c745f8feffffff               mov qword ptr [rbp - 8], 0xfffffffffffffffe
0000000145ec36fb 4889ce                         mov rsi, rcx
0000000145ec36fe 488b4208                       mov rax, qword ptr [rdx + 8]
0000000145ec3702 4c8b4210                       mov r8, qword ptr [rdx + 0x10]
0000000145ec3706 4c89c1                         mov rcx, r8
0000000145ec3709 4883c104                       add rcx, 4
0000000145ec370d 49c7c1ffffffff                 mov r9, 0xffffffffffffffff
0000000145ec3714 4c0f43c9                       cmovae r9, rcx
0000000145ec3718 4939c1                         cmp r9, rax
0000000145ec371b 760c                           jbe 0x145ec3729
0000000145ec371d c6421800                       mov byte ptr [rdx + 0x18], 0
0000000145ec3721 4531c0                         xor r8d, r8d
0000000145ec3724 4889c1                         mov rcx, rax
0000000145ec3727 eb15                           jmp 0x145ec373e
0000000145ec3729 4d29c1                         sub r9, r8
0000000145ec372c 4983f904                       cmp r9, 4
0000000145ec3730 7509                           jne 0x145ec373b
0000000145ec3732 4c8b0a                         mov r9, qword ptr [rdx]
0000000145ec3735 478b0401                       mov r8d, dword ptr [r9 + r8]
0000000145ec3739 eb03                           jmp 0x145ec373e
0000000145ec373b 4531c0                         xor r8d, r8d
0000000145ec373e 4901c8                         add r8, rcx
0000000145ec3741 49c7c6ffffffff                 mov r14, 0xffffffffffffffff
0000000145ec3748 4d0f43f0                       cmovae r14, r8
0000000145ec374c 4939c6                         cmp r14, rax
0000000145ec374f 760a                           jbe 0x145ec375b
0000000145ec3751 c6421800                       mov byte ptr [rdx + 0x18], 0
0000000145ec3755 48894210                       mov qword ptr [rdx + 0x10], rax
0000000145ec3759 eb15                           jmp 0x145ec3770
0000000145ec375b 488b3a                         mov rdi, qword ptr [rdx]
0000000145ec375e 4801cf                         add rdi, rcx
0000000145ec3761 4929ce                         sub r14, rcx
0000000145ec3764 4c894210                       mov qword ptr [rdx + 0x10], r8
0000000145ec3768 0f88f9000000                   js 0x145ec3867
0000000145ec376e 750a                           jne 0x145ec377a
0000000145ec3770 ba01000000                     mov edx, 1
0000000145ec3775 4531f6                         xor r14d, r14d
0000000145ec3778 eb34                           jmp 0x145ec37ae
0000000145ec377a e881ea13fa                     call 0x140002200
0000000145ec377f bb01000000                     mov ebx, 1
0000000145ec3784 ba01000000                     mov edx, 1
0000000145ec3789 4c89f1                         mov rcx, r14
0000000145ec378c e82fea13fa                     call 0x1400021c0
0000000145ec3791 4885c0                         test rax, rax
0000000145ec3794 0f84cf000000                   je 0x145ec3869
0000000145ec379a 4889c1                         mov rcx, rax
0000000145ec379d 4889c3                         mov rbx, rax
0000000145ec37a0 4889fa                         mov rdx, rdi
0000000145ec37a3 4d89f0                         mov r8, r14
0000000145ec37a6 e870df1900                     call 0x14606171b
0000000145ec37ab 4889da                         mov rdx, rbx
0000000145ec37ae 488d4dd0                       lea rcx, [rbp - 0x30]
0000000145ec37b2 488955e8                       mov qword ptr [rbp - 0x18], rdx
0000000145ec37b6 4c8975f0                       mov qword ptr [rbp - 0x10], r14
0000000145ec37ba 4d89f0                         mov r8, r14
0000000145ec37bd e8aee61600                     call 0x146031e70
0000000145ec37c2 90                             nop 
0000000145ec37c3 48837dd0ff                     cmp qword ptr [rbp - 0x30], -1
0000000145ec37c8 7439                           je 0x145ec3803
0000000145ec37ca 488b45e0                       mov rax, qword ptr [rbp - 0x20]
0000000145ec37ce 48894610                       mov qword ptr [rsi + 0x10], rax
0000000145ec37d2 0f1045d0                       movups xmm0, xmmword ptr [rbp - 0x30]
0000000145ec37d6 0f1106                         movups xmmword ptr [rsi], xmm0
0000000145ec37d9 488b55f0                       mov rdx, qword ptr [rbp - 0x10]
0000000145ec37dd 488b4de8                       mov rcx, qword ptr [rbp - 0x18]
0000000145ec37e1 4885d2                         test rdx, rdx
0000000145ec37e4 740b                           je 0x145ec37f1
0000000145ec37e6 41b801000000                   mov r8d, 1
0000000145ec37ec e8dfe913fa                     call 0x1400021d0
0000000145ec37f1 4889f0                         mov rax, rsi
0000000145ec37f4 4883c450                       add rsp, 0x50
0000000145ec37f8 5b                             pop rbx
0000000145ec37f9 5f                             pop rdi
0000000145ec37fa 5e                             pop rsi
0000000145ec37fb 415c                           pop r12
0000000145ec37fd 415e                           pop r14
0000000145ec37ff 415f                           pop r15
0000000145ec3801 5d                             pop rbp
0000000145ec3802 c3                             ret 
0000000145ec3803 488b7de0                       mov rdi, qword ptr [rbp - 0x20]
0000000145ec3807 4885ff                         test rdi, rdi
0000000145ec380a 488b55f0                       mov rdx, qword ptr [rbp - 0x10]
0000000145ec380e 7866                           js 0x145ec3876
0000000145ec3810 743a                           je 0x145ec384c
0000000145ec3812 4989d4                         mov r12, rdx
0000000145ec3815 4c8b75d8                       mov r14, qword ptr [rbp - 0x28]
0000000145ec3819 e8e2e913fa                     call 0x140002200
0000000145ec381e 41bf01000000                   mov r15d, 1
0000000145ec3824 ba01000000                     mov edx, 1
0000000145ec3829 4889f9                         mov rcx, rdi
0000000145ec382c e88fe913fa                     call 0x1400021c0
0000000145ec3831 4885c0                         test rax, rax
0000000145ec3834 7443                           je 0x145ec3879
0000000145ec3836 4889c3                         mov rbx, rax
0000000145ec3839 4889c1                         mov rcx, rax
0000000145ec383c 4c89f2                         mov rdx, r14
0000000145ec383f 4989f8                         mov r8, rdi
0000000145ec3842 e8d4de1900                     call 0x14606171b
0000000145ec3847 4c89e2                         mov rdx, r12
0000000145ec384a eb05                           jmp 0x145ec3851
0000000145ec384c bb01000000                     mov ebx, 1
0000000145ec3851 48893e                         mov qword ptr [rsi], rdi
0000000145ec3854 48895e08                       mov qword ptr [rsi + 8], rbx
0000000145ec3858 48897e10                       mov qword ptr [rsi + 0x10], rdi
0000000145ec385c 488b4de8                       mov rcx, qword ptr [rbp - 0x18]
0000000145ec3860 4885d2                         test rdx, rdx
0000000145ec3863 7581                           jne 0x145ec37e6
0000000145ec3865 eb8a                           jmp 0x145ec37f1
0000000145ec3867 31db                           xor ebx, ebx
0000000145ec3869 4889d9                         mov rcx, rbx
0000000145ec386c 4c89f2                         mov rdx, r14
0000000145ec386f e8f7503400                     call 0x14620896b
0000000145ec3874 0f0b                           ud2 
0000000145ec3876 4531ff                         xor r15d, r15d
0000000145ec3879 4c89f9                         mov rcx, r15
0000000145ec387c 4889fa                         mov rdx, rdi
0000000145ec387f e8e7503400                     call 0x14620896b
0000000145ec3884 90                             nop 
0000000145ec3885 0f0b                           ud2 

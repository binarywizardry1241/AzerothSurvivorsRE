0000000145afd910 55                             push rbp
0000000145afd911 56                             push rsi
0000000145afd912 57                             push rdi
0000000145afd913 53                             push rbx
0000000145afd914 4883ec48                       sub rsp, 0x48
0000000145afd918 488d6c2440                     lea rbp, [rsp + 0x40]
0000000145afd91d 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145afd925 4889ce                         mov rsi, rcx
0000000145afd928 488b11                         mov rdx, qword ptr [rcx]
0000000145afd92b 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145afd935 4831d1                         xor rcx, rdx
0000000145afd938 4885d2                         test rdx, rdx
0000000145afd93b b80a000000                     mov eax, 0xa
0000000145afd940 480f48c1                       cmovs rax, rcx
0000000145afd944 4883f80a                       cmp rax, 0xa
0000000145afd948 0f8748010000                   ja 0x145afda96
0000000145afd94e 488d0de3287f01                 lea rcx, [rip + 0x17f28e3]
0000000145afd955 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145afd959 4801c8                         add rax, rcx
0000000145afd95c ffe0                           jmp rax
0000000145afd95e 488b5608                       mov rdx, qword ptr [rsi + 8]
0000000145afd962 4885d2                         test rdx, rdx
0000000145afd965 0f842b010000                   je 0x145afda96
0000000145afd96b 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145afd96f 41b801000000                   mov r8d, 1
0000000145afd975 4883c448                       add rsp, 0x48
0000000145afd979 5b                             pop rbx
0000000145afd97a 5f                             pop rdi
0000000145afd97b 5e                             pop rsi
0000000145afd97c 5d                             pop rbp
0000000145afd97d e94e4850fa                     jmp 0x1400021d0
0000000145afd982 488b5608                       mov rdx, qword ptr [rsi + 8]
0000000145afd986 4885d2                         test rdx, rdx
0000000145afd989 740f                           je 0x145afd99a
0000000145afd98b 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145afd98f 41b801000000                   mov r8d, 1
0000000145afd995 e8364850fa                     call 0x1400021d0
0000000145afd99a 488b5620                       mov rdx, qword ptr [rsi + 0x20]
0000000145afd99e 4885d2                         test rdx, rdx
0000000145afd9a1 740f                           je 0x145afd9b2
0000000145afd9a3 488b4e28                       mov rcx, qword ptr [rsi + 0x28]
0000000145afd9a7 41b801000000                   mov r8d, 1
0000000145afd9ad e81e4850fa                     call 0x1400021d0
0000000145afd9b2 488b5638                       mov rdx, qword ptr [rsi + 0x38]
0000000145afd9b6 4885d2                         test rdx, rdx
0000000145afd9b9 740f                           je 0x145afd9ca
0000000145afd9bb 488b4e40                       mov rcx, qword ptr [rsi + 0x40]
0000000145afd9bf 41b801000000                   mov r8d, 1
0000000145afd9c5 e8064850fa                     call 0x1400021d0
0000000145afd9ca 488b5650                       mov rdx, qword ptr [rsi + 0x50]
0000000145afd9ce 4885d2                         test rdx, rdx
0000000145afd9d1 0f84bf000000                   je 0x145afda96
0000000145afd9d7 488b4e58                       mov rcx, qword ptr [rsi + 0x58]
0000000145afd9db eb92                           jmp 0x145afd96f
0000000145afd9dd 4885d2                         test rdx, rdx
0000000145afd9e0 740f                           je 0x145afd9f1
0000000145afd9e2 488b4e08                       mov rcx, qword ptr [rsi + 8]
0000000145afd9e6 41b801000000                   mov r8d, 1
0000000145afd9ec e8df4750fa                     call 0x1400021d0
0000000145afd9f1 488b5618                       mov rdx, qword ptr [rsi + 0x18]
0000000145afd9f5 4885d2                         test rdx, rdx
0000000145afd9f8 740f                           je 0x145afda09
0000000145afd9fa 488b4e20                       mov rcx, qword ptr [rsi + 0x20]
0000000145afd9fe 41b801000000                   mov r8d, 1
0000000145afda04 e8c74750fa                     call 0x1400021d0
0000000145afda09 488b5630                       mov rdx, qword ptr [rsi + 0x30]
0000000145afda0d 4885d2                         test rdx, rdx
0000000145afda10 740f                           je 0x145afda21
0000000145afda12 488b4e38                       mov rcx, qword ptr [rsi + 0x38]
0000000145afda16 41b801000000                   mov r8d, 1
0000000145afda1c e8af4750fa                     call 0x1400021d0
0000000145afda21 488b5648                       mov rdx, qword ptr [rsi + 0x48]
0000000145afda25 4885d2                         test rdx, rdx
0000000145afda28 746c                           je 0x145afda96
0000000145afda2a 488b4e50                       mov rcx, qword ptr [rsi + 0x50]
0000000145afda2e e93cffffff                     jmp 0x145afd96f
0000000145afda33 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145afda37 488975e8                       mov qword ptr [rbp - 0x18], rsi
0000000145afda3b 488b4618                       mov rax, qword ptr [rsi + 0x18]
0000000145afda3f 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145afda43 48c745f000000000               mov qword ptr [rbp - 0x10], 0
0000000145afda4b 48894df8                       mov qword ptr [rbp - 8], rcx
0000000145afda4f 90                             nop
0000000145afda50 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145afda54 483945e0                       cmp qword ptr [rbp - 0x20], rax
0000000145afda58 7419                           je 0x145afda73
0000000145afda5a 48ffc0                         inc rax
0000000145afda5d 488945f0                       mov qword ptr [rbp - 0x10], rax
0000000145afda61 488db1c8000000                 lea rsi, [rcx + 0xc8]
0000000145afda68 e8034da0fa                     call 0x140502770
0000000145afda6d 90                             nop
0000000145afda6e 4889f1                         mov rcx, rsi
0000000145afda71 ebdd                           jmp 0x145afda50
0000000145afda73 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145afda77 488b4008                       mov rax, qword ptr [rax + 8]
0000000145afda7b 4885c0                         test rax, rax
0000000145afda7e 7416                           je 0x145afda96
0000000145afda80 4869d0c8000000                 imul rdx, rax, 0xc8
0000000145afda87 41b808000000                   mov r8d, 8
0000000145afda8d 488b4df8                       mov rcx, qword ptr [rbp - 8]
0000000145afda91 e9dffeffff                     jmp 0x145afd975
0000000145afda96 4883c448                       add rsp, 0x48
0000000145afda9a 5b                             pop rbx
0000000145afda9b 5f                             pop rdi
0000000145afda9c 5e                             pop rsi
0000000145afda9d 5d                             pop rbp
0000000145afda9e c3                             ret

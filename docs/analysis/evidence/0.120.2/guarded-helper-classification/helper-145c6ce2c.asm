0000000145c6cde0 55                             push rbp
0000000145c6cde1 56                             push rsi
0000000145c6cde2 57                             push rdi
0000000145c6cde3 53                             push rbx
0000000145c6cde4 4883ec48                       sub rsp, 0x48
0000000145c6cde8 488d6c2440                     lea rbp, [rsp + 0x40]
0000000145c6cded 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145c6cdf5 4889ce                         mov rsi, rcx
0000000145c6cdf8 488b11                         mov rdx, qword ptr [rcx]
0000000145c6cdfb 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145c6ce05 4831d1                         xor rcx, rdx
0000000145c6ce08 4885d2                         test rdx, rdx
0000000145c6ce0b b80a000000                     mov eax, 0xa
0000000145c6ce10 480f48c1                       cmovs rax, rcx
0000000145c6ce14 4883f80a                       cmp rax, 0xa
0000000145c6ce18 0f8748010000                   ja 0x145c6cf66
0000000145c6ce1e 488d0db3879901                 lea rcx, [rip + 0x19987b3]
0000000145c6ce25 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145c6ce29 4801c8                         add rax, rcx
0000000145c6ce2c ffe0                           jmp rax
0000000145c6ce2e 488b5608                       mov rdx, qword ptr [rsi + 8]
0000000145c6ce32 4885d2                         test rdx, rdx
0000000145c6ce35 0f842b010000                   je 0x145c6cf66
0000000145c6ce3b 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145c6ce3f 41b801000000                   mov r8d, 1
0000000145c6ce45 4883c448                       add rsp, 0x48
0000000145c6ce49 5b                             pop rbx
0000000145c6ce4a 5f                             pop rdi
0000000145c6ce4b 5e                             pop rsi
0000000145c6ce4c 5d                             pop rbp
0000000145c6ce4d e97e5339fa                     jmp 0x1400021d0
0000000145c6ce52 488b5608                       mov rdx, qword ptr [rsi + 8]
0000000145c6ce56 4885d2                         test rdx, rdx
0000000145c6ce59 740f                           je 0x145c6ce6a
0000000145c6ce5b 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145c6ce5f 41b801000000                   mov r8d, 1
0000000145c6ce65 e8665339fa                     call 0x1400021d0
0000000145c6ce6a 488b5620                       mov rdx, qword ptr [rsi + 0x20]
0000000145c6ce6e 4885d2                         test rdx, rdx
0000000145c6ce71 740f                           je 0x145c6ce82
0000000145c6ce73 488b4e28                       mov rcx, qword ptr [rsi + 0x28]
0000000145c6ce77 41b801000000                   mov r8d, 1
0000000145c6ce7d e84e5339fa                     call 0x1400021d0
0000000145c6ce82 488b5638                       mov rdx, qword ptr [rsi + 0x38]
0000000145c6ce86 4885d2                         test rdx, rdx
0000000145c6ce89 740f                           je 0x145c6ce9a
0000000145c6ce8b 488b4e40                       mov rcx, qword ptr [rsi + 0x40]
0000000145c6ce8f 41b801000000                   mov r8d, 1
0000000145c6ce95 e8365339fa                     call 0x1400021d0
0000000145c6ce9a 488b5650                       mov rdx, qword ptr [rsi + 0x50]
0000000145c6ce9e 4885d2                         test rdx, rdx
0000000145c6cea1 0f84bf000000                   je 0x145c6cf66
0000000145c6cea7 488b4e58                       mov rcx, qword ptr [rsi + 0x58]
0000000145c6ceab eb92                           jmp 0x145c6ce3f
0000000145c6cead 4885d2                         test rdx, rdx
0000000145c6ceb0 740f                           je 0x145c6cec1
0000000145c6ceb2 488b4e08                       mov rcx, qword ptr [rsi + 8]
0000000145c6ceb6 41b801000000                   mov r8d, 1
0000000145c6cebc e80f5339fa                     call 0x1400021d0
0000000145c6cec1 488b5618                       mov rdx, qword ptr [rsi + 0x18]
0000000145c6cec5 4885d2                         test rdx, rdx
0000000145c6cec8 740f                           je 0x145c6ced9
0000000145c6ceca 488b4e20                       mov rcx, qword ptr [rsi + 0x20]
0000000145c6cece 41b801000000                   mov r8d, 1
0000000145c6ced4 e8f75239fa                     call 0x1400021d0
0000000145c6ced9 488b5630                       mov rdx, qword ptr [rsi + 0x30]
0000000145c6cedd 4885d2                         test rdx, rdx
0000000145c6cee0 740f                           je 0x145c6cef1
0000000145c6cee2 488b4e38                       mov rcx, qword ptr [rsi + 0x38]
0000000145c6cee6 41b801000000                   mov r8d, 1
0000000145c6ceec e8df5239fa                     call 0x1400021d0
0000000145c6cef1 488b5648                       mov rdx, qword ptr [rsi + 0x48]
0000000145c6cef5 4885d2                         test rdx, rdx
0000000145c6cef8 746c                           je 0x145c6cf66
0000000145c6cefa 488b4e50                       mov rcx, qword ptr [rsi + 0x50]
0000000145c6cefe e93cffffff                     jmp 0x145c6ce3f
0000000145c6cf03 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145c6cf07 488975e8                       mov qword ptr [rbp - 0x18], rsi
0000000145c6cf0b 488b4618                       mov rax, qword ptr [rsi + 0x18]
0000000145c6cf0f 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145c6cf13 48c745f000000000               mov qword ptr [rbp - 0x10], 0
0000000145c6cf1b 48894df8                       mov qword ptr [rbp - 8], rcx
0000000145c6cf1f 90                             nop
0000000145c6cf20 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145c6cf24 483945e0                       cmp qword ptr [rbp - 0x20], rax
0000000145c6cf28 7419                           je 0x145c6cf43
0000000145c6cf2a 48ffc0                         inc rax
0000000145c6cf2d 488945f0                       mov qword ptr [rbp - 0x10], rax
0000000145c6cf31 488db1c8000000                 lea rsi, [rcx + 0xc8]
0000000145c6cf38 e8335889fa                     call 0x140502770
0000000145c6cf3d 90                             nop
0000000145c6cf3e 4889f1                         mov rcx, rsi
0000000145c6cf41 ebdd                           jmp 0x145c6cf20
0000000145c6cf43 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145c6cf47 488b4008                       mov rax, qword ptr [rax + 8]
0000000145c6cf4b 4885c0                         test rax, rax
0000000145c6cf4e 7416                           je 0x145c6cf66
0000000145c6cf50 4869d0c8000000                 imul rdx, rax, 0xc8
0000000145c6cf57 41b808000000                   mov r8d, 8
0000000145c6cf5d 488b4df8                       mov rcx, qword ptr [rbp - 8]
0000000145c6cf61 e9dffeffff                     jmp 0x145c6ce45
0000000145c6cf66 4883c448                       add rsp, 0x48
0000000145c6cf6a 5b                             pop rbx
0000000145c6cf6b 5f                             pop rdi
0000000145c6cf6c 5e                             pop rsi
0000000145c6cf6d 5d                             pop rbp
0000000145c6cf6e c3                             ret

0000000145bf3820 55                             push rbp
0000000145bf3821 56                             push rsi
0000000145bf3822 57                             push rdi
0000000145bf3823 53                             push rbx
0000000145bf3824 4883ec48                       sub rsp, 0x48
0000000145bf3828 488d6c2440                     lea rbp, [rsp + 0x40]
0000000145bf382d 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145bf3835 4889ce                         mov rsi, rcx
0000000145bf3838 488b11                         mov rdx, qword ptr [rcx]
0000000145bf383b 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145bf3845 4831d1                         xor rcx, rdx
0000000145bf3848 4885d2                         test rdx, rdx
0000000145bf384b b80a000000                     mov eax, 0xa
0000000145bf3850 480f48c1                       cmovs rax, rcx
0000000145bf3854 4883f80a                       cmp rax, 0xa
0000000145bf3858 0f8748010000                   ja 0x145bf39a6
0000000145bf385e 488d0d67e3a001                 lea rcx, [rip + 0x1a0e367]
0000000145bf3865 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145bf3869 4801c8                         add rax, rcx
0000000145bf386c ffe0                           jmp rax
0000000145bf386e 488b5608                       mov rdx, qword ptr [rsi + 8]
0000000145bf3872 4885d2                         test rdx, rdx
0000000145bf3875 0f842b010000                   je 0x145bf39a6
0000000145bf387b 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145bf387f 41b801000000                   mov r8d, 1
0000000145bf3885 4883c448                       add rsp, 0x48
0000000145bf3889 5b                             pop rbx
0000000145bf388a 5f                             pop rdi
0000000145bf388b 5e                             pop rsi
0000000145bf388c 5d                             pop rbp
0000000145bf388d e93ee940fa                     jmp 0x1400021d0
0000000145bf3892 488b5608                       mov rdx, qword ptr [rsi + 8]
0000000145bf3896 4885d2                         test rdx, rdx
0000000145bf3899 740f                           je 0x145bf38aa
0000000145bf389b 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145bf389f 41b801000000                   mov r8d, 1
0000000145bf38a5 e826e940fa                     call 0x1400021d0
0000000145bf38aa 488b5620                       mov rdx, qword ptr [rsi + 0x20]
0000000145bf38ae 4885d2                         test rdx, rdx
0000000145bf38b1 740f                           je 0x145bf38c2
0000000145bf38b3 488b4e28                       mov rcx, qword ptr [rsi + 0x28]
0000000145bf38b7 41b801000000                   mov r8d, 1
0000000145bf38bd e80ee940fa                     call 0x1400021d0
0000000145bf38c2 488b5638                       mov rdx, qword ptr [rsi + 0x38]
0000000145bf38c6 4885d2                         test rdx, rdx
0000000145bf38c9 740f                           je 0x145bf38da
0000000145bf38cb 488b4e40                       mov rcx, qword ptr [rsi + 0x40]
0000000145bf38cf 41b801000000                   mov r8d, 1
0000000145bf38d5 e8f6e840fa                     call 0x1400021d0
0000000145bf38da 488b5650                       mov rdx, qword ptr [rsi + 0x50]
0000000145bf38de 4885d2                         test rdx, rdx
0000000145bf38e1 0f84bf000000                   je 0x145bf39a6
0000000145bf38e7 488b4e58                       mov rcx, qword ptr [rsi + 0x58]
0000000145bf38eb eb92                           jmp 0x145bf387f
0000000145bf38ed 4885d2                         test rdx, rdx
0000000145bf38f0 740f                           je 0x145bf3901
0000000145bf38f2 488b4e08                       mov rcx, qword ptr [rsi + 8]
0000000145bf38f6 41b801000000                   mov r8d, 1
0000000145bf38fc e8cfe840fa                     call 0x1400021d0
0000000145bf3901 488b5618                       mov rdx, qword ptr [rsi + 0x18]
0000000145bf3905 4885d2                         test rdx, rdx
0000000145bf3908 740f                           je 0x145bf3919
0000000145bf390a 488b4e20                       mov rcx, qword ptr [rsi + 0x20]
0000000145bf390e 41b801000000                   mov r8d, 1
0000000145bf3914 e8b7e840fa                     call 0x1400021d0
0000000145bf3919 488b5630                       mov rdx, qword ptr [rsi + 0x30]
0000000145bf391d 4885d2                         test rdx, rdx
0000000145bf3920 740f                           je 0x145bf3931
0000000145bf3922 488b4e38                       mov rcx, qword ptr [rsi + 0x38]
0000000145bf3926 41b801000000                   mov r8d, 1
0000000145bf392c e89fe840fa                     call 0x1400021d0
0000000145bf3931 488b5648                       mov rdx, qword ptr [rsi + 0x48]
0000000145bf3935 4885d2                         test rdx, rdx
0000000145bf3938 746c                           je 0x145bf39a6
0000000145bf393a 488b4e50                       mov rcx, qword ptr [rsi + 0x50]
0000000145bf393e e93cffffff                     jmp 0x145bf387f
0000000145bf3943 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145bf3947 488975e8                       mov qword ptr [rbp - 0x18], rsi
0000000145bf394b 488b4618                       mov rax, qword ptr [rsi + 0x18]
0000000145bf394f 488945e0                       mov qword ptr [rbp - 0x20], rax
0000000145bf3953 48c745f000000000               mov qword ptr [rbp - 0x10], 0
0000000145bf395b 48894df8                       mov qword ptr [rbp - 8], rcx
0000000145bf395f 90                             nop
0000000145bf3960 488b45f0                       mov rax, qword ptr [rbp - 0x10]
0000000145bf3964 483945e0                       cmp qword ptr [rbp - 0x20], rax
0000000145bf3968 7419                           je 0x145bf3983
0000000145bf396a 48ffc0                         inc rax
0000000145bf396d 488945f0                       mov qword ptr [rbp - 0x10], rax
0000000145bf3971 488db1c8000000                 lea rsi, [rcx + 0xc8]
0000000145bf3978 e8f3ed90fa                     call 0x140502770
0000000145bf397d 90                             nop
0000000145bf397e 4889f1                         mov rcx, rsi
0000000145bf3981 ebdd                           jmp 0x145bf3960
0000000145bf3983 488b45e8                       mov rax, qword ptr [rbp - 0x18]
0000000145bf3987 488b4008                       mov rax, qword ptr [rax + 8]
0000000145bf398b 4885c0                         test rax, rax
0000000145bf398e 7416                           je 0x145bf39a6
0000000145bf3990 4869d0c8000000                 imul rdx, rax, 0xc8
0000000145bf3997 41b808000000                   mov r8d, 8
0000000145bf399d 488b4df8                       mov rcx, qword ptr [rbp - 8]
0000000145bf39a1 e9dffeffff                     jmp 0x145bf3885
0000000145bf39a6 4883c448                       add rsp, 0x48
0000000145bf39aa 5b                             pop rbx
0000000145bf39ab 5f                             pop rdi
0000000145bf39ac 5e                             pop rsi
0000000145bf39ad 5d                             pop rbp
0000000145bf39ae c3                             ret

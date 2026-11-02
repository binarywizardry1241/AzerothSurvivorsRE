0000000145c4ece0 4156                           push r14
0000000145c4ece2 56                             push rsi
0000000145c4ece3 57                             push rdi
0000000145c4ece4 53                             push rbx
0000000145c4ece5 4883ec28                       sub rsp, 0x28
0000000145c4ece9 4889ce                         mov rsi, rcx
0000000145c4ecec 488b11                         mov rdx, qword ptr [rcx]
0000000145c4ecef 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145c4ecf9 4831d1                         xor rcx, rdx
0000000145c4ecfc 4885d2                         test rdx, rdx
0000000145c4ecff b80a000000                     mov eax, 0xa
0000000145c4ed04 480f48c1                       cmovs rax, rcx
0000000145c4ed08 4883f80a                       cmp rax, 0xa
0000000145c4ed0c 0f8730010000                   ja 0x145c4ee42
0000000145c4ed12 488d0d7f669b01                 lea rcx, [rip + 0x19b667f]
0000000145c4ed19 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145c4ed1d 4801c8                         add rax, rcx
0000000145c4ed20 ffe0                           jmp rax
0000000145c4ed22 488b5608                       mov rdx, qword ptr [rsi + 8]
0000000145c4ed26 4885d2                         test rdx, rdx
0000000145c4ed29 0f8413010000                   je 0x145c4ee42
0000000145c4ed2f 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145c4ed33 41b801000000                   mov r8d, 1
0000000145c4ed39 4883c428                       add rsp, 0x28
0000000145c4ed3d 5b                             pop rbx
0000000145c4ed3e 5f                             pop rdi
0000000145c4ed3f 5e                             pop rsi
0000000145c4ed40 415e                           pop r14
0000000145c4ed42 e989343bfa                     jmp 0x1400021d0
0000000145c4ed47 488b5608                       mov rdx, qword ptr [rsi + 8]
0000000145c4ed4b 4885d2                         test rdx, rdx
0000000145c4ed4e 740f                           je 0x145c4ed5f
0000000145c4ed50 488b4e10                       mov rcx, qword ptr [rsi + 0x10]
0000000145c4ed54 41b801000000                   mov r8d, 1
0000000145c4ed5a e871343bfa                     call 0x1400021d0
0000000145c4ed5f 488b5620                       mov rdx, qword ptr [rsi + 0x20]
0000000145c4ed63 4885d2                         test rdx, rdx
0000000145c4ed66 740f                           je 0x145c4ed77
0000000145c4ed68 488b4e28                       mov rcx, qword ptr [rsi + 0x28]
0000000145c4ed6c 41b801000000                   mov r8d, 1
0000000145c4ed72 e859343bfa                     call 0x1400021d0
0000000145c4ed77 488b5638                       mov rdx, qword ptr [rsi + 0x38]
0000000145c4ed7b 4885d2                         test rdx, rdx
0000000145c4ed7e 740f                           je 0x145c4ed8f
0000000145c4ed80 488b4e40                       mov rcx, qword ptr [rsi + 0x40]
0000000145c4ed84 41b801000000                   mov r8d, 1
0000000145c4ed8a e841343bfa                     call 0x1400021d0
0000000145c4ed8f 488b5650                       mov rdx, qword ptr [rsi + 0x50]
0000000145c4ed93 4885d2                         test rdx, rdx
0000000145c4ed96 0f84a6000000                   je 0x145c4ee42
0000000145c4ed9c 488b4e58                       mov rcx, qword ptr [rsi + 0x58]
0000000145c4eda0 eb91                           jmp 0x145c4ed33
0000000145c4eda2 4885d2                         test rdx, rdx
0000000145c4eda5 740f                           je 0x145c4edb6
0000000145c4eda7 488b4e08                       mov rcx, qword ptr [rsi + 8]
0000000145c4edab 41b801000000                   mov r8d, 1
0000000145c4edb1 e81a343bfa                     call 0x1400021d0
0000000145c4edb6 488b5618                       mov rdx, qword ptr [rsi + 0x18]
0000000145c4edba 4885d2                         test rdx, rdx
0000000145c4edbd 740f                           je 0x145c4edce
0000000145c4edbf 488b4e20                       mov rcx, qword ptr [rsi + 0x20]
0000000145c4edc3 41b801000000                   mov r8d, 1
0000000145c4edc9 e802343bfa                     call 0x1400021d0
0000000145c4edce 488b5630                       mov rdx, qword ptr [rsi + 0x30]
0000000145c4edd2 4885d2                         test rdx, rdx
0000000145c4edd5 740f                           je 0x145c4ede6
0000000145c4edd7 488b4e38                       mov rcx, qword ptr [rsi + 0x38]
0000000145c4eddb 41b801000000                   mov r8d, 1
0000000145c4ede1 e8ea333bfa                     call 0x1400021d0
0000000145c4ede6 488b5648                       mov rdx, qword ptr [rsi + 0x48]
0000000145c4edea 4885d2                         test rdx, rdx
0000000145c4eded 7453                           je 0x145c4ee42
0000000145c4edef 488b4e50                       mov rcx, qword ptr [rsi + 0x50]
0000000145c4edf3 e93bffffff                     jmp 0x145c4ed33
0000000145c4edf8 488b7e10                       mov rdi, qword ptr [rsi + 0x10]
0000000145c4edfc 4c8b7618                       mov r14, qword ptr [rsi + 0x18]
0000000145c4ee00 4d85f6                         test r14, r14
0000000145c4ee03 741f                           je 0x145c4ee24
0000000145c4ee05 4889fb                         mov rbx, rdi
0000000145c4ee08 0f1f840000000000               nop dword ptr [rax + rax]
0000000145c4ee10 4889d9                         mov rcx, rbx
0000000145c4ee13 e858398bfa                     call 0x140502770
0000000145c4ee18 4881c3c8000000                 add rbx, 0xc8
0000000145c4ee1f 49ffce                         dec r14
0000000145c4ee22 75ec                           jne 0x145c4ee10
0000000145c4ee24 488b4608                       mov rax, qword ptr [rsi + 8]
0000000145c4ee28 4885c0                         test rax, rax
0000000145c4ee2b 7415                           je 0x145c4ee42
0000000145c4ee2d 4869d0c8000000                 imul rdx, rax, 0xc8
0000000145c4ee34 41b808000000                   mov r8d, 8
0000000145c4ee3a 4889f9                         mov rcx, rdi
0000000145c4ee3d e9f7feffff                     jmp 0x145c4ed39
0000000145c4ee42 4883c428                       add rsp, 0x28
0000000145c4ee46 5b                             pop rbx
0000000145c4ee47 5f                             pop rdi
0000000145c4ee48 5e                             pop rsi
0000000145c4ee49 415e                           pop r14
0000000145c4ee4b c3                             ret

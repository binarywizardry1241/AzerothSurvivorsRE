; 0.120.2 SHA256 80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c
0000000145c05020 56                             push rsi
0000000145c05021 57                             push rdi
0000000145c05022 53                             push rbx
0000000145c05023 4883ec20                       sub rsp, 0x20
0000000145c05027 80790801                       cmp byte ptr [rcx + 8], 1
0000000145c0502b 755d                           jne 0x145c0508a
0000000145c0502d 488b31                         mov rsi, qword ptr [rcx]
0000000145c05030 b101                           mov cl, 1
0000000145c05032 31c0                           xor eax, eax
0000000145c05034 f00fb04e10                     lock cmpxchg byte ptr [rsi + 0x10], cl
0000000145c05039 7559                           jne 0x145c05094
0000000145c0503b 488b3d36fb9202                 mov rdi, qword ptr [rip + 0x292fb36]
0000000145c05042 488b07                         mov rax, qword ptr [rdi]
0000000145c05045 48d1e0                         shl rax, 1
0000000145c05048 4885c0                         test rax, rax
0000000145c0504b 7552                           jne 0x145c0509f
0000000145c0504d 488d5e11                       lea rbx, [rsi + 0x11]
0000000145c05051 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c05055 0fb686fa010000                 movzx eax, byte ptr [rsi + 0x1fa]
0000000145c0505c 48b9ffffffffffffff7f           movabs rcx, 0x7fffffffffffffff
0000000145c05066 488b17                         mov rdx, qword ptr [rdi]
0000000145c05069 4885ca                         test rdx, rcx
0000000145c0506c 755d                           jne 0x145c050cb
0000000145c0506e 31c9                           xor ecx, ecx
0000000145c05070 864e10                         xchg byte ptr [rsi + 0x10], cl
0000000145c05073 80f902                         cmp cl, 2
0000000145c05076 7514                           jne 0x145c0508c
0000000145c05078 4883c610                       add rsi, 0x10
0000000145c0507c 4889f1                         mov rcx, rsi
0000000145c0507f 89c6                           mov esi, eax
0000000145c05081 e88ab75400                     call 0x146150810
0000000145c05086 89f0                           mov eax, esi
0000000145c05088 eb02                           jmp 0x145c0508c
0000000145c0508a 31c0                           xor eax, eax
0000000145c0508c 4883c420                       add rsp, 0x20
0000000145c05090 5b                             pop rbx
0000000145c05091 5f                             pop rdi
0000000145c05092 5e                             pop rsi
0000000145c05093 c3                             ret
0000000145c05094 488d4e10                       lea rcx, [rsi + 0x10]
0000000145c05098 e8b3b65400                     call 0x146150750
0000000145c0509d eb9c                           jmp 0x145c0503b
0000000145c0509f e83cc45400                     call 0x1461514e0
0000000145c050a4 89c1                           mov ecx, eax
0000000145c050a6 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c050aa 0fb686fa010000                 movzx eax, byte ptr [rsi + 0x1fa]
0000000145c050b1 84c9                           test cl, cl
0000000145c050b3 74b9                           je 0x145c0506e
0000000145c050b5 488d5e11                       lea rbx, [rsi + 0x11]
0000000145c050b9 48b9ffffffffffffff7f           movabs rcx, 0x7fffffffffffffff
0000000145c050c3 488b17                         mov rdx, qword ptr [rdi]
0000000145c050c6 4885ca                         test rdx, rcx
0000000145c050c9 74a3                           je 0x145c0506e
0000000145c050cb 89c7                           mov edi, eax
0000000145c050cd e80ec45400                     call 0x1461514e0
0000000145c050d2 84c0                           test al, al
0000000145c050d4 7503                           jne 0x145c050d9
0000000145c050d6 c60301                         mov byte ptr [rbx], 1
0000000145c050d9 89f8                           mov eax, edi
0000000145c050db eb91                           jmp 0x145c0506e

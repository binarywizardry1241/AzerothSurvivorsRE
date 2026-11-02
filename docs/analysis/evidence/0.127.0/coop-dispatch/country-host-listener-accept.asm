0000000145cc8db0 55                             push rbp
0000000145cc8db1 56                             push rsi
0000000145cc8db2 57                             push rdi
0000000145cc8db3 53                             push rbx
0000000145cc8db4 4883ec48                       sub rsp, 0x48
0000000145cc8db8 488d6c2440                     lea rbp, [rsp + 0x40]
0000000145cc8dbd 48c74500feffffff               mov qword ptr [rbp], 0xfffffffffffffffe
0000000145cc8dc5 488b39                         mov rdi, qword ptr [rcx]
0000000145cc8dc8 b101                           mov cl, 1
0000000145cc8dca 31c0                           xor eax, eax
0000000145cc8dcc f00fb04f10                     lock cmpxchg byte ptr [rdi + 0x10], cl
0000000145cc8dd1 0f85ff000000                   jne 0x145cc8ed6
0000000145cc8dd7 488b358a5d9902                 mov rsi, qword ptr [rip + 0x2995d8a]
0000000145cc8dde 488b06                         mov rax, qword ptr [rsi]
0000000145cc8de1 48d1e0                         shl rax, 1
0000000145cc8de4 4885c0                         test rax, rax
0000000145cc8de7 0f85f7000000                   jne 0x145cc8ee4
0000000145cc8ded c745fc00000000                 mov dword ptr [rbp - 4], 0
0000000145cc8df4 0fb64711                       movzx eax, byte ptr [rdi + 0x11]
0000000145cc8df8 488d4f18                       lea rcx, [rdi + 0x18]
0000000145cc8dfc 48897df0                       mov qword ptr [rbp - 0x10], rdi
0000000145cc8e00 e87be9feff                     call 0x145cb7780
0000000145cc8e05 90                             nop 
0000000145cc8e06 488b5df0                       mov rbx, qword ptr [rbp - 0x10]
0000000145cc8e0a 488b4350                       mov rax, qword ptr [rbx + 0x50]
0000000145cc8e0e 4885c0                         test rax, rax
0000000145cc8e11 0f848e000000                   je 0x145cc8ea5
0000000145cc8e17 488b4b48                       mov rcx, qword ptr [rbx + 0x48]
0000000145cc8e1b 488d5101                       lea rdx, [rcx + 1]
0000000145cc8e1f 4c8b4338                       mov r8, qword ptr [rbx + 0x38]
0000000145cc8e23 4c8b4b40                       mov r9, qword ptr [rbx + 0x40]
0000000145cc8e27 4531d2                         xor r10d, r10d
0000000145cc8e2a 4c39c2                         cmp rdx, r8
0000000145cc8e2d 4d0f43d0                       cmovae r10, r8
0000000145cc8e31 49f7da                         neg r10
0000000145cc8e34 4a8d1411                       lea rdx, [rcx + r10]
0000000145cc8e38 48ffc2                         inc rdx
0000000145cc8e3b 48895348                       mov qword ptr [rbx + 0x48], rdx
0000000145cc8e3f 48ffc8                         dec rax
0000000145cc8e42 48894350                       mov qword ptr [rbx + 0x50], rax
0000000145cc8e46 418b3c89                       mov edi, dword ptr [r9 + rcx*4]
0000000145cc8e4a f048ff03                       lock inc qword ptr [rbx]
0000000145cc8e4e 0f8eaf000000                   jle 0x145cc8f03
0000000145cc8e54 48895de0                       mov qword ptr [rbp - 0x20], rbx
0000000145cc8e58 897de8                         mov dword ptr [rbp - 0x18], edi
0000000145cc8e5b e8a09333fa                     call 0x140002200
0000000145cc8e60 b910000000                     mov ecx, 0x10
0000000145cc8e65 ba08000000                     mov edx, 8
0000000145cc8e6a e8519333fa                     call 0x1400021c0
0000000145cc8e6f 4885c0                         test rax, rax
0000000145cc8e72 747f                           je 0x145cc8ef3
0000000145cc8e74 488918                         mov qword ptr [rax], rbx
0000000145cc8e77 897808                         mov dword ptr [rax + 8], edi
0000000145cc8e7a 807dfc00                       cmp byte ptr [rbp - 4], 0
0000000145cc8e7e 750b                           jne 0x145cc8e8b
0000000145cc8e80 488b0e                         mov rcx, qword ptr [rsi]
0000000145cc8e83 48d1e1                         shl rcx, 1
0000000145cc8e86 4885c9                         test rcx, rcx
0000000145cc8e89 757a                           jne 0x145cc8f05
0000000145cc8e8b 31c9                           xor ecx, ecx
0000000145cc8e8d 864b10                         xchg byte ptr [rbx + 0x10], cl
0000000145cc8e90 80f902                         cmp cl, 2
0000000145cc8e93 742d                           je 0x145cc8ec2
0000000145cc8e95 488d15c43da501                 lea rdx, [rip + 0x1a53dc4]
0000000145cc8e9c 4883c448                       add rsp, 0x48
0000000145cc8ea0 5b                             pop rbx
0000000145cc8ea1 5f                             pop rdi
0000000145cc8ea2 5e                             pop rsi
0000000145cc8ea3 5d                             pop rbp
0000000145cc8ea4 c3                             ret 
0000000145cc8ea5 807dfc00                       cmp byte ptr [rbp - 4], 0
0000000145cc8ea9 750b                           jne 0x145cc8eb6
0000000145cc8eab 488b06                         mov rax, qword ptr [rsi]
0000000145cc8eae 48d1e0                         shl rax, 1
0000000145cc8eb1 4885c0                         test rax, rax
0000000145cc8eb4 756d                           jne 0x145cc8f23
0000000145cc8eb6 31c0                           xor eax, eax
0000000145cc8eb8 31c9                           xor ecx, ecx
0000000145cc8eba 864b10                         xchg byte ptr [rbx + 0x10], cl
0000000145cc8ebd 80f902                         cmp cl, 2
0000000145cc8ec0 75d3                           jne 0x145cc8e95
0000000145cc8ec2 4883c310                       add rbx, 0x10
0000000145cc8ec6 4889d9                         mov rcx, rbx
0000000145cc8ec9 4889c6                         mov rsi, rax
0000000145cc8ecc e8ffe15300                     call 0x1462070d0
0000000145cc8ed1 4889f0                         mov rax, rsi
0000000145cc8ed4 ebbf                           jmp 0x145cc8e95
0000000145cc8ed6 488d4f10                       lea rcx, [rdi + 0x10]
0000000145cc8eda e831e15300                     call 0x146207010
0000000145cc8edf e9f3feffff                     jmp 0x145cc8dd7
0000000145cc8ee4 e8b7ee5300                     call 0x146207da0
0000000145cc8ee9 3401                           xor al, 1
0000000145cc8eeb 8945fc                         mov dword ptr [rbp - 4], eax
0000000145cc8eee e901ffffff                     jmp 0x145cc8df4
0000000145cc8ef3 b908000000                     mov ecx, 8
0000000145cc8ef8 ba10000000                     mov edx, 0x10
0000000145cc8efd e84ffa5300                     call 0x146208951
0000000145cc8f02 90                             nop 
0000000145cc8f03 0f0b                           ud2 
0000000145cc8f05 4889c6                         mov rsi, rax
0000000145cc8f08 e893ee5300                     call 0x146207da0
0000000145cc8f0d 89c1                           mov ecx, eax
0000000145cc8f0f 4889f0                         mov rax, rsi
0000000145cc8f12 84c9                           test cl, cl
0000000145cc8f14 0f8571ffffff                   jne 0x145cc8e8b
0000000145cc8f1a c6431101                       mov byte ptr [rbx + 0x11], 1
0000000145cc8f1e e968ffffff                     jmp 0x145cc8e8b
0000000145cc8f23 e878ee5300                     call 0x146207da0
0000000145cc8f28 84c0                           test al, al
0000000145cc8f2a 758a                           jne 0x145cc8eb6
0000000145cc8f2c c6431101                       mov byte ptr [rbx + 0x11], 1
0000000145cc8f30 eb84                           jmp 0x145cc8eb6

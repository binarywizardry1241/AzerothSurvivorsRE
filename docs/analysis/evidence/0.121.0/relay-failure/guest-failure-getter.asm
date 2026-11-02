0000000145c64be0 56                             push rsi
0000000145c64be1 57                             push rdi
0000000145c64be2 4883ec28                       sub rsp, 0x28
0000000145c64be6 488b31                         mov rsi, qword ptr [rcx]
0000000145c64be9 b101                           mov cl, 1
0000000145c64beb 31c0                           xor eax, eax
0000000145c64bed f00fb04e10                     lock cmpxchg byte ptr [rsi + 0x10], cl
0000000145c64bf2 7537                           jne 0x145c64c2b
0000000145c64bf4 488b3d7d1f9602                 mov rdi, qword ptr [rip + 0x2961f7d]
0000000145c64bfb 488b07                         mov rax, qword ptr [rdi]
0000000145c64bfe 48d1e0                         shl rax, 1
0000000145c64c01 4885c0                         test rax, rax
0000000145c64c04 7530                           jne 0x145c64c36
0000000145c64c06 31c9                           xor ecx, ecx
0000000145c64c08 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c64c0c 48837e78ff                     cmp qword ptr [rsi + 0x78], -1
0000000145c64c11 7438                           je 0x145c64c4b
0000000145c64c13 80be5901000000                 cmp byte ptr [rsi + 0x159], 0
0000000145c64c1a 742f                           je 0x145c64c4b
0000000145c64c1c 0fb68658010000                 movzx eax, byte ptr [rsi + 0x158]
0000000145c64c23 3401                           xor al, 1
0000000145c64c25 84c9                           test cl, cl
0000000145c64c27 7428                           je 0x145c64c51
0000000145c64c29 eb38                           jmp 0x145c64c63
0000000145c64c2b 488d4e10                       lea rcx, [rsi + 0x10]
0000000145c64c2f e82cdb5200                     call 0x146192760
0000000145c64c34 ebbe                           jmp 0x145c64bf4
0000000145c64c36 e8b5e85200                     call 0x1461934f0
0000000145c64c3b 89c1                           mov ecx, eax
0000000145c64c3d 80f101                         xor cl, 1
0000000145c64c40 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145c64c44 48837e78ff                     cmp qword ptr [rsi + 0x78], -1
0000000145c64c49 75c8                           jne 0x145c64c13
0000000145c64c4b 31c0                           xor eax, eax
0000000145c64c4d 84c9                           test cl, cl
0000000145c64c4f 7512                           jne 0x145c64c63
0000000145c64c51 48b9ffffffffffffff7f           movabs rcx, 0x7fffffffffffffff
0000000145c64c5b 488b17                         mov rdx, qword ptr [rdi]
0000000145c64c5e 4885ca                         test rdx, rcx
0000000145c64c61 7528                           jne 0x145c64c8b
0000000145c64c63 31c9                           xor ecx, ecx
0000000145c64c65 864e10                         xchg byte ptr [rsi + 0x10], cl
0000000145c64c68 80f902                         cmp cl, 2
0000000145c64c6b 7407                           je 0x145c64c74
0000000145c64c6d 4883c428                       add rsp, 0x28
0000000145c64c71 5f                             pop rdi
0000000145c64c72 5e                             pop rsi
0000000145c64c73 c3                             ret
0000000145c64c74 4883c610                       add rsi, 0x10
0000000145c64c78 4889f1                         mov rcx, rsi
0000000145c64c7b 89c6                           mov esi, eax
0000000145c64c7d e89edb5200                     call 0x146192820
0000000145c64c82 89f0                           mov eax, esi
0000000145c64c84 4883c428                       add rsp, 0x28
0000000145c64c88 5f                             pop rdi
0000000145c64c89 5e                             pop rsi
0000000145c64c8a c3                             ret
0000000145c64c8b 89c7                           mov edi, eax
0000000145c64c8d e85ee85200                     call 0x1461934f0
0000000145c64c92 89c1                           mov ecx, eax
0000000145c64c94 89f8                           mov eax, edi
0000000145c64c96 84c9                           test cl, cl
0000000145c64c98 75c9                           jne 0x145c64c63
0000000145c64c9a c6461101                       mov byte ptr [rsi + 0x11], 1
0000000145c64c9e ebc3                           jmp 0x145c64c63

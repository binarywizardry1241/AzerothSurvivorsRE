0000000145b74870 56                             push rsi
0000000145b74871 57                             push rdi
0000000145b74872 4883ec28                       sub rsp, 0x28
0000000145b74876 488b31                         mov rsi, qword ptr [rcx]
0000000145b74879 b101                           mov cl, 1
0000000145b7487b 31c0                           xor eax, eax
0000000145b7487d f00fb04e10                     lock cmpxchg byte ptr [rsi + 0x10], cl
0000000145b74882 7537                           jne 0x145b748bb
0000000145b74884 488b3ded329c02                 mov rdi, qword ptr [rip + 0x29c32ed]
0000000145b7488b 488b07                         mov rax, qword ptr [rdi]
0000000145b7488e 48d1e0                         shl rax, 1
0000000145b74891 4885c0                         test rax, rax
0000000145b74894 7530                           jne 0x145b748c6
0000000145b74896 31c9                           xor ecx, ecx
0000000145b74898 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145b7489c 48837e78ff                     cmp qword ptr [rsi + 0x78], -1
0000000145b748a1 7438                           je 0x145b748db
0000000145b748a3 80be5901000000                 cmp byte ptr [rsi + 0x159], 0
0000000145b748aa 742f                           je 0x145b748db
0000000145b748ac 0fb68658010000                 movzx eax, byte ptr [rsi + 0x158]
0000000145b748b3 3401                           xor al, 1
0000000145b748b5 84c9                           test cl, cl
0000000145b748b7 7428                           je 0x145b748e1
0000000145b748b9 eb38                           jmp 0x145b748f3
0000000145b748bb 488d4e10                       lea rcx, [rsi + 0x10]
0000000145b748bf e8fcdf5d00                     call 0x1461528c0
0000000145b748c4 ebbe                           jmp 0x145b74884
0000000145b748c6 e885ed5d00                     call 0x146153650
0000000145b748cb 89c1                           mov ecx, eax
0000000145b748cd 80f101                         xor cl, 1
0000000145b748d0 0fb64611                       movzx eax, byte ptr [rsi + 0x11]
0000000145b748d4 48837e78ff                     cmp qword ptr [rsi + 0x78], -1
0000000145b748d9 75c8                           jne 0x145b748a3
0000000145b748db 31c0                           xor eax, eax
0000000145b748dd 84c9                           test cl, cl
0000000145b748df 7512                           jne 0x145b748f3
0000000145b748e1 48b9ffffffffffffff7f           movabs rcx, 0x7fffffffffffffff
0000000145b748eb 488b17                         mov rdx, qword ptr [rdi]
0000000145b748ee 4885ca                         test rdx, rcx
0000000145b748f1 7528                           jne 0x145b7491b
0000000145b748f3 31c9                           xor ecx, ecx
0000000145b748f5 864e10                         xchg byte ptr [rsi + 0x10], cl
0000000145b748f8 80f902                         cmp cl, 2
0000000145b748fb 7407                           je 0x145b74904
0000000145b748fd 4883c428                       add rsp, 0x28
0000000145b74901 5f                             pop rdi
0000000145b74902 5e                             pop rsi
0000000145b74903 c3                             ret
0000000145b74904 4883c610                       add rsi, 0x10
0000000145b74908 4889f1                         mov rcx, rsi
0000000145b7490b 89c6                           mov esi, eax
0000000145b7490d e86ee05d00                     call 0x146152980
0000000145b74912 89f0                           mov eax, esi
0000000145b74914 4883c428                       add rsp, 0x28
0000000145b74918 5f                             pop rdi
0000000145b74919 5e                             pop rsi
0000000145b7491a c3                             ret
0000000145b7491b 89c7                           mov edi, eax
0000000145b7491d e82eed5d00                     call 0x146153650
0000000145b74922 89c1                           mov ecx, eax
0000000145b74924 89f8                           mov eax, edi
0000000145b74926 84c9                           test cl, cl
0000000145b74928 75c9                           jne 0x145b748f3
0000000145b7492a c6461101                       mov byte ptr [rsi + 0x11], 1
0000000145b7492e ebc3                           jmp 0x145b748f3

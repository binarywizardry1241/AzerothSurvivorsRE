0000000145b9e8de 45897405f8                     mov dword ptr [r13 + rax - 8], r14d
0000000145b9e8e3 8b4de4                         mov ecx, dword ptr [rbp - 0x1c]
0000000145b9e8e6 f3410f1174ddfc                 movss dword ptr [r13 + rbx*8 - 4], xmm6
0000000145b9e8ed 84c9                           test cl, cl
0000000145b9e8ef 750b                           jne 0x145b9e8fc
0000000145b9e8f1 498b07                         mov rax, qword ptr [r15]
0000000145b9e8f4 48d1e0                         shl rax, 1
0000000145b9e8f7 4885c0                         test rax, rax
0000000145b9e8fa 7563                           jne 0x145b9e95f
0000000145b9e8fc 31c0                           xor eax, eax
0000000145b9e8fe 4186442410                     xchg byte ptr [r12 + 0x10], al
0000000145b9e903 3c02                           cmp al, 2
0000000145b9e905 744a                           je 0x145b9e951
0000000145b9e907 48c706ffffffff                 mov qword ptr [rsi], 0xffffffffffffffff
0000000145b9e90e 31c0                           xor eax, eax
0000000145b9e910 e9b5fdffff                     jmp 0x145b9e6ca

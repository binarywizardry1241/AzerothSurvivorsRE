0000000145c30b31 4c8db648100000                 lea r14, [rsi + 0x1048]
0000000145c30b38 4883be48100000ff               cmp qword ptr [rsi + 0x1048], -1
0000000145c30b40 7408                           je 0x145c30b4a
0000000145c30b42 4c89f1                         mov rcx, r14
0000000145c30b45 e85695ebff                     call 0x145aea0a0
0000000145c30b4a 488d55b0                       lea rdx, [rbp - 0x50]
0000000145c30b4e 41b8c8000000                   mov r8d, 0xc8
0000000145c30b54 4c89f1                         mov rcx, r14
0000000145c30b57 e8ef443d00                     call 0x14600504b
0000000145c30b5c 4983ffff                       cmp r15, -1
0000000145c30b60 7446                           je 0x145c30ba8
0000000145c30b62 4c89bd08050000                 mov qword ptr [rbp + 0x508], r15
0000000145c30b69 4889f1                         mov rcx, rsi
0000000145c30b6c 89da                           mov edx, ebx
0000000145c30b6e 4c89a5f8040000                 mov qword ptr [rbp + 0x4f8], r12
0000000145c30b75 4d89e0                         mov r8, r12
0000000145c30b78 4989f9                         mov r9, rdi
0000000145c30b7b e84085ffff                     call 0x145c290c0
0000000145c30b80 90                             nop
0000000145c30b81 4889f1                         mov rcx, rsi
0000000145c30b84 e8976cffff                     call 0x145c27820
0000000145c30b89 90                             nop

0000000145b4ef60 56                             push rsi
0000000145b4ef61 57                             push rdi
0000000145b4ef62 4883ec28                       sub rsp, 0x28
0000000145b4ef66 4889d6                         mov rsi, rdx
0000000145b4ef69 4889cf                         mov rdi, rcx
0000000145b4ef6c e89f000000                     call 0x145b4f010
0000000145b4ef71 4885c0                         test rax, rax
0000000145b4ef74 480f44c7                       cmove rax, rdi
0000000145b4ef78 480f44d6                       cmove rdx, rsi
0000000145b4ef7c 4883c428                       add rsp, 0x28
0000000145b4ef80 5f                             pop rdi
0000000145b4ef81 5e                             pop rsi
0000000145b4ef82 c3                             ret

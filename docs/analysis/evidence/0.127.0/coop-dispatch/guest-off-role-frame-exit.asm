0000000145bb5830 488b87980d0000                 mov rax, qword ptr [rdi + 0xd98]
0000000145bb5837 4883e802                       sub rax, 2
0000000145bb583b 490f42c6                       cmovb rax, r14
0000000145bb583f 4885c0                         test rax, rax
0000000145bb5842 4889fe                         mov rsi, rdi
0000000145bb5845 0f842a0c0000                   je 0x145bb6475
0000000145bb584b 4883f801                       cmp rax, 1
0000000145bb584f 0f850a010000                   jne 0x145bb595f

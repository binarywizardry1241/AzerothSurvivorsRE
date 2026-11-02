0000000145b92820 84db                           test bl, bl
0000000145b92822 7471                           je 0x145b92895
0000000145b92824 488bb5300b0000                 mov rsi, qword ptr [rbp + 0xb30]
0000000145b9282b 4885f6                         test rsi, rsi
0000000145b9282e 488d9dd0040000                 lea rbx, [rbp + 0x4d0]
0000000145b92835 0f8819020000                   js 0x145b92a54

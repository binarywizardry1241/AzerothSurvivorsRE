0000000145b220fe 83f801                         cmp eax, 1
0000000145b22101 4c89ad40300000                 mov qword ptr [rbp + 0x3040], r13
0000000145b22108 0f870c010000                   ja 0x145b2221a
0000000145b2210e 488b9e98100000                 mov rbx, qword ptr [rsi + 0x1098]
0000000145b22115 4885db                         test rbx, rbx
0000000145b22118 0f84fc000000                   je 0x145b2221a
0000000145b2211e 488bbea0100000                 mov rdi, qword ptr [rsi + 0x10a0]
0000000145b22125 c686c510000001                 mov byte ptr [rsi + 0x10c5], 1
0000000145b2212c 488b8e88100000                 mov rcx, qword ptr [rsi + 0x1088]
0000000145b22133 488b9690100000                 mov rdx, qword ptr [rsi + 0x1090]
0000000145b2213a 4c8d86700d0000                 lea r8, [rsi + 0xd70]
0000000145b22141 e87a400400                     call 0x145b661c0

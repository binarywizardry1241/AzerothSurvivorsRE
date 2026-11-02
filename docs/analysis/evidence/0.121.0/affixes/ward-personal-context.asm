0000000145c1db92 80bd4003000000                 cmp byte ptr [rbp + 0x340], 0
0000000145c1db99 741b                           je 0x145c1dbb6
0000000145c1db9b 488b8568020000                 mov rax, qword ptr [rbp + 0x268]
0000000145c1dba2 488b8db0030000                 mov rcx, qword ptr [rbp + 0x3b0]
0000000145c1dba9 483981f8000000                 cmp qword ptr [rcx + 0xf8], rax
0000000145c1dbb0 0f85fafaffff                   jne 0x145c1d6b0

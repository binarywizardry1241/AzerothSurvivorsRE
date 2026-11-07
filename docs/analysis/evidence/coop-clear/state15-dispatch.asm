0000000145c2f6d8 488b02                         mov rax, qword ptr [rdx]
0000000145c2f6db 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145c2f6e5 4831c1                         xor rcx, rax
0000000145c2f6e8 4885c0                         test rax, rax
0000000145c2f6eb b803000000                     mov eax, 3
0000000145c2f6f0 480f48c1                       cmovs rax, rcx
0000000145c2f6f4 488985e0040000                 mov qword ptr [rbp + 0x4e0], rax
0000000145c2f6fb 48ffc8                         dec rax
0000000145c2f6fe 4883f813                       cmp rax, 0x13
0000000145c2f702 0f87cc120000                   ja 0x145c309d4
0000000145c2f708 660f28f2                       movapd xmm6, xmm2
0000000145c2f70c 488d0dd1d5a701                 lea rcx, [rip + 0x1a7d5d1]
0000000145c2f713 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145c2f717 4801c8                         add rax, rcx
0000000145c2f71a ffe0                           jmp rax

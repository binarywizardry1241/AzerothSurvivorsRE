0000000145cb7c31 4889f8                         mov rax, rdi
0000000145cb7c34 48b90000000000000080           movabs rcx, 0x8000000000000000
0000000145cb7c3e 4831c8                         xor rax, rcx
0000000145cb7c41 4885ff                         test rdi, rdi
0000000145cb7c44 b90a000000                     mov ecx, 0xa
0000000145cb7c49 480f49c1                       cmovns rax, rcx
0000000145cb7c4d 48ffc8                         dec rax
0000000145cb7c50 4883f80c                       cmp rax, 0xc
0000000145cb7c54 0f8777070000                   ja 0x145cb83d1
0000000145cb7c5a 488d0d5751a601                 lea rcx, [rip + 0x1a65157]
0000000145cb7c61 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145cb7c65 4801c8                         add rax, rcx
0000000145cb7c68 ffe0                           jmp rax

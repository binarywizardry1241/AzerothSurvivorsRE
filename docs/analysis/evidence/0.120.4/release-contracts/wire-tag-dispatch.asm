0000000145e0cfa2 0fb602                         movzx eax, byte ptr [rdx]
0000000145e0cfa5 83c0ec                         add eax, -0x14
0000000145e0cfa8 83f80c                         cmp eax, 0xc
0000000145e0cfab 774e                           ja 0x145e0cffb
0000000145e0cfad 488d0d08b48601                 lea rcx, [rip + 0x186b408]
0000000145e0cfb4 48630481                       movsxd rax, dword ptr [rcx + rax*4]
0000000145e0cfb8 4801c8                         add rax, rcx
0000000145e0cfbb ffe0                           jmp rax

0000000145b54dca 41807d6401                     cmp byte ptr [r13 + 0x64], 1
0000000145b54dcf 488bbd38020000                 mov rdi, qword ptr [rbp + 0x238]
0000000145b54dd6 4c8ba5b8010000                 mov r12, qword ptr [rbp + 0x1b8]
0000000145b54ddd 0f8504030000                   jne 0x145b550e7
0000000145b54de3 80bfa80b000000                 cmp byte ptr [rdi + 0xba8], 0
0000000145b54dea 0f85f7020000                   jne 0x145b550e7
0000000145b54df0 c787a80b000001000000           mov dword ptr [rdi + 0xba8], 1
0000000145b54dfa f3440f11afac0b0000             movss dword ptr [rdi + 0xbac], xmm13
0000000145b54e03 e9df020000                     jmp 0x145b550e7

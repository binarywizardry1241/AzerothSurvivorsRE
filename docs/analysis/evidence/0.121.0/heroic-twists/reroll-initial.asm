0000000145bdcf30 31c0                           xor eax, eax
0000000145bdcf32 80bd6110000003                 cmp byte ptr [rbp + 0x1061], 3
0000000145bdcf39 0f92c0                         setb al
0000000145bdcf3c f3450f10bf80000000             movss xmm15, dword ptr [r15 + 0x80]
0000000145bdcf45 f3450f10b784000000             movss xmm14, dword ptr [r15 + 0x84]
0000000145bdcf4e 418b8d08010000                 mov ecx, dword ptr [r13 + 0x108]
0000000145bdcf55 8d7c4101                       lea edi, [rcx + rax*2 + 1]

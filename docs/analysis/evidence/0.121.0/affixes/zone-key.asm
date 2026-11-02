0000000145a9c190 4883c2fe                       add rdx, -2
0000000145a9c194 4883fa06                       cmp rdx, 6
0000000145a9c198 0f87fa000000                   ja 0x145a9c298
0000000145a9c19e 488d05efbf5201                 lea rax, [rip + 0x152bfef]
0000000145a9c1a5 48631490                       movsxd rdx, dword ptr [rax + rdx*4]
0000000145a9c1a9 4801c2                         add rdx, rax
0000000145a9c1ac ffe2                           jmp rdx
0000000145a9c1ae 6681396162                     cmp word ptr [rcx], 0x6261
0000000145a9c1b3 0f84e2000000                   je 0x145a9c29b
0000000145a9c1b9 668139736d                     cmp word ptr [rcx], 0x6d73
0000000145a9c1be 0f84e9000000                   je 0x145a9c2ad
0000000145a9c1c4 6681396176                     cmp word ptr [rcx], 0x7661
0000000145a9c1c9 0f84e4000000                   je 0x145a9c2b3
0000000145a9c1cf 6681396171                     cmp word ptr [rcx], 0x7161
0000000145a9c1d4 0f85be000000                   jne 0x145a9c298
0000000145a9c1da b80a000000                     mov eax, 0xa
0000000145a9c1df c3                             ret
0000000145a9c1e0 b8656c7779                     mov eax, 0x79776c65
0000000145a9c1e5 3301                           xor eax, dword ptr [rcx]
0000000145a9c1e7 0fb75104                       movzx edx, word ptr [rcx + 4]
0000000145a9c1eb 81f26e6e0000                   xor edx, 0x6e6e
0000000145a9c1f1 09c2                           or edx, eax
0000000145a9c1f3 0f849f000000                   je 0x145a9c298
0000000145a9c1f9 b8756e676f                     mov eax, 0x6f676e75
0000000145a9c1fe 3301                           xor eax, dword ptr [rcx]
0000000145a9c200 0fb74904                       movzx ecx, word ptr [rcx + 4]
0000000145a9c204 81f1726f0000                   xor ecx, 0x6f72
0000000145a9c20a 09c1                           or ecx, eax
0000000145a9c20c 0f8586000000                   jne 0x145a9c298
0000000145a9c212 b803000000                     mov eax, 3
0000000145a9c217 c3                             ret
0000000145a9c218 31d2                           xor edx, edx
0000000145a9c21a 81396e617878                   cmp dword ptr [rcx], 0x7878616e
0000000145a9c220 b80b000000                     mov eax, 0xb
0000000145a9c225 480f45c2                       cmovne rax, rdx
0000000145a9c229 c3                             ret
0000000145a9c22a b86172656e                     mov eax, 0x6e657261
0000000145a9c22f 3301                           xor eax, dword ptr [rcx]
0000000145a9c231 0fb64904                       movzx ecx, byte ptr [rcx + 4]
0000000145a9c235 83f161                         xor ecx, 0x61
0000000145a9c238 09c1                           or ecx, eax
0000000145a9c23a 755c                           jne 0x145a9c298
0000000145a9c23c b806000000                     mov eax, 6
0000000145a9c241 c3                             ret
0000000145a9c242 0fb701                         movzx eax, word ptr [rcx]
0000000145a9c245 3577730000                     xor eax, 0x7377
0000000145a9c24a 0fb65102                       movzx edx, byte ptr [rcx + 2]
0000000145a9c24e 83f267                         xor edx, 0x67
0000000145a9c251 6609c2                         or dx, ax
0000000145a9c254 744b                           je 0x145a9c2a1
0000000145a9c256 0fb701                         movzx eax, word ptr [rcx]
0000000145a9c259 3562720000                     xor eax, 0x7262
0000000145a9c25e 0fb64902                       movzx ecx, byte ptr [rcx + 2]
0000000145a9c262 83f16d                         xor ecx, 0x6d
0000000145a9c265 6609c1                         or cx, ax
0000000145a9c268 752e                           jne 0x145a9c298
0000000145a9c26a b809000000                     mov eax, 9
0000000145a9c26f c3                             ret
0000000145a9c270 b866657261                     mov eax, 0x61726566
0000000145a9c275 3301                           xor eax, dword ptr [rcx]
0000000145a9c277 ba616c6173                     mov edx, 0x73616c61
0000000145a9c27c 335103                         xor edx, dword ptr [rcx + 3]
0000000145a9c27f 09c2                           or edx, eax
0000000145a9c281 7515                           jne 0x145a9c298
0000000145a9c283 b805000000                     mov eax, 5
0000000145a9c288 c3                             ret
0000000145a9c289 48b86475736b776f6f64           movabs rax, 0x646f6f776b737564
0000000145a9c293 483901                         cmp qword ptr [rcx], rax
0000000145a9c296 740f                           je 0x145a9c2a7
0000000145a9c298 31c0                           xor eax, eax
0000000145a9c29a c3                             ret
0000000145a9c29b b804000000                     mov eax, 4
0000000145a9c2a0 c3                             ret
0000000145a9c2a1 b802000000                     mov eax, 2
0000000145a9c2a6 c3                             ret
0000000145a9c2a7 b801000000                     mov eax, 1
0000000145a9c2ac c3                             ret
0000000145a9c2ad b807000000                     mov eax, 7
0000000145a9c2b2 c3                             ret
0000000145a9c2b3 b808000000                     mov eax, 8
0000000145a9c2b8 c3                             ret

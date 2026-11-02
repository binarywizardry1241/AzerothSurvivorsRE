0000000145b05300 4883c2fe                       add rdx, -2
0000000145b05304 4883fa06                       cmp rdx, 6
0000000145b05308 0f87fa000000                   ja 0x145b05408
0000000145b0530e 488d05c7ef5301                 lea rax, [rip + 0x153efc7]
0000000145b05315 48631490                       movsxd rdx, dword ptr [rax + rdx*4]
0000000145b05319 4801c2                         add rdx, rax
0000000145b0531c ffe2                           jmp rdx
0000000145b0531e 6681396162                     cmp word ptr [rcx], 0x6261
0000000145b05323 0f84e2000000                   je 0x145b0540b
0000000145b05329 668139736d                     cmp word ptr [rcx], 0x6d73
0000000145b0532e 0f84e9000000                   je 0x145b0541d
0000000145b05334 6681396176                     cmp word ptr [rcx], 0x7661
0000000145b05339 0f84e4000000                   je 0x145b05423
0000000145b0533f 6681396171                     cmp word ptr [rcx], 0x7161
0000000145b05344 0f85be000000                   jne 0x145b05408
0000000145b0534a b80a000000                     mov eax, 0xa
0000000145b0534f c3                             ret 
0000000145b05350 b8656c7779                     mov eax, 0x79776c65
0000000145b05355 3301                           xor eax, dword ptr [rcx]
0000000145b05357 0fb75104                       movzx edx, word ptr [rcx + 4]
0000000145b0535b 81f26e6e0000                   xor edx, 0x6e6e
0000000145b05361 09c2                           or edx, eax
0000000145b05363 0f849f000000                   je 0x145b05408
0000000145b05369 b8756e676f                     mov eax, 0x6f676e75
0000000145b0536e 3301                           xor eax, dword ptr [rcx]
0000000145b05370 0fb74904                       movzx ecx, word ptr [rcx + 4]
0000000145b05374 81f1726f0000                   xor ecx, 0x6f72
0000000145b0537a 09c1                           or ecx, eax
0000000145b0537c 0f8586000000                   jne 0x145b05408
0000000145b05382 b803000000                     mov eax, 3
0000000145b05387 c3                             ret 
0000000145b05388 31d2                           xor edx, edx
0000000145b0538a 81396e617878                   cmp dword ptr [rcx], 0x7878616e
0000000145b05390 b80b000000                     mov eax, 0xb
0000000145b05395 480f45c2                       cmovne rax, rdx
0000000145b05399 c3                             ret 
0000000145b0539a b86172656e                     mov eax, 0x6e657261
0000000145b0539f 3301                           xor eax, dword ptr [rcx]
0000000145b053a1 0fb64904                       movzx ecx, byte ptr [rcx + 4]
0000000145b053a5 83f161                         xor ecx, 0x61
0000000145b053a8 09c1                           or ecx, eax
0000000145b053aa 755c                           jne 0x145b05408
0000000145b053ac b806000000                     mov eax, 6
0000000145b053b1 c3                             ret 
0000000145b053b2 0fb701                         movzx eax, word ptr [rcx]
0000000145b053b5 3577730000                     xor eax, 0x7377
0000000145b053ba 0fb65102                       movzx edx, byte ptr [rcx + 2]
0000000145b053be 83f267                         xor edx, 0x67
0000000145b053c1 6609c2                         or dx, ax
0000000145b053c4 744b                           je 0x145b05411
0000000145b053c6 0fb701                         movzx eax, word ptr [rcx]
0000000145b053c9 3562720000                     xor eax, 0x7262
0000000145b053ce 0fb64902                       movzx ecx, byte ptr [rcx + 2]
0000000145b053d2 83f16d                         xor ecx, 0x6d
0000000145b053d5 6609c1                         or cx, ax
0000000145b053d8 752e                           jne 0x145b05408
0000000145b053da b809000000                     mov eax, 9
0000000145b053df c3                             ret 
0000000145b053e0 b866657261                     mov eax, 0x61726566
0000000145b053e5 3301                           xor eax, dword ptr [rcx]
0000000145b053e7 ba616c6173                     mov edx, 0x73616c61
0000000145b053ec 335103                         xor edx, dword ptr [rcx + 3]
0000000145b053ef 09c2                           or edx, eax
0000000145b053f1 7515                           jne 0x145b05408
0000000145b053f3 b805000000                     mov eax, 5
0000000145b053f8 c3                             ret 
0000000145b053f9 48b86475736b776f6f64           movabs rax, 0x646f6f776b737564
0000000145b05403 483901                         cmp qword ptr [rcx], rax
0000000145b05406 740f                           je 0x145b05417
0000000145b05408 31c0                           xor eax, eax
0000000145b0540a c3                             ret 
0000000145b0540b b804000000                     mov eax, 4
0000000145b05410 c3                             ret 
0000000145b05411 b802000000                     mov eax, 2
0000000145b05416 c3                             ret 
0000000145b05417 b801000000                     mov eax, 1
0000000145b0541c c3                             ret 
0000000145b0541d b807000000                     mov eax, 7
0000000145b05422 c3                             ret 
0000000145b05423 b808000000                     mov eax, 8
0000000145b05428 c3                             ret 

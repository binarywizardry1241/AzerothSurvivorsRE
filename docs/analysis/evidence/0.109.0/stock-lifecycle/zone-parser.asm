0x14588d0d0: 4883c2fe                 add rdx, -2
0x14588d0d4: 4883fa06                 cmp rdx, 6
0x14588d0d8: 0f87fa000000             ja 0x14588d1d8
0x14588d0de: 488d056bac3501           lea rax, [rip + 0x135ac6b]
0x14588d0e5: 48631490                 movsxd rdx, dword ptr [rax + rdx*4]
0x14588d0e9: 4801c2                   add rdx, rax
0x14588d0ec: ffe2                     jmp rdx
0x14588d0ee: 6681396162               cmp word ptr [rcx], 0x6261
0x14588d0f3: 0f84e2000000             je 0x14588d1db
0x14588d0f9: 668139736d               cmp word ptr [rcx], 0x6d73
0x14588d0fe: 0f84e9000000             je 0x14588d1ed
0x14588d104: 6681396176               cmp word ptr [rcx], 0x7661
0x14588d109: 0f84e4000000             je 0x14588d1f3
0x14588d10f: 6681396171               cmp word ptr [rcx], 0x7161
0x14588d114: 0f85be000000             jne 0x14588d1d8
0x14588d11a: b80a000000               mov eax, 0xa
0x14588d11f: c3                       ret
0x14588d120: b8656c7779               mov eax, 0x79776c65
0x14588d125: 3301                     xor eax, dword ptr [rcx]
0x14588d127: 0fb75104                 movzx edx, word ptr [rcx + 4]
0x14588d12b: 81f26e6e0000             xor edx, 0x6e6e
0x14588d131: 09c2                     or edx, eax
0x14588d133: 0f849f000000             je 0x14588d1d8
0x14588d139: b8756e676f               mov eax, 0x6f676e75
0x14588d13e: 3301                     xor eax, dword ptr [rcx]
0x14588d140: 0fb74904                 movzx ecx, word ptr [rcx + 4]
0x14588d144: 81f1726f0000             xor ecx, 0x6f72
0x14588d14a: 09c1                     or ecx, eax
0x14588d14c: 0f8586000000             jne 0x14588d1d8
0x14588d152: b803000000               mov eax, 3
0x14588d157: c3                       ret
0x14588d158: 31d2                     xor edx, edx
0x14588d15a: 81396e617878             cmp dword ptr [rcx], 0x7878616e
0x14588d160: b80b000000               mov eax, 0xb
0x14588d165: 480f45c2                 cmovne rax, rdx
0x14588d169: c3                       ret
0x14588d16a: b86172656e               mov eax, 0x6e657261
0x14588d16f: 3301                     xor eax, dword ptr [rcx]
0x14588d171: 0fb64904                 movzx ecx, byte ptr [rcx + 4]
0x14588d175: 83f161                   xor ecx, 0x61
0x14588d178: 09c1                     or ecx, eax
0x14588d17a: 755c                     jne 0x14588d1d8
0x14588d17c: b806000000               mov eax, 6
0x14588d181: c3                       ret
0x14588d182: 0fb701                   movzx eax, word ptr [rcx]
0x14588d185: 3577730000               xor eax, 0x7377
0x14588d18a: 0fb65102                 movzx edx, byte ptr [rcx + 2]
0x14588d18e: 83f267                   xor edx, 0x67
0x14588d191: 6609c2                   or dx, ax
0x14588d194: 744b                     je 0x14588d1e1
0x14588d196: 0fb701                   movzx eax, word ptr [rcx]
0x14588d199: 3562720000               xor eax, 0x7262
0x14588d19e: 0fb64902                 movzx ecx, byte ptr [rcx + 2]
0x14588d1a2: 83f16d                   xor ecx, 0x6d
0x14588d1a5: 6609c1                   or cx, ax
0x14588d1a8: 752e                     jne 0x14588d1d8
0x14588d1aa: b809000000               mov eax, 9
0x14588d1af: c3                       ret
0x14588d1b0: b866657261               mov eax, 0x61726566
0x14588d1b5: 3301                     xor eax, dword ptr [rcx]
0x14588d1b7: ba616c6173               mov edx, 0x73616c61
0x14588d1bc: 335103                   xor edx, dword ptr [rcx + 3]
0x14588d1bf: 09c2                     or edx, eax
0x14588d1c1: 7515                     jne 0x14588d1d8
0x14588d1c3: b805000000               mov eax, 5
0x14588d1c8: c3                       ret
0x14588d1c9: 48b86475736b776f6f64     movabs rax, 0x646f6f776b737564
0x14588d1d3: 483901                   cmp qword ptr [rcx], rax
0x14588d1d6: 740f                     je 0x14588d1e7
0x14588d1d8: 31c0                     xor eax, eax
0x14588d1da: c3                       ret
0x14588d1db: b804000000               mov eax, 4
0x14588d1e0: c3                       ret
0x14588d1e1: b802000000               mov eax, 2
0x14588d1e6: c3                       ret
0x14588d1e7: b801000000               mov eax, 1
0x14588d1ec: c3                       ret
0x14588d1ed: b807000000               mov eax, 7
0x14588d1f2: c3                       ret
0x14588d1f3: b808000000               mov eax, 8
0x14588d1f8: c3                       ret

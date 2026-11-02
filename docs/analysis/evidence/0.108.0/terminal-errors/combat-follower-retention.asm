000000014592b66b  0f8424010000             je 0x14592b795
000000014592b671  498b85d8000000           mov rax, qword ptr [r13 + 0xd8]
000000014592b678  4885c0                   test rax, rax
000000014592b67b  0f8421010000             je 0x14592b7a2
000000014592b681  498b95d0000000           mov rdx, qword ptr [r13 + 0xd0]
000000014592b688  4c8bb528030000           mov r14, qword ptr [rbp + 0x328]
000000014592b68f  4989d8                   mov r8, rbx
000000014592b692  49c1e004                 shl r8, 4
000000014592b696  31c9                     xor ecx, ecx
000000014592b698  4c6bc978                 imul r9, rcx, 0x78
000000014592b69c  4e8b4c0a20               mov r9, qword ptr [rdx + r9 + 0x20]
000000014592b6a1  4531d2                   xor r10d, r10d
000000014592b6a4  6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
000000014592b6b0  4d39d0                   cmp r8, r10
000000014592b6b3  740c                     je 0x14592b6c1
000000014592b6b5  4f390c16                 cmp qword ptr [r14 + r10], r9
000000014592b6b9  4d8d5210                 lea r10, [r10 + 0x10]
000000014592b6bd  75f1                     jne 0x14592b6b0
000000014592b6bf  eb2c                     jmp 0x14592b6ed
000000014592b6c1  48ffc1                   inc rcx
000000014592b6c4  4839c1                   cmp rcx, rax
000000014592b6c7  75cf                     jne 0x14592b698
000000014592b6c9  e9db000000               jmp 0x14592b7a9
000000014592b6ce  41bf08000000             mov r15d, 8
000000014592b6d4  48c785b003000000000000   mov qword ptr [rbp + 0x3b0], 0
000000014592b6df  4885f6                   test rsi, rsi
000000014592b6e2  0f85e9f5ffff             jne 0x14592acd1
000000014592b6e8  e9f2f5ffff               jmp 0x14592acdf
000000014592b6ed  4c8d4901                 lea r9, [rcx + 1]
000000014592b6f1  4939c1                   cmp r9, rax
000000014592b6f4  726f                     jb 0x14592b765
000000014592b6f6  49898dd8000000           mov qword ptr [r13 + 0xd8], rcx
000000014592b6fd  e9a7000000               jmp 0x14592b7a9
000000014592b702  4c6bd978                 imul r11, rcx, 0x78
000000014592b706  498b7270                 mov rsi, qword ptr [r10 + 0x70]
000000014592b70a  4a89741a70               mov qword ptr [rdx + r11 + 0x70], rsi
000000014592b70f  410f104260               movups xmm0, xmmword ptr [r10 + 0x60]
000000014592b714  420f11441a60             movups xmmword ptr [rdx + r11 + 0x60], xmm0
000000014592b71a  410f104250               movups xmm0, xmmword ptr [r10 + 0x50]
000000014592b71f  420f11441a50             movups xmmword ptr [rdx + r11 + 0x50], xmm0
000000014592b725  410f104240               movups xmm0, xmmword ptr [r10 + 0x40]
000000014592b72a  420f11441a40             movups xmmword ptr [rdx + r11 + 0x40], xmm0
000000014592b730  410f1002                 movups xmm0, xmmword ptr [r10]
000000014592b734  410f104a10               movups xmm1, xmmword ptr [r10 + 0x10]
000000014592b739  410f105220               movups xmm2, xmmword ptr [r10 + 0x20]
000000014592b73e  410f105a30               movups xmm3, xmmword ptr [r10 + 0x30]
000000014592b743  420f115c1a30             movups xmmword ptr [rdx + r11 + 0x30], xmm3
000000014592b749  420f11541a20             movups xmmword ptr [rdx + r11 + 0x20], xmm2
000000014592b74f  420f114c1a10             movups xmmword ptr [rdx + r11 + 0x10], xmm1
000000014592b755  420f11041a               movups xmmword ptr [rdx + r11], xmm0
000000014592b75a  48ffc1                   inc rcx
000000014592b75d  49ffc1                   inc r9
000000014592b760  4939c1                   cmp r9, rax
000000014592b763  7491                     je 0x14592b6f6
000000014592b765  4d6bd978                 imul r11, r9, 0x78
000000014592b769  4e8d141a                 lea r10, [rdx + r11]
000000014592b76d  4e8b5c1a20               mov r11, qword ptr [rdx + r11 + 0x20]
000000014592b772  31f6                     xor esi, esi
000000014592b774  6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
000000014592b780  4939f0                   cmp r8, rsi
000000014592b783  0f8479ffffff             je 0x14592b702
000000014592b789  4d391c36                 cmp qword ptr [r14 + rsi], r11
000000014592b78d  488d7610                 lea rsi, [rsi + 0x10]
000000014592b791  75ed                     jne 0x14592b780
000000014592b793  ebc8                     jmp 0x14592b75d

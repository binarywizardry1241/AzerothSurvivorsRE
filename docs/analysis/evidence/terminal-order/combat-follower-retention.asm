14593235b: 0f8424010000             je 0x145932485
145932361: 498b85d8000000           mov rax, qword ptr [r13 + 0xd8]
145932368: 4885c0                   test rax, rax
14593236b: 0f8421010000             je 0x145932492
145932371: 498b95d0000000           mov rdx, qword ptr [r13 + 0xd0]
145932378: 4c8bb528030000           mov r14, qword ptr [rbp + 0x328]
14593237f: 4989d8                   mov r8, rbx
145932382: 49c1e004                 shl r8, 4
145932386: 31c9                     xor ecx, ecx
145932388: 4c6bc978                 imul r9, rcx, 0x78
14593238c: 4e8b4c0a20               mov r9, qword ptr [rdx + r9 + 0x20]
145932391: 4531d2                   xor r10d, r10d
145932394: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459323a0: 4d39d0                   cmp r8, r10
1459323a3: 740c                     je 0x1459323b1
1459323a5: 4f390c16                 cmp qword ptr [r14 + r10], r9
1459323a9: 4d8d5210                 lea r10, [r10 + 0x10]
1459323ad: 75f1                     jne 0x1459323a0
1459323af: eb2c                     jmp 0x1459323dd
1459323b1: 48ffc1                   inc rcx
1459323b4: 4839c1                   cmp rcx, rax
1459323b7: 75cf                     jne 0x145932388
1459323b9: e9db000000               jmp 0x145932499
1459323be: 41bf08000000             mov r15d, 8
1459323c4: 48c785b003000000000000   mov qword ptr [rbp + 0x3b0], 0
1459323cf: 4885f6                   test rsi, rsi
1459323d2: 0f85e9f5ffff             jne 0x1459319c1
1459323d8: e9f2f5ffff               jmp 0x1459319cf
1459323dd: 4c8d4901                 lea r9, [rcx + 1]
1459323e1: 4939c1                   cmp r9, rax
1459323e4: 726f                     jb 0x145932455
1459323e6: 49898dd8000000           mov qword ptr [r13 + 0xd8], rcx
1459323ed: e9a7000000               jmp 0x145932499
1459323f2: 4c6bd978                 imul r11, rcx, 0x78
1459323f6: 498b7270                 mov rsi, qword ptr [r10 + 0x70]
1459323fa: 4a89741a70               mov qword ptr [rdx + r11 + 0x70], rsi
1459323ff: 410f104260               movups xmm0, xmmword ptr [r10 + 0x60]
145932404: 420f11441a60             movups xmmword ptr [rdx + r11 + 0x60], xmm0
14593240a: 410f104250               movups xmm0, xmmword ptr [r10 + 0x50]
14593240f: 420f11441a50             movups xmmword ptr [rdx + r11 + 0x50], xmm0
145932415: 410f104240               movups xmm0, xmmword ptr [r10 + 0x40]
14593241a: 420f11441a40             movups xmmword ptr [rdx + r11 + 0x40], xmm0
145932420: 410f1002                 movups xmm0, xmmword ptr [r10]
145932424: 410f104a10               movups xmm1, xmmword ptr [r10 + 0x10]
145932429: 410f105220               movups xmm2, xmmword ptr [r10 + 0x20]
14593242e: 410f105a30               movups xmm3, xmmword ptr [r10 + 0x30]
145932433: 420f115c1a30             movups xmmword ptr [rdx + r11 + 0x30], xmm3
145932439: 420f11541a20             movups xmmword ptr [rdx + r11 + 0x20], xmm2
14593243f: 420f114c1a10             movups xmmword ptr [rdx + r11 + 0x10], xmm1
145932445: 420f11041a               movups xmmword ptr [rdx + r11], xmm0
14593244a: 48ffc1                   inc rcx
14593244d: 49ffc1                   inc r9
145932450: 4939c1                   cmp r9, rax
145932453: 7491                     je 0x1459323e6
145932455: 4d6bd978                 imul r11, r9, 0x78
145932459: 4e8d141a                 lea r10, [rdx + r11]
14593245d: 4e8b5c1a20               mov r11, qword ptr [rdx + r11 + 0x20]
145932462: 31f6                     xor esi, esi
145932464: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145932470: 4939f0                   cmp r8, rsi
145932473: 0f8479ffffff             je 0x1459323f2
145932479: 4d391c36                 cmp qword ptr [r14 + rsi], r11
14593247d: 488d7610                 lea rsi, [rsi + 0x10]
145932481: 75ed                     jne 0x145932470
145932483: ebc8                     jmp 0x14593244d

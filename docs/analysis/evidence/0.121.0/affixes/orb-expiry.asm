0000000145c2238d 418b0424                       mov eax, dword ptr [r12]
0000000145c22391 83f8ff                         cmp eax, -1
0000000145c22394 0f8401f7ffff                   je 0x145c21a9b
0000000145c2239a 458b7c2404                     mov r15d, dword ptr [r12 + 4]
0000000145c2239f 498b7c2408                     mov rdi, qword ptr [r12 + 8]
0000000145c223a4 4d8b6c2410                     mov r13, qword ptr [r12 + 0x10]
0000000145c223a9 f2450f10642418                 movsd xmm12, qword ptr [r12 + 0x18]
0000000145c223b0 f3450f106c2420                 movss xmm13, dword ptr [r12 + 0x20]
0000000145c223b7 410fb64c2424                   movzx ecx, byte ptr [r12 + 0x24]
0000000145c223bd 4c89ad78010000                 mov qword ptr [rbp + 0x178], r13
0000000145c223c4 83f803                         cmp eax, 3
0000000145c223c7 0f8503020000                   jne 0x145c225d0
0000000145c223cd f6c101                         test cl, 1
0000000145c223d0 74ae                           je 0x145c22380
0000000145c223d2 66410f6ef7                     movd xmm6, r15d
0000000145c223d7 488b85a8030000                 mov rax, qword ptr [rbp + 0x3a8]
0000000145c223de 488b88b8050000                 mov rcx, qword ptr [rax + 0x5b8]
0000000145c223e5 486980c0050000e0010000         imul rax, qword ptr [rax + 0x5c0], 0x1e0
0000000145c223f0 4885c0                         test rax, rax
0000000145c223f3 0f8416010000                   je 0x145c2250f
0000000145c223f9 4889ca                         mov rdx, rcx
0000000145c223fc 4881c1e0010000                 add rcx, 0x1e0
0000000145c22403 480520feffff                   add rax, -0x1e0
0000000145c22409 4c39aaf0000000                 cmp qword ptr [rdx + 0xf0], r13
0000000145c22410 75de                           jne 0x145c223f0
0000000145c22412 f682b000000001                 test byte ptr [rdx + 0xb0], 1
0000000145c22419 75d5                           jne 0x145c223f0
0000000145c2241b 440f13a544020000               movlps qword ptr [rbp + 0x244], xmm12
0000000145c22423 f3440f11ad4c020000             movss dword ptr [rbp + 0x24c], xmm13
0000000145c2242c c7854002000001000000           mov dword ptr [rbp + 0x240], 1
0000000145c22436 c7851803000000000000           mov dword ptr [rbp + 0x318], 0
0000000145c22440 488d8518030000                 lea rax, [rbp + 0x318]
0000000145c22447 4889442430                     mov qword ptr [rsp + 0x30], rax
0000000145c2244c 4c89742428                     mov qword ptr [rsp + 0x28], r14
0000000145c22451 48c744242000000000             mov qword ptr [rsp + 0x20], 0
0000000145c2245a 41b908000000                   mov r9d, 8
0000000145c22460 488d8dc0020000                 lea rcx, [rbp + 0x2c0]
0000000145c22467 4c89ea                         mov rdx, r13
0000000145c2246a 41b8fb4f0000                   mov r8d, 0x4ffb
0000000145c22470 e84b5bf6ff                     call 0x145b87fc0
0000000145c22475 90                             nop
0000000145c22476 488b85a8030000                 mov rax, qword ptr [rbp + 0x3a8]
0000000145c2247d 488bb080060000                 mov rsi, qword ptr [rax + 0x680]
0000000145c22484 483bb070060000                 cmp rsi, qword ptr [rax + 0x670]
0000000145c2248b 750d                           jne 0x145c2249a
0000000145c2248d 488b8db0030000                 mov rcx, qword ptr [rbp + 0x3b0]
0000000145c22494 e837a23c00                     call 0x145fec6d0
0000000145c22499 90                             nop
0000000145c2249a 488b95a8030000                 mov rdx, qword ptr [rbp + 0x3a8]
0000000145c224a1 488b8278060000                 mov rax, qword ptr [rdx + 0x678]
0000000145c224a8 4889f1                         mov rcx, rsi
0000000145c224ab 48c1e105                       shl rcx, 5
0000000145c224af 0f1085c0020000                 movups xmm0, xmmword ptr [rbp + 0x2c0]
0000000145c224b6 0f108dd0020000                 movups xmm1, xmmword ptr [rbp + 0x2d0]
0000000145c224bd 0f114c0810                     movups xmmword ptr [rax + rcx + 0x10], xmm1
0000000145c224c2 0f110408                       movups xmmword ptr [rax + rcx], xmm0
0000000145c224c6 48ffc6                         inc rsi
0000000145c224c9 4889b280060000                 mov qword ptr [rdx + 0x680], rsi
0000000145c224d0 80ba2f0d000001                 cmp byte ptr [rdx + 0xd2f], 1
0000000145c224d7 7536                           jne 0x145c2250f
0000000145c224d9 488b8da8030000                 mov rcx, qword ptr [rbp + 0x3a8]
0000000145c224e0 f30f59b1c8040000               mulss xmm6, dword ptr [rcx + 0x4c8]
0000000145c224e8 410f28c3                       movaps xmm0, xmm11
0000000145c224ec f30f5c81e8040000               subss xmm0, dword ptr [rcx + 0x4e8]
0000000145c224f4 f30f5f05b85d5700               maxss xmm0, dword ptr [rip + 0x575db8]
0000000145c224fc f30f5ef0                       divss xmm6, xmm0
0000000145c22500 0f28ce                         movaps xmm1, xmm6
0000000145c22503 4d89e8                         mov r8, r13
0000000145c22506 4531c9                         xor r9d, r9d
0000000145c22509 e8e2b7faff                     call 0x145bcdcf0
0000000145c2250e 90                             nop
0000000145c2250f 488b8da8000000                 mov rcx, qword ptr [rbp + 0xa8]
0000000145c22516 488d9578010000                 lea rdx, [rbp + 0x178]
0000000145c2251d e8be570400                     call 0x145c67ce0
0000000145c22522 90                             nop
0000000145c22523 e8d8fc3dfa                     call 0x140002200
0000000145c22528 b920000000                     mov ecx, 0x20
0000000145c2252d ba01000000                     mov edx, 1
0000000145c22532 e889fc3dfa                     call 0x1400021c0
0000000145c22537 4885c0                         test rax, rax
0000000145c2253a 0f8475020000                   je 0x145c227b5
0000000145c22540 4c8928                         mov qword ptr [rax], r13
0000000145c22543 488b8da8030000                 mov rcx, qword ptr [rbp + 0x3a8]
0000000145c2254a 488bb180060000                 mov rsi, qword ptr [rcx + 0x680]
0000000145c22551 483bb170060000                 cmp rsi, qword ptr [rcx + 0x670]
0000000145c22558 751b                           jne 0x145c22575
0000000145c2255a 48898598030000                 mov qword ptr [rbp + 0x398], rax
0000000145c22561 488b8db0030000                 mov rcx, qword ptr [rbp + 0x3b0]
0000000145c22568 e863a13c00                     call 0x145fec6d0
0000000145c2256d 90                             nop
0000000145c2256e 488b8598030000                 mov rax, qword ptr [rbp + 0x398]
0000000145c22575 488b95a8030000                 mov rdx, qword ptr [rbp + 0x3a8]
0000000145c2257c 4c8b8278060000                 mov r8, qword ptr [rdx + 0x678]
0000000145c22583 4889f1                         mov rcx, rsi
0000000145c22586 48c1e105                       shl rcx, 5
0000000145c2258a 49c7040820000000               mov qword ptr [r8 + rcx], 0x20
0000000145c22592 4989440808                     mov qword ptr [r8 + rcx + 8], rax
0000000145c22597 49c744081008000000             mov qword ptr [r8 + rcx + 0x10], 8
0000000145c225a0 6641c7440818aa00               mov word ptr [r8 + rcx + 0x18], 0xaa
0000000145c225a8 48ffc6                         inc rsi
0000000145c225ab 4889b280060000                 mov qword ptr [rdx + 0x680], rsi
0000000145c225b2 4983c428                       add r12, 0x28
0000000145c225b6 4939dc                         cmp r12, rbx
0000000145c225b9 0f85cefdffff                   jne 0x145c2238d

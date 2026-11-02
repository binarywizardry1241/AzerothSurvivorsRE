1458af562 837e1002 cmp dword ptr [rsi + 0x10], 2
1458af566 0f840bffffff je 0x1458af477
1458af56c 4881bea0100000ffffff00 cmp qword ptr [rsi + 0x10a0], 0xffffff
1458af577 0f843e110000 je 0x1458b06bb
1458af57d 80bed00a000000 cmp byte ptr [rsi + 0xad0], 0
1458af584 0f8531110000 jne 0x1458b06bb
1458af58a 8bbe64070000 mov edi, dword ptr [rsi + 0x764]
1458af590 448bb674070000 mov r14d, dword ptr [rsi + 0x774]
1458af597 448bbe6c070000 mov r15d, dword ptr [rsi + 0x76c]
1458af59e 448ba670070000 mov r12d, dword ptr [rsi + 0x770]
1458af5a5 448bae78070000 mov r13d, dword ptr [rsi + 0x778]
1458af5ac 0fb69e14030000 movzx ebx, byte ptr [rsi + 0x314]
1458af5b3 488b8ea0020000 mov rcx, qword ptr [rsi + 0x2a0]
1458af5ba 488b96a8020000 mov rdx, qword ptr [rsi + 0x2a8]
1458af5c1 e80adbfdff call 0x14588d0d0
1458af5c6 31c9 xor ecx, ecx
1458af5c8 4189f8 mov r8d, edi
1458af5cb 442b8624110000 sub r8d, dword ptr [rsi + 0x1124]
1458af5d2 440f42c1 cmovb r8d, ecx
1458af5d6 4c0386b00c0000 add r8, qword ptr [rsi + 0xcb0]
1458af5dd 4c8d8e200b0000 lea r9, [rsi + 0xb20]
1458af5e4 48c7c2ffffffff mov rdx, 0xffffffffffffffff
1458af5eb 4c0f42c2 cmovb r8, rdx
1458af5ef 4c8986b00c0000 mov qword ptr [rsi + 0xcb0], r8
1458af5f6 4589f0 mov r8d, r14d
1458af5f9 442b8628110000 sub r8d, dword ptr [rsi + 0x1128]
1458af600 440f42c1 cmovb r8d, ecx
1458af604 4c0386b80c0000 add r8, qword ptr [rsi + 0xcb8]
1458af60b 4c0f42c2 cmovb r8, rdx
1458af60f 4c8986b80c0000 mov qword ptr [rsi + 0xcb8], r8
1458af616 4589f8 mov r8d, r15d
1458af619 442b862c110000 sub r8d, dword ptr [rsi + 0x112c]
1458af620 440f42c1 cmovb r8d, ecx
1458af624 4c0386c00c0000 add r8, qword ptr [rsi + 0xcc0]
1458af62b 4c0f42c2 cmovb r8, rdx
1458af62f 4c8986c00c0000 mov qword ptr [rsi + 0xcc0], r8
1458af636 4589e0 mov r8d, r12d
1458af639 442b8630110000 sub r8d, dword ptr [rsi + 0x1130]
1458af640 440f42c1 cmovb r8d, ecx
1458af644 4c0386c80c0000 add r8, qword ptr [rsi + 0xcc8]
1458af64b 4c0f42c2 cmovb r8, rdx
1458af64f 4c8986c80c0000 mov qword ptr [rsi + 0xcc8], r8
1458af656 4589e8 mov r8d, r13d
1458af659 442b8634110000 sub r8d, dword ptr [rsi + 0x1134]
1458af660 440f42c1 cmovb r8d, ecx
1458af664 4c0386e00c0000 add r8, qword ptr [rsi + 0xce0]
1458af66b 4c0f42c2 cmovb r8, rdx
1458af66f 83be8009000000 cmp dword ptr [rsi + 0x980], 0
1458af676 4c8986e00c0000 mov qword ptr [rsi + 0xce0], r8
1458af67d 89be24110000 mov dword ptr [rsi + 0x1124], edi
1458af683 4489b628110000 mov dword ptr [rsi + 0x1128], r14d
1458af68a 4489be2c110000 mov dword ptr [rsi + 0x112c], r15d
1458af691 4489a630110000 mov dword ptr [rsi + 0x1130], r12d
1458af698 4489ae34110000 mov dword ptr [rsi + 0x1134], r13d

145aad347 488d8d00040000 lea rcx, [rbp + 0x400]
145aad34e e81d9b3400 call 0x145df6e70
145aad353 90 nop
145aad354 84c0 test al, al
145aad356 0f84a20d0000 je 0x145aae0fe
145aad35c 488db500040000 lea rsi, [rbp + 0x400]
145aad363 ba06000000 mov edx, 6
145aad368 4889f1 mov rcx, rsi
145aad36b e8409c3400 call 0x145df6fb0
145aad370 90 nop
145aad371 4883f805 cmp rax, 5
145aad375 b905000000 mov ecx, 5
145aad37a 480f42c8 cmovb rcx, rax
145aad37e 48c785e800000000000000 mov qword ptr [rbp + 0xe8], 0
145aad389 48898df0000000 mov qword ptr [rbp + 0xf0], rcx
145aad390 4889b5e0000000 mov qword ptr [rbp + 0xe0], rsi
145aad397 488d8dd8030000 lea rcx, [rbp + 0x3d8]
145aad39e 488d95e0000000 lea rdx, [rbp + 0xe0]
145aad3a5 e886e11800 call 0x145c3b530
145aad3aa 90 nop
145aad3ab 488d8d00040000 lea rcx, [rbp + 0x400]
145aad3b2 e8199a3400 call 0x145df6dd0
145aad3b7 90 nop
145aad3b8 89c6 mov esi, eax
145aad3ba 488d8d00040000 lea rcx, [rbp + 0x400]
145aad3c1 e8aa9a3400 call 0x145df6e70
145aad3c6 90 nop
145aad3c7 488b8de8030000 mov rcx, qword ptr [rbp + 0x3e8]
145aad3ce 48898da0000000 mov qword ptr [rbp + 0xa0], rcx
145aad3d5 f30f6f85d8030000 movdqu xmm0, xmmword ptr [rbp + 0x3d8]
145aad3dd 660f7f8590000000 movdqa xmmword ptr [rbp + 0x90], xmm0
145aad3e5 89b5c0000000 mov dword ptr [rbp + 0xc0], esi
145aad3eb 48c785a800000000000000 mov qword ptr [rbp + 0xa8], 0
145aad3f6 48c785b000000008000000 mov qword ptr [rbp + 0xb0], 8
145aad401 48c785b800000000000000 mov qword ptr [rbp + 0xb8], 0
145aad40c 8885c4000000 mov byte ptr [rbp + 0xc4], al
145aad412 488dbd00040000 lea rdi, [rbp + 0x400]
145aad419 ba0c000000 mov edx, 0xc
145aad41e 4889f9 mov rcx, rdi
145aad421 e88a9b3400 call 0x145df6fb0
145aad426 48898528040000 mov qword ptr [rbp + 0x428], rax
145aad42d 4531ed xor r13d, r13d
145aad430 eb65 jmp 0x145aad497
145aad432 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145aad440 49ffc5 inc r13
145aad443 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
145aad44a 4b8d0ca4 lea rcx, [r12 + r12*4]
145aad44e 488b9538040000 mov rdx, qword ptr [rbp + 0x438]
145aad455 488914c8 mov qword ptr [rax + rcx*8], rdx
145aad459 488b9530040000 mov rdx, qword ptr [rbp + 0x430]
145aad460 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
145aad465 48897cc810 mov qword ptr [rax + rcx*8 + 0x10], rdi
145aad46a 8b9548040000 mov edx, dword ptr [rbp + 0x448]
145aad470 8954c818 mov dword ptr [rax + rcx*8 + 0x18], edx
145aad474 8974c81c mov dword ptr [rax + rcx*8 + 0x1c], esi
145aad478 448874c820 mov byte ptr [rax + rcx*8 + 0x20], r14b
145aad47d 885cc821 mov byte ptr [rax + rcx*8 + 0x21], bl
145aad481 44887cc822 mov byte ptr [rax + rcx*8 + 0x22], r15b
145aad486 49ffc4 inc r12
145aad489 4c89a5b8000000 mov qword ptr [rbp + 0xb8], r12
145aad490 488dbd00040000 lea rdi, [rbp + 0x400]
145aad497 4c3bad28040000 cmp r13, qword ptr [rbp + 0x428]
145aad49e 0f8381090000 jae 0x145aade25
145aad4a4 4889f9 mov rcx, rdi
145aad4a7 e824993400 call 0x145df6dd0
145aad4ac 898548040000 mov dword ptr [rbp + 0x448], eax
145aad4b2 4889f9 mov rcx, rdi
145aad4b5 e816993400 call 0x145df6dd0
145aad4ba 90 nop
145aad4bb 89c6 mov esi, eax
145aad4bd 4889f9 mov rcx, rdi
145aad4c0 e81b963400 call 0x145df6ae0
145aad4c5 90 nop
145aad4c6 4188c6 mov r14b, al
145aad4c9 4889f9 mov rcx, rdi
145aad4cc e80f963400 call 0x145df6ae0
145aad4d1 90 nop
145aad4d2 3c04 cmp al, 4
145aad4d4 0fb6d8 movzx ebx, al
145aad4d7 b800000000 mov eax, 0
145aad4dc 0f43d8 cmovae ebx, eax
145aad4df 4889f9 mov rcx, rdi
145aad4e2 e889993400 call 0x145df6e70
145aad4e7 90 nop
145aad4e8 4188c7 mov r15b, al
145aad4eb ba06000000 mov edx, 6
145aad4f0 4889f9 mov rcx, rdi
145aad4f3 e8b89a3400 call 0x145df6fb0
145aad4f8 90 nop
145aad4f9 4883f805 cmp rax, 5
145aad4fd b905000000 mov ecx, 5
145aad502 480f43c1 cmovae rax, rcx
145aad506 48c785e800000000000000 mov qword ptr [rbp + 0xe8], 0
145aad511 488985f0000000 mov qword ptr [rbp + 0xf0], rax
145aad518 4889bde0000000 mov qword ptr [rbp + 0xe0], rdi
145aad51f 488d8dd8030000 lea rcx, [rbp + 0x3d8]
145aad526 488d95e0000000 lea rdx, [rbp + 0xe0]
145aad52d e8fedf1800 call 0x145c3b530
145aad532 90 nop
145aad533 488b85d8030000 mov rax, qword ptr [rbp + 0x3d8]
145aad53a 48898538040000 mov qword ptr [rbp + 0x438], rax
145aad541 488b85e0030000 mov rax, qword ptr [rbp + 0x3e0]
145aad548 48898530040000 mov qword ptr [rbp + 0x430], rax
145aad54f 488bbde8030000 mov rdi, qword ptr [rbp + 0x3e8]
145aad556 4c8ba5b8000000 mov r12, qword ptr [rbp + 0xb8]
145aad55d 4c3ba5a8000000 cmp r12, qword ptr [rbp + 0xa8]
145aad564 0f85d6feffff jne 0x145aad440
145aad56a 488d8da8000000 lea rcx, [rbp + 0xa8]
145aad571 e82a6f4e00 call 0x145f944a0
145aad576 90 nop

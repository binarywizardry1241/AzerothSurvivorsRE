0000000145ec29b8 80bda001000000                 cmp byte ptr [rbp + 0x1a0], 0
0000000145ec29bf 747f                           je 0x145ec2a40
0000000145ec29c1 49c1e420                       shl r12, 0x20
0000000145ec29c5 4489f8                         mov eax, r15d
0000000145ec29c8 4c09e0                         or rax, r12
0000000145ec29cb 49c1e520                       shl r13, 0x20
0000000145ec29cf 4489d1                         mov ecx, r10d
0000000145ec29d2 4c09e9                         or rcx, r13
0000000145ec29d5 488b5540                       mov rdx, qword ptr [rbp + 0x40]
0000000145ec29d9 4c8b8580010000                 mov r8, qword ptr [rbp + 0x180]
0000000145ec29e0 49895070                       mov qword ptr [r8 + 0x70], rdx
0000000145ec29e4 0f284530                       movaps xmm0, xmmword ptr [rbp + 0x30]
0000000145ec29e8 410f114060                     movups xmmword ptr [r8 + 0x60], xmm0
0000000145ec29ed 4d8930                         mov qword ptr [r8], r14
0000000145ec29f0 49894008                       mov qword ptr [r8 + 8], rax
0000000145ec29f4 49897810                       mov qword ptr [r8 + 0x10], rdi
0000000145ec29f8 49897018                       mov qword ptr [r8 + 0x18], rsi
0000000145ec29fc 49894820                       mov qword ptr [r8 + 0x20], rcx
0000000145ec2a00 4c89c1                         mov rcx, r8
0000000145ec2a03 4d894828                       mov qword ptr [r8 + 0x28], r9
0000000145ec2a07 488b8568010000                 mov rax, qword ptr [rbp + 0x168]
0000000145ec2a0e 49894030                       mov qword ptr [r8 + 0x30], rax
0000000145ec2a12 488b85a8010000                 mov rax, qword ptr [rbp + 0x1a8]
0000000145ec2a19 49894038                       mov qword ptr [r8 + 0x38], rax
0000000145ec2a1d 4d895840                       mov qword ptr [r8 + 0x40], r11
0000000145ec2a21 488b8560010000                 mov rax, qword ptr [rbp + 0x160]
0000000145ec2a28 49894048                       mov qword ptr [r8 + 0x48], rax
0000000145ec2a2c 49895850                       mov qword ptr [r8 + 0x50], rbx
0000000145ec2a30 488b8570010000                 mov rax, qword ptr [rbp + 0x170]
0000000145ec2a37 49894058                       mov qword ptr [r8 + 0x58], rax
0000000145ec2a3b e909020000                     jmp 0x145ec2c49
0000000145ec2a40 488b8580010000                 mov rax, qword ptr [rbp + 0x180]
0000000145ec2a47 48c700ffffffff                 mov qword ptr [rax], 0xffffffffffffffff

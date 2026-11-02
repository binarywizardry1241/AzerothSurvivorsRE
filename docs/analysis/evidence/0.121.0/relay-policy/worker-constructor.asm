0000000145c562f0 55                             push rbp
0000000145c562f1 4157                           push r15
0000000145c562f3 4156                           push r14
0000000145c562f5 4155                           push r13
0000000145c562f7 4154                           push r12
0000000145c562f9 56                             push rsi
0000000145c562fa 57                             push rdi
0000000145c562fb 53                             push rbx
0000000145c562fc 4881ecb8030000                 sub rsp, 0x3b8
0000000145c56303 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145c5630b 0f29b520030000                 movaps xmmword ptr [rbp + 0x320], xmm6
0000000145c56312 4883e480                       and rsp, 0xffffffffffffff80
0000000145c56316 4889e3                         mov rbx, rsp
0000000145c56319 4889ab90030000                 mov qword ptr [rbx + 0x390], rbp
0000000145c56320 48c78518030000feffffff         mov qword ptr [rbp + 0x318], 0xfffffffffffffffe
0000000145c5632b 4d89c5                         mov r13, r8
0000000145c5632e 4989d4                         mov r12, rdx
0000000145c56331 4889ce                         mov rsi, rcx
0000000145c56334 48c7830003000001000000         mov qword ptr [rbx + 0x300], 1
0000000145c5633f 48c7830803000001000000         mov qword ptr [rbx + 0x308], 1
0000000145c5634a c6831003000000                 mov byte ptr [rbx + 0x310], 0
0000000145c56351 66c783800200000000             mov word ptr [rbx + 0x280], 0
0000000145c5635a 48c7838802000000000000         mov qword ptr [rbx + 0x288], 0
0000000145c56365 0f57f6                         xorps xmm6, xmm6
0000000145c56368 0f29b380010000                 movaps xmmword ptr [rbx + 0x180], xmm6
0000000145c5636f 0f29b300020000                 movaps xmmword ptr [rbx + 0x200], xmm6
0000000145c56376 48c7839002000008000000         mov qword ptr [rbx + 0x290], 8
0000000145c56381 0f11b398020000                 movups xmmword ptr [rbx + 0x298], xmm6
0000000145c56388 48c783a802000008000000         mov qword ptr [rbx + 0x2a8], 8
0000000145c56393 48c783b002000000000000         mov qword ptr [rbx + 0x2b0], 0
0000000145c5639e c683b802000001                 mov byte ptr [rbx + 0x2b8], 1
0000000145c563a5 e856be3afa                     call 0x140002200
0000000145c563aa b900020000                     mov ecx, 0x200
0000000145c563af ba80000000                     mov edx, 0x80
0000000145c563b4 e807be3afa                     call 0x1400021c0
0000000145c563b9 4885c0                         test rax, rax
0000000145c563bc 0f84aa040000                   je 0x145c5686c
0000000145c563c2 4889c7                         mov rdi, rax
0000000145c563c5 488d9380010000                 lea rdx, [rbx + 0x180]
0000000145c563cc 41b800020000                   mov r8d, 0x200
0000000145c563d2 4889c1                         mov rcx, rax
0000000145c563d5 e841583900                     call 0x145febc1b
0000000145c563da 48c783f000000001000000         mov qword ptr [rbx + 0xf0], 1
0000000145c563e5 4889bbf8000000                 mov qword ptr [rbx + 0xf8], rdi
0000000145c563ec 48c7830001000001000000         mov qword ptr [rbx + 0x100], 1
0000000145c563f7 4889bb08010000                 mov qword ptr [rbx + 0x108], rdi
0000000145c563fe 48c7830003000001000000         mov qword ptr [rbx + 0x300], 1
0000000145c56409 48c7830803000001000000         mov qword ptr [rbx + 0x308], 1
0000000145c56414 c6831003000000                 mov byte ptr [rbx + 0x310], 0
0000000145c5641b 66c783800200000000             mov word ptr [rbx + 0x280], 0
0000000145c56424 48c7838802000000000000         mov qword ptr [rbx + 0x288], 0
0000000145c5642f 0f29b380010000                 movaps xmmword ptr [rbx + 0x180], xmm6
0000000145c56436 0f29b300020000                 movaps xmmword ptr [rbx + 0x200], xmm6
0000000145c5643d 48c7839002000008000000         mov qword ptr [rbx + 0x290], 8
0000000145c56448 0f11b398020000                 movups xmmword ptr [rbx + 0x298], xmm6
0000000145c5644f 48c783a802000008000000         mov qword ptr [rbx + 0x2a8], 8
0000000145c5645a 48c783b002000000000000         mov qword ptr [rbx + 0x2b0], 0
0000000145c56465 c683b802000001                 mov byte ptr [rbx + 0x2b8], 1
0000000145c5646c e88fbd3afa                     call 0x140002200
0000000145c56471 b900020000                     mov ecx, 0x200
0000000145c56476 ba80000000                     mov edx, 0x80
0000000145c5647b e840bd3afa                     call 0x1400021c0
0000000145c56480 4885c0                         test rax, rax
0000000145c56483 0f84f5030000                   je 0x145c5687e
0000000145c56489 4989c6                         mov r14, rax
0000000145c5648c 488d9380010000                 lea rdx, [rbx + 0x180]
0000000145c56493 41b800020000                   mov r8d, 0x200
0000000145c56499 4889c1                         mov rcx, rax
0000000145c5649c e87a573900                     call 0x145febc1b
0000000145c564a1 48c7831001000001000000         mov qword ptr [rbx + 0x110], 1
0000000145c564ac 4c89b318010000                 mov qword ptr [rbx + 0x118], r14
0000000145c564b3 48c7832001000001000000         mov qword ptr [rbx + 0x120], 1
0000000145c564be 4c89b328010000                 mov qword ptr [rbx + 0x128], r14
0000000145c564c5 e836bd3afa                     call 0x140002200
0000000145c564ca b918000000                     mov ecx, 0x18
0000000145c564cf ba08000000                     mov edx, 8
0000000145c564d4 e8e7bc3afa                     call 0x1400021c0
0000000145c564d9 4885c0                         test rax, rax
0000000145c564dc 0f84ae030000                   je 0x145c56890
0000000145c564e2 4989c7                         mov r15, rax
0000000145c564e5 48c70001000000                 mov qword ptr [rax], 1
0000000145c564ec 48c7400801000000               mov qword ptr [rax + 8], 1
0000000145c564f4 c6401000                       mov byte ptr [rax + 0x10], 0
0000000145c564f8 488983c8000000                 mov qword ptr [rbx + 0xc8], rax
0000000145c564ff e8fcbc3afa                     call 0x140002200
0000000145c56504 b918000000                     mov ecx, 0x18
0000000145c56509 ba08000000                     mov edx, 8
0000000145c5650e e8adbc3afa                     call 0x1400021c0
0000000145c56513 4885c0                         test rax, rax
0000000145c56516 0f8494030000                   je 0x145c568b0
0000000145c5651c 48c70001000000                 mov qword ptr [rax], 1
0000000145c56523 48c7400801000000               mov qword ptr [rax + 8], 1
0000000145c5652b c6401000                       mov byte ptr [rax + 0x10], 0
0000000145c5652f 488983d0000000                 mov qword ptr [rbx + 0xd0], rax
0000000145c56536 4d85ed                         test r13, r13
0000000145c56539 7922                           jns 0x145c5655d
0000000145c5653b 4531e4                         xor r12d, r12d
0000000145c5653e c6838e00000001                 mov byte ptr [rbx + 0x8e], 1
0000000145c56545 c6838f00000001                 mov byte ptr [rbx + 0x8f], 1
0000000145c5654c 4c89e1                         mov rcx, r12
0000000145c5654f 4c89ea                         mov rdx, r13
0000000145c56552 e864db5300                     call 0x1461940bb
0000000145c56557 90                             nop
0000000145c56558 e983030000                     jmp 0x145c568e0
0000000145c5655d 4889b3e0000000                 mov qword ptr [rbx + 0xe0], rsi
0000000145c56564 488983b0000000                 mov qword ptr [rbx + 0xb0], rax
0000000145c5656b 7447                           je 0x145c565b4
0000000145c5656d 4c89e6                         mov rsi, r12
0000000145c56570 e88bbc3afa                     call 0x140002200
0000000145c56575 41bc01000000                   mov r12d, 1
0000000145c5657b ba01000000                     mov edx, 1
0000000145c56580 4c89e9                         mov rcx, r13
0000000145c56583 e838bc3afa                     call 0x1400021c0
0000000145c56588 4885c0                         test rax, rax
0000000145c5658b 74b1                           je 0x145c5653e
0000000145c5658d 488983b8000000                 mov qword ptr [rbx + 0xb8], rax
0000000145c56594 4889c1                         mov rcx, rax
0000000145c56597 4889f2                         mov rdx, rsi
0000000145c5659a 4d89e8                         mov r8, r13
0000000145c5659d e879563900                     call 0x145febc1b
0000000145c565a2 488bb3b0000000                 mov rsi, qword ptr [rbx + 0xb0]
0000000145c565a9 f049ff07                       lock inc qword ptr [r15]
0000000145c565ad 7f1e                           jg 0x145c565cd
0000000145c565af e92c030000                     jmp 0x145c568e0
0000000145c565b4 4889c6                         mov rsi, rax
0000000145c565b7 b801000000                     mov eax, 1
0000000145c565bc 488983b8000000                 mov qword ptr [rbx + 0xb8], rax
0000000145c565c3 f049ff07                       lock inc qword ptr [r15]
0000000145c565c7 0f8e13030000                   jle 0x145c568e0
0000000145c565cd 4c89abc0000000                 mov qword ptr [rbx + 0xc0], r13
0000000145c565d4 f048ff06                       lock inc qword ptr [rsi]
0000000145c565d8 0f8e02030000                   jle 0x145c568e0
0000000145c565de 4c89bbd8000000                 mov qword ptr [rbx + 0xd8], r15
0000000145c565e5 4889b3e8000000                 mov qword ptr [rbx + 0xe8], rsi
0000000145c565ec 48c78390010000ffffffff         mov qword ptr [rbx + 0x190], 0xffffffffffffffff
0000000145c565f7 48c7838001000000000000         mov qword ptr [rbx + 0x180], 0
0000000145c56602 c683a801000000                 mov byte ptr [rbx + 0x1a8], 0
0000000145c56609 e8f2bb3afa                     call 0x140002200
0000000145c5660e b90a000000                     mov ecx, 0xa
0000000145c56613 ba01000000                     mov edx, 1
0000000145c56618 e8a3bb3afa                     call 0x1400021c0
0000000145c5661d 4885c0                         test rax, rax
0000000145c56620 488983a8000000                 mov qword ptr [rbx + 0xa8], rax
0000000145c56627 0f84a3020000                   je 0x145c568d0
0000000145c5662d 48b9726f6775652d636f           movabs rcx, 0x6f632d6575676f72
0000000145c56637 488908                         mov qword ptr [rax], rcx
0000000145c5663a 66c740086f70                   mov word ptr [rax + 8], 0x706f
0000000145c56640 48c783900000000a000000         mov qword ptr [rbx + 0x90], 0xa
0000000145c5664b 48898398000000                 mov qword ptr [rbx + 0x98], rax
0000000145c56652 48c783a00000000a000000         mov qword ptr [rbx + 0xa0], 0xa
0000000145c5665d 488d8b50010000                 lea rcx, [rbx + 0x150]
0000000145c56664 4c8da380010000                 lea r12, [rbx + 0x180]
0000000145c5666b 4c8d8390000000                 lea r8, [rbx + 0x90]
0000000145c56672 4c89e2                         mov rdx, r12
0000000145c56675 e896fa3300                     call 0x145f96110
0000000145c5667a 90                             nop
0000000145c5667b 488bb3e0000000                 mov rsi, qword ptr [rbx + 0xe0]
0000000145c56682 488b83c0000000                 mov rax, qword ptr [rbx + 0xc0]
0000000145c56689 488983a0010000                 mov qword ptr [rbx + 0x1a0], rax
0000000145c56690 488b8bb8000000                 mov rcx, qword ptr [rbx + 0xb8]
0000000145c56697 48898ba8010000                 mov qword ptr [rbx + 0x1a8], rcx
0000000145c5669e 488983b0010000                 mov qword ptr [rbx + 0x1b0], rax
0000000145c566a5 48c7838001000001000000         mov qword ptr [rbx + 0x180], 1
0000000145c566b0 4889bb88010000                 mov qword ptr [rbx + 0x188], rdi
0000000145c566b7 48c7839001000001000000         mov qword ptr [rbx + 0x190], 1
0000000145c566c2 4c89b398010000                 mov qword ptr [rbx + 0x198], r14
0000000145c566c9 4c89bbb8010000                 mov qword ptr [rbx + 0x1b8], r15
0000000145c566d0 488b83b0000000                 mov rax, qword ptr [rbx + 0xb0]
0000000145c566d7 488983c0010000                 mov qword ptr [rbx + 0x1c0], rax
0000000145c566de 488b8370010000                 mov rax, qword ptr [rbx + 0x170]
0000000145c566e5 48898340010000                 mov qword ptr [rbx + 0x140], rax
0000000145c566ec 0f108360010000                 movups xmm0, xmmword ptr [rbx + 0x160]
0000000145c566f3 0f298330010000                 movaps xmmword ptr [rbx + 0x130], xmm0
0000000145c566fa 4c8b8350010000                 mov r8, qword ptr [rbx + 0x150]
0000000145c56701 4c8b8b58010000                 mov r9, qword ptr [rbx + 0x158]
0000000145c56708 0fb68378010000                 movzx eax, byte ptr [rbx + 0x178]
0000000145c5670f c6838600000001                 mov byte ptr [rbx + 0x86], 1
0000000145c56716 c6838700000001                 mov byte ptr [rbx + 0x87], 1
0000000145c5671d 4c89642430                     mov qword ptr [rsp + 0x30], r12
0000000145c56722 88442420                       mov byte ptr [rsp + 0x20], al
0000000145c56726 48c744242800000000             mov qword ptr [rsp + 0x28], 0
0000000145c5672f 488d8b90000000                 lea rcx, [rbx + 0x90]
0000000145c56736 488d9330010000                 lea rdx, [rbx + 0x130]
0000000145c5673d e82ea8e4ff                     call 0x145aa0f70
0000000145c56742 90                             nop
0000000145c56743 4c8ba390000000                 mov r12, qword ptr [rbx + 0x90]
0000000145c5674a 488b8398000000                 mov rax, qword ptr [rbx + 0x98]
0000000145c56751 488d9398000000                 lea rdx, [rbx + 0x98]
0000000145c56758 4d85e4                         test r12, r12
0000000145c5675b 741e                           je 0x145c5677b
0000000145c5675d 488b8ba0000000                 mov rcx, qword ptr [rbx + 0xa0]
0000000145c56764 48898ba0000000                 mov qword ptr [rbx + 0xa0], rcx
0000000145c5676b 48898398000000                 mov qword ptr [rbx + 0x98], rax
0000000145c56772 4c89a390000000                 mov qword ptr [rbx + 0x90], r12
0000000145c56779 eb18                           jmp 0x145c56793
0000000145c5677b 48898398000000                 mov qword ptr [rbx + 0x98], rax
0000000145c56782 48c7839000000000000000         mov qword ptr [rbx + 0x90], 0
0000000145c5678d b102                           mov cl, 2
0000000145c5678f 41864f10                       xchg byte ptr [r15 + 0x10], cl
0000000145c56793 48c70601000000                 mov qword ptr [rsi], 1
0000000145c5679a 48897e08                       mov qword ptr [rsi + 8], rdi
0000000145c5679e 48c7461001000000               mov qword ptr [rsi + 0x10], 1
0000000145c567a6 4c897618                       mov qword ptr [rsi + 0x18], r14
0000000145c567aa 4c897e20                       mov qword ptr [rsi + 0x20], r15
0000000145c567ae 488b8bb0000000                 mov rcx, qword ptr [rbx + 0xb0]
0000000145c567b5 48894e28                       mov qword ptr [rsi + 0x28], rcx
0000000145c567b9 4d85e4                         test r12, r12
0000000145c567bc 7452                           je 0x145c56810
0000000145c567be 488993a8000000                 mov qword ptr [rbx + 0xa8], rdx
0000000145c567c5 488b8ba0000000                 mov rcx, qword ptr [rbx + 0xa0]
0000000145c567cc ff15f6f05300                   call qword ptr [rip + 0x53f0f6]
0000000145c567d2 f049ff0c24                     lock dec qword ptr [r12]
0000000145c567d7 750d                           jne 0x145c567e6
0000000145c567d9 488d8b90000000                 lea rcx, [rbx + 0x90]
0000000145c567e0 e88bd83400                     call 0x145fa4070
0000000145c567e5 90                             nop
0000000145c567e6 488b8398000000                 mov rax, qword ptr [rbx + 0x98]
0000000145c567ed f048ff08                       lock dec qword ptr [rax]
0000000145c567f1 755b                           jne 0x145c5684e
0000000145c567f3 c6838600000001                 mov byte ptr [rbx + 0x86], 1
0000000145c567fa c6838700000000                 mov byte ptr [rbx + 0x87], 0
0000000145c56801 488b8ba8000000                 mov rcx, qword ptr [rbx + 0xa8]
0000000145c56808 e823d73400                     call 0x145fa3f30
0000000145c5680d 90                             nop
0000000145c5680e eb3e                           jmp 0x145c5684e
0000000145c56810 89c1                           mov ecx, eax
0000000145c56812 83e103                         and ecx, 3
0000000145c56815 8d51fe                         lea edx, [rcx - 2]
0000000145c56818 83fa02                         cmp edx, 2
0000000145c5681b 7231                           jb 0x145c5684e
0000000145c5681d 4885c9                         test rcx, rcx
0000000145c56820 742c                           je 0x145c5684e
0000000145c56822 48ffc8                         dec rax
0000000145c56825 488d8b88010000                 lea rcx, [rbx + 0x188]
0000000145c5682c 48898388010000                 mov qword ptr [rbx + 0x188], rax
0000000145c56833 c6838001000003                 mov byte ptr [rbx + 0x180], 3
0000000145c5683a c6838600000001                 mov byte ptr [rbx + 0x86], 1
0000000145c56841 c6838700000000                 mov byte ptr [rbx + 0x87], 0
0000000145c56848 e8b3aa3700                     call 0x145fd1300
0000000145c5684d 90                             nop
0000000145c5684e 4889f0                         mov rax, rsi
0000000145c56851 0f28b520030000                 movaps xmm6, xmmword ptr [rbp + 0x320]
0000000145c56858 488da538030000                 lea rsp, [rbp + 0x338]
0000000145c5685f 5b                             pop rbx
0000000145c56860 5f                             pop rdi
0000000145c56861 5e                             pop rsi
0000000145c56862 415c                           pop r12
0000000145c56864 415d                           pop r13
0000000145c56866 415e                           pop r14
0000000145c56868 415f                           pop r15
0000000145c5686a 5d                             pop rbp
0000000145c5686b c3                             ret
0000000145c5686c b980000000                     mov ecx, 0x80
0000000145c56871 ba00020000                     mov edx, 0x200
0000000145c56876 e826d85300                     call 0x1461940a1
0000000145c5687b 90                             nop
0000000145c5687c eb62                           jmp 0x145c568e0
0000000145c5687e b980000000                     mov ecx, 0x80
0000000145c56883 ba00020000                     mov edx, 0x200
0000000145c56888 e814d85300                     call 0x1461940a1
0000000145c5688d 90                             nop
0000000145c5688e eb50                           jmp 0x145c568e0
0000000145c56890 c6838a00000001                 mov byte ptr [rbx + 0x8a], 1
0000000145c56897 c6838b00000001                 mov byte ptr [rbx + 0x8b], 1
0000000145c5689e b908000000                     mov ecx, 8
0000000145c568a3 ba18000000                     mov edx, 0x18
0000000145c568a8 e8f4d75300                     call 0x1461940a1
0000000145c568ad 90                             nop
0000000145c568ae eb30                           jmp 0x145c568e0
0000000145c568b0 c6838c00000001                 mov byte ptr [rbx + 0x8c], 1
0000000145c568b7 c6838d00000001                 mov byte ptr [rbx + 0x8d], 1
0000000145c568be b908000000                     mov ecx, 8
0000000145c568c3 ba18000000                     mov edx, 0x18
0000000145c568c8 e8d4d75300                     call 0x1461940a1
0000000145c568cd 90                             nop
0000000145c568ce eb10                           jmp 0x145c568e0
0000000145c568d0 b901000000                     mov ecx, 1
0000000145c568d5 ba0a000000                     mov edx, 0xa
0000000145c568da e8dcd75300                     call 0x1461940bb
0000000145c568df 90                             nop
0000000145c568e0 0f0b                           ud2

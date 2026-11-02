0000000145bf735e 4181fee5050000                 cmp r14d, 0x5e5
0000000145bf7365 0f8ead040000                   jle 0x145bf7818
0000000145bf736b 4181fefb0a0000                 cmp r14d, 0xafb
0000000145bf7372 0f8f2d050000                   jg 0x145bf78a5
0000000145bf7378 4181fee6050000                 cmp r14d, 0x5e6
0000000145bf737f 0f84eb040000                   je 0x145bf7870
0000000145bf7385 4181feba070000                 cmp r14d, 0x7ba
0000000145bf738c 0f8458050000                   je 0x145bf78ea
0000000145bf7392 4181fe530a0000                 cmp r14d, 0xa53
0000000145bf7399 0f84d1040000                   je 0x145bf7870
0000000145bf739f e956050000                     jmp 0x145bf78fa
0000000145bf73a4 8b85c8000000                   mov eax, dword ptr [rbp + 0xc8]
0000000145bf73aa 898588000000                   mov dword ptr [rbp + 0x88], eax
0000000145bf73b0 488b85c0000000                 mov rax, qword ptr [rbp + 0xc0]
0000000145bf73b7 48898580000000                 mov qword ptr [rbp + 0x80], rax
0000000145bf73be 440f28add0000000               movaps xmm13, xmmword ptr [rbp + 0xd0]
0000000145bf73c6 4883c210                       add rdx, 0x10
0000000145bf73ca f2440f109580000000             movsd xmm10, qword ptr [rbp + 0x80]
0000000145bf73d3 f3410f16d2                     movshdup xmm2, xmm10
0000000145bf73d8 4889d1                         mov rcx, rdx
0000000145bf73db 410f28ca                       movaps xmm1, xmm10
0000000145bf73df e87c97f9ff                     call 0x145b90b60
0000000145bf73e4 4c8b8ec0050000                 mov r9, qword ptr [rsi + 0x5c0]
0000000145bf73eb 488b9530010000                 mov rdx, qword ptr [rbp + 0x130]
0000000145bf73f2 4c39ca                         cmp rdx, r9
0000000145bf73f5 0f83780d0000                   jae 0x145bf8173
0000000145bf73fb 440f28d8                       movaps xmm11, xmm0
0000000145bf73ff a801                           test al, 1
0000000145bf7401 7509                           jne 0x145bf740c
0000000145bf7403 f3440f109d88000000             movss xmm11, dword ptr [rbp + 0x88]
0000000145bf740c 488b86b8050000                 mov rax, qword ptr [rsi + 0x5b8]
0000000145bf7413 440f28a540010000               movaps xmm12, xmmword ptr [rbp + 0x140]
0000000145bf741b 410f28c4                       movaps xmm0, xmm12
0000000145bf741f 410f5cc2                       subps xmm0, xmm10
0000000145bf7423 0f59c0                         mulps xmm0, xmm0
0000000145bf7426 f30f16c8                       movshdup xmm1, xmm0
0000000145bf742a f30f58c8                       addss xmm1, xmm0
0000000145bf742e 0f57f6                         xorps xmm6, xmm6
0000000145bf7431 f30f51f1                       sqrtss xmm6, xmm1
0000000145bf7435 f30f1005b30e5a00               movss xmm0, dword ptr [rip + 0x5a0eb3]
0000000145bf743d f3420f108c3078010000           movss xmm1, dword ptr [rax + r14 + 0x178]
0000000145bf7447 f30f590db9135a00               mulss xmm1, dword ptr [rip + 0x5a13b9]
0000000145bf744f f30f5ff0                       maxss xmm6, xmm0
0000000145bf7453 f30f5fc1                       maxss xmm0, xmm1
0000000145bf7457 f30f103df1485b00               movss xmm7, dword ptr [rip + 0x5b48f1]
0000000145bf745f f30f5df8                       minss xmm7, xmm0
0000000145bf7463 0f28d6                         movaps xmm2, xmm6
0000000145bf7466 f30f5e15b6135a00               divss xmm2, dword ptr [rip + 0x5a13b6]
0000000145bf746e f3410f58d0                     addss xmm2, xmm8
0000000145bf7473 f3440f114c2420                 movss dword ptr [rsp + 0x20], xmm9
0000000145bf747a 4889f1                         mov rcx, rsi
0000000145bf747d 41b901000000                   mov r9d, 1
0000000145bf7483 e838a8ffff                     call 0x145bf1cc0
0000000145bf7488 4889f1                         mov rcx, rsi
0000000145bf748b 488bbd80010000                 mov rdi, qword ptr [rbp + 0x180]
0000000145bf7492 4889fa                         mov rdx, rdi
0000000145bf7495 4589f8                         mov r8d, r15d
0000000145bf7498 410f28d8                       movaps xmm3, xmm8
0000000145bf749c e80fadffff                     call 0x145bf21b0
0000000145bf74a1 f30f11b56c010000               movss dword ptr [rbp + 0x16c], xmm6
0000000145bf74a9 f30f11bd70010000               movss dword ptr [rbp + 0x170], xmm7
0000000145bf74b1 c7856801000002000000           mov dword ptr [rbp + 0x168], 2
0000000145bf74bb f3450f58f6                     addss xmm14, xmm14
0000000145bf74c0 c785f000000000000000           mov dword ptr [rbp + 0xf0], 0
0000000145bf74ca 488d85f0000000                 lea rax, [rbp + 0xf0]
0000000145bf74d1 4889442448                     mov qword ptr [rsp + 0x48], rax
0000000145bf74d6 f3440f11742440                 movss dword ptr [rsp + 0x40], xmm14
0000000145bf74dd f3440f114c2428                 movss dword ptr [rsp + 0x28], xmm9
0000000145bf74e4 f3440f116c2420                 movss dword ptr [rsp + 0x20], xmm13
0000000145bf74eb c744243800000000               mov dword ptr [rsp + 0x38], 0
0000000145bf74f3 c74424300000803f               mov dword ptr [rsp + 0x30], 0x3f800000
0000000145bf74fb 4c8d8568010000                 lea r8, [rbp + 0x168]
0000000145bf7502 4889f1                         mov rcx, rsi
0000000145bf7505 4889fa                         mov rdx, rdi
0000000145bf7508 410f28dc                       movaps xmm3, xmm12
0000000145bf750c e86faaffff                     call 0x145bf1f80
0000000145bf7511 440f1395f0000000               movlps qword ptr [rbp + 0xf0], xmm10
0000000145bf7519 f3440f119df8000000             movss dword ptr [rbp + 0xf8], xmm11
0000000145bf7522 c6851d01000023                 mov byte ptr [rbp + 0x11d], 0x23
0000000145bf7529 4c8d8df0000000                 lea r9, [rbp + 0xf0]
0000000145bf7530 4889f1                         mov rcx, rsi
0000000145bf7533 410f28c8                       movaps xmm1, xmm8
0000000145bf7537 4989f8                         mov r8, rdi
0000000145bf753a e8c1a6ffff                     call 0x145bf1c00
0000000145bf753f e915b5ffff                     jmp 0x145bf2a59
0000000145bf7544 8b85c8000000                   mov eax, dword ptr [rbp + 0xc8]
0000000145bf754a 894548                         mov dword ptr [rbp + 0x48], eax
0000000145bf754d 488b85c0000000                 mov rax, qword ptr [rbp + 0xc0]
0000000145bf7554 48894540                       mov qword ptr [rbp + 0x40], rax
0000000145bf7558 4883c310                       add rbx, 0x10
0000000145bf755c 488b96d0020000                 mov rdx, qword ptr [rsi + 0x2d0]
0000000145bf7563 4c8b86d8020000                 mov r8, qword ptr [rsi + 0x2d8]
0000000145bf756a 488d8df0000000                 lea rcx, [rbp + 0xf0]
0000000145bf7571 4c8d4d40                       lea r9, [rbp + 0x40]
0000000145bf7575 e82616ffff                     call 0x145be8ba0
0000000145bf757a f20f10b5f0000000               movsd xmm6, qword ptr [rbp + 0xf0]
0000000145bf7582 f30f16fe                       movshdup xmm7, xmm6
0000000145bf7586 4889d9                         mov rcx, rbx
0000000145bf7589 0f28ce                         movaps xmm1, xmm6
0000000145bf758c 0f28d7                         movaps xmm2, xmm7
0000000145bf758f e8cc95f9ff                     call 0x145b90b60
0000000145bf7594 440f28c8                       movaps xmm9, xmm0
0000000145bf7598 a801                           test al, 1
0000000145bf759a 7509                           jne 0x145bf75a5
0000000145bf759c f3440f108df8000000             movss xmm9, dword ptr [rbp + 0xf8]
0000000145bf75a5 8b85b8000000                   mov eax, dword ptr [rbp + 0xb8]
0000000145bf75ab 898574010000                   mov dword ptr [rbp + 0x174], eax
0000000145bf75b1 488b85b0000000                 mov rax, qword ptr [rbp + 0xb0]
0000000145bf75b8 4889856c010000                 mov qword ptr [rbp + 0x16c], rax
0000000145bf75bf c7856801000001000000           mov dword ptr [rbp + 0x168], 1
0000000145bf75c9 c745f400000000                 mov dword ptr [rbp - 0xc], 0
0000000145bf75d0 488d7df4                       lea rdi, [rbp - 0xc]
0000000145bf75d4 48897c2430                     mov qword ptr [rsp + 0x30], rdi
0000000145bf75d9 4c8dad68010000                 lea r13, [rbp + 0x168]
0000000145bf75e0 4c896c2428                     mov qword ptr [rsp + 0x28], r13
0000000145bf75e5 48c744242000000000             mov qword ptr [rsp + 0x20], 0
0000000145bf75ee 4c8da5f0000000                 lea r12, [rbp + 0xf0]
0000000145bf75f5 41b908000000                   mov r9d, 8
0000000145bf75fb 4c89e1                         mov rcx, r12
0000000145bf75fe 4c8bbd80010000                 mov r15, qword ptr [rbp + 0x180]
0000000145bf7605 4c89fa                         mov rdx, r15
0000000145bf7608 8b9d40010000                   mov ebx, dword ptr [rbp + 0x140]
0000000145bf760e 4189d8                         mov r8d, ebx
0000000145bf7611 e8aa09f9ff                     call 0x145b87fc0
0000000145bf7616 488d8e70060000                 lea rcx, [rsi + 0x670]
0000000145bf761d 4c89e2                         mov rdx, r12
0000000145bf7620 e85b0af4ff                     call 0x145b38080
0000000145bf7625 f20f11b56c010000               movsd qword ptr [rbp + 0x16c], xmm6
0000000145bf762d f3440f118d74010000             movss dword ptr [rbp + 0x174], xmm9
0000000145bf7636 c7856801000001000000           mov dword ptr [rbp + 0x168], 1
0000000145bf7640 48897c2430                     mov qword ptr [rsp + 0x30], rdi
0000000145bf7645 4c896c2428                     mov qword ptr [rsp + 0x28], r13
0000000145bf764a 48c744242000000000             mov qword ptr [rsp + 0x20], 0
0000000145bf7653 41b908000000                   mov r9d, 8
0000000145bf7659 4189d8                         mov r8d, ebx
0000000145bf765c 4c89e1                         mov rcx, r12
0000000145bf765f 4c89fa                         mov rdx, r15
0000000145bf7662 e85909f9ff                     call 0x145b87fc0
0000000145bf7667 488d8e70060000                 lea rcx, [rsi + 0x670]
0000000145bf766e 4c89e2                         mov rdx, r12
0000000145bf7671 e80a0af4ff                     call 0x145b38080
0000000145bf7676 488b96c0050000                 mov rdx, qword ptr [rsi + 0x5c0]
0000000145bf767d 48399530010000                 cmp qword ptr [rbp + 0x130], rdx
0000000145bf7684 0f83fd0a0000                   jae 0x145bf8187
0000000145bf768a 488b86b8050000                 mov rax, qword ptr [rsi + 0x5b8]
0000000145bf7691 420f13b4307c010000             movlps qword ptr [rax + r14 + 0x17c], xmm6
0000000145bf769a f3460f118c3084010000           movss dword ptr [rax + r14 + 0x184], xmm9
0000000145bf76a4 420f13b43088010000             movlps qword ptr [rax + r14 + 0x188], xmm6
0000000145bf76ad f3460f118c3090010000           movss dword ptr [rax + r14 + 0x190], xmm9
0000000145bf76b7 0f57c0                         xorps xmm0, xmm0
0000000145bf76ba f3410f10c7                     movss xmm0, xmm15
0000000145bf76bf 420f13843094010000             movlps qword ptr [rax + r14 + 0x194], xmm0
0000000145bf76c8 f3440f5cd7                     subss xmm10, xmm7
0000000145bf76cd f3440f5cc6                     subss xmm8, xmm6
0000000145bf76d2 410f28c2                       movaps xmm0, xmm10
0000000145bf76d6 410f28c8                       movaps xmm1, xmm8
0000000145bf76da e890453f00                     call 0x145febc6f
0000000145bf76df f30f11442420                   movss dword ptr [rsp + 0x20], xmm0
0000000145bf76e5 f30f1015170b5a00               movss xmm2, dword ptr [rip + 0x5a0b17]
0000000145bf76ed 4889f1                         mov rcx, rsi
0000000145bf76f0 488b9530010000                 mov rdx, qword ptr [rbp + 0x130]
0000000145bf76f7 41b901000000                   mov r9d, 1
0000000145bf76fd e8bea5ffff                     call 0x145bf1cc0
0000000145bf7702 e952b3ffff                     jmp 0x145bf2a59
0000000145bf7707 c6856701000001                 mov byte ptr [rbp + 0x167], 1
0000000145bf770e 488d85b0000000                 lea rax, [rbp + 0xb0]
0000000145bf7715 4889442420                     mov qword ptr [rsp + 0x20], rax
0000000145bf771a f30f100d7e0a5a00               movss xmm1, dword ptr [rip + 0x5a0a7e]
0000000145bf7722 4889f1                         mov rcx, rsi
0000000145bf7725 4c8b8580010000                 mov r8, qword ptr [rbp + 0x180]
0000000145bf772c 448b8d58010000                 mov r9d, dword ptr [rbp + 0x158]
0000000145bf7733 e82815ffff                     call 0x145be8c60
0000000145bf7738 90                             nop
0000000145bf7739 488b5528                       mov rdx, qword ptr [rbp + 0x28]
0000000145bf773d 4885d2                         test rdx, rdx
0000000145bf7740 0f8413b3ffff                   je 0x145bf2a59
0000000145bf7746 488b4d30                       mov rcx, qword ptr [rbp + 0x30]
0000000145bf774a 48c1e202                       shl rdx, 2
0000000145bf774e 41b804000000                   mov r8d, 4
0000000145bf7754 e877aa40fa                     call 0x1400021d0
0000000145bf7759 e9fbb2ffff                     jmp 0x145bf2a59
0000000145bf775e 4181fee94b0000                 cmp r14d, 0x4be9
0000000145bf7765 0f8f19010000                   jg 0x145bf7884
0000000145bf776b 4181fe651c0000                 cmp r14d, 0x1c65
0000000145bf7772 0f8452010000                   je 0x145bf78ca
0000000145bf7778 4181fec5270000                 cmp r14d, 0x27c5
0000000145bf777f 0f845b010000                   je 0x145bf78e0
0000000145bf7785 4181fe662c0000                 cmp r14d, 0x2c66
0000000145bf778c 0f84e8000000                   je 0x145bf787a
0000000145bf7792 e963010000                     jmp 0x145bf78fa
0000000145bf7797 4c8d35b195a901                 lea r14, [rip + 0x1a995b1]
0000000145bf779e 41bf2a000000                   mov r15d, 0x2a
0000000145bf77a4 ba2a000000                     mov edx, 0x2a
0000000145bf77a9 eb26                           jmp 0x145bf77d1
0000000145bf77ab 4c8d35c795a901                 lea r14, [rip + 0x1a995c7]
0000000145bf77b2 41bf1f000000                   mov r15d, 0x1f
0000000145bf77b8 ba1f000000                     mov edx, 0x1f
0000000145bf77bd eb12                           jmp 0x145bf77d1
0000000145bf77bf 4c8d356195a901                 lea r14, [rip + 0x1a99561]
0000000145bf77c6 41bf28000000                   mov r15d, 0x28
0000000145bf77cc ba28000000                     mov edx, 0x28
0000000145bf77d1 4c89f1                         mov rcx, r14
0000000145bf77d4 e88737efff                     call 0x145aeaf60
0000000145bf77d9 4885c0                         test rax, rax
0000000145bf77dc 490f44d7                       cmove rdx, r15
0000000145bf77e0 490f44c6                       cmove rax, r14
0000000145bf77e4 4881c670060000                 add rsi, 0x670
0000000145bf77eb 4889542420                     mov qword ptr [rsp + 0x20], rdx
0000000145bf77f0 4c8db5f0000000                 lea r14, [rbp + 0xf0]
0000000145bf77f7 4c89f1                         mov rcx, r14
0000000145bf77fa 4889fa                         mov rdx, rdi
0000000145bf77fd 4989d8                         mov r8, rbx
0000000145bf7800 4989c1                         mov r9, rax
0000000145bf7803 e8e817f8ff                     call 0x145b78ff0
0000000145bf7808 4889f1                         mov rcx, rsi
0000000145bf780b 4c89f2                         mov rdx, r14
0000000145bf780e e86d08f4ff                     call 0x145b38080
0000000145bf7813 e941b2ffff                     jmp 0x145bf2a59
0000000145bf7818 4181fe84000000                 cmp r14d, 0x84
0000000145bf781f 0f8eaf000000                   jle 0x145bf78d4
0000000145bf7825 4181fe85000000                 cmp r14d, 0x85
0000000145bf782c 744c                           je 0x145bf787a
0000000145bf782e 4181fe93010000                 cmp r14d, 0x193
0000000145bf7835 0f848f000000                   je 0x145bf78ca
0000000145bf783b 4181feae020000                 cmp r14d, 0x2ae
0000000145bf7842 0f8482000000                   je 0x145bf78ca
0000000145bf7848 e9ad000000                     jmp 0x145bf78fa
0000000145bf784d 4181fe851a0000                 cmp r14d, 0x1a85
0000000145bf7854 7424                           je 0x145bf787a
0000000145bf7856 4181fe051b0000                 cmp r14d, 0x1b05
0000000145bf785d 0f8487000000                   je 0x145bf78ea
0000000145bf7863 4181fe541b0000                 cmp r14d, 0x1b54
0000000145bf786a 0f858a000000                   jne 0x145bf78fa
0000000145bf7870 f30f100588485a00               movss xmm0, dword ptr [rip + 0x5a4888]
0000000145bf7878 eb78                           jmp 0x145bf78f2
0000000145bf787a f30f1005a2375b00               movss xmm0, dword ptr [rip + 0x5b37a2]
0000000145bf7882 eb6e                           jmp 0x145bf78f2
0000000145bf7884 4181feea4b0000                 cmp r14d, 0x4bea
0000000145bf788b 745d                           je 0x145bf78ea
0000000145bf788d 4181fed35e0000                 cmp r14d, 0x5ed3
0000000145bf7894 0f846e070000                   je 0x145bf8008
0000000145bf789a 4181fef76a0000                 cmp r14d, 0x6af7
0000000145bf78a1 7427                           je 0x145bf78ca
0000000145bf78a3 eb55                           jmp 0x145bf78fa
0000000145bf78a5 4181fefc0a0000                 cmp r14d, 0xafc
0000000145bf78ac 741c                           je 0x145bf78ca
0000000145bf78ae 4181fee40b0000                 cmp r14d, 0xbe4
0000000145bf78b5 7433                           je 0x145bf78ea
0000000145bf78b7 4181fe160e0000                 cmp r14d, 0xe16
0000000145bf78be 753a                           jne 0x145bf78fa
0000000145bf78c0 f30f1005f87ca901               movss xmm0, dword ptr [rip + 0x1a97cf8]
0000000145bf78c8 eb28                           jmp 0x145bf78f2
0000000145bf78ca f30f1005423b5b00               movss xmm0, dword ptr [rip + 0x5b3b42]
0000000145bf78d2 eb1e                           jmp 0x145bf78f2
0000000145bf78d4 4183fe4b                       cmp r14d, 0x4b
0000000145bf78d8 7410                           je 0x145bf78ea
0000000145bf78da 4183fe74                       cmp r14d, 0x74
0000000145bf78de 751a                           jne 0x145bf78fa
0000000145bf78e0 f30f1005a8835f00               movss xmm0, dword ptr [rip + 0x5f83a8]
0000000145bf78e8 eb08                           jmp 0x145bf78f2
0000000145bf78ea f30f1005320f5a00               movss xmm0, dword ptr [rip + 0x5a0f32]
0000000145bf78f2 f30f11857c010000               movss dword ptr [rbp + 0x17c], xmm0
0000000145bf78fa 0f288540010000                 movaps xmm0, xmmword ptr [rbp + 0x140]
0000000145bf7901 410f5cc0                       subps xmm0, xmm8
0000000145bf7905 0f59c0                         mulps xmm0, xmm0
0000000145bf7908 f30f16c8                       movshdup xmm1, xmm0
0000000145bf790c f30f58c8                       addss xmm1, xmm0
0000000145bf7910 0f57db                         xorps xmm3, xmm3
0000000145bf7913 f30f51d9                       sqrtss xmm3, xmm1
0000000145bf7917 f30f5e9d7c010000               divss xmm3, dword ptr [rbp + 0x17c]
0000000145bf791f f30f5f1da50f5a00               maxss xmm3, dword ptr [rip + 0x5a0fa5]
0000000145bf7927 488d8d90000000                 lea rcx, [rbp + 0x90]
0000000145bf792e 4889f2                         mov rdx, rsi
0000000145bf7931 4c8b8530010000                 mov r8, qword ptr [rbp + 0x130]
0000000145bf7938 e863a9ffff                     call 0x145bf22a0
0000000145bf793d 83bde800000000                 cmp dword ptr [rbp + 0xe8], 0
0000000145bf7944 0f840fb1ffff                   je 0x145bf2a59

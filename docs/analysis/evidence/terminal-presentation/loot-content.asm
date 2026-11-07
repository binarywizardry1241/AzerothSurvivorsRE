14020c287 0f57f6 xorps xmm6, xmm6
14020c28a 440f100d36f7bd05 movups xmm9, xmmword ptr [rip + 0x5bdf736]
14020c292 440f10151ef7bd05 movups xmm10, xmmword ptr [rip + 0x5bdf71e]
14020c29a 440f103d46f7bd05 movups xmm15, xmmword ptr [rip + 0x5bdf746]
14020c2a2 440f10352ef7bd05 movups xmm14, xmmword ptr [rip + 0x5bdf72e]
14020c2aa 440f100556f7bd05 movups xmm8, xmmword ptr [rip + 0x5bdf756]
14020c2b2 0f103d3ff7bd05 movups xmm7, xmmword ptr [rip + 0x5bdf73f]
14020c2b9 440f102d67f7bd05 movups xmm13, xmmword ptr [rip + 0x5bdf767]
14020c2c1 440f10254ff7bd05 movups xmm12, xmmword ptr [rip + 0x5bdf74f]
14020c2c9 ba06000000 mov edx, 6
14020c2ce 4989d8 mov r8, rbx
14020c2d1 e80aea8d02 call 0x142aeace0
14020c2d6 4885c0 test rax, rax
14020c2d9 7503 jne 0x14020c2de
14020c2db 4c89e8 mov rax, r13
14020c2de 49c7c6ffffffff mov r14, 0xffffffffffffffff
14020c2e5 803802 cmp byte ptr [rax], 2
14020c2e8 7516 jne 0x14020c300
14020c2ea 4883780800 cmp qword ptr [rax + 8], 0
14020c2ef 750f jne 0x14020c300
14020c2f1 4c8b7010 mov r14, qword ptr [rax + 0x10]
14020c2f5 49ffce dec r14
14020c2f8 0f1f840000000000 nop dword ptr [rax + rax]
14020c300 ba03000000 mov edx, 3
14020c305 4c89f9 mov rcx, r15
14020c308 4989d8 mov r8, rbx
14020c30b e8d0e98d02 call 0x142aeace0
14020c310 4885c0 test rax, rax
14020c313 7503 jne 0x14020c318
14020c315 4c89e8 mov rax, r13
14020c318 803801 cmp byte ptr [rax], 1
14020c31b 7513 jne 0x14020c330
14020c31d 4d89ef mov r15, r13
14020c320 0fb64001 movzx eax, byte ptr [rax + 1]
14020c324 8985f4040000 mov dword ptr [rbp + 0x4f4], eax
14020c32a eb11 jmp 0x14020c33d
14020c32c 0f1f4000 nop dword ptr [rax]
14020c330 4d89ef mov r15, r13
14020c333 c785f404000000000000 mov dword ptr [rbp + 0x4f4], 0
14020c33d 0f117638 movups xmmword ptr [rsi + 0x38], xmm6
14020c341 0f117628 movups xmmword ptr [rsi + 0x28], xmm6
14020c345 0f117618 movups xmmword ptr [rsi + 0x18], xmm6
14020c349 0f117608 movups xmmword ptr [rsi + 8], xmm6
14020c34d 0f1176f8 movups xmmword ptr [rsi - 8], xmm6
14020c351 48c7464800000000 mov qword ptr [rsi + 0x48], 0
14020c359 440f114e60 movups xmmword ptr [rsi + 0x60], xmm9
14020c35e 440f115650 movups xmmword ptr [rsi + 0x50], xmm10
14020c363 440f11be80000000 movups xmmword ptr [rsi + 0x80], xmm15
14020c36b 440f117670 movups xmmword ptr [rsi + 0x70], xmm14
14020c370 440f1186a0000000 movups xmmword ptr [rsi + 0xa0], xmm8
14020c378 0f11be90000000 movups xmmword ptr [rsi + 0x90], xmm7
14020c37f 440f11aec0000000 movups xmmword ptr [rsi + 0xc0], xmm13
14020c387 440f11a6b0000000 movups xmmword ptr [rsi + 0xb0], xmm12
14020c38f 440f100569f5bd05 movups xmm8, xmmword ptr [rip + 0x5bdf569]
14020c397 440f294530 movaps xmmword ptr [rbp + 0x30], xmm8
14020c39c 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14020c3a4 0f103d6df5bd05 movups xmm7, xmmword ptr [rip + 0x5bdf56d]
14020c3ab 0f117eb0 movups xmmword ptr [rsi - 0x50], xmm7
14020c3af 48c746c000000000 mov qword ptr [rsi - 0x40], 0
14020c3b7 440f102571f5bd05 movups xmm12, xmmword ptr [rip + 0x5bdf571]
14020c3bf 440f1166c8 movups xmmword ptr [rsi - 0x38], xmm12
14020c3c4 48c746d800000000 mov qword ptr [rsi - 0x28], 0
14020c3cc 440f102d74f5bd05 movups xmm13, xmmword ptr [rip + 0x5bdf574]
14020c3d4 440f116ee0 movups xmmword ptr [rsi - 0x20], xmm13
14020c3d9 48c746f000000000 mov qword ptr [rsi - 0x10], 0
14020c3e1 41b838010000 mov r8d, 0x138
14020c3e7 4c8dade8010000 lea r13, [rbp + 0x1e8]
14020c3ee 4c89e9 mov rcx, r13
14020c3f1 488d5530 lea rdx, [rbp + 0x30]
14020c3f5 e8eddc9e05 call 0x145bfa0e7
14020c3fa 440f281d6e0eb905 movaps xmm11, xmmword ptr [rip + 0x5b90e6e]
14020c402 440f119d20030000 movups xmmword ptr [rbp + 0x320], xmm11
14020c40a c7853003000001000000 mov dword ptr [rbp + 0x330], 1
14020c414 f30f10056c85bc05 movss xmm0, dword ptr [rip + 0x5bc856c]
14020c41c 0f138534030000 movlps qword ptr [rbp + 0x334], xmm0
14020c423 c6853c03000001 mov byte ptr [rbp + 0x33c], 1
14020c42a 48c7854003000000000000 mov qword ptr [rbp + 0x340], 0
14020c435 c785480300000000803f mov dword ptr [rbp + 0x348], 0x3f800000
14020c43f 66c7854c0300000000 mov word ptr [rbp + 0x34c], 0
14020c448 41c7856601000000000100 mov dword ptr [r13 + 0x166], 0x10000
14020c453 6641c7856a0100000000 mov word ptr [r13 + 0x16a], 0
14020c45d 6641c785700100000000 mov word ptr [r13 + 0x170], 0
14020c467 41c7856c01000000000100 mov dword ptr [r13 + 0x16c], 0x10000
14020c472 48c7855a03000000000000 mov qword ptr [rbp + 0x35a], 0
14020c47d c7856203000005000000 mov dword ptr [rbp + 0x362], 5
14020c487 488b85b0040000 mov rax, qword ptr [rbp + 0x4b0]
14020c48e 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
14020c495 488d8db0010000 lea rcx, [rbp + 0x1b0]
14020c49c 4c89e2 mov rdx, r12
14020c49f 4c8d85e0010000 lea r8, [rbp + 0x1e0]
14020c4a6 e86520fdff call 0x1401de510
14020c4ab 4c8ba5b0010000 mov r12, qword ptr [rbp + 0x1b0]
14020c4b2 488b85d8010000 mov rax, qword ptr [rbp + 0x1d8]
14020c4b9 4c89a540040000 mov qword ptr [rbp + 0x440], r12
14020c4c0 0f1085b8010000 movups xmm0, xmmword ptr [rbp + 0x1b8]
14020c4c7 0f118548040000 movups xmmword ptr [rbp + 0x448], xmm0
14020c4ce 0f1085c8010000 movups xmm0, xmmword ptr [rbp + 0x1c8]
14020c4d5 0f118558040000 movups xmmword ptr [rbp + 0x458], xmm0
14020c4dc 48898568040000 mov qword ptr [rbp + 0x468], rax
14020c4e3 66c785940100000000 mov word ptr [rbp + 0x194], 0
14020c4ec c6858401000001 mov byte ptr [rbp + 0x184], 1
14020c4f3 0f117610 movups xmmword ptr [rsi + 0x10], xmm6
14020c4f7 0f1136 movups xmmword ptr [rsi], xmm6
14020c4fa 0f2805bfe8bd05 movaps xmm0, xmmword ptr [rip + 0x5bde8bf]
14020c501 0f1185b8000000 movups xmmword ptr [rbp + 0xb8], xmm0
14020c508 48c7859000000000000000 mov qword ptr [rbp + 0x90], 0
14020c513 0f117640 movups xmmword ptr [rsi + 0x40], xmm6
14020c517 0f117630 movups xmmword ptr [rsi + 0x30], xmm6
14020c51b 66c786140100000000 mov word ptr [rsi + 0x114], 0
14020c524 c7861001000000000000 mov dword ptr [rsi + 0x110], 0
14020c52e 440f114e60 movups xmmword ptr [rsi + 0x60], xmm9
14020c533 440f115650 movups xmmword ptr [rsi + 0x50], xmm10
14020c538 440f117670 movups xmmword ptr [rsi + 0x70], xmm14
14020c53d 450f28f7 movaps xmm14, xmm15
14020c541 440f11be80000000 movups xmmword ptr [rsi + 0x80], xmm15
14020c549 0f2805600db905 movaps xmm0, xmmword ptr [rip + 0x5b90d60]
14020c550 0f118528010000 movups xmmword ptr [rbp + 0x128], xmm0
14020c557 0f118538010000 movups xmmword ptr [rbp + 0x138], xmm0
14020c55e 0f28056b10b905 movaps xmm0, xmmword ptr [rip + 0x5b9106b]
14020c565 0f118548010000 movups xmmword ptr [rbp + 0x148], xmm0
14020c56c 0f118558010000 movups xmmword ptr [rbp + 0x158], xmm0
14020c573 66c785a60100000000 mov word ptr [rbp + 0x1a6], 0
14020c57c c785a201000000000000 mov dword ptr [rbp + 0x1a2], 0
14020c586 48c7858801000000000000 mov qword ptr [rbp + 0x188], 0
14020c591 c785900100000000803f mov dword ptr [rbp + 0x190], 0x3f800000
14020c59b 440f119d68010000 movups xmmword ptr [rbp + 0x168], xmm11
14020c5a3 c7857801000001000000 mov dword ptr [rbp + 0x178], 1
14020c5ad 48c7857c01000000000000 mov qword ptr [rbp + 0x17c], 0
14020c5b8 440f294530 movaps xmmword ptr [rbp + 0x30], xmm8
14020c5bd 48c7454000000000 mov qword ptr [rbp + 0x40], 0
14020c5c5 0f117eb0 movups xmmword ptr [rsi - 0x50], xmm7
14020c5c9 48c746c000000000 mov qword ptr [rsi - 0x40], 0
14020c5d1 440f1166c8 movups xmmword ptr [rsi - 0x38], xmm12
14020c5d6 48c746d800000000 mov qword ptr [rsi - 0x28], 0
14020c5de 440f116ee0 movups xmmword ptr [rsi - 0x20], xmm13
14020c5e3 48c746f000000000 mov qword ptr [rsi - 0x10], 0
14020c5eb c786fe00000000000100 mov dword ptr [rsi + 0xfe], 0x10000
14020c5f5 66c786020100000000 mov word ptr [rsi + 0x102], 0
14020c5fe 66c786080100000000 mov word ptr [rsi + 0x108], 0
14020c607 c7860401000000000100 mov dword ptr [rsi + 0x104], 0x10000
14020c611 f30f103d6783bc05 movss xmm7, dword ptr [rip + 0x5bc8367]
14020c619 440f28cf movaps xmm9, xmm7
14020c61d 440f28d7 movaps xmm10, xmm7
14020c621 440f28ff movaps xmm15, xmm7
14020c625 4983fe05 cmp r14, 5
14020c629 7327 jae 0x14020c652
14020c62b 488d05e63abe05 lea rax, [rip + 0x5be3ae6]
14020c632 f3460f100cb0 movss xmm9, dword ptr [rax + r14*4]
14020c638 488d05ed3abe05 lea rax, [rip + 0x5be3aed]
14020c63f f3460f1014b0 movss xmm10, dword ptr [rax + r14*4]
14020c645 488d05f43abe05 lea rax, [rip + 0x5be3af4]
14020c64c f3460f103cb0 movss xmm15, dword ptr [rax + r14*4]
14020c652 ba04000000 mov edx, 4
14020c657 488d0d74fcbd05 lea rcx, [rip + 0x5bdfc74]
14020c65e 4989d8 mov r8, rbx
14020c661 e87ae68d02 call 0x142aeace0
14020c666 90 nop
14020c667 4d89fd mov r13, r15
14020c66a 4885c0 test rax, rax
14020c66d 7503 jne 0x14020c672
14020c66f 4c89e8 mov rax, r13
14020c672 803803 cmp byte ptr [rax], 3
14020c675 7519 jne 0x14020c690
14020c677 4c8b4010 mov r8, qword ptr [rax + 0x10]
14020c67b 4c8b4818 mov r9, qword ptr [rax + 0x18]
14020c67f eb18 jmp 0x14020c699
14020c681 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14020c690 41b801000000 mov r8d, 1
14020c696 4531c9 xor r9d, r9d
14020c699 488d8de0010000 lea rcx, [rbp + 0x1e0]
14020c6a0 488b95b8040000 mov rdx, qword ptr [rbp + 0x4b8]
14020c6a7 e81442efff call 0x1401008c0
14020c6ac 90 nop
14020c6ad 488d4da8 lea rcx, [rbp - 0x58]
14020c6b1 488d95e0010000 lea rdx, [rbp + 0x1e0]
14020c6b8 e8a3034e02 call 0x1426eca60
14020c6bd 90 nop
14020c6be 41b880010000 mov r8d, 0x180
14020c6c4 488d8de8010000 lea rcx, [rbp + 0x1e8]
14020c6cb 4c8d7d30 lea r15, [rbp + 0x30]
14020c6cf 4c89fa mov rdx, r15
14020c6d2 e810da9e05 call 0x145bfa0e7
14020c6d7 41b888000000 mov r8d, 0x88
14020c6dd 488d8db8030000 lea rcx, [rbp + 0x3b8]
14020c6e4 488d55a8 lea rdx, [rbp - 0x58]
14020c6e8 e8fad99e05 call 0x145bfa0e7
14020c6ed c7856803000000000000 mov dword ptr [rbp + 0x368], 0
14020c6f7 f3440f118d6c030000 movss dword ptr [rbp + 0x36c], xmm9
14020c700 f3440f119570030000 movss dword ptr [rbp + 0x370], xmm10
14020c709 f3440f11bd74030000 movss dword ptr [rbp + 0x374], xmm15
14020c712 48c785780300000000803f mov qword ptr [rbp + 0x378], 0x3f800000
14020c71d f3440f118d80030000 movss dword ptr [rbp + 0x380], xmm9
14020c726 f3440f119584030000 movss dword ptr [rbp + 0x384], xmm10
14020c72f f3440f11bd88030000 movss dword ptr [rbp + 0x388], xmm15
14020c738 48c7858c0300000000803f mov qword ptr [rbp + 0x38c], 0x3f800000
14020c743 f3440f118d94030000 movss dword ptr [rbp + 0x394], xmm9
14020c74c f3440f119598030000 movss dword ptr [rbp + 0x398], xmm10
14020c755 f3440f11bd9c030000 movss dword ptr [rbp + 0x39c], xmm15

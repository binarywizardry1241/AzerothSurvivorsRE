145c2b460 55 push rbp
145c2b461 4157 push r15
145c2b463 4156 push r14
145c2b465 4155 push r13
145c2b467 4154 push r12
145c2b469 56 push rsi
145c2b46a 57 push rdi
145c2b46b 53 push rbx
145c2b46c 4881ecd8010000 sub rsp, 0x1d8
145c2b473 488dac2480000000 lea rbp, [rsp + 0x80]
145c2b47b 440f29bd40010000 movaps xmmword ptr [rbp + 0x140], xmm15
145c2b483 440f29b530010000 movaps xmmword ptr [rbp + 0x130], xmm14
145c2b48b 440f29ad20010000 movaps xmmword ptr [rbp + 0x120], xmm13
145c2b493 440f29a510010000 movaps xmmword ptr [rbp + 0x110], xmm12
145c2b49b 440f299d00010000 movaps xmmword ptr [rbp + 0x100], xmm11
145c2b4a3 440f2995f0000000 movaps xmmword ptr [rbp + 0xf0], xmm10
145c2b4ab 440f298de0000000 movaps xmmword ptr [rbp + 0xe0], xmm9
145c2b4b3 440f2985d0000000 movaps xmmword ptr [rbp + 0xd0], xmm8
145c2b4bb 0f29bdc0000000 movaps xmmword ptr [rbp + 0xc0], xmm7
145c2b4c2 0f29b5b0000000 movaps xmmword ptr [rbp + 0xb0], xmm6
145c2b4c9 48c785a8000000feffffff mov qword ptr [rbp + 0xa8], 0xfffffffffffffffe
145c2b4d4 89d7 mov edi, edx
145c2b4d6 4889ce mov rsi, rcx
145c2b4d9 03b934050000 add edi, dword ptr [rcx + 0x534]
145c2b4df 89b934050000 mov dword ptr [rcx + 0x534], edi
145c2b4e5 4c8db9580c0000 lea r15, [rcx + 0xc58]
145c2b4ec f30f103d34476200 movss xmm7, dword ptr [rip + 0x624734]
145c2b4f4 f3440f100533146200 movss xmm8, dword ptr [rip + 0x621433]
145c2b4fd f3440f100d9a156200 movss xmm9, dword ptr [rip + 0x62159a]
145c2b506 450f57d2 xorps xmm10, xmm10
145c2b50a f3440f101de1166200 movss xmm11, dword ptr [rip + 0x6216e1]
145c2b513 4989ee mov r14, rbp
145c2b516 4c8d6d20 lea r13, [rbp + 0x20]
145c2b51a f3440f1025d57b6000 movss xmm12, dword ptr [rip + 0x607bd5]
145c2b523 f3440f102d14136200 movss xmm13, dword ptr [rip + 0x621314]
145c2b52c eb0c jmp 0x145c2b53a
145c2b52e 6690 nop
145c2b530 897c9008 mov dword ptr [rax + rdx*4 + 8], edi
145c2b534 8bbe34050000 mov edi, dword ptr [rsi + 0x534]
145c2b53a 448ba630050000 mov r12d, dword ptr [rsi + 0x530]
145c2b541 4183fc01 cmp r12d, 1
145c2b545 4489e0 mov eax, r12d
145c2b548 83d0ff adc eax, -1
145c2b54b 0f57c9 xorps xmm1, xmm1
145c2b54e f3480f2ac8 cvtsi2ss xmm1, rax
145c2b553 0f28c1 movaps xmm0, xmm1
145c2b556 f3410f59c1 mulss xmm0, xmm9
145c2b55b f30f59c1 mulss xmm0, xmm1
145c2b55f f30f59cf mulss xmm1, xmm7
145c2b563 f3410f58c8 addss xmm1, xmm8
145c2b568 f30f58c1 addss xmm0, xmm1
145c2b56c e8fe614300 call 0x14606176f
145c2b571 f3480f2cc0 cvttss2si rax, xmm0
145c2b576 410f2ec2 ucomiss xmm0, xmm10
145c2b57a b900000000 mov ecx, 0
145c2b57f 0f42c1 cmovb eax, ecx
145c2b582 410f2ec3 ucomiss xmm0, xmm11
145c2b586 b9ffffffff mov ecx, 0xffffffff
145c2b58b 0f47c1 cmova eax, ecx
145c2b58e 4183fc77 cmp r12d, 0x77
145c2b592 0f8793070000 ja 0x145c2bd2b
145c2b598 89f9 mov ecx, edi
145c2b59a 29c1 sub ecx, eax
145c2b59c 0f8289070000 jb 0x145c2bd2b
145c2b5a2 898e34050000 mov dword ptr [rsi + 0x534], ecx
145c2b5a8 41ffc4 inc r12d
145c2b5ab 4489a630050000 mov dword ptr [rsi + 0x530], r12d
145c2b5b2 ff86d40c0000 inc dword ptr [rsi + 0xcd4]
145c2b5b8 488b86580c0000 mov rax, qword ptr [rsi + 0xc58]
145c2b5bf 4885c0 test rax, rax
145c2b5c2 0f8488000000 je 0x145c2b650
145c2b5c8 488b8e600c0000 mov rcx, qword ptr [rsi + 0xc60]
145c2b5cf 6641bb2200 mov r11w, 0x22
145c2b5d4 440fb74036 movzx r8d, word ptr [rax + 0x36]
145c2b5d9 4589c1 mov r9d, r8d
145c2b5dc 4501c9 add r9d, r9d
145c2b5df 48c7c2ffffffff mov rdx, 0xffffffffffffffff
145c2b5e6 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c2b5f0 4d85c9 test r9, r9
145c2b5f3 743b je 0x145c2b630
145c2b5f5 66443b5c503a cmp r11w, word ptr [rax + rdx*2 + 0x3a]
145c2b5fb 410f97c2 seta r10b
145c2b5ff 4180da00 sbb r10b, 0
145c2b603 48ffc2 inc rdx
145c2b606 4983c1fe add r9, -2
145c2b60a 4180fa01 cmp r10b, 1
145c2b60e 74e0 je 0x145c2b5f0
145c2b610 450fb6c2 movzx r8d, r10b
145c2b614 4585c0 test r8d, r8d
145c2b617 7427 je 0x145c2b640
145c2b619 4883e901 sub rcx, 1
145c2b61d 731a jae 0x145c2b639
145c2b61f eb31 jmp 0x145c2b652
145c2b621 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c2b630 4c89c2 mov rdx, r8
145c2b633 4883e901 sub rcx, 1
145c2b637 7219 jb 0x145c2b652
145c2b639 488b44d050 mov rax, qword ptr [rax + rdx*8 + 0x50]
145c2b63e eb94 jmp 0x145c2b5d4
145c2b640 4489649008 mov dword ptr [rax + rdx*4 + 8], r12d
145c2b645 eb35 jmp 0x145c2b67c
145c2b647 660f1f840000000000 nop word ptr [rax + rax]
145c2b650 31c0 xor eax, eax
145c2b652 4c897d20 mov qword ptr [rbp + 0x20], r15
145c2b656 48894528 mov qword ptr [rbp + 0x28], rax
145c2b65a 48c7453000000000 mov qword ptr [rbp + 0x30], 0
145c2b662 48895538 mov qword ptr [rbp + 0x38], rdx
145c2b666 48c7454022000000 mov qword ptr [rbp + 0x40], 0x22
145c2b66e 4c89f1 mov rcx, r14
145c2b671 4c89ea mov rdx, r13
145c2b674 4589e0 mov r8d, r12d
145c2b677 e8945f0900 call 0x145cc1610
145c2b67c 4d89f7 mov r15, r14
145c2b67f f3440f10b6c8040000 movss xmm14, dword ptr [rsi + 0x4c8]
145c2b688 f3440f10becc040000 movss xmm15, dword ptr [rsi + 0x4cc]
145c2b691 f30f10b6ec040000 movss xmm6, dword ptr [rsi + 0x4ec]
145c2b699 8b860c050000 mov eax, dword ptr [rsi + 0x50c]
145c2b69f 8945fc mov dword ptr [rbp - 4], eax
145c2b6a2 4889f1 mov rcx, rsi
145c2b6a5 e8c6d2feff call 0x145c18970
145c2b6aa ba58000000 mov edx, 0x58
145c2b6af 4c8d35de397b01 lea r14, [rip + 0x17b39de]
145c2b6b6 4c89f1 mov rcx, r14
145c2b6b9 e812ccfbff call 0x145be82d0
145c2b6be 4889c7 mov rdi, rax
145c2b6c1 4989d4 mov r12, rdx
145c2b6c4 4885c0 test rax, rax
145c2b6c7 490f44fe cmove rdi, r14
145c2b6cb b858000000 mov eax, 0x58
145c2b6d0 4c0f44e0 cmove r12, rax
145c2b6d4 f30f1086cc040000 movss xmm0, dword ptr [rsi + 0x4cc]
145c2b6dc f3410f5cc7 subss xmm0, xmm15
145c2b6e1 f3410f59c4 mulss xmm0, xmm12
145c2b6e6 f30f118580000000 movss dword ptr [rbp + 0x80], xmm0
145c2b6ee 4c8db580000000 lea r14, [rbp + 0x80]
145c2b6f5 4c897500 mov qword ptr [rbp], r14
145c2b6f9 488d1d209b4100 lea rbx, [rip + 0x419b20]
145c2b700 48895d08 mov qword ptr [rbp + 8], rbx
145c2b704 4c89e9 mov rcx, r13
145c2b707 4d89ee mov r14, r13
145c2b70a 4c8d2ddb397b01 lea r13, [rip + 0x17b39db]
145c2b711 4c89ea mov rdx, r13
145c2b714 4d89f8 mov r8, r15
145c2b717 e8548d4000 call 0x146034470
145c2b71c 0f104520 movups xmm0, xmmword ptr [rbp + 0x20]
145c2b720 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
145c2b724 488b4530 mov rax, qword ptr [rbp + 0x30]
145c2b728 488945d0 mov qword ptr [rbp - 0x30], rax
145c2b72c f30f1086c8040000 movss xmm0, dword ptr [rsi + 0x4c8]
145c2b734 f3410f5cc6 subss xmm0, xmm14
145c2b739 f30f118580000000 movss dword ptr [rbp + 0x80], xmm0
145c2b741 488d8580000000 lea rax, [rbp + 0x80]
145c2b748 48894500 mov qword ptr [rbp], rax
145c2b74c 48895d08 mov qword ptr [rbp + 8], rbx
145c2b750 4c89f1 mov rcx, r14
145c2b753 4c89ea mov rdx, r13
145c2b756 4d89f8 mov r8, r15
145c2b759 e8128d4000 call 0x146034470
145c2b75e 90 nop
145c2b75f 0f104520 movups xmm0, xmmword ptr [rbp + 0x20]
145c2b763 0f2945e0 movaps xmmword ptr [rbp - 0x20], xmm0
145c2b767 488b4530 mov rax, qword ptr [rbp + 0x30]
145c2b76b 488945f0 mov qword ptr [rbp - 0x10], rax
145c2b76f 4989f5 mov r13, rsi
145c2b772 f30f1086ec040000 movss xmm0, dword ptr [rsi + 0x4ec]
145c2b77a f30f5cc6 subss xmm0, xmm6
145c2b77e f30f118580000000 movss dword ptr [rbp + 0x80], xmm0
145c2b786 488db580000000 lea rsi, [rbp + 0x80]
145c2b78d 48897500 mov qword ptr [rbp], rsi
145c2b791 48895d08 mov qword ptr [rbp + 8], rbx
145c2b795 4c89f1 mov rcx, r14
145c2b798 488d1559397b01 lea rdx, [rip + 0x17b3959]
145c2b79f 4d89f8 mov r8, r15
145c2b7a2 e8c98c4000 call 0x146034470
145c2b7a7 90 nop
145c2b7a8 4c89fb mov rbx, r15
145c2b7ab 4d89f7 mov r15, r14
145c2b7ae 0f104520 movups xmm0, xmmword ptr [rbp + 0x20]
145c2b7b2 0f298580000000 movaps xmmword ptr [rbp + 0x80], xmm0
145c2b7b9 488b4530 mov rax, qword ptr [rbp + 0x30]
145c2b7bd 48898590000000 mov qword ptr [rbp + 0x90], rax
145c2b7c4 488d05d9377b01 lea rax, [rip + 0x17b37d9]
145c2b7cb 48894520 mov qword ptr [rbp + 0x20], rax
145c2b7cf 48c7452806000000 mov qword ptr [rbp + 0x28], 6
145c2b7d7 488d45c0 lea rax, [rbp - 0x40]
145c2b7db 48894530 mov qword ptr [rbp + 0x30], rax
145c2b7df 488d05e2297b01 lea rax, [rip + 0x17b29e2]
145c2b7e6 48894538 mov qword ptr [rbp + 0x38], rax
145c2b7ea 488d0d01397b01 lea rcx, [rip + 0x17b3901]
145c2b7f1 48894d40 mov qword ptr [rbp + 0x40], rcx
145c2b7f5 48c7454806000000 mov qword ptr [rbp + 0x48], 6
145c2b7fd 488d4de0 lea rcx, [rbp - 0x20]
145c2b801 48894d50 mov qword ptr [rbp + 0x50], rcx
145c2b805 48894558 mov qword ptr [rbp + 0x58], rax
145c2b809 488d0db0377b01 lea rcx, [rip + 0x17b37b0]
145c2b810 48894d60 mov qword ptr [rbp + 0x60], rcx
145c2b814 48c7456805000000 mov qword ptr [rbp + 0x68], 5
145c2b81c 48897570 mov qword ptr [rbp + 0x70], rsi
145c2b820 48894578 mov qword ptr [rbp + 0x78], rax
145c2b824 48c744242003000000 mov qword ptr [rsp + 0x20], 3
145c2b82d 488d4da8 lea rcx, [rbp - 0x58]
145c2b831 4889fa mov rdx, rdi
145c2b834 4d89e0 mov r8, r12
145c2b837 4d89f1 mov r9, r14
145c2b83a e871cefbff call 0x145be86b0
145c2b83f 90 nop
145c2b840 4989f6 mov r14, rsi
145c2b843 488b55b0 mov rdx, qword ptr [rbp - 0x50]
145c2b847 4c8b45b8 mov r8, qword ptr [rbp - 0x48]
145c2b84b 4889d9 mov rcx, rbx
145c2b84e 488995a0000000 mov qword ptr [rbp + 0xa0], rdx
145c2b855 e866daecff call 0x145af92c0
145c2b85a 90 nop
145c2b85b 4c89ee mov rsi, r13
145c2b85e 498bbd80060000 mov rdi, qword ptr [r13 + 0x680]
145c2b865 493bbd70060000 cmp rdi, qword ptr [r13 + 0x670]
145c2b86c 750d jne 0x145c2b87b
145c2b86e 488d8e70060000 lea rcx, [rsi + 0x670]
145c2b875 e866664300 call 0x146061ee0
145c2b87a 90 nop
145c2b87b 488b8678060000 mov rax, qword ptr [rsi + 0x678]
145c2b882 4889f9 mov rcx, rdi
145c2b885 48c1e105 shl rcx, 5
145c2b889 0f104500 movups xmm0, xmmword ptr [rbp]
145c2b88d 0f104d10 movups xmm1, xmmword ptr [rbp + 0x10]
145c2b891 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145c2b896 0f110408 movups xmmword ptr [rax + rcx], xmm0
145c2b89a 48ffc7 inc rdi
145c2b89d 4889be80060000 mov qword ptr [rsi + 0x680], rdi
145c2b8a4 488b55a8 mov rdx, qword ptr [rbp - 0x58]
145c2b8a8 4885d2 test rdx, rdx
145c2b8ab 7412 je 0x145c2b8bf
145c2b8ad 41b801000000 mov r8d, 1
145c2b8b3 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
145c2b8ba e811693dfa call 0x1400021d0
145c2b8bf 488b9580000000 mov rdx, qword ptr [rbp + 0x80]
145c2b8c6 4885d2 test rdx, rdx
145c2b8c9 7412 je 0x145c2b8dd
145c2b8cb 488b8d88000000 mov rcx, qword ptr [rbp + 0x88]
145c2b8d2 41b801000000 mov r8d, 1
145c2b8d8 e8f3683dfa call 0x1400021d0
145c2b8dd 488b55e0 mov rdx, qword ptr [rbp - 0x20]
145c2b8e1 4885d2 test rdx, rdx
145c2b8e4 740f je 0x145c2b8f5
145c2b8e6 488b4de8 mov rcx, qword ptr [rbp - 0x18]
145c2b8ea 41b801000000 mov r8d, 1
145c2b8f0 e8db683dfa call 0x1400021d0
145c2b8f5 488b55c0 mov rdx, qword ptr [rbp - 0x40]
145c2b8f9 4885d2 test rdx, rdx
145c2b8fc 740f je 0x145c2b90d
145c2b8fe 488b4dc8 mov rcx, qword ptr [rbp - 0x38]
145c2b902 41b801000000 mov r8d, 1
145c2b908 e8c3683dfa call 0x1400021d0
145c2b90d 488b8678030000 mov rax, qword ptr [rsi + 0x378]
145c2b914 486b8e8003000058 imul rcx, qword ptr [rsi + 0x380], 0x58
145c2b91c 31d2 xor edx, edx
145c2b91e 6690 nop
145c2b920 4839d1 cmp rcx, rdx
145c2b923 0f8427010000 je 0x145c2ba50
145c2b929 4c8b0410 mov r8, qword ptr [rax + rdx]
145c2b92d 4883c258 add rdx, 0x58
145c2b931 4180787506 cmp byte ptr [r8 + 0x75], 6
145c2b936 75e8 jne 0x145c2b920
145c2b938 8b45fc mov eax, dword ptr [rbp - 4]
145c2b93b 39860c050000 cmp dword ptr [rsi + 0x50c], eax
145c2b941 0f8609010000 jbe 0x145c2ba50
145c2b947 ba3e000000 mov edx, 0x3e
145c2b94c 488d3dad377b01 lea rdi, [rip + 0x17b37ad]
145c2b953 4889f9 mov rcx, rdi
145c2b956 e875c9fbff call 0x145be82d0
145c2b95b 4989d0 mov r8, rdx
145c2b95e 4885c0 test rax, rax
145c2b961 480f44c7 cmove rax, rdi
145c2b965 b93e000000 mov ecx, 0x3e
145c2b96a 4c0f44c1 cmove r8, rcx
145c2b96e 8b8e0c050000 mov ecx, dword ptr [rsi + 0x50c]
145c2b974 83f903 cmp ecx, 3
145c2b977 ba03000000 mov edx, 3
145c2b97c 0f43ca cmovae ecx, edx
145c2b97f ffc1 inc ecx
145c2b981 48894de0 mov qword ptr [rbp - 0x20], rcx
145c2b985 488d0d7c2e7b01 lea rcx, [rip + 0x17b2e7c]
145c2b98c 48894d20 mov qword ptr [rbp + 0x20], rcx
145c2b990 48c7452801000000 mov qword ptr [rbp + 0x28], 1
145c2b998 488d4de0 lea rcx, [rbp - 0x20]
145c2b99c 48894d30 mov qword ptr [rbp + 0x30], rcx
145c2b9a0 488d0d99377b01 lea rcx, [rip + 0x17b3799]
145c2b9a7 48894d38 mov qword ptr [rbp + 0x38], rcx
145c2b9ab 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145c2b9b4 4c89f1 mov rcx, r14
145c2b9b7 4889c2 mov rdx, rax
145c2b9ba 4d89f9 mov r9, r15
145c2b9bd e8eeccfbff call 0x145be86b0
145c2b9c2 488b9588000000 mov rdx, qword ptr [rbp + 0x88]
145c2b9c9 4c8b8590000000 mov r8, qword ptr [rbp + 0x90]
145c2b9d0 4889d9 mov rcx, rbx
145c2b9d3 488995a0000000 mov qword ptr [rbp + 0xa0], rdx
145c2b9da e8e1d8ecff call 0x145af92c0
145c2b9df 90 nop
145c2b9e0 488bbe80060000 mov rdi, qword ptr [rsi + 0x680]
145c2b9e7 483bbe70060000 cmp rdi, qword ptr [rsi + 0x670]
145c2b9ee 750d jne 0x145c2b9fd
145c2b9f0 488d8e70060000 lea rcx, [rsi + 0x670]
145c2b9f7 e8e4644300 call 0x146061ee0
145c2b9fc 90 nop
145c2b9fd 488b8678060000 mov rax, qword ptr [rsi + 0x678]
145c2ba04 4889f9 mov rcx, rdi
145c2ba07 48c1e105 shl rcx, 5
145c2ba0b 0f104500 movups xmm0, xmmword ptr [rbp]
145c2ba0f 0f104d10 movups xmm1, xmmword ptr [rbp + 0x10]
145c2ba13 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145c2ba18 0f110408 movups xmmword ptr [rax + rcx], xmm0
145c2ba1c 48ffc7 inc rdi
145c2ba1f 4889be80060000 mov qword ptr [rsi + 0x680], rdi
145c2ba26 488b9580000000 mov rdx, qword ptr [rbp + 0x80]
145c2ba2d 4885d2 test rdx, rdx
145c2ba30 741e je 0x145c2ba50
145c2ba32 41b801000000 mov r8d, 1
145c2ba38 488b8da0000000 mov rcx, qword ptr [rbp + 0xa0]
145c2ba3f e88c673dfa call 0x1400021d0
145c2ba44 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c2ba50 4d89fd mov r13, r15
145c2ba53 4989de mov r14, rbx
145c2ba56 f3440f10b6c8040000 movss xmm14, dword ptr [rsi + 0x4c8]
145c2ba5f f3450f59f5 mulss xmm14, xmm13
145c2ba64 ba08000000 mov edx, 8
145c2ba69 488d0df0367b01 lea rcx, [rip + 0x17b36f0]
145c2ba70 e85bc8fbff call 0x145be82d0
145c2ba75 31c9 xor ecx, ecx
145c2ba77 80be6f03000005 cmp byte ptr [rsi + 0x36f], 5
145c2ba7e 0f93c1 setae cl
145c2ba81 4c8d05f0207b01 lea r8, [rip + 0x17b20f0]
145c2ba88 f3450f593488 mulss xmm14, dword ptr [r8 + rcx*4]
145c2ba8e f30f10b6c8040000 movss xmm6, dword ptr [rsi + 0x4c8]
145c2ba96 f30f109638050000 movss xmm2, dword ptr [rsi + 0x538]
145c2ba9e f3440f58f2 addss xmm14, xmm2
145c2baa3 410f28ce movaps xmm1, xmm14
145c2baa7 f30f5dce minss xmm1, xmm6
145c2baab 0f28c1 movaps xmm0, xmm1
145c2baae f30fc2c103 cmpunordss xmm0, xmm1
145c2bab3 440f54f0 andps xmm14, xmm0
145c2bab7 0f55c1 andnps xmm0, xmm1
145c2baba 410f56c6 orps xmm0, xmm14
145c2babe f30f118638050000 movss dword ptr [rsi + 0x538], xmm0
145c2bac6 0f28c8 movaps xmm1, xmm0
145c2bac9 f30f5cca subss xmm1, xmm2
145c2bacd 440f2ed1 ucomiss xmm10, xmm1
145c2bad1 7373 jae 0x145c2bb46
145c2bad3 4885c0 test rax, rax
145c2bad6 b908000000 mov ecx, 8
145c2badb 480f44d1 cmove rdx, rcx
145c2badf 488d0d7a367b01 lea rcx, [rip + 0x17b367a]
145c2bae6 480f44c1 cmove rax, rcx
145c2baea 48c74520ffffffff mov qword ptr [rbp + 0x20], 0xffffffffffffffff
145c2baf2 48894528 mov qword ptr [rbp + 0x28], rax
145c2baf6 48895530 mov qword ptr [rbp + 0x30], rdx
145c2bafa 488d0567367b01 lea rax, [rip + 0x17b3667]
145c2bb01 48894538 mov qword ptr [rbp + 0x38], rax
145c2bb05 48c7454013000000 mov qword ptr [rbp + 0x40], 0x13
145c2bb0d c6454800 mov byte ptr [rbp + 0x48], 0
145c2bb11 0f57d2 xorps xmm2, xmm2
145c2bb14 f30f5ad1 cvtss2sd xmm2, xmm1
145c2bb18 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145c2bb21 41b908000000 mov r9d, 8
145c2bb27 488d8e50070000 lea rcx, [rsi + 0x750]
145c2bb2e 4c89ea mov rdx, r13
145c2bb31 e80a290700 call 0x145c9e440
145c2bb36 f30f10b6c8040000 movss xmm6, dword ptr [rsi + 0x4c8]
145c2bb3e f30f108638050000 movss xmm0, dword ptr [rsi + 0x538]
145c2bb46 f3410f5fc2 maxss xmm0, xmm10
145c2bb4b e8375c4300 call 0x146061787
145c2bb50 f34c0f2ce0 cvttss2si r12, xmm0
145c2bb55 410f2ec2 ucomiss xmm0, xmm10
145c2bb59 41bf00000000 mov r15d, 0
145c2bb5f 450f42e7 cmovb r12d, r15d
145c2bb63 410f2ec3 ucomiss xmm0, xmm11
145c2bb67 bbffffffff mov ebx, 0xffffffff
145c2bb6c 440f47e3 cmova r12d, ebx
145c2bb70 0f28c6 movaps xmm0, xmm6
145c2bb73 e80f5c4300 call 0x146061787
145c2bb78 f3480f2cf8 cvttss2si rdi, xmm0
145c2bb7d 410f2ec2 ucomiss xmm0, xmm10
145c2bb81 410f42ff cmovb edi, r15d
145c2bb85 410f2ec3 ucomiss xmm0, xmm11
145c2bb89 0f47fb cmova edi, ebx
145c2bb8c 4c8dbe580c0000 lea r15, [rsi + 0xc58]
145c2bb93 498b07 mov rax, qword ptr [r15]
145c2bb96 4885c0 test rax, rax
145c2bb99 0f8411010000 je 0x145c2bcb0
145c2bb9f 488b8e600c0000 mov rcx, qword ptr [rsi + 0xc60]
145c2bba6 66bb1c00 mov bx, 0x1c
145c2bbaa 6641bb1600 mov r11w, 0x16
145c2bbaf 440fb74036 movzx r8d, word ptr [rax + 0x36]
145c2bbb4 4589c1 mov r9d, r8d
145c2bbb7 4501c9 add r9d, r9d
145c2bbba 48c7c2ffffffff mov rdx, 0xffffffffffffffff
145c2bbc1 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c2bbd0 4d85c9 test r9, r9
145c2bbd3 743b je 0x145c2bc10
145c2bbd5 66443b5c503a cmp r11w, word ptr [rax + rdx*2 + 0x3a]
145c2bbdb 410f97c2 seta r10b
145c2bbdf 4180da00 sbb r10b, 0
145c2bbe3 48ffc2 inc rdx
145c2bbe6 4983c1fe add r9, -2
145c2bbea 4180fa01 cmp r10b, 1
145c2bbee 74e0 je 0x145c2bbd0
145c2bbf0 450fb6c2 movzx r8d, r10b
145c2bbf4 4585c0 test r8d, r8d
145c2bbf7 7437 je 0x145c2bc30
145c2bbf9 4883e901 sub rcx, 1
145c2bbfd 731e jae 0x145c2bc1d
145c2bbff e922010000 jmp 0x145c2bd26
145c2bc04 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c2bc10 4c89c2 mov rdx, r8
145c2bc13 4883e901 sub rcx, 1
145c2bc17 0f8209010000 jb 0x145c2bd26
145c2bc1d 488b44d050 mov rax, qword ptr [rax + rdx*8 + 0x50]
145c2bc22 eb8b jmp 0x145c2bbaf
145c2bc24 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c2bc30 4489649008 mov dword ptr [rax + rdx*4 + 8], r12d
145c2bc35 498b07 mov rax, qword ptr [r15]
145c2bc38 4885c0 test rax, rax
145c2bc3b 0f84ae000000 je 0x145c2bcef
145c2bc41 488b8e600c0000 mov rcx, qword ptr [rsi + 0xc60]
145c2bc48 440fb74036 movzx r8d, word ptr [rax + 0x36]
145c2bc4d 4589c1 mov r9d, r8d
145c2bc50 4501c9 add r9d, r9d
145c2bc53 48c7c2ffffffff mov rdx, 0xffffffffffffffff
145c2bc5a 660f1f440000 nop word ptr [rax + rax]
145c2bc60 4d85c9 test r9, r9
145c2bc63 743b je 0x145c2bca0
145c2bc65 663b5c503a cmp bx, word ptr [rax + rdx*2 + 0x3a]
145c2bc6a 410f97c2 seta r10b
145c2bc6e 4180da00 sbb r10b, 0
145c2bc72 48ffc2 inc rdx
145c2bc75 4983c1fe add r9, -2
145c2bc79 4180fa01 cmp r10b, 1
145c2bc7d 74e1 je 0x145c2bc60
145c2bc7f 450fb6c2 movzx r8d, r10b
145c2bc83 4585c0 test r8d, r8d
145c2bc86 0f84a4f8ffff je 0x145c2b530
145c2bc8c 4883e901 sub rcx, 1
145c2bc90 7317 jae 0x145c2bca9
145c2bc92 eb5d jmp 0x145c2bcf1
145c2bc94 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c2bca0 4c89c2 mov rdx, r8
145c2bca3 4883e901 sub rcx, 1
145c2bca7 7248 jb 0x145c2bcf1
145c2bca9 488b44d050 mov rax, qword ptr [rax + rdx*8 + 0x50]
145c2bcae eb98 jmp 0x145c2bc48
145c2bcb0 31c0 xor eax, eax
145c2bcb2 4c89f1 mov rcx, r14
145c2bcb5 66bb1c00 mov bx, 0x1c
145c2bcb9 4c897d20 mov qword ptr [rbp + 0x20], r15
145c2bcbd 48894528 mov qword ptr [rbp + 0x28], rax
145c2bcc1 48c7453000000000 mov qword ptr [rbp + 0x30], 0
145c2bcc9 48895538 mov qword ptr [rbp + 0x38], rdx
145c2bccd 48c7454016000000 mov qword ptr [rbp + 0x40], 0x16
145c2bcd5 4989ce mov r14, rcx
145c2bcd8 4c89ea mov rdx, r13
145c2bcdb 4589e0 mov r8d, r12d
145c2bcde e82d590900 call 0x145cc1610
145c2bce3 498b07 mov rax, qword ptr [r15]
145c2bce6 4885c0 test rax, rax
145c2bce9 0f8552ffffff jne 0x145c2bc41
145c2bcef 31c0 xor eax, eax
145c2bcf1 4c897d20 mov qword ptr [rbp + 0x20], r15
145c2bcf5 48894528 mov qword ptr [rbp + 0x28], rax
145c2bcf9 48c7453000000000 mov qword ptr [rbp + 0x30], 0
145c2bd01 48895538 mov qword ptr [rbp + 0x38], rdx
145c2bd05 48c745401c000000 mov qword ptr [rbp + 0x40], 0x1c
145c2bd0d 4c89f1 mov rcx, r14
145c2bd10 4c89ea mov rdx, r13
145c2bd13 4189f8 mov r8d, edi
145c2bd16 e8f5580900 call 0x145cc1610
145c2bd1b 8bbe34050000 mov edi, dword ptr [rsi + 0x534]
145c2bd21 e914f8ffff jmp 0x145c2b53a
145c2bd26 4c89f1 mov rcx, r14
145c2bd29 eb8e jmp 0x145c2bcb9
145c2bd2b 498b07 mov rax, qword ptr [r15]
145c2bd2e 4885c0 test rax, rax
145c2bd31 7474 je 0x145c2bda7
145c2bd33 488b8e600c0000 mov rcx, qword ptr [rsi + 0xc60]
145c2bd3a bacc020000 mov edx, 0x2cc
145c2bd3f 440fb74836 movzx r9d, word ptr [rax + 0x36]
145c2bd44 4589ca mov r10d, r9d
145c2bd47 4501d2 add r10d, r10d
145c2bd4a 49c7c0ffffffff mov r8, 0xffffffffffffffff
145c2bd51 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145c2bd60 4d85d2 test r10, r10
145c2bd63 742b je 0x145c2bd90
145c2bd65 460fb75c403a movzx r11d, word ptr [rax + r8*2 + 0x3a]
145c2bd6b 4439da cmp edx, r11d
145c2bd6e 410f97c3 seta r11b
145c2bd72 4180db00 sbb r11b, 0
145c2bd76 49ffc0 inc r8
145c2bd79 4983c2fe add r10, -2
145c2bd7d 4180fb01 cmp r11b, 1
145c2bd81 74dd je 0x145c2bd60
145c2bd83 450fb6cb movzx r9d, r11b
145c2bd87 4585c9 test r9d, r9d
145c2bd8a 7414 je 0x145c2bda0
145c2bd8c eb05 jmp 0x145c2bd93
145c2bd8e 6690 nop
145c2bd90 4d89c8 mov r8, r9
145c2bd93 4883e901 sub rcx, 1
145c2bd97 7210 jb 0x145c2bda9
145c2bd99 4a8b44c050 mov rax, qword ptr [rax + r8*8 + 0x50]
145c2bd9e eb9f jmp 0x145c2bd3f
145c2bda0 42897c8008 mov dword ptr [rax + r8*4 + 8], edi
145c2bda5 eb2d jmp 0x145c2bdd4
145c2bda7 31c0 xor eax, eax
145c2bda9 4c897d20 mov qword ptr [rbp + 0x20], r15
145c2bdad 48894528 mov qword ptr [rbp + 0x28], rax
145c2bdb1 48c7453000000000 mov qword ptr [rbp + 0x30], 0
145c2bdb9 4c894538 mov qword ptr [rbp + 0x38], r8
145c2bdbd 48c74540cc020000 mov qword ptr [rbp + 0x40], 0x2cc
145c2bdc5 4889e9 mov rcx, rbp
145c2bdc8 488d5520 lea rdx, [rbp + 0x20]
145c2bdcc 4189f8 mov r8d, edi
145c2bdcf e83c580900 call 0x145cc1610
145c2bdd4 8b8630050000 mov eax, dword ptr [rsi + 0x530]
145c2bdda 83f801 cmp eax, 1
145c2bddd 83d0ff adc eax, -1
145c2bde0 0f57c9 xorps xmm1, xmm1
145c2bde3 f3480f2ac8 cvtsi2ss xmm1, rax
145c2bde8 f30f1015383e6200 movss xmm2, dword ptr [rip + 0x623e38]
145c2bdf0 f30f59d1 mulss xmm2, xmm1
145c2bdf4 f30f5815340b6200 addss xmm2, dword ptr [rip + 0x620b34]
145c2bdfc f30f10059c0c6200 movss xmm0, dword ptr [rip + 0x620c9c]
145c2be04 f30f59c1 mulss xmm0, xmm1
145c2be08 f30f59c1 mulss xmm0, xmm1
145c2be0c f30f58c2 addss xmm0, xmm2
145c2be10 e85a594300 call 0x14606176f
145c2be15 f3480f2cc0 cvttss2si rax, xmm0
145c2be1a 31c9 xor ecx, ecx
145c2be1c 0f57c9 xorps xmm1, xmm1
145c2be1f 0f2ec1 ucomiss xmm0, xmm1
145c2be22 0f42c1 cmovb eax, ecx
145c2be25 0f2e05c80d6200 ucomiss xmm0, dword ptr [rip + 0x620dc8]
145c2be2c 41b8ffffffff mov r8d, 0xffffffff
145c2be32 440f46c0 cmovbe r8d, eax
145c2be36 488b86580c0000 mov rax, qword ptr [rsi + 0xc58]
145c2be3d 4885c0 test rax, rax
145c2be40 746e je 0x145c2beb0
145c2be42 488b8e600c0000 mov rcx, qword ptr [rsi + 0xc60]
145c2be49 bacd020000 mov edx, 0x2cd
145c2be4e 440fb75036 movzx r10d, word ptr [rax + 0x36]
145c2be53 4589d3 mov r11d, r10d
145c2be56 4501db add r11d, r11d
145c2be59 49c7c1ffffffff mov r9, 0xffffffffffffffff
145c2be60 4d85db test r11, r11
145c2be63 742b je 0x145c2be90
145c2be65 420fb77c483a movzx edi, word ptr [rax + r9*2 + 0x3a]
145c2be6b 39fa cmp edx, edi
145c2be6d 0f97c3 seta bl
145c2be70 80db00 sbb bl, 0
145c2be73 49ffc1 inc r9
145c2be76 4983c3fe add r11, -2
145c2be7a 80fb01 cmp bl, 1
145c2be7d 74e1 je 0x145c2be60
145c2be7f 440fb6d3 movzx r10d, bl
145c2be83 4585d2 test r10d, r10d
145c2be86 7418 je 0x145c2bea0
145c2be88 eb09 jmp 0x145c2be93
145c2be8a 660f1f440000 nop word ptr [rax + rax]
145c2be90 4d89d1 mov r9, r10
145c2be93 4883e901 sub rcx, 1
145c2be97 7219 jb 0x145c2beb2
145c2be99 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
145c2be9e ebae jmp 0x145c2be4e
145c2bea0 4689448808 mov dword ptr [rax + r9*4 + 8], r8d
145c2bea5 83bed40c000000 cmp dword ptr [rsi + 0xcd4], 0
145c2beac 7535 jne 0x145c2bee3
145c2beae eb64 jmp 0x145c2bf14
145c2beb0 31c0 xor eax, eax
145c2beb2 4c897d20 mov qword ptr [rbp + 0x20], r15
145c2beb6 48894528 mov qword ptr [rbp + 0x28], rax
145c2beba 48c7453000000000 mov qword ptr [rbp + 0x30], 0
145c2bec2 4c894d38 mov qword ptr [rbp + 0x38], r9
145c2bec6 48c74540cd020000 mov qword ptr [rbp + 0x40], 0x2cd
145c2bece 4889e9 mov rcx, rbp
145c2bed1 488d5520 lea rdx, [rbp + 0x20]
145c2bed5 e836570900 call 0x145cc1610
145c2beda 83bed40c000000 cmp dword ptr [rsi + 0xcd4], 0
145c2bee1 7431 je 0x145c2bf14
145c2bee3 80be830d000001 cmp byte ptr [rsi + 0xd83], 1
145c2beea 7528 jne 0x145c2bf14
145c2beec 80be780d000000 cmp byte ptr [rsi + 0xd78], 0
145c2bef3 751f jne 0x145c2bf14
145c2bef5 80be740d000001 cmp byte ptr [rsi + 0xd74], 1
145c2befc 7509 jne 0x145c2bf07
145c2befe 80be750d000000 cmp byte ptr [rsi + 0xd75], 0
145c2bf05 740d je 0x145c2bf14
145c2bf07 4889f1 mov rcx, rsi
145c2bf0a 31d2 xor edx, edx
145c2bf0c 41b001 mov r8b, 1
145c2bf0f e85c2a0600 call 0x145c8e970
145c2bf14 0f28b5b0000000 movaps xmm6, xmmword ptr [rbp + 0xb0]
145c2bf1b 0f28bdc0000000 movaps xmm7, xmmword ptr [rbp + 0xc0]
145c2bf22 440f2885d0000000 movaps xmm8, xmmword ptr [rbp + 0xd0]
145c2bf2a 440f288de0000000 movaps xmm9, xmmword ptr [rbp + 0xe0]
145c2bf32 440f2895f0000000 movaps xmm10, xmmword ptr [rbp + 0xf0]
145c2bf3a 440f289d00010000 movaps xmm11, xmmword ptr [rbp + 0x100]
145c2bf42 440f28a510010000 movaps xmm12, xmmword ptr [rbp + 0x110]
145c2bf4a 440f28ad20010000 movaps xmm13, xmmword ptr [rbp + 0x120]
145c2bf52 440f28b530010000 movaps xmm14, xmmword ptr [rbp + 0x130]
145c2bf5a 440f28bd40010000 movaps xmm15, xmmword ptr [rbp + 0x140]
145c2bf62 4881c4d8010000 add rsp, 0x1d8
145c2bf69 5b pop rbx
145c2bf6a 5f pop rdi
145c2bf6b 5e pop rsi
145c2bf6c 415c pop r12
145c2bf6e 415d pop r13
145c2bf70 415e pop r14
145c2bf72 415f pop r15
145c2bf74 5d pop rbp
145c2bf75 c3 ret

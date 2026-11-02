1458b8684 83791002 cmp dword ptr [rcx + 0x10], 2
1458b8688 0f84ec180000 je 0x1458b9f7a
1458b868e 80b9d70a000000 cmp byte ptr [rcx + 0xad7], 0
1458b8695 0f84df180000 je 0x1458b9f7a
1458b869b 8b81e8040000 mov eax, dword ptr [rcx + 0x4e8]
1458b86a1 8985c0000000 mov dword ptr [rbp + 0xc0], eax
1458b86a7 f3440f1081440a0000 movss xmm8, dword ptr [rcx + 0xa44]
1458b86b0 8bb180090000 mov esi, dword ptr [rcx + 0x980]
1458b86b6 488b81a0100000 mov rax, qword ptr [rcx + 0x10a0]
1458b86bd 488985a0000000 mov qword ptr [rbp + 0xa0], rax
1458b86c4 0fb68114030000 movzx eax, byte ptr [rcx + 0x314]
1458b86cb 48898568010000 mov qword ptr [rbp + 0x168], rax
1458b86d2 4c8b81a0020000 mov r8, qword ptr [rcx + 0x2a0]
1458b86d9 488b91a8020000 mov rdx, qword ptr [rcx + 0x2a8]
1458b86e0 8b8164070000 mov eax, dword ptr [rcx + 0x764]
1458b86e6 f3480f2ac0 cvtsi2ss xmm0, rax
1458b86eb 0fb781c0020000 movzx eax, word ptr [rcx + 0x2c0]
1458b86f2 450f57ed xorps xmm13, xmm13
1458b86f6 f3440f2ae8 cvtsi2ss xmm13, eax
1458b86fb f3440f1025cc4b4e00 movss xmm12, dword ptr [rip + 0x4e4bcc]
1458b8704 410f28cd movaps xmm1, xmm13
1458b8708 f3410f5ecc divss xmm1, xmm12
1458b870d f30f5ec1 divss xmm0, xmm1
1458b8711 f3480f2cf8 cvttss2si rdi, xmm0
1458b8716 4531f6 xor r14d, r14d
1458b8719 450f57c9 xorps xmm9, xmm9
1458b871d 410f2ec1 ucomiss xmm0, xmm9
1458b8721 410f42fe cmovb edi, r14d
1458b8725 f3440f101512a75100 movss xmm10, dword ptr [rip + 0x51a712]
1458b872e 410f2ec2 ucomiss xmm0, xmm10
1458b8732 b8ffffffff mov eax, 0xffffffff
1458b8737 0f47f8 cmova edi, eax
1458b873a 48898da8000000 mov qword ptr [rbp + 0xa8], rcx
1458b8741 8b9970070000 mov ebx, dword ptr [rcx + 0x770]
1458b8747 4c8985b0000000 mov qword ptr [rbp + 0xb0], r8
1458b874e 4c89c1 mov rcx, r8
1458b8751 488995b8000000 mov qword ptr [rbp + 0xb8], rdx
1458b8758 e87349fdff call 0x14588d0d0
1458b875d f3480f2af7 cvtsi2ss xmm6, rdi
1458b8762 48898578010000 mov qword ptr [rbp + 0x178], rax
1458b8769 4889df mov rdi, rbx
1458b876c 488d1cdd00000000 lea rbx, [rbx*8]
1458b8774 f30f593554495100 mulss xmm6, dword ptr [rip + 0x514954]
1458b877c 0f28c6 movaps xmm0, xmm6
1458b877f e887193400 call 0x145bfa10b
1458b8784 f34c0f2cf8 cvttss2si r15, xmm0
1458b8789 f3440f101d8eac5e00 movss xmm11, dword ptr [rip + 0x5eac8e]
1458b8792 410f2ec3 ucomiss xmm0, xmm11
1458b8796 49bdffffffffffffff7f movabs r13, 0x7fffffffffffffff
1458b87a0 4d0f47fd cmova r15, r13
1458b87a4 0f2ec0 ucomiss xmm0, xmm0
1458b87a7 4d0f4afe cmovp r15, r14
1458b87ab 410f28f8 movaps xmm7, xmm8
1458b87af f30f5e3d897d5300 divss xmm7, dword ptr [rip + 0x537d89]
1458b87b7 f30f593dc14b4e00 mulss xmm7, dword ptr [rip + 0x4e4bc1]
1458b87bf 0f28c7 movaps xmm0, xmm7
1458b87c2 e844193400 call 0x145bfa10b
1458b87c7 f34c0f2ce0 cvttss2si r12, xmm0
1458b87cc 410f2ec3 ucomiss xmm0, xmm11
1458b87d0 4d0f47e5 cmova r12, r13
1458b87d4 0f2ec0 ucomiss xmm0, xmm0
1458b87d7 4d0f4ae6 cmovp r12, r14
1458b87db 488d1c9b lea rbx, [rbx + rbx*4]
1458b87df 4885f6 test rsi, rsi
1458b87e2 49c7c538ffffff mov r13, 0xffffffffffffff38
1458b87e9 4c0f44ee cmove r13, rsi
1458b87ed 41bec8000000 mov r14d, 0xc8
1458b87f3 48897538 mov qword ptr [rbp + 0x38], rsi
1458b87f7 4c0f44f6 cmove r14, rsi
1458b87fb 7505 jne 0x1458b8802
1458b87fd 0f57c9 xorps xmm1, xmm1
1458b8800 eb08 jmp 0x1458b880a
1458b8802 f30f100df67c5300 movss xmm1, dword ptr [rip + 0x537cf6]
1458b880a f3480f2ad7 cvtsi2ss xmm2, rdi
1458b880f f30f58fe addss xmm7, xmm6
1458b8813 488bb5a8000000 mov rsi, qword ptr [rbp + 0xa8]
1458b881a 488d4610 lea rax, [rsi + 0x10]
1458b881e 48894540 mov qword ptr [rbp + 0x40], rax
1458b8822 f30f5915ea4e4e00 mulss xmm2, dword ptr [rip + 0x4e4eea]
1458b882a f30f58d7 addss xmm2, xmm7
1458b882e 0f57c0 xorps xmm0, xmm0
1458b8831 f30f2a8578010000 cvtsi2ss xmm0, dword ptr [rbp + 0x178]
1458b8839 f30f5905cf9c5200 mulss xmm0, dword ptr [rip + 0x529ccf]
1458b8841 f30f5e05c7526800 divss xmm0, dword ptr [rip + 0x6852c7]
1458b8849 f30f58d1 addss xmm2, xmm1
1458b884d f30f10354b4a4e00 movss xmm6, dword ptr [rip + 0x4e4a4b]
1458b8855 f30f58c6 addss xmm0, xmm6
1458b8859 f30f59c2 mulss xmm0, xmm2
1458b885d e8a9183400 call 0x145bfa10b
1458b8862 f3480f2cc0 cvttss2si rax, xmm0
1458b8867 410f2ec1 ucomiss xmm0, xmm9
1458b886b b900000000 mov ecx, 0
1458b8870 0f42c1 cmovb eax, ecx
1458b8873 410f2ec2 ucomiss xmm0, xmm10
1458b8877 b9ffffffff mov ecx, 0xffffffff
1458b887c 0f47c1 cmova eax, ecx
1458b887f 498d3c1c lea rdi, [r12 + rbx]
1458b8883 4c01ff add rdi, r15
1458b8886 4929fd sub r13, rdi
1458b8889 4901c5 add r13, rax
1458b888c 4c8965d8 mov qword ptr [rbp - 0x28], r12
1458b8890 4c897de0 mov qword ptr [rbp - 0x20], r15
1458b8894 4989f7 mov r15, rsi
1458b8897 4c01f7 add rdi, r14
1458b889a 4c01ef add rdi, r13
1458b889d 0f57c9 xorps xmm1, xmm1
1458b88a0 f3480f2acf cvtsi2ss xmm1, rdi
1458b88a5 48895de8 mov qword ptr [rbp - 0x18], rbx
1458b88a9 f30f1015abefc500 movss xmm2, dword ptr [rip + 0xc5efab]
1458b88b1 f3440f58ea addss xmm13, xmm2
1458b88b6 f3450f5eec divss xmm13, xmm12
1458b88bb 0fb786c2020000 movzx eax, word ptr [rsi + 0x2c2]
1458b88c2 0f57c0 xorps xmm0, xmm0
1458b88c5 f30f2ac0 cvtsi2ss xmm0, eax
1458b88c9 f3440f592db6455100 mulss xmm13, dword ptr [rip + 0x5145b6]
1458b88d2 f30f58c2 addss xmm0, xmm2
1458b88d6 f3410f5ec4 divss xmm0, xmm12
1458b88db f30f590511995200 mulss xmm0, dword ptr [rip + 0x529911]
1458b88e3 f3410f58c5 addss xmm0, xmm13
1458b88e8 0fb786c4020000 movzx eax, word ptr [rsi + 0x2c4]
1458b88ef f30f2ad8 cvtsi2ss xmm3, eax
1458b88f3 f30f58da addss xmm3, xmm2
1458b88f7 f3410f5edc divss xmm3, xmm12
1458b88fc f30f591df8475100 mulss xmm3, dword ptr [rip + 0x5147f8]
1458b8904 f30f58d8 addss xmm3, xmm0
1458b8908 0fb786c6020000 movzx eax, word ptr [rsi + 0x2c6]
1458b890f 0f57c0 xorps xmm0, xmm0
1458b8912 f30f2ac0 cvtsi2ss xmm0, eax
1458b8916 4c8975f0 mov qword ptr [rbp - 0x10], r14
1458b891a f30f58c2 addss xmm0, xmm2
1458b891e f3410f5ec4 divss xmm0, xmm12
1458b8923 f30f58c0 addss xmm0, xmm0
1458b8927 f30f58c3 addss xmm0, xmm3
1458b892b f30f58c6 addss xmm0, xmm6
1458b892f f30f5d05d1c35100 minss xmm0, dword ptr [rip + 0x51c3d1]
1458b8937 4c896df8 mov qword ptr [rbp - 8], r13
1458b893b f30f580581475100 addss xmm0, dword ptr [rip + 0x514781]
1458b8943 f30f59c1 mulss xmm0, xmm1
1458b8947 e8bf173400 call 0x145bfa10b
1458b894c f3480f2cc0 cvttss2si rax, xmm0
1458b8951 410f2ec3 ucomiss xmm0, xmm11
1458b8955 48beffffffffffffff7f movabs rsi, 0x7fffffffffffffff
1458b895f 480f47c6 cmova rax, rsi
1458b8963 0f2ec0 ucomiss xmm0, xmm0
1458b8966 b900000000 mov ecx, 0
1458b896b 480f4ac1 cmovp rax, rcx
1458b896f 48894500 mov qword ptr [rbp], rax
1458b8973 4801f8 add rax, rdi
1458b8976 f34d0f2ce8 cvttss2si r13, xmm8
1458b897b 450f2ec1 ucomiss xmm8, xmm9
1458b897f 440f42e9 cmovb r13d, ecx
1458b8983 31ff xor edi, edi
1458b8985 450f2ec2 ucomiss xmm8, xmm10
1458b8989 b9ffffffff mov ecx, 0xffffffff
1458b898e 440f47e9 cmova r13d, ecx
1458b8992 0f57c0 xorps xmm0, xmm0
1458b8995 f3480f2ac0 cvtsi2ss xmm0, rax
1458b899a f3410f598720110000 mulss xmm0, dword ptr [r15 + 0x1120]
1458b89a3 e863173400 call 0x145bfa10b
1458b89a8 f3480f2cc0 cvttss2si rax, xmm0
1458b89ad 410f2ec3 ucomiss xmm0, xmm11
1458b89b1 480f47c6 cmova rax, rsi
1458b89b5 0f2ec0 ucomiss xmm0, xmm0
1458b89b8 480f4ac7 cmovp rax, rdi
1458b89bc 48894508 mov qword ptr [rbp + 8], rax
1458b8a65 4489e0 mov eax, r12d
1458b8a68 83e003 and eax, 3
1458b8a6b b904000000 mov ecx, 4
1458b8a70 480f45c8 cmovne rcx, rax
1458b8a74 4c89e0 mov rax, r12
1458b8a77 4829c8 sub rax, rcx
1458b8a7a 498d4b28 lea rcx, [r11 + 0x28]
1458b8a7e 0f57c0 xorps xmm0, xmm0
1458b8a81 4889c2 mov rdx, rax
1458b8a84 0f57c9 xorps xmm1, xmm1
1458b8a87 660f1f840000000000 nop word ptr [rax + rax]
1458b8a90 f30f7e51f0 movq xmm2, qword ptr [rcx - 0x10]
1458b8a95 f30f6f59e0 movdqu xmm3, xmmword ptr [rcx - 0x20]
1458b8a9a 660f6cda punpcklqdq xmm3, xmm2
1458b8a9e 660fd4cb paddq xmm1, xmm3
1458b8aa2 f30f6f11 movdqu xmm2, xmmword ptr [rcx]
1458b8aa6 f30f7e5910 movq xmm3, qword ptr [rcx + 0x10]
1458b8aab 660f6cd3 punpcklqdq xmm2, xmm3
1458b8aaf 660fd4c2 paddq xmm0, xmm2
1458b8ab3 4883c140 add rcx, 0x40
1458b8ab7 4883c2fc add rdx, -4
1458b8abb 75d3 jne 0x1458b8a90
1458b8abd 660fd4c1 paddq xmm0, xmm1
1458b8ac1 660f70c8ee pshufd xmm1, xmm0, 0xee
1458b8ac6 660fd4c8 paddq xmm1, xmm0
1458b8aca 66480f7ec9 movq rcx, xmm1
1458b8acf 4889c2 mov rdx, rax
1458b8ad2 48c1e204 shl rdx, 4
1458b8ad6 4c01da add rdx, r11
1458b8ad9 4883c208 add rdx, 8
1458b8add 0f1f00 nop dword ptr [rax]
1458b8ae0 48030a add rcx, qword ptr [rdx]
1458b8ae3 48ffc0 inc rax
1458b8ae6 4883c210 add rdx, 0x10
1458b8aea 4939c4 cmp r12, rax
1458b8aed 75f1 jne 0x1458b8ae0
1458b8aef 4531c0 xor r8d, r8d
1458b8af2 4885c9 test rcx, rcx
1458b8af5 4c0f4fc1 cmovg r8, rcx
1458b8af9 4489853c010000 mov dword ptr [rbp + 0x13c], r8d
1458b8b00 488b4508 mov rax, qword ptr [rbp + 8]
1458b8b04 48894730 mov qword ptr [rdi + 0x30], rax
1458b8b08 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
1458b8b0c 0f104de8 movups xmm1, xmmword ptr [rbp - 0x18]
1458b8b10 0f1055f8 movups xmm2, xmmword ptr [rbp - 8]
1458b8b14 0f115720 movups xmmword ptr [rdi + 0x20], xmm2
1458b8b18 0f114f10 movups xmmword ptr [rdi + 0x10], xmm1
1458b8b1c 0f1107 movups xmmword ptr [rdi], xmm0
1458b8b1f 41b101 mov r9b, 1
1458b8b22 4881fbffffff00 cmp rbx, 0xffffff
1458b8b29 410f95c6 setne r14b
1458b8b2d 0f849c0b0000 je 0x1458b96cf
1458b8b33 4585c0 test r8d, r8d
1458b8b36 0f84930b0000 je 0x1458b96cf
1458b8b3c 498dbf200b0000 lea rdi, [r15 + 0xb20]
1458b8b43 498b87880b0000 mov rax, qword ptr [r15 + 0xb88]
1458b8b4a 498b8f900b0000 mov rcx, qword ptr [r15 + 0xb90]
1458b8b51 48c1e105 shl rcx, 5
1458b8b55 4531d2 xor r10d, r10d
1458b8b58 488b9568010000 mov rdx, qword ptr [rbp + 0x168]
1458b8b5f 4c896d30 mov qword ptr [rbp + 0x30], r13
1458b8b63 4c899dd0000000 mov qword ptr [rbp + 0xd0], r11
1458b8b6a 660f1f440000 nop word ptr [rax + rax]
1458b8b70 4c39d1 cmp rcx, r10
1458b8b73 7419 je 0x1458b8b8e
1458b8b75 4d8d4a20 lea r9, [r10 + 0x20]
1458b8b79 4238541004 cmp byte ptr [rax + r10 + 4], dl
1458b8b7e 4d89ca mov r10, r9
1458b8b81 75ed jne 0x1458b8b70
1458b8b83 428b4408e0 mov eax, dword ptr [rax + r9 - 0x20]
1458b8b88 48894528 mov qword ptr [rbp + 0x28], rax
1458b8b8c eb08 jmp 0x1458b8b96
1458b8b8e 48c7452800000000 mov qword ptr [rbp + 0x28], 0
1458b8ba0 e8fb42feff call 0x14589cea0
1458b8ba5 90 nop
1458b8ba6 89c6 mov esi, eax
1458b8ba8 4189d6 mov r14d, edx
1458b8bab c6858701000001 mov byte ptr [rbp + 0x187], 1
1458b8bb2 4889f9 mov rcx, rdi
1458b8bb5 e806a8feff call 0x1458a33c0
1458b8bba 90 nop
1458b8bbb 498b87880b0000 mov rax, qword ptr [r15 + 0xb88]
1458b8bc2 498b8f900b0000 mov rcx, qword ptr [r15 + 0xb90]
1458b8bc9 48c1e105 shl rcx, 5
1458b8bcd 4531d2 xor r10d, r10d
1458b8bd0 31d2 xor edx, edx
1458b8bd2 4c8b8d68010000 mov r9, qword ptr [rbp + 0x168]
1458b8bd9 0f1f8000000000 nop dword ptr [rax]
1458b8be0 4839d1 cmp rcx, rdx
1458b8be3 7413 je 0x1458b8bf8
1458b8be5 4c8d4220 lea r8, [rdx + 0x20]
1458b8be9 44384c1004 cmp byte ptr [rax + rdx + 4], r9b
1458b8bee 4c89c2 mov rdx, r8
1458b8bf1 75ed jne 0x1458b8be0
1458b8bf3 468b5400e0 mov r10d, dword ptr [rax + r8 - 0x20]
1458b8bf8 b86e000000 mov eax, 0x6e
1458b8bfd 4489d3 mov ebx, r10d
1458b9091 8b853c010000 mov eax, dword ptr [rbp + 0x13c]
1458b9097 c6858601000001 mov byte ptr [rbp + 0x186], 1
1458b909e 89442420 mov dword ptr [rsp + 0x20], eax
1458b90a2 4c8d05452f3301 lea r8, [rip + 0x1332f45]
1458b90a9 488d8dd8000000 lea rcx, [rbp + 0xd8]
1458b90b0 488d9540010000 lea rdx, [rbp + 0x140]
1458b90b7 41b902000000 mov r9d, 2
1458b90bd e84ed80200 call 0x1458e6910
1458b90c2 90 nop
1458b90c3 c6858601000001 mov byte ptr [rbp + 0x186], 1
1458b90ca 488b4528 mov rax, qword ptr [rbp + 0x28]
1458b90ce 89442420 mov dword ptr [rsp + 0x20], eax
1458b90d2 4c8d05172f3301 lea r8, [rip + 0x1332f17]
1458b90d9 488d8d40010000 lea rcx, [rbp + 0x140]
1458b90e0 488d95d8000000 lea rdx, [rbp + 0xd8]
1458b90e7 41b906000000 mov r9d, 6
1458b90ed e81ed80200 call 0x1458e6910
1458b90f2 90 nop
1458b90f3 c6858601000001 mov byte ptr [rbp + 0x186], 1
1458b90fa 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458b90fe 89442420 mov dword ptr [rsp + 0x20], eax
1458b9102 4c8d05ed2e3301 lea r8, [rip + 0x1332eed]
1458b9109 488d8dd8000000 lea rcx, [rbp + 0xd8]
1458b9110 488d9540010000 lea rdx, [rbp + 0x140]
1458b9117 41b905000000 mov r9d, 5
1458b911d e8eed70200 call 0x1458e6910
1458b96cf 4d8da7200b0000 lea r12, [r15 + 0xb20]
1458b96d6 498b87280b0000 mov rax, qword ptr [r15 + 0xb28]
1458b96dd 496b97300b000038 imul rdx, qword ptr [r15 + 0xb30], 0x38
1458b96e5 31c9 xor ecx, ecx
1458b96e7 4989c0 mov r8, rax
1458b96ea 660f1f440000 nop word ptr [rax + rax]
1458b96f0 4839ca cmp rdx, rcx
1458b96f3 7437 je 0x1458b972c
1458b96f5 4883c138 add rcx, 0x38
1458b96f9 49395818 cmp qword ptr [r8 + 0x18], rbx
1458b96fd 4d8d4038 lea r8, [r8 + 0x38]
1458b9701 75ed jne 0x1458b96f0
1458b9703 8b5408e8 mov edx, dword ptr [rax + rcx - 0x18]
1458b9707 448b85c0000000 mov r8d, dword ptr [rbp + 0xc0]
1458b970e 4139d0 cmp r8d, edx
1458b9711 410f47d0 cmova edx, r8d
1458b9715 448b4408ec mov r8d, dword ptr [rax + rcx - 0x14]
1458b971a 895408e8 mov dword ptr [rax + rcx - 0x18], edx
1458b971e 4539c5 cmp r13d, r8d
1458b9721 450f47c5 cmova r8d, r13d
1458b9725 44894408ec mov dword ptr [rax + rcx - 0x14], r8d
1458b972a eb2c jmp 0x1458b9758
1458b972c 4983bfe00e0000ff cmp qword ptr [r15 + 0xee0], -1
1458b9734 7422 je 0x1458b9758
1458b9736 49399ff80e0000 cmp qword ptr [r15 + 0xef8], rbx
1458b973d 7519 jne 0x1458b9758
1458b973f 418b87000f0000 mov eax, dword ptr [r15 + 0xf00]
1458b9746 8b8dc0000000 mov ecx, dword ptr [rbp + 0xc0]
1458b974c 39c1 cmp ecx, eax
1458b974e 0f47c1 cmova eax, ecx
1458b9751 418987000f0000 mov dword ptr [r15 + 0xf00], eax
1458b9758 4180bf6211000000 cmp byte ptr [r15 + 0x1162], 0
1458b9760 7418 je 0x1458b977a
1458b9762 44888d87010000 mov byte ptr [rbp + 0x187], r9b
1458b9769 4c89e1 mov rcx, r12
1458b976c 4489ce mov esi, r9d
1458b976f e84c9cfeff call 0x1458a33c0
1458b9774 90 nop
1458b9775 e9df070000 jmp 0x1458b9f59
1458b977a 44898d78010000 mov dword ptr [rbp + 0x178], r9d
1458b9781 41c6876211000001 mov byte ptr [r15 + 0x1162], 1
1458b9789 44847538 test byte ptr [rbp + 0x38], r14b
1458b978d 0f8436070000 je 0x1458b9ec9
1458b9793 488b8db0000000 mov rcx, qword ptr [rbp + 0xb0]
1458b979a 488b95b8000000 mov rdx, qword ptr [rbp + 0xb8]
1458b97a1 e82a39fdff call 0x14588d0d0
1458b97a6 4883f80a cmp rax, 0xa
1458b97aa 0f8719070000 ja 0x1458b9ec9
1458b97b0 488d5001 lea rdx, [rax + 1]
1458b97b4 4869caf0000000 imul rcx, rdx, 0xf0
1458b97bb 4c8d2dce4b3201 lea r13, [rip + 0x1324bce]
1458b97c2 4901cd add r13, rcx
1458b97c5 498b8f400b0000 mov rcx, qword ptr [r15 + 0xb40]
1458b97cc 498bb7480b0000 mov rsi, qword ptr [r15 + 0xb48]
1458b97d3 4889f7 mov rdi, rsi
1458b97d6 48c1e704 shl rdi, 4
1458b97da 4531c0 xor r8d, r8d
1458b97dd 4c8b9568010000 mov r10, qword ptr [rbp + 0x168]
1458b97e4 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458b97f0 4c39c7 cmp rdi, r8
1458b97f3 742e je 0x1458b9823
1458b97f5 4d8d4810 lea r9, [r8 + 0x10]
1458b97f9 46381401 cmp byte ptr [rcx + r8], r10b
1458b97fd 4d89c8 mov r8, r9
1458b9800 75ee jne 0x1458b97f0
1458b9802 4e8b4c09f8 mov r9, qword ptr [rcx + r9 - 8]
1458b9807 4983f90c cmp r9, 0xc
1458b980b 41b80c000000 mov r8d, 0xc
1458b9811 4d0f42c1 cmovb r8, r9
1458b9815 4d85c9 test r9, r9
1458b9818 7409 je 0x1458b9823
1458b981a 4939d0 cmp r8, rdx
1458b981d 0f87a6060000 ja 0x1458b9ec9
1458b9823 31d2 xor edx, edx
1458b9825 4c8b8d68010000 mov r9, qword ptr [rbp + 0x168]
1458b982c 0f1f4000 nop dword ptr [rax]
1458b9830 4839d7 cmp rdi, rdx
1458b9833 7418 je 0x1458b984d
1458b9835 4c8d4210 lea r8, [rdx + 0x10]
1458b9839 44380c11 cmp byte ptr [rcx + rdx], r9b
1458b983d 4c89c2 mov rdx, r8
1458b9840 75ee jne 0x1458b9830
1458b9842 4883c002 add rax, 2
1458b9846 4a894401f8 mov qword ptr [rcx + r8 - 8], rax
1458b984b eb4d jmp 0x1458b989a
1458b984d 493bb7380b0000 cmp rsi, qword ptr [r15 + 0xb38]
1458b9854 752d jne 0x1458b9883
1458b9856 4889c3 mov rbx, rax
1458b9859 498d8f380b0000 lea rcx, [r15 + 0xb38]
1458b9860 8b8578010000 mov eax, dword ptr [rbp + 0x178]
1458b9866 888587010000 mov byte ptr [rbp + 0x187], al
1458b986c e87f163400 call 0x145bfaef0
1458b9871 90 nop
1458b9872 498b8f400b0000 mov rcx, qword ptr [r15 + 0xb40]
1458b9879 4889d8 mov rax, rbx
1458b987c 4c8b8d68010000 mov r9, qword ptr [rbp + 0x168]
1458b9883 4883c002 add rax, 2
1458b9887 44880c39 mov byte ptr [rcx + rdi], r9b
1458b988b 4889443908 mov qword ptr [rcx + rdi + 8], rax
1458b9890 48ffc6 inc rsi
1458b9893 4989b7480b0000 mov qword ptr [r15 + 0xb48], rsi
1458b989a 8b8578010000 mov eax, dword ptr [rbp + 0x178]
1458b9ec9 498b87280b0000 mov rax, qword ptr [r15 + 0xb28]
1458b9ed0 496b97300b000038 imul rdx, qword ptr [r15 + 0xb30], 0x38
1458b9ed8 31c9 xor ecx, ecx
1458b9eda 4989c0 mov r8, rax
1458b9edd 448b8d78010000 mov r9d, dword ptr [rbp + 0x178]
1458b9ee4 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1458b9ef0 4839ca cmp rdx, rcx
1458b9ef3 741a je 0x1458b9f0f
1458b9ef5 4883c138 add rcx, 0x38
1458b9ef9 49395818 cmp qword ptr [r8 + 0x18], rbx
1458b9efd 4d8d4038 lea r8, [r8 + 0x38]
1458b9f01 75ed jne 0x1458b9ef0
1458b9f03 ff4408f0 inc dword ptr [rax + rcx - 0x10]
1458b9f07 488b5538 mov rdx, qword ptr [rbp + 0x38]
1458b9f0b 015408f4 add dword ptr [rax + rcx - 0xc], edx
1458b9f0f 4584f6 test r14b, r14b
1458b9f12 7432 je 0x1458b9f46
1458b9f14 498b87d00c0000 mov rax, qword ptr [r15 + 0xcd0]
1458b9f1b 48ffc0 inc rax
1458b9f1e 48c7c1ffffffff mov rcx, 0xffffffffffffffff
1458b9f25 480f44c1 cmove rax, rcx
1458b9f29 498987d00c0000 mov qword ptr [r15 + 0xcd0], rax
1458b9f30 488b4538 mov rax, qword ptr [rbp + 0x38]
1458b9f34 490387d80c0000 add rax, qword ptr [r15 + 0xcd8]
1458b9f3b 480f42c1 cmovb rax, rcx
1458b9f3f 498987d80c0000 mov qword ptr [r15 + 0xcd8], rax
1458b9f46 44888d87010000 mov byte ptr [rbp + 0x187], r9b
1458b9f4d 4c89e1 mov rcx, r12
1458b9f50 4489ce mov esi, r9d
1458b9f53 e86894feff call 0x1458a33c0
1458b9f58 90 nop
1458b9f59 4084f6 test sil, sil
1458b9f5c 741c je 0x1458b9f7a
1458b9f5e 488b5510 mov rdx, qword ptr [rbp + 0x10]
1458b9f62 4885d2 test rdx, rdx
1458b9f65 7413 je 0x1458b9f7a
1458b9f67 488b4d18 mov rcx, qword ptr [rbp + 0x18]
1458b9f6b 48c1e204 shl rdx, 4
1458b9f6f 41b808000000 mov r8d, 8
1458b9f75 e8568274fa call 0x1400021d0

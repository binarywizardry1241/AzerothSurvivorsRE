1400f85e0: 55 push rbp
1400f85e1: 4157 push r15
1400f85e3: 4156 push r14
1400f85e5: 4155 push r13
1400f85e7: 4154 push r12
1400f85e9: 56 push rsi
1400f85ea: 57 push rdi
1400f85eb: 53 push rbx
1400f85ec: 4881ec78020000 sub rsp, 0x278
1400f85f3: 488dac2480000000 lea rbp, [rsp + 0x80]
1400f85fb: 440f29bde0010000 movaps xmmword ptr [rbp + 0x1e0], xmm15
1400f8603: 440f29b5d0010000 movaps xmmword ptr [rbp + 0x1d0], xmm14
1400f860b: 440f29adc0010000 movaps xmmword ptr [rbp + 0x1c0], xmm13
1400f8613: 440f29a5b0010000 movaps xmmword ptr [rbp + 0x1b0], xmm12
1400f861b: 440f299da0010000 movaps xmmword ptr [rbp + 0x1a0], xmm11
1400f8623: 440f299590010000 movaps xmmword ptr [rbp + 0x190], xmm10
1400f862b: 440f298d80010000 movaps xmmword ptr [rbp + 0x180], xmm9
1400f8633: 440f298570010000 movaps xmmword ptr [rbp + 0x170], xmm8
1400f863b: 0f29bd60010000 movaps xmmword ptr [rbp + 0x160], xmm7
1400f8642: 0f29b550010000 movaps xmmword ptr [rbp + 0x150], xmm6
1400f8649: 48c78548010000feffffff mov qword ptr [rbp + 0x148], 0xfffffffffffffffe
1400f8654: 0f299db0000000 movaps xmmword ptr [rbp + 0xb0], xmm3
1400f865b: 4c898508010000 mov qword ptr [rbp + 0x108], r8
1400f8662: 4889d3 mov rbx, rdx
1400f8665: 4989cc mov r12, rcx
1400f8668: e8939bf0ff call 0x140002200
1400f866d: b9b0010000 mov ecx, 0x1b0
1400f8672: ba04000000 mov edx, 4
1400f8677: e8449bf0ff call 0x1400021c0
1400f867c: 4885c0 test rax, rax
1400f867f: 0f84c1060000 je 0x1400f8d46
1400f8685: 4889c6 mov rsi, rax
1400f8688: 48c785100100000c000000 mov qword ptr [rbp + 0x110], 0xc
1400f8693: 48898518010000 mov qword ptr [rbp + 0x118], rax
1400f869a: 48c7852001000000000000 mov qword ptr [rbp + 0x120], 0
1400f86a5: e8569bf0ff call 0x140002200
1400f86aa: b9b0010000 mov ecx, 0x1b0
1400f86af: ba04000000 mov edx, 4
1400f86b4: e8079bf0ff call 0x1400021c0
1400f86b9: 4885c0 test rax, rax
1400f86bc: 0f8495060000 je 0x1400f8d57
1400f86c2: 488b8d70020000 mov rcx, qword ptr [rbp + 0x270]
1400f86c9: 4c8b8568020000 mov r8, qword ptr [rbp + 0x268]
1400f86d0: f30f108560020000 movss xmm0, dword ptr [rbp + 0x260]
1400f86d8: 48c785300100000c000000 mov qword ptr [rbp + 0x130], 0xc
1400f86e3: 48898538010000 mov qword ptr [rbp + 0x138], rax
1400f86ea: 48c7854001000000000000 mov qword ptr [rbp + 0x140], 0
1400f86f5: 48baabaaaaaaaaaaaaaa movabs rdx, 0xaaaaaaaaaaaaaaab
1400f86ff: 4889d8 mov rax, rbx
1400f8702: 48f7e2 mul rdx
1400f8705: 48d1ea shr rdx, 1
1400f8708: 488d0452 lea rax, [rdx + rdx*2]
1400f870c: 488985f0000000 mov qword ptr [rbp + 0xf0], rax
1400f8713: 488d0449 lea rax, [rcx + rcx*2]
1400f8717: 498d0480 lea rax, [r8 + rax*4]
1400f871b: 488985e0000000 mov qword ptr [rbp + 0xe0], rax
1400f8722: 0f288db0000000 movaps xmm1, xmmword ptr [rbp + 0xb0]
1400f8729: 0f14c8 unpcklps xmm1, xmm0
1400f872c: 0f294d20 movaps xmmword ptr [rbp + 0x20], xmm1
1400f8730: 4989f6 mov r14, rsi
1400f8733: eb15 jmp 0x1400f874a
1400f8735: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400f8740: 4989f6 mov r14, rsi
1400f8743: 4c8ba5f8000000 mov r12, qword ptr [rbp + 0xf8]
1400f874a: 4883bdf000000002 cmp qword ptr [rbp + 0xf0], 2
1400f8752: 0f861d050000 jbe 0x1400f8c75
1400f8758: 48c7852001000000000000 mov qword ptr [rbp + 0x120], 0
1400f8763: 4883bd1001000002 cmp qword ptr [rbp + 0x110], 2
1400f876b: 0f86ca040000 jbe 0x1400f8c3b
1400f8771: 4531ff xor r15d, r15d
1400f8774: 498d44246c lea rax, [r12 + 0x6c]
1400f8779: 488985f8000000 mov qword ptr [rbp + 0xf8], rax
1400f8780: 488385f0000000fd add qword ptr [rbp + 0xf0], -3
1400f8788: 4b8d04ff lea rax, [r15 + r15*8]
1400f878c: 410f1044245c movups xmm0, xmmword ptr [r12 + 0x5c]
1400f8792: 0f1144865c movups xmmword ptr [rsi + rax*4 + 0x5c], xmm0
1400f8797: 410f10442450 movups xmm0, xmmword ptr [r12 + 0x50]
1400f879d: 0f11448650 movups xmmword ptr [rsi + rax*4 + 0x50], xmm0
1400f87a2: 410f10442440 movups xmm0, xmmword ptr [r12 + 0x40]
1400f87a8: 0f11448640 movups xmmword ptr [rsi + rax*4 + 0x40], xmm0
1400f87ad: 410f100424 movups xmm0, xmmword ptr [r12]
1400f87b2: 410f104c2410 movups xmm1, xmmword ptr [r12 + 0x10]
1400f87b8: 410f10542420 movups xmm2, xmmword ptr [r12 + 0x20]
1400f87be: 410f105c2430 movups xmm3, xmmword ptr [r12 + 0x30]
1400f87c4: 0f115c8630 movups xmmword ptr [rsi + rax*4 + 0x30], xmm3
1400f87c9: 0f11548620 movups xmmword ptr [rsi + rax*4 + 0x20], xmm2
1400f87ce: 0f114c8610 movups xmmword ptr [rsi + rax*4 + 0x10], xmm1
1400f87d3: 0f110486 movups xmmword ptr [rsi + rax*4], xmm0
1400f87d7: 4983c703 add r15, 3
1400f87db: 4c89bd20010000 mov qword ptr [rbp + 0x120], r15
1400f87e2: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
1400f87e9: eb54 jmp 0x1400f883f
1400f87eb: 0f1f440000 nop dword ptr [rax + rax]
1400f87f0: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
1400f87f7: 488bb538010000 mov rsi, qword ptr [rbp + 0x138]
1400f87fe: 0f288530010000 movaps xmm0, xmmword ptr [rbp + 0x130]
1400f8805: 48898530010000 mov qword ptr [rbp + 0x130], rax
1400f880c: 0f298510010000 movaps xmmword ptr [rbp + 0x110], xmm0
1400f8813: 4c89b538010000 mov qword ptr [rbp + 0x138], r14
1400f881a: 4c89ad20010000 mov qword ptr [rbp + 0x120], r13
1400f8821: 4c89bd40010000 mov qword ptr [rbp + 0x140], r15
1400f8828: 4989f6 mov r14, rsi
1400f882b: 4d89ef mov r15, r13
1400f882e: 488b85d8000000 mov rax, qword ptr [rbp + 0xd8]
1400f8835: 4983fd03 cmp r13, 3
1400f8839: 0f8201ffffff jb 0x1400f8740
1400f883f: 483b85e0000000 cmp rax, qword ptr [rbp + 0xe0]
1400f8846: 0f84b4020000 je 0x1400f8b00
1400f884c: 488d480c lea rcx, [rax + 0xc]
1400f8850: 48898dd8000000 mov qword ptr [rbp + 0xd8], rcx
1400f8857: 48c7854001000000000000 mov qword ptr [rbp + 0x140], 0
1400f8862: f2440f1018 movsd xmm11, qword ptr [rax]
1400f8867: f3410f16d3 movshdup xmm2, xmm11
1400f886c: f3440f106808 movss xmm13, dword ptr [rax + 8]
1400f8872: 4531ed xor r13d, r13d
1400f8875: 31db xor ebx, ebx
1400f8877: 0f2995c0000000 movaps xmmword ptr [rbp + 0xc0], xmm2
1400f887e: e99e000000 jmp 0x1400f8921
1400f8883: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400f8890: 410f28c6 movaps xmm0, xmm14
1400f8894: f30f5cc7 subss xmm0, xmm7
1400f8898: f3440f5ef0 divss xmm14, xmm0
1400f889d: 440f145570 unpcklps xmm10, xmmword ptr [rbp + 0x70]
1400f88a2: 0f147560 unpcklps xmm6, xmmword ptr [rbp + 0x60]
1400f88a6: 410f16f2 movlhps xmm6, xmm10
1400f88aa: 440f144550 unpcklps xmm8, xmmword ptr [rbp + 0x50]
1400f88af: 440f147d40 unpcklps xmm15, xmmword ptr [rbp + 0x40]
1400f88b4: 450f16f8 movlhps xmm15, xmm8
1400f88b8: 410f5cf7 subps xmm6, xmm15
1400f88bc: 410f28c6 movaps xmm0, xmm14
1400f88c0: 410fc6c600 shufps xmm0, xmm14, 0
1400f88c5: 0f59f0 mulps xmm6, xmm0
1400f88c8: 410f58f7 addps xmm6, xmm15
1400f88cc: 0f284d30 movaps xmm1, xmmword ptr [rbp + 0x30]
1400f88d0: 440f5cc9 subps xmm9, xmm1
1400f88d4: 440f59c8 mulps xmm9, xmm0
1400f88d8: 440f58c9 addps xmm9, xmm1
1400f88dc: f30f108504010000 movss xmm0, dword ptr [rbp + 0x104]
1400f88e4: f3440f5ce0 subss xmm12, xmm0
1400f88e9: f3450f59e6 mulss xmm12, xmm14
1400f88ee: f3440f58e0 addss xmm12, xmm0
1400f88f3: 488b8538010000 mov rax, qword ptr [rbp + 0x138]
1400f88fa: 4b8d4ced00 lea rcx, [r13 + r13*8]
1400f88ff: 0f113488 movups xmmword ptr [rax + rcx*4], xmm6
1400f8903: 440f114c8810 movups xmmword ptr [rax + rcx*4 + 0x10], xmm9
1400f8909: f3440f11648820 movss dword ptr [rax + rcx*4 + 0x20], xmm12
1400f8910: 49ffc5 inc r13
1400f8913: 4c89ad40010000 mov qword ptr [rbp + 0x140], r13
1400f891a: 0f2895c0000000 movaps xmm2, xmmword ptr [rbp + 0xc0]
1400f8921: 488d04db lea rax, [rbx + rbx*8]
1400f8925: 48ffc3 inc rbx
1400f8928: 488d0486 lea rax, [rsi + rax*4]
1400f892c: 4889d9 mov rcx, rbx
1400f892f: 90 nop
1400f8930: 4889c7 mov rdi, rax
1400f8933: 488d41ff lea rax, [rcx - 1]
1400f8937: 4c39f8 cmp rax, r15
1400f893a: 0f83b0feffff jae 0x1400f87f0
1400f8940: 4889cb mov rbx, rcx
1400f8943: 4939cf cmp r15, rcx
1400f8946: b800000000 mov eax, 0
1400f894b: 480f45c1 cmovne rax, rcx
1400f894f: 488d04c0 lea rax, [rax + rax*8]
1400f8953: 4c8d2486 lea r12, [rsi + rax*4]
1400f8957: f3440f103f movss xmm15, dword ptr [rdi]
1400f895c: f3440f104708 movss xmm8, dword ptr [rdi + 8]
1400f8962: 410f28c0 movaps xmm0, xmm8
1400f8966: 410f14c7 unpcklps xmm0, xmm15
1400f896a: 0f280d5f9bca05 movaps xmm1, xmmword ptr [rip + 0x5ca9b5f]
1400f8971: 0f57c1 xorps xmm0, xmm1
1400f8974: 0f5c4520 subps xmm0, xmmword ptr [rbp + 0x20]
1400f8978: 410f59c3 mulps xmm0, xmm11
1400f897c: f3440f16f0 movshdup xmm14, xmm0
1400f8981: f3440f58f0 addss xmm14, xmm0
1400f8986: f3450f5cf5 subss xmm14, xmm13
1400f898b: f30f103486 movss xmm6, dword ptr [rsi + rax*4]
1400f8990: f3440f10548608 movss xmm10, dword ptr [rsi + rax*4 + 8]
1400f8997: 410f28c2 movaps xmm0, xmm10
1400f899b: 0f57c1 xorps xmm0, xmm1
1400f899e: f30f5c85b0000000 subss xmm0, dword ptr [rbp + 0xb0]
1400f89a6: 0f28fe movaps xmm7, xmm6
1400f89a9: 0f57f9 xorps xmm7, xmm1
1400f89ac: f30f108d60020000 movss xmm1, dword ptr [rbp + 0x260]
1400f89b4: f30f5cf9 subss xmm7, xmm1
1400f89b8: f3410f59c3 mulss xmm0, xmm11
1400f89bd: f30f59fa mulss xmm7, xmm2
1400f89c1: f30f58f8 addss xmm7, xmm0
1400f89c5: f3410f5cfd subss xmm7, xmm13
1400f89ca: 0f57c0 xorps xmm0, xmm0
1400f89cd: 440f2ef0 ucomiss xmm14, xmm0
1400f89d1: 731d jae 0x1400f89f0
1400f89d3: 488d4b01 lea rcx, [rbx + 1]
1400f89d7: 488d4724 lea rax, [rdi + 0x24]
1400f89db: 0f2ef8 ucomiss xmm7, xmm0
1400f89de: 0f824cffffff jb 0x1400f8930
1400f89e4: e9a3000000 jmp 0x1400f8a8c
1400f89e9: 0f1f8000000000 nop dword ptr [rax]
1400f89f0: 0f57f6 xorps xmm6, xmm6
1400f89f3: 8b4720 mov eax, dword ptr [rdi + 0x20]
1400f89f6: 8985a0000000 mov dword ptr [rbp + 0xa0], eax
1400f89fc: 0f1007 movups xmm0, xmmword ptr [rdi]
1400f89ff: 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
1400f8a03: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
1400f8a0a: 0f298580000000 movaps xmmword ptr [rbp + 0x80], xmm0
1400f8a11: 4c3bad30010000 cmp r13, qword ptr [rbp + 0x130]
1400f8a18: 750d jne 0x1400f8a27
1400f8a1a: 488d8d30010000 lea rcx, [rbp + 0x130]
1400f8a21: e8fa86b405 call 0x145c41120
1400f8a26: 90 nop
1400f8a27: 488b8538010000 mov rax, qword ptr [rbp + 0x138]
1400f8a2e: 4a8d0ced00000000 lea rcx, [r13*8]
1400f8a36: 4c01e9 add rcx, r13
1400f8a39: 8b95a0000000 mov edx, dword ptr [rbp + 0xa0]
1400f8a3f: 89548820 mov dword ptr [rax + rcx*4 + 0x20], edx
1400f8a43: 0f288580000000 movaps xmm0, xmmword ptr [rbp + 0x80]
1400f8a4a: 0f288d90000000 movaps xmm1, xmmword ptr [rbp + 0x90]
1400f8a51: 0f114c8810 movups xmmword ptr [rax + rcx*4 + 0x10], xmm1
1400f8a56: 0f110488 movups xmmword ptr [rax + rcx*4], xmm0
1400f8a5a: 49ffc5 inc r13
1400f8a5d: 4c89ad40010000 mov qword ptr [rbp + 0x140], r13
1400f8a64: 0f2efe ucomiss xmm7, xmm6
1400f8a67: 0f2895c0000000 movaps xmm2, xmmword ptr [rbp + 0xc0]
1400f8a6e: 0f83adfeffff jae 0x1400f8921
1400f8a74: f3440f103f movss xmm15, dword ptr [rdi]
1400f8a79: f3440f104708 movss xmm8, dword ptr [rdi + 8]
1400f8a7f: f3410f103424 movss xmm6, dword ptr [r12]
1400f8a85: f3450f10542408 movss xmm10, dword ptr [r12 + 8]
1400f8a8c: f3410f10442404 movss xmm0, dword ptr [r12 + 4]
1400f8a93: 0f294560 movaps xmmword ptr [rbp + 0x60], xmm0
1400f8a97: f3410f1044240c movss xmm0, dword ptr [r12 + 0xc]
1400f8a9e: 0f294570 movaps xmmword ptr [rbp + 0x70], xmm0
1400f8aa2: f30f104704 movss xmm0, dword ptr [rdi + 4]
1400f8aa7: 0f294540 movaps xmmword ptr [rbp + 0x40], xmm0
1400f8aab: f30f10470c movss xmm0, dword ptr [rdi + 0xc]
1400f8ab0: 0f294550 movaps xmmword ptr [rbp + 0x50], xmm0
1400f8ab4: 0f104710 movups xmm0, xmmword ptr [rdi + 0x10]
1400f8ab8: 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
1400f8abc: 450f104c2410 movups xmm9, xmmword ptr [r12 + 0x10]
1400f8ac2: f30f104720 movss xmm0, dword ptr [rdi + 0x20]
1400f8ac7: f30f118504010000 movss dword ptr [rbp + 0x104], xmm0
1400f8acf: f3450f10642420 movss xmm12, dword ptr [r12 + 0x20]
1400f8ad6: 4c3bad30010000 cmp r13, qword ptr [rbp + 0x130]
1400f8add: 0f85adfdffff jne 0x1400f8890
1400f8ae3: 488d8d30010000 lea rcx, [rbp + 0x130]
1400f8aea: e83186b405 call 0x145c41120
1400f8aef: 90 nop
1400f8af0: e99bfdffff jmp 0x1400f8890
1400f8af5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400f8b00: 498d7fff lea rdi, [r15 - 1]
1400f8b04: b901000000 mov ecx, 1
1400f8b09: 4839f9 cmp rcx, rdi
1400f8b0c: 0f832efcffff jae 0x1400f8740
1400f8b12: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1400f8b20: 4c39f9 cmp rcx, r15
1400f8b23: 0f83f6010000 jae 0x1400f8d1f
1400f8b29: 4c8d6101 lea r12, [rcx + 1]
1400f8b2d: 4d39fc cmp r12, r15
1400f8b30: 0f83fb010000 jae 0x1400f8d31
1400f8b36: 488d04c9 lea rax, [rcx + rcx*8]
1400f8b3a: 4b8d0ce4 lea rcx, [r12 + r12*8]
1400f8b3e: 8b548e20 mov edx, dword ptr [rsi + rcx*4 + 0x20]
1400f8b42: 4c8d45d4 lea r8, [rbp - 0x2c]
1400f8b46: 41895044 mov dword ptr [r8 + 0x44], edx
1400f8b4a: 0f10048e movups xmm0, xmmword ptr [rsi + rcx*4]
1400f8b4e: 0f104c8e10 movups xmm1, xmmword ptr [rsi + rcx*4 + 0x10]
1400f8b53: 410f114834 movups xmmword ptr [r8 + 0x34], xmm1
1400f8b58: 410f114024 movups xmmword ptr [r8 + 0x24], xmm0
1400f8b5d: 8b4e20 mov ecx, dword ptr [rsi + 0x20]
1400f8b60: 894dd0 mov dword ptr [rbp - 0x30], ecx
1400f8b63: 0f1006 movups xmm0, xmmword ptr [rsi]
1400f8b66: 0f104e10 movups xmm1, xmmword ptr [rsi + 0x10]
1400f8b6a: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
1400f8b6e: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1400f8b72: 8b4c8620 mov ecx, dword ptr [rsi + rax*4 + 0x20]
1400f8b76: 41894820 mov dword ptr [r8 + 0x20], ecx
1400f8b7a: 0f100486 movups xmm0, xmmword ptr [rsi + rax*4]
1400f8b7e: 0f104c8610 movups xmm1, xmmword ptr [rsi + rax*4 + 0x10]
1400f8b83: 410f114810 movups xmmword ptr [r8 + 0x10], xmm1
1400f8b88: 410f1100 movups xmmword ptr [r8], xmm0
1400f8b8c: 488b8d08010000 mov rcx, qword ptr [rbp + 0x108]
1400f8b93: 488b01 mov rax, qword ptr [rcx]
1400f8b96: 488b5110 mov rdx, qword ptr [rcx + 0x10]
1400f8b9a: 4829d0 sub rax, rdx
1400f8b9d: 4883f802 cmp rax, 2
1400f8ba1: 7666 jbe 0x1400f8c09
1400f8ba3: 4c8b8508010000 mov r8, qword ptr [rbp + 0x108]
1400f8baa: 498b4008 mov rax, qword ptr [r8 + 8]
1400f8bae: 488d0cd2 lea rcx, [rdx + rdx*8]
1400f8bb2: 0f10450c movups xmm0, xmmword ptr [rbp + 0xc]
1400f8bb6: 0f1144885c movups xmmword ptr [rax + rcx*4 + 0x5c], xmm0
1400f8bbb: 0f284500 movaps xmm0, xmmword ptr [rbp]
1400f8bbf: 0f11448850 movups xmmword ptr [rax + rcx*4 + 0x50], xmm0
1400f8bc4: 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
1400f8bc8: 0f11448840 movups xmmword ptr [rax + rcx*4 + 0x40], xmm0
1400f8bcd: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1400f8bd1: 0f284dc0 movaps xmm1, xmmword ptr [rbp - 0x40]
1400f8bd5: 0f2855d0 movaps xmm2, xmmword ptr [rbp - 0x30]
1400f8bd9: 0f285de0 movaps xmm3, xmmword ptr [rbp - 0x20]
1400f8bdd: 0f115c8830 movups xmmword ptr [rax + rcx*4 + 0x30], xmm3
1400f8be2: 0f11548820 movups xmmword ptr [rax + rcx*4 + 0x20], xmm2
1400f8be7: 0f114c8810 movups xmmword ptr [rax + rcx*4 + 0x10], xmm1
1400f8bec: 0f110488 movups xmmword ptr [rax + rcx*4], xmm0
1400f8bf0: 4883c203 add rdx, 3
1400f8bf4: 49895010 mov qword ptr [r8 + 0x10], rdx
1400f8bf8: 4c89e1 mov rcx, r12
1400f8bfb: 4839f9 cmp rcx, rdi
1400f8bfe: 0f821cffffff jb 0x1400f8b20
1400f8c04: e937fbffff jmp 0x1400f8740
1400f8c09: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
1400f8c12: 41b803000000 mov r8d, 3
1400f8c18: 41b904000000 mov r9d, 4
1400f8c1e: 488b8d08010000 mov rcx, qword ptr [rbp + 0x108]
1400f8c25: e866beaf05 call 0x145bf4a90
1400f8c2a: 90 nop
1400f8c2b: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
1400f8c32: 488b5010 mov rdx, qword ptr [rax + 0x10]
1400f8c36: e968ffffff jmp 0x1400f8ba3
1400f8c3b: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
1400f8c44: 41b803000000 mov r8d, 3
1400f8c4a: 41b904000000 mov r9d, 4
1400f8c50: 488d8d10010000 lea rcx, [rbp + 0x110]
1400f8c57: 31d2 xor edx, edx
1400f8c59: e832beaf05 call 0x145bf4a90
1400f8c5e: 90 nop
1400f8c5f: 488bb518010000 mov rsi, qword ptr [rbp + 0x118]
1400f8c66: 4c8bbd20010000 mov r15, qword ptr [rbp + 0x120]
1400f8c6d: 4989f6 mov r14, rsi
1400f8c70: e9fffaffff jmp 0x1400f8774
1400f8c75: 488b8530010000 mov rax, qword ptr [rbp + 0x130]
1400f8c7c: 4885c0 test rax, rax
1400f8c7f: 741a je 0x1400f8c9b
1400f8c81: 488b8d38010000 mov rcx, qword ptr [rbp + 0x138]
1400f8c88: 48c1e002 shl rax, 2
1400f8c8c: 488d14c0 lea rdx, [rax + rax*8]
1400f8c90: 41b804000000 mov r8d, 4
1400f8c96: e83595f0ff call 0x1400021d0
1400f8c9b: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
1400f8ca2: 4885c0 test rax, rax
1400f8ca5: 7416 je 0x1400f8cbd
1400f8ca7: 48c1e002 shl rax, 2
1400f8cab: 488d14c0 lea rdx, [rax + rax*8]
1400f8caf: 41b804000000 mov r8d, 4
1400f8cb5: 4889f1 mov rcx, rsi
1400f8cb8: e81395f0ff call 0x1400021d0
1400f8cbd: 0f28b550010000 movaps xmm6, xmmword ptr [rbp + 0x150]
1400f8cc4: 0f28bd60010000 movaps xmm7, xmmword ptr [rbp + 0x160]
1400f8ccb: 440f288570010000 movaps xmm8, xmmword ptr [rbp + 0x170]
1400f8cd3: 440f288d80010000 movaps xmm9, xmmword ptr [rbp + 0x180]
1400f8cdb: 440f289590010000 movaps xmm10, xmmword ptr [rbp + 0x190]
1400f8ce3: 440f289da0010000 movaps xmm11, xmmword ptr [rbp + 0x1a0]
1400f8ceb: 440f28a5b0010000 movaps xmm12, xmmword ptr [rbp + 0x1b0]
1400f8cf3: 440f28adc0010000 movaps xmm13, xmmword ptr [rbp + 0x1c0]
1400f8cfb: 440f28b5d0010000 movaps xmm14, xmmword ptr [rbp + 0x1d0]
1400f8d03: 440f28bde0010000 movaps xmm15, xmmword ptr [rbp + 0x1e0]
1400f8d0b: 4881c478020000 add rsp, 0x278
1400f8d12: 5b pop rbx
1400f8d13: 5f pop rdi
1400f8d14: 5e pop rsi
1400f8d15: 415c pop r12
1400f8d17: 415d pop r13
1400f8d19: 415e pop r14
1400f8d1b: 415f pop r15
1400f8d1d: 5d pop rbp
1400f8d1e: c3 ret
1400f8d1f: 4c8d054290cd05 lea r8, [rip + 0x5cd9042]
1400f8d26: 4c89fa mov rdx, r15
1400f8d29: e865abc905 call 0x145d93893
1400f8d2e: 90 nop
1400f8d2f: eb41 jmp 0x1400f8d72
1400f8d31: 4c8d054890cd05 lea r8, [rip + 0x5cd9048]
1400f8d38: 4c89e1 mov rcx, r12
1400f8d3b: 4c89fa mov rdx, r15
1400f8d3e: e850abc905 call 0x145d93893
1400f8d43: 90 nop
1400f8d44: eb2c jmp 0x1400f8d72
1400f8d46: b904000000 mov ecx, 4
1400f8d4b: bab0010000 mov edx, 0x1b0
1400f8d50: e8a6a7c905 call 0x145d934fb
1400f8d55: 0f0b ud2
1400f8d57: 48c785e80000000c000000 mov qword ptr [rbp + 0xe8], 0xc
1400f8d62: b904000000 mov ecx, 4
1400f8d67: bab0010000 mov edx, 0x1b0
1400f8d6c: e88aa7c905 call 0x145d934fb
1400f8d71: 90 nop
1400f8d72: 0f0b ud2

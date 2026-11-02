140147dd0: 55 push rbp
140147dd1: 4157 push r15
140147dd3: 4156 push r14
140147dd5: 4155 push r13
140147dd7: 4154 push r12
140147dd9: 56 push rsi
140147dda: 57 push rdi
140147ddb: 53 push rbx
140147ddc: 4881ec78020000 sub rsp, 0x278
140147de3: 488dac2480000000 lea rbp, [rsp + 0x80]
140147deb: 440f29bde0010000 movaps xmmword ptr [rbp + 0x1e0], xmm15
140147df3: 440f29b5d0010000 movaps xmmword ptr [rbp + 0x1d0], xmm14
140147dfb: 440f29adc0010000 movaps xmmword ptr [rbp + 0x1c0], xmm13
140147e03: 440f29a5b0010000 movaps xmmword ptr [rbp + 0x1b0], xmm12
140147e0b: 440f299da0010000 movaps xmmword ptr [rbp + 0x1a0], xmm11
140147e13: 440f299590010000 movaps xmmword ptr [rbp + 0x190], xmm10
140147e1b: 440f298d80010000 movaps xmmword ptr [rbp + 0x180], xmm9
140147e23: 440f298570010000 movaps xmmword ptr [rbp + 0x170], xmm8
140147e2b: 0f29bd60010000 movaps xmmword ptr [rbp + 0x160], xmm7
140147e32: 0f29b550010000 movaps xmmword ptr [rbp + 0x150], xmm6
140147e39: 48c78548010000feffffff mov qword ptr [rbp + 0x148], 0xfffffffffffffffe
140147e44: 0f299db0000000 movaps xmmword ptr [rbp + 0xb0], xmm3
140147e4b: 4c898508010000 mov qword ptr [rbp + 0x108], r8
140147e52: 4889d3 mov rbx, rdx
140147e55: 4989cc mov r12, rcx
140147e58: e8a3a3ebff call 0x140002200
140147e5d: b9b0010000 mov ecx, 0x1b0
140147e62: ba04000000 mov edx, 4
140147e67: e854a3ebff call 0x1400021c0
140147e6c: 4885c0 test rax, rax
140147e6f: 0f84c1060000 je 0x140148536
140147e75: 4889c6 mov rsi, rax
140147e78: 48c785100100000c000000 mov qword ptr [rbp + 0x110], 0xc
140147e83: 48898518010000 mov qword ptr [rbp + 0x118], rax
140147e8a: 48c7852001000000000000 mov qword ptr [rbp + 0x120], 0
140147e95: e866a3ebff call 0x140002200
140147e9a: b9b0010000 mov ecx, 0x1b0
140147e9f: ba04000000 mov edx, 4
140147ea4: e817a3ebff call 0x1400021c0
140147ea9: 4885c0 test rax, rax
140147eac: 0f8495060000 je 0x140148547
140147eb2: 488b8d70020000 mov rcx, qword ptr [rbp + 0x270]
140147eb9: 4c8b8568020000 mov r8, qword ptr [rbp + 0x268]
140147ec0: f30f108560020000 movss xmm0, dword ptr [rbp + 0x260]
140147ec8: 48c785300100000c000000 mov qword ptr [rbp + 0x130], 0xc
140147ed3: 48898538010000 mov qword ptr [rbp + 0x138], rax
140147eda: 48c7854001000000000000 mov qword ptr [rbp + 0x140], 0
140147ee5: 48baabaaaaaaaaaaaaaa movabs rdx, 0xaaaaaaaaaaaaaaab
140147eef: 4889d8 mov rax, rbx
140147ef2: 48f7e2 mul rdx
140147ef5: 48d1ea shr rdx, 1
140147ef8: 488d0452 lea rax, [rdx + rdx*2]
140147efc: 488985f0000000 mov qword ptr [rbp + 0xf0], rax
140147f03: 488d0449 lea rax, [rcx + rcx*2]
140147f07: 498d0480 lea rax, [r8 + rax*4]
140147f0b: 488985e0000000 mov qword ptr [rbp + 0xe0], rax
140147f12: 0f288db0000000 movaps xmm1, xmmword ptr [rbp + 0xb0]
140147f19: 0f14c8 unpcklps xmm1, xmm0
140147f1c: 0f294d20 movaps xmmword ptr [rbp + 0x20], xmm1
140147f20: 4989f6 mov r14, rsi
140147f23: eb15 jmp 0x140147f3a
140147f25: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
140147f30: 4989f6 mov r14, rsi
140147f33: 4c8ba5f8000000 mov r12, qword ptr [rbp + 0xf8]
140147f3a: 4883bdf000000002 cmp qword ptr [rbp + 0xf0], 2
140147f42: 0f861d050000 jbe 0x140148465
140147f48: 48c7852001000000000000 mov qword ptr [rbp + 0x120], 0
140147f53: 4883bd1001000002 cmp qword ptr [rbp + 0x110], 2
140147f5b: 0f86ca040000 jbe 0x14014842b
140147f61: 4531ff xor r15d, r15d
140147f64: 498d44246c lea rax, [r12 + 0x6c]
140147f69: 488985f8000000 mov qword ptr [rbp + 0xf8], rax
140147f70: 488385f0000000fd add qword ptr [rbp + 0xf0], -3
140147f78: 4b8d04ff lea rax, [r15 + r15*8]
140147f7c: 410f1044245c movups xmm0, xmmword ptr [r12 + 0x5c]
140147f82: 0f1144865c movups xmmword ptr [rsi + rax*4 + 0x5c], xmm0
140147f87: 410f10442450 movups xmm0, xmmword ptr [r12 + 0x50]
140147f8d: 0f11448650 movups xmmword ptr [rsi + rax*4 + 0x50], xmm0
140147f92: 410f10442440 movups xmm0, xmmword ptr [r12 + 0x40]
140147f98: 0f11448640 movups xmmword ptr [rsi + rax*4 + 0x40], xmm0
140147f9d: 410f100424 movups xmm0, xmmword ptr [r12]
140147fa2: 410f104c2410 movups xmm1, xmmword ptr [r12 + 0x10]
140147fa8: 410f10542420 movups xmm2, xmmword ptr [r12 + 0x20]
140147fae: 410f105c2430 movups xmm3, xmmword ptr [r12 + 0x30]
140147fb4: 0f115c8630 movups xmmword ptr [rsi + rax*4 + 0x30], xmm3
140147fb9: 0f11548620 movups xmmword ptr [rsi + rax*4 + 0x20], xmm2
140147fbe: 0f114c8610 movups xmmword ptr [rsi + rax*4 + 0x10], xmm1
140147fc3: 0f110486 movups xmmword ptr [rsi + rax*4], xmm0
140147fc7: 4983c703 add r15, 3
140147fcb: 4c89bd20010000 mov qword ptr [rbp + 0x120], r15
140147fd2: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
140147fd9: eb54 jmp 0x14014802f
140147fdb: 0f1f440000 nop dword ptr [rax + rax]
140147fe0: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
140147fe7: 488bb538010000 mov rsi, qword ptr [rbp + 0x138]
140147fee: 0f288530010000 movaps xmm0, xmmword ptr [rbp + 0x130]
140147ff5: 48898530010000 mov qword ptr [rbp + 0x130], rax
140147ffc: 0f298510010000 movaps xmmword ptr [rbp + 0x110], xmm0
140148003: 4c89b538010000 mov qword ptr [rbp + 0x138], r14
14014800a: 4c89ad20010000 mov qword ptr [rbp + 0x120], r13
140148011: 4c89bd40010000 mov qword ptr [rbp + 0x140], r15
140148018: 4989f6 mov r14, rsi
14014801b: 4d89ef mov r15, r13
14014801e: 488b85d8000000 mov rax, qword ptr [rbp + 0xd8]
140148025: 4983fd03 cmp r13, 3
140148029: 0f8201ffffff jb 0x140147f30
14014802f: 483b85e0000000 cmp rax, qword ptr [rbp + 0xe0]
140148036: 0f84b4020000 je 0x1401482f0
14014803c: 488d480c lea rcx, [rax + 0xc]
140148040: 48898dd8000000 mov qword ptr [rbp + 0xd8], rcx
140148047: 48c7854001000000000000 mov qword ptr [rbp + 0x140], 0
140148052: f2440f1018 movsd xmm11, qword ptr [rax]
140148057: f3410f16d3 movshdup xmm2, xmm11
14014805c: f3440f106808 movss xmm13, dword ptr [rax + 8]
140148062: 4531ed xor r13d, r13d
140148065: 31db xor ebx, ebx
140148067: 0f2995c0000000 movaps xmmword ptr [rbp + 0xc0], xmm2
14014806e: e99e000000 jmp 0x140148111
140148073: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140148080: 410f28c6 movaps xmm0, xmm14
140148084: f30f5cc7 subss xmm0, xmm7
140148088: f3440f5ef0 divss xmm14, xmm0
14014808d: 440f145570 unpcklps xmm10, xmmword ptr [rbp + 0x70]
140148092: 0f147560 unpcklps xmm6, xmmword ptr [rbp + 0x60]
140148096: 410f16f2 movlhps xmm6, xmm10
14014809a: 440f144550 unpcklps xmm8, xmmword ptr [rbp + 0x50]
14014809f: 440f147d40 unpcklps xmm15, xmmword ptr [rbp + 0x40]
1401480a4: 450f16f8 movlhps xmm15, xmm8
1401480a8: 410f5cf7 subps xmm6, xmm15
1401480ac: 410f28c6 movaps xmm0, xmm14
1401480b0: 410fc6c600 shufps xmm0, xmm14, 0
1401480b5: 0f59f0 mulps xmm6, xmm0
1401480b8: 410f58f7 addps xmm6, xmm15
1401480bc: 0f284d30 movaps xmm1, xmmword ptr [rbp + 0x30]
1401480c0: 440f5cc9 subps xmm9, xmm1
1401480c4: 440f59c8 mulps xmm9, xmm0
1401480c8: 440f58c9 addps xmm9, xmm1
1401480cc: f30f108504010000 movss xmm0, dword ptr [rbp + 0x104]
1401480d4: f3440f5ce0 subss xmm12, xmm0
1401480d9: f3450f59e6 mulss xmm12, xmm14
1401480de: f3440f58e0 addss xmm12, xmm0
1401480e3: 488b8538010000 mov rax, qword ptr [rbp + 0x138]
1401480ea: 4b8d4ced00 lea rcx, [r13 + r13*8]
1401480ef: 0f113488 movups xmmword ptr [rax + rcx*4], xmm6
1401480f3: 440f114c8810 movups xmmword ptr [rax + rcx*4 + 0x10], xmm9
1401480f9: f3440f11648820 movss dword ptr [rax + rcx*4 + 0x20], xmm12
140148100: 49ffc5 inc r13
140148103: 4c89ad40010000 mov qword ptr [rbp + 0x140], r13
14014810a: 0f2895c0000000 movaps xmm2, xmmword ptr [rbp + 0xc0]
140148111: 488d04db lea rax, [rbx + rbx*8]
140148115: 48ffc3 inc rbx
140148118: 488d0486 lea rax, [rsi + rax*4]
14014811c: 4889d9 mov rcx, rbx
14014811f: 90 nop
140148120: 4889c7 mov rdi, rax
140148123: 488d41ff lea rax, [rcx - 1]
140148127: 4c39f8 cmp rax, r15
14014812a: 0f83b0feffff jae 0x140147fe0
140148130: 4889cb mov rbx, rcx
140148133: 4939cf cmp r15, rcx
140148136: b800000000 mov eax, 0
14014813b: 480f45c1 cmovne rax, rcx
14014813f: 488d04c0 lea rax, [rax + rax*8]
140148143: 4c8d2486 lea r12, [rsi + rax*4]
140148147: f3440f103f movss xmm15, dword ptr [rdi]
14014814c: f3440f104708 movss xmm8, dword ptr [rdi + 8]
140148152: 410f28c0 movaps xmm0, xmm8
140148156: 410f14c7 unpcklps xmm0, xmm15
14014815a: 0f280d3f4fc805 movaps xmm1, xmmword ptr [rip + 0x5c84f3f]
140148161: 0f57c1 xorps xmm0, xmm1
140148164: 0f5c4520 subps xmm0, xmmword ptr [rbp + 0x20]
140148168: 410f59c3 mulps xmm0, xmm11
14014816c: f3440f16f0 movshdup xmm14, xmm0
140148171: f3440f58f0 addss xmm14, xmm0
140148176: f3450f5cf5 subss xmm14, xmm13
14014817b: f30f103486 movss xmm6, dword ptr [rsi + rax*4]
140148180: f3440f10548608 movss xmm10, dword ptr [rsi + rax*4 + 8]
140148187: 410f28c2 movaps xmm0, xmm10
14014818b: 0f57c1 xorps xmm0, xmm1
14014818e: f30f5c85b0000000 subss xmm0, dword ptr [rbp + 0xb0]
140148196: 0f28fe movaps xmm7, xmm6
140148199: 0f57f9 xorps xmm7, xmm1
14014819c: f30f108d60020000 movss xmm1, dword ptr [rbp + 0x260]
1401481a4: f30f5cf9 subss xmm7, xmm1
1401481a8: f3410f59c3 mulss xmm0, xmm11
1401481ad: f30f59fa mulss xmm7, xmm2
1401481b1: f30f58f8 addss xmm7, xmm0
1401481b5: f3410f5cfd subss xmm7, xmm13
1401481ba: 0f57c0 xorps xmm0, xmm0
1401481bd: 440f2ef0 ucomiss xmm14, xmm0
1401481c1: 731d jae 0x1401481e0
1401481c3: 488d4b01 lea rcx, [rbx + 1]
1401481c7: 488d4724 lea rax, [rdi + 0x24]
1401481cb: 0f2ef8 ucomiss xmm7, xmm0
1401481ce: 0f824cffffff jb 0x140148120
1401481d4: e9a3000000 jmp 0x14014827c
1401481d9: 0f1f8000000000 nop dword ptr [rax]
1401481e0: 0f57f6 xorps xmm6, xmm6
1401481e3: 8b4720 mov eax, dword ptr [rdi + 0x20]
1401481e6: 8985a0000000 mov dword ptr [rbp + 0xa0], eax
1401481ec: 0f1007 movups xmm0, xmmword ptr [rdi]
1401481ef: 0f104f10 movups xmm1, xmmword ptr [rdi + 0x10]
1401481f3: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
1401481fa: 0f298580000000 movaps xmmword ptr [rbp + 0x80], xmm0
140148201: 4c3bad30010000 cmp r13, qword ptr [rbp + 0x130]
140148208: 750d jne 0x140148217
14014820a: 488d8d30010000 lea rcx, [rbp + 0x130]
140148211: e81a95ae05 call 0x145c31730
140148216: 90 nop
140148217: 488b8538010000 mov rax, qword ptr [rbp + 0x138]
14014821e: 4a8d0ced00000000 lea rcx, [r13*8]
140148226: 4c01e9 add rcx, r13
140148229: 8b95a0000000 mov edx, dword ptr [rbp + 0xa0]
14014822f: 89548820 mov dword ptr [rax + rcx*4 + 0x20], edx
140148233: 0f288580000000 movaps xmm0, xmmword ptr [rbp + 0x80]
14014823a: 0f288d90000000 movaps xmm1, xmmword ptr [rbp + 0x90]
140148241: 0f114c8810 movups xmmword ptr [rax + rcx*4 + 0x10], xmm1
140148246: 0f110488 movups xmmword ptr [rax + rcx*4], xmm0
14014824a: 49ffc5 inc r13
14014824d: 4c89ad40010000 mov qword ptr [rbp + 0x140], r13
140148254: 0f2efe ucomiss xmm7, xmm6
140148257: 0f2895c0000000 movaps xmm2, xmmword ptr [rbp + 0xc0]
14014825e: 0f83adfeffff jae 0x140148111
140148264: f3440f103f movss xmm15, dword ptr [rdi]
140148269: f3440f104708 movss xmm8, dword ptr [rdi + 8]
14014826f: f3410f103424 movss xmm6, dword ptr [r12]
140148275: f3450f10542408 movss xmm10, dword ptr [r12 + 8]
14014827c: f3410f10442404 movss xmm0, dword ptr [r12 + 4]
140148283: 0f294560 movaps xmmword ptr [rbp + 0x60], xmm0
140148287: f3410f1044240c movss xmm0, dword ptr [r12 + 0xc]
14014828e: 0f294570 movaps xmmword ptr [rbp + 0x70], xmm0
140148292: f30f104704 movss xmm0, dword ptr [rdi + 4]
140148297: 0f294540 movaps xmmword ptr [rbp + 0x40], xmm0
14014829b: f30f10470c movss xmm0, dword ptr [rdi + 0xc]
1401482a0: 0f294550 movaps xmmword ptr [rbp + 0x50], xmm0
1401482a4: 0f104710 movups xmm0, xmmword ptr [rdi + 0x10]
1401482a8: 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
1401482ac: 450f104c2410 movups xmm9, xmmword ptr [r12 + 0x10]
1401482b2: f30f104720 movss xmm0, dword ptr [rdi + 0x20]
1401482b7: f30f118504010000 movss dword ptr [rbp + 0x104], xmm0
1401482bf: f3450f10642420 movss xmm12, dword ptr [r12 + 0x20]
1401482c6: 4c3bad30010000 cmp r13, qword ptr [rbp + 0x130]
1401482cd: 0f85adfdffff jne 0x140148080
1401482d3: 488d8d30010000 lea rcx, [rbp + 0x130]
1401482da: e85194ae05 call 0x145c31730
1401482df: 90 nop
1401482e0: e99bfdffff jmp 0x140148080
1401482e5: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1401482f0: 498d7fff lea rdi, [r15 - 1]
1401482f4: b901000000 mov ecx, 1
1401482f9: 4839f9 cmp rcx, rdi
1401482fc: 0f832efcffff jae 0x140147f30
140148302: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140148310: 4c39f9 cmp rcx, r15
140148313: 0f83f6010000 jae 0x14014850f
140148319: 4c8d6101 lea r12, [rcx + 1]
14014831d: 4d39fc cmp r12, r15
140148320: 0f83fb010000 jae 0x140148521
140148326: 488d04c9 lea rax, [rcx + rcx*8]
14014832a: 4b8d0ce4 lea rcx, [r12 + r12*8]
14014832e: 8b548e20 mov edx, dword ptr [rsi + rcx*4 + 0x20]
140148332: 4c8d45d4 lea r8, [rbp - 0x2c]
140148336: 41895044 mov dword ptr [r8 + 0x44], edx
14014833a: 0f10048e movups xmm0, xmmword ptr [rsi + rcx*4]
14014833e: 0f104c8e10 movups xmm1, xmmword ptr [rsi + rcx*4 + 0x10]
140148343: 410f114834 movups xmmword ptr [r8 + 0x34], xmm1
140148348: 410f114024 movups xmmword ptr [r8 + 0x24], xmm0
14014834d: 8b4e20 mov ecx, dword ptr [rsi + 0x20]
140148350: 894dd0 mov dword ptr [rbp - 0x30], ecx
140148353: 0f1006 movups xmm0, xmmword ptr [rsi]
140148356: 0f104e10 movups xmm1, xmmword ptr [rsi + 0x10]
14014835a: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
14014835e: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
140148362: 8b4c8620 mov ecx, dword ptr [rsi + rax*4 + 0x20]
140148366: 41894820 mov dword ptr [r8 + 0x20], ecx
14014836a: 0f100486 movups xmm0, xmmword ptr [rsi + rax*4]
14014836e: 0f104c8610 movups xmm1, xmmword ptr [rsi + rax*4 + 0x10]
140148373: 410f114810 movups xmmword ptr [r8 + 0x10], xmm1
140148378: 410f1100 movups xmmword ptr [r8], xmm0
14014837c: 488b8d08010000 mov rcx, qword ptr [rbp + 0x108]
140148383: 488b01 mov rax, qword ptr [rcx]
140148386: 488b5110 mov rdx, qword ptr [rcx + 0x10]
14014838a: 4829d0 sub rax, rdx
14014838d: 4883f802 cmp rax, 2
140148391: 7666 jbe 0x1401483f9
140148393: 4c8b8508010000 mov r8, qword ptr [rbp + 0x108]
14014839a: 498b4008 mov rax, qword ptr [r8 + 8]
14014839e: 488d0cd2 lea rcx, [rdx + rdx*8]
1401483a2: 0f10450c movups xmm0, xmmword ptr [rbp + 0xc]
1401483a6: 0f1144885c movups xmmword ptr [rax + rcx*4 + 0x5c], xmm0
1401483ab: 0f284500 movaps xmm0, xmmword ptr [rbp]
1401483af: 0f11448850 movups xmmword ptr [rax + rcx*4 + 0x50], xmm0
1401483b4: 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
1401483b8: 0f11448840 movups xmmword ptr [rax + rcx*4 + 0x40], xmm0
1401483bd: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1401483c1: 0f284dc0 movaps xmm1, xmmword ptr [rbp - 0x40]
1401483c5: 0f2855d0 movaps xmm2, xmmword ptr [rbp - 0x30]
1401483c9: 0f285de0 movaps xmm3, xmmword ptr [rbp - 0x20]
1401483cd: 0f115c8830 movups xmmword ptr [rax + rcx*4 + 0x30], xmm3
1401483d2: 0f11548820 movups xmmword ptr [rax + rcx*4 + 0x20], xmm2
1401483d7: 0f114c8810 movups xmmword ptr [rax + rcx*4 + 0x10], xmm1
1401483dc: 0f110488 movups xmmword ptr [rax + rcx*4], xmm0
1401483e0: 4883c203 add rdx, 3
1401483e4: 49895010 mov qword ptr [r8 + 0x10], rdx
1401483e8: 4c89e1 mov rcx, r12
1401483eb: 4839f9 cmp rcx, rdi
1401483ee: 0f821cffffff jb 0x140148310
1401483f4: e937fbffff jmp 0x140147f30
1401483f9: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
140148402: 41b803000000 mov r8d, 3
140148408: 41b904000000 mov r9d, 4
14014840e: 488b8d08010000 mov rcx, qword ptr [rbp + 0x108]
140148415: e85625ab05 call 0x145bfa970
14014841a: 90 nop
14014841b: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
140148422: 488b5010 mov rdx, qword ptr [rax + 0x10]
140148426: e968ffffff jmp 0x140148393
14014842b: 48c744242024000000 mov qword ptr [rsp + 0x20], 0x24
140148434: 41b803000000 mov r8d, 3
14014843a: 41b904000000 mov r9d, 4
140148440: 488d8d10010000 lea rcx, [rbp + 0x110]
140148447: 31d2 xor edx, edx
140148449: e82225ab05 call 0x145bfa970
14014844e: 90 nop
14014844f: 488bb518010000 mov rsi, qword ptr [rbp + 0x118]
140148456: 4c8bbd20010000 mov r15, qword ptr [rbp + 0x120]
14014845d: 4989f6 mov r14, rsi
140148460: e9fffaffff jmp 0x140147f64
140148465: 488b8530010000 mov rax, qword ptr [rbp + 0x130]
14014846c: 4885c0 test rax, rax
14014846f: 741a je 0x14014848b
140148471: 488b8d38010000 mov rcx, qword ptr [rbp + 0x138]
140148478: 48c1e002 shl rax, 2
14014847c: 488d14c0 lea rdx, [rax + rax*8]
140148480: 41b804000000 mov r8d, 4
140148486: e8459debff call 0x1400021d0
14014848b: 488b8510010000 mov rax, qword ptr [rbp + 0x110]
140148492: 4885c0 test rax, rax
140148495: 7416 je 0x1401484ad
140148497: 48c1e002 shl rax, 2
14014849b: 488d14c0 lea rdx, [rax + rax*8]
14014849f: 41b804000000 mov r8d, 4
1401484a5: 4889f1 mov rcx, rsi
1401484a8: e8239debff call 0x1400021d0
1401484ad: 0f28b550010000 movaps xmm6, xmmword ptr [rbp + 0x150]
1401484b4: 0f28bd60010000 movaps xmm7, xmmword ptr [rbp + 0x160]
1401484bb: 440f288570010000 movaps xmm8, xmmword ptr [rbp + 0x170]
1401484c3: 440f288d80010000 movaps xmm9, xmmword ptr [rbp + 0x180]
1401484cb: 440f289590010000 movaps xmm10, xmmword ptr [rbp + 0x190]
1401484d3: 440f289da0010000 movaps xmm11, xmmword ptr [rbp + 0x1a0]
1401484db: 440f28a5b0010000 movaps xmm12, xmmword ptr [rbp + 0x1b0]
1401484e3: 440f28adc0010000 movaps xmm13, xmmword ptr [rbp + 0x1c0]
1401484eb: 440f28b5d0010000 movaps xmm14, xmmword ptr [rbp + 0x1d0]
1401484f3: 440f28bde0010000 movaps xmm15, xmmword ptr [rbp + 0x1e0]
1401484fb: 4881c478020000 add rsp, 0x278
140148502: 5b pop rbx
140148503: 5f pop rdi
140148504: 5e pop rsi
140148505: 415c pop r12
140148507: 415d pop r13
140148509: 415e pop r14
14014850b: 415f pop r15
14014850d: 5d pop rbp
14014850e: c3 ret
14014850f: 4c8d0532b1c905 lea r8, [rip + 0x5c9b132]
140148516: 4c89fa mov rdx, r15
140148519: e83511c505 call 0x145d99653
14014851e: 90 nop
14014851f: eb41 jmp 0x140148562
140148521: 4c8d0538b1c905 lea r8, [rip + 0x5c9b138]
140148528: 4c89e1 mov rcx, r12
14014852b: 4c89fa mov rdx, r15
14014852e: e82011c505 call 0x145d99653
140148533: 90 nop
140148534: eb2c jmp 0x140148562
140148536: b904000000 mov ecx, 4
14014853b: bab0010000 mov edx, 0x1b0
140148540: e8760dc505 call 0x145d992bb
140148545: 0f0b ud2
140148547: 48c785e80000000c000000 mov qword ptr [rbp + 0xe8], 0xc
140148552: b904000000 mov ecx, 4
140148557: bab0010000 mov edx, 0x1b0
14014855c: e85a0dc505 call 0x145d992bb
140148561: 90 nop
140148562: 0f0b ud2

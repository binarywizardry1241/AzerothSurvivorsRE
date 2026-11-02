14008d020: 55 push rbp
14008d021: 4157 push r15
14008d023: 4156 push r14
14008d025: 4155 push r13
14008d027: 4154 push r12
14008d029: 56 push rsi
14008d02a: 57 push rdi
14008d02b: 53 push rbx
14008d02c: 4881ec88040000 sub rsp, 0x488
14008d033: 488dac2480000000 lea rbp, [rsp + 0x80]
14008d03b: 440f29bdf0030000 movaps xmmword ptr [rbp + 0x3f0], xmm15
14008d043: 440f29b5e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm14
14008d04b: 440f29add0030000 movaps xmmword ptr [rbp + 0x3d0], xmm13
14008d053: 440f29a5c0030000 movaps xmmword ptr [rbp + 0x3c0], xmm12
14008d05b: 440f299db0030000 movaps xmmword ptr [rbp + 0x3b0], xmm11
14008d063: 440f2995a0030000 movaps xmmword ptr [rbp + 0x3a0], xmm10
14008d06b: 440f298d90030000 movaps xmmword ptr [rbp + 0x390], xmm9
14008d073: 440f298580030000 movaps xmmword ptr [rbp + 0x380], xmm8
14008d07b: 0f29bd70030000 movaps xmmword ptr [rbp + 0x370], xmm7
14008d082: 0f29b560030000 movaps xmmword ptr [rbp + 0x360], xmm6
14008d089: 48c78558030000feffffff mov qword ptr [rbp + 0x358], 0xfffffffffffffffe
14008d094: 4d89cf mov r15, r9
14008d097: 4c89c6 mov rsi, r8
14008d09a: 4889d3 mov rbx, rdx
14008d09d: 4889cf mov rdi, rcx
14008d0a0: 488d8dd8020000 lea rcx, [rbp + 0x2d8]
14008d0a7: 4c89c2 mov rdx, r8
14008d0aa: e8e1f85501 call 0x1415ec990
14008d0af: f30f104e18 movss xmm1, dword ptr [rsi + 0x18]
14008d0b4: f30f5c4e14 subss xmm1, dword ptr [rsi + 0x14]
14008d0b9: 0f57c0 xorps xmm0, xmm0
14008d0bc: 0f2ec1 ucomiss xmm0, xmm1
14008d0bf: 0f8310090000 jae 0x14008d9d5
14008d0c5: f30f104e20 movss xmm1, dword ptr [rsi + 0x20]
14008d0ca: f30f5c4e1c subss xmm1, dword ptr [rsi + 0x1c]
14008d0cf: 31c0 xor eax, eax
14008d0d1: 0f2ec1 ucomiss xmm0, xmm1
14008d0d4: 0f830d090000 jae 0x14008d9e7
14008d0da: 48c7853003000000000000 mov qword ptr [rbp + 0x330], 0
14008d0e5: 488b4710 mov rax, qword ptr [rdi + 0x10]
14008d0e9: 488985f8020000 mov qword ptr [rbp + 0x2f8], rax
14008d0f0: 488b13 mov rdx, qword ptr [rbx]
14008d0f3: 4c8b7308 mov r14, qword ptr [rbx + 8]
14008d0f7: 4889f1 mov rcx, rsi
14008d0fa: 488bb2f8000000 mov rsi, qword ptr [rdx + 0xf8]
14008d101: 488b8200010000 mov rax, qword ptr [rdx + 0x100]
14008d108: 4c8d2486 lea r12, [rsi + rax*4]
14008d10c: 48899520030000 mov qword ptr [rbp + 0x320], rdx
14008d113: 440fb6aa08010000 movzx r13d, byte ptr [rdx + 0x108]
14008d11b: f30f1001 movss xmm0, dword ptr [rcx]
14008d11f: f30f11853c030000 movss dword ptr [rbp + 0x33c], xmm0
14008d127: f30f104108 movss xmm0, dword ptr [rcx + 8]
14008d12c: f30f118540030000 movss dword ptr [rbp + 0x340], xmm0
14008d134: f3440f104110 movss xmm8, dword ptr [rcx + 0x10]
14008d13a: 48898df0020000 mov qword ptr [rbp + 0x2f0], rcx
14008d141: f3440f10490c movss xmm9, dword ptr [rcx + 0xc]
14008d147: f3450f105714 movss xmm10, dword ptr [r15 + 0x14]
14008d14d: f3450f105f18 movss xmm11, dword ptr [r15 + 0x18]
14008d153: f3450f5cda subss xmm11, xmm10
14008d158: f3450f10671c movss xmm12, dword ptr [r15 + 0x1c]
14008d15e: f3450f106f20 movss xmm13, dword ptr [r15 + 0x20]
14008d164: f3450f5cec subss xmm13, xmm12
14008d169: b808000000 mov eax, 8
14008d16e: 48898518030000 mov qword ptr [rbp + 0x318], rax
14008d175: 48c7854803000000000000 mov qword ptr [rbp + 0x348], 0
14008d180: c7854403000000000000 mov dword ptr [rbp + 0x344], 0
14008d18a: 4c89b508030000 mov qword ptr [rbp + 0x308], r14
14008d191: 4c89a510030000 mov qword ptr [rbp + 0x310], r12
14008d198: 4488ad57030000 mov byte ptr [rbp + 0x357], r13b
14008d19f: 4584ed test r13b, r13b
14008d1a2: 0f8498000000 je 0x14008d240
14008d1a8: 4c8b8530030000 mov r8, qword ptr [rbp + 0x330]
14008d1af: 8b9544030000 mov edx, dword ptr [rbp + 0x344]
14008d1b5: 4439c2 cmp edx, r8d
14008d1b8: 0f852e010000 jne 0x14008d2ec
14008d1be: 6690 nop
14008d1c0: 4c39e6 cmp rsi, r12
14008d1c3: 0f8410080000 je 0x14008d9d9
14008d1c9: 8b0e mov ecx, dword ptr [rsi]
14008d1cb: 4883c604 add rsi, 4
14008d1cf: 498b86a8010000 mov rax, qword ptr [r14 + 0x1a8]
14008d1d6: 488d0cc9 lea rcx, [rcx + rcx*8]
14008d1da: 4c8b44c810 mov r8, qword ptr [rax + rcx*8 + 0x10]
14008d1df: 4d85c0 test r8, r8
14008d1e2: 74dc je 0x14008d1c0
14008d1e4: 488d04c8 lea rax, [rax + rcx*8]
14008d1e8: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
14008d1ef: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
14008d1f6: 483b4840 cmp rcx, qword ptr [rax + 0x40]
14008d1fa: 0f83df000000 jae 0x14008d2df
14008d200: 488b5038 mov rdx, qword ptr [rax + 0x38]
14008d204: 488b0cca mov rcx, qword ptr [rdx + rcx*8]
14008d208: 4885c9 test rcx, rcx
14008d20b: 0f84ce000000 je 0x14008d2df
14008d211: 488b4018 mov rax, qword ptr [rax + 0x18]
14008d215: 48f7d1 not rcx
14008d218: 488d0c49 lea rcx, [rcx + rcx*2]
14008d21c: 48c1e104 shl rcx, 4
14008d220: 488b440810 mov rax, qword ptr [rax + rcx + 0x10]
14008d225: 48898548030000 mov qword ptr [rbp + 0x348], rax
14008d22c: e9b9000000 jmp 0x14008d2ea
14008d231: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14008d240: 4c8b8d30030000 mov r9, qword ptr [rbp + 0x330]
14008d247: 8b9544030000 mov edx, dword ptr [rbp + 0x344]
14008d24d: 4439ca cmp edx, r9d
14008d250: 0f85b9000000 jne 0x14008d30f
14008d256: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14008d260: 4c39e6 cmp rsi, r12
14008d263: 0f8470070000 je 0x14008d9d9
14008d269: 8b0e mov ecx, dword ptr [rsi]
14008d26b: 4883c604 add rsi, 4
14008d26f: 498b8608010000 mov rax, qword ptr [r14 + 0x108]
14008d276: 488d0c89 lea rcx, [rcx + rcx*4]
14008d27a: 48c1e105 shl rcx, 5
14008d27e: 4c8b4c0858 mov r9, qword ptr [rax + rcx + 0x58]
14008d283: 4d85c9 test r9, r9
14008d286: 74d8 je 0x14008d260
14008d288: 4801c8 add rax, rcx
14008d28b: 8b8894000000 mov ecx, dword ptr [rax + 0x94]
14008d291: 498b96a8010000 mov rdx, qword ptr [r14 + 0x1a8]
14008d298: 4c8d04c9 lea r8, [rcx + rcx*8]
14008d29c: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
14008d2a3: 488b8910010000 mov rcx, qword ptr [rcx + 0x110]
14008d2aa: 4a3b4cc240 cmp rcx, qword ptr [rdx + r8*8 + 0x40]
14008d2af: 7346 jae 0x14008d2f7
14008d2b1: 4a8d14c2 lea rdx, [rdx + r8*8]
14008d2b5: 4c8b4238 mov r8, qword ptr [rdx + 0x38]
14008d2b9: 498b0cc8 mov rcx, qword ptr [r8 + rcx*8]
14008d2bd: 4885c9 test rcx, rcx
14008d2c0: 7435 je 0x14008d2f7
14008d2c2: 488b5218 mov rdx, qword ptr [rdx + 0x18]
14008d2c6: 48f7d1 not rcx
14008d2c9: 488d0c49 lea rcx, [rcx + rcx*2]
14008d2cd: 48c1e104 shl rcx, 4
14008d2d1: 488b4c0a10 mov rcx, qword ptr [rdx + rcx + 0x10]
14008d2d6: 48898d48030000 mov qword ptr [rbp + 0x348], rcx
14008d2dd: eb23 jmp 0x14008d302
14008d2df: 48c7854803000000000000 mov qword ptr [rbp + 0x348], 0
14008d2ea: 31d2 xor edx, edx
14008d2ec: 4c898530030000 mov qword ptr [rbp + 0x330], r8
14008d2f3: 89d0 mov eax, edx
14008d2f5: eb32 jmp 0x14008d329
14008d2f7: 48c7854803000000000000 mov qword ptr [rbp + 0x348], 0
14008d302: 488b4050 mov rax, qword ptr [rax + 0x50]
14008d306: 48898518030000 mov qword ptr [rbp + 0x318], rax
14008d30d: 31d2 xor edx, edx
14008d30f: 4c898d30030000 mov qword ptr [rbp + 0x330], r9
14008d316: 89d0 mov eax, edx
14008d318: 48c1e004 shl rax, 4
14008d31c: 488b8d18030000 mov rcx, qword ptr [rbp + 0x318]
14008d323: 8b440108 mov eax, dword ptr [rcx + rax + 8]
14008d327: f7d0 not eax
14008d329: 488d0440 lea rax, [rax + rax*2]
14008d32d: 48c1e004 shl rax, 4
14008d331: 48038548030000 add rax, qword ptr [rbp + 0x348]
14008d338: ffc2 inc edx
14008d33a: 899544030000 mov dword ptr [rbp + 0x344], edx
14008d340: 488b08 mov rcx, qword ptr [rax]
14008d343: 488b5008 mov rdx, qword ptr [rax + 8]
14008d347: 488b4210 mov rax, qword ptr [rdx + 0x10]
14008d34b: 48ffc8 dec rax
14008d34e: 4883e0f0 and rax, 0xfffffffffffffff0
14008d352: 4801c1 add rcx, rax
14008d355: 4883c110 add rcx, 0x10
14008d359: e802ba1302 call 0x1421c8d60
14008d35e: 4885c0 test rax, rax
14008d361: 0f8438feffff je 0x14008d19f
14008d367: 488d8d40010000 lea rcx, [rbp + 0x140]
14008d36e: 4889c2 mov rdx, rax
14008d371: 48898528030000 mov qword ptr [rbp + 0x328], rax
14008d378: e8d3111402 call 0x1421ce550
14008d37d: 0f1085dc020000 movups xmm0, xmmword ptr [rbp + 0x2dc]
14008d384: 0f28c8 movaps xmm1, xmm0
14008d387: 0f128d50010000 movlps xmm1, qword ptr [rbp + 0x150]
14008d38e: 660f148540010000 unpcklpd xmm0, xmmword ptr [rbp + 0x140]
14008d396: 0fc2c106 cmpnleps xmm0, xmm1
14008d39a: 0f50c0 movmskps eax, xmm0
14008d39d: 85c0 test eax, eax
14008d39f: 488b9528030000 mov rdx, qword ptr [rbp + 0x328]
14008d3a6: 0f85f3fdffff jne 0x14008d19f
14008d3ac: f30f10854c010000 movss xmm0, dword ptr [rbp + 0x14c]
14008d3b4: 0f2e85d8020000 ucomiss xmm0, dword ptr [rbp + 0x2d8]
14008d3bb: 0f82defdffff jb 0x14008d19f
14008d3c1: f30f1085ec020000 movss xmm0, dword ptr [rbp + 0x2ec]
14008d3c9: 0f2e8548010000 ucomiss xmm0, dword ptr [rbp + 0x148]
14008d3d0: 0f82c9fdffff jb 0x14008d19f
14008d3d6: 488d5da8 lea rbx, [rbp - 0x58]
14008d3da: 4889d9 mov rcx, rbx
14008d3dd: 4c8d85d8020000 lea r8, [rbp + 0x2d8]
14008d3e4: e807451502 call 0x1421e18f0
14008d3e9: 41b820010000 mov r8d, 0x120
14008d3ef: 488d8d40010000 lea rcx, [rbp + 0x140]
14008d3f6: 4889da mov rdx, rbx
14008d3f9: e8e9ccb605 call 0x145bfa0e7
14008d3fe: eb07 jmp 0x14008d407
14008d400: 48899d50010000 mov qword ptr [rbp + 0x150], rbx
14008d407: 488b8550010000 mov rax, qword ptr [rbp + 0x150]
14008d40e: 4885c0 test rax, rax
14008d411: 754f jne 0x14008d462
14008d413: 488b9558020000 mov rdx, qword ptr [rbp + 0x258]
14008d41a: 4883fa21 cmp rdx, 0x21
14008d41e: b818010000 mov eax, 0x118
14008d423: b920000000 mov ecx, 0x20
14008d428: 480f43c1 cmovae rax, rcx
14008d42c: 488b8c0540010000 mov rcx, qword ptr [rbp + rax + 0x140]
14008d434: 4885c9 test rcx, rcx
14008d437: 0f8473050000 je 0x14008d9b0
14008d43d: 4c8d8558010000 lea r8, [rbp + 0x158]
14008d444: 4883fa21 cmp rdx, 0x21
14008d448: 7207 jb 0x14008d451
14008d44a: 4c8b8558010000 mov r8, qword ptr [rbp + 0x158]
14008d451: 488d51ff lea rdx, [rcx - 1]
14008d455: 4889940540010000 mov qword ptr [rbp + rax + 0x140], rdx
14008d45d: 498b44c8f8 mov rax, qword ptr [r8 + rcx*8 - 8]
14008d462: 48c7855001000000000000 mov qword ptr [rbp + 0x150], 0
14008d46d: 8b481c mov ecx, dword ptr [rax + 0x1c]
14008d470: baffffff3f mov edx, 0x3fffffff
14008d475: 21d1 and ecx, edx
14008d477: 83f901 cmp ecx, 1
14008d47a: 0f8455010000 je 0x14008d5d5
14008d480: 4c8b8540010000 mov r8, qword ptr [rbp + 0x140]
14008d487: 8b480c mov ecx, dword ptr [rax + 0xc]
14008d48a: 498b5010 mov rdx, qword ptr [r8 + 0x10]
14008d48e: 4839ca cmp rdx, rcx
14008d491: 0f86b2050000 jbe 0x14008da49
14008d497: 498b4008 mov rax, qword ptr [r8 + 8]
14008d49b: 48c1e106 shl rcx, 6
14008d49f: 488d1408 lea rdx, [rax + rcx]
14008d4a3: 4c8b8548010000 mov r8, qword ptr [rbp + 0x148]
14008d4aa: f30f10640808 movss xmm4, dword ptr [rax + rcx + 8]
14008d4b0: f3410f104014 movss xmm0, dword ptr [r8 + 0x14]
14008d4b6: f2410f10580c movsd xmm3, qword ptr [r8 + 0xc]
14008d4bc: f2410f1010 movsd xmm2, qword ptr [r8]
14008d4c1: f3410f104808 movss xmm1, dword ptr [r8 + 8]
14008d4c7: f20f106c0810 movsd xmm5, qword ptr [rax + rcx + 0x10]
14008d4cd: f20f103408 movsd xmm6, qword ptr [rax + rcx]
14008d4d2: 0fc2f306 cmpnleps xmm6, xmm3
14008d4d6: 0f28fa movaps xmm7, xmm2
14008d4d9: 0fc2fd06 cmpnleps xmm7, xmm5
14008d4dd: 0f56fe orps xmm7, xmm6
14008d4e0: 660f70efd4 pshufd xmm5, xmm7, 0xd4
14008d4e5: 660f73f53f psllq xmm5, 0x3f
14008d4ea: 66440f50cd movmskpd r9d, xmm5
14008d4ef: 0f28e9 movaps xmm5, xmm1
14008d4f2: f30fc26c081806 cmpnless xmm5, dword ptr [rax + rcx + 0x18]
14008d4f9: f30fc2e006 cmpnless xmm4, xmm0
14008d4fe: 0f56e5 orps xmm4, xmm5
14008d501: 66410f7ee0 movd r8d, xmm4
14008d506: 4508c8 or r8b, r9b
14008d509: 41d0e9 shr r9b, 1
14008d50c: 4508c8 or r8b, r9b
14008d50f: 41f6c001 test r8b, 1
14008d513: 7507 jne 0x14008d51c
14008d515: 48899550010000 mov qword ptr [rbp + 0x150], rdx
14008d51c: f20f106230 movsd xmm4, qword ptr [rdx + 0x30]
14008d521: f20f106a20 movsd xmm5, qword ptr [rdx + 0x20]
14008d526: 0fc2eb02 cmpleps xmm5, xmm3
14008d52a: 0fc2d402 cmpleps xmm2, xmm4
14008d52e: 0f54d5 andps xmm2, xmm5
14008d531: 660f70d2d4 pshufd xmm2, xmm2, 0xd4
14008d536: 660f73f23f psllq xmm2, 0x3f
14008d53b: 66440f50ca movmskpd r9d, xmm2
14008d540: 41f6c101 test r9b, 1
14008d544: 0f84bdfeffff je 0x14008d407
14008d54a: 41d0e9 shr r9b, 1
14008d54d: 0f84b4feffff je 0x14008d407
14008d553: f30f105238 movss xmm2, dword ptr [rdx + 0x38]
14008d558: 0f2ed1 ucomiss xmm2, xmm1
14008d55b: 0f82a6feffff jb 0x14008d407
14008d561: 0f2e4228 ucomiss xmm0, dword ptr [rdx + 0x28]
14008d565: 0f829cfeffff jb 0x14008d407
14008d56b: 488d1c08 lea rbx, [rax + rcx]
14008d56f: 4883c320 add rbx, 0x20
14008d573: 41f6c001 test r8b, 1
14008d577: 0f8583feffff jne 0x14008d400
14008d57d: 4c8b8558020000 mov r8, qword ptr [rbp + 0x258]
14008d584: 4983f821 cmp r8, 0x21
14008d588: 488b8558010000 mov rax, qword ptr [rbp + 0x158]
14008d58f: 488d8d58010000 lea rcx, [rbp + 0x158]
14008d596: 480f42c1 cmovb rax, rcx
14008d59a: 488d9558020000 lea rdx, [rbp + 0x258]
14008d5a1: 4889d1 mov rcx, rdx
14008d5a4: 4c8d8d60010000 lea r9, [rbp + 0x160]
14008d5ab: 490f43c9 cmovae rcx, r9
14008d5af: 41ba20000000 mov r10d, 0x20
14008d5b5: 4d0f42c2 cmovb r8, r10
14008d5b9: 490f43d1 cmovae rdx, r9
14008d5bd: 488b12 mov rdx, qword ptr [rdx]
14008d5c0: 4c39c2 cmp rdx, r8
14008d5c3: 0f84a2030000 je 0x14008d96b
14008d5c9: 48891cd0 mov qword ptr [rax + rdx*8], rbx
14008d5cd: 48ff01 inc qword ptr [rcx]
14008d5d0: e932feffff jmp 0x14008d407
14008d5d5: 8b480c mov ecx, dword ptr [rax + 0xc]
14008d5d8: 488b8528030000 mov rax, qword ptr [rbp + 0x328]
14008d5df: 488b9080000000 mov rdx, qword ptr [rax + 0x80]
14008d5e6: 4839ca cmp rdx, rcx
14008d5e9: 0f8680040000 jbe 0x14008da6f
14008d5ef: 488b5068 mov rdx, qword ptr [rax + 0x68]
14008d5f3: 4c8b4078 mov r8, qword ptr [rax + 0x78]
14008d5f7: 4c8d0c49 lea r9, [rcx + rcx*2]
14008d5fb: 438b0c88 mov ecx, dword ptr [r8 + r9*4]
14008d5ff: 4839ca cmp rdx, rcx
14008d602: 0f8676040000 jbe 0x14008da7e
14008d608: 4b8d0488 lea rax, [r8 + r9*4]
14008d60c: 8b4004 mov eax, dword ptr [rax + 4]
14008d60f: 4839c2 cmp rdx, rax
14008d612: 0f8675040000 jbe 0x14008da8d
14008d618: 478b4c8808 mov r9d, dword ptr [r8 + r9*4 + 8]
14008d61d: 4c39ca cmp rdx, r9
14008d620: 0f8679040000 jbe 0x14008da9f
14008d626: 488b9528030000 mov rdx, qword ptr [rbp + 0x328]
14008d62d: 488b5260 mov rdx, qword ptr [rdx + 0x60]
14008d631: 488d0440 lea rax, [rax + rax*2]
14008d635: 488d0c49 lea rcx, [rcx + rcx*2]
14008d639: 4f8d0449 lea r8, [r9 + r9*2]
14008d63d: 448b4c8a08 mov r9d, dword ptr [rdx + rcx*4 + 8]
14008d642: 44898d68020000 mov dword ptr [rbp + 0x268], r9d
14008d649: 488b0c8a mov rcx, qword ptr [rdx + rcx*4]
14008d64d: 48898d60020000 mov qword ptr [rbp + 0x260], rcx
14008d654: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
14008d658: 4c8d8d6c020000 lea r9, [rbp + 0x26c]
14008d65f: 41894908 mov dword ptr [r9 + 8], ecx
14008d663: 488b0482 mov rax, qword ptr [rdx + rax*4]
14008d667: 498901 mov qword ptr [r9], rax
14008d66a: 428b448208 mov eax, dword ptr [rdx + r8*4 + 8]
14008d66f: 41894114 mov dword ptr [r9 + 0x14], eax
14008d673: 4a8b0482 mov rax, qword ptr [rdx + r8*4]
14008d677: 4989410c mov qword ptr [r9 + 0xc], rax
14008d67b: 488d8dc8000000 lea rcx, [rbp + 0xc8]
14008d682: 488d9560020000 lea rdx, [rbp + 0x260]
14008d689: 4c8b85f0020000 mov r8, qword ptr [rbp + 0x2f0]
14008d690: e8ebfb5501 call 0x1415ed280
14008d695: 90 nop
14008d696: 0f108524010000 movups xmm0, xmmword ptr [rbp + 0x124]
14008d69d: 0f1185bc020000 movups xmmword ptr [rbp + 0x2bc], xmm0
14008d6a4: 0f108518010000 movups xmm0, xmmword ptr [rbp + 0x118]
14008d6ab: 0f2985b0020000 movaps xmmword ptr [rbp + 0x2b0], xmm0
14008d6b2: 0f108508010000 movups xmm0, xmmword ptr [rbp + 0x108]
14008d6b9: 0f2985a0020000 movaps xmmword ptr [rbp + 0x2a0], xmm0
14008d6c0: 0f1085c8000000 movups xmm0, xmmword ptr [rbp + 0xc8]
14008d6c7: 0f108dd8000000 movups xmm1, xmmword ptr [rbp + 0xd8]
14008d6ce: 0f1095e8000000 movups xmm2, xmmword ptr [rbp + 0xe8]
14008d6d5: 0f109df8000000 movups xmm3, xmmword ptr [rbp + 0xf8]
14008d6dc: 0f299d90020000 movaps xmmword ptr [rbp + 0x290], xmm3
14008d6e3: 0f299580020000 movaps xmmword ptr [rbp + 0x280], xmm2
14008d6ea: 0f298d70020000 movaps xmmword ptr [rbp + 0x270], xmm1
14008d6f1: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
14008d6f8: 488b8538010000 mov rax, qword ptr [rbp + 0x138]
14008d6ff: 48898500030000 mov qword ptr [rbp + 0x300], rax
14008d706: 4883f803 cmp rax, 3
14008d70a: 731b jae 0x14008d727
14008d70c: 4c8bb508030000 mov r14, qword ptr [rbp + 0x308]
14008d713: 4c8ba510030000 mov r12, qword ptr [rbp + 0x310]
14008d71a: 440fb6ad57030000 movzx r13d, byte ptr [rbp + 0x357]
14008d722: e9e0fcffff jmp 0x14008d407
14008d727: 48ff8d00030000 dec qword ptr [rbp + 0x300]
14008d72e: f2440f10bd60020000 movsd xmm15, qword ptr [rbp + 0x260]
14008d737: f3440f10b568020000 movss xmm14, dword ptr [rbp + 0x268]
14008d740: 410f28c7 movaps xmm0, xmm15
14008d744: f30f5c853c030000 subss xmm0, dword ptr [rbp + 0x33c]
14008d74c: 410f28ce movaps xmm1, xmm14
14008d750: f30f5c8d40030000 subss xmm1, dword ptr [rbp + 0x340]
14008d758: 410f28d0 movaps xmm2, xmm8
14008d75c: f30f59d0 mulss xmm2, xmm0
14008d760: 410f28d9 movaps xmm3, xmm9
14008d764: f30f59d9 mulss xmm3, xmm1
14008d768: f30f5cd3 subss xmm2, xmm3
14008d76c: f3410f59c8 mulss xmm1, xmm8
14008d771: f3410f59c1 mulss xmm0, xmm9
14008d776: f30f58c1 addss xmm0, xmm1
14008d77a: f3410f5cd2 subss xmm2, xmm10
14008d77f: f3410f5ed3 divss xmm2, xmm11
14008d784: f3410f5cc4 subss xmm0, xmm12
14008d789: f3410f5ec5 divss xmm0, xmm13
14008d78e: 66410f7ed5 movd r13d, xmm2
14008d793: 660f7ec0 movd eax, xmm0
14008d797: 48c1e020 shl rax, 0x20
14008d79b: 4909c5 or r13, rax
14008d79e: 41bc01000000 mov r12d, 1
14008d7a4: e990000000 jmp 0x14008d839
14008d7a9: 0f1f8000000000 nop dword ptr [rax]
14008d7b0: 0f28c6 movaps xmm0, xmm6
14008d7b3: f30f5c853c030000 subss xmm0, dword ptr [rbp + 0x33c]
14008d7bb: 0f28cf movaps xmm1, xmm7
14008d7be: f30f5c8d40030000 subss xmm1, dword ptr [rbp + 0x340]
14008d7c6: 410f28d0 movaps xmm2, xmm8
14008d7ca: f30f59d0 mulss xmm2, xmm0
14008d7ce: 410f28d9 movaps xmm3, xmm9
14008d7d2: f30f59d9 mulss xmm3, xmm1
14008d7d6: f30f5cd3 subss xmm2, xmm3
14008d7da: f3410f59c8 mulss xmm1, xmm8
14008d7df: f3410f59c1 mulss xmm0, xmm9
14008d7e4: f30f58c1 addss xmm0, xmm1
14008d7e8: f3410f5cd2 subss xmm2, xmm10
14008d7ed: f3410f5ed3 divss xmm2, xmm11
14008d7f2: f3410f5cc4 subss xmm0, xmm12
14008d7f7: f3410f5ec5 divss xmm0, xmm13
14008d7fc: 660f7ed0 movd eax, xmm2
14008d800: 660f7ec1 movd ecx, xmm0
14008d804: 48c1e120 shl rcx, 0x20
14008d808: 4809c8 or rax, rcx
14008d80b: 488b4f08 mov rcx, qword ptr [rdi + 8]
14008d80f: 488d14db lea rdx, [rbx + rbx*8]
14008d813: 0f133491 movlps qword ptr [rcx + rdx*4], xmm6
14008d817: f30f117c9108 movss dword ptr [rcx + rdx*4 + 8], xmm7
14008d81d: 488944910c mov qword ptr [rcx + rdx*4 + 0xc], rax
14008d822: 0f280567fad005 movaps xmm0, xmmword ptr [rip + 0x5d0fa67]
14008d829: 0f11449114 movups xmmword ptr [rcx + rdx*4 + 0x14], xmm0
14008d82e: 4983c703 add r15, 3
14008d832: 4c897f10 mov qword ptr [rdi + 0x10], r15
14008d836: 4d89f4 mov r12, r14
14008d839: 4c3ba500030000 cmp r12, qword ptr [rbp + 0x300]
14008d840: 0f83c6feffff jae 0x14008d70c
14008d846: 4c8b7f10 mov r15, qword ptr [rdi + 0x10]
14008d84a: 4c3b3f cmp r15, qword ptr [rdi]
14008d84d: 7509 jne 0x14008d858
14008d84f: 4889f9 mov rcx, rdi
14008d852: e8d93eba05 call 0x145c31730
14008d857: 90 nop
14008d858: 488b4708 mov rax, qword ptr [rdi + 8]
14008d85c: 4b8d0cff lea rcx, [r15 + r15*8]
14008d860: 440f133c88 movlps qword ptr [rax + rcx*4], xmm15
14008d865: f3440f11748808 movss dword ptr [rax + rcx*4 + 8], xmm14
14008d86c: 4c896c880c mov qword ptr [rax + rcx*4 + 0xc], r13
14008d871: 0f280518fad005 movaps xmm0, xmmword ptr [rip + 0x5d0fa18]
14008d878: 0f11448814 movups xmmword ptr [rax + rcx*4 + 0x14], xmm0
14008d87d: 498d5f01 lea rbx, [r15 + 1]
14008d881: 48895f10 mov qword ptr [rdi + 0x10], rbx
14008d885: 4b8d0464 lea rax, [r12 + r12*2]
14008d889: f20f10b48560020000 movsd xmm6, qword ptr [rbp + rax*4 + 0x260]
14008d892: f30f10bc8568020000 movss xmm7, dword ptr [rbp + rax*4 + 0x268]
14008d89b: 483b1f cmp rbx, qword ptr [rdi]
14008d89e: 7509 jne 0x14008d8a9
14008d8a0: 4889f9 mov rcx, rdi
14008d8a3: e8883eba05 call 0x145c31730
14008d8a8: 90 nop
14008d8a9: 4d8d742401 lea r14, [r12 + 1]
14008d8ae: 0f28c6 movaps xmm0, xmm6
14008d8b1: f30f5c853c030000 subss xmm0, dword ptr [rbp + 0x33c]
14008d8b9: 0f28cf movaps xmm1, xmm7
14008d8bc: f30f5c8d40030000 subss xmm1, dword ptr [rbp + 0x340]
14008d8c4: 410f28d0 movaps xmm2, xmm8
14008d8c8: f30f59d0 mulss xmm2, xmm0
14008d8cc: 410f28d9 movaps xmm3, xmm9
14008d8d0: f30f59d9 mulss xmm3, xmm1
14008d8d4: f30f5cd3 subss xmm2, xmm3
14008d8d8: f3410f59c8 mulss xmm1, xmm8
14008d8dd: f3410f59c1 mulss xmm0, xmm9
14008d8e2: f30f58c1 addss xmm0, xmm1
14008d8e6: f3410f5cd2 subss xmm2, xmm10
14008d8eb: f3410f5ed3 divss xmm2, xmm11
14008d8f0: f3410f5cc4 subss xmm0, xmm12
14008d8f5: f3410f5ec5 divss xmm0, xmm13
14008d8fa: 660f7ed0 movd eax, xmm2
14008d8fe: 660f7ec1 movd ecx, xmm0
14008d902: 48c1e120 shl rcx, 0x20
14008d906: 4809c8 or rax, rcx
14008d909: 488b4f08 mov rcx, qword ptr [rdi + 8]
14008d90d: 488d14db lea rdx, [rbx + rbx*8]
14008d911: 0f133491 movlps qword ptr [rcx + rdx*4], xmm6
14008d915: f30f117c9108 movss dword ptr [rcx + rdx*4 + 8], xmm7
14008d91b: 488944910c mov qword ptr [rcx + rdx*4 + 0xc], rax
14008d920: 0f280569f9d005 movaps xmm0, xmmword ptr [rip + 0x5d0f969]
14008d927: 0f11449114 movups xmmword ptr [rcx + rdx*4 + 0x14], xmm0
14008d92c: 498d5f02 lea rbx, [r15 + 2]
14008d930: 48895f10 mov qword ptr [rdi + 0x10], rbx
14008d934: 4983fc08 cmp r12, 8
14008d938: 0f841a010000 je 0x14008da58
14008d93e: 4b8d0476 lea rax, [r14 + r14*2]
14008d942: f20f10b48560020000 movsd xmm6, qword ptr [rbp + rax*4 + 0x260]
14008d94b: f30f10bc8568020000 movss xmm7, dword ptr [rbp + rax*4 + 0x268]
14008d954: 483b1f cmp rbx, qword ptr [rdi]
14008d957: 0f8553feffff jne 0x14008d7b0
14008d95d: 4889f9 mov rcx, rdi
14008d960: e8cb3dba05 call 0x145c31730
14008d965: 90 nop
14008d966: e945feffff jmp 0x14008d7b0
14008d96b: 488d8d58010000 lea rcx, [rbp + 0x158]
14008d972: e899d9b605 call 0x145bfb310
14008d977: 90 nop
14008d978: 488b8558010000 mov rax, qword ptr [rbp + 0x158]
14008d97f: 488b9560010000 mov rdx, qword ptr [rbp + 0x160]
14008d986: 488d8d60010000 lea rcx, [rbp + 0x160]
14008d98d: 4c8bb508030000 mov r14, qword ptr [rbp + 0x308]
14008d994: 4c8ba510030000 mov r12, qword ptr [rbp + 0x310]
14008d99b: 440fb6ad57030000 movzx r13d, byte ptr [rbp + 0x357]
14008d9a3: e921fcffff jmp 0x14008d5c9
14008d9a8: 0f1f840000000000 nop dword ptr [rax + rax]
14008d9b0: 4883fa21 cmp rdx, 0x21
14008d9b4: 0f82e5f7ffff jb 0x14008d19f
14008d9ba: 488b8d58010000 mov rcx, qword ptr [rbp + 0x158]
14008d9c1: 48c1e203 shl rdx, 3
14008d9c5: 41b808000000 mov r8d, 8
14008d9cb: e80048f7ff call 0x1400021d0
14008d9d0: e9caf7ffff jmp 0x14008d19f
14008d9d5: 31c0 xor eax, eax
14008d9d7: eb0e jmp 0x14008d9e7
14008d9d9: 488b85f8020000 mov rax, qword ptr [rbp + 0x2f8]
14008d9e0: 48394710 cmp qword ptr [rdi + 0x10], rax
14008d9e4: 0f97c0 seta al
14008d9e7: 0f28b560030000 movaps xmm6, xmmword ptr [rbp + 0x360]
14008d9ee: 0f28bd70030000 movaps xmm7, xmmword ptr [rbp + 0x370]
14008d9f5: 440f288580030000 movaps xmm8, xmmword ptr [rbp + 0x380]
14008d9fd: 440f288d90030000 movaps xmm9, xmmword ptr [rbp + 0x390]
14008da05: 440f2895a0030000 movaps xmm10, xmmword ptr [rbp + 0x3a0]
14008da0d: 440f289db0030000 movaps xmm11, xmmword ptr [rbp + 0x3b0]
14008da15: 440f28a5c0030000 movaps xmm12, xmmword ptr [rbp + 0x3c0]
14008da1d: 440f28add0030000 movaps xmm13, xmmword ptr [rbp + 0x3d0]
14008da25: 440f28b5e0030000 movaps xmm14, xmmword ptr [rbp + 0x3e0]
14008da2d: 440f28bdf0030000 movaps xmm15, xmmword ptr [rbp + 0x3f0]
14008da35: 4881c488040000 add rsp, 0x488
14008da3c: 5b pop rbx
14008da3d: 5f pop rdi
14008da3e: 5e pop rsi
14008da3f: 415c pop r12
14008da41: 415d pop r13
14008da43: 415e pop r14
14008da45: 415f pop r15
14008da47: 5d pop rbp
14008da48: c3 ret
14008da49: 4c8d059847d405 lea r8, [rip + 0x5d44798]
14008da50: e8febbd005 call 0x145d99653
14008da55: 90 nop
14008da56: eb57 jmp 0x14008daaf
14008da58: 4c8d052937d405 lea r8, [rip + 0x5d43729]
14008da5f: ba09000000 mov edx, 9
14008da64: 4c89f1 mov rcx, r14
14008da67: e8e7bbd005 call 0x145d99653
14008da6c: 90 nop
14008da6d: eb40 jmp 0x14008daaf
14008da6f: 4c8d05c242d405 lea r8, [rip + 0x5d442c2]
14008da76: e8d8bbd005 call 0x145d99653
14008da7b: 90 nop
14008da7c: eb31 jmp 0x14008daaf
14008da7e: 4c8d05cb42d405 lea r8, [rip + 0x5d442cb]
14008da85: e8c9bbd005 call 0x145d99653
14008da8a: 90 nop
14008da8b: eb22 jmp 0x14008daaf
14008da8d: 4c8d05d442d405 lea r8, [rip + 0x5d442d4]
14008da94: 4889c1 mov rcx, rax
14008da97: e8b7bbd005 call 0x145d99653
14008da9c: 90 nop
14008da9d: eb10 jmp 0x14008daaf
14008da9f: 4c8d05da42d405 lea r8, [rip + 0x5d442da]
14008daa6: 4c89c9 mov rcx, r9
14008daa9: e8a5bbd005 call 0x145d99653
14008daae: 90 nop
14008daaf: 0f0b ud2

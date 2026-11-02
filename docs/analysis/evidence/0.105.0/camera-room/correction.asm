140b07260: push r15
140b07262: push r14
140b07264: push r13
140b07266: push r12
140b07268: push rsi
140b07269: push rdi
140b0726a: push rbp
140b0726b: push rbx
140b0726c: sub rsp, 0x358
140b07273: movaps xmmword ptr [rsp + 0x340], xmm15
140b0727c: movaps xmmword ptr [rsp + 0x330], xmm14
140b07285: movaps xmmword ptr [rsp + 0x320], xmm13
140b0728e: movaps xmmword ptr [rsp + 0x310], xmm12
140b07297: movaps xmmword ptr [rsp + 0x300], xmm11
140b072a0: movaps xmmword ptr [rsp + 0x2f0], xmm10
140b072a9: movaps xmmword ptr [rsp + 0x2e0], xmm9
140b072b2: movaps xmmword ptr [rsp + 0x2d0], xmm8
140b072bb: movaps xmmword ptr [rsp + 0x2c0], xmm7
140b072c3: movaps xmmword ptr [rsp + 0x2b0], xmm6
140b072cb: mov rax, rdx
140b072ce: mov r14, qword ptr [rsp + 0x3f8]
140b072d6: mov rsi, qword ptr [rsp + 0x3f0]
140b072de: mov rdx, qword ptr [rsp + 0x3e8]
140b072e6: mov rcx, qword ptr [rsp + 0x3e0]
140b072ee: mov r10, qword ptr [rsp + 0x3d8]
140b072f6: mov r11, qword ptr [rsp + 0x3d0]
140b072fe: mov rdi, qword ptr [rsp + 0x3c8]
140b07306: mov rbx, qword ptr [rsp + 0x3c0]
140b0730e: movups xmm0, xmmword ptr [rax]
140b07311: movups xmm1, xmmword ptr [rax + 0x10]
140b07315: movaps xmmword ptr [rsp + 0x100], xmm1
140b0731d: movaps xmmword ptr [rsp + 0xf0], xmm0
140b07325: movups xmm0, xmmword ptr [r8]
140b07329: movups xmm1, xmmword ptr [r8 + 0x10]
140b0732e: movups xmmword ptr [rsp + 0x298], xmm1
140b07336: movups xmmword ptr [rsp + 0x288], xmm0
140b0733e: movups xmm0, xmmword ptr [r9]
140b07342: movups xmm1, xmmword ptr [r9 + 0x10]
140b07347: movaps xmmword ptr [rsp + 0x120], xmm1
140b0734f: movaps xmmword ptr [rsp + 0x110], xmm0
140b07357: movups xmm0, xmmword ptr [rbx]
140b0735a: movups xmm1, xmmword ptr [rbx + 0x10]
140b0735e: movaps xmmword ptr [rsp + 0x140], xmm1
140b07366: movaps xmmword ptr [rsp + 0x130], xmm0
140b0736e: movups xmm0, xmmword ptr [rdi]
140b07371: movups xmm1, xmmword ptr [rdi + 0x10]
140b07375: movaps xmmword ptr [rsp + 0x160], xmm1
140b0737d: movaps xmmword ptr [rsp + 0x150], xmm0
140b07385: movups xmm0, xmmword ptr [r11]
140b07389: movaps xmmword ptr [rsp + 0x170], xmm0
140b07391: mov rax, qword ptr [r11 + 0x10]
140b07395: mov qword ptr [rsp + 0x180], rax
140b0739d: movups xmm0, xmmword ptr [r10]
140b073a1: movups xmm1, xmmword ptr [r10 + 0x10]
140b073a6: movups xmmword ptr [rsp + 0x188], xmm0
140b073ae: movups xmmword ptr [rsp + 0x198], xmm1
140b073b6: movups xmm0, xmmword ptr [rcx]
140b073b9: movups xmm1, xmmword ptr [rcx + 0x10]
140b073bd: movups xmmword ptr [rsp + 0x1a8], xmm0
140b073c5: movups xmmword ptr [rsp + 0x1b8], xmm1
140b073cd: lea r15, [rsp + 0x1c8]
140b073d5: mov r8d, 0xa8
140b073db: mov rcx, r15
140b073de: call 0x145bc977b
140b073e3: movups xmm0, xmmword ptr [rsi]
140b073e6: movaps xmmword ptr [rsp + 0x270], xmm0
140b073ee: mov rax, qword ptr [rsi + 0x10]
140b073f2: mov qword ptr [rsp + 0x280], rax
140b073fa: mov qword ptr [rsp + 0x2a8], r14
140b07402: mov r9, qword ptr [rsp + 0x270]
140b0740a: mov rax, qword ptr [rsp + 0x278]
140b07412: mov rdx, qword ptr [r9 + 0xf8]
140b07419: mov r11, qword ptr [r9 + 0x100]
140b07420: lea rcx, [rdx + r11*4]
140b07424: movzx r8d, byte ptr [r9 + 0x108]
140b0742c: shl r11, 2
140b07430: test r8b, r8b
140b07433: je 0x140b074a0
140b07435: nop word ptr cs:[rax + rax]
140b07440: test r11, r11
140b07443: je 0x140b07530
140b07449: mov r10d, dword ptr [rdx]
140b0744c: add rdx, 4
140b07450: mov rsi, qword ptr [rax + 0x1a8]
140b07457: lea rdi, [r10 + r10*8]
140b0745b: mov r10, qword ptr [rsi + rdi*8 + 0x10]
140b07460: add r11, -4
140b07464: test r10, r10
140b07467: je 0x140b07440
140b07469: lea r11, [rsi + rdi*8]
140b0746d: mov r9, qword ptr [r9 + 0x110]
140b07474: mov rsi, qword ptr [r11 + 0x18]
140b07478: mov r11, qword ptr [r11 + 0x38]
140b0747c: mov r9, qword ptr [r11 + r9*8]
140b07480: not r9
140b07483: lea r9, [r9 + r9*2]
140b07487: shl r9, 4
140b0748b: mov rdi, qword ptr [rsi + r9 + 0x10]
140b07490: mov rbp, qword ptr [rsi + r9 + 0x28]
140b07495: jmp 0x140b07529
140b0749a: nop word ptr [rax + rax]
140b074a0: test r11, r11
140b074a3: je 0x140b07530
140b074a9: mov r10d, dword ptr [rdx]
140b074ac: add rdx, 4
140b074b0: mov rsi, qword ptr [rax + 0x108]
140b074b7: lea rdi, [r10 + r10*4]
140b074bb: shl rdi, 5
140b074bf: mov r10, qword ptr [rsi + rdi + 0x58]
140b074c4: add r11, -4
140b074c8: test r10, r10
140b074cb: je 0x140b074a0
140b074cd: add rsi, rdi
140b074d0: mov r11d, dword ptr [rsi + 0x94]
140b074d7: mov rdi, qword ptr [rax + 0x1a8]
140b074de: lea r11, [r11 + r11*8]
140b074e2: mov r9, qword ptr [r9 + 0x110]
140b074e9: mov rbx, qword ptr [rdi + r11*8 + 0x18]
140b074ee: mov r11, qword ptr [rdi + r11*8 + 0x38]
140b074f3: mov r9, qword ptr [r11 + r9*8]
140b074f7: not r9
140b074fa: lea r9, [r9 + r9*2]
140b074fe: shl r9, 4
140b07502: mov r11, qword ptr [rsi + 0x50]
140b07506: mov ebp, dword ptr [r11 + 8]
140b0750a: not ebp
140b0750c: lea rdi, [rbp*2]
140b07514: add rdi, rbp
140b07517: shl rdi, 4
140b0751b: add rdi, qword ptr [rbx + r9 + 0x10]
140b07520: shl rbp, 2
140b07524: add rbp, qword ptr [rbx + r9 + 0x28]
140b07529: mov esi, 1
140b0752e: jmp 0x140b0753a
140b07530: xor r10d, r10d
140b07533: mov rdx, rcx
140b07536: xor esi, esi
140b07538: xor edi, edi
140b0753a: mov r12, qword ptr [rsp + 0xf0]
140b07542: mov r11, qword ptr [rsp + 0x110]
140b0754a: mov r9, qword ptr [rsp + 0x288]
140b07552: mov r13, qword ptr [rsp + 0x130]
140b0755a: mov ebx, dword ptr [rsp + 0x284]
140b07561: test r8b, r8b
140b07564: je 0x140b07594
140b07566: cmp esi, r10d
140b07569: jne 0x140b07c05
140b0756f: nop
140b07570: cmp rdx, rcx
140b07573: je 0x140b075c8
140b07575: mov r8d, dword ptr [rdx]
140b07578: add rdx, 4
140b0757c: mov r10, qword ptr [rax + 0x1a8]
140b07583: lea r8, [r8 + r8*8]
140b07587: cmp qword ptr [r10 + r8*8 + 0x10], 0
140b0758d: je 0x140b07570
140b0758f: jmp 0x140b07c05
140b07594: cmp esi, r10d
140b07597: jne 0x140b07c05
140b0759d: nop dword ptr [rax]
140b075a0: cmp rdx, rcx
140b075a3: je 0x140b075c8
140b075a5: mov r8d, dword ptr [rdx]
140b075a8: add rdx, 4
140b075ac: mov r10, qword ptr [rax + 0x108]
140b075b3: lea r8, [r8 + r8*4]
140b075b7: shl r8, 5
140b075bb: cmp qword ptr [r10 + r8 + 0x58], 0
140b075c1: je 0x140b075a0
140b075c3: jmp 0x140b07c05
140b075c8: test rdi, rdi
140b075cb: je 0x140b07c05
140b075d1: lea rax, [rsp + 0x150]
140b075d9: lea rsi, [rsp + 0x170]
140b075e1: lea rcx, [rsp + 0x188]
140b075e9: lea rdx, [rsp + 0x1a8]
140b075f1: movss xmm6, dword ptr [r12 + 0x58]
140b075f8: movss xmm9, dword ptr [rdi + 0x18]
140b075fe: movsd xmm10, qword ptr [r11 + 0x70]
140b07604: movss xmm0, dword ptr [r13 + 0x4c]
140b0760a: movsldup xmm12, xmm0
140b0760f: mulps xmm12, xmmword ptr [rip + 0x5265ce9]
140b07617: addps xmm10, xmm12
140b0761b: addss xmm12, dword ptr [r11 + 0x78]
140b07621: movlps qword ptr [rsp + 0x80], xmm10
140b0762a: movss dword ptr [rsp + 0x88], xmm12
140b07634: movsd xmm11, qword ptr [rdi + 0x10]
140b0763a: subps xmm11, xmm10
140b0763e: movshdup xmm7, xmm11
140b07643: subss xmm9, xmm12
140b07648: movaps xmm0, xmm11
140b0764c: mulss xmm0, xmm11
140b07651: movaps xmm2, xmm7
140b07654: mulss xmm2, xmm7
140b07658: addss xmm2, xmm0
140b0765c: movaps xmm1, xmm9
140b07660: mulss xmm1, xmm9
140b07665: addss xmm2, xmm1
140b07669: sqrtss xmm8, xmm2
140b0766e: movss dword ptr [rsp + 0x48], xmm8
140b07675: movss dword ptr [rsp + 0xa4], xmm11
140b0767f: mov dword ptr [rsp + 0xa8], 0
140b0768a: movss dword ptr [rsp + 0xac], xmm9
140b07694: mov qword ptr [rsp + 0xc8], rcx
140b0769c: mov qword ptr [rsp + 0xd0], rdx
140b076a4: mov qword ptr [rsp + 0xd8], rax
140b076ac: mov qword ptr [rsp + 0xe0], rsi
140b076b4: lea rax, [rsp + 0xc8]
140b076bc: mov qword ptr [rsp + 0xe8], rax
140b076c4: test r9, r9
140b076c7: je 0x140b07bfe
140b076cd: cmp dword ptr [r9], 0xbd
140b076d4: jne 0x140b07bfe
140b076da: ucomiss xmm8, dword ptr [rip + 0x5265d4a]
140b076e2: jb 0x140b07bfe
140b076e8: addss xmm0, xmm1
140b076ec: sqrtss xmm0, xmm0
140b076f0: ucomiss xmm0, dword ptr [rip + 0x52695bd]
140b076f7: jbe 0x140b07bfe
140b076fd: mov r13, qword ptr [rsp + 0x150]
140b07705: mov rcx, qword ptr [rsp + 0x188]
140b0770d: mov rdx, qword ptr [rsp + 0x1a8]
140b07715: mov eax, dword ptr [rsp + 0x88]
140b0771c: mov dword ptr [rsp + 0x58], eax
140b07720: mov rax, qword ptr [rsp + 0x80]
140b07728: mov qword ptr [rsp + 0x50], rax
140b0772d: lea r8, [rsp + 0x50]
140b07732: mov qword ptr [rsp + 0x78], rcx
140b07737: mov qword ptr [rsp + 0x40], rdx
140b0773c: call 0x1418e5a00
140b07741: movss dword ptr [rsp + 0x20], xmm0
140b07747: lea r12, [rsp + 0x80]
140b0774f: mov rcx, r12
140b07752: mov rdx, r13
140b07755: mov r8, rsi
140b07758: mov r9d, eax
140b0775b: call 0x140acaca0
140b07760: test al, al
140b07762: je 0x140b07bfe
140b07768: mov qword ptr [rsp + 0x90], r13
140b07770: lea r13, [rdi + 0x10]
140b07774: divss xmm7, xmm8
140b07779: movaps xmm0, xmm7
140b0777c: call 0x145bc9829
140b07781: movaps xmm8, xmm0
140b07785: movss dword ptr [rsp + 0x4c], xmm0
140b0778b: lea rax, [rsp + 0xa4]
140b07793: mov qword ptr [rsp + 0x98], rax
140b0779b: xorps xmm7, xmm7
140b0779e: ucomiss xmm0, dword ptr [rip + 0x544731b]
140b077a5: jae 0x140b07937
140b077ab: mov eax, dword ptr [r13 + 8]
140b077af: mov dword ptr [rsp + 0x30], eax
140b077b3: mov rax, qword ptr [r13]
140b077b7: mov qword ptr [rsp + 0x28], rax
140b077bc: mov eax, dword ptr [r13 + 8]
140b077c0: mov dword ptr [rsp + 0x58], eax
140b077c4: mov rax, qword ptr [r13]
140b077c8: mov qword ptr [rsp + 0x50], rax
140b077cd: lea r13, [rsp + 0x50]
140b077d2: mov rcx, qword ptr [rsp + 0x78]
140b077d7: mov rdx, qword ptr [rsp + 0x40]
140b077dc: mov r8, r13
140b077df: call 0x1418e5a00
140b077e4: movss dword ptr [rsp + 0x20], xmm0
140b077ea: lea rcx, [rsp + 0x28]
140b077ef: mov rdx, qword ptr [rsp + 0x90]
140b077f7: mov r8, rsi
140b077fa: mov r9d, eax
140b077fd: call 0x140acaca0
140b07802: test al, al
140b07804: jne 0x140b07937
140b0780a: mov qword ptr [rsp + 0x50], r12
140b0780f: lea rax, [rsp + 0x98]
140b07817: mov qword ptr [rsp + 0x58], rax
140b0781c: lea rax, [rsp + 0x48]
140b07821: mov qword ptr [rsp + 0x60], rax
140b07826: lea rax, [rsp + 0xd8]
140b0782e: mov qword ptr [rsp + 0x68], rax
140b07833: mov qword ptr [rsp + 0x70], r15
140b07838: movabs rax, 0xa00000001
140b07842: mov qword ptr [rsp + 0xb8], rax
140b0784a: mov byte ptr [rsp + 0xc0], 0
140b07852: lea rax, [rsp + 0x4c]
140b07857: mov qword ptr [rsp + 0xb0], rax
140b0785f: mov qword ptr [rsp + 0x28], r13
140b07864: mov qword ptr [rsp + 0x30], rax
140b07869: lea rax, [rsp + 0xb0]
140b07871: mov qword ptr [rsp + 0x38], rax
140b07876: lea rcx, [rsp + 0x28]
140b0787b: mov edx, 1
140b07880: call 0x140ab2310
140b07885: test al, 1
140b07887: jne 0x140b0792d
140b0788d: lea rcx, [rsp + 0x28]
140b07892: mov edx, 2
140b07897: call 0x140ab2310
140b0789c: test al, 1
140b0789e: jne 0x140b0792d
140b078a4: lea rcx, [rsp + 0x28]
140b078a9: mov edx, 3
140b078ae: call 0x140ab2310
140b078b3: test al, 1
140b078b5: jne 0x140b0792d
140b078b7: lea rcx, [rsp + 0x28]
140b078bc: mov edx, 4
140b078c1: call 0x140ab2310
140b078c6: test al, 1
140b078c8: jne 0x140b0792d
140b078ca: lea rcx, [rsp + 0x28]
140b078cf: mov edx, 5
140b078d4: call 0x140ab2310
140b078d9: test al, 1
140b078db: jne 0x140b0792d
140b078dd: lea rcx, [rsp + 0x28]
140b078e2: mov edx, 6
140b078e7: call 0x140ab2310
140b078ec: test al, 1
140b078ee: jne 0x140b0792d
140b078f0: lea rcx, [rsp + 0x28]
140b078f5: mov edx, 7
140b078fa: call 0x140ab2310
140b078ff: test al, 1
140b07901: jne 0x140b0792d
140b07903: lea rcx, [rsp + 0x28]
140b07908: mov edx, 8
140b0790d: call 0x140ab2310
140b07912: test al, 1
140b07914: jne 0x140b0792d
140b07916: lea rcx, [rsp + 0x28]
140b0791b: mov edx, 9
140b07920: call 0x140ab2310
140b07925: test al, 1
140b07927: je 0x140b08082
140b0792d: movaps xmm7, xmm0
140b07930: movss xmm8, dword ptr [rsp + 0x4c]
140b07937: movss xmm14, dword ptr [r14]
140b0793c: xor eax, eax
140b0793e: ucomiss xmm7, xmm14
140b07942: seta al
140b07945: subss xmm7, xmm14
140b0794a: lea rcx, [rip + 0x54475cf]
140b07951: mulss xmm6, dword ptr [rcx + rax*4]
140b07956: movaps xmm0, xmm6
140b07959: call 0x145bc97cf
140b0795e: movss xmm13, dword ptr [rip + 0x5265a05]
140b07967: movaps xmm6, xmm13
140b0796b: subss xmm6, xmm0
140b0796f: mulss xmm6, xmm7
140b07973: addss xmm6, xmm14
140b07978: movss dword ptr [r14], xmm6
140b0797d: movss xmm0, dword ptr [rip + 0x53ea2c3]
140b07985: ucomiss xmm0, xmm6
140b07988: mov r13, qword ptr [rsp + 0x90]
140b07990: mov r12, qword ptr [rsp + 0x40]
140b07995: jbe 0x140b079f3
140b07997: lea rcx, [rdi + 0x10]
140b0799b: mov eax, dword ptr [rcx + 8]
140b0799e: mov dword ptr [rsp + 0x30], eax
140b079a2: mov rax, qword ptr [rcx]
140b079a5: mov qword ptr [rsp + 0x28], rax
140b079aa: mov eax, dword ptr [rcx + 8]
140b079ad: mov dword ptr [rsp + 0x58], eax
140b079b1: mov rax, qword ptr [rcx]
140b079b4: mov qword ptr [rsp + 0x50], rax
140b079b9: lea r8, [rsp + 0x50]
140b079be: mov rcx, qword ptr [rsp + 0x78]
140b079c3: mov rdx, r12
140b079c6: call 0x1418e5a00
140b079cb: movss dword ptr [rsp + 0x20], xmm0
140b079d1: lea rcx, [rsp + 0x28]
140b079d6: mov rdx, r13
140b079d9: mov r8, rsi
140b079dc: mov r9d, eax
140b079df: call 0x140acaca0
140b079e4: test al, al
140b079e6: jne 0x140b07c05
140b079ec: movss xmm8, dword ptr [rsp + 0x4c]
140b079f3: addss xmm6, xmm8
140b079f8: maxss xmm8, dword ptr [rip + 0x54470bf]
140b07a01: minss xmm6, xmm8
140b07a06: mov r14, qword ptr [rsp + 0x98]
140b07a0e: movss xmm7, dword ptr [r14 + 8]
140b07a14: movaps xmm14, xmm7
140b07a18: mulss xmm14, xmm7
140b07a1d: movaps xmm0, xmm6
140b07a20: call 0x145bc97c3
140b07a25: movss xmm8, dword ptr [rsp + 0x48]
140b07a2c: movsd xmm1, qword ptr [r14]
140b07a31: movaps xmm2, xmm1
140b07a34: mulps xmm2, xmm1
140b07a37: movshdup xmm3, xmm2
140b07a3b: addss xmm3, xmm2
140b07a3f: addss xmm3, xmm14
140b07a44: xorps xmm2, xmm2
140b07a47: sqrtss xmm2, xmm3
140b07a4b: divss xmm13, xmm2
140b07a50: movsldup xmm2, xmm13
140b07a55: mulps xmm2, xmm1
140b07a58: mulss xmm13, xmm7
140b07a5d: movsldup xmm7, xmm0
140b07a61: mulps xmm7, xmm2
140b07a64: mulss xmm13, xmm0
140b07a69: movaps xmm0, xmm6
140b07a6c: call 0x145bc97bd
140b07a71: movsldup xmm6, xmm0
140b07a75: mulps xmm6, xmmword ptr [rip + 0x5265884]
140b07a7c: addps xmm7, xmm6
140b07a7f: addss xmm6, xmm13
140b07a84: movlps qword ptr [rsp + 0xb0], xmm7
140b07a8c: movss dword ptr [rsp + 0xb8], xmm6
140b07a95: movsldup xmm0, xmm8
140b07a9a: mulss xmm8, xmm6
140b07a9f: mulps xmm0, xmm7
140b07aa2: movlps qword ptr [rsp + 0x28], xmm0
140b07aa7: movss dword ptr [rsp + 0x30], xmm8
140b07aae: mov rax, qword ptr [rsp + 0x80]
140b07ab6: mov qword ptr [rsp + 0x50], rax
140b07abb: mov eax, dword ptr [rsp + 0x88]
140b07ac2: mov dword ptr [rsp + 0x58], eax
140b07ac6: lea rdx, [rsp + 0x50]
140b07acb: lea r8, [rsp + 0x28]
140b07ad0: mov rcx, r15
140b07ad3: xor r9d, r9d
140b07ad6: call 0x141898ff0
140b07adb: movss xmm8, dword ptr [rsp + 0x48]
140b07ae2: test al, 1
140b07ae4: je 0x140b07b04
140b07ae6: movaps xmm1, xmm0
140b07ae9: minss xmm1, xmm8
140b07aee: movaps xmm8, xmm1
140b07af2: cmpunordss xmm8, xmm1
140b07af8: andps xmm0, xmm8
140b07afc: andnps xmm8, xmm1
140b07b00: orps xmm8, xmm0
140b07b04: mov r14, qword ptr [rsp + 0x78]
140b07b09: movsldup xmm13, xmm8
140b07b0e: mulps xmm13, xmm7
140b07b12: movaps xmm14, xmm6
140b07b16: mulss xmm14, xmm8
140b07b1b: addps xmm13, xmm10
140b07b1f: addss xmm14, xmm12
140b07b24: movlps qword ptr [rsp + 0x28], xmm13
140b07b2a: movss dword ptr [rsp + 0x30], xmm14
140b07b31: mov eax, dword ptr [rsp + 0x30]
140b07b35: mov dword ptr [rsp + 0x58], eax
140b07b39: mov rax, qword ptr [rsp + 0x28]
140b07b3e: mov qword ptr [rsp + 0x50], rax
140b07b43: lea r8, [rsp + 0x50]
140b07b48: mov rcx, r14
140b07b4b: mov rdx, r12
140b07b4e: call 0x1418e5a00
140b07b53: movss dword ptr [rsp + 0x20], xmm0
140b07b59: lea rcx, [rsp + 0x28]
140b07b5e: mov rdx, r13
140b07b61: mov r8, rsi
140b07b64: mov r9d, eax
140b07b67: call 0x140acaca0
140b07b6c: test al, al
140b07b6e: jne 0x140b07fd8
140b07b74: xorps xmm13, xmm13
140b07b78: movaps xmm15, xmm8
140b07b7c: addss xmm15, xmm13
140b07b81: movss xmm14, dword ptr [rip + 0x5265bca]
140b07b8a: mulss xmm15, xmm14
140b07b8f: movaps xmm0, xmm6
140b07b92: mulss xmm0, xmm15
140b07b97: addss xmm0, xmm12
140b07b9c: movsldup xmm1, xmm15
140b07ba1: mulps xmm1, xmm7
140b07ba4: addps xmm1, xmm10
140b07ba8: movlps qword ptr [rsp + 0x28], xmm1
140b07bad: movss dword ptr [rsp + 0x30], xmm0
140b07bb3: mov eax, dword ptr [rsp + 0x30]
140b07bb7: mov dword ptr [rsp + 0x58], eax
140b07bbb: mov rax, qword ptr [rsp + 0x28]
140b07bc0: mov qword ptr [rsp + 0x50], rax
140b07bc5: lea r15, [rsp + 0x50]
140b07bca: mov rcx, r14
140b07bcd: mov rdx, r12
140b07bd0: mov r8, r15
140b07bd3: call 0x1418e5a00
140b07bd8: movss dword ptr [rsp + 0x20], xmm0
140b07bde: lea r12, [rsp + 0x28]
140b07be3: mov rcx, r12
140b07be6: mov rdx, r13
140b07be9: mov r8, rsi
140b07bec: mov r9d, eax
140b07bef: call 0x140acaca0
140b07bf4: test al, al
140b07bf6: jne 0x140b07c71
140b07bf8: movaps xmm8, xmm15
140b07bfc: jmp 0x140b07c75
140b07bfe: mov dword ptr [r14], 0
140b07c05: movaps xmm6, xmmword ptr [rsp + 0x2b0]
140b07c0d: movaps xmm7, xmmword ptr [rsp + 0x2c0]
140b07c15: movaps xmm8, xmmword ptr [rsp + 0x2d0]
140b07c1e: movaps xmm9, xmmword ptr [rsp + 0x2e0]
140b07c27: movaps xmm10, xmmword ptr [rsp + 0x2f0]
140b07c30: movaps xmm11, xmmword ptr [rsp + 0x300]
140b07c39: movaps xmm12, xmmword ptr [rsp + 0x310]
140b07c42: movaps xmm13, xmmword ptr [rsp + 0x320]
140b07c4b: movaps xmm14, xmmword ptr [rsp + 0x330]
140b07c54: movaps xmm15, xmmword ptr [rsp + 0x340]
140b07c5d: add rsp, 0x358
140b07c64: pop rbx
140b07c65: pop rbp
140b07c66: pop rdi
140b07c67: pop rsi
140b07c68: pop r12
140b07c6a: pop r13
140b07c6c: pop r14
140b07c6e: pop r15
140b07c70: ret
140b07c71: movaps xmm13, xmm15
140b07c75: movaps xmm15, xmm8
140b07c79: addss xmm15, xmm13
140b07c7e: mulss xmm15, xmm14
140b07c83: movaps xmm0, xmm6
140b07c86: mulss xmm0, xmm15
140b07c8b: addss xmm0, xmm12
140b07c90: movsldup xmm1, xmm15
140b07c95: mulps xmm1, xmm7
140b07c98: addps xmm1, xmm10
140b07c9c: movlps qword ptr [rsp + 0x28], xmm1
140b07ca1: movss dword ptr [rsp + 0x30], xmm0
140b07ca7: mov eax, dword ptr [rsp + 0x30]
140b07cab: mov dword ptr [rsp + 0x58], eax
140b07caf: mov rax, qword ptr [rsp + 0x28]
140b07cb4: mov qword ptr [rsp + 0x50], rax
140b07cb9: mov rcx, r14
140b07cbc: mov rdx, qword ptr [rsp + 0x40]
140b07cc1: mov r8, r15
140b07cc4: call 0x1418e5a00
140b07cc9: movss dword ptr [rsp + 0x20], xmm0
140b07ccf: mov rcx, r12
140b07cd2: mov rdx, r13
140b07cd5: mov r8, rsi
140b07cd8: mov r9d, eax
140b07cdb: call 0x140acaca0
140b07ce0: test al, al
140b07ce2: jne 0x140b07cea
140b07ce4: movaps xmm8, xmm15
140b07ce8: jmp 0x140b07cee
140b07cea: movaps xmm13, xmm15
140b07cee: movaps xmm15, xmm8
140b07cf2: addss xmm15, xmm13
140b07cf7: mulss xmm15, xmm14
140b07cfc: movaps xmm0, xmm6
140b07cff: mulss xmm0, xmm15
140b07d04: addss xmm0, xmm12
140b07d09: movsldup xmm1, xmm15
140b07d0e: mulps xmm1, xmm7
140b07d11: addps xmm1, xmm10
140b07d15: movlps qword ptr [rsp + 0x28], xmm1
140b07d1a: movss dword ptr [rsp + 0x30], xmm0
140b07d20: mov eax, dword ptr [rsp + 0x30]
140b07d24: mov dword ptr [rsp + 0x58], eax
140b07d28: mov rax, qword ptr [rsp + 0x28]
140b07d2d: mov qword ptr [rsp + 0x50], rax
140b07d32: mov rcx, r14
140b07d35: mov rdx, qword ptr [rsp + 0x40]
140b07d3a: mov r8, r15
140b07d3d: call 0x1418e5a00
140b07d42: movss dword ptr [rsp + 0x20], xmm0
140b07d48: mov rcx, r12
140b07d4b: mov rdx, r13
140b07d4e: mov r8, rsi
140b07d51: mov r9d, eax
140b07d54: call 0x140acaca0
140b07d59: test al, al
140b07d5b: jne 0x140b07d63
140b07d5d: movaps xmm8, xmm15
140b07d61: jmp 0x140b07d67
140b07d63: movaps xmm13, xmm15
140b07d67: movaps xmm15, xmm8
140b07d6b: addss xmm15, xmm13
140b07d70: mulss xmm15, xmm14
140b07d75: movaps xmm0, xmm6
140b07d78: mulss xmm0, xmm15
140b07d7d: addss xmm0, xmm12
140b07d82: movsldup xmm1, xmm15
140b07d87: mulps xmm1, xmm7
140b07d8a: addps xmm1, xmm10
140b07d8e: movlps qword ptr [rsp + 0x28], xmm1
140b07d93: movss dword ptr [rsp + 0x30], xmm0
140b07d99: mov eax, dword ptr [rsp + 0x30]
140b07d9d: mov dword ptr [rsp + 0x58], eax
140b07da1: mov rax, qword ptr [rsp + 0x28]
140b07da6: mov qword ptr [rsp + 0x50], rax
140b07dab: mov rcx, r14
140b07dae: mov rdx, qword ptr [rsp + 0x40]
140b07db3: mov r8, r15
140b07db6: call 0x1418e5a00
140b07dbb: movss dword ptr [rsp + 0x20], xmm0
140b07dc1: mov rcx, r12
140b07dc4: mov rdx, r13
140b07dc7: mov r8, rsi
140b07dca: mov r9d, eax
140b07dcd: call 0x140acaca0
140b07dd2: test al, al
140b07dd4: jne 0x140b07ddc
140b07dd6: movaps xmm8, xmm15
140b07dda: jmp 0x140b07de0
140b07ddc: movaps xmm13, xmm15
140b07de0: movaps xmm15, xmm8
140b07de4: addss xmm15, xmm13
140b07de9: mulss xmm15, xmm14
140b07dee: movaps xmm0, xmm6
140b07df1: mulss xmm0, xmm15
140b07df6: addss xmm0, xmm12
140b07dfb: movsldup xmm1, xmm15
140b07e00: mulps xmm1, xmm7
140b07e03: addps xmm1, xmm10
140b07e07: movlps qword ptr [rsp + 0x28], xmm1
140b07e0c: movss dword ptr [rsp + 0x30], xmm0
140b07e12: mov eax, dword ptr [rsp + 0x30]
140b07e16: mov dword ptr [rsp + 0x58], eax
140b07e1a: mov rax, qword ptr [rsp + 0x28]
140b07e1f: mov qword ptr [rsp + 0x50], rax
140b07e24: mov rcx, r14
140b07e27: mov rdx, qword ptr [rsp + 0x40]
140b07e2c: mov r8, r15
140b07e2f: call 0x1418e5a00
140b07e34: movss dword ptr [rsp + 0x20], xmm0
140b07e3a: mov rcx, r12
140b07e3d: mov rdx, r13
140b07e40: mov r8, rsi
140b07e43: mov r9d, eax
140b07e46: call 0x140acaca0
140b07e4b: test al, al
140b07e4d: jne 0x140b07e55
140b07e4f: movaps xmm8, xmm15
140b07e53: jmp 0x140b07e59
140b07e55: movaps xmm13, xmm15
140b07e59: movaps xmm15, xmm8
140b07e5d: addss xmm15, xmm13
140b07e62: mulss xmm15, xmm14
140b07e67: movaps xmm0, xmm6
140b07e6a: mulss xmm0, xmm15
140b07e6f: addss xmm0, xmm12
140b07e74: movsldup xmm1, xmm15
140b07e79: mulps xmm1, xmm7
140b07e7c: addps xmm1, xmm10
140b07e80: movlps qword ptr [rsp + 0x28], xmm1
140b07e85: movss dword ptr [rsp + 0x30], xmm0
140b07e8b: mov eax, dword ptr [rsp + 0x30]
140b07e8f: mov dword ptr [rsp + 0x58], eax
140b07e93: mov rax, qword ptr [rsp + 0x28]
140b07e98: mov qword ptr [rsp + 0x50], rax
140b07e9d: mov rcx, r14
140b07ea0: mov rdx, qword ptr [rsp + 0x40]
140b07ea5: mov r8, r15
140b07ea8: call 0x1418e5a00
140b07ead: movss dword ptr [rsp + 0x20], xmm0
140b07eb3: mov rcx, r12
140b07eb6: mov rdx, r13
140b07eb9: mov r8, rsi
140b07ebc: mov r9d, eax
140b07ebf: call 0x140acaca0
140b07ec4: test al, al
140b07ec6: jne 0x140b07ece
140b07ec8: movaps xmm8, xmm15
140b07ecc: jmp 0x140b07ed2
140b07ece: movaps xmm13, xmm15
140b07ed2: movaps xmm15, xmm8
140b07ed6: addss xmm15, xmm13
140b07edb: mulss xmm15, xmm14
140b07ee0: movaps xmm0, xmm6
140b07ee3: mulss xmm0, xmm15
140b07ee8: addss xmm0, xmm12
140b07eed: movsldup xmm1, xmm15
140b07ef2: mulps xmm1, xmm7
140b07ef5: addps xmm1, xmm10
140b07ef9: movlps qword ptr [rsp + 0x28], xmm1
140b07efe: movss dword ptr [rsp + 0x30], xmm0
140b07f04: mov eax, dword ptr [rsp + 0x30]
140b07f08: mov dword ptr [rsp + 0x58], eax
140b07f0c: mov rax, qword ptr [rsp + 0x28]
140b07f11: mov qword ptr [rsp + 0x50], rax
140b07f16: mov rcx, r14
140b07f19: mov rdx, qword ptr [rsp + 0x40]
140b07f1e: mov r8, r15
140b07f21: call 0x1418e5a00
140b07f26: movss dword ptr [rsp + 0x20], xmm0
140b07f2c: mov rcx, r12
140b07f2f: mov rdx, r13
140b07f32: mov r8, rsi
140b07f35: mov r9d, eax
140b07f38: call 0x140acaca0
140b07f3d: test al, al
140b07f3f: jne 0x140b07f47
140b07f41: movaps xmm8, xmm15
140b07f45: jmp 0x140b07f4b
140b07f47: movaps xmm13, xmm15
140b07f4b: addss xmm8, xmm13
140b07f50: mulss xmm8, xmm14
140b07f55: movaps xmm0, xmm6
140b07f58: mulss xmm0, xmm8
140b07f5d: addss xmm0, xmm12
140b07f62: movsldup xmm1, xmm8
140b07f67: mulps xmm1, xmm7
140b07f6a: addps xmm1, xmm10
140b07f6e: movlps qword ptr [rsp + 0x28], xmm1
140b07f73: movss dword ptr [rsp + 0x30], xmm0
140b07f79: mov eax, dword ptr [rsp + 0x30]
140b07f7d: mov dword ptr [rsp + 0x58], eax
140b07f81: mov rax, qword ptr [rsp + 0x28]
140b07f86: mov qword ptr [rsp + 0x50], rax
140b07f8b: mov rcx, r14
140b07f8e: mov rdx, qword ptr [rsp + 0x40]
140b07f93: mov r8, r15
140b07f96: call 0x1418e5a00
140b07f9b: movss dword ptr [rsp + 0x20], xmm0
140b07fa1: mov rcx, r12
140b07fa4: mov rdx, r13
140b07fa7: mov r8, rsi
140b07faa: mov r9d, eax
140b07fad: call 0x140acaca0
140b07fb2: test al, al
140b07fb4: jne 0x140b07fba
140b07fb6: movaps xmm8, xmm13
140b07fba: movsldup xmm0, xmm8
140b07fbf: mulps xmm7, xmm0
140b07fc2: mulss xmm6, xmm8
140b07fc7: addps xmm10, xmm7
140b07fcb: addss xmm12, xmm6
140b07fd0: movaps xmm14, xmm12
140b07fd4: movaps xmm13, xmm10
140b07fd8: movss xmm0, dword ptr [rsp + 0x48]
140b07fde: divss xmm9, xmm0
140b07fe3: movsldup xmm0, xmm0
140b07fe7: divps xmm11, xmm0
140b07feb: movlps qword ptr [rsp + 0x28], xmm11
140b07ff1: movss dword ptr [rsp + 0x30], xmm9
140b07ff8: lea rcx, [rsp + 0x50]
140b07ffd: lea rdx, [rsp + 0x28]
140b08002: lea r8, [rsp + 0xb0]
140b0800a: call 0x144fe3290
140b0800f: movaps xmm1, xmmword ptr [rsp + 0x50]
140b08014: movaps xmm0, xmmword ptr [rdi]
140b08017: movaps xmm2, xmm1
140b0801a: shufps xmm2, xmm1, 0
140b0801e: movaps xmm3, xmm1
140b08021: shufps xmm3, xmm1, 0x55
140b08025: movaps xmm4, xmm1
140b08028: shufps xmm4, xmm1, 0xaa
140b0802c: shufps xmm1, xmm1, 0xff
140b08030: mulps xmm1, xmm0
140b08033: movaps xmm5, xmm0
140b08036: shufps xmm5, xmm0, 0x1b
140b0803a: mulps xmm5, xmm2
140b0803d: movaps xmm2, xmm0
140b08040: shufps xmm2, xmm0, 0x4e
140b08044: mulps xmm2, xmm3
140b08047: mulps xmm5, xmmword ptr [rip + 0x5375962]
140b0804e: addps xmm5, xmm1
140b08051: shufps xmm0, xmm0, 0xb1
140b08055: mulps xmm0, xmm4
140b08058: mulps xmm2, xmmword ptr [rip + 0x5375961]
140b0805f: mulps xmm0, xmmword ptr [rip + 0x537596a]
140b08066: addps xmm0, xmm2
140b08069: addps xmm0, xmm5
140b0806c: movaps xmmword ptr [rdi], xmm0
140b0806f: mov dword ptr [rbp], ebx
140b08072: movlps qword ptr [rdi + 0x10], xmm13
140b08077: movss dword ptr [rdi + 0x18], xmm14
140b0807d: jmp 0x140b07c05
140b08082: lea rcx, [rsp + 0x28]
140b08087: mov edx, 0xa
140b0808c: call 0x140ab2310
140b08091: movss xmm8, dword ptr [rsp + 0x4c]
140b08098: test al, 1
140b0809a: je 0x140b080a4
140b0809c: movaps xmm7, xmm0
140b0809f: jmp 0x140b07937
140b080a4: movss xmm7, dword ptr [rip + 0x5446a14]
140b080ac: subss xmm7, xmm8
140b080b1: jmp 0x140b07937

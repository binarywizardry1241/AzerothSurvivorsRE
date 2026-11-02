1459a4f80: 4157 push r15
1459a4f82: 4156 push r14
1459a4f84: 4155 push r13
1459a4f86: 4154 push r12
1459a4f88: 56 push rsi
1459a4f89: 57 push rdi
1459a4f8a: 55 push rbp
1459a4f8b: 53 push rbx
1459a4f8c: 4881ec18010000 sub rsp, 0x118
1459a4f93: 440f29bc2400010000 movaps xmmword ptr [rsp + 0x100], xmm15
1459a4f9c: 440f29b424f0000000 movaps xmmword ptr [rsp + 0xf0], xmm14
1459a4fa5: 440f29ac24e0000000 movaps xmmword ptr [rsp + 0xe0], xmm13
1459a4fae: 440f29a424d0000000 movaps xmmword ptr [rsp + 0xd0], xmm12
1459a4fb7: 440f299c24c0000000 movaps xmmword ptr [rsp + 0xc0], xmm11
1459a4fc0: 440f299424b0000000 movaps xmmword ptr [rsp + 0xb0], xmm10
1459a4fc9: 440f298c24a0000000 movaps xmmword ptr [rsp + 0xa0], xmm9
1459a4fd2: 440f29842490000000 movaps xmmword ptr [rsp + 0x90], xmm8
1459a4fdb: 0f29bc2480000000 movaps xmmword ptr [rsp + 0x80], xmm7
1459a4fe3: 0f29742470 movaps xmmword ptr [rsp + 0x70], xmm6
1459a4fe8: 0f28f3 movaps xmm6, xmm3
1459a4feb: 0f28fa movaps xmm7, xmm2
1459a4fee: 4889d7 mov rdi, rdx
1459a4ff1: 4989ce mov r14, rcx
1459a4ff4: f3440f10842480010000 movss xmm8, dword ptr [rsp + 0x180]
1459a4ffe: 410f28c0 movaps xmm0, xmm8
1459a5002: e8f4012600 call 0x145c051fb
1459a5007: f30f2cc0 cvttss2si eax, xmm0
1459a500b: 0f2e058e474e00 ucomiss xmm0, dword ptr [rip + 0x4e478e]
1459a5012: 41b8ffffff7f mov r8d, 0x7fffffff
1459a5018: 440f46c0 cmovbe r8d, eax
1459a501c: 31c0 xor eax, eax
1459a501e: 0f2ec0 ucomiss xmm0, xmm0
1459a5021: 440f4ac0 cmovp r8d, eax
1459a5025: 4489c6 mov esi, r8d
1459a5028: f7de neg esi
1459a502a: 4139f0 cmp r8d, esi
1459a502d: 0f8cd2070000 jl 0x1459a5805
1459a5033: f20f104720 movsd xmm0, qword ptr [rdi + 0x20]
1459a5038: 4c8b5f18 mov r11, qword ptr [rdi + 0x18]
1459a503c: 4d85db test r11, r11
1459a503f: 0f8442070000 je 0x1459a5787
1459a5045: 4c89742468 mov qword ptr [rsp + 0x68], r14
1459a504a: f3450f59c0 mulss xmm8, xmm8
1459a504f: 488b4708 mov rax, qword ptr [rdi + 8]
1459a5053: 4889442430 mov qword ptr [rsp + 0x30], rax
1459a5058: 488b4710 mov rax, qword ptr [rdi + 0x10]
1459a505c: 4889442428 mov qword ptr [rsp + 0x28], rax
1459a5061: f30f16c8 movshdup xmm1, xmm0
1459a5065: 0f28d7 movaps xmm2, xmm7
1459a5068: 0f14d6 unpcklps xmm2, xmm6
1459a506b: f30f101dddc84000 movss xmm3, dword ptr [rip + 0x40c8dd]
1459a5073: 0f57e4 xorps xmm4, xmm4
1459a5076: f30f102dd6c84000 movss xmm5, dword ptr [rip + 0x40c8d6]
1459a507e: 49c7c6ffffffff mov r14, 0xffffffffffffffff
1459a5085: 440f280d03104100 movaps xmm9, xmmword ptr [rip + 0x411003]
1459a508d: f3440f103de2724000 movss xmm15, dword ptr [rip + 0x4072e2]
1459a5096: 31ff xor edi, edi
1459a5098: 89f5 mov ebp, esi
1459a509a: 0f294c2440 movaps xmmword ptr [rsp + 0x40], xmm1
1459a509f: 90 nop
1459a50a0: 4531ed xor r13d, r13d
1459a50a3: 4439c5 cmp ebp, r8d
1459a50a6: 450f57d2 xorps xmm10, xmm10
1459a50aa: f3440f2ad5 cvtsi2ss xmm10, ebp
1459a50af: f3440f58d6 addss xmm10, xmm6
1459a50b4: f3440f5cd1 subss xmm10, xmm1
1459a50b9: f3490f2cc2 cvttss2si rax, xmm10
1459a50be: 410f9cc7 setl r15b
1459a50c2: 4889c1 mov rcx, rax
1459a50c5: 48c1f93f sar rcx, 0x3f
1459a50c9: 450f28da movaps xmm11, xmm10
1459a50cd: f3440f5cdb subss xmm11, xmm3
1459a50d2: f3490f2cd3 cvttss2si rdx, xmm11
1459a50d7: 4821ca and rdx, rcx
1459a50da: 4809c2 or rdx, rax
1459a50dd: 440f2ed4 ucomiss xmm10, xmm4
1459a50e1: bb00000000 mov ebx, 0
1459a50e6: 480f43da cmovae rbx, rdx
1459a50ea: 440f2ed5 ucomiss xmm10, xmm5
1459a50ee: 490f47de cmova rbx, r14
1459a50f2: 410f2ee2 ucomiss xmm4, xmm10
1459a50f6: 89f0 mov eax, esi
1459a50f8: 7626 jbe 0x1459a5120
1459a50fa: 660f1f440000 nop word ptr [rax + rax]
1459a5100: 31c9 xor ecx, ecx
1459a5102: 4439c0 cmp eax, r8d
1459a5105: 0f9cc2 setl dl
1459a5108: 0f8d42060000 jge 0x1459a5750
1459a510e: 88d1 mov cl, dl
1459a5110: 01c8 add eax, ecx
1459a5112: 4439c0 cmp eax, r8d
1459a5115: 7ee9 jle 0x1459a5100
1459a5117: e934060000 jmp 0x1459a5750
1459a511c: 0f1f4000 nop dword ptr [rax]
1459a5120: 89f0 mov eax, esi
1459a5122: 4c39db cmp rbx, r11
1459a5125: 0f8305060000 jae 0x1459a5730
1459a512b: 490fafdb imul rbx, r11
1459a512f: 4189f1 mov r9d, esi
1459a5132: 4589ca mov r10d, r9d
1459a5135: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a5140: 4531c9 xor r9d, r9d
1459a5143: 4539c2 cmp r10d, r8d
1459a5146: 410f9cc1 setl r9b
1459a514a: 4501d1 add r9d, r10d
1459a514d: 450f57d2 xorps xmm10, xmm10
1459a5151: f3450f2ad2 cvtsi2ss xmm10, r10d
1459a5156: f3440f58d7 addss xmm10, xmm7
1459a515b: f3440f5cd0 subss xmm10, xmm0
1459a5160: 410f2ee2 ucomiss xmm4, xmm10
1459a5164: 0f87e6000000 ja 0x1459a5250
1459a516a: f3490f2cc2 cvttss2si rax, xmm10
1459a516f: 4889c1 mov rcx, rax
1459a5172: 48c1f93f sar rcx, 0x3f
1459a5176: 450f28da movaps xmm11, xmm10
1459a517a: f3440f5cdb subss xmm11, xmm3
1459a517f: f3490f2cd3 cvttss2si rdx, xmm11
1459a5184: 4821ca and rdx, rcx
1459a5187: 4809c2 or rdx, rax
1459a518a: 440f2ed4 ucomiss xmm10, xmm4
1459a518e: b800000000 mov eax, 0
1459a5193: 480f43c2 cmovae rax, rdx
1459a5197: 440f2ed5 ucomiss xmm10, xmm5
1459a519b: 490f47c6 cmova rax, r14
1459a519f: 4c39d8 cmp rax, r11
1459a51a2: 0f83a8000000 jae 0x1459a5250
1459a51a8: 4801d8 add rax, rbx
1459a51ab: 4889c1 mov rcx, rax
1459a51ae: 4c09d9 or rcx, r11
1459a51b1: 48c1e920 shr rcx, 0x20
1459a51b5: 7434 je 0x1459a51eb
1459a51b7: 31d2 xor edx, edx
1459a51b9: 49f7f3 div r11
1459a51bc: 4885c0 test rax, rax
1459a51bf: 7834 js 0x1459a51f5
1459a51c1: 450f57d2 xorps xmm10, xmm10
1459a51c5: f34c0f2ad0 cvtsi2ss xmm10, rax
1459a51ca: 4885d2 test rdx, rdx
1459a51cd: 7945 jns 0x1459a5214
1459a51cf: 4889d0 mov rax, rdx
1459a51d2: 48d1e8 shr rax, 1
1459a51d5: 83e201 and edx, 1
1459a51d8: 4809c2 or rdx, rax
1459a51db: 450f57ed xorps xmm13, xmm13
1459a51df: f34c0f2aea cvtsi2ss xmm13, rdx
1459a51e4: f3450f58ed addss xmm13, xmm13
1459a51e9: eb32 jmp 0x1459a521d
1459a51eb: 31d2 xor edx, edx
1459a51ed: 41f7f3 div r11d
1459a51f0: 4885c0 test rax, rax
1459a51f3: 79cc jns 0x1459a51c1
1459a51f5: 4889c1 mov rcx, rax
1459a51f8: 48d1e9 shr rcx, 1
1459a51fb: 83e001 and eax, 1
1459a51fe: 4809c8 or rax, rcx
1459a5201: 450f57d2 xorps xmm10, xmm10
1459a5205: f34c0f2ad0 cvtsi2ss xmm10, rax
1459a520a: f3450f58d2 addss xmm10, xmm10
1459a520f: 4885d2 test rdx, rdx
1459a5212: 78bb js 0x1459a51cf
1459a5214: 450f57ed xorps xmm13, xmm13
1459a5218: f34c0f2aea cvtsi2ss xmm13, rdx
1459a521d: 450f14ea unpcklps xmm13, xmm10
1459a5221: 450f58e9 addps xmm13, xmm9
1459a5225: 440f58e8 addps xmm13, xmm0
1459a5229: 450f28d5 movaps xmm10, xmm13
1459a522d: 440f5cd2 subps xmm10, xmm2
1459a5231: 450f59d2 mulps xmm10, xmm10
1459a5235: f3450f16f2 movshdup xmm14, xmm10
1459a523a: 450f58f2 addps xmm14, xmm10
1459a523e: 450f2ef4 ucomiss xmm14, xmm12
1459a5242: 0f93c0 setae al
1459a5245: 450f2ef0 ucomiss xmm14, xmm8
1459a5249: 7705 ja 0x1459a5250
1459a524b: 4020f8 and al, dil
1459a524e: 7420 je 0x1459a5270
1459a5250: 4539c2 cmp r10d, r8d
1459a5253: 0f8df7040000 jge 0x1459a5750
1459a5259: 4589ca mov r10d, r9d
1459a525c: 4539c1 cmp r9d, r8d
1459a525f: 0f8edbfeffff jle 0x1459a5140
1459a5265: e9e6040000 jmp 0x1459a5750
1459a526a: 660f1f440000 nop word ptr [rax + rax]
1459a5270: 897c2424 mov dword ptr [rsp + 0x24], edi
1459a5274: 450f28d5 movaps xmm10, xmm13
1459a5278: f3450f58d7 addss xmm10, xmm15
1459a527d: f3440f5cd0 subss xmm10, xmm0
1459a5282: 410f2ee2 ucomiss xmm4, xmm10
1459a5286: 0f96442423 setbe byte ptr [rsp + 0x23]
1459a528b: f3490f2cd2 cvttss2si rdx, xmm10
1459a5290: 4889d7 mov rdi, rdx
1459a5293: 48c1ff3f sar rdi, 0x3f
1459a5297: 450f28da movaps xmm11, xmm10
1459a529b: f3440f5cdb subss xmm11, xmm3
1459a52a0: f3490f2ccb cvttss2si rcx, xmm11
1459a52a5: 4821f9 and rcx, rdi
1459a52a8: 4809d1 or rcx, rdx
1459a52ab: 440f2ed4 ucomiss xmm10, xmm4
1459a52af: ba00000000 mov edx, 0
1459a52b4: 480f42ca cmovb rcx, rdx
1459a52b8: 440f2ed5 ucomiss xmm10, xmm5
1459a52bc: 490f47ce cmova rcx, r14
1459a52c0: 450f28dd movaps xmm11, xmm13
1459a52c4: f3440f581da32f4000 addss xmm11, dword ptr [rip + 0x402fa3]
1459a52cd: 450f28d5 movaps xmm10, xmm13
1459a52d1: f3440f5cd0 subss xmm10, xmm0
1459a52d6: f3490f2cfa cvttss2si rdi, xmm10
1459a52db: 4989fc mov r12, rdi
1459a52de: 49c1fc3f sar r12, 0x3f
1459a52e2: 410f28cf movaps xmm1, xmm15
1459a52e6: 450f28fa movaps xmm15, xmm10
1459a52ea: f3440f5cfb subss xmm15, xmm3
1459a52ef: f3490f2cc7 cvttss2si rax, xmm15
1459a52f4: 4c21e0 and rax, r12
1459a52f7: 4809f8 or rax, rdi
1459a52fa: 440f2ed4 ucomiss xmm10, xmm4
1459a52fe: 480f42c2 cmovb rax, rdx
1459a5302: 440f2ed5 ucomiss xmm10, xmm5
1459a5306: 490f47c6 cmova rax, r14
1459a530a: 4889442438 mov qword ptr [rsp + 0x38], rax
1459a530f: f3440f5cd8 subss xmm11, xmm0
1459a5314: f3490f2cc3 cvttss2si rax, xmm11
1459a5319: 4989c4 mov r12, rax
1459a531c: 49c1fc3f sar r12, 0x3f
1459a5320: 450f28fb movaps xmm15, xmm11
1459a5324: f3440f5cfb subss xmm15, xmm3
1459a5329: f3490f2cff cvttss2si rdi, xmm15
1459a532e: 4c21e7 and rdi, r12
1459a5331: 4809c7 or rdi, rax
1459a5334: 440f2edc ucomiss xmm11, xmm4
1459a5338: 480f42fa cmovb rdi, rdx
1459a533c: 440f2edd ucomiss xmm11, xmm5
1459a5340: 490f47fe cmova rdi, r14
1459a5344: 4c39d9 cmp rcx, r11
1459a5347: 0f92c0 setb al
1459a534a: 84442423 test byte ptr [rsp + 0x23], al
1459a534e: 0f849b000000 je 0x1459a53ef
1459a5354: f3450f16cd movshdup xmm9, xmm13
1459a5359: 440f294c2450 movaps xmmword ptr [rsp + 0x50], xmm9
1459a535f: f3440f58c9 addss xmm9, xmm1
1459a5364: 0f284c2440 movaps xmm1, xmmword ptr [rsp + 0x40]
1459a5369: f3440f5cc9 subss xmm9, xmm1
1459a536e: 410f2ee1 ucomiss xmm4, xmm9
1459a5372: 0f96442423 setbe byte ptr [rsp + 0x23]
1459a5377: f3490f2cc1 cvttss2si rax, xmm9
1459a537c: 4989c4 mov r12, rax
1459a537f: 49c1fc3f sar r12, 0x3f
1459a5383: 450f28f9 movaps xmm15, xmm9
1459a5387: f3440f5cfb subss xmm15, xmm3
1459a538c: f3490f2cd7 cvttss2si rdx, xmm15
1459a5391: 4c21e2 and rdx, r12
1459a5394: 4809c2 or rdx, rax
1459a5397: 440f2ecc ucomiss xmm9, xmm4
1459a539b: b800000000 mov eax, 0
1459a53a0: 480f43c2 cmovae rax, rdx
1459a53a4: 440f2ecd ucomiss xmm9, xmm5
1459a53a8: 490f47c6 cmova rax, r14
1459a53ac: 4c39d8 cmp rax, r11
1459a53af: 410f92c4 setb r12b
1459a53b3: 4422642423 and r12b, byte ptr [rsp + 0x23]
1459a53b8: 410f2ee2 ucomiss xmm4, xmm10
1459a53bc: 7655 jbe 0x1459a5413
1459a53be: 4584e4 test r12b, r12b
1459a53c1: 0f845b020000 je 0x1459a5622
1459a53c7: 490fafc3 imul rax, r11
1459a53cb: 4801c8 add rax, rcx
1459a53ce: 483b442428 cmp rax, qword ptr [rsp + 0x28]
1459a53d3: 440f280db50c4100 movaps xmm9, xmmword ptr [rip + 0x410cb5]
1459a53db: f3440f103d946f4000 movss xmm15, dword ptr [rip + 0x406f94]
1459a53e4: 8b7c2424 mov edi, dword ptr [rsp + 0x24]
1459a53e8: 7212 jb 0x1459a53fc
1459a53ea: e98d040000 jmp 0x1459a587c
1459a53ef: 440f28f9 movaps xmm15, xmm1
1459a53f3: 0f284c2440 movaps xmm1, xmmword ptr [rsp + 0x40]
1459a53f8: 8b7c2424 mov edi, dword ptr [rsp + 0x24]
1459a53fc: 4539c2 cmp r10d, r8d
1459a53ff: 0f8d4b030000 jge 0x1459a5750
1459a5405: 4539c1 cmp r9d, r8d
1459a5408: 0f8e24fdffff jle 0x1459a5132
1459a540e: e93d030000 jmp 0x1459a5750
1459a5413: 4c395c2438 cmp qword ptr [rsp + 0x38], r11
1459a5418: 0f831a020000 jae 0x1459a5638
1459a541e: 410f2ee3 ucomiss xmm4, xmm11
1459a5422: 440f280d660c4100 movaps xmm9, xmmword ptr [rip + 0x410c66]
1459a542a: f3440f103d456f4000 movss xmm15, dword ptr [rip + 0x406f45]
1459a5433: 0f8734020000 ja 0x1459a566d
1459a5439: 4c39df cmp rdi, r11
1459a543c: 0f832b020000 jae 0x1459a566d
1459a5442: 4584e4 test r12b, r12b
1459a5445: 74b1 je 0x1459a53f8
1459a5447: 490fafc3 imul rax, r11
1459a544b: 4c8d2408 lea r12, [rax + rcx]
1459a544f: 4c3b642428 cmp r12, qword ptr [rsp + 0x28]
1459a5454: 0f831f040000 jae 0x1459a5879
1459a545a: 488b542430 mov rdx, qword ptr [rsp + 0x30]
1459a545f: 42803c2200 cmp byte ptr [rdx + r12], 0
1459a5464: 7592 jne 0x1459a53f8
1459a5466: 488b542438 mov rdx, qword ptr [rsp + 0x38]
1459a546b: 4c8d2410 lea r12, [rax + rdx]
1459a546f: 4c3b642428 cmp r12, qword ptr [rsp + 0x28]
1459a5474: 0f83ff030000 jae 0x1459a5879
1459a547a: 488b542430 mov rdx, qword ptr [rsp + 0x30]
1459a547f: 42803c2200 cmp byte ptr [rdx + r12], 0
1459a5484: 0f856effffff jne 0x1459a53f8
1459a548a: 4801f8 add rax, rdi
1459a548d: 483b442428 cmp rax, qword ptr [rsp + 0x28]
1459a5492: 0f83e4030000 jae 0x1459a587c
1459a5498: 488b542430 mov rdx, qword ptr [rsp + 0x30]
1459a549d: 803c0200 cmp byte ptr [rdx + rax], 0
1459a54a1: 0f8551ffffff jne 0x1459a53f8
1459a54a7: 440f284c2450 movaps xmm9, xmmword ptr [rsp + 0x50]
1459a54ad: f3440f5cc9 subss xmm9, xmm1
1459a54b2: 410f2ee1 ucomiss xmm4, xmm9
1459a54b6: 0f97442423 seta byte ptr [rsp + 0x23]
1459a54bb: f3490f2cd1 cvttss2si rdx, xmm9
1459a54c0: 4989d4 mov r12, rdx
1459a54c3: 49c1fc3f sar r12, 0x3f
1459a54c7: 450f28d1 movaps xmm10, xmm9
1459a54cb: f3440f5cd3 subss xmm10, xmm3
1459a54d0: f3490f2cc2 cvttss2si rax, xmm10
1459a54d5: 4c21e0 and rax, r12
1459a54d8: 4809d0 or rax, rdx
1459a54db: 440f2ecc ucomiss xmm9, xmm4
1459a54df: 41bc00000000 mov r12d, 0
1459a54e5: 4c0f43e0 cmovae r12, rax
1459a54e9: 440f2ecd ucomiss xmm9, xmm5
1459a54ed: 4d0f47e6 cmova r12, r14
1459a54f1: 4d39dc cmp r12, r11
1459a54f4: 0f93c0 setae al
1459a54f7: 0a442423 or al, byte ptr [rsp + 0x23]
1459a54fb: 0f85af010000 jne 0x1459a56b0
1459a5501: 4d0fafe3 imul r12, r11
1459a5505: 498d040c lea rax, [r12 + rcx]
1459a5509: 483b442428 cmp rax, qword ptr [rsp + 0x28]
1459a550e: 0f8368030000 jae 0x1459a587c
1459a5514: 488b542430 mov rdx, qword ptr [rsp + 0x30]
1459a5519: 803c0200 cmp byte ptr [rdx + rax], 0
1459a551d: 440f280d6b0b4100 movaps xmm9, xmmword ptr [rip + 0x410b6b]
1459a5525: 0f85cdfeffff jne 0x1459a53f8
1459a552b: 488b442438 mov rax, qword ptr [rsp + 0x38]
1459a5530: 4c01e0 add rax, r12
1459a5533: 483b442428 cmp rax, qword ptr [rsp + 0x28]
1459a5538: 0f833e030000 jae 0x1459a587c
1459a553e: 488b542430 mov rdx, qword ptr [rsp + 0x30]
1459a5543: 803c0200 cmp byte ptr [rdx + rax], 0
1459a5547: 0f85abfeffff jne 0x1459a53f8
1459a554d: 4901fc add r12, rdi
1459a5550: 4c3b642428 cmp r12, qword ptr [rsp + 0x28]
1459a5555: 0f831e030000 jae 0x1459a5879
1459a555b: 488b442430 mov rax, qword ptr [rsp + 0x30]
1459a5560: 42803c2000 cmp byte ptr [rax + r12], 0
1459a5565: 0f858dfeffff jne 0x1459a53f8
1459a556b: 440f284c2450 movaps xmm9, xmmword ptr [rsp + 0x50]
1459a5571: f3440f580df62c4000 addss xmm9, dword ptr [rip + 0x402cf6]
1459a557a: f3440f5cc9 subss xmm9, xmm1
1459a557f: 410f2ee1 ucomiss xmm4, xmm9
1459a5583: 0f96442423 setbe byte ptr [rsp + 0x23]
1459a5588: f3490f2cd1 cvttss2si rdx, xmm9
1459a558d: 4989d4 mov r12, rdx
1459a5590: 49c1fc3f sar r12, 0x3f
1459a5594: 450f28d1 movaps xmm10, xmm9
1459a5598: f3440f5cd3 subss xmm10, xmm3
1459a559d: f3490f2cc2 cvttss2si rax, xmm10
1459a55a2: 4c21e0 and rax, r12
1459a55a5: 4809d0 or rax, rdx
1459a55a8: 440f2ecc ucomiss xmm9, xmm4
1459a55ac: 41bc00000000 mov r12d, 0
1459a55b2: 4c0f43e0 cmovae r12, rax
1459a55b6: 440f2ecd ucomiss xmm9, xmm5
1459a55ba: 4d0f47e6 cmova r12, r14
1459a55be: 4d39dc cmp r12, r11
1459a55c1: 0f92c0 setb al
1459a55c4: 84442423 test byte ptr [rsp + 0x23], al
1459a55c8: 7442 je 0x1459a560c
1459a55ca: 4d0fafe3 imul r12, r11
1459a55ce: 4c01e1 add rcx, r12
1459a55d1: 483b4c2428 cmp rcx, qword ptr [rsp + 0x28]
1459a55d6: 0f83b6020000 jae 0x1459a5892
1459a55dc: 488b442430 mov rax, qword ptr [rsp + 0x30]
1459a55e1: 803c0800 cmp byte ptr [rax + rcx], 0
1459a55e5: 7525 jne 0x1459a560c
1459a55e7: 488b442438 mov rax, qword ptr [rsp + 0x38]
1459a55ec: 4c01e0 add rax, r12
1459a55ef: 4889c1 mov rcx, rax
1459a55f2: 483b442428 cmp rax, qword ptr [rsp + 0x28]
1459a55f7: 0f8395020000 jae 0x1459a5892
1459a55fd: 488b442430 mov rax, qword ptr [rsp + 0x30]
1459a5602: 803c0800 cmp byte ptr [rax + rcx], 0
1459a5606: 0f84b1000000 je 0x1459a56bd
1459a560c: 440f280d7c0a4100 movaps xmm9, xmmword ptr [rip + 0x410a7c]
1459a5614: f3440f103d5b6d4000 movss xmm15, dword ptr [rip + 0x406d5b]
1459a561d: e9d1fdffff jmp 0x1459a53f3
1459a5622: 440f280d660a4100 movaps xmm9, xmmword ptr [rip + 0x410a66]
1459a562a: f3440f103d456d4000 movss xmm15, dword ptr [rip + 0x406d45]
1459a5633: e9c0fdffff jmp 0x1459a53f8
1459a5638: 4584e4 test r12b, r12b
1459a563b: 440f280d4d0a4100 movaps xmm9, xmmword ptr [rip + 0x410a4d]
1459a5643: f3440f103d2c6d4000 movss xmm15, dword ptr [rip + 0x406d2c]
1459a564c: 0f84a6fdffff je 0x1459a53f8
1459a5652: 490fafc3 imul rax, r11
1459a5656: 4801c8 add rax, rcx
1459a5659: 483b442428 cmp rax, qword ptr [rsp + 0x28]
1459a565e: 8b7c2424 mov edi, dword ptr [rsp + 0x24]
1459a5662: 0f8294fdffff jb 0x1459a53fc
1459a5668: e90f020000 jmp 0x1459a587c
1459a566d: 4584e4 test r12b, r12b
1459a5670: 0f8482fdffff je 0x1459a53f8
1459a5676: 490fafc3 imul rax, r11
1459a567a: 4801c1 add rcx, rax
1459a567d: 483b4c2428 cmp rcx, qword ptr [rsp + 0x28]
1459a5682: 8b7c2424 mov edi, dword ptr [rsp + 0x24]
1459a5686: 0f83e8010000 jae 0x1459a5874
1459a568c: 488b542430 mov rdx, qword ptr [rsp + 0x30]
1459a5691: 803c0a00 cmp byte ptr [rdx + rcx], 0
1459a5695: 0f8561fdffff jne 0x1459a53fc
1459a569b: 4803442438 add rax, qword ptr [rsp + 0x38]
1459a56a0: 483b442428 cmp rax, qword ptr [rsp + 0x28]
1459a56a5: 0f8251fdffff jb 0x1459a53fc
1459a56ab: e9cc010000 jmp 0x1459a587c
1459a56b0: 440f280dd8094100 movaps xmm9, xmmword ptr [rip + 0x4109d8]
1459a56b8: e93bfdffff jmp 0x1459a53f8
1459a56bd: 4901fc add r12, rdi
1459a56c0: 4c3b642428 cmp r12, qword ptr [rsp + 0x28]
1459a56c5: 0f83da010000 jae 0x1459a58a5
1459a56cb: 488b442430 mov rax, qword ptr [rsp + 0x30]
1459a56d0: 42803c2000 cmp byte ptr [rax + r12], 0
1459a56d5: 440f280db3094100 movaps xmm9, xmmword ptr [rip + 0x4109b3]
1459a56dd: f3440f103d926c4000 movss xmm15, dword ptr [rip + 0x406c92]
1459a56e6: 0f284c2440 movaps xmm1, xmmword ptr [rsp + 0x40]
1459a56eb: 8b7c2424 mov edi, dword ptr [rsp + 0x24]
1459a56ef: 0f8507fdffff jne 0x1459a53fc
1459a56f5: 66440f7ee8 movd eax, xmm13
1459a56fa: 66440f6f542450 movdqa xmm10, xmmword ptr [rsp + 0x50]
1459a5701: 66440f7ed1 movd ecx, xmm10
1459a5706: 48c1e120 shl rcx, 0x20
1459a570a: 89c0 mov eax, eax
1459a570c: 4809c8 or rax, rcx
1459a570f: 4889442460 mov qword ptr [rsp + 0x60], rax
1459a5714: bf01000000 mov edi, 1
1459a5719: 450f28e6 movaps xmm12, xmm14
1459a571d: e9dafcffff jmp 0x1459a53fc
1459a5722: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a5730: 31c9 xor ecx, ecx
1459a5732: 4439c0 cmp eax, r8d
1459a5735: 0f9cc2 setl dl
1459a5738: 7d16 jge 0x1459a5750
1459a573a: 88d1 mov cl, dl
1459a573c: 01c8 add eax, ecx
1459a573e: 4439c0 cmp eax, r8d
1459a5741: 7eed jle 0x1459a5730
1459a5743: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a5750: 4439c5 cmp ebp, r8d
1459a5753: 7d0f jge 0x1459a5764
1459a5755: 4588fd mov r13b, r15b
1459a5758: 4401ed add ebp, r13d
1459a575b: 4439c5 cmp ebp, r8d
1459a575e: 0f8e3cf9ffff jle 0x1459a50a0
1459a5764: 31c0 xor eax, eax
1459a5766: 83ff01 cmp edi, 1
1459a5769: 4c8b742468 mov r14, qword ptr [rsp + 0x68]
1459a576e: 0f8591000000 jne 0x1459a5805
1459a5774: 488b442460 mov rax, qword ptr [rsp + 0x60]
1459a5779: 49894604 mov qword ptr [r14 + 4], rax
1459a577d: b801000000 mov eax, 1
1459a5782: e97e000000 jmp 0x1459a5805
1459a5787: f30f16c0 movshdup xmm0, xmm0
1459a578b: 0f57c9 xorps xmm1, xmm1
1459a578e: 89f1 mov ecx, esi
1459a5790: 31d2 xor edx, edx
1459a5792: 0f57d2 xorps xmm2, xmm2
1459a5795: f30f2ad1 cvtsi2ss xmm2, ecx
1459a5799: 4439c1 cmp ecx, r8d
1459a579c: 410f9cc1 setl r9b
1459a57a0: f30f58d6 addss xmm2, xmm6
1459a57a4: f30f5cd0 subss xmm2, xmm0
1459a57a8: 0f2eca ucomiss xmm1, xmm2
1459a57ab: 4189f2 mov r10d, esi
1459a57ae: 4189f3 mov r11d, esi
1459a57b1: 762d jbe 0x1459a57e0
1459a57b3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459a57c0: 4531db xor r11d, r11d
1459a57c3: 4539c2 cmp r10d, r8d
1459a57c6: 0f9cc3 setl bl
1459a57c9: 7d2b jge 0x1459a57f6
1459a57cb: 4188db mov r11b, bl
1459a57ce: 4501da add r10d, r11d
1459a57d1: 4539c2 cmp r10d, r8d
1459a57d4: 7eea jle 0x1459a57c0
1459a57d6: eb1e jmp 0x1459a57f6
1459a57d8: 0f1f840000000000 nop dword ptr [rax + rax]
1459a57e0: 4531d2 xor r10d, r10d
1459a57e3: 4539c3 cmp r11d, r8d
1459a57e6: 0f9cc3 setl bl
1459a57e9: 7d0b jge 0x1459a57f6
1459a57eb: 4188da mov r10b, bl
1459a57ee: 4501d3 add r11d, r10d
1459a57f1: 4539c3 cmp r11d, r8d
1459a57f4: 7eea jle 0x1459a57e0
1459a57f6: 4439c1 cmp ecx, r8d
1459a57f9: 7d0a jge 0x1459a5805
1459a57fb: 4488ca mov dl, r9b
1459a57fe: 01d1 add ecx, edx
1459a5800: 4439c1 cmp ecx, r8d
1459a5803: 7e8b jle 0x1459a5790
1459a5805: 418906 mov dword ptr [r14], eax
1459a5808: 4c89f0 mov rax, r14
1459a580b: 0f28742470 movaps xmm6, xmmword ptr [rsp + 0x70]
1459a5810: 0f28bc2480000000 movaps xmm7, xmmword ptr [rsp + 0x80]
1459a5818: 440f28842490000000 movaps xmm8, xmmword ptr [rsp + 0x90]
1459a5821: 440f288c24a0000000 movaps xmm9, xmmword ptr [rsp + 0xa0]
1459a582a: 440f289424b0000000 movaps xmm10, xmmword ptr [rsp + 0xb0]
1459a5833: 440f289c24c0000000 movaps xmm11, xmmword ptr [rsp + 0xc0]
1459a583c: 440f28a424d0000000 movaps xmm12, xmmword ptr [rsp + 0xd0]
1459a5845: 440f28ac24e0000000 movaps xmm13, xmmword ptr [rsp + 0xe0]
1459a584e: 440f28b424f0000000 movaps xmm14, xmmword ptr [rsp + 0xf0]
1459a5857: 440f28bc2400010000 movaps xmm15, xmmword ptr [rsp + 0x100]
1459a5860: 4881c418010000 add rsp, 0x118
1459a5867: 5b pop rbx
1459a5868: 5d pop rbp
1459a5869: 5f pop rdi
1459a586a: 5e pop rsi
1459a586b: 415c pop r12
1459a586d: 415d pop r13
1459a586f: 415e pop r14
1459a5871: 415f pop r15
1459a5873: c3 ret
1459a5874: 4889c8 mov rax, rcx
1459a5877: eb03 jmp 0x1459a587c
1459a5879: 4c89e0 mov rax, r12
1459a587c: 4c8d0585d88901 lea r8, [rip + 0x189d885]
1459a5883: 4889c1 mov rcx, rax
1459a5886: 488b542428 mov rdx, qword ptr [rsp + 0x28]
1459a588b: e8b3ed3f00 call 0x145da4643
1459a5890: 0f0b ud2
1459a5892: 4c8d056fd88901 lea r8, [rip + 0x189d86f]
1459a5899: 488b542428 mov rdx, qword ptr [rsp + 0x28]
1459a589e: e8a0ed3f00 call 0x145da4643
1459a58a3: 0f0b ud2
1459a58a5: 4c8d055cd88901 lea r8, [rip + 0x189d85c]
1459a58ac: 4c89e1 mov rcx, r12
1459a58af: 488b542428 mov rdx, qword ptr [rsp + 0x28]
1459a58b4: e88aed3f00 call 0x145da4643
1459a58b9: 0f0b ud2

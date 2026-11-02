1459a8280: 4157 push r15
1459a8282: 4156 push r14
1459a8284: 4155 push r13
1459a8286: 4154 push r12
1459a8288: 56 push rsi
1459a8289: 57 push rdi
1459a828a: 55 push rbp
1459a828b: 53 push rbx
1459a828c: 4881ecb8000000 sub rsp, 0xb8
1459a8293: 440f29ac24a0000000 movaps xmmword ptr [rsp + 0xa0], xmm13
1459a829c: 440f29a42490000000 movaps xmmword ptr [rsp + 0x90], xmm12
1459a82a5: 440f299c2480000000 movaps xmmword ptr [rsp + 0x80], xmm11
1459a82ae: 440f29542470 movaps xmmword ptr [rsp + 0x70], xmm10
1459a82b4: 440f294c2460 movaps xmmword ptr [rsp + 0x60], xmm9
1459a82ba: 440f29442450 movaps xmmword ptr [rsp + 0x50], xmm8
1459a82c0: 0f297c2440 movaps xmmword ptr [rsp + 0x40], xmm7
1459a82c5: 0f29742430 movaps xmmword ptr [rsp + 0x30], xmm6
1459a82ca: 4c89c7 mov rdi, r8
1459a82cd: 4989d5 mov r13, rdx
1459a82d0: 4889ce mov rsi, rcx
1459a82d3: 488b842420010000 mov rax, qword ptr [rsp + 0x120]
1459a82db: f3410f7e31 movq xmm6, qword ptr [r9]
1459a82e0: 4c8b00 mov r8, qword ptr [rax]
1459a82e3: 660f7ef3 movd ebx, xmm6
1459a82e7: f30f16c6 movshdup xmm0, xmm6
1459a82eb: 660f7ec0 movd eax, xmm0
1459a82ef: 48c1e020 shl rax, 0x20
1459a82f3: 4809c3 or rbx, rax
1459a82f6: 4889f9 mov rcx, rdi
1459a82f9: 4889da mov rdx, rbx
1459a82fc: e8ffb6ffff call 0x1459a3a00
1459a8301: 4531ff xor r15d, r15d
1459a8304: 0f2e0565ff3f00 ucomiss xmm0, dword ptr [rip + 0x3fff65]
1459a830b: 0f8300030000 jae 0x1459a8611
1459a8311: f20f107f20 movsd xmm7, qword ptr [rdi + 0x20]
1459a8316: 0f28c6 movaps xmm0, xmm6
1459a8319: 0f5cc7 subps xmm0, xmm7
1459a831c: 0f57c9 xorps xmm1, xmm1
1459a831f: 0f28d0 movaps xmm2, xmm0
1459a8322: 0fc2d101 cmpltps xmm2, xmm1
1459a8326: 0f14d2 unpcklps xmm2, xmm2
1459a8329: 660f50c2 movmskpd eax, xmm2
1459a832d: 85c0 test eax, eax
1459a832f: 0f85dc020000 jne 0x1459a8611
1459a8335: f30f100d13964000 movss xmm1, dword ptr [rip + 0x409613]
1459a833d: 0f28d0 movaps xmm2, xmm0
1459a8340: f30f5cd1 subss xmm2, xmm1
1459a8344: f3480f2cca cvttss2si rcx, xmm2
1459a8349: f3480f2cd0 cvttss2si rdx, xmm0
1459a834e: 4889d0 mov rax, rdx
1459a8351: 48c1f83f sar rax, 0x3f
1459a8355: 4821c8 and rax, rcx
1459a8358: 4809d0 or rax, rdx
1459a835b: 4531ff xor r15d, r15d
1459a835e: 0f57d2 xorps xmm2, xmm2
1459a8361: 0f2ec2 ucomiss xmm0, xmm2
1459a8364: 490f42c7 cmovb rax, r15
1459a8368: f30f101de4954000 movss xmm3, dword ptr [rip + 0x4095e4]
1459a8370: 0f2ec3 ucomiss xmm0, xmm3
1459a8373: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
1459a837a: 480f47c1 cmova rax, rcx
1459a837e: f30f16c0 movshdup xmm0, xmm0
1459a8382: 0f28e0 movaps xmm4, xmm0
1459a8385: f30f5ce1 subss xmm4, xmm1
1459a8389: f3480f2cd4 cvttss2si rdx, xmm4
1459a838e: f34c0f2cc0 cvttss2si r8, xmm0
1459a8393: 4d89c1 mov r9, r8
1459a8396: 49c1f93f sar r9, 0x3f
1459a839a: 4921d1 and r9, rdx
1459a839d: 4d09c1 or r9, r8
1459a83a0: 0f2ec2 ucomiss xmm0, xmm2
1459a83a3: 4d0f42cf cmovb r9, r15
1459a83a7: 0f2ec3 ucomiss xmm0, xmm3
1459a83aa: 4c0f47c9 cmova r9, rcx
1459a83ae: 4c8b7718 mov r14, qword ptr [rdi + 0x18]
1459a83b2: 4c39f0 cmp rax, r14
1459a83b5: 0f93c1 setae cl
1459a83b8: 4d39f1 cmp r9, r14
1459a83bb: 0f93c2 setae dl
1459a83be: 08ca or dl, cl
1459a83c0: 0f854b020000 jne 0x1459a8611
1459a83c6: 4d0fafce imul r9, r14
1459a83ca: 4901c1 add r9, rax
1459a83cd: 498b4510 mov rax, qword ptr [r13 + 0x10]
1459a83d1: 4889442428 mov qword ptr [rsp + 0x28], rax
1459a83d6: 4939c1 cmp r9, rax
1459a83d9: 0f8383020000 jae 0x1459a8662
1459a83df: 4d8b6508 mov r12, qword ptr [r13 + 8]
1459a83e3: 6643833c4cff cmp word ptr [r12 + r9*2], -1
1459a83e9: 743e je 0x1459a8429
1459a83eb: 4c89c8 mov rax, r9
1459a83ee: 4c09f0 or rax, r14
1459a83f1: 48c1e820 shr rax, 0x20
1459a83f5: 745b je 0x1459a8452
1459a83f7: 4c89c8 mov rax, r9
1459a83fa: 31d2 xor edx, edx
1459a83fc: 49f7f6 div r14
1459a83ff: 4885c0 test rax, rax
1459a8402: 785b js 0x1459a845f
1459a8404: 0f57c0 xorps xmm0, xmm0
1459a8407: f3480f2ac0 cvtsi2ss xmm0, rax
1459a840c: 4885d2 test rdx, rdx
1459a840f: 796b jns 0x1459a847c
1459a8411: 4889d0 mov rax, rdx
1459a8414: 48d1e8 shr rax, 1
1459a8417: 83e201 and edx, 1
1459a841a: 4809c2 or rdx, rax
1459a841d: f34c0f2ac2 cvtsi2ss xmm8, rdx
1459a8422: f3450f58c0 addss xmm8, xmm8
1459a8427: eb58 jmp 0x1459a8481
1459a8429: 4c89e1 mov rcx, r12
1459a842c: 488b542428 mov rdx, qword ptr [rsp + 0x28]
1459a8431: 4d89f0 mov r8, r14
1459a8434: e877f5ffff call 0x1459a79b0
1459a8439: 4883f801 cmp rax, 1
1459a843d: 0f85ce010000 jne 0x1459a8611
1459a8443: 4989d1 mov r9, rdx
1459a8446: 4c89c8 mov rax, r9
1459a8449: 4c09f0 or rax, r14
1459a844c: 48c1e820 shr rax, 0x20
1459a8450: 75a5 jne 0x1459a83f7
1459a8452: 4489c8 mov eax, r9d
1459a8455: 31d2 xor edx, edx
1459a8457: 41f7f6 div r14d
1459a845a: 4885c0 test rax, rax
1459a845d: 79a5 jns 0x1459a8404
1459a845f: 4889c1 mov rcx, rax
1459a8462: 48d1e9 shr rcx, 1
1459a8465: 83e001 and eax, 1
1459a8468: 4809c8 or rax, rcx
1459a846b: 0f57c0 xorps xmm0, xmm0
1459a846e: f3480f2ac0 cvtsi2ss xmm0, rax
1459a8473: f30f58c0 addss xmm0, xmm0
1459a8477: 4885d2 test rdx, rdx
1459a847a: 7895 js 0x1459a8411
1459a847c: f34c0f2ac2 cvtsi2ss xmm8, rdx
1459a8481: 440f14c0 unpcklps xmm8, xmm0
1459a8485: 440f580503dc4000 addps xmm8, xmmword ptr [rip + 0x40dc03]
1459a848d: 440f58c7 addps xmm8, xmm7
1459a8491: 0f57c0 xorps xmm0, xmm0
1459a8494: 440f14c0 unpcklps xmm8, xmm0
1459a8498: 498b6d18 mov rbp, qword ptr [r13 + 0x18]
1459a849c: 4939e9 cmp r9, rbp
1459a849f: 0f844b010000 je 0x1459a85f0
1459a84a5: 4c89e1 mov rcx, r12
1459a84a8: 488b542428 mov rdx, qword ptr [rsp + 0x28]
1459a84ad: 4d89f0 mov r8, r14
1459a84b0: e8fbf4ffff call 0x1459a79b0
1459a84b5: 4883f801 cmp rax, 1
1459a84b9: 0f8531010000 jne 0x1459a85f0
1459a84bf: 4989d5 mov r13, rdx
1459a84c2: f3440f108c2428010000 movss xmm9, dword ptr [rsp + 0x128]
1459a84cc: 41bf27000000 mov r15d, 0x27
1459a84d2: 440f2815b6db4000 movaps xmm10, xmmword ptr [rip + 0x40dbb6]
1459a84da: 450f57db xorps xmm11, xmm11
1459a84de: f3440f102589fd3f00 movss xmm12, dword ptr [rip + 0x3ffd89]
1459a84e7: 660f1f840000000000 nop word ptr [rax + rax]
1459a84f0: 4c89e8 mov rax, r13
1459a84f3: 4c09f0 or rax, r14
1459a84f6: 48c1e820 shr rax, 0x20
1459a84fa: 7436 je 0x1459a8532
1459a84fc: 4c89e8 mov rax, r13
1459a84ff: 31d2 xor edx, edx
1459a8501: 49f7f6 div r14
1459a8504: 4885c0 test rax, rax
1459a8507: 7836 js 0x1459a853f
1459a8509: 0f57c0 xorps xmm0, xmm0
1459a850c: f3480f2ac0 cvtsi2ss xmm0, rax
1459a8511: 4885d2 test rdx, rdx
1459a8514: 7946 jns 0x1459a855c
1459a8516: 4889d0 mov rax, rdx
1459a8519: 48d1e8 shr rax, 1
1459a851c: 83e201 and edx, 1
1459a851f: 4809c2 or rdx, rax
1459a8522: 450f57ed xorps xmm13, xmm13
1459a8526: f34c0f2aea cvtsi2ss xmm13, rdx
1459a852b: f3450f58ed addss xmm13, xmm13
1459a8530: eb33 jmp 0x1459a8565
1459a8532: 4489e8 mov eax, r13d
1459a8535: 31d2 xor edx, edx
1459a8537: 41f7f6 div r14d
1459a853a: 4885c0 test rax, rax
1459a853d: 79ca jns 0x1459a8509
1459a853f: 4889c1 mov rcx, rax
1459a8542: 48d1e9 shr rcx, 1
1459a8545: 83e001 and eax, 1
1459a8548: 4809c8 or rax, rcx
1459a854b: 0f57c0 xorps xmm0, xmm0
1459a854e: f3480f2ac0 cvtsi2ss xmm0, rax
1459a8553: f30f58c0 addss xmm0, xmm0
1459a8557: 4885d2 test rdx, rdx
1459a855a: 78ba js 0x1459a8516
1459a855c: 450f57ed xorps xmm13, xmm13
1459a8560: f34c0f2aea cvtsi2ss xmm13, rdx
1459a8565: 440f14e8 unpcklps xmm13, xmm0
1459a8569: 450f58ea addps xmm13, xmm10
1459a856d: 440f58ef addps xmm13, xmm7
1459a8571: 410f28c5 movaps xmm0, xmm13
1459a8575: 0f5cc6 subps xmm0, xmm6
1459a8578: 0f59c0 mulps xmm0, xmm0
1459a857b: f30f16c8 movshdup xmm1, xmm0
1459a857f: f30f58c8 addss xmm1, xmm0
1459a8583: 0f57c0 xorps xmm0, xmm0
1459a8586: f30f51c1 sqrtss xmm0, xmm1
1459a858a: 410f2ec1 ucomiss xmm0, xmm9
1459a858e: 7760 ja 0x1459a85f0
1459a8590: f3410f16c5 movshdup xmm0, xmm13
1459a8595: 66480f7ec0 movq rax, xmm0
1459a859a: 48c1e020 shl rax, 0x20
1459a859e: 66450f7ee8 movd r8d, xmm13
1459a85a3: 4909c0 or r8, rax
1459a85a6: 4889f9 mov rcx, rdi
1459a85a9: 4889da mov rdx, rbx
1459a85ac: e84fb4ffff call 0x1459a3a00
1459a85b1: 440f2ee0 ucomiss xmm12, xmm0
1459a85b5: 7739 ja 0x1459a85f0
1459a85b7: 450f14eb unpcklps xmm13, xmm11
1459a85bb: 4983ef01 sub r15, 1
1459a85bf: 722b jb 0x1459a85ec
1459a85c1: 4939ed cmp r13, rbp
1459a85c4: 7426 je 0x1459a85ec
1459a85c6: 4c89e1 mov rcx, r12
1459a85c9: 488b542428 mov rdx, qword ptr [rsp + 0x28]
1459a85ce: 4d89f0 mov r8, r14
1459a85d1: 4d89e9 mov r9, r13
1459a85d4: e8d7f3ffff call 0x1459a79b0
1459a85d9: 4989d5 mov r13, rdx
1459a85dc: 450f28c5 movaps xmm8, xmm13
1459a85e0: 4883f801 cmp rax, 1
1459a85e4: 0f8406ffffff je 0x1459a84f0
1459a85ea: eb04 jmp 0x1459a85f0
1459a85ec: 450f28c5 movaps xmm8, xmm13
1459a85f0: 66410f70c0ee pshufd xmm0, xmm8, 0xee
1459a85f6: 66480f7ec0 movq rax, xmm0
1459a85fb: 48c1e020 shl rax, 0x20
1459a85ff: 664c0f7ec1 movq rcx, xmm8
1459a8604: 4801c1 add rcx, rax
1459a8607: 48894e04 mov qword ptr [rsi + 4], rcx
1459a860b: 41bf01000000 mov r15d, 1
1459a8611: 44893e mov dword ptr [rsi], r15d
1459a8614: 4889f0 mov rax, rsi
1459a8617: 0f28742430 movaps xmm6, xmmword ptr [rsp + 0x30]
1459a861c: 0f287c2440 movaps xmm7, xmmword ptr [rsp + 0x40]
1459a8621: 440f28442450 movaps xmm8, xmmword ptr [rsp + 0x50]
1459a8627: 440f284c2460 movaps xmm9, xmmword ptr [rsp + 0x60]
1459a862d: 440f28542470 movaps xmm10, xmmword ptr [rsp + 0x70]
1459a8633: 440f289c2480000000 movaps xmm11, xmmword ptr [rsp + 0x80]
1459a863c: 440f28a42490000000 movaps xmm12, xmmword ptr [rsp + 0x90]
1459a8645: 440f28ac24a0000000 movaps xmm13, xmmword ptr [rsp + 0xa0]
1459a864e: 4881c4b8000000 add rsp, 0xb8
1459a8655: 5b pop rbx
1459a8656: 5d pop rbp
1459a8657: 5f pop rdi
1459a8658: 5e pop rsi
1459a8659: 415c pop r12
1459a865b: 415d pop r13
1459a865d: 415e pop r14
1459a865f: 415f pop r15
1459a8661: c3 ret
1459a8662: 4c8d056fbf8901 lea r8, [rip + 0x189bf6f]
1459a8669: 4c89c9 mov rcx, r9
1459a866c: 488b542428 mov rdx, qword ptr [rsp + 0x28]
1459a8671: e8cdbf3f00 call 0x145da4643
1459a8676: 0f0b ud2

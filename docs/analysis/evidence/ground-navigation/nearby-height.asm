14589a330: 4157 push r15
14589a332: 4156 push r14
14589a334: 4155 push r13
14589a336: 4154 push r12
14589a338: 56 push rsi
14589a339: 57 push rdi
14589a33a: 55 push rbp
14589a33b: 53 push rbx
14589a33c: 4881ecf8000000 sub rsp, 0xf8
14589a343: 440f29bc24e0000000 movaps xmmword ptr [rsp + 0xe0], xmm15
14589a34c: 440f29b424d0000000 movaps xmmword ptr [rsp + 0xd0], xmm14
14589a355: 440f29ac24c0000000 movaps xmmword ptr [rsp + 0xc0], xmm13
14589a35e: 440f29a424b0000000 movaps xmmword ptr [rsp + 0xb0], xmm12
14589a367: 440f299c24a0000000 movaps xmmword ptr [rsp + 0xa0], xmm11
14589a370: 440f29942490000000 movaps xmmword ptr [rsp + 0x90], xmm10
14589a379: 440f298c2480000000 movaps xmmword ptr [rsp + 0x80], xmm9
14589a382: 440f29442470 movaps xmmword ptr [rsp + 0x70], xmm8
14589a388: 0f297c2460 movaps xmmword ptr [rsp + 0x60], xmm7
14589a38d: 0f29742450 movaps xmmword ptr [rsp + 0x50], xmm6
14589a392: f30f11542430 movss dword ptr [rsp + 0x30], xmm2
14589a398: f30f2cc3 cvttss2si eax, xmm3
14589a39c: 0f2e1dfdf35e00 ucomiss xmm3, dword ptr [rip + 0x5ef3fd]
14589a3a3: bdffffff7f mov ebp, 0x7fffffff
14589a3a8: 0f46e8 cmovbe ebp, eax
14589a3ab: 31f6 xor esi, esi
14589a3ad: 0f2edb ucomiss xmm3, xmm3
14589a3b0: 0f4aee cmovp ebp, esi
14589a3b3: 89e8 mov eax, ebp
14589a3b5: f7d8 neg eax
14589a3b7: 8944242c mov dword ptr [rsp + 0x2c], eax
14589a3bb: 39c5 cmp ebp, eax
14589a3bd: 7d69 jge 0x14589a428
14589a3bf: 89f0 mov eax, esi
14589a3c1: 410f28c1 movaps xmm0, xmm9
14589a3c5: 0f28742450 movaps xmm6, xmmword ptr [rsp + 0x50]
14589a3ca: 0f287c2460 movaps xmm7, xmmword ptr [rsp + 0x60]
14589a3cf: 440f28442470 movaps xmm8, xmmword ptr [rsp + 0x70]
14589a3d5: 440f288c2480000000 movaps xmm9, xmmword ptr [rsp + 0x80]
14589a3de: 440f28942490000000 movaps xmm10, xmmword ptr [rsp + 0x90]
14589a3e7: 440f289c24a0000000 movaps xmm11, xmmword ptr [rsp + 0xa0]
14589a3f0: 440f28a424b0000000 movaps xmm12, xmmword ptr [rsp + 0xb0]
14589a3f9: 440f28ac24c0000000 movaps xmm13, xmmword ptr [rsp + 0xc0]
14589a402: 440f28b424d0000000 movaps xmm14, xmmword ptr [rsp + 0xd0]
14589a40b: 440f28bc24e0000000 movaps xmm15, xmmword ptr [rsp + 0xe0]
14589a414: 4881c4f8000000 add rsp, 0xf8
14589a41b: 5b pop rbx
14589a41c: 5d pop rbp
14589a41d: 5f pop rdi
14589a41e: 5e pop rsi
14589a41f: 415c pop r12
14589a421: 415d pop r13
14589a423: 415e pop r14
14589a425: 415f pop r15
14589a427: c3 ret
14589a428: 0f28f3 movaps xmm6, xmm3
14589a42b: 440f28c1 movaps xmm8, xmm1
14589a42f: 4989cc mov r12, rcx
14589a432: 4c8b4970 mov r9, qword ptr [rcx + 0x70]
14589a436: 4d85c9 test r9, r9
14589a439: 0f8867020000 js 0x14589a6a6
14589a43f: 450f57e4 xorps xmm12, xmm12
14589a443: f34d0f2ae1 cvtsi2ss xmm12, r9
14589a448: 410fb68424ac000000 movzx eax, byte ptr [r12 + 0xac]
14589a451: 4d8b842498000000 mov r8, qword ptr [r12 + 0x98]
14589a459: 4d85c0 test r8, r8
14589a45c: 0f8977020000 jns 0x14589a6d9
14589a462: 4c89c1 mov rcx, r8
14589a465: 48d1e9 shr rcx, 1
14589a468: 4489c2 mov edx, r8d
14589a46b: 83e201 and edx, 1
14589a46e: 4809ca or rdx, rcx
14589a471: f34c0f2aea cvtsi2ss xmm13, rdx
14589a476: f3450f58ed addss xmm13, xmm13
14589a47b: a801 test al, 1
14589a47d: 0f8563020000 jne 0x14589a6e6
14589a483: 49837c2458ff cmp qword ptr [r12 + 0x58], -1
14589a489: 0f840f030000 je 0x14589a79e
14589a48f: 4c894c2448 mov qword ptr [rsp + 0x48], r9
14589a494: f3450f106c2478 movss xmm13, dword ptr [r12 + 0x78]
14589a49b: f3410f1044247c movss xmm0, dword ptr [r12 + 0x7c]
14589a4a2: f30f11442434 movss dword ptr [rsp + 0x34], xmm0
14589a4a8: 498b442460 mov rax, qword ptr [r12 + 0x60]
14589a4ad: 4889442440 mov qword ptr [rsp + 0x40], rax
14589a4b2: 498b442468 mov rax, qword ptr [r12 + 0x68]
14589a4b7: 4889442438 mov qword ptr [rsp + 0x38], rax
14589a4bc: 31f6 xor esi, esi
14589a4be: f3440f103d89745100 movss xmm15, dword ptr [rip + 0x517489]
14589a4c7: 0f57ff xorps xmm7, xmm7
14589a4ca: f3440f103581745100 movss xmm14, dword ptr [rip + 0x517481]
14589a4d3: 448b6c242c mov r13d, dword ptr [rsp + 0x2c]
14589a4d8: 0f1f840000000000 nop dword ptr [rax + rax]
14589a4e0: 450f57d2 xorps xmm10, xmm10
14589a4e4: f3450f2ad5 cvtsi2ss xmm10, r13d
14589a4e9: 31ff xor edi, edi
14589a4eb: 4139ed cmp r13d, ebp
14589a4ee: 410f28c2 movaps xmm0, xmm10
14589a4f2: f3410f58c0 addss xmm0, xmm8
14589a4f7: f3410f5cc5 subss xmm0, xmm13
14589a4fc: f30f58c0 addss xmm0, xmm0
14589a500: f3480f2cc0 cvttss2si rax, xmm0
14589a505: 410f9cc7 setl r15b
14589a509: 4889c1 mov rcx, rax
14589a50c: 48c1f93f sar rcx, 0x3f
14589a510: 0f28c8 movaps xmm1, xmm0
14589a513: f3410f5ccf subss xmm1, xmm15
14589a518: f3480f2cd1 cvttss2si rdx, xmm1
14589a51d: 4821ca and rdx, rcx
14589a520: 4809c2 or rdx, rax
14589a523: 0f2ec7 ucomiss xmm0, xmm7
14589a526: 41be00000000 mov r14d, 0
14589a52c: 4c0f43f2 cmovae r14, rdx
14589a530: 410f2ec6 ucomiss xmm0, xmm14
14589a534: 48c7c0ffffffff mov rax, 0xffffffffffffffff
14589a53b: 4c0f47f0 cmova r14, rax
14589a53f: 410f2ec4 ucomiss xmm0, xmm12
14589a543: 0f8307010000 jae 0x14589a650
14589a549: 0f2ef8 ucomiss xmm7, xmm0
14589a54c: 0f87fe000000 ja 0x14589a650
14589a552: 31db xor ebx, ebx
14589a554: 448b64242c mov r12d, dword ptr [rsp + 0x2c]
14589a559: 4489e0 mov eax, r12d
14589a55c: 0f1f4000 nop dword ptr [rax]
14589a560: f6c301 test bl, 1
14589a563: 0f8520010000 jne 0x14589a689
14589a569: 39e8 cmp eax, ebp
14589a56b: 0f8f18010000 jg 0x14589a689
14589a571: 0f9dc3 setge bl
14589a574: 0f9cc1 setl cl
14589a577: 440fb6e1 movzx r12d, cl
14589a57b: 4101c4 add r12d, eax
14589a57e: 450f57db xorps xmm11, xmm11
14589a582: f3440f2ad8 cvtsi2ss xmm11, eax
14589a587: 410f28c2 movaps xmm0, xmm10
14589a58b: 410f28cb movaps xmm1, xmm11
14589a58f: e855ac3600 call 0x145c051e9
14589a594: 0f2ec6 ucomiss xmm0, xmm6
14589a597: 4489e0 mov eax, r12d
14589a59a: 77c4 ja 0x14589a560
14589a59c: f3440f585c2430 addss xmm11, dword ptr [rsp + 0x30]
14589a5a3: f3440f5c5c2434 subss xmm11, dword ptr [rsp + 0x34]
14589a5aa: f3450f58db addss xmm11, xmm11
14589a5af: 410f2efb ucomiss xmm7, xmm11
14589a5b3: 77a4 ja 0x14589a559
14589a5b5: 450f2edc ucomiss xmm11, xmm12
14589a5b9: 739e jae 0x14589a559
14589a5bb: f3490f2cc3 cvttss2si rax, xmm11
14589a5c0: 4889c1 mov rcx, rax
14589a5c3: 48c1f93f sar rcx, 0x3f
14589a5c7: 410f28c3 movaps xmm0, xmm11
14589a5cb: f3410f5cc7 subss xmm0, xmm15
14589a5d0: f3480f2cd0 cvttss2si rdx, xmm0
14589a5d5: 4821ca and rdx, rcx
14589a5d8: 4809c2 or rdx, rax
14589a5db: 440f2edf ucomiss xmm11, xmm7
14589a5df: b900000000 mov ecx, 0
14589a5e4: 480f43ca cmovae rcx, rdx
14589a5e8: 450f2ede ucomiss xmm11, xmm14
14589a5ec: 48c7c0ffffffff mov rax, 0xffffffffffffffff
14589a5f3: 480f47c8 cmova rcx, rax
14589a5f7: 480faf4c2448 imul rcx, qword ptr [rsp + 0x48]
14589a5fd: 4c01f1 add rcx, r14
14589a600: 483b4c2438 cmp rcx, qword ptr [rsp + 0x38]
14589a605: 0f8333050000 jae 0x14589ab3e
14589a60b: 488b442440 mov rax, qword ptr [rsp + 0x40]
14589a610: f30f100488 movss xmm0, dword ptr [rax + rcx*4]
14589a615: 0f2ec0 ucomiss xmm0, xmm0
14589a618: 0f8a3bffffff jp 0x14589a559
14589a61e: 40f6c601 test sil, 1
14589a622: 741d je 0x14589a641
14589a624: 410f28c9 movaps xmm1, xmm9
14589a628: f30f5dc8 minss xmm1, xmm0
14589a62c: 0f28c1 movaps xmm0, xmm1
14589a62f: f30fc2c103 cmpunordss xmm0, xmm1
14589a634: 0f28d0 movaps xmm2, xmm0
14589a637: 0f55d1 andnps xmm2, xmm1
14589a63a: 410f54c1 andps xmm0, xmm9
14589a63e: 0f56c2 orps xmm0, xmm2
14589a641: be01000000 mov esi, 1
14589a646: 440f28c8 movaps xmm9, xmm0
14589a64a: e90affffff jmp 0x14589a559
14589a64f: 90 nop
14589a650: 31db xor ebx, ebx
14589a652: 8b44242c mov eax, dword ptr [rsp + 0x2c]
14589a656: f6c301 test bl, 1
14589a659: 752e jne 0x14589a689
14589a65b: 0f1f440000 nop dword ptr [rax + rax]
14589a660: 39e8 cmp eax, ebp
14589a662: 7f25 jg 0x14589a689
14589a664: 0f9dc3 setge bl
14589a667: 0f9cc1 setl cl
14589a66a: 440fb6f1 movzx r14d, cl
14589a66e: 4101c6 add r14d, eax
14589a671: 0f57c9 xorps xmm1, xmm1
14589a674: f30f2ac8 cvtsi2ss xmm1, eax
14589a678: 410f28c2 movaps xmm0, xmm10
14589a67c: e868ab3600 call 0x145c051e9
14589a681: 4489f0 mov eax, r14d
14589a684: f6c301 test bl, 1
14589a687: 74d7 je 0x14589a660
14589a689: 4139ed cmp r13d, ebp
14589a68c: 0f8d2dfdffff jge 0x14589a3bf
14589a692: 4488ff mov dil, r15b
14589a695: 4101fd add r13d, edi
14589a698: 4139ed cmp r13d, ebp
14589a69b: 0f8e3ffeffff jle 0x14589a4e0
14589a6a1: e919fdffff jmp 0x14589a3bf
14589a6a6: 4c89c8 mov rax, r9
14589a6a9: 48d1e8 shr rax, 1
14589a6ac: 4489c9 mov ecx, r9d
14589a6af: 83e101 and ecx, 1
14589a6b2: 4809c1 or rcx, rax
14589a6b5: f34c0f2ae1 cvtsi2ss xmm12, rcx
14589a6ba: f3450f58e4 addss xmm12, xmm12
14589a6bf: 410fb68424ac000000 movzx eax, byte ptr [r12 + 0xac]
14589a6c8: 4d8b842498000000 mov r8, qword ptr [r12 + 0x98]
14589a6d0: 4d85c0 test r8, r8
14589a6d3: 0f8889fdffff js 0x14589a462
14589a6d9: f34d0f2ae8 cvtsi2ss xmm13, r8
14589a6de: a801 test al, 1
14589a6e0: 0f849dfdffff je 0x14589a483
14589a6e6: f3450f108424a8000000 movss xmm8, dword ptr [r12 + 0xa8]
14589a6f0: 31f6 xor esi, esi
14589a6f2: 8b7c242c mov edi, dword ptr [rsp + 0x2c]
14589a6f6: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589a700: 0f57ff xorps xmm7, xmm7
14589a703: f30f2aff cvtsi2ss xmm7, edi
14589a707: 31db xor ebx, ebx
14589a709: 8b44242c mov eax, dword ptr [rsp + 0x2c]
14589a70d: 0f1f00 nop dword ptr [rax]
14589a710: f6c301 test bl, 1
14589a713: 756b jne 0x14589a780
14589a715: 39e8 cmp eax, ebp
14589a717: 7f67 jg 0x14589a780
14589a719: 0f9dc3 setge bl
14589a71c: 0f9cc1 setl cl
14589a71f: 440fb6f1 movzx r14d, cl
14589a723: 4101c6 add r14d, eax
14589a726: 0f57c9 xorps xmm1, xmm1
14589a729: f30f2ac8 cvtsi2ss xmm1, eax
14589a72d: 0f28c7 movaps xmm0, xmm7
14589a730: e8b4aa3600 call 0x145c051e9
14589a735: 0f2ec6 ucomiss xmm0, xmm6
14589a738: 4489f0 mov eax, r14d
14589a73b: 77d3 ja 0x14589a710
14589a73d: 40f6c601 test sil, 1
14589a741: 7506 jne 0x14589a749
14589a743: 450f28c8 movaps xmm9, xmm8
14589a747: eb22 jmp 0x14589a76b
14589a749: 410f28c1 movaps xmm0, xmm9
14589a74d: f3410f5dc0 minss xmm0, xmm8
14589a752: 0f28c8 movaps xmm1, xmm0
14589a755: f30fc2c803 cmpunordss xmm1, xmm0
14589a75a: 0f28d1 movaps xmm2, xmm1
14589a75d: 0f55d0 andnps xmm2, xmm0
14589a760: 410f54c9 andps xmm1, xmm9
14589a764: 0f56ca orps xmm1, xmm2
14589a767: 440f28c9 movaps xmm9, xmm1
14589a76b: be01000000 mov esi, 1
14589a770: 4489f0 mov eax, r14d
14589a773: eb9b jmp 0x14589a710
14589a775: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589a780: 31c0 xor eax, eax
14589a782: 39ef cmp edi, ebp
14589a784: 0f9cc1 setl cl
14589a787: 0f8d32fcffff jge 0x14589a3bf
14589a78d: 88c8 mov al, cl
14589a78f: 01c7 add edi, eax
14589a791: 39ef cmp edi, ebp
14589a793: 0f8e67ffffff jle 0x14589a700
14589a799: e921fcffff jmp 0x14589a3bf
14589a79e: 4983bc2480000000ff cmp qword ptr [r12 + 0x80], -1
14589a7a7: 0f84bc020000 je 0x14589aa69
14589a7ad: 4c89442448 mov qword ptr [rsp + 0x48], r8
14589a7b2: f3450f10b424a0000000 movss xmm14, dword ptr [r12 + 0xa0]
14589a7bc: f3410f10bc24a4000000 movss xmm7, dword ptr [r12 + 0xa4]
14589a7c6: 498b842490000000 mov rax, qword ptr [r12 + 0x90]
14589a7ce: 4889442438 mov qword ptr [rsp + 0x38], rax
14589a7d3: 498b842488000000 mov rax, qword ptr [r12 + 0x88]
14589a7db: 4889442440 mov qword ptr [rsp + 0x40], rax
14589a7e0: 31f6 xor esi, esi
14589a7e2: 450f57ff xorps xmm15, xmm15
14589a7e6: 49c7c5ffffffff mov r13, 0xffffffffffffffff
14589a7ed: 448b74242c mov r14d, dword ptr [rsp + 0x2c]
14589a7f2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589a800: 31ff xor edi, edi
14589a802: 450f57d2 xorps xmm10, xmm10
14589a806: f3450f2ad6 cvtsi2ss xmm10, r14d
14589a80b: 4139ee cmp r14d, ebp
14589a80e: 450f28da movaps xmm11, xmm10
14589a812: f3450f58d8 addss xmm11, xmm8
14589a817: 410f28c3 movaps xmm0, xmm11
14589a81b: f3410f5cc6 subss xmm0, xmm14
14589a820: f30f58c0 addss xmm0, xmm0
14589a824: f3480f2cc0 cvttss2si rax, xmm0
14589a829: 0f9c442434 setl byte ptr [rsp + 0x34]
14589a82e: 4889c1 mov rcx, rax
14589a831: 48c1f93f sar rcx, 0x3f
14589a835: 0f28c8 movaps xmm1, xmm0
14589a838: f30f5c0d10715100 subss xmm1, dword ptr [rip + 0x517110]
14589a840: f3480f2cd1 cvttss2si rdx, xmm1
14589a845: 4821ca and rdx, rcx
14589a848: 4809c2 or rdx, rax
14589a84b: 410f2ec7 ucomiss xmm0, xmm15
14589a84f: 41bf00000000 mov r15d, 0
14589a855: 4c0f43fa cmovae r15, rdx
14589a859: 0f2e05f4705100 ucomiss xmm0, dword ptr [rip + 0x5170f4]
14589a860: 4d0f47fd cmova r15, r13
14589a864: 410f2ec5 ucomiss xmm0, xmm13
14589a868: 0f8332010000 jae 0x14589a9a0
14589a86e: 440f2ef8 ucomiss xmm15, xmm0
14589a872: 0f8728010000 ja 0x14589a9a0
14589a878: 4531ed xor r13d, r13d
14589a87b: 8b5c242c mov ebx, dword ptr [rsp + 0x2c]
14589a87f: 89d8 mov eax, ebx
14589a881: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589a890: 41f6c501 test r13b, 1
14589a894: 0f85a6010000 jne 0x14589aa40
14589a89a: 39e8 cmp eax, ebp
14589a89c: 0f8f9e010000 jg 0x14589aa40
14589a8a2: 410f9dc5 setge r13b
14589a8a6: 0f9cc1 setl cl
14589a8a9: 0fb6d9 movzx ebx, cl
14589a8ac: 01c3 add ebx, eax
14589a8ae: 450f57e4 xorps xmm12, xmm12
14589a8b2: f3440f2ae0 cvtsi2ss xmm12, eax
14589a8b7: 410f28c2 movaps xmm0, xmm10
14589a8bb: 410f28cc movaps xmm1, xmm12
14589a8bf: e825a93600 call 0x145c051e9
14589a8c4: 0f2ec6 ucomiss xmm0, xmm6
14589a8c7: 89d8 mov eax, ebx
14589a8c9: 77c5 ja 0x14589a890
14589a8cb: f3440f58642430 addss xmm12, dword ptr [rsp + 0x30]
14589a8d2: 4c89e1 mov rcx, r12
14589a8d5: 410f28cb movaps xmm1, xmm11
14589a8d9: 410f28d4 movaps xmm2, xmm12
14589a8dd: e84ef8ffff call 0x14589a130
14589a8e2: 83f801 cmp eax, 1
14589a8e5: 7598 jne 0x14589a87f
14589a8e7: f3440f5ce7 subss xmm12, xmm7
14589a8ec: f3450f58e4 addss xmm12, xmm12
14589a8f1: 450f2efc ucomiss xmm15, xmm12
14589a8f5: 7774 ja 0x14589a96b
14589a8f7: 450f2ee5 ucomiss xmm12, xmm13
14589a8fb: 736e jae 0x14589a96b
14589a8fd: f3490f2cc4 cvttss2si rax, xmm12
14589a902: 4889c1 mov rcx, rax
14589a905: 48c1f93f sar rcx, 0x3f
14589a909: 410f28cc movaps xmm1, xmm12
14589a90d: f30f5c0d3b705100 subss xmm1, dword ptr [rip + 0x51703b]
14589a915: f3480f2cd1 cvttss2si rdx, xmm1
14589a91a: 4821ca and rdx, rcx
14589a91d: 4809c2 or rdx, rax
14589a920: 450f2ee7 ucomiss xmm12, xmm15
14589a924: b900000000 mov ecx, 0
14589a929: 480f43ca cmovae rcx, rdx
14589a92d: 440f2e251f705100 ucomiss xmm12, dword ptr [rip + 0x51701f]
14589a935: 48c7c0ffffffff mov rax, 0xffffffffffffffff
14589a93c: 480f47c8 cmova rcx, rax
14589a940: 480faf4c2448 imul rcx, qword ptr [rsp + 0x48]
14589a946: 4c01f9 add rcx, r15
14589a949: 483b4c2438 cmp rcx, qword ptr [rsp + 0x38]
14589a94e: 0f83fd010000 jae 0x14589ab51
14589a954: 488b442440 mov rax, qword ptr [rsp + 0x40]
14589a959: f30f100c88 movss xmm1, dword ptr [rax + rcx*4]
14589a95e: 0f2ec9 ucomiss xmm1, xmm1
14589a961: 7a08 jp 0x14589a96b
14589a963: 0f2ec8 ucomiss xmm1, xmm0
14589a966: 7603 jbe 0x14589a96b
14589a968: 0f28c1 movaps xmm0, xmm1
14589a96b: 40f6c601 test sil, 1
14589a96f: 741d je 0x14589a98e
14589a971: 410f28c9 movaps xmm1, xmm9
14589a975: f30f5dc8 minss xmm1, xmm0
14589a979: 0f28c1 movaps xmm0, xmm1
14589a97c: f30fc2c103 cmpunordss xmm0, xmm1
14589a981: 0f28d0 movaps xmm2, xmm0
14589a984: 0f55d1 andnps xmm2, xmm1
14589a987: 410f54c1 andps xmm0, xmm9
14589a98b: 0f56c2 orps xmm0, xmm2
14589a98e: be01000000 mov esi, 1
14589a993: 440f28c8 movaps xmm9, xmm0
14589a997: e9e3feffff jmp 0x14589a87f
14589a99c: 0f1f4000 nop dword ptr [rax]
14589a9a0: 31db xor ebx, ebx
14589a9a2: 448b7c242c mov r15d, dword ptr [rsp + 0x2c]
14589a9a7: 4489f8 mov eax, r15d
14589a9aa: 660f1f440000 nop word ptr [rax + rax]
14589a9b0: f6c301 test bl, 1
14589a9b3: 0f858e000000 jne 0x14589aa47
14589a9b9: 39e8 cmp eax, ebp
14589a9bb: 0f8f86000000 jg 0x14589aa47
14589a9c1: 0f9dc3 setge bl
14589a9c4: 0f9cc1 setl cl
14589a9c7: 440fb6f9 movzx r15d, cl
14589a9cb: 4101c7 add r15d, eax
14589a9ce: 450f57e4 xorps xmm12, xmm12
14589a9d2: f3440f2ae0 cvtsi2ss xmm12, eax
14589a9d7: 410f28c2 movaps xmm0, xmm10
14589a9db: 410f28cc movaps xmm1, xmm12
14589a9df: e805a83600 call 0x145c051e9
14589a9e4: 0f2ec6 ucomiss xmm0, xmm6
14589a9e7: 4489f8 mov eax, r15d
14589a9ea: 77c4 ja 0x14589a9b0
14589a9ec: f3440f58642430 addss xmm12, dword ptr [rsp + 0x30]
14589a9f3: 4c89e1 mov rcx, r12
14589a9f6: 410f28cb movaps xmm1, xmm11
14589a9fa: 410f28d4 movaps xmm2, xmm12
14589a9fe: e82df7ffff call 0x14589a130
14589aa03: 83f801 cmp eax, 1
14589aa06: 759f jne 0x14589a9a7
14589aa08: 40f6c601 test sil, 1
14589aa0c: 741d je 0x14589aa2b
14589aa0e: 410f28c9 movaps xmm1, xmm9
14589aa12: f30f5dc8 minss xmm1, xmm0
14589aa16: 0f28c1 movaps xmm0, xmm1
14589aa19: f30fc2c103 cmpunordss xmm0, xmm1
14589aa1e: 0f28d0 movaps xmm2, xmm0
14589aa21: 0f55d1 andnps xmm2, xmm1
14589aa24: 410f54c1 andps xmm0, xmm9
14589aa28: 0f56c2 orps xmm0, xmm2
14589aa2b: 440f28c8 movaps xmm9, xmm0
14589aa2f: be01000000 mov esi, 1
14589aa34: e96effffff jmp 0x14589a9a7
14589aa39: 0f1f8000000000 nop dword ptr [rax]
14589aa40: 49c7c5ffffffff mov r13, 0xffffffffffffffff
14589aa47: 4139ee cmp r14d, ebp
14589aa4a: 0f8d6ff9ffff jge 0x14589a3bf
14589aa50: 0fb6442434 movzx eax, byte ptr [rsp + 0x34]
14589aa55: 4088c7 mov dil, al
14589aa58: 4101fe add r14d, edi
14589aa5b: 4139ee cmp r14d, ebp
14589aa5e: 0f8e9cfdffff jle 0x14589a800
14589aa64: e956f9ffff jmp 0x14589a3bf
14589aa69: 31f6 xor esi, esi
14589aa6b: 8b7c242c mov edi, dword ptr [rsp + 0x2c]
14589aa6f: 90 nop
14589aa70: 450f57d2 xorps xmm10, xmm10
14589aa74: f3440f2ad7 cvtsi2ss xmm10, edi
14589aa79: 450f28d8 movaps xmm11, xmm8
14589aa7d: f3450f58da addss xmm11, xmm10
14589aa82: 31db xor ebx, ebx
14589aa84: 448b74242c mov r14d, dword ptr [rsp + 0x2c]
14589aa89: 4489f0 mov eax, r14d
14589aa8c: 0f1f4000 nop dword ptr [rax]
14589aa90: f6c301 test bl, 1
14589aa93: 0f8587000000 jne 0x14589ab20
14589aa99: 39e8 cmp eax, ebp
14589aa9b: 0f8f7f000000 jg 0x14589ab20
14589aaa1: 0f9dc3 setge bl
14589aaa4: 0f9cc1 setl cl
14589aaa7: 440fb6f1 movzx r14d, cl
14589aaab: 4101c6 add r14d, eax
14589aaae: 450f57e4 xorps xmm12, xmm12
14589aab2: f3440f2ae0 cvtsi2ss xmm12, eax
14589aab7: 410f28c2 movaps xmm0, xmm10
14589aabb: 410f28cc movaps xmm1, xmm12
14589aabf: e825a73600 call 0x145c051e9
14589aac4: 0f2ec6 ucomiss xmm0, xmm6
14589aac7: 4489f0 mov eax, r14d
14589aaca: 77c4 ja 0x14589aa90
14589aacc: f3440f58642430 addss xmm12, dword ptr [rsp + 0x30]
14589aad3: 4c89e1 mov rcx, r12
14589aad6: 410f28cb movaps xmm1, xmm11
14589aada: 410f28d4 movaps xmm2, xmm12
14589aade: e84df6ffff call 0x14589a130
14589aae3: 83f801 cmp eax, 1
14589aae6: 75a1 jne 0x14589aa89
14589aae8: 40f6c601 test sil, 1
14589aaec: 741d je 0x14589ab0b
14589aaee: 410f28c9 movaps xmm1, xmm9
14589aaf2: f30f5dc8 minss xmm1, xmm0
14589aaf6: 0f28c1 movaps xmm0, xmm1
14589aaf9: f30fc2c103 cmpunordss xmm0, xmm1
14589aafe: 0f28d0 movaps xmm2, xmm0
14589ab01: 0f55d1 andnps xmm2, xmm1
14589ab04: 410f54c1 andps xmm0, xmm9
14589ab08: 0f56c2 orps xmm0, xmm2
14589ab0b: 440f28c8 movaps xmm9, xmm0
14589ab0f: be01000000 mov esi, 1
14589ab14: e970ffffff jmp 0x14589aa89
14589ab19: 0f1f8000000000 nop dword ptr [rax]
14589ab20: 31c0 xor eax, eax
14589ab22: 39ef cmp edi, ebp
14589ab24: 0f9cc1 setl cl
14589ab27: 0f8d92f8ffff jge 0x14589a3bf
14589ab2d: 88c8 mov al, cl
14589ab2f: 01c7 add edi, eax
14589ab31: 39ef cmp edi, ebp
14589ab33: 0f8e37ffffff jle 0x14589aa70
14589ab39: e981f8ffff jmp 0x14589a3bf
14589ab3e: 4c8d0543f93501 lea r8, [rip + 0x135f943]
14589ab45: 488b542438 mov rdx, qword ptr [rsp + 0x38]
14589ab4a: e8f49a5000 call 0x145da4643
14589ab4f: 0f0b ud2
14589ab51: 4c8d0548f63501 lea r8, [rip + 0x135f648]
14589ab58: 488b542438 mov rdx, qword ptr [rsp + 0x38]
14589ab5d: e8e19a5000 call 0x145da4643
14589ab62: 0f0b ud2

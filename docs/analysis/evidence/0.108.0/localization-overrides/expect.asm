1458e2760: push	rbp
1458e2761: push	r14
1458e2763: push	rsi
1458e2764: push	rdi
1458e2765: push	rbx
1458e2766: sub	rsp, 0xa0
1458e276d: lea	rbp, [rsp + 0x80]
1458e2775: mov	qword ptr [rbp + 0x18], 0xfffffffffffffffe
1458e277d: mov	rsi, rcx
1458e2780: mov	r14, qword ptr [rdx + 8]
1458e2784: mov	rdi, qword ptr [rdx + 0x10]
1458e2788: cmp	rdi, r14
1458e278b: jae	0x1458e27ac
1458e278d: mov	rbx, qword ptr [rdx]
1458e2790: movzx	eax, byte ptr [rbx + rdi]
1458e2794: inc	rdi
1458e2797: mov	qword ptr [rdx + 0x10], rdi
1458e279b: cmp	al, r8b
1458e279e: jne	0x1458e27b6
1458e27a0: mov	qword ptr [rsi], 0xffffffffffffffff
1458e27a7: jmp	0x1458e2920
1458e27ac: inc	rdi
1458e27af: mov	qword ptr [rdx + 0x10], rdi
1458e27b3: mov	rbx, qword ptr [rdx]
1458e27b6: movzx	eax, r8b
1458e27ba: mov	dword ptr [rbp - 0x30], eax
1458e27bd: lea	rax, [rbp - 0x30]
1458e27c1: mov	qword ptr [rbp - 0x18], rax
1458e27c5: lea	rax, [rip + 0x2f6594]
1458e27cc: mov	qword ptr [rbp - 0x10], rax
1458e27d0: lea	rdx, [rip + 0x1308704]
1458e27d7: lea	rcx, [rbp - 0x48]
1458e27db: lea	r8, [rbp - 0x18]
1458e27df: call	0x145bc5690
1458e27e4: mov	rcx, qword ptr [rbp - 0x40]
1458e27e8: mov	rax, qword ptr [rbp - 0x38]
1458e27ec: mov	qword ptr [rbp - 0x58], rcx
1458e27f0: mov	qword ptr [rbp - 0x50], rax
1458e27f4: cmp	r14, rdi
1458e27f7: cmovb	rdi, r14
1458e27fb: test	rdi, rdi
1458e27fe: mov	qword ptr [rbp + 0x10], rcx
1458e2802: je	0x1458e2813
1458e2804: cmp	rdi, 4
1458e2808: jae	0x1458e281a
1458e280a: xor	eax, eax
1458e280c: xor	ecx, ecx
1458e280e: jmp	0x1458e28a2
1458e2813: xor	ecx, ecx
1458e2815: jmp	0x1458e28b6
1458e281a: mov	rax, rdi
1458e281d: and	rax, 0xfffffffffffffffc
1458e2821: pxor	xmm0, xmm0
1458e2825: xor	ecx, ecx
1458e2827: movdqa	xmm1, xmmword ptr [rip + 0x778e61]
1458e282f: movdqa	xmm3, xmmword ptr [rip + 0x4b4f99]
1458e2837: pxor	xmm2, xmm2
1458e283b: nop	dword ptr [rax + rax]
1458e2840: movzx	edx, word ptr [rbx + rcx]
1458e2844: movd	xmm4, edx
1458e2848: movzx	edx, word ptr [rbx + rcx + 2]
1458e284d: movd	xmm5, edx
1458e2851: pcmpeqb	xmm4, xmm1
1458e2855: punpcklbw	xmm4, xmm4
1458e2859: pshuflw	xmm4, xmm4, 0xd4
1458e285e: pshufd	xmm4, xmm4, 0xd4
1458e2863: pand	xmm4, xmm3
1458e2867: paddq	xmm2, xmm4
1458e286b: pcmpeqb	xmm5, xmm1
1458e286f: punpcklbw	xmm5, xmm5
1458e2873: pshuflw	xmm4, xmm5, 0xd4
1458e2878: pshufd	xmm4, xmm4, 0xd4
1458e287d: pand	xmm4, xmm3
1458e2881: paddq	xmm0, xmm4
1458e2885: add	rcx, 4
1458e2889: cmp	rax, rcx
1458e288c: jne	0x1458e2840
1458e288e: paddq	xmm0, xmm2
1458e2892: pshufd	xmm1, xmm0, 0xee
1458e2897: paddq	xmm1, xmm0
1458e289b: movq	rcx, xmm1
1458e28a0: jmp	0x1458e28b1
1458e28a2: xor	edx, edx
1458e28a4: cmp	byte ptr [rbx + rax], 0xa
1458e28a8: sete	dl
1458e28ab: add	rcx, rdx
1458e28ae: inc	rax
1458e28b1: cmp	rdi, rax
1458e28b4: jne	0x1458e28a2
1458e28b6: inc	rcx
1458e28b9: mov	qword ptr [rbp + 8], rcx
1458e28bd: lea	rax, [rbp + 8]
1458e28c1: mov	qword ptr [rbp - 0x18], rax
1458e28c5: lea	rax, [rip + 0x2f5764]
1458e28cc: mov	qword ptr [rbp - 0x10], rax
1458e28d0: lea	rax, [rbp - 0x58]
1458e28d4: mov	qword ptr [rbp - 8], rax
1458e28d8: lea	rax, [rip - 0x58e081f]
1458e28df: mov	qword ptr [rbp], rax
1458e28e3: lea	rdx, [rip + 0x13085e5]
1458e28ea: lea	rcx, [rbp - 0x30]
1458e28ee: lea	r8, [rbp - 0x18]
1458e28f2: call	0x145bc5690
1458e28f7: nop
1458e28f8: mov	rax, qword ptr [rbp - 0x20]
1458e28fc: mov	qword ptr [rsi + 0x10], rax
1458e2900: movups	xmm0, xmmword ptr [rbp - 0x30]
1458e2904: movups	xmmword ptr [rsi], xmm0
1458e2907: mov	rdx, qword ptr [rbp - 0x48]
1458e290b: test	rdx, rdx
1458e290e: je	0x1458e2920
1458e2910: mov	r8d, 1
1458e2916: mov	rcx, qword ptr [rbp + 0x10]
1458e291a: call	0x1400021d0
1458e291f: nop
1458e2920: add	rsp, 0xa0
1458e2927: pop	rbx
1458e2928: pop	rdi
1458e2929: pop	rsi
1458e292a: pop	r14
1458e292c: pop	rbp
1458e292d: ret

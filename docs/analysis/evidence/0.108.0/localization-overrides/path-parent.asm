145b9f6d0: push	rbp
145b9f6d1: push	rsi
145b9f6d2: push	rdi
145b9f6d3: sub	rsp, 0xa0
145b9f6da: lea	rbp, [rsp + 0x80]
145b9f6e2: mov	rsi, rdx
145b9f6e5: mov	rdi, rcx
145b9f6e8: lea	rcx, [rbp - 0x18]
145b9f6ec: mov	rdx, rdi
145b9f6ef: mov	r8, rsi
145b9f6f2: call	0x145bb2d20
145b9f6f7: movzx	edx, byte ptr [rbp - 0x18]
145b9f6fb: mov	rax, rsi
145b9f6fe: mov	rcx, rdi
145b9f701: cmp	rdx, 5
145b9f705: ja	0x145b9f768
145b9f707: mov	rcx, qword ptr [rbp - 8]
145b9f70b: mov	rax, qword ptr [rbp + 8]
145b9f70f: lea	r8, [rip + 0x1690716]
145b9f716: movsxd	rdx, dword ptr [r8 + rdx*4]
145b9f71a: add	rdx, r8
145b9f71d: jmp	rdx
145b9f71f: add	rcx, 4
145b9f723: jmp	0x145b9f759
145b9f725: lea	rdx, [rax + 1]
145b9f729: test	rax, rax
145b9f72c: cmove	rdx, rax
145b9f730: add	rcx, rdx
145b9f733: add	rcx, 2
145b9f737: jmp	0x145b9f759
145b9f739: mov	ecx, 6
145b9f73e: jmp	0x145b9f759
145b9f740: lea	rdx, [rax + 1]
145b9f744: test	rax, rax
145b9f747: cmove	rdx, rax
145b9f74b: add	rcx, rdx
145b9f74e: add	rcx, 8
145b9f752: jmp	0x145b9f759
145b9f754: mov	ecx, 2
145b9f759: mov	rax, rsi
145b9f75c: sub	rax, rcx
145b9f75f: jb	0x145b9f7e8
145b9f765: add	rcx, rdi
145b9f768: test	rax, rax
145b9f76b: je	0x145b9f77e
145b9f76d: movzx	eax, byte ptr [rcx]
145b9f770: cmp	al, 0x5c
145b9f772: sete	cl
145b9f775: cmp	al, 0x2f
145b9f777: sete	al
145b9f77a: or	al, cl
145b9f77c: jmp	0x145b9f780
145b9f77e: xor	eax, eax
145b9f780: mov	qword ptr [rbp - 0x58], rdi
145b9f784: mov	qword ptr [rbp - 0x50], rsi
145b9f788: movups	xmm0, xmmword ptr [rbp - 0x18]
145b9f78c: movups	xmm1, xmmword ptr [rbp - 8]
145b9f790: movups	xmmword ptr [rbp - 0x48], xmm0
145b9f794: movups	xmmword ptr [rbp - 0x38], xmm1
145b9f798: mov	rcx, qword ptr [rbp + 8]
145b9f79c: mov	qword ptr [rbp - 0x28], rcx
145b9f7a0: mov	byte ptr [rbp - 0x1e], al
145b9f7a3: mov	word ptr [rbp - 0x20], 0x200
145b9f7a9: lea	rcx, [rbp - 0x18]
145b9f7ad: lea	rdx, [rbp - 0x58]
145b9f7b1: call	0x145bbaf90
145b9f7b6: movzx	ecx, byte ptr [rbp - 0x18]
145b9f7ba: xor	eax, eax
145b9f7bc: cmp	cl, 0xff
145b9f7bf: je	0x145b9f7dd
145b9f7c1: sub	cl, 5
145b9f7c4: movzx	ecx, cl
145b9f7c7: cmovb	ecx, eax
145b9f7ca: add	cl, 0xfe
145b9f7cd: cmp	cl, 3
145b9f7d0: jae	0x145b9f7dd
145b9f7d2: lea	rcx, [rbp - 0x58]
145b9f7d6: call	0x145ba1000
145b9f7db: jmp	0x145b9f7dd
145b9f7dd: add	rsp, 0xa0
145b9f7e4: pop	rdi
145b9f7e5: pop	rsi
145b9f7e6: pop	rbp
145b9f7e7: ret
145b9f7e8: lea	r9, [rip + 0x168e891]
145b9f7ef: mov	rdx, rsi
145b9f7f2: mov	r8, rsi
145b9f7f5: call	0x145d93aa0
145b9f7fa: ud2

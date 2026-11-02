1401052e0	push	r15
1401052e2	push	r14
1401052e4	push	r13
1401052e6	push	r12
1401052e8	push	rsi
1401052e9	push	rdi
1401052ea	push	rbp
1401052eb	push	rbx
1401052ec	sub	rsp, 0x348
1401052f3	movaps	xmmword ptr [rsp + 0x330], xmm7
1401052fb	movaps	xmmword ptr [rsp + 0x320], xmm6
140105303	mov	rsi, r9
140105306	mov	rbx, r8
140105309	mov	rdi, rdx
14010530c	movzx	ebp, byte ptr [rsp + 0x3b0]
140105314	movups	xmm0, xmmword ptr [rip + 0x5cd0a15]
14010531b	movaps	xmmword ptr [rsp + 0x270], xmm0
140105323	mov	qword ptr [rsp + 0x280], 0
14010532f	movups	xmm1, xmmword ptr [rip + 0x5cd0a12]
140105336	movups	xmmword ptr [rsp + 0x288], xmm1
14010533e	mov	qword ptr [rsp + 0x298], 0
14010534a	movups	xmm1, xmmword ptr [rip + 0x5cd0a0f]
140105351	movaps	xmmword ptr [rsp + 0x2a0], xmm1
140105359	mov	qword ptr [rsp + 0x2b0], 0
140105365	movups	xmm2, xmmword ptr [rip + 0x5cd0a0c]
14010536c	movups	xmmword ptr [rsp + 0x2b8], xmm2
140105374	mov	qword ptr [rsp + 0x2c8], 0
140105380	mov	rax, qword ptr [rcx]
140105383	lea	rdx, [rcx + 8]
140105387	mov	rcx, qword ptr [rsp + 0x2c0]
14010538f	mov	qword ptr [rsp + 0x88], rcx
140105397	mov	rcx, qword ptr [rsp + 0x2c8]
14010539f	mov	qword ptr [rsp + 0x90], rcx
1401053a7	mov	rcx, qword ptr [rsp + 0x2b0]
1401053af	mov	qword ptr [rsp + 0x78], rcx
1401053b4	mov	rcx, qword ptr [rsp + 0x2b8]
1401053bc	mov	qword ptr [rsp + 0x80], rcx
1401053c4	movups	xmmword ptr [rsp + 0x68], xmm1
1401053c9	movaps	xmm1, xmmword ptr [rsp + 0x290]
1401053d1	movups	xmmword ptr [rsp + 0x58], xmm1
1401053d6	movaps	xmm1, xmmword ptr [rsp + 0x280]
1401053de	movups	xmmword ptr [rsp + 0x48], xmm1
1401053e3	movups	xmmword ptr [rsp + 0x38], xmm0
1401053e8	xorps	xmm6, xmm6
1401053eb	movups	xmmword ptr [rsp + 0x98], xmm6
1401053f3	movups	xmmword ptr [rsp + 0xa8], xmm6
1401053fb	movups	xmmword ptr [rsp + 0xb8], xmm6
140105403	movups	xmmword ptr [rsp + 0xc8], xmm6
14010540b	movups	xmmword ptr [rsp + 0xd8], xmm6
140105413	mov	qword ptr [rsp + 0xe8], 0
14010541f	movups	xmm0, xmmword ptr [rip + 0x5cd09d2]
140105426	movups	xmmword ptr [rsp + 0x100], xmm0
14010542e	movups	xmm0, xmmword ptr [rip + 0x5cd09b3]
140105435	movups	xmmword ptr [rsp + 0xf0], xmm0
14010543d	movaps	xmm0, xmmword ptr [rip + 0x5c9820c]
140105444	movups	xmmword ptr [rsp + 0x110], xmm0
14010544c	movaps	xmm0, xmmword ptr [rip + 0x5c97e0d]
140105453	movups	xmmword ptr [rsp + 0x120], xmm0
14010545b	movaps	xmm0, xmmword ptr [rip + 0x5c97e4e]
140105462	movups	xmmword ptr [rsp + 0x130], xmm0
14010546a	movups	xmmword ptr [rsp + 0x140], xmm0
140105472	movaps	xmm0, xmmword ptr [rip + 0x5cc7c87]
140105479	movups	xmmword ptr [rsp + 0x150], xmm0
140105481	movups	xmmword ptr [rsp + 0x160], xmm0
140105489	movaps	xmm0, xmmword ptr [rip + 0x5c97de0]
140105490	movups	xmmword ptr [rsp + 0x170], xmm0
140105498	mov	dword ptr [rsp + 0x180], 1
1401054a3	mov	qword ptr [rsp + 0x184], 0
1401054af	mov	byte ptr [rsp + 0x18c], 1
1401054b7	mov	qword ptr [rsp + 0x190], 0
1401054c3	mov	dword ptr [rsp + 0x198], 0x3f800000
1401054ce	mov	word ptr [rsp + 0x19c], 0
1401054d8	mov	word ptr [rsp + 0x1a2], 0
1401054e2	mov	dword ptr [rsp + 0x19e], 0x10000
1401054ed	mov	word ptr [rsp + 0x1a8], 0
1401054f7	mov	dword ptr [rsp + 0x1a4], 0x10000
140105502	mov	qword ptr [rsp + 0x1aa], 0
14010550e	mov	dword ptr [rsp + 0x1b2], 0x5000305
140105519	mov	qword ptr [rsp + 0x30], rax
14010551e	lea	r9, [rip + 0x5ccff0b]
140105525	lea	rcx, [rsp + 0x210]
14010552d	lea	r8, [rsp + 0x30]
140105532	call	0x1401de510
140105537	test	bpl, bpl
14010553a	je	0x1401057a9
140105540	mov	dword ptr [rsp + 0x40], 0x3f800000
140105548	movups	xmm7, xmmword ptr [rip + 0x5cd0d49]
14010554f	movups	xmm6, xmmword ptr [rip + 0x5cd12b6]
140105556	movups	xmmword ptr [rsp + 0x44], xmm6
14010555b	mov	dword ptr [rsp + 0x54], 0x3f800000
140105563	movups	xmmword ptr [rsp + 0x248], xmm7
14010556b	mov	eax, dword ptr [rsp + 0x40]
14010556f	mov	dword ptr [rsp + 0x258], eax
140105576	mov	rax, qword ptr [rsp + 0x44]
14010557b	mov	qword ptr [rsp + 0x25c], rax
140105583	mov	eax, dword ptr [rsp + 0x4c]
140105587	mov	dword ptr [rsp + 0x264], eax
14010558e	mov	rax, qword ptr [rsp + 0x50]
140105593	mov	qword ptr [rsp + 0x268], rax
14010559b	mov	r14, qword ptr [rsp + 0x228]
1401055a3	test	r14, r14
1401055a6	jne	0x1401055b0
1401055a8	mov	r14, qword ptr [rsp + 0x230]
1401055b0	mov	r13, qword ptr [rsp + 0x3b8]
1401055b8	mov	r12, qword ptr [rsp + 0x210]
1401055c0	mov	rax, qword ptr [r14]
1401055c3	mov	r15, qword ptr [r14 + 0x10]
1401055c7	sub	rax, r15
1401055ca	cmp	rax, 0x67
1401055ce	jbe	0x140105a31
1401055d4	mov	rax, qword ptr [r14 + 8]
1401055d8	lea	rcx, [rip + 0x17b121]
1401055df	mov	qword ptr [rax + r15], rcx
1401055e3	movups	xmm0, xmmword ptr [r13]
1401055e8	movups	xmm1, xmmword ptr [r13 + 0x10]
1401055ed	movups	xmmword ptr [rax + r15 + 8], xmm0
1401055f3	movups	xmmword ptr [rax + r15 + 0x18], xmm1
1401055f9	mov	byte ptr [rax + r15 + 0x28], 2
1401055ff	movups	xmm0, xmmword ptr [rsp + 0x245]
140105607	movups	xmm1, xmmword ptr [rsp + 0x255]
14010560f	movups	xmm2, xmmword ptr [rsp + 0x260]
140105617	movups	xmmword ptr [rax + r15 + 0x29], xmm0
14010561d	movups	xmmword ptr [rax + r15 + 0x39], xmm1
140105623	movups	xmmword ptr [rax + r15 + 0x44], xmm2
140105629	mov	dword ptr [rax + r15 + 0x54], 0
140105632	mov	byte ptr [rax + r15 + 0x58], 0
140105638	mov	qword ptr [rax + r15 + 0x60], r12
14010563d	add	r15, 0x68
140105641	mov	qword ptr [r14 + 0x10], r15
140105645	lea	r15, [rsp + 0x30]
14010564a	mov	rcx, r15
14010564d	call	0x140100690
140105652	mov	byte ptr [rsp + 0x98], 0
14010565a	lea	rcx, [rsp + 0x210]
140105662	mov	rdx, r15
140105665	call	0x1401f81e0
14010566a	movaps	xmmword ptr [rsp + 0x2d0], xmm7
140105672	mov	dword ptr [rsp + 0x2e0], 0x3f800000
14010567d	movups	xmmword ptr [rsp + 0x2e4], xmm7
140105685	mov	dword ptr [rsp + 0x2f4], 0x3f800000
140105690	movups	xmmword ptr [rsp + 0x2f8], xmm7
140105698	mov	dword ptr [rsp + 0x308], 0x3f800000
1401056a3	movups	xmmword ptr [rsp + 0x30c], xmm7
1401056ab	mov	dword ptr [rsp + 0x31c], 0x3f800000
1401056b6	mov	rax, qword ptr [r14]
1401056b9	mov	r15, qword ptr [r14 + 0x10]
1401056bd	sub	rax, r15
1401056c0	cmp	rax, 0x67
1401056c4	jbe	0x140105a56
1401056ca	mov	rax, qword ptr [r14 + 8]
1401056ce	lea	rcx, [rip + 0x17a79b]
1401056d5	mov	qword ptr [rax + r15], rcx
1401056d9	mov	qword ptr [rax + r15 + 8], r12
1401056de	movaps	xmm0, xmmword ptr [rsp + 0x2d0]
1401056e6	movaps	xmm1, xmmword ptr [rsp + 0x2e0]
1401056ee	movaps	xmm2, xmmword ptr [rsp + 0x2f0]
1401056f6	movaps	xmm3, xmmword ptr [rsp + 0x300]
1401056fe	movups	xmmword ptr [rax + r15 + 0x10], xmm0
140105704	movups	xmmword ptr [rax + r15 + 0x20], xmm1
14010570a	movups	xmmword ptr [rax + r15 + 0x30], xmm2
140105710	movups	xmmword ptr [rax + r15 + 0x40], xmm3
140105716	movaps	xmm0, xmmword ptr [rsp + 0x310]
14010571e	movups	xmmword ptr [rax + r15 + 0x50], xmm0
140105724	mov	byte ptr [rax + r15 + 0x60], 0
14010572a	add	r15, 0x68
14010572e	mov	qword ptr [r14 + 0x10], r15
140105732	movaps	xmmword ptr [rsp + 0x270], xmm6
14010573a	movss	xmm6, dword ptr [rip + 0x5c97b5e]
140105742	test	rsi, rsi
140105745	js	0x14010592a
14010574b	je	0x14010593a
140105751	call	0x140002200
140105756	mov	r15d, 1
14010575c	mov	edx, 1
140105761	mov	rcx, rsi
140105764	call	0x1400021c0
140105769	test	rax, rax
14010576c	je	0x14010592d
140105772	mov	r14, rax
140105775	mov	rcx, rax
140105778	mov	rdx, rbx
14010577b	mov	r8, rsi
14010577e	call	0x145bfa0e7
140105783	cmp	byte ptr [rdi], 1
140105786	jne	0x140105949
14010578c	mov	eax, dword ptr [rdi + 1]
14010578f	mov	ecx, dword ptr [rdi + 4]
140105792	mov	dword ptr [rsp + 0x2b], ecx
140105796	mov	dword ptr [rsp + 0x28], eax
14010579a	mov	rax, qword ptr [rdi + 8]
14010579e	movzx	ecx, byte ptr [rdi + 0x10]
1401057a2	mov	dl, 1
1401057a4	jmp	0x140105959
1401057a9	movups	xmm0, xmmword ptr [rip + 0x5cd0b14]
1401057b0	movaps	xmmword ptr [rsp + 0x1c0], xmm0
1401057b8	mov	dword ptr [rsp + 0x1d0], 0x3f800000
1401057c3	movups	xmmword ptr [rsp + 0x1d4], xmm0
1401057cb	mov	dword ptr [rsp + 0x1e4], 0x3f800000
1401057d6	movups	xmmword ptr [rsp + 0x1e8], xmm0
1401057de	mov	dword ptr [rsp + 0x1f8], 0x3f800000
1401057e9	movups	xmmword ptr [rsp + 0x1fc], xmm0
1401057f1	mov	dword ptr [rsp + 0x20c], 0x3f800000
1401057fc	mov	rax, qword ptr [rsp + 0x200]
140105804	mov	qword ptr [rsp + 0x70], rax
140105809	mov	eax, dword ptr [rsp + 0x208]
140105810	mov	dword ptr [rsp + 0x78], eax
140105814	mov	eax, dword ptr [rsp + 0x20c]
14010581b	mov	dword ptr [rsp + 0x7c], eax
14010581f	mov	rax, qword ptr [rsp + 0x1f0]
140105827	mov	qword ptr [rsp + 0x60], rax
14010582c	mov	eax, dword ptr [rsp + 0x1f8]
140105833	mov	dword ptr [rsp + 0x68], eax
140105837	mov	eax, dword ptr [rsp + 0x1fc]
14010583e	mov	dword ptr [rsp + 0x6c], eax
140105842	movaps	xmm1, xmmword ptr [rsp + 0x1e0]
14010584a	movaps	xmmword ptr [rsp + 0x50], xmm1
14010584f	movaps	xmm1, xmmword ptr [rsp + 0x1d0]
140105857	movaps	xmmword ptr [rsp + 0x40], xmm1
14010585c	movaps	xmmword ptr [rsp + 0x30], xmm0
140105861	movaps	xmmword ptr [rsp + 0x80], xmm6
140105869	mov	r14, qword ptr [rsp + 0x228]
140105871	test	r14, r14
140105874	jne	0x14010587e
140105876	mov	r14, qword ptr [rsp + 0x230]
14010587e	mov	r12, qword ptr [rsp + 0x210]
140105886	mov	rax, qword ptr [r14]
140105889	mov	r15, qword ptr [r14 + 0x10]
14010588d	sub	rax, r15
140105890	cmp	rax, 0x77
140105894	jbe	0x140105a7b
14010589a	mov	rax, qword ptr [r14 + 8]
14010589e	lea	rcx, [rip + 0x17a87b]
1401058a5	mov	qword ptr [rax + r15], rcx
1401058a9	movaps	xmm0, xmmword ptr [rsp + 0x30]
1401058ae	movaps	xmm1, xmmword ptr [rsp + 0x40]
1401058b3	movaps	xmm2, xmmword ptr [rsp + 0x50]
1401058b8	movaps	xmm3, xmmword ptr [rsp + 0x60]
1401058bd	movups	xmmword ptr [rax + r15 + 8], xmm0
1401058c3	movups	xmmword ptr [rax + r15 + 0x18], xmm1
1401058c9	movups	xmmword ptr [rax + r15 + 0x28], xmm2
1401058cf	movups	xmmword ptr [rax + r15 + 0x38], xmm3
1401058d5	movaps	xmm0, xmmword ptr [rsp + 0x70]
1401058da	movups	xmmword ptr [rax + r15 + 0x48], xmm0
1401058e0	movaps	xmm0, xmmword ptr [rsp + 0x80]
1401058e8	movups	xmmword ptr [rax + r15 + 0x58], xmm0
1401058ee	mov	dword ptr [rax + r15 + 0x68], 0x3ecccccd
1401058f7	mov	byte ptr [rax + r15 + 0x6c], 0
1401058fd	mov	qword ptr [rax + r15 + 0x70], r12
140105902	add	r15, 0x78
140105906	mov	qword ptr [r14 + 0x10], r15
14010590a	movups	xmm0, xmmword ptr [rip + 0x5cd0973]
140105911	movaps	xmmword ptr [rsp + 0x270], xmm0
140105919	movss	xmm6, dword ptr [rip + 0x5c97983]
140105921	test	rsi, rsi
140105924	jns	0x14010574b
14010592a	xor	r15d, r15d
14010592d	mov	rcx, r15
140105930	mov	rdx, rsi
140105933	call	0x145d992bb
140105938	ud2
14010593a	mov	r14d, 1
140105940	cmp	byte ptr [rdi], 1
140105943	je	0x14010578c
140105949	mov	rax, qword ptr [rdi + 8]
14010594d	lock inc	qword ptr [rax]
140105951	jle	0x140105aa0
140105957	xor	edx, edx
140105959	mov	qword ptr [rsp + 0x30], rsi
14010595e	mov	qword ptr [rsp + 0x38], r14
140105963	mov	qword ptr [rsp + 0x40], rsi
140105968	mov	qword ptr [rsp + 0x48], 0
140105971	mov	qword ptr [rsp + 0x50], 4
14010597a	mov	qword ptr [rsp + 0x58], 0
140105983	mov	byte ptr [rsp + 0x60], dl
140105987	mov	edx, dword ptr [rsp + 0x28]
14010598b	mov	r8d, dword ptr [rsp + 0x2b]
140105990	mov	dword ptr [rsp + 0x61], edx
140105994	mov	dword ptr [rsp + 0x64], r8d
140105999	mov	qword ptr [rsp + 0x68], rax
14010599e	mov	qword ptr [rsp + 0x70], rcx
1401059a3	mov	dword ptr [rsp + 0x78], 0x41700000
1401059ab	mov	word ptr [rsp + 0x7c], 0x190
1401059b2	mov	byte ptr [rsp + 0x7e], 1
1401059b7	movaps	xmm0, xmmword ptr [rsp + 0x270]
1401059bf	movups	xmmword ptr [rsp + 0x80], xmm0
1401059c7	movss	dword ptr [rsp + 0x90], xmm6
1401059d0	movups	xmm0, xmmword ptr [rip + 0x5cd00b9]
1401059d7	movups	xmmword ptr [rsp + 0x94], xmm0
1401059df	mov	dword ptr [rsp + 0xa4], 0x3f59999a
1401059ea	movsd	xmm0, qword ptr [rip + 0x5c97aae]
1401059f2	movsd	qword ptr [rsp + 0xa8], xmm0
1401059fb	lea	rcx, [rsp + 0x210]
140105a03	lea	rdx, [rsp + 0x30]
140105a08	call	0x1401f9650
140105a0d	movaps	xmm6, xmmword ptr [rsp + 0x320]
140105a15	movaps	xmm7, xmmword ptr [rsp + 0x330]
140105a1d	add	rsp, 0x348
140105a24	pop	rbx
140105a25	pop	rbp
140105a26	pop	rdi
140105a27	pop	rsi
140105a28	pop	r12
140105a2a	pop	r13
140105a2c	pop	r14
140105a2e	pop	r15
140105a30	ret
140105a31	mov	qword ptr [rsp + 0x20], 1
140105a3a	mov	r8d, 0x68
140105a40	mov	r9d, 1
140105a46	mov	rcx, r14
140105a49	mov	rdx, r15
140105a4c	call	0x145bfa970
140105a51	jmp	0x1401055d4
140105a56	mov	qword ptr [rsp + 0x20], 1
140105a5f	mov	r8d, 0x68
140105a65	mov	r9d, 1
140105a6b	mov	rcx, r14
140105a6e	mov	rdx, r15
140105a71	call	0x145bfa970
140105a76	jmp	0x1401056ca
140105a7b	mov	qword ptr [rsp + 0x20], 1
140105a84	mov	r8d, 0x78
140105a8a	mov	r9d, 1
140105a90	mov	rcx, r14
140105a93	mov	rdx, r15
140105a96	call	0x145bfa970
140105a9b	jmp	0x14010589a
140105aa0	ud2

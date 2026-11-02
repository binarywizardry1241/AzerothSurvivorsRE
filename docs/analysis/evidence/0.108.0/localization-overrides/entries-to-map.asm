145999230: push	rbp
145999231: push	rsi
145999232: push	rdi
145999233: sub	rsp, 0x90
14599923a: lea	rbp, [rsp + 0x80]
145999242: mov	qword ptr [rbp + 8], 0xfffffffffffffffe
14599924a: mov	qword ptr [rbp - 8], rdx
14599924e: mov	rsi, rcx
145999251: mov	byte ptr [rbp + 7], 1
145999255: call	0x145b9bfd0
14599925a: nop
14599925b: cmp	byte ptr [rax + 0x10], 1
14599925f: jne	0x1459992e5
145999265: mov	rcx, qword ptr [rax]
145999268: mov	rdx, qword ptr [rax + 8]
14599926c: lea	r8, [rcx + 1]
145999270: mov	qword ptr [rax], r8
145999273: movups	xmm0, xmmword ptr [rip + 0x185a056]
14599927a: movaps	xmmword ptr [rbp - 0x30], xmm0
14599927e: movups	xmm0, xmmword ptr [rip + 0x185a03b]
145999285: movaps	xmmword ptr [rbp - 0x40], xmm0
145999289: mov	qword ptr [rbp - 0x20], rcx
14599928d: mov	qword ptr [rbp - 0x18], rdx
145999291: mov	rdi, qword ptr [rbp - 8]
145999295: mov	rax, qword ptr [rdi + 0x18]
145999299: sub	rax, qword ptr [rdi + 8]
14599929d: jne	0x145999308
14599929f: movups	xmm0, xmmword ptr [rdi]
1459992a2: movups	xmm1, xmmword ptr [rdi + 0x10]
1459992a6: movaps	xmmword ptr [rbp - 0x50], xmm1
1459992aa: movaps	xmmword ptr [rbp - 0x60], xmm0
1459992ae: mov	byte ptr [rbp + 6], 0
1459992b2: lea	rcx, [rbp - 0x60]
1459992b6: lea	rdx, [rbp - 0x40]
1459992ba: call	0x1459e6bd0
1459992bf: nop
1459992c0: movaps	xmm0, xmmword ptr [rbp - 0x40]
1459992c4: movaps	xmm1, xmmword ptr [rbp - 0x30]
1459992c8: movaps	xmm2, xmmword ptr [rbp - 0x20]
1459992cc: movups	xmmword ptr [rsi + 0x20], xmm2
1459992d0: movups	xmmword ptr [rsi + 0x10], xmm1
1459992d4: movups	xmmword ptr [rsi], xmm0
1459992d7: mov	rax, rsi
1459992da: add	rsp, 0x90
1459992e1: pop	rdi
1459992e2: pop	rsi
1459992e3: pop	rbp
1459992e4: ret
1459992e5: mov	byte ptr [rbp + 7], 1
1459992e9: mov	rdi, rax
1459992ec: call	0x145bafbf0
1459992f1: nop
1459992f2: mov	rcx, rax
1459992f5: mov	rax, rdi
1459992f8: mov	qword ptr [rdi], rcx
1459992fb: mov	qword ptr [rdi + 8], rdx
1459992ff: mov	byte ptr [rdi + 0x10], 1
145999303: jmp	0x14599926c
145999308: lea	r8, [rbp - 0x20]
14599930c: shr	rax, 4
145999310: movabs	rdx, 0xaaaaaaaaaaaaaaab
14599931a: imul	rdx, rax
14599931e: mov	byte ptr [rbp + 6], 1
145999322: lea	rcx, [rbp - 0x40]
145999326: mov	r9b, 1
145999329: call	0x145d76fb0
14599932e: nop
14599932f: jmp	0x14599929f

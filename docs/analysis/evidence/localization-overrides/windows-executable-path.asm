145bb39e0: push	rbp
145bb39e1: push	r15
145bb39e3: push	r14
145bb39e5: push	r13
145bb39e7: push	r12
145bb39e9: push	rsi
145bb39ea: push	rdi
145bb39eb: push	rbx
145bb39ec: sub	rsp, 0x488
145bb39f3: lea	rbp, [rsp + 0x80]
145bb39fb: mov	qword ptr [rbp + 0x400], 0xfffffffffffffffe
145bb3a06: mov	qword ptr [rbp + 0x3e0], rcx
145bb3a0d: mov	qword ptr [rbp + 0x3e8], 0
145bb3a18: mov	qword ptr [rbp + 0x3f0], 2
145bb3a23: mov	qword ptr [rbp + 0x3f8], 0
145bb3a2e: mov	r8d, 0x200
145bb3a34: mov	eax, 2
145bb3a39: mov	qword ptr [rbp + 0x3d0], rax
145bb3a40: mov	qword ptr [rbp + 0x3d8], 0
145bb3a4b: mov	r13, qword ptr [rip + 0x1e0dde]
145bb3a52: mov	rdi, qword ptr [rip + 0x1e0e6f]
145bb3a59: mov	r14d, 0xffffffff
145bb3a5f: xor	esi, esi
145bb3a61: xor	ebx, ebx
145bb3a63: cmp	r8, 0x201
145bb3a6a: jae	0x145bb3aa0
145bb3a6c: jmp	0x145bb3a7f
145bb3a6e: nop
145bb3a70: jae	0x145bb3b8f
145bb3a76: cmp	r8, 0x201
145bb3a7d: jae	0x145bb3aa0
145bb3a7f: mov	eax, 0x200
145bb3a84: mov	qword ptr [rbp + 0x3c8], rax
145bb3a8b: lea	r15, [rbp - 0x58]
145bb3a8f: mov	r12, r8
145bb3a92: jmp	0x145bb3ada
145bb3a94: nop	word ptr cs:[rax + rax]
145bb3aa0: sub	r8, rbx
145bb3aa3: sub	rsi, rbx
145bb3aa6: cmp	r8, rsi
145bb3aa9: ja	0x145bb3b4f
145bb3aaf: mov	rsi, qword ptr [rbp + 0x3d8]
145bb3ab6: cmp	rsi, r14
145bb3ab9: mov	ebx, 0xffffffff
145bb3abe: cmovb	rbx, rsi
145bb3ac2: mov	qword ptr [rbp + 0x3f8], rbx
145bb3ac9: mov	qword ptr [rbp + 0x3c8], rbx
145bb3ad0: mov	r15, qword ptr [rbp + 0x3d0]
145bb3ad7: mov	r12, rbx
145bb3ada: xor	ecx, ecx
145bb3adc: call	r13
145bb3adf: xor	ecx, ecx
145bb3ae1: mov	rdx, r15
145bb3ae4: mov	r8d, r12d
145bb3ae7: call	rdi
145bb3ae9: test	eax, eax
145bb3aeb: jne	0x145bb3b15
145bb3aed: mov	r14, rdi
145bb3af0: mov	rdi, r13
145bb3af3: mov	r13d, eax
145bb3af6: call	qword ptr [rip + 0x1e0df4]
145bb3afc: mov	ecx, eax
145bb3afe: mov	eax, r13d
145bb3b01: mov	r13, rdi
145bb3b04: mov	rdi, r14
145bb3b07: mov	r14d, 0xffffffff
145bb3b0d: test	ecx, ecx
145bb3b0f: jne	0x145bb3c01
145bb3b15: mov	r8d, eax
145bb3b18: cmp	r12, r8
145bb3b1b: jne	0x145bb3a70
145bb3b21: call	qword ptr [rip + 0x1e0dc9]
145bb3b27: cmp	eax, 0x7a
145bb3b2a: jne	0x145bb3c6d
145bb3b30: add	r12, r12
145bb3b33: cmp	r12, r14
145bb3b36: cmovae	r12, r14
145bb3b3a: mov	r8, r12
145bb3b3d: cmp	r8, 0x201
145bb3b44: jb	0x145bb3a7f
145bb3b4a: jmp	0x145bb3aa0
145bb3b4f: mov	qword ptr [rsp + 0x20], 2
145bb3b58: mov	r9d, 2
145bb3b5e: lea	rcx, [rbp + 0x3e8]
145bb3b65: mov	rdx, rbx
145bb3b68: call	0x145d91630
145bb3b6d: nop
145bb3b6e: mov	rax, qword ptr [rbp + 0x3e8]
145bb3b75: mov	qword ptr [rbp + 0x3d8], rax
145bb3b7c: mov	rax, qword ptr [rbp + 0x3f0]
145bb3b83: mov	qword ptr [rbp + 0x3d0], rax
145bb3b8a: jmp	0x145bb3aaf
145bb3b8f: mov	rax, qword ptr [rbp + 0x3c8]
145bb3b96: cmp	rax, r8
145bb3b99: jb	0x145bb3c47
145bb3b9f: lea	rcx, [rbp + 0x3a8]
145bb3ba6: mov	rdx, r15
145bb3ba9: call	0x145bc3530
145bb3bae: nop
145bb3baf: movups	xmm0, xmmword ptr [rbp + 0x3a8]
145bb3bb6: movups	xmm1, xmmword ptr [rbp + 0x3b8]
145bb3bbd: mov	rax, qword ptr [rbp + 0x3e0]
145bb3bc4: movups	xmmword ptr [rax + 0x10], xmm1
145bb3bc8: movups	xmmword ptr [rax], xmm0
145bb3bcb: mov	rdx, qword ptr [rbp + 0x3e8]
145bb3bd2: test	rdx, rdx
145bb3bd5: je	0x145bb3bed
145bb3bd7: mov	rcx, qword ptr [rbp + 0x3f0]
145bb3bde: add	rdx, rdx
145bb3be1: mov	r8d, 2
145bb3be7: call	0x1400021d0
145bb3bec: nop
145bb3bed: add	rsp, 0x488
145bb3bf4: pop	rbx
145bb3bf5: pop	rdi
145bb3bf6: pop	rsi
145bb3bf7: pop	r12
145bb3bf9: pop	r13
145bb3bfb: pop	r14
145bb3bfd: pop	r15
145bb3bff: pop	rbp
145bb3c00: ret
145bb3c01: call	qword ptr [rip + 0x1e0ce9]
145bb3c07: mov	edi, eax
145bb3c09: mov	rax, qword ptr [rip + 0x249be78]
145bb3c10: mov	rax, qword ptr [rax]
145bb3c13: lea	rcx, [rip + 0x1678576]
145bb3c1a: cmp	rax, rcx
145bb3c1d: jne	0x145bb3c5e
145bb3c1f: shl	rdi, 0x20
145bb3c23: or	rdi, 2
145bb3c27: mov	rax, qword ptr [rbp + 0x3e0]
145bb3c2e: mov	qword ptr [rax + 8], rdi
145bb3c32: mov	qword ptr [rax], 0xffffffffffffffff
145bb3c39: mov	rdx, qword ptr [rbp + 0x3e8]
145bb3c40: test	rdx, rdx
145bb3c43: jne	0x145bb3bd7
145bb3c45: jmp	0x145bb3bed
145bb3c47: lea	r9, [rip + 0x1678d5a]
145bb3c4e: xor	ecx, ecx
145bb3c50: mov	rdx, r8
145bb3c53: mov	r8, rax
145bb3c56: call	0x145d93aa0
145bb3c5b: nop
145bb3c5c: jmp	0x145bb3c86
145bb3c5e: lea	rcx, [rip + 0x167852b]
145bb3c65: call	0x145d93cb0
145bb3c6a: nop
145bb3c6b: jmp	0x145bb3c1f
145bb3c6d: lea	rcx, [rip + 0x1678c7c]
145bb3c74: lea	r8, [rip + 0x1678d45]
145bb3c7b: mov	edx, 0x28
145bb3c80: call	0x145d93a50
145bb3c85: nop
145bb3c86: ud2

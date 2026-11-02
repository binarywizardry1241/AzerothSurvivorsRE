1458e1c60: push	rbp
1458e1c61: push	rsi
1458e1c62: sub	rsp, 0x58
1458e1c66: lea	rbp, [rsp + 0x50]
1458e1c6b: mov	qword ptr [rbp], 0xfffffffffffffffe
1458e1c73: mov	rax, qword ptr [rcx]
1458e1c76: mov	rsi, qword ptr [rax]
1458e1c79: mov	qword ptr [rax], 0
1458e1c80: test	rsi, rsi
1458e1c83: je	0x1458e1cfc
1458e1c85: call	0x140002200
1458e1c8a: mov	ecx, 0x2a0
1458e1c8f: mov	edx, 8
1458e1c94: call	0x1400021c0
1458e1c99: test	rax, rax
1458e1c9c: je	0x1458e1d0a
1458e1c9e: mov	qword ptr [rbp - 0x18], 0xe
1458e1ca6: mov	qword ptr [rbp - 0x10], rax
1458e1caa: lea	rcx, [rbp - 8]
1458e1cae: mov	qword ptr [rbp - 8], 0
1458e1cb6: mov	qword ptr [rbp - 0x20], rax
1458e1cba: mov	qword ptr [rbp - 0x30], rcx
1458e1cbe: mov	qword ptr [rbp - 0x28], 0
1458e1cc6: lea	rcx, [rip + 0x15b3783]
1458e1ccd: lea	rdx, [rip + 0x15b3a8c]
1458e1cd4: lea	r8, [rbp - 0x30]
1458e1cd8: call	0x1459caea0
1458e1cdd: nop
1458e1cde: movups	xmm0, xmmword ptr [rbp - 0x18]
1458e1ce2: movaps	xmmword ptr [rbp - 0x30], xmm0
1458e1ce6: mov	rax, qword ptr [rbp - 8]
1458e1cea: mov	qword ptr [rbp - 0x20], rax
1458e1cee: mov	qword ptr [rsi + 0x10], rax
1458e1cf2: movups	xmmword ptr [rsi], xmm0
1458e1cf5: add	rsp, 0x58
1458e1cf9: pop	rsi
1458e1cfa: pop	rbp
1458e1cfb: ret
1458e1cfc: lea	rcx, [rip + 0x1309045]
1458e1d03: call	0x145d937f0
1458e1d08: ud2
1458e1d0a: mov	ecx, 8
1458e1d0f: mov	edx, 0x2a0
1458e1d14: call	0x145d934fb
1458e1d19: ud2

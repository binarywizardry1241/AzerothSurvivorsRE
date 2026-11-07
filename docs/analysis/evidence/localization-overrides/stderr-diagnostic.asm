145baedf0: push	rbp
145baedf1: push	rsi
145baedf2: push	rdi
145baedf3: sub	rsp, 0x70
145baedf7: lea	rbp, [rsp + 0x70]
145baedfc: mov	qword ptr [rbp - 8], 0xfffffffffffffffe
145baee04: mov	rsi, rdx
145baee07: mov	rdi, rcx
145baee0a: lea	rax, [rip + 0x167f795]
145baee11: mov	qword ptr [rbp - 0x48], rax
145baee15: mov	qword ptr [rbp - 0x40], 6
145baee1d: call	0x145baea80
145baee22: test	al, al
145baee24: jne	0x145baee4d
145baee26: lea	rax, [rip + 0x24a33ab]
145baee2d: mov	qword ptr [rbp - 0x18], rax
145baee31: lea	rax, [rbp - 0x18]
145baee35: mov	qword ptr [rbp - 0x38], rax
145baee39: lea	rcx, [rbp - 0x38]
145baee3d: mov	rdx, rdi
145baee40: mov	r8, rsi
145baee43: call	0x145bbb910
145baee48: test	rax, rax
145baee4b: jne	0x145baee55
145baee4d: add	rsp, 0x70
145baee51: pop	rdi
145baee52: pop	rsi
145baee53: pop	rbp
145baee54: ret
145baee55: mov	qword ptr [rbp - 0x10], rax
145baee59: lea	rax, [rbp - 0x48]
145baee5d: mov	qword ptr [rbp - 0x38], rax
145baee61: lea	rax, [rip + 0x9918]
145baee68: mov	qword ptr [rbp - 0x30], rax
145baee6c: lea	rax, [rbp - 0x10]
145baee70: mov	qword ptr [rbp - 0x28], rax
145baee74: lea	rax, [rip + 0x274d5]
145baee7b: mov	qword ptr [rbp - 0x20], rax
145baee7f: lea	rcx, [rip + 0x167d9ca]
145baee86: lea	r8, [rip + 0x167da2b]
145baee8d: lea	rdx, [rbp - 0x38]
145baee91: call	0x145d93a70
145baee96: nop
145baee97: ud2

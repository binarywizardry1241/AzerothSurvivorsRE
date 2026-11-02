# modal-state

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c4521:     	movq	-0x58(%rbp), %rcx
1400c4525:     	testq	%rcx, %rcx
1400c4528:     	setne	%al
1400c452b:     	cmpq	$0x3, %rcx
1400c452f:     	ja	0x1400c49c9 <.text+0xc39c9>
1400c4535:     	cmpq	$0x1, %rcx
1400c4539:     	je	0x1400c49c9 <.text+0xc39c9>


# modal-menu-gate

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c49c9:     	cmpb	$0x0, 0x10(%r14)
1400c49ce:     	jne	0x1400c49e0 <.text+0xc39e0>
1400c49d0:     	cmpb	$0x1, 0xd(%rbx)
1400c49d4:     	jne	0x1400c49e0 <.text+0xc39e0>
1400c49d6:     	movzbl	(%rbx), %eax
1400c49d9:     	xorb	$0x1, %al
1400c49db:     	jmp	0x1400c453f <.text+0xc353f>
1400c49e0:     	xorl	%eax, %eax
1400c49e2:     	jmp	0x1400c453f <.text+0xc353f>


# banner-state

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c3150:     	cmpq	$0x4, %rax
1400c3154:     	je	0x1400c315b <.text+0xc215b>
1400c3156:     	cmpl	$0x1, %eax
1400c3159:     	jne	0x1400c31a7 <.text+0xc21a7>


# banner-menu-gate

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c3181:     	cmpq	$-0x1, %rdx
1400c3185:     	setne	%al
1400c3188:     	andb	0x10(%rdi), %al
1400c318b:     	cmpb	$0x1, %al
1400c318d:     	movq	%rcx, 0x5d8(%rbp)
1400c3194:     	jne	0x1400c31a3 <.text+0xc21a3>
1400c3196:     	cmpb	$0x1, 0xd(%rsi)
1400c319a:     	jne	0x1400c31a3 <.text+0xc21a3>
1400c319c:     	movzbl	(%rsi), %eax
1400c319f:     	xorb	$0x1, %al
1400c31a1:     	jmp	0x1400c31b0 <.text+0xc21b0>
1400c31a3:     	xorl	%eax, %eax
1400c31a5:     	jmp	0x1400c31b0 <.text+0xc21b0>
1400c31a7:     	movq	$-0x1, %rdx
1400c31ae:     	xorl	%eax, %eax


# entering-tag

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140059bbf:     	cmpb	$0x0, (%r14)
140059bc3:     	jne	0x140059bd2 <.text+0x58bd2>
140059bc5:     	movabsq	$-0x407fffffffffffff, %rax # imm = 0xBF80000000000001
140059bcf:     	movq	%rax, (%r14)


# world-entry-menu-gate

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005cb57:     	movq	0x100(%rbp), %rax
14005cb5e:     	movb	$0x0, 0xd(%rax)
14005cb62:     	movl	$0x0, (%rax)
14005cb68:     	movq	0x108(%rbp), %rcx
14005cb6f:     	movl	0x16c(%rbp), %edx
14005cb75:     	movl	%edx, (%rcx)
14005cb77:     	movb	$0x0, 0xe(%rax)


# return-menu-gate

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005d7e9:     	movq	0x100(%rbp), %rcx
14005d7f0:     	movb	$0x0, 0xe(%rcx)
14005d7f4:     	movzbl	0xc(%rcx), %eax
14005d7f8:     	movl	%r8d, (%rdx)
14005d7fb:     	movb	%al, 0xd(%rcx)


# actions-table-path

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c4199:     	cmpb	$0x0, (%rdx)
1400c419c:     	jne	0x1400c405d <.text+0xc305d>
1400c41a2:     	movzbl	(%rcx), %ecx
1400c41a5:     	testl	%ecx, %ecx
1400c41a7:     	je	0x1400c41c7 <.text+0xc31c7>
1400c41a9:     	cmpl	$0x1, %ecx
1400c41ac:     	jne	0x1400c41e5 <.text+0xc31e5>
1400c41ae:     	movq	0x68(%rsp), %rcx
1400c41b3:     	movl	0x54(%rsp), %edx
1400c41b7:     	movl	%edx, (%rcx)
1400c41b9:     	movq	0x58(%rsp), %rcx
1400c41be:     	movb	$0x1, 0x10(%rcx)
1400c41c2:     	jmp	0x1400c405d <.text+0xc305d>
1400c41c7:     	movq	0x40(%rsp), %rcx
1400c41cc:     	movq	%rax, 0x48(%rsp)
1400c41d1:     	callq	0x14007b2e0 <.text+0x7a2e0>
1400c41d6:     	movl	0x3c(%rsp), %r11d
1400c41db:     	movq	0x48(%rsp), %rax
1400c41e0:     	jmp	0x1400c405d <.text+0xc305d>
1400c41e5:     	movq	0x68(%rsp), %rcx
1400c41ea:     	movl	0x54(%rsp), %edx
1400c41ee:     	movl	%edx, (%rcx)
1400c41f0:     	movq	0x58(%rsp), %rcx
1400c41f5:     	movb	$0x0, 0x10(%rcx)
1400c41f9:     	jmp	0x1400c405d <.text+0xc305d>


# actions-sparse-path

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c4399:     	cmpb	$0x0, (%rdx)
1400c439c:     	jne	0x1400c4264 <.text+0xc3264>
1400c43a2:     	movzbl	(%rcx), %ecx
1400c43a5:     	testl	%ecx, %ecx
1400c43a7:     	je	0x1400c43c7 <.text+0xc33c7>
1400c43a9:     	cmpl	$0x1, %ecx
1400c43ac:     	jne	0x1400c43e5 <.text+0xc33e5>
1400c43ae:     	movq	0x68(%rsp), %rcx
1400c43b3:     	movl	0x54(%rsp), %edx
1400c43b7:     	movl	%edx, (%rcx)
1400c43b9:     	movq	0x58(%rsp), %rcx
1400c43be:     	movb	$0x1, 0x10(%rcx)
1400c43c2:     	jmp	0x1400c4264 <.text+0xc3264>
1400c43c7:     	movq	0x40(%rsp), %rcx
1400c43cc:     	movq	%rax, 0x60(%rsp)
1400c43d1:     	callq	0x14007b2e0 <.text+0x7a2e0>
1400c43d6:     	movl	0x3c(%rsp), %r11d
1400c43db:     	movq	0x60(%rsp), %rax
1400c43e0:     	jmp	0x1400c4264 <.text+0xc3264>
1400c43e5:     	movq	0x68(%rsp), %rcx
1400c43ea:     	movl	0x54(%rsp), %edx
1400c43ee:     	movl	%edx, (%rcx)
1400c43f0:     	movq	0x58(%rsp), %rcx
1400c43f5:     	movb	$0x0, 0x10(%rcx)
1400c43f9:     	jmp	0x1400c4264 <.text+0xc3264>


# ready-delay

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c5bf2:     	cmpl	$0x3, %ebx
1400c5bf5:     	jne	0x1400c5c16 <.text+0xc4c16>
1400c5bf7:     	movss	0x5c(%r15), %xmm0
1400c5bfd:     	movl	%r14d, (%r13)
1400c5c01:     	cmpl	$0x1, (%r12)
1400c5c06:     	jne	0x1400c5c36 <.text+0xc4c36>
1400c5c08:     	movss	0x4(%r12), %xmm1
1400c5c0f:     	ucomiss	%xmm0, %xmm1
1400c5c12:     	ja	0x1400c5c22 <.text+0xc4c22>
1400c5c14:     	jmp	0x1400c5c56 <.text+0xc4c56>
1400c5c16:     	movl	%r14d, (%r13)
1400c5c1a:     	movl	$0x0, (%r12)
1400c5c22:     	addq	$0x128, %rsp            # imm = 0x128
1400c5c29:     	popq	%rbx
1400c5c2a:     	popq	%rdi
1400c5c2b:     	popq	%rsi
1400c5c2c:     	popq	%r12
1400c5c2e:     	popq	%r13
1400c5c30:     	popq	%r14
1400c5c32:     	popq	%r15
1400c5c34:     	popq	%rbp
1400c5c35:     	retq
1400c5c36:     	movss	0x5cd52fe(%rip), %xmm1  # 0x145d9af3c
1400c5c3e:     	addss	%xmm0, %xmm1
1400c5c42:     	movl	$0x1, (%r12)
1400c5c4a:     	movss	%xmm1, 0x4(%r12)
1400c5c51:     	ucomiss	%xmm0, %xmm1
1400c5c54:     	ja	0x1400c5c22 <.text+0xc4c22>
1400c5c56:     	movl	%r14d, (%r13)
1400c5c5a:     	movl	$0x0, (%r12)
1400c5c62:     	movq	%rsi, %rcx
1400c5c65:     	callq	0x14007a830 <.text+0x79830>


# body-category

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c2c1b:     	movq	-0x60(%rbp), %rax
1400c2c1f:     	leal	(,%rax,8), %ecx
1400c2c26:     	movabsq	$0x302010000, %rdx      # imm = 0x302010000
1400c2c30:     	shrq	%cl, %rdx
1400c2c33:     	movq	%rdx, 0xc8(%rbp)
1400c2c3a:     	movq	%rax, 0xc0(%rbp)
1400c2c41:     	testq	%rax, %rax
1400c2c44:     	setne	0x10f(%rbp)


# start-admission

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14007b312:     	movq	0x128(%rbp), %rax
14007b319:     	cmpq	$0x4, %rax
14007b31d:     	je	0x14007b340 <.text+0x7a340>
14007b31f:     	cmpl	$0x1, %eax
14007b322:     	jne	0x14007b3ef <.text+0x7a3ef>
14007b328:     	leaq	0x130(%rbp), %rdx
14007b32f:     	leaq	0x58(%rbp), %rcx
14007b333:     	movl	$0x98, %r8d
14007b339:     	callq	0x145bc977b <.text+0x5bc877b>
14007b33e:     	jmp	0x14007b374 <.text+0x7a374>
14007b340:     	leaq	0x130(%rbp), %rdx
14007b347:     	leaq	0x58(%rbp), %rcx
14007b34b:     	movl	$0x98, %r8d
14007b351:     	callq	0x145bc977b <.text+0x5bc877b>
14007b356:     	movq	0x1c8(%rbp), %rdx
14007b35d:     	testq	%rdx, %rdx
14007b360:     	je	0x14007b374 <.text+0x7a374>
14007b362:     	movq	0x1d0(%rbp), %rcx
14007b369:     	movl	$0x1, %r8d
14007b36f:     	callq	0x1400021d0 <.text+0x11d0>


# start-regate

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14007b374:     	movb	$0x1, 0x235(%rbp)
14007b37b:     	leaq	0x128(%rbp), %rcx
14007b382:     	callq	0x140080fa0 <.text+0x7ffa0>
14007b387:     	nop
14007b388:     	movq	0x128(%rbp), %rax
14007b38f:     	movq	%rax, 0x228(%rbp)
14007b396:     	cmpq	$-0x1, %rax
14007b39a:     	je	0x14007b404 <.text+0x7a404>


# auto-install-value

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140248c42:     	leaq	0x100(%rbp), %rdx
140248c49:     	movq	%rsi, %rcx
140248c4c:     	callq	0x140079a80 <.text+0x78a80>
140248c51:     	nop
140248c52:     	movb	%bl, 0x1de(%rbp)
140248c58:     	movb	$0x0, 0x1dd(%rbp)
140248c5f:     	leaq	0x5b75e22(%rip), %rdx   # 0x145dbea88
140248c66:     	leaq	0x100(%rbp), %rdi
140248c6d:     	movl	$0x15, %r8d
140248c73:     	movq	%rdi, %rcx
140248c76:     	callq	0x145b8d010 <.text+0x5b8c010>
140248c7b:     	nop
140248c7c:     	movq	0x100(%rbp), %rdx
140248c83:     	cmpq	$-0x1, %rdx
140248c87:     	je	0x140248d50 <.text+0x247d50>
140248c8d:     	cmpq	$-0x2, %rdx
140248c91:     	jne	0x140248d1d <.text+0x247d1d>
140248c97:     	cmpq	$0x1, 0x118(%rbp)
140248c9f:     	jne	0x140248d0f <.text+0x247d0f>
140248ca1:     	movq	0x110(%rbp), %rcx
140248ca8:     	cmpb	$0x31, (%rcx)
140248cab:     	jne	0x140248d0f <.text+0x247d0f>
140248cad:     	movq	0x108(%rbp), %rdx
140248cb4:     	testq	%rdx, %rdx
140248cb7:     	je	0x140248cc4 <.text+0x247cc4>
140248cb9:     	movl	$0x1, %r8d
140248cbf:     	callq	0x1400021d0 <.text+0x11d0>
140248cc4:     	movb	%bl, 0x1de(%rbp)
140248cca:     	movb	$0x0, 0x1dd(%rbp)
140248cd1:     	movq	%rsi, %rcx
140248cd4:     	callq	0x14007b2e0 <.text+0x7a2e0>


# patch-name-rule

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140151a70:     	cmpq	$0xb, %r13
140151a74:     	jne	0x140151b6c <.text+0x150b6c>
140151a7a:     	movl	(%rcx), %eax
140151a7c:     	movl	$0x63746170, %edx       # imm = 0x63746170
140151a81:     	xorl	%edx, %eax
140151a83:     	movzwl	0x4(%rcx), %edx
140151a87:     	xorl	$0x2d68, %edx           # imm = 0x2D68
140151a8d:     	orl	%eax, %edx
140151a8f:     	jne	0x140151b6c <.text+0x150b6c>
140151a95:     	cmpl	$0x71706d2e, -0x4(%rcx,%r13) # imm = 0x71706D2E
140151a9e:     	jne	0x140151b6c <.text+0x150b6c>
140151aa4:     	movzbl	0x6(%rcx), %eax
140151aa8:     	leal	-0x30(%rax), %edx
140151aab:     	cmpb	$0xa, %dl
140151aae:     	jb	0x140151abc <.text+0x150abc>
140151ab0:     	andb	$-0x21, %al
140151ab2:     	addb	$-0x41, %al
140151ab4:     	cmpb	$0x19, %al
140151ab6:     	ja	0x140151b6c <.text+0x150b6c>


# dialog-dispatch

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400b7f6d:     	leaq	0x5ce42fd(%rip), %rax   # 0x145d9c271
1400b7f74:     	movq	%rax, 0x1e0(%rbp)
1400b7f7b:     	movq	$0x7, 0x1e8(%rbp)
1400b7f86:     	movq	(%r8), %rax
1400b7f89:     	leaq	0x5ce5a58(%rip), %rcx   # 0x145d9d9e8
1400b7f90:     	movslq	(%rcx,%rax,4), %rax
1400b7f94:     	addq	%rcx, %rax
1400b7f97:     	jmpq	*%rax


# dialog-state-headings

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400b7f99:     	cmpq	$-0x1, 0x50(%rbx)
1400b7f9e:     	je	0x1400b814d <.text+0xb714d>
1400b7fa4:     	leaq	0x5ce42cd(%rip), %rcx   # 0x145d9c278
1400b7fab:     	movl	$0x15, %edx
1400b7fb0:     	callq	0x1458da4e0 <.text+0x58d94e0>
1400b7fb5:     	movq	%rdx, %r15
1400b7fb8:     	testq	%rdx, %rdx
1400b7fbb:     	js	0x1400b80c0 <.text+0xb70c0>
1400b7fc1:     	je	0x1400b92a0 <.text+0xb82a0>
1400b7fc7:     	movq	%rax, %r14
1400b7fca:     	callq	0x140002200 <.text+0x1200>
1400b7fcf:     	movl	$0x1, %r13d
1400b7fd5:     	movl	$0x1, %edx
1400b7fda:     	movq	%r15, %rcx
1400b7fdd:     	callq	0x1400021c0 <.text+0x11c0>
1400b7fe2:     	testq	%rax, %rax
1400b7fe5:     	je	0x1400b80c3 <.text+0xb70c3>
1400b7feb:     	movq	%rax, %r12
1400b7fee:     	movq	%rax, %rcx
1400b7ff1:     	movq	%r14, %rdx
1400b7ff4:     	movq	%r15, %r8
1400b7ff7:     	callq	0x145bc977b <.text+0x5bc877b>
1400b7ffc:     	cmpb	$0x1, 0x18(%rsi)
1400b8000:     	jne	0x1400b92b0 <.text+0xb82b0>
1400b8006:     	movl	0x19(%rsi), %eax
1400b8009:     	movl	0x1c(%rsi), %ecx
1400b800c:     	movl	%ecx, 0x3(%rbp)
1400b800f:     	movl	%eax, (%rbp)
1400b8012:     	movq	0x20(%rsi), %rax
1400b8016:     	movzbl	0x28(%rsi), %edx
1400b801a:     	movb	$0x1, %cl
1400b801c:     	jmp	0x1400b92c0 <.text+0xb82c0>
1400b8021:     	addq	$0xa0, %rbx
1400b8028:     	leaq	0x5ce42e8(%rip), %rcx   # 0x145d9c317
1400b802f:     	movl	$0x11, %edx
1400b8034:     	callq	0x1458da4e0 <.text+0x58d94e0>
1400b8039:     	movq	%rdx, %r15
1400b803c:     	testq	%rdx, %rdx
1400b803f:     	js	0x1400b80c0 <.text+0xb70c0>
1400b8041:     	je	0x1400b8beb <.text+0xb7beb>
1400b8047:     	movq	%rax, %r14
1400b804a:     	callq	0x140002200 <.text+0x1200>
1400b804f:     	movl	$0x1, %r13d
1400b8055:     	movl	$0x1, %edx
1400b805a:     	movq	%r15, %rcx
1400b805d:     	callq	0x1400021c0 <.text+0x11c0>
1400b8062:     	testq	%rax, %rax
1400b8065:     	je	0x1400b80c3 <.text+0xb70c3>
1400b8067:     	movq	%rax, %r12
1400b806a:     	movq	%rax, %rcx
1400b806d:     	movq	%r14, %rdx
1400b8070:     	movq	%r15, %r8
1400b8073:     	callq	0x145bc977b <.text+0x5bc877b>
1400b8078:     	cmpb	$0x1, 0x18(%rsi)
1400b807c:     	jne	0x1400b8bfb <.text+0xb7bfb>
1400b8082:     	movl	0x19(%rsi), %eax
1400b8085:     	movl	0x1c(%rsi), %ecx
1400b8088:     	movl	%ecx, 0x25b(%rbp)
1400b808e:     	movl	%eax, 0x258(%rbp)
1400b8094:     	movq	0x20(%rsi), %rax
1400b8098:     	movzbl	0x28(%rsi), %ecx
1400b809c:     	movb	$0x1, %dl
1400b809e:     	jmp	0x1400b8c0b <.text+0xb7c0b>
1400b80a3:     	addq	$0x20, %rbx
1400b80a7:     	leaq	0x5ce4251(%rip), %rcx   # 0x145d9c2ff
1400b80ae:     	movl	$0xb, %edx
1400b80b3:     	callq	0x1458da4e0 <.text+0x58d94e0>
1400b80b8:     	movq	%rdx, %r15
1400b80bb:     	testq	%rdx, %rdx
1400b80be:     	jns	0x1400b80ed <.text+0xb70ed>
1400b80c0:     	xorl	%r13d, %r13d
1400b80c3:     	movq	%r13, %rcx
1400b80c6:     	movq	%r15, %rdx
1400b80c9:     	callq	0x145d6944b <.text+0x5d6844b>
1400b80ce:     	ud2
1400b80d0:     	addq	$0x8, %rbx
1400b80d4:     	leaq	0x5ce422f(%rip), %rcx   # 0x145d9c30a
1400b80db:     	movl	$0xd, %edx
1400b80e0:     	callq	0x1458da4e0 <.text+0x58d94e0>
1400b80e5:     	movq	%rdx, %r15
1400b80e8:     	testq	%rdx, %rdx
1400b80eb:     	js	0x1400b80c0 <.text+0xb70c0>
1400b80ed:     	je	0x1400b817a <.text+0xb717a>
1400b80f3:     	movq	%rax, %r14
1400b80f6:     	callq	0x140002200 <.text+0x1200>
1400b80fb:     	movl	$0x1, %r13d
1400b8101:     	movl	$0x1, %edx
1400b8106:     	movq	%r15, %rcx
1400b8109:     	callq	0x1400021c0 <.text+0x11c0>
1400b810e:     	testq	%rax, %rax
1400b8111:     	je	0x1400b80c3 <.text+0xb70c3>
1400b8113:     	movq	%rax, %r12
1400b8116:     	movq	%rax, %rcx
1400b8119:     	movq	%r14, %rdx
1400b811c:     	movq	%r15, %r8
1400b811f:     	callq	0x145bc977b <.text+0x5bc877b>
1400b8124:     	movzbl	0x18(%rsi), %r13d
1400b8129:     	cmpb	$0x1, %r13b
1400b812d:     	jne	0x1400b818b <.text+0xb718b>
1400b812f:     	movl	0x19(%rsi), %eax
1400b8132:     	movl	0x1c(%rsi), %ecx
1400b8135:     	movl	%ecx, 0x23b(%rbp)
1400b813b:     	movl	%eax, 0x238(%rbp)
1400b8141:     	movq	0x20(%rsi), %rax
1400b8145:     	movzbl	0x28(%rsi), %ecx
1400b8149:     	movb	$0x1, %dl
1400b814b:     	jmp	0x1400b819b <.text+0xb719b>
1400b814d:     	leaq	0x5ce4139(%rip), %rcx   # 0x145d9c28d
1400b8154:     	movl	$0xd, %edx
1400b8159:     	callq	0x1458da4e0 <.text+0x58d94e0>


# failure-buttons

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400b904c:     	leaq	0x5ce32e9(%rip), %rcx   # 0x145d9c33c
1400b9053:     	movl	$0x9, %edx
1400b9058:     	callq	0x1458da4e0 <.text+0x58d94e0>
1400b905d:     	movq	%rax, %r15
1400b9060:     	movq	%rdx, %r12
1400b9063:     	leaq	0x5ce3290(%rip), %rcx   # 0x145d9c2fa
1400b906a:     	movl	$0x5, %edx
1400b906f:     	callq	0x1458da4e0 <.text+0x58d94e0>
1400b9074:     	movb	$0x0, 0x260(%rbp)
1400b907b:     	movq	%r15, 0x268(%rbp)
1400b9082:     	movq	%r12, 0x270(%rbp)
1400b9089:     	movb	$0x1, 0x278(%rbp)
1400b9090:     	movq	%rax, 0x280(%rbp)
1400b9097:     	movq	%rdx, 0x288(%rbp)


# available-buttons

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400ba061:     	leaq	0x5ce2280(%rip), %rcx   # 0x145d9c2e8
1400ba068:     	movl	$0x12, %edx
1400ba06d:     	callq	0x1458da4e0 <.text+0x58d94e0>
1400ba072:     	movq	%rax, %r15
1400ba075:     	movq	%rdx, %r12
1400ba078:     	leaq	0x5ce227b(%rip), %rcx   # 0x145d9c2fa
1400ba07f:     	movl	$0x5, %edx
1400ba084:     	callq	0x1458da4e0 <.text+0x58d94e0>
1400ba089:     	movb	$0x0, 0x260(%rbp)
1400ba090:     	movq	%r15, 0x268(%rbp)
1400ba097:     	movq	%r12, 0x270(%rbp)
1400ba09e:     	movb	$0x1, 0x278(%rbp)
1400ba0a5:     	movq	%rax, 0x280(%rbp)
1400ba0ac:     	movq	%rdx, 0x288(%rbp)


# download-agent-and-open

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140080239:     	callq	0x1403d8f40 <.text+0x3d7f40>
14008023e:     	movq	$0xa, 0x10(%rbp)
140080246:     	movl	$0x0, 0x18(%rbp)
14008024d:     	movq	$0x1e, 0x20(%rbp)
140080255:     	movl	$0x0, 0x28(%rbp)
14008025c:     	leaq	0x5d18386(%rip), %r8    # 0x145d985e9
140080263:     	leaq	0xc0(%rbp), %r12
14008026a:     	movl	$0x16, %r9d
140080270:     	movq	%r12, %rcx
140080273:     	movq	%r15, %rdx
140080276:     	callq	0x1403d8e40 <.text+0x3d7e40>
14008027b:     	movq	%r12, %rcx
14008027e:     	callq	0x1403d91e0 <.text+0x3d81e0>
140080283:     	movq	0x38(%rsi), %rcx
140080287:     	movq	0x40(%rsi), %r8
14008028b:     	shlq	$0x5, %r8
14008028f:     	addq	%rcx, %r8
140080292:     	movq	%rax, 0x1c8(%rbp)
140080299:     	movq	%rdx, 0x1d0(%rbp)
1400802a0:     	movq	%rcx, 0x1d8(%rbp)
1400802a7:     	movq	%r8, 0x1e0(%rbp)
1400802ae:     	movq	$0x0, 0x1f0(%rbp)
1400802b9:     	movq	%r14, 0x1e8(%rbp)
1400802c0:     	callq	0x140002200 <.text+0x1200>
1400802c5:     	movl	$0x8000, %ecx           # imm = 0x8000
1400802ca:     	movl	$0x1, %edx
1400802cf:     	callq	0x1400021f0 <.text+0x11f0>
1400802d4:     	testq	%rax, %rax
1400802d7:     	je	0x140080a2c <.text+0x7fa2c>
1400802dd:     	movq	0x1f8(%rbp), %rcx
1400802e4:     	movq	%rcx, 0xf0(%rbp)
1400802eb:     	movdqu	0x1c8(%rbp), %xmm0
1400802f3:     	movdqu	0x1d8(%rbp), %xmm1
1400802fb:     	movdqu	0x1e8(%rbp), %xmm2
140080303:     	movdqa	%xmm2, 0xe0(%rbp)
14008030b:     	movdqa	%xmm1, 0xd0(%rbp)
140080313:     	movdqa	%xmm0, 0xc0(%rbp)
14008031b:     	movq	%rax, 0xf8(%rbp)
140080322:     	movq	$0x8000, 0x100(%rbp)    # imm = 0x8000
14008032d:     	pxor	%xmm0, %xmm0
140080331:     	movdqu	%xmm0, 0x108(%rbp)
140080339:     	leaq	-0x58(%rbp), %rcx
14008033d:     	leaq	0xc0(%rbp), %rdx
140080344:     	callq	0x14023dd40 <.text+0x23cd40>
140080349:     	movl	$0x0, 0xc0(%rbp)
140080353:     	movq	$0x0, 0xc8(%rbp)
14008035e:     	movl	$0x7, 0xd0(%rbp)
140080368:     	movq	$0x0, 0xd4(%rbp)
140080373:     	movq	$0x0, 0xd9(%rbp)
14008037e:     	movb	$0x1, 0xd9(%rbp)
140080385:     	movb	$0x1, 0xdc(%rbp)
14008038c:     	movb	$0x1, 0xdb(%rbp)
140080393:     	leaq	0xc0(%rbp), %rcx
14008039a:     	movq	%rbx, %rdx
14008039d:     	movq	%rdi, %r8
1400803a0:     	callq	0x145b81b40 <.text+0x5b80b40>


# download-size-and-hash-result

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140080933:     	movq	0x290(%rbp), %r8
14008093a:     	movq	0x2f8(%rbp), %rax
140080941:     	cmpq	0x48(%rax), %rsi
140080945:     	je	0x140080960 <.text+0x7f960>
140080947:     	jmp	0x140080976 <.text+0x7f976>
140080949:     	movl	$0x1, %edi
14008094e:     	xorl	%r8d, %r8d
140080951:     	xorl	%ebx, %ebx
140080953:     	movq	0x2f8(%rbp), %rax
14008095a:     	cmpq	0x48(%rax), %rsi
14008095e:     	jne	0x140080976 <.text+0x7f976>
140080960:     	cmpq	0x28(%rax), %r8
140080964:     	jne	0x140080976 <.text+0x7f976>
140080966:     	movq	0x20(%rax), %rdx
14008096a:     	movq	%rdi, %rcx
14008096d:     	callq	0x145bc9787 <.text+0x5bc8787>
140080972:     	testl	%eax, %eax
140080974:     	je	0x1400809d6 <.text+0x7f9d6>
140080976:     	movq	%rbx, 0x2f8(%rbp)
14008097d:     	movq	%rdi, 0x2c8(%rbp)
140080984:     	leaq	0x5d17c74(%rip), %rdx   # 0x145d985ff
14008098b:     	movl	$0x2b, %r8d
140080991:     	movb	$0x29, %cl
140080993:     	callq	0x145b6d8c0 <.text+0x5b6c8c0>


# stage-failed-publication

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14024995b:     	movq	$0x4, 0x88(%rbp)
140249966:     	movb	$0x0, 0x1de(%rbp)
14024996d:     	leaq	0x88(%rbp), %rdx
140249974:     	movq	0x190(%rbp), %rcx
14024997b:     	callq	0x140079a80 <.text+0x78a80>


# stage-ready-publication

AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402499d6:     	movq	$0x3, 0x88(%rbp)
1402499e1:     	movb	$0x0, 0x1df(%rbp)
1402499e8:     	leaq	0x88(%rbp), %rdx
1402499ef:     	movq	0x190(%rbp), %rcx
1402499f6:     	callq	0x140079a80 <.text+0x78a80>
1402499fb:     	nop

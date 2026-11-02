# touch-resource-id
Disassembly of section .text:

0000000140001000 <.text>:
140028a99:     	movabsq	$-0x51f07fbfe5766863, %r9 # imm = 0xAE0F80401A89979D
140028aa3:     	movq	0x78(%rax), %r8
140028aa7:     	movq	0x80(%rax), %r10
140028aae:     	xorl	%r11d, %r11d
140028ab1:     	movdqa	0x5d44c17(%rip), %xmm0  # 0x145d6d6d0
140028ab9:     	pcmpeqd	%xmm1, %xmm1
140028abd:     	movdqa	0x5d44e5b(%rip), %xmm2  # 0x145d6d920

# touch-resource-descriptor
Disassembly of section .text:

0000000140001000 <.text>:
140028c7f:     	movq	$0x1, -0x60(%rbp)
140028c87:     	movdqu	0x5d45771(%rip), %xmm0  # 0x145d6e400
140028c8f:     	movdqu	%xmm0, -0x58(%rbp)
140028c94:     	movq	$0x8, -0x38(%rbp)
140028c9c:     	movq	$0x80, -0x30(%rbp)
140028ca4:     	leaq	0xafeb5(%rip), %rax     # 0x1400d8b60 <.text+0xd7b60>
140028cab:     	movq	%rax, -0x18(%rbp)

# drag-touch-resource-init
Disassembly of section .text:

0000000140001000 <.text>:
140285bfe:     	movq	%rbx, %rcx
140285c01:     	callq	0x140028a40 <.text+0x27a40>
140285c06:     	nop
140285c07:     	movq	%rax, %r15
140285c0a:     	movq	%rbx, %rcx
140285c0d:     	callq	0x140029b70 <.text+0x28b70>
140285c12:     	nop
140285c13:     	movq	%rax, %r12

# drag-touch-resource-state
Disassembly of section .text:

0000000140001000 <.text>:
140285c60:     	movq	0x468(%rbp), %rax
140285c67:     	movq	%rax, 0x258(%rdi)
140285c6e:     	movq	%r15, 0x260(%rdi)
140285c75:     	movq	%r12, 0x268(%rdi)

# drag-touch-resource-fetch
Disassembly of section .text:

0000000140001000 <.text>:
140285f3f:     	movq	0x260(%rsi), %rax
140285f46:     	movq	0x218(%rbx), %rcx
140285f4d:     	cmpq	%rcx, %rax
140285f50:     	jae	0x140286112 <.text+0x285112>
140285f56:     	movq	0x210(%rbx), %r8
140285f5d:     	movq	(%r8,%rax,8), %rax
140285f61:     	testq	%rax, %rax
140285f64:     	je	0x140286112 <.text+0x285112>
140285f6a:     	movq	0x1e0(%rbx), %rdx
140285f71:     	notq	%rax
140285f74:     	imulq	$0x38, %rax, %rax
140285f78:     	cmpb	$0x0, 0x30(%rdx,%rax)
140285f7d:     	je	0x140286112 <.text+0x285112>

# drag-touch-resource-data
Disassembly of section .text:

0000000140001000 <.text>:
140285fb2:     	addq	%rdx, %rax
140285fb5:     	movq	0x10(%rax), %r10
140285fb9:     	addq	%rdx, %rcx
140285fbc:     	leaq	0x2c(%rax), %rdx
140285fc0:     	addq	$0x28, %rax
140285fc4:     	leaq	0x2c(%r12), %r9
140285fc9:     	addq	$0x28, %r12
140285fcd:     	movq	0x10(%rcx), %r11

# drag-touch-resource-argument
Disassembly of section .text:

0000000140001000 <.text>:
14028602e:     	leaq	0x88(%rsp), %rbx
140286036:     	movq	%r10, 0x88(%rsp)
14028603e:     	movq	%rax, 0x90(%rsp)
140286046:     	movq	%rdx, 0x98(%rsp)
14028604e:     	movl	%r15d, 0xa0(%rsp)
140286056:     	movl	%ebp, 0xa4(%rsp)
14028605d:     	leaq	0xa8(%rsp), %rax
140286065:     	movq	%r11, 0xa8(%rsp)
14028606d:     	movq	%r14, 0xb0(%rsp)
140286075:     	movq	%rcx, 0xb8(%rsp)
14028607d:     	movl	%r15d, 0xc0(%rsp)
140286085:     	movl	%ebp, 0xc4(%rsp)
14028608c:     	movq	%rax, 0x28(%rsp)
140286091:     	movq	%rbx, 0x20(%rsp)
140286096:     	leaq	0x38(%rsp), %rdx
14028609b:     	callq	0x1402788c0 <.text+0x2778c0>

# input-touch-resource-init
Disassembly of section .text:

0000000140001000 <.text>:
144569ca4:     	leaq	0x23936f5(%rip), %rdx   # 0x1468fd3a0
144569cab:     	leaq	-0x50(%rbp), %rcx
144569caf:     	callq	0x14454b120 <.text+0x454a120>
144569cb4:     	nop
144569cb5:     	movq	%rax, %rbx
144569cb8:     	movq	-0x50(%rbp), %rdx
144569cbc:     	testq	%rdx, %rdx
144569cbf:     	je	0x144569cd4 <.text+0x4568cd4>
144569cc1:     	movq	-0x48(%rbp), %rcx
144569cc5:     	shlq	$0x3, %rdx
144569cc9:     	movl	$0x8, %r8d
144569ccf:     	callq	0x1400021d0 <.text+0x11d0>
144569cd4:     	movq	%rdi, %rcx
144569cd7:     	callq	0x144551ff0 <.text+0x4550ff0>

# input-touch-resource-state
Disassembly of section .text:

0000000140001000 <.text>:
144569ced:     	leaq	0x8(%r14), %rcx
144569cf1:     	movq	%rbx, 0x8(%r14)
144569cf5:     	movq	$0x0, 0x10(%r14)
144569cfd:     	movq	%rax, 0x18(%r14)
144569d01:     	movq	%r8, 0x20(%r14)

# input-touch-resource-fetch
Disassembly of section .text:

0000000140001000 <.text>:
144569e8e:     	movq	0x8(%rsi), %rax
144569e92:     	cmpq	0x218(%r8), %rax
144569e99:     	jae	0x144569fe6 <.text+0x4568fe6>
144569e9f:     	movq	%rcx, %rdi
144569ea2:     	movq	0x210(%r8), %rcx
144569ea9:     	movq	(%rcx,%rax,8), %rcx
144569ead:     	testq	%rcx, %rcx
144569eb0:     	je	0x144569fe6 <.text+0x4568fe6>
144569eb6:     	movq	0x1e0(%r8), %rax
144569ebd:     	notq	%rcx
144569ec0:     	imulq	$0x38, %rcx, %rcx
144569ec4:     	cmpb	$0x0, 0x30(%rax,%rcx)
144569ec9:     	je	0x144569fe6 <.text+0x4568fe6>
144569ecf:     	addq	%rcx, %rax
144569ed2:     	movq	0x10(%rax), %rcx
144569ed6:     	movl	0x5b0(%r8), %edx

# input-touch-resource-call
Disassembly of section .text:

0000000140001000 <.text>:
144569f1c:     	movl	0x28(%rsi), %r9d
144569f20:     	addq	%rdx, %r8
144569f23:     	leaq	0x10(%rsi), %r10
144569f27:     	leaq	0x2c(%rax), %r11
144569f2b:     	addq	$0x28, %rax
144569f2f:     	movq	0x10(%r8), %r14
144569f33:     	leaq	0x28(%r8), %r15
144569f37:     	addq	$0x2c, %r8
144569f3b:     	leaq	0x58(%rsp), %rdx
144569f40:     	movq	%r10, 0x58(%rsp)
144569f45:     	movq	%r14, 0x60(%rsp)
144569f4a:     	movq	%r15, 0x68(%rsp)
144569f4f:     	movq	%r8, 0x70(%rsp)
144569f54:     	movl	%r9d, 0x78(%rsp)
144569f59:     	movl	%ebx, 0x7c(%rsp)
144569f5d:     	movq	%rcx, 0x38(%rsp)
144569f62:     	movq	%rax, 0x40(%rsp)
144569f67:     	movq	%r11, 0x48(%rsp)
144569f6c:     	movl	%r9d, 0x50(%rsp)
144569f71:     	movl	%ebx, 0x54(%rsp)
144569f75:     	leaq	0x38(%rsp), %rcx
144569f7a:     	callq	0x144562920 <.text+0x4561920>

# input-clear-three-transient-maps
Disassembly of section .text:

0000000140001000 <.text>:
144562944:     	movq	%rdx, %rbx
144562947:     	movq	%rcx, %rdi
14456294a:     	movq	(%rcx), %rsi
14456294d:     	cmpq	$0x0, 0x38(%rsi)
144562952:     	je	0x1445629aa <.text+0x45619aa>
144562954:     	movl	0x1c(%rdi), %eax
144562957:     	movq	0x10(%rdi), %rcx
14456295b:     	movl	%eax, (%rcx)
14456295d:     	cmpq	$0x0, 0x38(%rsi)
144562962:     	je	0x1445629aa <.text+0x45619aa>
144562964:     	movq	0x28(%rsi), %r8
144562968:     	testq	%r8, %r8
14456296b:     	je	0x14456299c <.text+0x456199c>
14456296d:     	movq	0x20(%rsi), %rcx
144562971:     	addq	$0x11, %r8
144562975:     	movb	$-0x1, %dl
144562977:     	callq	0x145bc9781 <.text+0x5bc8781>
14456297c:     	movq	0x28(%rsi), %rcx
144562980:     	leaq	0x1(%rcx), %rax
144562984:     	movq	%rax, %rdx
144562987:     	shrq	$0x3, %rdx
14456298b:     	andq	$-0x8, %rax
14456298f:     	subq	%rdx, %rax
144562992:     	cmpq	$0x8, %rcx
144562996:     	cmovbq	%rcx, %rax
14456299a:     	jmp	0x14456299e <.text+0x456199e>
14456299c:     	xorl	%eax, %eax
14456299e:     	movq	$0x0, 0x38(%rsi)
1445629a6:     	movq	%rax, 0x30(%rsi)
1445629aa:     	cmpq	$0x0, 0x58(%rsi)
1445629af:     	je	0x144562a07 <.text+0x4561a07>
1445629b1:     	movl	0x1c(%rdi), %eax
1445629b4:     	movq	0x10(%rdi), %rcx
1445629b8:     	movl	%eax, (%rcx)
1445629ba:     	cmpq	$0x0, 0x58(%rsi)
1445629bf:     	je	0x144562a07 <.text+0x4561a07>
1445629c1:     	movq	0x48(%rsi), %r8
1445629c5:     	testq	%r8, %r8
1445629c8:     	je	0x1445629f9 <.text+0x45619f9>
1445629ca:     	movq	0x40(%rsi), %rcx
1445629ce:     	addq	$0x11, %r8
1445629d2:     	movb	$-0x1, %dl
1445629d4:     	callq	0x145bc9781 <.text+0x5bc8781>
1445629d9:     	movq	0x48(%rsi), %rcx
1445629dd:     	leaq	0x1(%rcx), %rax
1445629e1:     	movq	%rax, %rdx
1445629e4:     	shrq	$0x3, %rdx
1445629e8:     	andq	$-0x8, %rax
1445629ec:     	subq	%rdx, %rax
1445629ef:     	cmpq	$0x8, %rcx
1445629f3:     	cmovbq	%rcx, %rax
1445629f7:     	jmp	0x1445629fb <.text+0x45619fb>
1445629f9:     	xorl	%eax, %eax
1445629fb:     	movq	$0x0, 0x58(%rsi)
144562a03:     	movq	%rax, 0x50(%rsi)
144562a07:     	cmpq	$0x0, 0x78(%rsi)
144562a0c:     	je	0x144562a64 <.text+0x4561a64>
144562a0e:     	movl	0x1c(%rdi), %eax
144562a11:     	movq	0x10(%rdi), %rcx
144562a15:     	movl	%eax, (%rcx)
144562a17:     	cmpq	$0x0, 0x78(%rsi)
144562a1c:     	je	0x144562a64 <.text+0x4561a64>
144562a1e:     	movq	0x68(%rsi), %r8
144562a22:     	testq	%r8, %r8
144562a25:     	je	0x144562a56 <.text+0x4561a56>
144562a27:     	movq	0x60(%rsi), %rcx
144562a2b:     	addq	$0x11, %r8
144562a2f:     	movb	$-0x1, %dl
144562a31:     	callq	0x145bc9781 <.text+0x5bc8781>
144562a36:     	movq	0x68(%rsi), %rcx
144562a3a:     	leaq	0x1(%rcx), %rax
144562a3e:     	movq	%rax, %rdx
144562a41:     	shrq	$0x3, %rdx
144562a45:     	andq	$-0x8, %rax
144562a49:     	subq	%rdx, %rax
144562a4c:     	cmpq	$0x8, %rcx
144562a50:     	cmovbq	%rcx, %rax
144562a54:     	jmp	0x144562a58 <.text+0x4561a58>
144562a56:     	xorl	%eax, %eax
144562a58:     	movq	$0x0, 0x78(%rsi)
144562a60:     	movq	%rax, 0x70(%rsi)

# input-preserve-previous-position
Disassembly of section .text:

0000000140001000 <.text>:
144562aa4:     	movq	0x18(%rsi), %rcx
144562aa8:     	testq	%rcx, %rcx
144562aab:     	je	0x144562b50 <.text+0x4561b50>
144562ab1:     	movq	(%rsi), %rdx
144562ab4:     	movdqa	(%rdx), %xmm0
144562ab8:     	pmovmskb	%xmm0, %r9d
144562abd:     	notl	%r9d
144562ac0:     	leaq	0x10(%rdx), %r8
144562ac4:     	jmp	0x144562b1f <.text+0x4561b1f>
144562ac6:     	nopw	%cs:(%rax,%rax)
144562ad0:     	leal	-0x1(%r9), %r10d
144562ad4:     	tzcntl	%r9d, %r11d
144562ad9:     	andl	%r9d, %r10d
144562adc:     	movq	%r11, %r9
144562adf:     	negq	%r9
144562ae2:     	shll	$0x3, %r11d
144562ae6:     	shlq	$0x7, %r9
144562aea:     	subq	%r11, %r9
144562aed:     	movsd	-0x8(%rdx,%r9), %xmm0
144562af4:     	movsd	%xmm0, -0x10(%rdx,%r9)
144562afb:     	movdqu	-0x40(%rdx,%r9), %xmm0
144562b02:     	movdqu	-0x30(%rdx,%r9), %xmm1
144562b09:     	movdqu	%xmm0, -0x60(%rdx,%r9)
144562b10:     	movdqu	%xmm1, -0x50(%rdx,%r9)
144562b17:     	movl	%r10d, %r9d
144562b1a:     	decq	%rcx
144562b1d:     	je	0x144562b50 <.text+0x4561b50>

# input-position-from-event
Disassembly of section .text:

0000000140001000 <.text>:
144562bf0:     	movq	0x30(%r14), %rbp
144562bf4:     	movq	%rbp, 0xc0(%rsp)
144562bfc:     	movsd	0x28(%r14), %xmm7
144562c02:     	movsd	%xmm7, 0xc8(%rsp)
144562c0b:     	movups	(%r14), %xmm0
144562c0f:     	movups	0x10(%r14), %xmm1
144562c14:     	movaps	%xmm0, 0x60(%rsp)
144562c19:     	movaps	%xmm1, 0x70(%rsp)
144562c1e:     	movsd	%xmm7, 0xd0(%rsp)
144562c27:     	movups	(%r14), %xmm0
144562c2b:     	movups	0x10(%r14), %xmm1
144562c30:     	leaq	0x80(%rsp), %rax
144562c38:     	movq	%rdi, 0x40(%rsp)
144562c3d:     	movq	%rsi, %rdi
144562c40:     	movq	%rax, %rsi
144562c43:     	movups	%xmm1, 0x10(%rax)
144562c47:     	movups	%xmm0, (%rax)
144562c4a:     	movsd	%xmm7, 0xd8(%rsp)
144562c53:     	movups	(%r14), %xmm0
144562c57:     	movups	0x10(%r14), %xmm1
144562c5c:     	movups	%xmm1, 0x30(%rax)
144562c60:     	movups	%xmm0, 0x20(%rax)
144562c64:     	movq	%r15, 0x38(%rsp)
144562c69:     	movq	%r13, %r15
144562c6c:     	movq	%rbx, %r13
144562c6f:     	leaq	0x160(%rsp), %rbx
144562c77:     	movq	%rbx, %rcx
144562c7a:     	movq	%rdi, %rdx
144562c7d:     	movq	%rbp, %r8
144562c80:     	movq	%r12, %r9
144562c83:     	callq	0x1445624b0 <.text+0x45614b0>
144562c88:     	movq	%rbp, 0xc0(%rsp)
144562c90:     	movsd	%xmm7, 0xc8(%rsp)
144562c99:     	movups	(%r14), %xmm0
144562c9d:     	movups	0x10(%r14), %xmm1
144562ca2:     	movaps	%xmm0, 0x60(%rsp)
144562ca7:     	movaps	%xmm1, 0x70(%rsp)
144562cac:     	movsd	%xmm7, 0xd0(%rsp)
144562cb5:     	movups	(%r14), %xmm0
144562cb9:     	movups	0x10(%r14), %xmm1
144562cbe:     	movups	%xmm1, 0x10(%rsi)
144562cc2:     	movups	%xmm0, (%rsi)
144562cc5:     	movsd	%xmm7, 0xd8(%rsp)
144562cce:     	movdqu	(%r14), %xmm0
144562cd3:     	movdqu	0x10(%r14), %xmm1
144562cd9:     	movdqu	%xmm1, 0x30(%rsi)
144562cde:     	movdqu	%xmm0, 0x20(%rsi)
144562ce3:     	movq	%rdi, %rsi
144562ce6:     	movq	0x40(%rsp), %rdi
144562ceb:     	movq	%rbx, %rcx
144562cee:     	movq	%r13, %rbx
144562cf1:     	movq	%r15, %r13
144562cf4:     	movq	0x38(%rsp), %r15
144562cf9:     	leaq	0x20(%rsi), %rdx
144562cfd:     	movq	%rbp, %r8
144562d00:     	movq	%r12, %r9
144562d03:     	callq	0x1445624b0 <.text+0x45614b0>

# input-phase-dispatch
Disassembly of section .text:

0000000140001000 <.text>:
144562d4d:     	incq	(%r13)
144562d51:     	movl	0x34(%rsp), %eax
144562d55:     	movq	0x58(%rsp), %rcx
144562d5a:     	movl	%eax, (%rcx)
144562d5c:     	movzbl	0x38(%r14), %eax
144562d61:     	movslq	(%rbx,%rax,4), %rax
144562d65:     	addq	%rbx, %rax
144562d68:     	jmpq	*%rax

# pressed-map-iterator
Disassembly of section .text:

0000000140001000 <.text>:
143608050:     	movq	%rcx, %rax
143608053:     	movq	(%rdx), %rcx
143608056:     	movq	0x8(%rdx), %r8
14360805a:     	addq	%rcx, %r8
14360805d:     	incq	%r8
143608060:     	movdqa	(%rcx), %xmm0
143608064:     	pmovmskb	%xmm0, %r9d
143608069:     	notl	%r9d
14360806c:     	movq	0x18(%rdx), %rdx
143608070:     	movq	%rcx, (%rax)
143608073:     	addq	$0x10, %rcx
143608077:     	movq	%rcx, 0x8(%rax)
14360807b:     	movq	%r8, 0x10(%rax)
14360807f:     	movw	%r9w, 0x18(%rax)
143608084:     	movq	%rdx, 0x20(%rax)
143608088:     	retq

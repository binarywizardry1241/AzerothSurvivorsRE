
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140ce3bd0:     	pushq	%r15
140ce3bd2:     	pushq	%r14
140ce3bd4:     	pushq	%r13
140ce3bd6:     	pushq	%r12
140ce3bd8:     	pushq	%rsi
140ce3bd9:     	pushq	%rdi
140ce3bda:     	pushq	%rbp
140ce3bdb:     	pushq	%rbx
140ce3bdc:     	subq	$0x98, %rsp
140ce3be3:     	movq	0x18(%rcx), %rsi
140ce3be7:     	cmpq	$0x0, 0x50(%rsi)
140ce3bec:     	je	0x140ce3c96 <.text+0xce2c96>
140ce3bf2:     	movq	(%rdx), %rax
140ce3bf5:     	movq	0x8(%rdx), %r8
140ce3bf9:     	movq	%r8, %r11
140ce3bfc:     	shrq	$0x39, %r11
140ce3c00:     	movq	0x38(%rsi), %r9
140ce3c04:     	movq	0x40(%rsi), %r10
140ce3c08:     	movd	%r11d, %xmm0
140ce3c0d:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
140ce3c11:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
140ce3c16:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
140ce3c1b:     	xorl	%r11d, %r11d
140ce3c1e:     	pcmpeqd	%xmm1, %xmm1
140ce3c22:     	movq	%r8, %rdi
140ce3c25:     	andq	%r10, %rdi
140ce3c28:     	movdqu	(%r9,%rdi), %xmm2
140ce3c2e:     	movdqa	%xmm2, %xmm3
140ce3c32:     	pcmpeqb	%xmm0, %xmm3
140ce3c36:     	pmovmskb	%xmm3, %ebx
140ce3c3a:     	testl	%ebx, %ebx
140ce3c3c:     	je	0x140ce3c70 <.text+0xce2c70>
140ce3c3e:     	tzcntl	%ebx, %r14d
140ce3c43:     	addq	%rdi, %r14
140ce3c46:     	andq	%r10, %r14
140ce3c49:     	negq	%r14
140ce3c4c:     	leaq	(%r14,%r14,2), %r14
140ce3c50:     	movq	-0x10(%r9,%r14,8), %r15
140ce3c55:     	xorq	%r8, %r15
140ce3c58:     	movq	-0x18(%r9,%r14,8), %r12
140ce3c5d:     	xorq	%rax, %r12
140ce3c60:     	orq	%r15, %r12
140ce3c63:     	je	0x140ce3c89 <.text+0xce2c89>
140ce3c65:     	leal	-0x1(%rbx), %ebp
140ce3c68:     	andw	%bx, %bp
140ce3c6b:     	movl	%ebp, %ebx
140ce3c6d:     	jne	0x140ce3c3e <.text+0xce2c3e>
140ce3c6f:     	nop
140ce3c70:     	pcmpeqb	%xmm1, %xmm2
140ce3c74:     	pmovmskb	%xmm2, %ebx
140ce3c78:     	testl	%ebx, %ebx
140ce3c7a:     	jne	0x140ce3c9d <.text+0xce2c9d>
140ce3c7c:     	addq	%r11, %rdi
140ce3c7f:     	addq	$0x10, %rdi
140ce3c83:     	addq	$0x10, %r11
140ce3c87:     	jmp	0x140ce3c25 <.text+0xce2c25>
140ce3c89:     	leaq	(%r9,%r14,8), %rax
140ce3c8d:     	movq	-0x8(%rax), %rax
140ce3c91:     	jmp	0x140ce3eaf <.text+0xce2eaf>
140ce3c96:     	movq	(%rdx), %rax
140ce3c99:     	movq	0x8(%rdx), %r8
140ce3c9d:     	movzbl	0x60(%rsi), %r9d
140ce3ca2:     	movq	%r8, %r11
140ce3ca5:     	shrq	$0x39, %r11
140ce3ca9:     	movq	0xa0(%rsi), %r9
140ce3cb0:     	movq	0xa8(%rsi), %r10
140ce3cb7:     	movd	%r11d, %xmm0
140ce3cbc:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
140ce3cc0:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
140ce3cc5:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
140ce3cca:     	xorl	%r11d, %r11d
140ce3ccd:     	pcmpeqd	%xmm1, %xmm1
140ce3cd1:     	movq	%r8, %rbx
140ce3cd4:     	andq	%r10, %rbx
140ce3cd7:     	movdqu	(%r9,%rbx), %xmm2
140ce3cdd:     	movdqa	%xmm2, %xmm3
140ce3ce1:     	pcmpeqb	%xmm0, %xmm3
140ce3ce5:     	pmovmskb	%xmm3, %r15d
140ce3cea:     	testl	%r15d, %r15d
140ce3ced:     	je	0x140ce3d30 <.text+0xce2d30>
140ce3cef:     	tzcntl	%r15d, %r14d
140ce3cf4:     	addq	%rbx, %r14
140ce3cf7:     	andq	%r10, %r14
140ce3cfa:     	movq	%r14, %r12
140ce3cfd:     	shlq	$0x7, %r12
140ce3d01:     	movq	%r9, %rdi
140ce3d04:     	subq	%r12, %rdi
140ce3d07:     	movq	-0x78(%rdi), %r12
140ce3d0b:     	xorq	%r8, %r12
140ce3d0e:     	movq	-0x80(%rdi), %r13
140ce3d12:     	xorq	%rax, %r13
140ce3d15:     	orq	%r12, %r13
140ce3d18:     	je	0x140ce3d4d <.text+0xce2d4d>
140ce3d1a:     	leal	-0x1(%r15), %edi
140ce3d1e:     	andw	%r15w, %di
140ce3d22:     	movl	%edi, %r15d
140ce3d25:     	jne	0x140ce3cef <.text+0xce2cef>
140ce3d27:     	nopw	(%rax,%rax)
140ce3d30:     	pcmpeqb	%xmm1, %xmm2
140ce3d34:     	pmovmskb	%xmm2, %edi
140ce3d38:     	testl	%edi, %edi
140ce3d3a:     	jne	0x140ce3dc5 <.text+0xce2dc5>
140ce3d40:     	addq	%r11, %rbx
140ce3d43:     	addq	$0x10, %rbx
140ce3d47:     	addq	$0x10, %r11
140ce3d4b:     	jmp	0x140ce3cd4 <.text+0xce2cd4>
140ce3d4d:     	leaq	-0x10(%r14), %rax
140ce3d51:     	andq	%r10, %rax
140ce3d54:     	movdqu	(%r9,%rax), %xmm0
140ce3d5a:     	pcmpeqd	%xmm1, %xmm1
140ce3d5e:     	pcmpeqb	%xmm1, %xmm0
140ce3d62:     	pmovmskb	%xmm0, %r8d
140ce3d67:     	movdqu	(%r9,%r14), %xmm0
140ce3d6d:     	pcmpeqb	%xmm1, %xmm0
140ce3d71:     	pmovmskb	%xmm0, %r10d
140ce3d76:     	movw	$0x1f, %r11w
140ce3d7b:     	bsrw	%r8w, %r11w
140ce3d80:     	xorl	$0xf, %r11d
140ce3d84:     	orl	$0x10000, %r10d         # imm = 0x10000
140ce3d8b:     	tzcntl	%r10d, %r10d
140ce3d90:     	addl	%r11d, %r10d
140ce3d93:     	movb	$-0x80, %r8b
140ce3d96:     	cmpw	$0xf, %r10w
140ce3d9b:     	ja	0x140ce3da7 <.text+0xce2da7>
140ce3d9d:     	incq	0xb0(%rsi)
140ce3da4:     	movb	$-0x1, %r8b
140ce3da7:     	movb	%r8b, (%r9,%r14)
140ce3dab:     	movb	%r8b, 0x10(%r9,%rax)
140ce3db0:     	decq	0xb8(%rsi)
140ce3db7:     	movq	-0x70(%rdi), %rax
140ce3dbb:     	cmpq	$0x2, %rax
140ce3dbf:     	jne	0x140ce3e4c <.text+0xce2e4c>
140ce3dc5:     	movq	0x20(%rcx), %rax
140ce3dc9:     	movq	(%rax), %rdi
140ce3dcc:     	leaq	0x1(%rdi), %rcx
140ce3dd0:     	movq	%rcx, (%rax)
140ce3dd3:     	movw	$0x100, 0x78(%rsp)      # imm = 0x100
140ce3dda:     	movq	$0x1, 0x28(%rsp)
140ce3de3:     	movdqu	0x4de9de5(%rip), %xmm0  # 0x145acdbd0
140ce3deb:     	movdqu	%xmm0, 0x30(%rsp)
140ce3df1:     	movq	$0x8, 0x50(%rsp)
140ce3dfa:     	movq	$0x60, 0x58(%rsp)
140ce3e03:     	leaq	-0x7de66a(%rip), %rax   # 0x1405057a0 <.text+0x5047a0>
140ce3e0a:     	movq	%rax, 0x70(%rsp)
140ce3e0f:     	movb	$0x1, 0x7a(%rsp)
140ce3e14:     	movq	$0x0, 0x40(%rsp)
140ce3e1d:     	movb	$0x2, 0x60(%rsp)
140ce3e22:     	leaq	0x28(%rsp), %r8
140ce3e27:     	movq	%rsi, %rcx
140ce3e2a:     	movq	%rdx, %rbx
140ce3e2d:     	movq	%rdi, %rdx
140ce3e30:     	callq	0x140044810 <.text+0x43810>
140ce3e35:     	addq	$0x38, %rsi
140ce3e39:     	movq	%rsi, %rcx
140ce3e3c:     	movq	%rbx, %rdx
140ce3e3f:     	movq	%rdi, %r8
140ce3e42:     	callq	0x14000ecd0 <.text+0xdcd0>
140ce3e47:     	movq	%rdi, %rax
140ce3e4a:     	jmp	0x140ce3eaf <.text+0xce2eaf>
140ce3e4c:     	movq	-0x8(%rdi), %rdx
140ce3e50:     	movq	%rdx, 0x90(%rsp)
140ce3e58:     	movups	-0x18(%rdi), %xmm0
140ce3e5c:     	movups	%xmm0, 0x80(%rsp)
140ce3e64:     	movups	-0x28(%rdi), %xmm0
140ce3e68:     	movups	%xmm0, 0x70(%rsp)
140ce3e6d:     	movdqu	-0x68(%rdi), %xmm0
140ce3e72:     	movdqu	-0x58(%rdi), %xmm1
140ce3e77:     	movdqu	-0x48(%rdi), %xmm2
140ce3e7c:     	movdqu	-0x38(%rdi), %xmm3
140ce3e81:     	movdqu	%xmm3, 0x60(%rsp)
140ce3e87:     	movdqu	%xmm2, 0x50(%rsp)
140ce3e8d:     	movdqu	%xmm1, 0x40(%rsp)
140ce3e93:     	movdqu	%xmm0, 0x30(%rsp)
140ce3e99:     	movq	%rax, 0x28(%rsp)
140ce3e9e:     	leaq	0x28(%rsp), %rax
140ce3ea3:     	movq	%rcx, %rdx
140ce3ea6:     	movq	%rax, %rcx
140ce3ea9:     	callq	0x144e17460 <.text+0x4e16460>
140ce3eae:     	nop
140ce3eaf:     	addq	$0x98, %rsp
140ce3eb6:     	popq	%rbx
140ce3eb7:     	popq	%rbp
140ce3eb8:     	popq	%rdi
140ce3eb9:     	popq	%rsi
140ce3eba:     	popq	%r12
140ce3ebc:     	popq	%r13
140ce3ebe:     	popq	%r14
140ce3ec0:     	popq	%r15
140ce3ec2:     	retq


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14016d940:     	movsd	0xc(%rsi), %xmm8
14016d946:     	movsd	0x14(%rsi), %xmm7
14016d94b:     	movsd	0x1c(%rsi), %xmm6
14016d950:     	cmpq	$0x0, 0x18(%rcx)
14016d955:     	je	0x14016d9d6 <.text+0x16c9d6>
14016d957:     	movq	(%rcx), %rax
14016d95a:     	movq	0x8(%rcx), %rcx
14016d95e:     	movabsq	$0x5317300c6b349d75, %rdx # imm = 0x5317300C6B349D75
14016d968:     	xorl	%r8d, %r8d
14016d96b:     	movdqa	0x5c0034d(%rip), %xmm0  # 0x145d6dcc0
14016d973:     	pcmpeqd	%xmm1, %xmm1
14016d977:     	andq	%rcx, %rdx
14016d97a:     	movdqu	(%rax,%rdx), %xmm2
14016d97f:     	movdqa	%xmm2, %xmm3
14016d983:     	pcmpeqb	%xmm0, %xmm3
14016d987:     	pmovmskb	%xmm3, %r9d
14016d98c:     	testl	%r9d, %r9d
14016d98f:     	je	0x14016d9bb <.text+0x16c9bb>
14016d991:     	tzcntl	%r9d, %r10d
14016d996:     	addq	%rdx, %r10
14016d999:     	andq	%rcx, %r10
14016d99c:     	shlq	$0x2, %r10
14016d9a0:     	movq	%rax, %r11
14016d9a3:     	subq	%r10, %r11
14016d9a6:     	cmpw	$0x0, -0x4(%r11)
14016d9ac:     	je	0x14016da14 <.text+0x16ca14>
14016d9ae:     	leal	-0x1(%r9), %r10d
14016d9b2:     	andw	%r9w, %r10w
14016d9b6:     	movl	%r10d, %r9d
14016d9b9:     	jne	0x14016d991 <.text+0x16c991>
14016d9bb:     	pcmpeqb	%xmm1, %xmm2
14016d9bf:     	pmovmskb	%xmm2, %r9d
14016d9c4:     	testl	%r9d, %r9d
14016d9c7:     	jne	0x14016d9d6 <.text+0x16c9d6>
14016d9c9:     	addq	%r8, %rdx
14016d9cc:     	addq	$0x10, %rdx
14016d9d0:     	addq	$0x10, %r8
14016d9d4:     	jmp	0x14016d977 <.text+0x16c977>
14016d9d6:     	leaq	0x20(%rsp), %rcx
14016d9db:     	movq	%rdi, %rdx
14016d9de:     	callq	0x143608050 <.text+0x3607050>
14016d9e3:     	cmpq	$0x0, 0x40(%rsp)
14016d9e9:     	je	0x14016db76 <.text+0x16cb76>
14016d9ef:     	cmpw	$0x0, 0x38(%rsp)
14016d9f5:     	jne	0x14016da14 <.text+0x16ca14>
14016d9f7:     	movq	0x28(%rsp), %rax
14016d9fc:     	nopl	(%rax)
14016da00:     	movdqa	(%rax), %xmm0
14016da04:     	addq	$0x10, %rax
14016da08:     	pmovmskb	%xmm0, %ecx
14016da0c:     	cmpl	$0xffff, %ecx           # imm = 0xFFFF
14016da12:     	je	0x14016da00 <.text+0x16ca00>
14016da14:     	movaps	%xmm9, 0x20(%rsp)
14016da1a:     	movlps	%xmm10, 0x30(%rsp)
14016da20:     	leaq	0x50(%rsp), %rcx
14016da25:     	leaq	0x20(%rsp), %rdx
14016da2a:     	callq	0x1400118b0 <.text+0x108b0>
14016da2f:     	cmpb	$0x1, 0x50(%rsp)
14016da34:     	je	0x14016dbc7 <.text+0x16cbc7>
14016da3a:     	movq	0x58(%rsp), %rax
14016da3f:     	cmpl	$0x1, (%rax)
14016da42:     	jne	0x14016dab3 <.text+0x16cab3>
14016da44:     	movupd	0x8(%rax), %xmm0
14016da49:     	pxor	%xmm2, %xmm2
14016da4d:     	ucomisd	%xmm2, %xmm0
14016da51:     	jb	0x14016dab3 <.text+0x16cab3>
14016da53:     	movsd	0x10(%rax), %xmm1
14016da58:     	ucomisd	%xmm2, %xmm1
14016da5c:     	jb	0x14016dab3 <.text+0x16cab3>
14016da5e:     	movl	0xc0(%rax), %ecx
14016da64:     	xorps	%xmm2, %xmm2
14016da67:     	cvtsi2sd	%rcx, %xmm2
14016da6c:     	ucomisd	%xmm0, %xmm2
14016da70:     	jbe	0x14016dab3 <.text+0x16cab3>
14016da72:     	movl	0xc4(%rax), %ecx
14016da78:     	xorps	%xmm2, %xmm2
14016da7b:     	cvtsi2sd	%rcx, %xmm2
14016da80:     	ucomisd	%xmm1, %xmm2
14016da84:     	jbe	0x14016dab3 <.text+0x16cab3>
14016da86:     	cvtpd2ps	%xmm0, %xmm0
14016da8a:     	leaq	0xc8(%rax), %rcx
14016da91:     	leaq	0xbc(%rax), %rdx
14016da98:     	cmpb	$0x0, 0xb8(%rax)
14016da9f:     	cmovneq	%rdx, %rcx
14016daa3:     	movss	(%rcx), %xmm1
14016daa7:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
14016daab:     	divps	%xmm1, %xmm0
14016daae:     	jmp	0x14016db47 <.text+0x16cb47>
14016dab3:     	leaq	0x20(%rsp), %rcx
14016dab8:     	movq	%rdi, %rdx
14016dabb:     	callq	0x143608050 <.text+0x3607050>
14016dac0:     	movq	0x40(%rsp), %rax
14016dac5:     	testq	%rax, %rax
14016dac8:     	je	0x14016dbc7 <.text+0x16cbc7>
14016dace:     	movzwl	0x38(%rsp), %edx
14016dad3:     	movq	0x20(%rsp), %rcx
14016dad8:     	testw	%dx, %dx
14016dadb:     	jne	0x14016db16 <.text+0x16cb16>
14016dadd:     	movq	0x28(%rsp), %r8
14016dae2:     	nopw	%cs:(%rax,%rax)
14016daf0:     	movdqa	(%r8), %xmm0
14016daf5:     	addq	$-0x880, %rcx           # imm = 0xF780
14016dafc:     	addq	$0x10, %r8
14016db00:     	pmovmskb	%xmm0, %edx
14016db04:     	xorl	$0xffff, %edx           # imm = 0xFFFF
14016db0a:     	je	0x14016daf0 <.text+0x16caf0>
14016db0c:     	movq	%r8, 0x28(%rsp)
14016db11:     	movq	%rcx, 0x20(%rsp)
14016db16:     	leal	-0x1(%rdx), %r8d
14016db1a:     	tzcntl	%edx, %r9d
14016db1f:     	andl	%edx, %r8d
14016db22:     	movw	%r8w, 0x38(%rsp)
14016db28:     	movq	%r9, %rdx
14016db2b:     	negq	%rdx
14016db2e:     	shll	$0x3, %r9d
14016db32:     	shlq	$0x7, %rdx
14016db36:     	subq	%r9, %rdx
14016db39:     	decq	%rax
14016db3c:     	movq	%rax, 0x40(%rsp)
14016db41:     	movsd	-0x8(%rcx,%rdx), %xmm0
14016db47:     	subps	%xmm8, %xmm0
14016db4b:     	testb	$0x1, %r14b
14016db4f:     	je	0x14016dbb8 <.text+0x16cbb8>
14016db51:     	movss	(%r15), %xmm1
14016db56:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
14016db5a:     	divps	%xmm1, %xmm0
14016db5d:     	addps	%xmm0, %xmm6
14016db60:     	maxps	0x5c48289(%rip), %xmm6  # 0x145db5df0
14016db67:     	movl	%ebp, (%rbx)
14016db69:     	minps	0x5c48290(%rip), %xmm6  # 0x145db5e00
14016db70:     	movlps	%xmm6, 0x28(%rsi)
14016db74:     	jmp	0x14016dbc7 <.text+0x16cbc7>
14016db76:     	movl	%ebp, (%rbx)
14016db78:     	movb	$0x2, 0x24(%rsi)
14016db7c:     	movq	%rsi, %rcx
14016db7f:     	movaps	0x60(%rsp), %xmm6
14016db84:     	movaps	0x70(%rsp), %xmm7
14016db89:     	movaps	0x80(%rsp), %xmm8
14016db92:     	movaps	0x90(%rsp), %xmm9
14016db9b:     	movaps	0xa0(%rsp), %xmm10
14016dba4:     	addq	$0xb8, %rsp
14016dbab:     	popq	%rbx
14016dbac:     	popq	%rbp
14016dbad:     	popq	%rdi
14016dbae:     	popq	%rsi
14016dbaf:     	popq	%r14
14016dbb1:     	popq	%r15
14016dbb3:     	jmp	0x1401661e0 <.text+0x1651e0>
14016dbb8:     	movl	%ebp, (%rbx)
14016dbba:     	movl	$0x1, (%rsi)
14016dbc0:     	addps	%xmm0, %xmm7
14016dbc3:     	movlps	%xmm7, 0x4(%rsi)

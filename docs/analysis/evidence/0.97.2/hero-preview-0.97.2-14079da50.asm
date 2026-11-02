
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14079da50:     	pushq	%rbp
14079da51:     	pushq	%r14
14079da53:     	pushq	%rsi
14079da54:     	pushq	%rdi
14079da55:     	pushq	%rbx
14079da56:     	subq	$0x80, %rsp
14079da5d:     	leaq	0x80(%rsp), %rbp
14079da65:     	movq	$-0x2, -0x8(%rbp)
14079da6d:     	movq	%r8, %rdi
14079da70:     	movq	%rcx, %rsi
14079da73:     	movq	0x30(%rdx), %r14
14079da77:     	testq	%r14, %r14
14079da7a:     	je	0x14079daf5 <.text+0x79caf5>
14079da7c:     	movq	%rdx, %rbx
14079da7f:     	movl	0x50(%rdx), %eax
14079da82:     	lock
14079da83:     	incq	(%r14)
14079da86:     	jle	0x14079dbcf <.text+0x79cbcf>
14079da8c:     	movq	0x38(%rbx), %rcx
14079da90:     	lock
14079da91:     	incq	(%rcx)
14079da94:     	jle	0x14079dbcf <.text+0x79cbcf>
14079da9a:     	movq	0x40(%rbx), %rdx
14079da9e:     	movl	0x48(%rbx), %r8d
14079daa2:     	movq	%r14, -0x30(%rbp)
14079daa6:     	movq	%rcx, -0x28(%rbp)
14079daaa:     	movq	%rdx, -0x20(%rbp)
14079daae:     	movl	%r8d, -0x18(%rbp)
14079dab2:     	movl	%eax, -0x10(%rbp)
14079dab5:     	movq	%r9, 0x20(%rsp)
14079daba:     	movb	$0x0, 0x28(%rsp)
14079dabf:     	leaq	-0x48(%rbp), %rcx
14079dac3:     	leaq	-0x30(%rbp), %r8
14079dac7:     	movq	%rbx, %rdx
14079daca:     	movq	%rdi, %r9
14079dacd:     	callq	0x1407db730 <.text+0x7da730>
14079dad2:     	nop
14079dad3:     	cmpb	$0x2, -0x48(%rbp)
14079dad7:     	jne	0x14079db25 <.text+0x79cb25>
14079dad9:     	movb	$0x1, 0x58(%rbx)
14079dadd:     	cmpb	$0x1, (%rdi)
14079dae0:     	jne	0x14079db3c <.text+0x79cb3c>
14079dae2:     	movups	0x1(%rdi), %xmm0
14079dae6:     	movups	%xmm0, 0x1(%rsi)
14079daea:     	movb	$0x1, (%rsi)
14079daed:     	lock
14079daee:     	decq	(%r14)
14079daf1:     	je	0x14079db5b <.text+0x79cb5b>
14079daf3:     	jmp	0x14079db65 <.text+0x79cb65>
14079daf5:     	movl	0x7202445(%rip), %eax   # 0x14799ff40
14079dafb:     	testl	%eax, %eax
14079dafd:     	jne	0x14079db7a <.text+0x79cb7a>
14079daff:     	cmpb	$0x0, 0x720243e(%rip)   # 0x14799ff44
14079db06:     	jne	0x14079db93 <.text+0x79cb93>
14079db0c:     	cmpb	$0x0, (%rdi)
14079db0f:     	je	0x14079dbad <.text+0x79cbad>
14079db15:     	movups	0x1(%rdi), %xmm0
14079db19:     	movups	%xmm0, 0x1(%rsi)
14079db1d:     	movb	$0x1, (%rsi)
14079db20:     	jmp	0x14079dbbe <.text+0x79cbbe>
14079db25:     	movq	-0x38(%rbp), %rax
14079db29:     	movq	%rax, 0x10(%rsi)
14079db2d:     	movups	-0x48(%rbp), %xmm0
14079db31:     	movups	%xmm0, (%rsi)
14079db34:     	lock
14079db35:     	decq	(%r14)
14079db38:     	je	0x14079db5b <.text+0x79cb5b>
14079db3a:     	jmp	0x14079db65 <.text+0x79cb65>
14079db3c:     	movq	0x8(%rdi), %rax
14079db40:     	lock
14079db41:     	incq	(%rax)
14079db44:     	jle	0x14079dbcf <.text+0x79cbcf>
14079db4a:     	movq	%rax, 0x8(%rsi)
14079db4e:     	movb	$0x0, (%rsi)
14079db51:     	movq	-0x30(%rbp), %r14
14079db55:     	lock
14079db56:     	decq	(%r14)
14079db59:     	jne	0x14079db65 <.text+0x79cb65>
14079db5b:     	leaq	-0x30(%rbp), %rcx
14079db5f:     	callq	0x143df8960 <.text+0x3df7960>
14079db64:     	nop
14079db65:     	movq	-0x28(%rbp), %rax
14079db69:     	lock
14079db6a:     	decq	(%rax)
14079db6d:     	jne	0x14079dbbe <.text+0x79cbbe>
14079db6f:     	leaq	-0x28(%rbp), %rcx
14079db73:     	callq	0x143df83c0 <.text+0x3df73c0>
14079db78:     	jmp	0x14079dbbe <.text+0x79cbbe>
14079db7a:     	leaq	0x72023bf(%rip), %rcx   # 0x14799ff40
14079db81:     	callq	0x145762fc6 <.text+0x5761fc6>
14079db86:     	cmpb	$0x0, 0x72023b7(%rip)   # 0x14799ff44
14079db8d:     	je	0x14079db0c <.text+0x79cb0c>
14079db93:     	leaq	0x525ca36(%rip), %rcx   # 0x1459fa5d0
14079db9a:     	movl	$0x77, %edx
14079db9f:     	callq	0x1456f5b80 <.text+0x56f4b80>
14079dba4:     	cmpb	$0x0, (%rdi)
14079dba7:     	jne	0x14079db15 <.text+0x79cb15>
14079dbad:     	movq	0x8(%rdi), %rax
14079dbb1:     	lock
14079dbb2:     	incq	(%rax)
14079dbb5:     	jle	0x14079dbcf <.text+0x79cbcf>
14079dbb7:     	movq	%rax, 0x8(%rsi)
14079dbbb:     	movb	$0x0, (%rsi)
14079dbbe:     	movq	%rsi, %rax
14079dbc1:     	addq	$0x80, %rsp
14079dbc8:     	popq	%rbx
14079dbc9:     	popq	%rdi
14079dbca:     	popq	%rsi
14079dbcb:     	popq	%r14
14079dbcd:     	popq	%rbp
14079dbce:     	retq
14079dbcf:     	ud2


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145529990:     	pushq	%rbp
145529991:     	pushq	%r15
145529993:     	pushq	%r14
145529995:     	pushq	%r13
145529997:     	pushq	%r12
145529999:     	pushq	%rsi
14552999a:     	pushq	%rdi
14552999b:     	pushq	%rbx
14552999c:     	subq	$0x78, %rsp
1455299a0:     	leaq	0x70(%rsp), %rbp
1455299a5:     	movq	$-0x2, (%rbp)
1455299ad:     	movq	%rdx, %rdi
1455299b0:     	movq	%rcx, %rsi
1455299b3:     	movq	(%rdx), %rax
1455299b6:     	movq	0x8(%rdx), %rdx
1455299ba:     	movq	0x10(%rdi), %rcx
1455299be:     	nop
1455299c0:     	cmpq	%rdx, %rcx
1455299c3:     	je	0x145529a41 <.text+0x5528a41>
1455299c5:     	leaq	0x1(%rdx), %r8
1455299c9:     	movq	%r8, 0x8(%rdi)
1455299cd:     	movzbl	0x18(%rdi,%rdx), %ebx
1455299d2:     	movq	%r8, %rdx
1455299d5:     	cmpb	(%rax), %bl
1455299d7:     	je	0x1455299c0 <.text+0x55289c0>
1455299d9:     	callq	0x140002200 <.text+0x1200>
1455299de:     	movl	$0x8, %ecx
1455299e3:     	movl	$0x1, %edx
1455299e8:     	callq	0x1400021c0 <.text+0x11c0>
1455299ed:     	testq	%rax, %rax
1455299f0:     	je	0x145529aea <.text+0x5528aea>
1455299f6:     	movb	%bl, (%rax)
1455299f8:     	movq	$0x8, -0x18(%rbp)
145529a00:     	movq	%rax, -0x10(%rbp)
145529a04:     	movq	$0x1, -0x8(%rbp)
145529a0c:     	movups	(%rdi), %xmm0
145529a0f:     	movups	0x10(%rdi), %xmm1
145529a13:     	movaps	%xmm1, -0x30(%rbp)
145529a17:     	movaps	%xmm0, -0x40(%rbp)
145529a1b:     	movq	-0x30(%rbp), %r14
145529a1f:     	movq	-0x38(%rbp), %r8
145529a23:     	cmpq	%r14, %r8
145529a26:     	jne	0x145529a6c <.text+0x5528a6c>
145529a28:     	movq	-0x8(%rbp), %rax
145529a2c:     	movq	%rax, 0x10(%rsi)
145529a30:     	movq	-0x18(%rbp), %rax
145529a34:     	movq	%rax, (%rsi)
145529a37:     	movq	-0x10(%rbp), %rax
145529a3b:     	movq	%rax, 0x8(%rsi)
145529a3f:     	jmp	0x145529a58 <.text+0x5528a58>
145529a41:     	movq	$0x0, (%rsi)
145529a48:     	movq	$0x1, 0x8(%rsi)
145529a50:     	movq	$0x0, 0x10(%rsi)
145529a58:     	movq	%rsi, %rax
145529a5b:     	addq	$0x78, %rsp
145529a5f:     	popq	%rbx
145529a60:     	popq	%rdi
145529a61:     	popq	%rsi
145529a62:     	popq	%r12
145529a64:     	popq	%r13
145529a66:     	popq	%r14
145529a68:     	popq	%r15
145529a6a:     	popq	%rbp
145529a6b:     	retq
145529a6c:     	movq	-0x40(%rbp), %r15
145529a70:     	movl	$0x1, %edi
145529a75:     	leaq	-0x18(%rbp), %rcx
145529a79:     	movzbl	(%r15), %edx
145529a7d:     	movq	%r8, %r13
145529a80:     	movzbl	-0x28(%rbp,%r13), %ebx
145529a86:     	cmpb	%dl, %bl
145529a88:     	jne	0x145529aa0 <.text+0x5528aa0>
145529a8a:     	incq	%r13
145529a8d:     	cmpq	%r13, %r14
145529a90:     	jne	0x145529a80 <.text+0x5528a80>
145529a92:     	jmp	0x145529a28 <.text+0x5528a28>
145529a94:     	nopw	%cs:(%rax,%rax)
145529aa0:     	cmpq	-0x18(%rbp), %rdi
145529aa4:     	jne	0x145529ace <.text+0x5528ace>
145529aa6:     	movq	$0x1, 0x20(%rsp)
145529aaf:     	movl	$0x1, %r8d
145529ab5:     	movl	$0x1, %r9d
145529abb:     	movq	%rcx, %r12
145529abe:     	movq	%rdi, %rdx
145529ac1:     	callq	0x145757d40 <.text+0x5756d40>
145529ac6:     	nop
145529ac7:     	movq	-0x10(%rbp), %rax
145529acb:     	movq	%r12, %rcx
145529ace:     	leaq	0x1(%r13), %r8
145529ad2:     	movb	%bl, (%rax,%rdi)
145529ad5:     	incq	%rdi
145529ad8:     	movq	%rdi, -0x8(%rbp)
145529adc:     	leaq	-0x1(%r14), %rdx
145529ae0:     	cmpq	%r13, %rdx
145529ae3:     	jne	0x145529a79 <.text+0x5528a79>
145529ae5:     	jmp	0x145529a28 <.text+0x5528a28>
145529aea:     	movl	$0x1, %ecx
145529aef:     	movl	$0x8, %edx
145529af4:     	callq	0x1458e721b <.text+0x58e621b>
145529af9:     	ud2

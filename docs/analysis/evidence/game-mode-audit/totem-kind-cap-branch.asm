
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145921b3e:     	movss	0xb8(%rsi), %xmm7
145921b46:     	leaq	0x5a0(%rdi), %rax
145921b4d:     	movq	%rax, 0x20(%rbp)
145921b51:     	movq	0x5b0(%rdi), %r12
145921b58:     	testq	%r12, %r12
145921b5b:     	je	0x145921c73 <.text+0x5920c73>
145921b61:     	movq	0x5a8(%rdi), %r14
145921b68:     	movq	%r12, %rax
145921b6b:     	shlq	$0x7, %rax
145921b6f:     	leaq	(%rax,%r12,8), %rbx
145921b73:     	movq	0x130(%rbp), %rsi
145921b7a:     	movq	0x8(%rsi), %r15
145921b7e:     	xorl	%r13d, %r13d
145921b81:     	movq	%r14, %rdi
145921b84:     	jmp	0x145921bb4 <.text+0x5920bb4>
145921b86:     	nopw	%cs:(%rax,%rax)
145921b90:     	movq	(%rsi), %rdx
145921b93:     	movq	(%rax), %rcx
145921b96:     	movq	%r15, %r8
145921b99:     	callq	0x145bc9787 <.text+0x5bc8787>
145921b9e:     	xorl	%ecx, %ecx
145921ba0:     	testl	%eax, %eax
145921ba2:     	sete	%cl
145921ba5:     	addq	%rcx, %r13
145921ba8:     	addq	$0x88, %rdi
145921baf:     	decq	%r12
145921bb2:     	je	0x145921bce <.text+0x5920bce>
145921bb4:     	movq	(%rdi), %rax
145921bb7:     	cmpq	%r15, 0x8(%rax)
145921bbb:     	je	0x145921b90 <.text+0x5920b90>
145921bbd:     	xorl	%ecx, %ecx
145921bbf:     	addq	%rcx, %r13
145921bc2:     	addq	$0x88, %rdi
145921bc9:     	decq	%r12
145921bcc:     	jne	0x145921bb4 <.text+0x5920bb4>
145921bce:     	cmpq	$0x27, %r13
145921bd2:     	movq	0x168(%rbp), %rdi
145921bd9:     	jbe	0x145921c73 <.text+0x5920c73>
145921bdf:     	movq	0x130(%rbp), %rax
145921be6:     	movq	(%rax), %r13
145921be9:     	xorl	%r12d, %r12d
145921bec:     	xorl	%esi, %esi
145921bee:     	jmp	0x145921bff <.text+0x5920bff>
145921bf0:     	incq	%r12
145921bf3:     	addq	$0x88, %rsi
145921bfa:     	cmpq	%rsi, %rbx
145921bfd:     	je	0x145921c73 <.text+0x5920c73>
145921bff:     	movq	(%r14,%rsi), %rax
145921c03:     	cmpq	%r15, 0x8(%rax)
145921c07:     	jne	0x145921bf0 <.text+0x5920bf0>
145921c09:     	movq	(%rax), %rcx
145921c0c:     	movq	%r13, %rdx
145921c0f:     	movq	%r15, %r8
145921c12:     	callq	0x145bc9787 <.text+0x5bc8787>
145921c17:     	testl	%eax, %eax
145921c19:     	jne	0x145921bf0 <.text+0x5920bf0>
145921c1b:     	leaq	0x15579d6(%rip), %r9    # 0x146e795f8
145921c22:     	leaq	0x80(%rbp), %rcx
145921c29:     	movq	0x20(%rbp), %rdx
145921c2d:     	movq	%r12, %r8
145921c30:     	callq	0x145997da0 <.text+0x5996da0>
145921c35:     	movq	0xe8(%rbp), %r14
145921c3c:     	movq	0xf0(%rbp), %rax
145921c43:     	movl	0xf8(%rbp), %ecx
145921c49:     	movl	%ecx, 0x150(%rbp)
145921c4f:     	movq	%rax, 0x148(%rbp)
145921c56:     	leaq	0x148(%rbp), %r8
145921c5d:     	movq	%rdi, %rcx
145921c60:     	movq	%r14, %rdx
145921c63:     	callq	0x145949470 <.text+0x5948470>
145921c68:     	movq	%rdi, %rcx
145921c6b:     	movq	%r14, %rdx
145921c6e:     	callq	0x145926f60 <.text+0x5925f60>
145921c73:     	movl	$0x11eb, %r13d          # imm = 0x11EB
145921c79:     	movq	0x130(%rbp), %rax
145921c80:     	cmpq	$0xb, 0x8(%rax)
145921c85:     	jne	0x145921cb5 <.text+0x5920cb5>
145921c87:     	movq	(%rax), %rax
145921c8a:     	movabsq	$0x6f745f616d67616d, %rcx # imm = 0x6F745F616D67616D
145921c94:     	xorq	(%rax), %rcx
145921c97:     	movabsq	$0x6d65746f745f616d, %rdx # imm = 0x6D65746F745F616D
145921ca1:     	xorq	0x3(%rax), %rdx
145921ca5:     	xorl	%eax, %eax
145921ca7:     	orq	%rcx, %rdx
145921caa:     	sete	%al
145921cad:     	leal	0x11eb(,%rax,2), %r13d


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145625c70:     	pushq	%rsi
145625c71:     	pushq	%rdi
145625c72:     	pushq	%rbx
145625c73:     	subq	$0x30, %rsp
145625c77:     	movb	%dl, 0x2e(%rsp)
145625c7b:     	movb	%r8b, 0x2f(%rsp)
145625c80:     	cmpq	$0x0, 0xd8(%rcx)
145625c88:     	je	0x145625d4b <.text+0x5624d4b>
145625c8e:     	movl	%r8d, %ebx
145625c91:     	movl	%edx, %esi
145625c93:     	leaq	0xe0(%rcx), %rax
145625c9a:     	leaq	0x2e(%rsp), %rdx
145625c9f:     	movq	%rcx, %rdi
145625ca2:     	movq	%rax, %rcx
145625ca5:     	callq	0x140bb9810 <.text+0xbb8810>
145625caa:     	movq	%rax, %r8
145625cad:     	shrq	$0x39, %r8
145625cb1:     	movq	0xc0(%rdi), %rcx
145625cb8:     	movq	0xc8(%rdi), %rdx
145625cbf:     	movd	%r8d, %xmm0
145625cc4:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
145625cc8:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
145625ccd:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
145625cd2:     	xorl	%r8d, %r8d
145625cd5:     	pcmpeqd	%xmm1, %xmm1
145625cd9:     	andq	%rdx, %rax
145625cdc:     	movdqu	(%rcx,%rax), %xmm2
145625ce1:     	movdqa	%xmm2, %xmm3
145625ce5:     	pcmpeqb	%xmm0, %xmm3
145625ce9:     	pmovmskb	%xmm3, %r9d
145625cee:     	testl	%r9d, %r9d
145625cf1:     	je	0x145625d30 <.text+0x5624d30>
145625cf3:     	tzcntl	%r9d, %r10d
145625cf8:     	addq	%rax, %r10
145625cfb:     	andq	%rdx, %r10
145625cfe:     	leaq	(,%r10,8), %r11
145625d06:     	subq	%r11, %r10
145625d09:     	cmpb	-0x7(%rcx,%r10), %sil
145625d0e:     	jne	0x145625d17 <.text+0x5624d17>
145625d10:     	cmpb	-0x6(%rcx,%r10), %bl
145625d15:     	je	0x145625d4f <.text+0x5624d4f>
145625d17:     	leal	-0x1(%r9), %r10d
145625d1b:     	andw	%r9w, %r10w
145625d1f:     	movl	%r10d, %r9d
145625d22:     	jne	0x145625cf3 <.text+0x5624cf3>
145625d24:     	nopw	%cs:(%rax,%rax)
145625d30:     	pcmpeqb	%xmm1, %xmm2
145625d34:     	pmovmskb	%xmm2, %r9d
145625d39:     	testl	%r9d, %r9d
145625d3c:     	jne	0x145625d4b <.text+0x5624d4b>
145625d3e:     	addq	%r8, %rax
145625d41:     	addq	$0x10, %rax
145625d45:     	addq	$0x10, %r8
145625d49:     	jmp	0x145625cd9 <.text+0x5624cd9>
145625d4b:     	xorl	%eax, %eax
145625d4d:     	jmp	0x145625d62 <.text+0x5624d62>
145625d4f:     	addq	%r10, %rcx
145625d52:     	movl	-0x5(%rcx), %eax
145625d55:     	movzbl	-0x1(%rcx), %ecx
145625d59:     	shlq	$0x20, %rcx
145625d5d:     	orq	%rax, %rcx
145625d60:     	movb	$0x1, %al
145625d62:     	shlq	$0x8, %rcx
145625d66:     	movzbl	%al, %eax
145625d69:     	orq	%rcx, %rax
145625d6c:     	addq	$0x30, %rsp
145625d70:     	popq	%rbx
145625d71:     	popq	%rdi
145625d72:     	popq	%rsi
145625d73:     	retq

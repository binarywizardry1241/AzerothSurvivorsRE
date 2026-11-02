
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458de850:     	pushq	%rbp
1458de851:     	pushq	%r15
1458de853:     	pushq	%r14
1458de855:     	pushq	%r12
1458de857:     	pushq	%rsi
1458de858:     	pushq	%rdi
1458de859:     	pushq	%rbx
1458de85a:     	subq	$0x50, %rsp
1458de85e:     	leaq	0x50(%rsp), %rbp
1458de863:     	movq	$-0x2, -0x8(%rbp)
1458de86b:     	movq	%rcx, %rsi
1458de86e:     	movq	0x10(%rdx), %rdi
1458de872:     	leaq	-0x11(%rdi), %rax
1458de876:     	cmpq	$-0x11, %rax
1458de87a:     	ja	0x1458de88f <.text+0x58dd88f>
1458de87c:     	movl	$0xffffffff, 0x8(%rsi)  # imm = 0xFFFFFFFF
1458de883:     	movq	$-0x1, (%rsi)
1458de88a:     	jmp	0x1458dea12 <.text+0x58dda12>
1458de88f:     	movq	0x8(%rdx), %r15
1458de893:     	callq	0x140002200 <.text+0x1200>
1458de898:     	movl	$0x1, %edx
1458de89d:     	movq	%rdi, %rcx
1458de8a0:     	callq	0x1400021c0 <.text+0x11c0>
1458de8a5:     	testq	%rax, %rax
1458de8a8:     	je	0x1458dea24 <.text+0x58dda24>
1458de8ae:     	movq	%rdi, -0x20(%rbp)
1458de8b2:     	movq	%rax, -0x18(%rbp)
1458de8b6:     	movq	$0x0, -0x10(%rbp)
1458de8be:     	addq	%r15, %rdi
1458de8c1:     	xorl	%ebx, %ebx
1458de8c3:     	leaq	-0x20(%rbp), %r14
1458de8c7:     	nopw	(%rax,%rax)
1458de8d0:     	movzbl	(%r15), %edx
1458de8d4:     	movzbl	%dl, %ecx
1458de8d7:     	testb	%cl, %cl
1458de8d9:     	js	0x1458de8f0 <.text+0x58dd8f0>
1458de8db:     	incq	%r15
1458de8de:     	movq	-0x20(%rbp), %rdx
1458de8e2:     	movl	%ecx, %r12d
1458de8e5:     	jmp	0x1458de980 <.text+0x58dd980>
1458de8ea:     	nopw	(%rax,%rax)
1458de8f0:     	movl	%ecx, %r12d
1458de8f3:     	andl	$0x1f, %r12d
1458de8f7:     	movzbl	0x1(%r15), %r8d
1458de8fc:     	andl	$0x3f, %r8d
1458de900:     	cmpb	$-0x21, %cl
1458de903:     	jbe	0x1458de94a <.text+0x58dd94a>
1458de905:     	movzbl	0x2(%r15), %ecx
1458de90a:     	shll	$0x6, %r8d
1458de90e:     	andl	$0x3f, %ecx
1458de911:     	orl	%r8d, %ecx
1458de914:     	cmpb	$-0x10, %dl
1458de917:     	jb	0x1458de964 <.text+0x58dd964>
1458de919:     	movzbl	0x3(%r15), %edx
1458de91e:     	addq	$0x4, %r15
1458de922:     	andl	$0x7, %r12d
1458de926:     	shll	$0x12, %r12d
1458de92a:     	shll	$0x6, %ecx
1458de92d:     	andl	$0x3f, %edx
1458de930:     	orl	%ecx, %edx
1458de932:     	orl	%r12d, %edx
1458de935:     	movl	%edx, %r12d
1458de938:     	movq	-0x20(%rbp), %rdx
1458de93c:     	cmpl	$0x80, %r12d
1458de943:     	jb	0x1458de980 <.text+0x58dd980>
1458de945:     	jmp	0x1458de9e2 <.text+0x58dd9e2>
1458de94a:     	addq	$0x2, %r15
1458de94e:     	shll	$0x6, %r12d
1458de952:     	orl	%r8d, %r12d
1458de955:     	movq	-0x20(%rbp), %rdx
1458de959:     	cmpl	$0x80, %r12d
1458de960:     	jb	0x1458de980 <.text+0x58dd980>
1458de962:     	jmp	0x1458de9e2 <.text+0x58dd9e2>
1458de964:     	addq	$0x3, %r15
1458de968:     	shll	$0xc, %r12d
1458de96c:     	orl	%r12d, %ecx
1458de96f:     	movl	%ecx, %r12d
1458de972:     	movq	-0x20(%rbp), %rdx
1458de976:     	cmpl	$0x80, %r12d
1458de97d:     	jae	0x1458de9e2 <.text+0x58dd9e2>
1458de97f:     	nop
1458de980:     	cmpl	$0x20, %r12d
1458de984:     	jb	0x1458de9e2 <.text+0x58dd9e2>
1458de986:     	cmpl	$0x7f, %r12d
1458de98a:     	je	0x1458de9e2 <.text+0x58dd9e2>
1458de98c:     	cmpq	%rdx, %rbx
1458de98f:     	je	0x1458de9bb <.text+0x58dd9bb>
1458de991:     	leal	-0x61(%r12), %ecx
1458de996:     	movl	%r12d, %edx
1458de999:     	andb	$0x5f, %dl
1458de99c:     	cmpl	$0x1a, %ecx
1458de99f:     	movzbl	%dl, %ecx
1458de9a2:     	cmovael	%r12d, %ecx
1458de9a6:     	movb	%cl, (%rax,%rbx)
1458de9a9:     	incq	%rbx
1458de9ac:     	movq	%rbx, -0x10(%rbp)
1458de9b0:     	cmpq	%rdi, %r15
1458de9b3:     	jne	0x1458de8d0 <.text+0x58dd8d0>
1458de9b9:     	jmp	0x1458dea03 <.text+0x58dda03>
1458de9bb:     	movq	$0x1, 0x20(%rsp)
1458de9c4:     	movl	$0x1, %r8d
1458de9ca:     	movl	$0x1, %r9d
1458de9d0:     	movq	%r14, %rcx
1458de9d3:     	movq	%rbx, %rdx
1458de9d6:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458de9db:     	nop
1458de9dc:     	movq	-0x18(%rbp), %rax
1458de9e0:     	jmp	0x1458de991 <.text+0x58dd991>
1458de9e2:     	movl	%r12d, 0x8(%rsi)
1458de9e6:     	movq	$-0x1, (%rsi)
1458de9ed:     	testq	%rdx, %rdx
1458de9f0:     	je	0x1458dea12 <.text+0x58dda12>
1458de9f2:     	movq	-0x18(%rbp), %rcx
1458de9f6:     	movl	$0x1, %r8d
1458de9fc:     	callq	0x1400021d0 <.text+0x11d0>
1458dea01:     	jmp	0x1458dea12 <.text+0x58dda12>
1458dea03:     	movq	-0x10(%rbp), %rax
1458dea07:     	movq	%rax, 0x10(%rsi)
1458dea0b:     	movups	-0x20(%rbp), %xmm0
1458dea0f:     	movups	%xmm0, (%rsi)
1458dea12:     	movq	%rsi, %rax
1458dea15:     	addq	$0x50, %rsp
1458dea19:     	popq	%rbx
1458dea1a:     	popq	%rdi
1458dea1b:     	popq	%rsi
1458dea1c:     	popq	%r12
1458dea1e:     	popq	%r14
1458dea20:     	popq	%r15
1458dea22:     	popq	%rbp
1458dea23:     	retq
1458dea24:     	movl	$0x1, %ecx
1458dea29:     	movq	%rdi, %rdx
1458dea2c:     	callq	0x145d6944b <.text+0x5d6844b>
1458dea31:     	ud2

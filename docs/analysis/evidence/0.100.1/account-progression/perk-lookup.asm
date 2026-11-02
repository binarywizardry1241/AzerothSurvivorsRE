
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547e770:     	pushq	%r15
14547e772:     	pushq	%r14
14547e774:     	pushq	%r13
14547e776:     	pushq	%r12
14547e778:     	pushq	%rsi
14547e779:     	pushq	%rdi
14547e77a:     	pushq	%rbp
14547e77b:     	pushq	%rbx
14547e77c:     	subq	$0x68, %rsp
14547e780:     	movq	%r8, %rbx
14547e783:     	movq	%rdx, 0x30(%rsp)
14547e788:     	movq	%rcx, 0x28(%rsp)
14547e78d:     	movq	0x10(%rcx), %r12
14547e791:     	testq	%r12, %r12
14547e794:     	je	0x14547e830 <.text+0x547d830>
14547e79a:     	movq	0x28(%rsp), %rax
14547e79f:     	movq	0x8(%rax), %r13
14547e7a3:     	shlq	$0x5, %r12
14547e7a7:     	xorl	%ebp, %ebp
14547e7a9:     	leaq	0x155a470(%rip), %rsi   # 0x1469d8c20
14547e7b0:     	jmp	0x14547e7cd <.text+0x547d7cd>
14547e7b2:     	nopw	%cs:(%rax,%rax)
14547e7c0:     	addq	$0x78, %rbp
14547e7c4:     	cmpq	$0x618, %rbp            # imm = 0x618
14547e7cb:     	je	0x14547e830 <.text+0x547d830>
14547e7cd:     	movq	0x60(%rbp,%rsi), %rcx
14547e7d2:     	testq	%rcx, %rcx
14547e7d5:     	je	0x14547e7c0 <.text+0x547d7c0>
14547e7d7:     	cmpq	%rbx, 0x68(%rbp,%rsi)
14547e7dc:     	jne	0x14547e7c0 <.text+0x547d7c0>
14547e7de:     	movq	0x30(%rsp), %rdx
14547e7e3:     	movq	%rbx, %r8
14547e7e6:     	callq	0x1457731e7 <.text+0x57721e7>
14547e7eb:     	testl	%eax, %eax
14547e7ed:     	jne	0x14547e7c0 <.text+0x547d7c0>
14547e7ef:     	movq	(%rbp,%rsi), %r14
14547e7f4:     	movq	0x8(%rbp,%rsi), %r15
14547e7f9:     	xorl	%edi, %edi
14547e7fb:     	jmp	0x14547e809 <.text+0x547d809>
14547e7fd:     	nopl	(%rax)
14547e800:     	addq	$0x20, %rdi
14547e804:     	cmpq	%rdi, %r12
14547e807:     	je	0x14547e7c0 <.text+0x547d7c0>
14547e809:     	cmpq	%r15, 0x10(%r13,%rdi)
14547e80e:     	jne	0x14547e800 <.text+0x547d800>
14547e810:     	movq	0x8(%r13,%rdi), %rcx
14547e815:     	movq	%r14, %rdx
14547e818:     	movq	%r15, %r8
14547e81b:     	callq	0x1457731e7 <.text+0x57721e7>
14547e820:     	testl	%eax, %eax
14547e822:     	jne	0x14547e800 <.text+0x547d800>
14547e824:     	cmpb	$0x0, 0x18(%r13,%rdi)
14547e82a:     	je	0x14547e7c0 <.text+0x547d7c0>
14547e82c:     	movb	$0x1, %al
14547e82e:     	jmp	0x14547e852 <.text+0x547d852>
14547e830:     	cmpq	$0x6, %rbx
14547e834:     	jne	0x14547e850 <.text+0x547d850>
14547e836:     	movl	$0x6f636573, %eax       # imm = 0x6F636573
14547e83b:     	movq	0x30(%rsp), %rcx
14547e840:     	xorl	(%rcx), %eax
14547e842:     	movzwl	0x4(%rcx), %ecx
14547e846:     	xorl	$0x646e, %ecx           # imm = 0x646E
14547e84c:     	orl	%eax, %ecx
14547e84e:     	je	0x14547e863 <.text+0x547d863>
14547e850:     	xorl	%eax, %eax
14547e852:     	addq	$0x68, %rsp
14547e856:     	popq	%rbx
14547e857:     	popq	%rbp
14547e858:     	popq	%rdi
14547e859:     	popq	%rsi
14547e85a:     	popq	%r12
14547e85c:     	popq	%r13
14547e85e:     	popq	%r14
14547e860:     	popq	%r15
14547e862:     	retq
14547e863:     	leaq	0x155a9ce(%rip), %rax   # 0x1469d9238
14547e86a:     	movq	%rax, 0x50(%rsp)
14547e86f:     	leaq	0x155aa0a(%rip), %rax   # 0x1469d9280
14547e876:     	movq	%rax, 0x58(%rsp)
14547e87b:     	movq	0x28(%rsp), %rax
14547e880:     	movq	%rax, 0x60(%rsp)
14547e885:     	leaq	0x38(%rsp), %rcx
14547e88a:     	leaq	0x50(%rsp), %rdx
14547e88f:     	callq	0x145537140 <.text+0x5536140>
14547e894:     	movq	0x38(%rsp), %rdx
14547e899:     	cmpq	$0x2, 0x48(%rsp)
14547e89f:     	setae	%al
14547e8a2:     	testq	%rdx, %rdx
14547e8a5:     	je	0x14547e852 <.text+0x547d852>
14547e8a7:     	movq	0x40(%rsp), %rcx
14547e8ac:     	movl	$0x1, %r8d
14547e8b2:     	movl	%eax, %esi
14547e8b4:     	callq	0x1400021d0 <.text+0x11d0>
14547e8b9:     	movl	%esi, %eax
14547e8bb:     	jmp	0x14547e852 <.text+0x547d852>

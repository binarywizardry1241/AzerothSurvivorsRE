
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14017b800:     	pushq	%rbp
14017b801:     	pushq	%r15
14017b803:     	pushq	%r14
14017b805:     	pushq	%r13
14017b807:     	pushq	%r12
14017b809:     	pushq	%rsi
14017b80a:     	pushq	%rdi
14017b80b:     	pushq	%rbx
14017b80c:     	movl	$0x1058, %eax           # imm = 0x1058
14017b811:     	callq	0x145772680 <.text+0x5771680>
14017b816:     	subq	%rax, %rsp
14017b819:     	leaq	0x80(%rsp), %rbp
14017b821:     	movq	$-0x2, 0xfd0(%rbp)
14017b82c:     	movq	%rdx, %r9
14017b82f:     	shrq	%r9
14017b832:     	movq	%rdx, %rax
14017b835:     	subq	%r9, %rax
14017b838:     	cmpq	$0x1b207, %rdx          # imm = 0x1B207
14017b83f:     	movl	$0x1b207, %r14d         # imm = 0x1B207
14017b845:     	cmovbq	%rdx, %r14
14017b849:     	cmpq	%rax, %r14
14017b84c:     	cmovbeq	%rax, %r14
14017b850:     	cmpq	$0x39, %r14
14017b854:     	jae	0x14017b867 <.text+0x17a867>
14017b856:     	leaq	-0x50(%rbp), %rsi
14017b85a:     	movl	$0x38, %r9d
14017b860:     	xorl	%edi, %edi
14017b862:     	jmp	0x14017b8e9 <.text+0x17a8e9>
14017b867:     	leaq	(,%r14,8), %r9
14017b86f:     	leaq	(%r9,%r9,8), %rdi
14017b873:     	movabsq	$0x1c71c71c71c71c7, %r9 # imm = 0x1C71C71C71C71C7
14017b87d:     	cmpq	%r9, %rax
14017b880:     	jbe	0x14017b899 <.text+0x17a899>
14017b882:     	xorl	%ebx, %ebx
14017b884:     	movb	$0x0, 0xfcf(%rbp)
14017b88b:     	movq	%rbx, %rcx
14017b88e:     	movq	%rdi, %rdx
14017b891:     	callq	0x14590379b <.text+0x590279b>
14017b896:     	nop
14017b897:     	ud2
14017b899:     	movq	%r8, %r15
14017b89c:     	movq	%rcx, %r12
14017b89f:     	movq	%rdx, %r13
14017b8a2:     	callq	0x140002200 <.text+0x1200>
14017b8a7:     	movl	$0x8, %ebx
14017b8ac:     	movl	$0x8, %edx
14017b8b1:     	movq	%rdi, %rcx
14017b8b4:     	callq	0x1400021c0 <.text+0x11c0>
14017b8b9:     	testq	%rax, %rax
14017b8bc:     	je	0x14017b884 <.text+0x17a884>
14017b8be:     	movq	%rax, %rsi
14017b8c1:     	movq	%r14, 0xfb0(%rbp)
14017b8c8:     	movq	%rax, 0xfb8(%rbp)
14017b8cf:     	movq	$0x0, 0xfc0(%rbp)
14017b8da:     	movb	$0x1, %dil
14017b8dd:     	movq	%r14, %r9
14017b8e0:     	movq	%r13, %rdx
14017b8e3:     	movq	%r12, %rcx
14017b8e6:     	movq	%r15, %r8
14017b8e9:     	movb	%dil, 0xfcf(%rbp)
14017b8f0:     	cmpq	$0x41, %rdx
14017b8f4:     	movq	%r8, 0x28(%rsp)
14017b8f9:     	setb	0x20(%rsp)
14017b8fe:     	movq	%rsi, %r8
14017b901:     	callq	0x14000a660 <.text+0x9660>
14017b906:     	nop
14017b907:     	testq	%r14, %r14
14017b90a:     	setne	%al
14017b90d:     	testb	%dil, %al
14017b910:     	je	0x14017b929 <.text+0x17a929>
14017b912:     	shlq	$0x3, %r14
14017b916:     	leaq	(%r14,%r14,8), %rdx
14017b91a:     	movl	$0x8, %r8d
14017b920:     	movq	%rsi, %rcx
14017b923:     	callq	0x1400021d0 <.text+0x11d0>
14017b928:     	nop
14017b929:     	addq	$0x1058, %rsp           # imm = 0x1058
14017b930:     	popq	%rbx
14017b931:     	popq	%rdi
14017b932:     	popq	%rsi
14017b933:     	popq	%r12
14017b935:     	popq	%r13
14017b937:     	popq	%r14
14017b939:     	popq	%r15
14017b93b:     	popq	%rbp
14017b93c:     	retq

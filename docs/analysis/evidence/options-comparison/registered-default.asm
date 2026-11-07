Disassembly of section .text:

0000000140001000 <.text>:
140da0760:     	pushq	%r15
140da0762:     	pushq	%r14
140da0764:     	pushq	%r12
140da0766:     	pushq	%rsi
140da0767:     	pushq	%rdi
140da0768:     	pushq	%rbx
140da0769:     	subq	$0x28, %rsp
140da076d:     	movq	%r8, %rsi
140da0770:     	movq	%rdx, %rdi
140da0773:     	movq	%rcx, %rbx
140da0776:     	cmpq	$0xf, %rdx
140da077a:     	jbe	0x140da07c7 <.text+0xd9f7c7>
140da077c:     	xorl	%r14d, %r14d
140da077f:     	leaq	0x521b0d2(%rip), %r15   # 0x145fbb858
140da0786:     	jmp	0x140da07a1 <.text+0xd9f7a1>
140da0788:     	nopl	(%rax,%rax)
140da0790:     	addq	$0x58, %r14
140da0794:     	cmpq	$0x30d0, %r14           # imm = 0x30D0
140da079b:     	je	0x140da0843 <.text+0xd9f843>
140da07a1:     	cmpq	%rdi, 0x30(%r14,%r15)
140da07a6:     	jne	0x140da0790 <.text+0xd9f790>
140da07a8:     	movq	0x28(%r14,%r15), %rcx
140da07ad:     	movq	%rdi, %rdx
140da07b0:     	movq	%rbx, %r8
140da07b3:     	movq	%rdi, %r9
140da07b6:     	callq	0x140002210 <.text+0x1210>
140da07bb:     	testb	%al, %al
140da07bd:     	je	0x140da0790 <.text+0xd9f790>
140da07bf:     	addq	%r14, %r15
140da07c2:     	jmp	0x140da0892 <.text+0xd9f892>
140da07c7:     	xorl	%eax, %eax
140da07c9:     	leaq	0x521b088(%rip), %rcx   # 0x145fbb858
140da07d0:     	jmp	0x140da07ec <.text+0xd9f7ec>
140da07d2:     	nopw	%cs:(%rax,%rax)
140da07e0:     	addq	$0x58, %rax
140da07e4:     	cmpq	$0x30d0, %rax           # imm = 0x30D0
140da07ea:     	je	0x140da0843 <.text+0xd9f843>
140da07ec:     	cmpq	%rdi, 0x30(%rax,%rcx)
140da07f1:     	jne	0x140da07e0 <.text+0xd9f7e0>
140da07f3:     	leaq	(%rcx,%rax), %r15
140da07f7:     	movq	0x28(%r15), %rdx
140da07fb:     	xorl	%r8d, %r8d
140da07fe:     	nop
140da0800:     	cmpq	%r8, %rdi
140da0803:     	je	0x140da0892 <.text+0xd9f892>
140da0809:     	movzbl	(%rdx,%r8), %r9d
140da080e:     	leal	-0x41(%r9), %r10d
140da0812:     	cmpb	$0x1a, %r10b
140da0816:     	setb	%r10b
140da081a:     	shlb	$0x5, %r10b
140da081e:     	orb	%r9b, %r10b
140da0821:     	movzbl	(%rbx,%r8), %r9d
140da0826:     	leal	-0x41(%r9), %r11d
140da082a:     	cmpb	$0x1a, %r11b
140da082e:     	setb	%r11b
140da0832:     	shlb	$0x5, %r11b
140da0836:     	orb	%r9b, %r11b
140da0839:     	incq	%r8
140da083c:     	cmpb	%r11b, %r10b
140da083f:     	je	0x140da0800 <.text+0xd9f800>
140da0841:     	jmp	0x140da07e0 <.text+0xd9f7e0>
140da0843:     	xorl	%r14d, %r14d
140da0846:     	cmpq	$0xf, %rdi
140da084a:     	jbe	0x140da0902 <.text+0xd9f902>
140da0850:     	leaq	0x521f921(%rip), %r15   # 0x145fc0178
140da0857:     	xorl	%r12d, %r12d
140da085a:     	jmp	0x140da0871 <.text+0xd9f871>
140da085c:     	nopl	(%rax)
140da0860:     	addq	$0x58, %r12
140da0864:     	cmpq	$0x53e0, %r12           # imm = 0x53E0
140da086b:     	je	0x140da0973 <.text+0xd9f973>
140da0871:     	cmpq	%rdi, 0x30(%r12,%r15)
140da0876:     	jne	0x140da0860 <.text+0xd9f860>
140da0878:     	movq	0x28(%r12,%r15), %rcx
140da087d:     	movq	%rdi, %rdx
140da0880:     	movq	%rbx, %r8
140da0883:     	movq	%rdi, %r9
140da0886:     	callq	0x140002210 <.text+0x1210>
140da088b:     	testb	%al, %al
140da088d:     	je	0x140da0860 <.text+0xd9f860>
140da088f:     	addq	%r12, %r15
140da0892:     	cmpl	$0x2, (%r15)
140da0896:     	jne	0x140da08e3 <.text+0xd9f8e3>
140da0898:     	movq	0x8(%r15), %rax
140da089c:     	movq	0x10(%r15), %rdx
140da08a0:     	leaq	-0x8(%rax), %rcx
140da08a4:     	shlq	$0x3, %rdx
140da08a8:     	leaq	(%rdx,%rdx,2), %rdx
140da08ac:     	negq	%rdx
140da08af:     	xorl	%r8d, %r8d
140da08b2:     	nopw	%cs:(%rax,%rax)
140da08c0:     	cmpq	%r8, %rdx
140da08c3:     	je	0x140da08e3 <.text+0xd9f8e3>
140da08c5:     	addq	$-0x18, %r8
140da08c9:     	cmpq	%rsi, 0x8(%rcx)
140da08cd:     	leaq	0x18(%rcx), %rcx
140da08d1:     	jne	0x140da08c0 <.text+0xd9f8c0>
140da08d3:     	subq	%r8, %rax
140da08d6:     	leaq	-0x10(%rax), %rcx
140da08da:     	addq	$-0x8, %rax
140da08de:     	movq	%rax, %r15
140da08e1:     	jmp	0x140da08eb <.text+0xd9f8eb>
140da08e3:     	leaq	0x38(%r15), %rcx
140da08e7:     	addq	$0x40, %r15
140da08eb:     	movq	(%r15), %rdx
140da08ee:     	movq	(%rcx), %r14
140da08f1:     	movq	%r14, %rax
140da08f4:     	addq	$0x28, %rsp
140da08f8:     	popq	%rbx
140da08f9:     	popq	%rdi
140da08fa:     	popq	%rsi
140da08fb:     	popq	%r12
140da08fd:     	popq	%r14
140da08ff:     	popq	%r15
140da0901:     	retq
140da0902:     	leaq	0x521f86f(%rip), %rax   # 0x145fc0178
140da0909:     	xorl	%ecx, %ecx
140da090b:     	jmp	0x140da091d <.text+0xd9f91d>
140da090d:     	nopl	(%rax)
140da0910:     	addq	$0x58, %rcx
140da0914:     	cmpq	$0x53e0, %rcx           # imm = 0x53E0
140da091b:     	je	0x140da08f1 <.text+0xd9f8f1>
140da091d:     	cmpq	%rdi, 0x30(%rcx,%rax)
140da0922:     	jne	0x140da0910 <.text+0xd9f910>
140da0924:     	leaq	(%rax,%rcx), %r15
140da0928:     	movq	0x28(%r15), %rdx
140da092c:     	xorl	%r8d, %r8d
140da092f:     	nop
140da0930:     	cmpq	%r8, %rdi
140da0933:     	je	0x140da0892 <.text+0xd9f892>
140da0939:     	movzbl	(%rdx,%r8), %r9d
140da093e:     	leal	-0x41(%r9), %r10d
140da0942:     	cmpb	$0x1a, %r10b
140da0946:     	setb	%r10b
140da094a:     	shlb	$0x5, %r10b
140da094e:     	orb	%r9b, %r10b
140da0951:     	movzbl	(%rbx,%r8), %r9d
140da0956:     	leal	-0x41(%r9), %r11d
140da095a:     	cmpb	$0x1a, %r11b
140da095e:     	setb	%r11b
140da0962:     	shlb	$0x5, %r11b
140da0966:     	orb	%r9b, %r11b
140da0969:     	incq	%r8
140da096c:     	cmpb	%r11b, %r10b
140da096f:     	je	0x140da0930 <.text+0xd9f930>
140da0971:     	jmp	0x140da0910 <.text+0xd9f910>
140da0973:     	jmp	0x140da08f1 <.text+0xd9f8f1>

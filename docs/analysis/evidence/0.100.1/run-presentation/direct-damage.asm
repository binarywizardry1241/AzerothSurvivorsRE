
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545f6d0:     	pushq	%rbp
14545f6d1:     	pushq	%r14
14545f6d3:     	pushq	%rsi
14545f6d4:     	pushq	%rdi
14545f6d5:     	pushq	%rbx
14545f6d6:     	subq	$0x80, %rsp
14545f6dd:     	leaq	0x80(%rsp), %rbp
14545f6e5:     	movq	$-0x2, -0x8(%rbp)
14545f6ed:     	movl	%r9d, %edi
14545f6f0:     	movq	%r8, %rbx
14545f6f3:     	movq	%rdx, %r14
14545f6f6:     	movq	%rcx, %rsi
14545f6f9:     	callq	0x140002200 <.text+0x1200>
14545f6fe:     	movl	$0x20, %ecx
14545f703:     	movl	$0x1, %edx
14545f708:     	callq	0x1400021c0 <.text+0x11c0>
14545f70d:     	testq	%rax, %rax
14545f710:     	je	0x14545fad6 <.text+0x545ead6>
14545f716:     	movw	$0x250, -0x18(%rbp)     # imm = 0x250
14545f71c:     	movq	$0x20, -0x30(%rbp)
14545f724:     	movq	%rax, -0x28(%rbp)
14545f728:     	movq	$0x0, -0x20(%rbp)
14545f730:     	leaq	-0x30(%rbp), %rdx
14545f734:     	movq	%r14, %rcx
14545f737:     	callq	0x14551c6a0 <.text+0x551b6a0>
14545f73c:     	nop
14545f73d:     	movups	-0x30(%rbp), %xmm0
14545f741:     	movups	-0x20(%rbp), %xmm1
14545f745:     	movaps	%xmm1, -0x40(%rbp)
14545f749:     	movaps	%xmm0, -0x50(%rbp)
14545f74d:     	leaq	-0x50(%rbp), %rdx
14545f751:     	movq	%rbx, %rcx
14545f754:     	callq	0x14551c6a0 <.text+0x551b6a0>
14545f759:     	nop
14545f75a:     	movaps	-0x50(%rbp), %xmm0
14545f75e:     	movaps	-0x40(%rbp), %xmm1
14545f762:     	movaps	%xmm1, -0x20(%rbp)
14545f766:     	movaps	%xmm0, -0x30(%rbp)
14545f76a:     	movq	-0x20(%rbp), %rdx
14545f76e:     	movq	-0x30(%rbp), %rax
14545f772:     	subq	%rdx, %rax
14545f775:     	cmpq	$0x3, %rax
14545f779:     	jbe	0x14545f9e6 <.text+0x545e9e6>
14545f77f:     	movq	-0x28(%rbp), %rax
14545f783:     	movl	%edi, (%rax,%rdx)
14545f786:     	addq	$0x4, %rdx
14545f78a:     	movq	%rdx, -0x20(%rbp)
14545f78e:     	movaps	-0x30(%rbp), %xmm0
14545f792:     	movaps	%xmm0, -0x50(%rbp)
14545f796:     	movq	-0x20(%rbp), %rax
14545f79a:     	movq	%rax, -0x40(%rbp)
14545f79e:     	movq	-0x18(%rbp), %rax
14545f7a2:     	movq	%rax, -0x38(%rbp)
14545f7a6:     	movq	-0x40(%rbp), %rdx
14545f7aa:     	movq	-0x50(%rbp), %rax
14545f7ae:     	subq	%rdx, %rax
14545f7b1:     	cmpq	$0x3, %rax
14545f7b5:     	jbe	0x14545fa0e <.text+0x545ea0e>
14545f7bb:     	movl	0x50(%rbp), %eax
14545f7be:     	movq	-0x48(%rbp), %rcx
14545f7c2:     	movl	%eax, (%rcx,%rdx)
14545f7c5:     	addq	$0x4, %rdx
14545f7c9:     	movq	%rdx, -0x40(%rbp)
14545f7cd:     	movaps	-0x50(%rbp), %xmm0
14545f7d1:     	movaps	%xmm0, -0x30(%rbp)
14545f7d5:     	movq	-0x40(%rbp), %rax
14545f7d9:     	movq	%rax, -0x20(%rbp)
14545f7dd:     	movq	-0x38(%rbp), %rax
14545f7e1:     	movq	%rax, -0x18(%rbp)
14545f7e5:     	movq	-0x20(%rbp), %rdi
14545f7e9:     	cmpq	-0x30(%rbp), %rdi
14545f7ed:     	jne	0x14545f7f9 <.text+0x545e7f9>
14545f7ef:     	leaq	-0x30(%rbp), %rcx
14545f7f3:     	callq	0x145903690 <.text+0x5902690>
14545f7f8:     	nop
14545f7f9:     	movzbl	0x58(%rbp), %eax
14545f7fd:     	movq	-0x28(%rbp), %rcx
14545f801:     	movb	%al, (%rcx,%rdi)
14545f804:     	incq	%rdi
14545f807:     	movq	%rdi, -0x20(%rbp)
14545f80b:     	movaps	-0x30(%rbp), %xmm0
14545f80f:     	movaps	%xmm0, -0x50(%rbp)
14545f813:     	movq	-0x20(%rbp), %rax
14545f817:     	movq	%rax, -0x40(%rbp)
14545f81b:     	movq	-0x18(%rbp), %rax
14545f81f:     	movq	%rax, -0x38(%rbp)
14545f823:     	movq	-0x40(%rbp), %rdx
14545f827:     	movq	-0x50(%rbp), %rax
14545f82b:     	subq	%rdx, %rax
14545f82e:     	cmpq	$0x3, %rax
14545f832:     	jbe	0x14545fa36 <.text+0x545ea36>
14545f838:     	movq	-0x48(%rbp), %rax
14545f83c:     	movl	$0x0, (%rax,%rdx)
14545f843:     	addq	$0x4, %rdx
14545f847:     	movq	%rdx, -0x40(%rbp)
14545f84b:     	movaps	-0x50(%rbp), %xmm0
14545f84f:     	movaps	%xmm0, -0x30(%rbp)
14545f853:     	movq	-0x40(%rbp), %rax
14545f857:     	movq	%rax, -0x20(%rbp)
14545f85b:     	movq	-0x38(%rbp), %rax
14545f85f:     	movq	%rax, -0x18(%rbp)
14545f863:     	movq	-0x20(%rbp), %rdx
14545f867:     	movq	-0x30(%rbp), %rax
14545f86b:     	subq	%rdx, %rax
14545f86e:     	cmpq	$0x3, %rax
14545f872:     	jbe	0x14545fa5e <.text+0x545ea5e>
14545f878:     	movq	-0x28(%rbp), %rax
14545f87c:     	movl	$0x0, (%rax,%rdx)
14545f883:     	addq	$0x4, %rdx
14545f887:     	movq	%rdx, -0x20(%rbp)
14545f88b:     	movaps	-0x30(%rbp), %xmm0
14545f88f:     	movaps	%xmm0, -0x50(%rbp)
14545f893:     	movq	-0x20(%rbp), %rax
14545f897:     	movq	%rax, -0x40(%rbp)
14545f89b:     	movq	-0x18(%rbp), %rax
14545f89f:     	movq	%rax, -0x38(%rbp)
14545f8a3:     	movq	-0x40(%rbp), %rdi
14545f8a7:     	cmpq	-0x50(%rbp), %rdi
14545f8ab:     	jne	0x14545f8b7 <.text+0x545e8b7>
14545f8ad:     	leaq	-0x50(%rbp), %rcx
14545f8b1:     	callq	0x145903690 <.text+0x5902690>
14545f8b6:     	nop
14545f8b7:     	movq	-0x48(%rbp), %rax
14545f8bb:     	movb	$0x0, (%rax,%rdi)
14545f8bf:     	incq	%rdi
14545f8c2:     	movq	%rdi, -0x40(%rbp)
14545f8c6:     	movaps	-0x50(%rbp), %xmm0
14545f8ca:     	movaps	%xmm0, -0x30(%rbp)
14545f8ce:     	movq	-0x40(%rbp), %rax
14545f8d2:     	movq	%rax, -0x20(%rbp)
14545f8d6:     	movq	-0x38(%rbp), %rax
14545f8da:     	movq	%rax, -0x18(%rbp)
14545f8de:     	movq	-0x20(%rbp), %rdi
14545f8e2:     	cmpq	-0x30(%rbp), %rdi
14545f8e6:     	jne	0x14545f8f2 <.text+0x545e8f2>
14545f8e8:     	leaq	-0x30(%rbp), %rcx
14545f8ec:     	callq	0x145903690 <.text+0x5902690>
14545f8f1:     	nop
14545f8f2:     	movq	-0x28(%rbp), %rax
14545f8f6:     	movb	$0x0, (%rax,%rdi)
14545f8fa:     	incq	%rdi
14545f8fd:     	movq	%rdi, -0x20(%rbp)
14545f901:     	movaps	-0x30(%rbp), %xmm0
14545f905:     	movaps	%xmm0, -0x50(%rbp)
14545f909:     	movq	-0x20(%rbp), %rax
14545f90d:     	movq	%rax, -0x40(%rbp)
14545f911:     	movq	-0x18(%rbp), %rax
14545f915:     	movq	%rax, -0x38(%rbp)
14545f919:     	movq	-0x40(%rbp), %rdx
14545f91d:     	movq	-0x50(%rbp), %rax
14545f921:     	subq	%rdx, %rax
14545f924:     	cmpq	$0x3, %rax
14545f928:     	jbe	0x14545fa86 <.text+0x545ea86>
14545f92e:     	movq	-0x48(%rbp), %rax
14545f932:     	movl	$0x0, (%rax,%rdx)
14545f939:     	addq	$0x4, %rdx
14545f93d:     	movq	%rdx, -0x40(%rbp)
14545f941:     	movaps	-0x50(%rbp), %xmm0
14545f945:     	movaps	%xmm0, -0x30(%rbp)
14545f949:     	movq	-0x40(%rbp), %rax
14545f94d:     	movq	%rax, -0x20(%rbp)
14545f951:     	movq	-0x38(%rbp), %rax
14545f955:     	movq	%rax, -0x18(%rbp)
14545f959:     	movq	-0x20(%rbp), %rdx
14545f95d:     	movq	-0x30(%rbp), %rax
14545f961:     	subq	%rdx, %rax
14545f964:     	cmpq	$0x3, %rax
14545f968:     	jbe	0x14545faae <.text+0x545eaae>
14545f96e:     	movzbl	0x60(%rbp), %eax
14545f972:     	addl	%eax, %eax
14545f974:     	movq	-0x28(%rbp), %rcx
14545f978:     	movl	%eax, (%rcx,%rdx)
14545f97b:     	addq	$0x4, %rdx
14545f97f:     	movq	%rdx, -0x20(%rbp)
14545f983:     	movaps	-0x30(%rbp), %xmm0
14545f987:     	movaps	%xmm0, -0x50(%rbp)
14545f98b:     	movq	-0x20(%rbp), %rax
14545f98f:     	movq	%rax, -0x40(%rbp)
14545f993:     	movq	-0x18(%rbp), %rax
14545f997:     	movq	%rax, -0x38(%rbp)
14545f99b:     	movq	-0x40(%rbp), %rdi
14545f99f:     	cmpq	-0x50(%rbp), %rdi
14545f9a3:     	jne	0x14545f9af <.text+0x545e9af>
14545f9a5:     	leaq	-0x50(%rbp), %rcx
14545f9a9:     	callq	0x145903690 <.text+0x5902690>
14545f9ae:     	nop
14545f9af:     	movq	-0x48(%rbp), %rax
14545f9b3:     	movb	$0x0, (%rax,%rdi)
14545f9b7:     	incq	%rdi
14545f9ba:     	movq	%rdi, -0x40(%rbp)
14545f9be:     	movaps	-0x50(%rbp), %xmm0
14545f9c2:     	movups	%xmm0, (%rsi)
14545f9c5:     	movq	-0x40(%rbp), %rax
14545f9c9:     	movq	%rax, 0x10(%rsi)
14545f9cd:     	movq	-0x38(%rbp), %rax
14545f9d1:     	movq	%rax, 0x18(%rsi)
14545f9d5:     	movq	%rsi, %rax
14545f9d8:     	addq	$0x80, %rsp
14545f9df:     	popq	%rbx
14545f9e0:     	popq	%rdi
14545f9e1:     	popq	%rsi
14545f9e2:     	popq	%r14
14545f9e4:     	popq	%rbp
14545f9e5:     	retq

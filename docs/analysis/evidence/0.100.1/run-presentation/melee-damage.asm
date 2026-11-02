
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545c690:     	pushq	%rbp
14545c691:     	pushq	%r14
14545c693:     	pushq	%rsi
14545c694:     	pushq	%rdi
14545c695:     	pushq	%rbx
14545c696:     	subq	$0x80, %rsp
14545c69d:     	leaq	0x80(%rsp), %rbp
14545c6a5:     	movq	$-0x2, -0x8(%rbp)
14545c6ad:     	movl	%r9d, %edi
14545c6b0:     	movq	%r8, %rbx
14545c6b3:     	movq	%rdx, %r14
14545c6b6:     	movq	%rcx, %rsi
14545c6b9:     	callq	0x140002200 <.text+0x1200>
14545c6be:     	movl	$0x20, %ecx
14545c6c3:     	movl	$0x1, %edx
14545c6c8:     	callq	0x1400021c0 <.text+0x11c0>
14545c6cd:     	testq	%rax, %rax
14545c6d0:     	je	0x14545cb91 <.text+0x545bb91>
14545c6d6:     	movzbl	0x50(%rbp), %ecx
14545c6da:     	shll	$0x7, %ecx
14545c6dd:     	orl	$0x2, %ecx
14545c6e0:     	movl	%ecx, (%rax)
14545c6e2:     	movq	$0x20, -0x30(%rbp)
14545c6ea:     	movq	%rax, -0x28(%rbp)
14545c6ee:     	movq	$0x4, -0x20(%rbp)
14545c6f6:     	movw	$0x14a, -0x18(%rbp)     # imm = 0x14A
14545c6fc:     	leaq	-0x30(%rbp), %rdx
14545c700:     	movq	%r14, %rcx
14545c703:     	callq	0x14551c6a0 <.text+0x551b6a0>
14545c708:     	nop
14545c709:     	movups	-0x30(%rbp), %xmm0
14545c70d:     	movups	-0x20(%rbp), %xmm1
14545c711:     	movaps	%xmm1, -0x40(%rbp)
14545c715:     	movaps	%xmm0, -0x50(%rbp)
14545c719:     	leaq	-0x50(%rbp), %rdx
14545c71d:     	movq	%rbx, %rcx
14545c720:     	callq	0x14551c6a0 <.text+0x551b6a0>
14545c725:     	nop
14545c726:     	movaps	-0x50(%rbp), %xmm0
14545c72a:     	movaps	-0x40(%rbp), %xmm1
14545c72e:     	movaps	%xmm1, -0x20(%rbp)
14545c732:     	movaps	%xmm0, -0x30(%rbp)
14545c736:     	movq	-0x20(%rbp), %rdx
14545c73a:     	movq	-0x30(%rbp), %rax
14545c73e:     	subq	%rdx, %rax
14545c741:     	cmpq	$0x3, %rax
14545c745:     	jbe	0x14545ca01 <.text+0x545ba01>
14545c74b:     	movq	-0x28(%rbp), %rax
14545c74f:     	movl	%edi, (%rax,%rdx)
14545c752:     	addq	$0x4, %rdx
14545c756:     	movq	%rdx, -0x20(%rbp)
14545c75a:     	movaps	-0x30(%rbp), %xmm0
14545c75e:     	movaps	%xmm0, -0x50(%rbp)
14545c762:     	movq	-0x20(%rbp), %rax
14545c766:     	movq	%rax, -0x40(%rbp)
14545c76a:     	movq	-0x18(%rbp), %rax
14545c76e:     	movq	%rax, -0x38(%rbp)
14545c772:     	movq	-0x40(%rbp), %rbx
14545c776:     	cmpq	-0x50(%rbp), %rbx
14545c77a:     	jne	0x14545c786 <.text+0x545b786>
14545c77c:     	leaq	-0x50(%rbp), %rcx
14545c780:     	callq	0x145903690 <.text+0x5902690>
14545c785:     	nop
14545c786:     	movq	-0x48(%rbp), %rax
14545c78a:     	movb	$0x1, (%rax,%rbx)
14545c78e:     	incq	%rbx
14545c791:     	movq	%rbx, -0x40(%rbp)
14545c795:     	movaps	-0x50(%rbp), %xmm0
14545c799:     	movaps	%xmm0, -0x30(%rbp)
14545c79d:     	movq	-0x40(%rbp), %rax
14545c7a1:     	movq	%rax, -0x20(%rbp)
14545c7a5:     	movq	-0x38(%rbp), %rax
14545c7a9:     	movq	%rax, -0x18(%rbp)
14545c7ad:     	movq	-0x20(%rbp), %rdx
14545c7b1:     	movq	-0x30(%rbp), %rax
14545c7b5:     	subq	%rdx, %rax
14545c7b8:     	cmpq	$0x3, %rax
14545c7bc:     	jbe	0x14545ca29 <.text+0x545ba29>
14545c7c2:     	movq	-0x28(%rbp), %rax
14545c7c6:     	movl	$0x0, (%rax,%rdx)
14545c7cd:     	addq	$0x4, %rdx
14545c7d1:     	movq	%rdx, -0x20(%rbp)
14545c7d5:     	movaps	-0x30(%rbp), %xmm0
14545c7d9:     	movaps	%xmm0, -0x50(%rbp)
14545c7dd:     	movq	-0x20(%rbp), %rax
14545c7e1:     	movq	%rax, -0x40(%rbp)
14545c7e5:     	movq	-0x18(%rbp), %rax
14545c7e9:     	movq	%rax, -0x38(%rbp)
14545c7ed:     	movq	-0x40(%rbp), %rdx
14545c7f1:     	movq	-0x50(%rbp), %rax
14545c7f5:     	subq	%rdx, %rax
14545c7f8:     	cmpq	$0x3, %rax
14545c7fc:     	jbe	0x14545ca51 <.text+0x545ba51>
14545c802:     	movl	%edi, %eax
14545c804:     	xorps	%xmm0, %xmm0
14545c807:     	cvtsi2ss	%rax, %xmm0
14545c80c:     	movq	-0x48(%rbp), %rax
14545c810:     	movss	%xmm0, (%rax,%rdx)
14545c815:     	addq	$0x4, %rdx
14545c819:     	movq	%rdx, -0x40(%rbp)
14545c81d:     	movaps	-0x50(%rbp), %xmm0
14545c821:     	movaps	%xmm0, -0x30(%rbp)
14545c825:     	movq	-0x40(%rbp), %rax
14545c829:     	movq	%rax, -0x20(%rbp)
14545c82d:     	movq	-0x38(%rbp), %rax
14545c831:     	movq	%rax, -0x18(%rbp)
14545c835:     	movq	-0x20(%rbp), %rdx
14545c839:     	movq	-0x30(%rbp), %rax
14545c83d:     	subq	%rdx, %rax
14545c840:     	cmpq	$0x3, %rax
14545c844:     	jbe	0x14545ca79 <.text+0x545ba79>
14545c84a:     	movq	-0x28(%rbp), %rax
14545c84e:     	movl	%edi, (%rax,%rdx)
14545c851:     	addq	$0x4, %rdx
14545c855:     	movq	%rdx, -0x20(%rbp)
14545c859:     	movaps	-0x30(%rbp), %xmm0
14545c85d:     	movaps	%xmm0, -0x50(%rbp)
14545c861:     	movq	-0x20(%rbp), %rax
14545c865:     	movq	%rax, -0x40(%rbp)
14545c869:     	movq	-0x18(%rbp), %rax
14545c86d:     	movq	%rax, -0x38(%rbp)
14545c871:     	movq	-0x40(%rbp), %rdx
14545c875:     	movq	-0x50(%rbp), %rax
14545c879:     	subq	%rdx, %rax
14545c87c:     	cmpq	$0x3, %rax
14545c880:     	jbe	0x14545caa1 <.text+0x545baa1>
14545c886:     	movq	-0x48(%rbp), %rax
14545c88a:     	movl	$0x0, (%rax,%rdx)
14545c891:     	addq	$0x4, %rdx
14545c895:     	movq	%rdx, -0x40(%rbp)
14545c899:     	movaps	-0x50(%rbp), %xmm0
14545c89d:     	movaps	%xmm0, -0x30(%rbp)
14545c8a1:     	movq	-0x40(%rbp), %rax
14545c8a5:     	movq	%rax, -0x20(%rbp)
14545c8a9:     	movq	-0x38(%rbp), %rax
14545c8ad:     	movq	%rax, -0x18(%rbp)
14545c8b1:     	movq	-0x20(%rbp), %rdx
14545c8b5:     	movq	-0x30(%rbp), %rax
14545c8b9:     	subq	%rdx, %rax
14545c8bc:     	cmpq	$0x3, %rax
14545c8c0:     	jbe	0x14545cac9 <.text+0x545bac9>
14545c8c6:     	movq	-0x28(%rbp), %rax
14545c8ca:     	movl	$0x0, (%rax,%rdx)
14545c8d1:     	addq	$0x4, %rdx
14545c8d5:     	movq	%rdx, -0x20(%rbp)
14545c8d9:     	movaps	-0x30(%rbp), %xmm0
14545c8dd:     	movaps	%xmm0, -0x50(%rbp)
14545c8e1:     	movq	-0x20(%rbp), %rax
14545c8e5:     	movq	%rax, -0x40(%rbp)
14545c8e9:     	movq	-0x18(%rbp), %rax
14545c8ed:     	movq	%rax, -0x38(%rbp)
14545c8f1:     	movq	-0x40(%rbp), %rdx
14545c8f5:     	movq	-0x50(%rbp), %rax
14545c8f9:     	subq	%rdx, %rax
14545c8fc:     	cmpq	$0x3, %rax
14545c900:     	jbe	0x14545caf1 <.text+0x545baf1>
14545c906:     	movq	-0x48(%rbp), %rax
14545c90a:     	movl	$0x1, (%rax,%rdx)
14545c911:     	addq	$0x4, %rdx
14545c915:     	movq	%rdx, -0x40(%rbp)
14545c919:     	movaps	-0x50(%rbp), %xmm0
14545c91d:     	movaps	%xmm0, -0x30(%rbp)
14545c921:     	movq	-0x40(%rbp), %rax
14545c925:     	movq	%rax, -0x20(%rbp)
14545c929:     	movq	-0x38(%rbp), %rax
14545c92d:     	movq	%rax, -0x18(%rbp)
14545c931:     	movq	-0x20(%rbp), %rdx
14545c935:     	movq	-0x30(%rbp), %rax
14545c939:     	subq	%rdx, %rax
14545c93c:     	cmpq	$0x3, %rax
14545c940:     	jbe	0x14545cb19 <.text+0x545bb19>
14545c946:     	movq	-0x28(%rbp), %rax
14545c94a:     	movl	$0x0, (%rax,%rdx)
14545c951:     	addq	$0x4, %rdx
14545c955:     	movq	%rdx, -0x20(%rbp)
14545c959:     	movaps	-0x30(%rbp), %xmm0
14545c95d:     	movaps	%xmm0, -0x50(%rbp)
14545c961:     	movq	-0x20(%rbp), %rax
14545c965:     	movq	%rax, -0x40(%rbp)
14545c969:     	movq	-0x18(%rbp), %rax
14545c96d:     	movq	%rax, -0x38(%rbp)
14545c971:     	movq	-0x40(%rbp), %rdx
14545c975:     	movq	-0x50(%rbp), %rax
14545c979:     	subq	%rdx, %rax
14545c97c:     	cmpq	$0x3, %rax
14545c980:     	jbe	0x14545cb41 <.text+0x545bb41>
14545c986:     	movq	-0x48(%rbp), %rax
14545c98a:     	movl	$0x0, (%rax,%rdx)
14545c991:     	addq	$0x4, %rdx
14545c995:     	movq	%rdx, -0x40(%rbp)
14545c999:     	movaps	-0x50(%rbp), %xmm0
14545c99d:     	movaps	%xmm0, -0x30(%rbp)
14545c9a1:     	movq	-0x40(%rbp), %rax
14545c9a5:     	movq	%rax, -0x20(%rbp)
14545c9a9:     	movq	-0x38(%rbp), %rax
14545c9ad:     	movq	%rax, -0x18(%rbp)
14545c9b1:     	movq	-0x20(%rbp), %rdx
14545c9b5:     	movq	-0x30(%rbp), %rax
14545c9b9:     	subq	%rdx, %rax
14545c9bc:     	cmpq	$0x3, %rax
14545c9c0:     	jbe	0x14545cb69 <.text+0x545bb69>
14545c9c6:     	movq	-0x28(%rbp), %rax
14545c9ca:     	movl	$0x0, (%rax,%rdx)
14545c9d1:     	addq	$0x4, %rdx
14545c9d5:     	movq	%rdx, -0x20(%rbp)
14545c9d9:     	movaps	-0x30(%rbp), %xmm0
14545c9dd:     	movups	%xmm0, (%rsi)
14545c9e0:     	movq	-0x20(%rbp), %rax
14545c9e4:     	movq	%rax, 0x10(%rsi)
14545c9e8:     	movq	-0x18(%rbp), %rax
14545c9ec:     	movq	%rax, 0x18(%rsi)
14545c9f0:     	movq	%rsi, %rax
14545c9f3:     	addq	$0x80, %rsp
14545c9fa:     	popq	%rbx
14545c9fb:     	popq	%rdi
14545c9fc:     	popq	%rsi
14545c9fd:     	popq	%r14
14545c9ff:     	popq	%rbp
14545ca00:     	retq
14545ca01:     	movq	$0x1, 0x20(%rsp)
14545ca0a:     	leaq	-0x30(%rbp), %rcx
14545ca0e:     	movl	$0x4, %r8d
14545ca14:     	movl	$0x1, %r9d
14545ca1a:     	callq	0x1457744b0 <.text+0x57734b0>
14545ca1f:     	nop
14545ca20:     	movq	-0x20(%rbp), %rdx
14545ca24:     	jmp	0x14545c74b <.text+0x545b74b>
14545ca29:     	movq	$0x1, 0x20(%rsp)
14545ca32:     	leaq	-0x30(%rbp), %rcx
14545ca36:     	movl	$0x4, %r8d
14545ca3c:     	movl	$0x1, %r9d
14545ca42:     	callq	0x1457744b0 <.text+0x57734b0>
14545ca47:     	nop
14545ca48:     	movq	-0x20(%rbp), %rdx
14545ca4c:     	jmp	0x14545c7c2 <.text+0x545b7c2>
14545ca51:     	movq	$0x1, 0x20(%rsp)
14545ca5a:     	leaq	-0x50(%rbp), %rcx
14545ca5e:     	movl	$0x4, %r8d
14545ca64:     	movl	$0x1, %r9d
14545ca6a:     	callq	0x1457744b0 <.text+0x57734b0>
14545ca6f:     	nop
14545ca70:     	movq	-0x40(%rbp), %rdx
14545ca74:     	jmp	0x14545c802 <.text+0x545b802>
14545ca79:     	movq	$0x1, 0x20(%rsp)
14545ca82:     	leaq	-0x30(%rbp), %rcx
14545ca86:     	movl	$0x4, %r8d
14545ca8c:     	movl	$0x1, %r9d
14545ca92:     	callq	0x1457744b0 <.text+0x57734b0>
14545ca97:     	nop
14545ca98:     	movq	-0x20(%rbp), %rdx
14545ca9c:     	jmp	0x14545c84a <.text+0x545b84a>
14545caa1:     	movq	$0x1, 0x20(%rsp)
14545caaa:     	leaq	-0x50(%rbp), %rcx
14545caae:     	movl	$0x4, %r8d
14545cab4:     	movl	$0x1, %r9d
14545caba:     	callq	0x1457744b0 <.text+0x57734b0>
14545cabf:     	nop
14545cac0:     	movq	-0x40(%rbp), %rdx
14545cac4:     	jmp	0x14545c886 <.text+0x545b886>
14545cac9:     	movq	$0x1, 0x20(%rsp)
14545cad2:     	leaq	-0x30(%rbp), %rcx
14545cad6:     	movl	$0x4, %r8d
14545cadc:     	movl	$0x1, %r9d
14545cae2:     	callq	0x1457744b0 <.text+0x57734b0>
14545cae7:     	nop
14545cae8:     	movq	-0x20(%rbp), %rdx
14545caec:     	jmp	0x14545c8c6 <.text+0x545b8c6>
14545caf1:     	movq	$0x1, 0x20(%rsp)
14545cafa:     	leaq	-0x50(%rbp), %rcx
14545cafe:     	movl	$0x4, %r8d
14545cb04:     	movl	$0x1, %r9d
14545cb0a:     	callq	0x1457744b0 <.text+0x57734b0>
14545cb0f:     	nop
14545cb10:     	movq	-0x40(%rbp), %rdx
14545cb14:     	jmp	0x14545c906 <.text+0x545b906>
14545cb19:     	movq	$0x1, 0x20(%rsp)
14545cb22:     	leaq	-0x30(%rbp), %rcx
14545cb26:     	movl	$0x4, %r8d
14545cb2c:     	movl	$0x1, %r9d
14545cb32:     	callq	0x1457744b0 <.text+0x57734b0>
14545cb37:     	nop
14545cb38:     	movq	-0x20(%rbp), %rdx
14545cb3c:     	jmp	0x14545c946 <.text+0x545b946>
14545cb41:     	movq	$0x1, 0x20(%rsp)
14545cb4a:     	leaq	-0x50(%rbp), %rcx
14545cb4e:     	movl	$0x4, %r8d
14545cb54:     	movl	$0x1, %r9d
14545cb5a:     	callq	0x1457744b0 <.text+0x57734b0>
14545cb5f:     	nop
14545cb60:     	movq	-0x40(%rbp), %rdx
14545cb64:     	jmp	0x14545c986 <.text+0x545b986>
14545cb69:     	movq	$0x1, 0x20(%rsp)
14545cb72:     	leaq	-0x30(%rbp), %rcx
14545cb76:     	movl	$0x4, %r8d
14545cb7c:     	movl	$0x1, %r9d
14545cb82:     	callq	0x1457744b0 <.text+0x57734b0>
14545cb87:     	nop
14545cb88:     	movq	-0x20(%rbp), %rdx
14545cb8c:     	jmp	0x14545c9c6 <.text+0x545b9c6>
14545cb91:     	movl	$0x1, %ecx
14545cb96:     	movl	$0x20, %edx
14545cb9b:     	callq	0x14590379b <.text+0x590279b>
14545cba0:     	ud2

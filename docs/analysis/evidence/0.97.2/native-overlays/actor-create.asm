
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c0820:     	pushq	%rbp
1454c0821:     	pushq	%r15
1454c0823:     	pushq	%r14
1454c0825:     	pushq	%r12
1454c0827:     	pushq	%rsi
1454c0828:     	pushq	%rdi
1454c0829:     	pushq	%rbx
1454c082a:     	subq	$0x100, %rsp            # imm = 0x100
1454c0831:     	leaq	0x80(%rsp), %rbp
1454c0839:     	movdqa	%xmm6, 0x70(%rbp)
1454c083e:     	movq	$-0x2, 0x68(%rbp)
1454c0846:     	movl	%r9d, %r14d
1454c0849:     	movl	%r8d, %r12d
1454c084c:     	movq	%rdx, %rdi
1454c084f:     	movq	%rcx, %rsi
1454c0852:     	movzbl	0xf0(%rbp), %eax
1454c0859:     	leal	(%rax,%rax,2), %eax
1454c085c:     	addl	0x3f8(%rcx), %eax
1454c0862:     	cmpl	$0x3f, %eax
1454c0865:     	movl	$0x3f, %r15d
1454c086b:     	cmovbl	%eax, %r15d
1454c086f:     	movq	$0x0, 0x18(%rbp)
1454c0877:     	movq	$0x0, 0x28(%rbp)
1454c087f:     	leaq	0x18(%rbp), %rbx
1454c0883:     	movq	%rbx, %rcx
1454c0886:     	xorl	%edx, %edx
1454c0888:     	movq	%rdi, %r8
1454c088b:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454c0890:     	nop
1454c0891:     	movq	0x18(%rbp), %rax
1454c0895:     	testq	%rax, %rax
1454c0898:     	je	0x1454c090b <.text+0x54bf90b>
1454c089a:     	movq	0x20(%rbp), %rcx
1454c089e:     	movw	$0x2, %dx
1454c08a2:     	movzwl	0x36(%rax), %r9d
1454c08a7:     	movl	%r9d, %r10d
1454c08aa:     	addl	%r10d, %r10d
1454c08ad:     	movq	$-0x1, %r8
1454c08b4:     	nopw	%cs:(%rax,%rax)
1454c08c0:     	testq	%r10, %r10
1454c08c3:     	je	0x1454c08f0 <.text+0x54bf8f0>
1454c08c5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c08cb:     	seta	%r11b
1454c08cf:     	sbbb	$0x0, %r11b
1454c08d3:     	incq	%r8
1454c08d6:     	addq	$-0x2, %r10
1454c08da:     	cmpb	$0x1, %r11b
1454c08de:     	je	0x1454c08c0 <.text+0x54bf8c0>
1454c08e0:     	movzbl	%r11b, %r9d
1454c08e4:     	testl	%r9d, %r9d
1454c08e7:     	je	0x1454c0900 <.text+0x54bf900>
1454c08e9:     	jmp	0x1454c08f3 <.text+0x54bf8f3>
1454c08eb:     	nopl	(%rax,%rax)
1454c08f0:     	movq	%r9, %r8
1454c08f3:     	subq	$0x1, %rcx
1454c08f7:     	jb	0x1454c090d <.text+0x54bf90d>
1454c08f9:     	movq	0x50(%rax,%r8,8), %rax
1454c08fe:     	jmp	0x1454c08a2 <.text+0x54bf8a2>
1454c0900:     	movl	$0x9, 0x8(%rax,%r8,4)
1454c0909:     	jmp	0x1454c093d <.text+0x54bf93d>
1454c090b:     	xorl	%eax, %eax
1454c090d:     	movq	%rbx, 0x30(%rbp)
1454c0911:     	movq	%rax, 0x38(%rbp)
1454c0915:     	movq	$0x0, 0x40(%rbp)
1454c091d:     	movq	%r8, 0x48(%rbp)
1454c0921:     	movq	$0x2, 0x50(%rbp)
1454c0929:     	leaq	-0x8(%rbp), %rcx
1454c092d:     	leaq	0x30(%rbp), %rdx
1454c0931:     	movl	$0x9, %r8d
1454c0937:     	callq	0x145427a50 <.text+0x5426a50>
1454c093c:     	nop
1454c093d:     	movq	0x18(%rbp), %rax
1454c0941:     	testq	%rax, %rax
1454c0944:     	je	0x1454c09a7 <.text+0x54bf9a7>
1454c0946:     	movq	0x20(%rbp), %rcx
1454c094a:     	movw	$0x3, %dx
1454c094e:     	movzwl	0x36(%rax), %r9d
1454c0953:     	movl	%r9d, %r10d
1454c0956:     	addl	%r10d, %r10d
1454c0959:     	movq	$-0x1, %r8
1454c0960:     	testq	%r10, %r10
1454c0963:     	je	0x1454c0990 <.text+0x54bf990>
1454c0965:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c096b:     	seta	%r11b
1454c096f:     	sbbb	$0x0, %r11b
1454c0973:     	incq	%r8
1454c0976:     	addq	$-0x2, %r10
1454c097a:     	cmpb	$0x1, %r11b
1454c097e:     	je	0x1454c0960 <.text+0x54bf960>
1454c0980:     	movzbl	%r11b, %r9d
1454c0984:     	testl	%r9d, %r9d
1454c0987:     	je	0x1454c09a0 <.text+0x54bf9a0>
1454c0989:     	jmp	0x1454c0993 <.text+0x54bf993>
1454c098b:     	nopl	(%rax,%rax)
1454c0990:     	movq	%r9, %r8
1454c0993:     	subq	$0x1, %rcx
1454c0997:     	jb	0x1454c09a9 <.text+0x54bf9a9>
1454c0999:     	movq	0x50(%rax,%r8,8), %rax
1454c099e:     	jmp	0x1454c094e <.text+0x54bf94e>
1454c09a0:     	movl	%r12d, 0x8(%rax,%r8,4)
1454c09a5:     	jmp	0x1454c09d6 <.text+0x54bf9d6>
1454c09a7:     	xorl	%eax, %eax
1454c09a9:     	movq	%rbx, 0x30(%rbp)
1454c09ad:     	movq	%rax, 0x38(%rbp)
1454c09b1:     	movq	$0x0, 0x40(%rbp)
1454c09b9:     	movq	%r8, 0x48(%rbp)
1454c09bd:     	movq	$0x3, 0x50(%rbp)
1454c09c5:     	leaq	-0x8(%rbp), %rcx
1454c09c9:     	leaq	0x30(%rbp), %rdx
1454c09cd:     	movl	%r12d, %r8d
1454c09d0:     	callq	0x145427a50 <.text+0x5426a50>
1454c09d5:     	nop
1454c09d6:     	movd	0xe0(%rbp), %xmm6
1454c09de:     	movq	0x18(%rbp), %rax
1454c09e2:     	testq	%rax, %rax
1454c09e5:     	je	0x1454c0a59 <.text+0x54bfa59>
1454c09e7:     	movq	0x20(%rbp), %rcx
1454c09eb:     	movw	$0x4, %dx
1454c09ef:     	movzwl	0x36(%rax), %r8d
1454c09f4:     	movl	%r8d, %r10d
1454c09f7:     	addl	%r10d, %r10d
1454c09fa:     	movq	$-0x1, %r9
1454c0a01:     	nopw	%cs:(%rax,%rax)
1454c0a10:     	testq	%r10, %r10
1454c0a13:     	je	0x1454c0a40 <.text+0x54bfa40>
1454c0a15:     	cmpw	0x3a(%rax,%r9,2), %dx
1454c0a1b:     	seta	%r11b
1454c0a1f:     	sbbb	$0x0, %r11b
1454c0a23:     	incq	%r9
1454c0a26:     	addq	$-0x2, %r10
1454c0a2a:     	cmpb	$0x1, %r11b
1454c0a2e:     	je	0x1454c0a10 <.text+0x54bfa10>
1454c0a30:     	movzbl	%r11b, %r8d
1454c0a34:     	testl	%r8d, %r8d
1454c0a37:     	je	0x1454c0a50 <.text+0x54bfa50>
1454c0a39:     	jmp	0x1454c0a43 <.text+0x54bfa43>
1454c0a3b:     	nopl	(%rax,%rax)
1454c0a40:     	movq	%r8, %r9
1454c0a43:     	subq	$0x1, %rcx
1454c0a47:     	jb	0x1454c0a5b <.text+0x54bfa5b>
1454c0a49:     	movq	0x50(%rax,%r9,8), %rax
1454c0a4e:     	jmp	0x1454c09ef <.text+0x54bf9ef>
1454c0a50:     	movd	%xmm6, 0x8(%rax,%r9,4)
1454c0a57:     	jmp	0x1454c0a8a <.text+0x54bfa8a>
1454c0a59:     	xorl	%eax, %eax
1454c0a5b:     	movd	%xmm6, %r8d
1454c0a60:     	movq	%rbx, 0x30(%rbp)
1454c0a64:     	movq	%rax, 0x38(%rbp)
1454c0a68:     	movq	$0x0, 0x40(%rbp)
1454c0a70:     	movq	%r9, 0x48(%rbp)
1454c0a74:     	movq	$0x4, 0x50(%rbp)
1454c0a7c:     	leaq	-0x8(%rbp), %rcx
1454c0a80:     	leaq	0x30(%rbp), %rdx
1454c0a84:     	callq	0x145427a50 <.text+0x5426a50>
1454c0a89:     	nop
1454c0a8a:     	movss	0xe8(%rbp), %xmm0
1454c0a92:     	callq	0x145756e6d <.text+0x5755e6d>
1454c0a97:     	cvttss2si	%xmm0, %rax
1454c0a9c:     	xorl	%ecx, %ecx
1454c0a9e:     	xorps	%xmm1, %xmm1
1454c0aa1:     	ucomiss	%xmm1, %xmm0
1454c0aa4:     	cmovbl	%ecx, %eax
1454c0aa7:     	ucomiss	0x42aa6e(%rip), %xmm0   # 0x1458eb51c
1454c0aae:     	movl	$0xffffffff, %r12d      # imm = 0xFFFFFFFF
1454c0ab4:     	cmovbel	%eax, %r12d
1454c0ab8:     	movq	0x18(%rbp), %rax
1454c0abc:     	testq	%rax, %rax
1454c0abf:     	je	0x1454c0b27 <.text+0x54bfb27>
1454c0ac1:     	movq	0x20(%rbp), %rcx
1454c0ac5:     	movw	$0x16, %dx
1454c0ac9:     	movzwl	0x36(%rax), %r9d
1454c0ace:     	movl	%r9d, %r10d
1454c0ad1:     	addl	%r10d, %r10d
1454c0ad4:     	movq	$-0x1, %r8
1454c0adb:     	nopl	(%rax,%rax)
1454c0ae0:     	testq	%r10, %r10
1454c0ae3:     	je	0x1454c0b10 <.text+0x54bfb10>
1454c0ae5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0aeb:     	seta	%r11b
1454c0aef:     	sbbb	$0x0, %r11b
1454c0af3:     	incq	%r8
1454c0af6:     	addq	$-0x2, %r10
1454c0afa:     	cmpb	$0x1, %r11b
1454c0afe:     	je	0x1454c0ae0 <.text+0x54bfae0>
1454c0b00:     	movzbl	%r11b, %r9d
1454c0b04:     	testl	%r9d, %r9d
1454c0b07:     	je	0x1454c0b20 <.text+0x54bfb20>
1454c0b09:     	jmp	0x1454c0b13 <.text+0x54bfb13>
1454c0b0b:     	nopl	(%rax,%rax)
1454c0b10:     	movq	%r9, %r8
1454c0b13:     	subq	$0x1, %rcx
1454c0b17:     	jb	0x1454c0b29 <.text+0x54bfb29>
1454c0b19:     	movq	0x50(%rax,%r8,8), %rax
1454c0b1e:     	jmp	0x1454c0ac9 <.text+0x54bfac9>
1454c0b20:     	movl	%r12d, 0x8(%rax,%r8,4)
1454c0b25:     	jmp	0x1454c0b56 <.text+0x54bfb56>
1454c0b27:     	xorl	%eax, %eax
1454c0b29:     	movq	%rbx, 0x30(%rbp)
1454c0b2d:     	movq	%rax, 0x38(%rbp)
1454c0b31:     	movq	$0x0, 0x40(%rbp)
1454c0b39:     	movq	%r8, 0x48(%rbp)
1454c0b3d:     	movq	$0x16, 0x50(%rbp)
1454c0b45:     	leaq	-0x8(%rbp), %rcx
1454c0b49:     	leaq	0x30(%rbp), %rdx
1454c0b4d:     	movl	%r12d, %r8d
1454c0b50:     	callq	0x145427a50 <.text+0x5426a50>
1454c0b55:     	nop
1454c0b56:     	movq	0x18(%rbp), %rax
1454c0b5a:     	testq	%rax, %rax
1454c0b5d:     	je	0x1454c0bc7 <.text+0x54bfbc7>
1454c0b5f:     	movq	0x20(%rbp), %rcx
1454c0b63:     	movw	$0x1c, %dx
1454c0b67:     	movzwl	0x36(%rax), %r9d
1454c0b6c:     	movl	%r9d, %r10d
1454c0b6f:     	addl	%r10d, %r10d
1454c0b72:     	movq	$-0x1, %r8
1454c0b79:     	nopl	(%rax)
1454c0b80:     	testq	%r10, %r10
1454c0b83:     	je	0x1454c0bb0 <.text+0x54bfbb0>
1454c0b85:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0b8b:     	seta	%r11b
1454c0b8f:     	sbbb	$0x0, %r11b
1454c0b93:     	incq	%r8
1454c0b96:     	addq	$-0x2, %r10
1454c0b9a:     	cmpb	$0x1, %r11b
1454c0b9e:     	je	0x1454c0b80 <.text+0x54bfb80>
1454c0ba0:     	movzbl	%r11b, %r9d
1454c0ba4:     	testl	%r9d, %r9d
1454c0ba7:     	je	0x1454c0bc0 <.text+0x54bfbc0>
1454c0ba9:     	jmp	0x1454c0bb3 <.text+0x54bfbb3>
1454c0bab:     	nopl	(%rax,%rax)
1454c0bb0:     	movq	%r9, %r8
1454c0bb3:     	subq	$0x1, %rcx
1454c0bb7:     	jb	0x1454c0bc9 <.text+0x54bfbc9>
1454c0bb9:     	movq	0x50(%rax,%r8,8), %rax
1454c0bbe:     	jmp	0x1454c0b67 <.text+0x54bfb67>
1454c0bc0:     	movl	%r12d, 0x8(%rax,%r8,4)
1454c0bc5:     	jmp	0x1454c0bf6 <.text+0x54bfbf6>
1454c0bc7:     	xorl	%eax, %eax
1454c0bc9:     	movq	%rbx, 0x30(%rbp)
1454c0bcd:     	movq	%rax, 0x38(%rbp)
1454c0bd1:     	movq	$0x0, 0x40(%rbp)
1454c0bd9:     	movq	%r8, 0x48(%rbp)
1454c0bdd:     	movq	$0x1c, 0x50(%rbp)
1454c0be5:     	leaq	-0x8(%rbp), %rcx
1454c0be9:     	leaq	0x30(%rbp), %rdx
1454c0bed:     	movl	%r12d, %r8d
1454c0bf0:     	callq	0x145427a50 <.text+0x5426a50>
1454c0bf5:     	nop
1454c0bf6:     	movq	0x18(%rbp), %rax
1454c0bfa:     	testq	%rax, %rax
1454c0bfd:     	je	0x1454c0c67 <.text+0x54bfc67>
1454c0bff:     	movq	0x20(%rbp), %rcx
1454c0c03:     	movw	$0x22, %dx
1454c0c07:     	movzwl	0x36(%rax), %r9d
1454c0c0c:     	movl	%r9d, %r10d
1454c0c0f:     	addl	%r10d, %r10d
1454c0c12:     	movq	$-0x1, %r8
1454c0c19:     	nopl	(%rax)
1454c0c20:     	testq	%r10, %r10
1454c0c23:     	je	0x1454c0c50 <.text+0x54bfc50>
1454c0c25:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0c2b:     	seta	%r11b
1454c0c2f:     	sbbb	$0x0, %r11b
1454c0c33:     	incq	%r8
1454c0c36:     	addq	$-0x2, %r10
1454c0c3a:     	cmpb	$0x1, %r11b
1454c0c3e:     	je	0x1454c0c20 <.text+0x54bfc20>
1454c0c40:     	movzbl	%r11b, %r9d
1454c0c44:     	testl	%r9d, %r9d
1454c0c47:     	je	0x1454c0c60 <.text+0x54bfc60>
1454c0c49:     	jmp	0x1454c0c53 <.text+0x54bfc53>
1454c0c4b:     	nopl	(%rax,%rax)
1454c0c50:     	movq	%r9, %r8
1454c0c53:     	subq	$0x1, %rcx
1454c0c57:     	jb	0x1454c0c69 <.text+0x54bfc69>
1454c0c59:     	movq	0x50(%rax,%r8,8), %rax
1454c0c5e:     	jmp	0x1454c0c07 <.text+0x54bfc07>
1454c0c60:     	movl	%r15d, 0x8(%rax,%r8,4)
1454c0c65:     	jmp	0x1454c0c96 <.text+0x54bfc96>
1454c0c67:     	xorl	%eax, %eax
1454c0c69:     	movq	%rbx, 0x30(%rbp)
1454c0c6d:     	movq	%rax, 0x38(%rbp)
1454c0c71:     	movq	$0x0, 0x40(%rbp)
1454c0c79:     	movq	%r8, 0x48(%rbp)
1454c0c7d:     	movq	$0x22, 0x50(%rbp)
1454c0c85:     	leaq	-0x8(%rbp), %rcx
1454c0c89:     	leaq	0x30(%rbp), %rdx
1454c0c8d:     	movl	%r15d, %r8d
1454c0c90:     	callq	0x145427a50 <.text+0x5426a50>
1454c0c95:     	nop
1454c0c96:     	movq	0x18(%rbp), %rax
1454c0c9a:     	testq	%rax, %rax
1454c0c9d:     	je	0x1454c0d0b <.text+0x54bfd0b>
1454c0c9f:     	movq	0x20(%rbp), %rcx
1454c0ca3:     	movw	$0x23, %dx
1454c0ca7:     	movzwl	0x36(%rax), %r9d
1454c0cac:     	movl	%r9d, %r10d
1454c0caf:     	addl	%r10d, %r10d
1454c0cb2:     	movq	$-0x1, %r8
1454c0cb9:     	nopl	(%rax)
1454c0cc0:     	testq	%r10, %r10
1454c0cc3:     	je	0x1454c0cf0 <.text+0x54bfcf0>
1454c0cc5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0ccb:     	seta	%r11b
1454c0ccf:     	sbbb	$0x0, %r11b
1454c0cd3:     	incq	%r8
1454c0cd6:     	addq	$-0x2, %r10
1454c0cda:     	cmpb	$0x1, %r11b
1454c0cde:     	je	0x1454c0cc0 <.text+0x54bfcc0>
1454c0ce0:     	movzbl	%r11b, %r9d
1454c0ce4:     	testl	%r9d, %r9d
1454c0ce7:     	je	0x1454c0d00 <.text+0x54bfd00>
1454c0ce9:     	jmp	0x1454c0cf3 <.text+0x54bfcf3>
1454c0ceb:     	nopl	(%rax,%rax)
1454c0cf0:     	movq	%r9, %r8
1454c0cf3:     	subq	$0x1, %rcx
1454c0cf7:     	jb	0x1454c0d0d <.text+0x54bfd0d>
1454c0cf9:     	movq	0x50(%rax,%r8,8), %rax
1454c0cfe:     	jmp	0x1454c0ca7 <.text+0x54bfca7>
1454c0d00:     	movl	$0xe, 0x8(%rax,%r8,4)
1454c0d09:     	jmp	0x1454c0d3d <.text+0x54bfd3d>
1454c0d0b:     	xorl	%eax, %eax
1454c0d0d:     	movq	%rbx, 0x30(%rbp)
1454c0d11:     	movq	%rax, 0x38(%rbp)
1454c0d15:     	movq	$0x0, 0x40(%rbp)
1454c0d1d:     	movq	%r8, 0x48(%rbp)
1454c0d21:     	movq	$0x23, 0x50(%rbp)
1454c0d29:     	leaq	-0x8(%rbp), %rcx
1454c0d2d:     	leaq	0x30(%rbp), %rdx
1454c0d31:     	movl	$0xe, %r8d
1454c0d37:     	callq	0x145427a50 <.text+0x5426a50>
1454c0d3c:     	nop
1454c0d3d:     	movq	0x18(%rbp), %rax
1454c0d41:     	testq	%rax, %rax
1454c0d44:     	je	0x1454c0dab <.text+0x54bfdab>
1454c0d46:     	movq	0x20(%rbp), %rcx
1454c0d4a:     	movw	$0x24, %dx
1454c0d4e:     	movzwl	0x36(%rax), %r9d
1454c0d53:     	movl	%r9d, %r10d
1454c0d56:     	addl	%r10d, %r10d
1454c0d59:     	movq	$-0x1, %r8
1454c0d60:     	testq	%r10, %r10
1454c0d63:     	je	0x1454c0d90 <.text+0x54bfd90>
1454c0d65:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0d6b:     	seta	%r11b
1454c0d6f:     	sbbb	$0x0, %r11b
1454c0d73:     	incq	%r8
1454c0d76:     	addq	$-0x2, %r10
1454c0d7a:     	cmpb	$0x1, %r11b
1454c0d7e:     	je	0x1454c0d60 <.text+0x54bfd60>
1454c0d80:     	movzbl	%r11b, %r9d
1454c0d84:     	testl	%r9d, %r9d
1454c0d87:     	je	0x1454c0da0 <.text+0x54bfda0>
1454c0d89:     	jmp	0x1454c0d93 <.text+0x54bfd93>
1454c0d8b:     	nopl	(%rax,%rax)
1454c0d90:     	movq	%r9, %r8
1454c0d93:     	subq	$0x1, %rcx
1454c0d97:     	jb	0x1454c0dad <.text+0x54bfdad>
1454c0d99:     	movq	0x50(%rax,%r8,8), %rax
1454c0d9e:     	jmp	0x1454c0d4e <.text+0x54bfd4e>
1454c0da0:     	movl	$0x100, 0x8(%rax,%r8,4) # imm = 0x100
1454c0da9:     	jmp	0x1454c0ddd <.text+0x54bfddd>
1454c0dab:     	xorl	%eax, %eax
1454c0dad:     	movq	%rbx, 0x30(%rbp)
1454c0db1:     	movq	%rax, 0x38(%rbp)
1454c0db5:     	movq	$0x0, 0x40(%rbp)
1454c0dbd:     	movq	%r8, 0x48(%rbp)
1454c0dc1:     	movq	$0x24, 0x50(%rbp)
1454c0dc9:     	leaq	-0x8(%rbp), %rcx
1454c0dcd:     	leaq	0x30(%rbp), %rdx
1454c0dd1:     	movl	$0x100, %r8d            # imm = 0x100
1454c0dd7:     	callq	0x145427a50 <.text+0x5426a50>
1454c0ddc:     	nop
1454c0ddd:     	movq	0x18(%rbp), %rax
1454c0de1:     	testq	%rax, %rax
1454c0de4:     	je	0x1454c0e4b <.text+0x54bfe4b>
1454c0de6:     	movq	0x20(%rbp), %rcx
1454c0dea:     	movw	$0x2e, %dx
1454c0dee:     	movzwl	0x36(%rax), %r9d
1454c0df3:     	movl	%r9d, %r10d
1454c0df6:     	addl	%r10d, %r10d
1454c0df9:     	movq	$-0x1, %r8
1454c0e00:     	testq	%r10, %r10
1454c0e03:     	je	0x1454c0e30 <.text+0x54bfe30>
1454c0e05:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0e0b:     	seta	%r11b
1454c0e0f:     	sbbb	$0x0, %r11b
1454c0e13:     	incq	%r8
1454c0e16:     	addq	$-0x2, %r10
1454c0e1a:     	cmpb	$0x1, %r11b
1454c0e1e:     	je	0x1454c0e00 <.text+0x54bfe00>
1454c0e20:     	movzbl	%r11b, %r9d
1454c0e24:     	testl	%r9d, %r9d
1454c0e27:     	je	0x1454c0e40 <.text+0x54bfe40>
1454c0e29:     	jmp	0x1454c0e33 <.text+0x54bfe33>
1454c0e2b:     	nopl	(%rax,%rax)
1454c0e30:     	movq	%r9, %r8
1454c0e33:     	subq	$0x1, %rcx
1454c0e37:     	jb	0x1454c0e4d <.text+0x54bfe4d>
1454c0e39:     	movq	0x50(%rax,%r8,8), %rax
1454c0e3e:     	jmp	0x1454c0dee <.text+0x54bfdee>
1454c0e40:     	movl	$0x0, 0x8(%rax,%r8,4)
1454c0e49:     	jmp	0x1454c0e7a <.text+0x54bfe7a>
1454c0e4b:     	xorl	%eax, %eax
1454c0e4d:     	movq	%rbx, 0x30(%rbp)
1454c0e51:     	movq	%rax, 0x38(%rbp)
1454c0e55:     	movq	$0x0, 0x40(%rbp)
1454c0e5d:     	movq	%r8, 0x48(%rbp)
1454c0e61:     	movq	$0x2e, 0x50(%rbp)
1454c0e69:     	leaq	-0x8(%rbp), %rcx
1454c0e6d:     	leaq	0x30(%rbp), %rdx
1454c0e71:     	xorl	%r8d, %r8d
1454c0e74:     	callq	0x145427a50 <.text+0x5426a50>
1454c0e79:     	nop
1454c0e7a:     	movq	0x18(%rbp), %rax
1454c0e7e:     	testq	%rax, %rax
1454c0e81:     	je	0x1454c0eeb <.text+0x54bfeeb>
1454c0e83:     	movq	0x20(%rbp), %rcx
1454c0e87:     	movw	$0x7e, %dx
1454c0e8b:     	movzwl	0x36(%rax), %r9d
1454c0e90:     	movl	%r9d, %r10d
1454c0e93:     	addl	%r10d, %r10d
1454c0e96:     	movq	$-0x1, %r8
1454c0e9d:     	nopl	(%rax)
1454c0ea0:     	testq	%r10, %r10
1454c0ea3:     	je	0x1454c0ed0 <.text+0x54bfed0>
1454c0ea5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0eab:     	seta	%r11b
1454c0eaf:     	sbbb	$0x0, %r11b
1454c0eb3:     	incq	%r8
1454c0eb6:     	addq	$-0x2, %r10
1454c0eba:     	cmpb	$0x1, %r11b
1454c0ebe:     	je	0x1454c0ea0 <.text+0x54bfea0>
1454c0ec0:     	movzbl	%r11b, %r9d
1454c0ec4:     	testl	%r9d, %r9d
1454c0ec7:     	je	0x1454c0ee0 <.text+0x54bfee0>
1454c0ec9:     	jmp	0x1454c0ed3 <.text+0x54bfed3>
1454c0ecb:     	nopl	(%rax,%rax)
1454c0ed0:     	movq	%r9, %r8
1454c0ed3:     	subq	$0x1, %rcx
1454c0ed7:     	jb	0x1454c0eed <.text+0x54bfeed>
1454c0ed9:     	movq	0x50(%rax,%r8,8), %rax
1454c0ede:     	jmp	0x1454c0e8b <.text+0x54bfe8b>
1454c0ee0:     	movl	$0x7d0, 0x8(%rax,%r8,4) # imm = 0x7D0
1454c0ee9:     	jmp	0x1454c0f1d <.text+0x54bff1d>
1454c0eeb:     	xorl	%eax, %eax
1454c0eed:     	movq	%rbx, 0x30(%rbp)
1454c0ef1:     	movq	%rax, 0x38(%rbp)
1454c0ef5:     	movq	$0x0, 0x40(%rbp)
1454c0efd:     	movq	%r8, 0x48(%rbp)
1454c0f01:     	movq	$0x7e, 0x50(%rbp)
1454c0f09:     	leaq	-0x8(%rbp), %rcx
1454c0f0d:     	leaq	0x30(%rbp), %rdx
1454c0f11:     	movl	$0x7d0, %r8d            # imm = 0x7D0
1454c0f17:     	callq	0x145427a50 <.text+0x5426a50>
1454c0f1c:     	nop
1454c0f1d:     	movq	0x18(%rbp), %rax
1454c0f21:     	testq	%rax, %rax
1454c0f24:     	je	0x1454c0f8b <.text+0x54bff8b>
1454c0f26:     	movq	0x20(%rbp), %rcx
1454c0f2a:     	movw	$0x7f, %dx
1454c0f2e:     	movzwl	0x36(%rax), %r9d
1454c0f33:     	movl	%r9d, %r10d
1454c0f36:     	addl	%r10d, %r10d
1454c0f39:     	movq	$-0x1, %r8
1454c0f40:     	testq	%r10, %r10
1454c0f43:     	je	0x1454c0f70 <.text+0x54bff70>
1454c0f45:     	cmpw	0x3a(%rax,%r8,2), %dx
1454c0f4b:     	seta	%r11b
1454c0f4f:     	sbbb	$0x0, %r11b
1454c0f53:     	incq	%r8
1454c0f56:     	addq	$-0x2, %r10
1454c0f5a:     	cmpb	$0x1, %r11b
1454c0f5e:     	je	0x1454c0f40 <.text+0x54bff40>
1454c0f60:     	movzbl	%r11b, %r9d
1454c0f64:     	testl	%r9d, %r9d
1454c0f67:     	je	0x1454c0f80 <.text+0x54bff80>
1454c0f69:     	jmp	0x1454c0f73 <.text+0x54bff73>
1454c0f6b:     	nopl	(%rax,%rax)
1454c0f70:     	movq	%r9, %r8
1454c0f73:     	subq	$0x1, %rcx
1454c0f77:     	jb	0x1454c0f8d <.text+0x54bff8d>
1454c0f79:     	movq	0x50(%rax,%r8,8), %rax
1454c0f7e:     	jmp	0x1454c0f2e <.text+0x54bff2e>
1454c0f80:     	movl	$0x7d0, 0x8(%rax,%r8,4) # imm = 0x7D0
1454c0f89:     	jmp	0x1454c0fbd <.text+0x54bffbd>
1454c0f8b:     	xorl	%eax, %eax
1454c0f8d:     	movq	%rbx, 0x30(%rbp)
1454c0f91:     	movq	%rax, 0x38(%rbp)
1454c0f95:     	movq	$0x0, 0x40(%rbp)
1454c0f9d:     	movq	%r8, 0x48(%rbp)
1454c0fa1:     	movq	$0x7f, 0x50(%rbp)
1454c0fa9:     	leaq	-0x8(%rbp), %rcx
1454c0fad:     	leaq	0x30(%rbp), %rdx
1454c0fb1:     	movl	$0x7d0, %r8d            # imm = 0x7D0
1454c0fb7:     	callq	0x145427a50 <.text+0x5426a50>
1454c0fbc:     	nop
1454c0fbd:     	movss	0x42a4c3(%rip), %xmm0   # 0x1458eb488
1454c0fc5:     	mulss	%xmm6, %xmm0
1454c0fc9:     	movq	0x18(%rbp), %rax
1454c0fcd:     	testq	%rax, %rax
1454c0fd0:     	je	0x1454c1039 <.text+0x54c0039>
1454c0fd2:     	movq	0x20(%rbp), %rcx
1454c0fd6:     	movl	$0x81, %edx
1454c0fdb:     	movzwl	0x36(%rax), %r8d
1454c0fe0:     	movl	%r8d, %r10d
1454c0fe3:     	addl	%r10d, %r10d
1454c0fe6:     	movq	$-0x1, %r9
1454c0fed:     	nopl	(%rax)
1454c0ff0:     	testq	%r10, %r10
1454c0ff3:     	je	0x1454c1020 <.text+0x54c0020>
1454c0ff5:     	movzwl	0x3a(%rax,%r9,2), %r11d
1454c0ffb:     	cmpl	%r11d, %edx
1454c0ffe:     	seta	%r11b
1454c1002:     	sbbb	$0x0, %r11b
1454c1006:     	incq	%r9
1454c1009:     	addq	$-0x2, %r10
1454c100d:     	cmpb	$0x1, %r11b
1454c1011:     	je	0x1454c0ff0 <.text+0x54bfff0>
1454c1013:     	movzbl	%r11b, %r8d
1454c1017:     	testl	%r8d, %r8d
1454c101a:     	je	0x1454c1030 <.text+0x54c0030>
1454c101c:     	jmp	0x1454c1023 <.text+0x54c0023>
1454c101e:     	nop
1454c1020:     	movq	%r8, %r9
1454c1023:     	subq	$0x1, %rcx
1454c1027:     	jb	0x1454c103b <.text+0x54c003b>
1454c1029:     	movq	0x50(%rax,%r9,8), %rax
1454c102e:     	jmp	0x1454c0fdb <.text+0x54bffdb>
1454c1030:     	movss	%xmm0, 0x8(%rax,%r9,4)
1454c1037:     	jmp	0x1454c106a <.text+0x54c006a>
1454c1039:     	xorl	%eax, %eax
1454c103b:     	movd	%xmm0, %r8d
1454c1040:     	movq	%rbx, 0x30(%rbp)
1454c1044:     	movq	%rax, 0x38(%rbp)
1454c1048:     	movq	$0x0, 0x40(%rbp)
1454c1050:     	movq	%r9, 0x48(%rbp)
1454c1054:     	movq	$0x81, 0x50(%rbp)
1454c105c:     	leaq	-0x8(%rbp), %rcx
1454c1060:     	leaq	0x30(%rbp), %rdx
1454c1064:     	callq	0x145427a50 <.text+0x5426a50>
1454c1069:     	nop
1454c106a:     	mulss	0x43bbc6(%rip), %xmm6   # 0x1458fcc38
1454c1072:     	movq	0x18(%rbp), %rax
1454c1076:     	testq	%rax, %rax
1454c1079:     	je	0x1454c10e9 <.text+0x54c00e9>
1454c107b:     	movq	0x20(%rbp), %rcx
1454c107f:     	movl	$0x82, %edx
1454c1084:     	movzwl	0x36(%rax), %r8d
1454c1089:     	movl	%r8d, %r10d
1454c108c:     	addl	%r10d, %r10d
1454c108f:     	movq	$-0x1, %r9
1454c1096:     	nopw	%cs:(%rax,%rax)
1454c10a0:     	testq	%r10, %r10
1454c10a3:     	je	0x1454c10d0 <.text+0x54c00d0>
1454c10a5:     	movzwl	0x3a(%rax,%r9,2), %r11d
1454c10ab:     	cmpl	%r11d, %edx
1454c10ae:     	seta	%r11b
1454c10b2:     	sbbb	$0x0, %r11b
1454c10b6:     	incq	%r9
1454c10b9:     	addq	$-0x2, %r10
1454c10bd:     	cmpb	$0x1, %r11b
1454c10c1:     	je	0x1454c10a0 <.text+0x54c00a0>
1454c10c3:     	movzbl	%r11b, %r8d
1454c10c7:     	testl	%r8d, %r8d
1454c10ca:     	je	0x1454c10e0 <.text+0x54c00e0>
1454c10cc:     	jmp	0x1454c10d3 <.text+0x54c00d3>
1454c10ce:     	nop
1454c10d0:     	movq	%r8, %r9
1454c10d3:     	subq	$0x1, %rcx
1454c10d7:     	jb	0x1454c10eb <.text+0x54c00eb>
1454c10d9:     	movq	0x50(%rax,%r9,8), %rax
1454c10de:     	jmp	0x1454c1084 <.text+0x54c0084>
1454c10e0:     	movss	%xmm6, 0x8(%rax,%r9,4)
1454c10e7:     	jmp	0x1454c111a <.text+0x54c011a>
1454c10e9:     	xorl	%eax, %eax
1454c10eb:     	movd	%xmm6, %r8d
1454c10f0:     	movq	%rbx, 0x30(%rbp)
1454c10f4:     	movq	%rax, 0x38(%rbp)
1454c10f8:     	movq	$0x0, 0x40(%rbp)
1454c1100:     	movq	%r9, 0x48(%rbp)
1454c1104:     	movq	$0x82, 0x50(%rbp)
1454c110c:     	leaq	-0x8(%rbp), %rcx
1454c1110:     	leaq	0x30(%rbp), %rdx
1454c1114:     	callq	0x145427a50 <.text+0x5426a50>
1454c1119:     	nop
1454c111a:     	movq	0x18(%rbp), %rax
1454c111e:     	testq	%rax, %rax
1454c1121:     	je	0x1454c1187 <.text+0x54c0187>
1454c1123:     	movq	0x20(%rbp), %rcx
1454c1127:     	movl	$0x83, %edx
1454c112c:     	movzwl	0x36(%rax), %r9d
1454c1131:     	movl	%r9d, %r10d
1454c1134:     	addl	%r10d, %r10d
1454c1137:     	movq	$-0x1, %r8
1454c113e:     	nop
1454c1140:     	testq	%r10, %r10
1454c1143:     	je	0x1454c1170 <.text+0x54c0170>
1454c1145:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c114b:     	cmpl	%r11d, %edx
1454c114e:     	seta	%r11b
1454c1152:     	sbbb	$0x0, %r11b
1454c1156:     	incq	%r8
1454c1159:     	addq	$-0x2, %r10
1454c115d:     	cmpb	$0x1, %r11b
1454c1161:     	je	0x1454c1140 <.text+0x54c0140>
1454c1163:     	movzbl	%r11b, %r9d
1454c1167:     	testl	%r9d, %r9d
1454c116a:     	je	0x1454c1180 <.text+0x54c0180>
1454c116c:     	jmp	0x1454c1173 <.text+0x54c0173>
1454c116e:     	nop
1454c1170:     	movq	%r9, %r8
1454c1173:     	subq	$0x1, %rcx
1454c1177:     	jb	0x1454c1189 <.text+0x54c0189>
1454c1179:     	movq	0x50(%rax,%r8,8), %rax
1454c117e:     	jmp	0x1454c112c <.text+0x54c012c>
1454c1180:     	movl	%r14d, 0x8(%rax,%r8,4)
1454c1185:     	jmp	0x1454c11b6 <.text+0x54c01b6>
1454c1187:     	xorl	%eax, %eax
1454c1189:     	movq	%rbx, 0x30(%rbp)
1454c118d:     	movq	%rax, 0x38(%rbp)
1454c1191:     	movq	$0x0, 0x40(%rbp)
1454c1199:     	movq	%r8, 0x48(%rbp)
1454c119d:     	movq	$0x83, 0x50(%rbp)
1454c11a5:     	leaq	-0x8(%rbp), %rcx
1454c11a9:     	leaq	0x30(%rbp), %rdx
1454c11ad:     	movl	%r14d, %r8d
1454c11b0:     	callq	0x145427a50 <.text+0x5426a50>
1454c11b5:     	nop
1454c11b6:     	movq	0x18(%rbp), %rax
1454c11ba:     	testq	%rax, %rax
1454c11bd:     	je	0x1454c1227 <.text+0x54c0227>
1454c11bf:     	movq	0x20(%rbp), %rcx
1454c11c3:     	movl	$0x84, %edx
1454c11c8:     	movzwl	0x36(%rax), %r9d
1454c11cd:     	movl	%r9d, %r10d
1454c11d0:     	addl	%r10d, %r10d
1454c11d3:     	movq	$-0x1, %r8
1454c11da:     	nopw	(%rax,%rax)
1454c11e0:     	testq	%r10, %r10
1454c11e3:     	je	0x1454c1210 <.text+0x54c0210>
1454c11e5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c11eb:     	cmpl	%r11d, %edx
1454c11ee:     	seta	%r11b
1454c11f2:     	sbbb	$0x0, %r11b
1454c11f6:     	incq	%r8
1454c11f9:     	addq	$-0x2, %r10
1454c11fd:     	cmpb	$0x1, %r11b
1454c1201:     	je	0x1454c11e0 <.text+0x54c01e0>
1454c1203:     	movzbl	%r11b, %r9d
1454c1207:     	testl	%r9d, %r9d
1454c120a:     	je	0x1454c1220 <.text+0x54c0220>
1454c120c:     	jmp	0x1454c1213 <.text+0x54c0213>
1454c120e:     	nop
1454c1210:     	movq	%r9, %r8
1454c1213:     	subq	$0x1, %rcx
1454c1217:     	jb	0x1454c1229 <.text+0x54c0229>
1454c1219:     	movq	0x50(%rax,%r8,8), %rax
1454c121e:     	jmp	0x1454c11c8 <.text+0x54c01c8>
1454c1220:     	movl	%r14d, 0x8(%rax,%r8,4)
1454c1225:     	jmp	0x1454c1256 <.text+0x54c0256>
1454c1227:     	xorl	%eax, %eax
1454c1229:     	movq	%rbx, 0x30(%rbp)
1454c122d:     	movq	%rax, 0x38(%rbp)
1454c1231:     	movq	$0x0, 0x40(%rbp)
1454c1239:     	movq	%r8, 0x48(%rbp)
1454c123d:     	movq	$0x84, 0x50(%rbp)
1454c1245:     	leaq	-0x8(%rbp), %rcx
1454c1249:     	leaq	0x30(%rbp), %rdx
1454c124d:     	movl	%r14d, %r8d
1454c1250:     	callq	0x145427a50 <.text+0x5426a50>
1454c1255:     	nop
1454c1256:     	movq	0x18(%rbp), %rax
1454c125a:     	testq	%rax, %rax
1454c125d:     	je	0x1454c12cb <.text+0x54c02cb>
1454c125f:     	movq	0x20(%rbp), %rcx
1454c1263:     	movl	$0x86, %edx
1454c1268:     	movzwl	0x36(%rax), %r9d
1454c126d:     	movl	%r9d, %r10d
1454c1270:     	addl	%r10d, %r10d
1454c1273:     	movq	$-0x1, %r8
1454c127a:     	nopw	(%rax,%rax)
1454c1280:     	testq	%r10, %r10
1454c1283:     	je	0x1454c12b0 <.text+0x54c02b0>
1454c1285:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c128b:     	cmpl	%r11d, %edx
1454c128e:     	seta	%r11b
1454c1292:     	sbbb	$0x0, %r11b
1454c1296:     	incq	%r8
1454c1299:     	addq	$-0x2, %r10
1454c129d:     	cmpb	$0x1, %r11b
1454c12a1:     	je	0x1454c1280 <.text+0x54c0280>
1454c12a3:     	movzbl	%r11b, %r9d
1454c12a7:     	testl	%r9d, %r9d
1454c12aa:     	je	0x1454c12c0 <.text+0x54c02c0>
1454c12ac:     	jmp	0x1454c12b3 <.text+0x54c02b3>
1454c12ae:     	nop
1454c12b0:     	movq	%r9, %r8
1454c12b3:     	subq	$0x1, %rcx
1454c12b7:     	jb	0x1454c12cd <.text+0x54c02cd>
1454c12b9:     	movq	0x50(%rax,%r8,8), %rax
1454c12be:     	jmp	0x1454c1268 <.text+0x54c0268>
1454c12c0:     	movl	$0x40a00000, 0x8(%rax,%r8,4) # imm = 0x40A00000
1454c12c9:     	jmp	0x1454c12fd <.text+0x54c02fd>
1454c12cb:     	xorl	%eax, %eax
1454c12cd:     	movq	%rbx, 0x30(%rbp)
1454c12d1:     	movq	%rax, 0x38(%rbp)
1454c12d5:     	movq	$0x0, 0x40(%rbp)
1454c12dd:     	movq	%r8, 0x48(%rbp)
1454c12e1:     	movq	$0x86, 0x50(%rbp)
1454c12e9:     	leaq	-0x8(%rbp), %rcx
1454c12ed:     	leaq	0x30(%rbp), %rdx
1454c12f1:     	movl	$0x40a00000, %r8d       # imm = 0x40A00000
1454c12f7:     	callq	0x145427a50 <.text+0x5426a50>
1454c12fc:     	nop
1454c12fd:     	movq	0x18(%rbp), %rax
1454c1301:     	testq	%rax, %rax
1454c1304:     	je	0x1454c137b <.text+0x54c037b>
1454c1306:     	movq	0x20(%rbp), %rcx
1454c130a:     	movl	$0x87, %edx
1454c130f:     	movzwl	0x36(%rax), %r9d
1454c1314:     	movl	%r9d, %r10d
1454c1317:     	addl	%r10d, %r10d
1454c131a:     	movq	$-0x1, %r8
1454c1321:     	nopw	%cs:(%rax,%rax)
1454c1330:     	testq	%r10, %r10
1454c1333:     	je	0x1454c1360 <.text+0x54c0360>
1454c1335:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c133b:     	cmpl	%r11d, %edx
1454c133e:     	seta	%r11b
1454c1342:     	sbbb	$0x0, %r11b
1454c1346:     	incq	%r8
1454c1349:     	addq	$-0x2, %r10
1454c134d:     	cmpb	$0x1, %r11b
1454c1351:     	je	0x1454c1330 <.text+0x54c0330>
1454c1353:     	movzbl	%r11b, %r9d
1454c1357:     	testl	%r9d, %r9d
1454c135a:     	je	0x1454c1370 <.text+0x54c0370>
1454c135c:     	jmp	0x1454c1363 <.text+0x54c0363>
1454c135e:     	nop
1454c1360:     	movq	%r9, %r8
1454c1363:     	subq	$0x1, %rcx
1454c1367:     	jb	0x1454c137d <.text+0x54c037d>
1454c1369:     	movq	0x50(%rax,%r8,8), %rax
1454c136e:     	jmp	0x1454c130f <.text+0x54c030f>
1454c1370:     	movl	$0x41200000, 0x8(%rax,%r8,4) # imm = 0x41200000
1454c1379:     	jmp	0x1454c13ad <.text+0x54c03ad>
1454c137b:     	xorl	%eax, %eax
1454c137d:     	movq	%rbx, 0x30(%rbp)
1454c1381:     	movq	%rax, 0x38(%rbp)
1454c1385:     	movq	$0x0, 0x40(%rbp)
1454c138d:     	movq	%r8, 0x48(%rbp)
1454c1391:     	movq	$0x87, 0x50(%rbp)
1454c1399:     	leaq	-0x8(%rbp), %rcx
1454c139d:     	leaq	0x30(%rbp), %rdx
1454c13a1:     	movl	$0x41200000, %r8d       # imm = 0x41200000
1454c13a7:     	callq	0x145427a50 <.text+0x5426a50>
1454c13ac:     	nop
1454c13ad:     	movq	0x18(%rbp), %rax
1454c13b1:     	testq	%rax, %rax
1454c13b4:     	je	0x1454c142b <.text+0x54c042b>
1454c13b6:     	movq	0x20(%rbp), %rcx
1454c13ba:     	movl	$0x91, %edx
1454c13bf:     	movzwl	0x36(%rax), %r9d
1454c13c4:     	movl	%r9d, %r10d
1454c13c7:     	addl	%r10d, %r10d
1454c13ca:     	movq	$-0x1, %r8
1454c13d1:     	nopw	%cs:(%rax,%rax)
1454c13e0:     	testq	%r10, %r10
1454c13e3:     	je	0x1454c1410 <.text+0x54c0410>
1454c13e5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454c13eb:     	cmpl	%r11d, %edx
1454c13ee:     	seta	%r11b
1454c13f2:     	sbbb	$0x0, %r11b
1454c13f6:     	incq	%r8
1454c13f9:     	addq	$-0x2, %r10
1454c13fd:     	cmpb	$0x1, %r11b
1454c1401:     	je	0x1454c13e0 <.text+0x54c03e0>
1454c1403:     	movzbl	%r11b, %r9d
1454c1407:     	testl	%r9d, %r9d
1454c140a:     	je	0x1454c1420 <.text+0x54c0420>
1454c140c:     	jmp	0x1454c1413 <.text+0x54c0413>
1454c140e:     	nop
1454c1410:     	movq	%r9, %r8
1454c1413:     	subq	$0x1, %rcx
1454c1417:     	jb	0x1454c142d <.text+0x54c042d>
1454c1419:     	movq	0x50(%rax,%r8,8), %rax
1454c141e:     	jmp	0x1454c13bf <.text+0x54c03bf>
1454c1420:     	movl	$0x3f800000, 0x8(%rax,%r8,4) # imm = 0x3F800000
1454c1429:     	jmp	0x1454c145d <.text+0x54c045d>
1454c142b:     	xorl	%eax, %eax
1454c142d:     	movq	%rbx, 0x30(%rbp)
1454c1431:     	movq	%rax, 0x38(%rbp)
1454c1435:     	movq	$0x0, 0x40(%rbp)
1454c143d:     	movq	%r8, 0x48(%rbp)
1454c1441:     	movq	$0x91, 0x50(%rbp)
1454c1449:     	leaq	-0x8(%rbp), %rcx
1454c144d:     	leaq	0x30(%rbp), %rdx
1454c1451:     	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1454c1457:     	callq	0x145427a50 <.text+0x5426a50>
1454c145c:     	nop
1454c145d:     	movq	0x3d0(%rsi), %r8
1454c1464:     	leaq	0x18(%rbp), %rbx
1454c1468:     	movq	%rbx, %rcx
1454c146b:     	movw	$0x10, %dx
1454c146f:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454c1474:     	nop
1454c1475:     	movq	0xf8(%rbp), %r14
1454c147c:     	movss	0x3e8(%rsi), %xmm1
1454c1484:     	movss	0x3ec(%rsi), %xmm0
1454c148c:     	subss	0x4(%r14), %xmm0
1454c1492:     	subss	(%r14), %xmm1
1454c1497:     	callq	0x145756e37 <.text+0x5755e37>
1454c149c:     	movl	$0x0, -0x10(%rbp)
1454c14a3:     	movq	$0x0, -0x28(%rbp)
1454c14ab:     	movq	$0x1, -0x20(%rbp)
1454c14b3:     	movq	$0x0, -0x18(%rbp)
1454c14bb:     	movups	0x14e9abe(%rip), %xmm1  # 0x1469aaf80
1454c14c2:     	movaps	%xmm1, -0x40(%rbp)
1454c14c6:     	movabsq	$0x40490fdb40200000, %rax # imm = 0x40490FDB40200000
1454c14d0:     	movq	%rax, -0x30(%rbp)
1454c14d4:     	movl	$0x40e00000, -0x3c(%rbp) # imm = 0x40E00000
1454c14db:     	movb	$0x1, 0x67(%rbp)
1454c14df:     	movq	%rbx, 0x38(%rsp)
1454c14e4:     	leaq	-0x40(%rbp), %rax
1454c14e8:     	movq	%rax, 0x30(%rsp)
1454c14ed:     	movss	%xmm0, 0x28(%rsp)
1454c14f3:     	movq	%r14, 0x20(%rsp)
1454c14f8:     	leaq	-0x28(%rbp), %rcx
1454c14fc:     	movq	%rdi, %rdx
1454c14ff:     	movb	$0x3, %r8b
1454c1502:     	xorl	%r9d, %r9d
1454c1505:     	callq	0x1454ff300 <.text+0x54fe300>
1454c150a:     	nop
1454c150b:     	movups	-0x28(%rbp), %xmm0
1454c150f:     	movups	-0x18(%rbp), %xmm1
1454c1513:     	movaps	%xmm1, 0x40(%rbp)
1454c1517:     	movaps	%xmm0, 0x30(%rbp)
1454c151b:     	movb	$0x0, 0x67(%rbp)
1454c151f:     	leaq	-0x8(%rbp), %rcx
1454c1523:     	leaq	0x30(%rbp), %rdx
1454c1527:     	callq	0x1454ffad0 <.text+0x54fead0>
1454c152c:     	nop
1454c152d:     	movq	0x548(%rsi), %rdi
1454c1534:     	cmpq	0x538(%rsi), %rdi
1454c153b:     	jne	0x1454c154a <.text+0x54c054a>
1454c153d:     	leaq	0x538(%rsi), %rcx
1454c1544:     	callq	0x1457580b0 <.text+0x57570b0>
1454c1549:     	nop
1454c154a:     	movq	0x540(%rsi), %rax
1454c1551:     	movq	%rdi, %rcx
1454c1554:     	shlq	$0x5, %rcx
1454c1558:     	movups	-0x8(%rbp), %xmm0
1454c155c:     	movups	0x8(%rbp), %xmm1
1454c1560:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c1565:     	movups	%xmm0, (%rax,%rcx)
1454c1569:     	incq	%rdi
1454c156c:     	movq	%rdi, 0x548(%rsi)
1454c1573:     	leaq	0x18(%rbp), %rcx
1454c1577:     	callq	0x1455127d0 <.text+0x55117d0>
1454c157c:     	movaps	0x70(%rbp), %xmm6
1454c1580:     	addq	$0x100, %rsp            # imm = 0x100
1454c1587:     	popq	%rbx
1454c1588:     	popq	%rdi
1454c1589:     	popq	%rsi
1454c158a:     	popq	%r12
1454c158c:     	popq	%r14
1454c158e:     	popq	%r15
1454c1590:     	popq	%rbp
1454c1591:     	retq

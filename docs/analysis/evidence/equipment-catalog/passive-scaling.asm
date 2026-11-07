AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e0750:     	pushq	%rsi
1458e0751:     	pushq	%rdi
1458e0752:     	pushq	%rbx
1458e0753:     	subq	$0x20, %rsp
1458e0757:     	movq	%rcx, %rax
1458e075a:     	movzbl	(%rdx), %ecx
1458e075d:     	cmpq	$0x22, %rcx
1458e0761:     	ja	0x1458e07aa <.text+0x58df7aa>
1458e0763:     	leaq	0x15978ae(%rip), %r8    # 0x146e78018
1458e076a:     	movslq	(%r8,%rcx,4), %rcx
1458e076e:     	addq	%r8, %rcx
1458e0771:     	jmpq	*%rcx
1458e0773:     	movups	0x20(%rdx), %xmm0
1458e0777:     	movups	0x30(%rdx), %xmm1
1458e077b:     	movups	%xmm1, 0x30(%rax)
1458e077f:     	movups	%xmm0, 0x20(%rax)
1458e0783:     	movups	0x10(%rdx), %xmm0
1458e0787:     	movups	%xmm0, 0x10(%rax)
1458e078b:     	movsd	0x4(%rdx), %xmm0
1458e0790:     	movaps	0x48cb69(%rip), %xmm1   # 0x145d6d300
1458e0797:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e079b:     	mulps	%xmm0, %xmm1
1458e079e:     	movlps	%xmm1, 0x4(%rax)
1458e07a2:     	movb	$0x0, (%rax)
1458e07a5:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e07aa:     	movups	(%rdx), %xmm0
1458e07ad:     	movups	0x10(%rdx), %xmm1
1458e07b1:     	movups	0x20(%rdx), %xmm2
1458e07b5:     	movups	0x30(%rdx), %xmm3
1458e07b9:     	movups	%xmm3, 0x30(%rax)
1458e07bd:     	movups	%xmm2, 0x20(%rax)
1458e07c1:     	movups	%xmm1, 0x10(%rax)
1458e07c5:     	movups	%xmm0, (%rax)
1458e07c8:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e07cd:     	mulss	0x4(%rdx), %xmm2
1458e07d2:     	movss	%xmm2, 0x4(%rax)
1458e07d7:     	movb	$0x1f, (%rax)
1458e07da:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e07df:     	movups	0x10(%rdx), %xmm0
1458e07e3:     	movups	0x20(%rdx), %xmm1
1458e07e7:     	movups	%xmm1, 0x20(%rax)
1458e07eb:     	movups	%xmm0, 0x10(%rax)
1458e07ef:     	movsd	0x4(%rdx), %xmm0
1458e07f4:     	movaps	0x48cb05(%rip), %xmm1   # 0x145d6d300
1458e07fb:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e07ff:     	mulps	%xmm0, %xmm1
1458e0802:     	movlps	%xmm1, 0x4(%rax)
1458e0806:     	movb	$0x10, (%rax)
1458e0809:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e080e:     	movl	0x4(%rdx), %ecx
1458e0811:     	movl	%ecx, 0x4(%rax)
1458e0814:     	movsd	0x8(%rdx), %xmm0
1458e0819:     	movaps	0x48cae0(%rip), %xmm1   # 0x145d6d300
1458e0820:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e0824:     	mulps	%xmm0, %xmm1
1458e0827:     	movlps	%xmm1, 0x8(%rax)
1458e082b:     	movq	0x10(%rdx), %rcx
1458e082f:     	movq	%rcx, 0x10(%rax)
1458e0833:     	movb	$0xc, (%rax)
1458e0836:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e083b:     	movups	0x10(%rdx), %xmm0
1458e083f:     	movups	0x20(%rdx), %xmm1
1458e0843:     	movups	%xmm1, 0x20(%rax)
1458e0847:     	movups	%xmm0, 0x10(%rax)
1458e084b:     	movzbl	0x1(%rdx), %ecx
1458e084f:     	movl	0x8(%rdx), %r8d
1458e0853:     	movss	0xc(%rdx), %xmm0
1458e0858:     	mulss	0x4(%rdx), %xmm2
1458e085d:     	movb	%cl, 0x1(%rax)
1458e0860:     	movss	%xmm2, 0x4(%rax)
1458e0865:     	movl	%r8d, 0x8(%rax)
1458e0869:     	movss	%xmm0, 0xc(%rax)
1458e086e:     	movb	$0xf, (%rax)
1458e0871:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0876:     	movq	0x10(%rdx), %rdi
1458e087a:     	movaps	%xmm2, %xmm0
1458e087d:     	movq	%rax, %rsi
1458e0880:     	movq	%rdx, %rbx
1458e0883:     	callq	0x145bc97b1 <.text+0x5bc87b1>
1458e0888:     	movq	%rsi, %rax
1458e088b:     	maxss	0x48cad9(%rip), %xmm0   # 0x145d6d36c
1458e0893:     	xorps	%xmm1, %xmm1
1458e0896:     	maxss	%xmm0, %xmm1
1458e089a:     	movss	0x49379e(%rip), %xmm0   # 0x145d74040
1458e08a2:     	minss	%xmm1, %xmm0
1458e08a6:     	cvttss2si	%xmm0, %ecx
1458e08aa:     	movq	%rdi, 0x10(%rsi)
1458e08ae:     	movsd	0x4(%rbx), %xmm0
1458e08b3:     	movsd	%xmm0, 0x4(%rsi)
1458e08b8:     	movb	%cl, 0x1(%rsi)
1458e08bb:     	movb	$0x21, (%rsi)
1458e08be:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e08c3:     	movups	0x10(%rdx), %xmm0
1458e08c7:     	movups	0x20(%rdx), %xmm1
1458e08cb:     	movups	%xmm1, 0x20(%rax)
1458e08cf:     	movups	%xmm0, 0x10(%rax)
1458e08d3:     	movl	0xc(%rdx), %ecx
1458e08d6:     	movzbl	0x1(%rdx), %r8d
1458e08db:     	movsd	0x4(%rdx), %xmm0
1458e08e0:     	movaps	0x48ca19(%rip), %xmm1   # 0x145d6d300
1458e08e7:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e08eb:     	mulps	%xmm0, %xmm1
1458e08ee:     	movlps	%xmm1, 0x4(%rax)
1458e08f2:     	movl	%ecx, 0xc(%rax)
1458e08f5:     	movb	%r8b, 0x1(%rax)
1458e08f9:     	movb	$0x3, (%rax)
1458e08fc:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0901:     	movups	0x10(%rdx), %xmm0
1458e0905:     	movups	0x20(%rdx), %xmm1
1458e0909:     	movups	%xmm1, 0x20(%rax)
1458e090d:     	movups	%xmm0, 0x10(%rax)
1458e0911:     	mulss	0x8(%rdx), %xmm2
1458e0916:     	movl	0x4(%rdx), %ecx
1458e0919:     	movl	%ecx, 0x4(%rax)
1458e091c:     	movss	%xmm2, 0x8(%rax)
1458e0921:     	movb	$0x6, (%rax)
1458e0924:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0929:     	mulss	0x4(%rdx), %xmm2
1458e092e:     	movups	0x8(%rdx), %xmm0
1458e0932:     	movups	%xmm0, 0x8(%rax)
1458e0936:     	movss	%xmm2, 0x4(%rax)
1458e093b:     	movb	$0xd, (%rax)
1458e093e:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0943:     	movups	0x18(%rdx), %xmm0
1458e0947:     	movups	0x28(%rdx), %xmm1
1458e094b:     	movups	%xmm1, 0x28(%rax)
1458e094f:     	movups	%xmm0, 0x18(%rax)
1458e0953:     	movq	0x10(%rdx), %rcx
1458e0957:     	movl	0xc(%rdx), %r8d
1458e095b:     	movq	%rcx, 0x10(%rax)
1458e095f:     	movsd	0x4(%rdx), %xmm0
1458e0964:     	movaps	0x48c995(%rip), %xmm1   # 0x145d6d300
1458e096b:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e096f:     	mulps	%xmm0, %xmm1
1458e0972:     	movlps	%xmm1, 0x4(%rax)
1458e0976:     	movl	%r8d, 0xc(%rax)
1458e097a:     	movb	$0x2, (%rax)
1458e097d:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0982:     	movups	0x10(%rdx), %xmm0
1458e0986:     	movups	0x20(%rdx), %xmm1
1458e098a:     	movups	%xmm1, 0x20(%rax)
1458e098e:     	movups	%xmm0, 0x10(%rax)
1458e0992:     	movl	0x8(%rdx), %ecx
1458e0995:     	movss	0xc(%rdx), %xmm0
1458e099a:     	mulss	0x4(%rdx), %xmm2
1458e099f:     	movss	%xmm2, 0x4(%rax)
1458e09a4:     	movl	%ecx, 0x8(%rax)
1458e09a7:     	movss	%xmm0, 0xc(%rax)
1458e09ac:     	movb	$0x7, (%rax)
1458e09af:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e09b4:     	cmpl	$-0x1, 0x8(%rdx)
1458e09b8:     	movups	0x28(%rdx), %xmm0
1458e09bc:     	movups	%xmm0, 0x28(%rax)
1458e09c0:     	movups	0x18(%rdx), %xmm0
1458e09c4:     	movups	%xmm0, 0x18(%rax)
1458e09c8:     	je	0x1458e0ba7 <.text+0x58dfba7>
1458e09ce:     	leaq	0x8(%rdx), %rcx
1458e09d2:     	movl	0x8(%rcx), %r8d
1458e09d6:     	movl	%r8d, 0x10(%rax)
1458e09da:     	movq	(%rcx), %rcx
1458e09dd:     	movq	%rcx, 0x8(%rax)
1458e09e1:     	mulss	0x4(%rdx), %xmm2
1458e09e6:     	movss	%xmm2, 0x4(%rax)
1458e09eb:     	jmp	0x1458e0bcf <.text+0x58dfbcf>
1458e09f0:     	movups	0x10(%rdx), %xmm0
1458e09f4:     	movups	0x20(%rdx), %xmm1
1458e09f8:     	movups	%xmm1, 0x20(%rax)
1458e09fc:     	movups	%xmm0, 0x10(%rax)
1458e0a00:     	movsd	0x4(%rdx), %xmm0
1458e0a05:     	movaps	0x48c8f4(%rip), %xmm1   # 0x145d6d300
1458e0a0c:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e0a10:     	mulps	%xmm0, %xmm1
1458e0a13:     	movlps	%xmm1, 0x4(%rax)
1458e0a17:     	movb	$0x11, (%rax)
1458e0a1a:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0a1f:     	movups	0x10(%rdx), %xmm0
1458e0a23:     	movups	0x20(%rdx), %xmm1
1458e0a27:     	movups	%xmm1, 0x20(%rax)
1458e0a2b:     	movups	%xmm0, 0x10(%rax)
1458e0a2f:     	movsd	0x4(%rdx), %xmm0
1458e0a34:     	movaps	0x48c8c5(%rip), %xmm1   # 0x145d6d300
1458e0a3b:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e0a3f:     	mulps	%xmm0, %xmm1
1458e0a42:     	movlps	%xmm1, 0x4(%rax)
1458e0a46:     	movb	$0x12, (%rax)
1458e0a49:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0a4e:     	movups	0x18(%rdx), %xmm0
1458e0a52:     	movups	0x28(%rdx), %xmm1
1458e0a56:     	movups	%xmm1, 0x28(%rax)
1458e0a5a:     	movups	%xmm0, 0x18(%rax)
1458e0a5e:     	movl	0x14(%rdx), %ecx
1458e0a61:     	movsd	0x4(%rdx), %xmm0
1458e0a66:     	movaps	0x48c893(%rip), %xmm1   # 0x145d6d300
1458e0a6d:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e0a71:     	mulps	%xmm0, %xmm1
1458e0a74:     	movlps	%xmm1, 0x4(%rax)
1458e0a78:     	movq	0xc(%rdx), %rdx
1458e0a7c:     	movq	%rdx, 0xc(%rax)
1458e0a80:     	movl	%ecx, 0x14(%rax)
1458e0a83:     	movb	$0x4, (%rax)
1458e0a86:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0a8b:     	movups	0x8(%rdx), %xmm0
1458e0a8f:     	movups	0x18(%rdx), %xmm1
1458e0a93:     	movups	%xmm1, 0x18(%rax)
1458e0a97:     	movups	%xmm0, 0x8(%rax)
1458e0a9b:     	mulss	0x4(%rdx), %xmm2
1458e0aa0:     	movss	%xmm2, 0x4(%rax)
1458e0aa5:     	movb	$0x5, (%rax)
1458e0aa8:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0aad:     	movq	0x28(%rdx), %rcx
1458e0ab1:     	movq	%rcx, 0x28(%rax)
1458e0ab5:     	movups	0x18(%rdx), %xmm0
1458e0ab9:     	movups	%xmm0, 0x18(%rax)
1458e0abd:     	movzbl	0x1(%rdx), %ecx
1458e0ac1:     	movb	%cl, 0x1(%rax)
1458e0ac4:     	movsd	0x4(%rdx), %xmm0
1458e0ac9:     	movaps	0x48c830(%rip), %xmm1   # 0x145d6d300
1458e0ad0:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e0ad4:     	mulps	%xmm0, %xmm1
1458e0ad7:     	movlps	%xmm1, 0x4(%rax)
1458e0adb:     	movq	0xc(%rdx), %rcx
1458e0adf:     	movq	%rcx, 0xc(%rax)
1458e0ae3:     	movb	$0xb, (%rax)
1458e0ae6:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0aeb:     	movups	0x10(%rdx), %xmm0
1458e0aef:     	movups	0x20(%rdx), %xmm1
1458e0af3:     	movups	%xmm1, 0x20(%rax)
1458e0af7:     	movups	%xmm0, 0x10(%rax)
1458e0afb:     	movl	0x4(%rdx), %ecx
1458e0afe:     	movl	%ecx, 0x4(%rax)
1458e0b01:     	movsd	0x8(%rdx), %xmm0
1458e0b06:     	movaps	0x48c7f3(%rip), %xmm1   # 0x145d6d300
1458e0b0d:     	movss	%xmm2, %xmm1            # xmm1 = xmm2[0],xmm1[1,2,3]
1458e0b11:     	mulps	%xmm0, %xmm1
1458e0b14:     	movlps	%xmm1, 0x8(%rax)
1458e0b18:     	movb	$0x9, (%rax)
1458e0b1b:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0b20:     	movaps	%xmm2, %xmm0
1458e0b23:     	movq	%rax, %rsi
1458e0b26:     	callq	0x145bc97b1 <.text+0x5bc87b1>
1458e0b2b:     	movq	%rsi, %rax
1458e0b2e:     	movss	0x48c836(%rip), %xmm1   # 0x145d6d36c
1458e0b36:     	maxss	%xmm0, %xmm1
1458e0b3a:     	movss	0x4900fa(%rip), %xmm0   # 0x145d70c3c
1458e0b42:     	minss	%xmm1, %xmm0
1458e0b46:     	xorps	%xmm1, %xmm1
1458e0b49:     	maxss	%xmm0, %xmm1
1458e0b4d:     	movss	0x4934eb(%rip), %xmm0   # 0x145d74040
1458e0b55:     	minss	%xmm1, %xmm0
1458e0b59:     	cvttss2si	%xmm0, %ecx
1458e0b5d:     	movb	%cl, 0x1(%rsi)
1458e0b60:     	movb	$0x1e, (%rsi)
1458e0b63:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0b65:     	mulss	0x4(%rdx), %xmm2
1458e0b6a:     	movss	%xmm2, 0x4(%rax)
1458e0b6f:     	movb	$0x16, (%rax)
1458e0b72:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0b74:     	movq	0x18(%rdx), %rcx
1458e0b78:     	movl	0x8(%rdx), %r8d
1458e0b7c:     	mulss	0x4(%rdx), %xmm2
1458e0b81:     	movss	0x14(%rdx), %xmm0
1458e0b86:     	movq	%rcx, 0x18(%rax)
1458e0b8a:     	movss	%xmm2, 0x4(%rax)
1458e0b8f:     	movl	%r8d, 0x8(%rax)
1458e0b93:     	movsd	0xc(%rdx), %xmm1
1458e0b98:     	movsd	%xmm1, 0xc(%rax)
1458e0b9d:     	movss	%xmm0, 0x14(%rax)
1458e0ba2:     	movb	$0x22, (%rax)
1458e0ba5:     	jmp	0x1458e0bd2 <.text+0x58dfbd2>
1458e0ba7:     	movss	0x4(%rdx), %xmm0
1458e0bac:     	movl	$0xffffffff, 0x8(%rax)  # imm = 0xFFFFFFFF
1458e0bb3:     	movsd	0xc(%rdx), %xmm1
1458e0bb8:     	movaps	0x48c741(%rip), %xmm3   # 0x145d6d300
1458e0bbf:     	movss	%xmm2, %xmm3            # xmm3 = xmm2[0],xmm3[1,2,3]
1458e0bc3:     	mulps	%xmm1, %xmm3
1458e0bc6:     	movlps	%xmm3, 0xc(%rax)
1458e0bca:     	movss	%xmm0, 0x4(%rax)
1458e0bcf:     	movb	$0x8, (%rax)
1458e0bd2:     	addq	$0x20, %rsp
1458e0bd6:     	popq	%rbx
1458e0bd7:     	popq	%rdi
1458e0bd8:     	popq	%rsi
1458e0bd9:     	retq

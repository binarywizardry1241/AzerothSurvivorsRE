
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c6820:     	pushq	%rbp
1400c6821:     	pushq	%r15
1400c6823:     	pushq	%r14
1400c6825:     	pushq	%r13
1400c6827:     	pushq	%r12
1400c6829:     	pushq	%rsi
1400c682a:     	pushq	%rdi
1400c682b:     	pushq	%rbx
1400c682c:     	subq	$0x598, %rsp            # imm = 0x598
1400c6833:     	leaq	0x80(%rsp), %rbp
1400c683b:     	movaps	%xmm7, 0x500(%rbp)
1400c6842:     	movaps	%xmm6, 0x4f0(%rbp)
1400c6849:     	movq	$-0x2, 0x4e8(%rbp)
1400c6854:     	movq	0x598(%rbp), %rsi
1400c685b:     	movq	0x590(%rbp), %rax
1400c6862:     	movq	0x588(%rbp), %rcx
1400c6869:     	movq	0x580(%rbp), %r10
1400c6870:     	movq	0x20(%rdx), %r11
1400c6874:     	movq	%r11, 0x380(%rbp)
1400c687b:     	movups	(%rdx), %xmm0
1400c687e:     	movups	0x10(%rdx), %xmm1
1400c6882:     	movaps	%xmm1, 0x370(%rbp)
1400c6889:     	movaps	%xmm0, 0x360(%rbp)
1400c6890:     	movq	0x10(%r8), %rdx
1400c6894:     	movq	%rdx, 0x398(%rbp)
1400c689b:     	movups	(%r8), %xmm0
1400c689f:     	movups	%xmm0, 0x388(%rbp)
1400c68a6:     	movq	0x10(%r9), %rdx
1400c68aa:     	movq	%rdx, 0x3b0(%rbp)
1400c68b1:     	movups	(%r9), %xmm0
1400c68b5:     	movaps	%xmm0, 0x3a0(%rbp)
1400c68bc:     	movq	0x10(%r10), %rdx
1400c68c0:     	movq	%rdx, 0x3c8(%rbp)
1400c68c7:     	movups	(%r10), %xmm0
1400c68cb:     	movups	%xmm0, 0x3b8(%rbp)
1400c68d2:     	movups	(%rcx), %xmm0
1400c68d5:     	movups	0x10(%rcx), %xmm1
1400c68d9:     	movaps	%xmm1, 0x3e0(%rbp)
1400c68e0:     	movaps	%xmm0, 0x3d0(%rbp)
1400c68e7:     	movups	(%rax), %xmm0
1400c68ea:     	movups	0x10(%rax), %xmm1
1400c68ee:     	movaps	%xmm0, 0x3f0(%rbp)
1400c68f5:     	movaps	%xmm1, 0x400(%rbp)
1400c68fc:     	movups	(%rsi), %xmm0
1400c68ff:     	movupd	0x10(%rsi), %xmm1
1400c6904:     	movaps	%xmm0, 0x410(%rbp)
1400c690b:     	movapd	%xmm1, 0x420(%rbp)
1400c6913:     	movq	0x3d0(%rbp), %rax
1400c691a:     	movq	$0x0, 0x4b8(%rbp)
1400c6925:     	cmpb	$0x1, 0xd(%rax)
1400c6929:     	jne	0x1400c6938 <.text+0xc5938>
1400c692b:     	movq	0x3f0(%rbp), %rax
1400c6932:     	cmpb	$0x0, 0x72(%rax)
1400c6936:     	je	0x1400c6940 <.text+0xc5940>
1400c6938:     	xorl	%r14d, %r14d
1400c693b:     	jmp	0x1400c6bcc <.text+0xc5bcc>
1400c6940:     	movq	0x388(%rbp), %rax
1400c6947:     	movq	0x390(%rbp), %rcx
1400c694e:     	movq	0xf8(%rax), %rdx
1400c6955:     	movq	0x100(%rax), %r8
1400c695c:     	leaq	(%rdx,%r8,4), %r8
1400c6960:     	cmpb	$0x0, 0x108(%rax)
1400c6967:     	je	0x1400c6a87 <.text+0xc5a87>
1400c696d:     	xorl	%r9d, %r9d
1400c6970:     	movl	$0x8, %edi
1400c6975:     	xorl	%esi, %esi
1400c6977:     	xorl	%r11d, %r11d
1400c697a:     	xorl	%ebx, %ebx
1400c697c:     	movq	0x4c8(%rbp), %r15
1400c6983:     	cmpl	%r9d, %ebx
1400c6986:     	jne	0x1400c6a32 <.text+0xc5a32>
1400c698c:     	nopl	(%rax)
1400c6990:     	cmpq	%r8, %rdx
1400c6993:     	je	0x1400c6bc9 <.text+0xc5bc9>
1400c6999:     	movl	(%rdx), %r9d
1400c699c:     	addq	$0x4, %rdx
1400c69a0:     	movq	0x1a8(%rcx), %r11
1400c69a7:     	leaq	(%r9,%r9,8), %rsi
1400c69ab:     	movq	0x10(%r11,%rsi,8), %r9
1400c69b0:     	testq	%r9, %r9
1400c69b3:     	je	0x1400c6990 <.text+0xc5990>
1400c69b5:     	leaq	(%r11,%rsi,8), %rdi
1400c69b9:     	movq	0x110(%rax), %r11
1400c69c0:     	movq	0x40(%rdi), %rsi
1400c69c4:     	cmpq	%rsi, %r11
1400c69c7:     	jae	0x1400c69f8 <.text+0xc59f8>
1400c69c9:     	movq	0x38(%rdi), %rbx
1400c69cd:     	movq	(%rbx,%r11,8), %r11
1400c69d1:     	testq	%r11, %r11
1400c69d4:     	je	0x1400c69f8 <.text+0xc59f8>
1400c69d6:     	movq	0x18(%rdi), %rbx
1400c69da:     	notq	%r11
1400c69dd:     	leaq	(%r11,%r11,2), %r11
1400c69e1:     	shlq	$0x4, %r11
1400c69e5:     	movq	0x10(%rbx,%r11), %r11
1400c69ea:     	movq	0x118(%rax), %rbx
1400c69f1:     	cmpq	%rsi, %rbx
1400c69f4:     	jb	0x1400c6a07 <.text+0xc5a07>
1400c69f6:     	jmp	0x1400c6a2a <.text+0xc5a2a>
1400c69f8:     	xorl	%r11d, %r11d
1400c69fb:     	movq	0x118(%rax), %rbx
1400c6a02:     	cmpq	%rsi, %rbx
1400c6a05:     	jae	0x1400c6a2a <.text+0xc5a2a>
1400c6a07:     	movq	0x38(%rdi), %rsi
1400c6a0b:     	movq	(%rsi,%rbx,8), %rsi
1400c6a0f:     	testq	%rsi, %rsi
1400c6a12:     	je	0x1400c6a2a <.text+0xc5a2a>
1400c6a14:     	movq	0x18(%rdi), %rbx
1400c6a18:     	notq	%rsi
1400c6a1b:     	leaq	(%rsi,%rsi,2), %rsi
1400c6a1f:     	shlq	$0x4, %rsi
1400c6a23:     	movq	0x10(%rbx,%rsi), %rsi
1400c6a28:     	jmp	0x1400c6a2c <.text+0xc5a2c>
1400c6a2a:     	xorl	%esi, %esi
1400c6a2c:     	movq	0x8(%rdi), %rdi
1400c6a30:     	xorl	%ebx, %ebx
1400c6a32:     	movl	%ebx, %r14d
1400c6a35:     	movq	(%rdi,%r14,8), %r12
1400c6a39:     	testl	%r12d, %r12d
1400c6a3c:     	je	0x1400c6a63 <.text+0xc5a63>
1400c6a3e:     	leaq	(%r11,%r14), %r10
1400c6a42:     	shlq	$0x6, %r14
1400c6a46:     	addq	%rsi, %r14
1400c6a49:     	movq	%r12, %r13
1400c6a4c:     	shrq	$0x20, %r13
1400c6a50:     	movq	%r14, %r15
1400c6a53:     	movq	%r12, %r14
1400c6a56:     	incl	%ebx
1400c6a58:     	testl	%r14d, %r14d
1400c6a5b:     	je	0x1400c6983 <.text+0xc5983>
1400c6a61:     	jmp	0x1400c6a71 <.text+0xc5a71>
1400c6a63:     	xorl	%r14d, %r14d
1400c6a66:     	incl	%ebx
1400c6a68:     	testl	%r14d, %r14d
1400c6a6b:     	je	0x1400c6983 <.text+0xc5983>
1400c6a71:     	movq	%r15, 0x4c8(%rbp)
1400c6a78:     	cmpb	$0x2, (%r10)
1400c6a7c:     	je	0x1400c697c <.text+0xc597c>
1400c6a82:     	jmp	0x1400c6bcc <.text+0xc5bcc>
1400c6a87:     	xorl	%esi, %esi
1400c6a89:     	movl	$0x8, %edi
1400c6a8e:     	xorl	%r11d, %r11d
1400c6a91:     	xorl	%r10d, %r10d
1400c6a94:     	xorl	%ebx, %ebx
1400c6a96:     	movq	0x4c8(%rbp), %r15
1400c6a9d:     	cmpl	%r10d, %ebx
1400c6aa0:     	jne	0x1400c6b6c <.text+0xc5b6c>
1400c6aa6:     	nopw	%cs:(%rax,%rax)
1400c6ab0:     	cmpq	%r8, %rdx
1400c6ab3:     	je	0x1400c6bc9 <.text+0xc5bc9>
1400c6ab9:     	movl	(%rdx), %r10d
1400c6abc:     	addq	$0x4, %rdx
1400c6ac0:     	movq	0x108(%rcx), %rdi
1400c6ac7:     	leaq	(%r10,%r10,4), %r11
1400c6acb:     	shlq	$0x5, %r11
1400c6acf:     	movq	0x58(%rdi,%r11), %r10
1400c6ad4:     	testq	%r10, %r10
1400c6ad7:     	je	0x1400c6ab0 <.text+0xc5ab0>
1400c6ad9:     	addq	%r11, %rdi
1400c6adc:     	movl	0x94(%rdi), %r11d
1400c6ae3:     	movq	0x1a8(%rcx), %rbx
1400c6aea:     	leaq	(%r11,%r11,8), %r14
1400c6aee:     	leaq	(%rbx,%r14,8), %rsi
1400c6af2:     	movq	0x110(%rax), %r11
1400c6af9:     	movq	0x40(%rbx,%r14,8), %rbx
1400c6afe:     	cmpq	%rbx, %r11
1400c6b01:     	jae	0x1400c6b32 <.text+0xc5b32>
1400c6b03:     	movq	0x38(%rsi), %r14
1400c6b07:     	movq	(%r14,%r11,8), %r11
1400c6b0b:     	testq	%r11, %r11
1400c6b0e:     	je	0x1400c6b32 <.text+0xc5b32>
1400c6b10:     	movq	0x18(%rsi), %r14
1400c6b14:     	notq	%r11
1400c6b17:     	leaq	(%r11,%r11,2), %r11
1400c6b1b:     	shlq	$0x4, %r11
1400c6b1f:     	movq	0x10(%r14,%r11), %r11
1400c6b24:     	movq	0x118(%rax), %r14
1400c6b2b:     	cmpq	%rbx, %r14
1400c6b2e:     	jb	0x1400c6b41 <.text+0xc5b41>
1400c6b30:     	jmp	0x1400c6b64 <.text+0xc5b64>
1400c6b32:     	xorl	%r11d, %r11d
1400c6b35:     	movq	0x118(%rax), %r14
1400c6b3c:     	cmpq	%rbx, %r14
1400c6b3f:     	jae	0x1400c6b64 <.text+0xc5b64>
1400c6b41:     	movq	0x38(%rsi), %rbx
1400c6b45:     	movq	(%rbx,%r14,8), %rbx
1400c6b49:     	testq	%rbx, %rbx
1400c6b4c:     	je	0x1400c6b64 <.text+0xc5b64>
1400c6b4e:     	movq	0x18(%rsi), %rsi
1400c6b52:     	notq	%rbx
1400c6b55:     	leaq	(%rbx,%rbx,2), %rbx
1400c6b59:     	shlq	$0x4, %rbx
1400c6b5d:     	movq	0x10(%rsi,%rbx), %rsi
1400c6b62:     	jmp	0x1400c6b66 <.text+0xc5b66>
1400c6b64:     	xorl	%esi, %esi
1400c6b66:     	movq	0x50(%rdi), %rdi
1400c6b6a:     	xorl	%ebx, %ebx
1400c6b6c:     	movl	%ebx, %r14d
1400c6b6f:     	shlq	$0x4, %r14
1400c6b73:     	movq	(%rdi,%r14), %r12
1400c6b77:     	testl	%r12d, %r12d
1400c6b7a:     	je	0x1400c6ba8 <.text+0xc5ba8>
1400c6b7c:     	addq	%rdi, %r14
1400c6b7f:     	movl	0x8(%r14), %r15d
1400c6b83:     	notl	%r15d
1400c6b86:     	leaq	(%r11,%r15), %r9
1400c6b8a:     	shlq	$0x6, %r15
1400c6b8e:     	addq	%rsi, %r15
1400c6b91:     	movq	%r12, %r13
1400c6b94:     	shrq	$0x20, %r13
1400c6b98:     	movq	%r12, %r14
1400c6b9b:     	incl	%ebx
1400c6b9d:     	testl	%r14d, %r14d
1400c6ba0:     	je	0x1400c6a9d <.text+0xc5a9d>
1400c6ba6:     	jmp	0x1400c6bb6 <.text+0xc5bb6>
1400c6ba8:     	xorl	%r14d, %r14d
1400c6bab:     	incl	%ebx
1400c6bad:     	testl	%r14d, %r14d
1400c6bb0:     	je	0x1400c6a9d <.text+0xc5a9d>
1400c6bb6:     	movq	%r15, 0x4c8(%rbp)
1400c6bbd:     	cmpb	$0x2, (%r9)
1400c6bc1:     	je	0x1400c6a96 <.text+0xc5a96>
1400c6bc7:     	jmp	0x1400c6bcc <.text+0xc5bcc>
1400c6bc9:     	xorl	%r14d, %r14d
1400c6bcc:     	movq	0x3a8(%rbp), %r10
1400c6bd3:     	movq	0x3a0(%rbp), %rcx
1400c6bda:     	movl	0x3b4(%rbp), %eax
1400c6be0:     	movl	%eax, 0x4ac(%rbp)
1400c6be6:     	movq	0xf8(%rcx), %r15
1400c6bed:     	movq	0x100(%rcx), %rax
1400c6bf4:     	leaq	(%r15,%rax,4), %r12
1400c6bf8:     	movq	%rcx, 0x4d0(%rbp)
1400c6bff:     	movzbl	0x108(%rcx), %eax
1400c6c06:     	movb	%al, 0x4e7(%rbp)
1400c6c0c:     	movq	%r14, 0x490(%rbp)
1400c6c13:     	movl	%r14d, %eax
1400c6c16:     	movq	%r13, 0x488(%rbp)
1400c6c1d:     	shlq	$0x20, %r13
1400c6c21:     	orq	%rax, %r13
1400c6c24:     	movq	%r13, 0x480(%rbp)
1400c6c2b:     	movq	0x380(%rbp), %rax
1400c6c32:     	movq	%rax, 0x470(%rbp)
1400c6c39:     	movaps	0x360(%rbp), %xmm6
1400c6c40:     	movaps	0x370(%rbp), %xmm7
1400c6c47:     	movq	0x370(%rbp), %rax
1400c6c4e:     	movq	%rax, 0x478(%rbp)
1400c6c55:     	movl	$0x8, %r14d
1400c6c5b:     	movq	$0x0, 0x4d8(%rbp)
1400c6c66:     	movl	$0x8, %ebx
1400c6c6b:     	xorl	%edi, %edi
1400c6c6d:     	movq	$0x0, 0x4b0(%rbp)
1400c6c78:     	movq	%rax, 0x4a0(%rbp)
1400c6c7f:     	movq	%r10, 0x4c0(%rbp)
1400c6c86:     	cmpb	$0x0, 0x4e7(%rbp)
1400c6c8d:     	jne	0x1400c6df4 <.text+0xc5df4>
1400c6c93:     	nopw	%cs:(%rax,%rax)
1400c6ca0:     	movq	0x4b8(%rbp), %rax
1400c6ca7:     	jmp	0x1400c6cdb <.text+0xc5cdb>
1400c6ca9:     	movq	$0x0, 0x4d8(%rbp)
1400c6cb4:     	addq	$0x4, %r15
1400c6cb8:     	movq	0x50(%rcx), %r14
1400c6cbc:     	xorl	%edi, %edi
1400c6cbe:     	movl	%eax, %ecx
1400c6cc0:     	movq	%rcx, 0x4b8(%rbp)
1400c6cc7:     	movl	%edi, %edx
1400c6cc9:     	shlq	$0x4, %rdx
1400c6ccd:     	incl	%edi
1400c6ccf:     	movq	(%r14,%rdx), %rcx
1400c6cd3:     	testl	%ecx, %ecx
1400c6cd5:     	jne	0x1400c6d82 <.text+0xc5d82>
1400c6cdb:     	cmpl	%eax, %edi
1400c6cdd:     	jne	0x1400c6cc7 <.text+0xc5cc7>
1400c6cdf:     	cmpq	%r12, %r15
1400c6ce2:     	je	0x1400c6eb0 <.text+0xc5eb0>
1400c6ce8:     	movq	0x108(%r10), %rcx
1400c6cef:     	nop
1400c6cf0:     	movl	(%r15), %eax
1400c6cf3:     	leaq	(%rax,%rax,4), %rdx
1400c6cf7:     	shlq	$0x5, %rdx
1400c6cfb:     	movq	0x58(%rcx,%rdx), %rax
1400c6d00:     	testq	%rax, %rax
1400c6d03:     	jne	0x1400c6d20 <.text+0xc5d20>
1400c6d05:     	addq	$0x4, %r15
1400c6d09:     	cmpq	%r12, %r15
1400c6d0c:     	jne	0x1400c6cf0 <.text+0xc5cf0>
1400c6d0e:     	jmp	0x1400c6eb0 <.text+0xc5eb0>
1400c6d13:     	nopw	%cs:(%rax,%rax)
1400c6d20:     	addq	%rdx, %rcx
1400c6d23:     	movl	0x94(%rcx), %edx
1400c6d29:     	movq	0x1a8(%r10), %r8
1400c6d30:     	leaq	(%rdx,%rdx,8), %r9
1400c6d34:     	movq	0x4d0(%rbp), %rdx
1400c6d3b:     	movq	0x110(%rdx), %rdx
1400c6d42:     	cmpq	0x40(%r8,%r9,8), %rdx
1400c6d47:     	jae	0x1400c6ca9 <.text+0xc5ca9>
1400c6d4d:     	leaq	(%r8,%r9,8), %r8
1400c6d51:     	movq	0x38(%r8), %r9
1400c6d55:     	movq	(%r9,%rdx,8), %rdx
1400c6d59:     	testq	%rdx, %rdx
1400c6d5c:     	je	0x1400c6ca9 <.text+0xc5ca9>
1400c6d62:     	movq	0x18(%r8), %r8
1400c6d66:     	notq	%rdx
1400c6d69:     	leaq	(%rdx,%rdx,2), %rdx
1400c6d6d:     	shlq	$0x4, %rdx
1400c6d71:     	movq	0x10(%r8,%rdx), %rdx
1400c6d76:     	movq	%rdx, 0x4d8(%rbp)
1400c6d7d:     	jmp	0x1400c6cb4 <.text+0xc5cb4>
1400c6d82:     	addq	%r14, %rdx
1400c6d85:     	movl	0x8(%rdx), %eax
1400c6d88:     	notl	%eax
1400c6d8a:     	movq	0x4d8(%rbp), %rdx
1400c6d91:     	leaq	(%rdx,%rax,8), %rax
1400c6d95:     	movq	%rax, 0x498(%rbp)
1400c6d9c:     	movq	%rcx, %rsi
1400c6d9f:     	testl	%esi, %esi
1400c6da1:     	jne	0x1400c6ec1 <.text+0xc5ec1>
1400c6da7:     	jmp	0x1400c6f27 <.text+0xc5f27>
1400c6dac:     	nopl	(%rax)
1400c6db0:     	cmpq	$0x0, 0x478(%rbp)
1400c6db8:     	cmovneq	0x470(%rbp), %r13
1400c6dc0:     	movq	%rsi, -0x30(%rbp)
1400c6dc4:     	movups	%xmm6, -0x28(%rbp)
1400c6dc8:     	movups	%xmm7, -0x18(%rbp)
1400c6dcc:     	movq	%r13, -0x8(%rbp)
1400c6dd0:     	leaq	-0x30(%rbp), %rcx
1400c6dd4:     	leaq	0x5876d15(%rip), %rdx   # 0x14593daf0
1400c6ddb:     	callq	0x144e74f30 <.text+0x4e73f30>
1400c6de0:     	movq	0x4c0(%rbp), %r10
1400c6de7:     	cmpb	$0x0, 0x4e7(%rbp)
1400c6dee:     	je	0x1400c6ca0 <.text+0xc5ca0>
1400c6df4:     	movq	0x4b8(%rbp), %rax
1400c6dfb:     	jmp	0x1400c6e2b <.text+0xc5e2b>
1400c6dfd:     	movq	$0x0, 0x4d8(%rbp)
1400c6e08:     	addq	$0x4, %r15
1400c6e0c:     	movq	0x8(%rcx), %rbx
1400c6e10:     	xorl	%edi, %edi
1400c6e12:     	movl	%eax, %ecx
1400c6e14:     	movq	%rcx, 0x4b8(%rbp)
1400c6e1b:     	movl	%edi, %edx
1400c6e1d:     	incl	%edi
1400c6e1f:     	movq	(%rbx,%rdx,8), %rcx
1400c6e23:     	testl	%ecx, %ecx
1400c6e25:     	jne	0x1400c6f0e <.text+0xc5f0e>
1400c6e2b:     	cmpl	%eax, %edi
1400c6e2d:     	jne	0x1400c6e1b <.text+0xc5e1b>
1400c6e2f:     	cmpq	%r12, %r15
1400c6e32:     	je	0x1400c6eb0 <.text+0xc5eb0>
1400c6e38:     	movq	0x1a8(%r10), %rcx
1400c6e3f:     	nop
1400c6e40:     	movl	(%r15), %eax
1400c6e43:     	leaq	(%rax,%rax,8), %rdx
1400c6e47:     	movq	0x10(%rcx,%rdx,8), %rax
1400c6e4c:     	testq	%rax, %rax
1400c6e4f:     	jne	0x1400c6e60 <.text+0xc5e60>
1400c6e51:     	addq	$0x4, %r15
1400c6e55:     	cmpq	%r12, %r15
1400c6e58:     	jne	0x1400c6e40 <.text+0xc5e40>
1400c6e5a:     	jmp	0x1400c6eb0 <.text+0xc5eb0>
1400c6e5c:     	nopl	(%rax)
1400c6e60:     	leaq	(%rcx,%rdx,8), %rcx
1400c6e64:     	movq	0x4d0(%rbp), %rdx
1400c6e6b:     	movq	0x110(%rdx), %rdx
1400c6e72:     	cmpq	0x40(%rcx), %rdx
1400c6e76:     	jae	0x1400c6dfd <.text+0xc5dfd>
1400c6e78:     	movq	0x38(%rcx), %r8
1400c6e7c:     	movq	(%r8,%rdx,8), %rdx
1400c6e80:     	testq	%rdx, %rdx
1400c6e83:     	je	0x1400c6dfd <.text+0xc5dfd>
1400c6e89:     	movq	0x18(%rcx), %r8
1400c6e8d:     	notq	%rdx
1400c6e90:     	leaq	(%rdx,%rdx,2), %rdx
1400c6e94:     	shlq	$0x4, %rdx
1400c6e98:     	movq	0x10(%r8,%rdx), %rdx
1400c6e9d:     	movq	%rdx, 0x4d8(%rbp)
1400c6ea4:     	jmp	0x1400c6e08 <.text+0xc5e08>
1400c6ea9:     	nopl	(%rax)
1400c6eb0:     	movabsq	$-0x100000000, %rax     # imm = 0xFFFFFFFF00000000
1400c6eba:     	andq	%rax, %rsi
1400c6ebd:     	testl	%esi, %esi
1400c6ebf:     	je	0x1400c6f27 <.text+0xc5f27>
1400c6ec1:     	cmpl	$0x0, 0x490(%rbp)
1400c6ec8:     	je	0x1400c6db0 <.text+0xc5db0>
1400c6ece:     	movq	0x480(%rbp), %rax
1400c6ed5:     	movq	0x498(%rbp), %rcx
1400c6edc:     	cmpq	(%rcx), %rax
1400c6edf:     	jne	0x1400c6db0 <.text+0xc5db0>
1400c6ee5:     	movq	%rsi, %rax
1400c6ee8:     	shrq	$0x20, %rax
1400c6eec:     	movq	%rax, 0x4a0(%rbp)
1400c6ef3:     	movl	%esi, %eax
1400c6ef5:     	movq	%rax, 0x4b0(%rbp)
1400c6efc:     	cmpb	$0x0, 0x4e7(%rbp)
1400c6f03:     	jne	0x1400c6df4 <.text+0xc5df4>
1400c6f09:     	jmp	0x1400c6ca0 <.text+0xc5ca0>
1400c6f0e:     	movq	0x4d8(%rbp), %rax
1400c6f15:     	leaq	(%rax,%rdx,8), %rax
1400c6f19:     	movq	%rax, 0x498(%rbp)
1400c6f20:     	movq	%rcx, %rsi
1400c6f23:     	testl	%esi, %esi
1400c6f25:     	jne	0x1400c6ec1 <.text+0xc5ec1>
1400c6f27:     	movq	0x490(%rbp), %r14
1400c6f2e:     	testl	%r14d, %r14d
1400c6f31:     	movq	0x4c8(%rbp), %r15
1400c6f38:     	movq	0x488(%rbp), %rbx
1400c6f3f:     	je	0x1400c76aa <.text+0xc66aa>
1400c6f45:     	movq	0x3b8(%rbp), %r10
1400c6f4c:     	movq	0x3c0(%rbp), %rax
1400c6f53:     	movq	0xf8(%r10), %rdx
1400c6f5a:     	movq	0x100(%r10), %r11
1400c6f61:     	leaq	(%rdx,%r11,4), %rcx
1400c6f65:     	movzbl	0x108(%r10), %r8d
1400c6f6d:     	shlq	$0x2, %r11
1400c6f71:     	testb	%r8b, %r8b
1400c6f74:     	je	0x1400c7000 <.text+0xc6000>
1400c6f7a:     	nopw	(%rax,%rax)
1400c6f80:     	testq	%r11, %r11
1400c6f83:     	je	0x1400c7072 <.text+0xc6072>
1400c6f89:     	movl	(%rdx), %r9d
1400c6f8c:     	addq	$0x4, %rdx
1400c6f90:     	movq	0x1a8(%rax), %rsi
1400c6f97:     	leaq	(%r9,%r9,8), %rdi
1400c6f9b:     	movq	0x10(%rsi,%rdi,8), %r9
1400c6fa0:     	addq	$-0x4, %r11
1400c6fa4:     	testq	%r9, %r9
1400c6fa7:     	je	0x1400c6f80 <.text+0xc5f80>
1400c6fa9:     	leaq	(%rsi,%rdi,8), %r11
1400c6fad:     	movq	0x110(%r10), %r10
1400c6fb4:     	cmpq	0x40(%r11), %r10
1400c6fb8:     	jae	0x1400c70b8 <.text+0xc60b8>
1400c6fbe:     	movq	0x38(%r11), %rsi
1400c6fc2:     	movq	(%rsi,%r10,8), %r10
1400c6fc6:     	testq	%r10, %r10
1400c6fc9:     	je	0x1400c70b8 <.text+0xc60b8>
1400c6fcf:     	movq	0x18(%r11), %r11
1400c6fd3:     	notq	%r10
1400c6fd6:     	leaq	(%r10,%r10,2), %r10
1400c6fda:     	shlq	$0x4, %r10
1400c6fde:     	movq	0x10(%r11,%r10), %r10
1400c6fe3:     	movl	$0x1, %r11d
1400c6fe9:     	testb	%r8b, %r8b
1400c6fec:     	jne	0x1400c7083 <.text+0xc6083>
1400c6ff2:     	jmp	0x1400c70eb <.text+0xc60eb>
1400c6ff7:     	nopw	(%rax,%rax)
1400c7000:     	testq	%r11, %r11
1400c7003:     	je	0x1400c7072 <.text+0xc6072>
1400c7005:     	movl	(%rdx), %r9d
1400c7008:     	addq	$0x4, %rdx
1400c700c:     	movq	0x108(%rax), %rsi
1400c7013:     	leaq	(%r9,%r9,4), %rdi
1400c7017:     	shlq	$0x5, %rdi
1400c701b:     	movq	0x58(%rsi,%rdi), %r9
1400c7020:     	addq	$-0x4, %r11
1400c7024:     	testq	%r9, %r9
1400c7027:     	je	0x1400c7000 <.text+0xc6000>
1400c7029:     	addq	%rdi, %rsi
1400c702c:     	movl	0x94(%rsi), %edi
1400c7032:     	movq	0x1a8(%rax), %r11
1400c7039:     	leaq	(%rdi,%rdi,8), %rdi
1400c703d:     	movq	0x110(%r10), %r10
1400c7044:     	cmpq	0x40(%r11,%rdi,8), %r10
1400c7049:     	jae	0x1400c70c8 <.text+0xc60c8>
1400c704b:     	leaq	(%r11,%rdi,8), %r11
1400c704f:     	movq	0x38(%r11), %rdi
1400c7053:     	movq	(%rdi,%r10,8), %r10
1400c7057:     	testq	%r10, %r10
1400c705a:     	je	0x1400c70c8 <.text+0xc60c8>
1400c705c:     	movq	0x18(%r11), %r11
1400c7060:     	notq	%r10
1400c7063:     	leaq	(%r10,%r10,2), %r10
1400c7067:     	shlq	$0x4, %r10
1400c706b:     	movq	0x10(%r11,%r10), %r11
1400c7070:     	jmp	0x1400c70cb <.text+0xc60cb>
1400c7072:     	xorl	%r9d, %r9d
1400c7075:     	movq	%rcx, %rdx
1400c7078:     	xorl	%r11d, %r11d
1400c707b:     	xorl	%r10d, %r10d
1400c707e:     	testb	%r8b, %r8b
1400c7081:     	je	0x1400c70eb <.text+0xc60eb>
1400c7083:     	cmpl	%r9d, %r11d
1400c7086:     	jne	0x1400c76aa <.text+0xc66aa>
1400c708c:     	nopl	(%rax)
1400c7090:     	cmpq	%rcx, %rdx
1400c7093:     	je	0x1400c7128 <.text+0xc6128>
1400c7099:     	movl	(%rdx), %r8d
1400c709c:     	addq	$0x4, %rdx
1400c70a0:     	movq	0x1a8(%rax), %r9
1400c70a7:     	leaq	(%r8,%r8,8), %r8
1400c70ab:     	cmpq	$0x0, 0x10(%r9,%r8,8)
1400c70b1:     	je	0x1400c7090 <.text+0xc6090>
1400c70b3:     	jmp	0x1400c76aa <.text+0xc66aa>
1400c70b8:     	xorl	%r10d, %r10d
1400c70bb:     	movl	$0x1, %r11d
1400c70c1:     	testb	%r8b, %r8b
1400c70c4:     	jne	0x1400c7083 <.text+0xc6083>
1400c70c6:     	jmp	0x1400c70eb <.text+0xc60eb>
1400c70c8:     	xorl	%r11d, %r11d
1400c70cb:     	movq	0x50(%rsi), %r10
1400c70cf:     	movl	0x8(%r10), %r10d
1400c70d3:     	notl	%r10d
1400c70d6:     	imulq	$0xf8, %r10, %r10
1400c70dd:     	addq	%r11, %r10
1400c70e0:     	movl	$0x1, %r11d
1400c70e6:     	testb	%r8b, %r8b
1400c70e9:     	jne	0x1400c7083 <.text+0xc6083>
1400c70eb:     	cmpl	%r9d, %r11d
1400c70ee:     	jne	0x1400c76aa <.text+0xc66aa>
1400c70f4:     	nopw	%cs:(%rax,%rax)
1400c7100:     	cmpq	%rcx, %rdx
1400c7103:     	je	0x1400c7128 <.text+0xc6128>
1400c7105:     	movl	(%rdx), %r8d
1400c7108:     	addq	$0x4, %rdx
1400c710c:     	movq	0x108(%rax), %r9
1400c7113:     	leaq	(%r8,%r8,4), %r8
1400c7117:     	shlq	$0x5, %r8
1400c711b:     	cmpq	$0x0, 0x58(%r9,%r8)
1400c7121:     	je	0x1400c7100 <.text+0xc6100>
1400c7123:     	jmp	0x1400c76aa <.text+0xc66aa>
1400c7128:     	testq	%r10, %r10
1400c712b:     	je	0x1400c76aa <.text+0xc66aa>
1400c7131:     	cmpl	$0x1, (%r10)
1400c7135:     	jne	0x1400c76aa <.text+0xc66aa>
1400c713b:     	movsd	0x8(%r10), %xmm0
1400c7141:     	xorpd	%xmm1, %xmm1
1400c7145:     	ucomisd	%xmm1, %xmm0
1400c7149:     	jb	0x1400c76aa <.text+0xc66aa>
1400c714f:     	movsd	0x10(%r10), %xmm2
1400c7155:     	ucomisd	%xmm1, %xmm2
1400c7159:     	jb	0x1400c76aa <.text+0xc66aa>
1400c715f:     	movl	0xc0(%r10), %eax
1400c7166:     	xorps	%xmm1, %xmm1
1400c7169:     	cvtsi2sd	%rax, %xmm1
1400c716e:     	ucomisd	%xmm0, %xmm1
1400c7172:     	jbe	0x1400c76aa <.text+0xc66aa>
1400c7178:     	movl	0xc4(%r10), %ecx
1400c717f:     	xorps	%xmm1, %xmm1
1400c7182:     	cvtsi2sd	%rcx, %xmm1
1400c7187:     	ucomisd	%xmm2, %xmm1
1400c718b:     	jbe	0x1400c76aa <.text+0xc66aa>
1400c7191:     	xorps	%xmm1, %xmm1
1400c7194:     	cvtsd2ss	%xmm0, %xmm1
1400c7198:     	cvtsd2ss	%xmm2, %xmm3
1400c719c:     	leaq	0xc8(%r10), %rdx
1400c71a3:     	cmpb	$0x0, 0xb8(%r10)
1400c71ab:     	leaq	0xbc(%r10), %r8
1400c71b2:     	cmovneq	%r8, %rdx
1400c71b6:     	movss	(%rdx), %xmm2
1400c71ba:     	movl	%eax, %eax
1400c71bc:     	xorps	%xmm0, %xmm0
1400c71bf:     	cvtsi2ss	%rax, %xmm0
1400c71c4:     	movl	%ecx, %eax
1400c71c6:     	cvtsi2ss	%rax, %xmm4
1400c71cb:     	divss	%xmm2, %xmm1
1400c71cf:     	divss	%xmm2, %xmm0
1400c71d3:     	unpcklps	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
1400c71d6:     	movsldup	%xmm2, %xmm2            # xmm2 = xmm2[0,0,2,2]
1400c71da:     	divps	%xmm2, %xmm3
1400c71dd:     	movss	0x585189b(%rip), %xmm2  # 0x145918a80
1400c71e5:     	addss	%xmm1, %xmm2
1400c71e9:     	movss	0x5851893(%rip), %xmm4  # 0x145918a84
1400c71f1:     	addss	0x585188f(%rip), %xmm1  # 0x145918a88
1400c71f9:     	addss	0x585188b(%rip), %xmm1  # 0x145918a8c
1400c7201:     	addss	%xmm2, %xmm4
1400c7205:     	xorps	%xmm5, %xmm5
1400c7208:     	maxss	%xmm5, %xmm1
1400c720c:     	cmpltss	%xmm4, %xmm0
1400c7211:     	andps	%xmm0, %xmm1
1400c7214:     	andnps	%xmm2, %xmm0
1400c7217:     	orps	%xmm1, %xmm0
1400c721a:     	movshdup	%xmm3, %xmm1            # xmm1 = xmm3[1,1,3,3]
1400c721e:     	movss	0x584030e(%rip), %xmm4  # 0x145907534
1400c7226:     	mulss	%xmm1, %xmm4
1400c722a:     	ucomiss	%xmm4, %xmm3
1400c722d:     	ja	0x1400c7244 <.text+0xc6244>
1400c722f:     	movss	0x584e6a1(%rip), %xmm2  # 0x1459158d8
1400c7237:     	addss	%xmm3, %xmm2
1400c723b:     	movl	$0x1, %ecx
1400c7240:     	xorl	%eax, %eax
1400c7242:     	jmp	0x1400c7257 <.text+0xc6257>
1400c7244:     	subss	%xmm3, %xmm1
1400c7248:     	addss	0x584e684(%rip), %xmm1  # 0x1459158d4
1400c7250:     	xorl	%ecx, %ecx
1400c7252:     	movl	$0x1, %eax
1400c7257:     	movq	0x4c0(%rbp), %r8
1400c725e:     	movq	0x4b0(%rbp), %r9
1400c7265:     	testl	%r9d, %r9d
1400c7268:     	je	0x1400c735a <.text+0xc635a>
1400c726e:     	notl	%r9d
1400c7271:     	leaq	(%r9,%r9,2), %rdx
1400c7275:     	shlq	$0x3, %rdx
1400c7279:     	addq	0x8(%r8), %rdx
1400c727d:     	cmpq	%r9, 0x10(%r8)
1400c7281:     	leaq	0x58758a0(%rip), %r8    # 0x14593cb28
1400c7288:     	cmovaq	%rdx, %r8
1400c728c:     	movq	0x4a0(%rbp), %rdx
1400c7293:     	cmpl	%edx, 0x10(%r8)
1400c7297:     	jne	0x1400c735a <.text+0xc635a>
1400c729d:     	cmpl	$0x0, (%r8)
1400c72a1:     	je	0x1400c735a <.text+0xc635a>
1400c72a7:     	movq	0x4(%r8), %rdx
1400c72ab:     	movq	%rdx, %r9
1400c72ae:     	shrq	$0x20, %r9
1400c72b2:     	movq	0x4d0(%rbp), %r10
1400c72b9:     	cmpq	%r9, 0x38(%r10)
1400c72bd:     	jbe	0x1400c735a <.text+0xc635a>
1400c72c3:     	movq	%rdx, %r10
1400c72c6:     	shrq	$0x26, %r10
1400c72ca:     	movq	0x4d0(%rbp), %r11
1400c72d1:     	movq	0x28(%r11), %r11
1400c72d5:     	movq	(%r11,%r10,8), %r10
1400c72d9:     	btq	%r9, %r10
1400c72dd:     	movq	0x4c0(%rbp), %r9
1400c72e4:     	jae	0x1400c735a <.text+0xc635a>
1400c72e6:     	movl	0xc(%r8), %r8d
1400c72ea:     	movq	0x1a8(%r9), %r9
1400c72f1:     	leaq	(%r8,%r8,8), %r8
1400c72f5:     	movq	0x4d0(%rbp), %r10
1400c72fc:     	movq	0x118(%r10), %r10
1400c7303:     	movq	0x18(%r9,%r8,8), %r11
1400c7308:     	movq	0x38(%r9,%r8,8), %r8
1400c730d:     	movq	(%r8,%r10,8), %r8
1400c7311:     	notq	%r8
1400c7314:     	leaq	(%r8,%r8,2), %r8
1400c7318:     	shlq	$0x4, %r8
1400c731c:     	movq	0x10(%r11,%r8), %r10
1400c7321:     	movq	0x28(%r11,%r8), %r8
1400c7326:     	notl	%edx
1400c7328:     	leaq	(%rdx,%rdx,2), %r11
1400c732c:     	shlq	$0x7, %r11
1400c7330:     	leaq	(%r10,%r11), %r9
1400c7334:     	movl	0x68(%r10,%r11), %r10d
1400c7339:     	testl	%r10d, %r10d
1400c733c:     	je	0x1400c7772 <.text+0xc6772>
1400c7342:     	cmpl	$0x1, %r10d
1400c7346:     	jne	0x1400c76cc <.text+0xc66cc>
1400c734c:     	movss	0x6c(%r9), %xmm5
1400c7352:     	ucomiss	%xmm0, %xmm5
1400c7355:     	jmp	0x1400c76e4 <.text+0xc66e4>
1400c735a:     	cmpq	$0x0, 0x410(%rbp)
1400c7362:     	je	0x1400c76aa <.text+0xc66aa>
1400c7368:     	movw	$0x0, 0x344(%rbp)
1400c7371:     	movb	$0x1, 0x334(%rbp)
1400c7378:     	movl	$0x1, 0x248(%rbp)
1400c7382:     	movss	%xmm0, 0x24c(%rbp)
1400c738a:     	movq	$0x0, 0x250(%rbp)
1400c7395:     	movl	%ecx, 0x258(%rbp)
1400c739b:     	movss	%xmm2, 0x25c(%rbp)
1400c73a3:     	movl	%eax, 0x260(%rbp)
1400c73a9:     	movss	%xmm1, 0x264(%rbp)
1400c73b1:     	movabsq	$0x43a0000000000001, %rax # imm = 0x43A0000000000001
1400c73bb:     	movq	%rax, 0x268(%rbp)
1400c73c2:     	movq	$0x0, 0x240(%rbp)
1400c73cd:     	xorps	%xmm0, %xmm0
1400c73d0:     	movaps	%xmm0, 0x270(%rbp)
1400c73d7:     	movaps	%xmm0, 0x280(%rbp)
1400c73de:     	movq	$0x0, 0x290(%rbp)
1400c73e9:     	movl	$0x0, 0x358(%rbp)
1400c73f3:     	movw	$0x0, 0x35c(%rbp)
1400c73fc:     	movups	0x5875b1d(%rip), %xmm0  # 0x14593cf20
1400c7403:     	movups	%xmm0, 0x298(%rbp)
1400c740a:     	movups	0x5875b1f(%rip), %xmm0  # 0x14593cf30
1400c7411:     	movups	%xmm0, 0x2a8(%rbp)
1400c7418:     	movaps	0x5851411(%rip), %xmm0  # 0x145918830
1400c741f:     	movups	%xmm0, 0x2b8(%rbp)
1400c7426:     	movaps	0x5851663(%rip), %xmm0  # 0x145918a90
1400c742d:     	movups	%xmm0, 0x2c8(%rbp)
1400c7434:     	movaps	0x583feb5(%rip), %xmm0  # 0x1459072f0
1400c743b:     	movups	%xmm0, 0x2d8(%rbp)
1400c7442:     	movups	%xmm0, 0x2e8(%rbp)
1400c7449:     	movaps	0x58400a0(%rip), %xmm0  # 0x1459074f0
1400c7450:     	movups	%xmm0, 0x2f8(%rbp)
1400c7457:     	movups	%xmm0, 0x308(%rbp)
1400c745e:     	movb	$0x1, 0x356(%rbp)
1400c7465:     	movl	$0x100, 0x352(%rbp)     # imm = 0x100
1400c746f:     	movq	$0x0, 0x338(%rbp)
1400c747a:     	movl	$0x3f800000, 0x340(%rbp) # imm = 0x3F800000
1400c7484:     	movaps	0x58513c5(%rip), %xmm0  # 0x145918850
1400c748b:     	movups	%xmm0, 0x318(%rbp)
1400c7492:     	movl	$0x1, 0x328(%rbp)
1400c749c:     	movq	$0x0, 0x32c(%rbp)
1400c74a7:     	movb	$0x0, 0x357(%rbp)
1400c74ae:     	movups	0x58759b3(%rip), %xmm0  # 0x14593ce68
1400c74b5:     	movaps	%xmm0, 0x1e0(%rbp)
1400c74bc:     	movq	$0x0, 0x1f0(%rbp)
1400c74c7:     	movups	0x58759b2(%rip), %xmm0  # 0x14593ce80
1400c74ce:     	movups	%xmm0, 0x1f8(%rbp)
1400c74d5:     	movq	$0x0, 0x208(%rbp)
1400c74e0:     	movups	0x58759b1(%rip), %xmm0  # 0x14593ce98
1400c74e7:     	movaps	%xmm0, 0x210(%rbp)
1400c74ee:     	movq	$0x0, 0x220(%rbp)
1400c74f9:     	movups	0x58759b0(%rip), %xmm0  # 0x14593ceb0
1400c7500:     	movups	%xmm0, 0x228(%rbp)
1400c7507:     	movq	$0x0, 0x238(%rbp)
1400c7512:     	movw	$0x0, 0x34a(%rbp)
1400c751b:     	movl	$0x10000, 0x346(%rbp)   # imm = 0x10000
1400c7525:     	movw	$0x0, 0x350(%rbp)
1400c752e:     	movl	$0x10000, 0x34c(%rbp)   # imm = 0x10000
1400c7538:     	movups	0x5851c31(%rip), %xmm0  # 0x145919170
1400c753f:     	movaps	%xmm0, 0x430(%rbp)
1400c7546:     	movl	$0x3f59999a, 0x440(%rbp) # imm = 0x3F59999A
1400c7550:     	leaq	0x450(%rbp), %rcx
1400c7557:     	leaq	0x430(%rbp), %rdx
1400c755e:     	callq	0x144c8c290 <.text+0x4c8b290>
1400c7563:     	nop
1400c7564:     	movaps	0x450(%rbp), %xmm0
1400c756b:     	movups	%xmm0, -0x2c(%rbp)
1400c756f:     	movl	$0x1, -0x30(%rbp)
1400c7576:     	movl	$0x41200000, 0x48(%rsp) # imm = 0x41200000
1400c757e:     	movl	$0x1, 0x40(%rsp)
1400c7586:     	movl	$0x0, 0x38(%rsp)
1400c758e:     	movl	$0x1, 0x30(%rsp)
1400c7596:     	movl	$0x40400000, 0x28(%rsp) # imm = 0x40400000
1400c759e:     	movl	$0x1, 0x20(%rsp)
1400c75a6:     	leaq	0x450(%rbp), %rcx
1400c75ad:     	leaq	-0x30(%rbp), %rdx
1400c75b1:     	xorps	%xmm3, %xmm3
1400c75b4:     	movl	$0x1, %r8d
1400c75ba:     	callq	0x14265f6a0 <.text+0x265e6a0>
1400c75bf:     	nop
1400c75c0:     	movl	%r14d, 0x1b8(%rbp)
1400c75c7:     	movl	%ebx, 0x1bc(%rbp)
1400c75cd:     	leaq	-0x30(%rbp), %rbx
1400c75d1:     	leaq	0x1e0(%rbp), %rdx
1400c75d8:     	movl	$0x180, %r8d            # imm = 0x180
1400c75de:     	movq	%rbx, %rcx
1400c75e1:     	callq	0x1457731ed <.text+0x57721ed>
1400c75e6:     	movl	$0x0, 0x168(%rbp)
1400c75f0:     	movaps	0x58514a9(%rip), %xmm0  # 0x145918aa0
1400c75f7:     	movups	%xmm0, 0x16c(%rbp)
1400c75fe:     	movl	$0x0, 0x17c(%rbp)
1400c7608:     	movups	%xmm0, 0x180(%rbp)
1400c760f:     	movl	$0x0, 0x190(%rbp)
1400c7619:     	movups	%xmm0, 0x194(%rbp)
1400c7620:     	movl	$0x0, 0x1a4(%rbp)
1400c762a:     	movups	%xmm0, 0x1a8(%rbp)
1400c7631:     	movl	$0x0, 0x1c0(%rbp)
1400c763b:     	movaps	0x585146e(%rip), %xmm0  # 0x145918ab0
1400c7642:     	movups	%xmm0, 0x1c4(%rbp)
1400c7649:     	movups	0x450(%rbp), %xmm0
1400c7650:     	movups	%xmm0, 0x150(%rbp)
1400c7657:     	movq	0x460(%rbp), %rax
1400c765e:     	movq	%rax, 0x160(%rbp)
1400c7665:     	movl	$0x13ec, 0x1d4(%rbp)    # imm = 0x13EC
1400c766f:     	movw	$0x0, 0x1d8(%rbp)
1400c7678:     	leaq	0x5876459(%rip), %r9    # 0x14593dad8
1400c767f:     	leaq	0x1e0(%rbp), %r14
1400c7686:     	leaq	0x360(%rbp), %rdx
1400c768d:     	movq	%r14, %rcx
1400c7690:     	movq	%rbx, %r8
1400c7693:     	callq	0x1400ef480 <.text+0xee480>
1400c7698:     	movq	%r14, %rcx
1400c769b:     	movq	0x598(%rbp), %rdx
1400c76a2:     	movq	%r15, %r8
1400c76a5:     	callq	0x14014a730 <.text+0x149730>
1400c76aa:     	movaps	0x4f0(%rbp), %xmm6
1400c76b1:     	movaps	0x500(%rbp), %xmm7
1400c76b8:     	addq	$0x598, %rsp            # imm = 0x598
1400c76bf:     	popq	%rbx
1400c76c0:     	popq	%rdi
1400c76c1:     	popq	%rsi
1400c76c2:     	popq	%r12
1400c76c4:     	popq	%r13
1400c76c6:     	popq	%r14
1400c76c8:     	popq	%r15
1400c76ca:     	popq	%rbp
1400c76cb:     	retq
1400c76cc:     	ucomiss	%xmm5, %xmm0
1400c76cf:     	jne	0x1400c7772 <.text+0xc6772>
1400c76d5:     	jp	0x1400c7772 <.text+0xc6772>
1400c76db:     	movss	0x6c(%r9), %xmm6
1400c76e1:     	ucomiss	%xmm5, %xmm6
1400c76e4:     	jne	0x1400c7772 <.text+0xc6772>
1400c76ea:     	jp	0x1400c7772 <.text+0xc6772>
1400c76f0:     	ucomiss	%xmm4, %xmm3
1400c76f3:     	movl	0x78(%r9), %r10d
1400c76f7:     	ja	0x1400c770e <.text+0xc670e>
1400c76f9:     	cmpl	%r10d, %ecx
1400c76fc:     	jne	0x1400c772d <.text+0xc672d>
1400c76fe:     	testl	%r10d, %r10d
1400c7701:     	je	0x1400c7772 <.text+0xc6772>
1400c7703:     	movss	0x7c(%r9), %xmm3
1400c7709:     	ucomiss	%xmm2, %xmm3
1400c770c:     	jmp	0x1400c7745 <.text+0xc6745>
1400c770e:     	orl	%ecx, %r10d
1400c7711:     	jne	0x1400c7772 <.text+0xc6772>
1400c7713:     	movl	0x80(%r9), %r10d
1400c771a:     	movss	0x84(%r9), %xmm3
1400c7723:     	cmpl	%r10d, %eax
1400c7726:     	jne	0x1400c7758 <.text+0xc6758>
1400c7728:     	ucomiss	%xmm1, %xmm3
1400c772b:     	jmp	0x1400c776a <.text+0xc676a>
1400c772d:     	testl	%r10d, %r10d
1400c7730:     	je	0x1400c7772 <.text+0xc6772>
1400c7732:     	xorps	%xmm3, %xmm3
1400c7735:     	ucomiss	%xmm3, %xmm2
1400c7738:     	jne	0x1400c7772 <.text+0xc6772>
1400c773a:     	jp	0x1400c7772 <.text+0xc6772>
1400c773c:     	movss	0x7c(%r9), %xmm4
1400c7742:     	ucomiss	%xmm3, %xmm4
1400c7745:     	jne	0x1400c7772 <.text+0xc6772>
1400c7747:     	jp	0x1400c7772 <.text+0xc6772>
1400c7749:     	cmpl	0x80(%r9), %eax
1400c7750:     	je	0x1400c76aa <.text+0xc66aa>
1400c7756:     	jmp	0x1400c7772 <.text+0xc6772>
1400c7758:     	xorps	%xmm4, %xmm4
1400c775b:     	ucomiss	%xmm4, %xmm1
1400c775e:     	jne	0x1400c7772 <.text+0xc6772>
1400c7760:     	jp	0x1400c7772 <.text+0xc6772>
1400c7762:     	testl	%r10d, %r10d
1400c7765:     	je	0x1400c7772 <.text+0xc6772>
1400c7767:     	ucomiss	%xmm4, %xmm3
1400c776a:     	jne	0x1400c7772 <.text+0xc6772>
1400c776c:     	jnp	0x1400c76aa <.text+0xc66aa>
1400c7772:     	movl	$0x1, 0x68(%r9)
1400c777a:     	movss	%xmm0, 0x6c(%r9)
1400c7780:     	movl	%ecx, 0x78(%r9)
1400c7784:     	movss	%xmm2, 0x7c(%r9)
1400c778a:     	movl	0x4ac(%rbp), %ecx
1400c7790:     	movl	%ecx, (%r8,%rdx,4)
1400c7794:     	movl	%eax, 0x80(%r9)
1400c779b:     	movss	%xmm1, 0x84(%r9)
1400c77a4:     	jmp	0x1400c76aa <.text+0xc66aa>

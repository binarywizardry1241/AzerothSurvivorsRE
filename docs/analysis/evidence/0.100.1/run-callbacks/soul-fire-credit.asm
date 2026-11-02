
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e8a60:     	pushq	%rsi
1454e8a61:     	pushq	%rdi
1454e8a62:     	subq	$0x58, %rsp
1454e8a66:     	movaps	%xmm8, 0x40(%rsp)
1454e8a6c:     	movaps	%xmm7, 0x30(%rsp)
1454e8a71:     	movaps	%xmm6, 0x20(%rsp)
1454e8a76:     	movq	0x2b8(%rcx), %rax
1454e8a7d:     	testq	%rax, %rax
1454e8a80:     	je	0x1454e8b87 <.text+0x54e7b87>
1454e8a86:     	movq	0x2b0(%rcx), %rdx
1454e8a8d:     	imulq	$0x58, %rax, %r9
1454e8a91:     	xorl	%r8d, %r8d
1454e8a94:     	movabsq	$0x7269665f6c756f73, %r11 # imm = 0x7269665F6C756F73
1454e8a9e:     	jmp	0x1454e8aad <.text+0x54e7aad>
1454e8aa0:     	addq	$0x58, %r8
1454e8aa4:     	cmpq	%r8, %r9
1454e8aa7:     	je	0x1454e8b87 <.text+0x54e7b87>
1454e8aad:     	movq	(%rdx,%r8), %r10
1454e8ab1:     	cmpq	$0x9, 0x8(%r10)
1454e8ab6:     	jne	0x1454e8aa0 <.text+0x54e7aa0>
1454e8ab8:     	movq	(%r10), %rax
1454e8abb:     	movq	(%rax), %rsi
1454e8abe:     	xorq	%r11, %rsi
1454e8ac1:     	movzbl	0x8(%rax), %edi
1454e8ac5:     	xorq	$0x65, %rdi
1454e8ac9:     	orq	%rsi, %rdi
1454e8acc:     	jne	0x1454e8aa0 <.text+0x54e7aa0>
1454e8ace:     	movl	0x7f0(%rcx), %edi
1454e8ad4:     	cmpl	$0x4, %edi
1454e8ad7:     	ja	0x1454e8b87 <.text+0x54e7b87>
1454e8add:     	movss	0x934(%rcx), %xmm6
1454e8ae5:     	movss	0x7f4(%rcx), %xmm0
1454e8aed:     	ucomiss	%xmm6, %xmm0
1454e8af0:     	ja	0x1454e8b87 <.text+0x54e7b87>
1454e8af6:     	movss	0x50(%rdx,%r8), %xmm7
1454e8afd:     	movss	0x48(%r10), %xmm8
1454e8b03:     	mulss	0x42fbe4(%rip), %xmm8   # 0x1459186f0
1454e8b0c:     	mulss	0x14(%rdx,%r8), %xmm8
1454e8b13:     	mulss	0x3c(%rdx,%r8), %xmm8
1454e8b1a:     	mulss	0x478(%rcx), %xmm8
1454e8b23:     	maxss	0x420ab4(%rip), %xmm8   # 0x1459095e0
1454e8b2c:     	movl	$0x9, %edx
1454e8b31:     	movq	%rcx, %rsi
1454e8b34:     	movq	%rax, %rcx
1454e8b37:     	callq	0x1454536c0 <.text+0x54526c0>
1454e8b3c:     	maxss	%xmm8, %xmm0
1454e8b41:     	maxss	0x42a7a7(%rip), %xmm7   # 0x1459132f0
1454e8b49:     	divss	%xmm7, %xmm0
1454e8b4d:     	incl	%edi
1454e8b4f:     	divss	0x42fce9(%rip), %xmm0   # 0x145918840
1454e8b57:     	movl	%edi, 0x7f0(%rsi)
1454e8b5d:     	addss	%xmm0, %xmm6
1454e8b61:     	movss	%xmm6, 0x7f4(%rsi)
1454e8b69:     	movq	%rsi, %rcx
1454e8b6c:     	movaps	0x20(%rsp), %xmm6
1454e8b71:     	movaps	0x30(%rsp), %xmm7
1454e8b76:     	movaps	0x40(%rsp), %xmm8
1454e8b7c:     	addq	$0x58, %rsp
1454e8b80:     	popq	%rdi
1454e8b81:     	popq	%rsi
1454e8b82:     	jmp	0x1454e7d80 <.text+0x54e6d80>
1454e8b87:     	movaps	0x20(%rsp), %xmm6
1454e8b8c:     	movaps	0x30(%rsp), %xmm7
1454e8b91:     	movaps	0x40(%rsp), %xmm8
1454e8b97:     	addq	$0x58, %rsp
1454e8b9b:     	popq	%rdi
1454e8b9c:     	popq	%rsi
1454e8b9d:     	retq

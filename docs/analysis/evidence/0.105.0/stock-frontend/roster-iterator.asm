
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459a8ac0:     	pushq	%rbp
1459a8ac1:     	pushq	%r15
1459a8ac3:     	pushq	%r14
1459a8ac5:     	pushq	%r13
1459a8ac7:     	pushq	%r12
1459a8ac9:     	pushq	%rsi
1459a8aca:     	pushq	%rdi
1459a8acb:     	pushq	%rbx
1459a8acc:     	subq	$0x98, %rsp
1459a8ad3:     	leaq	0x80(%rsp), %rbp
1459a8adb:     	movq	$-0x2, 0x10(%rbp)
1459a8ae3:     	movq	%rdx, %rbx
1459a8ae6:     	movq	(%rdx), %r13
1459a8ae9:     	movq	0x10(%rdx), %rdi
1459a8aed:     	cmpq	$0x1, %r13
1459a8af1:     	jne	0x1459a8b61 <.text+0x59a7b61>
1459a8af3:     	xorl	%esi, %esi
1459a8af5:     	cmpq	$0x0, 0x8(%rbx)
1459a8afa:     	setne	%sil
1459a8afe:     	testq	%rdi, %rdi
1459a8b01:     	je	0x1459a8ba4 <.text+0x59a7ba4>
1459a8b07:     	movq	0x18(%rbx), %rax
1459a8b0b:     	subq	%rdi, %rax
1459a8b0e:     	shrq	$0x3, %rax
1459a8b12:     	movabsq	$0x6db6db6db6db6db7, %rdx # imm = 0x6DB6DB6DB6DB6DB7
1459a8b1c:     	imulq	%rax, %rdx
1459a8b20:     	addq	%rdx, %rsi
1459a8b23:     	imulq	$0x38, %rsi, %r15
1459a8b27:     	movabsq	$0x249249249249249, %rax # imm = 0x249249249249249
1459a8b31:     	cmpq	%rax, %rsi
1459a8b34:     	ja	0x1459a8b92 <.text+0x59a7b92>
1459a8b36:     	movq	%rcx, -0x18(%rbp)
1459a8b3a:     	testq	%r15, %r15
1459a8b3d:     	je	0x1459a8bb1 <.text+0x59a7bb1>
1459a8b3f:     	callq	0x140002200 <.text+0x1200>
1459a8b44:     	movl	$0x8, %r12d
1459a8b4a:     	movl	$0x8, %edx
1459a8b4f:     	movq	%r15, %rcx
1459a8b52:     	callq	0x1400021c0 <.text+0x11c0>
1459a8b57:     	testq	%rax, %rax
1459a8b5a:     	je	0x1459a8b95 <.text+0x59a7b95>
1459a8b5c:     	movq	%rax, %r14
1459a8b5f:     	jmp	0x1459a8bb9 <.text+0x59a7bb9>
1459a8b61:     	testq	%rdi, %rdi
1459a8b64:     	je	0x1459a8ba2 <.text+0x59a7ba2>
1459a8b66:     	movq	0x18(%rbx), %rax
1459a8b6a:     	subq	%rdi, %rax
1459a8b6d:     	shrq	$0x3, %rax
1459a8b71:     	movabsq	$0x6db6db6db6db6db7, %rsi # imm = 0x6DB6DB6DB6DB6DB7
1459a8b7b:     	imulq	%rax, %rsi
1459a8b7f:     	imulq	$0x38, %rsi, %r15
1459a8b83:     	movabsq	$0x249249249249249, %rax # imm = 0x249249249249249
1459a8b8d:     	cmpq	%rax, %rsi
1459a8b90:     	jbe	0x1459a8b36 <.text+0x59a7b36>
1459a8b92:     	xorl	%r12d, %r12d
1459a8b95:     	movq	%r12, %rcx
1459a8b98:     	movq	%r15, %rdx
1459a8b9b:     	callq	0x145d6944b <.text+0x5d6844b>
1459a8ba0:     	ud2
1459a8ba2:     	xorl	%esi, %esi
1459a8ba4:     	imulq	$0x38, %rsi, %r15
1459a8ba8:     	movq	%rcx, -0x18(%rbp)
1459a8bac:     	testq	%r15, %r15
1459a8baf:     	jne	0x1459a8b3f <.text+0x59a7b3f>
1459a8bb1:     	movl	$0x8, %r14d
1459a8bb7:     	xorl	%esi, %esi
1459a8bb9:     	movq	%rsi, -0x10(%rbp)
1459a8bbd:     	movq	%r14, -0x8(%rbp)
1459a8bc1:     	movq	$0x0, (%rbp)
1459a8bc9:     	testb	%r13b, %r13b
1459a8bcc:     	je	0x1459a8bfd <.text+0x59a7bfd>
1459a8bce:     	xorl	%r8d, %r8d
1459a8bd1:     	cmpq	$0x0, 0x8(%rbx)
1459a8bd6:     	setne	%r8b
1459a8bda:     	testq	%rdi, %rdi
1459a8bdd:     	je	0x1459a8c1f <.text+0x59a7c1f>
1459a8bdf:     	movq	0x18(%rbx), %rax
1459a8be3:     	subq	%rdi, %rax
1459a8be6:     	shrq	$0x3, %rax
1459a8bea:     	movabsq	$0x6db6db6db6db6db7, %rcx # imm = 0x6DB6DB6DB6DB6DB7
1459a8bf4:     	imulq	%rax, %rcx
1459a8bf8:     	addq	%rcx, %r8
1459a8bfb:     	jmp	0x1459a8c1f <.text+0x59a7c1f>
1459a8bfd:     	testq	%rdi, %rdi
1459a8c00:     	je	0x1459a8cdb <.text+0x59a7cdb>
1459a8c06:     	movq	0x18(%rbx), %rax
1459a8c0a:     	subq	%rdi, %rax
1459a8c0d:     	shrq	$0x3, %rax
1459a8c11:     	movabsq	$0x6db6db6db6db6db7, %r8 # imm = 0x6DB6DB6DB6DB6DB7
1459a8c1b:     	imulq	%rax, %r8
1459a8c1f:     	cmpq	%rsi, %r8
1459a8c22:     	ja	0x1459a8d08 <.text+0x59a7d08>
1459a8c28:     	xorl	%esi, %esi
1459a8c2a:     	testb	%r13b, %r13b
1459a8c2d:     	je	0x1459a8cab <.text+0x59a7cab>
1459a8c2f:     	movq	0x8(%rbx), %r15
1459a8c33:     	testq	%r15, %r15
1459a8c36:     	je	0x1459a8cab <.text+0x59a7cab>
1459a8c38:     	movq	0x18(%r15), %r12
1459a8c3c:     	movq	%rsi, -0x20(%rbp)
1459a8c40:     	movb	$0x1, 0xf(%rbp)
1459a8c44:     	leaq	-0x58(%rbp), %rcx
1459a8c48:     	movq	%r15, %rdx
1459a8c4b:     	callq	0x145b9c990 <.text+0x5b9b990>
1459a8c50:     	nop
1459a8c51:     	movzwl	0x30(%r15), %eax
1459a8c56:     	movzbl	0x32(%r15), %ecx
1459a8c5b:     	movzbl	0x37(%r15), %edx
1459a8c60:     	movb	%dl, -0x21(%rbp)
1459a8c63:     	movl	0x33(%r15), %edx
1459a8c67:     	movl	%edx, -0x25(%rbp)
1459a8c6a:     	movq	%r12, -0x40(%rbp)
1459a8c6e:     	movw	%ax, -0x28(%rbp)
1459a8c72:     	movb	%cl, -0x26(%rbp)
1459a8c75:     	movups	0x20(%r15), %xmm0
1459a8c7a:     	movups	%xmm0, -0x38(%rbp)
1459a8c7e:     	imulq	$0x38, %rsi, %rax
1459a8c82:     	movq	-0x28(%rbp), %rcx
1459a8c86:     	movq	%rcx, 0x30(%r14,%rax)
1459a8c8b:     	movups	-0x48(%rbp), %xmm0
1459a8c8f:     	movups	%xmm0, 0x10(%r14,%rax)
1459a8c95:     	movups	-0x58(%rbp), %xmm0
1459a8c99:     	movups	%xmm0, (%r14,%rax)
1459a8c9e:     	movups	-0x38(%rbp), %xmm0
1459a8ca2:     	movups	%xmm0, 0x20(%r14,%rax)
1459a8ca8:     	incq	%rsi
1459a8cab:     	testq	%rdi, %rdi
1459a8cae:     	je	0x1459a8cdd <.text+0x59a7cdd>
1459a8cb0:     	leaq	(%rbp), %rax
1459a8cb4:     	movq	0x18(%rbx), %rdx
1459a8cb8:     	movq	%rax, -0x58(%rbp)
1459a8cbc:     	movq	%rsi, -0x50(%rbp)
1459a8cc0:     	movq	%r14, -0x48(%rbp)
1459a8cc4:     	movq	%rsi, -0x20(%rbp)
1459a8cc8:     	movb	$0x0, 0xf(%rbp)
1459a8ccc:     	leaq	-0x58(%rbp), %r8
1459a8cd0:     	movq	%rdi, %rcx
1459a8cd3:     	callq	0x1458df270 <.text+0x58de270>
1459a8cd8:     	nop
1459a8cd9:     	jmp	0x1459a8ce1 <.text+0x59a7ce1>
1459a8cdb:     	xorl	%esi, %esi
1459a8cdd:     	movq	%rsi, (%rbp)
1459a8ce1:     	movq	-0x18(%rbp), %rax
1459a8ce5:     	movq	(%rbp), %rcx
1459a8ce9:     	movq	%rcx, 0x10(%rax)
1459a8ced:     	movups	-0x10(%rbp), %xmm0
1459a8cf1:     	movups	%xmm0, (%rax)
1459a8cf4:     	addq	$0x98, %rsp
1459a8cfb:     	popq	%rbx
1459a8cfc:     	popq	%rdi
1459a8cfd:     	popq	%rsi
1459a8cfe:     	popq	%r12
1459a8d00:     	popq	%r13
1459a8d02:     	popq	%r14
1459a8d04:     	popq	%r15
1459a8d06:     	popq	%rbp
1459a8d07:     	retq
1459a8d08:     	movq	$0x38, 0x20(%rsp)
1459a8d11:     	leaq	-0x10(%rbp), %rcx
1459a8d15:     	movl	$0x8, %r9d
1459a8d1b:     	xorl	%edx, %edx
1459a8d1d:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459a8d22:     	nop
1459a8d23:     	movq	-0x8(%rbp), %r14
1459a8d27:     	movq	(%rbp), %rsi
1459a8d2b:     	testb	%r13b, %r13b
1459a8d2e:     	jne	0x1459a8c2f <.text+0x59a7c2f>
1459a8d34:     	jmp	0x1459a8cab <.text+0x59a7cab>

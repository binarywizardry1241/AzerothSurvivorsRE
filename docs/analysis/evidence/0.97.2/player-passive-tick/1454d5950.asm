
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d5950:     	pushq	%rbp
1454d5951:     	pushq	%r15
1454d5953:     	pushq	%r14
1454d5955:     	pushq	%r12
1454d5957:     	pushq	%rsi
1454d5958:     	pushq	%rdi
1454d5959:     	pushq	%rbx
1454d595a:     	subq	$0x90, %rsp
1454d5961:     	leaq	0x80(%rsp), %rbp
1454d5969:     	movaps	%xmm6, (%rbp)
1454d596d:     	movq	$-0x2, -0x8(%rbp)
1454d5975:     	movq	%rdx, %rdi
1454d5978:     	movq	%rcx, %rsi
1454d597b:     	movss	0x8e4(%rdx), %xmm0
1454d5983:     	movss	%xmm0, -0xc(%rbp)
1454d5988:     	movq	0x778(%rdx), %r14
1454d598f:     	testq	%r14, %r14
1454d5992:     	je	0x1454d59f6 <.text+0x54d49f6>
1454d5994:     	movq	%r8, %r12
1454d5997:     	movaps	%xmm3, %xmm6
1454d599a:     	movq	0x770(%rdi), %r15
1454d59a1:     	leaq	(,%r14,8), %rbx
1454d59a9:     	callq	0x140002200 <.text+0x1200>
1454d59ae:     	movl	$0x8, %edx
1454d59b3:     	movq	%rbx, %rcx
1454d59b6:     	callq	0x1400021c0 <.text+0x11c0>
1454d59bb:     	testq	%rax, %rax
1454d59be:     	je	0x1454d5b6b <.text+0x54d4b6b>
1454d59c4:     	cmpq	$0x10, %r14
1454d59c8:     	movaps	%xmm6, %xmm3
1454d59cb:     	movq	%r12, %r8
1454d59ce:     	jbe	0x1454d59f2 <.text+0x54d49f2>
1454d59d0:     	leaq	(%rax,%r14,8), %rcx
1454d59d4:     	movq	%r14, %rdx
1454d59d7:     	shlq	$0x4, %rdx
1454d59db:     	addq	%r15, %rdx
1454d59de:     	addq	$-0x8, %rdx
1454d59e2:     	cmpq	%rdx, %rax
1454d59e5:     	setb	%dl
1454d59e8:     	cmpq	%rcx, %r15
1454d59eb:     	setb	%cl
1454d59ee:     	testb	%cl, %dl
1454d59f0:     	je	0x1454d5a00 <.text+0x54d4a00>
1454d59f2:     	xorl	%ecx, %ecx
1454d59f4:     	jmp	0x1454d5a4f <.text+0x54d4a4f>
1454d59f6:     	movl	$0x8, %eax
1454d59fb:     	jmp	0x1454d5adf <.text+0x54d4adf>
1454d5a00:     	movl	%r14d, %ecx
1454d5a03:     	andl	$0x3, %ecx
1454d5a06:     	movl	$0x4, %edx
1454d5a0b:     	cmovneq	%rcx, %rdx
1454d5a0f:     	movq	%r14, %rcx
1454d5a12:     	subq	%rdx, %rcx
1454d5a15:     	leaq	0x20(%r15), %rdx
1454d5a19:     	xorl	%r9d, %r9d
1454d5a1c:     	nopl	(%rax)
1454d5a20:     	movsd	-0x10(%rdx), %xmm0
1454d5a25:     	movups	-0x20(%rdx), %xmm1
1454d5a29:     	movlhps	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0]
1454d5a2c:     	movups	(%rdx), %xmm0
1454d5a2f:     	movsd	0x10(%rdx), %xmm2
1454d5a34:     	movlhps	%xmm2, %xmm0            # xmm0 = xmm0[0],xmm2[0]
1454d5a37:     	movups	%xmm1, (%rax,%r9,8)
1454d5a3c:     	movups	%xmm0, 0x10(%rax,%r9,8)
1454d5a42:     	addq	$0x4, %r9
1454d5a46:     	addq	$0x40, %rdx
1454d5a4a:     	cmpq	%r9, %rcx
1454d5a4d:     	jne	0x1454d5a20 <.text+0x54d4a20>
1454d5a4f:     	movl	%r14d, %r9d
1454d5a52:     	subl	%ecx, %r9d
1454d5a55:     	movq	%rcx, %rdx
1454d5a58:     	andl	$0x3, %r9d
1454d5a5c:     	je	0x1454d5a94 <.text+0x54d4a94>
1454d5a5e:     	movq	%rcx, %r10
1454d5a61:     	shlq	$0x4, %r10
1454d5a65:     	addq	%r15, %r10
1454d5a68:     	shll	$0x3, %r9d
1454d5a6c:     	xorl	%r11d, %r11d
1454d5a6f:     	movq	%rcx, %rdx
1454d5a72:     	nopw	%cs:(%rax,%rax)
1454d5a80:     	movq	(%r10,%r11,2), %rbx
1454d5a84:     	movq	%rbx, (%rax,%rdx,8)
1454d5a88:     	incq	%rdx
1454d5a8b:     	addq	$0x8, %r11
1454d5a8f:     	cmpq	%r11, %r9
1454d5a92:     	jne	0x1454d5a80 <.text+0x54d4a80>
1454d5a94:     	subq	%r14, %rcx
1454d5a97:     	cmpq	$-0x4, %rcx
1454d5a9b:     	ja	0x1454d5adf <.text+0x54d4adf>
1454d5a9d:     	movq	%rdx, %rcx
1454d5aa0:     	shlq	$0x4, %rcx
1454d5aa4:     	addq	%r15, %rcx
1454d5aa7:     	addq	$0x30, %rcx
1454d5aab:     	nopl	(%rax,%rax)
1454d5ab0:     	movq	-0x30(%rcx), %r9
1454d5ab4:     	movq	%r9, (%rax,%rdx,8)
1454d5ab8:     	movq	-0x20(%rcx), %r9
1454d5abc:     	movq	%r9, 0x8(%rax,%rdx,8)
1454d5ac1:     	movq	-0x10(%rcx), %r9
1454d5ac5:     	movq	%r9, 0x10(%rax,%rdx,8)
1454d5aca:     	movq	(%rcx), %r9
1454d5acd:     	movq	%r9, 0x18(%rax,%rdx,8)
1454d5ad2:     	addq	$0x4, %rdx
1454d5ad6:     	addq	$0x40, %rcx
1454d5ada:     	cmpq	%rdx, %r14
1454d5add:     	jne	0x1454d5ab0 <.text+0x54d4ab0>
1454d5adf:     	movq	%r14, -0x28(%rbp)
1454d5ae3:     	movq	%rax, -0x20(%rbp)
1454d5ae7:     	movq	%r14, -0x18(%rbp)
1454d5aeb:     	leaq	-0x60(%rbp), %rcx
1454d5aef:     	movq	%rdi, %rdx
1454d5af2:     	callq	0x1454ee2a0 <.text+0x54ed2a0>
1454d5af7:     	nop
1454d5af8:     	movq	-0x60(%rbp), %rax
1454d5afc:     	movq	-0x58(%rbp), %rcx
1454d5b00:     	movq	-0x50(%rbp), %rdx
1454d5b04:     	leaq	(%rcx,%rdx,8), %rdx
1454d5b08:     	movq	%rcx, -0x60(%rbp)
1454d5b0c:     	movq	%rcx, -0x58(%rbp)
1454d5b10:     	movq	%rax, -0x50(%rbp)
1454d5b14:     	movq	%rdx, -0x48(%rbp)
1454d5b18:     	leaq	-0x28(%rbp), %rax
1454d5b1c:     	movq	%rax, -0x40(%rbp)
1454d5b20:     	movq	%rdi, -0x38(%rbp)
1454d5b24:     	leaq	-0xc(%rbp), %rax
1454d5b28:     	movq	%rax, -0x30(%rbp)
1454d5b2c:     	leaq	-0x60(%rbp), %rdx
1454d5b30:     	movq	%rsi, %rcx
1454d5b33:     	callq	0x145544f90 <.text+0x5543f90>
1454d5b38:     	nop
1454d5b39:     	movq	-0x28(%rbp), %rdx
1454d5b3d:     	testq	%rdx, %rdx
1454d5b40:     	je	0x1454d5b55 <.text+0x54d4b55>
1454d5b42:     	movq	-0x20(%rbp), %rcx
1454d5b46:     	shlq	$0x3, %rdx
1454d5b4a:     	movl	$0x8, %r8d
1454d5b50:     	callq	0x1400021d0 <.text+0x11d0>
1454d5b55:     	movaps	(%rbp), %xmm6
1454d5b59:     	addq	$0x90, %rsp
1454d5b60:     	popq	%rbx
1454d5b61:     	popq	%rdi
1454d5b62:     	popq	%rsi
1454d5b63:     	popq	%r12
1454d5b65:     	popq	%r14
1454d5b67:     	popq	%r15
1454d5b69:     	popq	%rbp
1454d5b6a:     	retq
1454d5b6b:     	movl	$0x8, %ecx
1454d5b70:     	movq	%rbx, %rdx
1454d5b73:     	callq	0x1458e721b <.text+0x58e621b>
1454d5b78:     	ud2

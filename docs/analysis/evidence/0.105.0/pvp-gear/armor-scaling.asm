
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b3920:     	pushq	%rbp
1459b3921:     	pushq	%r15
1459b3923:     	pushq	%r14
1459b3925:     	pushq	%r13
1459b3927:     	pushq	%r12
1459b3929:     	pushq	%rsi
1459b392a:     	pushq	%rdi
1459b392b:     	pushq	%rbx
1459b392c:     	subq	$0x58, %rsp
1459b3930:     	leaq	0x50(%rsp), %rbp
1459b3935:     	movaps	%xmm6, -0x10(%rbp)
1459b3939:     	movq	$-0x2, -0x18(%rbp)
1459b3941:     	movq	(%rcx), %rsi
1459b3944:     	movq	0x8(%rcx), %rdi
1459b3948:     	movq	(%rdx), %rax
1459b394b:     	movq	0x8(%rdx), %r8
1459b394f:     	cmpq	%rdi, %rsi
1459b3952:     	je	0x1459b3ae1 <.text+0x59b2ae1>
1459b3958:     	movq	%rax, -0x28(%rbp)
1459b395c:     	movq	0x10(%rcx), %rbx
1459b3960:     	movq	0x10(%rdx), %rax
1459b3964:     	subq	%rsi, %rdi
1459b3967:     	shrq	$0x3, %rdi
1459b396b:     	movq	%r8, -0x20(%rbp)
1459b396f:     	leaq	(%rax,%r8,8), %r15
1459b3973:     	xorl	%r14d, %r14d
1459b3976:     	leaq	0x180247f(%rip), %r12   # 0x1471b5dfc
1459b397d:     	movss	0x3e7593(%rip), %xmm6   # 0x145d9af18
1459b3985:     	leaq	0x1802ef4(%rip), %r13   # 0x1471b6880
1459b398c:     	jmp	0x1459b39a7 <.text+0x59b29a7>
1459b398e:     	movl	%edx, %ecx
1459b3990:     	shlq	$0x20, %rax
1459b3994:     	orq	%rcx, %rax
1459b3997:     	movq	%rax, (%r15,%r14,8)
1459b399b:     	incq	%r14
1459b399e:     	cmpq	%r14, %rdi
1459b39a1:     	je	0x1459b3ad6 <.text+0x59b2ad6>
1459b39a7:     	movq	(%rbx), %rcx
1459b39aa:     	cmpq	$0x5, %rcx
1459b39ae:     	ja	0x1459b3af9 <.text+0x59b2af9>
1459b39b4:     	movq	(%rsi,%r14,8), %rdx
1459b39b8:     	movss	(%r12,%rcx,4), %xmm0
1459b39be:     	mulss	%xmm6, %xmm0
1459b39c2:     	movq	%rdx, %rax
1459b39c5:     	shrq	$0x20, %rax
1459b39c9:     	movl	%edx, %ecx
1459b39cb:     	movslq	(%r13,%rcx,4), %rcx
1459b39d0:     	addq	%r13, %rcx
1459b39d3:     	jmpq	*%rcx
1459b39d5:     	movd	%eax, %xmm1
1459b39d9:     	mulss	%xmm1, %xmm0
1459b39dd:     	movd	%xmm0, %eax
1459b39e1:     	xorl	%ecx, %ecx
1459b39e3:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b39e5:     	movd	%eax, %xmm1
1459b39e9:     	mulss	%xmm1, %xmm0
1459b39ed:     	movd	%xmm0, %eax
1459b39f1:     	movl	$0x4, %ecx
1459b39f6:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b39f8:     	movd	%eax, %xmm1
1459b39fc:     	mulss	%xmm1, %xmm0
1459b3a00:     	movd	%xmm0, %eax
1459b3a04:     	movl	$0xc, %ecx
1459b3a09:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3a0b:     	movd	%eax, %xmm1
1459b3a0f:     	mulss	%xmm1, %xmm0
1459b3a13:     	movd	%xmm0, %eax
1459b3a17:     	movl	$0x9, %ecx
1459b3a1c:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3a21:     	movd	%eax, %xmm1
1459b3a25:     	mulss	%xmm1, %xmm0
1459b3a29:     	callq	0x145bc97b1 <.text+0x5bc87b1>
1459b3a2e:     	movd	%xmm0, %eax
1459b3a32:     	movl	$0x2, %ecx
1459b3a37:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3a3c:     	movd	%eax, %xmm1
1459b3a40:     	mulss	%xmm1, %xmm0
1459b3a44:     	movd	%xmm0, %eax
1459b3a48:     	movl	$0x3, %ecx
1459b3a4d:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3a52:     	movd	%eax, %xmm1
1459b3a56:     	mulss	%xmm1, %xmm0
1459b3a5a:     	movd	%xmm0, %eax
1459b3a5e:     	movl	$0x7, %ecx
1459b3a63:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3a68:     	movd	%eax, %xmm1
1459b3a6c:     	mulss	%xmm1, %xmm0
1459b3a70:     	movd	%xmm0, %eax
1459b3a74:     	movl	$0x1, %ecx
1459b3a79:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3a7e:     	movd	%eax, %xmm1
1459b3a82:     	mulss	%xmm1, %xmm0
1459b3a86:     	movd	%xmm0, %eax
1459b3a8a:     	movl	$0x5, %ecx
1459b3a8f:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3a94:     	movd	%eax, %xmm1
1459b3a98:     	mulss	%xmm1, %xmm0
1459b3a9c:     	movd	%xmm0, %eax
1459b3aa0:     	movl	$0x6, %ecx
1459b3aa5:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3aaa:     	movd	%eax, %xmm1
1459b3aae:     	mulss	%xmm1, %xmm0
1459b3ab2:     	movd	%xmm0, %eax
1459b3ab6:     	movl	$0xa, %ecx
1459b3abb:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3ac0:     	movd	%eax, %xmm1
1459b3ac4:     	mulss	%xmm1, %xmm0
1459b3ac8:     	movd	%xmm0, %eax
1459b3acc:     	movl	$0x8, %ecx
1459b3ad1:     	jmp	0x1459b3990 <.text+0x59b2990>
1459b3ad6:     	movq	-0x20(%rbp), %r8
1459b3ada:     	addq	%r14, %r8
1459b3add:     	movq	-0x28(%rbp), %rax
1459b3ae1:     	movq	%r8, (%rax)
1459b3ae4:     	movaps	-0x10(%rbp), %xmm6
1459b3ae8:     	addq	$0x58, %rsp
1459b3aec:     	popq	%rbx
1459b3aed:     	popq	%rdi
1459b3aee:     	popq	%rsi
1459b3aef:     	popq	%r12
1459b3af1:     	popq	%r13
1459b3af3:     	popq	%r14
1459b3af5:     	popq	%r15
1459b3af7:     	popq	%rbp
1459b3af8:     	retq
1459b3af9:     	addq	%r14, -0x20(%rbp)
1459b3afd:     	leaq	0x1802334(%rip), %r8    # 0x1471b5e38
1459b3b04:     	movl	$0x6, %edx
1459b3b09:     	callq	0x145d697e3 <.text+0x5d687e3>
1459b3b0e:     	nop
1459b3b0f:     	ud2

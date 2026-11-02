
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f0c40:     	pushq	%rbp
1454f0c41:     	pushq	%r15
1454f0c43:     	pushq	%r14
1454f0c45:     	pushq	%r13
1454f0c47:     	pushq	%r12
1454f0c49:     	pushq	%rsi
1454f0c4a:     	pushq	%rdi
1454f0c4b:     	pushq	%rbx
1454f0c4c:     	subq	$0x58, %rsp
1454f0c50:     	leaq	0x50(%rsp), %rbp
1454f0c55:     	movaps	%xmm6, -0x10(%rbp)
1454f0c59:     	movq	$-0x2, -0x18(%rbp)
1454f0c61:     	movq	(%rcx), %rsi
1454f0c64:     	movq	0x8(%rcx), %rdi
1454f0c68:     	movq	(%rdx), %rax
1454f0c6b:     	movq	0x8(%rdx), %r8
1454f0c6f:     	cmpq	%rdi, %rsi
1454f0c72:     	je	0x1454f0e01 <.text+0x54efe01>
1454f0c78:     	movq	%rax, -0x28(%rbp)
1454f0c7c:     	movq	0x10(%rcx), %rbx
1454f0c80:     	movq	0x10(%rdx), %rax
1454f0c84:     	subq	%rsi, %rdi
1454f0c87:     	shrq	$0x3, %rdi
1454f0c8b:     	movq	%r8, -0x20(%rbp)
1454f0c8f:     	leaq	(%rax,%r8,8), %r15
1454f0c93:     	xorl	%r14d, %r14d
1454f0c96:     	leaq	0x15c2353(%rip), %r12   # 0x146ab2ff0
1454f0c9d:     	movss	0x3b78e3(%rip), %xmm6   # 0x1458a8588
1454f0ca5:     	leaq	0x15c2d24(%rip), %r13   # 0x146ab39d0
1454f0cac:     	jmp	0x1454f0cc7 <.text+0x54efcc7>
1454f0cae:     	movl	%edx, %ecx
1454f0cb0:     	shlq	$0x20, %rax
1454f0cb4:     	orq	%rcx, %rax
1454f0cb7:     	movq	%rax, (%r15,%r14,8)
1454f0cbb:     	incq	%r14
1454f0cbe:     	cmpq	%r14, %rdi
1454f0cc1:     	je	0x1454f0df6 <.text+0x54efdf6>
1454f0cc7:     	movq	(%rbx), %rcx
1454f0cca:     	cmpq	$0x4, %rcx
1454f0cce:     	ja	0x1454f0e19 <.text+0x54efe19>
1454f0cd4:     	movq	(%rsi,%r14,8), %rdx
1454f0cd8:     	movss	(%r12,%rcx,4), %xmm0
1454f0cde:     	mulss	%xmm6, %xmm0
1454f0ce2:     	movq	%rdx, %rax
1454f0ce5:     	shrq	$0x20, %rax
1454f0ce9:     	movl	%edx, %ecx
1454f0ceb:     	movslq	(%r13,%rcx,4), %rcx
1454f0cf0:     	addq	%r13, %rcx
1454f0cf3:     	jmpq	*%rcx
1454f0cf5:     	movd	%eax, %xmm1
1454f0cf9:     	mulss	%xmm1, %xmm0
1454f0cfd:     	movd	%xmm0, %eax
1454f0d01:     	xorl	%ecx, %ecx
1454f0d03:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0d05:     	movd	%eax, %xmm1
1454f0d09:     	mulss	%xmm1, %xmm0
1454f0d0d:     	movd	%xmm0, %eax
1454f0d11:     	movl	$0x4, %ecx
1454f0d16:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0d18:     	movd	%eax, %xmm1
1454f0d1c:     	mulss	%xmm1, %xmm0
1454f0d20:     	movd	%xmm0, %eax
1454f0d24:     	movl	$0xc, %ecx
1454f0d29:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0d2b:     	movd	%eax, %xmm1
1454f0d2f:     	mulss	%xmm1, %xmm0
1454f0d33:     	movd	%xmm0, %eax
1454f0d37:     	movl	$0x9, %ecx
1454f0d3c:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0d41:     	movd	%eax, %xmm1
1454f0d45:     	mulss	%xmm1, %xmm0
1454f0d49:     	callq	0x145714a5d <.text+0x5713a5d>
1454f0d4e:     	movd	%xmm0, %eax
1454f0d52:     	movl	$0x2, %ecx
1454f0d57:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0d5c:     	movd	%eax, %xmm1
1454f0d60:     	mulss	%xmm1, %xmm0
1454f0d64:     	movd	%xmm0, %eax
1454f0d68:     	movl	$0x3, %ecx
1454f0d6d:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0d72:     	movd	%eax, %xmm1
1454f0d76:     	mulss	%xmm1, %xmm0
1454f0d7a:     	movd	%xmm0, %eax
1454f0d7e:     	movl	$0x7, %ecx
1454f0d83:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0d88:     	movd	%eax, %xmm1
1454f0d8c:     	mulss	%xmm1, %xmm0
1454f0d90:     	movd	%xmm0, %eax
1454f0d94:     	movl	$0x1, %ecx
1454f0d99:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0d9e:     	movd	%eax, %xmm1
1454f0da2:     	mulss	%xmm1, %xmm0
1454f0da6:     	movd	%xmm0, %eax
1454f0daa:     	movl	$0x5, %ecx
1454f0daf:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0db4:     	movd	%eax, %xmm1
1454f0db8:     	mulss	%xmm1, %xmm0
1454f0dbc:     	movd	%xmm0, %eax
1454f0dc0:     	movl	$0x6, %ecx
1454f0dc5:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0dca:     	movd	%eax, %xmm1
1454f0dce:     	mulss	%xmm1, %xmm0
1454f0dd2:     	movd	%xmm0, %eax
1454f0dd6:     	movl	$0xa, %ecx
1454f0ddb:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0de0:     	movd	%eax, %xmm1
1454f0de4:     	mulss	%xmm1, %xmm0
1454f0de8:     	movd	%xmm0, %eax
1454f0dec:     	movl	$0x8, %ecx
1454f0df1:     	jmp	0x1454f0cb0 <.text+0x54efcb0>
1454f0df6:     	movq	-0x20(%rbp), %r8
1454f0dfa:     	addq	%r14, %r8
1454f0dfd:     	movq	-0x28(%rbp), %rax
1454f0e01:     	movq	%r8, (%rax)
1454f0e04:     	movaps	-0x10(%rbp), %xmm6
1454f0e08:     	addq	$0x58, %rsp
1454f0e0c:     	popq	%rbx
1454f0e0d:     	popq	%rdi
1454f0e0e:     	popq	%rsi
1454f0e0f:     	popq	%r12
1454f0e11:     	popq	%r13
1454f0e13:     	popq	%r14
1454f0e15:     	popq	%r15
1454f0e17:     	popq	%rbp
1454f0e18:     	retq
1454f0e19:     	addq	%r14, -0x20(%rbp)
1454f0e1d:     	leaq	0x15c2204(%rip), %r8    # 0x146ab3028
1454f0e24:     	movl	$0x5, %edx
1454f0e29:     	callq	0x1458a3f23 <.text+0x58a2f23>
1454f0e2e:     	nop
1454f0e2f:     	ud2

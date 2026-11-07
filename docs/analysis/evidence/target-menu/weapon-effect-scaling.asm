
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14554ca00:     	pushq	%rbp
14554ca01:     	pushq	%r15
14554ca03:     	pushq	%r14
14554ca05:     	pushq	%r13
14554ca07:     	pushq	%r12
14554ca09:     	pushq	%rsi
14554ca0a:     	pushq	%rdi
14554ca0b:     	pushq	%rbx
14554ca0c:     	subq	$0x58, %rsp
14554ca10:     	leaq	0x50(%rsp), %rbp
14554ca15:     	movaps	%xmm6, -0x10(%rbp)
14554ca19:     	movq	$-0x2, -0x18(%rbp)
14554ca21:     	movq	(%rcx), %rsi
14554ca24:     	movq	0x8(%rcx), %rdi
14554ca28:     	movq	(%rdx), %rax
14554ca2b:     	movq	0x8(%rdx), %r8
14554ca2f:     	cmpq	%rdi, %rsi
14554ca32:     	je	0x14554cbc1 <.text+0x554bbc1>
14554ca38:     	movq	%rax, -0x28(%rbp)
14554ca3c:     	movq	0x10(%rcx), %rbx
14554ca40:     	movq	0x10(%rdx), %rax
14554ca44:     	subq	%rsi, %rdi
14554ca47:     	shrq	$0x3, %rdi
14554ca4b:     	movq	%r8, -0x20(%rbp)
14554ca4f:     	leaq	(%rax,%r8,8), %r15
14554ca53:     	xorl	%r14d, %r14d
14554ca56:     	leaq	0x17ea0e3(%rip), %r12   # 0x146d36b40
14554ca5d:     	movss	0x3fb46f(%rip), %xmm6   # 0x145947ed4
14554ca65:     	leaq	0x17eab38(%rip), %r13   # 0x146d375a4
14554ca6c:     	jmp	0x14554ca87 <.text+0x554ba87>
14554ca6e:     	movl	%edx, %ecx
14554ca70:     	shlq	$0x20, %rax
14554ca74:     	orq	%rcx, %rax
14554ca77:     	movq	%rax, (%r15,%r14,8)
14554ca7b:     	incq	%r14
14554ca7e:     	cmpq	%r14, %rdi
14554ca81:     	je	0x14554cbb6 <.text+0x554bbb6>
14554ca87:     	movq	(%rbx), %rcx
14554ca8a:     	cmpq	$0x5, %rcx
14554ca8e:     	ja	0x14554cbd9 <.text+0x554bbd9>
14554ca94:     	movq	(%rsi,%r14,8), %rdx
14554ca98:     	movss	(%r12,%rcx,4), %xmm0
14554ca9e:     	mulss	%xmm6, %xmm0
14554caa2:     	movq	%rdx, %rax
14554caa5:     	shrq	$0x20, %rax
14554caa9:     	movl	%edx, %ecx
14554caab:     	movslq	(%r13,%rcx,4), %rcx
14554cab0:     	addq	%r13, %rcx
14554cab3:     	jmpq	*%rcx
14554cab5:     	movd	%eax, %xmm1
14554cab9:     	mulss	%xmm1, %xmm0
14554cabd:     	movd	%xmm0, %eax
14554cac1:     	xorl	%ecx, %ecx
14554cac3:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cac5:     	movd	%eax, %xmm1
14554cac9:     	mulss	%xmm1, %xmm0
14554cacd:     	movd	%xmm0, %eax
14554cad1:     	movl	$0x4, %ecx
14554cad6:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cad8:     	movd	%eax, %xmm1
14554cadc:     	mulss	%xmm1, %xmm0
14554cae0:     	movd	%xmm0, %eax
14554cae4:     	movl	$0xc, %ecx
14554cae9:     	jmp	0x14554ca70 <.text+0x554ba70>
14554caeb:     	movd	%eax, %xmm1
14554caef:     	mulss	%xmm1, %xmm0
14554caf3:     	movd	%xmm0, %eax
14554caf7:     	movl	$0x9, %ecx
14554cafc:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cb01:     	movd	%eax, %xmm1
14554cb05:     	mulss	%xmm1, %xmm0
14554cb09:     	callq	0x14577322f <.text+0x577222f>
14554cb0e:     	movd	%xmm0, %eax
14554cb12:     	movl	$0x2, %ecx
14554cb17:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cb1c:     	movd	%eax, %xmm1
14554cb20:     	mulss	%xmm1, %xmm0
14554cb24:     	movd	%xmm0, %eax
14554cb28:     	movl	$0x3, %ecx
14554cb2d:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cb32:     	movd	%eax, %xmm1
14554cb36:     	mulss	%xmm1, %xmm0
14554cb3a:     	movd	%xmm0, %eax
14554cb3e:     	movl	$0x7, %ecx
14554cb43:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cb48:     	movd	%eax, %xmm1
14554cb4c:     	mulss	%xmm1, %xmm0
14554cb50:     	movd	%xmm0, %eax
14554cb54:     	movl	$0x1, %ecx
14554cb59:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cb5e:     	movd	%eax, %xmm1
14554cb62:     	mulss	%xmm1, %xmm0
14554cb66:     	movd	%xmm0, %eax
14554cb6a:     	movl	$0x5, %ecx
14554cb6f:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cb74:     	movd	%eax, %xmm1
14554cb78:     	mulss	%xmm1, %xmm0
14554cb7c:     	movd	%xmm0, %eax
14554cb80:     	movl	$0x6, %ecx
14554cb85:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cb8a:     	movd	%eax, %xmm1
14554cb8e:     	mulss	%xmm1, %xmm0
14554cb92:     	movd	%xmm0, %eax
14554cb96:     	movl	$0xa, %ecx
14554cb9b:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cba0:     	movd	%eax, %xmm1
14554cba4:     	mulss	%xmm1, %xmm0
14554cba8:     	movd	%xmm0, %eax
14554cbac:     	movl	$0x8, %ecx
14554cbb1:     	jmp	0x14554ca70 <.text+0x554ba70>
14554cbb6:     	movq	-0x20(%rbp), %r8
14554cbba:     	addq	%r14, %r8
14554cbbd:     	movq	-0x28(%rbp), %rax
14554cbc1:     	movq	%r8, (%rax)
14554cbc4:     	movaps	-0x10(%rbp), %xmm6
14554cbc8:     	addq	$0x58, %rsp
14554cbcc:     	popq	%rbx
14554cbcd:     	popq	%rdi
14554cbce:     	popq	%rsi
14554cbcf:     	popq	%r12
14554cbd1:     	popq	%r13
14554cbd3:     	popq	%r14
14554cbd5:     	popq	%r15
14554cbd7:     	popq	%rbp
14554cbd8:     	retq
14554cbd9:     	addq	%r14, -0x20(%rbp)
14554cbdd:     	leaq	0x17e9fb4(%rip), %r8    # 0x146d36b98
14554cbe4:     	movl	$0x6, %edx
14554cbe9:     	callq	0x145903b33 <.text+0x5902b33>
14554cbee:     	nop
14554cbef:     	ud2

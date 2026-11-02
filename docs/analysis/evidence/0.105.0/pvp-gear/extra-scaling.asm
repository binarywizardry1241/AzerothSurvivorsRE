
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b3da0:     	pushq	%rbp
1459b3da1:     	pushq	%r15
1459b3da3:     	pushq	%r14
1459b3da5:     	pushq	%r13
1459b3da7:     	pushq	%r12
1459b3da9:     	pushq	%rsi
1459b3daa:     	pushq	%rdi
1459b3dab:     	pushq	%rbx
1459b3dac:     	subq	$0x58, %rsp
1459b3db0:     	leaq	0x50(%rsp), %rbp
1459b3db5:     	movaps	%xmm6, -0x10(%rbp)
1459b3db9:     	movq	$-0x2, -0x18(%rbp)
1459b3dc1:     	movq	(%rcx), %rsi
1459b3dc4:     	movq	0x8(%rcx), %rdi
1459b3dc8:     	movq	(%rdx), %rax
1459b3dcb:     	movq	0x8(%rdx), %r8
1459b3dcf:     	cmpq	%rdi, %rsi
1459b3dd2:     	je	0x1459b3f61 <.text+0x59b2f61>
1459b3dd8:     	movq	%rax, -0x28(%rbp)
1459b3ddc:     	movq	0x10(%rcx), %rbx
1459b3de0:     	movq	0x10(%rdx), %rax
1459b3de4:     	subq	%rsi, %rdi
1459b3de7:     	shrq	$0x3, %rdi
1459b3deb:     	movq	%r8, -0x20(%rbp)
1459b3def:     	leaq	(%rax,%r8,8), %r15
1459b3df3:     	xorl	%r14d, %r14d
1459b3df6:     	leaq	0x180206b(%rip), %r12   # 0x1471b5e68
1459b3dfd:     	movss	0x3e7113(%rip), %xmm6   # 0x145d9af18
1459b3e05:     	leaq	0x1802adc(%rip), %r13   # 0x1471b68e8
1459b3e0c:     	jmp	0x1459b3e27 <.text+0x59b2e27>
1459b3e0e:     	movl	%edx, %ecx
1459b3e10:     	shlq	$0x20, %rax
1459b3e14:     	orq	%rcx, %rax
1459b3e17:     	movq	%rax, (%r15,%r14,8)
1459b3e1b:     	incq	%r14
1459b3e1e:     	cmpq	%r14, %rdi
1459b3e21:     	je	0x1459b3f56 <.text+0x59b2f56>
1459b3e27:     	movq	(%rbx), %rcx
1459b3e2a:     	cmpq	$0x5, %rcx
1459b3e2e:     	ja	0x1459b3f79 <.text+0x59b2f79>
1459b3e34:     	movq	(%rsi,%r14,8), %rdx
1459b3e38:     	movss	(%r12,%rcx,4), %xmm0
1459b3e3e:     	mulss	%xmm6, %xmm0
1459b3e42:     	movq	%rdx, %rax
1459b3e45:     	shrq	$0x20, %rax
1459b3e49:     	movl	%edx, %ecx
1459b3e4b:     	movslq	(%r13,%rcx,4), %rcx
1459b3e50:     	addq	%r13, %rcx
1459b3e53:     	jmpq	*%rcx
1459b3e55:     	movd	%eax, %xmm1
1459b3e59:     	mulss	%xmm1, %xmm0
1459b3e5d:     	movd	%xmm0, %eax
1459b3e61:     	xorl	%ecx, %ecx
1459b3e63:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3e65:     	movd	%eax, %xmm1
1459b3e69:     	mulss	%xmm1, %xmm0
1459b3e6d:     	movd	%xmm0, %eax
1459b3e71:     	movl	$0x4, %ecx
1459b3e76:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3e78:     	movd	%eax, %xmm1
1459b3e7c:     	mulss	%xmm1, %xmm0
1459b3e80:     	movd	%xmm0, %eax
1459b3e84:     	movl	$0xc, %ecx
1459b3e89:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3e8b:     	movd	%eax, %xmm1
1459b3e8f:     	mulss	%xmm1, %xmm0
1459b3e93:     	movd	%xmm0, %eax
1459b3e97:     	movl	$0x9, %ecx
1459b3e9c:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3ea1:     	movd	%eax, %xmm1
1459b3ea5:     	mulss	%xmm1, %xmm0
1459b3ea9:     	callq	0x145bc97b1 <.text+0x5bc87b1>
1459b3eae:     	movd	%xmm0, %eax
1459b3eb2:     	movl	$0x2, %ecx
1459b3eb7:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3ebc:     	movd	%eax, %xmm1
1459b3ec0:     	mulss	%xmm1, %xmm0
1459b3ec4:     	movd	%xmm0, %eax
1459b3ec8:     	movl	$0x3, %ecx
1459b3ecd:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3ed2:     	movd	%eax, %xmm1
1459b3ed6:     	mulss	%xmm1, %xmm0
1459b3eda:     	movd	%xmm0, %eax
1459b3ede:     	movl	$0x7, %ecx
1459b3ee3:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3ee8:     	movd	%eax, %xmm1
1459b3eec:     	mulss	%xmm1, %xmm0
1459b3ef0:     	movd	%xmm0, %eax
1459b3ef4:     	movl	$0x1, %ecx
1459b3ef9:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3efe:     	movd	%eax, %xmm1
1459b3f02:     	mulss	%xmm1, %xmm0
1459b3f06:     	movd	%xmm0, %eax
1459b3f0a:     	movl	$0x5, %ecx
1459b3f0f:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3f14:     	movd	%eax, %xmm1
1459b3f18:     	mulss	%xmm1, %xmm0
1459b3f1c:     	movd	%xmm0, %eax
1459b3f20:     	movl	$0x6, %ecx
1459b3f25:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3f2a:     	movd	%eax, %xmm1
1459b3f2e:     	mulss	%xmm1, %xmm0
1459b3f32:     	movd	%xmm0, %eax
1459b3f36:     	movl	$0xa, %ecx
1459b3f3b:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3f40:     	movd	%eax, %xmm1
1459b3f44:     	mulss	%xmm1, %xmm0
1459b3f48:     	movd	%xmm0, %eax
1459b3f4c:     	movl	$0x8, %ecx
1459b3f51:     	jmp	0x1459b3e10 <.text+0x59b2e10>
1459b3f56:     	movq	-0x20(%rbp), %r8
1459b3f5a:     	addq	%r14, %r8
1459b3f5d:     	movq	-0x28(%rbp), %rax
1459b3f61:     	movq	%r8, (%rax)
1459b3f64:     	movaps	-0x10(%rbp), %xmm6
1459b3f68:     	addq	$0x58, %rsp
1459b3f6c:     	popq	%rbx
1459b3f6d:     	popq	%rdi
1459b3f6e:     	popq	%rsi
1459b3f6f:     	popq	%r12
1459b3f71:     	popq	%r13
1459b3f73:     	popq	%r14
1459b3f75:     	popq	%r15
1459b3f77:     	popq	%rbp
1459b3f78:     	retq
1459b3f79:     	addq	%r14, -0x20(%rbp)
1459b3f7d:     	leaq	0x1801efc(%rip), %r8    # 0x1471b5e80
1459b3f84:     	movl	$0x6, %edx
1459b3f89:     	callq	0x145d697e3 <.text+0x5d687e3>
1459b3f8e:     	nop
1459b3f8f:     	ud2

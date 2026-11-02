
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459a3e50:     	pushq	%rbp
1459a3e51:     	pushq	%r15
1459a3e53:     	pushq	%r14
1459a3e55:     	pushq	%r13
1459a3e57:     	pushq	%r12
1459a3e59:     	pushq	%rsi
1459a3e5a:     	pushq	%rdi
1459a3e5b:     	pushq	%rbx
1459a3e5c:     	subq	$0x58, %rsp
1459a3e60:     	leaq	0x50(%rsp), %rbp
1459a3e65:     	movq	$-0x2, (%rbp)
1459a3e6d:     	movq	%rcx, %rsi
1459a3e70:     	movq	(%rdx), %r15
1459a3e73:     	movq	0x8(%rdx), %r14
1459a3e77:     	cmpq	%r14, %r15
1459a3e7a:     	je	0x1459a3f1e <.text+0x59a2f1e>
1459a3e80:     	movq	0x10(%rdx), %r12
1459a3e84:     	movq	0x18(%rdx), %r13
1459a3e88:     	movq	0x20(%rdx), %rbx
1459a3e8c:     	movq	0x28(%rdx), %rdi
1459a3e90:     	addq	$0x48, %r15
1459a3e94:     	jmp	0x1459a3ecb <.text+0x59a2ecb>
1459a3e96:     	movsd	-0x14(%r15), %xmm0
1459a3e9c:     	movsd	(%rbx), %xmm1
1459a3ea0:     	subps	%xmm1, %xmm0
1459a3ea3:     	mulps	%xmm0, %xmm0
1459a3ea6:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1459a3eaa:     	addss	%xmm0, %xmm1
1459a3eae:     	xorps	%xmm0, %xmm0
1459a3eb1:     	sqrtss	%xmm1, %xmm0
1459a3eb5:     	movss	(%rdi), %xmm1
1459a3eb9:     	ucomiss	%xmm0, %xmm1
1459a3ebc:     	jae	0x1459a3f49 <.text+0x59a2f49>
1459a3ec2:     	cmpq	%r14, %r15
1459a3ec5:     	leaq	0x48(%r15), %r15
1459a3ec9:     	je	0x1459a3f1e <.text+0x59a2f1e>
1459a3ecb:     	cmpb	$0x0, -0x30(%r15)
1459a3ed0:     	jne	0x1459a3ec2 <.text+0x59a2ec2>
1459a3ed2:     	movl	-0x28(%r15), %eax
1459a3ed6:     	cmpl	$0x2, %eax
1459a3ed9:     	jb	0x1459a3eea <.text+0x59a2eea>
1459a3edb:     	leal	-0x3(%rax), %ecx
1459a3ede:     	cmpl	$0x2, %ecx
1459a3ee1:     	ja	0x1459a3ec2 <.text+0x59a2ec2>
1459a3ee3:     	cmpb	$0x3, (%r12)
1459a3ee8:     	jne	0x1459a3ec2 <.text+0x59a2ec2>
1459a3eea:     	cmpb	$0x2, (%r13)
1459a3eef:     	jne	0x1459a3e96 <.text+0x59a2e96>
1459a3ef1:     	movsd	-0x14(%r15), %xmm0
1459a3ef7:     	movsd	(%rbx), %xmm1
1459a3efb:     	subps	%xmm1, %xmm0
1459a3efe:     	mulps	%xmm0, %xmm0
1459a3f01:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1459a3f05:     	addss	%xmm0, %xmm1
1459a3f09:     	xorps	%xmm0, %xmm0
1459a3f0c:     	sqrtss	%xmm1, %xmm0
1459a3f10:     	movss	(%rdi), %xmm1
1459a3f14:     	testl	%eax, %eax
1459a3f16:     	jne	0x1459a3eb9 <.text+0x59a2eb9>
1459a3f18:     	addss	%xmm1, %xmm1
1459a3f1c:     	jmp	0x1459a3eb9 <.text+0x59a2eb9>
1459a3f1e:     	movq	$0x0, (%rsi)
1459a3f25:     	movq	$0x8, 0x8(%rsi)
1459a3f2d:     	movq	$0x0, 0x10(%rsi)
1459a3f35:     	movq	%rsi, %rax
1459a3f38:     	addq	$0x58, %rsp
1459a3f3c:     	popq	%rbx
1459a3f3d:     	popq	%rdi
1459a3f3e:     	popq	%rsi
1459a3f3f:     	popq	%r12
1459a3f41:     	popq	%r13
1459a3f43:     	popq	%r14
1459a3f45:     	popq	%r15
1459a3f47:     	popq	%rbp
1459a3f48:     	retq
1459a3f49:     	movq	%r15, (%rdx)
1459a3f4c:     	movq	-0x20(%r15), %rax
1459a3f50:     	movq	%rax, -0x20(%rbp)
1459a3f54:     	callq	0x140002200 <.text+0x1200>
1459a3f59:     	movl	$0x20, %ecx
1459a3f5e:     	movl	$0x8, %edx
1459a3f63:     	callq	0x1400021c0 <.text+0x11c0>
1459a3f68:     	testq	%rax, %rax
1459a3f6b:     	je	0x1459a409d <.text+0x59a309d>
1459a3f71:     	movq	-0x20(%rbp), %rcx
1459a3f75:     	movq	%rcx, (%rax)
1459a3f78:     	movq	$0x4, -0x18(%rbp)
1459a3f80:     	movq	%rax, -0x10(%rbp)
1459a3f84:     	movq	$0x1, -0x8(%rbp)
1459a3f8c:     	cmpq	%r14, %r15
1459a3f8f:     	je	0x1459a4081 <.text+0x59a3081>
1459a3f95:     	movl	$0x1, %edx
1459a3f9a:     	leaq	-0x18(%rbp), %rcx
1459a3f9e:     	addq	$0x48, %r15
1459a3fa2:     	jmp	0x1459a3fd9 <.text+0x59a2fd9>
1459a3fa4:     	movsd	-0x14(%r15), %xmm0
1459a3faa:     	movsd	(%rbx), %xmm1
1459a3fae:     	subps	%xmm1, %xmm0
1459a3fb1:     	mulps	%xmm0, %xmm0
1459a3fb4:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1459a3fb8:     	addss	%xmm0, %xmm1
1459a3fbc:     	xorps	%xmm0, %xmm0
1459a3fbf:     	sqrtss	%xmm1, %xmm0
1459a3fc3:     	movss	(%rdi), %xmm1
1459a3fc7:     	ucomiss	%xmm0, %xmm1
1459a3fca:     	jae	0x1459a4030 <.text+0x59a3030>
1459a3fcc:     	cmpq	%r14, %r15
1459a3fcf:     	leaq	0x48(%r15), %r15
1459a3fd3:     	je	0x1459a4081 <.text+0x59a3081>
1459a3fd9:     	cmpb	$0x0, -0x30(%r15)
1459a3fde:     	jne	0x1459a3fcc <.text+0x59a2fcc>
1459a3fe0:     	movl	-0x28(%r15), %r9d
1459a3fe4:     	cmpl	$0x2, %r9d
1459a3fe8:     	jb	0x1459a3ffb <.text+0x59a2ffb>
1459a3fea:     	leal	-0x3(%r9), %r8d
1459a3fee:     	cmpl	$0x2, %r8d
1459a3ff2:     	ja	0x1459a3fcc <.text+0x59a2fcc>
1459a3ff4:     	cmpb	$0x3, (%r12)
1459a3ff9:     	jne	0x1459a3fcc <.text+0x59a2fcc>
1459a3ffb:     	cmpb	$0x2, (%r13)
1459a4000:     	jne	0x1459a3fa4 <.text+0x59a2fa4>
1459a4002:     	movsd	-0x14(%r15), %xmm0
1459a4008:     	movsd	(%rbx), %xmm1
1459a400c:     	subps	%xmm1, %xmm0
1459a400f:     	mulps	%xmm0, %xmm0
1459a4012:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1459a4016:     	addss	%xmm0, %xmm1
1459a401a:     	xorps	%xmm0, %xmm0
1459a401d:     	sqrtss	%xmm1, %xmm0
1459a4021:     	movss	(%rdi), %xmm1
1459a4025:     	testl	%r9d, %r9d
1459a4028:     	jne	0x1459a3fc7 <.text+0x59a2fc7>
1459a402a:     	addss	%xmm1, %xmm1
1459a402e:     	jmp	0x1459a3fc7 <.text+0x59a2fc7>
1459a4030:     	movq	-0x20(%r15), %r8
1459a4034:     	movq	%r8, -0x20(%rbp)
1459a4038:     	cmpq	-0x18(%rbp), %rdx
1459a403c:     	jne	0x1459a4069 <.text+0x59a3069>
1459a403e:     	movq	$0x8, 0x20(%rsp)
1459a4047:     	movl	$0x1, %r8d
1459a404d:     	movl	$0x8, %r9d
1459a4053:     	movq	%rdx, -0x28(%rbp)
1459a4057:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459a405c:     	nop
1459a405d:     	movq	-0x10(%rbp), %rax
1459a4061:     	movq	-0x28(%rbp), %rdx
1459a4065:     	leaq	-0x18(%rbp), %rcx
1459a4069:     	movq	-0x20(%rbp), %r8
1459a406d:     	movq	%r8, (%rax,%rdx,8)
1459a4071:     	incq	%rdx
1459a4074:     	movq	%rdx, -0x8(%rbp)
1459a4078:     	cmpq	%r14, %r15
1459a407b:     	jne	0x1459a3f9e <.text+0x59a2f9e>
1459a4081:     	movq	-0x8(%rbp), %rax
1459a4085:     	movq	%rax, 0x10(%rsi)
1459a4089:     	movq	-0x18(%rbp), %rax
1459a408d:     	movq	%rax, (%rsi)
1459a4090:     	movq	-0x10(%rbp), %rax
1459a4094:     	movq	%rax, 0x8(%rsi)
1459a4098:     	jmp	0x1459a3f35 <.text+0x59a2f35>
1459a409d:     	movl	$0x8, %ecx
1459a40a2:     	movl	$0x20, %edx
1459a40a7:     	callq	0x145d6944b <.text+0x5d6844b>
1459a40ac:     	ud2

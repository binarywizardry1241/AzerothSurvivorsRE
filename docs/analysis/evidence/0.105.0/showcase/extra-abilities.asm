
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e5d80:     	pushq	%rbp
1458e5d81:     	pushq	%r15
1458e5d83:     	pushq	%r14
1458e5d85:     	pushq	%r13
1458e5d87:     	pushq	%r12
1458e5d89:     	pushq	%rsi
1458e5d8a:     	pushq	%rdi
1458e5d8b:     	pushq	%rbx
1458e5d8c:     	subq	$0x68, %rsp
1458e5d90:     	leaq	0x60(%rsp), %rbp
1458e5d95:     	movq	$-0x2, (%rbp)
1458e5d9d:     	movq	%rcx, -0x40(%rbp)
1458e5da1:     	movq	$0x0, -0x20(%rbp)
1458e5da9:     	movq	$0x8, -0x18(%rbp)
1458e5db1:     	movq	$0x0, -0x10(%rbp)
1458e5db9:     	xorl	%edi, %edi
1458e5dbb:     	leaq	0x158ea9e(%rip), %rcx   # 0x146e74860
1458e5dc2:     	xorl	%edx, %edx
1458e5dc4:     	jmp	0x1458e5def <.text+0x58e4def>
1458e5dc6:     	nopw	%cs:(%rax,%rax)
1458e5dd0:     	movq	-0x38(%rbp), %rdx
1458e5dd4:     	addq	$0xc8, %rdx
1458e5ddb:     	cmpq	$0x708, %rdx            # imm = 0x708
1458e5de2:     	leaq	0x158ea77(%rip), %rcx   # 0x146e74860
1458e5de9:     	je	0x1458e60f9 <.text+0x58e50f9>
1458e5def:     	movq	0x38(%rdx,%rcx), %rax
1458e5df4:     	testq	%rax, %rax
1458e5df7:     	movq	%rdx, -0x38(%rbp)
1458e5dfb:     	je	0x1458e5ef0 <.text+0x58e4ef0>
1458e5e01:     	movq	0x30(%rdx,%rcx), %rcx
1458e5e06:     	imulq	$0x78, %rax, %rax
1458e5e0a:     	addq	%rcx, %rax
1458e5e0d:     	movq	%rax, -0x28(%rbp)
1458e5e11:     	jmp	0x1458e5e32 <.text+0x58e4e32>
1458e5e13:     	nopw	%cs:(%rax,%rax)
1458e5e20:     	movq	-0x30(%rbp), %rcx
1458e5e24:     	addq	$0x78, %rcx
1458e5e28:     	cmpq	-0x28(%rbp), %rcx
1458e5e2c:     	je	0x1458e5ef0 <.text+0x58e4ef0>
1458e5e32:     	movq	0x58(%rcx), %rax
1458e5e36:     	testq	%rax, %rax
1458e5e39:     	movq	%rcx, -0x30(%rbp)
1458e5e3d:     	je	0x1458e5e20 <.text+0x58e4e20>
1458e5e3f:     	movq	0x50(%rcx), %r12
1458e5e43:     	shlq	$0x6, %rax
1458e5e47:     	addq	%r12, %rax
1458e5e4a:     	movq	%rax, -0x8(%rbp)
1458e5e4e:     	jmp	0x1458e5e6d <.text+0x58e4e6d>
1458e5e50:     	movq	%rbx, (%rsi,%r15)
1458e5e54:     	movq	%r14, 0x8(%rsi,%r15)
1458e5e59:     	incq	%rdi
1458e5e5c:     	movq	%rdi, -0x10(%rbp)
1458e5e60:     	movq	-0x8(%rbp), %rax
1458e5e64:     	addq	$0x40, %r12
1458e5e68:     	cmpq	%rax, %r12
1458e5e6b:     	je	0x1458e5e20 <.text+0x58e4e20>
1458e5e6d:     	cmpb	$0x1a, (%r12)
1458e5e72:     	jne	0x1458e5e64 <.text+0x58e4e64>
1458e5e74:     	movq	-0x18(%rbp), %rsi
1458e5e78:     	movq	%rdi, %r15
1458e5e7b:     	shlq	$0x4, %r15
1458e5e7f:     	movq	0x8(%r12), %rbx
1458e5e84:     	movq	0x10(%r12), %r14
1458e5e89:     	testq	%rdi, %rdi
1458e5e8c:     	je	0x1458e5ed0 <.text+0x58e4ed0>
1458e5e8e:     	xorl	%r13d, %r13d
1458e5e91:     	jmp	0x1458e5ea9 <.text+0x58e4ea9>
1458e5e93:     	nopw	%cs:(%rax,%rax)
1458e5ea0:     	addq	$0x10, %r13
1458e5ea4:     	cmpq	%r13, %r15
1458e5ea7:     	je	0x1458e5ed0 <.text+0x58e4ed0>
1458e5ea9:     	cmpq	%r14, 0x8(%rsi,%r13)
1458e5eae:     	jne	0x1458e5ea0 <.text+0x58e4ea0>
1458e5eb0:     	movq	(%rsi,%r13), %rcx
1458e5eb4:     	movq	%rbx, %rdx
1458e5eb7:     	movq	%r14, %r8
1458e5eba:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e5ebf:     	testl	%eax, %eax
1458e5ec1:     	jne	0x1458e5ea0 <.text+0x58e4ea0>
1458e5ec3:     	jmp	0x1458e5e60 <.text+0x58e4e60>
1458e5ec5:     	nopw	%cs:(%rax,%rax)
1458e5ed0:     	cmpq	-0x20(%rbp), %rdi
1458e5ed4:     	jne	0x1458e5e50 <.text+0x58e4e50>
1458e5eda:     	leaq	-0x20(%rbp), %rcx
1458e5ede:     	callq	0x145bcb680 <.text+0x5bca680>
1458e5ee3:     	nop
1458e5ee4:     	movq	-0x18(%rbp), %rsi
1458e5ee8:     	jmp	0x1458e5e50 <.text+0x58e4e50>
1458e5eed:     	nopl	(%rax)
1458e5ef0:     	leaq	0x158e969(%rip), %rcx   # 0x146e74860
1458e5ef7:     	movq	-0x38(%rbp), %rdx
1458e5efb:     	movq	0x78(%rdx,%rcx), %rax
1458e5f00:     	testq	%rax, %rax
1458e5f03:     	je	0x1458e5ff0 <.text+0x58e4ff0>
1458e5f09:     	movq	0x70(%rdx,%rcx), %rcx
1458e5f0e:     	imulq	$0x78, %rax, %rax
1458e5f12:     	addq	%rcx, %rax
1458e5f15:     	movq	%rax, -0x28(%rbp)
1458e5f19:     	jmp	0x1458e5f32 <.text+0x58e4f32>
1458e5f1b:     	nopl	(%rax,%rax)
1458e5f20:     	movq	-0x30(%rbp), %rcx
1458e5f24:     	addq	$0x78, %rcx
1458e5f28:     	cmpq	-0x28(%rbp), %rcx
1458e5f2c:     	je	0x1458e5ff0 <.text+0x58e4ff0>
1458e5f32:     	movq	0x58(%rcx), %rax
1458e5f36:     	testq	%rax, %rax
1458e5f39:     	movq	%rcx, -0x30(%rbp)
1458e5f3d:     	je	0x1458e5f20 <.text+0x58e4f20>
1458e5f3f:     	movq	0x50(%rcx), %r12
1458e5f43:     	shlq	$0x6, %rax
1458e5f47:     	addq	%r12, %rax
1458e5f4a:     	movq	%rax, -0x8(%rbp)
1458e5f4e:     	jmp	0x1458e5f71 <.text+0x58e4f71>
1458e5f50:     	movq	-0x18(%rbp), %rsi
1458e5f54:     	movq	%rbx, (%rsi,%r15)
1458e5f58:     	movq	%r14, 0x8(%rsi,%r15)
1458e5f5d:     	incq	%rdi
1458e5f60:     	movq	%rdi, -0x10(%rbp)
1458e5f64:     	movq	-0x8(%rbp), %rax
1458e5f68:     	addq	$0x40, %r12
1458e5f6c:     	cmpq	%rax, %r12
1458e5f6f:     	je	0x1458e5f20 <.text+0x58e4f20>
1458e5f71:     	cmpb	$0x1a, (%r12)
1458e5f76:     	jne	0x1458e5f68 <.text+0x58e4f68>
1458e5f78:     	movq	-0x18(%rbp), %rsi
1458e5f7c:     	movq	%rdi, %r15
1458e5f7f:     	shlq	$0x4, %r15
1458e5f83:     	movq	0x8(%r12), %rbx
1458e5f88:     	movq	0x10(%r12), %r14
1458e5f8d:     	testq	%rdi, %rdi
1458e5f90:     	je	0x1458e5fd0 <.text+0x58e4fd0>
1458e5f92:     	xorl	%r13d, %r13d
1458e5f95:     	jmp	0x1458e5fa9 <.text+0x58e4fa9>
1458e5f97:     	nopw	(%rax,%rax)
1458e5fa0:     	addq	$0x10, %r13
1458e5fa4:     	cmpq	%r13, %r15
1458e5fa7:     	je	0x1458e5fd0 <.text+0x58e4fd0>
1458e5fa9:     	cmpq	%r14, 0x8(%rsi,%r13)
1458e5fae:     	jne	0x1458e5fa0 <.text+0x58e4fa0>
1458e5fb0:     	movq	(%rsi,%r13), %rcx
1458e5fb4:     	movq	%rbx, %rdx
1458e5fb7:     	movq	%r14, %r8
1458e5fba:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e5fbf:     	testl	%eax, %eax
1458e5fc1:     	jne	0x1458e5fa0 <.text+0x58e4fa0>
1458e5fc3:     	jmp	0x1458e5f64 <.text+0x58e4f64>
1458e5fc5:     	nopw	%cs:(%rax,%rax)
1458e5fd0:     	cmpq	-0x20(%rbp), %rdi
1458e5fd4:     	jne	0x1458e5f54 <.text+0x58e4f54>
1458e5fda:     	leaq	-0x20(%rbp), %rcx
1458e5fde:     	callq	0x145bcb680 <.text+0x5bca680>
1458e5fe3:     	nop
1458e5fe4:     	jmp	0x1458e5f50 <.text+0x58e4f50>
1458e5fe9:     	nopl	(%rax)
1458e5ff0:     	leaq	0x158e869(%rip), %rcx   # 0x146e74860
1458e5ff7:     	movq	-0x38(%rbp), %rdx
1458e5ffb:     	movq	0xb8(%rdx,%rcx), %rax
1458e6003:     	testq	%rax, %rax
1458e6006:     	je	0x1458e5dd0 <.text+0x58e4dd0>
1458e600c:     	movq	0xb0(%rdx,%rcx), %rcx
1458e6014:     	imulq	$0x78, %rax, %rax
1458e6018:     	addq	%rcx, %rax
1458e601b:     	movq	%rax, -0x28(%rbp)
1458e601f:     	jmp	0x1458e6042 <.text+0x58e5042>
1458e6021:     	nopw	%cs:(%rax,%rax)
1458e6030:     	movq	-0x30(%rbp), %rcx
1458e6034:     	addq	$0x78, %rcx
1458e6038:     	cmpq	-0x28(%rbp), %rcx
1458e603c:     	je	0x1458e5dd0 <.text+0x58e4dd0>
1458e6042:     	movq	0x58(%rcx), %rax
1458e6046:     	testq	%rax, %rax
1458e6049:     	movq	%rcx, -0x30(%rbp)
1458e604d:     	je	0x1458e6030 <.text+0x58e5030>
1458e604f:     	movq	0x50(%rcx), %r12
1458e6053:     	shlq	$0x6, %rax
1458e6057:     	addq	%r12, %rax
1458e605a:     	movq	%rax, -0x8(%rbp)
1458e605e:     	jmp	0x1458e6081 <.text+0x58e5081>
1458e6060:     	movq	-0x18(%rbp), %rsi
1458e6064:     	movq	%rbx, (%rsi,%r15)
1458e6068:     	movq	%r14, 0x8(%rsi,%r15)
1458e606d:     	incq	%rdi
1458e6070:     	movq	%rdi, -0x10(%rbp)
1458e6074:     	movq	-0x8(%rbp), %rax
1458e6078:     	addq	$0x40, %r12
1458e607c:     	cmpq	%rax, %r12
1458e607f:     	je	0x1458e6030 <.text+0x58e5030>
1458e6081:     	cmpb	$0x1a, (%r12)
1458e6086:     	jne	0x1458e6078 <.text+0x58e5078>
1458e6088:     	movq	-0x18(%rbp), %rsi
1458e608c:     	movq	%rdi, %r15
1458e608f:     	shlq	$0x4, %r15
1458e6093:     	movq	0x8(%r12), %rbx
1458e6098:     	movq	0x10(%r12), %r14
1458e609d:     	testq	%rdi, %rdi
1458e60a0:     	je	0x1458e60e0 <.text+0x58e50e0>
1458e60a2:     	xorl	%r13d, %r13d
1458e60a5:     	jmp	0x1458e60b9 <.text+0x58e50b9>
1458e60a7:     	nopw	(%rax,%rax)
1458e60b0:     	addq	$0x10, %r13
1458e60b4:     	cmpq	%r13, %r15
1458e60b7:     	je	0x1458e60e0 <.text+0x58e50e0>
1458e60b9:     	cmpq	%r14, 0x8(%rsi,%r13)
1458e60be:     	jne	0x1458e60b0 <.text+0x58e50b0>
1458e60c0:     	movq	(%rsi,%r13), %rcx
1458e60c4:     	movq	%rbx, %rdx
1458e60c7:     	movq	%r14, %r8
1458e60ca:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e60cf:     	testl	%eax, %eax
1458e60d1:     	jne	0x1458e60b0 <.text+0x58e50b0>
1458e60d3:     	jmp	0x1458e6074 <.text+0x58e5074>
1458e60d5:     	nopw	%cs:(%rax,%rax)
1458e60e0:     	cmpq	-0x20(%rbp), %rdi
1458e60e4:     	jne	0x1458e6064 <.text+0x58e5064>
1458e60ea:     	leaq	-0x20(%rbp), %rcx
1458e60ee:     	callq	0x145bcb680 <.text+0x5bca680>
1458e60f3:     	nop
1458e60f4:     	jmp	0x1458e6060 <.text+0x58e5060>
1458e60f9:     	movq	-0x10(%rbp), %rcx
1458e60fd:     	movq	-0x40(%rbp), %rax
1458e6101:     	movq	%rcx, 0x10(%rax)
1458e6105:     	movups	-0x20(%rbp), %xmm0
1458e6109:     	movups	%xmm0, (%rax)
1458e610c:     	addq	$0x68, %rsp
1458e6110:     	popq	%rbx
1458e6111:     	popq	%rdi
1458e6112:     	popq	%rsi
1458e6113:     	popq	%r12
1458e6115:     	popq	%r13
1458e6117:     	popq	%r14
1458e6119:     	popq	%r15
1458e611b:     	popq	%rbp
1458e611c:     	retq

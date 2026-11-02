
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140287d20:     	pushq	%rbp
140287d21:     	pushq	%r15
140287d23:     	pushq	%r14
140287d25:     	pushq	%r13
140287d27:     	pushq	%r12
140287d29:     	pushq	%rsi
140287d2a:     	pushq	%rdi
140287d2b:     	pushq	%rbx
140287d2c:     	subq	$0x5a8, %rsp            # imm = 0x5A8
140287d33:     	leaq	0x80(%rsp), %rbp
140287d3b:     	movq	$-0x2, 0x520(%rbp)
140287d46:     	movq	%r8, %rbx
140287d49:     	movq	%rdx, %rdi
140287d4c:     	movq	%rcx, %rsi
140287d4f:     	cmpq	$-0x1, 0x40(%rdx)
140287d54:     	je	0x140287da7 <.text+0x286da7>
140287d56:     	movq	0x5a0(%rbx), %rax
140287d5d:     	movq	%rax, 0x3a8(%rbp)
140287d64:     	cmpq	%rax, 0x2c0(%rdi)
140287d6b:     	je	0x140287e5f <.text+0x286e5f>
140287d71:     	addq	$0x2c0, %rdi            # imm = 0x2C0
140287d78:     	leaq	0x5b39959(%rip), %rax   # 0x145dc16d8
140287d7f:     	movq	%rax, 0x28(%rsp)
140287d84:     	movq	$0x83, 0x20(%rsp)
140287d8d:     	leaq	0x5b398fc(%rip), %r9    # 0x145dc1690
140287d94:     	leaq	0x3a8(%rbp), %r8
140287d9b:     	xorl	%ecx, %ecx
140287d9d:     	movq	%rdi, %rdx
140287da0:     	callq	0x145d18b6d <.text+0x5d17b6d>
140287da5:     	ud2
140287da7:     	movq	%rbx, %rcx
140287daa:     	callq	0x140029800 <.text+0x28800>
140287daf:     	movq	%rax, 0x518(%rbp)
140287db6:     	movq	%rbx, %rcx
140287db9:     	callq	0x14002a930 <.text+0x29930>
140287dbe:     	movq	%rax, %r15
140287dc1:     	leaq	0x268(%rbp), %rcx
140287dc8:     	movq	%rbx, %rdx
140287dcb:     	callq	0x14038fbb0 <.text+0x38ebb0>
140287dd0:     	nop
140287dd1:     	leaq	0x3a8(%rbp), %rcx
140287dd8:     	movq	%rbx, %rdx
140287ddb:     	callq	0x1403908b0 <.text+0x38f8b0>
140287de0:     	nop
140287de1:     	leaq	0x128(%rbp), %r12
140287de8:     	leaq	0x268(%rbp), %rdx
140287def:     	movl	$0x140, %r8d            # imm = 0x140
140287df5:     	movq	%r12, %rcx
140287df8:     	callq	0x145bc977b <.text+0x5bc877b>
140287dfd:     	leaq	-0x48(%rbp), %r13
140287e01:     	leaq	0x3a8(%rbp), %rdx
140287e08:     	movl	$0x170, %r8d            # imm = 0x170
140287e0e:     	movq	%r13, %rcx
140287e11:     	callq	0x145bc977b <.text+0x5bc877b>
140287e16:     	movq	0x5a0(%rbx), %r14
140287e1d:     	movl	$0x140, %r8d            # imm = 0x140
140287e23:     	movq	%rdi, %rcx
140287e26:     	movq	%r12, %rdx
140287e29:     	callq	0x145bc977b <.text+0x5bc877b>
140287e2e:     	movq	0x518(%rbp), %rax
140287e35:     	movq	%rax, 0x140(%rdi)
140287e3c:     	movq	%r15, 0x148(%rdi)
140287e43:     	leaq	0x150(%rdi), %rcx
140287e4a:     	movl	$0x170, %r8d            # imm = 0x170
140287e50:     	movq	%r13, %rdx
140287e53:     	callq	0x145bc977b <.text+0x5bc877b>
140287e58:     	movq	%r14, 0x2c0(%rdi)
140287e5f:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
140287e64:     	addl	0x5b0(%rbx), %eax
140287e6a:     	leaq	0x2c8(%rdi), %rdx
140287e71:     	movl	%eax, 0x2c8(%rdi)
140287e77:     	movq	$0x10, 0x3c0(%rbp)
140287e82:     	xorps	%xmm0, %xmm0
140287e85:     	movups	%xmm0, 0x3c8(%rbp)
140287e8c:     	movq	$0x10, 0x3d8(%rbp)
140287e97:     	movups	%xmm0, 0x3e0(%rbp)
140287e9e:     	movq	$0x10, 0x3f0(%rbp)
140287ea9:     	movups	%xmm0, 0x3f8(%rbp)
140287eb0:     	movq	$0x10, 0x408(%rbp)
140287ebb:     	movups	%xmm0, 0x410(%rbp)
140287ec2:     	movq	$0x10, 0x420(%rbp)
140287ecd:     	movq	$0x0, 0x3a8(%rbp)
140287ed8:     	movups	%xmm0, 0x428(%rbp)
140287edf:     	movl	$0x0, 0x438(%rbp)
140287ee9:     	movq	$0x8, 0x3b0(%rbp)
140287ef4:     	movq	$0x0, 0x3b8(%rbp)
140287eff:     	leaq	0x3a8(%rbp), %r8
140287f06:     	movq	%rdi, %rcx
140287f09:     	movq	%rbx, %r9
140287f0c:     	callq	0x14001f0f0 <.text+0x1e0f0>
140287f11:     	nop
140287f12:     	leaq	0x3a8(%rbp), %rdx
140287f19:     	movl	$0x98, %r8d
140287f1f:     	movq	%rsi, %rcx
140287f22:     	callq	0x145bc977b <.text+0x5bc877b>
140287f27:     	movq	%rsi, %rax
140287f2a:     	addq	$0x5a8, %rsp            # imm = 0x5A8
140287f31:     	popq	%rbx
140287f32:     	popq	%rdi
140287f33:     	popq	%rsi
140287f34:     	popq	%r12
140287f36:     	popq	%r13
140287f38:     	popq	%r14
140287f3a:     	popq	%r15
140287f3c:     	popq	%rbp
140287f3d:     	retq

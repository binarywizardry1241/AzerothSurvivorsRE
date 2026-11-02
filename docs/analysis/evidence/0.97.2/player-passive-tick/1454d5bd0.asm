
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d5bd0:     	pushq	%rbp
1454d5bd1:     	pushq	%r15
1454d5bd3:     	pushq	%r14
1454d5bd5:     	pushq	%r13
1454d5bd7:     	pushq	%r12
1454d5bd9:     	pushq	%rsi
1454d5bda:     	pushq	%rdi
1454d5bdb:     	pushq	%rbx
1454d5bdc:     	subq	$0x1b8, %rsp            # imm = 0x1B8
1454d5be3:     	leaq	0x80(%rsp), %rbp
1454d5beb:     	movaps	%xmm15, 0x120(%rbp)
1454d5bf3:     	movaps	%xmm14, 0x110(%rbp)
1454d5bfb:     	movaps	%xmm13, 0x100(%rbp)
1454d5c03:     	movaps	%xmm12, 0xf0(%rbp)
1454d5c0b:     	movaps	%xmm11, 0xe0(%rbp)
1454d5c13:     	movaps	%xmm10, 0xd0(%rbp)
1454d5c1b:     	movaps	%xmm9, 0xc0(%rbp)
1454d5c23:     	movaps	%xmm8, 0xb0(%rbp)
1454d5c2b:     	movaps	%xmm7, 0xa0(%rbp)
1454d5c32:     	movaps	%xmm6, 0x90(%rbp)
1454d5c39:     	movq	$-0x2, 0x88(%rbp)
1454d5c44:     	cmpl	$0x5, 0x7d8(%rcx)
1454d5c4b:     	jb	0x1454d6483 <.text+0x54d5483>
1454d5c51:     	movq	%rcx, %rsi
1454d5c54:     	movss	0x8e4(%rcx), %xmm0
1454d5c5c:     	movq	0x730(%rcx), %rcx
1454d5c63:     	movss	0x515665(%rip), %xmm1   # 0x1459eb2d0
1454d5c6b:     	testq	%rcx, %rcx
1454d5c6e:     	je	0x1454d5cbf <.text+0x54d4cbf>
1454d5c70:     	movq	0x728(%rsi), %rax
1454d5c77:     	shlq	$0x3, %rcx
1454d5c7b:     	leaq	(%rcx,%rcx,2), %rdx
1454d5c7f:     	xorl	%ecx, %ecx
1454d5c81:     	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454d5c8b:     	jmp	0x1454d5c99 <.text+0x54d4c99>
1454d5c8d:     	nopl	(%rax)
1454d5c90:     	addq	$0x18, %rcx
1454d5c94:     	cmpq	%rcx, %rdx
1454d5c97:     	je	0x1454d5cbf <.text+0x54d4cbf>
1454d5c99:     	cmpq	$0x9, 0x8(%rax,%rcx)
1454d5c9f:     	jne	0x1454d5c90 <.text+0x54d4c90>
1454d5ca1:     	movq	(%rax,%rcx), %r9
1454d5ca5:     	movq	(%r9), %r10
1454d5ca8:     	xorq	%r8, %r10
1454d5cab:     	movzbl	0x8(%r9), %r9d
1454d5cb0:     	xorq	$0x65, %r9
1454d5cb4:     	orq	%r10, %r9
1454d5cb7:     	jne	0x1454d5c90 <.text+0x54d4c90>
1454d5cb9:     	movss	0x10(%rax,%rcx), %xmm1
1454d5cbf:     	ucomiss	%xmm1, %xmm0
1454d5cc2:     	jb	0x1454d6483 <.text+0x54d5483>
1454d5cc8:     	movq	0x2a0(%rsi), %rcx
1454d5ccf:     	testq	%rcx, %rcx
1454d5cd2:     	je	0x1454d6483 <.text+0x54d5483>
1454d5cd8:     	movq	0x298(%rsi), %rax
1454d5cdf:     	imulq	$0x58, %rcx, %rdx
1454d5ce3:     	xorl	%ecx, %ecx
1454d5ce5:     	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454d5cef:     	jmp	0x1454d5d0d <.text+0x54d4d0d>
1454d5cf1:     	nopw	%cs:(%rax,%rax)
1454d5d00:     	addq	$0x58, %rcx
1454d5d04:     	cmpq	%rcx, %rdx
1454d5d07:     	je	0x1454d6483 <.text+0x54d5483>
1454d5d0d:     	movq	(%rax,%rcx), %r12
1454d5d11:     	cmpq	$0x9, 0x8(%r12)
1454d5d17:     	jne	0x1454d5d00 <.text+0x54d4d00>
1454d5d19:     	movq	(%r12), %r9
1454d5d1d:     	movq	(%r9), %r10
1454d5d20:     	xorq	%r8, %r10
1454d5d23:     	movzbl	0x8(%r9), %r9d
1454d5d28:     	xorq	$0x65, %r9
1454d5d2c:     	orq	%r10, %r9
1454d5d2f:     	jne	0x1454d5d00 <.text+0x54d4d00>
1454d5d31:     	movl	0x8(%rax,%rcx), %r8d
1454d5d36:     	movss	0x14(%rax,%rcx), %xmm0
1454d5d3c:     	movl	0x18(%rax,%rcx), %edx
1454d5d40:     	movl	0x34(%rax,%rcx), %r9d
1454d5d45:     	movl	%r9d, 0xc(%rbp)
1454d5d49:     	movups	0x24(%rax,%rcx), %xmm1
1454d5d4e:     	movups	%xmm1, -0x4(%rbp)
1454d5d52:     	movups	0x38(%rax,%rcx), %xmm1
1454d5d57:     	movups	0x44(%rax,%rcx), %xmm2
1454d5d5c:     	movups	%xmm2, 0x1c(%rbp)
1454d5d60:     	movups	%xmm1, 0x10(%rbp)
1454d5d64:     	movq	%r12, -0x28(%rbp)
1454d5d68:     	movl	%r8d, -0x20(%rbp)
1454d5d6c:     	movss	0x10(%rax,%rcx), %xmm6
1454d5d72:     	movsd	0xc(%rax,%rcx), %xmm1
1454d5d78:     	movsd	%xmm1, -0x1c(%rbp)
1454d5d7d:     	movss	%xmm0, -0x14(%rbp)
1454d5d82:     	movl	%edx, -0x10(%rbp)
1454d5d85:     	movsd	0x1c(%rax,%rcx), %xmm0
1454d5d8b:     	movsd	%xmm0, -0xc(%rbp)
1454d5d90:     	movss	0x458(%rsi), %xmm7
1454d5d98:     	addl	0x48c(%rsi), %edx
1454d5d9e:     	movl	0x54(%r12), %eax
1454d5da3:     	addl	%eax, %edx
1454d5da5:     	addl	0x18(%rbp), %edx
1454d5da8:     	movss	0x45c(%rsi), %xmm8
1454d5db1:     	testl	%eax, %eax
1454d5db3:     	cmovel	%eax, %edx
1454d5db6:     	cmpl	$0x3, %edx
1454d5db9:     	movl	$0x3, %eax
1454d5dbe:     	cmovbl	%edx, %eax
1454d5dc1:     	testl	%edx, %edx
1454d5dc3:     	movl	$0x1, %r14d
1454d5dc9:     	cmovnel	%eax, %r14d
1454d5dcd:     	movq	$0x0, 0x58(%rbp)
1454d5dd5:     	movq	$0x8, 0x60(%rbp)
1454d5ddd:     	movq	$0x0, 0x68(%rbp)
1454d5de5:     	testl	%r14d, %r14d
1454d5de8:     	je	0x1454d60a0 <.text+0x54d50a0>
1454d5dee:     	xorl	%edi, %edi
1454d5df0:     	xorps	%xmm10, %xmm10
1454d5df4:     	movabsq	$0x7fffffffffffffc, %r15 # imm = 0x7FFFFFFFFFFFFFC
1454d5dfe:     	movl	$0x8, %eax
1454d5e03:     	testq	%rdi, %rdi
1454d5e06:     	je	0x1454d5eb3 <.text+0x54d4eb3>
1454d5e0c:     	movq	0x60(%rbp), %r13
1454d5e10:     	leaq	(,%rdi,8), %rbx
1454d5e18:     	callq	0x140002200 <.text+0x1200>
1454d5e1d:     	movl	$0x8, %edx
1454d5e22:     	movq	%rbx, %rcx
1454d5e25:     	callq	0x1400021c0 <.text+0x11c0>
1454d5e2a:     	testq	%rax, %rax
1454d5e2d:     	je	0x1454d64e5 <.text+0x54d54e5>
1454d5e33:     	movl	%edi, %r11d
1454d5e36:     	andl	$0x3, %r11d
1454d5e3a:     	cmpq	$0x4, %rdi
1454d5e3e:     	jae	0x1454d5e44 <.text+0x54d4e44>
1454d5e40:     	xorl	%ecx, %ecx
1454d5e42:     	jmp	0x1454d5e84 <.text+0x54d4e84>
1454d5e44:     	movq	%rdi, %rdx
1454d5e47:     	andq	%r15, %rdx
1454d5e4a:     	movq	%r13, %r8
1454d5e4d:     	xorl	%ecx, %ecx
1454d5e4f:     	nop
1454d5e50:     	movq	(%r8), %r10
1454d5e53:     	movq	%r10, (%rax,%rcx,8)
1454d5e57:     	movq	0x18(%r8), %r10
1454d5e5b:     	movq	%r10, 0x8(%rax,%rcx,8)
1454d5e60:     	movq	0x30(%r8), %r10
1454d5e64:     	movq	%r10, 0x10(%rax,%rcx,8)
1454d5e69:     	movq	0x48(%r8), %r10
1454d5e6d:     	movq	%r10, 0x18(%rax,%rcx,8)
1454d5e72:     	addq	$0x4, %rcx
1454d5e76:     	addq	$0x60, %r8
1454d5e7a:     	cmpq	%rcx, %rdx
1454d5e7d:     	jne	0x1454d5e50 <.text+0x54d4e50>
1454d5e7f:     	testq	%r11, %r11
1454d5e82:     	je	0x1454d5eb3 <.text+0x54d4eb3>
1454d5e84:     	leaq	(%rax,%rcx,8), %rdx
1454d5e88:     	leaq	(%rcx,%rcx,2), %rcx
1454d5e8c:     	leaq	(,%rcx,8), %rcx
1454d5e94:     	addq	%r13, %rcx
1454d5e97:     	xorl	%r8d, %r8d
1454d5e9a:     	nopw	(%rax,%rax)
1454d5ea0:     	movq	(%rcx), %r10
1454d5ea3:     	movq	%r10, (%rdx,%r8,8)
1454d5ea7:     	incq	%r8
1454d5eaa:     	addq	$0x18, %rcx
1454d5eae:     	cmpq	%r8, %r11
1454d5eb1:     	jne	0x1454d5ea0 <.text+0x54d4ea0>
1454d5eb3:     	movss	0x4c(%r12), %xmm1
1454d5eba:     	movq	%rsi, %rcx
1454d5ebd:     	movq	%rax, 0x70(%rbp)
1454d5ec1:     	movq	%rax, %r8
1454d5ec4:     	movq	%rdi, 0x78(%rbp)
1454d5ec8:     	movq	%rdi, %r9
1454d5ecb:     	callq	0x1454d5740 <.text+0x54d4740>
1454d5ed0:     	nop
1454d5ed1:     	cmpq	$0x1, %rax
1454d5ed5:     	movq	0x70(%rbp), %rcx
1454d5ed9:     	jne	0x1454d6010 <.text+0x54d5010>
1454d5edf:     	movq	%rdx, %rbx
1454d5ee2:     	movss	0x8e4(%rsi), %xmm0
1454d5eea:     	movq	0x4c8(%rsi), %rax
1454d5ef1:     	imulq	$0x160, 0x4d0(%rsi), %rdx # imm = 0x160
1454d5efc:     	xorl	%r9d, %r9d
1454d5eff:     	movq	%rax, %r8
1454d5f02:     	nopw	%cs:(%rax,%rax)
1454d5f10:     	cmpq	%r9, %rdx
1454d5f13:     	je	0x1454d6010 <.text+0x54d5010>
1454d5f19:     	addq	$0x160, %r9             # imm = 0x160
1454d5f20:     	cmpq	%rbx, 0x88(%r8)
1454d5f27:     	leaq	0x160(%r8), %r8
1454d5f2e:     	jne	0x1454d5f10 <.text+0x54d4f10>
1454d5f30:     	movss	-0x38(%rax,%r9), %xmm1
1454d5f37:     	ucomiss	%xmm1, %xmm10
1454d5f3b:     	jae	0x1454d5f98 <.text+0x54d4f98>
1454d5f3d:     	subss	-0x3c(%rax,%r9), %xmm0
1454d5f44:     	divss	%xmm1, %xmm0
1454d5f48:     	xorps	%xmm1, %xmm1
1454d5f4b:     	maxss	%xmm0, %xmm1
1454d5f4f:     	movss	0x415529(%rip), %xmm0   # 0x1458eb480
1454d5f57:     	minss	%xmm1, %xmm0
1454d5f5b:     	movsd	-0x54(%rax,%r9), %xmm1
1454d5f62:     	movsd	-0x48(%rax,%r9), %xmm2
1454d5f69:     	subps	%xmm1, %xmm2
1454d5f6c:     	movsldup	%xmm0, %xmm9            # xmm9 = xmm0[0,0,2,2]
1454d5f71:     	mulps	%xmm2, %xmm9
1454d5f75:     	addps	%xmm1, %xmm9
1454d5f79:     	movss	-0x4c(%rax,%r9), %xmm1
1454d5f80:     	movss	-0x40(%rax,%r9), %xmm11
1454d5f87:     	subss	%xmm1, %xmm11
1454d5f8c:     	mulss	%xmm0, %xmm11
1454d5f91:     	addss	%xmm1, %xmm11
1454d5f96:     	jmp	0x1454d5fa6 <.text+0x54d4fa6>
1454d5f98:     	movsd	-0x48(%rax,%r9), %xmm9
1454d5f9f:     	movss	-0x40(%rax,%r9), %xmm11
1454d5fa6:     	movq	0x68(%rbp), %r13
1454d5faa:     	cmpq	0x58(%rbp), %r13
1454d5fae:     	jne	0x1454d5fba <.text+0x54d4fba>
1454d5fb0:     	leaq	0x58(%rbp), %rcx
1454d5fb4:     	callq	0x145757f60 <.text+0x5756f60>
1454d5fb9:     	nop
1454d5fba:     	leaq	0x1(%r13), %rax
1454d5fbe:     	movq	0x60(%rbp), %rcx
1454d5fc2:     	leaq	(,%r13,2), %rdx
1454d5fca:     	addq	%r13, %rdx
1454d5fcd:     	movq	%rbx, (%rcx,%rdx,8)
1454d5fd1:     	movlps	%xmm9, 0x8(%rcx,%rdx,8)
1454d5fd7:     	movss	%xmm11, 0x10(%rcx,%rdx,8)
1454d5fde:     	movq	%rax, 0x68(%rbp)
1454d5fe2:     	movq	0x78(%rbp), %rdx
1454d5fe6:     	testq	%rdx, %rdx
1454d5fe9:     	je	0x1454d6002 <.text+0x54d5002>
1454d5feb:     	shlq	$0x3, %rdx
1454d5fef:     	movl	$0x8, %r8d
1454d5ff5:     	movq	0x70(%rbp), %rcx
1454d5ff9:     	callq	0x1400021d0 <.text+0x11d0>
1454d5ffe:     	movq	0x68(%rbp), %rax
1454d6002:     	movq	%rax, %rdi
1454d6005:     	cmpq	%r14, %rax
1454d6008:     	jb	0x1454d5dfe <.text+0x54d4dfe>
1454d600e:     	jmp	0x1454d602c <.text+0x54d502c>
1454d6010:     	movq	0x78(%rbp), %rdx
1454d6014:     	testq	%rdx, %rdx
1454d6017:     	je	0x1454d6028 <.text+0x54d5028>
1454d6019:     	shlq	$0x3, %rdx
1454d601d:     	movl	$0x8, %r8d
1454d6023:     	callq	0x1400021d0 <.text+0x11d0>
1454d6028:     	movq	0x68(%rbp), %rax
1454d602c:     	testq	%rax, %rax
1454d602f:     	je	0x1454d60a0 <.text+0x54d50a0>
1454d6031:     	movl	$0x0, 0x7d8(%rsi)
1454d603b:     	movb	$0x1, 0x87(%rbp)
1454d6042:     	leaq	-0x28(%rbp), %rdx
1454d6046:     	movq	%rsi, %rcx
1454d6049:     	callq	0x1454d49e0 <.text+0x54d39e0>
1454d604e:     	nop
1454d604f:     	movl	0x40(%r12), %eax
1454d6054:     	cmpl	$0xe15, %eax            # imm = 0xE15
1454d6059:     	jle	0x1454d60b6 <.text+0x54d50b6>
1454d605b:     	cmpl	$0x1b04, %eax           # imm = 0x1B04
1454d6060:     	jle	0x1454d60ef <.text+0x54d50ef>
1454d6066:     	cmpl	$0x2c65, %eax           # imm = 0x2C65
1454d606b:     	jg	0x1454d6161 <.text+0x54d5161>
1454d6071:     	cmpl	$0x1b05, %eax           # imm = 0x1B05
1454d6076:     	je	0x1454d61e0 <.text+0x54d51e0>
1454d607c:     	cmpl	$0x1c65, %eax           # imm = 0x1C65
1454d6081:     	je	0x1454d6153 <.text+0x54d5153>
1454d6087:     	movss	0x4153f0(%rip), %xmm10  # 0x1458eb480
1454d6090:     	cmpl	$0x27c5, %eax           # imm = 0x27C5
1454d6095:     	je	0x1454d61be <.text+0x54d51be>
1454d609b:     	jmp	0x1454d620a <.text+0x54d520a>
1454d60a0:     	movq	0x58(%rbp), %rax
1454d60a4:     	testq	%rax, %rax
1454d60a7:     	je	0x1454d6483 <.text+0x54d5483>
1454d60ad:     	movq	0x60(%rbp), %rcx
1454d60b1:     	jmp	0x1454d6470 <.text+0x54d5470>
1454d60b6:     	cmpl	$0x5e5, %eax            # imm = 0x5E5
1454d60bb:     	jg	0x1454d611d <.text+0x54d511d>
1454d60bd:     	cmpl	$0x84, %eax
1454d60c2:     	jle	0x1454d61ab <.text+0x54d51ab>
1454d60c8:     	cmpl	$0x85, %eax
1454d60cd:     	je	0x1454d6187 <.text+0x54d5187>
1454d60d3:     	cmpl	$0x193, %eax            # imm = 0x193
1454d60d8:     	je	0x1454d6153 <.text+0x54d5153>
1454d60da:     	movss	0x41539d(%rip), %xmm10  # 0x1458eb480
1454d60e3:     	cmpl	$0x2ae, %eax            # imm = 0x2AE
1454d60e8:     	je	0x1454d6153 <.text+0x54d5153>
1454d60ea:     	jmp	0x1454d620a <.text+0x54d520a>
1454d60ef:     	cmpl	$0x1437, %eax           # imm = 0x1437
1454d60f4:     	jle	0x1454d6192 <.text+0x54d5192>
1454d60fa:     	cmpl	$0x1438, %eax           # imm = 0x1438
1454d60ff:     	je	0x1454d6153 <.text+0x54d5153>
1454d6101:     	cmpl	$0x18d1, %eax           # imm = 0x18D1
1454d6106:     	je	0x1454d6187 <.text+0x54d5187>
1454d6108:     	movss	0x41536f(%rip), %xmm10  # 0x1458eb480
1454d6111:     	cmpl	$0x1a85, %eax           # imm = 0x1A85
1454d6116:     	je	0x1454d6187 <.text+0x54d5187>
1454d6118:     	jmp	0x1454d620a <.text+0x54d520a>
1454d611d:     	cmpl	$0xa52, %eax            # imm = 0xA52
1454d6122:     	jle	0x1454d61c9 <.text+0x54d51c9>
1454d6128:     	cmpl	$0xa53, %eax            # imm = 0xA53
1454d612d:     	je	0x1454d61eb <.text+0x54d51eb>
1454d6133:     	cmpl	$0xafc, %eax            # imm = 0xAFC
1454d6138:     	je	0x1454d6153 <.text+0x54d5153>
1454d613a:     	movss	0x41533d(%rip), %xmm10  # 0x1458eb480
1454d6143:     	cmpl	$0xbe4, %eax            # imm = 0xBE4
1454d6148:     	je	0x1454d61e0 <.text+0x54d51e0>
1454d614e:     	jmp	0x1454d620a <.text+0x54d520a>
1454d6153:     	movss	0x422e44(%rip), %xmm10  # 0x1458f8fa0
1454d615c:     	jmp	0x1454d620a <.text+0x54d520a>
1454d6161:     	cmpl	$0x5ed3, %eax           # imm = 0x5ED3
1454d6166:     	je	0x1454d61f6 <.text+0x54d51f6>
1454d616c:     	cmpl	$0x4bea, %eax           # imm = 0x4BEA
1454d6171:     	je	0x1454d61e0 <.text+0x54d51e0>
1454d6173:     	movss	0x415304(%rip), %xmm10  # 0x1458eb480
1454d617c:     	cmpl	$0x2c66, %eax           # imm = 0x2C66
1454d6181:     	jne	0x1454d620a <.text+0x54d520a>
1454d6187:     	movss	0x468104(%rip), %xmm10  # 0x14593e294
1454d6190:     	jmp	0x1454d620a <.text+0x54d520a>
1454d6192:     	cmpl	$0xe16, %eax            # imm = 0xE16
1454d6197:     	je	0x1454d6201 <.text+0x54d5201>
1454d6199:     	movss	0x4152de(%rip), %xmm10  # 0x1458eb480
1454d61a2:     	cmpl	$0x13fc, %eax           # imm = 0x13FC
1454d61a7:     	je	0x1454d61e0 <.text+0x54d51e0>
1454d61a9:     	jmp	0x1454d620a <.text+0x54d520a>
1454d61ab:     	cmpl	$0x4b, %eax
1454d61ae:     	je	0x1454d61e0 <.text+0x54d51e0>
1454d61b0:     	movss	0x4152c7(%rip), %xmm10  # 0x1458eb480
1454d61b9:     	cmpl	$0x74, %eax
1454d61bc:     	jne	0x1454d620a <.text+0x54d520a>
1454d61be:     	movss	0x45da89(%rip), %xmm10  # 0x145933c50
1454d61c7:     	jmp	0x1454d620a <.text+0x54d520a>
1454d61c9:     	cmpl	$0x5e6, %eax            # imm = 0x5E6
1454d61ce:     	je	0x1454d61eb <.text+0x54d51eb>
1454d61d0:     	movss	0x4152a7(%rip), %xmm10  # 0x1458eb480
1454d61d9:     	cmpl	$0x7ba, %eax            # imm = 0x7BA
1454d61de:     	jne	0x1454d620a <.text+0x54d520a>
1454d61e0:     	movss	0x420497(%rip), %xmm10  # 0x1458f6680
1454d61e9:     	jmp	0x1454d620a <.text+0x54d520a>
1454d61eb:     	movss	0x42040c(%rip), %xmm10  # 0x1458f6600
1454d61f4:     	jmp	0x1454d620a <.text+0x54d520a>
1454d61f6:     	movss	0x4f17e9(%rip), %xmm10  # 0x1459c79e8
1454d61ff:     	jmp	0x1454d620a <.text+0x54d520a>
1454d6201:     	movss	0x4f1816(%rip), %xmm10  # 0x1459c7a20
1454d620a:     	movq	0x58(%rbp), %rax
1454d620e:     	movq	%rax, 0x70(%rbp)
1454d6212:     	movq	0x60(%rbp), %rdi
1454d6216:     	movq	0x68(%rbp), %rax
1454d621a:     	leaq	(%rax,%rax,2), %rax
1454d621e:     	leaq	(%rdi,%rax,8), %r13
1454d6222:     	movss	0x10(%rbp), %xmm11
1454d6228:     	mulss	0x24(%rbp), %xmm7
1454d622d:     	movss	0x51518a(%rip), %xmm12  # 0x1459eb3c0
1454d6236:     	movss	0x422b01(%rip), %xmm13  # 0x1458f8d40
1454d623f:     	movq	%rdi, 0x78(%rbp)
1454d6243:     	jmp	0x1454d6280 <.text+0x54d5280>
1454d6245:     	nopw	%cs:(%rax,%rax)
1454d6250:     	addq	$0x18, %rdi
1454d6254:     	movq	0x740(%rsi), %rax
1454d625b:     	leaq	(%r15,%r15,2), %rcx
1454d625f:     	movq	%rbx, (%rax,%rcx,8)
1454d6263:     	movss	%xmm14, 0x8(%rax,%rcx,8)
1454d626a:     	movss	%xmm9, 0xc(%rax,%rcx,8)
1454d6271:     	movb	%r14b, 0x10(%rax,%rcx,8)
1454d6276:     	incq	%r15
1454d6279:     	movq	%r15, 0x748(%rsi)
1454d6280:     	cmpq	%r13, %rdi
1454d6283:     	je	0x1454d6463 <.text+0x54d5463>
1454d6289:     	movq	(%rdi), %rbx
1454d628c:     	movss	0x8(%rdi), %xmm15
1454d6292:     	movss	0xc(%rdi), %xmm14
1454d6298:     	movq	0x3d0(%rsi), %rdx
1454d629f:     	movl	0x40(%r12), %r8d
1454d62a4:     	movq	%rbx, 0x50(%rbp)
1454d62a8:     	movq	%rbx, 0x48(%rbp)
1454d62ac:     	movl	$0x0, 0x40(%rbp)
1454d62b3:     	movl	$0x0, 0x34(%rbp)
1454d62ba:     	leaq	0x34(%rbp), %rax
1454d62be:     	movq	%rax, 0x30(%rsp)
1454d62c3:     	leaq	0x40(%rbp), %rax
1454d62c7:     	movq	%rax, 0x28(%rsp)
1454d62cc:     	movq	$0x1, 0x20(%rsp)
1454d62d5:     	leaq	-0x48(%rbp), %rcx
1454d62d9:     	leaq	0x50(%rbp), %r9
1454d62dd:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454d62e2:     	nop
1454d62e3:     	movq	0x548(%rsi), %r14
1454d62ea:     	cmpq	0x538(%rsi), %r14
1454d62f1:     	jne	0x1454d6300 <.text+0x54d5300>
1454d62f3:     	leaq	0x538(%rsi), %rcx
1454d62fa:     	callq	0x1457580b0 <.text+0x57570b0>
1454d62ff:     	nop
1454d6300:     	movq	0x540(%rsi), %rax
1454d6307:     	movq	%r14, %rcx
1454d630a:     	shlq	$0x5, %rcx
1454d630e:     	movups	-0x48(%rbp), %xmm0
1454d6312:     	movups	-0x38(%rbp), %xmm1
1454d6316:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d631b:     	movups	%xmm0, (%rax,%rcx)
1454d631f:     	incq	%r14
1454d6322:     	movq	%r14, 0x548(%rsi)
1454d6329:     	movq	0x880(%rsi), %rax
1454d6330:     	movq	0x898(%rsi), %rcx
1454d6337:     	leaq	(%rcx,%rax), %rdx
1454d633b:     	rolq	$0x17, %rdx
1454d633f:     	addq	%rax, %rdx
1454d6342:     	movq	0x888(%rsi), %r8
1454d6349:     	movq	%r8, %r9
1454d634c:     	shlq	$0x11, %r9
1454d6350:     	movq	0x890(%rsi), %r10
1454d6357:     	xorq	%rax, %r10
1454d635a:     	xorq	%r8, %rcx
1454d635d:     	xorq	%r10, %r8
1454d6360:     	movq	%r8, 0x888(%rsi)
1454d6367:     	xorq	%rcx, %rax
1454d636a:     	movq	%rax, 0x880(%rsi)
1454d6371:     	xorq	%r9, %r10
1454d6374:     	movq	%r10, 0x890(%rsi)
1454d637b:     	rolq	$0x2d, %rcx
1454d637f:     	movq	%rcx, 0x898(%rsi)
1454d6386:     	shrq	$0x28, %rdx
1454d638a:     	xorps	%xmm1, %xmm1
1454d638d:     	cvtsi2ss	%edx, %xmm1
1454d6391:     	mulss	%xmm12, %xmm1
1454d6396:     	movzbl	0x75(%r12), %eax
1454d639c:     	addb	$-0x2, %al
1454d639e:     	movss	0x4150da(%rip), %xmm0   # 0x1458eb480
1454d63a6:     	cmpb	$0x6, %al
1454d63a8:     	ja	0x1454d63b9 <.text+0x54d53b9>
1454d63aa:     	movzbl	%al, %eax
1454d63ad:     	leaq	0x14d66e8(%rip), %rcx   # 0x1469aca9c
1454d63b4:     	movss	(%rcx,%rax,4), %xmm0
1454d63b9:     	movss	0x464(%rsi), %xmm2
1454d63c1:     	ucomiss	%xmm1, %xmm2
1454d63c4:     	movss	0x44(%r12), %xmm9
1454d63cb:     	seta	%r14b
1454d63cf:     	xorps	%xmm1, %xmm1
1454d63d2:     	cmpltss	%xmm9, %xmm1
1454d63d8:     	andps	%xmm7, %xmm1
1454d63db:     	mulss	%xmm13, %xmm9
1454d63e0:     	mulss	%xmm6, %xmm9
1454d63e5:     	mulss	%xmm11, %xmm9
1454d63ea:     	mulss	%xmm0, %xmm9
1454d63ef:     	addss	%xmm1, %xmm9
1454d63f4:     	mulss	%xmm8, %xmm9
1454d63f9:     	jbe	0x1454d6404 <.text+0x54d5404>
1454d63fb:     	mulss	0x468(%rsi), %xmm9
1454d6404:     	movss	0x3e8(%rsi), %xmm0
1454d640c:     	subss	%xmm15, %xmm0
1454d6411:     	movss	0x3ec(%rsi), %xmm1
1454d6419:     	subss	%xmm14, %xmm1
1454d641e:     	mulss	%xmm0, %xmm0
1454d6422:     	mulss	%xmm1, %xmm1
1454d6426:     	addss	%xmm0, %xmm1
1454d642a:     	sqrtss	%xmm1, %xmm14
1454d642f:     	divss	%xmm10, %xmm14
1454d6434:     	addss	0x8e4(%rsi), %xmm14
1454d643d:     	movq	0x748(%rsi), %r15
1454d6444:     	cmpq	0x738(%rsi), %r15
1454d644b:     	jne	0x1454d6250 <.text+0x54d5250>
1454d6451:     	leaq	0x738(%rsi), %rcx
1454d6458:     	callq	0x145757f60 <.text+0x5756f60>
1454d645d:     	nop
1454d645e:     	jmp	0x1454d6250 <.text+0x54d5250>
1454d6463:     	movq	0x70(%rbp), %rax
1454d6467:     	testq	%rax, %rax
1454d646a:     	movq	0x78(%rbp), %rcx
1454d646e:     	je	0x1454d6483 <.text+0x54d5483>
1454d6470:     	shlq	$0x3, %rax
1454d6474:     	leaq	(%rax,%rax,2), %rdx
1454d6478:     	movl	$0x8, %r8d
1454d647e:     	callq	0x1400021d0 <.text+0x11d0>
1454d6483:     	movaps	0x90(%rbp), %xmm6
1454d648a:     	movaps	0xa0(%rbp), %xmm7
1454d6491:     	movaps	0xb0(%rbp), %xmm8
1454d6499:     	movaps	0xc0(%rbp), %xmm9
1454d64a1:     	movaps	0xd0(%rbp), %xmm10
1454d64a9:     	movaps	0xe0(%rbp), %xmm11
1454d64b1:     	movaps	0xf0(%rbp), %xmm12
1454d64b9:     	movaps	0x100(%rbp), %xmm13
1454d64c1:     	movaps	0x110(%rbp), %xmm14
1454d64c9:     	movaps	0x120(%rbp), %xmm15
1454d64d1:     	addq	$0x1b8, %rsp            # imm = 0x1B8
1454d64d8:     	popq	%rbx
1454d64d9:     	popq	%rdi
1454d64da:     	popq	%rsi
1454d64db:     	popq	%r12
1454d64dd:     	popq	%r13
1454d64df:     	popq	%r14
1454d64e1:     	popq	%r15
1454d64e3:     	popq	%rbp
1454d64e4:     	retq
1454d64e5:     	movb	$0x1, 0x87(%rbp)
1454d64ec:     	movl	$0x8, %ecx
1454d64f1:     	movq	%rbx, %rdx
1454d64f4:     	callq	0x1458e721b <.text+0x58e621b>
1454d64f9:     	nop
1454d64fa:     	ud2

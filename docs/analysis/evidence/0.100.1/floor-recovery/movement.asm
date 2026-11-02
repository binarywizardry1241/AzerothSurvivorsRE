
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a5cb0:     	pushq	%rbp
1454a5cb1:     	pushq	%r15
1454a5cb3:     	pushq	%r14
1454a5cb5:     	pushq	%r13
1454a5cb7:     	pushq	%r12
1454a5cb9:     	pushq	%rsi
1454a5cba:     	pushq	%rdi
1454a5cbb:     	pushq	%rbx
1454a5cbc:     	subq	$0x148, %rsp            # imm = 0x148
1454a5cc3:     	leaq	0x80(%rsp), %rbp
1454a5ccb:     	movaps	%xmm13, 0xb0(%rbp)
1454a5cd3:     	movaps	%xmm12, 0xa0(%rbp)
1454a5cdb:     	movaps	%xmm11, 0x90(%rbp)
1454a5ce3:     	movaps	%xmm10, 0x80(%rbp)
1454a5ceb:     	movaps	%xmm9, 0x70(%rbp)
1454a5cf0:     	movaps	%xmm8, 0x60(%rbp)
1454a5cf5:     	movaps	%xmm7, 0x50(%rbp)
1454a5cf9:     	movaps	%xmm6, 0x40(%rbp)
1454a5cfd:     	movq	$-0x2, 0x38(%rbp)
1454a5d05:     	movaps	%xmm2, %xmm6
1454a5d08:     	movq	%rdx, %rdi
1454a5d0b:     	movq	%rcx, %rsi
1454a5d0e:     	movss	(%rdx), %xmm9
1454a5d13:     	cmpb	$0x0, 0x8f8(%rcx)
1454a5d1a:     	je	0x1454a5d61 <.text+0x54a4d61>
1454a5d1c:     	movss	0x4(%rdi), %xmm10
1454a5d22:     	movsd	0x8fc(%rsi), %xmm0
1454a5d2a:     	movaps	%xmm9, %xmm1
1454a5d2e:     	unpcklps	%xmm10, %xmm1           # xmm1 = xmm1[0],xmm10[0],xmm1[1],xmm10[1]
1454a5d32:     	subps	%xmm1, %xmm0
1454a5d35:     	mulps	%xmm0, %xmm0
1454a5d38:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a5d3c:     	addss	%xmm0, %xmm1
1454a5d40:     	ucomiss	0x499a79(%rip), %xmm1   # 0x14593f7c0
1454a5d47:     	jbe	0x1454a5d69 <.text+0x54a4d69>
1454a5d49:     	movzbl	0x908(%rsi), %eax
1454a5d50:     	testb	%al, %al
1454a5d52:     	je	0x1454a5d69 <.text+0x54a4d69>
1454a5d54:     	decb	%al
1454a5d56:     	movb	%al, 0x908(%rsi)
1454a5d5c:     	jmp	0x1454a6811 <.text+0x54a5811>
1454a5d61:     	movss	0x4(%rdi), %xmm10
1454a5d67:     	jmp	0x1454a5d73 <.text+0x54a4d73>
1454a5d69:     	movl	$0x0, 0x8f8(%rsi)
1454a5d73:     	movq	0x228(%rsi), %rcx
1454a5d7a:     	movq	0x230(%rsi), %rdx
1454a5d81:     	callq	0x145420480 <.text+0x541f480>
1454a5d86:     	imulq	$0xf0, %rax, %rbx
1454a5d8d:     	leaq	0x128d784(%rip), %r15   # 0x146733518
1454a5d94:     	movq	0x898(%rsi), %r14
1454a5d9b:     	leaq	0x10(%r14), %rcx
1454a5d9f:     	movsd	0xc8(%rbx,%r15), %xmm8
1454a5da9:     	movshdup	%xmm8, %xmm11           # xmm11 = xmm8[1,1,3,3]
1454a5dae:     	movaps	%xmm8, %xmm1
1454a5db2:     	movaps	%xmm11, %xmm2
1454a5db6:     	callq	0x14552a140 <.text+0x5529140>
1454a5dbb:     	testb	$0x1, %al
1454a5dbd:     	je	0x1454a5dc4 <.text+0x54a4dc4>
1454a5dbf:     	movaps	%xmm0, %xmm7
1454a5dc2:     	jmp	0x1454a5df6 <.text+0x54a4df6>
1454a5dc4:     	cmpq	$-0x1, 0x68(%r14)
1454a5dc9:     	je	0x1454a5ded <.text+0x54a4ded>
1454a5dcb:     	leaq	0x68(%r14), %rdx
1454a5dcf:     	leaq	-0x40(%rbp), %rcx
1454a5dd3:     	movaps	%xmm8, %xmm2
1454a5dd7:     	movaps	%xmm11, %xmm3
1454a5ddb:     	callq	0x14552d220 <.text+0x552c220>
1454a5de0:     	cmpl	$0x1, -0x40(%rbp)
1454a5de4:     	jne	0x1454a5ded <.text+0x54a4ded>
1454a5de6:     	movss	-0x34(%rbp), %xmm7
1454a5deb:     	jmp	0x1454a5df6 <.text+0x54a4df6>
1454a5ded:     	movss	0xb8(%r14), %xmm7
1454a5df6:     	movq	0x228(%rsi), %rcx
1454a5dfd:     	movq	0x230(%rsi), %rdx
1454a5e04:     	callq	0x145420480 <.text+0x541f480>
1454a5e09:     	imulq	$0xf0, %rax, %rcx
1454a5e10:     	leaq	(%r15,%rcx), %r14
1454a5e14:     	movq	0x60(%rcx,%r15), %rdx
1454a5e19:     	cmpq	$0x2, %rax
1454a5e1d:     	je	0x1454a5e28 <.text+0x54a4e28>
1454a5e1f:     	cmpl	$0x7, %eax
1454a5e22:     	jne	0x1454a5eb8 <.text+0x54a4eb8>
1454a5e28:     	movq	0x58(%r14), %r8
1454a5e2c:     	leaq	-0x1(%rdx), %rcx
1454a5e30:     	xorl	%eax, %eax
1454a5e32:     	xorl	%r9d, %r9d
1454a5e35:     	jmp	0x1454a5e4b <.text+0x54a4e4b>
1454a5e37:     	nopw	(%rax,%rax)
1454a5e40:     	movq	%r9, %rcx
1454a5e43:     	incq	%r9
1454a5e46:     	cmpq	%r9, %rdx
1454a5e49:     	je	0x1454a5eb4 <.text+0x54a4eb4>
1454a5e4b:     	cmpq	%rdx, %rcx
1454a5e4e:     	jae	0x1454a68b0 <.text+0x54a58b0>
1454a5e54:     	movss	0x4(%r8,%r9,8), %xmm1
1454a5e5b:     	movss	0x4(%r8,%rcx,8), %xmm0
1454a5e62:     	movaps	%xmm10, %xmm2
1454a5e66:     	cmpltss	%xmm1, %xmm2
1454a5e6b:     	movaps	%xmm10, %xmm3
1454a5e6f:     	cmpltss	%xmm0, %xmm3
1454a5e74:     	xorps	%xmm2, %xmm3
1454a5e77:     	movd	%xmm3, %r10d
1454a5e7c:     	testb	$0x1, %r10b
1454a5e80:     	je	0x1454a5e40 <.text+0x54a4e40>
1454a5e82:     	movss	(%r8,%r9,8), %xmm2
1454a5e88:     	movss	(%r8,%rcx,8), %xmm3
1454a5e8e:     	subss	%xmm2, %xmm3
1454a5e92:     	movaps	%xmm10, %xmm4
1454a5e96:     	subss	%xmm1, %xmm4
1454a5e9a:     	mulss	%xmm3, %xmm4
1454a5e9e:     	subss	%xmm1, %xmm0
1454a5ea2:     	divss	%xmm0, %xmm4
1454a5ea6:     	addss	%xmm2, %xmm4
1454a5eaa:     	ucomiss	%xmm9, %xmm4
1454a5eae:     	jbe	0x1454a5e40 <.text+0x54a4e40>
1454a5eb0:     	xorb	$0x1, %al
1454a5eb2:     	jmp	0x1454a5e40 <.text+0x54a4e40>
1454a5eb4:     	xorb	$0x1, %al
1454a5eb6:     	jmp	0x1454a5eee <.text+0x54a4eee>
1454a5eb8:     	movaps	%xmm9, %xmm0
1454a5ebc:     	subss	0xc8(%r14), %xmm0
1454a5ec5:     	movaps	%xmm10, %xmm1
1454a5ec9:     	subss	0xcc(%r14), %xmm1
1454a5ed2:     	callq	0x145773277 <.text+0x5772277>
1454a5ed7:     	movss	0xd8(%r14), %xmm1
1454a5ee0:     	addss	0x46f918(%rip), %xmm1   # 0x145915800
1454a5ee8:     	ucomiss	%xmm1, %xmm0
1454a5eeb:     	seta	%al
1454a5eee:     	addq	%r15, %rbx
1454a5ef1:     	andb	$0x1, %al
1454a5ef3:     	movb	%al, 0x37(%rbp)
1454a5ef6:     	movzbl	0xec(%rbx), %r14d
1454a5efe:     	testb	%r14b, %r14b
1454a5f01:     	je	0x1454a5f6e <.text+0x54a4f6e>
1454a5f03:     	movq	0x898(%rsi), %rdx
1454a5f0a:     	cmpq	$-0x1, 0x68(%rdx)
1454a5f0f:     	je	0x1454a6041 <.text+0x54a5041>
1454a5f15:     	addq	$0x68, %rdx
1454a5f19:     	leaq	-0x40(%rbp), %rcx
1454a5f1d:     	movaps	%xmm9, %xmm2
1454a5f21:     	movaps	%xmm10, %xmm3
1454a5f25:     	callq	0x14552d220 <.text+0x552c220>
1454a5f2a:     	movzbl	-0x40(%rbp), %r12d
1454a5f2f:     	movss	-0x34(%rbp), %xmm12
1454a5f35:     	movq	0x898(%rsi), %rcx
1454a5f3c:     	addss	0x499cdb(%rip), %xmm12  # 0x14593fc20
1454a5f45:     	cmpq	$-0x1, 0x68(%rcx)
1454a5f4a:     	je	0x1454a6055 <.text+0x54a5055>
1454a5f50:     	addq	$0x68, %rcx
1454a5f54:     	movaps	%xmm9, %xmm1
1454a5f58:     	movaps	%xmm10, %xmm2
1454a5f5c:     	callq	0x14552b4e0 <.text+0x552a4e0>
1454a5f61:     	addss	0x461597(%rip), %xmm0   # 0x145907500
1454a5f69:     	jmp	0x1454a605f <.text+0x54a505f>
1454a5f6e:     	movss	0x46151d(%rip), %xmm12  # 0x145907494
1454a5f77:     	xorl	%r12d, %r12d
1454a5f7a:     	xorl	%ebx, %ebx
1454a5f7c:     	cmpl	$0x0, 0x890(%rsi)
1454a5f83:     	je	0x1454a6075 <.text+0x54a5075>
1454a5f89:     	leaq	0x4(%rdi), %r13
1454a5f8d:     	movq	0x898(%rsi), %rcx
1454a5f94:     	cmpq	$-0x1, 0x68(%rcx)
1454a5f99:     	je	0x1454a5fae <.text+0x54a4fae>
1454a5f9b:     	addq	$0x68, %rcx
1454a5f9f:     	movaps	%xmm9, %xmm1
1454a5fa3:     	movaps	%xmm10, %xmm2
1454a5fa7:     	callq	0x14552b4e0 <.text+0x552a4e0>
1454a5fac:     	jmp	0x1454a5fb0 <.text+0x54a4fb0>
1454a5fae:     	xorl	%eax, %eax
1454a5fb0:     	movl	%eax, 0x20(%rbp)
1454a5fb3:     	movss	%xmm0, 0x24(%rbp)
1454a5fb8:     	leaq	0x934(%rsi), %rax
1454a5fbf:     	leaq	0x8(%rdi), %rcx
1454a5fc3:     	leaq	0x990(%rsi), %rdx
1454a5fca:     	movq	%rax, -0x40(%rbp)
1454a5fce:     	leaq	0x29371b(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1454a5fd5:     	movq	%rax, -0x38(%rbp)
1454a5fd9:     	movq	%rdi, -0x30(%rbp)
1454a5fdd:     	movq	%rax, -0x28(%rbp)
1454a5fe1:     	movq	%r13, -0x20(%rbp)
1454a5fe5:     	movq	%rax, -0x18(%rbp)
1454a5fe9:     	movq	%rcx, -0x10(%rbp)
1454a5fed:     	movq	%rax, -0x8(%rbp)
1454a5ff1:     	leaq	0x20(%rbp), %rax
1454a5ff5:     	movq	%rax, (%rbp)
1454a5ff9:     	leaq	0x5cc50(%rip), %rax     # 0x145502c50 <.text+0x5501c50>
1454a6000:     	movq	%rax, 0x8(%rbp)
1454a6004:     	movq	%rdx, 0x10(%rbp)
1454a6008:     	leaq	0x296291(%rip), %rax    # 0x14573c2a0 <.text+0x573b2a0>
1454a600f:     	movq	%rax, 0x18(%rbp)
1454a6013:     	leaq	0x155049a(%rip), %rcx   # 0x1469f64b4
1454a601a:     	leaq	-0x40(%rbp), %rdx
1454a601e:     	callq	0x145711f90 <.text+0x5710f90>
1454a6023:     	testb	%bl, %bl
1454a6025:     	jne	0x1454a6079 <.text+0x54a5079>
1454a6027:     	movl	$0x0, 0x880(%rsi)
1454a6031:     	xorl	%eax, %eax
1454a6033:     	movb	%al, 0x36(%rbp)
1454a6036:     	testb	%r14b, %r14b
1454a6039:     	je	0x1454a60fd <.text+0x54a50fd>
1454a603f:     	jmp	0x1454a60bf <.text+0x54a50bf>
1454a6041:     	movss	0x46144a(%rip), %xmm12  # 0x145907494
1454a604a:     	xorl	%r12d, %r12d
1454a604d:     	movaps	%xmm12, %xmm0
1454a6051:     	xorl	%eax, %eax
1454a6053:     	jmp	0x1454a605f <.text+0x54a505f>
1454a6055:     	xorl	%eax, %eax
1454a6057:     	movss	0x461435(%rip), %xmm0   # 0x145907494
1454a605f:     	ucomiss	0x8(%rdi), %xmm0
1454a6063:     	seta	%bl
1454a6066:     	andb	%al, %bl
1454a6068:     	cmpl	$0x0, 0x890(%rsi)
1454a606f:     	jne	0x1454a5f89 <.text+0x54a4f89>
1454a6075:     	testb	%bl, %bl
1454a6077:     	je	0x1454a6027 <.text+0x54a5027>
1454a6079:     	movss	0x934(%rsi), %xmm0
1454a6081:     	cmpl	$0x1, 0x880(%rsi)
1454a6088:     	jne	0x1454a6094 <.text+0x54a5094>
1454a608a:     	movss	0x884(%rsi), %xmm1
1454a6092:     	jmp	0x1454a60a9 <.text+0x54a50a9>
1454a6094:     	movl	$0x1, 0x880(%rsi)
1454a609e:     	movss	%xmm0, 0x884(%rsi)
1454a60a6:     	movaps	%xmm0, %xmm1
1454a60a9:     	subss	%xmm1, %xmm0
1454a60ad:     	ucomiss	0x46f87c(%rip), %xmm0   # 0x145915930
1454a60b4:     	setae	%al
1454a60b7:     	movb	%al, 0x36(%rbp)
1454a60ba:     	testb	%r14b, %r14b
1454a60bd:     	je	0x1454a60fd <.text+0x54a50fd>
1454a60bf:     	movq	0x898(%rsi), %rcx
1454a60c6:     	cmpq	$-0x1, 0x40(%rcx)
1454a60cb:     	je	0x1454a60fd <.text+0x54a50fd>
1454a60cd:     	addq	$0x40, %rcx
1454a60d1:     	movaps	%xmm9, %xmm1
1454a60d5:     	movaps	%xmm10, %xmm2
1454a60d9:     	callq	0x1455257a0 <.text+0x55247a0>
1454a60de:     	testb	%al, %al
1454a60e0:     	je	0x1454a60fd <.text+0x54a50fd>
1454a60e2:     	movss	0x934(%rsi), %xmm0
1454a60ea:     	cmpl	$0x1, 0x888(%rsi)
1454a60f1:     	jne	0x1454a6146 <.text+0x54a5146>
1454a60f3:     	movss	0x88c(%rsi), %xmm1
1454a60fb:     	jmp	0x1454a615b <.text+0x54a515b>
1454a60fd:     	movl	$0x0, 0x888(%rsi)
1454a6107:     	xorl	%eax, %eax
1454a6109:     	movb	%al, 0x34(%rbp)
1454a610c:     	testb	%r14b, %r14b
1454a610f:     	je	0x1454a6171 <.text+0x54a5171>
1454a6111:     	cmpb	$0x1, 0x9b9(%rsi)
1454a6118:     	jne	0x1454a6171 <.text+0x54a5171>
1454a611a:     	movl	0x990(%rsi), %eax
1454a6120:     	testb	$0xf, %al
1454a6122:     	je	0x1454a6171 <.text+0x54a5171>
1454a6124:     	testl	$0x1000, %eax           # imm = 0x1000
1454a6129:     	jne	0x1454a6171 <.text+0x54a5171>
1454a612b:     	cmpl	$0x1, 0x90c(%rsi)
1454a6132:     	jne	0x1454a6290 <.text+0x54a5290>
1454a6138:     	movss	0x910(%rsi), %xmm11
1454a6141:     	jmp	0x1454a62bf <.text+0x54a52bf>
1454a6146:     	movl	$0x1, 0x888(%rsi)
1454a6150:     	movss	%xmm0, 0x88c(%rsi)
1454a6158:     	movaps	%xmm0, %xmm1
1454a615b:     	subss	%xmm1, %xmm0
1454a615f:     	ucomiss	0x46132a(%rip), %xmm0   # 0x145907490
1454a6166:     	setae	%al
1454a6169:     	movb	%al, 0x34(%rbp)
1454a616c:     	testb	%r14b, %r14b
1454a616f:     	jne	0x1454a6111 <.text+0x54a5111>
1454a6171:     	movl	$0x0, 0x90c(%rsi)
1454a617b:     	xorl	%eax, %eax
1454a617d:     	movb	%al, 0x35(%rbp)
1454a6180:     	movq	0x898(%rsi), %rcx
1454a6187:     	addq	$0x10, %rcx
1454a618b:     	movaps	%xmm9, %xmm1
1454a618f:     	movaps	%xmm10, %xmm2
1454a6193:     	callq	0x14552a140 <.text+0x5529140>
1454a6198:     	movl	%eax, %ebx
1454a619a:     	movaps	%xmm0, %xmm11
1454a619e:     	testb	%r14b, %r14b
1454a61a1:     	jne	0x1454a61f3 <.text+0x54a51f3>
1454a61a3:     	cmpl	$0x1, %ebx
1454a61a6:     	je	0x1454a61f3 <.text+0x54a51f3>
1454a61a8:     	movq	0x898(%rsi), %rcx
1454a61af:     	addq	$0x10, %rcx
1454a61b3:     	movss	0x461355(%rip), %xmm3   # 0x145907510
1454a61bb:     	movaps	%xmm9, %xmm1
1454a61bf:     	movaps	%xmm10, %xmm2
1454a61c3:     	callq	0x1455266f0 <.text+0x55256f0>
1454a61c8:     	cmpb	$0x0, 0x36(%rbp)
1454a61cc:     	jne	0x1454a636c <.text+0x54a536c>
1454a61d2:     	cmpb	$0x0, 0x34(%rbp)
1454a61d6:     	jne	0x1454a636c <.text+0x54a536c>
1454a61dc:     	cmpb	$0x0, 0x35(%rbp)
1454a61e0:     	jne	0x1454a636c <.text+0x54a536c>
1454a61e6:     	testb	$0x1, %bl
1454a61e9:     	je	0x1454a626a <.text+0x54a526a>
1454a61eb:     	movss	0x8(%rdi), %xmm13
1454a61f1:     	jmp	0x1454a6240 <.text+0x54a5240>
1454a61f3:     	cmpb	$0x0, 0x36(%rbp)
1454a61f7:     	jne	0x1454a636c <.text+0x54a536c>
1454a61fd:     	cmpb	$0x0, 0x34(%rbp)
1454a6201:     	jne	0x1454a636c <.text+0x54a536c>
1454a6207:     	cmpb	$0x0, 0x35(%rbp)
1454a620b:     	jne	0x1454a636c <.text+0x54a536c>
1454a6211:     	testb	$0x1, %bl
1454a6214:     	je	0x1454a625f <.text+0x54a525f>
1454a6216:     	movss	0x8(%rdi), %xmm13
1454a621c:     	testb	%r14b, %r14b
1454a621f:     	je	0x1454a6240 <.text+0x54a5240>
1454a6221:     	addss	0x4999f6(%rip), %xmm11  # 0x14593fc20
1454a622a:     	ucomiss	%xmm13, %xmm11
1454a622e:     	seta	%al
1454a6231:     	cmpb	$0x0, 0x37(%rbp)
1454a6235:     	je	0x1454a635e <.text+0x54a535e>
1454a623b:     	jmp	0x1454a636c <.text+0x54a536c>
1454a6240:     	addss	0x499687(%rip), %xmm11  # 0x14593f8d0
1454a6249:     	ucomiss	%xmm13, %xmm11
1454a624d:     	seta	%al
1454a6250:     	cmpb	$0x0, 0x37(%rbp)
1454a6254:     	je	0x1454a635e <.text+0x54a535e>
1454a625a:     	jmp	0x1454a636c <.text+0x54a536c>
1454a625f:     	testb	$0x1, %r12b
1454a6263:     	jne	0x1454a6274 <.text+0x54a5274>
1454a6265:     	jmp	0x1454a633f <.text+0x54a533f>
1454a626a:     	testb	$0x1, %r12b
1454a626e:     	je	0x1454a632b <.text+0x54a532b>
1454a6274:     	movss	0x8(%rdi), %xmm13
1454a627a:     	ucomiss	%xmm13, %xmm12
1454a627e:     	seta	%al
1454a6281:     	cmpb	$0x0, 0x37(%rbp)
1454a6285:     	je	0x1454a635e <.text+0x54a535e>
1454a628b:     	jmp	0x1454a636c <.text+0x54a536c>
1454a6290:     	movss	0x934(%rsi), %xmm11
1454a6299:     	movl	$0x1, 0x90c(%rsi)
1454a62a3:     	movss	%xmm11, 0x910(%rsi)
1454a62ac:     	movq	(%rdi), %rax
1454a62af:     	movq	%rax, 0x914(%rsi)
1454a62b6:     	movl	0x8(%rdi), %eax
1454a62b9:     	movl	%eax, 0x91c(%rsi)
1454a62bf:     	movaps	%xmm9, %xmm0
1454a62c3:     	subss	0x914(%rsi), %xmm0
1454a62cb:     	movaps	%xmm10, %xmm1
1454a62cf:     	subss	0x918(%rsi), %xmm1
1454a62d7:     	callq	0x145773277 <.text+0x5772277>
1454a62dc:     	ucomiss	0x46f64d(%rip), %xmm0   # 0x145915930
1454a62e3:     	movss	0x934(%rsi), %xmm0
1454a62eb:     	jbe	0x1454a6317 <.text+0x54a5317>
1454a62ed:     	leaq	0x914(%rsi), %rax
1454a62f4:     	movl	$0x1, 0x90c(%rsi)
1454a62fe:     	movss	%xmm0, 0x910(%rsi)
1454a6306:     	movl	0x8(%rdi), %ecx
1454a6309:     	movl	%ecx, 0x8(%rax)
1454a630c:     	movq	(%rdi), %rcx
1454a630f:     	movq	%rcx, (%rax)
1454a6312:     	jmp	0x1454a617b <.text+0x54a517b>
1454a6317:     	subss	%xmm11, %xmm0
1454a631c:     	ucomiss	0x4a50b5(%rip), %xmm0   # 0x14594b3d8
1454a6323:     	setae	%al
1454a6326:     	jmp	0x1454a617d <.text+0x54a517d>
1454a632b:     	testb	$0x1, %al
1454a632d:     	je	0x1454a633f <.text+0x54a533f>
1454a632f:     	movss	0x8(%rdi), %xmm13
1454a6335:     	addss	0x499593(%rip), %xmm0   # 0x14593f8d0
1454a633d:     	jmp	0x1454a6351 <.text+0x54a5351>
1454a633f:     	movss	0x8(%rdi), %xmm13
1454a6345:     	movss	0x154f8fb(%rip), %xmm0  # 0x1469f5c48
1454a634d:     	addss	%xmm7, %xmm0
1454a6351:     	ucomiss	%xmm13, %xmm0
1454a6355:     	seta	%al
1454a6358:     	cmpb	$0x0, 0x37(%rbp)
1454a635c:     	jne	0x1454a636c <.text+0x54a536c>
1454a635e:     	testb	%al, %al
1454a6360:     	jne	0x1454a636c <.text+0x54a536c>
1454a6362:     	movsd	(%rdi), %xmm11
1454a6367:     	jmp	0x1454a67c7 <.text+0x54a57c7>
1454a636c:     	cmpl	$0x0, 0x890(%rsi)
1454a6373:     	je	0x1454a63d2 <.text+0x54a53d2>
1454a6375:     	leaq	0x934(%rsi), %rax
1454a637c:     	movq	%rax, -0x40(%rbp)
1454a6380:     	leaq	0x293369(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1454a6387:     	movq	%rax, -0x38(%rbp)
1454a638b:     	leaq	0x37(%rbp), %rax
1454a638f:     	movq	%rax, -0x30(%rbp)
1454a6393:     	leaq	0x2950e6(%rip), %rax    # 0x14573b480 <.text+0x573a480>
1454a639a:     	movq	%rax, -0x28(%rbp)
1454a639e:     	leaq	0x36(%rbp), %rcx
1454a63a2:     	movq	%rcx, -0x20(%rbp)
1454a63a6:     	movq	%rax, -0x18(%rbp)
1454a63aa:     	leaq	0x34(%rbp), %rcx
1454a63ae:     	movq	%rcx, -0x10(%rbp)
1454a63b2:     	movq	%rax, -0x8(%rbp)
1454a63b6:     	leaq	0x35(%rbp), %rcx
1454a63ba:     	movq	%rcx, (%rbp)
1454a63be:     	movq	%rax, 0x8(%rbp)
1454a63c2:     	leaq	0x1550141(%rip), %rcx   # 0x1469f650a
1454a63c9:     	leaq	-0x40(%rbp), %rdx
1454a63cd:     	callq	0x145711f90 <.text+0x5710f90>
1454a63d2:     	movl	$0x0, 0x880(%rsi)
1454a63dc:     	movl	$0x0, 0x888(%rsi)
1454a63e6:     	movl	$0x0, 0x90c(%rsi)
1454a63f0:     	movaps	%xmm9, %xmm11
1454a63f4:     	unpcklps	%xmm10, %xmm11          # xmm11 = xmm11[0],xmm10[0],xmm11[1],xmm10[1]
1454a63f8:     	cmpb	$0x1, 0x37(%rbp)
1454a63fc:     	jne	0x1454a6485 <.text+0x54a5485>
1454a6402:     	movq	0x228(%rsi), %rcx
1454a6409:     	movq	0x230(%rsi), %rdx
1454a6410:     	callq	0x145420480 <.text+0x541f480>
1454a6415:     	imulq	$0xf0, %rax, %rcx
1454a641c:     	leaq	(%r15,%rcx), %rbx
1454a6420:     	movsd	0xc8(%rcx,%r15), %xmm12
1454a642a:     	cmpq	$0x2, %rax
1454a642e:     	je	0x1454a6439 <.text+0x54a5439>
1454a6430:     	cmpl	$0x7, %eax
1454a6433:     	jne	0x1454a6857 <.text+0x54a5857>
1454a6439:     	movq	0x58(%rbx), %rcx
1454a643d:     	movq	0x60(%rbx), %rdx
1454a6441:     	movaps	%xmm9, %xmm2
1454a6445:     	movaps	%xmm10, %xmm3
1454a6449:     	callq	0x1454205d0 <.text+0x541f5d0>
1454a644e:     	movq	%rax, %xmm9
1454a6453:     	subps	%xmm9, %xmm12
1454a6457:     	movshdup	%xmm12, %xmm1           # xmm1 = xmm12[1,1,3,3]
1454a645c:     	movaps	%xmm12, %xmm0
1454a6460:     	callq	0x145773277 <.text+0x5772277>
1454a6465:     	maxss	0x4a81a3(%rip), %xmm0   # 0x14594e610
1454a646d:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454a6471:     	divps	%xmm0, %xmm12
1454a6475:     	mulps	0x53e313(%rip), %xmm12  # 0x1459e4790
1454a647d:     	addps	%xmm9, %xmm12
1454a6481:     	movaps	%xmm12, %xmm11
1454a6485:     	cmpb	$0x0, 0x35(%rbp)
1454a6489:     	jne	0x1454a6495 <.text+0x54a5495>
1454a648b:     	cmpb	$0x0, 0x36(%rbp)
1454a648f:     	je	0x1454a6574 <.text+0x54a5574>
1454a6495:     	leaq	0x928(%rsi), %rbx
1454a649c:     	movss	0x934(%rsi), %xmm0
1454a64a4:     	testb	$0x1, 0x920(%rsi)
1454a64ab:     	je	0x1454a6556 <.text+0x54a5556>
1454a64b1:     	movaps	%xmm0, %xmm1
1454a64b4:     	subss	0x924(%rsi), %xmm1
1454a64bc:     	movss	0x49931c(%rip), %xmm2   # 0x14593f7e0
1454a64c4:     	ucomiss	%xmm1, %xmm2
1454a64c7:     	jbe	0x1454a6556 <.text+0x54a5556>
1454a64cd:     	movaps	%xmm11, %xmm0
1454a64d1:     	subss	0x928(%rsi), %xmm0
1454a64d9:     	movshdup	%xmm11, %xmm1           # xmm1 = xmm11[1,1,3,3]
1454a64de:     	subss	0x92c(%rsi), %xmm1
1454a64e6:     	callq	0x145773277 <.text+0x5772277>
1454a64eb:     	movss	0x46ce09(%rip), %xmm1   # 0x1459132fc
1454a64f3:     	ucomiss	%xmm0, %xmm1
1454a64f6:     	movss	0x934(%rsi), %xmm0
1454a64fe:     	movl	$0x1, 0x920(%rsi)
1454a6508:     	movss	%xmm0, 0x924(%rsi)
1454a6510:     	movl	0x8(%rdi), %eax
1454a6513:     	movl	%eax, 0x8(%rbx)
1454a6516:     	movq	(%rdi), %rax
1454a6519:     	movq	%rax, (%rbx)
1454a651c:     	jbe	0x1454a6574 <.text+0x54a5574>
1454a651e:     	subps	%xmm11, %xmm8
1454a6522:     	movshdup	%xmm8, %xmm1            # xmm1 = xmm8[1,1,3,3]
1454a6527:     	movaps	%xmm8, %xmm0
1454a652b:     	callq	0x145773277 <.text+0x5772277>
1454a6530:     	maxss	0x4a80d8(%rip), %xmm0   # 0x14594e610
1454a6538:     	movsldup	%xmm0, %xmm1            # xmm1 = xmm0[0,0,2,2]
1454a653c:     	minss	0x460fc4(%rip), %xmm0   # 0x145907508
1454a6544:     	divps	%xmm1, %xmm8
1454a6548:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454a654c:     	mulps	%xmm8, %xmm0
1454a6550:     	addps	%xmm0, %xmm11
1454a6554:     	jmp	0x1454a6574 <.text+0x54a5574>
1454a6556:     	movl	$0x1, 0x920(%rsi)
1454a6560:     	movss	%xmm0, 0x924(%rsi)
1454a6568:     	movl	0x8(%rdi), %eax
1454a656b:     	movl	%eax, 0x8(%rbx)
1454a656e:     	movq	(%rdi), %rax
1454a6571:     	movq	%rax, (%rbx)
1454a6574:     	movq	0x898(%rsi), %rdi
1454a657b:     	cmpq	$-0x1, 0x40(%rdi)
1454a6580:     	je	0x1454a65eb <.text+0x54a55eb>
1454a6582:     	testb	%r14b, %r14b
1454a6585:     	je	0x1454a65eb <.text+0x54a55eb>
1454a6587:     	addq	$0x40, %rdi
1454a658b:     	movshdup	%xmm11, %xmm8           # xmm8 = xmm11[1,1,3,3]
1454a6590:     	movq	%rdi, %rcx
1454a6593:     	movaps	%xmm11, %xmm1
1454a6597:     	movaps	%xmm8, %xmm2
1454a659b:     	callq	0x1455257a0 <.text+0x55247a0>
1454a65a0:     	testb	%al, %al
1454a65a2:     	je	0x1454a65eb <.text+0x54a55eb>
1454a65a4:     	movl	$0x41a00000, 0x20(%rsp) # imm = 0x41A00000
1454a65ac:     	leaq	-0x40(%rbp), %rcx
1454a65b0:     	movq	%rdi, %rdx
1454a65b3:     	movaps	%xmm11, %xmm2
1454a65b7:     	movaps	%xmm8, %xmm3
1454a65bb:     	callq	0x145525bb0 <.text+0x5524bb0>
1454a65c0:     	movq	-0x3c(%rbp), %xmm0
1454a65c5:     	movd	-0x40(%rbp), %xmm1
1454a65ca:     	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1454a65cf:     	pslld	$0x1f, %xmm1
1454a65d4:     	psrad	$0x1f, %xmm1
1454a65d9:     	pand	%xmm1, %xmm0
1454a65dd:     	pandn	%xmm11, %xmm1
1454a65e2:     	por	%xmm0, %xmm1
1454a65e6:     	movdqa	%xmm1, %xmm11
1454a65eb:     	movq	0x898(%rsi), %rcx
1454a65f2:     	addq	$0x10, %rcx
1454a65f6:     	movshdup	%xmm11, %xmm8           # xmm8 = xmm11[1,1,3,3]
1454a65fb:     	movdqa	%xmm11, %xmm1
1454a6600:     	movaps	%xmm8, %xmm2
1454a6604:     	callq	0x14552a140 <.text+0x5529140>
1454a6609:     	testb	$0x1, %al
1454a660b:     	je	0x1454a6616 <.text+0x54a5616>
1454a660d:     	movdqa	%xmm0, %xmm7
1454a6611:     	jmp	0x1454a66b8 <.text+0x54a56b8>
1454a6616:     	movq	0x898(%rsi), %rdx
1454a661d:     	cmpq	$-0x1, 0x68(%rdx)
1454a6622:     	je	0x1454a664c <.text+0x54a564c>
1454a6624:     	addq	$0x68, %rdx
1454a6628:     	leaq	0x20(%rbp), %rcx
1454a662c:     	movaps	%xmm11, %xmm2
1454a6630:     	movaps	%xmm8, %xmm3
1454a6634:     	callq	0x14552d220 <.text+0x552c220>
1454a6639:     	cmpl	$0x1, 0x20(%rbp)
1454a663d:     	jne	0x1454a664c <.text+0x54a564c>
1454a663f:     	movsd	0x24(%rbp), %xmm11
1454a6645:     	movd	0x2c(%rbp), %xmm7
1454a664a:     	jmp	0x1454a66b8 <.text+0x54a56b8>
1454a664c:     	testb	%r14b, %r14b
1454a664f:     	jne	0x1454a66b8 <.text+0x54a56b8>
1454a6651:     	movq	0x898(%rsi), %rdx
1454a6658:     	addq	$0x10, %rdx
1454a665c:     	movq	%rsi, 0x30(%rsp)
1454a6661:     	movl	$0x40000000, 0x28(%rsp) # imm = 0x40000000
1454a6669:     	movl	$0x41a00000, 0x20(%rsp) # imm = 0x41A00000
1454a6671:     	leaq	-0x40(%rbp), %rcx
1454a6675:     	movaps	%xmm11, %xmm2
1454a6679:     	movaps	%xmm8, %xmm3
1454a667d:     	callq	0x14551dc20 <.text+0x551cc20>
1454a6682:     	movl	-0x40(%rbp), %eax
1454a6685:     	movq	-0x3c(%rbp), %xmm0
1454a668a:     	testl	%eax, %eax
1454a668c:     	je	0x1454a6693 <.text+0x54a5693>
1454a668e:     	movss	-0x34(%rbp), %xmm7
1454a6693:     	movd	%eax, %xmm1
1454a6697:     	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1454a669c:     	pslld	$0x1f, %xmm1
1454a66a1:     	psrad	$0x1f, %xmm1
1454a66a6:     	pand	%xmm1, %xmm0
1454a66aa:     	pandn	%xmm11, %xmm1
1454a66af:     	por	%xmm0, %xmm1
1454a66b3:     	movdqa	%xmm1, %xmm11
1454a66b8:     	movdqa	%xmm7, %xmm13
1454a66bd:     	addss	0x460dd2(%rip), %xmm13  # 0x145907498
1454a66c6:     	movl	0x4cc(%rsi), %r8d
1454a66cd:     	leal	0x1(%r8), %eax
1454a66d1:     	movl	%eax, 0x4cc(%rsi)
1454a66d7:     	leaq	0x550(%rsi), %rdi
1454a66de:     	movq	0x3e8(%rsi), %rdx
1454a66e5:     	movlpd	%xmm11, 0x20(%rbp)
1454a66eb:     	movss	%xmm13, 0x28(%rbp)
1454a66f1:     	movss	%xmm6, 0x20(%rsp)
1454a66f7:     	leaq	-0x40(%rbp), %rcx
1454a66fb:     	leaq	0x20(%rbp), %r9
1454a66ff:     	callq	0x145467450 <.text+0x5466450>
1454a6704:     	movq	0x560(%rsi), %rbx
1454a670b:     	cmpq	0x550(%rsi), %rbx
1454a6712:     	jne	0x1454a671d <.text+0x54a571d>
1454a6714:     	movq	%rdi, %rcx
1454a6717:     	callq	0x145774710 <.text+0x5773710>
1454a671c:     	nop
1454a671d:     	movq	0x558(%rsi), %rax
1454a6724:     	movq	%rbx, %rcx
1454a6727:     	shlq	$0x5, %rcx
1454a672b:     	movups	-0x40(%rbp), %xmm0
1454a672f:     	movups	-0x30(%rbp), %xmm1
1454a6733:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a6738:     	movups	%xmm0, (%rax,%rcx)
1454a673c:     	incq	%rbx
1454a673f:     	movq	%rbx, 0x560(%rsi)
1454a6746:     	cmpb	$0x0, 0x37(%rbp)
1454a674a:     	je	0x1454a67a4 <.text+0x54a57a4>
1454a674c:     	leaq	0x154fdf9(%rip), %rdx   # 0x1469f654c
1454a6753:     	leaq	-0x40(%rbp), %rcx
1454a6757:     	movl	$0x2d, %r8d
1454a675d:     	callq	0x14545dc90 <.text+0x545cc90>
1454a6762:     	movq	0x560(%rsi), %rbx
1454a6769:     	cmpq	0x550(%rsi), %rbx
1454a6770:     	jne	0x1454a677b <.text+0x54a577b>
1454a6772:     	movq	%rdi, %rcx
1454a6775:     	callq	0x145774710 <.text+0x5773710>
1454a677a:     	nop
1454a677b:     	movq	0x558(%rsi), %rax
1454a6782:     	movq	%rbx, %rcx
1454a6785:     	shlq	$0x5, %rcx
1454a6789:     	movups	-0x40(%rbp), %xmm0
1454a678d:     	movups	-0x30(%rbp), %xmm1
1454a6791:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a6796:     	movups	%xmm0, (%rax,%rcx)
1454a679a:     	incq	%rbx
1454a679d:     	movq	%rbx, 0x560(%rsi)
1454a67a4:     	movl	$0x1, 0x8f8(%rsi)
1454a67ae:     	movlpd	%xmm11, 0x8fc(%rsi)
1454a67b7:     	movss	%xmm13, 0x904(%rsi)
1454a67c0:     	movb	$0xc, 0x908(%rsi)
1454a67c7:     	movsd	0x400(%rsi), %xmm0
1454a67cf:     	movlps	%xmm11, 0x400(%rsi)
1454a67d7:     	movss	%xmm13, 0x408(%rsi)
1454a67e0:     	movss	%xmm6, 0x40c(%rsi)
1454a67e8:     	cmpb	$0x0, 0x9b9(%rsi)
1454a67ef:     	jne	0x1454a6811 <.text+0x54a5811>
1454a67f1:     	subps	%xmm11, %xmm0
1454a67f5:     	mulps	%xmm0, %xmm0
1454a67f8:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a67fc:     	addss	%xmm0, %xmm1
1454a6800:     	ucomiss	0x78ac39(%rip), %xmm1   # 0x145c31440
1454a6807:     	jbe	0x1454a6811 <.text+0x54a5811>
1454a6809:     	movq	%rsi, %rcx
1454a680c:     	callq	0x1454c2890 <.text+0x54c1890>
1454a6811:     	movaps	0x40(%rbp), %xmm6
1454a6815:     	movaps	0x50(%rbp), %xmm7
1454a6819:     	movaps	0x60(%rbp), %xmm8
1454a681e:     	movaps	0x70(%rbp), %xmm9
1454a6823:     	movaps	0x80(%rbp), %xmm10
1454a682b:     	movaps	0x90(%rbp), %xmm11
1454a6833:     	movaps	0xa0(%rbp), %xmm12
1454a683b:     	movaps	0xb0(%rbp), %xmm13
1454a6843:     	addq	$0x148, %rsp            # imm = 0x148
1454a684a:     	popq	%rbx
1454a684b:     	popq	%rdi
1454a684c:     	popq	%rsi
1454a684d:     	popq	%r12
1454a684f:     	popq	%r13
1454a6851:     	popq	%r14
1454a6853:     	popq	%r15
1454a6855:     	popq	%rbp
1454a6856:     	retq
1454a6857:     	subps	%xmm12, %xmm11
1454a685b:     	movshdup	%xmm11, %xmm1           # xmm1 = xmm11[1,1,3,3]
1454a6860:     	movaps	%xmm11, %xmm0
1454a6864:     	callq	0x145773277 <.text+0x5772277>
1454a6869:     	maxss	0x4a7d9f(%rip), %xmm0   # 0x14594e610
1454a6871:     	movss	0xd8(%rbx), %xmm1
1454a6879:     	addss	0x46ef7f(%rip), %xmm1   # 0x145915800
1454a6881:     	addss	0x53e177(%rip), %xmm1   # 0x1459e4a00
1454a6889:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454a688d:     	divps	%xmm0, %xmm11
1454a6891:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
1454a6895:     	mulps	%xmm11, %xmm0
1454a6899:     	addps	%xmm12, %xmm0
1454a689d:     	movaps	%xmm0, %xmm11
1454a68a1:     	cmpb	$0x0, 0x35(%rbp)
1454a68a5:     	je	0x1454a648b <.text+0x54a548b>
1454a68ab:     	jmp	0x1454a6495 <.text+0x54a5495>
1454a68b0:     	leaq	0x1285141(%rip), %r8    # 0x14672b9f8
1454a68b7:     	callq	0x145903b33 <.text+0x5902b33>
1454a68bc:     	ud2

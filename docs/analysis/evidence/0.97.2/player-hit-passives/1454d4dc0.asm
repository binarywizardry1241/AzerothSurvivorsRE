
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d4dc0:     	pushq	%r15
1454d4dc2:     	pushq	%r14
1454d4dc4:     	pushq	%r13
1454d4dc6:     	pushq	%r12
1454d4dc8:     	pushq	%rsi
1454d4dc9:     	pushq	%rdi
1454d4dca:     	pushq	%rbx
1454d4dcb:     	subq	$0x110, %rsp            # imm = 0x110
1454d4dd2:     	movaps	%xmm7, 0x100(%rsp)
1454d4dda:     	movaps	%xmm6, 0xf0(%rsp)
1454d4de2:     	movq	0x2a0(%rcx), %rax
1454d4de9:     	testq	%rax, %rax
1454d4dec:     	je	0x1454d5208 <.text+0x54d4208>
1454d4df2:     	movq	0x298(%rcx), %r8
1454d4df9:     	imulq	$0x58, %rax, %r10
1454d4dfd:     	xorl	%r9d, %r9d
1454d4e00:     	movabsq	$0x70726f6d796c6f70, %r11 # imm = 0x70726F6D796C6F70
1454d4e0a:     	jmp	0x1454d4e1d <.text+0x54d3e1d>
1454d4e0c:     	nopl	(%rax)
1454d4e10:     	addq	$0x58, %r9
1454d4e14:     	cmpq	%r9, %r10
1454d4e17:     	je	0x1454d5208 <.text+0x54d4208>
1454d4e1d:     	movq	(%r8,%r9), %r12
1454d4e21:     	cmpq	$0x9, 0x8(%r12)
1454d4e27:     	jne	0x1454d4e10 <.text+0x54d3e10>
1454d4e29:     	movq	(%r12), %rax
1454d4e2d:     	movq	(%rax), %rsi
1454d4e30:     	xorq	%r11, %rsi
1454d4e33:     	movzbl	0x8(%rax), %edi
1454d4e37:     	xorq	$0x68, %rdi
1454d4e3b:     	orq	%rsi, %rdi
1454d4e3e:     	jne	0x1454d4e10 <.text+0x54d3e10>
1454d4e40:     	movl	0x8(%r8,%r9), %r10d
1454d4e45:     	movss	0x14(%r8,%r9), %xmm0
1454d4e4c:     	movl	0x18(%r8,%r9), %r11d
1454d4e51:     	movl	0x34(%r8,%r9), %esi
1454d4e56:     	movl	%esi, 0xcc(%rsp)
1454d4e5d:     	movups	0x24(%r8,%r9), %xmm1
1454d4e63:     	movups	%xmm1, 0xbc(%rsp)
1454d4e6b:     	movups	0x38(%r8,%r9), %xmm1
1454d4e71:     	movups	0x44(%r8,%r9), %xmm2
1454d4e77:     	movups	%xmm1, 0xd0(%rsp)
1454d4e7f:     	movups	%xmm2, 0xdc(%rsp)
1454d4e87:     	movq	%r12, 0x98(%rsp)
1454d4e8f:     	movl	%r10d, 0xa0(%rsp)
1454d4e97:     	movsd	0xc(%r8,%r9), %xmm1
1454d4e9e:     	movsd	%xmm1, 0xa4(%rsp)
1454d4ea7:     	movss	%xmm0, 0xac(%rsp)
1454d4eb0:     	movl	%r11d, 0xb0(%rsp)
1454d4eb8:     	movsd	0x1c(%r8,%r9), %xmm0
1454d4ebf:     	movsd	%xmm0, 0xb4(%rsp)
1454d4ec8:     	cmpq	$0x2, 0x7a8(%rcx)
1454d4ed0:     	ja	0x1454d5208 <.text+0x54d4208>
1454d4ed6:     	movss	0x8e4(%rcx), %xmm6
1454d4ede:     	movq	0x730(%rcx), %r9
1454d4ee5:     	movss	0x5163e3(%rip), %xmm0   # 0x1459eb2d0
1454d4eed:     	testq	%r9, %r9
1454d4ef0:     	je	0x1454d4f44 <.text+0x54d3f44>
1454d4ef2:     	movq	0x728(%rcx), %r8
1454d4ef9:     	shlq	$0x3, %r9
1454d4efd:     	leaq	(%r9,%r9,2), %r10
1454d4f01:     	xorl	%r9d, %r9d
1454d4f04:     	jmp	0x1454d4f19 <.text+0x54d3f19>
1454d4f06:     	nopw	%cs:(%rax,%rax)
1454d4f10:     	addq	$0x18, %r9
1454d4f14:     	cmpq	%r9, %r10
1454d4f17:     	je	0x1454d4f44 <.text+0x54d3f44>
1454d4f19:     	cmpq	$0x9, 0x8(%r8,%r9)
1454d4f1f:     	jne	0x1454d4f10 <.text+0x54d3f10>
1454d4f21:     	movq	(%r8,%r9), %r11
1454d4f25:     	movq	(%r11), %rsi
1454d4f28:     	xorq	(%rax), %rsi
1454d4f2b:     	movzbl	0x8(%r11), %r11d
1454d4f30:     	xorb	0x8(%rax), %r11b
1454d4f34:     	movzbl	%r11b, %r11d
1454d4f38:     	orq	%rsi, %r11
1454d4f3b:     	jne	0x1454d4f10 <.text+0x54d3f10>
1454d4f3d:     	movss	0x10(%r8,%r9), %xmm0
1454d4f44:     	ucomiss	%xmm0, %xmm6
1454d4f47:     	jb	0x1454d5208 <.text+0x54d4208>
1454d4f4d:     	leaq	0x798(%rcx), %rsi
1454d4f54:     	movq	0x4c8(%rcx), %rax
1454d4f5b:     	imulq	$0x160, 0x4d0(%rcx), %r9 # imm = 0x160
1454d4f66:     	xorl	%r8d, %r8d
1454d4f69:     	movq	%rax, %r10
1454d4f6c:     	nopl	(%rax)
1454d4f70:     	cmpq	%r8, %r9
1454d4f73:     	je	0x1454d5208 <.text+0x54d4208>
1454d4f79:     	addq	$0x160, %r8             # imm = 0x160
1454d4f80:     	cmpq	%rdx, 0x88(%r10)
1454d4f87:     	leaq	0x160(%r10), %r10
1454d4f8e:     	jne	0x1454d4f70 <.text+0x54d3f70>
1454d4f90:     	cmpb	$0x0, -0xf8(%rax,%r8)
1454d4f99:     	jne	0x1454d5208 <.text+0x54d4208>
1454d4f9f:     	cmpq	$-0x1, -0x148(%rax,%r8)
1454d4fa8:     	jne	0x1454d5208 <.text+0x54d4208>
1454d4fae:     	cmpq	$-0x1, -0x120(%rax,%r8)
1454d4fb7:     	jne	0x1454d5208 <.text+0x54d4208>
1454d4fbd:     	ucomiss	-0x20(%rax,%r8), %xmm6
1454d4fc3:     	jb	0x1454d5208 <.text+0x54d4208>
1454d4fc9:     	leaq	0x880(%rcx), %rax
1454d4fd0:     	movq	%rcx, %rdi
1454d4fd3:     	movq	%rax, %rcx
1454d4fd6:     	movq	%rdx, %r13
1454d4fd9:     	callq	0x145486e90 <.text+0x5485e90>
1454d4fde:     	shrl	$0x8, %eax
1454d4fe1:     	xorps	%xmm0, %xmm0
1454d4fe4:     	cvtsi2ss	%eax, %xmm0
1454d4fe8:     	mulss	0x5163d0(%rip), %xmm0   # 0x1459eb3c0
1454d4ff0:     	ucomiss	0x416529(%rip), %xmm0   # 0x1458eb520
1454d4ff7:     	jae	0x1454d5208 <.text+0x54d4208>
1454d4ffd:     	leaq	0x98(%rsp), %rdx
1454d5005:     	movq	%rdi, %rcx
1454d5008:     	callq	0x1454d49e0 <.text+0x54d39e0>
1454d500d:     	movq	%rdi, %rax
1454d5010:     	movq	%r13, %r15
1454d5013:     	movq	$-0x160, %rcx           # imm = 0xFEA0
1454d501a:     	addq	0x4c8(%rdi), %rcx
1454d5021:     	imulq	$0x160, 0x4d0(%rdi), %rdx # imm = 0x160
1454d502c:     	testq	%rdx, %rdx
1454d502f:     	je	0x1454d513f <.text+0x54d413f>
1454d5035:     	leaq	0x160(%rcx), %rbx
1454d503c:     	addq	$-0x160, %rdx           # imm = 0xFEA0
1454d5043:     	cmpq	%r15, 0x1e8(%rcx)
1454d504a:     	movq	%rbx, %rcx
1454d504d:     	jne	0x1454d502c <.text+0x54d402c>
1454d504f:     	movss	0x423d89(%rip), %xmm0   # 0x1458f8de0
1454d5057:     	addss	%xmm6, %xmm0
1454d505b:     	movss	%xmm0, 0x140(%rbx)
1454d5063:     	movl	$0x0, 0x70(%rbx)
1454d506a:     	movss	0x435e8a(%rip), %xmm0   # 0x14590aefc
1454d5072:     	addss	%xmm6, %xmm0
1454d5076:     	movss	%xmm0, 0x12c(%rbx)
1454d507e:     	movq	0x878(%rax), %r14
1454d5085:     	addq	$0x10, %r14
1454d5089:     	leaq	0x78(%rsp), %rcx
1454d508e:     	movq	%rbx, %rdx
1454d5091:     	movaps	%xmm6, %xmm2
1454d5094:     	callq	0x14540d200 <.text+0x540c200>
1454d5099:     	movsd	0x78(%rsp), %xmm7
1454d509f:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
1454d50a3:     	movq	%r14, %rcx
1454d50a6:     	movaps	%xmm7, %xmm1
1454d50a9:     	callq	0x1454627f0 <.text+0x54617f0>
1454d50ae:     	testb	$0x1, %al
1454d50b0:     	jne	0x1454d50bb <.text+0x54d40bb>
1454d50b2:     	movss	0x80(%rsp), %xmm0
1454d50bb:     	movsd	%xmm7, 0x40(%rsp)
1454d50c1:     	movss	%xmm0, 0x48(%rsp)
1454d50c7:     	movl	0x48(%rsp), %eax
1454d50cb:     	movl	%eax, 0x114(%rbx)
1454d50d1:     	movq	0x40(%rsp), %rax
1454d50d6:     	movq	%rax, 0x10c(%rbx)
1454d50dd:     	movq	0x40(%rsp), %rax
1454d50e2:     	movq	%rax, 0x118(%rbx)
1454d50e9:     	movl	0x48(%rsp), %eax
1454d50ed:     	movl	%eax, 0x120(%rbx)
1454d50f3:     	xorps	%xmm0, %xmm0
1454d50f6:     	movss	%xmm6, %xmm0            # xmm0 = xmm6[0],xmm0[1,2,3]
1454d50fa:     	movlps	%xmm0, 0x124(%rbx)
1454d5101:     	movl	0x908(%rdi), %r9d
1454d5108:     	incl	%r9d
1454d510b:     	movl	%r9d, 0x908(%rdi)
1454d5112:     	leaq	0x538(%rdi), %rbx
1454d5119:     	leaq	0x78(%rsp), %r14
1454d511e:     	leaq	0x40(%rsp), %r8
1454d5123:     	movq	%r14, %rcx
1454d5126:     	movq	%r13, %r15
1454d5129:     	movq	%r13, %rdx
1454d512c:     	callq	0x1454451b0 <.text+0x54441b0>
1454d5131:     	movq	%rbx, %rcx
1454d5134:     	movq	%r14, %rdx
1454d5137:     	callq	0x140bd39f0 <.text+0xbd29f0>
1454d513c:     	movq	%rdi, %rax
1454d513f:     	movq	0x7a8(%rax), %rbx
1454d5146:     	cmpq	0x798(%rax), %rbx
1454d514d:     	jne	0x1454d515d <.text+0x54d415d>
1454d514f:     	movq	%rsi, %rcx
1454d5152:     	callq	0x145757ef0 <.text+0x5756ef0>
1454d5157:     	movq	%rdi, %rax
1454d515a:     	movq	%r13, %r15
1454d515d:     	movq	0x7a0(%rax), %rcx
1454d5164:     	movq	%r15, (%rcx,%rbx,8)
1454d5168:     	incq	%rbx
1454d516b:     	movq	%rbx, 0x7a8(%rax)
1454d5172:     	movss	0x416306(%rip), %xmm3   # 0x1458eb480
1454d517a:     	movq	%rax, %rdi
1454d517d:     	movq	%rax, %rcx
1454d5180:     	movq	%r15, %rdx
1454d5183:     	movl	$0x358, %r8d            # imm = 0x358
1454d5189:     	callq	0x1454d5440 <.text+0x54d4440>
1454d518e:     	leaq	0x538(%rdi), %rbx
1454d5195:     	movq	0x3d0(%rdi), %rdx
1454d519c:     	movl	0x40(%r12), %r8d
1454d51a1:     	movq	%r15, 0x50(%rsp)
1454d51a6:     	movq	%r15, 0x60(%rsp)
1454d51ab:     	movl	$0x0, 0x58(%rsp)
1454d51b3:     	movl	$0x0, 0x6c(%rsp)
1454d51bb:     	leaq	0x6c(%rsp), %rax
1454d51c0:     	movq	%rax, 0x30(%rsp)
1454d51c5:     	leaq	0x58(%rsp), %rax
1454d51ca:     	movq	%rax, 0x28(%rsp)
1454d51cf:     	movq	$0x1, 0x20(%rsp)
1454d51d8:     	leaq	0x78(%rsp), %r14
1454d51dd:     	leaq	0x50(%rsp), %r9
1454d51e2:     	movq	%r14, %rcx
1454d51e5:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454d51ea:     	movq	%rbx, %rcx
1454d51ed:     	movq	%r14, %rdx
1454d51f0:     	callq	0x140bd39f0 <.text+0xbd29f0>
1454d51f5:     	movl	0x40(%r12), %r8d
1454d51fa:     	movq	%rdi, %rcx
1454d51fd:     	movq	%r15, %rdx
1454d5200:     	movb	$0x1, %r9b
1454d5203:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454d5208:     	movaps	0xf0(%rsp), %xmm6
1454d5210:     	movaps	0x100(%rsp), %xmm7
1454d5218:     	addq	$0x110, %rsp            # imm = 0x110
1454d521f:     	popq	%rbx
1454d5220:     	popq	%rdi
1454d5221:     	popq	%rsi
1454d5222:     	popq	%r12
1454d5224:     	popq	%r13
1454d5226:     	popq	%r14
1454d5228:     	popq	%r15
1454d522a:     	retq

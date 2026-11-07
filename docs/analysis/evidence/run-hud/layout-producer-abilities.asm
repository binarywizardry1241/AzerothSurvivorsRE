
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458fae0b:     	movq	0x318(%rsi), %rdi
1458fae12:     	imulq	$0x68, 0x320(%rsi), %rcx
1458fae1a:     	addq	%rdi, %rcx
1458fae1d:     	movq	%rcx, 0x120(%rbp)
1458fae24:     	movq	%rsi, 0xb0(%rbp)
1458fae2b:     	movss	0x480(%rsi), %xmm6
1458fae33:     	movb	$0x1, %r10b
1458fae36:     	leaq	0xf0(%rbp), %rbx
1458fae3d:     	leaq	0x140(%rbp), %r14
1458fae44:     	xorps	%xmm7, %xmm7
1458fae47:     	movss	0x478ef0(%rip), %xmm8   # 0x145d73d40
1458fae50:     	movss	0x478eeb(%rip), %xmm9   # 0x145d73d44
1458fae59:     	movss	0x475dd2(%rip), %xmm10  # 0x145d70c34
1458fae62:     	movl	$0x1, %r8d
1458fae68:     	movl	$0x1, %r9d
1458fae6e:     	cmpq	0x120(%rbp), %rdi
1458fae75:     	movq	%rax, -0x28(%rbp)
1458fae79:     	movq	%r8, -0x30(%rbp)
1458fae7d:     	je	0x1458fb244 <.text+0x58fa244>
1458fae83:     	nopw	%cs:(%rax,%rax)
1458fae90:     	movq	%r8, 0xc0(%rbp)
1458fae97:     	movq	%rax, 0xc8(%rbp)
1458fae9e:     	movq	%r9, 0xd0(%rbp)
1458faea5:     	movb	%r10b, 0xd8(%rbp)
1458faeac:     	movl	0x30(%rbp), %eax
1458faeaf:     	movl	0x33(%rbp), %ecx
1458faeb2:     	leaq	0xd9(%rbp), %rdx
1458faeb9:     	movl	%ecx, 0x3(%rdx)
1458faebc:     	movl	%eax, (%rdx)
1458faebe:     	callq	0x140002200 <.text+0x1200>
1458faec3:     	movl	$0x1, %ecx
1458faec8:     	movl	$0x1, %edx
1458faecd:     	callq	0x1400021c0 <.text+0x11c0>
1458faed2:     	testq	%rax, %rax
1458faed5:     	je	0x1458fd8c5 <.text+0x58fc8c5>
1458faedb:     	movb	$0x7b, (%rax)
1458faede:     	movq	$0x1, 0x140(%rbp)
1458faee9:     	movq	%rax, 0x148(%rbp)
1458faef0:     	movq	$0x1, 0x150(%rbp)
1458faefb:     	movb	$0x1, 0x158(%rbp)
1458faf02:     	movq	(%rdi), %rax
1458faf05:     	movups	(%rax), %xmm0
1458faf08:     	movb	$0x1, 0x173(%rbp)
1458faf0f:     	movups	%xmm0, 0x20(%rsp)
1458faf14:     	movl	$0x3, %r9d
1458faf1a:     	movq	%rbx, %rcx
1458faf1d:     	movq	%r14, %rdx
1458faf20:     	leaq	0x157e411(%rip), %r8    # 0x146e79338
1458faf27:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458faf2c:     	nop
1458faf2d:     	movq	(%rdi), %rax
1458faf30:     	movl	0x40(%rax), %eax
1458faf33:     	movb	$0x1, 0x173(%rbp)
1458faf3a:     	movl	%eax, 0x20(%rsp)
1458faf3e:     	movl	$0x5, %r9d
1458faf44:     	movq	%r14, %rcx
1458faf47:     	movq	%rbx, %rdx
1458faf4a:     	leaq	0x157dd0f(%rip), %r8    # 0x146e78c60
1458faf51:     	callq	0x1458d6e20 <.text+0x58d5e20>
1458faf56:     	nop
1458faf57:     	movq	(%rdi), %r15
1458faf5a:     	movq	%r15, 0x10(%rbp)
1458faf5e:     	leaq	-0x58f8ea5(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458faf65:     	movq	%rax, 0x18(%rbp)
1458faf69:     	movb	$0x1, 0x117(%rbp)
1458faf70:     	movq	%rbx, %rcx
1458faf73:     	leaq	0x12a5dd5(%rip), %rdx   # 0x146ba0d4f
1458faf7a:     	leaq	0x10(%rbp), %r8
1458faf7e:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458faf83:     	nop
1458faf84:     	movq	0xf8(%rbp), %rcx
1458faf8b:     	movq	0x100(%rbp), %rdx
1458faf92:     	movq	0x10(%r15), %rsi
1458faf96:     	movq	0x18(%r15), %r15
1458faf9a:     	movq	%rcx, 0xb8(%rbp)
1458fafa1:     	callq	0x1458da590 <.text+0x58d9590>
1458fafa6:     	nop
1458fafa7:     	movq	%rax, %r13
1458fafaa:     	movq	%rdx, %r12
1458fafad:     	movq	0xf0(%rbp), %rdx
1458fafb4:     	testq	%rdx, %rdx
1458fafb7:     	je	0x1458fafcb <.text+0x58f9fcb>
1458fafb9:     	movl	$0x1, %r8d
1458fafbf:     	movq	0xb8(%rbp), %rcx
1458fafc6:     	callq	0x1400021d0 <.text+0x11d0>
1458fafcb:     	testq	%r13, %r13
1458fafce:     	cmovneq	%r13, %rsi
1458fafd2:     	cmoveq	%r15, %r12
1458fafd6:     	movb	$0x0, 0x117(%rbp)
1458fafdd:     	movq	%r12, 0x28(%rsp)
1458fafe2:     	movq	%rsi, 0x20(%rsp)
1458fafe7:     	movl	$0x4, %r9d
1458fafed:     	movq	%rbx, %rcx
1458faff0:     	movq	%r14, %rdx
1458faff3:     	leaq	0x157e341(%rip), %r8    # 0x146e7933b
1458faffa:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458fafff:     	nop
1458fb000:     	movq	(%rdi), %rax
1458fb003:     	movups	0x20(%rax), %xmm0
1458fb007:     	movb	$0x1, 0x173(%rbp)
1458fb00e:     	movups	%xmm0, 0x20(%rsp)
1458fb013:     	movl	$0x4, %r9d
1458fb019:     	movq	%r14, %rcx
1458fb01c:     	movq	%rbx, %rdx
1458fb01f:     	leaq	0x157e319(%rip), %r8    # 0x146e7933f
1458fb026:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458fb02b:     	nop
1458fb02c:     	movl	0x20(%rdi), %eax
1458fb02f:     	movb	$0x1, 0x173(%rbp)
1458fb036:     	movl	%eax, 0x20(%rsp)
1458fb03a:     	movl	$0x4, %r9d
1458fb040:     	movq	%rbx, %rcx
1458fb043:     	movq	%r14, %rdx
1458fb046:     	leaq	0x157e2f6(%rip), %r8    # 0x146e79343
1458fb04d:     	callq	0x1458d6e20 <.text+0x58d5e20>
1458fb052:     	nop
1458fb053:     	movss	0x24(%rdi), %xmm0
1458fb058:     	maxss	%xmm7, %xmm0
1458fb05c:     	movb	$0x1, 0x173(%rbp)
1458fb063:     	movss	%xmm0, 0x20(%rsp)
1458fb069:     	movl	$0x2, %r9d
1458fb06f:     	movq	%r14, %rcx
1458fb072:     	movq	%rbx, %rdx
1458fb075:     	leaq	0x157e2cb(%rip), %r8    # 0x146e79347
1458fb07c:     	callq	0x1458d6ca0 <.text+0x58d5ca0>
1458fb081:     	nop
1458fb082:     	movq	(%rdi), %rax
1458fb085:     	cmpb	$0xb, 0x75(%rax)
1458fb089:     	jne	0x1458fb110 <.text+0x58fa110>
1458fb08f:     	movq	(%rax), %rcx
1458fb092:     	movq	0x8(%rax), %rdx
1458fb096:     	cmpq	$0xb, %rdx
1458fb09a:     	je	0x1458fb1f8 <.text+0x58fa1f8>
1458fb0a0:     	cmpq	$0xa, %rdx
1458fb0a4:     	jne	0x1458fb0ca <.text+0x58fa0ca>
1458fb0a6:     	movq	(%rcx), %r8
1458fb0a9:     	xorq	0x12b85ee(%rip), %r8    # 0x146bb369e
1458fb0b0:     	movzwl	0x8(%rcx), %r9d
1458fb0b5:     	xorw	0x12b85e9(%rip), %r9w   # 0x146bb36a6
1458fb0bd:     	movzwl	%r9w, %r9d
1458fb0c1:     	orq	%r8, %r9
1458fb0c4:     	je	0x1458fb216 <.text+0x58fa216>
1458fb0ca:     	movss	0x48(%rax), %xmm11
1458fb0d0:     	mulss	%xmm8, %xmm11
1458fb0d5:     	mulss	0x2c(%rdi), %xmm11
1458fb0db:     	mulss	0x48(%rdi), %xmm11
1458fb0e1:     	mulss	%xmm6, %xmm11
1458fb0e6:     	mulss	0x64(%rdi), %xmm11
1458fb0ec:     	maxss	%xmm9, %xmm11
1458fb0f1:     	callq	0x145882c60 <.text+0x5881c60>
1458fb0f6:     	maxss	%xmm11, %xmm0
1458fb0fb:     	movss	0x5c(%rdi), %xmm1
1458fb100:     	maxss	%xmm10, %xmm1
1458fb105:     	divss	%xmm1, %xmm0
1458fb109:     	jmp	0x1458fb132 <.text+0x58fa132>
1458fb10b:     	nopl	(%rax,%rax)
1458fb110:     	movss	0x48(%rax), %xmm0
1458fb115:     	mulss	%xmm8, %xmm0
1458fb11a:     	mulss	0x2c(%rdi), %xmm0
1458fb11f:     	mulss	0x48(%rdi), %xmm0
1458fb124:     	mulss	%xmm6, %xmm0
1458fb128:     	mulss	0x64(%rdi), %xmm0
1458fb12d:     	maxss	%xmm9, %xmm0
1458fb132:     	movb	$0x1, 0x173(%rbp)
1458fb139:     	movss	%xmm0, 0x20(%rsp)
1458fb13f:     	movl	$0x5, %r9d
1458fb145:     	movq	%rbx, %rcx
1458fb148:     	movq	%r14, %rdx
1458fb14b:     	leaq	0x157e1f7(%rip), %r8    # 0x146e79349
1458fb152:     	callq	0x1458d6ca0 <.text+0x58d5ca0>
1458fb157:     	nop
1458fb158:     	movq	0x100(%rbp), %r12
1458fb15f:     	cmpq	%r12, 0xf0(%rbp)
1458fb166:     	je	0x1458fb21e <.text+0x58fa21e>
1458fb16c:     	movq	0xf8(%rbp), %rax
1458fb173:     	movb	$0x7d, (%rax,%r12)
1458fb178:     	incq	%r12
1458fb17b:     	movq	%r12, 0x150(%rbp)
1458fb182:     	movups	0xf0(%rbp), %xmm0
1458fb189:     	movaps	%xmm0, 0x140(%rbp)
1458fb190:     	movb	$0x0, 0x173(%rbp)
1458fb197:     	leaq	0x80(%rbp), %rcx
1458fb19e:     	leaq	0xc0(%rbp), %rdx
1458fb1a5:     	movq	%r14, %r8
1458fb1a8:     	callq	0x1458d92b0 <.text+0x58d82b0>
1458fb1ad:     	nop
1458fb1ae:     	addq	$0x68, %rdi
1458fb1b2:     	movq	0x80(%rbp), %r8
1458fb1b9:     	movq	0x88(%rbp), %rax
1458fb1c0:     	movq	0x90(%rbp), %r9
1458fb1c7:     	movzbl	0x98(%rbp), %r10d
1458fb1cf:     	leaq	0x99(%rbp), %rcx
1458fb1d6:     	movl	(%rcx), %edx
1458fb1d8:     	movl	0x3(%rcx), %ecx
1458fb1db:     	movl	%edx, 0x30(%rbp)
1458fb1de:     	movl	%ecx, 0x33(%rbp)
1458fb1e1:     	cmpq	0x120(%rbp), %rdi
1458fb1e8:     	movq	%rax, -0x28(%rbp)
1458fb1ec:     	movq	%r8, -0x30(%rbp)
1458fb1f0:     	jne	0x1458fae90 <.text+0x58f9e90>
1458fb1f6:     	jmp	0x1458fb244 <.text+0x58fa244>
1458fb1f8:     	movq	(%rcx), %r8
1458fb1fb:     	xorq	0x12b84a6(%rip), %r8    # 0x146bb36a8
1458fb202:     	movq	0x3(%rcx), %r9
1458fb206:     	xorq	0x12b849e(%rip), %r9    # 0x146bb36ab
1458fb20d:     	orq	%r8, %r9
1458fb210:     	jne	0x1458fb0ca <.text+0x58fa0ca>
1458fb216:     	xorps	%xmm0, %xmm0
1458fb219:     	jmp	0x1458fb132 <.text+0x58fa132>
1458fb21e:     	movq	$0x1, 0x20(%rsp)
1458fb227:     	movl	$0x1, %r8d
1458fb22d:     	movl	$0x1, %r9d
1458fb233:     	movq	%rbx, %rcx
1458fb236:     	movq	%r12, %rdx
1458fb239:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458fb23e:     	nop
1458fb23f:     	jmp	0x1458fb16c <.text+0x58fa16c>

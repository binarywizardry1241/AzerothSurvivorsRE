
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403ace80:     	pushq	%rbp
1403ace81:     	pushq	%r15
1403ace83:     	pushq	%r14
1403ace85:     	pushq	%r13
1403ace87:     	pushq	%r12
1403ace89:     	pushq	%rsi
1403ace8a:     	pushq	%rdi
1403ace8b:     	pushq	%rbx
1403ace8c:     	subq	$0x2d8, %rsp            # imm = 0x2D8
1403ace93:     	leaq	0x80(%rsp), %rbp
1403ace9b:     	movq	$-0x2, 0x250(%rbp)
1403acea6:     	movq	%r8, %rbx
1403acea9:     	movq	%rdx, %rdi
1403aceac:     	movq	%rcx, %rsi
1403aceaf:     	cmpq	$-0x1, (%rdx)
1403aceb3:     	je	0x1403acf06 <.text+0x3abf06>
1403aceb5:     	movq	0x5a0(%rbx), %rax
1403acebc:     	movq	%rax, 0x138(%rbp)
1403acec3:     	cmpq	%rax, 0x160(%rdi)
1403aceca:     	je	0x1403ad0ac <.text+0x3ac0ac>
1403aced0:     	addq	$0x160, %rdi            # imm = 0x160
1403aced7:     	leaq	0x55a4642(%rip), %rax   # 0x145951520
1403acede:     	movq	%rax, 0x28(%rsp)
1403acee3:     	movq	$0x83, 0x20(%rsp)
1403aceec:     	leaq	0x55a45e7(%rip), %r9    # 0x1459514da
1403acef3:     	leaq	0x138(%rbp), %r8
1403acefa:     	xorl	%ecx, %ecx
1403acefc:     	movq	%rdi, %rdx
1403aceff:     	callq	0x14589fabd <.text+0x589eabd>
1403acf04:     	ud2
1403acf06:     	leaq	0x55a2d73(%rip), %r8    # 0x14594fc80
1403acf0d:     	leaq	0xc8(%rbp), %rcx
1403acf14:     	movq	%rbx, %rdx
1403acf17:     	callq	0x144e689b0 <.text+0x4e679b0>
1403acf1c:     	leaq	0x40(%rbx), %r15
1403acf20:     	leaq	0x5a8(%rbx), %r12
1403acf27:     	movq	%r15, 0x150(%rbp)
1403acf2e:     	movq	%r12, 0x158(%rbp)
1403acf35:     	movq	$0x0, 0x138(%rbp)
1403acf40:     	movq	$0x8, 0x140(%rbp)
1403acf4b:     	movq	$0x0, 0x148(%rbp)
1403acf56:     	leaq	0x554cb2b(%rip), %rdx   # 0x1458f9a88
1403acf5d:     	leaq	0x138(%rbp), %rcx
1403acf64:     	callq	0x140081da0 <.text+0x80da0>
1403acf69:     	nop
1403acf6a:     	movq	%rax, %r14
1403acf6d:     	movq	0x138(%rbp), %rdx
1403acf74:     	testq	%rdx, %rdx
1403acf77:     	je	0x1403acf8f <.text+0x3abf8f>
1403acf79:     	movq	0x140(%rbp), %rcx
1403acf80:     	shlq	$0x3, %rdx
1403acf84:     	movl	$0x8, %r8d
1403acf8a:     	callq	0x1400021d0 <.text+0x11d0>
1403acf8f:     	movq	%r15, 0x150(%rbp)
1403acf96:     	movq	%r12, 0x158(%rbp)
1403acf9d:     	movq	$0x0, 0x138(%rbp)
1403acfa8:     	movq	$0x8, 0x140(%rbp)
1403acfb3:     	movq	$0x0, 0x148(%rbp)
1403acfbe:     	leaq	0x554cbf3(%rip), %rdx   # 0x1458f9bb8
1403acfc5:     	leaq	0x138(%rbp), %rcx
1403acfcc:     	callq	0x140083820 <.text+0x82820>
1403acfd1:     	nop
1403acfd2:     	movq	%rax, %r15
1403acfd5:     	movq	0x138(%rbp), %rdx
1403acfdc:     	testq	%rdx, %rdx
1403acfdf:     	je	0x1403acff8 <.text+0x3abff8>
1403acfe1:     	movq	0x140(%rbp), %rcx
1403acfe8:     	shlq	$0x3, %rdx
1403acfec:     	movl	$0x8, %r8d
1403acff2:     	callq	0x1400021d0 <.text+0x11d0>
1403acff7:     	nop
1403acff8:     	leaq	0x138(%rbp), %rcx
1403acfff:     	movq	%rbx, %rdx
1403ad002:     	callq	0x140316ab0 <.text+0x315ab0>
1403ad007:     	nop
1403ad008:     	movq	0xf8(%rbp), %rax
1403ad00f:     	movq	%rax, 0x130(%rbp)
1403ad016:     	movups	0xc8(%rbp), %xmm0
1403ad01d:     	movups	0xd8(%rbp), %xmm1
1403ad024:     	movups	0xe8(%rbp), %xmm2
1403ad02b:     	movaps	%xmm2, 0x120(%rbp)
1403ad032:     	movaps	%xmm1, 0x110(%rbp)
1403ad039:     	movaps	%xmm0, 0x100(%rbp)
1403ad040:     	leaq	-0x50(%rbp), %r12
1403ad044:     	leaq	0x138(%rbp), %rdx
1403ad04b:     	movl	$0x118, %r8d            # imm = 0x118
1403ad051:     	movq	%r12, %rcx
1403ad054:     	callq	0x145756ddd <.text+0x5755ddd>
1403ad059:     	movq	0x5a0(%rbx), %r13
1403ad060:     	movq	0x130(%rbp), %rax
1403ad067:     	movq	%rax, 0x30(%rdi)
1403ad06b:     	movaps	0x100(%rbp), %xmm0
1403ad072:     	movaps	0x110(%rbp), %xmm1
1403ad079:     	movaps	0x120(%rbp), %xmm2
1403ad080:     	movups	%xmm2, 0x20(%rdi)
1403ad084:     	movups	%xmm1, 0x10(%rdi)
1403ad088:     	movups	%xmm0, (%rdi)
1403ad08b:     	movq	%r14, 0x38(%rdi)
1403ad08f:     	movq	%r15, 0x40(%rdi)
1403ad093:     	leaq	0x48(%rdi), %rcx
1403ad097:     	movl	$0x118, %r8d            # imm = 0x118
1403ad09d:     	movq	%r12, %rdx
1403ad0a0:     	callq	0x145756ddd <.text+0x5755ddd>
1403ad0a5:     	movq	%r13, 0x160(%rdi)
1403ad0ac:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
1403ad0b1:     	addl	0x5b0(%rbx), %eax
1403ad0b7:     	leaq	0x168(%rdi), %rdx
1403ad0be:     	movl	%eax, 0x168(%rdi)
1403ad0c4:     	movq	$0x10, 0x150(%rbp)
1403ad0cf:     	xorps	%xmm0, %xmm0
1403ad0d2:     	movups	%xmm0, 0x158(%rbp)
1403ad0d9:     	movq	$0x10, 0x168(%rbp)
1403ad0e4:     	movups	%xmm0, 0x170(%rbp)
1403ad0eb:     	movq	$0x10, 0x180(%rbp)
1403ad0f6:     	movups	%xmm0, 0x188(%rbp)
1403ad0fd:     	movq	$0x10, 0x198(%rbp)
1403ad108:     	movups	%xmm0, 0x1a0(%rbp)
1403ad10f:     	movq	$0x10, 0x1b0(%rbp)
1403ad11a:     	movq	$0x0, 0x138(%rbp)
1403ad125:     	movups	%xmm0, 0x1b8(%rbp)
1403ad12c:     	movl	$0x0, 0x1c8(%rbp)
1403ad136:     	movq	$0x8, 0x140(%rbp)
1403ad141:     	movq	$0x0, 0x148(%rbp)
1403ad14c:     	leaq	0x138(%rbp), %r8
1403ad153:     	movq	%rdi, %rcx
1403ad156:     	movq	%rbx, %r9
1403ad159:     	callq	0x140275550 <.text+0x274550>
1403ad15e:     	nop
1403ad15f:     	leaq	0x138(%rbp), %rdx
1403ad166:     	movl	$0x98, %r8d
1403ad16c:     	movq	%rsi, %rcx
1403ad16f:     	callq	0x145756ddd <.text+0x5755ddd>
1403ad174:     	movq	%rsi, %rax
1403ad177:     	addq	$0x2d8, %rsp            # imm = 0x2D8
1403ad17e:     	popq	%rbx
1403ad17f:     	popq	%rdi
1403ad180:     	popq	%rsi
1403ad181:     	popq	%r12
1403ad183:     	popq	%r13
1403ad185:     	popq	%r14
1403ad187:     	popq	%r15
1403ad189:     	popq	%rbp
1403ad18a:     	retq


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c5e6f:     	movq	0x770(%rsi), %rax
1454c5e76:     	movq	0x778(%rsi), %rcx
1454c5e7d:     	shlq	$0x4, %rcx
1454c5e81:     	xorl	%edx, %edx
1454c5e83:     	nopw	%cs:(%rax,%rax)
1454c5e90:     	cmpq	%rdx, %rcx
1454c5e93:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c5e99:     	cmpq	%rdi, (%rax,%rdx)
1454c5e9d:     	leaq	0x10(%rdx), %rdx
1454c5ea1:     	jne	0x1454c5e90 <.text+0x54c4e90>
1454c5ea3:     	leaq	0x768(%rsi), %rcx
1454c5eaa:     	leaq	-0x10(%rbp), %rdx
1454c5eae:     	callq	0x145524320 <.text+0x5523320>
1454c5eb3:     	movq	0x2a0(%rsi), %rcx
1454c5eba:     	testq	%rcx, %rcx
1454c5ebd:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c5ec3:     	movq	0x298(%rsi), %rax
1454c5eca:     	imulq	$0x58, %rcx, %rdx
1454c5ece:     	xorl	%ecx, %ecx
1454c5ed0:     	movabsq	$0x665f656972656166, %r8 # imm = 0x665F656972656166
1454c5eda:     	movabsq	$0x657269665f656972, %r9 # imm = 0x657269665F656972
1454c5ee4:     	jmp	0x1454c5efd <.text+0x54c4efd>
1454c5ee6:     	nopw	%cs:(%rax,%rax)
1454c5ef0:     	addq	$0x58, %rcx
1454c5ef4:     	cmpq	%rcx, %rdx
1454c5ef7:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c5efd:     	movq	(%rax,%rcx), %r10
1454c5f01:     	cmpq	$0xb, 0x8(%r10)
1454c5f06:     	jne	0x1454c5ef0 <.text+0x54c4ef0>
1454c5f08:     	movq	(%r10), %r11
1454c5f0b:     	movq	(%r11), %r14
1454c5f0e:     	xorq	%r8, %r14
1454c5f11:     	movq	0x3(%r11), %r11
1454c5f15:     	xorq	%r9, %r11
1454c5f18:     	orq	%r14, %r11
1454c5f1b:     	jne	0x1454c5ef0 <.text+0x54c4ef0>
1454c5f1d:     	movq	0x778(%rsi), %rdx
1454c5f24:     	movl	0x54(%r10), %r8d
1454c5f28:     	testl	%r8d, %r8d
1454c5f2b:     	je	0x1454c5f53 <.text+0x54c4f53>
1454c5f2d:     	movl	0x18(%rax,%rcx), %r9d
1454c5f32:     	addl	0x40(%rax,%rcx), %r9d
1454c5f37:     	addl	0x48c(%rsi), %r9d
1454c5f3e:     	addl	%r8d, %r9d
1454c5f41:     	cmpl	$0x3, %r9d
1454c5f45:     	movl	$0x3, %eax
1454c5f4a:     	cmovbl	%r9d, %eax
1454c5f4e:     	testl	%r9d, %r9d
1454c5f51:     	jne	0x1454c5f58 <.text+0x54c4f58>
1454c5f53:     	movl	$0x1, %eax
1454c5f58:     	movl	%eax, %eax
1454c5f5a:     	cmpq	%rax, %rdx
1454c5f5d:     	jae	0x1454c5fc8 <.text+0x54c4fc8>
1454c5f5f:     	movb	$0x1, 0x176(%rbp)
1454c5f66:     	leaq	0xf0(%rbp), %rcx
1454c5f6d:     	leaq	0x60(%rbp), %r8
1454c5f71:     	movss	0x425587(%rip), %xmm3   # 0x1458eb500
1454c5f79:     	movq	%rsi, %rdx
1454c5f7c:     	callq	0x1454d5950 <.text+0x54d4950>
1454c5f81:     	nop
1454c5f82:     	cmpq	$0x0, 0x100(%rbp)
1454c5f8a:     	je	0x1454c5fa6 <.text+0x54c4fa6>
1454c5f8c:     	movq	0xf8(%rbp), %rax
1454c5f93:     	movq	%rax, 0x150(%rbp)
1454c5f9a:     	movq	(%rax), %rdx
1454c5f9d:     	movq	%rsi, %rcx
1454c5fa0:     	callq	0x1454d7810 <.text+0x54d6810>
1454c5fa5:     	nop
1454c5fa6:     	movq	0xf0(%rbp), %rdx
1454c5fad:     	testq	%rdx, %rdx
1454c5fb0:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c5fb2:     	movq	0xf8(%rbp), %rcx
1454c5fb9:     	shlq	$0x3, %rdx
1454c5fbd:     	movl	$0x8, %r8d
1454c5fc3:     	callq	0x1400021d0 <.text+0x11d0>

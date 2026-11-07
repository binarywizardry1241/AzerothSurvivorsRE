
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454beef0:     	pushq	%rbp
1454beef1:     	pushq	%r14
1454beef3:     	pushq	%rsi
1454beef4:     	pushq	%rdi
1454beef5:     	pushq	%rbx
1454beef6:     	subq	$0x80, %rsp
1454beefd:     	leaq	0x80(%rsp), %rbp
1454bef05:     	movq	$-0x2, -0x8(%rbp)
1454bef0d:     	movq	%r8, %rsi
1454bef10:     	movq	%rdx, %rdi
1454bef13:     	movq	%rcx, %rbx
1454bef16:     	movss	%xmm3, -0xc(%rbp)
1454bef1b:     	movq	0x210(%rcx), %rcx
1454bef22:     	movq	0x218(%rbx), %rdx
1454bef29:     	callq	0x14540e820 <.text+0x540d820>
1454bef2e:     	imulq	$0xf0, %rax, %rax
1454bef35:     	leaq	0x12574fc(%rip), %rcx   # 0x146716438
1454bef3c:     	leaq	(%rdi,%rsi,8), %rdx
1454bef40:     	movups	0x78(%rax,%rcx), %xmm0
1454bef45:     	movq	%rdi, -0x58(%rbp)
1454bef49:     	movq	%rdx, -0x50(%rbp)
1454bef4d:     	movups	%xmm0, -0x48(%rbp)
1454bef51:     	leaq	-0xc(%rbp), %rax
1454bef55:     	movq	%rax, -0x38(%rbp)
1454bef59:     	leaq	-0x30(%rbp), %rcx
1454bef5d:     	leaq	-0x58(%rbp), %rdx
1454bef61:     	callq	0x145536a90 <.text+0x5535a90>
1454bef66:     	movq	-0x28(%rbp), %r8
1454bef6a:     	movq	-0x20(%rbp), %r14
1454bef6e:     	testq	%r14, %r14
1454bef71:     	movq	%r8, -0x18(%rbp)
1454bef75:     	je	0x1454bef8f <.text+0x54bdf8f>
1454bef77:     	movl	%r14d, %eax
1454bef7a:     	andl	$0x7, %eax
1454bef7d:     	cmpq	$0x8, %r14
1454bef81:     	jae	0x1454bef99 <.text+0x54bdf99>
1454bef83:     	movss	0x4376f1(%rip), %xmm2   # 0x1458f667c
1454bef8b:     	xorl	%ecx, %ecx
1454bef8d:     	jmp	0x1454beff5 <.text+0x54bdff5>
1454bef8f:     	movss	0x4376f1(%rip), %xmm2   # 0x1458f6688
1454bef97:     	jmp	0x1454bf015 <.text+0x54be015>
1454bef99:     	movq	%r14, %rdx
1454bef9c:     	andq	$-0x8, %rdx
1454befa0:     	movss	0x4376d4(%rip), %xmm2   # 0x1458f667c
1454befa8:     	xorl	%ecx, %ecx
1454befaa:     	nopw	(%rax,%rax)
1454befb0:     	addss	(%r8,%rcx,4), %xmm2
1454befb6:     	addss	0x4(%r8,%rcx,4), %xmm2
1454befbd:     	addss	0x8(%r8,%rcx,4), %xmm2
1454befc4:     	addss	0xc(%r8,%rcx,4), %xmm2
1454befcb:     	addss	0x10(%r8,%rcx,4), %xmm2
1454befd2:     	addss	0x14(%r8,%rcx,4), %xmm2
1454befd9:     	addss	0x18(%r8,%rcx,4), %xmm2
1454befe0:     	addss	0x1c(%r8,%rcx,4), %xmm2
1454befe7:     	addq	$0x8, %rcx
1454befeb:     	cmpq	%rcx, %rdx
1454befee:     	jne	0x1454befb0 <.text+0x54bdfb0>
1454beff0:     	testq	%rax, %rax
1454beff3:     	je	0x1454bf00d <.text+0x54be00d>
1454beff5:     	leaq	(%r8,%rcx,4), %rcx
1454beff9:     	xorl	%edx, %edx
1454beffb:     	nopl	(%rax,%rax)
1454bf000:     	addss	(%rcx,%rdx,4), %xmm2
1454bf005:     	incq	%rdx
1454bf008:     	cmpq	%rdx, %rax
1454bf00b:     	jne	0x1454bf000 <.text+0x54be000>
1454bf00d:     	maxss	0x437673(%rip), %xmm2   # 0x1458f6688
1454bf015:     	addq	$0x880, %rbx            # imm = 0x880
1454bf01c:     	xorps	%xmm1, %xmm1
1454bf01f:     	movq	%rbx, %rcx
1454bf022:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454bf027:     	nop
1454bf028:     	testq	%r14, %r14
1454bf02b:     	movq	-0x18(%rbp), %r9
1454bf02f:     	je	0x1454bf05c <.text+0x54be05c>
1454bf031:     	shlq	$0x2, %r14
1454bf035:     	xorl	%ecx, %ecx
1454bf037:     	movq	%rdi, %rax
1454bf03a:     	nopw	(%rax,%rax)
1454bf040:     	movss	(%r9,%rcx,4), %xmm1
1454bf046:     	ucomiss	%xmm0, %xmm1
1454bf049:     	ja	0x1454bf074 <.text+0x54be074>
1454bf04b:     	incq	%rcx
1454bf04e:     	subss	%xmm1, %xmm0
1454bf052:     	addq	$0x8, %rax
1454bf056:     	addq	$-0x4, %r14
1454bf05a:     	jne	0x1454bf040 <.text+0x54be040>
1454bf05c:     	testq	%rsi, %rsi
1454bf05f:     	jne	0x1454bf07c <.text+0x54be07c>
1454bf061:     	leaq	0x14ec558(%rip), %r8    # 0x1469ab5c0
1454bf068:     	xorl	%ecx, %ecx
1454bf06a:     	xorl	%edx, %edx
1454bf06c:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454bf071:     	nop
1454bf072:     	jmp	0x1454bf0bb <.text+0x54be0bb>
1454bf074:     	movq	%rax, %rdi
1454bf077:     	cmpq	%rsi, %rcx
1454bf07a:     	jae	0x1454bf0ab <.text+0x54be0ab>
1454bf07c:     	movq	(%rdi), %rsi
1454bf07f:     	movq	-0x30(%rbp), %rdx
1454bf083:     	testq	%rdx, %rdx
1454bf086:     	je	0x1454bf09a <.text+0x54be09a>
1454bf088:     	shlq	$0x2, %rdx
1454bf08c:     	movl	$0x4, %r8d
1454bf092:     	movq	%r9, %rcx
1454bf095:     	callq	0x1400021d0 <.text+0x11d0>
1454bf09a:     	movq	%rsi, %rax
1454bf09d:     	addq	$0x80, %rsp
1454bf0a4:     	popq	%rbx
1454bf0a5:     	popq	%rdi
1454bf0a6:     	popq	%rsi
1454bf0a7:     	popq	%r14
1454bf0a9:     	popq	%rbp
1454bf0aa:     	retq
1454bf0ab:     	leaq	0x14ec526(%rip), %r8    # 0x1469ab5d8
1454bf0b2:     	movq	%rsi, %rdx
1454bf0b5:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454bf0ba:     	nop
1454bf0bb:     	ud2

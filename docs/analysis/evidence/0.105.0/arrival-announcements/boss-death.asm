
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145935754:     	incl	0x718(%rdi)
14593575a:     	movb	$0x0, 0x187(%rbp)
145935761:     	movq	%r12, %rcx
145935764:     	callq	0x1458746a0 <.text+0x58736a0>
145935769:     	nop
14593576a:     	movq	%rax, %r14
14593576d:     	movq	%rdx, %r13
145935770:     	movb	$0x0, 0x187(%rbp)
145935777:     	leaq	0x15445d1(%rip), %r15   # 0x146e79d4f
14593577e:     	movl	$0xd, %esi
145935783:     	movl	$0xd, %edx
145935788:     	movq	%r15, %rcx
14593578b:     	callq	0x1458da590 <.text+0x58d9590>
145935790:     	nop
145935791:     	testq	%rax, %rax
145935794:     	cmovneq	%rax, %r15
145935798:     	cmoveq	%rsi, %rdx
14593579c:     	movb	$0x0, 0x187(%rbp)
1459357a3:     	movq	%rdx, 0x28(%rsp)
1459357a8:     	movq	%r15, 0x20(%rsp)
1459357ad:     	leaq	0xb0(%rbp), %rcx
1459357b4:     	movq	0x170(%rbp), %rdx
1459357bb:     	movq	%r14, %r8
1459357be:     	movq	%r13, %r9
1459357c1:     	callq	0x1458aae00 <.text+0x58a9e00>
1459357c6:     	nop
1459357c7:     	movq	0x5e0(%rdi), %rsi
1459357ce:     	cmpq	0x5d0(%rdi), %rsi
1459357d5:     	jne	0x1459357e4 <.text+0x59347e4>
1459357d7:     	leaq	0x5d0(%rdi), %rcx
1459357de:     	callq	0x145bcb530 <.text+0x5bca530>
1459357e3:     	nop
1459357e4:     	movq	0x5d8(%rdi), %rax
1459357eb:     	movq	%rsi, %rcx
1459357ee:     	shlq	$0x5, %rcx
1459357f2:     	movups	0xb0(%rbp), %xmm0
1459357f9:     	movups	0xc0(%rbp), %xmm1
145935800:     	movups	%xmm1, 0x10(%rax,%rcx)
145935805:     	movups	%xmm0, (%rax,%rcx)
145935809:     	incq	%rsi
14593580c:     	movq	%rsi, 0x5e0(%rdi)


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b24bd:     	movq	0x368(%rbp), %r12
1454b24c4:     	movq	0x560(%r12), %rsi
1454b24cc:     	cmpq	0x550(%r12), %rsi
1454b24d4:     	jne	0x1454b24e3 <.text+0x54b14e3>
1454b24d6:     	movq	0x328(%rbp), %rcx
1454b24dd:     	callq	0x145774710 <.text+0x5773710>
1454b24e2:     	nop
1454b24e3:     	movq	0x558(%r12), %rax
1454b24eb:     	movq	%rsi, %rcx
1454b24ee:     	shlq	$0x5, %rcx
1454b24f2:     	movups	0xb0(%rbp), %xmm0
1454b24f9:     	movups	0xc0(%rbp), %xmm1
1454b2500:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b2505:     	movups	%xmm0, (%rax,%rcx)
1454b2509:     	incq	%rsi
1454b250c:     	movq	%rsi, 0x560(%r12)
1454b2514:     	movb	0x129(%r12), %bl
1454b251c:     	movb	$0x2, 0x129(%r12)
1454b2525:     	movzbl	0x28(%r15), %eax
1454b252a:     	movl	0x348(%rbp), %ecx
1454b2530:     	movb	%cl, 0x367(%rbp)
1454b2536:     	ucomiss	%xmm8, %xmm11
1454b253a:     	seta	0x28(%rsp)
1454b253f:     	movb	%al, 0x20(%rsp)
1454b2543:     	movb	$0x1, 0x30(%rsp)
1454b2548:     	movq	%r12, %rcx
1454b254b:     	movq	%rdi, %rdx
1454b254e:     	movaps	%xmm10, %xmm2
1454b2552:     	xorl	%r9d, %r9d
1454b2555:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b255a:     	nop
1454b255b:     	movq	0x368(%rbp), %rax
1454b2562:     	movb	%bl, 0x129(%rax)

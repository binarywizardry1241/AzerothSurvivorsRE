
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459354cf:     	leaq	0x1545ad2(%rip), %r15   # 0x146e7afa8
1459354d6:     	movl	$0x5e, %esi
1459354db:     	movl	$0x5e, %edx
1459354e0:     	movq	%r15, %rcx
1459354e3:     	callq	0x1458da590 <.text+0x58d9590>
1459354e8:     	nop
1459354e9:     	testq	%rax, %rax
1459354ec:     	cmovneq	%rax, %r15
1459354f0:     	cmoveq	%rsi, %rdx
1459354f4:     	movb	$0x0, 0x187(%rbp)
1459354fb:     	movq	%rdx, 0x20(%rsp)
145935500:     	leaq	0xb0(%rbp), %rcx
145935507:     	movq	0x178(%rbp), %rdx
14593550e:     	movq	%r14, %r8
145935511:     	movq	%r15, %r9
145935514:     	callq	0x1458a9500 <.text+0x58a8500>
145935519:     	nop
14593551a:     	movq	0x5e0(%rdi), %rsi
145935521:     	cmpq	0x5d0(%rdi), %rsi
145935528:     	jne	0x145935537 <.text+0x5934537>
14593552a:     	leaq	0x5d0(%rdi), %rcx
145935531:     	callq	0x145bcb530 <.text+0x5bca530>
145935536:     	nop
145935537:     	movq	0x5d8(%rdi), %rax
14593553e:     	movq	%rsi, %rcx
145935541:     	shlq	$0x5, %rcx
145935545:     	movups	0xb0(%rbp), %xmm0
14593554c:     	movups	0xc0(%rbp), %xmm1
145935553:     	movups	%xmm1, 0x10(%rax,%rcx)
145935558:     	movups	%xmm0, (%rax,%rcx)
14593555c:     	incq	%rsi
14593555f:     	movq	%rsi, 0x5e0(%rdi)


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b5335:     	cmpl	$0x0, 0x8ec(%rsi)
1454b533c:     	jne	0x1454b5373 <.text+0x54b4373>
1454b533e:     	jmp	0x1454b5392 <.text+0x54b4392>
1454b5340:     	xorl	%eax, %eax
1454b5342:     	movq	%r15, 0x20(%rbp)
1454b5346:     	movq	%rax, 0x28(%rbp)
1454b534a:     	movq	$0x0, 0x30(%rbp)
1454b5352:     	movq	%r9, 0x38(%rbp)
1454b5356:     	movq	$0x2cd, 0x40(%rbp)      # imm = 0x2CD
1454b535e:     	movq	%rbp, %rcx
1454b5361:     	leaq	0x20(%rbp), %rdx
1454b5365:     	callq	0x145427a50 <.text+0x5426a50>
1454b536a:     	cmpl	$0x0, 0x8ec(%rsi)
1454b5371:     	je	0x1454b5392 <.text+0x54b4392>
1454b5373:     	cmpb	$0x1, 0x95f(%rsi)
1454b537a:     	jne	0x1454b5392 <.text+0x54b4392>
1454b537c:     	cmpb	$0x0, 0x958(%rsi)
1454b5383:     	jne	0x1454b5392 <.text+0x54b4392>
1454b5385:     	movq	%rsi, %rcx
1454b5388:     	xorl	%edx, %edx
1454b538a:     	movb	$0x1, %r8b
1454b538d:     	callq	0x1454da5f0 <.text+0x54d95f0>

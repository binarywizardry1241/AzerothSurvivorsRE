
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145524410:     	pushq	%rsi
145524411:     	pushq	%rdi
145524412:     	movq	0x10(%rcx), %rax
145524416:     	testq	%rax, %rax
145524419:     	je	0x14552443e <.text+0x552343e>
14552441b:     	movq	0x8(%rcx), %r8
14552441f:     	movq	(%rdx), %r9
145524422:     	xorl	%edx, %edx
145524424:     	nopw	%cs:(%rax,%rax)
145524430:     	cmpq	%r9, (%r8,%rdx,8)
145524434:     	je	0x145524441 <.text+0x5523441>
145524436:     	incq	%rdx
145524439:     	cmpq	%rdx, %rax
14552443c:     	jne	0x145524430 <.text+0x5523430>
14552443e:     	popq	%rdi
14552443f:     	popq	%rsi
145524440:     	retq
145524441:     	leaq	0x1(%rdx), %r10
145524445:     	cmpq	%rax, %r10
145524448:     	jae	0x14552447b <.text+0x552347b>
14552444a:     	leaq	-0x2(%rax), %r11
14552444e:     	leal	(%rax,%rdx), %edi
145524451:     	movq	%rdx, %rsi
145524454:     	testb	$0x1, %dil
145524458:     	jne	0x145524473 <.text+0x5523473>
14552445a:     	movq	0x8(%r8,%rdx,8), %r10
14552445f:     	movq	%rdx, %rsi
145524462:     	cmpq	%r9, %r10
145524465:     	je	0x14552446f <.text+0x552346f>
145524467:     	movq	%r10, (%r8,%rdx,8)
14552446b:     	leaq	0x1(%rdx), %rsi
14552446f:     	leaq	0x2(%rdx), %r10
145524473:     	cmpq	%rdx, %r11
145524476:     	movq	%rsi, %rdx
145524479:     	jne	0x145524482 <.text+0x5523482>
14552447b:     	movq	%rdx, 0x10(%rcx)
14552447f:     	popq	%rdi
145524480:     	popq	%rsi
145524481:     	retq
145524482:     	movq	%rsi, %rdx
145524485:     	jmp	0x145524490 <.text+0x5523490>
145524487:     	addq	$0x2, %r10
14552448b:     	cmpq	%r10, %rax
14552448e:     	je	0x14552447b <.text+0x552347b>
145524490:     	movq	(%r8,%r10,8), %r11
145524494:     	cmpq	%r9, %r11
145524497:     	jne	0x1455244a5 <.text+0x55234a5>
145524499:     	movq	0x8(%r8,%r10,8), %r11
14552449e:     	cmpq	%r9, %r11
1455244a1:     	je	0x145524487 <.text+0x5523487>
1455244a3:     	jmp	0x1455244b6 <.text+0x55234b6>
1455244a5:     	movq	%r11, (%r8,%rdx,8)
1455244a9:     	incq	%rdx
1455244ac:     	movq	0x8(%r8,%r10,8), %r11
1455244b1:     	cmpq	%r9, %r11
1455244b4:     	je	0x145524487 <.text+0x5523487>
1455244b6:     	movq	%r11, (%r8,%rdx,8)
1455244ba:     	incq	%rdx
1455244bd:     	jmp	0x145524487 <.text+0x5523487>

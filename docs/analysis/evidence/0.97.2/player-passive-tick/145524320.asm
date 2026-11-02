
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145524320:     	pushq	%rsi
145524321:     	pushq	%rdi
145524322:     	movq	0x10(%rcx), %rax
145524326:     	testq	%rax, %rax
145524329:     	je	0x145524355 <.text+0x5523355>
14552432b:     	movq	0x8(%rcx), %r8
14552432f:     	movq	(%rdx), %rdx
145524332:     	leaq	0x10(%r8), %r11
145524336:     	movq	%rax, %r9
145524339:     	negq	%r9
14552433c:     	xorl	%r10d, %r10d
14552433f:     	nop
145524340:     	cmpq	%rdx, -0x10(%r11)
145524344:     	je	0x145524358 <.text+0x5523358>
145524346:     	incq	%r10
145524349:     	addq	$0x10, %r11
14552434d:     	movq	%r9, %rsi
145524350:     	addq	%r10, %rsi
145524353:     	jne	0x145524340 <.text+0x5523340>
145524355:     	popq	%rdi
145524356:     	popq	%rsi
145524357:     	retq
145524358:     	leaq	0x1(%r10), %rdi
14552435c:     	cmpq	%rax, %rdi
14552435f:     	jae	0x145524392 <.text+0x5523392>
145524361:     	movq	%r10, %r9
145524364:     	subq	%rax, %r9
145524367:     	leaq	0x2(%r9), %rsi
14552436b:     	testb	$0x1, %r9b
14552436f:     	jne	0x145524399 <.text+0x5523399>
145524371:     	movq	%r10, %r9
145524374:     	cmpq	%rdx, (%r11)
145524377:     	je	0x145524386 <.text+0x5523386>
145524379:     	movups	(%r11), %xmm0
14552437d:     	movups	%xmm0, -0x10(%r11)
145524382:     	leaq	0x1(%r10), %r9
145524386:     	addq	$0x2, %r10
14552438a:     	movq	%r10, %rdi
14552438d:     	movq	%r9, %r10
145524390:     	jmp	0x145524399 <.text+0x5523399>
145524392:     	movq	%r10, 0x10(%rcx)
145524396:     	popq	%rdi
145524397:     	popq	%rsi
145524398:     	retq
145524399:     	testq	%rsi, %rsi
14552439c:     	je	0x1455243fa <.text+0x55233fa>
14552439e:     	subq	%rdi, %rax
1455243a1:     	shlq	$0x4, %rdi
1455243a5:     	leaq	(%rdi,%r8), %r11
1455243a9:     	addq	$0x10, %r11
1455243ad:     	movq	%r10, %r9
1455243b0:     	jmp	0x1455243bc <.text+0x55233bc>
1455243b2:     	addq	$0x20, %r11
1455243b6:     	addq	$-0x2, %rax
1455243ba:     	je	0x1455243fa <.text+0x55233fa>
1455243bc:     	cmpq	%rdx, -0x10(%r11)
1455243c0:     	jne	0x1455243c9 <.text+0x55233c9>
1455243c2:     	cmpq	%rdx, (%r11)
1455243c5:     	je	0x1455243b2 <.text+0x55233b2>
1455243c7:     	jmp	0x1455243e5 <.text+0x55233e5>
1455243c9:     	leaq	-0x10(%r11), %r10
1455243cd:     	movq	%r9, %rsi
1455243d0:     	shlq	$0x4, %rsi
1455243d4:     	movups	(%r10), %xmm0
1455243d8:     	movups	%xmm0, (%r8,%rsi)
1455243dd:     	incq	%r9
1455243e0:     	cmpq	%rdx, (%r11)
1455243e3:     	je	0x1455243b2 <.text+0x55233b2>
1455243e5:     	movq	%r9, %r10
1455243e8:     	shlq	$0x4, %r10
1455243ec:     	movups	(%r11), %xmm0
1455243f0:     	movups	%xmm0, (%r8,%r10)
1455243f5:     	incq	%r9
1455243f8:     	jmp	0x1455243b2 <.text+0x55233b2>
1455243fa:     	movq	%r9, 0x10(%rcx)
1455243fe:     	popq	%rdi
1455243ff:     	popq	%rsi
145524400:     	retq

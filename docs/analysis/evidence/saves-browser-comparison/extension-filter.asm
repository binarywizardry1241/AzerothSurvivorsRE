
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402852f0:     	pushq	%rbp
1402852f1:     	pushq	%rsi
1402852f2:     	subq	$0x58, %rsp
1402852f6:     	leaq	0x50(%rsp), %rbp
1402852fb:     	movq	$-0x2, (%rbp)
140285303:     	leaq	-0x28(%rbp), %rcx
140285307:     	callq	0x145709e80 <.text+0x5708e80>
14028530c:     	movq	-0x20(%rbp), %rcx
140285310:     	movq	-0x18(%rbp), %rdx
140285314:     	movq	%rcx, -0x8(%rbp)
140285318:     	callq	0x145702f60 <.text+0x5701f60>
14028531d:     	nop
14028531e:     	testq	%rax, %rax
140285321:     	setne	%cl
140285324:     	cmpq	$0x3, %rdx
140285328:     	sete	%dl
14028532b:     	andb	%cl, %dl
14028532d:     	cmpb	$0x1, %dl
140285330:     	jne	0x140285383 <.text+0x284383>
140285332:     	movzbl	(%rax), %ecx
140285335:     	leal	-0x41(%rcx), %edx
140285338:     	cmpb	$0x1a, %dl
14028533b:     	setb	%dl
14028533e:     	shlb	$0x5, %dl
140285341:     	orb	%cl, %dl
140285343:     	cmpb	$0x73, %dl
140285346:     	jne	0x140285383 <.text+0x284383>
140285348:     	movzbl	0x1(%rax), %ecx
14028534c:     	leal	-0x41(%rcx), %edx
14028534f:     	cmpb	$0x1a, %dl
140285352:     	setb	%dl
140285355:     	shlb	$0x5, %dl
140285358:     	orb	%cl, %dl
14028535a:     	cmpb	$0x61, %dl
14028535d:     	jne	0x140285383 <.text+0x284383>
14028535f:     	movzbl	0x2(%rax), %eax
140285363:     	leal	-0x41(%rax), %ecx
140285366:     	cmpb	$0x1a, %cl
140285369:     	setb	%cl
14028536c:     	shlb	$0x5, %cl
14028536f:     	orb	%al, %cl
140285371:     	cmpb	$0x76, %cl
140285374:     	sete	%sil
140285378:     	movq	-0x28(%rbp), %rdx
14028537c:     	testq	%rdx, %rdx
14028537f:     	jne	0x14028538e <.text+0x28438e>
140285381:     	jmp	0x14028539d <.text+0x28439d>
140285383:     	xorl	%esi, %esi
140285385:     	movq	-0x28(%rbp), %rdx
140285389:     	testq	%rdx, %rdx
14028538c:     	je	0x14028539d <.text+0x28439d>
14028538e:     	movl	$0x1, %r8d
140285394:     	movq	-0x8(%rbp), %rcx
140285398:     	callq	0x1400021d0 <.text+0x11d0>
14028539d:     	movl	%esi, %eax
14028539f:     	addq	$0x58, %rsp
1402853a3:     	popq	%rsi
1402853a4:     	popq	%rbp
1402853a5:     	retq

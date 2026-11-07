
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145889778:     	movq	0x1c8(%rbp), %rcx
14588977f:     	cmpq	$0x3, 0x1d0(%rbp)
145889787:     	jne	0x1458897a0 <.text+0x58887a0>
145889789:     	cmpq	$0x4, 0x8(%rcx)
14588978e:     	jne	0x1458897a0 <.text+0x58887a0>
145889790:     	movq	(%rcx), %rax
145889793:     	cmpl	$0x74616562, (%rax)     # imm = 0x74616562
145889799:     	je	0x1458897d3 <.text+0x58887d3>
14588979b:     	nopl	(%rax,%rax)
1458897a0:     	movq	0x1c0(%rbp), %rdx
1458897a7:     	testq	%rdx, %rdx
1458897aa:     	je	0x145889650 <.text+0x5888650>
1458897b0:     	shlq	$0x4, %rdx
1458897b4:     	movl	$0x8, %r8d
1458897ba:     	callq	0x1400021d0 <.text+0x11d0>
1458897bf:     	movzbl	0x361(%rbp), %eax
1458897c6:     	testb	$0x1, %al
1458897c8:     	je	0x14588965f <.text+0x588865f>
1458897ce:     	jmp	0x1458893a4 <.text+0x58883a4>
1458897d3:     	movq	0x18(%rcx), %rdx
1458897d7:     	testq	%rdx, %rdx
1458897da:     	je	0x1458897a0 <.text+0x58887a0>
1458897dc:     	movq	0x10(%rcx), %r11
1458897e0:     	cmpq	$0x1, %rdx
1458897e4:     	jne	0x1458897f8 <.text+0x58887f8>
1458897e6:     	movzbl	(%r11), %r8d
1458897ea:     	cmpl	$0x2b, %r8d
1458897ee:     	je	0x1458897a0 <.text+0x58887a0>
1458897f0:     	cmpl	$0x2d, %r8d
1458897f4:     	je	0x1458897a0 <.text+0x58887a0>
1458897f6:     	jmp	0x1458897fc <.text+0x58887fc>
1458897f8:     	movzbl	(%r11), %r8d
1458897fc:     	xorl	%eax, %eax
1458897fe:     	cmpb	$0x2b, %r8b
145889802:     	sete	%al
145889805:     	movq	%rdx, %r8
145889808:     	subq	%rax, %r8
14588980b:     	addq	%rax, %r11
14588980e:     	cmpq	$0x3, %r8
145889812:     	jae	0x14588984e <.text+0x588884e>
145889814:     	testq	%r8, %r8
145889817:     	je	0x145889893 <.text+0x5888893>
145889819:     	movzbl	(%r11), %eax
14588981d:     	addl	$-0x30, %eax
145889820:     	cmpl	$0x9, %eax
145889823:     	ja	0x1458897a0 <.text+0x58887a0>
145889829:     	cmpq	$0x1, %r8
14588982d:     	je	0x145889895 <.text+0x5888895>
14588982f:     	movzbl	0x1(%r11), %edx
145889834:     	addl	$-0x30, %edx
145889837:     	cmpl	$0x9, %edx
14588983a:     	ja	0x1458897a0 <.text+0x58887a0>
145889840:     	movzbl	%al, %eax
145889843:     	addl	%eax, %eax
145889845:     	leal	(%rax,%rax,4), %eax
145889848:     	addb	%al, %dl
14588984a:     	movl	%edx, %eax
14588984c:     	jmp	0x145889895 <.text+0x5888895>
14588984e:     	negq	%rax
145889851:     	addq	%rax, %rdx
145889854:     	negq	%rdx
145889857:     	xorl	%r8d, %r8d
14588985a:     	xorl	%eax, %eax
14588985c:     	movq	%rdx, %r9
14588985f:     	addq	%r8, %r9
145889862:     	je	0x145889895 <.text+0x5888895>
145889864:     	mulb	%bl
145889866:     	jo	0x1458897a0 <.text+0x58887a0>
14588986c:     	movzbl	(%r11,%r8), %r10d
145889871:     	addl	$-0x30, %r10d
145889875:     	addb	%r10b, %al
145889878:     	setb	%r9b
14588987c:     	cmpl	$0x9, %r10d
145889880:     	ja	0x1458897a0 <.text+0x58887a0>
145889886:     	incq	%r8
145889889:     	testb	%r9b, %r9b
14588988c:     	je	0x14588985c <.text+0x588885c>
14588988e:     	jmp	0x1458897a0 <.text+0x58887a0>
145889893:     	xorl	%eax, %eax
145889895:     	movb	%al, 0xe0(%rbp)
14588989b:     	movq	0x20(%rcx), %rax
14588989f:     	movq	%rcx, 0x3a8(%rbp)
1458898a6:     	movq	0x28(%rcx), %rcx
1458898aa:     	movq	$0x0, 0x248(%rbp)
1458898b5:     	movq	%rcx, 0x250(%rbp)
1458898bc:     	movq	%rax, 0x258(%rbp)
1458898c3:     	movq	%rcx, 0x260(%rbp)
1458898ca:     	movq	$0x0, 0x268(%rbp)
1458898d5:     	movq	%rcx, 0x270(%rbp)
1458898dc:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
1458898e6:     	movq	%rax, 0x278(%rbp)
1458898ed:     	movb	$0x1, 0x280(%rbp)
1458898f4:     	movw	$0x1, 0x288(%rbp)
1458898fd:     	leaq	0xe0(%rbp), %rax
145889904:     	movq	%rax, 0x240(%rbp)
14588990b:     	movq	%r12, %rcx
14588990e:     	movq	%r14, %rdx
145889911:     	callq	0x145996570 <.text+0x5995570>

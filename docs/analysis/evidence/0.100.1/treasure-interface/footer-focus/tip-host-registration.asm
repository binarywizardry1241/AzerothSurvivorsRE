
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140205300:     	pushq	%rbp
140205301:     	pushq	%rsi
140205302:     	pushq	%rdi
140205303:     	pushq	%rbx
140205304:     	subq	$0xc8, %rsp
14020530b:     	leaq	0x80(%rsp), %rbp
140205313:     	movaps	%xmm6, 0x30(%rbp)
140205317:     	movq	$-0x2, 0x28(%rbp)
14020531f:     	movq	%rcx, %rsi
140205322:     	movq	0x18(%rcx), %rcx
140205326:     	cmpq	$0x0, 0x30(%rcx)
14020532b:     	je	0x1402053cb <.text+0x2043cb>
140205331:     	movabsq	$0x1b33240343d58077, %rdx # imm = 0x1B33240343D58077
14020533b:     	movq	0x18(%rcx), %rax
14020533f:     	movq	0x20(%rcx), %r8
140205343:     	xorl	%r9d, %r9d
140205346:     	movdqa	0x570e012(%rip), %xmm0  # 0x145913360
14020534e:     	pcmpeqd	%xmm1, %xmm1
140205352:     	movdqa	0x5746136(%rip), %xmm2  # 0x14594b490
14020535a:     	andq	%r8, %rdx
14020535d:     	movdqu	(%rax,%rdx), %xmm3
140205362:     	movdqa	%xmm3, %xmm4
140205366:     	pcmpeqb	%xmm0, %xmm4
14020536a:     	pmovmskb	%xmm4, %r10d
14020536f:     	testl	%r10d, %r10d
140205372:     	je	0x1402053b0 <.text+0x2043b0>
140205374:     	tzcntl	%r10d, %r11d
140205379:     	addq	%rdx, %r11
14020537c:     	andq	%r8, %r11
14020537f:     	negq	%r11
140205382:     	leaq	(%r11,%r11,2), %r11
140205386:     	movdqu	-0x18(%rax,%r11,8), %xmm4
14020538d:     	pcmpeqb	%xmm2, %xmm4
140205391:     	pmovmskb	%xmm4, %edi
140205395:     	cmpl	$0xffff, %edi           # imm = 0xFFFF
14020539b:     	je	0x140205482 <.text+0x204482>
1402053a1:     	leal	-0x1(%r10), %r11d
1402053a5:     	andw	%r10w, %r11w
1402053a9:     	movl	%r11d, %r10d
1402053ac:     	jne	0x140205374 <.text+0x204374>
1402053ae:     	nop
1402053b0:     	pcmpeqb	%xmm1, %xmm3
1402053b4:     	pmovmskb	%xmm3, %r10d
1402053b9:     	testl	%r10d, %r10d
1402053bc:     	jne	0x1402053cb <.text+0x2043cb>
1402053be:     	addq	%r9, %rdx
1402053c1:     	addq	$0x10, %rdx
1402053c5:     	addq	$0x10, %r9
1402053c9:     	jmp	0x14020535a <.text+0x20435a>
1402053cb:     	movzbl	0x60(%rcx), %eax
1402053cf:     	movq	0x80(%rcx), %rax
1402053d6:     	movq	0x88(%rcx), %rdx
1402053dd:     	movabsq	$0x1b33240343d58077, %r8 # imm = 0x1B33240343D58077
1402053e7:     	xorl	%r9d, %r9d
1402053ea:     	movdqa	0x570df6e(%rip), %xmm0  # 0x145913360
1402053f2:     	pcmpeqd	%xmm1, %xmm1
1402053f6:     	movdqa	0x5746092(%rip), %xmm2  # 0x14594b490
1402053fe:     	andq	%rdx, %r8
140205401:     	movdqu	(%rax,%r8), %xmm3
140205407:     	movdqa	%xmm3, %xmm4
14020540b:     	pcmpeqb	%xmm0, %xmm4
14020540f:     	pmovmskb	%xmm4, %edi
140205413:     	testl	%edi, %edi
140205415:     	je	0x140205460 <.text+0x204460>
140205417:     	tzcntl	%edi, %r11d
14020541c:     	addq	%r8, %r11
14020541f:     	andq	%rdx, %r11
140205422:     	movq	%r11, %rbx
140205425:     	shlq	$0x7, %rbx
140205429:     	movq	%rax, %r10
14020542c:     	subq	%rbx, %r10
14020542f:     	movdqu	-0x80(%r10), %xmm4
140205435:     	pcmpeqb	%xmm2, %xmm4
140205439:     	pmovmskb	%xmm4, %ebx
14020543d:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
140205443:     	je	0x14020549f <.text+0x20449f>
140205445:     	leal	-0x1(%rdi), %r10d
140205449:     	andw	%di, %r10w
14020544d:     	movl	%r10d, %edi
140205450:     	jne	0x140205417 <.text+0x204417>
140205452:     	nopw	%cs:(%rax,%rax)
140205460:     	pcmpeqb	%xmm1, %xmm3
140205464:     	pmovmskb	%xmm3, %r10d
140205469:     	testl	%r10d, %r10d
14020546c:     	jne	0x140205511 <.text+0x204511>
140205472:     	addq	%r9, %r8
140205475:     	addq	$0x10, %r8
140205479:     	addq	$0x10, %r9
14020547d:     	jmp	0x1402053fe <.text+0x2043fe>
140205482:     	leaq	(%rax,%r11,8), %rax
140205486:     	movq	-0x8(%rax), %rdi
14020548a:     	movq	0x8(%rsi), %rdx
14020548e:     	movq	0x10(%rsi), %r8
140205492:     	movq	%rdi, %r9
140205495:     	callq	0x144ea41f0 <.text+0x4ea31f0>
14020549a:     	jmp	0x1402056d8 <.text+0x2046d8>
14020549f:     	leaq	-0x10(%r11), %r8
1402054a3:     	andq	%rdx, %r8
1402054a6:     	movdqu	(%rax,%r8), %xmm0
1402054ac:     	pcmpeqd	%xmm1, %xmm1
1402054b0:     	pcmpeqb	%xmm1, %xmm0
1402054b4:     	pmovmskb	%xmm0, %edx
1402054b8:     	movdqu	(%rax,%r11), %xmm0
1402054be:     	pcmpeqb	%xmm1, %xmm0
1402054c2:     	pmovmskb	%xmm0, %r9d
1402054c7:     	movw	$0x1f, %di
1402054cb:     	bsrw	%dx, %di
1402054cf:     	xorl	$0xf, %edi
1402054d2:     	orl	$0x10000, %r9d          # imm = 0x10000
1402054d9:     	tzcntl	%r9d, %r9d
1402054de:     	addl	%edi, %r9d
1402054e1:     	movb	$-0x80, %dl
1402054e3:     	cmpw	$0xf, %r9w
1402054e8:     	ja	0x1402054f3 <.text+0x2044f3>
1402054ea:     	incq	0x90(%rcx)
1402054f1:     	movb	$-0x1, %dl
1402054f3:     	movb	%dl, (%rax,%r11)
1402054f7:     	movb	%dl, 0x10(%rax,%r8)
1402054fc:     	decq	0x98(%rcx)
140205503:     	movq	-0x70(%r10), %rax
140205507:     	cmpq	$0x2, %rax
14020550b:     	jne	0x14020567f <.text+0x20467f>
140205511:     	movq	0x20(%rsi), %rax
140205515:     	movq	(%rax), %rdi
140205518:     	leaq	0x1(%rdi), %rdx
14020551c:     	movq	%rdx, (%rax)
14020551f:     	movw	$0x100, (%rbp)          # imm = 0x100
140205525:     	movq	$0x1, -0x50(%rbp)
14020552d:     	movups	0x574c59c(%rip), %xmm0  # 0x145951ad0
140205534:     	movups	%xmm0, -0x48(%rbp)
140205538:     	movq	$0x1, -0x28(%rbp)
140205540:     	movq	$0x0, -0x20(%rbp)
140205548:     	movq	$0x0, -0x8(%rbp)
140205550:     	movb	$0x1, 0x2(%rbp)
140205554:     	movq	$0x0, -0x38(%rbp)
14020555c:     	movb	$0x2, -0x18(%rbp)
140205560:     	leaq	-0x50(%rbp), %r8
140205564:     	movq	%rcx, %rbx
140205567:     	movq	%rdi, %rdx
14020556a:     	callq	0x140044810 <.text+0x43810>
14020556f:     	addq	$0x18, %rbx
140205573:     	leaq	0x574658e(%rip), %rdx   # 0x14594bb08
14020557a:     	movq	%rbx, %rcx
14020557d:     	movq	%rdi, %r8
140205580:     	callq	0x14000ecd0 <.text+0xdcd0>
140205585:     	movq	0x10(%rsi), %rbx
140205589:     	cmpq	(%rsi), %rbx
14020558c:     	jne	0x140205596 <.text+0x204596>
14020558e:     	movq	%rsi, %rcx
140205591:     	callq	0x145774550 <.text+0x5773550>
140205596:     	movq	0x8(%rsi), %rax
14020559a:     	movq	%rdi, (%rax,%rbx,8)
14020559e:     	incq	%rbx
1402055a1:     	movq	%rbx, 0x10(%rsi)
1402055a5:     	movq	$0x0, -0x50(%rbp)
1402055ad:     	movq	$0x8, -0x48(%rbp)
1402055b5:     	movq	$0x0, -0x40(%rbp)
1402055bd:     	movups	0x5746dcc(%rip), %xmm0  # 0x14594c390
1402055c4:     	movups	%xmm0, -0x38(%rbp)
1402055c8:     	movups	0x5746dd1(%rip), %xmm1  # 0x14594c3a0
1402055cf:     	movups	%xmm1, -0x28(%rbp)
1402055d3:     	movq	$0x0, -0x18(%rbp)
1402055db:     	movq	$0x8, -0x10(%rbp)
1402055e3:     	movq	$0x0, -0x8(%rbp)
1402055eb:     	movups	%xmm0, (%rbp)
1402055ef:     	movups	%xmm1, 0x10(%rbp)
1402055f3:     	movq	0x18(%rsi), %rcx
1402055f7:     	movb	$0x1, 0x27(%rbp)
1402055fb:     	leaq	-0x50(%rbp), %r8
1402055ff:     	movq	%rdi, %rdx
140205602:     	callq	0x144e52cb0 <.text+0x4e51cb0>
140205607:     	nop
140205608:     	movq	0x10(%rsi), %rax
14020560c:     	testq	%rax, %rax
14020560f:     	je	0x140205618 <.text+0x204618>
140205611:     	decq	%rax
140205614:     	movq	%rax, 0x10(%rsi)
140205618:     	movq	0x18(%rsi), %rax
14020561c:     	movq	0x8(%rax), %rax
140205620:     	imulq	$0x130, %rdi, %rcx      # imm = 0x130
140205627:     	addq	%rax, %rcx
14020562a:     	addq	$0x58, %rcx
14020562e:     	movq	%rcx, -0x58(%rbp)
140205632:     	callq	0x1400091b0 <.text+0x81b0>
140205637:     	nop
140205638:     	movdqu	-0x50(%rbp), %xmm0
14020563d:     	movdqu	-0x40(%rbp), %xmm1
140205642:     	movdqu	-0x30(%rbp), %xmm2
140205647:     	movdqu	-0x20(%rbp), %xmm3
14020564c:     	movdqu	-0x10(%rbp), %xmm4
140205651:     	movups	(%rbp), %xmm5
140205655:     	movups	0x10(%rbp), %xmm6
140205659:     	movq	-0x58(%rbp), %rax
14020565d:     	movups	%xmm6, 0x60(%rax)
140205661:     	movups	%xmm5, 0x50(%rax)
140205665:     	movdqu	%xmm4, 0x40(%rax)
14020566a:     	movdqu	%xmm3, 0x30(%rax)
14020566f:     	movdqu	%xmm2, 0x20(%rax)
140205674:     	movdqu	%xmm1, 0x10(%rax)
140205679:     	movdqu	%xmm0, (%rax)
14020567d:     	jmp	0x1402056d8 <.text+0x2046d8>
14020567f:     	movq	-0x8(%r10), %rcx
140205683:     	movq	%rcx, 0x18(%rbp)
140205687:     	movups	-0x18(%r10), %xmm0
14020568c:     	movups	%xmm0, 0x8(%rbp)
140205690:     	movups	-0x28(%r10), %xmm0
140205695:     	movups	%xmm0, -0x8(%rbp)
140205699:     	movdqu	-0x68(%r10), %xmm0
14020569f:     	movdqu	-0x58(%r10), %xmm1
1402056a5:     	movdqu	-0x48(%r10), %xmm2
1402056ab:     	movdqu	-0x38(%r10), %xmm3
1402056b1:     	movdqu	%xmm3, -0x18(%rbp)
1402056b6:     	movdqu	%xmm2, -0x28(%rbp)
1402056bb:     	movdqu	%xmm1, -0x38(%rbp)
1402056c0:     	movdqu	%xmm0, -0x48(%rbp)
1402056c5:     	movq	%rax, -0x50(%rbp)
1402056c9:     	leaq	-0x50(%rbp), %rcx
1402056cd:     	movq	%rsi, %rdx
1402056d0:     	callq	0x144e17460 <.text+0x4e16460>
1402056d5:     	movq	%rax, %rdi
1402056d8:     	movl	$0x1, %eax
1402056dd:     	movq	%rdi, %rdx
1402056e0:     	movaps	0x30(%rbp), %xmm6
1402056e4:     	addq	$0xc8, %rsp
1402056eb:     	popq	%rbx
1402056ec:     	popq	%rdi
1402056ed:     	popq	%rsi
1402056ee:     	popq	%rbp
1402056ef:     	retq


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145918596:     	movq	0x780(%r13), %rdx
14591859d:     	testq	%rdx, %rdx
1459185a0:     	leaq	0x140(%rbp), %rsi
1459185a7:     	je	0x1459187ae <.text+0x59177ae>
1459185ad:     	movq	0x778(%r13), %rax
1459185b4:     	cmpq	$0x1, %rdx
1459185b8:     	jne	0x1459185c6 <.text+0x59175c6>
1459185ba:     	movss	0x4586ae(%rip), %xmm6   # 0x145d70c70
1459185c2:     	xorl	%ecx, %ecx
1459185c4:     	jmp	0x14591861a <.text+0x591761a>
1459185c6:     	movq	%rdx, %r8
1459185c9:     	andq	$-0x2, %r8
1459185cd:     	movss	0x45869b(%rip), %xmm6   # 0x145d70c70
1459185d5:     	xorl	%ecx, %ecx
1459185d7:     	jmp	0x1459185e9 <.text+0x59175e9>
1459185d9:     	nopl	(%rax)
1459185e0:     	addq	$0x2, %rcx
1459185e4:     	cmpq	%rcx, %r8
1459185e7:     	je	0x145918615 <.text+0x5917615>
1459185e9:     	cmpb	$0x20, (%rax,%rcx,8)
1459185ed:     	je	0x145918600 <.text+0x5917600>
1459185ef:     	cmpb	$0x20, 0x8(%rax,%rcx,8)
1459185f4:     	jne	0x1459185e0 <.text+0x59175e0>
1459185f6:     	jmp	0x14591860d <.text+0x591760d>
1459185f8:     	nopl	(%rax,%rax)
145918600:     	addss	0x4(%rax,%rcx,8), %xmm6
145918606:     	cmpb	$0x20, 0x8(%rax,%rcx,8)
14591860b:     	jne	0x1459185e0 <.text+0x59175e0>
14591860d:     	addss	0xc(%rax,%rcx,8), %xmm6
145918613:     	jmp	0x1459185e0 <.text+0x59175e0>
145918615:     	testb	$0x1, %dl
145918618:     	je	0x145918626 <.text+0x5917626>
14591861a:     	cmpb	$0x20, (%rax,%rcx,8)
14591861e:     	jne	0x145918626 <.text+0x5917626>
145918620:     	addss	0x4(%rax,%rcx,8), %xmm6
145918626:     	xorps	%xmm0, %xmm0
145918629:     	ucomiss	%xmm0, %xmm6
14591862c:     	jbe	0x1459187ae <.text+0x59177ae>
145918632:     	movq	0x7b0(%r13), %rsi
145918639:     	movq	%rsi, %rdi
14591863c:     	shlq	$0x6, %rdi
145918640:     	movq	%rsi, %rax
145918643:     	shrq	$0x3a, %rax
145918647:     	setne	%al
14591864a:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
145918654:     	cmpq	%rcx, %rdi
145918657:     	seta	%cl
14591865a:     	orb	%al, %cl
14591865c:     	je	0x14591866e <.text+0x591766e>
14591865e:     	xorl	%r15d, %r15d
145918661:     	movq	%r15, %rcx
145918664:     	movq	%rdi, %rdx
145918667:     	callq	0x145d6944b <.text+0x5d6844b>
14591866c:     	ud2
14591866e:     	movq	0x7a8(%r13), %r14
145918675:     	testq	%rdi, %rdi
145918678:     	je	0x1459186af <.text+0x59176af>
14591867a:     	callq	0x140002200 <.text+0x1200>
14591867f:     	movl	$0x8, %r15d
145918685:     	movl	$0x8, %edx
14591868a:     	movq	%rdi, %rcx
14591868d:     	callq	0x1400021c0 <.text+0x11c0>
145918692:     	movq	%rax, 0x190(%rbp)
145918699:     	testq	%rax, %rax
14591869c:     	je	0x145918661 <.text+0x5917661>
14591869e:     	movq	%rsi, 0x180(%rbp)
1459186a5:     	testq	%rsi, %rsi
1459186a8:     	jne	0x1459186cf <.text+0x59176cf>
1459186aa:     	jmp	0x145918785 <.text+0x5917785>
1459186af:     	movl	$0x8, %eax
1459186b4:     	movq	%rax, 0x190(%rbp)
1459186bb:     	movq	$0x0, 0x180(%rbp)
1459186c6:     	testq	%rsi, %rsi
1459186c9:     	je	0x145918785 <.text+0x5917785>
1459186cf:     	movq	0x190(%rbp), %rbx
1459186d6:     	movq	%rbx, %rcx
1459186d9:     	movq	%r14, %rdx
1459186dc:     	movq	%rdi, %r8
1459186df:     	callq	0x145bc977b <.text+0x5bc877b>
1459186e4:     	addq	%rbx, %rdi
1459186e7:     	addss	0x454c7d(%rip), %xmm6   # 0x145d6d36c
1459186ef:     	xorl	%esi, %esi
1459186f1:     	movss	0x454e17(%rip), %xmm7   # 0x145d6d510
1459186f9:     	movss	0x454c6a(%rip), %xmm8   # 0x145d6d36c
145918702:     	jmp	0x14591874e <.text+0x591774e>
145918704:     	nopw	%cs:(%rax,%rax)
145918710:     	cmpb	$0x1, %al
145918712:     	adcb	$-0x1, %al
145918714:     	movzbl	%al, %eax
145918717:     	xorps	%xmm0, %xmm0
14591871a:     	cvtsi2ss	%eax, %xmm0
14591871e:     	mulss	%xmm7, %xmm0
145918722:     	addss	%xmm8, %xmm0
145918727:     	mulss	%xmm6, %xmm0
14591872b:     	movq	%rsi, 0x20(%rsp)
145918730:     	movss	%xmm0, 0x28(%rsp)
145918736:     	movq	%r13, %rcx
145918739:     	xorl	%r8d, %r8d
14591873c:     	callq	0x14594e4f0 <.text+0x594d4f0>
145918741:     	nop
145918742:     	addq	$0x40, %rbx
145918746:     	incq	%rsi
145918749:     	cmpq	%rdi, %rbx
14591874c:     	je	0x145918785 <.text+0x5917785>
14591874e:     	movzbl	(%rbx), %eax
145918751:     	cmpb	$-0x1, %al
145918753:     	je	0x145918785 <.text+0x5917785>
145918755:     	cmpb	$0x21, %al
145918757:     	jne	0x145918742 <.text+0x5917742>
145918759:     	movzbl	0x1(%rbx), %eax
14591875d:     	movq	0x10(%rbx), %rdx
145918761:     	movq	0xd0(%r13), %r8
145918768:     	imulq	$0x78, 0xd8(%r13), %rcx
145918770:     	testq	%rcx, %rcx
145918773:     	je	0x145918710 <.text+0x5917710>
145918775:     	addq	$-0x78, %rcx
145918779:     	cmpq	%rdx, 0x18(%r8)
14591877d:     	leaq	0x78(%r8), %r8
145918781:     	jne	0x145918770 <.text+0x5917770>
145918783:     	jmp	0x145918742 <.text+0x5917742>
145918785:     	movq	0x180(%rbp), %rdx
14591878c:     	testq	%rdx, %rdx
14591878f:     	leaq	0x140(%rbp), %rsi
145918796:     	je	0x1459187ae <.text+0x59177ae>
145918798:     	shlq	$0x6, %rdx
14591879c:     	movl	$0x8, %r8d
1459187a2:     	movq	0x190(%rbp), %rcx
1459187a9:     	callq	0x1400021d0 <.text+0x11d0>

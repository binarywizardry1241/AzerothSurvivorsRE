
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145932640:     	pushq	%rsi
145932641:     	pushq	%rdi
145932642:     	pushq	%rbx
145932643:     	subq	$0x30, %rsp
145932647:     	movq	0x738(%rcx), %rdi
14593264e:     	testq	%rdi, %rdi
145932651:     	je	0x14593273e <.text+0x593173e>
145932657:     	movq	0x730(%rcx), %rax
14593265e:     	movss	(%rax), %xmm0
145932662:     	ucomiss	0x9ec(%rcx), %xmm0
145932669:     	ja	0x14593273e <.text+0x593173e>
14593266f:     	movq	0x970(%rcx), %r8
145932676:     	movq	0x958(%rcx), %r9
14593267d:     	movq	0x960(%rcx), %r10
145932684:     	leaq	(%r8,%r9), %r11
145932688:     	rolq	$0x17, %r11
14593268c:     	addq	%r9, %r11
14593268f:     	movq	%r10, %rsi
145932692:     	shlq	$0x11, %rsi
145932696:     	movq	0x968(%rcx), %rbx
14593269d:     	xorq	%r9, %rbx
1459326a0:     	xorq	%r10, %r8
1459326a3:     	xorq	%rbx, %r10
1459326a6:     	movq	%r10, 0x960(%rcx)
1459326ad:     	xorq	%r8, %r9
1459326b0:     	movq	%r9, 0x958(%rcx)
1459326b7:     	xorq	%rsi, %rbx
1459326ba:     	movq	%rbx, 0x968(%rcx)
1459326c1:     	shrq	$0x28, %r11
1459326c5:     	xorps	%xmm0, %xmm0
1459326c8:     	cvtsi2ss	%r11d, %xmm0
1459326cd:     	rolq	$0x2d, %r8
1459326d1:     	mulss	0x51a71b(%rip), %xmm0   # 0x145e4cdf4
1459326d9:     	movq	%r8, 0x970(%rcx)
1459326e0:     	ucomiss	0x43b06d(%rip), %xmm0   # 0x145d6d754
1459326e7:     	jae	0x14593273e <.text+0x593173e>
1459326e9:     	leaq	0x8(%rax), %r9
1459326ed:     	leaq	-0x8(,%rdi,8), %r8
1459326f5:     	decq	%rdi
1459326f8:     	movq	%rcx, %rsi
1459326fb:     	movq	%rax, %rcx
1459326fe:     	movq	%rdx, %rbx
145932701:     	movq	%r9, %rdx
145932704:     	callq	0x145bc978d <.text+0x5bc878d>
145932709:     	movq	%rdi, 0x738(%rsi)
145932710:     	movss	0x8(%rbx), %xmm0
145932715:     	movsd	(%rbx), %xmm1
145932719:     	addps	0x1545f20(%rip), %xmm1  # 0x146e78640
145932720:     	movlps	%xmm1, 0x20(%rsp)
145932725:     	movss	%xmm0, 0x28(%rsp)
14593272b:     	leaq	0x20(%rsp), %r9
145932730:     	movq	%rsi, %rcx
145932733:     	movl	$0x6, %edx
145932738:     	callq	0x145939820 <.text+0x5938820>
14593273d:     	nop
14593273e:     	addq	$0x30, %rsp
145932742:     	popq	%rbx
145932743:     	popq	%rdi
145932744:     	popq	%rsi
145932745:     	retq

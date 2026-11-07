
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401be6e4:     	movq	0x20(%rbx), %rdx
1401be6e8:     	leaq	0x520(%rbp), %rcx
1401be6ef:     	callq	0x145b9c990 <.text+0x5b9b990>
1401be6f4:     	nop
1401be6f5:     	cmpb	$0x1, (%rdi)
1401be6f8:     	jne	0x1401be71a <.text+0x1bd71a>
1401be6fa:     	movl	0x1(%rdi), %eax
1401be6fd:     	movl	0x4(%rdi), %ecx
1401be700:     	movl	%ecx, 0x4f3(%rbp)
1401be706:     	movl	%eax, 0x4f0(%rbp)
1401be70c:     	movq	0x8(%rdi), %rsi
1401be710:     	movzbl	0x10(%rdi), %r12d
1401be715:     	movb	$0x1, %r15b
1401be718:     	jmp	0x1401be72b <.text+0x1bd72b>
1401be71a:     	movq	0x8(%rdi), %rsi
1401be71e:     	lock
1401be71f:     	incq	(%rsi)
1401be722:     	jle	0x1401bf723 <.text+0x1be723>
1401be728:     	xorl	%r15d, %r15d
1401be72b:     	movl	0x330(%rbp), %eax
1401be731:     	movl	%eax, 0x851(%rbp)
1401be737:     	movaps	0x320(%rbp), %xmm0
1401be73e:     	movups	%xmm0, 0x841(%rbp)
1401be745:     	movups	0x520(%rbp), %xmm0
1401be74c:     	movups	%xmm0, 0x210(%rbp)
1401be753:     	movq	0x530(%rbp), %rax
1401be75a:     	movq	%rax, 0x220(%rbp)
1401be761:     	movl	0x4f0(%rbp), %eax
1401be767:     	movl	0x4f3(%rbp), %ecx
1401be76d:     	movl	%ecx, 0x76c(%rbp)
1401be773:     	movl	%eax, 0x769(%rbp)
1401be779:     	movups	0x840(%rbp), %xmm0
1401be780:     	movups	%xmm0, 0x787(%rbp)
1401be787:     	movq	0x84d(%rbp), %rax
1401be78e:     	movq	%rax, 0x794(%rbp)
1401be795:     	leaq	0x340(%rbp), %rdx
1401be79c:     	movl	$0x180, %r8d            # imm = 0x180
1401be7a2:     	movq	%r14, %rcx
1401be7a5:     	callq	0x145bc977b <.text+0x5bc877b>
1401be7aa:     	leaq	0x5b8(%rbp), %rcx
1401be7b1:     	movl	$0x198, %r8d            # imm = 0x198
1401be7b7:     	movq	%r14, %rdx
1401be7ba:     	callq	0x145bc977b <.text+0x5bc877b>
1401be7bf:     	movq	$0x0, 0x750(%rbp)
1401be7ca:     	movq	$0x4, 0x758(%rbp)
1401be7d5:     	movq	$0x0, 0x760(%rbp)
1401be7e0:     	movb	%r15b, 0x768(%rbp)
1401be7e7:     	movq	%rsi, 0x770(%rbp)
1401be7ee:     	movq	%r12, 0x778(%rbp)
1401be7f5:     	movl	$0x41a80000, 0x780(%rbp) # imm = 0x41A80000
1401be7ff:     	movw	$0x190, 0x784(%rbp)     # imm = 0x190
1401be808:     	movb	$0x1, 0x786(%rbp)
1401be80f:     	movdqu	0x5bafac1(%rip), %xmm0  # 0x145d6e2d8
1401be817:     	movdqu	%xmm0, 0x79c(%rbp)
1401be81f:     	movl	%r13d, 0x7ac(%rbp)
1401be826:     	movq	%xmm13, 0x7b0(%rbp)
1401be82f:     	movw	$0x1, 0x7b8(%rbp)
1401be838:     	movq	0x5a8(%rbp), %r14
1401be83f:     	movq	%r14, 0x5b0(%rbp)
1401be846:     	leaq	0x340(%rbp), %rcx
1401be84d:     	leaq	0x5b0(%rbp), %r8
1401be854:     	leaq	0x68(%rbp), %rsi
1401be858:     	movq	%rsi, %rdx
1401be85b:     	callq	0x14018e670 <.text+0x18d670>

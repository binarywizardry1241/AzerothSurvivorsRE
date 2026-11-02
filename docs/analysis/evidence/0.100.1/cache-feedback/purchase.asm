
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e5660:     	pushq	%rbp
1454e5661:     	pushq	%r15
1454e5663:     	pushq	%r14
1454e5665:     	pushq	%r12
1454e5667:     	pushq	%rsi
1454e5668:     	pushq	%rdi
1454e5669:     	pushq	%rbx
1454e566a:     	subq	$0xb0, %rsp
1454e5671:     	leaq	0x80(%rsp), %rbp
1454e5679:     	movq	$-0x2, 0x28(%rbp)
1454e5681:     	movq	%rcx, %rsi
1454e5684:     	movl	0x420(%rcx), %r14d
1454e568b:     	movl	0x980(%rcx), %r15d
1454e5692:     	movl	%r14d, %eax
1454e5695:     	subl	%r15d, %eax
1454e5698:     	jb	0x1454e5764 <.text+0x54e4764>
1454e569e:     	movl	%r15d, %ecx
1454e56a1:     	cvtsi2ss	%rcx, %xmm0
1454e56a6:     	mulss	0x151089a(%rip), %xmm0  # 0x1469f5f48
1454e56ae:     	addss	0x43318a(%rip), %xmm0   # 0x145918840
1454e56b6:     	cvttss2si	%xmm0, %rcx
1454e56bb:     	xorl	%edx, %edx
1454e56bd:     	xorps	%xmm1, %xmm1
1454e56c0:     	ucomiss	%xmm1, %xmm0
1454e56c3:     	cmovbl	%edx, %ecx
1454e56c6:     	movl	%eax, 0x420(%rsi)
1454e56cc:     	ucomiss	0x421e59(%rip), %xmm0   # 0x14590752c
1454e56d3:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454e56d8:     	cmovbel	%ecx, %edx
1454e56db:     	movl	%edx, 0x980(%rsi)
1454e56e1:     	imull	$0x2710, %eax, %r8d     # imm = 0x2710
1454e56e8:     	movq	0x8d8(%rsi), %rax
1454e56ef:     	testq	%rax, %rax
1454e56f2:     	je	0x1454e596e <.text+0x54e496e>
1454e56f8:     	movq	0x8e0(%rsi), %rcx
1454e56ff:     	movl	$0x498, %edx            # imm = 0x498
1454e5704:     	movzwl	0x36(%rax), %r10d
1454e5709:     	movl	%r10d, %r11d
1454e570c:     	addl	%r11d, %r11d
1454e570f:     	movq	$-0x1, %r9
1454e5716:     	nopw	%cs:(%rax,%rax)
1454e5720:     	testq	%r11, %r11
1454e5723:     	je	0x1454e5750 <.text+0x54e4750>
1454e5725:     	movzwl	0x3a(%rax,%r9,2), %edi
1454e572b:     	cmpl	%edi, %edx
1454e572d:     	seta	%bl
1454e5730:     	sbbb	$0x0, %bl
1454e5733:     	incq	%r9
1454e5736:     	addq	$-0x2, %r11
1454e573a:     	cmpb	$0x1, %bl
1454e573d:     	je	0x1454e5720 <.text+0x54e4720>
1454e573f:     	movzbl	%bl, %r10d
1454e5743:     	testl	%r10d, %r10d
1454e5746:     	je	0x1454e5967 <.text+0x54e4967>
1454e574c:     	jmp	0x1454e5753 <.text+0x54e4753>
1454e574e:     	nop
1454e5750:     	movq	%r10, %r9
1454e5753:     	subq	$0x1, %rcx
1454e5757:     	jb	0x1454e5970 <.text+0x54e4970>
1454e575d:     	movq	0x50(%rax,%r9,8), %rax
1454e5762:     	jmp	0x1454e5704 <.text+0x54e4704>
1454e5764:     	movss	0x934(%rsi), %xmm0
1454e576c:     	movaps	%xmm0, %xmm1
1454e576f:     	subss	0x98c(%rsi), %xmm1
1454e5777:     	ucomiss	0x421d8a(%rip), %xmm1   # 0x145907508
1454e577e:     	jbe	0x1454e59ab <.text+0x54e49ab>
1454e5784:     	leaq	0x980(%rsi), %r12
1454e578b:     	movss	%xmm0, 0x98c(%rsi)
1454e5793:     	leaq	0x1511b95(%rip), %rdi   # 0x1469f732f
1454e579a:     	movl	$0x1a, %ebx
1454e579f:     	movl	$0x1a, %edx
1454e57a4:     	movq	%rdi, %rcx
1454e57a7:     	callq	0x145457cb0 <.text+0x5456cb0>
1454e57ac:     	testq	%rax, %rax
1454e57af:     	cmovneq	%rax, %rdi
1454e57b3:     	cmovneq	%rdx, %rbx
1454e57b7:     	leaq	0x1510cb2(%rip), %rax   # 0x1469f6470
1454e57be:     	movq	%rax, (%rbp)
1454e57c2:     	movq	$0x1, 0x8(%rbp)
1454e57ca:     	movq	%r12, 0x10(%rbp)
1454e57ce:     	leaq	0x1510c7b(%rip), %rax   # 0x1469f6450
1454e57d5:     	movq	%rax, 0x18(%rbp)
1454e57d9:     	movq	$0x1, 0x20(%rsp)
1454e57e2:     	leaq	-0x30(%rbp), %rcx
1454e57e6:     	movq	%rbp, %r9
1454e57e9:     	movq	%rdi, %rdx
1454e57ec:     	movq	%rbx, %r8
1454e57ef:     	callq	0x145458060 <.text+0x5457060>
1454e57f4:     	movq	-0x28(%rbp), %rdx
1454e57f8:     	movq	-0x20(%rbp), %rdi
1454e57fc:     	movq	%rbp, %rcx
1454e57ff:     	movq	%rdx, -0x10(%rbp)
1454e5803:     	movq	%rdi, %r8
1454e5806:     	callq	0x14545bee0 <.text+0x545aee0>
1454e580b:     	nop
1454e580c:     	movq	0x560(%rsi), %rbx
1454e5813:     	cmpq	0x550(%rsi), %rbx
1454e581a:     	jne	0x1454e5829 <.text+0x54e4829>
1454e581c:     	leaq	0x550(%rsi), %rcx
1454e5823:     	callq	0x145774710 <.text+0x5773710>
1454e5828:     	nop
1454e5829:     	movq	0x558(%rsi), %rax
1454e5830:     	movq	%rbx, %rcx
1454e5833:     	shlq	$0x5, %rcx
1454e5837:     	movups	(%rbp), %xmm0
1454e583b:     	movups	0x10(%rbp), %xmm1
1454e583f:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e5844:     	movups	%xmm0, (%rax,%rcx)
1454e5848:     	incq	%rbx
1454e584b:     	movq	%rbx, 0x560(%rsi)
1454e5852:     	callq	0x140002200 <.text+0x1200>
1454e5857:     	movl	$0x1, %ecx
1454e585c:     	movl	$0x1, %edx
1454e5861:     	callq	0x1400021c0 <.text+0x11c0>
1454e5866:     	testq	%rax, %rax
1454e5869:     	je	0x1454e59ed <.text+0x54e49ed>
1454e586f:     	movb	$0x7b, (%rax)
1454e5872:     	movq	$0x1, (%rbp)
1454e587a:     	movq	%rax, 0x8(%rbp)
1454e587e:     	movq	$0x1, 0x10(%rbp)
1454e5886:     	movb	$0x1, 0x18(%rbp)
1454e588a:     	leaq	0x1511a6b(%rip), %rax   # 0x1469f72fc
1454e5891:     	movq	%rax, 0x20(%rsp)
1454e5896:     	movq	$0x5, 0x28(%rsp)
1454e589f:     	leaq	0x151122e(%rip), %r8    # 0x1469f6ad4
1454e58a6:     	leaq	-0x50(%rbp), %rcx
1454e58aa:     	movq	%rbp, %rdx
1454e58ad:     	movl	$0x4, %r9d
1454e58b3:     	callq	0x145456ed0 <.text+0x5455ed0>
1454e58b8:     	nop
1454e58b9:     	movq	%rdi, 0x28(%rsp)
1454e58be:     	movq	-0x10(%rbp), %rax
1454e58c2:     	movq	%rax, 0x20(%rsp)
1454e58c7:     	leaq	0x15111fe(%rip), %r8    # 0x1469f6acc
1454e58ce:     	movq	%rbp, %rcx
1454e58d1:     	leaq	-0x50(%rbp), %rdx
1454e58d5:     	movl	$0x4, %r9d
1454e58db:     	callq	0x145456ed0 <.text+0x5455ed0>
1454e58e0:     	nop
1454e58e1:     	movq	(%rbp), %rax
1454e58e5:     	movq	0x10(%rbp), %rdi
1454e58e9:     	cmpq	%rdi, %rax
1454e58ec:     	je	0x1454e59c3 <.text+0x54e49c3>
1454e58f2:     	movq	%rax, -0x8(%rbp)
1454e58f6:     	movq	0x8(%rbp), %rax
1454e58fa:     	movq	%rax, -0x18(%rbp)
1454e58fe:     	movb	$0x7d, (%rax,%rdi)
1454e5902:     	movq	0x578(%rsi), %rbx
1454e5909:     	cmpq	0x568(%rsi), %rbx
1454e5910:     	jne	0x1454e591f <.text+0x54e491f>
1454e5912:     	leaq	0x568(%rsi), %rcx
1454e5919:     	callq	0x1457745c0 <.text+0x57735c0>
1454e591e:     	nop
1454e591f:     	incq	%rdi
1454e5922:     	movq	0x570(%rsi), %rax
1454e5929:     	leaq	(%rbx,%rbx,2), %rcx
1454e592d:     	movq	-0x8(%rbp), %rdx
1454e5931:     	movq	%rdx, (%rax,%rcx,8)
1454e5935:     	movq	-0x18(%rbp), %rdx
1454e5939:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454e593e:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454e5943:     	incq	%rbx
1454e5946:     	movq	%rbx, 0x578(%rsi)
1454e594d:     	movq	-0x30(%rbp), %rdx
1454e5951:     	testq	%rdx, %rdx
1454e5954:     	je	0x1454e59ab <.text+0x54e49ab>
1454e5956:     	movl	$0x1, %r8d
1454e595c:     	movq	-0x10(%rbp), %rcx
1454e5960:     	callq	0x1400021d0 <.text+0x11d0>
1454e5965:     	jmp	0x1454e59ab <.text+0x54e49ab>
1454e5967:     	movl	%r8d, 0x8(%rax,%r9,4)
1454e596c:     	jmp	0x1454e599f <.text+0x54e499f>
1454e596e:     	xorl	%eax, %eax
1454e5970:     	leaq	0x8d8(%rsi), %rcx
1454e5977:     	movq	%rcx, (%rbp)
1454e597b:     	movq	%rax, 0x8(%rbp)
1454e597f:     	movq	$0x0, 0x10(%rbp)
1454e5987:     	movq	%r9, 0x18(%rbp)
1454e598b:     	movq	$0x498, 0x20(%rbp)      # imm = 0x498
1454e5993:     	leaq	-0x50(%rbp), %rcx
1454e5997:     	movq	%rbp, %rdx
1454e599a:     	callq	0x14552a730 <.text+0x5529730>
1454e599f:     	incl	0x688(%rsi)
1454e59a5:     	incl	0x940(%rsi)
1454e59ab:     	cmpl	%r15d, %r14d
1454e59ae:     	setae	%al
1454e59b1:     	addq	$0xb0, %rsp
1454e59b8:     	popq	%rbx
1454e59b9:     	popq	%rdi
1454e59ba:     	popq	%rsi
1454e59bb:     	popq	%r12
1454e59bd:     	popq	%r14
1454e59bf:     	popq	%r15
1454e59c1:     	popq	%rbp
1454e59c2:     	retq
1454e59c3:     	movq	$0x1, 0x20(%rsp)
1454e59cc:     	movq	%rbp, %rcx
1454e59cf:     	movl	$0x1, %r8d
1454e59d5:     	movl	$0x1, %r9d
1454e59db:     	movq	%rdi, %rdx
1454e59de:     	callq	0x1457744b0 <.text+0x57734b0>
1454e59e3:     	nop
1454e59e4:     	movq	(%rbp), %rax
1454e59e8:     	jmp	0x1454e58f2 <.text+0x54e48f2>
1454e59ed:     	movl	$0x1, %ecx
1454e59f2:     	movl	$0x1, %edx
1454e59f7:     	callq	0x14590379b <.text+0x590279b>
1454e59fc:     	nop
1454e59fd:     	ud2

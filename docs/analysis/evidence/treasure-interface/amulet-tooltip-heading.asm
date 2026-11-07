
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140109640:     	pushq	%rbp
140109641:     	pushq	%r15
140109643:     	pushq	%r14
140109645:     	pushq	%r12
140109647:     	pushq	%rsi
140109648:     	pushq	%rdi
140109649:     	pushq	%rbx
14010964a:     	subq	$0x610, %rsp            # imm = 0x610
140109651:     	leaq	0x80(%rsp), %rbp
140109659:     	movq	$-0x2, 0x588(%rbp)
140109664:     	movq	%rdx, %rdi
140109667:     	movq	%rcx, %rsi
14010966a:     	movq	(%rcx), %r12
14010966d:     	movq	0x28(%rcx), %rax
140109671:     	movq	%r12, 0x4e0(%rbp)
140109678:     	movups	0x8(%rcx), %xmm0
14010967c:     	movups	%xmm0, 0x4e8(%rbp)
140109683:     	movups	0x18(%rcx), %xmm0
140109687:     	movups	%xmm0, 0x4f8(%rbp)
14010968e:     	movq	%rax, 0x508(%rbp)
140109695:     	movw	$0x0, 0x3e4(%rbp)
14010969e:     	movb	$0x1, 0x3d4(%rbp)
1401096a5:     	xorps	%xmm0, %xmm0
1401096a8:     	movups	%xmm0, 0x2e8(%rbp)
1401096af:     	movups	%xmm0, 0x2f8(%rbp)
1401096b6:     	movaps	0x58360c3(%rip), %xmm1  # 0x14593f780
1401096bd:     	movups	%xmm1, 0x308(%rbp)
1401096c4:     	movq	$0x0, 0x2e0(%rbp)
1401096cf:     	movups	%xmm0, 0x318(%rbp)
1401096d6:     	movups	%xmm0, 0x328(%rbp)
1401096dd:     	movl	$0x0, 0x3f8(%rbp)
1401096e7:     	movw	$0x0, 0x3fc(%rbp)
1401096f0:     	movups	0x58370d1(%rip), %xmm0  # 0x1459407c8
1401096f7:     	movups	%xmm0, 0x338(%rbp)
1401096fe:     	movups	0x58370d3(%rip), %xmm0  # 0x1459407d8
140109705:     	movups	%xmm0, 0x348(%rbp)
14010970c:     	movups	0x58370d5(%rip), %xmm0  # 0x1459407e8
140109713:     	movups	%xmm0, 0x358(%rbp)
14010971a:     	movups	0x58370d7(%rip), %xmm0  # 0x1459407f8
140109721:     	movups	%xmm0, 0x368(%rbp)
140109728:     	movaps	0x57fdbc1(%rip), %xmm0  # 0x1459072f0
14010972f:     	movups	%xmm0, 0x378(%rbp)
140109736:     	movups	%xmm0, 0x388(%rbp)
14010973d:     	movaps	0x58099dc(%rip), %xmm0  # 0x145913120
140109744:     	movups	%xmm0, 0x398(%rbp)
14010974b:     	movups	%xmm0, 0x3a8(%rbp)
140109752:     	movb	$0x0, 0x3f6(%rbp)
140109759:     	movl	$0x0, 0x3f2(%rbp)
140109763:     	movq	$0x0, 0x3d8(%rbp)
14010976e:     	movl	$0x0, 0x3e0(%rbp)
140109778:     	movaps	0x57fdd41(%rip), %xmm0  # 0x1459074c0
14010977f:     	movups	%xmm0, 0x3b8(%rbp)
140109786:     	movl	$0x1, 0x3c8(%rbp)
140109790:     	movq	$0x0, 0x3cc(%rbp)
14010979b:     	movb	$0x0, 0x3f7(%rbp)
1401097a2:     	movups	0x5836f67(%rip), %xmm0  # 0x145940710
1401097a9:     	movaps	%xmm0, 0x280(%rbp)
1401097b0:     	movq	$0x0, 0x290(%rbp)
1401097bb:     	movups	0x5836f66(%rip), %xmm0  # 0x145940728
1401097c2:     	movups	%xmm0, 0x298(%rbp)
1401097c9:     	movq	$0x0, 0x2a8(%rbp)
1401097d4:     	movups	0x5836f65(%rip), %xmm0  # 0x145940740
1401097db:     	movaps	%xmm0, 0x2b0(%rbp)
1401097e2:     	movq	$0x0, 0x2c0(%rbp)
1401097ed:     	movups	0x5836f64(%rip), %xmm0  # 0x145940758
1401097f4:     	movups	%xmm0, 0x2c8(%rbp)
1401097fb:     	movq	$0x0, 0x2d8(%rbp)
140109806:     	movw	$0x0, 0x3ea(%rbp)
14010980f:     	movl	$0x10000, 0x3e6(%rbp)   # imm = 0x10000
140109819:     	movw	$0x0, 0x3f0(%rbp)
140109822:     	movl	$0x10000, 0x3ec(%rbp)   # imm = 0x10000
14010982c:     	movq	(%rdx), %rax
14010982f:     	movl	0x10(%rax), %ecx
140109832:     	movl	%ecx, 0x570(%rbp)
140109838:     	movups	(%rax), %xmm0
14010983b:     	movaps	%xmm0, 0x560(%rbp)
140109842:     	movl	0x10(%rax), %ecx
140109845:     	movl	%ecx, 0x520(%rbp)
14010984b:     	movups	(%rax), %xmm0
14010984e:     	movaps	%xmm0, 0x510(%rbp)
140109855:     	movl	0x10(%rax), %ecx
140109858:     	movl	%ecx, 0x534(%rbp)
14010985e:     	movups	(%rax), %xmm0
140109861:     	movups	%xmm0, 0x524(%rbp)
140109868:     	movl	0x10(%rax), %ecx
14010986b:     	movl	%ecx, 0x548(%rbp)
140109871:     	movups	(%rax), %xmm0
140109874:     	movups	%xmm0, 0x538(%rbp)
14010987b:     	movl	0x10(%rax), %ecx
14010987e:     	movl	%ecx, 0x55c(%rbp)
140109884:     	movups	(%rax), %xmm0
140109887:     	movups	%xmm0, 0x54c(%rbp)
14010988e:     	movq	0x8(%rdx), %rdx
140109892:     	movq	0x10(%rdi), %r14
140109896:     	movq	0x38(%r14), %r8
14010989a:     	movq	0x40(%r14), %r9
14010989e:     	leaq	-0x60(%rbp), %rcx
1401098a2:     	callq	0x1400b6b20 <.text+0xb5b20>
1401098a7:     	nop
1401098a8:     	leaq	0x1f8(%rbp), %rcx
1401098af:     	leaq	-0x60(%rbp), %rdx
1401098b3:     	callq	0x142702820 <.text+0x2701820>
1401098b8:     	nop
1401098b9:     	leaq	0x4e8(%rbp), %rbx
1401098c0:     	leaq	-0x60(%rbp), %r15
1401098c4:     	leaq	0x280(%rbp), %rdx
1401098cb:     	movl	$0x180, %r8d            # imm = 0x180
1401098d1:     	movq	%r15, %rcx
1401098d4:     	callq	0x1457731ed <.text+0x57721ed>
1401098d9:     	movaps	0x510(%rbp), %xmm0
1401098e0:     	movaps	0x520(%rbp), %xmm1
1401098e7:     	movaps	0x530(%rbp), %xmm2
1401098ee:     	movaps	0x540(%rbp), %xmm3
1401098f5:     	movups	%xmm0, 0x120(%rbp)
1401098fc:     	movups	%xmm1, 0x130(%rbp)
140109903:     	movups	%xmm2, 0x140(%rbp)
14010990a:     	movups	%xmm3, 0x150(%rbp)
140109911:     	movaps	0x550(%rbp), %xmm0
140109918:     	movups	%xmm0, 0x160(%rbp)
14010991f:     	leaq	0x170(%rbp), %rcx
140109926:     	leaq	0x1f8(%rbp), %rdx
14010992d:     	movl	$0x88, %r8d
140109933:     	callq	0x1457731ed <.text+0x57721ed>
140109938:     	leaq	0x288(%rbp), %rcx
14010993f:     	movl	$0x258, %r8d            # imm = 0x258
140109945:     	movq	%r15, %rdx
140109948:     	callq	0x1457731ed <.text+0x57721ed>
14010994d:     	movq	%r12, 0x280(%rbp)
140109954:     	leaq	0x1f8(%rbp), %rcx
14010995b:     	leaq	0x280(%rbp), %r8
140109962:     	movq	%rbx, %rdx
140109965:     	callq	0x1400d8db0 <.text+0xd7db0>
14010996a:     	movq	0x18(%rdi), %rdi
14010996e:     	leaq	-0x60(%rbp), %rcx
140109972:     	movq	%r14, %rdx
140109975:     	callq	0x145728850 <.text+0x5727850>
14010997a:     	cmpb	$0x1, (%rdi)
14010997d:     	jne	0x14010999d <.text+0x10899d>
14010997f:     	movl	0x1(%rdi), %eax
140109982:     	movl	0x4(%rdi), %ecx
140109985:     	movl	%ecx, 0x583(%rbp)
14010998b:     	movl	%eax, 0x580(%rbp)
140109991:     	movq	0x8(%rdi), %rax
140109995:     	movzbl	0x10(%rdi), %ecx
140109999:     	movb	$0x1, %dl
14010999b:     	jmp	0x1401099ad <.text+0x1089ad>
14010999d:     	movq	0x8(%rdi), %rax
1401099a1:     	lock
1401099a2:     	incq	(%rax)
1401099a5:     	jle	0x140109abd <.text+0x108abd>
1401099ab:     	xorl	%edx, %edx
1401099ad:     	movq	-0x50(%rbp), %r8
1401099b1:     	movq	%r8, 0x298(%rbp)
1401099b8:     	movups	-0x60(%rbp), %xmm0
1401099bc:     	movups	%xmm0, 0x288(%rbp)
1401099c3:     	movaps	0x560(%rbp), %xmm0
1401099ca:     	movups	%xmm0, 0x1f9(%rbp)
1401099d1:     	movl	0x570(%rbp), %r8d
1401099d8:     	movl	%r8d, 0x209(%rbp)
1401099df:     	movq	$0x0, 0x2a0(%rbp)
1401099ea:     	movq	$0x4, 0x2a8(%rbp)
1401099f5:     	movq	$0x0, 0x2b0(%rbp)
140109a00:     	movb	%dl, 0x2b8(%rbp)
140109a06:     	movl	0x580(%rbp), %edx
140109a0c:     	movl	0x583(%rbp), %r8d
140109a13:     	movl	%edx, 0x2b9(%rbp)
140109a19:     	movl	%r8d, 0x2bc(%rbp)
140109a20:     	movq	%rax, 0x2c0(%rbp)
140109a27:     	movq	%rcx, 0x2c8(%rbp)
140109a2e:     	movl	$0x41800000, 0x2d0(%rbp) # imm = 0x41800000
140109a38:     	movw	$0x190, 0x2d4(%rbp)     # imm = 0x190
140109a41:     	movb	$0x1, 0x2d6(%rbp)
140109a48:     	movq	0x205(%rbp), %rax
140109a4f:     	movq	%rax, 0x2e4(%rbp)
140109a56:     	movups	0x1f8(%rbp), %xmm0
140109a5d:     	movups	%xmm0, 0x2d7(%rbp)
140109a64:     	movl	0x580f716(%rip), %eax   # 0x145919180
140109a6a:     	movl	%eax, 0x2fc(%rbp)
140109a70:     	movups	0x580f6f9(%rip), %xmm0  # 0x145919170
140109a77:     	movups	%xmm0, 0x2ec(%rbp)
140109a7e:     	movsd	0x580bd4a(%rip), %xmm0  # 0x1459157d0
140109a86:     	movsd	%xmm0, 0x300(%rbp)
140109a8e:     	movq	%r12, 0x280(%rbp)
140109a95:     	leaq	-0x60(%rbp), %rcx
140109a99:     	leaq	0x280(%rbp), %r8
140109aa0:     	movq	%rbx, %rdx
140109aa3:     	callq	0x1400dbfa0 <.text+0xdafa0>
140109aa8:     	movq	%rsi, %rax
140109aab:     	addq	$0x610, %rsp            # imm = 0x610
140109ab2:     	popq	%rbx
140109ab3:     	popq	%rdi
140109ab4:     	popq	%rsi
140109ab5:     	popq	%r12
140109ab7:     	popq	%r14
140109ab9:     	popq	%r15
140109abb:     	popq	%rbp
140109abc:     	retq
140109abd:     	ud2

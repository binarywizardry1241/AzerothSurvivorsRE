
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401517c0:     	pushq	%rbp
1401517c1:     	pushq	%r15
1401517c3:     	pushq	%r14
1401517c5:     	pushq	%r13
1401517c7:     	pushq	%r12
1401517c9:     	pushq	%rsi
1401517ca:     	pushq	%rdi
1401517cb:     	pushq	%rbx
1401517cc:     	subq	$0x458, %rsp            # imm = 0x458
1401517d3:     	leaq	0x80(%rsp), %rbp
1401517db:     	movq	$-0x2, 0x3d0(%rbp)
1401517e6:     	movq	%rdx, %rdi
1401517e9:     	movq	%rcx, %rsi
1401517ec:     	movq	(%rcx), %r14
1401517ef:     	movq	0x28(%rcx), %rax
1401517f3:     	movq	%r14, 0x378(%rbp)
1401517fa:     	movups	0x8(%rcx), %xmm0
1401517fe:     	movups	%xmm0, 0x380(%rbp)
140151805:     	movups	0x18(%rcx), %xmm0
140151809:     	movups	%xmm0, 0x390(%rbp)
140151810:     	movq	%rax, 0x3a0(%rbp)
140151817:     	movw	$0x0, 0x2d4(%rbp)
140151820:     	movb	$0x1, 0x2c4(%rbp)
140151827:     	xorps	%xmm0, %xmm0
14015182a:     	movaps	%xmm0, 0x1d0(%rbp)
140151831:     	movaps	%xmm0, 0x1e0(%rbp)
140151838:     	movaps	%xmm0, 0x1f0(%rbp)
14015183f:     	movaps	%xmm0, 0x200(%rbp)
140151846:     	movaps	%xmm0, 0x210(%rbp)
14015184d:     	movq	$0x0, 0x220(%rbp)
140151858:     	movl	$0x0, 0x2e8(%rbp)
140151862:     	movw	$0x0, 0x2ec(%rbp)
14015186b:     	movups	0x57eef56(%rip), %xmm0  # 0x1459407c8
140151872:     	movups	%xmm0, 0x228(%rbp)
140151879:     	movups	0x57eef58(%rip), %xmm0  # 0x1459407d8
140151880:     	movups	%xmm0, 0x238(%rbp)
140151887:     	movups	0x57eef5a(%rip), %xmm0  # 0x1459407e8
14015188e:     	movups	%xmm0, 0x248(%rbp)
140151895:     	movups	0x57eef5c(%rip), %xmm0  # 0x1459407f8
14015189c:     	movups	%xmm0, 0x258(%rbp)
1401518a3:     	movups	0x57eef6e(%rip), %xmm0  # 0x145940818
1401518aa:     	movups	%xmm0, 0x278(%rbp)
1401518b1:     	movups	0x57eef50(%rip), %xmm0  # 0x145940808
1401518b8:     	movups	%xmm0, 0x268(%rbp)
1401518bf:     	movups	0x57eef72(%rip), %xmm0  # 0x145940838
1401518c6:     	movups	%xmm0, 0x298(%rbp)
1401518cd:     	movups	0x57eef54(%rip), %xmm0  # 0x145940828
1401518d4:     	movups	%xmm0, 0x288(%rbp)
1401518db:     	movb	$0x0, 0x2e6(%rbp)
1401518e2:     	movl	$0x0, 0x2e2(%rbp)
1401518ec:     	movsd	0x57c6e8c(%rip), %xmm0  # 0x145918780
1401518f4:     	movsd	%xmm0, 0x2c8(%rbp)
1401518fc:     	movl	$0x3f800000, 0x2d0(%rbp) # imm = 0x3F800000
140151906:     	movaps	0x57b5bb3(%rip), %xmm0  # 0x1459074c0
14015190d:     	movups	%xmm0, 0x2a8(%rbp)
140151914:     	movl	$0x1, 0x2b8(%rbp)
14015191e:     	movq	$0x0, 0x2bc(%rbp)
140151929:     	movb	$0x0, 0x2e7(%rbp)
140151930:     	movups	0x57eedd9(%rip), %xmm0  # 0x145940710
140151937:     	movaps	%xmm0, 0x170(%rbp)
14015193e:     	movq	$0x0, 0x180(%rbp)
140151949:     	movups	0x57eedd8(%rip), %xmm0  # 0x145940728
140151950:     	movups	%xmm0, 0x188(%rbp)
140151957:     	movq	$0x0, 0x198(%rbp)
140151962:     	movups	0x57eedd7(%rip), %xmm0  # 0x145940740
140151969:     	movaps	%xmm0, 0x1a0(%rbp)
140151970:     	movq	$0x0, 0x1b0(%rbp)
14015197b:     	movups	0x57eedd6(%rip), %xmm0  # 0x145940758
140151982:     	movups	%xmm0, 0x1b8(%rbp)
140151989:     	movq	$0x0, 0x1c8(%rbp)
140151994:     	movw	$0x0, 0x2da(%rbp)
14015199d:     	movl	$0x10000, 0x2d6(%rbp)   # imm = 0x10000
1401519a7:     	movw	$0x0, 0x2e0(%rbp)
1401519b0:     	movl	$0x10000, 0x2dc(%rbp)   # imm = 0x10000
1401519ba:     	movq	(%rdx), %rbx
1401519bd:     	movq	0x8(%rdx), %rdx
1401519c1:     	leaq	0x140(%rbp), %rcx
1401519c8:     	callq	0x145728850 <.text+0x5727850>
1401519cd:     	nop
1401519ce:     	cmpb	$0x1, (%rbx)
1401519d1:     	movq	%rdi, 0x3c0(%rbp)
1401519d8:     	jne	0x1401519f9 <.text+0x1509f9>
1401519da:     	movl	0x1(%rbx), %eax
1401519dd:     	movl	0x4(%rbx), %ecx
1401519e0:     	movl	%ecx, 0x3cb(%rbp)
1401519e6:     	movl	%eax, 0x3c8(%rbp)
1401519ec:     	movq	0x8(%rbx), %r13
1401519f0:     	movzbl	0x10(%rbx), %edi
1401519f4:     	movb	$0x1, %r12b
1401519f7:     	jmp	0x140151a0b <.text+0x150a0b>
1401519f9:     	movq	0x8(%rbx), %r13
1401519fd:     	lock
1401519fe:     	incq	(%r13)
140151a02:     	jle	0x140151ba7 <.text+0x150ba7>
140151a08:     	xorl	%r12d, %r12d
140151a0b:     	movq	0x150(%rbp), %rax
140151a12:     	movq	%rax, 0x138(%rbp)
140151a19:     	movups	0x140(%rbp), %xmm0
140151a20:     	movups	%xmm0, 0x128(%rbp)
140151a27:     	movups	0x57ef1b6(%rip), %xmm0  # 0x145940be4
140151a2e:     	movups	%xmm0, 0x3ac(%rbp)
140151a35:     	movl	$0x3f800000, 0x3bc(%rbp) # imm = 0x3F800000
140151a3f:     	leaq	-0x58(%rbp), %r15
140151a43:     	leaq	0x170(%rbp), %rdx
140151a4a:     	movl	$0x180, %r8d            # imm = 0x180
140151a50:     	movq	%r15, %rcx
140151a53:     	callq	0x1457731ed <.text+0x57721ed>
140151a58:     	leaq	0x178(%rbp), %rcx
140151a5f:     	movl	$0x198, %r8d            # imm = 0x198
140151a65:     	movq	%r15, %rdx
140151a68:     	callq	0x1457731ed <.text+0x57721ed>
140151a6d:     	movq	$0x0, 0x310(%rbp)
140151a78:     	movq	$0x4, 0x318(%rbp)
140151a83:     	movq	$0x0, 0x320(%rbp)
140151a8e:     	movb	%r12b, 0x328(%rbp)
140151a95:     	movl	0x3c8(%rbp), %eax
140151a9b:     	movl	0x3cb(%rbp), %ecx
140151aa1:     	movl	%eax, 0x329(%rbp)
140151aa7:     	movl	%ecx, 0x32c(%rbp)
140151aad:     	movq	%r13, 0x330(%rbp)
140151ab4:     	movq	%rdi, 0x338(%rbp)
140151abb:     	movl	$0x41800000, 0x340(%rbp) # imm = 0x41800000
140151ac5:     	movw	$0x190, 0x344(%rbp)     # imm = 0x190
140151ace:     	movb	$0x1, 0x346(%rbp)
140151ad5:     	movups	0x3ab(%rbp), %xmm0
140151adc:     	movups	%xmm0, 0x347(%rbp)
140151ae3:     	movq	0x3b8(%rbp), %rax
140151aea:     	movq	%rax, 0x354(%rbp)
140151af1:     	movups	0x57c7678(%rip), %xmm0  # 0x145919170
140151af8:     	movups	%xmm0, 0x35c(%rbp)
140151aff:     	movl	0x57c767b(%rip), %eax   # 0x145919180
140151b05:     	movl	%eax, 0x36c(%rbp)
140151b0b:     	movsd	0x57c3cbd(%rip), %xmm0  # 0x1459157d0
140151b13:     	movsd	%xmm0, 0x370(%rbp)
140151b1b:     	movq	%r14, 0x170(%rbp)
140151b22:     	leaq	0x140(%rbp), %rcx
140151b29:     	leaq	0x170(%rbp), %r15
140151b30:     	leaq	0x380(%rbp), %rdx
140151b37:     	movq	%r15, %r8
140151b3a:     	callq	0x1400db410 <.text+0xda410>
140151b3f:     	leaq	0x57f1a9e(%rip), %rcx   # 0x1459435e4
140151b46:     	movl	$0xe, %edx
140151b4b:     	callq	0x145457c00 <.text+0x5456c00>
140151b50:     	movq	%rdx, %r9
140151b53:     	movq	0x3c0(%rbp), %rcx
140151b5a:     	movq	0x10(%rcx), %rcx
140151b5e:     	movq	(%rcx), %rcx
140151b61:     	movq	%rcx, 0x178(%rbp)
140151b68:     	movabsq	$-0x7ffffffffffffff5, %rcx # imm = 0x800000000000000B
140151b72:     	movq	%rcx, 0x170(%rbp)
140151b79:     	movq	%r15, 0x20(%rsp)
140151b7e:     	leaq	0x378(%rbp), %rcx
140151b85:     	movq	%rbx, %rdx
140151b88:     	movq	%rax, %r8
140151b8b:     	callq	0x14027f930 <.text+0x27e930>
140151b90:     	movq	%rsi, %rax
140151b93:     	addq	$0x458, %rsp            # imm = 0x458
140151b9a:     	popq	%rbx
140151b9b:     	popq	%rdi
140151b9c:     	popq	%rsi
140151b9d:     	popq	%r12
140151b9f:     	popq	%r13
140151ba1:     	popq	%r14
140151ba3:     	popq	%r15
140151ba5:     	popq	%rbp
140151ba6:     	retq
140151ba7:     	ud2

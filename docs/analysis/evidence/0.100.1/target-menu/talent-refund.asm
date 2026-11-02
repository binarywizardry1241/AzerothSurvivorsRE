
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145483720:     	pushq	%rbp
145483721:     	pushq	%r15
145483723:     	pushq	%r14
145483725:     	pushq	%r13
145483727:     	pushq	%r12
145483729:     	pushq	%rsi
14548372a:     	pushq	%rdi
14548372b:     	pushq	%rbx
14548372c:     	subq	$0x68, %rsp
145483730:     	leaq	0x60(%rsp), %rbp
145483735:     	movq	$-0x2, (%rbp)
14548373d:     	movq	0x10(%rcx), %r13
145483741:     	testq	%r13, %r13
145483744:     	je	0x145483a96 <.text+0x5482a96>
14548374a:     	movq	%r9, %r14
14548374d:     	movq	%r8, %r15
145483750:     	movl	%edx, %ebx
145483752:     	movq	%rcx, %rsi
145483755:     	movq	0x8(%rcx), %rdi
145483759:     	movq	%r13, %r8
14548375c:     	shlq	$0x4, %r8
145483760:     	xorl	%r12d, %r12d
145483763:     	movq	%r8, -0x10(%rbp)
145483767:     	jmp	0x14548377d <.text+0x548277d>
145483769:     	nopl	(%rax)
145483770:     	addq	$0x10, %r12
145483774:     	cmpq	%r12, %r8
145483777:     	je	0x145483a96 <.text+0x5482a96>
14548377d:     	movq	(%rdi,%r12), %rax
145483781:     	cmpq	%r14, 0x8(%rax)
145483785:     	jne	0x145483770 <.text+0x5482770>
145483787:     	movq	(%rax), %rcx
14548378a:     	movq	%r15, %rdx
14548378d:     	movq	%r14, %r8
145483790:     	callq	0x1457731e7 <.text+0x57721e7>
145483795:     	movq	-0x10(%rbp), %r8
145483799:     	testl	%eax, %eax
14548379b:     	jne	0x145483770 <.text+0x5482770>
14548379d:     	movq	%r13, %rax
1454837a0:     	shrq	$0x3c, %rax
1454837a4:     	setne	%al
1454837a7:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
1454837b1:     	cmpq	%rcx, %r8
1454837b4:     	seta	%cl
1454837b7:     	orb	%al, %cl
1454837b9:     	je	0x1454837cb <.text+0x54827cb>
1454837bb:     	xorl	%r14d, %r14d
1454837be:     	movq	%r14, %rcx
1454837c1:     	movq	%r8, %rdx
1454837c4:     	callq	0x14590379b <.text+0x590279b>
1454837c9:     	ud2
1454837cb:     	callq	0x140002200 <.text+0x1200>
1454837d0:     	movl	$0x8, %r14d
1454837d6:     	movl	$0x8, %edx
1454837db:     	movq	-0x10(%rbp), %rcx
1454837df:     	callq	0x1400021c0 <.text+0x11c0>
1454837e4:     	movq	-0x10(%rbp), %r8
1454837e8:     	testq	%rax, %rax
1454837eb:     	je	0x1454837be <.text+0x54827be>
1454837ed:     	movq	%rax, %r15
1454837f0:     	movq	%rax, %rcx
1454837f3:     	movq	%rdi, %rdx
1454837f6:     	callq	0x1457731ed <.text+0x57721ed>
1454837fb:     	decb	0x8(%r15,%r12)
145483800:     	leaq	0x18(%r15), %rax
145483804:     	xorl	%r14d, %r14d
145483807:     	nopw	(%rax,%rax)
145483810:     	cmpb	$0x0, -0x10(%rax)
145483814:     	je	0x145483aa9 <.text+0x5482aa9>
14548381a:     	incq	%r14
14548381d:     	addq	$0x10, %rax
145483821:     	cmpq	%r14, %r13
145483824:     	jne	0x145483810 <.text+0x5482810>
145483826:     	movq	%r13, %r14
145483829:     	movabsq	$0x7ffffffffffffff8, %r9 # imm = 0x7FFFFFFFFFFFFFF8
145483833:     	movq	%r15, -0x8(%rbp)
145483837:     	movq	%r14, %r15
14548383a:     	shlq	$0x4, %r15
14548383e:     	movq	%r14, %rax
145483841:     	shrq	$0x3c, %rax
145483845:     	setne	%al
145483848:     	cmpq	%r9, %r15
14548384b:     	seta	%cl
14548384e:     	orb	%al, %cl
145483850:     	je	0x145483863 <.text+0x5482863>
145483852:     	xorl	%r12d, %r12d
145483855:     	movq	%r12, %rcx
145483858:     	movq	%r15, %rdx
14548385b:     	callq	0x14590379b <.text+0x590279b>
145483860:     	nop
145483861:     	ud2
145483863:     	testq	%r15, %r15
145483866:     	je	0x1454838f8 <.text+0x54828f8>
14548386c:     	callq	0x140002200 <.text+0x1200>
145483871:     	movl	$0x8, %r12d
145483877:     	movl	$0x8, %edx
14548387c:     	movq	%r15, %rcx
14548387f:     	callq	0x1400021c0 <.text+0x11c0>
145483884:     	testq	%rax, %rax
145483887:     	je	0x145483855 <.text+0x5482855>
145483889:     	movq	%r14, %r12
14548388c:     	testq	%r14, %r14
14548388f:     	je	0x1454838a6 <.text+0x54828a6>
145483891:     	movq	%rax, %rcx
145483894:     	movq	-0x8(%rbp), %rdx
145483898:     	movq	%r15, %r8
14548389b:     	movq	%rax, %r15
14548389e:     	callq	0x1457731ed <.text+0x57721ed>
1454838a3:     	movq	%r15, %rax
1454838a6:     	movq	%r12, -0x40(%rbp)
1454838aa:     	movq	%rax, -0x38(%rbp)
1454838ae:     	movq	%r14, -0x30(%rbp)
1454838b2:     	leaq	-0x28(%rbp), %rcx
1454838b6:     	leaq	-0x40(%rbp), %rdx
1454838ba:     	movl	%ebx, %r8d
1454838bd:     	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
1454838c3:     	callq	0x145483fc0 <.text+0x5482fc0>
1454838c8:     	nop
1454838c9:     	movq	-0x20(%rbp), %rbx
1454838cd:     	movq	-0x18(%rbp), %r8
1454838d1:     	xorl	%eax, %eax
1454838d3:     	movl	$0x0, %ecx
1454838d8:     	testq	%r8, %r8
1454838db:     	movq	-0x8(%rbp), %r15
1454838df:     	je	0x145483981 <.text+0x5482981>
1454838e5:     	movl	%r8d, %edx
1454838e8:     	andl	$0x3, %edx
1454838eb:     	cmpq	$0x4, %r8
1454838ef:     	jae	0x145483907 <.text+0x5482907>
1454838f1:     	xorl	%r9d, %r9d
1454838f4:     	xorl	%ecx, %ecx
1454838f6:     	jmp	0x145483955 <.text+0x5482955>
1454838f8:     	movl	$0x8, %eax
1454838fd:     	xorl	%r12d, %r12d
145483900:     	testq	%r14, %r14
145483903:     	jne	0x145483891 <.text+0x5482891>
145483905:     	jmp	0x1454838a6 <.text+0x54828a6>
145483907:     	andq	$-0x4, %r8
14548390b:     	leaq	0x38(%rbx), %r10
14548390f:     	xorl	%r9d, %r9d
145483912:     	xorl	%ecx, %ecx
145483914:     	nopw	%cs:(%rax,%rax)
145483920:     	movzbl	-0x30(%r10), %r11d
145483925:     	addl	%ecx, %r11d
145483928:     	movzbl	-0x20(%r10), %ecx
14548392d:     	movzbl	-0x10(%r10), %r15d
145483932:     	addl	%ecx, %r15d
145483935:     	addl	%r11d, %r15d
145483938:     	movzbl	(%r10), %ecx
14548393c:     	addl	%r15d, %ecx
14548393f:     	addq	$0x4, %r9
145483943:     	addq	$0x40, %r10
145483947:     	cmpq	%r9, %r8
14548394a:     	jne	0x145483920 <.text+0x5482920>
14548394c:     	testq	%rdx, %rdx
14548394f:     	movq	-0x8(%rbp), %r15
145483953:     	je	0x145483981 <.text+0x5482981>
145483955:     	shlq	$0x4, %r9
145483959:     	leaq	(%r9,%rbx), %r8
14548395d:     	addq	$0x8, %r8
145483961:     	shll	$0x4, %edx
145483964:     	xorl	%r9d, %r9d
145483967:     	nopw	(%rax,%rax)
145483970:     	movzbl	(%r8,%r9), %r10d
145483975:     	addl	%r10d, %ecx
145483978:     	addq	$0x10, %r9
14548397c:     	cmpq	%r9, %rdx
14548397f:     	jne	0x145483970 <.text+0x5482970>
145483981:     	testq	%r14, %r14
145483984:     	je	0x145483a21 <.text+0x5482a21>
14548398a:     	movl	%r14d, %edx
14548398d:     	andl	$0x3, %edx
145483990:     	cmpq	$0x4, %r14
145483994:     	jae	0x14548399d <.text+0x548299d>
145483996:     	xorl	%r8d, %r8d
145483999:     	xorl	%eax, %eax
14548399b:     	jmp	0x1454839f5 <.text+0x54829f5>
14548399d:     	movabsq	$0xffffffffffffffc, %r9 # imm = 0xFFFFFFFFFFFFFFC
1454839a7:     	andq	%r14, %r9
1454839aa:     	leaq	0x38(%r15), %r10
1454839ae:     	xorl	%r8d, %r8d
1454839b1:     	xorl	%eax, %eax
1454839b3:     	nopw	%cs:(%rax,%rax)
1454839c0:     	movzbl	-0x30(%r10), %r11d
1454839c5:     	addl	%eax, %r11d
1454839c8:     	movzbl	-0x20(%r10), %eax
1454839cd:     	movzbl	-0x10(%r10), %r15d
1454839d2:     	addl	%eax, %r15d
1454839d5:     	addl	%r11d, %r15d
1454839d8:     	movzbl	(%r10), %eax
1454839dc:     	addl	%r15d, %eax
1454839df:     	addq	$0x4, %r8
1454839e3:     	addq	$0x40, %r10
1454839e7:     	cmpq	%r8, %r9
1454839ea:     	jne	0x1454839c0 <.text+0x54829c0>
1454839ec:     	testq	%rdx, %rdx
1454839ef:     	movq	-0x8(%rbp), %r15
1454839f3:     	je	0x145483a21 <.text+0x5482a21>
1454839f5:     	shlq	$0x4, %r8
1454839f9:     	addq	%r15, %r8
1454839fc:     	addq	$0x8, %r8
145483a00:     	shll	$0x4, %edx
145483a03:     	xorl	%r9d, %r9d
145483a06:     	nopw	%cs:(%rax,%rax)
145483a10:     	movzbl	(%r8,%r9), %r10d
145483a15:     	addl	%r10d, %eax
145483a18:     	addq	$0x10, %r9
145483a1c:     	cmpq	%r9, %rdx
145483a1f:     	jne	0x145483a10 <.text+0x5482a10>
145483a21:     	cmpl	%eax, %ecx
145483a23:     	jne	0x145483a69 <.text+0x5482a69>
145483a25:     	movq	(%rsi), %rdx
145483a28:     	testq	%rdx, %rdx
145483a2b:     	je	0x145483a3f <.text+0x5482a3f>
145483a2d:     	shlq	$0x4, %rdx
145483a31:     	movl	$0x8, %r8d
145483a37:     	movq	%rdi, %rcx
145483a3a:     	callq	0x1400021d0 <.text+0x11d0>
145483a3f:     	movq	%r13, (%rsi)
145483a42:     	movq	%r15, 0x8(%rsi)
145483a46:     	movq	%r14, 0x10(%rsi)
145483a4a:     	movq	-0x28(%rbp), %rdx
145483a4e:     	testq	%rdx, %rdx
145483a51:     	je	0x145483a65 <.text+0x5482a65>
145483a53:     	shlq	$0x4, %rdx
145483a57:     	movl	$0x8, %r8d
145483a5d:     	movq	%rbx, %rcx
145483a60:     	callq	0x1400021d0 <.text+0x11d0>
145483a65:     	movb	$0x1, %al
145483a67:     	jmp	0x145483a98 <.text+0x5482a98>
145483a69:     	movq	-0x28(%rbp), %rdx
145483a6d:     	testq	%rdx, %rdx
145483a70:     	je	0x145483a84 <.text+0x5482a84>
145483a72:     	shlq	$0x4, %rdx
145483a76:     	movl	$0x8, %r8d
145483a7c:     	movq	%rbx, %rcx
145483a7f:     	callq	0x1400021d0 <.text+0x11d0>
145483a84:     	movl	$0x8, %r8d
145483a8a:     	movq	%r15, %rcx
145483a8d:     	movq	-0x10(%rbp), %rdx
145483a91:     	callq	0x1400021d0 <.text+0x11d0>
145483a96:     	xorl	%eax, %eax
145483a98:     	addq	$0x68, %rsp
145483a9c:     	popq	%rbx
145483a9d:     	popq	%rdi
145483a9e:     	popq	%rsi
145483a9f:     	popq	%r12
145483aa1:     	popq	%r13
145483aa3:     	popq	%r14
145483aa5:     	popq	%r15
145483aa7:     	popq	%rbp
145483aa8:     	retq
145483aa9:     	leaq	0x1(%r14), %rdx
145483aad:     	cmpq	%r13, %rdx
145483ab0:     	jae	0x145483829 <.text+0x5482829>
145483ab6:     	leaq	-0x2(%r13), %rcx
145483aba:     	leal	(%r14,%r13), %r9d
145483abe:     	movq	%r14, %r8
145483ac1:     	testb	$0x1, %r9b
145483ac5:     	movabsq	$0x7ffffffffffffff8, %r9 # imm = 0x7FFFFFFFFFFFFFF8
145483acf:     	jne	0x145483aec <.text+0x5482aec>
145483ad1:     	cmpb	$0x0, (%rax)
145483ad4:     	movq	%r14, %r8
145483ad7:     	je	0x145483ae8 <.text+0x5482ae8>
145483ad9:     	leaq	-0x8(%rax), %rdx
145483add:     	movups	(%rdx), %xmm0
145483ae0:     	movups	%xmm0, -0x18(%rax)
145483ae4:     	leaq	0x1(%r14), %r8
145483ae8:     	leaq	0x2(%r14), %rdx
145483aec:     	cmpq	%r14, %rcx
145483aef:     	movq	%r8, %r14
145483af2:     	je	0x145483833 <.text+0x5482833>
145483af8:     	movq	%r13, %rax
145483afb:     	subq	%rdx, %rax
145483afe:     	shlq	$0x4, %rdx
145483b02:     	leaq	(%rdx,%r15), %rcx
145483b06:     	addq	$0x18, %rcx
145483b0a:     	movq	%r8, %r14
145483b0d:     	jmp	0x145483b1d <.text+0x5482b1d>
145483b0f:     	addq	$0x20, %rcx
145483b13:     	addq	$-0x2, %rax
145483b17:     	je	0x145483833 <.text+0x5482833>
145483b1d:     	cmpb	$0x0, -0x10(%rcx)
145483b21:     	je	0x145483b39 <.text+0x5482b39>
145483b23:     	leaq	-0x18(%rcx), %rdx
145483b27:     	movq	%r14, %r8
145483b2a:     	shlq	$0x4, %r8
145483b2e:     	movups	(%rdx), %xmm0
145483b31:     	movups	%xmm0, (%r15,%r8)
145483b36:     	incq	%r14
145483b39:     	cmpb	$0x0, (%rcx)
145483b3c:     	je	0x145483b0f <.text+0x5482b0f>
145483b3e:     	movq	%r14, %rdx
145483b41:     	shlq	$0x4, %rdx
145483b45:     	movups	-0x8(%rcx), %xmm0
145483b49:     	movups	%xmm0, (%r15,%rdx)
145483b4e:     	incq	%r14
145483b51:     	jmp	0x145483b0f <.text+0x5482b0f>

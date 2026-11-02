
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454bb6d0:     	movq	%r13, %rsi
1454bb6d3:     	addq	%r12, %rax
1454bb6d6:     	movq	0x78(%rax), %r13
1454bb6da:     	leaq	(%rdi,%rdi,4), %rbx
1454bb6de:     	shlq	$0x4, %rbx
1454bb6e2:     	leaq	(%rbx,%r13), %rax
1454bb6e6:     	movq	%rax, 0x358(%rbp)
1454bb6ed:     	movq	%rsi, %rcx
1454bb6f0:     	movq	%rdi, %rdx
1454bb6f3:     	callq	0x145501c20 <.text+0x5500c20>
1454bb6f8:     	movaps	%xmm0, %xmm6
1454bb6fb:     	movq	%rsi, %rcx
1454bb6fe:     	movq	%rdi, %rdx
1454bb701:     	callq	0x145502020 <.text+0x5501020>
1454bb706:     	movaps	%xmm0, %xmm7
1454bb709:     	movss	0x28(%r13,%rbx), %xmm13
1454bb710:     	mulss	0x153a697(%rip), %xmm13 # 0x1469f5db0
1454bb719:     	movl	0x20(%r13,%rbx), %r8d
1454bb71e:     	movl	0x954(%rsi), %r15d
1454bb725:     	incl	%r15d
1454bb728:     	movl	%r15d, 0x954(%rsi)
1454bb72f:     	movl	%r8d, %eax
1454bb732:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454bb737:     	shlq	$0x18, %rax
1454bb73b:     	andl	$0xffffff, %r15d        # imm = 0xFFFFFF
1454bb742:     	orq	%rax, %r15
1454bb745:     	movabsq	$-0xed0000000000000, %rax # imm = 0xF130000000000000
1454bb74f:     	orq	%rax, %r15
1454bb752:     	movl	0x24(%r13,%rbx), %r9d
1454bb757:     	leaq	0x38(%rbp), %rax
1454bb75b:     	movq	%rax, 0x38(%rsp)
1454bb760:     	movss	%xmm6, 0x28(%rsp)
1454bb766:     	movss	%xmm13, 0x20(%rsp)
1454bb76d:     	movb	$0x1, 0x30(%rsp)
1454bb772:     	movq	%rsi, %rcx
1454bb775:     	movq	%r15, %rdx
1454bb778:     	callq	0x1454d2910 <.text+0x54d1910>
1454bb77d:     	movss	0x934(%rsi), %xmm14
1454bb786:     	movss	0x38(%r13,%rbx), %xmm15
1454bb78d:     	movss	0x3c(%r13,%rbx), %xmm8
1454bb794:     	movzbl	0x4c(%r13,%rbx), %ebx
1454bb79a:     	movzwl	0x24e(%rsi), %edi
1454bb7a1:     	movq	0x8a0(%rsi), %r8
1454bb7a8:     	movq	0x8b8(%rsi), %rdx
1454bb7af:     	movq	0x8a8(%rsi), %rcx
1454bb7b6:     	movq	0x8b0(%rsi), %rax
1454bb7bd:     	movq	%rsi, %r13
1454bb7c0:     	leaq	(%r8,%rdx), %r9
1454bb7c4:     	rolq	$0x17, %r9
1454bb7c8:     	addq	%r8, %r9
1454bb7cb:     	movq	%rcx, %r10
1454bb7ce:     	shlq	$0x11, %r10
1454bb7d2:     	xorq	%r8, %rax
1454bb7d5:     	xorq	%rcx, %rdx
1454bb7d8:     	xorq	%rax, %rcx
1454bb7db:     	xorq	%rdx, %r8
1454bb7de:     	rolq	$0x2d, %rdx
1454bb7e2:     	xorq	%r10, %rax
1454bb7e5:     	shrq	$0x29, %r9
1454bb7e9:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454bb7f0:     	movd	%r9d, %xmm12
1454bb7f5:     	addss	%xmm9, %xmm12
1454bb7fa:     	mulss	%xmm10, %xmm12
1454bb7ff:     	ucomiss	%xmm12, %xmm10
1454bb803:     	jbe	0x1454bb7c0 <.text+0x54ba7c0>
1454bb805:     	movq	%r8, 0x8a0(%r13)
1454bb80c:     	movq	%rdx, 0x8b8(%r13)
1454bb813:     	movq	%rcx, 0x8a8(%r13)
1454bb81a:     	movq	%rax, 0x8b0(%r13)
1454bb821:     	callq	0x140002200 <.text+0x1200>
1454bb826:     	movl	$0xc, %ecx
1454bb82b:     	movl	$0x4, %edx
1454bb830:     	callq	0x1400021c0 <.text+0x11c0>
1454bb835:     	testq	%rax, %rax
1454bb838:     	je	0x1454bcacf <.text+0x54bbacf>
1454bb83e:     	xorps	%xmm0, %xmm0
1454bb841:     	addss	%xmm0, %xmm12
1454bb846:     	movzwl	%di, %ecx
1454bb849:     	xorps	%xmm0, %xmm0
1454bb84c:     	cvtsi2ss	%ecx, %xmm0
1454bb850:     	divss	0x44bce4(%rip), %xmm0   # 0x14590753c
1454bb858:     	mulss	%xmm0, %xmm8
1454bb85d:     	movaps	%xmm13, %xmm1
1454bb861:     	mulss	0x48c693(%rip), %xmm1   # 0x145947efc
1454bb869:     	addss	0x572e47(%rip), %xmm1   # 0x145a2e6b8
1454bb871:     	movaps	%xmm15, %xmm0
1454bb875:     	mulss	0x44bc1b(%rip), %xmm0   # 0x145907498
1454bb87d:     	movq	0x153a53b(%rip), %xmm2  # 0x1469f5dc0
1454bb885:     	movq	%xmm2, (%rax)
1454bb889:     	movl	$0x41000000, 0x8(%rax)  # imm = 0x41000000
1454bb890:     	movq	$0x0, 0xb0(%rbp)
1454bb89b:     	movq	$0x8, 0xb8(%rbp)
1454bb8a6:     	movq	$0x0, 0xc0(%rbp)
1454bb8b1:     	movq	$-0x1, 0xc8(%rbp)
1454bb8bc:     	movq	$0x3, 0xf0(%rbp)
1454bb8c7:     	movq	%rax, 0xf8(%rbp)
1454bb8ce:     	movq	$0x3, 0x100(%rbp)
1454bb8d9:     	movq	%r14, 0x108(%rbp)
1454bb8e0:     	movb	$0x0, 0x110(%rbp)
1454bb8e7:     	movl	$0x0, 0x118(%rbp)
1454bb8f1:     	movl	$0x0, 0x120(%rbp)
1454bb8fb:     	movl	$0x0, 0x128(%rbp)
1454bb905:     	movq	%r15, 0x138(%rbp)
1454bb90c:     	movq	0x358(%rbp), %rax
1454bb913:     	movq	%rax, 0x140(%rbp)
1454bb91a:     	leaq	0x148(%rbp), %rcx
1454bb921:     	movups	%xmm11, 0x40(%rcx)
1454bb926:     	movups	%xmm11, 0x30(%rcx)
1454bb92b:     	movups	%xmm11, 0x20(%rcx)
1454bb930:     	movups	%xmm11, 0x10(%rcx)
1454bb935:     	movups	%xmm11, (%rcx)
1454bb939:     	movq	$0x0, 0x50(%rcx)
1454bb941:     	movss	%xmm6, 0x1a0(%rbp)
1454bb949:     	movss	%xmm6, 0x1a4(%rbp)
1454bb951:     	movss	%xmm7, 0x1a8(%rbp)
1454bb959:     	movss	%xmm8, 0x1ac(%rbp)
1454bb962:     	movss	%xmm15, 0x1b0(%rbp)
1454bb96b:     	movss	%xmm1, 0x1b4(%rbp)
1454bb973:     	movss	%xmm13, 0x1b8(%rbp)
1454bb97c:     	movl	0x40(%rbp), %eax
1454bb97f:     	movl	%eax, 0x7c(%rcx)
1454bb982:     	movq	0x38(%rbp), %rax
1454bb986:     	movq	%rax, 0x74(%rcx)
1454bb98a:     	movl	0x40(%rbp), %eax
1454bb98d:     	movl	%eax, 0x88(%rcx)
1454bb993:     	movq	0x38(%rbp), %rax
1454bb997:     	movq	%rax, 0x80(%rcx)
1454bb99e:     	xorps	%xmm1, %xmm1
1454bb9a1:     	movss	%xmm14, %xmm1           # xmm1 = xmm14[0],xmm1[1,2,3]
1454bb9a6:     	movlps	%xmm1, 0x1d4(%rbp)
1454bb9ad:     	movss	%xmm14, 0x1dc(%rbp)
1454bb9b6:     	movss	%xmm0, 0x1e0(%rbp)
1454bb9be:     	movups	%xmm11, 0xac(%rcx)
1454bb9c6:     	movups	%xmm11, 0x9c(%rcx)
1454bb9ce:     	movss	%xmm12, 0x204(%rbp)
1454bb9d7:     	movb	%bl, 0x208(%rbp)
1454bb9dd:     	movq	0x4e8(%r13), %rdi
1454bb9e4:     	cmpq	0x4d8(%r13), %rdi
1454bb9eb:     	jne	0x1454bb9fa <.text+0x54ba9fa>
1454bb9ed:     	movq	0x338(%rbp), %rcx
1454bb9f4:     	callq	0x145827b30 <.text+0x5826b30>
1454bb9f9:     	nop
1454bb9fa:     	imulq	$0x160, %rdi, %rcx      # imm = 0x160
1454bba01:     	addq	0x4e0(%r13), %rcx
1454bba08:     	movl	$0x160, %r8d            # imm = 0x160
1454bba0e:     	leaq	0xb0(%rbp), %rdx
1454bba15:     	callq	0x1457731ed <.text+0x57721ed>
1454bba1a:     	incq	%rdi
1454bba1d:     	movq	%rdi, 0x4e8(%r13)
1454bba24:     	movq	0x5a8(%r13), %rdx
1454bba2b:     	cmpq	%rdx, %r14
1454bba2e:     	jae	0x1454bcabe <.text+0x54bbabe>
1454bba34:     	movq	0x5a0(%r13), %rax

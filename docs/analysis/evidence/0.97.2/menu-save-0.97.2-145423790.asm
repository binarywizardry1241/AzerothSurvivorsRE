
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145423790:     	pushq	%rbp
145423791:     	pushq	%r14
145423793:     	pushq	%rsi
145423794:     	pushq	%rdi
145423795:     	pushq	%rbx
145423796:     	subq	$0x90, %rsp
14542379d:     	leaq	0x80(%rsp), %rbp
1454237a5:     	movq	$-0x2, 0x8(%rbp)
1454237ad:     	movq	%rcx, %rdx
1454237b0:     	leaq	-0x38(%rbp), %rcx
1454237b4:     	callq	0x145424080 <.text+0x5423080>
1454237b9:     	movq	-0x30(%rbp), %rdx
1454237bd:     	movq	-0x28(%rbp), %rsi
1454237c1:     	leaq	-0x50(%rbp), %rcx
1454237c5:     	movq	%rdx, (%rbp)
1454237c9:     	movq	%rsi, %r8
1454237cc:     	callq	0x1455026d0 <.text+0x55016d0>
1454237d1:     	nop
1454237d2:     	movq	-0x48(%rbp), %rdx
1454237d6:     	movq	-0x40(%rbp), %rdi
1454237da:     	leaq	-0x20(%rbp), %rcx
1454237de:     	movq	%rdx, -0x8(%rbp)
1454237e2:     	movq	%rdi, %r8
1454237e5:     	callq	0x145502290 <.text+0x5501290>
1454237ea:     	nop
1454237eb:     	movq	-0x20(%rbp), %rbx
1454237ef:     	cmpq	$-0x1, %rbx
1454237f3:     	je	0x14542382d <.text+0x542282d>
1454237f5:     	cmpq	%rsi, -0x10(%rbp)
1454237f9:     	jne	0x145423816 <.text+0x5422816>
1454237fb:     	movq	-0x18(%rbp), %r14
1454237ff:     	movq	%r14, %rcx
145423802:     	movq	(%rbp), %rdx
145423806:     	movq	%rsi, %r8
145423809:     	callq	0x145756dd7 <.text+0x5755dd7>
14542380e:     	testl	%eax, %eax
145423810:     	je	0x1454238b0 <.text+0x54228b0>
145423816:     	testq	%rbx, %rbx
145423819:     	je	0x14542382d <.text+0x542282d>
14542381b:     	movq	-0x18(%rbp), %rcx
14542381f:     	movl	$0x1, %r8d
145423825:     	movq	%rbx, %rdx
145423828:     	callq	0x1400021d0 <.text+0x11d0>
14542382d:     	leaq	0x12fd27c(%rip), %rax   # 0x146720ab0
145423834:     	movq	%rax, -0x60(%rbp)
145423838:     	movq	$0x33, -0x58(%rbp)
145423840:     	leaq	-0x60(%rbp), %rax
145423844:     	movq	%rax, -0x20(%rbp)
145423848:     	leaq	-0x542178f(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14542384f:     	movq	%rax, -0x18(%rbp)
145423853:     	leaq	0x12ff72c(%rip), %rcx   # 0x146722f86
14542385a:     	leaq	-0x20(%rbp), %rdx
14542385e:     	callq	0x1456f5b80 <.text+0x56f4b80>
145423863:     	nop
145423864:     	movq	(%rbp), %rcx
145423868:     	movq	%rsi, %rdx
14542386b:     	callq	0x145454e30 <.text+0x5453e30>
145423870:     	nop
145423871:     	movq	-0x50(%rbp), %rdx
145423875:     	testq	%rdx, %rdx
145423878:     	je	0x145423889 <.text+0x5422889>
14542387a:     	movl	$0x1, %r8d
145423880:     	movq	-0x8(%rbp), %rcx
145423884:     	callq	0x1400021d0 <.text+0x11d0>
145423889:     	movq	-0x38(%rbp), %rdx
14542388d:     	testq	%rdx, %rdx
145423890:     	je	0x1454238a2 <.text+0x54228a2>
145423892:     	movl	$0x1, %r8d
145423898:     	movq	(%rbp), %rcx
14542389c:     	callq	0x1400021d0 <.text+0x11d0>
1454238a1:     	nop
1454238a2:     	addq	$0x90, %rsp
1454238a9:     	popq	%rbx
1454238aa:     	popq	%rdi
1454238ab:     	popq	%rsi
1454238ac:     	popq	%r14
1454238ae:     	popq	%rbp
1454238af:     	retq
1454238b0:     	testq	%rbx, %rbx
1454238b3:     	je	0x1454238c7 <.text+0x54228c7>
1454238b5:     	movl	$0x1, %r8d
1454238bb:     	movq	%r14, %rcx
1454238be:     	movq	%rbx, %rdx
1454238c1:     	callq	0x1400021d0 <.text+0x11d0>
1454238c6:     	nop
1454238c7:     	movq	-0x8(%rbp), %rcx
1454238cb:     	movq	%rdi, %rdx
1454238ce:     	callq	0x145454e30 <.text+0x5453e30>
1454238d3:     	nop
1454238d4:     	jmp	0x145423871 <.text+0x5422871>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14594f7c3:     	movss	0x424574(%rip), %xmm15  # 0x145d73d40
14594f7cc:     	mulss	%xmm13, %xmm15
14594f7d1:     	testq	%rdx, %rdx
14594f7d4:     	jne	0x14594f7eb <.text+0x594e7eb>
14594f7d6:     	jmp	0x14594f7fa <.text+0x594e7fa>
14594f7d8:     	movss	0x42455f(%rip), %xmm15  # 0x145d73d40
14594f7e1:     	mulss	%xmm13, %xmm15
14594f7e6:     	testq	%rdx, %rdx
14594f7e9:     	je	0x14594f7fa <.text+0x594e7fa>
14594f7eb:     	shlq	$0x6, %rdx
14594f7ef:     	movl	$0x8, %r8d
14594f7f5:     	callq	0x1400021d0 <.text+0x11d0>
14594f7fa:     	xorps	%xmm14, %xmm14
14594f7fe:     	mulss	%xmm15, %xmm7
14594f803:     	movq	(%rbp), %rdx
14594f807:     	testq	%rdx, %rdx
14594f80a:     	je	0x14594f81f <.text+0x594e81f>
14594f80c:     	movq	0x8(%rbp), %rcx
14594f810:     	shlq	$0x3, %rdx
14594f814:     	movl	$0x4, %r8d
14594f81a:     	callq	0x1400021d0 <.text+0x11d0>
14594f81f:     	mulss	%xmm11, %xmm9
14594f824:     	cmpltss	%xmm13, %xmm14
14594f82a:     	mulss	%xmm7, %xmm8
14594f82f:     	movq	0x18(%rbp), %rdx
14594f833:     	testq	%rdx, %rdx
14594f836:     	je	0x14594f84b <.text+0x594e84b>
14594f838:     	movq	0x20(%rbp), %rcx
14594f83c:     	shlq	$0x5, %rdx
14594f840:     	movl	$0x8, %r8d
14594f846:     	callq	0x1400021d0 <.text+0x11d0>
14594f84b:     	andps	%xmm9, %xmm14
14594f84f:     	mulss	%xmm12, %xmm8
14594f854:     	movq	0x50(%rbp), %r15
14594f858:     	movq	0x58(%rbp), %rsi
14594f85c:     	testq	%rsi, %rsi
14594f85f:     	je	0x14594f898 <.text+0x594e898>
14594f861:     	leaq	0x8(%r15), %rbx
14594f865:     	jmp	0x14594f879 <.text+0x594e879>
14594f867:     	nopw	(%rax,%rax)
14594f870:     	addq	$0x28, %rbx
14594f874:     	decq	%rsi
14594f877:     	je	0x14594f898 <.text+0x594e898>
14594f879:     	movq	-0x8(%rbx), %rdx
14594f87d:     	cmpq	$-0x1, %rdx
14594f881:     	je	0x14594f870 <.text+0x594e870>
14594f883:     	testq	%rdx, %rdx
14594f886:     	je	0x14594f870 <.text+0x594e870>
14594f888:     	movq	(%rbx), %rcx
14594f88b:     	movl	$0x1, %r8d
14594f891:     	callq	0x1400021d0 <.text+0x11d0>
14594f896:     	jmp	0x14594f870 <.text+0x594e870>
14594f898:     	addss	%xmm8, %xmm14
14594f89d:     	movq	0x48(%rbp), %rax
14594f8a1:     	testq	%rax, %rax
14594f8a4:     	je	0x14594f8bc <.text+0x594e8bc>
14594f8a6:     	shlq	$0x3, %rax
14594f8aa:     	leaq	(%rax,%rax,4), %rdx
14594f8ae:     	movl	$0x8, %r8d
14594f8b4:     	movq	%r15, %rcx
14594f8b7:     	callq	0x1400021d0 <.text+0x11d0>
14594f8bc:     	mulss	%xmm14, %xmm6

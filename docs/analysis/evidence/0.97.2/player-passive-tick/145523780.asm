
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145523780:     	pushq	%r14
145523782:     	pushq	%rsi
145523783:     	pushq	%rdi
145523784:     	pushq	%rbx
145523785:     	movq	0x10(%rcx), %rax
145523789:     	testq	%rax, %rax
14552378c:     	je	0x1455238e5 <.text+0x55228e5>
145523792:     	movq	0x8(%rcx), %r8
145523796:     	movq	0x8(%rdx), %r9
14552379a:     	movq	0x10(%rdx), %rdx
14552379e:     	movabsq	$0xffffffffffffff8, %r10 # imm = 0xFFFFFFFFFFFFFF8
1455237a8:     	andq	%rdx, %r10
1455237ab:     	shll	$0x3, %edx
1455237ae:     	andl	$0x38, %edx
1455237b1:     	xorl	%r11d, %r11d
1455237b4:     	jmp	0x1455237cc <.text+0x55227cc>
1455237b6:     	nopw	%cs:(%rax,%rax)
1455237c0:     	incq	%r11
1455237c3:     	cmpq	%rax, %r11
1455237c6:     	je	0x1455238e5 <.text+0x55228e5>
1455237cc:     	movq	%r11, %rsi
1455237cf:     	shlq	$0x5, %rsi
1455237d3:     	movq	(%r8,%rsi), %rsi
1455237d7:     	xorl	%edi, %edi
1455237d9:     	nopl	(%rax)
1455237e0:     	cmpq	%rdi, %r10
1455237e3:     	je	0x145523850 <.text+0x5522850>
1455237e5:     	cmpq	%rsi, (%r9,%rdi,8)
1455237e9:     	je	0x1455238d8 <.text+0x55228d8>
1455237ef:     	cmpq	%rsi, 0x8(%r9,%rdi,8)
1455237f4:     	je	0x1455238d8 <.text+0x55228d8>
1455237fa:     	cmpq	%rsi, 0x10(%r9,%rdi,8)
1455237ff:     	je	0x1455238d8 <.text+0x55228d8>
145523805:     	cmpq	%rsi, 0x18(%r9,%rdi,8)
14552380a:     	je	0x1455238d8 <.text+0x55228d8>
145523810:     	cmpq	%rsi, 0x20(%r9,%rdi,8)
145523815:     	je	0x1455238d8 <.text+0x55228d8>
14552381b:     	cmpq	%rsi, 0x28(%r9,%rdi,8)
145523820:     	je	0x1455238d8 <.text+0x55228d8>
145523826:     	cmpq	%rsi, 0x30(%r9,%rdi,8)
14552382b:     	je	0x1455238d8 <.text+0x55228d8>
145523831:     	cmpq	%rsi, 0x38(%r9,%rdi,8)
145523836:     	leaq	0x8(%rdi), %rdi
14552383a:     	jne	0x1455237e0 <.text+0x55227e0>
14552383c:     	jmp	0x1455238d8 <.text+0x55228d8>
145523841:     	nopw	%cs:(%rax,%rax)
145523850:     	testq	%rdx, %rdx
145523853:     	je	0x1455237c0 <.text+0x55227c0>
145523859:     	cmpq	%rsi, (%r9,%r10,8)
14552385d:     	je	0x1455238d8 <.text+0x55228d8>
14552385f:     	cmpl	$0x8, %edx
145523862:     	je	0x1455237c0 <.text+0x55227c0>
145523868:     	cmpq	%rsi, 0x8(%r9,%r10,8)
14552386d:     	je	0x1455238d8 <.text+0x55228d8>
14552386f:     	cmpl	$0x10, %edx
145523872:     	je	0x1455237c0 <.text+0x55227c0>
145523878:     	cmpq	%rsi, 0x10(%r9,%r10,8)
14552387d:     	je	0x1455238d8 <.text+0x55228d8>
14552387f:     	cmpl	$0x18, %edx
145523882:     	je	0x1455237c0 <.text+0x55227c0>
145523888:     	cmpq	%rsi, 0x18(%r9,%r10,8)
14552388d:     	je	0x1455238d8 <.text+0x55228d8>
14552388f:     	cmpl	$0x20, %edx
145523892:     	je	0x1455237c0 <.text+0x55227c0>
145523898:     	cmpq	%rsi, 0x20(%r9,%r10,8)
14552389d:     	je	0x1455238d8 <.text+0x55228d8>
14552389f:     	cmpl	$0x28, %edx
1455238a2:     	je	0x1455237c0 <.text+0x55227c0>
1455238a8:     	cmpq	%rsi, 0x28(%r9,%r10,8)
1455238ad:     	je	0x1455238d8 <.text+0x55228d8>
1455238af:     	cmpl	$0x30, %edx
1455238b2:     	je	0x1455237c0 <.text+0x55227c0>
1455238b8:     	cmpl	$0x38, %edx
1455238bb:     	setne	%bl
1455238be:     	cmpq	%rsi, 0x30(%r9,%r10,8)
1455238c3:     	je	0x1455238ce <.text+0x55228ce>
1455238c5:     	testb	%bl, %bl
1455238c7:     	jne	0x1455238d8 <.text+0x55228d8>
1455238c9:     	jmp	0x1455237c0 <.text+0x55227c0>
1455238ce:     	movb	$0x1, %bl
1455238d0:     	testb	%bl, %bl
1455238d2:     	je	0x1455237c0 <.text+0x55227c0>
1455238d8:     	leaq	0x1(%r11), %rsi
1455238dc:     	cmpq	%rax, %rsi
1455238df:     	jb	0x145523914 <.text+0x5522914>
1455238e1:     	movq	%r11, 0x10(%rcx)
1455238e5:     	popq	%rbx
1455238e6:     	popq	%rdi
1455238e7:     	popq	%rsi
1455238e8:     	popq	%r14
1455238ea:     	retq
1455238eb:     	nopl	(%rax,%rax)
1455238f0:     	movq	%r11, %rbx
1455238f3:     	shlq	$0x5, %rbx
1455238f7:     	movups	(%rdi), %xmm0
1455238fa:     	movups	0x10(%rdi), %xmm1
1455238fe:     	movups	%xmm1, 0x10(%r8,%rbx)
145523904:     	movups	%xmm0, (%r8,%rbx)
145523909:     	incq	%r11
14552390c:     	incq	%rsi
14552390f:     	cmpq	%rax, %rsi
145523912:     	je	0x1455238e1 <.text+0x55228e1>
145523914:     	movq	%rsi, %rbx
145523917:     	shlq	$0x5, %rbx
14552391b:     	leaq	(%r8,%rbx), %rdi
14552391f:     	movq	(%r8,%rbx), %rbx
145523923:     	xorl	%r14d, %r14d
145523926:     	nopw	%cs:(%rax,%rax)
145523930:     	cmpq	%r14, %r10
145523933:     	je	0x145523980 <.text+0x5522980>
145523935:     	cmpq	%rbx, (%r9,%r14,8)
145523939:     	je	0x14552390c <.text+0x552290c>
14552393b:     	cmpq	%rbx, 0x8(%r9,%r14,8)
145523940:     	je	0x14552390c <.text+0x552290c>
145523942:     	cmpq	%rbx, 0x10(%r9,%r14,8)
145523947:     	je	0x14552390c <.text+0x552290c>
145523949:     	cmpq	%rbx, 0x18(%r9,%r14,8)
14552394e:     	je	0x14552390c <.text+0x552290c>
145523950:     	cmpq	%rbx, 0x20(%r9,%r14,8)
145523955:     	je	0x14552390c <.text+0x552290c>
145523957:     	cmpq	%rbx, 0x28(%r9,%r14,8)
14552395c:     	je	0x14552390c <.text+0x552290c>
14552395e:     	cmpq	%rbx, 0x30(%r9,%r14,8)
145523963:     	je	0x14552390c <.text+0x552290c>
145523965:     	cmpq	%rbx, 0x38(%r9,%r14,8)
14552396a:     	leaq	0x8(%r14), %r14
14552396e:     	jne	0x145523930 <.text+0x5522930>
145523970:     	jmp	0x14552390c <.text+0x552290c>
145523972:     	nopw	%cs:(%rax,%rax)
145523980:     	testq	%rdx, %rdx
145523983:     	je	0x1455238f0 <.text+0x55228f0>
145523989:     	cmpq	%rbx, (%r9,%r10,8)
14552398d:     	je	0x14552390c <.text+0x552290c>
145523993:     	cmpl	$0x8, %edx
145523996:     	je	0x1455238f0 <.text+0x55228f0>
14552399c:     	cmpq	%rbx, 0x8(%r9,%r10,8)
1455239a1:     	je	0x14552390c <.text+0x552290c>
1455239a7:     	cmpl	$0x10, %edx
1455239aa:     	je	0x1455238f0 <.text+0x55228f0>
1455239b0:     	cmpq	%rbx, 0x10(%r9,%r10,8)
1455239b5:     	je	0x14552390c <.text+0x552290c>
1455239bb:     	cmpl	$0x18, %edx
1455239be:     	je	0x1455238f0 <.text+0x55228f0>
1455239c4:     	cmpq	%rbx, 0x18(%r9,%r10,8)
1455239c9:     	je	0x14552390c <.text+0x552290c>
1455239cf:     	cmpl	$0x20, %edx
1455239d2:     	je	0x1455238f0 <.text+0x55228f0>
1455239d8:     	cmpq	%rbx, 0x20(%r9,%r10,8)
1455239dd:     	je	0x14552390c <.text+0x552290c>
1455239e3:     	cmpl	$0x28, %edx
1455239e6:     	je	0x1455238f0 <.text+0x55228f0>
1455239ec:     	cmpq	%rbx, 0x28(%r9,%r10,8)
1455239f1:     	je	0x14552390c <.text+0x552290c>
1455239f7:     	cmpl	$0x30, %edx
1455239fa:     	je	0x1455238f0 <.text+0x55228f0>
145523a00:     	cmpq	%rbx, 0x30(%r9,%r10,8)
145523a05:     	je	0x14552390c <.text+0x552290c>
145523a0b:     	cmpl	$0x38, %edx
145523a0e:     	je	0x1455238f0 <.text+0x55228f0>
145523a14:     	jmp	0x14552390c <.text+0x552290c>

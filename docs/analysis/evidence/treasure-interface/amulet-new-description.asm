
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145425910:     	pushq	%rbp
145425911:     	pushq	%r14
145425913:     	pushq	%rsi
145425914:     	pushq	%rdi
145425915:     	pushq	%rbx
145425916:     	subq	$0x80, %rsp
14542591d:     	leaq	0x80(%rsp), %rbp
145425925:     	movq	$-0x2, -0x8(%rbp)
14542592d:     	movq	%rdx, %rdi
145425930:     	movq	0x60(%rdx), %rax
145425934:     	cmpq	$0x4, %rax
145425938:     	movl	$0x4, %edx
14542593d:     	cmovbq	%rax, %rdx
145425941:     	movl	%edx, %eax
145425943:     	leaq	0x1317a32(%rip), %rdx   # 0x14673d37c
14542594a:     	movss	(%rdx,%rax,4), %xmm0
14542594f:     	mulss	0x4ed9fd(%rip), %xmm0   # 0x145913354
145425957:     	addss	0x4e1b31(%rip), %xmm0   # 0x145907490
14542595f:     	movl	0x68(%rdi), %eax
145425962:     	cmpl	$0x1, %eax
145425965:     	adcl	$-0x1, %eax
145425968:     	movq	%rcx, %rsi
14542596b:     	cvtsi2ss	%eax, %xmm1
14542596f:     	callq	0x145773283 <.text+0x5772283>
145425974:     	addss	%xmm0, %xmm0
145425978:     	movss	0x4ed97c(%rip), %xmm1   # 0x1459132fc
145425980:     	subss	%xmm0, %xmm1
145425984:     	movss	%xmm1, -0x28(%rbp)
145425989:     	movq	0x38(%rdi), %rax
14542598d:     	movq	0x40(%rdi), %rcx
145425991:     	shlq	$0x6, %rcx
145425995:     	addq	%rax, %rcx
145425998:     	movq	%rax, -0x40(%rbp)
14542599c:     	movq	%rcx, -0x38(%rbp)
1454259a0:     	leaq	-0x28(%rbp), %rax
1454259a4:     	movq	%rax, -0x30(%rbp)
1454259a8:     	leaq	-0x58(%rbp), %rcx
1454259ac:     	leaq	-0x40(%rbp), %rdx
1454259b0:     	callq	0x145544de0 <.text+0x5543de0>
1454259b5:     	movq	-0x50(%rbp), %r14
1454259b9:     	movq	-0x48(%rbp), %rbx
1454259bd:     	testq	%rbx, %rbx
1454259c0:     	movq	%r14, -0x10(%rbp)
1454259c4:     	je	0x1454259f9 <.text+0x54249f9>
1454259c6:     	leaq	(,%rbx,8), %rax
1454259ce:     	leaq	(%rax,%rax,2), %rdi
1454259d2:     	callq	0x140002200 <.text+0x1200>
1454259d7:     	movl	$0x8, %edx
1454259dc:     	movq	%rdi, %rcx
1454259df:     	callq	0x1400021c0 <.text+0x11c0>
1454259e4:     	testq	%rax, %rax
1454259e7:     	jne	0x1454259fe <.text+0x54249fe>
1454259e9:     	movl	$0x8, %ecx
1454259ee:     	movq	%rdi, %rdx
1454259f1:     	callq	0x14590379b <.text+0x590279b>
1454259f6:     	nop
1454259f7:     	ud2
1454259f9:     	movl	$0x8, %eax
1454259fe:     	movq	%rbx, %rdx
145425a01:     	shlq	$0x6, %rdx
145425a05:     	addq	%r14, %rdx
145425a08:     	movq	%rbx, -0x28(%rbp)
145425a0c:     	movq	%rax, -0x20(%rbp)
145425a10:     	leaq	-0x18(%rbp), %rcx
145425a14:     	movq	$0x0, -0x18(%rbp)
145425a1c:     	movq	%rcx, -0x40(%rbp)
145425a20:     	movq	$0x0, -0x38(%rbp)
145425a28:     	movq	%rax, -0x30(%rbp)
145425a2c:     	leaq	-0x40(%rbp), %r8
145425a30:     	movq	%r14, %rcx
145425a33:     	callq	0x1455526c0 <.text+0x55516c0>
145425a38:     	nop
145425a39:     	movq	-0x18(%rbp), %rax
145425a3d:     	movq	%rax, 0x10(%rsi)
145425a41:     	movups	-0x28(%rbp), %xmm0
145425a45:     	movups	%xmm0, (%rsi)
145425a48:     	movq	-0x58(%rbp), %rdx
145425a4c:     	testq	%rdx, %rdx
145425a4f:     	je	0x145425a64 <.text+0x5424a64>
145425a51:     	shlq	$0x6, %rdx
145425a55:     	movl	$0x8, %r8d
145425a5b:     	movq	-0x10(%rbp), %rcx
145425a5f:     	callq	0x1400021d0 <.text+0x11d0>
145425a64:     	movq	%rsi, %rax
145425a67:     	addq	$0x80, %rsp
145425a6e:     	popq	%rbx
145425a6f:     	popq	%rdi
145425a70:     	popq	%rsi
145425a71:     	popq	%r14
145425a73:     	popq	%rbp
145425a74:     	retq

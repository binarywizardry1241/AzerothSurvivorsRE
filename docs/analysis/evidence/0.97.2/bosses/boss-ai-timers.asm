
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cae7d:     	cmpq	$-0x1, 0x18(%rdi)
1454cae82:     	je	0x1454cb009 <.text+0x54ca009>
1454cae88:     	cmpb	$0x0, 0x38(%rdi)
1454cae8c:     	jne	0x1454caeab <.text+0x54c9eab>
1454cae8e:     	movss	0xf4(%rdi), %xmm0
1454cae96:     	mulss	0x43ffa6(%rip), %xmm0   # 0x14590ae44
1454cae9e:     	ucomiss	0xf0(%rdi), %xmm0
1454caea5:     	jbe	0x1454caeab <.text+0x54c9eab>
1454caea7:     	movb	$0x1, 0x38(%rdi)
1454caeab:     	movq	0x20(%rdi), %r13
1454caeaf:     	movq	0x28(%rdi), %rax
1454caeb3:     	leaq	(,%rax,4), %r15
1454caebb:     	addq	%r13, %r15
1454caebe:     	xorl	%r14d, %r14d
1454caec1:     	jmp	0x1454caf12 <.text+0x54c9f12>
1454caec3:     	nopw	%cs:(%rax,%rax)
1454caed0:     	movq	0xe8(%rbp), %rax
1454caed7:     	movq	%rsi, %rcx
1454caeda:     	shlq	$0x5, %rcx
1454caede:     	movq	0x128(%rbp), %rdx
1454caee5:     	movq	%rdx, (%rax,%rcx)
1454caee9:     	movaps	0x1f0(%rbp), %xmm0
1454caef0:     	movups	%xmm0, 0x8(%rax,%rcx)
1454caef5:     	movq	0x200(%rbp), %rdx
1454caefc:     	movq	%rdx, 0x18(%rax,%rcx)
1454caf01:     	incq	%rsi
1454caf04:     	movq	%rsi, 0xf0(%rbp)
1454caf0b:     	movq	0x290(%rbp), %rdi
1454caf12:     	cmpq	%r15, %r13
1454caf15:     	je	0x1454cb009 <.text+0x54ca009>
1454caf1b:     	movq	%r14, %rcx
1454caf1e:     	movq	%r13, %rax
1454caf21:     	addq	$0x4, %r13
1454caf25:     	incq	%r14
1454caf28:     	movss	(%rax), %xmm0
1454caf2c:     	subss	%xmm7, %xmm0
1454caf30:     	movss	%xmm0, (%rax)
1454caf34:     	ucomiss	%xmm0, %xmm8
1454caf38:     	jb	0x1454caf12 <.text+0x54c9f12>
1454caf3a:     	movq	0x30(%rdi), %r8
1454caf3e:     	movq	0x18(%r8), %rdx
1454caf42:     	cmpq	%rdx, %rcx
1454caf45:     	jae	0x1454ce6ae <.text+0x54cd6ae>
1454caf4b:     	cmpb	$0x0, 0x38(%rdi)
1454caf4f:     	movss	0x43ffb5(%rip), %xmm0   # 0x14590af0c
1454caf57:     	jne	0x1454caf5d <.text+0x54c9f5d>
1454caf59:     	movaps	%xmm11, %xmm0
1454caf5d:     	movq	0x10(%r8), %rdx
1454caf61:     	leaq	(%rcx,%rcx,8), %r8
1454caf65:     	leaq	(%r8,%r8,2), %r8
1454caf69:     	addq	%rcx, %r8
1454caf6c:     	mulss	0x18(%rdx,%r8), %xmm0
1454caf73:     	movss	%xmm0, (%rax)
1454caf77:     	movq	0x30(%rdi), %rax
1454caf7b:     	movq	0x18(%rax), %rdx
1454caf7f:     	cmpq	%rdx, %rcx
1454caf82:     	jae	0x1454ce6ff <.text+0x54cd6ff>
1454caf88:     	movq	0x10(%rax), %rax
1454caf8c:     	movq	0x10(%rax,%r8), %rcx
1454caf91:     	movq	%rcx, 0x200(%rbp)
1454caf98:     	movups	(%rax,%r8), %xmm0
1454caf9d:     	movaps	%xmm0, 0x1f0(%rbp)
1454cafa4:     	movq	0xf0(%rbp), %rsi
1454cafab:     	cmpq	0xe0(%rbp), %rsi
1454cafb2:     	jne	0x1454caed0 <.text+0x54c9ed0>
1454cafb8:     	movb	$0x1, 0x2b7(%rbp)
1454cafbf:     	movb	$0x1, 0x2b6(%rbp)
1454cafc6:     	movb	$0x1, 0x2b5(%rbp)
1454cafcd:     	movb	$0x1, 0x2b4(%rbp)
1454cafd4:     	movb	$0x1, 0x2b3(%rbp)
1454cafdb:     	movb	$0x1, 0x2b2(%rbp)
1454cafe2:     	movb	$0x1, 0x2b1(%rbp)
1454cafe9:     	movb	$0x1, 0x2b0(%rbp)
1454caff0:     	movb	$0x1, 0x2af(%rbp)
1454caff7:     	leaq	0xe0(%rbp), %rcx
1454caffe:     	callq	0x1457580b0 <.text+0x57570b0>
1454cb003:     	nop
1454cb004:     	jmp	0x1454caed0 <.text+0x54c9ed0>

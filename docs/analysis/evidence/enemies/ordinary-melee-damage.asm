
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cb959:     	movaps	%xmm11, %xmm1
1454cb95d:     	subss	0xa0(%rdi), %xmm1
1454cb965:     	movss	0xf8(%rdi), %xmm2
1454cb96d:     	movaps	%xmm6, %xmm0
1454cb970:     	cmpltss	0xa4(%rdi), %xmm0
1454cb979:     	mulss	%xmm2, %xmm1
1454cb97d:     	andps	%xmm0, %xmm1
1454cb980:     	andnps	%xmm2, %xmm0
1454cb983:     	orps	%xmm1, %xmm0
1454cb986:     	movaps	%xmm0, %xmm9
1454cb98a:     	mulss	0x42d3ad(%rip), %xmm9   # 0x1458f8d40
1454cb993:     	testb	$0x1, 0x38(%rdi)
1454cb997:     	jne	0x1454cb9bd <.text+0x54ca9bd>
1454cb999:     	movaps	%xmm0, %xmm9
1454cb99d:     	cmpq	$-0x1, 0x18(%rdi)
1454cb9a2:     	je	0x1454cb9c4 <.text+0x54ca9c4>
1454cb9a4:     	movq	0x88(%rdi), %rdi
1454cb9ab:     	movq	0x120(%rbp), %rsi
1454cb9b2:     	cmpq	0x110(%rbp), %rsi
1454cb9b9:     	je	0x1454cb9df <.text+0x54ca9df>
1454cb9bb:     	jmp	0x1454cba2b <.text+0x54caa2b>
1454cb9bd:     	cmpq	$-0x1, 0x18(%rdi)
1454cb9c2:     	jne	0x1454cb9a4 <.text+0x54ca9a4>
1454cb9c4:     	movaps	%xmm0, %xmm9
1454cb9c8:     	movq	0x88(%rdi), %rdi
1454cb9cf:     	movq	0x120(%rbp), %rsi
1454cb9d6:     	cmpq	0x110(%rbp), %rsi
1454cb9dd:     	jne	0x1454cba2b <.text+0x54caa2b>
1454cb9df:     	movb	$0x1, 0x2b7(%rbp)
1454cb9e6:     	movb	$0x1, 0x2b6(%rbp)
1454cb9ed:     	movb	$0x1, 0x2b5(%rbp)
1454cb9f4:     	movb	$0x1, 0x2b4(%rbp)
1454cb9fb:     	movb	$0x1, 0x2b3(%rbp)
1454cba02:     	movb	$0x1, 0x2b2(%rbp)
1454cba09:     	movb	$0x1, 0x2b1(%rbp)
1454cba10:     	movb	$0x1, 0x2b0(%rbp)
1454cba17:     	movb	$0x1, 0x2af(%rbp)
1454cba1e:     	leaq	0x110(%rbp), %rcx
1454cba25:     	callq	0x145758200 <.text+0x5757200>
1454cba2a:     	nop
1454cba2b:     	movq	0x118(%rbp), %rax
1454cba32:     	movq	%rsi, %rcx
1454cba35:     	shlq	$0x4, %rcx
1454cba39:     	movss	%xmm9, (%rax,%rcx)
1454cba3f:     	movq	%rdi, 0x8(%rax,%rcx)
1454cba44:     	incq	%rsi
1454cba47:     	movq	%rsi, 0x120(%rbp)
1454cba4e:     	movq	0x2a0(%rbp), %r12
1454cba55:     	jmp	0x1454c9a4c <.text+0x54c8a4c>

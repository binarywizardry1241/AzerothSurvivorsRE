
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c4050:     	incl	0x65c(%rsi)
1454c4056:     	testb	%r15b, %r15b
1454c4059:     	je	0x1454c4061 <.text+0x54c3061>
1454c405b:     	incl	0x660(%rsi)
1454c4061:     	movss	0x494(%rsi), %xmm12
1454c406a:     	xorps	%xmm0, %xmm0
1454c406d:     	ucomiss	%xmm0, %xmm12
1454c4071:     	jbe	0x1454c41d3 <.text+0x54c31d3>
1454c4077:     	movb	$0x0, 0x177(%rbp)
1454c407e:     	leaq	0x14e77cd(%rip), %r15   # 0x1469ab852
1454c4085:     	movl	$0xf, %edx
1454c408a:     	movq	%r15, %rcx
1454c408d:     	callq	0x145452400 <.text+0x5451400>
1454c4092:     	nop
1454c4093:     	movss	0x400(%rsi), %xmm2
1454c409b:     	movss	0x458(%rsi), %xmm7
1454c40a3:     	addss	%xmm2, %xmm12
1454c40a8:     	movaps	%xmm12, %xmm1
1454c40ac:     	minss	%xmm7, %xmm1
1454c40b0:     	movaps	%xmm1, %xmm0
1454c40b3:     	cmpunordss	%xmm1, %xmm0
1454c40b8:     	andps	%xmm0, %xmm12
1454c40bc:     	andnps	%xmm1, %xmm0
1454c40bf:     	orps	%xmm12, %xmm0
1454c40c3:     	movss	%xmm0, 0x400(%rsi)
1454c40cb:     	movaps	%xmm0, %xmm1
1454c40ce:     	subss	%xmm2, %xmm1


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14591a239:     	movss	0xd8(%r8), %xmm8
14591a242:     	addss	0x453405(%rip), %xmm8   # 0x145d6d650
14591a24b:     	movss	0x459df5(%rip), %xmm0   # 0x145d74048
14591a253:     	mulss	%xmm8, %xmm0
14591a258:     	divss	0x453010(%rip), %xmm0   # 0x145d6d270
14591a260:     	callq	0x145bc981d <.text+0x5bc881d>
14591a265:     	cvttss2si	%xmm0, %rax
14591a26a:     	movq	%rax, %rcx
14591a26d:     	sarq	$0x3f, %rcx
14591a271:     	movaps	%xmm0, %xmm1
14591a274:     	subss	0x483be4(%rip), %xmm1   # 0x145d9de60
14591a27c:     	cvttss2si	%xmm1, %rdx
14591a281:     	andq	%rcx, %rdx
14591a284:     	orq	%rax, %rdx
14591a287:     	xorl	%esi, %esi
14591a289:     	xorps	%xmm1, %xmm1
14591a28c:     	ucomiss	%xmm1, %xmm0
14591a28f:     	cmovbq	%rsi, %rdx
14591a293:     	ucomiss	0x483bca(%rip), %xmm0   # 0x145d9de64
14591a29a:     	movq	$-0x1, %rbx
14591a2a1:     	cmovbeq	%rdx, %rbx
14591a2a5:     	testq	%rbx, %rbx
14591a2a8:     	js	0x14591a2b5 <.text+0x59192b5>
14591a2aa:     	xorps	%xmm9, %xmm9
14591a2ae:     	cvtsi2ss	%rbx, %xmm9
14591a2b3:     	jmp	0x14591a2d1 <.text+0x59192d1>
14591a2b5:     	movq	%rbx, %rax
14591a2b8:     	shrq	%rax
14591a2bb:     	movl	%ebx, %ecx
14591a2bd:     	andl	$0x1, %ecx
14591a2c0:     	orq	%rax, %rcx
14591a2c3:     	xorps	%xmm9, %xmm9
14591a2c7:     	cvtsi2ss	%rcx, %xmm9
14591a2cc:     	addss	%xmm9, %xmm9
14591a2d1:     	movss	0x459d6e(%rip), %xmm10  # 0x145d74048
14591a2da:     	leaq	0x140(%rbp), %rdi
14591a2e1:     	xorl	%r15d, %r15d
14591a2e4:     	movq	0xf0(%rbp), %r14
14591a2eb:     	jmp	0x14591a31e <.text+0x591931e>
14591a2ed:     	nopl	(%rax)
14591a2f0:     	movd	%xmm6, %eax
14591a2f4:     	movd	%xmm7, %ecx
14591a2f8:     	shlq	$0x20, %rcx
14591a2fc:     	orq	%rcx, %rax
14591a2ff:     	movq	0x148(%rbp), %rcx
14591a306:     	movq	%rax, (%rcx,%rsi,8)
14591a30a:     	incq	%rsi
14591a30d:     	movq	%rsi, 0x150(%rbp)
14591a314:     	incq	%r15
14591a317:     	movq	0x138(%rbp), %r13
14591a31e:     	cmpq	%rbx, %r15
14591a321:     	jae	0x145919e9d <.text+0x5918e9d>
14591a327:     	testq	%r15, %r15
14591a32a:     	js	0x14591a340 <.text+0x5919340>
14591a32c:     	xorps	%xmm7, %xmm7
14591a32f:     	cvtsi2ss	%r15, %xmm7
14591a334:     	jmp	0x14591a35b <.text+0x591935b>
14591a336:     	nopw	%cs:(%rax,%rax)
14591a340:     	movq	%r15, %rax
14591a343:     	shrq	%rax
14591a346:     	movl	%r15d, %ecx
14591a349:     	andl	$0x1, %ecx
14591a34c:     	orq	%rax, %rcx
14591a34f:     	xorps	%xmm7, %xmm7
14591a352:     	cvtsi2ss	%rcx, %xmm7
14591a357:     	addss	%xmm7, %xmm7
14591a35b:     	mulss	%xmm10, %xmm7
14591a360:     	divss	%xmm9, %xmm7
14591a365:     	movaps	%xmm7, %xmm0
14591a368:     	callq	0x145bc97c3 <.text+0x5bc87c3>
14591a36d:     	movaps	%xmm0, %xmm6
14591a370:     	mulss	%xmm8, %xmm6
14591a375:     	addss	0xc8(%r14), %xmm6
14591a37e:     	movaps	%xmm7, %xmm0
14591a381:     	callq	0x145bc97bd <.text+0x5bc87bd>
14591a386:     	movaps	%xmm0, %xmm7
14591a389:     	mulss	%xmm8, %xmm7
14591a38e:     	addss	0xcc(%r14), %xmm7
14591a397:     	cmpq	0x140(%rbp), %rsi
14591a39e:     	jne	0x14591a2f0 <.text+0x59192f0>
14591a3a4:     	movb	$0x1, 0x17f(%rbp)
14591a3ab:     	movq	%rdi, %rcx
14591a3ae:     	callq	0x145bfb120 <.text+0x5bfa120>
14591a3b3:     	nop
14591a3b4:     	jmp	0x14591a2f0 <.text+0x59192f0>

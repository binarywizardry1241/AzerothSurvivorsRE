
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145950241:     	movq	0x30(%rax), %r9
145950245:     	movl	0x38(%rax), %r8d
145950249:     	cmpl	$0xa, %r8d
14595024d:     	movl	$0xa, %r10d
145950253:     	cmovbl	%r8d, %r10d
145950257:     	xorl	%ecx, %ecx
145950259:     	cmpq	%rbx, %r9
14595025c:     	cmovel	%r10d, %ecx
145950260:     	testb	%r15b, %r15b
145950263:     	jne	0x14595029a <.text+0x594f29a>
145950265:     	movl	%r11d, %r15d
145950268:     	leaq	0x30(%rax), %rdx
14595026c:     	addq	$0x38, %rax
145950270:     	incl	%r8d
145950273:     	xorps	%xmm7, %xmm7
145950276:     	cvtsi2ss	%ecx, %xmm7
14595027a:     	cmpq	%rbx, %r9
14595027d:     	movl	$0x1, %ecx
145950282:     	cmovel	%r8d, %ecx
145950286:     	mulss	0x41d282(%rip), %xmm7   # 0x145d6d510
14595028e:     	movq	%rbx, %r8
145950291:     	jmp	0x1459502d7 <.text+0x594f2d7>
145950293:     	xorl	%ecx, %ecx
145950295:     	testb	%r15b, %r15b
145950298:     	je	0x1459502c9 <.text+0x594f2c9>
14595029a:     	xorps	%xmm7, %xmm7
14595029d:     	cvtsi2ss	%ecx, %xmm7
1459502a1:     	mulss	0x41d267(%rip), %xmm7   # 0x145d6d510
1459502a9:     	leaq	0x152a60f(%rip), %rax   # 0x146e7a8bf
1459502b0:     	movq	%rax, 0x70(%rbp)
1459502b4:     	movl	$0xe, %eax
1459502b9:     	movq	%rax, 0x78(%rbp)
1459502bd:     	movl	$0x0, 0x88(%rbp)
1459502c7:     	jmp	0x145950310 <.text+0x594f310>
1459502c9:     	movl	%r11d, %r15d
1459502cc:     	leaq	0x30(%rax), %rdx
1459502d0:     	addq	$0x38, %rax
1459502d4:     	xorl	%r8d, %r8d
1459502d7:     	movq	%r8, (%rdx)
1459502da:     	movl	%ecx, (%rax)

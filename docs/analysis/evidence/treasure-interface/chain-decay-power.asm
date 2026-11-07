
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454fbe1c:     	shrq	$0x28, %rdx
1454fbe20:     	xorps	%xmm15, %xmm15
1454fbe24:     	cvtsi2ss	%edx, %xmm15
1454fbe29:     	movq	%r10, 0x8b0(%rdi)
1454fbe30:     	movq	%rax, 0x8b8(%rdi)
1454fbe37:     	mulss	0x50c560(%rip), %xmm15  # 0x145a083a0
1454fbe40:     	movss	0x47c(%rdi), %xmm8
1454fbe49:     	xorps	%xmm1, %xmm1
1454fbe4c:     	cvtsi2ss	%r15d, %xmm1
1454fbe51:     	movss	0x3c(%rbp), %xmm0
1454fbe56:     	callq	0x145773283 <.text+0x5772283>
1454fbe5b:     	movaps	%xmm0, %xmm6
1454fbe5e:     	mulss	%xmm10, %xmm6
1454fbe63:     	movq	0x78(%rbp), %rcx
1454fbe67:     	movl	0x68(%rcx), %r8d
1454fbe6b:     	movss	0x6c(%rcx), %xmm13
1454fbe71:     	leal	-0x1(%r8), %eax
1454fbe75:     	cmpl	$0x9, %eax
1454fbe78:     	movq	%rsi, 0xa0(%rbp)
1454fbe7f:     	movq	%rbx, -0x28(%rbp)

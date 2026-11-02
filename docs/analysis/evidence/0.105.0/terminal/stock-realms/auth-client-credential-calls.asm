
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140ea2481:     	movq	(%rcx), %rdx
140ea2484:     	movq	0x8(%rcx), %r8
140ea2488:     	leaq	0x4f0(%rbp), %rcx
140ea248f:     	callq	0x140f5c210 <.text+0xf5b210>
140ea2494:     	nop
140ea2495:     	movq	0x4f0(%rbp), %rax
140ea249c:     	cmpq	$-0x1, %rax
140ea24a0:     	je	0x140ea25f0 <.text+0xea15f0>
140ea24a6:     	movups	0x4f8(%rbp), %xmm0
140ea24ad:     	movq	0x7c8(%rbp), %rcx
140ea24b4:     	movb	$0x1, 0x24e(%rcx)
140ea24bb:     	movq	%rax, 0x120(%rcx)
140ea24c2:     	movups	%xmm0, 0x128(%rcx)
140ea24c9:     	leaq	0x4f0(%rbp), %rcx
140ea24d0:     	movq	%rbx, %rdx
140ea24d3:     	movq	%r14, %r8
140ea24d6:     	callq	0x140f5c210 <.text+0xf5b210>
140ea24db:     	nop
140ea24dc:     	movq	0x4f0(%rbp), %rax
140ea24e3:     	cmpq	$-0x1, %rax
140ea24e7:     	je	0x140ea2640 <.text+0xea1640>
140ea24ed:     	movups	0x4f8(%rbp), %xmm0
140ea24f4:     	movq	0x7c8(%rbp), %r14
140ea24fb:     	movb	$0x1, 0x24d(%r14)
140ea2503:     	movq	%rax, 0x138(%r14)
140ea250a:     	movups	%xmm0, 0x140(%r14)

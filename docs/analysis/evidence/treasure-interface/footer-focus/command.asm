
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140177830:     	pushq	%rsi
140177831:     	subq	$0x30, %rsp
140177835:     	addq	$0x10, (%r8)
140177839:     	testq	%rdx, %rdx
14017783c:     	je	0x140177864 <.text+0x176864>
14017783e:     	movups	(%rcx), %xmm0
140177841:     	movaps	%xmm0, 0x20(%rsp)
140177846:     	leaq	0x20(%rsp), %rcx
14017784b:     	movq	%rdx, %rsi
14017784e:     	callq	0x14005daa0 <.text+0x5caa0>
140177853:     	movq	%rsi, %rcx
140177856:     	callq	0x144e89050 <.text+0x4e88050>
14017785b:     	movq	%rsi, %rcx
14017785e:     	callq	0x144e89000 <.text+0x4e88000>
140177863:     	nop
140177864:     	addq	$0x30, %rsp
140177868:     	popq	%rsi
140177869:     	retq

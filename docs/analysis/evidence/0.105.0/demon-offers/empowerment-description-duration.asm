
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14596eae5:     	movss	0x58(%rdi), %xmm1
14596eaea:     	mulss	0x40524e(%rip), %xmm1   # 0x145d73d40
14596eaf2:     	movq	0x1b8(%rbp), %rax
14596eaf9:     	mulss	0x38(%rax), %xmm1
14596eafe:     	mulss	0x54(%rax), %xmm1
14596eb03:     	leaq	0x60(%rbp), %r14
14596eb07:     	movq	%r14, %rcx
14596eb0a:     	callq	0x145974550 <.text+0x5973550>

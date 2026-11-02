
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140ea4f34:     	leaq	0x268(%rbp), %rax
140ea4f3b:     	movq	0x20(%rax), %rcx
140ea4f3f:     	movq	%rcx, 0x510(%rbp)
140ea4f46:     	movups	(%rax), %xmm0
140ea4f49:     	movups	0x10(%rax), %xmm1
140ea4f4d:     	movaps	%xmm1, 0x500(%rbp)
140ea4f54:     	movaps	%xmm0, 0x4f0(%rbp)
140ea4f5b:     	movq	%r14, 0x6e0(%rbp)
140ea4f62:     	leaq	0x4b7a357(%rip), %rax   # 0x145a1f2c0 <.text+0x5a1e2c0>
140ea4f69:     	movq	%rax, 0x6e8(%rbp)
140ea4f70:     	leaq	0x50efa7c(%rip), %rcx   # 0x145f949f3
140ea4f77:     	leaq	0x6e0(%rbp), %rdx
140ea4f7e:     	callq	0x145bf6f10 <.text+0x5bf5f10>
140ea4f83:     	nop
140ea4f84:     	jmp	0x140ea4df5 <.text+0xea3df5>

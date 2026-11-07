
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cd244:     	mulss	0xf4(%rax,%rcx), %xmm2
1454cd24d:     	movq	%r8, %rdx
1454cd250:     	movb	0x129(%r12), %bl
1454cd258:     	movb	$0x3, 0x129(%r12)
1454cd261:     	testl	%r9d, %r9d
1454cd264:     	sete	0x30(%rsp)
1454cd269:     	movzbl	0x217(%rbp), %eax
1454cd270:     	movb	%al, 0x20(%rsp)
1454cd274:     	movb	$0x0, 0x28(%rsp)
1454cd279:     	movq	%r12, %rcx
1454cd27c:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454cd281:     	nop
1454cd282:     	movb	%bl, 0x129(%r12)
1454cd28a:     	jmp	0x1454cbc68 <.text+0x54cac68>

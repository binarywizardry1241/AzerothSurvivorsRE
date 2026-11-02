
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a2e06:     	movzbl	0x29d(%rdi), %r15d
1454a2e0e:     	leal	-0x2(%r15), %r13d
1454a2e12:     	movl	$0x1, %r8d
1454a2e18:     	cmpb	$0x6, %r13b
1454a2e1c:     	ja	0x1454a2e2d <.text+0x54a1e2d>
1454a2e1e:     	movzbl	%r13b, %eax
1454a2e22:     	leaq	0x1555727(%rip), %rcx   # 0x1469f8550
1454a2e29:     	movl	(%rcx,%rax,4), %r8d


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d70af:     	movl	-0xf8(%rax,%rcx), %r8d
1454d70b7:     	movq	-0xd0(%rax,%rcx), %rdx
1454d70bf:     	testq	%rdx, %rdx
1454d70c2:     	je	0x1454d77a6 <.text+0x54d67a6>
1454d70c8:     	testl	%r8d, %r8d
1454d70cb:     	jne	0x1454d77c7 <.text+0x54d67c7>
1454d70d1:     	movss	-0x58(%rax,%rcx), %xmm3
1454d70d7:     	movl	0x24(%rdx), %r8d
1454d70db:     	movb	$0x1, 0x176(%rbp)
1454d70e2:     	movq	%rsi, %rcx
1454d70e5:     	movq	%rdi, %rdx
1454d70e8:     	callq	0x1454e75f0 <.text+0x54e65f0>

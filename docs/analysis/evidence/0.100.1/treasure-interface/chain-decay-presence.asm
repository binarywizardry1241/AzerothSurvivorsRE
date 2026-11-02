
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454fb4a9:     	movq	0x710(%rdi), %rax
1454fb4b0:     	movq	0x718(%rdi), %rcx
1454fb4b7:     	shlq	$0x6, %rcx
1454fb4bb:     	xorl	%edx, %edx
1454fb4bd:     	movss	0x41a3e7(%rip), %xmm0   # 0x1459158ac
1454fb4c5:     	movss	%xmm0, 0x3c(%rbp)
1454fb4ca:     	movss	0x40bfbe(%rip), %xmm0   # 0x145907490
1454fb4d2:     	nopw	%cs:(%rax,%rax)
1454fb4e0:     	cmpq	%rdx, %rcx
1454fb4e3:     	je	0x1454fb4f4 <.text+0x54fa4f4>
1454fb4e5:     	cmpb	$0x17, (%rax,%rdx)
1454fb4e9:     	leaq	0x40(%rdx), %rdx
1454fb4ed:     	jne	0x1454fb4e0 <.text+0x54fa4e0>
1454fb4ef:     	movss	%xmm0, 0x3c(%rbp)


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cde9f:     	movq	0x40(%rbp), %rcx
1454cdea3:     	cmpq	(%rcx), %rsi
1454cdea6:     	jne	0x1454cdeb7 <.text+0x54cceb7>
1454cdea8:     	movq	0x40(%rbp), %rcx
1454cdeac:     	callq	0x145774860 <.text+0x5773860>
1454cdeb1:     	nop
1454cdeb2:     	movq	0x58(%r12), %rax
1454cdeb7:     	addss	%xmm11, %xmm9
1454cdebc:     	movq	0x208(%rbp), %rcx
1454cdec3:     	movq	%rcx, (%rax,%rdi)
1454cdec7:     	movl	$0x1, 0x8(%rax,%rdi)
1454cdecf:     	movss	%xmm9, 0xc(%rax,%rdi)
1454cded6:     	incq	%rsi
1454cded9:     	movq	%rsi, 0x60(%r12)
1454cdede:     	movb	$0x1, %al
1454cdee0:     	movq	%rax, 0x70(%rbp)
1454cdee4:     	movq	%rbx, %rdi

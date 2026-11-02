
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145450bf0:     	pushq	%rsi
145450bf1:     	subq	$0x20, %rsp
145450bf5:     	movq	%rcx, %rsi
145450bf8:     	callq	0x140002200 <.text+0x1200>
145450bfd:     	movl	$0x1, %ecx
145450c02:     	movl	$0x1, %edx
145450c07:     	callq	0x1400021c0 <.text+0x11c0>
145450c0c:     	testq	%rax, %rax
145450c0f:     	je	0x145450c34 <.text+0x544fc34>
145450c11:     	movb	$0x7b, (%rax)
145450c14:     	movq	$0x1, (%rsi)
145450c1b:     	movq	%rax, 0x8(%rsi)
145450c1f:     	movq	$0x1, 0x10(%rsi)
145450c27:     	movb	$0x1, 0x18(%rsi)
145450c2b:     	movq	%rsi, %rax
145450c2e:     	addq	$0x20, %rsp
145450c32:     	popq	%rsi
145450c33:     	retq
145450c34:     	movl	$0x1, %ecx
145450c39:     	movl	$0x1, %edx
145450c3e:     	callq	0x1458e721b <.text+0x58e621b>
145450c43:     	ud2

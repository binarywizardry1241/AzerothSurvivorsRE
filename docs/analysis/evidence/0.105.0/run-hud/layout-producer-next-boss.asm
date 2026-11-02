
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458fbcc1:     	movq	0xb0(%rbp), %rdi
1458fbcc8:     	movq	0x988(%rdi), %rsi
1458fbccf:     	cmpq	$0x5, %rsi
1458fbcd3:     	movq	%r8, -0x18(%rbp)
1458fbcd7:     	movb	%r9b, 0xe5(%rbp)
1458fbcde:     	jae	0x1458fbd32 <.text+0x58fad32>
1458fbce0:     	movq	0x290(%rdi), %rcx
1458fbce7:     	movq	0x298(%rdi), %rdx
1458fbcee:     	callq	0x1458753b0 <.text+0x58743b0>
1458fbcf3:     	imulq	$0xf0, %rax, %rax
1458fbcfa:     	leaq	0x12ad74f(%rip), %rcx   # 0x146ba9450
1458fbd01:     	movq	0x88(%rax,%rcx), %rax
1458fbd09:     	imulq	$0x58, %rsi, %rcx
1458fbd0d:     	movss	0x40(%rax,%rcx), %xmm7
1458fbd13:     	mulss	0x4c3865(%rip), %xmm7   # 0x145dbf580
1458fbd1b:     	movss	0x9ec(%rdi), %xmm8
1458fbd24:     	subss	%xmm8, %xmm7
1458fbd29:     	movb	$0x1, 0xef(%rbp)
1458fbd30:     	jmp	0x1458fbd55 <.text+0x58fad55>
1458fbd32:     	movzbl	0xa64(%rdi), %eax
1458fbd39:     	movb	%al, 0xef(%rbp)
1458fbd3f:     	movss	0x9ec(%rdi), %xmm8
1458fbd48:     	movss	0xa3c(%rdi), %xmm7
1458fbd50:     	subss	%xmm8, %xmm7

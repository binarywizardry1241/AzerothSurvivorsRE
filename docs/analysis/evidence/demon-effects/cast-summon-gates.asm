
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592c741:     	movq	0x10(%rbp), %rcx
14592c745:     	callq	0x1458e3da0 <.text+0x58e2da0>
14592c74a:     	cmpl	$0x1, %eax
14592c74d:     	je	0x145929e10 <.text+0x5928e10>
14592c753:     	movq	0x218(%rbp), %r11
14592c75a:     	movq	0xd0(%r11), %rcx
14592c761:     	imulq	$0x78, 0xd8(%r11), %rax
14592c769:     	movq	0xf0(%rbp), %rdx
14592c770:     	testq	%rax, %rax
14592c773:     	je	0x14592d39d <.text+0x592c39d>
14592c779:     	addq	$-0x78, %rax
14592c77d:     	cmpq	%rdx, 0x18(%rcx)
14592c781:     	leaq	0x78(%rcx), %rcx
14592c785:     	jne	0x14592c770 <.text+0x592b770>
14592c787:     	jmp	0x145929e10 <.text+0x5928e10>
14592c78c:     	movq	0x218(%rbp), %r9
14592c793:     	movss	0x9ec(%r9), %xmm1
14592c79c:     	movq	0xd0(%r9), %rcx
14592c7a3:     	imulq	$0x78, 0xd8(%r9), %rax
14592c7ab:     	movq	0x1e0(%rbp), %r8
14592c7b2:     	testq	%rax, %rax
14592c7b5:     	je	0x14592d018 <.text+0x592c018>
14592c7bb:     	movq	%rcx, %rdx
14592c7be:     	addq	$0x78, %rcx
14592c7c2:     	addq	$-0x78, %rax
14592c7c6:     	cmpq	$0x1, (%rdx)
14592c7ca:     	jne	0x14592c7b2 <.text+0x592b7b2>
14592c7cc:     	cmpq	%r8, 0x10(%rdx)
14592c7d0:     	jne	0x14592c7b2 <.text+0x592b7b2>
14592c7d2:     	jmp	0x145929e10 <.text+0x5928e10>

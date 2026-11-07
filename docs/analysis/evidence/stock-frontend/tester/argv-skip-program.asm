
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140001276:     	leaq	0xf0(%rbp), %rsi
14000127d:     	movq	%rsi, %rcx
140001280:     	callq	0x145b83a40 <.text+0x5b82a40>
140001285:     	movq	$0x0, 0x110(%rbp)
140001290:     	movb	$0x1, 0x18e(%rbp)
140001297:     	leaq	0x80(%rbp), %rcx
14000129e:     	movq	%rsi, %rdx
1400012a1:     	callq	0x145b91150 <.text+0x5b90150>
1400012a6:     	nop
1400012a7:     	movq	0x80(%rbp), %rdx
1400012ae:     	cmpq	$-0x1, %rdx
1400012b2:     	je	0x14000135f <.text+0x35f>
1400012b8:     	testq	%rdx, %rdx
1400012bb:     	je	0x1400012cf <.text+0x2cf>
1400012bd:     	movq	0x88(%rbp), %rcx
1400012c4:     	movl	$0x1, %r8d
1400012ca:     	callq	0x1400021d0 <.text+0x11d0>
1400012cf:     	movb	$0x1, 0x18e(%rbp)
1400012d6:     	leaq	-0x60(%rbp), %rcx
1400012da:     	leaq	0xf0(%rbp), %rdx
1400012e1:     	callq	0x145b91150 <.text+0x5b90150>


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14544518a:     	movzbl	0x1(%rbx), %edx
14544518e:     	shll	$0x8, %edx
145445191:     	cmpq	$0x3, %r12
145445195:     	jb	0x1454451b0 <.text+0x54441b0>
145445197:     	movzbl	0x2(%rbx), %eax
14544519b:     	shll	$0x10, %eax
14544519e:     	cmpq	$0x3, %r12
1454451a2:     	je	0x1454451b0 <.text+0x54441b0>
1454451a4:     	movzbl	0x3(%rbx), %r8d
1454451a9:     	shll	$0x18, %r8d
1454451ad:     	orl	%r8d, %eax
1454451b0:     	orl	%edx, %eax
1454451b2:     	movzbl	%cl, %edx
1454451b5:     	orl	%eax, %edx
1454451b7:     	leaq	0x1600(%rbp), %rbx
1454451be:     	movq	%rbx, %rcx
1454451c1:     	movb	$0x17, %r8b
1454451c4:     	callq	0x14545a870 <.text+0x5459870>
1454451c9:     	movq	0xa08(%rsi), %rcx
1454451d0:     	movq	0xa10(%rsi), %rdx
1454451d7:     	movq	%rdi, %r8
1454451da:     	movq	%rbx, %r9
1454451dd:     	callq	0x14543f3c0 <.text+0x543e3c0>
1454451e2:     	cmpl	$0x2, 0x10(%rsi)
1454451e6:     	je	0x145447a82 <.text+0x5446a82>
1454451ec:     	movq	%rsi, %rcx
1454451ef:     	movzbl	0x9c9(%rsi), %eax
1454451f6:     	addq	$0x10, %rcx
1454451fa:     	leal	-0x4(%rax), %edx
1454451fd:     	cmpl	$0x2, %edx
145445200:     	jae	0x1454453cb <.text+0x54443cb>
145445206:     	callq	0x1454f0640 <.text+0x54ef640>

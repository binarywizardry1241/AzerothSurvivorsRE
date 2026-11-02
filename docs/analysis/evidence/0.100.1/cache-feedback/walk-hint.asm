
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b77b0:     	cmpl	$0x2, %ebx
1454b77b3:     	jne	0x1454b7830 <.text+0x54b6830>
1454b77b5:     	movq	0x368(%rbp), %rcx
1454b77bc:     	cmpb	$0x0, 0x9ad(%rcx)
1454b77c3:     	je	0x1454b7820 <.text+0x54b6820>
1454b77c5:     	cmpb	$0x0, 0x9b0(%rcx)
1454b77cc:     	movb	$0x1, 0x9b0(%rcx)
1454b77d3:     	jne	0x1454b7770 <.text+0x54b6770>
1454b77d5:     	movl	$0x1e, %edx
1454b77da:     	leaq	0x153fa1f(%rip), %rcx   # 0x1469f7200
1454b77e1:     	callq	0x145457cb0 <.text+0x5456cb0>
1454b77e6:     	nop
1454b77e7:     	movq	%rdx, %r8
1454b77ea:     	testq	%rax, %rax
1454b77ed:     	leaq	0x153fa0c(%rip), %rcx   # 0x1469f7200
1454b77f4:     	cmoveq	%rcx, %rax
1454b77f8:     	movl	$0x1e, %ecx
1454b77fd:     	cmoveq	%rcx, %r8
1454b7801:     	movq	0x368(%rbp), %rcx
1454b7808:     	movq	%rax, %rdx
1454b780b:     	callq	0x1454e4340 <.text+0x54e3340>
1454b7810:     	nop
1454b7811:     	jmp	0x1454b7770 <.text+0x54b6770>
1454b7816:     	nopw	%cs:(%rax,%rax)
1454b7820:     	callq	0x1454e5660 <.text+0x54e4660>
1454b7825:     	nop
1454b7826:     	testb	%al, %al
1454b7828:     	je	0x1454b7770 <.text+0x54b6770>

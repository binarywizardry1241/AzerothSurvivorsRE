
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454875e0:     	pushq	%rsi
1454875e1:     	pushq	%rdi
1454875e2:     	subq	$0x28, %rsp
1454875e6:     	movzbl	%cl, %eax
1454875e9:     	decl	%eax
1454875eb:     	cmpl	$0x5, %eax
1454875ee:     	ja	0x145487654 <.text+0x5486654>
1454875f0:     	leaq	0x156e47d(%rip), %rcx   # 0x1469f5a74
1454875f7:     	movslq	(%rcx,%rax,4), %rax
1454875fb:     	addq	%rcx, %rax
1454875fe:     	jmpq	*%rax
145487600:     	leaq	0x1556031(%rip), %rsi   # 0x1469dd638
145487607:     	jmp	0x145487635 <.text+0x5486635>
145487609:     	leaq	0x155f2c0(%rip), %rsi   # 0x1469e68d0
145487610:     	jmp	0x145487648 <.text+0x5486648>
145487612:     	leaq	0x156d1df(%rip), %rsi   # 0x1469f47f8
145487619:     	jmp	0x145487648 <.text+0x5486648>
14548761b:     	leaq	0x15642ae(%rip), %rsi   # 0x1469eb8d0
145487622:     	movl	$0x5, %edi
145487627:     	movl	$0x5, %edx
14548762c:     	jmp	0x145487665 <.text+0x5486665>
14548762e:     	leaq	0x1563583(%rip), %rsi   # 0x1469eabb8
145487635:     	movl	$0x4, %edi
14548763a:     	movl	$0x4, %edx
14548763f:     	jmp	0x145487665 <.text+0x5486665>
145487641:     	leaq	0x15627f8(%rip), %rsi   # 0x1469e9e40
145487648:     	movl	$0x6, %edi
14548764d:     	movl	$0x6, %edx
145487652:     	jmp	0x145487665 <.text+0x5486665>
145487654:     	leaq	0x156d1a3(%rip), %rsi   # 0x1469f47fe
14548765b:     	movl	$0x8, %edi
145487660:     	movl	$0x8, %edx
145487665:     	movq	%rsi, %rcx
145487668:     	callq	0x145457cb0 <.text+0x5456cb0>
14548766d:     	testq	%rax, %rax
145487670:     	cmoveq	%rdi, %rdx
145487674:     	cmoveq	%rsi, %rax
145487678:     	addq	$0x28, %rsp
14548767c:     	popq	%rdi
14548767d:     	popq	%rsi
14548767e:     	retq

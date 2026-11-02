
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14542f490:     	movq	0x68(%rcx), %rax
14542f494:     	movq	0x70(%rcx), %r8
14542f498:     	shlq	$0x5, %r8
14542f49c:     	xorl	%ecx, %ecx
14542f49e:     	xorl	%r9d, %r9d
14542f4a1:     	nopw	%cs:(%rax,%rax)
14542f4b0:     	cmpq	%r9, %r8
14542f4b3:     	je	0x14542f4c8 <.text+0x542e4c8>
14542f4b5:     	leaq	0x20(%r9), %r10
14542f4b9:     	cmpb	%dl, 0x4(%rax,%r9)
14542f4be:     	movq	%r10, %r9
14542f4c1:     	jne	0x14542f4b0 <.text+0x542e4b0>
14542f4c3:     	movl	-0x20(%rax,%r10), %ecx
14542f4c8:     	movl	$0x6e, %edx
14542f4cd:     	movl	$0x2, %eax
14542f4d2:     	nopw	%cs:(%rax,%rax)
14542f4e0:     	leal	-0x1e(%rdx), %r8d
14542f4e4:     	subl	%r8d, %ecx
14542f4e7:     	jb	0x14542f50a <.text+0x542e50a>
14542f4e9:     	leal	-0xf(%rdx), %r8d
14542f4ed:     	subl	%r8d, %ecx
14542f4f0:     	jb	0x14542f50e <.text+0x542e50e>
14542f4f2:     	subl	%edx, %ecx
14542f4f4:     	jb	0x14542f50d <.text+0x542e50d>
14542f4f6:     	addl	$0x2d, %edx
14542f4f9:     	addl	$0x3, %eax
14542f4fc:     	cmpl	$0x36b, %edx            # imm = 0x36B
14542f502:     	jne	0x14542f4e0 <.text+0x542e4e0>
14542f504:     	movl	$0x33, %eax
14542f509:     	retq
14542f50a:     	addl	$-0x2, %eax
14542f50d:     	retq
14542f50e:     	decl	%eax
14542f510:     	retq

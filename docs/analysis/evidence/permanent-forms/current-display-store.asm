
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f6026:     	movq	0x28(%rbp), %rax
1458f602a:     	testq	%rax, %rax
1458f602d:     	je	0x1458f6097 <.text+0x58f5097>
1458f602f:     	movq	0x30(%rbp), %rcx
1458f6033:     	movl	$0x83, %edx
1458f6038:     	movzwl	0x36(%rax), %r10d
1458f603d:     	movl	%r10d, %r11d
1458f6040:     	addl	%r11d, %r11d
1458f6043:     	movq	$-0x1, %r9
1458f604a:     	nopw	(%rax,%rax)
1458f6050:     	testq	%r11, %r11
1458f6053:     	je	0x1458f6080 <.text+0x58f5080>
1458f6055:     	movzwl	0x3a(%rax,%r9,2), %r15d
1458f605b:     	cmpl	%r15d, %edx
1458f605e:     	seta	%r15b
1458f6062:     	sbbb	$0x0, %r15b
1458f6066:     	incq	%r9
1458f6069:     	addq	$-0x2, %r11
1458f606d:     	cmpb	$0x1, %r15b
1458f6071:     	je	0x1458f6050 <.text+0x58f5050>
1458f6073:     	movzbl	%r15b, %r10d
1458f6077:     	testl	%r10d, %r10d
1458f607a:     	je	0x1458f6090 <.text+0x58f5090>
1458f607c:     	jmp	0x1458f6083 <.text+0x58f5083>
1458f607e:     	nop
1458f6080:     	movq	%r10, %r9
1458f6083:     	subq	$0x1, %rcx
1458f6087:     	jb	0x1458f6099 <.text+0x58f5099>
1458f6089:     	movq	0x50(%rax,%r9,8), %rax
1458f608e:     	jmp	0x1458f6038 <.text+0x58f5038>
1458f6090:     	movl	%r8d, 0x8(%rax,%r9,4)
1458f6095:     	jmp	0x1458f60c3 <.text+0x58f50c3>
1458f6097:     	xorl	%eax, %eax
1458f6099:     	movq	%rbx, -0x28(%rbp)
1458f609d:     	movq	%rax, -0x20(%rbp)
1458f60a1:     	movq	$0x0, -0x18(%rbp)
1458f60a9:     	movq	%r9, -0x10(%rbp)
1458f60ad:     	movq	$0x83, -0x8(%rbp)
1458f60b5:     	leaq	-0x48(%rbp), %rcx
1458f60b9:     	leaq	-0x28(%rbp), %rdx
1458f60bd:     	callq	0x1458e1710 <.text+0x58e0710>
1458f60c2:     	nop

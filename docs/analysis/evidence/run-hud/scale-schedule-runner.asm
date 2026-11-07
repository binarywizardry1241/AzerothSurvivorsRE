
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400591f0:     	pushq	%rbp
1400591f1:     	pushq	%rsi
1400591f2:     	pushq	%rdi
1400591f3:     	subq	$0x40, %rsp
1400591f7:     	leaq	0x40(%rsp), %rbp
1400591fc:     	movq	$-0x2, -0x8(%rbp)
140059204:     	movq	%rcx, %rsi
140059207:     	movl	(%rdx), %eax
140059209:     	movl	0x5b4(%r8), %ecx
140059210:     	movl	%ecx, -0xc(%rbp)
140059213:     	movl	%eax, 0x5b4(%r8)
14005921a:     	cmpb	$0x2, 0x8(%rdx)
14005921e:     	movq	%r8, -0x18(%rbp)
140059222:     	je	0x14005927b <.text+0x5827b>
140059224:     	movq	%r8, %r9
140059227:     	movq	%rdx, %rdi
14005922a:     	leaq	0x8(%rdx), %r8
14005922e:     	movq	%r9, %rdx
140059231:     	callq	0x14003db10 <.text+0x3cb10>
140059236:     	nop
140059237:     	movq	-0x18(%rbp), %rcx
14005923b:     	callq	0x144e7b3e0 <.text+0x4e7a3e0>
140059240:     	nop
140059241:     	movq	-0x18(%rbp), %rcx
140059245:     	callq	0x144e7b390 <.text+0x4e7a390>
14005924a:     	nop
14005924b:     	movq	-0x18(%rbp), %rdx
14005924f:     	movl	0x5b0(%rdx), %eax
140059255:     	leal	0x1(%rax), %ecx
140059258:     	movl	%ecx, 0x5b0(%rdx)
14005925e:     	movl	%eax, (%rdi)
140059260:     	movq	$-0x3, (%rsi)
140059267:     	movl	-0xc(%rbp), %eax
14005926a:     	movl	%eax, 0x5b4(%rdx)
140059270:     	movq	%rsi, %rax
140059273:     	addq	$0x40, %rsp
140059277:     	popq	%rdi
140059278:     	popq	%rsi
140059279:     	popq	%rbp
14005927a:     	retq
14005927b:     	leaq	0x5d691fe(%rip), %rcx   # 0x145dc2480
140059282:     	leaq	0x5d692d7(%rip), %r8    # 0x145dc2560
140059289:     	movl	$0x5f, %edx
14005928e:     	callq	0x145d69700 <.text+0x5d68700>
140059293:     	nop
140059294:     	ud2

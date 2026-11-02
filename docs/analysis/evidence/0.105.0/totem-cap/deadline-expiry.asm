
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14590b27a:     	cmpq	%rdi, %rsi
14590b27d:     	jae	0x14590bffe <.text+0x590affe>
14590b283:     	movq	0x5a8(%rbx), %rax
14590b28a:     	leaq	(%rax,%r15), %rcx
14590b28e:     	ucomiss	0x7c(%rax,%r15), %xmm10
14590b294:     	jb	0x14590b370 <.text+0x590a370>
14590b29a:     	cmpq	%rdi, %rsi
14590b29d:     	jae	0x145911383 <.text+0x5910383>
14590b2a3:     	movq	0x68(%rcx), %r14
14590b2a7:     	movq	0x70(%rcx), %rax
14590b2ab:     	movl	0x78(%rcx), %edx
14590b2ae:     	movq	(%rcx), %rsi
14590b2b1:     	movl	%edx, 0xa8(%rbp)
14590b2b7:     	movq	%rax, 0xa0(%rbp)
14590b2be:     	leaq	0x88(%rcx), %rdx
14590b2c5:     	leaq	(%rdi,%r12), %rax
14590b2c9:     	movq	%rax, %r8
14590b2cc:     	shlq	$0x7, %r8
14590b2d0:     	leaq	(%r8,%rax,8), %r8
14590b2d4:     	callq	0x145bc978d <.text+0x5bc878d>
14590b2d9:     	decq	%rdi
14590b2dc:     	movq	%rdi, 0x5b0(%rbx)
14590b2e3:     	testq	%rsi, %rsi
14590b2e6:     	je	0x145911383 <.text+0x5910383>
14590b2ec:     	movl	0xa8(%rbp), %eax
14590b2f2:     	movl	%eax, 0x238(%rbp)
14590b2f8:     	movq	0xa0(%rbp), %rax
14590b2ff:     	movq	%rax, 0x230(%rbp)
14590b306:     	movq	%rbx, %rcx
14590b309:     	movq	%r14, %rdx
14590b30c:     	movq	%r13, %r8
14590b30f:     	callq	0x145949470 <.text+0x5948470>
14590b314:     	testq	%r14, %r14
14590b317:     	je	0x14590b26c <.text+0x590a26c>
14590b31d:     	callq	0x140002200 <.text+0x1200>
14590b322:     	movl	$0x20, %ecx
14590b327:     	movl	$0x1, %edx
14590b32c:     	callq	0x1400021c0 <.text+0x11c0>
14590b331:     	testq	%rax, %rax
14590b334:     	je	0x145911341 <.text+0x5910341>
14590b33a:     	movq	%rax, 0x370(%rbp)
14590b341:     	movq	%r14, (%rax)
14590b344:     	movq	0x5e0(%rbx), %rsi
14590b34b:     	cmpq	0x5d0(%rbx), %rsi
14590b352:     	jne	0x14590b230 <.text+0x590a230>
14590b358:     	movq	0x350(%rbp), %rcx
14590b35f:     	callq	0x145bcb530 <.text+0x5bca530>
14590b364:     	nop
14590b365:     	jmp	0x14590b230 <.text+0x590a230>

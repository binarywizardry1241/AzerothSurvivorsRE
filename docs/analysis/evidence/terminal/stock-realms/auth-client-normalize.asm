
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140f5c210:     	pushq	%rbp
140f5c211:     	pushq	%r15
140f5c213:     	pushq	%r14
140f5c215:     	pushq	%r12
140f5c217:     	pushq	%rsi
140f5c218:     	pushq	%rdi
140f5c219:     	pushq	%rbx
140f5c21a:     	subq	$0x50, %rsp
140f5c21e:     	leaq	0x50(%rsp), %rbp
140f5c223:     	movq	$-0x2, -0x8(%rbp)
140f5c22b:     	movq	%rcx, %rsi
140f5c22e:     	leaq	-0x11(%r8), %rax
140f5c232:     	cmpq	$-0x11, %rax
140f5c236:     	ja	0x140f5c24b <.text+0xf5b24b>
140f5c238:     	movl	$0xffffffff, 0x8(%rsi)  # imm = 0xFFFFFFFF
140f5c23f:     	movq	$-0x1, (%rsi)
140f5c246:     	jmp	0x140f5c3d3 <.text+0xf5b3d3>
140f5c24b:     	movq	%r8, %rdi
140f5c24e:     	movq	%rdx, %rbx
140f5c251:     	callq	0x140002200 <.text+0x1200>
140f5c256:     	movl	$0x1, %edx
140f5c25b:     	movq	%rdi, %rcx
140f5c25e:     	callq	0x1400021c0 <.text+0x11c0>
140f5c263:     	testq	%rax, %rax
140f5c266:     	je	0x140f5c3e5 <.text+0xf5b3e5>
140f5c26c:     	movq	%rdi, -0x20(%rbp)
140f5c270:     	movq	%rax, -0x18(%rbp)
140f5c274:     	movq	$0x0, -0x10(%rbp)
140f5c27c:     	addq	%rbx, %rdi
140f5c27f:     	xorl	%r14d, %r14d
140f5c282:     	leaq	-0x20(%rbp), %r15
140f5c286:     	nopw	%cs:(%rax,%rax)
140f5c290:     	movzbl	(%rbx), %edx
140f5c293:     	movzbl	%dl, %ecx
140f5c296:     	testb	%cl, %cl
140f5c298:     	js	0x140f5c2b0 <.text+0xf5b2b0>
140f5c29a:     	incq	%rbx
140f5c29d:     	movq	-0x20(%rbp), %rdx
140f5c2a1:     	movl	%ecx, %r12d
140f5c2a4:     	jmp	0x140f5c340 <.text+0xf5b340>
140f5c2a9:     	nopl	(%rax)
140f5c2b0:     	movl	%ecx, %r12d
140f5c2b3:     	andl	$0x1f, %r12d
140f5c2b7:     	movzbl	0x1(%rbx), %r8d
140f5c2bc:     	andl	$0x3f, %r8d
140f5c2c0:     	cmpb	$-0x21, %cl
140f5c2c3:     	jbe	0x140f5c308 <.text+0xf5b308>
140f5c2c5:     	movzbl	0x2(%rbx), %ecx
140f5c2c9:     	shll	$0x6, %r8d
140f5c2cd:     	andl	$0x3f, %ecx
140f5c2d0:     	orl	%r8d, %ecx
140f5c2d3:     	cmpb	$-0x10, %dl
140f5c2d6:     	jb	0x140f5c325 <.text+0xf5b325>
140f5c2d8:     	movzbl	0x3(%rbx), %edx
140f5c2dc:     	addq	$0x4, %rbx
140f5c2e0:     	andl	$0x7, %r12d
140f5c2e4:     	shll	$0x12, %r12d
140f5c2e8:     	shll	$0x6, %ecx
140f5c2eb:     	andl	$0x3f, %edx
140f5c2ee:     	orl	%ecx, %edx
140f5c2f0:     	orl	%r12d, %edx
140f5c2f3:     	movl	%edx, %r12d
140f5c2f6:     	movq	-0x20(%rbp), %rdx
140f5c2fa:     	cmpl	$0x80, %r12d
140f5c301:     	jb	0x140f5c340 <.text+0xf5b340>
140f5c303:     	jmp	0x140f5c3a3 <.text+0xf5b3a3>
140f5c308:     	addq	$0x2, %rbx
140f5c30c:     	shll	$0x6, %r12d
140f5c310:     	orl	%r8d, %r12d
140f5c313:     	movq	-0x20(%rbp), %rdx
140f5c317:     	cmpl	$0x80, %r12d
140f5c31e:     	jb	0x140f5c340 <.text+0xf5b340>
140f5c320:     	jmp	0x140f5c3a3 <.text+0xf5b3a3>
140f5c325:     	addq	$0x3, %rbx
140f5c329:     	shll	$0xc, %r12d
140f5c32d:     	orl	%r12d, %ecx
140f5c330:     	movl	%ecx, %r12d
140f5c333:     	movq	-0x20(%rbp), %rdx
140f5c337:     	cmpl	$0x80, %r12d
140f5c33e:     	jae	0x140f5c3a3 <.text+0xf5b3a3>
140f5c340:     	cmpl	$0x20, %r12d
140f5c344:     	jb	0x140f5c3a3 <.text+0xf5b3a3>
140f5c346:     	cmpl	$0x7f, %r12d
140f5c34a:     	je	0x140f5c3a3 <.text+0xf5b3a3>
140f5c34c:     	cmpq	%rdx, %r14
140f5c34f:     	je	0x140f5c37c <.text+0xf5b37c>
140f5c351:     	leal	-0x61(%r12), %ecx
140f5c356:     	movl	%r12d, %edx
140f5c359:     	andb	$0x5f, %dl
140f5c35c:     	cmpl	$0x1a, %ecx
140f5c35f:     	movzbl	%dl, %ecx
140f5c362:     	cmovael	%r12d, %ecx
140f5c366:     	movb	%cl, (%rax,%r14)
140f5c36a:     	incq	%r14
140f5c36d:     	movq	%r14, -0x10(%rbp)
140f5c371:     	cmpq	%rdi, %rbx
140f5c374:     	jne	0x140f5c290 <.text+0xf5b290>
140f5c37a:     	jmp	0x140f5c3c4 <.text+0xf5b3c4>
140f5c37c:     	movq	$0x1, 0x20(%rsp)
140f5c385:     	movl	$0x1, %r8d
140f5c38b:     	movl	$0x1, %r9d
140f5c391:     	movq	%r15, %rcx
140f5c394:     	movq	%r14, %rdx
140f5c397:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
140f5c39c:     	nop
140f5c39d:     	movq	-0x18(%rbp), %rax
140f5c3a1:     	jmp	0x140f5c351 <.text+0xf5b351>
140f5c3a3:     	movl	%r12d, 0x8(%rsi)
140f5c3a7:     	movq	$-0x1, (%rsi)
140f5c3ae:     	testq	%rdx, %rdx
140f5c3b1:     	je	0x140f5c3d3 <.text+0xf5b3d3>
140f5c3b3:     	movq	-0x18(%rbp), %rcx
140f5c3b7:     	movl	$0x1, %r8d
140f5c3bd:     	callq	0x1400021d0 <.text+0x11d0>
140f5c3c2:     	jmp	0x140f5c3d3 <.text+0xf5b3d3>
140f5c3c4:     	movq	-0x10(%rbp), %rax
140f5c3c8:     	movq	%rax, 0x10(%rsi)
140f5c3cc:     	movups	-0x20(%rbp), %xmm0
140f5c3d0:     	movups	%xmm0, (%rsi)
140f5c3d3:     	movq	%rsi, %rax
140f5c3d6:     	addq	$0x50, %rsp
140f5c3da:     	popq	%rbx
140f5c3db:     	popq	%rdi
140f5c3dc:     	popq	%rsi
140f5c3dd:     	popq	%r12
140f5c3df:     	popq	%r14
140f5c3e1:     	popq	%r15
140f5c3e3:     	popq	%rbp
140f5c3e4:     	retq
140f5c3e5:     	movl	$0x1, %ecx
140f5c3ea:     	movq	%rdi, %rdx
140f5c3ed:     	callq	0x145d6944b <.text+0x5d6844b>
140f5c3f2:     	ud2

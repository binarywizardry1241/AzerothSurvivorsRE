
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14544d300:     	pushq	%rbp
14544d301:     	pushq	%rsi
14544d302:     	pushq	%rdi
14544d303:     	subq	$0x70, %rsp
14544d307:     	leaq	0x70(%rsp), %rbp
14544d30c:     	movq	$-0x2, -0x8(%rbp)
14544d314:     	movq	%rdx, %rsi
14544d317:     	cmpb	$0x0, 0x1041(%rdx)
14544d31e:     	je	0x14544d3e2 <.text+0x544c3e2>
14544d324:     	movq	%rcx, %rdi
14544d327:     	callq	0x140002200 <.text+0x1200>
14544d32c:     	movl	$0x38, %ecx
14544d331:     	movl	$0x8, %edx
14544d336:     	callq	0x1400021c0 <.text+0x11c0>
14544d33b:     	testq	%rax, %rax
14544d33e:     	je	0x14544d42f <.text+0x544c42f>
14544d344:     	movq	%rax, -0x10(%rbp)
14544d348:     	leaq	0xbe8(%rsi), %rdx
14544d34f:     	leaq	-0x48(%rbp), %rcx
14544d353:     	callq	0x145728850 <.text+0x5727850>
14544d358:     	nop
14544d359:     	movzbl	0xc20(%rsi), %eax
14544d360:     	movzbl	0xc21(%rsi), %ecx
14544d367:     	movzbl	0xc22(%rsi), %edx
14544d36e:     	movzbl	0xc27(%rsi), %r8d
14544d376:     	movb	%r8b, -0x11(%rbp)
14544d37a:     	movl	0xc23(%rsi), %r8d
14544d381:     	movl	%r8d, -0x15(%rbp)
14544d385:     	movq	$0xfffffe, -0x30(%rbp)  # imm = 0xFFFFFE
14544d38d:     	movb	%cl, -0x18(%rbp)
14544d390:     	movb	%al, -0x17(%rbp)
14544d393:     	movb	%dl, -0x16(%rbp)
14544d396:     	movss	0x4f2a62(%rip), %xmm0   # 0x14593fe00
14544d39e:     	movups	%xmm0, -0x28(%rbp)
14544d3a2:     	movups	-0x48(%rbp), %xmm0
14544d3a6:     	movq	-0x10(%rbp), %rcx
14544d3aa:     	movups	%xmm0, (%rcx)
14544d3ad:     	movq	-0x38(%rbp), %rax
14544d3b1:     	movq	%rax, 0x10(%rcx)
14544d3b5:     	movq	-0x30(%rbp), %rax
14544d3b9:     	movq	%rax, 0x18(%rcx)
14544d3bd:     	movups	-0x28(%rbp), %xmm0
14544d3c1:     	movups	%xmm0, 0x20(%rcx)
14544d3c5:     	movq	-0x18(%rbp), %rax
14544d3c9:     	movq	%rax, 0x30(%rcx)
14544d3cd:     	movq	$0x1, (%rdi)
14544d3d4:     	movq	%rcx, 0x8(%rdi)
14544d3d8:     	movq	$0x1, 0x10(%rdi)
14544d3e0:     	jmp	0x14544d427 <.text+0x544c427>
14544d3e2:     	leaq	0xdc0(%rsi), %rax
14544d3e9:     	xorl	%edx, %edx
14544d3eb:     	cmpq	$-0x1, 0xdc0(%rsi)
14544d3f3:     	cmovneq	%rax, %rdx
14544d3f7:     	movq	0xa20(%rsi), %rax
14544d3fe:     	imulq	$0x38, 0xa28(%rsi), %r8
14544d406:     	addq	%rax, %r8
14544d409:     	movq	$0x1, -0x48(%rbp)
14544d411:     	movq	%rdx, -0x40(%rbp)
14544d415:     	movq	%rax, -0x38(%rbp)
14544d419:     	movq	%r8, -0x30(%rbp)
14544d41d:     	leaq	-0x48(%rbp), %rdx
14544d421:     	callq	0x145544990 <.text+0x5543990>
14544d426:     	nop
14544d427:     	addq	$0x70, %rsp
14544d42b:     	popq	%rdi
14544d42c:     	popq	%rsi
14544d42d:     	popq	%rbp
14544d42e:     	retq
14544d42f:     	movl	$0x8, %ecx
14544d434:     	movl	$0x38, %edx
14544d439:     	callq	0x145903781 <.text+0x5902781>
14544d43e:     	ud2

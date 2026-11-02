Disassembly of section .text:

0000000140001000 <.text>:
14063a3d0:     	pushq	%rsi
14063a3d1:     	pushq	%rdi
14063a3d2:     	pushq	%rbp
14063a3d3:     	pushq	%rbx
14063a3d4:     	cmpq	$0x0, 0x90(%rcx)
14063a3dc:     	je	0x14063a4cd <.text+0x6394cd>
14063a3e2:     	movq	0x78(%rcx), %rax
14063a3e6:     	movq	0x80(%rcx), %r10
14063a3ed:     	movabsq	$-0x15a5c2f0575a2ed3, %r11 # imm = 0xEA5A3D0FA8A5D12D
14063a3f7:     	xorl	%esi, %esi
14063a3f9:     	movdqa	0x57399cf(%rip), %xmm0  # 0x145d73dd0
14063a401:     	pcmpeqd	%xmm1, %xmm1
14063a405:     	movdqa	0x5821453(%rip), %xmm2  # 0x145e5b860
14063a40d:     	andq	%r10, %r11
14063a410:     	movdqu	(%rax,%r11), %xmm3
14063a416:     	movdqa	%xmm3, %xmm4
14063a41a:     	pcmpeqb	%xmm0, %xmm4
14063a41e:     	pmovmskb	%xmm4, %edi
14063a422:     	testl	%edi, %edi
14063a424:     	je	0x14063a460 <.text+0x639460>
14063a426:     	tzcntl	%edi, %ebx
14063a42a:     	addq	%r11, %rbx
14063a42d:     	andq	%r10, %rbx
14063a430:     	negq	%rbx
14063a433:     	leaq	(%rbx,%rbx,2), %rbx
14063a437:     	movdqu	-0x18(%rax,%rbx,8), %xmm4
14063a43d:     	pcmpeqb	%xmm2, %xmm4
14063a441:     	pmovmskb	%xmm4, %ebp
14063a445:     	cmpl	$0xffff, %ebp           # imm = 0xFFFF
14063a44b:     	je	0x14063a479 <.text+0x639479>
14063a44d:     	leal	-0x1(%rdi), %ebx
14063a450:     	andw	%di, %bx
14063a453:     	movl	%ebx, %edi
14063a455:     	jne	0x14063a426 <.text+0x639426>
14063a457:     	nopw	(%rax,%rax)
14063a460:     	pcmpeqb	%xmm1, %xmm3
14063a464:     	pmovmskb	%xmm3, %edi
14063a468:     	testl	%edi, %edi
14063a46a:     	jne	0x14063a4cd <.text+0x6394cd>
14063a46c:     	addq	%rsi, %r11
14063a46f:     	addq	$0x10, %r11
14063a473:     	addq	$0x10, %rsi
14063a477:     	jmp	0x14063a40d <.text+0x63940d>
14063a479:     	leaq	(%rax,%rbx,8), %rax
14063a47d:     	movq	-0x8(%rax), %rax
14063a481:     	cmpq	0x218(%rcx), %rax
14063a488:     	jae	0x14063a4cd <.text+0x6394cd>
14063a48a:     	movq	0x210(%rcx), %r10
14063a491:     	movq	(%r10,%rax,8), %rax
14063a495:     	testq	%rax, %rax
14063a498:     	je	0x14063a4cd <.text+0x6394cd>
14063a49a:     	movq	0x1e0(%rcx), %r10
14063a4a1:     	notq	%rax
14063a4a4:     	imulq	$0x38, %rax, %rax
14063a4a8:     	cmpb	$0x1, 0x30(%r10,%rax)
14063a4ae:     	jne	0x14063a4cd <.text+0x6394cd>
14063a4b0:     	addq	%rax, %r10
14063a4b3:     	movq	0x10(%r10), %rax
14063a4b7:     	movl	0x5b0(%rcx), %ecx
14063a4bd:     	movl	%ecx, 0x2c(%r10)
14063a4c1:     	movq	%rax, %rcx
14063a4c4:     	popq	%rbx
14063a4c5:     	popq	%rbp
14063a4c6:     	popq	%rdi
14063a4c7:     	popq	%rsi
14063a4c8:     	jmp	0x140d93c70 <.text+0xd92c70>
14063a4cd:     	popq	%rbx
14063a4ce:     	popq	%rbp
14063a4cf:     	popq	%rdi
14063a4d0:     	popq	%rsi
14063a4d1:     	retq


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14546a1f0:     	pushq	%rbp
14546a1f1:     	pushq	%r14
14546a1f3:     	pushq	%rsi
14546a1f4:     	pushq	%rdi
14546a1f5:     	pushq	%rbx
14546a1f6:     	subq	$0x510, %rsp            # imm = 0x510
14546a1fd:     	leaq	0x80(%rsp), %rbp
14546a205:     	movq	$-0x2, 0x488(%rbp)
14546a210:     	movq	%rcx, %rsi
14546a213:     	movq	(%r8), %r14
14546a216:     	movq	0x8(%r8), %rbx
14546a21a:     	testq	%r14, %r14
14546a21d:     	je	0x14546a361 <.text+0x5469361>
14546a223:     	movq	%r8, %rdi
14546a226:     	addq	$0x10, %rdi
14546a22a:     	movq	%rbx, -0x50(%rbp)
14546a22e:     	leaq	-0x48(%rbp), %rcx
14546a232:     	movl	$0x248, %r8d            # imm = 0x248
14546a238:     	movq	%rdi, %rdx
14546a23b:     	callq	0x1457731ed <.text+0x57721ed>
14546a240:     	movq	$0x0, -0x58(%rbp)
14546a248:     	movq	%rbx, 0x208(%rbp)
14546a24f:     	leaq	0x210(%rbp), %rcx
14546a256:     	movl	$0x248, %r8d            # imm = 0x248
14546a25c:     	movq	%rdi, %rdx
14546a25f:     	callq	0x1457731ed <.text+0x57721ed>
14546a264:     	movq	%r14, 0x480(%rbp)
14546a26b:     	movq	%r14, 0x200(%rbp)
14546a272:     	leaq	0x458(%rbp), %rcx
14546a279:     	leaq	0x200(%rbp), %rdx
14546a280:     	callq	0x145709e80 <.text+0x5708e80>
14546a285:     	nop
14546a286:     	movq	0x480(%rbp), %rax
14546a28d:     	lock
14546a28e:     	decq	(%rax)
14546a291:     	jne	0x14546a2a0 <.text+0x54692a0>
14546a293:     	leaq	0x200(%rbp), %rcx
14546a29a:     	callq	0x144af4d00 <.text+0x4af3d00>
14546a29f:     	nop
14546a2a0:     	movq	0x458(%rbp), %rax
14546a2a7:     	movq	%rax, 0x480(%rbp)
14546a2ae:     	movq	0x460(%rbp), %rcx
14546a2b5:     	movq	0x468(%rbp), %rdx
14546a2bc:     	movq	%rcx, 0x478(%rbp)
14546a2c3:     	callq	0x145702fd0 <.text+0x5701fd0>
14546a2c8:     	nop
14546a2c9:     	testq	%rax, %rax
14546a2cc:     	je	0x14546a322 <.text+0x5469322>
14546a2ce:     	movq	%rdx, %r8
14546a2d1:     	leaq	0x200(%rbp), %rcx
14546a2d8:     	movq	%rax, %rdx
14546a2db:     	callq	0x145730fb0 <.text+0x572ffb0>
14546a2e0:     	nop
14546a2e1:     	cmpl	$0x1, 0x200(%rbp)
14546a2e8:     	je	0x14546a322 <.text+0x5469322>
14546a2ea:     	movq	0x210(%rbp), %rax
14546a2f1:     	cmpq	$0x7, %rax
14546a2f5:     	jb	0x14546a322 <.text+0x5469322>
14546a2f7:     	movq	0x208(%rbp), %rcx
14546a2fe:     	movl	$0x6b636142, %edx       # imm = 0x6B636142
14546a303:     	xorl	(%rcx), %edx
14546a305:     	movl	$0x2070756b, %r8d       # imm = 0x2070756B
14546a30b:     	xorl	0x3(%rcx), %r8d
14546a30f:     	orl	%edx, %r8d
14546a312:     	jne	0x14546a322 <.text+0x5469322>
14546a314:     	cmpl	$0x7661732e, -0x4(%rcx,%rax) # imm = 0x7661732E
14546a31c:     	je	0x14546a3a8 <.text+0x54693a8>
14546a322:     	movq	$-0x1, (%rsi)
14546a329:     	movq	0x480(%rbp), %rdx
14546a330:     	testq	%rdx, %rdx
14546a333:     	je	0x14546a347 <.text+0x5469347>
14546a335:     	movl	$0x1, %r8d
14546a33b:     	movq	0x478(%rbp), %rcx
14546a342:     	callq	0x1400021d0 <.text+0x11d0>
14546a347:     	movq	-0x58(%rbp), %rax
14546a34b:     	testq	%rax, %rax
14546a34e:     	je	0x14546a397 <.text+0x5469397>
14546a350:     	lock
14546a351:     	decq	(%rax)
14546a354:     	jne	0x14546a397 <.text+0x5469397>
14546a356:     	leaq	-0x58(%rbp), %rcx
14546a35a:     	callq	0x144af4d00 <.text+0x4af3d00>
14546a35f:     	jmp	0x14546a397 <.text+0x5469397>
14546a361:     	movl	%ebx, %eax
14546a363:     	andl	$0x3, %eax
14546a366:     	leal	-0x2(%rax), %ecx
14546a369:     	cmpl	$0x2, %ecx
14546a36c:     	jb	0x14546a390 <.text+0x5469390>
14546a36e:     	testq	%rax, %rax
14546a371:     	je	0x14546a390 <.text+0x5469390>
14546a373:     	decq	%rbx
14546a376:     	leaq	0x208(%rbp), %rcx
14546a37d:     	movq	%rbx, 0x208(%rbp)
14546a384:     	movb	$0x3, 0x200(%rbp)
14546a38b:     	callq	0x14573b330 <.text+0x573a330>
14546a390:     	movq	$-0x1, (%rsi)
14546a397:     	movq	%rsi, %rax
14546a39a:     	addq	$0x510, %rsp            # imm = 0x510
14546a3a1:     	popq	%rbx
14546a3a2:     	popq	%rdi
14546a3a3:     	popq	%rsi
14546a3a4:     	popq	%r14
14546a3a6:     	popq	%rbp
14546a3a7:     	retq
14546a3a8:     	movups	0x458(%rbp), %xmm0
14546a3af:     	movups	0x468(%rbp), %xmm1
14546a3b6:     	movups	%xmm1, 0x10(%rsi)
14546a3ba:     	movups	%xmm0, (%rsi)
14546a3bd:     	movq	-0x58(%rbp), %rax
14546a3c1:     	testq	%rax, %rax
14546a3c4:     	jne	0x14546a350 <.text+0x5469350>
14546a3c6:     	jmp	0x14546a397 <.text+0x5469397>

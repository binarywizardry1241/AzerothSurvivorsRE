
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592a097:     	movq	%rbx, 0x1e0(%rbp)
14592a09e:     	movq	%rdi, 0xf0(%rbp)
14592a0a5:     	movq	0x1f8(%rbp), %rcx
14592a0ac:     	cmpb	$0x3, 0x1ef(%rbp)
14592a0b3:     	jne	0x145929e17 <.text+0x5928e17>
14592a0b9:     	movq	0x1f8(%rbp), %rcx
14592a0c0:     	cmpl	$0x0, 0x214(%rbp)
14592a0c7:     	je	0x145929e17 <.text+0x5928e17>
14592a0cd:     	movq	0x218(%rbp), %rax
14592a0d4:     	movzbl	0x304(%rax), %eax
14592a0db:     	addb	$-0x2, %al
14592a0dd:     	leaq	0x12816c4(%rip), %rcx   # 0x146bab7a8
14592a0e4:     	cmpb	$0x9, %al
14592a0e6:     	ja	0x14592a0f6 <.text+0x59290f6>
14592a0e8:     	movzbl	%al, %eax
14592a0eb:     	leaq	0x155109e(%rip), %rcx   # 0x146e7b190
14592a0f2:     	movq	(%rcx,%rax,8), %rcx
14592a0f6:     	movss	0x1f0(%rbp), %xmm8
14592a0ff:     	movss	0x208(%rbp), %xmm9
14592a108:     	movq	0x30(%rcx), %rax
14592a10c:     	movq	0x38(%rcx), %r15
14592a110:     	shlq	$0x4, %r15
14592a114:     	addq	%rax, %r15
14592a117:     	movq	0x218(%rbp), %rcx
14592a11e:     	movq	0xb8(%rcx), %r12
14592a125:     	movq	0xc0(%rcx), %rcx
14592a12c:     	movq	%rcx, 0x208(%rbp)
14592a133:     	movl	0x214(%rbp), %edx
14592a139:     	nopl	(%rax)
14592a140:     	cmpq	%r15, %rax
14592a143:     	je	0x14592a555 <.text+0x5929555>
14592a149:     	leaq	0x10(%rax), %rbx
14592a14d:     	movq	(%rax), %rsi
14592a150:     	movq	0x8(%rax), %rdi
14592a154:     	movq	%rsi, 0x128(%rbp)
14592a15b:     	movq	%rdi, 0x130(%rbp)
14592a162:     	xorl	%r14d, %r14d
14592a165:     	leaq	0x128296c(%rip), %rax   # 0x146bacad8
14592a16c:     	jmp	0x14592a181 <.text+0x5929181>
14592a16e:     	nop
14592a170:     	addq	$0x78, %r14
14592a174:     	cmpq	$0x34f8, %r14           # imm = 0x34F8
14592a17b:     	je	0x14592d746 <.text+0x592c746>
14592a181:     	cmpq	%rdi, 0x8(%r14,%rax)
14592a186:     	jne	0x14592a170 <.text+0x5929170>
14592a188:     	movq	(%r14,%rax), %rcx
14592a18c:     	movq	%rsi, %rdx
14592a18f:     	movq	%rdi, %r8
14592a192:     	callq	0x145bc9787 <.text+0x5bc8787>
14592a197:     	testl	%eax, %eax
14592a199:     	leaq	0x1282938(%rip), %rax   # 0x146bacad8
14592a1a0:     	jne	0x14592a170 <.text+0x5929170>
14592a1a2:     	movl	0x214(%rbp), %edx
14592a1a8:     	cmpl	%edx, 0x40(%r14,%rax)
14592a1ad:     	movq	%rax, %rcx
14592a1b0:     	je	0x14592a1bc <.text+0x59291bc>
14592a1b2:     	movq	%rbx, %rax
14592a1b5:     	cmpl	%edx, 0x64(%r14,%rcx)
14592a1ba:     	jne	0x14592a140 <.text+0x5929140>
14592a1bc:     	addq	%rcx, %r14
14592a1bf:     	movss	0x44(%r14), %xmm0
14592a1c5:     	ucomiss	%xmm7, %xmm0
14592a1c8:     	movq	0x1f8(%rbp), %rcx
14592a1cf:     	jbe	0x145929e17 <.text+0x5928e17>
14592a1d5:     	cmpb	$0xb, 0x75(%r14)
14592a1da:     	movq	0x1f8(%rbp), %rcx
14592a1e1:     	je	0x145929e17 <.text+0x5928e17>
14592a1e7:     	jmp	0x14592c741 <.text+0x592b741>
14592a1ec:     	movq	%r15, 0x120(%rbp)
14592a1f3:     	movq	%rbx, 0x1e0(%rbp)
14592a1fa:     	movq	0x1f8(%rbp), %rcx
14592a201:     	cmpb	$0x3, 0x1ef(%rbp)
14592a208:     	jne	0x145929e17 <.text+0x5928e17>
14592a20e:     	movq	0x1f8(%rbp), %rcx
14592a215:     	cmpl	$0x0, 0x214(%rbp)
14592a21c:     	je	0x145929e17 <.text+0x5928e17>
14592a222:     	movq	0x218(%rbp), %rax
14592a229:     	movzbl	0x304(%rax), %eax
14592a230:     	addb	$-0x2, %al
14592a232:     	leaq	0x128156f(%rip), %rcx   # 0x146bab7a8
14592a239:     	cmpb	$0x9, %al
14592a23b:     	ja	0x14592a24b <.text+0x592924b>
14592a23d:     	movzbl	%al, %eax
14592a240:     	leaq	0x1550f49(%rip), %rcx   # 0x146e7b190
14592a247:     	movq	(%rcx,%rax,8), %rcx
14592a24b:     	movss	0x1f0(%rbp), %xmm8
14592a254:     	movd	%r9d, %xmm9
14592a259:     	movq	0x30(%rcx), %rax
14592a25d:     	movq	0x38(%rcx), %r15
14592a261:     	shlq	$0x4, %r15
14592a265:     	addq	%rax, %r15
14592a268:     	movq	0x218(%rbp), %rcx
14592a26f:     	movq	0xb8(%rcx), %rbx
14592a276:     	movq	0xc0(%rcx), %r12
14592a27d:     	movl	0x214(%rbp), %edx
14592a283:     	nopw	%cs:(%rax,%rax)
14592a290:     	cmpq	%r15, %rax
14592a293:     	je	0x14592a586 <.text+0x5929586>
14592a299:     	leaq	0x10(%rax), %r13
14592a29d:     	movq	(%rax), %rsi
14592a2a0:     	movq	0x8(%rax), %rdi
14592a2a4:     	movq	%rsi, 0x128(%rbp)
14592a2ab:     	movq	%rdi, 0x130(%rbp)
14592a2b2:     	xorl	%r14d, %r14d
14592a2b5:     	leaq	0x128281c(%rip), %rax   # 0x146bacad8
14592a2bc:     	jmp	0x14592a2d1 <.text+0x59292d1>
14592a2be:     	nop
14592a2c0:     	addq	$0x78, %r14
14592a2c4:     	cmpq	$0x34f8, %r14           # imm = 0x34F8
14592a2cb:     	je	0x14592d70a <.text+0x592c70a>
14592a2d1:     	cmpq	%rdi, 0x8(%r14,%rax)
14592a2d6:     	jne	0x14592a2c0 <.text+0x59292c0>
14592a2d8:     	movq	(%r14,%rax), %rcx
14592a2dc:     	movq	%rsi, %rdx
14592a2df:     	movq	%rdi, %r8
14592a2e2:     	callq	0x145bc9787 <.text+0x5bc8787>
14592a2e7:     	testl	%eax, %eax
14592a2e9:     	leaq	0x12827e8(%rip), %rax   # 0x146bacad8
14592a2f0:     	jne	0x14592a2c0 <.text+0x59292c0>
14592a2f2:     	movl	0x214(%rbp), %edx
14592a2f8:     	cmpl	%edx, 0x40(%r14,%rax)
14592a2fd:     	movq	%rax, %rcx
14592a300:     	je	0x14592a30c <.text+0x592930c>
14592a302:     	movq	%r13, %rax
14592a305:     	cmpl	%edx, 0x64(%r14,%rcx)
14592a30a:     	jne	0x14592a290 <.text+0x5929290>
14592a30c:     	addq	%rcx, %r14
14592a30f:     	movss	0x44(%r14), %xmm0
14592a315:     	ucomiss	%xmm7, %xmm0
14592a318:     	movq	0x1f8(%rbp), %rcx
14592a31f:     	jbe	0x145929e17 <.text+0x5928e17>
14592a325:     	cmpb	$0xb, 0x75(%r14)
14592a32a:     	movq	0x1f8(%rbp), %rcx
14592a331:     	je	0x145929e17 <.text+0x5928e17>
14592a337:     	jmp	0x14592c78c <.text+0x592b78c>

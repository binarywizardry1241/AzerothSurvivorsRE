AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458bef90:     	pushq	%rbp
1458bef91:     	pushq	%r15
1458bef93:     	pushq	%r14
1458bef95:     	pushq	%r13
1458bef97:     	pushq	%r12
1458bef99:     	pushq	%rsi
1458bef9a:     	pushq	%rdi
1458bef9b:     	pushq	%rbx
1458bef9c:     	subq	$0x108, %rsp            # imm = 0x108
1458befa3:     	leaq	0x80(%rsp), %rbp
1458befab:     	movq	$-0x2, 0x80(%rbp)
1458befb6:     	movl	%ecx, %esi
1458befb8:     	movl	%ecx, 0x1c(%rbp)
1458befbb:     	movl	0x274563f(%rip), %eax   # 0x148004600
1458befc1:     	testl	%eax, %eax
1458befc3:     	je	0x1458bf33f <.text+0x58be33f>
1458befc9:     	leaq	0x30(%rbp), %rcx
1458befcd:     	callq	0x145a36150 <.text+0x5a35150>
1458befd2:     	movq	0x30(%rbp), %rax
1458befd6:     	xorl	%r8d, %r8d
1458befd9:     	cmpq	$-0x1, %rax
1458befdd:     	movl	$0x1, %edx
1458befe2:     	cmovneq	0x38(%rbp), %rdx
1458befe7:     	cmoveq	%r8, %rax
1458befeb:     	movq	%rax, 0x60(%rbp)
1458befef:     	cmovneq	0x40(%rbp), %r8
1458beff4:     	leaq	-0x20(%rbp), %rcx
1458beff8:     	movq	%rdx, 0x20(%rbp)
1458beffc:     	callq	0x145aa6bf0 <.text+0x5aa5bf0>
1458bf001:     	nop
1458bf002:     	movq	-0x20(%rbp), %rdi
1458bf006:     	leaq	-0x18(%rbp), %rcx
1458bf00a:     	cmpq	$-0x1, %rdi
1458bf00e:     	je	0x1458bf065 <.text+0x58be065>
1458bf010:     	movq	0x10(%rcx), %rax
1458bf014:     	movq	%rax, 0x48(%rbp)
1458bf018:     	movdqu	(%rcx), %xmm0
1458bf01c:     	movdqu	%xmm0, 0x38(%rbp)
1458bf021:     	movq	%rdi, 0x30(%rbp)
1458bf025:     	leaq	0x12fae04(%rip), %r8    # 0x146bb9e30
1458bf02c:     	leaq	-0x20(%rbp), %rcx
1458bf030:     	leaq	0x30(%rbp), %rdx
1458bf034:     	movl	$0x21, %r9d
1458bf03a:     	callq	0x145aa7f80 <.text+0x5aa6f80>
1458bf03f:     	nop
1458bf040:     	movq	-0x20(%rbp), %r15
1458bf044:     	cmpq	$-0x1, %r15
1458bf048:     	movq	%rdi, 0x28(%rbp)
1458bf04c:     	je	0x1458bf070 <.text+0x58be070>
1458bf04e:     	movq	-0x18(%rbp), %r12
1458bf052:     	movq	-0x10(%rbp), %rbx
1458bf056:     	movq	0x40(%rbp), %rax
1458bf05a:     	movq	%rax, -0x28(%rbp)
1458bf05e:     	testq	%rax, %rax
1458bf061:     	jne	0x1458bf087 <.text+0x58be087>
1458bf063:     	jmp	0x1458bf0d0 <.text+0x58be0d0>
1458bf065:     	callq	0x145b6c710 <.text+0x5b6b710>
1458bf06a:     	nop
1458bf06b:     	jmp	0x1458bf465 <.text+0x58be465>
1458bf070:     	leaq	-0x18(%rbp), %rcx
1458bf074:     	callq	0x145b6c710 <.text+0x5b6b710>
1458bf079:     	nop
1458bf07a:     	movq	0x40(%rbp), %rax
1458bf07e:     	movq	%rax, -0x28(%rbp)
1458bf082:     	testq	%rax, %rax
1458bf085:     	je	0x1458bf0d0 <.text+0x58be0d0>
1458bf087:     	movq	0x38(%rbp), %rdi
1458bf08b:     	movq	-0x28(%rbp), %r14
1458bf08f:     	negq	%r14
1458bf092:     	movl	$0x1, %ecx
1458bf097:     	movq	%rdi, -0x30(%rbp)
1458bf09b:     	jmp	0x1458bf0b8 <.text+0x58be0b8>
1458bf09d:     	nopl	(%rax)
1458bf0a0:     	movq	0x70(%rbp), %rcx
1458bf0a4:     	leaq	(%r14,%rcx), %rax
1458bf0a8:     	incq	%rax
1458bf0ab:     	incq	%rcx
1458bf0ae:     	addq	$0x8, %rdi
1458bf0b2:     	cmpq	$0x1, %rax
1458bf0b6:     	je	0x1458bf0d0 <.text+0x58be0d0>
1458bf0b8:     	movq	%rcx, 0x70(%rbp)
1458bf0bc:     	movq	(%rdi), %rax
1458bf0bf:     	lock
1458bf0c0:     	decq	(%rax)
1458bf0c3:     	jne	0x1458bf0a0 <.text+0x58be0a0>
1458bf0c5:     	movq	%rdi, %rcx
1458bf0c8:     	callq	0x145a41300 <.text+0x5a40300>
1458bf0cd:     	nop
1458bf0ce:     	jmp	0x1458bf0a0 <.text+0x58be0a0>
1458bf0d0:     	movq	0x28(%rbp), %rdx
1458bf0d4:     	testq	%rdx, %rdx
1458bf0d7:     	je	0x1458bf0ec <.text+0x58be0ec>
1458bf0d9:     	movq	0x38(%rbp), %rcx
1458bf0dd:     	shlq	$0x3, %rdx
1458bf0e1:     	movl	$0x8, %r8d
1458bf0e7:     	callq	0x1400021d0 <.text+0x11d0>
1458bf0ec:     	cmpq	$-0x1, %r15
1458bf0f0:     	je	0x1458bf465 <.text+0x58be465>
1458bf0f6:     	cmpq	$0x14, %rbx
1458bf0fa:     	movq	%r15, 0x68(%rbp)
1458bf0fe:     	jb	0x1458bf409 <.text+0x58be409>
1458bf104:     	cmpl	$0x43424457, (%r12)     # imm = 0x43424457
1458bf10c:     	jne	0x1458bf409 <.text+0x58be409>
1458bf112:     	movl	0x4(%r12), %ecx
1458bf117:     	movl	0xc(%r12), %eax
1458bf11c:     	movl	0x10(%r12), %r8d
1458bf121:     	movl	%eax, %edx
1458bf123:     	imull	%ecx, %edx
1458bf126:     	addq	%rdx, %r8
1458bf129:     	addq	$0x14, %r8
1458bf12d:     	cmpq	%r8, %rbx
1458bf130:     	jb	0x1458bf421 <.text+0x58be421>
1458bf136:     	addq	$0x14, %rdx
1458bf13a:     	movl	0x8(%r12), %r8d
1458bf13f:     	movq	%r12, 0x38(%rbp)
1458bf143:     	movq	%rbx, 0x40(%rbp)
1458bf147:     	movq	%rdx, 0x48(%rbp)
1458bf14b:     	movl	%ecx, 0x50(%rbp)
1458bf14e:     	movl	%r8d, 0x54(%rbp)
1458bf152:     	movl	%eax, 0x58(%rbp)
1458bf155:     	movq	0x38(%rbp), %rax
1458bf159:     	movq	%rax, -0x58(%rbp)
1458bf15d:     	movq	0x40(%rbp), %rax
1458bf161:     	movq	%rax, -0x50(%rbp)
1458bf165:     	movq	0x48(%rbp), %rax
1458bf169:     	movq	%rax, -0x48(%rbp)
1458bf16d:     	movl	0x50(%rbp), %eax
1458bf170:     	movl	%eax, -0x40(%rbp)
1458bf173:     	movl	0x54(%rbp), %eax
1458bf176:     	movl	%eax, -0x3c(%rbp)
1458bf179:     	movq	0x58(%rbp), %rax
1458bf17d:     	movq	%rax, -0x38(%rbp)
1458bf181:     	movq	%r15, -0x60(%rbp)
1458bf185:     	movq	0x60(%rbp), %rdx
1458bf189:     	testq	%rdx, %rdx
1458bf18c:     	je	0x1458bf19e <.text+0x58be19e>
1458bf18e:     	movl	$0x1, %r8d
1458bf194:     	movq	0x20(%rbp), %rcx
1458bf198:     	callq	0x1400021d0 <.text+0x11d0>
1458bf19d:     	nop
1458bf19e:     	leaq	0x30(%rbp), %rcx
1458bf1a2:     	callq	0x1458bc2e0 <.text+0x58bb2e0>
1458bf1a7:     	nop
1458bf1a8:     	movq	0x30(%rbp), %rax
1458bf1ac:     	movq	%rax, 0x70(%rbp)
1458bf1b0:     	movq	0x38(%rbp), %rax
1458bf1b4:     	movq	%rax, 0x60(%rbp)
1458bf1b8:     	movq	0x40(%rbp), %rdi
1458bf1bc:     	movb	$0x0, 0x7f(%rbp)
1458bf1c0:     	xorl	%ecx, %ecx
1458bf1c2:     	callq	0x143d98020 <.text+0x3d97020>
1458bf1c7:     	nop
1458bf1c8:     	movq	0x60(%rbp), %rdx
1458bf1cc:     	leaq	(%rdx,%rdi,4), %rcx
1458bf1d0:     	movdqu	(%rax), %xmm0
1458bf1d4:     	incq	(%rax)
1458bf1d7:     	movups	0x12f41a2(%rip), %xmm1  # 0x146bb3380
1458bf1de:     	movaps	%xmm1, 0x40(%rbp)
1458bf1e2:     	movdqu	0x12f4186(%rip), %xmm1  # 0x146bb3370
1458bf1ea:     	movdqa	%xmm1, 0x30(%rbp)
1458bf1ef:     	movdqa	%xmm0, 0x50(%rbp)
1458bf1f4:     	movq	%rdx, -0x20(%rbp)
1458bf1f8:     	movq	%rdx, -0x18(%rbp)
1458bf1fc:     	movq	0x70(%rbp), %rax
1458bf200:     	movq	%rax, -0x10(%rbp)
1458bf204:     	movq	%rcx, -0x8(%rbp)
1458bf208:     	leaq	-0x20(%rbp), %rcx
1458bf20c:     	leaq	-0x60(%rbp), %rdx
1458bf210:     	leaq	0x30(%rbp), %r8
1458bf214:     	callq	0x1459ad750 <.text+0x59ac750>
1458bf219:     	nop
1458bf21a:     	movdqa	0x30(%rbp), %xmm0
1458bf21f:     	movdqa	0x40(%rbp), %xmm1
1458bf224:     	movdqa	0x50(%rbp), %xmm2
1458bf229:     	movdqa	%xmm2, (%rbp)
1458bf22e:     	movdqa	%xmm1, -0x10(%rbp)
1458bf233:     	movdqa	%xmm0, -0x20(%rbp)
1458bf238:     	movl	0x27453c2(%rip), %eax   # 0x148004600
1458bf23e:     	testl	%eax, %eax
1458bf240:     	jne	0x1458bf493 <.text+0x58be493>
1458bf246:     	movq	-0x20(%rbp), %rdi
1458bf24a:     	testq	%rdi, %rdi
1458bf24d:     	je	0x1458bf324 <.text+0x58be324>
1458bf253:     	movq	-0x18(%rbp), %rbx
1458bf257:     	testq	%rbx, %rbx
1458bf25a:     	movq	0x68(%rbp), %r14
1458bf25e:     	je	0x1458bf328 <.text+0x58be328>
1458bf264:     	movq	-0x8(%rbp), %r14
1458bf268:     	testq	%r14, %r14
1458bf26b:     	je	0x1458bf2f6 <.text+0x58be2f6>
1458bf271:     	movdqa	(%rdi), %xmm0
1458bf275:     	leaq	0x10(%rdi), %r15
1458bf279:     	pmovmskb	%xmm0, %r13d
1458bf27e:     	notl	%r13d
1458bf281:     	movq	%rdi, %r12
1458bf284:     	jmp	0x1458bf2a2 <.text+0x58be2a2>
1458bf286:     	nopw	%cs:(%rax,%rax)
1458bf290:     	decq	%r14
1458bf293:     	leal	-0x1(%r13), %eax
1458bf297:     	andl	%r13d, %eax
1458bf29a:     	movl	%eax, %r13d
1458bf29d:     	testq	%r14, %r14
1458bf2a0:     	je	0x1458bf2f6 <.text+0x58be2f6>
1458bf2a2:     	testw	%r13w, %r13w
1458bf2a6:     	jne	0x1458bf2ce <.text+0x58be2ce>
1458bf2a8:     	nopl	(%rax,%rax)
1458bf2b0:     	movdqa	(%r15), %xmm0
1458bf2b5:     	addq	$-0x200, %r12           # imm = 0xFE00
1458bf2bc:     	addq	$0x10, %r15
1458bf2c0:     	pmovmskb	%xmm0, %r13d
1458bf2c5:     	xorl	$0xffff, %r13d          # imm = 0xFFFF
1458bf2cc:     	je	0x1458bf2b0 <.text+0x58be2b0>
1458bf2ce:     	tzcntl	%r13d, %ecx
1458bf2d3:     	shll	$0x5, %ecx
1458bf2d6:     	movq	%r12, %rax
1458bf2d9:     	subq	%rcx, %rax
1458bf2dc:     	movq	-0x18(%rax), %rdx
1458bf2e0:     	testq	%rdx, %rdx
1458bf2e3:     	je	0x1458bf290 <.text+0x58be290>
1458bf2e5:     	movq	-0x10(%rax), %rcx
1458bf2e9:     	movl	$0x1, %r8d
1458bf2ef:     	callq	0x1400021d0 <.text+0x11d0>
1458bf2f4:     	jmp	0x1458bf290 <.text+0x58be290>
1458bf2f6:     	movq	%rbx, %rax
1458bf2f9:     	shlq	$0x5, %rax
1458bf2fd:     	addq	%rax, %rbx
1458bf300:     	addq	$0x31, %rbx
1458bf304:     	movq	0x68(%rbp), %r14
1458bf308:     	je	0x1458bf328 <.text+0x58be328>
1458bf30a:     	subq	%rax, %rdi
1458bf30d:     	addq	$-0x20, %rdi
1458bf311:     	movl	$0x10, %r8d
1458bf317:     	movq	%rdi, %rcx
1458bf31a:     	movq	%rbx, %rdx
1458bf31d:     	callq	0x1400021d0 <.text+0x11d0>
1458bf322:     	jmp	0x1458bf328 <.text+0x58be328>
1458bf324:     	movq	0x68(%rbp), %r14
1458bf328:     	testq	%r14, %r14
1458bf32b:     	je	0x1458bf33f <.text+0x58be33f>
1458bf32d:     	movq	-0x58(%rbp), %rcx
1458bf331:     	movl	$0x1, %r8d
1458bf337:     	movq	%r14, %rdx
1458bf33a:     	callq	0x1400021d0 <.text+0x11d0>
1458bf33f:     	movl	0x27452bb(%rip), %ecx   # 0x148004600
1458bf345:     	xorl	%eax, %eax
1458bf347:     	testl	%ecx, %ecx
1458bf349:     	jne	0x1458bf47f <.text+0x58be47f>
1458bf34f:     	cmpq	$0x0, 0x2745291(%rip)   # 0x1480045e8
1458bf357:     	je	0x1458bf47f <.text+0x58be47f>
1458bf35d:     	leaq	0x274528c(%rip), %rcx   # 0x1480045f0
1458bf364:     	leaq	0x1c(%rbp), %rdx
1458bf368:     	callq	0x140d8aa00 <.text+0xd89a00>
1458bf36d:     	movq	%rax, %rcx
1458bf370:     	shrq	$0x39, %rax
1458bf374:     	movq	0x274525d(%rip), %rdx   # 0x1480045d8
1458bf37b:     	movq	0x274524e(%rip), %r8    # 0x1480045d0
1458bf382:     	movd	%eax, %xmm0
1458bf386:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1458bf38a:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1458bf38f:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
1458bf394:     	xorl	%eax, %eax
1458bf396:     	pcmpeqd	%xmm1, %xmm1
1458bf39a:     	xorl	%r9d, %r9d
1458bf39d:     	andq	%rdx, %rcx
1458bf3a0:     	movdqu	(%r8,%rcx), %xmm2
1458bf3a6:     	movdqa	%xmm2, %xmm3
1458bf3aa:     	pcmpeqb	%xmm0, %xmm3
1458bf3ae:     	pmovmskb	%xmm3, %r10d
1458bf3b3:     	testl	%r10d, %r10d
1458bf3b6:     	je	0x1458bf3e0 <.text+0x58be3e0>
1458bf3b8:     	tzcntl	%r10d, %edi
1458bf3bd:     	addq	%rcx, %rdi
1458bf3c0:     	andq	%rdx, %rdi
1458bf3c3:     	shlq	$0x5, %rdi
1458bf3c7:     	movq	%r8, %r11
1458bf3ca:     	subq	%rdi, %r11
1458bf3cd:     	cmpl	-0x20(%r11), %esi
1458bf3d1:     	je	0x1458bf3ff <.text+0x58be3ff>
1458bf3d3:     	leal	-0x1(%r10), %r11d
1458bf3d7:     	andw	%r10w, %r11w
1458bf3db:     	movl	%r11d, %r10d
1458bf3de:     	jne	0x1458bf3b8 <.text+0x58be3b8>
1458bf3e0:     	pcmpeqb	%xmm1, %xmm2
1458bf3e4:     	pmovmskb	%xmm2, %r10d
1458bf3e9:     	testl	%r10d, %r10d
1458bf3ec:     	jne	0x1458bf47f <.text+0x58be47f>
1458bf3f2:     	addq	%r9, %rcx
1458bf3f5:     	addq	$0x10, %rcx
1458bf3f9:     	addq	$0x10, %r9
1458bf3fd:     	jmp	0x1458bf39d <.text+0x58be39d>
1458bf3ff:     	movq	-0x10(%r11), %rax
1458bf403:     	movq	-0x8(%r11), %rdx
1458bf407:     	jmp	0x1458bf47f <.text+0x58be47f>
1458bf409:     	movq	%r12, 0x70(%rbp)
1458bf40d:     	leaq	0x12e18ff(%rip), %rcx   # 0x146ba0d13
1458bf414:     	movl	$0xf, %edx
1458bf419:     	callq	0x145d4cf00 <.text+0x5d4bf00>
1458bf41e:     	nop
1458bf41f:     	jmp	0x1458bf437 <.text+0x58be437>
1458bf421:     	movq	%r12, 0x70(%rbp)
1458bf425:     	leaq	0x12e18d4(%rip), %rcx   # 0x146ba0d00
1458bf42c:     	movl	$0x13, %edx
1458bf431:     	callq	0x145d4cf00 <.text+0x5d4bf00>
1458bf436:     	nop
1458bf437:     	movq	%rax, 0x38(%rbp)
1458bf43b:     	movq	$-0x1, 0x30(%rbp)
1458bf443:     	movq	0x68(%rbp), %rdx
1458bf447:     	testq	%rdx, %rdx
1458bf44a:     	movq	0x70(%rbp), %rcx
1458bf44e:     	je	0x1458bf45b <.text+0x58be45b>
1458bf450:     	movl	$0x1, %r8d
1458bf456:     	callq	0x1400021d0 <.text+0x11d0>
1458bf45b:     	leaq	0x38(%rbp), %rcx
1458bf45f:     	callq	0x145b6c710 <.text+0x5b6b710>
1458bf464:     	nop
1458bf465:     	movq	0x60(%rbp), %rdx
1458bf469:     	testq	%rdx, %rdx
1458bf46c:     	je	0x1458bf47d <.text+0x58be47d>
1458bf46e:     	movl	$0x1, %r8d
1458bf474:     	movq	0x20(%rbp), %rcx
1458bf478:     	callq	0x1400021d0 <.text+0x11d0>
1458bf47d:     	xorl	%eax, %eax
1458bf47f:     	addq	$0x108, %rsp            # imm = 0x108
1458bf486:     	popq	%rbx
1458bf487:     	popq	%rdi
1458bf488:     	popq	%rsi
1458bf489:     	popq	%r12
1458bf48b:     	popq	%r13
1458bf48d:     	popq	%r14
1458bf48f:     	popq	%r15
1458bf491:     	popq	%rbp
1458bf492:     	retq
1458bf493:     	leaq	-0x20(%rbp), %rcx
1458bf497:     	callq	0x145d4d1d7 <.text+0x5d4c1d7>
1458bf49c:     	nop
1458bf49d:     	jmp	0x1458bf246 <.text+0x58be246>

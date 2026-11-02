
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d7020:     	pushq	%rbp
1454d7021:     	pushq	%r15
1454d7023:     	pushq	%r14
1454d7025:     	pushq	%r13
1454d7027:     	pushq	%r12
1454d7029:     	pushq	%rsi
1454d702a:     	pushq	%rdi
1454d702b:     	pushq	%rbx
1454d702c:     	subq	$0x178, %rsp            # imm = 0x178
1454d7033:     	leaq	0x80(%rsp), %rbp
1454d703b:     	movaps	%xmm11, 0xe0(%rbp)
1454d7043:     	movaps	%xmm10, 0xd0(%rbp)
1454d704b:     	movaps	%xmm9, 0xc0(%rbp)
1454d7053:     	movaps	%xmm8, 0xb0(%rbp)
1454d705b:     	movaps	%xmm7, 0xa0(%rbp)
1454d7062:     	movaps	%xmm6, 0x90(%rbp)
1454d7069:     	movq	$-0x2, 0x88(%rbp)
1454d7074:     	cmpl	$0x5, 0x7d0(%rcx)
1454d707b:     	jb	0x1454d755c <.text+0x54d655c>
1454d7081:     	movq	%rcx, %rsi
1454d7084:     	movss	0x8e4(%rcx), %xmm0
1454d708c:     	movq	0x730(%rcx), %rcx
1454d7093:     	movss	0x514235(%rip), %xmm1   # 0x1459eb2d0
1454d709b:     	testq	%rcx, %rcx
1454d709e:     	je	0x1454d70ef <.text+0x54d60ef>
1454d70a0:     	movq	0x728(%rsi), %rax
1454d70a7:     	shlq	$0x3, %rcx
1454d70ab:     	leaq	(%rcx,%rcx,2), %rdx
1454d70af:     	xorl	%ecx, %ecx
1454d70b1:     	movabsq	$0x7461665f6c616573, %r8 # imm = 0x7461665F6C616573
1454d70bb:     	jmp	0x1454d70c9 <.text+0x54d60c9>
1454d70bd:     	nopl	(%rax)
1454d70c0:     	addq	$0x18, %rcx
1454d70c4:     	cmpq	%rcx, %rdx
1454d70c7:     	je	0x1454d70ef <.text+0x54d60ef>
1454d70c9:     	cmpq	$0x9, 0x8(%rax,%rcx)
1454d70cf:     	jne	0x1454d70c0 <.text+0x54d60c0>
1454d70d1:     	movq	(%rax,%rcx), %r9
1454d70d5:     	movq	(%r9), %r10
1454d70d8:     	xorq	%r8, %r10
1454d70db:     	movzbl	0x8(%r9), %r9d
1454d70e0:     	xorq	$0x65, %r9
1454d70e4:     	orq	%r10, %r9
1454d70e7:     	jne	0x1454d70c0 <.text+0x54d60c0>
1454d70e9:     	movss	0x10(%rax,%rcx), %xmm1
1454d70ef:     	ucomiss	%xmm1, %xmm0
1454d70f2:     	jb	0x1454d755c <.text+0x54d655c>
1454d70f8:     	movq	0x2a0(%rsi), %rcx
1454d70ff:     	testq	%rcx, %rcx
1454d7102:     	je	0x1454d755c <.text+0x54d655c>
1454d7108:     	movq	0x298(%rsi), %rax
1454d710f:     	imulq	$0x58, %rcx, %rdx
1454d7113:     	xorl	%ecx, %ecx
1454d7115:     	movabsq	$0x7461665f6c616573, %r8 # imm = 0x7461665F6C616573
1454d711f:     	jmp	0x1454d713d <.text+0x54d613d>
1454d7121:     	nopw	%cs:(%rax,%rax)
1454d7130:     	addq	$0x58, %rcx
1454d7134:     	cmpq	%rcx, %rdx
1454d7137:     	je	0x1454d755c <.text+0x54d655c>
1454d713d:     	movq	(%rax,%rcx), %r14
1454d7141:     	cmpq	$0x9, 0x8(%r14)
1454d7146:     	jne	0x1454d7130 <.text+0x54d6130>
1454d7148:     	movq	(%r14), %r9
1454d714b:     	movq	(%r9), %r10
1454d714e:     	xorq	%r8, %r10
1454d7151:     	movzbl	0x8(%r9), %r9d
1454d7156:     	xorq	$0x65, %r9
1454d715a:     	orq	%r10, %r9
1454d715d:     	jne	0x1454d7130 <.text+0x54d6130>
1454d715f:     	movl	0x8(%rax,%rcx), %edx
1454d7163:     	movss	0x14(%rax,%rcx), %xmm0
1454d7169:     	movl	0x18(%rax,%rcx), %r15d
1454d716e:     	movl	0x34(%rax,%rcx), %r8d
1454d7173:     	movl	%r8d, -0xc(%rbp)
1454d7177:     	movups	0x24(%rax,%rcx), %xmm1
1454d717c:     	movups	%xmm1, -0x1c(%rbp)
1454d7180:     	movups	0x38(%rax,%rcx), %xmm1
1454d7185:     	movups	0x44(%rax,%rcx), %xmm2
1454d718a:     	movups	%xmm1, -0x8(%rbp)
1454d718e:     	movups	%xmm2, 0x4(%rbp)
1454d7192:     	movq	%r14, -0x40(%rbp)
1454d7196:     	movl	%edx, -0x38(%rbp)
1454d7199:     	movss	0x10(%rax,%rcx), %xmm7
1454d719f:     	movsd	0xc(%rax,%rcx), %xmm1
1454d71a5:     	movsd	%xmm1, -0x34(%rbp)
1454d71aa:     	movss	%xmm0, -0x2c(%rbp)
1454d71af:     	movl	%r15d, -0x28(%rbp)
1454d71b3:     	movsd	0x1c(%rax,%rcx), %xmm0
1454d71b9:     	movsd	%xmm0, -0x24(%rbp)
1454d71be:     	movss	0x458(%rsi), %xmm8
1454d71c7:     	movss	0x45c(%rsi), %xmm6
1454d71cf:     	movl	0x48c(%rsi), %r13d
1454d71d6:     	movl	0x3f0(%rsi), %eax
1454d71dc:     	movl	%eax, 0x48(%rbp)
1454d71df:     	movq	0x3e8(%rsi), %rax
1454d71e6:     	movq	%rax, 0x40(%rbp)
1454d71ea:     	movss	0x4c(%r14), %xmm3
1454d71f0:     	movq	$0x0, 0x28(%rsp)
1454d71f9:     	movq	$0x8, 0x20(%rsp)
1454d7202:     	leaq	0x18(%rbp), %rcx
1454d7206:     	leaq	0x40(%rbp), %rbx
1454d720a:     	movq	%rsi, %rdx
1454d720d:     	movq	%rbx, %r8
1454d7210:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454d7215:     	movq	0x28(%rbp), %rdi
1454d7219:     	testq	%rdi, %rdi
1454d721c:     	je	0x1454d7369 <.text+0x54d6369>
1454d7222:     	movq	0x20(%rbp), %rax
1454d7226:     	movq	%rax, 0x78(%rbp)
1454d722a:     	movss	0x8e4(%rsi), %xmm0
1454d7232:     	movss	%xmm0, 0x6c(%rbp)
1454d7237:     	movq	%rsi, 0x40(%rbp)
1454d723b:     	leaq	0x6c(%rbp), %rax
1454d723f:     	movq	%rax, 0x48(%rbp)
1454d7243:     	movq	%rbx, 0x60(%rbp)
1454d7247:     	leaq	0x60(%rbp), %r12
1454d724b:     	movq	%r12, 0x30(%rbp)
1454d724f:     	cmpq	$0x1, %rdi
1454d7253:     	jne	0x1454d759e <.text+0x54d659e>
1454d7259:     	movl	0x54(%r14), %eax
1454d725d:     	addl	%r15d, %r13d
1454d7260:     	addl	%eax, %r13d
1454d7263:     	addl	(%rbp), %r13d
1454d7267:     	testl	%eax, %eax
1454d7269:     	cmovel	%eax, %r13d
1454d726d:     	cmpl	$0x3, %r13d
1454d7271:     	movl	$0x3, %eax
1454d7276:     	cmovbl	%r13d, %eax
1454d727a:     	testl	%r13d, %r13d
1454d727d:     	movl	$0x1, %ebx
1454d7282:     	cmovnel	%eax, %ebx
1454d7285:     	cmpq	%rbx, %rdi
1454d7288:     	cmovaeq	%rbx, %rdi
1454d728c:     	movl	$0x0, 0x7d0(%rsi)
1454d7296:     	movb	$0x1, 0x87(%rbp)
1454d729d:     	leaq	-0x40(%rbp), %rdx
1454d72a1:     	movq	%rsi, %rcx
1454d72a4:     	callq	0x1454d49e0 <.text+0x54d39e0>
1454d72a9:     	nop
1454d72aa:     	testl	%ebx, %ebx
1454d72ac:     	je	0x1454d75d0 <.text+0x54d65d0>
1454d72b2:     	movq	0x3d0(%rsi), %rdx
1454d72b9:     	movq	0x78(%rbp), %r9
1454d72bd:     	movq	(%r9), %rax
1454d72c0:     	movq	%rax, 0x38(%rbp)
1454d72c4:     	movl	$0x0, 0x30(%rbp)
1454d72cb:     	movl	$0x0, 0x60(%rbp)
1454d72d2:     	movb	$0x1, 0x87(%rbp)
1454d72d9:     	movq	%r12, 0x30(%rsp)
1454d72de:     	leaq	0x30(%rbp), %rax
1454d72e2:     	movq	%rax, 0x28(%rsp)
1454d72e7:     	movq	%rdi, 0x20(%rsp)
1454d72ec:     	leaq	0x40(%rbp), %rcx
1454d72f0:     	movl	$0x832, %r8d            # imm = 0x832
1454d72f6:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454d72fb:     	nop
1454d72fc:     	movq	0x548(%rsi), %rbx
1454d7303:     	cmpq	0x538(%rsi), %rbx
1454d730a:     	jne	0x1454d7319 <.text+0x54d6319>
1454d730c:     	leaq	0x538(%rsi), %rcx
1454d7313:     	callq	0x1457580b0 <.text+0x57570b0>
1454d7318:     	nop
1454d7319:     	movq	0x540(%rsi), %rax
1454d7320:     	movq	%rbx, %rcx
1454d7323:     	shlq	$0x5, %rcx
1454d7327:     	movups	0x40(%rbp), %xmm0
1454d732b:     	movups	0x50(%rbp), %xmm1
1454d732f:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d7334:     	movups	%xmm0, (%rax,%rcx)
1454d7338:     	incq	%rbx
1454d733b:     	movq	%rbx, 0x548(%rsi)
1454d7342:     	movss	0x44(%r14), %xmm1
1454d7348:     	movss	-0x8(%rbp), %xmm0
1454d734d:     	movzbl	0x75(%r14), %eax
1454d7352:     	addb	$-0x2, %al
1454d7354:     	cmpb	$0x6, %al
1454d7356:     	ja	0x1454d7383 <.text+0x54d6383>
1454d7358:     	movzbl	%al, %eax
1454d735b:     	leaq	0x14d573a(%rip), %rcx   # 0x1469aca9c
1454d7362:     	movss	(%rcx,%rax,4), %xmm2
1454d7367:     	jmp	0x1454d738b <.text+0x54d638b>
1454d7369:     	movq	0x18(%rbp), %rdx
1454d736d:     	testq	%rdx, %rdx
1454d7370:     	je	0x1454d755c <.text+0x54d655c>
1454d7376:     	movq	0x20(%rbp), %rax
1454d737a:     	movq	%rax, 0x78(%rbp)
1454d737e:     	jmp	0x1454d7549 <.text+0x54d6549>
1454d7383:     	movss	0x4140f5(%rip), %xmm2   # 0x1458eb480
1454d738b:     	mulss	0xc(%rbp), %xmm8
1454d7391:     	xorps	%xmm3, %xmm3
1454d7394:     	cmpltss	%xmm1, %xmm3
1454d7399:     	andps	%xmm8, %xmm3
1454d739d:     	mulss	0x42199b(%rip), %xmm1   # 0x1458f8d40
1454d73a5:     	mulss	%xmm1, %xmm7
1454d73a9:     	mulss	%xmm7, %xmm0
1454d73ad:     	mulss	%xmm2, %xmm0
1454d73b1:     	addss	%xmm3, %xmm0
1454d73b5:     	mulss	%xmm0, %xmm6
1454d73b9:     	movq	0x18(%rbp), %rax
1454d73bd:     	movq	%rax, 0x70(%rbp)
1454d73c1:     	movq	0x78(%rbp), %rbx
1454d73c5:     	leaq	(%rbx,%rdi,8), %rdi
1454d73c9:     	movaps	%xmm6, %xmm7
1454d73cc:     	addss	%xmm6, %xmm7
1454d73d0:     	movss	0x513fe7(%rip), %xmm8   # 0x1459eb3c0
1454d73d9:     	movss	0x433a62(%rip), %xmm9   # 0x14590ae44
1454d73e2:     	nopw	%cs:(%rax,%rax)
1454d73f0:     	movq	(%rbx), %rdx
1454d73f3:     	addq	$0x8, %rbx
1454d73f7:     	movq	0x4c8(%rsi), %rax
1454d73fe:     	imulq	$0x160, 0x4d0(%rsi), %r8 # imm = 0x160
1454d7409:     	xorl	%ecx, %ecx
1454d740b:     	movq	%rax, %r9
1454d740e:     	nop
1454d7410:     	cmpq	%rcx, %r8
1454d7413:     	je	0x1454d7450 <.text+0x54d6450>
1454d7415:     	addq	$0x160, %rcx            # imm = 0x160
1454d741c:     	cmpq	%rdx, 0x88(%r9)
1454d7423:     	leaq	0x160(%r9), %r9
1454d742a:     	jne	0x1454d7410 <.text+0x54d6410>
1454d742c:     	movss	-0x70(%rax,%rcx), %xmm0
1454d7432:     	divss	-0x6c(%rax,%rcx), %xmm0
1454d7438:     	cmpltss	%xmm9, %xmm0
1454d743e:     	movaps	%xmm0, %xmm1
1454d7441:     	andps	%xmm7, %xmm1
1454d7444:     	andnps	%xmm6, %xmm0
1454d7447:     	orps	%xmm1, %xmm0
1454d744a:     	jmp	0x1454d7453 <.text+0x54d6453>
1454d744c:     	nopl	(%rax)
1454d7450:     	movaps	%xmm6, %xmm0
1454d7453:     	movq	0x880(%rsi), %rax
1454d745a:     	movq	0x898(%rsi), %rcx
1454d7461:     	leaq	(%rcx,%rax), %r8
1454d7465:     	rolq	$0x17, %r8
1454d7469:     	addq	%rax, %r8
1454d746c:     	movq	0x888(%rsi), %r9
1454d7473:     	movq	%r9, %r10
1454d7476:     	shlq	$0x11, %r10
1454d747a:     	movq	0x890(%rsi), %r11
1454d7481:     	xorq	%rax, %r11
1454d7484:     	xorq	%r9, %rcx
1454d7487:     	xorq	%r11, %r9
1454d748a:     	movq	%r9, 0x888(%rsi)
1454d7491:     	xorq	%rcx, %rax
1454d7494:     	movq	%rax, 0x880(%rsi)
1454d749b:     	xorq	%r10, %r11
1454d749e:     	movq	%r11, 0x890(%rsi)
1454d74a5:     	rolq	$0x2d, %rcx
1454d74a9:     	movq	%rcx, 0x898(%rsi)
1454d74b0:     	shrq	$0x28, %r8
1454d74b4:     	xorps	%xmm1, %xmm1
1454d74b7:     	cvtsi2ss	%r8d, %xmm1
1454d74bc:     	mulss	%xmm8, %xmm1
1454d74c1:     	movss	0x464(%rsi), %xmm3
1454d74c9:     	movss	0x468(%rsi), %xmm2
1454d74d1:     	mulss	%xmm0, %xmm2
1454d74d5:     	movl	0x40(%r14), %r9d
1454d74d9:     	movzbl	0x74(%r14), %eax
1454d74de:     	movzbl	0x111(%rsi), %r15d
1454d74e6:     	movb	$0x3, 0x111(%rsi)
1454d74ed:     	movups	0x20(%rsi), %xmm10
1454d74f2:     	movups	0x40(%rsi), %xmm11
1454d74f7:     	movq	$0x0, 0x20(%rsi)
1454d74ff:     	movq	$0x0, 0x40(%rsi)
1454d7507:     	ucomiss	%xmm1, %xmm3
1454d750a:     	ja	0x1454d750f <.text+0x54d650f>
1454d750c:     	movaps	%xmm0, %xmm2
1454d750f:     	seta	0x28(%rsp)
1454d7514:     	movb	%al, 0x20(%rsp)
1454d7518:     	movb	$0x0, 0x30(%rsp)
1454d751d:     	movq	%rsi, %rcx
1454d7520:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454d7525:     	nop
1454d7526:     	movb	%r15b, 0x111(%rsi)
1454d752d:     	movups	%xmm10, 0x20(%rsi)
1454d7532:     	movups	%xmm11, 0x40(%rsi)
1454d7537:     	cmpq	%rdi, %rbx
1454d753a:     	jne	0x1454d73f0 <.text+0x54d63f0>
1454d7540:     	movq	0x70(%rbp), %rdx
1454d7544:     	testq	%rdx, %rdx
1454d7547:     	je	0x1454d755c <.text+0x54d655c>
1454d7549:     	shlq	$0x3, %rdx
1454d754d:     	movl	$0x8, %r8d
1454d7553:     	movq	0x78(%rbp), %rcx
1454d7557:     	callq	0x1400021d0 <.text+0x11d0>
1454d755c:     	movaps	0x90(%rbp), %xmm6
1454d7563:     	movaps	0xa0(%rbp), %xmm7
1454d756a:     	movaps	0xb0(%rbp), %xmm8
1454d7572:     	movaps	0xc0(%rbp), %xmm9
1454d757a:     	movaps	0xd0(%rbp), %xmm10
1454d7582:     	movaps	0xe0(%rbp), %xmm11
1454d758a:     	addq	$0x178, %rsp            # imm = 0x178
1454d7591:     	popq	%rbx
1454d7592:     	popq	%rdi
1454d7593:     	popq	%rsi
1454d7594:     	popq	%r12
1454d7596:     	popq	%r13
1454d7598:     	popq	%r14
1454d759a:     	popq	%r15
1454d759c:     	popq	%rbp
1454d759d:     	retq
1454d759e:     	cmpq	$0x15, %rdi
1454d75a2:     	jae	0x1454d75ea <.text+0x54d65ea>
1454d75a4:     	movl	$0x8, %ebx
1454d75a9:     	movq	0x78(%rbp), %rcx
1454d75ad:     	leaq	(%rcx,%rbx), %rdx
1454d75b1:     	leaq	0x60(%rbp), %r8
1454d75b5:     	callq	0x1454f1030 <.text+0x54f0030>
1454d75ba:     	addq	$0x8, %rbx
1454d75be:     	leaq	(,%rdi,8), %rax
1454d75c6:     	cmpq	%rbx, %rax
1454d75c9:     	jne	0x1454d75a9 <.text+0x54d65a9>
1454d75cb:     	jmp	0x1454d7259 <.text+0x54d6259>
1454d75d0:     	movb	$0x1, 0x87(%rbp)
1454d75d7:     	leaq	0x14d436a(%rip), %r8    # 0x1469ab948
1454d75de:     	xorl	%ecx, %ecx
1454d75e0:     	xorl	%edx, %edx
1454d75e2:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454d75e7:     	nop
1454d75e8:     	ud2
1454d75ea:     	movb	$0x1, 0x87(%rbp)
1454d75f1:     	leaq	0x30(%rbp), %r8
1454d75f5:     	movq	0x78(%rbp), %rcx
1454d75f9:     	movq	%rdi, %rdx
1454d75fc:     	callq	0x14553a210 <.text+0x5539210>
1454d7601:     	nop
1454d7602:     	jmp	0x1454d7259 <.text+0x54d6259>

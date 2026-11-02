
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459721c0:     	pushq	%rbp
1459721c1:     	pushq	%r15
1459721c3:     	pushq	%r14
1459721c5:     	pushq	%r13
1459721c7:     	pushq	%r12
1459721c9:     	pushq	%rsi
1459721ca:     	pushq	%rdi
1459721cb:     	pushq	%rbx
1459721cc:     	subq	$0x108, %rsp            # imm = 0x108
1459721d3:     	leaq	0x80(%rsp), %rbp
1459721db:     	movaps	%xmm13, 0x70(%rbp)
1459721e0:     	movaps	%xmm12, 0x60(%rbp)
1459721e5:     	movaps	%xmm11, 0x50(%rbp)
1459721ea:     	movaps	%xmm10, 0x40(%rbp)
1459721ef:     	movaps	%xmm9, 0x30(%rbp)
1459721f4:     	movaps	%xmm8, 0x20(%rbp)
1459721f9:     	movaps	%xmm7, 0x10(%rbp)
1459721fd:     	movaps	%xmm6, (%rbp)
145972201:     	movq	$-0x2, -0x8(%rbp)
145972209:     	movq	0x810(%rdx), %r8
145972210:     	testq	%r8, %r8
145972213:     	movq	%rcx, -0x58(%rbp)
145972217:     	je	0x145972233 <.text+0x5971233>
145972219:     	movq	0x808(%rdx), %rax
145972220:     	cmpq	$0x1, %r8
145972224:     	jne	0x14597223c <.text+0x597123c>
145972226:     	movss	0x56e202(%rip), %xmm0   # 0x145ee0430
14597222e:     	xorl	%r10d, %r10d
145972231:     	jmp	0x14597228e <.text+0x597128e>
145972233:     	movl	$0x0, -0xc(%rbp)
14597223a:     	jmp	0x1459722a8 <.text+0x59712a8>
14597223c:     	movq	%r8, %r9
14597223f:     	andq	$-0x2, %r9
145972243:     	movss	0x56e1e5(%rip), %xmm0   # 0x145ee0430
14597224b:     	xorl	%r10d, %r10d
14597224e:     	jmp	0x145972259 <.text+0x5971259>
145972250:     	addq	$0x2, %r10
145972254:     	cmpq	%r10, %r9
145972257:     	je	0x145972288 <.text+0x5971288>
145972259:     	cmpb	$0x20, (%rax,%r10,8)
14597225e:     	je	0x145972270 <.text+0x5971270>
145972260:     	cmpb	$0x20, 0x8(%rax,%r10,8)
145972266:     	jne	0x145972250 <.text+0x5971250>
145972268:     	jmp	0x14597227f <.text+0x597127f>
14597226a:     	nopw	(%rax,%rax)
145972270:     	addss	0x4(%rax,%r10,8), %xmm0
145972277:     	cmpb	$0x20, 0x8(%rax,%r10,8)
14597227d:     	jne	0x145972250 <.text+0x5971250>
14597227f:     	addss	0xc(%rax,%r10,8), %xmm0
145972286:     	jmp	0x145972250 <.text+0x5971250>
145972288:     	testb	$0x1, %r8b
14597228c:     	je	0x14597229c <.text+0x597129c>
14597228e:     	cmpb	$0x20, (%rax,%r10,8)
145972293:     	jne	0x14597229c <.text+0x597129c>
145972295:     	addss	0x4(%rax,%r10,8), %xmm0
14597229c:     	xorps	%xmm1, %xmm1
14597229f:     	ucomiss	%xmm1, %xmm0
1459722a2:     	seta	%al
1459722a5:     	movl	%eax, -0xc(%rbp)
1459722a8:     	movss	0x498(%rdx), %xmm6
1459722b0:     	movq	$0x0, -0x38(%rbp)
1459722b8:     	movq	$0x8, -0x30(%rbp)
1459722c0:     	movq	$0x0, -0x28(%rbp)
1459722c8:     	movq	0x840(%rdx), %rax
1459722cf:     	movq	%rax, -0x40(%rbp)
1459722d3:     	testq	%rax, %rax
1459722d6:     	je	0x14597253d <.text+0x597153d>
1459722dc:     	movq	0x838(%rdx), %r15
1459722e3:     	movq	-0x40(%rbp), %r12
1459722e7:     	shlq	$0x6, %r12
1459722eb:     	movq	0x90(%rdx), %rax
1459722f2:     	movq	%rax, -0x50(%rbp)
1459722f6:     	movq	0x88(%rdx), %rax
1459722fd:     	movq	%rax, -0x48(%rbp)
145972301:     	movq	0x70(%rdx), %rax
145972305:     	movq	%rax, -0x18(%rbp)
145972309:     	movq	0x78(%rdx), %rax
14597230d:     	movq	%rax, -0x20(%rbp)
145972311:     	movss	0xb9c(%rdx), %xmm7
145972319:     	movss	0x198(%rdx), %xmm8
145972322:     	xorl	%ebx, %ebx
145972324:     	xorps	%xmm9, %xmm9
145972328:     	movss	0x56dbdf(%rip), %xmm10  # 0x145edff10
145972331:     	movss	0x573286(%rip), %xmm11  # 0x145ee55c0
14597233a:     	xorl	%r13d, %r13d
14597233d:     	xorl	%r14d, %r14d
145972340:     	jmp	0x14597238e <.text+0x597138e>
145972342:     	nopw	%cs:(%rax,%rax)
145972350:     	movq	-0x30(%rbp), %rax
145972354:     	movq	%rbx, %rcx
145972357:     	shlq	$0x5, %rcx
14597235b:     	movq	%rsi, (%rax,%rcx)
14597235f:     	movq	%rdi, 0x8(%rax,%rcx)
145972364:     	movq	%r14, 0x10(%rax,%rcx)
145972369:     	movss	%xmm13, 0x18(%rax,%rcx)
145972370:     	movss	%xmm12, 0x1c(%rax,%rcx)
145972377:     	incq	%rbx
14597237a:     	movq	%rbx, -0x28(%rbp)
14597237e:     	addq	$0x40, %r13
145972382:     	incq	%r14
145972385:     	cmpq	%r13, %r12
145972388:     	je	0x14597253d <.text+0x597153d>
14597238e:     	movzbl	(%r15,%r13), %eax
145972393:     	cmpq	$0x22, %rax
145972397:     	ja	0x14597237e <.text+0x597137e>
145972399:     	leaq	0x19c0c9c(%rip), %rcx   # 0x14733303c
1459723a0:     	movslq	(%rcx,%rax,4), %rax
1459723a4:     	addq	%rcx, %rax
1459723a7:     	jmpq	*%rax
1459723a9:     	movss	0x8(%r15,%r13), %xmm12
1459723b0:     	ucomiss	%xmm9, %xmm12
1459723b4:     	jbe	0x14597237e <.text+0x597137e>
1459723b6:     	jmp	0x1459724ce <.text+0x59714ce>
1459723bb:     	movaps	%xmm10, %xmm12
1459723bf:     	cmpb	$0x0, -0xc(%rbp)
1459723c3:     	jne	0x1459723d6 <.text+0x59713d6>
1459723c5:     	movss	0x4(%r15,%r13), %xmm12
1459723cc:     	mulss	%xmm6, %xmm12
1459723d1:     	maxss	%xmm11, %xmm12
1459723d6:     	movl	$0x6, %edi
1459723db:     	xorps	%xmm13, %xmm13
1459723df:     	cmpq	-0x20(%rbp), %r14
1459723e3:     	jae	0x14597252a <.text+0x597152a>
1459723e9:     	movq	-0x18(%rbp), %rax
1459723ed:     	movss	(%rax,%r14,4), %xmm13
1459723f3:     	leaq	0x19bfcc0(%rip), %rsi   # 0x1473320ba
1459723fa:     	cmpq	-0x38(%rbp), %rbx
1459723fe:     	jne	0x145972350 <.text+0x5971350>
145972404:     	jmp	0x14597251b <.text+0x597151b>
145972409:     	cmpq	-0x40(%rbp), %r14
14597240d:     	jae	0x14597237e <.text+0x597137e>
145972413:     	cmpb	$0x22, (%r15,%r13)
145972418:     	jne	0x14597237e <.text+0x597137e>
14597241e:     	movaps	%xmm7, %xmm13
145972422:     	cmpq	-0x50(%rbp), %r14
145972426:     	jae	0x14597247a <.text+0x597147a>
145972428:     	movq	-0x48(%rbp), %rax
14597242c:     	cmpl	$0x0, (%rax,%r14,4)
145972431:     	movaps	%xmm7, %xmm13
145972435:     	je	0x14597247a <.text+0x597147a>
145972437:     	xorps	%xmm0, %xmm0
14597243a:     	cmpq	-0x20(%rbp), %r14
14597243e:     	jae	0x14597244a <.text+0x597144a>
145972440:     	movq	-0x18(%rbp), %rax
145972444:     	movss	(%rax,%r14,4), %xmm0
14597244a:     	movss	0x8(%r15,%r13), %xmm1
145972451:     	mulss	%xmm6, %xmm1
145972455:     	movaps	%xmm1, %xmm2
145972458:     	maxss	0xc(%r15,%r13), %xmm2
14597245f:     	movaps	%xmm2, %xmm13
145972463:     	cmpunordss	%xmm2, %xmm13
145972469:     	andps	%xmm13, %xmm1
14597246d:     	andnps	%xmm2, %xmm13
145972471:     	orps	%xmm1, %xmm13
145972475:     	addss	%xmm0, %xmm13
14597247a:     	movss	0x8(%r15,%r13), %xmm0
145972481:     	mulss	%xmm6, %xmm0
145972485:     	movaps	%xmm0, %xmm1
145972488:     	maxss	0xc(%r15,%r13), %xmm1
14597248f:     	movaps	%xmm1, %xmm12
145972493:     	cmpunordss	%xmm1, %xmm12
145972499:     	andps	%xmm12, %xmm0
14597249d:     	andnps	%xmm1, %xmm12
1459724a1:     	orps	%xmm0, %xmm12
1459724a5:     	movl	$0x6, %edi
1459724aa:     	leaq	0x19bfc09(%rip), %rsi   # 0x1473320ba
1459724b1:     	cmpq	-0x38(%rbp), %rbx
1459724b5:     	jne	0x145972350 <.text+0x5971350>
1459724bb:     	jmp	0x14597251b <.text+0x597151b>
1459724bd:     	movss	0x4(%r15,%r13), %xmm12
1459724c4:     	ucomiss	%xmm9, %xmm12
1459724c8:     	jbe	0x14597237e <.text+0x597137e>
1459724ce:     	movl	$0x8, %edi
1459724d3:     	xorps	%xmm13, %xmm13
1459724d7:     	cmpq	-0x20(%rbp), %r14
1459724db:     	jae	0x14597250a <.text+0x597150a>
1459724dd:     	movq	-0x18(%rbp), %rax
1459724e1:     	movss	(%rax,%r14,4), %xmm13
1459724e7:     	leaq	0x19be064(%rip), %rsi   # 0x147330552
1459724ee:     	cmpq	-0x38(%rbp), %rbx
1459724f2:     	jne	0x145972350 <.text+0x5971350>
1459724f8:     	jmp	0x14597251b <.text+0x597151b>
1459724fa:     	movss	0x4(%r15,%r13), %xmm12
145972501:     	movl	$0x8, %edi
145972506:     	movaps	%xmm8, %xmm13
14597250a:     	leaq	0x19be041(%rip), %rsi   # 0x147330552
145972511:     	cmpq	-0x38(%rbp), %rbx
145972515:     	jne	0x145972350 <.text+0x5971350>
14597251b:     	leaq	-0x38(%rbp), %rcx
14597251f:     	callq	0x145d150f0 <.text+0x5d140f0>
145972524:     	nop
145972525:     	jmp	0x145972350 <.text+0x5971350>
14597252a:     	leaq	0x19bfb89(%rip), %rsi   # 0x1473320ba
145972531:     	cmpq	-0x38(%rbp), %rbx
145972535:     	jne	0x145972350 <.text+0x5971350>
14597253b:     	jmp	0x14597251b <.text+0x597151b>
14597253d:     	movq	-0x28(%rbp), %rcx
145972541:     	movq	-0x58(%rbp), %rax
145972545:     	movq	%rcx, 0x10(%rax)
145972549:     	movq	-0x38(%rbp), %rcx
14597254d:     	movq	%rcx, (%rax)
145972550:     	movq	-0x30(%rbp), %rcx
145972554:     	movq	%rcx, 0x8(%rax)
145972558:     	movaps	(%rbp), %xmm6
14597255c:     	movaps	0x10(%rbp), %xmm7
145972560:     	movaps	0x20(%rbp), %xmm8
145972565:     	movaps	0x30(%rbp), %xmm9
14597256a:     	movaps	0x40(%rbp), %xmm10
14597256f:     	movaps	0x50(%rbp), %xmm11
145972574:     	movaps	0x60(%rbp), %xmm12
145972579:     	movaps	0x70(%rbp), %xmm13
14597257e:     	addq	$0x108, %rsp            # imm = 0x108
145972585:     	popq	%rbx
145972586:     	popq	%rdi
145972587:     	popq	%rsi
145972588:     	popq	%r12
14597258a:     	popq	%r13
14597258c:     	popq	%r14
14597258e:     	popq	%r15
145972590:     	popq	%rbp
145972591:     	retq

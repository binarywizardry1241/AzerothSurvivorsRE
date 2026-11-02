
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400d6fc0:     	pushq	%rbp
1400d6fc1:     	pushq	%r15
1400d6fc3:     	pushq	%r14
1400d6fc5:     	pushq	%r13
1400d6fc7:     	pushq	%r12
1400d6fc9:     	pushq	%rsi
1400d6fca:     	pushq	%rdi
1400d6fcb:     	pushq	%rbx
1400d6fcc:     	subq	$0x578, %rsp            # imm = 0x578
1400d6fd3:     	leaq	0x80(%rsp), %rbp
1400d6fdb:     	movaps	%xmm6, 0x4e0(%rbp)
1400d6fe2:     	movq	$-0x2, 0x4d8(%rbp)
1400d6fed:     	movq	0x568(%rbp), %rax
1400d6ff4:     	movq	0x580(%rbp), %rcx
1400d6ffb:     	movq	0x578(%rbp), %r10
1400d7002:     	movq	0x570(%rbp), %r11
1400d7009:     	movq	0x560(%rbp), %rsi
1400d7010:     	movq	0x20(%rdx), %rdi
1400d7014:     	movq	%rdi, 0x310(%rbp)
1400d701b:     	movups	(%rdx), %xmm0
1400d701e:     	movups	0x10(%rdx), %xmm1
1400d7022:     	movaps	%xmm1, 0x300(%rbp)
1400d7029:     	movaps	%xmm0, 0x2f0(%rbp)
1400d7030:     	movups	(%r8), %xmm0
1400d7034:     	movups	0x10(%r8), %xmm1
1400d7039:     	movups	%xmm1, 0x328(%rbp)
1400d7040:     	movups	%xmm0, 0x318(%rbp)
1400d7047:     	movups	(%r9), %xmm0
1400d704b:     	movups	0x10(%r9), %xmm1
1400d7050:     	movups	%xmm1, 0x348(%rbp)
1400d7057:     	movups	%xmm0, 0x338(%rbp)
1400d705e:     	movq	0x10(%rsi), %rdx
1400d7062:     	movq	%rdx, 0x368(%rbp)
1400d7069:     	movups	(%rsi), %xmm0
1400d706c:     	movups	%xmm0, 0x358(%rbp)
1400d7073:     	movups	(%rax), %xmm0
1400d7076:     	movups	0x10(%rax), %xmm1
1400d707a:     	movaps	%xmm1, 0x3c0(%rbp)
1400d7081:     	movaps	%xmm0, 0x3b0(%rbp)
1400d7088:     	movups	(%r11), %xmm0
1400d708c:     	movups	0x10(%r11), %xmm1
1400d7091:     	movaps	%xmm0, 0x370(%rbp)
1400d7098:     	movaps	%xmm1, 0x380(%rbp)
1400d709f:     	movups	(%r10), %xmm0
1400d70a3:     	movups	0x10(%r10), %xmm1
1400d70a8:     	movaps	%xmm0, 0x390(%rbp)
1400d70af:     	movaps	%xmm1, 0x3a0(%rbp)
1400d70b6:     	movups	(%rcx), %xmm0
1400d70b9:     	movups	0x10(%rcx), %xmm1
1400d70bd:     	movaps	%xmm1, 0x3e0(%rbp)
1400d70c4:     	movaps	%xmm0, 0x3d0(%rbp)
1400d70cb:     	movq	0x318(%rbp), %r8
1400d70d2:     	movq	0x338(%rbp), %r12
1400d70d9:     	movl	0xe0(%r8), %ecx
1400d70e0:     	cmpl	0x40(%r12), %ecx
1400d70e5:     	je	0x1400d7f1b <.text+0xd6f1b>
1400d70eb:     	movq	0x3d0(%rbp), %rdx
1400d70f2:     	movss	0x5c(%rdx), %xmm6
1400d70f7:     	cmpl	$0x1, 0x10(%r12)
1400d70fd:     	jne	0x1400d711a <.text+0xd611a>
1400d70ff:     	movaps	%xmm6, %xmm0
1400d7102:     	subss	0x14(%r12), %xmm0
1400d7109:     	movss	0x5825c6f(%rip), %xmm1  # 0x1458fcd80
1400d7111:     	ucomiss	%xmm0, %xmm1
1400d7114:     	ja	0x1400d7f1b <.text+0xd6f1b>
1400d711a:     	cmpq	$0x0, 0x3b0(%rbp)
1400d7122:     	je	0x1400d7f1b <.text+0xd6f1b>
1400d7128:     	movq	%r8, 0x4a0(%rbp)
1400d712f:     	movups	(%rax), %xmm0
1400d7132:     	movups	0x10(%rax), %xmm1
1400d7136:     	movaps	%xmm1, -0x40(%rbp)
1400d713a:     	movaps	%xmm0, -0x50(%rbp)
1400d713e:     	movl	0x354(%rbp), %eax
1400d7144:     	movq	0x348(%rbp), %rdx
1400d714b:     	movl	%ecx, 0x40(%r12)
1400d7150:     	movl	$0x0, 0x10(%r12)
1400d7159:     	movl	%eax, 0x4c8(%rbp)
1400d715f:     	movq	%rdx, 0x4c0(%rbp)
1400d7166:     	movl	%eax, (%rdx)
1400d7168:     	movq	$0x0, (%r12)
1400d7170:     	movq	0x360(%rbp), %r14
1400d7177:     	movq	0x358(%rbp), %rax
1400d717e:     	movq	0xf8(%rax), %rdi
1400d7185:     	movq	0x100(%rax), %rcx
1400d718c:     	leaq	(%rdi,%rcx,4), %rbx
1400d7190:     	movq	0x300(%rbp), %r10
1400d7197:     	movq	0x310(%rbp), %r11
1400d719e:     	movq	0x308(%rbp), %r8
1400d71a5:     	movq	0x2f0(%rbp), %r9
1400d71ac:     	movq	0x2f8(%rbp), %rdx
1400d71b3:     	cmpb	$0x1, 0x108(%rax)
1400d71ba:     	jne	0x1400d72c9 <.text+0xd62c9>
1400d71c0:     	xorl	%r13d, %r13d
1400d71c3:     	movl	$0x8, %r15d
1400d71c9:     	xorl	%esi, %esi
1400d71cb:     	cmpl	%r13d, %esi
1400d71ce:     	je	0x1400d71f0 <.text+0xd61f0>
1400d71d0:     	movl	%esi, %eax
1400d71d2:     	incl	%esi
1400d71d4:     	movq	(%r15,%rax,8), %rax
1400d71d8:     	testl	%eax, %eax
1400d71da:     	jne	0x1400d7220 <.text+0xd6220>
1400d71dc:     	cmpl	%r13d, %esi
1400d71df:     	jne	0x1400d71d0 <.text+0xd61d0>
1400d71e1:     	nopw	%cs:(%rax,%rax)
1400d71f0:     	cmpq	%rbx, %rdi
1400d71f3:     	je	0x1400d74bd <.text+0xd64bd>
1400d71f9:     	movl	(%rdi), %ecx
1400d71fb:     	addq	$0x4, %rdi
1400d71ff:     	movq	0x1a8(%r14), %rax
1400d7206:     	leaq	(%rcx,%rcx,8), %rcx
1400d720a:     	movq	0x10(%rax,%rcx,8), %r13
1400d720f:     	testq	%r13, %r13
1400d7212:     	je	0x1400d71f0 <.text+0xd61f0>
1400d7214:     	leaq	(%rax,%rcx,8), %rax
1400d7218:     	movq	0x8(%rax), %r15
1400d721c:     	xorl	%esi, %esi
1400d721e:     	jmp	0x1400d71d0 <.text+0xd61d0>
1400d7220:     	testq	%r10, %r10
1400d7223:     	movq	0x418(%rbp), %rcx
1400d722a:     	cmovneq	%r11, %rcx
1400d722e:     	movq	%rax, 0x150(%rbp)
1400d7235:     	movq	%r9, 0x158(%rbp)
1400d723c:     	movq	%rdx, %rax
1400d723f:     	movq	%rdx, 0x160(%rbp)
1400d7246:     	movq	%r10, 0x168(%rbp)
1400d724d:     	movq	%r8, 0x170(%rbp)
1400d7254:     	movq	%rcx, 0x418(%rbp)
1400d725b:     	movq	%rcx, 0x178(%rbp)
1400d7262:     	leaq	0x150(%rbp), %rcx
1400d7269:     	movq	%r8, 0x4b8(%rbp)
1400d7270:     	leaq	0x5827111(%rip), %rdx   # 0x1458fe388
1400d7277:     	movq	%r9, 0x4a8(%rbp)
1400d727e:     	movq	%rax, 0x498(%rbp)
1400d7285:     	movq	%r10, 0x450(%rbp)
1400d728c:     	movq	%r11, 0x458(%rbp)
1400d7293:     	callq	0x144e62740 <.text+0x4e61740>
1400d7298:     	movq	0x458(%rbp), %r11
1400d729f:     	movq	0x450(%rbp), %r10
1400d72a6:     	movq	0x498(%rbp), %rdx
1400d72ad:     	movq	0x4a8(%rbp), %r9
1400d72b4:     	movq	0x4b8(%rbp), %r8
1400d72bb:     	cmpl	%r13d, %esi
1400d72be:     	je	0x1400d71f0 <.text+0xd61f0>
1400d72c4:     	jmp	0x1400d71d0 <.text+0xd61d0>
1400d72c9:     	testq	%r10, %r10
1400d72cc:     	je	0x1400d73d7 <.text+0xd63d7>
1400d72d2:     	xorl	%r13d, %r13d
1400d72d5:     	movl	$0x8, %r15d
1400d72db:     	xorl	%esi, %esi
1400d72dd:     	cmpl	%r13d, %esi
1400d72e0:     	je	0x1400d7310 <.text+0xd6310>
1400d72e2:     	nopw	%cs:(%rax,%rax)
1400d72f0:     	movl	%esi, %eax
1400d72f2:     	shlq	$0x4, %rax
1400d72f6:     	incl	%esi
1400d72f8:     	movq	(%r15,%rax), %rax
1400d72fc:     	testl	%eax, %eax
1400d72fe:     	jne	0x1400d7343 <.text+0xd6343>
1400d7300:     	cmpl	%r13d, %esi
1400d7303:     	jne	0x1400d72f0 <.text+0xd62f0>
1400d7305:     	nopw	%cs:(%rax,%rax)
1400d7310:     	cmpq	%rbx, %rdi
1400d7313:     	je	0x1400d74bd <.text+0xd64bd>
1400d7319:     	movl	(%rdi), %ecx
1400d731b:     	addq	$0x4, %rdi
1400d731f:     	movq	0x108(%r14), %rax
1400d7326:     	leaq	(%rcx,%rcx,4), %rcx
1400d732a:     	shlq	$0x5, %rcx
1400d732e:     	movq	0x58(%rax,%rcx), %r13
1400d7333:     	testq	%r13, %r13
1400d7336:     	je	0x1400d7310 <.text+0xd6310>
1400d7338:     	addq	%rcx, %rax
1400d733b:     	movq	0x50(%rax), %r15
1400d733f:     	xorl	%esi, %esi
1400d7341:     	jmp	0x1400d72f0 <.text+0xd62f0>
1400d7343:     	movq	%rax, 0x150(%rbp)
1400d734a:     	movq	%r9, 0x158(%rbp)
1400d7351:     	movq	%rdx, %rax
1400d7354:     	movq	%rdx, 0x160(%rbp)
1400d735b:     	movq	%r10, 0x168(%rbp)
1400d7362:     	movq	%r8, 0x170(%rbp)
1400d7369:     	movq	%r11, 0x178(%rbp)
1400d7370:     	leaq	0x150(%rbp), %rcx
1400d7377:     	movq	%r8, 0x4b8(%rbp)
1400d737e:     	leaq	0x5827003(%rip), %rdx   # 0x1458fe388
1400d7385:     	movq	%r9, 0x4a8(%rbp)
1400d738c:     	movq	%rax, 0x498(%rbp)
1400d7393:     	movq	%r10, 0x450(%rbp)
1400d739a:     	movq	%r11, 0x458(%rbp)
1400d73a1:     	callq	0x144e62740 <.text+0x4e61740>
1400d73a6:     	movq	0x458(%rbp), %r11
1400d73ad:     	movq	0x450(%rbp), %r10
1400d73b4:     	movq	0x498(%rbp), %rdx
1400d73bb:     	movq	0x4a8(%rbp), %r9
1400d73c2:     	movq	0x4b8(%rbp), %r8
1400d73c9:     	cmpl	%r13d, %esi
1400d73cc:     	je	0x1400d7310 <.text+0xd6310>
1400d73d2:     	jmp	0x1400d72f0 <.text+0xd62f0>
1400d73d7:     	xorl	%r15d, %r15d
1400d73da:     	movl	$0x8, %esi
1400d73df:     	leaq	0x5826fa2(%rip), %r10   # 0x1458fe388
1400d73e6:     	leaq	0x150(%rbp), %rcx
1400d73ed:     	xorl	%r13d, %r13d
1400d73f0:     	cmpl	%r15d, %r13d
1400d73f3:     	je	0x1400d7410 <.text+0xd6410>
1400d73f5:     	movl	%r13d, %eax
1400d73f8:     	shlq	$0x4, %rax
1400d73fc:     	incl	%r13d
1400d73ff:     	movq	(%rsi,%rax), %rax
1400d7403:     	testl	%eax, %eax
1400d7405:     	jne	0x1400d7445 <.text+0xd6445>
1400d7407:     	cmpl	%r15d, %r13d
1400d740a:     	jne	0x1400d73f5 <.text+0xd63f5>
1400d740c:     	nopl	(%rax)
1400d7410:     	cmpq	%rbx, %rdi
1400d7413:     	je	0x1400d74bd <.text+0xd64bd>
1400d7419:     	movl	(%rdi), %r11d
1400d741c:     	addq	$0x4, %rdi
1400d7420:     	movq	0x108(%r14), %rax
1400d7427:     	leaq	(%r11,%r11,4), %r11
1400d742b:     	shlq	$0x5, %r11
1400d742f:     	movq	0x58(%rax,%r11), %r15
1400d7434:     	testq	%r15, %r15
1400d7437:     	je	0x1400d7410 <.text+0xd6410>
1400d7439:     	addq	%r11, %rax
1400d743c:     	movq	0x50(%rax), %rsi
1400d7440:     	xorl	%r13d, %r13d
1400d7443:     	jmp	0x1400d73f5 <.text+0xd63f5>
1400d7445:     	movq	%rax, 0x150(%rbp)
1400d744c:     	movq	%r9, 0x158(%rbp)
1400d7453:     	movq	%rdx, %rax
1400d7456:     	movq	%rdx, 0x160(%rbp)
1400d745d:     	movq	$0x0, 0x168(%rbp)
1400d7468:     	movq	%r8, 0x170(%rbp)
1400d746f:     	movq	%r8, 0x4b8(%rbp)
1400d7476:     	movq	%r10, %rdx
1400d7479:     	movq	%r9, 0x4a8(%rbp)
1400d7480:     	movq	%rax, 0x498(%rbp)
1400d7487:     	callq	0x144e62740 <.text+0x4e61740>
1400d748c:     	leaq	0x150(%rbp), %rcx
1400d7493:     	leaq	0x5826eee(%rip), %r10   # 0x1458fe388
1400d749a:     	movq	0x498(%rbp), %rdx
1400d74a1:     	movq	0x4a8(%rbp), %r9
1400d74a8:     	movq	0x4b8(%rbp), %r8
1400d74af:     	cmpl	%r15d, %r13d
1400d74b2:     	je	0x1400d7410 <.text+0xd6410>
1400d74b8:     	jmp	0x1400d73f5 <.text+0xd63f5>
1400d74bd:     	movq	0x4a0(%rbp), %rsi
1400d74c4:     	cmpb	$-0x1, 0x80(%rsi)
1400d74cb:     	je	0x1400d7527 <.text+0xd6527>
1400d74cd:     	subq	$-0x80, %rsi
1400d74d1:     	leaq	0x5826da0(%rip), %rcx   # 0x1458fe278
1400d74d8:     	movl	$0x7, %edx
1400d74dd:     	movq	%rsi, %r8
1400d74e0:     	callq	0x142aed730 <.text+0x2aec730>
1400d74e5:     	testq	%rax, %rax
1400d74e8:     	jne	0x1400d74f1 <.text+0xd64f1>
1400d74ea:     	movq	0x78e52c7(%rip), %rax   # 0x1479bc7b8
1400d74f1:     	cmpb	$0x4, (%rax)
1400d74f4:     	jne	0x1400d7544 <.text+0xd6544>
1400d74f6:     	addq	$0x8, %rax
1400d74fa:     	leaq	0x150(%rbp), %rcx
1400d7501:     	movq	%rax, %rdx
1400d7504:     	callq	0x14010f4a0 <.text+0x10e4a0>
1400d7509:     	movq	0x160(%rbp), %rax
1400d7510:     	movq	%rax, 0x490(%rbp)
1400d7517:     	movups	0x150(%rbp), %xmm0
1400d751e:     	movaps	%xmm0, 0x480(%rbp)
1400d7525:     	jmp	0x1400d7565 <.text+0xd6565>
1400d7527:     	movl	0x4c8(%rbp), %eax
1400d752d:     	movq	0x4c0(%rbp), %rcx
1400d7534:     	movl	%eax, (%rcx)
1400d7536:     	movq	$0x0, 0x18(%r12)
1400d753f:     	jmp	0x1400d7f1b <.text+0xd6f1b>
1400d7544:     	movq	$0x0, 0x480(%rbp)
1400d754f:     	movq	$0x8, 0x488(%rbp)
1400d755a:     	movq	$0x0, 0x490(%rbp)
1400d7565:     	leaq	0x5826d13(%rip), %rcx   # 0x1458fe27f
1400d756c:     	movl	$0x3, %edx
1400d7571:     	movq	%rsi, %r13
1400d7574:     	movq	%rsi, %r8
1400d7577:     	callq	0x142aed730 <.text+0x2aec730>
1400d757c:     	nop
1400d757d:     	testq	%rax, %rax
1400d7580:     	jne	0x1400d7589 <.text+0xd6589>
1400d7582:     	movq	0x78e522f(%rip), %rax   # 0x1479bc7b8
1400d7589:     	cmpb	$0x3, (%rax)
1400d758c:     	jne	0x1400d7598 <.text+0xd6598>
1400d758e:     	movq	0x10(%rax), %r15
1400d7592:     	movq	0x18(%rax), %rax
1400d7596:     	jmp	0x1400d75a4 <.text+0xd65a4>
1400d7598:     	leaq	0x5826ce3(%rip), %r15   # 0x1458fe282
1400d759f:     	movl	$0x7, %eax
1400d75a4:     	movq	%rax, 0x4a0(%rbp)
1400d75ab:     	movq	0x490(%rbp), %r14
1400d75b2:     	movl	0x4c8(%rbp), %eax
1400d75b8:     	movq	0x4c0(%rbp), %rcx
1400d75bf:     	movl	%eax, (%rcx)
1400d75c1:     	movq	%r14, 0x18(%r12)
1400d75c6:     	leaq	0x5826cbc(%rip), %rcx   # 0x1458fe289
1400d75cd:     	movl	$0x7, %edx
1400d75d2:     	movq	%r13, %r8
1400d75d5:     	callq	0x142aed730 <.text+0x2aec730>
1400d75da:     	nop
1400d75db:     	testq	%rax, %rax
1400d75de:     	jne	0x1400d75e7 <.text+0xd65e7>
1400d75e0:     	movq	0x78e51d1(%rip), %rax   # 0x1479bc7b8
1400d75e7:     	cmpb	$0x2, (%rax)
1400d75ea:     	jne	0x1400d75f7 <.text+0xd65f7>
1400d75ec:     	cmpq	$0x0, 0x8(%rax)
1400d75f1:     	je	0x1400d788d <.text+0xd688d>
1400d75f7:     	xorl	%eax, %eax
1400d75f9:     	movq	%rax, 0x20(%r12)
1400d75fe:     	movl	0x4c8(%rbp), %eax
1400d7604:     	movq	0x4c0(%rbp), %rcx
1400d760b:     	movl	%eax, (%rcx)
1400d760d:     	movb	$0x1, 0x48(%r12)
1400d7613:     	leaq	0x5826c76(%rip), %rcx   # 0x1458fe290
1400d761a:     	movl	$0xa, %edx
1400d761f:     	movq	%r13, %r8
1400d7622:     	callq	0x142aed730 <.text+0x2aec730>
1400d7627:     	nop
1400d7628:     	testq	%rax, %rax
1400d762b:     	jne	0x1400d7634 <.text+0xd6634>
1400d762d:     	movq	0x78e5184(%rip), %rax   # 0x1479bc7b8
1400d7634:     	movq	$-0x1, %rcx
1400d763b:     	cmpb	$0x2, (%rax)
1400d763e:     	jne	0x1400d764b <.text+0xd664b>
1400d7640:     	cmpq	$0x0, 0x8(%rax)
1400d7645:     	jne	0x1400d764b <.text+0xd664b>
1400d7647:     	movq	0x10(%rax), %rcx
1400d764b:     	movl	0x4c8(%rbp), %eax
1400d7651:     	movq	0x4c0(%rbp), %rdx
1400d7658:     	movl	%eax, (%rdx)
1400d765a:     	movq	%rcx, 0x28(%r12)
1400d765f:     	leaq	0x5826a27(%rip), %rcx   # 0x1458fe08d
1400d7666:     	movl	$0x4, %edx
1400d766b:     	movq	%r13, %r8
1400d766e:     	callq	0x142aed730 <.text+0x2aec730>
1400d7673:     	nop
1400d7674:     	testq	%rax, %rax
1400d7677:     	jne	0x1400d7680 <.text+0xd6680>
1400d7679:     	movq	0x78e5138(%rip), %rax   # 0x1479bc7b8
1400d7680:     	cmpb	$0x2, (%rax)
1400d7683:     	jne	0x1400d7690 <.text+0xd6690>
1400d7685:     	cmpq	$0x0, 0x8(%rax)
1400d768a:     	je	0x1400d7896 <.text+0xd6896>
1400d7690:     	xorl	%eax, %eax
1400d7692:     	movl	0x4c8(%rbp), %ecx
1400d7698:     	movq	0x4c0(%rbp), %rdx
1400d769f:     	movl	%ecx, (%rdx)
1400d76a1:     	movq	%rax, 0x30(%r12)
1400d76a6:     	leaq	0x5826bed(%rip), %rcx   # 0x1458fe29a
1400d76ad:     	movl	$0x8, %edx
1400d76b2:     	movq	%r13, %r8
1400d76b5:     	callq	0x142aed730 <.text+0x2aec730>
1400d76ba:     	nop
1400d76bb:     	testq	%rax, %rax
1400d76be:     	jne	0x1400d76c7 <.text+0xd66c7>
1400d76c0:     	movq	0x78e50f1(%rip), %rax   # 0x1479bc7b8
1400d76c7:     	cmpb	$0x2, (%rax)
1400d76ca:     	jne	0x1400d76d7 <.text+0xd66d7>
1400d76cc:     	cmpq	$0x0, 0x8(%rax)
1400d76d1:     	je	0x1400d789f <.text+0xd689f>
1400d76d7:     	xorl	%eax, %eax
1400d76d9:     	movl	0x4c8(%rbp), %ecx
1400d76df:     	movq	0x4c0(%rbp), %rdx
1400d76e6:     	movl	%ecx, (%rdx)
1400d76e8:     	movq	%rax, 0x38(%r12)
1400d76ed:     	leaq	0x5826bae(%rip), %rcx   # 0x1458fe2a2
1400d76f4:     	movl	$0x4, %edx
1400d76f9:     	movq	%r13, %r8
1400d76fc:     	callq	0x142aed730 <.text+0x2aec730>
1400d7701:     	nop
1400d7702:     	testq	%rax, %rax
1400d7705:     	jne	0x1400d770e <.text+0xd670e>
1400d7707:     	movq	0x78e50aa(%rip), %rax   # 0x1479bc7b8
1400d770e:     	cmpb	$0x1, (%rax)
1400d7711:     	jne	0x1400d7766 <.text+0xd6766>
1400d7713:     	cmpb	$0x1, 0x1(%rax)
1400d7717:     	jne	0x1400d7766 <.text+0xd6766>
1400d7719:     	leaq	0x5826516(%rip), %rcx   # 0x1458fdc36
1400d7720:     	movl	$0x8, %edx
1400d7725:     	movq	%r13, %r8
1400d7728:     	callq	0x142aed730 <.text+0x2aec730>
1400d772d:     	nop
1400d772e:     	testq	%rax, %rax
1400d7731:     	jne	0x1400d773a <.text+0xd673a>
1400d7733:     	movq	0x78e507e(%rip), %rax   # 0x1479bc7b8
1400d773a:     	cmpb	$0x2, (%rax)
1400d773d:     	jne	0x1400d774a <.text+0xd674a>
1400d773f:     	cmpq	$0x0, 0x8(%rax)
1400d7744:     	je	0x1400d7ff2 <.text+0xd6ff2>
1400d774a:     	xorl	%eax, %eax
1400d774c:     	movq	%rax, 0x410(%rbp)
1400d7753:     	movl	$0x1, %eax
1400d7758:     	movq	%rax, 0x408(%rbp)
1400d775f:     	testq	%r14, %r14
1400d7762:     	jne	0x1400d7774 <.text+0xd6774>
1400d7764:     	jmp	0x1400d77d1 <.text+0xd67d1>
1400d7766:     	xorl	%eax, %eax
1400d7768:     	movq	%rax, 0x408(%rbp)
1400d776f:     	testq	%r14, %r14
1400d7772:     	je	0x1400d77d1 <.text+0xd67d1>
1400d7774:     	movq	0x488(%rbp), %rdi
1400d777b:     	shlq	$0x5, %r14
1400d777f:     	addq	%rdi, %r14
1400d7782:     	leaq	0x58264a7(%rip), %rbx   # 0x1458fdc30
1400d7789:     	movq	0x78e5028(%rip), %rsi   # 0x1479bc7b8
1400d7790:     	jmp	0x1400d77a9 <.text+0xd67a9>
1400d7792:     	nopw	%cs:(%rax,%rax)
1400d77a0:     	addq	$0x20, %rdi
1400d77a4:     	cmpq	%r14, %rdi
1400d77a7:     	je	0x1400d77d1 <.text+0xd67d1>
1400d77a9:     	movl	$0x6, %edx
1400d77ae:     	movq	%rbx, %rcx
1400d77b1:     	movq	%rdi, %r8
1400d77b4:     	callq	0x142aed730 <.text+0x2aec730>
1400d77b9:     	nop
1400d77ba:     	testq	%rax, %rax
1400d77bd:     	jne	0x1400d77c2 <.text+0xd67c2>
1400d77bf:     	movq	%rsi, %rax
1400d77c2:     	cmpb	$0x1, (%rax)
1400d77c5:     	jne	0x1400d77a0 <.text+0xd67a0>
1400d77c7:     	cmpb	$0x0, 0x1(%rax)
1400d77cb:     	je	0x1400d77a0 <.text+0xd67a0>
1400d77cd:     	movb	$0x1, %al
1400d77cf:     	jmp	0x1400d77d3 <.text+0xd67d3>
1400d77d1:     	xorl	%eax, %eax
1400d77d3:     	movb	%al, 0x4b7(%rbp)
1400d77d9:     	movl	0x4c8(%rbp), %eax
1400d77df:     	movq	0x4c0(%rbp), %rcx
1400d77e6:     	movl	%eax, (%rcx)
1400d77e8:     	movss	%xmm6, 0x44(%r12)
1400d77ef:     	movq	0x4a0(%rbp), %rax
1400d77f6:     	cmpq	$0x8, %rax
1400d77fa:     	je	0x1400d7837 <.text+0xd6837>
1400d77fc:     	cmpq	$0x5, %rax
1400d7800:     	jne	0x1400d7870 <.text+0xd6870>
1400d7802:     	movl	$0x68636163, %eax       # imm = 0x68636163
1400d7807:     	xorl	(%r15), %eax
1400d780a:     	movzbl	0x4(%r15), %ecx
1400d780f:     	xorl	$0x65, %ecx
1400d7812:     	orl	%eax, %ecx
1400d7814:     	je	0x1400d78a8 <.text+0xd68a8>
1400d781a:     	movups	0x58267bf(%rip), %xmm0  # 0x1458fdfe0
1400d7821:     	movaps	%xmm0, 0x460(%rbp)
1400d7828:     	movl	$0x3f800000, 0x470(%rbp) # imm = 0x3F800000
1400d7832:     	jmp	0x1400d78c0 <.text+0xd68c0>
1400d7837:     	movabsq	$0x6e61696472617567, %rax # imm = 0x6E61696472617567
1400d7841:     	cmpq	%rax, (%r15)
1400d7844:     	je	0x1400d790f <.text+0xd690f>
1400d784a:     	movups	0x582678f(%rip), %xmm0  # 0x1458fdfe0
1400d7851:     	movaps	%xmm0, 0x460(%rbp)
1400d7858:     	movl	$0x3f800000, 0x470(%rbp) # imm = 0x3F800000
1400d7862:     	cmpq	%rax, (%r15)
1400d7865:     	jne	0x1400d7930 <.text+0xd6930>
1400d786b:     	jmp	0x1400d7f36 <.text+0xd6f36>
1400d7870:     	movups	0x5826769(%rip), %xmm0  # 0x1458fdfe0
1400d7877:     	movaps	%xmm0, 0x460(%rbp)
1400d787e:     	movl	$0x3f800000, 0x470(%rbp) # imm = 0x3F800000
1400d7888:     	jmp	0x1400d7930 <.text+0xd6930>
1400d788d:     	movq	0x10(%rax), %rax
1400d7891:     	jmp	0x1400d75f9 <.text+0xd65f9>
1400d7896:     	movq	0x10(%rax), %rax
1400d789a:     	jmp	0x1400d7692 <.text+0xd6692>
1400d789f:     	movq	0x10(%rax), %rax
1400d78a3:     	jmp	0x1400d76d9 <.text+0xd66d9>
1400d78a8:     	movaps	0x58254f1(%rip), %xmm0  # 0x1458fcda0
1400d78af:     	movups	%xmm0, 0x464(%rbp)
1400d78b6:     	movl	$0x0, 0x460(%rbp)
1400d78c0:     	movl	$0x68636163, %eax       # imm = 0x68636163
1400d78c5:     	xorl	(%r15), %eax
1400d78c8:     	movzbl	0x4(%r15), %ecx
1400d78cd:     	xorl	$0x65, %ecx
1400d78d0:     	orl	%eax, %ecx
1400d78d2:     	jne	0x1400d7930 <.text+0xd6930>
1400d78d4:     	leaq	0x5826a52(%rip), %rcx   # 0x1458fe32d
1400d78db:     	movl	$0x12, %edx
1400d78e0:     	callq	0x145452350 <.text+0x5451350>
1400d78e5:     	movq	%rdx, 0x4c0(%rbp)
1400d78ec:     	movq	0x4c0(%rbp), %rbx
1400d78f3:     	testq	%rbx, %rbx
1400d78f6:     	jns	0x1400d7f6d <.text+0xd6f6d>
1400d78fc:     	xorl	%edi, %edi
1400d78fe:     	movq	%rdi, %rcx
1400d7901:     	movq	%rbx, %rdx
1400d7904:     	callq	0x1458e721b <.text+0x58e621b>
1400d7909:     	nop
1400d790a:     	jmp	0x1400d816e <.text+0xd716e>
1400d790f:     	movaps	0x582547a(%rip), %xmm0  # 0x1458fcd90
1400d7916:     	movups	%xmm0, 0x464(%rbp)
1400d791d:     	movl	$0x0, 0x460(%rbp)
1400d7927:     	cmpq	%rax, (%r15)
1400d792a:     	je	0x1400d7f36 <.text+0xd6f36>
1400d7930:     	leaq	0x582696f(%rip), %rcx   # 0x1458fe2a6
1400d7937:     	movl	$0x9, %edx
1400d793c:     	callq	0x145452350 <.text+0x5451350>
1400d7941:     	nop
1400d7942:     	movq	%rax, %rdi
1400d7945:     	movq	%rdx, %rbx
1400d7948:     	leaq	0x5826960(%rip), %rcx   # 0x1458fe2af
1400d794f:     	movl	$0x5, %edx
1400d7954:     	movq	%r13, %r8
1400d7957:     	callq	0x142aed730 <.text+0x2aec730>
1400d795c:     	nop
1400d795d:     	testq	%rax, %rax
1400d7960:     	jne	0x1400d7969 <.text+0xd6969>
1400d7962:     	movq	0x78e4e4f(%rip), %rax   # 0x1479bc7b8
1400d7969:     	movl	$0x1, %ecx
1400d796e:     	cmpb	$0x2, (%rax)
1400d7971:     	jne	0x1400d797e <.text+0xd697e>
1400d7973:     	cmpq	$0x0, 0x8(%rax)
1400d7978:     	jne	0x1400d797e <.text+0xd697e>
1400d797a:     	movq	0x10(%rax), %rcx
1400d797e:     	movq	%rcx, 0x438(%rbp)
1400d7985:     	leaq	0x582663c(%rip), %rax   # 0x1458fdfc8
1400d798c:     	movq	%rax, 0x150(%rbp)
1400d7993:     	movq	$0x1, 0x158(%rbp)
1400d799e:     	leaq	0x438(%rbp), %rax
1400d79a5:     	movq	%rax, 0x160(%rbp)
1400d79ac:     	leaq	0x58265f5(%rip), %rax   # 0x1458fdfa8
1400d79b3:     	movq	%rax, 0x168(%rbp)
1400d79ba:     	movq	$0x1, 0x20(%rsp)
1400d79c3:     	leaq	-0x30(%rbp), %rcx
1400d79c7:     	leaq	0x150(%rbp), %r9
1400d79ce:     	movq	%rdi, %rdx
1400d79d1:     	movq	%rbx, %r8
1400d79d4:     	callq	0x145452790 <.text+0x5451790>
1400d79d9:     	nop
1400d79da:     	leaq	0x58268d3(%rip), %rcx   # 0x1458fe2b4
1400d79e1:     	movl	$0x9, %edx
1400d79e6:     	callq	0x145452350 <.text+0x5451350>
1400d79eb:     	nop
1400d79ec:     	movq	%rdx, %rbx
1400d79ef:     	testq	%rdx, %rdx
1400d79f2:     	jns	0x1400d7a07 <.text+0xd6a07>
1400d79f4:     	xorl	%edi, %edi
1400d79f6:     	movq	%rdi, %rcx
1400d79f9:     	movq	%rbx, %rdx
1400d79fc:     	callq	0x1458e721b <.text+0x58e621b>
1400d7a01:     	nop
1400d7a02:     	jmp	0x1400d816e <.text+0xd716e>
1400d7a07:     	testq	%rbx, %rbx
1400d7a0a:     	movq	%rbx, 0x4c8(%rbp)
1400d7a11:     	je	0x1400d7a49 <.text+0xd6a49>
1400d7a13:     	movq	%rax, %rsi
1400d7a16:     	callq	0x140002200 <.text+0x1200>
1400d7a1b:     	movl	$0x1, %edi
1400d7a20:     	movl	$0x1, %edx
1400d7a25:     	movq	%rbx, %rcx
1400d7a28:     	callq	0x1400021c0 <.text+0x11c0>
1400d7a2d:     	testq	%rax, %rax
1400d7a30:     	je	0x1400d79f6 <.text+0xd69f6>
1400d7a32:     	movq	%rax, 0x4b8(%rbp)
1400d7a39:     	movq	%rax, %rcx
1400d7a3c:     	movq	%rsi, %rdx
1400d7a3f:     	movq	%rbx, %r8
1400d7a42:     	callq	0x145756ddd <.text+0x5755ddd>
1400d7a47:     	jmp	0x1400d7a55 <.text+0xd6a55>
1400d7a49:     	movl	$0x1, %eax
1400d7a4e:     	movq	%rax, 0x4b8(%rbp)
1400d7a55:     	leaq	0x5826861(%rip), %rcx   # 0x1458fe2bd
1400d7a5c:     	movl	$0x34, %edx
1400d7a61:     	callq	0x145452350 <.text+0x5451350>
1400d7a66:     	nop
1400d7a67:     	movq	-0x30(%rbp), %r8
1400d7a6b:     	movq	-0x28(%rbp), %r9
1400d7a6f:     	movq	-0x20(%rbp), %rcx
1400d7a73:     	movq	%r8, 0x438(%rbp)
1400d7a7a:     	movq	%r9, 0x440(%rbp)
1400d7a81:     	movq	%rcx, 0x448(%rbp)
1400d7a88:     	movq	%rax, 0x3f8(%rbp)
1400d7a8f:     	movq	%rdx, 0x400(%rbp)
1400d7a96:     	movw	$0x0, 0x134(%rbp)
1400d7a9f:     	movb	$0x1, 0x124(%rbp)
1400d7aa6:     	xorps	%xmm0, %xmm0
1400d7aa9:     	movups	%xmm0, 0x38(%rbp)
1400d7aad:     	movups	%xmm0, 0x48(%rbp)
1400d7ab1:     	movaps	0x581e9a8(%rip), %xmm1  # 0x1458f6460
1400d7ab8:     	movups	%xmm1, 0x58(%rbp)
1400d7abc:     	movq	$0x0, 0x30(%rbp)
1400d7ac4:     	movups	%xmm0, 0x68(%rbp)
1400d7ac8:     	movups	%xmm0, 0x78(%rbp)
1400d7acc:     	movl	$0x0, 0x148(%rbp)
1400d7ad6:     	movw	$0x0, 0x14c(%rbp)
1400d7adf:     	movups	0x5826082(%rip), %xmm0  # 0x1458fdb68
1400d7ae6:     	movups	%xmm0, 0x88(%rbp)
1400d7aed:     	movups	0x5826084(%rip), %xmm0  # 0x1458fdb78
1400d7af4:     	movups	%xmm0, 0x98(%rbp)
1400d7afb:     	movups	0x5826086(%rip), %xmm0  # 0x1458fdb88
1400d7b02:     	movups	%xmm0, 0xa8(%rbp)
1400d7b09:     	movups	0x5826088(%rip), %xmm0  # 0x1458fdb98
1400d7b10:     	movups	%xmm0, 0xb8(%rbp)
1400d7b17:     	movups	0x582609a(%rip), %xmm0  # 0x1458fdbb8
1400d7b1e:     	movups	%xmm0, 0xd8(%rbp)
1400d7b25:     	movups	0x582607c(%rip), %xmm0  # 0x1458fdba8
1400d7b2c:     	movups	%xmm0, 0xc8(%rbp)
1400d7b33:     	movups	0x582609e(%rip), %xmm0  # 0x1458fdbd8
1400d7b3a:     	movups	%xmm0, 0xf8(%rbp)
1400d7b41:     	movups	0x5826080(%rip), %xmm0  # 0x1458fdbc8
1400d7b48:     	movups	%xmm0, 0xe8(%rbp)
1400d7b4f:     	movb	$0x0, 0x146(%rbp)
1400d7b56:     	movl	$0x100, 0x142(%rbp)     # imm = 0x100
1400d7b60:     	movq	$0x0, 0x128(%rbp)
1400d7b6b:     	movl	$0x3f800000, 0x130(%rbp) # imm = 0x3F800000
1400d7b75:     	movaps	0x5813934(%rip), %xmm0  # 0x1458eb4b0
1400d7b7c:     	movups	%xmm0, 0x108(%rbp)
1400d7b83:     	movl	$0x1, 0x118(%rbp)
1400d7b8d:     	movq	$0x0, 0x11c(%rbp)
1400d7b98:     	movb	$0x0, 0x147(%rbp)
1400d7b9f:     	movups	0x5825f0a(%rip), %xmm0  # 0x1458fdab0
1400d7ba6:     	movaps	%xmm0, -0x30(%rbp)
1400d7baa:     	movq	$0x0, -0x20(%rbp)
1400d7bb2:     	movups	0x5825f0f(%rip), %xmm0  # 0x1458fdac8
1400d7bb9:     	movups	%xmm0, -0x18(%rbp)
1400d7bbd:     	movq	$0x0, -0x8(%rbp)
1400d7bc5:     	movups	0x5825f14(%rip), %xmm0  # 0x1458fdae0
1400d7bcc:     	movaps	%xmm0, (%rbp)
1400d7bd0:     	movq	$0x0, 0x10(%rbp)
1400d7bd8:     	movups	0x5825f19(%rip), %xmm0  # 0x1458fdaf8
1400d7bdf:     	movups	%xmm0, 0x18(%rbp)
1400d7be3:     	movq	$0x0, 0x28(%rbp)
1400d7beb:     	movw	$0x0, 0x13a(%rbp)
1400d7bf4:     	movl	$0x10000, 0x136(%rbp)   # imm = 0x10000
1400d7bfe:     	movw	$0x0, 0x140(%rbp)
1400d7c07:     	movl	$0x10000, 0x13c(%rbp)   # imm = 0x10000
1400d7c11:     	callq	0x140002200 <.text+0x1200>
1400d7c16:     	movl	$0x40, %ecx
1400d7c1b:     	movl	$0x4, %edx
1400d7c20:     	callq	0x1400021c0 <.text+0x11c0>
1400d7c25:     	movq	%rax, 0x4c0(%rbp)
1400d7c2c:     	testq	%rax, %rax
1400d7c2f:     	je	0x1400d814c <.text+0xd714c>
1400d7c35:     	movaps	0x5825174(%rip), %xmm0  # 0x1458fcdb0
1400d7c3c:     	movups	%xmm0, 0x154(%rbp)
1400d7c43:     	movl	$0x0, 0x150(%rbp)
1400d7c4d:     	leaq	0x420(%rbp), %rcx
1400d7c54:     	leaq	0x150(%rbp), %rdx
1400d7c5b:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400d7c60:     	nop
1400d7c61:     	movaps	0x420(%rbp), %xmm6
1400d7c68:     	movaps	0x5825151(%rip), %xmm0  # 0x1458fcdc0
1400d7c6f:     	movups	%xmm0, 0x154(%rbp)
1400d7c76:     	movl	$0x0, 0x150(%rbp)
1400d7c80:     	leaq	0x420(%rbp), %rcx
1400d7c87:     	leaq	0x150(%rbp), %rdx
1400d7c8e:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400d7c93:     	nop
1400d7c94:     	movaps	0x420(%rbp), %xmm0
1400d7c9b:     	movq	0x4c0(%rbp), %rdi
1400d7ca2:     	movq	$0x2, (%rdi)
1400d7ca9:     	movl	$0x1, 0x8(%rdi)
1400d7cb0:     	movups	%xmm6, 0xc(%rdi)
1400d7cb4:     	movaps	0x5825115(%rip), %xmm1  # 0x1458fcdd0
1400d7cbb:     	movups	%xmm1, 0x1c(%rdi)
1400d7cbf:     	movups	%xmm0, 0x2c(%rdi)
1400d7cc3:     	movl	$0x3f000000, 0x3c(%rdi) # imm = 0x3F000000
1400d7cca:     	callq	0x140002200 <.text+0x1200>
1400d7ccf:     	movl	$0x48, %ecx
1400d7cd4:     	movl	$0x8, %edx
1400d7cd9:     	callq	0x1400021c0 <.text+0x11c0>
1400d7cde:     	testq	%rax, %rax
1400d7ce1:     	je	0x1400d815e <.text+0xd715e>
1400d7ce7:     	movq	%rax, %rsi
1400d7cea:     	movq	$0x2, (%rax)
1400d7cf1:     	movq	%rdi, 0x8(%rax)
1400d7cf5:     	movq	$0x2, 0x10(%rax)
1400d7cfd:     	movq	$0x1, 0x18(%rax)
1400d7d05:     	movl	$0x2, 0x20(%rax)
1400d7d0c:     	movss	0x58250cc(%rip), %xmm0  # 0x1458fcde0
1400d7d14:     	movlps	%xmm0, 0x24(%rax)
1400d7d18:     	movabsq	$0xa00000000, %rax      # imm = 0xA00000000
1400d7d22:     	movq	%rax, 0x2c(%rsi)
1400d7d26:     	movb	$0x0, 0x40(%rsi)
1400d7d2a:     	leaq	0x150(%rbp), %rdi
1400d7d31:     	leaq	-0x30(%rbp), %rdx
1400d7d35:     	movl	$0x180, %r8d            # imm = 0x180
1400d7d3b:     	movq	%rdi, %rcx
1400d7d3e:     	callq	0x145756ddd <.text+0x5755ddd>
1400d7d43:     	movq	$0x1, 0x2d0(%rbp)
1400d7d4e:     	movq	%rsi, 0x2d8(%rbp)
1400d7d55:     	movq	$0x1, 0x2e0(%rbp)
1400d7d60:     	movl	$0x1770, 0x2e8(%rbp)    # imm = 0x1770
1400d7d6a:     	movw	$0x2, 0x2ec(%rbp)
1400d7d73:     	movb	$0x0, 0x4d7(%rbp)
1400d7d7a:     	leaq	0x58265ef(%rip), %r9    # 0x1458fe370
1400d7d81:     	leaq	-0x30(%rbp), %rcx
1400d7d85:     	leaq	0x2f0(%rbp), %rdx
1400d7d8c:     	movq	%rdi, %r8
1400d7d8f:     	callq	0x1401f9d70 <.text+0x1f8d70>
1400d7d94:     	nop
1400d7d95:     	leaq	0x318(%rbp), %rax
1400d7d9c:     	leaq	0x338(%rbp), %rcx
1400d7da3:     	leaq	0x370(%rbp), %rdx
1400d7daa:     	leaq	0x390(%rbp), %r8
1400d7db1:     	movq	%r8, 0x168(%rbp)
1400d7db8:     	leaq	0x460(%rbp), %r8
1400d7dbf:     	movq	%r8, 0x170(%rbp)
1400d7dc6:     	leaq	0x438(%rbp), %r8
1400d7dcd:     	movq	%r8, 0x178(%rbp)
1400d7dd4:     	leaq	-0x50(%rbp), %r8
1400d7dd8:     	movq	%r8, 0x180(%rbp)
1400d7ddf:     	movq	0x4c8(%rbp), %r8
1400d7de6:     	movq	%r8, 0x150(%rbp)
1400d7ded:     	movq	0x4b8(%rbp), %r9
1400d7df4:     	movq	%r9, 0x158(%rbp)
1400d7dfb:     	movq	%r8, 0x160(%rbp)
1400d7e02:     	leaq	0x3f8(%rbp), %r8
1400d7e09:     	movq	%r8, 0x188(%rbp)
1400d7e10:     	leaq	0x480(%rbp), %r8
1400d7e17:     	movq	%r8, 0x190(%rbp)
1400d7e1e:     	movq	%rdx, 0x198(%rbp)
1400d7e25:     	movq	%rax, 0x1a0(%rbp)
1400d7e2c:     	leaq	0x4b7(%rbp), %rax
1400d7e33:     	movq	%rax, 0x1a8(%rbp)
1400d7e3a:     	movq	%rcx, 0x1b0(%rbp)
1400d7e41:     	movq	%r15, 0x1b8(%rbp)
1400d7e48:     	movq	0x4a0(%rbp), %rax
1400d7e4f:     	movq	%rax, 0x1c0(%rbp)
1400d7e56:     	leaq	0x408(%rbp), %rax
1400d7e5d:     	movq	%rax, 0x1c8(%rbp)
1400d7e64:     	movb	$0x1, 0x4d7(%rbp)
1400d7e6b:     	leaq	-0x30(%rbp), %rcx
1400d7e6f:     	leaq	0x150(%rbp), %rdx
1400d7e76:     	callq	0x140217370 <.text+0x216370>
1400d7e7b:     	nop
1400d7e7c:     	movq	0x438(%rbp), %rdx
1400d7e83:     	testq	%rdx, %rdx
1400d7e86:     	je	0x1400d7e9a <.text+0xd6e9a>
1400d7e88:     	movq	0x440(%rbp), %rcx
1400d7e8f:     	movl	$0x1, %r8d
1400d7e95:     	callq	0x1400021d0 <.text+0x11d0>
1400d7e9a:     	movq	0x488(%rbp), %rcx
1400d7ea1:     	movq	0x490(%rbp), %rax
1400d7ea8:     	movq	%rax, 0x4c0(%rbp)
1400d7eaf:     	movq	$0x0, 0x4c8(%rbp)
1400d7eba:     	movq	%rcx, 0x4a0(%rbp)
1400d7ec1:     	nopw	%cs:(%rax,%rax)
1400d7ed0:     	movq	0x4c8(%rbp), %rax
1400d7ed7:     	cmpq	%rax, 0x4c0(%rbp)
1400d7ede:     	je	0x1400d7ef9 <.text+0xd6ef9>
1400d7ee0:     	incq	%rax
1400d7ee3:     	movq	%rax, 0x4c8(%rbp)
1400d7eea:     	leaq	0x20(%rcx), %rsi
1400d7eee:     	callq	0x1400f06b0 <.text+0xef6b0>
1400d7ef3:     	nop
1400d7ef4:     	movq	%rsi, %rcx
1400d7ef7:     	jmp	0x1400d7ed0 <.text+0xd6ed0>
1400d7ef9:     	movq	0x480(%rbp), %rdx
1400d7f00:     	testq	%rdx, %rdx
1400d7f03:     	je	0x1400d7f1b <.text+0xd6f1b>
1400d7f05:     	movq	0x488(%rbp), %rcx
1400d7f0c:     	shlq	$0x5, %rdx
1400d7f10:     	movl	$0x8, %r8d
1400d7f16:     	callq	0x1400021d0 <.text+0x11d0>
1400d7f1b:     	movaps	0x4e0(%rbp), %xmm6
1400d7f22:     	addq	$0x578, %rsp            # imm = 0x578
1400d7f29:     	popq	%rbx
1400d7f2a:     	popq	%rdi
1400d7f2b:     	popq	%rsi
1400d7f2c:     	popq	%r12
1400d7f2e:     	popq	%r13
1400d7f30:     	popq	%r14
1400d7f32:     	popq	%r15
1400d7f34:     	popq	%rbp
1400d7f35:     	retq
1400d7f36:     	leaq	0x58263b4(%rip), %rcx   # 0x1458fe2f1
1400d7f3d:     	movl	$0xe, %edx
1400d7f42:     	callq	0x145452350 <.text+0x5451350>
1400d7f47:     	movq	%rdx, 0x4c0(%rbp)
1400d7f4e:     	movq	0x4c0(%rbp), %rbx
1400d7f55:     	testq	%rbx, %rbx
1400d7f58:     	jns	0x1400d7fb0 <.text+0xd6fb0>
1400d7f5a:     	xorl	%edi, %edi
1400d7f5c:     	movq	%rdi, %rcx
1400d7f5f:     	movq	%rbx, %rdx
1400d7f62:     	callq	0x1458e721b <.text+0x58e621b>
1400d7f67:     	nop
1400d7f68:     	jmp	0x1400d816e <.text+0xd716e>
1400d7f6d:     	testq	%rbx, %rbx
1400d7f70:     	je	0x1400d7ffb <.text+0xd6ffb>
1400d7f76:     	movq	%rax, %rsi
1400d7f79:     	callq	0x140002200 <.text+0x1200>
1400d7f7e:     	movl	$0x1, %edi
1400d7f83:     	movl	$0x1, %edx
1400d7f88:     	movq	%rbx, %rcx
1400d7f8b:     	callq	0x1400021c0 <.text+0x11c0>
1400d7f90:     	testq	%rax, %rax
1400d7f93:     	je	0x1400d78fe <.text+0xd68fe>
1400d7f99:     	movq	%rax, 0x4a8(%rbp)
1400d7fa0:     	movq	%rax, %rcx
1400d7fa3:     	movq	%rsi, %rdx
1400d7fa6:     	movq	%rbx, %r8
1400d7fa9:     	callq	0x145756ddd <.text+0x5755ddd>
1400d7fae:     	jmp	0x1400d8007 <.text+0xd7007>
1400d7fb0:     	testq	%rbx, %rbx
1400d7fb3:     	je	0x1400d807d <.text+0xd707d>
1400d7fb9:     	movq	%rax, %rsi
1400d7fbc:     	callq	0x140002200 <.text+0x1200>
1400d7fc1:     	movl	$0x1, %edi
1400d7fc6:     	movl	$0x1, %edx
1400d7fcb:     	movq	%rbx, %rcx
1400d7fce:     	callq	0x1400021c0 <.text+0x11c0>
1400d7fd3:     	testq	%rax, %rax
1400d7fd6:     	je	0x1400d7f5c <.text+0xd6f5c>
1400d7fd8:     	movq	%rax, 0x4a8(%rbp)
1400d7fdf:     	movq	%rax, %rcx
1400d7fe2:     	movq	%rsi, %rdx
1400d7fe5:     	movq	%rbx, %r8
1400d7fe8:     	callq	0x145756ddd <.text+0x5755ddd>
1400d7fed:     	jmp	0x1400d8089 <.text+0xd7089>
1400d7ff2:     	movq	0x10(%rax), %rax
1400d7ff6:     	jmp	0x1400d774c <.text+0xd674c>
1400d7ffb:     	movl	$0x1, %eax
1400d8000:     	movq	%rax, 0x4a8(%rbp)
1400d8007:     	leaq	0x5826331(%rip), %rcx   # 0x1458fe33f
1400d800e:     	movl	$0x9, %edx
1400d8013:     	callq	0x145452350 <.text+0x5451350>
1400d8018:     	nop
1400d8019:     	movq	%rdx, %rbx
1400d801c:     	testq	%rdx, %rdx
1400d801f:     	jns	0x1400d8034 <.text+0xd7034>
1400d8021:     	xorl	%edi, %edi
1400d8023:     	movq	%rdi, %rcx
1400d8026:     	movq	%rbx, %rdx
1400d8029:     	callq	0x1458e721b <.text+0x58e621b>
1400d802e:     	nop
1400d802f:     	jmp	0x1400d816e <.text+0xd716e>
1400d8034:     	testq	%rbx, %rbx
1400d8037:     	movq	%rbx, 0x4c8(%rbp)
1400d803e:     	je	0x1400d80f8 <.text+0xd70f8>
1400d8044:     	movq	%rax, %rsi
1400d8047:     	callq	0x140002200 <.text+0x1200>
1400d804c:     	movl	$0x1, %edi
1400d8051:     	movl	$0x1, %edx
1400d8056:     	movq	%rbx, %rcx
1400d8059:     	callq	0x1400021c0 <.text+0x11c0>
1400d805e:     	testq	%rax, %rax
1400d8061:     	je	0x1400d8023 <.text+0xd7023>
1400d8063:     	movq	%rax, 0x4b8(%rbp)
1400d806a:     	movq	%rax, %rcx
1400d806d:     	movq	%rsi, %rdx
1400d8070:     	movq	%rbx, %r8
1400d8073:     	callq	0x145756ddd <.text+0x5755ddd>
1400d8078:     	jmp	0x1400d8104 <.text+0xd7104>
1400d807d:     	movl	$0x1, %eax
1400d8082:     	movq	%rax, 0x4a8(%rbp)
1400d8089:     	leaq	0x582626f(%rip), %rcx   # 0x1458fe2ff
1400d8090:     	movl	$0xa, %edx
1400d8095:     	callq	0x145452350 <.text+0x5451350>
1400d809a:     	nop
1400d809b:     	movq	%rdx, %rbx
1400d809e:     	testq	%rdx, %rdx
1400d80a1:     	jns	0x1400d80b6 <.text+0xd70b6>
1400d80a3:     	xorl	%edi, %edi
1400d80a5:     	movq	%rdi, %rcx
1400d80a8:     	movq	%rbx, %rdx
1400d80ab:     	callq	0x1458e721b <.text+0x58e621b>
1400d80b0:     	nop
1400d80b1:     	jmp	0x1400d816e <.text+0xd716e>
1400d80b6:     	testq	%rbx, %rbx
1400d80b9:     	movq	%rbx, 0x4c8(%rbp)
1400d80c0:     	je	0x1400d8118 <.text+0xd7118>
1400d80c2:     	movq	%rax, %rsi
1400d80c5:     	callq	0x140002200 <.text+0x1200>
1400d80ca:     	movl	$0x1, %edi
1400d80cf:     	movl	$0x1, %edx
1400d80d4:     	movq	%rbx, %rcx
1400d80d7:     	callq	0x1400021c0 <.text+0x11c0>
1400d80dc:     	testq	%rax, %rax
1400d80df:     	je	0x1400d80a5 <.text+0xd70a5>
1400d80e1:     	movq	%rax, 0x4b8(%rbp)
1400d80e8:     	movq	%rax, %rcx
1400d80eb:     	movq	%rsi, %rdx
1400d80ee:     	movq	%rbx, %r8
1400d80f1:     	callq	0x145756ddd <.text+0x5755ddd>
1400d80f6:     	jmp	0x1400d8124 <.text+0xd7124>
1400d80f8:     	movl	$0x1, %eax
1400d80fd:     	movq	%rax, 0x4b8(%rbp)
1400d8104:     	leaq	0x582623d(%rip), %rcx   # 0x1458fe348
1400d810b:     	movl	$0x26, %edx
1400d8110:     	callq	0x145452350 <.text+0x5451350>
1400d8115:     	nop
1400d8116:     	jmp	0x1400d8136 <.text+0xd7136>
1400d8118:     	movl	$0x1, %eax
1400d811d:     	movq	%rax, 0x4b8(%rbp)
1400d8124:     	leaq	0x58261de(%rip), %rcx   # 0x1458fe309
1400d812b:     	movl	$0x24, %edx
1400d8130:     	callq	0x145452350 <.text+0x5451350>
1400d8135:     	nop
1400d8136:     	movq	0x4c0(%rbp), %r8
1400d813d:     	movq	%r8, %rcx
1400d8140:     	movq	0x4a8(%rbp), %r9
1400d8147:     	jmp	0x1400d7a73 <.text+0xd6a73>
1400d814c:     	movl	$0x4, %ecx
1400d8151:     	movl	$0x40, %edx
1400d8156:     	callq	0x1458e7201 <.text+0x58e6201>
1400d815b:     	nop
1400d815c:     	jmp	0x1400d816e <.text+0xd716e>
1400d815e:     	movl	$0x8, %ecx
1400d8163:     	movl	$0x48, %edx
1400d8168:     	callq	0x1458e7201 <.text+0x58e6201>
1400d816d:     	nop
1400d816e:     	ud2


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145424080:     	pushq	%rbp
145424081:     	pushq	%r15
145424083:     	pushq	%r14
145424085:     	pushq	%r13
145424087:     	pushq	%r12
145424089:     	pushq	%rsi
14542408a:     	pushq	%rdi
14542408b:     	pushq	%rbx
14542408c:     	subq	$0x198, %rsp            # imm = 0x198
145424093:     	leaq	0x80(%rsp), %rbp
14542409b:     	movq	$-0x2, 0x110(%rbp)
1454240a6:     	movq	%rcx, -0x58(%rbp)
1454240aa:     	movq	$0x0, 0xe8(%rbp)
1454240b5:     	movq	$0x1, 0xf0(%rbp)
1454240c0:     	movq	$0x0, 0xf8(%rbp)
1454240cb:     	movq	0x8(%rdx), %rsi
1454240cf:     	movq	%rdx, 0xa8(%rbp)
1454240d6:     	imulq	$0x38, 0x10(%rdx), %rbx
1454240db:     	addq	%rsi, %rbx
1454240de:     	leaq	-0x10(%rbp), %r15
1454240e2:     	leaq	0x12fc9fa(%rip), %r12   # 0x146720ae3
1454240e9:     	jmp	0x1454240f3 <.text+0x54230f3>
1454240eb:     	nopl	(%rax,%rax)
1454240f0:     	movq	%r13, %rsi
1454240f3:     	cmpq	%rbx, %rsi
1454240f6:     	je	0x145424346 <.text+0x5423346>
1454240fc:     	leaq	0x38(%rsi), %r13
145424100:     	leaq	0x33(%rsi), %rdx
145424104:     	leaq	0x90(%rbp), %rcx
14542410b:     	movq	%r13, %r8
14542410e:     	callq	0x145535220 <.text+0x5534220>
145424113:     	nop
145424114:     	movq	0x98(%rbp), %rdi
14542411b:     	movq	0xa0(%rbp), %r14
145424122:     	movq	$0x1, 0x20(%rsp)
14542412b:     	movq	%r15, %rcx
14542412e:     	movq	%rdi, %rdx
145424131:     	movq	%r14, %r8
145424134:     	leaq	0x12fc6f9(%rip), %r9    # 0x146720834
14542413b:     	callq	0x145455eb0 <.text+0x5454eb0>
145424140:     	nop
145424141:     	leaq	0x32(%rsi), %rax
145424145:     	leaq	0x31(%rsi), %rcx
145424149:     	leaq	0x30(%rsi), %rdx
14542414d:     	leaq	0x18(%rsi), %r8
145424151:     	movq	(%rbp), %r9
145424155:     	movq	%r9, 0xe0(%rbp)
14542415c:     	movdqu	-0x10(%rbp), %xmm0
145424161:     	movdqa	%xmm0, 0xd0(%rbp)
145424169:     	leaq	0x20(%rsi), %r9
14542416d:     	leaq	0x24(%rsi), %r10
145424171:     	leaq	0x28(%rsi), %r11
145424175:     	movq	%r8, -0x10(%rbp)
145424179:     	leaq	0x2fadb0(%rip), %r8     # 0x14571ef30 <.text+0x571df30>
145424180:     	movq	%r8, -0x8(%rbp)
145424184:     	movq	%rsi, (%rbp)
145424188:     	addq	$0x2c, %rsi
14542418c:     	leaq	-0x54220b3(%rip), %r8   # 0x1400020e0 <.text+0x10e0>
145424193:     	movq	%r8, 0x8(%rbp)
145424197:     	movq	%rdx, 0x10(%rbp)
14542419b:     	leaq	0x2f676e(%rip), %rdx    # 0x14571a910 <.text+0x5719910>
1454241a2:     	movq	%rdx, 0x18(%rbp)
1454241a6:     	movq	%rcx, 0x20(%rbp)
1454241aa:     	movq	%rdx, 0x28(%rbp)
1454241ae:     	movq	%rax, 0x30(%rbp)
1454241b2:     	movq	%rdx, 0x38(%rbp)
1454241b6:     	leaq	0xd0(%rbp), %rax
1454241bd:     	movq	%rax, 0x40(%rbp)
1454241c1:     	movq	%r8, 0x48(%rbp)
1454241c5:     	movq	%r9, 0x50(%rbp)
1454241c9:     	leaq	0x2f9e70(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454241d0:     	movq	%rax, 0x58(%rbp)
1454241d4:     	movq	%r10, 0x60(%rbp)
1454241d8:     	movq	%rax, 0x68(%rbp)
1454241dc:     	movq	%r11, 0x70(%rbp)
1454241e0:     	movq	%rax, 0x78(%rbp)
1454241e4:     	movq	%rsi, 0x80(%rbp)
1454241eb:     	movq	%rax, 0x88(%rbp)
1454241f2:     	leaq	0xb0(%rbp), %rcx
1454241f9:     	movq	%r12, %rdx
1454241fc:     	movq	%r15, %r8
1454241ff:     	callq	0x14570bf80 <.text+0x570af80>
145424204:     	nop
145424205:     	movq	0xd0(%rbp), %rdx
14542420c:     	testq	%rdx, %rdx
14542420f:     	je	0x145424223 <.text+0x5423223>
145424211:     	movq	0xd8(%rbp), %rcx
145424218:     	movl	$0x1, %r8d
14542421e:     	callq	0x1400021d0 <.text+0x11d0>
145424223:     	movq	0xb0(%rbp), %rax
14542422a:     	movq	%rax, 0x100(%rbp)
145424231:     	movq	0xb8(%rbp), %rax
145424238:     	movq	%rax, 0x108(%rbp)
14542423f:     	movq	0xc0(%rbp), %rsi
145424246:     	movq	0xe8(%rbp), %rax
14542424d:     	movq	0xf8(%rbp), %rdx
145424254:     	subq	%rdx, %rax
145424257:     	cmpq	%rax, %rsi
14542425a:     	ja	0x14542431b <.text+0x542331b>
145424260:     	testq	%rsi, %rsi
145424263:     	je	0x145424285 <.text+0x5423285>
145424265:     	addq	0xf0(%rbp), %rdx
14542426c:     	movq	%rdx, %rcx
14542426f:     	movq	0x108(%rbp), %rdx
145424276:     	movq	%rsi, %r8
145424279:     	callq	0x145756ddd <.text+0x5755ddd>
14542427e:     	movq	0xf8(%rbp), %rdx
145424285:     	addq	%rsi, %rdx
145424288:     	movq	%rdx, 0xf8(%rbp)
14542428f:     	movq	0x100(%rbp), %rdx
145424296:     	testq	%rdx, %rdx
145424299:     	je	0x1454242ad <.text+0x54232ad>
14542429b:     	movl	$0x1, %r8d
1454242a1:     	movq	0x108(%rbp), %rcx
1454242a8:     	callq	0x1400021d0 <.text+0x11d0>
1454242ad:     	testq	%r14, %r14
1454242b0:     	je	0x1454242f0 <.text+0x54232f0>
1454242b2:     	leaq	0x8(%rdi), %rsi
1454242b6:     	jmp	0x1454242c9 <.text+0x54232c9>
1454242b8:     	nopl	(%rax,%rax)
1454242c0:     	addq	$0x18, %rsi
1454242c4:     	decq	%r14
1454242c7:     	je	0x1454242f0 <.text+0x54232f0>
1454242c9:     	movq	-0x8(%rsi), %rdx
1454242cd:     	testq	%rdx, %rdx
1454242d0:     	je	0x1454242c0 <.text+0x54232c0>
1454242d2:     	movq	(%rsi), %rcx
1454242d5:     	movl	$0x1, %r8d
1454242db:     	callq	0x1400021d0 <.text+0x11d0>
1454242e0:     	jmp	0x1454242c0 <.text+0x54232c0>
1454242e2:     	nopw	%cs:(%rax,%rax)
1454242f0:     	movq	0x90(%rbp), %rax
1454242f7:     	testq	%rax, %rax
1454242fa:     	je	0x1454240f0 <.text+0x54230f0>
145424300:     	shlq	$0x3, %rax
145424304:     	leaq	(%rax,%rax,2), %rdx
145424308:     	movl	$0x8, %r8d
14542430e:     	movq	%rdi, %rcx
145424311:     	callq	0x1400021d0 <.text+0x11d0>
145424316:     	jmp	0x1454240f0 <.text+0x54230f0>
14542431b:     	movq	$0x1, 0x20(%rsp)
145424324:     	movl	$0x1, %r9d
14542432a:     	leaq	0xe8(%rbp), %rcx
145424331:     	movq	%rsi, %r8
145424334:     	callq	0x145757d40 <.text+0x5756d40>
145424339:     	nop
14542433a:     	movq	0xf8(%rbp), %rdx
145424341:     	jmp	0x145424265 <.text+0x5423265>
145424346:     	movq	0xa8(%rbp), %r14
14542434d:     	cmpq	$-0x1, 0x138(%r14)
145424355:     	je	0x145424558 <.text+0x5423558>
14542435b:     	leaq	0x173(%r14), %rdx
145424362:     	leaq	0x178(%r14), %r8
145424369:     	leaq	0x90(%rbp), %rcx
145424370:     	callq	0x145535220 <.text+0x5534220>
145424375:     	nop
145424376:     	movq	0x98(%rbp), %rsi
14542437d:     	movq	0xa0(%rbp), %rdi
145424384:     	movq	$0x1, 0x20(%rsp)
14542438d:     	leaq	0x12fc4a0(%rip), %r9    # 0x146720834
145424394:     	leaq	-0x10(%rbp), %rcx
145424398:     	movq	%rsi, %rdx
14542439b:     	movq	%rdi, %r8
14542439e:     	callq	0x145455eb0 <.text+0x5454eb0>
1454243a3:     	nop
1454243a4:     	movq	(%rbp), %rax
1454243a8:     	movq	%rax, 0xc0(%rbp)
1454243af:     	movdqu	-0x10(%rbp), %xmm0
1454243b4:     	movdqa	%xmm0, 0xb0(%rbp)
1454243bc:     	movq	0xa8(%rbp), %r14
1454243c3:     	leaq	0x168(%r14), %rdx
1454243ca:     	leaq	0xd0(%rbp), %rbx
1454243d1:     	movq	%rbx, %rcx
1454243d4:     	callq	0x1454511d0 <.text+0x54501d0>
1454243d9:     	nop
1454243da:     	leaq	0x138(%r14), %rax
1454243e1:     	leaq	0x170(%r14), %rcx
1454243e8:     	leaq	0x171(%r14), %rdx
1454243ef:     	leaq	0x172(%r14), %r8
1454243f6:     	leaq	0x150(%r14), %r9
1454243fd:     	movq	%rcx, -0x10(%rbp)
145424401:     	leaq	0x2f6508(%rip), %rcx    # 0x14571a910 <.text+0x5719910>
145424408:     	movq	%rcx, -0x8(%rbp)
14542440c:     	movq	%rdx, (%rbp)
145424410:     	movq	%rcx, 0x8(%rbp)
145424414:     	movq	%r8, 0x10(%rbp)
145424418:     	movq	%rcx, 0x18(%rbp)
14542441c:     	movq	%r9, 0x20(%rbp)
145424420:     	leaq	-0x5422347(%rip), %rcx  # 0x1400020e0 <.text+0x10e0>
145424427:     	movq	%rcx, 0x28(%rbp)
14542442b:     	movq	%rax, 0x30(%rbp)
14542442f:     	movq	%rcx, 0x38(%rbp)
145424433:     	leaq	0xb0(%rbp), %rax
14542443a:     	movq	%rax, 0x40(%rbp)
14542443e:     	movq	%rcx, 0x48(%rbp)
145424442:     	movq	%rbx, 0x50(%rbp)
145424446:     	movq	%rcx, 0x58(%rbp)
14542444a:     	leaq	0x12fc7b7(%rip), %rdx   # 0x146720c08
145424451:     	leaq	-0x30(%rbp), %rcx
145424455:     	leaq	-0x10(%rbp), %r8
145424459:     	callq	0x14570bf80 <.text+0x570af80>
14542445e:     	nop
14542445f:     	movq	0xd0(%rbp), %rdx
145424466:     	testq	%rdx, %rdx
145424469:     	je	0x14542447d <.text+0x542347d>
14542446b:     	movq	0xd8(%rbp), %rcx
145424472:     	movl	$0x1, %r8d
145424478:     	callq	0x1400021d0 <.text+0x11d0>
14542447d:     	movq	0xb0(%rbp), %rdx
145424484:     	testq	%rdx, %rdx
145424487:     	je	0x14542449b <.text+0x542349b>
145424489:     	movq	0xb8(%rbp), %rcx
145424490:     	movl	$0x1, %r8d
145424496:     	callq	0x1400021d0 <.text+0x11d0>
14542449b:     	testq	%rdi, %rdi
14542449e:     	je	0x1454244d2 <.text+0x54234d2>
1454244a0:     	leaq	0x8(%rsi), %rbx
1454244a4:     	jmp	0x1454244b9 <.text+0x54234b9>
1454244a6:     	nopw	%cs:(%rax,%rax)
1454244b0:     	addq	$0x18, %rbx
1454244b4:     	decq	%rdi
1454244b7:     	je	0x1454244d2 <.text+0x54234d2>
1454244b9:     	movq	-0x8(%rbx), %rdx
1454244bd:     	testq	%rdx, %rdx
1454244c0:     	je	0x1454244b0 <.text+0x54234b0>
1454244c2:     	movq	(%rbx), %rcx
1454244c5:     	movl	$0x1, %r8d
1454244cb:     	callq	0x1400021d0 <.text+0x11d0>
1454244d0:     	jmp	0x1454244b0 <.text+0x54234b0>
1454244d2:     	movq	0x90(%rbp), %rax
1454244d9:     	testq	%rax, %rax
1454244dc:     	je	0x1454244f4 <.text+0x54234f4>
1454244de:     	shlq	$0x3, %rax
1454244e2:     	leaq	(%rax,%rax,2), %rdx
1454244e6:     	movl	$0x8, %r8d
1454244ec:     	movq	%rsi, %rcx
1454244ef:     	callq	0x1400021d0 <.text+0x11d0>
1454244f4:     	movq	-0x28(%rbp), %rdi
1454244f8:     	movq	-0x20(%rbp), %rsi
1454244fc:     	movq	0xe8(%rbp), %rax
145424503:     	movq	0xf8(%rbp), %rdx
14542450a:     	subq	%rdx, %rax
14542450d:     	cmpq	%rax, %rsi
145424510:     	ja	0x145425fa3 <.text+0x5424fa3>
145424516:     	testq	%rsi, %rsi
145424519:     	je	0x145424537 <.text+0x5423537>
14542451b:     	addq	0xf0(%rbp), %rdx
145424522:     	movq	%rdx, %rcx
145424525:     	movq	%rdi, %rdx
145424528:     	movq	%rsi, %r8
14542452b:     	callq	0x145756ddd <.text+0x5755ddd>
145424530:     	movq	0xf8(%rbp), %rdx
145424537:     	addq	%rsi, %rdx
14542453a:     	movq	%rdx, 0xf8(%rbp)
145424541:     	movq	-0x30(%rbp), %rdx
145424545:     	testq	%rdx, %rdx
145424548:     	je	0x145424558 <.text+0x5423558>
14542454a:     	movl	$0x1, %r8d
145424550:     	movq	%rdi, %rcx
145424553:     	callq	0x1400021d0 <.text+0x11d0>
145424558:     	movq	0x20(%r14), %r15
14542455c:     	movq	0x28(%r14), %r12
145424560:     	shlq	$0x4, %r12
145424564:     	addq	%r15, %r12
145424567:     	leaq	0x12f1eca(%rip), %r13   # 0x146716438
14542456e:     	leaq	0x12fc5ab(%rip), %rsi   # 0x146720b20
145424575:     	leaq	-0x10(%rbp), %rdi
145424579:     	leaq	0xe8(%rbp), %rbx
145424580:     	jmp	0x145424594 <.text+0x5423594>
145424582:     	nopw	%cs:(%rax,%rax)
145424590:     	addq	$0x10, %r15
145424594:     	cmpq	%r12, %r15
145424597:     	je	0x1454246c5 <.text+0x54236c5>
14542459d:     	movzbl	(%r15), %eax
1454245a1:     	movb	%al, 0xb0(%rbp)
1454245a7:     	movq	0x8(%r15), %rcx
1454245ab:     	cmpq	$0xc, %rcx
1454245af:     	movl	$0xc, %eax
1454245b4:     	cmovbq	%rcx, %rax
1454245b8:     	decq	%rax
1454245bb:     	testq	%rcx, %rcx
1454245be:     	cmoveq	%rcx, %rax
1454245c2:     	cmpq	$0xc, %rax
1454245c6:     	jae	0x145426270 <.text+0x5425270>
1454245cc:     	imulq	$0xf0, %rax, %rax
1454245d3:     	addq	%r13, %rax
1454245d6:     	addq	$0x8, %rax
1454245da:     	leaq	0xb0(%rbp), %rcx
1454245e1:     	movq	%rcx, -0x10(%rbp)
1454245e5:     	leaq	0x2f6324(%rip), %rcx    # 0x14571a910 <.text+0x5719910>
1454245ec:     	movq	%rcx, -0x8(%rbp)
1454245f0:     	movq	%rax, (%rbp)
1454245f4:     	leaq	-0x542253b(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454245fb:     	movq	%rax, 0x8(%rbp)
1454245ff:     	leaq	0xd0(%rbp), %rcx
145424606:     	movq	%rsi, %rdx
145424609:     	movq	%rdi, %r8
14542460c:     	callq	0x14570bf80 <.text+0x570af80>
145424611:     	nop
145424612:     	movq	0xd0(%rbp), %rax
145424619:     	movq	%rax, 0x100(%rbp)
145424620:     	movq	0xd8(%rbp), %rax
145424627:     	movq	%rax, 0x108(%rbp)
14542462e:     	movq	0xe0(%rbp), %r14
145424635:     	movq	0xe8(%rbp), %rax
14542463c:     	movq	0xf8(%rbp), %rdx
145424643:     	subq	%rdx, %rax
145424646:     	cmpq	%rax, %r14
145424649:     	ja	0x1454246a1 <.text+0x54236a1>
14542464b:     	testq	%r14, %r14
14542464e:     	je	0x145424670 <.text+0x5423670>
145424650:     	addq	0xf0(%rbp), %rdx
145424657:     	movq	%rdx, %rcx
14542465a:     	movq	0x108(%rbp), %rdx
145424661:     	movq	%r14, %r8
145424664:     	callq	0x145756ddd <.text+0x5755ddd>
145424669:     	movq	0xf8(%rbp), %rdx
145424670:     	addq	%r14, %rdx
145424673:     	movq	%rdx, 0xf8(%rbp)
14542467a:     	movq	0x100(%rbp), %rdx
145424681:     	testq	%rdx, %rdx
145424684:     	je	0x145424590 <.text+0x5423590>
14542468a:     	movl	$0x1, %r8d
145424690:     	movq	0x108(%rbp), %rcx
145424697:     	callq	0x1400021d0 <.text+0x11d0>
14542469c:     	jmp	0x145424590 <.text+0x5423590>
1454246a1:     	movq	$0x1, 0x20(%rsp)
1454246aa:     	movl	$0x1, %r9d
1454246b0:     	movq	%rbx, %rcx
1454246b3:     	movq	%r14, %r8
1454246b6:     	callq	0x145757d40 <.text+0x5756d40>
1454246bb:     	nop
1454246bc:     	movq	0xf8(%rbp), %rdx
1454246c3:     	jmp	0x145424650 <.text+0x5423650>
1454246c5:     	movq	0xa8(%rbp), %r14
1454246cc:     	movq	0x40(%r14), %rax
1454246d0:     	testq	%rax, %rax
1454246d3:     	je	0x145424844 <.text+0x5423844>
1454246d9:     	movq	0x38(%r14), %rdx
1454246dd:     	leaq	(%rdx,%rax,4), %r8
1454246e1:     	leaq	0xb0(%rbp), %rcx
1454246e8:     	callq	0x1455353f0 <.text+0x55343f0>
1454246ed:     	nop
1454246ee:     	movq	0xb8(%rbp), %rsi
1454246f5:     	movq	0xc0(%rbp), %rdi
1454246fc:     	movq	$0x1, 0x20(%rsp)
145424705:     	leaq	0x12fc128(%rip), %r9    # 0x146720834
14542470c:     	leaq	-0x10(%rbp), %rcx
145424710:     	movq	%rsi, %rdx
145424713:     	movq	%rdi, %r8
145424716:     	callq	0x145455eb0 <.text+0x5454eb0>
14542471b:     	nop
14542471c:     	movq	(%rbp), %rax
145424720:     	movq	%rax, 0xe0(%rbp)
145424727:     	movdqu	-0x10(%rbp), %xmm0
14542472c:     	movdqa	%xmm0, 0xd0(%rbp)
145424734:     	leaq	0xd0(%rbp), %rax
14542473b:     	movq	%rax, 0x90(%rbp)
145424742:     	leaq	-0x5422669(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145424749:     	movq	%rax, 0x98(%rbp)
145424750:     	leaq	0x12fc3d6(%rip), %rdx   # 0x146720b2d
145424757:     	leaq	-0x10(%rbp), %rcx
14542475b:     	leaq	0x90(%rbp), %r8
145424762:     	callq	0x14570bf80 <.text+0x570af80>
145424767:     	nop
145424768:     	movq	0xd0(%rbp), %rdx
14542476f:     	testq	%rdx, %rdx
145424772:     	je	0x145424786 <.text+0x5423786>
145424774:     	movq	0xd8(%rbp), %rcx
14542477b:     	movl	$0x1, %r8d
145424781:     	callq	0x1400021d0 <.text+0x11d0>
145424786:     	movq	-0x10(%rbp), %r15
14542478a:     	movq	-0x8(%rbp), %r12
14542478e:     	movq	(%rbp), %rbx
145424792:     	movq	0xe8(%rbp), %rax
145424799:     	movq	0xf8(%rbp), %rdx
1454247a0:     	subq	%rdx, %rax
1454247a3:     	cmpq	%rax, %rbx
1454247a6:     	movq	0xa8(%rbp), %r14
1454247ad:     	ja	0x145425fdc <.text+0x5424fdc>
1454247b3:     	testq	%rbx, %rbx
1454247b6:     	je	0x1454247d4 <.text+0x54237d4>
1454247b8:     	addq	0xf0(%rbp), %rdx
1454247bf:     	movq	%rdx, %rcx
1454247c2:     	movq	%r12, %rdx
1454247c5:     	movq	%rbx, %r8
1454247c8:     	callq	0x145756ddd <.text+0x5755ddd>
1454247cd:     	movq	0xf8(%rbp), %rdx
1454247d4:     	addq	%rbx, %rdx
1454247d7:     	movq	%rdx, 0xf8(%rbp)
1454247de:     	testq	%r15, %r15
1454247e1:     	je	0x1454247f4 <.text+0x54237f4>
1454247e3:     	movl	$0x1, %r8d
1454247e9:     	movq	%r12, %rcx
1454247ec:     	movq	%r15, %rdx
1454247ef:     	callq	0x1400021d0 <.text+0x11d0>
1454247f4:     	testq	%rdi, %rdi
1454247f7:     	je	0x145424822 <.text+0x5423822>
1454247f9:     	leaq	0x8(%rsi), %rbx
1454247fd:     	jmp	0x145424809 <.text+0x5423809>
1454247ff:     	nop
145424800:     	addq	$0x18, %rbx
145424804:     	decq	%rdi
145424807:     	je	0x145424822 <.text+0x5423822>
145424809:     	movq	-0x8(%rbx), %rdx
14542480d:     	testq	%rdx, %rdx
145424810:     	je	0x145424800 <.text+0x5423800>
145424812:     	movq	(%rbx), %rcx
145424815:     	movl	$0x1, %r8d
14542481b:     	callq	0x1400021d0 <.text+0x11d0>
145424820:     	jmp	0x145424800 <.text+0x5423800>
145424822:     	movq	0xb0(%rbp), %rax
145424829:     	testq	%rax, %rax
14542482c:     	je	0x145424844 <.text+0x5423844>
14542482e:     	shlq	$0x3, %rax
145424832:     	leaq	(%rax,%rax,2), %rdx
145424836:     	movl	$0x8, %r8d
14542483c:     	movq	%rsi, %rcx
14542483f:     	callq	0x1400021d0 <.text+0x11d0>
145424844:     	imulq	$0xe8, 0x58(%r14), %rax
14542484c:     	movq	0x50(%r14), %r13
145424850:     	addq	%r13, %rax
145424853:     	movq	%rax, 0x108(%rbp)
14542485a:     	leaq	-0x10(%rbp), %r12
14542485e:     	jmp	0x145424867 <.text+0x5423867>
145424860:     	addq	$0xe8, %r13
145424867:     	cmpq	0x108(%rbp), %r13
14542486e:     	je	0x145424c9a <.text+0x5423c9a>
145424874:     	leaq	0x98(%r13), %rsi
14542487b:     	leaq	0xe4(%r13), %rax
145424882:     	movb	0xe4(%r13), %r15b
145424889:     	leaq	0x12fc1b7(%rip), %rcx   # 0x146720a47
145424890:     	movq	%rcx, -0x30(%rbp)
145424894:     	movq	$0x5, -0x28(%rbp)
14542489c:     	movb	%r15b, 0xcf(%rbp)
1454248a3:     	movq	%rsi, -0x10(%rbp)
1454248a7:     	movq	%rax, -0x8(%rbp)
1454248ab:     	movq	$0x0, (%rbp)
1454248b3:     	leaq	0xb0(%rbp), %rcx
1454248ba:     	movq	%r12, %rdx
1454248bd:     	callq	0x145525fc0 <.text+0x5524fc0>
1454248c2:     	nop
1454248c3:     	movq	0xb8(%rbp), %rdi
1454248ca:     	movq	0xc0(%rbp), %rbx
1454248d1:     	movq	$0x1, 0x20(%rsp)
1454248da:     	movq	%r12, %rcx
1454248dd:     	movq	%rdi, %rdx
1454248e0:     	movq	%rbx, %r8
1454248e3:     	leaq	0x12fbf4a(%rip), %r9    # 0x146720834
1454248ea:     	callq	0x145455eb0 <.text+0x5454eb0>
1454248ef:     	nop
1454248f0:     	movq	(%rbp), %rax
1454248f4:     	movq	%rax, 0xe0(%rbp)
1454248fb:     	movdqu	-0x10(%rbp), %xmm0
145424900:     	movdqa	%xmm0, 0xd0(%rbp)
145424908:     	leaq	-0x30(%rbp), %rax
14542490c:     	movq	%rax, -0x10(%rbp)
145424910:     	leaq	-0x5422857(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145424917:     	movq	%rax, -0x8(%rbp)
14542491b:     	leaq	0xcf(%rbp), %rax
145424922:     	movq	%rax, (%rbp)
145424926:     	leaq	0x2f5fe3(%rip), %rax    # 0x14571a910 <.text+0x5719910>
14542492d:     	movq	%rax, 0x8(%rbp)
145424931:     	leaq	0xd0(%rbp), %rax
145424938:     	movq	%rax, 0x10(%rbp)
14542493c:     	leaq	-0x5422863(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145424943:     	movq	%rax, 0x18(%rbp)
145424947:     	leaq	0x90(%rbp), %rcx
14542494e:     	leaq	0x12fbee0(%rip), %rdx   # 0x146720835
145424955:     	movq	%r12, %r8
145424958:     	callq	0x14570bf80 <.text+0x570af80>
14542495d:     	nop
14542495e:     	movq	0xd0(%rbp), %rdx
145424965:     	testq	%rdx, %rdx
145424968:     	je	0x14542497c <.text+0x542397c>
14542496a:     	movq	0xd8(%rbp), %rcx
145424971:     	movl	$0x1, %r8d
145424977:     	callq	0x1400021d0 <.text+0x11d0>
14542497c:     	testq	%rbx, %rbx
14542497f:     	je	0x1454249c0 <.text+0x54239c0>
145424981:     	leaq	0x8(%rdi), %r14
145424985:     	jmp	0x145424999 <.text+0x5423999>
145424987:     	nopw	(%rax,%rax)
145424990:     	addq	$0x18, %r14
145424994:     	decq	%rbx
145424997:     	je	0x1454249c0 <.text+0x54239c0>
145424999:     	movq	-0x8(%r14), %rdx
14542499d:     	testq	%rdx, %rdx
1454249a0:     	je	0x145424990 <.text+0x5423990>
1454249a2:     	movq	(%r14), %rcx
1454249a5:     	movl	$0x1, %r8d
1454249ab:     	callq	0x1400021d0 <.text+0x11d0>
1454249b0:     	jmp	0x145424990 <.text+0x5423990>
1454249b2:     	nopw	%cs:(%rax,%rax)
1454249c0:     	movq	0xb0(%rbp), %rax
1454249c7:     	testq	%rax, %rax
1454249ca:     	je	0x1454249e2 <.text+0x54239e2>
1454249cc:     	shlq	$0x3, %rax
1454249d0:     	leaq	(%rax,%rax,2), %rdx
1454249d4:     	movl	$0x8, %r8d
1454249da:     	movq	%rdi, %rcx
1454249dd:     	callq	0x1400021d0 <.text+0x11d0>
1454249e2:     	movq	0x98(%rbp), %rbx
1454249e9:     	movq	0xa0(%rbp), %rdi
1454249f0:     	movq	0xe8(%rbp), %rax
1454249f7:     	movq	0xf8(%rbp), %rdx
1454249fe:     	subq	%rdx, %rax
145424a01:     	cmpq	%rax, %rdi
145424a04:     	ja	0x145424c28 <.text+0x5423c28>
145424a0a:     	testq	%rdi, %rdi
145424a0d:     	je	0x145424a2b <.text+0x5423a2b>
145424a0f:     	addq	0xf0(%rbp), %rdx
145424a16:     	movq	%rdx, %rcx
145424a19:     	movq	%rbx, %rdx
145424a1c:     	movq	%rdi, %r8
145424a1f:     	callq	0x145756ddd <.text+0x5755ddd>
145424a24:     	movq	0xf8(%rbp), %rdx
145424a2b:     	addq	%rdi, %rdx
145424a2e:     	movq	%rdx, 0xf8(%rbp)
145424a35:     	movq	0x90(%rbp), %rdx
145424a3c:     	testq	%rdx, %rdx
145424a3f:     	je	0x145424a4f <.text+0x5423a4f>
145424a41:     	movl	$0x1, %r8d
145424a47:     	movq	%rbx, %rcx
145424a4a:     	callq	0x1400021d0 <.text+0x11d0>
145424a4f:     	leaq	0x12fbff6(%rip), %rax   # 0x146720a4c
145424a56:     	movq	%rax, -0x30(%rbp)
145424a5a:     	movq	$0x4, -0x28(%rbp)
145424a62:     	movb	%r15b, 0xcf(%rbp)
145424a69:     	movq	%r13, -0x10(%rbp)
145424a6d:     	movq	%rsi, -0x8(%rbp)
145424a71:     	movq	$0x0, (%rbp)
145424a79:     	leaq	0xb0(%rbp), %rcx
145424a80:     	movq	%r12, %rdx
145424a83:     	callq	0x145525cb0 <.text+0x5524cb0>
145424a88:     	nop
145424a89:     	movq	0xb8(%rbp), %rdi
145424a90:     	movq	0xc0(%rbp), %rbx
145424a97:     	movq	$0x1, 0x20(%rsp)
145424aa0:     	movq	%r12, %rcx
145424aa3:     	movq	%rdi, %rdx
145424aa6:     	movq	%rbx, %r8
145424aa9:     	leaq	0x12fbd84(%rip), %r9    # 0x146720834
145424ab0:     	callq	0x145455eb0 <.text+0x5454eb0>
145424ab5:     	nop
145424ab6:     	movq	(%rbp), %rax
145424aba:     	movq	%rax, 0xe0(%rbp)
145424ac1:     	movdqu	-0x10(%rbp), %xmm0
145424ac6:     	movdqa	%xmm0, 0xd0(%rbp)
145424ace:     	leaq	-0x30(%rbp), %rax
145424ad2:     	movq	%rax, -0x10(%rbp)
145424ad6:     	leaq	-0x5422a1d(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145424add:     	movq	%rax, -0x8(%rbp)
145424ae1:     	leaq	0xcf(%rbp), %rax
145424ae8:     	movq	%rax, (%rbp)
145424aec:     	leaq	0x2f5e1d(%rip), %rax    # 0x14571a910 <.text+0x5719910>
145424af3:     	movq	%rax, 0x8(%rbp)
145424af7:     	leaq	0xd0(%rbp), %rax
145424afe:     	movq	%rax, 0x10(%rbp)
145424b02:     	leaq	-0x5422a29(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145424b09:     	movq	%rax, 0x18(%rbp)
145424b0d:     	leaq	0x90(%rbp), %rcx
145424b14:     	leaq	0x12fbd1a(%rip), %rdx   # 0x146720835
145424b1b:     	movq	%r12, %r8
145424b1e:     	callq	0x14570bf80 <.text+0x570af80>
145424b23:     	nop
145424b24:     	movq	0xd0(%rbp), %rdx
145424b2b:     	testq	%rdx, %rdx
145424b2e:     	je	0x145424b42 <.text+0x5423b42>
145424b30:     	movq	0xd8(%rbp), %rcx
145424b37:     	movl	$0x1, %r8d
145424b3d:     	callq	0x1400021d0 <.text+0x11d0>
145424b42:     	testq	%rbx, %rbx
145424b45:     	movq	0xa8(%rbp), %r14
145424b4c:     	je	0x145424b90 <.text+0x5423b90>
145424b4e:     	leaq	0x8(%rdi), %rsi
145424b52:     	jmp	0x145424b69 <.text+0x5423b69>
145424b54:     	nopw	%cs:(%rax,%rax)
145424b60:     	addq	$0x18, %rsi
145424b64:     	decq	%rbx
145424b67:     	je	0x145424b90 <.text+0x5423b90>
145424b69:     	movq	-0x8(%rsi), %rdx
145424b6d:     	testq	%rdx, %rdx
145424b70:     	je	0x145424b60 <.text+0x5423b60>
145424b72:     	movq	(%rsi), %rcx
145424b75:     	movl	$0x1, %r8d
145424b7b:     	callq	0x1400021d0 <.text+0x11d0>
145424b80:     	jmp	0x145424b60 <.text+0x5423b60>
145424b82:     	nopw	%cs:(%rax,%rax)
145424b90:     	movq	0xb0(%rbp), %rax
145424b97:     	testq	%rax, %rax
145424b9a:     	je	0x145424bb2 <.text+0x5423bb2>
145424b9c:     	shlq	$0x3, %rax
145424ba0:     	leaq	(%rax,%rax,2), %rdx
145424ba4:     	movl	$0x8, %r8d
145424baa:     	movq	%rdi, %rcx
145424bad:     	callq	0x1400021d0 <.text+0x11d0>
145424bb2:     	movq	0x98(%rbp), %rsi
145424bb9:     	movq	0xa0(%rbp), %rdi
145424bc0:     	movq	0xe8(%rbp), %rax
145424bc7:     	movq	0xf8(%rbp), %rdx
145424bce:     	subq	%rdx, %rax
145424bd1:     	cmpq	%rax, %rdi
145424bd4:     	ja	0x145424c61 <.text+0x5423c61>
145424bda:     	testq	%rdi, %rdi
145424bdd:     	je	0x145424bfb <.text+0x5423bfb>
145424bdf:     	addq	0xf0(%rbp), %rdx
145424be6:     	movq	%rdx, %rcx
145424be9:     	movq	%rsi, %rdx
145424bec:     	movq	%rdi, %r8
145424bef:     	callq	0x145756ddd <.text+0x5755ddd>
145424bf4:     	movq	0xf8(%rbp), %rdx
145424bfb:     	addq	%rdi, %rdx
145424bfe:     	movq	%rdx, 0xf8(%rbp)
145424c05:     	movq	0x90(%rbp), %rdx
145424c0c:     	testq	%rdx, %rdx
145424c0f:     	je	0x145424860 <.text+0x5423860>
145424c15:     	movl	$0x1, %r8d
145424c1b:     	movq	%rsi, %rcx
145424c1e:     	callq	0x1400021d0 <.text+0x11d0>
145424c23:     	jmp	0x145424860 <.text+0x5423860>
145424c28:     	movq	%rbx, 0x100(%rbp)
145424c2f:     	movq	$0x1, 0x20(%rsp)
145424c38:     	movl	$0x1, %r9d
145424c3e:     	leaq	0xe8(%rbp), %rcx
145424c45:     	movq	%rdi, %r8
145424c48:     	callq	0x145757d40 <.text+0x5756d40>
145424c4d:     	nop
145424c4e:     	movq	0xf8(%rbp), %rdx
145424c55:     	movq	0x100(%rbp), %rbx
145424c5c:     	jmp	0x145424a0f <.text+0x5423a0f>
145424c61:     	movq	%rsi, 0x100(%rbp)
145424c68:     	movq	$0x1, 0x20(%rsp)
145424c71:     	movl	$0x1, %r9d
145424c77:     	leaq	0xe8(%rbp), %rcx
145424c7e:     	movq	%rdi, %r8
145424c81:     	callq	0x145757d40 <.text+0x5756d40>
145424c86:     	nop
145424c87:     	movq	0xf8(%rbp), %rdx
145424c8e:     	movq	0x100(%rbp), %rsi
145424c95:     	jmp	0x145424bdf <.text+0x5423bdf>
145424c9a:     	movq	0x68(%r14), %r13
145424c9e:     	movq	0x70(%r14), %r15
145424ca2:     	shlq	$0x5, %r15
145424ca6:     	addq	%r13, %r15
145424ca9:     	leaq	-0x53b0820(%rip), %r14  # 0x140074490 <.text+0x73490>
145424cb0:     	leaq	0x12fbe81(%rip), %rsi   # 0x146720b38
145424cb7:     	leaq	0xb0(%rbp), %rdi
145424cbe:     	leaq	-0x10(%rbp), %rbx
145424cc2:     	jmp	0x145424cd4 <.text+0x5423cd4>
145424cc4:     	nopw	%cs:(%rax,%rax)
145424cd0:     	addq	$0x20, %r13
145424cd4:     	cmpq	%r15, %r13
145424cd7:     	je	0x145424e19 <.text+0x5423e19>
145424cdd:     	leaq	0x4(%r13), %rax
145424ce1:     	movq	%rax, -0x30(%rbp)
145424ce5:     	movq	%r13, 0x90(%rbp)
145424cec:     	leaq	0x8(%r13), %rdx
145424cf0:     	leaq	0xd0(%rbp), %rcx
145424cf7:     	callq	0x145473da0 <.text+0x5472da0>
145424cfc:     	nop
145424cfd:     	leaq	-0x30(%rbp), %rax
145424d01:     	movq	%rax, -0x10(%rbp)
145424d05:     	leaq	-0x4fa081c(%rip), %rax  # 0x1404844f0 <.text+0x4834f0>
145424d0c:     	movq	%rax, -0x8(%rbp)
145424d10:     	leaq	0x90(%rbp), %rax
145424d17:     	movq	%rax, (%rbp)
145424d1b:     	movq	%r14, 0x8(%rbp)
145424d1f:     	leaq	0xd0(%rbp), %rax
145424d26:     	movq	%rax, 0x10(%rbp)
145424d2a:     	leaq	-0x5422c51(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145424d31:     	movq	%rax, 0x18(%rbp)
145424d35:     	movq	%rdi, %rcx
145424d38:     	movq	%rsi, %rdx
145424d3b:     	movq	%rbx, %r8
145424d3e:     	callq	0x14570bf80 <.text+0x570af80>
145424d43:     	nop
145424d44:     	movq	0xd0(%rbp), %rdx
145424d4b:     	testq	%rdx, %rdx
145424d4e:     	je	0x145424d62 <.text+0x5423d62>
145424d50:     	movq	0xd8(%rbp), %rcx
145424d57:     	movl	$0x1, %r8d
145424d5d:     	callq	0x1400021d0 <.text+0x11d0>
145424d62:     	movq	0xb0(%rbp), %rax
145424d69:     	movq	%rax, 0x100(%rbp)
145424d70:     	movq	0xb8(%rbp), %rax
145424d77:     	movq	%rax, 0x108(%rbp)
145424d7e:     	movq	0xc0(%rbp), %r12
145424d85:     	movq	0xe8(%rbp), %rax
145424d8c:     	movq	0xf8(%rbp), %rdx
145424d93:     	subq	%rdx, %rax
145424d96:     	cmpq	%rax, %r12
145424d99:     	ja	0x145424df1 <.text+0x5423df1>
145424d9b:     	testq	%r12, %r12
145424d9e:     	je	0x145424dc0 <.text+0x5423dc0>
145424da0:     	addq	0xf0(%rbp), %rdx
145424da7:     	movq	%rdx, %rcx
145424daa:     	movq	0x108(%rbp), %rdx
145424db1:     	movq	%r12, %r8
145424db4:     	callq	0x145756ddd <.text+0x5755ddd>
145424db9:     	movq	0xf8(%rbp), %rdx
145424dc0:     	addq	%r12, %rdx
145424dc3:     	movq	%rdx, 0xf8(%rbp)
145424dca:     	movq	0x100(%rbp), %rdx
145424dd1:     	testq	%rdx, %rdx
145424dd4:     	je	0x145424cd0 <.text+0x5423cd0>
145424dda:     	movl	$0x1, %r8d
145424de0:     	movq	0x108(%rbp), %rcx
145424de7:     	callq	0x1400021d0 <.text+0x11d0>
145424dec:     	jmp	0x145424cd0 <.text+0x5423cd0>
145424df1:     	movq	$0x1, 0x20(%rsp)
145424dfa:     	movl	$0x1, %r9d
145424e00:     	leaq	0xe8(%rbp), %rcx
145424e07:     	movq	%r12, %r8
145424e0a:     	callq	0x145757d40 <.text+0x5756d40>
145424e0f:     	nop
145424e10:     	movq	0xf8(%rbp), %rdx
145424e17:     	jmp	0x145424da0 <.text+0x5423da0>
145424e19:     	movq	0xa8(%rbp), %r14
145424e20:     	movq	0x88(%r14), %r8
145424e27:     	testq	%r8, %r8
145424e2a:     	je	0x145424fa4 <.text+0x5423fa4>
145424e30:     	movq	0x80(%r14), %rdx
145424e37:     	shlq	$0x5, %r8
145424e3b:     	addq	%rdx, %r8
145424e3e:     	leaq	0xb0(%rbp), %rcx
145424e45:     	callq	0x1455349e0 <.text+0x55339e0>
145424e4a:     	nop
145424e4b:     	movq	0xb8(%rbp), %rsi
145424e52:     	movq	0xc0(%rbp), %rdi
145424e59:     	movq	$0x1, 0x20(%rsp)
145424e62:     	leaq	0x12fb9cb(%rip), %r9    # 0x146720834
145424e69:     	leaq	-0x10(%rbp), %rcx
145424e6d:     	movq	%rsi, %rdx
145424e70:     	movq	%rdi, %r8
145424e73:     	callq	0x145455eb0 <.text+0x5454eb0>
145424e78:     	nop
145424e79:     	movq	(%rbp), %rax
145424e7d:     	movq	%rax, 0xe0(%rbp)
145424e84:     	movdqu	-0x10(%rbp), %xmm0
145424e89:     	movdqa	%xmm0, 0xd0(%rbp)
145424e91:     	leaq	0xd0(%rbp), %rax
145424e98:     	movq	%rax, 0x90(%rbp)
145424e9f:     	leaq	-0x5422dc6(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145424ea6:     	movq	%rax, 0x98(%rbp)
145424ead:     	leaq	0x12fbc96(%rip), %rdx   # 0x146720b4a
145424eb4:     	leaq	-0x10(%rbp), %rcx
145424eb8:     	leaq	0x90(%rbp), %r8
145424ebf:     	callq	0x14570bf80 <.text+0x570af80>
145424ec4:     	nop
145424ec5:     	movq	0xd0(%rbp), %rdx
145424ecc:     	testq	%rdx, %rdx
145424ecf:     	je	0x145424ee3 <.text+0x5423ee3>
145424ed1:     	movq	0xd8(%rbp), %rcx
145424ed8:     	movl	$0x1, %r8d
145424ede:     	callq	0x1400021d0 <.text+0x11d0>
145424ee3:     	movq	-0x10(%rbp), %r15
145424ee7:     	movq	-0x8(%rbp), %r12
145424eeb:     	movq	(%rbp), %rbx
145424eef:     	movq	0xe8(%rbp), %rax
145424ef6:     	movq	0xf8(%rbp), %rdx
145424efd:     	subq	%rdx, %rax
145424f00:     	cmpq	%rax, %rbx
145424f03:     	movq	0xa8(%rbp), %r14
145424f0a:     	ja	0x145426023 <.text+0x5425023>
145424f10:     	testq	%rbx, %rbx
145424f13:     	je	0x145424f31 <.text+0x5423f31>
145424f15:     	addq	0xf0(%rbp), %rdx
145424f1c:     	movq	%rdx, %rcx
145424f1f:     	movq	%r12, %rdx
145424f22:     	movq	%rbx, %r8
145424f25:     	callq	0x145756ddd <.text+0x5755ddd>
145424f2a:     	movq	0xf8(%rbp), %rdx
145424f31:     	addq	%rbx, %rdx
145424f34:     	movq	%rdx, 0xf8(%rbp)
145424f3b:     	testq	%r15, %r15
145424f3e:     	je	0x145424f51 <.text+0x5423f51>
145424f40:     	movl	$0x1, %r8d
145424f46:     	movq	%r12, %rcx
145424f49:     	movq	%r15, %rdx
145424f4c:     	callq	0x1400021d0 <.text+0x11d0>
145424f51:     	testq	%rdi, %rdi
145424f54:     	je	0x145424f82 <.text+0x5423f82>
145424f56:     	leaq	0x8(%rsi), %rbx
145424f5a:     	jmp	0x145424f69 <.text+0x5423f69>
145424f5c:     	nopl	(%rax)
145424f60:     	addq	$0x18, %rbx
145424f64:     	decq	%rdi
145424f67:     	je	0x145424f82 <.text+0x5423f82>
145424f69:     	movq	-0x8(%rbx), %rdx
145424f6d:     	testq	%rdx, %rdx
145424f70:     	je	0x145424f60 <.text+0x5423f60>
145424f72:     	movq	(%rbx), %rcx
145424f75:     	movl	$0x1, %r8d
145424f7b:     	callq	0x1400021d0 <.text+0x11d0>
145424f80:     	jmp	0x145424f60 <.text+0x5423f60>
145424f82:     	movq	0xb0(%rbp), %rax
145424f89:     	testq	%rax, %rax
145424f8c:     	je	0x145424fa4 <.text+0x5423fa4>
145424f8e:     	shlq	$0x3, %rax
145424f92:     	leaq	(%rax,%rax,2), %rdx
145424f96:     	movl	$0x8, %r8d
145424f9c:     	movq	%rsi, %rcx
145424f9f:     	callq	0x1400021d0 <.text+0x11d0>
145424fa4:     	movq	0xa0(%r14), %r8
145424fab:     	testq	%r8, %r8
145424fae:     	je	0x1454250ad <.text+0x54240ad>
145424fb4:     	movq	0x98(%r14), %rdx
145424fbb:     	movq	$0x1, 0x20(%rsp)
145424fc4:     	leaq	0x12fb869(%rip), %r9    # 0x146720834
145424fcb:     	leaq	-0x10(%rbp), %rcx
145424fcf:     	callq	0x145455eb0 <.text+0x5454eb0>
145424fd4:     	nop
145424fd5:     	movq	(%rbp), %rax
145424fd9:     	movq	%rax, 0xe0(%rbp)
145424fe0:     	movdqu	-0x10(%rbp), %xmm0
145424fe5:     	movdqa	%xmm0, 0xd0(%rbp)
145424fed:     	leaq	0xd0(%rbp), %rax
145424ff4:     	movq	%rax, 0xb0(%rbp)
145424ffb:     	leaq	-0x5422f22(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145425002:     	movq	%rax, 0xb8(%rbp)
145425009:     	leaq	0x12fbb44(%rip), %rdx   # 0x146720b54
145425010:     	leaq	-0x10(%rbp), %rcx
145425014:     	leaq	0xb0(%rbp), %r8
14542501b:     	callq	0x14570bf80 <.text+0x570af80>
145425020:     	nop
145425021:     	movq	0xd0(%rbp), %rdx
145425028:     	testq	%rdx, %rdx
14542502b:     	je	0x14542503f <.text+0x542403f>
14542502d:     	movq	0xd8(%rbp), %rcx
145425034:     	movl	$0x1, %r8d
14542503a:     	callq	0x1400021d0 <.text+0x11d0>
14542503f:     	movq	-0x10(%rbp), %rdi
145425043:     	movq	-0x8(%rbp), %rbx
145425047:     	movq	(%rbp), %rsi
14542504b:     	movq	0xe8(%rbp), %rax
145425052:     	movq	0xf8(%rbp), %rdx
145425059:     	subq	%rdx, %rax
14542505c:     	cmpq	%rax, %rsi
14542505f:     	ja	0x14542606a <.text+0x542506a>
145425065:     	testq	%rsi, %rsi
145425068:     	movq	0xa8(%rbp), %r14
14542506f:     	je	0x14542508d <.text+0x542408d>
145425071:     	addq	0xf0(%rbp), %rdx
145425078:     	movq	%rdx, %rcx
14542507b:     	movq	%rbx, %rdx
14542507e:     	movq	%rsi, %r8
145425081:     	callq	0x145756ddd <.text+0x5755ddd>
145425086:     	movq	0xf8(%rbp), %rdx
14542508d:     	addq	%rsi, %rdx
145425090:     	movq	%rdx, 0xf8(%rbp)
145425097:     	testq	%rdi, %rdi
14542509a:     	je	0x1454250ad <.text+0x54240ad>
14542509c:     	movl	$0x1, %r8d
1454250a2:     	movq	%rbx, %rcx
1454250a5:     	movq	%rdi, %rdx
1454250a8:     	callq	0x1400021d0 <.text+0x11d0>
1454250ad:     	movq	0xb8(%r14), %r8
1454250b4:     	testq	%r8, %r8
1454250b7:     	je	0x145425234 <.text+0x5424234>
1454250bd:     	movq	0xb0(%r14), %rdx
1454250c4:     	shlq	$0x5, %r8
1454250c8:     	addq	%rdx, %r8
1454250cb:     	leaq	0xb0(%rbp), %rcx
1454250d2:     	callq	0x145534d20 <.text+0x5533d20>
1454250d7:     	nop
1454250d8:     	movq	0xb8(%rbp), %rsi
1454250df:     	movq	0xc0(%rbp), %rdi
1454250e6:     	movq	$0x1, 0x20(%rsp)
1454250ef:     	leaq	0x12fb73e(%rip), %r9    # 0x146720834
1454250f6:     	leaq	-0x10(%rbp), %rcx
1454250fa:     	movq	%rsi, %rdx
1454250fd:     	movq	%rdi, %r8
145425100:     	callq	0x145455eb0 <.text+0x5454eb0>
145425105:     	nop
145425106:     	movq	(%rbp), %rax
14542510a:     	movq	%rax, 0xe0(%rbp)
145425111:     	movdqu	-0x10(%rbp), %xmm0
145425116:     	movdqa	%xmm0, 0xd0(%rbp)
14542511e:     	leaq	0xd0(%rbp), %rax
145425125:     	movq	%rax, 0x90(%rbp)
14542512c:     	leaq	-0x5423053(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145425133:     	movq	%rax, 0x98(%rbp)
14542513a:     	leaq	0x12fba1c(%rip), %rdx   # 0x146720b5d
145425141:     	leaq	-0x10(%rbp), %rcx
145425145:     	leaq	0x90(%rbp), %r8
14542514c:     	callq	0x14570bf80 <.text+0x570af80>
145425151:     	nop
145425152:     	movq	0xd0(%rbp), %rdx
145425159:     	testq	%rdx, %rdx
14542515c:     	je	0x145425170 <.text+0x5424170>
14542515e:     	movq	0xd8(%rbp), %rcx
145425165:     	movl	$0x1, %r8d
14542516b:     	callq	0x1400021d0 <.text+0x11d0>
145425170:     	movq	-0x10(%rbp), %r15
145425174:     	movq	-0x8(%rbp), %r12
145425178:     	movq	(%rbp), %rbx
14542517c:     	movq	0xe8(%rbp), %rax
145425183:     	movq	0xf8(%rbp), %rdx
14542518a:     	subq	%rdx, %rax
14542518d:     	cmpq	%rax, %rbx
145425190:     	movq	0xa8(%rbp), %r14
145425197:     	ja	0x1454260b8 <.text+0x54250b8>
14542519d:     	testq	%rbx, %rbx
1454251a0:     	je	0x1454251be <.text+0x54241be>
1454251a2:     	addq	0xf0(%rbp), %rdx
1454251a9:     	movq	%rdx, %rcx
1454251ac:     	movq	%r12, %rdx
1454251af:     	movq	%rbx, %r8
1454251b2:     	callq	0x145756ddd <.text+0x5755ddd>
1454251b7:     	movq	0xf8(%rbp), %rdx
1454251be:     	addq	%rbx, %rdx
1454251c1:     	movq	%rdx, 0xf8(%rbp)
1454251c8:     	testq	%r15, %r15
1454251cb:     	je	0x1454251de <.text+0x54241de>
1454251cd:     	movl	$0x1, %r8d
1454251d3:     	movq	%r12, %rcx
1454251d6:     	movq	%r15, %rdx
1454251d9:     	callq	0x1400021d0 <.text+0x11d0>
1454251de:     	testq	%rdi, %rdi
1454251e1:     	je	0x145425212 <.text+0x5424212>
1454251e3:     	leaq	0x8(%rsi), %rbx
1454251e7:     	jmp	0x1454251f9 <.text+0x54241f9>
1454251e9:     	nopl	(%rax)
1454251f0:     	addq	$0x18, %rbx
1454251f4:     	decq	%rdi
1454251f7:     	je	0x145425212 <.text+0x5424212>
1454251f9:     	movq	-0x8(%rbx), %rdx
1454251fd:     	testq	%rdx, %rdx
145425200:     	je	0x1454251f0 <.text+0x54241f0>
145425202:     	movq	(%rbx), %rcx
145425205:     	movl	$0x1, %r8d
14542520b:     	callq	0x1400021d0 <.text+0x11d0>
145425210:     	jmp	0x1454251f0 <.text+0x54241f0>
145425212:     	movq	0xb0(%rbp), %rax
145425219:     	testq	%rax, %rax
14542521c:     	je	0x145425234 <.text+0x5424234>
14542521e:     	shlq	$0x3, %rax
145425222:     	leaq	(%rax,%rax,2), %rdx
145425226:     	movl	$0x8, %r8d
14542522c:     	movq	%rsi, %rcx
14542522f:     	callq	0x1400021d0 <.text+0x11d0>
145425234:     	cmpq	$0x0, 0x178(%r14)
14542523c:     	jne	0x14542527e <.text+0x542427e>
14542523e:     	cmpq	$0x0, 0x180(%r14)
145425246:     	jne	0x14542527e <.text+0x542427e>
145425248:     	cmpq	$0x0, 0x188(%r14)
145425250:     	jne	0x14542527e <.text+0x542427e>
145425252:     	cmpq	$0x0, 0x190(%r14)
14542525a:     	jne	0x14542527e <.text+0x542427e>
14542525c:     	cmpq	$0x0, 0x198(%r14)
145425264:     	jne	0x14542527e <.text+0x542427e>
145425266:     	cmpq	$0x0, 0x1a0(%r14)
14542526e:     	jne	0x14542527e <.text+0x542427e>
145425270:     	cmpq	$0x0, 0x1a8(%r14)
145425278:     	je	0x145425404 <.text+0x5424404>
14542527e:     	leaq	0x12fb7bb(%rip), %rax   # 0x146720a40
145425285:     	movq	%rax, -0x10(%rbp)
145425289:     	leaq	0x12fb7b7(%rip), %rax   # 0x146720a47
145425290:     	movq	%rax, -0x8(%rbp)
145425294:     	movq	%r14, (%rbp)
145425298:     	leaq	0xb0(%rbp), %rcx
14542529f:     	leaq	-0x10(%rbp), %rdx
1454252a3:     	callq	0x145534600 <.text+0x5533600>
1454252a8:     	nop
1454252a9:     	movq	0xb8(%rbp), %rsi
1454252b0:     	movq	0xc0(%rbp), %rdi
1454252b7:     	movq	$0x1, 0x20(%rsp)
1454252c0:     	leaq	0x12fb56d(%rip), %r9    # 0x146720834
1454252c7:     	leaq	-0x10(%rbp), %rcx
1454252cb:     	movq	%rsi, %rdx
1454252ce:     	movq	%rdi, %r8
1454252d1:     	callq	0x145455eb0 <.text+0x5454eb0>
1454252d6:     	nop
1454252d7:     	movq	(%rbp), %rax
1454252db:     	movq	%rax, 0xe0(%rbp)
1454252e2:     	movdqu	-0x10(%rbp), %xmm0
1454252e7:     	movdqa	%xmm0, 0xd0(%rbp)
1454252ef:     	leaq	0xd0(%rbp), %rax
1454252f6:     	movq	%rax, 0x90(%rbp)
1454252fd:     	leaq	-0x5423224(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145425304:     	movq	%rax, 0x98(%rbp)
14542530b:     	leaq	0x12fb856(%rip), %rdx   # 0x146720b68
145425312:     	leaq	-0x10(%rbp), %rcx
145425316:     	leaq	0x90(%rbp), %r8
14542531d:     	callq	0x14570bf80 <.text+0x570af80>
145425322:     	nop
145425323:     	movq	0xd0(%rbp), %rdx
14542532a:     	testq	%rdx, %rdx
14542532d:     	je	0x145425341 <.text+0x5424341>
14542532f:     	movq	0xd8(%rbp), %rcx
145425336:     	movl	$0x1, %r8d
14542533c:     	callq	0x1400021d0 <.text+0x11d0>
145425341:     	movq	-0x10(%rbp), %r15
145425345:     	movq	-0x8(%rbp), %r12
145425349:     	movq	(%rbp), %rbx
14542534d:     	movq	0xe8(%rbp), %rax
145425354:     	movq	0xf8(%rbp), %rdx
14542535b:     	subq	%rdx, %rax
14542535e:     	cmpq	%rax, %rbx
145425361:     	movq	0xa8(%rbp), %r14
145425368:     	ja	0x145426229 <.text+0x5425229>
14542536e:     	testq	%rbx, %rbx
145425371:     	je	0x14542538f <.text+0x542438f>
145425373:     	addq	0xf0(%rbp), %rdx
14542537a:     	movq	%rdx, %rcx
14542537d:     	movq	%r12, %rdx
145425380:     	movq	%rbx, %r8
145425383:     	callq	0x145756ddd <.text+0x5755ddd>
145425388:     	movq	0xf8(%rbp), %rdx
14542538f:     	addq	%rbx, %rdx
145425392:     	movq	%rdx, 0xf8(%rbp)
145425399:     	testq	%r15, %r15
14542539c:     	je	0x1454253af <.text+0x54243af>
14542539e:     	movl	$0x1, %r8d
1454253a4:     	movq	%r12, %rcx
1454253a7:     	movq	%r15, %rdx
1454253aa:     	callq	0x1400021d0 <.text+0x11d0>
1454253af:     	testq	%rdi, %rdi
1454253b2:     	je	0x1454253e2 <.text+0x54243e2>
1454253b4:     	leaq	0x8(%rsi), %rbx
1454253b8:     	jmp	0x1454253c9 <.text+0x54243c9>
1454253ba:     	nopw	(%rax,%rax)
1454253c0:     	addq	$0x18, %rbx
1454253c4:     	decq	%rdi
1454253c7:     	je	0x1454253e2 <.text+0x54243e2>
1454253c9:     	movq	-0x8(%rbx), %rdx
1454253cd:     	testq	%rdx, %rdx
1454253d0:     	je	0x1454253c0 <.text+0x54243c0>
1454253d2:     	movq	(%rbx), %rcx
1454253d5:     	movl	$0x1, %r8d
1454253db:     	callq	0x1400021d0 <.text+0x11d0>
1454253e0:     	jmp	0x1454253c0 <.text+0x54243c0>
1454253e2:     	movq	0xb0(%rbp), %rax
1454253e9:     	testq	%rax, %rax
1454253ec:     	je	0x145425404 <.text+0x5424404>
1454253ee:     	shlq	$0x3, %rax
1454253f2:     	leaq	(%rax,%rax,2), %rdx
1454253f6:     	movl	$0x8, %r8d
1454253fc:     	movq	%rsi, %rcx
1454253ff:     	callq	0x1400021d0 <.text+0x11d0>
145425404:     	movq	0xc8(%r14), %rax
14542540b:     	movq	%rax, -0x18(%rbp)
14542540f:     	movq	0xd0(%r14), %rsi
145425416:     	testq	%rsi, %rsi
145425419:     	je	0x145425446 <.text+0x5424446>
14542541b:     	callq	0x140002200 <.text+0x1200>
145425420:     	movl	$0x1, %edx
145425425:     	movq	%rsi, %rcx
145425428:     	callq	0x1400021c0 <.text+0x11c0>
14542542d:     	testq	%rax, %rax
145425430:     	je	0x14542628b <.text+0x542528b>
145425436:     	movq	%rax, %rbx
145425439:     	cmpq	$0x4, %rsi
14542543d:     	jae	0x145425453 <.text+0x5424453>
14542543f:     	xorl	%eax, %eax
145425441:     	jmp	0x1454255ad <.text+0x54245ad>
145425446:     	movl	$0x1, %ebx
14542544b:     	xorl	%r12d, %r12d
14542544e:     	jmp	0x145425643 <.text+0x5424643>
145425453:     	cmpq	$0x10, %rsi
145425457:     	jae	0x145425460 <.text+0x5424460>
145425459:     	xorl	%eax, %eax
14542545b:     	jmp	0x145425548 <.text+0x5424548>
145425460:     	movq	%rsi, %rax
145425463:     	andq	$-0x10, %rax
145425467:     	movq	-0x18(%rbp), %rcx
14542546b:     	addq	$0xf0, %rcx
145425472:     	xorl	%edx, %edx
145425474:     	nopw	%cs:(%rax,%rax)
145425480:     	movd	(%rcx), %xmm0
145425484:     	movd	-0x10(%rcx), %xmm1
145425489:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
14542548d:     	movd	-0x20(%rcx), %xmm0
145425492:     	movd	-0x30(%rcx), %xmm2
145425497:     	punpcklbw	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3],xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
14542549b:     	punpcklwd	%xmm1, %xmm2    # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1],xmm2[2],xmm1[2],xmm2[3],xmm1[3]
14542549f:     	movd	-0x40(%rcx), %xmm0
1454254a4:     	movd	-0x50(%rcx), %xmm1
1454254a9:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
1454254ad:     	movd	-0x60(%rcx), %xmm0
1454254b2:     	movd	-0x70(%rcx), %xmm3
1454254b7:     	punpcklbw	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
1454254bb:     	punpcklwd	%xmm1, %xmm3    # xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1],xmm3[2],xmm1[2],xmm3[3],xmm1[3]
1454254bf:     	punpckldq	%xmm2, %xmm3    # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
1454254c3:     	movd	-0x80(%rcx), %xmm0
1454254c8:     	movd	-0x90(%rcx), %xmm1
1454254d0:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
1454254d4:     	movd	-0xa0(%rcx), %xmm0
1454254dc:     	movd	-0xb0(%rcx), %xmm2
1454254e4:     	punpcklbw	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3],xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
1454254e8:     	punpcklwd	%xmm1, %xmm2    # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1],xmm2[2],xmm1[2],xmm2[3],xmm1[3]
1454254ec:     	movd	-0xc0(%rcx), %xmm0
1454254f4:     	movd	-0xd0(%rcx), %xmm1
1454254fc:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
145425500:     	movd	-0xe0(%rcx), %xmm0
145425508:     	movd	-0xf0(%rcx), %xmm4
145425510:     	punpcklbw	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3],xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
145425514:     	punpcklwd	%xmm1, %xmm4    # xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1],xmm4[2],xmm1[2],xmm4[3],xmm1[3]
145425518:     	punpckldq	%xmm2, %xmm4    # xmm4 = xmm4[0],xmm2[0],xmm4[1],xmm2[1]
14542551c:     	punpcklqdq	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0]
145425520:     	movdqu	%xmm4, (%rbx,%rdx)
145425525:     	addq	$0x10, %rdx
145425529:     	addq	$0x100, %rcx            # imm = 0x100
145425530:     	cmpq	%rdx, %rax
145425533:     	jne	0x145425480 <.text+0x5424480>
145425539:     	cmpq	%rax, %rsi
14542553c:     	je	0x1454255d2 <.text+0x54245d2>
145425542:     	testb	$0xc, %sil
145425546:     	je	0x1454255ad <.text+0x54245ad>
145425548:     	movq	%rax, %rcx
14542554b:     	movq	%rsi, %rax
14542554e:     	andq	$-0x4, %rax
145425552:     	movq	%rcx, %rdx
145425555:     	shlq	$0x4, %rdx
145425559:     	movq	-0x18(%rbp), %r8
14542555d:     	addq	%r8, %rdx
145425560:     	addq	$0x30, %rdx
145425564:     	nopw	%cs:(%rax,%rax)
145425570:     	movzbl	-0x30(%rdx), %r8d
145425575:     	movzbl	-0x20(%rdx), %r9d
14542557a:     	movzbl	-0x10(%rdx), %r10d
14542557f:     	shll	$0x8, %r9d
145425583:     	orl	%r8d, %r9d
145425586:     	shll	$0x10, %r10d
14542558a:     	orl	%r9d, %r10d
14542558d:     	movl	(%rdx), %r8d
145425590:     	shll	$0x18, %r8d
145425594:     	orl	%r10d, %r8d
145425597:     	movl	%r8d, (%rbx,%rcx)
14542559b:     	addq	$0x4, %rcx
14542559f:     	addq	$0x40, %rdx
1454255a3:     	cmpq	%rcx, %rax
1454255a6:     	jne	0x145425570 <.text+0x5424570>
1454255a8:     	cmpq	%rax, %rsi
1454255ab:     	je	0x1454255d2 <.text+0x54245d2>
1454255ad:     	movq	%rax, %rcx
1454255b0:     	shlq	$0x4, %rcx
1454255b4:     	addq	-0x18(%rbp), %rcx
1454255b8:     	nopl	(%rax,%rax)
1454255c0:     	movzbl	(%rcx), %edx
1454255c3:     	movb	%dl, (%rbx,%rax)
1454255c6:     	incq	%rax
1454255c9:     	addq	$0x10, %rcx
1454255cd:     	cmpq	%rax, %rsi
1454255d0:     	jne	0x1454255c0 <.text+0x54245c0>
1454255d2:     	movl	$0x1, %r12d
1454255d8:     	cmpq	$0x1, %rsi
1454255dc:     	je	0x145425643 <.text+0x5424643>
1454255de:     	leaq	-0x1(%rsi), %rax
1454255e2:     	xorl	%ecx, %ecx
1454255e4:     	nopw	%cs:(%rax,%rax)
1454255f0:     	movzbl	0x1(%rbx,%rcx), %edx
1454255f5:     	cmpb	(%rbx,%rcx), %dl
1454255f8:     	je	0x145425607 <.text+0x5424607>
1454255fa:     	incq	%rcx
1454255fd:     	cmpq	%rcx, %rax
145425600:     	jne	0x1454255f0 <.text+0x54245f0>
145425602:     	movq	%rsi, %r12
145425605:     	jmp	0x145425643 <.text+0x5424643>
145425607:     	leaq	0x2(%rcx), %rax
14542560b:     	leaq	0x1(%rcx), %r12
14542560f:     	cmpq	%rsi, %rax
145425612:     	jae	0x145425643 <.text+0x5424643>
145425614:     	movl	%esi, %r8d
145425617:     	subl	%ecx, %r8d
14542561a:     	leaq	-0x3(%rsi), %rdx
14542561e:     	testb	$0x1, %r8b
145425622:     	je	0x14542563a <.text+0x542463a>
145425624:     	movzbl	0x2(%rbx,%rcx), %eax
145425629:     	cmpb	(%rbx,%rcx), %al
14542562c:     	je	0x145425636 <.text+0x5424636>
14542562e:     	movb	%al, 0x1(%rbx,%rcx)
145425632:     	leaq	0x2(%rcx), %r12
145425636:     	leaq	0x3(%rcx), %rax
14542563a:     	cmpq	%rcx, %rdx
14542563d:     	jne	0x14542583d <.text+0x542483d>
145425643:     	leaq	0x1b0(%r14), %rax
14542564a:     	movq	%rax, -0x50(%rbp)
14542564e:     	movq	%rsi, -0x40(%rbp)
145425652:     	shlq	$0x4, %rsi
145425656:     	addq	-0x18(%rbp), %rsi
14542565a:     	addq	%rbx, %r12
14542565d:     	leaq	-0x10(%rbp), %rdi
145425661:     	leaq	0x12fb549(%rip), %r14   # 0x146720bb1
145425668:     	leaq	0xb0(%rbp), %r15
14542566f:     	movq	%rbx, -0x38(%rbp)
145425673:     	jmp	0x145425683 <.text+0x5424683>
145425675:     	nopw	%cs:(%rax,%rax)
145425680:     	incq	%rbx
145425683:     	cmpq	%r12, %rbx
145425686:     	je	0x14542587c <.text+0x542487c>
14542568c:     	movzbl	(%rbx), %eax
14542568f:     	movb	%al, -0x30(%rbp)
145425692:     	movq	-0x18(%rbp), %rax
145425696:     	movq	%rax, -0x10(%rbp)
14542569a:     	movq	%rsi, -0x8(%rbp)
14542569e:     	leaq	-0x30(%rbp), %rax
1454256a2:     	movq	%rax, (%rbp)
1454256a6:     	leaq	0x90(%rbp), %rcx
1454256ad:     	movq	%rdi, %rdx
1454256b0:     	callq	0x14552a6e0 <.text+0x55296e0>
1454256b5:     	nop
1454256b6:     	movq	0x98(%rbp), %rdx
1454256bd:     	movq	0xa0(%rbp), %r8
1454256c4:     	movq	$0x1, 0x20(%rsp)
1454256cd:     	movq	%rdi, %rcx
1454256d0:     	movq	%rdx, -0x48(%rbp)
1454256d4:     	leaq	0x12fb159(%rip), %r9    # 0x146720834
1454256db:     	callq	0x145456470 <.text+0x5455470>
1454256e0:     	nop
1454256e1:     	movq	(%rbp), %rax
1454256e5:     	movq	%rax, 0xe0(%rbp)
1454256ec:     	movdqu	-0x10(%rbp), %xmm0
1454256f1:     	movdqa	%xmm0, 0xd0(%rbp)
1454256f9:     	leaq	-0x30(%rbp), %rax
1454256fd:     	movq	%rax, -0x10(%rbp)
145425701:     	leaq	0x2f5208(%rip), %rax    # 0x14571a910 <.text+0x5719910>
145425708:     	movq	%rax, -0x8(%rbp)
14542570c:     	leaq	0xd0(%rbp), %rax
145425713:     	movq	%rax, (%rbp)
145425717:     	leaq	-0x542363e(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
14542571e:     	movq	%rax, 0x8(%rbp)
145425722:     	movq	%r15, %rcx
145425725:     	movq	%r14, %rdx
145425728:     	movq	%rdi, %r8
14542572b:     	callq	0x14570bf80 <.text+0x570af80>
145425730:     	nop
145425731:     	movq	0xd0(%rbp), %rdx
145425738:     	testq	%rdx, %rdx
14542573b:     	je	0x14542574f <.text+0x542474f>
14542573d:     	movq	0xd8(%rbp), %rcx
145425744:     	movl	$0x1, %r8d
14542574a:     	callq	0x1400021d0 <.text+0x11d0>
14542574f:     	movq	0xb0(%rbp), %rax
145425756:     	movq	%rax, 0x100(%rbp)
14542575d:     	movq	0xb8(%rbp), %rax
145425764:     	movq	%rax, 0x108(%rbp)
14542576b:     	movq	0xc0(%rbp), %r13
145425772:     	movq	0xe8(%rbp), %rax
145425779:     	movq	0xf8(%rbp), %rdx
145425780:     	subq	%rdx, %rax
145425783:     	cmpq	%rax, %r13
145425786:     	ja	0x1454257fd <.text+0x54247fd>
145425788:     	testq	%r13, %r13
14542578b:     	je	0x1454257ad <.text+0x54247ad>
14542578d:     	addq	0xf0(%rbp), %rdx
145425794:     	movq	%rdx, %rcx
145425797:     	movq	0x108(%rbp), %rdx
14542579e:     	movq	%r13, %r8
1454257a1:     	callq	0x145756ddd <.text+0x5755ddd>
1454257a6:     	movq	0xf8(%rbp), %rdx
1454257ad:     	addq	%r13, %rdx
1454257b0:     	movq	%rdx, 0xf8(%rbp)
1454257b7:     	movq	0x100(%rbp), %rdx
1454257be:     	testq	%rdx, %rdx
1454257c1:     	je	0x1454257d5 <.text+0x54247d5>
1454257c3:     	movl	$0x1, %r8d
1454257c9:     	movq	0x108(%rbp), %rcx
1454257d0:     	callq	0x1400021d0 <.text+0x11d0>
1454257d5:     	movq	0x90(%rbp), %rdx
1454257dc:     	testq	%rdx, %rdx
1454257df:     	je	0x145425680 <.text+0x5424680>
1454257e5:     	shlq	$0x4, %rdx
1454257e9:     	movl	$0x8, %r8d
1454257ef:     	movq	-0x48(%rbp), %rcx
1454257f3:     	callq	0x1400021d0 <.text+0x11d0>
1454257f8:     	jmp	0x145425680 <.text+0x5424680>
1454257fd:     	movq	$0x1, 0x20(%rsp)
145425806:     	movl	$0x1, %r9d
14542580c:     	leaq	0xe8(%rbp), %rcx
145425813:     	movq	%r13, %r8
145425816:     	callq	0x145757d40 <.text+0x5756d40>
14542581b:     	nop
14542581c:     	movq	0xf8(%rbp), %rdx
145425823:     	jmp	0x14542578d <.text+0x542478d>
145425828:     	nopl	(%rax,%rax)
145425830:     	addq	$0x2, %rax
145425834:     	cmpq	%rax, %rsi
145425837:     	je	0x145425643 <.text+0x5424643>
14542583d:     	movzbl	(%rbx,%rax), %ecx
145425841:     	cmpb	-0x1(%rbx,%r12), %cl
145425846:     	jne	0x145425860 <.text+0x5424860>
145425848:     	movzbl	0x1(%rbx,%rax), %ecx
14542584d:     	cmpb	-0x1(%rbx,%r12), %cl
145425852:     	je	0x145425830 <.text+0x5424830>
145425854:     	jmp	0x145425873 <.text+0x5424873>
145425856:     	nopw	%cs:(%rax,%rax)
145425860:     	movb	%cl, (%rbx,%r12)
145425864:     	incq	%r12
145425867:     	movzbl	0x1(%rbx,%rax), %ecx
14542586c:     	cmpb	-0x1(%rbx,%r12), %cl
145425871:     	je	0x145425830 <.text+0x5424830>
145425873:     	movb	%cl, (%rbx,%r12)
145425877:     	incq	%r12
14542587a:     	jmp	0x145425830 <.text+0x5424830>
14542587c:     	movq	-0x40(%rbp), %rdx
145425880:     	testq	%rdx, %rdx
145425883:     	je	0x145425894 <.text+0x5424894>
145425885:     	movl	$0x1, %r8d
14542588b:     	movq	-0x38(%rbp), %rcx
14542588f:     	callq	0x1400021d0 <.text+0x11d0>
145425894:     	movq	0xa8(%rbp), %r14
14542589b:     	movq	0xe8(%r14), %r8
1454258a2:     	testq	%r8, %r8
1454258a5:     	je	0x145425a24 <.text+0x5424a24>
1454258ab:     	movq	0xe0(%r14), %rdx
1454258b2:     	shlq	$0x5, %r8
1454258b6:     	addq	%rdx, %r8
1454258b9:     	leaq	0xb0(%rbp), %rcx
1454258c0:     	callq	0x145534b80 <.text+0x5533b80>
1454258c5:     	nop
1454258c6:     	movq	0xb8(%rbp), %rsi
1454258cd:     	movq	0xc0(%rbp), %rdi
1454258d4:     	movq	$0x1, 0x20(%rsp)
1454258dd:     	leaq	0x12faf50(%rip), %r9    # 0x146720834
1454258e4:     	leaq	-0x10(%rbp), %rcx
1454258e8:     	movq	%rsi, %rdx
1454258eb:     	movq	%rdi, %r8
1454258ee:     	callq	0x145455eb0 <.text+0x5454eb0>
1454258f3:     	nop
1454258f4:     	movq	(%rbp), %rax
1454258f8:     	movq	%rax, 0xe0(%rbp)
1454258ff:     	movdqu	-0x10(%rbp), %xmm0
145425904:     	movdqa	%xmm0, 0xd0(%rbp)
14542590c:     	leaq	0xd0(%rbp), %rax
145425913:     	movq	%rax, 0x90(%rbp)
14542591a:     	leaq	-0x5423841(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145425921:     	movq	%rax, 0x98(%rbp)
145425928:     	leaq	0x12fb243(%rip), %rdx   # 0x146720b72
14542592f:     	leaq	-0x10(%rbp), %rcx
145425933:     	leaq	0x90(%rbp), %r8
14542593a:     	callq	0x14570bf80 <.text+0x570af80>
14542593f:     	nop
145425940:     	movq	0xd0(%rbp), %rdx
145425947:     	testq	%rdx, %rdx
14542594a:     	je	0x14542595e <.text+0x542495e>
14542594c:     	movq	0xd8(%rbp), %rcx
145425953:     	movl	$0x1, %r8d
145425959:     	callq	0x1400021d0 <.text+0x11d0>
14542595e:     	movq	-0x10(%rbp), %r15
145425962:     	movq	-0x8(%rbp), %r12
145425966:     	movq	(%rbp), %rbx
14542596a:     	movq	0xe8(%rbp), %rax
145425971:     	movq	0xf8(%rbp), %rdx
145425978:     	subq	%rdx, %rax
14542597b:     	cmpq	%rax, %rbx
14542597e:     	movq	0xa8(%rbp), %r14
145425985:     	ja	0x1454260ff <.text+0x54250ff>
14542598b:     	testq	%rbx, %rbx
14542598e:     	je	0x1454259ac <.text+0x54249ac>
145425990:     	addq	0xf0(%rbp), %rdx
145425997:     	movq	%rdx, %rcx
14542599a:     	movq	%r12, %rdx
14542599d:     	movq	%rbx, %r8
1454259a0:     	callq	0x145756ddd <.text+0x5755ddd>
1454259a5:     	movq	0xf8(%rbp), %rdx
1454259ac:     	addq	%rbx, %rdx
1454259af:     	movq	%rdx, 0xf8(%rbp)
1454259b6:     	testq	%r15, %r15
1454259b9:     	je	0x1454259cc <.text+0x54249cc>
1454259bb:     	movl	$0x1, %r8d
1454259c1:     	movq	%r12, %rcx
1454259c4:     	movq	%r15, %rdx
1454259c7:     	callq	0x1400021d0 <.text+0x11d0>
1454259cc:     	testq	%rdi, %rdi
1454259cf:     	je	0x145425a02 <.text+0x5424a02>
1454259d1:     	leaq	0x8(%rsi), %rbx
1454259d5:     	jmp	0x1454259e9 <.text+0x54249e9>
1454259d7:     	nopw	(%rax,%rax)
1454259e0:     	addq	$0x18, %rbx
1454259e4:     	decq	%rdi
1454259e7:     	je	0x145425a02 <.text+0x5424a02>
1454259e9:     	movq	-0x8(%rbx), %rdx
1454259ed:     	testq	%rdx, %rdx
1454259f0:     	je	0x1454259e0 <.text+0x54249e0>
1454259f2:     	movq	(%rbx), %rcx
1454259f5:     	movl	$0x1, %r8d
1454259fb:     	callq	0x1400021d0 <.text+0x11d0>
145425a00:     	jmp	0x1454259e0 <.text+0x54249e0>
145425a02:     	movq	0xb0(%rbp), %rax
145425a09:     	testq	%rax, %rax
145425a0c:     	je	0x145425a24 <.text+0x5424a24>
145425a0e:     	shlq	$0x3, %rax
145425a12:     	leaq	(%rax,%rax,2), %rdx
145425a16:     	movl	$0x8, %r8d
145425a1c:     	movq	%rsi, %rcx
145425a1f:     	callq	0x1400021d0 <.text+0x11d0>
145425a24:     	movq	0x100(%r14), %rax
145425a2b:     	testq	%rax, %rax
145425a2e:     	je	0x145425ba4 <.text+0x5424ba4>
145425a34:     	movq	0xf8(%r14), %rdx
145425a3b:     	leaq	(%rdx,%rax,4), %r8
145425a3f:     	leaq	0xb0(%rbp), %rcx
145425a46:     	callq	0x1455353f0 <.text+0x55343f0>
145425a4b:     	nop
145425a4c:     	movq	0xb8(%rbp), %rsi
145425a53:     	movq	0xc0(%rbp), %rdi
145425a5a:     	movq	$0x1, 0x20(%rsp)
145425a63:     	leaq	0x12fadca(%rip), %r9    # 0x146720834
145425a6a:     	leaq	-0x10(%rbp), %rcx
145425a6e:     	movq	%rsi, %rdx
145425a71:     	movq	%rdi, %r8
145425a74:     	callq	0x145455eb0 <.text+0x5454eb0>
145425a79:     	nop
145425a7a:     	movq	(%rbp), %rax
145425a7e:     	movq	%rax, 0xe0(%rbp)
145425a85:     	movdqu	-0x10(%rbp), %xmm0
145425a8a:     	movdqa	%xmm0, 0xd0(%rbp)
145425a92:     	leaq	0xd0(%rbp), %rax
145425a99:     	movq	%rax, 0x90(%rbp)
145425aa0:     	leaq	-0x54239c7(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145425aa7:     	movq	%rax, 0x98(%rbp)
145425aae:     	leaq	0x12fb0c7(%rip), %rdx   # 0x146720b7c
145425ab5:     	leaq	-0x10(%rbp), %rcx
145425ab9:     	leaq	0x90(%rbp), %r8
145425ac0:     	callq	0x14570bf80 <.text+0x570af80>
145425ac5:     	nop
145425ac6:     	movq	0xd0(%rbp), %rdx
145425acd:     	testq	%rdx, %rdx
145425ad0:     	je	0x145425ae4 <.text+0x5424ae4>
145425ad2:     	movq	0xd8(%rbp), %rcx
145425ad9:     	movl	$0x1, %r8d
145425adf:     	callq	0x1400021d0 <.text+0x11d0>
145425ae4:     	movq	-0x10(%rbp), %r15
145425ae8:     	movq	-0x8(%rbp), %r12
145425aec:     	movq	(%rbp), %rbx
145425af0:     	movq	0xe8(%rbp), %rax
145425af7:     	movq	0xf8(%rbp), %rdx
145425afe:     	subq	%rdx, %rax
145425b01:     	cmpq	%rax, %rbx
145425b04:     	movq	0xa8(%rbp), %r14
145425b0b:     	ja	0x145426146 <.text+0x5425146>
145425b11:     	testq	%rbx, %rbx
145425b14:     	je	0x145425b32 <.text+0x5424b32>
145425b16:     	addq	0xf0(%rbp), %rdx
145425b1d:     	movq	%rdx, %rcx
145425b20:     	movq	%r12, %rdx
145425b23:     	movq	%rbx, %r8
145425b26:     	callq	0x145756ddd <.text+0x5755ddd>
145425b2b:     	movq	0xf8(%rbp), %rdx
145425b32:     	addq	%rbx, %rdx
145425b35:     	movq	%rdx, 0xf8(%rbp)
145425b3c:     	testq	%r15, %r15
145425b3f:     	je	0x145425b52 <.text+0x5424b52>
145425b41:     	movl	$0x1, %r8d
145425b47:     	movq	%r12, %rcx
145425b4a:     	movq	%r15, %rdx
145425b4d:     	callq	0x1400021d0 <.text+0x11d0>
145425b52:     	testq	%rdi, %rdi
145425b55:     	je	0x145425b82 <.text+0x5424b82>
145425b57:     	leaq	0x8(%rsi), %rbx
145425b5b:     	jmp	0x145425b69 <.text+0x5424b69>
145425b5d:     	nopl	(%rax)
145425b60:     	addq	$0x18, %rbx
145425b64:     	decq	%rdi
145425b67:     	je	0x145425b82 <.text+0x5424b82>
145425b69:     	movq	-0x8(%rbx), %rdx
145425b6d:     	testq	%rdx, %rdx
145425b70:     	je	0x145425b60 <.text+0x5424b60>
145425b72:     	movq	(%rbx), %rcx
145425b75:     	movl	$0x1, %r8d
145425b7b:     	callq	0x1400021d0 <.text+0x11d0>
145425b80:     	jmp	0x145425b60 <.text+0x5424b60>
145425b82:     	movq	0xb0(%rbp), %rax
145425b89:     	testq	%rax, %rax
145425b8c:     	je	0x145425ba4 <.text+0x5424ba4>
145425b8e:     	shlq	$0x3, %rax
145425b92:     	leaq	(%rax,%rax,2), %rdx
145425b96:     	movl	$0x8, %r8d
145425b9c:     	movq	%rsi, %rcx
145425b9f:     	callq	0x1400021d0 <.text+0x11d0>
145425ba4:     	movq	0x118(%r14), %r8
145425bab:     	testq	%r8, %r8
145425bae:     	je	0x145425cad <.text+0x5424cad>
145425bb4:     	movq	0x110(%r14), %rdx
145425bbb:     	movq	$0x1, 0x20(%rsp)
145425bc4:     	leaq	0x12fac69(%rip), %r9    # 0x146720834
145425bcb:     	leaq	-0x10(%rbp), %rcx
145425bcf:     	callq	0x145455eb0 <.text+0x5454eb0>
145425bd4:     	nop
145425bd5:     	movq	(%rbp), %rax
145425bd9:     	movq	%rax, 0xe0(%rbp)
145425be0:     	movdqu	-0x10(%rbp), %xmm0
145425be5:     	movdqa	%xmm0, 0xd0(%rbp)
145425bed:     	leaq	0xd0(%rbp), %rax
145425bf4:     	movq	%rax, 0xb0(%rbp)
145425bfb:     	leaq	-0x5423b22(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145425c02:     	movq	%rax, 0xb8(%rbp)
145425c09:     	leaq	0x12faf78(%rip), %rdx   # 0x146720b88
145425c10:     	leaq	-0x10(%rbp), %rcx
145425c14:     	leaq	0xb0(%rbp), %r8
145425c1b:     	callq	0x14570bf80 <.text+0x570af80>
145425c20:     	nop
145425c21:     	movq	0xd0(%rbp), %rdx
145425c28:     	testq	%rdx, %rdx
145425c2b:     	je	0x145425c3f <.text+0x5424c3f>
145425c2d:     	movq	0xd8(%rbp), %rcx
145425c34:     	movl	$0x1, %r8d
145425c3a:     	callq	0x1400021d0 <.text+0x11d0>
145425c3f:     	movq	-0x10(%rbp), %rdi
145425c43:     	movq	-0x8(%rbp), %rbx
145425c47:     	movq	(%rbp), %rsi
145425c4b:     	movq	0xe8(%rbp), %rax
145425c52:     	movq	0xf8(%rbp), %rdx
145425c59:     	subq	%rdx, %rax
145425c5c:     	cmpq	%rax, %rsi
145425c5f:     	ja	0x14542618d <.text+0x542518d>
145425c65:     	testq	%rsi, %rsi
145425c68:     	movq	0xa8(%rbp), %r14
145425c6f:     	je	0x145425c8d <.text+0x5424c8d>
145425c71:     	addq	0xf0(%rbp), %rdx
145425c78:     	movq	%rdx, %rcx
145425c7b:     	movq	%rbx, %rdx
145425c7e:     	movq	%rsi, %r8
145425c81:     	callq	0x145756ddd <.text+0x5755ddd>
145425c86:     	movq	0xf8(%rbp), %rdx
145425c8d:     	addq	%rsi, %rdx
145425c90:     	movq	%rdx, 0xf8(%rbp)
145425c97:     	testq	%rdi, %rdi
145425c9a:     	je	0x145425cad <.text+0x5424cad>
145425c9c:     	movl	$0x1, %r8d
145425ca2:     	movq	%rbx, %rcx
145425ca5:     	movq	%rdi, %rdx
145425ca8:     	callq	0x1400021d0 <.text+0x11d0>
145425cad:     	movq	-0x50(%rbp), %rax
145425cb1:     	cmpl	$0x0, (%rax)
145425cb4:     	je	0x145425d55 <.text+0x5424d55>
145425cba:     	movq	%rax, 0xd0(%rbp)
145425cc1:     	leaq	0x2f8378(%rip), %rax    # 0x14571e040 <.text+0x571d040>
145425cc8:     	movq	%rax, 0xd8(%rbp)
145425ccf:     	leaq	0x12faebc(%rip), %rdx   # 0x146720b92
145425cd6:     	leaq	-0x10(%rbp), %rcx
145425cda:     	leaq	0xd0(%rbp), %r8
145425ce1:     	callq	0x14570bf80 <.text+0x570af80>
145425ce6:     	nop
145425ce7:     	movq	-0x10(%rbp), %rdi
145425ceb:     	movq	-0x8(%rbp), %rbx
145425cef:     	movq	(%rbp), %rsi
145425cf3:     	movq	0xe8(%rbp), %rax
145425cfa:     	movq	0xf8(%rbp), %rdx
145425d01:     	subq	%rdx, %rax
145425d04:     	cmpq	%rax, %rsi
145425d07:     	ja	0x1454261db <.text+0x54251db>
145425d0d:     	testq	%rsi, %rsi
145425d10:     	movq	0xa8(%rbp), %r14
145425d17:     	je	0x145425d35 <.text+0x5424d35>
145425d19:     	addq	0xf0(%rbp), %rdx
145425d20:     	movq	%rdx, %rcx
145425d23:     	movq	%rbx, %rdx
145425d26:     	movq	%rsi, %r8
145425d29:     	callq	0x145756ddd <.text+0x5755ddd>
145425d2e:     	movq	0xf8(%rbp), %rdx
145425d35:     	addq	%rsi, %rdx
145425d38:     	movq	%rdx, 0xf8(%rbp)
145425d3f:     	testq	%rdi, %rdi
145425d42:     	je	0x145425d55 <.text+0x5424d55>
145425d44:     	movl	$0x1, %r8d
145425d4a:     	movq	%rbx, %rcx
145425d4d:     	movq	%rdi, %rdx
145425d50:     	callq	0x1400021d0 <.text+0x11d0>
145425d55:     	movq	0x128(%r14), %rdi
145425d5c:     	movq	0x130(%r14), %rax
145425d63:     	leaq	(%rdi,%rax,8), %r15
145425d67:     	leaq	-0x10(%rbp), %r14
145425d6b:     	leaq	0xb0(%rbp), %r12
145425d72:     	jmp	0x145425d83 <.text+0x5424d83>
145425d74:     	nopw	%cs:(%rax,%rax)
145425d80:     	movq	%r13, %rdi
145425d83:     	cmpq	%r15, %rdi
145425d86:     	je	0x145425f76 <.text+0x5424f76>
145425d8c:     	leaq	0x8(%rdi), %r13
145425d90:     	leaq	0x3(%rdi), %rdx
145425d94:     	leaq	0x90(%rbp), %rcx
145425d9b:     	movq	%r13, %r8
145425d9e:     	callq	0x145535220 <.text+0x5534220>
145425da3:     	nop
145425da4:     	movq	0x98(%rbp), %rbx
145425dab:     	movq	0xa0(%rbp), %rsi
145425db2:     	movq	$0x1, 0x20(%rsp)
145425dbb:     	movq	%r14, %rcx
145425dbe:     	movq	%rbx, %rdx
145425dc1:     	movq	%rsi, %r8
145425dc4:     	leaq	0x12faa69(%rip), %r9    # 0x146720834
145425dcb:     	callq	0x145455eb0 <.text+0x5454eb0>
145425dd0:     	nop
145425dd1:     	leaq	0x2(%rdi), %rax
145425dd5:     	movq	(%rbp), %rcx
145425dd9:     	movq	%rcx, 0xe0(%rbp)
145425de0:     	movdqu	-0x10(%rbp), %xmm0
145425de5:     	movdqa	%xmm0, 0xd0(%rbp)
145425ded:     	movq	%rdi, -0x10(%rbp)
145425df1:     	incq	%rdi
145425df4:     	leaq	0x2f4b15(%rip), %rcx    # 0x14571a910 <.text+0x5719910>
145425dfb:     	movq	%rcx, -0x8(%rbp)
145425dff:     	movq	%rdi, (%rbp)
145425e03:     	movq	%rcx, 0x8(%rbp)
145425e07:     	movq	%rax, 0x10(%rbp)
145425e0b:     	movq	%rcx, 0x18(%rbp)
145425e0f:     	leaq	0xd0(%rbp), %rax
145425e16:     	movq	%rax, 0x20(%rbp)
145425e1a:     	leaq	-0x5423d41(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145425e21:     	movq	%rax, 0x28(%rbp)
145425e25:     	movq	%r12, %rcx
145425e28:     	leaq	0x12fad6f(%rip), %rdx   # 0x146720b9e
145425e2f:     	movq	%r14, %r8
145425e32:     	callq	0x14570bf80 <.text+0x570af80>
145425e37:     	nop
145425e38:     	movq	0xd0(%rbp), %rdx
145425e3f:     	testq	%rdx, %rdx
145425e42:     	je	0x145425e56 <.text+0x5424e56>
145425e44:     	movq	0xd8(%rbp), %rcx
145425e4b:     	movl	$0x1, %r8d
145425e51:     	callq	0x1400021d0 <.text+0x11d0>
145425e56:     	movq	0xb0(%rbp), %rax
145425e5d:     	movq	%rax, 0x100(%rbp)
145425e64:     	movq	0xb8(%rbp), %rax
145425e6b:     	movq	%rax, 0x108(%rbp)
145425e72:     	movq	0xc0(%rbp), %rdi
145425e79:     	movq	0xe8(%rbp), %rax
145425e80:     	movq	0xf8(%rbp), %rdx
145425e87:     	subq	%rdx, %rax
145425e8a:     	cmpq	%rax, %rdi
145425e8d:     	ja	0x145425f4b <.text+0x5424f4b>
145425e93:     	testq	%rdi, %rdi
145425e96:     	je	0x145425eb8 <.text+0x5424eb8>
145425e98:     	addq	0xf0(%rbp), %rdx
145425e9f:     	movq	%rdx, %rcx
145425ea2:     	movq	0x108(%rbp), %rdx
145425ea9:     	movq	%rdi, %r8
145425eac:     	callq	0x145756ddd <.text+0x5755ddd>
145425eb1:     	movq	0xf8(%rbp), %rdx
145425eb8:     	addq	%rdi, %rdx
145425ebb:     	movq	%rdx, 0xf8(%rbp)
145425ec2:     	movq	0x100(%rbp), %rdx
145425ec9:     	testq	%rdx, %rdx
145425ecc:     	je	0x145425ee0 <.text+0x5424ee0>
145425ece:     	movl	$0x1, %r8d
145425ed4:     	movq	0x108(%rbp), %rcx
145425edb:     	callq	0x1400021d0 <.text+0x11d0>
145425ee0:     	testq	%rsi, %rsi
145425ee3:     	je	0x145425f20 <.text+0x5424f20>
145425ee5:     	leaq	0x8(%rbx), %rdi
145425ee9:     	jmp	0x145425ef9 <.text+0x5424ef9>
145425eeb:     	nopl	(%rax,%rax)
145425ef0:     	addq	$0x18, %rdi
145425ef4:     	decq	%rsi
145425ef7:     	je	0x145425f20 <.text+0x5424f20>
145425ef9:     	movq	-0x8(%rdi), %rdx
145425efd:     	testq	%rdx, %rdx
145425f00:     	je	0x145425ef0 <.text+0x5424ef0>
145425f02:     	movq	(%rdi), %rcx
145425f05:     	movl	$0x1, %r8d
145425f0b:     	callq	0x1400021d0 <.text+0x11d0>
145425f10:     	jmp	0x145425ef0 <.text+0x5424ef0>
145425f12:     	nopw	%cs:(%rax,%rax)
145425f20:     	movq	0x90(%rbp), %rax
145425f27:     	testq	%rax, %rax
145425f2a:     	je	0x145425d80 <.text+0x5424d80>
145425f30:     	shlq	$0x3, %rax
145425f34:     	leaq	(%rax,%rax,2), %rdx
145425f38:     	movl	$0x8, %r8d
145425f3e:     	movq	%rbx, %rcx
145425f41:     	callq	0x1400021d0 <.text+0x11d0>
145425f46:     	jmp	0x145425d80 <.text+0x5424d80>
145425f4b:     	movq	$0x1, 0x20(%rsp)
145425f54:     	movl	$0x1, %r9d
145425f5a:     	leaq	0xe8(%rbp), %rcx
145425f61:     	movq	%rdi, %r8
145425f64:     	callq	0x145757d40 <.text+0x5756d40>
145425f69:     	nop
145425f6a:     	movq	0xf8(%rbp), %rdx
145425f71:     	jmp	0x145425e98 <.text+0x5424e98>
145425f76:     	movq	0xf8(%rbp), %rcx
145425f7d:     	movq	-0x58(%rbp), %rax
145425f81:     	movq	%rcx, 0x10(%rax)
145425f85:     	movups	0xe8(%rbp), %xmm0
145425f8c:     	movups	%xmm0, (%rax)
145425f8f:     	addq	$0x198, %rsp            # imm = 0x198
145425f96:     	popq	%rbx
145425f97:     	popq	%rdi
145425f98:     	popq	%rsi
145425f99:     	popq	%r12
145425f9b:     	popq	%r13
145425f9d:     	popq	%r14
145425f9f:     	popq	%r15
145425fa1:     	popq	%rbp
145425fa2:     	retq
145425fa3:     	movq	%rdi, 0x108(%rbp)
145425faa:     	movq	$0x1, 0x20(%rsp)
145425fb3:     	leaq	0xe8(%rbp), %rcx
145425fba:     	movl	$0x1, %r9d
145425fc0:     	movq	%rsi, %r8
145425fc3:     	callq	0x145757d40 <.text+0x5756d40>
145425fc8:     	nop
145425fc9:     	movq	0xf8(%rbp), %rdx
145425fd0:     	movq	0x108(%rbp), %rdi
145425fd7:     	jmp	0x14542451b <.text+0x542351b>
145425fdc:     	movq	%r12, 0x100(%rbp)
145425fe3:     	movq	%r15, 0x108(%rbp)
145425fea:     	movq	$0x1, 0x20(%rsp)
145425ff3:     	leaq	0xe8(%rbp), %rcx
145425ffa:     	movl	$0x1, %r9d
145426000:     	movq	%rbx, %r8
145426003:     	callq	0x145757d40 <.text+0x5756d40>
145426008:     	nop
145426009:     	movq	0xf8(%rbp), %rdx
145426010:     	movq	0x108(%rbp), %r15
145426017:     	movq	0x100(%rbp), %r12
14542601e:     	jmp	0x1454247b8 <.text+0x54237b8>
145426023:     	movq	%r12, 0x100(%rbp)
14542602a:     	movq	%r15, 0x108(%rbp)
145426031:     	movq	$0x1, 0x20(%rsp)
14542603a:     	leaq	0xe8(%rbp), %rcx
145426041:     	movl	$0x1, %r9d
145426047:     	movq	%rbx, %r8
14542604a:     	callq	0x145757d40 <.text+0x5756d40>
14542604f:     	nop
145426050:     	movq	0xf8(%rbp), %rdx
145426057:     	movq	0x108(%rbp), %r15
14542605e:     	movq	0x100(%rbp), %r12
145426065:     	jmp	0x145424f15 <.text+0x5423f15>
14542606a:     	movq	%rbx, 0x100(%rbp)
145426071:     	movq	%rdi, 0x108(%rbp)
145426078:     	movq	$0x1, 0x20(%rsp)
145426081:     	leaq	0xe8(%rbp), %rcx
145426088:     	movl	$0x1, %r9d
14542608e:     	movq	%rsi, %r8
145426091:     	callq	0x145757d40 <.text+0x5756d40>
145426096:     	nop
145426097:     	movq	0xa8(%rbp), %r14
14542609e:     	movq	0xf8(%rbp), %rdx
1454260a5:     	movq	0x108(%rbp), %rdi
1454260ac:     	movq	0x100(%rbp), %rbx
1454260b3:     	jmp	0x145425071 <.text+0x5424071>
1454260b8:     	movq	%r12, 0x100(%rbp)
1454260bf:     	movq	%r15, 0x108(%rbp)
1454260c6:     	movq	$0x1, 0x20(%rsp)
1454260cf:     	leaq	0xe8(%rbp), %rcx
1454260d6:     	movl	$0x1, %r9d
1454260dc:     	movq	%rbx, %r8
1454260df:     	callq	0x145757d40 <.text+0x5756d40>
1454260e4:     	nop
1454260e5:     	movq	0xf8(%rbp), %rdx
1454260ec:     	movq	0x108(%rbp), %r15
1454260f3:     	movq	0x100(%rbp), %r12
1454260fa:     	jmp	0x1454251a2 <.text+0x54241a2>
1454260ff:     	movq	%r12, 0x100(%rbp)
145426106:     	movq	%r15, 0x108(%rbp)
14542610d:     	movq	$0x1, 0x20(%rsp)
145426116:     	leaq	0xe8(%rbp), %rcx
14542611d:     	movl	$0x1, %r9d
145426123:     	movq	%rbx, %r8
145426126:     	callq	0x145757d40 <.text+0x5756d40>
14542612b:     	nop
14542612c:     	movq	0xf8(%rbp), %rdx
145426133:     	movq	0x108(%rbp), %r15
14542613a:     	movq	0x100(%rbp), %r12
145426141:     	jmp	0x145425990 <.text+0x5424990>
145426146:     	movq	%r12, 0x100(%rbp)
14542614d:     	movq	%r15, 0x108(%rbp)
145426154:     	movq	$0x1, 0x20(%rsp)
14542615d:     	leaq	0xe8(%rbp), %rcx
145426164:     	movl	$0x1, %r9d
14542616a:     	movq	%rbx, %r8
14542616d:     	callq	0x145757d40 <.text+0x5756d40>
145426172:     	nop
145426173:     	movq	0xf8(%rbp), %rdx
14542617a:     	movq	0x108(%rbp), %r15
145426181:     	movq	0x100(%rbp), %r12
145426188:     	jmp	0x145425b16 <.text+0x5424b16>
14542618d:     	movq	%rbx, 0x100(%rbp)
145426194:     	movq	%rdi, 0x108(%rbp)
14542619b:     	movq	$0x1, 0x20(%rsp)
1454261a4:     	leaq	0xe8(%rbp), %rcx
1454261ab:     	movl	$0x1, %r9d
1454261b1:     	movq	%rsi, %r8
1454261b4:     	callq	0x145757d40 <.text+0x5756d40>
1454261b9:     	nop
1454261ba:     	movq	0xa8(%rbp), %r14
1454261c1:     	movq	0xf8(%rbp), %rdx
1454261c8:     	movq	0x108(%rbp), %rdi
1454261cf:     	movq	0x100(%rbp), %rbx
1454261d6:     	jmp	0x145425c71 <.text+0x5424c71>
1454261db:     	movq	%rbx, 0x100(%rbp)
1454261e2:     	movq	%rdi, 0x108(%rbp)
1454261e9:     	movq	$0x1, 0x20(%rsp)
1454261f2:     	leaq	0xe8(%rbp), %rcx
1454261f9:     	movl	$0x1, %r9d
1454261ff:     	movq	%rsi, %r8
145426202:     	callq	0x145757d40 <.text+0x5756d40>
145426207:     	nop
145426208:     	movq	0xf8(%rbp), %rdx
14542620f:     	movq	0xa8(%rbp), %r14
145426216:     	movq	0x108(%rbp), %rdi
14542621d:     	movq	0x100(%rbp), %rbx
145426224:     	jmp	0x145425d19 <.text+0x5424d19>
145426229:     	movq	%r12, 0x100(%rbp)
145426230:     	movq	%r15, 0x108(%rbp)
145426237:     	movq	$0x1, 0x20(%rsp)
145426240:     	leaq	0xe8(%rbp), %rcx
145426247:     	movl	$0x1, %r9d
14542624d:     	movq	%rbx, %r8
145426250:     	callq	0x145757d40 <.text+0x5756d40>
145426255:     	nop
145426256:     	movq	0xf8(%rbp), %rdx
14542625d:     	movq	0x108(%rbp), %r15
145426264:     	movq	0x100(%rbp), %r12
14542626b:     	jmp	0x145425373 <.text+0x5424373>
145426270:     	leaq	0x12fa891(%rip), %r8    # 0x146720b08
145426277:     	movl	$0xc, %edx
14542627c:     	movq	$-0x1, %rcx
145426283:     	callq	0x1458e75b3 <.text+0x58e65b3>
145426288:     	nop
145426289:     	jmp	0x145426299 <.text+0x5425299>
14542628b:     	movl	$0x1, %ecx
145426290:     	movq	%rsi, %rdx
145426293:     	callq	0x1458e721b <.text+0x58e621b>
145426298:     	nop
145426299:     	ud2

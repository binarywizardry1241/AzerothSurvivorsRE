
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c2040:     	pushq	%rbp
1454c2041:     	pushq	%r15
1454c2043:     	pushq	%r14
1454c2045:     	pushq	%r13
1454c2047:     	pushq	%r12
1454c2049:     	pushq	%rsi
1454c204a:     	pushq	%rdi
1454c204b:     	pushq	%rbx
1454c204c:     	subq	$0x278, %rsp            # imm = 0x278
1454c2053:     	leaq	0x80(%rsp), %rbp
1454c205b:     	movaps	%xmm15, 0x1e0(%rbp)
1454c2063:     	movaps	%xmm14, 0x1d0(%rbp)
1454c206b:     	movaps	%xmm13, 0x1c0(%rbp)
1454c2073:     	movaps	%xmm12, 0x1b0(%rbp)
1454c207b:     	movaps	%xmm11, 0x1a0(%rbp)
1454c2083:     	movaps	%xmm10, 0x190(%rbp)
1454c208b:     	movaps	%xmm9, 0x180(%rbp)
1454c2093:     	movaps	%xmm8, 0x170(%rbp)
1454c209b:     	movaps	%xmm7, 0x160(%rbp)
1454c20a2:     	movaps	%xmm6, 0x150(%rbp)
1454c20a9:     	movq	$-0x2, 0x148(%rbp)
1454c20b4:     	movq	%r8, %rdi
1454c20b7:     	movq	%rdx, %r14
1454c20ba:     	movq	%rcx, %rsi
1454c20bd:     	movq	0x4d0(%rcx), %r8
1454c20c4:     	testq	%r8, %r8
1454c20c7:     	je	0x1454c20e3 <.text+0x54c10e3>
1454c20c9:     	movq	0x4c8(%rsi), %rax
1454c20d0:     	movl	%r8d, %edx
1454c20d3:     	andl	$0x3, %edx
1454c20d6:     	cmpq	$0x4, %r8
1454c20da:     	jae	0x1454c20ea <.text+0x54c10ea>
1454c20dc:     	xorl	%r9d, %r9d
1454c20df:     	xorl	%ecx, %ecx
1454c20e1:     	jmp	0x1454c2149 <.text+0x54c1149>
1454c20e3:     	xorl	%ecx, %ecx
1454c20e5:     	jmp	0x1454c2187 <.text+0x54c1187>
1454c20ea:     	andq	$-0x4, %r8
1454c20ee:     	leaq	0x488(%rax), %r10
1454c20f5:     	xorl	%r9d, %r9d
1454c20f8:     	xorl	%ecx, %ecx
1454c20fa:     	nopw	(%rax,%rax)
1454c2100:     	movl	-0x420(%r10), %r11d
1454c2107:     	movl	-0x2c0(%r10), %ebx
1454c210e:     	xorq	$0x1, %r11
1454c2112:     	addq	%rcx, %r11
1454c2115:     	xorq	$0x1, %rbx
1454c2119:     	movl	-0x160(%r10), %r15d
1454c2120:     	xorq	$0x1, %r15
1454c2124:     	addq	%rbx, %r15
1454c2127:     	addq	%r11, %r15
1454c212a:     	movl	(%r10), %ecx
1454c212d:     	xorq	$0x1, %rcx
1454c2131:     	addq	%r15, %rcx
1454c2134:     	addq	$0x4, %r9
1454c2138:     	addq	$0x580, %r10            # imm = 0x580
1454c213f:     	cmpq	%r9, %r8
1454c2142:     	jne	0x1454c2100 <.text+0x54c1100>
1454c2144:     	testq	%rdx, %rdx
1454c2147:     	je	0x1454c2187 <.text+0x54c1187>
1454c2149:     	imulq	$0x160, %r9, %r8        # imm = 0x160
1454c2150:     	addq	%r8, %rax
1454c2153:     	addq	$0x68, %rax
1454c2157:     	imulq	$0x160, %rdx, %rdx      # imm = 0x160
1454c215e:     	xorl	%r8d, %r8d
1454c2161:     	nopw	%cs:(%rax,%rax)
1454c2170:     	movl	(%rax,%r8), %r9d
1454c2174:     	xorq	$0x1, %r9
1454c2178:     	addq	%r9, %rcx
1454c217b:     	addq	$0x160, %r8             # imm = 0x160
1454c2182:     	cmpq	%r8, %rdx
1454c2185:     	jne	0x1454c2170 <.text+0x54c1170>
1454c2187:     	movzwl	0x230(%rsi), %eax
1454c218e:     	cvtsi2ss	%eax, %xmm0
1454c2192:     	divss	0x429392(%rip), %xmm0   # 0x1458eb52c
1454c219a:     	mulss	0x505712(%rip), %xmm0   # 0x1459c78b4
1454c21a2:     	cvttss2si	%xmm0, %rax
1454c21a7:     	movq	%rax, %rdx
1454c21aa:     	sarq	$0x3f, %rdx
1454c21ae:     	movaps	%xmm0, %xmm1
1454c21b1:     	subss	0x429027(%rip), %xmm1   # 0x1458eb1e0
1454c21b9:     	cvttss2si	%xmm1, %r8
1454c21be:     	andq	%rdx, %r8
1454c21c1:     	orq	%rax, %r8
1454c21c4:     	xorl	%eax, %eax
1454c21c6:     	xorps	%xmm1, %xmm1
1454c21c9:     	ucomiss	%xmm1, %xmm0
1454c21cc:     	cmovbq	%rax, %r8
1454c21d0:     	ucomiss	0x42900d(%rip), %xmm0   # 0x1458eb1e4
1454c21d7:     	movq	$-0x1, %rdx
1454c21de:     	cmovbeq	%r8, %rdx
1454c21e2:     	cmpq	$0x33, %rdx
1454c21e6:     	movl	$0x32, %r8d
1454c21ec:     	cmovaeq	%rdx, %r8
1454c21f0:     	cmpq	$0x78, %r8
1454c21f4:     	movl	$0x78, %edx
1454c21f9:     	cmovbq	%r8, %rdx
1454c21fd:     	cmpq	%rdx, %rcx
1454c2200:     	jae	0x1454c28c6 <.text+0x54c18c6>
1454c2206:     	movq	0x210(%rsi), %rcx
1454c220d:     	movq	0x218(%rsi), %rdx
1454c2214:     	callq	0x14540e820 <.text+0x540d820>
1454c2219:     	imulq	$0xf0, %rax, %rax
1454c2220:     	leaq	0x1254211(%rip), %rbx   # 0x146716438
1454c2227:     	movq	0x80(%rax,%rbx), %rdx
1454c222f:     	leaq	-0x1(%rdx), %rcx
1454c2233:     	cmpq	%r14, %rcx
1454c2236:     	cmovbq	%rcx, %r14
1454c223a:     	cmpq	%rdx, %r14
1454c223d:     	jae	0x1454c292b <.text+0x54c192b>
1454c2243:     	addq	%rax, %rbx
1454c2246:     	leaq	(%r14,%r14,4), %r15
1454c224a:     	shlq	$0x4, %r15
1454c224e:     	addq	0x78(%rbx), %r15
1454c2252:     	cmpb	$0x0, (%rdi)
1454c2255:     	je	0x1454c226d <.text+0x54c126d>
1454c2257:     	movl	0xc(%rdi), %eax
1454c225a:     	movl	%eax, 0x140(%rbp)
1454c2260:     	movq	0x4(%rdi), %rax
1454c2264:     	movq	%rax, 0x138(%rbp)
1454c226b:     	jmp	0x1454c2294 <.text+0x54c1294>
1454c226d:     	movl	$0x3f000000, 0x20(%rsp) # imm = 0x3F000000
1454c2275:     	leaq	0x138(%rbp), %rcx
1454c227c:     	movss	0x47c29c(%rip), %xmm2   # 0x14593e520
1454c2284:     	movss	0x448c3c(%rip), %xmm3   # 0x14590aec8
1454c228c:     	movq	%rsi, %rdx
1454c228f:     	callq	0x1454c17b0 <.text+0x54c07b0>
1454c2294:     	movss	0x8e4(%rsi), %xmm0
1454c229c:     	movaps	%xmm0, %xmm6
1454c229f:     	divss	0x46ec59(%rip), %xmm6   # 0x145930f00
1454c22a7:     	xorps	%xmm7, %xmm7
1454c22aa:     	cmpl	$0x1, 0x858(%rsi)
1454c22b1:     	jne	0x1454c22d6 <.text+0x54c12d6>
1454c22b3:     	cmpb	$0x0, 0x952(%rsi)
1454c22ba:     	je	0x1454c22d6 <.text+0x54c12d6>
1454c22bc:     	subss	0x85c(%rsi), %xmm0
1454c22c4:     	divss	0x46ec34(%rip), %xmm0   # 0x145930f00
1454c22cc:     	xorps	%xmm1, %xmm1
1454c22cf:     	maxss	%xmm1, %xmm0
1454c22d3:     	movaps	%xmm0, %xmm7
1454c22d6:     	movzbl	0x4c(%r15), %edx
1454c22db:     	leaq	0x2e54e(%rip), %rax     # 0x1454f0830 <.text+0x54ef830>
1454c22e2:     	leaq	0x2e597(%rip), %rcx     # 0x1454f0880 <.text+0x54ef880>
1454c22e9:     	movb	%dl, 0x147(%rbp)
1454c22ef:     	testb	%dl, %dl
1454c22f1:     	cmovneq	%rax, %rcx
1454c22f5:     	movzwl	0x236(%rsi), %eax
1454c22fc:     	movw	%ax, 0x144(%rbp)
1454c2303:     	movss	0xe0(%rbx), %xmm9
1454c230c:     	mulss	0x944(%rsi), %xmm9
1454c2315:     	movd	0x232(%rsi), %xmm12
1454c231e:     	movss	0x30(%r15), %xmm14
1454c2324:     	movaps	%xmm6, %xmm0
1454c2327:     	movaps	%xmm9, %xmm1
1454c232b:     	callq	*%rcx
1454c232d:     	movaps	%xmm0, %xmm8
1454c2331:     	movss	0x34(%r15), %xmm0
1454c2337:     	movaps	%xmm0, 0x120(%rbp)
1454c233e:     	movl	0x20(%r15), %eax
1454c2342:     	movq	%rax, 0x130(%rbp)
1454c2349:     	movl	0x904(%rsi), %r13d
1454c2350:     	incl	%r13d
1454c2353:     	movl	%r13d, 0x904(%rsi)
1454c235a:     	movq	0x880(%rsi), %r14
1454c2361:     	movq	0x888(%rsi), %rdi
1454c2368:     	movq	0x898(%rsi), %rbx
1454c236f:     	movq	0x890(%rsi), %r12
1454c2376:     	movss	0x42917d(%rip), %xmm13  # 0x1458eb4fc
1454c237f:     	movss	0x42ac8d(%rip), %xmm0   # 0x1458ed014
1454c2387:     	nopw	(%rax,%rax)
1454c2390:     	leaq	(%r14,%rbx), %rax
1454c2394:     	rolq	$0x17, %rax
1454c2398:     	addq	%r14, %rax
1454c239b:     	movq	%rdi, %rcx
1454c239e:     	shlq	$0x11, %rcx
1454c23a2:     	xorq	%r14, %r12
1454c23a5:     	xorq	%rdi, %rbx
1454c23a8:     	xorq	%r12, %rdi
1454c23ab:     	xorq	%rbx, %r14
1454c23ae:     	rolq	$0x2d, %rbx
1454c23b2:     	xorq	%rcx, %r12
1454c23b5:     	shrq	$0x29, %rax
1454c23b9:     	orl	$0x3f800000, %eax       # imm = 0x3F800000
1454c23be:     	movd	%eax, %xmm11
1454c23c3:     	addss	%xmm13, %xmm11
1454c23c8:     	mulss	%xmm0, %xmm11
1454c23cd:     	ucomiss	%xmm11, %xmm0
1454c23d1:     	jbe	0x1454c2390 <.text+0x54c1390>
1454c23d3:     	movzbl	0x147(%rbp), %eax
1454c23da:     	movd	%eax, %xmm0
1454c23de:     	pshufd	$0x0, %xmm0, %xmm15     # xmm15 = xmm0[0,0,0,0]
1454c23e4:     	pslld	$0x1f, %xmm15
1454c23ea:     	psrad	$0x1f, %xmm15
1454c23f0:     	movdqa	%xmm15, %xmm0
1454c23f5:     	pandn	0x14e8173(%rip), %xmm0  # 0x1469aa570
1454c23fd:     	pand	0x14e817a(%rip), %xmm15 # 0x1469aa580
1454c2406:     	por	%xmm0, %xmm15
1454c240b:     	movd	0x14e8121(%rip), %xmm0  # 0x1469aa534
1454c2413:     	movaps	%xmm7, %xmm1
1454c2416:     	callq	0x145756e73 <.text+0x5755e73>
1454c241b:     	movdqa	%xmm0, %xmm10
1454c2420:     	pxor	%xmm0, %xmm0
1454c2424:     	punpcklwd	%xmm0, %xmm12   # xmm12 = xmm12[0],xmm0[0],xmm12[1],xmm0[1],xmm12[2],xmm0[2],xmm12[3],xmm0[3]
1454c2429:     	movss	0x43aa13(%rip), %xmm0   # 0x1458fce44
1454c2431:     	mulss	%xmm6, %xmm0
1454c2435:     	addss	0x429043(%rip), %xmm0   # 0x1458eb480
1454c243d:     	cvtdq2ps	%xmm12, %xmm12
1454c2441:     	movss	0x6e87ef(%rip), %xmm1   # 0x145baac38
1454c2449:     	mulss	%xmm6, %xmm1
1454c244d:     	mulss	%xmm6, %xmm1
1454c2451:     	addss	%xmm0, %xmm1
1454c2455:     	movss	0x7d79e3(%rip), %xmm0   # 0x145c99e40
1454c245d:     	mulss	%xmm6, %xmm0
1454c2461:     	mulss	%xmm6, %xmm0
1454c2465:     	mulss	%xmm6, %xmm0
1454c2469:     	addss	%xmm1, %xmm0
1454c246d:     	sqrtss	%xmm9, %xmm6
1454c2472:     	mulss	%xmm0, %xmm6
1454c2476:     	movd	0x14e80d2(%rip), %xmm0  # 0x1469aa550
1454c247e:     	movaps	%xmm7, %xmm1
1454c2481:     	callq	0x145756e73 <.text+0x5755e73>
1454c2486:     	unpcklps	0x120(%rbp), %xmm14     # xmm14 = xmm14[0],mem[0],xmm14[1],mem[1]
1454c248e:     	mulps	%xmm15, %xmm14
1454c2492:     	unpcklps	%xmm6, %xmm8            # xmm8 = xmm8[0],xmm6[0],xmm8[1],xmm6[1]
1454c2496:     	mulps	%xmm14, %xmm8
1454c249a:     	punpckldq	%xmm0, %xmm10   # xmm10 = xmm10[0],xmm0[0],xmm10[1],xmm0[1]
1454c249f:     	divps	0x1165a39(%rip), %xmm12 # 0x146627ee0
1454c24a7:     	mulps	%xmm8, %xmm10
1454c24ab:     	mulps	%xmm10, %xmm12
1454c24af:     	movq	0x130(%rbp), %r8
1454c24b6:     	movl	%r8d, %eax
1454c24b9:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454c24be:     	shlq	$0x18, %rax
1454c24c2:     	andl	$0xffffff, %r13d        # imm = 0xFFFFFF
1454c24c9:     	orq	%rax, %r13
1454c24cc:     	movabsq	$-0xed0000000000000, %rax # imm = 0xF130000000000000
1454c24d6:     	orq	%r13, %rax
1454c24d9:     	movq	%r14, 0x880(%rsi)
1454c24e0:     	movq	%rbx, 0x898(%rsi)
1454c24e7:     	movq	%rax, %rbx
1454c24ea:     	movq	%rdi, 0x888(%rsi)
1454c24f1:     	movq	%r12, 0x890(%rsi)
1454c24f8:     	movss	0x28(%r15), %xmm0
1454c24fe:     	movl	0x24(%r15), %r9d
1454c2502:     	movzbl	0x4c(%r15), %eax
1454c2507:     	leaq	0x138(%rbp), %rcx
1454c250e:     	movq	%rcx, 0x38(%rsp)
1454c2513:     	movb	%al, 0x30(%rsp)
1454c2517:     	movss	%xmm0, 0x20(%rsp)
1454c251d:     	movss	%xmm12, 0x28(%rsp)
1454c2524:     	movq	%rsi, %rcx
1454c2527:     	movq	%rbx, %rdx
1454c252a:     	callq	0x1454c0820 <.text+0x54bf820>
1454c252f:     	movss	0x8e4(%rsi), %xmm6
1454c2537:     	movss	0x28(%r15), %xmm8
1454c253d:     	movss	0x38(%r15), %xmm9
1454c2543:     	movss	0x43a8a0(%rip), %xmm10  # 0x1458fcdec
1454c254c:     	mulss	%xmm8, %xmm10
1454c2551:     	addss	0x54f17e(%rip), %xmm10  # 0x145a116d8
1454c255a:     	movss	0x428f26(%rip), %xmm7   # 0x1458eb488
1454c2562:     	mulss	%xmm9, %xmm7
1454c2567:     	movzwl	0x144(%rbp), %eax
1454c256e:     	xorps	%xmm14, %xmm14
1454c2572:     	cvtsi2ss	%eax, %xmm14
1454c2577:     	divss	0x428fac(%rip), %xmm14  # 0x1458eb52c
1454c2580:     	mulss	0x56800f(%rip), %xmm14  # 0x145a2a598
1454c2589:     	movzbl	0x4c(%r15), %r14d
1454c258e:     	mulss	0x3c(%r15), %xmm14
1454c2594:     	movq	0x880(%rsi), %rdx
1454c259b:     	movq	0x888(%rsi), %rax
1454c25a2:     	movq	0x898(%rsi), %r8
1454c25a9:     	movq	0x890(%rsi), %rcx
1454c25b0:     	movss	0x44888c(%rip), %xmm0   # 0x14590ae44
1454c25b8:     	nopl	(%rax,%rax)
1454c25c0:     	leaq	(%rdx,%r8), %r9
1454c25c4:     	rolq	$0x17, %r9
1454c25c8:     	addq	%rdx, %r9
1454c25cb:     	movq	%rax, %r10
1454c25ce:     	shlq	$0x11, %r10
1454c25d2:     	xorq	%rdx, %rcx
1454c25d5:     	xorq	%rax, %r8
1454c25d8:     	xorq	%rcx, %rax
1454c25db:     	xorq	%r8, %rdx
1454c25de:     	rolq	$0x2d, %r8
1454c25e2:     	xorq	%r10, %rcx
1454c25e5:     	shrq	$0x29, %r9
1454c25e9:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454c25f0:     	movd	%r9d, %xmm15
1454c25f5:     	addss	%xmm13, %xmm15
1454c25fa:     	mulss	%xmm0, %xmm15
1454c25ff:     	ucomiss	%xmm15, %xmm0
1454c2603:     	jbe	0x1454c25c0 <.text+0x54c15c0>
1454c2605:     	xorps	%xmm0, %xmm0
1454c2608:     	addss	%xmm0, %xmm11
1454c260d:     	addss	%xmm0, %xmm15
1454c2612:     	movq	%rdx, 0x880(%rsi)
1454c2619:     	movq	%r8, 0x898(%rsi)
1454c2620:     	movq	%rax, 0x888(%rsi)
1454c2627:     	movq	%rcx, 0x890(%rsi)
1454c262e:     	addss	%xmm6, %xmm15
1454c2633:     	movq	$0x0, -0x40(%rbp)
1454c263b:     	movq	$0x8, -0x38(%rbp)
1454c2643:     	movq	$0x0, -0x30(%rbp)
1454c264b:     	movq	$-0x1, -0x28(%rbp)
1454c2653:     	movq	$-0x1, (%rbp)
1454c265b:     	movl	$0x0, 0x28(%rbp)
1454c2662:     	movl	$0x0, 0x30(%rbp)
1454c2669:     	movl	$0x0, 0x38(%rbp)
1454c2670:     	movq	%rbx, 0x48(%rbp)
1454c2674:     	movq	%r15, 0x50(%rbp)
1454c2678:     	xorps	%xmm13, %xmm13
1454c267c:     	movups	%xmm13, 0x58(%rbp)
1454c2681:     	movups	%xmm13, 0x68(%rbp)
1454c2686:     	movups	%xmm13, 0x78(%rbp)
1454c268b:     	movups	%xmm13, 0x88(%rbp)
1454c2693:     	movups	%xmm13, 0x98(%rbp)
1454c269b:     	movq	$0x0, 0xa8(%rbp)
1454c26a6:     	movss	%xmm12, 0xb0(%rbp)
1454c26af:     	movlps	%xmm12, 0xb4(%rbp)
1454c26b7:     	movss	%xmm14, 0xbc(%rbp)
1454c26c0:     	movss	%xmm9, 0xc0(%rbp)
1454c26c9:     	movss	%xmm10, 0xc4(%rbp)
1454c26d2:     	movss	%xmm8, 0xc8(%rbp)
1454c26db:     	movl	0x140(%rbp), %eax
1454c26e1:     	movl	%eax, 0xd4(%rbp)
1454c26e7:     	movq	0x138(%rbp), %rcx
1454c26ee:     	movq	%rcx, 0xcc(%rbp)
1454c26f5:     	movl	%eax, 0xe0(%rbp)
1454c26fb:     	movq	%rcx, 0xd8(%rbp)
1454c2702:     	xorps	%xmm0, %xmm0
1454c2705:     	movss	%xmm6, %xmm0            # xmm0 = xmm6[0],xmm0[1,2,3]
1454c2709:     	movlps	%xmm0, 0xe4(%rbp)
1454c2710:     	movss	%xmm15, 0xec(%rbp)
1454c2719:     	movss	%xmm7, 0xf0(%rbp)
1454c2721:     	movups	%xmm13, 0xf4(%rbp)
1454c2729:     	movups	%xmm13, 0x104(%rbp)
1454c2731:     	movss	%xmm11, 0x114(%rbp)
1454c273a:     	movb	%r14b, 0x118(%rbp)
1454c2741:     	movq	0x4d0(%rsi), %rdi
1454c2748:     	cmpq	0x4c0(%rsi), %rdi
1454c274f:     	jne	0x1454c275e <.text+0x54c175e>
1454c2751:     	leaq	0x4c0(%rsi), %rcx
1454c2758:     	callq	0x14580b6b0 <.text+0x580a6b0>
1454c275d:     	nop
1454c275e:     	movq	0x4c8(%rsi), %rax
1454c2765:     	imulq	$0x160, %rdi, %rcx      # imm = 0x160
1454c276c:     	movq	$0x0, (%rax,%rcx)
1454c2774:     	movq	$0x8, 0x8(%rax,%rcx)
1454c277d:     	movq	$0x0, 0x10(%rax,%rcx)
1454c2786:     	movq	$-0x1, 0x18(%rax,%rcx)
1454c278f:     	movq	$-0x1, 0x40(%rax,%rcx)
1454c2798:     	movl	$0x0, 0x68(%rax,%rcx)
1454c27a0:     	movl	$0x0, 0x70(%rax,%rcx)
1454c27a8:     	movl	$0x0, 0x78(%rax,%rcx)
1454c27b0:     	movq	%rbx, 0x88(%rax,%rcx)
1454c27b8:     	movq	%r15, 0x90(%rax,%rcx)
1454c27c0:     	movups	%xmm13, 0x98(%rax,%rcx)
1454c27c9:     	movups	%xmm13, 0xa8(%rax,%rcx)
1454c27d2:     	movups	%xmm13, 0xb8(%rax,%rcx)
1454c27db:     	movups	%xmm13, 0xc8(%rax,%rcx)
1454c27e4:     	movups	%xmm13, 0xd8(%rax,%rcx)
1454c27ed:     	movq	$0x0, 0xe8(%rax,%rcx)
1454c27f9:     	movss	%xmm12, 0xf0(%rax,%rcx)
1454c2803:     	movlps	%xmm12, 0xf4(%rax,%rcx)
1454c280c:     	movss	%xmm14, 0xfc(%rax,%rcx)
1454c2816:     	movss	%xmm9, 0x100(%rax,%rcx)
1454c2820:     	movss	%xmm10, 0x104(%rax,%rcx)
1454c282a:     	movss	%xmm8, 0x108(%rax,%rcx)
1454c2834:     	movl	0x140(%rbp), %edx
1454c283a:     	movl	%edx, 0x114(%rax,%rcx)
1454c2841:     	movq	0x138(%rbp), %rdx
1454c2848:     	movq	%rdx, 0x10c(%rax,%rcx)
1454c2850:     	movq	0x138(%rbp), %rdx
1454c2857:     	movq	%rdx, 0x118(%rax,%rcx)
1454c285f:     	movl	0x140(%rbp), %edx
1454c2865:     	movl	%edx, 0x120(%rax,%rcx)
1454c286c:     	movss	%xmm6, 0x124(%rax,%rcx)
1454c2875:     	movl	$0x0, 0x128(%rax,%rcx)
1454c2880:     	movss	%xmm15, 0x12c(%rax,%rcx)
1454c288a:     	movss	%xmm7, 0x130(%rax,%rcx)
1454c2893:     	movups	%xmm13, 0x134(%rax,%rcx)
1454c289c:     	movups	%xmm13, 0x144(%rax,%rcx)
1454c28a5:     	movss	%xmm11, 0x154(%rax,%rcx)
1454c28af:     	movb	%r14b, 0x158(%rax,%rcx)
1454c28b7:     	incq	%rdi
1454c28ba:     	movq	%rdi, 0x4d0(%rsi)
1454c28c1:     	movl	$0x1, %eax
1454c28c6:     	movq	%rbx, %rdx
1454c28c9:     	movaps	0x150(%rbp), %xmm6
1454c28d0:     	movaps	0x160(%rbp), %xmm7
1454c28d7:     	movaps	0x170(%rbp), %xmm8
1454c28df:     	movaps	0x180(%rbp), %xmm9
1454c28e7:     	movaps	0x190(%rbp), %xmm10
1454c28ef:     	movaps	0x1a0(%rbp), %xmm11
1454c28f7:     	movaps	0x1b0(%rbp), %xmm12
1454c28ff:     	movaps	0x1c0(%rbp), %xmm13
1454c2907:     	movaps	0x1d0(%rbp), %xmm14
1454c290f:     	movaps	0x1e0(%rbp), %xmm15
1454c2917:     	addq	$0x278, %rsp            # imm = 0x278
1454c291e:     	popq	%rbx
1454c291f:     	popq	%rdi
1454c2920:     	popq	%rsi
1454c2921:     	popq	%r12
1454c2923:     	popq	%r13
1454c2925:     	popq	%r14
1454c2927:     	popq	%r15
1454c2929:     	popq	%rbp
1454c292a:     	retq
1454c292b:     	leaq	0x14e8cf6(%rip), %r8    # 0x1469ab628
1454c2932:     	movq	%r14, %rcx
1454c2935:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454c293a:     	ud2

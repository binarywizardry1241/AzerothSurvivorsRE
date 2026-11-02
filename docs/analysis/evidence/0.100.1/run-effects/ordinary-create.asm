
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d4130:     	pushq	%rbp
1454d4131:     	pushq	%r15
1454d4133:     	pushq	%r14
1454d4135:     	pushq	%r13
1454d4137:     	pushq	%r12
1454d4139:     	pushq	%rsi
1454d413a:     	pushq	%rdi
1454d413b:     	pushq	%rbx
1454d413c:     	subq	$0x278, %rsp            # imm = 0x278
1454d4143:     	leaq	0x80(%rsp), %rbp
1454d414b:     	movaps	%xmm15, 0x1e0(%rbp)
1454d4153:     	movaps	%xmm14, 0x1d0(%rbp)
1454d415b:     	movaps	%xmm13, 0x1c0(%rbp)
1454d4163:     	movaps	%xmm12, 0x1b0(%rbp)
1454d416b:     	movaps	%xmm11, 0x1a0(%rbp)
1454d4173:     	movaps	%xmm10, 0x190(%rbp)
1454d417b:     	movaps	%xmm9, 0x180(%rbp)
1454d4183:     	movaps	%xmm8, 0x170(%rbp)
1454d418b:     	movaps	%xmm7, 0x160(%rbp)
1454d4192:     	movaps	%xmm6, 0x150(%rbp)
1454d4199:     	movq	$-0x2, 0x148(%rbp)
1454d41a4:     	movq	%r8, %rdi
1454d41a7:     	movq	%rdx, %r14
1454d41aa:     	movq	%rcx, %rsi
1454d41ad:     	movq	0x4e8(%rcx), %r8
1454d41b4:     	testq	%r8, %r8
1454d41b7:     	je	0x1454d41d3 <.text+0x54d31d3>
1454d41b9:     	movq	0x4e0(%rsi), %rax
1454d41c0:     	movl	%r8d, %edx
1454d41c3:     	andl	$0x3, %edx
1454d41c6:     	cmpq	$0x4, %r8
1454d41ca:     	jae	0x1454d41da <.text+0x54d31da>
1454d41cc:     	xorl	%r9d, %r9d
1454d41cf:     	xorl	%ecx, %ecx
1454d41d1:     	jmp	0x1454d4239 <.text+0x54d3239>
1454d41d3:     	xorl	%ecx, %ecx
1454d41d5:     	jmp	0x1454d4277 <.text+0x54d3277>
1454d41da:     	andq	$-0x4, %r8
1454d41de:     	leaq	0x488(%rax), %r10
1454d41e5:     	xorl	%r9d, %r9d
1454d41e8:     	xorl	%ecx, %ecx
1454d41ea:     	nopw	(%rax,%rax)
1454d41f0:     	movl	-0x420(%r10), %r11d
1454d41f7:     	movl	-0x2c0(%r10), %ebx
1454d41fe:     	xorq	$0x1, %r11
1454d4202:     	addq	%rcx, %r11
1454d4205:     	xorq	$0x1, %rbx
1454d4209:     	movl	-0x160(%r10), %r15d
1454d4210:     	xorq	$0x1, %r15
1454d4214:     	addq	%rbx, %r15
1454d4217:     	addq	%r11, %r15
1454d421a:     	movl	(%r10), %ecx
1454d421d:     	xorq	$0x1, %rcx
1454d4221:     	addq	%r15, %rcx
1454d4224:     	addq	$0x4, %r9
1454d4228:     	addq	$0x580, %r10            # imm = 0x580
1454d422f:     	cmpq	%r9, %r8
1454d4232:     	jne	0x1454d41f0 <.text+0x54d31f0>
1454d4234:     	testq	%rdx, %rdx
1454d4237:     	je	0x1454d4277 <.text+0x54d3277>
1454d4239:     	imulq	$0x160, %r9, %r8        # imm = 0x160
1454d4240:     	addq	%r8, %rax
1454d4243:     	addq	$0x68, %rax
1454d4247:     	imulq	$0x160, %rdx, %rdx      # imm = 0x160
1454d424e:     	xorl	%r8d, %r8d
1454d4251:     	nopw	%cs:(%rax,%rax)
1454d4260:     	movl	(%rax,%r8), %r9d
1454d4264:     	xorq	$0x1, %r9
1454d4268:     	addq	%r9, %rcx
1454d426b:     	addq	$0x160, %r8             # imm = 0x160
1454d4272:     	cmpq	%r8, %rdx
1454d4275:     	jne	0x1454d4260 <.text+0x54d3260>
1454d4277:     	movzwl	0x248(%rsi), %eax
1454d427e:     	cvtsi2ss	%eax, %xmm0
1454d4282:     	divss	0x4332b2(%rip), %xmm0   # 0x14590753c
1454d428a:     	mulss	0x510622(%rip), %xmm0   # 0x1459e48b4
1454d4292:     	cvttss2si	%xmm0, %rax
1454d4297:     	movq	%rax, %rdx
1454d429a:     	sarq	$0x3f, %rdx
1454d429e:     	movaps	%xmm0, %xmm1
1454d42a1:     	subss	0x432f37(%rip), %xmm1   # 0x1459071e0
1454d42a9:     	cvttss2si	%xmm1, %r8
1454d42ae:     	andq	%rdx, %r8
1454d42b1:     	orq	%rax, %r8
1454d42b4:     	xorl	%eax, %eax
1454d42b6:     	xorps	%xmm1, %xmm1
1454d42b9:     	ucomiss	%xmm1, %xmm0
1454d42bc:     	cmovbq	%rax, %r8
1454d42c0:     	ucomiss	0x432f1d(%rip), %xmm0   # 0x1459071e4
1454d42c7:     	movq	$-0x1, %rdx
1454d42ce:     	cmovbeq	%r8, %rdx
1454d42d2:     	cmpq	$0x33, %rdx
1454d42d6:     	movl	$0x32, %r8d
1454d42dc:     	cmovaeq	%rdx, %r8
1454d42e0:     	cmpq	$0x78, %r8
1454d42e4:     	movl	$0x78, %edx
1454d42e9:     	cmovbq	%r8, %rdx
1454d42ed:     	cmpq	%rdx, %rcx
1454d42f0:     	jae	0x1454d4a07 <.text+0x54d3a07>
1454d42f6:     	movq	0x228(%rsi), %rcx
1454d42fd:     	movq	0x230(%rsi), %rdx
1454d4304:     	callq	0x145420480 <.text+0x541f480>
1454d4309:     	imulq	$0xf0, %rax, %rax
1454d4310:     	leaq	0x125f201(%rip), %rbx   # 0x146733518
1454d4317:     	movq	0x80(%rax,%rbx), %rdx
1454d431f:     	leaq	-0x1(%rdx), %rcx
1454d4323:     	cmpq	%r14, %rcx
1454d4326:     	cmovbq	%rcx, %r14
1454d432a:     	cmpq	%rdx, %r14
1454d432d:     	jae	0x1454d4a6c <.text+0x54d3a6c>
1454d4333:     	addq	%rax, %rbx
1454d4336:     	leaq	(%r14,%r14,4), %r15
1454d433a:     	shlq	$0x4, %r15
1454d433e:     	addq	0x78(%rbx), %r15
1454d4342:     	cmpb	$0x0, (%rdi)
1454d4345:     	je	0x1454d435d <.text+0x54d335d>
1454d4347:     	movl	0xc(%rdi), %eax
1454d434a:     	movl	%eax, 0x140(%rbp)
1454d4350:     	movq	0x4(%rdi), %rax
1454d4354:     	movq	%rax, 0x138(%rbp)
1454d435b:     	jmp	0x1454d4384 <.text+0x54d3384>
1454d435d:     	movl	$0x3f000000, 0x20(%rsp) # imm = 0x3F000000
1454d4365:     	leaq	0x138(%rbp), %rcx
1454d436c:     	movss	0x46b8fc(%rip), %xmm2   # 0x14593fc70
1454d4374:     	movss	0x473b1c(%rip), %xmm3   # 0x145947e98
1454d437c:     	movq	%rsi, %rdx
1454d437f:     	callq	0x1454d38a0 <.text+0x54d28a0>
1454d4384:     	movss	0x934(%rsi), %xmm0
1454d438c:     	movaps	%xmm0, %xmm6
1454d438f:     	divss	0x44150d(%rip), %xmm6   # 0x1459158a4
1454d4397:     	xorps	%xmm9, %xmm9
1454d439b:     	cmpl	$0x1, 0x870(%rsi)
1454d43a2:     	jne	0x1454d43c8 <.text+0x54d33c8>
1454d43a4:     	cmpb	$0x0, 0x9aa(%rsi)
1454d43ab:     	je	0x1454d43c8 <.text+0x54d33c8>
1454d43ad:     	subss	0x874(%rsi), %xmm0
1454d43b5:     	divss	0x4414e7(%rip), %xmm0   # 0x1459158a4
1454d43bd:     	xorps	%xmm1, %xmm1
1454d43c0:     	maxss	%xmm1, %xmm0
1454d43c4:     	movaps	%xmm0, %xmm9
1454d43c8:     	movzbl	0x4c(%r15), %edx
1454d43cd:     	leaq	0x2e68c(%rip), %rax     # 0x145502a60 <.text+0x5501a60>
1454d43d4:     	leaq	0x2e6d5(%rip), %rcx     # 0x145502ab0 <.text+0x5501ab0>
1454d43db:     	movb	%dl, 0x147(%rbp)
1454d43e1:     	testb	%dl, %dl
1454d43e3:     	cmovneq	%rax, %rcx
1454d43e7:     	movd	0x24a(%rsi), %xmm13
1454d43f0:     	movzwl	0x24e(%rsi), %eax
1454d43f7:     	movw	%ax, 0x144(%rbp)
1454d43fe:     	movss	0x30(%r15), %xmm10
1454d4404:     	movss	0xe0(%rbx), %xmm1
1454d440c:     	movss	0xe4(%rbx), %xmm14
1454d4415:     	mulss	0x99c(%rsi), %xmm1
1454d441d:     	movaps	%xmm6, %xmm0
1454d4420:     	movss	%xmm1, 0x130(%rbp)
1454d4428:     	callq	*%rcx
1454d442a:     	movaps	%xmm0, %xmm8
1454d442e:     	movss	0x34(%r15), %xmm0
1454d4434:     	movss	%xmm0, 0x134(%rbp)
1454d443c:     	movl	0x20(%r15), %eax
1454d4440:     	movq	%rax, 0x128(%rbp)
1454d4447:     	movl	0x954(%rsi), %r13d
1454d444e:     	incl	%r13d
1454d4451:     	movl	%r13d, 0x954(%rsi)
1454d4458:     	movq	0x8a0(%rsi), %r14
1454d445f:     	movq	0x8a8(%rsi), %rdi
1454d4466:     	movq	0x8b8(%rsi), %rbx
1454d446d:     	movq	0x8b0(%rsi), %r12
1454d4474:     	movss	0x43308f(%rip), %xmm12  # 0x14590750c
1454d447d:     	movss	0x43515f(%rip), %xmm0   # 0x1459095e4
1454d4485:     	nopw	%cs:(%rax,%rax)
1454d4490:     	leaq	(%r14,%rbx), %rax
1454d4494:     	rolq	$0x17, %rax
1454d4498:     	addq	%r14, %rax
1454d449b:     	movq	%rdi, %rcx
1454d449e:     	shlq	$0x11, %rcx
1454d44a2:     	xorq	%r14, %r12
1454d44a5:     	xorq	%rdi, %rbx
1454d44a8:     	xorq	%r12, %rdi
1454d44ab:     	xorq	%rbx, %r14
1454d44ae:     	rolq	$0x2d, %rbx
1454d44b2:     	xorq	%rcx, %r12
1454d44b5:     	shrq	$0x29, %rax
1454d44b9:     	orl	$0x3f800000, %eax       # imm = 0x3F800000
1454d44be:     	movd	%eax, %xmm11
1454d44c3:     	addss	%xmm12, %xmm11
1454d44c8:     	mulss	%xmm0, %xmm11
1454d44cd:     	ucomiss	%xmm11, %xmm0
1454d44d1:     	jbe	0x1454d4490 <.text+0x54d3490>
1454d44d3:     	cmpb	$0x0, 0x147(%rbp)
1454d44da:     	jne	0x1454d44f4 <.text+0x54d34f4>
1454d44dc:     	movss	0x15219ef(%rip), %xmm15 # 0x1469f5ed4
1454d44e5:     	movss	0x432fa3(%rip), %xmm2   # 0x145907490
1454d44ed:     	movaps	%xmm2, %xmm7
1454d44f0:     	je	0x1454d450a <.text+0x54d350a>
1454d44f2:     	jmp	0x1454d4512 <.text+0x54d3512>
1454d44f4:     	movss	0x15219d3(%rip), %xmm15 # 0x1469f5ed0
1454d44fd:     	movss	0x432f8b(%rip), %xmm2   # 0x145907490
1454d4505:     	movaps	%xmm2, %xmm7
1454d4508:     	jne	0x1454d4512 <.text+0x54d3512>
1454d450a:     	movss	0x53ffb2(%rip), %xmm7   # 0x145a144c4
1454d4512:     	movaps	%xmm6, %xmm0
1454d4515:     	divss	0x4413bb(%rip), %xmm0   # 0x1459158d8
1454d451d:     	mulss	%xmm10, %xmm15
1454d4522:     	xorps	%xmm1, %xmm1
1454d4525:     	maxss	%xmm0, %xmm1
1454d4529:     	movaps	%xmm2, %xmm0
1454d452c:     	minss	%xmm1, %xmm0
1454d4530:     	mulss	%xmm0, %xmm14
1454d4535:     	mulss	%xmm0, %xmm14
1454d453a:     	addss	%xmm2, %xmm14
1454d453f:     	movd	0x152194d(%rip), %xmm0  # 0x1469f5e94
1454d4547:     	movaps	%xmm9, %xmm1
1454d454b:     	callq	0x145773283 <.text+0x5772283>
1454d4550:     	movdqa	%xmm0, %xmm10
1454d4555:     	pxor	%xmm0, %xmm0
1454d4559:     	punpcklwd	%xmm0, %xmm13   # xmm13 = xmm13[0],xmm0[0],xmm13[1],xmm0[1],xmm13[2],xmm0[2],xmm13[3],xmm0[3]
1454d455e:     	cvtdq2ps	%xmm13, %xmm13
1454d4562:     	mulss	0x134(%rbp), %xmm7
1454d456a:     	unpcklps	%xmm7, %xmm14           # xmm14 = xmm14[0],xmm7[0],xmm14[1],xmm7[1]
1454d456e:     	movss	0x476faa(%rip), %xmm0   # 0x14594b520
1454d4576:     	mulss	%xmm6, %xmm0
1454d457a:     	addss	0x432f0e(%rip), %xmm0   # 0x145907490
1454d4582:     	movss	0x6f368e(%rip), %xmm1   # 0x145bc7c18
1454d458a:     	mulss	%xmm6, %xmm1
1454d458e:     	mulss	%xmm6, %xmm1
1454d4592:     	addss	%xmm0, %xmm1
1454d4596:     	movss	0x7e2872(%rip), %xmm0   # 0x145cb6e10
1454d459e:     	mulss	%xmm6, %xmm0
1454d45a2:     	mulss	%xmm6, %xmm0
1454d45a6:     	mulss	%xmm6, %xmm0
1454d45aa:     	addss	%xmm1, %xmm0
1454d45ae:     	unpcklps	%xmm0, %xmm15           # xmm15 = xmm15[0],xmm0[0],xmm15[1],xmm0[1]
1454d45b2:     	movss	0x130(%rbp), %xmm0
1454d45ba:     	sqrtss	%xmm0, %xmm6
1454d45be:     	movd	0x15218ea(%rip), %xmm0  # 0x1469f5eb0
1454d45c6:     	movaps	%xmm9, %xmm1
1454d45ca:     	callq	0x145773283 <.text+0x5772283>
1454d45cf:     	unpcklps	%xmm6, %xmm8            # xmm8 = xmm8[0],xmm6[0],xmm8[1],xmm6[1]
1454d45d3:     	mulps	%xmm15, %xmm8
1454d45d7:     	mulps	%xmm14, %xmm8
1454d45db:     	punpckldq	%xmm0, %xmm10   # xmm10 = xmm10[0],xmm0[0],xmm10[1],xmm0[1]
1454d45e0:     	divps	0x11708f8(%rip), %xmm13 # 0x146644ee0
1454d45e8:     	mulps	%xmm8, %xmm10
1454d45ec:     	mulps	%xmm10, %xmm13
1454d45f0:     	movq	0x128(%rbp), %r8
1454d45f7:     	movl	%r8d, %eax
1454d45fa:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454d45ff:     	shlq	$0x18, %rax
1454d4603:     	andl	$0xffffff, %r13d        # imm = 0xFFFFFF
1454d460a:     	orq	%rax, %r13
1454d460d:     	movabsq	$-0xed0000000000000, %rax # imm = 0xF130000000000000
1454d4617:     	orq	%r13, %rax
1454d461a:     	movq	%r14, 0x8a0(%rsi)
1454d4621:     	movq	%rbx, 0x8b8(%rsi)
1454d4628:     	movq	%rdi, 0x8a8(%rsi)
1454d462f:     	movq	%r12, 0x8b0(%rsi)
1454d4636:     	movq	%rax, %r12
1454d4639:     	movss	0x28(%r15), %xmm0
1454d463f:     	movl	0x24(%r15), %r9d
1454d4643:     	movzbl	0x4c(%r15), %eax
1454d4648:     	leaq	0x138(%rbp), %rcx
1454d464f:     	movq	%rcx, 0x38(%rsp)
1454d4654:     	movb	%al, 0x30(%rsp)
1454d4658:     	movss	%xmm0, 0x20(%rsp)
1454d465e:     	movss	%xmm13, 0x28(%rsp)
1454d4665:     	movq	%rsi, %rcx
1454d4668:     	movq	%r12, %rdx
1454d466b:     	callq	0x1454d2910 <.text+0x54d1910>
1454d4670:     	movss	0x934(%rsi), %xmm6
1454d4678:     	movss	0x28(%r15), %xmm8
1454d467e:     	movss	0x38(%r15), %xmm9
1454d4684:     	movss	0x47386f(%rip), %xmm10  # 0x145947efc
1454d468d:     	mulss	%xmm8, %xmm10
1454d4692:     	addss	0x55a01d(%rip), %xmm10  # 0x145a2e6b8
1454d469b:     	movss	0x432df5(%rip), %xmm7   # 0x145907498
1454d46a3:     	mulss	%xmm9, %xmm7
1454d46a8:     	movzwl	0x144(%rbp), %eax
1454d46af:     	xorps	%xmm14, %xmm14
1454d46b3:     	cvtsi2ss	%eax, %xmm14
1454d46b8:     	divss	0x432e7b(%rip), %xmm14  # 0x14590753c
1454d46c1:     	mulss	0x572eae(%rip), %xmm14  # 0x145a47578
1454d46ca:     	movzbl	0x4c(%r15), %ebx
1454d46cf:     	mulss	0x3c(%r15), %xmm14
1454d46d5:     	movq	0x8a0(%rsi), %rdx
1454d46dc:     	movq	0x8a8(%rsi), %rax
1454d46e3:     	movq	0x8b8(%rsi), %r8
1454d46ea:     	movq	0x8b0(%rsi), %rcx
1454d46f1:     	movss	0x4411d7(%rip), %xmm0   # 0x1459158d0
1454d46f9:     	nopl	(%rax)
1454d4700:     	leaq	(%rdx,%r8), %r9
1454d4704:     	rolq	$0x17, %r9
1454d4708:     	addq	%rdx, %r9
1454d470b:     	movq	%rax, %r10
1454d470e:     	shlq	$0x11, %r10
1454d4712:     	xorq	%rdx, %rcx
1454d4715:     	xorq	%rax, %r8
1454d4718:     	xorq	%rcx, %rax
1454d471b:     	xorq	%r8, %rdx
1454d471e:     	rolq	$0x2d, %r8
1454d4722:     	xorq	%r10, %rcx
1454d4725:     	shrq	$0x29, %r9
1454d4729:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454d4730:     	movd	%r9d, %xmm15
1454d4735:     	addss	%xmm12, %xmm15
1454d473a:     	mulss	%xmm0, %xmm15
1454d473f:     	ucomiss	%xmm15, %xmm0
1454d4743:     	jbe	0x1454d4700 <.text+0x54d3700>
1454d4745:     	xorps	%xmm0, %xmm0
1454d4748:     	addss	%xmm0, %xmm11
1454d474d:     	addss	%xmm0, %xmm15
1454d4752:     	movq	%rdx, 0x8a0(%rsi)
1454d4759:     	movq	%r8, 0x8b8(%rsi)
1454d4760:     	movq	%rax, 0x8a8(%rsi)
1454d4767:     	movq	%rcx, 0x8b0(%rsi)
1454d476e:     	addss	%xmm6, %xmm15
1454d4773:     	movq	$0x0, -0x38(%rbp)
1454d477b:     	movq	$0x8, -0x30(%rbp)
1454d4783:     	movq	$0x0, -0x28(%rbp)
1454d478b:     	movq	$-0x1, -0x20(%rbp)
1454d4793:     	movq	$-0x1, 0x8(%rbp)
1454d479b:     	movl	$0x0, 0x30(%rbp)
1454d47a2:     	movl	$0x0, 0x38(%rbp)
1454d47a9:     	movl	$0x0, 0x40(%rbp)
1454d47b0:     	movq	%r12, 0x50(%rbp)
1454d47b4:     	movq	%r15, 0x58(%rbp)
1454d47b8:     	xorps	%xmm12, %xmm12
1454d47bc:     	movups	%xmm12, 0x60(%rbp)
1454d47c1:     	movups	%xmm12, 0x70(%rbp)
1454d47c6:     	movups	%xmm12, 0x80(%rbp)
1454d47ce:     	movups	%xmm12, 0x90(%rbp)
1454d47d6:     	movups	%xmm12, 0xa0(%rbp)
1454d47de:     	movq	$0x0, 0xb0(%rbp)
1454d47e9:     	movss	%xmm13, 0xb8(%rbp)
1454d47f2:     	movlps	%xmm13, 0xbc(%rbp)
1454d47fa:     	movss	%xmm14, 0xc4(%rbp)
1454d4803:     	movss	%xmm9, 0xc8(%rbp)
1454d480c:     	movss	%xmm10, 0xcc(%rbp)
1454d4815:     	movss	%xmm8, 0xd0(%rbp)
1454d481e:     	movl	0x140(%rbp), %eax
1454d4824:     	movl	%eax, 0xdc(%rbp)
1454d482a:     	movq	0x138(%rbp), %rcx
1454d4831:     	movq	%rcx, 0xd4(%rbp)
1454d4838:     	movl	%eax, 0xe8(%rbp)
1454d483e:     	movq	%rcx, 0xe0(%rbp)
1454d4845:     	xorps	%xmm0, %xmm0
1454d4848:     	movss	%xmm6, %xmm0            # xmm0 = xmm6[0],xmm0[1,2,3]
1454d484c:     	movlps	%xmm0, 0xec(%rbp)
1454d4853:     	movss	%xmm15, 0xf4(%rbp)
1454d485c:     	movss	%xmm7, 0xf8(%rbp)
1454d4864:     	movups	%xmm12, 0xfc(%rbp)
1454d486c:     	movups	%xmm12, 0x10c(%rbp)
1454d4874:     	movss	%xmm11, 0x11c(%rbp)
1454d487d:     	movb	%bl, 0x120(%rbp)
1454d4883:     	movq	0x4e8(%rsi), %rdi
1454d488a:     	cmpq	0x4d8(%rsi), %rdi
1454d4891:     	jne	0x1454d48a0 <.text+0x54d38a0>
1454d4893:     	leaq	0x4d8(%rsi), %rcx
1454d489a:     	callq	0x145827b30 <.text+0x5826b30>
1454d489f:     	nop
1454d48a0:     	movq	0x4e0(%rsi), %rax
1454d48a7:     	imulq	$0x160, %rdi, %rcx      # imm = 0x160
1454d48ae:     	movq	$0x0, (%rax,%rcx)
1454d48b6:     	movq	$0x8, 0x8(%rax,%rcx)
1454d48bf:     	movq	$0x0, 0x10(%rax,%rcx)
1454d48c8:     	movq	$-0x1, 0x18(%rax,%rcx)
1454d48d1:     	movq	$-0x1, 0x40(%rax,%rcx)
1454d48da:     	movl	$0x0, 0x68(%rax,%rcx)
1454d48e2:     	movl	$0x0, 0x70(%rax,%rcx)
1454d48ea:     	movl	$0x0, 0x78(%rax,%rcx)
1454d48f2:     	movq	%r12, 0x88(%rax,%rcx)
1454d48fa:     	movq	%r15, 0x90(%rax,%rcx)
1454d4902:     	movups	%xmm12, 0x98(%rax,%rcx)
1454d490b:     	movups	%xmm12, 0xa8(%rax,%rcx)
1454d4914:     	movups	%xmm12, 0xb8(%rax,%rcx)
1454d491d:     	movups	%xmm12, 0xc8(%rax,%rcx)
1454d4926:     	movups	%xmm12, 0xd8(%rax,%rcx)
1454d492f:     	movq	$0x0, 0xe8(%rax,%rcx)
1454d493b:     	movss	%xmm13, 0xf0(%rax,%rcx)
1454d4945:     	movlps	%xmm13, 0xf4(%rax,%rcx)
1454d494e:     	movss	%xmm14, 0xfc(%rax,%rcx)
1454d4958:     	movss	%xmm9, 0x100(%rax,%rcx)
1454d4962:     	movss	%xmm10, 0x104(%rax,%rcx)
1454d496c:     	movss	%xmm8, 0x108(%rax,%rcx)
1454d4976:     	movl	0x140(%rbp), %edx
1454d497c:     	movl	%edx, 0x114(%rax,%rcx)
1454d4983:     	movq	0x138(%rbp), %rdx
1454d498a:     	movq	%rdx, 0x10c(%rax,%rcx)
1454d4992:     	movq	0x138(%rbp), %rdx
1454d4999:     	movq	%rdx, 0x118(%rax,%rcx)
1454d49a1:     	movl	0x140(%rbp), %edx
1454d49a7:     	movl	%edx, 0x120(%rax,%rcx)
1454d49ae:     	movss	%xmm6, 0x124(%rax,%rcx)
1454d49b7:     	movl	$0x0, 0x128(%rax,%rcx)
1454d49c2:     	movss	%xmm15, 0x12c(%rax,%rcx)
1454d49cc:     	movss	%xmm7, 0x130(%rax,%rcx)
1454d49d5:     	movups	%xmm12, 0x134(%rax,%rcx)
1454d49de:     	movups	%xmm12, 0x144(%rax,%rcx)
1454d49e7:     	movss	%xmm11, 0x154(%rax,%rcx)
1454d49f1:     	movb	%bl, 0x158(%rax,%rcx)
1454d49f8:     	incq	%rdi
1454d49fb:     	movq	%rdi, 0x4e8(%rsi)
1454d4a02:     	movl	$0x1, %eax
1454d4a07:     	movq	%r12, %rdx
1454d4a0a:     	movaps	0x150(%rbp), %xmm6
1454d4a11:     	movaps	0x160(%rbp), %xmm7
1454d4a18:     	movaps	0x170(%rbp), %xmm8
1454d4a20:     	movaps	0x180(%rbp), %xmm9
1454d4a28:     	movaps	0x190(%rbp), %xmm10
1454d4a30:     	movaps	0x1a0(%rbp), %xmm11
1454d4a38:     	movaps	0x1b0(%rbp), %xmm12
1454d4a40:     	movaps	0x1c0(%rbp), %xmm13
1454d4a48:     	movaps	0x1d0(%rbp), %xmm14
1454d4a50:     	movaps	0x1e0(%rbp), %xmm15
1454d4a58:     	addq	$0x278, %rsp            # imm = 0x278
1454d4a5f:     	popq	%rbx
1454d4a60:     	popq	%rdi
1454d4a61:     	popq	%rsi
1454d4a62:     	popq	%r12
1454d4a64:     	popq	%r13
1454d4a66:     	popq	%r14
1454d4a68:     	popq	%r15
1454d4a6a:     	popq	%rbp
1454d4a6b:     	retq
1454d4a6c:     	leaq	0x1522625(%rip), %r8    # 0x1469f7098
1454d4a73:     	movq	%r14, %rcx
1454d4a76:     	callq	0x145903b33 <.text+0x5902b33>
1454d4a7b:     	ud2


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e40a0:     	pushq	%rbp
1454e40a1:     	pushq	%r15
1454e40a3:     	pushq	%r14
1454e40a5:     	pushq	%r13
1454e40a7:     	pushq	%r12
1454e40a9:     	pushq	%rsi
1454e40aa:     	pushq	%rdi
1454e40ab:     	pushq	%rbx
1454e40ac:     	subq	$0x3a8, %rsp            # imm = 0x3A8
1454e40b3:     	leaq	0x80(%rsp), %rbp
1454e40bb:     	movaps	%xmm10, 0x310(%rbp)
1454e40c3:     	movaps	%xmm9, 0x300(%rbp)
1454e40cb:     	movaps	%xmm8, 0x2f0(%rbp)
1454e40d3:     	movaps	%xmm7, 0x2e0(%rbp)
1454e40da:     	movaps	%xmm6, 0x2d0(%rbp)
1454e40e1:     	movq	$-0x2, 0x2c8(%rbp)
1454e40ec:     	cmpb	$0x2, 0x95f(%rcx)
1454e40f3:     	jne	0x1454e60d4 <.text+0x54e50d4>
1454e40f9:     	cmpq	0x578(%rcx), %rdx
1454e4100:     	jae	0x1454e60d4 <.text+0x54e50d4>
1454e4106:     	movzbl	0x95d(%rcx), %eax
1454e410d:     	movb	%al, 0x29f(%rbp)
1454e4113:     	cmpb	$-0x1, %al
1454e4115:     	je	0x1454e60d4 <.text+0x54e50d4>
1454e411b:     	movq	0x570(%rcx), %rax
1454e4122:     	leaq	(%rdx,%rdx,4), %r9
1454e4126:     	shlq	$0x5, %r9
1454e412a:     	movq	0x78(%rax,%r9), %rdx
1454e412f:     	movabsq	$-0x8000000000000000, %rsi # imm = 0x8000000000000000
1454e4139:     	movq	%rdx, %r8
1454e413c:     	xorq	%rsi, %r8
1454e413f:     	testq	%rdx, %rdx
1454e4142:     	movl	$0x1, %edx
1454e4147:     	cmovsq	%r8, %rdx
1454e414b:     	leaq	(%rax,%r9), %rdi
1454e414f:     	leaq	0x14c8d62(%rip), %rax   # 0x1469aceb8
1454e4156:     	movslq	(%rax,%rdx,4), %rdx
1454e415a:     	addq	%rax, %rdx
1454e415d:     	movq	%rcx, 0x2a0(%rbp)
1454e4164:     	jmpq	*%rdx
1454e4166:     	movups	0x80(%rdi), %xmm0
1454e416d:     	movups	%xmm0, 0x1f8(%rbp)
1454e4174:     	movq	%rsi, 0x1f0(%rbp)
1454e417b:     	jmp	0x1454e43fb <.text+0x54e33fb>
1454e4180:     	movl	0x80(%rdi), %eax
1454e4186:     	movl	%eax, 0x1f8(%rbp)
1454e418c:     	movabsq	$-0x7ffffffffffffffc, %rax # imm = 0x8000000000000004
1454e4196:     	jmp	0x1454e43f4 <.text+0x54e33f4>
1454e419b:     	movq	0x80(%rdi), %rax
1454e41a2:     	movq	%rax, 0x1f8(%rbp)
1454e41a9:     	movabsq	$-0x7ffffffffffffffe, %rax # imm = 0x8000000000000002
1454e41b3:     	jmp	0x1454e43f4 <.text+0x54e33f4>
1454e41b8:     	movq	0x80(%rdi), %rbx
1454e41bf:     	callq	0x140002200 <.text+0x1200>
1454e41c4:     	movl	$0x70, %ecx
1454e41c9:     	movl	$0x8, %edx
1454e41ce:     	callq	0x1400021c0 <.text+0x11c0>
1454e41d3:     	movq	%rax, 0x2b8(%rbp)
1454e41da:     	testq	%rax, %rax
1454e41dd:     	je	0x1454e6137 <.text+0x54e5137>
1454e41e3:     	leaq	0x150(%rbp), %rcx
1454e41ea:     	movq	%rbx, %rdx
1454e41ed:     	callq	0x14570c440 <.text+0x570b440>
1454e41f2:     	nop
1454e41f3:     	leaq	0x18(%rbx), %rdx
1454e41f7:     	leaq	0x1f0(%rbp), %rcx
1454e41fe:     	callq	0x14570c440 <.text+0x570b440>
1454e4203:     	nop
1454e4204:     	movq	0x40(%rbx), %r12
1454e4208:     	movq	%r12, %r14
1454e420b:     	shlq	$0x6, %r14
1454e420f:     	movq	%r12, %rax
1454e4212:     	shrq	$0x3a, %rax
1454e4216:     	setne	%al
1454e4219:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
1454e4223:     	cmpq	%rcx, %r14
1454e4226:     	seta	%cl
1454e4229:     	orb	%al, %cl
1454e422b:     	je	0x1454e42c1 <.text+0x54e32c1>
1454e4231:     	xorl	%r13d, %r13d
1454e4234:     	movq	%r13, %rcx
1454e4237:     	movq	%r14, %rdx
1454e423a:     	callq	0x1458e721b <.text+0x58e621b>
1454e423f:     	nop
1454e4240:     	jmp	0x1454e619c <.text+0x54e519c>
1454e4245:     	movq	0x88(%rdi), %rbx
1454e424c:     	testq	%rbx, %rbx
1454e424f:     	jns	0x1454e4261 <.text+0x54e3261>
1454e4251:     	xorl	%r15d, %r15d
1454e4254:     	movq	%r15, %rcx
1454e4257:     	movq	%rbx, %rdx
1454e425a:     	callq	0x1458e721b <.text+0x58e621b>
1454e425f:     	ud2
1454e4261:     	movq	0x90(%rdi), %r12
1454e4268:     	je	0x1454e431b <.text+0x54e331b>
1454e426e:     	movq	0x80(%rdi), %r14
1454e4275:     	callq	0x140002200 <.text+0x1200>
1454e427a:     	movl	$0x1, %r15d
1454e4280:     	movl	$0x1, %edx
1454e4285:     	movq	%rbx, %rcx
1454e4288:     	callq	0x1400021c0 <.text+0x11c0>
1454e428d:     	testq	%rax, %rax
1454e4290:     	je	0x1454e4254 <.text+0x54e3254>
1454e4292:     	movq	%rbx, 0x1f0(%rbp)
1454e4299:     	movq	%rax, 0x1f8(%rbp)
1454e42a0:     	movq	%rax, %rcx
1454e42a3:     	movq	%r14, %rdx
1454e42a6:     	movq	%rbx, %r8
1454e42a9:     	callq	0x145756ddd <.text+0x5755ddd>
1454e42ae:     	movq	%rbx, 0x200(%rbp)
1454e42b5:     	movq	%r12, 0x208(%rbp)
1454e42bc:     	jmp	0x1454e43fb <.text+0x54e33fb>
1454e42c1:     	movq	0x48(%rbx), %rax
1454e42c5:     	movq	%rax, 0x2a8(%rbp)
1454e42cc:     	movups	0x50(%rbx), %xmm6
1454e42d0:     	movq	0x60(%rbx), %rax
1454e42d4:     	movq	%rax, 0x288(%rbp)
1454e42db:     	movq	0x38(%rbx), %rdx
1454e42df:     	testq	%r14, %r14
1454e42e2:     	je	0x1454e4348 <.text+0x54e3348>
1454e42e4:     	movq	%rdx, 0x290(%rbp)
1454e42eb:     	callq	0x140002200 <.text+0x1200>
1454e42f0:     	movl	$0x8, %r13d
1454e42f6:     	movl	$0x8, %edx
1454e42fb:     	movq	%r14, %rcx
1454e42fe:     	callq	0x1400021c0 <.text+0x11c0>
1454e4303:     	testq	%rax, %rax
1454e4306:     	je	0x1454e4234 <.text+0x54e3234>
1454e430c:     	movq	%rax, %r15
1454e430f:     	movq	%r12, %r13
1454e4312:     	movq	0x290(%rbp), %rdx
1454e4319:     	jmp	0x1454e4351 <.text+0x54e3351>
1454e431b:     	movq	$0x0, 0x1f0(%rbp)
1454e4326:     	movq	$0x1, 0x1f8(%rbp)
1454e4331:     	movq	$0x0, 0x200(%rbp)
1454e433c:     	movq	%r12, 0x208(%rbp)
1454e4343:     	jmp	0x1454e43fb <.text+0x54e33fb>
1454e4348:     	movl	$0x8, %r15d
1454e434e:     	xorl	%r13d, %r13d
1454e4351:     	testq	%r12, %r12
1454e4354:     	je	0x1454e4361 <.text+0x54e3361>
1454e4356:     	movq	%r15, %rcx
1454e4359:     	movq	%r14, %r8
1454e435c:     	callq	0x145756ddd <.text+0x5755ddd>
1454e4361:     	movl	0x68(%rbx), %eax
1454e4364:     	movq	0x160(%rbp), %rcx
1454e436b:     	movq	%rcx, 0x40(%rbp)
1454e436f:     	movups	0x150(%rbp), %xmm0
1454e4376:     	movaps	%xmm0, 0x30(%rbp)
1454e437a:     	movups	0x1f0(%rbp), %xmm1
1454e4381:     	movups	%xmm1, 0x48(%rbp)
1454e4385:     	movq	0x200(%rbp), %rcx
1454e438c:     	movq	%rcx, 0x58(%rbp)
1454e4390:     	movq	0x50(%rbp), %rcx
1454e4394:     	movq	0x2b8(%rbp), %rdx
1454e439b:     	movq	%rcx, 0x20(%rdx)
1454e439f:     	movq	0x58(%rbp), %rcx
1454e43a3:     	movq	%rcx, 0x28(%rdx)
1454e43a7:     	movq	0x40(%rbp), %rcx
1454e43ab:     	movq	%rcx, 0x10(%rdx)
1454e43af:     	movq	0x48(%rbp), %rcx
1454e43b3:     	movq	%rcx, 0x18(%rdx)
1454e43b7:     	movups	%xmm0, (%rdx)
1454e43ba:     	movq	%r13, 0x30(%rdx)
1454e43be:     	movq	%r15, 0x38(%rdx)
1454e43c2:     	movq	%r12, 0x40(%rdx)
1454e43c6:     	movq	0x2a8(%rbp), %rcx
1454e43cd:     	movq	%rcx, 0x48(%rdx)
1454e43d1:     	movups	%xmm6, 0x50(%rdx)
1454e43d5:     	movq	0x288(%rbp), %rcx
1454e43dc:     	movq	%rcx, 0x60(%rdx)
1454e43e0:     	movl	%eax, 0x68(%rdx)
1454e43e3:     	movq	%rdx, 0x1f8(%rbp)
1454e43ea:     	movabsq	$-0x7ffffffffffffffd, %rax # imm = 0x8000000000000003
1454e43f4:     	movq	%rax, 0x1f0(%rbp)
1454e43fb:     	movq	0x98(%rdi), %r12
1454e4402:     	leaq	0x268(%rbp), %rcx
1454e4409:     	movq	%rdi, %rdx
1454e440c:     	callq	0x14570c440 <.text+0x570b440>
1454e4411:     	nop
1454e4412:     	leaq	0x18(%rdi), %rdx
1454e4416:     	leaq	0x1b0(%rbp), %rcx
1454e441d:     	callq	0x14570c440 <.text+0x570b440>
1454e4422:     	nop
1454e4423:     	leaq	0x30(%rdi), %rdx
1454e4427:     	leaq	0x1d0(%rbp), %rcx
1454e442e:     	callq	0x14570c440 <.text+0x570b440>
1454e4433:     	nop
1454e4434:     	leaq	0x48(%rdi), %rdx
1454e4438:     	leaq	0xf8(%rbp), %rcx
1454e443f:     	callq	0x14570c440 <.text+0x570b440>
1454e4444:     	nop
1454e4445:     	addq	$0x60, %rdi
1454e4449:     	leaq	0x150(%rbp), %rbx
1454e4450:     	movq	%rbx, %rcx
1454e4453:     	movq	%rdi, %rdx
1454e4456:     	callq	0x145537ba0 <.text+0x5536ba0>
1454e445b:     	nop
1454e445c:     	movups	0x1f0(%rbp), %xmm0
1454e4463:     	movups	0x200(%rbp), %xmm1
1454e446a:     	movups	%xmm1, 0xb8(%rbp)
1454e4471:     	movups	%xmm0, 0xa8(%rbp)
1454e4478:     	movq	%r12, 0xc8(%rbp)
1454e447f:     	movups	0x268(%rbp), %xmm0
1454e4486:     	movaps	%xmm0, 0x30(%rbp)
1454e448a:     	movq	0x278(%rbp), %rax
1454e4491:     	movq	%rax, 0x40(%rbp)
1454e4495:     	movups	0x1b0(%rbp), %xmm0
1454e449c:     	movups	%xmm0, 0x48(%rbp)
1454e44a0:     	movq	0x1c0(%rbp), %rax
1454e44a7:     	movq	%rax, 0x58(%rbp)
1454e44ab:     	movups	0x1d0(%rbp), %xmm0
1454e44b2:     	movaps	%xmm0, 0x60(%rbp)
1454e44b6:     	movq	0x1e0(%rbp), %rax
1454e44bd:     	movq	%rax, 0x70(%rbp)
1454e44c1:     	movq	0x108(%rbp), %rax
1454e44c8:     	movq	%rax, 0x88(%rbp)
1454e44cf:     	movups	0xf8(%rbp), %xmm0
1454e44d6:     	movups	%xmm0, 0x78(%rbp)
1454e44da:     	movups	0x150(%rbp), %xmm0
1454e44e1:     	movaps	%xmm0, 0x90(%rbp)
1454e44e8:     	movq	0x160(%rbp), %rax
1454e44ef:     	movq	%rax, 0xa0(%rbp)
1454e44f6:     	movq	0xa8(%rbp), %rdx
1454e44fd:     	xorq	%rdx, %rsi
1454e4500:     	testq	%rdx, %rdx
1454e4503:     	movl	$0x1, %eax
1454e4508:     	cmovsq	%rsi, %rax
1454e450c:     	leaq	0x14c89b9(%rip), %rcx   # 0x1469acecc
1454e4513:     	movslq	(%rcx,%rax,4), %rax
1454e4517:     	addq	%rcx, %rax
1454e451a:     	jmpq	*%rax
1454e451c:     	movq	0xb0(%rbp), %rdi
1454e4523:     	movq	0xb8(%rbp), %r14
1454e452a:     	movq	%rdi, 0x150(%rbp)
1454e4531:     	movq	%r14, 0x158(%rbp)
1454e4538:     	xorl	%esi, %esi
1454e453a:     	leaq	0x1235527(%rip), %r15   # 0x146719a68
1454e4541:     	jmp	0x1454e4561 <.text+0x54e3561>
1454e4543:     	nopw	%cs:(%rax,%rax)
1454e4550:     	addq	$0x78, %rsi
1454e4554:     	cmpq	$0x3480, %rsi           # imm = 0x3480
1454e455b:     	je	0x1454e615a <.text+0x54e515a>
1454e4561:     	cmpq	%r14, 0x8(%rsi,%r15)
1454e4566:     	jne	0x1454e4550 <.text+0x54e3550>
1454e4568:     	movq	(%rsi,%r15), %rcx
1454e456c:     	movq	%rdi, %rdx
1454e456f:     	movq	%r14, %r8
1454e4572:     	callq	0x145756dd7 <.text+0x5755dd7>
1454e4577:     	testl	%eax, %eax
1454e4579:     	jne	0x1454e4550 <.text+0x54e3550>
1454e457b:     	xorps	%xmm0, %xmm0
1454e457e:     	movups	%xmm0, 0x174(%rbp)
1454e4585:     	movl	$0x0, 0x184(%rbp)
1454e458f:     	leaq	(%r15,%rsi), %r8
1454e4593:     	movq	%r8, 0x150(%rbp)
1454e459a:     	movl	$0x1, 0x158(%rbp)
1454e45a4:     	movsd	0x414774(%rip), %xmm0   # 0x1458f8d20
1454e45ac:     	movsd	%xmm0, 0x15c(%rbp)
1454e45b4:     	movq	$0x3f800000, 0x164(%rbp) # imm = 0x3F800000
1454e45bf:     	movsd	0x406f79(%rip), %xmm0   # 0x1458eb540
1454e45c7:     	movsd	%xmm0, 0x16c(%rbp)
1454e45cf:     	leaq	0x188(%rbp), %rcx
1454e45d6:     	movsd	%xmm0, 0x188(%rbp)
1454e45de:     	movl	$0x0, 0x190(%rbp)
1454e45e8:     	movaps	0x414741(%rip), %xmm0   # 0x1458f8d30
1454e45ef:     	movups	%xmm0, 0x194(%rbp)
1454e45f6:     	movq	0x2a0(%rbp), %rax
1454e45fd:     	leaq	0x6c0(%rax), %rdx
1454e4604:     	callq	0x145415f40 <.text+0x5414f40>
1454e4609:     	nop
1454e460a:     	leaq	0x1f0(%rbp), %rcx
1454e4611:     	leaq	0x150(%rbp), %rdx
1454e4618:     	movq	%r12, %r8
1454e461b:     	callq	0x14540f1c0 <.text+0x540e1c0>
1454e4620:     	nop
1454e4621:     	movups	0x1f0(%rbp), %xmm0
1454e4628:     	movups	0x200(%rbp), %xmm1
1454e462f:     	movups	0x210(%rbp), %xmm2
1454e4636:     	movups	0x220(%rbp), %xmm3
1454e463d:     	movaps	%xmm0, 0x150(%rbp)
1454e4644:     	movaps	%xmm1, 0x160(%rbp)
1454e464b:     	movaps	%xmm2, 0x170(%rbp)
1454e4652:     	movaps	%xmm3, 0x180(%rbp)
1454e4659:     	movups	0x230(%rbp), %xmm0
1454e4660:     	movaps	%xmm0, 0x190(%rbp)
1454e4667:     	movq	0x240(%rbp), %rax
1454e466e:     	movq	%rax, 0x1a0(%rbp)
1454e4675:     	movq	0x248(%rbp), %rdx
1454e467c:     	cmpq	$-0x1, %rdx
1454e4680:     	je	0x1454e4699 <.text+0x54e3699>
1454e4682:     	testq	%rdx, %rdx
1454e4685:     	je	0x1454e4699 <.text+0x54e3699>
1454e4687:     	movq	0x250(%rbp), %rcx
1454e468e:     	movl	$0x1, %r8d
1454e4694:     	callq	0x1400021d0 <.text+0x11d0>
1454e4699:     	movq	0x2a0(%rbp), %rbx
1454e46a0:     	movq	0x2a0(%rbx), %rdi
1454e46a7:     	cmpq	0x290(%rbx), %rdi
1454e46ae:     	jne	0x1454e46bd <.text+0x54e36bd>
1454e46b0:     	leaq	0x290(%rbx), %rcx
1454e46b7:     	callq	0x14575b510 <.text+0x575a510>
1454e46bc:     	nop
1454e46bd:     	movq	0x298(%rbx), %rax
1454e46c4:     	imulq	$0x58, %rdi, %rcx
1454e46c8:     	movq	0x1a0(%rbp), %rdx
1454e46cf:     	movq	%rdx, 0x50(%rax,%rcx)
1454e46d4:     	movaps	0x190(%rbp), %xmm0
1454e46db:     	movups	%xmm0, 0x40(%rax,%rcx)
1454e46e0:     	movaps	0x150(%rbp), %xmm0
1454e46e7:     	movaps	0x160(%rbp), %xmm1
1454e46ee:     	movaps	0x170(%rbp), %xmm2
1454e46f5:     	movaps	0x180(%rbp), %xmm3
1454e46fc:     	movups	%xmm3, 0x30(%rax,%rcx)
1454e4701:     	movups	%xmm2, 0x20(%rax,%rcx)
1454e4706:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e470b:     	movups	%xmm0, (%rax,%rcx)
1454e470f:     	incq	%rdi
1454e4712:     	movq	%rdi, 0x2a0(%rbx)
1454e4719:     	movl	0x40(%rsi,%r15), %esi
1454e471e:     	callq	0x140002200 <.text+0x1200>
1454e4723:     	movl	$0x20, %ecx
1454e4728:     	movl	$0x1, %edx
1454e472d:     	callq	0x1400021c0 <.text+0x11c0>
1454e4732:     	testq	%rax, %rax
1454e4735:     	je	0x1454e618c <.text+0x54e518c>
1454e473b:     	movq	%rbx, %rdi
1454e473e:     	movw	%si, (%rax)
1454e4741:     	movq	%rax, 0x2b8(%rbp)
1454e4748:     	movw	$0x0, 0x2(%rax)
1454e474e:     	movq	0x548(%rbx), %rsi
1454e4755:     	cmpq	0x538(%rbx), %rsi
1454e475c:     	jne	0x1454e476b <.text+0x54e376b>
1454e475e:     	leaq	0x538(%rdi), %rcx
1454e4765:     	callq	0x1457580b0 <.text+0x57570b0>
1454e476a:     	nop
1454e476b:     	movq	0x540(%rdi), %rax
1454e4772:     	movq	%rsi, %rcx
1454e4775:     	shlq	$0x5, %rcx
1454e4779:     	movq	$0x20, (%rax,%rcx)
1454e4781:     	movq	0x2b8(%rbp), %rdx
1454e4788:     	movq	%rdx, 0x8(%rax,%rcx)
1454e478d:     	movq	$0x4, 0x10(%rax,%rcx)
1454e4796:     	movw	$0x12b, 0x18(%rax,%rcx) # imm = 0x12B
1454e479d:     	incq	%rsi
1454e47a0:     	movq	%rsi, 0x548(%rdi)
1454e47a7:     	movq	%rdi, %rcx
1454e47aa:     	callq	0x1454e3d30 <.text+0x54e2d30>
1454e47af:     	nop
1454e47b0:     	jmp	0x1454e4c93 <.text+0x54e3c93>
1454e47b5:     	movl	0xb0(%rbp), %eax
1454e47bb:     	xorps	%xmm0, %xmm0
1454e47be:     	cvtsi2ss	%rax, %xmm0
1454e47c3:     	movq	0x2a0(%rbp), %r12
1454e47ca:     	mulss	0x488(%r12), %xmm0
1454e47d4:     	callq	0x145756e1f <.text+0x5755e1f>
1454e47d9:     	cvttss2si	%xmm0, %rax
1454e47de:     	xorl	%ecx, %ecx
1454e47e0:     	xorps	%xmm1, %xmm1
1454e47e3:     	ucomiss	%xmm1, %xmm0
1454e47e6:     	cmovbl	%ecx, %eax
1454e47e9:     	ucomiss	0x406d2c(%rip), %xmm0   # 0x1458eb51c
1454e47f0:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454e47f5:     	cmovbel	%eax, %ecx
1454e47f8:     	movl	0x408(%r12), %eax
1454e4800:     	addl	%ecx, %eax
1454e4802:     	movl	%eax, 0x408(%r12)
1454e480a:     	addl	%ecx, 0x66c(%r12)
1454e4812:     	imull	$0x2710, %eax, %r8d     # imm = 0x2710
1454e4819:     	movq	0x8b8(%r12), %rax
1454e4821:     	testq	%rax, %rax
1454e4824:     	je	0x1454e4cc7 <.text+0x54e3cc7>
1454e482a:     	movq	0x8c0(%r12), %rcx
1454e4832:     	movl	$0x498, %edx            # imm = 0x498
1454e4837:     	movzwl	0x36(%rax), %r10d
1454e483c:     	movl	%r10d, %r11d
1454e483f:     	addl	%r11d, %r11d
1454e4842:     	movq	$-0x1, %r9
1454e4849:     	nopl	(%rax)
1454e4850:     	testq	%r11, %r11
1454e4853:     	je	0x1454e487e <.text+0x54e387e>
1454e4855:     	movzwl	0x3a(%rax,%r9,2), %esi
1454e485b:     	cmpl	%esi, %edx
1454e485d:     	seta	%bl
1454e4860:     	sbbb	$0x0, %bl
1454e4863:     	incq	%r9
1454e4866:     	addq	$-0x2, %r11
1454e486a:     	cmpb	$0x1, %bl
1454e486d:     	je	0x1454e4850 <.text+0x54e3850>
1454e486f:     	movzbl	%bl, %r10d
1454e4873:     	testl	%r10d, %r10d
1454e4876:     	je	0x1454e4c9b <.text+0x54e3c9b>
1454e487c:     	jmp	0x1454e4881 <.text+0x54e3881>
1454e487e:     	movq	%r10, %r9
1454e4881:     	subq	$0x1, %rcx
1454e4885:     	jb	0x1454e4cc9 <.text+0x54e3cc9>
1454e488b:     	movq	0x50(%rax,%r9,8), %rax
1454e4890:     	jmp	0x1454e4837 <.text+0x54e3837>
1454e4892:     	movq	0xb0(%rbp), %r13
1454e4899:     	movq	0x2a0(%rbp), %rax
1454e48a0:     	movq	0x2b8(%rax), %rax
1454e48a7:     	testq	%rax, %rax
1454e48aa:     	je	0x1454e4b3a <.text+0x54e3b3a>
1454e48b0:     	movq	0x2a0(%rbp), %rcx
1454e48b7:     	movq	0x2b0(%rcx), %rsi
1454e48be:     	shlq	$0x3, %rax
1454e48c2:     	leaq	(%rax,%rax,2), %r15
1454e48c6:     	movq	(%r13), %rbx
1454e48ca:     	movq	0x8(%r13), %r14
1454e48ce:     	xorl	%edi, %edi
1454e48d0:     	jmp	0x1454e48ed <.text+0x54e38ed>
1454e48d2:     	nopw	%cs:(%rax,%rax)
1454e48e0:     	addq	$0x18, %rdi
1454e48e4:     	cmpq	%rdi, %r15
1454e48e7:     	je	0x1454e4b3a <.text+0x54e3b3a>
1454e48ed:     	movq	(%rsi,%rdi), %rax
1454e48f1:     	cmpq	%r14, 0x8(%rax)
1454e48f5:     	jne	0x1454e48e0 <.text+0x54e38e0>
1454e48f7:     	movq	(%rax), %rcx
1454e48fa:     	movq	%rbx, %rdx
1454e48fd:     	movq	%r14, %r8
1454e4900:     	callq	0x145756dd7 <.text+0x5755dd7>
1454e4905:     	testl	%eax, %eax
1454e4907:     	jne	0x1454e48e0 <.text+0x54e38e0>
1454e4909:     	movss	0x10(%rsi,%rdi), %xmm0
1454e490f:     	movl	0x14(%rsi,%rdi), %eax
1454e4913:     	movss	%xmm0, 0x1f4(%rbp)
1454e491b:     	movl	%eax, 0x1f8(%rbp)
1454e4921:     	movl	$0x1, %eax
1454e4926:     	jmp	0x1454e4b3c <.text+0x54e3b3c>
1454e492b:     	movq	0xb0(%rbp), %rsi
1454e4932:     	movq	0x2a0(%rbp), %r12
1454e4939:     	leaq	0x308(%r12), %rdi
1454e4941:     	cmpq	$-0x1, 0x308(%r12)
1454e494a:     	movq	%rsi, 0x2b8(%rbp)
1454e4951:     	je	0x1454e4d15 <.text+0x54e3d15>
1454e4957:     	movq	0x318(%r12), %r8
1454e495f:     	cmpq	0x10(%rsi), %r8
1454e4963:     	jne	0x1454e497e <.text+0x54e397e>
1454e4965:     	movq	0x8(%rsi), %rdx
1454e4969:     	movq	0x310(%r12), %rcx
1454e4971:     	callq	0x145756dd7 <.text+0x5755dd7>
1454e4976:     	testl	%eax, %eax
1454e4978:     	je	0x1454e610e <.text+0x54e510e>
1454e497e:     	movups	0x60(%rsi), %xmm0
1454e4982:     	movaps	%xmm0, 0x250(%rbp)
1454e4989:     	movups	0x50(%rsi), %xmm0
1454e498d:     	movaps	%xmm0, 0x240(%rbp)
1454e4994:     	movups	0x40(%rsi), %xmm0
1454e4998:     	movaps	%xmm0, 0x230(%rbp)
1454e499f:     	movups	(%rsi), %xmm0
1454e49a2:     	movups	0x10(%rsi), %xmm1
1454e49a6:     	movups	0x20(%rsi), %xmm2
1454e49aa:     	movups	0x30(%rsi), %xmm3
1454e49ae:     	movaps	%xmm3, 0x220(%rbp)
1454e49b5:     	movaps	%xmm2, 0x210(%rbp)
1454e49bc:     	movaps	%xmm1, 0x200(%rbp)
1454e49c3:     	movaps	%xmm0, 0x1f0(%rbp)
1454e49ca:     	movq	%rdi, %rcx
1454e49cd:     	callq	0x140272770 <.text+0x271770>
1454e49d2:     	jmp	0x1454e4d61 <.text+0x54e3d61>
1454e49d7:     	movq	0xb0(%rbp), %rax
1454e49de:     	movq	%rax, 0x2b8(%rbp)
1454e49e5:     	movq	0xc0(%rbp), %rax
1454e49ec:     	movq	0x2a0(%rbp), %rcx
1454e49f3:     	cmpq	0x2a0(%rcx), %rax
1454e49fa:     	jae	0x1454e4cac <.text+0x54e3cac>
1454e4a00:     	movq	%rdx, 0x2a8(%rbp)
1454e4a07:     	movq	0xb8(%rbp), %rsi
1454e4a0e:     	testq	%rsi, %rsi
1454e4a11:     	je	0x1454e4ca5 <.text+0x54e3ca5>
1454e4a17:     	imulq	$0x58, %rax, %rdi
1454e4a1b:     	movq	0x2a0(%rbp), %rax
1454e4a22:     	addq	0x298(%rax), %rdi
1454e4a29:     	leaq	0x14c84b0(%rip), %r15   # 0x1469acee0
1454e4a30:     	movss	0x406a48(%rip), %xmm6   # 0x1458eb480
1454e4a38:     	movss	0x55ce14(%rip), %xmm7   # 0x145a41854
1454e4a40:     	movss	0x72fa27(%rip), %xmm8   # 0x145c14470
1454e4a49:     	xorps	%xmm9, %xmm9
1454e4a4d:     	movss	0x406ac6(%rip), %xmm10  # 0x1458eb51c
1454e4a56:     	xorl	%r13d, %r13d
1454e4a59:     	jmp	0x1454e4aac <.text+0x54e3aac>
1454e4a5b:     	movss	0x20(%rdi), %xmm1
1454e4a60:     	addss	%xmm0, %xmm1
1454e4a64:     	movss	%xmm1, 0x20(%rdi)
1454e4a69:     	incl	0x24(%rdi,%rax,4)
1454e4a6d:     	subl	$0x2, %r14d
1454e4a71:     	movl	$0x0, %eax
1454e4a76:     	cmovbl	%eax, %r14d
1454e4a7a:     	xorps	%xmm0, %xmm0
1454e4a7d:     	cvtsi2ss	%r14, %xmm0
1454e4a82:     	mulss	%xmm7, %xmm0
1454e4a86:     	addss	%xmm6, %xmm0
1454e4a8a:     	movaps	%xmm8, %xmm1
1454e4a8e:     	divss	%xmm0, %xmm1
1454e4a92:     	addss	%xmm6, %xmm1
1454e4a96:     	mulss	0x10(%rdi), %xmm1
1454e4a9b:     	movss	%xmm1, 0x10(%rdi)
1454e4aa0:     	incq	%r13
1454e4aa3:     	cmpq	%r13, %rsi
1454e4aa6:     	je	0x1454e4ca5 <.text+0x54e3ca5>
1454e4aac:     	movq	0x2b8(%rbp), %rax
1454e4ab3:     	movb	(%rax,%r13), %bl
1454e4ab7:     	movl	0x8(%rdi), %r14d
1454e4abb:     	incl	%r14d
1454e4abe:     	movl	%r14d, 0x8(%rdi)
1454e4ac2:     	movq	%rdi, %rcx
1454e4ac5:     	movl	%ebx, %edx
1454e4ac7:     	movq	%r12, %r8
1454e4aca:     	callq	0x1454f94c0 <.text+0x54f84c0>
1454e4acf:     	nop
1454e4ad0:     	movzbl	%bl, %eax
1454e4ad3:     	movslq	(%r15,%rax,4), %rcx
1454e4ad7:     	addq	%r15, %rcx
1454e4ada:     	jmpq	*%rcx
1454e4adc:     	addss	%xmm6, %xmm0
1454e4ae0:     	mulss	0x10(%rdi), %xmm0
1454e4ae5:     	movss	%xmm0, 0x10(%rdi)
1454e4aea:     	jmp	0x1454e4a69 <.text+0x54e3a69>
1454e4aef:     	cvttss2si	%xmm0, %rcx
1454e4af4:     	ucomiss	%xmm9, %xmm0
1454e4af8:     	movl	$0x0, %edx
1454e4afd:     	cmovbl	%edx, %ecx
1454e4b00:     	ucomiss	%xmm10, %xmm0
1454e4b04:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454e4b09:     	cmoval	%edx, %ecx
1454e4b0c:     	addl	%ecx, 0x18(%rdi)
1454e4b0f:     	jmp	0x1454e4a69 <.text+0x54e3a69>
1454e4b14:     	movss	0x1c(%rdi), %xmm1
1454e4b19:     	addss	%xmm0, %xmm1
1454e4b1d:     	movss	%xmm1, 0x1c(%rdi)
1454e4b22:     	jmp	0x1454e4a69 <.text+0x54e3a69>
1454e4b27:     	movss	0x14(%rdi), %xmm1
1454e4b2c:     	subss	%xmm0, %xmm1
1454e4b30:     	movss	%xmm1, 0x14(%rdi)
1454e4b35:     	jmp	0x1454e4a69 <.text+0x54e3a69>
1454e4b3a:     	xorl	%eax, %eax
1454e4b3c:     	movl	%eax, 0x1f0(%rbp)
1454e4b42:     	leaq	0x1f0(%rbp), %r8
1454e4b49:     	movq	%r13, %rcx
1454e4b4c:     	movq	%r12, %rdx
1454e4b4f:     	callq	0x145412bb0 <.text+0x5411bb0>
1454e4b54:     	nop
1454e4b55:     	movaps	%xmm0, %xmm6
1454e4b58:     	movq	%r13, 0x2b8(%rbp)
1454e4b5f:     	cmpb	$0xf, 0x44(%r13)
1454e4b64:     	jne	0x1454e4bb1 <.text+0x54e3bb1>
1454e4b66:     	movq	0x2a0(%rbp), %r8
1454e4b6d:     	movl	0x4a8(%r8), %eax
1454e4b74:     	xorl	%ecx, %ecx
1454e4b76:     	movl	$0x2, %edx
1454e4b7b:     	subl	%eax, %edx
1454e4b7d:     	cmovbl	%ecx, %edx
1454e4b80:     	xorps	%xmm0, %xmm0
1454e4b83:     	cvtsi2ss	%edx, %xmm0
1454e4b87:     	minss	%xmm0, %xmm6
1454e4b8b:     	cvttss2si	%xmm6, %rdx
1454e4b90:     	xorps	%xmm0, %xmm0
1454e4b93:     	ucomiss	%xmm0, %xmm6
1454e4b96:     	cmovbl	%ecx, %edx
1454e4b99:     	ucomiss	0x40697c(%rip), %xmm6   # 0x1458eb51c
1454e4ba0:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454e4ba5:     	cmovbel	%edx, %ecx
1454e4ba8:     	addl	%eax, %ecx
1454e4baa:     	movl	%ecx, 0x4a8(%r8)
1454e4bb1:     	movq	0x2a0(%rbp), %rax
1454e4bb8:     	movq	0x2b0(%rax), %r15
1454e4bbf:     	movq	0x2b8(%rax), %rsi
1454e4bc6:     	testq	%rsi, %rsi
1454e4bc9:     	je	0x1454e4c45 <.text+0x54e3c45>
1454e4bcb:     	leaq	(,%rsi,8), %rax
1454e4bd3:     	leaq	(%rax,%rax,2), %rdi
1454e4bd7:     	movq	0x2b8(%rbp), %rax
1454e4bde:     	movq	(%rax), %rbx
1454e4be1:     	movq	0x8(%rax), %r14
1454e4be5:     	xorl	%r13d, %r13d
1454e4be8:     	jmp	0x1454e4bf9 <.text+0x54e3bf9>
1454e4bea:     	nopw	(%rax,%rax)
1454e4bf0:     	addq	$0x18, %r13
1454e4bf4:     	cmpq	%r13, %rdi
1454e4bf7:     	je	0x1454e4c45 <.text+0x54e3c45>
1454e4bf9:     	movq	(%r15,%r13), %rax
1454e4bfd:     	cmpq	%r14, 0x8(%rax)
1454e4c01:     	jne	0x1454e4bf0 <.text+0x54e3bf0>
1454e4c03:     	movq	(%rax), %rcx
1454e4c06:     	movq	%rbx, %rdx
1454e4c09:     	movq	%r14, %r8
1454e4c0c:     	callq	0x145756dd7 <.text+0x5755dd7>
1454e4c11:     	testl	%eax, %eax
1454e4c13:     	jne	0x1454e4bf0 <.text+0x54e3bf0>
1454e4c15:     	addss	0x10(%r15,%r13), %xmm6
1454e4c1c:     	movss	%xmm6, 0x10(%r15,%r13)
1454e4c23:     	incl	0x14(%r15,%r13)
1454e4c28:     	movq	0x8(%r15,%r13), %rax
1454e4c2d:     	cmpq	%rax, %r12
1454e4c30:     	cmovaq	%r12, %rax
1454e4c34:     	movq	%rax, 0x8(%r15,%r13)
1454e4c39:     	movq	0x2a0(%rbp), %r12
1454e4c40:     	jmp	0x1454e4dd4 <.text+0x54e3dd4>
1454e4c45:     	movq	0x2a0(%rbp), %rdi
1454e4c4c:     	leaq	0x2a8(%rdi), %rcx
1454e4c53:     	cmpq	(%rcx), %rsi
1454e4c56:     	movq	0x2b8(%rbp), %rbx
1454e4c5d:     	jne	0x1454e4c6c <.text+0x54e3c6c>
1454e4c5f:     	callq	0x145757f60 <.text+0x5756f60>
1454e4c64:     	nop
1454e4c65:     	movq	0x2b0(%rdi), %r15
1454e4c6c:     	leaq	(%rsi,%rsi,2), %rax
1454e4c70:     	movq	%rbx, (%r15,%rax,8)
1454e4c74:     	movq	%r12, 0x8(%r15,%rax,8)
1454e4c79:     	movss	%xmm6, 0x10(%r15,%rax,8)
1454e4c80:     	movl	$0x1, 0x14(%r15,%rax,8)
1454e4c89:     	incq	%rsi
1454e4c8c:     	movq	%rsi, 0x2b8(%rdi)
1454e4c93:     	movq	%rdi, %r12
1454e4c96:     	jmp	0x1454e4dd4 <.text+0x54e3dd4>
1454e4c9b:     	movl	%r8d, 0x8(%rax,%r9,4)
1454e4ca0:     	jmp	0x1454e4dd4 <.text+0x54e3dd4>
1454e4ca5:     	movq	0x2a8(%rbp), %rdx
1454e4cac:     	testq	%rdx, %rdx
1454e4caf:     	movq	0x2a0(%rbp), %r12
1454e4cb6:     	je	0x1454e4dd4 <.text+0x54e3dd4>
1454e4cbc:     	movl	$0x1, %r8d
1454e4cc2:     	jmp	0x1454e4dc8 <.text+0x54e3dc8>
1454e4cc7:     	xorl	%eax, %eax
1454e4cc9:     	leaq	0x8b8(%r12), %rcx
1454e4cd1:     	movq	%rcx, 0x1f0(%rbp)
1454e4cd8:     	movq	%rax, 0x1f8(%rbp)
1454e4cdf:     	movq	$0x0, 0x200(%rbp)
1454e4cea:     	movq	%r9, 0x208(%rbp)
1454e4cf1:     	movq	$0x498, 0x210(%rbp)     # imm = 0x498
1454e4cfc:     	leaq	0x150(%rbp), %rcx
1454e4d03:     	leaq	0x1f0(%rbp), %rdx
1454e4d0a:     	callq	0x145427a50 <.text+0x5426a50>
1454e4d0f:     	nop
1454e4d10:     	jmp	0x1454e4dd4 <.text+0x54e3dd4>
1454e4d15:     	movups	0x60(%rsi), %xmm0
1454e4d19:     	movaps	%xmm0, 0x250(%rbp)
1454e4d20:     	movups	0x50(%rsi), %xmm0
1454e4d24:     	movaps	%xmm0, 0x240(%rbp)
1454e4d2b:     	movups	0x40(%rsi), %xmm0
1454e4d2f:     	movaps	%xmm0, 0x230(%rbp)
1454e4d36:     	movups	(%rsi), %xmm0
1454e4d39:     	movups	0x10(%rsi), %xmm1
1454e4d3d:     	movups	0x20(%rsi), %xmm2
1454e4d41:     	movups	0x30(%rsi), %xmm3
1454e4d45:     	movaps	%xmm3, 0x220(%rbp)
1454e4d4c:     	movaps	%xmm2, 0x210(%rbp)
1454e4d53:     	movaps	%xmm1, 0x200(%rbp)
1454e4d5a:     	movaps	%xmm0, 0x1f0(%rbp)
1454e4d61:     	movaps	0x250(%rbp), %xmm0
1454e4d68:     	movups	%xmm0, 0x60(%rdi)
1454e4d6c:     	movaps	0x240(%rbp), %xmm0
1454e4d73:     	movups	%xmm0, 0x50(%rdi)
1454e4d77:     	movaps	0x230(%rbp), %xmm0
1454e4d7e:     	movups	%xmm0, 0x40(%rdi)
1454e4d82:     	movaps	0x1f0(%rbp), %xmm0
1454e4d89:     	movaps	0x200(%rbp), %xmm1
1454e4d90:     	movaps	0x210(%rbp), %xmm2
1454e4d97:     	movaps	0x220(%rbp), %xmm3
1454e4d9e:     	movups	%xmm3, 0x30(%rdi)
1454e4da2:     	movups	%xmm2, 0x20(%rdi)
1454e4da6:     	movups	%xmm1, 0x10(%rdi)
1454e4daa:     	movups	%xmm0, (%rdi)
1454e4dad:     	movb	$0x0, 0x2b6(%rbp)
1454e4db4:     	movq	%r12, %rcx
1454e4db7:     	callq	0x1454b7b80 <.text+0x54b6b80>
1454e4dbc:     	nop
1454e4dbd:     	movl	$0x70, %edx
1454e4dc2:     	movl	$0x8, %r8d
1454e4dc8:     	movq	0x2b8(%rbp), %rcx
1454e4dcf:     	callq	0x1400021d0 <.text+0x11d0>
1454e4dd4:     	movq	$0x0, 0x138(%rbp)
1454e4ddf:     	movq	$0x8, 0x140(%rbp)
1454e4dea:     	movq	$0x0, 0x148(%rbp)
1454e4df5:     	movups	0x14c619c(%rip), %xmm0  # 0x1469aaf98
1454e4dfc:     	movups	%xmm0, -0x40(%rbp)
1454e4e00:     	movups	0x14c61a1(%rip), %xmm0  # 0x1469aafa8
1454e4e07:     	movups	%xmm0, -0x57(%rbp)
1454e4e0b:     	movq	$0x0, 0xf8(%rbp)
1454e4e16:     	movq	$0x2, 0x100(%rbp)
1454e4e21:     	leaq	0x108(%rbp), %r14
1454e4e28:     	movb	$0x0, 0x108(%rbp)
1454e4e2f:     	movups	-0x47(%rbp), %xmm0
1454e4e33:     	movups	%xmm0, 0x109(%rbp)
1454e4e3a:     	movq	-0x38(%rbp), %rax
1454e4e3e:     	movq	%rax, 0x118(%rbp)
1454e4e45:     	movb	$0x1, 0x120(%rbp)
1454e4e4c:     	movups	-0x5e(%rbp), %xmm0
1454e4e50:     	movups	%xmm0, 0x121(%rbp)
1454e4e57:     	movq	-0x4f(%rbp), %rax
1454e4e5b:     	movq	%rax, 0x130(%rbp)
1454e4e62:     	movl	$0x8, %eax
1454e4e67:     	xorl	%ebx, %ebx
1454e4e69:     	xorps	%xmm6, %xmm6
1454e4e6c:     	xorl	%r15d, %r15d
1454e4e6f:     	nop
1454e4e70:     	cmpq	$0x2, %r15
1454e4e74:     	je	0x1454e526a <.text+0x54e426a>
1454e4e7a:     	leaq	(%r15,%r15,2), %rdx
1454e4e7e:     	movzbl	(%r14,%rdx,8), %ecx
1454e4e83:     	cmpb	$0x2, %cl
1454e4e86:     	je	0x1454e526a <.text+0x54e426a>
1454e4e8c:     	incq	%r15
1454e4e8f:     	leaq	(%r14,%rdx,8), %rdx
1454e4e93:     	movb	%cl, 0x2b7(%rbp)
1454e4e99:     	movups	0x8(%rdx), %xmm0
1454e4e9d:     	leaq	0x178(%rbp), %rdx
1454e4ea4:     	movups	%xmm0, (%rdx)
1454e4ea7:     	movq	0x2b0(%r12), %rdi
1454e4eaf:     	movq	0x2b8(%r12), %rcx
1454e4eb7:     	leaq	(%rcx,%rcx,2), %rcx
1454e4ebb:     	leaq	(%rdi,%rcx,8), %rsi
1454e4ebf:     	movups	%xmm6, 0x10(%rdx)
1454e4ec3:     	movq	%rsi, 0x158(%rbp)
1454e4eca:     	leaq	0x2b7(%rbp), %rcx
1454e4ed1:     	movq	%rcx, 0x160(%rbp)
1454e4ed8:     	movq	$0x0, 0x168(%rbp)
1454e4ee3:     	movq	$0x2, 0x170(%rbp)
1454e4eee:     	xorl	%ecx, %ecx
1454e4ef0:     	cmpq	%rsi, %rdi
1454e4ef3:     	je	0x1454e4e70 <.text+0x54e3e70>
1454e4ef9:     	movzbl	0x2b7(%rbp), %edx
1454e4f00:     	leaq	0x18(%rdi), %r8
1454e4f04:     	movq	%r8, 0x150(%rbp)
1454e4f0b:     	movq	(%rdi), %r9
1454e4f0e:     	cmpb	%dl, 0x45(%r9)
1454e4f12:     	je	0x1454e4f30 <.text+0x54e3f30>
1454e4f14:     	movq	%r8, %rdi
1454e4f17:     	cmpq	%rsi, %r8
1454e4f1a:     	jne	0x1454e4f00 <.text+0x54e3f00>
1454e4f1c:     	jmp	0x1454e4e70 <.text+0x54e3e70>
1454e4f21:     	nopw	%cs:(%rax,%rax)
1454e4f30:     	cmpq	$0x2, %rcx
1454e4f34:     	je	0x1454e4e70 <.text+0x54e3e70>
1454e4f3a:     	leaq	0x1(%rcx), %rbx
1454e4f3e:     	movq	%rbx, 0x168(%rbp)
1454e4f45:     	movq	0x178(%rbp,%rcx,8), %r14
1454e4f4d:     	movl	0x14(%rdi), %eax
1454e4f50:     	cmpq	$0x1, %rax
1454e4f54:     	movq	%r15, 0x2b8(%rbp)
1454e4f5b:     	movq	%rbx, 0x288(%rbp)
1454e4f62:     	movq	%r14, 0x2a8(%rbp)
1454e4f69:     	jbe	0x1454e4fe0 <.text+0x54e3fe0>
1454e4f6b:     	movl	$0x2, %ecx
1454e4f70:     	leaq	0x14c5841(%rip), %rdx   # 0x1469aa7b8
1454e4f77:     	cmpl	$0xb, %eax
1454e4f7a:     	jae	0x1454e4f90 <.text+0x54e3f90>
1454e4f7c:     	shlq	$0x4, %rax
1454e4f80:     	leaq	0x14c5781(%rip), %rcx   # 0x1469aa708
1454e4f87:     	movq	(%rax,%rcx), %rdx
1454e4f8b:     	movq	0x8(%rax,%rcx), %rcx
1454e4f90:     	movq	%rdx, 0x1b0(%rbp)
1454e4f97:     	movq	%rcx, 0x1b8(%rbp)
1454e4f9e:     	leaq	0x1b0(%rbp), %rax
1454e4fa5:     	movq	%rax, 0x1d0(%rbp)
1454e4fac:     	leaq	-0x54e2ef3(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454e4fb3:     	movq	%rax, 0x1d8(%rbp)
1454e4fba:     	movb	$0x1, 0x2c6(%rbp)
1454e4fc1:     	leaq	0x268(%rbp), %rcx
1454e4fc8:     	leaq	0x14c57eb(%rip), %rdx   # 0x1469aa7ba
1454e4fcf:     	leaq	0x1d0(%rbp), %r8
1454e4fd6:     	callq	0x14570bf80 <.text+0x570af80>
1454e4fdb:     	nop
1454e4fdc:     	jmp	0x1454e5001 <.text+0x54e4001>
1454e4fde:     	nop
1454e4fe0:     	movq	$0x0, 0x268(%rbp)
1454e4feb:     	movq	$0x1, 0x270(%rbp)
1454e4ff6:     	movq	$0x0, 0x278(%rbp)
1454e5001:     	movq	(%rdi), %rbx
1454e5004:     	movq	%rbx, 0x1b0(%rbp)
1454e500b:     	leaq	-0x54e2f52(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454e5012:     	movq	%rax, 0x1b8(%rbp)
1454e5019:     	leaq	0x1d0(%rbp), %rcx
1454e5020:     	leaq	0x12384fc(%rip), %rdx   # 0x14671d523
1454e5027:     	leaq	0x1b0(%rbp), %r8
1454e502e:     	callq	0x14570bf80 <.text+0x570af80>
1454e5033:     	nop
1454e5034:     	movq	0x1d8(%rbp), %rcx
1454e503b:     	movq	0x1e0(%rbp), %rdx
1454e5042:     	movq	0x10(%rbx), %r12
1454e5046:     	movq	0x18(%rbx), %r13
1454e504a:     	movq	%rcx, 0x290(%rbp)
1454e5051:     	callq	0x145452400 <.text+0x5451400>
1454e5056:     	nop
1454e5057:     	movq	%rax, %r15
1454e505a:     	movq	%rdx, %r14
1454e505d:     	movq	0x1d0(%rbp), %rdx
1454e5064:     	testq	%rdx, %rdx
1454e5067:     	je	0x1454e507b <.text+0x54e407b>
1454e5069:     	movl	$0x1, %r8d
1454e506f:     	movq	0x290(%rbp), %rcx
1454e5076:     	callq	0x1400021d0 <.text+0x11d0>
1454e507b:     	testq	%r15, %r15
1454e507e:     	cmovneq	%r15, %r12
1454e5082:     	cmoveq	%r13, %r14
1454e5086:     	movq	%r12, 0xe0(%rbp)
1454e508d:     	movq	%r14, 0xe8(%rbp)
1454e5094:     	leaq	0xe0(%rbp), %rax
1454e509b:     	movq	%rax, 0x1d0(%rbp)
1454e50a2:     	leaq	-0x54e2fe9(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454e50a9:     	movq	%rax, 0x1d8(%rbp)
1454e50b0:     	leaq	0x268(%rbp), %rax
1454e50b7:     	movq	%rax, 0x1e0(%rbp)
1454e50be:     	leaq	-0x54e2fe5(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454e50c5:     	movq	%rax, 0x1e8(%rbp)
1454e50cc:     	leaq	0x1b0(%rbp), %rcx
1454e50d3:     	leaq	0x14c56e4(%rip), %rdx   # 0x1469aa7be
1454e50da:     	leaq	0x1d0(%rbp), %r8
1454e50e1:     	callq	0x14570bf80 <.text+0x570af80>
1454e50e6:     	nop
1454e50e7:     	movq	0x1b0(%rbp), %rax
1454e50ee:     	movq	%rax, 0x290(%rbp)
1454e50f5:     	movq	0x1b8(%rbp), %rax
1454e50fc:     	movq	%rax, 0x1c8(%rbp)
1454e5103:     	movq	0x1c0(%rbp), %r15
1454e510a:     	movq	0x8(%rdi), %r12
1454e510e:     	cmpb	$0x1, 0x45(%rbx)
1454e5112:     	movl	$0xc, %r13d
1454e5118:     	sbbl	$0x0, %r13d
1454e511c:     	movq	0x20(%rbx), %rcx
1454e5120:     	movq	0x28(%rbx), %rdx
1454e5124:     	callq	0x145419d60 <.text+0x5418d60>
1454e5129:     	nop
1454e512a:     	movl	%eax, %r14d
1454e512d:     	movss	0x10(%rdi), %xmm2
1454e5132:     	leaq	0x1d0(%rbp), %rcx
1454e5139:     	movq	%rbx, %rdx
1454e513c:     	callq	0x1454187d0 <.text+0x54177d0>
1454e5141:     	nop
1454e5142:     	incl	%r12d
1454e5145:     	movq	0x2a8(%rbp), %rax
1454e514c:     	movq	%rax, 0x220(%rbp)
1454e5153:     	movl	$0x0, 0x228(%rbp)
1454e515d:     	movq	0x290(%rbp), %rax
1454e5164:     	movq	%rax, 0x1f0(%rbp)
1454e516b:     	movq	0x1c8(%rbp), %rax
1454e5172:     	movq	%rax, 0x1f8(%rbp)
1454e5179:     	movq	%r15, 0x200(%rbp)
1454e5180:     	movl	%r12d, 0x22c(%rbp)
1454e5187:     	movl	%r13d, 0x230(%rbp)
1454e518e:     	movl	%r14d, 0x234(%rbp)
1454e5195:     	movq	0x1e0(%rbp), %rax
1454e519c:     	leaq	0x208(%rbp), %rcx
1454e51a3:     	movq	%rax, 0x10(%rcx)
1454e51a7:     	movups	0x1d0(%rbp), %xmm0
1454e51ae:     	movups	%xmm0, (%rcx)
1454e51b1:     	movq	0x268(%rbp), %rdx
1454e51b8:     	testq	%rdx, %rdx
1454e51bb:     	je	0x1454e51cf <.text+0x54e41cf>
1454e51bd:     	movq	0x270(%rbp), %rcx
1454e51c4:     	movl	$0x1, %r8d
1454e51ca:     	callq	0x1400021d0 <.text+0x11d0>
1454e51cf:     	movq	0x148(%rbp), %rbx
1454e51d6:     	cmpq	0x138(%rbp), %rbx
1454e51dd:     	movq	0x2a0(%rbp), %r12
1454e51e4:     	leaq	0x108(%rbp), %r14
1454e51eb:     	movq	0x2b8(%rbp), %r15
1454e51f2:     	jne	0x1454e5201 <.text+0x54e4201>
1454e51f4:     	leaq	0x138(%rbp), %rcx
1454e51fb:     	callq	0x145757fd0 <.text+0x5756fd0>
1454e5200:     	nop
1454e5201:     	addq	$0x18, %rdi
1454e5205:     	movq	0x140(%rbp), %rax
1454e520c:     	leaq	(%rbx,%rbx,8), %rcx
1454e5210:     	movq	0x230(%rbp), %rdx
1454e5217:     	movq	%rdx, 0x40(%rax,%rcx,8)
1454e521c:     	movups	0x1f0(%rbp), %xmm0
1454e5223:     	movups	0x200(%rbp), %xmm1
1454e522a:     	movups	0x210(%rbp), %xmm2
1454e5231:     	movups	0x220(%rbp), %xmm3
1454e5238:     	movups	%xmm3, 0x30(%rax,%rcx,8)
1454e523d:     	movups	%xmm2, 0x20(%rax,%rcx,8)
1454e5242:     	movups	%xmm1, 0x10(%rax,%rcx,8)
1454e5247:     	movups	%xmm0, (%rax,%rcx,8)
1454e524b:     	incq	%rbx
1454e524e:     	movq	%rbx, 0x148(%rbp)
1454e5255:     	movq	0x288(%rbp), %rcx
1454e525c:     	cmpq	%rsi, %rdi
1454e525f:     	jne	0x1454e4ef9 <.text+0x54e3ef9>
1454e5265:     	jmp	0x1454e4e70 <.text+0x54e3e70>
1454e526a:     	cmpq	$-0x1, 0x308(%r12)
1454e5273:     	je	0x1454e5642 <.text+0x54e4642>
1454e5279:     	movl	0x370(%r12), %eax
1454e5281:     	cmpq	$0x1, %rax
1454e5285:     	jbe	0x1454e52a2 <.text+0x54e42a2>
1454e5287:     	cmpl	$0xb, %eax
1454e528a:     	jae	0x1454e52c5 <.text+0x54e42c5>
1454e528c:     	shlq	$0x4, %rax
1454e5290:     	leaq	0x14c5471(%rip), %rdx   # 0x1469aa708
1454e5297:     	movq	(%rax,%rdx), %rcx
1454e529b:     	movq	0x8(%rax,%rdx), %rax
1454e52a0:     	jmp	0x1454e52d1 <.text+0x54e42d1>
1454e52a2:     	movq	$0x0, 0x1d0(%rbp)
1454e52ad:     	movq	$0x1, 0x1d8(%rbp)
1454e52b8:     	movq	$0x0, 0x1e0(%rbp)
1454e52c3:     	jmp	0x1454e5339 <.text+0x54e4339>
1454e52c5:     	movl	$0x2, %eax
1454e52ca:     	leaq	0x14c54e7(%rip), %rcx   # 0x1469aa7b8
1454e52d1:     	leaq	0xf8(%rbp), %rdx
1454e52d8:     	movq	%rcx, 0xf8(%rbp)
1454e52df:     	movq	%rax, 0x100(%rbp)
1454e52e6:     	movq	%rdx, 0x150(%rbp)
1454e52ed:     	leaq	-0x54e3234(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454e52f4:     	movq	%rax, 0x158(%rbp)
1454e52fb:     	movb	$0x1, 0x2c6(%rbp)
1454e5302:     	leaq	0x14c54b1(%rip), %rdx   # 0x1469aa7ba
1454e5309:     	leaq	0x1f0(%rbp), %rcx
1454e5310:     	leaq	0x150(%rbp), %r8
1454e5317:     	callq	0x14570bf80 <.text+0x570af80>
1454e531c:     	nop
1454e531d:     	movups	0x1f0(%rbp), %xmm0
1454e5324:     	movaps	%xmm0, 0x1d0(%rbp)
1454e532b:     	movq	0x200(%rbp), %rax
1454e5332:     	movq	%rax, 0x1e0(%rbp)
1454e5339:     	leaq	0x320(%r12), %rax
1454e5341:     	movq	%rax, 0x1f0(%rbp)
1454e5348:     	leaq	-0x54e326f(%rip), %rcx  # 0x1400020e0 <.text+0x10e0>
1454e534f:     	movq	%rcx, 0x1f8(%rbp)
1454e5356:     	leaq	0x1d0(%rbp), %rax
1454e535d:     	movq	%rax, 0x200(%rbp)
1454e5364:     	movq	%rcx, 0x208(%rbp)
1454e536b:     	leaq	0x14c544c(%rip), %rdx   # 0x1469aa7be
1454e5372:     	leaq	0x150(%rbp), %rbx
1454e5379:     	leaq	0x1f0(%rbp), %r8
1454e5380:     	movq	%rbx, %rcx
1454e5383:     	callq	0x14570bf80 <.text+0x570af80>
1454e5388:     	nop
1454e5389:     	movq	0x150(%rbp), %rax
1454e5390:     	movq	%rax, 0x2b8(%rbp)
1454e5397:     	movq	0x158(%rbp), %rax
1454e539e:     	movq	%rax, 0x2a8(%rbp)
1454e53a5:     	movq	0x160(%rbp), %rsi
1454e53ac:     	movl	0x360(%r12), %r14d
1454e53b4:     	movq	0x350(%r12), %rcx
1454e53bc:     	movq	0x358(%r12), %rdx
1454e53c4:     	callq	0x145419d60 <.text+0x5418d60>
1454e53c9:     	nop
1454e53ca:     	movl	%eax, %edi
1454e53cc:     	movq	0x368(%r12), %rax
1454e53d4:     	cmpq	$0x4, %rax
1454e53d8:     	movl	$0x4, %ecx
1454e53dd:     	cmovbq	%rax, %rcx
1454e53e1:     	movl	%ecx, %eax
1454e53e3:     	leaq	0x123b062(%rip), %rcx   # 0x14672044c
1454e53ea:     	movss	(%rcx,%rax,4), %xmm0
1454e53ef:     	mulss	0x41128d(%rip), %xmm0   # 0x1458f6684
1454e53f7:     	addss	0x406081(%rip), %xmm0   # 0x1458eb480
1454e53ff:     	movl	0x370(%r12), %eax
1454e5407:     	cmpl	$0x1, %eax
1454e540a:     	adcl	$-0x1, %eax
1454e540d:     	xorps	%xmm1, %xmm1
1454e5410:     	cvtsi2ss	%eax, %xmm1
1454e5414:     	callq	0x145756e73 <.text+0x5755e73>
1454e5419:     	addss	%xmm0, %xmm0
1454e541d:     	movss	0x411207(%rip), %xmm1   # 0x1458f662c
1454e5425:     	subss	%xmm0, %xmm1
1454e5429:     	movss	%xmm1, 0x150(%rbp)
1454e5431:     	movq	0x340(%r12), %rax
1454e5439:     	movq	0x348(%r12), %rcx
1454e5441:     	shlq	$0x6, %rcx
1454e5445:     	addq	%rax, %rcx
1454e5448:     	movq	%rax, 0x1f0(%rbp)
1454e544f:     	movq	%rcx, 0x1f8(%rbp)
1454e5456:     	movq	%rbx, 0x200(%rbp)
1454e545d:     	leaq	0xf8(%rbp), %rcx
1454e5464:     	leaq	0x1f0(%rbp), %rdx
1454e546b:     	callq	0x145535e10 <.text+0x5534e10>
1454e5470:     	nop
1454e5471:     	movq	0x100(%rbp), %r13
1454e5478:     	movq	0x108(%rbp), %r15
1454e547f:     	testq	%r15, %r15
1454e5482:     	movq	%r13, 0x288(%rbp)
1454e5489:     	je	0x1454e54c1 <.text+0x54e44c1>
1454e548b:     	leaq	(,%r15,8), %rax
1454e5493:     	leaq	(%rax,%rax,2), %rbx
1454e5497:     	callq	0x140002200 <.text+0x1200>
1454e549c:     	movl	$0x8, %edx
1454e54a1:     	movq	%rbx, %rcx
1454e54a4:     	callq	0x1400021c0 <.text+0x11c0>
1454e54a9:     	testq	%rax, %rax
1454e54ac:     	jne	0x1454e54c6 <.text+0x54e44c6>
1454e54ae:     	movl	$0x8, %ecx
1454e54b3:     	movq	%rbx, %rdx
1454e54b6:     	callq	0x1458e721b <.text+0x58e621b>
1454e54bb:     	nop
1454e54bc:     	jmp	0x1454e619c <.text+0x54e519c>
1454e54c1:     	movl	$0x8, %eax
1454e54c6:     	movq	%r15, %rdx
1454e54c9:     	shlq	$0x6, %rdx
1454e54cd:     	addq	%r13, %rdx
1454e54d0:     	movq	%r15, 0x150(%rbp)
1454e54d7:     	movq	%rax, 0x158(%rbp)
1454e54de:     	leaq	0x160(%rbp), %rcx
1454e54e5:     	movq	$0x0, 0x160(%rbp)
1454e54f0:     	movq	%rax, 0x200(%rbp)
1454e54f7:     	movq	%rcx, 0x1f0(%rbp)
1454e54fe:     	movq	$0x0, 0x1f8(%rbp)
1454e5509:     	leaq	0x1f0(%rbp), %r8
1454e5510:     	movq	%r13, %rcx
1454e5513:     	callq	0x145519350 <.text+0x5518350>
1454e5518:     	nop
1454e5519:     	incl	%r14d
1454e551c:     	movups	0x150(%rbp), %xmm0
1454e5523:     	movups	%xmm0, 0x208(%rbp)
1454e552a:     	movq	0x160(%rbp), %rax
1454e5531:     	movq	%rax, 0x218(%rbp)
1454e5538:     	movq	$0x1, 0x220(%rbp)
1454e5543:     	movl	$0x0, 0x228(%rbp)
1454e554d:     	movq	0x2b8(%rbp), %rax
1454e5554:     	movq	%rax, 0x1f0(%rbp)
1454e555b:     	movq	0x2a8(%rbp), %rax
1454e5562:     	movq	%rax, 0x1f8(%rbp)
1454e5569:     	movq	%rsi, 0x200(%rbp)
1454e5570:     	movl	%r14d, 0x22c(%rbp)
1454e5577:     	movl	$0x2, 0x230(%rbp)
1454e5581:     	movl	%edi, 0x234(%rbp)
1454e5587:     	movq	0x148(%rbp), %rsi
1454e558e:     	cmpq	0x138(%rbp), %rsi
1454e5595:     	jne	0x1454e55a4 <.text+0x54e45a4>
1454e5597:     	leaq	0x138(%rbp), %rcx
1454e559e:     	callq	0x145757fd0 <.text+0x5756fd0>
1454e55a3:     	nop
1454e55a4:     	movq	0x140(%rbp), %rax
1454e55ab:     	leaq	(%rsi,%rsi,8), %rcx
1454e55af:     	movq	0x230(%rbp), %rdx
1454e55b6:     	movq	%rdx, 0x40(%rax,%rcx,8)
1454e55bb:     	movups	0x1f0(%rbp), %xmm0
1454e55c2:     	movups	0x200(%rbp), %xmm1
1454e55c9:     	movups	0x210(%rbp), %xmm2
1454e55d0:     	movups	0x220(%rbp), %xmm3
1454e55d7:     	movups	%xmm3, 0x30(%rax,%rcx,8)
1454e55dc:     	movups	%xmm2, 0x20(%rax,%rcx,8)
1454e55e1:     	movups	%xmm1, 0x10(%rax,%rcx,8)
1454e55e6:     	movups	%xmm0, (%rax,%rcx,8)
1454e55ea:     	incq	%rsi
1454e55ed:     	movq	%rsi, 0x148(%rbp)
1454e55f4:     	movq	0xf8(%rbp), %rdx
1454e55fb:     	testq	%rdx, %rdx
1454e55fe:     	movq	0x288(%rbp), %rcx
1454e5605:     	je	0x1454e5616 <.text+0x54e4616>
1454e5607:     	shlq	$0x6, %rdx
1454e560b:     	movl	$0x8, %r8d
1454e5611:     	callq	0x1400021d0 <.text+0x11d0>
1454e5616:     	movq	0x1d0(%rbp), %rdx
1454e561d:     	testq	%rdx, %rdx
1454e5620:     	je	0x1454e5634 <.text+0x54e4634>
1454e5622:     	movq	0x1d8(%rbp), %rcx
1454e5629:     	movl	$0x1, %r8d
1454e562f:     	callq	0x1400021d0 <.text+0x11d0>
1454e5634:     	movq	0x140(%rbp), %rax
1454e563b:     	movq	0x148(%rbp), %rbx
1454e5642:     	leaq	0x2c0(%r12), %rcx
1454e564a:     	movq	%rcx, 0x28(%rbp)
1454e564e:     	movq	0x2d0(%r12), %rcx
1454e5656:     	movq	%rcx, 0xf0(%rbp)
1454e565d:     	movups	0x2c0(%r12), %xmm0
1454e5666:     	movaps	%xmm0, 0xe0(%rbp)
1454e566d:     	movq	$0x0, 0x2c0(%r12)
1454e5679:     	movq	$0x8, 0x2c8(%r12)
1454e5685:     	movq	$0x0, 0x2d0(%r12)
1454e5691:     	movl	$0x0, 0x110(%rbp)
1454e569b:     	movq	$0x0, 0xf8(%rbp)
1454e56a6:     	movq	$0x1, 0x100(%rbp)
1454e56b1:     	movq	$0x0, 0x108(%rbp)
1454e56bc:     	movq	$0x0, 0x268(%rbp)
1454e56c7:     	movq	$0x8, 0x270(%rbp)
1454e56d2:     	movq	$0x0, 0x278(%rbp)
1454e56dd:     	movq	0x138(%rbp), %rcx
1454e56e4:     	leaq	(%rbx,%rbx,8), %rdx
1454e56e8:     	leaq	(%rax,%rdx,8), %rdx
1454e56ec:     	movq	%rax, 0x150(%rbp)
1454e56f3:     	movq	%rax, 0x158(%rbp)
1454e56fa:     	movq	%rcx, 0x160(%rbp)
1454e5701:     	movq	%rdx, 0x18(%rbp)
1454e5705:     	movq	%rdx, 0x168(%rbp)
1454e570c:     	leaq	0x8b8(%r12), %rcx
1454e5714:     	movq	%rcx, 0xd8(%rbp)
1454e571b:     	movq	0xe8(%rbp), %r13
1454e5722:     	movq	0xf0(%rbp), %rcx
1454e5729:     	movq	%rcx, 0x1c8(%rbp)
1454e5730:     	leaq	(%rcx,%rcx,8), %rcx
1454e5734:     	leaq	(,%rcx,8), %rcx
1454e573c:     	addq	%r13, %rcx
1454e573f:     	movq	%rcx, 0x2b8(%rbp)
1454e5746:     	movq	%r13, 0x290(%rbp)
1454e574d:     	jmp	0x1454e579f <.text+0x54e479f>
1454e574f:     	nop
1454e5750:     	movq	0x270(%rbp), %rax
1454e5757:     	leaq	(%rsi,%rsi,8), %rcx
1454e575b:     	movq	0x10(%rbp), %rdx
1454e575f:     	movq	%rdx, 0x40(%rax,%rcx,8)
1454e5764:     	movups	-0x30(%rbp), %xmm0
1454e5768:     	movups	-0x20(%rbp), %xmm1
1454e576c:     	movups	-0x10(%rbp), %xmm2
1454e5770:     	movups	(%rbp), %xmm3
1454e5774:     	movups	%xmm3, 0x30(%rax,%rcx,8)
1454e5779:     	movups	%xmm2, 0x20(%rax,%rcx,8)
1454e577e:     	movups	%xmm1, 0x10(%rax,%rcx,8)
1454e5783:     	movups	%xmm0, (%rax,%rcx,8)
1454e5787:     	incq	%rsi
1454e578a:     	movq	%rsi, 0x278(%rbp)
1454e5791:     	movq	0xd0(%rbp), %rax
1454e5798:     	movq	0x290(%rbp), %r13
1454e579f:     	cmpq	0x18(%rbp), %rax
1454e57a3:     	je	0x1454e5b31 <.text+0x54e4b31>
1454e57a9:     	leaq	0x48(%rax), %rcx
1454e57ad:     	movq	%rcx, 0x158(%rbp)
1454e57b4:     	movq	(%rax), %rdx
1454e57b7:     	cmpq	$-0x1, %rdx
1454e57bb:     	je	0x1454e5b31 <.text+0x54e4b31>
1454e57c1:     	movq	%rcx, 0xd0(%rbp)
1454e57c8:     	movq	%rdx, 0x20(%rbp)
1454e57cc:     	movq	%rdx, -0x30(%rbp)
1454e57d0:     	movups	0x8(%rax), %xmm0
1454e57d4:     	movups	0x18(%rax), %xmm1
1454e57d8:     	movups	0x28(%rax), %xmm2
1454e57dc:     	movups	0x38(%rax), %xmm3
1454e57e0:     	leaq	-0x28(%rbp), %rax
1454e57e4:     	movups	%xmm3, 0x30(%rax)
1454e57e8:     	movups	%xmm2, 0x20(%rax)
1454e57ec:     	movups	%xmm1, 0x10(%rax)
1454e57f0:     	movups	%xmm0, (%rax)
1454e57f3:     	cmpq	$0x0, 0x1c8(%rbp)
1454e57fb:     	je	0x1454e5a40 <.text+0x54e4a40>
1454e5801:     	movq	(%rbp), %r13
1454e5805:     	movq	-0x28(%rbp), %rax
1454e5809:     	movq	%rax, 0x288(%rbp)
1454e5810:     	movq	-0x20(%rbp), %r12
1454e5814:     	movl	0xc(%rbp), %eax
1454e5817:     	movl	%eax, 0x284(%rbp)
1454e581d:     	movq	-0x8(%rbp), %r14
1454e5821:     	movq	-0x10(%rbp), %rax
1454e5825:     	movq	%rax, 0x2a8(%rbp)
1454e582c:     	movq	0x290(%rbp), %rdi
1454e5833:     	jmp	0x1454e5851 <.text+0x54e4851>
1454e5835:     	nopw	%cs:(%rax,%rax)
1454e5840:     	addq	$0x48, %rdi
1454e5844:     	cmpq	0x2b8(%rbp), %rdi
1454e584b:     	je	0x1454e5a40 <.text+0x54e4a40>
1454e5851:     	cmpq	%r13, 0x30(%rdi)
1454e5855:     	jne	0x1454e5840 <.text+0x54e4840>
1454e5857:     	cmpq	%r12, 0x10(%rdi)
1454e585b:     	jne	0x1454e5840 <.text+0x54e4840>
1454e585d:     	movq	0x8(%rdi), %rcx
1454e5861:     	movq	0x288(%rbp), %rdx
1454e5868:     	movq	%r12, %r8
1454e586b:     	callq	0x145756dd7 <.text+0x5755dd7>
1454e5870:     	testl	%eax, %eax
1454e5872:     	jne	0x1454e5840 <.text+0x54e4840>
1454e5874:     	movl	0x284(%rbp), %eax
1454e587a:     	cmpl	%eax, 0x3c(%rdi)
1454e587d:     	jne	0x1454e5840 <.text+0x54e4840>
1454e587f:     	cmpq	%r14, 0x28(%rdi)
1454e5883:     	jne	0x1454e5840 <.text+0x54e4840>
1454e5885:     	testq	%r14, %r14
1454e5888:     	je	0x1454e58d8 <.text+0x54e48d8>
1454e588a:     	movq	0x20(%rdi), %r15
1454e588e:     	movl	$0x10, %ebx
1454e5893:     	movq	%r14, %rsi
1454e5896:     	nopw	%cs:(%rax,%rax)
1454e58a0:     	movq	(%r15,%rbx), %r8
1454e58a4:     	movq	0x2a8(%rbp), %rax
1454e58ab:     	cmpq	(%rax,%rbx), %r8
1454e58af:     	jne	0x1454e5840 <.text+0x54e4840>
1454e58b1:     	movq	0x2a8(%rbp), %rax
1454e58b8:     	movq	-0x8(%rax,%rbx), %rdx
1454e58bd:     	movq	-0x8(%r15,%rbx), %rcx
1454e58c2:     	callq	0x145756dd7 <.text+0x5755dd7>
1454e58c7:     	testl	%eax, %eax
1454e58c9:     	jne	0x1454e5840 <.text+0x54e4840>
1454e58cf:     	addq	$0x18, %rbx
1454e58d3:     	decq	%rsi
1454e58d6:     	jne	0x1454e58a0 <.text+0x54e48a0>
1454e58d8:     	movl	0x38(%rdi), %esi
1454e58db:     	movb	$0x1, 0x2c7(%rbp)
1454e58e2:     	leaq	0x1b0(%rbp), %rcx
1454e58e9:     	movq	%rdi, %rdx
1454e58ec:     	callq	0x14570c440 <.text+0x570b440>
1454e58f1:     	nop
1454e58f2:     	movq	0x2a0(%rbp), %r12
1454e58f9:     	movsd	0x3c(%rdi), %xmm6
1454e58fe:     	movl	0x44(%rdi), %ebx
1454e5901:     	addq	$0x18, %rdi
1454e5905:     	leaq	0x1d0(%rbp), %rcx
1454e590c:     	movq	%rdi, %rdx
1454e590f:     	callq	0x145537ba0 <.text+0x5536ba0>
1454e5914:     	nop
1454e5915:     	movq	%r13, 0x220(%rbp)
1454e591c:     	movl	%esi, 0x228(%rbp)
1454e5922:     	movups	0x1b0(%rbp), %xmm0
1454e5929:     	movaps	%xmm0, 0x1f0(%rbp)
1454e5930:     	movq	0x1c0(%rbp), %rax
1454e5937:     	movq	%rax, 0x200(%rbp)
1454e593e:     	movlps	%xmm6, 0x22c(%rbp)
1454e5945:     	movl	%ebx, 0x234(%rbp)
1454e594b:     	movq	0x1e0(%rbp), %rax
1454e5952:     	leaq	0x208(%rbp), %rcx
1454e5959:     	movq	%rax, 0x10(%rcx)
1454e595d:     	movups	0x1d0(%rbp), %xmm0
1454e5964:     	movups	%xmm0, (%rcx)
1454e5967:     	movq	0x278(%rbp), %rsi
1454e596e:     	cmpq	0x268(%rbp), %rsi
1454e5975:     	jne	0x1454e5984 <.text+0x54e4984>
1454e5977:     	leaq	0x268(%rbp), %rcx
1454e597e:     	callq	0x145757fd0 <.text+0x5756fd0>
1454e5983:     	nop
1454e5984:     	movq	0x270(%rbp), %rax
1454e598b:     	leaq	(%rsi,%rsi,8), %rcx
1454e598f:     	movq	0x230(%rbp), %rdx
1454e5996:     	movq	%rdx, 0x40(%rax,%rcx,8)
1454e599b:     	movaps	0x1f0(%rbp), %xmm0
1454e59a2:     	movaps	0x200(%rbp), %xmm1
1454e59a9:     	movaps	0x210(%rbp), %xmm2
1454e59b0:     	movaps	0x220(%rbp), %xmm3
1454e59b7:     	movups	%xmm3, 0x30(%rax,%rcx,8)
1454e59bc:     	movups	%xmm2, 0x20(%rax,%rcx,8)
1454e59c1:     	movups	%xmm1, 0x10(%rax,%rcx,8)
1454e59c6:     	movups	%xmm0, (%rax,%rcx,8)
1454e59ca:     	incq	%rsi
1454e59cd:     	movq	%rsi, 0x278(%rbp)
1454e59d4:     	movq	0x20(%rbp), %rdx
1454e59d8:     	testq	%rdx, %rdx
1454e59db:     	movq	0x290(%rbp), %r13
1454e59e2:     	je	0x1454e59f6 <.text+0x54e49f6>
1454e59e4:     	movl	$0x1, %r8d
1454e59ea:     	movq	0x288(%rbp), %rcx
1454e59f1:     	callq	0x1400021d0 <.text+0x11d0>
1454e59f6:     	testq	%r14, %r14
1454e59f9:     	je	0x1454e5af8 <.text+0x54e4af8>
1454e59ff:     	movq	0x2a8(%rbp), %rax
1454e5a06:     	leaq	0x8(%rax), %rsi
1454e5a0a:     	jmp	0x1454e5a1d <.text+0x54e4a1d>
1454e5a0c:     	nopl	(%rax)
1454e5a10:     	addq	$0x18, %rsi
1454e5a14:     	decq	%r14
1454e5a17:     	je	0x1454e5af8 <.text+0x54e4af8>
1454e5a1d:     	movq	-0x8(%rsi), %rdx
1454e5a21:     	testq	%rdx, %rdx
1454e5a24:     	je	0x1454e5a10 <.text+0x54e4a10>
1454e5a26:     	movq	(%rsi), %rcx
1454e5a29:     	movl	$0x1, %r8d
1454e5a2f:     	callq	0x1400021d0 <.text+0x11d0>
1454e5a34:     	jmp	0x1454e5a10 <.text+0x54e4a10>
1454e5a36:     	nopw	%cs:(%rax,%rax)
1454e5a40:     	movl	$0x1, %edi
1454e5a45:     	lock
1454e5a46:     	xaddl	%edi, 0x2503a8b(%rip)   # 0x1479e94d8
1454e5a4d:     	addl	$0xdbba0, %edi          # imm = 0xDBBA0
1454e5a53:     	movl	%edi, 0x8(%rbp)
1454e5a56:     	movq	0x2a0(%rbp), %r12
1454e5a5d:     	movq	0x3d0(%r12), %rdx
1454e5a65:     	movb	$0x1, 0x2c7(%rbp)
1454e5a6c:     	leaq	0x1f0(%rbp), %rsi
1454e5a73:     	movq	%rsi, %rcx
1454e5a76:     	movl	%edi, %r8d
1454e5a79:     	callq	0x145496420 <.text+0x5495420>
1454e5a7e:     	nop
1454e5a7f:     	movl	%edi, %edi
1454e5a81:     	movabsq	$0x4000000000000000, %rax # imm = 0x4000000000000000
1454e5a8b:     	orq	%rax, %rdi
1454e5a8e:     	leaq	0xf8(%rbp), %rcx
1454e5a95:     	movq	%rdi, %rdx
1454e5a98:     	movq	%rsi, %r8
1454e5a9b:     	callq	0x1454ff170 <.text+0x54fe170>
1454e5aa0:     	nop
1454e5aa1:     	movb	$0x1, 0x2c7(%rbp)
1454e5aa8:     	movq	%rsi, %rcx
1454e5aab:     	callq	0x1455127d0 <.text+0x55117d0>
1454e5ab0:     	nop
1454e5ab1:     	movl	(%rbp), %eax
1454e5ab4:     	leal	0x1e6(,%rax,2), %edx
1454e5abb:     	movb	$0x1, 0x2c7(%rbp)
1454e5ac2:     	movq	0xd8(%rbp), %rcx
1454e5ac9:     	movq	%rdi, %r8
1454e5acc:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454e5ad1:     	nop
1454e5ad2:     	movq	0x278(%rbp), %rsi
1454e5ad9:     	cmpq	0x268(%rbp), %rsi
1454e5ae0:     	jne	0x1454e5750 <.text+0x54e4750>
1454e5ae6:     	leaq	0x268(%rbp), %rcx
1454e5aed:     	callq	0x145757fd0 <.text+0x5756fd0>
1454e5af2:     	nop
1454e5af3:     	jmp	0x1454e5750 <.text+0x54e4750>
1454e5af8:     	movq	-0x18(%rbp), %rcx
1454e5afc:     	movq	0xd0(%rbp), %rsi
1454e5b03:     	movq	%rsi, %rax
1454e5b06:     	testq	%rcx, %rcx
1454e5b09:     	je	0x1454e579f <.text+0x54e479f>
1454e5b0f:     	shlq	$0x3, %rcx
1454e5b13:     	leaq	(%rcx,%rcx,2), %rdx
1454e5b17:     	movl	$0x8, %r8d
1454e5b1d:     	movq	0x2a8(%rbp), %rcx
1454e5b24:     	callq	0x1400021d0 <.text+0x11d0>
1454e5b29:     	movq	%rsi, %rax
1454e5b2c:     	jmp	0x1454e579f <.text+0x54e479f>
1454e5b31:     	movb	$0x1, 0x2c5(%rbp)
1454e5b38:     	leaq	0x150(%rbp), %rcx
1454e5b3f:     	callq	0x145546bb0 <.text+0x5545bb0>
1454e5b44:     	nop
1454e5b45:     	movq	%r13, 0x1f0(%rbp)
1454e5b4c:     	movq	0x2b8(%rbp), %rax
1454e5b53:     	movq	%rax, 0x1f8(%rbp)
1454e5b5a:     	leaq	0x268(%rbp), %rax
1454e5b61:     	movq	%rax, 0x200(%rbp)
1454e5b68:     	movb	$0x1, 0x2c5(%rbp)
1454e5b6f:     	leaq	0x1d0(%rbp), %rcx
1454e5b76:     	leaq	0x1f0(%rbp), %rdx
1454e5b7d:     	callq	0x145531420 <.text+0x5530420>
1454e5b82:     	nop
1454e5b83:     	movq	%r13, %rsi
1454e5b86:     	jmp	0x1454e5bb5 <.text+0x54e4bb5>
1454e5b88:     	nopl	(%rax,%rax)
1454e5b90:     	leal	0x1e6(,%rdx,2), %edx
1454e5b97:     	movb	$0x1, 0x2c4(%rbp)
1454e5b9e:     	movb	$0x1, 0x2c3(%rbp)
1454e5ba5:     	movq	0xd8(%rbp), %rcx
1454e5bac:     	xorl	%r8d, %r8d
1454e5baf:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454e5bb4:     	nop
1454e5bb5:     	cmpq	0x2b8(%rbp), %rsi
1454e5bbc:     	je	0x1454e5c0c <.text+0x54e4c0c>
1454e5bbe:     	movq	0x270(%rbp), %rax
1454e5bc5:     	movq	0x278(%rbp), %rcx
1454e5bcc:     	shlq	$0x3, %rcx
1454e5bd0:     	leaq	(%rcx,%rcx,8), %rcx
1454e5bd4:     	movq	0x30(%rsi), %rdx
1454e5bd8:     	addq	$0x48, %rsi
1454e5bdc:     	movq	%rcx, %r8
1454e5bdf:     	movq	%rax, %r9
1454e5be2:     	nopw	%cs:(%rax,%rax)
1454e5bf0:     	testq	%r8, %r8
1454e5bf3:     	je	0x1454e5b90 <.text+0x54e4b90>
1454e5bf5:     	addq	$-0x48, %r8
1454e5bf9:     	cmpq	%rdx, 0x30(%r9)
1454e5bfd:     	leaq	0x48(%r9), %r9
1454e5c01:     	jne	0x1454e5bf0 <.text+0x54e4bf0>
1454e5c03:     	cmpq	0x2b8(%rbp), %rsi
1454e5c0a:     	jne	0x1454e5bd4 <.text+0x54e4bd4>
1454e5c0c:     	cmpl	$0x0, 0x110(%rbp)
1454e5c13:     	je	0x1454e5cb4 <.text+0x54e4cb4>
1454e5c19:     	movups	0xf8(%rbp), %xmm0
1454e5c20:     	movups	0x108(%rbp), %xmm1
1454e5c27:     	movaps	%xmm1, 0x200(%rbp)
1454e5c2e:     	movaps	%xmm0, 0x1f0(%rbp)
1454e5c35:     	movb	$0x0, 0x2c4(%rbp)
1454e5c3c:     	movb	$0x1, 0x2c3(%rbp)
1454e5c43:     	leaq	0x150(%rbp), %rcx
1454e5c4a:     	leaq	0x1f0(%rbp), %rdx
1454e5c51:     	callq	0x1454ffad0 <.text+0x54fead0>
1454e5c56:     	nop
1454e5c57:     	movq	0x548(%r12), %rsi
1454e5c5f:     	cmpq	0x538(%r12), %rsi
1454e5c67:     	jne	0x1454e5c77 <.text+0x54e4c77>
1454e5c69:     	leaq	0x538(%r12), %rcx
1454e5c71:     	callq	0x1457580b0 <.text+0x57570b0>
1454e5c76:     	nop
1454e5c77:     	movq	0x540(%r12), %rax
1454e5c7f:     	movq	%rsi, %rcx
1454e5c82:     	shlq	$0x5, %rcx
1454e5c86:     	movups	0x150(%rbp), %xmm0
1454e5c8d:     	movups	0x160(%rbp), %xmm1
1454e5c94:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e5c99:     	movups	%xmm0, (%rax,%rcx)
1454e5c9d:     	incq	%rsi
1454e5ca0:     	movq	%rsi, 0x548(%r12)
1454e5ca8:     	movl	$0x0, 0x284(%rbp)
1454e5cb2:     	jmp	0x1454e5cbc <.text+0x54e4cbc>
1454e5cb4:     	movb	$0x1, %al
1454e5cb6:     	movl	%eax, 0x284(%rbp)
1454e5cbc:     	movq	0x1d0(%rbp), %rax
1454e5cc3:     	movq	%rax, 0x288(%rbp)
1454e5cca:     	movq	0x1d8(%rbp), %rax
1454e5cd1:     	movq	%rax, 0x2a8(%rbp)
1454e5cd8:     	movq	0x1e0(%rbp), %rsi
1454e5cdf:     	testq	%rsi, %rsi
1454e5ce2:     	je	0x1454e5d9d <.text+0x54e4d9d>
1454e5ce8:     	shlq	$0x3, %rsi
1454e5cec:     	leaq	0x538(%r12), %rdi
1454e5cf4:     	xorl	%ebx, %ebx
1454e5cf6:     	jmp	0x1454e5d47 <.text+0x54e4d47>
1454e5cf8:     	nopl	(%rax,%rax)
1454e5d00:     	movq	0x540(%r12), %rax
1454e5d08:     	movq	%r14, %rcx
1454e5d0b:     	shlq	$0x5, %rcx
1454e5d0f:     	movq	$0x20, (%rax,%rcx)
1454e5d17:     	movq	0x2b8(%rbp), %rdx
1454e5d1e:     	movq	%rdx, 0x8(%rax,%rcx)
1454e5d23:     	movq	$0x8, 0x10(%rax,%rcx)
1454e5d2c:     	movw	$0xaa, 0x18(%rax,%rcx)
1454e5d33:     	incq	%r14
1454e5d36:     	movq	%r14, 0x548(%r12)
1454e5d3e:     	addq	$0x8, %rbx
1454e5d42:     	cmpq	%rbx, %rsi
1454e5d45:     	je	0x1454e5d9d <.text+0x54e4d9d>
1454e5d47:     	movq	0x2a8(%rbp), %rax
1454e5d4e:     	movq	(%rax,%rbx), %r14
1454e5d52:     	callq	0x140002200 <.text+0x1200>
1454e5d57:     	movl	$0x20, %ecx
1454e5d5c:     	movl	$0x1, %edx
1454e5d61:     	callq	0x1400021c0 <.text+0x11c0>
1454e5d66:     	testq	%rax, %rax
1454e5d69:     	je	0x1454e6148 <.text+0x54e5148>
1454e5d6f:     	movq	%rax, 0x2b8(%rbp)
1454e5d76:     	movq	%r14, (%rax)
1454e5d79:     	movq	0x548(%r12), %r14
1454e5d81:     	cmpq	0x538(%r12), %r14
1454e5d89:     	jne	0x1454e5d00 <.text+0x54e4d00>
1454e5d8f:     	movq	%rdi, %rcx
1454e5d92:     	callq	0x1457580b0 <.text+0x57570b0>
1454e5d97:     	nop
1454e5d98:     	jmp	0x1454e5d00 <.text+0x54e4d00>
1454e5d9d:     	movq	0x288(%rbp), %rdx
1454e5da4:     	testq	%rdx, %rdx
1454e5da7:     	je	0x1454e5dbf <.text+0x54e4dbf>
1454e5da9:     	shlq	$0x3, %rdx
1454e5dad:     	movl	$0x8, %r8d
1454e5db3:     	movq	0x2a8(%rbp), %rcx
1454e5dba:     	callq	0x1400021d0 <.text+0x11d0>
1454e5dbf:     	movq	0x278(%rbp), %rax
1454e5dc6:     	movq	%rax, 0x200(%rbp)
1454e5dcd:     	movups	0x268(%rbp), %xmm0
1454e5dd4:     	movaps	%xmm0, 0x1f0(%rbp)
1454e5ddb:     	movq	0x2d0(%r12), %rsi
1454e5de3:     	testq	%rsi, %rsi
1454e5de6:     	je	0x1454e5eaf <.text+0x54e4eaf>
1454e5dec:     	movq	0x2c8(%r12), %rbx
1454e5df4:     	xorl	%r14d, %r14d
1454e5df7:     	jmp	0x1454e5e13 <.text+0x54e4e13>
1454e5df9:     	nopl	(%rax)
1454e5e00:     	incq	%r14
1454e5e03:     	cmpq	%rsi, %r14
1454e5e06:     	movq	0x290(%rbp), %r13
1454e5e0d:     	je	0x1454e5eaf <.text+0x54e4eaf>
1454e5e13:     	leaq	(%r14,%r14,8), %rax
1454e5e17:     	leaq	(%rbx,%rax,8), %r15
1454e5e1b:     	movq	(%rbx,%rax,8), %rdx
1454e5e1f:     	testq	%rdx, %rdx
1454e5e22:     	je	0x1454e5e33 <.text+0x54e4e33>
1454e5e24:     	movq	0x8(%r15), %rcx
1454e5e28:     	movl	$0x1, %r8d
1454e5e2e:     	callq	0x1400021d0 <.text+0x11d0>
1454e5e33:     	movq	0x20(%r15), %rdi
1454e5e37:     	movq	0x28(%r15), %r12
1454e5e3b:     	testq	%r12, %r12
1454e5e3e:     	je	0x1454e5e80 <.text+0x54e4e80>
1454e5e40:     	leaq	0x8(%rdi), %r13
1454e5e44:     	jmp	0x1454e5e59 <.text+0x54e4e59>
1454e5e46:     	nopw	%cs:(%rax,%rax)
1454e5e50:     	addq	$0x18, %r13
1454e5e54:     	decq	%r12
1454e5e57:     	je	0x1454e5e80 <.text+0x54e4e80>
1454e5e59:     	movq	-0x8(%r13), %rdx
1454e5e5d:     	testq	%rdx, %rdx
1454e5e60:     	je	0x1454e5e50 <.text+0x54e4e50>
1454e5e62:     	movq	(%r13), %rcx
1454e5e66:     	movl	$0x1, %r8d
1454e5e6c:     	callq	0x1400021d0 <.text+0x11d0>
1454e5e71:     	jmp	0x1454e5e50 <.text+0x54e4e50>
1454e5e73:     	nopw	%cs:(%rax,%rax)
1454e5e80:     	movq	0x18(%r15), %rax
1454e5e84:     	testq	%rax, %rax
1454e5e87:     	movq	0x2a0(%rbp), %r12
1454e5e8e:     	je	0x1454e5e00 <.text+0x54e4e00>
1454e5e94:     	shlq	$0x3, %rax
1454e5e98:     	leaq	(%rax,%rax,2), %rdx
1454e5e9c:     	movl	$0x8, %r8d
1454e5ea2:     	movq	%rdi, %rcx
1454e5ea5:     	callq	0x1400021d0 <.text+0x11d0>
1454e5eaa:     	jmp	0x1454e5e00 <.text+0x54e4e00>
1454e5eaf:     	movq	0x28(%rbp), %rsi
1454e5eb3:     	movq	(%rsi), %rax
1454e5eb6:     	testq	%rax, %rax
1454e5eb9:     	je	0x1454e5ed6 <.text+0x54e4ed6>
1454e5ebb:     	movq	0x2c8(%r12), %rcx
1454e5ec3:     	shlq	$0x3, %rax
1454e5ec7:     	leaq	(%rax,%rax,8), %rdx
1454e5ecb:     	movl	$0x8, %r8d
1454e5ed1:     	callq	0x1400021d0 <.text+0x11d0>
1454e5ed6:     	movq	0x200(%rbp), %rax
1454e5edd:     	movq	%rax, 0x10(%rsi)
1454e5ee1:     	movaps	0x1f0(%rbp), %xmm0
1454e5ee8:     	movups	%xmm0, (%rsi)
1454e5eeb:     	cmpb	$0x0, 0x284(%rbp)
1454e5ef2:     	je	0x1454e5f12 <.text+0x54e4f12>
1454e5ef4:     	movq	0xf8(%rbp), %rdx
1454e5efb:     	testq	%rdx, %rdx
1454e5efe:     	je	0x1454e5f12 <.text+0x54e4f12>
1454e5f00:     	movq	0x100(%rbp), %rcx
1454e5f07:     	movl	$0x1, %r8d
1454e5f0d:     	callq	0x1400021d0 <.text+0x11d0>
1454e5f12:     	cmpq	$0x0, 0x1c8(%rbp)
1454e5f1a:     	je	0x1454e5fd8 <.text+0x54e4fd8>
1454e5f20:     	xorl	%esi, %esi
1454e5f22:     	jmp	0x1454e5f40 <.text+0x54e4f40>
1454e5f24:     	nopw	%cs:(%rax,%rax)
1454e5f30:     	incq	%rsi
1454e5f33:     	cmpq	0x1c8(%rbp), %rsi
1454e5f3a:     	je	0x1454e5fd8 <.text+0x54e4fd8>
1454e5f40:     	leaq	(%rsi,%rsi,8), %rax
1454e5f44:     	leaq	(,%rax,8), %rbx
1454e5f4c:     	addq	%r13, %rbx
1454e5f4f:     	movq	(%r13,%rax,8), %rdx
1454e5f54:     	testq	%rdx, %rdx
1454e5f57:     	je	0x1454e5f68 <.text+0x54e4f68>
1454e5f59:     	movq	0x8(%rbx), %rcx
1454e5f5d:     	movl	$0x1, %r8d
1454e5f63:     	callq	0x1400021d0 <.text+0x11d0>
1454e5f68:     	movq	0x20(%rbx), %rdi
1454e5f6c:     	movq	0x28(%rbx), %r14
1454e5f70:     	testq	%r14, %r14
1454e5f73:     	je	0x1454e5fb0 <.text+0x54e4fb0>
1454e5f75:     	leaq	0x8(%rdi), %r15
1454e5f79:     	jmp	0x1454e5f89 <.text+0x54e4f89>
1454e5f7b:     	nopl	(%rax,%rax)
1454e5f80:     	addq	$0x18, %r15
1454e5f84:     	decq	%r14
1454e5f87:     	je	0x1454e5fb0 <.text+0x54e4fb0>
1454e5f89:     	movq	-0x8(%r15), %rdx
1454e5f8d:     	testq	%rdx, %rdx
1454e5f90:     	je	0x1454e5f80 <.text+0x54e4f80>
1454e5f92:     	movq	(%r15), %rcx
1454e5f95:     	movl	$0x1, %r8d
1454e5f9b:     	callq	0x1400021d0 <.text+0x11d0>
1454e5fa0:     	jmp	0x1454e5f80 <.text+0x54e4f80>
1454e5fa2:     	nopw	%cs:(%rax,%rax)
1454e5fb0:     	movq	0x18(%rbx), %rax
1454e5fb4:     	testq	%rax, %rax
1454e5fb7:     	je	0x1454e5f30 <.text+0x54e4f30>
1454e5fbd:     	shlq	$0x3, %rax
1454e5fc1:     	leaq	(%rax,%rax,2), %rdx
1454e5fc5:     	movl	$0x8, %r8d
1454e5fcb:     	movq	%rdi, %rcx
1454e5fce:     	callq	0x1400021d0 <.text+0x11d0>
1454e5fd3:     	jmp	0x1454e5f30 <.text+0x54e4f30>
1454e5fd8:     	movq	0xe0(%rbp), %rax
1454e5fdf:     	testq	%rax, %rax
1454e5fe2:     	je	0x1454e5ffb <.text+0x54e4ffb>
1454e5fe4:     	shlq	$0x3, %rax
1454e5fe8:     	leaq	(%rax,%rax,8), %rdx
1454e5fec:     	movl	$0x8, %r8d
1454e5ff2:     	movq	%r13, %rcx
1454e5ff5:     	callq	0x1400021d0 <.text+0x11d0>
1454e5ffa:     	nop
1454e5ffb:     	movq	%r12, %rcx
1454e5ffe:     	callq	0x1454950d0 <.text+0x54940d0>
1454e6003:     	nop
1454e6004:     	movq	%r12, %rcx
1454e6007:     	movzbl	0x29f(%rbp), %edx
1454e600e:     	callq	0x1454dbbc0 <.text+0x54dabc0>
1454e6013:     	nop
1454e6014:     	movq	0x30(%rbp), %rdx
1454e6018:     	testq	%rdx, %rdx
1454e601b:     	je	0x1454e602c <.text+0x54e502c>
1454e601d:     	movq	0x38(%rbp), %rcx
1454e6021:     	movl	$0x1, %r8d
1454e6027:     	callq	0x1400021d0 <.text+0x11d0>
1454e602c:     	movq	0x48(%rbp), %rdx
1454e6030:     	testq	%rdx, %rdx
1454e6033:     	je	0x1454e6044 <.text+0x54e5044>
1454e6035:     	movq	0x50(%rbp), %rcx
1454e6039:     	movl	$0x1, %r8d
1454e603f:     	callq	0x1400021d0 <.text+0x11d0>
1454e6044:     	movq	0x60(%rbp), %rdx
1454e6048:     	testq	%rdx, %rdx
1454e604b:     	je	0x1454e605c <.text+0x54e505c>
1454e604d:     	movq	0x68(%rbp), %rcx
1454e6051:     	movl	$0x1, %r8d
1454e6057:     	callq	0x1400021d0 <.text+0x11d0>
1454e605c:     	movq	0x78(%rbp), %rdx
1454e6060:     	testq	%rdx, %rdx
1454e6063:     	je	0x1454e6077 <.text+0x54e5077>
1454e6065:     	movq	0x80(%rbp), %rcx
1454e606c:     	movl	$0x1, %r8d
1454e6072:     	callq	0x1400021d0 <.text+0x11d0>
1454e6077:     	movq	0x98(%rbp), %rsi
1454e607e:     	movq	0xa0(%rbp), %rdi
1454e6085:     	testq	%rdi, %rdi
1454e6088:     	je	0x1454e60b2 <.text+0x54e50b2>
1454e608a:     	leaq	0x8(%rsi), %rbx
1454e608e:     	jmp	0x1454e6099 <.text+0x54e5099>
1454e6090:     	addq	$0x18, %rbx
1454e6094:     	decq	%rdi
1454e6097:     	je	0x1454e60b2 <.text+0x54e50b2>
1454e6099:     	movq	-0x8(%rbx), %rdx
1454e609d:     	testq	%rdx, %rdx
1454e60a0:     	je	0x1454e6090 <.text+0x54e5090>
1454e60a2:     	movq	(%rbx), %rcx
1454e60a5:     	movl	$0x1, %r8d
1454e60ab:     	callq	0x1400021d0 <.text+0x11d0>
1454e60b0:     	jmp	0x1454e6090 <.text+0x54e5090>
1454e60b2:     	movq	0x90(%rbp), %rax
1454e60b9:     	testq	%rax, %rax
1454e60bc:     	je	0x1454e60d4 <.text+0x54e50d4>
1454e60be:     	shlq	$0x3, %rax
1454e60c2:     	leaq	(%rax,%rax,2), %rdx
1454e60c6:     	movl	$0x8, %r8d
1454e60cc:     	movq	%rsi, %rcx
1454e60cf:     	callq	0x1400021d0 <.text+0x11d0>
1454e60d4:     	movaps	0x2d0(%rbp), %xmm6
1454e60db:     	movaps	0x2e0(%rbp), %xmm7
1454e60e2:     	movaps	0x2f0(%rbp), %xmm8
1454e60ea:     	movaps	0x300(%rbp), %xmm9
1454e60f2:     	movaps	0x310(%rbp), %xmm10
1454e60fa:     	addq	$0x3a8, %rsp            # imm = 0x3A8
1454e6101:     	popq	%rbx
1454e6102:     	popq	%rdi
1454e6103:     	popq	%rsi
1454e6104:     	popq	%r12
1454e6106:     	popq	%r13
1454e6108:     	popq	%r14
1454e610a:     	popq	%r15
1454e610c:     	popq	%rbp
1454e610d:     	retq
1454e610e:     	incl	0x370(%r12)
1454e6116:     	movb	$0x1, 0x2b6(%rbp)
1454e611d:     	movq	%r12, %rcx
1454e6120:     	callq	0x1454b7b80 <.text+0x54b6b80>
1454e6125:     	nop
1454e6126:     	movq	0x2b8(%rbp), %rcx
1454e612d:     	callq	0x140272770 <.text+0x271770>
1454e6132:     	jmp	0x1454e4dbd <.text+0x54e3dbd>
1454e6137:     	movl	$0x8, %ecx
1454e613c:     	movl	$0x70, %edx
1454e6141:     	callq	0x1458e7201 <.text+0x58e6201>
1454e6146:     	ud2
1454e6148:     	movl	$0x1, %ecx
1454e614d:     	movl	$0x20, %edx
1454e6152:     	callq	0x1458e721b <.text+0x58e621b>
1454e6157:     	nop
1454e6158:     	jmp	0x1454e619c <.text+0x54e519c>
1454e615a:     	movq	%rbx, 0x1f0(%rbp)
1454e6161:     	leaq	-0x54e40a8(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454e6168:     	movq	%rax, 0x1f8(%rbp)
1454e616f:     	leaq	0x1232b02(%rip), %rcx   # 0x146718c78
1454e6176:     	leaq	0x1232b0b(%rip), %r8    # 0x146718c88
1454e617d:     	leaq	0x1f0(%rbp), %rdx
1454e6184:     	callq	0x1458e7790 <.text+0x58e6790>
1454e6189:     	nop
1454e618a:     	jmp	0x1454e619c <.text+0x54e519c>
1454e618c:     	movl	$0x1, %ecx
1454e6191:     	movl	$0x20, %edx
1454e6196:     	callq	0x1458e721b <.text+0x58e621b>
1454e619b:     	nop
1454e619c:     	ud2

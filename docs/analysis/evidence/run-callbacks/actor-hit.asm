
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d4ff0:     	pushq	%rbp
1454d4ff1:     	pushq	%r15
1454d4ff3:     	pushq	%r14
1454d4ff5:     	pushq	%r13
1454d4ff7:     	pushq	%r12
1454d4ff9:     	pushq	%rsi
1454d4ffa:     	pushq	%rdi
1454d4ffb:     	pushq	%rbx
1454d4ffc:     	subq	$0x2a8, %rsp            # imm = 0x2A8
1454d5003:     	leaq	0x80(%rsp), %rbp
1454d500b:     	movaps	%xmm15, 0x210(%rbp)
1454d5013:     	movaps	%xmm14, 0x200(%rbp)
1454d501b:     	movaps	%xmm13, 0x1f0(%rbp)
1454d5023:     	movaps	%xmm12, 0x1e0(%rbp)
1454d502b:     	movaps	%xmm11, 0x1d0(%rbp)
1454d5033:     	movaps	%xmm10, 0x1c0(%rbp)
1454d503b:     	movaps	%xmm9, 0x1b0(%rbp)
1454d5043:     	movaps	%xmm8, 0x1a0(%rbp)
1454d504b:     	movaps	%xmm7, 0x190(%rbp)
1454d5052:     	movaps	%xmm6, 0x180(%rbp)
1454d5059:     	movq	$-0x2, 0x178(%rbp)
1454d5064:     	cmpb	$0x1, 0x9b9(%rcx)
1454d506b:     	jne	0x1454d835e <.text+0x54d735e>
1454d5071:     	movl	%r9d, %ebx
1454d5074:     	movaps	%xmm2, %xmm6
1454d5077:     	movq	%rdx, %rdi
1454d507a:     	movq	%rcx, %rsi
1454d507d:     	movzbl	0x2a0(%rbp), %r12d
1454d5085:     	movss	0x934(%rcx), %xmm0
1454d508d:     	movq	0x4e0(%rcx), %r14
1454d5094:     	movq	0x4e8(%rcx), %rcx
1454d509b:     	imulq	$0x160, %rcx, %rax      # imm = 0x160
1454d50a2:     	xorl	%edx, %edx
1454d50a4:     	movss	0x4323e3(%rip), %xmm8   # 0x145907490
1454d50ad:     	movq	%r14, %r8
1454d50b0:     	cmpq	%rdx, %rax
1454d50b3:     	je	0x1454d54d8 <.text+0x54d44d8>
1454d50b9:     	addq	$0x160, %rdx            # imm = 0x160
1454d50c0:     	cmpq	%rdi, 0x88(%r8)
1454d50c7:     	leaq	0x160(%r8), %r8
1454d50ce:     	jne	0x1454d50b0 <.text+0x54d40b0>
1454d50d0:     	movss	-0x1c(%r14,%rdx), %xmm1
1454d50d7:     	ucomiss	%xmm0, %xmm1
1454d50da:     	ja	0x1454d50f7 <.text+0x54d40f7>
1454d50dc:     	movss	-0xc4(%r14,%rdx), %xmm1
1454d50e6:     	ucomiss	%xmm0, %xmm1
1454d50e9:     	ja	0x1454d50f7 <.text+0x54d40f7>
1454d50eb:     	movss	-0x10(%r14,%rdx), %xmm1
1454d50f2:     	ucomiss	%xmm0, %xmm1
1454d50f5:     	jbe	0x1454d511e <.text+0x54d411e>
1454d50f7:     	movq	0x6e8(%rsi), %r10
1454d50fe:     	testq	%r10, %r10
1454d5101:     	je	0x1454d511e <.text+0x54d411e>
1454d5103:     	movq	0x6e0(%rsi), %r8
1454d510a:     	cmpq	$0x1, %r10
1454d510e:     	jne	0x1454d513b <.text+0x54d413b>
1454d5110:     	movss	0x43e233(%rip), %xmm8   # 0x14591334c
1454d5119:     	xorl	%r9d, %r9d
1454d511c:     	jmp	0x1454d518e <.text+0x54d418e>
1454d511e:     	movss	0x432369(%rip), %xmm8   # 0x145907490
1454d5127:     	cmpq	$-0x1, -0x148(%r14,%rdx)
1454d5130:     	jne	0x1454d51b8 <.text+0x54d41b8>
1454d5136:     	jmp	0x1454d51b0 <.text+0x54d41b0>
1454d513b:     	movq	%r10, %r11
1454d513e:     	andq	$-0x2, %r11
1454d5142:     	movss	0x43e201(%rip), %xmm8   # 0x14591334c
1454d514b:     	xorl	%r9d, %r9d
1454d514e:     	jmp	0x1454d5159 <.text+0x54d4159>
1454d5150:     	addq	$0x2, %r9
1454d5154:     	cmpq	%r9, %r11
1454d5157:     	je	0x1454d5188 <.text+0x54d4188>
1454d5159:     	cmpb	$0x12, (%r8,%r9,8)
1454d515e:     	je	0x1454d5170 <.text+0x54d4170>
1454d5160:     	cmpb	$0x12, 0x8(%r8,%r9,8)
1454d5166:     	jne	0x1454d5150 <.text+0x54d4150>
1454d5168:     	jmp	0x1454d517f <.text+0x54d417f>
1454d516a:     	nopw	(%rax,%rax)
1454d5170:     	addss	0x4(%r8,%r9,8), %xmm8
1454d5177:     	cmpb	$0x12, 0x8(%r8,%r9,8)
1454d517d:     	jne	0x1454d5150 <.text+0x54d4150>
1454d517f:     	addss	0xc(%r8,%r9,8), %xmm8
1454d5186:     	jmp	0x1454d5150 <.text+0x54d4150>
1454d5188:     	testb	$0x1, %r10b
1454d518c:     	je	0x1454d519c <.text+0x54d419c>
1454d518e:     	cmpb	$0x12, (%r8,%r9,8)
1454d5193:     	jne	0x1454d519c <.text+0x54d419c>
1454d5195:     	addss	0x4(%r8,%r9,8), %xmm8
1454d519c:     	addss	0x4322eb(%rip), %xmm8   # 0x145907490
1454d51a5:     	cmpq	$-0x1, -0x148(%r14,%rdx)
1454d51ae:     	jne	0x1454d51b8 <.text+0x54d41b8>
1454d51b0:     	cmpb	$0x1, -0x8(%r14,%rdx)
1454d51b6:     	jne	0x1454d51e1 <.text+0x54d41e1>
1454d51b8:     	movq	0x6e8(%rsi), %r10
1454d51bf:     	testq	%r10, %r10
1454d51c2:     	je	0x1454d522d <.text+0x54d422d>
1454d51c4:     	movq	0x6e0(%rsi), %r8
1454d51cb:     	cmpq	$0x1, %r10
1454d51cf:     	jne	0x1454d5237 <.text+0x54d4237>
1454d51d1:     	movss	0x43e173(%rip), %xmm1   # 0x14591334c
1454d51d9:     	xorl	%r9d, %r9d
1454d51dc:     	jmp	0x1454d528e <.text+0x54d428e>
1454d51e1:     	movss	-0x6c(%r14,%rdx), %xmm1
1454d51e8:     	mulss	0x4406e0(%rip), %xmm1   # 0x1459158d0
1454d51f0:     	ucomiss	-0x70(%r14,%rdx), %xmm1
1454d51f6:     	jbe	0x1454d52bc <.text+0x54d42bc>
1454d51fc:     	movq	0x6e8(%rsi), %r10
1454d5203:     	testq	%r10, %r10
1454d5206:     	je	0x1454d5379 <.text+0x54d4379>
1454d520c:     	movq	0x6e0(%rsi), %r8
1454d5213:     	cmpq	$0x1, %r10
1454d5217:     	jne	0x1454d5383 <.text+0x54d4383>
1454d521d:     	movss	0x43e127(%rip), %xmm1   # 0x14591334c
1454d5225:     	xorl	%r9d, %r9d
1454d5228:     	jmp	0x1454d53de <.text+0x54d43de>
1454d522d:     	movss	0x43e117(%rip), %xmm1   # 0x14591334c
1454d5235:     	jmp	0x1454d529c <.text+0x54d429c>
1454d5237:     	movq	%r10, %r11
1454d523a:     	andq	$-0x2, %r11
1454d523e:     	movss	0x43e106(%rip), %xmm1   # 0x14591334c
1454d5246:     	xorl	%r9d, %r9d
1454d5249:     	jmp	0x1454d5259 <.text+0x54d4259>
1454d524b:     	nopl	(%rax,%rax)
1454d5250:     	addq	$0x2, %r9
1454d5254:     	cmpq	%r9, %r11
1454d5257:     	je	0x1454d5288 <.text+0x54d4288>
1454d5259:     	cmpb	$0x13, (%r8,%r9,8)
1454d525e:     	je	0x1454d5270 <.text+0x54d4270>
1454d5260:     	cmpb	$0x13, 0x8(%r8,%r9,8)
1454d5266:     	jne	0x1454d5250 <.text+0x54d4250>
1454d5268:     	jmp	0x1454d527f <.text+0x54d427f>
1454d526a:     	nopw	(%rax,%rax)
1454d5270:     	addss	0x4(%r8,%r9,8), %xmm1
1454d5277:     	cmpb	$0x13, 0x8(%r8,%r9,8)
1454d527d:     	jne	0x1454d5250 <.text+0x54d4250>
1454d527f:     	addss	0xc(%r8,%r9,8), %xmm1
1454d5286:     	jmp	0x1454d5250 <.text+0x54d4250>
1454d5288:     	testb	$0x1, %r10b
1454d528c:     	je	0x1454d529c <.text+0x54d429c>
1454d528e:     	cmpb	$0x13, (%r8,%r9,8)
1454d5293:     	jne	0x1454d529c <.text+0x54d429c>
1454d5295:     	addss	0x4(%r8,%r9,8), %xmm1
1454d529c:     	addss	%xmm1, %xmm8
1454d52a1:     	movss	-0x6c(%r14,%rdx), %xmm1
1454d52a8:     	mulss	0x440620(%rip), %xmm1   # 0x1459158d0
1454d52b0:     	ucomiss	-0x70(%r14,%rdx), %xmm1
1454d52b6:     	ja	0x1454d51fc <.text+0x54d41fc>
1454d52bc:     	cmpq	$0x0, -0x150(%r14,%rdx)
1454d52c5:     	je	0x1454d5400 <.text+0x54d4400>
1454d52cb:     	movq	0x6e8(%rsi), %r10
1454d52d2:     	testq	%r10, %r10
1454d52d5:     	je	0x1454d52f1 <.text+0x54d42f1>
1454d52d7:     	movq	0x6e0(%rsi), %r8
1454d52de:     	cmpq	$0x1, %r10
1454d52e2:     	jne	0x1454d52fb <.text+0x54d42fb>
1454d52e4:     	movss	0x43e060(%rip), %xmm1   # 0x14591334c
1454d52ec:     	xorl	%r9d, %r9d
1454d52ef:     	jmp	0x1454d534e <.text+0x54d434e>
1454d52f1:     	movss	0x43e053(%rip), %xmm1   # 0x14591334c
1454d52f9:     	jmp	0x1454d535c <.text+0x54d435c>
1454d52fb:     	movq	%r10, %r11
1454d52fe:     	andq	$-0x2, %r11
1454d5302:     	movss	0x43e042(%rip), %xmm1   # 0x14591334c
1454d530a:     	xorl	%r9d, %r9d
1454d530d:     	jmp	0x1454d5319 <.text+0x54d4319>
1454d530f:     	nop
1454d5310:     	addq	$0x2, %r9
1454d5314:     	cmpq	%r9, %r11
1454d5317:     	je	0x1454d5348 <.text+0x54d4348>
1454d5319:     	cmpb	$0x15, (%r8,%r9,8)
1454d531e:     	je	0x1454d5330 <.text+0x54d4330>
1454d5320:     	cmpb	$0x15, 0x8(%r8,%r9,8)
1454d5326:     	jne	0x1454d5310 <.text+0x54d4310>
1454d5328:     	jmp	0x1454d533f <.text+0x54d433f>
1454d532a:     	nopw	(%rax,%rax)
1454d5330:     	addss	0x4(%r8,%r9,8), %xmm1
1454d5337:     	cmpb	$0x15, 0x8(%r8,%r9,8)
1454d533d:     	jne	0x1454d5310 <.text+0x54d4310>
1454d533f:     	addss	0xc(%r8,%r9,8), %xmm1
1454d5346:     	jmp	0x1454d5310 <.text+0x54d4310>
1454d5348:     	testb	$0x1, %r10b
1454d534c:     	je	0x1454d535c <.text+0x54d435c>
1454d534e:     	cmpb	$0x15, (%r8,%r9,8)
1454d5353:     	jne	0x1454d535c <.text+0x54d435c>
1454d5355:     	addss	0x4(%r8,%r9,8), %xmm1
1454d535c:     	addss	%xmm1, %xmm8
1454d5361:     	movss	-0xb4(%r14,%rdx), %xmm1
1454d536b:     	ucomiss	%xmm0, %xmm1
1454d536e:     	ja	0x1454d540f <.text+0x54d440f>
1454d5374:     	jmp	0x1454d5419 <.text+0x54d4419>
1454d5379:     	movss	0x43dfcb(%rip), %xmm1   # 0x14591334c
1454d5381:     	jmp	0x1454d53ec <.text+0x54d43ec>
1454d5383:     	movq	%r10, %r11
1454d5386:     	andq	$-0x2, %r11
1454d538a:     	movss	0x43dfba(%rip), %xmm1   # 0x14591334c
1454d5392:     	xorl	%r9d, %r9d
1454d5395:     	jmp	0x1454d53a9 <.text+0x54d43a9>
1454d5397:     	nopw	(%rax,%rax)
1454d53a0:     	addq	$0x2, %r9
1454d53a4:     	cmpq	%r9, %r11
1454d53a7:     	je	0x1454d53d8 <.text+0x54d43d8>
1454d53a9:     	cmpb	$0x14, (%r8,%r9,8)
1454d53ae:     	je	0x1454d53c0 <.text+0x54d43c0>
1454d53b0:     	cmpb	$0x14, 0x8(%r8,%r9,8)
1454d53b6:     	jne	0x1454d53a0 <.text+0x54d43a0>
1454d53b8:     	jmp	0x1454d53cf <.text+0x54d43cf>
1454d53ba:     	nopw	(%rax,%rax)
1454d53c0:     	addss	0x4(%r8,%r9,8), %xmm1
1454d53c7:     	cmpb	$0x14, 0x8(%r8,%r9,8)
1454d53cd:     	jne	0x1454d53a0 <.text+0x54d43a0>
1454d53cf:     	addss	0xc(%r8,%r9,8), %xmm1
1454d53d6:     	jmp	0x1454d53a0 <.text+0x54d43a0>
1454d53d8:     	testb	$0x1, %r10b
1454d53dc:     	je	0x1454d53ec <.text+0x54d43ec>
1454d53de:     	cmpb	$0x14, (%r8,%r9,8)
1454d53e3:     	jne	0x1454d53ec <.text+0x54d43ec>
1454d53e5:     	addss	0x4(%r8,%r9,8), %xmm1
1454d53ec:     	addss	%xmm1, %xmm8
1454d53f1:     	cmpq	$0x0, -0x150(%r14,%rdx)
1454d53fa:     	jne	0x1454d52cb <.text+0x54d42cb>
1454d5400:     	movss	-0xb4(%r14,%rdx), %xmm1
1454d540a:     	ucomiss	%xmm0, %xmm1
1454d540d:     	jbe	0x1454d5419 <.text+0x54d4419>
1454d540f:     	addss	-0xb8(%r14,%rdx), %xmm8
1454d5419:     	movss	0x41c(%rsi), %xmm0
1454d5421:     	xorps	%xmm1, %xmm1
1454d5424:     	ucomiss	%xmm1, %xmm0
1454d5427:     	jbe	0x1454d54d1 <.text+0x54d44d1>
1454d542d:     	movq	0x6e8(%rsi), %r10
1454d5434:     	testq	%r10, %r10
1454d5437:     	je	0x1454d5453 <.text+0x54d4453>
1454d5439:     	movq	0x6e0(%rsi), %r8
1454d5440:     	cmpq	$0x1, %r10
1454d5444:     	jne	0x1454d545d <.text+0x54d445d>
1454d5446:     	movss	0x43defe(%rip), %xmm0   # 0x14591334c
1454d544e:     	xorl	%r9d, %r9d
1454d5451:     	jmp	0x1454d54be <.text+0x54d44be>
1454d5453:     	movss	0x43def1(%rip), %xmm0   # 0x14591334c
1454d545b:     	jmp	0x1454d54cc <.text+0x54d44cc>
1454d545d:     	movq	%r10, %r11
1454d5460:     	andq	$-0x2, %r11
1454d5464:     	movss	0x43dee0(%rip), %xmm0   # 0x14591334c
1454d546c:     	xorl	%r9d, %r9d
1454d546f:     	jmp	0x1454d5489 <.text+0x54d4489>
1454d5471:     	nopw	%cs:(%rax,%rax)
1454d5480:     	addq	$0x2, %r9
1454d5484:     	cmpq	%r9, %r11
1454d5487:     	je	0x1454d54b8 <.text+0x54d44b8>
1454d5489:     	cmpb	$0x1c, (%r8,%r9,8)
1454d548e:     	je	0x1454d54a0 <.text+0x54d44a0>
1454d5490:     	cmpb	$0x1c, 0x8(%r8,%r9,8)
1454d5496:     	jne	0x1454d5480 <.text+0x54d4480>
1454d5498:     	jmp	0x1454d54af <.text+0x54d44af>
1454d549a:     	nopw	(%rax,%rax)
1454d54a0:     	addss	0x4(%r8,%r9,8), %xmm0
1454d54a7:     	cmpb	$0x1c, 0x8(%r8,%r9,8)
1454d54ad:     	jne	0x1454d5480 <.text+0x54d4480>
1454d54af:     	addss	0xc(%r8,%r9,8), %xmm0
1454d54b6:     	jmp	0x1454d5480 <.text+0x54d4480>
1454d54b8:     	testb	$0x1, %r10b
1454d54bc:     	je	0x1454d54cc <.text+0x54d44cc>
1454d54be:     	cmpb	$0x1c, (%r8,%r9,8)
1454d54c3:     	jne	0x1454d54cc <.text+0x54d44cc>
1454d54c5:     	addss	0x4(%r8,%r9,8), %xmm0
1454d54cc:     	addss	%xmm0, %xmm8
1454d54d1:     	addss	-0x24(%r14,%rdx), %xmm8
1454d54d8:     	testq	%rcx, %rcx
1454d54db:     	je	0x1454d835e <.text+0x54d735e>
1454d54e1:     	xorl	%r15d, %r15d
1454d54e4:     	jmp	0x1454d5500 <.text+0x54d4500>
1454d54e6:     	nopw	%cs:(%rax,%rax)
1454d54f0:     	addq	$0x160, %r15            # imm = 0x160
1454d54f7:     	cmpq	%r15, %rax
1454d54fa:     	je	0x1454d835e <.text+0x54d735e>
1454d5500:     	cmpq	%rdi, 0x88(%r14,%r15)
1454d5508:     	jne	0x1454d54f0 <.text+0x54d44f0>
1454d550a:     	cmpl	$0x1, 0x68(%r14,%r15)
1454d5510:     	je	0x1454d54f0 <.text+0x54d44f0>
1454d5512:     	mulss	%xmm6, %xmm8
1454d5517:     	maxss	0x431f70(%rip), %xmm8   # 0x145907490
1454d5520:     	movss	0xf0(%r14,%r15), %xmm3
1454d552a:     	movss	0x128(%r14,%r15), %xmm2
1454d5534:     	xorps	%xmm1, %xmm1
1454d5537:     	movaps	%xmm3, %xmm0
1454d553a:     	maxss	%xmm1, %xmm0
1454d553e:     	subss	%xmm8, %xmm3
1454d5543:     	movss	%xmm3, 0xf0(%r14,%r15)
1454d554d:     	ucomiss	%xmm2, %xmm1
1454d5550:     	jae	0x1454d55c1 <.text+0x54d45c1>
1454d5552:     	movss	0x934(%rsi), %xmm3
1454d555a:     	subss	0x124(%r14,%r15), %xmm3
1454d5564:     	divss	%xmm2, %xmm3
1454d5568:     	maxss	%xmm3, %xmm1
1454d556c:     	movss	0x431f1c(%rip), %xmm2   # 0x145907490
1454d5574:     	minss	%xmm1, %xmm2
1454d5578:     	movsd	0x10c(%r14,%r15), %xmm1
1454d5582:     	movsd	0x118(%r14,%r15), %xmm3
1454d558c:     	subps	%xmm1, %xmm3
1454d558f:     	movsldup	%xmm2, %xmm9            # xmm9 = xmm2[0,0,2,2]
1454d5594:     	mulps	%xmm3, %xmm9
1454d5598:     	addps	%xmm1, %xmm9
1454d559c:     	movss	0x114(%r14,%r15), %xmm1
1454d55a6:     	movss	0x120(%r14,%r15), %xmm10
1454d55b0:     	subss	%xmm1, %xmm10
1454d55b5:     	mulss	%xmm2, %xmm10
1454d55ba:     	addss	%xmm1, %xmm10
1454d55bf:     	jmp	0x1454d55d5 <.text+0x54d45d5>
1454d55c1:     	movsd	0x118(%r14,%r15), %xmm9
1454d55cb:     	movss	0x120(%r14,%r15), %xmm10
1454d55d5:     	movaps	%xmm8, %xmm7
1454d55d9:     	minss	%xmm0, %xmm7
1454d55dd:     	movq	0x18(%r14,%r15), %r13
1454d55e2:     	cvtss2sd	%xmm8, %xmm11
1454d55e7:     	movsd	0x628(%rsi), %xmm0
1454d55ef:     	addsd	%xmm11, %xmm0
1454d55f4:     	movsd	%xmm0, 0x628(%rsi)
1454d55fc:     	leaq	0x650(%rsi), %rax
1454d5603:     	movq	0x650(%rsi), %rcx
1454d560a:     	testq	%rcx, %rcx
1454d560d:     	je	0x1454d569a <.text+0x54d469a>
1454d5613:     	movq	0x658(%rsi), %rdx
1454d561a:     	movzwl	0x8e(%rcx), %r9d
1454d5622:     	movl	%r9d, %r10d
1454d5625:     	shll	$0x2, %r10d
1454d5629:     	movq	$-0x1, %r8
1454d5630:     	testq	%r10, %r10
1454d5633:     	je	0x1454d565a <.text+0x54d465a>
1454d5635:     	cmpl	0x64(%rcx,%r8,4), %ebx
1454d563a:     	seta	%r11b
1454d563e:     	sbbb	$0x0, %r11b
1454d5642:     	incq	%r8
1454d5645:     	addq	$-0x4, %r10
1454d5649:     	cmpb	$0x1, %r11b
1454d564d:     	je	0x1454d5630 <.text+0x54d4630>
1454d564f:     	movzbl	%r11b, %r9d
1454d5653:     	testl	%r9d, %r9d
1454d5656:     	jne	0x1454d565d <.text+0x54d465d>
1454d5658:     	jmp	0x1454d5671 <.text+0x54d4671>
1454d565a:     	movq	%r9, %r8
1454d565d:     	subq	$0x1, %rdx
1454d5661:     	jb	0x1454d6999 <.text+0x54d5999>
1454d5667:     	movq	0x90(%rcx,%r8,8), %rcx
1454d566f:     	jmp	0x1454d561a <.text+0x54d461a>
1454d5671:     	movq	%rcx, 0xf8(%rbp)
1454d5678:     	movq	%rdx, 0x100(%rbp)
1454d567f:     	movq	%r8, 0x108(%rbp)
1454d5686:     	movq	%rax, 0x110(%rbp)
1454d568d:     	movq	$0x0, 0xf0(%rbp)
1454d5698:     	jmp	0x1454d56b2 <.text+0x54d46b2>
1454d569a:     	movq	%rax, 0xf0(%rbp)
1454d56a1:     	movq	$0x0, 0xf8(%rbp)
1454d56ac:     	movl	%ebx, 0x110(%rbp)
1454d56b2:     	leaq	0xf0(%rbp), %rcx
1454d56b9:     	callq	0x14552a540 <.text+0x5529540>
1454d56be:     	addsd	(%rax), %xmm11
1454d56c3:     	movsd	%xmm11, (%rax)
1454d56c8:     	movss	0xf0(%r14,%r15), %xmm11
1454d56d2:     	xorps	%xmm12, %xmm12
1454d56d6:     	movaps	%xmm11, %xmm0
1454d56da:     	maxss	%xmm12, %xmm0
1454d56df:     	callq	0x14577327d <.text+0x577227d>
1454d56e4:     	cvttss2si	%xmm0, %rax
1454d56e9:     	xorl	%ecx, %ecx
1454d56eb:     	ucomiss	%xmm12, %xmm0
1454d56ef:     	cmovael	%eax, %ecx
1454d56f2:     	ucomiss	0x431e33(%rip), %xmm0   # 0x14590752c
1454d56f9:     	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
1454d56ff:     	cmovbel	%ecx, %r14d
1454d5703:     	cvtss2sd	%xmm7, %xmm7
1454d5707:     	leaq	0xf0(%rbp), %r15
1454d570e:     	movq	%r15, %rcx
1454d5711:     	movq	%rsi, %rdx
1454d5714:     	movl	%ebx, %r8d
1454d5717:     	callq	0x1454a0520 <.text+0x549f520>
1454d571c:     	leaq	0x5e0(%rsi), %rcx
1454d5723:     	movq	%r15, %rdx
1454d5726:     	movaps	%xmm7, %xmm2
1454d5729:     	callq	0x1455021b0 <.text+0x55011b0>
1454d572e:     	cmpq	$-0x1, %r13
1454d5732:     	je	0x1454d57cf <.text+0x54d47cf>
1454d5738:     	cmpl	$0x0, 0x66c(%rsi)
1454d573f:     	je	0x1454d57a8 <.text+0x54d47a8>
1454d5741:     	movss	0x934(%rsi), %xmm0
1454d5749:     	movss	%xmm0, 0x668(%rsi)
1454d5751:     	movl	$0x0, 0x66c(%rsi)
1454d575b:     	movq	0x618(%rsi), %r15
1454d5762:     	movq	0x620(%rsi), %r13
1454d5769:     	movq	$0x0, 0x620(%rsi)
1454d5774:     	testq	%r13, %r13
1454d5777:     	je	0x1454d57a8 <.text+0x54d47a8>
1454d5779:     	addq	$0x8, %r15
1454d577d:     	jmp	0x1454d5789 <.text+0x54d4789>
1454d577f:     	nop
1454d5780:     	addq	$0x38, %r15
1454d5784:     	decq	%r13
1454d5787:     	je	0x1454d57a8 <.text+0x54d47a8>
1454d5789:     	movq	-0x8(%r15), %rdx
1454d578d:     	cmpq	$-0x1, %rdx
1454d5791:     	je	0x1454d5780 <.text+0x54d4780>
1454d5793:     	testq	%rdx, %rdx
1454d5796:     	je	0x1454d5780 <.text+0x54d4780>
1454d5798:     	movq	(%r15), %rcx
1454d579b:     	movl	$0x1, %r8d
1454d57a1:     	callq	0x1400021d0 <.text+0x11d0>
1454d57a6:     	jmp	0x1454d5780 <.text+0x54d4780>
1454d57a8:     	leaq	0xf0(%rbp), %r15
1454d57af:     	movq	%r15, %rcx
1454d57b2:     	movq	%rsi, %rdx
1454d57b5:     	movl	%ebx, %r8d
1454d57b8:     	callq	0x1454a0520 <.text+0x549f520>
1454d57bd:     	leaq	0x610(%rsi), %rcx
1454d57c4:     	movq	%r15, %rdx
1454d57c7:     	movaps	%xmm7, %xmm2
1454d57ca:     	callq	0x1455021b0 <.text+0x55011b0>
1454d57cf:     	testl	%ebx, %ebx
1454d57d1:     	sete	%al
1454d57d4:     	orb	%r12b, %al
1454d57d7:     	jne	0x1454d58ab <.text+0x54d48ab>
1454d57dd:     	movq	0x3e8(%rsi), %r8
1454d57e4:     	cmpl	$0x3ea6, %ebx           # imm = 0x3EA6
1454d57ea:     	je	0x1454d580f <.text+0x54d480f>
1454d57ec:     	cmpl	$0x376a, %ebx           # imm = 0x376A
1454d57f2:     	je	0x1454d5807 <.text+0x54d4807>
1454d57f4:     	movl	%ebx, %r9d
1454d57f7:     	cmpl	$0x14bc, %ebx           # imm = 0x14BC
1454d57fd:     	jne	0x1454d5815 <.text+0x54d4815>
1454d57ff:     	movl	$0x50a7, %r9d           # imm = 0x50A7
1454d5805:     	jmp	0x1454d5815 <.text+0x54d4815>
1454d5807:     	movl	$0x832, %r9d            # imm = 0x832
1454d580d:     	jmp	0x1454d5815 <.text+0x54d4815>
1454d580f:     	movl	$0x209d, %r9d           # imm = 0x209D
1454d5815:     	cvttss2si	%xmm8, %rax
1454d581a:     	xorl	%ecx, %ecx
1454d581c:     	xorps	%xmm0, %xmm0
1454d581f:     	ucomiss	%xmm0, %xmm8
1454d5823:     	cmovael	%eax, %ecx
1454d5826:     	ucomiss	0x431cfe(%rip), %xmm8   # 0x14590752c
1454d582e:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454d5833:     	cmovbel	%ecx, %eax
1454d5836:     	movzbl	0x298(%rbp), %ecx
1454d583d:     	movb	%cl, 0x30(%rsp)
1454d5841:     	movzbl	0x290(%rbp), %ecx
1454d5848:     	movb	%cl, 0x28(%rsp)
1454d584c:     	movl	%eax, 0x20(%rsp)
1454d5850:     	leaq	0xf0(%rbp), %rcx
1454d5857:     	movq	%rdi, %rdx
1454d585a:     	callq	0x14545f6d0 <.text+0x545e6d0>
1454d585f:     	movq	0x560(%rsi), %r15
1454d5866:     	cmpq	0x550(%rsi), %r15
1454d586d:     	jne	0x1454d587c <.text+0x54d487c>
1454d586f:     	leaq	0x550(%rsi), %rcx
1454d5876:     	callq	0x145774710 <.text+0x5773710>
1454d587b:     	nop
1454d587c:     	movq	0x558(%rsi), %rax
1454d5883:     	movq	%r15, %rcx
1454d5886:     	shlq	$0x5, %rcx
1454d588a:     	movups	0xf0(%rbp), %xmm0
1454d5891:     	movups	0x100(%rbp), %xmm1
1454d5898:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d589d:     	movups	%xmm0, (%rax,%rcx)
1454d58a1:     	incq	%r15
1454d58a4:     	movq	%r15, 0x560(%rsi)
1454d58ab:     	movq	$0x0, -0x28(%rbp)
1454d58b3:     	movq	$0x0, -0x18(%rbp)
1454d58bb:     	leaq	-0x28(%rbp), %rax
1454d58bf:     	movq	%rax, 0xf0(%rbp)
1454d58c6:     	xorps	%xmm0, %xmm0
1454d58c9:     	movups	%xmm0, 0xf8(%rbp)
1454d58d0:     	movq	$0x16, 0x110(%rbp)
1454d58db:     	leaq	0xb8(%rbp), %rcx
1454d58e2:     	leaq	0xf0(%rbp), %rdx
1454d58e9:     	movl	%r14d, %r8d
1454d58ec:     	callq	0x14552a730 <.text+0x5529730>
1454d58f1:     	nop
1454d58f2:     	movl	$0x0, 0x38(%rbp)
1454d58f9:     	movq	$0x0, 0x20(%rbp)
1454d5901:     	movq	$0x1, 0x28(%rbp)
1454d5909:     	movq	$0x0, 0x30(%rbp)
1454d5911:     	cmpq	$0x0, -0x18(%rbp)
1454d5916:     	je	0x1454d5964 <.text+0x54d4964>
1454d5918:     	movb	$0x1, 0x175(%rbp)
1454d591f:     	leaq	0x20(%rbp), %rcx
1454d5923:     	callq	0x145903690 <.text+0x5902690>
1454d5928:     	nop
1454d5929:     	movq	0x28(%rbp), %rax
1454d592d:     	movb	$0x0, (%rax)
1454d5930:     	movq	$0x1, 0x30(%rbp)
1454d5938:     	movb	$0x1, 0x175(%rbp)
1454d593f:     	leaq	0x20(%rbp), %rdx
1454d5943:     	movq	%rdi, %rcx
1454d5946:     	callq	0x14551c6a0 <.text+0x551b6a0>
1454d594b:     	nop
1454d594c:     	movb	$0x1, 0x175(%rbp)
1454d5953:     	leaq	-0x28(%rbp), %rcx
1454d5957:     	leaq	0x20(%rbp), %rdx
1454d595b:     	callq	0x145513880 <.text+0x5512880>
1454d5960:     	nop
1454d5961:     	incl	0x38(%rbp)
1454d5964:     	movq	0x20(%rbp), %rax
1454d5968:     	movq	0x28(%rbp), %rcx
1454d596c:     	movq	0x30(%rbp), %rdx
1454d5970:     	movq	%rdx, 0x100(%rbp)
1454d5977:     	movl	0x38(%rbp), %edx
1454d597a:     	movl	%edx, 0x108(%rbp)
1454d5980:     	movl	0x3c(%rbp), %edx
1454d5983:     	movl	%edx, 0x10c(%rbp)
1454d5989:     	movq	%rax, 0xf0(%rbp)
1454d5990:     	movq	%rcx, 0xf8(%rbp)
1454d5997:     	movb	$0x0, 0x175(%rbp)
1454d599e:     	leaq	0xb8(%rbp), %rcx
1454d59a5:     	leaq	0xf0(%rbp), %rdx
1454d59ac:     	callq	0x145512ef0 <.text+0x5511ef0>
1454d59b1:     	nop
1454d59b2:     	movq	0x560(%rsi), %r14
1454d59b9:     	cmpq	0x550(%rsi), %r14
1454d59c0:     	jne	0x1454d59cf <.text+0x54d49cf>
1454d59c2:     	leaq	0x550(%rsi), %rcx
1454d59c9:     	callq	0x145774710 <.text+0x5773710>
1454d59ce:     	nop
1454d59cf:     	movq	0x558(%rsi), %rax
1454d59d6:     	movq	%r14, %rcx
1454d59d9:     	shlq	$0x5, %rcx
1454d59dd:     	movups	0xb8(%rbp), %xmm0
1454d59e4:     	movups	0xc8(%rbp), %xmm1
1454d59eb:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d59f0:     	movups	%xmm0, (%rax,%rcx)
1454d59f4:     	incq	%r14
1454d59f7:     	movq	%r14, 0x560(%rsi)
1454d59fe:     	movq	%rsi, %rcx
1454d5a01:     	callq	0x1454c24b0 <.text+0x54c14b0>
1454d5a06:     	xorps	%xmm12, %xmm12
1454d5a0a:     	ucomiss	%xmm12, %xmm0
1454d5a0e:     	jbe	0x1454d5cca <.text+0x54d4cca>
1454d5a14:     	mulss	%xmm0, %xmm8
1454d5a19:     	movss	0x418(%rsi), %xmm1
1454d5a21:     	movss	0x470(%rsi), %xmm7
1454d5a29:     	addss	%xmm1, %xmm8
1454d5a2e:     	movaps	%xmm8, %xmm2
1454d5a32:     	minss	%xmm7, %xmm2
1454d5a36:     	movaps	%xmm2, %xmm0
1454d5a39:     	cmpunordss	%xmm2, %xmm0
1454d5a3e:     	andps	%xmm0, %xmm8
1454d5a42:     	andnps	%xmm2, %xmm0
1454d5a45:     	orps	%xmm8, %xmm0
1454d5a49:     	movss	%xmm0, 0x418(%rsi)
1454d5a51:     	movaps	%xmm0, %xmm8
1454d5a55:     	subss	%xmm1, %xmm8
1454d5a5a:     	ucomiss	%xmm8, %xmm12
1454d5a5e:     	jae	0x1454d5afd <.text+0x54d4afd>
1454d5a64:     	movb	$0x0, 0x175(%rbp)
1454d5a6b:     	leaq	0x1520fe6(%rip), %r14   # 0x1469f6a58
1454d5a72:     	movl	$0x5, %r15d
1454d5a78:     	movl	$0x5, %edx
1454d5a7d:     	movq	%r14, %rcx
1454d5a80:     	callq	0x145457cb0 <.text+0x5456cb0>
1454d5a85:     	nop
1454d5a86:     	testq	%rax, %rax
1454d5a89:     	cmovneq	%rax, %r14
1454d5a8d:     	cmoveq	%r15, %rdx
1454d5a91:     	movq	$-0x1, 0xf0(%rbp)
1454d5a9c:     	movq	%r14, 0xf8(%rbp)
1454d5aa3:     	movq	%rdx, 0x100(%rbp)
1454d5aaa:     	leaq	0x1520fac(%rip), %rax   # 0x1469f6a5d
1454d5ab1:     	movq	%rax, 0x108(%rbp)
1454d5ab8:     	movq	$0x18, 0x110(%rbp)
1454d5ac3:     	movb	$0x0, 0x118(%rbp)
1454d5aca:     	leaq	0x5f8(%rsi), %rcx
1454d5ad1:     	xorps	%xmm2, %xmm2
1454d5ad4:     	cvtss2sd	%xmm8, %xmm2
1454d5ad9:     	movb	$0x0, 0x175(%rbp)
1454d5ae0:     	leaq	0xf0(%rbp), %rdx
1454d5ae7:     	callq	0x1455021b0 <.text+0x55011b0>
1454d5aec:     	nop
1454d5aed:     	movss	0x418(%rsi), %xmm0
1454d5af5:     	movss	0x470(%rsi), %xmm7
1454d5afd:     	xorps	%xmm8, %xmm8
1454d5b01:     	maxss	%xmm8, %xmm0
1454d5b06:     	callq	0x14577327d <.text+0x577227d>
1454d5b0b:     	cvttss2si	%xmm0, %rax
1454d5b10:     	xorl	%ecx, %ecx
1454d5b12:     	ucomiss	%xmm8, %xmm0
1454d5b16:     	cmovbl	%ecx, %eax
1454d5b19:     	ucomiss	0x431a0c(%rip), %xmm0   # 0x14590752c
1454d5b20:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454d5b26:     	cmovbel	%eax, %r8d
1454d5b2a:     	leaq	0x8d8(%rsi), %r14
1454d5b31:     	movq	0x8d8(%rsi), %rax
1454d5b38:     	testq	%rax, %rax
1454d5b3b:     	je	0x1454d5ba2 <.text+0x54d4ba2>
1454d5b3d:     	movq	0x8e0(%rsi), %rcx
1454d5b44:     	movw	$0x16, %dx
1454d5b48:     	movzwl	0x36(%rax), %r10d
1454d5b4d:     	movl	%r10d, %r11d
1454d5b50:     	addl	%r11d, %r11d
1454d5b53:     	movq	$-0x1, %r9
1454d5b5a:     	nopw	(%rax,%rax)
1454d5b60:     	testq	%r11, %r11
1454d5b63:     	je	0x1454d5b8b <.text+0x54d4b8b>
1454d5b65:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d5b6b:     	seta	%r15b
1454d5b6f:     	sbbb	$0x0, %r15b
1454d5b73:     	incq	%r9
1454d5b76:     	addq	$-0x2, %r11
1454d5b7a:     	cmpb	$0x1, %r15b
1454d5b7e:     	je	0x1454d5b60 <.text+0x54d4b60>
1454d5b80:     	movzbl	%r15b, %r10d
1454d5b84:     	testl	%r10d, %r10d
1454d5b87:     	jne	0x1454d5b8e <.text+0x54d4b8e>
1454d5b89:     	jmp	0x1454d5b9b <.text+0x54d4b9b>
1454d5b8b:     	movq	%r10, %r9
1454d5b8e:     	subq	$0x1, %rcx
1454d5b92:     	jb	0x1454d5ba4 <.text+0x54d4ba4>
1454d5b94:     	movq	0x50(%rax,%r9,8), %rax
1454d5b99:     	jmp	0x1454d5b48 <.text+0x54d4b48>
1454d5b9b:     	movl	%r8d, 0x8(%rax,%r9,4)
1454d5ba0:     	jmp	0x1454d5bea <.text+0x54d4bea>
1454d5ba2:     	xorl	%eax, %eax
1454d5ba4:     	movq	%r14, 0xf0(%rbp)
1454d5bab:     	movq	%rax, 0xf8(%rbp)
1454d5bb2:     	movq	$0x0, 0x100(%rbp)
1454d5bbd:     	movq	%r9, 0x108(%rbp)
1454d5bc4:     	movq	$0x16, 0x110(%rbp)
1454d5bcf:     	movb	$0x0, 0x175(%rbp)
1454d5bd6:     	leaq	0xb8(%rbp), %rcx
1454d5bdd:     	leaq	0xf0(%rbp), %rdx
1454d5be4:     	callq	0x14552a730 <.text+0x5529730>
1454d5be9:     	nop
1454d5bea:     	movaps	%xmm7, %xmm0
1454d5bed:     	callq	0x14577327d <.text+0x577227d>
1454d5bf2:     	cvttss2si	%xmm0, %rax
1454d5bf7:     	xorl	%ecx, %ecx
1454d5bf9:     	xorps	%xmm1, %xmm1
1454d5bfc:     	ucomiss	%xmm1, %xmm0
1454d5bff:     	cmovbl	%ecx, %eax
1454d5c02:     	ucomiss	0x431923(%rip), %xmm0   # 0x14590752c
1454d5c09:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454d5c0f:     	cmovbel	%eax, %r8d
1454d5c13:     	movq	(%r14), %rax
1454d5c16:     	testq	%rax, %rax
1454d5c19:     	je	0x1454d5c82 <.text+0x54d4c82>
1454d5c1b:     	movq	0x8e0(%rsi), %rcx
1454d5c22:     	movw	$0x1c, %dx
1454d5c26:     	movzwl	0x36(%rax), %r10d
1454d5c2b:     	movl	%r10d, %r11d
1454d5c2e:     	addl	%r11d, %r11d
1454d5c31:     	movq	$-0x1, %r9
1454d5c38:     	nopl	(%rax,%rax)
1454d5c40:     	testq	%r11, %r11
1454d5c43:     	je	0x1454d5c6b <.text+0x54d4c6b>
1454d5c45:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d5c4b:     	seta	%r15b
1454d5c4f:     	sbbb	$0x0, %r15b
1454d5c53:     	incq	%r9
1454d5c56:     	addq	$-0x2, %r11
1454d5c5a:     	cmpb	$0x1, %r15b
1454d5c5e:     	je	0x1454d5c40 <.text+0x54d4c40>
1454d5c60:     	movzbl	%r15b, %r10d
1454d5c64:     	testl	%r10d, %r10d
1454d5c67:     	jne	0x1454d5c6e <.text+0x54d4c6e>
1454d5c69:     	jmp	0x1454d5c7b <.text+0x54d4c7b>
1454d5c6b:     	movq	%r10, %r9
1454d5c6e:     	subq	$0x1, %rcx
1454d5c72:     	jb	0x1454d5c84 <.text+0x54d4c84>
1454d5c74:     	movq	0x50(%rax,%r9,8), %rax
1454d5c79:     	jmp	0x1454d5c26 <.text+0x54d4c26>
1454d5c7b:     	movl	%r8d, 0x8(%rax,%r9,4)
1454d5c80:     	jmp	0x1454d5cca <.text+0x54d4cca>
1454d5c82:     	xorl	%eax, %eax
1454d5c84:     	movq	%r14, 0xf0(%rbp)
1454d5c8b:     	movq	%rax, 0xf8(%rbp)
1454d5c92:     	movq	$0x0, 0x100(%rbp)
1454d5c9d:     	movq	%r9, 0x108(%rbp)
1454d5ca4:     	movq	$0x1c, 0x110(%rbp)
1454d5caf:     	movb	$0x0, 0x175(%rbp)
1454d5cb6:     	leaq	0xb8(%rbp), %rcx
1454d5cbd:     	leaq	0xf0(%rbp), %rdx
1454d5cc4:     	callq	0x14552a730 <.text+0x5529730>
1454d5cc9:     	nop
1454d5cca:     	ucomiss	%xmm11, %xmm12
1454d5cce:     	jb	0x1454d5d8a <.text+0x54d4d8a>
1454d5cd4:     	movq	0x4e0(%rsi), %rax
1454d5cdb:     	movq	0x4e8(%rsi), %rcx
1454d5ce2:     	leaq	-0x160(%rax), %r9
1454d5ce9:     	imulq	$0x160, %rcx, %r8       # imm = 0x160
1454d5cf0:     	testq	%r8, %r8
1454d5cf3:     	je	0x1454d5d9a <.text+0x54d4d9a>
1454d5cf9:     	leaq	0x160(%r9), %rdx
1454d5d00:     	addq	$-0x160, %r8            # imm = 0xFEA0
1454d5d07:     	cmpq	%rdi, 0x1e8(%r9)
1454d5d0e:     	movq	%rdx, %r9
1454d5d11:     	jne	0x1454d5cf0 <.text+0x54d4cf0>
1454d5d13:     	movss	0xf4(%rdx), %xmm7
1454d5d1b:     	movb	$0x0, 0x175(%rbp)
1454d5d22:     	leaq	0xf0(%rbp), %rcx
1454d5d29:     	callq	0x145546ce0 <.text+0x5545ce0>
1454d5d2e:     	nop
1454d5d2f:     	movss	%xmm7, 0x108(%rbp)
1454d5d37:     	movlps	%xmm9, 0x10c(%rbp)
1454d5d3f:     	movss	%xmm10, 0x114(%rbp)
1454d5d48:     	movq	0xf0(%rbp), %rax
1454d5d4f:     	movq	%rax, 0xe0(%rbp)
1454d5d56:     	movq	0xf8(%rbp), %rax
1454d5d5d:     	movq	%rax, 0x80(%rbp)
1454d5d64:     	movups	0x100(%rbp), %xmm0
1454d5d6b:     	movaps	%xmm0, (%rbp)
1454d5d6f:     	movq	0x110(%rbp), %rax
1454d5d76:     	movq	%rax, 0x10(%rbp)
1454d5d7a:     	movq	0x4e0(%rsi), %rax
1454d5d81:     	movq	0x4e8(%rsi), %rcx
1454d5d88:     	jmp	0x1454d5da5 <.text+0x54d4da5>
1454d5d8a:     	movq	$-0x1, 0xe0(%rbp)
1454d5d95:     	jmp	0x1454d6ea0 <.text+0x54d5ea0>
1454d5d9a:     	movq	$-0x1, 0xe0(%rbp)
1454d5da5:     	movss	0x934(%rsi), %xmm8
1454d5dae:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454d5db4:     	imulq	$0x160, %rcx, %rdx      # imm = 0x160
1454d5dbb:     	nopl	(%rax,%rax)
1454d5dc0:     	testq	%rdx, %rdx
1454d5dc3:     	je	0x1454d6e90 <.text+0x54d5e90>
1454d5dc9:     	leaq	0x160(%rax), %rcx
1454d5dd0:     	addq	$-0x160, %rdx           # imm = 0xFEA0
1454d5dd7:     	cmpq	%rdi, 0x1e8(%rax)
1454d5dde:     	movq	%rcx, %rax
1454d5de1:     	jne	0x1454d5dc0 <.text+0x54d4dc0>
1454d5de3:     	movss	0x128(%rcx), %xmm0
1454d5deb:     	xorps	%xmm1, %xmm1
1454d5dee:     	ucomiss	%xmm0, %xmm1
1454d5df1:     	jae	0x1454d5e5d <.text+0x54d4e5d>
1454d5df3:     	movaps	%xmm8, %xmm2
1454d5df7:     	subss	0x124(%rcx), %xmm2
1454d5dff:     	divss	%xmm0, %xmm2
1454d5e03:     	maxss	%xmm2, %xmm1
1454d5e07:     	movss	0x431681(%rip), %xmm2   # 0x145907490
1454d5e0f:     	minss	%xmm1, %xmm2
1454d5e13:     	movss	0x114(%rcx), %xmm1
1454d5e1b:     	movss	0x120(%rcx), %xmm3
1454d5e23:     	subss	%xmm1, %xmm3
1454d5e27:     	mulss	%xmm2, %xmm3
1454d5e2b:     	addss	%xmm1, %xmm3
1454d5e2f:     	movsd	0x10c(%rcx), %xmm1
1454d5e37:     	movsd	0x118(%rcx), %xmm4
1454d5e3f:     	subps	%xmm1, %xmm4
1454d5e42:     	movsldup	%xmm2, %xmm2            # xmm2 = xmm2[0,0,2,2]
1454d5e46:     	mulps	%xmm4, %xmm2
1454d5e49:     	addps	%xmm1, %xmm2
1454d5e4c:     	movlps	%xmm2, 0x158(%rbp)
1454d5e53:     	movss	%xmm3, 0x160(%rbp)
1454d5e5b:     	jmp	0x1454d5e77 <.text+0x54d4e77>
1454d5e5d:     	movl	0x120(%rcx), %eax
1454d5e63:     	movl	%eax, 0x160(%rbp)
1454d5e69:     	movq	0x118(%rcx), %rax
1454d5e70:     	movq	%rax, 0x158(%rbp)
1454d5e77:     	xorps	%xmm1, %xmm1
1454d5e7a:     	ucomiss	%xmm1, %xmm0
1454d5e7d:     	jbe	0x1454d5e91 <.text+0x54d4e91>
1454d5e7f:     	addss	0x124(%rcx), %xmm0
1454d5e87:     	ucomiss	%xmm8, %xmm0
1454d5e8b:     	seta	%r12b
1454d5e8f:     	jmp	0x1454d5e94 <.text+0x54d4e94>
1454d5e91:     	xorl	%r12d, %r12d
1454d5e94:     	movl	0x160(%rbp), %eax
1454d5e9a:     	movl	%eax, 0x114(%rcx)
1454d5ea0:     	movq	0x158(%rbp), %rax
1454d5ea7:     	movq	%rax, 0x10c(%rcx)
1454d5eae:     	movq	0x158(%rbp), %rax
1454d5eb5:     	movq	%rax, 0x118(%rcx)
1454d5ebc:     	movl	0x160(%rbp), %eax
1454d5ec2:     	movl	%eax, 0x120(%rcx)
1454d5ec8:     	xorps	%xmm0, %xmm0
1454d5ecb:     	movss	%xmm8, %xmm0            # xmm0 = xmm8[0],xmm0[1,2,3]
1454d5ed0:     	movlps	%xmm0, 0x124(%rcx)
1454d5ed7:     	movl	$0x1, 0x68(%rcx)
1454d5ede:     	movss	%xmm8, 0x6c(%rcx)
1454d5ee4:     	movq	$0x0, 0x10(%rcx)
1454d5eec:     	cmpq	$-0x1, 0x18(%rcx)
1454d5ef1:     	je	0x1454d5f00 <.text+0x54d4f00>
1454d5ef3:     	movq	0x30(%rcx), %rax
1454d5ef7:     	movq	%rax, 0x150(%rbp)
1454d5efe:     	jmp	0x1454d5f0b <.text+0x54d4f0b>
1454d5f00:     	movq	$0x0, 0x150(%rbp)
1454d5f0b:     	movq	0x40(%rcx), %r13
1454d5f0f:     	cmpq	$-0x1, %r13
1454d5f13:     	je	0x1454d5f1f <.text+0x54d4f1f>
1454d5f15:     	movq	0x58(%rcx), %rax
1454d5f19:     	movq	%rax, 0x70(%rbp)
1454d5f1d:     	jmp	0x1454d5f1f <.text+0x54d4f1f>
1454d5f1f:     	movq	0x90(%rcx), %rax
1454d5f26:     	movq	%rax, 0xb0(%rbp)
1454d5f2d:     	movb	0x158(%rcx), %r15b
1454d5f34:     	callq	0x145450ae0 <.text+0x544fae0>
1454d5f39:     	movq	%rax, 0x168(%rbp)
1454d5f40:     	movq	%rdx, 0xe8(%rbp)
1454d5f47:     	testb	%r12b, %r12b
1454d5f4a:     	je	0x1454d5fff <.text+0x54d4fff>
1454d5f50:     	movq	0x898(%rsi), %rcx
1454d5f57:     	addq	$0x10, %rcx
1454d5f5b:     	movsd	0x158(%rbp), %xmm7
1454d5f63:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
1454d5f67:     	movaps	%xmm7, %xmm1
1454d5f6a:     	callq	0x14552a140 <.text+0x5529140>
1454d5f6f:     	nop
1454d5f70:     	testb	$0x1, %al
1454d5f72:     	jne	0x1454d5f7c <.text+0x54d4f7c>
1454d5f74:     	movss	0x160(%rbp), %xmm0
1454d5f7c:     	movlps	%xmm7, 0xb8(%rbp)
1454d5f83:     	movss	%xmm0, 0xc0(%rbp)
1454d5f8b:     	movl	0x958(%rsi), %r9d
1454d5f92:     	incl	%r9d
1454d5f95:     	movl	%r9d, 0x958(%rsi)
1454d5f9c:     	leaq	0xf0(%rbp), %rcx
1454d5fa3:     	leaq	0xb8(%rbp), %r8
1454d5faa:     	movq	%rdi, %rdx
1454d5fad:     	callq	0x14545ff20 <.text+0x545ef20>
1454d5fb2:     	nop
1454d5fb3:     	movq	0x560(%rsi), %r14
1454d5fba:     	cmpq	0x550(%rsi), %r14
1454d5fc1:     	jne	0x1454d5fd0 <.text+0x54d4fd0>
1454d5fc3:     	leaq	0x550(%rsi), %rcx
1454d5fca:     	callq	0x145774710 <.text+0x5773710>
1454d5fcf:     	nop
1454d5fd0:     	movq	0x558(%rsi), %rax
1454d5fd7:     	movq	%r14, %rcx
1454d5fda:     	shlq	$0x5, %rcx
1454d5fde:     	movups	0xf0(%rbp), %xmm0
1454d5fe5:     	movups	0x100(%rbp), %xmm1
1454d5fec:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d5ff1:     	movups	%xmm0, (%rax,%rcx)
1454d5ff5:     	incq	%r14
1454d5ff8:     	movq	%r14, 0x560(%rsi)
1454d5fff:     	movq	$0x0, 0x48(%rbp)
1454d6007:     	movq	$0x0, 0x58(%rbp)
1454d600f:     	leaq	0x48(%rbp), %rax
1454d6013:     	movq	%rax, 0xf0(%rbp)
1454d601a:     	xorps	%xmm0, %xmm0
1454d601d:     	movups	%xmm0, 0xf8(%rbp)
1454d6024:     	movq	$0x16, 0x110(%rbp)
1454d602f:     	leaq	0xb8(%rbp), %rcx
1454d6036:     	leaq	0xf0(%rbp), %rdx
1454d603d:     	xorl	%r8d, %r8d
1454d6040:     	callq	0x14552a730 <.text+0x5529730>
1454d6045:     	nop
1454d6046:     	leaq	0x48(%rbp), %rcx
1454d604a:     	movw	$0x10, %dx
1454d604e:     	xorl	%r8d, %r8d
1454d6051:     	callq	0x145513710 <.text+0x5512710>
1454d6056:     	nop
1454d6057:     	movl	$0x0, 0xa0(%rbp)
1454d6061:     	movq	$0x0, 0x88(%rbp)
1454d606c:     	movq	$0x1, 0x90(%rbp)
1454d6077:     	movq	$0x0, 0x98(%rbp)
1454d6082:     	cmpq	$0x0, 0x58(%rbp)
1454d6087:     	je	0x1454d60e7 <.text+0x54d50e7>
1454d6089:     	movb	$0x1, 0x177(%rbp)
1454d6090:     	leaq	0x88(%rbp), %rcx
1454d6097:     	callq	0x145903690 <.text+0x5902690>
1454d609c:     	nop
1454d609d:     	movq	0x90(%rbp), %rax
1454d60a4:     	movb	$0x0, (%rax)
1454d60a7:     	movq	$0x1, 0x98(%rbp)
1454d60b2:     	movb	$0x1, 0x177(%rbp)
1454d60b9:     	leaq	0x88(%rbp), %rdx
1454d60c0:     	movq	%rdi, %rcx
1454d60c3:     	callq	0x14551c6a0 <.text+0x551b6a0>
1454d60c8:     	nop
1454d60c9:     	movb	$0x1, 0x177(%rbp)
1454d60d0:     	leaq	0x48(%rbp), %rcx
1454d60d4:     	leaq	0x88(%rbp), %rdx
1454d60db:     	callq	0x145513880 <.text+0x5512880>
1454d60e0:     	nop
1454d60e1:     	incl	0xa0(%rbp)
1454d60e7:     	movq	0x88(%rbp), %rax
1454d60ee:     	movq	0x90(%rbp), %rcx
1454d60f5:     	movq	0x98(%rbp), %rdx
1454d60fc:     	movq	%rdx, 0x100(%rbp)
1454d6103:     	movl	0xa0(%rbp), %edx
1454d6109:     	movl	%edx, 0x108(%rbp)
1454d610f:     	movl	0xa4(%rbp), %edx
1454d6115:     	movl	%edx, 0x10c(%rbp)
1454d611b:     	movq	%rax, 0xf0(%rbp)
1454d6122:     	movq	%rcx, 0xf8(%rbp)
1454d6129:     	movb	$0x0, 0x177(%rbp)
1454d6130:     	leaq	0xb8(%rbp), %rcx
1454d6137:     	leaq	0xf0(%rbp), %rdx
1454d613e:     	callq	0x145512ef0 <.text+0x5511ef0>
1454d6143:     	nop
1454d6144:     	movq	0x560(%rsi), %r14
1454d614b:     	cmpq	0x550(%rsi), %r14
1454d6152:     	jne	0x1454d6161 <.text+0x54d5161>
1454d6154:     	leaq	0x550(%rsi), %rcx
1454d615b:     	callq	0x145774710 <.text+0x5773710>
1454d6160:     	nop
1454d6161:     	movq	0x558(%rsi), %rax
1454d6168:     	movq	%r14, %rcx
1454d616b:     	shlq	$0x5, %rcx
1454d616f:     	movups	0xb8(%rbp), %xmm0
1454d6176:     	movups	0xc8(%rbp), %xmm1
1454d617d:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d6182:     	movups	%xmm0, (%rax,%rcx)
1454d6186:     	incq	%r14
1454d6189:     	movq	%r14, 0x560(%rsi)
1454d6190:     	incl	0x674(%rsi)
1454d6196:     	testb	%r15b, %r15b
1454d6199:     	je	0x1454d61a1 <.text+0x54d51a1>
1454d619b:     	incl	0x678(%rsi)
1454d61a1:     	movss	0x4ac(%rsi), %xmm12
1454d61aa:     	xorps	%xmm0, %xmm0
1454d61ad:     	ucomiss	%xmm0, %xmm12
1454d61b1:     	jbe	0x1454d6313 <.text+0x54d5313>
1454d61b7:     	movb	$0x0, 0x177(%rbp)
1454d61be:     	leaq	0x15210fd(%rip), %r15   # 0x1469f72c2
1454d61c5:     	movl	$0xf, %edx
1454d61ca:     	movq	%r15, %rcx
1454d61cd:     	callq	0x145457cb0 <.text+0x5456cb0>
1454d61d2:     	nop
1454d61d3:     	movss	0x418(%rsi), %xmm2
1454d61db:     	movss	0x470(%rsi), %xmm7
1454d61e3:     	addss	%xmm2, %xmm12
1454d61e8:     	movaps	%xmm12, %xmm1
1454d61ec:     	minss	%xmm7, %xmm1
1454d61f0:     	movaps	%xmm1, %xmm0
1454d61f3:     	cmpunordss	%xmm1, %xmm0
1454d61f8:     	andps	%xmm0, %xmm12
1454d61fc:     	andnps	%xmm1, %xmm0
1454d61ff:     	orps	%xmm12, %xmm0
1454d6203:     	movss	%xmm0, 0x418(%rsi)
1454d620b:     	movaps	%xmm0, %xmm1
1454d620e:     	subss	%xmm2, %xmm1
1454d6212:     	xorps	%xmm12, %xmm12
1454d6216:     	ucomiss	%xmm1, %xmm12
1454d621a:     	jae	0x1454d6297 <.text+0x54d5297>
1454d621c:     	testq	%rax, %rax
1454d621f:     	movl	$0xf, %ecx
1454d6224:     	cmoveq	%rcx, %rdx
1454d6228:     	cmovneq	%rax, %r15
1454d622c:     	movq	$-0x1, 0xf0(%rbp)
1454d6237:     	movq	%r15, 0xf8(%rbp)
1454d623e:     	movq	%rdx, 0x100(%rbp)
1454d6245:     	leaq	0x1521085(%rip), %rax   # 0x1469f72d1
1454d624c:     	movq	%rax, 0x108(%rbp)
1454d6253:     	movq	$0x16, 0x110(%rbp)
1454d625e:     	movb	$0x0, 0x118(%rbp)
1454d6265:     	leaq	0x5f8(%rsi), %rcx
1454d626c:     	xorps	%xmm2, %xmm2
1454d626f:     	cvtss2sd	%xmm1, %xmm2
1454d6273:     	movb	$0x0, 0x177(%rbp)
1454d627a:     	leaq	0xf0(%rbp), %rdx
1454d6281:     	callq	0x1455021b0 <.text+0x55011b0>
1454d6286:     	nop
1454d6287:     	movss	0x418(%rsi), %xmm0
1454d628f:     	movss	0x470(%rsi), %xmm7
1454d6297:     	maxss	%xmm12, %xmm0
1454d629c:     	callq	0x14577327d <.text+0x577227d>
1454d62a1:     	cvttss2si	%xmm0, %r8
1454d62a6:     	xorl	%r12d, %r12d
1454d62a9:     	ucomiss	%xmm12, %xmm0
1454d62ad:     	cmovbl	%r12d, %r8d
1454d62b1:     	ucomiss	0x431274(%rip), %xmm0   # 0x14590752c
1454d62b8:     	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
1454d62be:     	cmoval	%r14d, %r8d
1454d62c2:     	leaq	0x8d8(%rsi), %r15
1454d62c9:     	movb	$0x0, 0x177(%rbp)
1454d62d0:     	movq	%r15, %rcx
1454d62d3:     	movw	$0x16, %dx
1454d62d7:     	callq	0x145513650 <.text+0x5512650>
1454d62dc:     	nop
1454d62dd:     	movaps	%xmm7, %xmm0
1454d62e0:     	callq	0x14577327d <.text+0x577227d>
1454d62e5:     	cvttss2si	%xmm0, %r8
1454d62ea:     	xorps	%xmm1, %xmm1
1454d62ed:     	ucomiss	%xmm1, %xmm0
1454d62f0:     	cmovbl	%r12d, %r8d
1454d62f4:     	ucomiss	0x431231(%rip), %xmm0   # 0x14590752c
1454d62fb:     	cmoval	%r14d, %r8d
1454d62ff:     	movb	$0x0, 0x177(%rbp)
1454d6306:     	movq	%r15, %rcx
1454d6309:     	movw	$0x1c, %dx
1454d630d:     	callq	0x145513650 <.text+0x5512650>
1454d6312:     	nop
1454d6313:     	movq	0x150(%rbp), %rcx
1454d631a:     	testq	%rcx, %rcx
1454d631d:     	je	0x1454d636b <.text+0x54d536b>
1454d631f:     	movq	0x4e0(%rsi), %r8
1454d6326:     	imulq	$0x160, 0x4e8(%rsi), %rax # imm = 0x160
1454d6331:     	nopw	%cs:(%rax,%rax)
1454d6340:     	testq	%rax, %rax
1454d6343:     	je	0x1454d661d <.text+0x54d561d>
1454d6349:     	movq	%r8, %rdx
1454d634c:     	addq	$0x160, %r8             # imm = 0x160
1454d6353:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454d6359:     	cmpb	$0x0, 0x68(%rdx)
1454d635d:     	jne	0x1454d6340 <.text+0x54d5340>
1454d635f:     	cmpq	$-0x1, 0x18(%rdx)
1454d6364:     	je	0x1454d6340 <.text+0x54d5340>
1454d6366:     	jmp	0x1454d6649 <.text+0x54d5649>
1454d636b:     	cmpq	$-0x1, %r13
1454d636f:     	je	0x1454d69be <.text+0x54d59be>
1454d6375:     	movq	0x70(%rbp), %rcx
1454d6379:     	cmpq	0x5a8(%rsi), %rcx
1454d6380:     	jae	0x1454d63ab <.text+0x54d53ab>
1454d6382:     	movq	0x5a0(%rsi), %rax
1454d6389:     	leaq	(%rcx,%rcx,4), %rcx
1454d638d:     	movq	$0x0, (%rax,%rcx,8)
1454d6395:     	movss	0x934(%rsi), %xmm0
1454d639d:     	addss	0x50e87f(%rip), %xmm0   # 0x1459e4c24
1454d63a5:     	movss	%xmm0, 0x24(%rax,%rcx,8)
1454d63ab:     	movq	$0x0, (%rsi)
1454d63b2:     	incl	0x67c(%rsi)
1454d63b8:     	movb	$0x0, 0x177(%rbp)
1454d63bf:     	leaq	0x1521f6a(%rip), %r15   # 0x1469f8330
1454d63c6:     	movl	$0x5e, %r14d
1454d63cc:     	movl	$0x5e, %edx
1454d63d1:     	movq	%r15, %rcx
1454d63d4:     	callq	0x145457cb0 <.text+0x5456cb0>
1454d63d9:     	nop
1454d63da:     	testq	%rax, %rax
1454d63dd:     	cmovneq	%rax, %r15
1454d63e1:     	cmoveq	%r14, %rdx
1454d63e5:     	movb	$0x0, 0x177(%rbp)
1454d63ec:     	movq	%rdx, 0x20(%rsp)
1454d63f1:     	leaq	0xf0(%rbp), %rcx
1454d63f8:     	movq	0x168(%rbp), %rdx
1454d63ff:     	movq	0xe8(%rbp), %r8
1454d6406:     	movq	%r15, %r9
1454d6409:     	callq	0x145459d40 <.text+0x5458d40>
1454d640e:     	nop
1454d640f:     	movq	0x560(%rsi), %r14
1454d6416:     	cmpq	0x550(%rsi), %r14
1454d641d:     	jne	0x1454d642c <.text+0x54d542c>
1454d641f:     	leaq	0x550(%rsi), %rcx
1454d6426:     	callq	0x145774710 <.text+0x5773710>
1454d642b:     	nop
1454d642c:     	movq	0x558(%rsi), %rax
1454d6433:     	movq	%r14, %rcx
1454d6436:     	shlq	$0x5, %rcx
1454d643a:     	movups	0xf0(%rbp), %xmm0
1454d6441:     	movups	0x100(%rbp), %xmm1
1454d6448:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d644d:     	movups	%xmm0, (%rax,%rcx)
1454d6451:     	incq	%r14
1454d6454:     	movq	%r14, 0x560(%rsi)
1454d645b:     	movb	$0x0, 0x177(%rbp)
1454d6462:     	leaq	0xf0(%rbp), %rcx
1454d6469:     	movl	$0x1fee, %edx           # imm = 0x1FEE
1454d646e:     	callq	0x14545a810 <.text+0x5459810>
1454d6473:     	nop
1454d6474:     	movq	0x560(%rsi), %r14
1454d647b:     	cmpq	0x550(%rsi), %r14
1454d6482:     	jne	0x1454d6491 <.text+0x54d5491>
1454d6484:     	leaq	0x550(%rsi), %rcx
1454d648b:     	callq	0x145774710 <.text+0x5773710>
1454d6490:     	nop
1454d6491:     	movq	0x558(%rsi), %rax
1454d6498:     	movq	%r14, %rcx
1454d649b:     	shlq	$0x5, %rcx
1454d649f:     	movups	0xf0(%rbp), %xmm0
1454d64a6:     	movups	0x100(%rbp), %xmm1
1454d64ad:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d64b2:     	movups	%xmm0, (%rax,%rcx)
1454d64b6:     	incq	%r14
1454d64b9:     	movq	%r14, 0x560(%rsi)
1454d64c0:     	movb	$0x0, 0x177(%rbp)
1454d64c7:     	leaq	0xf0(%rbp), %rcx
1454d64ce:     	callq	0x145456970 <.text+0x5455970>
1454d64d3:     	nop
1454d64d4:     	movb	$0x0, 0x177(%rbp)
1454d64db:     	leaq	0x151fdac(%rip), %rax   # 0x1469f628e
1454d64e2:     	movq	%rax, 0x20(%rsp)
1454d64e7:     	movq	$0x8, 0x28(%rsp)
1454d64f0:     	leaq	0x15205dd(%rip), %r8    # 0x1469f6ad4
1454d64f7:     	leaq	0xb8(%rbp), %rcx
1454d64fe:     	leaq	0xf0(%rbp), %rdx
1454d6505:     	movl	$0x4, %r9d
1454d650b:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d6510:     	nop
1454d6511:     	movb	$0x0, 0x177(%rbp)
1454d6518:     	movq	0xe8(%rbp), %rax
1454d651f:     	movq	%rax, 0x28(%rsp)
1454d6524:     	movq	0x168(%rbp), %rax
1454d652b:     	movq	%rax, 0x20(%rsp)
1454d6530:     	leaq	0x1520572(%rip), %r8    # 0x1469f6aa9
1454d6537:     	leaq	0xf0(%rbp), %rcx
1454d653e:     	leaq	0xb8(%rbp), %rdx
1454d6545:     	movl	$0x4, %r9d
1454d654b:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d6550:     	nop
1454d6551:     	movb	$0x0, 0x177(%rbp)
1454d6558:     	leaq	0xb8(%rbp), %rcx
1454d655f:     	leaq	0xf0(%rbp), %rdx
1454d6566:     	callq	0x145456b70 <.text+0x5455b70>
1454d656b:     	nop
1454d656c:     	movq	0x578(%rsi), %r14
1454d6573:     	cmpq	0x568(%rsi), %r14
1454d657a:     	jne	0x1454d65a5 <.text+0x54d55a5>
1454d657c:     	leaq	0x568(%rsi), %rcx
1454d6583:     	movq	0xb8(%rbp), %rax
1454d658a:     	movq	%rax, 0x150(%rbp)
1454d6591:     	movq	0xc0(%rbp), %rax
1454d6598:     	movq	%rax, 0x168(%rbp)
1454d659f:     	callq	0x1457745c0 <.text+0x57735c0>
1454d65a4:     	nop
1454d65a5:     	movq	0x570(%rsi), %rax
1454d65ac:     	leaq	(%r14,%r14,2), %rcx
1454d65b0:     	movq	0xc8(%rbp), %rdx
1454d65b7:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454d65bc:     	movups	0xb8(%rbp), %xmm0
1454d65c3:     	movups	%xmm0, (%rax,%rcx,8)
1454d65c7:     	incq	%r14
1454d65ca:     	movq	%r14, 0x578(%rsi)
1454d65d1:     	movl	0x67c(%rsi), %eax
1454d65d7:     	leal	(%rax,%rax,4), %r8d
1454d65db:     	addl	$0x19, %r8d
1454d65df:     	movb	$0x0, 0x177(%rbp)
1454d65e6:     	leaq	0x158(%rbp), %r9
1454d65ed:     	movq	%rsi, %rcx
1454d65f0:     	movl	$0x1, %edx
1454d65f5:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454d65fa:     	nop
1454d65fb:     	movb	$0x0, 0x177(%rbp)
1454d6602:     	leaq	0x158(%rbp), %rdx
1454d6609:     	movq	%rsi, %rcx
1454d660c:     	callq	0x1454d3790 <.text+0x54d2790>
1454d6611:     	nop
1454d6612:     	incl	0x948(%rsi)
1454d6618:     	jmp	0x1454d6e86 <.text+0x54d5e86>
1454d661d:     	movl	0x66c(%rsi), %eax
1454d6623:     	cmpl	$0x2, %eax
1454d6626:     	sete	%dl
1454d6629:     	orb	%dl, %al
1454d662b:     	testb	$0x1, %al
1454d662d:     	jne	0x1454d6649 <.text+0x54d5649>
1454d662f:     	movss	0x934(%rsi), %xmm0
1454d6637:     	movl	$0x1, 0x66c(%rsi)
1454d6641:     	movss	%xmm0, 0x670(%rsi)
1454d6649:     	incl	0x680(%rsi)
1454d664f:     	movb	$0x0, 0x177(%rbp)
1454d6656:     	callq	0x145420100 <.text+0x541f100>
1454d665b:     	nop
1454d665c:     	movq	%rax, %r14
1454d665f:     	movq	%rdx, %r15
1454d6662:     	movb	$0x0, 0x177(%rbp)
1454d6669:     	leaq	0x1520c77(%rip), %r13   # 0x1469f72e7
1454d6670:     	movl	$0xd, %r12d
1454d6676:     	movl	$0xd, %edx
1454d667b:     	movq	%r13, %rcx
1454d667e:     	callq	0x145457cb0 <.text+0x5456cb0>
1454d6683:     	nop
1454d6684:     	testq	%rax, %rax
1454d6687:     	cmovneq	%rax, %r13
1454d668b:     	cmoveq	%r12, %rdx
1454d668f:     	movb	$0x0, 0x177(%rbp)
1454d6696:     	movq	%rdx, 0x28(%rsp)
1454d669b:     	movq	%r13, 0x20(%rsp)
1454d66a0:     	leaq	0xf0(%rbp), %rcx
1454d66a7:     	movq	%rdi, %rdx
1454d66aa:     	movq	%r14, %r8
1454d66ad:     	movq	%r15, %r9
1454d66b0:     	callq	0x14545b960 <.text+0x545a960>
1454d66b5:     	nop
1454d66b6:     	movq	0x560(%rsi), %r14
1454d66bd:     	cmpq	0x550(%rsi), %r14
1454d66c4:     	jne	0x1454d66d3 <.text+0x54d56d3>
1454d66c6:     	leaq	0x550(%rsi), %rcx
1454d66cd:     	callq	0x145774710 <.text+0x5773710>
1454d66d2:     	nop
1454d66d3:     	movq	0x558(%rsi), %rax
1454d66da:     	movq	%r14, %rcx
1454d66dd:     	shlq	$0x5, %rcx
1454d66e1:     	movups	0xf0(%rbp), %xmm0
1454d66e8:     	movups	0x100(%rbp), %xmm1
1454d66ef:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d66f4:     	movups	%xmm0, (%rax,%rcx)
1454d66f8:     	incq	%r14
1454d66fb:     	movq	%r14, 0x560(%rsi)
1454d6702:     	movb	$0x0, 0x177(%rbp)
1454d6709:     	leaq	0xf0(%rbp), %rcx
1454d6710:     	callq	0x145456970 <.text+0x5455970>
1454d6715:     	nop
1454d6716:     	movb	$0x0, 0x177(%rbp)
1454d671d:     	leaq	0x1520bd0(%rip), %rax   # 0x1469f72f4
1454d6724:     	movq	%rax, 0x20(%rsp)
1454d6729:     	movq	$0x8, 0x28(%rsp)
1454d6732:     	leaq	0x152039b(%rip), %r8    # 0x1469f6ad4
1454d6739:     	leaq	0xb8(%rbp), %rcx
1454d6740:     	leaq	0xf0(%rbp), %rdx
1454d6747:     	movl	$0x4, %r9d
1454d674d:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d6752:     	nop
1454d6753:     	movb	$0x1, 0x173(%rbp)
1454d675a:     	movq	0x150(%rbp), %rcx
1454d6761:     	callq	0x145420100 <.text+0x541f100>
1454d6766:     	nop
1454d6767:     	movb	$0x0, 0x173(%rbp)
1454d676e:     	movq	%rdx, 0x28(%rsp)
1454d6773:     	movq	%rax, 0x20(%rsp)
1454d6778:     	leaq	0x152032a(%rip), %r8    # 0x1469f6aa9
1454d677f:     	leaq	0xf0(%rbp), %rcx
1454d6786:     	leaq	0xb8(%rbp), %rdx
1454d678d:     	movl	$0x4, %r9d
1454d6793:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d6798:     	nop
1454d6799:     	movb	$0x0, 0x177(%rbp)
1454d67a0:     	leaq	0xb8(%rbp), %rcx
1454d67a7:     	leaq	0xf0(%rbp), %rdx
1454d67ae:     	callq	0x145456b70 <.text+0x5455b70>
1454d67b3:     	nop
1454d67b4:     	movq	0x578(%rsi), %r14
1454d67bb:     	cmpq	0x568(%rsi), %r14
1454d67c2:     	jne	0x1454d67ed <.text+0x54d57ed>
1454d67c4:     	leaq	0x568(%rsi), %rcx
1454d67cb:     	movq	0xb8(%rbp), %rax
1454d67d2:     	movq	%rax, 0x168(%rbp)
1454d67d9:     	movq	0xc0(%rbp), %rax
1454d67e0:     	movq	%rax, 0xe8(%rbp)
1454d67e7:     	callq	0x1457745c0 <.text+0x57735c0>
1454d67ec:     	nop
1454d67ed:     	movq	0x570(%rsi), %rax
1454d67f4:     	leaq	(%r14,%r14,2), %rcx
1454d67f8:     	movq	0xc8(%rbp), %rdx
1454d67ff:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454d6804:     	movups	0xb8(%rbp), %xmm0
1454d680b:     	movups	%xmm0, (%rax,%rcx,8)
1454d680f:     	incq	%r14
1454d6812:     	movq	%r14, 0x578(%rsi)
1454d6819:     	movl	0x680(%rsi), %eax
1454d681f:     	leal	(%rax,%rax,4), %eax
1454d6822:     	leal	0x3c(,%rax,4), %r8d
1454d682a:     	movb	$0x0, 0x177(%rbp)
1454d6831:     	leaq	0x158(%rbp), %r9
1454d6838:     	movq	%rsi, %rcx
1454d683b:     	xorl	%edx, %edx
1454d683d:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454d6842:     	nop
1454d6843:     	movl	0x680(%rsi), %eax
1454d6849:     	leal	(%rax,%rax,4), %eax
1454d684c:     	leal	0x28(,%rax,4), %r8d
1454d6854:     	movsd	0x158(%rbp), %xmm12
1454d685d:     	movss	0x160(%rbp), %xmm7
1454d6865:     	movsd	0x151f673(%rip), %xmm0  # 0x1469f5ee0
1454d686d:     	addps	%xmm12, %xmm0
1454d6871:     	movlps	%xmm0, 0xf0(%rbp)
1454d6878:     	movss	%xmm7, 0xf8(%rbp)
1454d6880:     	movb	$0x0, 0x177(%rbp)
1454d6887:     	leaq	0xf0(%rbp), %r9
1454d688e:     	movq	%rsi, %rcx
1454d6891:     	movl	$0x1, %edx
1454d6896:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454d689b:     	nop
1454d689c:     	cmpq	$0x0, 0x6a0(%rsi)
1454d68a4:     	je	0x1454d690b <.text+0x54d590b>
1454d68a6:     	movq	0x698(%rsi), %rax
1454d68ad:     	movss	(%rax), %xmm0
1454d68b1:     	ucomiss	0x934(%rsi), %xmm0
1454d68b8:     	ja	0x1454d690b <.text+0x54d590b>
1454d68ba:     	leaq	0x690(%rsi), %rcx
1454d68c1:     	movb	$0x0, 0x177(%rbp)
1454d68c8:     	leaq	0x15207b1(%rip), %r8    # 0x1469f7080
1454d68cf:     	xorl	%edx, %edx
1454d68d1:     	callq	0x145534030 <.text+0x5533030>
1454d68d6:     	nop
1454d68d7:     	addps	0x151f5e1(%rip), %xmm12 # 0x1469f5ec0
1454d68df:     	movlps	%xmm12, 0xf0(%rbp)
1454d68e7:     	movss	%xmm7, 0xf8(%rbp)
1454d68ef:     	movb	$0x0, 0x177(%rbp)
1454d68f6:     	leaq	0xf0(%rbp), %r9
1454d68fd:     	movq	%rsi, %rcx
1454d6900:     	movl	$0x6, %edx
1454d6905:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454d690a:     	nop
1454d690b:     	cmpb	$0x0, 0x9b2(%rsi)
1454d6912:     	jne	0x1454d6bf3 <.text+0x54d5bf3>
1454d6918:     	movq	0x228(%rsi), %rcx
1454d691f:     	movq	0x230(%rsi), %rdx
1454d6926:     	callq	0x145420480 <.text+0x541f480>
1454d692b:     	imulq	$0xf0, %rax, %rcx
1454d6932:     	leaq	0x125cbdf(%rip), %rax   # 0x146733518
1454d6939:     	movq	0x88(%rcx,%rax), %rdx
1454d6941:     	movq	0x150(%rbp), %r9
1454d6948:     	cmpq	%r9, %rdx
1454d694b:     	je	0x1454d6a01 <.text+0x54d5a01>
1454d6951:     	leaq	0x58(%rdx), %r8
1454d6955:     	cmpq	%r9, %r8
1454d6958:     	je	0x1454d6a06 <.text+0x54d5a06>
1454d695e:     	leaq	0xb0(%rdx), %r8
1454d6965:     	cmpq	%r9, %r8
1454d6968:     	je	0x1454d6a0e <.text+0x54d5a0e>
1454d696e:     	leaq	0x108(%rdx), %r8
1454d6975:     	cmpq	%r9, %r8
1454d6978:     	je	0x1454d6a62 <.text+0x54d5a62>
1454d697e:     	addq	$0x160, %rdx            # imm = 0x160
1454d6985:     	cmpq	%r9, %rdx
1454d6988:     	jne	0x1454d6bf3 <.text+0x54d5bf3>
1454d698e:     	movl	$0x4, %r14d
1454d6994:     	jmp	0x1454d6a68 <.text+0x54d5a68>
1454d6999:     	movq	%rcx, 0xf8(%rbp)
1454d69a0:     	movq	$0x0, 0x100(%rbp)
1454d69ab:     	movq	%r8, 0x108(%rbp)
1454d69b2:     	movq	%rax, 0xf0(%rbp)
1454d69b9:     	jmp	0x1454d56ac <.text+0x54d46ac>
1454d69be:     	movq	0xb0(%rbp), %rcx
1454d69c5:     	testq	%rcx, %rcx
1454d69c8:     	je	0x1454d6e86 <.text+0x54d5e86>
1454d69ce:     	cmpb	$0x1, 0x4c(%rcx)
1454d69d2:     	jne	0x1454d6a16 <.text+0x54d5a16>
1454d69d4:     	movzwl	0x248(%rsi), %eax
1454d69db:     	xorps	%xmm0, %xmm0
1454d69de:     	cvtsi2ss	%eax, %xmm0
1454d69e2:     	divss	0x430b52(%rip), %xmm0   # 0x14590753c
1454d69ea:     	movss	0x151f4fd(%rip), %xmm8  # 0x1469f5ef0
1454d69f3:     	divss	%xmm0, %xmm8
1454d69f8:     	movl	0x40(%rcx), %r8d
1454d69fc:     	jmp	0x1454d6cf7 <.text+0x54d5cf7>
1454d6a01:     	xorl	%r14d, %r14d
1454d6a04:     	jmp	0x1454d6a68 <.text+0x54d5a68>
1454d6a06:     	movl	$0x1, %r14d
1454d6a0c:     	jmp	0x1454d6a68 <.text+0x54d5a68>
1454d6a0e:     	movl	$0x2, %r14d
1454d6a14:     	jmp	0x1454d6a68 <.text+0x54d5a68>
1454d6a16:     	movss	0x44(%rcx), %xmm0
1454d6a1b:     	addss	0x960(%rsi), %xmm0
1454d6a23:     	movss	%xmm0, 0x960(%rsi)
1454d6a2b:     	movzwl	0x248(%rsi), %eax
1454d6a32:     	xorps	%xmm0, %xmm0
1454d6a35:     	cvtsi2ss	%eax, %xmm0
1454d6a39:     	divss	0x430afb(%rip), %xmm0   # 0x14590753c
1454d6a41:     	movss	0x151f4a6(%rip), %xmm8  # 0x1469f5ef0
1454d6a4a:     	divss	%xmm0, %xmm8
1454d6a4f:     	cmpb	$0x1, 0x4c(%rcx)
1454d6a53:     	jne	0x1454d6c39 <.text+0x54d5c39>
1454d6a59:     	movl	0x40(%rcx), %r8d
1454d6a5d:     	jmp	0x1454d6cf7 <.text+0x54d5cf7>
1454d6a62:     	movl	$0x3, %r14d
1454d6a68:     	addq	%rcx, %rax
1454d6a6b:     	movq	0x8(%rax), %rcx
1454d6a6f:     	movq	0x10(%rax), %rdx
1454d6a73:     	callq	0x145420480 <.text+0x541f480>
1454d6a78:     	movq	%rax, %r15
1454d6a7b:     	leaq	0x248(%rsi), %rcx
1454d6a82:     	movb	$0x0, 0x177(%rbp)
1454d6a89:     	callq	0x1454515e0 <.text+0x54505e0>
1454d6a8e:     	nop
1454d6a8f:     	movaps	%xmm0, %xmm7
1454d6a92:     	movzbl	0x29c(%rsi), %edx
1454d6a99:     	movb	$0x0, 0x177(%rbp)
1454d6aa0:     	leaq	0xf0(%rbp), %rcx
1454d6aa7:     	movq	%r15, %r8
1454d6aaa:     	movq	%r14, %r9
1454d6aad:     	callq	0x14546d7e0 <.text+0x546c7e0>
1454d6ab2:     	nop
1454d6ab3:     	movq	0xf0(%rbp), %rax
1454d6aba:     	movq	%rax, 0xe8(%rbp)
1454d6ac1:     	movq	0xf8(%rbp), %rax
1454d6ac8:     	movq	%rax, 0x168(%rbp)
1454d6acf:     	movq	0x100(%rbp), %rax
1454d6ad6:     	testq	%rax, %rax
1454d6ad9:     	je	0x1454d6bd1 <.text+0x54d5bd1>
1454d6adf:     	movq	0x168(%rbp), %r13
1454d6ae6:     	leaq	(,%rax,8), %r15
1454d6aee:     	addq	%r13, %r15
1454d6af1:     	movss	0x5318a6(%rip), %xmm12  # 0x145a083a0
1454d6afa:     	jmp	0x1454d6b1e <.text+0x54d5b1e>
1454d6afc:     	movq	0x5b8(%rsi), %rax
1454d6b03:     	movl	%r12d, (%rax,%r14,4)
1454d6b07:     	incq	%r14
1454d6b0a:     	movq	%r14, 0x5c0(%rsi)
1454d6b11:     	addq	$0x8, %r13
1454d6b15:     	cmpq	%r15, %r13
1454d6b18:     	je	0x1454d6bd1 <.text+0x54d5bd1>
1454d6b1e:     	movl	(%r13), %r12d
1454d6b22:     	movss	0x4(%r13), %xmm0
1454d6b28:     	movq	0x8b8(%rsi), %rax
1454d6b2f:     	movq	0x8a0(%rsi), %rcx
1454d6b36:     	movq	0x8a8(%rsi), %rdx
1454d6b3d:     	leaq	(%rax,%rcx), %r8
1454d6b41:     	rolq	$0x17, %r8
1454d6b45:     	addq	%rcx, %r8
1454d6b48:     	movq	%rdx, %r9
1454d6b4b:     	shlq	$0x11, %r9
1454d6b4f:     	movq	0x8b0(%rsi), %r10
1454d6b56:     	xorq	%rcx, %r10
1454d6b59:     	xorq	%rdx, %rax
1454d6b5c:     	xorq	%r10, %rdx
1454d6b5f:     	movq	%rdx, 0x8a8(%rsi)
1454d6b66:     	xorq	%rax, %rcx
1454d6b69:     	movq	%rcx, 0x8a0(%rsi)
1454d6b70:     	xorq	%r9, %r10
1454d6b73:     	rolq	$0x2d, %rax
1454d6b77:     	shrq	$0x28, %r8
1454d6b7b:     	xorps	%xmm1, %xmm1
1454d6b7e:     	cvtsi2ss	%r8d, %xmm1
1454d6b83:     	movq	%r10, 0x8b0(%rsi)
1454d6b8a:     	movq	%rax, 0x8b8(%rsi)
1454d6b91:     	addss	0x220(%rsi), %xmm0
1454d6b99:     	mulss	%xmm12, %xmm1
1454d6b9e:     	mulss	%xmm7, %xmm0
1454d6ba2:     	ucomiss	%xmm1, %xmm0
1454d6ba5:     	jbe	0x1454d6b11 <.text+0x54d5b11>
1454d6bab:     	movq	0x5c0(%rsi), %r14
1454d6bb2:     	cmpq	0x5b0(%rsi), %r14
1454d6bb9:     	jne	0x1454d6afc <.text+0x54d5afc>
1454d6bbf:     	leaq	0x5b0(%rsi), %rcx
1454d6bc6:     	callq	0x145777a50 <.text+0x5776a50>
1454d6bcb:     	nop
1454d6bcc:     	jmp	0x1454d6afc <.text+0x54d5afc>
1454d6bd1:     	movq	0xe8(%rbp), %rdx
1454d6bd8:     	testq	%rdx, %rdx
1454d6bdb:     	je	0x1454d6bf3 <.text+0x54d5bf3>
1454d6bdd:     	shlq	$0x3, %rdx
1454d6be1:     	movl	$0x4, %r8d
1454d6be7:     	movq	0x168(%rbp), %rcx
1454d6bee:     	callq	0x1400021d0 <.text+0x11d0>
1454d6bf3:     	movb	$0x0, 0x177(%rbp)
1454d6bfa:     	movq	%rsi, %rcx
1454d6bfd:     	callq	0x1454e4530 <.text+0x54e3530>
1454d6c02:     	nop
1454d6c03:     	movq	0x150(%rbp), %rax
1454d6c0a:     	cmpb	$0x1, 0x54(%rax)
1454d6c0e:     	jne	0x1454d6e86 <.text+0x54d5e86>
1454d6c14:     	cmpb	$0x0, 0x870(%rsi)
1454d6c1b:     	jne	0x1454d6e86 <.text+0x54d5e86>
1454d6c21:     	movl	$0x1, 0x870(%rsi)
1454d6c2b:     	movss	%xmm8, 0x874(%rsi)
1454d6c34:     	jmp	0x1454d6e86 <.text+0x54d5e86>
1454d6c39:     	movl	0x40(%rcx), %r9d
1454d6c3d:     	movq	0x8b8(%rsi), %rax
1454d6c44:     	movq	0x8a0(%rsi), %rdx
1454d6c4b:     	movq	0x8a8(%rsi), %r10
1454d6c52:     	leaq	(%rax,%rdx), %rcx
1454d6c56:     	rolq	$0x17, %rcx
1454d6c5a:     	addq	%rdx, %rcx
1454d6c5d:     	movq	%r10, %r11
1454d6c60:     	shlq	$0x11, %r11
1454d6c64:     	movq	0x8b0(%rsi), %r8
1454d6c6b:     	xorq	%rdx, %r8
1454d6c6e:     	xorq	%r10, %rax
1454d6c71:     	xorq	%r8, %r10
1454d6c74:     	movq	%r10, 0x8a8(%rsi)
1454d6c7b:     	xorq	%rax, %rdx
1454d6c7e:     	xorq	%r11, %r8
1454d6c81:     	rolq	$0x2d, %rax
1454d6c85:     	cvtsi2ss	%r9, %xmm7
1454d6c8a:     	mulss	%xmm8, %xmm7
1454d6c8f:     	cvttss2si	%xmm7, %r9
1454d6c94:     	xorl	%r10d, %r10d
1454d6c97:     	xorps	%xmm0, %xmm0
1454d6c9a:     	ucomiss	%xmm0, %xmm7
1454d6c9d:     	cmovael	%r9d, %r10d
1454d6ca1:     	movq	%rdx, 0x8a0(%rsi)
1454d6ca8:     	ucomiss	0x43087d(%rip), %xmm7   # 0x14590752c
1454d6caf:     	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
1454d6cb5:     	cmovbel	%r10d, %r14d
1454d6cb9:     	shrq	$0x28, %rcx
1454d6cbd:     	xorps	%xmm12, %xmm12
1454d6cc1:     	cvtsi2ss	%ecx, %xmm12
1454d6cc6:     	movq	%r8, 0x8b0(%rsi)
1454d6ccd:     	movq	%rax, 0x8b8(%rsi)
1454d6cd4:     	mulss	0x5316c3(%rip), %xmm12  # 0x145a083a0
1454d6cdd:     	movaps	%xmm7, %xmm0
1454d6ce0:     	callq	0x145773241 <.text+0x5772241>
1454d6ce5:     	subss	%xmm0, %xmm7
1454d6ce9:     	xorl	%r8d, %r8d
1454d6cec:     	ucomiss	%xmm12, %xmm7
1454d6cf0:     	seta	%r8b
1454d6cf4:     	addl	%r14d, %r8d
1454d6cf7:     	testl	%r8d, %r8d
1454d6cfa:     	je	0x1454d6d15 <.text+0x54d5d15>
1454d6cfc:     	movb	$0x0, 0x177(%rbp)
1454d6d03:     	leaq	0x158(%rbp), %r9
1454d6d0a:     	movq	%rsi, %rcx
1454d6d0d:     	xorl	%edx, %edx
1454d6d0f:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454d6d14:     	nop
1454d6d15:     	movq	0xb0(%rbp), %r11
1454d6d1c:     	cmpb	$0x0, 0x4c(%r11)
1454d6d21:     	jne	0x1454d6d2e <.text+0x54d5d2e>
1454d6d23:     	mulss	0x43c5c4(%rip), %xmm8   # 0x1459132f0
1454d6d2c:     	jmp	0x1454d6d37 <.text+0x54d5d37>
1454d6d2e:     	movss	0x430759(%rip), %xmm8   # 0x145907490
1454d6d37:     	movq	0x8b8(%rsi), %rax
1454d6d3e:     	movq	0x8a0(%rsi), %rcx
1454d6d45:     	leaq	(%rax,%rcx), %rdx
1454d6d49:     	rolq	$0x17, %rdx
1454d6d4d:     	movq	0x8a8(%rsi), %r8
1454d6d54:     	addq	%rcx, %rdx
1454d6d57:     	movq	%r8, %r9
1454d6d5a:     	shlq	$0x11, %r9
1454d6d5e:     	movq	0x8b0(%rsi), %r10
1454d6d65:     	xorq	%rcx, %r10
1454d6d68:     	xorq	%r8, %rax
1454d6d6b:     	xorq	%r10, %r8
1454d6d6e:     	movq	%r8, 0x8a8(%rsi)
1454d6d75:     	xorq	%rax, %rcx
1454d6d78:     	movq	%rcx, 0x8a0(%rsi)
1454d6d7f:     	xorq	%r9, %r10
1454d6d82:     	movq	%r10, 0x8b0(%rsi)
1454d6d89:     	rolq	$0x2d, %rax
1454d6d8d:     	movq	%rax, 0x8b8(%rsi)
1454d6d94:     	shrq	$0x28, %rdx
1454d6d98:     	xorps	%xmm0, %xmm0
1454d6d9b:     	cvtsi2ss	%edx, %xmm0
1454d6d9f:     	mulss	0x5315f9(%rip), %xmm0   # 0x145a083a0
1454d6da7:     	ucomiss	%xmm0, %xmm8
1454d6dab:     	jbe	0x1454d6e26 <.text+0x54d5e26>
1454d6dad:     	movl	$0xf, %r8d
1454d6db3:     	cmpb	$0x0, 0x4c(%r11)
1454d6db8:     	jne	0x1454d6ddd <.text+0x54d5ddd>
1454d6dba:     	leaq	0x8a0(%rsi), %rcx
1454d6dc1:     	movb	$0x0, 0x177(%rbp)
1454d6dc8:     	xorl	%edx, %edx
1454d6dca:     	movl	$0x3, %r8d
1454d6dd0:     	callq	0x14550d810 <.text+0x550c810>
1454d6dd5:     	nop
1454d6dd6:     	movl	%eax, %r8d
1454d6dd9:     	addl	$0x2, %r8d
1454d6ddd:     	movsd	0x158(%rbp), %xmm0
1454d6de5:     	addps	0x50e704(%rip), %xmm0   # 0x1459e54f0
1454d6dec:     	movss	0x160(%rbp), %xmm1
1454d6df4:     	movlps	%xmm0, 0xf0(%rbp)
1454d6dfb:     	movss	%xmm1, 0xf8(%rbp)
1454d6e03:     	movb	$0x0, 0x177(%rbp)
1454d6e0a:     	leaq	0xf0(%rbp), %r9
1454d6e11:     	movq	%rsi, %rcx
1454d6e14:     	movl	$0x1, %edx
1454d6e19:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454d6e1e:     	nop
1454d6e1f:     	movq	0xb0(%rbp), %r11
1454d6e26:     	cmpb	$0x0, 0x4c(%r11)
1454d6e2b:     	je	0x1454d6e86 <.text+0x54d5e86>
1454d6e2d:     	movsd	0x158(%rbp), %xmm7
1454d6e35:     	addps	0x151f0c4(%rip), %xmm7  # 0x1469f5f00
1454d6e3c:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
1454d6e40:     	movq	0x898(%rsi), %rcx
1454d6e47:     	addq	$0x10, %rcx
1454d6e4b:     	movb	$0x0, 0x177(%rbp)
1454d6e52:     	movaps	%xmm7, %xmm1
1454d6e55:     	callq	0x145526f30 <.text+0x5525f30>
1454d6e5a:     	nop
1454d6e5b:     	movlps	%xmm7, 0xf0(%rbp)
1454d6e62:     	movss	%xmm0, 0xf8(%rbp)
1454d6e6a:     	movb	$0x0, 0x177(%rbp)
1454d6e71:     	leaq	0xf0(%rbp), %r9
1454d6e78:     	movq	%rsi, %rcx
1454d6e7b:     	movl	$0x2, %edx
1454d6e80:     	callq	0x1454da2c0 <.text+0x54d92c0>
1454d6e85:     	nop
1454d6e86:     	leaq	0x48(%rbp), %rcx
1454d6e8a:     	callq	0x14550cd20 <.text+0x550bd20>
1454d6e8f:     	nop
1454d6e90:     	movaps	(%rbp), %xmm0
1454d6e94:     	movaps	%xmm0, -0x40(%rbp)
1454d6e98:     	movq	0x10(%rbp), %rax
1454d6e9c:     	movq	%rax, -0x30(%rbp)
1454d6ea0:     	movlps	%xmm9, 0x60(%rbp)
1454d6ea5:     	movss	%xmm10, 0x68(%rbp)
1454d6eab:     	movq	%rdi, -0x10(%rbp)
1454d6eaf:     	movq	0x2b0(%rsi), %rax
1454d6eb6:     	imulq	$0x58, 0x2b8(%rsi), %rcx
1454d6ebe:     	xorl	%edx, %edx
1454d6ec0:     	cmpq	%rdx, %rcx
1454d6ec3:     	je	0x1454d8108 <.text+0x54d7108>
1454d6ec9:     	movq	(%rax,%rdx), %r8
1454d6ecd:     	addq	$0x58, %rdx
1454d6ed1:     	cmpb	$0xb, 0x75(%r8)
1454d6ed6:     	jne	0x1454d6ec0 <.text+0x54d5ec0>
1454d6ed8:     	movzbl	0x129(%rsi), %r15d
1454d6ee0:     	testl	%r15d, %r15d
1454d6ee3:     	sete	%r13b
1454d6ee7:     	cmpq	$0x0, 0x40(%rsi)
1454d6eec:     	sete	%al
1454d6eef:     	cmpl	$0x0, 0x11c(%rsi)
1454d6ef6:     	sete	%cl
1454d6ef9:     	andb	%al, %cl
1454d6efb:     	movzbl	0x804(%rsi), %eax
1454d6f02:     	xorb	$0x1, %al
1454d6f04:     	andb	%cl, %al
1454d6f06:     	xorps	%xmm0, %xmm0
1454d6f09:     	ucomiss	%xmm11, %xmm0
1454d6f0d:     	jb	0x1454d6f2d <.text+0x54d5f2d>
1454d6f0f:     	movl	%r15d, %ecx
1454d6f12:     	leaq	0x1521917(%rip), %rdx   # 0x1469f8830
1454d6f19:     	movslq	(%rdx,%rcx,4), %rcx
1454d6f1d:     	addq	%rdx, %rcx
1454d6f20:     	movl	%eax, %edx
1454d6f22:     	jmpq	*%rcx
1454d6f24:     	movzbl	0x30(%rsi), %edx
1454d6f28:     	xorb	$0x1, %dl
1454d6f2b:     	jmp	0x1454d6f2f <.text+0x54d5f2f>
1454d6f2d:     	xorl	%edx, %edx
1454d6f2f:     	movl	%edx, 0x150(%rbp)
1454d6f35:     	andb	%al, %r13b
1454d6f38:     	leaq	0x7b0(%rsi), %r14
1454d6f3f:     	movq	0x7b8(%rsi), %rdx
1454d6f46:     	movq	0x7c0(%rsi), %rcx
1454d6f4d:     	movabsq	$0xffffffffffffff8, %r8 # imm = 0xFFFFFFFFFFFFFF8
1454d6f57:     	andq	%rcx, %r8
1454d6f5a:     	xorl	%r9d, %r9d
1454d6f5d:     	nopl	(%rax)
1454d6f60:     	cmpq	%r9, %r8
1454d6f63:     	je	0x1454d6fa2 <.text+0x54d5fa2>
1454d6f65:     	cmpq	%rdi, (%rdx,%r9,8)
1454d6f69:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d6f6b:     	cmpq	%rdi, 0x8(%rdx,%r9,8)
1454d6f70:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d6f72:     	cmpq	%rdi, 0x10(%rdx,%r9,8)
1454d6f77:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d6f79:     	cmpq	%rdi, 0x18(%rdx,%r9,8)
1454d6f7e:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d6f80:     	cmpq	%rdi, 0x20(%rdx,%r9,8)
1454d6f85:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d6f87:     	cmpq	%rdi, 0x28(%rdx,%r9,8)
1454d6f8c:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d6f8e:     	cmpq	%rdi, 0x30(%rdx,%r9,8)
1454d6f93:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d6f95:     	cmpq	%rdi, 0x38(%rdx,%r9,8)
1454d6f9a:     	leaq	0x8(%r9), %r9
1454d6f9e:     	jne	0x1454d6f60 <.text+0x54d5f60>
1454d6fa0:     	jmp	0x1454d6fb8 <.text+0x54d5fb8>
1454d6fa2:     	shll	$0x3, %ecx
1454d6fa5:     	andl	$0x38, %ecx
1454d6fa8:     	je	0x1454d7116 <.text+0x54d6116>
1454d6fae:     	cmpq	%rdi, (%rdx,%r8,8)
1454d6fb2:     	jne	0x1454d710d <.text+0x54d610d>
1454d6fb8:     	cmpb	$0x2, %r15b
1454d6fbc:     	setb	%cl
1454d6fbf:     	andb	%al, %cl
1454d6fc1:     	cmpb	$0x1, %cl
1454d6fc4:     	jne	0x1454d70f3 <.text+0x54d60f3>
1454d6fca:     	movq	$-0x160, %rax           # imm = 0xFEA0
1454d6fd1:     	addq	0x4e0(%rsi), %rax
1454d6fd8:     	imulq	$0x160, 0x4e8(%rsi), %rcx # imm = 0x160
1454d6fe3:     	nopw	%cs:(%rax,%rax)
1454d6ff0:     	movb	$0x1, %r12b
1454d6ff3:     	testq	%rcx, %rcx
1454d6ff6:     	je	0x1454d7119 <.text+0x54d6119>
1454d6ffc:     	leaq	0x160(%rax), %rdx
1454d7003:     	addq	$-0x160, %rcx           # imm = 0xFEA0
1454d700a:     	cmpq	%rdi, 0x1e8(%rax)
1454d7011:     	movq	%rdx, %rax
1454d7014:     	jne	0x1454d6ff0 <.text+0x54d5ff0>
1454d7016:     	movss	0x934(%rsi), %xmm2
1454d701e:     	movss	0xf4(%rdx), %xmm7
1454d7026:     	leaq	0xf4(%rbp), %rcx
1454d702d:     	callq	0x145450a50 <.text+0x544fa50>
1454d7032:     	movl	0xfc(%rbp), %eax
1454d7038:     	movl	%eax, 0x160(%rbp)
1454d703e:     	movq	0xf4(%rbp), %rax
1454d7045:     	movq	%rax, 0x158(%rbp)
1454d704c:     	movq	%rdi, 0xf0(%rbp)
1454d7053:     	leaq	0xf0(%rbp), %rdx
1454d705a:     	movq	%r14, %rcx
1454d705d:     	callq	0x145532730 <.text+0x5531730>
1454d7062:     	movss	0x934(%rsi), %xmm0
1454d706a:     	movq	0x4e0(%rsi), %rax
1454d7071:     	imulq	$0x160, 0x4e8(%rsi), %rdx # imm = 0x160
1454d707c:     	xorl	%ecx, %ecx
1454d707e:     	movq	%rax, %r8
1454d7081:     	cmpq	%rcx, %rdx
1454d7084:     	je	0x1454d77c7 <.text+0x54d67c7>
1454d708a:     	addq	$0x160, %rcx            # imm = 0x160
1454d7091:     	cmpq	%rdi, 0x88(%r8)
1454d7098:     	leaq	0x160(%r8), %r8
1454d709f:     	jne	0x1454d7081 <.text+0x54d6081>
1454d70a1:     	movl	$0x0, -0x20(%rax,%rcx)
1454d70a9:     	movss	%xmm0, -0x34(%rax,%rcx)
1454d70af:     	movl	-0xf8(%rax,%rcx), %r8d
1454d70b7:     	movq	-0xd0(%rax,%rcx), %rdx
1454d70bf:     	testq	%rdx, %rdx
1454d70c2:     	je	0x1454d77a6 <.text+0x54d67a6>
1454d70c8:     	testl	%r8d, %r8d
1454d70cb:     	jne	0x1454d77c7 <.text+0x54d67c7>
1454d70d1:     	movss	-0x58(%rax,%rcx), %xmm3
1454d70d7:     	movl	0x24(%rdx), %r8d
1454d70db:     	movb	$0x1, 0x176(%rbp)
1454d70e2:     	movq	%rsi, %rcx
1454d70e5:     	movq	%rdi, %rdx
1454d70e8:     	callq	0x1454e75f0 <.text+0x54e65f0>
1454d70ed:     	nop
1454d70ee:     	jmp	0x1454d77ab <.text+0x54d67ab>
1454d70f3:     	movb	$0x1, %r12b
1454d70f6:     	xorps	%xmm0, %xmm0
1454d70f9:     	ucomiss	%xmm11, %xmm0
1454d70fd:     	jb	0x1454d7119 <.text+0x54d6119>
1454d70ff:     	leaq	-0x10(%rbp), %rdx
1454d7103:     	movq	%r14, %rcx
1454d7106:     	callq	0x145532730 <.text+0x5531730>
1454d710b:     	jmp	0x1454d7119 <.text+0x54d6119>
1454d710d:     	cmpl	$0x8, %ecx
1454d7110:     	jne	0x1454d7259 <.text+0x54d6259>
1454d7116:     	xorl	%r12d, %r12d
1454d7119:     	testb	%r13b, %r13b
1454d711c:     	je	0x1454d7b29 <.text+0x54d6b29>
1454d7122:     	movq	0x2b8(%rsi), %rcx
1454d7129:     	testq	%rcx, %rcx
1454d712c:     	je	0x1454d732b <.text+0x54d632b>
1454d7132:     	movq	0x2b0(%rsi), %rax
1454d7139:     	imulq	$0x58, %rcx, %rcx
1454d713d:     	xorl	%edx, %edx
1454d713f:     	movabsq	$0x676172646f6f6c62, %r8 # imm = 0x676172646F6F6C62
1454d7149:     	jmp	0x1454d715d <.text+0x54d615d>
1454d714b:     	nopl	(%rax,%rax)
1454d7150:     	addq	$0x58, %rdx
1454d7154:     	cmpq	%rdx, %rcx
1454d7157:     	je	0x1454d71f8 <.text+0x54d61f8>
1454d715d:     	movq	(%rax,%rdx), %r9
1454d7161:     	cmpq	$0x9, 0x8(%r9)
1454d7166:     	jne	0x1454d7150 <.text+0x54d6150>
1454d7168:     	movq	(%r9), %r9
1454d716b:     	movq	(%r9), %r10
1454d716e:     	xorq	%r8, %r10
1454d7171:     	movzbl	0x8(%r9), %r9d
1454d7176:     	xorq	$0x65, %r9
1454d717a:     	orq	%r10, %r9
1454d717d:     	jne	0x1454d7150 <.text+0x54d6150>
1454d717f:     	movss	0x7e0(%rsi), %xmm0
1454d7187:     	movss	0x934(%rsi), %xmm1
1454d718f:     	movaps	%xmm0, %xmm2
1454d7192:     	minss	0x43c15a(%rip), %xmm2   # 0x1459132f4
1454d719a:     	xorps	%xmm3, %xmm3
1454d719d:     	maxss	%xmm3, %xmm2
1454d71a1:     	subss	%xmm2, %xmm0
1454d71a5:     	movss	%xmm0, 0x7e0(%rsi)
1454d71ad:     	addss	0x7dc(%rsi), %xmm2
1454d71b5:     	minss	0x43037f(%rip), %xmm2   # 0x14590753c
1454d71bd:     	movss	%xmm2, 0x7dc(%rsi)
1454d71c5:     	movss	%xmm1, 0x7e4(%rsi)
1454d71cd:     	movb	$0x1, 0x176(%rbp)
1454d71d4:     	movq	%rsi, %rcx
1454d71d7:     	callq	0x1454e8ba0 <.text+0x54e7ba0>
1454d71dc:     	nop
1454d71dd:     	movq	0x2b8(%rsi), %rcx
1454d71e4:     	testq	%rcx, %rcx
1454d71e7:     	je	0x1454d732b <.text+0x54d632b>
1454d71ed:     	movq	0x2b0(%rsi), %rax
1454d71f4:     	imulq	$0x58, %rcx, %rcx
1454d71f8:     	addq	%rax, %rcx
1454d71fb:     	movabsq	$0x7461665f6c616573, %rdx # imm = 0x7461665F6C616573
1454d7205:     	jmp	0x1454d721d <.text+0x54d621d>
1454d7207:     	nopw	(%rax,%rax)
1454d7210:     	addq	$0x58, %rax
1454d7214:     	cmpq	%rcx, %rax
1454d7217:     	je	0x1454d732b <.text+0x54d632b>
1454d721d:     	movq	(%rax), %r8
1454d7220:     	cmpq	$0x9, 0x8(%r8)
1454d7225:     	jne	0x1454d7210 <.text+0x54d6210>
1454d7227:     	movq	(%r8), %r8
1454d722a:     	movq	(%r8), %r9
1454d722d:     	xorq	%rdx, %r9
1454d7230:     	movzbl	0x8(%r8), %r8d
1454d7235:     	xorq	$0x65, %r8
1454d7239:     	orq	%r9, %r8
1454d723c:     	jne	0x1454d7210 <.text+0x54d6210>
1454d723e:     	cmpb	$0x0, 0x298(%rbp)
1454d7245:     	jne	0x1454d72b7 <.text+0x54d62b7>
1454d7247:     	movss	0x430240(%rip), %xmm8   # 0x145907490
1454d7250:     	jmp	0x1454d72c0 <.text+0x54d62c0>
1454d7252:     	movb	$0x1, %dl
1454d7254:     	jmp	0x1454d6f2f <.text+0x54d5f2f>
1454d7259:     	cmpq	%rdi, 0x8(%rdx,%r8,8)
1454d725e:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d7264:     	cmpl	$0x10, %ecx
1454d7267:     	je	0x1454d7116 <.text+0x54d6116>
1454d726d:     	cmpq	%rdi, 0x10(%rdx,%r8,8)
1454d7272:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d7278:     	cmpl	$0x18, %ecx
1454d727b:     	je	0x1454d7116 <.text+0x54d6116>
1454d7281:     	cmpq	%rdi, 0x18(%rdx,%r8,8)
1454d7286:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d728c:     	cmpl	$0x20, %ecx
1454d728f:     	je	0x1454d7116 <.text+0x54d6116>
1454d7295:     	cmpq	%rdi, 0x20(%rdx,%r8,8)
1454d729a:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d72a0:     	movl	%r15d, %r9d
1454d72a3:     	cmpl	$0x28, %ecx
1454d72a6:     	jne	0x1454d855f <.text+0x54d755f>
1454d72ac:     	xorl	%r12d, %r12d
1454d72af:     	movl	%r9d, %r15d
1454d72b2:     	jmp	0x1454d7119 <.text+0x54d6119>
1454d72b7:     	movss	0x43c034(%rip), %xmm8   # 0x1459132f4
1454d72c0:     	movss	0x7ec(%rsi), %xmm7
1454d72c8:     	movaps	%xmm7, %xmm0
1454d72cb:     	callq	0x145773265 <.text+0x5772265>
1454d72d0:     	minss	%xmm8, %xmm0
1454d72d5:     	xorps	%xmm1, %xmm1
1454d72d8:     	maxss	%xmm1, %xmm0
1454d72dc:     	subss	%xmm0, %xmm7
1454d72e0:     	cvttss2si	%xmm0, %rax
1454d72e5:     	xorl	%ecx, %ecx
1454d72e7:     	ucomiss	%xmm1, %xmm0
1454d72ea:     	cmovael	%eax, %ecx
1454d72ed:     	movss	%xmm7, 0x7ec(%rsi)
1454d72f5:     	ucomiss	0x430230(%rip), %xmm0   # 0x14590752c
1454d72fc:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454d7301:     	cmovbel	%ecx, %eax
1454d7304:     	addl	0x7e8(%rsi), %eax
1454d730a:     	cmpl	$0x5, %eax
1454d730d:     	movl	$0x5, %ecx
1454d7312:     	cmovbl	%eax, %ecx
1454d7315:     	movl	%ecx, 0x7e8(%rsi)
1454d731b:     	movb	$0x1, 0x176(%rbp)
1454d7322:     	movq	%rsi, %rcx
1454d7325:     	callq	0x1454e91d0 <.text+0x54e81d0>
1454d732a:     	nop
1454d732b:     	movq	0x788(%rsi), %rax
1454d7332:     	movq	0x790(%rsi), %rcx
1454d7339:     	shlq	$0x4, %rcx
1454d733d:     	xorl	%r8d, %r8d
1454d7340:     	cmpq	%r8, %rcx
1454d7343:     	je	0x1454d7ac4 <.text+0x54d6ac4>
1454d7349:     	leaq	0x10(%r8), %rdx
1454d734d:     	cmpq	%rdi, (%rax,%r8)
1454d7351:     	movq	%rdx, %r8
1454d7354:     	jne	0x1454d7340 <.text+0x54d6340>
1454d7356:     	movss	-0x8(%rax,%rdx), %xmm0
1454d735c:     	movss	0x43012c(%rip), %xmm7   # 0x145907490
1454d7364:     	ucomiss	%xmm0, %xmm7
1454d7367:     	ja	0x1454d7ac4 <.text+0x54d6ac4>
1454d736d:     	addss	0x430197(%rip), %xmm0   # 0x14590750c
1454d7375:     	movss	%xmm0, -0x8(%rax,%rdx)
1454d737b:     	movq	0x2b8(%rsi), %rcx
1454d7382:     	testq	%rcx, %rcx
1454d7385:     	je	0x1454d7ac4 <.text+0x54d6ac4>
1454d738b:     	movq	0x2b0(%rsi), %rax
1454d7392:     	imulq	$0x58, %rcx, %rdx
1454d7396:     	xorl	%ecx, %ecx
1454d7398:     	movabsq	$0x665f656972656166, %r8 # imm = 0x665F656972656166
1454d73a2:     	movabsq	$0x657269665f656972, %r9 # imm = 0x657269665F656972
1454d73ac:     	jmp	0x1454d73bb <.text+0x54d63bb>
1454d73ae:     	addq	$0x58, %rcx
1454d73b2:     	cmpq	%rcx, %rdx
1454d73b5:     	je	0x1454d7ac4 <.text+0x54d6ac4>
1454d73bb:     	movq	(%rax,%rcx), %r14
1454d73bf:     	cmpq	$0xb, 0x8(%r14)
1454d73c4:     	jne	0x1454d73ae <.text+0x54d63ae>
1454d73c6:     	movq	(%r14), %r10
1454d73c9:     	movq	(%r10), %r11
1454d73cc:     	xorq	%r8, %r11
1454d73cf:     	movq	0x3(%r10), %r10
1454d73d3:     	xorq	%r9, %r10
1454d73d6:     	orq	%r11, %r10
1454d73d9:     	jne	0x1454d73ae <.text+0x54d63ae>
1454d73db:     	movl	0x8(%rax,%rcx), %edx
1454d73df:     	movss	0x14(%rax,%rcx), %xmm0
1454d73e5:     	movl	0x18(%rax,%rcx), %r8d
1454d73ea:     	movl	0x34(%rax,%rcx), %r9d
1454d73ef:     	movl	%r9d, 0x124(%rbp)
1454d73f6:     	movups	0x24(%rax,%rcx), %xmm1
1454d73fb:     	movups	%xmm1, 0x114(%rbp)
1454d7402:     	movups	0x38(%rax,%rcx), %xmm1
1454d7407:     	movups	0x44(%rax,%rcx), %xmm2
1454d740c:     	movups	%xmm1, 0x128(%rbp)
1454d7413:     	movups	%xmm2, 0x134(%rbp)
1454d741a:     	movq	%r14, 0xf0(%rbp)
1454d7421:     	movl	%edx, 0xf8(%rbp)
1454d7427:     	movss	0x10(%rax,%rcx), %xmm8
1454d742e:     	movsd	0xc(%rax,%rcx), %xmm1
1454d7434:     	movsd	%xmm1, 0xfc(%rbp)
1454d743c:     	movss	%xmm0, 0x104(%rbp)
1454d7444:     	movl	%r8d, 0x108(%rbp)
1454d744b:     	movsd	0x1c(%rax,%rcx), %xmm0
1454d7451:     	movsd	%xmm0, 0x10c(%rbp)
1454d7459:     	movss	0x934(%rsi), %xmm2
1454d7461:     	movq	$-0x160, %rax           # imm = 0xFEA0
1454d7468:     	addq	0x4e0(%rsi), %rax
1454d746f:     	imulq	$0x160, 0x4e8(%rsi), %rcx # imm = 0x160
1454d747a:     	testq	%rcx, %rcx
1454d747d:     	je	0x1454d7ac4 <.text+0x54d6ac4>
1454d7483:     	leaq	0x160(%rax), %rdx
1454d748a:     	addq	$-0x160, %rcx           # imm = 0xFEA0
1454d7491:     	cmpq	%rdi, 0x1e8(%rax)
1454d7498:     	movq	%rdx, %rax
1454d749b:     	jne	0x1454d747a <.text+0x54d647a>
1454d749d:     	leaq	0xbc(%rbp), %rcx
1454d74a4:     	callq	0x145450a50 <.text+0x544fa50>
1454d74a9:     	movl	0xc4(%rbp), %eax
1454d74af:     	movl	%eax, 0x8(%rbp)
1454d74b2:     	movq	0xbc(%rbp), %rax
1454d74b9:     	movq	%rax, (%rbp)
1454d74bd:     	leaq	0x470(%rsi), %rdx
1454d74c4:     	movss	0x470(%rsi), %xmm12
1454d74cd:     	movzbl	0x75(%r14), %eax
1454d74d2:     	addb	$-0x2, %al
1454d74d4:     	cmpb	$0x6, %al
1454d74d6:     	ja	0x1454d74e7 <.text+0x54d64e7>
1454d74d8:     	movzbl	%al, %eax
1454d74db:     	leaq	0x1521052(%rip), %rcx   # 0x1469f8534
1454d74e2:     	movss	(%rcx,%rax,4), %xmm7
1454d74e7:     	movss	0x128(%rbp), %xmm15
1454d74f0:     	movss	0x474(%rsi), %xmm13
1454d74f9:     	movss	0x44(%r14), %xmm14
1454d74ff:     	mulss	0x13c(%rbp), %xmm12
1454d7508:     	leaq	0xf0(%rbp), %rcx
1454d750f:     	callq	0x14550c400 <.text+0x550b400>
1454d7514:     	movq	%rdi, 0x88(%rbp)
1454d751b:     	movb	$0x1, 0x176(%rbp)
1454d7522:     	leaq	0x88(%rbp), %rax
1454d7529:     	movq	%rax, 0x20(%rsp)
1454d752e:     	movq	$0x1, 0x28(%rsp)
1454d7537:     	leaq	0xb8(%rbp), %rcx
1454d753e:     	movq	%rbp, %r8
1454d7541:     	movq	%rsi, %rdx
1454d7544:     	movaps	%xmm0, %xmm3
1454d7547:     	callq	0x145500300 <.text+0x54ff300>
1454d754c:     	nop
1454d754d:     	movl	%r15d, 0xb0(%rbp)
1454d7554:     	movaps	%xmm8, %xmm0
1454d7558:     	mulss	%xmm15, %xmm0
1454d755d:     	sqrtss	%xmm0, %xmm0
1454d7561:     	mulss	0x43bd8f(%rip), %xmm0   # 0x1459132f8
1454d7569:     	minss	0x47098b(%rip), %xmm0   # 0x145947efc
1454d7571:     	mulss	%xmm6, %xmm0
1454d7575:     	xorps	%xmm1, %xmm1
1454d7578:     	cmpltss	%xmm14, %xmm1
1454d757e:     	andps	%xmm12, %xmm1
1454d7582:     	mulss	0x441165(%rip), %xmm14  # 0x1459186f0
1454d758b:     	mulss	%xmm8, %xmm14
1454d7590:     	mulss	%xmm15, %xmm14
1454d7595:     	mulss	%xmm7, %xmm14
1454d759a:     	addss	%xmm1, %xmm14
1454d759f:     	mulss	%xmm14, %xmm13
1454d75a4:     	movaps	%xmm0, %xmm1
1454d75a7:     	minss	%xmm13, %xmm1
1454d75ac:     	movaps	%xmm1, %xmm7
1454d75af:     	cmpunordss	%xmm1, %xmm7
1454d75b4:     	movaps	%xmm7, %xmm2
1454d75b7:     	andnps	%xmm1, %xmm2
1454d75ba:     	andps	%xmm0, %xmm7
1454d75bd:     	orps	%xmm2, %xmm7
1454d75c0:     	movq	0xb8(%rbp), %rax
1454d75c7:     	movq	%rax, 0x78(%rbp)
1454d75cb:     	movq	0xc0(%rbp), %rdx
1454d75d2:     	movq	0xc8(%rbp), %rax
1454d75d9:     	xorl	%ecx, %ecx
1454d75db:     	cmpq	$0x1, %rax
1454d75df:     	setne	%cl
1454d75e2:     	testq	%rax, %rax
1454d75e5:     	leaq	0x8(,%rcx,8), %rcx
1454d75ed:     	cmoveq	%rax, %rcx
1454d75f1:     	addq	%rdx, %rcx
1454d75f4:     	movq	%rcx, 0xe8(%rbp)
1454d75fb:     	movq	%rdx, 0x40(%rbp)
1454d75ff:     	cmpq	0xe8(%rbp), %rdx
1454d7606:     	movq	%rdx, 0x168(%rbp)
1454d760d:     	je	0x1454d773a <.text+0x54d673a>
1454d7613:     	movq	(%rdx), %r13
1454d7616:     	movq	%r13, 0x158(%rbp)
1454d761d:     	movq	%r13, 0x90(%rbp)
1454d7624:     	movl	$0x0, 0x88(%rbp)
1454d762e:     	movl	$0x0, 0x48(%rbp)
1454d7635:     	leaq	0x48(%rbp), %rax
1454d7639:     	movq	%rax, 0x30(%rsp)
1454d763e:     	leaq	0x88(%rbp), %rax
1454d7645:     	movq	%rax, 0x28(%rsp)
1454d764a:     	movq	$0x1, 0x20(%rsp)
1454d7653:     	leaq	0xb8(%rbp), %rcx
1454d765a:     	movq	%rdi, %rdx
1454d765d:     	movl	$0x22d9, %r8d           # imm = 0x22D9
1454d7663:     	leaq	0x158(%rbp), %r9
1454d766a:     	callq	0x145466ab0 <.text+0x5465ab0>
1454d766f:     	nop
1454d7670:     	movq	0x560(%rsi), %r15
1454d7677:     	cmpq	0x550(%rsi), %r15
1454d767e:     	jne	0x1454d768d <.text+0x54d668d>
1454d7680:     	leaq	0x550(%rsi), %rcx
1454d7687:     	callq	0x145774710 <.text+0x5773710>
1454d768c:     	nop
1454d768d:     	movq	0x558(%rsi), %rax
1454d7694:     	movq	%r15, %rcx
1454d7697:     	shlq	$0x5, %rcx
1454d769b:     	movups	0xb8(%rbp), %xmm0
1454d76a2:     	movups	0xc8(%rbp), %xmm1
1454d76a9:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d76ae:     	movups	%xmm0, (%rax,%rcx)
1454d76b2:     	incq	%r15
1454d76b5:     	movq	%r15, 0x560(%rsi)
1454d76bc:     	movl	0x40(%r14), %r9d
1454d76c0:     	movzbl	0x74(%r14), %eax
1454d76c5:     	movb	0x129(%rsi), %r15b
1454d76cc:     	movb	$0x3, 0x129(%rsi)
1454d76d3:     	movups	0x20(%rsi), %xmm8
1454d76d8:     	movups	0x40(%rsi), %xmm12
1454d76dd:     	movq	$0x0, 0x20(%rsi)
1454d76e5:     	movq	$0x0, 0x40(%rsi)
1454d76ed:     	movb	%al, 0x20(%rsp)
1454d76f1:     	movb	$0x0, 0x30(%rsp)
1454d76f6:     	movb	$0x0, 0x28(%rsp)
1454d76fb:     	movq	%rsi, %rcx
1454d76fe:     	movq	%r13, %rdx
1454d7701:     	movaps	%xmm7, %xmm2
1454d7704:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454d7709:     	nop
1454d770a:     	movq	0x168(%rbp), %rdx
1454d7711:     	addq	$0x8, %rdx
1454d7715:     	movb	%r15b, 0x129(%rsi)
1454d771c:     	movups	%xmm8, 0x20(%rsi)
1454d7721:     	movups	%xmm12, 0x40(%rsi)
1454d7726:     	cmpq	0xe8(%rbp), %rdx
1454d772d:     	movq	%rdx, 0x168(%rbp)
1454d7734:     	jne	0x1454d7613 <.text+0x54d6613>
1454d773a:     	movq	0x718(%rsi), %r15
1454d7741:     	testq	%r15, %r15
1454d7744:     	je	0x1454d7aa1 <.text+0x54d6aa1>
1454d774a:     	movq	(%r14), %rax
1454d774d:     	movq	%rax, 0x70(%rbp)
1454d7751:     	movq	0x8(%r14), %r8
1454d7755:     	movq	0x710(%rsi), %r13
1454d775c:     	addq	$0x10, %r13
1454d7760:     	movss	0x43bbe3(%rip), %xmm8   # 0x14591334c
1454d7769:     	movq	%r8, -0x8(%rbp)
1454d776d:     	jmp	0x1454d7780 <.text+0x54d6780>
1454d776f:     	movq	-0x8(%rbp), %r8
1454d7773:     	addq	$0x40, %r13
1454d7777:     	decq	%r15
1454d777a:     	je	0x1454d7a94 <.text+0x54d6a94>
1454d7780:     	cmpb	$0xd, -0x10(%r13)
1454d7785:     	jne	0x1454d7773 <.text+0x54d6773>
1454d7787:     	cmpq	%r8, (%r13)
1454d778b:     	jne	0x1454d7773 <.text+0x54d6773>
1454d778d:     	movq	-0x8(%r13), %rcx
1454d7791:     	movq	0x70(%rbp), %rdx
1454d7795:     	callq	0x1457731e7 <.text+0x57721e7>
1454d779a:     	testl	%eax, %eax
1454d779c:     	jne	0x1454d776f <.text+0x54d676f>
1454d779e:     	addss	-0xc(%r13), %xmm8
1454d77a4:     	jmp	0x1454d776f <.text+0x54d676f>
1454d77a6:     	testl	%r8d, %r8d
1454d77a9:     	jne	0x1454d77c7 <.text+0x54d67c7>
1454d77ab:     	movb	$0x1, 0x176(%rbp)
1454d77b2:     	movq	%rsi, %rcx
1454d77b5:     	movq	%rdi, %rdx
1454d77b8:     	movl	$0x76, %r8d
1454d77be:     	xorl	%r9d, %r9d
1454d77c1:     	callq	0x1454e3550 <.text+0x54e2550>
1454d77c6:     	nop
1454d77c7:     	movq	0x2b8(%rsi), %rax
1454d77ce:     	testq	%rax, %rax
1454d77d1:     	je	0x1454d7119 <.text+0x54d6119>
1454d77d7:     	movq	0x2b0(%rsi), %rcx
1454d77de:     	imulq	$0x58, %rax, %r8
1454d77e2:     	xorl	%edx, %edx
1454d77e4:     	movabsq	$0x70726f6d796c6f70, %r9 # imm = 0x70726F6D796C6F70
1454d77ee:     	jmp	0x1454d77fd <.text+0x54d67fd>
1454d77f0:     	addq	$0x58, %rdx
1454d77f4:     	cmpq	%rdx, %r8
1454d77f7:     	je	0x1454d7119 <.text+0x54d6119>
1454d77fd:     	movq	(%rcx,%rdx), %rax
1454d7801:     	cmpq	$0x9, 0x8(%rax)
1454d7806:     	jne	0x1454d77f0 <.text+0x54d67f0>
1454d7808:     	movq	(%rax), %r10
1454d780b:     	movq	(%r10), %r11
1454d780e:     	xorq	%r9, %r11
1454d7811:     	movzbl	0x8(%r10), %r10d
1454d7816:     	xorq	$0x68, %r10
1454d781a:     	orq	%r11, %r10
1454d781d:     	jne	0x1454d77f0 <.text+0x54d67f0>
1454d781f:     	movl	0x8(%rcx,%rdx), %r8d
1454d7824:     	movss	0x14(%rcx,%rdx), %xmm0
1454d782a:     	movl	0x18(%rcx,%rdx), %r9d
1454d782f:     	movl	0x34(%rcx,%rdx), %r10d
1454d7834:     	movl	%r10d, 0x124(%rbp)
1454d783b:     	movups	0x24(%rcx,%rdx), %xmm1
1454d7840:     	movups	%xmm1, 0x114(%rbp)
1454d7847:     	movups	0x38(%rcx,%rdx), %xmm1
1454d784c:     	movups	0x44(%rcx,%rdx), %xmm2
1454d7851:     	movups	%xmm2, 0x134(%rbp)
1454d7858:     	movups	%xmm1, 0x128(%rbp)
1454d785f:     	movq	%rax, 0xf0(%rbp)
1454d7866:     	movl	%r8d, 0xf8(%rbp)
1454d786d:     	movss	0x10(%rcx,%rdx), %xmm8
1454d7874:     	movsd	0xc(%rcx,%rdx), %xmm1
1454d787a:     	movsd	%xmm1, 0xfc(%rbp)
1454d7882:     	movss	%xmm0, 0x104(%rbp)
1454d788a:     	movl	%r9d, 0x108(%rbp)
1454d7891:     	movsd	0x1c(%rcx,%rdx), %xmm0
1454d7897:     	movsd	%xmm0, 0x10c(%rbp)
1454d789f:     	leaq	0x470(%rsi), %rdx
1454d78a6:     	movss	0x470(%rsi), %xmm12
1454d78af:     	movzbl	0x75(%rax), %ecx
1454d78b3:     	addb	$-0x2, %cl
1454d78b6:     	cmpb	$0x6, %cl
1454d78b9:     	ja	0x1454d78cd <.text+0x54d68cd>
1454d78bb:     	movzbl	%cl, %ecx
1454d78be:     	leaq	0x1520c6f(%rip), %r8    # 0x1469f8534
1454d78c5:     	movss	(%r8,%rcx,4), %xmm0
1454d78cb:     	jmp	0x1454d78d5 <.text+0x54d68d5>
1454d78cd:     	movss	0x42fbbb(%rip), %xmm0   # 0x145907490
1454d78d5:     	movss	%xmm0, 0xe8(%rbp)
1454d78dd:     	movss	0x474(%rsi), %xmm14
1454d78e6:     	movss	0x44(%rax), %xmm13
1454d78ec:     	movss	0x128(%rbp), %xmm15
1454d78f5:     	mulss	0x13c(%rbp), %xmm12
1454d78fe:     	leaq	0xf0(%rbp), %rcx
1454d7905:     	callq	0x14550c400 <.text+0x550b400>
1454d790a:     	movb	$0x1, 0x176(%rbp)
1454d7911:     	movq	$0x0, 0x28(%rsp)
1454d791a:     	movq	$0x8, 0x20(%rsp)
1454d7923:     	leaq	0x88(%rbp), %rcx
1454d792a:     	leaq	0x158(%rbp), %r8
1454d7931:     	movq	%rsi, %rdx
1454d7934:     	movaps	%xmm0, %xmm3
1454d7937:     	callq	0x145500300 <.text+0x54ff300>
1454d793c:     	nop
1454d793d:     	movl	%r15d, 0xb0(%rbp)
1454d7944:     	movq	0x90(%rbp), %r9
1454d794b:     	movq	0x98(%rbp), %r14
1454d7952:     	movl	$0x2, 0x48(%rbp)
1454d7959:     	movl	$0x0, (%rbp)
1454d7960:     	movq	%rbp, %rax
1454d7963:     	movq	%rax, 0x30(%rsp)
1454d7968:     	leaq	0x48(%rbp), %rax
1454d796c:     	movq	%rax, 0x28(%rsp)
1454d7971:     	movq	%r14, 0x20(%rsp)
1454d7976:     	leaq	0xb8(%rbp), %rcx
1454d797d:     	movq	%rdi, %rdx
1454d7980:     	movl	$0x5a9, %r8d            # imm = 0x5A9
1454d7986:     	movq	%r9, 0x168(%rbp)
1454d798d:     	callq	0x145466ab0 <.text+0x5465ab0>
1454d7992:     	nop
1454d7993:     	movq	0x560(%rsi), %r15
1454d799a:     	cmpq	0x550(%rsi), %r15
1454d79a1:     	jne	0x1454d79b0 <.text+0x54d69b0>
1454d79a3:     	leaq	0x550(%rsi), %rcx
1454d79aa:     	callq	0x145774710 <.text+0x5773710>
1454d79af:     	nop
1454d79b0:     	mulss	0x42fb80(%rip), %xmm7   # 0x145907538
1454d79b8:     	xorps	%xmm0, %xmm0
1454d79bb:     	cmpltss	%xmm13, %xmm0
1454d79c1:     	andps	%xmm12, %xmm0
1454d79c5:     	mulss	0x440d22(%rip), %xmm13  # 0x1459186f0
1454d79ce:     	mulss	%xmm13, %xmm8
1454d79d3:     	mulss	%xmm8, %xmm15
1454d79d8:     	mulss	0xe8(%rbp), %xmm15
1454d79e1:     	addss	%xmm0, %xmm15
1454d79e6:     	mulss	%xmm15, %xmm14
1454d79eb:     	movaps	%xmm7, %xmm0
1454d79ee:     	minss	%xmm14, %xmm0
1454d79f3:     	movaps	%xmm0, %xmm1
1454d79f6:     	cmpunordss	%xmm0, %xmm1
1454d79fb:     	movaps	%xmm1, %xmm2
1454d79fe:     	andnps	%xmm0, %xmm2
1454d7a01:     	andps	%xmm7, %xmm1
1454d7a04:     	orps	%xmm2, %xmm1
1454d7a07:     	movq	0x558(%rsi), %rax
1454d7a0e:     	movq	%r15, %rcx
1454d7a11:     	shlq	$0x5, %rcx
1454d7a15:     	movups	0xb8(%rbp), %xmm0
1454d7a1c:     	movups	0xc8(%rbp), %xmm2
1454d7a23:     	movups	%xmm2, 0x10(%rax,%rcx)
1454d7a28:     	movups	%xmm0, (%rax,%rcx)
1454d7a2c:     	incq	%r15
1454d7a2f:     	movq	%r15, 0x560(%rsi)
1454d7a36:     	movss	%xmm1, 0x30(%rsp)
1454d7a3c:     	movq	%r14, 0x28(%rsp)
1454d7a41:     	movq	0x168(%rbp), %rax
1454d7a48:     	movq	%rax, 0x20(%rsp)
1454d7a4d:     	leaq	0xf0(%rbp), %rdx
1454d7a54:     	movq	%rsi, %rcx
1454d7a57:     	movq	%rdi, %r8
1454d7a5a:     	movl	$0x5a9, %r9d            # imm = 0x5A9
1454d7a60:     	callq	0x1454e6580 <.text+0x54e5580>
1454d7a65:     	nop
1454d7a66:     	movq	0x88(%rbp), %rdx
1454d7a6d:     	testq	%rdx, %rdx
1454d7a70:     	je	0x1454d7a88 <.text+0x54d6a88>
1454d7a72:     	shlq	$0x3, %rdx
1454d7a76:     	movl	$0x8, %r8d
1454d7a7c:     	movq	0x168(%rbp), %rcx
1454d7a83:     	callq	0x1400021d0 <.text+0x11d0>
1454d7a88:     	movl	0xb0(%rbp), %r15d
1454d7a8f:     	jmp	0x1454d7119 <.text+0x54d6119>
1454d7a94:     	xorps	%xmm0, %xmm0
1454d7a97:     	ucomiss	%xmm0, %xmm8
1454d7a9b:     	ja	0x1454d83db <.text+0x54d73db>
1454d7aa1:     	movq	0x78(%rbp), %rdx
1454d7aa5:     	testq	%rdx, %rdx
1454d7aa8:     	movl	0xb0(%rbp), %r15d
1454d7aaf:     	je	0x1454d7ac4 <.text+0x54d6ac4>
1454d7ab1:     	shlq	$0x3, %rdx
1454d7ab5:     	movl	$0x8, %r8d
1454d7abb:     	movq	0x40(%rbp), %rcx
1454d7abf:     	callq	0x1400021d0 <.text+0x11d0>
1454d7ac4:     	xorps	%xmm0, %xmm0
1454d7ac7:     	ucomiss	%xmm11, %xmm0
1454d7acb:     	jb	0x1454d7b0c <.text+0x54d6b0c>
1454d7acd:     	cmpb	$0x0, 0x150(%rbp)
1454d7ad4:     	je	0x1454d7b7a <.text+0x54d6b7a>
1454d7ada:     	movb	$0x1, 0x176(%rbp)
1454d7ae1:     	movq	%rsi, %rcx
1454d7ae4:     	callq	0x1454e8a60 <.text+0x54e7a60>
1454d7ae9:     	nop
1454d7aea:     	movb	$0x1, 0x176(%rbp)
1454d7af1:     	leaq	0x60(%rbp), %r8
1454d7af5:     	movq	%rsi, %rcx
1454d7af8:     	movq	%rdi, %rdx
1454d7afb:     	movl	$0x1, %r9d
1454d7b01:     	callq	0x1454e73e0 <.text+0x54e63e0>
1454d7b06:     	nop
1454d7b07:     	jmp	0x1454d7ba6 <.text+0x54d6ba6>
1454d7b0c:     	testl	%ebx, %ebx
1454d7b0e:     	sete	%al
1454d7b11:     	orb	%r12b, %al
1454d7b14:     	jne	0x1454d7b29 <.text+0x54d6b29>
1454d7b16:     	movb	$0x1, 0x176(%rbp)
1454d7b1d:     	movq	%rsi, %rcx
1454d7b20:     	movq	%rdi, %rdx
1454d7b23:     	callq	0x1454e6f70 <.text+0x54e5f70>
1454d7b28:     	nop
1454d7b29:     	cmpb	$0x0, 0x150(%rbp)
1454d7b30:     	je	0x1454d7b6d <.text+0x54d6b6d>
1454d7b32:     	movb	$0x1, 0x176(%rbp)
1454d7b39:     	movq	%rsi, %rcx
1454d7b3c:     	callq	0x1454e8a60 <.text+0x54e7a60>
1454d7b41:     	nop
1454d7b42:     	movb	$0x1, 0x176(%rbp)
1454d7b49:     	leaq	0x60(%rbp), %r8
1454d7b4d:     	movq	%rsi, %rcx
1454d7b50:     	movq	%rdi, %rdx
1454d7b53:     	movl	$0x1, %r9d
1454d7b59:     	callq	0x1454e73e0 <.text+0x54e63e0>
1454d7b5e:     	nop
1454d7b5f:     	xorps	%xmm0, %xmm0
1454d7b62:     	ucomiss	%xmm11, %xmm0
1454d7b66:     	jae	0x1454d7ba6 <.text+0x54d6ba6>
1454d7b68:     	jmp	0x1454d8108 <.text+0x54d7108>
1454d7b6d:     	xorps	%xmm0, %xmm0
1454d7b70:     	ucomiss	%xmm11, %xmm0
1454d7b74:     	jb	0x1454d8108 <.text+0x54d7108>
1454d7b7a:     	cmpb	$0x3, %r15b
1454d7b7e:     	jne	0x1454d7ba6 <.text+0x54d6ba6>
1454d7b80:     	cmpl	$0x1, 0x7fc(%rsi)
1454d7b87:     	jne	0x1454d7ba6 <.text+0x54d6ba6>
1454d7b89:     	movb	$0x1, 0x176(%rbp)
1454d7b90:     	leaq	0x60(%rbp), %r8
1454d7b94:     	movq	%rsi, %rcx
1454d7b97:     	movq	%rdi, %rdx
1454d7b9a:     	movl	$0x2, %r9d
1454d7ba0:     	callq	0x1454e73e0 <.text+0x54e63e0>
1454d7ba5:     	nop
1454d7ba6:     	testq	%rdi, %rdi
1454d7ba9:     	je	0x1454d7faf <.text+0x54d6faf>
1454d7baf:     	cmpq	0x7c8(%rsi), %rdi
1454d7bb6:     	jne	0x1454d7faf <.text+0x54d6faf>
1454d7bbc:     	movl	0x68(%rbp), %eax
1454d7bbf:     	movl	%eax, 0x160(%rbp)
1454d7bc5:     	movq	0x60(%rbp), %rax
1454d7bc9:     	movq	%rax, 0x158(%rbp)
1454d7bd0:     	movq	$0x0, 0x7c8(%rsi)
1454d7bdb:     	movss	0x934(%rsi), %xmm7
1454d7be3:     	movss	0x42f8a5(%rip), %xmm0   # 0x145907490
1454d7beb:     	addss	%xmm7, %xmm0
1454d7bef:     	movss	%xmm0, 0x800(%rsi)
1454d7bf7:     	movq	0x2b8(%rsi), %rcx
1454d7bfe:     	testq	%rcx, %rcx
1454d7c01:     	je	0x1454d7faf <.text+0x54d6faf>
1454d7c07:     	movq	0x2b0(%rsi), %rax
1454d7c0e:     	imulq	$0x58, %rcx, %r8
1454d7c12:     	xorl	%ecx, %ecx
1454d7c14:     	movabsq	$0x5f737265746e7568, %r9 # imm = 0x5F737265746E7568
1454d7c1e:     	jmp	0x1454d7c2d <.text+0x54d6c2d>
1454d7c20:     	addq	$0x58, %rcx
1454d7c24:     	cmpq	%rcx, %r8
1454d7c27:     	je	0x1454d7faf <.text+0x54d6faf>
1454d7c2d:     	movq	(%rax,%rcx), %r14
1454d7c31:     	cmpq	$0xc, 0x8(%r14)
1454d7c36:     	jne	0x1454d7c20 <.text+0x54d6c20>
1454d7c38:     	movq	(%r14), %rdx
1454d7c3b:     	movq	(%rdx), %r10
1454d7c3e:     	xorq	%r9, %r10
1454d7c41:     	movl	0x8(%rdx), %r11d
1454d7c45:     	xorq	$0x6b72616d, %r11       # imm = 0x6B72616D
1454d7c4c:     	orq	%r10, %r11
1454d7c4f:     	jne	0x1454d7c20 <.text+0x54d6c20>
1454d7c51:     	movl	0x8(%rax,%rcx), %r8d
1454d7c56:     	movss	0x14(%rax,%rcx), %xmm0
1454d7c5c:     	movl	0x18(%rax,%rcx), %r9d
1454d7c61:     	movl	0x34(%rax,%rcx), %r10d
1454d7c66:     	movl	%r10d, 0x124(%rbp)
1454d7c6d:     	movups	0x24(%rax,%rcx), %xmm1
1454d7c72:     	movups	%xmm1, 0x114(%rbp)
1454d7c79:     	movups	0x38(%rax,%rcx), %xmm1
1454d7c7e:     	movups	0x44(%rax,%rcx), %xmm2
1454d7c83:     	movups	%xmm1, 0x128(%rbp)
1454d7c8a:     	movups	%xmm2, 0x134(%rbp)
1454d7c91:     	movq	%r14, 0xf0(%rbp)
1454d7c98:     	movl	%r8d, 0xf8(%rbp)
1454d7c9f:     	movss	0x10(%rax,%rcx), %xmm8
1454d7ca6:     	movsd	0xc(%rax,%rcx), %xmm1
1454d7cac:     	movsd	%xmm1, 0xfc(%rbp)
1454d7cb4:     	movss	%xmm0, 0x104(%rbp)
1454d7cbc:     	movl	%r9d, 0x108(%rbp)
1454d7cc3:     	movsd	0x1c(%rax,%rcx), %xmm0
1454d7cc9:     	movsd	%xmm0, 0x10c(%rbp)
1454d7cd1:     	leaq	0x738(%rsi), %rcx
1454d7cd8:     	movl	$0xc, %r8d
1454d7cde:     	callq	0x145451250 <.text+0x5450250>
1454d7ce3:     	ucomiss	%xmm0, %xmm7
1454d7ce6:     	jb	0x1454d7faf <.text+0x54d6faf>
1454d7cec:     	movb	$0x1, 0x176(%rbp)
1454d7cf3:     	leaq	0xf0(%rbp), %rdx
1454d7cfa:     	movq	%rsi, %rcx
1454d7cfd:     	callq	0x1454e6b90 <.text+0x54e5b90>
1454d7d02:     	nop
1454d7d03:     	leaq	0x470(%rsi), %rdx
1454d7d0a:     	movss	0x470(%rsi), %xmm11
1454d7d13:     	movss	0x474(%rsi), %xmm7
1454d7d1b:     	leaq	0xf0(%rbp), %rcx
1454d7d22:     	callq	0x14550c400 <.text+0x550b400>
1454d7d27:     	movq	%rdi, 0xb8(%rbp)
1454d7d2e:     	movb	$0x1, 0x176(%rbp)
1454d7d35:     	leaq	0xb8(%rbp), %rax
1454d7d3c:     	movq	%rax, 0x20(%rsp)
1454d7d41:     	movq	$0x1, 0x28(%rsp)
1454d7d4a:     	leaq	0x88(%rbp), %rcx
1454d7d51:     	leaq	0x158(%rbp), %r8
1454d7d58:     	movq	%rsi, %rdx
1454d7d5b:     	movaps	%xmm0, %xmm3
1454d7d5e:     	callq	0x145500300 <.text+0x54ff300>
1454d7d63:     	nop
1454d7d64:     	movq	0x90(%rbp), %r9
1454d7d6b:     	movq	0x98(%rbp), %r15
1454d7d72:     	movl	$0x2, 0x48(%rbp)
1454d7d79:     	movl	$0x0, (%rbp)
1454d7d80:     	movb	$0x1, 0x174(%rbp)
1454d7d87:     	movq	%rbp, %rax
1454d7d8a:     	movq	%rax, 0x30(%rsp)
1454d7d8f:     	leaq	0x48(%rbp), %rax
1454d7d93:     	movq	%rax, 0x28(%rsp)
1454d7d98:     	movq	%r15, 0x20(%rsp)
1454d7d9d:     	leaq	0xb8(%rbp), %rcx
1454d7da4:     	movq	%rdi, %rdx
1454d7da7:     	movl	$0x5a9, %r8d            # imm = 0x5A9
1454d7dad:     	movq	%r9, 0x150(%rbp)
1454d7db4:     	callq	0x145466ab0 <.text+0x5465ab0>
1454d7db9:     	nop
1454d7dba:     	movq	0x560(%rsi), %r12
1454d7dc1:     	cmpq	0x550(%rsi), %r12
1454d7dc8:     	jne	0x1454d7dd7 <.text+0x54d6dd7>
1454d7dca:     	leaq	0x550(%rsi), %rcx
1454d7dd1:     	callq	0x145774710 <.text+0x5773710>
1454d7dd6:     	nop
1454d7dd7:     	movq	0x558(%rsi), %rax
1454d7dde:     	movq	%r12, %rcx
1454d7de1:     	shlq	$0x5, %rcx
1454d7de5:     	movups	0xb8(%rbp), %xmm0
1454d7dec:     	movups	0xc8(%rbp), %xmm1
1454d7df3:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d7df8:     	movups	%xmm0, (%rax,%rcx)
1454d7dfc:     	incq	%r12
1454d7dff:     	movq	%r12, 0x560(%rsi)
1454d7e06:     	movzbl	0x75(%r14), %eax
1454d7e0b:     	addb	$-0x2, %al
1454d7e0d:     	cmpb	$0x6, %al
1454d7e0f:     	ja	0x1454d7e22 <.text+0x54d6e22>
1454d7e11:     	movzbl	%al, %eax
1454d7e14:     	leaq	0x1520719(%rip), %rcx   # 0x1469f8534
1454d7e1b:     	movss	(%rcx,%rax,4), %xmm0
1454d7e20:     	jmp	0x1454d7e2a <.text+0x54d6e2a>
1454d7e22:     	movss	0x42f666(%rip), %xmm0   # 0x145907490
1454d7e2a:     	movq	0x88(%rbp), %rax
1454d7e31:     	movq	%rax, 0x168(%rbp)
1454d7e38:     	testq	%r15, %r15
1454d7e3b:     	je	0x1454d7f8d <.text+0x54d6f8d>
1454d7e41:     	movss	0x44(%r14), %xmm1
1454d7e47:     	mulss	0x13c(%rbp), %xmm11
1454d7e50:     	xorps	%xmm2, %xmm2
1454d7e53:     	cmpltss	%xmm1, %xmm2
1454d7e58:     	andps	%xmm11, %xmm2
1454d7e5c:     	mulss	0x44088c(%rip), %xmm1   # 0x1459186f0
1454d7e64:     	mulss	%xmm1, %xmm8
1454d7e69:     	mulss	0x128(%rbp), %xmm8
1454d7e72:     	mulss	%xmm0, %xmm8
1454d7e77:     	addss	%xmm2, %xmm8
1454d7e7c:     	mulss	%xmm8, %xmm7
1454d7e81:     	shlq	$0x3, %r15
1454d7e85:     	movzbl	0x129(%rsi), %r12d
1454d7e8d:     	movups	0x20(%rsi), %xmm8
1454d7e92:     	movups	0x40(%rsi), %xmm11
1454d7e97:     	xorl	%r13d, %r13d
1454d7e9a:     	movss	0x5304fd(%rip), %xmm12  # 0x145a083a0
1454d7ea3:     	movq	0x150(%rbp), %rax
1454d7eaa:     	movq	(%rax,%r13), %rdx
1454d7eae:     	movq	0x8a0(%rsi), %rax
1454d7eb5:     	movq	0x8b8(%rsi), %rcx
1454d7ebc:     	leaq	(%rcx,%rax), %r8
1454d7ec0:     	rolq	$0x17, %r8
1454d7ec4:     	addq	%rax, %r8
1454d7ec7:     	movq	0x8a8(%rsi), %r9
1454d7ece:     	movq	%r9, %r10
1454d7ed1:     	shlq	$0x11, %r10
1454d7ed5:     	movq	0x8b0(%rsi), %r11
1454d7edc:     	xorq	%rax, %r11
1454d7edf:     	xorq	%r9, %rcx
1454d7ee2:     	xorq	%r11, %r9
1454d7ee5:     	movq	%r9, 0x8a8(%rsi)
1454d7eec:     	xorq	%rcx, %rax
1454d7eef:     	movq	%rax, 0x8a0(%rsi)
1454d7ef6:     	xorq	%r10, %r11
1454d7ef9:     	movq	%r11, 0x8b0(%rsi)
1454d7f00:     	rolq	$0x2d, %rcx
1454d7f04:     	movq	%rcx, 0x8b8(%rsi)
1454d7f0b:     	shrq	$0x28, %r8
1454d7f0f:     	xorps	%xmm0, %xmm0
1454d7f12:     	cvtsi2ss	%r8d, %xmm0
1454d7f17:     	mulss	%xmm12, %xmm0
1454d7f1c:     	movss	0x47c(%rsi), %xmm1
1454d7f24:     	movss	0x480(%rsi), %xmm2
1454d7f2c:     	mulss	%xmm7, %xmm2
1454d7f30:     	movl	0x40(%r14), %r9d
1454d7f34:     	movzbl	0x74(%r14), %eax
1454d7f39:     	movb	$0x3, 0x129(%rsi)
1454d7f40:     	movq	$0x0, 0x20(%rsi)
1454d7f48:     	movq	$0x0, 0x40(%rsi)
1454d7f50:     	ucomiss	%xmm0, %xmm1
1454d7f53:     	ja	0x1454d7f58 <.text+0x54d6f58>
1454d7f55:     	movaps	%xmm7, %xmm2
1454d7f58:     	seta	0x28(%rsp)
1454d7f5d:     	movb	%al, 0x20(%rsp)
1454d7f61:     	movb	$0x0, 0x30(%rsp)
1454d7f66:     	movq	%rsi, %rcx
1454d7f69:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454d7f6e:     	nop
1454d7f6f:     	movb	%r12b, 0x129(%rsi)
1454d7f76:     	movups	%xmm8, 0x20(%rsi)
1454d7f7b:     	movups	%xmm11, 0x40(%rsi)
1454d7f80:     	addq	$0x8, %r13
1454d7f84:     	cmpq	%r13, %r15
1454d7f87:     	jne	0x1454d7ea3 <.text+0x54d6ea3>
1454d7f8d:     	movq	0x168(%rbp), %rdx
1454d7f94:     	testq	%rdx, %rdx
1454d7f97:     	je	0x1454d7faf <.text+0x54d6faf>
1454d7f99:     	shlq	$0x3, %rdx
1454d7f9d:     	movl	$0x8, %r8d
1454d7fa3:     	movq	0x150(%rbp), %rcx
1454d7faa:     	callq	0x1400021d0 <.text+0x11d0>
1454d7faf:     	movq	0x788(%rsi), %rax
1454d7fb6:     	movq	0x790(%rsi), %rcx
1454d7fbd:     	shlq	$0x4, %rcx
1454d7fc1:     	xorl	%edx, %edx
1454d7fc3:     	nopw	%cs:(%rax,%rax)
1454d7fd0:     	cmpq	%rdx, %rcx
1454d7fd3:     	je	0x1454d8108 <.text+0x54d7108>
1454d7fd9:     	cmpq	%rdi, (%rax,%rdx)
1454d7fdd:     	leaq	0x10(%rdx), %rdx
1454d7fe1:     	jne	0x1454d7fd0 <.text+0x54d6fd0>
1454d7fe3:     	leaq	0x780(%rsi), %rcx
1454d7fea:     	leaq	-0x10(%rbp), %rdx
1454d7fee:     	callq	0x145532640 <.text+0x5531640>
1454d7ff3:     	movq	0x2b8(%rsi), %rcx
1454d7ffa:     	testq	%rcx, %rcx
1454d7ffd:     	je	0x1454d8108 <.text+0x54d7108>
1454d8003:     	movq	0x2b0(%rsi), %rax
1454d800a:     	imulq	$0x58, %rcx, %rdx
1454d800e:     	xorl	%ecx, %ecx
1454d8010:     	movabsq	$0x665f656972656166, %r8 # imm = 0x665F656972656166
1454d801a:     	movabsq	$0x657269665f656972, %r9 # imm = 0x657269665F656972
1454d8024:     	jmp	0x1454d803d <.text+0x54d703d>
1454d8026:     	nopw	%cs:(%rax,%rax)
1454d8030:     	addq	$0x58, %rcx
1454d8034:     	cmpq	%rcx, %rdx
1454d8037:     	je	0x1454d8108 <.text+0x54d7108>
1454d803d:     	movq	(%rax,%rcx), %r10
1454d8041:     	cmpq	$0xb, 0x8(%r10)
1454d8046:     	jne	0x1454d8030 <.text+0x54d7030>
1454d8048:     	movq	(%r10), %r11
1454d804b:     	movq	(%r11), %r14
1454d804e:     	xorq	%r8, %r14
1454d8051:     	movq	0x3(%r11), %r11
1454d8055:     	xorq	%r9, %r11
1454d8058:     	orq	%r14, %r11
1454d805b:     	jne	0x1454d8030 <.text+0x54d7030>
1454d805d:     	movq	0x790(%rsi), %rdx
1454d8064:     	movl	0x54(%r10), %r8d
1454d8068:     	testl	%r8d, %r8d
1454d806b:     	je	0x1454d8093 <.text+0x54d7093>
1454d806d:     	movl	0x18(%rax,%rcx), %r9d
1454d8072:     	addl	0x40(%rax,%rcx), %r9d
1454d8077:     	addl	0x4a4(%rsi), %r9d
1454d807e:     	addl	%r8d, %r9d
1454d8081:     	cmpl	$0x3, %r9d
1454d8085:     	movl	$0x3, %eax
1454d808a:     	cmovbl	%r9d, %eax
1454d808e:     	testl	%r9d, %r9d
1454d8091:     	jne	0x1454d8098 <.text+0x54d7098>
1454d8093:     	movl	$0x1, %eax
1454d8098:     	movl	%eax, %eax
1454d809a:     	cmpq	%rax, %rdx
1454d809d:     	jae	0x1454d8108 <.text+0x54d7108>
1454d809f:     	movb	$0x1, 0x176(%rbp)
1454d80a6:     	leaq	0xf0(%rbp), %rcx
1454d80ad:     	leaq	0x60(%rbp), %r8
1454d80b1:     	movss	0x42f457(%rip), %xmm3   # 0x145907510
1454d80b9:     	movq	%rsi, %rdx
1454d80bc:     	callq	0x1454e7b00 <.text+0x54e6b00>
1454d80c1:     	nop
1454d80c2:     	cmpq	$0x0, 0x100(%rbp)
1454d80ca:     	je	0x1454d80e6 <.text+0x54d70e6>
1454d80cc:     	movq	0xf8(%rbp), %rax
1454d80d3:     	movq	%rax, 0x150(%rbp)
1454d80da:     	movq	(%rax), %rdx
1454d80dd:     	movq	%rsi, %rcx
1454d80e0:     	callq	0x1454e99c0 <.text+0x54e89c0>
1454d80e5:     	nop
1454d80e6:     	movq	0xf0(%rbp), %rdx
1454d80ed:     	testq	%rdx, %rdx
1454d80f0:     	je	0x1454d8108 <.text+0x54d7108>
1454d80f2:     	movq	0xf8(%rbp), %rcx
1454d80f9:     	shlq	$0x3, %rdx
1454d80fd:     	movl	$0x8, %r8d
1454d8103:     	callq	0x1400021d0 <.text+0x11d0>
1454d8108:     	movzbl	0x129(%rsi), %r14d
1454d8110:     	cmpb	$0x3, %r14b
1454d8114:     	je	0x1454d816a <.text+0x54d716a>
1454d8116:     	cmpq	$0x0, 0x718(%rsi)
1454d811e:     	je	0x1454d816a <.text+0x54d716a>
1454d8120:     	xorl	%eax, %eax
1454d8122:     	cmpb	$0x1, %r14b
1454d8126:     	sete	%cl
1454d8129:     	movl	0x128(%rsi), %edx
1454d812f:     	cmovel	%edx, %eax
1454d8132:     	jne	0x1454d818c <.text+0x54d718c>
1454d8134:     	testb	%dl, %dl
1454d8136:     	je	0x1454d8191 <.text+0x54d7191>
1454d8138:     	movq	0xf0(%rsi), %rdx
1454d813f:     	testq	%rdx, %rdx
1454d8142:     	je	0x1454d8165 <.text+0x54d7165>
1454d8144:     	movq	0xe8(%rsi), %r8
1454d814b:     	leaq	(,%rdx,4), %r10
1454d8153:     	xorl	%r9d, %r9d
1454d8156:     	cmpl	%ebx, (%r8,%r9,4)
1454d815a:     	je	0x1454d8196 <.text+0x54d7196>
1454d815c:     	incq	%r9
1454d815f:     	addq	$-0x4, %r10
1454d8163:     	jne	0x1454d8156 <.text+0x54d7156>
1454d8165:     	xorl	%r15d, %r15d
1454d8168:     	jmp	0x1454d81ac <.text+0x54d71ac>
1454d816a:     	movq	0xe0(%rbp), %rcx
1454d8171:     	leaq	-0x1(%rcx), %rax
1454d8175:     	cmpq	$-0x3, %rax
1454d8179:     	ja	0x1454d8355 <.text+0x54d7355>
1454d817f:     	shlq	$0x4, %rcx
1454d8183:     	leaq	(%rcx,%rcx,2), %rdx
1454d8187:     	jmp	0x1454d8343 <.text+0x54d7343>
1454d818c:     	testb	%r14b, %r14b
1454d818f:     	je	0x1454d8138 <.text+0x54d7138>
1454d8191:     	xorl	%r15d, %r15d
1454d8194:     	jmp	0x1454d81f4 <.text+0x54d71f4>
1454d8196:     	movl	-0x4(%r8,%rdx,4), %r10d
1454d819b:     	decq	%rdx
1454d819e:     	movl	%r10d, (%r8,%r9,4)
1454d81a2:     	movq	%rdx, 0xf0(%rsi)
1454d81a9:     	movb	$0x1, %r15b
1454d81ac:     	testb	%r14b, %r14b
1454d81af:     	setne	%dl
1454d81b2:     	movzbl	0x298(%rbp), %r8d
1454d81ba:     	xorb	$0x1, %r8b
1454d81be:     	orb	%dl, %r8b
1454d81c1:     	jne	0x1454d81f4 <.text+0x54d71f4>
1454d81c3:     	movq	0x108(%rsi), %rdx
1454d81ca:     	testq	%rdx, %rdx
1454d81cd:     	je	0x1454d81f4 <.text+0x54d71f4>
1454d81cf:     	movq	0x100(%rsi), %r8
1454d81d6:     	leaq	(,%rdx,4), %r10
1454d81de:     	xorl	%r9d, %r9d
1454d81e1:     	cmpl	%ebx, (%r8,%r9,4)
1454d81e5:     	je	0x1454d83c0 <.text+0x54d73c0>
1454d81eb:     	incq	%r9
1454d81ee:     	addq	$-0x4, %r10
1454d81f2:     	jne	0x1454d81e1 <.text+0x54d71e1>
1454d81f4:     	xorl	%r12d, %r12d
1454d81f7:     	movb	%cl, 0xa5(%rbp)
1454d81fd:     	movl	%ebx, 0x90(%rbp)
1454d8203:     	movzbl	0x290(%rbp), %ecx
1454d820a:     	movb	%cl, 0xa4(%rbp)
1454d8210:     	movzbl	0x298(%rbp), %ecx
1454d8217:     	movb	%cl, 0xa7(%rbp)
1454d821d:     	movq	%rdi, 0x88(%rbp)
1454d8224:     	movlps	%xmm9, 0x94(%rbp)
1454d822c:     	movss	%xmm10, 0x9c(%rbp)
1454d8235:     	movss	%xmm6, 0xa0(%rbp)
1454d823d:     	movb	%r14b, 0xa6(%rbp)
1454d8244:     	movb	%r15b, 0xa8(%rbp)
1454d824b:     	movb	%r12b, 0xa9(%rbp)
1454d8252:     	movb	%al, 0xaa(%rbp)
1454d8258:     	movb	$0x0, 0x172(%rbp)
1454d825f:     	leaq	0x88(%rbp), %rdx
1454d8266:     	movq	%rsi, %rcx
1454d8269:     	xorl	%r8d, %r8d
1454d826c:     	callq	0x1454cba10 <.text+0x54caa10>
1454d8271:     	nop
1454d8272:     	movq	0xe0(%rbp), %rcx
1454d8279:     	cmpq	$-0x1, %rcx
1454d827d:     	je	0x1454d8355 <.text+0x54d7355>
1454d8283:     	movq	%rcx, 0xb8(%rbp)
1454d828a:     	movq	0x80(%rbp), %rax
1454d8291:     	movq	%rax, 0xc0(%rbp)
1454d8298:     	movaps	-0x40(%rbp), %xmm0
1454d829c:     	movups	%xmm0, 0xc8(%rbp)
1454d82a3:     	movq	-0x30(%rbp), %rax
1454d82a7:     	movq	%rax, 0xd8(%rbp)
1454d82ae:     	movb	$0x2, 0x10d(%rbp)
1454d82b5:     	movl	%ebx, 0xf8(%rbp)
1454d82bb:     	movzbl	0x290(%rbp), %eax
1454d82c2:     	movb	%al, 0x10c(%rbp)
1454d82c8:     	movzbl	0x298(%rbp), %eax
1454d82cf:     	movb	%al, 0x10f(%rbp)
1454d82d5:     	movq	%rdi, 0xf0(%rbp)
1454d82dc:     	movlps	%xmm9, 0xfc(%rbp)
1454d82e4:     	movss	%xmm10, 0x104(%rbp)
1454d82ed:     	movss	%xmm6, 0x108(%rbp)
1454d82f5:     	movb	%r14b, 0x10e(%rbp)
1454d82fc:     	movb	%r15b, 0x110(%rbp)
1454d8303:     	movb	%r12b, 0x111(%rbp)
1454d830a:     	movb	$0x0, 0x112(%rbp)
1454d8311:     	leaq	0xf0(%rbp), %rdx
1454d8318:     	leaq	0xb8(%rbp), %r8
1454d831f:     	movq	%rcx, 0xe0(%rbp)
1454d8326:     	movq	%rsi, %rcx
1454d8329:     	callq	0x1454cba10 <.text+0x54caa10>
1454d832e:     	nop
1454d832f:     	movq	0xe0(%rbp), %rax
1454d8336:     	testq	%rax, %rax
1454d8339:     	je	0x1454d8355 <.text+0x54d7355>
1454d833b:     	shlq	$0x4, %rax
1454d833f:     	leaq	(%rax,%rax,2), %rdx
1454d8343:     	movl	$0x8, %r8d
1454d8349:     	movq	0x80(%rbp), %rcx
1454d8350:     	callq	0x1400021d0 <.text+0x11d0>
1454d8355:     	leaq	-0x28(%rbp), %rcx
1454d8359:     	callq	0x14550cd20 <.text+0x550bd20>
1454d835e:     	movaps	0x180(%rbp), %xmm6
1454d8365:     	movaps	0x190(%rbp), %xmm7
1454d836c:     	movaps	0x1a0(%rbp), %xmm8
1454d8374:     	movaps	0x1b0(%rbp), %xmm9
1454d837c:     	movaps	0x1c0(%rbp), %xmm10
1454d8384:     	movaps	0x1d0(%rbp), %xmm11
1454d838c:     	movaps	0x1e0(%rbp), %xmm12
1454d8394:     	movaps	0x1f0(%rbp), %xmm13
1454d839c:     	movaps	0x200(%rbp), %xmm14
1454d83a4:     	movaps	0x210(%rbp), %xmm15
1454d83ac:     	addq	$0x2a8, %rsp            # imm = 0x2A8
1454d83b3:     	popq	%rbx
1454d83b4:     	popq	%rdi
1454d83b5:     	popq	%rsi
1454d83b6:     	popq	%r12
1454d83b8:     	popq	%r13
1454d83ba:     	popq	%r14
1454d83bc:     	popq	%r15
1454d83be:     	popq	%rbp
1454d83bf:     	retq
1454d83c0:     	movl	-0x4(%r8,%rdx,4), %r10d
1454d83c5:     	decq	%rdx
1454d83c8:     	movl	%r10d, (%r8,%r9,4)
1454d83cc:     	movq	%rdx, 0x108(%rsi)
1454d83d3:     	movb	$0x1, %r12b
1454d83d6:     	jmp	0x1454d81f7 <.text+0x54d71f7>
1454d83db:     	mulss	%xmm7, %xmm8
1454d83e0:     	movq	0x40(%rbp), %r8
1454d83e4:     	movl	0xb0(%rbp), %r15d
1454d83eb:     	cmpq	0xe8(%rbp), %r8
1454d83f2:     	je	0x1454d854d <.text+0x54d754d>
1454d83f8:     	movq	(%r8), %r13
1454d83fb:     	addq	$0x8, %r8
1454d83ff:     	movq	0x4e0(%rsi), %rcx
1454d8406:     	imulq	$0x160, 0x4e8(%rsi), %rax # imm = 0x160
1454d8411:     	testq	%rax, %rax
1454d8414:     	je	0x1454d83eb <.text+0x54d73eb>
1454d8416:     	movq	%rcx, %rdx
1454d8419:     	addq	$0x160, %rcx            # imm = 0x160
1454d8420:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454d8426:     	cmpq	%r13, 0x88(%rdx)
1454d842d:     	jne	0x1454d8411 <.text+0x54d7411>
1454d842f:     	testb	$0x1, 0x68(%rdx)
1454d8433:     	jne	0x1454d8411 <.text+0x54d7411>
1454d8435:     	movq	%r8, 0x70(%rbp)
1454d8439:     	movq	%r13, 0x158(%rbp)
1454d8440:     	movq	%r13, 0x90(%rbp)
1454d8447:     	movl	$0x0, 0x88(%rbp)
1454d8451:     	movl	$0x0, 0x48(%rbp)
1454d8458:     	leaq	0x48(%rbp), %rax
1454d845c:     	movq	%rax, 0x30(%rsp)
1454d8461:     	leaq	0x88(%rbp), %rax
1454d8468:     	movq	%rax, 0x28(%rsp)
1454d846d:     	movq	$0x1, 0x20(%rsp)
1454d8476:     	leaq	0xb8(%rbp), %rcx
1454d847d:     	movq	%rdi, %rdx
1454d8480:     	movl	$0x22d9, %r8d           # imm = 0x22D9
1454d8486:     	leaq	0x158(%rbp), %r9
1454d848d:     	callq	0x145466ab0 <.text+0x5465ab0>
1454d8492:     	nop
1454d8493:     	movq	0x560(%rsi), %r15
1454d849a:     	cmpq	0x550(%rsi), %r15
1454d84a1:     	jne	0x1454d84b0 <.text+0x54d74b0>
1454d84a3:     	leaq	0x550(%rsi), %rcx
1454d84aa:     	callq	0x145774710 <.text+0x5773710>
1454d84af:     	nop
1454d84b0:     	movq	0x558(%rsi), %rax
1454d84b7:     	movq	%r15, %rcx
1454d84ba:     	shlq	$0x5, %rcx
1454d84be:     	movups	0xb8(%rbp), %xmm0
1454d84c5:     	movups	0xc8(%rbp), %xmm1
1454d84cc:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d84d1:     	movups	%xmm0, (%rax,%rcx)
1454d84d5:     	incq	%r15
1454d84d8:     	movq	%r15, 0x560(%rsi)
1454d84df:     	movl	0x40(%r14), %r9d
1454d84e3:     	movzbl	0x74(%r14), %eax
1454d84e8:     	movb	0x129(%rsi), %r15b
1454d84ef:     	movb	$0x3, 0x129(%rsi)
1454d84f6:     	movups	0x20(%rsi), %xmm7
1454d84fa:     	movups	0x40(%rsi), %xmm12
1454d84ff:     	movq	$0x0, 0x20(%rsi)
1454d8507:     	movq	$0x0, 0x40(%rsi)
1454d850f:     	movb	%al, 0x20(%rsp)
1454d8513:     	movb	$0x0, 0x30(%rsp)
1454d8518:     	movb	$0x0, 0x28(%rsp)
1454d851d:     	movq	%rsi, %rcx
1454d8520:     	movq	%r13, %rdx
1454d8523:     	movaps	%xmm8, %xmm2
1454d8527:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454d852c:     	nop
1454d852d:     	movb	%r15b, 0x129(%rsi)
1454d8534:     	movups	%xmm7, 0x20(%rsi)
1454d8538:     	movups	%xmm12, 0x40(%rsi)
1454d853d:     	movl	0xb0(%rbp), %r15d
1454d8544:     	movq	0x70(%rbp), %r8
1454d8548:     	jmp	0x1454d83eb <.text+0x54d73eb>
1454d854d:     	movq	0x78(%rbp), %rdx
1454d8551:     	testq	%rdx, %rdx
1454d8554:     	jne	0x1454d7ab1 <.text+0x54d6ab1>
1454d855a:     	jmp	0x1454d7ac4 <.text+0x54d6ac4>
1454d855f:     	cmpq	%rdi, 0x28(%rdx,%r8,8)
1454d8564:     	movl	%r9d, %r15d
1454d8567:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d856d:     	cmpl	$0x30, %ecx
1454d8570:     	je	0x1454d72ac <.text+0x54d62ac>
1454d8576:     	cmpq	%rdi, 0x30(%rdx,%r8,8)
1454d857b:     	setne	%dl
1454d857e:     	cmpq	$0x38, %rcx
1454d8582:     	sete	%cl
1454d8585:     	testb	%cl, %dl
1454d8587:     	movl	%r9d, %r15d
1454d858a:     	je	0x1454d6fb8 <.text+0x54d5fb8>
1454d8590:     	jmp	0x1454d7116 <.text+0x54d6116>

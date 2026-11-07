
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401d3f10:     	movq	0x248(%rbp), %rax
1401d3f17:     	movq	%rax, 0xb8(%rbp)
1401d3f1e:     	movq	0x250(%rbp), %rax
1401d3f25:     	movq	%rax, 0xc0(%rbp)
1401d3f2c:     	movq	0x258(%rbp), %rax
1401d3f33:     	movq	%rax, 0xc8(%rbp)
1401d3f3a:     	movq	0x270(%rbp), %rax
1401d3f41:     	movq	%rax, 0xe0(%rbp)
1401d3f48:     	movq	0x278(%rbp), %rax
1401d3f4f:     	movq	%rax, 0xe8(%rbp)
1401d3f56:     	movaps	0x280(%rbp), %xmm0
1401d3f5d:     	movaps	%xmm0, 0xf0(%rbp)
1401d3f64:     	xorps	%xmm6, %xmm6
1401d3f67:     	movaps	%xmm6, 0x130(%rbp)
1401d3f6e:     	movaps	%xmm6, 0x120(%rbp)
1401d3f75:     	movaps	%xmm6, 0x110(%rbp)
1401d3f7c:     	movaps	%xmm6, 0x100(%rbp)
1401d3f83:     	movups	%xmm6, 0x34c(%rbp)
1401d3f8a:     	movl	$0x0, 0x35c(%rbp)
1401d3f94:     	movl	$0x0, 0x41f(%rbp)
1401d3f9e:     	movl	$0x0, 0x422(%rbp)
1401d3fa8:     	leaq	0x2a8(%rbp), %rcx
1401d3faf:     	leaq	0xa0(%rbp), %rdx
1401d3fb6:     	movl	$0xa0, %r8d
1401d3fbc:     	callq	0x145bc977b <.text+0x5bc877b>
1401d3fc1:     	movl	$0x1, 0x348(%rbp)
1401d3fcb:     	movaps	%xmm9, %xmm15
1401d3fcf:     	movups	0x5be4961(%rip), %xmm9  # 0x145db8938
1401d3fd7:     	movups	%xmm9, 0x360(%rbp)
1401d3fdf:     	movups	0x5be4961(%rip), %xmm12 # 0x145db8948
1401d3fe7:     	movups	%xmm12, 0x370(%rbp)
1401d3fef:     	movups	%xmm13, 0x380(%rbp)
1401d3ff7:     	movups	%xmm13, 0x390(%rbp)
1401d3fff:     	movaps	%xmm13, %xmm9
1401d4003:     	movaps	%xmm14, %xmm13
1401d4007:     	movaps	%xmm11, %xmm14
1401d400b:     	movaps	%xmm7, %xmm11
1401d400f:     	movups	%xmm7, 0x3a0(%rbp)
1401d4016:     	movups	0x5be496b(%rip), %xmm7  # 0x145db8988
1401d401d:     	movups	%xmm7, 0x3b0(%rbp)
1401d4024:     	movups	0x5be496d(%rip), %xmm0  # 0x145db8998
1401d402b:     	movups	%xmm0, 0x3c0(%rbp)
1401d4032:     	movups	0x5be496f(%rip), %xmm0  # 0x145db89a8
1401d4039:     	movups	%xmm0, 0x3d0(%rbp)
1401d4040:     	movaps	0x5b9fdb9(%rip), %xmm0  # 0x145d73e00
1401d4047:     	movups	%xmm0, 0x3e0(%rbp)
1401d404e:     	movl	$0x1, 0x3f0(%rbp)
1401d4058:     	movq	$0x0, 0x3f4(%rbp)
1401d4063:     	movb	$0x1, 0x3fc(%rbp)
1401d406a:     	movsd	0x5b9928e(%rip), %xmm0  # 0x145d6d300
1401d4072:     	movsd	%xmm0, 0x400(%rbp)
1401d407a:     	movl	$0x3f800000, 0x408(%rbp) # imm = 0x3F800000
1401d4084:     	movw	$0x101, 0x40c(%rbp)     # imm = 0x101
1401d408d:     	movw	$0x0, 0x412(%rbp)
1401d4096:     	movl	$0x10000, 0x40e(%rbp)   # imm = 0x10000
1401d40a0:     	movl	$0x10000, 0x414(%rbp)   # imm = 0x10000
1401d40aa:     	movw	$0x0, 0x418(%rbp)
1401d40b3:     	movl	$0x0, 0x41a(%rbp)
1401d40bd:     	movb	$0x1, 0x41e(%rbp)
1401d40c4:     	movw	$0x0, 0x428(%rbp)
1401d40cd:     	movq	0x228(%rbp), %rsi
1401d40d4:     	movq	%rsi, 0x2a0(%rbp)
1401d40db:     	leaq	0x230(%rbp), %rcx
1401d40e2:     	leaq	0x2a0(%rbp), %r8
1401d40e9:     	leaq	-0x48(%rbp), %rbx
1401d40ed:     	movq	%rbx, %rdx
1401d40f0:     	callq	0x140193f40 <.text+0x192f40>
1401d40f5:     	movaps	%xmm14, 0xa0(%rbp)
1401d40fd:     	movq	$0x0, 0xb0(%rbp)
1401d4108:     	movups	%xmm10, 0xb8(%rbp)
1401d4110:     	movq	$0x0, 0xc8(%rbp)
1401d411b:     	movaps	%xmm13, 0xd0(%rbp)
1401d4123:     	movq	$0x0, 0xe0(%rbp)
1401d412e:     	movups	%xmm15, 0xe8(%rbp)
1401d4136:     	movq	$0x0, 0xf8(%rbp)
1401d4141:     	movaps	%xmm8, 0x30(%rbp)
1401d4146:     	movl	$0x3f800000, 0x40(%rbp) # imm = 0x3F800000
1401d414d:     	movups	%xmm8, 0x44(%rbp)
1401d4152:     	movl	$0x3f800000, 0x54(%rbp) # imm = 0x3F800000
1401d4159:     	movups	%xmm8, 0x58(%rbp)
1401d415e:     	movl	$0x3f800000, 0x68(%rbp) # imm = 0x3F800000
1401d4165:     	movups	%xmm8, 0x6c(%rbp)
1401d416a:     	movl	$0x3f800000, 0x7c(%rbp) # imm = 0x3F800000
1401d4171:     	movq	0xf0(%rbp), %rax
1401d4178:     	movq	%rax, 0x2f8(%rbp)
1401d417f:     	movq	0xf8(%rbp), %rax
1401d4186:     	movq	%rax, 0x300(%rbp)
1401d418d:     	movq	0xe0(%rbp), %rax
1401d4194:     	movq	%rax, 0x2e8(%rbp)
1401d419b:     	movq	0xe8(%rbp), %rax
1401d41a2:     	movq	%rax, 0x2f0(%rbp)
1401d41a9:     	movaps	0xa0(%rbp), %xmm0
1401d41b0:     	movaps	0xb0(%rbp), %xmm1
1401d41b7:     	movaps	0xc0(%rbp), %xmm2
1401d41be:     	movaps	0xd0(%rbp), %xmm3
1401d41c5:     	movups	%xmm3, 0x2d8(%rbp)
1401d41cc:     	movups	%xmm2, 0x2c8(%rbp)
1401d41d3:     	movups	%xmm1, 0x2b8(%rbp)
1401d41da:     	movups	%xmm0, 0x2a8(%rbp)
1401d41e1:     	movups	%xmm6, 0x328(%rbp)
1401d41e8:     	movups	%xmm6, 0x338(%rbp)
1401d41ef:     	movups	%xmm6, 0x348(%rbp)
1401d41f6:     	movq	$0x0, 0x358(%rbp)
1401d4201:     	movl	$0x0, 0x41f(%rbp)
1401d420b:     	movl	$0x0, 0x422(%rbp)
1401d4215:     	movaps	0x70(%rbp), %xmm0
1401d4219:     	movups	%xmm0, 0x272(%rbp)
1401d4220:     	movaps	0x30(%rbp), %xmm0
1401d4224:     	movaps	0x40(%rbp), %xmm1
1401d4228:     	movaps	0x50(%rbp), %xmm2
1401d422c:     	movaps	0x60(%rbp), %xmm3
1401d4230:     	movups	%xmm3, 0x262(%rbp)
1401d4237:     	movups	%xmm2, 0x252(%rbp)
1401d423e:     	movups	%xmm1, 0x242(%rbp)
1401d4245:     	movups	%xmm0, 0x232(%rbp)
1401d424c:     	movaps	0x5b9fbcd(%rip), %xmm0  # 0x145d73e20
1401d4253:     	movups	%xmm0, 0x308(%rbp)
1401d425a:     	movaps	0x5be3e6f(%rip), %xmm0  # 0x145db80d0
1401d4261:     	movups	%xmm0, 0x318(%rbp)
1401d4268:     	movups	%xmm12, 0x370(%rbp)
1401d4270:     	movups	0x5be46c0(%rip), %xmm8  # 0x145db8938
1401d4278:     	movups	%xmm8, 0x360(%rbp)
1401d4280:     	movups	%xmm9, 0x380(%rbp)
1401d4288:     	movups	%xmm9, 0x390(%rbp)
1401d4290:     	movaps	0x5b98ff9(%rip), %xmm0  # 0x145d6d290
1401d4297:     	movups	%xmm0, 0x3a0(%rbp)
1401d429e:     	movups	%xmm0, 0x3b0(%rbp)
1401d42a5:     	movaps	0x5b991e4(%rip), %xmm0  # 0x145d6d490
1401d42ac:     	movups	%xmm0, 0x3c0(%rbp)
1401d42b3:     	movups	%xmm0, 0x3d0(%rbp)
1401d42ba:     	movaps	0x5bc9aaf(%rip), %xmm0  # 0x145d9dd70
1401d42c1:     	movups	%xmm0, 0x3e0(%rbp)
1401d42c8:     	movl	$0x1, 0x3f0(%rbp)
1401d42d2:     	movq	$0x0, 0x3f4(%rbp)
1401d42dd:     	movb	$0x1, 0x3fc(%rbp)
1401d42e4:     	movq	$0x0, 0x400(%rbp)
1401d42ef:     	movl	$0x3f800000, 0x408(%rbp) # imm = 0x3F800000
1401d42f9:     	movw	$0x0, 0x40c(%rbp)
1401d4302:     	movw	$0x0, 0x412(%rbp)
1401d430b:     	movl	$0x10000, 0x40e(%rbp)   # imm = 0x10000
1401d4315:     	movw	$0x0, 0x418(%rbp)
1401d431e:     	movl	$0x10000, 0x414(%rbp)   # imm = 0x10000
1401d4328:     	movl	$0x3000100, 0x41a(%rbp) # imm = 0x3000100
1401d4332:     	movb	$0x1, 0x41e(%rbp)
1401d4339:     	movzwl	0x280(%rbp), %eax
1401d4340:     	movw	%ax, 0x476(%rbp)
1401d4347:     	movups	0x270(%rbp), %xmm0
1401d434e:     	movups	%xmm0, 0x466(%rbp)
1401d4355:     	movups	0x230(%rbp), %xmm0
1401d435c:     	movups	0x240(%rbp), %xmm1
1401d4363:     	movups	0x250(%rbp), %xmm2
1401d436a:     	movups	0x260(%rbp), %xmm3
1401d4371:     	movups	%xmm3, 0x456(%rbp)
1401d4378:     	movups	%xmm2, 0x446(%rbp)
1401d437f:     	movups	%xmm1, 0x436(%rbp)
1401d4386:     	movups	%xmm0, 0x426(%rbp)
1401d438d:     	movl	$0x0, 0x478(%rbp)
1401d4397:     	movaps	0x5be3d42(%rip), %xmm0  # 0x145db80e0
1401d439e:     	movups	%xmm0, 0x47c(%rbp)
1401d43a5:     	movl	$0x1, 0x48c(%rbp)
1401d43af:     	movb	$0x0, 0x490(%rbp)
1401d43b6:     	movq	%rsi, 0x2a0(%rbp)
1401d43bd:     	leaq	-0x20(%rbp), %rcx
1401d43c1:     	leaq	0x2a0(%rbp), %r8
1401d43c8:     	movq	%rbx, %rdx
1401d43cb:     	callq	0x140194750 <.text+0x193750>
1401d43d0:     	movq	-0x20(%rbp), %rsi
1401d43d4:     	movq	0x8(%rbp), %rax
1401d43d8:     	movq	%rsi, 0x30(%rbp)
1401d43dc:     	movups	-0x18(%rbp), %xmm0
1401d43e0:     	movups	%xmm0, 0x38(%rbp)
1401d43e4:     	movups	-0x8(%rbp), %xmm0
1401d43e8:     	movups	%xmm0, 0x48(%rbp)
1401d43ec:     	movq	%rax, 0x58(%rbp)
1401d43f0:     	movaps	%xmm14, 0x2a0(%rbp)
1401d43f8:     	movq	$0x0, 0x2b0(%rbp)
1401d4403:     	movups	%xmm10, 0x2b8(%rbp)
1401d440b:     	movq	$0x0, 0x2c8(%rbp)
1401d4416:     	movaps	%xmm13, 0x2d0(%rbp)
1401d441e:     	movq	$0x0, 0x2e0(%rbp)
1401d4429:     	movups	%xmm15, 0x2e8(%rbp)
1401d4431:     	movq	$0x0, 0x2f8(%rbp)
1401d443c:     	movaps	%xmm14, 0xa0(%rbp)
1401d4444:     	movq	0x2b0(%rbp), %rax
1401d444b:     	movq	%rax, 0xb0(%rbp)
1401d4452:     	movq	0x2b8(%rbp), %rax
1401d4459:     	movq	%rax, 0xb8(%rbp)
1401d4460:     	movq	0x2c0(%rbp), %rax
1401d4467:     	movq	%rax, 0xc0(%rbp)
1401d446e:     	movq	0x2c8(%rbp), %rax
1401d4475:     	movq	%rax, 0xc8(%rbp)
1401d447c:     	movaps	%xmm13, 0xd0(%rbp)
1401d4484:     	movq	0x2e0(%rbp), %rax
1401d448b:     	movq	%rax, 0xe0(%rbp)
1401d4492:     	movq	0x2e8(%rbp), %rax
1401d4499:     	movq	%rax, 0xe8(%rbp)
1401d44a0:     	movaps	0x2f0(%rbp), %xmm0
1401d44a7:     	movaps	%xmm0, 0xf0(%rbp)
1401d44ae:     	movaps	%xmm6, 0x140(%rbp)
1401d44b5:     	movaps	%xmm6, 0x130(%rbp)
1401d44bc:     	movaps	%xmm6, 0x120(%rbp)
1401d44c3:     	movaps	%xmm6, 0x110(%rbp)
1401d44ca:     	movaps	%xmm6, 0x100(%rbp)
1401d44d1:     	movq	$0x0, 0x150(%rbp)
1401d44dc:     	movups	%xmm12, 0x168(%rbp)
1401d44e4:     	movups	%xmm8, 0x158(%rbp)
1401d44ec:     	movups	0x5be4b3d(%rip), %xmm0  # 0x145db9030
1401d44f3:     	movups	%xmm0, 0x8c(%rbp)
1401d44fa:     	movl	$0x0, 0x9c(%rbp)
1401d4504:     	leaq	0x2a8(%rbp), %rcx
1401d450b:     	leaq	0xa0(%rbp), %rdx
1401d4512:     	movl	$0xd8, %r8d
1401d4518:     	callq	0x145bc977b <.text+0x5bc877b>
1401d451d:     	movaps	0x5b98eec(%rip), %xmm6  # 0x145d6d410
1401d4524:     	movups	%xmm6, 0x380(%rbp)
1401d452b:     	movaps	0x5b98ecd(%rip), %xmm8  # 0x145d6d400
1401d4533:     	movups	%xmm8, 0x390(%rbp)
1401d453b:     	movups	%xmm11, 0x3a0(%rbp)
1401d4543:     	movups	%xmm7, 0x3b0(%rbp)
1401d454a:     	movups	%xmm9, 0x3c0(%rbp)
1401d4552:     	movups	%xmm9, 0x3d0(%rbp)
1401d455a:     	movaps	0x5b98cfe(%rip), %xmm12 # 0x145d6d260
1401d4562:     	movups	%xmm12, 0x3e0(%rbp)
1401d456a:     	movl	$0x1, 0x3f0(%rbp)
1401d4574:     	movq	$0x0, 0x3f4(%rbp)
1401d457f:     	movb	$0x1, 0x3fc(%rbp)
1401d4586:     	movq	$0x0, 0x400(%rbp)
1401d4591:     	movl	$0x3f800000, 0x408(%rbp) # imm = 0x3F800000
1401d459b:     	movw	$0x0, 0x40c(%rbp)
1401d45a4:     	movw	$0x0, 0x412(%rbp)
1401d45ad:     	movl	$0x10000, 0x40e(%rbp)   # imm = 0x10000
1401d45b7:     	movw	$0x0, 0x418(%rbp)
1401d45c0:     	movl	$0x10000, 0x414(%rbp)   # imm = 0x10000
1401d45ca:     	movl	$0x0, 0x422(%rbp)
1401d45d4:     	movq	$0x0, 0x41a(%rbp)
1401d45df:     	movq	0x98(%rbp), %rax
1401d45e6:     	movq	%rax, 0x434(%rbp)
1401d45ed:     	movups	0x8a(%rbp), %xmm0
1401d45f4:     	movups	%xmm0, 0x426(%rbp)
1401d45fb:     	movw	$0x200, 0x43c(%rbp)     # imm = 0x200
1401d4604:     	movb	$0x0, 0x43e(%rbp)
1401d460b:     	movq	%rsi, 0x2a0(%rbp)
1401d4612:     	leaq	0x230(%rbp), %rcx
1401d4619:     	leaq	0x2a0(%rbp), %r8
1401d4620:     	movq	%r12, %rdx
1401d4623:     	callq	0x1401944a0 <.text+0x1934a0>
1401d4628:     	leaq	0x5be206c(%rip), %rcx   # 0x145db669b
1401d462f:     	movl	$0xb, %edx
1401d4634:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401d4639:     	movq	%rdx, %r14
1401d463c:     	testq	%rdx, %rdx
1401d463f:     	js	0x1401d4a09 <.text+0x1d3a09>
1401d4645:     	movaps	%xmm11, %xmm15
1401d4649:     	je	0x1401d46bb <.text+0x1d36bb>
1401d464b:     	movq	%r12, %rbx
1401d464e:     	movq	%rax, %r12
1401d4651:     	callq	0x140002200 <.text+0x1200>
1401d4656:     	movl	$0x1, %r13d
1401d465c:     	movl	$0x1, %edx
1401d4661:     	movq	%r14, %rcx
1401d4664:     	callq	0x1400021c0 <.text+0x11c0>
1401d4669:     	testq	%rax, %rax
1401d466c:     	je	0x1401d5306 <.text+0x1d4306>
1401d4672:     	movq	%rax, %r15
1401d4675:     	movaps	%xmm14, %xmm11
1401d4679:     	movq	%rax, %rcx
1401d467c:     	movq	%r12, %rdx
1401d467f:     	movq	%r14, %r8
1401d4682:     	callq	0x145bc977b <.text+0x5bc877b>
1401d4687:     	movq	%rbx, %r12
1401d468a:     	cmpb	$0x1, (%rdi)
1401d468d:     	movq	%rsi, 0x298(%rbp)
1401d4694:     	jne	0x1401d46d1 <.text+0x1d36d1>
1401d4696:     	movl	0x1(%rdi), %eax
1401d4699:     	movl	0x4(%rdi), %ecx
1401d469c:     	movl	%ecx, 0xa3(%rbp)
1401d46a2:     	movl	%eax, 0xa0(%rbp)
1401d46a8:     	movq	0x8(%rdi), %rax
1401d46ac:     	movzbl	0x10(%rdi), %ecx
1401d46b0:     	movb	$0x1, %dl
1401d46b2:     	movups	0x5be42cf(%rip), %xmm7  # 0x145db8988
1401d46b9:     	jmp	0x1401d46e8 <.text+0x1d36e8>
1401d46bb:     	movl	$0x1, %r15d
1401d46c1:     	movaps	%xmm14, %xmm11
1401d46c5:     	cmpb	$0x1, (%rdi)
1401d46c8:     	movq	%rsi, 0x298(%rbp)
1401d46cf:     	je	0x1401d4696 <.text+0x1d3696>
1401d46d1:     	movq	0x8(%rdi), %rax
1401d46d5:     	lock
1401d46d6:     	incq	(%rax)
1401d46d9:     	movups	0x5be42a8(%rip), %xmm7  # 0x145db8988
1401d46e0:     	jle	0x1401d52f3 <.text+0x1d42f3>
1401d46e6:     	xorl	%edx, %edx
1401d46e8:     	leaq	0x2b8(%rbp), %rbx
1401d46ef:     	leaq	0x158(%rbp), %rsi
1401d46f6:     	leaq	0x8c(%rbp), %r13
1401d46fd:     	movq	%r14, 0x2a0(%rbp)
1401d4704:     	movq	%r15, 0x2a8(%rbp)
1401d470b:     	movq	%r14, 0x2b0(%rbp)
1401d4712:     	movq	$0x0, 0x2b8(%rbp)
1401d471d:     	movq	$0x4, 0x2c0(%rbp)
1401d4728:     	movq	$0x0, 0x2c8(%rbp)
1401d4733:     	movb	%dl, 0x2d0(%rbp)
1401d4739:     	movl	0xa0(%rbp), %edx
1401d473f:     	movl	0xa3(%rbp), %r8d
1401d4746:     	movl	%edx, 0x2d1(%rbp)
1401d474c:     	movl	%r8d, 0x2d4(%rbp)
1401d4753:     	movq	%rax, 0x2d8(%rbp)
1401d475a:     	movq	%rcx, 0x2e0(%rbp)
1401d4761:     	movl	$0x41400000, 0x2e8(%rbp) # imm = 0x41400000
1401d476b:     	movw	$0x190, 0x2ec(%rbp)     # imm = 0x190
1401d4774:     	movb	$0x1, 0x2ee(%rbp)
1401d477b:     	movups	0x5be45d1(%rip), %xmm14 # 0x145db8d54
1401d4783:     	movups	%xmm14, 0x2f0(%rbp)
1401d478b:     	movl	$0x3f800000, 0x300(%rbp) # imm = 0x3F800000
1401d4795:     	movl	0x5b99b4d(%rip), %eax   # 0x145d6e2e8
1401d479b:     	movl	%eax, 0x314(%rbp)
1401d47a1:     	movups	0x5b99b30(%rip), %xmm0  # 0x145d6e2d8
1401d47a8:     	movups	%xmm0, 0x304(%rbp)
1401d47af:     	movsd	0x5b98a19(%rip), %xmm0  # 0x145d6d1d0
1401d47b7:     	movsd	%xmm0, 0x318(%rbp)
1401d47bf:     	movl	$0x300, 0x320(%rbp)     # imm = 0x300
1401d47c9:     	leaq	0x230(%rbp), %r14
1401d47d0:     	leaq	0x2a0(%rbp), %rdx
1401d47d7:     	movq	%r14, %rcx
1401d47da:     	callq	0x1401a54d0 <.text+0x1a44d0>
1401d47df:     	movaps	%xmm11, 0x2a0(%rbp)
1401d47e7:     	movq	$0x0, 0x2b0(%rbp)
1401d47f2:     	movups	0x5be409f(%rip), %xmm0  # 0x145db8898
1401d47f9:     	movups	%xmm0, (%rbx)
1401d47fc:     	movq	$0x0, 0x10(%rbx)
1401d4804:     	movups	%xmm13, 0x18(%rbx)
1401d4809:     	movq	$0x0, 0x28(%rbx)
1401d4811:     	movups	0x5be40b0(%rip), %xmm0  # 0x145db88c8
1401d4818:     	movups	%xmm0, 0x30(%rbx)
1401d481c:     	movq	$0x0, 0x40(%rbx)
1401d4824:     	movaps	0x2a0(%rbp), %xmm0
1401d482b:     	movq	0x2b0(%rbp), %rax
1401d4832:     	movq	0x2b8(%rbp), %rcx
1401d4839:     	movaps	0x2c0(%rbp), %xmm1
1401d4840:     	movaps	0x2d0(%rbp), %xmm2
1401d4847:     	movaps	%xmm0, 0xa0(%rbp)
1401d484e:     	movq	%rax, 0xb0(%rbp)
1401d4855:     	movq	%rcx, 0xb8(%rbp)
1401d485c:     	movaps	%xmm1, 0xc0(%rbp)
1401d4863:     	movaps	%xmm2, 0xd0(%rbp)
1401d486a:     	movaps	0x2e0(%rbp), %xmm0
1401d4871:     	movaps	%xmm0, 0xe0(%rbp)
1401d4878:     	movaps	0x2f0(%rbp), %xmm0
1401d487f:     	movaps	%xmm0, 0xf0(%rbp)
1401d4886:     	xorps	%xmm0, %xmm0
1401d4889:     	movaps	%xmm0, 0x140(%rbp)
1401d4890:     	movaps	%xmm0, 0x130(%rbp)
1401d4897:     	movaps	%xmm0, 0x120(%rbp)
1401d489e:     	movaps	%xmm0, 0x110(%rbp)
1401d48a5:     	movaps	%xmm0, 0x100(%rbp)
1401d48ac:     	movq	$0x0, 0x150(%rbp)
1401d48b7:     	movups	0x5be408a(%rip), %xmm0  # 0x145db8948
1401d48be:     	movups	%xmm0, 0x10(%rsi)
1401d48c2:     	movups	0x5be406f(%rip), %xmm0  # 0x145db8938
1401d48c9:     	movups	%xmm0, (%rsi)
1401d48cc:     	movups	0x5be475d(%rip), %xmm0  # 0x145db9030
1401d48d3:     	movups	%xmm0, (%r13)
1401d48d8:     	movl	$0x0, 0x10(%r13)
1401d48e0:     	leaq	0x2a8(%rbp), %rcx
1401d48e7:     	leaq	0xa0(%rbp), %rdx
1401d48ee:     	movl	$0xd8, %r8d
1401d48f4:     	callq	0x145bc977b <.text+0x5bc877b>
1401d48f9:     	movups	%xmm6, 0x380(%rbp)
1401d4900:     	movups	%xmm8, 0x390(%rbp)
1401d4908:     	movups	%xmm15, 0x3a0(%rbp)
1401d4910:     	movups	%xmm7, 0x3b0(%rbp)
1401d4917:     	movups	%xmm9, 0x3c0(%rbp)
1401d491f:     	movups	%xmm9, 0x3d0(%rbp)
1401d4927:     	movups	%xmm12, 0x3e0(%rbp)
1401d492f:     	movl	$0x1, 0x3f0(%rbp)
1401d4939:     	movq	$0x0, 0x3f4(%rbp)
1401d4944:     	movb	$0x1, 0x3fc(%rbp)
1401d494b:     	movq	$0x0, 0x400(%rbp)
1401d4956:     	movl	$0x3f800000, 0x408(%rbp) # imm = 0x3F800000
1401d4960:     	movw	$0x0, 0x40c(%rbp)
1401d4969:     	movw	$0x0, 0x412(%rbp)
1401d4972:     	movl	$0x10000, 0x40e(%rbp)   # imm = 0x10000
1401d497c:     	movw	$0x0, 0x418(%rbp)
1401d4985:     	movl	$0x10000, 0x414(%rbp)   # imm = 0x10000
1401d498f:     	movq	$0x0, 0x41a(%rbp)
1401d499a:     	movl	$0x0, 0x422(%rbp)
1401d49a4:     	movups	0x8a(%rbp), %xmm0
1401d49ab:     	movups	%xmm0, 0x426(%rbp)
1401d49b2:     	movq	0x98(%rbp), %rax
1401d49b9:     	movq	%rax, 0x434(%rbp)
1401d49c0:     	movw	$0x201, 0x43c(%rbp)     # imm = 0x201
1401d49c9:     	movb	$0x0, 0x43e(%rbp)
1401d49d0:     	movq	0x298(%rbp), %rsi
1401d49d7:     	movq	%rsi, 0x2a0(%rbp)
1401d49de:     	leaq	0x2a0(%rbp), %r8
1401d49e5:     	movq	%r14, %rcx
1401d49e8:     	movq	%r12, %rdx
1401d49eb:     	callq	0x1401944a0 <.text+0x1934a0>
1401d49f0:     	leaq	0x5be1caf(%rip), %rcx   # 0x145db66a6
1401d49f7:     	movl	$0xc, %edx
1401d49fc:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401d4a01:     	movq	%rdx, %r14
1401d4a04:     	testq	%rdx, %rdx
1401d4a07:     	jns	0x1401d4a19 <.text+0x1d3a19>
1401d4a09:     	xorl	%r13d, %r13d
1401d4a0c:     	movq	%r13, %rcx
1401d4a0f:     	movq	%r14, %rdx
1401d4a12:     	callq	0x145d6944b <.text+0x5d6844b>
1401d4a17:     	ud2
1401d4a19:     	je	0x1401d4a77 <.text+0x1d3a77>
1401d4a1b:     	movq	%rax, %r12
1401d4a1e:     	callq	0x140002200 <.text+0x1200>
1401d4a23:     	movl	$0x1, %r13d
1401d4a29:     	movl	$0x1, %edx
1401d4a2e:     	movq	%r14, %rcx
1401d4a31:     	callq	0x1400021c0 <.text+0x11c0>
1401d4a36:     	testq	%rax, %rax
1401d4a39:     	je	0x1401d5306 <.text+0x1d4306>
1401d4a3f:     	movq	%rax, %r15
1401d4a42:     	movq	%rax, %rcx
1401d4a45:     	movq	%r12, %rdx
1401d4a48:     	movq	%r14, %r8
1401d4a4b:     	callq	0x145bc977b <.text+0x5bc877b>
1401d4a50:     	leaq	0x38(%rbp), %r12
1401d4a54:     	cmpb	$0x1, (%rdi)
1401d4a57:     	jne	0x1401d4a82 <.text+0x1d3a82>
1401d4a59:     	movl	0x1(%rdi), %eax
1401d4a5c:     	movl	0x4(%rdi), %ecx
1401d4a5f:     	movl	%ecx, 0xa3(%rbp)
1401d4a65:     	movl	%eax, 0xa0(%rbp)
1401d4a6b:     	movq	0x8(%rdi), %rax
1401d4a6f:     	movzbl	0x10(%rdi), %ecx
1401d4a73:     	movb	$0x1, %dl
1401d4a75:     	jmp	0x1401d4a92 <.text+0x1d3a92>
1401d4a77:     	movl	$0x1, %r15d
1401d4a7d:     	cmpb	$0x1, (%rdi)
1401d4a80:     	je	0x1401d4a59 <.text+0x1d3a59>
1401d4a82:     	movq	0x8(%rdi), %rax
1401d4a86:     	lock
1401d4a87:     	incq	(%rax)
1401d4a8a:     	jle	0x1401d52f3 <.text+0x1d42f3>
1401d4a90:     	xorl	%edx, %edx
1401d4a92:     	leaq	0x2d1(%rbp), %r13
1401d4a99:     	movq	%r14, 0x2a0(%rbp)
1401d4aa0:     	movq	%r15, 0x2a8(%rbp)
1401d4aa7:     	movq	%r14, 0x2b0(%rbp)
1401d4aae:     	movq	$0x0, 0x2b8(%rbp)
1401d4ab9:     	movq	$0x4, 0x2c0(%rbp)
1401d4ac4:     	movq	$0x0, 0x2c8(%rbp)
1401d4acf:     	movb	%dl, 0x2d0(%rbp)
1401d4ad5:     	movl	0xa0(%rbp), %edx
1401d4adb:     	movl	0xa3(%rbp), %r8d
1401d4ae2:     	movl	%r8d, 0x3(%r13)
1401d4ae6:     	movl	%edx, (%r13)
1401d4aea:     	movq	%rax, 0x2d8(%rbp)
1401d4af1:     	movq	%rcx, 0x2e0(%rbp)
1401d4af8:     	movl	$0x41400000, 0x2e8(%rbp) # imm = 0x41400000
1401d4b02:     	movw	$0x190, 0x2ec(%rbp)     # imm = 0x190
1401d4b0b:     	movb	$0x1, 0x2ee(%rbp)
1401d4b12:     	movups	%xmm14, 0x1f(%r13)
1401d4b17:     	movl	$0x3f800000, 0x2f(%r13) # imm = 0x3F800000
1401d4b1f:     	movups	0x5b997b2(%rip), %xmm0  # 0x145d6e2d8
1401d4b26:     	movups	%xmm0, 0x33(%r13)
1401d4b2b:     	movl	0x5b997b7(%rip), %eax   # 0x145d6e2e8
1401d4b31:     	movl	%eax, 0x43(%r13)
1401d4b35:     	movsd	0x5b98693(%rip), %xmm0  # 0x145d6d1d0
1401d4b3d:     	movsd	%xmm0, 0x318(%rbp)
1401d4b45:     	movl	$0x300, 0x320(%rbp)     # imm = 0x300
1401d4b4f:     	leaq	0x230(%rbp), %r14
1401d4b56:     	leaq	0x2a0(%rbp), %rdx
1401d4b5d:     	movq	%r14, %rcx
1401d4b60:     	callq	0x1401a54d0 <.text+0x1a44d0>
1401d4b65:     	movaps	%xmm11, 0x2a0(%rbp)
1401d4b6d:     	movq	$0x0, 0x2b0(%rbp)
1401d4b78:     	movups	0x5be3d19(%rip), %xmm0  # 0x145db8898
1401d4b7f:     	movups	%xmm0, (%rbx)
1401d4b82:     	movq	$0x0, 0x10(%rbx)
1401d4b8a:     	movups	%xmm13, 0x18(%rbx)
1401d4b8f:     	movq	$0x0, 0x28(%rbx)
1401d4b97:     	movups	0x5be3d2a(%rip), %xmm0  # 0x145db88c8
1401d4b9e:     	movups	%xmm0, 0x30(%rbx)
1401d4ba2:     	movq	$0x0, 0x40(%rbx)
1401d4baa:     	movaps	0x2a0(%rbp), %xmm0
1401d4bb1:     	movq	0x2b0(%rbp), %rax
1401d4bb8:     	movq	0x2b8(%rbp), %rcx
1401d4bbf:     	movaps	0x2c0(%rbp), %xmm1
1401d4bc6:     	movaps	0x2d0(%rbp), %xmm2
1401d4bcd:     	movaps	%xmm0, 0xa0(%rbp)
1401d4bd4:     	movq	%rax, 0xb0(%rbp)
1401d4bdb:     	movq	%rcx, 0xb8(%rbp)
1401d4be2:     	movaps	%xmm1, 0xc0(%rbp)
1401d4be9:     	movaps	%xmm2, 0xd0(%rbp)
1401d4bf0:     	movaps	0x2e0(%rbp), %xmm0
1401d4bf7:     	movaps	%xmm0, 0xe0(%rbp)
1401d4bfe:     	movaps	0x2f0(%rbp), %xmm0
1401d4c05:     	movaps	%xmm0, 0xf0(%rbp)
1401d4c0c:     	xorps	%xmm0, %xmm0
1401d4c0f:     	movaps	%xmm0, 0x140(%rbp)
1401d4c16:     	movaps	%xmm0, 0x130(%rbp)
1401d4c1d:     	movaps	%xmm0, 0x120(%rbp)
1401d4c24:     	movaps	%xmm0, 0x110(%rbp)
1401d4c2b:     	movaps	%xmm0, 0x100(%rbp)
1401d4c32:     	movq	$0x0, 0x150(%rbp)
1401d4c3d:     	movups	0x5be3d04(%rip), %xmm0  # 0x145db8948
1401d4c44:     	leaq	0x158(%rbp), %rax
1401d4c4b:     	movups	%xmm0, 0x10(%rax)
1401d4c4f:     	movups	0x5be3ce2(%rip), %xmm0  # 0x145db8938
1401d4c56:     	movups	%xmm0, (%rax)
1401d4c59:     	movups	0x5be43d0(%rip), %xmm0  # 0x145db9030
1401d4c60:     	leaq	0x8c(%rbp), %rax
1401d4c67:     	movups	%xmm0, (%rax)
1401d4c6a:     	movl	$0x0, 0x10(%rax)
1401d4c71:     	leaq	0x2a8(%rbp), %rcx
1401d4c78:     	leaq	0xa0(%rbp), %rdx
1401d4c7f:     	movl	$0xd8, %r8d
1401d4c85:     	callq	0x145bc977b <.text+0x5bc877b>
1401d4c8a:     	movups	%xmm6, 0x380(%rbp)
1401d4c91:     	movups	%xmm8, 0x390(%rbp)
1401d4c99:     	movups	%xmm15, 0x3a0(%rbp)
1401d4ca1:     	movups	%xmm7, 0x3b0(%rbp)
1401d4ca8:     	movups	%xmm9, 0x3c0(%rbp)
1401d4cb0:     	movups	%xmm9, 0x3d0(%rbp)
1401d4cb8:     	movups	%xmm12, 0x3e0(%rbp)
1401d4cc0:     	movl	$0x1, 0x3f0(%rbp)
1401d4cca:     	movq	$0x0, 0x3f4(%rbp)
1401d4cd5:     	movb	$0x1, 0x3fc(%rbp)
1401d4cdc:     	movq	$0x0, 0x400(%rbp)
1401d4ce7:     	movl	$0x3f800000, 0x408(%rbp) # imm = 0x3F800000
1401d4cf1:     	movw	$0x0, 0x40c(%rbp)
1401d4cfa:     	movw	$0x0, 0x412(%rbp)
1401d4d03:     	movl	$0x10000, 0x40e(%rbp)   # imm = 0x10000
1401d4d0d:     	movw	$0x0, 0x418(%rbp)
1401d4d16:     	movl	$0x10000, 0x414(%rbp)   # imm = 0x10000
1401d4d20:     	movq	$0x0, 0x41a(%rbp)
1401d4d2b:     	movl	$0x0, 0x422(%rbp)
1401d4d35:     	movups	0x8a(%rbp), %xmm0
1401d4d3c:     	movups	%xmm0, 0x426(%rbp)
1401d4d43:     	movq	0x98(%rbp), %rax
1401d4d4a:     	movq	%rax, 0x434(%rbp)
1401d4d51:     	movw	$0x202, 0x43c(%rbp)     # imm = 0x202
1401d4d5a:     	movb	$0x0, 0x43e(%rbp)
1401d4d61:     	movq	%rsi, 0x2a0(%rbp)
1401d4d68:     	leaq	0x2a0(%rbp), %r8
1401d4d6f:     	movq	%r14, %rcx
1401d4d72:     	movq	%r12, %rdx
1401d4d75:     	callq	0x1401944a0 <.text+0x1934a0>
1401d4d7a:     	leaq	0x5be1931(%rip), %rcx   # 0x145db66b2
1401d4d81:     	movl	$0xb, %edx
1401d4d86:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401d4d8b:     	movq	%rdx, %rbx
1401d4d8e:     	testq	%rdx, %rdx
1401d4d91:     	jns	0x1401d4da3 <.text+0x1d3da3>
1401d4d93:     	xorl	%r12d, %r12d
1401d4d96:     	movq	%r12, %rcx
1401d4d99:     	movq	%rbx, %rdx
1401d4d9c:     	callq	0x145d6944b <.text+0x5d6844b>
1401d4da1:     	ud2
1401d4da3:     	je	0x1401d4def <.text+0x1d3def>
1401d4da5:     	movq	%rax, %r15
1401d4da8:     	callq	0x140002200 <.text+0x1200>
1401d4dad:     	movl	$0x1, %r12d
1401d4db3:     	movl	$0x1, %edx
1401d4db8:     	movq	%rbx, %rcx
1401d4dbb:     	callq	0x1400021c0 <.text+0x11c0>
1401d4dc0:     	testq	%rax, %rax
1401d4dc3:     	movups	0x5be3b6e(%rip), %xmm6  # 0x145db8938
1401d4dca:     	movups	0x5be3af6(%rip), %xmm9  # 0x145db88c8
1401d4dd2:     	movaps	0x5bc8f96(%rip), %xmm8  # 0x145d9dd70
1401d4dda:     	je	0x1401d4d96 <.text+0x1d3d96>
1401d4ddc:     	movq	%rax, %r14
1401d4ddf:     	movq	%rax, %rcx
1401d4de2:     	movq	%r15, %rdx
1401d4de5:     	movq	%rbx, %r8
1401d4de8:     	callq	0x145bc977b <.text+0x5bc877b>
1401d4ded:     	jmp	0x1401d4e0c <.text+0x1d3e0c>
1401d4def:     	movl	$0x1, %r14d
1401d4df5:     	movups	0x5be3b3c(%rip), %xmm6  # 0x145db8938
1401d4dfc:     	movups	0x5be3ac4(%rip), %xmm9  # 0x145db88c8
1401d4e04:     	movaps	0x5bc8f64(%rip), %xmm8  # 0x145d9dd70
1401d4e0c:     	cmpb	$0x1, (%rdi)
1401d4e0f:     	movq	0x28(%rbp), %rsi
1401d4e13:     	leaq	-0x48(%rbp), %r15
1401d4e17:     	jne	0x1401d4e37 <.text+0x1d3e37>
1401d4e19:     	movl	0x1(%rdi), %eax
1401d4e1c:     	movl	0x4(%rdi), %ecx
1401d4e1f:     	movl	%ecx, 0xa3(%rbp)
1401d4e25:     	movl	%eax, 0xa0(%rbp)
1401d4e2b:     	movq	0x8(%rdi), %rax
1401d4e2f:     	movzbl	0x10(%rdi), %ecx
1401d4e33:     	movb	$0x1, %dl
1401d4e35:     	jmp	0x1401d4e47 <.text+0x1d3e47>
1401d4e37:     	movq	0x8(%rdi), %rax
1401d4e3b:     	lock
1401d4e3c:     	incq	(%rax)
1401d4e3f:     	jle	0x1401d52f3 <.text+0x1d42f3>
1401d4e45:     	xorl	%edx, %edx
1401d4e47:     	movq	%rbx, 0x2a0(%rbp)
1401d4e4e:     	movq	%r14, 0x2a8(%rbp)
1401d4e55:     	movq	%rbx, 0x2b0(%rbp)
1401d4e5c:     	movq	$0x0, 0x2b8(%rbp)
1401d4e67:     	movq	$0x4, 0x2c0(%rbp)
1401d4e72:     	movq	$0x0, 0x2c8(%rbp)
1401d4e7d:     	movb	%dl, 0x2d0(%rbp)
1401d4e83:     	movl	0xa0(%rbp), %edx
1401d4e89:     	movl	0xa3(%rbp), %r8d
1401d4e90:     	movl	%r8d, 0x3(%r13)
1401d4e94:     	movl	%edx, (%r13)
1401d4e98:     	movq	%rax, 0x2d8(%rbp)
1401d4e9f:     	movq	%rcx, 0x2e0(%rbp)
1401d4ea6:     	movl	$0x41400000, 0x2e8(%rbp) # imm = 0x41400000
1401d4eb0:     	movw	$0x190, 0x2ec(%rbp)     # imm = 0x190
1401d4eb9:     	movb	$0x1, 0x2ee(%rbp)
1401d4ec0:     	movups	%xmm14, 0x1f(%r13)
1401d4ec5:     	movl	$0x3f800000, 0x2f(%r13) # imm = 0x3F800000
1401d4ecd:     	movups	0x5b99404(%rip), %xmm0  # 0x145d6e2d8
1401d4ed4:     	movups	%xmm0, 0x33(%r13)
1401d4ed9:     	movl	0x5b99409(%rip), %eax   # 0x145d6e2e8
1401d4edf:     	movl	%eax, 0x43(%r13)
1401d4ee3:     	movsd	0x5b982e5(%rip), %xmm0  # 0x145d6d1d0
1401d4eeb:     	movsd	%xmm0, 0x318(%rbp)
1401d4ef3:     	movl	$0x300, 0x320(%rbp)     # imm = 0x300
1401d4efd:     	leaq	0x230(%rbp), %rcx
1401d4f04:     	leaq	0x2a0(%rbp), %rdx
1401d4f0b:     	callq	0x1401a54d0 <.text+0x1a44d0>
1401d4f10:     	movw	$0x0, 0x204(%rbp)
1401d4f19:     	movb	$0x1, 0x1f4(%rbp)
1401d4f20:     	movups	%xmm8, 0x108(%rbp)
1401d4f28:     	movups	%xmm8, 0x118(%rbp)
1401d4f30:     	movaps	0x5b983a9(%rip), %xmm0  # 0x145d6d2e0
1401d4f37:     	movups	%xmm0, 0x128(%rbp)
1401d4f3e:     	movq	$0x0, 0x100(%rbp)
1401d4f49:     	xorps	%xmm0, %xmm0
1401d4f4c:     	movups	%xmm0, 0x138(%rbp)
1401d4f53:     	movups	%xmm0, 0x148(%rbp)
1401d4f5a:     	movl	$0x0, 0x218(%rbp)
1401d4f64:     	movw	$0x0, 0x21c(%rbp)
1401d4f6d:     	movups	%xmm6, 0x158(%rbp)
1401d4f74:     	movups	0x5be39cd(%rip), %xmm0  # 0x145db8948
1401d4f7b:     	movups	%xmm0, 0x168(%rbp)
1401d4f82:     	movups	0x5be39cf(%rip), %xmm0  # 0x145db8958
1401d4f89:     	movups	%xmm0, 0x178(%rbp)
1401d4f90:     	movups	0x5be39d1(%rip), %xmm0  # 0x145db8968
1401d4f97:     	movups	%xmm0, 0x188(%rbp)
1401d4f9e:     	movups	%xmm7, 0x1a8(%rbp)
1401d4fa5:     	movups	%xmm15, 0x198(%rbp)
1401d4fad:     	movups	0x5be39f4(%rip), %xmm0  # 0x145db89a8
1401d4fb4:     	movups	%xmm0, 0x1c8(%rbp)
1401d4fbb:     	movups	0x5be39d6(%rip), %xmm0  # 0x145db8998
1401d4fc2:     	movups	%xmm0, 0x1b8(%rbp)
1401d4fc9:     	movb	$0x0, 0x216(%rbp)
1401d4fd0:     	movl	$0x100, 0x212(%rbp)     # imm = 0x100
1401d4fda:     	movq	$0x0, 0x1f8(%rbp)
1401d4fe5:     	movl	$0x3f800000, 0x200(%rbp) # imm = 0x3F800000
1401d4fef:     	movups	%xmm12, 0x1d8(%rbp)
1401d4ff7:     	movl	$0x1, 0x1e8(%rbp)
1401d5001:     	movq	$0x0, 0x1ec(%rbp)
1401d500c:     	movb	$0x0, 0x217(%rbp)
1401d5013:     	movaps	%xmm11, 0xa0(%rbp)
1401d501b:     	movq	$0x0, 0xb0(%rbp)
1401d5026:     	movups	0x5be386b(%rip), %xmm0  # 0x145db8898
1401d502d:     	movups	%xmm0, 0xb8(%rbp)
1401d5034:     	movq	$0x0, 0xc8(%rbp)
1401d503f:     	movaps	%xmm13, 0xd0(%rbp)
1401d5047:     	movq	$0x0, 0xe0(%rbp)
1401d5052:     	movups	%xmm9, 0xe8(%rbp)
1401d505a:     	movq	$0x0, 0xf8(%rbp)
1401d5065:     	movw	$0x0, 0x20a(%rbp)
1401d506e:     	movl	$0x10000, 0x206(%rbp)   # imm = 0x10000
1401d5078:     	movw	$0x0, 0x210(%rbp)
1401d5081:     	movl	$0x10000, 0x20c(%rbp)   # imm = 0x10000
1401d508b:     	callq	0x140002200 <.text+0x1200>
1401d5090:     	movl	$0x40, %ecx
1401d5095:     	movl	$0x4, %edx
1401d509a:     	callq	0x1400021c0 <.text+0x11c0>
1401d509f:     	movq	%rax, 0x298(%rbp)
1401d50a6:     	testq	%rax, %rax
1401d50a9:     	je	0x1401d52e3 <.text+0x1d42e3>
1401d50af:     	movups	0x5be3f7a(%rip), %xmm0  # 0x145db9030
1401d50b6:     	movaps	%xmm0, 0x2a0(%rbp)
1401d50bd:     	movl	$0x0, 0x2b0(%rbp)
1401d50c7:     	leaq	0x230(%rbp), %rcx
1401d50ce:     	leaq	0x2a0(%rbp), %rdx
1401d50d5:     	callq	0x144c67100 <.text+0x4c66100>
1401d50da:     	nop
1401d50db:     	movaps	0x230(%rbp), %xmm6
1401d50e2:     	movups	0x5be3a87(%rip), %xmm0  # 0x145db8b70
1401d50e9:     	movaps	%xmm0, 0x2a0(%rbp)
1401d50f0:     	movl	$0x3f59999a, 0x2b0(%rbp) # imm = 0x3F59999A
1401d50fa:     	leaq	0x230(%rbp), %rcx
1401d5101:     	leaq	0x2a0(%rbp), %rdx
1401d5108:     	callq	0x144c67100 <.text+0x4c66100>
1401d510d:     	nop
1401d510e:     	movaps	0x230(%rbp), %xmm0
1401d5115:     	movabsq	$0x4248000000000002, %rax # imm = 0x4248000000000002
1401d511f:     	movq	0x298(%rbp), %rdi
1401d5126:     	movq	%rax, (%rdi)
1401d5129:     	movl	$0x1, 0x8(%rdi)
1401d5130:     	movups	%xmm6, 0xc(%rdi)
1401d5134:     	movaps	0x5be2fb5(%rip), %xmm1  # 0x145db80f0
1401d513b:     	movups	%xmm1, 0x1c(%rdi)
1401d513f:     	movups	%xmm0, 0x2c(%rdi)
1401d5143:     	movl	$0x3f000000, 0x3c(%rdi) # imm = 0x3F000000
1401d514a:     	callq	0x140002200 <.text+0x1200>
1401d514f:     	movl	$0x48, %ecx
1401d5154:     	movl	$0x8, %edx
1401d5159:     	callq	0x1400021c0 <.text+0x11c0>
1401d515e:     	testq	%rax, %rax
1401d5161:     	je	0x1401d52d1 <.text+0x1d42d1>
1401d5167:     	movq	%rax, %rbx
1401d516a:     	movq	$0x2, 0x8(%rax)
1401d5172:     	movq	%rdi, 0x10(%rax)
1401d5176:     	movq	$0x2, 0x18(%rax)
1401d517e:     	movl	$0x4016cbe4, 0x20(%rax) # imm = 0x4016CBE4
1401d5185:     	movb	$0x0, 0x24(%rax)
1401d5189:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
1401d5193:     	movq	%rax, (%rbx)
1401d5196:     	leaq	0x2a8(%rbp), %rcx
1401d519d:     	leaq	0xa0(%rbp), %rdx
1401d51a4:     	movl	$0x180, %r8d            # imm = 0x180
1401d51aa:     	callq	0x145bc977b <.text+0x5bc877b>
1401d51af:     	movq	$0x1, 0x428(%rbp)
1401d51ba:     	movq	%rbx, 0x430(%rbp)
1401d51c1:     	movq	$0x1, 0x438(%rbp)
1401d51cc:     	movw	$0x2, 0x440(%rbp)
1401d51d5:     	movq	0x228(%rbp), %rax
1401d51dc:     	movq	%rax, 0x2a0(%rbp)
1401d51e3:     	leaq	0xa0(%rbp), %rcx
1401d51ea:     	leaq	0x2a0(%rbp), %r8
1401d51f1:     	movq	%r15, %rdx
1401d51f4:     	callq	0x140193c90 <.text+0x192c90>

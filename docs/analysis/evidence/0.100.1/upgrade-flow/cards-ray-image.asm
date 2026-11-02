
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14021e120:     	pushq	%rbp
14021e121:     	pushq	%r14
14021e123:     	pushq	%rsi
14021e124:     	pushq	%rdi
14021e125:     	pushq	%rbx
14021e126:     	subq	$0x290, %rsp            # imm = 0x290
14021e12d:     	leaq	0x80(%rsp), %rbp
14021e135:     	movaps	%xmm15, 0x200(%rbp)
14021e13d:     	movaps	%xmm14, 0x1f0(%rbp)
14021e145:     	movaps	%xmm13, 0x1e0(%rbp)
14021e14d:     	movaps	%xmm12, 0x1d0(%rbp)
14021e155:     	movaps	%xmm11, 0x1c0(%rbp)
14021e15d:     	movaps	%xmm10, 0x1b0(%rbp)
14021e165:     	movaps	%xmm9, 0x1a0(%rbp)
14021e16d:     	movaps	%xmm8, 0x190(%rbp)
14021e175:     	movaps	%xmm7, 0x180(%rbp)
14021e17c:     	movaps	%xmm6, 0x170(%rbp)
14021e183:     	movq	$-0x2, 0x168(%rbp)
14021e18e:     	movq	0x20(%rdx), %rax
14021e192:     	movq	%rax, 0x110(%rbp)
14021e199:     	movups	(%rdx), %xmm0
14021e19c:     	movups	0x10(%rdx), %xmm1
14021e1a0:     	movaps	%xmm1, 0x100(%rbp)
14021e1a7:     	movaps	%xmm0, 0xf0(%rbp)
14021e1ae:     	movups	(%r8), %xmm0
14021e1b2:     	movups	0x10(%r8), %xmm1
14021e1b7:     	movups	%xmm0, 0x118(%rbp)
14021e1be:     	movups	%xmm1, 0x128(%rbp)
14021e1c5:     	callq	0x140002200 <.text+0x1200>
14021e1ca:     	movl	$0x400000, %ecx         # imm = 0x400000
14021e1cf:     	movl	$0x1, %edx
14021e1d4:     	callq	0x1400021c0 <.text+0x11c0>
14021e1d9:     	testq	%rax, %rax
14021e1dc:     	je	0x14021e4e9 <.text+0x21d4e9>
14021e1e2:     	movq	%rax, %rsi
14021e1e5:     	movq	$0x400000, 0x138(%rbp)  # imm = 0x400000
14021e1f0:     	movq	%rax, 0x140(%rbp)
14021e1f7:     	movl	$0x400000, %r8d         # imm = 0x400000
14021e1fd:     	movq	%rax, %rcx
14021e200:     	movb	$-0x1, %dl
14021e202:     	callq	0x1457731db <.text+0x57721db>
14021e207:     	movq	$0x400000, 0x148(%rbp)  # imm = 0x400000
14021e212:     	addq	$0x3, %rsi
14021e216:     	xorl	%edi, %edi
14021e218:     	movss	0x56e9277(%rip), %xmm8  # 0x145907498
14021e221:     	movss	0x572d2ee(%rip), %xmm9  # 0x14594b518
14021e22a:     	movss	0x572d2ea(%rip), %xmm6  # 0x14594b51c
14021e232:     	xorps	%xmm11, %xmm11
14021e236:     	movss	0x572cfe1(%rip), %xmm12 # 0x14594b220
14021e23f:     	movss	0x56fa878(%rip), %xmm13 # 0x145918ac0
14021e248:     	movss	0x56e923f(%rip), %xmm14 # 0x145907490
14021e251:     	movss	0x572d2c6(%rip), %xmm15 # 0x14594b520
14021e25a:     	movss	0x572212d(%rip), %xmm10 # 0x145940390
14021e263:     	jmp	0x14021e287 <.text+0x21d287>
14021e265:     	nopw	%cs:(%rax,%rax)
14021e270:     	incq	%rdi
14021e273:     	addq	$0x1000, %rsi           # imm = 0x1000
14021e27a:     	cmpq	$0x400, %rdi            # imm = 0x400
14021e281:     	je	0x14021e375 <.text+0x21d375>
14021e287:     	testq	%rdi, %rdi
14021e28a:     	js	0x14021e2a0 <.text+0x21d2a0>
14021e28c:     	xorps	%xmm7, %xmm7
14021e28f:     	cvtsi2ss	%rdi, %xmm7
14021e294:     	jmp	0x14021e2ba <.text+0x21d2ba>
14021e296:     	nopw	%cs:(%rax,%rax)
14021e2a0:     	movq	%rdi, %rax
14021e2a3:     	shrq	%rax
14021e2a6:     	movl	%edi, %ecx
14021e2a8:     	andl	$0x1, %ecx
14021e2ab:     	orq	%rax, %rcx
14021e2ae:     	xorps	%xmm7, %xmm7
14021e2b1:     	cvtsi2ss	%rcx, %xmm7
14021e2b6:     	addss	%xmm7, %xmm7
14021e2ba:     	addss	%xmm8, %xmm7
14021e2bf:     	addss	%xmm9, %xmm7
14021e2c4:     	xorps	0x56fa775(%rip), %xmm7  # 0x145918a40
14021e2cb:     	xorl	%ebx, %ebx
14021e2cd:     	jmp	0x14021e30c <.text+0x21d30c>
14021e2cf:     	nop
14021e2d0:     	divss	%xmm12, %xmm1
14021e2d5:     	movaps	%xmm1, %xmm0
14021e2d8:     	leaq	0x1(%rbx), %r14
14021e2dc:     	mulss	%xmm13, %xmm0
14021e2e1:     	callq	0x14577322f <.text+0x577222f>
14021e2e6:     	xorps	%xmm1, %xmm1
14021e2e9:     	maxss	%xmm0, %xmm1
14021e2ed:     	movaps	%xmm13, %xmm0
14021e2f1:     	minss	%xmm1, %xmm0
14021e2f5:     	cvttss2si	%xmm0, %eax
14021e2f9:     	movb	%al, (%rsi,%rbx,4)
14021e2fc:     	movq	%r14, %rbx
14021e2ff:     	cmpq	$0x400, %r14            # imm = 0x400
14021e306:     	je	0x14021e270 <.text+0x21d270>
14021e30c:     	xorps	%xmm0, %xmm0
14021e30f:     	cvtsi2ss	%ebx, %xmm0
14021e313:     	addss	%xmm8, %xmm0
14021e318:     	addss	%xmm9, %xmm0
14021e31d:     	movaps	%xmm7, %xmm1
14021e320:     	callq	0x14577324d <.text+0x577224d>
14021e325:     	movaps	%xmm6, %xmm1
14021e328:     	callq	0x14577325f <.text+0x577225f>
14021e32d:     	movaps	%xmm0, %xmm2
14021e330:     	addss	%xmm6, %xmm2
14021e334:     	movaps	%xmm0, %xmm1
14021e337:     	cmpltss	%xmm11, %xmm1
14021e33d:     	andps	%xmm1, %xmm2
14021e340:     	andnps	%xmm0, %xmm1
14021e343:     	orps	%xmm2, %xmm1
14021e346:     	ucomiss	%xmm1, %xmm12
14021e34a:     	ja	0x14021e2d0 <.text+0x21d2d0>
14021e34c:     	ucomiss	%xmm1, %xmm15
14021e350:     	movaps	%xmm14, %xmm0
14021e354:     	ja	0x14021e2d8 <.text+0x21d2d8>
14021e356:     	xorps	%xmm0, %xmm0
14021e359:     	ucomiss	%xmm1, %xmm10
14021e35d:     	jbe	0x14021e2d8 <.text+0x21d2d8>
14021e363:     	movaps	%xmm10, %xmm0
14021e367:     	subss	%xmm1, %xmm0
14021e36b:     	divss	%xmm12, %xmm0
14021e370:     	jmp	0x14021e2d8 <.text+0x21d2d8>
14021e375:     	leaq	-0x40(%rbp), %r14
14021e379:     	leaq	0x138(%rbp), %r9
14021e380:     	movq	%r14, %rcx
14021e383:     	movl	$0x400, %edx            # imm = 0x400
14021e388:     	movl	$0x400, %r8d            # imm = 0x400
14021e38e:     	callq	0x14229b5b0 <.text+0x229a5b0>
14021e393:     	movl	0x134(%rbp), %eax
14021e399:     	movq	0x128(%rbp), %rcx
14021e3a0:     	movl	%eax, (%rcx)
14021e3a2:     	movq	0x118(%rbp), %rsi
14021e3a9:     	movq	0x50(%rsi), %rcx
14021e3ad:     	addq	$0x10, %rcx
14021e3b1:     	movb	$0x1, 0x167(%rbp)
14021e3b8:     	callq	0x144978a10 <.text+0x4977a10>
14021e3bd:     	nop
14021e3be:     	movl	%eax, %edi
14021e3c0:     	movl	%edx, %ebx
14021e3c2:     	movb	$0x0, 0x167(%rbp)
14021e3c9:     	movq	%r14, 0x20(%rsp)
14021e3ce:     	leaq	0x154(%rbp), %rcx
14021e3d5:     	movq	%rsi, %rdx
14021e3d8:     	movl	%eax, %r8d
14021e3db:     	movl	%ebx, %r9d
14021e3de:     	callq	0x1401f1cc0 <.text+0x1f0cc0>
14021e3e3:     	nop
14021e3e4:     	cmpl	$0x2, 0x154(%rbp)
14021e3eb:     	jne	0x14021e4a6 <.text+0x21d4a6>
14021e3f1:     	movq	$-0x1, 0xa0(%rbp)
14021e3fc:     	movb	$0x0, 0x167(%rbp)
14021e403:     	leaq	0xa0(%rbp), %rax
14021e40a:     	movq	%rax, 0x20(%rsp)
14021e40f:     	movq	$0x0, 0x28(%rsp)
14021e418:     	movq	%rsi, %rcx
14021e41b:     	movl	%edi, %edx
14021e41d:     	movl	%ebx, %r8d
14021e420:     	xorl	%r9d, %r9d
14021e423:     	callq	0x14498b590 <.text+0x498a590>
14021e428:     	nop
14021e429:     	movb	$0x0, 0xa0(%rbp)
14021e430:     	movq	%rax, 0xa8(%rbp)
14021e437:     	leaq	0xf0(%rbp), %rcx
14021e43e:     	leaq	0xa0(%rbp), %rdx
14021e445:     	callq	0x1400d6bb0 <.text+0xd5bb0>
14021e44a:     	movaps	0x170(%rbp), %xmm6
14021e451:     	movaps	0x180(%rbp), %xmm7
14021e458:     	movaps	0x190(%rbp), %xmm8
14021e460:     	movaps	0x1a0(%rbp), %xmm9
14021e468:     	movaps	0x1b0(%rbp), %xmm10
14021e470:     	movaps	0x1c0(%rbp), %xmm11
14021e478:     	movaps	0x1d0(%rbp), %xmm12
14021e480:     	movaps	0x1e0(%rbp), %xmm13
14021e488:     	movaps	0x1f0(%rbp), %xmm14
14021e490:     	movaps	0x200(%rbp), %xmm15
14021e498:     	addq	$0x290, %rsp            # imm = 0x290
14021e49f:     	popq	%rbx
14021e4a0:     	popq	%rdi
14021e4a1:     	popq	%rsi
14021e4a2:     	popq	%r14
14021e4a4:     	popq	%rbp
14021e4a5:     	retq
14021e4a6:     	movups	0x154(%rbp), %xmm0
14021e4ad:     	movaps	%xmm0, 0xa0(%rbp)
14021e4b4:     	movb	$0x0, 0x167(%rbp)
14021e4bb:     	leaq	0x572d7a6(%rip), %rax   # 0x14594bc68
14021e4c2:     	movq	%rax, 0x20(%rsp)
14021e4c7:     	leaq	0x572dd8a(%rip), %rcx   # 0x14594c258
14021e4ce:     	leaq	0x572ddb3(%rip), %r9    # 0x14594c288
14021e4d5:     	leaq	0xa0(%rbp), %r8
14021e4dc:     	movl	$0x2b, %edx
14021e4e1:     	callq	0x145903ab0 <.text+0x5902ab0>
14021e4e6:     	nop
14021e4e7:     	ud2
14021e4e9:     	movl	$0x1, %ecx
14021e4ee:     	movl	$0x400000, %edx         # imm = 0x400000
14021e4f3:     	callq	0x14590379b <.text+0x590279b>
14021e4f8:     	ud2

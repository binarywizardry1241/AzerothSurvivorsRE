
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005afe0:     	pushq	%r15
14005afe2:     	pushq	%r14
14005afe4:     	pushq	%r13
14005afe6:     	pushq	%r12
14005afe8:     	pushq	%rsi
14005afe9:     	pushq	%rdi
14005afea:     	pushq	%rbp
14005afeb:     	pushq	%rbx
14005afec:     	subq	$0x228, %rsp            # imm = 0x228
14005aff3:     	movaps	%xmm10, 0x210(%rsp)
14005affc:     	movaps	%xmm9, 0x200(%rsp)
14005b005:     	movaps	%xmm8, 0x1f0(%rsp)
14005b00e:     	movaps	%xmm7, 0x1e0(%rsp)
14005b016:     	movaps	%xmm6, 0x1d0(%rsp)
14005b01e:     	movq	0x2b0(%rsp), %rax
14005b026:     	movq	0x2a8(%rsp), %rcx
14005b02e:     	movq	0x2a0(%rsp), %r10
14005b036:     	movq	0x298(%rsp), %r11
14005b03e:     	movq	0x290(%rsp), %rsi
14005b046:     	movq	0x20(%rdx), %rdi
14005b04a:     	movq	%rdi, 0x110(%rsp)
14005b052:     	movups	(%rdx), %xmm0
14005b055:     	movups	0x10(%rdx), %xmm1
14005b059:     	movaps	%xmm1, 0x100(%rsp)
14005b061:     	movaps	%xmm0, 0xf0(%rsp)
14005b069:     	movq	0x10(%r8), %rdx
14005b06d:     	movq	%rdx, 0x128(%rsp)
14005b075:     	movups	(%r8), %xmm0
14005b079:     	movups	%xmm0, 0x118(%rsp)
14005b081:     	movq	0x10(%r9), %rdx
14005b085:     	movq	%rdx, 0x140(%rsp)
14005b08d:     	movups	(%r9), %xmm0
14005b091:     	movaps	%xmm0, 0x130(%rsp)
14005b099:     	movq	0x10(%rsi), %rdx
14005b09d:     	movq	%rdx, 0x158(%rsp)
14005b0a5:     	movups	(%rsi), %xmm0
14005b0a8:     	movups	%xmm0, 0x148(%rsp)
14005b0b0:     	movq	0x10(%r11), %rdx
14005b0b4:     	movq	%rdx, 0x170(%rsp)
14005b0bc:     	movups	(%r11), %xmm0
14005b0c0:     	movaps	%xmm0, 0x160(%rsp)
14005b0c8:     	movups	(%r10), %xmm0
14005b0cc:     	movups	%xmm0, 0x178(%rsp)
14005b0d4:     	movq	0x10(%r10), %rdx
14005b0d8:     	movq	%rdx, 0x188(%rsp)
14005b0e0:     	movups	(%rcx), %xmm0
14005b0e3:     	movups	0x10(%rcx), %xmm1
14005b0e7:     	movaps	%xmm0, 0x190(%rsp)
14005b0ef:     	movaps	%xmm1, 0x1a0(%rsp)
14005b0f7:     	movups	(%rax), %xmm0
14005b0fa:     	movups	0x10(%rax), %xmm1
14005b0fe:     	movaps	%xmm1, 0x1c0(%rsp)
14005b106:     	movaps	%xmm0, 0x1b0(%rsp)
14005b10e:     	movq	0x178(%rsp), %rax
14005b116:     	movq	%rax, 0x50(%rsp)
14005b11b:     	movq	0x180(%rsp), %rax
14005b123:     	movq	%rax, 0x88(%rsp)
14005b12b:     	movq	0x190(%rsp), %rsi
14005b133:     	movq	0x1b0(%rsp), %rax
14005b13b:     	movq	%rax, 0xe8(%rsp)
14005b143:     	movq	0x118(%rsp), %rdx
14005b14b:     	movq	0x120(%rsp), %r8
14005b153:     	leaq	0xb8(%rsp), %rcx
14005b15b:     	callq	0x14003e4e0 <.text+0x3d4e0>
14005b160:     	cmpb	$0x1, 0xb8(%rsp)
14005b168:     	jne	0x14005b1a9 <.text+0x5a1a9>
14005b16a:     	movaps	0x1d0(%rsp), %xmm6
14005b172:     	movaps	0x1e0(%rsp), %xmm7
14005b17a:     	movaps	0x1f0(%rsp), %xmm8
14005b183:     	movaps	0x200(%rsp), %xmm9
14005b18c:     	movaps	0x210(%rsp), %xmm10
14005b195:     	addq	$0x228, %rsp            # imm = 0x228
14005b19c:     	popq	%rbx
14005b19d:     	popq	%rbp
14005b19e:     	popq	%rdi
14005b19f:     	popq	%rsi
14005b1a0:     	popq	%r12
14005b1a2:     	popq	%r13
14005b1a4:     	popq	%r14
14005b1a6:     	popq	%r15
14005b1a8:     	retq
14005b1a9:     	movq	%rsi, 0x80(%rsp)
14005b1b1:     	movq	0xc0(%rsp), %rax
14005b1b9:     	movq	%rax, 0x98(%rsp)
14005b1c1:     	movq	0x138(%rsp), %rdi
14005b1c9:     	movq	0x130(%rsp), %rcx
14005b1d1:     	movq	0xf8(%rcx), %rbx
14005b1d8:     	movq	0x100(%rcx), %rax
14005b1df:     	leaq	(%rbx,%rax,4), %r14
14005b1e3:     	movq	%rcx, 0x48(%rsp)
14005b1e8:     	movzbl	0x108(%rcx), %eax
14005b1ef:     	movb	%al, 0x37(%rsp)
14005b1f3:     	movq	0x168(%rsp), %rax
14005b1fb:     	movq	%rax, 0xa0(%rsp)
14005b203:     	movq	0x160(%rsp), %rax
14005b20b:     	movq	%rax, 0x58(%rsp)
14005b210:     	movaps	0xf0(%rsp), %xmm6
14005b218:     	movl	$0x8, %eax
14005b21d:     	movq	%rax, 0x60(%rsp)
14005b222:     	movss	0x5d12142(%rip), %xmm7  # 0x145d6d36c
14005b22a:     	movss	0x5d15a05(%rip), %xmm8  # 0x145d70c38
14005b233:     	leaq	0xb8(%rsp), %rsi
14005b23b:     	movss	0x5d159f0(%rip), %xmm9  # 0x145d70c34
14005b244:     	movq	$0x0, 0x40(%rsp)
14005b24d:     	movq	$0x0, 0x38(%rsp)
14005b256:     	xorl	%r12d, %r12d
14005b259:     	xorl	%r13d, %r13d
14005b25c:     	movl	$0x0, 0x2c(%rsp)
14005b264:     	movl	$0x0, 0x30(%rsp)
14005b26c:     	movl	$0x8, %eax
14005b271:     	movq	%rax, 0xa8(%rsp)
14005b279:     	nopl	(%rax)
14005b280:     	cmpb	$0x0, 0x37(%rsp)
14005b285:     	je	0x14005b2a0 <.text+0x5a2a0>
14005b287:     	movq	0xb0(%rsp), %r11
14005b28f:     	jmp	0x14005b2db <.text+0x5a2db>
14005b291:     	nopw	%cs:(%rax,%rax)
14005b2a0:     	movq	0xb0(%rsp), %r11
14005b2a8:     	jmp	0x14005b3cc <.text+0x5a3cc>
14005b2ad:     	movl	$0x0, 0x2c(%rsp)
14005b2b5:     	movq	0x8(%rax), %rax
14005b2b9:     	movq	%rax, 0xa8(%rsp)
14005b2c1:     	movl	%r12d, %ecx
14005b2c4:     	incl	%r12d
14005b2c7:     	movq	0xa8(%rsp), %rax
14005b2cf:     	movq	(%rax,%rcx,8), %rax
14005b2d3:     	testl	%eax, %eax
14005b2d5:     	jne	0x14005b8aa <.text+0x5a8aa>
14005b2db:     	cmpl	%r13d, %r12d
14005b2de:     	jne	0x14005b2c1 <.text+0x5a2c1>
14005b2e0:     	cmpq	%r14, %rbx
14005b2e3:     	je	0x14005b500 <.text+0x5a500>
14005b2e9:     	movl	(%rbx), %ecx
14005b2eb:     	addq	$0x4, %rbx
14005b2ef:     	movq	0x1a8(%rdi), %rax
14005b2f6:     	leaq	(%rcx,%rcx,8), %rcx
14005b2fa:     	movq	0x10(%rax,%rcx,8), %r13
14005b2ff:     	testq	%r13, %r13
14005b302:     	je	0x14005b2e0 <.text+0x5a2e0>
14005b304:     	leaq	(%rax,%rcx,8), %rax
14005b308:     	movq	0x48(%rsp), %rcx
14005b30d:     	movq	0x110(%rcx), %rdx
14005b314:     	movq	0x40(%rax), %rcx
14005b318:     	cmpq	%rcx, %rdx
14005b31b:     	jae	0x14005b34b <.text+0x5a34b>
14005b31d:     	movq	0x38(%rax), %r8
14005b321:     	movq	(%r8,%rdx,8), %rdx
14005b325:     	testq	%rdx, %rdx
14005b328:     	je	0x14005b34b <.text+0x5a34b>
14005b32a:     	movq	0x18(%rax), %r8
14005b32e:     	notq	%rdx
14005b331:     	leaq	(%rdx,%rdx,2), %rdx
14005b335:     	shlq	$0x4, %rdx
14005b339:     	movq	0x10(%r8,%rdx), %rdx
14005b33e:     	movq	%rdx, 0x40(%rsp)
14005b343:     	movb	$0x1, %dl
14005b345:     	movl	%edx, 0x30(%rsp)
14005b349:     	jmp	0x14005b353 <.text+0x5a353>
14005b34b:     	movl	$0x0, 0x30(%rsp)
14005b353:     	movq	0x48(%rsp), %rdx
14005b358:     	movq	0x118(%rdx), %rdx
14005b35f:     	xorl	%r12d, %r12d
14005b362:     	cmpq	%rcx, %rdx
14005b365:     	jae	0x14005b2ad <.text+0x5a2ad>
14005b36b:     	movq	0x38(%rax), %rcx
14005b36f:     	movq	(%rcx,%rdx,8), %rcx
14005b373:     	testq	%rcx, %rcx
14005b376:     	je	0x14005b2ad <.text+0x5a2ad>
14005b37c:     	movq	0x18(%rax), %rdx
14005b380:     	notq	%rcx
14005b383:     	leaq	(%rcx,%rcx,2), %rcx
14005b387:     	shlq	$0x4, %rcx
14005b38b:     	movq	0x10(%rdx,%rcx), %rcx
14005b390:     	movq	%rcx, 0x38(%rsp)
14005b395:     	movb	$0x1, %cl
14005b397:     	movl	%ecx, 0x2c(%rsp)
14005b39b:     	jmp	0x14005b2b5 <.text+0x5a2b5>
14005b3a0:     	movl	$0x0, 0x2c(%rsp)
14005b3a8:     	movq	0x50(%rax), %rax
14005b3ac:     	movq	%rax, 0x60(%rsp)
14005b3b1:     	movl	%r12d, %ecx
14005b3b4:     	shlq	$0x4, %rcx
14005b3b8:     	incl	%r12d
14005b3bb:     	movq	0x60(%rsp), %rax
14005b3c0:     	movq	(%rax,%rcx), %rax
14005b3c4:     	testl	%eax, %eax
14005b3c6:     	jne	0x14005b8a0 <.text+0x5a8a0>
14005b3cc:     	cmpl	%r13d, %r12d
14005b3cf:     	jne	0x14005b3b1 <.text+0x5a3b1>
14005b3d1:     	nopw	%cs:(%rax,%rax)
14005b3e0:     	cmpq	%r14, %rbx
14005b3e3:     	je	0x14005b500 <.text+0x5a500>
14005b3e9:     	movl	(%rbx), %ecx
14005b3eb:     	addq	$0x4, %rbx
14005b3ef:     	movq	0x108(%rdi), %rax
14005b3f6:     	leaq	(%rcx,%rcx,4), %rcx
14005b3fa:     	shlq	$0x5, %rcx
14005b3fe:     	movq	0x58(%rax,%rcx), %r13
14005b403:     	testq	%r13, %r13
14005b406:     	je	0x14005b3e0 <.text+0x5a3e0>
14005b408:     	addq	%rcx, %rax
14005b40b:     	movl	0x94(%rax), %ecx
14005b411:     	leaq	(%rcx,%rcx,8), %rcx
14005b415:     	shlq	$0x3, %rcx
14005b419:     	addq	0x1a8(%rdi), %rcx
14005b420:     	movq	0x48(%rsp), %rdx
14005b425:     	movq	0x110(%rdx), %r9
14005b42c:     	movq	0x80(%rax), %rdx
14005b433:     	movq	0x88(%rax), %r8
14005b43a:     	cmpq	%r8, %r9
14005b43d:     	jae	0x14005b47c <.text+0x5a47c>
14005b43f:     	cmpq	$0x0, (%rdx,%r9,8)
14005b444:     	je	0x14005b47c <.text+0x5a47c>
14005b446:     	movb	$0x1, %r10b
14005b449:     	movl	%r10d, 0x30(%rsp)
14005b44e:     	cmpq	0x40(%rcx), %r9
14005b452:     	jae	0x14005b486 <.text+0x5a486>
14005b454:     	movq	0x38(%rcx), %r10
14005b458:     	movq	(%r10,%r9,8), %r9
14005b45c:     	testq	%r9, %r9
14005b45f:     	je	0x14005b486 <.text+0x5a486>
14005b461:     	movq	0x18(%rcx), %r10
14005b465:     	notq	%r9
14005b468:     	leaq	(%r9,%r9,2), %r9
14005b46c:     	shlq	$0x4, %r9
14005b470:     	movq	0x10(%r10,%r9), %r9
14005b475:     	movq	%r9, 0x40(%rsp)
14005b47a:     	jmp	0x14005b48f <.text+0x5a48f>
14005b47c:     	movl	$0x0, 0x30(%rsp)
14005b484:     	jmp	0x14005b48f <.text+0x5a48f>
14005b486:     	movq	$0x0, 0x40(%rsp)
14005b48f:     	movq	0x48(%rsp), %r9
14005b494:     	movq	0x118(%r9), %r9
14005b49b:     	xorl	%r12d, %r12d
14005b49e:     	cmpq	%r8, %r9
14005b4a1:     	jae	0x14005b3a0 <.text+0x5a3a0>
14005b4a7:     	cmpq	$0x0, (%rdx,%r9,8)
14005b4ac:     	je	0x14005b3a0 <.text+0x5a3a0>
14005b4b2:     	movb	$0x1, %dl
14005b4b4:     	movl	%edx, 0x2c(%rsp)
14005b4b8:     	cmpq	0x40(%rcx), %r9
14005b4bc:     	jae	0x14005b4e9 <.text+0x5a4e9>
14005b4be:     	movq	0x38(%rcx), %rdx
14005b4c2:     	movq	(%rdx,%r9,8), %rdx
14005b4c6:     	testq	%rdx, %rdx
14005b4c9:     	je	0x14005b4e9 <.text+0x5a4e9>
14005b4cb:     	movq	0x18(%rcx), %rcx
14005b4cf:     	notq	%rdx
14005b4d2:     	leaq	(%rdx,%rdx,2), %rdx
14005b4d6:     	shlq	$0x4, %rdx
14005b4da:     	movq	0x10(%rcx,%rdx), %rcx
14005b4df:     	movq	%rcx, 0x38(%rsp)
14005b4e4:     	jmp	0x14005b3a8 <.text+0x5a3a8>
14005b4e9:     	movq	$0x0, 0x38(%rsp)
14005b4f2:     	jmp	0x14005b3a8 <.text+0x5a3a8>
14005b4f7:     	nopw	(%rax,%rax)
14005b500:     	movabsq	$-0x100000000, %rax     # imm = 0xFFFFFFFF00000000
14005b50a:     	andq	%rax, %r15
14005b50d:     	movl	%r12d, %r13d
14005b510:     	testl	%r15d, %r15d
14005b513:     	je	0x14005b16a <.text+0x5a16a>
14005b519:     	testq	%r11, %r11
14005b51c:     	movq	%r11, 0xb0(%rsp)
14005b524:     	je	0x14005b5d0 <.text+0x5a5d0>
14005b52a:     	movq	0x98(%rsp), %rdx
14005b532:     	leaq	0xc8(%rdx), %rax
14005b539:     	leaq	0xbc(%rdx), %rcx
14005b540:     	cmpb	$0x0, 0xb8(%rdx)
14005b547:     	cmovneq	%rcx, %rax
14005b54b:     	movl	0xc4(%rdx), %ecx
14005b551:     	xorps	%xmm0, %xmm0
14005b554:     	cvtsi2ss	%rcx, %xmm0
14005b559:     	movl	0xc0(%rdx), %ecx
14005b55f:     	xorps	%xmm1, %xmm1
14005b562:     	cvtsi2ss	%rcx, %xmm1
14005b567:     	movss	(%rax), %xmm2
14005b56b:     	divss	%xmm2, %xmm1
14005b56f:     	divss	(%r11), %xmm1
14005b574:     	divss	%xmm2, %xmm0
14005b578:     	divss	0x4(%r11), %xmm0
14005b57e:     	movaps	%xmm1, %xmm2
14005b581:     	minss	%xmm0, %xmm2
14005b585:     	movaps	%xmm2, %xmm0
14005b588:     	cmpunordss	%xmm2, %xmm0
14005b58d:     	movaps	%xmm0, %xmm3
14005b590:     	andnps	%xmm2, %xmm3
14005b593:     	andps	%xmm1, %xmm0
14005b596:     	orps	%xmm3, %xmm0
14005b599:     	movss	0x8(%r11), %xmm1
14005b59f:     	movaps	%xmm0, %xmm2
14005b5a2:     	minss	%xmm1, %xmm2
14005b5a6:     	movaps	%xmm2, %xmm10
14005b5aa:     	cmpunordss	%xmm2, %xmm10
14005b5b0:     	andps	%xmm10, %xmm0
14005b5b4:     	andnps	%xmm2, %xmm10
14005b5b8:     	orps	%xmm0, %xmm10
14005b5bc:     	maxss	%xmm9, %xmm10
14005b5c1:     	jmp	0x14005b690 <.text+0x5a690>
14005b5c6:     	nopw	%cs:(%rax,%rax)
14005b5d0:     	movq	0x90(%rsp), %rax
14005b5d8:     	testq	%rax, %rax
14005b5db:     	je	0x14005b675 <.text+0x5a675>
14005b5e1:     	movss	0x8(%rax), %xmm0
14005b5e6:     	ucomiss	%xmm0, %xmm7
14005b5e9:     	jb	0x14005b971 <.text+0x5a971>
14005b5ef:     	movq	0x98(%rsp), %rdx
14005b5f7:     	movq	%rax, %r8
14005b5fa:     	movl	0xc0(%rdx), %eax
14005b600:     	xorps	%xmm1, %xmm1
14005b603:     	cvtsi2ss	%rax, %xmm1
14005b608:     	leaq	0xc8(%rdx), %rax
14005b60f:     	leaq	0xbc(%rdx), %rcx
14005b616:     	cmpb	$0x0, 0xb8(%rdx)
14005b61d:     	cmovneq	%rcx, %rax
14005b621:     	movss	(%rax), %xmm2
14005b625:     	divss	%xmm2, %xmm1
14005b629:     	divss	(%r8), %xmm1
14005b62e:     	movl	0xc4(%rdx), %eax
14005b634:     	xorps	%xmm3, %xmm3
14005b637:     	cvtsi2ss	%rax, %xmm3
14005b63c:     	divss	%xmm2, %xmm3
14005b640:     	divss	0x4(%r8), %xmm3
14005b646:     	movaps	%xmm1, %xmm2
14005b649:     	minss	%xmm3, %xmm2
14005b64d:     	movaps	%xmm2, %xmm3
14005b650:     	cmpunordss	%xmm2, %xmm3
14005b655:     	movaps	%xmm3, %xmm4
14005b658:     	andnps	%xmm2, %xmm4
14005b65b:     	andps	%xmm1, %xmm3
14005b65e:     	orps	%xmm4, %xmm3
14005b661:     	divss	%xmm8, %xmm3
14005b666:     	maxss	%xmm3, %xmm0
14005b66a:     	movaps	%xmm7, %xmm10
14005b66e:     	minss	%xmm0, %xmm10
14005b673:     	jmp	0x14005b690 <.text+0x5a690>
14005b675:     	movq	0xe8(%rsp), %rax
14005b67d:     	movss	(%rax), %xmm10
14005b682:     	nopw	%cs:(%rax,%rax)
14005b690:     	leaq	0x148(%rsp), %rax
14005b698:     	movq	%rax, 0xb8(%rsp)
14005b6a0:     	movq	%r15, 0xc0(%rsp)
14005b6a8:     	xorl	%eax, %eax
14005b6aa:     	nopw	(%rax,%rax)
14005b6b0:     	movq	%rax, %rbp
14005b6b3:     	movq	%rsi, %rcx
14005b6b6:     	callq	0x14027f180 <.text+0x27e180>
14005b6bb:     	testl	%eax, %eax
14005b6bd:     	jne	0x14005b6b0 <.text+0x5a6b0>
14005b6bf:     	testl	%ebp, %ebp
14005b6c1:     	cmoveq	%r15, %rbp
14005b6c5:     	movl	%ebp, %ecx
14005b6c7:     	notl	%ecx
14005b6c9:     	movq	%rbp, %rdx
14005b6cc:     	shrq	$0x20, %rdx
14005b6d0:     	leaq	(%rcx,%rcx,2), %rax
14005b6d4:     	shlq	$0x3, %rax
14005b6d8:     	movq	0xa0(%rsp), %r8
14005b6e0:     	addq	0x8(%r8), %rax
14005b6e4:     	cmpq	0x10(%r8), %rcx
14005b6e8:     	leaq	0x5d15a31(%rip), %rcx   # 0x145d71120
14005b6ef:     	cmovaeq	%rcx, %rax
14005b6f3:     	cmpl	%edx, 0x10(%rax)
14005b6f6:     	jne	0x14005b280 <.text+0x5a280>
14005b6fc:     	cmpl	$0x0, (%rax)
14005b6ff:     	je	0x14005b280 <.text+0x5a280>
14005b705:     	movq	0x4(%rax), %rcx
14005b709:     	movq	%rcx, %rdx
14005b70c:     	shrq	$0x20, %rdx
14005b710:     	movq	0x58(%rsp), %r8
14005b715:     	cmpq	%rdx, 0x38(%r8)
14005b719:     	jbe	0x14005b280 <.text+0x5a280>
14005b71f:     	movq	%rcx, %r8
14005b722:     	shrq	$0x26, %r8
14005b726:     	movq	0x58(%rsp), %r9
14005b72b:     	movq	0x28(%r9), %r9
14005b72f:     	movq	(%r9,%r8,8), %r8
14005b733:     	btq	%rdx, %r8
14005b737:     	jae	0x14005b280 <.text+0x5a280>
14005b73d:     	movl	0xc(%rax), %eax
14005b740:     	movq	0xa0(%rsp), %rdx
14005b748:     	movq	0x1a8(%rdx), %rdx
14005b74f:     	leaq	(%rax,%rax,8), %rax
14005b753:     	movq	0x58(%rsp), %r8
14005b758:     	movq	0x110(%r8), %r8
14005b75f:     	movq	0x18(%rdx,%rax,8), %r9
14005b764:     	movq	0x38(%rdx,%rax,8), %rax
14005b769:     	movq	(%rax,%r8,8), %rax
14005b76d:     	notq	%rax
14005b770:     	leaq	(%rax,%rax,2), %rax
14005b774:     	shlq	$0x4, %rax
14005b778:     	notl	%ecx
14005b77a:     	shlq	$0x3, %rcx
14005b77e:     	addq	0x10(%r9,%rax), %rcx
14005b783:     	callq	0x1426330d0 <.text+0x26320d0>
14005b788:     	movq	%rax, %rdx
14005b78b:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
14005b790:     	andq	%rcx, %rdx
14005b793:     	je	0x14005b280 <.text+0x5a280>
14005b799:     	shrq	$0x20, %rax
14005b79d:     	xorq	%rcx, %rdx
14005b7a0:     	leaq	(%rdx,%rdx,2), %rcx
14005b7a4:     	shlq	$0x3, %rcx
14005b7a8:     	movq	0x88(%rsp), %r8
14005b7b0:     	addq	0x8(%r8), %rcx
14005b7b4:     	cmpq	0x10(%r8), %rdx
14005b7b8:     	leaq	0x5d15961(%rip), %rdx   # 0x145d71120
14005b7bf:     	cmovaeq	%rdx, %rcx
14005b7c3:     	cmpl	%eax, 0x10(%rcx)
14005b7c6:     	jne	0x14005b280 <.text+0x5a280>
14005b7cc:     	cmpl	$0x0, (%rcx)
14005b7cf:     	je	0x14005b280 <.text+0x5a280>
14005b7d5:     	movq	0x4(%rcx), %rax
14005b7d9:     	movq	%rax, %rdx
14005b7dc:     	shrq	$0x20, %rdx
14005b7e0:     	movq	0x50(%rsp), %r8
14005b7e5:     	cmpq	%rdx, 0x38(%r8)
14005b7e9:     	jbe	0x14005b280 <.text+0x5a280>
14005b7ef:     	movq	%rax, %r8
14005b7f2:     	shrq	$0x26, %r8
14005b7f6:     	movq	0x50(%rsp), %r9
14005b7fb:     	movq	0x28(%r9), %r9
14005b7ff:     	movq	(%r9,%r8,8), %r8
14005b803:     	btq	%rdx, %r8
14005b807:     	jae	0x14005b280 <.text+0x5a280>
14005b80d:     	movl	0xc(%rcx), %ecx
14005b810:     	movq	0x88(%rsp), %rdx
14005b818:     	movq	0x1a8(%rdx), %rdx
14005b81f:     	leaq	(%rcx,%rcx,8), %rcx
14005b823:     	movq	0x50(%rsp), %r8
14005b828:     	movq	0x110(%r8), %r8
14005b82f:     	movq	0x18(%rdx,%rcx,8), %r9
14005b834:     	movq	0x38(%rdx,%rcx,8), %rcx
14005b839:     	movq	(%rcx,%r8,8), %rcx
14005b83d:     	notq	%rcx
14005b840:     	leaq	(%rcx,%rcx,2), %rcx
14005b844:     	shlq	$0x4, %rcx
14005b848:     	movq	0x10(%r9,%rcx), %rcx
14005b84d:     	notl	%eax
14005b84f:     	imulq	$0x110, %rax, %rdx      # imm = 0x110
14005b856:     	leaq	(%rcx,%rdx), %rax
14005b85a:     	cmpl	$0x1, (%rcx,%rdx)
14005b85e:     	jne	0x14005b8f0 <.text+0x5a8f0>
14005b864:     	movss	0xc(%rax), %xmm0
14005b869:     	movq	0x80(%rsp), %rcx
14005b871:     	mulss	(%rcx), %xmm0
14005b875:     	cmpb	$0x0, 0x88(%rax)
14005b87c:     	movl	$0x4, %ecx
14005b881:     	movl	$0x94, %edx
14005b886:     	cmovneq	%rdx, %rcx
14005b88a:     	mulss	%xmm0, %xmm10
14005b88f:     	movl	$0x8, %edx
14005b894:     	movl	$0x98, %r8d
14005b89a:     	cmovneq	%r8, %rdx
14005b89e:     	jmp	0x14005b912 <.text+0x5a912>
14005b8a0:     	addq	0x60(%rsp), %rcx
14005b8a5:     	movl	0x8(%rcx), %ecx
14005b8a8:     	notl	%ecx
14005b8aa:     	shlq	$0x2, %rcx
14005b8ae:     	leaq	(%rcx,%rcx,2), %rdx
14005b8b2:     	movq	0x40(%rsp), %rcx
14005b8b7:     	leaq	(%rcx,%rdx), %r11
14005b8bb:     	testb	$0x1, 0x30(%rsp)
14005b8c0:     	movl	$0x0, %ecx
14005b8c5:     	cmoveq	%rcx, %r11
14005b8c9:     	addq	0x38(%rsp), %rdx
14005b8ce:     	testb	$0x1, 0x2c(%rsp)
14005b8d3:     	cmoveq	%rcx, %rdx
14005b8d7:     	movq	%rdx, 0x90(%rsp)
14005b8df:     	movq	%rax, %r15
14005b8e2:     	testl	%r15d, %r15d
14005b8e5:     	jne	0x14005b519 <.text+0x5a519>
14005b8eb:     	jmp	0x14005b16a <.text+0x5a16a>
14005b8f0:     	movq	0x80(%rsp), %rcx
14005b8f8:     	mulss	(%rcx), %xmm10
14005b8fd:     	xorl	%ecx, %ecx
14005b8ff:     	cmpl	$0x1, 0x88(%rax)
14005b906:     	jne	0x14005b91a <.text+0x5a91a>
14005b908:     	movl	$0x98, %edx
14005b90d:     	movl	$0x94, %ecx
14005b912:     	movl	(%rax,%rcx), %ecx
14005b915:     	movl	(%rax,%rdx), %eax
14005b918:     	jmp	0x14005b91c <.text+0x5a91c>
14005b91a:     	xorl	%eax, %eax
14005b91c:     	movl	%ecx, 0x70(%rsp)
14005b920:     	movl	%eax, 0x74(%rsp)
14005b924:     	movss	%xmm10, 0x78(%rsp)
14005b92b:     	leaq	0x148(%rsp), %rcx
14005b933:     	movq	-0x38(%rcx), %rax
14005b937:     	leaq	0xd0(%rsp), %rdx
14005b93f:     	movq	%rax, 0x10(%rdx)
14005b943:     	movups	-0x48(%rcx), %xmm0
14005b947:     	movups	%xmm0, (%rdx)
14005b94a:     	movq	%rbp, 0xb8(%rsp)
14005b952:     	movups	%xmm6, 0xc0(%rsp)
14005b95a:     	movb	$0x0, 0x7c(%rsp)
14005b95f:     	movq	%rsi, %rcx
14005b962:     	leaq	0x70(%rsp), %rdx
14005b967:     	callq	0x1401a3980 <.text+0x1a2980>
14005b96c:     	jmp	0x14005b280 <.text+0x5a280>
14005b971:     	movss	%xmm0, 0x6c(%rsp)
14005b977:     	movl	$0x3f800000, 0x70(%rsp) # imm = 0x3F800000
14005b97f:     	leaq	0x6c(%rsp), %rax
14005b984:     	movq	%rax, 0xb8(%rsp)
14005b98c:     	leaq	0x5b50e1d(%rip), %rax   # 0x145bac7b0 <.text+0x5bab7b0>
14005b993:     	movq	%rax, 0xc0(%rsp)
14005b99b:     	leaq	0x70(%rsp), %rcx
14005b9a0:     	movq	%rcx, 0xc8(%rsp)
14005b9a8:     	movq	%rax, 0xd0(%rsp)
14005b9b0:     	leaq	0x5d156a1(%rip), %rcx   # 0x145d71058
14005b9b7:     	leaq	0x5d1571a(%rip), %r8    # 0x145d710d8
14005b9be:     	leaq	0xb8(%rsp), %rdx
14005b9c6:     	callq	0x145d699c0 <.text+0x5d689c0>
14005b9cb:     	ud2

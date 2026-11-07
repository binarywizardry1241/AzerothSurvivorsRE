
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14021aed0:     	pushq	%rbp
14021aed1:     	pushq	%r15
14021aed3:     	pushq	%r14
14021aed5:     	pushq	%r13
14021aed7:     	pushq	%r12
14021aed9:     	pushq	%rsi
14021aeda:     	pushq	%rdi
14021aedb:     	pushq	%rbx
14021aedc:     	subq	$0x578, %rsp            # imm = 0x578
14021aee3:     	leaq	0x80(%rsp), %rbp
14021aeeb:     	movaps	%xmm6, 0x4e0(%rbp)
14021aef2:     	movq	$-0x2, 0x4d8(%rbp)
14021aefd:     	movq	0x568(%rbp), %rax
14021af04:     	movq	0x580(%rbp), %rcx
14021af0b:     	movq	0x578(%rbp), %r10
14021af12:     	movq	0x570(%rbp), %r11
14021af19:     	movq	0x560(%rbp), %rsi
14021af20:     	movq	0x20(%rdx), %rdi
14021af24:     	movq	%rdi, 0x310(%rbp)
14021af2b:     	movups	(%rdx), %xmm0
14021af2e:     	movups	0x10(%rdx), %xmm1
14021af32:     	movaps	%xmm1, 0x300(%rbp)
14021af39:     	movaps	%xmm0, 0x2f0(%rbp)
14021af40:     	movups	(%r8), %xmm0
14021af44:     	movups	0x10(%r8), %xmm1
14021af49:     	movups	%xmm1, 0x328(%rbp)
14021af50:     	movups	%xmm0, 0x318(%rbp)
14021af57:     	movups	(%r9), %xmm0
14021af5b:     	movups	0x10(%r9), %xmm1
14021af60:     	movups	%xmm1, 0x348(%rbp)
14021af67:     	movups	%xmm0, 0x338(%rbp)
14021af6e:     	movq	0x10(%rsi), %rdx
14021af72:     	movq	%rdx, 0x368(%rbp)
14021af79:     	movups	(%rsi), %xmm0
14021af7c:     	movups	%xmm0, 0x358(%rbp)
14021af83:     	movups	(%rax), %xmm0
14021af86:     	movups	0x10(%rax), %xmm1
14021af8a:     	movaps	%xmm1, 0x3c0(%rbp)
14021af91:     	movaps	%xmm0, 0x3b0(%rbp)
14021af98:     	movups	(%r11), %xmm0
14021af9c:     	movups	0x10(%r11), %xmm1
14021afa1:     	movaps	%xmm0, 0x370(%rbp)
14021afa8:     	movaps	%xmm1, 0x380(%rbp)
14021afaf:     	movups	(%r10), %xmm0
14021afb3:     	movups	0x10(%r10), %xmm1
14021afb8:     	movaps	%xmm0, 0x390(%rbp)
14021afbf:     	movaps	%xmm1, 0x3a0(%rbp)
14021afc6:     	movups	(%rcx), %xmm0
14021afc9:     	movups	0x10(%rcx), %xmm1
14021afcd:     	movaps	%xmm1, 0x3e0(%rbp)
14021afd4:     	movaps	%xmm0, 0x3d0(%rbp)
14021afdb:     	movq	0x318(%rbp), %r8
14021afe2:     	movq	0x338(%rbp), %r12
14021afe9:     	movl	0xe0(%r8), %ecx
14021aff0:     	cmpl	0x40(%r12), %ecx
14021aff5:     	je	0x14021be2b <.text+0x21ae2b>
14021affb:     	movq	0x3d0(%rbp), %rdx
14021b002:     	movss	0x5c(%rdx), %xmm6
14021b007:     	cmpl	$0x1, 0x10(%r12)
14021b00d:     	jne	0x14021b02a <.text+0x21a02a>
14021b00f:     	movaps	%xmm6, %xmm0
14021b012:     	subss	0x14(%r12), %xmm0
14021b019:     	movss	0x5724f3f(%rip), %xmm1  # 0x14593ff60
14021b021:     	ucomiss	%xmm0, %xmm1
14021b024:     	ja	0x14021be2b <.text+0x21ae2b>
14021b02a:     	cmpq	$0x0, 0x3b0(%rbp)
14021b032:     	je	0x14021be2b <.text+0x21ae2b>
14021b038:     	movq	%r8, 0x4a0(%rbp)
14021b03f:     	movups	(%rax), %xmm0
14021b042:     	movups	0x10(%rax), %xmm1
14021b046:     	movaps	%xmm1, -0x40(%rbp)
14021b04a:     	movaps	%xmm0, -0x50(%rbp)
14021b04e:     	movl	0x354(%rbp), %eax
14021b054:     	movq	0x348(%rbp), %rdx
14021b05b:     	movl	%ecx, 0x40(%r12)
14021b060:     	movl	$0x0, 0x10(%r12)
14021b069:     	movl	%eax, 0x4c8(%rbp)
14021b06f:     	movq	%rdx, 0x4c0(%rbp)
14021b076:     	movl	%eax, (%rdx)
14021b078:     	movq	$0x0, (%r12)
14021b080:     	movq	0x360(%rbp), %r14
14021b087:     	movq	0x358(%rbp), %rax
14021b08e:     	movq	0xf8(%rax), %rdi
14021b095:     	movq	0x100(%rax), %rcx
14021b09c:     	leaq	(%rdi,%rcx,4), %rbx
14021b0a0:     	movq	0x300(%rbp), %r10
14021b0a7:     	movq	0x310(%rbp), %r11
14021b0ae:     	movq	0x308(%rbp), %r8
14021b0b5:     	movq	0x2f0(%rbp), %r9
14021b0bc:     	movq	0x2f8(%rbp), %rdx
14021b0c3:     	cmpb	$0x1, 0x108(%rax)
14021b0ca:     	jne	0x14021b1d9 <.text+0x21a1d9>
14021b0d0:     	xorl	%r13d, %r13d
14021b0d3:     	movl	$0x8, %r15d
14021b0d9:     	xorl	%esi, %esi
14021b0db:     	cmpl	%r13d, %esi
14021b0de:     	je	0x14021b100 <.text+0x21a100>
14021b0e0:     	movl	%esi, %eax
14021b0e2:     	incl	%esi
14021b0e4:     	movq	(%r15,%rax,8), %rax
14021b0e8:     	testl	%eax, %eax
14021b0ea:     	jne	0x14021b130 <.text+0x21a130>
14021b0ec:     	cmpl	%r13d, %esi
14021b0ef:     	jne	0x14021b0e0 <.text+0x21a0e0>
14021b0f1:     	nopw	%cs:(%rax,%rax)
14021b100:     	cmpq	%rbx, %rdi
14021b103:     	je	0x14021b3cd <.text+0x21a3cd>
14021b109:     	movl	(%rdi), %ecx
14021b10b:     	addq	$0x4, %rdi
14021b10f:     	movq	0x1a8(%r14), %rax
14021b116:     	leaq	(%rcx,%rcx,8), %rcx
14021b11a:     	movq	0x10(%rax,%rcx,8), %r13
14021b11f:     	testq	%r13, %r13
14021b122:     	je	0x14021b100 <.text+0x21a100>
14021b124:     	leaq	(%rax,%rcx,8), %rax
14021b128:     	movq	0x8(%rax), %r15
14021b12c:     	xorl	%esi, %esi
14021b12e:     	jmp	0x14021b0e0 <.text+0x21a0e0>
14021b130:     	testq	%r10, %r10
14021b133:     	movq	0x418(%rbp), %rcx
14021b13a:     	cmovneq	%r11, %rcx
14021b13e:     	movq	%rax, 0x150(%rbp)
14021b145:     	movq	%r9, 0x158(%rbp)
14021b14c:     	movq	%rdx, %rax
14021b14f:     	movq	%rdx, 0x160(%rbp)
14021b156:     	movq	%r10, 0x168(%rbp)
14021b15d:     	movq	%r8, 0x170(%rbp)
14021b164:     	movq	%rcx, 0x418(%rbp)
14021b16b:     	movq	%rcx, 0x178(%rbp)
14021b172:     	leaq	0x150(%rbp), %rcx
14021b179:     	movq	%r8, 0x4b8(%rbp)
14021b180:     	leaq	0x5731911(%rip), %rdx   # 0x14594ca98
14021b187:     	movq	%r9, 0x4a8(%rbp)
14021b18e:     	movq	%rax, 0x498(%rbp)
14021b195:     	movq	%r10, 0x450(%rbp)
14021b19c:     	movq	%r11, 0x458(%rbp)
14021b1a3:     	callq	0x144e74f30 <.text+0x4e73f30>
14021b1a8:     	movq	0x458(%rbp), %r11
14021b1af:     	movq	0x450(%rbp), %r10
14021b1b6:     	movq	0x498(%rbp), %rdx
14021b1bd:     	movq	0x4a8(%rbp), %r9
14021b1c4:     	movq	0x4b8(%rbp), %r8
14021b1cb:     	cmpl	%r13d, %esi
14021b1ce:     	je	0x14021b100 <.text+0x21a100>
14021b1d4:     	jmp	0x14021b0e0 <.text+0x21a0e0>
14021b1d9:     	testq	%r10, %r10
14021b1dc:     	je	0x14021b2e7 <.text+0x21a2e7>
14021b1e2:     	xorl	%r13d, %r13d
14021b1e5:     	movl	$0x8, %r15d
14021b1eb:     	xorl	%esi, %esi
14021b1ed:     	cmpl	%r13d, %esi
14021b1f0:     	je	0x14021b220 <.text+0x21a220>
14021b1f2:     	nopw	%cs:(%rax,%rax)
14021b200:     	movl	%esi, %eax
14021b202:     	shlq	$0x4, %rax
14021b206:     	incl	%esi
14021b208:     	movq	(%r15,%rax), %rax
14021b20c:     	testl	%eax, %eax
14021b20e:     	jne	0x14021b253 <.text+0x21a253>
14021b210:     	cmpl	%r13d, %esi
14021b213:     	jne	0x14021b200 <.text+0x21a200>
14021b215:     	nopw	%cs:(%rax,%rax)
14021b220:     	cmpq	%rbx, %rdi
14021b223:     	je	0x14021b3cd <.text+0x21a3cd>
14021b229:     	movl	(%rdi), %ecx
14021b22b:     	addq	$0x4, %rdi
14021b22f:     	movq	0x108(%r14), %rax
14021b236:     	leaq	(%rcx,%rcx,4), %rcx
14021b23a:     	shlq	$0x5, %rcx
14021b23e:     	movq	0x58(%rax,%rcx), %r13
14021b243:     	testq	%r13, %r13
14021b246:     	je	0x14021b220 <.text+0x21a220>
14021b248:     	addq	%rcx, %rax
14021b24b:     	movq	0x50(%rax), %r15
14021b24f:     	xorl	%esi, %esi
14021b251:     	jmp	0x14021b200 <.text+0x21a200>
14021b253:     	movq	%rax, 0x150(%rbp)
14021b25a:     	movq	%r9, 0x158(%rbp)
14021b261:     	movq	%rdx, %rax
14021b264:     	movq	%rdx, 0x160(%rbp)
14021b26b:     	movq	%r10, 0x168(%rbp)
14021b272:     	movq	%r8, 0x170(%rbp)
14021b279:     	movq	%r11, 0x178(%rbp)
14021b280:     	leaq	0x150(%rbp), %rcx
14021b287:     	movq	%r8, 0x4b8(%rbp)
14021b28e:     	leaq	0x5731803(%rip), %rdx   # 0x14594ca98
14021b295:     	movq	%r9, 0x4a8(%rbp)
14021b29c:     	movq	%rax, 0x498(%rbp)
14021b2a3:     	movq	%r10, 0x450(%rbp)
14021b2aa:     	movq	%r11, 0x458(%rbp)
14021b2b1:     	callq	0x144e74f30 <.text+0x4e73f30>
14021b2b6:     	movq	0x458(%rbp), %r11
14021b2bd:     	movq	0x450(%rbp), %r10
14021b2c4:     	movq	0x498(%rbp), %rdx
14021b2cb:     	movq	0x4a8(%rbp), %r9
14021b2d2:     	movq	0x4b8(%rbp), %r8
14021b2d9:     	cmpl	%r13d, %esi
14021b2dc:     	je	0x14021b220 <.text+0x21a220>
14021b2e2:     	jmp	0x14021b200 <.text+0x21a200>
14021b2e7:     	xorl	%r15d, %r15d
14021b2ea:     	movl	$0x8, %esi
14021b2ef:     	leaq	0x57317a2(%rip), %r10   # 0x14594ca98
14021b2f6:     	leaq	0x150(%rbp), %rcx
14021b2fd:     	xorl	%r13d, %r13d
14021b300:     	cmpl	%r15d, %r13d
14021b303:     	je	0x14021b320 <.text+0x21a320>
14021b305:     	movl	%r13d, %eax
14021b308:     	shlq	$0x4, %rax
14021b30c:     	incl	%r13d
14021b30f:     	movq	(%rsi,%rax), %rax
14021b313:     	testl	%eax, %eax
14021b315:     	jne	0x14021b355 <.text+0x21a355>
14021b317:     	cmpl	%r15d, %r13d
14021b31a:     	jne	0x14021b305 <.text+0x21a305>
14021b31c:     	nopl	(%rax)
14021b320:     	cmpq	%rbx, %rdi
14021b323:     	je	0x14021b3cd <.text+0x21a3cd>
14021b329:     	movl	(%rdi), %r11d
14021b32c:     	addq	$0x4, %rdi
14021b330:     	movq	0x108(%r14), %rax
14021b337:     	leaq	(%r11,%r11,4), %r11
14021b33b:     	shlq	$0x5, %r11
14021b33f:     	movq	0x58(%rax,%r11), %r15
14021b344:     	testq	%r15, %r15
14021b347:     	je	0x14021b320 <.text+0x21a320>
14021b349:     	addq	%r11, %rax
14021b34c:     	movq	0x50(%rax), %rsi
14021b350:     	xorl	%r13d, %r13d
14021b353:     	jmp	0x14021b305 <.text+0x21a305>
14021b355:     	movq	%rax, 0x150(%rbp)
14021b35c:     	movq	%r9, 0x158(%rbp)
14021b363:     	movq	%rdx, %rax
14021b366:     	movq	%rdx, 0x160(%rbp)
14021b36d:     	movq	$0x0, 0x168(%rbp)
14021b378:     	movq	%r8, 0x170(%rbp)
14021b37f:     	movq	%r8, 0x4b8(%rbp)
14021b386:     	movq	%r10, %rdx
14021b389:     	movq	%r9, 0x4a8(%rbp)
14021b390:     	movq	%rax, 0x498(%rbp)
14021b397:     	callq	0x144e74f30 <.text+0x4e73f30>
14021b39c:     	leaq	0x150(%rbp), %rcx
14021b3a3:     	leaq	0x57316ee(%rip), %r10   # 0x14594ca98
14021b3aa:     	movq	0x498(%rbp), %rdx
14021b3b1:     	movq	0x4a8(%rbp), %r9
14021b3b8:     	movq	0x4b8(%rbp), %r8
14021b3bf:     	cmpl	%r15d, %r13d
14021b3c2:     	je	0x14021b320 <.text+0x21a320>
14021b3c8:     	jmp	0x14021b305 <.text+0x21a305>
14021b3cd:     	movq	0x4a0(%rbp), %rsi
14021b3d4:     	cmpb	$-0x1, 0x80(%rsi)
14021b3db:     	je	0x14021b437 <.text+0x21a437>
14021b3dd:     	subq	$-0x80, %rsi
14021b3e1:     	leaq	0x57315a0(%rip), %rcx   # 0x14594c988
14021b3e8:     	movl	$0x7, %edx
14021b3ed:     	movq	%rsi, %r8
14021b3f0:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b3f5:     	testq	%rax, %rax
14021b3f8:     	jne	0x14021b401 <.text+0x21a401>
14021b3fa:     	movq	0x77f23b7(%rip), %rax   # 0x147a0d7b8
14021b401:     	cmpb	$0x4, (%rax)
14021b404:     	jne	0x14021b454 <.text+0x21a454>
14021b406:     	addq	$0x8, %rax
14021b40a:     	leaq	0x150(%rbp), %rcx
14021b411:     	movq	%rax, %rdx
14021b414:     	callq	0x1401b4d40 <.text+0x1b3d40>
14021b419:     	movq	0x160(%rbp), %rax
14021b420:     	movq	%rax, 0x490(%rbp)
14021b427:     	movups	0x150(%rbp), %xmm0
14021b42e:     	movaps	%xmm0, 0x480(%rbp)
14021b435:     	jmp	0x14021b475 <.text+0x21a475>
14021b437:     	movl	0x4c8(%rbp), %eax
14021b43d:     	movq	0x4c0(%rbp), %rcx
14021b444:     	movl	%eax, (%rcx)
14021b446:     	movq	$0x0, 0x18(%r12)
14021b44f:     	jmp	0x14021be2b <.text+0x21ae2b>
14021b454:     	movq	$0x0, 0x480(%rbp)
14021b45f:     	movq	$0x8, 0x488(%rbp)
14021b46a:     	movq	$0x0, 0x490(%rbp)
14021b475:     	leaq	0x5731513(%rip), %rcx   # 0x14594c98f
14021b47c:     	movl	$0x3, %edx
14021b481:     	movq	%rsi, %r13
14021b484:     	movq	%rsi, %r8
14021b487:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b48c:     	nop
14021b48d:     	testq	%rax, %rax
14021b490:     	jne	0x14021b499 <.text+0x21a499>
14021b492:     	movq	0x77f231f(%rip), %rax   # 0x147a0d7b8
14021b499:     	cmpb	$0x3, (%rax)
14021b49c:     	jne	0x14021b4a8 <.text+0x21a4a8>
14021b49e:     	movq	0x10(%rax), %r15
14021b4a2:     	movq	0x18(%rax), %rax
14021b4a6:     	jmp	0x14021b4b4 <.text+0x21a4b4>
14021b4a8:     	leaq	0x57314e3(%rip), %r15   # 0x14594c992
14021b4af:     	movl	$0x7, %eax
14021b4b4:     	movq	%rax, 0x4a0(%rbp)
14021b4bb:     	movq	0x490(%rbp), %r14
14021b4c2:     	movl	0x4c8(%rbp), %eax
14021b4c8:     	movq	0x4c0(%rbp), %rcx
14021b4cf:     	movl	%eax, (%rcx)
14021b4d1:     	movq	%r14, 0x18(%r12)
14021b4d6:     	leaq	0x57314bc(%rip), %rcx   # 0x14594c999
14021b4dd:     	movl	$0x7, %edx
14021b4e2:     	movq	%r13, %r8
14021b4e5:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b4ea:     	nop
14021b4eb:     	testq	%rax, %rax
14021b4ee:     	jne	0x14021b4f7 <.text+0x21a4f7>
14021b4f0:     	movq	0x77f22c1(%rip), %rax   # 0x147a0d7b8
14021b4f7:     	cmpb	$0x2, (%rax)
14021b4fa:     	jne	0x14021b507 <.text+0x21a507>
14021b4fc:     	cmpq	$0x0, 0x8(%rax)
14021b501:     	je	0x14021b79d <.text+0x21a79d>
14021b507:     	xorl	%eax, %eax
14021b509:     	movq	%rax, 0x20(%r12)
14021b50e:     	movl	0x4c8(%rbp), %eax
14021b514:     	movq	0x4c0(%rbp), %rcx
14021b51b:     	movl	%eax, (%rcx)
14021b51d:     	movb	$0x1, 0x48(%r12)
14021b523:     	leaq	0x5731476(%rip), %rcx   # 0x14594c9a0
14021b52a:     	movl	$0xa, %edx
14021b52f:     	movq	%r13, %r8
14021b532:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b537:     	nop
14021b538:     	testq	%rax, %rax
14021b53b:     	jne	0x14021b544 <.text+0x21a544>
14021b53d:     	movq	0x77f2274(%rip), %rax   # 0x147a0d7b8
14021b544:     	movq	$-0x1, %rcx
14021b54b:     	cmpb	$0x2, (%rax)
14021b54e:     	jne	0x14021b55b <.text+0x21a55b>
14021b550:     	cmpq	$0x0, 0x8(%rax)
14021b555:     	jne	0x14021b55b <.text+0x21a55b>
14021b557:     	movq	0x10(%rax), %rcx
14021b55b:     	movl	0x4c8(%rbp), %eax
14021b561:     	movq	0x4c0(%rbp), %rdx
14021b568:     	movl	%eax, (%rdx)
14021b56a:     	movq	%rcx, 0x28(%r12)
14021b56f:     	leaq	0x5731227(%rip), %rcx   # 0x14594c79d
14021b576:     	movl	$0x4, %edx
14021b57b:     	movq	%r13, %r8
14021b57e:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b583:     	nop
14021b584:     	testq	%rax, %rax
14021b587:     	jne	0x14021b590 <.text+0x21a590>
14021b589:     	movq	0x77f2228(%rip), %rax   # 0x147a0d7b8
14021b590:     	cmpb	$0x2, (%rax)
14021b593:     	jne	0x14021b5a0 <.text+0x21a5a0>
14021b595:     	cmpq	$0x0, 0x8(%rax)
14021b59a:     	je	0x14021b7a6 <.text+0x21a7a6>
14021b5a0:     	xorl	%eax, %eax
14021b5a2:     	movl	0x4c8(%rbp), %ecx
14021b5a8:     	movq	0x4c0(%rbp), %rdx
14021b5af:     	movl	%ecx, (%rdx)
14021b5b1:     	movq	%rax, 0x30(%r12)
14021b5b6:     	leaq	0x57313ed(%rip), %rcx   # 0x14594c9aa
14021b5bd:     	movl	$0x8, %edx
14021b5c2:     	movq	%r13, %r8
14021b5c5:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b5ca:     	nop
14021b5cb:     	testq	%rax, %rax
14021b5ce:     	jne	0x14021b5d7 <.text+0x21a5d7>
14021b5d0:     	movq	0x77f21e1(%rip), %rax   # 0x147a0d7b8
14021b5d7:     	cmpb	$0x2, (%rax)
14021b5da:     	jne	0x14021b5e7 <.text+0x21a5e7>
14021b5dc:     	cmpq	$0x0, 0x8(%rax)
14021b5e1:     	je	0x14021b7af <.text+0x21a7af>
14021b5e7:     	xorl	%eax, %eax
14021b5e9:     	movl	0x4c8(%rbp), %ecx
14021b5ef:     	movq	0x4c0(%rbp), %rdx
14021b5f6:     	movl	%ecx, (%rdx)
14021b5f8:     	movq	%rax, 0x38(%r12)
14021b5fd:     	leaq	0x57313ae(%rip), %rcx   # 0x14594c9b2
14021b604:     	movl	$0x4, %edx
14021b609:     	movq	%r13, %r8
14021b60c:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b611:     	nop
14021b612:     	testq	%rax, %rax
14021b615:     	jne	0x14021b61e <.text+0x21a61e>
14021b617:     	movq	0x77f219a(%rip), %rax   # 0x147a0d7b8
14021b61e:     	cmpb	$0x1, (%rax)
14021b621:     	jne	0x14021b676 <.text+0x21a676>
14021b623:     	cmpb	$0x1, 0x1(%rax)
14021b627:     	jne	0x14021b676 <.text+0x21a676>
14021b629:     	leaq	0x5730af6(%rip), %rcx   # 0x14594c126
14021b630:     	movl	$0x8, %edx
14021b635:     	movq	%r13, %r8
14021b638:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b63d:     	nop
14021b63e:     	testq	%rax, %rax
14021b641:     	jne	0x14021b64a <.text+0x21a64a>
14021b643:     	movq	0x77f216e(%rip), %rax   # 0x147a0d7b8
14021b64a:     	cmpb	$0x2, (%rax)
14021b64d:     	jne	0x14021b65a <.text+0x21a65a>
14021b64f:     	cmpq	$0x0, 0x8(%rax)
14021b654:     	je	0x14021bf02 <.text+0x21af02>
14021b65a:     	xorl	%eax, %eax
14021b65c:     	movq	%rax, 0x410(%rbp)
14021b663:     	movl	$0x1, %eax
14021b668:     	movq	%rax, 0x408(%rbp)
14021b66f:     	testq	%r14, %r14
14021b672:     	jne	0x14021b684 <.text+0x21a684>
14021b674:     	jmp	0x14021b6e1 <.text+0x21a6e1>
14021b676:     	xorl	%eax, %eax
14021b678:     	movq	%rax, 0x408(%rbp)
14021b67f:     	testq	%r14, %r14
14021b682:     	je	0x14021b6e1 <.text+0x21a6e1>
14021b684:     	movq	0x488(%rbp), %rdi
14021b68b:     	shlq	$0x5, %r14
14021b68f:     	addq	%rdi, %r14
14021b692:     	leaq	0x5730a87(%rip), %rbx   # 0x14594c120
14021b699:     	movq	0x77f2118(%rip), %rsi   # 0x147a0d7b8
14021b6a0:     	jmp	0x14021b6b9 <.text+0x21a6b9>
14021b6a2:     	nopw	%cs:(%rax,%rax)
14021b6b0:     	addq	$0x20, %rdi
14021b6b4:     	cmpq	%r14, %rdi
14021b6b7:     	je	0x14021b6e1 <.text+0x21a6e1>
14021b6b9:     	movl	$0x6, %edx
14021b6be:     	movq	%rbx, %rcx
14021b6c1:     	movq	%rdi, %r8
14021b6c4:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b6c9:     	nop
14021b6ca:     	testq	%rax, %rax
14021b6cd:     	jne	0x14021b6d2 <.text+0x21a6d2>
14021b6cf:     	movq	%rsi, %rax
14021b6d2:     	cmpb	$0x1, (%rax)
14021b6d5:     	jne	0x14021b6b0 <.text+0x21a6b0>
14021b6d7:     	cmpb	$0x0, 0x1(%rax)
14021b6db:     	je	0x14021b6b0 <.text+0x21a6b0>
14021b6dd:     	movb	$0x1, %al
14021b6df:     	jmp	0x14021b6e3 <.text+0x21a6e3>
14021b6e1:     	xorl	%eax, %eax
14021b6e3:     	movb	%al, 0x4b7(%rbp)
14021b6e9:     	movl	0x4c8(%rbp), %eax
14021b6ef:     	movq	0x4c0(%rbp), %rcx
14021b6f6:     	movl	%eax, (%rcx)
14021b6f8:     	movss	%xmm6, 0x44(%r12)
14021b6ff:     	movq	0x4a0(%rbp), %rax
14021b706:     	cmpq	$0x8, %rax
14021b70a:     	je	0x14021b747 <.text+0x21a747>
14021b70c:     	cmpq	$0x5, %rax
14021b710:     	jne	0x14021b780 <.text+0x21a780>
14021b712:     	movl	$0x68636163, %eax       # imm = 0x68636163
14021b717:     	xorl	(%r15), %eax
14021b71a:     	movzbl	0x4(%r15), %ecx
14021b71f:     	xorl	$0x65, %ecx
14021b722:     	orl	%eax, %ecx
14021b724:     	je	0x14021b7b8 <.text+0x21a7b8>
14021b72a:     	movups	0x5730fbf(%rip), %xmm0  # 0x14594c6f0
14021b731:     	movaps	%xmm0, 0x460(%rbp)
14021b738:     	movl	$0x3f800000, 0x470(%rbp) # imm = 0x3F800000
14021b742:     	jmp	0x14021b7d0 <.text+0x21a7d0>
14021b747:     	movabsq	$0x6e61696472617567, %rax # imm = 0x6E61696472617567
14021b751:     	cmpq	%rax, (%r15)
14021b754:     	je	0x14021b81f <.text+0x21a81f>
14021b75a:     	movups	0x5730f8f(%rip), %xmm0  # 0x14594c6f0
14021b761:     	movaps	%xmm0, 0x460(%rbp)
14021b768:     	movl	$0x3f800000, 0x470(%rbp) # imm = 0x3F800000
14021b772:     	cmpq	%rax, (%r15)
14021b775:     	jne	0x14021b840 <.text+0x21a840>
14021b77b:     	jmp	0x14021be46 <.text+0x21ae46>
14021b780:     	movups	0x5730f69(%rip), %xmm0  # 0x14594c6f0
14021b787:     	movaps	%xmm0, 0x460(%rbp)
14021b78e:     	movl	$0x3f800000, 0x470(%rbp) # imm = 0x3F800000
14021b798:     	jmp	0x14021b840 <.text+0x21a840>
14021b79d:     	movq	0x10(%rax), %rax
14021b7a1:     	jmp	0x14021b509 <.text+0x21a509>
14021b7a6:     	movq	0x10(%rax), %rax
14021b7aa:     	jmp	0x14021b5a2 <.text+0x21a5a2>
14021b7af:     	movq	0x10(%rax), %rax
14021b7b3:     	jmp	0x14021b5e9 <.text+0x21a5e9>
14021b7b8:     	movaps	0x572fcf1(%rip), %xmm0  # 0x14594b4b0
14021b7bf:     	movups	%xmm0, 0x464(%rbp)
14021b7c6:     	movl	$0x0, 0x460(%rbp)
14021b7d0:     	movl	$0x68636163, %eax       # imm = 0x68636163
14021b7d5:     	xorl	(%r15), %eax
14021b7d8:     	movzbl	0x4(%r15), %ecx
14021b7dd:     	xorl	$0x65, %ecx
14021b7e0:     	orl	%eax, %ecx
14021b7e2:     	jne	0x14021b840 <.text+0x21a840>
14021b7e4:     	leaq	0x5731252(%rip), %rcx   # 0x14594ca3d
14021b7eb:     	movl	$0x12, %edx
14021b7f0:     	callq	0x145457c00 <.text+0x5456c00>
14021b7f5:     	movq	%rdx, 0x4c0(%rbp)
14021b7fc:     	movq	0x4c0(%rbp), %rbx
14021b803:     	testq	%rbx, %rbx
14021b806:     	jns	0x14021be7d <.text+0x21ae7d>
14021b80c:     	xorl	%edi, %edi
14021b80e:     	movq	%rdi, %rcx
14021b811:     	movq	%rbx, %rdx
14021b814:     	callq	0x14590379b <.text+0x590279b>
14021b819:     	nop
14021b81a:     	jmp	0x14021c07e <.text+0x21b07e>
14021b81f:     	movaps	0x572fc7a(%rip), %xmm0  # 0x14594b4a0
14021b826:     	movups	%xmm0, 0x464(%rbp)
14021b82d:     	movl	$0x0, 0x460(%rbp)
14021b837:     	cmpq	%rax, (%r15)
14021b83a:     	je	0x14021be46 <.text+0x21ae46>
14021b840:     	leaq	0x573116f(%rip), %rcx   # 0x14594c9b6
14021b847:     	movl	$0x9, %edx
14021b84c:     	callq	0x145457c00 <.text+0x5456c00>
14021b851:     	nop
14021b852:     	movq	%rax, %rdi
14021b855:     	movq	%rdx, %rbx
14021b858:     	leaq	0x5731160(%rip), %rcx   # 0x14594c9bf
14021b85f:     	movl	$0x5, %edx
14021b864:     	movq	%r13, %r8
14021b867:     	callq	0x142affbe0 <.text+0x2afebe0>
14021b86c:     	nop
14021b86d:     	testq	%rax, %rax
14021b870:     	jne	0x14021b879 <.text+0x21a879>
14021b872:     	movq	0x77f1f3f(%rip), %rax   # 0x147a0d7b8
14021b879:     	movl	$0x1, %ecx
14021b87e:     	cmpb	$0x2, (%rax)
14021b881:     	jne	0x14021b88e <.text+0x21a88e>
14021b883:     	cmpq	$0x0, 0x8(%rax)
14021b888:     	jne	0x14021b88e <.text+0x21a88e>
14021b88a:     	movq	0x10(%rax), %rcx
14021b88e:     	movq	%rcx, 0x438(%rbp)
14021b895:     	leaq	0x5730e3c(%rip), %rax   # 0x14594c6d8
14021b89c:     	movq	%rax, 0x150(%rbp)
14021b8a3:     	movq	$0x1, 0x158(%rbp)
14021b8ae:     	leaq	0x438(%rbp), %rax
14021b8b5:     	movq	%rax, 0x160(%rbp)
14021b8bc:     	leaq	0x5730df5(%rip), %rax   # 0x14594c6b8
14021b8c3:     	movq	%rax, 0x168(%rbp)
14021b8ca:     	movq	$0x1, 0x20(%rsp)
14021b8d3:     	leaq	-0x30(%rbp), %rcx
14021b8d7:     	leaq	0x150(%rbp), %r9
14021b8de:     	movq	%rdi, %rdx
14021b8e1:     	movq	%rbx, %r8
14021b8e4:     	callq	0x145458060 <.text+0x5457060>
14021b8e9:     	nop
14021b8ea:     	leaq	0x57310d3(%rip), %rcx   # 0x14594c9c4
14021b8f1:     	movl	$0x9, %edx
14021b8f6:     	callq	0x145457c00 <.text+0x5456c00>
14021b8fb:     	nop
14021b8fc:     	movq	%rdx, %rbx
14021b8ff:     	testq	%rdx, %rdx
14021b902:     	jns	0x14021b917 <.text+0x21a917>
14021b904:     	xorl	%edi, %edi
14021b906:     	movq	%rdi, %rcx
14021b909:     	movq	%rbx, %rdx
14021b90c:     	callq	0x14590379b <.text+0x590279b>
14021b911:     	nop
14021b912:     	jmp	0x14021c07e <.text+0x21b07e>
14021b917:     	testq	%rbx, %rbx
14021b91a:     	movq	%rbx, 0x4c8(%rbp)
14021b921:     	je	0x14021b959 <.text+0x21a959>
14021b923:     	movq	%rax, %rsi
14021b926:     	callq	0x140002200 <.text+0x1200>
14021b92b:     	movl	$0x1, %edi
14021b930:     	movl	$0x1, %edx
14021b935:     	movq	%rbx, %rcx
14021b938:     	callq	0x1400021c0 <.text+0x11c0>
14021b93d:     	testq	%rax, %rax
14021b940:     	je	0x14021b906 <.text+0x21a906>
14021b942:     	movq	%rax, 0x4b8(%rbp)
14021b949:     	movq	%rax, %rcx
14021b94c:     	movq	%rsi, %rdx
14021b94f:     	movq	%rbx, %r8
14021b952:     	callq	0x1457731ed <.text+0x57721ed>
14021b957:     	jmp	0x14021b965 <.text+0x21a965>
14021b959:     	movl	$0x1, %eax
14021b95e:     	movq	%rax, 0x4b8(%rbp)
14021b965:     	leaq	0x5731061(%rip), %rcx   # 0x14594c9cd
14021b96c:     	movl	$0x34, %edx
14021b971:     	callq	0x145457c00 <.text+0x5456c00>
14021b976:     	nop
14021b977:     	movq	-0x30(%rbp), %r8
14021b97b:     	movq	-0x28(%rbp), %r9
14021b97f:     	movq	-0x20(%rbp), %rcx
14021b983:     	movq	%r8, 0x438(%rbp)
14021b98a:     	movq	%r9, 0x440(%rbp)
14021b991:     	movq	%rcx, 0x448(%rbp)
14021b998:     	movq	%rax, 0x3f8(%rbp)
14021b99f:     	movq	%rdx, 0x400(%rbp)
14021b9a6:     	movw	$0x0, 0x134(%rbp)
14021b9af:     	movb	$0x1, 0x124(%rbp)
14021b9b6:     	xorps	%xmm0, %xmm0
14021b9b9:     	movups	%xmm0, 0x38(%rbp)
14021b9bd:     	movups	%xmm0, 0x48(%rbp)
14021b9c1:     	movaps	0x56f7768(%rip), %xmm1  # 0x145913130
14021b9c8:     	movups	%xmm1, 0x58(%rbp)
14021b9cc:     	movq	$0x0, 0x30(%rbp)
14021b9d4:     	movups	%xmm0, 0x68(%rbp)
14021b9d8:     	movups	%xmm0, 0x78(%rbp)
14021b9dc:     	movl	$0x0, 0x148(%rbp)
14021b9e6:     	movw	$0x0, 0x14c(%rbp)
14021b9ef:     	movups	0x5730662(%rip), %xmm0  # 0x14594c058
14021b9f6:     	movups	%xmm0, 0x88(%rbp)
14021b9fd:     	movups	0x5730664(%rip), %xmm0  # 0x14594c068
14021ba04:     	movups	%xmm0, 0x98(%rbp)
14021ba0b:     	movups	0x5730666(%rip), %xmm0  # 0x14594c078
14021ba12:     	movups	%xmm0, 0xa8(%rbp)
14021ba19:     	movups	0x5730668(%rip), %xmm0  # 0x14594c088
14021ba20:     	movups	%xmm0, 0xb8(%rbp)
14021ba27:     	movups	0x573067a(%rip), %xmm0  # 0x14594c0a8
14021ba2e:     	movups	%xmm0, 0xd8(%rbp)
14021ba35:     	movups	0x573065c(%rip), %xmm0  # 0x14594c098
14021ba3c:     	movups	%xmm0, 0xc8(%rbp)
14021ba43:     	movups	0x573067e(%rip), %xmm0  # 0x14594c0c8
14021ba4a:     	movups	%xmm0, 0xf8(%rbp)
14021ba51:     	movups	0x5730660(%rip), %xmm0  # 0x14594c0b8
14021ba58:     	movups	%xmm0, 0xe8(%rbp)
14021ba5f:     	movb	$0x0, 0x146(%rbp)
14021ba66:     	movl	$0x100, 0x142(%rbp)     # imm = 0x100
14021ba70:     	movq	$0x0, 0x128(%rbp)
14021ba7b:     	movl	$0x3f800000, 0x130(%rbp) # imm = 0x3F800000
14021ba85:     	movaps	0x56eba34(%rip), %xmm0  # 0x1459074c0
14021ba8c:     	movups	%xmm0, 0x108(%rbp)
14021ba93:     	movl	$0x1, 0x118(%rbp)
14021ba9d:     	movq	$0x0, 0x11c(%rbp)
14021baa8:     	movb	$0x0, 0x147(%rbp)
14021baaf:     	movups	0x57304ea(%rip), %xmm0  # 0x14594bfa0
14021bab6:     	movaps	%xmm0, -0x30(%rbp)
14021baba:     	movq	$0x0, -0x20(%rbp)
14021bac2:     	movups	0x57304ef(%rip), %xmm0  # 0x14594bfb8
14021bac9:     	movups	%xmm0, -0x18(%rbp)
14021bacd:     	movq	$0x0, -0x8(%rbp)
14021bad5:     	movups	0x57304f4(%rip), %xmm0  # 0x14594bfd0
14021badc:     	movaps	%xmm0, (%rbp)
14021bae0:     	movq	$0x0, 0x10(%rbp)
14021bae8:     	movups	0x57304f9(%rip), %xmm0  # 0x14594bfe8
14021baef:     	movups	%xmm0, 0x18(%rbp)
14021baf3:     	movq	$0x0, 0x28(%rbp)
14021bafb:     	movw	$0x0, 0x13a(%rbp)
14021bb04:     	movl	$0x10000, 0x136(%rbp)   # imm = 0x10000
14021bb0e:     	movw	$0x0, 0x140(%rbp)
14021bb17:     	movl	$0x10000, 0x13c(%rbp)   # imm = 0x10000
14021bb21:     	callq	0x140002200 <.text+0x1200>
14021bb26:     	movl	$0x40, %ecx
14021bb2b:     	movl	$0x4, %edx
14021bb30:     	callq	0x1400021c0 <.text+0x11c0>
14021bb35:     	movq	%rax, 0x4c0(%rbp)
14021bb3c:     	testq	%rax, %rax
14021bb3f:     	je	0x14021c05c <.text+0x21b05c>
14021bb45:     	movaps	0x572f974(%rip), %xmm0  # 0x14594b4c0
14021bb4c:     	movups	%xmm0, 0x154(%rbp)
14021bb53:     	movl	$0x0, 0x150(%rbp)
14021bb5d:     	leaq	0x420(%rbp), %rcx
14021bb64:     	leaq	0x150(%rbp), %rdx
14021bb6b:     	callq	0x144c8c290 <.text+0x4c8b290>
14021bb70:     	nop
14021bb71:     	movaps	0x420(%rbp), %xmm6
14021bb78:     	movaps	0x5724711(%rip), %xmm0  # 0x145940290
14021bb7f:     	movups	%xmm0, 0x154(%rbp)
14021bb86:     	movl	$0x0, 0x150(%rbp)
14021bb90:     	leaq	0x420(%rbp), %rcx
14021bb97:     	leaq	0x150(%rbp), %rdx
14021bb9e:     	callq	0x144c8c290 <.text+0x4c8b290>
14021bba3:     	nop
14021bba4:     	movaps	0x420(%rbp), %xmm0
14021bbab:     	movq	0x4c0(%rbp), %rdi
14021bbb2:     	movq	$0x2, (%rdi)
14021bbb9:     	movl	$0x1, 0x8(%rdi)
14021bbc0:     	movups	%xmm6, 0xc(%rdi)
14021bbc4:     	movaps	0x572f905(%rip), %xmm1  # 0x14594b4d0
14021bbcb:     	movups	%xmm1, 0x1c(%rdi)
14021bbcf:     	movups	%xmm0, 0x2c(%rdi)
14021bbd3:     	movl	$0x3f000000, 0x3c(%rdi) # imm = 0x3F000000
14021bbda:     	callq	0x140002200 <.text+0x1200>
14021bbdf:     	movl	$0x48, %ecx
14021bbe4:     	movl	$0x8, %edx
14021bbe9:     	callq	0x1400021c0 <.text+0x11c0>
14021bbee:     	testq	%rax, %rax
14021bbf1:     	je	0x14021c06e <.text+0x21b06e>
14021bbf7:     	movq	%rax, %rsi
14021bbfa:     	movq	$0x2, (%rax)
14021bc01:     	movq	%rdi, 0x8(%rax)
14021bc05:     	movq	$0x2, 0x10(%rax)
14021bc0d:     	movq	$0x1, 0x18(%rax)
14021bc15:     	movl	$0x2, 0x20(%rax)
14021bc1c:     	movss	0x5723ffc(%rip), %xmm0  # 0x14593fc20
14021bc24:     	movlps	%xmm0, 0x24(%rax)
14021bc28:     	movabsq	$0xa00000000, %rax      # imm = 0xA00000000
14021bc32:     	movq	%rax, 0x2c(%rsi)
14021bc36:     	movb	$0x0, 0x40(%rsi)
14021bc3a:     	leaq	0x150(%rbp), %rdi
14021bc41:     	leaq	-0x30(%rbp), %rdx
14021bc45:     	movl	$0x180, %r8d            # imm = 0x180
14021bc4b:     	movq	%rdi, %rcx
14021bc4e:     	callq	0x1457731ed <.text+0x57721ed>
14021bc53:     	movq	$0x1, 0x2d0(%rbp)
14021bc5e:     	movq	%rsi, 0x2d8(%rbp)
14021bc65:     	movq	$0x1, 0x2e0(%rbp)
14021bc70:     	movl	$0x1770, 0x2e8(%rbp)    # imm = 0x1770
14021bc7a:     	movw	$0x2, 0x2ec(%rbp)
14021bc83:     	movb	$0x0, 0x4d7(%rbp)
14021bc8a:     	leaq	0x5730def(%rip), %r9    # 0x14594ca80
14021bc91:     	leaq	-0x30(%rbp), %rcx
14021bc95:     	leaq	0x2f0(%rbp), %rdx
14021bc9c:     	movq	%rdi, %r8
14021bc9f:     	callq	0x1400ed6c0 <.text+0xec6c0>
14021bca4:     	nop
14021bca5:     	leaq	0x318(%rbp), %rax
14021bcac:     	leaq	0x338(%rbp), %rcx
14021bcb3:     	leaq	0x370(%rbp), %rdx
14021bcba:     	leaq	0x390(%rbp), %r8
14021bcc1:     	movq	%r8, 0x168(%rbp)
14021bcc8:     	leaq	0x460(%rbp), %r8
14021bccf:     	movq	%r8, 0x170(%rbp)
14021bcd6:     	leaq	0x438(%rbp), %r8
14021bcdd:     	movq	%r8, 0x178(%rbp)
14021bce4:     	leaq	-0x50(%rbp), %r8
14021bce8:     	movq	%r8, 0x180(%rbp)
14021bcef:     	movq	0x4c8(%rbp), %r8
14021bcf6:     	movq	%r8, 0x150(%rbp)
14021bcfd:     	movq	0x4b8(%rbp), %r9
14021bd04:     	movq	%r9, 0x158(%rbp)
14021bd0b:     	movq	%r8, 0x160(%rbp)
14021bd12:     	leaq	0x3f8(%rbp), %r8
14021bd19:     	movq	%r8, 0x188(%rbp)
14021bd20:     	leaq	0x480(%rbp), %r8
14021bd27:     	movq	%r8, 0x190(%rbp)
14021bd2e:     	movq	%rdx, 0x198(%rbp)
14021bd35:     	movq	%rax, 0x1a0(%rbp)
14021bd3c:     	leaq	0x4b7(%rbp), %rax
14021bd43:     	movq	%rax, 0x1a8(%rbp)
14021bd4a:     	movq	%rcx, 0x1b0(%rbp)
14021bd51:     	movq	%r15, 0x1b8(%rbp)
14021bd58:     	movq	0x4a0(%rbp), %rax
14021bd5f:     	movq	%rax, 0x1c0(%rbp)
14021bd66:     	leaq	0x408(%rbp), %rax
14021bd6d:     	movq	%rax, 0x1c8(%rbp)
14021bd74:     	movb	$0x1, 0x4d7(%rbp)
14021bd7b:     	leaq	-0x30(%rbp), %rcx
14021bd7f:     	leaq	0x150(%rbp), %rdx
14021bd86:     	callq	0x14010cdf0 <.text+0x10bdf0>
14021bd8b:     	nop
14021bd8c:     	movq	0x438(%rbp), %rdx
14021bd93:     	testq	%rdx, %rdx
14021bd96:     	je	0x14021bdaa <.text+0x21adaa>
14021bd98:     	movq	0x440(%rbp), %rcx
14021bd9f:     	movl	$0x1, %r8d
14021bda5:     	callq	0x1400021d0 <.text+0x11d0>
14021bdaa:     	movq	0x488(%rbp), %rcx
14021bdb1:     	movq	0x490(%rbp), %rax
14021bdb8:     	movq	%rax, 0x4c0(%rbp)
14021bdbf:     	movq	$0x0, 0x4c8(%rbp)
14021bdca:     	movq	%rcx, 0x4a0(%rbp)
14021bdd1:     	nopw	%cs:(%rax,%rax)
14021bde0:     	movq	0x4c8(%rbp), %rax
14021bde7:     	cmpq	%rax, 0x4c0(%rbp)
14021bdee:     	je	0x14021be09 <.text+0x21ae09>
14021bdf0:     	incq	%rax
14021bdf3:     	movq	%rax, 0x4c8(%rbp)
14021bdfa:     	leaq	0x20(%rcx), %rsi
14021bdfe:     	callq	0x140198520 <.text+0x197520>
14021be03:     	nop
14021be04:     	movq	%rsi, %rcx
14021be07:     	jmp	0x14021bde0 <.text+0x21ade0>
14021be09:     	movq	0x480(%rbp), %rdx
14021be10:     	testq	%rdx, %rdx
14021be13:     	je	0x14021be2b <.text+0x21ae2b>
14021be15:     	movq	0x488(%rbp), %rcx
14021be1c:     	shlq	$0x5, %rdx
14021be20:     	movl	$0x8, %r8d
14021be26:     	callq	0x1400021d0 <.text+0x11d0>
14021be2b:     	movaps	0x4e0(%rbp), %xmm6
14021be32:     	addq	$0x578, %rsp            # imm = 0x578
14021be39:     	popq	%rbx
14021be3a:     	popq	%rdi
14021be3b:     	popq	%rsi
14021be3c:     	popq	%r12
14021be3e:     	popq	%r13
14021be40:     	popq	%r14
14021be42:     	popq	%r15
14021be44:     	popq	%rbp
14021be45:     	retq
14021be46:     	leaq	0x5730bb4(%rip), %rcx   # 0x14594ca01
14021be4d:     	movl	$0xe, %edx
14021be52:     	callq	0x145457c00 <.text+0x5456c00>
14021be57:     	movq	%rdx, 0x4c0(%rbp)
14021be5e:     	movq	0x4c0(%rbp), %rbx
14021be65:     	testq	%rbx, %rbx
14021be68:     	jns	0x14021bec0 <.text+0x21aec0>
14021be6a:     	xorl	%edi, %edi
14021be6c:     	movq	%rdi, %rcx
14021be6f:     	movq	%rbx, %rdx
14021be72:     	callq	0x14590379b <.text+0x590279b>
14021be77:     	nop
14021be78:     	jmp	0x14021c07e <.text+0x21b07e>
14021be7d:     	testq	%rbx, %rbx
14021be80:     	je	0x14021bf0b <.text+0x21af0b>
14021be86:     	movq	%rax, %rsi
14021be89:     	callq	0x140002200 <.text+0x1200>
14021be8e:     	movl	$0x1, %edi
14021be93:     	movl	$0x1, %edx
14021be98:     	movq	%rbx, %rcx
14021be9b:     	callq	0x1400021c0 <.text+0x11c0>
14021bea0:     	testq	%rax, %rax
14021bea3:     	je	0x14021b80e <.text+0x21a80e>
14021bea9:     	movq	%rax, 0x4a8(%rbp)
14021beb0:     	movq	%rax, %rcx
14021beb3:     	movq	%rsi, %rdx
14021beb6:     	movq	%rbx, %r8
14021beb9:     	callq	0x1457731ed <.text+0x57721ed>
14021bebe:     	jmp	0x14021bf17 <.text+0x21af17>
14021bec0:     	testq	%rbx, %rbx
14021bec3:     	je	0x14021bf8d <.text+0x21af8d>
14021bec9:     	movq	%rax, %rsi
14021becc:     	callq	0x140002200 <.text+0x1200>
14021bed1:     	movl	$0x1, %edi
14021bed6:     	movl	$0x1, %edx
14021bedb:     	movq	%rbx, %rcx
14021bede:     	callq	0x1400021c0 <.text+0x11c0>
14021bee3:     	testq	%rax, %rax
14021bee6:     	je	0x14021be6c <.text+0x21ae6c>
14021bee8:     	movq	%rax, 0x4a8(%rbp)
14021beef:     	movq	%rax, %rcx
14021bef2:     	movq	%rsi, %rdx
14021bef5:     	movq	%rbx, %r8
14021bef8:     	callq	0x1457731ed <.text+0x57721ed>
14021befd:     	jmp	0x14021bf99 <.text+0x21af99>
14021bf02:     	movq	0x10(%rax), %rax
14021bf06:     	jmp	0x14021b65c <.text+0x21a65c>
14021bf0b:     	movl	$0x1, %eax
14021bf10:     	movq	%rax, 0x4a8(%rbp)
14021bf17:     	leaq	0x5730b31(%rip), %rcx   # 0x14594ca4f
14021bf1e:     	movl	$0x9, %edx
14021bf23:     	callq	0x145457c00 <.text+0x5456c00>
14021bf28:     	nop
14021bf29:     	movq	%rdx, %rbx
14021bf2c:     	testq	%rdx, %rdx
14021bf2f:     	jns	0x14021bf44 <.text+0x21af44>
14021bf31:     	xorl	%edi, %edi
14021bf33:     	movq	%rdi, %rcx
14021bf36:     	movq	%rbx, %rdx
14021bf39:     	callq	0x14590379b <.text+0x590279b>
14021bf3e:     	nop
14021bf3f:     	jmp	0x14021c07e <.text+0x21b07e>
14021bf44:     	testq	%rbx, %rbx
14021bf47:     	movq	%rbx, 0x4c8(%rbp)
14021bf4e:     	je	0x14021c008 <.text+0x21b008>
14021bf54:     	movq	%rax, %rsi
14021bf57:     	callq	0x140002200 <.text+0x1200>
14021bf5c:     	movl	$0x1, %edi
14021bf61:     	movl	$0x1, %edx
14021bf66:     	movq	%rbx, %rcx
14021bf69:     	callq	0x1400021c0 <.text+0x11c0>
14021bf6e:     	testq	%rax, %rax
14021bf71:     	je	0x14021bf33 <.text+0x21af33>
14021bf73:     	movq	%rax, 0x4b8(%rbp)
14021bf7a:     	movq	%rax, %rcx
14021bf7d:     	movq	%rsi, %rdx
14021bf80:     	movq	%rbx, %r8
14021bf83:     	callq	0x1457731ed <.text+0x57721ed>
14021bf88:     	jmp	0x14021c014 <.text+0x21b014>
14021bf8d:     	movl	$0x1, %eax
14021bf92:     	movq	%rax, 0x4a8(%rbp)
14021bf99:     	leaq	0x5730a6f(%rip), %rcx   # 0x14594ca0f
14021bfa0:     	movl	$0xa, %edx
14021bfa5:     	callq	0x145457c00 <.text+0x5456c00>
14021bfaa:     	nop
14021bfab:     	movq	%rdx, %rbx
14021bfae:     	testq	%rdx, %rdx
14021bfb1:     	jns	0x14021bfc6 <.text+0x21afc6>
14021bfb3:     	xorl	%edi, %edi
14021bfb5:     	movq	%rdi, %rcx
14021bfb8:     	movq	%rbx, %rdx
14021bfbb:     	callq	0x14590379b <.text+0x590279b>
14021bfc0:     	nop
14021bfc1:     	jmp	0x14021c07e <.text+0x21b07e>
14021bfc6:     	testq	%rbx, %rbx
14021bfc9:     	movq	%rbx, 0x4c8(%rbp)
14021bfd0:     	je	0x14021c028 <.text+0x21b028>
14021bfd2:     	movq	%rax, %rsi
14021bfd5:     	callq	0x140002200 <.text+0x1200>
14021bfda:     	movl	$0x1, %edi
14021bfdf:     	movl	$0x1, %edx
14021bfe4:     	movq	%rbx, %rcx
14021bfe7:     	callq	0x1400021c0 <.text+0x11c0>
14021bfec:     	testq	%rax, %rax
14021bfef:     	je	0x14021bfb5 <.text+0x21afb5>
14021bff1:     	movq	%rax, 0x4b8(%rbp)
14021bff8:     	movq	%rax, %rcx
14021bffb:     	movq	%rsi, %rdx
14021bffe:     	movq	%rbx, %r8
14021c001:     	callq	0x1457731ed <.text+0x57721ed>
14021c006:     	jmp	0x14021c034 <.text+0x21b034>
14021c008:     	movl	$0x1, %eax
14021c00d:     	movq	%rax, 0x4b8(%rbp)
14021c014:     	leaq	0x5730a3d(%rip), %rcx   # 0x14594ca58
14021c01b:     	movl	$0x26, %edx
14021c020:     	callq	0x145457c00 <.text+0x5456c00>
14021c025:     	nop
14021c026:     	jmp	0x14021c046 <.text+0x21b046>
14021c028:     	movl	$0x1, %eax
14021c02d:     	movq	%rax, 0x4b8(%rbp)
14021c034:     	leaq	0x57309de(%rip), %rcx   # 0x14594ca19
14021c03b:     	movl	$0x24, %edx
14021c040:     	callq	0x145457c00 <.text+0x5456c00>
14021c045:     	nop
14021c046:     	movq	0x4c0(%rbp), %r8
14021c04d:     	movq	%r8, %rcx
14021c050:     	movq	0x4a8(%rbp), %r9
14021c057:     	jmp	0x14021b983 <.text+0x21a983>
14021c05c:     	movl	$0x4, %ecx
14021c061:     	movl	$0x40, %edx
14021c066:     	callq	0x145903781 <.text+0x5902781>
14021c06b:     	nop
14021c06c:     	jmp	0x14021c07e <.text+0x21b07e>
14021c06e:     	movl	$0x8, %ecx
14021c073:     	movl	$0x48, %edx
14021c078:     	callq	0x145903781 <.text+0x5902781>
14021c07d:     	nop
14021c07e:     	ud2

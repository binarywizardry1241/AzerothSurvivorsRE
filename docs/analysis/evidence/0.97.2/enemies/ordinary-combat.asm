
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cb009:     	movq	0x90(%rdi), %rcx
1454cb010:     	testq	%rcx, %rcx
1454cb013:     	je	0x1454cb057 <.text+0x54ca057>
1454cb015:     	movl	(%rcx), %eax
1454cb017:     	testb	$0x1, %al
1454cb019:     	movss	0x4204d7(%rip), %xmm0   # 0x1458eb4f8
1454cb021:     	je	0x1454cb19d <.text+0x54ca19d>
1454cb027:     	movss	0x8(%rcx), %xmm15
1454cb02d:     	movaps	%xmm15, %xmm9
1454cb031:     	addss	%xmm0, %xmm9
1454cb036:     	cmpl	$0x1, %eax
1454cb039:     	movq	0x2a0(%rbp), %r12
1454cb040:     	je	0x1454cb1c3 <.text+0x54ca1c3>
1454cb046:     	xorl	%r14d, %r14d
1454cb049:     	xorl	%r15d, %r15d
1454cb04c:     	cmpl	$0x1, 0x70(%rdi)
1454cb050:     	je	0x1454cb084 <.text+0x54ca084>
1454cb052:     	jmp	0x1454cb201 <.text+0x54ca201>
1454cb057:     	movss	0x104(%rdi), %xmm9
1454cb060:     	movaps	%xmm9, %xmm15
1454cb064:     	mulss	0x42b5bb(%rip), %xmm15  # 0x1458f6628
1454cb06d:     	xorl	%r14d, %r14d
1454cb070:     	xorl	%r15d, %r15d
1454cb073:     	movq	0x2a0(%rbp), %r12
1454cb07a:     	cmpl	$0x1, 0x70(%rdi)
1454cb07e:     	jne	0x1454cb201 <.text+0x54ca201>
1454cb084:     	ucomiss	0x74(%rdi), %xmm6
1454cb088:     	jb	0x1454c9a4c <.text+0x54c8a4c>
1454cb08e:     	movl	$0x0, 0x70(%rdi)
1454cb095:     	movq	0x90(%rdi), %rax
1454cb09c:     	testq	%rax, %rax
1454cb09f:     	je	0x1454c9a4c <.text+0x54c8a4c>
1454cb0a5:     	testb	$0x1, (%rax)
1454cb0a8:     	je	0x1454c9a4c <.text+0x54c8a4c>
1454cb0ae:     	movaps	%xmm11, %xmm1
1454cb0b2:     	subss	0xa0(%rdi), %xmm1
1454cb0ba:     	movss	0xf8(%rdi), %xmm2
1454cb0c2:     	movaps	%xmm6, %xmm0
1454cb0c5:     	cmpltss	0xa4(%rdi), %xmm0
1454cb0ce:     	mulss	%xmm2, %xmm1
1454cb0d2:     	andps	%xmm0, %xmm1
1454cb0d5:     	andnps	%xmm2, %xmm0
1454cb0d8:     	orps	%xmm1, %xmm0
1454cb0db:     	movaps	%xmm0, %xmm9
1454cb0df:     	mulss	0x42dc58(%rip), %xmm9   # 0x1458f8d40
1454cb0e8:     	testb	$0x1, 0x38(%rdi)
1454cb0ec:     	jne	0x1454cb0f2 <.text+0x54ca0f2>
1454cb0ee:     	movaps	%xmm0, %xmm9
1454cb0f2:     	cmpq	$-0x1, 0x18(%rdi)
1454cb0f7:     	jne	0x1454cb0fd <.text+0x54ca0fd>
1454cb0f9:     	movaps	%xmm0, %xmm9
1454cb0fd:     	movl	0x4(%rax), %edi
1454cb100:     	movq	0x290(%rbp), %rax
1454cb107:     	movq	0x88(%rax), %rbx
1454cb10e:     	movq	0x108(%rbp), %rsi
1454cb115:     	cmpq	0xf8(%rbp), %rsi
1454cb11c:     	jne	0x1454cb16a <.text+0x54ca16a>
1454cb11e:     	movb	$0x1, 0x2b7(%rbp)
1454cb125:     	movb	$0x1, 0x2b6(%rbp)
1454cb12c:     	movb	$0x1, 0x2b5(%rbp)
1454cb133:     	movb	$0x1, 0x2b4(%rbp)
1454cb13a:     	movb	$0x1, 0x2b3(%rbp)
1454cb141:     	movb	$0x1, 0x2b2(%rbp)
1454cb148:     	movb	$0x1, 0x2b1(%rbp)
1454cb14f:     	movb	$0x1, 0x2b0(%rbp)
1454cb156:     	movb	$0x1, 0x2af(%rbp)
1454cb15d:     	leaq	0xf8(%rbp), %rcx
1454cb164:     	callq	0x145758200 <.text+0x5757200>
1454cb169:     	nop
1454cb16a:     	movq	0x100(%rbp), %rax
1454cb171:     	movq	%rsi, %rcx
1454cb174:     	shlq	$0x4, %rcx
1454cb178:     	movq	%rbx, (%rax,%rcx)
1454cb17c:     	movl	%edi, 0x8(%rax,%rcx)
1454cb180:     	movss	%xmm9, 0xc(%rax,%rcx)
1454cb187:     	incq	%rsi
1454cb18a:     	movq	%rsi, 0x108(%rbp)
1454cb191:     	movq	0x2a0(%rbp), %r12
1454cb198:     	jmp	0x1454c9a4c <.text+0x54c8a4c>
1454cb19d:     	movss	0x104(%rdi), %xmm9
1454cb1a6:     	movaps	%xmm9, %xmm15
1454cb1aa:     	mulss	0x42b475(%rip), %xmm15  # 0x1458f6628
1454cb1b3:     	cmpl	$0x1, %eax
1454cb1b6:     	movq	0x2a0(%rbp), %r12
1454cb1bd:     	jne	0x1454cb046 <.text+0x54ca046>
1454cb1c3:     	movq	0x8(%rbp), %rsi
1454cb1c7:     	movss	0xc8(%rsi), %xmm1
1454cb1cf:     	movaps	%xmm13, %xmm0
1454cb1d3:     	subss	%xmm1, %xmm0
1454cb1d7:     	movshdup	%xmm13, %xmm1           # xmm1 = xmm13[1,1,3,3]
1454cb1dc:     	subss	0xcc(%rsi), %xmm1
1454cb1e4:     	callq	0x145756e67 <.text+0x5755e67>
1454cb1e9:     	ucomiss	0xd8(%rsi), %xmm0
1454cb1f0:     	seta	%r15b
1454cb1f4:     	movb	$0x1, %r14b
1454cb1f7:     	cmpl	$0x1, 0x70(%rdi)
1454cb1fb:     	je	0x1454cb084 <.text+0x54ca084>
1454cb201:     	ucomiss	%xmm10, %xmm9
1454cb205:     	setb	%al
1454cb208:     	orb	%r15b, %al
1454cb20b:     	je	0x1454cb3bb <.text+0x54ca3bb>
1454cb211:     	ucomiss	0x12c(%rdi), %xmm6
1454cb218:     	jb	0x1454c9a4c <.text+0x54c8a4c>
1454cb21e:     	movss	0x154(%rdi), %xmm10
1454cb227:     	addss	0x4202f8(%rip), %xmm10  # 0x1458eb528
1454cb230:     	movss	%xmm10, 0x154(%rdi)
1454cb239:     	maxss	0x4319f6(%rip), %xmm15  # 0x1458fcc38
1454cb242:     	movaps	%xmm10, %xmm0
1454cb246:     	callq	0x145756e31 <.text+0x5755e31>
1454cb24b:     	movaps	%xmm0, %xmm9
1454cb24f:     	movaps	%xmm10, %xmm0
1454cb253:     	callq	0x145756e2b <.text+0x5755e2b>
1454cb258:     	movsldup	%xmm15, %xmm1           # xmm1 = xmm15[0,0,2,2]
1454cb25d:     	unpcklps	%xmm0, %xmm9            # xmm9 = xmm9[0],xmm0[0],xmm9[1],xmm0[1]
1454cb261:     	mulps	%xmm1, %xmm9
1454cb265:     	addps	0x10(%rbp), %xmm9
1454cb26a:     	movlps	%xmm9, 0xa8(%rbp)
1454cb272:     	movss	0x18c(%rbp), %xmm0
1454cb27a:     	movss	%xmm0, 0xb0(%rbp)
1454cb282:     	testb	%r14b, %r14b
1454cb285:     	je	0x1454cbb40 <.text+0x54cab40>
1454cb28b:     	testb	%r15b, %r15b
1454cb28e:     	je	0x1454cb2b3 <.text+0x54ca2b3>
1454cb290:     	movq	0x270(%rbp), %rax
1454cb297:     	movq	%rax, 0xa8(%rbp)
1454cb29e:     	movl	0x278(%rbp), %eax
1454cb2a4:     	movl	%eax, 0xb0(%rbp)
1454cb2aa:     	movsd	0xa8(%rbp), %xmm9
1454cb2b3:     	movq	0x8(%rbp), %rax
1454cb2b7:     	movsd	0xc8(%rax), %xmm1
1454cb2bf:     	movss	0xd8(%rax), %xmm12
1454cb2c8:     	addss	0x431a17(%rip), %xmm12  # 0x1458fcce8
1454cb2d1:     	maxss	%xmm11, %xmm12
1454cb2d6:     	movaps	0x10(%rbp), %xmm0
1454cb2da:     	movaps	%xmm0, %xmm10
1454cb2de:     	movaps	%xmm1, 0x260(%rbp)
1454cb2e5:     	subps	%xmm1, %xmm10
1454cb2e9:     	subps	%xmm0, %xmm9
1454cb2ed:     	movshdup	%xmm9, %xmm1            # xmm1 = xmm9[1,1,3,3]
1454cb2f2:     	movaps	%xmm9, %xmm0
1454cb2f6:     	callq	0x145756e67 <.text+0x5755e67>
1454cb2fb:     	movaps	%xmm10, %xmm2
1454cb2ff:     	mulps	%xmm10, %xmm2
1454cb303:     	movshdup	%xmm2, %xmm1            # xmm1 = xmm2[1,1,3,3]
1454cb307:     	addss	%xmm2, %xmm1
1454cb30b:     	movaps	%xmm12, %xmm2
1454cb30f:     	mulss	%xmm12, %xmm2
1454cb314:     	subss	%xmm2, %xmm1
1454cb318:     	ucomiss	%xmm8, %xmm1
1454cb31c:     	jae	0x1454cbaf5 <.text+0x54caaf5>
1454cb322:     	xorl	%eax, %eax
1454cb324:     	movss	0x483fe4(%rip), %xmm2   # 0x14594f310
1454cb32c:     	ucomiss	%xmm0, %xmm2
1454cb32f:     	seta	%al
1454cb332:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454cb336:     	divps	%xmm0, %xmm9
1454cb33a:     	movd	%eax, %xmm0
1454cb33e:     	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
1454cb343:     	pslld	$0x1f, %xmm0
1454cb348:     	psrad	$0x1f, %xmm0
1454cb34d:     	movd	0x42012b(%rip), %xmm2   # 0x1458eb480
1454cb355:     	pand	%xmm0, %xmm2
1454cb359:     	pandn	%xmm9, %xmm0
1454cb35e:     	por	%xmm2, %xmm0
1454cb362:     	mulps	%xmm0, %xmm10
1454cb366:     	movshdup	%xmm10, %xmm2           # xmm2 = xmm10[1,1,3,3]
1454cb36b:     	addss	%xmm10, %xmm2
1454cb370:     	movaps	%xmm2, %xmm3
1454cb373:     	mulss	%xmm2, %xmm3
1454cb377:     	subss	%xmm1, %xmm3
1454cb37b:     	xorps	%xmm1, %xmm1
1454cb37e:     	sqrtss	%xmm3, %xmm1
1454cb382:     	subss	%xmm2, %xmm1
1454cb386:     	movaps	%xmm15, %xmm2
1454cb38a:     	minss	%xmm1, %xmm2
1454cb38e:     	movaps	%xmm2, %xmm1
1454cb391:     	cmpunordss	%xmm2, %xmm1
1454cb396:     	movaps	%xmm1, %xmm3
1454cb399:     	andnps	%xmm2, %xmm3
1454cb39c:     	andps	%xmm15, %xmm1
1454cb3a0:     	orps	%xmm3, %xmm1
1454cb3a3:     	maxss	%xmm8, %xmm1
1454cb3a8:     	movsldup	%xmm1, %xmm9            # xmm9 = xmm1[0,0,2,2]
1454cb3ad:     	mulps	%xmm0, %xmm9
1454cb3b1:     	addps	0x10(%rbp), %xmm9
1454cb3b6:     	jmp	0x1454cbb28 <.text+0x54cab28>
1454cb3bb:     	movss	0x128(%rdi), %xmm0
1454cb3c3:     	ucomiss	%xmm8, %xmm0
1454cb3c7:     	jbe	0x1454cb4db <.text+0x54ca4db>
1454cb3cd:     	addss	0x124(%rdi), %xmm0
1454cb3d5:     	ucomiss	%xmm6, %xmm0
1454cb3d8:     	jbe	0x1454cb4db <.text+0x54ca4db>
1454cb3de:     	movl	0x278(%rbp), %eax
1454cb3e4:     	movl	%eax, 0x114(%rdi)
1454cb3ea:     	movq	0x270(%rbp), %rax
1454cb3f1:     	movq	%rax, 0x10c(%rdi)
1454cb3f8:     	movq	0x270(%rbp), %rax
1454cb3ff:     	movq	%rax, 0x118(%rdi)
1454cb406:     	movl	0x278(%rbp), %eax
1454cb40c:     	movl	%eax, 0x120(%rdi)
1454cb412:     	movaps	-0x30(%rbp), %xmm0
1454cb416:     	movlps	%xmm0, 0x124(%rdi)
1454cb41d:     	movq	0x88(%rdi), %rdi
1454cb424:     	movq	0x1e8(%rbp), %rsi
1454cb42b:     	cmpq	0x1d8(%rbp), %rsi
1454cb432:     	jne	0x1454cb480 <.text+0x54ca480>
1454cb434:     	movb	$0x1, 0x2b7(%rbp)
1454cb43b:     	movb	$0x1, 0x2b6(%rbp)
1454cb442:     	movb	$0x1, 0x2b5(%rbp)
1454cb449:     	movb	$0x1, 0x2b4(%rbp)
1454cb450:     	movb	$0x1, 0x2b3(%rbp)
1454cb457:     	movb	$0x1, 0x2b2(%rbp)
1454cb45e:     	movb	$0x1, 0x2b1(%rbp)
1454cb465:     	movb	$0x1, 0x2b0(%rbp)
1454cb46c:     	movb	$0x1, 0x2af(%rbp)
1454cb473:     	leaq	0x1d8(%rbp), %rcx
1454cb47a:     	callq	0x145758120 <.text+0x5757120>
1454cb47f:     	nop
1454cb480:     	movq	0x1e0(%rbp), %rax
1454cb487:     	leaq	(%rsi,%rsi,4), %rcx
1454cb48b:     	movq	%rdi, (%rax,%rcx,8)
1454cb48f:     	movq	0x270(%rbp), %rdx
1454cb496:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454cb49b:     	movl	0x278(%rbp), %edx
1454cb4a1:     	movl	%edx, 0x10(%rax,%rcx,8)
1454cb4a5:     	movq	0x270(%rbp), %rdx
1454cb4ac:     	movq	%rdx, 0x14(%rax,%rcx,8)
1454cb4b1:     	movl	0x278(%rbp), %edx
1454cb4b7:     	movl	%edx, 0x1c(%rax,%rcx,8)
1454cb4bb:     	movl	$0x0, 0x20(%rax,%rcx,8)
1454cb4c3:     	incq	%rsi
1454cb4c6:     	movq	%rsi, 0x1e8(%rbp)
1454cb4cd:     	movq	0x2a0(%rbp), %r12
1454cb4d4:     	movq	0x290(%rbp), %rdi
1454cb4db:     	ucomiss	0x130(%rdi), %xmm8
1454cb4e3:     	jb	0x1454c9a4c <.text+0x54c8a4c>
1454cb4e9:     	movss	0x100(%rdi), %xmm0
1454cb4f1:     	movss	%xmm0, 0x130(%rdi)
1454cb4f9:     	movq	0x90(%rdi), %rax
1454cb500:     	testq	%rax, %rax
1454cb503:     	je	0x1454cb959 <.text+0x54ca959>
1454cb509:     	testb	$0x1, (%rax)
1454cb50c:     	je	0x1454cb959 <.text+0x54ca959>
1454cb512:     	movl	0x4(%rax), %esi
1454cb515:     	movss	0xc(%rax), %xmm9
1454cb51b:     	movaps	%xmm6, %xmm0
1454cb51e:     	addss	%xmm9, %xmm0
1454cb523:     	movl	$0x1, 0x70(%rdi)
1454cb52a:     	movss	%xmm0, 0x74(%rdi)
1454cb52f:     	movq	0x88(%rdi), %rbx
1454cb536:     	movq	0x108(%rbp), %rdi
1454cb53d:     	cmpq	0xf8(%rbp), %rdi
1454cb544:     	jne	0x1454cb592 <.text+0x54ca592>
1454cb546:     	movb	$0x1, 0x2b7(%rbp)
1454cb54d:     	movb	$0x1, 0x2b6(%rbp)
1454cb554:     	movb	$0x1, 0x2b5(%rbp)
1454cb55b:     	movb	$0x1, 0x2b4(%rbp)
1454cb562:     	movb	$0x1, 0x2b3(%rbp)
1454cb569:     	movb	$0x1, 0x2b2(%rbp)
1454cb570:     	movb	$0x1, 0x2b1(%rbp)
1454cb577:     	movb	$0x1, 0x2b0(%rbp)
1454cb57e:     	movb	$0x1, 0x2af(%rbp)
1454cb585:     	leaq	0xf8(%rbp), %rcx
1454cb58c:     	callq	0x145758200 <.text+0x5757200>
1454cb591:     	nop
1454cb592:     	xorps	0x42d9b6(%rip), %xmm9   # 0x1458f8f50
1454cb59a:     	movq	0x100(%rbp), %rax
1454cb5a1:     	movq	%rdi, %rcx
1454cb5a4:     	shlq	$0x4, %rcx
1454cb5a8:     	movq	%rbx, (%rax,%rcx)
1454cb5ac:     	movl	%esi, 0x8(%rax,%rcx)
1454cb5b0:     	movss	%xmm9, 0xc(%rax,%rcx)
1454cb5b7:     	incq	%rdi
1454cb5ba:     	movq	%rdi, 0x108(%rbp)
1454cb5c1:     	movq	0x2a0(%rbp), %r12
1454cb5c8:     	jmp	0x1454c9a4c <.text+0x54c8a4c>

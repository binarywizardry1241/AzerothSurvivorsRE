
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455491c0:     	pushq	%r15
1455491c2:     	pushq	%r14
1455491c4:     	pushq	%r12
1455491c6:     	pushq	%rsi
1455491c7:     	pushq	%rdi
1455491c8:     	pushq	%rbx
1455491c9:     	movq	%rcx, %rax
1455491cc:     	movq	(%rdx), %rcx
1455491cf:     	movq	0x8(%rdx), %r9
1455491d3:     	cmpq	%r9, %rcx
1455491d6:     	je	0x145549397 <.text+0x5548397>
1455491dc:     	movq	0x10(%rdx), %r10
1455491e0:     	movq	0x18(%rdx), %r11
1455491e4:     	movabsq	$0xffffffffffffff8, %rsi # imm = 0xFFFFFFFFFFFFFF8
1455491ee:     	andq	%r11, %rsi
1455491f1:     	shll	$0x3, %r11d
1455491f5:     	andl	$0x38, %r11d
1455491f9:     	movq	0x20(%rdx), %rdi
1455491fd:     	movq	0x28(%rdx), %rbx
145549201:     	movq	(%r8), %r8
145549204:     	xorps	%xmm0, %xmm0
145549207:     	movss	0x3be281(%rip), %xmm1   # 0x145907490
14554920f:     	jmp	0x145549249 <.text+0x5548249>
145549211:     	movsd	0x118(%r15), %xmm2
14554921a:     	movsd	(%rbx), %xmm3
14554921e:     	subps	%xmm3, %xmm2
145549221:     	mulps	%xmm2, %xmm2
145549224:     	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
145549228:     	addss	%xmm2, %xmm3
14554922c:     	movss	(%r8), %xmm2
145549231:     	ucomiss	%xmm3, %xmm2
145549234:     	jae	0x1455493a6 <.text+0x55483a6>
14554923a:     	nopw	(%rax,%rax)
145549240:     	cmpq	%r9, %rcx
145549243:     	je	0x145549394 <.text+0x5548394>
145549249:     	movq	%rcx, %r15
14554924c:     	addq	$0x160, %rcx            # imm = 0x160
145549253:     	cmpb	$0x0, 0x68(%r15)
145549258:     	jne	0x145549240 <.text+0x5548240>
14554925a:     	movq	0x88(%r15), %r14
145549261:     	xorl	%r12d, %r12d
145549264:     	nopw	%cs:(%rax,%rax)
145549270:     	cmpq	%r12, %rsi
145549273:     	je	0x1455492b3 <.text+0x55482b3>
145549275:     	cmpq	%r14, (%r10,%r12,8)
145549279:     	je	0x145549240 <.text+0x5548240>
14554927b:     	cmpq	%r14, 0x8(%r10,%r12,8)
145549280:     	je	0x145549240 <.text+0x5548240>
145549282:     	cmpq	%r14, 0x10(%r10,%r12,8)
145549287:     	je	0x145549240 <.text+0x5548240>
145549289:     	cmpq	%r14, 0x18(%r10,%r12,8)
14554928e:     	je	0x145549240 <.text+0x5548240>
145549290:     	cmpq	%r14, 0x20(%r10,%r12,8)
145549295:     	je	0x145549240 <.text+0x5548240>
145549297:     	cmpq	%r14, 0x28(%r10,%r12,8)
14554929c:     	je	0x145549240 <.text+0x5548240>
14554929e:     	cmpq	%r14, 0x30(%r10,%r12,8)
1455492a3:     	je	0x145549240 <.text+0x5548240>
1455492a5:     	cmpq	%r14, 0x38(%r10,%r12,8)
1455492aa:     	leaq	0x8(%r12), %r12
1455492af:     	jne	0x145549270 <.text+0x5548270>
1455492b1:     	jmp	0x145549240 <.text+0x5548240>
1455492b3:     	testq	%r11, %r11
1455492b6:     	je	0x1455492c4 <.text+0x55482c4>
1455492b8:     	cmpq	%r14, (%r10,%rsi,8)
1455492bc:     	je	0x145549240 <.text+0x5548240>
1455492be:     	cmpl	$0x8, %r11d
1455492c2:     	jne	0x145549319 <.text+0x5548319>
1455492c4:     	movss	0x128(%r15), %xmm2
1455492cd:     	ucomiss	%xmm2, %xmm0
1455492d0:     	jae	0x145549211 <.text+0x5548211>
1455492d6:     	movss	(%rdi), %xmm3
1455492da:     	subss	0x124(%r15), %xmm3
1455492e3:     	divss	%xmm2, %xmm3
1455492e7:     	xorps	%xmm2, %xmm2
1455492ea:     	maxss	%xmm3, %xmm2
1455492ee:     	movaps	%xmm1, %xmm3
1455492f1:     	minss	%xmm2, %xmm3
1455492f5:     	movsd	0x10c(%r15), %xmm4
1455492fe:     	movsd	0x118(%r15), %xmm5
145549307:     	subps	%xmm4, %xmm5
14554930a:     	movsldup	%xmm3, %xmm2            # xmm2 = xmm3[0,0,2,2]
14554930e:     	mulps	%xmm5, %xmm2
145549311:     	addps	%xmm4, %xmm2
145549314:     	jmp	0x14554921a <.text+0x554821a>
145549319:     	cmpq	%r14, 0x8(%r10,%rsi,8)
14554931e:     	je	0x145549240 <.text+0x5548240>
145549324:     	cmpl	$0x10, %r11d
145549328:     	je	0x1455492c4 <.text+0x55482c4>
14554932a:     	cmpq	%r14, 0x10(%r10,%rsi,8)
14554932f:     	je	0x145549240 <.text+0x5548240>
145549335:     	cmpl	$0x18, %r11d
145549339:     	je	0x1455492c4 <.text+0x55482c4>
14554933b:     	cmpq	%r14, 0x18(%r10,%rsi,8)
145549340:     	je	0x145549240 <.text+0x5548240>
145549346:     	cmpl	$0x20, %r11d
14554934a:     	je	0x1455492c4 <.text+0x55482c4>
145549350:     	cmpq	%r14, 0x20(%r10,%rsi,8)
145549355:     	je	0x145549240 <.text+0x5548240>
14554935b:     	cmpl	$0x28, %r11d
14554935f:     	je	0x1455492c4 <.text+0x55482c4>
145549365:     	cmpq	%r14, 0x28(%r10,%rsi,8)
14554936a:     	je	0x145549240 <.text+0x5548240>
145549370:     	cmpl	$0x30, %r11d
145549374:     	je	0x1455492c4 <.text+0x55482c4>
14554937a:     	cmpq	%r14, 0x30(%r10,%rsi,8)
14554937f:     	je	0x145549240 <.text+0x5548240>
145549385:     	cmpl	$0x38, %r11d
145549389:     	je	0x1455492c4 <.text+0x55482c4>
14554938f:     	jmp	0x145549240 <.text+0x5548240>
145549394:     	movq	%rcx, (%rdx)
145549397:     	xorl	%ecx, %ecx
145549399:     	movq	%rcx, (%rax)
14554939c:     	popq	%rbx
14554939d:     	popq	%rdi
14554939e:     	popq	%rsi
14554939f:     	popq	%r12
1455493a1:     	popq	%r14
1455493a3:     	popq	%r15
1455493a5:     	retq
1455493a6:     	movq	%rcx, (%rdx)
1455493a9:     	movss	%xmm3, 0x8(%rax)
1455493ae:     	movq	%r14, 0x10(%rax)
1455493b2:     	movl	$0x1, %ecx
1455493b7:     	jmp	0x145549399 <.text+0x5548399>

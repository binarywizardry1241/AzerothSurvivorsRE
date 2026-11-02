
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b0300:     	pushq	%r15
1459b0302:     	pushq	%r14
1459b0304:     	pushq	%r12
1459b0306:     	pushq	%rsi
1459b0307:     	pushq	%rdi
1459b0308:     	pushq	%rbx
1459b0309:     	movq	%rcx, %rax
1459b030c:     	movq	(%rdx), %rcx
1459b030f:     	movq	0x8(%rdx), %r9
1459b0313:     	cmpq	%r9, %rcx
1459b0316:     	je	0x1459b04d7 <.text+0x59af4d7>
1459b031c:     	movq	0x10(%rdx), %r10
1459b0320:     	movq	0x18(%rdx), %r11
1459b0324:     	movabsq	$0xffffffffffffff8, %rsi # imm = 0xFFFFFFFFFFFFFF8
1459b032e:     	andq	%r11, %rsi
1459b0331:     	shll	$0x3, %r11d
1459b0335:     	andl	$0x38, %r11d
1459b0339:     	movq	0x20(%rdx), %rdi
1459b033d:     	movq	0x28(%rdx), %rbx
1459b0341:     	movq	(%r8), %r8
1459b0344:     	xorps	%xmm0, %xmm0
1459b0347:     	movss	0x3bd01d(%rip), %xmm1   # 0x145d6d36c
1459b034f:     	jmp	0x1459b0389 <.text+0x59af389>
1459b0351:     	movsd	0x118(%r15), %xmm2
1459b035a:     	movsd	(%rbx), %xmm3
1459b035e:     	subps	%xmm3, %xmm2
1459b0361:     	mulps	%xmm2, %xmm2
1459b0364:     	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
1459b0368:     	addss	%xmm2, %xmm3
1459b036c:     	movss	(%r8), %xmm2
1459b0371:     	ucomiss	%xmm3, %xmm2
1459b0374:     	jae	0x1459b04e6 <.text+0x59af4e6>
1459b037a:     	nopw	(%rax,%rax)
1459b0380:     	cmpq	%r9, %rcx
1459b0383:     	je	0x1459b04d4 <.text+0x59af4d4>
1459b0389:     	movq	%rcx, %r15
1459b038c:     	addq	$0x160, %rcx            # imm = 0x160
1459b0393:     	cmpb	$0x0, 0x68(%r15)
1459b0398:     	jne	0x1459b0380 <.text+0x59af380>
1459b039a:     	movq	0x88(%r15), %r14
1459b03a1:     	xorl	%r12d, %r12d
1459b03a4:     	nopw	%cs:(%rax,%rax)
1459b03b0:     	cmpq	%r12, %rsi
1459b03b3:     	je	0x1459b03f3 <.text+0x59af3f3>
1459b03b5:     	cmpq	%r14, (%r10,%r12,8)
1459b03b9:     	je	0x1459b0380 <.text+0x59af380>
1459b03bb:     	cmpq	%r14, 0x8(%r10,%r12,8)
1459b03c0:     	je	0x1459b0380 <.text+0x59af380>
1459b03c2:     	cmpq	%r14, 0x10(%r10,%r12,8)
1459b03c7:     	je	0x1459b0380 <.text+0x59af380>
1459b03c9:     	cmpq	%r14, 0x18(%r10,%r12,8)
1459b03ce:     	je	0x1459b0380 <.text+0x59af380>
1459b03d0:     	cmpq	%r14, 0x20(%r10,%r12,8)
1459b03d5:     	je	0x1459b0380 <.text+0x59af380>
1459b03d7:     	cmpq	%r14, 0x28(%r10,%r12,8)
1459b03dc:     	je	0x1459b0380 <.text+0x59af380>
1459b03de:     	cmpq	%r14, 0x30(%r10,%r12,8)
1459b03e3:     	je	0x1459b0380 <.text+0x59af380>
1459b03e5:     	cmpq	%r14, 0x38(%r10,%r12,8)
1459b03ea:     	leaq	0x8(%r12), %r12
1459b03ef:     	jne	0x1459b03b0 <.text+0x59af3b0>
1459b03f1:     	jmp	0x1459b0380 <.text+0x59af380>
1459b03f3:     	testq	%r11, %r11
1459b03f6:     	je	0x1459b0404 <.text+0x59af404>
1459b03f8:     	cmpq	%r14, (%r10,%rsi,8)
1459b03fc:     	je	0x1459b0380 <.text+0x59af380>
1459b03fe:     	cmpl	$0x8, %r11d
1459b0402:     	jne	0x1459b0459 <.text+0x59af459>
1459b0404:     	movss	0x128(%r15), %xmm2
1459b040d:     	ucomiss	%xmm2, %xmm0
1459b0410:     	jae	0x1459b0351 <.text+0x59af351>
1459b0416:     	movss	(%rdi), %xmm3
1459b041a:     	subss	0x124(%r15), %xmm3
1459b0423:     	divss	%xmm2, %xmm3
1459b0427:     	xorps	%xmm2, %xmm2
1459b042a:     	maxss	%xmm3, %xmm2
1459b042e:     	movaps	%xmm1, %xmm3
1459b0431:     	minss	%xmm2, %xmm3
1459b0435:     	movsd	0x10c(%r15), %xmm4
1459b043e:     	movsd	0x118(%r15), %xmm5
1459b0447:     	subps	%xmm4, %xmm5
1459b044a:     	movsldup	%xmm3, %xmm2            # xmm2 = xmm3[0,0,2,2]
1459b044e:     	mulps	%xmm5, %xmm2
1459b0451:     	addps	%xmm4, %xmm2
1459b0454:     	jmp	0x1459b035a <.text+0x59af35a>
1459b0459:     	cmpq	%r14, 0x8(%r10,%rsi,8)
1459b045e:     	je	0x1459b0380 <.text+0x59af380>
1459b0464:     	cmpl	$0x10, %r11d
1459b0468:     	je	0x1459b0404 <.text+0x59af404>
1459b046a:     	cmpq	%r14, 0x10(%r10,%rsi,8)
1459b046f:     	je	0x1459b0380 <.text+0x59af380>
1459b0475:     	cmpl	$0x18, %r11d
1459b0479:     	je	0x1459b0404 <.text+0x59af404>
1459b047b:     	cmpq	%r14, 0x18(%r10,%rsi,8)
1459b0480:     	je	0x1459b0380 <.text+0x59af380>
1459b0486:     	cmpl	$0x20, %r11d
1459b048a:     	je	0x1459b0404 <.text+0x59af404>
1459b0490:     	cmpq	%r14, 0x20(%r10,%rsi,8)
1459b0495:     	je	0x1459b0380 <.text+0x59af380>
1459b049b:     	cmpl	$0x28, %r11d
1459b049f:     	je	0x1459b0404 <.text+0x59af404>
1459b04a5:     	cmpq	%r14, 0x28(%r10,%rsi,8)
1459b04aa:     	je	0x1459b0380 <.text+0x59af380>
1459b04b0:     	cmpl	$0x30, %r11d
1459b04b4:     	je	0x1459b0404 <.text+0x59af404>
1459b04ba:     	cmpq	%r14, 0x30(%r10,%rsi,8)
1459b04bf:     	je	0x1459b0380 <.text+0x59af380>
1459b04c5:     	cmpl	$0x38, %r11d
1459b04c9:     	je	0x1459b0404 <.text+0x59af404>
1459b04cf:     	jmp	0x1459b0380 <.text+0x59af380>
1459b04d4:     	movq	%rcx, (%rdx)
1459b04d7:     	xorl	%ecx, %ecx
1459b04d9:     	movq	%rcx, (%rax)
1459b04dc:     	popq	%rbx
1459b04dd:     	popq	%rdi
1459b04de:     	popq	%rsi
1459b04df:     	popq	%r12
1459b04e1:     	popq	%r14
1459b04e3:     	popq	%r15
1459b04e5:     	retq
1459b04e6:     	movq	%rcx, (%rdx)
1459b04e9:     	movss	%xmm3, 0x8(%rax)
1459b04ee:     	movq	%r14, 0x10(%rax)
1459b04f2:     	movl	$0x1, %ecx
1459b04f7:     	jmp	0x1459b04d9 <.text+0x59af4d9>

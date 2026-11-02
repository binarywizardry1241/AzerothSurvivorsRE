
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140836110:     	pushq	%r15
140836112:     	pushq	%r14
140836114:     	pushq	%r13
140836116:     	pushq	%r12
140836118:     	pushq	%rsi
140836119:     	pushq	%rdi
14083611a:     	pushq	%rbp
14083611b:     	pushq	%rbx
14083611c:     	subq	$0x128, %rsp            # imm = 0x128
140836123:     	movq	(%r8), %r14
140836126:     	testq	%r14, %r14
140836129:     	je	0x14083644f <.text+0x83544f>
14083612f:     	movq	0x198(%rsp), %rax
140836137:     	movq	(%rdx), %rdi
14083613a:     	movq	0x10(%rdx), %rcx
14083613e:     	movq	%rcx, 0x20(%rsp)
140836143:     	movl	0x1c(%rdx), %ebp
140836146:     	movq	(%r9), %r15
140836149:     	movq	(%rax), %rax
14083614c:     	movq	%rax, 0x28(%rsp)
140836151:     	testb	$0x1, 0x30(%r14)
140836156:     	je	0x140836197 <.text+0x835197>
140836158:     	movl	0x38(%r14), %esi
14083615c:     	movl	0x34(%r14), %ebx
140836160:     	movss	0x70(%rdi), %xmm1
140836165:     	movss	0x78(%rdi), %xmm0
14083616a:     	movaps	0x553766f(%rip), %xmm2  # 0x145d6d7e0
140836171:     	xorps	%xmm2, %xmm0
140836174:     	xorps	%xmm2, %xmm1
140836177:     	callq	0x145b4cb10 <.text+0x5b4bb10>
14083617c:     	cmpl	%eax, %ebx
14083617e:     	jne	0x140836197 <.text+0x835197>
140836180:     	cmpl	%edx, %esi
140836182:     	sete	%r12b
140836186:     	movq	0x190(%rsp), %rax
14083618e:     	cmpb	$0x0, 0x3c(%r14)
140836193:     	jne	0x1408361a9 <.text+0x8351a9>
140836195:     	jmp	0x1408361c7 <.text+0x8351c7>
140836197:     	xorl	%r12d, %r12d
14083619a:     	movq	0x190(%rsp), %rax
1408361a2:     	cmpb	$0x0, 0x3c(%r14)
1408361a7:     	je	0x1408361c7 <.text+0x8351c7>
1408361a9:     	cmpq	$0x0, 0x8(%r14)
1408361ae:     	setne	%cl
1408361b1:     	andb	%r12b, %cl
1408361b4:     	cmpb	$0x1, %cl
1408361b7:     	jne	0x1408361c7 <.text+0x8351c7>
1408361b9:     	movq	0x20(%rsp), %rcx
1408361be:     	movl	%ebp, (%rcx)
1408361c0:     	movb	$0x0, 0xec(%rdi)
1408361c7:     	movq	(%r14), %rcx
1408361ca:     	movq	0x8(%r14), %rdx
1408361ce:     	movq	0x10(%r14), %rsi
1408361d2:     	movq	0x18(%r14), %r13
1408361d6:     	movq	0x20(%r14), %r8
1408361da:     	movq	0x28(%r14), %rbx
1408361de:     	movq	0x30(%rax), %r9
1408361e2:     	movq	%r9, 0xe0(%rsp)
1408361ea:     	movups	(%rax), %xmm0
1408361ed:     	movups	0x10(%rax), %xmm1
1408361f1:     	movups	0x20(%rax), %xmm2
1408361f5:     	movaps	%xmm2, 0xd0(%rsp)
1408361fd:     	movaps	%xmm1, 0xc0(%rsp)
140836205:     	movaps	%xmm0, 0xb0(%rsp)
14083620d:     	movq	$0x1, (%rax)
140836214:     	movq	%rcx, 0x8(%rax)
140836218:     	movq	%rdx, 0x10(%rax)
14083621c:     	movq	%rsi, 0x18(%rax)
140836220:     	movq	%r13, 0x20(%rax)
140836224:     	movq	%r8, 0x28(%rax)
140836228:     	movq	%rbx, 0x30(%rax)
14083622c:     	movq	$0x1, 0x30(%rsp)
140836235:     	movq	%rcx, 0x38(%rsp)
14083623a:     	movq	%rdx, 0x40(%rsp)
14083623f:     	movq	%rsi, 0x48(%rsp)
140836244:     	movq	%r13, 0x50(%rsp)
140836249:     	movq	%r8, 0x58(%rsp)
14083624e:     	movq	%rbx, 0x60(%rsp)
140836253:     	movb	$0x1, %al
140836255:     	testb	$0x1, 0xb0(%rsp)
14083625d:     	je	0x14083627c <.text+0x83527c>
14083625f:     	leaq	0x38(%rsp), %rdx
140836264:     	leaq	0xb8(%rsp), %rcx
14083626c:     	movl	$0x30, %r8d
140836272:     	callq	0x145bc9787 <.text+0x5bc8787>
140836277:     	testl	%eax, %eax
140836279:     	setne	%al
14083627c:     	cmpb	$0x1, 0xeb(%rdi)
140836283:     	jne	0x14083644f <.text+0x83544f>
140836289:     	movss	0x5c(%r15), %xmm1
14083628f:     	orq	%rsi, %r13
140836292:     	orq	%rbx, %r13
140836295:     	sete	%dl
140836298:     	andb	0x3d(%r14), %dl
14083629c:     	movzbl	0xec(%rdi), %ecx
1408362a3:     	movl	%ecx, %r8d
1408362a6:     	xorb	$0x1, %r8b
1408362aa:     	andb	%dl, %r8b
1408362ad:     	testb	%r12b, %r8b
1408362b0:     	je	0x1408362e6 <.text+0x8352e6>
1408362b2:     	movq	0x20(%rsp), %rax
1408362b7:     	movl	%ebp, (%rax)
1408362b9:     	movb	$0x0, 0xeb(%rdi)
1408362c0:     	subss	0xa4(%rdi), %xmm1
1408362c8:     	movl	0x78(%rdi), %eax
1408362cb:     	movl	%eax, 0x38(%rsp)
1408362cf:     	movq	0x70(%rdi), %rax
1408362d3:     	movq	%rax, 0x30(%rsp)
1408362d8:     	leaq	0x30(%rsp), %r8
1408362dd:     	movb	$0x1, %cl
1408362df:     	callq	0x1409bd600 <.text+0x9bc600>
1408362e4:     	jmp	0x140836313 <.text+0x835313>
1408362e6:     	orb	%al, %cl
1408362e8:     	testb	$0x1, %cl
1408362eb:     	je	0x140836306 <.text+0x835306>
1408362ed:     	movq	0x20(%rsp), %rax
1408362f2:     	movl	%ebp, (%rax)
1408362f4:     	addss	0x553712c(%rip), %xmm1  # 0x145d6d428
1408362fc:     	movss	%xmm1, 0xa0(%rdi)
140836304:     	jmp	0x140836313 <.text+0x835313>
140836306:     	ucomiss	0xa0(%rdi), %xmm1
14083630d:     	jae	0x140836419 <.text+0x835419>
140836313:     	cmpb	$0x0, 0xeb(%rdi)
14083631a:     	jne	0x14083644f <.text+0x83544f>
140836320:     	cmpq	$0x0, 0x28(%rsp)
140836326:     	setne	%al
140836329:     	andb	0xee(%rdi), %al
14083632f:     	cmpb	$0x1, %al
140836331:     	jne	0x14083644f <.text+0x83544f>
140836337:     	movq	0x20(%rsp), %rax
14083633c:     	movl	%ebp, (%rax)
14083633e:     	movb	$0x0, 0xee(%rdi)
140836345:     	movw	$0x8, 0x30(%rsp)
14083634c:     	leaq	0xb0(%rsp), %rdi
140836354:     	leaq	0x30(%rsp), %r8
140836359:     	movq	%rdi, %rcx
14083635c:     	movq	0x28(%rsp), %rdx
140836361:     	callq	0x140ec6530 <.text+0xec5530>
140836366:     	movq	%rdi, %rcx
140836369:     	callq	0x1407b0df0 <.text+0x7afdf0>
14083636e:     	movq	0x77c0c33(%rip), %rax   # 0x147ff6fa8
140836375:     	movq	(%rax), %rax
140836378:     	cmpq	$0x2, %rax
14083637c:     	ja	0x14083644f <.text+0x83544f>
140836382:     	movzbl	0x7786e4f(%rip), %edx   # 0x147fbd1d8
140836389:     	movzbl	%dl, %eax
14083638c:     	leal	-0x1(%rax), %ecx
14083638f:     	cmpl	$0x2, %ecx
140836392:     	jae	0x14083644b <.text+0x83544b>
140836398:     	movq	0x7786e29(%rip), %rcx   # 0x147fbd1c8
14083639f:     	callq	0x144c46ce0 <.text+0x4c45ce0>
1408363a4:     	testb	%al, %al
1408363a6:     	je	0x14083644f <.text+0x83544f>
1408363ac:     	movq	0x7786e15(%rip), %rcx   # 0x147fbd1c8
1408363b3:     	leaq	0x30(%rcx), %rax
1408363b7:     	leaq	0x56a72f6(%rip), %rdx   # 0x145edd6b4
1408363be:     	movq	%rdx, 0xb0(%rsp)
1408363c6:     	movq	$0x4b, 0xb8(%rsp)
1408363d2:     	movq	%rdi, 0xa0(%rsp)
1408363da:     	leaq	0x56a26ef(%rip), %rdx   # 0x145ed8ad0
1408363e1:     	movq	%rdx, 0xa8(%rsp)
1408363e9:     	movq	$0x1, 0x30(%rsp)
1408363f2:     	leaq	0xa0(%rsp), %rdx
1408363fa:     	movq	%rdx, 0x38(%rsp)
1408363ff:     	movq	$0x1, 0x40(%rsp)
140836408:     	movq	%rax, 0x48(%rsp)
14083640d:     	leaq	0x30(%rsp), %rdx
140836412:     	callq	0x144c48500 <.text+0x4c47500>
140836417:     	jmp	0x14083644f <.text+0x83544f>
140836419:     	movq	0x20(%rsp), %rax
14083641e:     	movl	%ebp, (%rax)
140836420:     	movb	$0x0, 0xeb(%rdi)
140836427:     	subss	0xa4(%rdi), %xmm1
14083642f:     	movl	0x78(%rdi), %eax
140836432:     	movl	%eax, 0x38(%rsp)
140836436:     	movq	0x70(%rdi), %rax
14083643a:     	movq	%rax, 0x30(%rsp)
14083643f:     	leaq	0x30(%rsp), %r8
140836444:     	xorl	%ecx, %ecx
140836446:     	jmp	0x1408362df <.text+0x8352df>
14083644b:     	testl	%eax, %eax
14083644d:     	jne	0x140836463 <.text+0x835463>
14083644f:     	addq	$0x128, %rsp            # imm = 0x128
140836456:     	popq	%rbx
140836457:     	popq	%rbp
140836458:     	popq	%rdi
140836459:     	popq	%rsi
14083645a:     	popq	%r12
14083645c:     	popq	%r13
14083645e:     	popq	%r14
140836460:     	popq	%r15
140836462:     	retq
140836463:     	leaq	0x7786d5e(%rip), %rcx   # 0x147fbd1c8
14083646a:     	callq	0x145d15470 <.text+0x5d14470>
14083646f:     	movl	%eax, %edx
140836471:     	testb	%al, %al
140836473:     	jne	0x140836398 <.text+0x835398>
140836479:     	jmp	0x14083644f <.text+0x83544f>

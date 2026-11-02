
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
141716050:     	pushq	%r15
141716052:     	pushq	%r14
141716054:     	pushq	%r12
141716056:     	pushq	%rsi
141716057:     	pushq	%rdi
141716058:     	pushq	%rbp
141716059:     	pushq	%rbx
14171605a:     	subq	$0x40, %rsp
14171605e:     	movq	%r9, %rsi
141716061:     	movq	%rdx, %r14
141716064:     	movq	%rcx, %r15
141716067:     	movd	0x4(%r8), %xmm2
14171606d:     	movd	0x8(%r8), %xmm0
141716073:     	movdqa	0x41e2ed5(%rip), %xmm3  # 0x1458f8f50
14171607b:     	pxor	%xmm3, %xmm0
14171607f:     	movd	(%r8), %xmm1
141716084:     	pxor	%xmm3, %xmm1
141716088:     	movd	%xmm0, 0x34(%rsp)
14171608e:     	movd	%xmm1, 0x38(%rsp)
141716094:     	movd	%xmm2, 0x3c(%rsp)
14171609a:     	callq	0x1456bd950 <.text+0x56bc950>
14171609f:     	movl	%eax, %edi
1417160a1:     	movl	%edx, %ebx
1417160a3:     	movl	%eax, 0x2c(%rsp)
1417160a7:     	movl	%edx, 0x30(%rsp)
1417160ab:     	movq	0x8(%rsi), %r8
1417160af:     	testq	%r8, %r8
1417160b2:     	je	0x1417160d4 <.text+0x17150d4>
1417160b4:     	cmpl	%edi, (%rsi)
1417160b6:     	jne	0x1417160d4 <.text+0x17150d4>
1417160b8:     	cmpl	%ebx, 0x4(%rsi)
1417160bb:     	jne	0x1417160d4 <.text+0x17150d4>
1417160bd:     	movq	0x50(%r8), %rcx
1417160c1:     	movq	0x58(%r8), %rdx
1417160c5:     	leaq	0x34(%rsp), %r8
1417160ca:     	callq	0x145673220 <.text+0x5672220>
1417160cf:     	jmp	0x1417162a2 <.text+0x17152a2>
1417160d4:     	cmpq	$0x0, 0x48(%r15)
1417160d9:     	je	0x1417162a0 <.text+0x17152a0>
1417160df:     	leaq	0x50(%r15), %rcx
1417160e3:     	leaq	0x2c(%rsp), %rdx
1417160e8:     	callq	0x140bb7fc0 <.text+0xbb6fc0>
1417160ed:     	movq	%rax, %r8
1417160f0:     	shrq	$0x39, %r8
1417160f4:     	movq	0x30(%r15), %rdx
1417160f8:     	movq	0x38(%r15), %rcx
1417160fc:     	movd	%r8d, %xmm0
141716101:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
141716105:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
14171610a:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
14171610f:     	xorl	%r8d, %r8d
141716112:     	pcmpeqd	%xmm1, %xmm1
141716116:     	andq	%rcx, %rax
141716119:     	movdqu	(%rdx,%rax), %xmm2
14171611e:     	movdqa	%xmm2, %xmm3
141716122:     	pcmpeqb	%xmm0, %xmm3
141716126:     	pmovmskb	%xmm3, %r9d
14171612b:     	testl	%r9d, %r9d
14171612e:     	je	0x141716166 <.text+0x1715166>
141716130:     	tzcntl	%r9d, %r10d
141716135:     	addq	%rax, %r10
141716138:     	andq	%rcx, %r10
14171613b:     	negq	%r10
14171613e:     	imulq	$0xd0, %r10, %r10
141716145:     	cmpl	-0xd0(%rdx,%r10), %edi
14171614d:     	jne	0x141716159 <.text+0x1715159>
14171614f:     	cmpl	-0xcc(%rdx,%r10), %ebx
141716157:     	je	0x141716185 <.text+0x1715185>
141716159:     	leal	-0x1(%r9), %r10d
14171615d:     	andw	%r9w, %r10w
141716161:     	movl	%r10d, %r9d
141716164:     	jne	0x141716130 <.text+0x1715130>
141716166:     	pcmpeqb	%xmm1, %xmm2
14171616a:     	pmovmskb	%xmm2, %r9d
14171616f:     	testl	%r9d, %r9d
141716172:     	jne	0x1417162a0 <.text+0x17152a0>
141716178:     	addq	%r8, %rax
14171617b:     	addq	$0x10, %rax
14171617f:     	addq	$0x10, %r8
141716183:     	jmp	0x141716116 <.text+0x1715116>
141716185:     	addq	%r10, %rdx
141716188:     	cmpb	$0x1, -0x50(%rdx)
14171618c:     	jne	0x1417162b1 <.text+0x17152b1>
141716192:     	cmpq	$0x0, 0x90(%r14)
14171619a:     	je	0x1417162a0 <.text+0x17152a0>
1417161a0:     	movzwl	-0x4f(%rdx), %eax
1417161a4:     	movzbl	-0x4d(%rdx), %r8d
1417161a9:     	shll	$0x10, %r8d
1417161ad:     	orq	%rax, %r8
1417161b0:     	movl	-0x4c(%rdx), %eax
1417161b3:     	movl	-0x48(%rdx), %ecx
1417161b6:     	movzbl	-0x40(%rdx), %r9d
1417161bb:     	movl	-0x44(%rdx), %edx
1417161be:     	shlq	$0x18, %rax
1417161c2:     	orq	%r8, %rax
1417161c5:     	movl	%ecx, %r8d
1417161c8:     	shrl	$0x8, %r8d
1417161cc:     	shlq	$0x38, %rcx
1417161d0:     	orq	%rax, %rcx
1417161d3:     	shlq	$0x18, %rdx
1417161d7:     	shlq	$0x38, %r9
1417161db:     	orq	%rdx, %r9
1417161de:     	orq	%r8, %r9
1417161e1:     	movabsq	$-0x210e623f01a31098, %rdx # imm = 0xDEF19DC0FE5CEF68
1417161eb:     	xorq	%rcx, %rdx
1417161ee:     	movabsq	$0x3f84d5b5b5470917, %rax # imm = 0x3F84D5B5B5470917
1417161f8:     	xorq	%r9, %rax
1417161fb:     	mulq	%rdx
1417161fe:     	xorq	%rax, %rdx
141716201:     	movq	%rdx, %r10
141716204:     	shrq	$0x39, %r10
141716208:     	movq	0x78(%r14), %r8
14171620c:     	movq	0x80(%r14), %rax
141716213:     	movd	%r10d, %xmm0
141716218:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
14171621c:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
141716221:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
141716226:     	xorl	%r10d, %r10d
141716229:     	pcmpeqd	%xmm1, %xmm1
14171622d:     	andq	%rax, %rdx
141716230:     	movdqu	(%r8,%rdx), %xmm2
141716236:     	movdqa	%xmm2, %xmm3
14171623a:     	pcmpeqb	%xmm0, %xmm3
14171623e:     	pmovmskb	%xmm3, %r11d
141716243:     	testl	%r11d, %r11d
141716246:     	je	0x141716285 <.text+0x1715285>
141716248:     	tzcntl	%r11d, %r14d
14171624d:     	addq	%rdx, %r14
141716250:     	andq	%rax, %r14
141716253:     	negq	%r14
141716256:     	imulq	$0xb8, %r14, %r14
14171625d:     	movq	-0xb0(%r8,%r14), %r15
141716265:     	xorq	%r9, %r15
141716268:     	movq	-0xb8(%r8,%r14), %r12
141716270:     	xorq	%rcx, %r12
141716273:     	orq	%r15, %r12
141716276:     	je	0x1417162ec <.text+0x17152ec>
141716278:     	leal	-0x1(%r11), %ebp
14171627c:     	andw	%r11w, %bp
141716280:     	movl	%ebp, %r11d
141716283:     	jne	0x141716248 <.text+0x1715248>
141716285:     	pcmpeqb	%xmm1, %xmm2
141716289:     	pmovmskb	%xmm2, %r11d
14171628e:     	testl	%r11d, %r11d
141716291:     	jne	0x1417162a0 <.text+0x17152a0>
141716293:     	addq	%r10, %rdx
141716296:     	addq	$0x10, %rdx
14171629a:     	addq	$0x10, %r10
14171629e:     	jmp	0x14171622d <.text+0x171522d>
1417162a0:     	xorl	%eax, %eax
1417162a2:     	addq	$0x40, %rsp
1417162a6:     	popq	%rbx
1417162a7:     	popq	%rbp
1417162a8:     	popq	%rdi
1417162a9:     	popq	%rsi
1417162aa:     	popq	%r12
1417162ac:     	popq	%r14
1417162ae:     	popq	%r15
1417162b0:     	retq
1417162b1:     	movq	-0x48(%rdx), %rcx
1417162b5:     	movl	0x6c(%rcx), %edx
1417162b8:     	xorl	%eax, %eax
1417162ba:     	cmpq	%rdx, 0x48(%r14)
1417162be:     	jbe	0x1417162a2 <.text+0x17152a2>
1417162c0:     	movq	0x40(%r14), %r8
1417162c4:     	imulq	$0xb0, %rdx, %rdx
1417162cb:     	movq	(%r8,%rdx), %r9
1417162cf:     	cmpq	$-0x2, %r9
1417162d3:     	je	0x1417162a2 <.text+0x17152a2>
1417162d5:     	cmpq	$-0x1, %r9
1417162d9:     	je	0x1417162a2 <.text+0x17152a2>
1417162db:     	movl	0x68(%rcx), %ecx
1417162de:     	addq	%rdx, %r8
1417162e1:     	cmpl	%ecx, 0xa8(%r8)
1417162e8:     	je	0x1417162f6 <.text+0x17152f6>
1417162ea:     	jmp	0x1417162a2 <.text+0x17152a2>
1417162ec:     	addq	%r14, %r8
1417162ef:     	addq	$-0xa8, %r8
1417162f6:     	movl	%edi, (%rsi)
1417162f8:     	movl	%ebx, 0x4(%rsi)
1417162fb:     	movq	%r8, 0x8(%rsi)
1417162ff:     	jmp	0x1417160bd <.text+0x17150bd>

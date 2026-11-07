
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140159200:     	pushq	%rsi
140159201:     	pushq	%rdi
140159202:     	pushq	%rbx
140159203:     	subq	$0xc0, %rsp
14015920a:     	cmpq	$0x0, 0x90(%rcx)
140159212:     	je	0x140159361 <.text+0x158361>
140159218:     	movq	%rcx, %rsi
14015921b:     	movq	0x78(%rcx), %rax
14015921f:     	movq	0x80(%rcx), %rcx
140159226:     	movabsq	$0x722e4192a073d16, %rdx # imm = 0x722E4192A073D16
140159230:     	xorl	%r8d, %r8d
140159233:     	movdqa	0x5c5cb65(%rip), %xmm0  # 0x145db5da0
14015923b:     	pcmpeqd	%xmm1, %xmm1
14015923f:     	movdqa	0x5c5cb69(%rip), %xmm2  # 0x145db5db0
140159247:     	andq	%rcx, %rdx
14015924a:     	movdqu	(%rax,%rdx), %xmm3
14015924f:     	movdqa	%xmm3, %xmm4
140159253:     	pcmpeqb	%xmm0, %xmm4
140159257:     	pmovmskb	%xmm4, %r9d
14015925c:     	testl	%r9d, %r9d
14015925f:     	je	0x1401592a0 <.text+0x1582a0>
140159261:     	tzcntl	%r9d, %r10d
140159266:     	addq	%rdx, %r10
140159269:     	andq	%rcx, %r10
14015926c:     	negq	%r10
14015926f:     	leaq	(%r10,%r10,2), %r10
140159273:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14015927a:     	pcmpeqb	%xmm2, %xmm4
14015927e:     	pmovmskb	%xmm4, %r11d
140159283:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14015928a:     	je	0x1401592bf <.text+0x1582bf>
14015928c:     	leal	-0x1(%r9), %r10d
140159290:     	andw	%r9w, %r10w
140159294:     	movl	%r10d, %r9d
140159297:     	jne	0x140159261 <.text+0x158261>
140159299:     	nopl	(%rax)
1401592a0:     	pcmpeqb	%xmm1, %xmm3
1401592a4:     	pmovmskb	%xmm3, %r9d
1401592a9:     	testl	%r9d, %r9d
1401592ac:     	jne	0x140159361 <.text+0x158361>
1401592b2:     	addq	%r8, %rdx
1401592b5:     	addq	$0x10, %rdx
1401592b9:     	addq	$0x10, %r8
1401592bd:     	jmp	0x140159247 <.text+0x158247>
1401592bf:     	leaq	(%rax,%r10,8), %rax
1401592c3:     	movq	-0x8(%rax), %rax
1401592c7:     	cmpq	0x218(%rsi), %rax
1401592ce:     	jae	0x140159361 <.text+0x158361>
1401592d4:     	movq	0x210(%rsi), %rcx
1401592db:     	movq	(%rcx,%rax,8), %rcx
1401592df:     	testq	%rcx, %rcx
1401592e2:     	je	0x140159361 <.text+0x158361>
1401592e4:     	movq	0x1e0(%rsi), %rax
1401592eb:     	notq	%rcx
1401592ee:     	imulq	$0x38, %rcx, %rcx
1401592f2:     	cmpb	$0x0, 0x30(%rax,%rcx)
1401592f7:     	je	0x140159361 <.text+0x158361>
1401592f9:     	addq	%rcx, %rax
1401592fc:     	movq	0x10(%rax), %rcx
140159300:     	movl	0x5b0(%rsi), %edx
140159306:     	movl	%edx, 0x2c(%rax)
140159309:     	callq	0x140003c40 <.text+0x2c40>
14015930e:     	movq	%rax, %rdi
140159311:     	leaq	0x50(%rsp), %rbx
140159316:     	movq	%rbx, %rcx
140159319:     	callq	0x14006cdd0 <.text+0x6bdd0>
14015931e:     	leaq	0x30(%rsp), %rcx
140159323:     	movq	%rdi, %rdx
140159326:     	movq	%rbx, %r8
140159329:     	xorl	%r9d, %r9d
14015932c:     	callq	0x140008db0 <.text+0x7db0>
140159331:     	movq	0x30(%rsp), %rax
140159336:     	testq	%rax, %rax
140159339:     	je	0x140159353 <.text+0x158353>
14015933b:     	movq	0x38(%rsp), %rcx
140159340:     	shlq	$0x2, %rax
140159344:     	leaq	(%rax,%rax,2), %rdx
140159348:     	movl	$0x4, %r8d
14015934e:     	callq	0x1400021d0 <.text+0x11d0>
140159353:     	movq	%rsi, %rax
140159356:     	addq	$0xc0, %rsp
14015935d:     	popq	%rbx
14015935e:     	popq	%rdi
14015935f:     	popq	%rsi
140159360:     	retq
140159361:     	leaq	0x2f(%rsp), %rax
140159366:     	movq	%rax, 0x50(%rsp)
14015936b:     	leaq	0x4e8d2fe(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
140159372:     	movq	%rax, 0x58(%rsp)
140159377:     	leaq	0x5c5ce52(%rip), %rcx   # 0x145db61d0
14015937e:     	leaq	0x5c5ce33(%rip), %r8    # 0x145db61b8
140159385:     	leaq	0x50(%rsp), %rdx
14015938a:     	callq	0x145d699c0 <.text+0x5d689c0>
14015938f:     	ud2

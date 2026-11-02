
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459183da:     	movq	0x780(%r13), %rdx
1459183e1:     	testq	%rdx, %rdx
1459183e4:     	je	0x1459183ff <.text+0x59173ff>
1459183e6:     	movq	0x778(%r13), %rax
1459183ed:     	cmpq	$0x1, %rdx
1459183f1:     	jne	0x145918403 <.text+0x5917403>
1459183f3:     	movss	0x458875(%rip), %xmm0   # 0x145d70c70
1459183fb:     	xorl	%ecx, %ecx
1459183fd:     	jmp	0x14591845a <.text+0x591745a>
1459183ff:     	xorl	%eax, %eax
145918401:     	jmp	0x14591846f <.text+0x591746f>
145918403:     	movq	%rdx, %r8
145918406:     	andq	$-0x2, %r8
14591840a:     	movss	0x45885e(%rip), %xmm0   # 0x145d70c70
145918412:     	xorl	%ecx, %ecx
145918414:     	jmp	0x145918429 <.text+0x5917429>
145918416:     	nopw	%cs:(%rax,%rax)
145918420:     	addq	$0x2, %rcx
145918424:     	cmpq	%rcx, %r8
145918427:     	je	0x145918455 <.text+0x5917455>
145918429:     	cmpb	$0x20, (%rax,%rcx,8)
14591842d:     	je	0x145918440 <.text+0x5917440>
14591842f:     	cmpb	$0x20, 0x8(%rax,%rcx,8)
145918434:     	jne	0x145918420 <.text+0x5917420>
145918436:     	jmp	0x14591844d <.text+0x591744d>
145918438:     	nopl	(%rax,%rax)
145918440:     	addss	0x4(%rax,%rcx,8), %xmm0
145918446:     	cmpb	$0x20, 0x8(%rax,%rcx,8)
14591844b:     	jne	0x145918420 <.text+0x5917420>
14591844d:     	addss	0xc(%rax,%rcx,8), %xmm0
145918453:     	jmp	0x145918420 <.text+0x5917420>
145918455:     	testb	$0x1, %dl
145918458:     	je	0x145918466 <.text+0x5917466>
14591845a:     	cmpb	$0x20, (%rax,%rcx,8)
14591845e:     	jne	0x145918466 <.text+0x5917466>
145918460:     	addss	0x4(%rax,%rcx,8), %xmm0
145918466:     	xorps	%xmm1, %xmm1
145918469:     	ucomiss	%xmm1, %xmm0
14591846c:     	seta	%al
14591846f:     	movb	%al, 0x98(%rbp)
145918475:     	movq	0x7a8(%r13), %rax
14591847c:     	movq	0x7b0(%r13), %rcx
145918483:     	shlq	$0x6, %rcx
145918487:     	addq	%rax, %rcx
14591848a:     	movq	%rax, 0x140(%rbp)
145918491:     	movq	%rcx, 0x148(%rbp)
145918498:     	movq	%rdi, 0x150(%rbp)
14591849f:     	leaq	0x118(%rbp), %rcx
1459184a6:     	leaq	0x140(%rbp), %rdx
1459184ad:     	callq	0x14599cd90 <.text+0x599bd90>
1459184b2:     	movq	0x128(%rbp), %rsi
1459184b9:     	cmpq	$0x1, %rsi
1459184bd:     	movq	%rsi, %rax
1459184c0:     	adcq	$0x0, %rax
1459184c4:     	movq	0x118(%rbp), %rcx
1459184cb:     	movq	%rcx, 0x180(%rbp)
1459184d2:     	movq	0x120(%rbp), %rcx
1459184d9:     	movq	%rcx, 0x190(%rbp)
1459184e0:     	testq	%rsi, %rsi
1459184e3:     	je	0x145918574 <.text+0x5917574>
1459184e9:     	cvtsi2ss	%rax, %xmm6
1459184ee:     	shlq	$0x3, %rsi
1459184f2:     	xorl	%ebx, %ebx
1459184f4:     	movss	0x455258(%rip), %xmm7   # 0x145d6d754
1459184fc:     	movss	0x4a70bb(%rip), %xmm8   # 0x145dbf5c0
145918505:     	movss	0x482a06(%rip), %xmm9   # 0x145d9af14
14591850e:     	leaq	0x140(%rbp), %r14
145918515:     	nopw	%cs:(%rax,%rax)
145918520:     	xorps	%xmm2, %xmm2
145918523:     	cvtsi2ss	%rbx, %xmm2
145918528:     	movq	0x190(%rbp), %rax
14591852f:     	movq	(%rax,%rbx,8), %rdx
145918533:     	mulss	%xmm7, %xmm2
145918537:     	divss	%xmm6, %xmm2
14591853b:     	addss	%xmm8, %xmm2
145918540:     	mulss	%xmm9, %xmm2
145918545:     	movq	$0x0, 0x140(%rbp)
145918550:     	movl	$0x0, 0x98(%rbp)
14591855a:     	movq	%rdi, 0x20(%rsp)
14591855f:     	movq	%r13, %rcx
145918562:     	movq	%r14, %r9
145918565:     	callq	0x145928bd0 <.text+0x5927bd0>
14591856a:     	nop
14591856b:     	incq	%rbx
14591856e:     	addq	$-0x8, %rsi
145918572:     	jne	0x145918520 <.text+0x5917520>
145918574:     	movq	0x180(%rbp), %rdx
14591857b:     	testq	%rdx, %rdx
14591857e:     	je	0x145918596 <.text+0x5917596>
145918580:     	shlq	$0x3, %rdx
145918584:     	movl	$0x8, %r8d
14591858a:     	movq	0x190(%rbp), %rcx
145918591:     	callq	0x1400021d0 <.text+0x11d0>

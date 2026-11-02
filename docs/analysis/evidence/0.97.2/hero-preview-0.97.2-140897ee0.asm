
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140897ee0:     	pushq	%rbp
140897ee1:     	pushq	%r15
140897ee3:     	pushq	%r14
140897ee5:     	pushq	%r13
140897ee7:     	pushq	%r12
140897ee9:     	pushq	%rsi
140897eea:     	pushq	%rdi
140897eeb:     	pushq	%rbx
140897eec:     	movl	$0x1b68, %eax           # imm = 0x1B68
140897ef1:     	callq	0x145756270 <.text+0x5755270>
140897ef6:     	subq	%rax, %rsp
140897ef9:     	leaq	0x80(%rsp), %rbp
140897f01:     	movq	$-0x2, 0x1ae0(%rbp)
140897f0c:     	movq	%r8, %rbx
140897f0f:     	movq	%rdx, %rdi
140897f12:     	movq	%rcx, %rsi
140897f15:     	cmpq	$-0x1, (%rdx)
140897f19:     	je	0x140897f66 <.text+0x896f66>
140897f1b:     	movq	0x5a0(%rbx), %rax
140897f22:     	movq	%rax, -0x50(%rbp)
140897f26:     	cmpq	%rax, 0xdc8(%rdi)
140897f2d:     	je	0x1408984c8 <.text+0x8974c8>
140897f33:     	addq	$0xdc8, %rdi            # imm = 0xDC8
140897f3a:     	leaq	0x5177997(%rip), %rax   # 0x145a0f8d8
140897f41:     	movq	%rax, 0x28(%rsp)
140897f46:     	movq	$0x83, 0x20(%rsp)
140897f4f:     	leaq	0x517793a(%rip), %r9    # 0x145a0f890
140897f56:     	leaq	-0x50(%rbp), %r8
140897f5a:     	xorl	%ecx, %ecx
140897f5c:     	movq	%rdi, %rdx
140897f5f:     	callq	0x14589fabd <.text+0x589eabd>
140897f64:     	ud2
140897f66:     	leaq	0x5161b7b(%rip), %r8    # 0x1459f9ae8
140897f6d:     	leaq	0x1920(%rbp), %rcx
140897f74:     	movq	%rbx, %rdx
140897f77:     	callq	0x144e689b0 <.text+0x4e679b0>
140897f7c:     	leaq	0x40(%rbx), %r14
140897f80:     	leaq	0x5a8(%rbx), %r15
140897f87:     	movq	%r14, 0xf60(%rbp)
140897f8e:     	movq	%r15, 0xf68(%rbp)
140897f95:     	movq	$0x0, 0xf48(%rbp)
140897fa0:     	movq	$0x8, 0xf50(%rbp)
140897fab:     	movq	$0x0, 0xf58(%rbp)
140897fb6:     	leaq	0x5219193(%rip), %rdx   # 0x145ab1150
140897fbd:     	leaq	0xf48(%rbp), %rcx
140897fc4:     	callq	0x140cdfda0 <.text+0xcdeda0>
140897fc9:     	nop
140897fca:     	movq	%rax, %r13
140897fcd:     	movq	0xf48(%rbp), %rdx
140897fd4:     	testq	%rdx, %rdx
140897fd7:     	je	0x140897fef <.text+0x896fef>
140897fd9:     	movq	0xf50(%rbp), %rcx
140897fe0:     	shlq	$0x3, %rdx
140897fe4:     	movl	$0x8, %r8d
140897fea:     	callq	0x1400021d0 <.text+0x11d0>
140897fef:     	movq	%r14, 0xf60(%rbp)
140897ff6:     	movq	%r15, 0xf68(%rbp)
140897ffd:     	movq	$0x0, 0xf48(%rbp)
140898008:     	movq	$0x8, 0xf50(%rbp)
140898013:     	movq	$0x0, 0xf58(%rbp)
14089801e:     	leaq	0x521911b(%rip), %rdx   # 0x145ab1140
140898025:     	leaq	0xf48(%rbp), %rcx
14089802c:     	callq	0x140cdfaa0 <.text+0xcdeaa0>
140898031:     	movq	%rax, 0x1a80(%rbp)
140898038:     	movq	0xf48(%rbp), %rdx
14089803f:     	testq	%rdx, %rdx
140898042:     	je	0x14089805a <.text+0x89705a>
140898044:     	movq	0xf50(%rbp), %rcx
14089804b:     	shlq	$0x3, %rdx
14089804f:     	movl	$0x8, %r8d
140898055:     	callq	0x1400021d0 <.text+0x11d0>
14089805a:     	movq	%r14, 0xf60(%rbp)
140898061:     	movq	%r15, 0xf68(%rbp)
140898068:     	movq	$0x0, 0xf48(%rbp)
140898073:     	movq	$0x8, 0xf50(%rbp)
14089807e:     	movq	$0x0, 0xf58(%rbp)
140898089:     	leaq	0x5219b10(%rip), %rdx   # 0x145ab1ba0
140898090:     	leaq	0xf48(%rbp), %rcx
140898097:     	callq	0x140cf58b0 <.text+0xcf48b0>
14089809c:     	movq	%rax, 0x1a88(%rbp)
1408980a3:     	movq	0xf48(%rbp), %rdx
1408980aa:     	testq	%rdx, %rdx
1408980ad:     	je	0x1408980c5 <.text+0x8970c5>
1408980af:     	movq	0xf50(%rbp), %rcx
1408980b6:     	shlq	$0x3, %rdx
1408980ba:     	movl	$0x8, %r8d
1408980c0:     	callq	0x1400021d0 <.text+0x11d0>
1408980c5:     	movq	%r14, 0xf60(%rbp)
1408980cc:     	movq	%r15, 0xf68(%rbp)
1408980d3:     	movq	$0x0, 0xf48(%rbp)
1408980de:     	movq	$0x8, 0xf50(%rbp)
1408980e9:     	movq	$0x0, 0xf58(%rbp)
1408980f4:     	leaq	0x5218fa5(%rip), %rdx   # 0x145ab10a0
1408980fb:     	leaq	0xf48(%rbp), %rcx
140898102:     	callq	0x140cde5f0 <.text+0xcdd5f0>
140898107:     	movq	%rax, 0x1a90(%rbp)
14089810e:     	movq	0xf48(%rbp), %rdx
140898115:     	testq	%rdx, %rdx
140898118:     	je	0x140898131 <.text+0x897131>
14089811a:     	movq	0xf50(%rbp), %rcx
140898121:     	shlq	$0x3, %rdx
140898125:     	movl	$0x8, %r8d
14089812b:     	callq	0x1400021d0 <.text+0x11d0>
140898130:     	nop
140898131:     	leaq	0xe30(%rbp), %rcx
140898138:     	movq	%rbx, %rdx
14089813b:     	callq	0x14128a380 <.text+0x1289380>
140898140:     	nop
140898141:     	leaq	0xd18(%rbp), %rcx
140898148:     	movq	%rbx, %rdx
14089814b:     	callq	0x1412a0f40 <.text+0x129ff40>
140898150:     	nop
140898151:     	leaq	0xf48(%rbp), %rcx
140898158:     	movq	%rbx, %rdx
14089815b:     	callq	0x1408017a0 <.text+0x8007a0>
140898160:     	nop
140898161:     	movq	%r14, 0x1970(%rbp)
140898168:     	movq	%r15, 0x1978(%rbp)
14089816f:     	movq	$0x0, 0x1958(%rbp)
14089817a:     	movq	$0x8, 0x1960(%rbp)
140898185:     	movq	$0x0, 0x1968(%rbp)
140898190:     	leaq	0x5218f99(%rip), %rdx   # 0x145ab1130
140898197:     	leaq	0x1958(%rbp), %rcx
14089819e:     	callq	0x140cdf7b0 <.text+0xcde7b0>
1408981a3:     	movq	%rax, 0x1a98(%rbp)
1408981aa:     	movq	0x1958(%rbp), %rdx
1408981b1:     	testq	%rdx, %rdx
1408981b4:     	je	0x1408981cc <.text+0x8971cc>
1408981b6:     	movq	0x1960(%rbp), %rcx
1408981bd:     	shlq	$0x3, %rdx
1408981c1:     	movl	$0x8, %r8d
1408981c7:     	callq	0x1400021d0 <.text+0x11d0>
1408981cc:     	movq	%r14, 0x1970(%rbp)
1408981d3:     	movq	%r15, 0x1978(%rbp)
1408981da:     	movq	$0x0, 0x1958(%rbp)
1408981e5:     	movq	$0x8, 0x1960(%rbp)
1408981f0:     	movq	$0x0, 0x1968(%rbp)
1408981fb:     	leaq	0x521928e(%rip), %rdx   # 0x145ab1490
140898202:     	leaq	0x1958(%rbp), %rcx
140898209:     	callq	0x140ce8330 <.text+0xce7330>
14089820e:     	movq	%rax, 0x1aa0(%rbp)
140898215:     	movq	0x1958(%rbp), %rdx
14089821c:     	testq	%rdx, %rdx
14089821f:     	je	0x140898237 <.text+0x897237>
140898221:     	movq	0x1960(%rbp), %rcx
140898228:     	shlq	$0x3, %rdx
14089822c:     	movl	$0x8, %r8d
140898232:     	callq	0x1400021d0 <.text+0x11d0>
140898237:     	movq	%r14, 0x1970(%rbp)
14089823e:     	movq	%r15, 0x1978(%rbp)
140898245:     	movq	$0x0, 0x1958(%rbp)
140898250:     	movq	$0x8, 0x1960(%rbp)
14089825b:     	movq	$0x0, 0x1968(%rbp)
140898266:     	leaq	0x5217fb3(%rip), %rdx   # 0x145ab0220
14089826d:     	leaq	0x1958(%rbp), %rcx
140898274:     	callq	0x140cb75e0 <.text+0xcb65e0>
140898279:     	movq	%rax, 0x1aa8(%rbp)
140898280:     	movq	0x1958(%rbp), %rdx
140898287:     	testq	%rdx, %rdx
14089828a:     	je	0x1408982a3 <.text+0x8972a3>
14089828c:     	movq	0x1960(%rbp), %rcx
140898293:     	shlq	$0x3, %rdx
140898297:     	movl	$0x8, %r8d
14089829d:     	callq	0x1400021d0 <.text+0x11d0>
1408982a2:     	nop
1408982a3:     	leaq	0x1958(%rbp), %rcx
1408982aa:     	movq	%rbx, %rdx
1408982ad:     	callq	0x1412f5520 <.text+0x12f4520>
1408982b2:     	nop
1408982b3:     	movq	%r14, 0x1ad0(%rbp)
1408982ba:     	movq	%r15, 0x1ad8(%rbp)
1408982c1:     	movq	$0x0, 0x1ab8(%rbp)
1408982cc:     	movq	$0x8, 0x1ac0(%rbp)
1408982d7:     	movq	$0x0, 0x1ac8(%rbp)
1408982e2:     	leaq	0x5218de7(%rip), %rdx   # 0x145ab10d0
1408982e9:     	leaq	0x1ab8(%rbp), %rcx
1408982f0:     	callq	0x140cde8f0 <.text+0xcdd8f0>
1408982f5:     	movq	%rax, 0x1ab0(%rbp)
1408982fc:     	movq	0x1ab8(%rbp), %rdx
140898303:     	testq	%rdx, %rdx
140898306:     	je	0x14089831e <.text+0x89731e>
140898308:     	movq	0x1ac0(%rbp), %rcx
14089830f:     	shlq	$0x3, %rdx
140898313:     	movl	$0x8, %r8d
140898319:     	callq	0x1400021d0 <.text+0x11d0>
14089831e:     	movq	%r14, 0x1ad0(%rbp)
140898325:     	movq	%r15, 0x1ad8(%rbp)
14089832c:     	movq	$0x0, 0x1ab8(%rbp)
140898337:     	movq	$0x8, 0x1ac0(%rbp)
140898342:     	movq	$0x0, 0x1ac8(%rbp)
14089834d:     	leaq	0x5218e0c(%rip), %rdx   # 0x145ab1160
140898354:     	leaq	0x1ab8(%rbp), %rcx
14089835b:     	callq	0x140ce00a0 <.text+0xcdf0a0>
140898360:     	nop
140898361:     	movq	%rax, %r14
140898364:     	movq	0x1ab8(%rbp), %rdx
14089836b:     	testq	%rdx, %rdx
14089836e:     	je	0x140898387 <.text+0x897387>
140898370:     	movq	0x1ac0(%rbp), %rcx
140898377:     	shlq	$0x3, %rdx
14089837b:     	movl	$0x8, %r8d
140898381:     	callq	0x1400021d0 <.text+0x11d0>
140898386:     	nop
140898387:     	movq	%rbx, %rcx
14089838a:     	callq	0x140da63c0 <.text+0xda53c0>
14089838f:     	nop
140898390:     	movq	%rax, %r15
140898393:     	movq	0x1950(%rbp), %rax
14089839a:     	movq	%rax, -0x20(%rbp)
14089839e:     	movups	0x1920(%rbp), %xmm0
1408983a5:     	movups	0x1930(%rbp), %xmm1
1408983ac:     	movups	0x1940(%rbp), %xmm2
1408983b3:     	movaps	%xmm2, -0x30(%rbp)
1408983b7:     	movaps	%xmm1, -0x40(%rbp)
1408983bb:     	movaps	%xmm0, -0x50(%rbp)
1408983bf:     	leaq	-0x18(%rbp), %rcx
1408983c3:     	leaq	0xe30(%rbp), %rdx
1408983ca:     	movl	$0x118, %r8d            # imm = 0x118
1408983d0:     	callq	0x145756ddd <.text+0x5755ddd>
1408983d5:     	leaq	0x100(%rbp), %rcx
1408983dc:     	leaq	0xd18(%rbp), %rdx
1408983e3:     	movl	$0x118, %r8d            # imm = 0x118
1408983e9:     	callq	0x145756ddd <.text+0x5755ddd>
1408983ee:     	leaq	0x218(%rbp), %rcx
1408983f5:     	leaq	0xf48(%rbp), %rdx
1408983fc:     	movl	$0x9d8, %r8d            # imm = 0x9D8
140898402:     	callq	0x145756ddd <.text+0x5755ddd>
140898407:     	leaq	0xbf0(%rbp), %rcx
14089840e:     	leaq	0x1958(%rbp), %rdx
140898415:     	movl	$0x128, %r8d            # imm = 0x128
14089841b:     	callq	0x145756ddd <.text+0x5755ddd>
140898420:     	movq	0x5a0(%rbx), %r12
140898427:     	leaq	-0x50(%rbp), %rdx
14089842b:     	movl	$0xd68, %r8d            # imm = 0xD68
140898431:     	movq	%rdi, %rcx
140898434:     	callq	0x145756ddd <.text+0x5755ddd>
140898439:     	movq	%r13, 0xd68(%rdi)
140898440:     	movq	0x1a80(%rbp), %rax
140898447:     	movq	%rax, 0xd70(%rdi)
14089844e:     	movq	0x1a88(%rbp), %rax
140898455:     	movq	%rax, 0xd78(%rdi)
14089845c:     	movq	0x1a90(%rbp), %rax
140898463:     	movq	%rax, 0xd80(%rdi)
14089846a:     	movq	0x1a98(%rbp), %rax
140898471:     	movq	%rax, 0xd88(%rdi)
140898478:     	movq	0x1aa0(%rbp), %rax
14089847f:     	movq	%rax, 0xd90(%rdi)
140898486:     	movq	0x1aa8(%rbp), %rax
14089848d:     	movq	%rax, 0xd98(%rdi)
140898494:     	movq	0x1ab0(%rbp), %rax
14089849b:     	movq	%rax, 0xda0(%rdi)
1408984a2:     	movq	%r14, 0xda8(%rdi)
1408984a9:     	movl	$0x0, 0xdb0(%rdi)
1408984b3:     	movb	$0x2, 0xdbc(%rdi)
1408984ba:     	movq	%r15, 0xdc0(%rdi)
1408984c1:     	movq	%r12, 0xdc8(%rdi)
1408984c8:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
1408984cd:     	addl	0x5b0(%rbx), %eax
1408984d3:     	leaq	0xdd0(%rdi), %rdx
1408984da:     	movl	%eax, 0xdd0(%rdi)
1408984e0:     	movq	$0x10, -0x38(%rbp)
1408984e8:     	xorps	%xmm0, %xmm0
1408984eb:     	movups	%xmm0, -0x30(%rbp)
1408984ef:     	movq	$0x10, -0x20(%rbp)
1408984f7:     	movups	%xmm0, -0x18(%rbp)
1408984fb:     	movq	$0x10, -0x8(%rbp)
140898503:     	movups	%xmm0, (%rbp)
140898507:     	movq	$0x10, 0x10(%rbp)
14089850f:     	movups	%xmm0, 0x18(%rbp)
140898513:     	movq	$0x10, 0x28(%rbp)
14089851b:     	movq	$0x0, -0x50(%rbp)
140898523:     	movups	%xmm0, 0x30(%rbp)
140898527:     	movl	$0x0, 0x40(%rbp)
14089852e:     	movq	$0x8, -0x48(%rbp)
140898536:     	movq	$0x0, -0x40(%rbp)
14089853e:     	leaq	-0x50(%rbp), %r8
140898542:     	movq	%rdi, %rcx
140898545:     	movq	%rbx, %r9
140898548:     	callq	0x1405aefd0 <.text+0x5adfd0>
14089854d:     	nop
14089854e:     	leaq	-0x50(%rbp), %rdx
140898552:     	movl	$0x98, %r8d
140898558:     	movq	%rsi, %rcx
14089855b:     	callq	0x145756ddd <.text+0x5755ddd>
140898560:     	movq	%rsi, %rax
140898563:     	addq	$0x1b68, %rsp           # imm = 0x1B68
14089856a:     	popq	%rbx
14089856b:     	popq	%rdi
14089856c:     	popq	%rsi
14089856d:     	popq	%r12
14089856f:     	popq	%r13
140898571:     	popq	%r14
140898573:     	popq	%r15
140898575:     	popq	%rbp
140898576:     	retq

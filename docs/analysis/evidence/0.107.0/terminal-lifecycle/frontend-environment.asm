Disassembly of section .text:

0000000140001000 <.text>:
145889110:     	pushq	%rbp
145889111:     	pushq	%r15
145889113:     	pushq	%r14
145889115:     	pushq	%r13
145889117:     	pushq	%r12
145889119:     	pushq	%rsi
14588911a:     	pushq	%rdi
14588911b:     	pushq	%rbx
14588911c:     	subq	$0x58, %rsp
145889120:     	leaq	0x50(%rsp), %rbp
145889125:     	movq	$-0x2, (%rbp)
14588912d:     	movq	%r9, %rdi
145889130:     	movq	%r8, %r15
145889133:     	movq	%rdx, %rbx
145889136:     	movq	%rcx, %rsi
145889139:     	callq	0x140002200 <.text+0x1200>
14588913e:     	movl	$0x78, %ecx
145889143:     	movl	$0x8, %edx
145889148:     	callq	0x1400021c0 <.text+0x11c0>
14588914d:     	testq	%rax, %rax
145889150:     	je	0x145889403 <.text+0x5888403>
145889156:     	movq	%rax, %r14
145889159:     	callq	0x140002200 <.text+0x1200>
14588915e:     	movl	$0x4, %ecx
145889163:     	movl	$0x1, %edx
145889168:     	callq	0x1400021c0 <.text+0x11c0>
14588916d:     	testq	%rax, %rax
145889170:     	je	0x145889414 <.text+0x5888414>
145889176:     	movq	%rax, %r12
145889179:     	movl	$0x4f524548, (%rax)     # imm = 0x4F524548
14588917f:     	callq	0x140002200 <.text+0x1200>
145889184:     	movl	$0x8, %ecx
145889189:     	movl	$0x1, %edx
14588918e:     	callq	0x1400021c0 <.text+0x11c0>
145889193:     	testq	%rax, %rax
145889196:     	je	0x14588942a <.text+0x588842a>
14588919c:     	movq	%rax, %r13
14588919f:     	movabsq	$0x726f766976727573, %rax # imm = 0x726F766976727573
1458891a9:     	movq	%rax, (%r13)
1458891ad:     	callq	0x140002200 <.text+0x1200>
1458891b2:     	movl	$0xd, %ecx
1458891b7:     	movl	$0x1, %edx
1458891bc:     	callq	0x1400021c0 <.text+0x11c0>
1458891c1:     	testq	%rax, %rax
1458891c4:     	je	0x145889444 <.text+0x5888444>
1458891ca:     	movabsq	$0x6c61636f6c2e6874, %rcx # imm = 0x6C61636F6C2E6874
1458891d4:     	movq	%rcx, 0x5(%rax)
1458891d8:     	movabsq	$0x2e68746f72657a61, %rcx # imm = 0x2E68746F72657A61
1458891e2:     	movq	%rcx, (%rax)
1458891e5:     	leaq	0x135a58e(%rip), %rcx   # 0x146be377a
1458891ec:     	movq	%rcx, (%r14)
1458891ef:     	movq	$0x8, 0x8(%r14)
1458891f7:     	movq	$0x4, 0x10(%r14)
1458891ff:     	movq	%r12, 0x18(%r14)
145889203:     	movq	$0x4, 0x20(%r14)
14588920b:     	leaq	0x135a570(%rip), %rcx   # 0x146be3782
145889212:     	movq	%rcx, 0x28(%r14)
145889216:     	movq	$0x8, 0x30(%r14)
14588921e:     	movq	$0x8, 0x38(%r14)
145889226:     	movq	%r13, 0x40(%r14)
14588922a:     	movq	$0x8, 0x48(%r14)
145889232:     	leaq	0x135a551(%rip), %rcx   # 0x146be378a
145889239:     	movq	%rcx, 0x50(%r14)
14588923d:     	movq	$0x8, 0x58(%r14)
145889245:     	movq	$0xd, 0x60(%r14)
14588924d:     	movq	%rax, 0x68(%r14)
145889251:     	movq	$0xd, 0x70(%r14)
145889259:     	movq	$0x3, -0x28(%rbp)
145889261:     	movq	%r14, -0x20(%rbp)
145889265:     	movq	$0x3, -0x18(%rbp)
14588926d:     	testq	%rbx, %rbx
145889270:     	je	0x14588928b <.text+0x588828b>
145889272:     	testq	%r15, %r15
145889275:     	jns	0x14588929e <.text+0x588829e>
145889277:     	xorl	%r14d, %r14d
14588927a:     	movq	%r14, %rcx
14588927d:     	movq	%r15, %rdx
145889280:     	callq	0x145d9370b <.text+0x5d9270b>
145889285:     	nop
145889286:     	jmp	0x145889460 <.text+0x5888460>
14588928b:     	movl	$0x3, %ebx
145889290:     	testq	%rdi, %rdi
145889293:     	jne	0x145889335 <.text+0x5888335>
145889299:     	jmp	0x1458893e0 <.text+0x58883e0>
14588929e:     	movq	%r15, -0x8(%rbp)
1458892a2:     	je	0x1458892d5 <.text+0x58882d5>
1458892a4:     	callq	0x140002200 <.text+0x1200>
1458892a9:     	movl	$0x1, %r14d
1458892af:     	movl	$0x1, %edx
1458892b4:     	movq	%r15, %rcx
1458892b7:     	callq	0x1400021c0 <.text+0x11c0>
1458892bc:     	testq	%rax, %rax
1458892bf:     	je	0x14588927a <.text+0x588827a>
1458892c1:     	movq	%rax, -0x10(%rbp)
1458892c5:     	movq	%rax, %rcx
1458892c8:     	movq	%rbx, %rdx
1458892cb:     	movq	%r15, %r8
1458892ce:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1458892d3:     	jmp	0x1458892de <.text+0x58882de>
1458892d5:     	movl	$0x1, %eax
1458892da:     	movq	%rax, -0x10(%rbp)
1458892de:     	leaq	-0x28(%rbp), %rcx
1458892e2:     	callq	0x145bf3cf0 <.text+0x5bf2cf0>
1458892e7:     	nop
1458892e8:     	movq	-0x20(%rbp), %rax
1458892ec:     	leaq	0x135a49f(%rip), %rcx   # 0x146be3792
1458892f3:     	movq	%rcx, 0x78(%rax)
1458892f7:     	movq	$0x9, 0x80(%rax)
145889302:     	movq	-0x8(%rbp), %rcx
145889306:     	movq	%rcx, 0x88(%rax)
14588930d:     	movq	-0x10(%rbp), %rdx
145889311:     	movq	%rdx, 0x90(%rax)
145889318:     	movq	%rcx, 0x98(%rax)
14588931f:     	movq	$0x4, -0x18(%rbp)
145889327:     	movl	$0x4, %ebx
14588932c:     	testq	%rdi, %rdi
14588932f:     	je	0x1458893e0 <.text+0x58883e0>
145889335:     	movq	0x70(%rbp), %r14
145889339:     	testq	%r14, %r14
14588933c:     	jns	0x145889351 <.text+0x5888351>
14588933e:     	xorl	%ebx, %ebx
145889340:     	movq	%rbx, %rcx
145889343:     	movq	%r14, %rdx
145889346:     	callq	0x145d9370b <.text+0x5d9270b>
14588934b:     	nop
14588934c:     	jmp	0x145889460 <.text+0x5888460>
145889351:     	je	0x14588938d <.text+0x588838d>
145889353:     	callq	0x140002200 <.text+0x1200>
145889358:     	movl	$0x1, %ebx
14588935d:     	movl	$0x1, %edx
145889362:     	movq	%r14, %rcx
145889365:     	callq	0x1400021c0 <.text+0x11c0>
14588936a:     	testq	%rax, %rax
14588936d:     	je	0x145889340 <.text+0x5888340>
14588936f:     	movq	%rax, -0x8(%rbp)
145889373:     	movq	%rax, %rcx
145889376:     	movq	%rdi, %rdx
145889379:     	movq	%r14, %r8
14588937c:     	callq	0x145bf1d41 <.text+0x5bf0d41>
145889381:     	movq	-0x18(%rbp), %rbx
145889385:     	cmpq	-0x28(%rbp), %rbx
145889389:     	je	0x14588939c <.text+0x588839c>
14588938b:     	jmp	0x1458893a6 <.text+0x58883a6>
14588938d:     	movl	$0x1, %eax
145889392:     	movq	%rax, -0x8(%rbp)
145889396:     	cmpq	-0x28(%rbp), %rbx
14588939a:     	jne	0x1458893a6 <.text+0x58883a6>
14588939c:     	leaq	-0x28(%rbp), %rcx
1458893a0:     	callq	0x145bf3cf0 <.text+0x5bf2cf0>
1458893a5:     	nop
1458893a6:     	movq	-0x20(%rbp), %rax
1458893aa:     	leaq	(%rbx,%rbx,4), %rcx
1458893ae:     	leaq	0x135a3e6(%rip), %rdx   # 0x146be379b
1458893b5:     	movq	%rdx, (%rax,%rcx,8)
1458893b9:     	movq	$0x8, 0x8(%rax,%rcx,8)
1458893c2:     	movq	0x70(%rbp), %rdx
1458893c6:     	movq	%rdx, 0x10(%rax,%rcx,8)
1458893cb:     	movq	-0x8(%rbp), %r8
1458893cf:     	movq	%r8, 0x18(%rax,%rcx,8)
1458893d4:     	movq	%rdx, 0x20(%rax,%rcx,8)
1458893d9:     	incq	%rbx
1458893dc:     	movq	%rbx, -0x18(%rbp)
1458893e0:     	movq	-0x18(%rbp), %rax
1458893e4:     	movq	%rax, 0x10(%rsi)
1458893e8:     	movups	-0x28(%rbp), %xmm0
1458893ec:     	movups	%xmm0, (%rsi)
1458893ef:     	movq	%rsi, %rax
1458893f2:     	addq	$0x58, %rsp
1458893f6:     	popq	%rbx
1458893f7:     	popq	%rdi
1458893f8:     	popq	%rsi
1458893f9:     	popq	%r12
1458893fb:     	popq	%r13
1458893fd:     	popq	%r14
1458893ff:     	popq	%r15
145889401:     	popq	%rbp
145889402:     	retq
145889403:     	movl	$0x8, %ecx
145889408:     	movl	$0x78, %edx
14588940d:     	callq	0x145d936f1 <.text+0x5d926f1>
145889412:     	ud2
145889414:     	movq	%r14, -0x8(%rbp)
145889418:     	movl	$0x1, %ecx
14588941d:     	movl	$0x4, %edx
145889422:     	callq	0x145d9370b <.text+0x5d9270b>
145889427:     	nop
145889428:     	jmp	0x145889460 <.text+0x5888460>
14588942a:     	movq	%r12, -0x10(%rbp)
14588942e:     	movq	%r14, -0x8(%rbp)
145889432:     	movl	$0x1, %ecx
145889437:     	movl	$0x8, %edx
14588943c:     	callq	0x145d9370b <.text+0x5d9270b>
145889441:     	nop
145889442:     	jmp	0x145889460 <.text+0x5888460>
145889444:     	movq	%r13, -0x30(%rbp)
145889448:     	movq	%r12, -0x10(%rbp)
14588944c:     	movq	%r14, -0x8(%rbp)
145889450:     	movl	$0x1, %ecx
145889455:     	movl	$0xd, %edx
14588945a:     	callq	0x145d9370b <.text+0x5d9270b>
14588945f:     	nop
145889460:     	ud2

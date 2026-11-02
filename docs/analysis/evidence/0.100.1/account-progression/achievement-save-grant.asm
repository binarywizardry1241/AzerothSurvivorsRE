
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14542e180:     	pushq	%rbp
14542e181:     	pushq	%r15
14542e183:     	pushq	%r14
14542e185:     	pushq	%r13
14542e187:     	pushq	%r12
14542e189:     	pushq	%rsi
14542e18a:     	pushq	%rdi
14542e18b:     	pushq	%rbx
14542e18c:     	subq	$0x48, %rsp
14542e190:     	leaq	0x40(%rsp), %rbp
14542e195:     	movq	$-0x2, (%rbp)
14542e19d:     	movq	%r9, %rdi
14542e1a0:     	movq	%r8, %rsi
14542e1a3:     	movq	%rdx, %r14
14542e1a6:     	movq	%rcx, %rbx
14542e1a9:     	callq	0x145435f00 <.text+0x5434f00>
14542e1ae:     	movl	%eax, %r13d
14542e1b1:     	testb	%dil, %al
14542e1b4:     	je	0x14542e357 <.text+0x542d357>
14542e1ba:     	movq	0xd0(%rbx), %rdi
14542e1c1:     	movq	%rdi, %r15
14542e1c4:     	testq	%rdi, %rdi
14542e1c7:     	je	0x14542e29a <.text+0x542d29a>
14542e1cd:     	movq	%r14, %rax
14542e1d0:     	movb	%r13b, -0x1(%rbp)
14542e1d4:     	movq	%rsi, %r14
14542e1d7:     	movq	%rbx, -0x10(%rbp)
14542e1db:     	movq	0xc8(%rbx), %r15
14542e1e2:     	cmpq	$0x1, %rdi
14542e1e6:     	movq	%rdi, -0x20(%rbp)
14542e1ea:     	movq	%rax, -0x18(%rbp)
14542e1ee:     	jne	0x14542e1f5 <.text+0x542d1f5>
14542e1f0:     	xorl	%r12d, %r12d
14542e1f3:     	jmp	0x14542e248 <.text+0x542d248>
14542e1f5:     	xorl	%r12d, %r12d
14542e1f8:     	movq	%rdi, %r13
14542e1fb:     	nopl	(%rax,%rax)
14542e200:     	movq	%r12, %rbx
14542e203:     	movq	%r13, %rsi
14542e206:     	shrq	%rsi
14542e209:     	addq	%rsi, %r12
14542e20c:     	movq	%r12, %rax
14542e20f:     	shlq	$0x5, %rax
14542e213:     	movq	0x8(%r15,%rax), %rcx
14542e218:     	movq	0x10(%r15,%rax), %r8
14542e21d:     	movq	%r8, %rdi
14542e220:     	subq	%r14, %rdi
14542e223:     	cmovaeq	%r14, %r8
14542e227:     	movq	-0x18(%rbp), %rdx
14542e22b:     	callq	0x1457731e7 <.text+0x57721e7>
14542e230:     	cltq
14542e232:     	testl	%eax, %eax
14542e234:     	cmovneq	%rax, %rdi
14542e238:     	testq	%rdi, %rdi
14542e23b:     	cmovgq	%rbx, %r12
14542e23f:     	subq	%rsi, %r13
14542e242:     	cmpq	$0x1, %r13
14542e246:     	ja	0x14542e200 <.text+0x542d200>
14542e248:     	movq	%r12, %rax
14542e24b:     	shlq	$0x5, %rax
14542e24f:     	movq	0x8(%r15,%rax), %rcx
14542e254:     	movq	0x10(%r15,%rax), %r8
14542e259:     	movq	%r8, %r15
14542e25c:     	subq	%r14, %r15
14542e25f:     	cmovaeq	%r14, %r8
14542e263:     	movq	-0x18(%rbp), %rdi
14542e267:     	movq	%rdi, %rdx
14542e26a:     	callq	0x1457731e7 <.text+0x57721e7>
14542e26f:     	cltq
14542e271:     	testl	%eax, %eax
14542e273:     	cmovneq	%rax, %r15
14542e277:     	testq	%r15, %r15
14542e27a:     	movq	-0x10(%rbp), %rbx
14542e27e:     	movzbl	-0x1(%rbp), %r13d
14542e283:     	je	0x14542e357 <.text+0x542d357>
14542e289:     	movq	%r14, %rsi
14542e28c:     	movq	%rdi, %r14
14542e28f:     	shrq	$0x3f, %r15
14542e293:     	addq	%r12, %r15
14542e296:     	movq	-0x20(%rbp), %rdi
14542e29a:     	leaq	0xc0(%rbx), %r12
14542e2a1:     	testq	%rsi, %rsi
14542e2a4:     	jns	0x14542e2b5 <.text+0x542d2b5>
14542e2a6:     	xorl	%edi, %edi
14542e2a8:     	movq	%rdi, %rcx
14542e2ab:     	movq	%rsi, %rdx
14542e2ae:     	callq	0x14590379b <.text+0x590279b>
14542e2b3:     	ud2
14542e2b5:     	je	0x14542e36b <.text+0x542d36b>
14542e2bb:     	callq	0x140002200 <.text+0x1200>
14542e2c0:     	movl	$0x1, %edi
14542e2c5:     	movl	$0x1, %edx
14542e2ca:     	movq	%rsi, %rcx
14542e2cd:     	callq	0x1400021c0 <.text+0x11c0>
14542e2d2:     	testq	%rax, %rax
14542e2d5:     	je	0x14542e2a8 <.text+0x542d2a8>
14542e2d7:     	movq	%rax, -0x10(%rbp)
14542e2db:     	movq	%rax, %rcx
14542e2de:     	movq	%r14, %rdx
14542e2e1:     	movq	%rsi, %r8
14542e2e4:     	callq	0x1457731ed <.text+0x57721ed>
14542e2e9:     	movq	0xd0(%rbx), %rdi
14542e2f0:     	movq	%rsi, -0x18(%rbp)
14542e2f4:     	cmpq	%r15, %rdi
14542e2f7:     	jb	0x14542e37d <.text+0x542d37d>
14542e2fd:     	cmpq	(%r12), %rdi
14542e301:     	jne	0x14542e30c <.text+0x542d30c>
14542e303:     	movq	%r12, %rcx
14542e306:     	callq	0x145774710 <.text+0x5773710>
14542e30b:     	nop
14542e30c:     	movq	0x70(%rbp), %r12
14542e310:     	movq	%r15, %r14
14542e313:     	shlq	$0x5, %r14
14542e317:     	addq	0xc8(%rbx), %r14
14542e31e:     	movq	%rdi, %r8
14542e321:     	subq	%r15, %r8
14542e324:     	jbe	0x14542e336 <.text+0x542d336>
14542e326:     	leaq	0x20(%r14), %rcx
14542e32a:     	shlq	$0x5, %r8
14542e32e:     	movq	%r14, %rdx
14542e331:     	callq	0x1457731e1 <.text+0x57721e1>
14542e336:     	movq	-0x18(%rbp), %rax
14542e33a:     	movq	%rax, (%r14)
14542e33d:     	movq	-0x10(%rbp), %rcx
14542e341:     	movq	%rcx, 0x8(%r14)
14542e345:     	movq	%rax, 0x10(%r14)
14542e349:     	movq	%r12, 0x18(%r14)
14542e34d:     	incq	%rdi
14542e350:     	movq	%rdi, 0xd0(%rbx)
14542e357:     	movl	%r13d, %eax
14542e35a:     	addq	$0x48, %rsp
14542e35e:     	popq	%rbx
14542e35f:     	popq	%rdi
14542e360:     	popq	%rsi
14542e361:     	popq	%r12
14542e363:     	popq	%r13
14542e365:     	popq	%r14
14542e367:     	popq	%r15
14542e369:     	popq	%rbp
14542e36a:     	retq
14542e36b:     	movl	$0x1, %eax
14542e370:     	movq	%rax, -0x10(%rbp)
14542e374:     	movq	%rsi, -0x18(%rbp)
14542e378:     	cmpq	%r15, %rdi
14542e37b:     	jae	0x14542e2fd <.text+0x542d2fd>
14542e37d:     	leaq	0x130f49c(%rip), %r8    # 0x14673d820
14542e384:     	movq	%r15, %rcx
14542e387:     	movq	%rdi, %rdx
14542e38a:     	callq	0x1459037e4 <.text+0x59027e4>
14542e38f:     	nop
14542e390:     	ud2

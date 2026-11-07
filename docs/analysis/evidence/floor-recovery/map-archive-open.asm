
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145687e90:     	pushq	%rbp
145687e91:     	pushq	%r15
145687e93:     	pushq	%r14
145687e95:     	pushq	%r13
145687e97:     	pushq	%r12
145687e99:     	pushq	%rsi
145687e9a:     	pushq	%rdi
145687e9b:     	pushq	%rbx
145687e9c:     	subq	$0xa88, %rsp            # imm = 0xA88
145687ea3:     	leaq	0x80(%rsp), %rbp
145687eab:     	movq	$-0x2, 0xa00(%rbp)
145687eb6:     	movq	%r8, %rbx
145687eb9:     	movq	%rdx, %r15
145687ebc:     	movq	%rcx, %r14
145687ebf:     	movq	$0x0, 0x9d0(%rbp)
145687eca:     	movq	$0x8, 0x9d8(%rbp)
145687ed5:     	movq	$0x0, 0x9e0(%rbp)
145687ee0:     	movq	%rdx, %rcx
145687ee3:     	movq	%r8, %rdx
145687ee6:     	callq	0x145702d10 <.text+0x5701d10>
145687eeb:     	nop
145687eec:     	testb	%al, %al
145687eee:     	je	0x145687f27 <.text+0x5686f27>
145687ef0:     	leaq	0x6f8(%rbp), %rcx
145687ef7:     	movq	%r15, %rdx
145687efa:     	movq	%rbx, %r8
145687efd:     	callq	0x145712640 <.text+0x5711640>
145687f02:     	nop
145687f03:     	cmpl	$0x2, 0x6f8(%rbp)
145687f0a:     	jne	0x145687f5d <.text+0x5686f5d>
145687f0c:     	movq	0x700(%rbp), %rax
145687f13:     	movq	%rax, 0x220(%rbp)
145687f1a:     	movq	$0x2, 0x218(%rbp)
145687f25:     	jmp	0x145687f77 <.text+0x5686f77>
145687f27:     	leaq	0x6f8(%rbp), %rcx
145687f2e:     	movq	%r15, %rdx
145687f31:     	movq	%rbx, %r8
145687f34:     	callq	0x1455d1430 <.text+0x55d0430>
145687f39:     	nop
145687f3a:     	leaq	0x6f8(%rbp), %rcx
145687f41:     	movq	%r15, %rdx
145687f44:     	movq	%rbx, %r8
145687f47:     	callq	0x1455d4300 <.text+0x55d3300>
145687f4c:     	nop
145687f4d:     	cmpq	$0x1, %rax
145687f51:     	jne	0x145688051 <.text+0x5687051>
145687f57:     	movq	%rdx, 0x8(%r14)
145687f5b:     	jmp	0x145687fad <.text+0x5686fad>
145687f5d:     	leaq	0x218(%rbp), %rcx
145687f64:     	leaq	0x6f8(%rbp), %rdx
145687f6b:     	movl	$0x270, %r8d            # imm = 0x270
145687f71:     	callq	0x1457731ed <.text+0x57721ed>
145687f76:     	nop
145687f77:     	leaq	0x488(%rbp), %rcx
145687f7e:     	leaq	0x218(%rbp), %rdx
145687f85:     	movq	%r15, %r8
145687f88:     	movq	%rbx, %r9
145687f8b:     	callq	0x1455d4460 <.text+0x55d3460>
145687f90:     	nop
145687f91:     	movq	0x488(%rbp), %rdi
145687f98:     	movq	0x490(%rbp), %rsi
145687f9f:     	cmpq	$0x2, %rdi
145687fa3:     	jne	0x14568809d <.text+0x568709d>
145687fa9:     	movq	%rsi, 0x8(%r14)
145687fad:     	movq	$-0x1, (%r14)
145687fb4:     	movq	0x9e0(%rbp), %rax
145687fbb:     	movq	%rax, 0x9e8(%rbp)
145687fc2:     	testq	%rax, %rax
145687fc5:     	je	0x145688026 <.text+0x5687026>
145687fc7:     	movq	0x9d8(%rbp), %rsi
145687fce:     	movq	0x9e8(%rbp), %rdi
145687fd5:     	negq	%rdi
145687fd8:     	movl	$0x1, %ecx
145687fdd:     	movq	%rsi, 0x9c8(%rbp)
145687fe4:     	jmp	0x14568800b <.text+0x568700b>
145687fe6:     	nopw	%cs:(%rax,%rax)
145687ff0:     	movq	0x9f0(%rbp), %rcx
145687ff7:     	leaq	(%rdi,%rcx), %rax
145687ffb:     	incq	%rax
145687ffe:     	incq	%rcx
145688001:     	addq	$0x8, %rsi
145688005:     	cmpq	$0x1, %rax
145688009:     	je	0x145688026 <.text+0x5687026>
14568800b:     	movq	%rcx, 0x9f0(%rbp)
145688012:     	movq	(%rsi), %rax
145688015:     	lock
145688016:     	decq	(%rax)
145688019:     	jne	0x145687ff0 <.text+0x5686ff0>
14568801b:     	movq	%rsi, %rcx
14568801e:     	callq	0x1455dae10 <.text+0x55d9e10>
145688023:     	nop
145688024:     	jmp	0x145687ff0 <.text+0x5686ff0>
145688026:     	movq	0x9d0(%rbp), %rdx
14568802d:     	testq	%rdx, %rdx
145688030:     	je	0x1456889ba <.text+0x56879ba>
145688036:     	movq	0x9d8(%rbp), %rcx
14568803d:     	shlq	$0x3, %rdx
145688041:     	movl	$0x8, %r8d
145688047:     	callq	0x1400021d0 <.text+0x11d0>
14568804c:     	jmp	0x1456889ba <.text+0x56879ba>
145688051:     	movq	%rdx, 0x9f0(%rbp)
145688058:     	movq	%rdx, 0x6f8(%rbp)
14568805f:     	movq	0x9e0(%rbp), %rsi
145688066:     	cmpq	0x9d0(%rbp), %rsi
14568806d:     	jne	0x14568807c <.text+0x568707c>
14568806f:     	leaq	0x9d0(%rbp), %rcx
145688076:     	callq	0x145774550 <.text+0x5773550>
14568807b:     	nop
14568807c:     	movq	0x9d8(%rbp), %rax
145688083:     	movq	0x9f0(%rbp), %rcx
14568808a:     	movq	%rcx, (%rax,%rsi,8)
14568808e:     	incq	%rsi
145688091:     	movq	%rsi, 0x9e0(%rbp)
145688098:     	jmp	0x1456889a4 <.text+0x56879a4>
14568809d:     	leaq	0x498(%rbp), %rdx
1456880a4:     	leaq	-0x48(%rbp), %rcx
1456880a8:     	movl	$0x260, %r8d            # imm = 0x260
1456880ae:     	callq	0x1457731ed <.text+0x57721ed>
1456880b3:     	movq	%rdi, -0x58(%rbp)
1456880b7:     	movq	%rsi, -0x50(%rbp)
1456880bb:     	leaq	0x980(%rbp), %rcx
1456880c2:     	leaq	-0x58(%rbp), %rsi
1456880c6:     	movq	%rsi, %rdx
1456880c9:     	callq	0x1456a5610 <.text+0x56a4610>
1456880ce:     	nop
1456880cf:     	movq	%r15, 0x9a0(%rbp)
1456880d6:     	movq	%rbx, 0x998(%rbp)
1456880dd:     	movq	0x988(%rbp), %r15
1456880e4:     	movq	0x990(%rbp), %rbx
1456880eb:     	cmpq	$0x2, %rbx
1456880ef:     	jae	0x14568862a <.text+0x568762a>
1456880f5:     	movq	%r15, -0x58(%rbp)
1456880f9:     	movq	%rbx, -0x50(%rbp)
1456880fd:     	leaq	0x16ca75c(%rip), %rax   # 0x146d52860
145688104:     	movq	%rax, 0x6f8(%rbp)
14568810b:     	leaq	0x16ca7ee(%rip), %rax   # 0x146d52900
145688112:     	movq	%rax, 0x700(%rbp)
145688119:     	movq	%rsi, 0x708(%rbp)
145688120:     	leaq	0x488(%rbp), %rcx
145688127:     	leaq	0x6f8(%rbp), %rdx
14568812e:     	callq	0x1456a6050 <.text+0x56a5050>
145688133:     	nop
145688134:     	movq	-0x50(%rbp), %rax
145688138:     	movq	$-0x1, %r10
14568813f:     	testq	%rax, %rax
145688142:     	movq	%r14, 0x9a8(%rbp)
145688149:     	je	0x1456882c1 <.text+0x56872c1>
14568814f:     	movq	-0x58(%rbp), %rdx
145688153:     	shlq	$0x3, %rax
145688157:     	leaq	(%rax,%rax,2), %rax
14568815b:     	jmp	0x14568816e <.text+0x568716e>
14568815d:     	nopl	(%rax)
145688160:     	addq	$0x18, %rdx
145688164:     	addq	$-0x18, %rax
145688168:     	je	0x1456882c1 <.text+0x56872c1>
14568816e:     	cmpq	$0x9, 0x10(%rdx)
145688173:     	jne	0x145688160 <.text+0x5687160>
145688175:     	movq	0x8(%rdx), %rcx
145688179:     	movzbl	(%rcx), %r8d
14568817d:     	leal	-0x41(%r8), %r9d
145688181:     	cmpb	$0x1a, %r9b
145688185:     	setb	%r9b
145688189:     	shlb	$0x5, %r9b
14568818d:     	orb	%r8b, %r9b
145688190:     	cmpb	$0x70, %r9b
145688194:     	jne	0x145688160 <.text+0x5687160>
145688196:     	movzbl	0x1(%rcx), %r8d
14568819b:     	leal	-0x41(%r8), %r9d
14568819f:     	cmpb	$0x1a, %r9b
1456881a3:     	setb	%r9b
1456881a7:     	shlb	$0x5, %r9b
1456881ab:     	orb	%r8b, %r9b
1456881ae:     	cmpb	$0x61, %r9b
1456881b2:     	jne	0x145688160 <.text+0x5687160>
1456881b4:     	movzbl	0x2(%rcx), %r8d
1456881b9:     	leal	-0x41(%r8), %r9d
1456881bd:     	cmpb	$0x1a, %r9b
1456881c1:     	setb	%r9b
1456881c5:     	shlb	$0x5, %r9b
1456881c9:     	orb	%r8b, %r9b
1456881cc:     	cmpb	$0x74, %r9b
1456881d0:     	jne	0x145688160 <.text+0x5687160>
1456881d2:     	movzbl	0x3(%rcx), %r8d
1456881d7:     	leal	-0x41(%r8), %r9d
1456881db:     	cmpb	$0x1a, %r9b
1456881df:     	setb	%r9b
1456881e3:     	shlb	$0x5, %r9b
1456881e7:     	orb	%r8b, %r9b
1456881ea:     	cmpb	$0x63, %r9b
1456881ee:     	jne	0x145688160 <.text+0x5687160>
1456881f4:     	movzbl	0x4(%rcx), %r8d
1456881f9:     	leal	-0x41(%r8), %r9d
1456881fd:     	cmpb	$0x1a, %r9b
145688201:     	setb	%r9b
145688205:     	shlb	$0x5, %r9b
145688209:     	orb	%r8b, %r9b
14568820c:     	cmpb	$0x68, %r9b
145688210:     	jne	0x145688160 <.text+0x5687160>
145688216:     	movzbl	0x5(%rcx), %r8d
14568821b:     	leal	-0x41(%r8), %r9d
14568821f:     	cmpb	$0x1a, %r9b
145688223:     	setb	%r9b
145688227:     	shlb	$0x5, %r9b
14568822b:     	orb	%r8b, %r9b
14568822e:     	cmpb	$0x2e, %r9b
145688232:     	jne	0x145688160 <.text+0x5687160>
145688238:     	movzbl	0x6(%rcx), %r8d
14568823d:     	leal	-0x41(%r8), %r9d
145688241:     	cmpb	$0x1a, %r9b
145688245:     	setb	%r9b
145688249:     	shlb	$0x5, %r9b
14568824d:     	orb	%r8b, %r9b
145688250:     	cmpb	$0x6d, %r9b
145688254:     	jne	0x145688160 <.text+0x5687160>
14568825a:     	movzbl	0x7(%rcx), %r8d
14568825f:     	leal	-0x41(%r8), %r9d
145688263:     	cmpb	$0x1a, %r9b
145688267:     	setb	%r9b
14568826b:     	shlb	$0x5, %r9b
14568826f:     	orb	%r8b, %r9b
145688272:     	cmpb	$0x70, %r9b
145688276:     	jne	0x145688160 <.text+0x5687160>
14568827c:     	movzbl	0x8(%rcx), %ecx
145688280:     	leal	-0x41(%rcx), %r8d
145688284:     	cmpb	$0x1a, %r8b
145688288:     	setb	%r8b
14568828c:     	shlb	$0x5, %r8b
145688290:     	orb	%cl, %r8b
145688293:     	cmpb	$0x71, %r8b
145688297:     	jne	0x145688160 <.text+0x5687160>
14568829d:     	leaq	0x6f8(%rbp), %rcx
1456882a4:     	callq	0x145728850 <.text+0x5727850>
1456882a9:     	nop
1456882aa:     	movq	0x6f8(%rbp), %r10
1456882b1:     	movq	0x700(%rbp), %rdx
1456882b8:     	movq	0x708(%rbp), %rsi
1456882bf:     	jmp	0x1456882c1 <.text+0x56872c1>
1456882c1:     	xorl	%r8d, %r8d
1456882c4:     	cmpq	$-0x1, %r10
1456882c8:     	setne	%r8b
1456882cc:     	movq	0x488(%rbp), %rax
1456882d3:     	movq	0x498(%rbp), %r12
1456882da:     	subq	%r12, %rax
1456882dd:     	cmpq	%r8, %rax
1456882e0:     	jb	0x145688651 <.text+0x5687651>
1456882e6:     	cmpq	$-0x1, %r10
1456882ea:     	je	0x145688308 <.text+0x5687308>
1456882ec:     	movq	0x490(%rbp), %rax
1456882f3:     	leaq	(%r12,%r12,2), %rcx
1456882f7:     	movq	%r10, (%rax,%rcx,8)
1456882fb:     	movq	%rdx, 0x8(%rax,%rcx,8)
145688300:     	movq	%rsi, 0x10(%rax,%rcx,8)
145688305:     	incq	%r12
145688308:     	movq	%r12, 0x498(%rbp)
14568830f:     	leaq	(%rbx,%rbx,2), %rax
145688313:     	leaq	(%r15,%rax,8), %r8
145688317:     	leaq	0x218(%rbp), %rcx
14568831e:     	movq	%r15, %rdx
145688321:     	callq	0x1456a6630 <.text+0x56a5630>
145688326:     	nop
145688327:     	movq	0x220(%rbp), %rsi
14568832e:     	movq	0x228(%rbp), %rdi
145688335:     	leaq	0x9fe(%rbp), %rax
14568833c:     	movq	%rax, 0x6f8(%rbp)
145688343:     	cmpq	$0x2, %rdi
145688347:     	jae	0x1456886a2 <.text+0x56876a2>
14568834d:     	movq	0x218(%rbp), %r14
145688354:     	leaq	(,%rdi,8), %rax
14568835c:     	leaq	(%rax,%rax,2), %r13
145688360:     	leaq	(%rsi,%r13), %rax
145688364:     	movq	%rsi, 0x6f8(%rbp)
14568836b:     	movq	%r14, 0x708(%rbp)
145688372:     	movq	%rsi, 0x700(%rbp)
145688379:     	movq	%rax, 0x710(%rbp)
145688380:     	movq	0x488(%rbp), %rax
145688387:     	subq	%r12, %rax
14568838a:     	cmpq	%rax, %rdi
14568838d:     	ja	0x1456886cd <.text+0x56876cd>
145688393:     	testq	%rdi, %rdi
145688396:     	je	0x1456883b2 <.text+0x56873b2>
145688398:     	leaq	(%r12,%r12,2), %rcx
14568839c:     	shlq	$0x3, %rcx
1456883a0:     	addq	0x490(%rbp), %rcx
1456883a7:     	movq	%rsi, %rdx
1456883aa:     	movq	%r13, %r8
1456883ad:     	callq	0x1457731ed <.text+0x57721ed>
1456883b2:     	addq	%rdi, %r12
1456883b5:     	movq	%r12, 0x498(%rbp)
1456883bc:     	testq	%r14, %r14
1456883bf:     	je	0x1456883d7 <.text+0x56873d7>
1456883c1:     	shlq	$0x3, %r14
1456883c5:     	leaq	(%r14,%r14,2), %rdx
1456883c9:     	movl	$0x8, %r8d
1456883cf:     	movq	%rsi, %rcx
1456883d2:     	callq	0x1400021d0 <.text+0x11d0>
1456883d7:     	movq	-0x50(%rbp), %rax
1456883db:     	testq	%rax, %rax
1456883de:     	movq	%r15, 0x9b0(%rbp)
1456883e5:     	je	0x14568873c <.text+0x568773c>
1456883eb:     	movq	-0x58(%rbp), %rdx
1456883ef:     	shlq	$0x3, %rax
1456883f3:     	leaq	(%rax,%rax,2), %rax
1456883f7:     	jmp	0x14568840e <.text+0x568740e>
1456883f9:     	nopl	(%rax)
145688400:     	addq	$0x18, %rdx
145688404:     	addq	$-0x18, %rax
145688408:     	je	0x14568873c <.text+0x568773c>
14568840e:     	cmpq	$0xb, 0x10(%rdx)
145688413:     	jne	0x145688400 <.text+0x5687400>
145688415:     	movq	0x8(%rdx), %rcx
145688419:     	movzbl	(%rcx), %r8d
14568841d:     	leal	-0x41(%r8), %r9d
145688421:     	cmpb	$0x1a, %r9b
145688425:     	setb	%r9b
145688429:     	shlb	$0x5, %r9b
14568842d:     	orb	%r8b, %r9b
145688430:     	cmpb	$0x73, %r9b
145688434:     	jne	0x145688400 <.text+0x5687400>
145688436:     	movzbl	0x1(%rcx), %r8d
14568843b:     	leal	-0x41(%r8), %r9d
14568843f:     	cmpb	$0x1a, %r9b
145688443:     	setb	%r9b
145688447:     	shlb	$0x5, %r9b
14568844b:     	orb	%r8b, %r9b
14568844e:     	cmpb	$0x70, %r9b
145688452:     	jne	0x145688400 <.text+0x5687400>
145688454:     	movzbl	0x2(%rcx), %r8d
145688459:     	leal	-0x41(%r8), %r9d
14568845d:     	cmpb	$0x1a, %r9b
145688461:     	setb	%r9b
145688465:     	shlb	$0x5, %r9b
145688469:     	orb	%r8b, %r9b
14568846c:     	cmpb	$0x65, %r9b
145688470:     	jne	0x145688400 <.text+0x5687400>
145688472:     	movzbl	0x3(%rcx), %r8d
145688477:     	leal	-0x41(%r8), %r9d
14568847b:     	cmpb	$0x1a, %r9b
14568847f:     	setb	%r9b
145688483:     	shlb	$0x5, %r9b
145688487:     	orb	%r8b, %r9b
14568848a:     	cmpb	$0x65, %r9b
14568848e:     	jne	0x145688400 <.text+0x5687400>
145688494:     	movzbl	0x4(%rcx), %r8d
145688499:     	leal	-0x41(%r8), %r9d
14568849d:     	cmpb	$0x1a, %r9b
1456884a1:     	setb	%r9b
1456884a5:     	shlb	$0x5, %r9b
1456884a9:     	orb	%r8b, %r9b
1456884ac:     	cmpb	$0x63, %r9b
1456884b0:     	jne	0x145688400 <.text+0x5687400>
1456884b6:     	movzbl	0x5(%rcx), %r8d
1456884bb:     	leal	-0x41(%r8), %r9d
1456884bf:     	cmpb	$0x1a, %r9b
1456884c3:     	setb	%r9b
1456884c7:     	shlb	$0x5, %r9b
1456884cb:     	orb	%r8b, %r9b
1456884ce:     	cmpb	$0x68, %r9b
1456884d2:     	jne	0x145688400 <.text+0x5687400>
1456884d8:     	movzbl	0x6(%rcx), %r8d
1456884dd:     	leal	-0x41(%r8), %r9d
1456884e1:     	cmpb	$0x1a, %r9b
1456884e5:     	setb	%r9b
1456884e9:     	shlb	$0x5, %r9b
1456884ed:     	orb	%r8b, %r9b
1456884f0:     	cmpb	$0x32, %r9b
1456884f4:     	jne	0x145688400 <.text+0x5687400>
1456884fa:     	movzbl	0x7(%rcx), %r8d
1456884ff:     	leal	-0x41(%r8), %r9d
145688503:     	cmpb	$0x1a, %r9b
145688507:     	setb	%r9b
14568850b:     	shlb	$0x5, %r9b
14568850f:     	orb	%r8b, %r9b
145688512:     	cmpb	$0x2e, %r9b
145688516:     	jne	0x145688400 <.text+0x5687400>
14568851c:     	movzbl	0x8(%rcx), %r8d
145688521:     	leal	-0x41(%r8), %r9d
145688525:     	cmpb	$0x1a, %r9b
145688529:     	setb	%r9b
14568852d:     	shlb	$0x5, %r9b
145688531:     	orb	%r8b, %r9b
145688534:     	cmpb	$0x6d, %r9b
145688538:     	jne	0x145688400 <.text+0x5687400>
14568853e:     	movzbl	0x9(%rcx), %r8d
145688543:     	leal	-0x41(%r8), %r9d
145688547:     	cmpb	$0x1a, %r9b
14568854b:     	setb	%r9b
14568854f:     	shlb	$0x5, %r9b
145688553:     	orb	%r8b, %r9b
145688556:     	cmpb	$0x70, %r9b
14568855a:     	jne	0x145688400 <.text+0x5687400>
145688560:     	movzbl	0xa(%rcx), %ecx
145688564:     	leal	-0x41(%rcx), %r8d
145688568:     	cmpb	$0x1a, %r8b
14568856c:     	setb	%r8b
145688570:     	shlb	$0x5, %r8b
145688574:     	orb	%cl, %r8b
145688577:     	cmpb	$0x71, %r8b
14568857b:     	jne	0x145688400 <.text+0x5687400>
145688581:     	movb	$0x0, 0x9ff(%rbp)
145688588:     	leaq	0x6f8(%rbp), %rcx
14568858f:     	callq	0x145728850 <.text+0x5727850>
145688594:     	nop
145688595:     	movq	0x6f8(%rbp), %rax
14568859c:     	movq	0x700(%rbp), %rcx
1456885a3:     	movq	%rcx, 0x9e8(%rbp)
1456885aa:     	movq	0x708(%rbp), %rsi
1456885b1:     	cmpq	%r12, 0x488(%rbp)
1456885b8:     	movq	%rax, 0x9f0(%rbp)
1456885bf:     	jne	0x145688732 <.text+0x5687732>
1456885c5:     	cmpq	$-0x1, %rax
1456885c9:     	je	0x145688732 <.text+0x5687732>
1456885cf:     	movq	$0x18, 0x20(%rsp)
1456885d8:     	leaq	0x488(%rbp), %rcx
1456885df:     	movl	$0x1, %r8d
1456885e5:     	movl	$0x8, %r9d
1456885eb:     	movq	%r12, %rdx
1456885ee:     	callq	0x1457744b0 <.text+0x57734b0>
1456885f3:     	nop
1456885f4:     	movq	0x498(%rbp), %r12
1456885fb:     	movq	0x490(%rbp), %r15
145688602:     	leaq	(%r12,%r12,2), %rax
145688606:     	movq	0x9f0(%rbp), %rcx
14568860d:     	movq	%rcx, (%r15,%rax,8)
145688611:     	movq	0x9e8(%rbp), %rcx
145688618:     	movq	%rcx, 0x8(%r15,%rax,8)
14568861d:     	movq	%rsi, 0x10(%r15,%rax,8)
145688622:     	incq	%r12
145688625:     	jmp	0x145688743 <.text+0x5687743>
14568862a:     	cmpq	$0x15, %rbx
14568862e:     	jae	0x1456886fb <.text+0x56876fb>
145688634:     	leaq	0x9fe(%rbp), %r9
14568863b:     	movl	$0x1, %r8d
145688641:     	movq	%r15, %rcx
145688644:     	movq	%rbx, %rdx
145688647:     	callq	0x140ad0670 <.text+0xacf670>
14568864c:     	jmp	0x1456880f5 <.text+0x56870f5>
145688651:     	movq	%rdx, 0x9e8(%rbp)
145688658:     	movq	%r10, 0x9f0(%rbp)
14568865f:     	movq	$0x18, 0x20(%rsp)
145688668:     	leaq	0x488(%rbp), %rcx
14568866f:     	movl	$0x8, %r9d
145688675:     	movq	%r12, %rdx
145688678:     	callq	0x1457744b0 <.text+0x57734b0>
14568867d:     	nop
14568867e:     	movq	0x498(%rbp), %r12
145688685:     	movq	0x9f0(%rbp), %r10
14568868c:     	movq	0x9e8(%rbp), %rdx
145688693:     	cmpq	$-0x1, %r10
145688697:     	jne	0x1456882ec <.text+0x56872ec>
14568869d:     	jmp	0x145688308 <.text+0x5687308>
1456886a2:     	cmpq	$0x15, %rdi
1456886a6:     	jae	0x145688713 <.text+0x5687713>
1456886a8:     	movb	$0x1, 0x9ff(%rbp)
1456886af:     	leaq	0x6f8(%rbp), %r9
1456886b6:     	movl	$0x1, %r8d
1456886bc:     	movq	%rsi, %rcx
1456886bf:     	movq	%rdi, %rdx
1456886c2:     	callq	0x14565f990 <.text+0x565e990>
1456886c7:     	nop
1456886c8:     	jmp	0x14568834d <.text+0x568734d>
1456886cd:     	movq	$0x18, 0x20(%rsp)
1456886d6:     	leaq	0x488(%rbp), %rcx
1456886dd:     	movl	$0x8, %r9d
1456886e3:     	movq	%r12, %rdx
1456886e6:     	movq	%rdi, %r8
1456886e9:     	callq	0x1457744b0 <.text+0x57734b0>
1456886ee:     	nop
1456886ef:     	movq	0x498(%rbp), %r12
1456886f6:     	jmp	0x145688398 <.text+0x5687398>
1456886fb:     	leaq	0x9fe(%rbp), %r8
145688702:     	movq	%r15, %rcx
145688705:     	movq	%rbx, %rdx
145688708:     	callq	0x145637520 <.text+0x5636520>
14568870d:     	nop
14568870e:     	jmp	0x1456880f5 <.text+0x56870f5>
145688713:     	movb	$0x1, 0x9ff(%rbp)
14568871a:     	leaq	0x6f8(%rbp), %r8
145688721:     	movq	%rsi, %rcx
145688724:     	movq	%rdi, %rdx
145688727:     	callq	0x145637390 <.text+0x5636390>
14568872c:     	nop
14568872d:     	jmp	0x14568834d <.text+0x568734d>
145688732:     	cmpq	$-0x1, %rax
145688736:     	jne	0x1456885fb <.text+0x56875fb>
14568873c:     	movq	0x490(%rbp), %r15
145688743:     	movq	0x488(%rbp), %rax
14568874a:     	shlq	$0x3, %r12
14568874e:     	leaq	(%r12,%r12,2), %r14
145688752:     	addq	%r15, %r14
145688755:     	movq	%r15, 0x488(%rbp)
14568875c:     	movq	%r15, 0x490(%rbp)
145688763:     	movq	%rax, 0x9b8(%rbp)
14568876a:     	movq	%rax, 0x498(%rbp)
145688771:     	movq	%r14, 0x4a0(%rbp)
145688778:     	leaq	0x20(%r15), %r13
14568877c:     	leaq	(%r12,%r12,2), %rdi
145688780:     	addq	$-0x18, %rdi
145688784:     	leaq	0x6f8(%rbp), %rsi
14568878b:     	movq	%r15, 0x9c0(%rbp)
145688792:     	jmp	0x1456887ab <.text+0x56877ab>
145688794:     	nopw	%cs:(%rax,%rax)
1456887a0:     	addq	$0x18, %r13
1456887a4:     	addq	$-0x18, %rdi
1456887a8:     	movq	%r12, %r15
1456887ab:     	cmpq	%r14, %r15
1456887ae:     	je	0x1456888b6 <.text+0x56878b6>
1456887b4:     	leaq	0x18(%r15), %r12
1456887b8:     	movq	%r12, 0x490(%rbp)
1456887bf:     	movq	(%r15), %rax
1456887c2:     	cmpq	$-0x1, %rax
1456887c6:     	je	0x1456888b3 <.text+0x56878b3>
1456887cc:     	movq	%rax, 0x9f0(%rbp)
1456887d3:     	movq	0x8(%r15), %r9
1456887d7:     	movq	0x10(%r15), %rax
1456887db:     	movq	%rax, 0x20(%rsp)
1456887e0:     	leaq	0x218(%rbp), %r15
1456887e7:     	movq	%r15, %rcx
1456887ea:     	movq	0x9a0(%rbp), %rdx
1456887f1:     	movq	0x998(%rbp), %r8
1456887f8:     	movq	%r9, 0x9c8(%rbp)
1456887ff:     	callq	0x145702c70 <.text+0x5701c70>
145688804:     	nop
145688805:     	movq	%rsi, %rcx
145688808:     	movq	%r15, %rdx
14568880b:     	callq	0x1455d19f0 <.text+0x55d09f0>
145688810:     	nop
145688811:     	movq	%rsi, %rcx
145688814:     	movq	%r15, %rdx
145688817:     	callq	0x1455d41a0 <.text+0x55d31a0>
14568881c:     	nop
14568881d:     	cmpq	$0x1, %rax
145688821:     	je	0x1456889d1 <.text+0x56879d1>
145688827:     	movq	%rdx, 0x9e8(%rbp)
14568882e:     	movq	%rdx, 0x6f8(%rbp)
145688835:     	movq	0x9e0(%rbp), %r15
14568883c:     	cmpq	0x9d0(%rbp), %r15
145688843:     	jne	0x145688852 <.text+0x5687852>
145688845:     	leaq	0x9d0(%rbp), %rcx
14568884c:     	callq	0x145774550 <.text+0x5773550>
145688851:     	nop
145688852:     	movq	0x9d8(%rbp), %rax
145688859:     	movq	0x9e8(%rbp), %rcx
145688860:     	movq	%rcx, (%rax,%r15,8)
145688864:     	incq	%r15
145688867:     	movq	%r15, 0x9e0(%rbp)
14568886e:     	movq	0x218(%rbp), %rdx
145688875:     	testq	%rdx, %rdx
145688878:     	je	0x14568888c <.text+0x568788c>
14568887a:     	movq	0x220(%rbp), %rcx
145688881:     	movl	$0x1, %r8d
145688887:     	callq	0x1400021d0 <.text+0x11d0>
14568888c:     	movq	0x9f0(%rbp), %rdx
145688893:     	testq	%rdx, %rdx
145688896:     	je	0x1456887a0 <.text+0x56877a0>
14568889c:     	movl	$0x1, %r8d
1456888a2:     	movq	0x9c8(%rbp), %rcx
1456888a9:     	callq	0x1400021d0 <.text+0x11d0>
1456888ae:     	jmp	0x1456887a0 <.text+0x56877a0>
1456888b3:     	movq	%r12, %r15
1456888b6:     	movq	%r14, %rax
1456888b9:     	subq	%r15, %rax
1456888bc:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
1456888c6:     	mulq	%rcx
1456888c9:     	cmpq	%r15, %r14
1456888cc:     	movq	0x9a8(%rbp), %r14
1456888d3:     	je	0x145688912 <.text+0x5687912>
1456888d5:     	movq	%rdx, %rsi
1456888d8:     	shrq	$0x4, %rsi
1456888dc:     	addq	$0x8, %r15
1456888e0:     	jmp	0x1456888f9 <.text+0x56878f9>
1456888e2:     	nopw	%cs:(%rax,%rax)
1456888f0:     	addq	$0x18, %r15
1456888f4:     	decq	%rsi
1456888f7:     	je	0x145688912 <.text+0x5687912>
1456888f9:     	movq	-0x8(%r15), %rdx
1456888fd:     	testq	%rdx, %rdx
145688900:     	je	0x1456888f0 <.text+0x56878f0>
145688902:     	movq	(%r15), %rcx
145688905:     	movl	$0x1, %r8d
14568890b:     	callq	0x1400021d0 <.text+0x11d0>
145688910:     	jmp	0x1456888f0 <.text+0x56878f0>
145688912:     	movq	0x9b8(%rbp), %rax
145688919:     	testq	%rax, %rax
14568891c:     	je	0x145688938 <.text+0x5687938>
14568891e:     	shlq	$0x3, %rax
145688922:     	leaq	(%rax,%rax,2), %rdx
145688926:     	movl	$0x8, %r8d
14568892c:     	movq	0x9c0(%rbp), %rcx
145688933:     	callq	0x1400021d0 <.text+0x11d0>
145688938:     	cmpq	$0x0, 0x9e0(%rbp)
145688940:     	movq	0x9b0(%rbp), %r15
145688947:     	je	0x145688a9f <.text+0x5687a9f>
14568894d:     	testq	%rbx, %rbx
145688950:     	je	0x145688982 <.text+0x5687982>
145688952:     	leaq	0x8(%r15), %rsi
145688956:     	jmp	0x145688969 <.text+0x5687969>
145688958:     	nopl	(%rax,%rax)
145688960:     	addq	$0x18, %rsi
145688964:     	decq	%rbx
145688967:     	je	0x145688982 <.text+0x5687982>
145688969:     	movq	-0x8(%rsi), %rdx
14568896d:     	testq	%rdx, %rdx
145688970:     	je	0x145688960 <.text+0x5687960>
145688972:     	movq	(%rsi), %rcx
145688975:     	movl	$0x1, %r8d
14568897b:     	callq	0x1400021d0 <.text+0x11d0>
145688980:     	jmp	0x145688960 <.text+0x5687960>
145688982:     	movq	0x980(%rbp), %rax
145688989:     	testq	%rax, %rax
14568898c:     	je	0x1456889a4 <.text+0x56879a4>
14568898e:     	shlq	$0x3, %rax
145688992:     	leaq	(%rax,%rax,2), %rdx
145688996:     	movl	$0x8, %r8d
14568899c:     	movq	%r15, %rcx
14568899f:     	callq	0x1400021d0 <.text+0x11d0>
1456889a4:     	movq	0x9e0(%rbp), %rax
1456889ab:     	movq	%rax, 0x10(%r14)
1456889af:     	movups	0x9d0(%rbp), %xmm0
1456889b6:     	movups	%xmm0, (%r14)
1456889ba:     	movq	%r14, %rax
1456889bd:     	addq	$0xa88, %rsp            # imm = 0xA88
1456889c4:     	popq	%rbx
1456889c5:     	popq	%rdi
1456889c6:     	popq	%rsi
1456889c7:     	popq	%r12
1456889c9:     	popq	%r13
1456889cb:     	popq	%r14
1456889cd:     	popq	%r15
1456889cf:     	popq	%rbp
1456889d0:     	retq
1456889d1:     	movq	0x9a8(%rbp), %rax
1456889d8:     	movq	%rdx, 0x8(%rax)
1456889dc:     	movq	%rax, %rsi
1456889df:     	movq	$-0x1, (%rax)
1456889e6:     	movq	0x218(%rbp), %rdx
1456889ed:     	testq	%rdx, %rdx
1456889f0:     	je	0x145688a04 <.text+0x5687a04>
1456889f2:     	movq	0x220(%rbp), %rcx
1456889f9:     	movl	$0x1, %r8d
1456889ff:     	callq	0x1400021d0 <.text+0x11d0>
145688a04:     	movq	0x9f0(%rbp), %rdx
145688a0b:     	testq	%rdx, %rdx
145688a0e:     	movq	0x9b0(%rbp), %r15
145688a15:     	je	0x145688a29 <.text+0x5687a29>
145688a17:     	movl	$0x1, %r8d
145688a1d:     	movq	0x9c8(%rbp), %rcx
145688a24:     	callq	0x1400021d0 <.text+0x11d0>
145688a29:     	cmpq	%r12, %r14
145688a2c:     	movq	%rsi, %r14
145688a2f:     	je	0x145688a73 <.text+0x5687a73>
145688a31:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
145688a3b:     	movq	%rdi, %rax
145688a3e:     	mulq	%rcx
145688a41:     	movq	%rdx, %rsi
145688a44:     	shrq	$0x4, %rsi
145688a48:     	jmp	0x145688a59 <.text+0x5687a59>
145688a4a:     	nopw	(%rax,%rax)
145688a50:     	addq	$0x18, %r13
145688a54:     	decq	%rsi
145688a57:     	je	0x145688a73 <.text+0x5687a73>
145688a59:     	movq	-0x8(%r13), %rdx
145688a5d:     	testq	%rdx, %rdx
145688a60:     	je	0x145688a50 <.text+0x5687a50>
145688a62:     	movq	(%r13), %rcx
145688a66:     	movl	$0x1, %r8d
145688a6c:     	callq	0x1400021d0 <.text+0x11d0>
145688a71:     	jmp	0x145688a50 <.text+0x5687a50>
145688a73:     	movq	0x9b8(%rbp), %rax
145688a7a:     	testq	%rax, %rax
145688a7d:     	je	0x145688b0a <.text+0x5687b0a>
145688a83:     	shlq	$0x3, %rax
145688a87:     	leaq	(%rax,%rax,2), %rdx
145688a8b:     	movl	$0x8, %r8d
145688a91:     	movq	0x9c0(%rbp), %rcx
145688a98:     	callq	0x1400021d0 <.text+0x11d0>
145688a9d:     	jmp	0x145688b0a <.text+0x5687b0a>
145688a9f:     	movq	0x9a0(%rbp), %rax
145688aa6:     	movq	%rax, 0x218(%rbp)
145688aad:     	movq	0x998(%rbp), %rax
145688ab4:     	movq	%rax, 0x220(%rbp)
145688abb:     	leaq	0x218(%rbp), %rax
145688ac2:     	movq	%rax, 0x6f8(%rbp)
145688ac9:     	leaq	0x92770(%rip), %rax     # 0x14571b240 <.text+0x571a240>
145688ad0:     	movq	%rax, 0x700(%rbp)
145688ad7:     	leaq	0x16c9b9c(%rip), %rdx   # 0x146d5267a
145688ade:     	leaq	0x968(%rbp), %rcx
145688ae5:     	leaq	0x6f8(%rbp), %r8
145688aec:     	callq	0x145728390 <.text+0x5727390>
145688af1:     	nop
145688af2:     	leaq	0x968(%rbp), %rcx
145688af9:     	callq	0x1458ffde0 <.text+0x58fede0>
145688afe:     	nop
145688aff:     	movq	%rax, 0x8(%r14)
145688b03:     	movq	$-0x1, (%r14)
145688b0a:     	testq	%rbx, %rbx
145688b0d:     	je	0x145688b42 <.text+0x5687b42>
145688b0f:     	leaq	0x8(%r15), %rsi
145688b13:     	jmp	0x145688b29 <.text+0x5687b29>
145688b15:     	nopw	%cs:(%rax,%rax)
145688b20:     	addq	$0x18, %rsi
145688b24:     	decq	%rbx
145688b27:     	je	0x145688b42 <.text+0x5687b42>
145688b29:     	movq	-0x8(%rsi), %rdx
145688b2d:     	testq	%rdx, %rdx
145688b30:     	je	0x145688b20 <.text+0x5687b20>
145688b32:     	movq	(%rsi), %rcx
145688b35:     	movl	$0x1, %r8d
145688b3b:     	callq	0x1400021d0 <.text+0x11d0>
145688b40:     	jmp	0x145688b20 <.text+0x5687b20>
145688b42:     	movq	0x980(%rbp), %rax
145688b49:     	testq	%rax, %rax
145688b4c:     	je	0x145687fb4 <.text+0x5686fb4>
145688b52:     	shlq	$0x3, %rax
145688b56:     	leaq	(%rax,%rax,2), %rdx
145688b5a:     	movl	$0x8, %r8d
145688b60:     	movq	%r15, %rcx
145688b63:     	callq	0x1400021d0 <.text+0x11d0>
145688b68:     	jmp	0x145687fb4 <.text+0x5686fb4>

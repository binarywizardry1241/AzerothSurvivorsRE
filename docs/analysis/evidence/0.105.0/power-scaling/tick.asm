
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145904e91:     	movsd	0x4c8(%r13), %xmm11
145904e9a:     	movss	0x4b979e(%rip), %xmm0   # 0x145dbe640
145904ea2:     	movss	0x48c(%r13), %xmm7
145904eab:     	mulss	%xmm0, %xmm7
145904eaf:     	movq	0xd8(%r13), %rax
145904eb6:     	movq	%rax, 0x350(%rbp)
145904ebd:     	movaps	%xmm7, %xmm1
145904ec0:     	maxss	%xmm0, %xmm1
145904ec4:     	movss	0x1573598(%rip), %xmm0  # 0x146e78464
145904ecc:     	mulss	%xmm1, %xmm0
145904ed0:     	movss	%xmm0, 0x338(%rbp)
145904ed8:     	leaq	0x128(%r13), %rax
145904edf:     	movq	%rax, 0x348(%rbp)
145904ee6:     	leaq	0x558(%r13), %rax
145904eed:     	movq	%rax, 0x330(%rbp)
145904ef4:     	leaq	0x5d0(%r13), %rax
145904efb:     	movq	%rax, 0x60(%rbp)
145904eff:     	leaq	0x588(%r13), %rax
145904f06:     	movq	%rax, 0x48(%rbp)
145904f0a:     	mulss	0x49602a(%rip), %xmm1   # 0x145d9af3c
145904f12:     	movss	%xmm1, 0x318(%rbp)
145904f1a:     	leaq	0x7e8(%r13), %rax
145904f21:     	movq	%rax, 0x50(%rbp)
145904f25:     	movss	0x157345b(%rip), %xmm0  # 0x146e78388
145904f2d:     	mulss	%xmm7, %xmm0
145904f31:     	maxss	0x498e27(%rip), %xmm0   # 0x145d9dd60
145904f39:     	movss	%xmm0, 0x328(%rbp)
145904f41:     	mulss	0x46bcf3(%rip), %xmm7   # 0x145d70c3c
145904f49:     	leaq	0x110(%r13), %rax
145904f50:     	movq	%rax, 0x208(%rbp)
145904f57:     	xorps	%xmm9, %xmm9
145904f5b:     	movss	0x468408(%rip), %xmm8   # 0x145d6d36c
145904f64:     	xorl	%r12d, %r12d
145904f67:     	jmp	0x145904f97 <.text+0x5903f97>
145904f69:     	nopl	(%rax)
145904f70:     	movshdup	%xmm12, %xmm3           # xmm3 = xmm12[1,1,3,3]
145904f75:     	movl	0x370(%rbp), %eax
145904f7b:     	movb	%al, 0x387(%rbp)
145904f81:     	movss	%xmm7, 0x20(%rsp)
145904f87:     	movq	%rsi, %rcx
145904f8a:     	movq	%r13, %rdx
145904f8d:     	movaps	%xmm12, %xmm2
145904f91:     	callq	0x14592ea80 <.text+0x592da80>
145904f96:     	nop
145904f97:     	cmpq	0x350(%rbp), %r12
145904f9e:     	jae	0x1459077f2 <.text+0x59067f2>
145904fa4:     	movq	%r12, %r13
145904fa7:     	movq	0x378(%rbp), %rax
145904fae:     	movq	0xd8(%rax), %rdx
145904fb5:     	cmpq	%rdx, %r12
145904fb8:     	jae	0x145911516 <.text+0x5910516>
145904fbe:     	leaq	0x1(%r13), %r12
145904fc2:     	movq	0xd0(%rax), %rax
145904fc9:     	imulq	$0x78, %r13, %r15
145904fcd:     	movss	0x64(%rax,%r15), %xmm1
145904fd4:     	movss	0x200(%rbp), %xmm0
145904fdc:     	ucomiss	%xmm0, %xmm1
145904fdf:     	ja	0x145904f97 <.text+0x5903f97>
145904fe1:     	addq	%r15, %rax
145904fe4:     	addss	0x46ed58(%rip), %xmm0   # 0x145d73d44
145904fec:     	movss	%xmm0, 0x64(%rax)
145904ff1:     	movq	0x378(%rbp), %rax
145904ff8:     	movq	0xd8(%rax), %rdi
145904fff:     	cmpq	%rdi, %r13
145905002:     	jae	0x145911606 <.text+0x5910606>
145905008:     	movq	0xd0(%rax), %rax
14590500f:     	leaq	(%rax,%r15), %rbx
145905013:     	movq	0x18(%rax,%r15), %r14
145905018:     	movss	0x200(%rbp), %xmm14
145905021:     	movss	0x5c(%rax,%r15), %xmm0
145905028:     	ucomiss	%xmm0, %xmm9
14590502c:     	jae	0x145905090 <.text+0x5904090>
14590502e:     	movaps	%xmm14, %xmm1
145905032:     	subss	0x58(%rbx), %xmm1
145905037:     	divss	%xmm0, %xmm1
14590503b:     	xorps	%xmm0, %xmm0
14590503e:     	maxss	%xmm1, %xmm0
145905042:     	movaps	%xmm8, %xmm1
145905046:     	minss	%xmm0, %xmm1
14590504a:     	movsd	0x40(%rbx), %xmm0
14590504f:     	movsd	0x4c(%rbx), %xmm2
145905054:     	subps	%xmm0, %xmm2
145905057:     	movsldup	%xmm1, %xmm10           # xmm10 = xmm1[0,0,2,2]
14590505c:     	mulps	%xmm2, %xmm10
145905060:     	addps	%xmm0, %xmm10
145905064:     	movss	0x48(%rbx), %xmm0
145905069:     	movss	0x54(%rbx), %xmm2
14590506e:     	subss	%xmm0, %xmm2
145905072:     	mulss	%xmm1, %xmm2
145905076:     	addss	%xmm0, %xmm2
14590507a:     	movlps	%xmm10, 0x30(%rbp)
14590507f:     	movss	%xmm2, 0x38(%rbp)
145905084:     	jmp	0x1459050a4 <.text+0x59040a4>
145905086:     	nopw	%cs:(%rax,%rax)
145905090:     	movq	0x4c(%rbx), %rax
145905094:     	movq	%rax, 0x30(%rbp)
145905098:     	movl	0x54(%rbx), %eax
14590509b:     	movl	%eax, 0x38(%rbp)
14590509e:     	movsd	0x30(%rbp), %xmm10
1459050a4:     	movss	0x68(%rbx), %xmm13
1459050aa:     	movq	0x378(%rbp), %rsi
1459050b1:     	addss	0x4d4(%rsi), %xmm13
1459050ba:     	movaps	%xmm13, %xmm0
1459050be:     	callq	0x145bc97c3 <.text+0x5bc87c3>
1459050c3:     	movaps	%xmm0, %xmm12
1459050c7:     	movaps	%xmm13, %xmm0
1459050cb:     	callq	0x145bc97bd <.text+0x5bc87bd>
1459050d0:     	unpcklps	%xmm0, %xmm12           # xmm12 = xmm12[0],xmm0[0],xmm12[1],xmm0[1]
1459050d4:     	mulps	0x1573434(%rip), %xmm12 # 0x146e78510
1459050dc:     	addps	%xmm11, %xmm12
1459050e0:     	movaps	%xmm10, %xmm0
1459050e4:     	subps	%xmm11, %xmm0
1459050e8:     	mulps	%xmm0, %xmm0
1459050eb:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1459050ef:     	addss	%xmm0, %xmm1
1459050f3:     	xorps	%xmm0, %xmm0
1459050f6:     	sqrtss	%xmm1, %xmm0
1459050fa:     	ucomiss	0x46bb73(%rip), %xmm0   # 0x145d70c74
145905101:     	ja	0x145904f70 <.text+0x5903f70>
145905107:     	cmpl	$0x0, 0x34(%r14)
14590510c:     	movq	%r14, 0x360(%rbp)
145905113:     	je	0x1459051d9 <.text+0x59041d9>
145905119:     	subps	%xmm12, %xmm10
14590511d:     	mulps	%xmm10, %xmm10
145905121:     	movshdup	%xmm10, %xmm0           # xmm0 = xmm10[1,1,3,3]
145905126:     	addss	%xmm10, %xmm0
14590512b:     	sqrtss	%xmm0, %xmm0
14590512f:     	ucomiss	0x798c0e(%rip), %xmm0   # 0x14609dd44
145905136:     	jbe	0x145905179 <.text+0x5904179>
145905138:     	movshdup	%xmm12, %xmm3           # xmm3 = xmm12[1,1,3,3]
14590513d:     	movl	0x370(%rbp), %eax
145905143:     	movb	%al, 0x387(%rbp)
145905149:     	movss	0x338(%rbp), %xmm0
145905151:     	movss	%xmm0, 0x20(%rsp)
145905157:     	movq	0x378(%rbp), %rcx
14590515e:     	movq	%r13, %rdx
145905161:     	movaps	%xmm12, %xmm2
145905165:     	callq	0x14592ea80 <.text+0x592da80>
14590516a:     	nop
14590516b:     	movq	0x378(%rbp), %rax
145905172:     	movq	0xd8(%rax), %rdi
145905179:     	cmpq	%rdi, %r13
14590517c:     	jae	0x14591170b <.text+0x591070b>
145905182:     	movq	0x378(%rbp), %rax
145905189:     	movq	0xd0(%rax), %rax
145905190:     	movss	0x200(%rbp), %xmm0
145905198:     	ucomiss	0x60(%rax,%r15), %xmm0
14590519e:     	jb	0x145906c8c <.text+0x5905c8c>
1459051a4:     	movq	0x360(%rbp), %rax
1459051ab:     	cmpb	$0x0, 0x39(%rax)
1459051af:     	je	0x145905287 <.text+0x5904287>
1459051b5:     	movl	0x370(%rbp), %eax
1459051bb:     	movb	%al, 0x387(%rbp)
1459051c1:     	movq	0x378(%rbp), %rcx
1459051c8:     	movq	%r13, %rdx
1459051cb:     	callq	0x14594cdc0 <.text+0x594bdc0>
1459051d0:     	nop
1459051d1:     	movq	%rdx, %rbx
1459051d4:     	jmp	0x1459052f1 <.text+0x59042f1>
1459051d9:     	movq	0x28(%rbx), %rbx
1459051dd:     	movq	0x378(%rbp), %rax
1459051e4:     	movq	0x568(%rax), %rcx
1459051eb:     	testq	%rcx, %rcx
1459051ee:     	je	0x14590549c <.text+0x590449c>
1459051f4:     	movq	0x560(%rax), %rax
1459051fb:     	imulq	$0x160, %rcx, %rdx      # imm = 0x160
145905202:     	xorl	%ecx, %ecx
145905204:     	jmp	0x145905220 <.text+0x5904220>
145905206:     	nopw	%cs:(%rax,%rax)
145905210:     	addq	$0x160, %rcx            # imm = 0x160
145905217:     	cmpq	%rcx, %rdx
14590521a:     	je	0x14590549c <.text+0x590449c>
145905220:     	cmpq	%rbx, 0x88(%rax,%rcx)
145905228:     	jne	0x145905210 <.text+0x5904210>
14590522a:     	cmpl	$0x1, 0x68(%rax,%rcx)
14590522f:     	je	0x145905210 <.text+0x5904210>
145905231:     	movss	0x128(%rax,%rcx), %xmm0
14590523a:     	ucomiss	%xmm0, %xmm9
14590523e:     	jae	0x145905453 <.text+0x5904453>
145905244:     	subss	0x124(%rax,%rcx), %xmm14
14590524e:     	divss	%xmm0, %xmm14
145905253:     	xorps	%xmm0, %xmm0
145905256:     	maxss	%xmm14, %xmm0
14590525b:     	movaps	%xmm8, %xmm1
14590525f:     	minss	%xmm0, %xmm1
145905263:     	movsd	0x10c(%rax,%rcx), %xmm2
14590526c:     	movsd	0x118(%rax,%rcx), %xmm3
145905275:     	subps	%xmm2, %xmm3
145905278:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
14590527c:     	mulps	%xmm3, %xmm0
14590527f:     	addps	%xmm2, %xmm0
145905282:     	jmp	0x14590545c <.text+0x590445c>
145905287:     	movl	0x370(%rbp), %eax
14590528d:     	movb	%al, 0x387(%rbp)
145905293:     	leaq	0xa0(%rbp), %rcx
14590529a:     	movq	0x378(%rbp), %rdx
1459052a1:     	leaq	0x30(%rbp), %r8
1459052a5:     	movss	0x498b73(%rip), %xmm3   # 0x145d9de20
1459052ad:     	callq	0x145925e50 <.text+0x5924e50>
1459052b2:     	nop
1459052b3:     	movq	0xa8(%rbp), %rcx
1459052ba:     	cmpq	$0x0, 0xb0(%rbp)
1459052c2:     	je	0x14590543c <.text+0x590443c>
1459052c8:     	movq	(%rcx), %rbx
1459052cb:     	movl	$0x1, %eax
1459052d0:     	movq	0xa0(%rbp), %rdx
1459052d7:     	testq	%rdx, %rdx
1459052da:     	je	0x1459052f1 <.text+0x59042f1>
1459052dc:     	shlq	$0x3, %rdx
1459052e0:     	movl	$0x8, %r8d
1459052e6:     	movq	%rax, %rsi
1459052e9:     	callq	0x1400021d0 <.text+0x11d0>
1459052ee:     	movq	%rsi, %rax
1459052f1:     	movq	0x378(%rbp), %rcx
1459052f8:     	movq	0xd8(%rcx), %rdx
1459052ff:     	cmpq	%rdx, %r13
145905302:     	jae	0x1459117e4 <.text+0x59107e4>
145905308:     	testb	$0x1, %al
14590530a:     	movl	$0x0, %eax
14590530f:     	cmovneq	%rbx, %rax
145905313:     	movq	0xd0(%rcx), %rcx
14590531a:     	movq	%rax, 0x28(%rcx,%r15)
14590531f:     	je	0x145906c8c <.text+0x5905c8c>
145905325:     	movl	0x370(%rbp), %eax
14590532b:     	movb	%al, 0x387(%rbp)
145905331:     	movq	0x378(%rbp), %rcx
145905338:     	movq	%r13, %rdx
14590533b:     	movq	%rbx, %r8
14590533e:     	callq	0x14594e0f0 <.text+0x594d0f0>
145905343:     	nop
145905344:     	movq	0x378(%rbp), %rcx
14590534b:     	movq	0xd8(%rcx), %rdx
145905352:     	cmpq	%rdx, %r13
145905355:     	jae	0x1459118a6 <.text+0x59108a6>
14590535b:     	addss	0x200(%rbp), %xmm0
145905363:     	movq	0xd0(%rcx), %rax
14590536a:     	movss	%xmm0, 0x60(%rax,%r15)
145905371:     	movq	0xd8(%rcx), %rdx
145905378:     	cmpq	%rdx, %r13
14590537b:     	jae	0x1459118c7 <.text+0x59108c7>
145905381:     	movq	0xd0(%rcx), %rax
145905388:     	movq	0x18(%rax,%r15), %r14
14590538d:     	addq	%r15, %rax
145905390:     	movzbl	0x39(%r14), %ecx
145905395:     	cmpl	$0x1, %ecx
145905398:     	je	0x145905994 <.text+0x5904994>
14590539e:     	cmpl	$0x7, %ecx
1459053a1:     	je	0x145905934 <.text+0x5904934>
1459053a7:     	cmpl	$0x8, %ecx
1459053aa:     	jne	0x145905a09 <.text+0x5904a09>
1459053b0:     	leaq	0x1575759(%rip), %rax   # 0x146e7ab10
1459053b7:     	movq	%rax, 0xa0(%rbp)
1459053be:     	movq	$0x9, 0xa8(%rbp)
1459053c9:     	movq	$0x0, 0xb0(%rbp)
1459053d4:     	movb	$0x0, 0xc8(%rbp)
1459053db:     	movl	0x370(%rbp), %eax
1459053e1:     	movb	%al, 0x387(%rbp)
1459053e7:     	movq	0x378(%rbp), %rcx
1459053ee:     	movq	%r13, %rdx
1459053f1:     	leaq	0xa0(%rbp), %r8
1459053f8:     	callq	0x145951440 <.text+0x5950440>
1459053fd:     	nop
1459053fe:     	movq	0x378(%rbp), %rax
145905405:     	movq	0x780(%rax), %rdx
14590540c:     	testq	%rdx, %rdx
14590540f:     	je	0x145906c8c <.text+0x5905c8c>
145905415:     	movq	0x378(%rbp), %rax
14590541c:     	movq	0x778(%rax), %rax
145905423:     	cmpq	$0x1, %rdx
145905427:     	jne	0x145906011 <.text+0x5905011>
14590542d:     	xorl	%ecx, %ecx
14590542f:     	movss	0x46b839(%rip), %xmm0   # 0x145d70c70
145905437:     	jmp	0x145906056 <.text+0x5905056>
14590543c:     	xorl	%eax, %eax
14590543e:     	movq	0xa0(%rbp), %rdx
145905445:     	testq	%rdx, %rdx
145905448:     	jne	0x1459052dc <.text+0x59042dc>
14590544e:     	jmp	0x1459052f1 <.text+0x59042f1>
145905453:     	movsd	0x118(%rax,%rcx), %xmm0
14590545c:     	subps	%xmm11, %xmm0
145905460:     	mulps	%xmm0, %xmm0
145905463:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
145905467:     	addss	%xmm0, %xmm1
14590546b:     	xorps	%xmm0, %xmm0
14590546e:     	sqrtss	%xmm1, %xmm0
145905472:     	movss	0x5d2766(%rip), %xmm1   # 0x145ed7be0
14590547a:     	ucomiss	%xmm0, %xmm1
14590547d:     	jbe	0x14590549c <.text+0x590449c>
14590547f:     	cmpq	$-0x1, 0x18(%rax,%rcx)
145905485:     	setne	%dl
145905488:     	addb	%dl, %dl
14590548a:     	orb	0x15c(%rax,%rcx), %dl
145905491:     	movb	%dl, 0x2a0(%rbp)
145905497:     	movb	$0x1, %sil
14590549a:     	jmp	0x14590549e <.text+0x590449e>
14590549c:     	xorl	%esi, %esi
14590549e:     	movl	0x38(%rbp), %eax
1459054a1:     	movl	%eax, 0x238(%rbp)
1459054a7:     	movq	0x30(%rbp), %rax
1459054ab:     	movq	%rax, 0x230(%rbp)
1459054b2:     	movl	0x370(%rbp), %eax
1459054b8:     	movb	%al, 0x387(%rbp)
1459054be:     	leaq	0xa0(%rbp), %rcx
1459054c5:     	movq	0x378(%rbp), %rdx
1459054cc:     	leaq	0x230(%rbp), %r8
1459054d3:     	movss	0x4b2a75(%rip), %xmm3   # 0x145db7f50
1459054db:     	callq	0x145925e50 <.text+0x5924e50>
1459054e0:     	nop
1459054e1:     	movq	0xa8(%rbp), %rcx
1459054e8:     	movq	0xb0(%rbp), %rax
1459054ef:     	testq	%rax, %rax
1459054f2:     	je	0x1459055d6 <.text+0x59045d6>
1459054f8:     	leaq	(%rcx,%rax,8), %rax
1459054fc:     	movq	0x378(%rbp), %r8
145905503:     	movss	0x9ec(%r8), %xmm0
14590550c:     	movq	0x560(%r8), %rdx
145905513:     	imulq	$0x160, 0x568(%r8), %r8 # imm = 0x160
14590551e:     	movq	%rcx, %r9
145905521:     	movss	0x4988f7(%rip), %xmm5   # 0x145d9de20
145905529:     	jmp	0x14590555b <.text+0x590455b>
14590552b:     	nopl	(%rax,%rax)
145905530:     	movsd	-0x48(%rdx,%r10), %xmm1
145905537:     	subps	%xmm11, %xmm1
14590553b:     	mulps	%xmm1, %xmm1
14590553e:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
145905542:     	addss	%xmm1, %xmm2
145905546:     	xorps	%xmm1, %xmm1
145905549:     	sqrtss	%xmm2, %xmm1
14590554d:     	ucomiss	%xmm1, %xmm5
145905550:     	ja	0x145905825 <.text+0x5904825>
145905556:     	cmpq	%rax, %r9
145905559:     	je	0x1459055d6 <.text+0x59045d6>
14590555b:     	movq	(%r9), %rdi
14590555e:     	addq	$0x8, %r9
145905562:     	xorl	%r10d, %r10d
145905565:     	movq	%rdx, %r11
145905568:     	nopl	(%rax,%rax)
145905570:     	cmpq	%r10, %r8
145905573:     	je	0x145905556 <.text+0x5904556>
145905575:     	addq	$0x160, %r10            # imm = 0x160
14590557c:     	cmpq	%rdi, 0x88(%r11)
145905583:     	leaq	0x160(%r11), %r11
14590558a:     	jne	0x145905570 <.text+0x5904570>
14590558c:     	movss	-0x38(%rdx,%r10), %xmm1
145905593:     	ucomiss	%xmm1, %xmm9
145905597:     	jae	0x145905530 <.text+0x5904530>
145905599:     	movaps	%xmm0, %xmm2
14590559c:     	subss	-0x3c(%rdx,%r10), %xmm2
1459055a3:     	divss	%xmm1, %xmm2
1459055a7:     	xorps	%xmm1, %xmm1
1459055aa:     	maxss	%xmm2, %xmm1
1459055ae:     	movaps	%xmm8, %xmm2
1459055b2:     	minss	%xmm1, %xmm2
1459055b6:     	movsd	-0x54(%rdx,%r10), %xmm3
1459055bd:     	movsd	-0x48(%rdx,%r10), %xmm4
1459055c4:     	subps	%xmm3, %xmm4
1459055c7:     	movsldup	%xmm2, %xmm1            # xmm1 = xmm2[0,0,2,2]
1459055cb:     	mulps	%xmm4, %xmm1
1459055ce:     	addps	%xmm3, %xmm1
1459055d1:     	jmp	0x145905537 <.text+0x5904537>
1459055d6:     	xorl	%r14d, %r14d
1459055d9:     	movq	0xa0(%rbp), %rdx
1459055e0:     	testq	%rdx, %rdx
1459055e3:     	je	0x1459055f4 <.text+0x59045f4>
1459055e5:     	shlq	$0x3, %rdx
1459055e9:     	movl	$0x8, %r8d
1459055ef:     	callq	0x1400021d0 <.text+0x11d0>
1459055f4:     	movb	$0x1, %al
1459055f6:     	testb	%r14b, %r14b
1459055f9:     	je	0x145905664 <.text+0x5904664>
1459055fb:     	movq	0x378(%rbp), %rdx
145905602:     	movq	0x560(%rdx), %rcx
145905609:     	imulq	$0x160, 0x568(%rdx), %r8 # imm = 0x160
145905614:     	xorl	%edx, %edx
145905616:     	movq	%rcx, %r9
145905619:     	movzbl	0x2a0(%rbp), %r10d
145905621:     	nopw	%cs:(%rax,%rax)
145905630:     	cmpq	%rdx, %r8
145905633:     	je	0x145905664 <.text+0x5904664>
145905635:     	addq	$0x160, %rdx            # imm = 0x160
14590563c:     	cmpq	%rdi, 0x88(%r9)
145905643:     	leaq	0x160(%r9), %r9
14590564a:     	jne	0x145905630 <.text+0x5904630>
14590564c:     	cmpq	$-0x1, -0x148(%rcx,%rdx)
145905655:     	setne	%al
145905658:     	addb	%al, %al
14590565a:     	orb	-0x4(%rcx,%rdx), %al
14590565e:     	cmpb	%al, %r10b
145905661:     	setae	%al
145905664:     	movq	0x360(%rbp), %rcx
14590566b:     	cmpb	$0x0, 0x39(%rcx)
14590566f:     	je	0x145905695 <.text+0x5904695>
145905671:     	movl	0x370(%rbp), %eax
145905677:     	movb	%al, 0x387(%rbp)
14590567d:     	movq	0x378(%rbp), %rcx
145905684:     	movq	%r13, %rdx
145905687:     	callq	0x14594cdc0 <.text+0x594bdc0>
14590568c:     	nop
14590568d:     	movq	%rax, %r14
145905690:     	movq	%rdx, %rdi
145905693:     	jmp	0x14590569a <.text+0x590469a>
145905695:     	testb	%al, %sil
145905698:     	jne	0x1459056a7 <.text+0x59046a7>
14590569a:     	movq	%rdi, %rbx
14590569d:     	testb	$0x1, %r14b
1459056a1:     	je	0x1459057a3 <.text+0x59047a3>
1459056a7:     	movq	0x378(%rbp), %rcx
1459056ae:     	movq	0xd8(%rcx), %rdx
1459056b5:     	cmpq	%rdx, %r13
1459056b8:     	jae	0x14591184f <.text+0x591084f>
1459056be:     	movq	0xd0(%rcx), %rax
1459056c5:     	movq	%rbx, 0x28(%rax,%r15)
1459056ca:     	movq	0x560(%rcx), %rax
1459056d1:     	imulq	$0x160, 0x568(%rcx), %rdx # imm = 0x160
1459056dc:     	xorl	%ecx, %ecx
1459056de:     	movq	%rax, %r8
1459056e1:     	movq	0x360(%rbp), %rsi
1459056e8:     	nopl	(%rax,%rax)
1459056f0:     	cmpq	%rcx, %rdx
1459056f3:     	je	0x145904f97 <.text+0x5903f97>
1459056f9:     	addq	$0x160, %rcx            # imm = 0x160
145905700:     	cmpq	%rbx, 0x88(%r8)
145905707:     	leaq	0x160(%r8), %r8
14590570e:     	jne	0x1459056f0 <.text+0x59046f0>
145905710:     	movss	0x200(%rbp), %xmm0
145905718:     	movss	-0x38(%rax,%rcx), %xmm1
14590571e:     	ucomiss	%xmm1, %xmm9
145905722:     	jae	0x145905840 <.text+0x5904840>
145905728:     	movsldup	%xmm0, %xmm2            # xmm2 = xmm0[0,0,2,2]
14590572c:     	addps	0x5d246d(%rip), %xmm2   # 0x145ed7ba0
145905733:     	movss	-0x3c(%rax,%rcx), %xmm3
145905739:     	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
14590573d:     	subps	%xmm3, %xmm2
145905740:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
145905744:     	divps	%xmm1, %xmm2
145905747:     	xorps	%xmm1, %xmm1
14590574a:     	maxps	%xmm2, %xmm1
14590574d:     	movaps	0x46b54c(%rip), %xmm2   # 0x145d70ca0
145905754:     	cmpltps	%xmm1, %xmm2
145905758:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
14590575b:     	movmskpd	%xmm2, %edx
14590575f:     	movaps	%xmm8, %xmm2
145905763:     	testb	$0x2, %dl
145905766:     	jne	0x14590576c <.text+0x590476c>
145905768:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14590576c:     	movaps	%xmm8, %xmm3
145905770:     	testb	$0x1, %dl
145905773:     	jne	0x145905778 <.text+0x5904778>
145905775:     	movaps	%xmm1, %xmm3
145905778:     	movsd	-0x54(%rax,%rcx), %xmm4
14590577e:     	movsd	-0x48(%rax,%rcx), %xmm5
145905784:     	subps	%xmm4, %xmm5
145905787:     	movsldup	%xmm2, %xmm1            # xmm1 = xmm2[0,0,2,2]
14590578b:     	mulps	%xmm5, %xmm1
14590578e:     	addps	%xmm4, %xmm1
145905791:     	movsldup	%xmm3, %xmm12           # xmm12 = xmm3[0,0,2,2]
145905796:     	mulps	%xmm5, %xmm12
14590579a:     	addps	%xmm4, %xmm12
14590579e:     	jmp	0x14590584b <.text+0x590484b>
1459057a3:     	movq	0x378(%rbp), %rax
1459057aa:     	movq	0xd8(%rax), %rdx
1459057b1:     	cmpq	%rdx, %r13
1459057b4:     	jae	0x1459118e8 <.text+0x59108e8>
1459057ba:     	movq	0xd0(%rax), %rax
1459057c1:     	movq	$0x0, 0x28(%rax,%r15)
1459057ca:     	subps	%xmm12, %xmm10
1459057ce:     	mulps	%xmm10, %xmm10
1459057d2:     	movshdup	%xmm10, %xmm0           # xmm0 = xmm10[1,1,3,3]
1459057d7:     	addss	%xmm10, %xmm0
1459057dc:     	sqrtss	%xmm0, %xmm0
1459057e0:     	ucomiss	0x4956e5(%rip), %xmm0   # 0x145d9aecc
1459057e7:     	jbe	0x145904f97 <.text+0x5903f97>
1459057ed:     	movshdup	%xmm12, %xmm3           # xmm3 = xmm12[1,1,3,3]
1459057f2:     	movl	0x370(%rbp), %eax
1459057f8:     	movb	%al, 0x387(%rbp)
1459057fe:     	movss	0x318(%rbp), %xmm0
145905806:     	movss	%xmm0, 0x20(%rsp)
14590580c:     	movq	0x378(%rbp), %rcx
145905813:     	movq	%r13, %rdx
145905816:     	movaps	%xmm12, %xmm2
14590581a:     	callq	0x14592ea80 <.text+0x592da80>
14590581f:     	nop
145905820:     	jmp	0x145904f97 <.text+0x5903f97>
145905825:     	movl	$0x1, %r14d
14590582b:     	movq	0xa0(%rbp), %rdx
145905832:     	testq	%rdx, %rdx
145905835:     	jne	0x1459055e5 <.text+0x59045e5>
14590583b:     	jmp	0x1459055f4 <.text+0x59045f4>
145905840:     	movsd	-0x48(%rax,%rcx), %xmm12
145905847:     	movaps	%xmm12, %xmm1
14590584b:     	movaps	%xmm10, %xmm2
14590584f:     	subps	%xmm1, %xmm2
145905852:     	mulps	%xmm2, %xmm2
145905855:     	movshdup	%xmm2, %xmm1            # xmm1 = xmm2[1,1,3,3]
145905859:     	addss	%xmm2, %xmm1
14590585d:     	sqrtss	%xmm1, %xmm1
145905861:     	movss	0x7984db(%rip), %xmm2   # 0x14609dd44
145905869:     	ucomiss	%xmm1, %xmm2
14590586c:     	jb	0x14590762b <.text+0x590662b>
145905872:     	movq	0x378(%rbp), %rax
145905879:     	movq	0xd8(%rax), %rdx
145905880:     	cmpq	%rdx, %r13
145905883:     	jae	0x1459119a0 <.text+0x59109a0>
145905889:     	movq	0xd0(%rax), %rax
145905890:     	ucomiss	0x60(%rax,%r15), %xmm0
145905896:     	jb	0x14590762b <.text+0x590662b>
14590589c:     	movl	0x370(%rbp), %eax
1459058a2:     	movb	%al, 0x387(%rbp)
1459058a8:     	movq	0x378(%rbp), %rcx
1459058af:     	movq	%r13, %rdx
1459058b2:     	movq	%rbx, %r8
1459058b5:     	callq	0x14594e0f0 <.text+0x594d0f0>
1459058ba:     	nop
1459058bb:     	movq	0x378(%rbp), %rcx
1459058c2:     	movq	0xd8(%rcx), %rdx
1459058c9:     	cmpq	%rdx, %r13
1459058cc:     	jae	0x1459119c1 <.text+0x59109c1>
1459058d2:     	addss	0x200(%rbp), %xmm0
1459058da:     	movq	0xd0(%rcx), %rax
1459058e1:     	movss	%xmm0, 0x60(%rax,%r15)
1459058e8:     	movq	0xd8(%rcx), %rdx
1459058ef:     	cmpq	%rdx, %r13
1459058f2:     	jae	0x1459119e2 <.text+0x59109e2>
1459058f8:     	movq	0xd0(%rcx), %rax
1459058ff:     	movq	0x18(%rax,%r15), %rdi
145905904:     	movzbl	0x39(%rdi), %ecx
145905908:     	leal	-0x2(%rcx), %edx
14590590b:     	cmpl	$0x2, %edx
14590590e:     	jb	0x14590628d <.text+0x590528d>
145905914:     	testl	%ecx, %ecx
145905916:     	je	0x1459063ec <.text+0x59053ec>
14590591c:     	movq	%rdi, %rsi
14590591f:     	cmpl	$0x5, %ecx
145905922:     	jne	0x1459064ad <.text+0x59054ad>
145905928:     	movq	$-0x2, %r14
14590592f:     	jmp	0x145906296 <.text+0x5905296>
145905934:     	movl	0x370(%rbp), %eax
14590593a:     	movb	%al, 0x387(%rbp)
145905940:     	movq	0x378(%rbp), %rcx
145905947:     	movq	%r13, %rdx
14590594a:     	movq	%rbx, %r8
14590594d:     	xorl	%r9d, %r9d
145905950:     	callq	0x14594ff00 <.text+0x594ef00>
145905955:     	nop
145905956:     	movq	0x378(%rbp), %rax
14590595d:     	movq	0x780(%rax), %rdx
145905964:     	testq	%rdx, %rdx
145905967:     	je	0x145906c8c <.text+0x5905c8c>
14590596d:     	movq	0x378(%rbp), %rax
145905974:     	movq	0x778(%rax), %rax
14590597b:     	cmpq	$0x1, %rdx
14590597f:     	jne	0x145905f11 <.text+0x5904f11>
145905985:     	xorl	%ecx, %ecx
145905987:     	movss	0x46b2e1(%rip), %xmm0   # 0x145d70c70
14590598f:     	jmp	0x145905f56 <.text+0x5904f56>
145905994:     	movq	0x80(%rbp), %rcx
14590599b:     	movss	(%rcx), %xmm10
1459059a0:     	movss	0x5c(%rax), %xmm0
1459059a5:     	ucomiss	%xmm0, %xmm9
1459059a9:     	jae	0x145905a5a <.text+0x5904a5a>
1459059af:     	movaps	%xmm10, %xmm1
1459059b3:     	subss	0x58(%rax), %xmm1
1459059b8:     	divss	%xmm0, %xmm1
1459059bc:     	xorps	%xmm0, %xmm0
1459059bf:     	maxss	%xmm1, %xmm0
1459059c3:     	movaps	%xmm8, %xmm1
1459059c7:     	minss	%xmm0, %xmm1
1459059cb:     	movss	0x48(%rax), %xmm0
1459059d0:     	movss	0x54(%rax), %xmm2
1459059d5:     	subss	%xmm0, %xmm2
1459059d9:     	mulss	%xmm1, %xmm2
1459059dd:     	addss	%xmm0, %xmm2
1459059e1:     	movsd	0x40(%rax), %xmm0
1459059e6:     	movsd	0x4c(%rax), %xmm3
1459059eb:     	subps	%xmm0, %xmm3
1459059ee:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
1459059f2:     	mulps	%xmm3, %xmm1
1459059f5:     	addps	%xmm0, %xmm1
1459059f8:     	movlps	%xmm1, 0x2e0(%rbp)
1459059ff:     	movss	%xmm2, 0x2e8(%rbp)
145905a07:     	jmp	0x145905a6e <.text+0x5904a6e>
145905a09:     	movq	0x80(%rbp), %rcx
145905a10:     	movss	(%rcx), %xmm2
145905a14:     	movss	0x5c(%rax), %xmm0
145905a19:     	ucomiss	%xmm0, %xmm9
145905a1d:     	jae	0x145905ab0 <.text+0x5904ab0>
145905a23:     	movaps	%xmm2, %xmm1
145905a26:     	subss	0x58(%rax), %xmm1
145905a2b:     	divss	%xmm0, %xmm1
145905a2f:     	xorps	%xmm0, %xmm0
145905a32:     	maxss	%xmm1, %xmm0
145905a36:     	movaps	%xmm8, %xmm1
145905a3a:     	minss	%xmm0, %xmm1
145905a3e:     	movsd	0x40(%rax), %xmm0
145905a43:     	movsd	0x4c(%rax), %xmm3
145905a48:     	subps	%xmm0, %xmm3
145905a4b:     	movsldup	%xmm1, %xmm10           # xmm10 = xmm1[0,0,2,2]
145905a50:     	mulps	%xmm3, %xmm10
145905a54:     	addps	%xmm0, %xmm10
145905a58:     	jmp	0x145905ab6 <.text+0x5904ab6>
145905a5a:     	movl	0x54(%rax), %ecx
145905a5d:     	movl	%ecx, 0x2e8(%rbp)
145905a63:     	movq	0x4c(%rax), %rax
145905a67:     	movq	%rax, 0x2e0(%rbp)
145905a6e:     	movq	0x378(%rbp), %rax
145905a75:     	movq	0x138(%rax), %rdi
145905a7c:     	testq	%rdi, %rdi
145905a7f:     	je	0x145905c9a <.text+0x5904c9a>
145905a85:     	movq	0x130(%rax), %rax
145905a8c:     	xorl	%edx, %edx
145905a8e:     	nop
145905a90:     	movaps	%xmm10, %xmm0
145905a94:     	subss	(%rax,%rdx,4), %xmm0
145905a99:     	ucomiss	%xmm0, %xmm8
145905a9d:     	jbe	0x145906ed7 <.text+0x5905ed7>
145905aa3:     	incq	%rdx
145905aa6:     	cmpq	%rdx, %rdi
145905aa9:     	jne	0x145905a90 <.text+0x5904a90>
145905aab:     	jmp	0x145905c9c <.text+0x5904c9c>
145905ab0:     	movsd	0x4c(%rax), %xmm10
145905ab6:     	movq	0x20(%rax), %rdi
145905aba:     	movq	0x378(%rbp), %rcx
145905ac1:     	movq	0x560(%rcx), %rax
145905ac8:     	movq	$-0x160, %rdx           # imm = 0xFEA0
145905acf:     	addq	%rdx, %rax
145905ad2:     	imulq	$0x160, 0x568(%rcx), %rcx # imm = 0x160
145905add:     	nopl	(%rax)
145905ae0:     	testq	%rcx, %rcx
145905ae3:     	je	0x145906c8c <.text+0x5905c8c>
145905ae9:     	leaq	0x160(%rax), %rdx
145905af0:     	addq	$-0x160, %rcx           # imm = 0xFEA0
145905af7:     	cmpq	%rbx, 0x1e8(%rax)
145905afe:     	movq	%rdx, %rax
145905b01:     	jne	0x145905ae0 <.text+0x5904ae0>
145905b03:     	leaq	0xa0(%rbp), %rsi
145905b0a:     	movq	%rsi, %rcx
145905b0d:     	callq	0x1458dfae0 <.text+0x58deae0>
145905b12:     	movss	0xa0(%rbp), %xmm12
145905b1b:     	movss	0xa4(%rbp), %xmm13
145905b24:     	movl	0x34(%r14), %r8d
145905b28:     	movq	%rbx, 0x210(%rbp)
145905b2f:     	movq	%rbx, 0x238(%rbp)
145905b36:     	movl	$0x0, 0x230(%rbp)
145905b40:     	movl	$0x0, 0x2e0(%rbp)
145905b4a:     	movl	0x370(%rbp), %eax
145905b50:     	movb	%al, 0x387(%rbp)
145905b56:     	leaq	0x2e0(%rbp), %rax
145905b5d:     	movq	%rax, 0x30(%rsp)
145905b62:     	leaq	0x230(%rbp), %rax
145905b69:     	movq	%rax, 0x28(%rsp)
145905b6e:     	movq	$0x1, 0x20(%rsp)
145905b77:     	movq	%rsi, %rcx
145905b7a:     	movq	%rdi, %rdx
145905b7d:     	leaq	0x210(%rbp), %r9
145905b84:     	callq	0x1458b5100 <.text+0x58b4100>
145905b89:     	nop
145905b8a:     	movss	%xmm12, 0x360(%rbp)
145905b93:     	movq	0x378(%rbp), %rax
145905b9a:     	movq	0x5e0(%rax), %rsi
145905ba1:     	cmpq	0x5d0(%rax), %rsi
145905ba8:     	jne	0x145905bb4 <.text+0x5904bb4>
145905baa:     	movq	0x60(%rbp), %rcx
145905bae:     	callq	0x145bcb530 <.text+0x5bca530>
145905bb3:     	nop
145905bb4:     	movq	0x378(%rbp), %r11
145905bbb:     	movq	0x5d8(%r11), %rax
145905bc2:     	movq	%rsi, %rcx
145905bc5:     	shlq	$0x5, %rcx
145905bc9:     	movups	0xa0(%rbp), %xmm0
145905bd0:     	movups	0xb0(%rbp), %xmm1
145905bd7:     	movups	%xmm1, 0x10(%rax,%rcx)
145905bdc:     	movups	%xmm0, (%rax,%rcx)
145905be0:     	incq	%rsi
145905be3:     	movq	%rsi, 0x5e0(%r11)
145905bea:     	movss	0x2c(%r14), %xmm5
145905bf0:     	movq	0x958(%r11), %rax
145905bf7:     	movq	0x970(%r11), %rcx
145905bfe:     	leaq	(%rcx,%rax), %rdx
145905c02:     	rolq	$0x17, %rdx
145905c06:     	addq	%rax, %rdx
145905c09:     	movq	0x960(%r11), %r8
145905c10:     	movq	%r8, %r9
145905c13:     	shlq	$0x11, %r9
145905c17:     	movq	0x968(%r11), %r10
145905c1e:     	xorq	%rax, %r10
145905c21:     	xorq	%r8, %rcx
145905c24:     	xorq	%r10, %r8
145905c27:     	movq	%r8, 0x960(%r11)
145905c2e:     	xorq	%rcx, %rax
145905c31:     	movq	%rax, 0x958(%r11)
145905c38:     	xorq	%r9, %r10
145905c3b:     	movq	%r10, 0x968(%r11)
145905c42:     	rolq	$0x2d, %rcx
145905c46:     	movq	%rcx, 0x970(%r11)
145905c4d:     	shrq	$0x28, %rdx
145905c51:     	xorps	%xmm12, %xmm12
145905c55:     	cvtsi2ss	%edx, %xmm12
145905c5a:     	mulss	0x547191(%rip), %xmm12  # 0x145e4cdf4
145905c63:     	movq	0x780(%r11), %rdx
145905c6a:     	movaps	%xmm8, %xmm0
145905c6e:     	testq	%rdx, %rdx
145905c71:     	movq	%rdi, %rsi
145905c74:     	je	0x1459062fb <.text+0x59052fb>
145905c7a:     	movq	0x778(%r11), %rax
145905c81:     	cmpq	$0x1, %rdx
145905c85:     	jne	0x14590629e <.text+0x590529e>
145905c8b:     	xorl	%ecx, %ecx
145905c8d:     	movss	0x46afdb(%rip), %xmm0   # 0x145d70c70
145905c95:     	jmp	0x1459062e3 <.text+0x59052e3>
145905c9a:     	xorl	%edi, %edi
145905c9c:     	movq	%rbx, 0x210(%rbp)
145905ca3:     	movl	0x370(%rbp), %eax
145905ca9:     	movb	%al, 0x387(%rbp)
145905caf:     	leaq	0x210(%rbp), %rax
145905cb6:     	movq	%rax, 0x20(%rsp)
145905cbb:     	movq	$0x1, 0x28(%rsp)
145905cc4:     	leaq	0xa0(%rbp), %rcx
145905ccb:     	movq	0x378(%rbp), %rdx
145905cd2:     	leaq	0x2e0(%rbp), %r8
145905cd9:     	movss	0x46af4f(%rip), %xmm3   # 0x145d70c30
145905ce1:     	callq	0x145925c80 <.text+0x5924c80>
145905ce6:     	nop
145905ce7:     	movl	$0x18, %eax
145905cec:     	subq	%rdi, %rax
145905cef:     	movl	$0x0, %ecx
145905cf4:     	cmovaeq	%rax, %rcx
145905cf8:     	movq	0xa0(%rbp), %rax
145905cff:     	movq	0xa8(%rbp), %rdx
145905d06:     	movq	0xb0(%rbp), %r8
145905d0d:     	leaq	(%rdx,%r8,8), %r8
145905d11:     	movq	%rdx, 0xa0(%rbp)
145905d18:     	movq	%rdx, 0xa8(%rbp)
145905d1f:     	movq	%rax, 0xb0(%rbp)
145905d26:     	movq	%r8, 0xb8(%rbp)
145905d2d:     	movq	0x330(%rbp), %rax
145905d34:     	movq	%rax, 0xc0(%rbp)
145905d3b:     	movq	%rcx, 0xc8(%rbp)
145905d42:     	movl	0x370(%rbp), %eax
145905d48:     	movb	%al, 0x387(%rbp)
145905d4e:     	leaq	0x230(%rbp), %rcx
145905d55:     	leaq	0xa0(%rbp), %rdx
145905d5c:     	callq	0x1459ac3e0 <.text+0x59ab3e0>
145905d61:     	nop
145905d62:     	movq	0x238(%rbp), %r14
145905d69:     	movq	0x240(%rbp), %rax
145905d70:     	leaq	(,%rax,8), %rcx
145905d78:     	movq	%rcx, 0x88(%rbp)
145905d7f:     	movq	%rax, 0x360(%rbp)
145905d86:     	leaq	(%r14,%rax,8), %rdi
145905d8a:     	movq	%r14, 0x2a0(%rbp)
145905d91:     	jmp	0x145905dc2 <.text+0x5904dc2>
145905d93:     	nopw	%cs:(%rax,%rax)
145905da0:     	addq	$0x8, %r14
145905da4:     	movq	0x378(%rbp), %rcx
145905dab:     	movq	0x130(%rcx), %rax
145905db2:     	movss	%xmm10, (%rax,%rsi,4)
145905db8:     	incq	%rsi
145905dbb:     	movq	%rsi, 0x138(%rcx)
145905dc2:     	cmpq	%rdi, %r14
145905dc5:     	je	0x145905df4 <.text+0x5904df4>
145905dc7:     	movq	0x378(%rbp), %rax
145905dce:     	movq	0x138(%rax), %rsi
145905dd5:     	cmpq	0x128(%rax), %rsi
145905ddc:     	jne	0x145905da0 <.text+0x5904da0>
145905dde:     	movb	$0x1, 0x326(%rbp)
145905de5:     	movq	0x348(%rbp), %rcx
145905dec:     	callq	0x145bcdda0 <.text+0x5bccda0>
145905df1:     	nop
145905df2:     	jmp	0x145905da0 <.text+0x5904da0>
145905df4:     	callq	0x140002200 <.text+0x1200>
145905df9:     	movl	$0x8, %ecx
145905dfe:     	movl	$0x8, %edx
145905e03:     	callq	0x1400021c0 <.text+0x11c0>
145905e08:     	testq	%rax, %rax
145905e0b:     	je	0x145911411 <.text+0x5910411>
145905e11:     	movq	%rax, %r14
145905e14:     	movq	%rbx, (%rax)
145905e17:     	movq	$0x1, 0xa0(%rbp)
145905e22:     	movq	%rax, 0xa8(%rbp)
145905e29:     	movq	$0x1, 0xb0(%rbp)
145905e34:     	movq	0x230(%rbp), %rdx
145905e3b:     	movl	$0x1, %edi
145905e40:     	movq	0x360(%rbp), %rsi
145905e47:     	testq	%rsi, %rsi
145905e4a:     	jne	0x145907783 <.text+0x5906783>
145905e50:     	testq	%rdx, %rdx
145905e53:     	je	0x145905e6b <.text+0x5904e6b>
145905e55:     	shlq	$0x3, %rdx
145905e59:     	movl	$0x8, %r8d
145905e5f:     	movq	0x2a0(%rbp), %rcx
145905e66:     	callq	0x1400021d0 <.text+0x11d0>
145905e6b:     	addq	%rsi, %rdi
145905e6e:     	movq	0xa0(%rbp), %rax
145905e75:     	movq	%rax, 0x2a0(%rbp)
145905e7c:     	leaq	0x1574c85(%rip), %rax   # 0x146e7ab08
145905e83:     	movq	%rax, 0xa0(%rbp)
145905e8a:     	movq	$0x8, 0xa8(%rbp)
145905e95:     	movq	$0x0, 0xb0(%rbp)
145905ea0:     	movb	$0x0, 0xc8(%rbp)
145905ea7:     	leaq	0xa0(%rbp), %rax
145905eae:     	movq	%rax, 0x20(%rsp)
145905eb3:     	movq	0x378(%rbp), %rsi
145905eba:     	movq	%rsi, %rcx
145905ebd:     	movq	%r13, %rdx
145905ec0:     	movq	%r14, 0x360(%rbp)
145905ec7:     	movq	%r14, %r8
145905eca:     	movq	%rdi, %r9
145905ecd:     	callq	0x145950ce0 <.text+0x594fce0>
145905ed2:     	nop
145905ed3:     	movq	0x780(%rsi), %rdx
145905eda:     	testq	%rdx, %rdx
145905edd:     	movq	0x360(%rbp), %rsi
145905ee4:     	je	0x145906266 <.text+0x5905266>
145905eea:     	movq	0x378(%rbp), %rax
145905ef1:     	movq	0x778(%rax), %rax
145905ef8:     	cmpq	$0x1, %rdx
145905efc:     	jne	0x14590613d <.text+0x590513d>
145905f02:     	xorl	%ecx, %ecx
145905f04:     	movss	0x46ad64(%rip), %xmm0   # 0x145d70c70
145905f0c:     	jmp	0x145906182 <.text+0x5905182>
145905f11:     	movq	%rdx, %r8
145905f14:     	andq	$-0x2, %r8
145905f18:     	xorl	%ecx, %ecx
145905f1a:     	movss	0x46ad4e(%rip), %xmm0   # 0x145d70c70
145905f22:     	jmp	0x145905f2d <.text+0x5904f2d>
145905f24:     	addq	$0x2, %rcx
145905f28:     	cmpq	%rcx, %r8
145905f2b:     	je	0x145905f51 <.text+0x5904f51>
145905f2d:     	cmpb	$0x1f, (%rax,%rcx,8)
145905f31:     	je	0x145905f3c <.text+0x5904f3c>
145905f33:     	cmpb	$0x1f, 0x8(%rax,%rcx,8)
145905f38:     	jne	0x145905f24 <.text+0x5904f24>
145905f3a:     	jmp	0x145905f49 <.text+0x5904f49>
145905f3c:     	addss	0x4(%rax,%rcx,8), %xmm0
145905f42:     	cmpb	$0x1f, 0x8(%rax,%rcx,8)
145905f47:     	jne	0x145905f24 <.text+0x5904f24>
145905f49:     	addss	0xc(%rax,%rcx,8), %xmm0
145905f4f:     	jmp	0x145905f24 <.text+0x5904f24>
145905f51:     	testb	$0x1, %dl
145905f54:     	je	0x145905f62 <.text+0x5904f62>
145905f56:     	cmpb	$0x1f, (%rax,%rcx,8)
145905f5a:     	jne	0x145905f62 <.text+0x5904f62>
145905f5c:     	addss	0x4(%rax,%rcx,8), %xmm0
145905f62:     	ucomiss	%xmm9, %xmm0
145905f66:     	jbe	0x145906c8c <.text+0x5905c8c>
145905f6c:     	movq	0x378(%rbp), %r11
145905f73:     	movq	0x970(%r11), %rax
145905f7a:     	movq	0x958(%r11), %rcx
145905f81:     	movq	0x960(%r11), %rdx
145905f88:     	leaq	(%rax,%rcx), %r8
145905f8c:     	rolq	$0x17, %r8
145905f90:     	addq	%rcx, %r8
145905f93:     	movq	%rdx, %r9
145905f96:     	shlq	$0x11, %r9
145905f9a:     	movq	0x968(%r11), %r10
145905fa1:     	xorq	%rcx, %r10
145905fa4:     	xorq	%rdx, %rax
145905fa7:     	xorq	%r10, %rdx
145905faa:     	movq	%rdx, 0x960(%r11)
145905fb1:     	xorq	%rax, %rcx
145905fb4:     	movq	%rcx, 0x958(%r11)
145905fbb:     	xorq	%r9, %r10
145905fbe:     	movq	%r10, 0x968(%r11)
145905fc5:     	rolq	$0x2d, %rax
145905fc9:     	shrq	$0x28, %r8
145905fcd:     	cvtsi2ss	%r8d, %xmm1
145905fd2:     	movq	%rax, 0x970(%r11)
145905fd9:     	mulss	0x546e13(%rip), %xmm1   # 0x145e4cdf4
145905fe1:     	ucomiss	%xmm1, %xmm0
145905fe4:     	jbe	0x145906c8c <.text+0x5905c8c>
145905fea:     	movl	0x370(%rbp), %eax
145905ff0:     	movb	%al, 0x387(%rbp)
145905ff6:     	movq	0x378(%rbp), %rcx
145905ffd:     	movq	%r13, %rdx
145906000:     	movq	%rbx, %r8
145906003:     	movb	$0x1, %r9b
145906006:     	callq	0x14594ff00 <.text+0x594ef00>
14590600b:     	nop
14590600c:     	jmp	0x145906c8c <.text+0x5905c8c>
145906011:     	movq	%rdx, %r8
145906014:     	andq	$-0x2, %r8
145906018:     	xorl	%ecx, %ecx
14590601a:     	movss	0x46ac4e(%rip), %xmm0   # 0x145d70c70
145906022:     	jmp	0x14590602d <.text+0x590502d>
145906024:     	addq	$0x2, %rcx
145906028:     	cmpq	%rcx, %r8
14590602b:     	je	0x145906051 <.text+0x5905051>
14590602d:     	cmpb	$0x1f, (%rax,%rcx,8)
145906031:     	je	0x14590603c <.text+0x590503c>
145906033:     	cmpb	$0x1f, 0x8(%rax,%rcx,8)
145906038:     	jne	0x145906024 <.text+0x5905024>
14590603a:     	jmp	0x145906049 <.text+0x5905049>
14590603c:     	addss	0x4(%rax,%rcx,8), %xmm0
145906042:     	cmpb	$0x1f, 0x8(%rax,%rcx,8)
145906047:     	jne	0x145906024 <.text+0x5905024>
145906049:     	addss	0xc(%rax,%rcx,8), %xmm0
14590604f:     	jmp	0x145906024 <.text+0x5905024>
145906051:     	testb	$0x1, %dl
145906054:     	je	0x145906062 <.text+0x5905062>
145906056:     	cmpb	$0x1f, (%rax,%rcx,8)
14590605a:     	jne	0x145906062 <.text+0x5905062>
14590605c:     	addss	0x4(%rax,%rcx,8), %xmm0
145906062:     	ucomiss	%xmm9, %xmm0
145906066:     	jbe	0x145906c8c <.text+0x5905c8c>
14590606c:     	movq	0x378(%rbp), %r11
145906073:     	movq	0x970(%r11), %rax
14590607a:     	movq	0x958(%r11), %rcx
145906081:     	movq	0x960(%r11), %rdx
145906088:     	leaq	(%rax,%rcx), %r8
14590608c:     	rolq	$0x17, %r8
145906090:     	addq	%rcx, %r8
145906093:     	movq	%rdx, %r9
145906096:     	shlq	$0x11, %r9
14590609a:     	movq	0x968(%r11), %r10
1459060a1:     	xorq	%rcx, %r10
1459060a4:     	xorq	%rdx, %rax
1459060a7:     	xorq	%r10, %rdx
1459060aa:     	movq	%rdx, 0x960(%r11)
1459060b1:     	xorq	%rax, %rcx
1459060b4:     	movq	%rcx, 0x958(%r11)
1459060bb:     	xorq	%r9, %r10
1459060be:     	movq	%r10, 0x968(%r11)
1459060c5:     	rolq	$0x2d, %rax
1459060c9:     	shrq	$0x28, %r8
1459060cd:     	cvtsi2ss	%r8d, %xmm1
1459060d2:     	movq	%rax, 0x970(%r11)
1459060d9:     	mulss	0x546d13(%rip), %xmm1   # 0x145e4cdf4
1459060e1:     	ucomiss	%xmm1, %xmm0
1459060e4:     	jbe	0x145906c8c <.text+0x5905c8c>
1459060ea:     	leaq	0x15747ce(%rip), %rax   # 0x146e7a8bf
1459060f1:     	movq	%rax, 0xa0(%rbp)
1459060f8:     	movq	$0xe, 0xa8(%rbp)
145906103:     	movq	$0x0, 0xb0(%rbp)
14590610e:     	movb	$0x0, 0xc8(%rbp)
145906115:     	movl	0x370(%rbp), %eax
14590611b:     	movb	%al, 0x387(%rbp)
145906121:     	movq	0x378(%rbp), %rcx
145906128:     	movq	%r13, %rdx
14590612b:     	leaq	0xa0(%rbp), %r8
145906132:     	callq	0x145951440 <.text+0x5950440>
145906137:     	nop
145906138:     	jmp	0x145906c8c <.text+0x5905c8c>
14590613d:     	movq	%rdx, %r8
145906140:     	andq	$-0x2, %r8
145906144:     	xorl	%ecx, %ecx
145906146:     	movss	0x46ab22(%rip), %xmm0   # 0x145d70c70
14590614e:     	jmp	0x145906159 <.text+0x5905159>
145906150:     	addq	$0x2, %rcx
145906154:     	cmpq	%rcx, %r8
145906157:     	je	0x14590617d <.text+0x590517d>
145906159:     	cmpb	$0x1f, (%rax,%rcx,8)
14590615d:     	je	0x145906168 <.text+0x5905168>
14590615f:     	cmpb	$0x1f, 0x8(%rax,%rcx,8)
145906164:     	jne	0x145906150 <.text+0x5905150>
145906166:     	jmp	0x145906175 <.text+0x5905175>
145906168:     	addss	0x4(%rax,%rcx,8), %xmm0
14590616e:     	cmpb	$0x1f, 0x8(%rax,%rcx,8)
145906173:     	jne	0x145906150 <.text+0x5905150>
145906175:     	addss	0xc(%rax,%rcx,8), %xmm0
14590617b:     	jmp	0x145906150 <.text+0x5905150>
14590617d:     	testb	$0x1, %dl
145906180:     	je	0x14590618e <.text+0x590518e>
145906182:     	cmpb	$0x1f, (%rax,%rcx,8)
145906186:     	jne	0x14590618e <.text+0x590518e>
145906188:     	addss	0x4(%rax,%rcx,8), %xmm0
14590618e:     	ucomiss	%xmm9, %xmm0
145906192:     	jbe	0x145906266 <.text+0x5905266>
145906198:     	movq	0x378(%rbp), %r11
14590619f:     	movq	0x970(%r11), %rax
1459061a6:     	movq	0x958(%r11), %rcx
1459061ad:     	movq	0x960(%r11), %rdx
1459061b4:     	leaq	(%rax,%rcx), %r8
1459061b8:     	rolq	$0x17, %r8
1459061bc:     	addq	%rcx, %r8
1459061bf:     	movq	%rdx, %r9
1459061c2:     	shlq	$0x11, %r9
1459061c6:     	movq	0x968(%r11), %r10
1459061cd:     	xorq	%rcx, %r10
1459061d0:     	xorq	%rdx, %rax
1459061d3:     	xorq	%r10, %rdx
1459061d6:     	movq	%rdx, 0x960(%r11)
1459061dd:     	xorq	%rax, %rcx
1459061e0:     	movq	%rcx, 0x958(%r11)
1459061e7:     	xorq	%r9, %r10
1459061ea:     	movq	%r10, 0x968(%r11)
1459061f1:     	rolq	$0x2d, %rax
1459061f5:     	shrq	$0x28, %r8
1459061f9:     	cvtsi2ss	%r8d, %xmm1
1459061fe:     	movq	%rax, 0x970(%r11)
145906205:     	mulss	0x546be7(%rip), %xmm1   # 0x145e4cdf4
14590620d:     	ucomiss	%xmm1, %xmm0
145906210:     	jbe	0x145906266 <.text+0x5905266>
145906212:     	leaq	0x15746a6(%rip), %rax   # 0x146e7a8bf
145906219:     	movq	%rax, 0xa0(%rbp)
145906220:     	movq	$0xe, 0xa8(%rbp)
14590622b:     	movq	$0x0, 0xb0(%rbp)
145906236:     	movb	$0x0, 0xc8(%rbp)
14590623d:     	leaq	0xa0(%rbp), %rax
145906244:     	movq	%rax, 0x20(%rsp)
145906249:     	movq	0x378(%rbp), %rcx
145906250:     	movq	%r13, %rdx
145906253:     	movq	%rsi, %r8
145906256:     	movq	%rdi, %r9
145906259:     	callq	0x145950ce0 <.text+0x594fce0>
14590625e:     	nop
14590625f:     	movq	0x360(%rbp), %rsi
145906266:     	movq	0x2a0(%rbp), %rdx
14590626d:     	testq	%rdx, %rdx
145906270:     	je	0x145906c8c <.text+0x5905c8c>
145906276:     	shlq	$0x3, %rdx
14590627a:     	movl	$0x8, %r8d
145906280:     	movq	%rsi, %rcx
145906283:     	callq	0x1400021d0 <.text+0x11d0>
145906288:     	jmp	0x145906c8c <.text+0x5905c8c>
14590628d:     	movq	%rdi, %rsi
145906290:     	movl	$0x1, %r14d
145906296:     	movb	$0x1, %dil
145906299:     	jmp	0x1459064b2 <.text+0x59054b2>
14590629e:     	movq	%rdx, %r8
1459062a1:     	andq	$-0x2, %r8
1459062a5:     	xorl	%ecx, %ecx
1459062a7:     	movss	0x46a9c1(%rip), %xmm0   # 0x145d70c70
1459062af:     	jmp	0x1459062ba <.text+0x59052ba>
1459062b1:     	addq	$0x2, %rcx
1459062b5:     	cmpq	%rcx, %r8
1459062b8:     	je	0x1459062de <.text+0x59052de>
1459062ba:     	cmpb	$0x11, (%rax,%rcx,8)
1459062be:     	je	0x1459062c9 <.text+0x59052c9>
1459062c0:     	cmpb	$0x11, 0x8(%rax,%rcx,8)
1459062c5:     	jne	0x1459062b1 <.text+0x59052b1>
1459062c7:     	jmp	0x1459062d6 <.text+0x59052d6>
1459062c9:     	addss	0x4(%rax,%rcx,8), %xmm0
1459062cf:     	cmpb	$0x11, 0x8(%rax,%rcx,8)
1459062d4:     	jne	0x1459062b1 <.text+0x59052b1>
1459062d6:     	addss	0xc(%rax,%rcx,8), %xmm0
1459062dc:     	jmp	0x1459062b1 <.text+0x59052b1>
1459062de:     	testb	$0x1, %dl
1459062e1:     	je	0x1459062ef <.text+0x59052ef>
1459062e3:     	cmpb	$0x11, (%rax,%rcx,8)
1459062e7:     	jne	0x1459062ef <.text+0x59052ef>
1459062e9:     	addss	0x4(%rax,%rcx,8), %xmm0
1459062ef:     	addss	%xmm8, %xmm0
1459062f4:     	movq	0x378(%rbp), %r11
1459062fb:     	movaps	%xmm13, %xmm2
1459062ff:     	movl	0x4d8(%r11), %eax
145906306:     	xorps	%xmm1, %xmm1
145906309:     	cvtsi2ss	%rax, %xmm1
14590630e:     	movss	0x484(%r11), %xmm13
145906317:     	addss	0x46d9f5(%rip), %xmm1   # 0x145d73d14
14590631f:     	mulss	0x4afbcd(%rip), %xmm1   # 0x145db5ef4
145906327:     	addss	%xmm8, %xmm1
14590632c:     	mulss	%xmm1, %xmm5
145906330:     	mulss	0x47c(%r11), %xmm5
145906339:     	mulss	%xmm0, %xmm5
14590633d:     	movss	0x488(%r11), %xmm14
145906346:     	mulss	%xmm5, %xmm14
14590634b:     	movl	0x34(%r14), %r8d
14590634f:     	cmpl	$0x13fb, %r8d           # imm = 0x13FB
145906356:     	jle	0x1459063a2 <.text+0x59053a2>
145906358:     	cmpl	$0x1c64, %r8d           # imm = 0x1C64
14590635f:     	jg	0x1459066b6 <.text+0x59056b6>
145906365:     	cmpl	$0x1a84, %r8d           # imm = 0x1A84
14590636c:     	jg	0x1459068b2 <.text+0x59058b2>
145906372:     	cmpl	$0x13fc, %r8d           # imm = 0x13FC
145906379:     	je	0x145906b28 <.text+0x5905b28>
14590637f:     	cmpl	$0x1438, %r8d           # imm = 0x1438
145906386:     	je	0x145906953 <.text+0x5905953>
14590638c:     	movaps	%xmm8, %xmm0
145906390:     	cmpl	$0x18d1, %r8d           # imm = 0x18D1
145906397:     	je	0x1459068e6 <.text+0x59058e6>
14590639d:     	jmp	0x145906b30 <.text+0x5905b30>
1459063a2:     	cmpl	$0x5e5, %r8d            # imm = 0x5E5
1459063a9:     	jle	0x1459066f3 <.text+0x59056f3>
1459063af:     	cmpl	$0xafb, %r8d            # imm = 0xAFB
1459063b6:     	jg	0x14590691f <.text+0x590591f>
1459063bc:     	cmpl	$0x5e6, %r8d            # imm = 0x5E6
1459063c3:     	je	0x1459068d9 <.text+0x59058d9>
1459063c9:     	cmpl	$0x7ba, %r8d            # imm = 0x7BA
1459063d0:     	je	0x145906b28 <.text+0x5905b28>
1459063d6:     	movaps	%xmm8, %xmm0
1459063da:     	cmpl	$0xa53, %r8d            # imm = 0xA53
1459063e1:     	je	0x1459068d9 <.text+0x59058d9>
1459063e7:     	jmp	0x145906b30 <.text+0x5905b30>
1459063ec:     	addq	%r15, %rax
1459063ef:     	movq	0x20(%rax), %rdx
1459063f3:     	movss	0x2c(%rdi), %xmm13
1459063f9:     	movq	0x378(%rbp), %rsi
145906400:     	movq	0x958(%rsi), %rax
145906407:     	movq	0x970(%rsi), %rcx
14590640e:     	leaq	(%rcx,%rax), %r8
145906412:     	rolq	$0x17, %r8
145906416:     	addq	%rax, %r8
145906419:     	movq	0x960(%rsi), %r9
145906420:     	movq	%r9, %r10
145906423:     	shlq	$0x11, %r10
145906427:     	movq	0x968(%rsi), %r11
14590642e:     	xorq	%rax, %r11
145906431:     	xorq	%r9, %rcx
145906434:     	xorq	%r11, %r9
145906437:     	movq	%r9, 0x960(%rsi)
14590643e:     	xorq	%rcx, %rax
145906441:     	movq	%rax, 0x958(%rsi)
145906448:     	xorq	%r10, %r11
14590644b:     	movq	%r11, 0x968(%rsi)
145906452:     	rolq	$0x2d, %rcx
145906456:     	movq	%rcx, 0x970(%rsi)
14590645d:     	shrq	$0x28, %r8
145906461:     	xorps	%xmm0, %xmm0
145906464:     	cvtsi2ss	%r8d, %xmm0
145906469:     	mulss	0x546983(%rip), %xmm0   # 0x145e4cdf4
145906471:     	movss	%xmm0, 0x2a0(%rbp)
145906479:     	movq	0x780(%rsi), %r8
145906480:     	movaps	%xmm8, %xmm0
145906484:     	testq	%r8, %r8
145906487:     	je	0x1459069be <.text+0x59059be>
14590648d:     	movq	0x778(%rsi), %rax
145906494:     	cmpq	$0x1, %r8
145906498:     	jne	0x145906960 <.text+0x5905960>
14590649e:     	xorl	%ecx, %ecx
1459064a0:     	movss	0x46a7c8(%rip), %xmm0   # 0x145d70c70
1459064a8:     	jmp	0x1459069a6 <.text+0x59059a6>
1459064ad:     	xorl	%edi, %edi
1459064af:     	xorl	%r14d, %r14d
1459064b2:     	callq	0x140002200 <.text+0x1200>
1459064b7:     	movl	$0x8, %ecx
1459064bc:     	movl	$0x8, %edx
1459064c1:     	callq	0x1400021c0 <.text+0x11c0>
1459064c6:     	testq	%rax, %rax
1459064c9:     	je	0x145911452 <.text+0x5910452>
1459064cf:     	movq	%rbx, (%rax)
1459064d2:     	movq	$0x1, 0x2e0(%rbp)
1459064dd:     	movq	%rax, 0x2e8(%rbp)
1459064e4:     	movq	$0x1, 0x2f0(%rbp)
1459064ef:     	testb	%dil, %dil
1459064f2:     	movq	%rsi, %rdi
1459064f5:     	je	0x145906629 <.text+0x5905629>
1459064fb:     	movq	0x378(%rbp), %rcx
145906502:     	movss	0x9ec(%rcx), %xmm2
14590650a:     	movq	0x560(%rcx), %rax
145906511:     	movq	$-0x160, %rdx           # imm = 0xFEA0
145906518:     	addq	%rdx, %rax
14590651b:     	imulq	$0x160, 0x568(%rcx), %rcx # imm = 0x160
145906526:     	testq	%rcx, %rcx
145906529:     	je	0x145906629 <.text+0x5905629>
14590652f:     	leaq	0x160(%rax), %rdx
145906536:     	addq	$-0x160, %rcx           # imm = 0xFEA0
14590653d:     	cmpq	%rbx, 0x1e8(%rax)
145906544:     	movq	%rdx, %rax
145906547:     	jne	0x145906526 <.text+0x5905526>
145906549:     	leaq	0x234(%rbp), %rsi
145906550:     	movq	%rsi, %rcx
145906553:     	callq	0x1458dfae0 <.text+0x58deae0>
145906558:     	movl	$0x1, 0x230(%rbp)
145906562:     	movl	0x8(%rsi), %eax
145906565:     	movl	%eax, 0x218(%rbp)
14590656b:     	movq	(%rsi), %rax
14590656e:     	movq	%rax, 0x210(%rbp)
145906575:     	cmpb	$0x5, 0x39(%rdi)
145906579:     	movq	0x378(%rbp), %rax
145906580:     	movss	0x4a0(%rax), %xmm3
145906588:     	mulss	0x49493c(%rip), %xmm3   # 0x145d9aecc
145906590:     	je	0x14590659a <.text+0x590559a>
145906592:     	movss	0x46d876(%rip), %xmm3   # 0x145d73e10
14590659a:     	movq	%rbx, 0x18(%rbp)
14590659e:     	movb	$0x1, 0x36e(%rbp)
1459065a5:     	leaq	0x18(%rbp), %rax
1459065a9:     	movq	%rax, 0x20(%rsp)
1459065ae:     	movq	$0x1, 0x28(%rsp)
1459065b7:     	leaq	0xa0(%rbp), %rcx
1459065be:     	movq	0x378(%rbp), %rdx
1459065c5:     	leaq	0x210(%rbp), %r8
1459065cc:     	callq	0x145925c80 <.text+0x5924c80>
1459065d1:     	nop
1459065d2:     	movq	0xa0(%rbp), %rax
1459065d9:     	movq	0xa8(%rbp), %rcx
1459065e0:     	movq	0xb0(%rbp), %rdx
1459065e7:     	leaq	(%rcx,%rdx,8), %rdx
1459065eb:     	movq	%rcx, 0xa0(%rbp)
1459065f2:     	movq	%rcx, 0xa8(%rbp)
1459065f9:     	movq	%rax, 0xb0(%rbp)
145906600:     	movq	%rdx, 0xb8(%rbp)
145906607:     	movq	%r14, 0xc0(%rbp)
14590660e:     	movb	$0x1, 0x36e(%rbp)
145906615:     	leaq	0x2e0(%rbp), %rcx
14590661c:     	leaq	0xa0(%rbp), %rdx
145906623:     	callq	0x145996880 <.text+0x5995880>
145906628:     	nop
145906629:     	movq	0x378(%rbp), %rax
145906630:     	movq	0xd8(%rax), %rdx
145906637:     	cmpq	%rdx, %r13
14590663a:     	jae	0x145911a00 <.text+0x5910a00>
145906640:     	cmpb	$0x5, 0x39(%rdi)
145906644:     	jne	0x1459066a2 <.text+0x59056a2>
145906646:     	movq	0x378(%rbp), %rcx
14590664d:     	movq	0xd0(%rcx), %rax
145906654:     	movq	0x20(%rax,%r15), %rdx
145906659:     	addq	%r15, %rax
14590665c:     	incl	0x70(%rax)
14590665f:     	movq	0xd8(%rcx), %rax
145906666:     	cmpq	%rax, %r13
145906669:     	jae	0x145911a2f <.text+0x5910a2f>
14590666f:     	movq	0xd0(%rcx), %rax
145906676:     	imull	$0xaaaaaaab, 0x70(%rax,%r15), %eax # imm = 0xAAAAAAAB
14590667f:     	cmpl	$0x55555556, %eax       # imm = 0x55555556
145906684:     	movabsq	$0x7269665f6c756f73, %r10 # imm = 0x7269665F6C756F73
14590668e:     	jb	0x145906730 <.text+0x5905730>
145906694:     	xorl	%ebx, %ebx
145906696:     	movq	0x378(%rbp), %rdx
14590669d:     	jmp	0x1459067f8 <.text+0x59057f8>
1459066a2:     	movl	$0x5, %r14d
1459066a8:     	xorl	%ebx, %ebx
1459066aa:     	leaq	0x1572b48(%rip), %rax   # 0x146e791f9
1459066b1:     	jmp	0x145906fec <.text+0x5905fec>
1459066b6:     	cmpl	$0x4be9, %r8d           # imm = 0x4BE9
1459066bd:     	jg	0x1459068f3 <.text+0x59058f3>
1459066c3:     	cmpl	$0x1c65, %r8d           # imm = 0x1C65
1459066ca:     	je	0x145906953 <.text+0x5905953>
1459066d0:     	cmpl	$0x27c5, %r8d           # imm = 0x27C5
1459066d7:     	je	0x145906b1e <.text+0x5905b1e>
1459066dd:     	movaps	%xmm8, %xmm0
1459066e1:     	cmpl	$0x2c66, %r8d           # imm = 0x2C66
1459066e8:     	je	0x1459068e6 <.text+0x59058e6>
1459066ee:     	jmp	0x145906b30 <.text+0x5905b30>
1459066f3:     	cmpl	$0x84, %r8d
1459066fa:     	jle	0x145906b0e <.text+0x5905b0e>
145906700:     	cmpl	$0x85, %r8d
145906707:     	je	0x1459068e6 <.text+0x59058e6>
14590670d:     	cmpl	$0x193, %r8d            # imm = 0x193
145906714:     	je	0x145906953 <.text+0x5905953>
14590671a:     	movaps	%xmm8, %xmm0
14590671e:     	cmpl	$0x2ae, %r8d            # imm = 0x2AE
145906725:     	je	0x145906953 <.text+0x5905953>
14590672b:     	jmp	0x145906b30 <.text+0x5905b30>
145906730:     	movq	0x2e8(%rbp), %r9
145906737:     	movq	0x2f0(%rbp), %rax
14590673e:     	movq	%rbx, 0x238(%rbp)
145906745:     	movl	$0x0, 0x230(%rbp)
14590674f:     	movl	$0x0, 0x210(%rbp)
145906759:     	movb	$0x1, 0x36e(%rbp)
145906760:     	leaq	0x210(%rbp), %rcx
145906767:     	movq	%rcx, 0x30(%rsp)
14590676c:     	leaq	0x230(%rbp), %rcx
145906773:     	movq	%rcx, 0x28(%rsp)
145906778:     	movq	%rax, 0x20(%rsp)
14590677d:     	leaq	0xa0(%rbp), %rcx
145906784:     	movl	$0x34d, %r8d            # imm = 0x34D
14590678a:     	callq	0x1458b5100 <.text+0x58b4100>
14590678f:     	nop
145906790:     	movq	0x378(%rbp), %rax
145906797:     	movq	0x5e0(%rax), %rsi
14590679e:     	cmpq	0x5d0(%rax), %rsi
1459067a5:     	jne	0x1459067b1 <.text+0x59057b1>
1459067a7:     	movq	0x60(%rbp), %rcx
1459067ab:     	callq	0x145bcb530 <.text+0x5bca530>
1459067b0:     	nop
1459067b1:     	movq	0x378(%rbp), %rdx
1459067b8:     	movq	0x5d8(%rdx), %rax
1459067bf:     	movq	%rsi, %rcx
1459067c2:     	shlq	$0x5, %rcx
1459067c6:     	movups	0xa0(%rbp), %xmm0
1459067cd:     	movups	0xb0(%rbp), %xmm1
1459067d4:     	movups	%xmm1, 0x10(%rax,%rcx)
1459067d9:     	movups	%xmm0, (%rax,%rcx)
1459067dd:     	incq	%rsi
1459067e0:     	movq	%rsi, 0x5e0(%rdx)
1459067e7:     	leaq	0x15740c2(%rip), %rbx   # 0x146e7a8b0
1459067ee:     	movabsq	$0x7269665f6c756f73, %r10 # imm = 0x7269665F6C756F73
1459067f8:     	movq	0x320(%rdx), %rcx
1459067ff:     	movl	$0x6, %r14d
145906805:     	testq	%rcx, %rcx
145906808:     	je	0x145906fe5 <.text+0x5905fe5>
14590680e:     	movq	0x318(%rdx), %rax
145906815:     	imulq	$0x68, %rcx, %rcx
145906819:     	xorl	%edx, %edx
14590681b:     	jmp	0x14590682a <.text+0x590582a>
14590681d:     	addq	$0x68, %rdx
145906821:     	cmpq	%rdx, %rcx
145906824:     	je	0x145906fe5 <.text+0x5905fe5>
14590682a:     	movq	(%rax,%rdx), %r8
14590682e:     	cmpq	$0x9, 0x8(%r8)
145906833:     	jne	0x14590681d <.text+0x590581d>
145906835:     	movq	(%r8), %r8
145906838:     	movq	(%r8), %r9
14590683b:     	xorq	%r10, %r9
14590683e:     	movzbl	0x8(%r8), %r8d
145906843:     	xorq	$0x65, %r8
145906847:     	orq	%r9, %r8
14590684a:     	jne	0x14590681d <.text+0x590581d>
14590684c:     	movq	0x378(%rbp), %rsi
145906853:     	movss	0x9ec(%rsi), %xmm14
14590685c:     	movss	%xmm14, 0xa0(%rbp)
145906865:     	movq	0x50(%rbp), %rcx
145906869:     	leaq	0xa0(%rbp), %rdx
145906870:     	callq	0x145995f70 <.text+0x5994f70>
145906875:     	movq	0x7f0(%rsi), %rax
14590687c:     	movq	0x7f8(%rsi), %rsi
145906883:     	movss	0x46a3e5(%rip), %xmm0   # 0x145d70c70
14590688b:     	testq	%rsi, %rsi
14590688e:     	je	0x145906d78 <.text+0x5905d78>
145906894:     	movl	%esi, %ecx
145906896:     	andl	$0x7, %ecx
145906899:     	cmpq	$0x8, %rsi
14590689d:     	jae	0x145906d10 <.text+0x5905d10>
1459068a3:     	xorl	%edx, %edx
1459068a5:     	movss	0x46a3c3(%rip), %xmm0   # 0x145d70c70
1459068ad:     	jmp	0x145906d5f <.text+0x5905d5f>
1459068b2:     	cmpl	$0x1a85, %r8d           # imm = 0x1A85
1459068b9:     	je	0x1459068e6 <.text+0x59058e6>
1459068bb:     	cmpl	$0x1b05, %r8d           # imm = 0x1B05
1459068c2:     	je	0x145906b28 <.text+0x5905b28>
1459068c8:     	movaps	%xmm8, %xmm0
1459068cc:     	cmpl	$0x1b54, %r8d           # imm = 0x1B54
1459068d3:     	jne	0x145906b30 <.text+0x5905b30>
1459068d9:     	movss	0x46a34f(%rip), %xmm0   # 0x145d70c30
1459068e1:     	jmp	0x145906b30 <.text+0x5905b30>
1459068e6:     	movss	0x4b13b6(%rip), %xmm0   # 0x145db7ca4
1459068ee:     	jmp	0x145906b30 <.text+0x5905b30>
1459068f3:     	cmpl	$0x4bea, %r8d           # imm = 0x4BEA
1459068fa:     	je	0x145906b28 <.text+0x5905b28>
145906900:     	cmpl	$0x5ed3, %r8d           # imm = 0x5ED3
145906907:     	je	0x145906d03 <.text+0x5905d03>
14590690d:     	movaps	%xmm8, %xmm0
145906911:     	cmpl	$0x6af7, %r8d           # imm = 0x6AF7
145906918:     	je	0x145906953 <.text+0x5905953>
14590691a:     	jmp	0x145906b30 <.text+0x5905b30>
14590691f:     	cmpl	$0xafc, %r8d            # imm = 0xAFC
145906926:     	je	0x145906953 <.text+0x5905953>
145906928:     	cmpl	$0xbe4, %r8d            # imm = 0xBE4
14590692f:     	je	0x145906b28 <.text+0x5905b28>
145906935:     	movaps	%xmm8, %xmm0
145906939:     	cmpl	$0xe16, %r8d            # imm = 0xE16
145906940:     	jne	0x145906b30 <.text+0x5905b30>
145906946:     	movss	0x1571bd2(%rip), %xmm0  # 0x146e78520
14590694e:     	jmp	0x145906b30 <.text+0x5905b30>
145906953:     	movss	0x466f35(%rip), %xmm0   # 0x145d6d890
14590695b:     	jmp	0x145906b30 <.text+0x5905b30>
145906960:     	movq	%r8, %r9
145906963:     	andq	$-0x2, %r9
145906967:     	xorl	%ecx, %ecx
145906969:     	movss	0x46a2ff(%rip), %xmm0   # 0x145d70c70
145906971:     	jmp	0x14590697c <.text+0x590597c>
145906973:     	addq	$0x2, %rcx
145906977:     	cmpq	%rcx, %r9
14590697a:     	je	0x1459069a0 <.text+0x59059a0>
14590697c:     	cmpb	$0x11, (%rax,%rcx,8)
145906980:     	je	0x14590698b <.text+0x590598b>
145906982:     	cmpb	$0x11, 0x8(%rax,%rcx,8)
145906987:     	jne	0x145906973 <.text+0x5905973>
145906989:     	jmp	0x145906998 <.text+0x5905998>
14590698b:     	addss	0x4(%rax,%rcx,8), %xmm0
145906991:     	cmpb	$0x11, 0x8(%rax,%rcx,8)
145906996:     	jne	0x145906973 <.text+0x5905973>
145906998:     	addss	0xc(%rax,%rcx,8), %xmm0
14590699e:     	jmp	0x145906973 <.text+0x5905973>
1459069a0:     	testb	$0x1, %r8b
1459069a4:     	je	0x1459069b2 <.text+0x59059b2>
1459069a6:     	cmpb	$0x11, (%rax,%rcx,8)
1459069aa:     	jne	0x1459069b2 <.text+0x59059b2>
1459069ac:     	addss	0x4(%rax,%rcx,8), %xmm0
1459069b2:     	addss	%xmm8, %xmm0
1459069b7:     	movq	0x378(%rbp), %rsi
1459069be:     	movss	0x484(%rsi), %xmm14
1459069c7:     	ucomiss	0x2a0(%rbp), %xmm14
1459069cf:     	movl	0x4d8(%rsi), %eax
1459069d5:     	cvtsi2ss	%rax, %xmm1
1459069da:     	addss	0x46d332(%rip), %xmm1   # 0x145d73d14
1459069e2:     	mulss	0x4af50a(%rip), %xmm1   # 0x145db5ef4
1459069ea:     	addss	%xmm8, %xmm1
1459069ef:     	mulss	%xmm1, %xmm13
1459069f4:     	mulss	0x47c(%rsi), %xmm13
1459069fd:     	mulss	%xmm0, %xmm13
145906a02:     	jbe	0x145906a0d <.text+0x5905a0d>
145906a04:     	mulss	0x488(%rsi), %xmm13
145906a0d:     	movl	0x370(%rbp), %eax
145906a13:     	movb	%al, 0x387(%rbp)
145906a19:     	ucomiss	0x2a0(%rbp), %xmm14
145906a21:     	seta	0x20(%rsp)
145906a26:     	cvttss2si	%xmm13, %r9
145906a2b:     	ucomiss	%xmm9, %xmm13
145906a2f:     	movl	$0x0, %eax
145906a34:     	cmovbl	%eax, %r9d
145906a38:     	ucomiss	0x466e34(%rip), %xmm13  # 0x145d6d874
145906a40:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
145906a45:     	cmoval	%eax, %r9d
145906a49:     	leaq	0xa0(%rbp), %rcx
145906a50:     	movq	%rbx, %r8
145906a53:     	callq	0x1458ab9e0 <.text+0x58aa9e0>
145906a58:     	nop
145906a59:     	movq	0x378(%rbp), %rax
145906a60:     	movq	0x5e0(%rax), %rsi
145906a67:     	cmpq	0x5d0(%rax), %rsi
145906a6e:     	jne	0x145906a7a <.text+0x5905a7a>
145906a70:     	movq	0x60(%rbp), %rcx
145906a74:     	callq	0x145bcb530 <.text+0x5bca530>
145906a79:     	nop
145906a7a:     	movq	0x378(%rbp), %rcx
145906a81:     	movq	0x5d8(%rcx), %rax
145906a88:     	movq	%rsi, %rdx
145906a8b:     	shlq	$0x5, %rdx
145906a8f:     	movups	0xa0(%rbp), %xmm0
145906a96:     	movups	0xb0(%rbp), %xmm1
145906a9d:     	movups	%xmm1, 0x10(%rax,%rdx)
145906aa2:     	movups	%xmm0, (%rax,%rdx)
145906aa6:     	incq	%rsi
145906aa9:     	movq	%rsi, 0x5e0(%rcx)
145906ab0:     	movb	0x195(%rcx), %sil
145906ab7:     	movb	$0x2, 0x195(%rcx)
145906abe:     	movzbl	0x38(%rdi), %eax
145906ac2:     	movl	0x370(%rbp), %edx
145906ac8:     	movb	%dl, 0x387(%rbp)
145906ace:     	ucomiss	0x2a0(%rbp), %xmm14
145906ad6:     	seta	0x28(%rsp)
145906adb:     	movb	%al, 0x20(%rsp)
145906adf:     	movb	$0x1, 0x30(%rsp)
145906ae4:     	movq	%rbx, %rdx
145906ae7:     	movaps	%xmm13, %xmm2
145906aeb:     	xorl	%r9d, %r9d
145906aee:     	callq	0x145933ec0 <.text+0x5932ec0>
145906af3:     	nop
145906af4:     	movq	0x378(%rbp), %rax
145906afb:     	movb	%sil, 0x195(%rax)
145906b02:     	movq	0x360(%rbp), %rsi
145906b09:     	jmp	0x14590762b <.text+0x590662b>
145906b0e:     	cmpl	$0x4b, %r8d
145906b12:     	je	0x145906b28 <.text+0x5905b28>
145906b14:     	movaps	%xmm8, %xmm0
145906b18:     	cmpl	$0x74, %r8d
145906b1c:     	jne	0x145906b30 <.text+0x5905b30>
145906b1e:     	movss	0x4972fa(%rip), %xmm0   # 0x145d9de20
145906b26:     	jmp	0x145906b30 <.text+0x5905b30>
145906b28:     	movss	0x46a144(%rip), %xmm0   # 0x145d70c74
145906b30:     	ucomiss	%xmm12, %xmm13
145906b34:     	seta	%r10b
145906b38:     	movshdup	%xmm10, %xmm1           # xmm1 = xmm10[1,1,3,3]
145906b3d:     	subss	0x360(%rbp), %xmm10
145906b46:     	subss	%xmm2, %xmm1
145906b4a:     	mulss	%xmm10, %xmm10
145906b4f:     	mulss	%xmm1, %xmm1
145906b53:     	addss	%xmm10, %xmm1
145906b58:     	xorps	%xmm10, %xmm10
145906b5c:     	sqrtss	%xmm1, %xmm10
145906b61:     	divss	%xmm0, %xmm10
145906b66:     	movq	0x378(%rbp), %rax
145906b6d:     	addss	0x9ec(%rax), %xmm10
145906b76:     	movzbl	0x38(%r14), %r11d
145906b7b:     	xorl	%r14d, %r14d
145906b7e:     	cmpb	$0x4, %r11b
145906b82:     	sete	%cl
145906b85:     	movq	0x598(%rax), %rdi
145906b8c:     	cmpq	0x588(%rax), %rdi
145906b93:     	jne	0x145906bff <.text+0x5905bff>
145906b95:     	movl	0x370(%rbp), %eax
145906b9b:     	movb	%al, 0x387(%rbp)
145906ba1:     	movb	%cl, 0x40(%rbp)
145906ba4:     	movq	0x48(%rbp), %rcx
145906ba8:     	movl	%r8d, 0x360(%rbp)
145906baf:     	movaps	%xmm12, 0x2a0(%rbp)
145906bb7:     	movaps	%xmm7, %xmm12
145906bbb:     	movaps	%xmm8, %xmm7
145906bbf:     	movaps	%xmm5, %xmm8
145906bc3:     	movb	%r10b, 0x88(%rbp)
145906bca:     	movb	%r11b, 0x58(%rbp)
145906bce:     	callq	0x145bce850 <.text+0x5bcd850>
145906bd3:     	movzbl	0x40(%rbp), %ecx
145906bd7:     	movzbl	0x58(%rbp), %r11d
145906bdc:     	movzbl	0x88(%rbp), %r10d
145906be4:     	movaps	%xmm8, %xmm5
145906be8:     	movaps	%xmm7, %xmm8
145906bec:     	movaps	%xmm12, %xmm7
145906bf0:     	movaps	0x2a0(%rbp), %xmm12
145906bf8:     	movl	0x360(%rbp), %r8d
145906bff:     	cmpltss	%xmm13, %xmm12
145906c05:     	movaps	%xmm12, %xmm0
145906c09:     	andnps	%xmm5, %xmm0
145906c0c:     	andps	%xmm14, %xmm12
145906c10:     	orps	%xmm0, %xmm12
145906c14:     	movb	%cl, %r14b
145906c17:     	movq	0x378(%rbp), %rdx
145906c1e:     	movq	0x590(%rdx), %rax
145906c25:     	movq	%rdi, %rcx
145906c28:     	shlq	$0x7, %rcx
145906c2c:     	movq	$0x0, (%rax,%rcx)
145906c34:     	movl	$0x0, 0x10(%rax,%rcx)
145906c3c:     	movb	$0x2, 0x48(%rax,%rcx)
145906c41:     	movq	%rbx, 0x50(%rax,%rcx)
145906c46:     	movq	%rsi, 0x58(%rax,%rcx)
145906c4b:     	movl	%r14d, 0x60(%rax,%rcx)
145906c50:     	movsd	0x15718d8(%rip), %xmm0  # 0x146e78530
145906c58:     	movsd	%xmm0, 0x64(%rax,%rcx)
145906c5e:     	movss	%xmm10, 0x6c(%rax,%rcx)
145906c65:     	movl	%r8d, 0x70(%rax,%rcx)
145906c6a:     	movss	%xmm12, 0x74(%rax,%rcx)
145906c71:     	movb	%r10b, 0x78(%rax,%rcx)
145906c76:     	movw	$0x0, 0x79(%rax,%rcx)
145906c7d:     	movb	%r11b, 0x7b(%rax,%rcx)
145906c82:     	incq	%rdi
145906c85:     	movq	%rdi, 0x598(%rdx)
145906c8c:     	movq	0x378(%rbp), %rax
145906c93:     	cmpq	0xd8(%rax), %r13
145906c9a:     	jae	0x145904f97 <.text+0x5903f97>
145906ca0:     	movq	0x378(%rbp), %rax
145906ca7:     	movq	0xd0(%rax), %rax
145906cae:     	movq	0x18(%rax,%r15), %rcx
145906cb3:     	cmpb	$0x0, 0x39(%rcx)
145906cb7:     	je	0x145904f97 <.text+0x5903f97>
145906cbd:     	addq	%r15, %rax
145906cc0:     	movss	0x60(%rax), %xmm0
145906cc5:     	movq	0x378(%rbp), %rcx
145906ccc:     	ucomiss	0x9ec(%rcx), %xmm0
145906cd3:     	jbe	0x145904f97 <.text+0x5903f97>
145906cd9:     	movss	0x64(%rax), %xmm1
145906cde:     	movaps	%xmm1, %xmm2
145906ce1:     	minss	%xmm0, %xmm2
145906ce5:     	movaps	%xmm2, %xmm0
145906ce8:     	cmpunordss	%xmm2, %xmm0
145906ced:     	movaps	%xmm0, %xmm3
145906cf0:     	andnps	%xmm2, %xmm3
145906cf3:     	andps	%xmm1, %xmm0
145906cf6:     	orps	%xmm3, %xmm0
145906cf9:     	movss	%xmm0, 0x64(%rax)
145906cfe:     	jmp	0x145904f97 <.text+0x5903f97>
145906d03:     	movss	0x1571755(%rip), %xmm0  # 0x146e78460
145906d0b:     	jmp	0x145906b30 <.text+0x5905b30>
145906d10:     	movq	%rsi, %r8
145906d13:     	andq	$-0x8, %r8
145906d17:     	xorl	%edx, %edx
145906d19:     	movss	0x469f4f(%rip), %xmm0   # 0x145d70c70
145906d21:     	addss	0x4(%rax,%rdx,8), %xmm0
145906d27:     	addss	0xc(%rax,%rdx,8), %xmm0
145906d2d:     	addss	0x14(%rax,%rdx,8), %xmm0
145906d33:     	addss	0x1c(%rax,%rdx,8), %xmm0
145906d39:     	addss	0x24(%rax,%rdx,8), %xmm0
145906d3f:     	addss	0x2c(%rax,%rdx,8), %xmm0
145906d45:     	addss	0x34(%rax,%rdx,8), %xmm0
145906d4b:     	addss	0x3c(%rax,%rdx,8), %xmm0
145906d51:     	addq	$0x8, %rdx
145906d55:     	cmpq	%rdx, %r8
145906d58:     	jne	0x145906d21 <.text+0x5905d21>
145906d5a:     	testq	%rcx, %rcx
145906d5d:     	je	0x145906d78 <.text+0x5905d78>
145906d5f:     	leaq	(%rax,%rdx,8), %rdx
145906d63:     	addq	$0x4, %rdx
145906d67:     	xorl	%r8d, %r8d
145906d6a:     	addss	(%rdx,%r8,8), %xmm0
145906d70:     	incq	%r8
145906d73:     	cmpq	%r8, %rcx
145906d76:     	jne	0x145906d6a <.text+0x5905d6a>
145906d78:     	movss	0x4666ab(%rip), %xmm13  # 0x145d6d42c
145906d81:     	subss	%xmm0, %xmm13
145906d86:     	minss	0x466781(%rip), %xmm13  # 0x145d6d510
145906d8f:     	movss	0x5eaeb1(%rip), %xmm0   # 0x145ef1c48
145906d97:     	ucomiss	%xmm13, %xmm0
145906d9b:     	jae	0x145906fe5 <.text+0x5905fe5>
145906da1:     	movq	0x378(%rbp), %rcx
145906da8:     	cmpl	$0x4, 0x8a0(%rcx)
145906daf:     	ja	0x145906fe5 <.text+0x5905fe5>
145906db5:     	movq	0x50(%rbp), %rcx
145906db9:     	cmpq	(%rcx), %rsi
145906dbc:     	jne	0x145906ddd <.text+0x5905ddd>
145906dbe:     	movb	$0x1, 0x36e(%rbp)
145906dc5:     	movq	0x50(%rbp), %rcx
145906dc9:     	callq	0x145bfb120 <.text+0x5bfa120>
145906dce:     	nop
145906dcf:     	movq	0x378(%rbp), %rax
145906dd6:     	movq	0x7f0(%rax), %rax
145906ddd:     	movss	%xmm14, (%rax,%rsi,8)
145906de3:     	movss	%xmm13, 0x4(%rax,%rsi,8)
145906dea:     	incq	%rsi
145906ded:     	movq	0x378(%rbp), %rax
145906df4:     	movq	%rsi, 0x7f8(%rax)
145906dfb:     	addss	0x8a8(%rax), %xmm13
145906e04:     	movss	%xmm13, 0x8a8(%rax)
145906e0d:     	movl	0x8a0(%rax), %eax
145906e13:     	movss	0x1571725(%rip), %xmm0  # 0x146e78540
145906e1b:     	ucomiss	%xmm0, %xmm13
145906e1f:     	setae	%cl
145906e22:     	cmpl	$0x5, %eax
145906e25:     	setb	%dl
145906e28:     	testb	%dl, %cl
145906e2a:     	je	0x145906fbb <.text+0x5905fbb>
145906e30:     	movss	0x46cedc(%rip), %xmm1   # 0x145d73d14
145906e38:     	addss	%xmm1, %xmm13
145906e3d:     	maxss	%xmm9, %xmm13
145906e42:     	ucomiss	%xmm0, %xmm13
145906e46:     	setae	%cl
145906e49:     	cmpl	$0x4, %eax
145906e4c:     	setb	%dl
145906e4f:     	andb	%cl, %dl
145906e51:     	cmpb	$0x1, %dl
145906e54:     	jne	0x145906f8b <.text+0x5905f8b>
145906e5a:     	addss	%xmm1, %xmm13
145906e5f:     	maxss	%xmm9, %xmm13
145906e64:     	ucomiss	%xmm0, %xmm13
145906e68:     	setae	%cl
145906e6b:     	cmpl	$0x3, %eax
145906e6e:     	setb	%dl
145906e71:     	andb	%cl, %dl
145906e73:     	cmpb	$0x1, %dl
145906e76:     	jne	0x145906f8f <.text+0x5905f8f>
145906e7c:     	addss	%xmm1, %xmm13
145906e81:     	maxss	%xmm9, %xmm13
145906e86:     	ucomiss	%xmm0, %xmm13
145906e8a:     	setae	%cl
145906e8d:     	cmpl	$0x2, %eax
145906e90:     	setb	%dl
145906e93:     	andb	%cl, %dl
145906e95:     	cmpb	$0x1, %dl
145906e98:     	jne	0x145906f94 <.text+0x5905f94>
145906e9e:     	addss	%xmm1, %xmm13
145906ea3:     	maxss	%xmm9, %xmm13
145906ea8:     	ucomiss	%xmm0, %xmm13
145906eac:     	setae	%cl
145906eaf:     	testl	%eax, %eax
145906eb1:     	sete	%dl
145906eb4:     	andb	%cl, %dl
145906eb6:     	cmpb	$0x1, %dl
145906eb9:     	jne	0x145906f99 <.text+0x5905f99>
145906ebf:     	addss	0x46ce4c(%rip), %xmm13  # 0x145d73d14
145906ec8:     	maxss	%xmm9, %xmm13
145906ecd:     	movl	$0x5, %eax
145906ed2:     	jmp	0x145906f9c <.text+0x5905f9c>
145906ed7:     	leaq	0x1(%rdx), %rcx
145906edb:     	cmpq	%rdi, %rcx
145906ede:     	jae	0x145906f2e <.text+0x5905f2e>
145906ee0:     	leal	(%rdi,%rdx), %r9d
145906ee4:     	movq	%rdx, %r8
145906ee7:     	testb	$0x1, %r9b
145906eeb:     	jne	0x145906f22 <.text+0x5905f22>
145906eed:     	movss	0x4(%rax,%rdx,4), %xmm0
145906ef3:     	movaps	%xmm10, %xmm1
145906ef7:     	subss	%xmm0, %xmm1
145906efb:     	movaps	%xmm8, %xmm2
145906eff:     	ucomiss	%xmm1, %xmm8
145906f03:     	movq	%rdx, %r8
145906f06:     	jbe	0x145906f11 <.text+0x5905f11>
145906f08:     	movss	%xmm0, (%rax,%rdx,4)
145906f0d:     	leaq	0x1(%rdx), %r8
145906f11:     	leaq	0x2(%rdx), %rcx
145906f15:     	movss	0x46644e(%rip), %xmm15  # 0x145d6d36c
145906f1e:     	movaps	%xmm2, %xmm8
145906f22:     	leaq	-0x2(%rdi), %r9
145906f26:     	cmpq	%rdx, %r9
145906f29:     	movq	%r8, %rdx
145906f2c:     	jne	0x145906f50 <.text+0x5905f50>
145906f2e:     	movq	0x378(%rbp), %rax
145906f35:     	movq	%rdx, 0x138(%rax)
145906f3c:     	movq	%rdx, %rdi
145906f3f:     	jmp	0x145905c9c <.text+0x5904c9c>
145906f44:     	addq	$0x2, %rcx
145906f48:     	movq	%r8, %rdx
145906f4b:     	cmpq	%rcx, %rdi
145906f4e:     	je	0x145906f2e <.text+0x5905f2e>
145906f50:     	movss	(%rax,%rcx,4), %xmm0
145906f55:     	movaps	%xmm10, %xmm1
145906f59:     	subss	%xmm0, %xmm1
145906f5d:     	ucomiss	%xmm1, %xmm8
145906f61:     	jbe	0x145906f6c <.text+0x5905f6c>
145906f63:     	movss	%xmm0, (%rax,%r8,4)
145906f69:     	incq	%r8
145906f6c:     	movss	0x4(%rax,%rcx,4), %xmm0
145906f72:     	movaps	%xmm10, %xmm1
145906f76:     	subss	%xmm0, %xmm1
145906f7a:     	ucomiss	%xmm1, %xmm8
145906f7e:     	jbe	0x145906f44 <.text+0x5905f44>
145906f80:     	movss	%xmm0, (%rax,%r8,4)
145906f86:     	incq	%r8
145906f89:     	jmp	0x145906f44 <.text+0x5905f44>
145906f8b:     	incl	%eax
145906f8d:     	jmp	0x145906fa5 <.text+0x5905fa5>
145906f8f:     	addl	$0x2, %eax
145906f92:     	jmp	0x145906fa5 <.text+0x5905fa5>
145906f94:     	addl	$0x3, %eax
145906f97:     	jmp	0x145906f9c <.text+0x5905f9c>
145906f99:     	orl	$0x4, %eax
145906f9c:     	movss	0x4663c7(%rip), %xmm15  # 0x145d6d36c
145906fa5:     	movq	0x378(%rbp), %rcx
145906fac:     	movss	%xmm13, 0x8a8(%rcx)
145906fb5:     	movl	%eax, 0x8a0(%rcx)
145906fbb:     	cmpl	$0x4, %eax
145906fbe:     	jbe	0x145906fd1 <.text+0x5905fd1>
145906fc0:     	movq	0x378(%rbp), %rax
145906fc7:     	movl	$0x0, 0x8a8(%rax)
145906fd1:     	movb	$0x1, 0x36e(%rbp)
145906fd8:     	movq	0x378(%rbp), %rcx
145906fdf:     	callq	0x145947780 <.text+0x5946780>
145906fe4:     	nop
145906fe5:     	leaq	0x15738a4(%rip), %rax   # 0x146e7a890
145906fec:     	movq	0x2e8(%rbp), %r8
145906ff3:     	movq	0x2f0(%rbp), %r9
145906ffa:     	movq	%rax, 0xa0(%rbp)
145907001:     	movq	%r14, 0xa8(%rbp)
145907008:     	movq	%rbx, 0xb0(%rbp)
14590700f:     	xorl	%eax, %eax
145907011:     	testq	%rbx, %rbx
145907014:     	sete	%al
145907017:     	movq	$0xf, 0xb8(%rbp)
145907022:     	movl	$0x3f800000, 0xc0(%rbp) # imm = 0x3F800000
14590702c:     	movb	$0x0, 0xc8(%rbp)
145907033:     	leaq	0xbd1986(%rip), %rcx    # 0x1464d89c0
14590703a:     	movss	(%rcx,%rax,4), %xmm14
145907040:     	movb	$0x1, 0x36e(%rbp)
145907047:     	movss	%xmm14, 0x28(%rsp)
14590704e:     	leaq	0xa0(%rbp), %rax
145907055:     	movq	%rax, 0x20(%rsp)
14590705a:     	movq	0x378(%rbp), %rcx
145907061:     	movq	%r13, %rdx
145907064:     	callq	0x14594c4e0 <.text+0x594b4e0>
145907069:     	nop
14590706a:     	cmpb	$0x4, 0x39(%rdi)
14590706e:     	movq	0x360(%rbp), %rsi
145907075:     	jne	0x145907414 <.text+0x5906414>
14590707b:     	movq	0x378(%rbp), %r11
145907082:     	movss	0x9ec(%r11), %xmm13
14590708b:     	movss	%xmm13, 0x78(%rbp)
145907091:     	movq	0x970(%r11), %rax
145907098:     	movq	0x958(%r11), %rcx
14590709f:     	movq	0x960(%r11), %rdx
1459070a6:     	leaq	(%rax,%rcx), %r8
1459070aa:     	rolq	$0x17, %r8
1459070ae:     	addq	%rcx, %r8
1459070b1:     	movq	%rdx, %r9
1459070b4:     	shlq	$0x11, %r9
1459070b8:     	movq	0x968(%r11), %r10
1459070bf:     	xorq	%rcx, %r10
1459070c2:     	xorq	%rdx, %rax
1459070c5:     	xorq	%r10, %rdx
1459070c8:     	movq	%rdx, 0x960(%r11)
1459070cf:     	xorq	%rax, %rcx
1459070d2:     	movq	%rcx, 0x958(%r11)
1459070d9:     	xorq	%r9, %r10
1459070dc:     	movq	%r10, 0x968(%r11)
1459070e3:     	rolq	$0x2d, %rax
1459070e7:     	shrq	$0x28, %r8
1459070eb:     	xorps	%xmm0, %xmm0
1459070ee:     	cvtsi2ss	%r8d, %xmm0
1459070f3:     	movq	%rax, 0x970(%r11)
1459070fa:     	mulss	0x545cf2(%rip), %xmm0   # 0x145e4cdf4
145907102:     	ucomiss	0x46663f(%rip), %xmm0   # 0x145d6d748
145907109:     	jae	0x145907414 <.text+0x5906414>
14590710f:     	movq	0x208(%rbp), %rcx
145907116:     	leaq	0x78(%rbp), %rdx
14590711a:     	callq	0x145996270 <.text+0x5995270>
14590711f:     	movq	0x378(%rbp), %rax
145907126:     	cmpq	$0x1, 0x120(%rax)
14590712e:     	ja	0x145907414 <.text+0x5906414>
145907134:     	movq	0x378(%rbp), %rsi
14590713b:     	movq	0xd8(%rsi), %rdx
145907142:     	cmpq	%rdx, %r13
145907145:     	jae	0x145911a4b <.text+0x5910a4b>
14590714b:     	movq	0xd0(%rsi), %rdx
145907152:     	movq	0x20(%rdx,%r15), %rdi
145907157:     	addq	%r15, %rdx
14590715a:     	leaq	0x8(%rbp), %rbx
14590715e:     	movq	%rbx, %rcx
145907161:     	movaps	%xmm13, %xmm2
145907165:     	callq	0x1458e0be0 <.text+0x58dfbe0>
14590716a:     	movb	$0x1, 0x36e(%rbp)
145907171:     	movq	$0x0, 0x28(%rsp)
14590717a:     	movq	$0x8, 0x20(%rsp)
145907183:     	leaq	0xa0(%rbp), %rcx
14590718a:     	movq	%rsi, %rdx
14590718d:     	movq	%rbx, %r8
145907190:     	movss	0x466428(%rip), %xmm3   # 0x145d6d5c0
145907198:     	callq	0x145925c80 <.text+0x5924c80>
14590719d:     	nop
14590719e:     	movq	0xa0(%rbp), %rax
1459071a5:     	movq	0xa8(%rbp), %rcx
1459071ac:     	movq	0xb0(%rbp), %rdx
1459071b3:     	leaq	(%rcx,%rdx,8), %rdx
1459071b7:     	movq	%rcx, 0xa0(%rbp)
1459071be:     	movq	%rcx, 0xa8(%rbp)
1459071c5:     	movq	%rax, 0xb0(%rbp)
1459071cc:     	movq	%rdx, 0xb8(%rbp)
1459071d3:     	movq	0x330(%rbp), %rax
1459071da:     	movq	%rax, 0xc0(%rbp)
1459071e1:     	movb	$0x1, 0x36e(%rbp)
1459071e8:     	leaq	0x230(%rbp), %rcx
1459071ef:     	leaq	0xa0(%rbp), %rdx
1459071f6:     	callq	0x1459ac8d0 <.text+0x59ab8d0>
1459071fb:     	nop
1459071fc:     	movq	0x240(%rbp), %rbx
145907203:     	testq	%rbx, %rbx
145907206:     	je	0x1459073dd <.text+0x59063dd>
14590720c:     	movq	0x378(%rbp), %r14
145907213:     	movq	0x120(%r14), %rsi
14590721a:     	cmpq	0x110(%r14), %rsi
145907221:     	jne	0x145907237 <.text+0x5906237>
145907223:     	movb	$0x1, 0x346(%rbp)
14590722a:     	movq	0x208(%rbp), %rcx
145907231:     	callq	0x145bcdda0 <.text+0x5bccda0>
145907236:     	nop
145907237:     	movq	0x118(%r14), %rax
14590723e:     	movss	%xmm13, (%rax,%rsi,4)
145907244:     	incq	%rsi
145907247:     	movq	%rsi, 0x120(%r14)
14590724e:     	movq	0x238(%rbp), %r9
145907255:     	movl	$0x2, 0x210(%rbp)
14590725f:     	movl	$0x0, 0x18(%rbp)
145907266:     	movb	$0x1, 0x346(%rbp)
14590726d:     	leaq	0x18(%rbp), %rax
145907271:     	movq	%rax, 0x30(%rsp)
145907276:     	leaq	0x210(%rbp), %rax
14590727d:     	movq	%rax, 0x28(%rsp)
145907282:     	movq	%rbx, 0x20(%rsp)
145907287:     	leaq	0xa0(%rbp), %rcx
14590728e:     	movq	%rdi, %rdx
145907291:     	movl	$0x18d6, %r8d           # imm = 0x18D6
145907297:     	movq	%r9, 0x2a0(%rbp)
14590729e:     	callq	0x1458b5100 <.text+0x58b4100>
1459072a3:     	nop
1459072a4:     	movq	0x5e0(%r14), %rsi
1459072ab:     	cmpq	0x5d0(%r14), %rsi
1459072b2:     	jne	0x1459072be <.text+0x59062be>
1459072b4:     	movq	0x60(%rbp), %rcx
1459072b8:     	callq	0x145bcb530 <.text+0x5bca530>
1459072bd:     	nop
1459072be:     	movq	0x378(%rbp), %rdx
1459072c5:     	movq	0x5d8(%rdx), %rax
1459072cc:     	movq	%rsi, %rcx
1459072cf:     	shlq	$0x5, %rcx
1459072d3:     	movups	0xa0(%rbp), %xmm0
1459072da:     	movups	0xb0(%rbp), %xmm1
1459072e1:     	movups	%xmm1, 0x10(%rax,%rcx)
1459072e6:     	movups	%xmm0, (%rax,%rcx)
1459072ea:     	incq	%rsi
1459072ed:     	movq	%rsi, 0x5e0(%rdx)
1459072f4:     	movq	0x230(%rbp), %rax
1459072fb:     	movq	%rax, 0x88(%rbp)
145907302:     	movq	0x2a0(%rbp), %rax
145907309:     	leaq	(%rax,%rbx,8), %rdi
14590730d:     	movq	%rax, %rbx
145907310:     	movss	0x493b83(%rip), %xmm13  # 0x145d9ae9c
145907319:     	movq	0x360(%rbp), %rsi
145907320:     	jmp	0x145907358 <.text+0x5906358>
145907322:     	movss	%xmm0, 0xa4(%rbp)
14590732a:     	movl	$0x3, 0xa0(%rbp)
145907334:     	movl	$0x18d6, 0x20(%rsp)     # imm = 0x18D6
14590733c:     	xorps	%xmm3, %xmm3
14590733f:     	movq	0x378(%rbp), %rcx
145907346:     	leaq	0xa0(%rbp), %r8
14590734d:     	callq	0x1459251b0 <.text+0x59241b0>
145907352:     	nop
145907353:     	cmpq	%rdi, %rbx
145907356:     	je	0x1459073cf <.text+0x59063cf>
145907358:     	movq	(%rbx), %rdx
14590735b:     	addq	$0x8, %rbx
14590735f:     	movq	0x378(%rbp), %rcx
145907366:     	movq	0x560(%rcx), %rax
14590736d:     	imulq	$0x160, 0x568(%rcx), %r8 # imm = 0x160
145907378:     	xorl	%ecx, %ecx
14590737a:     	movq	%rax, %r9
14590737d:     	nopl	(%rax)
145907380:     	cmpq	%rcx, %r8
145907383:     	je	0x145907353 <.text+0x5906353>
145907385:     	addq	$0x160, %rcx            # imm = 0x160
14590738c:     	cmpq	%rdx, 0x88(%r9)
145907393:     	leaq	0x160(%r9), %r9
14590739a:     	jne	0x145907380 <.text+0x5906380>
14590739c:     	cmpq	$-0x1, -0x148(%rax,%rcx)
1459073a5:     	movss	0x46607f(%rip), %xmm0   # 0x145d6d42c
1459073ad:     	jne	0x145907322 <.text+0x5906322>
1459073b3:     	cmpb	$0x0, -0x4(%rax,%rcx)
1459073b8:     	movaps	%xmm13, %xmm0
1459073bc:     	je	0x145907322 <.text+0x5906322>
1459073c2:     	movss	0x46638a(%rip), %xmm0   # 0x145d6d754
1459073ca:     	jmp	0x145907322 <.text+0x5906322>
1459073cf:     	movq	0x88(%rbp), %rdx
1459073d6:     	testq	%rdx, %rdx
1459073d9:     	jne	0x1459073fe <.text+0x59063fe>
1459073db:     	jmp	0x145907414 <.text+0x5906414>
1459073dd:     	movq	0x230(%rbp), %rdx
1459073e4:     	testq	%rdx, %rdx
1459073e7:     	movq	0x360(%rbp), %rsi
1459073ee:     	je	0x145907414 <.text+0x5906414>
1459073f0:     	movq	0x238(%rbp), %rax
1459073f7:     	movq	%rax, 0x2a0(%rbp)
1459073fe:     	shlq	$0x3, %rdx
145907402:     	movl	$0x8, %r8d
145907408:     	movq	0x2a0(%rbp), %rcx
14590740f:     	callq	0x1400021d0 <.text+0x11d0>
145907414:     	movq	0x378(%rbp), %rax
14590741b:     	movq	0x780(%rax), %rdx
145907422:     	testq	%rdx, %rdx
145907425:     	je	0x145907609 <.text+0x5906609>
14590742b:     	movq	0x378(%rbp), %rax
145907432:     	movq	0x778(%rax), %rax
145907439:     	cmpq	$0x1, %rdx
14590743d:     	jne	0x14590744b <.text+0x590644b>
14590743f:     	xorl	%ecx, %ecx
145907441:     	movss	0x469827(%rip), %xmm0   # 0x145d70c70
145907449:     	jmp	0x145907490 <.text+0x5906490>
14590744b:     	movq	%rdx, %r8
14590744e:     	andq	$-0x2, %r8
145907452:     	xorl	%ecx, %ecx
145907454:     	movss	0x469814(%rip), %xmm0   # 0x145d70c70
14590745c:     	jmp	0x145907467 <.text+0x5906467>
14590745e:     	addq	$0x2, %rcx
145907462:     	cmpq	%rcx, %r8
145907465:     	je	0x14590748b <.text+0x590648b>
145907467:     	cmpb	$0x1f, (%rax,%rcx,8)
14590746b:     	je	0x145907476 <.text+0x5906476>
14590746d:     	cmpb	$0x1f, 0x8(%rax,%rcx,8)
145907472:     	jne	0x14590745e <.text+0x590645e>
145907474:     	jmp	0x145907483 <.text+0x5906483>
145907476:     	addss	0x4(%rax,%rcx,8), %xmm0
14590747c:     	cmpb	$0x1f, 0x8(%rax,%rcx,8)
145907481:     	jne	0x14590745e <.text+0x590645e>
145907483:     	addss	0xc(%rax,%rcx,8), %xmm0
145907489:     	jmp	0x14590745e <.text+0x590645e>
14590748b:     	testb	$0x1, %dl
14590748e:     	je	0x14590749c <.text+0x590649c>
145907490:     	cmpb	$0x1f, (%rax,%rcx,8)
145907494:     	jne	0x14590749c <.text+0x590649c>
145907496:     	addss	0x4(%rax,%rcx,8), %xmm0
14590749c:     	ucomiss	%xmm9, %xmm0
1459074a0:     	jbe	0x145907609 <.text+0x5906609>
1459074a6:     	movq	0x378(%rbp), %r11
1459074ad:     	movq	0x970(%r11), %rax
1459074b4:     	movq	0x958(%r11), %rcx
1459074bb:     	movq	0x960(%r11), %rdx
1459074c2:     	leaq	(%rax,%rcx), %r8
1459074c6:     	rolq	$0x17, %r8
1459074ca:     	addq	%rcx, %r8
1459074cd:     	movq	%rdx, %r9
1459074d0:     	shlq	$0x11, %r9
1459074d4:     	movq	0x968(%r11), %r10
1459074db:     	xorq	%rcx, %r10
1459074de:     	xorq	%rdx, %rax
1459074e1:     	xorq	%r10, %rdx
1459074e4:     	movq	%rdx, 0x960(%r11)
1459074eb:     	xorq	%rax, %rcx
1459074ee:     	movq	%rcx, 0x958(%r11)
1459074f5:     	xorq	%r9, %r10
1459074f8:     	movq	%r10, 0x968(%r11)
1459074ff:     	rolq	$0x2d, %rax
145907503:     	shrq	$0x28, %r8
145907507:     	xorps	%xmm1, %xmm1
14590750a:     	cvtsi2ss	%r8d, %xmm1
14590750f:     	movq	%rax, 0x970(%r11)
145907516:     	mulss	0x5458d6(%rip), %xmm1   # 0x145e4cdf4
14590751e:     	ucomiss	%xmm1, %xmm0
145907521:     	jbe	0x145907609 <.text+0x5906609>
145907527:     	movq	0x2e0(%rbp), %rax
14590752e:     	movq	0x2e8(%rbp), %rcx
145907535:     	movq	0x2f0(%rbp), %rdx
14590753c:     	leaq	(%rcx,%rdx,8), %rdx
145907540:     	movq	%rcx, 0xa0(%rbp)
145907547:     	movq	%rcx, 0xa8(%rbp)
14590754e:     	movq	%rax, 0xb0(%rbp)
145907555:     	movq	%rdx, 0xb8(%rbp)
14590755c:     	movq	0x330(%rbp), %rax
145907563:     	movq	%rax, 0xc0(%rbp)
14590756a:     	movb	$0x0, 0x36e(%rbp)
145907571:     	leaq	0x230(%rbp), %rcx
145907578:     	leaq	0xa0(%rbp), %rdx
14590757f:     	callq	0x1459ac830 <.text+0x59ab830>
145907584:     	nop
145907585:     	movq	0x240(%rbp), %r9
14590758c:     	testq	%r9, %r9
14590758f:     	movq	0x360(%rbp), %rsi
145907596:     	je	0x1459075f4 <.text+0x59065f4>
145907598:     	leaq	0x1573320(%rip), %rax   # 0x146e7a8bf
14590759f:     	movq	%rax, 0xa0(%rbp)
1459075a6:     	movq	$0xe, 0xa8(%rbp)
1459075b1:     	movq	$0x0, 0xb0(%rbp)
1459075bc:     	movb	$0x0, 0xc8(%rbp)
1459075c3:     	movq	0x238(%rbp), %r8
1459075ca:     	movss	%xmm14, 0x28(%rsp)
1459075d1:     	leaq	0xa0(%rbp), %rax
1459075d8:     	movq	%rax, 0x20(%rsp)
1459075dd:     	movq	0x378(%rbp), %rcx
1459075e4:     	movq	%r13, %rdx
1459075e7:     	movq	%r8, 0x2a0(%rbp)
1459075ee:     	callq	0x14594c4e0 <.text+0x594b4e0>
1459075f3:     	nop
1459075f4:     	movq	0x230(%rbp), %rdx
1459075fb:     	testq	%rdx, %rdx
1459075fe:     	je	0x14590762b <.text+0x590662b>
145907600:     	movq	0x238(%rbp), %rcx
145907607:     	jmp	0x14590761c <.text+0x590661c>
145907609:     	movq	0x2e0(%rbp), %rdx
145907610:     	testq	%rdx, %rdx
145907613:     	je	0x14590762b <.text+0x590662b>
145907615:     	movq	0x2e8(%rbp), %rcx
14590761c:     	shlq	$0x3, %rdx
145907620:     	movl	$0x8, %r8d
145907626:     	callq	0x1400021d0 <.text+0x11d0>
14590762b:     	movq	0x378(%rbp), %rax
145907632:     	cmpq	0xd8(%rax), %r13
145907639:     	jae	0x145907691 <.text+0x5906691>
14590763b:     	movq	0x378(%rbp), %rax
145907642:     	movq	0xd0(%rax), %rax
145907649:     	movq	0x18(%rax,%r15), %rcx
14590764e:     	cmpb	$0x0, 0x39(%rcx)
145907652:     	je	0x145907691 <.text+0x5906691>
145907654:     	addq	%r15, %rax
145907657:     	movss	0x60(%rax), %xmm0
14590765c:     	movq	0x378(%rbp), %rcx
145907663:     	ucomiss	0x9ec(%rcx), %xmm0
14590766a:     	jbe	0x145907691 <.text+0x5906691>
14590766c:     	movss	0x64(%rax), %xmm1
145907671:     	movaps	%xmm1, %xmm2
145907674:     	minss	%xmm0, %xmm2
145907678:     	movaps	%xmm2, %xmm0
14590767b:     	cmpunordss	%xmm2, %xmm0
145907680:     	movaps	%xmm0, %xmm3
145907683:     	andnps	%xmm2, %xmm3
145907686:     	andps	%xmm1, %xmm0
145907689:     	orps	%xmm3, %xmm0
14590768c:     	movss	%xmm0, 0x64(%rax)
145907691:     	cmpb	$0x0, 0x39(%rsi)
145907695:     	je	0x1459076fa <.text+0x59066fa>
145907697:     	movq	0x378(%rbp), %rax
14590769e:     	movq	0xd8(%rax), %rdx
1459076a5:     	cmpq	%rdx, %r13
1459076a8:     	jae	0x145911960 <.text+0x5910960>
1459076ae:     	movq	0xd0(%rax), %rax
1459076b5:     	movzwl	0x20(%rax,%r15), %ecx
1459076bb:     	xorps	%xmm13, %xmm13
1459076bf:     	cvtsi2ss	%ecx, %xmm13
1459076c4:     	mulss	0x493863(%rip), %xmm13  # 0x145d9af30
1459076cd:     	addss	0x68(%rax,%r15), %xmm13
1459076d4:     	movaps	%xmm13, %xmm0
1459076d8:     	callq	0x145bc97c3 <.text+0x5bc87c3>
1459076dd:     	movaps	%xmm0, %xmm14
1459076e1:     	movaps	%xmm13, %xmm0
1459076e5:     	callq	0x145bc97bd <.text+0x5bc87bd>
1459076ea:     	unpcklps	%xmm0, %xmm14           # xmm14 = xmm14[0],xmm0[0],xmm14[1],xmm0[1]
1459076ee:     	mulps	0x1570e5a(%rip), %xmm14 # 0x146e78550
1459076f6:     	addps	%xmm14, %xmm12
1459076fa:     	movaps	%xmm10, %xmm0
1459076fe:     	subps	%xmm12, %xmm0
145907702:     	mulps	%xmm0, %xmm0
145907705:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
145907709:     	addss	%xmm0, %xmm1
14590770d:     	xorps	%xmm0, %xmm0
145907710:     	sqrtss	%xmm1, %xmm0
145907714:     	ucomiss	0x49377d(%rip), %xmm0   # 0x145d9ae98
14590771b:     	jbe	0x145904f97 <.text+0x5903f97>
145907721:     	movaps	%xmm0, %xmm1
145907724:     	addss	0x1570e34(%rip), %xmm1  # 0x146e78560
14590772c:     	divss	%xmm0, %xmm1
145907730:     	subps	%xmm10, %xmm12
145907734:     	movshdup	%xmm12, %xmm3           # xmm3 = xmm12[1,1,3,3]
145907739:     	mulss	%xmm1, %xmm12
14590773e:     	addss	%xmm10, %xmm12
145907743:     	movshdup	%xmm10, %xmm0           # xmm0 = xmm10[1,1,3,3]
145907748:     	mulss	%xmm1, %xmm3
14590774c:     	addss	%xmm0, %xmm3
145907750:     	movl	0x370(%rbp), %eax
145907756:     	movb	%al, 0x387(%rbp)
14590775c:     	movss	0x328(%rbp), %xmm0
145907764:     	movss	%xmm0, 0x20(%rsp)
14590776a:     	movq	0x378(%rbp), %rcx
145907771:     	movq	%r13, %rdx
145907774:     	movaps	%xmm12, %xmm2
145907778:     	callq	0x14592ea80 <.text+0x592da80>
14590777d:     	nop
14590777e:     	jmp	0x145904f97 <.text+0x5903f97>
145907783:     	movq	%rdx, 0x58(%rbp)
145907787:     	movq	$0x8, 0x20(%rsp)
145907790:     	movl	$0x1, %edx
145907795:     	movl	$0x8, %r9d
14590779b:     	leaq	0xa0(%rbp), %rcx
1459077a2:     	movq	%rsi, %r8
1459077a5:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459077aa:     	nop
1459077ab:     	movq	0xa8(%rbp), %r14
1459077b2:     	movq	0xb0(%rbp), %rdi
1459077b9:     	leaq	(%r14,%rdi,8), %rcx
1459077bd:     	movq	0x2a0(%rbp), %rdx
1459077c4:     	movq	0x88(%rbp), %r8
1459077cb:     	callq	0x145bc977b <.text+0x5bc877b>
1459077d0:     	movss	0x465b93(%rip), %xmm15  # 0x145d6d36c
1459077d9:     	movq	0x360(%rbp), %rsi
1459077e0:     	movq	0x58(%rbp), %rdx
1459077e4:     	testq	%rdx, %rdx
1459077e7:     	jne	0x145905e55 <.text+0x5904e55>
1459077ed:     	jmp	0x145905e6b <.text+0x5904e6b>

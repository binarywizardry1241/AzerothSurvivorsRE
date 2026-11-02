
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145483fc0:     	pushq	%rbp
145483fc1:     	pushq	%r15
145483fc3:     	pushq	%r14
145483fc5:     	pushq	%r13
145483fc7:     	pushq	%r12
145483fc9:     	pushq	%rsi
145483fca:     	pushq	%rdi
145483fcb:     	pushq	%rbx
145483fcc:     	subq	$0xf8, %rsp
145483fd3:     	leaq	0x80(%rsp), %rbp
145483fdb:     	movq	$-0x2, 0x70(%rbp)
145483fe3:     	movq	%rcx, %rdi
145483fe6:     	movb	%r8b, 0x6e(%rbp)
145483fea:     	cmpb	$0xb, %r8b
145483fee:     	ja	0x1454846f5 <.text+0x54836f5>
145483ff4:     	movzbl	%r8b, %eax
145483ff8:     	movl	$0xbbe, %ecx            # imm = 0xBBE
145483ffd:     	btl	%eax, %ecx
145484000:     	jae	0x1454846f5 <.text+0x54836f5>
145484006:     	movl	%r9d, %r12d
145484009:     	movq	0x8(%rdx), %rcx
14548400d:     	movq	%rdx, -0x8(%rbp)
145484011:     	movq	0x10(%rdx), %rax
145484015:     	shlq	$0x4, %rax
145484019:     	addq	%rcx, %rax
14548401c:     	movq	%rcx, (%rbp)
145484020:     	movq	%rcx, 0x18(%rbp)
145484024:     	movq	%rax, 0x20(%rbp)
145484028:     	leaq	0x6e(%rbp), %rax
14548402c:     	movq	%rax, 0x28(%rbp)
145484030:     	leaq	-0x60(%rbp), %rcx
145484034:     	leaq	0x18(%rbp), %rdx
145484038:     	callq	0x14553b8e0 <.text+0x553a8e0>
14548403d:     	nop
14548403e:     	movq	-0x58(%rbp), %rax
145484042:     	movq	%rax, 0x38(%rbp)
145484046:     	movq	-0x50(%rbp), %rsi
14548404a:     	leaq	0x47(%rbp), %rax
14548404e:     	movq	%rax, 0x18(%rbp)
145484052:     	cmpq	$0x2, %rsi
145484056:     	jae	0x145484727 <.text+0x5483727>
14548405c:     	movq	%rdi, -0x20(%rbp)
145484060:     	movq	$0x0, 0x18(%rbp)
145484068:     	movq	$0x8, 0x20(%rbp)
145484070:     	movq	$0x0, 0x28(%rbp)
145484078:     	movq	-0x60(%rbp), %rax
14548407c:     	movq	%rax, 0x10(%rbp)
145484080:     	testq	%rsi, %rsi
145484083:     	je	0x14548468c <.text+0x548368c>
145484089:     	leaq	(%rsi,%rsi,2), %rax
14548408d:     	movq	0x38(%rbp), %rcx
145484091:     	leaq	(%rcx,%rax,8), %rax
145484095:     	movq	%rax, -0x28(%rbp)
145484099:     	movl	$0x5df, %r14d           # imm = 0x5DF
14548409f:     	movl	%r12d, 0xc(%rbp)
1454840a3:     	jmp	0x1454840c2 <.text+0x54830c2>
1454840a5:     	nopw	%cs:(%rax,%rax)
1454840b0:     	movq	-0x30(%rbp), %rcx
1454840b4:     	addq	$0x18, %rcx
1454840b8:     	cmpq	-0x28(%rbp), %rcx
1454840bc:     	je	0x14548468c <.text+0x548368c>
1454840c2:     	movq	(%rcx), %rax
1454840c5:     	movq	%rax, -0x40(%rbp)
1454840c9:     	testq	%rax, %rax
1454840cc:     	je	0x14548468c <.text+0x548368c>
1454840d2:     	movq	%rcx, -0x30(%rbp)
1454840d6:     	movzbl	0x10(%rcx), %eax
1454840da:     	movb	%al, 0x6c(%rbp)
1454840dd:     	testb	%al, %al
1454840df:     	je	0x1454840b0 <.text+0x54830b0>
1454840e1:     	xorl	%eax, %eax
1454840e3:     	jmp	0x14548410a <.text+0x548310a>
1454840e5:     	movq	0x60(%rbp), %rax
1454840e9:     	movq	%rsi, (%rax,%rbx)
1454840ed:     	movb	$0x1, 0x8(%rax,%rbx)
1454840f2:     	incq	%rdi
1454840f5:     	movq	%rdi, 0x28(%rbp)
1454840f9:     	nopl	(%rax)
145484100:     	movl	0x8(%rbp), %eax
145484103:     	incb	%al
145484105:     	cmpb	0x6c(%rbp), %al
145484108:     	je	0x1454840b0 <.text+0x54830b0>
14548410a:     	movl	%eax, 0x8(%rbp)
14548410d:     	movzbl	0x6e(%rbp), %eax
145484111:     	movq	%rax, -0x18(%rbp)
145484115:     	decl	%eax
145484117:     	movl	%eax, 0x48(%rbp)
14548411a:     	cmpb	$0xa, %al
14548411c:     	ja	0x145484100 <.text+0x5483100>
14548411e:     	movzbl	0x48(%rbp), %ecx
145484122:     	btl	%ecx, %r14d
145484126:     	jae	0x145484100 <.text+0x5483100>
145484128:     	movq	-0x40(%rbp), %rax
14548412c:     	movq	(%rax), %rbx
14548412f:     	movq	0x8(%rax), %r15
145484133:     	leaq	0x157173e(%rip), %rax   # 0x1469f5878
14548413a:     	movq	%rcx, 0x58(%rbp)
14548413e:     	movq	(%rax,%rcx,8), %rsi
145484142:     	movq	0x38(%rsi), %rax
145484146:     	testq	%rax, %rax
145484149:     	je	0x14548418e <.text+0x548318e>
14548414b:     	movq	0x30(%rsi), %r13
14548414f:     	imulq	$0x68, %rax, %rdi
145484153:     	jmp	0x14548416a <.text+0x548316a>
145484155:     	nopw	%cs:(%rax,%rax)
145484160:     	addq	$0x68, %r13
145484164:     	addq	$-0x68, %rdi
145484168:     	je	0x14548418e <.text+0x548318e>
14548416a:     	cmpq	%r15, 0x8(%r13)
14548416e:     	jne	0x145484160 <.text+0x5483160>
145484170:     	movq	(%r13), %rcx
145484174:     	movq	%rbx, %rdx
145484177:     	movq	%r15, %r8
14548417a:     	callq	0x1457731e7 <.text+0x57721e7>
14548417f:     	testl	%eax, %eax
145484181:     	jne	0x145484160 <.text+0x5483160>
145484183:     	xorl	%esi, %esi
145484185:     	movq	0x58(%rbp), %rdi
145484189:     	jmp	0x14548422c <.text+0x548322c>
14548418e:     	movq	0x78(%rsi), %rax
145484192:     	testq	%rax, %rax
145484195:     	je	0x1454841de <.text+0x54831de>
145484197:     	movq	0x70(%rsi), %r13
14548419b:     	imulq	$0x68, %rax, %rdi
14548419f:     	jmp	0x1454841ba <.text+0x54831ba>
1454841a1:     	nopw	%cs:(%rax,%rax)
1454841b0:     	addq	$0x68, %r13
1454841b4:     	addq	$-0x68, %rdi
1454841b8:     	je	0x1454841de <.text+0x54831de>
1454841ba:     	cmpq	%r15, 0x8(%r13)
1454841be:     	jne	0x1454841b0 <.text+0x54831b0>
1454841c0:     	movq	(%r13), %rcx
1454841c4:     	movq	%rbx, %rdx
1454841c7:     	movq	%r15, %r8
1454841ca:     	callq	0x1457731e7 <.text+0x57721e7>
1454841cf:     	testl	%eax, %eax
1454841d1:     	jne	0x1454841b0 <.text+0x54831b0>
1454841d3:     	movl	$0x1, %esi
1454841d8:     	movq	0x58(%rbp), %rdi
1454841dc:     	jmp	0x14548422c <.text+0x548322c>
1454841de:     	movq	0xb8(%rsi), %rax
1454841e5:     	testq	%rax, %rax
1454841e8:     	movq	0x58(%rbp), %rdi
1454841ec:     	je	0x145484100 <.text+0x5483100>
1454841f2:     	movq	0xb0(%rsi), %r13
1454841f9:     	imulq	$0x68, %rax, %rsi
1454841fd:     	jmp	0x14548420e <.text+0x548320e>
1454841ff:     	nop
145484200:     	addq	$0x68, %r13
145484204:     	addq	$-0x68, %rsi
145484208:     	je	0x145484100 <.text+0x5483100>
14548420e:     	cmpq	%r15, 0x8(%r13)
145484212:     	jne	0x145484200 <.text+0x5483200>
145484214:     	movq	(%r13), %rcx
145484218:     	movq	%rbx, %rdx
14548421b:     	movq	%r15, %r8
14548421e:     	callq	0x1457731e7 <.text+0x57721e7>
145484223:     	testl	%eax, %eax
145484225:     	jne	0x145484200 <.text+0x5483200>
145484227:     	movl	$0x2, %esi
14548422c:     	movq	%rbx, 0x30(%rbp)
145484230:     	movq	0x20(%rbp), %rax
145484234:     	movq	%rax, 0x60(%rbp)
145484238:     	movq	0x28(%rbp), %r8
14548423c:     	testq	%r8, %r8
14548423f:     	movq	%r8, 0x50(%rbp)
145484243:     	je	0x145484257 <.text+0x5483257>
145484245:     	movl	%r8d, %eax
145484248:     	andl	$0x3, %eax
14548424b:     	cmpq	$0x4, %r8
14548424f:     	jae	0x145484271 <.text+0x5483271>
145484251:     	xorl	%edx, %edx
145484253:     	xorl	%ecx, %ecx
145484255:     	jmp	0x1454842c1 <.text+0x54832c1>
145484257:     	testl	%r12d, %r12d
14548425a:     	je	0x145484100 <.text+0x5483100>
145484260:     	xorl	%eax, %eax
145484262:     	cmpb	0x62(%r13), %al
145484266:     	jae	0x145484100 <.text+0x5483100>
14548426c:     	jmp	0x145484360 <.text+0x5483360>
145484271:     	andq	$-0x4, %r8
145484275:     	movq	0x60(%rbp), %rcx
145484279:     	leaq	0x38(%rcx), %r9
14548427d:     	xorl	%edx, %edx
14548427f:     	xorl	%ecx, %ecx
145484281:     	nopw	%cs:(%rax,%rax)
145484290:     	movzbl	-0x30(%r9), %r10d
145484295:     	addl	%ecx, %r10d
145484298:     	movzbl	-0x20(%r9), %ecx
14548429d:     	movzbl	-0x10(%r9), %r11d
1454842a2:     	addl	%ecx, %r11d
1454842a5:     	addl	%r10d, %r11d
1454842a8:     	movzbl	(%r9), %ecx
1454842ac:     	addl	%r11d, %ecx
1454842af:     	addq	$0x4, %rdx
1454842b3:     	addq	$0x40, %r9
1454842b7:     	cmpq	%rdx, %r8
1454842ba:     	jne	0x145484290 <.text+0x5483290>
1454842bc:     	testq	%rax, %rax
1454842bf:     	je	0x1454842f1 <.text+0x54832f1>
1454842c1:     	shlq	$0x4, %rdx
1454842c5:     	movq	0x60(%rbp), %r8
1454842c9:     	addq	%r8, %rdx
1454842cc:     	addq	$0x8, %rdx
1454842d0:     	shll	$0x4, %eax
1454842d3:     	xorl	%r8d, %r8d
1454842d6:     	nopw	%cs:(%rax,%rax)
1454842e0:     	movzbl	(%rdx,%r8), %r9d
1454842e5:     	addl	%r9d, %ecx
1454842e8:     	addq	$0x10, %r8
1454842ec:     	cmpq	%r8, %rax
1454842ef:     	jne	0x1454842e0 <.text+0x54832e0>
1454842f1:     	cmpl	%r12d, %ecx
1454842f4:     	jae	0x145484100 <.text+0x5483100>
1454842fa:     	movl	%r12d, %r14d
1454842fd:     	movq	%rsi, %r12
145484300:     	movq	0x50(%rbp), %rsi
145484304:     	shlq	$0x4, %rsi
145484308:     	xorl	%edi, %edi
14548430a:     	movq	0x30(%rbp), %rbx
14548430e:     	jmp	0x145484319 <.text+0x5483319>
145484310:     	addq	$0x10, %rdi
145484314:     	cmpq	%rdi, %rsi
145484317:     	je	0x145484344 <.text+0x5483344>
145484319:     	movq	0x60(%rbp), %rax
14548431d:     	movq	(%rax,%rdi), %rax
145484321:     	cmpq	%r15, 0x8(%rax)
145484325:     	jne	0x145484310 <.text+0x5483310>
145484327:     	movq	(%rax), %rcx
14548432a:     	movq	%rbx, %rdx
14548432d:     	movq	%r15, %r8
145484330:     	callq	0x1457731e7 <.text+0x57721e7>
145484335:     	testl	%eax, %eax
145484337:     	jne	0x145484310 <.text+0x5483310>
145484339:     	movq	0x60(%rbp), %rax
14548433d:     	movzbl	0x8(%rax,%rdi), %eax
145484342:     	jmp	0x145484346 <.text+0x5483346>
145484344:     	xorl	%eax, %eax
145484346:     	movq	0x58(%rbp), %rdi
14548434a:     	movq	%r12, %rsi
14548434d:     	movl	%r14d, %r12d
145484350:     	movl	$0x5df, %r14d           # imm = 0x5DF
145484356:     	cmpb	0x62(%r13), %al
14548435a:     	jae	0x145484100 <.text+0x5483100>
145484360:     	movzbl	0x60(%r13), %r9d
145484365:     	movl	$0x0, 0x4c(%rbp)
14548436c:     	movl	0x48(%rbp), %ecx
14548436f:     	cmpb	$0xa, %cl
145484372:     	ja	0x145484392 <.text+0x5483392>
145484374:     	movq	0x50(%rbp), %r8
145484378:     	testq	%r8, %r8
14548437b:     	sete	%al
14548437e:     	movl	$0x5df, %edx            # imm = 0x5DF
145484383:     	shrl	%cl, %edx
145484385:     	notb	%dl
145484387:     	orb	%al, %dl
145484389:     	testb	$0x1, %dl
14548438c:     	je	0x14548444c <.text+0x548344c>
145484392:     	movzbl	%r9b, %eax
145484396:     	leal	(%rax,%rax,4), %eax
145484399:     	cmpl	%eax, 0x4c(%rbp)
14548439c:     	movl	0xc(%rbp), %r12d
1454843a0:     	jb	0x145484100 <.text+0x5483100>
1454843a6:     	leaq	0x18(%rbp), %rcx
1454843aa:     	movq	-0x18(%rbp), %rdx
1454843ae:     	movq	0x30(%rbp), %r8
1454843b2:     	movq	%r15, %r9
1454843b5:     	callq	0x1454834e0 <.text+0x54824e0>
1454843ba:     	testq	%rax, %rax
1454843bd:     	jne	0x145484100 <.text+0x5483100>
1454843c3:     	movq	0x50(%r13), %rbx
1454843c7:     	testq	%rbx, %rbx
1454843ca:     	je	0x14548452c <.text+0x548352c>
1454843d0:     	movq	0x58(%r13), %rsi
1454843d4:     	movq	-0x18(%rbp), %rcx
1454843d8:     	movq	%rbx, %rdx
1454843db:     	movq	%rsi, %r8
1454843de:     	callq	0x145486f60 <.text+0x5485f60>
1454843e3:     	testq	%rdx, %rdx
1454843e6:     	je	0x145484100 <.text+0x5483100>
1454843ec:     	movq	%rdx, %r13
1454843ef:     	movq	0x50(%rbp), %rdi
1454843f3:     	testq	%rdi, %rdi
1454843f6:     	je	0x14548451c <.text+0x548351c>
1454843fc:     	shlq	$0x4, %rdi
145484400:     	xorl	%r14d, %r14d
145484403:     	jmp	0x14548441d <.text+0x548341d>
145484405:     	nopw	%cs:(%rax,%rax)
145484410:     	addq	$0x10, %r14
145484414:     	cmpq	%r14, %rdi
145484417:     	je	0x145484504 <.text+0x5483504>
14548441d:     	movq	0x60(%rbp), %rax
145484421:     	movq	(%rax,%r14), %rax
145484425:     	cmpq	%rsi, 0x8(%rax)
145484429:     	jne	0x145484410 <.text+0x5483410>
14548442b:     	movq	(%rax), %rcx
14548442e:     	movq	%rbx, %rdx
145484431:     	movq	%rsi, %r8
145484434:     	callq	0x1457731e7 <.text+0x57721e7>
145484439:     	testl	%eax, %eax
14548443b:     	jne	0x145484410 <.text+0x5483410>
14548443d:     	movq	0x60(%rbp), %rax
145484441:     	movzbl	0x8(%rax,%r14), %eax
145484447:     	jmp	0x145484506 <.text+0x5483506>
14548444c:     	shll	$0x6, %esi
14548444f:     	leaq	0x1571422(%rip), %rax   # 0x1469f5878
145484456:     	addq	(%rax,%rdi,8), %rsi
14548445a:     	xorl	%r12d, %r12d
14548445d:     	movl	$0x0, 0x4c(%rbp)
145484464:     	movq	%rsi, -0x10(%rbp)
145484468:     	movb	%r9b, 0x6f(%rbp)
14548446c:     	jmp	0x145484493 <.text+0x5483493>
14548446e:     	nop
145484470:     	movl	$0x5df, %r14d           # imm = 0x5DF
145484476:     	movq	0x50(%rbp), %r8
14548447a:     	movq	0x58(%rbp), %rdi
14548447e:     	movq	-0x10(%rbp), %rsi
145484482:     	movzbl	0x6f(%rbp), %r9d
145484487:     	incq	%r12
14548448a:     	cmpq	%r8, %r12
14548448d:     	je	0x145484392 <.text+0x5483392>
145484493:     	movq	%r12, %rdx
145484496:     	shlq	$0x4, %rdx
14548449a:     	movq	0x60(%rbp), %rax
14548449e:     	movq	(%rax,%rdx), %rax
1454844a2:     	cmpb	%r9b, 0x60(%rax)
1454844a6:     	jae	0x145484487 <.text+0x5483487>
1454844a8:     	movq	0x38(%rsi), %rcx
1454844ac:     	testq	%rcx, %rcx
1454844af:     	je	0x145484487 <.text+0x5483487>
1454844b1:     	addq	0x60(%rbp), %rdx
1454844b5:     	movq	%rdx, -0x38(%rbp)
1454844b9:     	movq	0x30(%rsi), %rdi
1454844bd:     	imulq	$0x68, %rcx, %r14
1454844c1:     	movq	(%rax), %rcx
1454844c4:     	movq	%rcx, -0x48(%rbp)
1454844c8:     	movq	0x8(%rax), %rbx
1454844cc:     	xorl	%esi, %esi
1454844ce:     	jmp	0x1454844d9 <.text+0x54834d9>
1454844d0:     	addq	$0x68, %rsi
1454844d4:     	cmpq	%rsi, %r14
1454844d7:     	je	0x145484470 <.text+0x5483470>
1454844d9:     	cmpq	%rbx, 0x8(%rdi,%rsi)
1454844de:     	jne	0x1454844d0 <.text+0x54834d0>
1454844e0:     	movq	(%rdi,%rsi), %rcx
1454844e4:     	movq	-0x48(%rbp), %rdx
1454844e8:     	movq	%rbx, %r8
1454844eb:     	callq	0x1457731e7 <.text+0x57721e7>
1454844f0:     	testl	%eax, %eax
1454844f2:     	jne	0x1454844d0 <.text+0x54834d0>
1454844f4:     	movq	-0x38(%rbp), %rax
1454844f8:     	movzbl	0x8(%rax), %eax
1454844fc:     	addl	%eax, 0x4c(%rbp)
1454844ff:     	jmp	0x145484470 <.text+0x5483470>
145484504:     	xorl	%eax, %eax
145484506:     	movl	$0x5df, %r14d           # imm = 0x5DF
14548450c:     	cmpb	0x62(%r13), %al
145484510:     	movq	0x58(%rbp), %rdi
145484514:     	jb	0x145484100 <.text+0x5483100>
14548451a:     	jmp	0x14548452c <.text+0x548352c>
14548451c:     	xorl	%eax, %eax
14548451e:     	cmpb	0x62(%r13), %al
145484522:     	movq	0x58(%rbp), %rdi
145484526:     	jb	0x145484100 <.text+0x5483100>
14548452c:     	cmpb	$0xa, 0x48(%rbp)
145484530:     	ja	0x145484100 <.text+0x5483100>
145484536:     	btl	%edi, %r14d
14548453a:     	jae	0x145484100 <.text+0x5483100>
145484540:     	leaq	0x1571331(%rip), %rax   # 0x1469f5878
145484547:     	movq	(%rax,%rdi,8), %rbx
14548454b:     	movq	0x38(%rbx), %rax
14548454f:     	testq	%rax, %rax
145484552:     	je	0x145484588 <.text+0x5483588>
145484554:     	movq	0x30(%rbx), %rsi
145484558:     	imulq	$0x68, %rax, %rdi
14548455c:     	jmp	0x14548456a <.text+0x548356a>
14548455e:     	nop
145484560:     	addq	$0x68, %rsi
145484564:     	addq	$-0x68, %rdi
145484568:     	je	0x145484588 <.text+0x5483588>
14548456a:     	cmpq	%r15, 0x8(%rsi)
14548456e:     	jne	0x145484560 <.text+0x5483560>
145484570:     	movq	(%rsi), %rcx
145484573:     	movq	0x30(%rbp), %rdx
145484577:     	movq	%r15, %r8
14548457a:     	callq	0x1457731e7 <.text+0x57721e7>
14548457f:     	testl	%eax, %eax
145484581:     	jne	0x145484560 <.text+0x5483560>
145484583:     	jmp	0x145484617 <.text+0x5483617>
145484588:     	movq	0x78(%rbx), %rax
14548458c:     	testq	%rax, %rax
14548458f:     	je	0x1454845c5 <.text+0x54835c5>
145484591:     	movq	0x70(%rbx), %rsi
145484595:     	imulq	$0x68, %rax, %rdi
145484599:     	jmp	0x1454845aa <.text+0x54835aa>
14548459b:     	nopl	(%rax,%rax)
1454845a0:     	addq	$0x68, %rsi
1454845a4:     	addq	$-0x68, %rdi
1454845a8:     	je	0x1454845c5 <.text+0x54835c5>
1454845aa:     	cmpq	%r15, 0x8(%rsi)
1454845ae:     	jne	0x1454845a0 <.text+0x54835a0>
1454845b0:     	movq	(%rsi), %rcx
1454845b3:     	movq	0x30(%rbp), %rdx
1454845b7:     	movq	%r15, %r8
1454845ba:     	callq	0x1457731e7 <.text+0x57721e7>
1454845bf:     	testl	%eax, %eax
1454845c1:     	jne	0x1454845a0 <.text+0x54835a0>
1454845c3:     	jmp	0x145484617 <.text+0x5483617>
1454845c5:     	movq	0xb8(%rbx), %rax
1454845cc:     	testq	%rax, %rax
1454845cf:     	je	0x145484100 <.text+0x5483100>
1454845d5:     	movq	0xb0(%rbx), %rsi
1454845dc:     	imulq	$0x68, %rax, %rdi
1454845e0:     	jmp	0x1454845fe <.text+0x54835fe>
1454845e2:     	nopw	%cs:(%rax,%rax)
1454845f0:     	addq	$0x68, %rsi
1454845f4:     	addq	$-0x68, %rdi
1454845f8:     	je	0x145484100 <.text+0x5483100>
1454845fe:     	cmpq	%r15, 0x8(%rsi)
145484602:     	jne	0x1454845f0 <.text+0x54835f0>
145484604:     	movq	(%rsi), %rcx
145484607:     	movq	0x30(%rbp), %rdx
14548460b:     	movq	%r15, %r8
14548460e:     	callq	0x1457731e7 <.text+0x57721e7>
145484613:     	testl	%eax, %eax
145484615:     	jne	0x1454845f0 <.text+0x54835f0>
145484617:     	movq	0x50(%rbp), %rax
14548461b:     	movq	%rax, %rbx
14548461e:     	shlq	$0x4, %rbx
145484622:     	testq	%rax, %rax
145484625:     	je	0x145484667 <.text+0x5483667>
145484627:     	xorl	%edi, %edi
145484629:     	jmp	0x145484639 <.text+0x5483639>
14548462b:     	nopl	(%rax,%rax)
145484630:     	addq	$0x10, %rdi
145484634:     	cmpq	%rdi, %rbx
145484637:     	je	0x145484667 <.text+0x5483667>
145484639:     	movq	0x60(%rbp), %rax
14548463d:     	movq	(%rax,%rdi), %rax
145484641:     	cmpq	%r15, 0x8(%rax)
145484645:     	jne	0x145484630 <.text+0x5483630>
145484647:     	movq	(%rax), %rcx
14548464a:     	movq	0x30(%rbp), %rdx
14548464e:     	movq	%r15, %r8
145484651:     	callq	0x1457731e7 <.text+0x57721e7>
145484656:     	testl	%eax, %eax
145484658:     	jne	0x145484630 <.text+0x5483630>
14548465a:     	movq	0x60(%rbp), %rax
14548465e:     	incb	0x8(%rax,%rdi)
145484662:     	jmp	0x145484100 <.text+0x5483100>
145484667:     	movq	0x50(%rbp), %rdi
14548466b:     	cmpq	0x18(%rbp), %rdi
14548466f:     	jne	0x1454840e5 <.text+0x54830e5>
145484675:     	leaq	0x18(%rbp), %rcx
145484679:     	callq	0x145774860 <.text+0x5773860>
14548467e:     	nop
14548467f:     	movq	0x20(%rbp), %rax
145484683:     	movq	%rax, 0x60(%rbp)
145484687:     	jmp	0x1454840e5 <.text+0x54830e5>
14548468c:     	movq	0x10(%rbp), %rax
145484690:     	testq	%rax, %rax
145484693:     	je	0x1454846ac <.text+0x54836ac>
145484695:     	shlq	$0x3, %rax
145484699:     	leaq	(%rax,%rax,2), %rdx
14548469d:     	movl	$0x8, %r8d
1454846a3:     	movq	0x38(%rbp), %rcx
1454846a7:     	callq	0x1400021d0 <.text+0x11d0>
1454846ac:     	movq	0x28(%rbp), %rax
1454846b0:     	movq	-0x20(%rbp), %rdi
1454846b4:     	movq	%rax, 0x10(%rdi)
1454846b8:     	movups	0x18(%rbp), %xmm0
1454846bc:     	movups	%xmm0, (%rdi)
1454846bf:     	movq	-0x8(%rbp), %rax
1454846c3:     	movq	(%rax), %rdx
1454846c6:     	testq	%rdx, %rdx
1454846c9:     	je	0x1454846de <.text+0x54836de>
1454846cb:     	shlq	$0x4, %rdx
1454846cf:     	movl	$0x8, %r8d
1454846d5:     	movq	(%rbp), %rcx
1454846d9:     	callq	0x1400021d0 <.text+0x11d0>
1454846de:     	movq	%rdi, %rax
1454846e1:     	addq	$0xf8, %rsp
1454846e8:     	popq	%rbx
1454846e9:     	popq	%rdi
1454846ea:     	popq	%rsi
1454846eb:     	popq	%r12
1454846ed:     	popq	%r13
1454846ef:     	popq	%r14
1454846f1:     	popq	%r15
1454846f3:     	popq	%rbp
1454846f4:     	retq
1454846f5:     	movq	$0x0, (%rdi)
1454846fc:     	movq	$0x8, 0x8(%rdi)
145484704:     	movq	$0x0, 0x10(%rdi)
14548470c:     	movq	%rdx, %rax
14548470f:     	movq	(%rdx), %rdx
145484712:     	testq	%rdx, %rdx
145484715:     	je	0x1454846de <.text+0x54836de>
145484717:     	movq	0x8(%rax), %rcx
14548471b:     	shlq	$0x4, %rdx
14548471f:     	movl	$0x8, %r8d
145484725:     	jmp	0x1454846d9 <.text+0x54836d9>
145484727:     	cmpq	$0x15, %rsi
14548472b:     	jae	0x145484748 <.text+0x5483748>
14548472d:     	leaq	0x18(%rbp), %r9
145484731:     	movl	$0x1, %r8d
145484737:     	movq	0x38(%rbp), %rcx
14548473b:     	movq	%rsi, %rdx
14548473e:     	callq	0x145507670 <.text+0x5506670>
145484743:     	jmp	0x14548405c <.text+0x548305c>
145484748:     	movb	$0x1, 0x6d(%rbp)
14548474c:     	leaq	0x18(%rbp), %r8
145484750:     	movq	0x38(%rbp), %rcx
145484754:     	movq	%rsi, %rdx
145484757:     	callq	0x145481d00 <.text+0x5480d00>
14548475c:     	nop
14548475d:     	jmp	0x14548405c <.text+0x548305c>

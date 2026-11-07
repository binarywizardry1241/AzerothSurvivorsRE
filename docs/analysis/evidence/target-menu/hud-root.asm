
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140082d40:     	pushq	%rbp
140082d41:     	pushq	%r15
140082d43:     	pushq	%r14
140082d45:     	pushq	%r13
140082d47:     	pushq	%r12
140082d49:     	pushq	%rsi
140082d4a:     	pushq	%rdi
140082d4b:     	pushq	%rbx
140082d4c:     	subq	$0x368, %rsp            # imm = 0x368
140082d53:     	leaq	0x80(%rsp), %rbp
140082d5b:     	movapd	%xmm10, 0x2d0(%rbp)
140082d64:     	movapd	%xmm9, 0x2c0(%rbp)
140082d6d:     	movapd	%xmm8, 0x2b0(%rbp)
140082d76:     	movapd	%xmm7, 0x2a0(%rbp)
140082d7e:     	movapd	%xmm6, 0x290(%rbp)
140082d86:     	movq	$-0x2, 0x288(%rbp)
140082d91:     	movq	%rdx, %rbx
140082d94:     	movq	%rcx, %r12
140082d97:     	movq	0x390(%rbp), %rdx
140082d9e:     	movq	0x360(%rbp), %rax
140082da5:     	cmpb	$0x0, 0xe8(%rbx)
140082dac:     	je	0x140082e29 <.text+0x81e29>
140082dae:     	cmpq	$0x0, (%r8)
140082db2:     	je	0x1400833b3 <.text+0x823b3>
140082db8:     	movupd	(%r8), %xmm0
140082dbd:     	movupd	0x10(%r8), %xmm1
140082dc3:     	movapd	%xmm1, -0x30(%rbp)
140082dc8:     	movapd	%xmm0, -0x40(%rbp)
140082dcd:     	movq	(%rax), %r8
140082dd0:     	movq	0x8(%rax), %rax
140082dd4:     	movq	0xf8(%r8), %rcx
140082ddb:     	movq	0x100(%r8), %rdx
140082de2:     	cmpb	$0x0, 0x108(%r8)
140082dea:     	je	0x140082e86 <.text+0x81e86>
140082df0:     	shlq	$0x2, %rdx
140082df4:     	xorl	%r8d, %r8d
140082df7:     	nopw	(%rax,%rax)
140082e00:     	cmpq	%r8, %rdx
140082e03:     	je	0x140083032 <.text+0x82032>
140082e09:     	movl	(%rcx,%r8), %r10d
140082e0d:     	movq	0x1a8(%rax), %r11
140082e14:     	leaq	(%r10,%r10,8), %r10
140082e18:     	addq	$0x4, %r8
140082e1c:     	cmpq	$0x0, 0x10(%r11,%r10,8)
140082e22:     	je	0x140082e00 <.text+0x81e00>
140082e24:     	jmp	0x140082eb8 <.text+0x81eb8>
140082e29:     	movq	(%rax), %rcx
140082e2c:     	movq	0x8(%rax), %rbx
140082e30:     	movq	0xf8(%rcx), %r14
140082e37:     	movq	0x100(%rcx), %rax
140082e3e:     	leaq	(%r14,%rax,4), %r15
140082e42:     	movzbl	0x108(%rcx), %r8d
140082e4a:     	movq	0x20(%r12), %r9
140082e4f:     	movupd	(%r12), %xmm6
140082e55:     	movupd	0x10(%r12), %xmm7
140082e5c:     	movq	0x10(%r12), %r10
140082e61:     	movl	$0x8, %edi
140082e66:     	xorl	%r12d, %r12d
140082e69:     	leaq	0x5893d70(%rip), %r11   # 0x145916be0
140082e70:     	xorl	%esi, %esi
140082e72:     	movl	$0x8, %r13d
140082e78:     	testb	%r8b, %r8b
140082e7b:     	je	0x140083320 <.text+0x82320>
140082e81:     	jmp	0x14008337a <.text+0x8237a>
140082e86:     	shlq	$0x2, %rdx
140082e8a:     	xorl	%r8d, %r8d
140082e8d:     	nopl	(%rax)
140082e90:     	cmpq	%r8, %rdx
140082e93:     	je	0x140083032 <.text+0x82032>
140082e99:     	movl	(%rcx,%r8), %r10d
140082e9d:     	movq	0x108(%rax), %r11
140082ea4:     	leaq	(%r10,%r10,4), %r10
140082ea8:     	shlq	$0x5, %r10
140082eac:     	addq	$0x4, %r8
140082eb0:     	cmpq	$0x0, 0x58(%r11,%r10)
140082eb6:     	je	0x140082e90 <.text+0x81e90>
140082eb8:     	cmpb	$-0x1, 0x60(%rbx)
140082ebc:     	je	0x1400833b3 <.text+0x823b3>
140082ec2:     	movq	%r9, -0x18(%rbp)
140082ec6:     	movq	0x368(%rbp), %rax
140082ecd:     	movq	(%rax), %rsi
140082ed0:     	movq	0x8(%rax), %rdx
140082ed4:     	movl	0x18(%rax), %eax
140082ed7:     	movl	%eax, 0x254(%rbp)
140082edd:     	movq	%rsi, %rcx
140082ee0:     	movq	%rdx, 0x280(%rbp)
140082ee7:     	callq	0x14036aed0 <.text+0x369ed0>
140082eec:     	movq	0xf8(%rsi), %rcx
140082ef3:     	movq	0x100(%rsi), %rdx
140082efa:     	movq	%rsi, 0x278(%rbp)
140082f01:     	movzbl	0x108(%rsi), %r8d
140082f09:     	testb	%r8b, %r8b
140082f0c:     	movq	%rbx, 0x270(%rbp)
140082f13:     	leaq	(,%rdx,4), %r10
140082f1b:     	movq	%rcx, %rax
140082f1e:     	je	0x140082f90 <.text+0x81f90>
140082f20:     	testq	%r10, %r10
140082f23:     	je	0x1400833ed <.text+0x823ed>
140082f29:     	movl	(%rax), %r9d
140082f2c:     	addq	$0x4, %rax
140082f30:     	movq	0x280(%rbp), %r11
140082f37:     	movq	0x1a8(%r11), %r11
140082f3e:     	leaq	(%r9,%r9,8), %rsi
140082f42:     	movq	0x10(%r11,%rsi,8), %r9
140082f47:     	addq	$-0x4, %r10
140082f4b:     	testq	%r9, %r9
140082f4e:     	je	0x140082f20 <.text+0x81f20>
140082f50:     	leaq	(%r11,%rsi,8), %r10
140082f54:     	movq	0x278(%rbp), %r11
140082f5b:     	movq	0x110(%r11), %r11
140082f62:     	movq	0x18(%r10), %rdi
140082f66:     	movq	0x38(%r10), %r10
140082f6a:     	movq	(%r10,%r11,8), %r10
140082f6e:     	notq	%r10
140082f71:     	leaq	(%r10,%r10,2), %r10
140082f75:     	shlq	$0x4, %r10
140082f79:     	movq	0x10(%rdi,%r10), %rsi
140082f7e:     	movq	0x28(%rdi,%r10), %rdi
140082f83:     	movl	$0x1, %r10d
140082f89:     	jmp	0x140083406 <.text+0x82406>
140082f8e:     	nop
140082f90:     	testq	%r10, %r10
140082f93:     	je	0x1400833f7 <.text+0x823f7>
140082f99:     	movl	(%rax), %r9d
140082f9c:     	addq	$0x4, %rax
140082fa0:     	movq	0x280(%rbp), %r11
140082fa7:     	movq	0x108(%r11), %r11
140082fae:     	leaq	(%r9,%r9,4), %rsi
140082fb2:     	shlq	$0x5, %rsi
140082fb6:     	movq	0x58(%r11,%rsi), %r9
140082fbb:     	addq	$-0x4, %r10
140082fbf:     	testq	%r9, %r9
140082fc2:     	je	0x140082f90 <.text+0x81f90>
140082fc4:     	addq	%rsi, %r11
140082fc7:     	movl	0x94(%r11), %r10d
140082fce:     	movq	0x280(%rbp), %rsi
140082fd5:     	movq	0x1a8(%rsi), %rsi
140082fdc:     	leaq	(%r10,%r10,8), %r10
140082fe0:     	movq	0x278(%rbp), %rdi
140082fe7:     	movq	0x110(%rdi), %rdi
140082fee:     	movq	0x18(%rsi,%r10,8), %rbx
140082ff3:     	movq	0x38(%rsi,%r10,8), %r10
140082ff8:     	movq	(%r10,%rdi,8), %r10
140082ffc:     	notq	%r10
140082fff:     	movq	0x50(%r11), %r11
140083003:     	movl	0x8(%r11), %edi
140083007:     	leaq	(%r10,%r10,2), %r10
14008300b:     	shlq	$0x4, %r10
14008300f:     	notl	%edi
140083011:     	leaq	(%rdi,%rdi,2), %rsi
140083015:     	shlq	$0x3, %rsi
140083019:     	addq	0x10(%rbx,%r10), %rsi
14008301e:     	shlq	$0x2, %rdi
140083022:     	addq	0x28(%rbx,%r10), %rdi
140083027:     	movl	$0x1, %r10d
14008302d:     	jmp	0x1400833ff <.text+0x823ff>
140083032:     	movq	0x350(%rbp), %rax
140083039:     	movq	-0x40(%rbp), %rdi
14008303d:     	movq	(%r9), %rbx
140083040:     	movzbl	0x38(%rax), %eax
140083044:     	movb	%al, 0x230(%rbp)
14008304a:     	movups	0x589385f(%rip), %xmm0  # 0x1459168b0
140083051:     	movaps	%xmm0, 0x190(%rbp)
140083058:     	movq	$0x0, 0x1a0(%rbp)
140083063:     	movups	0x589385e(%rip), %xmm1  # 0x1459168c8
14008306a:     	movups	%xmm1, 0x1a8(%rbp)
140083071:     	movq	$0x0, 0x1b8(%rbp)
14008307c:     	movups	0x589385d(%rip), %xmm1  # 0x1459168e0
140083083:     	movaps	%xmm1, 0x1c0(%rbp)
14008308a:     	movq	$0x0, 0x1d0(%rbp)
140083095:     	movupd	0x589385b(%rip), %xmm2  # 0x1459168f8
14008309d:     	movupd	%xmm2, 0x1d8(%rbp)
1400830a5:     	movq	$0x0, 0x1e8(%rbp)
1400830b0:     	movaps	%xmm0, -0x10(%rbp)
1400830b4:     	movaps	%xmm1, 0x20(%rbp)
1400830b8:     	movq	0x1a0(%rbp), %rax
1400830bf:     	movq	%rax, (%rbp)
1400830c3:     	movq	0x1a8(%rbp), %rax
1400830ca:     	movq	%rax, 0x8(%rbp)
1400830ce:     	movq	0x1b0(%rbp), %rax
1400830d5:     	movq	%rax, 0x10(%rbp)
1400830d9:     	movq	0x1b8(%rbp), %rax
1400830e0:     	movq	%rax, 0x18(%rbp)
1400830e4:     	movq	0x1d0(%rbp), %rax
1400830eb:     	movq	%rax, 0x30(%rbp)
1400830ef:     	movq	0x1d8(%rbp), %rax
1400830f6:     	movq	%rax, 0x38(%rbp)
1400830fa:     	movaps	0x1e0(%rbp), %xmm0
140083101:     	movaps	%xmm0, 0x40(%rbp)
140083105:     	xorps	%xmm0, %xmm0
140083108:     	movaps	%xmm0, 0x60(%rbp)
14008310c:     	movaps	%xmm0, 0x50(%rbp)
140083110:     	movq	$0x0, 0x70(%rbp)
140083118:     	movapd	0x5890010(%rip), %xmm1  # 0x145913130
140083120:     	movupd	%xmm1, 0x78(%rbp)
140083125:     	movups	%xmm0, 0x98(%rbp)
14008312c:     	movups	%xmm0, 0x88(%rbp)
140083133:     	movups	0x589383e(%rip), %xmm0  # 0x145916978
14008313a:     	movups	%xmm0, 0xb8(%rbp)
140083141:     	movups	0x5893820(%rip), %xmm0  # 0x145916968
140083148:     	movups	%xmm0, 0xa8(%rbp)
14008314f:     	movups	0x5893842(%rip), %xmm0  # 0x145916998
140083156:     	movups	%xmm0, 0xd8(%rbp)
14008315d:     	movups	0x5893824(%rip), %xmm0  # 0x145916988
140083164:     	movups	%xmm0, 0xc8(%rbp)
14008316b:     	movups	0x5893846(%rip), %xmm0  # 0x1459169b8
140083172:     	movups	%xmm0, 0xf8(%rbp)
140083179:     	movups	0x5893828(%rip), %xmm0  # 0x1459169a8
140083180:     	movups	%xmm0, 0xe8(%rbp)
140083187:     	movups	0x589384a(%rip), %xmm0  # 0x1459169d8
14008318e:     	movups	%xmm0, 0x118(%rbp)
140083195:     	movups	0x589382c(%rip), %xmm0  # 0x1459169c8
14008319c:     	movups	%xmm0, 0x108(%rbp)
1400831a3:     	movapd	0x5884315(%rip), %xmm0  # 0x1459074c0
1400831ab:     	movupd	%xmm0, 0x128(%rbp)
1400831b3:     	movl	$0x1, 0x138(%rbp)
1400831bd:     	movq	$0x0, 0x13c(%rbp)
1400831c8:     	movb	$0x1, 0x144(%rbp)
1400831cf:     	movq	$0x0, 0x148(%rbp)
1400831da:     	movl	$0x3f800000, 0x150(%rbp) # imm = 0x3F800000
1400831e4:     	movw	$0x0, 0x154(%rbp)
1400831ed:     	movw	$0x0, 0x15a(%rbp)
1400831f6:     	movl	$0x10000, 0x156(%rbp)   # imm = 0x10000
140083200:     	movw	$0x0, 0x160(%rbp)
140083209:     	movl	$0x10000, 0x15c(%rbp)   # imm = 0x10000
140083213:     	movw	$0x100, 0x162(%rbp)     # imm = 0x100
14008321c:     	movw	$0x0, 0x16c(%rbp)
140083225:     	movq	$0x0, 0x164(%rbp)
140083230:     	movl	$0xfa0, 0x170(%rbp)     # imm = 0xFA0
14008323a:     	movw	$0x0, 0x174(%rbp)
140083243:     	leaq	0x5893a9e(%rip), %r9    # 0x145916ce8
14008324a:     	leaq	0x190(%rbp), %rsi
140083251:     	leaq	-0x10(%rbp), %r8
140083255:     	movq	%rsi, %rcx
140083258:     	movq	%r12, %rdx
14008325b:     	callq	0x1400ecc00 <.text+0xebc00>
140083260:     	movq	%rdi, -0x10(%rbp)
140083264:     	movq	%rbx, -0x8(%rbp)
140083268:     	leaq	0x230(%rbp), %rax
14008326f:     	movq	%rax, (%rbp)
140083273:     	leaq	-0x10(%rbp), %rdx
140083277:     	movq	%rsi, %rcx
14008327a:     	callq	0x140105220 <.text+0x104220>
14008327f:     	jmp	0x1400833b3 <.text+0x823b3>
140083284:     	testq	%r10, %r10
140083287:     	movq	0x260(%rbp), %rcx
14008328e:     	cmovneq	%r9, %rcx
140083292:     	movq	%rax, -0x10(%rbp)
140083296:     	movupd	%xmm6, -0x8(%rbp)
14008329b:     	movupd	%xmm7, 0x8(%rbp)
1400832a0:     	movq	%rcx, 0x260(%rbp)
1400832a7:     	movq	%rcx, 0x18(%rbp)
1400832ab:     	leaq	-0x10(%rbp), %rcx
1400832af:     	movq	%r11, %rdx
1400832b2:     	movb	%r8b, 0x280(%rbp)
1400832b9:     	movq	%r9, 0x278(%rbp)
1400832c0:     	movq	%r10, 0x270(%rbp)
1400832c7:     	callq	0x144e74f30 <.text+0x4e73f30>
1400832cc:     	leaq	0x589390d(%rip), %r11   # 0x145916be0
1400832d3:     	movq	0x270(%rbp), %r10
1400832da:     	movq	0x278(%rbp), %r9
1400832e1:     	movzbl	0x280(%rbp), %r8d
1400832e9:     	movq	0x390(%rbp), %rdx
1400832f0:     	testb	%r8b, %r8b
1400832f3:     	je	0x140083320 <.text+0x82320>
1400832f5:     	jmp	0x14008337a <.text+0x8237a>
1400832fa:     	nopw	(%rax,%rax)
140083300:     	addq	%rcx, %rax
140083303:     	movq	0x50(%rax), %rdi
140083307:     	xorl	%r12d, %r12d
14008330a:     	movl	%r12d, %eax
14008330d:     	shlq	$0x4, %rax
140083311:     	incl	%r12d
140083314:     	movq	(%rdi,%rax), %rax
140083318:     	testl	%eax, %eax
14008331a:     	jne	0x1400833a3 <.text+0x823a3>
140083320:     	cmpl	%esi, %r12d
140083323:     	jne	0x14008330a <.text+0x8230a>
140083325:     	nopw	%cs:(%rax,%rax)
140083330:     	cmpq	%r15, %r14
140083333:     	je	0x1400833ab <.text+0x823ab>
140083335:     	movl	(%r14), %ecx
140083338:     	addq	$0x4, %r14
14008333c:     	movq	0x108(%rbx), %rax
140083343:     	leaq	(%rcx,%rcx,4), %rcx
140083347:     	shlq	$0x5, %rcx
14008334b:     	movq	0x58(%rax,%rcx), %rsi
140083350:     	testq	%rsi, %rsi
140083353:     	je	0x140083330 <.text+0x82330>
140083355:     	jmp	0x140083300 <.text+0x82300>
140083357:     	nopw	(%rax,%rax)
140083360:     	leaq	(%rax,%rcx,8), %rax
140083364:     	movq	0x8(%rax), %r13
140083368:     	xorl	%r12d, %r12d
14008336b:     	movl	%r12d, %eax
14008336e:     	incl	%r12d
140083371:     	movq	(%r13,%rax,8), %rax
140083376:     	testl	%eax, %eax
140083378:     	jne	0x1400833a3 <.text+0x823a3>
14008337a:     	cmpl	%esi, %r12d
14008337d:     	jne	0x14008336b <.text+0x8236b>
14008337f:     	nop
140083380:     	cmpq	%r15, %r14
140083383:     	je	0x1400833ab <.text+0x823ab>
140083385:     	movl	(%r14), %ecx
140083388:     	addq	$0x4, %r14
14008338c:     	movq	0x1a8(%rbx), %rax
140083393:     	leaq	(%rcx,%rcx,8), %rcx
140083397:     	movq	0x10(%rax,%rcx,8), %rsi
14008339c:     	testq	%rsi, %rsi
14008339f:     	je	0x140083380 <.text+0x82380>
1400833a1:     	jmp	0x140083360 <.text+0x82360>
1400833a3:     	testl	%eax, %eax
1400833a5:     	jne	0x140083284 <.text+0x82284>
1400833ab:     	movq	$0x0, 0x10(%rdx)
1400833b3:     	movaps	0x290(%rbp), %xmm6
1400833ba:     	movaps	0x2a0(%rbp), %xmm7
1400833c1:     	movaps	0x2b0(%rbp), %xmm8
1400833c9:     	movaps	0x2c0(%rbp), %xmm9
1400833d1:     	movaps	0x2d0(%rbp), %xmm10
1400833d9:     	addq	$0x368, %rsp            # imm = 0x368
1400833e0:     	popq	%rbx
1400833e1:     	popq	%rdi
1400833e2:     	popq	%rsi
1400833e3:     	popq	%r12
1400833e5:     	popq	%r13
1400833e7:     	popq	%r14
1400833e9:     	popq	%r15
1400833eb:     	popq	%rbp
1400833ec:     	retq
1400833ed:     	xorl	%r10d, %r10d
1400833f0:     	xorl	%r9d, %r9d
1400833f3:     	xorl	%esi, %esi
1400833f5:     	jmp	0x140083406 <.text+0x82406>
1400833f7:     	xorl	%r10d, %r10d
1400833fa:     	xorl	%r9d, %r9d
1400833fd:     	xorl	%esi, %esi
1400833ff:     	movq	0x270(%rbp), %rbx
140083406:     	leaq	0x60(%rbx), %r11
14008340a:     	movq	%r11, 0x208(%rbp)
140083411:     	leaq	(%rcx,%rdx,4), %rcx
140083415:     	testb	%r8b, %r8b
140083418:     	je	0x14008345a <.text+0x8245a>
14008341a:     	cmpl	%r9d, %r10d
14008341d:     	jne	0x1400835f4 <.text+0x825f4>
140083423:     	nopw	%cs:(%rax,%rax)
140083430:     	cmpq	%rcx, %rax
140083433:     	je	0x14008349e <.text+0x8249e>
140083435:     	movl	(%rax), %edx
140083437:     	addq	$0x4, %rax
14008343b:     	movq	0x280(%rbp), %r8
140083442:     	movq	0x1a8(%r8), %r8
140083449:     	leaq	(%rdx,%rdx,8), %rdx
14008344d:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
140083453:     	je	0x140083430 <.text+0x82430>
140083455:     	jmp	0x1400835f4 <.text+0x825f4>
14008345a:     	cmpl	%r9d, %r10d
14008345d:     	jne	0x1400835f4 <.text+0x825f4>
140083463:     	nopw	%cs:(%rax,%rax)
140083470:     	cmpq	%rcx, %rax
140083473:     	je	0x14008349e <.text+0x8249e>
140083475:     	movl	(%rax), %edx
140083477:     	addq	$0x4, %rax
14008347b:     	movq	0x280(%rbp), %r8
140083482:     	movq	0x108(%r8), %r8
140083489:     	leaq	(%rdx,%rdx,4), %rdx
14008348d:     	shlq	$0x5, %rdx
140083491:     	cmpq	$0x0, 0x58(%r8,%rdx)
140083497:     	je	0x140083470 <.text+0x82470>
140083499:     	jmp	0x1400835f4 <.text+0x825f4>
14008349e:     	testq	%rsi, %rsi
1400834a1:     	je	0x1400835f4 <.text+0x825f4>
1400834a7:     	leaq	0x5893352(%rip), %rcx   # 0x145916800
1400834ae:     	movl	$0x4, %edx
1400834b3:     	leaq	0x60(%rbx), %r8
1400834b7:     	callq	0x142affbe0 <.text+0x2afebe0>
1400834bc:     	testq	%rax, %rax
1400834bf:     	jne	0x1400834c8 <.text+0x824c8>
1400834c1:     	movq	0x798a2f0(%rip), %rax   # 0x147a0d7b8
1400834c8:     	xorpd	%xmm0, %xmm0
1400834cc:     	cmpb	$0x2, (%rax)
1400834cf:     	xorpd	%xmm1, %xmm1
1400834d3:     	jne	0x140083515 <.text+0x82515>
1400834d5:     	movq	0x8(%rax), %rcx
1400834d9:     	testq	%rcx, %rcx
1400834dc:     	je	0x1400834ee <.text+0x824ee>
1400834de:     	cmpl	$0x1, %ecx
1400834e1:     	jne	0x140083510 <.text+0x82510>
1400834e3:     	xorps	%xmm1, %xmm1
1400834e6:     	cvtsi2sdq	0x10(%rax), %xmm1
1400834ec:     	jmp	0x140083515 <.text+0x82515>
1400834ee:     	movsd	0x10(%rax), %xmm2
1400834f3:     	unpcklps	0x5883da6(%rip), %xmm2  # xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
                                                # 0x1459072a0
1400834fa:     	subpd	0x5883dae(%rip), %xmm2  # 0x1459072b0
140083502:     	movapd	%xmm2, %xmm1
140083506:     	unpckhpd	%xmm2, %xmm1            # xmm1 = xmm1[1],xmm2[1]
14008350a:     	addsd	%xmm2, %xmm1
14008350e:     	jmp	0x140083515 <.text+0x82515>
140083510:     	movsd	0x10(%rax), %xmm1
140083515:     	maxsd	%xmm0, %xmm1
140083519:     	cvttsd2si	%xmm1, %rax
14008351e:     	movq	%rax, %rcx
140083521:     	movapd	%xmm1, %xmm2
140083525:     	subsd	0x5883f4b(%rip), %xmm2  # 0x145907478
14008352d:     	cvttsd2si	%xmm2, %rdx
140083532:     	sarq	$0x3f, %rcx
140083536:     	andq	%rcx, %rdx
140083539:     	orq	%rax, %rdx
14008353c:     	xorl	%eax, %eax
14008353e:     	ucomisd	%xmm0, %xmm1
140083542:     	cmovaeq	%rdx, %rax
140083546:     	ucomisd	0x5883f32(%rip), %xmm1  # 0x145907480
14008354e:     	movq	$-0x1, %rcx
140083555:     	cmovbeq	%rax, %rcx
140083559:     	movabsq	$-0x7777777777777777, %rdx # imm = 0x8888888888888889
140083563:     	movq	%rcx, %rax
140083566:     	mulq	%rdx
140083569:     	shrq	$0x5, %rdx
14008356d:     	movq	%rdx, 0x1f0(%rbp)
140083574:     	imulq	$0x3c, %rdx, %rax
140083578:     	subq	%rax, %rcx
14008357b:     	movq	%rcx, 0x230(%rbp)
140083582:     	leaq	0x1f0(%rbp), %rax
140083589:     	movq	%rax, -0x10(%rbp)
14008358d:     	leaq	0x56b7dac(%rip), %rax   # 0x14573b340 <.text+0x573a340>
140083594:     	movq	%rax, -0x8(%rbp)
140083598:     	leaq	0x230(%rbp), %rcx
14008359f:     	movq	%rcx, (%rbp)
1400835a3:     	movq	%rax, 0x8(%rbp)
1400835a7:     	leaq	0x58b9a81(%rip), %rdx   # 0x14593d02f
1400835ae:     	leaq	0x190(%rbp), %rcx
1400835b5:     	leaq	-0x10(%rbp), %r8
1400835b9:     	callq	0x145728390 <.text+0x5727390>
1400835be:     	movl	0x254(%rbp), %eax
1400835c4:     	movl	%eax, (%rdi)
1400835c6:     	movq	(%rsi), %rdx
1400835c9:     	testq	%rdx, %rdx
1400835cc:     	je	0x1400835dd <.text+0x825dd>
1400835ce:     	movq	0x8(%rsi), %rcx
1400835d2:     	movl	$0x1, %r8d
1400835d8:     	callq	0x1400021d0 <.text+0x11d0>
1400835dd:     	movq	0x1a0(%rbp), %rax
1400835e4:     	movq	%rax, 0x10(%rsi)
1400835e8:     	movupd	0x190(%rbp), %xmm0
1400835f0:     	movupd	%xmm0, (%rsi)
1400835f4:     	movq	0x278(%rbp), %rsi
1400835fb:     	leaq	0x120(%rsi), %rcx
140083602:     	movq	0x280(%rbp), %rdx
140083609:     	callq	0x14036aed0 <.text+0x369ed0>
14008360e:     	movq	0x218(%rsi), %rcx
140083615:     	movq	0x220(%rsi), %rdx
14008361c:     	movzbl	0x228(%rsi), %r8d
140083624:     	leaq	(,%rdx,4), %r10
14008362c:     	movq	%rcx, %rax
14008362f:     	testb	%r8b, %r8b
140083632:     	je	0x1400836b0 <.text+0x826b0>
140083634:     	nopw	%cs:(%rax,%rax)
140083640:     	testq	%r10, %r10
140083643:     	je	0x14008379e <.text+0x8279e>
140083649:     	movl	(%rax), %r9d
14008364c:     	addq	$0x4, %rax
140083650:     	movq	0x280(%rbp), %r11
140083657:     	movq	0x1a8(%r11), %r11
14008365e:     	leaq	(%r9,%r9,8), %rsi
140083662:     	movq	0x10(%r11,%rsi,8), %r9
140083667:     	addq	$-0x4, %r10
14008366b:     	testq	%r9, %r9
14008366e:     	je	0x140083640 <.text+0x82640>
140083670:     	leaq	(%r11,%rsi,8), %r10
140083674:     	movq	0x278(%rbp), %r11
14008367b:     	movq	0x230(%r11), %r11
140083682:     	movq	0x18(%r10), %rsi
140083686:     	movq	0x38(%r10), %r10
14008368a:     	movq	(%r10,%r11,8), %r10
14008368e:     	notq	%r10
140083691:     	leaq	(%r10,%r10,2), %r10
140083695:     	shlq	$0x4, %r10
140083699:     	movq	0x10(%rsi,%r10), %rdi
14008369e:     	movq	0x28(%rsi,%r10), %r14
1400836a3:     	jmp	0x14008374f <.text+0x8274f>
1400836a8:     	nopl	(%rax,%rax)
1400836b0:     	testq	%r10, %r10
1400836b3:     	je	0x14008379e <.text+0x8279e>
1400836b9:     	movl	(%rax), %r9d
1400836bc:     	addq	$0x4, %rax
1400836c0:     	movq	0x280(%rbp), %r11
1400836c7:     	movq	0x108(%r11), %r11
1400836ce:     	leaq	(%r9,%r9,4), %rsi
1400836d2:     	shlq	$0x5, %rsi
1400836d6:     	movq	0x58(%r11,%rsi), %r9
1400836db:     	addq	$-0x4, %r10
1400836df:     	testq	%r9, %r9
1400836e2:     	je	0x1400836b0 <.text+0x826b0>
1400836e4:     	addq	%rsi, %r11
1400836e7:     	movl	0x94(%r11), %r10d
1400836ee:     	movq	0x280(%rbp), %rsi
1400836f5:     	movq	0x1a8(%rsi), %rsi
1400836fc:     	leaq	(%r10,%r10,8), %r10
140083700:     	movq	0x278(%rbp), %rdi
140083707:     	movq	0x230(%rdi), %rdi
14008370e:     	movq	0x18(%rsi,%r10,8), %rbx
140083713:     	movq	0x38(%rsi,%r10,8), %r10
140083718:     	movq	(%r10,%rdi,8), %r10
14008371c:     	notq	%r10
14008371f:     	movq	0x50(%r11), %r11
140083723:     	movl	0x8(%r11), %r14d
140083727:     	leaq	(%r10,%r10,2), %r10
14008372b:     	shlq	$0x4, %r10
14008372f:     	notl	%r14d
140083732:     	leaq	(%r14,%r14,2), %rdi
140083736:     	shlq	$0x3, %rdi
14008373a:     	addq	0x10(%rbx,%r10), %rdi
14008373f:     	shlq	$0x2, %r14
140083743:     	addq	0x28(%rbx,%r10), %r14
140083748:     	movq	0x270(%rbp), %rbx
14008374f:     	movl	$0x1, %r10d
140083755:     	leaq	(%rcx,%rdx,4), %rcx
140083759:     	testb	%r8b, %r8b
14008375c:     	movq	%r12, 0x178(%rbp)
140083763:     	jne	0x1400837b6 <.text+0x827b6>
140083765:     	cmpl	%r9d, %r10d
140083768:     	jne	0x1400839d8 <.text+0x829d8>
14008376e:     	nop
140083770:     	cmpq	%rcx, %rax
140083773:     	je	0x1400837ea <.text+0x827ea>
140083775:     	movl	(%rax), %edx
140083777:     	addq	$0x4, %rax
14008377b:     	movq	0x280(%rbp), %r8
140083782:     	movq	0x108(%r8), %r8
140083789:     	leaq	(%rdx,%rdx,4), %rdx
14008378d:     	shlq	$0x5, %rdx
140083791:     	cmpq	$0x0, 0x58(%r8,%rdx)
140083797:     	je	0x140083770 <.text+0x82770>
140083799:     	jmp	0x1400839d8 <.text+0x829d8>
14008379e:     	xorl	%r9d, %r9d
1400837a1:     	xorl	%r10d, %r10d
1400837a4:     	xorl	%edi, %edi
1400837a6:     	leaq	(%rcx,%rdx,4), %rcx
1400837aa:     	testb	%r8b, %r8b
1400837ad:     	movq	%r12, 0x178(%rbp)
1400837b4:     	je	0x140083765 <.text+0x82765>
1400837b6:     	cmpl	%r9d, %r10d
1400837b9:     	jne	0x1400839d8 <.text+0x829d8>
1400837bf:     	nop
1400837c0:     	cmpq	%rcx, %rax
1400837c3:     	je	0x1400837ea <.text+0x827ea>
1400837c5:     	movl	(%rax), %edx
1400837c7:     	addq	$0x4, %rax
1400837cb:     	movq	0x280(%rbp), %r8
1400837d2:     	movq	0x1a8(%r8), %r8
1400837d9:     	leaq	(%rdx,%rdx,8), %rdx
1400837dd:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
1400837e3:     	je	0x1400837c0 <.text+0x827c0>
1400837e5:     	jmp	0x1400839d8 <.text+0x829d8>
1400837ea:     	testq	%rdi, %rdi
1400837ed:     	je	0x1400839d8 <.text+0x829d8>
1400837f3:     	leaq	0x58933fe(%rip), %rcx   # 0x145916bf8
1400837fa:     	movl	$0x8, %edx
1400837ff:     	leaq	0x60(%rbx), %r8
140083803:     	callq	0x142affbe0 <.text+0x2afebe0>
140083808:     	testq	%rax, %rax
14008380b:     	jne	0x140083814 <.text+0x82814>
14008380d:     	movq	0x7989fa4(%rip), %rax   # 0x147a0d7b8
140083814:     	cmpb	$0x2, (%rax)
140083817:     	jne	0x14008383a <.text+0x8283a>
140083819:     	movq	0x8(%rax), %rcx
14008381d:     	testq	%rcx, %rcx
140083820:     	je	0x140083904 <.text+0x82904>
140083826:     	cmpl	$0x1, %ecx
140083829:     	jne	0x140083926 <.text+0x82926>
14008382f:     	cvtsi2sdq	0x10(%rax), %xmm1
140083835:     	jmp	0x14008392b <.text+0x8292b>
14008383a:     	leaq	0x58933ec(%rip), %rcx   # 0x145916c2d
140083841:     	movl	$0x7, %edx
140083846:     	leaq	0x60(%rbx), %r8
14008384a:     	callq	0x142affbe0 <.text+0x2afebe0>
14008384f:     	testq	%rax, %rax
140083852:     	jne	0x14008385b <.text+0x8285b>
140083854:     	movq	0x7989f5d(%rip), %rax   # 0x147a0d7b8
14008385b:     	cmpb	$0x1, (%rax)
14008385e:     	jne	0x1400838de <.text+0x828de>
140083860:     	cmpb	$0x0, 0x1(%rax)
140083864:     	je	0x1400838de <.text+0x828de>
140083866:     	leaq	0x58933c7(%rip), %rcx   # 0x145916c34
14008386d:     	movl	$0xb, %edx
140083872:     	callq	0x145457c00 <.text+0x5456c00>
140083877:     	movq	%rax, %r15
14008387a:     	movq	%rdx, %rsi
14008387d:     	movq	$0x1, 0x20(%rsp)
140083886:     	leaq	-0x10(%rbp), %rcx
14008388a:     	movl	$0x1, %r9d
140083890:     	xorl	%r8d, %r8d
140083893:     	callq	0x140188f20 <.text+0x187f20>
140083898:     	movq	-0x8(%rbp), %r13
14008389c:     	cmpl	$0x1, -0x10(%rbp)
1400838a0:     	je	0x1400855fa <.text+0x845fa>
1400838a6:     	movq	(%rbp), %rbx
1400838aa:     	testq	%rsi, %rsi
1400838ad:     	je	0x1400838bd <.text+0x828bd>
1400838af:     	movq	%rbx, %rcx
1400838b2:     	movq	%r15, %rdx
1400838b5:     	movq	%rsi, %r8
1400838b8:     	callq	0x1457731ed <.text+0x57721ed>
1400838bd:     	movq	%r13, 0x230(%rbp)
1400838c4:     	movq	%rbx, 0x238(%rbp)
1400838cb:     	movq	%rsi, 0x240(%rbp)
1400838d2:     	movq	0x270(%rbp), %rbx
1400838d9:     	jmp	0x1400839a1 <.text+0x829a1>
1400838de:     	movq	$0x0, 0x230(%rbp)
1400838e9:     	movq	$0x1, 0x238(%rbp)
1400838f4:     	movq	$0x0, 0x240(%rbp)
1400838ff:     	jmp	0x1400839a1 <.text+0x829a1>
140083904:     	movsd	0x10(%rax), %xmm0
140083909:     	unpcklps	0x5883990(%rip), %xmm0  # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
                                                # 0x1459072a0
140083910:     	subpd	0x5883998(%rip), %xmm0  # 0x1459072b0
140083918:     	movapd	%xmm0, %xmm1
14008391c:     	unpckhpd	%xmm0, %xmm1            # xmm1 = xmm1[1],xmm0[1]
140083920:     	addsd	%xmm0, %xmm1
140083924:     	jmp	0x14008392b <.text+0x8292b>
140083926:     	movsd	0x10(%rax), %xmm1
14008392b:     	leaq	0x190(%rbp), %rsi
140083932:     	movq	%rsi, %rcx
140083935:     	callq	0x1400b7310 <.text+0xb6310>
14008393a:     	leaq	0x5892ebf(%rip), %rax   # 0x145916800
140083941:     	movq	%rax, -0x10(%rbp)
140083945:     	movq	$0x4, -0x8(%rbp)
14008394d:     	movq	%rsi, (%rbp)
140083951:     	leaq	0x58932a8(%rip), %rax   # 0x145916c00
140083958:     	movq	%rax, 0x8(%rbp)
14008395c:     	movq	$0x1, 0x20(%rsp)
140083965:     	leaq	0x58932b4(%rip), %rdx   # 0x145916c20
14008396c:     	leaq	0x230(%rbp), %rcx
140083973:     	leaq	-0x10(%rbp), %r9
140083977:     	movl	$0xd, %r8d
14008397d:     	callq	0x145457c60 <.text+0x5456c60>
140083982:     	nop
140083983:     	movq	0x190(%rbp), %rdx
14008398a:     	testq	%rdx, %rdx
14008398d:     	je	0x1400839a1 <.text+0x829a1>
14008398f:     	movq	0x198(%rbp), %rcx
140083996:     	movl	$0x1, %r8d
14008399c:     	callq	0x1400021d0 <.text+0x11d0>
1400839a1:     	movl	0x254(%rbp), %eax
1400839a7:     	movl	%eax, (%r14)
1400839aa:     	movq	(%rdi), %rdx
1400839ad:     	testq	%rdx, %rdx
1400839b0:     	je	0x1400839c1 <.text+0x829c1>
1400839b2:     	movq	0x8(%rdi), %rcx
1400839b6:     	movl	$0x1, %r8d
1400839bc:     	callq	0x1400021d0 <.text+0x11d0>
1400839c1:     	movq	0x240(%rbp), %rax
1400839c8:     	movq	%rax, 0x10(%rdi)
1400839cc:     	movupd	0x230(%rbp), %xmm0
1400839d4:     	movupd	%xmm0, (%rdi)
1400839d8:     	leaq	0x5892e73(%rip), %rcx   # 0x145916852
1400839df:     	movl	$0x6, %edx
1400839e4:     	leaq	0x60(%rbx), %r8
1400839e8:     	callq	0x142affbe0 <.text+0x2afebe0>
1400839ed:     	testq	%rax, %rax
1400839f0:     	jne	0x1400839f9 <.text+0x829f9>
1400839f2:     	movq	0x7989dbf(%rip), %rax   # 0x147a0d7b8
1400839f9:     	cmpb	$0x4, (%rax)
1400839fc:     	jne	0x140083a32 <.text+0x82a32>
1400839fe:     	movq	0x10(%rax), %rcx
140083a02:     	movq	0x18(%rax), %rax
140083a06:     	shlq	$0x5, %rax
140083a0a:     	addq	%rcx, %rax
140083a0d:     	movq	%rcx, -0x10(%rbp)
140083a11:     	movq	%rax, -0x8(%rbp)
140083a15:     	movq	$0x4, (%rbp)
140083a1d:     	leaq	0x1f0(%rbp), %rcx
140083a24:     	leaq	-0x10(%rbp), %rdx
140083a28:     	callq	0x1401b07c0 <.text+0x1af7c0>
140083a2d:     	jmp	0x140083abf <.text+0x82abf>
140083a32:     	leaq	0x5892a9f(%rip), %rcx   # 0x1459164d8
140083a39:     	movl	$0x4, %edx
140083a3e:     	leaq	0x60(%rbx), %r8
140083a42:     	callq	0x142affbe0 <.text+0x2afebe0>
140083a47:     	testq	%rax, %rax
140083a4a:     	jne	0x140083a53 <.text+0x82a53>
140083a4c:     	movq	0x7989d65(%rip), %rax   # 0x147a0d7b8
140083a53:     	cmpb	$0x5, (%rax)
140083a56:     	jne	0x140083aa3 <.text+0x82aa3>
140083a58:     	leaq	0x5892a79(%rip), %rcx   # 0x1459164d8
140083a5f:     	movl	$0x4, %edx
140083a64:     	leaq	0x60(%rbx), %r8
140083a68:     	callq	0x142affbe0 <.text+0x2afebe0>
140083a6d:     	movq	%rax, %rsi
140083a70:     	callq	0x140002200 <.text+0x1200>
140083a75:     	movl	$0x8, %ecx
140083a7a:     	movl	$0x8, %edx
140083a7f:     	callq	0x1400021c0 <.text+0x11c0>
140083a84:     	testq	%rax, %rax
140083a87:     	je	0x140085608 <.text+0x84608>
140083a8d:     	testq	%rsi, %rsi
140083a90:     	jne	0x140083a99 <.text+0x82a99>
140083a92:     	movq	0x7989d1f(%rip), %rsi   # 0x147a0d7b8
140083a99:     	movq	%rsi, (%rax)
140083a9c:     	movl	$0x1, %ecx
140083aa1:     	jmp	0x140083aaa <.text+0x82aaa>
140083aa3:     	movl	$0x8, %eax
140083aa8:     	xorl	%ecx, %ecx
140083aaa:     	movq	%rcx, 0x1f0(%rbp)
140083ab1:     	movq	%rax, 0x1f8(%rbp)
140083ab8:     	movq	%rcx, 0x200(%rbp)
140083abf:     	movq	0x370(%rbp), %rax
140083ac6:     	movq	(%rax), %r9
140083ac9:     	movq	0x8(%rax), %rax
140083acd:     	movq	0xf8(%r9), %rdx
140083ad4:     	movq	0x100(%r9), %rcx
140083adb:     	leaq	(%rdx,%rcx,4), %rcx
140083adf:     	movzbl	0x108(%r9), %r8d
140083ae7:     	movb	%r8b, 0x260(%rbp)
140083aee:     	testb	%r8b, %r8b
140083af1:     	je	0x140083bc9 <.text+0x82bc9>
140083af7:     	movl	$0x8, %r14d
140083afd:     	xorl	%r12d, %r12d
140083b00:     	xorl	%ebx, %ebx
140083b02:     	xorl	%esi, %esi
140083b04:     	xorl	%r10d, %r10d
140083b07:     	cmpl	%esi, %r10d
140083b0a:     	jne	0x140083b77 <.text+0x82b77>
140083b0c:     	nopl	(%rax)
140083b10:     	cmpq	%rcx, %rdx
140083b13:     	je	0x140083cf0 <.text+0x82cf0>
140083b19:     	movl	(%rdx), %r11d
140083b1c:     	addq	$0x4, %rdx
140083b20:     	movq	0x1a8(%rax), %r10
140083b27:     	leaq	(%r11,%r11,8), %rdi
140083b2b:     	movq	0x10(%r10,%rdi,8), %r11
140083b30:     	testq	%r11, %r11
140083b33:     	je	0x140083b10 <.text+0x82b10>
140083b35:     	leaq	(%r10,%rdi,8), %rsi
140083b39:     	movq	0x110(%r9), %rdi
140083b40:     	xorl	%r10d, %r10d
140083b43:     	cmpq	0x40(%rsi), %rdi
140083b47:     	jae	0x140083b6e <.text+0x82b6e>
140083b49:     	movq	0x38(%rsi), %rbx
140083b4d:     	movq	(%rbx,%rdi,8), %rdi
140083b51:     	testq	%rdi, %rdi
140083b54:     	je	0x140083b6e <.text+0x82b6e>
140083b56:     	movq	0x18(%rsi), %rbx
140083b5a:     	notq	%rdi
140083b5d:     	leaq	(%rdi,%rdi,2), %rdi
140083b61:     	shlq	$0x4, %rdi
140083b65:     	movq	0x10(%rbx,%rdi), %r12
140083b6a:     	movb	$0x1, %bl
140083b6c:     	jmp	0x140083b70 <.text+0x82b70>
140083b6e:     	xorl	%ebx, %ebx
140083b70:     	movq	0x8(%rsi), %r14
140083b74:     	movl	%r11d, %esi
140083b77:     	movl	%r10d, %r11d
140083b7a:     	incl	%r10d
140083b7d:     	movq	(%r14,%r11,8), %rdi
140083b81:     	leaq	(%r11,%r11,2), %r11
140083b85:     	leaq	(%r12,%r11,8), %r11
140083b89:     	testb	$0x1, %bl
140083b8c:     	movl	$0x0, %r15d
140083b92:     	cmoveq	%r15, %r11
140083b96:     	movq	%rdi, %r15
140083b99:     	shrq	$0x20, %r15
140083b9d:     	testl	%edi, %edi
140083b9f:     	cmovel	%r13d, %r15d
140083ba3:     	cmoveq	%r8, %r11
140083ba7:     	movl	%r15d, %r13d
140083baa:     	movq	%r11, %r8
140083bad:     	je	0x140083b07 <.text+0x82b07>
140083bb3:     	movl	%r15d, %r13d
140083bb6:     	movq	%r11, %r8
140083bb9:     	je	0x140083b07 <.text+0x82b07>
140083bbf:     	movl	$0x8, %ebx
140083bc4:     	jmp	0x140083ce8 <.text+0x82ce8>
140083bc9:     	movl	$0x8, %ebx
140083bce:     	xorl	%r12d, %r12d
140083bd1:     	xorl	%r14d, %r14d
140083bd4:     	xorl	%esi, %esi
140083bd6:     	xorl	%r10d, %r10d
140083bd9:     	cmpl	%esi, %r10d
140083bdc:     	jne	0x140083c8d <.text+0x82c8d>
140083be2:     	nopw	%cs:(%rax,%rax)
140083bf0:     	cmpq	%rcx, %rdx
140083bf3:     	je	0x140083cf9 <.text+0x82cf9>
140083bf9:     	movl	(%rdx), %r10d
140083bfc:     	addq	$0x4, %rdx
140083c00:     	movq	0x108(%rax), %r11
140083c07:     	leaq	(%r10,%r10,4), %r10
140083c0b:     	shlq	$0x5, %r10
140083c0f:     	movq	0x58(%r11,%r10), %rdi
140083c14:     	testq	%rdi, %rdi
140083c17:     	je	0x140083bf0 <.text+0x82bf0>
140083c19:     	addq	%r10, %r11
140083c1c:     	movq	0x110(%r9), %rsi
140083c23:     	xorl	%r10d, %r10d
140083c26:     	cmpq	0x88(%r11), %rsi
140083c2d:     	jae	0x140083c7f <.text+0x82c7f>
140083c2f:     	movq	0x80(%r11), %rbx
140083c36:     	cmpq	$0x0, (%rbx,%rsi,8)
140083c3b:     	je	0x140083c7f <.text+0x82c7f>
140083c3d:     	movl	0x94(%r11), %ebx
140083c44:     	leaq	(%rbx,%rbx,8), %rbx
140083c48:     	shlq	$0x3, %rbx
140083c4c:     	addq	0x1a8(%rax), %rbx
140083c53:     	movb	$0x1, %r14b
140083c56:     	cmpq	0x40(%rbx), %rsi
140083c5a:     	jae	0x140083c84 <.text+0x82c84>
140083c5c:     	movq	0x38(%rbx), %r15
140083c60:     	movq	(%r15,%rsi,8), %rsi
140083c64:     	testq	%rsi, %rsi
140083c67:     	je	0x140083c84 <.text+0x82c84>
140083c69:     	movq	0x18(%rbx), %rbx
140083c6d:     	notq	%rsi
140083c70:     	leaq	(%rsi,%rsi,2), %rsi
140083c74:     	shlq	$0x4, %rsi
140083c78:     	movq	0x10(%rbx,%rsi), %r12
140083c7d:     	jmp	0x140083c87 <.text+0x82c87>
140083c7f:     	xorl	%r14d, %r14d
140083c82:     	jmp	0x140083c87 <.text+0x82c87>
140083c84:     	xorl	%r12d, %r12d
140083c87:     	movq	0x50(%r11), %rbx
140083c8b:     	movl	%edi, %esi
140083c8d:     	movl	%r10d, %r11d
140083c90:     	shlq	$0x4, %r11
140083c94:     	incl	%r10d
140083c97:     	movq	(%rbx,%r11), %rdi
140083c9b:     	movl	0x8(%rbx,%r11), %r11d
140083ca0:     	notl	%r11d
140083ca3:     	leaq	(%r11,%r11,2), %r11
140083ca7:     	leaq	(%r12,%r11,8), %r11
140083cab:     	testb	$0x1, %r14b
140083caf:     	movl	$0x0, %r15d
140083cb5:     	cmoveq	%r15, %r11
140083cb9:     	movq	%rdi, %r15
140083cbc:     	shrq	$0x20, %r15
140083cc0:     	testl	%edi, %edi
140083cc2:     	cmovel	%r13d, %r15d
140083cc6:     	cmoveq	%r8, %r11
140083cca:     	movl	%r15d, %r13d
140083ccd:     	movq	%r11, %r8
140083cd0:     	je	0x140083bd9 <.text+0x82bd9>
140083cd6:     	movl	%r15d, %r13d
140083cd9:     	movq	%r11, %r8
140083cdc:     	je	0x140083bd9 <.text+0x82bd9>
140083ce2:     	movl	$0x8, %r14d
140083ce8:     	movl	%r15d, %r13d
140083ceb:     	movq	%r11, %r8
140083cee:     	jmp	0x140083d07 <.text+0x82d07>
140083cf0:     	xorl	%edi, %edi
140083cf2:     	movl	$0x8, %ebx
140083cf7:     	jmp	0x140083d01 <.text+0x82d01>
140083cf9:     	xorl	%edi, %edi
140083cfb:     	movl	$0x8, %r14d
140083d01:     	movq	%rcx, %rdx
140083d04:     	movl	%esi, %r10d
140083d07:     	cmpb	$0x0, 0x260(%rbp)
140083d0e:     	jne	0x140083d33 <.text+0x82d33>
140083d10:     	jmp	0x140083d92 <.text+0x82d92>
140083d15:     	leaq	(%r9,%r10,8), %r9
140083d19:     	movq	0x8(%r9), %r14
140083d1d:     	xorl	%r10d, %r10d
140083d20:     	movl	%r10d, %r9d
140083d23:     	incl	%r10d
140083d26:     	movl	(%r14,%r9,8), %r11d
140083d2a:     	testq	%r11, %r11
140083d2d:     	jne	0x140083dca <.text+0x82dca>
140083d33:     	cmpl	%esi, %r10d
140083d36:     	jne	0x140083d20 <.text+0x82d20>
140083d38:     	nopl	(%rax,%rax)
140083d40:     	cmpq	%rcx, %rdx
140083d43:     	je	0x140083dc7 <.text+0x82dc7>
140083d49:     	movl	(%rdx), %r10d
140083d4c:     	addq	$0x4, %rdx
140083d50:     	movq	0x1a8(%rax), %r9
140083d57:     	leaq	(%r10,%r10,8), %r10
140083d5b:     	movq	0x10(%r9,%r10,8), %rsi
140083d60:     	testq	%rsi, %rsi
140083d63:     	je	0x140083d40 <.text+0x82d40>
140083d65:     	jmp	0x140083d15 <.text+0x82d15>
140083d67:     	addq	%r11, %r10
140083d6a:     	movq	0x110(%r9), %r11
140083d71:     	cmpq	0x88(%r10), %r11
140083d78:     	movq	0x50(%r10), %rbx
140083d7c:     	xorl	%r10d, %r10d
140083d7f:     	movl	%r10d, %r11d
140083d82:     	shlq	$0x4, %r11
140083d86:     	incl	%r10d
140083d89:     	movl	(%rbx,%r11), %r11d
140083d8d:     	testq	%r11, %r11
140083d90:     	jne	0x140083dca <.text+0x82dca>
140083d92:     	cmpl	%esi, %r10d
140083d95:     	jne	0x140083d7f <.text+0x82d7f>
140083d97:     	nopw	(%rax,%rax)
140083da0:     	cmpq	%rcx, %rdx
140083da3:     	je	0x140083dc7 <.text+0x82dc7>
140083da5:     	movl	(%rdx), %r11d
140083da8:     	addq	$0x4, %rdx
140083dac:     	movq	0x108(%rax), %r10
140083db3:     	leaq	(%r11,%r11,4), %r11
140083db7:     	shlq	$0x5, %r11
140083dbb:     	movq	0x58(%r10,%r11), %rsi
140083dc0:     	testq	%rsi, %rsi
140083dc3:     	je	0x140083da0 <.text+0x82da0>
140083dc5:     	jmp	0x140083d67 <.text+0x82d67>
140083dc7:     	xorl	%r11d, %r11d
140083dca:     	testl	%edi, %edi
140083dcc:     	je	0x140083ec9 <.text+0x82ec9>
140083dd2:     	testq	%r11, %r11
140083dd5:     	jne	0x140083ec9 <.text+0x82ec9>
140083ddb:     	testq	%r8, %r8
140083dde:     	je	0x140083df2 <.text+0x82df2>
140083de0:     	movq	0x10(%r8), %rax
140083de4:     	cmpq	0x200(%rbp), %rax
140083deb:     	jne	0x140083e01 <.text+0x82e01>
140083ded:     	jmp	0x140083ec9 <.text+0x82ec9>
140083df2:     	xorl	%eax, %eax
140083df4:     	cmpq	0x200(%rbp), %rax
140083dfb:     	je	0x140083ec9 <.text+0x82ec9>
140083e01:     	movq	0x178(%rbp), %rax
140083e08:     	movq	0x10(%rax), %r14
140083e0c:     	testq	%r14, %r14
140083e0f:     	movq	0x20(%rax), %r15
140083e13:     	movq	0x18(%rax), %r12
140083e17:     	movupd	(%rax), %xmm6
140083e1b:     	movq	%r14, %rsi
140083e1e:     	cmoveq	%r12, %rsi
140083e22:     	movq	(%rsi), %rax
140083e25:     	movq	0x10(%rsi), %rbx
140083e29:     	subq	%rbx, %rax
140083e2c:     	cmpq	$0xf, %rax
140083e30:     	jbe	0x1400855d4 <.text+0x845d4>
140083e36:     	movl	%edi, %eax
140083e38:     	shlq	$0x20, %r13
140083e3c:     	orq	%rax, %r13
140083e3f:     	movq	0x8(%rsi), %rax
140083e43:     	leaq	0xf3036(%rip), %rcx     # 0x140176e80 <.text+0x175e80>
140083e4a:     	movq	%rcx, (%rax,%rbx)
140083e4e:     	movq	%r13, 0x8(%rax,%rbx)
140083e53:     	addq	$0x10, %rbx
140083e57:     	movq	%rbx, 0x10(%rsi)
140083e5b:     	xorl	%eax, %eax
140083e5d:     	cmpq	$0x2, 0x200(%rbp)
140083e65:     	setae	%al
140083e68:     	leaq	0x5891901(%rip), %rcx   # 0x145915770
140083e6f:     	movss	(%rcx,%rax,4), %xmm0
140083e74:     	movss	%xmm0, 0x230(%rbp)
140083e7c:     	movq	%r13, -0x10(%rbp)
140083e80:     	movupd	%xmm6, -0x8(%rbp)
140083e85:     	movq	%r14, 0x8(%rbp)
140083e89:     	movq	%r12, 0x10(%rbp)
140083e8d:     	movq	%r15, 0x18(%rbp)
140083e91:     	leaq	0x1f0(%rbp), %rax
140083e98:     	movq	%rax, 0x190(%rbp)
140083e9f:     	leaq	-0x40(%rbp), %rax
140083ea3:     	movq	%rax, 0x198(%rbp)
140083eaa:     	leaq	0x230(%rbp), %rax
140083eb1:     	movq	%rax, 0x1a0(%rbp)
140083eb8:     	leaq	-0x10(%rbp), %rcx
140083ebc:     	leaq	0x190(%rbp), %rdx
140083ec3:     	callq	0x140102250 <.text+0x101250>
140083ec8:     	nop
140083ec9:     	movq	0x278(%rbp), %rax
140083ed0:     	leaq	0x240(%rax), %rcx
140083ed7:     	movq	0x280(%rbp), %rdx
140083ede:     	callq	0x14036aed0 <.text+0x369ed0>
140083ee3:     	nop
140083ee4:     	movq	0x278(%rbp), %rcx
140083eeb:     	movq	0x338(%rcx), %r12
140083ef2:     	movq	0x340(%rcx), %rax
140083ef9:     	leaq	(%r12,%rax,4), %rsi
140083efd:     	movzbl	0x348(%rcx), %r11d
140083f05:     	movl	$0x8, %eax
140083f0a:     	movq	%rax, 0x210(%rbp)
140083f11:     	xorl	%edx, %edx
140083f13:     	xorl	%edi, %edi
140083f15:     	xorl	%r9d, %r9d
140083f18:     	xorl	%r8d, %r8d
140083f1b:     	movb	%r11b, 0x228(%rbp)
140083f22:     	testb	%r11b, %r11b
140083f25:     	je	0x140083fa3 <.text+0x82fa3>
140083f27:     	cmpl	%edi, %edx
140083f29:     	jne	0x140084069 <.text+0x83069>
140083f2f:     	nop
140083f30:     	cmpq	%rsi, %r12
140083f33:     	je	0x14008425c <.text+0x8325c>
140083f39:     	movl	(%r12), %ecx
140083f3d:     	addq	$0x4, %r12
140083f41:     	movq	0x280(%rbp), %rax
140083f48:     	movq	0x1a8(%rax), %rax
140083f4f:     	leaq	(%rcx,%rcx,8), %rcx
140083f53:     	movq	0x10(%rax,%rcx,8), %rdi
140083f58:     	testq	%rdi, %rdi
140083f5b:     	je	0x140083f30 <.text+0x82f30>
140083f5d:     	leaq	(%rax,%rcx,8), %r8
140083f61:     	movq	0x278(%rbp), %rax
140083f68:     	movq	0x358(%rax), %rdx
140083f6f:     	movq	0x18(%r8), %rax
140083f73:     	movq	0x38(%r8), %rcx
140083f77:     	cmpq	0x40(%r8), %rdx
140083f7b:     	jae	0x140084036 <.text+0x83036>
140083f81:     	movq	(%rcx,%rdx,8), %rdx
140083f85:     	testq	%rdx, %rdx
140083f88:     	je	0x140084036 <.text+0x83036>
140083f8e:     	notq	%rdx
140083f91:     	leaq	(%rdx,%rdx,2), %rdx
140083f95:     	shlq	$0x4, %rdx
140083f99:     	movq	0x10(%rax,%rdx), %r9
140083f9e:     	jmp	0x140084039 <.text+0x83039>
140083fa3:     	cmpl	%edi, %edx
140083fa5:     	jne	0x1400840ab <.text+0x830ab>
140083fab:     	nopl	(%rax,%rax)
140083fb0:     	cmpq	%rsi, %r12
140083fb3:     	je	0x14008425c <.text+0x8325c>
140083fb9:     	movl	(%r12), %ecx
140083fbd:     	addq	$0x4, %r12
140083fc1:     	movq	0x280(%rbp), %rax
140083fc8:     	movq	0x108(%rax), %rax
140083fcf:     	leaq	(%rcx,%rcx,4), %rcx
140083fd3:     	shlq	$0x5, %rcx
140083fd7:     	movq	0x58(%rax,%rcx), %rdi
140083fdc:     	testq	%rdi, %rdi
140083fdf:     	je	0x140083fb0 <.text+0x82fb0>
140083fe1:     	addq	%rcx, %rax
140083fe4:     	movl	0x94(%rax), %ecx
140083fea:     	movq	0x280(%rbp), %rdx
140083ff1:     	movq	0x1a8(%rdx), %r9
140083ff8:     	leaq	(%rcx,%rcx,8), %r10
140083ffc:     	movq	0x278(%rbp), %rcx
140084003:     	movq	0x358(%rcx), %r8
14008400a:     	movq	0x18(%r9,%r10,8), %rcx
14008400f:     	movq	0x38(%r9,%r10,8), %rdx
140084014:     	cmpq	0x40(%r9,%r10,8), %r8
140084019:     	jae	0x14008406d <.text+0x8306d>
14008401b:     	movq	(%rdx,%r8,8), %r8
14008401f:     	testq	%r8, %r8
140084022:     	je	0x14008406d <.text+0x8306d>
140084024:     	notq	%r8
140084027:     	leaq	(%r8,%r8,2), %r8
14008402b:     	shlq	$0x4, %r8
14008402f:     	movq	0x10(%rcx,%r8), %r9
140084034:     	jmp	0x140084070 <.text+0x83070>
140084036:     	xorl	%r9d, %r9d
140084039:     	movq	0x278(%rbp), %rdx
140084040:     	movq	0x350(%rdx), %rdx
140084047:     	movq	(%rcx,%rdx,8), %rcx
14008404b:     	notq	%rcx
14008404e:     	leaq	(%rcx,%rcx,2), %rcx
140084052:     	shlq	$0x4, %rcx
140084056:     	movq	0x10(%rax,%rcx), %r8
14008405b:     	movq	0x28(%rax,%rcx), %rax
140084060:     	movq	%rax, 0x260(%rbp)
140084067:     	xorl	%edx, %edx
140084069:     	movl	%edx, %eax
14008406b:     	jmp	0x1400840be <.text+0x830be>
14008406d:     	xorl	%r9d, %r9d
140084070:     	movq	0x278(%rbp), %r8
140084077:     	movq	0x350(%r8), %r8
14008407e:     	movq	(%rdx,%r8,8), %rdx
140084082:     	notq	%rdx
140084085:     	leaq	(%rdx,%rdx,2), %rdx
140084089:     	shlq	$0x4, %rdx
14008408d:     	movq	0x10(%rcx,%rdx), %r8
140084092:     	movq	0x28(%rcx,%rdx), %rcx
140084097:     	movq	%rcx, 0x260(%rbp)
14008409e:     	movq	0x50(%rax), %rax
1400840a2:     	movq	%rax, 0x210(%rbp)
1400840a9:     	xorl	%edx, %edx
1400840ab:     	movl	%edx, %eax
1400840ad:     	shlq	$0x4, %rax
1400840b1:     	movq	0x210(%rbp), %rcx
1400840b8:     	movl	0x8(%rcx,%rax), %eax
1400840bc:     	notl	%eax
1400840be:     	leaq	(%rax,%rax,2), %rcx
1400840c2:     	leaq	(%r8,%rcx,8), %r14
1400840c6:     	movq	0x260(%rbp), %rcx
1400840cd:     	leaq	(%rcx,%rax,4), %rcx
1400840d1:     	movq	%rcx, 0x188(%rbp)
1400840d8:     	leaq	(%r9,%rax,8), %rax
1400840dc:     	incl	%edx
1400840de:     	movq	(%rax), %rax
1400840e1:     	cmpq	0x200(%rbp), %rax
1400840e8:     	jae	0x140083f22 <.text+0x82f22>
1400840ee:     	movl	%edx, 0x220(%rbp)
1400840f4:     	movq	%r14, 0x258(%rbp)
1400840fb:     	movq	%r8, %rbx
1400840fe:     	movq	%r9, %r13
140084101:     	movq	0x1f8(%rbp), %rcx
140084108:     	movq	(%rcx,%rax,8), %r8
14008410c:     	movl	$0x4, %edx
140084111:     	leaq	0x58923bc(%rip), %rcx   # 0x1459164d4
140084118:     	callq	0x142affbe0 <.text+0x2afebe0>
14008411d:     	nop
14008411e:     	testq	%rax, %rax
140084121:     	jne	0x14008412a <.text+0x8312a>
140084123:     	movq	0x798968e(%rip), %rax   # 0x147a0d7b8
14008412a:     	cmpb	$0x3, (%rax)
14008412d:     	movzbl	0x228(%rbp), %r11d
140084135:     	movq	%r13, %r9
140084138:     	movq	%rbx, %r8
14008413b:     	movq	0x258(%rbp), %rcx
140084142:     	movl	0x220(%rbp), %edx
140084148:     	jne	0x140083f22 <.text+0x82f22>
14008414e:     	movq	0x10(%rax), %r15
140084152:     	movq	0x18(%rax), %r10
140084156:     	cmpq	%r10, 0x10(%rcx)
14008415a:     	jne	0x14008419a <.text+0x8319a>
14008415c:     	movq	0x8(%rcx), %rcx
140084160:     	movq	%r15, %rdx
140084163:     	movq	%r10, %r8
140084166:     	movq	%r15, %r14
140084169:     	movq	%r10, %r15
14008416c:     	callq	0x1457731e7 <.text+0x57721e7>
140084171:     	movq	%r15, %r10
140084174:     	movq	%r14, %r15
140084177:     	movl	0x220(%rbp), %edx
14008417d:     	movq	0x258(%rbp), %rcx
140084184:     	movq	%rbx, %r8
140084187:     	movq	%r13, %r9
14008418a:     	movzbl	0x228(%rbp), %r11d
140084192:     	testl	%eax, %eax
140084194:     	je	0x140083f22 <.text+0x82f22>
14008419a:     	testq	%r10, %r10
14008419d:     	js	0x1400855c3 <.text+0x845c3>
1400841a3:     	je	0x1400841f2 <.text+0x831f2>
1400841a5:     	movq	%r10, %r14
1400841a8:     	callq	0x140002200 <.text+0x1200>
1400841ad:     	movl	$0x1, %edx
1400841b2:     	movq	%r14, %rcx
1400841b5:     	callq	0x1400021c0 <.text+0x11c0>
1400841ba:     	testq	%rax, %rax
1400841bd:     	je	0x140085619 <.text+0x84619>
1400841c3:     	movq	%rax, 0x218(%rbp)
1400841ca:     	movq	%rax, %rcx
1400841cd:     	movq	%r15, %rdx
1400841d0:     	movq	%r14, %r8
1400841d3:     	callq	0x1457731ed <.text+0x57721ed>
1400841d8:     	movzbl	0x228(%rbp), %r11d
1400841e0:     	movq	%r13, %r9
1400841e3:     	movq	%rbx, %r8
1400841e6:     	movq	0x258(%rbp), %rcx
1400841ed:     	movq	%r14, %r10
1400841f0:     	jmp	0x1400841fe <.text+0x831fe>
1400841f2:     	movl	$0x1, %eax
1400841f7:     	movq	%rax, 0x218(%rbp)
1400841fe:     	movl	0x254(%rbp), %eax
140084204:     	movq	0x188(%rbp), %rdx
14008420b:     	movl	%eax, (%rdx)
14008420d:     	movq	(%rcx), %rdx
140084210:     	testq	%rdx, %rdx
140084213:     	je	0x14008423f <.text+0x8323f>
140084215:     	movq	0x8(%rcx), %rcx
140084219:     	movl	$0x1, %r8d
14008421f:     	movq	%r10, %r15
140084222:     	callq	0x1400021d0 <.text+0x11d0>
140084227:     	movq	%r15, %r10
14008422a:     	movq	0x258(%rbp), %rcx
140084231:     	movq	%rbx, %r8
140084234:     	movq	%r13, %r9
140084237:     	movzbl	0x228(%rbp), %r11d
14008423f:     	movq	%r10, (%rcx)
140084242:     	movq	0x218(%rbp), %rax
140084249:     	movq	%rax, 0x8(%rcx)
14008424d:     	movq	%r10, 0x10(%rcx)
140084251:     	movl	0x220(%rbp), %edx
140084257:     	jmp	0x140083f22 <.text+0x82f22>
14008425c:     	movq	0x378(%rbp), %rax
140084263:     	movq	(%rax), %r11
140084266:     	movq	0x8(%rax), %r13
14008426a:     	movl	0x14(%rax), %eax
14008426d:     	movl	%eax, 0x184(%rbp)
140084273:     	movq	0xf8(%r11), %rsi
14008427a:     	movq	0x100(%r11), %rax
140084281:     	leaq	(%rsi,%rax,4), %r14
140084285:     	movzbl	0x108(%r11), %r15d
14008428d:     	movl	$0x8, %r9d
140084293:     	xorl	%edx, %edx
140084295:     	movsd	0x5883003(%rip), %xmm6  # 0x1459072a0
14008429d:     	movapd	0x588300b(%rip), %xmm7  # 0x1459072b0
1400842a5:     	movsd	0x5883172(%rip), %xmm8  # 0x145907420
1400842ae:     	movsd	0x58831d1(%rip), %xmm9  # 0x145907488
1400842b7:     	xorl	%edi, %edi
1400842b9:     	xorl	%r10d, %r10d
1400842bc:     	xorl	%r8d, %r8d
1400842bf:     	movq	%r11, 0x218(%rbp)
1400842c6:     	movb	%r15b, 0x26f(%rbp)
1400842cd:     	testb	%r15b, %r15b
1400842d0:     	je	0x140084343 <.text+0x83343>
1400842d2:     	cmpl	%edi, %edx
1400842d4:     	jne	0x1400843eb <.text+0x833eb>
1400842da:     	nopw	(%rax,%rax)
1400842e0:     	cmpq	%r14, %rsi
1400842e3:     	je	0x1400845dc <.text+0x835dc>
1400842e9:     	movl	(%rsi), %ecx
1400842eb:     	addq	$0x4, %rsi
1400842ef:     	movq	0x1a8(%r13), %rax
1400842f6:     	leaq	(%rcx,%rcx,8), %rcx
1400842fa:     	movq	0x10(%rax,%rcx,8), %rdi
1400842ff:     	testq	%rdi, %rdi
140084302:     	je	0x1400842e0 <.text+0x832e0>
140084304:     	leaq	(%rax,%rcx,8), %r8
140084308:     	movq	0x118(%r11), %rdx
14008430f:     	movq	0x18(%r8), %rax
140084313:     	movq	0x38(%r8), %rcx
140084317:     	cmpq	0x40(%r8), %rdx
14008431b:     	jae	0x1400843bf <.text+0x833bf>
140084321:     	movq	(%rcx,%rdx,8), %rdx
140084325:     	testq	%rdx, %rdx
140084328:     	je	0x1400843bf <.text+0x833bf>
14008432e:     	notq	%rdx
140084331:     	leaq	(%rdx,%rdx,2), %rdx
140084335:     	shlq	$0x4, %rdx
140084339:     	movq	0x10(%rax,%rdx), %r10
14008433e:     	jmp	0x1400843c2 <.text+0x833c2>
140084343:     	cmpl	%edi, %edx
140084345:     	jne	0x14008441f <.text+0x8341f>
14008434b:     	nopl	(%rax,%rax)
140084350:     	cmpq	%r14, %rsi
140084353:     	je	0x1400845dc <.text+0x835dc>
140084359:     	movl	(%rsi), %ecx
14008435b:     	addq	$0x4, %rsi
14008435f:     	movq	0x108(%r13), %rax
140084366:     	leaq	(%rcx,%rcx,4), %rcx
14008436a:     	shlq	$0x5, %rcx
14008436e:     	movq	0x58(%rax,%rcx), %rdi
140084373:     	testq	%rdi, %rdi
140084376:     	je	0x140084350 <.text+0x83350>
140084378:     	addq	%rcx, %rax
14008437b:     	movl	0x94(%rax), %ecx
140084381:     	movq	0x1a8(%r13), %r9
140084388:     	leaq	(%rcx,%rcx,8), %r10
14008438c:     	movq	0x118(%r11), %r8
140084393:     	movq	0x18(%r9,%r10,8), %rcx
140084398:     	movq	0x38(%r9,%r10,8), %rdx
14008439d:     	cmpq	0x40(%r9,%r10,8), %r8
1400843a2:     	jae	0x1400843ef <.text+0x833ef>
1400843a4:     	movq	(%rdx,%r8,8), %r8
1400843a8:     	testq	%r8, %r8
1400843ab:     	je	0x1400843ef <.text+0x833ef>
1400843ad:     	notq	%r8
1400843b0:     	leaq	(%r8,%r8,2), %r8
1400843b4:     	shlq	$0x4, %r8
1400843b8:     	movq	0x10(%rcx,%r8), %r10
1400843bd:     	jmp	0x1400843f2 <.text+0x833f2>
1400843bf:     	xorl	%r10d, %r10d
1400843c2:     	movq	0x110(%r11), %rdx
1400843c9:     	movq	(%rcx,%rdx,8), %rcx
1400843cd:     	notq	%rcx
1400843d0:     	leaq	(%rcx,%rcx,2), %rcx
1400843d4:     	shlq	$0x4, %rcx
1400843d8:     	movq	0x10(%rax,%rcx), %r8
1400843dd:     	movq	0x28(%rax,%rcx), %rax
1400843e2:     	movq	%rax, 0x260(%rbp)
1400843e9:     	xorl	%edx, %edx
1400843eb:     	movl	%edx, %eax
1400843ed:     	jmp	0x14008442c <.text+0x8342c>
1400843ef:     	xorl	%r10d, %r10d
1400843f2:     	movq	0x110(%r11), %r8
1400843f9:     	movq	(%rdx,%r8,8), %rdx
1400843fd:     	notq	%rdx
140084400:     	leaq	(%rdx,%rdx,2), %rdx
140084404:     	shlq	$0x4, %rdx
140084408:     	movq	0x10(%rcx,%rdx), %r8
14008440d:     	movq	0x28(%rcx,%rdx), %rcx
140084412:     	movq	%rcx, 0x260(%rbp)
140084419:     	movq	0x50(%rax), %r9
14008441d:     	xorl	%edx, %edx
14008441f:     	movl	%edx, %eax
140084421:     	shlq	$0x4, %rax
140084425:     	movl	0x8(%r9,%rax), %eax
14008442a:     	notl	%eax
14008442c:     	leaq	(%rax,%rax,2), %r12
140084430:     	shlq	$0x7, %r12
140084434:     	addq	%r8, %r12
140084437:     	movq	0x260(%rbp), %rcx
14008443e:     	leaq	(%rcx,%rax,4), %rcx
140084442:     	leaq	(%r10,%rax,8), %rax
140084446:     	incl	%edx
140084448:     	movq	(%rax), %rbx
14008444b:     	cmpq	0x200(%rbp), %rbx
140084452:     	jae	0x1400842cd <.text+0x832cd>
140084458:     	movq	%rcx, 0x258(%rbp)
14008445f:     	movq	%r8, 0x188(%rbp)
140084466:     	movq	%rdx, 0x210(%rbp)
14008446d:     	movq	%r10, 0x228(%rbp)
140084474:     	movq	%r9, 0x220(%rbp)
14008447b:     	movq	0x1f8(%rbp), %r15
140084482:     	movq	(%r15,%rbx,8), %r8
140084486:     	movl	$0x2, %edx
14008448b:     	leaq	0x58927dd(%rip), %rcx   # 0x145916c6f
140084492:     	callq	0x142affbe0 <.text+0x2afebe0>
140084497:     	nop
140084498:     	testq	%rax, %rax
14008449b:     	jne	0x1400844a4 <.text+0x834a4>
14008449d:     	movq	0x7989314(%rip), %rax   # 0x147a0d7b8
1400844a4:     	xorpd	%xmm10, %xmm10
1400844a9:     	cmpb	$0x2, (%rax)
1400844ac:     	jne	0x1400844ec <.text+0x834ec>
1400844ae:     	movq	0x8(%rax), %rcx
1400844b2:     	cmpq	$0x2, %rcx
1400844b6:     	je	0x1400844c9 <.text+0x834c9>
1400844b8:     	cmpl	$0x1, %ecx
1400844bb:     	jne	0x1400844d1 <.text+0x834d1>
1400844bd:     	xorps	%xmm10, %xmm10
1400844c1:     	cvtsi2sdq	0x10(%rax), %xmm10
1400844c7:     	jmp	0x1400844ec <.text+0x834ec>
1400844c9:     	movsd	0x10(%rax), %xmm10
1400844cf:     	jmp	0x1400844ec <.text+0x834ec>
1400844d1:     	movsd	0x10(%rax), %xmm0
1400844d6:     	unpcklps	%xmm6, %xmm0            # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1]
1400844d9:     	subpd	%xmm7, %xmm0
1400844dd:     	movapd	%xmm0, %xmm10
1400844e2:     	unpckhpd	%xmm0, %xmm10           # xmm10 = xmm10[1],xmm0[1]
1400844e7:     	addsd	%xmm0, %xmm10
1400844ec:     	movq	(%r15,%rbx,8), %r8
1400844f0:     	movl	$0x5, %edx
1400844f5:     	leaq	0x5892775(%rip), %rcx   # 0x145916c71
1400844fc:     	callq	0x142affbe0 <.text+0x2afebe0>
140084501:     	nop
140084502:     	testq	%rax, %rax
140084505:     	movq	0x258(%rbp), %rcx
14008450c:     	jne	0x140084515 <.text+0x83515>
14008450e:     	movq	0x79892a3(%rip), %rax   # 0x147a0d7b8
140084515:     	cmpb	$0x2, (%rax)
140084518:     	movapd	%xmm8, %xmm0
14008451d:     	movq	0x218(%rbp), %r11
140084524:     	movzbl	0x26f(%rbp), %r15d
14008452c:     	movq	0x220(%rbp), %r9
140084533:     	movq	0x228(%rbp), %r10
14008453a:     	movq	0x210(%rbp), %rdx
140084541:     	movq	0x188(%rbp), %r8
140084548:     	jne	0x140084596 <.text+0x83596>
14008454a:     	movq	0x8(%rax), %rcx
14008454e:     	cmpq	$0x2, %rcx
140084552:     	je	0x140084564 <.text+0x83564>
140084554:     	cmpl	$0x1, %ecx
140084557:     	jne	0x140084572 <.text+0x83572>
140084559:     	xorps	%xmm0, %xmm0
14008455c:     	cvtsi2sdq	0x10(%rax), %xmm0
140084562:     	jmp	0x140084569 <.text+0x83569>
140084564:     	movsd	0x10(%rax), %xmm0
140084569:     	movq	0x258(%rbp), %rcx
140084570:     	jmp	0x140084591 <.text+0x83591>
140084572:     	movq	0x258(%rbp), %rcx
140084579:     	movsd	0x10(%rax), %xmm1
14008457e:     	unpcklps	%xmm6, %xmm1            # xmm1 = xmm1[0],xmm6[0],xmm1[1],xmm6[1]
140084581:     	subpd	%xmm7, %xmm1
140084585:     	movapd	%xmm1, %xmm0
140084589:     	unpckhpd	%xmm1, %xmm0            # xmm0 = xmm0[1],xmm1[1]
14008458d:     	addsd	%xmm1, %xmm0
140084591:     	maxsd	%xmm8, %xmm0
140084596:     	divsd	%xmm0, %xmm10
14008459b:     	mulsd	%xmm9, %xmm10
1400845a0:     	xorpd	%xmm0, %xmm0
1400845a4:     	maxsd	%xmm10, %xmm0
1400845a9:     	movapd	%xmm9, %xmm1
1400845ae:     	minsd	%xmm0, %xmm1
1400845b2:     	xorps	%xmm0, %xmm0
1400845b5:     	cvtsd2ss	%xmm1, %xmm0
1400845b9:     	movl	0x184(%rbp), %eax
1400845bf:     	movl	%eax, (%rcx)
1400845c1:     	movl	$0x2, 0x88(%r12)
1400845cd:     	movss	%xmm0, 0x8c(%r12)
1400845d7:     	jmp	0x1400842cd <.text+0x832cd>
1400845dc:     	movq	0x278(%rbp), %rax
1400845e3:     	leaq	0x360(%rax), %rcx
1400845ea:     	movq	0x280(%rbp), %rdx
1400845f1:     	callq	0x14036aed0 <.text+0x369ed0>
1400845f6:     	nop
1400845f7:     	movq	0x278(%rbp), %rax
1400845fe:     	movq	0x458(%rax), %rcx
140084605:     	movq	0x460(%rax), %rdx
14008460c:     	movzbl	0x468(%rax), %r8d
140084614:     	leaq	(,%rdx,4), %r10
14008461c:     	movq	%rcx, %rax
14008461f:     	testb	%r8b, %r8b
140084622:     	je	0x1400846b0 <.text+0x836b0>
140084628:     	movq	0x270(%rbp), %rbx
14008462f:     	nop
140084630:     	testq	%r10, %r10
140084633:     	je	0x14008475f <.text+0x8375f>
140084639:     	movl	(%rax), %r9d
14008463c:     	addq	$0x4, %rax
140084640:     	movq	0x280(%rbp), %r11
140084647:     	movq	0x1a8(%r11), %r11
14008464e:     	leaq	(%r9,%r9,8), %rsi
140084652:     	movq	0x10(%r11,%rsi,8), %r9
140084657:     	addq	$-0x4, %r10
14008465b:     	testq	%r9, %r9
14008465e:     	je	0x140084630 <.text+0x83630>
140084660:     	leaq	(%r11,%rsi,8), %r10
140084664:     	movq	0x278(%rbp), %r11
14008466b:     	movq	0x470(%r11), %r11
140084672:     	movq	0x18(%r10), %rdi
140084676:     	movq	0x38(%r10), %r10
14008467a:     	movq	(%r10,%r11,8), %r10
14008467e:     	notq	%r10
140084681:     	leaq	(%r10,%r10,2), %r10
140084685:     	shlq	$0x4, %r10
140084689:     	movq	0x10(%rdi,%r10), %rsi
14008468e:     	movq	0x28(%rdi,%r10), %rdi
140084693:     	movl	$0x1, %r10d
140084699:     	leaq	(%rcx,%rdx,4), %rcx
14008469d:     	testb	%r8b, %r8b
1400846a0:     	je	0x140084770 <.text+0x83770>
1400846a6:     	jmp	0x1400847c6 <.text+0x837c6>
1400846ab:     	nopl	(%rax,%rax)
1400846b0:     	testq	%r10, %r10
1400846b3:     	je	0x1400847ae <.text+0x837ae>
1400846b9:     	movl	(%rax), %r9d
1400846bc:     	addq	$0x4, %rax
1400846c0:     	movq	0x280(%rbp), %r11
1400846c7:     	movq	0x108(%r11), %r11
1400846ce:     	leaq	(%r9,%r9,4), %rsi
1400846d2:     	shlq	$0x5, %rsi
1400846d6:     	movq	0x58(%r11,%rsi), %r9
1400846db:     	addq	$-0x4, %r10
1400846df:     	testq	%r9, %r9
1400846e2:     	je	0x1400846b0 <.text+0x836b0>
1400846e4:     	addq	%rsi, %r11
1400846e7:     	movl	0x94(%r11), %r10d
1400846ee:     	movq	0x280(%rbp), %rsi
1400846f5:     	movq	0x1a8(%rsi), %rsi
1400846fc:     	leaq	(%r10,%r10,8), %r10
140084700:     	movq	0x278(%rbp), %rdi
140084707:     	movq	0x470(%rdi), %rdi
14008470e:     	movq	0x18(%rsi,%r10,8), %rbx
140084713:     	movq	0x38(%rsi,%r10,8), %r10
140084718:     	movq	(%r10,%rdi,8), %r10
14008471c:     	notq	%r10
14008471f:     	movq	0x50(%r11), %r11
140084723:     	movl	0x8(%r11), %edi
140084727:     	leaq	(%r10,%r10,2), %r10
14008472b:     	shlq	$0x4, %r10
14008472f:     	notl	%edi
140084731:     	leaq	(%rdi,%rdi,2), %rsi
140084735:     	shlq	$0x3, %rsi
140084739:     	addq	0x10(%rbx,%r10), %rsi
14008473e:     	shlq	$0x2, %rdi
140084742:     	addq	0x28(%rbx,%r10), %rdi
140084747:     	movl	$0x1, %r10d
14008474d:     	movq	0x270(%rbp), %rbx
140084754:     	leaq	(%rcx,%rdx,4), %rcx
140084758:     	testb	%r8b, %r8b
14008475b:     	je	0x140084770 <.text+0x83770>
14008475d:     	jmp	0x1400847c6 <.text+0x837c6>
14008475f:     	xorl	%r9d, %r9d
140084762:     	xorl	%r10d, %r10d
140084765:     	xorl	%esi, %esi
140084767:     	leaq	(%rcx,%rdx,4), %rcx
14008476b:     	testb	%r8b, %r8b
14008476e:     	jne	0x1400847c6 <.text+0x837c6>
140084770:     	cmpl	%r9d, %r10d
140084773:     	jne	0x140084915 <.text+0x83915>
140084779:     	nopl	(%rax)
140084780:     	cmpq	%rcx, %rax
140084783:     	je	0x1400847fa <.text+0x837fa>
140084785:     	movl	(%rax), %edx
140084787:     	addq	$0x4, %rax
14008478b:     	movq	0x280(%rbp), %r8
140084792:     	movq	0x108(%r8), %r8
140084799:     	leaq	(%rdx,%rdx,4), %rdx
14008479d:     	shlq	$0x5, %rdx
1400847a1:     	cmpq	$0x0, 0x58(%r8,%rdx)
1400847a7:     	je	0x140084780 <.text+0x83780>
1400847a9:     	jmp	0x140084915 <.text+0x83915>
1400847ae:     	xorl	%r9d, %r9d
1400847b1:     	xorl	%r10d, %r10d
1400847b4:     	xorl	%esi, %esi
1400847b6:     	movq	0x270(%rbp), %rbx
1400847bd:     	leaq	(%rcx,%rdx,4), %rcx
1400847c1:     	testb	%r8b, %r8b
1400847c4:     	je	0x140084770 <.text+0x83770>
1400847c6:     	cmpl	%r9d, %r10d
1400847c9:     	jne	0x140084915 <.text+0x83915>
1400847cf:     	nop
1400847d0:     	cmpq	%rcx, %rax
1400847d3:     	je	0x1400847fa <.text+0x837fa>
1400847d5:     	movl	(%rax), %edx
1400847d7:     	addq	$0x4, %rax
1400847db:     	movq	0x280(%rbp), %r8
1400847e2:     	movq	0x1a8(%r8), %r8
1400847e9:     	leaq	(%rdx,%rdx,8), %rdx
1400847ed:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
1400847f3:     	je	0x1400847d0 <.text+0x837d0>
1400847f5:     	jmp	0x140084915 <.text+0x83915>
1400847fa:     	testq	%rsi, %rsi
1400847fd:     	je	0x140084915 <.text+0x83915>
140084803:     	leaq	0x5892013(%rip), %rcx   # 0x14591681d
14008480a:     	movl	$0x5, %edx
14008480f:     	leaq	0x60(%rbx), %r8
140084813:     	callq	0x142affbe0 <.text+0x2afebe0>
140084818:     	nop
140084819:     	testq	%rax, %rax
14008481c:     	jne	0x140084825 <.text+0x83825>
14008481e:     	movq	0x7988f93(%rip), %rax   # 0x147a0d7b8
140084825:     	xorpd	%xmm0, %xmm0
140084829:     	cmpb	$0x2, (%rax)
14008482c:     	xorpd	%xmm1, %xmm1
140084830:     	jne	0x140084873 <.text+0x83873>
140084832:     	movq	0x8(%rax), %rcx
140084836:     	cmpq	$0x2, %rcx
14008483a:     	je	0x14008484c <.text+0x8384c>
14008483c:     	cmpl	$0x1, %ecx
14008483f:     	jne	0x140084853 <.text+0x83853>
140084841:     	xorps	%xmm1, %xmm1
140084844:     	cvtsi2sdq	0x10(%rax), %xmm1
14008484a:     	jmp	0x140084873 <.text+0x83873>
14008484c:     	movsd	0x10(%rax), %xmm1
140084851:     	jmp	0x140084873 <.text+0x83873>
140084853:     	movsd	0x10(%rax), %xmm2
140084858:     	unpcklps	0x5882a41(%rip), %xmm2  # xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
                                                # 0x1459072a0
14008485f:     	subpd	0x5882a49(%rip), %xmm2  # 0x1459072b0
140084867:     	movapd	%xmm2, %xmm1
14008486b:     	unpckhpd	%xmm2, %xmm1            # xmm1 = xmm1[1],xmm2[1]
14008486f:     	addsd	%xmm2, %xmm1
140084873:     	cvttsd2si	%xmm1, %rax
140084878:     	movq	%rax, %rcx
14008487b:     	movapd	%xmm1, %xmm2
14008487f:     	subsd	0x5882bf1(%rip), %xmm2  # 0x145907478
140084887:     	cvttsd2si	%xmm2, %rdx
14008488c:     	sarq	$0x3f, %rcx
140084890:     	andq	%rcx, %rdx
140084893:     	orq	%rax, %rdx
140084896:     	xorl	%eax, %eax
140084898:     	ucomisd	%xmm0, %xmm1
14008489c:     	cmovaeq	%rdx, %rax
1400848a0:     	ucomisd	0x5882bd8(%rip), %xmm1  # 0x145907480
1400848a8:     	movq	$-0x1, %rcx
1400848af:     	cmovbeq	%rax, %rcx
1400848b3:     	movq	%rcx, 0x190(%rbp)
1400848ba:     	leaq	0x190(%rbp), %rax
1400848c1:     	movq	%rax, -0x10(%rbp)
1400848c5:     	leaq	0x56b6a74(%rip), %rax   # 0x14573b340 <.text+0x573a340>
1400848cc:     	movq	%rax, -0x8(%rbp)
1400848d0:     	leaq	0x5891f3b(%rip), %rdx   # 0x145916812
1400848d7:     	leaq	-0x58(%rbp), %rcx
1400848db:     	leaq	-0x10(%rbp), %r8
1400848df:     	callq	0x145728390 <.text+0x5727390>
1400848e4:     	nop
1400848e5:     	movl	0x254(%rbp), %eax
1400848eb:     	movl	%eax, (%rdi)
1400848ed:     	movq	(%rsi), %rdx
1400848f0:     	testq	%rdx, %rdx
1400848f3:     	je	0x140084904 <.text+0x83904>
1400848f5:     	movq	0x8(%rsi), %rcx
1400848f9:     	movl	$0x1, %r8d
1400848ff:     	callq	0x1400021d0 <.text+0x11d0>
140084904:     	movq	-0x48(%rbp), %rax
140084908:     	movq	%rax, 0x10(%rsi)
14008490c:     	movupd	-0x58(%rbp), %xmm0
140084911:     	movupd	%xmm0, (%rsi)
140084915:     	movq	0x278(%rbp), %rax
14008491c:     	leaq	0x480(%rax), %rcx
140084923:     	movq	0x280(%rbp), %rdx
14008492a:     	callq	0x14036aed0 <.text+0x369ed0>
14008492f:     	nop
140084930:     	movq	0x278(%rbp), %rax
140084937:     	movq	0x578(%rax), %rcx
14008493e:     	movq	0x580(%rax), %rdx
140084945:     	movzbl	0x588(%rax), %r8d
14008494d:     	leaq	(,%rdx,4), %r10
140084955:     	movq	%rcx, %rax
140084958:     	testb	%r8b, %r8b
14008495b:     	je	0x1400849f0 <.text+0x839f0>
140084961:     	nopw	%cs:(%rax,%rax)
140084970:     	testq	%r10, %r10
140084973:     	je	0x140084ace <.text+0x83ace>
140084979:     	movl	(%rax), %r9d
14008497c:     	addq	$0x4, %rax
140084980:     	movq	0x280(%rbp), %r11
140084987:     	movq	0x1a8(%r11), %r11
14008498e:     	leaq	(%r9,%r9,8), %rsi
140084992:     	movq	0x10(%r11,%rsi,8), %r9
140084997:     	addq	$-0x4, %r10
14008499b:     	testq	%r9, %r9
14008499e:     	je	0x140084970 <.text+0x83970>
1400849a0:     	leaq	(%r11,%rsi,8), %r10
1400849a4:     	movq	0x278(%rbp), %r11
1400849ab:     	movq	0x590(%r11), %r11
1400849b2:     	movq	0x18(%r10), %rsi
1400849b6:     	movq	0x38(%r10), %r10
1400849ba:     	movq	(%r10,%r11,8), %r10
1400849be:     	notq	%r10
1400849c1:     	leaq	(%r10,%r10,2), %r10
1400849c5:     	shlq	$0x4, %r10
1400849c9:     	movq	0x10(%rsi,%r10), %rdi
1400849ce:     	movq	0x28(%rsi,%r10), %rbx
1400849d3:     	movl	$0x1, %r10d
1400849d9:     	leaq	(%rcx,%rdx,4), %rcx
1400849dd:     	testb	%r8b, %r8b
1400849e0:     	jne	0x140084adf <.text+0x83adf>
1400849e6:     	jmp	0x140084a96 <.text+0x83a96>
1400849eb:     	nopl	(%rax,%rax)
1400849f0:     	testq	%r10, %r10
1400849f3:     	je	0x140084ace <.text+0x83ace>
1400849f9:     	movl	(%rax), %r9d
1400849fc:     	addq	$0x4, %rax
140084a00:     	movq	0x280(%rbp), %r11
140084a07:     	movq	0x108(%r11), %r11
140084a0e:     	leaq	(%r9,%r9,4), %rsi
140084a12:     	shlq	$0x5, %rsi
140084a16:     	movq	0x58(%r11,%rsi), %r9
140084a1b:     	addq	$-0x4, %r10
140084a1f:     	testq	%r9, %r9
140084a22:     	je	0x1400849f0 <.text+0x839f0>
140084a24:     	addq	%rsi, %r11
140084a27:     	movl	0x94(%r11), %r10d
140084a2e:     	movq	0x280(%rbp), %rsi
140084a35:     	movq	0x1a8(%rsi), %rsi
140084a3c:     	leaq	(%r10,%r10,8), %r10
140084a40:     	movq	0x278(%rbp), %rdi
140084a47:     	movq	0x590(%rdi), %rdi
140084a4e:     	movq	0x18(%rsi,%r10,8), %r14
140084a53:     	movq	0x38(%rsi,%r10,8), %r10
140084a58:     	movq	(%r10,%rdi,8), %r10
140084a5c:     	notq	%r10
140084a5f:     	movq	0x50(%r11), %r11
140084a63:     	movl	0x8(%r11), %ebx
140084a67:     	leaq	(%r10,%r10,2), %r10
140084a6b:     	shlq	$0x4, %r10
140084a6f:     	notl	%ebx
140084a71:     	leaq	(%rbx,%rbx,2), %rdi
140084a75:     	shlq	$0x3, %rdi
140084a79:     	addq	0x10(%r14,%r10), %rdi
140084a7e:     	shlq	$0x2, %rbx
140084a82:     	addq	0x28(%r14,%r10), %rbx
140084a87:     	movl	$0x1, %r10d
140084a8d:     	leaq	(%rcx,%rdx,4), %rcx
140084a91:     	testb	%r8b, %r8b
140084a94:     	jne	0x140084adf <.text+0x83adf>
140084a96:     	cmpl	%r9d, %r10d
140084a99:     	jne	0x140084d3d <.text+0x83d3d>
140084a9f:     	nop
140084aa0:     	cmpq	%rcx, %rax
140084aa3:     	je	0x140084b1a <.text+0x83b1a>
140084aa5:     	movl	(%rax), %edx
140084aa7:     	addq	$0x4, %rax
140084aab:     	movq	0x280(%rbp), %r8
140084ab2:     	movq	0x108(%r8), %r8
140084ab9:     	leaq	(%rdx,%rdx,4), %rdx
140084abd:     	shlq	$0x5, %rdx
140084ac1:     	cmpq	$0x0, 0x58(%r8,%rdx)
140084ac7:     	je	0x140084aa0 <.text+0x83aa0>
140084ac9:     	jmp	0x140084d3d <.text+0x83d3d>
140084ace:     	xorl	%r9d, %r9d
140084ad1:     	xorl	%r10d, %r10d
140084ad4:     	xorl	%edi, %edi
140084ad6:     	leaq	(%rcx,%rdx,4), %rcx
140084ada:     	testb	%r8b, %r8b
140084add:     	je	0x140084a96 <.text+0x83a96>
140084adf:     	cmpl	%r9d, %r10d
140084ae2:     	jne	0x140084d3d <.text+0x83d3d>
140084ae8:     	nopl	(%rax,%rax)
140084af0:     	cmpq	%rcx, %rax
140084af3:     	je	0x140084b1a <.text+0x83b1a>
140084af5:     	movl	(%rax), %edx
140084af7:     	addq	$0x4, %rax
140084afb:     	movq	0x280(%rbp), %r8
140084b02:     	movq	0x1a8(%r8), %r8
140084b09:     	leaq	(%rdx,%rdx,8), %rdx
140084b0d:     	cmpq	$0x0, 0x10(%r8,%rdx,8)
140084b13:     	je	0x140084af0 <.text+0x83af0>
140084b15:     	jmp	0x140084d3d <.text+0x83d3d>
140084b1a:     	testq	%rdi, %rdi
140084b1d:     	je	0x140084d3d <.text+0x83d3d>
140084b23:     	leaq	0x5891d68(%rip), %rsi   # 0x145916892
140084b2a:     	movl	$0x4, %edx
140084b2f:     	movq	%rsi, %rcx
140084b32:     	movq	0x270(%rbp), %rax
140084b39:     	leaq	0x60(%rax), %r8
140084b3d:     	callq	0x142affbe0 <.text+0x2afebe0>
140084b42:     	nop
140084b43:     	testq	%rax, %rax
140084b46:     	jne	0x140084b4f <.text+0x83b4f>
140084b48:     	movq	0x7988c69(%rip), %rax   # 0x147a0d7b8
140084b4f:     	xorpd	%xmm0, %xmm0
140084b53:     	cmpb	$0x2, (%rax)
140084b56:     	xorpd	%xmm1, %xmm1
140084b5a:     	jne	0x140084b9d <.text+0x83b9d>
140084b5c:     	movq	0x8(%rax), %rcx
140084b60:     	cmpq	$0x2, %rcx
140084b64:     	je	0x140084b76 <.text+0x83b76>
140084b66:     	cmpl	$0x1, %ecx
140084b69:     	jne	0x140084b7d <.text+0x83b7d>
140084b6b:     	xorps	%xmm1, %xmm1
140084b6e:     	cvtsi2sdq	0x10(%rax), %xmm1
140084b74:     	jmp	0x140084b9d <.text+0x83b9d>
140084b76:     	movsd	0x10(%rax), %xmm1
140084b7b:     	jmp	0x140084b9d <.text+0x83b9d>
140084b7d:     	movsd	0x10(%rax), %xmm2
140084b82:     	unpcklps	0x5882717(%rip), %xmm2  # xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
                                                # 0x1459072a0
140084b89:     	subpd	0x588271f(%rip), %xmm2  # 0x1459072b0
140084b91:     	movapd	%xmm2, %xmm1
140084b95:     	unpckhpd	%xmm2, %xmm1            # xmm1 = xmm1[1],xmm2[1]
140084b99:     	addsd	%xmm2, %xmm1
140084b9d:     	cvttsd2si	%xmm1, %rax
140084ba2:     	movq	%rax, %rcx
140084ba5:     	movapd	%xmm1, %xmm2
140084ba9:     	subsd	0x58828c7(%rip), %xmm2  # 0x145907478
140084bb1:     	cvttsd2si	%xmm2, %rdx
140084bb6:     	sarq	$0x3f, %rcx
140084bba:     	andq	%rcx, %rdx
140084bbd:     	orq	%rax, %rdx
140084bc0:     	xorl	%eax, %eax
140084bc2:     	ucomisd	%xmm0, %xmm1
140084bc6:     	cmovaeq	%rdx, %rax
140084bca:     	ucomisd	0x58828ae(%rip), %xmm1  # 0x145907480
140084bd2:     	movq	$-0x1, %rcx
140084bd9:     	cmovbeq	%rax, %rcx
140084bdd:     	movq	%rcx, -0x20(%rbp)
140084be1:     	leaq	0x5892057(%rip), %rcx   # 0x145916c3f
140084be8:     	movl	$0x9, %edx
140084bed:     	movq	0x270(%rbp), %rax
140084bf4:     	leaq	0x60(%rax), %r8
140084bf8:     	callq	0x142affbe0 <.text+0x2afebe0>
140084bfd:     	nop
140084bfe:     	testq	%rax, %rax
140084c01:     	jne	0x140084c0a <.text+0x83c0a>
140084c03:     	movq	0x7988bae(%rip), %rax   # 0x147a0d7b8
140084c0a:     	xorpd	%xmm0, %xmm0
140084c0e:     	cmpb	$0x2, (%rax)
140084c11:     	xorpd	%xmm1, %xmm1
140084c15:     	jne	0x140084c58 <.text+0x83c58>
140084c17:     	movq	0x8(%rax), %rcx
140084c1b:     	cmpq	$0x2, %rcx
140084c1f:     	je	0x140084c31 <.text+0x83c31>
140084c21:     	cmpl	$0x1, %ecx
140084c24:     	jne	0x140084c38 <.text+0x83c38>
140084c26:     	xorps	%xmm1, %xmm1
140084c29:     	cvtsi2sdq	0x10(%rax), %xmm1
140084c2f:     	jmp	0x140084c58 <.text+0x83c58>
140084c31:     	movsd	0x10(%rax), %xmm1
140084c36:     	jmp	0x140084c58 <.text+0x83c58>
140084c38:     	movsd	0x10(%rax), %xmm2
140084c3d:     	unpcklps	0x588265c(%rip), %xmm2  # xmm2 = xmm2[0],mem[0],xmm2[1],mem[1]
                                                # 0x1459072a0
140084c44:     	subpd	0x5882664(%rip), %xmm2  # 0x1459072b0
140084c4c:     	movapd	%xmm2, %xmm1
140084c50:     	unpckhpd	%xmm2, %xmm1            # xmm1 = xmm1[1],xmm2[1]
140084c54:     	addsd	%xmm2, %xmm1
140084c58:     	cvttsd2si	%xmm1, %rax
140084c5d:     	movq	%rax, %rcx
140084c60:     	movapd	%xmm1, %xmm2
140084c64:     	subsd	0x588280c(%rip), %xmm2  # 0x145907478
140084c6c:     	cvttsd2si	%xmm2, %rdx
140084c71:     	sarq	$0x3f, %rcx
140084c75:     	andq	%rcx, %rdx
140084c78:     	orq	%rax, %rdx
140084c7b:     	xorl	%eax, %eax
140084c7d:     	ucomisd	%xmm0, %xmm1
140084c81:     	cmovaeq	%rdx, %rax
140084c85:     	ucomisd	0x58827f3(%rip), %xmm1  # 0x145907480
140084c8d:     	movq	$-0x1, %rcx
140084c94:     	cmovbeq	%rax, %rcx
140084c98:     	movq	%rcx, 0x230(%rbp)
140084c9f:     	movq	%rsi, -0x10(%rbp)
140084ca3:     	movq	$0x4, -0x8(%rbp)
140084cab:     	leaq	-0x20(%rbp), %rax
140084caf:     	movq	%rax, (%rbp)
140084cb3:     	leaq	0x5891ede(%rip), %rax   # 0x145916b98
140084cba:     	movq	%rax, 0x8(%rbp)
140084cbe:     	leaq	0x5891f83(%rip), %rcx   # 0x145916c48
140084cc5:     	movq	%rcx, 0x10(%rbp)
140084cc9:     	movq	$0x4, 0x18(%rbp)
140084cd1:     	leaq	0x230(%rbp), %rcx
140084cd8:     	movq	%rcx, 0x20(%rbp)
140084cdc:     	movq	%rax, 0x28(%rbp)
140084ce0:     	movq	$0x2, 0x20(%rsp)
140084ce9:     	leaq	0x5891f5c(%rip), %rdx   # 0x145916c4c
140084cf0:     	leaq	0x190(%rbp), %rcx
140084cf7:     	leaq	-0x10(%rbp), %r9
140084cfb:     	movl	$0xe, %r8d
140084d01:     	callq	0x145457c60 <.text+0x5456c60>
140084d06:     	nop
140084d07:     	movl	0x254(%rbp), %eax
140084d0d:     	movl	%eax, (%rbx)
140084d0f:     	movq	(%rdi), %rdx
140084d12:     	testq	%rdx, %rdx
140084d15:     	je	0x140084d26 <.text+0x83d26>
140084d17:     	movq	0x8(%rdi), %rcx
140084d1b:     	movl	$0x1, %r8d
140084d21:     	callq	0x1400021d0 <.text+0x11d0>
140084d26:     	movq	0x1a0(%rbp), %rax
140084d2d:     	movq	%rax, 0x10(%rdi)
140084d31:     	movupd	0x190(%rbp), %xmm0
140084d39:     	movupd	%xmm0, (%rdi)
140084d3d:     	movb	$0x3, %al
140084d3f:     	movq	0x270(%rbp), %rcx
140084d46:     	cmpb	$0x0, 0xe9(%rcx)
140084d4d:     	jne	0x140084da1 <.text+0x83da1>
140084d4f:     	leaq	0x5891f04(%rip), %rcx   # 0x145916c5a
140084d56:     	movl	$0x5, %edx
140084d5b:     	movq	0x208(%rbp), %r8
140084d62:     	callq	0x142affbe0 <.text+0x2afebe0>
140084d67:     	nop
140084d68:     	testq	%rax, %rax
140084d6b:     	jne	0x140084d74 <.text+0x83d74>
140084d6d:     	movq	0x7988a44(%rip), %rax   # 0x147a0d7b8
140084d74:     	cmpb	$0x3, (%rax)
140084d77:     	jne	0x140084d9f <.text+0x83d9f>
140084d79:     	cmpq	$0x7, 0x18(%rax)
140084d7e:     	jne	0x140084d9f <.text+0x83d9f>
140084d80:     	movq	0x10(%rax), %rax
140084d84:     	movl	$0x79616c70, %ecx       # imm = 0x79616C70
140084d89:     	xorl	(%rax), %ecx
140084d8b:     	movl	$0x676e6979, %edx       # imm = 0x676E6979
140084d90:     	xorl	0x3(%rax), %edx
140084d93:     	xorl	%eax, %eax
140084d95:     	orl	%ecx, %edx
140084d97:     	sete	%al
140084d9a:     	leal	(%rax,%rax,2), %eax
140084d9d:     	jmp	0x140084da1 <.text+0x83da1>
140084d9f:     	xorl	%eax, %eax
140084da1:     	movq	0x380(%rbp), %rcx
140084da8:     	movq	(%rcx), %rsi
140084dab:     	movq	0x8(%rcx), %rcx
140084daf:     	movq	0xf8(%rsi), %r8
140084db6:     	movq	0x100(%rsi), %r9
140084dbd:     	movzbl	0x108(%rsi), %r10d
140084dc5:     	testb	%r10b, %r10b
140084dc8:     	je	0x140084e5a <.text+0x83e5a>
140084dce:     	leaq	(,%r9,4), %rdi
140084dd6:     	movq	%r8, %rdx
140084dd9:     	nopl	(%rax)
140084de0:     	testq	%rdi, %rdi
140084de3:     	je	0x140084f27 <.text+0x83f27>
140084de9:     	movl	(%rdx), %r11d
140084dec:     	addq	$0x4, %rdx
140084df0:     	movq	0x1a8(%rcx), %rbx
140084df7:     	leaq	(%r11,%r11,8), %r14
140084dfb:     	movq	0x10(%rbx,%r14,8), %r11
140084e00:     	addq	$-0x4, %rdi
140084e04:     	testq	%r11, %r11
140084e07:     	je	0x140084de0 <.text+0x83de0>
140084e09:     	leaq	(%rbx,%r14,8), %rdi
140084e0d:     	movq	0x110(%rsi), %rbx
140084e14:     	movq	0x118(%rsi), %rsi
140084e1b:     	movq	0x18(%rdi), %r15
140084e1f:     	movq	0x38(%rdi), %rdi
140084e23:     	movq	(%rdi,%rbx,8), %rbx
140084e27:     	notq	%rbx
140084e2a:     	leaq	(%rbx,%rbx,2), %r14
140084e2e:     	shlq	$0x4, %r14
140084e32:     	movq	0x10(%r15,%r14), %rbx
140084e37:     	movq	0x28(%r15,%r14), %r14
140084e3c:     	movq	(%rdi,%rsi,8), %rsi
140084e40:     	notq	%rsi
140084e43:     	leaq	(%rsi,%rsi,2), %rsi
140084e47:     	shlq	$0x4, %rsi
140084e4b:     	movq	0x10(%r15,%rsi), %rdi
140084e50:     	movq	0x28(%r15,%rsi), %rsi
140084e55:     	jmp	0x140084f1f <.text+0x83f1f>
140084e5a:     	leaq	(,%r9,4), %rbx
140084e62:     	movq	%r8, %rdx
140084e65:     	nopw	%cs:(%rax,%rax)
140084e70:     	testq	%rbx, %rbx
140084e73:     	je	0x140084f27 <.text+0x83f27>
140084e79:     	movl	(%rdx), %r11d
140084e7c:     	addq	$0x4, %rdx
140084e80:     	movq	0x108(%rcx), %rdi
140084e87:     	leaq	(%r11,%r11,4), %r14
140084e8b:     	shlq	$0x5, %r14
140084e8f:     	movq	0x58(%rdi,%r14), %r11
140084e94:     	addq	$-0x4, %rbx
140084e98:     	testq	%r11, %r11
140084e9b:     	je	0x140084e70 <.text+0x83e70>
140084e9d:     	addq	%r14, %rdi
140084ea0:     	movl	0x94(%rdi), %ebx
140084ea6:     	movq	0x1a8(%rcx), %r14
140084ead:     	leaq	(%rbx,%rbx,8), %rbx
140084eb1:     	movq	0x110(%rsi), %r12
140084eb8:     	movq	0x118(%rsi), %rsi
140084ebf:     	movq	0x18(%r14,%rbx,8), %r15
140084ec4:     	movq	0x38(%r14,%rbx,8), %rbx
140084ec9:     	movq	(%rbx,%r12,8), %r14
140084ecd:     	notq	%r14
140084ed0:     	leaq	(%r14,%r14,2), %r14
140084ed4:     	shlq	$0x4, %r14
140084ed8:     	movq	(%rbx,%rsi,8), %rsi
140084edc:     	notq	%rsi
140084edf:     	movq	0x50(%rdi), %rdi
140084ee3:     	movl	0x8(%rdi), %edi
140084ee6:     	leaq	(%rsi,%rsi,2), %r12
140084eea:     	shlq	$0x4, %r12
140084eee:     	notl	%edi
140084ef0:     	leaq	(%rdi,%rdi,2), %rbx
140084ef4:     	shlq	$0x7, %rbx
140084ef8:     	addq	0x10(%r15,%r14), %rbx
140084efd:     	leaq	(,%rdi,4), %rsi
140084f05:     	movq	0x28(%r15,%r14), %r14
140084f0a:     	leaq	(%rdi,%rdi,4), %rdi
140084f0e:     	shlq	$0x2, %rdi
140084f12:     	addq	0x10(%r15,%r12), %rdi
140084f17:     	addq	%rsi, %r14
140084f1a:     	addq	0x28(%r15,%r12), %rsi
140084f1f:     	movl	$0x1, %r12d
140084f25:     	jmp	0x140084f2f <.text+0x83f2f>
140084f27:     	xorl	%r11d, %r11d
140084f2a:     	xorl	%r12d, %r12d
140084f2d:     	xorl	%ebx, %ebx
140084f2f:     	movq	0x380(%rbp), %r15
140084f36:     	movl	0x14(%r15), %r15d
140084f3a:     	leaq	(%r8,%r9,4), %r8
140084f3e:     	testb	%r10b, %r10b
140084f41:     	je	0x140084f74 <.text+0x83f74>
140084f43:     	cmpl	%r11d, %r12d
140084f46:     	jne	0x140084ff7 <.text+0x83ff7>
140084f4c:     	nopl	(%rax)
140084f50:     	cmpq	%r8, %rdx
140084f53:     	je	0x140084fa5 <.text+0x83fa5>
140084f55:     	movl	(%rdx), %r9d
140084f58:     	addq	$0x4, %rdx
140084f5c:     	movq	0x1a8(%rcx), %r10
140084f63:     	leaq	(%r9,%r9,8), %r9
140084f67:     	cmpq	$0x0, 0x10(%r10,%r9,8)
140084f6d:     	je	0x140084f50 <.text+0x83f50>
140084f6f:     	jmp	0x140084ff7 <.text+0x83ff7>
140084f74:     	cmpl	%r11d, %r12d
140084f77:     	jne	0x140084ff7 <.text+0x83ff7>
140084f7d:     	nopl	(%rax)
140084f80:     	cmpq	%r8, %rdx
140084f83:     	je	0x140084fa5 <.text+0x83fa5>
140084f85:     	movl	(%rdx), %r9d
140084f88:     	addq	$0x4, %rdx
140084f8c:     	movq	0x108(%rcx), %r10
140084f93:     	leaq	(%r9,%r9,4), %r9
140084f97:     	shlq	$0x5, %r9
140084f9b:     	cmpq	$0x0, 0x58(%r10,%r9)
140084fa1:     	je	0x140084f80 <.text+0x83f80>
140084fa3:     	jmp	0x140084ff7 <.text+0x83ff7>
140084fa5:     	testq	%rbx, %rbx
140084fa8:     	je	0x140084ff7 <.text+0x83ff7>
140084faa:     	movl	%r15d, (%r14)
140084fad:     	movb	%al, 0x175(%rbx)
140084fb3:     	movq	0x358(%rbp), %rax
140084fba:     	movss	0x5c(%rax), %xmm0
140084fbf:     	mulss	0x58907b1(%rip), %xmm0  # 0x145915778
140084fc7:     	callq	0x145773235 <.text+0x5772235>
140084fcc:     	andps	0x58907ad(%rip), %xmm0  # 0x145915780
140084fd3:     	mulss	0x5882545(%rip), %xmm0  # 0x145907520
140084fdb:     	addss	0x58907ad(%rip), %xmm0  # 0x145915790
140084fe3:     	movl	%r15d, (%rsi)
140084fe6:     	movupd	0x5891b86(%rip), %xmm1  # 0x145916b74
140084fee:     	movupd	%xmm1, (%rdi)
140084ff2:     	movss	%xmm0, 0x10(%rdi)
140084ff7:     	leaq	0x5891c61(%rip), %rcx   # 0x145916c5f
140084ffe:     	movl	$0x9, %edx
140085003:     	movq	0x208(%rbp), %r8
14008500a:     	callq	0x142affbe0 <.text+0x2afebe0>
14008500f:     	nop
140085010:     	testq	%rax, %rax
140085013:     	jne	0x14008501c <.text+0x8401c>
140085015:     	movq	0x798879c(%rip), %rax   # 0x147a0d7b8
14008501c:     	cmpb	$0x4, (%rax)
14008501f:     	movq	0x178(%rbp), %r12
140085026:     	jne	0x14008506b <.text+0x8406b>
140085028:     	movq	0x10(%rax), %rsi
14008502c:     	movq	0x18(%rax), %rdi
140085030:     	testq	%rdi, %rdi
140085033:     	je	0x14008508e <.text+0x8408e>
140085035:     	leaq	(,%rdi,8), %rax
14008503d:     	leaq	(%rax,%rax,2), %rbx
140085041:     	callq	0x140002200 <.text+0x1200>
140085046:     	movl	$0x8, %edx
14008504b:     	movq	%rbx, %rcx
14008504e:     	callq	0x1400021c0 <.text+0x11c0>
140085053:     	testq	%rax, %rax
140085056:     	jne	0x140085093 <.text+0x84093>
140085058:     	movl	$0x8, %ecx
14008505d:     	movq	%rbx, %rdx
140085060:     	callq	0x14590379b <.text+0x590279b>
140085065:     	nop
140085066:     	jmp	0x1400855d2 <.text+0x845d2>
14008506b:     	movq	$0x0, 0x230(%rbp)
140085076:     	movq	$0x8, 0x238(%rbp)
140085081:     	movq	$0x0, 0x240(%rbp)
14008508c:     	jmp	0x1400850f8 <.text+0x840f8>
14008508e:     	movl	$0x8, %eax
140085093:     	movq	%rdi, %rdx
140085096:     	shlq	$0x5, %rdx
14008509a:     	addq	%rsi, %rdx
14008509d:     	movq	%rdi, 0x190(%rbp)
1400850a4:     	movq	%rax, 0x198(%rbp)
1400850ab:     	leaq	0x1a0(%rbp), %rcx
1400850b2:     	movq	$0x0, 0x1a0(%rbp)
1400850bd:     	movq	%rax, (%rbp)
1400850c1:     	movq	%rcx, -0x10(%rbp)
1400850c5:     	movq	$0x0, -0x8(%rbp)
1400850cd:     	leaq	-0x10(%rbp), %r8
1400850d1:     	movq	%rsi, %rcx
1400850d4:     	callq	0x140035990 <.text+0x34990>
1400850d9:     	nop
1400850da:     	movupd	0x190(%rbp), %xmm0
1400850e2:     	movapd	%xmm0, 0x230(%rbp)
1400850ea:     	movq	0x1a0(%rbp), %rax
1400850f1:     	movq	%rax, 0x240(%rbp)
1400850f8:     	leaq	0x5891b69(%rip), %rcx   # 0x145916c68
1400850ff:     	movl	$0x7, %edx
140085104:     	movq	0x208(%rbp), %r8
14008510b:     	callq	0x142affbe0 <.text+0x2afebe0>
140085110:     	nop
140085111:     	testq	%rax, %rax
140085114:     	jne	0x14008511d <.text+0x8411d>
140085116:     	movq	0x798869b(%rip), %rax   # 0x147a0d7b8
14008511d:     	cmpb	$0x4, (%rax)
140085120:     	jne	0x140085165 <.text+0x84165>
140085122:     	movq	0x10(%rax), %rsi
140085126:     	movq	0x18(%rax), %rdi
14008512a:     	testq	%rdi, %rdi
14008512d:     	je	0x140085170 <.text+0x84170>
14008512f:     	leaq	(,%rdi,8), %rax
140085137:     	leaq	(%rax,%rax,2), %rbx
14008513b:     	callq	0x140002200 <.text+0x1200>
140085140:     	movl	$0x8, %edx
140085145:     	movq	%rbx, %rcx
140085148:     	callq	0x1400021c0 <.text+0x11c0>
14008514d:     	testq	%rax, %rax
140085150:     	jne	0x140085175 <.text+0x84175>
140085152:     	movl	$0x8, %ecx
140085157:     	movq	%rbx, %rdx
14008515a:     	callq	0x14590379b <.text+0x590279b>
14008515f:     	nop
140085160:     	jmp	0x1400855d2 <.text+0x845d2>
140085165:     	movl	$0x8, %eax
14008516a:     	xorl	%ecx, %ecx
14008516c:     	xorl	%edx, %edx
14008516e:     	jmp	0x1400851d1 <.text+0x841d1>
140085170:     	movl	$0x8, %eax
140085175:     	movq	%rdi, %rdx
140085178:     	shlq	$0x5, %rdx
14008517c:     	addq	%rsi, %rdx
14008517f:     	movq	%rdi, 0x190(%rbp)
140085186:     	movq	%rax, 0x198(%rbp)
14008518d:     	leaq	0x1a0(%rbp), %rcx
140085194:     	movq	$0x0, 0x1a0(%rbp)
14008519f:     	movq	%rax, (%rbp)
1400851a3:     	movq	%rcx, -0x10(%rbp)
1400851a7:     	movq	$0x0, -0x8(%rbp)
1400851af:     	leaq	-0x10(%rbp), %r8
1400851b3:     	movq	%rsi, %rcx
1400851b6:     	callq	0x140035990 <.text+0x34990>
1400851bb:     	nop
1400851bc:     	movq	0x190(%rbp), %rdx
1400851c3:     	movq	0x198(%rbp), %rax
1400851ca:     	movq	0x1a0(%rbp), %rcx
1400851d1:     	movq	0x240(%rbp), %r8
1400851d8:     	movq	%r8, 0x1a0(%rbp)
1400851df:     	movapd	0x230(%rbp), %xmm0
1400851e7:     	movapd	%xmm0, 0x190(%rbp)
1400851ef:     	movq	%rdx, 0x1a8(%rbp)
1400851f6:     	movq	%rax, 0x1b0(%rbp)
1400851fd:     	movq	%rcx, 0x1b8(%rbp)
140085204:     	leaq	0x190(%rbp), %rax
14008520b:     	movq	%rax, 0x230(%rbp)
140085212:     	leaq	0x12f947(%rip), %rax    # 0x1401b4b60 <.text+0x1b3b60>
140085219:     	movq	%rax, 0x238(%rbp)
140085220:     	leaq	0x58915eb(%rip), %rdx   # 0x145916812
140085227:     	leaq	-0x10(%rbp), %rcx
14008522b:     	leaq	0x230(%rbp), %r8
140085232:     	callq	0x145728390 <.text+0x5727390>
140085237:     	nop
140085238:     	movq	-0x10(%rbp), %rsi
14008523c:     	movq	-0x8(%rbp), %rbx
140085240:     	movq	(%rbp), %r14
140085244:     	movq	0x390(%rbp), %rcx
14008524b:     	cmpq	%r14, 0x10(%rcx)
14008524f:     	jne	0x14008526f <.text+0x8426f>
140085251:     	movq	0x8(%rcx), %rcx
140085255:     	movq	%rbx, %rdx
140085258:     	movq	%r14, %r8
14008525b:     	callq	0x1457731e7 <.text+0x57721e7>
140085260:     	movq	0x390(%rbp), %rcx
140085267:     	testl	%eax, %eax
140085269:     	je	0x1400854a8 <.text+0x844a8>
14008526f:     	movq	(%rcx), %rdx
140085272:     	testq	%rdx, %rdx
140085275:     	je	0x14008528d <.text+0x8428d>
140085277:     	movq	0x8(%rcx), %rcx
14008527b:     	movl	$0x1, %r8d
140085281:     	callq	0x1400021d0 <.text+0x11d0>
140085286:     	movq	0x390(%rbp), %rcx
14008528d:     	movq	%rsi, (%rcx)
140085290:     	movq	%rbx, 0x8(%rcx)
140085294:     	movq	%r14, 0x10(%rcx)
140085298:     	movq	0x388(%rbp), %rcx
14008529f:     	movq	(%rcx), %rax
1400852a2:     	movq	0x8(%rcx), %rbx
1400852a6:     	movq	0xf8(%rax), %r14
1400852ad:     	movq	0x100(%rax), %rcx
1400852b4:     	leaq	(%r14,%rcx,4), %r15
1400852b8:     	movzbl	0x108(%rax), %edx
1400852bf:     	movq	0x10(%r12), %r8
1400852c4:     	movq	0x20(%r12), %rax
1400852c9:     	movq	%rax, 0x280(%rbp)
1400852d0:     	movq	0x18(%r12), %rax
1400852d5:     	movq	%rax, 0x278(%rbp)
1400852dc:     	movq	(%r12), %r11
1400852e0:     	movq	0x8(%r12), %r9
1400852e5:     	xorl	%r13d, %r13d
1400852e8:     	movl	$0x8, %ecx
1400852ed:     	leaq	-0x10(%rbp), %r10
1400852f1:     	movl	$0x8, %esi
1400852f6:     	xorl	%r12d, %r12d
1400852f9:     	testb	%dl, %dl
1400852fb:     	jne	0x140085374 <.text+0x84374>
1400852fd:     	movq	%rcx, 0x270(%rbp)
140085304:     	jmp	0x140085326 <.text+0x84326>
140085306:     	addq	%rcx, %rax
140085309:     	movq	0x50(%rax), %rsi
14008530d:     	xorl	%r12d, %r12d
140085310:     	movl	%r12d, %eax
140085313:     	shlq	$0x4, %rax
140085317:     	incl	%r12d
14008531a:     	movq	(%rsi,%rax), %rdi
14008531e:     	testl	%edi, %edi
140085320:     	jne	0x1400853ae <.text+0x843ae>
140085326:     	cmpl	%r13d, %r12d
140085329:     	jne	0x140085310 <.text+0x84310>
14008532b:     	nopl	(%rax,%rax)
140085330:     	cmpq	%r15, %r14
140085333:     	je	0x1400854be <.text+0x844be>
140085339:     	movl	(%r14), %ecx
14008533c:     	addq	$0x4, %r14
140085340:     	movq	0x108(%rbx), %rax
140085347:     	leaq	(%rcx,%rcx,4), %rcx
14008534b:     	shlq	$0x5, %rcx
14008534f:     	movq	0x58(%rax,%rcx), %r13
140085354:     	testq	%r13, %r13
140085357:     	je	0x140085330 <.text+0x84330>
140085359:     	jmp	0x140085306 <.text+0x84306>
14008535b:     	leaq	(%rax,%rcx,8), %rax
14008535f:     	movq	0x8(%rax), %rcx
140085363:     	xorl	%r12d, %r12d
140085366:     	movl	%r12d, %eax
140085369:     	incl	%r12d
14008536c:     	movq	(%rcx,%rax,8), %rdi
140085370:     	testl	%edi, %edi
140085372:     	jne	0x1400853a7 <.text+0x843a7>
140085374:     	cmpl	%r13d, %r12d
140085377:     	jne	0x140085366 <.text+0x84366>
140085379:     	nopl	(%rax)
140085380:     	cmpq	%r15, %r14
140085383:     	je	0x1400854be <.text+0x844be>
140085389:     	movl	(%r14), %ecx
14008538c:     	addq	$0x4, %r14
140085390:     	movq	0x1a8(%rbx), %rax
140085397:     	leaq	(%rcx,%rcx,8), %rcx
14008539b:     	movq	0x10(%rax,%rcx,8), %r13
1400853a0:     	testq	%r13, %r13
1400853a3:     	je	0x140085380 <.text+0x84380>
1400853a5:     	jmp	0x14008535b <.text+0x8435b>
1400853a7:     	movq	%rcx, 0x270(%rbp)
1400853ae:     	testl	%edi, %edi
1400853b0:     	je	0x1400854be <.text+0x844be>
1400853b6:     	movb	%dl, 0x228(%rbp)
1400853bc:     	testq	%r8, %r8
1400853bf:     	movq	0x208(%rbp), %rax
1400853c6:     	cmovneq	0x280(%rbp), %rax
1400853ce:     	movq	%rdi, -0x10(%rbp)
1400853d2:     	movq	%r11, -0x8(%rbp)
1400853d6:     	movq	%r9, 0x260(%rbp)
1400853dd:     	movq	%r9, (%rbp)
1400853e1:     	movq	%r8, 0x8(%rbp)
1400853e5:     	movq	0x278(%rbp), %rcx
1400853ec:     	movq	%rcx, 0x10(%rbp)
1400853f0:     	movq	%rax, 0x208(%rbp)
1400853f7:     	movq	%rax, 0x18(%rbp)
1400853fb:     	movq	%r10, %rcx
1400853fe:     	movq	%r8, 0x220(%rbp)
140085405:     	movq	%r11, 0x258(%rbp)
14008540c:     	callq	0x1400f0530 <.text+0xef530>
140085411:     	nop
140085412:     	movq	0x220(%rbp), %rdx
140085419:     	testq	%rdx, %rdx
14008541c:     	movq	0x210(%rbp), %rax
140085423:     	cmovneq	0x280(%rbp), %rax
14008542b:     	movq	%rdi, -0x10(%rbp)
14008542f:     	movq	0x258(%rbp), %rcx
140085436:     	movq	%rcx, -0x8(%rbp)
14008543a:     	movq	0x260(%rbp), %rcx
140085441:     	movq	%rcx, (%rbp)
140085445:     	movq	%rdx, 0x8(%rbp)
140085449:     	movq	0x278(%rbp), %rcx
140085450:     	movq	%rcx, 0x10(%rbp)
140085454:     	movq	%rax, 0x210(%rbp)
14008545b:     	movq	%rax, 0x18(%rbp)
14008545f:     	leaq	-0x10(%rbp), %rcx
140085463:     	leaq	0x190(%rbp), %rdx
14008546a:     	movq	-0x18(%rbp), %r8
14008546e:     	callq	0x1401025b0 <.text+0x1015b0>
140085473:     	nop
140085474:     	movzbl	0x228(%rbp), %edx
14008547b:     	movq	0x220(%rbp), %r8
140085482:     	movq	0x258(%rbp), %r11
140085489:     	movq	0x260(%rbp), %r9
140085490:     	leaq	-0x10(%rbp), %r10
140085494:     	movq	0x270(%rbp), %rcx
14008549b:     	testb	%dl, %dl
14008549d:     	je	0x1400852fd <.text+0x842fd>
1400854a3:     	jmp	0x140085374 <.text+0x84374>
1400854a8:     	testq	%rsi, %rsi
1400854ab:     	je	0x1400854be <.text+0x844be>
1400854ad:     	movl	$0x1, %r8d
1400854b3:     	movq	%rbx, %rcx
1400854b6:     	movq	%rsi, %rdx
1400854b9:     	callq	0x1400021d0 <.text+0x11d0>
1400854be:     	movq	0x1a0(%rbp), %rsi
1400854c5:     	testq	%rsi, %rsi
1400854c8:     	je	0x140085502 <.text+0x84502>
1400854ca:     	movq	0x198(%rbp), %rdi
1400854d1:     	addq	$0x8, %rdi
1400854d5:     	jmp	0x1400854e9 <.text+0x844e9>
1400854d7:     	nopw	(%rax,%rax)
1400854e0:     	addq	$0x18, %rdi
1400854e4:     	decq	%rsi
1400854e7:     	je	0x140085502 <.text+0x84502>
1400854e9:     	movq	-0x8(%rdi), %rdx
1400854ed:     	testq	%rdx, %rdx
1400854f0:     	je	0x1400854e0 <.text+0x844e0>
1400854f2:     	movq	(%rdi), %rcx
1400854f5:     	movl	$0x1, %r8d
1400854fb:     	callq	0x1400021d0 <.text+0x11d0>
140085500:     	jmp	0x1400854e0 <.text+0x844e0>
140085502:     	movq	0x190(%rbp), %rax
140085509:     	testq	%rax, %rax
14008550c:     	je	0x140085528 <.text+0x84528>
14008550e:     	movq	0x198(%rbp), %rcx
140085515:     	shlq	$0x3, %rax
140085519:     	leaq	(%rax,%rax,2), %rdx
14008551d:     	movl	$0x8, %r8d
140085523:     	callq	0x1400021d0 <.text+0x11d0>
140085528:     	movq	0x1b8(%rbp), %rsi
14008552f:     	testq	%rsi, %rsi
140085532:     	je	0x140085572 <.text+0x84572>
140085534:     	movq	0x1b0(%rbp), %rdi
14008553b:     	addq	$0x8, %rdi
14008553f:     	jmp	0x140085559 <.text+0x84559>
140085541:     	nopw	%cs:(%rax,%rax)
140085550:     	addq	$0x18, %rdi
140085554:     	decq	%rsi
140085557:     	je	0x140085572 <.text+0x84572>
140085559:     	movq	-0x8(%rdi), %rdx
14008555d:     	testq	%rdx, %rdx
140085560:     	je	0x140085550 <.text+0x84550>
140085562:     	movq	(%rdi), %rcx
140085565:     	movl	$0x1, %r8d
14008556b:     	callq	0x1400021d0 <.text+0x11d0>
140085570:     	jmp	0x140085550 <.text+0x84550>
140085572:     	movq	0x1a8(%rbp), %rax
140085579:     	testq	%rax, %rax
14008557c:     	je	0x140085598 <.text+0x84598>
14008557e:     	movq	0x1b0(%rbp), %rcx
140085585:     	shlq	$0x3, %rax
140085589:     	leaq	(%rax,%rax,2), %rdx
14008558d:     	movl	$0x8, %r8d
140085593:     	callq	0x1400021d0 <.text+0x11d0>
140085598:     	movq	0x1f0(%rbp), %rdx
14008559f:     	testq	%rdx, %rdx
1400855a2:     	je	0x1400833b3 <.text+0x823b3>
1400855a8:     	movq	0x1f8(%rbp), %rcx
1400855af:     	shlq	$0x3, %rdx
1400855b3:     	movl	$0x8, %r8d
1400855b9:     	callq	0x1400021d0 <.text+0x11d0>
1400855be:     	jmp	0x1400833b3 <.text+0x823b3>
1400855c3:     	xorl	%ecx, %ecx
1400855c5:     	movq	0x218(%rbp), %rdx
1400855cc:     	callq	0x14590379b <.text+0x590279b>
1400855d1:     	nop
1400855d2:     	ud2
1400855d4:     	movq	$0x1, 0x20(%rsp)
1400855dd:     	movl	$0x10, %r8d
1400855e3:     	movl	$0x1, %r9d
1400855e9:     	movq	%rsi, %rcx
1400855ec:     	movq	%rbx, %rdx
1400855ef:     	callq	0x1457744b0 <.text+0x57734b0>
1400855f4:     	nop
1400855f5:     	jmp	0x140083e36 <.text+0x82e36>
1400855fa:     	movq	(%rbp), %rdx
1400855fe:     	movq	%r13, %rcx
140085601:     	callq	0x14590379b <.text+0x590279b>
140085606:     	ud2
140085608:     	movl	$0x8, %ecx
14008560d:     	movl	$0x8, %edx
140085612:     	callq	0x14590379b <.text+0x590279b>
140085617:     	ud2
140085619:     	movq	%r14, 0x218(%rbp)
140085620:     	movl	$0x1, %ecx
140085625:     	jmp	0x1400855c5 <.text+0x845c5>

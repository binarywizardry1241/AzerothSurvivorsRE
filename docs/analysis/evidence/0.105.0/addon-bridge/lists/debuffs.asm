
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458ecf10:     	pushq	%rbp
1458ecf11:     	pushq	%r15
1458ecf13:     	pushq	%r14
1458ecf15:     	pushq	%r13
1458ecf17:     	pushq	%r12
1458ecf19:     	pushq	%rsi
1458ecf1a:     	pushq	%rdi
1458ecf1b:     	pushq	%rbx
1458ecf1c:     	subq	$0x208, %rsp            # imm = 0x208
1458ecf23:     	leaq	0x80(%rsp), %rbp
1458ecf2b:     	movaps	%xmm7, 0x170(%rbp)
1458ecf32:     	movaps	%xmm6, 0x160(%rbp)
1458ecf39:     	movq	$-0x2, 0x158(%rbp)
1458ecf44:     	movq	%rcx, %rbx
1458ecf47:     	movss	0x9ec(%rdx), %xmm6
1458ecf4f:     	movq	0x560(%rdx), %rax
1458ecf56:     	imulq	$0x160, 0x568(%rdx), %r8 # imm = 0x160
1458ecf61:     	addq	%rax, %r8
1458ecf64:     	leaq	-0x28(%rbp), %rcx
1458ecf68:     	movq	%rax, %rdx
1458ecf6b:     	callq	0x14599d110 <.text+0x599c110>
1458ecf70:     	movq	-0x20(%rbp), %rdi
1458ecf74:     	movq	-0x18(%rbp), %rsi
1458ecf78:     	leaq	0x133(%rbp), %rax
1458ecf7f:     	movq	%rax, 0x30(%rbp)
1458ecf83:     	cmpq	$0x2, %rsi
1458ecf87:     	jae	0x1458ed85d <.text+0x58ec85d>
1458ecf8d:     	movq	%rbx, 0x8(%rbp)
1458ecf91:     	movq	$0x0, 0x108(%rbp)
1458ecf9c:     	movq	$0x8, 0x110(%rbp)
1458ecfa7:     	movq	$0x0, 0x118(%rbp)
1458ecfb2:     	movq	-0x28(%rbp), %rax
1458ecfb6:     	movq	%rax, 0xc8(%rbp)
1458ecfbd:     	leaq	(%rdi,%rsi,8), %rax
1458ecfc1:     	movq	%rax, (%rbp)
1458ecfc5:     	leaq	0x12bfb0c(%rip), %rbx   # 0x146bacad8
1458ecfcc:     	leaq	0x30(%rbp), %r12
1458ecfd0:     	movss	0x486d3c(%rip), %xmm7   # 0x145d73d14
1458ecfd8:     	leaq	0x13c(%rbp), %r13
1458ecfdf:     	movq	%rdi, 0xd0(%rbp)
1458ecfe6:     	nopw	%cs:(%rax,%rax)
1458ecff0:     	cmpq	(%rbp), %rdi
1458ecff4:     	je	0x1458ed776 <.text+0x58ec776>
1458ecffa:     	movq	(%rdi), %rcx
1458ecffd:     	addq	$0x8, %rdi
1458ed001:     	movl	$0xb0, %edx
1458ed006:     	xorl	%r8d, %r8d
1458ed009:     	movq	%rdi, -0x8(%rbp)
1458ed00d:     	movq	%rcx, 0x120(%rbp)
1458ed014:     	jmp	0x1458ed03d <.text+0x58ec03d>
1458ed016:     	nopw	%cs:(%rax,%rax)
1458ed020:     	movq	-0x8(%rbp), %rdi
1458ed024:     	movq	0x120(%rbp), %rcx
1458ed02b:     	movq	-0x10(%rbp), %rdx
1458ed02f:     	movq	0xc0(%rbp), %r8
1458ed036:     	addq	$0x4, %rdx
1458ed03a:     	incq	%r8
1458ed03d:     	cmpq	$0xf0, %rdx
1458ed044:     	je	0x1458ecff0 <.text+0x58ebff0>
1458ed046:     	movl	(%rcx,%rdx), %eax
1458ed049:     	movl	%eax, 0x134(%rbp)
1458ed04f:     	testl	%eax, %eax
1458ed051:     	je	0x1458ed036 <.text+0x58ec036>
1458ed053:     	movq	%rdx, -0x10(%rbp)
1458ed057:     	movq	%r8, 0xc0(%rbp)
1458ed05e:     	movq	%r8, %rdx
1458ed061:     	shrq	$0x2, %rdx
1458ed065:     	callq	0x1458df730 <.text+0x58de730>
1458ed06a:     	nop
1458ed06b:     	movq	0xc0(%rbp), %rcx
1458ed072:     	leal	(,%rcx,8), %ecx
1458ed079:     	shrl	%cl, %eax
1458ed07b:     	movzbl	%al, %eax
1458ed07e:     	incl	%eax
1458ed080:     	movl	%eax, 0xe4(%rbp)
1458ed086:     	movl	0x134(%rbp), %r8d
1458ed08d:     	xorl	%edi, %edi
1458ed08f:     	movq	0x120(%rbp), %r9
1458ed096:     	nopw	%cs:(%rax,%rax)
1458ed0a0:     	cmpl	%r8d, 0x40(%rdi,%rbx)
1458ed0a5:     	je	0x1458ed117 <.text+0x58ec117>
1458ed0a7:     	cmpl	%r8d, 0xb8(%rdi,%rbx)
1458ed0af:     	je	0x1458ed159 <.text+0x58ec159>
1458ed0b5:     	cmpl	%r8d, 0x130(%rdi,%rbx)
1458ed0bd:     	je	0x1458ed3ee <.text+0x58ec3ee>
1458ed0c3:     	cmpl	%r8d, 0x1a8(%rdi,%rbx)
1458ed0cb:     	je	0x1458ed40e <.text+0x58ec40e>
1458ed0d1:     	cmpl	%r8d, 0x220(%rdi,%rbx)
1458ed0d9:     	je	0x1458ed42e <.text+0x58ec42e>
1458ed0df:     	cmpq	$0x32a0, %rdi           # imm = 0x32A0
1458ed0e6:     	je	0x1458ed44e <.text+0x58ec44e>
1458ed0ec:     	leaq	0x2d0(%rdi), %rax
1458ed0f3:     	cmpl	%r8d, 0x298(%rdi,%rbx)
1458ed0fb:     	movq	%rax, %rdi
1458ed0fe:     	jne	0x1458ed0a0 <.text+0x58ec0a0>
1458ed100:     	leaq	(%rax,%rbx), %rdi
1458ed104:     	addq	$-0x78, %rdi
1458ed108:     	movq	(%rdi), %rax
1458ed10b:     	movq	0x8(%rdi), %rcx
1458ed10f:     	cmpq	$0xb, %rcx
1458ed113:     	jne	0x1458ed130 <.text+0x58ec130>
1458ed115:     	jmp	0x1458ed16d <.text+0x58ec16d>
1458ed117:     	addq	%rbx, %rdi
1458ed11a:     	movq	(%rdi), %rax
1458ed11d:     	movq	0x8(%rdi), %rcx
1458ed121:     	cmpq	$0xb, %rcx
1458ed125:     	je	0x1458ed16d <.text+0x58ec16d>
1458ed127:     	nopw	(%rax,%rax)
1458ed130:     	cmpq	$0xc, %rcx
1458ed134:     	jne	0x1458ed154 <.text+0x58ec154>
1458ed136:     	movq	(%rax), %rcx
1458ed139:     	movabsq	$0x5f737265746e7568, %rdx # imm = 0x5F737265746E7568
1458ed143:     	xorq	%rdx, %rcx
1458ed146:     	movl	0x8(%rax), %eax
1458ed149:     	xorq	$0x6b72616d, %rax       # imm = 0x6B72616D
1458ed14f:     	orq	%rcx, %rax
1458ed152:     	je	0x1458ed193 <.text+0x58ec193>
1458ed154:     	xorl	%r15d, %r15d
1458ed157:     	jmp	0x1458ed196 <.text+0x58ec196>
1458ed159:     	addq	%rbx, %rdi
1458ed15c:     	addq	$0x78, %rdi
1458ed160:     	movq	(%rdi), %rax
1458ed163:     	movq	0x8(%rdi), %rcx
1458ed167:     	cmpq	$0xb, %rcx
1458ed16b:     	jne	0x1458ed130 <.text+0x58ec130>
1458ed16d:     	movq	(%rax), %rcx
1458ed170:     	movabsq	$0x665f656972656166, %rdx # imm = 0x665F656972656166
1458ed17a:     	xorq	%rdx, %rcx
1458ed17d:     	movq	0x3(%rax), %rax
1458ed181:     	movabsq	$0x657269665f656972, %rdx # imm = 0x657269665F656972
1458ed18b:     	xorq	%rdx, %rax
1458ed18e:     	orq	%rcx, %rax
1458ed191:     	jne	0x1458ed154 <.text+0x58ec154>
1458ed193:     	movb	$0x1, %r15b
1458ed196:     	movq	%r12, %rcx
1458ed199:     	movq	%r9, %rdx
1458ed19c:     	movaps	%xmm6, %xmm3
1458ed19f:     	callq	0x1458df590 <.text+0x58de590>
1458ed1a4:     	nop
1458ed1a5:     	movzbl	0x30(%rbp), %eax
1458ed1a9:     	xorb	$0x1, %al
1458ed1ab:     	orb	%r15b, %al
1458ed1ae:     	xorl	%esi, %esi
1458ed1b0:     	movaps	%xmm7, %xmm0
1458ed1b3:     	movaps	%xmm7, %xmm1
1458ed1b6:     	cmpb	$0x1, %al
1458ed1b8:     	je	0x1458ed1c7 <.text+0x58ec1c7>
1458ed1ba:     	movss	0x34(%rbp), %xmm0
1458ed1bf:     	movss	0x38(%rbp), %xmm1
1458ed1c4:     	xorl	%r15d, %r15d
1458ed1c7:     	movss	%xmm1, 0xe0(%rbp)
1458ed1cf:     	movss	%xmm0, 0xdc(%rbp)
1458ed1d7:     	movl	0x134(%rbp), %ecx
1458ed1dd:     	callq	0x1458c0250 <.text+0x58bf250>
1458ed1e2:     	nop
1458ed1e3:     	movq	%rax, %rdx
1458ed1e6:     	testb	%sil, %sil
1458ed1e9:     	je	0x1458ed210 <.text+0x58ec210>
1458ed1eb:     	testq	%rdx, %rdx
1458ed1ee:     	je	0x1458ed393 <.text+0x58ec393>
1458ed1f4:     	movq	0x8(%rdx), %rdi
1458ed1f8:     	movq	0x10(%rdx), %rsi
1458ed1fc:     	movq	$-0x1, 0x148(%rbp)
1458ed207:     	jmp	0x1458ed314 <.text+0x58ec314>
1458ed20c:     	nopl	(%rax)
1458ed210:     	movq	%rdi, 0xf0(%rbp)
1458ed217:     	leaq	-0x58eb15e(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458ed21e:     	movq	%rax, 0xf8(%rbp)
1458ed225:     	movq	%r12, %rcx
1458ed228:     	movq	%rdx, 0x140(%rbp)
1458ed22f:     	leaq	0x12b3b19(%rip), %rdx   # 0x146ba0d4f
1458ed236:     	leaq	0xf0(%rbp), %r8
1458ed23d:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458ed242:     	nop
1458ed243:     	movl	%r15d, 0x138(%rbp)
1458ed24a:     	movq	%rbx, %r13
1458ed24d:     	movq	%r12, %rbx
1458ed250:     	movq	0x38(%rbp), %rcx
1458ed254:     	movq	0x40(%rbp), %rdx
1458ed258:     	movq	0x10(%rdi), %rsi
1458ed25c:     	movq	0x18(%rdi), %r12
1458ed260:     	movq	%rcx, 0x148(%rbp)
1458ed267:     	callq	0x1458da590 <.text+0x58d9590>
1458ed26c:     	nop
1458ed26d:     	movq	%rax, %r15
1458ed270:     	movq	%rdx, %r14
1458ed273:     	movq	0x30(%rbp), %rdx
1458ed277:     	testq	%rdx, %rdx
1458ed27a:     	je	0x1458ed28e <.text+0x58ec28e>
1458ed27c:     	movl	$0x1, %r8d
1458ed282:     	movq	0x148(%rbp), %rcx
1458ed289:     	callq	0x1400021d0 <.text+0x11d0>
1458ed28e:     	testq	%r15, %r15
1458ed291:     	cmovneq	%r15, %rsi
1458ed295:     	cmoveq	%r12, %r14
1458ed299:     	addq	$0x20, %rdi
1458ed29d:     	movq	%rdi, 0xf0(%rbp)
1458ed2a4:     	leaq	-0x58eb1eb(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458ed2ab:     	movq	%rax, 0xf8(%rbp)
1458ed2b2:     	movq	%rbx, %r12
1458ed2b5:     	movq	%rbx, %rcx
1458ed2b8:     	leaq	0x158b501(%rip), %rdx   # 0x146e787c0
1458ed2bf:     	leaq	0xf0(%rbp), %r8
1458ed2c6:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458ed2cb:     	nop
1458ed2cc:     	movq	%r13, %rbx
1458ed2cf:     	leaq	0x13c(%rbp), %r13
1458ed2d6:     	movl	0x138(%rbp), %r15d
1458ed2dd:     	movq	0x140(%rbp), %rdx
1458ed2e4:     	movq	0x30(%rbp), %rcx
1458ed2e8:     	movq	0x38(%rbp), %rax
1458ed2ec:     	movq	%rax, 0x128(%rbp)
1458ed2f3:     	movq	0x40(%rbp), %rax
1458ed2f7:     	movq	%rax, 0xe8(%rbp)
1458ed2fe:     	testq	%rdx, %rdx
1458ed301:     	je	0x1458ed3c0 <.text+0x58ec3c0>
1458ed307:     	movq	%rcx, 0x148(%rbp)
1458ed30e:     	movq	%rsi, %rdi
1458ed311:     	movq	%r14, %rsi
1458ed314:     	movq	%rdx, %r13
1458ed317:     	addq	$0x18, %rdx
1458ed31b:     	movq	%r12, %rcx
1458ed31e:     	callq	0x145b9c990 <.text+0x5b9b990>
1458ed323:     	nop
1458ed324:     	movq	0x30(%rbp), %rdx
1458ed328:     	movq	0x38(%rbp), %rax
1458ed32c:     	movq	%rax, 0x140(%rbp)
1458ed333:     	cmpq	$-0x1, 0x148(%rbp)
1458ed33b:     	je	0x1458ed376 <.text+0x58ec376>
1458ed33d:     	movl	%r15d, %r14d
1458ed340:     	leaq	-0x1(%rdx), %rax
1458ed344:     	cmpq	$-0x3, %rax
1458ed348:     	ja	0x1458ed35c <.text+0x58ec35c>
1458ed34a:     	movl	$0x1, %r8d
1458ed350:     	movq	0x140(%rbp), %rcx
1458ed357:     	callq	0x1400021d0 <.text+0x11d0>
1458ed35c:     	movq	0xe8(%rbp), %r15
1458ed363:     	movq	0x128(%rbp), %rax
1458ed36a:     	movq	%rax, 0x140(%rbp)
1458ed371:     	jmp	0x1458ed4a0 <.text+0x58ec4a0>
1458ed376:     	movl	%r15d, %r14d
1458ed379:     	cmpq	$-0x1, %rdx
1458ed37d:     	je	0x1458ed47d <.text+0x58ec47d>
1458ed383:     	movq	0x40(%rbp), %r15
1458ed387:     	movq	%rdx, 0x148(%rbp)
1458ed38e:     	jmp	0x1458ed4a0 <.text+0x58ec4a0>
1458ed393:     	movl	%r15d, 0x138(%rbp)
1458ed39a:     	movl	$0x1, %edi
1458ed39f:     	xorl	%esi, %esi
1458ed3a1:     	xorl	%r15d, %r15d
1458ed3a4:     	movl	$0x1, %eax
1458ed3a9:     	movq	%rax, 0x140(%rbp)
1458ed3b0:     	movq	$0x0, 0x148(%rbp)
1458ed3bb:     	jmp	0x1458ed4e8 <.text+0x58ec4e8>
1458ed3c0:     	cmpq	$-0x1, %rcx
1458ed3c4:     	movq	%rsi, %rdi
1458ed3c7:     	je	0x1458ed4cb <.text+0x58ec4cb>
1458ed3cd:     	movq	%rcx, 0x148(%rbp)
1458ed3d4:     	movq	0xe8(%rbp), %r15
1458ed3db:     	movq	0x128(%rbp), %rax
1458ed3e2:     	movq	%rax, 0x140(%rbp)
1458ed3e9:     	jmp	0x1458ed4e5 <.text+0x58ec4e5>
1458ed3ee:     	addq	%rbx, %rdi
1458ed3f1:     	addq	$0xf0, %rdi
1458ed3f8:     	movq	(%rdi), %rax
1458ed3fb:     	movq	0x8(%rdi), %rcx
1458ed3ff:     	cmpq	$0xb, %rcx
1458ed403:     	jne	0x1458ed130 <.text+0x58ec130>
1458ed409:     	jmp	0x1458ed16d <.text+0x58ec16d>
1458ed40e:     	addq	%rbx, %rdi
1458ed411:     	addq	$0x168, %rdi            # imm = 0x168
1458ed418:     	movq	(%rdi), %rax
1458ed41b:     	movq	0x8(%rdi), %rcx
1458ed41f:     	cmpq	$0xb, %rcx
1458ed423:     	jne	0x1458ed130 <.text+0x58ec130>
1458ed429:     	jmp	0x1458ed16d <.text+0x58ec16d>
1458ed42e:     	addq	%rbx, %rdi
1458ed431:     	addq	$0x1e0, %rdi            # imm = 0x1E0
1458ed438:     	movq	(%rdi), %rax
1458ed43b:     	movq	0x8(%rdi), %rcx
1458ed43f:     	cmpq	$0xb, %rcx
1458ed443:     	jne	0x1458ed130 <.text+0x58ec130>
1458ed449:     	jmp	0x1458ed16d <.text+0x58ec16d>
1458ed44e:     	movq	%r12, %rcx
1458ed451:     	movq	%r9, %rdx
1458ed454:     	movaps	%xmm6, %xmm3
1458ed457:     	callq	0x1458df590 <.text+0x58de590>
1458ed45c:     	nop
1458ed45d:     	xorl	%edi, %edi
1458ed45f:     	cmpl	$0x1, 0x30(%rbp)
1458ed463:     	movb	$0x1, %sil
1458ed466:     	movl	$0x0, %r15d
1458ed46c:     	movaps	%xmm7, %xmm0
1458ed46f:     	movaps	%xmm7, %xmm1
1458ed472:     	je	0x1458ed1ba <.text+0x58ec1ba>
1458ed478:     	jmp	0x1458ed1c7 <.text+0x58ec1c7>
1458ed47d:     	movl	$0x1, %eax
1458ed482:     	movq	%rax, 0x140(%rbp)
1458ed489:     	xorl	%r15d, %r15d
1458ed48c:     	movq	$0x0, 0x148(%rbp)
1458ed497:     	nopw	(%rax,%rax)
1458ed4a0:     	movq	0x120(%rbp), %rax
1458ed4a7:     	movl	0x88(%rax), %eax
1458ed4ad:     	movl	%eax, 0x13c(%rbp)
1458ed4b3:     	movb	%r14b, 0x157(%rbp)
1458ed4ba:     	movq	0x30(%r13), %rax
1458ed4be:     	movq	0x38(%r13), %rcx
1458ed4c2:     	leaq	0x13c(%rbp), %r13
1458ed4c9:     	jmp	0x1458ed50e <.text+0x58ec50e>
1458ed4cb:     	movl	$0x1, %eax
1458ed4d0:     	movq	%rax, 0x140(%rbp)
1458ed4d7:     	xorl	%r15d, %r15d
1458ed4da:     	movq	$0x0, 0x148(%rbp)
1458ed4e5:     	movq	%r14, %rsi
1458ed4e8:     	movq	0x120(%rbp), %rax
1458ed4ef:     	movl	0x88(%rax), %eax
1458ed4f5:     	movl	%eax, 0x13c(%rbp)
1458ed4fb:     	movl	0x138(%rbp), %eax
1458ed501:     	movb	%al, 0x157(%rbp)
1458ed507:     	movl	$0x1, %eax
1458ed50c:     	xorl	%ecx, %ecx
1458ed50e:     	movq	%rax, -0x50(%rbp)
1458ed512:     	movq	%rcx, -0x48(%rbp)
1458ed516:     	movq	$0x0, 0x30(%rbp)
1458ed51e:     	movq	$0x1, 0x38(%rbp)
1458ed526:     	movq	$0x0, 0x40(%rbp)
1458ed52e:     	testq	%r15, %r15
1458ed531:     	jne	0x1458ed70f <.text+0x58ec70f>
1458ed537:     	movq	0x140(%rbp), %rcx
1458ed53e:     	addq	%rcx, %r15
1458ed541:     	movq	%r15, %rdx
1458ed544:     	movq	%r12, %r8
1458ed547:     	callq	0x1459b9b70 <.text+0x59b8b70>
1458ed54c:     	nop
1458ed54d:     	movq	0x40(%rbp), %rax
1458ed551:     	movq	%rax, 0x20(%rbp)
1458ed555:     	movups	0x30(%rbp), %xmm0
1458ed559:     	movaps	%xmm0, 0x10(%rbp)
1458ed55d:     	movq	$0x0, 0x30(%rbp)
1458ed565:     	movq	$0x1, 0x38(%rbp)
1458ed56d:     	movq	$0x0, 0x40(%rbp)
1458ed575:     	testq	%rsi, %rsi
1458ed578:     	jne	0x1458ed743 <.text+0x58ec743>
1458ed57e:     	addq	%rdi, %rsi
1458ed581:     	movq	%rdi, %rcx
1458ed584:     	movq	%rsi, %rdx
1458ed587:     	movq	%r12, %r8
1458ed58a:     	callq	0x1459b9b70 <.text+0x59b8b70>
1458ed58f:     	nop
1458ed590:     	movq	0x40(%rbp), %rax
1458ed594:     	movq	%rax, 0x100(%rbp)
1458ed59b:     	movups	0x30(%rbp), %xmm0
1458ed59f:     	movaps	%xmm0, 0xf0(%rbp)
1458ed5a6:     	movq	%r13, 0x30(%rbp)
1458ed5aa:     	leaq	0x2c09cf(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
1458ed5b1:     	movq	%rax, 0x38(%rbp)
1458ed5b5:     	leaq	0x134(%rbp), %rcx
1458ed5bc:     	movq	%rcx, 0x40(%rbp)
1458ed5c0:     	movq	%rax, 0x48(%rbp)
1458ed5c4:     	leaq	0xe4(%rbp), %rcx
1458ed5cb:     	movq	%rcx, 0x50(%rbp)
1458ed5cf:     	movq	%rax, 0x58(%rbp)
1458ed5d3:     	leaq	0xe0(%rbp), %rax
1458ed5da:     	movq	%rax, 0x60(%rbp)
1458ed5de:     	leaq	0x2bfc9b(%rip), %rax    # 0x145bad280 <.text+0x5bac280>
1458ed5e5:     	movq	%rax, 0x68(%rbp)
1458ed5e9:     	leaq	0xdc(%rbp), %rcx
1458ed5f0:     	movq	%rcx, 0x70(%rbp)
1458ed5f4:     	movq	%rax, 0x78(%rbp)
1458ed5f8:     	leaq	0x157(%rbp), %rax
1458ed5ff:     	movq	%rax, 0x80(%rbp)
1458ed606:     	leaq	0x2bd2a3(%rip), %rax    # 0x145baa8b0 <.text+0x5ba98b0>
1458ed60d:     	movq	%rax, 0x88(%rbp)
1458ed614:     	leaq	-0x50(%rbp), %rax
1458ed618:     	movq	%rax, 0x90(%rbp)
1458ed61f:     	leaq	-0x58eb566(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458ed626:     	movq	%rax, 0x98(%rbp)
1458ed62d:     	leaq	0x10(%rbp), %rax
1458ed631:     	movq	%rax, 0xa0(%rbp)
1458ed638:     	leaq	-0x58eb55f(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1458ed63f:     	movq	%rax, 0xa8(%rbp)
1458ed646:     	leaq	0xf0(%rbp), %rcx
1458ed64d:     	movq	%rcx, 0xb0(%rbp)
1458ed654:     	movq	%rax, 0xb8(%rbp)
1458ed65b:     	leaq	-0x40(%rbp), %rcx
1458ed65f:     	leaq	0x158b57c(%rip), %rdx   # 0x146e78be2
1458ed666:     	movq	%r12, %r8
1458ed669:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458ed66e:     	nop
1458ed66f:     	movq	0xf0(%rbp), %rdx
1458ed676:     	testq	%rdx, %rdx
1458ed679:     	je	0x1458ed68d <.text+0x58ec68d>
1458ed67b:     	movq	0xf8(%rbp), %rcx
1458ed682:     	movl	$0x1, %r8d
1458ed688:     	callq	0x1400021d0 <.text+0x11d0>
1458ed68d:     	movq	0x10(%rbp), %rdx
1458ed691:     	testq	%rdx, %rdx
1458ed694:     	je	0x1458ed6a5 <.text+0x58ec6a5>
1458ed696:     	movq	0x18(%rbp), %rcx
1458ed69a:     	movl	$0x1, %r8d
1458ed6a0:     	callq	0x1400021d0 <.text+0x11d0>
1458ed6a5:     	movq	0x118(%rbp), %rsi
1458ed6ac:     	cmpq	0x108(%rbp), %rsi
1458ed6b3:     	jne	0x1458ed6c2 <.text+0x58ec6c2>
1458ed6b5:     	leaq	0x108(%rbp), %rcx
1458ed6bc:     	callq	0x145bcb3e0 <.text+0x5bca3e0>
1458ed6c1:     	nop
1458ed6c2:     	movq	0x110(%rbp), %rax
1458ed6c9:     	leaq	(%rsi,%rsi,2), %rcx
1458ed6cd:     	movq	-0x30(%rbp), %rdx
1458ed6d1:     	movq	%rdx, 0x10(%rax,%rcx,8)
1458ed6d6:     	movups	-0x40(%rbp), %xmm0
1458ed6da:     	movups	%xmm0, (%rax,%rcx,8)
1458ed6de:     	incq	%rsi
1458ed6e1:     	movq	%rsi, 0x118(%rbp)
1458ed6e8:     	movq	0x148(%rbp), %rdx
1458ed6ef:     	testq	%rdx, %rdx
1458ed6f2:     	je	0x1458ed020 <.text+0x58ec020>
1458ed6f8:     	movl	$0x1, %r8d
1458ed6fe:     	movq	0x140(%rbp), %rcx
1458ed705:     	callq	0x1400021d0 <.text+0x11d0>
1458ed70a:     	jmp	0x1458ed020 <.text+0x58ec020>
1458ed70f:     	movq	%r15, %r8
1458ed712:     	shrq	$0x2, %r8
1458ed716:     	movl	%r15d, %eax
1458ed719:     	andl	$0x3, %eax
1458ed71c:     	cmpq	$0x1, %rax
1458ed720:     	sbbq	$-0x1, %r8
1458ed724:     	movq	$0x1, 0x20(%rsp)
1458ed72d:     	movl	$0x1, %r9d
1458ed733:     	movq	%r12, %rcx
1458ed736:     	xorl	%edx, %edx
1458ed738:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458ed73d:     	nop
1458ed73e:     	jmp	0x1458ed537 <.text+0x58ec537>
1458ed743:     	movq	%rsi, %r8
1458ed746:     	shrq	$0x2, %r8
1458ed74a:     	movl	%esi, %eax
1458ed74c:     	andl	$0x3, %eax
1458ed74f:     	cmpq	$0x1, %rax
1458ed753:     	sbbq	$-0x1, %r8
1458ed757:     	movq	$0x1, 0x20(%rsp)
1458ed760:     	movl	$0x1, %r9d
1458ed766:     	movq	%r12, %rcx
1458ed769:     	xorl	%edx, %edx
1458ed76b:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458ed770:     	nop
1458ed771:     	jmp	0x1458ed57e <.text+0x58ec57e>
1458ed776:     	movq	0xc8(%rbp), %rdx
1458ed77d:     	testq	%rdx, %rdx
1458ed780:     	je	0x1458ed798 <.text+0x58ec798>
1458ed782:     	shlq	$0x3, %rdx
1458ed786:     	movl	$0x8, %r8d
1458ed78c:     	movq	0xd0(%rbp), %rcx
1458ed793:     	callq	0x1400021d0 <.text+0x11d0>
1458ed798:     	movq	0x110(%rbp), %rdx
1458ed79f:     	movq	0x118(%rbp), %r8
1458ed7a6:     	movq	$0x1, 0x20(%rsp)
1458ed7af:     	leaq	0x158b3de(%rip), %r9    # 0x146e78b94
1458ed7b6:     	leaq	0x30(%rbp), %rcx
1458ed7ba:     	callq	0x1458b82d0 <.text+0x58b72d0>
1458ed7bf:     	nop
1458ed7c0:     	movq	0x8(%rbp), %rbx
1458ed7c4:     	movq	0x40(%rbp), %rax
1458ed7c8:     	movq	%rax, 0x10(%rbx)
1458ed7cc:     	movups	0x30(%rbp), %xmm0
1458ed7d0:     	movups	%xmm0, (%rbx)
1458ed7d3:     	movq	0x118(%rbp), %rsi
1458ed7da:     	testq	%rsi, %rsi
1458ed7dd:     	je	0x1458ed812 <.text+0x58ec812>
1458ed7df:     	movq	0x110(%rbp), %rdi
1458ed7e6:     	addq	$0x8, %rdi
1458ed7ea:     	jmp	0x1458ed7f9 <.text+0x58ec7f9>
1458ed7ec:     	nopl	(%rax)
1458ed7f0:     	addq	$0x18, %rdi
1458ed7f4:     	decq	%rsi
1458ed7f7:     	je	0x1458ed812 <.text+0x58ec812>
1458ed7f9:     	movq	-0x8(%rdi), %rdx
1458ed7fd:     	testq	%rdx, %rdx
1458ed800:     	je	0x1458ed7f0 <.text+0x58ec7f0>
1458ed802:     	movq	(%rdi), %rcx
1458ed805:     	movl	$0x1, %r8d
1458ed80b:     	callq	0x1400021d0 <.text+0x11d0>
1458ed810:     	jmp	0x1458ed7f0 <.text+0x58ec7f0>
1458ed812:     	movq	0x108(%rbp), %rax
1458ed819:     	testq	%rax, %rax
1458ed81c:     	je	0x1458ed838 <.text+0x58ec838>
1458ed81e:     	movq	0x110(%rbp), %rcx
1458ed825:     	shlq	$0x3, %rax
1458ed829:     	leaq	(%rax,%rax,2), %rdx
1458ed82d:     	movl	$0x8, %r8d
1458ed833:     	callq	0x1400021d0 <.text+0x11d0>
1458ed838:     	movq	%rbx, %rax
1458ed83b:     	movaps	0x160(%rbp), %xmm6
1458ed842:     	movaps	0x170(%rbp), %xmm7
1458ed849:     	addq	$0x208, %rsp            # imm = 0x208
1458ed850:     	popq	%rbx
1458ed851:     	popq	%rdi
1458ed852:     	popq	%rsi
1458ed853:     	popq	%r12
1458ed855:     	popq	%r13
1458ed857:     	popq	%r14
1458ed859:     	popq	%r15
1458ed85b:     	popq	%rbp
1458ed85c:     	retq
1458ed85d:     	cmpq	$0x15, %rsi
1458ed861:     	jae	0x1458ed87d <.text+0x58ec87d>
1458ed863:     	leaq	0x30(%rbp), %r9
1458ed867:     	movl	$0x1, %r8d
1458ed86d:     	movq	%rdi, %rcx
1458ed870:     	movq	%rsi, %rdx
1458ed873:     	callq	0x145981d60 <.text+0x5980d60>
1458ed878:     	jmp	0x1458ecf8d <.text+0x58ebf8d>
1458ed87d:     	movb	$0x1, 0x156(%rbp)
1458ed884:     	leaq	0x30(%rbp), %r8
1458ed888:     	movq	%rdi, %rcx
1458ed88b:     	movq	%rsi, %rdx
1458ed88e:     	callq	0x1459879f0 <.text+0x59869f0>
1458ed893:     	nop
1458ed894:     	jmp	0x1458ecf8d <.text+0x58ebf8d>

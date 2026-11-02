
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140214080:     	pushq	%rbp
140214081:     	pushq	%r15
140214083:     	pushq	%r14
140214085:     	pushq	%r13
140214087:     	pushq	%r12
140214089:     	pushq	%rsi
14021408a:     	pushq	%rdi
14021408b:     	pushq	%rbx
14021408c:     	subq	$0x9a8, %rsp            # imm = 0x9A8
140214093:     	leaq	0x80(%rsp), %rbp
14021409b:     	movaps	%xmm15, 0x910(%rbp)
1402140a3:     	movaps	%xmm14, 0x900(%rbp)
1402140ab:     	movaps	%xmm13, 0x8f0(%rbp)
1402140b3:     	movaps	%xmm12, 0x8e0(%rbp)
1402140bb:     	movaps	%xmm11, 0x8d0(%rbp)
1402140c3:     	movaps	%xmm10, 0x8c0(%rbp)
1402140cb:     	movaps	%xmm9, 0x8b0(%rbp)
1402140d3:     	movaps	%xmm8, 0x8a0(%rbp)
1402140db:     	movaps	%xmm7, 0x890(%rbp)
1402140e2:     	movaps	%xmm6, 0x880(%rbp)
1402140e9:     	movq	$-0x2, 0x878(%rbp)
1402140f4:     	movq	%rdx, %rbx
1402140f7:     	movq	%rcx, %rsi
1402140fa:     	movq	(%rcx), %r12
1402140fd:     	movq	0x28(%rcx), %rax
140214101:     	movq	%r12, 0x60(%rbp)
140214105:     	leaq	0x68(%rbp), %r14
140214109:     	movups	0x8(%rcx), %xmm0
14021410d:     	movups	%xmm0, 0x68(%rbp)
140214111:     	movups	0x18(%rcx), %xmm0
140214115:     	movups	%xmm0, 0x78(%rbp)
140214119:     	movq	%rax, 0x88(%rbp)
140214120:     	movups	0x572ad58(%rip), %xmm9  # 0x14593ee80
140214128:     	movaps	%xmm9, (%rbp)
14021412d:     	movq	$0x0, 0x10(%rbp)
140214135:     	movups	0x572ad5b(%rip), %xmm11 # 0x14593ee98
14021413d:     	movups	%xmm11, 0x18(%rbp)
140214142:     	movq	$0x0, 0x28(%rbp)
14021414a:     	movups	0x572ad5e(%rip), %xmm10 # 0x14593eeb0
140214152:     	movaps	%xmm10, 0x30(%rbp)
140214157:     	movq	$0x0, 0x40(%rbp)
14021415f:     	movups	0x572ad61(%rip), %xmm12 # 0x14593eec8
140214167:     	movups	%xmm12, 0x48(%rbp)
14021416c:     	movq	$0x0, 0x58(%rbp)
140214174:     	xorps	%xmm0, %xmm0
140214177:     	movups	%xmm0, 0x660(%rbp)
14021417e:     	movups	%xmm0, 0x650(%rbp)
140214185:     	movl	$0x0, 0x72c(%rbp)
14021418f:     	movw	$0x0, 0x730(%rbp)
140214198:     	movups	%xmm0, 0x788(%rbp)
14021419f:     	movaps	(%rbp), %xmm0
1402141a3:     	movq	0x10(%rbp), %rax
1402141a7:     	movq	0x18(%rbp), %rcx
1402141ab:     	movq	0x20(%rbp), %rdx
1402141af:     	movq	0x28(%rbp), %r8
1402141b3:     	movdqa	0x30(%rbp), %xmm1
1402141b8:     	movups	%xmm0, 0x5b8(%rbp)
1402141bf:     	movq	%rax, 0x5c8(%rbp)
1402141c6:     	movq	%rcx, 0x5d0(%rbp)
1402141cd:     	movq	%rdx, 0x5d8(%rbp)
1402141d4:     	movq	%r8, 0x5e0(%rbp)
1402141db:     	movdqu	%xmm1, 0x5e8(%rbp)
1402141e3:     	movaps	0x40(%rbp), %xmm0
1402141e7:     	movups	%xmm0, 0x5f8(%rbp)
1402141ee:     	movaps	0x50(%rbp), %xmm0
1402141f2:     	movups	%xmm0, 0x608(%rbp)
1402141f9:     	movaps	0x56e4d30(%rip), %xmm0  # 0x1458f8f30
140214200:     	movups	%xmm0, 0x618(%rbp)
140214207:     	movaps	0x56e8ac2(%rip), %xmm0  # 0x1458fccd0
14021420e:     	movups	%xmm0, 0x628(%rbp)
140214215:     	movaps	0x572a154(%rip), %xmm0  # 0x14593e370
14021421c:     	movups	%xmm0, 0x638(%rbp)
140214223:     	movabsq	$0x41d0000000000001, %rax # imm = 0x41D0000000000001
14021422d:     	movq	%rax, 0x648(%rbp)
140214234:     	movdqu	0x572ad0b(%rip), %xmm13 # 0x14593ef48
14021423d:     	movdqu	%xmm13, 0x680(%rbp)
140214246:     	movups	0x572acea(%rip), %xmm14 # 0x14593ef38
14021424e:     	movups	%xmm14, 0x670(%rbp)
140214256:     	movups	0x572ad0a(%rip), %xmm15 # 0x14593ef68
14021425e:     	movups	%xmm15, 0x6a0(%rbp)
140214266:     	movdqu	0x572ace9(%rip), %xmm8  # 0x14593ef58
14021426f:     	movdqu	%xmm8, 0x690(%rbp)
140214278:     	movdqa	0x56d7070(%rip), %xmm7  # 0x1458eb2f0
140214280:     	movdqu	%xmm7, 0x6b0(%rbp)
140214288:     	movdqu	%xmm7, 0x6c0(%rbp)
140214290:     	movaps	0x572a0e9(%rip), %xmm0  # 0x14593e380
140214297:     	movups	%xmm0, 0x6d0(%rbp)
14021429e:     	movups	%xmm0, 0x6e0(%rbp)
1402142a5:     	movdqa	0x56d7203(%rip), %xmm6  # 0x1458eb4b0
1402142ad:     	movdqu	%xmm6, 0x6f0(%rbp)
1402142b5:     	movl	$0x1, 0x700(%rbp)
1402142bf:     	movq	$0x0, 0x704(%rbp)
1402142ca:     	movb	$0x1, 0x70c(%rbp)
1402142d1:     	movq	$0x0, 0x710(%rbp)
1402142dc:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
1402142e6:     	movw	$0x0, 0x71c(%rbp)
1402142ef:     	movw	$0x0, 0x722(%rbp)
1402142f8:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
140214302:     	movw	$0x0, 0x728(%rbp)
14021430b:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
140214315:     	movw	$0x100, 0x72a(%rbp)     # imm = 0x100
14021431e:     	movl	$0x5000005, 0x732(%rbp) # imm = 0x5000005
140214328:     	movl	$0x0, 0x738(%rbp)
140214332:     	movdqa	0x572a056(%rip), %xmm0  # 0x14593e390
14021433a:     	movdqu	%xmm0, 0x73c(%rbp)
140214342:     	movl	$0x0, 0x74c(%rbp)
14021434c:     	movdqu	%xmm0, 0x750(%rbp)
140214354:     	movl	$0x0, 0x760(%rbp)
14021435e:     	movdqu	%xmm0, 0x764(%rbp)
140214366:     	movl	$0x0, 0x774(%rbp)
140214370:     	movdqu	%xmm0, 0x778(%rbp)
140214378:     	movl	$0x3f19999a, 0x798(%rbp) # imm = 0x3F19999A
140214382:     	movq	%r12, 0x5b0(%rbp)
140214389:     	leaq	0x90(%rbp), %rcx
140214390:     	leaq	0x5b0(%rbp), %r8
140214397:     	movq	%r14, %rdx
14021439a:     	callq	0x1401e4670 <.text+0x1e3670>
14021439f:     	movq	(%rbx), %rdi
1402143a2:     	movq	0x8(%rbx), %rax
1402143a6:     	movq	(%rax), %rcx
1402143a9:     	incq	%rcx
1402143ac:     	leaq	0x5b0(%rbp), %rdx
1402143b3:     	movl	$0x14, %r8d
1402143b9:     	callq	0x1457134f0 <.text+0x57124f0>
1402143be:     	movq	%rdx, %r15
1402143c1:     	testq	%rdx, %rdx
1402143c4:     	jns	0x1402143d6 <.text+0x2133d6>
1402143c6:     	xorl	%r14d, %r14d
1402143c9:     	movq	%r14, %rcx
1402143cc:     	movq	%r15, %rdx
1402143cf:     	callq	0x1458e721b <.text+0x58e621b>
1402143d4:     	ud2
1402143d6:     	movq	%r12, 0x5a8(%rbp)
1402143dd:     	je	0x140214437 <.text+0x213437>
1402143df:     	movq	%rax, %r13
1402143e2:     	callq	0x140002200 <.text+0x1200>
1402143e7:     	movl	$0x1, %r14d
1402143ed:     	movl	$0x1, %edx
1402143f2:     	movq	%r15, %rcx
1402143f5:     	callq	0x1400021c0 <.text+0x11c0>
1402143fa:     	testq	%rax, %rax
1402143fd:     	je	0x1402143c9 <.text+0x2133c9>
1402143ff:     	movq	%rax, %r12
140214402:     	movq	%rax, %rcx
140214405:     	movq	%r13, %rdx
140214408:     	movq	%r15, %r8
14021440b:     	callq	0x145756ddd <.text+0x5755ddd>
140214410:     	leaq	0x68(%rbp), %r14
140214414:     	cmpb	$0x1, (%rdi)
140214417:     	jne	0x140214442 <.text+0x213442>
140214419:     	movl	0x1(%rdi), %eax
14021441c:     	movl	0x4(%rdi), %ecx
14021441f:     	movl	%ecx, 0x343(%rbp)
140214425:     	movl	%eax, 0x340(%rbp)
14021442b:     	movq	0x8(%rdi), %rax
14021442f:     	movzbl	0x10(%rdi), %ecx
140214433:     	movb	$0x1, %dl
140214435:     	jmp	0x140214452 <.text+0x213452>
140214437:     	movl	$0x1, %r12d
14021443d:     	cmpb	$0x1, (%rdi)
140214440:     	je	0x140214419 <.text+0x213419>
140214442:     	movq	0x8(%rdi), %rax
140214446:     	lock
140214447:     	incq	(%rax)
14021444a:     	jle	0x1402167c3 <.text+0x2157c3>
140214450:     	xorl	%edx, %edx
140214452:     	movq	%rsi, 0x578(%rbp)
140214459:     	movq	%r15, 0x5b0(%rbp)
140214460:     	movq	%r12, 0x5b8(%rbp)
140214467:     	movq	%r15, 0x5c0(%rbp)
14021446e:     	movq	$0x0, 0x5c8(%rbp)
140214479:     	movq	$0x4, 0x5d0(%rbp)
140214484:     	movq	$0x0, 0x5d8(%rbp)
14021448f:     	movb	%dl, 0x5e0(%rbp)
140214495:     	movl	0x340(%rbp), %edx
14021449b:     	movl	0x343(%rbp), %r8d
1402144a2:     	movl	%edx, 0x5e1(%rbp)
1402144a8:     	movl	%r8d, 0x5e4(%rbp)
1402144af:     	movq	%rax, 0x5e8(%rbp)
1402144b6:     	movq	%rcx, 0x5f0(%rbp)
1402144bd:     	movl	$0x41500000, 0x5f8(%rbp) # imm = 0x41500000
1402144c7:     	movw	$0x190, 0x5fc(%rbp)     # imm = 0x190
1402144d0:     	movb	$0x1, 0x5fe(%rbp)
1402144d7:     	movups	0x572a95e(%rip), %xmm0  # 0x14593ee3c
1402144de:     	movups	%xmm0, 0x600(%rbp)
1402144e5:     	movl	$0x3f800000, 0x610(%rbp) # imm = 0x3F800000
1402144ef:     	movl	0x56e93e7(%rip), %eax   # 0x1458fd8dc
1402144f5:     	movl	%eax, 0x624(%rbp)
1402144fb:     	movups	0x56e93ca(%rip), %xmm0  # 0x1458fd8cc
140214502:     	movups	%xmm0, 0x614(%rbp)
140214509:     	movq	0x56e49ff(%rip), %xmm0  # 0x1458f8f10
140214511:     	movq	%xmm0, 0x628(%rbp)
140214519:     	leaq	0x90(%rbp), %rcx
140214520:     	leaq	0x5b0(%rbp), %rdx
140214527:     	callq	0x1401fe030 <.text+0x1fd030>
14021452c:     	movq	0x10(%rbx), %r15
140214530:     	cmpq	$0x0, 0x10(%r15)
140214535:     	movq	0x5a8(%rbp), %r12
14021453c:     	je	0x140214980 <.text+0x213980>
140214542:     	movaps	%xmm9, 0x90(%rbp)
14021454a:     	movq	$0x0, 0xa0(%rbp)
140214555:     	movups	%xmm11, 0xa8(%rbp)
14021455d:     	movq	$0x0, 0xb8(%rbp)
140214568:     	movaps	%xmm10, 0xc0(%rbp)
140214570:     	movq	$0x0, 0xd0(%rbp)
14021457b:     	movups	%xmm12, 0xd8(%rbp)
140214583:     	movq	$0x0, 0xe8(%rbp)
14021458e:     	movq	0x18(%rbx), %rax
140214592:     	movzbl	(%rax), %esi
140214595:     	xorl	%eax, %eax
140214597:     	testb	%sil, %sil
14021459a:     	jne	0x1402145a8 <.text+0x2135a8>
14021459c:     	movq	0x58(%rbx), %rcx
1402145a0:     	pxor	%xmm0, %xmm0
1402145a4:     	je	0x1402145b5 <.text+0x2135b5>
1402145a6:     	jmp	0x1402145bd <.text+0x2135bd>
1402145a8:     	leaq	0x572b031(%rip), %rcx   # 0x14593f5e0
1402145af:     	pxor	%xmm0, %xmm0
1402145b3:     	jne	0x1402145bd <.text+0x2135bd>
1402145b5:     	movd	0x56d6ecb(%rip), %xmm0  # 0x1458eb488
1402145bd:     	movups	(%rcx), %xmm1
1402145c0:     	movaps	%xmm1, -0x30(%rbp)
1402145c4:     	je	0x1402145d3 <.text+0x2135d3>
1402145c6:     	movq	0x58(%rbx), %rcx
1402145ca:     	movl	(%rcx), %eax
1402145cc:     	movdqu	0x4(%rcx), %xmm1
1402145d1:     	jmp	0x1402145db <.text+0x2135db>
1402145d3:     	movdqa	0x56e8565(%rip), %xmm1  # 0x1458fcb40
1402145db:     	movaps	0xe0(%rbp), %xmm2
1402145e2:     	movups	%xmm2, 0x608(%rbp)
1402145e9:     	movaps	0xd0(%rbp), %xmm2
1402145f0:     	movups	%xmm2, 0x5f8(%rbp)
1402145f7:     	movaps	0x90(%rbp), %xmm2
1402145fe:     	movaps	0xa0(%rbp), %xmm3
140214605:     	movdqa	0xb0(%rbp), %xmm4
14021460d:     	movdqa	0xc0(%rbp), %xmm5
140214615:     	movdqu	%xmm5, 0x5e8(%rbp)
14021461d:     	movdqu	%xmm4, 0x5d8(%rbp)
140214625:     	movups	%xmm3, 0x5c8(%rbp)
14021462c:     	movups	%xmm2, 0x5b8(%rbp)
140214633:     	xorps	%xmm2, %xmm2
140214636:     	movups	%xmm2, 0x638(%rbp)
14021463d:     	movups	%xmm2, 0x648(%rbp)
140214644:     	movups	%xmm2, 0x658(%rbp)
14021464b:     	movq	$0x0, 0x668(%rbp)
140214656:     	movl	$0x0, 0x730(%rbp)
140214660:     	movw	$0x0, 0x734(%rbp)
140214669:     	movdqa	-0x30(%rbp), %xmm3
14021466e:     	movdqu	%xmm3, 0x738(%rbp)
140214676:     	movdqu	%xmm3, 0x74c(%rbp)
14021467e:     	movdqu	%xmm3, 0x760(%rbp)
140214686:     	movdqu	%xmm3, 0x774(%rbp)
14021468e:     	movups	%xmm2, 0x618(%rbp)
140214695:     	movaps	0x5729d04(%rip), %xmm2  # 0x14593e3a0
14021469c:     	movups	%xmm2, 0x628(%rbp)
1402146a3:     	movups	%xmm14, 0x670(%rbp)
1402146ab:     	movdqu	%xmm13, 0x680(%rbp)
1402146b4:     	movaps	0x56e4775(%rip), %xmm2  # 0x1458f8e30
1402146bb:     	movups	%xmm2, 0x690(%rbp)
1402146c2:     	movaps	0x56e8327(%rip), %xmm2  # 0x1458fc9f0
1402146c9:     	movups	%xmm2, 0x6a0(%rbp)
1402146d0:     	movdqu	%xmm7, 0x6b0(%rbp)
1402146d8:     	movdqu	%xmm7, 0x6c0(%rbp)
1402146e0:     	movdqa	0x56f66b8(%rip), %xmm2  # 0x14590ada0
1402146e8:     	movdqu	%xmm2, 0x6d0(%rbp)
1402146f0:     	movdqu	%xmm2, 0x6e0(%rbp)
1402146f8:     	movdqu	%xmm6, 0x6f0(%rbp)
140214700:     	movl	$0x1, 0x700(%rbp)
14021470a:     	movq	$0x0, 0x704(%rbp)
140214715:     	movb	$0x1, 0x70c(%rbp)
14021471c:     	movq	$0x0, 0x710(%rbp)
140214727:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
140214731:     	movw	$0x0, 0x71c(%rbp)
14021473a:     	movw	$0x0, 0x722(%rbp)
140214743:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
14021474d:     	movw	$0x0, 0x728(%rbp)
140214756:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
140214760:     	movw	$0x100, 0x72a(%rbp)     # imm = 0x100
140214769:     	movl	$0x0, 0x72c(%rbp)
140214773:     	movd	%xmm0, 0x748(%rbp)
14021477b:     	movd	%xmm0, 0x75c(%rbp)
140214783:     	movd	%xmm0, 0x770(%rbp)
14021478b:     	movd	%xmm0, 0x784(%rbp)
140214793:     	movl	%eax, 0x788(%rbp)
140214799:     	movdqu	%xmm1, 0x78c(%rbp)
1402147a1:     	movq	%r12, 0x5b0(%rbp)
1402147a8:     	leaq	0x340(%rbp), %rcx
1402147af:     	leaq	0x5b0(%rbp), %r8
1402147b6:     	movq	%r14, %rdx
1402147b9:     	callq	0x1401e4670 <.text+0x1e3670>
1402147be:     	leaq	0x520(%rbp), %rcx
1402147c5:     	movq	%r15, %rdx
1402147c8:     	callq	0x14570c440 <.text+0x570b440>
1402147cd:     	cmpb	$0x1, (%rdi)
1402147d0:     	jne	0x1402147f0 <.text+0x2137f0>
1402147d2:     	movl	0x1(%rdi), %eax
1402147d5:     	movl	0x4(%rdi), %ecx
1402147d8:     	movl	%ecx, 0x5b3(%rbp)
1402147de:     	movl	%eax, 0x5b0(%rbp)
1402147e4:     	leaq	0x8(%rdi), %rdx
1402147e8:     	movzbl	0x10(%rdi), %eax
1402147ec:     	movb	$0x1, %cl
1402147ee:     	jmp	0x140214804 <.text+0x213804>
1402147f0:     	movq	0x8(%rdi), %rax
1402147f4:     	lock
1402147f5:     	incq	(%rax)
1402147f8:     	jle	0x1402167c3 <.text+0x2157c3>
1402147fe:     	leaq	0x8(%rdi), %rdx
140214802:     	xorl	%ecx, %ecx
140214804:     	movq	(%rdx), %rdx
140214807:     	movb	$0x1, 0xa8(%rbp)
14021480e:     	movups	0x572a92f(%rip), %xmm0  # 0x14593f144
140214815:     	movups	%xmm0, 0xa9(%rbp)
14021481c:     	movl	$0x41a00000, 0xc0(%rbp) # imm = 0x41A00000
140214826:     	movw	$0x190, 0xc4(%rbp)      # imm = 0x190
14021482f:     	movb	$0x1, 0xc6(%rbp)
140214836:     	movq	$0x0, 0x90(%rbp)
140214841:     	movq	$0x4, 0x98(%rbp)
14021484c:     	movq	$0x0, 0xa0(%rbp)
140214857:     	movl	0x5b0(%rbp), %r8d
14021485e:     	movl	0x5b3(%rbp), %r9d
140214865:     	movl	%r8d, 0x4f0(%rbp)
14021486c:     	movl	%r9d, 0x4f3(%rbp)
140214873:     	testb	%sil, %sil
140214876:     	je	0x140214892 <.text+0x213892>
140214878:     	movups	0x572a8d9(%rip), %xmm0  # 0x14593f158
14021487f:     	movaps	%xmm0, 0x840(%rbp)
140214886:     	movl	$0x3f800000, 0x850(%rbp) # imm = 0x3F800000
140214890:     	jmp	0x1402148ac <.text+0x2138ac>
140214892:     	movq	0x58(%rbx), %r8
140214896:     	movl	0x10(%r8), %r9d
14021489a:     	movl	%r9d, 0x850(%rbp)
1402148a1:     	movups	(%r8), %xmm0
1402148a5:     	movaps	%xmm0, 0x840(%rbp)
1402148ac:     	movl	0x850(%rbp), %r8d
1402148b3:     	movl	%r8d, 0x610(%rbp)
1402148ba:     	movaps	0x840(%rbp), %xmm0
1402148c1:     	movaps	%xmm0, 0x600(%rbp)
1402148c8:     	movups	0x520(%rbp), %xmm0
1402148cf:     	movaps	%xmm0, 0x5b0(%rbp)
1402148d6:     	movq	0x530(%rbp), %r8
1402148dd:     	movq	%r8, 0x5c0(%rbp)
1402148e4:     	movdqu	0x90(%rbp), %xmm0
1402148ec:     	movdqu	%xmm0, 0x5c8(%rbp)
1402148f4:     	movq	0xa0(%rbp), %r8
1402148fb:     	movq	%r8, 0x5d8(%rbp)
140214902:     	movb	%cl, 0x5e0(%rbp)
140214908:     	movl	0x4f0(%rbp), %ecx
14021490e:     	movl	0x4f3(%rbp), %r8d
140214915:     	movl	%ecx, 0x5e1(%rbp)
14021491b:     	movl	%r8d, 0x5e4(%rbp)
140214922:     	movq	%rdx, 0x5e8(%rbp)
140214929:     	movq	%rax, 0x5f0(%rbp)
140214930:     	movl	$0x41300000, 0x5f8(%rbp) # imm = 0x41300000
14021493a:     	movw	$0x190, 0x5fc(%rbp)     # imm = 0x190
140214943:     	movb	$0x1, 0x5fe(%rbp)
14021494a:     	leaq	0x340(%rbp), %rcx
140214951:     	leaq	0x5b0(%rbp), %rdx
140214958:     	callq	0x1401fdd70 <.text+0x1fcd70>
14021495d:     	nop
14021495e:     	cmpb	$0x0, 0xa8(%rbp)
140214965:     	jne	0x140214980 <.text+0x213980>
140214967:     	movq	0xb0(%rbp), %rax
14021496e:     	lock
14021496f:     	decq	(%rax)
140214972:     	jne	0x140214980 <.text+0x213980>
140214974:     	leaq	0xb0(%rbp), %rcx
14021497b:     	callq	0x1449886d0 <.text+0x49876d0>
140214980:     	pxor	%xmm13, %xmm13
140214985:     	movdqu	%xmm13, 0x630(%rbp)
14021498e:     	movdqu	%xmm13, 0x620(%rbp)
140214997:     	movdqu	%xmm13, 0x650(%rbp)
1402149a0:     	movdqu	%xmm13, 0x660(%rbp)
1402149a9:     	movaps	%xmm9, 0x90(%rbp)
1402149b1:     	movq	$0x0, 0xa0(%rbp)
1402149bc:     	movups	%xmm11, 0xa8(%rbp)
1402149c4:     	movq	$0x0, 0xb8(%rbp)
1402149cf:     	movaps	%xmm10, 0xc0(%rbp)
1402149d7:     	movq	$0x0, 0xd0(%rbp)
1402149e2:     	movups	%xmm12, 0xd8(%rbp)
1402149ea:     	movq	$0x0, 0xe8(%rbp)
1402149f5:     	movq	0xe0(%rbp), %rax
1402149fc:     	movq	%rax, 0x608(%rbp)
140214a03:     	movq	0xe8(%rbp), %rax
140214a0a:     	movq	%rax, 0x610(%rbp)
140214a11:     	movq	0xd0(%rbp), %rax
140214a18:     	movq	%rax, 0x5f8(%rbp)
140214a1f:     	movq	0xd8(%rbp), %rax
140214a26:     	movq	%rax, 0x600(%rbp)
140214a2d:     	movups	%xmm10, 0x5e8(%rbp)
140214a35:     	movq	0xb0(%rbp), %rax
140214a3c:     	movq	%rax, 0x5d8(%rbp)
140214a43:     	movq	0xb8(%rbp), %rax
140214a4a:     	movq	%rax, 0x5e0(%rbp)
140214a51:     	movaps	0xa0(%rbp), %xmm0
140214a58:     	movups	%xmm0, 0x5c8(%rbp)
140214a5f:     	movups	%xmm9, 0x5b8(%rbp)
140214a67:     	movq	$0x0, 0x618(%rbp)
140214a72:     	movaps	0x5729937(%rip), %xmm0  # 0x14593e3b0
140214a79:     	movups	%xmm0, 0x640(%rbp)
140214a80:     	movaps	0x56e8059(%rip), %xmm0  # 0x1458fcae0
140214a87:     	movups	%xmm0, 0x670(%rbp)
140214a8e:     	movaps	0x572992b(%rip), %xmm0  # 0x14593e3c0
140214a95:     	movups	%xmm0, 0x680(%rbp)
140214a9c:     	movups	%xmm15, 0x6a0(%rbp)
140214aa4:     	movdqu	%xmm8, 0x690(%rbp)
140214aad:     	movups	0x572a4d4(%rip), %xmm7  # 0x14593ef88
140214ab4:     	movups	%xmm7, 0x6c0(%rbp)
140214abb:     	movups	0x572a4b5(%rip), %xmm12 # 0x14593ef78
140214ac3:     	movups	%xmm12, 0x6b0(%rbp)
140214acb:     	movdqu	0x572a4d4(%rip), %xmm11 # 0x14593efa8
140214ad4:     	movdqu	%xmm11, 0x6e0(%rbp)
140214add:     	movaps	%xmm15, %xmm6
140214ae1:     	movups	0x572a4af(%rip), %xmm15 # 0x14593ef98
140214ae9:     	movups	%xmm15, 0x6d0(%rbp)
140214af1:     	movaps	0x56d69b8(%rip), %xmm0  # 0x1458eb4b0
140214af8:     	movups	%xmm0, 0x6f0(%rbp)
140214aff:     	movl	$0x1, 0x700(%rbp)
140214b09:     	movq	$0x0, 0x704(%rbp)
140214b14:     	movb	$0x1, 0x70c(%rbp)
140214b1b:     	movq	$0x0, 0x710(%rbp)
140214b26:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
140214b30:     	movw	$0x0, 0x71c(%rbp)
140214b39:     	movw	$0x0, 0x722(%rbp)
140214b42:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
140214b4c:     	movw	$0x0, 0x728(%rbp)
140214b55:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
140214b5f:     	movq	$0x0, 0x72a(%rbp)
140214b6a:     	movl	$0x5000005, 0x732(%rbp) # imm = 0x5000005
140214b74:     	movq	%r12, 0x5b0(%rbp)
140214b7b:     	leaq	0x4f0(%rbp), %rcx
140214b82:     	leaq	0x5b0(%rbp), %r8
140214b89:     	movq	%r14, %rdx
140214b8c:     	callq	0x1401e3e60 <.text+0x1e2e60>
140214b91:     	movq	0x48(%rbx), %rsi
140214b95:     	movq	0x58(%rbx), %r14
140214b99:     	movq	0x60(%rbx), %rax
140214b9d:     	movq	%rax, 0x4c0(%rbp)
140214ba4:     	movq	0x4f0(%rbp), %r15
140214bab:     	movq	0x518(%rbp), %rax
140214bb2:     	movq	%r15, 0x840(%rbp)
140214bb9:     	movups	0x4f8(%rbp), %xmm0
140214bc0:     	movups	%xmm0, 0x848(%rbp)
140214bc7:     	movups	0x508(%rbp), %xmm0
140214bce:     	movups	%xmm0, 0x858(%rbp)
140214bd5:     	movq	%rax, 0x868(%rbp)
140214bdc:     	movw	$0x0, 0x1f4(%rbp)
140214be5:     	movb	$0x1, 0x1e4(%rbp)
140214bec:     	movdqu	%xmm13, 0xf8(%rbp)
140214bf5:     	movdqu	%xmm13, 0x108(%rbp)
140214bfe:     	movaps	0x57297cb(%rip), %xmm0  # 0x14593e3d0
140214c05:     	movups	%xmm0, 0x118(%rbp)
140214c0c:     	movq	$0x0, 0xf0(%rbp)
140214c17:     	movdqu	%xmm13, 0x128(%rbp)
140214c20:     	movdqu	%xmm13, 0x138(%rbp)
140214c29:     	movl	$0x0, 0x208(%rbp)
140214c33:     	movw	$0x0, 0x20c(%rbp)
140214c3c:     	movups	%xmm14, 0x148(%rbp)
140214c44:     	movdqu	0x572a2fc(%rip), %xmm0  # 0x14593ef48
140214c4c:     	movdqu	%xmm0, 0x158(%rbp)
140214c54:     	movdqu	%xmm8, 0x168(%rbp)
140214c5d:     	movups	%xmm6, 0x178(%rbp)
140214c64:     	movdqa	0x56d6844(%rip), %xmm6  # 0x1458eb4b0
140214c6c:     	movups	%xmm7, 0x198(%rbp)
140214c73:     	movdqa	%xmm11, %xmm7
140214c78:     	movups	0x572a218(%rip), %xmm11 # 0x14593ee98
140214c80:     	movups	%xmm12, 0x188(%rbp)
140214c88:     	movups	0x572a238(%rip), %xmm12 # 0x14593eec8
140214c90:     	movdqu	%xmm7, 0x1b8(%rbp)
140214c98:     	movups	%xmm15, 0x1a8(%rbp)
140214ca0:     	movb	$0x0, 0x206(%rbp)
140214ca7:     	movl	$0x100, 0x202(%rbp)     # imm = 0x100
140214cb1:     	movq	$0x0, 0x1e8(%rbp)
140214cbc:     	movl	$0x3f800000, 0x1f0(%rbp) # imm = 0x3F800000
140214cc6:     	movdqu	%xmm6, 0x1c8(%rbp)
140214cce:     	movl	$0x1, 0x1d8(%rbp)
140214cd8:     	movq	$0x0, 0x1dc(%rbp)
140214ce3:     	movb	$0x0, 0x207(%rbp)
140214cea:     	movaps	%xmm9, 0x90(%rbp)
140214cf2:     	movq	$0x0, 0xa0(%rbp)
140214cfd:     	movups	%xmm11, 0xa8(%rbp)
140214d05:     	movq	$0x0, 0xb8(%rbp)
140214d10:     	movaps	%xmm10, 0xc0(%rbp)
140214d18:     	movq	$0x0, 0xd0(%rbp)
140214d23:     	movups	%xmm12, 0xd8(%rbp)
140214d2b:     	movq	$0x0, 0xe8(%rbp)
140214d36:     	movw	$0x0, 0x1fa(%rbp)
140214d3f:     	movl	$0x10000, 0x1f6(%rbp)   # imm = 0x10000
140214d49:     	movw	$0x0, 0x200(%rbp)
140214d52:     	movl	$0x10000, 0x1fc(%rbp)   # imm = 0x10000
140214d5c:     	callq	0x140002200 <.text+0x1200>
140214d61:     	movl	$0x40, %ecx
140214d66:     	movl	$0x4, %edx
140214d6b:     	callq	0x1400021c0 <.text+0x11c0>
140214d70:     	testq	%rax, %rax
140214d73:     	je	0x1402167a1 <.text+0x2157a1>
140214d79:     	movq	%rax, 0x870(%rbp)
140214d80:     	movups	(%r14), %xmm0
140214d84:     	movaps	%xmm0, 0x580(%rbp)
140214d8b:     	movl	0x10(%r14), %eax
140214d8f:     	movl	%eax, 0x590(%rbp)
140214d95:     	movdqu	(%r14), %xmm0
140214d9a:     	movdqa	%xmm0, 0x5b0(%rbp)
140214da2:     	movl	$0x3ed70a3d, 0x5c0(%rbp) # imm = 0x3ED70A3D
140214dac:     	leaq	0x340(%rbp), %rcx
140214db3:     	leaq	0x5b0(%rbp), %rdx
140214dba:     	callq	0x144c79aa0 <.text+0x4c78aa0>
140214dbf:     	nop
140214dc0:     	movdqa	0x340(%rbp), %xmm13
140214dc9:     	movdqu	0x572a80f(%rip), %xmm0  # 0x14593f5e0
140214dd1:     	movdqa	%xmm0, 0x5b0(%rbp)
140214dd9:     	movl	$0x0, 0x5c0(%rbp)
140214de3:     	leaq	0x340(%rbp), %rcx
140214dea:     	leaq	0x5b0(%rbp), %rdx
140214df1:     	callq	0x144c79aa0 <.text+0x4c78aa0>
140214df6:     	nop
140214df7:     	movdqa	0x340(%rbp), %xmm0
140214dff:     	movq	0x870(%rbp), %r12
140214e06:     	movq	$0x2, (%r12)
140214e0e:     	movl	$0x1, 0x8(%r12)
140214e17:     	movdqu	%xmm13, 0xc(%r12)
140214e1e:     	movdqa	0x56e7bfa(%rip), %xmm1  # 0x1458fca20
140214e26:     	movdqu	%xmm1, 0x1c(%r12)
140214e2d:     	movdqu	%xmm0, 0x2c(%r12)
140214e34:     	movl	$0x3f000000, 0x3c(%r12) # imm = 0x3F000000
140214e3d:     	callq	0x140002200 <.text+0x1200>
140214e42:     	movl	$0x48, %ecx
140214e47:     	movl	$0x8, %edx
140214e4c:     	callq	0x1400021c0 <.text+0x11c0>
140214e51:     	testq	%rax, %rax
140214e54:     	movaps	0x56e7c84(%rip), %xmm14 # 0x1458fcae0
140214e5c:     	movups	0x572a104(%rip), %xmm15 # 0x14593ef68
140214e64:     	movdqu	0x572a0eb(%rip), %xmm8  # 0x14593ef58
140214e6d:     	je	0x1402167b3 <.text+0x2157b3>
140214e73:     	movq	%rax, %r13
140214e76:     	leaq	0x848(%rbp), %rax
140214e7d:     	movq	$0x2, (%r13)
140214e85:     	movq	%r12, 0x8(%r13)
140214e89:     	movq	%rax, %r12
140214e8c:     	movq	$0x2, 0x10(%r13)
140214e94:     	movups	0x572a9b5(%rip), %xmm0  # 0x14593f850
140214e9b:     	movups	%xmm0, 0x18(%r13)
140214ea0:     	movq	$0x0, 0x28(%r13)
140214ea8:     	movl	$0x7, 0x30(%r13)
140214eb0:     	movb	$0x0, 0x40(%r13)
140214eb5:     	leaq	0x5b8(%rbp), %rcx
140214ebc:     	leaq	0x90(%rbp), %rdx
140214ec3:     	movl	$0x180, %r8d            # imm = 0x180
140214ec9:     	callq	0x145756ddd <.text+0x5755ddd>
140214ece:     	movq	$0x1, 0x738(%rbp)
140214ed9:     	movq	%r13, 0x740(%rbp)
140214ee0:     	movq	$0x1, 0x748(%rbp)
140214eeb:     	movups	0x572a386(%rip), %xmm0  # 0x14593f278
140214ef2:     	movups	%xmm0, 0x750(%rbp)
140214ef9:     	movups	0x572a388(%rip), %xmm0  # 0x14593f288
140214f00:     	movups	%xmm0, 0x760(%rbp)
140214f07:     	movq	%r15, 0x5b0(%rbp)
140214f0e:     	leaq	0x90(%rbp), %rcx
140214f15:     	leaq	0x5b0(%rbp), %r8
140214f1c:     	movq	%r12, %rdx
140214f1f:     	callq	0x1401ec380 <.text+0x1eb380>
140214f24:     	movw	$0x0, 0x714(%rbp)
140214f2d:     	movb	$0x1, 0x704(%rbp)
140214f34:     	xorps	%xmm0, %xmm0
140214f37:     	movups	%xmm0, 0x618(%rbp)
140214f3e:     	movups	%xmm0, 0x628(%rbp)
140214f45:     	movaps	0x5729494(%rip), %xmm1  # 0x14593e3e0
140214f4c:     	movups	%xmm1, 0x638(%rbp)
140214f53:     	movq	$0x0, 0x610(%rbp)
140214f5e:     	movups	%xmm0, 0x648(%rbp)
140214f65:     	movups	%xmm0, 0x658(%rbp)
140214f6c:     	movl	$0x0, 0x728(%rbp)
140214f76:     	movw	$0x0, 0x72c(%rbp)
140214f7f:     	movups	0x5729fb2(%rip), %xmm0  # 0x14593ef38
140214f86:     	movups	%xmm0, 0x668(%rbp)
140214f8d:     	movups	0x5729fb4(%rip), %xmm0  # 0x14593ef48
140214f94:     	movups	%xmm0, 0x678(%rbp)
140214f9b:     	movdqu	%xmm8, 0x688(%rbp)
140214fa4:     	movups	%xmm15, 0x698(%rbp)
140214fac:     	movaps	0x56e7a3d(%rip), %xmm0  # 0x1458fc9f0
140214fb3:     	movups	%xmm0, 0x6a8(%rbp)
140214fba:     	movups	%xmm0, 0x6b8(%rbp)
140214fc1:     	movaps	0x56d6318(%rip), %xmm0  # 0x1458eb2e0
140214fc8:     	movups	%xmm0, 0x6c8(%rbp)
140214fcf:     	movups	%xmm0, 0x6d8(%rbp)
140214fd6:     	movb	$0x0, 0x726(%rbp)
140214fdd:     	movl	$0x0, 0x722(%rbp)
140214fe7:     	movq	$0x0, 0x708(%rbp)
140214ff2:     	movl	$0x3f800000, 0x710(%rbp) # imm = 0x3F800000
140214ffc:     	movdqu	%xmm6, 0x6e8(%rbp)
140215004:     	movl	$0x1, 0x6f8(%rbp)
14021500e:     	movq	$0x0, 0x6fc(%rbp)
140215019:     	movb	$0x0, 0x727(%rbp)
140215020:     	movaps	%xmm9, 0x5b0(%rbp)
140215028:     	movq	$0x0, 0x5c0(%rbp)
140215033:     	movups	%xmm11, 0x5c8(%rbp)
14021503b:     	movq	$0x0, 0x5d8(%rbp)
140215046:     	movaps	%xmm10, 0x5e0(%rbp)
14021504e:     	movq	$0x0, 0x5f0(%rbp)
140215059:     	movups	%xmm12, 0x5f8(%rbp)
140215061:     	movq	$0x0, 0x608(%rbp)
14021506c:     	movw	$0x0, 0x71a(%rbp)
140215075:     	movl	$0x10000, 0x716(%rbp)   # imm = 0x10000
14021507f:     	movw	$0x0, 0x720(%rbp)
140215088:     	movl	$0x10000, 0x71c(%rbp)   # imm = 0x10000
140215092:     	movl	0x590(%rbp), %eax
140215098:     	movl	%eax, 0x530(%rbp)
14021509e:     	movaps	0x580(%rbp), %xmm0
1402150a5:     	movaps	%xmm0, 0x520(%rbp)
1402150ac:     	movaps	0x580(%rbp), %xmm0
1402150b3:     	movups	%xmm0, 0x534(%rbp)
1402150ba:     	movl	0x590(%rbp), %eax
1402150c0:     	movl	%eax, 0x544(%rbp)
1402150c6:     	movaps	0x580(%rbp), %xmm0
1402150cd:     	movups	%xmm0, 0x548(%rbp)
1402150d4:     	movl	0x590(%rbp), %eax
1402150da:     	movl	%eax, 0x558(%rbp)
1402150e0:     	movaps	0x580(%rbp), %xmm0
1402150e7:     	movups	%xmm0, 0x55c(%rbp)
1402150ee:     	movl	0x590(%rbp), %eax
1402150f4:     	movl	%eax, 0x56c(%rbp)
1402150fa:     	movq	0x8(%rsi), %r8
1402150fe:     	movq	0x10(%rsi), %r9
140215102:     	leaq	0x90(%rbp), %rcx
140215109:     	movq	0x4c0(%rbp), %rdx
140215110:     	callq	0x1400c7c50 <.text+0xc6c50>
140215115:     	nop
140215116:     	leaq	0x340(%rbp), %rcx
14021511d:     	leaq	0x90(%rbp), %rdx
140215124:     	callq	0x1426f00c0 <.text+0x26ef0c0>
140215129:     	nop
14021512a:     	movaps	0x580(%rbp), %xmm0
140215131:     	movaps	%xmm0, -0x20(%rbp)
140215135:     	movl	$0x3f0ccccd, -0x10(%rbp) # imm = 0x3F0CCCCD
14021513c:     	leaq	0x4d0(%rbp), %rcx
140215143:     	leaq	-0x20(%rbp), %rdx
140215147:     	callq	0x144c79aa0 <.text+0x4c78aa0>
14021514c:     	nop
14021514d:     	movq	0x56e3dba(%rip), %xmm13 # 0x1458f8f10
140215156:     	movaps	0x4d0(%rbp), %xmm0
14021515d:     	movups	%xmm0, 0x94(%rbp)
140215164:     	movl	$0x1, 0x90(%rbp)
14021516e:     	movl	$0x41900000, 0x48(%rsp) # imm = 0x41900000
140215176:     	movl	$0x1, 0x40(%rsp)
14021517e:     	movl	$0x3f800000, 0x38(%rsp) # imm = 0x3F800000
140215186:     	movl	$0x1, 0x30(%rsp)
14021518e:     	movl	$0x0, 0x28(%rsp)
140215196:     	movl	$0x1, 0x20(%rsp)
14021519e:     	leaq	0x4d0(%rbp), %rcx
1402151a5:     	leaq	0x90(%rbp), %rdx
1402151ac:     	pxor	%xmm3, %xmm3
1402151b0:     	movl	$0x1, %r8d
1402151b6:     	callq	0x14264cf40 <.text+0x264bf40>
1402151bb:     	nop
1402151bc:     	leaq	0x90(%rbp), %r13
1402151c3:     	leaq	0x5b0(%rbp), %rdx
1402151ca:     	movl	$0x180, %r8d            # imm = 0x180
1402151d0:     	movq	%r13, %rcx
1402151d3:     	callq	0x145756ddd <.text+0x5755ddd>
1402151d8:     	movaps	0x520(%rbp), %xmm0
1402151df:     	movdqa	0x530(%rbp), %xmm1
1402151e7:     	movdqa	0x540(%rbp), %xmm2
1402151ef:     	movdqa	0x550(%rbp), %xmm3
1402151f7:     	movups	%xmm0, 0x298(%rbp)
1402151fe:     	movdqu	%xmm1, 0x2a8(%rbp)
140215206:     	movdqu	%xmm2, 0x2b8(%rbp)
14021520e:     	movdqu	%xmm3, 0x2c8(%rbp)
140215216:     	movaps	0x560(%rbp), %xmm0
14021521d:     	movups	%xmm0, 0x2d8(%rbp)
140215224:     	movups	0x5729f2d(%rip), %xmm0  # 0x14593f158
14021522b:     	movups	%xmm0, 0x2e8(%rbp)
140215232:     	movl	$0x3f800000, 0x2f8(%rbp) # imm = 0x3F800000
14021523c:     	leaq	0x210(%rbp), %rcx
140215243:     	leaq	0x340(%rbp), %rdx
14021524a:     	movl	$0x88, %r8d
140215250:     	callq	0x145756ddd <.text+0x5755ddd>
140215255:     	movups	0x4d0(%rbp), %xmm0
14021525c:     	movups	%xmm0, 0x300(%rbp)
140215263:     	movq	0x4e0(%rbp), %rax
14021526a:     	movq	%rax, 0x310(%rbp)
140215271:     	leaq	0x5b8(%rbp), %rcx
140215278:     	movl	$0x288, %r8d            # imm = 0x288
14021527e:     	movq	%r13, %rdx
140215281:     	callq	0x145756ddd <.text+0x5755ddd>
140215286:     	movq	%r15, 0x5b0(%rbp)
14021528d:     	leaq	0x340(%rbp), %rcx
140215294:     	leaq	0x5b0(%rbp), %r8
14021529b:     	movq	%r12, %rdx
14021529e:     	callq	0x1401e4ea0 <.text+0x1e3ea0>
1402152a3:     	movw	$0x0, 0x4a4(%rbp)
1402152ac:     	movb	$0x1, 0x494(%rbp)
1402152b3:     	xorps	%xmm0, %xmm0
1402152b6:     	movaps	%xmm0, 0x3a0(%rbp)
1402152bd:     	movaps	%xmm0, 0x3b0(%rbp)
1402152c4:     	movaps	%xmm0, 0x3c0(%rbp)
1402152cb:     	movaps	%xmm0, 0x3d0(%rbp)
1402152d2:     	movaps	%xmm0, 0x3e0(%rbp)
1402152d9:     	movq	$0x0, 0x3f0(%rbp)
1402152e4:     	movl	$0x0, 0x4b8(%rbp)
1402152ee:     	movw	$0x0, 0x4bc(%rbp)
1402152f7:     	movups	%xmm14, 0x3f8(%rbp)
1402152ff:     	movaps	0x57290ea(%rip), %xmm0  # 0x14593e3f0
140215306:     	movups	%xmm0, 0x408(%rbp)
14021530d:     	movdqu	%xmm8, 0x418(%rbp)
140215316:     	movups	%xmm15, 0x428(%rbp)
14021531e:     	movups	0x5729c53(%rip), %xmm0  # 0x14593ef78
140215325:     	movups	%xmm0, 0x438(%rbp)
14021532c:     	movups	0x5729c55(%rip), %xmm0  # 0x14593ef88
140215333:     	movups	%xmm0, 0x448(%rbp)
14021533a:     	movdqu	%xmm7, 0x468(%rbp)
140215342:     	movups	0x5729c4f(%rip), %xmm0  # 0x14593ef98
140215349:     	movups	%xmm0, 0x458(%rbp)
140215350:     	movb	$0x0, 0x4b6(%rbp)
140215357:     	movl	$0x0, 0x4b2(%rbp)
140215361:     	movq	$0x0, 0x498(%rbp)
14021536c:     	movl	$0x3f800000, 0x4a0(%rbp) # imm = 0x3F800000
140215376:     	movdqu	%xmm6, 0x478(%rbp)
14021537e:     	movl	$0x1, 0x488(%rbp)
140215388:     	movq	$0x0, 0x48c(%rbp)
140215393:     	movb	$0x0, 0x4b7(%rbp)
14021539a:     	movaps	%xmm9, 0x340(%rbp)
1402153a2:     	movq	$0x0, 0x350(%rbp)
1402153ad:     	movups	%xmm11, 0x358(%rbp)
1402153b5:     	movq	$0x0, 0x368(%rbp)
1402153c0:     	movaps	%xmm10, 0x370(%rbp)
1402153c8:     	movq	$0x0, 0x380(%rbp)
1402153d3:     	movups	%xmm12, 0x388(%rbp)
1402153db:     	movq	$0x0, 0x398(%rbp)
1402153e6:     	movw	$0x0, 0x4aa(%rbp)
1402153ef:     	movl	$0x10000, 0x4a6(%rbp)   # imm = 0x10000
1402153f9:     	movw	$0x0, 0x4b0(%rbp)
140215402:     	movl	$0x10000, 0x4ac(%rbp)   # imm = 0x10000
14021540c:     	movl	0x10(%r14), %eax
140215410:     	movl	%eax, 0x330(%rbp)
140215416:     	movdqu	(%r14), %xmm0
14021541b:     	movdqa	%xmm0, 0x320(%rbp)
140215423:     	movq	0x68(%rbx), %r8
140215427:     	leaq	0x572bce6(%rip), %rcx   # 0x145941114
14021542e:     	movl	$0xa, %edx
140215433:     	callq	0x142aed730 <.text+0x2aec730>
140215438:     	nop
140215439:     	testq	%rax, %rax
14021543c:     	movl	0x56e8499(%rip), %r13d  # 0x1458fd8dc
140215443:     	jne	0x14021544c <.text+0x21444c>
140215445:     	movq	0x77a736c(%rip), %rax   # 0x1479bc7b8
14021544c:     	movl	$0x1, %edx
140215451:     	cmpb	$0x3, (%rax)
140215454:     	jne	0x140215470 <.text+0x214470>
140215456:     	movq	0x18(%rax), %rdx
14021545a:     	testq	%rdx, %rdx
14021545d:     	jns	0x1402167ea <.text+0x2157ea>
140215463:     	xorl	%ecx, %ecx
140215465:     	callq	0x1458e721b <.text+0x58e621b>
14021546a:     	nop
14021546b:     	jmp	0x1402167c3 <.text+0x2157c3>
140215470:     	xorl	%r8d, %r8d
140215473:     	leaq	0x520(%rbp), %rcx
14021547a:     	movq	%rdx, 0x4c8(%rbp)
140215481:     	movq	%r8, 0x870(%rbp)
140215488:     	callq	0x1400c6cf0 <.text+0xc5cf0>
14021548d:     	nop
14021548e:     	cmpb	$0x1, (%rdi)
140215491:     	jne	0x1402154b3 <.text+0x2144b3>
140215493:     	movl	0x1(%rdi), %eax
140215496:     	movl	0x4(%rdi), %ecx
140215499:     	movl	%ecx, 0x4f3(%rbp)
14021549f:     	movl	%eax, 0x4f0(%rbp)
1402154a5:     	movq	0x8(%rdi), %rsi
1402154a9:     	movzbl	0x10(%rdi), %r12d
1402154ae:     	movb	$0x1, %r15b
1402154b1:     	jmp	0x1402154c4 <.text+0x2144c4>
1402154b3:     	movq	0x8(%rdi), %rsi
1402154b7:     	lock
1402154b8:     	incq	(%rsi)
1402154bb:     	jle	0x1402167c3 <.text+0x2157c3>
1402154c1:     	xorl	%r15d, %r15d
1402154c4:     	movq	0x530(%rbp), %rax
1402154cb:     	movq	%rax, 0x220(%rbp)
1402154d2:     	movups	0x520(%rbp), %xmm0
1402154d9:     	movups	%xmm0, 0x210(%rbp)
1402154e0:     	movl	0x4f0(%rbp), %eax
1402154e6:     	movl	0x4f3(%rbp), %ecx
1402154ec:     	movl	%ecx, 0x76c(%rbp)
1402154f2:     	movl	%eax, 0x769(%rbp)
1402154f8:     	movaps	0x320(%rbp), %xmm0
1402154ff:     	movups	%xmm0, 0x841(%rbp)
140215506:     	movl	0x330(%rbp), %eax
14021550c:     	movl	%eax, 0x851(%rbp)
140215512:     	leaq	0x90(%rbp), %r14
140215519:     	leaq	0x340(%rbp), %rdx
140215520:     	movl	$0x180, %r8d            # imm = 0x180
140215526:     	movq	%r14, %rcx
140215529:     	callq	0x145756ddd <.text+0x5755ddd>
14021552e:     	movups	0x840(%rbp), %xmm0
140215535:     	movups	%xmm0, 0x787(%rbp)
14021553c:     	movq	0x84d(%rbp), %rax
140215543:     	movq	%rax, 0x794(%rbp)
14021554a:     	leaq	0x5b8(%rbp), %rcx
140215551:     	movl	$0x198, %r8d            # imm = 0x198
140215557:     	movq	%r14, %rdx
14021555a:     	callq	0x145756ddd <.text+0x5755ddd>
14021555f:     	movq	$0x0, 0x750(%rbp)
14021556a:     	movq	$0x4, 0x758(%rbp)
140215575:     	movq	$0x0, 0x760(%rbp)
140215580:     	movb	%r15b, 0x768(%rbp)
140215587:     	movq	%rsi, 0x770(%rbp)
14021558e:     	movq	%r12, 0x778(%rbp)
140215595:     	movl	$0x41300000, 0x780(%rbp) # imm = 0x41300000
14021559f:     	movw	$0x190, 0x784(%rbp)     # imm = 0x190
1402155a8:     	movb	$0x1, 0x786(%rbp)
1402155af:     	movdqu	0x56e8315(%rip), %xmm0  # 0x1458fd8cc
1402155b7:     	movdqu	%xmm0, 0x79c(%rbp)
1402155bf:     	movl	%r13d, 0x7ac(%rbp)
1402155c6:     	movq	%xmm13, 0x7b0(%rbp)
1402155cf:     	movq	0x5a8(%rbp), %rax
1402155d6:     	movq	%rax, 0x5b0(%rbp)
1402155dd:     	leaq	0x340(%rbp), %rcx
1402155e4:     	leaq	0x5b0(%rbp), %r8
1402155eb:     	leaq	0x68(%rbp), %rdx
1402155ef:     	callq	0x1401e8000 <.text+0x1e7000>
1402155f4:     	nop
1402155f5:     	movq	0x870(%rbp), %rdx
1402155fc:     	testq	%rdx, %rdx
1402155ff:     	je	0x140215613 <.text+0x214613>
140215601:     	movl	$0x1, %r8d
140215607:     	movq	0x4c8(%rbp), %rcx
14021560e:     	callq	0x1400021d0 <.text+0x11d0>
140215613:     	movw	$0x0, 0x4a4(%rbp)
14021561c:     	movb	$0x1, 0x494(%rbp)
140215623:     	pxor	%xmm0, %xmm0
140215627:     	movdqa	%xmm0, 0x3a0(%rbp)
14021562f:     	movdqa	%xmm0, 0x3b0(%rbp)
140215637:     	movdqa	%xmm0, 0x3c0(%rbp)
14021563f:     	movdqa	%xmm0, 0x3d0(%rbp)
140215647:     	movdqa	%xmm0, 0x3e0(%rbp)
14021564f:     	movq	$0x0, 0x3f0(%rbp)
14021565a:     	movl	$0x0, 0x4b8(%rbp)
140215664:     	movw	$0x0, 0x4bc(%rbp)
14021566d:     	movaps	0x56e375c(%rip), %xmm0  # 0x1458f8dd0
140215674:     	movups	%xmm0, 0x3f8(%rbp)
14021567b:     	movups	%xmm14, 0x408(%rbp)
140215683:     	movdqu	%xmm8, 0x418(%rbp)
14021568c:     	movups	%xmm15, 0x428(%rbp)
140215694:     	movups	0x57298ed(%rip), %xmm0  # 0x14593ef88
14021569b:     	movups	%xmm0, 0x448(%rbp)
1402156a2:     	movups	0x57298cf(%rip), %xmm0  # 0x14593ef78
1402156a9:     	movups	%xmm0, 0x438(%rbp)
1402156b0:     	movdqu	%xmm7, 0x468(%rbp)
1402156b8:     	movdqu	0x57298d8(%rip), %xmm0  # 0x14593ef98
1402156c0:     	movdqu	%xmm0, 0x458(%rbp)
1402156c8:     	movb	$0x0, 0x4b6(%rbp)
1402156cf:     	movl	$0x0, 0x4b2(%rbp)
1402156d9:     	movq	$0x0, 0x498(%rbp)
1402156e4:     	movl	$0x3f800000, 0x4a0(%rbp) # imm = 0x3F800000
1402156ee:     	movdqu	%xmm6, 0x478(%rbp)
1402156f6:     	movl	$0x1, 0x488(%rbp)
140215700:     	movq	$0x0, 0x48c(%rbp)
14021570b:     	movb	$0x0, 0x4b7(%rbp)
140215712:     	movaps	%xmm9, 0x340(%rbp)
14021571a:     	movq	$0x0, 0x350(%rbp)
140215725:     	movups	%xmm11, 0x358(%rbp)
14021572d:     	movq	$0x0, 0x368(%rbp)
140215738:     	movaps	%xmm10, 0x370(%rbp)
140215740:     	movq	$0x0, 0x380(%rbp)
14021574b:     	movups	%xmm12, 0x388(%rbp)
140215753:     	movq	$0x0, 0x398(%rbp)
14021575e:     	movw	$0x0, 0x4aa(%rbp)
140215767:     	movl	$0x10000, 0x4a6(%rbp)   # imm = 0x10000
140215771:     	movw	$0x0, 0x4b0(%rbp)
14021577a:     	movl	$0x10000, 0x4ac(%rbp)   # imm = 0x10000
140215784:     	movq	0x20(%rbx), %rdx
140215788:     	leaq	0x520(%rbp), %rcx
14021578f:     	callq	0x14570c440 <.text+0x570b440>
140215794:     	nop
140215795:     	cmpb	$0x1, (%rdi)
140215798:     	jne	0x1402157ba <.text+0x2147ba>
14021579a:     	movl	0x1(%rdi), %eax
14021579d:     	movl	0x4(%rdi), %ecx
1402157a0:     	movl	%ecx, 0x4f3(%rbp)
1402157a6:     	movl	%eax, 0x4f0(%rbp)
1402157ac:     	movq	0x8(%rdi), %rsi
1402157b0:     	movzbl	0x10(%rdi), %r12d
1402157b5:     	movb	$0x1, %r15b
1402157b8:     	jmp	0x1402157cb <.text+0x2147cb>
1402157ba:     	movq	0x8(%rdi), %rsi
1402157be:     	lock
1402157bf:     	incq	(%rsi)
1402157c2:     	jle	0x1402167c3 <.text+0x2157c3>
1402157c8:     	xorl	%r15d, %r15d
1402157cb:     	movl	0x330(%rbp), %eax
1402157d1:     	movl	%eax, 0x851(%rbp)
1402157d7:     	movaps	0x320(%rbp), %xmm0
1402157de:     	movups	%xmm0, 0x841(%rbp)
1402157e5:     	movups	0x520(%rbp), %xmm0
1402157ec:     	movups	%xmm0, 0x210(%rbp)
1402157f3:     	movq	0x530(%rbp), %rax
1402157fa:     	movq	%rax, 0x220(%rbp)
140215801:     	movl	0x4f0(%rbp), %eax
140215807:     	movl	0x4f3(%rbp), %ecx
14021580d:     	movl	%ecx, 0x76c(%rbp)
140215813:     	movl	%eax, 0x769(%rbp)
140215819:     	movups	0x840(%rbp), %xmm0
140215820:     	movups	%xmm0, 0x787(%rbp)
140215827:     	movq	0x84d(%rbp), %rax
14021582e:     	movq	%rax, 0x794(%rbp)
140215835:     	leaq	0x340(%rbp), %rdx
14021583c:     	movl	$0x180, %r8d            # imm = 0x180
140215842:     	movq	%r14, %rcx
140215845:     	callq	0x145756ddd <.text+0x5755ddd>
14021584a:     	leaq	0x5b8(%rbp), %rcx
140215851:     	movl	$0x198, %r8d            # imm = 0x198
140215857:     	movq	%r14, %rdx
14021585a:     	callq	0x145756ddd <.text+0x5755ddd>
14021585f:     	movq	$0x0, 0x750(%rbp)
14021586a:     	movq	$0x4, 0x758(%rbp)
140215875:     	movq	$0x0, 0x760(%rbp)
140215880:     	movb	%r15b, 0x768(%rbp)
140215887:     	movq	%rsi, 0x770(%rbp)
14021588e:     	movq	%r12, 0x778(%rbp)
140215895:     	movl	$0x41a80000, 0x780(%rbp) # imm = 0x41A80000
14021589f:     	movw	$0x190, 0x784(%rbp)     # imm = 0x190
1402158a8:     	movb	$0x1, 0x786(%rbp)
1402158af:     	movdqu	0x56e8015(%rip), %xmm0  # 0x1458fd8cc
1402158b7:     	movdqu	%xmm0, 0x79c(%rbp)
1402158bf:     	movl	%r13d, 0x7ac(%rbp)
1402158c6:     	movq	%xmm13, 0x7b0(%rbp)
1402158cf:     	movw	$0x1, 0x7b8(%rbp)
1402158d8:     	movq	0x5a8(%rbp), %r14
1402158df:     	movq	%r14, 0x5b0(%rbp)
1402158e6:     	leaq	0x340(%rbp), %rcx
1402158ed:     	leaq	0x5b0(%rbp), %r8
1402158f4:     	leaq	0x68(%rbp), %rsi
1402158f8:     	movq	%rsi, %rdx
1402158fb:     	callq	0x1401e82e0 <.text+0x1e72e0>
140215900:     	movq	0x28(%rbx), %rdx
140215904:     	cmpq	$0x0, 0x10(%rdx)
140215909:     	je	0x140215a4f <.text+0x214a4f>
14021590f:     	leaq	0x90(%rbp), %rcx
140215916:     	callq	0x14570c440 <.text+0x570b440>
14021591b:     	cmpb	$0x1, (%rdi)
14021591e:     	jne	0x14021593e <.text+0x21493e>
140215920:     	movl	0x1(%rdi), %eax
140215923:     	movl	0x4(%rdi), %ecx
140215926:     	movl	%ecx, 0x523(%rbp)
14021592c:     	movl	%eax, 0x520(%rbp)
140215932:     	movq	0x8(%rdi), %rax
140215936:     	movzbl	0x10(%rdi), %edx
14021593a:     	movb	$0x1, %cl
14021593c:     	jmp	0x14021594e <.text+0x21494e>
14021593e:     	movq	0x8(%rdi), %rax
140215942:     	lock
140215943:     	incq	(%rax)
140215946:     	jle	0x1402167c3 <.text+0x2157c3>
14021594c:     	xorl	%ecx, %ecx
14021594e:     	movups	0x57294e7(%rip), %xmm0  # 0x14593ee3c
140215955:     	movups	%xmm0, 0x341(%rbp)
14021595c:     	movl	$0x3f800000, 0x351(%rbp) # imm = 0x3F800000
140215966:     	movq	0xa0(%rbp), %r8
14021596d:     	movq	%r8, 0x5c8(%rbp)
140215974:     	movups	0x90(%rbp), %xmm0
14021597b:     	movups	%xmm0, 0x5b8(%rbp)
140215982:     	movl	0x520(%rbp), %r8d
140215989:     	movl	0x523(%rbp), %r9d
140215990:     	movl	%r8d, 0x5e9(%rbp)
140215997:     	movl	%r9d, 0x5ec(%rbp)
14021599e:     	movups	0x340(%rbp), %xmm0
1402159a5:     	movups	%xmm0, 0x607(%rbp)
1402159ac:     	movq	0x34d(%rbp), %r8
1402159b3:     	movq	%r8, 0x614(%rbp)
1402159ba:     	movq	$0x0, 0x5d0(%rbp)
1402159c5:     	movq	$0x4, 0x5d8(%rbp)
1402159d0:     	movq	$0x0, 0x5e0(%rbp)
1402159db:     	movb	%cl, 0x5e8(%rbp)
1402159e1:     	movq	%rax, 0x5f0(%rbp)
1402159e8:     	movq	%rdx, 0x5f8(%rbp)
1402159ef:     	movl	$0x41500000, 0x600(%rbp) # imm = 0x41500000
1402159f9:     	movw	$0x190, 0x604(%rbp)     # imm = 0x190
140215a02:     	movb	$0x1, 0x606(%rbp)
140215a09:     	movl	%r13d, 0x62c(%rbp)
140215a10:     	movdqu	0x56e7eb4(%rip), %xmm0  # 0x1458fd8cc
140215a18:     	movdqu	%xmm0, 0x61c(%rbp)
140215a20:     	movq	%xmm13, 0x630(%rbp)
140215a29:     	movw	$0x1, 0x638(%rbp)
140215a32:     	movq	%r14, 0x5b0(%rbp)
140215a39:     	leaq	0x90(%rbp), %rcx
140215a40:     	leaq	0x5b0(%rbp), %r8
140215a47:     	movq	%rsi, %rdx
140215a4a:     	callq	0x1401f8270 <.text+0x1f7270>
140215a4f:     	movw	$0x0, 0x1f4(%rbp)
140215a58:     	movb	$0x1, 0x1e4(%rbp)
140215a5f:     	pxor	%xmm13, %xmm13
140215a64:     	movdqu	%xmm13, 0xf8(%rbp)
140215a6d:     	movdqu	%xmm13, 0x108(%rbp)
140215a76:     	movabsq	$0x428c000000000002, %rax # imm = 0x428C000000000002
140215a80:     	movq	%rax, 0x118(%rbp)
140215a87:     	movq	$0x0, 0xf0(%rbp)
140215a92:     	movdqa	%xmm13, 0x120(%rbp)
140215a9b:     	movdqa	%xmm13, 0x130(%rbp)
140215aa4:     	movq	$0x0, 0x140(%rbp)
140215aaf:     	movl	$0x0, 0x208(%rbp)
140215ab9:     	movw	$0x0, 0x20c(%rbp)
140215ac2:     	movups	%xmm14, 0x148(%rbp)
140215aca:     	movaps	0x56e34df(%rip), %xmm0  # 0x1458f8fb0
140215ad1:     	movups	%xmm0, 0x158(%rbp)
140215ad8:     	movdqu	%xmm8, 0x168(%rbp)
140215ae1:     	movups	%xmm15, 0x178(%rbp)
140215ae9:     	movups	0x5729497(%rip), %xmm15 # 0x14593ef88
140215af1:     	movups	%xmm15, 0x198(%rbp)
140215af9:     	movups	0x5729477(%rip), %xmm12 # 0x14593ef78
140215b01:     	movups	%xmm12, 0x188(%rbp)
140215b09:     	movdqu	0x5729486(%rip), %xmm8  # 0x14593ef98
140215b12:     	movdqu	%xmm8, 0x1a8(%rbp)
140215b1b:     	movdqu	%xmm7, 0x1b8(%rbp)
140215b23:     	movw	$0x0, 0x206(%rbp)
140215b2c:     	movl	$0x0, 0x202(%rbp)
140215b36:     	movq	$0x0, 0x1e8(%rbp)
140215b41:     	movl	$0x3f800000, 0x1f0(%rbp) # imm = 0x3F800000
140215b4b:     	movdqu	%xmm6, 0x1c8(%rbp)
140215b53:     	movl	$0x1, 0x1d8(%rbp)
140215b5d:     	movq	$0x0, 0x1dc(%rbp)
140215b68:     	movaps	%xmm9, 0x90(%rbp)
140215b70:     	movq	$0x0, 0xa0(%rbp)
140215b7b:     	movups	%xmm11, 0xa8(%rbp)
140215b83:     	movq	$0x0, 0xb8(%rbp)
140215b8e:     	movaps	%xmm10, 0xc0(%rbp)
140215b96:     	movq	$0x0, 0xd0(%rbp)
140215ba1:     	movups	0x5729320(%rip), %xmm6  # 0x14593eec8
140215ba8:     	movups	%xmm6, 0xd8(%rbp)
140215baf:     	movq	$0x0, 0xe8(%rbp)
140215bba:     	movw	$0x0, 0x1fa(%rbp)
140215bc3:     	movl	$0x10000, 0x1f6(%rbp)   # imm = 0x10000
140215bcd:     	movw	$0x0, 0x200(%rbp)
140215bd6:     	movl	$0x10000, 0x1fc(%rbp)   # imm = 0x10000
140215be0:     	movaps	0x320(%rbp), %xmm0
140215be7:     	movaps	%xmm0, 0x340(%rbp)
140215bee:     	movl	$0x3f333333, 0x350(%rbp) # imm = 0x3F333333
140215bf8:     	leaq	0x5b8(%rbp), %rcx
140215bff:     	leaq	0x90(%rbp), %rdx
140215c06:     	leaq	0x340(%rbp), %r8
140215c0d:     	callq	0x1400c7f20 <.text+0xc6f20>
140215c12:     	movq	%r14, 0x5b0(%rbp)
140215c19:     	leaq	0x90(%rbp), %rcx
140215c20:     	leaq	0x5b0(%rbp), %r8
140215c27:     	movq	%rsi, %rdx
140215c2a:     	callq	0x1401e7230 <.text+0x1e6230>
140215c2f:     	movdqa	%xmm13, 0x130(%rbp)
140215c38:     	movdqa	%xmm13, 0x120(%rbp)
140215c41:     	movdqa	%xmm13, 0x110(%rbp)
140215c4a:     	movdqa	%xmm13, 0x100(%rbp)
140215c53:     	movdqa	%xmm13, 0xf0(%rbp)
140215c5c:     	movq	0x56e32ab(%rip), %xmm13 # 0x1458f8f10
140215c65:     	movq	$0x0, 0x140(%rbp)
140215c70:     	movups	0x57292c1(%rip), %xmm0  # 0x14593ef38
140215c77:     	movups	%xmm0, 0x148(%rbp)
140215c7e:     	movups	0x57292c3(%rip), %xmm0  # 0x14593ef48
140215c85:     	movups	%xmm0, 0x158(%rbp)
140215c8c:     	movaps	%xmm9, 0x90(%rbp)
140215c94:     	movq	$0x0, 0xa0(%rbp)
140215c9f:     	movups	%xmm11, 0xa8(%rbp)
140215ca7:     	movq	$0x0, 0xb8(%rbp)
140215cb2:     	movaps	%xmm10, 0xc0(%rbp)
140215cba:     	movq	$0x0, 0xd0(%rbp)
140215cc5:     	movups	%xmm6, 0xd8(%rbp)
140215ccc:     	movq	$0x0, 0xe8(%rbp)
140215cd7:     	leaq	0x5b8(%rbp), %rcx
140215cde:     	leaq	0x90(%rbp), %rdx
140215ce5:     	movl	$0xd8, %r8d
140215ceb:     	callq	0x145756ddd <.text+0x5755ddd>
140215cf0:     	movaps	0x56d55d9(%rip), %xmm0  # 0x1458eb2d0
140215cf7:     	movups	%xmm0, 0x690(%rbp)
140215cfe:     	movdqa	0x56e307a(%rip), %xmm6  # 0x1458f8d80
140215d06:     	movdqu	%xmm6, 0x6a0(%rbp)
140215d0e:     	movups	%xmm12, 0x6b0(%rbp)
140215d16:     	movups	%xmm15, 0x6c0(%rbp)
140215d1e:     	movdqu	%xmm8, 0x6d0(%rbp)
140215d27:     	movdqu	%xmm7, 0x6e0(%rbp)
140215d2f:     	movaps	0x56e30ba(%rip), %xmm0  # 0x1458f8df0
140215d36:     	movups	%xmm0, 0x6f0(%rbp)
140215d3d:     	movl	$0x1, 0x700(%rbp)
140215d47:     	movq	$0x0, 0x704(%rbp)
140215d52:     	movb	$0x1, 0x70c(%rbp)
140215d59:     	movq	$0x0, 0x710(%rbp)
140215d64:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
140215d6e:     	movw	$0x0, 0x71c(%rbp)
140215d77:     	movw	$0x0, 0x722(%rbp)
140215d80:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
140215d8a:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
140215d94:     	movw	$0x0, 0x728(%rbp)
140215d9d:     	movl	$0x0, 0x72a(%rbp)
140215da7:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
140215db1:     	movq	%rax, 0x72e(%rbp)
140215db8:     	movq	%r14, 0x5b0(%rbp)
140215dbf:     	leaq	0x520(%rbp), %rcx
140215dc6:     	leaq	0x5b0(%rbp), %r8
140215dcd:     	movq	%rsi, %rdx
140215dd0:     	callq	0x1401e3e60 <.text+0x1e2e60>
140215dd5:     	movq	0x30(%rbx), %rdx
140215dd9:     	movq	0x38(%rbx), %rsi
140215ddd:     	movq	0x520(%rbp), %r14
140215de4:     	movq	0x548(%rbp), %rax
140215deb:     	movq	%r14, 0x340(%rbp)
140215df2:     	movups	0x528(%rbp), %xmm0
140215df9:     	movups	%xmm0, 0x348(%rbp)
140215e00:     	movdqu	0x538(%rbp), %xmm0
140215e08:     	movdqu	%xmm0, 0x358(%rbp)
140215e10:     	movq	%rax, 0x368(%rbp)
140215e17:     	cmpq	$0x0, 0x10(%rdx)
140215e1c:     	je	0x140215f69 <.text+0x214f69>
140215e22:     	leaq	0x90(%rbp), %rcx
140215e29:     	callq	0x14570c440 <.text+0x570b440>
140215e2e:     	cmpb	$0x1, (%rdi)
140215e31:     	jne	0x140215e52 <.text+0x214e52>
140215e33:     	movl	0x1(%rdi), %eax
140215e36:     	movl	0x4(%rdi), %ecx
140215e39:     	movl	%ecx, 0x5a3(%rbp)
140215e3f:     	movl	%eax, 0x5a0(%rbp)
140215e45:     	movq	0x8(%rdi), %rax
140215e49:     	movzbl	0x10(%rdi), %ecx
140215e4d:     	movb	$0x1, %r8b
140215e50:     	jmp	0x140215e63 <.text+0x214e63>
140215e52:     	movq	0x8(%rdi), %rax
140215e56:     	lock
140215e57:     	incq	(%rax)
140215e5a:     	jle	0x1402167c3 <.text+0x2157c3>
140215e60:     	xorl	%r8d, %r8d
140215e63:     	leaq	0x348(%rbp), %rdx
140215e6a:     	movq	0xa0(%rbp), %r9
140215e71:     	movq	%r9, 0x5c8(%rbp)
140215e78:     	movups	0x90(%rbp), %xmm0
140215e7f:     	movups	%xmm0, 0x5b8(%rbp)
140215e86:     	movups	0x57294bf(%rip), %xmm0  # 0x14593f34c
140215e8d:     	movups	%xmm0, 0x841(%rbp)
140215e94:     	movl	$0x3f800000, 0x851(%rbp) # imm = 0x3F800000
140215e9e:     	movq	$0x0, 0x5d0(%rbp)
140215ea9:     	movq	$0x4, 0x5d8(%rbp)
140215eb4:     	movq	$0x0, 0x5e0(%rbp)
140215ebf:     	movb	%r8b, 0x5e8(%rbp)
140215ec6:     	movl	0x5a0(%rbp), %r8d
140215ecd:     	movl	0x5a3(%rbp), %r9d
140215ed4:     	movl	%r8d, 0x5e9(%rbp)
140215edb:     	movl	%r9d, 0x5ec(%rbp)
140215ee2:     	movq	%rax, 0x5f0(%rbp)
140215ee9:     	movq	%rcx, 0x5f8(%rbp)
140215ef0:     	movl	$0x41600000, 0x600(%rbp) # imm = 0x41600000
140215efa:     	movw	$0x190, 0x604(%rbp)     # imm = 0x190
140215f03:     	movb	$0x1, 0x606(%rbp)
140215f0a:     	movq	0x84d(%rbp), %rax
140215f11:     	movq	%rax, 0x614(%rbp)
140215f18:     	movups	0x840(%rbp), %xmm0
140215f1f:     	movups	%xmm0, 0x607(%rbp)
140215f26:     	movl	%r13d, 0x62c(%rbp)
140215f2d:     	movdqu	0x56e7997(%rip), %xmm0  # 0x1458fd8cc
140215f35:     	movdqu	%xmm0, 0x61c(%rbp)
140215f3d:     	movq	%xmm13, 0x630(%rbp)
140215f46:     	movw	$0x1, 0x638(%rbp)
140215f4f:     	movq	%r14, 0x5b0(%rbp)
140215f56:     	leaq	0x90(%rbp), %rcx
140215f5d:     	leaq	0x5b0(%rbp), %r8
140215f64:     	callq	0x1401f8270 <.text+0x1f7270>
140215f69:     	movq	0x10(%rsi), %rax
140215f6d:     	testq	%rax, %rax
140215f70:     	je	0x140215fae <.text+0x214fae>
140215f72:     	movq	0x8(%rsi), %rsi
140215f76:     	shlq	$0x3, %rax
140215f7a:     	leaq	(%rax,%rax,2), %r14
140215f7e:     	xorl	%r15d, %r15d
140215f81:     	leaq	0x340(%rbp), %r12
140215f88:     	nopl	(%rax,%rax)
140215f90:     	movq	0x8(%rsi,%r15), %r8
140215f95:     	movq	0x10(%rsi,%r15), %r9
140215f9a:     	movq	%r12, %rcx
140215f9d:     	movq	%rdi, %rdx
140215fa0:     	callq	0x1400c7270 <.text+0xc6270>
140215fa5:     	addq	$0x18, %r15
140215fa9:     	cmpq	%r15, %r14
140215fac:     	jne	0x140215f90 <.text+0x214f90>
140215fae:     	movaps	%xmm9, 0x340(%rbp)
140215fb6:     	movq	$0x0, 0x350(%rbp)
140215fc1:     	movups	%xmm11, 0x358(%rbp)
140215fc9:     	movq	$0x0, 0x368(%rbp)
140215fd4:     	movaps	%xmm10, 0x370(%rbp)
140215fdc:     	movq	$0x0, 0x380(%rbp)
140215fe7:     	movups	0x5728eda(%rip), %xmm0  # 0x14593eec8
140215fee:     	movups	%xmm0, 0x388(%rbp)
140215ff5:     	movq	$0x0, 0x398(%rbp)
140216000:     	movaps	%xmm9, 0x90(%rbp)
140216008:     	movaps	%xmm10, 0xc0(%rbp)
140216010:     	movq	0x350(%rbp), %rax
140216017:     	movq	%rax, 0xa0(%rbp)
14021601e:     	movq	0x358(%rbp), %rax
140216025:     	movq	%rax, 0xa8(%rbp)
14021602c:     	movq	0x360(%rbp), %rax
140216033:     	movq	%rax, 0xb0(%rbp)
14021603a:     	movq	0x368(%rbp), %rax
140216041:     	movq	%rax, 0xb8(%rbp)
140216048:     	movq	0x380(%rbp), %rax
14021604f:     	movq	%rax, 0xd0(%rbp)
140216056:     	movq	0x388(%rbp), %rax
14021605d:     	movq	%rax, 0xd8(%rbp)
140216064:     	movaps	0x390(%rbp), %xmm0
14021606b:     	movaps	%xmm0, 0xe0(%rbp)
140216072:     	xorps	%xmm0, %xmm0
140216075:     	movaps	%xmm0, 0x100(%rbp)
14021607c:     	movaps	%xmm0, 0xf0(%rbp)
140216083:     	movq	$0x0, 0x110(%rbp)
14021608e:     	movups	%xmm0, 0x658(%rbp)
140216095:     	movups	%xmm0, 0x648(%rbp)
14021609c:     	movq	$0x0, 0x668(%rbp)
1402160a7:     	movups	%xmm0, 0x788(%rbp)
1402160ae:     	leaq	0x5b8(%rbp), %rcx
1402160b5:     	leaq	0x90(%rbp), %rdx
1402160bc:     	movl	$0x88, %r8d
1402160c2:     	callq	0x145756ddd <.text+0x5755ddd>
1402160c7:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
1402160d1:     	movq	%rax, 0x640(%rbp)
1402160d8:     	movups	%xmm14, 0x670(%rbp)
1402160e0:     	movl	$0x0, 0x680(%rbp)
1402160ea:     	movaps	0x56e6a9f(%rip), %xmm0  # 0x1458fcb90
1402160f1:     	movups	%xmm0, 0x688(%rbp)
1402160f8:     	movaps	0x5728321(%rip), %xmm0  # 0x14593e420
1402160ff:     	movups	%xmm0, 0x698(%rbp)
140216106:     	movaps	0x5728323(%rip), %xmm0  # 0x14593e430
14021610d:     	movups	%xmm0, 0x6a8(%rbp)
140216114:     	movaps	0x5728325(%rip), %xmm0  # 0x14593e440
14021611b:     	movups	%xmm0, 0x6b8(%rbp)
140216122:     	movups	%xmm14, 0x6c8(%rbp)
14021612a:     	movdqu	%xmm6, 0x6d8(%rbp)
140216132:     	movsd	0x5728316(%rip), %xmm0  # 0x14593e450
14021613a:     	movups	%xmm0, 0x6e8(%rbp)
140216141:     	movq	$0x1, 0x6f8(%rbp)
14021614c:     	movl	$0x1, 0x700(%rbp)
140216156:     	movss	0x56e674e(%rip), %xmm0  # 0x1458fc8ac
14021615e:     	movlps	%xmm0, 0x704(%rbp)
140216165:     	movb	$0x1, 0x70c(%rbp)
14021616c:     	movq	$0x0, 0x710(%rbp)
140216177:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
140216181:     	movw	$0x0, 0x71c(%rbp)
14021618a:     	movw	$0x0, 0x722(%rbp)
140216193:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
14021619d:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
1402161a7:     	movw	$0x0, 0x728(%rbp)
1402161b0:     	movq	$0x0, 0x72a(%rbp)
1402161bb:     	movl	$0x5000005, 0x732(%rbp) # imm = 0x5000005
1402161c5:     	movl	$0x0, 0x738(%rbp)
1402161cf:     	movdqa	0x5728289(%rip), %xmm0  # 0x14593e460
1402161d7:     	movdqu	%xmm0, 0x73c(%rbp)
1402161df:     	movl	$0x0, 0x74c(%rbp)
1402161e9:     	movdqu	%xmm0, 0x750(%rbp)
1402161f1:     	movl	$0x0, 0x760(%rbp)
1402161fb:     	movdqu	%xmm0, 0x764(%rbp)
140216203:     	movl	$0x0, 0x774(%rbp)
14021620d:     	movdqu	%xmm0, 0x778(%rbp)
140216215:     	movl	$0x3eb33333, 0x798(%rbp) # imm = 0x3EB33333
14021621f:     	movq	0x5a8(%rbp), %rax
140216226:     	movq	%rax, 0x5b0(%rbp)
14021622d:     	leaq	0x520(%rbp), %rcx
140216234:     	leaq	0x5b0(%rbp), %r8
14021623b:     	leaq	0x68(%rbp), %rdx
14021623f:     	callq	0x1401e4670 <.text+0x1e3670>
140216244:     	movq	0x50(%rbx), %r14
140216248:     	cmpq	$-0x1, (%r14)
14021624c:     	je	0x140216286 <.text+0x215286>
14021624e:     	movq	0x48(%r14), %rax
140216252:     	leaq	-0x1(%rax), %rcx
140216256:     	cmpq	$0x4, %rcx
14021625a:     	ja	0x1402162c7 <.text+0x2152c7>
14021625c:     	leaq	0x572d275(%rip), %rcx   # 0x1459434d8
140216263:     	movd	-0x4(%rcx,%rax,4), %xmm6
140216269:     	leaq	0x572d27c(%rip), %rcx   # 0x1459434ec
140216270:     	movd	-0x4(%rcx,%rax,4), %xmm7
140216276:     	leaq	0x572d283(%rip), %rcx   # 0x145943500
14021627d:     	movd	-0x4(%rcx,%rax,4), %xmm8
140216284:     	jmp	0x1402162d8 <.text+0x2152d8>
140216286:     	movq	0x40(%rbx), %rdx
14021628a:     	leaq	0x90(%rbp), %rcx
140216291:     	callq	0x14570c440 <.text+0x570b440>
140216296:     	cmpb	$0x1, (%rdi)
140216299:     	movq	0x578(%rbp), %rsi
1402162a0:     	jne	0x140216639 <.text+0x215639>
1402162a6:     	movl	0x1(%rdi), %eax
1402162a9:     	movl	0x4(%rdi), %ecx
1402162ac:     	movl	%ecx, 0x843(%rbp)
1402162b2:     	movl	%eax, 0x840(%rbp)
1402162b8:     	movq	0x8(%rdi), %rax
1402162bc:     	movzbl	0x10(%rdi), %ecx
1402162c0:     	movb	$0x1, %dl
1402162c2:     	jmp	0x140216649 <.text+0x215649>
1402162c7:     	movd	0x56e65d1(%rip), %xmm6  # 0x1458fc8a0
1402162cf:     	movdqa	%xmm6, %xmm7
1402162d3:     	movdqa	%xmm6, %xmm8
1402162d8:     	movq	0x520(%rbp), %rsi
1402162df:     	movq	0x538(%rbp), %r15
1402162e6:     	movq	0x540(%rbp), %r12
1402162ed:     	testq	%r15, %r15
1402162f0:     	movq	%r15, %rbx
1402162f3:     	cmoveq	%r12, %rbx
1402162f7:     	movq	(%rbx), %rax
1402162fa:     	movq	0x10(%rbx), %r13
1402162fe:     	subq	%r13, %rax
140216301:     	cmpq	$0x17, %rax
140216305:     	jbe	0x1402167c5 <.text+0x2157c5>
14021630b:     	movq	0x8(%rbx), %rax
14021630f:     	leaq	0x69b0a(%rip), %rcx     # 0x14027fe20 <.text+0x27ee20>
140216316:     	movq	%rcx, (%rax,%r13)
14021631a:     	movq	%rsi, 0x8(%rax,%r13)
14021631f:     	movb	$0x1, 0x12(%rax,%r13)
140216325:     	movw	$0x200, 0x10(%rax,%r13) # imm = 0x200
14021632d:     	addq	$0x18, %r13
140216331:     	movq	%r13, 0x10(%rbx)
140216335:     	movq	0x548(%rbp), %rax
14021633c:     	movq	%rsi, 0x340(%rbp)
140216343:     	movdqu	0x528(%rbp), %xmm0
14021634b:     	movdqu	%xmm0, 0x348(%rbp)
140216353:     	movq	%r15, 0x358(%rbp)
14021635a:     	movq	%r12, 0x360(%rbp)
140216361:     	movq	%rax, 0x368(%rbp)
140216368:     	leaq	0x57294f9(%rip), %rcx   # 0x14593f868
14021636f:     	movl	$0x8, %edx
140216374:     	callq	0x145452350 <.text+0x5451350>
140216379:     	movq	%rax, 0x90(%rbp)
140216380:     	movq	%rdx, 0x98(%rbp)
140216387:     	leaq	0x90(%rbp), %rax
14021638e:     	movq	%rax, 0x5b0(%rbp)
140216395:     	leaq	-0x2142dc(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14021639c:     	movq	%rax, 0x5b8(%rbp)
1402163a3:     	leaq	0x5728a4a(%rip), %rdx   # 0x14593edf4
1402163aa:     	leaq	0x4f0(%rbp), %rcx
1402163b1:     	leaq	0x5b0(%rbp), %r8
1402163b8:     	callq	0x14570bf80 <.text+0x570af80>
1402163bd:     	cmpb	$0x1, (%rdi)
1402163c0:     	jne	0x1402163e8 <.text+0x2153e8>
1402163c2:     	movl	0x1(%rdi), %eax
1402163c5:     	movl	0x4(%rdi), %ecx
1402163c8:     	movl	%ecx, 0x59b(%rbp)
1402163ce:     	movl	%eax, 0x598(%rbp)
1402163d4:     	movq	0x8(%rdi), %rax
1402163d8:     	movzbl	0x10(%rdi), %ecx
1402163dc:     	movb	$0x1, %r8b
1402163df:     	movl	0x56e74f6(%rip), %r10d  # 0x1458fd8dc
1402163e6:     	jmp	0x140216400 <.text+0x215400>
1402163e8:     	movq	0x8(%rdi), %rax
1402163ec:     	lock
1402163ed:     	incq	(%rax)
1402163f0:     	movl	0x56e74e5(%rip), %r10d  # 0x1458fd8dc
1402163f7:     	jle	0x1402167c3 <.text+0x2157c3>
1402163fd:     	xorl	%r8d, %r8d
140216400:     	leaq	0x348(%rbp), %rdx
140216407:     	movq	0x500(%rbp), %r9
14021640e:     	movq	%r9, 0x5c8(%rbp)
140216415:     	movups	0x4f0(%rbp), %xmm0
14021641c:     	movups	%xmm0, 0x5b8(%rbp)
140216423:     	movups	0x5728a12(%rip), %xmm0  # 0x14593ee3c
14021642a:     	movups	%xmm0, 0x841(%rbp)
140216431:     	movl	$0x3f800000, 0x851(%rbp) # imm = 0x3F800000
14021643b:     	movq	$0x0, 0x5d0(%rbp)
140216446:     	movq	$0x4, 0x5d8(%rbp)
140216451:     	movq	$0x0, 0x5e0(%rbp)
14021645c:     	movb	%r8b, 0x5e8(%rbp)
140216463:     	movl	0x598(%rbp), %r8d
14021646a:     	movl	0x59b(%rbp), %r9d
140216471:     	movl	%r8d, 0x5e9(%rbp)
140216478:     	movl	%r9d, 0x5ec(%rbp)
14021647f:     	movq	%rax, 0x5f0(%rbp)
140216486:     	movq	%rcx, 0x5f8(%rbp)
14021648d:     	movl	$0x41400000, 0x600(%rbp) # imm = 0x41400000
140216497:     	movw	$0x190, 0x604(%rbp)     # imm = 0x190
1402164a0:     	movb	$0x1, 0x606(%rbp)
1402164a7:     	movq	0x84d(%rbp), %rax
1402164ae:     	movq	%rax, 0x614(%rbp)
1402164b5:     	movups	0x840(%rbp), %xmm0
1402164bc:     	movups	%xmm0, 0x607(%rbp)
1402164c3:     	movdqu	0x56e7401(%rip), %xmm0  # 0x1458fd8cc
1402164cb:     	movdqu	%xmm0, 0x61c(%rbp)
1402164d3:     	movl	%r10d, 0x62c(%rbp)
1402164da:     	movq	%xmm13, 0x630(%rbp)
1402164e3:     	movw	$0x1, 0x638(%rbp)
1402164ec:     	movq	%rsi, 0x5b0(%rbp)
1402164f3:     	leaq	0x90(%rbp), %rcx
1402164fa:     	leaq	0x5b0(%rbp), %r8
140216501:     	callq	0x1401f8270 <.text+0x1f7270>
140216506:     	leaq	0x840(%rbp), %rcx
14021650d:     	movq	%r14, %rdx
140216510:     	callq	0x14570c440 <.text+0x570b440>
140216515:     	cmpb	$0x1, (%rdi)
140216518:     	jne	0x14021653f <.text+0x21553f>
14021651a:     	movl	0x1(%rdi), %eax
14021651d:     	movl	0x4(%rdi), %ecx
140216520:     	movl	%ecx, 0x4d3(%rbp)
140216526:     	movl	%eax, 0x4d0(%rbp)
14021652c:     	movq	0x8(%rdi), %rax
140216530:     	movzbl	0x10(%rdi), %ecx
140216534:     	movb	$0x1, %dl
140216536:     	movq	0x578(%rbp), %rsi
14021653d:     	jmp	0x140216556 <.text+0x215556>
14021653f:     	movq	0x8(%rdi), %rax
140216543:     	lock
140216544:     	incq	(%rax)
140216547:     	movq	0x578(%rbp), %rsi
14021654e:     	jle	0x1402167c3 <.text+0x2157c3>
140216554:     	xorl	%edx, %edx
140216556:     	movq	0x850(%rbp), %r8
14021655d:     	movq	%r8, 0x5c0(%rbp)
140216564:     	movups	0x840(%rbp), %xmm0
14021656b:     	movaps	%xmm0, 0x5b0(%rbp)
140216572:     	movq	$0x0, 0x5c8(%rbp)
14021657d:     	movq	$0x4, 0x5d0(%rbp)
140216588:     	movq	$0x0, 0x5d8(%rbp)
140216593:     	movb	%dl, 0x5e0(%rbp)
140216599:     	movl	0x4d0(%rbp), %edx
14021659f:     	movl	0x4d3(%rbp), %r8d
1402165a6:     	movl	%edx, 0x5e1(%rbp)
1402165ac:     	movl	%r8d, 0x5e4(%rbp)
1402165b3:     	movq	%rax, 0x5e8(%rbp)
1402165ba:     	movq	%rcx, 0x5f0(%rbp)
1402165c1:     	movl	$0x41400000, 0x5f8(%rbp) # imm = 0x41400000
1402165cb:     	movw	$0x190, 0x5fc(%rbp)     # imm = 0x190
1402165d4:     	movb	$0x1, 0x5fe(%rbp)
1402165db:     	movl	$0x0, 0x600(%rbp)
1402165e5:     	movd	%xmm6, 0x604(%rbp)
1402165ed:     	movd	%xmm7, 0x608(%rbp)
1402165f5:     	movd	%xmm8, 0x60c(%rbp)
1402165fe:     	movl	$0x3f800000, 0x610(%rbp) # imm = 0x3F800000
140216608:     	leaq	0x90(%rbp), %rcx
14021660f:     	leaq	0x5b0(%rbp), %rdx
140216616:     	callq	0x1401fdab0 <.text+0x1fcab0>
14021661b:     	leaq	0x340(%rbp), %rcx
140216622:     	movq	%rdi, %rdx
140216625:     	movq	0x4c0(%rbp), %r8
14021662c:     	movq	%r14, %r9
14021662f:     	callq	0x1400c6de0 <.text+0xc5de0>
140216634:     	jmp	0x14021673c <.text+0x21573c>
140216639:     	movq	0x8(%rdi), %rax
14021663d:     	lock
14021663e:     	incq	(%rax)
140216641:     	jle	0x1402167c3 <.text+0x2157c3>
140216647:     	xorl	%edx, %edx
140216649:     	movups	0x57287ec(%rip), %xmm0  # 0x14593ee3c
140216650:     	movups	%xmm0, 0x341(%rbp)
140216657:     	movl	$0x3f800000, 0x351(%rbp) # imm = 0x3F800000
140216661:     	movups	0x90(%rbp), %xmm0
140216668:     	movaps	%xmm0, 0x5b0(%rbp)
14021666f:     	movq	0xa0(%rbp), %r8
140216676:     	movq	%r8, 0x5c0(%rbp)
14021667d:     	movq	$0x0, 0x5c8(%rbp)
140216688:     	movq	$0x4, 0x5d0(%rbp)
140216693:     	movq	$0x0, 0x5d8(%rbp)
14021669e:     	movb	%dl, 0x5e0(%rbp)
1402166a4:     	movl	0x840(%rbp), %edx
1402166aa:     	movl	0x843(%rbp), %r8d
1402166b1:     	movl	%edx, 0x5e1(%rbp)
1402166b7:     	movl	%r8d, 0x5e4(%rbp)
1402166be:     	movq	%rax, 0x5e8(%rbp)
1402166c5:     	movq	%rcx, 0x5f0(%rbp)
1402166cc:     	movl	$0x41400000, 0x5f8(%rbp) # imm = 0x41400000
1402166d6:     	movw	$0x190, 0x5fc(%rbp)     # imm = 0x190
1402166df:     	movb	$0x1, 0x5fe(%rbp)
1402166e6:     	movq	0x34d(%rbp), %rax
1402166ed:     	movq	%rax, 0x60c(%rbp)
1402166f4:     	movups	0x340(%rbp), %xmm0
1402166fb:     	movups	%xmm0, 0x5ff(%rbp)
140216702:     	movups	0x56e71c3(%rip), %xmm0  # 0x1458fd8cc
140216709:     	movups	%xmm0, 0x614(%rbp)
140216710:     	movl	%r13d, 0x624(%rbp)
140216717:     	movq	%xmm13, 0x628(%rbp)
140216720:     	movw	$0x1, 0x630(%rbp)
140216729:     	leaq	0x520(%rbp), %rcx
140216730:     	leaq	0x5b0(%rbp), %rdx
140216737:     	callq	0x1401fe490 <.text+0x1fd490>
14021673c:     	movq	%rsi, %rax
14021673f:     	movaps	0x880(%rbp), %xmm6
140216746:     	movaps	0x890(%rbp), %xmm7
14021674d:     	movaps	0x8a0(%rbp), %xmm8
140216755:     	movaps	0x8b0(%rbp), %xmm9
14021675d:     	movaps	0x8c0(%rbp), %xmm10
140216765:     	movaps	0x8d0(%rbp), %xmm11
14021676d:     	movaps	0x8e0(%rbp), %xmm12
140216775:     	movaps	0x8f0(%rbp), %xmm13
14021677d:     	movaps	0x900(%rbp), %xmm14
140216785:     	movaps	0x910(%rbp), %xmm15
14021678d:     	addq	$0x9a8, %rsp            # imm = 0x9A8
140216794:     	popq	%rbx
140216795:     	popq	%rdi
140216796:     	popq	%rsi
140216797:     	popq	%r12
140216799:     	popq	%r13
14021679b:     	popq	%r14
14021679d:     	popq	%r15
14021679f:     	popq	%rbp
1402167a0:     	retq
1402167a1:     	movl	$0x4, %ecx
1402167a6:     	movl	$0x40, %edx
1402167ab:     	callq	0x1458e7201 <.text+0x58e6201>
1402167b0:     	nop
1402167b1:     	jmp	0x1402167c3 <.text+0x2157c3>
1402167b3:     	movl	$0x8, %ecx
1402167b8:     	movl	$0x48, %edx
1402167bd:     	callq	0x1458e7201 <.text+0x58e6201>
1402167c2:     	nop
1402167c3:     	ud2
1402167c5:     	movq	$0x1, 0x20(%rsp)
1402167ce:     	movl	$0x18, %r8d
1402167d4:     	movl	$0x1, %r9d
1402167da:     	movq	%rbx, %rcx
1402167dd:     	movq	%r13, %rdx
1402167e0:     	callq	0x145757d40 <.text+0x5756d40>
1402167e5:     	jmp	0x14021630b <.text+0x21530b>
1402167ea:     	je	0x140216837 <.text+0x215837>
1402167ec:     	movq	%rdx, %r14
1402167ef:     	movq	0x10(%rax), %r12
1402167f3:     	callq	0x140002200 <.text+0x1200>
1402167f8:     	movl	$0x1, %edx
1402167fd:     	movq	%r14, %rcx
140216800:     	callq	0x1400021c0 <.text+0x11c0>
140216805:     	movq	%r14, %rdx
140216808:     	movl	$0x1, %ecx
14021680d:     	testq	%rax, %rax
140216810:     	je	0x140215465 <.text+0x214465>
140216816:     	movq	%rax, %r15
140216819:     	movq	%rax, %rcx
14021681c:     	movq	%rdx, %rsi
14021681f:     	movq	%r12, %rdx
140216822:     	movq	%rsi, %r8
140216825:     	callq	0x145756ddd <.text+0x5755ddd>
14021682a:     	cmpq	$0x8, %rsi
14021682e:     	jae	0x140216885 <.text+0x215885>
140216830:     	xorl	%eax, %eax
140216832:     	jmp	0x140216982 <.text+0x215982>
140216837:     	xorl	%r8d, %r8d
14021683a:     	movl	0x56e709b(%rip), %r13d  # 0x1458fd8dc
140216841:     	movq	0x56e26c6(%rip), %xmm13 # 0x1458f8f10
14021684a:     	movaps	0x56e628e(%rip), %xmm14 # 0x1458fcae0
140216852:     	movups	0x572863e(%rip), %xmm11 # 0x14593ee98
14021685a:     	movups	0x5728666(%rip), %xmm12 # 0x14593eec8
140216862:     	movups	0x57286fe(%rip), %xmm15 # 0x14593ef68
14021686a:     	movdqu	0x57286e5(%rip), %xmm8  # 0x14593ef58
140216873:     	movdqa	0x56d4c35(%rip), %xmm6  # 0x1458eb4b0
14021687b:     	movl	$0x1, %edx
140216880:     	jmp	0x140215473 <.text+0x214473>
140216885:     	cmpq	$0x20, %r14
140216889:     	jae	0x140216892 <.text+0x215892>
14021688b:     	xorl	%eax, %eax
14021688d:     	jmp	0x140216927 <.text+0x215927>
140216892:     	movabsq	$0x7fffffffffffffe0, %rax # imm = 0x7FFFFFFFFFFFFFE0
14021689c:     	andq	%r14, %rax
14021689f:     	xorl	%ecx, %ecx
1402168a1:     	movdqa	0x5727b57(%rip), %xmm6  # 0x14593e400
1402168a9:     	movdqa	0x56d4d4f(%rip), %xmm1  # 0x1458eb600
1402168b1:     	movdqa	0x56d6787(%rip), %xmm2  # 0x1458ed040
1402168b9:     	movdqu	(%r15,%rcx), %xmm0
1402168bf:     	movdqu	0x10(%r15,%rcx), %xmm4
1402168c6:     	movdqa	%xmm0, %xmm3
1402168ca:     	paddb	%xmm6, %xmm3
1402168ce:     	movdqa	%xmm4, %xmm13
1402168d3:     	paddb	%xmm6, %xmm13
1402168d8:     	movdqa	%xmm3, %xmm5
1402168dc:     	pminub	%xmm1, %xmm5
1402168e0:     	pcmpeqb	%xmm3, %xmm5
1402168e4:     	pand	%xmm2, %xmm5
1402168e8:     	movdqa	%xmm13, %xmm3
1402168ed:     	pminub	%xmm1, %xmm3
1402168f1:     	pcmpeqb	%xmm13, %xmm3
1402168f6:     	pand	%xmm2, %xmm3
1402168fa:     	pxor	%xmm0, %xmm5
1402168fe:     	pxor	%xmm4, %xmm3
140216902:     	movdqu	%xmm5, (%r15,%rcx)
140216908:     	movdqu	%xmm3, 0x10(%r15,%rcx)
14021690f:     	addq	$0x20, %rcx
140216913:     	cmpq	%rcx, %rax
140216916:     	jne	0x1402168b9 <.text+0x2158b9>
140216918:     	cmpq	%rax, %r14
14021691b:     	je	0x1402169a1 <.text+0x2159a1>
140216921:     	testb	$0x18, %r14b
140216925:     	je	0x140216982 <.text+0x215982>
140216927:     	movq	%rax, %rcx
14021692a:     	movabsq	$0x7ffffffffffffff8, %rax # imm = 0x7FFFFFFFFFFFFFF8
140216934:     	andq	%r14, %rax
140216937:     	movdqa	0x5727ad1(%rip), %xmm0  # 0x14593e410
14021693f:     	movdqa	0x56d6719(%rip), %xmm1  # 0x1458ed060
140216947:     	movdqa	0x56d6721(%rip), %xmm2  # 0x1458ed070
14021694f:     	movq	(%r15,%rcx), %xmm3
140216955:     	movdqa	%xmm3, %xmm4
140216959:     	paddb	%xmm0, %xmm4
14021695d:     	movdqa	%xmm4, %xmm5
140216961:     	pmaxub	%xmm1, %xmm5
140216965:     	pcmpeqb	%xmm4, %xmm5
140216969:     	pandn	%xmm2, %xmm5
14021696d:     	pxor	%xmm3, %xmm5
140216971:     	movq	%xmm5, (%r15,%rcx)
140216977:     	addq	$0x8, %rcx
14021697b:     	cmpq	%rcx, %rax
14021697e:     	jne	0x14021694f <.text+0x21594f>
140216980:     	jmp	0x14021699c <.text+0x21599c>
140216982:     	movzbl	(%r15,%rax), %ecx
140216987:     	leal	-0x61(%rcx), %edx
14021698a:     	cmpb	$0x1a, %dl
14021698d:     	setb	%dl
140216990:     	shlb	$0x5, %dl
140216993:     	xorb	%cl, %dl
140216995:     	movb	%dl, (%r15,%rax)
140216999:     	incq	%rax
14021699c:     	cmpq	%rax, %r14
14021699f:     	jne	0x140216982 <.text+0x215982>
1402169a1:     	movl	0x56e6f34(%rip), %r13d  # 0x1458fd8dc
1402169a8:     	movq	0x56e255f(%rip), %xmm13 # 0x1458f8f10
1402169b1:     	movaps	0x56e6127(%rip), %xmm14 # 0x1458fcae0
1402169b9:     	movups	0x57284d7(%rip), %xmm11 # 0x14593ee98
1402169c1:     	movups	0x57284ff(%rip), %xmm12 # 0x14593eec8
1402169c9:     	movups	0x5728597(%rip), %xmm15 # 0x14593ef68
1402169d1:     	movdqu	0x572857e(%rip), %xmm8  # 0x14593ef58
1402169da:     	movdqa	0x56d4ace(%rip), %xmm6  # 0x1458eb4b0
1402169e2:     	movq	%r14, %r8
1402169e5:     	movq	%r15, %rdx
1402169e8:     	jmp	0x140215473 <.text+0x214473>


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1408242e0:     	pushq	%rbp
1408242e1:     	pushq	%r15
1408242e3:     	pushq	%r14
1408242e5:     	pushq	%r13
1408242e7:     	pushq	%r12
1408242e9:     	pushq	%rsi
1408242ea:     	pushq	%rdi
1408242eb:     	pushq	%rbx
1408242ec:     	subq	$0x778, %rsp            # imm = 0x778
1408242f3:     	leaq	0x80(%rsp), %rbp
1408242fb:     	movaps	%xmm15, 0x6e0(%rbp)
140824303:     	movaps	%xmm14, 0x6d0(%rbp)
14082430b:     	movaps	%xmm13, 0x6c0(%rbp)
140824313:     	movaps	%xmm12, 0x6b0(%rbp)
14082431b:     	movaps	%xmm11, 0x6a0(%rbp)
140824323:     	movaps	%xmm10, 0x690(%rbp)
14082432b:     	movaps	%xmm9, 0x680(%rbp)
140824333:     	movaps	%xmm8, 0x670(%rbp)
14082433b:     	movaps	%xmm7, 0x660(%rbp)
140824342:     	movaps	%xmm6, 0x650(%rbp)
140824349:     	movq	$-0x2, 0x648(%rbp)
140824354:     	movq	0x780(%rbp), %rax
14082435b:     	movq	0x778(%rbp), %rcx
140824362:     	movq	0x770(%rbp), %r10
140824369:     	movq	0x768(%rbp), %r11
140824370:     	movq	0x760(%rbp), %rsi
140824377:     	movq	0x20(%rdx), %rdi
14082437b:     	movq	%rdi, -0x20(%rbp)
14082437f:     	movups	(%rdx), %xmm0
140824382:     	movups	0x10(%rdx), %xmm1
140824386:     	movaps	%xmm1, -0x30(%rbp)
14082438a:     	movaps	%xmm0, -0x40(%rbp)
14082438e:     	movups	(%r8), %xmm0
140824392:     	movups	0x10(%r8), %xmm1
140824397:     	movups	%xmm1, -0x8(%rbp)
14082439b:     	movups	%xmm0, -0x18(%rbp)
14082439f:     	movups	(%r9), %xmm0
1408243a3:     	movups	0x10(%r9), %xmm1
1408243a8:     	movups	%xmm1, 0x18(%rbp)
1408243ac:     	movups	%xmm0, 0x8(%rbp)
1408243b0:     	movups	(%rsi), %xmm0
1408243b3:     	movups	0x10(%rsi), %xmm1
1408243b7:     	movups	%xmm1, 0x38(%rbp)
1408243bb:     	movups	%xmm0, 0x28(%rbp)
1408243bf:     	movups	(%r11), %xmm0
1408243c3:     	movups	0x10(%r11), %xmm1
1408243c8:     	movups	%xmm1, 0x58(%rbp)
1408243cc:     	movups	%xmm0, 0x48(%rbp)
1408243d0:     	movups	(%r10), %xmm0
1408243d4:     	movups	0x10(%r10), %xmm1
1408243d9:     	movups	%xmm0, 0x68(%rbp)
1408243dd:     	movups	%xmm1, 0x78(%rbp)
1408243e1:     	movups	(%rcx), %xmm0
1408243e4:     	movups	0x10(%rcx), %xmm1
1408243e8:     	movups	%xmm0, 0x88(%rbp)
1408243ef:     	movups	%xmm1, 0x98(%rbp)
1408243f6:     	movups	(%rax), %xmm0
1408243f9:     	movups	0x10(%rax), %xmm1
1408243fd:     	movups	%xmm1, 0xb8(%rbp)
140824404:     	movups	%xmm0, 0xa8(%rbp)
14082440b:     	movsd	0x51d37dd(%rip), %xmm0  # 0x1459f7bf0
140824413:     	movsd	%xmm0, 0x5e0(%rbp)
14082441b:     	movl	$0x3f5af90f, 0x5e8(%rbp) # imm = 0x3F5AF90F
140824425:     	movsd	0x51d37d3(%rip), %xmm0  # 0x1459f7c00
14082442d:     	movsd	%xmm0, 0x540(%rbp)
140824435:     	movl	$0x3f0a3d71, 0x548(%rbp) # imm = 0x3F0A3D71
14082443f:     	movsd	0x51d37c9(%rip), %xmm0  # 0x1459f7c10
140824447:     	movsd	%xmm0, 0x330(%rbp)
14082444f:     	movl	$0x3f47ae14, 0x338(%rbp) # imm = 0x3F47AE14
140824459:     	leaq	0xd0(%rbp), %rdi
140824460:     	leaq	0x540(%rbp), %rdx
140824467:     	leaq	0x330(%rbp), %r8
14082446e:     	leaq	0x5e0(%rbp), %r9
140824475:     	movq	%rdi, %rcx
140824478:     	callq	0x1418c5210 <.text+0x18c4210>
14082447d:     	movaps	0x510f85c(%rip), %xmm6  # 0x145933ce0
140824484:     	movaps	%xmm6, 0x280(%rbp)
14082448b:     	leaq	0x51dddf4(%rip), %rbx   # 0x145a02286
140824492:     	movq	%rbx, 0x330(%rbp)
140824499:     	movq	$0x12, 0x338(%rbp)
1408244a4:     	leaq	0x340(%rbp), %rsi
1408244ab:     	movl	$0x1f0, %r8d            # imm = 0x1F0
1408244b1:     	movq	%rsi, %rcx
1408244b4:     	movq	%rdi, %rdx
1408244b7:     	callq	0x145756ddd <.text+0x5755ddd>
1408244bc:     	movq	0x88(%rbp), %rdi
1408244c3:     	movq	$0x12, 0x20(%rsp)
1408244cc:     	leaq	0x540(%rbp), %rcx
1408244d3:     	movq	%rsi, %rdx
1408244d6:     	movq	%rdi, %r8
1408244d9:     	movq	%rbx, %r9
1408244dc:     	callq	0x1418c5900 <.text+0x18c4900>
1408244e1:     	nop
1408244e2:     	movq	0xa8(%rbp), %rbx
1408244e9:     	leaq	0x540(%rbp), %r8
1408244f0:     	movq	%rsi, %rcx
1408244f3:     	movq	%rbx, %rdx
1408244f6:     	callq	0x1418c56e0 <.text+0x18c46e0>
1408244fb:     	nop
1408244fc:     	movq	0x560(%rbp), %rax
140824503:     	movq	%rax, 0x600(%rbp)
14082450a:     	movups	0x540(%rbp), %xmm0
140824511:     	movups	0x550(%rbp), %xmm1
140824518:     	movaps	%xmm1, 0x5f0(%rbp)
14082451f:     	movaps	%xmm0, 0x5e0(%rbp)
140824526:     	movq	0x510(%rbp), %rdx
14082452d:     	testq	%rdx, %rdx
140824530:     	je	0x140824548 <.text+0x823548>
140824532:     	movq	0x518(%rbp), %rcx
140824539:     	shlq	$0x4, %rdx
14082453d:     	movl	$0x4, %r8d
140824543:     	callq	0x1400021d0 <.text+0x11d0>
140824548:     	movaps	0x5e0(%rbp), %xmm0
14082454f:     	movaps	0x5f0(%rbp), %xmm1
140824556:     	movaps	%xmm0, 0x330(%rbp)
14082455d:     	movaps	%xmm1, 0x340(%rbp)
140824564:     	movq	0x600(%rbp), %rax
14082456b:     	movq	%rax, 0x350(%rbp)
140824572:     	movl	0x64(%rbp), %r15d
140824576:     	movq	0x58(%rbp), %r12
14082457a:     	movl	%r15d, (%r12)
14082457e:     	movq	0x48(%rbp), %rax
140824582:     	leaq	0x30(%rax), %rcx
140824586:     	movq	%rcx, 0x620(%rbp)
14082458d:     	movq	%rax, 0x630(%rbp)
140824594:     	movq	0x30(%rax), %rax
140824598:     	testq	%rax, %rax
14082459b:     	je	0x1408245d2 <.text+0x8235d2>
14082459d:     	lock
14082459e:     	decq	(%rax)
1408245a1:     	jne	0x1408245b0 <.text+0x8235b0>
1408245a3:     	movq	0x620(%rbp), %rcx
1408245aa:     	callq	0x143df8960 <.text+0x3df7960>
1408245af:     	nop
1408245b0:     	movq	0x630(%rbp), %rax
1408245b7:     	movq	0x38(%rax), %rax
1408245bb:     	lock
1408245bc:     	decq	(%rax)
1408245bf:     	jne	0x1408245d2 <.text+0x8235d2>
1408245c1:     	movq	0x630(%rbp), %rax
1408245c8:     	leaq	0x38(%rax), %rcx
1408245cc:     	callq	0x143df83c0 <.text+0x3df73c0>
1408245d1:     	nop
1408245d2:     	movq	0x350(%rbp), %rax
1408245d9:     	movq	0x620(%rbp), %rcx
1408245e0:     	movq	%rax, 0x20(%rcx)
1408245e4:     	movaps	0x330(%rbp), %xmm0
1408245eb:     	movaps	0x340(%rbp), %xmm1
1408245f2:     	movups	%xmm1, 0x10(%rcx)
1408245f6:     	movups	%xmm0, (%rcx)
1408245f9:     	movss	0x50c6efb(%rip), %xmm0  # 0x1458eb4fc
140824601:     	movlps	%xmm0, 0x5e0(%rbp)
140824608:     	movl	$0x80000000, 0x5e8(%rbp) # imm = 0x80000000
140824612:     	movsd	0x51d3606(%rip), %xmm0  # 0x1459f7c20
14082461a:     	movsd	%xmm0, 0x540(%rbp)
140824622:     	movl	$0x3f333333, 0x548(%rbp) # imm = 0x3F333333
14082462c:     	movsd	0x51a3edc(%rip), %xmm0  # 0x1459c8510
140824634:     	movsd	%xmm0, 0x330(%rbp)
14082463c:     	movl	$0x3f23d70a, 0x338(%rbp) # imm = 0x3F23D70A
140824646:     	leaq	0xd0(%rbp), %rsi
14082464d:     	leaq	0x540(%rbp), %rdx
140824654:     	leaq	0x330(%rbp), %r8
14082465b:     	leaq	0x5e0(%rbp), %r9
140824662:     	movq	%rsi, %rcx
140824665:     	callq	0x1418c5210 <.text+0x18c4210>
14082466a:     	movaps	%xmm6, 0x280(%rbp)
140824671:     	leaq	0x51ddc20(%rip), %r14   # 0x145a02298
140824678:     	movq	%r14, 0x330(%rbp)
14082467f:     	movq	$0x14, 0x338(%rbp)
14082468a:     	leaq	0x340(%rbp), %r13
140824691:     	movl	$0x1f0, %r8d            # imm = 0x1F0
140824697:     	movq	%r13, %rcx
14082469a:     	movq	%rsi, %rdx
14082469d:     	callq	0x145756ddd <.text+0x5755ddd>
1408246a2:     	nop
1408246a3:     	movq	$0x14, 0x20(%rsp)
1408246ac:     	leaq	0x540(%rbp), %rcx
1408246b3:     	movq	%r13, %rdx
1408246b6:     	movq	%rdi, %r8
1408246b9:     	movq	%r14, %r9
1408246bc:     	callq	0x1418c5900 <.text+0x18c4900>
1408246c1:     	nop
1408246c2:     	leaq	0x540(%rbp), %r8
1408246c9:     	movq	%r13, %rcx
1408246cc:     	movq	%rbx, %rdx
1408246cf:     	callq	0x1418c56e0 <.text+0x18c46e0>
1408246d4:     	nop
1408246d5:     	movq	0x560(%rbp), %rax
1408246dc:     	movq	%rax, 0x600(%rbp)
1408246e3:     	movups	0x540(%rbp), %xmm0
1408246ea:     	movups	0x550(%rbp), %xmm1
1408246f1:     	movaps	%xmm1, 0x5f0(%rbp)
1408246f8:     	movaps	%xmm0, 0x5e0(%rbp)
1408246ff:     	movq	0x510(%rbp), %rdx
140824706:     	testq	%rdx, %rdx
140824709:     	leaq	0x330(%rbp), %r14
140824710:     	je	0x140824728 <.text+0x823728>
140824712:     	movq	0x518(%rbp), %rcx
140824719:     	shlq	$0x4, %rdx
14082471d:     	movl	$0x4, %r8d
140824723:     	callq	0x1400021d0 <.text+0x11d0>
140824728:     	movaps	0x5e0(%rbp), %xmm0
14082472f:     	movaps	0x5f0(%rbp), %xmm1
140824736:     	movaps	%xmm0, 0x330(%rbp)
14082473d:     	movaps	%xmm1, 0x340(%rbp)
140824744:     	movq	0x600(%rbp), %rax
14082474b:     	movq	%rax, 0x350(%rbp)
140824752:     	movl	%r15d, (%r12)
140824756:     	movq	0x630(%rbp), %r15
14082475d:     	leaq	0x90(%r15), %rax
140824764:     	movq	%rax, 0x5c0(%rbp)
14082476b:     	movq	0x90(%r15), %rax
140824772:     	testq	%rax, %rax
140824775:     	je	0x1408247ab <.text+0x8237ab>
140824777:     	lock
140824778:     	decq	(%rax)
14082477b:     	jne	0x14082478a <.text+0x82378a>
14082477d:     	movq	0x5c0(%rbp), %rcx
140824784:     	callq	0x143df8960 <.text+0x3df7960>
140824789:     	nop
14082478a:     	movq	0x630(%rbp), %r15
140824791:     	movq	0x98(%r15), %rax
140824798:     	lock
140824799:     	decq	(%rax)
14082479c:     	jne	0x1408247ab <.text+0x8237ab>
14082479e:     	leaq	0x98(%r15), %rcx
1408247a5:     	callq	0x143df83c0 <.text+0x3df73c0>
1408247aa:     	nop
1408247ab:     	movq	0x350(%rbp), %rax
1408247b2:     	movq	0x5c0(%rbp), %r12
1408247b9:     	movq	%rax, 0x20(%r12)
1408247be:     	movaps	0x330(%rbp), %xmm0
1408247c5:     	movaps	0x340(%rbp), %xmm1
1408247cc:     	movups	%xmm1, 0x10(%r12)
1408247d2:     	movups	%xmm0, (%r12)
1408247d7:     	movl	0x84(%rbp), %esi
1408247dd:     	movq	0x68(%rbp), %rdi
1408247e1:     	movq	0x78(%rbp), %rbx
1408247e5:     	movq	0x620(%rbp), %rax
1408247ec:     	cmpq	$0x0, (%rax)
1408247f0:     	je	0x14082489b <.text+0x82389b>
1408247f6:     	movl	%esi, (%rbx)
1408247f8:     	movl	0x50(%r15), %eax
1408247fc:     	movq	0x30(%r15), %rcx
140824800:     	lock
140824801:     	incq	(%rcx)
140824804:     	jle	0x140826ed5 <.text+0x825ed5>
14082480a:     	movq	0x38(%r15), %rdx
14082480e:     	lock
14082480f:     	incq	(%rdx)
140824812:     	jle	0x140826ed5 <.text+0x825ed5>
140824818:     	movq	0x40(%r15), %r8
14082481c:     	movl	0x48(%r15), %r9d
140824820:     	movl	%eax, 0x350(%rbp)
140824826:     	movq	%rcx, 0x330(%rbp)
14082482d:     	movq	%rdx, 0x338(%rbp)
140824834:     	movq	%r8, 0x340(%rbp)
14082483b:     	movl	%r9d, 0x348(%rbp)
140824842:     	movq	%r14, 0x20(%rsp)
140824847:     	leaq	0x51dda5e(%rip), %r8    # 0x145a022ac
14082484e:     	leaq	0xd0(%rbp), %rcx
140824855:     	movl	$0x8, %r9d
14082485b:     	movq	%rdi, %rdx
14082485e:     	callq	0x140bccfa0 <.text+0xbcbfa0>
140824863:     	movq	0xd0(%rbp), %rax
14082486a:     	testq	%rax, %rax
14082486d:     	je	0x14082489b <.text+0x82389b>
14082486f:     	lock
140824870:     	decq	(%rax)
140824873:     	jne	0x140824882 <.text+0x823882>
140824875:     	leaq	0xd0(%rbp), %rcx
14082487c:     	callq	0x143df8960 <.text+0x3df7960>
140824881:     	nop
140824882:     	movq	0xd8(%rbp), %rax
140824889:     	lock
14082488a:     	decq	(%rax)
14082488d:     	jne	0x14082489b <.text+0x82389b>
14082488f:     	leaq	0xd8(%rbp), %rcx
140824896:     	callq	0x143df83c0 <.text+0x3df73c0>
14082489b:     	cmpq	$0x0, (%r12)
1408248a0:     	je	0x14082495a <.text+0x82395a>
1408248a6:     	movl	%esi, (%rbx)
1408248a8:     	movl	0xb0(%r15), %eax
1408248af:     	movq	0x90(%r15), %rcx
1408248b6:     	lock
1408248b7:     	incq	(%rcx)
1408248ba:     	jle	0x140826ed5 <.text+0x825ed5>
1408248c0:     	movq	0x98(%r15), %rdx
1408248c7:     	lock
1408248c8:     	incq	(%rdx)
1408248cb:     	jle	0x140826ed5 <.text+0x825ed5>
1408248d1:     	movq	0xa0(%r15), %r8
1408248d8:     	movl	0xa8(%r15), %r9d
1408248df:     	movl	%eax, 0x350(%rbp)
1408248e5:     	movq	%rcx, 0x330(%rbp)
1408248ec:     	movq	%rdx, 0x338(%rbp)
1408248f3:     	movq	%r8, 0x340(%rbp)
1408248fa:     	movl	%r9d, 0x348(%rbp)
140824901:     	movq	%r14, 0x20(%rsp)
140824906:     	leaq	0x51dd9a7(%rip), %r8    # 0x145a022b4
14082490d:     	leaq	0xd0(%rbp), %rcx
140824914:     	movl	$0x4, %r9d
14082491a:     	movq	%rdi, %rdx
14082491d:     	callq	0x140bccfa0 <.text+0xbcbfa0>
140824922:     	movq	0xd0(%rbp), %rax
140824929:     	testq	%rax, %rax
14082492c:     	je	0x14082495a <.text+0x82395a>
14082492e:     	lock
14082492f:     	decq	(%rax)
140824932:     	jne	0x140824941 <.text+0x823941>
140824934:     	leaq	0xd0(%rbp), %rcx
14082493b:     	callq	0x143df8960 <.text+0x3df7960>
140824940:     	nop
140824941:     	movq	0xd8(%rbp), %rax
140824948:     	lock
140824949:     	decq	(%rax)
14082494c:     	jne	0x14082495a <.text+0x82395a>
14082494e:     	leaq	0xd8(%rbp), %rcx
140824955:     	callq	0x143df83c0 <.text+0x3df73c0>
14082495a:     	movl	0x4(%rbp), %ebx
14082495d:     	movq	-0x18(%rbp), %r12
140824961:     	movq	-0x8(%rbp), %rax
140824965:     	movl	0x24(%rbp), %ecx
140824968:     	movq	0x18(%rbp), %rdx
14082496c:     	movq	%rdx, 0x620(%rbp)
140824973:     	movq	0x8(%rbp), %rdx
140824977:     	movq	%rdx, 0x530(%rbp)
14082497e:     	movl	0x44(%rbp), %edx
140824981:     	movl	%edx, 0x538(%rbp)
140824987:     	movq	0x38(%rbp), %rdx
14082498b:     	movq	%rdx, 0x2f0(%rbp)
140824992:     	movq	0x28(%rbp), %rdx
140824996:     	movq	%rdx, 0x2f8(%rbp)
14082499d:     	movaps	0x51d328c(%rip), %xmm6  # 0x1459f7c30
1408249a4:     	movaps	0x51d3295(%rip), %xmm7  # 0x1459f7c40
1408249ab:     	movaps	0x51d2c4d(%rip), %xmm8  # 0x1459f7600
1408249b3:     	movabsq	$0x10000000100, %rdx    # imm = 0x10000000100
1408249bd:     	leaq	0x51dda6c(%rip), %r9    # 0x145a02430
1408249c4:     	leaq	0xd0(%rbp), %rsi
1408249cb:     	xorl	%r15d, %r15d
1408249ce:     	xorl	%r13d, %r13d
1408249d1:     	movq	%r12, 0x300(%rbp)
1408249d8:     	movq	%rax, 0x308(%rbp)
1408249df:     	movl	%ecx, 0x630(%rbp)
1408249e5:     	movl	%ebx, 0x5bc(%rbp)
1408249eb:     	cmpq	$0xe0, %r13
1408249f2:     	je	0x1408251ab <.text+0x8241ab>
1408249f8:     	movl	%ebx, (%rax)
1408249fa:     	movq	%rdx, 0x540(%rbp)
140824a01:     	movl	$0x1, 0x548(%rbp)
140824a0b:     	movl	$0x28, 0x330(%rbp)
140824a15:     	movq	%r14, 0x28(%rsp)
140824a1a:     	movb	$0x3, 0x30(%rsp)
140824a1f:     	movq	$0x8, 0x20(%rsp)
140824a28:     	movq	%rsi, %rcx
140824a2b:     	leaq	0x540(%rbp), %rdx
140824a32:     	movl	$0x1, %r8d
140824a38:     	callq	0x1448c9eb0 <.text+0x48c8eb0>
140824a3d:     	movl	$0x16, 0x194(%rbp)
140824a47:     	movq	0x50(%r12), %rcx
140824a4c:     	addq	$0x10, %rcx
140824a50:     	movb	$0x1, 0x63e(%rbp)
140824a57:     	callq	0x144966220 <.text+0x4965220>
140824a5c:     	nop
140824a5d:     	movl	%eax, %esi
140824a5f:     	movl	%edx, %edi
140824a61:     	movl	$0xe0, %r8d
140824a67:     	movq	%r14, %rcx
140824a6a:     	leaq	0xd0(%rbp), %rdx
140824a71:     	callq	0x145756ddd <.text+0x5755ddd>
140824a76:     	movb	$0x0, 0x63e(%rbp)
140824a7d:     	movq	%r14, 0x20(%rsp)
140824a82:     	leaq	0x540(%rbp), %rcx
140824a89:     	movq	%r12, %rdx
140824a8c:     	movl	%esi, %r8d
140824a8f:     	movl	%edi, %r9d
140824a92:     	callq	0x140f91ff0 <.text+0xf90ff0>
140824a97:     	nop
140824a98:     	cmpl	$0x2, 0x540(%rbp)
140824a9f:     	jne	0x140826c6a <.text+0x825c6a>
140824aa5:     	movq	$-0x1, 0x330(%rbp)
140824ab0:     	movb	$0x0, 0x63e(%rbp)
140824ab7:     	movq	%r14, 0x20(%rsp)
140824abc:     	movq	$0x0, 0x28(%rsp)
140824ac5:     	movq	%r12, %rcx
140824ac8:     	movl	%esi, %edx
140824aca:     	movl	%edi, %r8d
140824acd:     	xorl	%r9d, %r9d
140824ad0:     	callq	0x144978da0 <.text+0x4977da0>
140824ad5:     	nop
140824ad6:     	leaq	0x10(%r13), %rbx
140824ada:     	leaq	0x1(%r15), %rdi
140824ade:     	movq	%rax, 0x5d0(%rbp)
140824ae5:     	movb	$0x0, 0x5c8(%rbp)
140824aec:     	movl	0x630(%rbp), %ecx
140824af2:     	movq	0x620(%rbp), %rdx
140824af9:     	movl	%ecx, (%rdx)
140824afb:     	leaq	0x51dd816(%rip), %rcx   # 0x145a02318
140824b02:     	movq	0x8(%r13,%rcx), %r14
140824b07:     	testq	%r14, %r14
140824b0a:     	js	0x140825cd0 <.text+0x824cd0>
140824b10:     	movq	(%r13,%rcx), %rcx
140824b15:     	movq	%rcx, 0x5c0(%rbp)
140824b1c:     	je	0x140824b59 <.text+0x823b59>
140824b1e:     	movq	%rax, %rsi
140824b21:     	callq	0x140002200 <.text+0x1200>
140824b26:     	movl	$0x1, %edx
140824b2b:     	movq	%r14, %rcx
140824b2e:     	callq	0x1400021c0 <.text+0x11c0>
140824b33:     	testq	%rax, %rax
140824b36:     	je	0x140826d98 <.text+0x825d98>
140824b3c:     	movq	%rax, %rcx
140824b3f:     	movq	0x5c0(%rbp), %rdx
140824b46:     	movq	%rax, %r13
140824b49:     	movq	%r14, %r8
140824b4c:     	callq	0x145756ddd <.text+0x5755ddd>
140824b51:     	movq	%r13, %rcx
140824b54:     	movq	%rsi, %rax
140824b57:     	jmp	0x140824b5e <.text+0x823b5e>
140824b59:     	movl	$0x1, %ecx
140824b5e:     	movq	%r14, 0x540(%rbp)
140824b65:     	movq	%rcx, 0x318(%rbp)
140824b6c:     	movq	%rcx, 0x548(%rbp)
140824b73:     	movq	%r14, 0x550(%rbp)
140824b7a:     	lock
140824b7b:     	incq	(%rax)
140824b7e:     	leaq	0xd0(%rbp), %rsi
140824b85:     	jle	0x140826ed5 <.text+0x825ed5>
140824b8b:     	movb	$0x0, 0x338(%rbp)
140824b92:     	movq	%rax, 0x340(%rbp)
140824b99:     	movq	$0x0, 0x330(%rbp)
140824ba4:     	movb	$0x1, 0x63f(%rbp)
140824bab:     	movq	%rsi, %rcx
140824bae:     	movq	0x530(%rbp), %rdx
140824bb5:     	leaq	0x540(%rbp), %r8
140824bbc:     	leaq	0x330(%rbp), %r9
140824bc3:     	callq	0x140bc9440 <.text+0xbc8440>
140824bc8:     	nop
140824bc9:     	movq	0xd0(%rbp), %rax
140824bd0:     	cmpq	$0x2, %rax
140824bd4:     	je	0x140824c30 <.text+0x823c30>
140824bd6:     	testq	%rax, %rax
140824bd9:     	je	0x140824bfb <.text+0x823bfb>
140824bdb:     	movq	0xd8(%rbp), %rdx
140824be2:     	testq	%rdx, %rdx
140824be5:     	je	0x140824c30 <.text+0x823c30>
140824be7:     	movq	0xe0(%rbp), %rcx
140824bee:     	movl	$0x1, %r8d
140824bf4:     	callq	0x1400021d0 <.text+0x11d0>
140824bf9:     	jmp	0x140824c30 <.text+0x823c30>
140824bfb:     	cmpb	$0x0, 0xd8(%rbp)
140824c02:     	jne	0x140824c30 <.text+0x823c30>
140824c04:     	movq	0xe0(%rbp), %rax
140824c0b:     	lock
140824c0c:     	decq	(%rax)
140824c0f:     	jne	0x140824c30 <.text+0x823c30>
140824c11:     	movb	$0x1, 0x63f(%rbp)
140824c18:     	leaq	0xe0(%rbp), %rcx
140824c1f:     	callq	0x1449886d0 <.text+0x49876d0>
140824c24:     	nop
140824c25:     	nopw	%cs:(%rax,%rax)
140824c30:     	leaq	0x2(%r15), %rdx
140824c34:     	movb	$0x1, 0x63f(%rbp)
140824c3b:     	leaq	0x608(%rbp), %rcx
140824c42:     	callq	0x144318a40 <.text+0x4317a40>
140824c47:     	nop
140824c48:     	movq	0x618(%rbp), %rax
140824c4f:     	leaq	0x608(%rbp), %rdx
140824c56:     	cmpq	$0x2, %rax
140824c5a:     	jb	0x140824c6a <.text+0x823c6a>
140824c5c:     	movq	0x608(%rbp), %rdx
140824c63:     	movq	0x610(%rbp), %rax
140824c6a:     	leaq	(%rdx,%rax,8), %r8
140824c6e:     	movq	$0x0, 0xe0(%rbp)
140824c79:     	movq	%rsi, %rcx
140824c7c:     	callq	0x1409aca00 <.text+0x9aba00>
140824c81:     	nop
140824c82:     	movq	0xe0(%rbp), %rax
140824c89:     	leaq	0x368(%rbp), %rcx
140824c90:     	movq	%rax, 0x10(%rcx)
140824c94:     	movups	0xd0(%rbp), %xmm0
140824c9b:     	movups	%xmm0, (%rcx)
140824c9e:     	movaps	0x51d494b(%rip), %xmm0  # 0x1459f95f0
140824ca5:     	movaps	%xmm0, 0x330(%rbp)
140824cac:     	movaps	0x51d494d(%rip), %xmm0  # 0x1459f9600
140824cb3:     	movaps	%xmm0, 0x340(%rbp)
140824cba:     	movaps	0x51d494f(%rip), %xmm0  # 0x1459f9610
140824cc1:     	movaps	%xmm0, 0x350(%rbp)
140824cc8:     	movb	$0x2, 0x360(%rbp)
140824ccf:     	movb	$0x1, 0x643(%rbp)
140824cd6:     	movq	%rsi, %rcx
140824cd9:     	leaq	-0x40(%rbp), %rdx
140824cdd:     	leaq	0x330(%rbp), %r8
140824ce4:     	leaq	0x51dd7bd(%rip), %r9    # 0x145a024a8
140824ceb:     	callq	0x1404dc560 <.text+0x4db560>
140824cf0:     	nop
140824cf1:     	movq	0xd0(%rbp), %rsi
140824cf8:     	cmpb	$0x1, 0x5c8(%rbp)
140824cff:     	jne	0x140824d40 <.text+0x823d40>
140824d01:     	leaq	0x5d0(%rbp), %rcx
140824d08:     	movl	-0x7(%rcx), %eax
140824d0b:     	movl	-0x4(%rcx), %ecx
140824d0e:     	movl	%ecx, 0xd3(%rbp)
140824d14:     	movl	%eax, 0xd0(%rbp)
140824d1a:     	movq	0x5d0(%rbp), %rax
140824d21:     	movq	0x320(%rbp), %r10
140824d28:     	movb	0x5d8(%rbp), %r10b
140824d2f:     	movb	$0x1, %cl
140824d31:     	jmp	0x140824d5a <.text+0x823d5a>
140824d33:     	nopw	%cs:(%rax,%rax)
140824d40:     	movq	0x5d0(%rbp), %rax
140824d47:     	lock
140824d48:     	incq	(%rax)
140824d4b:     	movq	0x320(%rbp), %r10
140824d52:     	jle	0x140826ed5 <.text+0x825ed5>
140824d58:     	xorl	%ecx, %ecx
140824d5a:     	movl	0xd0(%rbp), %edx
140824d60:     	movl	0xd3(%rbp), %r8d
140824d67:     	leaq	0x541(%rbp), %r9
140824d6e:     	movl	%r8d, 0x3(%r9)
140824d72:     	movl	%edx, (%r9)
140824d75:     	movb	%cl, 0x540(%rbp)
140824d7b:     	movq	%rax, 0x548(%rbp)
140824d82:     	movq	%r10, 0x320(%rbp)
140824d89:     	movq	%r10, 0x550(%rbp)
140824d90:     	movl	$0x3f800000, 0x558(%rbp) # imm = 0x3F800000
140824d9a:     	movaps	%xmm6, 0xe0(%rbp)
140824da1:     	movaps	%xmm7, 0xf0(%rbp)
140824da8:     	movl	$0x6, 0xd0(%rbp)
140824db2:     	movq	0x618(%rbp), %rax
140824db9:     	leaq	0x608(%rbp), %rdx
140824dc0:     	cmpq	$0x2, %rax
140824dc4:     	jb	0x140824dd4 <.text+0x823dd4>
140824dc6:     	movq	0x608(%rbp), %rdx
140824dcd:     	movq	0x610(%rbp), %rax
140824dd4:     	leaq	(%rdx,%rax,8), %r8
140824dd8:     	movq	$0x0, 0x5f0(%rbp)
140824de3:     	leaq	0x5e0(%rbp), %rcx
140824dea:     	callq	0x1409aca00 <.text+0x9aba00>
140824def:     	nop
140824df0:     	leaq	0x340(%rbp), %r13
140824df7:     	movq	%rsi, 0x310(%rbp)
140824dfe:     	movq	0x5e0(%rbp), %rcx
140824e05:     	movups	0x5e8(%rbp), %xmm9
140824e0d:     	testq	%r14, %r14
140824e10:     	je	0x140824e59 <.text+0x823e59>
140824e12:     	movq	%rcx, 0x328(%rbp)
140824e19:     	movq	0x5f0(%rbp), %r12
140824e20:     	callq	0x140002200 <.text+0x1200>
140824e25:     	movl	$0x1, %edx
140824e2a:     	movq	%r14, %rcx
140824e2d:     	callq	0x1400021c0 <.text+0x11c0>
140824e32:     	testq	%rax, %rax
140824e35:     	je	0x140826da9 <.text+0x825da9>
140824e3b:     	movq	%rax, %rsi
140824e3e:     	movq	%rax, %rcx
140824e41:     	movq	0x5c0(%rbp), %rdx
140824e48:     	movq	%r14, %r8
140824e4b:     	callq	0x145756ddd <.text+0x5755ddd>
140824e50:     	movq	0x328(%rbp), %rcx
140824e57:     	jmp	0x140824e5e <.text+0x823e5e>
140824e59:     	movl	$0x1, %esi
140824e5e:     	addq	$-0x64, %r15
140824e62:     	movq	$0x0, 0x490(%rbp)
140824e6d:     	movq	$0x1, 0x498(%rbp)
140824e78:     	movl	$0x10, 0x4a0(%rbp)
140824e82:     	movb	$0x1, 0x4a4(%rbp)
140824e89:     	movw	$0x100, 0x4a8(%rbp)     # imm = 0x100
140824e92:     	movl	$0x2, 0x4ac(%rbp)
140824e9c:     	movl	$0x0, 0x330(%rbp)
140824ea6:     	movaps	0x51dd5d3(%rip), %xmm0  # 0x145a02480
140824ead:     	movaps	%xmm0, 0x30(%r13)
140824eb2:     	movaps	0x51dd5b7(%rip), %xmm0  # 0x145a02470
140824eb9:     	movaps	%xmm0, 0x20(%r13)
140824ebe:     	movaps	0x51dd59b(%rip), %xmm0  # 0x145a02460
140824ec5:     	movaps	%xmm0, 0x10(%r13)
140824eca:     	movaps	0x51dd57f(%rip), %xmm0  # 0x145a02450
140824ed1:     	movaps	%xmm0, (%r13)
140824ed6:     	movl	$0x0, 0x380(%rbp)
140824ee0:     	movl	$0x0, 0x38c(%rbp)
140824eea:     	movq	%r15, 0x3b0(%rbp)
140824ef1:     	movl	$0x0, 0x3b8(%rbp)
140824efb:     	movl	$0x0, 0x3d4(%rbp)
140824f05:     	movl	$0xa, 0x3f0(%rbp)
140824f0f:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
140824f14:     	movq	%rax, 0x418(%rbp)
140824f1b:     	movaps	%xmm8, 0x420(%rbp)
140824f23:     	movw	$0x1, 0x430(%rbp)
140824f2c:     	movb	$0x1, 0x432(%rbp)
140824f33:     	movups	0x540(%rbp), %xmm0
140824f3a:     	movups	0x550(%rbp), %xmm1
140824f41:     	leaq	0x368(%rbp), %rax
140824f48:     	movups	%xmm0, 0x108(%rax)
140824f4f:     	movups	%xmm1, 0x118(%rax)
140824f56:     	movl	$0x3f800000, 0x4c8(%rbp) # imm = 0x3F800000
140824f60:     	movb	$0x2, 0x4cc(%rbp)
140824f67:     	movaps	0xd0(%rbp), %xmm0
140824f6e:     	movaps	0xe0(%rbp), %xmm1
140824f75:     	movaps	0xf0(%rbp), %xmm2
140824f7c:     	movaps	%xmm0, 0xd8(%rax)
140824f83:     	movaps	%xmm1, 0xe8(%rax)
140824f8a:     	movaps	%xmm2, 0xf8(%rax)
140824f91:     	movq	%rcx, 0x4d0(%rbp)
140824f98:     	movups	%xmm9, 0x4d8(%rbp)
140824fa0:     	movq	%r14, 0x4e8(%rbp)
140824fa7:     	movq	%rsi, 0x4f0(%rbp)
140824fae:     	movq	%r14, 0x4f8(%rbp)
140824fb5:     	movb	$0x1, 0x643(%rbp)
140824fbc:     	leaq	0xd0(%rbp), %rcx
140824fc3:     	leaq	-0x40(%rbp), %rdx
140824fc7:     	leaq	0x330(%rbp), %r8
140824fce:     	leaq	0x51dd4eb(%rip), %r9    # 0x145a024c0
140824fd5:     	callq	0x1404df600 <.text+0x4de600>
140824fda:     	nop
140824fdb:     	movl	0x538(%rbp), %eax
140824fe1:     	movq	0x2f0(%rbp), %rcx
140824fe8:     	movl	%eax, (%rcx)
140824fea:     	testq	%r14, %r14
140824fed:     	je	0x140825021 <.text+0x824021>
140824fef:     	callq	0x140002200 <.text+0x1200>
140824ff4:     	movl	$0x1, %edx
140824ff9:     	movq	%r14, %rcx
140824ffc:     	callq	0x1400021c0 <.text+0x11c0>
140825001:     	testq	%rax, %rax
140825004:     	je	0x140826dc3 <.text+0x825dc3>
14082500a:     	movq	%rax, %rsi
14082500d:     	movq	%rax, %rcx
140825010:     	movq	0x5c0(%rbp), %rdx
140825017:     	movq	%r14, %r8
14082501a:     	callq	0x145756ddd <.text+0x5755ddd>
14082501f:     	jmp	0x140825026 <.text+0x824026>
140825021:     	movl	$0x1, %esi
140825026:     	movq	%r14, 0x540(%rbp)
14082502d:     	movq	%rsi, 0x548(%rbp)
140825034:     	movq	%r14, 0x550(%rbp)
14082503b:     	movq	0x618(%rbp), %rax
140825042:     	leaq	0x368(%rbp), %rcx
140825049:     	movq	%rax, 0x130(%rcx)
140825050:     	movups	0x608(%rbp), %xmm0
140825057:     	movups	%xmm0, 0x120(%rcx)
14082505e:     	movq	0x5d8(%rbp), %rax
140825065:     	movq	%rax, 0x110(%rcx)
14082506c:     	movups	0x5c8(%rbp), %xmm0
140825073:     	movups	%xmm0, 0x100(%rcx)
14082507a:     	movq	0x310(%rbp), %rax
140825081:     	movq	%rax, 0x480(%rbp)
140825088:     	movq	$-0x1, 0x3c0(%rbp)
140825093:     	movq	$0x0, 0x330(%rbp)
14082509e:     	movq	$-0x1, 0x3f0(%rbp)
1408250a9:     	movq	$0x0, 0x4a0(%rbp)
1408250b4:     	movq	$0x0, 0x3a8(%rbp)
1408250bf:     	movq	$0x8, 0x3b0(%rbp)
1408250ca:     	movq	$0x0, 0x3b8(%rbp)
1408250d5:     	movq	$0x0, 0x340(%rbp)
1408250e0:     	movq	$0x0, 0x350(%rbp)
1408250eb:     	movq	$0x3f800000, 0x4a8(%rbp) # imm = 0x3F800000
1408250f6:     	movq	$0x0, 0x360(%rbp)
140825101:     	movq	$0x0, 0x378(%rbp)
14082510c:     	movl	$0x0, 0x390(%rbp)
140825116:     	movl	$0x0, 0x398(%rbp)
140825120:     	movw	$0x0, 0x3a0(%rbp)
140825129:     	movb	$0x0, 0x4b0(%rbp)
140825130:     	movb	$0x0, 0x643(%rbp)
140825137:     	leaq	0xd0(%rbp), %rsi
14082513e:     	movq	%rsi, %rcx
140825141:     	movq	0x2f8(%rbp), %rdx
140825148:     	leaq	0x540(%rbp), %r8
14082514f:     	leaq	0x330(%rbp), %r9
140825156:     	callq	0x140bc9770 <.text+0xbc8770>
14082515b:     	nop
14082515c:     	movb	$0x0, 0x643(%rbp)
140825163:     	movq	%rsi, %rcx
140825166:     	callq	0x14077c9c0 <.text+0x77b9c0>
14082516b:     	nop
14082516c:     	movq	%rdi, %r15
14082516f:     	movq	%rbx, %r13
140825172:     	leaq	0x330(%rbp), %r14
140825179:     	movl	0x5bc(%rbp), %ebx
14082517f:     	movq	0x300(%rbp), %r12
140825186:     	movq	0x308(%rbp), %rax
14082518d:     	movabsq	$0x10000000100, %rdx    # imm = 0x10000000100
140825197:     	leaq	0x51dd292(%rip), %r9    # 0x145a02430
14082519e:     	cmpq	$0xe0, %r13
1408251a5:     	jne	0x1408249f8 <.text+0x8239f8>
1408251ab:     	movq	$0x4, 0x548(%rbp)
1408251b6:     	leaq	0x550(%rbp), %rdx
1408251bd:     	leaq	0x51dd234(%rip), %rax   # 0x145a023f8
1408251c4:     	movq	%rax, 0x550(%rbp)
1408251cb:     	movq	$0x9, 0x558(%rbp)
1408251d6:     	movq	$0x10, 0x560(%rbp)
1408251e1:     	leaq	0x51dd219(%rip), %rax   # 0x145a02401
1408251e8:     	movq	%rax, 0x568(%rbp)
1408251ef:     	movq	$0x7, 0x570(%rbp)
1408251fa:     	movq	$0x11, 0x578(%rbp)
140825205:     	leaq	0x51dd1fc(%rip), %rax   # 0x145a02408
14082520c:     	movq	%rax, 0x580(%rbp)
140825213:     	movq	$0x7, 0x588(%rbp)
14082521e:     	movq	$0x12, 0x590(%rbp)
140825229:     	leaq	0x51dd1df(%rip), %rax   # 0x145a0240f
140825230:     	movq	%rax, 0x598(%rbp)
140825237:     	movq	$0x6, 0x5a0(%rbp)
140825242:     	movq	$0x13, 0x5a8(%rbp)
14082524d:     	movl	0x4(%rbp), %r8d
140825251:     	movq	-0x18(%rbp), %rax
140825255:     	movq	%rax, 0x630(%rbp)
14082525c:     	movq	-0x8(%rbp), %r10
140825260:     	movl	0x24(%rbp), %eax
140825263:     	movl	%eax, 0x5c0(%rbp)
140825269:     	movq	0x18(%rbp), %rax
14082526d:     	movq	%rax, 0x530(%rbp)
140825274:     	movq	0x8(%rbp), %rax
140825278:     	movq	%rax, 0x308(%rbp)
14082527f:     	movl	0x44(%rbp), %eax
140825282:     	movl	%eax, 0x5bc(%rbp)
140825288:     	movq	0x38(%rbp), %rax
14082528c:     	movq	%rax, 0x318(%rbp)
140825293:     	movq	0x28(%rbp), %rax
140825297:     	movq	%rax, 0x320(%rbp)
14082529e:     	movabsq	$0x20000000200, %rcx    # imm = 0x20000000200
1408252a8:     	leaq	0x51dd181(%rip), %r9    # 0x145a02430
1408252af:     	leaq	0xd0(%rbp), %r14
1408252b6:     	leaq	0x5c8(%rbp), %r12
1408252bd:     	xorl	%r15d, %r15d
1408252c0:     	xorl	%eax, %eax
1408252c2:     	movl	%r8d, 0x310(%rbp)
1408252c9:     	movq	%r10, 0x328(%rbp)
1408252d0:     	cmpq	$0x4, %rax
1408252d4:     	je	0x140825ab2 <.text+0x824ab2>
1408252da:     	leaq	0x1(%rax), %r11
1408252de:     	movq	%r11, 0x540(%rbp)
1408252e5:     	leaq	(%rax,%rax,2), %rax
1408252e9:     	movq	(%rdx,%rax,8), %rsi
1408252ed:     	movq	%rsi, 0x620(%rbp)
1408252f4:     	testq	%rsi, %rsi
1408252f7:     	je	0x140825ab2 <.text+0x824ab2>
1408252fd:     	movq	%r11, 0x2f8(%rbp)
140825304:     	movq	%r12, %r13
140825307:     	leaq	(%rdx,%rax,8), %rax
14082530b:     	movq	0x8(%rax), %rdi
14082530f:     	movq	0x10(%rax), %rax
140825313:     	movq	%rax, 0x538(%rbp)
14082531a:     	movq	%r15, 0x2f0(%rbp)
140825321:     	leaq	0x1(%r15), %rax
140825325:     	movq	%rax, 0x300(%rbp)
14082532c:     	movq	%rax, 0x5b0(%rbp)
140825333:     	movl	%r8d, (%r10)
140825336:     	movq	%rcx, 0x5e0(%rbp)
14082533d:     	movl	$0x1, 0x5e8(%rbp)
140825347:     	movl	$0x28, 0x330(%rbp)
140825351:     	leaq	0x330(%rbp), %rax
140825358:     	movq	%rax, 0x28(%rsp)
14082535d:     	movb	$0x3, 0x30(%rsp)
140825362:     	movq	$0x8, 0x20(%rsp)
14082536b:     	movq	%r14, %r12
14082536e:     	movq	%r14, %rcx
140825371:     	leaq	0x5e0(%rbp), %rdx
140825378:     	movl	$0x1, %r8d
14082537e:     	callq	0x1448c9eb0 <.text+0x48c8eb0>
140825383:     	movl	$0x16, 0x194(%rbp)
14082538d:     	movq	0x630(%rbp), %rax
140825394:     	movq	0x50(%rax), %rcx
140825398:     	addq	$0x10, %rcx
14082539c:     	movb	$0x1, 0x63b(%rbp)
1408253a3:     	callq	0x144966220 <.text+0x4965220>
1408253a8:     	nop
1408253a9:     	movl	%eax, %esi
1408253ab:     	movl	%edx, %r15d
1408253ae:     	movl	$0xe0, %r8d
1408253b4:     	leaq	0x330(%rbp), %rbx
1408253bb:     	movq	%rbx, %rcx
1408253be:     	movq	%r12, %rdx
1408253c1:     	callq	0x145756ddd <.text+0x5755ddd>
1408253c6:     	movb	$0x0, 0x63b(%rbp)
1408253cd:     	movq	%rbx, 0x20(%rsp)
1408253d2:     	movq	0x630(%rbp), %rdx
1408253d9:     	leaq	0x5e0(%rbp), %rcx
1408253e0:     	movl	%esi, %r8d
1408253e3:     	movl	%r15d, %r9d
1408253e6:     	callq	0x140f91ff0 <.text+0xf90ff0>
1408253eb:     	nop
1408253ec:     	cmpl	$0x2, 0x5e0(%rbp)
1408253f3:     	jne	0x140826cb0 <.text+0x825cb0>
1408253f9:     	movq	$-0x1, 0x330(%rbp)
140825404:     	movb	$0x0, 0x63b(%rbp)
14082540b:     	leaq	0x330(%rbp), %rax
140825412:     	movq	%rax, 0x20(%rsp)
140825417:     	movq	$0x0, 0x28(%rsp)
140825420:     	movq	0x630(%rbp), %rcx
140825427:     	movl	%esi, %edx
140825429:     	movl	%r15d, %r8d
14082542c:     	xorl	%r9d, %r9d
14082542f:     	callq	0x144978da0 <.text+0x4977da0>
140825434:     	nop
140825435:     	movq	%rax, 0x2e0(%rbp)
14082543c:     	movb	$0x0, 0x2d8(%rbp)
140825443:     	movl	0x5c0(%rbp), %ecx
140825449:     	movq	0x530(%rbp), %rdx
140825450:     	movl	%ecx, (%rdx)
140825452:     	testq	%rdi, %rdi
140825455:     	js	0x140825ceb <.text+0x824ceb>
14082545b:     	je	0x140825498 <.text+0x824498>
14082545d:     	movq	%rax, %rsi
140825460:     	callq	0x140002200 <.text+0x1200>
140825465:     	movl	$0x1, %edx
14082546a:     	movq	%rdi, %rcx
14082546d:     	callq	0x1400021c0 <.text+0x11c0>
140825472:     	testq	%rax, %rax
140825475:     	je	0x140826ddd <.text+0x825ddd>
14082547b:     	movq	%rax, %r15
14082547e:     	movq	%r12, %r14
140825481:     	movq	%rax, %rcx
140825484:     	movq	0x620(%rbp), %rdx
14082548b:     	movq	%rdi, %r8
14082548e:     	callq	0x145756ddd <.text+0x5755ddd>
140825493:     	movq	%rsi, %rax
140825496:     	jmp	0x1408254a1 <.text+0x8244a1>
140825498:     	movl	$0x1, %r15d
14082549e:     	movq	%r12, %r14
1408254a1:     	movq	%r13, %r12
1408254a4:     	movq	%rdi, 0x5e0(%rbp)
1408254ab:     	movq	%r15, 0x2c8(%rbp)
1408254b2:     	movq	%r15, 0x5e8(%rbp)
1408254b9:     	movq	%rdi, 0x5f0(%rbp)
1408254c0:     	lock
1408254c1:     	incq	(%rax)
1408254c4:     	jle	0x140826ed5 <.text+0x825ed5>
1408254ca:     	movb	$0x0, 0x338(%rbp)
1408254d1:     	movq	%rax, 0x340(%rbp)
1408254d8:     	movq	$0x0, 0x330(%rbp)
1408254e3:     	movb	$0x1, 0x640(%rbp)
1408254ea:     	movq	%r14, %rcx
1408254ed:     	movq	0x308(%rbp), %rdx
1408254f4:     	leaq	0x5e0(%rbp), %r8
1408254fb:     	leaq	0x330(%rbp), %r9
140825502:     	callq	0x140bc9440 <.text+0xbc8440>
140825507:     	nop
140825508:     	movq	0xd0(%rbp), %rax
14082550f:     	cmpq	$0x2, %rax
140825513:     	je	0x140825564 <.text+0x824564>
140825515:     	testq	%rax, %rax
140825518:     	je	0x14082553a <.text+0x82453a>
14082551a:     	movq	0xd8(%rbp), %rdx
140825521:     	testq	%rdx, %rdx
140825524:     	je	0x140825564 <.text+0x824564>
140825526:     	movq	0xe0(%rbp), %rcx
14082552d:     	movl	$0x1, %r8d
140825533:     	callq	0x1400021d0 <.text+0x11d0>
140825538:     	jmp	0x140825564 <.text+0x824564>
14082553a:     	cmpb	$0x0, 0xd8(%rbp)
140825541:     	jne	0x140825564 <.text+0x824564>
140825543:     	movq	0xe0(%rbp), %rax
14082554a:     	lock
14082554b:     	decq	(%rax)
14082554e:     	jne	0x140825564 <.text+0x824564>
140825550:     	movb	$0x1, 0x640(%rbp)
140825557:     	leaq	0xe0(%rbp), %rcx
14082555e:     	callq	0x1449886d0 <.text+0x49876d0>
140825563:     	nop
140825564:     	movb	$0x1, 0x640(%rbp)
14082556b:     	movq	%r12, %rcx
14082556e:     	movq	0x538(%rbp), %rdx
140825575:     	callq	0x144318a40 <.text+0x4317a40>
14082557a:     	nop
14082557b:     	movq	0x5d8(%rbp), %rax
140825582:     	movq	%r12, %rdx
140825585:     	cmpq	$0x2, %rax
140825589:     	jb	0x140825599 <.text+0x824599>
14082558b:     	movq	0x5c8(%rbp), %rdx
140825592:     	movq	0x5d0(%rbp), %rax
140825599:     	leaq	(%rdx,%rax,8), %r8
14082559d:     	movq	$0x0, 0xe0(%rbp)
1408255a8:     	movq	%r14, %rcx
1408255ab:     	callq	0x1409aca00 <.text+0x9aba00>
1408255b0:     	nop
1408255b1:     	movq	0xe0(%rbp), %rax
1408255b8:     	leaq	0x368(%rbp), %rcx
1408255bf:     	movq	%rax, 0x10(%rcx)
1408255c3:     	movups	0xd0(%rbp), %xmm0
1408255ca:     	movups	%xmm0, (%rcx)
1408255cd:     	movaps	0x51d401c(%rip), %xmm0  # 0x1459f95f0
1408255d4:     	movaps	%xmm0, 0x330(%rbp)
1408255db:     	movaps	0x51d401e(%rip), %xmm0  # 0x1459f9600
1408255e2:     	movaps	%xmm0, 0x340(%rbp)
1408255e9:     	movaps	0x51d4020(%rip), %xmm0  # 0x1459f9610
1408255f0:     	movaps	%xmm0, 0x350(%rbp)
1408255f7:     	movb	$0x2, 0x360(%rbp)
1408255fe:     	movb	$0x1, 0x644(%rbp)
140825605:     	movq	%r14, %rcx
140825608:     	leaq	-0x40(%rbp), %rdx
14082560c:     	leaq	0x330(%rbp), %r8
140825613:     	leaq	0x51dcdfe(%rip), %r9    # 0x145a02418
14082561a:     	callq	0x1404dc560 <.text+0x4db560>
14082561f:     	nop
140825620:     	movq	0xd0(%rbp), %r15
140825627:     	cmpb	$0x1, 0x2d8(%rbp)
14082562e:     	jne	0x140825662 <.text+0x824662>
140825630:     	leaq	0x2e0(%rbp), %rcx
140825637:     	movl	-0x7(%rcx), %eax
14082563a:     	movl	-0x4(%rcx), %ecx
14082563d:     	movl	%ecx, 0xd3(%rbp)
140825643:     	movl	%eax, 0xd0(%rbp)
140825649:     	movq	0x2e0(%rbp), %rax
140825650:     	movq	0x2d0(%rbp), %r10
140825657:     	movb	0x2e8(%rbp), %r10b
14082565e:     	movb	$0x1, %cl
140825660:     	jmp	0x14082567c <.text+0x82467c>
140825662:     	movq	0x2e0(%rbp), %rax
140825669:     	lock
14082566a:     	incq	(%rax)
14082566d:     	movq	0x2d0(%rbp), %r10
140825674:     	jle	0x140826ed5 <.text+0x825ed5>
14082567a:     	xorl	%ecx, %ecx
14082567c:     	movl	0xd0(%rbp), %edx
140825682:     	movl	0xd3(%rbp), %r8d
140825689:     	leaq	0x5e1(%rbp), %r9
140825690:     	movl	%r8d, 0x3(%r9)
140825694:     	movl	%edx, (%r9)
140825697:     	movb	%cl, 0x5e0(%rbp)
14082569d:     	movq	%rax, 0x5e8(%rbp)
1408256a4:     	movq	%r10, 0x2d0(%rbp)
1408256ab:     	movq	%r10, 0x5f0(%rbp)
1408256b2:     	movl	$0x3f800000, 0x5f8(%rbp) # imm = 0x3F800000
1408256bc:     	movaps	%xmm6, 0xe0(%rbp)
1408256c3:     	movaps	%xmm7, 0xf0(%rbp)
1408256ca:     	movl	$0x6, 0xd0(%rbp)
1408256d4:     	movq	0x5d8(%rbp), %rax
1408256db:     	movq	%r12, %rdx
1408256de:     	cmpq	$0x2, %rax
1408256e2:     	jb	0x1408256f2 <.text+0x8246f2>
1408256e4:     	movq	0x5c8(%rbp), %rdx
1408256eb:     	movq	0x5d0(%rbp), %rax
1408256f2:     	leaq	(%rdx,%rax,8), %r8
1408256f6:     	movq	$0x0, 0x618(%rbp)
140825701:     	leaq	0x608(%rbp), %rcx
140825708:     	callq	0x1409aca00 <.text+0x9aba00>
14082570d:     	nop
14082570e:     	movq	0x608(%rbp), %rbx
140825715:     	movups	0x610(%rbp), %xmm8
14082571d:     	testq	%rdi, %rdi
140825720:     	je	0x14082575b <.text+0x82475b>
140825722:     	movq	0x618(%rbp), %rsi
140825729:     	callq	0x140002200 <.text+0x1200>
14082572e:     	movl	$0x1, %edx
140825733:     	movq	%rdi, %rcx
140825736:     	callq	0x1400021c0 <.text+0x11c0>
14082573b:     	testq	%rax, %rax
14082573e:     	je	0x140826dee <.text+0x825dee>
140825744:     	movq	%rax, %r13
140825747:     	movq	%rax, %rcx
14082574a:     	movq	0x620(%rbp), %rdx
140825751:     	movq	%rdi, %r8
140825754:     	callq	0x145756ddd <.text+0x5755ddd>
140825759:     	jmp	0x140825761 <.text+0x824761>
14082575b:     	movl	$0x1, %r13d
140825761:     	movq	0x2f0(%rbp), %rcx
140825768:     	addq	$-0x56, %rcx
14082576c:     	movq	$0x0, 0x490(%rbp)
140825777:     	movq	$0x1, 0x498(%rbp)
140825782:     	movl	$0x10, 0x4a0(%rbp)
14082578c:     	movb	$0x1, 0x4a4(%rbp)
140825793:     	movw	$0x100, 0x4a8(%rbp)     # imm = 0x100
14082579c:     	movl	$0x2, 0x4ac(%rbp)
1408257a6:     	movl	$0x0, 0x330(%rbp)
1408257b0:     	movaps	0x51dccc9(%rip), %xmm0  # 0x145a02480
1408257b7:     	leaq	0x340(%rbp), %rax
1408257be:     	movaps	%xmm0, 0x30(%rax)
1408257c2:     	movaps	0x51dcca7(%rip), %xmm0  # 0x145a02470
1408257c9:     	movaps	%xmm0, 0x20(%rax)
1408257cd:     	movaps	0x51dcc8c(%rip), %xmm0  # 0x145a02460
1408257d4:     	movaps	%xmm0, 0x10(%rax)
1408257d8:     	movaps	0x51dcc71(%rip), %xmm0  # 0x145a02450
1408257df:     	movaps	%xmm0, (%rax)
1408257e2:     	movl	$0x0, 0x380(%rbp)
1408257ec:     	movl	$0x0, 0x38c(%rbp)
1408257f6:     	movq	%rcx, 0x3b0(%rbp)
1408257fd:     	movl	$0x0, 0x3b8(%rbp)
140825807:     	movl	$0x0, 0x3d4(%rbp)
140825811:     	movl	$0xa, 0x3f0(%rbp)
14082581b:     	movl	$0xffffffff, 0x418(%rbp) # imm = 0xFFFFFFFF
140825825:     	movups	0x51dcc0c(%rip), %xmm0  # 0x145a02438
14082582c:     	leaq	0x41c(%rbp), %rax
140825833:     	movups	%xmm0, (%rax)
140825836:     	movl	$0x0, 0x10(%rax)
14082583d:     	movw	$0x1, 0x430(%rbp)
140825846:     	movb	$0x1, 0x432(%rbp)
14082584d:     	movups	0x5e0(%rbp), %xmm0
140825854:     	movups	0x5f0(%rbp), %xmm1
14082585b:     	leaq	0x368(%rbp), %rax
140825862:     	movups	%xmm0, 0x108(%rax)
140825869:     	movups	%xmm1, 0x118(%rax)
140825870:     	movl	$0x0, 0x4c8(%rbp)
14082587a:     	movb	$0x2, 0x4cc(%rbp)
140825881:     	movaps	0xd0(%rbp), %xmm0
140825888:     	movaps	0xe0(%rbp), %xmm1
14082588f:     	movaps	0xf0(%rbp), %xmm2
140825896:     	movaps	%xmm0, 0xd8(%rax)
14082589d:     	movaps	%xmm1, 0xe8(%rax)
1408258a4:     	movaps	%xmm2, 0xf8(%rax)
1408258ab:     	movq	%rbx, 0x4d0(%rbp)
1408258b2:     	movups	%xmm8, 0x4d8(%rbp)
1408258ba:     	movq	%rdi, 0x4e8(%rbp)
1408258c1:     	movq	%r13, 0x4f0(%rbp)
1408258c8:     	movq	%rdi, 0x4f8(%rbp)
1408258cf:     	movb	$0x1, 0x644(%rbp)
1408258d6:     	movq	%r14, %rcx
1408258d9:     	leaq	-0x40(%rbp), %rdx
1408258dd:     	leaq	0x330(%rbp), %r8
1408258e4:     	leaq	0x51dcba5(%rip), %r9    # 0x145a02490
1408258eb:     	callq	0x1404df600 <.text+0x4de600>
1408258f0:     	nop
1408258f1:     	movl	0x5bc(%rbp), %eax
1408258f7:     	movq	0x318(%rbp), %rcx
1408258fe:     	movl	%eax, (%rcx)
140825900:     	testq	%rdi, %rdi
140825903:     	je	0x140825937 <.text+0x824937>
140825905:     	callq	0x140002200 <.text+0x1200>
14082590a:     	movl	$0x1, %edx
14082590f:     	movq	%rdi, %rcx
140825912:     	callq	0x1400021c0 <.text+0x11c0>
140825917:     	testq	%rax, %rax
14082591a:     	je	0x140826e0f <.text+0x825e0f>
140825920:     	movq	%rax, %rsi
140825923:     	movq	%rax, %rcx
140825926:     	movq	0x620(%rbp), %rdx
14082592d:     	movq	%rdi, %r8
140825930:     	callq	0x145756ddd <.text+0x5755ddd>
140825935:     	jmp	0x14082593c <.text+0x82493c>
140825937:     	movl	$0x1, %esi
14082593c:     	movq	%rdi, 0x5e0(%rbp)
140825943:     	movq	%rsi, 0x5e8(%rbp)
14082594a:     	movq	%rdi, 0x5f0(%rbp)
140825951:     	movq	0x5d8(%rbp), %rax
140825958:     	leaq	0x368(%rbp), %rcx
14082595f:     	movq	%rax, 0x130(%rcx)
140825966:     	movups	0x5c8(%rbp), %xmm0
14082596d:     	movups	%xmm0, 0x120(%rcx)
140825974:     	movq	0x2e8(%rbp), %rax
14082597b:     	movq	%rax, 0x110(%rcx)
140825982:     	movups	0x2d8(%rbp), %xmm0
140825989:     	movups	%xmm0, 0x100(%rcx)
140825990:     	movq	%r15, 0x480(%rbp)
140825997:     	movq	$-0x1, 0x3c0(%rbp)
1408259a2:     	movq	$0x0, 0x330(%rbp)
1408259ad:     	movq	$-0x1, 0x3f0(%rbp)
1408259b8:     	movq	$0x0, 0x4a0(%rbp)
1408259c3:     	movq	$0x0, 0x3a8(%rbp)
1408259ce:     	movq	$0x8, 0x3b0(%rbp)
1408259d9:     	movq	$0x0, 0x3b8(%rbp)
1408259e4:     	movq	$0x0, 0x340(%rbp)
1408259ef:     	movq	$0x0, 0x350(%rbp)
1408259fa:     	movq	$0x3f800000, 0x4a8(%rbp) # imm = 0x3F800000
140825a05:     	movq	$0x0, 0x360(%rbp)
140825a10:     	movq	$0x0, 0x378(%rbp)
140825a1b:     	movl	$0x0, 0x390(%rbp)
140825a25:     	movl	$0x0, 0x398(%rbp)
140825a2f:     	movw	$0x0, 0x3a0(%rbp)
140825a38:     	movb	$0x0, 0x4b0(%rbp)
140825a3f:     	movb	$0x0, 0x644(%rbp)
140825a46:     	movq	%r14, %rcx
140825a49:     	movq	0x320(%rbp), %rdx
140825a50:     	leaq	0x5e0(%rbp), %r8
140825a57:     	leaq	0x330(%rbp), %r9
140825a5e:     	callq	0x140bc9770 <.text+0xbc8770>
140825a63:     	nop
140825a64:     	movb	$0x0, 0x644(%rbp)
140825a6b:     	movq	%r14, %rcx
140825a6e:     	callq	0x14077c9c0 <.text+0x77b9c0>
140825a73:     	nop
140825a74:     	movq	0x300(%rbp), %r15
140825a7b:     	movq	0x2f8(%rbp), %rax
140825a82:     	movabsq	$0x20000000200, %rcx    # imm = 0x20000000200
140825a8c:     	leaq	0x550(%rbp), %rdx
140825a93:     	movl	0x310(%rbp), %r8d
140825a9a:     	movq	0x328(%rbp), %r10
140825aa1:     	leaq	0x51dc988(%rip), %r9    # 0x145a02430
140825aa8:     	cmpq	$0x4, %rax
140825aac:     	jne	0x1408252da <.text+0x8242da>
140825ab2:     	movl	0x4(%rbp), %eax
140825ab5:     	movq	-0x8(%rbp), %rcx
140825ab9:     	movl	%eax, 0x5c0(%rbp)
140825abf:     	movq	%rcx, 0x530(%rbp)
140825ac6:     	movl	%eax, (%rcx)
140825ac8:     	movq	-0x18(%rbp), %r14
140825acc:     	movq	0x18(%rbp), %rax
140825ad0:     	movl	0x24(%rbp), %ebx
140825ad3:     	movq	%rax, 0x538(%rbp)
140825ada:     	movl	%ebx, (%rax)
140825adc:     	movq	0x8(%rbp), %rax
140825ae0:     	movq	%rax, 0x630(%rbp)
140825ae7:     	movq	0x38(%rbp), %r12
140825aeb:     	movl	0x44(%rbp), %r13d
140825aef:     	movl	%r13d, (%r12)
140825af3:     	movq	0x28(%rbp), %rax
140825af7:     	movq	%rax, 0x620(%rbp)
140825afe:     	movabsq	$0x40000000400, %rax    # imm = 0x40000000400
140825b08:     	movq	%rax, 0x540(%rbp)
140825b0f:     	movl	$0x1, 0x548(%rbp)
140825b19:     	movl	$0x28, 0x330(%rbp)
140825b23:     	leaq	0x330(%rbp), %rdi
140825b2a:     	movq	%rdi, 0x28(%rsp)
140825b2f:     	movb	$0x3, 0x30(%rsp)
140825b34:     	movq	$0x8, 0x20(%rsp)
140825b3d:     	leaq	0x51dc8ec(%rip), %r9    # 0x145a02430
140825b44:     	leaq	0xd0(%rbp), %rcx
140825b4b:     	leaq	0x540(%rbp), %rdx
140825b52:     	movl	$0x1, %r8d
140825b58:     	callq	0x1448c9eb0 <.text+0x48c8eb0>
140825b5d:     	movl	$0x16, 0x194(%rbp)
140825b67:     	movq	0x50(%r14), %rcx
140825b6b:     	addq	$0x10, %rcx
140825b6f:     	movb	$0x1, 0x63d(%rbp)
140825b76:     	callq	0x144966220 <.text+0x4965220>
140825b7b:     	nop
140825b7c:     	movl	%eax, %esi
140825b7e:     	movl	%edx, %r15d
140825b81:     	leaq	0xd0(%rbp), %rdx
140825b88:     	movl	$0xe0, %r8d
140825b8e:     	movq	%rdi, %rcx
140825b91:     	callq	0x145756ddd <.text+0x5755ddd>
140825b96:     	movb	$0x0, 0x63d(%rbp)
140825b9d:     	movq	%rdi, 0x20(%rsp)
140825ba2:     	leaq	0x540(%rbp), %rcx
140825ba9:     	movq	%r14, %rdx
140825bac:     	movl	%esi, %r8d
140825baf:     	movl	%r15d, %r9d
140825bb2:     	callq	0x140f91ff0 <.text+0xf90ff0>
140825bb7:     	nop
140825bb8:     	cmpl	$0x2, 0x540(%rbp)
140825bbf:     	jne	0x140826cf6 <.text+0x825cf6>
140825bc5:     	movq	$-0x1, 0x330(%rbp)
140825bd0:     	movb	$0x0, 0x63d(%rbp)
140825bd7:     	leaq	0x330(%rbp), %rax
140825bde:     	movq	%rax, 0x20(%rsp)
140825be3:     	movq	$0x0, 0x28(%rsp)
140825bec:     	movq	%r14, %rcx
140825bef:     	movl	%esi, %edx
140825bf1:     	movl	%r15d, %r8d
140825bf4:     	xorl	%r9d, %r9d
140825bf7:     	callq	0x144978da0 <.text+0x4977da0>
140825bfc:     	nop
140825bfd:     	movq	%rax, %rsi
140825c00:     	movq	%rax, 0x5d0(%rbp)
140825c07:     	movb	$0x0, 0x5c8(%rbp)
140825c0e:     	callq	0x140002200 <.text+0x1200>
140825c13:     	movl	$0x4, %ecx
140825c18:     	movl	$0x1, %edx
140825c1d:     	callq	0x1400021c0 <.text+0x11c0>
140825c22:     	testq	%rax, %rax
140825c25:     	je	0x140826e29 <.text+0x825e29>
140825c2b:     	movl	$0x65756c67, (%rax)     # imm = 0x65756C67
140825c31:     	movq	$0x4, 0x540(%rbp)
140825c3c:     	movq	%rax, 0x548(%rbp)
140825c43:     	movq	$0x4, 0x550(%rbp)
140825c4e:     	lock
140825c4f:     	incq	(%rsi)
140825c52:     	jle	0x140826ed5 <.text+0x825ed5>
140825c58:     	movb	$0x0, 0x338(%rbp)
140825c5f:     	movq	%rsi, 0x340(%rbp)
140825c66:     	movq	$0x0, 0x330(%rbp)
140825c71:     	movb	$0x1, 0x642(%rbp)
140825c78:     	leaq	0xd0(%rbp), %rcx
140825c7f:     	leaq	0x540(%rbp), %r8
140825c86:     	leaq	0x330(%rbp), %r9
140825c8d:     	movq	0x630(%rbp), %rdx
140825c94:     	callq	0x140bc9440 <.text+0xbc8440>
140825c99:     	nop
140825c9a:     	movq	0xd0(%rbp), %rax
140825ca1:     	cmpq	$0x2, %rax
140825ca5:     	je	0x140825d30 <.text+0x824d30>
140825cab:     	testq	%rax, %rax
140825cae:     	je	0x140825d06 <.text+0x824d06>
140825cb0:     	movq	0xd8(%rbp), %rdx
140825cb7:     	testq	%rdx, %rdx
140825cba:     	je	0x140825d30 <.text+0x824d30>
140825cbc:     	movq	0xe0(%rbp), %rcx
140825cc3:     	movl	$0x1, %r8d
140825cc9:     	callq	0x1400021d0 <.text+0x11d0>
140825cce:     	jmp	0x140825d30 <.text+0x824d30>
140825cd0:     	xorl	%ecx, %ecx
140825cd2:     	movb	$0x1, 0x63f(%rbp)
140825cd9:     	movq	0x318(%rbp), %rdx
140825ce0:     	callq	0x1458e721b <.text+0x58e621b>
140825ce5:     	nop
140825ce6:     	jmp	0x140826ed5 <.text+0x825ed5>
140825ceb:     	xorl	%ecx, %ecx
140825ced:     	movb	$0x1, 0x640(%rbp)
140825cf4:     	movq	0x2c8(%rbp), %rdx
140825cfb:     	callq	0x1458e721b <.text+0x58e621b>
140825d00:     	nop
140825d01:     	jmp	0x140826ed5 <.text+0x825ed5>
140825d06:     	cmpb	$0x0, 0xd8(%rbp)
140825d0d:     	jne	0x140825d30 <.text+0x824d30>
140825d0f:     	movq	0xe0(%rbp), %rax
140825d16:     	lock
140825d17:     	decq	(%rax)
140825d1a:     	jne	0x140825d30 <.text+0x824d30>
140825d1c:     	leaq	0xe0(%rbp), %rcx
140825d23:     	movb	$0x1, 0x642(%rbp)
140825d2a:     	callq	0x1449886d0 <.text+0x49876d0>
140825d2f:     	nop
140825d30:     	movb	$0x1, 0x642(%rbp)
140825d37:     	leaq	0x608(%rbp), %rsi
140825d3e:     	movl	$0x14, %edx
140825d43:     	movq	%rsi, %rcx
140825d46:     	callq	0x144318a40 <.text+0x4317a40>
140825d4b:     	nop
140825d4c:     	movq	0x618(%rbp), %rax
140825d53:     	cmpq	$0x2, %rax
140825d57:     	jb	0x140825d67 <.text+0x824d67>
140825d59:     	movq	0x608(%rbp), %rsi
140825d60:     	movq	0x610(%rbp), %rax
140825d67:     	leaq	(%rsi,%rax,8), %r8
140825d6b:     	movq	$0x0, 0xe0(%rbp)
140825d76:     	leaq	0xd0(%rbp), %rcx
140825d7d:     	movq	%rsi, %rdx
140825d80:     	callq	0x1409aca00 <.text+0x9aba00>
140825d85:     	nop
140825d86:     	movq	0xe0(%rbp), %rax
140825d8d:     	movq	%rax, 0x378(%rbp)
140825d94:     	movups	0xd0(%rbp), %xmm0
140825d9b:     	movups	%xmm0, 0x368(%rbp)
140825da2:     	movaps	0x51d3846(%rip), %xmm8  # 0x1459f95f0
140825daa:     	movaps	%xmm8, 0x330(%rbp)
140825db2:     	movaps	0x51d3846(%rip), %xmm9  # 0x1459f9600
140825dba:     	movaps	%xmm9, 0x340(%rbp)
140825dc2:     	movaps	0x51d3846(%rip), %xmm10 # 0x1459f9610
140825dca:     	movaps	%xmm10, 0x350(%rbp)
140825dd2:     	movb	$0x2, 0x360(%rbp)
140825dd9:     	movb	$0x1, 0x647(%rbp)
140825de0:     	movb	$0x1, 0x646(%rbp)
140825de7:     	leaq	0x51de4e2(%rip), %r9    # 0x145a042d0
140825dee:     	leaq	0xd0(%rbp), %rcx
140825df5:     	leaq	-0x40(%rbp), %rdx
140825df9:     	leaq	0x330(%rbp), %r8
140825e00:     	callq	0x1404dc560 <.text+0x4db560>
140825e05:     	nop
140825e06:     	movq	0xd0(%rbp), %rsi
140825e0d:     	movaps	0x51de4dc(%rip), %xmm0  # 0x145a042f0
140825e14:     	movaps	%xmm0, 0x540(%rbp)
140825e1b:     	movl	$0x3f800000, 0x550(%rbp) # imm = 0x3F800000
140825e25:     	cmpb	$0x1, 0x5c8(%rbp)
140825e2c:     	jne	0x140825e58 <.text+0x824e58>
140825e2e:     	movl	0x5c9(%rbp), %eax
140825e34:     	movl	0x5cc(%rbp), %ecx
140825e3a:     	movl	%ecx, 0x333(%rbp)
140825e40:     	movl	%eax, 0x330(%rbp)
140825e46:     	movq	0x5d0(%rbp), %rax
140825e4d:     	movzbl	0x5d8(%rbp), %edx
140825e54:     	movb	$0x1, %cl
140825e56:     	jmp	0x140825e6b <.text+0x824e6b>
140825e58:     	movq	0x5d0(%rbp), %rax
140825e5f:     	lock
140825e60:     	incq	(%rax)
140825e63:     	jle	0x140826ed5 <.text+0x825ed5>
140825e69:     	xorl	%ecx, %ecx
140825e6b:     	movl	0x330(%rbp), %r8d
140825e72:     	movl	0x333(%rbp), %r9d
140825e79:     	movl	%r9d, 0x5e4(%rbp)
140825e80:     	movl	%r8d, 0x5e1(%rbp)
140825e87:     	movb	%cl, 0x5e0(%rbp)
140825e8d:     	movq	%rax, 0x5e8(%rbp)
140825e94:     	movq	%rdx, 0x5f0(%rbp)
140825e9b:     	movl	$0x3f800000, 0x5f8(%rbp) # imm = 0x3F800000
140825ea5:     	movaps	%xmm6, 0xe0(%rbp)
140825eac:     	movaps	%xmm7, 0xf0(%rbp)
140825eb3:     	movl	$0x6, 0xd0(%rbp)
140825ebd:     	movq	0x618(%rbp), %rax
140825ec4:     	cmpq	$0x2, %rax
140825ec8:     	jb	0x140825eda <.text+0x824eda>
140825eca:     	movq	0x608(%rbp), %rdx
140825ed1:     	movq	0x610(%rbp), %rax
140825ed8:     	jmp	0x140825ee1 <.text+0x824ee1>
140825eda:     	leaq	0x608(%rbp), %rdx
140825ee1:     	leaq	(%rdx,%rax,8), %r8
140825ee5:     	movq	$0x0, 0x340(%rbp)
140825ef0:     	leaq	0x330(%rbp), %rcx
140825ef7:     	callq	0x1409aca00 <.text+0x9aba00>
140825efc:     	nop
140825efd:     	movq	0x330(%rbp), %rdi
140825f04:     	movq	0x340(%rbp), %r15
140825f0b:     	movups	0x338(%rbp), %xmm11
140825f13:     	callq	0x140002200 <.text+0x1200>
140825f18:     	movl	$0x4, %ecx
140825f1d:     	movl	$0x1, %edx
140825f22:     	callq	0x1400021c0 <.text+0x11c0>
140825f27:     	testq	%rax, %rax
140825f2a:     	je	0x140826e45 <.text+0x825e45>
140825f30:     	movl	$0x65756c67, (%rax)     # imm = 0x65756C67
140825f36:     	movq	$0x0, 0x490(%rbp)
140825f41:     	movq	$0x1, 0x498(%rbp)
140825f4c:     	movl	$0x10, 0x4a0(%rbp)
140825f56:     	movb	$0x1, 0x4a4(%rbp)
140825f5d:     	movb	$0x0, 0x4a8(%rbp)
140825f64:     	movb	$0x1, 0x4a9(%rbp)
140825f6b:     	movl	$0x2, 0x4ac(%rbp)
140825f75:     	movl	$0x0, 0x330(%rbp)
140825f7f:     	movaps	0x51dc4ca(%rip), %xmm0  # 0x145a02450
140825f86:     	movaps	%xmm0, 0x340(%rbp)
140825f8d:     	movaps	0x51dc4cb(%rip), %xmm12 # 0x145a02460
140825f95:     	movaps	%xmm12, 0x350(%rbp)
140825f9d:     	movaps	0x51dc4cb(%rip), %xmm13 # 0x145a02470
140825fa5:     	movaps	%xmm13, 0x360(%rbp)
140825fad:     	movaps	0x51dc4cb(%rip), %xmm14 # 0x145a02480
140825fb5:     	movaps	%xmm14, 0x370(%rbp)
140825fbd:     	movl	$0x0, 0x380(%rbp)
140825fc7:     	movl	$0x0, 0x38c(%rbp)
140825fd1:     	movq	$-0x50, 0x3b0(%rbp)
140825fdc:     	movl	$0x0, 0x3b8(%rbp)
140825fe6:     	movl	$0x0, 0x3d4(%rbp)
140825ff0:     	movq	0x560(%rbp), %rcx
140825ff7:     	movq	%rcx, 0x410(%rbp)
140825ffe:     	movaps	0x540(%rbp), %xmm0
140826005:     	movaps	0x550(%rbp), %xmm1
14082600c:     	movaps	%xmm1, 0x400(%rbp)
140826013:     	movaps	%xmm0, 0x3f0(%rbp)
14082601a:     	movl	$0xffffffff, 0x418(%rbp) # imm = 0xFFFFFFFF
140826024:     	movups	0x51dc40c(%rip), %xmm15 # 0x145a02438
14082602c:     	movups	%xmm15, 0x41c(%rbp)
140826034:     	movl	$0x0, 0x42c(%rbp)
14082603e:     	movw	$0x1, 0x430(%rbp)
140826047:     	movb	$0x1, 0x432(%rbp)
14082604e:     	movups	0x5e0(%rbp), %xmm0
140826055:     	movups	0x5f0(%rbp), %xmm1
14082605c:     	movaps	%xmm0, 0x470(%rbp)
140826063:     	movaps	%xmm1, 0x480(%rbp)
14082606a:     	movl	$0x3f800000, 0x4c8(%rbp) # imm = 0x3F800000
140826074:     	movb	$0x1, 0x4cc(%rbp)
14082607b:     	movaps	0xd0(%rbp), %xmm0
140826082:     	movaps	0xe0(%rbp), %xmm1
140826089:     	movaps	0xf0(%rbp), %xmm2
140826090:     	movaps	%xmm2, 0x460(%rbp)
140826097:     	movaps	%xmm1, 0x450(%rbp)
14082609e:     	movaps	%xmm0, 0x440(%rbp)
1408260a5:     	movq	%rdi, 0x4d0(%rbp)
1408260ac:     	movups	%xmm11, 0x4d8(%rbp)
1408260b4:     	movq	$0x4, 0x4e8(%rbp)
1408260bf:     	movq	%rax, 0x4f0(%rbp)
1408260c6:     	movq	$0x4, 0x4f8(%rbp)
1408260d1:     	movb	$0x1, 0x647(%rbp)
1408260d8:     	movb	$0x1, 0x646(%rbp)
1408260df:     	leaq	0x51de222(%rip), %r9    # 0x145a04308
1408260e6:     	leaq	0xd0(%rbp), %rcx
1408260ed:     	leaq	-0x40(%rbp), %rdx
1408260f1:     	leaq	0x330(%rbp), %r8
1408260f8:     	callq	0x1404df600 <.text+0x4de600>
1408260fd:     	nop
1408260fe:     	callq	0x140002200 <.text+0x1200>
140826103:     	movl	$0x4, %ecx
140826108:     	movl	$0x1, %edx
14082610d:     	callq	0x1400021c0 <.text+0x11c0>
140826112:     	testq	%rax, %rax
140826115:     	je	0x140826e65 <.text+0x825e65>
14082611b:     	movl	$0x65756c67, (%rax)     # imm = 0x65756C67
140826121:     	movq	$0x4, 0x540(%rbp)
14082612c:     	movq	%rax, 0x548(%rbp)
140826133:     	movq	$0x4, 0x550(%rbp)
14082613e:     	movq	0x618(%rbp), %rax
140826145:     	cmpq	$0x2, %rax
140826149:     	jb	0x14082615b <.text+0x82515b>
14082614b:     	movq	0x608(%rbp), %rdx
140826152:     	movq	0x610(%rbp), %rax
140826159:     	jmp	0x140826162 <.text+0x825162>
14082615b:     	leaq	0x608(%rbp), %rdx
140826162:     	leaq	(%rdx,%rax,8), %r8
140826166:     	movq	$0x0, 0xe0(%rbp)
140826171:     	leaq	0xd0(%rbp), %rcx
140826178:     	callq	0x1409aca00 <.text+0x9aba00>
14082617d:     	nop
14082617e:     	movq	0xe0(%rbp), %rax
140826185:     	movq	%rax, 0x498(%rbp)
14082618c:     	movups	0xd0(%rbp), %xmm0
140826193:     	movups	%xmm0, 0x488(%rbp)
14082619a:     	movups	0x5c8(%rbp), %xmm0
1408261a1:     	movups	%xmm0, 0x468(%rbp)
1408261a8:     	movq	0x5d8(%rbp), %rax
1408261af:     	movq	%rax, 0x478(%rbp)
1408261b6:     	movq	%rsi, 0x480(%rbp)
1408261bd:     	movq	$-0x1, 0x3c0(%rbp)
1408261c8:     	movq	$0x0, 0x330(%rbp)
1408261d3:     	movq	$-0x1, 0x3f0(%rbp)
1408261de:     	movq	$0x0, 0x4a0(%rbp)
1408261e9:     	movq	$0x0, 0x3a8(%rbp)
1408261f4:     	movq	$0x8, 0x3b0(%rbp)
1408261ff:     	movq	$0x0, 0x3b8(%rbp)
14082620a:     	movq	$0x0, 0x340(%rbp)
140826215:     	movq	$0x0, 0x350(%rbp)
140826220:     	movq	$0x3f800000, 0x4a8(%rbp) # imm = 0x3F800000
14082622b:     	movq	$0x0, 0x360(%rbp)
140826236:     	movq	$0x0, 0x378(%rbp)
140826241:     	movl	$0x0, 0x390(%rbp)
14082624b:     	movl	$0x0, 0x398(%rbp)
140826255:     	movw	$0x0, 0x3a0(%rbp)
14082625e:     	movb	$0x0, 0x4b0(%rbp)
140826265:     	movb	$0x0, 0x62f(%rbp)
14082626c:     	leaq	0xd0(%rbp), %rcx
140826273:     	leaq	0x540(%rbp), %r8
14082627a:     	leaq	0x330(%rbp), %r9
140826281:     	movq	0x620(%rbp), %rdx
140826288:     	callq	0x140bc9770 <.text+0xbc8770>
14082628d:     	nop
14082628e:     	movb	$0x1, 0x647(%rbp)
140826295:     	movb	$0x0, 0x646(%rbp)
14082629c:     	leaq	0xd0(%rbp), %rcx
1408262a3:     	callq	0x14077c9c0 <.text+0x77b9c0>
1408262a8:     	nop
1408262a9:     	movq	0x618(%rbp), %rax
1408262b0:     	cmpq	$0x2, %rax
1408262b4:     	jb	0x1408262c6 <.text+0x8252c6>
1408262b6:     	movq	0x608(%rbp), %rdx
1408262bd:     	movq	0x610(%rbp), %rax
1408262c4:     	jmp	0x1408262cd <.text+0x8252cd>
1408262c6:     	leaq	0x608(%rbp), %rdx
1408262cd:     	leaq	(%rdx,%rax,8), %r8
1408262d1:     	movq	$0x0, 0xe0(%rbp)
1408262dc:     	leaq	0xd0(%rbp), %rcx
1408262e3:     	callq	0x1409aca00 <.text+0x9aba00>
1408262e8:     	nop
1408262e9:     	movq	0xe0(%rbp), %rax
1408262f0:     	movq	%rax, 0x378(%rbp)
1408262f7:     	movups	0xd0(%rbp), %xmm0
1408262fe:     	movups	%xmm0, 0x368(%rbp)
140826305:     	movaps	%xmm8, 0x330(%rbp)
14082630d:     	movaps	%xmm9, 0x340(%rbp)
140826315:     	movaps	%xmm10, 0x350(%rbp)
14082631d:     	movb	$0x2, 0x360(%rbp)
140826324:     	movb	$0x1, 0x647(%rbp)
14082632b:     	movb	$0x0, 0x646(%rbp)
140826332:     	leaq	0x51ddfe7(%rip), %r9    # 0x145a04320
140826339:     	leaq	0xd0(%rbp), %rcx
140826340:     	leaq	-0x40(%rbp), %rdx
140826344:     	leaq	0x330(%rbp), %r8
14082634b:     	callq	0x1404dc560 <.text+0x4db560>
140826350:     	nop
140826351:     	movq	0xd0(%rbp), %r15
140826358:     	movq	0x618(%rbp), %rax
14082635f:     	movq	%rax, 0x378(%rbp)
140826366:     	movups	0x608(%rbp), %xmm0
14082636d:     	movups	%xmm0, 0x368(%rbp)
140826374:     	movaps	%xmm8, 0x330(%rbp)
14082637c:     	movaps	%xmm9, 0x340(%rbp)
140826384:     	movaps	%xmm10, 0x350(%rbp)
14082638c:     	movb	$0x2, 0x360(%rbp)
140826393:     	movb	$0x0, 0x647(%rbp)
14082639a:     	movb	$0x0, 0x646(%rbp)
1408263a1:     	leaq	0x51ddf90(%rip), %r9    # 0x145a04338
1408263a8:     	leaq	0xd0(%rbp), %rcx
1408263af:     	leaq	-0x40(%rbp), %rdx
1408263b3:     	leaq	0x330(%rbp), %r8
1408263ba:     	callq	0x1404dc560 <.text+0x4db560>
1408263bf:     	nop
1408263c0:     	movq	0xd0(%rbp), %rdi
1408263c7:     	movb	$0x2, 0x540(%rbp)
1408263ce:     	movq	$0x0, 0xd0(%rbp)
1408263d9:     	callq	0x1456e35e0 <.text+0x56e25e0>
1408263de:     	nop
1408263df:     	movq	%rax, %rsi
1408263e2:     	cmpb	$0x1, 0x10(%rax)
1408263e6:     	jne	0x140826d3c <.text+0x825d3c>
1408263ec:     	movq	(%rsi), %rax
1408263ef:     	movq	0x8(%rsi), %rdx
1408263f3:     	leaq	0x1(%rax), %rcx
1408263f7:     	movq	%rcx, (%rsi)
1408263fa:     	movq	0x550(%rbp), %rcx
140826401:     	movq	%rcx, 0x3e8(%rbp)
140826408:     	movups	0x540(%rbp), %xmm0
14082640f:     	movups	%xmm0, 0x3d8(%rbp)
140826416:     	movups	0xd0(%rbp), %xmm0
14082641d:     	movups	0xe0(%rbp), %xmm1
140826424:     	movaps	%xmm0, 0x400(%rbp)
14082642b:     	movaps	%xmm1, 0x410(%rbp)
140826432:     	movq	0xf0(%rbp), %rcx
140826439:     	movq	%rcx, 0x420(%rbp)
140826440:     	movq	$0x0, 0x330(%rbp)
14082644b:     	movb	$0x2, 0x340(%rbp)
140826452:     	movaps	0x51d28f7(%rip), %xmm0  # 0x1459f8d50
140826459:     	movaps	%xmm0, 0x370(%rbp)
140826460:     	movaps	0x51d28f9(%rip), %xmm0  # 0x1459f8d60
140826467:     	movaps	%xmm0, 0x380(%rbp)
14082646e:     	movq	%rax, 0x390(%rbp)
140826475:     	movq	%rdx, 0x398(%rbp)
14082647c:     	movq	$0x0, 0x3a0(%rbp)
140826487:     	movaps	0x51a1602(%rip), %xmm0  # 0x1459c7a90
14082648e:     	movaps	%xmm0, 0x3b0(%rbp)
140826495:     	movaps	%xmm0, 0x3c0(%rbp)
14082649c:     	movl	$0x0, 0x3d0(%rbp)
1408264a6:     	movq	%r15, 0x3f0(%rbp)
1408264ad:     	movq	%rdi, 0x3f8(%rbp)
1408264b4:     	movq	$0x0, 0x428(%rbp)
1408264bf:     	movl	$0x0, 0x430(%rbp)
1408264c9:     	movl	$0x0, 0x45c(%rbp)
1408264d3:     	movl	$0x0, 0x470(%rbp)
1408264dd:     	movq	$0x0, 0x468(%rbp)
1408264e8:     	movl	$0x3f800000, 0x474(%rbp) # imm = 0x3F800000
1408264f2:     	movl	$0x0, 0x480(%rbp)
1408264fc:     	movq	$0x0, 0x478(%rbp)
140826507:     	movl	$0x3f800000, 0x484(%rbp) # imm = 0x3F800000
140826511:     	movw	$0x100, 0x488(%rbp)     # imm = 0x100
14082651a:     	movb	$0x0, 0x48a(%rbp)
140826521:     	movb	$0x0, 0x647(%rbp)
140826528:     	movb	$0x0, 0x646(%rbp)
14082652f:     	leaq	-0x40(%rbp), %rcx
140826533:     	leaq	0x330(%rbp), %rsi
14082653a:     	movq	%rsi, %rdx
14082653d:     	callq	0x1404d5840 <.text+0x4d4840>
140826542:     	nop
140826543:     	movl	0x5c0(%rbp), %eax
140826549:     	movq	0x530(%rbp), %rcx
140826550:     	movl	%eax, (%rcx)
140826552:     	movq	0x538(%rbp), %rax
140826559:     	movl	%ebx, (%rax)
14082655b:     	movl	%r13d, (%r12)
14082655f:     	movabsq	$0x20000000200, %rax    # imm = 0x20000000200
140826569:     	movq	%rax, 0x540(%rbp)
140826570:     	movl	$0x1, 0x548(%rbp)
14082657a:     	movl	$0x28, 0x330(%rbp)
140826584:     	movq	%rsi, 0x28(%rsp)
140826589:     	movb	$0x3, 0x30(%rsp)
14082658e:     	movq	$0x8, 0x20(%rsp)
140826597:     	leaq	0x51dbe92(%rip), %r9    # 0x145a02430
14082659e:     	leaq	0xd0(%rbp), %rcx
1408265a5:     	leaq	0x540(%rbp), %rdx
1408265ac:     	movl	$0x1, %r8d
1408265b2:     	callq	0x1448c9eb0 <.text+0x48c8eb0>
1408265b7:     	movl	$0x16, 0x194(%rbp)
1408265c1:     	movq	0x50(%r14), %rcx
1408265c5:     	addq	$0x10, %rcx
1408265c9:     	movb	$0x1, 0x63c(%rbp)
1408265d0:     	callq	0x144966220 <.text+0x4965220>
1408265d5:     	nop
1408265d6:     	movl	%eax, %r15d
1408265d9:     	movl	%edx, %r12d
1408265dc:     	leaq	0xd0(%rbp), %rdx
1408265e3:     	movl	$0xe0, %r8d
1408265e9:     	movq	%rsi, %rcx
1408265ec:     	callq	0x145756ddd <.text+0x5755ddd>
1408265f1:     	movb	$0x0, 0x63c(%rbp)
1408265f8:     	movq	%rsi, 0x20(%rsp)
1408265fd:     	leaq	0x540(%rbp), %rcx
140826604:     	movq	%r14, %rdx
140826607:     	movl	%r15d, %r8d
14082660a:     	movl	%r12d, %r9d
14082660d:     	callq	0x140f91ff0 <.text+0xf90ff0>
140826612:     	nop
140826613:     	cmpl	$0x2, 0x540(%rbp)
14082661a:     	jne	0x140826d52 <.text+0x825d52>
140826620:     	movq	$-0x1, 0x330(%rbp)
14082662b:     	movb	$0x0, 0x63c(%rbp)
140826632:     	movq	%rsi, 0x20(%rsp)
140826637:     	movq	$0x0, 0x28(%rsp)
140826640:     	movq	%r14, %rcx
140826643:     	movl	%r15d, %edx
140826646:     	movl	%r12d, %r8d
140826649:     	xorl	%r9d, %r9d
14082664c:     	callq	0x144978da0 <.text+0x4977da0>
140826651:     	nop
140826652:     	movq	%rax, %rsi
140826655:     	movq	%rax, 0x610(%rbp)
14082665c:     	movb	$0x0, 0x608(%rbp)
140826663:     	callq	0x140002200 <.text+0x1200>
140826668:     	movl	$0x7, %ecx
14082666d:     	movl	$0x1, %edx
140826672:     	callq	0x1400021c0 <.text+0x11c0>
140826677:     	testq	%rax, %rax
14082667a:     	je	0x140826e85 <.text+0x825e85>
140826680:     	movl	$0x70757373, 0x3(%rax)  # imm = 0x70757373
140826687:     	movl	$0x73657264, (%rax)     # imm = 0x73657264
14082668d:     	movq	$0x7, 0x540(%rbp)
140826698:     	movq	%rax, 0x548(%rbp)
14082669f:     	movq	$0x7, 0x550(%rbp)
1408266aa:     	lock
1408266ab:     	incq	(%rsi)
1408266ae:     	jle	0x140826ed5 <.text+0x825ed5>
1408266b4:     	movb	$0x0, 0x338(%rbp)
1408266bb:     	movq	%rsi, 0x340(%rbp)
1408266c2:     	movq	$0x0, 0x330(%rbp)
1408266cd:     	movb	$0x1, 0x641(%rbp)
1408266d4:     	leaq	0xd0(%rbp), %rcx
1408266db:     	leaq	0x540(%rbp), %r8
1408266e2:     	leaq	0x330(%rbp), %r9
1408266e9:     	movq	0x630(%rbp), %rdx
1408266f0:     	callq	0x140bc9440 <.text+0xbc8440>
1408266f5:     	nop
1408266f6:     	movq	0xd0(%rbp), %rax
1408266fd:     	cmpq	$0x2, %rax
140826701:     	je	0x140826752 <.text+0x825752>
140826703:     	testq	%rax, %rax
140826706:     	je	0x140826728 <.text+0x825728>
140826708:     	movq	0xd8(%rbp), %rdx
14082670f:     	testq	%rdx, %rdx
140826712:     	je	0x140826752 <.text+0x825752>
140826714:     	movq	0xe0(%rbp), %rcx
14082671b:     	movl	$0x1, %r8d
140826721:     	callq	0x1400021d0 <.text+0x11d0>
140826726:     	jmp	0x140826752 <.text+0x825752>
140826728:     	cmpb	$0x0, 0xd8(%rbp)
14082672f:     	jne	0x140826752 <.text+0x825752>
140826731:     	movq	0xe0(%rbp), %rax
140826738:     	lock
140826739:     	decq	(%rax)
14082673c:     	jne	0x140826752 <.text+0x825752>
14082673e:     	leaq	0xe0(%rbp), %rcx
140826745:     	movb	$0x1, 0x641(%rbp)
14082674c:     	callq	0x1449886d0 <.text+0x49876d0>
140826751:     	nop
140826752:     	movb	$0x1, 0x641(%rbp)
140826759:     	leaq	0x5e0(%rbp), %rsi
140826760:     	movl	$0x15, %edx
140826765:     	movq	%rsi, %rcx
140826768:     	callq	0x144318a40 <.text+0x4317a40>
14082676d:     	nop
14082676e:     	movq	0x5f0(%rbp), %rax
140826775:     	cmpq	$0x2, %rax
140826779:     	jb	0x140826789 <.text+0x825789>
14082677b:     	movq	0x5e0(%rbp), %rsi
140826782:     	movq	0x5e8(%rbp), %rax
140826789:     	leaq	(%rsi,%rax,8), %r8
14082678d:     	movq	$0x0, 0xe0(%rbp)
140826798:     	leaq	0xd0(%rbp), %rcx
14082679f:     	movq	%rsi, %rdx
1408267a2:     	callq	0x1409aca00 <.text+0x9aba00>
1408267a7:     	nop
1408267a8:     	movq	0xe0(%rbp), %rax
1408267af:     	movq	%rax, 0x378(%rbp)
1408267b6:     	movups	0xd0(%rbp), %xmm0
1408267bd:     	movups	%xmm0, 0x368(%rbp)
1408267c4:     	movaps	%xmm8, 0x330(%rbp)
1408267cc:     	movaps	%xmm9, 0x340(%rbp)
1408267d4:     	movaps	%xmm10, 0x350(%rbp)
1408267dc:     	movb	$0x2, 0x360(%rbp)
1408267e3:     	movb	$0x1, 0x645(%rbp)
1408267ea:     	leaq	0x51ddecf(%rip), %r9    # 0x145a046c0
1408267f1:     	leaq	0xd0(%rbp), %rcx
1408267f8:     	leaq	-0x40(%rbp), %rdx
1408267fc:     	leaq	0x330(%rbp), %r8
140826803:     	callq	0x1404dc560 <.text+0x4db560>
140826808:     	nop
140826809:     	movq	0xd0(%rbp), %rsi
140826810:     	cmpb	$0x1, 0x608(%rbp)
140826817:     	jne	0x140826843 <.text+0x825843>
140826819:     	movl	0x609(%rbp), %eax
14082681f:     	movl	0x60c(%rbp), %ecx
140826825:     	movl	%ecx, 0x5cb(%rbp)
14082682b:     	movl	%eax, 0x5c8(%rbp)
140826831:     	movq	0x610(%rbp), %rax
140826838:     	movzbl	0x618(%rbp), %ecx
14082683f:     	movb	$0x1, %dl
140826841:     	jmp	0x140826856 <.text+0x825856>
140826843:     	movq	0x610(%rbp), %rax
14082684a:     	lock
14082684b:     	incq	(%rax)
14082684e:     	jle	0x140826ed5 <.text+0x825ed5>
140826854:     	xorl	%edx, %edx
140826856:     	movb	%dl, 0x540(%rbp)
14082685c:     	movl	0x5c8(%rbp), %edx
140826862:     	movl	0x5cb(%rbp), %r8d
140826869:     	movl	%edx, 0x541(%rbp)
14082686f:     	movl	%r8d, 0x544(%rbp)
140826876:     	movq	%rax, 0x548(%rbp)
14082687d:     	movq	%rcx, 0x550(%rbp)
140826884:     	movl	$0x3f800000, 0x558(%rbp) # imm = 0x3F800000
14082688e:     	movaps	%xmm6, 0xe0(%rbp)
140826895:     	movaps	%xmm7, 0xf0(%rbp)
14082689c:     	movl	$0x6, 0xd0(%rbp)
1408268a6:     	movq	0x5f0(%rbp), %rax
1408268ad:     	cmpq	$0x2, %rax
1408268b1:     	jb	0x1408268c3 <.text+0x8258c3>
1408268b3:     	movq	0x5e0(%rbp), %rdx
1408268ba:     	movq	0x5e8(%rbp), %rax
1408268c1:     	jmp	0x1408268ca <.text+0x8258ca>
1408268c3:     	leaq	0x5e0(%rbp), %rdx
1408268ca:     	leaq	(%rdx,%rax,8), %r8
1408268ce:     	movq	$0x0, 0x340(%rbp)
1408268d9:     	leaq	0x330(%rbp), %rcx
1408268e0:     	callq	0x1409aca00 <.text+0x9aba00>
1408268e5:     	nop
1408268e6:     	movq	0x330(%rbp), %rdi
1408268ed:     	movq	0x340(%rbp), %rbx
1408268f4:     	movups	0x338(%rbp), %xmm6
1408268fb:     	callq	0x140002200 <.text+0x1200>
140826900:     	movl	$0x7, %ecx
140826905:     	movl	$0x1, %edx
14082690a:     	callq	0x1400021c0 <.text+0x11c0>
14082690f:     	testq	%rax, %rax
140826912:     	je	0x140826e9e <.text+0x825e9e>
140826918:     	movl	$0x70757373, 0x3(%rax)  # imm = 0x70757373
14082691f:     	movl	$0x73657264, (%rax)     # imm = 0x73657264
140826925:     	movq	$0x0, 0x490(%rbp)
140826930:     	movq	$0x1, 0x498(%rbp)
14082693b:     	movl	$0x10, 0x4a0(%rbp)
140826945:     	movb	$0x1, 0x4a4(%rbp)
14082694c:     	movb	$0x0, 0x4a8(%rbp)
140826953:     	movb	$0x1, 0x4a9(%rbp)
14082695a:     	movl	$0x2, 0x4ac(%rbp)
140826964:     	movl	$0x0, 0x330(%rbp)
14082696e:     	movaps	0x51dbadb(%rip), %xmm0  # 0x145a02450
140826975:     	movaps	%xmm0, 0x340(%rbp)
14082697c:     	movaps	%xmm12, 0x350(%rbp)
140826984:     	movaps	%xmm13, 0x360(%rbp)
14082698c:     	movaps	%xmm14, 0x370(%rbp)
140826994:     	movl	$0x0, 0x380(%rbp)
14082699e:     	movl	$0x0, 0x38c(%rbp)
1408269a8:     	movq	$-0x4f, 0x3b0(%rbp)
1408269b3:     	movl	$0x0, 0x3b8(%rbp)
1408269bd:     	movl	$0x0, 0x3d4(%rbp)
1408269c7:     	movl	$0xa, 0x3f0(%rbp)
1408269d1:     	movl	$0xffffffff, 0x418(%rbp) # imm = 0xFFFFFFFF
1408269db:     	movups	%xmm15, 0x41c(%rbp)
1408269e3:     	movl	$0x0, 0x42c(%rbp)
1408269ed:     	movw	$0x1, 0x430(%rbp)
1408269f6:     	movb	$0x1, 0x432(%rbp)
1408269fd:     	movups	0x540(%rbp), %xmm0
140826a04:     	movups	0x550(%rbp), %xmm1
140826a0b:     	movaps	%xmm0, 0x470(%rbp)
140826a12:     	movaps	%xmm1, 0x480(%rbp)
140826a19:     	movl	$0x0, 0x4c8(%rbp)
140826a23:     	movb	$0x2, 0x4cc(%rbp)
140826a2a:     	movaps	0xd0(%rbp), %xmm0
140826a31:     	movaps	0xe0(%rbp), %xmm1
140826a38:     	movaps	0xf0(%rbp), %xmm2
140826a3f:     	movaps	%xmm0, 0x440(%rbp)
140826a46:     	movaps	%xmm1, 0x450(%rbp)
140826a4d:     	movaps	%xmm2, 0x460(%rbp)
140826a54:     	movq	%rdi, 0x4d0(%rbp)
140826a5b:     	movups	%xmm6, 0x4d8(%rbp)
140826a62:     	movq	$0x7, 0x4e8(%rbp)
140826a6d:     	movq	%rax, 0x4f0(%rbp)
140826a74:     	movq	$0x7, 0x4f8(%rbp)
140826a7f:     	movb	$0x1, 0x645(%rbp)
140826a86:     	leaq	0x51ddc4b(%rip), %r9    # 0x145a046d8
140826a8d:     	leaq	0xd0(%rbp), %rcx
140826a94:     	leaq	-0x40(%rbp), %rdx
140826a98:     	leaq	0x330(%rbp), %r8
140826a9f:     	callq	0x1404df600 <.text+0x4de600>
140826aa4:     	nop
140826aa5:     	callq	0x140002200 <.text+0x1200>
140826aaa:     	movl	$0x7, %ecx
140826aaf:     	movl	$0x1, %edx
140826ab4:     	callq	0x1400021c0 <.text+0x11c0>
140826ab9:     	testq	%rax, %rax
140826abc:     	je	0x140826ebe <.text+0x825ebe>
140826ac2:     	movl	$0x70757373, 0x3(%rax)  # imm = 0x70757373
140826ac9:     	movl	$0x73657264, (%rax)     # imm = 0x73657264
140826acf:     	movq	$0x7, 0x540(%rbp)
140826ada:     	movq	%rax, 0x548(%rbp)
140826ae1:     	movq	$0x7, 0x550(%rbp)
140826aec:     	movq	0x5f0(%rbp), %rax
140826af3:     	movq	%rax, 0x498(%rbp)
140826afa:     	movups	0x5e0(%rbp), %xmm0
140826b01:     	movups	%xmm0, 0x488(%rbp)
140826b08:     	movups	0x608(%rbp), %xmm0
140826b0f:     	movups	%xmm0, 0x468(%rbp)
140826b16:     	movq	0x618(%rbp), %rax
140826b1d:     	movq	%rax, 0x478(%rbp)
140826b24:     	movq	%rsi, 0x480(%rbp)
140826b2b:     	movq	$-0x1, 0x3c0(%rbp)
140826b36:     	movq	$0x0, 0x330(%rbp)
140826b41:     	movq	$-0x1, 0x3f0(%rbp)
140826b4c:     	movaps	0x51a177d(%rip), %xmm0  # 0x1459c82d0
140826b53:     	movups	%xmm0, 0x4a0(%rbp)
140826b5a:     	movq	$0x0, 0x3a8(%rbp)
140826b65:     	movq	$0x8, 0x3b0(%rbp)
140826b70:     	movq	$0x0, 0x3b8(%rbp)
140826b7b:     	movq	$0x0, 0x340(%rbp)
140826b86:     	movq	$0x0, 0x350(%rbp)
140826b91:     	movq	$0x0, 0x360(%rbp)
140826b9c:     	movq	$0x0, 0x378(%rbp)
140826ba7:     	movl	$0x0, 0x390(%rbp)
140826bb1:     	movl	$0x0, 0x398(%rbp)
140826bbb:     	movw	$0x0, 0x3a0(%rbp)
140826bc4:     	movb	$0x0, 0x4b0(%rbp)
140826bcb:     	movb	$0x0, 0x645(%rbp)
140826bd2:     	leaq	0xd0(%rbp), %rcx
140826bd9:     	leaq	0x540(%rbp), %r8
140826be0:     	leaq	0x330(%rbp), %r9
140826be7:     	movq	0x620(%rbp), %rdx
140826bee:     	callq	0x140bc9770 <.text+0xbc8770>
140826bf3:     	nop
140826bf4:     	movb	$0x0, 0x645(%rbp)
140826bfb:     	leaq	0xd0(%rbp), %rcx
140826c02:     	callq	0x14077c9c0 <.text+0x77b9c0>
140826c07:     	nop
140826c08:     	movaps	0x650(%rbp), %xmm6
140826c0f:     	movaps	0x660(%rbp), %xmm7
140826c16:     	movaps	0x670(%rbp), %xmm8
140826c1e:     	movaps	0x680(%rbp), %xmm9
140826c26:     	movaps	0x690(%rbp), %xmm10
140826c2e:     	movaps	0x6a0(%rbp), %xmm11
140826c36:     	movaps	0x6b0(%rbp), %xmm12
140826c3e:     	movaps	0x6c0(%rbp), %xmm13
140826c46:     	movaps	0x6d0(%rbp), %xmm14
140826c4e:     	movaps	0x6e0(%rbp), %xmm15
140826c56:     	addq	$0x778, %rsp            # imm = 0x778
140826c5d:     	popq	%rbx
140826c5e:     	popq	%rdi
140826c5f:     	popq	%rsi
140826c60:     	popq	%r12
140826c62:     	popq	%r13
140826c64:     	popq	%r14
140826c66:     	popq	%r15
140826c68:     	popq	%rbp
140826c69:     	retq
140826c6a:     	movups	0x540(%rbp), %xmm0
140826c71:     	movaps	%xmm0, 0x330(%rbp)
140826c78:     	movb	$0x0, 0x63e(%rbp)
140826c7f:     	leaq	0x51d1b62(%rip), %rax   # 0x1459f87e8
140826c86:     	movq	%rax, 0x20(%rsp)
140826c8b:     	leaq	0x51d2f6e(%rip), %rcx   # 0x1459f9c00
140826c92:     	leaq	0x51d2fb7(%rip), %r9    # 0x1459f9c50
140826c99:     	leaq	0x330(%rbp), %r8
140826ca0:     	movl	$0x2b, %edx
140826ca5:     	callq	0x1458e7530 <.text+0x58e6530>
140826caa:     	nop
140826cab:     	jmp	0x140826ed5 <.text+0x825ed5>
140826cb0:     	movups	0x5e0(%rbp), %xmm0
140826cb7:     	movaps	%xmm0, 0x330(%rbp)
140826cbe:     	movb	$0x0, 0x63b(%rbp)
140826cc5:     	leaq	0x51d1b1c(%rip), %rax   # 0x1459f87e8
140826ccc:     	movq	%rax, 0x20(%rsp)
140826cd1:     	leaq	0x51d2f28(%rip), %rcx   # 0x1459f9c00
140826cd8:     	leaq	0x51d2f71(%rip), %r9    # 0x1459f9c50
140826cdf:     	leaq	0x330(%rbp), %r8
140826ce6:     	movl	$0x2b, %edx
140826ceb:     	callq	0x1458e7530 <.text+0x58e6530>
140826cf0:     	nop
140826cf1:     	jmp	0x140826ed5 <.text+0x825ed5>
140826cf6:     	movups	0x540(%rbp), %xmm0
140826cfd:     	movaps	%xmm0, 0x330(%rbp)
140826d04:     	movb	$0x0, 0x63d(%rbp)
140826d0b:     	leaq	0x51d1ad6(%rip), %rax   # 0x1459f87e8
140826d12:     	movq	%rax, 0x20(%rsp)
140826d17:     	leaq	0x51d2ee2(%rip), %rcx   # 0x1459f9c00
140826d1e:     	leaq	0x51d2f2b(%rip), %r9    # 0x1459f9c50
140826d25:     	leaq	0x330(%rbp), %r8
140826d2c:     	movl	$0x2b, %edx
140826d31:     	callq	0x1458e7530 <.text+0x58e6530>
140826d36:     	nop
140826d37:     	jmp	0x140826ed5 <.text+0x825ed5>
140826d3c:     	callq	0x1456f6890 <.text+0x56f5890>
140826d41:     	nop
140826d42:     	movq	%rax, (%rsi)
140826d45:     	movq	%rdx, 0x8(%rsi)
140826d49:     	movb	$0x1, 0x10(%rsi)
140826d4d:     	jmp	0x1408263f3 <.text+0x8253f3>
140826d52:     	movups	0x540(%rbp), %xmm0
140826d59:     	movaps	%xmm0, 0x330(%rbp)
140826d60:     	movb	$0x0, 0x63c(%rbp)
140826d67:     	leaq	0x51d1a7a(%rip), %rax   # 0x1459f87e8
140826d6e:     	movq	%rax, 0x20(%rsp)
140826d73:     	leaq	0x51d2e86(%rip), %rcx   # 0x1459f9c00
140826d7a:     	leaq	0x51d2ecf(%rip), %r9    # 0x1459f9c50
140826d81:     	leaq	0x330(%rbp), %r8
140826d88:     	movl	$0x2b, %edx
140826d8d:     	callq	0x1458e7530 <.text+0x58e6530>
140826d92:     	nop
140826d93:     	jmp	0x140826ed5 <.text+0x825ed5>
140826d98:     	movq	%r14, 0x318(%rbp)
140826d9f:     	movl	$0x1, %ecx
140826da4:     	jmp	0x140825cd2 <.text+0x824cd2>
140826da9:     	movq	%r12, 0x630(%rbp)
140826db0:     	movl	$0x1, %ecx
140826db5:     	movq	%r14, %rdx
140826db8:     	callq	0x1458e721b <.text+0x58e621b>
140826dbd:     	nop
140826dbe:     	jmp	0x140826ed5 <.text+0x825ed5>
140826dc3:     	movb	$0x1, 0x643(%rbp)
140826dca:     	movl	$0x1, %ecx
140826dcf:     	movq	%r14, %rdx
140826dd2:     	callq	0x1458e721b <.text+0x58e621b>
140826dd7:     	nop
140826dd8:     	jmp	0x140826ed5 <.text+0x825ed5>
140826ddd:     	movq	%rdi, 0x2c8(%rbp)
140826de4:     	movl	$0x1, %ecx
140826de9:     	jmp	0x140825ced <.text+0x824ced>
140826dee:     	movq	%rsi, 0x630(%rbp)
140826df5:     	movq	%rbx, 0x620(%rbp)
140826dfc:     	movl	$0x1, %ecx
140826e01:     	movq	%rdi, %rdx
140826e04:     	callq	0x1458e721b <.text+0x58e621b>
140826e09:     	nop
140826e0a:     	jmp	0x140826ed5 <.text+0x825ed5>
140826e0f:     	movb	$0x1, 0x644(%rbp)
140826e16:     	movl	$0x1, %ecx
140826e1b:     	movq	%rdi, %rdx
140826e1e:     	callq	0x1458e721b <.text+0x58e621b>
140826e23:     	nop
140826e24:     	jmp	0x140826ed5 <.text+0x825ed5>
140826e29:     	movb	$0x1, 0x642(%rbp)
140826e30:     	movl	$0x1, %ecx
140826e35:     	movl	$0x4, %edx
140826e3a:     	callq	0x1458e721b <.text+0x58e621b>
140826e3f:     	nop
140826e40:     	jmp	0x140826ed5 <.text+0x825ed5>
140826e45:     	movq	%r15, 0x630(%rbp)
140826e4c:     	movq	%rdi, 0x620(%rbp)
140826e53:     	movl	$0x1, %ecx
140826e58:     	movl	$0x4, %edx
140826e5d:     	callq	0x1458e721b <.text+0x58e621b>
140826e62:     	nop
140826e63:     	jmp	0x140826ed5 <.text+0x825ed5>
140826e65:     	movb	$0x1, 0x647(%rbp)
140826e6c:     	movb	$0x1, 0x646(%rbp)
140826e73:     	movl	$0x1, %ecx
140826e78:     	movl	$0x4, %edx
140826e7d:     	callq	0x1458e721b <.text+0x58e621b>
140826e82:     	nop
140826e83:     	jmp	0x140826ed5 <.text+0x825ed5>
140826e85:     	movb	$0x1, 0x641(%rbp)
140826e8c:     	movl	$0x1, %ecx
140826e91:     	movl	$0x7, %edx
140826e96:     	callq	0x1458e721b <.text+0x58e621b>
140826e9b:     	nop
140826e9c:     	jmp	0x140826ed5 <.text+0x825ed5>
140826e9e:     	movq	%rbx, 0x630(%rbp)
140826ea5:     	movq	%rdi, 0x620(%rbp)
140826eac:     	movl	$0x1, %ecx
140826eb1:     	movl	$0x7, %edx
140826eb6:     	callq	0x1458e721b <.text+0x58e621b>
140826ebb:     	nop
140826ebc:     	jmp	0x140826ed5 <.text+0x825ed5>
140826ebe:     	movb	$0x1, 0x645(%rbp)
140826ec5:     	movl	$0x1, %ecx
140826eca:     	movl	$0x7, %edx
140826ecf:     	callq	0x1458e721b <.text+0x58e621b>
140826ed4:     	nop
140826ed5:     	ud2

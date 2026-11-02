
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140105220:     	pushq	%rbp
140105221:     	pushq	%r15
140105223:     	pushq	%r14
140105225:     	pushq	%r13
140105227:     	pushq	%r12
140105229:     	pushq	%rsi
14010522a:     	pushq	%rdi
14010522b:     	pushq	%rbx
14010522c:     	subq	$0x968, %rsp            # imm = 0x968
140105233:     	leaq	0x80(%rsp), %rbp
14010523b:     	movaps	%xmm15, 0x8d0(%rbp)
140105243:     	movaps	%xmm14, 0x8c0(%rbp)
14010524b:     	movaps	%xmm13, 0x8b0(%rbp)
140105253:     	movaps	%xmm12, 0x8a0(%rbp)
14010525b:     	movaps	%xmm11, 0x890(%rbp)
140105263:     	movaps	%xmm10, 0x880(%rbp)
14010526b:     	movaps	%xmm9, 0x870(%rbp)
140105273:     	movaps	%xmm8, 0x860(%rbp)
14010527b:     	movaps	%xmm7, 0x850(%rbp)
140105282:     	movaps	%xmm6, 0x840(%rbp)
140105289:     	movq	$-0x2, 0x838(%rbp)
140105294:     	movq	%rdx, %r14
140105297:     	movq	%rcx, %r12
14010529a:     	movq	(%rcx), %r13
14010529d:     	movq	0x28(%rcx), %rax
1401052a1:     	movq	%r13, 0xc0(%rbp)
1401052a8:     	leaq	0xc8(%rbp), %rdx
1401052af:     	movups	0x8(%rcx), %xmm0
1401052b3:     	movups	%xmm0, 0xc8(%rbp)
1401052ba:     	movups	0x18(%rcx), %xmm0
1401052be:     	movups	%xmm0, 0xd8(%rbp)
1401052c5:     	movq	%rax, 0xe8(%rbp)
1401052cc:     	xorps	%xmm0, %xmm0
1401052cf:     	movups	%xmm0, 0x610(%rbp)
1401052d6:     	movups	%xmm0, 0x638(%rbp)
1401052dd:     	movups	%xmm0, 0x648(%rbp)
1401052e4:     	movq	$0x0, 0x658(%rbp)
1401052ef:     	movups	0x583b41a(%rip), %xmm6  # 0x145940710
1401052f6:     	movaps	%xmm6, 0x180(%rbp)
1401052fd:     	movq	$0x0, 0x190(%rbp)
140105308:     	movups	0x583b419(%rip), %xmm7  # 0x145940728
14010530f:     	movups	%xmm7, 0x198(%rbp)
140105316:     	movq	$0x0, 0x1a8(%rbp)
140105321:     	movups	0x583b417(%rip), %xmm8  # 0x145940740
140105329:     	movaps	%xmm8, 0x1b0(%rbp)
140105331:     	movq	$0x0, 0x1c0(%rbp)
14010533c:     	movups	0x583b414(%rip), %xmm9  # 0x145940758
140105344:     	movups	%xmm9, 0x1c8(%rbp)
14010534c:     	movq	$0x0, 0x1d8(%rbp)
140105357:     	movq	0x1d0(%rbp), %rax
14010535e:     	movq	%rax, 0x5f8(%rbp)
140105365:     	movq	0x1d8(%rbp), %rax
14010536c:     	movq	%rax, 0x600(%rbp)
140105373:     	movq	0x1c0(%rbp), %rax
14010537a:     	movq	%rax, 0x5e8(%rbp)
140105381:     	movq	0x1c8(%rbp), %rax
140105388:     	movq	%rax, 0x5f0(%rbp)
14010538f:     	movaps	0x180(%rbp), %xmm0
140105396:     	movaps	0x190(%rbp), %xmm1
14010539d:     	movaps	0x1a0(%rbp), %xmm2
1401053a4:     	movaps	0x1b0(%rbp), %xmm3
1401053ab:     	movups	%xmm3, 0x5d8(%rbp)
1401053b2:     	movups	%xmm2, 0x5c8(%rbp)
1401053b9:     	movups	%xmm1, 0x5b8(%rbp)
1401053c0:     	movups	%xmm0, 0x5a8(%rbp)
1401053c7:     	movq	$0x0, 0x608(%rbp)
1401053d2:     	movsd	0x583a606(%rip), %xmm0  # 0x14593f9e0
1401053da:     	movups	%xmm0, 0x620(%rbp)
1401053e1:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
1401053eb:     	movq	%rax, 0x630(%rbp)
1401053f2:     	movups	0x583b3de(%rip), %xmm12 # 0x1459407d8
1401053fa:     	movups	%xmm12, 0x670(%rbp)
140105402:     	movups	0x583b3bf(%rip), %xmm0  # 0x1459407c8
140105409:     	movups	%xmm0, 0x660(%rbp)
140105410:     	movups	0x583b3e0(%rip), %xmm15 # 0x1459407f8
140105418:     	movups	%xmm15, 0x690(%rbp)
140105420:     	movups	0x583b3c1(%rip), %xmm0  # 0x1459407e8
140105427:     	movups	%xmm0, 0x680(%rbp)
14010542e:     	movups	0x583b3e3(%rip), %xmm0  # 0x145940818
140105435:     	movups	%xmm0, 0x6b0(%rbp)
14010543c:     	movups	0x583b3c5(%rip), %xmm0  # 0x145940808
140105443:     	movups	%xmm0, 0x6a0(%rbp)
14010544a:     	movups	0x583b3e7(%rip), %xmm0  # 0x145940838
140105451:     	movups	%xmm0, 0x6d0(%rbp)
140105458:     	movups	0x583b3c8(%rip), %xmm11 # 0x145940828
140105460:     	movups	%xmm11, 0x6c0(%rbp)
140105468:     	movaps	0x58133b1(%rip), %xmm0  # 0x145918820
14010546f:     	movups	%xmm0, 0x6e0(%rbp)
140105476:     	movl	$0x1, 0x6f0(%rbp)
140105480:     	movq	$0x0, 0x6f4(%rbp)
14010548b:     	movb	$0x1, 0x6fc(%rbp)
140105492:     	movq	$0x0, 0x700(%rbp)
14010549d:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
1401054a7:     	movw	$0x0, 0x70c(%rbp)
1401054b0:     	movw	$0x0, 0x712(%rbp)
1401054b9:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
1401054c3:     	movw	$0x0, 0x718(%rbp)
1401054cc:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
1401054d6:     	movabsq	$0x100000100, %rax      # imm = 0x100000100
1401054e0:     	movq	%rax, 0x71a(%rbp)
1401054e7:     	movl	$0x5, 0x722(%rbp)
1401054f1:     	movq	%r13, 0x5a0(%rbp)
1401054f8:     	leaq	0x4b0(%rbp), %rcx
1401054ff:     	leaq	0x5a0(%rbp), %r8
140105506:     	callq	0x1400d7270 <.text+0xd6270>
14010550b:     	movq	(%r14), %rsi
14010550e:     	movq	0x4b0(%rbp), %rbx
140105515:     	movq	0x4d8(%rbp), %rax
14010551c:     	movq	%rbx, 0x410(%rbp)
140105523:     	movups	0x4b8(%rbp), %xmm0
14010552a:     	movups	%xmm0, 0x418(%rbp)
140105531:     	movups	0x4c8(%rbp), %xmm0
140105538:     	movups	%xmm0, 0x428(%rbp)
14010553f:     	movq	%rax, 0x438(%rbp)
140105546:     	callq	0x140002200 <.text+0x1200>
14010554b:     	movl	$0x5, %ecx
140105550:     	movl	$0x1, %edx
140105555:     	callq	0x1400021c0 <.text+0x11c0>
14010555a:     	testq	%rax, %rax
14010555d:     	je	0x140108442 <.text+0x107442>
140105563:     	movb	$0x30, 0x4(%rax)
140105567:     	movl	$0x303a3030, (%rax)     # imm = 0x303A3030
14010556d:     	cmpb	$0x1, (%rsi)
140105570:     	jne	0x140105591 <.text+0x104591>
140105572:     	movl	0x1(%rsi), %ecx
140105575:     	movl	0x4(%rsi), %edx
140105578:     	movl	%edx, 0x183(%rbp)
14010557e:     	movl	%ecx, 0x180(%rbp)
140105584:     	movq	0x8(%rsi), %rcx
140105588:     	movzbl	0x10(%rsi), %r8d
14010558d:     	movb	$0x1, %dl
14010558f:     	jmp	0x1401055a1 <.text+0x1045a1>
140105591:     	movq	0x8(%rsi), %rcx
140105595:     	lock
140105596:     	incq	(%rcx)
140105599:     	jle	0x140108463 <.text+0x107463>
14010559f:     	xorl	%edx, %edx
1401055a1:     	leaq	0x418(%rbp), %r15
1401055a8:     	movl	0x180(%rbp), %r9d
1401055af:     	movl	0x183(%rbp), %r10d
1401055b6:     	movl	%r10d, 0x5dc(%rbp)
1401055bd:     	movl	%r9d, 0x5d9(%rbp)
1401055c4:     	movups	0x583b0bd(%rip), %xmm0  # 0x145940688
1401055cb:     	movups	%xmm0, 0x511(%rbp)
1401055d2:     	movl	$0x3f800000, 0x521(%rbp) # imm = 0x3F800000
1401055dc:     	movq	$0x5, 0x5a8(%rbp)
1401055e7:     	movq	%rax, 0x5b0(%rbp)
1401055ee:     	movq	$0x5, 0x5b8(%rbp)
1401055f9:     	movq	$0x0, 0x5c0(%rbp)
140105604:     	movq	$0x4, 0x5c8(%rbp)
14010560f:     	movq	$0x0, 0x5d0(%rbp)
14010561a:     	movb	%dl, 0x5d8(%rbp)
140105620:     	movq	%rcx, 0x5e0(%rbp)
140105627:     	movq	%r8, 0x5e8(%rbp)
14010562e:     	movl	$0x42000000, 0x5f0(%rbp) # imm = 0x42000000
140105638:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
140105641:     	movb	$0x1, 0x5f6(%rbp)
140105648:     	movq	0x51d(%rbp), %rax
14010564f:     	movq	%rax, 0x604(%rbp)
140105656:     	movups	0x510(%rbp), %xmm0
14010565d:     	movups	%xmm0, 0x5f7(%rbp)
140105664:     	movl	0x5813b16(%rip), %edi   # 0x145919180
14010566a:     	movl	%edi, 0x61c(%rbp)
140105670:     	movups	0x5813af9(%rip), %xmm0  # 0x145919170
140105677:     	movups	%xmm0, 0x60c(%rbp)
14010567e:     	movsd	0x581014a(%rip), %xmm0  # 0x1459157d0
140105686:     	movsd	%xmm0, 0x620(%rbp)
14010568e:     	movq	%rbx, 0x5a0(%rbp)
140105695:     	leaq	0x180(%rbp), %rcx
14010569c:     	leaq	0x5a0(%rbp), %r8
1401056a3:     	movq	%r15, %rdx
1401056a6:     	callq	0x1400decb0 <.text+0xddcb0>
1401056ab:     	cmpb	$0x1, (%rsi)
1401056ae:     	movq	%r14, 0x120(%rbp)
1401056b5:     	jne	0x1401056d5 <.text+0x1046d5>
1401056b7:     	movl	0x1(%rsi), %eax
1401056ba:     	movl	0x4(%rsi), %ecx
1401056bd:     	movl	%ecx, 0x183(%rbp)
1401056c3:     	movl	%eax, 0x180(%rbp)
1401056c9:     	movq	0x8(%rsi), %rax
1401056cd:     	movzbl	0x10(%rsi), %edx
1401056d1:     	movb	$0x1, %cl
1401056d3:     	jmp	0x1401056e5 <.text+0x1046e5>
1401056d5:     	movq	0x8(%rsi), %rax
1401056d9:     	lock
1401056da:     	incq	(%rax)
1401056dd:     	jle	0x140108463 <.text+0x107463>
1401056e3:     	xorl	%ecx, %ecx
1401056e5:     	movl	0x180(%rbp), %r8d
1401056ec:     	movl	0x183(%rbp), %r9d
1401056f3:     	movl	%r9d, 0x5dc(%rbp)
1401056fa:     	movl	%r8d, 0x5d9(%rbp)
140105701:     	movups	0x583afc3(%rip), %xmm13 # 0x1459406cc
140105709:     	movups	%xmm13, 0x511(%rbp)
140105711:     	movl	$0x3f800000, 0x521(%rbp) # imm = 0x3F800000
14010571b:     	movq	$0x0, 0x5a8(%rbp)
140105726:     	movq	$0x1, 0x5b0(%rbp)
140105731:     	xorps	%xmm14, %xmm14
140105735:     	movups	%xmm14, 0x5b8(%rbp)
14010573d:     	movq	$0x4, 0x5c8(%rbp)
140105748:     	movq	$0x0, 0x5d0(%rbp)
140105753:     	movb	%cl, 0x5d8(%rbp)
140105759:     	movq	%rax, 0x5e0(%rbp)
140105760:     	movq	%rdx, 0x5e8(%rbp)
140105767:     	movl	$0x41600000, 0x5f0(%rbp) # imm = 0x41600000
140105771:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
14010577a:     	movb	$0x1, 0x5f6(%rbp)
140105781:     	movq	0x51d(%rbp), %rax
140105788:     	movq	%rax, 0x604(%rbp)
14010578f:     	movups	0x510(%rbp), %xmm0
140105796:     	movups	%xmm0, 0x5f7(%rbp)
14010579d:     	movl	%edi, 0x61c(%rbp)
1401057a3:     	movups	0x58139c6(%rip), %xmm0  # 0x145919170
1401057aa:     	movups	%xmm0, 0x60c(%rbp)
1401057b1:     	movsd	0x5810017(%rip), %xmm0  # 0x1459157d0
1401057b9:     	movsd	%xmm0, 0x620(%rbp)
1401057c1:     	movq	%rbx, 0x5a0(%rbp)
1401057c8:     	leaq	0x180(%rbp), %rcx
1401057cf:     	leaq	0x5a0(%rbp), %r8
1401057d6:     	movq	%r15, %rdx
1401057d9:     	callq	0x1400dd4e0 <.text+0xdc4e0>
1401057de:     	movaps	%xmm6, 0x5a0(%rbp)
1401057e5:     	movq	$0x0, 0x5b0(%rbp)
1401057f0:     	movups	%xmm7, 0x5b8(%rbp)
1401057f7:     	movq	$0x0, 0x5c8(%rbp)
140105802:     	movaps	%xmm8, 0x5d0(%rbp)
14010580a:     	movq	$0x0, 0x5e0(%rbp)
140105815:     	movups	%xmm9, 0x5e8(%rbp)
14010581d:     	movq	$0x0, 0x5f8(%rbp)
140105828:     	movaps	%xmm6, 0x180(%rbp)
14010582f:     	movaps	%xmm8, 0x1b0(%rbp)
140105837:     	movq	0x5b0(%rbp), %rax
14010583e:     	movq	%rax, 0x190(%rbp)
140105845:     	movq	0x5b8(%rbp), %rax
14010584c:     	movq	%rax, 0x198(%rbp)
140105853:     	movq	0x5c0(%rbp), %rax
14010585a:     	movq	%rax, 0x1a0(%rbp)
140105861:     	movq	0x5c8(%rbp), %rax
140105868:     	movq	%rax, 0x1a8(%rbp)
14010586f:     	movq	0x5e0(%rbp), %rax
140105876:     	movq	%rax, 0x1c0(%rbp)
14010587d:     	movq	0x5e8(%rbp), %rax
140105884:     	movq	%rax, 0x1c8(%rbp)
14010588b:     	movaps	0x5f0(%rbp), %xmm0
140105892:     	movaps	%xmm0, 0x1d0(%rbp)
140105899:     	movaps	%xmm14, 0x220(%rbp)
1401058a1:     	movaps	%xmm14, 0x210(%rbp)
1401058a9:     	movaps	%xmm14, 0x200(%rbp)
1401058b1:     	movaps	%xmm14, 0x1f0(%rbp)
1401058b9:     	movaps	%xmm14, 0x1e0(%rbp)
1401058c1:     	movq	$0x0, 0x230(%rbp)
1401058cc:     	leaq	0x5a8(%rbp), %rcx
1401058d3:     	leaq	0x180(%rbp), %rdi
1401058da:     	movl	$0xb8, %r8d
1401058e0:     	movq	%rdi, %rdx
1401058e3:     	callq	0x1457731ed <.text+0x57721ed>
1401058e8:     	movaps	0x5810011(%rip), %xmm0  # 0x145915900
1401058ef:     	movups	%xmm0, 0x660(%rbp)
1401058f6:     	movaps	0x583a0f3(%rip), %xmm0  # 0x14593f9f0
1401058fd:     	movups	%xmm0, 0x670(%rbp)
140105904:     	movups	0x583aedd(%rip), %xmm0  # 0x1459407e8
14010590b:     	movups	%xmm0, 0x680(%rbp)
140105912:     	movups	%xmm15, 0x690(%rbp)
14010591a:     	movaps	%xmm7, %xmm9
14010591e:     	movups	0x583aee3(%rip), %xmm7  # 0x145940808
140105925:     	movups	%xmm7, 0x6a0(%rbp)
14010592c:     	movups	0x583aee4(%rip), %xmm10 # 0x145940818
140105934:     	movups	%xmm10, 0x6b0(%rbp)
14010593c:     	movups	%xmm11, 0x6c0(%rbp)
140105944:     	movups	0x583aeed(%rip), %xmm0  # 0x145940838
14010594b:     	movups	%xmm0, 0x6d0(%rbp)
140105952:     	movaps	0x580fe97(%rip), %xmm0  # 0x1459157f0
140105959:     	movups	%xmm0, 0x6e0(%rbp)
140105960:     	movl	$0x1, 0x6f0(%rbp)
14010596a:     	movq	$0x0, 0x6f4(%rbp)
140105975:     	movb	$0x1, 0x6fc(%rbp)
14010597c:     	movq	$0x0, 0x700(%rbp)
140105987:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
140105991:     	movw	$0x0, 0x70c(%rbp)
14010599a:     	movw	$0x0, 0x712(%rbp)
1401059a3:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
1401059ad:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
1401059b7:     	movw	$0x0, 0x718(%rbp)
1401059c0:     	movl	$0x0, 0x71a(%rbp)
1401059ca:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
1401059d4:     	movq	%rax, 0x71e(%rbp)
1401059db:     	movq	%rbx, 0x5a0(%rbp)
1401059e2:     	leaq	0x510(%rbp), %rcx
1401059e9:     	leaq	0x5a0(%rbp), %r8
1401059f0:     	movq	%r15, %rdx
1401059f3:     	callq	0x1400ddf60 <.text+0xdcf60>
1401059f8:     	movaps	%xmm6, 0x510(%rbp)
1401059ff:     	movq	$0x0, 0x520(%rbp)
140105a0a:     	movups	%xmm9, 0x528(%rbp)
140105a12:     	movups	0x583ad3e(%rip), %xmm9  # 0x145940758
140105a1a:     	movq	$0x0, 0x538(%rbp)
140105a25:     	movaps	%xmm8, 0x540(%rbp)
140105a2d:     	movq	$0x0, 0x550(%rbp)
140105a38:     	movups	%xmm9, 0x558(%rbp)
140105a40:     	movq	$0x0, 0x568(%rbp)
140105a4b:     	movaps	%xmm6, 0x180(%rbp)
140105a52:     	movaps	%xmm8, 0x1b0(%rbp)
140105a5a:     	movq	0x520(%rbp), %rax
140105a61:     	movq	%rax, 0x190(%rbp)
140105a68:     	movq	0x528(%rbp), %rax
140105a6f:     	movq	%rax, 0x198(%rbp)
140105a76:     	movq	0x530(%rbp), %rax
140105a7d:     	movq	%rax, 0x1a0(%rbp)
140105a84:     	movq	0x538(%rbp), %rax
140105a8b:     	movq	%rax, 0x1a8(%rbp)
140105a92:     	movq	0x550(%rbp), %rax
140105a99:     	movq	%rax, 0x1c0(%rbp)
140105aa0:     	movq	0x558(%rbp), %rax
140105aa7:     	movq	%rax, 0x1c8(%rbp)
140105aae:     	movaps	0x560(%rbp), %xmm0
140105ab5:     	movaps	%xmm0, 0x1d0(%rbp)
140105abc:     	movaps	%xmm14, 0x1e0(%rbp)
140105ac4:     	movups	%xmm14, 0x648(%rbp)
140105acc:     	movups	%xmm14, 0x638(%rbp)
140105ad4:     	movups	%xmm14, 0x628(%rbp)
140105adc:     	movq	$0x0, 0x658(%rbp)
140105ae7:     	movq	$0x0, 0x71c(%rbp)
140105af2:     	movw	$0x0, 0x724(%rbp)
140105afb:     	movups	%xmm14, 0x411(%rbp)
140105b03:     	movups	%xmm14, 0x608(%rbp)
140105b0b:     	movaps	0x180(%rbp), %xmm0
140105b12:     	movaps	0x190(%rbp), %xmm1
140105b19:     	movaps	0x1a0(%rbp), %xmm2
140105b20:     	movaps	0x1b0(%rbp), %xmm3
140105b27:     	movups	%xmm0, 0x5a8(%rbp)
140105b2e:     	movups	%xmm1, 0x5b8(%rbp)
140105b35:     	movups	%xmm2, 0x5c8(%rbp)
140105b3c:     	movups	%xmm3, 0x5d8(%rbp)
140105b43:     	movaps	0x1c0(%rbp), %xmm0
140105b4a:     	movups	%xmm0, 0x5e8(%rbp)
140105b51:     	movaps	0x1d0(%rbp), %xmm0
140105b58:     	movups	%xmm0, 0x5f8(%rbp)
140105b5f:     	movaps	0x5839e9a(%rip), %xmm0  # 0x14593fa00
140105b66:     	movups	%xmm0, 0x618(%rbp)
140105b6d:     	movups	%xmm12, 0x670(%rbp)
140105b75:     	movups	0x583ac4c(%rip), %xmm0  # 0x1459407c8
140105b7c:     	movups	%xmm0, 0x660(%rbp)
140105b83:     	movaps	0x5812ca6(%rip), %xmm0  # 0x145918830
140105b8a:     	movups	%xmm0, 0x680(%rbp)
140105b91:     	movaps	0x5801958(%rip), %xmm0  # 0x1459074f0
140105b98:     	movups	%xmm0, 0x690(%rbp)
140105b9f:     	movups	%xmm10, 0x6b0(%rbp)
140105ba7:     	movups	%xmm7, 0x6a0(%rbp)
140105bae:     	movaps	0x580d56b(%rip), %xmm0  # 0x145913120
140105bb5:     	movups	%xmm0, 0x6c0(%rbp)
140105bbc:     	movups	%xmm0, 0x6d0(%rbp)
140105bc3:     	movaps	0x58018f6(%rip), %xmm0  # 0x1459074c0
140105bca:     	movups	%xmm0, 0x6e0(%rbp)
140105bd1:     	movl	$0x1, 0x6f0(%rbp)
140105bdb:     	movss	0x5839e2d(%rip), %xmm0  # 0x14593fa10
140105be3:     	movlps	%xmm0, 0x6f4(%rbp)
140105bea:     	movb	$0x1, 0x6fc(%rbp)
140105bf1:     	movq	$0x0, 0x700(%rbp)
140105bfc:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
140105c06:     	movw	$0x0, 0x70c(%rbp)
140105c0f:     	movw	$0x0, 0x712(%rbp)
140105c18:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
140105c22:     	movw	$0x0, 0x718(%rbp)
140105c2b:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
140105c35:     	movw	$0x100, 0x71a(%rbp)     # imm = 0x100
140105c3e:     	movw	$0x0, 0x728(%rbp)
140105c47:     	movb	$0x2, 0x72a(%rbp)
140105c4e:     	movzbl	0x420(%rbp), %eax
140105c55:     	movb	%al, 0x73b(%rbp)
140105c5b:     	movups	0x410(%rbp), %xmm0
140105c62:     	movups	%xmm0, 0x72b(%rbp)
140105c69:     	movl	$0x3ee66666, 0x73c(%rbp) # imm = 0x3EE66666
140105c73:     	movq	%r13, 0x5a0(%rbp)
140105c7a:     	leaq	0x4b0(%rbp), %rcx
140105c81:     	leaq	0x5a0(%rbp), %r8
140105c88:     	leaq	0xc8(%rbp), %rdx
140105c8f:     	callq	0x1400ddcb0 <.text+0xdccb0>
140105c94:     	movq	0x4b0(%rbp), %r14
140105c9b:     	movq	0x4d8(%rbp), %rax
140105ca2:     	movq	%r14, 0x410(%rbp)
140105ca9:     	movups	0x4b8(%rbp), %xmm0
140105cb0:     	movups	%xmm0, 0x418(%rbp)
140105cb7:     	movups	0x4c8(%rbp), %xmm0
140105cbe:     	movups	%xmm0, 0x428(%rbp)
140105cc5:     	movq	%rax, 0x438(%rbp)
140105ccc:     	leaq	0x583b407(%rip), %rcx   # 0x1459410da
140105cd3:     	movl	$0x9, %edx
140105cd8:     	callq	0x145457c00 <.text+0x5456c00>
140105cdd:     	movq	%rax, 0x180(%rbp)
140105ce4:     	movq	%rdx, 0x188(%rbp)
140105ceb:     	movq	%rdi, 0x5a0(%rbp)
140105cf2:     	leaq	-0x103c39(%rip), %r15   # 0x1400020c0 <.text+0x10c0>
140105cf9:     	movq	%r15, 0x5a8(%rbp)
140105d00:     	leaq	0x583a97d(%rip), %rdx   # 0x145940684
140105d07:     	leaq	0xf0(%rbp), %rcx
140105d0e:     	leaq	0x5a0(%rbp), %r8
140105d15:     	callq	0x145728390 <.text+0x5727390>
140105d1a:     	cmpb	$0x1, (%rsi)
140105d1d:     	jne	0x140105d42 <.text+0x104d42>
140105d1f:     	movaps	%xmm9, %xmm14
140105d23:     	movl	0x1(%rsi), %eax
140105d26:     	movl	0x4(%rsi), %ecx
140105d29:     	movl	%ecx, 0x513(%rbp)
140105d2f:     	movl	%eax, 0x510(%rbp)
140105d35:     	movq	0x8(%rsi), %rax
140105d39:     	movzbl	0x10(%rsi), %r10d
140105d3e:     	movb	$0x1, %cl
140105d40:     	jmp	0x140105d56 <.text+0x104d56>
140105d42:     	movq	0x8(%rsi), %rax
140105d46:     	lock
140105d47:     	incq	(%rax)
140105d4a:     	jle	0x140108463 <.text+0x107463>
140105d50:     	movaps	%xmm9, %xmm14
140105d54:     	xorl	%ecx, %ecx
140105d56:     	movaps	%xmm12, %xmm10
140105d5a:     	movups	0x583a9c6(%rip), %xmm9  # 0x145940728
140105d62:     	leaq	0x418(%rbp), %rdx
140105d69:     	movq	0x100(%rbp), %r8
140105d70:     	movq	%r8, 0x5b8(%rbp)
140105d77:     	movups	0xf0(%rbp), %xmm0
140105d7e:     	movups	%xmm0, 0x5a8(%rbp)
140105d85:     	movl	0x510(%rbp), %r8d
140105d8c:     	movl	0x513(%rbp), %r9d
140105d93:     	movl	%r8d, 0x5d9(%rbp)
140105d9a:     	movl	%r9d, 0x5dc(%rbp)
140105da1:     	movups	%xmm13, 0x181(%rbp)
140105da9:     	movl	$0x3f800000, 0x191(%rbp) # imm = 0x3F800000
140105db3:     	movq	$0x0, 0x5c0(%rbp)
140105dbe:     	movq	$0x4, 0x5c8(%rbp)
140105dc9:     	movq	$0x0, 0x5d0(%rbp)
140105dd4:     	movb	%cl, 0x5d8(%rbp)
140105dda:     	movq	%rax, 0x5e0(%rbp)
140105de1:     	movq	%r10, 0x5e8(%rbp)
140105de8:     	movl	$0x41700000, 0x5f0(%rbp) # imm = 0x41700000
140105df2:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
140105dfb:     	movb	$0x1, 0x5f6(%rbp)
140105e02:     	movq	0x18d(%rbp), %rax
140105e09:     	movq	%rax, 0x604(%rbp)
140105e10:     	movups	0x180(%rbp), %xmm0
140105e17:     	movups	%xmm0, 0x5f7(%rbp)
140105e1e:     	movl	0x581335c(%rip), %eax   # 0x145919180
140105e24:     	movl	%eax, 0x61c(%rbp)
140105e2a:     	movups	0x581333f(%rip), %xmm0  # 0x145919170
140105e31:     	movups	%xmm0, 0x60c(%rbp)
140105e38:     	movsd	0x580f990(%rip), %xmm0  # 0x1459157d0
140105e40:     	movsd	%xmm0, 0x620(%rbp)
140105e48:     	movq	%r14, 0x5a0(%rbp)
140105e4f:     	leaq	0x510(%rbp), %rcx
140105e56:     	leaq	0x5a0(%rbp), %r8
140105e5d:     	callq	0x1400dbfa0 <.text+0xdafa0>
140105e62:     	callq	0x140002200 <.text+0x1200>
140105e67:     	movl	$0x1, %ecx
140105e6c:     	movl	$0x1, %edx
140105e71:     	callq	0x1400021c0 <.text+0x11c0>
140105e76:     	testq	%rax, %rax
140105e79:     	movups	0x583a967(%rip), %xmm15 # 0x1459407e8
140105e81:     	movups	0x583a940(%rip), %xmm7  # 0x1459407c8
140105e88:     	je	0x140108431 <.text+0x107431>
140105e8e:     	movb	$0x30, (%rax)
140105e91:     	cmpb	$0x1, (%rsi)
140105e94:     	jne	0x140105eb5 <.text+0x104eb5>
140105e96:     	movl	0x1(%rsi), %ecx
140105e99:     	movl	0x4(%rsi), %edx
140105e9c:     	movl	%edx, 0x5a3(%rbp)
140105ea2:     	movl	%ecx, 0x5a0(%rbp)
140105ea8:     	movq	0x8(%rsi), %rcx
140105eac:     	movzbl	0x10(%rsi), %edx
140105eb0:     	movb	$0x1, %r8b
140105eb3:     	jmp	0x140105ec6 <.text+0x104ec6>
140105eb5:     	movq	0x8(%rsi), %rcx
140105eb9:     	lock
140105eba:     	incq	(%rcx)
140105ebd:     	jle	0x140108463 <.text+0x107463>
140105ec3:     	xorl	%r8d, %r8d
140105ec6:     	movq	%r13, %rdi
140105ec9:     	movq	%r12, 0x128(%rbp)
140105ed0:     	movq	$0x1, 0x180(%rbp)
140105edb:     	movq	%rax, 0x188(%rbp)
140105ee2:     	movq	$0x1, 0x190(%rbp)
140105eed:     	movq	$0x0, 0x198(%rbp)
140105ef8:     	movq	$0x4, 0x1a0(%rbp)
140105f03:     	movq	$0x0, 0x1a8(%rbp)
140105f0e:     	movb	%r8b, 0x1b0(%rbp)
140105f15:     	movl	0x5a0(%rbp), %eax
140105f1b:     	movl	0x5a3(%rbp), %r8d
140105f22:     	movl	%eax, 0x1b1(%rbp)
140105f28:     	movl	%r8d, 0x1b4(%rbp)
140105f2f:     	movq	%rcx, 0x1b8(%rbp)
140105f36:     	movq	%rdx, 0x1c0(%rbp)
140105f3d:     	movl	$0x41880000, 0x1c8(%rbp) # imm = 0x41880000
140105f47:     	movw	$0x190, 0x1cc(%rbp)     # imm = 0x190
140105f50:     	movb	$0x1, 0x1ce(%rbp)
140105f57:     	movups	0x583a72a(%rip), %xmm0  # 0x145940688
140105f5e:     	movups	%xmm0, 0x1d0(%rbp)
140105f65:     	movl	$0x3f800000, 0x1e0(%rbp) # imm = 0x3F800000
140105f6f:     	movq	0x510(%rbp), %rax
140105f76:     	movq	0x520(%rbp), %rcx
140105f7d:     	movq	%rax, 0x1e8(%rbp)
140105f84:     	movb	$0x1, 0x837(%rbp)
140105f8b:     	callq	0x144e2ce50 <.text+0x4e2be50>
140105f90:     	nop
140105f91:     	movq	%rax, %r12
140105f94:     	movq	0x528(%rbp), %r13
140105f9b:     	testq	%r13, %r13
140105f9e:     	je	0x140106048 <.text+0x105048>
140105fa4:     	movups	0x1e0(%rbp), %xmm0
140105fab:     	movaps	%xmm0, 0x600(%rbp)
140105fb2:     	movups	0x1d0(%rbp), %xmm0
140105fb9:     	movaps	%xmm0, 0x5f0(%rbp)
140105fc0:     	movups	0x1c0(%rbp), %xmm0
140105fc7:     	movaps	%xmm0, 0x5e0(%rbp)
140105fce:     	movups	0x180(%rbp), %xmm0
140105fd5:     	movups	0x190(%rbp), %xmm1
140105fdc:     	movups	0x1a0(%rbp), %xmm2
140105fe3:     	movups	0x1b0(%rbp), %xmm3
140105fea:     	movaps	%xmm3, 0x5d0(%rbp)
140105ff1:     	movaps	%xmm2, 0x5c0(%rbp)
140105ff8:     	movaps	%xmm1, 0x5b0(%rbp)
140105fff:     	movaps	%xmm0, 0x5a0(%rbp)
140106006:     	movq	%r12, 0x610(%rbp)
14010600d:     	movq	(%r13), %rax
140106011:     	movq	0x10(%r13), %rbx
140106015:     	subq	%rbx, %rax
140106018:     	cmpq	$0x7f, %rax
14010601c:     	ja	0x1401060cd <.text+0x1050cd>
140106022:     	movq	$0x1, 0x20(%rsp)
14010602b:     	movl	$0x80, %r8d
140106031:     	movl	$0x1, %r9d
140106037:     	movq	%r13, %rcx
14010603a:     	movq	%rbx, %rdx
14010603d:     	callq	0x1457744b0 <.text+0x57734b0>
140106042:     	nop
140106043:     	jmp	0x1401060cd <.text+0x1050cd>
140106048:     	movq	0x530(%rbp), %r13
14010604f:     	movups	0x1e0(%rbp), %xmm0
140106056:     	movaps	%xmm0, 0x600(%rbp)
14010605d:     	movups	0x1d0(%rbp), %xmm0
140106064:     	movaps	%xmm0, 0x5f0(%rbp)
14010606b:     	movups	0x1c0(%rbp), %xmm0
140106072:     	movaps	%xmm0, 0x5e0(%rbp)
140106079:     	movups	0x180(%rbp), %xmm0
140106080:     	movups	0x190(%rbp), %xmm1
140106087:     	movups	0x1a0(%rbp), %xmm2
14010608e:     	movups	0x1b0(%rbp), %xmm3
140106095:     	movaps	%xmm3, 0x5d0(%rbp)
14010609c:     	movaps	%xmm2, 0x5c0(%rbp)
1401060a3:     	movaps	%xmm1, 0x5b0(%rbp)
1401060aa:     	movaps	%xmm0, 0x5a0(%rbp)
1401060b1:     	movq	%r12, 0x610(%rbp)
1401060b8:     	movq	(%r13), %rax
1401060bc:     	movq	0x10(%r13), %rbx
1401060c0:     	subq	%rbx, %rax
1401060c3:     	cmpq	$0x7f, %rax
1401060c7:     	jbe	0x140108399 <.text+0x107399>
1401060cd:     	movq	0x8(%r13), %rax
1401060d1:     	leaq	0x70718(%rip), %rcx     # 0x1401767f0 <.text+0x1757f0>
1401060d8:     	movq	%rcx, (%rax,%rbx)
1401060dc:     	movups	0x180(%rbp), %xmm0
1401060e3:     	movups	0x190(%rbp), %xmm1
1401060ea:     	movups	0x1a0(%rbp), %xmm2
1401060f1:     	movups	0x1b0(%rbp), %xmm3
1401060f8:     	movups	%xmm0, 0x8(%rax,%rbx)
1401060fd:     	movups	%xmm1, 0x18(%rax,%rbx)
140106102:     	movups	%xmm2, 0x28(%rax,%rbx)
140106107:     	movups	%xmm3, 0x38(%rax,%rbx)
14010610c:     	movups	0x1c0(%rbp), %xmm0
140106113:     	movups	%xmm0, 0x48(%rax,%rbx)
140106118:     	movups	0x1d0(%rbp), %xmm0
14010611f:     	movups	%xmm0, 0x58(%rax,%rbx)
140106124:     	movups	0x1e0(%rbp), %xmm0
14010612b:     	movups	%xmm0, 0x68(%rax,%rbx)
140106130:     	movq	%r12, 0x78(%rax,%rbx)
140106135:     	subq	$-0x80, %rbx
140106139:     	movq	%rbx, 0x10(%r13)
14010613d:     	leaq	0x583af9f(%rip), %rcx   # 0x1459410e3
140106144:     	movl	$0x8, %edx
140106149:     	callq	0x145457c00 <.text+0x5456c00>
14010614e:     	movq	%rax, 0x180(%rbp)
140106155:     	movq	%rdx, 0x188(%rbp)
14010615c:     	leaq	0x180(%rbp), %rax
140106163:     	movq	%rax, 0x5a0(%rbp)
14010616a:     	movq	%r15, 0x5a8(%rbp)
140106171:     	leaq	0x583a50c(%rip), %rdx   # 0x145940684
140106178:     	leaq	0x130(%rbp), %rcx
14010617f:     	leaq	0x5a0(%rbp), %r8
140106186:     	callq	0x145728390 <.text+0x5727390>
14010618b:     	cmpb	$0x1, (%rsi)
14010618e:     	movl	0x5812feb(%rip), %r12d  # 0x145919180
140106195:     	leaq	0x418(%rbp), %rdx
14010619c:     	jne	0x1401061bd <.text+0x1051bd>
14010619e:     	movl	0x1(%rsi), %eax
1401061a1:     	movl	0x4(%rsi), %ecx
1401061a4:     	movl	%ecx, 0x513(%rbp)
1401061aa:     	movl	%eax, 0x510(%rbp)
1401061b0:     	movq	0x8(%rsi), %rax
1401061b4:     	movzbl	0x10(%rsi), %r10d
1401061b9:     	movb	$0x1, %cl
1401061bb:     	jmp	0x1401061cd <.text+0x1051cd>
1401061bd:     	movq	0x8(%rsi), %rax
1401061c1:     	lock
1401061c2:     	incq	(%rax)
1401061c5:     	jle	0x140108463 <.text+0x107463>
1401061cb:     	xorl	%ecx, %ecx
1401061cd:     	movq	0x140(%rbp), %r8
1401061d4:     	movq	%r8, 0x5b8(%rbp)
1401061db:     	movups	0x130(%rbp), %xmm0
1401061e2:     	movups	%xmm0, 0x5a8(%rbp)
1401061e9:     	movl	0x510(%rbp), %r8d
1401061f0:     	movl	0x513(%rbp), %r9d
1401061f7:     	movl	%r8d, 0x5d9(%rbp)
1401061fe:     	movl	%r9d, 0x5dc(%rbp)
140106205:     	movups	%xmm13, 0x181(%rbp)
14010620d:     	movl	$0x3f800000, 0x191(%rbp) # imm = 0x3F800000
140106217:     	movq	$0x0, 0x5c0(%rbp)
140106222:     	movq	$0x4, 0x5c8(%rbp)
14010622d:     	movq	$0x0, 0x5d0(%rbp)
140106238:     	movb	%cl, 0x5d8(%rbp)
14010623e:     	movq	%rax, 0x5e0(%rbp)
140106245:     	movq	%r10, 0x5e8(%rbp)
14010624c:     	movl	$0x41700000, 0x5f0(%rbp) # imm = 0x41700000
140106256:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
14010625f:     	movb	$0x1, 0x5f6(%rbp)
140106266:     	movq	0x18d(%rbp), %rax
14010626d:     	movq	%rax, 0x604(%rbp)
140106274:     	movups	0x180(%rbp), %xmm0
14010627b:     	movups	%xmm0, 0x5f7(%rbp)
140106282:     	movl	%r12d, 0x61c(%rbp)
140106289:     	movups	0x5812ee0(%rip), %xmm0  # 0x145919170
140106290:     	movups	%xmm0, 0x60c(%rbp)
140106297:     	movsd	0x580f531(%rip), %xmm0  # 0x1459157d0
14010629f:     	movsd	%xmm0, 0x620(%rbp)
1401062a7:     	movq	%r14, 0x5a0(%rbp)
1401062ae:     	leaq	0x510(%rbp), %rcx
1401062b5:     	leaq	0x5a0(%rbp), %r8
1401062bc:     	callq	0x1400dbfa0 <.text+0xdafa0>
1401062c1:     	callq	0x140002200 <.text+0x1200>
1401062c6:     	movl	$0x1, %ecx
1401062cb:     	movl	$0x1, %edx
1401062d0:     	callq	0x1400021c0 <.text+0x11c0>
1401062d5:     	testq	%rax, %rax
1401062d8:     	je	0x140108431 <.text+0x107431>
1401062de:     	movb	$0x30, (%rax)
1401062e1:     	cmpb	$0x1, (%rsi)
1401062e4:     	jne	0x140106305 <.text+0x105305>
1401062e6:     	movl	0x1(%rsi), %ecx
1401062e9:     	movl	0x4(%rsi), %edx
1401062ec:     	movl	%edx, 0x5a3(%rbp)
1401062f2:     	movl	%ecx, 0x5a0(%rbp)
1401062f8:     	movq	0x8(%rsi), %rcx
1401062fc:     	movzbl	0x10(%rsi), %edx
140106300:     	movb	$0x1, %r8b
140106303:     	jmp	0x140106316 <.text+0x105316>
140106305:     	movq	0x8(%rsi), %rcx
140106309:     	lock
14010630a:     	incq	(%rcx)
14010630d:     	jle	0x140108463 <.text+0x107463>
140106313:     	xorl	%r8d, %r8d
140106316:     	movq	$0x1, 0x180(%rbp)
140106321:     	movq	%rax, 0x188(%rbp)
140106328:     	movq	$0x1, 0x190(%rbp)
140106333:     	movq	$0x0, 0x198(%rbp)
14010633e:     	movq	$0x4, 0x1a0(%rbp)
140106349:     	movq	$0x0, 0x1a8(%rbp)
140106354:     	movb	%r8b, 0x1b0(%rbp)
14010635b:     	movl	0x5a0(%rbp), %eax
140106361:     	movl	0x5a3(%rbp), %r8d
140106368:     	movl	%eax, 0x1b1(%rbp)
14010636e:     	movl	%r8d, 0x1b4(%rbp)
140106375:     	movq	%rcx, 0x1b8(%rbp)
14010637c:     	movq	%rdx, 0x1c0(%rbp)
140106383:     	movl	$0x41880000, 0x1c8(%rbp) # imm = 0x41880000
14010638d:     	movw	$0x190, 0x1cc(%rbp)     # imm = 0x190
140106396:     	movb	$0x1, 0x1ce(%rbp)
14010639d:     	movups	0x583a2e4(%rip), %xmm0  # 0x145940688
1401063a4:     	movups	%xmm0, 0x1d0(%rbp)
1401063ab:     	movl	$0x3f800000, 0x1e0(%rbp) # imm = 0x3F800000
1401063b5:     	movq	0x510(%rbp), %rax
1401063bc:     	movq	0x520(%rbp), %rcx
1401063c3:     	movq	%rax, 0x1e8(%rbp)
1401063ca:     	movb	$0x1, 0x836(%rbp)
1401063d1:     	callq	0x144e2ce50 <.text+0x4e2be50>
1401063d6:     	nop
1401063d7:     	movq	%rax, %r14
1401063da:     	movq	0x528(%rbp), %r15
1401063e1:     	movaps	%xmm8, %xmm13
1401063e5:     	movaps	%xmm11, %xmm6
1401063e9:     	testq	%r15, %r15
1401063ec:     	je	0x140106495 <.text+0x105495>
1401063f2:     	movups	0x1e0(%rbp), %xmm0
1401063f9:     	movaps	%xmm0, 0x600(%rbp)
140106400:     	movups	0x1d0(%rbp), %xmm0
140106407:     	movaps	%xmm0, 0x5f0(%rbp)
14010640e:     	movups	0x1c0(%rbp), %xmm0
140106415:     	movaps	%xmm0, 0x5e0(%rbp)
14010641c:     	movups	0x180(%rbp), %xmm0
140106423:     	movups	0x190(%rbp), %xmm1
14010642a:     	movups	0x1a0(%rbp), %xmm2
140106431:     	movups	0x1b0(%rbp), %xmm3
140106438:     	movaps	%xmm3, 0x5d0(%rbp)
14010643f:     	movaps	%xmm2, 0x5c0(%rbp)
140106446:     	movaps	%xmm1, 0x5b0(%rbp)
14010644d:     	movaps	%xmm0, 0x5a0(%rbp)
140106454:     	movq	%r14, 0x610(%rbp)
14010645b:     	movq	(%r15), %rax
14010645e:     	movq	0x10(%r15), %rbx
140106462:     	subq	%rbx, %rax
140106465:     	cmpq	$0x7f, %rax
140106469:     	ja	0x140106519 <.text+0x105519>
14010646f:     	movq	$0x1, 0x20(%rsp)
140106478:     	movl	$0x80, %r8d
14010647e:     	movl	$0x1, %r9d
140106484:     	movq	%r15, %rcx
140106487:     	movq	%rbx, %rdx
14010648a:     	callq	0x1457744b0 <.text+0x57734b0>
14010648f:     	nop
140106490:     	jmp	0x140106519 <.text+0x105519>
140106495:     	movq	0x530(%rbp), %r15
14010649c:     	movups	0x1e0(%rbp), %xmm0
1401064a3:     	movaps	%xmm0, 0x600(%rbp)
1401064aa:     	movups	0x1d0(%rbp), %xmm0
1401064b1:     	movaps	%xmm0, 0x5f0(%rbp)
1401064b8:     	movups	0x1c0(%rbp), %xmm0
1401064bf:     	movaps	%xmm0, 0x5e0(%rbp)
1401064c6:     	movups	0x180(%rbp), %xmm0
1401064cd:     	movups	0x190(%rbp), %xmm1
1401064d4:     	movups	0x1a0(%rbp), %xmm2
1401064db:     	movups	0x1b0(%rbp), %xmm3
1401064e2:     	movaps	%xmm3, 0x5d0(%rbp)
1401064e9:     	movaps	%xmm2, 0x5c0(%rbp)
1401064f0:     	movaps	%xmm1, 0x5b0(%rbp)
1401064f7:     	movaps	%xmm0, 0x5a0(%rbp)
1401064fe:     	movq	%r14, 0x610(%rbp)
140106505:     	movq	(%r15), %rax
140106508:     	movq	0x10(%r15), %rbx
14010650c:     	subq	%rbx, %rax
14010650f:     	cmpq	$0x7f, %rax
140106513:     	jbe	0x1401083bf <.text+0x1073bf>
140106519:     	movq	0x8(%r15), %rax
14010651d:     	leaq	0x701dc(%rip), %rcx     # 0x140176700 <.text+0x175700>
140106524:     	movq	%rcx, (%rax,%rbx)
140106528:     	movups	0x180(%rbp), %xmm0
14010652f:     	movups	0x190(%rbp), %xmm1
140106536:     	movups	0x1a0(%rbp), %xmm2
14010653d:     	movups	0x1b0(%rbp), %xmm3
140106544:     	movups	%xmm0, 0x8(%rax,%rbx)
140106549:     	movups	%xmm1, 0x18(%rax,%rbx)
14010654e:     	movups	%xmm2, 0x28(%rax,%rbx)
140106553:     	movups	%xmm3, 0x38(%rax,%rbx)
140106558:     	movups	0x1c0(%rbp), %xmm0
14010655f:     	movups	%xmm0, 0x48(%rax,%rbx)
140106564:     	movups	0x1d0(%rbp), %xmm0
14010656b:     	movups	%xmm0, 0x58(%rax,%rbx)
140106570:     	movups	0x1e0(%rbp), %xmm0
140106577:     	movups	%xmm0, 0x68(%rax,%rbx)
14010657c:     	movq	%r14, 0x78(%rax,%rbx)
140106581:     	subq	$-0x80, %rbx
140106585:     	movq	%rbx, 0x10(%r15)
140106589:     	movups	0x583a17f(%rip), %xmm8  # 0x145940710
140106591:     	movaps	%xmm8, 0x510(%rbp)
140106599:     	movq	$0x0, 0x520(%rbp)
1401065a4:     	movups	%xmm9, 0x528(%rbp)
1401065ac:     	movq	$0x0, 0x538(%rbp)
1401065b7:     	movaps	%xmm13, 0x540(%rbp)
1401065bf:     	movq	$0x0, 0x550(%rbp)
1401065ca:     	movups	%xmm14, 0x558(%rbp)
1401065d2:     	movq	$0x0, 0x568(%rbp)
1401065dd:     	movups	%xmm8, 0x185(%rbp)
1401065e5:     	movups	%xmm13, 0x1b5(%rbp)
1401065ed:     	movq	0x520(%rbp), %rax
1401065f4:     	movq	%rax, 0x195(%rbp)
1401065fb:     	movq	0x528(%rbp), %rax
140106602:     	movq	%rax, 0x19d(%rbp)
140106609:     	movq	0x530(%rbp), %rax
140106610:     	movq	%rax, 0x1a5(%rbp)
140106617:     	movq	0x538(%rbp), %rax
14010661e:     	movq	%rax, 0x1ad(%rbp)
140106625:     	movq	0x550(%rbp), %rax
14010662c:     	movq	%rax, 0x1c5(%rbp)
140106633:     	movq	0x558(%rbp), %rax
14010663a:     	movq	%rax, 0x1cd(%rbp)
140106641:     	movaps	0x560(%rbp), %xmm0
140106648:     	movups	%xmm0, 0x1d5(%rbp)
14010664f:     	xorps	%xmm14, %xmm14
140106653:     	movups	%xmm14, 0x650(%rbp)
14010665b:     	movups	%xmm14, 0x640(%rbp)
140106663:     	movups	%xmm14, 0x630(%rbp)
14010666b:     	movq	$0x0, 0x660(%rbp)
140106676:     	movl	$0x0, 0x727(%rbp)
140106680:     	movl	$0x0, 0x72a(%rbp)
14010668a:     	movw	$0x1, 0x5a8(%rbp)
140106693:     	movb	$0x2, 0x5aa(%rbp)
14010669a:     	movups	0x180(%rbp), %xmm0
1401066a1:     	movups	%xmm0, 0x5ab(%rbp)
1401066a8:     	movups	0x190(%rbp), %xmm0
1401066af:     	movups	%xmm0, 0x5bb(%rbp)
1401066b6:     	movups	0x1a0(%rbp), %xmm0
1401066bd:     	movups	%xmm0, 0x5cb(%rbp)
1401066c4:     	movups	0x1b0(%rbp), %xmm0
1401066cb:     	movups	%xmm0, 0x5db(%rbp)
1401066d2:     	movups	0x1c0(%rbp), %xmm0
1401066d9:     	movups	%xmm0, 0x5eb(%rbp)
1401066e0:     	movups	0x1d0(%rbp), %xmm0
1401066e7:     	movups	%xmm0, 0x5fb(%rbp)
1401066ee:     	movq	0x1dd(%rbp), %rax
1401066f5:     	movq	%rax, 0x608(%rbp)
1401066fc:     	movaps	0x581231d(%rip), %xmm0  # 0x145918a20
140106703:     	movups	%xmm0, 0x610(%rbp)
14010670a:     	movaps	0x583930f(%rip), %xmm0  # 0x14593fa20
140106711:     	movups	%xmm0, 0x620(%rbp)
140106718:     	movups	%xmm10, 0x678(%rbp)
140106720:     	movups	%xmm7, 0x668(%rbp)
140106727:     	movups	0x583a0ca(%rip), %xmm7  # 0x1459407f8
14010672e:     	movups	%xmm7, 0x698(%rbp)
140106735:     	movups	%xmm15, 0x688(%rbp)
14010673d:     	movaps	%xmm10, %xmm12
140106741:     	movups	0x583a0cf(%rip), %xmm10 # 0x145940818
140106749:     	movups	%xmm10, 0x6b8(%rbp)
140106751:     	movups	0x583a0af(%rip), %xmm15 # 0x145940808
140106759:     	movups	%xmm15, 0x6a8(%rbp)
140106761:     	movups	0x583a0cf(%rip), %xmm11 # 0x145940838
140106769:     	movups	%xmm11, 0x6d8(%rbp)
140106771:     	movups	%xmm6, 0x6c8(%rbp)
140106778:     	movaps	0x58120d1(%rip), %xmm0  # 0x145918850
14010677f:     	movups	%xmm0, 0x6e8(%rbp)
140106786:     	movl	$0x1, 0x6f8(%rbp)
140106790:     	movq	$0x0, 0x6fc(%rbp)
14010679b:     	movb	$0x1, 0x704(%rbp)
1401067a2:     	movq	$0x0, 0x708(%rbp)
1401067ad:     	movl	$0x3f800000, 0x710(%rbp) # imm = 0x3F800000
1401067b7:     	movw	$0x0, 0x714(%rbp)
1401067c0:     	movw	$0x0, 0x71a(%rbp)
1401067c9:     	movl	$0x10000, 0x716(%rbp)   # imm = 0x10000
1401067d3:     	movw	$0x0, 0x720(%rbp)
1401067dc:     	movl	$0x10000, 0x71c(%rbp)   # imm = 0x10000
1401067e6:     	movl	$0x100, 0x722(%rbp)     # imm = 0x100
1401067f0:     	movb	$0x1, 0x726(%rbp)
1401067f7:     	movq	%rdi, 0x5a0(%rbp)
1401067fe:     	leaq	0x510(%rbp), %rcx
140106805:     	leaq	0x5a0(%rbp), %r8
14010680c:     	leaq	0xc8(%rbp), %rbx
140106813:     	movq	%rbx, %rdx
140106816:     	callq	0x1400dea00 <.text+0xdda00>
14010681b:     	movaps	%xmm8, 0x510(%rbp)
140106823:     	movq	$0x0, 0x520(%rbp)
14010682e:     	movups	%xmm9, 0x528(%rbp)
140106836:     	movups	0x5839f1a(%rip), %xmm9  # 0x145940758
14010683e:     	movq	$0x0, 0x538(%rbp)
140106849:     	movaps	%xmm13, 0x540(%rbp)
140106851:     	movq	$0x0, 0x550(%rbp)
14010685c:     	movups	%xmm9, 0x558(%rbp)
140106864:     	movq	$0x0, 0x568(%rbp)
14010686f:     	movaps	0x560(%rbp), %xmm0
140106876:     	movaps	%xmm0, 0x1d0(%rbp)
14010687d:     	movaps	%xmm8, 0x180(%rbp)
140106885:     	movaps	%xmm13, %xmm8
140106889:     	movaps	%xmm13, 0x1b0(%rbp)
140106891:     	movq	0x520(%rbp), %rax
140106898:     	movq	%rax, 0x190(%rbp)
14010689f:     	movq	0x528(%rbp), %rax
1401068a6:     	movq	%rax, 0x198(%rbp)
1401068ad:     	movq	0x530(%rbp), %rax
1401068b4:     	movq	%rax, 0x1a0(%rbp)
1401068bb:     	movq	0x538(%rbp), %rax
1401068c2:     	movq	%rax, 0x1a8(%rbp)
1401068c9:     	movq	0x550(%rbp), %rax
1401068d0:     	movq	%rax, 0x1c0(%rbp)
1401068d7:     	movq	0x558(%rbp), %rax
1401068de:     	movq	%rax, 0x1c8(%rbp)
1401068e5:     	movaps	%xmm14, 0x1e0(%rbp)
1401068ed:     	movq	$0x0, 0x1f0(%rbp)
1401068f8:     	movups	%xmm14, 0x648(%rbp)
140106900:     	movups	%xmm14, 0x638(%rbp)
140106908:     	movq	$0x0, 0x658(%rbp)
140106913:     	movq	$0x0, 0x71c(%rbp)
14010691e:     	movb	$0x0, 0x724(%rbp)
140106925:     	movaps	0x180(%rbp), %xmm0
14010692c:     	movups	%xmm0, 0x5a8(%rbp)
140106933:     	movaps	0x190(%rbp), %xmm0
14010693a:     	movups	%xmm0, 0x5b8(%rbp)
140106941:     	movaps	0x1a0(%rbp), %xmm0
140106948:     	movups	%xmm0, 0x5c8(%rbp)
14010694f:     	movaps	0x1b0(%rbp), %xmm0
140106956:     	movups	%xmm0, 0x5d8(%rbp)
14010695d:     	movaps	0x1c0(%rbp), %xmm0
140106964:     	movups	%xmm0, 0x5e8(%rbp)
14010696b:     	movaps	0x1d0(%rbp), %xmm0
140106972:     	movups	%xmm0, 0x5f8(%rbp)
140106979:     	movaps	0x1e0(%rbp), %xmm0
140106980:     	movups	%xmm0, 0x608(%rbp)
140106987:     	movq	0x1f0(%rbp), %rax
14010698e:     	movq	%rax, 0x618(%rbp)
140106995:     	movsd	0x5839093(%rip), %xmm0  # 0x14593fa30
14010699d:     	movups	%xmm0, 0x620(%rbp)
1401069a4:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
1401069ae:     	movq	%rax, 0x630(%rbp)
1401069b5:     	movups	%xmm12, 0x670(%rbp)
1401069bd:     	movups	0x5839e04(%rip), %xmm0  # 0x1459407c8
1401069c4:     	movups	%xmm0, 0x660(%rbp)
1401069cb:     	movups	%xmm7, 0x690(%rbp)
1401069d2:     	movups	0x5839e0f(%rip), %xmm0  # 0x1459407e8
1401069d9:     	movups	%xmm0, 0x680(%rbp)
1401069e0:     	movups	%xmm10, 0x6b0(%rbp)
1401069e8:     	movups	%xmm15, 0x6a0(%rbp)
1401069f0:     	movups	%xmm11, 0x6d0(%rbp)
1401069f8:     	movaps	%xmm6, %xmm11
1401069fc:     	movups	%xmm6, 0x6c0(%rbp)
140106a03:     	movaps	0x5800ab5(%rip), %xmm14 # 0x1459074c0
140106a0b:     	movups	%xmm14, 0x6e0(%rbp)
140106a13:     	movl	$0x1, 0x6f0(%rbp)
140106a1d:     	movq	$0x0, 0x6f4(%rbp)
140106a28:     	movb	$0x1, 0x6fc(%rbp)
140106a2f:     	movq	$0x0, 0x700(%rbp)
140106a3a:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
140106a44:     	movw	$0x0, 0x70c(%rbp)
140106a4d:     	movw	$0x0, 0x712(%rbp)
140106a56:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
140106a60:     	movw	$0x0, 0x718(%rbp)
140106a69:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
140106a73:     	movw	$0x100, 0x71a(%rbp)     # imm = 0x100
140106a7c:     	movb	$0x5, 0x725(%rbp)
140106a83:     	movq	%rdi, 0x5a0(%rbp)
140106a8a:     	leaq	0x510(%rbp), %rcx
140106a91:     	leaq	0x5a0(%rbp), %r8
140106a98:     	movq	%rbx, %rdx
140106a9b:     	callq	0x1400d7520 <.text+0xd6520>
140106aa0:     	leaq	0x583bf0c(%rip), %rcx   # 0x1459429b3
140106aa7:     	movl	$0x11, %edx
140106aac:     	callq	0x145457c00 <.text+0x5456c00>
140106ab1:     	movq	%rdx, %r14
140106ab4:     	testq	%rdx, %rdx
140106ab7:     	jns	0x140106ac9 <.text+0x105ac9>
140106ab9:     	xorl	%r12d, %r12d
140106abc:     	movq	%r12, %rcx
140106abf:     	movq	%r14, %rdx
140106ac2:     	callq	0x14590379b <.text+0x590279b>
140106ac7:     	ud2
140106ac9:     	je	0x140106b40 <.text+0x105b40>
140106acb:     	movl	%r12d, %r13d
140106ace:     	movq	%rax, %rbx
140106ad1:     	callq	0x140002200 <.text+0x1200>
140106ad6:     	movl	$0x1, %r12d
140106adc:     	movl	$0x1, %edx
140106ae1:     	movq	%r14, %rcx
140106ae4:     	callq	0x1400021c0 <.text+0x11c0>
140106ae9:     	testq	%rax, %rax
140106aec:     	movups	0x5839c35(%rip), %xmm7  # 0x145940728
140106af3:     	movups	0x5839c16(%rip), %xmm6  # 0x145940710
140106afa:     	je	0x140106abc <.text+0x105abc>
140106afc:     	movq	%rax, %r15
140106aff:     	movaps	%xmm12, %xmm10
140106b03:     	movq	%rax, %rcx
140106b06:     	movq	%rbx, %rdx
140106b09:     	movq	%r14, %r8
140106b0c:     	callq	0x1457731ed <.text+0x57721ed>
140106b11:     	movups	0x5839caf(%rip), %xmm12 # 0x1459407c8
140106b19:     	movl	%r13d, %r12d
140106b1c:     	cmpb	$0x1, 0x18(%rsi)
140106b20:     	jne	0x140106b66 <.text+0x105b66>
140106b22:     	movl	0x19(%rsi), %eax
140106b25:     	movl	0x1c(%rsi), %ecx
140106b28:     	movl	%ecx, 0x5a3(%rbp)
140106b2e:     	movl	%eax, 0x5a0(%rbp)
140106b34:     	movq	0x20(%rsi), %rax
140106b38:     	movzbl	0x28(%rsi), %ecx
140106b3c:     	movb	$0x1, %dl
140106b3e:     	jmp	0x140106b76 <.text+0x105b76>
140106b40:     	movl	$0x1, %r15d
140106b46:     	movaps	%xmm12, %xmm10
140106b4a:     	movups	0x5839c76(%rip), %xmm12 # 0x1459407c8
140106b52:     	movups	0x5839bcf(%rip), %xmm7  # 0x145940728
140106b59:     	movups	0x5839bb0(%rip), %xmm6  # 0x145940710
140106b60:     	cmpb	$0x1, 0x18(%rsi)
140106b64:     	je	0x140106b22 <.text+0x105b22>
140106b66:     	movq	0x20(%rsi), %rax
140106b6a:     	lock
140106b6b:     	incq	(%rax)
140106b6e:     	jle	0x140108463 <.text+0x107463>
140106b74:     	xorl	%edx, %edx
140106b76:     	movq	%r14, 0x180(%rbp)
140106b7d:     	movq	%r15, 0x188(%rbp)
140106b84:     	movq	%r14, 0x190(%rbp)
140106b8b:     	movq	$0x0, 0x198(%rbp)
140106b96:     	movq	$0x4, 0x1a0(%rbp)
140106ba1:     	movq	$0x0, 0x1a8(%rbp)
140106bac:     	movb	%dl, 0x1b0(%rbp)
140106bb2:     	movl	0x5a0(%rbp), %edx
140106bb8:     	movl	0x5a3(%rbp), %r8d
140106bbf:     	movl	%edx, 0x1b1(%rbp)
140106bc5:     	movl	%r8d, 0x1b4(%rbp)
140106bcc:     	movq	%rax, 0x1b8(%rbp)
140106bd3:     	movq	%rcx, 0x1c0(%rbp)
140106bda:     	movl	$0x42200000, 0x1c8(%rbp) # imm = 0x42200000
140106be4:     	movw	$0x190, 0x1cc(%rbp)     # imm = 0x190
140106bed:     	movb	$0x1, 0x1ce(%rbp)
140106bf4:     	movups	0x5839a8d(%rip), %xmm0  # 0x145940688
140106bfb:     	movups	%xmm0, 0x1d0(%rbp)
140106c02:     	movl	$0x3f800000, 0x1e0(%rbp) # imm = 0x3F800000
140106c0c:     	movl	%r12d, 0x1f4(%rbp)
140106c13:     	movups	0x5812556(%rip), %xmm0  # 0x145919170
140106c1a:     	movups	%xmm0, 0x1e4(%rbp)
140106c21:     	movsd	0x580eba7(%rip), %xmm0  # 0x1459157d0
140106c29:     	movsd	%xmm0, 0x1f8(%rbp)
140106c31:     	movq	0x510(%rbp), %rax
140106c38:     	movq	0x520(%rbp), %rcx
140106c3f:     	movq	%rax, 0x200(%rbp)
140106c46:     	movb	$0x1, 0x835(%rbp)
140106c4d:     	callq	0x144e2ce50 <.text+0x4e2be50>
140106c52:     	nop
140106c53:     	movq	%rax, %r14
140106c56:     	movq	0x528(%rbp), %r15
140106c5d:     	testq	%r15, %r15
140106c60:     	je	0x140106cb7 <.text+0x105cb7>
140106c62:     	leaq	0x5a0(%rbp), %rcx
140106c69:     	leaq	0x180(%rbp), %rdx
140106c70:     	movl	$0x88, %r8d
140106c76:     	callq	0x1457731ed <.text+0x57721ed>
140106c7b:     	movq	%r14, 0x628(%rbp)
140106c82:     	movq	(%r15), %rax
140106c85:     	movq	0x10(%r15), %rbx
140106c89:     	subq	%rbx, %rax
140106c8c:     	cmpq	$0x97, %rax
140106c92:     	ja	0x140106cf4 <.text+0x105cf4>
140106c94:     	movq	$0x1, 0x20(%rsp)
140106c9d:     	movl	$0x98, %r8d
140106ca3:     	movl	$0x1, %r9d
140106ca9:     	movq	%r15, %rcx
140106cac:     	movq	%rbx, %rdx
140106caf:     	callq	0x1457744b0 <.text+0x57734b0>
140106cb4:     	nop
140106cb5:     	jmp	0x140106cf4 <.text+0x105cf4>
140106cb7:     	movq	0x530(%rbp), %r15
140106cbe:     	leaq	0x5a0(%rbp), %rcx
140106cc5:     	leaq	0x180(%rbp), %rdx
140106ccc:     	movl	$0x88, %r8d
140106cd2:     	callq	0x1457731ed <.text+0x57721ed>
140106cd7:     	movq	%r14, 0x628(%rbp)
140106cde:     	movq	(%r15), %rax
140106ce1:     	movq	0x10(%r15), %rbx
140106ce5:     	subq	%rbx, %rax
140106ce8:     	cmpq	$0x97, %rax
140106cee:     	jbe	0x1401083e5 <.text+0x1073e5>
140106cf4:     	movq	0x8(%r15), %r12
140106cf8:     	leaq	0x6fbe1(%rip), %rax     # 0x1401768e0 <.text+0x1758e0>
140106cff:     	movq	%rax, (%r12,%rbx)
140106d03:     	leaq	(%r12,%rbx), %rcx
140106d07:     	addq	$0x8, %rcx
140106d0b:     	leaq	0x180(%rbp), %rdx
140106d12:     	movl	$0x88, %r8d
140106d18:     	callq	0x1457731ed <.text+0x57721ed>
140106d1d:     	movq	%r14, 0x90(%r12,%rbx)
140106d25:     	addq	$0x98, %rbx
140106d2c:     	movq	%rbx, 0x10(%r15)
140106d30:     	xorps	%xmm13, %xmm13
140106d34:     	movups	%xmm13, 0x610(%rbp)
140106d3c:     	movq	$0x0, 0x620(%rbp)
140106d47:     	movups	%xmm13, 0x638(%rbp)
140106d4f:     	movups	%xmm13, 0x648(%rbp)
140106d57:     	movq	$0x0, 0x658(%rbp)
140106d62:     	movl	$0x0, 0x720(%rbp)
140106d6c:     	movb	$0x0, 0x724(%rbp)
140106d73:     	movaps	%xmm6, 0x180(%rbp)
140106d7a:     	movq	$0x0, 0x190(%rbp)
140106d85:     	movups	%xmm7, 0x198(%rbp)
140106d8c:     	movq	$0x0, 0x1a8(%rbp)
140106d97:     	movaps	%xmm8, 0x1b0(%rbp)
140106d9f:     	movq	$0x0, 0x1c0(%rbp)
140106daa:     	movups	%xmm9, 0x1c8(%rbp)
140106db2:     	movq	$0x0, 0x1d8(%rbp)
140106dbd:     	movq	0x1d0(%rbp), %rax
140106dc4:     	movq	%rax, 0x5f8(%rbp)
140106dcb:     	movq	0x1d8(%rbp), %rax
140106dd2:     	movq	%rax, 0x600(%rbp)
140106dd9:     	movq	0x1c0(%rbp), %rax
140106de0:     	movq	%rax, 0x5e8(%rbp)
140106de7:     	movq	0x1c8(%rbp), %rax
140106dee:     	movq	%rax, 0x5f0(%rbp)
140106df5:     	movaps	0x1b0(%rbp), %xmm0
140106dfc:     	movups	%xmm0, 0x5d8(%rbp)
140106e03:     	movaps	0x190(%rbp), %xmm0
140106e0a:     	movups	%xmm0, 0x5b8(%rbp)
140106e11:     	movaps	0x180(%rbp), %xmm0
140106e18:     	movq	0x1a0(%rbp), %rax
140106e1f:     	movq	0x1a8(%rbp), %rcx
140106e26:     	movq	%rax, 0x5c8(%rbp)
140106e2d:     	movq	%rcx, 0x5d0(%rbp)
140106e34:     	movups	%xmm0, 0x5a8(%rbp)
140106e3b:     	movq	$0x0, 0x608(%rbp)
140106e46:     	movaps	0x5838bf3(%rip), %xmm0  # 0x14593fa40
140106e4d:     	movups	%xmm0, 0x628(%rbp)
140106e54:     	movups	%xmm10, 0x670(%rbp)
140106e5c:     	movups	%xmm12, 0x660(%rbp)
140106e64:     	movups	0x583998d(%rip), %xmm0  # 0x1459407f8
140106e6b:     	movups	%xmm0, 0x690(%rbp)
140106e72:     	movups	0x583996f(%rip), %xmm0  # 0x1459407e8
140106e79:     	movups	%xmm0, 0x680(%rbp)
140106e80:     	movups	0x5839991(%rip), %xmm0  # 0x145940818
140106e87:     	movups	%xmm0, 0x6b0(%rbp)
140106e8e:     	movups	%xmm15, 0x6a0(%rbp)
140106e96:     	movups	0x583999b(%rip), %xmm0  # 0x145940838
140106e9d:     	movups	%xmm0, 0x6d0(%rbp)
140106ea4:     	movups	%xmm11, 0x6c0(%rbp)
140106eac:     	movups	%xmm14, 0x6e0(%rbp)
140106eb4:     	movl	$0x1, 0x6f0(%rbp)
140106ebe:     	movq	$0x0, 0x6f4(%rbp)
140106ec9:     	movb	$0x1, 0x6fc(%rbp)
140106ed0:     	movq	$0x0, 0x700(%rbp)
140106edb:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
140106ee5:     	movw	$0x0, 0x70c(%rbp)
140106eee:     	movw	$0x0, 0x712(%rbp)
140106ef7:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
140106f01:     	movw	$0x0, 0x718(%rbp)
140106f0a:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
140106f14:     	movw	$0x100, 0x71a(%rbp)     # imm = 0x100
140106f1d:     	movl	$0x0, 0x71c(%rbp)
140106f27:     	movb	$0x5, 0x725(%rbp)
140106f2e:     	movq	%rdi, 0x5a0(%rbp)
140106f35:     	leaq	0x90(%rbp), %rcx
140106f3c:     	leaq	0x5a0(%rbp), %r8
140106f43:     	leaq	0xc8(%rbp), %rdx
140106f4a:     	callq	0x1400d7270 <.text+0xd6270>
140106f4f:     	movq	0x120(%rbp), %rax
140106f56:     	movq	0x8(%rax), %rbx
140106f5a:     	movq	0x10(%rax), %r15
140106f5e:     	movq	0x90(%rbp), %r12
140106f65:     	movq	0xb8(%rbp), %rax
140106f6c:     	movq	%r12, 0x60(%rbp)
140106f70:     	movups	0x98(%rbp), %xmm0
140106f77:     	movups	%xmm0, 0x68(%rbp)
140106f7b:     	movups	0xa8(%rbp), %xmm0
140106f82:     	movups	%xmm0, 0x78(%rbp)
140106f86:     	movq	%rax, 0x88(%rbp)
140106f8d:     	movw	$0x0, 0x704(%rbp)
140106f96:     	movb	$0x1, 0x6f4(%rbp)
140106f9d:     	movaps	%xmm13, 0x600(%rbp)
140106fa5:     	movaps	%xmm13, 0x610(%rbp)
140106fad:     	movaps	%xmm13, 0x620(%rbp)
140106fb5:     	movaps	%xmm13, 0x630(%rbp)
140106fbd:     	movaps	%xmm13, 0x640(%rbp)
140106fc5:     	movq	$0x0, 0x650(%rbp)
140106fd0:     	movl	$0x5, 0x71a(%rbp)
140106fda:     	movups	%xmm12, 0x658(%rbp)
140106fe2:     	movups	%xmm10, 0x668(%rbp)
140106fea:     	movaps	0x5838a5f(%rip), %xmm0  # 0x14593fa50
140106ff1:     	movups	%xmm0, 0x678(%rbp)
140106ff8:     	movaps	0x5811881(%rip), %xmm0  # 0x145918880
140106fff:     	movups	%xmm0, 0x688(%rbp)
140107006:     	movaps	0x58002e2(%rip), %xmm13 # 0x1459072f0
14010700e:     	movups	%xmm13, 0x698(%rbp)
140107016:     	movups	%xmm13, 0x6a8(%rbp)
14010701e:     	movaps	0x581178b(%rip), %xmm0  # 0x1459187b0
140107025:     	movups	%xmm0, 0x6b8(%rbp)
14010702c:     	movups	%xmm0, 0x6c8(%rbp)
140107033:     	movq	$0x0, 0x6f8(%rbp)
14010703e:     	movl	$0x3f800000, 0x700(%rbp) # imm = 0x3F800000
140107048:     	movups	%xmm14, 0x6d8(%rbp)
140107050:     	movl	$0x1, 0x6e8(%rbp)
14010705a:     	movss	0x58004ae(%rip), %xmm0  # 0x145907510
140107062:     	movlps	%xmm0, 0x6ec(%rbp)
140107069:     	movq	$0x3000000, 0x712(%rbp) # imm = 0x3000000
140107074:     	movaps	%xmm6, 0x5a0(%rbp)
14010707b:     	movq	$0x0, 0x5b0(%rbp)
140107086:     	movups	%xmm7, 0x5b8(%rbp)
14010708d:     	movq	$0x0, 0x5c8(%rbp)
140107098:     	movaps	%xmm8, 0x5d0(%rbp)
1401070a0:     	movq	$0x0, 0x5e0(%rbp)
1401070ab:     	movups	%xmm9, 0x5e8(%rbp)
1401070b3:     	movq	$0x0, 0x5f8(%rbp)
1401070be:     	movw	$0x0, 0x70a(%rbp)
1401070c7:     	movl	$0x10000, 0x706(%rbp)   # imm = 0x10000
1401070d1:     	movw	$0x0, 0x710(%rbp)
1401070da:     	movl	$0x10000, 0x70c(%rbp)   # imm = 0x10000
1401070e4:     	leaq	0x510(%rbp), %rcx
1401070eb:     	callq	0x1400b68f0 <.text+0xb58f0>
1401070f0:     	nop
1401070f1:     	movups	0x5839590(%rip), %xmm0  # 0x145940688
1401070f8:     	movaps	%xmm0, 0x410(%rbp)
1401070ff:     	movl	$0x3eb33333, 0x420(%rbp) # imm = 0x3EB33333
140107109:     	leaq	0x4b0(%rbp), %rcx
140107110:     	leaq	0x410(%rbp), %rdx
140107117:     	callq	0x144c8c290 <.text+0x4c8b290>
14010711c:     	nop
14010711d:     	movaps	0x4b0(%rbp), %xmm0
140107124:     	movups	%xmm0, 0x184(%rbp)
14010712b:     	movl	$0x1, 0x180(%rbp)
140107135:     	movl	$0x41900000, 0x48(%rsp) # imm = 0x41900000
14010713d:     	movl	$0x1, 0x40(%rsp)
140107145:     	movl	$0x0, 0x38(%rsp)
14010714d:     	movl	$0x1, 0x30(%rsp)
140107155:     	movl	$0x0, 0x28(%rsp)
14010715d:     	movl	$0x1, 0x20(%rsp)
140107165:     	leaq	0x4b0(%rbp), %rcx
14010716c:     	leaq	0x180(%rbp), %rdx
140107173:     	xorps	%xmm3, %xmm3
140107176:     	movl	$0x1, %r8d
14010717c:     	callq	0x14265f6a0 <.text+0x265e6a0>
140107181:     	nop
140107182:     	leaq	0x68(%rbp), %rdi
140107186:     	leaq	0x180(%rbp), %r14
14010718d:     	leaq	0x5a0(%rbp), %rdx
140107194:     	movl	$0x180, %r8d            # imm = 0x180
14010719a:     	movq	%r14, %rcx
14010719d:     	callq	0x1457731ed <.text+0x57721ed>
1401071a2:     	movups	0x510(%rbp), %xmm0
1401071a9:     	movups	0x520(%rbp), %xmm1
1401071b0:     	movups	0x530(%rbp), %xmm2
1401071b7:     	movups	0x540(%rbp), %xmm3
1401071be:     	movups	%xmm0, 0x318(%rbp)
1401071c5:     	movups	%xmm1, 0x328(%rbp)
1401071cc:     	movups	%xmm2, 0x338(%rbp)
1401071d3:     	movups	%xmm3, 0x348(%rbp)
1401071da:     	movups	0x550(%rbp), %xmm0
1401071e1:     	movups	%xmm0, 0x358(%rbp)
1401071e8:     	movups	0x560(%rbp), %xmm0
1401071ef:     	movups	%xmm0, 0x368(%rbp)
1401071f6:     	movq	0x570(%rbp), %rax
1401071fd:     	movq	%rax, 0x378(%rbp)
140107204:     	movups	0x4b0(%rbp), %xmm0
14010720b:     	movups	%xmm0, 0x300(%rbp)
140107212:     	movq	0x4c0(%rbp), %rax
140107219:     	movq	%rax, 0x310(%rbp)
140107220:     	movups	0x58398f9(%rip), %xmm0  # 0x145940b20
140107227:     	movups	%xmm0, 0x422(%rbp)
14010722e:     	movups	0x58398db(%rip), %xmm0  # 0x145940b10
140107235:     	movups	%xmm0, 0x412(%rbp)
14010723c:     	leaq	0x5a8(%rbp), %rcx
140107243:     	movl	$0x200, %r8d            # imm = 0x200
140107249:     	movq	%r14, %rdx
14010724c:     	callq	0x1457731ed <.text+0x57721ed>
140107251:     	movl	$0x0, 0x7a8(%rbp)
14010725b:     	movw	$0x200, 0x7ac(%rbp)     # imm = 0x200
140107264:     	movups	0x410(%rbp), %xmm0
14010726b:     	movups	0x420(%rbp), %xmm1
140107272:     	movups	%xmm0, 0x7ae(%rbp)
140107279:     	movups	%xmm1, 0x7be(%rbp)
140107280:     	movzwl	0x430(%rbp), %eax
140107287:     	movw	%ax, 0x7ce(%rbp)
14010728e:     	movq	%r12, 0x5a0(%rbp)
140107295:     	leaq	0x30(%rbp), %rcx
140107299:     	leaq	0x5a0(%rbp), %r8
1401072a0:     	movq	%rdi, %rdx
1401072a3:     	callq	0x1400dd770 <.text+0xdc770>
1401072a8:     	movq	0x30(%rbp), %r12
1401072ac:     	movq	0x58(%rbp), %rax
1401072b0:     	movq	%r12, (%rbp)
1401072b4:     	movups	0x38(%rbp), %xmm0
1401072b8:     	movups	%xmm0, 0x8(%rbp)
1401072bc:     	movups	0x48(%rbp), %xmm0
1401072c0:     	movups	%xmm0, 0x18(%rbp)
1401072c4:     	movq	%rax, 0x28(%rbp)
1401072c8:     	movw	$0x0, 0x704(%rbp)
1401072d1:     	movb	$0x1, 0x6f4(%rbp)
1401072d8:     	xorps	%xmm0, %xmm0
1401072db:     	movups	%xmm0, 0x608(%rbp)
1401072e2:     	movups	%xmm0, 0x618(%rbp)
1401072e9:     	movaps	0x5838480(%rip), %xmm1  # 0x14593f770
1401072f0:     	movups	%xmm1, 0x628(%rbp)
1401072f7:     	movq	$0x0, 0x600(%rbp)
140107302:     	movups	%xmm0, 0x638(%rbp)
140107309:     	movups	%xmm0, 0x648(%rbp)
140107310:     	movl	$0x0, 0x718(%rbp)
14010731a:     	movw	$0x0, 0x71c(%rbp)
140107323:     	movups	%xmm12, 0x658(%rbp)
14010732b:     	movups	%xmm10, 0x668(%rbp)
140107333:     	movups	0x58394ae(%rip), %xmm0  # 0x1459407e8
14010733a:     	movups	%xmm0, 0x678(%rbp)
140107341:     	movups	0x58394b0(%rip), %xmm0  # 0x1459407f8
140107348:     	movups	%xmm0, 0x688(%rbp)
14010734f:     	movaps	0x583849a(%rip), %xmm0  # 0x14593f7f0
140107356:     	movups	%xmm0, 0x698(%rbp)
14010735d:     	movups	%xmm0, 0x6a8(%rbp)
140107364:     	movaps	0x58386f5(%rip), %xmm0  # 0x14593fa60
14010736b:     	movups	%xmm0, 0x6b8(%rbp)
140107372:     	movups	%xmm0, 0x6c8(%rbp)
140107379:     	movb	$0x0, 0x716(%rbp)
140107380:     	movl	$0x0, 0x712(%rbp)
14010738a:     	movq	$0x0, 0x6f8(%rbp)
140107395:     	movl	$0x0, 0x700(%rbp)
14010739f:     	movups	%xmm14, 0x6d8(%rbp)
1401073a7:     	movl	$0x1, 0x6e8(%rbp)
1401073b1:     	movq	$0x0, 0x6ec(%rbp)
1401073bc:     	movb	$0x0, 0x717(%rbp)
1401073c3:     	movaps	%xmm6, 0x5a0(%rbp)
1401073ca:     	movq	$0x0, 0x5b0(%rbp)
1401073d5:     	movups	%xmm7, 0x5b8(%rbp)
1401073dc:     	movq	$0x0, 0x5c8(%rbp)
1401073e7:     	movaps	%xmm8, 0x5d0(%rbp)
1401073ef:     	movq	$0x0, 0x5e0(%rbp)
1401073fa:     	movups	%xmm9, 0x5e8(%rbp)
140107402:     	movq	$0x0, 0x5f8(%rbp)
14010740d:     	movw	$0x0, 0x70a(%rbp)
140107416:     	movl	$0x10000, 0x706(%rbp)   # imm = 0x10000
140107420:     	movw	$0x0, 0x710(%rbp)
140107429:     	movl	$0x10000, 0x70c(%rbp)   # imm = 0x10000
140107433:     	movups	0x583924e(%rip), %xmm0  # 0x145940688
14010743a:     	movaps	%xmm0, 0x4b0(%rbp)
140107441:     	movl	$0x3f800000, 0x4c0(%rbp) # imm = 0x3F800000
14010744b:     	movups	%xmm0, 0x4c4(%rbp)
140107452:     	movl	$0x3f800000, 0x4d4(%rbp) # imm = 0x3F800000
14010745c:     	movups	%xmm0, 0x4d8(%rbp)
140107463:     	movl	$0x3f800000, 0x4e8(%rbp) # imm = 0x3F800000
14010746d:     	movups	%xmm0, 0x4ec(%rbp)
140107474:     	movl	$0x3f800000, 0x4fc(%rbp) # imm = 0x3F800000
14010747e:     	callq	0x140002200 <.text+0x1200>
140107483:     	movl	$0x44, %ecx
140107488:     	movl	$0x1, %edx
14010748d:     	callq	0x1400021c0 <.text+0x11c0>
140107492:     	testq	%rax, %rax
140107495:     	je	0x140108453 <.text+0x107453>
14010749b:     	movups	0x5839843(%rip), %xmm0  # 0x145940ce5
1401074a2:     	movups	%xmm0, 0x30(%rax)
1401074a6:     	movups	0x5839828(%rip), %xmm0  # 0x145940cd5
1401074ad:     	movups	%xmm0, 0x20(%rax)
1401074b1:     	movups	0x583980d(%rip), %xmm0  # 0x145940cc5
1401074b8:     	movups	%xmm0, 0x10(%rax)
1401074bc:     	movups	0x58397f2(%rip), %xmm0  # 0x145940cb5
1401074c3:     	movups	%xmm0, (%rax)
1401074c6:     	movl	$0x706c622e, 0x40(%rax) # imm = 0x706C622E
1401074cd:     	movq	$0x44, 0x180(%rbp)
1401074d8:     	movq	%rax, 0x188(%rbp)
1401074df:     	movq	$0x44, 0x190(%rbp)
1401074ea:     	leaq	0x5802a57(%rip), %rax   # 0x145909f48
1401074f1:     	movq	%rax, 0x20(%rsp)
1401074f6:     	leaq	0x130(%rbp), %rcx
1401074fd:     	leaq	0x180(%rbp), %r8
140107504:     	movl	$0x1, %r9d
14010750a:     	movq	%rbx, %rdx
14010750d:     	callq	0x140030ef0 <.text+0x2fef0>
140107512:     	nop
140107513:     	movzbl	(%r15), %ecx
140107517:     	callq	0x1454207d0 <.text+0x541f7d0>
14010751c:     	nop
14010751d:     	movups	0x58392d3(%rip), %xmm15 # 0x1459407f8
140107525:     	leaq	0x484(%rbp), %rcx
14010752c:     	movq	%rax, %rdx
14010752f:     	callq	0x1400b7b00 <.text+0xb6b00>
140107534:     	movups	0x58395a5(%rip), %xmm0  # 0x145940ae0
14010753b:     	movups	%xmm0, 0x548(%rbp)
140107542:     	movabsq	$0x23f800000, %rax      # imm = 0x23F800000
14010754c:     	movq	%rax, 0x558(%rbp)
140107553:     	movups	0x583959e(%rip), %xmm1  # 0x145940af8
14010755a:     	movups	%xmm1, 0x530(%rbp)
140107561:     	movq	$0x46, 0x540(%rbp)
14010756c:     	movb	$0x2, 0x510(%rbp)
140107573:     	movw	$0x0, 0x594(%rbp)
14010757c:     	movl	$0x0, 0x580(%rbp)
140107586:     	movups	%xmm0, 0x448(%rbp)
14010758d:     	movl	$0x3f800000, 0x458(%rbp) # imm = 0x3F800000
140107597:     	movups	0x130(%rbp), %xmm0
14010759e:     	movaps	%xmm0, 0x430(%rbp)
1401075a5:     	movq	0x140(%rbp), %rax
1401075ac:     	movq	%rax, 0x440(%rbp)
1401075b3:     	movups	0x520(%rbp), %xmm0
1401075ba:     	movaps	%xmm0, 0x420(%rbp)
1401075c1:     	movzbl	0x510(%rbp), %eax
1401075c8:     	movb	%al, 0x410(%rbp)
1401075ce:     	movq	0x511(%rbp), %rax
1401075d5:     	movq	%rax, 0x411(%rbp)
1401075dc:     	movl	0x519(%rbp), %eax
1401075e2:     	movl	%eax, 0x419(%rbp)
1401075e8:     	movzwl	0x51d(%rbp), %eax
1401075ef:     	movw	%ax, 0x41d(%rbp)
1401075f6:     	movzbl	0x51f(%rbp), %eax
1401075fd:     	movb	%al, 0x41f(%rbp)
140107603:     	movw	$0x0, 0x494(%rbp)
14010760c:     	movl	$0x1, 0x480(%rbp)
140107616:     	movups	0x55c(%rbp), %xmm0
14010761d:     	movups	%xmm0, 0x45c(%rbp)
140107624:     	movl	0x57c(%rbp), %eax
14010762a:     	movl	%eax, 0x47c(%rbp)
140107630:     	movups	0x56c(%rbp), %xmm0
140107637:     	movups	%xmm0, 0x46c(%rbp)
14010763e:     	movups	0x583937b(%rip), %xmm0  # 0x1459409c0
140107645:     	movaps	%xmm0, 0xf0(%rbp)
14010764c:     	movl	$0x3f59999a, 0x100(%rbp) # imm = 0x3F59999A
140107656:     	leaq	0x130(%rbp), %rcx
14010765d:     	leaq	0xf0(%rbp), %rdx
140107664:     	callq	0x144c8c290 <.text+0x4c8b290>
140107669:     	nop
14010766a:     	movaps	0x130(%rbp), %xmm0
140107671:     	movups	%xmm0, 0x184(%rbp)
140107678:     	movl	$0x1, 0x180(%rbp)
140107682:     	movl	$0x40c00000, 0x48(%rsp) # imm = 0x40C00000
14010768a:     	movl	$0x1, 0x40(%rsp)
140107692:     	movl	$0x0, 0x38(%rsp)
14010769a:     	movl	$0x1, 0x30(%rsp)
1401076a2:     	movl	$0x40000000, 0x28(%rsp) # imm = 0x40000000
1401076aa:     	movl	$0x1, 0x20(%rsp)
1401076b2:     	leaq	0x130(%rbp), %rcx
1401076b9:     	leaq	0x180(%rbp), %rdx
1401076c0:     	xorps	%xmm3, %xmm3
1401076c3:     	movl	$0x1, %r8d
1401076c9:     	callq	0x14265f6a0 <.text+0x265e6a0>
1401076ce:     	nop
1401076cf:     	leaq	0x8(%rbp), %rdi
1401076d3:     	leaq	0x180(%rbp), %rbx
1401076da:     	leaq	0x5a0(%rbp), %rdx
1401076e1:     	movl	$0x180, %r8d            # imm = 0x180
1401076e7:     	movq	%rbx, %rcx
1401076ea:     	callq	0x1457731ed <.text+0x57721ed>
1401076ef:     	movaps	0x4b0(%rbp), %xmm0
1401076f6:     	movaps	0x4c0(%rbp), %xmm1
1401076fd:     	movaps	0x4d0(%rbp), %xmm2
140107704:     	movaps	0x4e0(%rbp), %xmm3
14010770b:     	movups	%xmm0, 0x388(%rbp)
140107712:     	movups	%xmm1, 0x398(%rbp)
140107719:     	movups	%xmm2, 0x3a8(%rbp)
140107720:     	movups	%xmm3, 0x3b8(%rbp)
140107727:     	movaps	0x4f0(%rbp), %xmm0
14010772e:     	movups	%xmm0, 0x3c8(%rbp)
140107735:     	movups	0x583929b(%rip), %xmm14 # 0x1459409d8
14010773d:     	movups	%xmm14, 0x3d8(%rbp)
140107745:     	movl	$0x3f800000, 0x3e8(%rbp) # imm = 0x3F800000
14010774f:     	leaq	0x300(%rbp), %rcx
140107756:     	leaq	0x410(%rbp), %rdx
14010775d:     	movl	$0x88, %r8d
140107763:     	callq	0x1457731ed <.text+0x57721ed>
140107768:     	movups	0x130(%rbp), %xmm0
14010776f:     	movups	%xmm0, 0x3f0(%rbp)
140107776:     	movq	0x140(%rbp), %rax
14010777d:     	movq	%rax, 0x400(%rbp)
140107784:     	leaq	0x5a8(%rbp), %rcx
14010778b:     	movl	$0x288, %r8d            # imm = 0x288
140107791:     	movq	%rbx, %rdx
140107794:     	callq	0x1457731ed <.text+0x57721ed>
140107799:     	movq	%r12, 0x5a0(%rbp)
1401077a0:     	leaq	-0x30(%rbp), %rcx
1401077a4:     	leaq	0x5a0(%rbp), %r8
1401077ab:     	movq	%rdi, %rdx
1401077ae:     	callq	0x1400d82b0 <.text+0xd72b0>
1401077b3:     	nop
1401077b4:     	movq	-0x30(%rbp), %rax
1401077b8:     	movq	-0x8(%rbp), %rcx
1401077bc:     	movq	%rax, 0xf0(%rbp)
1401077c3:     	leaq	0xf8(%rbp), %rdx
1401077ca:     	movups	-0x28(%rbp), %xmm0
1401077ce:     	movups	%xmm0, 0xf8(%rbp)
1401077d5:     	movups	-0x18(%rbp), %xmm0
1401077d9:     	movups	%xmm0, 0x108(%rbp)
1401077e0:     	movq	%rcx, 0x118(%rbp)
1401077e7:     	movaps	%xmm6, 0x410(%rbp)
1401077ee:     	movq	$0x0, 0x420(%rbp)
1401077f9:     	movups	%xmm7, 0x428(%rbp)
140107800:     	movq	$0x0, 0x438(%rbp)
14010780b:     	movaps	%xmm8, 0x440(%rbp)
140107813:     	movq	$0x0, 0x450(%rbp)
14010781e:     	movups	%xmm9, 0x458(%rbp)
140107826:     	movq	$0x0, 0x468(%rbp)
140107831:     	movaps	%xmm14, 0x130(%rbp)
140107839:     	movl	$0x3f800000, 0x140(%rbp) # imm = 0x3F800000
140107843:     	movups	%xmm14, 0x144(%rbp)
14010784b:     	movl	$0x3f800000, 0x154(%rbp) # imm = 0x3F800000
140107855:     	movups	%xmm14, 0x158(%rbp)
14010785d:     	movl	$0x3f800000, 0x168(%rbp) # imm = 0x3F800000
140107867:     	movups	%xmm14, 0x16c(%rbp)
14010786f:     	movl	$0x3f800000, 0x17c(%rbp) # imm = 0x3F800000
140107879:     	movq	0x460(%rbp), %rcx
140107880:     	movq	%rcx, 0x1d0(%rbp)
140107887:     	movq	0x468(%rbp), %rcx
14010788e:     	movq	%rcx, 0x1d8(%rbp)
140107895:     	movq	0x450(%rbp), %rcx
14010789c:     	movq	%rcx, 0x1c0(%rbp)
1401078a3:     	movq	0x458(%rbp), %rcx
1401078aa:     	movq	%rcx, 0x1c8(%rbp)
1401078b1:     	movaps	0x410(%rbp), %xmm0
1401078b8:     	movaps	0x420(%rbp), %xmm1
1401078bf:     	movaps	0x430(%rbp), %xmm2
1401078c6:     	movaps	0x440(%rbp), %xmm3
1401078cd:     	movaps	%xmm3, 0x1b0(%rbp)
1401078d4:     	movaps	%xmm2, 0x1a0(%rbp)
1401078db:     	movaps	%xmm1, 0x190(%rbp)
1401078e2:     	movaps	%xmm0, 0x180(%rbp)
1401078e9:     	xorps	%xmm0, %xmm0
1401078ec:     	movaps	%xmm0, 0x1e0(%rbp)
1401078f3:     	movups	%xmm0, 0x628(%rbp)
1401078fa:     	movups	%xmm0, 0x648(%rbp)
140107901:     	movq	$0x0, 0x658(%rbp)
14010790c:     	movl	$0x0, 0x71c(%rbp)
140107916:     	movw	$0x0, 0x720(%rbp)
14010791f:     	movaps	0x170(%rbp), %xmm0
140107926:     	movups	%xmm0, 0x4f2(%rbp)
14010792d:     	movaps	0x130(%rbp), %xmm0
140107934:     	movaps	0x140(%rbp), %xmm1
14010793b:     	movaps	0x150(%rbp), %xmm2
140107942:     	movaps	0x160(%rbp), %xmm3
140107949:     	movups	%xmm3, 0x4e2(%rbp)
140107950:     	movups	%xmm2, 0x4d2(%rbp)
140107957:     	movups	%xmm1, 0x4c2(%rbp)
14010795e:     	movups	%xmm0, 0x4b2(%rbp)
140107965:     	movaps	0x180(%rbp), %xmm0
14010796c:     	movaps	0x190(%rbp), %xmm1
140107973:     	movaps	0x1a0(%rbp), %xmm2
14010797a:     	movaps	0x1b0(%rbp), %xmm3
140107981:     	movups	%xmm0, 0x5a8(%rbp)
140107988:     	movups	%xmm1, 0x5b8(%rbp)
14010798f:     	movups	%xmm2, 0x5c8(%rbp)
140107996:     	movups	%xmm3, 0x5d8(%rbp)
14010799d:     	movaps	0x1c0(%rbp), %xmm0
1401079a4:     	movups	%xmm0, 0x5e8(%rbp)
1401079ab:     	movaps	0x1d0(%rbp), %xmm0
1401079b2:     	movups	%xmm0, 0x5f8(%rbp)
1401079b9:     	movaps	0x1e0(%rbp), %xmm0
1401079c0:     	movups	%xmm0, 0x608(%rbp)
1401079c7:     	movaps	0x58380a2(%rip), %xmm0  # 0x14593fa70
1401079ce:     	movups	%xmm0, 0x618(%rbp)
1401079d5:     	movaps	0x5810dc4(%rip), %xmm0  # 0x1459187a0
1401079dc:     	movups	%xmm0, 0x638(%rbp)
1401079e3:     	movups	%xmm10, 0x670(%rbp)
1401079eb:     	movups	%xmm12, 0x660(%rbp)
1401079f3:     	movaps	0x580b726(%rip), %xmm0  # 0x145913120
1401079fa:     	movups	%xmm0, 0x680(%rbp)
140107a01:     	movaps	0x580def8(%rip), %xmm0  # 0x145915900
140107a08:     	movups	%xmm0, 0x690(%rbp)
140107a0f:     	movups	%xmm13, 0x6a0(%rbp)
140107a17:     	movups	%xmm13, 0x6b0(%rbp)
140107a1f:     	movaps	0x57ff8ba(%rip), %xmm0  # 0x1459072e0
140107a26:     	movups	%xmm0, 0x6c0(%rbp)
140107a2d:     	movups	%xmm0, 0x6d0(%rbp)
140107a34:     	movaps	0x57ffa85(%rip), %xmm0  # 0x1459074c0
140107a3b:     	movups	%xmm0, 0x6e0(%rbp)
140107a42:     	movl	$0x1, 0x6f0(%rbp)
140107a4c:     	movq	$0x0, 0x6f4(%rbp)
140107a57:     	movb	$0x1, 0x6fc(%rbp)
140107a5e:     	movq	$0x0, 0x700(%rbp)
140107a69:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
140107a73:     	movw	$0x0, 0x70c(%rbp)
140107a7c:     	movw	$0x0, 0x712(%rbp)
140107a85:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
140107a8f:     	movw	$0x0, 0x718(%rbp)
140107a98:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
140107aa2:     	movw	$0x100, 0x71a(%rbp)     # imm = 0x100
140107aab:     	movl	$0x5000005, 0x722(%rbp) # imm = 0x5000005
140107ab5:     	movzwl	0x500(%rbp), %ecx
140107abc:     	movw	%cx, 0x776(%rbp)
140107ac3:     	movups	0x4f0(%rbp), %xmm0
140107aca:     	movups	%xmm0, 0x766(%rbp)
140107ad1:     	movups	0x4b0(%rbp), %xmm0
140107ad8:     	movups	0x4c0(%rbp), %xmm1
140107adf:     	movups	0x4d0(%rbp), %xmm2
140107ae6:     	movups	0x4e0(%rbp), %xmm3
140107aed:     	movups	%xmm3, 0x756(%rbp)
140107af4:     	movups	%xmm2, 0x746(%rbp)
140107afb:     	movups	%xmm1, 0x736(%rbp)
140107b02:     	movups	%xmm0, 0x726(%rbp)
140107b09:     	movups	0x5838b78(%rip), %xmm0  # 0x145940688
140107b10:     	movups	%xmm0, 0x778(%rbp)
140107b17:     	movl	$0x3f800000, 0x788(%rbp) # imm = 0x3F800000
140107b21:     	movq	%rax, 0x5a0(%rbp)
140107b28:     	leaq	0x130(%rbp), %rcx
140107b2f:     	leaq	0x5a0(%rbp), %r8
140107b36:     	callq	0x1400d7a80 <.text+0xd6a80>
140107b3b:     	nop
140107b3c:     	cmpb	$0x1, (%rsi)
140107b3f:     	jne	0x140107b5f <.text+0x106b5f>
140107b41:     	movl	0x1(%rsi), %eax
140107b44:     	movl	0x4(%rsi), %ecx
140107b47:     	movl	%ecx, 0x4ab(%rbp)
140107b4d:     	movl	%eax, 0x4a8(%rbp)
140107b53:     	movq	0x8(%rsi), %rax
140107b57:     	movzbl	0x10(%rsi), %ecx
140107b5b:     	movb	$0x1, %dl
140107b5d:     	jmp	0x140107b6f <.text+0x106b6f>
140107b5f:     	movq	0x8(%rsi), %rax
140107b63:     	lock
140107b64:     	incq	(%rax)
140107b67:     	jle	0x140108463 <.text+0x107463>
140107b6d:     	xorl	%edx, %edx
140107b6f:     	movb	$0x1, 0x428(%rbp)
140107b76:     	movups	0x5838e6f(%rip), %xmm0  # 0x1459409ec
140107b7d:     	movups	%xmm0, 0x429(%rbp)
140107b84:     	movl	$0x41a00000, 0x440(%rbp) # imm = 0x41A00000
140107b8e:     	movw	$0x190, 0x444(%rbp)     # imm = 0x190
140107b97:     	movb	$0x1, 0x446(%rbp)
140107b9e:     	movq	$0x0, 0x410(%rbp)
140107ba9:     	movq	$0x4, 0x418(%rbp)
140107bb4:     	movq	$0x0, 0x420(%rbp)
140107bbf:     	movq	0x410(%rbp), %r8
140107bc6:     	movq	%r8, 0x198(%rbp)
140107bcd:     	movq	0x418(%rbp), %r8
140107bd4:     	movq	%r8, 0x1a0(%rbp)
140107bdb:     	movq	$0x0, 0x1a8(%rbp)
140107be6:     	movups	%xmm14, 0x4b1(%rbp)
140107bee:     	movl	$0x3f800000, 0x4c1(%rbp) # imm = 0x3F800000
140107bf8:     	movq	0x130(%rbp), %r8
140107bff:     	movq	$0x0, 0x180(%rbp)
140107c0a:     	movq	$0x1, 0x188(%rbp)
140107c15:     	movq	$0x0, 0x190(%rbp)
140107c20:     	movb	%dl, 0x1b0(%rbp)
140107c26:     	movl	0x4a8(%rbp), %edx
140107c2c:     	movl	0x4ab(%rbp), %r9d
140107c33:     	movl	%edx, 0x1b1(%rbp)
140107c39:     	movl	%r9d, 0x1b4(%rbp)
140107c40:     	movq	%rax, 0x1b8(%rbp)
140107c47:     	movq	%rcx, 0x1c0(%rbp)
140107c4e:     	movl	$0x41400000, 0x1c8(%rbp) # imm = 0x41400000
140107c58:     	movw	$0x190, 0x1cc(%rbp)     # imm = 0x190
140107c61:     	movb	$0x1, 0x1ce(%rbp)
140107c68:     	movq	0x4bd(%rbp), %rax
140107c6f:     	movq	%rax, 0x1dc(%rbp)
140107c76:     	movups	0x4b0(%rbp), %xmm0
140107c7d:     	movups	%xmm0, 0x1cf(%rbp)
140107c84:     	movq	%r8, 0x1e8(%rbp)
140107c8b:     	movq	0x140(%rbp), %rcx
140107c92:     	movb	$0x1, 0x834(%rbp)
140107c99:     	callq	0x144e2ce50 <.text+0x4e2be50>
140107c9e:     	nop
140107c9f:     	movq	%rax, %rbx
140107ca2:     	movq	0x148(%rbp), %r14
140107ca9:     	testq	%r14, %r14
140107cac:     	je	0x140107d55 <.text+0x106d55>
140107cb2:     	movups	0x1e0(%rbp), %xmm0
140107cb9:     	movaps	%xmm0, 0x600(%rbp)
140107cc0:     	movups	0x1d0(%rbp), %xmm0
140107cc7:     	movaps	%xmm0, 0x5f0(%rbp)
140107cce:     	movups	0x1c0(%rbp), %xmm0
140107cd5:     	movaps	%xmm0, 0x5e0(%rbp)
140107cdc:     	movups	0x180(%rbp), %xmm0
140107ce3:     	movups	0x190(%rbp), %xmm1
140107cea:     	movups	0x1a0(%rbp), %xmm2
140107cf1:     	movups	0x1b0(%rbp), %xmm3
140107cf8:     	movaps	%xmm3, 0x5d0(%rbp)
140107cff:     	movaps	%xmm2, 0x5c0(%rbp)
140107d06:     	movaps	%xmm1, 0x5b0(%rbp)
140107d0d:     	movaps	%xmm0, 0x5a0(%rbp)
140107d14:     	movq	%rbx, 0x610(%rbp)
140107d1b:     	movq	(%r14), %rax
140107d1e:     	movq	0x10(%r14), %r15
140107d22:     	subq	%r15, %rax
140107d25:     	cmpq	$0x7f, %rax
140107d29:     	ja	0x140107dd9 <.text+0x106dd9>
140107d2f:     	movq	$0x1, 0x20(%rsp)
140107d38:     	movl	$0x80, %r8d
140107d3e:     	movl	$0x1, %r9d
140107d44:     	movq	%r14, %rcx
140107d47:     	movq	%r15, %rdx
140107d4a:     	callq	0x1457744b0 <.text+0x57734b0>
140107d4f:     	nop
140107d50:     	jmp	0x140107dd9 <.text+0x106dd9>
140107d55:     	movq	0x150(%rbp), %r14
140107d5c:     	movups	0x1e0(%rbp), %xmm0
140107d63:     	movaps	%xmm0, 0x600(%rbp)
140107d6a:     	movups	0x1d0(%rbp), %xmm0
140107d71:     	movaps	%xmm0, 0x5f0(%rbp)
140107d78:     	movups	0x1c0(%rbp), %xmm0
140107d7f:     	movaps	%xmm0, 0x5e0(%rbp)
140107d86:     	movups	0x180(%rbp), %xmm0
140107d8d:     	movups	0x190(%rbp), %xmm1
140107d94:     	movups	0x1a0(%rbp), %xmm2
140107d9b:     	movups	0x1b0(%rbp), %xmm3
140107da2:     	movaps	%xmm3, 0x5d0(%rbp)
140107da9:     	movaps	%xmm2, 0x5c0(%rbp)
140107db0:     	movaps	%xmm1, 0x5b0(%rbp)
140107db7:     	movaps	%xmm0, 0x5a0(%rbp)
140107dbe:     	movq	%rbx, 0x610(%rbp)
140107dc5:     	movq	(%r14), %rax
140107dc8:     	movq	0x10(%r14), %r15
140107dcc:     	subq	%r15, %rax
140107dcf:     	cmpq	$0x7f, %rax
140107dd3:     	jbe	0x14010840b <.text+0x10740b>
140107dd9:     	movq	0x8(%r14), %rax
140107ddd:     	leaq	0x6e6cc(%rip), %rcx     # 0x1401764b0 <.text+0x1754b0>
140107de4:     	movq	%rcx, (%rax,%r15)
140107de8:     	movups	0x180(%rbp), %xmm0
140107def:     	movups	0x190(%rbp), %xmm1
140107df6:     	movups	0x1a0(%rbp), %xmm2
140107dfd:     	movups	0x1b0(%rbp), %xmm3
140107e04:     	movups	%xmm0, 0x8(%rax,%r15)
140107e0a:     	movups	%xmm1, 0x18(%rax,%r15)
140107e10:     	movups	%xmm2, 0x28(%rax,%r15)
140107e16:     	movups	%xmm3, 0x38(%rax,%r15)
140107e1c:     	movups	0x1c0(%rbp), %xmm0
140107e23:     	movups	%xmm0, 0x48(%rax,%r15)
140107e29:     	movups	0x1d0(%rbp), %xmm0
140107e30:     	movups	%xmm0, 0x58(%rax,%r15)
140107e36:     	movups	0x1e0(%rbp), %xmm0
140107e3d:     	movups	%xmm0, 0x68(%rax,%r15)
140107e43:     	movq	%rbx, 0x78(%rax,%r15)
140107e48:     	subq	$-0x80, %r15
140107e4c:     	movq	%r15, 0x10(%r14)
140107e50:     	cmpb	$0x0, 0x428(%rbp)
140107e57:     	jne	0x140107e73 <.text+0x106e73>
140107e59:     	movq	0x430(%rbp), %rax
140107e60:     	lock
140107e61:     	decq	(%rax)
140107e64:     	jne	0x140107e73 <.text+0x106e73>
140107e66:     	leaq	0x430(%rbp), %rcx
140107e6d:     	callq	0x1449aac80 <.text+0x49a9c80>
140107e72:     	nop
140107e73:     	cmpb	$0x0, 0x530(%rbp)
140107e7a:     	jne	0x140107e95 <.text+0x106e95>
140107e7c:     	movq	0x538(%rbp), %rax
140107e83:     	lock
140107e84:     	decq	(%rax)
140107e87:     	jne	0x140107e95 <.text+0x106e95>
140107e89:     	leaq	0x538(%rbp), %rcx
140107e90:     	callq	0x1449aac80 <.text+0x49a9c80>
140107e95:     	xorps	%xmm0, %xmm0
140107e98:     	movaps	%xmm0, 0x220(%rbp)
140107e9f:     	movaps	%xmm0, 0x210(%rbp)
140107ea6:     	movaps	%xmm0, 0x200(%rbp)
140107ead:     	movaps	%xmm0, 0x1f0(%rbp)
140107eb4:     	movaps	%xmm0, 0x1e0(%rbp)
140107ebb:     	movq	$0x0, 0x230(%rbp)
140107ec6:     	movw	$0x0, 0x724(%rbp)
140107ecf:     	movl	$0x0, 0x720(%rbp)
140107ed9:     	movups	%xmm12, 0x238(%rbp)
140107ee1:     	movups	%xmm10, 0x248(%rbp)
140107ee9:     	movups	0x58388f8(%rip), %xmm0  # 0x1459407e8
140107ef0:     	movups	%xmm0, 0x258(%rbp)
140107ef7:     	movups	%xmm15, 0x268(%rbp)
140107eff:     	movups	0x5838912(%rip), %xmm0  # 0x145940818
140107f06:     	movups	%xmm0, 0x288(%rbp)
140107f0d:     	movups	0x58388f4(%rip), %xmm0  # 0x145940808
140107f14:     	movups	%xmm0, 0x278(%rbp)
140107f1b:     	movups	0x5838916(%rip), %xmm0  # 0x145940838
140107f22:     	movups	%xmm0, 0x2a8(%rbp)
140107f29:     	movups	%xmm11, 0x298(%rbp)
140107f31:     	movaps	%xmm6, 0x180(%rbp)
140107f38:     	movq	$0x0, 0x190(%rbp)
140107f43:     	movups	%xmm7, 0x198(%rbp)
140107f4a:     	movq	$0x0, 0x1a8(%rbp)
140107f55:     	movaps	%xmm8, 0x1b0(%rbp)
140107f5d:     	movq	$0x0, 0x1c0(%rbp)
140107f68:     	movups	%xmm9, 0x1c8(%rbp)
140107f70:     	movq	$0x0, 0x1d8(%rbp)
140107f7b:     	leaq	0x5a8(%rbp), %rcx
140107f82:     	leaq	0x180(%rbp), %rdx
140107f89:     	movl	$0x138, %r8d            # imm = 0x138
140107f8f:     	callq	0x1457731ed <.text+0x57721ed>
140107f94:     	movaps	0x57ff525(%rip), %xmm0  # 0x1459074c0
140107f9b:     	movups	%xmm0, 0x6e0(%rbp)
140107fa2:     	movl	$0x1, 0x6f0(%rbp)
140107fac:     	movq	$0x0, 0x6f4(%rbp)
140107fb7:     	movb	$0x1, 0x6fc(%rbp)
140107fbe:     	movq	$0x0, 0x700(%rbp)
140107fc9:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
140107fd3:     	movw	$0x0, 0x70c(%rbp)
140107fdc:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
140107fe6:     	movw	$0x0, 0x712(%rbp)
140107fef:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
140107ff9:     	movw	$0x0, 0x718(%rbp)
140108002:     	movl	$0x0, 0x71a(%rbp)
14010800c:     	movw	$0x1, 0x71e(%rbp)
140108015:     	movq	%r12, 0x5a0(%rbp)
14010801c:     	leaq	0x410(%rbp), %rcx
140108023:     	leaq	0x5a0(%rbp), %r8
14010802a:     	movq	%rdi, %rdx
14010802d:     	callq	0x1400d7270 <.text+0xd6270>
140108032:     	movq	0x410(%rbp), %r13
140108039:     	movq	0x438(%rbp), %rax
140108040:     	movq	%r13, 0x510(%rbp)
140108047:     	movups	0x418(%rbp), %xmm0
14010804e:     	movups	%xmm0, 0x518(%rbp)
140108055:     	movups	0x428(%rbp), %xmm0
14010805c:     	movups	%xmm0, 0x528(%rbp)
140108063:     	movq	%rax, 0x538(%rbp)
14010806a:     	cmpb	$0x1, (%rsi)
14010806d:     	jne	0x14010808d <.text+0x10708d>
14010806f:     	movl	0x1(%rsi), %eax
140108072:     	movl	0x4(%rsi), %ecx
140108075:     	movl	%ecx, 0x4a3(%rbp)
14010807b:     	movl	%eax, 0x4a0(%rbp)
140108081:     	movq	0x8(%rsi), %rax
140108085:     	movzbl	0x10(%rsi), %ecx
140108089:     	movb	$0x1, %dl
14010808b:     	jmp	0x14010809d <.text+0x10709d>
14010808d:     	movq	0x8(%rsi), %rax
140108091:     	lock
140108092:     	incq	(%rax)
140108095:     	jle	0x140108463 <.text+0x107463>
14010809b:     	xorl	%edx, %edx
14010809d:     	leaq	0x518(%rbp), %rdi
1401080a4:     	movups	0x5838955(%rip), %xmm0  # 0x145940a00
1401080ab:     	movups	%xmm0, 0x4b1(%rbp)
1401080b2:     	movl	$0x3f800000, 0x4c1(%rbp) # imm = 0x3F800000
1401080bc:     	movq	$0x0, 0x5a8(%rbp)
1401080c7:     	movq	$0x1, 0x5b0(%rbp)
1401080d2:     	xorps	%xmm0, %xmm0
1401080d5:     	movups	%xmm0, 0x5b8(%rbp)
1401080dc:     	movq	$0x4, 0x5c8(%rbp)
1401080e7:     	movq	$0x0, 0x5d0(%rbp)
1401080f2:     	movb	%dl, 0x5d8(%rbp)
1401080f8:     	movl	0x4a0(%rbp), %edx
1401080fe:     	movl	0x4a3(%rbp), %r8d
140108105:     	movl	%edx, 0x5d9(%rbp)
14010810b:     	movl	%r8d, 0x5dc(%rbp)
140108112:     	movq	%rax, 0x5e0(%rbp)
140108119:     	movq	%rcx, 0x5e8(%rbp)
140108120:     	movl	$0x41300000, 0x5f0(%rbp) # imm = 0x41300000
14010812a:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
140108133:     	movb	$0x1, 0x5f6(%rbp)
14010813a:     	movups	0x4b0(%rbp), %xmm0
140108141:     	movups	%xmm0, 0x5f7(%rbp)
140108148:     	movq	0x4bd(%rbp), %rax
14010814f:     	movq	%rax, 0x604(%rbp)
140108156:     	movl	0x5811024(%rip), %eax   # 0x145919180
14010815c:     	movl	%eax, 0x61c(%rbp)
140108162:     	movups	0x5811007(%rip), %xmm0  # 0x145919170
140108169:     	movups	%xmm0, 0x60c(%rbp)
140108170:     	movsd	0x580d658(%rip), %xmm0  # 0x1459157d0
140108178:     	movsd	%xmm0, 0x620(%rbp)
140108180:     	movq	%r13, 0x5a0(%rbp)
140108187:     	leaq	0x180(%rbp), %rcx
14010818e:     	leaq	0x5a0(%rbp), %r8
140108195:     	movq	%rdi, %rdx
140108198:     	callq	0x1400dda20 <.text+0xdca20>
14010819d:     	leaq	0x5838870(%rip), %rcx   # 0x145940a14
1401081a4:     	movl	$0x9, %edx
1401081a9:     	callq	0x145457c00 <.text+0x5456c00>
1401081ae:     	movq	%rdx, %rbx
1401081b1:     	testq	%rdx, %rdx
1401081b4:     	jns	0x1401081c6 <.text+0x1071c6>
1401081b6:     	xorl	%r12d, %r12d
1401081b9:     	movq	%r12, %rcx
1401081bc:     	movq	%rbx, %rdx
1401081bf:     	callq	0x14590379b <.text+0x590279b>
1401081c4:     	ud2
1401081c6:     	je	0x14010821d <.text+0x10721d>
1401081c8:     	movq	%rax, %r15
1401081cb:     	callq	0x140002200 <.text+0x1200>
1401081d0:     	movl	$0x1, %r12d
1401081d6:     	movl	$0x1, %edx
1401081db:     	movq	%rbx, %rcx
1401081de:     	callq	0x1400021c0 <.text+0x11c0>
1401081e3:     	testq	%rax, %rax
1401081e6:     	je	0x1401081b9 <.text+0x1071b9>
1401081e8:     	movq	%rax, %r14
1401081eb:     	movq	%rax, %rcx
1401081ee:     	movq	%r15, %rdx
1401081f1:     	movq	%rbx, %r8
1401081f4:     	callq	0x1457731ed <.text+0x57721ed>
1401081f9:     	cmpb	$0x1, 0x18(%rsi)
1401081fd:     	jne	0x140108229 <.text+0x107229>
1401081ff:     	movl	0x19(%rsi), %eax
140108202:     	movl	0x1c(%rsi), %ecx
140108205:     	movl	%ecx, 0x49b(%rbp)
14010820b:     	movl	%eax, 0x498(%rbp)
140108211:     	movq	0x20(%rsi), %rax
140108215:     	movzbl	0x28(%rsi), %ecx
140108219:     	movb	$0x1, %dl
14010821b:     	jmp	0x140108239 <.text+0x107239>
14010821d:     	movl	$0x1, %r14d
140108223:     	cmpb	$0x1, 0x18(%rsi)
140108227:     	je	0x1401081ff <.text+0x1071ff>
140108229:     	movq	0x20(%rsi), %rax
14010822d:     	lock
14010822e:     	incq	(%rax)
140108231:     	jle	0x140108463 <.text+0x107463>
140108237:     	xorl	%edx, %edx
140108239:     	movups	0x58384bc(%rip), %xmm0  # 0x1459406fc
140108240:     	movups	%xmm0, 0x4b1(%rbp)
140108247:     	movl	$0x3f800000, 0x4c1(%rbp) # imm = 0x3F800000
140108251:     	movq	%rbx, 0x5a8(%rbp)
140108258:     	movq	%r14, 0x5b0(%rbp)
14010825f:     	movq	%rbx, 0x5b8(%rbp)
140108266:     	movq	$0x0, 0x5c0(%rbp)
140108271:     	movq	$0x4, 0x5c8(%rbp)
14010827c:     	movq	$0x0, 0x5d0(%rbp)
140108287:     	movb	%dl, 0x5d8(%rbp)
14010828d:     	movl	0x498(%rbp), %edx
140108293:     	movl	0x49b(%rbp), %r8d
14010829a:     	movl	%edx, 0x5d9(%rbp)
1401082a0:     	movl	%r8d, 0x5dc(%rbp)
1401082a7:     	movq	%rax, 0x5e0(%rbp)
1401082ae:     	movq	%rcx, 0x5e8(%rbp)
1401082b5:     	movl	$0x41c00000, 0x5f0(%rbp) # imm = 0x41C00000
1401082bf:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
1401082c8:     	movb	$0x1, 0x5f6(%rbp)
1401082cf:     	movups	0x4b0(%rbp), %xmm0
1401082d6:     	movups	%xmm0, 0x5f7(%rbp)
1401082dd:     	movq	0x4bd(%rbp), %rax
1401082e4:     	movq	%rax, 0x604(%rbp)
1401082eb:     	movl	$0x0, 0x60c(%rbp)
1401082f5:     	movaps	0x5837784(%rip), %xmm0  # 0x14593fa80
1401082fc:     	movups	%xmm0, 0x610(%rbp)
140108303:     	movsd	0x5837785(%rip), %xmm0  # 0x14593fa90
14010830b:     	movsd	%xmm0, 0x620(%rbp)
140108313:     	movq	%r13, 0x5a0(%rbp)
14010831a:     	leaq	0x180(%rbp), %rcx
140108321:     	leaq	0x5a0(%rbp), %r8
140108328:     	movq	%rdi, %rdx
14010832b:     	callq	0x1400dbfa0 <.text+0xdafa0>
140108330:     	movq	0x128(%rbp), %rax
140108337:     	movaps	0x840(%rbp), %xmm6
14010833e:     	movaps	0x850(%rbp), %xmm7
140108345:     	movaps	0x860(%rbp), %xmm8
14010834d:     	movaps	0x870(%rbp), %xmm9
140108355:     	movaps	0x880(%rbp), %xmm10
14010835d:     	movaps	0x890(%rbp), %xmm11
140108365:     	movaps	0x8a0(%rbp), %xmm12
14010836d:     	movaps	0x8b0(%rbp), %xmm13
140108375:     	movaps	0x8c0(%rbp), %xmm14
14010837d:     	movaps	0x8d0(%rbp), %xmm15
140108385:     	addq	$0x968, %rsp            # imm = 0x968
14010838c:     	popq	%rbx
14010838d:     	popq	%rdi
14010838e:     	popq	%rsi
14010838f:     	popq	%r12
140108391:     	popq	%r13
140108393:     	popq	%r14
140108395:     	popq	%r15
140108397:     	popq	%rbp
140108398:     	retq
140108399:     	movq	$0x1, 0x20(%rsp)
1401083a2:     	movl	$0x80, %r8d
1401083a8:     	movl	$0x1, %r9d
1401083ae:     	movq	%r13, %rcx
1401083b1:     	movq	%rbx, %rdx
1401083b4:     	callq	0x1457744b0 <.text+0x57734b0>
1401083b9:     	nop
1401083ba:     	jmp	0x1401060cd <.text+0x1050cd>
1401083bf:     	movq	$0x1, 0x20(%rsp)
1401083c8:     	movl	$0x80, %r8d
1401083ce:     	movl	$0x1, %r9d
1401083d4:     	movq	%r15, %rcx
1401083d7:     	movq	%rbx, %rdx
1401083da:     	callq	0x1457744b0 <.text+0x57734b0>
1401083df:     	nop
1401083e0:     	jmp	0x140106519 <.text+0x105519>
1401083e5:     	movq	$0x1, 0x20(%rsp)
1401083ee:     	movl	$0x98, %r8d
1401083f4:     	movl	$0x1, %r9d
1401083fa:     	movq	%r15, %rcx
1401083fd:     	movq	%rbx, %rdx
140108400:     	callq	0x1457744b0 <.text+0x57734b0>
140108405:     	nop
140108406:     	jmp	0x140106cf4 <.text+0x105cf4>
14010840b:     	movq	$0x1, 0x20(%rsp)
140108414:     	movl	$0x80, %r8d
14010841a:     	movl	$0x1, %r9d
140108420:     	movq	%r14, %rcx
140108423:     	movq	%r15, %rdx
140108426:     	callq	0x1457744b0 <.text+0x57734b0>
14010842b:     	nop
14010842c:     	jmp	0x140107dd9 <.text+0x106dd9>
140108431:     	movl	$0x1, %ecx
140108436:     	movl	$0x1, %edx
14010843b:     	callq	0x14590379b <.text+0x590279b>
140108440:     	ud2
140108442:     	movl	$0x1, %ecx
140108447:     	movl	$0x5, %edx
14010844c:     	callq	0x14590379b <.text+0x590279b>
140108451:     	ud2
140108453:     	movl	$0x1, %ecx
140108458:     	movl	$0x44, %edx
14010845d:     	callq	0x14590379b <.text+0x590279b>
140108462:     	nop
140108463:     	ud2

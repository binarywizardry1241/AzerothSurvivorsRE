
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402472a0:     	pushq	%rbp
1402472a1:     	pushq	%r15
1402472a3:     	pushq	%r14
1402472a5:     	pushq	%r13
1402472a7:     	pushq	%r12
1402472a9:     	pushq	%rsi
1402472aa:     	pushq	%rdi
1402472ab:     	pushq	%rbx
1402472ac:     	subq	$0x698, %rsp            # imm = 0x698
1402472b3:     	leaq	0x80(%rsp), %rbp
1402472bb:     	movaps	%xmm15, 0x600(%rbp)
1402472c3:     	movaps	%xmm14, 0x5f0(%rbp)
1402472cb:     	movaps	%xmm13, 0x5e0(%rbp)
1402472d3:     	movaps	%xmm12, 0x5d0(%rbp)
1402472db:     	movaps	%xmm11, 0x5c0(%rbp)
1402472e3:     	movaps	%xmm10, 0x5b0(%rbp)
1402472eb:     	movaps	%xmm9, 0x5a0(%rbp)
1402472f3:     	movaps	%xmm8, 0x590(%rbp)
1402472fb:     	movaps	%xmm7, 0x580(%rbp)
140247302:     	movaps	%xmm6, 0x570(%rbp)
140247309:     	movq	$-0x2, 0x568(%rbp)
140247314:     	movq	%rcx, %rdi
140247317:     	movq	(%rcx), %rcx
14024731a:     	movq	0x28(%rdi), %rax
14024731e:     	movq	%rcx, 0x558(%rbp)
140247325:     	movq	%rcx, 0x280(%rbp)
14024732c:     	movups	0x8(%rdi), %xmm0
140247330:     	movups	%xmm0, 0x288(%rbp)
140247337:     	movups	0x18(%rdi), %xmm0
14024733b:     	movups	%xmm0, 0x298(%rbp)
140247342:     	movq	%rax, 0x2a8(%rbp)
140247349:     	movq	(%rdx), %rsi
14024734c:     	movq	(%r8), %rax
14024734f:     	movw	$0x0, 0x414(%rbp)
140247358:     	movb	$0x1, 0x404(%rbp)
14024735f:     	movsd	0x56f75c9(%rip), %xmm0  # 0x14593e930
140247367:     	movups	%xmm0, 0x318(%rbp)
14024736e:     	movups	%xmm0, 0x328(%rbp)
140247375:     	movaps	0x56f75c4(%rip), %xmm0  # 0x14593e940
14024737c:     	movups	%xmm0, 0x338(%rbp)
140247383:     	movq	$0x0, 0x310(%rbp)
14024738e:     	xorps	%xmm0, %xmm0
140247391:     	movups	%xmm0, 0x348(%rbp)
140247398:     	movups	%xmm0, 0x358(%rbp)
14024739f:     	movl	$0x0, 0x428(%rbp)
1402473a9:     	movw	$0x0, 0x42c(%rbp)
1402473b2:     	movups	0x56f7b7f(%rip), %xmm0  # 0x14593ef38
1402473b9:     	movups	%xmm0, 0x368(%rbp)
1402473c0:     	movups	0x56f7b81(%rip), %xmm0  # 0x14593ef48
1402473c7:     	movups	%xmm0, 0x378(%rbp)
1402473ce:     	movups	0x56f7b83(%rip), %xmm0  # 0x14593ef58
1402473d5:     	movups	%xmm0, 0x388(%rbp)
1402473dc:     	movups	0x56f7b85(%rip), %xmm0  # 0x14593ef68
1402473e3:     	movups	%xmm0, 0x398(%rbp)
1402473ea:     	movups	0x56f7b97(%rip), %xmm0  # 0x14593ef88
1402473f1:     	movups	%xmm0, 0x3b8(%rbp)
1402473f8:     	movups	0x56f7b79(%rip), %xmm0  # 0x14593ef78
1402473ff:     	movups	%xmm0, 0x3a8(%rbp)
140247406:     	movups	0x56f7b9b(%rip), %xmm6  # 0x14593efa8
14024740d:     	movups	%xmm6, 0x3d8(%rbp)
140247414:     	movups	0x56f7b7d(%rip), %xmm7  # 0x14593ef98
14024741b:     	movups	%xmm7, 0x3c8(%rbp)
140247422:     	movb	$0x0, 0x426(%rbp)
140247429:     	movl	$0x100, 0x422(%rbp)     # imm = 0x100
140247433:     	movq	$0x0, 0x408(%rbp)
14024743e:     	movl	$0x3f800000, 0x410(%rbp) # imm = 0x3F800000
140247448:     	movaps	0x56a4061(%rip), %xmm0  # 0x1458eb4b0
14024744f:     	movups	%xmm0, 0x3e8(%rbp)
140247456:     	movl	$0x1, 0x3f8(%rbp)
140247460:     	movq	$0x0, 0x3fc(%rbp)
14024746b:     	movb	$0x0, 0x427(%rbp)
140247472:     	movups	0x56f7a07(%rip), %xmm0  # 0x14593ee80
140247479:     	movaps	%xmm0, 0x2b0(%rbp)
140247480:     	movq	$0x0, 0x2c0(%rbp)
14024748b:     	movups	0x56f7a06(%rip), %xmm0  # 0x14593ee98
140247492:     	movups	%xmm0, 0x2c8(%rbp)
140247499:     	movq	$0x0, 0x2d8(%rbp)
1402474a4:     	movups	0x56f7a05(%rip), %xmm0  # 0x14593eeb0
1402474ab:     	movaps	%xmm0, 0x2e0(%rbp)
1402474b2:     	movq	$0x0, 0x2f0(%rbp)
1402474bd:     	movups	0x56f7a04(%rip), %xmm0  # 0x14593eec8
1402474c4:     	movups	%xmm0, 0x2f8(%rbp)
1402474cb:     	movq	$0x0, 0x308(%rbp)
1402474d6:     	movw	$0x0, 0x41a(%rbp)
1402474df:     	movl	$0x10000, 0x416(%rbp)   # imm = 0x10000
1402474e9:     	movw	$0x0, 0x420(%rbp)
1402474f2:     	movl	$0x10000, 0x41c(%rbp)   # imm = 0x10000
1402474fc:     	movq	0x20(%rax), %rcx
140247500:     	movq	0x28(%rax), %rdx
140247504:     	callq	0x14540e950 <.text+0x540d950>
140247509:     	nop
14024750a:     	addq	$0x98, %rax
140247510:     	movq	%rax, 0x70(%rbp)
140247514:     	leaq	-0x24545b(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14024751b:     	movq	%rax, 0x78(%rbp)
14024751f:     	leaq	0x56b3544(%rip), %rdx   # 0x1458faa6a
140247526:     	leaq	-0x30(%rbp), %rcx
14024752a:     	leaq	0x70(%rbp), %r8
14024752e:     	callq	0x14570bf80 <.text+0x570af80>
140247533:     	nop
140247534:     	movq	-0x20(%rbp), %rax
140247538:     	movq	%rax, 0x80(%rbp)
14024753f:     	movups	-0x30(%rbp), %xmm0
140247543:     	movaps	%xmm0, 0x70(%rbp)
140247547:     	leaq	0x56a639a(%rip), %rax   # 0x1458ed8e8
14024754e:     	movq	%rax, 0x20(%rsp)
140247553:     	leaq	0x4d0(%rbp), %rcx
14024755a:     	leaq	0x70(%rbp), %r8
14024755e:     	movl	$0x1, %r9d
140247564:     	movq	%rsi, %rdx
140247567:     	callq	0x1400310a0 <.text+0x300a0>
14024756c:     	nop
14024756d:     	leaq	-0x30(%rbp), %rcx
140247571:     	leaq	0x4d0(%rbp), %rdx
140247578:     	callq	0x1426f00c0 <.text+0x26ef0c0>
14024757d:     	nop
14024757e:     	leaq	0x288(%rbp), %rbx
140247585:     	movl	$0x0, 0x8(%rbp)
14024758c:     	movaps	0x56f73bd(%rip), %xmm0  # 0x14593e950
140247593:     	movups	%xmm0, 0xc(%rbp)
140247597:     	leaq	0x70(%rbp), %rsi
14024759b:     	leaq	0x2b0(%rbp), %rdx
1402475a2:     	movl	$0x180, %r8d            # imm = 0x180
1402475a8:     	movq	%rsi, %rcx
1402475ab:     	callq	0x145756ddd <.text+0x5755ddd>
1402475b0:     	leaq	0x1f0(%rbp), %rcx
1402475b7:     	leaq	-0x30(%rbp), %rdx
1402475bb:     	movl	$0x88, %r8d
1402475c1:     	callq	0x145756ddd <.text+0x5755ddd>
1402475c6:     	leaq	0x2b8(%rbp), %rcx
1402475cd:     	movl	$0x208, %r8d            # imm = 0x208
1402475d3:     	movq	%rsi, %rdx
1402475d6:     	callq	0x145756ddd <.text+0x5755ddd>
1402475db:     	movq	0x558(%rbp), %rax
1402475e2:     	movq	%rax, 0x2b0(%rbp)
1402475e9:     	leaq	0x4d0(%rbp), %rcx
1402475f0:     	leaq	0x2b0(%rbp), %r8
1402475f7:     	movq	%rbx, %rdx
1402475fa:     	callq	0x1401f04c0 <.text+0x1ef4c0>
1402475ff:     	movw	$0x0, 0x1d4(%rbp)
140247608:     	movb	$0x1, 0x1c4(%rbp)
14024760f:     	xorps	%xmm0, %xmm0
140247612:     	movups	%xmm0, 0xd8(%rbp)
140247619:     	movups	%xmm0, 0xe8(%rbp)
140247620:     	movaps	0x56aee39(%rip), %xmm1  # 0x1458f6460
140247627:     	movups	%xmm1, 0xf8(%rbp)
14024762e:     	movq	$0x0, 0xd0(%rbp)
140247639:     	movups	%xmm0, 0x108(%rbp)
140247640:     	movups	%xmm0, 0x118(%rbp)
140247647:     	movl	$0x0, 0x1e8(%rbp)
140247651:     	movw	$0x0, 0x1ec(%rbp)
14024765a:     	movups	0x56f78d7(%rip), %xmm0  # 0x14593ef38
140247661:     	movups	%xmm0, 0x128(%rbp)
140247668:     	movups	0x56f78d9(%rip), %xmm0  # 0x14593ef48
14024766f:     	movups	%xmm0, 0x138(%rbp)
140247676:     	movups	0x56f78db(%rip), %xmm0  # 0x14593ef58
14024767d:     	movups	%xmm0, 0x148(%rbp)
140247684:     	movups	0x56f78dd(%rip), %xmm0  # 0x14593ef68
14024768b:     	movups	%xmm0, 0x158(%rbp)
140247692:     	movups	0x56f78ef(%rip), %xmm0  # 0x14593ef88
140247699:     	movups	%xmm0, 0x178(%rbp)
1402476a0:     	movups	0x56f78d1(%rip), %xmm0  # 0x14593ef78
1402476a7:     	movups	%xmm0, 0x168(%rbp)
1402476ae:     	movups	%xmm6, 0x198(%rbp)
1402476b5:     	movups	%xmm7, 0x188(%rbp)
1402476bc:     	movb	$0x0, 0x1e6(%rbp)
1402476c3:     	movl	$0x100, 0x1e2(%rbp)     # imm = 0x100
1402476cd:     	movq	$0x0, 0x1c8(%rbp)
1402476d8:     	movl	$0x3f800000, 0x1d0(%rbp) # imm = 0x3F800000
1402476e2:     	movaps	0x56a3dc7(%rip), %xmm0  # 0x1458eb4b0
1402476e9:     	movups	%xmm0, 0x1a8(%rbp)
1402476f0:     	movl	$0x1, 0x1b8(%rbp)
1402476fa:     	movq	$0x0, 0x1bc(%rbp)
140247705:     	movb	$0x0, 0x1e7(%rbp)
14024770c:     	movups	0x56f776d(%rip), %xmm0  # 0x14593ee80
140247713:     	movaps	%xmm0, 0x70(%rbp)
140247717:     	movq	$0x0, 0x80(%rbp)
140247722:     	movups	0x56f776f(%rip), %xmm0  # 0x14593ee98
140247729:     	movups	%xmm0, 0x88(%rbp)
140247730:     	movq	$0x0, 0x98(%rbp)
14024773b:     	movups	0x56f776e(%rip), %xmm0  # 0x14593eeb0
140247742:     	movaps	%xmm0, 0xa0(%rbp)
140247749:     	movq	$0x0, 0xb0(%rbp)
140247754:     	movups	0x56f776d(%rip), %xmm0  # 0x14593eec8
14024775b:     	movups	%xmm0, 0xb8(%rbp)
140247762:     	movq	$0x0, 0xc8(%rbp)
14024776d:     	movw	$0x0, 0x1da(%rbp)
140247776:     	movl	$0x10000, 0x1d6(%rbp)   # imm = 0x10000
140247780:     	movw	$0x0, 0x1e0(%rbp)
140247789:     	movl	$0x10000, 0x1dc(%rbp)   # imm = 0x10000
140247793:     	callq	0x140002200 <.text+0x1200>
140247798:     	movl	$0x90, %ecx
14024779d:     	movl	$0x8, %edx
1402477a2:     	callq	0x1400021c0 <.text+0x11c0>
1402477a7:     	testq	%rax, %rax
1402477aa:     	je	0x1402480c8 <.text+0x2470c8>
1402477b0:     	movq	%rax, %rsi
1402477b3:     	callq	0x140002200 <.text+0x1200>
1402477b8:     	movl	$0x40, %ecx
1402477bd:     	movl	$0x4, %edx
1402477c2:     	callq	0x1400021c0 <.text+0x11c0>
1402477c7:     	testq	%rax, %rax
1402477ca:     	movq	%rsi, 0x550(%rbp)
1402477d1:     	je	0x1402480da <.text+0x2470da>
1402477d7:     	movq	%rax, 0x560(%rbp)
1402477de:     	movups	0x56f7dfb(%rip), %xmm6  # 0x14593f5e0
1402477e5:     	movaps	%xmm6, 0x2b0(%rbp)
1402477ec:     	movl	$0x0, 0x2c0(%rbp)
1402477f6:     	leaq	0x4d0(%rbp), %rcx
1402477fd:     	leaq	0x2b0(%rbp), %rdx
140247804:     	callq	0x144c79aa0 <.text+0x4c78aa0>
140247809:     	nop
14024780a:     	movaps	0x4d0(%rbp), %xmm7
140247811:     	movaps	0x56f7148(%rip), %xmm0  # 0x14593e960
140247818:     	movups	%xmm0, 0x2b4(%rbp)
14024781f:     	movl	$0x0, 0x2b0(%rbp)
140247829:     	leaq	0x4d0(%rbp), %rcx
140247830:     	leaq	0x2b0(%rbp), %rdx
140247837:     	callq	0x144c79aa0 <.text+0x4c78aa0>
14024783c:     	nop
14024783d:     	movaps	0x4d0(%rbp), %xmm0
140247844:     	movabsq	$0x41f0000000000002, %rax # imm = 0x41F0000000000002
14024784e:     	movq	0x560(%rbp), %rcx
140247855:     	movq	%rax, (%rcx)
140247858:     	movl	$0x1, 0x8(%rcx)
14024785f:     	movups	%xmm7, 0xc(%rcx)
140247863:     	movaps	0x56b51b6(%rip), %xmm7  # 0x1458fca20
14024786a:     	movups	%xmm7, 0x1c(%rcx)
14024786e:     	movups	%xmm0, 0x2c(%rcx)
140247872:     	movl	$0x3f000000, 0x3c(%rcx) # imm = 0x3F000000
140247879:     	movq	$0x2, 0x2b0(%rbp)
140247884:     	movq	%rcx, 0x2b8(%rbp)
14024788b:     	movq	$0x2, 0x2c0(%rbp)
140247896:     	movq	$0x2, 0x2c8(%rbp)
1402478a1:     	movl	$0x2, 0x2d0(%rbp)
1402478ab:     	movss	0x56b5549(%rip), %xmm0  # 0x1458fcdfc
1402478b3:     	movlps	%xmm0, 0x2d4(%rbp)
1402478ba:     	movabsq	$0xa00000000, %rax      # imm = 0xA00000000
1402478c4:     	movq	%rax, 0x2dc(%rbp)
1402478cb:     	movb	$0x0, 0x2f0(%rbp)
1402478d2:     	callq	0x140002200 <.text+0x1200>
1402478d7:     	movl	$0x40, %ecx
1402478dc:     	movl	$0x4, %edx
1402478e1:     	callq	0x1400021c0 <.text+0x11c0>
1402478e6:     	testq	%rax, %rax
1402478e9:     	je	0x1402480ec <.text+0x2470ec>
1402478ef:     	movq	%rax, 0x560(%rbp)
1402478f6:     	movq	%rdi, 0x4c8(%rbp)
1402478fd:     	movaps	%xmm6, 0x4d0(%rbp)
140247904:     	movl	$0x0, 0x4e0(%rbp)
14024790e:     	leaq	0x530(%rbp), %rcx
140247915:     	leaq	0x4d0(%rbp), %rdx
14024791c:     	callq	0x144c79aa0 <.text+0x4c78aa0>
140247921:     	nop
140247922:     	movaps	0x530(%rbp), %xmm6
140247929:     	movaps	0x56b5210(%rip), %xmm0  # 0x1458fcb40
140247930:     	movups	%xmm0, 0x4d4(%rbp)
140247937:     	movl	$0x0, 0x4d0(%rbp)
140247941:     	leaq	0x530(%rbp), %rcx
140247948:     	leaq	0x4d0(%rbp), %rdx
14024794f:     	callq	0x144c79aa0 <.text+0x4c78aa0>
140247954:     	nop
140247955:     	movaps	0x530(%rbp), %xmm0
14024795c:     	movabsq	$0x4270000000000002, %rax # imm = 0x4270000000000002
140247966:     	movq	0x560(%rbp), %rcx
14024796d:     	movq	%rax, (%rcx)
140247970:     	movl	$0x1, 0x8(%rcx)
140247977:     	movups	%xmm6, 0xc(%rcx)
14024797b:     	movups	%xmm7, 0x1c(%rcx)
14024797f:     	movups	%xmm0, 0x2c(%rcx)
140247983:     	movl	$0x3f000000, 0x3c(%rcx) # imm = 0x3F000000
14024798a:     	movq	0x2f0(%rbp), %rax
140247991:     	movq	0x550(%rbp), %rsi
140247998:     	movq	%rax, 0x40(%rsi)
14024799c:     	movups	0x2b0(%rbp), %xmm0
1402479a3:     	movups	0x2c0(%rbp), %xmm1
1402479aa:     	movups	0x2d0(%rbp), %xmm2
1402479b1:     	movups	0x2e0(%rbp), %xmm3
1402479b8:     	movups	%xmm3, 0x30(%rsi)
1402479bc:     	movups	%xmm2, 0x20(%rsi)
1402479c0:     	movups	%xmm1, 0x10(%rsi)
1402479c4:     	movups	%xmm0, (%rsi)
1402479c7:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
1402479d1:     	movq	%rax, 0x48(%rsi)
1402479d5:     	movq	$0x2, 0x50(%rsi)
1402479dd:     	movq	%rcx, 0x58(%rsi)
1402479e1:     	movq	$0x2, 0x60(%rsi)
1402479e9:     	movl	$0x40490fdb, 0x68(%rsi) # imm = 0x40490FDB
1402479f0:     	movb	$0x0, 0x6c(%rsi)
1402479f4:     	leaq	0x2b8(%rbp), %rbx
1402479fb:     	leaq	0x70(%rbp), %r14
1402479ff:     	movl	$0x180, %r8d            # imm = 0x180
140247a05:     	movq	%rbx, %rcx
140247a08:     	movq	%r14, %rdx
140247a0b:     	callq	0x145756ddd <.text+0x5755ddd>
140247a10:     	movq	$0x2, 0x438(%rbp)
140247a1b:     	movq	%rsi, 0x440(%rbp)
140247a22:     	movq	$0x2, 0x448(%rbp)
140247a2d:     	movq	0x558(%rbp), %rax
140247a34:     	movq	%rax, 0x2b0(%rbp)
140247a3b:     	leaq	0x70(%rbp), %rcx
140247a3f:     	leaq	0x2b0(%rbp), %r15
140247a46:     	leaq	0x288(%rbp), %rdx
140247a4d:     	movq	%r15, %r8
140247a50:     	callq	0x1401e7230 <.text+0x1e6230>
140247a55:     	leaq	0x4d4(%rbp), %rdi
140247a5c:     	xorl	%r12d, %r12d
140247a5f:     	xorps	%xmm13, %xmm13
140247a63:     	movaps	0x56f6915(%rip), %xmm14 # 0x14593e380
140247a6b:     	leaq	0x530(%rbp), %r13
140247a72:     	leaq	0x5c(%rbp), %rsi
140247a76:     	movsd	0x56f6f21(%rip), %xmm12 # 0x14593e9a0
140247a7f:     	movaps	0x56f6f29(%rip), %xmm15 # 0x14593e9b0
140247a87:     	movaps	0x56f6f31(%rip), %xmm11 # 0x14593e9c0
140247a8f:     	nop
140247a90:     	xorps	%xmm6, %xmm6
140247a93:     	cvtsi2ss	%r12d, %xmm6
140247a98:     	movaps	%xmm6, %xmm7
140247a9b:     	mulss	0x56f6ecd(%rip), %xmm7  # 0x14593e970
140247aa3:     	movaps	%xmm7, %xmm0
140247aa6:     	callq	0x145756e25 <.text+0x5755e25>
140247aab:     	subss	%xmm0, %xmm7
140247aaf:     	mulss	0x56aeb75(%rip), %xmm7  # 0x1458f662c
140247ab7:     	addss	0x56aeb65(%rip), %xmm7  # 0x1458f6624
140247abf:     	movw	$0x0, 0x1d4(%rbp)
140247ac8:     	movb	$0x1, 0x1c4(%rbp)
140247acf:     	movups	%xmm13, 0x78(%r14)
140247ad4:     	movups	%xmm13, 0x68(%r14)
140247ad9:     	movl	$0x1, 0xf8(%rbp)
140247ae3:     	movss	%xmm7, 0xfc(%rbp)
140247aeb:     	movl	$0x1, 0x100(%rbp)
140247af5:     	movss	%xmm7, 0x104(%rbp)
140247afd:     	movq	$0x0, 0xd0(%rbp)
140247b08:     	movups	%xmm13, 0xa8(%r14)
140247b10:     	movups	%xmm13, 0x98(%r14)
140247b18:     	movw	$0x0, 0x17c(%r14)
140247b22:     	movl	$0x0, 0x178(%r14)
140247b2d:     	movups	0x56f7414(%rip), %xmm0  # 0x14593ef48
140247b34:     	movups	%xmm0, 0xc8(%r14)
140247b3c:     	movups	0x56f73f5(%rip), %xmm0  # 0x14593ef38
140247b43:     	movups	%xmm0, 0xb8(%r14)
140247b4b:     	movups	0x56f7416(%rip), %xmm0  # 0x14593ef68
140247b52:     	movups	%xmm0, 0xe8(%r14)
140247b5a:     	movups	0x56f73f7(%rip), %xmm0  # 0x14593ef58
140247b61:     	movups	%xmm0, 0xd8(%r14)
140247b69:     	movups	0x56f7418(%rip), %xmm0  # 0x14593ef88
140247b70:     	movups	%xmm0, 0x108(%r14)
140247b78:     	movups	0x56f73f9(%rip), %xmm0  # 0x14593ef78
140247b7f:     	movups	%xmm0, 0xf8(%r14)
140247b87:     	movups	%xmm14, 0x188(%rbp)
140247b8f:     	movups	%xmm14, 0x198(%rbp)
140247b97:     	movw	$0x0, 0x1e6(%rbp)
140247ba0:     	movl	$0x100, 0x1e2(%rbp)     # imm = 0x100
140247baa:     	movq	$0x0, 0x1c8(%rbp)
140247bb5:     	movl	$0x3f800000, 0x1d0(%rbp) # imm = 0x3F800000
140247bbf:     	movaps	0x56a38ea(%rip), %xmm0  # 0x1458eb4b0
140247bc6:     	movups	%xmm0, 0x1a8(%rbp)
140247bcd:     	movl	$0x1, 0x1b8(%rbp)
140247bd7:     	movq	$0x0, 0x1bc(%rbp)
140247be2:     	movups	0x56f7297(%rip), %xmm0  # 0x14593ee80
140247be9:     	movaps	%xmm0, 0x70(%rbp)
140247bed:     	movq	$0x0, 0x80(%rbp)
140247bf8:     	movups	0x56f7299(%rip), %xmm0  # 0x14593ee98
140247bff:     	movups	%xmm0, 0x18(%r14)
140247c04:     	movq	$0x0, 0x28(%r14)
140247c0c:     	movups	0x56f729d(%rip), %xmm0  # 0x14593eeb0
140247c13:     	movups	%xmm0, 0x30(%r14)
140247c18:     	movq	$0x0, 0x40(%r14)
140247c20:     	movups	0x56f72a1(%rip), %xmm0  # 0x14593eec8
140247c27:     	movups	%xmm0, 0x48(%r14)
140247c2c:     	movq	$0x0, 0x58(%r14)
140247c34:     	movl	$0x10000, 0x166(%r14)   # imm = 0x10000
140247c3f:     	movw	$0x0, 0x16a(%r14)
140247c49:     	movw	$0x0, 0x170(%r14)
140247c53:     	movl	$0x10000, 0x16c(%r14)   # imm = 0x10000
140247c5e:     	movaps	0x56f6d1b(%rip), %xmm0  # 0x14593e980
140247c65:     	movups	%xmm0, 0x60(%rbp)
140247c69:     	movl	$0x0, 0x5c(%rbp)
140247c70:     	movq	%r13, %rcx
140247c73:     	movq	%rsi, %rdx
140247c76:     	callq	0x144c79aa0 <.text+0x4c78aa0>
140247c7b:     	nop
140247c7c:     	movaps	0x530(%rbp), %xmm0
140247c83:     	movups	%xmm0, 0x2b4(%rbp)
140247c8a:     	movl	$0x1, 0x2b0(%rbp)
140247c94:     	movl	$0x40c00000, 0x48(%rsp) # imm = 0x40C00000
140247c9c:     	movl	$0x1, 0x40(%rsp)
140247ca4:     	movl	$0x3f800000, 0x38(%rsp) # imm = 0x3F800000
140247cac:     	movl	$0x1, 0x30(%rsp)
140247cb4:     	movl	$0x0, 0x28(%rsp)
140247cbc:     	movl	$0x1, 0x20(%rsp)
140247cc4:     	xorps	%xmm3, %xmm3
140247cc7:     	movq	%r13, %rcx
140247cca:     	movq	%r15, %rdx
140247ccd:     	movl	$0x1, %r8d
140247cd3:     	callq	0x14264cf40 <.text+0x264bf40>
140247cd8:     	nop
140247cd9:     	movaps	%xmm6, %xmm7
140247cdc:     	mulss	0x56f6cac(%rip), %xmm7  # 0x14593e990
140247ce4:     	movaps	%xmm7, %xmm0
140247ce7:     	callq	0x145756e25 <.text+0x5755e25>
140247cec:     	movaps	%xmm0, %xmm8
140247cf0:     	movaps	%xmm6, %xmm10
140247cf4:     	mulss	0x56f6c97(%rip), %xmm10 # 0x14593e994
140247cfd:     	movaps	%xmm10, %xmm0
140247d01:     	callq	0x145756e25 <.text+0x5755e25>
140247d06:     	subss	%xmm0, %xmm10
140247d0b:     	movaps	%xmm6, %xmm9
140247d0f:     	mulss	0x56f6c80(%rip), %xmm9  # 0x14593e998
140247d18:     	movaps	%xmm9, %xmm0
140247d1c:     	callq	0x145756e25 <.text+0x5755e25>
140247d21:     	subss	%xmm0, %xmm9
140247d26:     	mulss	0x56ae901(%rip), %xmm9  # 0x1458f6630
140247d2f:     	unpcklps	%xmm10, %xmm9           # xmm9 = xmm9[0],xmm10[0],xmm9[1],xmm10[1]
140247d33:     	mulss	0x56f6c61(%rip), %xmm6  # 0x14593e99c
140247d3b:     	movaps	%xmm6, %xmm0
140247d3e:     	callq	0x145756e25 <.text+0x5755e25>
140247d43:     	movaps	%xmm0, %xmm10
140247d47:     	incl	%r12d
140247d4a:     	movl	$0x180, %r8d            # imm = 0x180
140247d50:     	leaq	0x2b8(%rbp), %rcx
140247d57:     	movq	%r14, %rdx
140247d5a:     	callq	0x145756ddd <.text+0x5755ddd>
140247d5f:     	movq	0x540(%rbp), %rax
140247d66:     	movq	%rax, 0x10(%rdi)
140247d6a:     	movups	0x530(%rbp), %xmm0
140247d71:     	movups	%xmm0, (%rdi)
140247d74:     	subss	%xmm8, %xmm7
140247d79:     	addps	%xmm12, %xmm9
140247d7d:     	subss	%xmm10, %xmm6
140247d82:     	movlhps	%xmm9, %xmm6            # xmm6 = xmm6[0],xmm9[0]
140247d86:     	shufps	$0xd4, %xmm9, %xmm7     # xmm7 = xmm7[0,1],xmm9[1,3]
140247d8b:     	shufps	$0x28, %xmm7, %xmm6     # xmm6 = xmm6[0,2],xmm7[2,0]
140247d8f:     	mulps	%xmm15, %xmm6
140247d93:     	movups	%xmm6, 0x438(%rbp)
140247d9a:     	movl	$0x0, 0x448(%rbp)
140247da4:     	movups	%xmm11, 0x44c(%rbp)
140247dac:     	movups	0x4d0(%rbp), %xmm0
140247db3:     	movups	0x4dc(%rbp), %xmm1
140247dba:     	movups	%xmm1, 0x1b0(%rbx)
140247dc1:     	movups	%xmm0, 0x1a4(%rbx)
140247dc8:     	movq	0x558(%rbp), %rax
140247dcf:     	movq	%rax, 0x2b0(%rbp)
140247dd6:     	movq	%r14, %rcx
140247dd9:     	leaq	0x288(%rbp), %rdx
140247de0:     	movq	%r15, %r8
140247de3:     	callq	0x1401f0790 <.text+0x1ef790>
140247de8:     	cmpl	$0x1c, %r12d
140247dec:     	jne	0x140247a90 <.text+0x246a90>
140247df2:     	movups	0x56f7087(%rip), %xmm0  # 0x14593ee80
140247df9:     	movaps	%xmm0, 0x4d0(%rbp)
140247e00:     	movq	$0x0, 0x4e0(%rbp)
140247e0b:     	movups	0x56f7086(%rip), %xmm1  # 0x14593ee98
140247e12:     	movups	%xmm1, 0x4e8(%rbp)
140247e19:     	movq	$0x0, 0x4f8(%rbp)
140247e24:     	movups	0x56f7085(%rip), %xmm1  # 0x14593eeb0
140247e2b:     	movaps	%xmm1, 0x500(%rbp)
140247e32:     	movq	$0x0, 0x510(%rbp)
140247e3d:     	movups	0x56f7084(%rip), %xmm2  # 0x14593eec8
140247e44:     	movups	%xmm2, 0x518(%rbp)
140247e4b:     	movq	$0x0, 0x528(%rbp)
140247e56:     	movaps	%xmm0, 0x70(%rbp)
140247e5a:     	movaps	%xmm1, 0xa0(%rbp)
140247e61:     	movq	0x4e0(%rbp), %rax
140247e68:     	movq	%rax, 0x80(%rbp)
140247e6f:     	movq	0x4e8(%rbp), %rax
140247e76:     	movq	%rax, 0x88(%rbp)
140247e7d:     	movq	0x4f0(%rbp), %rax
140247e84:     	movq	%rax, 0x90(%rbp)
140247e8b:     	movq	0x4f8(%rbp), %rax
140247e92:     	movq	%rax, 0x98(%rbp)
140247e99:     	movq	0x510(%rbp), %rax
140247ea0:     	movq	%rax, 0xb0(%rbp)
140247ea7:     	movq	0x518(%rbp), %rax
140247eae:     	movq	%rax, 0xb8(%rbp)
140247eb5:     	movaps	0x520(%rbp), %xmm0
140247ebc:     	movaps	%xmm0, 0xc0(%rbp)
140247ec3:     	xorps	%xmm0, %xmm0
140247ec6:     	movaps	%xmm0, 0xe0(%rbp)
140247ecd:     	movaps	%xmm0, 0xd0(%rbp)
140247ed4:     	movq	$0x0, 0xf0(%rbp)
140247edf:     	movups	%xmm0, 0x360(%rbp)
140247ee6:     	movups	%xmm0, 0x350(%rbp)
140247eed:     	movq	$0x0, 0x42c(%rbp)
140247ef8:     	movw	$0x0, 0x434(%rbp)
140247f01:     	leaq	0x2b8(%rbp), %rcx
140247f08:     	leaq	0x70(%rbp), %rdx
140247f0c:     	movl	$0x88, %r8d
140247f12:     	callq	0x145756ddd <.text+0x5755ddd>
140247f17:     	movaps	0x56f6842(%rip), %xmm0  # 0x14593e760
140247f1e:     	movups	%xmm0, 0x340(%rbp)
140247f25:     	movups	0x56f700c(%rip), %xmm0  # 0x14593ef38
140247f2c:     	movups	%xmm0, 0x370(%rbp)
140247f33:     	movups	0x56f700e(%rip), %xmm0  # 0x14593ef48
140247f3a:     	movups	%xmm0, 0x380(%rbp)
140247f41:     	movups	0x56f7010(%rip), %xmm0  # 0x14593ef58
140247f48:     	movups	%xmm0, 0x390(%rbp)
140247f4f:     	movups	0x56f7012(%rip), %xmm0  # 0x14593ef68
140247f56:     	movups	%xmm0, 0x3a0(%rbp)
140247f5d:     	movups	0x56f7014(%rip), %xmm0  # 0x14593ef78
140247f64:     	movups	%xmm0, 0x3b0(%rbp)
140247f6b:     	movups	0x56f7016(%rip), %xmm0  # 0x14593ef88
140247f72:     	movups	%xmm0, 0x3c0(%rbp)
140247f79:     	movups	0x56f7028(%rip), %xmm0  # 0x14593efa8
140247f80:     	movups	%xmm0, 0x3e0(%rbp)
140247f87:     	movups	0x56f700a(%rip), %xmm0  # 0x14593ef98
140247f8e:     	movups	%xmm0, 0x3d0(%rbp)
140247f95:     	movaps	0x56a3514(%rip), %xmm0  # 0x1458eb4b0
140247f9c:     	movups	%xmm0, 0x3f0(%rbp)
140247fa3:     	movl	$0x1, 0x400(%rbp)
140247fad:     	movq	$0x0, 0x404(%rbp)
140247fb8:     	movb	$0x1, 0x40c(%rbp)
140247fbf:     	movq	$0x0, 0x410(%rbp)
140247fca:     	movl	$0x3f800000, 0x418(%rbp) # imm = 0x3F800000
140247fd4:     	movw	$0x0, 0x41c(%rbp)
140247fdd:     	movl	$0x10000, 0x41e(%rbp)   # imm = 0x10000
140247fe7:     	movw	$0x0, 0x422(%rbp)
140247ff0:     	movabsq	$0x100000000010000, %rax # imm = 0x100000000010000
140247ffa:     	movq	%rax, 0x424(%rbp)
140248001:     	movsd	0x56b0ee7(%rip), %xmm0  # 0x1458f8ef0
140248009:     	movsd	%xmm0, 0x438(%rbp)
140248011:     	movl	$0x3fcccccd, 0x440(%rbp) # imm = 0x3FCCCCCD
14024801b:     	movups	0x56f7256(%rip), %xmm0  # 0x14593f278
140248022:     	movups	%xmm0, 0x444(%rbp)
140248029:     	movups	0x56f7258(%rip), %xmm0  # 0x14593f288
140248030:     	movups	%xmm0, 0x454(%rbp)
140248037:     	movq	0x558(%rbp), %rax
14024803e:     	movq	%rax, 0x2b0(%rbp)
140248045:     	leaq	0x4d0(%rbp), %rcx
14024804c:     	leaq	0x2b0(%rbp), %r8
140248053:     	leaq	0x288(%rbp), %rdx
14024805a:     	callq	0x1401f0210 <.text+0x1ef210>
14024805f:     	movq	0x4c8(%rbp), %rax
140248066:     	movaps	0x570(%rbp), %xmm6
14024806d:     	movaps	0x580(%rbp), %xmm7
140248074:     	movaps	0x590(%rbp), %xmm8
14024807c:     	movaps	0x5a0(%rbp), %xmm9
140248084:     	movaps	0x5b0(%rbp), %xmm10
14024808c:     	movaps	0x5c0(%rbp), %xmm11
140248094:     	movaps	0x5d0(%rbp), %xmm12
14024809c:     	movaps	0x5e0(%rbp), %xmm13
1402480a4:     	movaps	0x5f0(%rbp), %xmm14
1402480ac:     	movaps	0x600(%rbp), %xmm15
1402480b4:     	addq	$0x698, %rsp            # imm = 0x698
1402480bb:     	popq	%rbx
1402480bc:     	popq	%rdi
1402480bd:     	popq	%rsi
1402480be:     	popq	%r12
1402480c0:     	popq	%r13
1402480c2:     	popq	%r14
1402480c4:     	popq	%r15
1402480c6:     	popq	%rbp
1402480c7:     	retq
1402480c8:     	movl	$0x8, %ecx
1402480cd:     	movl	$0x90, %edx
1402480d2:     	callq	0x1458e7201 <.text+0x58e6201>
1402480d7:     	nop
1402480d8:     	jmp	0x1402480fc <.text+0x2470fc>
1402480da:     	movl	$0x4, %ecx
1402480df:     	movl	$0x40, %edx
1402480e4:     	callq	0x1458e7201 <.text+0x58e6201>
1402480e9:     	nop
1402480ea:     	jmp	0x1402480fc <.text+0x2470fc>
1402480ec:     	movl	$0x4, %ecx
1402480f1:     	movl	$0x40, %edx
1402480f6:     	callq	0x1458e7201 <.text+0x58e6201>
1402480fb:     	nop
1402480fc:     	ud2

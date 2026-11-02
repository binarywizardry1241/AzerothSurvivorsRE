
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140217370:     	pushq	%rbp
140217371:     	pushq	%r15
140217373:     	pushq	%r14
140217375:     	pushq	%r13
140217377:     	pushq	%r12
140217379:     	pushq	%rsi
14021737a:     	pushq	%rdi
14021737b:     	pushq	%rbx
14021737c:     	subq	$0x958, %rsp            # imm = 0x958
140217383:     	leaq	0x80(%rsp), %rbp
14021738b:     	movaps	%xmm15, 0x8c0(%rbp)
140217393:     	movaps	%xmm14, 0x8b0(%rbp)
14021739b:     	movaps	%xmm13, 0x8a0(%rbp)
1402173a3:     	movaps	%xmm12, 0x890(%rbp)
1402173ab:     	movaps	%xmm11, 0x880(%rbp)
1402173b3:     	movaps	%xmm10, 0x870(%rbp)
1402173bb:     	movaps	%xmm9, 0x860(%rbp)
1402173c3:     	movaps	%xmm8, 0x850(%rbp)
1402173cb:     	movaps	%xmm7, 0x840(%rbp)
1402173d2:     	movaps	%xmm6, 0x830(%rbp)
1402173d9:     	movq	$-0x2, 0x828(%rbp)
1402173e4:     	movq	%rcx, %r15
1402173e7:     	movq	(%rcx), %r14
1402173ea:     	movq	0x28(%rcx), %rax
1402173ee:     	movq	%r14, 0x90(%rbp)
1402173f5:     	movups	0x8(%rcx), %xmm0
1402173f9:     	movups	%xmm0, 0x98(%rbp)
140217400:     	movups	0x18(%rcx), %xmm0
140217404:     	movups	%xmm0, 0xa8(%rbp)
14021740b:     	movq	%rax, 0xb8(%rbp)
140217412:     	movw	$0x0, 0x744(%rbp)
14021741b:     	movb	$0x1, 0x734(%rbp)
140217422:     	movsd	0x5727046(%rip), %xmm0  # 0x14593e470
14021742a:     	movups	%xmm0, 0x648(%rbp)
140217431:     	movsd	0x5727047(%rip), %xmm0  # 0x14593e480
140217439:     	movups	%xmm0, 0x658(%rbp)
140217440:     	movaps	0x5727049(%rip), %xmm0  # 0x14593e490
140217447:     	movups	%xmm0, 0x668(%rbp)
14021744e:     	movq	$0x0, 0x640(%rbp)
140217459:     	xorps	%xmm0, %xmm0
14021745c:     	movups	%xmm0, 0x678(%rbp)
140217463:     	movups	%xmm0, 0x688(%rbp)
14021746a:     	movl	$0x0, 0x758(%rbp)
140217474:     	movw	$0x0, 0x75c(%rbp)
14021747d:     	movaps	0x56e565c(%rip), %xmm0  # 0x1458fcae0
140217484:     	movups	%xmm0, 0x698(%rbp)
14021748b:     	movaps	0x572700e(%rip), %xmm0  # 0x14593e4a0
140217492:     	movups	%xmm0, 0x6a8(%rbp)
140217499:     	movups	0x5727ab8(%rip), %xmm0  # 0x14593ef58
1402174a0:     	movups	%xmm0, 0x6b8(%rbp)
1402174a7:     	movups	0x5727ab9(%rip), %xmm13 # 0x14593ef68
1402174af:     	movups	%xmm13, 0x6c8(%rbp)
1402174b7:     	movups	0x5727aba(%rip), %xmm0  # 0x14593ef78
1402174be:     	movups	%xmm0, 0x6d8(%rbp)
1402174c5:     	movups	0x5727abc(%rip), %xmm7  # 0x14593ef88
1402174cc:     	movups	%xmm7, 0x6e8(%rbp)
1402174d3:     	movups	0x5727acd(%rip), %xmm12 # 0x14593efa8
1402174db:     	movups	%xmm12, 0x708(%rbp)
1402174e3:     	movups	0x5727aae(%rip), %xmm0  # 0x14593ef98
1402174ea:     	movups	%xmm0, 0x6f8(%rbp)
1402174f1:     	movb	$0x0, 0x756(%rbp)
1402174f8:     	movl	$0x100, 0x752(%rbp)     # imm = 0x100
140217502:     	movq	$0x0, 0x738(%rbp)
14021750d:     	movl	$0x3f800000, 0x740(%rbp) # imm = 0x3F800000
140217517:     	movaps	0x56d3f92(%rip), %xmm0  # 0x1458eb4b0
14021751e:     	movups	%xmm0, 0x718(%rbp)
140217525:     	movl	$0x1, 0x728(%rbp)
14021752f:     	movq	$0x0, 0x72c(%rbp)
14021753a:     	movb	$0x0, 0x757(%rbp)
140217541:     	movups	0x5727937(%rip), %xmm8  # 0x14593ee80
140217549:     	movaps	%xmm8, 0x5e0(%rbp)
140217551:     	movq	$0x0, 0x5f0(%rbp)
14021755c:     	movups	0x5727935(%rip), %xmm0  # 0x14593ee98
140217563:     	movups	%xmm0, 0x5f8(%rbp)
14021756a:     	movq	$0x0, 0x608(%rbp)
140217575:     	movups	0x5727934(%rip), %xmm0  # 0x14593eeb0
14021757c:     	movaps	%xmm0, 0x610(%rbp)
140217583:     	movq	$0x0, 0x620(%rbp)
14021758e:     	movups	0x5727933(%rip), %xmm0  # 0x14593eec8
140217595:     	movups	%xmm0, 0x628(%rbp)
14021759c:     	movq	$0x0, 0x638(%rbp)
1402175a7:     	movw	$0x0, 0x74a(%rbp)
1402175b0:     	movl	$0x10000, 0x746(%rbp)   # imm = 0x10000
1402175ba:     	movw	$0x0, 0x750(%rbp)
1402175c3:     	movl	$0x10000, 0x74c(%rbp)   # imm = 0x10000
1402175cd:     	movq	%rdx, 0x540(%rbp)
1402175d4:     	movq	0x18(%rdx), %rax
1402175d8:     	movq	(%rax), %rax
1402175db:     	cmpb	$0x1, (%rax)
1402175de:     	jne	0x1402175ef <.text+0x2165ef>
1402175e0:     	movups	0x1(%rax), %xmm0
1402175e4:     	movups	%xmm0, 0x301(%rbp)
1402175eb:     	movb	$0x1, %al
1402175ed:     	jmp	0x14021760a <.text+0x21660a>
1402175ef:     	movq	0x8(%rax), %rcx
1402175f3:     	lock
1402175f4:     	incq	(%rcx)
1402175f7:     	jle	0x14021a34a <.text+0x21934a>
1402175fd:     	movq	0x8(%rax), %rax
140217601:     	movq	%rax, 0x308(%rbp)
140217608:     	xorl	%eax, %eax
14021760a:     	movb	%al, 0x300(%rbp)
140217610:     	leaq	0x550(%rbp), %rcx
140217617:     	leaq	0x300(%rbp), %rdx
14021761e:     	callq	0x1426f00c0 <.text+0x26ef0c0>
140217623:     	nop
140217624:     	leaq	0x98(%rbp), %rdi
14021762b:     	movq	0x540(%rbp), %rax
140217632:     	movq	0x20(%rax), %rbx
140217636:     	movups	(%rbx), %xmm0
140217639:     	movups	%xmm0, 0x588(%rbp)
140217640:     	movl	$0x3dcccccd, 0x598(%rbp) # imm = 0x3DCCCCCD
14021764a:     	leaq	0x480(%rbp), %rcx
140217651:     	leaq	0x550(%rbp), %rdx
140217658:     	movl	$0x88, %r8d
14021765e:     	callq	0x145756ddd <.text+0x5755ddd>
140217663:     	leaq	0x300(%rbp), %rsi
14021766a:     	leaq	0x5e0(%rbp), %rdx
140217671:     	movl	$0x180, %r8d            # imm = 0x180
140217677:     	movq	%rsi, %rcx
14021767a:     	callq	0x145756ddd <.text+0x5755ddd>
14021767f:     	movups	0x5727bf1(%rip), %xmm14 # 0x14593f278
140217687:     	movups	%xmm14, 0x508(%rbp)
14021768f:     	movups	0x5727bf1(%rip), %xmm10 # 0x14593f288
140217697:     	movups	%xmm10, 0x518(%rbp)
14021769f:     	leaq	0x5e8(%rbp), %rcx
1402176a6:     	movl	$0x228, %r8d            # imm = 0x228
1402176ac:     	movq	%rsi, %rdx
1402176af:     	callq	0x145756ddd <.text+0x5755ddd>
1402176b4:     	movq	%r14, 0x5e0(%rbp)
1402176bb:     	movb	$0x1, 0x825(%rbp)
1402176c2:     	leaq	0x550(%rbp), %rcx
1402176c9:     	leaq	0x5e0(%rbp), %r8
1402176d0:     	movq	%rdi, %rdx
1402176d3:     	callq	0x1401ec0b0 <.text+0x1eb0b0>
1402176d8:     	nop
1402176d9:     	movw	$0x0, 0x464(%rbp)
1402176e2:     	movb	$0x1, 0x454(%rbp)
1402176e9:     	xorps	%xmm0, %xmm0
1402176ec:     	movups	%xmm0, 0x368(%rbp)
1402176f3:     	movups	%xmm0, 0x378(%rbp)
1402176fa:     	movaps	0x56ded5f(%rip), %xmm1  # 0x1458f6460
140217701:     	movups	%xmm1, 0x388(%rbp)
140217708:     	movq	$0x0, 0x360(%rbp)
140217713:     	movups	%xmm0, 0x398(%rbp)
14021771a:     	movups	%xmm0, 0x3a8(%rbp)
140217721:     	movl	$0x0, 0x478(%rbp)
14021772b:     	movw	$0x0, 0x47c(%rbp)
140217734:     	movups	0x57277fc(%rip), %xmm15 # 0x14593ef38
14021773c:     	movups	%xmm15, 0x3b8(%rbp)
140217744:     	movups	0x57277fd(%rip), %xmm0  # 0x14593ef48
14021774b:     	movaps	%xmm0, %xmm9
14021774f:     	movups	%xmm0, 0x3c8(%rbp)
140217756:     	movups	0x57277fb(%rip), %xmm0  # 0x14593ef58
14021775d:     	movups	%xmm0, 0x3d8(%rbp)
140217764:     	movups	%xmm13, 0x3e8(%rbp)
14021776c:     	movups	%xmm7, 0x408(%rbp)
140217773:     	movups	0x57277fe(%rip), %xmm0  # 0x14593ef78
14021777a:     	movups	%xmm0, 0x3f8(%rbp)
140217781:     	movups	%xmm12, 0x428(%rbp)
140217789:     	movups	0x5727808(%rip), %xmm0  # 0x14593ef98
140217790:     	movups	%xmm0, 0x418(%rbp)
140217797:     	movb	$0x0, 0x476(%rbp)
14021779e:     	movl	$0x100, 0x472(%rbp)     # imm = 0x100
1402177a8:     	movq	$0x0, 0x458(%rbp)
1402177b3:     	movl	$0x3f800000, 0x460(%rbp) # imm = 0x3F800000
1402177bd:     	movaps	0x56d3cec(%rip), %xmm0  # 0x1458eb4b0
1402177c4:     	movups	%xmm0, 0x438(%rbp)
1402177cb:     	movl	$0x1, 0x448(%rbp)
1402177d5:     	movq	$0x0, 0x44c(%rbp)
1402177e0:     	movb	$0x0, 0x477(%rbp)
1402177e7:     	movaps	%xmm8, 0x300(%rbp)
1402177ef:     	movq	$0x0, 0x310(%rbp)
1402177fa:     	movups	0x5727697(%rip), %xmm0  # 0x14593ee98
140217801:     	movups	%xmm0, 0x318(%rbp)
140217808:     	movq	$0x0, 0x328(%rbp)
140217813:     	movups	0x5727696(%rip), %xmm0  # 0x14593eeb0
14021781a:     	movaps	%xmm0, 0x330(%rbp)
140217821:     	movq	$0x0, 0x340(%rbp)
14021782c:     	movups	0x5727695(%rip), %xmm0  # 0x14593eec8
140217833:     	movups	%xmm0, 0x348(%rbp)
14021783a:     	movq	$0x0, 0x358(%rbp)
140217845:     	movw	$0x0, 0x46a(%rbp)
14021784e:     	movl	$0x10000, 0x466(%rbp)   # imm = 0x10000
140217858:     	movw	$0x0, 0x470(%rbp)
140217861:     	movl	$0x10000, 0x46c(%rbp)   # imm = 0x10000
14021786b:     	callq	0x140002200 <.text+0x1200>
140217870:     	movl	$0x40, %ecx
140217875:     	movl	$0x4, %edx
14021787a:     	callq	0x1400021c0 <.text+0x11c0>
14021787f:     	testq	%rax, %rax
140217882:     	je	0x14021a30f <.text+0x21930f>
140217888:     	movq	%rax, 0x818(%rbp)
14021788f:     	movups	0x5727d4a(%rip), %xmm0  # 0x14593f5e0
140217896:     	movaps	%xmm0, 0x5e0(%rbp)
14021789d:     	movl	$0x0, 0x5f0(%rbp)
1402178a7:     	leaq	0x550(%rbp), %rcx
1402178ae:     	leaq	0x5e0(%rbp), %rdx
1402178b5:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1402178ba:     	nop
1402178bb:     	movaps	0x550(%rbp), %xmm11
1402178c3:     	movaps	0x5726be6(%rip), %xmm0  # 0x14593e4b0
1402178ca:     	movups	%xmm0, 0x5e4(%rbp)
1402178d1:     	movl	$0x0, 0x5e0(%rbp)
1402178db:     	leaq	0x550(%rbp), %rcx
1402178e2:     	leaq	0x5e0(%rbp), %rdx
1402178e9:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1402178ee:     	nop
1402178ef:     	movaps	0x550(%rbp), %xmm0
1402178f6:     	movabsq	$0x4190000000000002, %rax # imm = 0x4190000000000002
140217900:     	movq	0x818(%rbp), %r12
140217907:     	movq	%rax, (%r12)
14021790b:     	movl	$0x1, 0x8(%r12)
140217914:     	movups	%xmm11, 0xc(%r12)
14021791a:     	movaps	0x5726b9f(%rip), %xmm1  # 0x14593e4c0
140217921:     	movups	%xmm1, 0x1c(%r12)
140217927:     	movups	%xmm0, 0x2c(%r12)
14021792d:     	movl	$0x3f000000, 0x3c(%r12) # imm = 0x3F000000
140217936:     	callq	0x140002200 <.text+0x1200>
14021793b:     	movl	$0x48, %ecx
140217940:     	movl	$0x8, %edx
140217945:     	callq	0x1400021c0 <.text+0x11c0>
14021794a:     	testq	%rax, %rax
14021794d:     	je	0x14021a321 <.text+0x219321>
140217953:     	movq	%rax, %rsi
140217956:     	movq	$0x2, (%rax)
14021795d:     	movq	%r12, 0x8(%rax)
140217961:     	movq	$0x2, 0x10(%rax)
140217969:     	movq	$0x1, 0x18(%rax)
140217971:     	movl	$0x2, 0x20(%rax)
140217978:     	movss	0x56e5460(%rip), %xmm0  # 0x1458fcde0
140217980:     	movlps	%xmm0, 0x24(%rax)
140217984:     	movabsq	$0xa00000000, %rax      # imm = 0xA00000000
14021798e:     	movq	%rax, 0x2c(%rsi)
140217992:     	movb	$0x0, 0x40(%rsi)
140217996:     	leaq	0x5e8(%rbp), %rcx
14021799d:     	leaq	0x300(%rbp), %rdx
1402179a4:     	movl	$0x180, %r8d            # imm = 0x180
1402179aa:     	callq	0x145756ddd <.text+0x5755ddd>
1402179af:     	movq	$0x1, 0x768(%rbp)
1402179ba:     	movq	%rsi, 0x770(%rbp)
1402179c1:     	movq	$0x1, 0x778(%rbp)
1402179cc:     	movq	%r14, 0x5e0(%rbp)
1402179d3:     	movb	$0x1, 0x825(%rbp)
1402179da:     	leaq	0x300(%rbp), %rcx
1402179e1:     	leaq	0x5e0(%rbp), %r8
1402179e8:     	movq	%rdi, %rdx
1402179eb:     	callq	0x1401e7230 <.text+0x1e6230>
1402179f0:     	nop
1402179f1:     	xorps	%xmm11, %xmm11
1402179f5:     	movups	%xmm11, 0x660(%rbp)
1402179fd:     	movups	%xmm11, 0x650(%rbp)
140217a05:     	movups	%xmm11, 0x680(%rbp)
140217a0d:     	movups	%xmm11, 0x690(%rbp)
140217a15:     	movl	$0x0, 0x760(%rbp)
140217a1f:     	movw	$0x0, 0x764(%rbp)
140217a28:     	movaps	%xmm8, 0x300(%rbp)
140217a30:     	movq	$0x0, 0x310(%rbp)
140217a3b:     	movups	0x5727456(%rip), %xmm0  # 0x14593ee98
140217a42:     	movups	%xmm0, 0x318(%rbp)
140217a49:     	movq	$0x0, 0x328(%rbp)
140217a54:     	movups	0x5727455(%rip), %xmm0  # 0x14593eeb0
140217a5b:     	movaps	%xmm0, 0x330(%rbp)
140217a62:     	movq	$0x0, 0x340(%rbp)
140217a6d:     	movups	0x5727454(%rip), %xmm0  # 0x14593eec8
140217a74:     	movups	%xmm0, 0x348(%rbp)
140217a7b:     	movq	$0x0, 0x358(%rbp)
140217a86:     	movq	0x350(%rbp), %rax
140217a8d:     	movq	%rax, 0x638(%rbp)
140217a94:     	movq	0x358(%rbp), %rax
140217a9b:     	movq	%rax, 0x640(%rbp)
140217aa2:     	movq	0x340(%rbp), %rax
140217aa9:     	movq	%rax, 0x628(%rbp)
140217ab0:     	movq	0x348(%rbp), %rax
140217ab7:     	movq	%rax, 0x630(%rbp)
140217abe:     	movaps	0x330(%rbp), %xmm0
140217ac5:     	movups	%xmm0, 0x618(%rbp)
140217acc:     	movaps	0x310(%rbp), %xmm0
140217ad3:     	movups	%xmm0, 0x5f8(%rbp)
140217ada:     	movaps	0x300(%rbp), %xmm0
140217ae1:     	movq	0x320(%rbp), %rax
140217ae8:     	movq	0x328(%rbp), %rcx
140217aef:     	movq	%rax, 0x608(%rbp)
140217af6:     	movq	%rcx, 0x610(%rbp)
140217afd:     	movups	%xmm0, 0x5e8(%rbp)
140217b04:     	movq	$0x0, 0x648(%rbp)
140217b0f:     	movaps	0x57269ba(%rip), %xmm0  # 0x14593e4d0
140217b16:     	movups	%xmm0, 0x670(%rbp)
140217b1d:     	movups	%xmm9, 0x6b0(%rbp)
140217b25:     	movups	%xmm15, 0x6a0(%rbp)
140217b2d:     	movups	%xmm13, 0x6d0(%rbp)
140217b35:     	movups	0x572741c(%rip), %xmm0  # 0x14593ef58
140217b3c:     	movups	%xmm0, 0x6c0(%rbp)
140217b43:     	movups	%xmm7, 0x6f0(%rbp)
140217b4a:     	movups	0x5727427(%rip), %xmm0  # 0x14593ef78
140217b51:     	movups	%xmm0, 0x6e0(%rbp)
140217b58:     	movups	%xmm12, 0x710(%rbp)
140217b60:     	movups	0x5727431(%rip), %xmm0  # 0x14593ef98
140217b67:     	movups	%xmm0, 0x700(%rbp)
140217b6e:     	movaps	0x56d393b(%rip), %xmm0  # 0x1458eb4b0
140217b75:     	movups	%xmm0, 0x720(%rbp)
140217b7c:     	movl	$0x1, 0x730(%rbp)
140217b86:     	movq	$0x0, 0x734(%rbp)
140217b91:     	movb	$0x1, 0x73c(%rbp)
140217b98:     	movq	$0x0, 0x740(%rbp)
140217ba3:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
140217bad:     	movw	$0x0, 0x74c(%rbp)
140217bb6:     	movw	$0x0, 0x752(%rbp)
140217bbf:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
140217bc9:     	movw	$0x0, 0x758(%rbp)
140217bd2:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
140217bdc:     	movw	$0x100, 0x75a(%rbp)     # imm = 0x100
140217be5:     	movl	$0x0, 0x75c(%rbp)
140217bef:     	movsd	0x57268e9(%rip), %xmm0  # 0x14593e4e0
140217bf7:     	movsd	%xmm0, 0x768(%rbp)
140217bff:     	movl	$0x3faccccd, 0x770(%rbp) # imm = 0x3FACCCCD
140217c09:     	movups	%xmm10, 0x784(%rbp)
140217c11:     	movups	%xmm14, 0x774(%rbp)
140217c19:     	movq	%r14, 0x5e0(%rbp)
140217c20:     	movb	$0x1, 0x825(%rbp)
140217c27:     	leaq	0x60(%rbp), %rcx
140217c2b:     	leaq	0x5e0(%rbp), %r8
140217c32:     	movq	%rdi, %rdx
140217c35:     	callq	0x1401e88e0 <.text+0x1e78e0>
140217c3a:     	nop
140217c3b:     	movq	%r15, 0x178(%rbp)
140217c42:     	movq	0x540(%rbp), %rdx
140217c49:     	movq	0x28(%rdx), %r15
140217c4d:     	movq	0x30(%rdx), %rax
140217c51:     	movq	%rax, 0x818(%rbp)
140217c58:     	movq	0x38(%rdx), %rdi
140217c5c:     	movq	0x40(%rdx), %rax
140217c60:     	movq	%rax, 0x158(%rbp)
140217c67:     	movq	0x48(%rdx), %rax
140217c6b:     	movq	%rax, 0x228(%rbp)
140217c72:     	movq	0x50(%rdx), %rax
140217c76:     	movq	%rax, 0x230(%rbp)
140217c7d:     	movq	0x58(%rdx), %rax
140217c81:     	movq	%rax, 0x150(%rbp)
140217c88:     	movq	0x60(%rdx), %rax
140217c8c:     	movq	%rax, 0x2f8(%rbp)
140217c93:     	movq	0x68(%rdx), %rax
140217c97:     	movq	%rax, 0x160(%rbp)
140217c9e:     	movq	0x70(%rdx), %rax
140217ca2:     	movq	%rax, 0x168(%rbp)
140217ca9:     	movq	0x78(%rdx), %rax
140217cad:     	movq	%rax, 0x170(%rbp)
140217cb4:     	movq	0x60(%rbp), %rax
140217cb8:     	movq	0x88(%rbp), %rcx
140217cbf:     	movq	%rax, 0x30(%rbp)
140217cc3:     	movups	0x68(%rbp), %xmm0
140217cc7:     	movups	%xmm0, 0x38(%rbp)
140217ccb:     	movups	0x78(%rbp), %xmm0
140217ccf:     	movups	%xmm0, 0x48(%rbp)
140217cd3:     	movq	%rcx, 0x58(%rbp)
140217cd7:     	movups	%xmm11, 0x660(%rbp)
140217cdf:     	movups	%xmm11, 0x650(%rbp)
140217ce7:     	movups	%xmm11, 0x680(%rbp)
140217cef:     	movups	%xmm11, 0x690(%rbp)
140217cf7:     	movaps	%xmm12, %xmm6
140217cfb:     	movaps	%xmm9, %xmm3
140217cff:     	movaps	%xmm8, %xmm14
140217d03:     	movaps	%xmm8, 0x300(%rbp)
140217d0b:     	movq	$0x0, 0x310(%rbp)
140217d16:     	movups	0x572717a(%rip), %xmm9  # 0x14593ee98
140217d1e:     	movups	%xmm9, 0x318(%rbp)
140217d26:     	movq	$0x0, 0x328(%rbp)
140217d31:     	movups	0x5727177(%rip), %xmm10 # 0x14593eeb0
140217d39:     	movaps	%xmm10, 0x330(%rbp)
140217d41:     	movq	$0x0, 0x340(%rbp)
140217d4c:     	movups	0x5727174(%rip), %xmm11 # 0x14593eec8
140217d54:     	movups	%xmm11, 0x348(%rbp)
140217d5c:     	movq	$0x0, 0x358(%rbp)
140217d67:     	movq	0x350(%rbp), %rcx
140217d6e:     	movq	%rcx, 0x638(%rbp)
140217d75:     	movq	0x358(%rbp), %rcx
140217d7c:     	movq	%rcx, 0x640(%rbp)
140217d83:     	movq	0x340(%rbp), %rcx
140217d8a:     	movq	%rcx, 0x628(%rbp)
140217d91:     	movq	0x348(%rbp), %rcx
140217d98:     	movq	%rcx, 0x630(%rbp)
140217d9f:     	movaps	0x300(%rbp), %xmm0
140217da6:     	movaps	0x310(%rbp), %xmm1
140217dad:     	movq	0x320(%rbp), %rcx
140217db4:     	movq	%rcx, 0x608(%rbp)
140217dbb:     	movq	0x328(%rbp), %rcx
140217dc2:     	movaps	0x330(%rbp), %xmm2
140217dc9:     	movups	%xmm2, 0x618(%rbp)
140217dd0:     	movq	%rcx, 0x610(%rbp)
140217dd7:     	movups	%xmm1, 0x5f8(%rbp)
140217dde:     	movups	%xmm0, 0x5e8(%rbp)
140217de5:     	movq	$0x0, 0x648(%rbp)
140217df0:     	movaps	0x56de669(%rip), %xmm0  # 0x1458f6460
140217df7:     	movups	%xmm0, 0x670(%rbp)
140217dfe:     	movaps	%xmm3, %xmm12
140217e02:     	movups	%xmm3, 0x6b0(%rbp)
140217e09:     	movaps	%xmm15, %xmm11
140217e0d:     	movups	%xmm15, 0x6a0(%rbp)
140217e15:     	movups	%xmm13, 0x6d0(%rbp)
140217e1d:     	movups	0x5727153(%rip), %xmm9  # 0x14593ef78
140217e25:     	movaps	%xmm13, %xmm10
140217e29:     	movups	0x5727127(%rip), %xmm13 # 0x14593ef58
140217e31:     	movups	%xmm13, 0x6c0(%rbp)
140217e39:     	movups	%xmm7, 0x6f0(%rbp)
140217e40:     	movups	%xmm9, 0x6e0(%rbp)
140217e48:     	movups	%xmm6, 0x710(%rbp)
140217e4f:     	movups	0x5727141(%rip), %xmm15 # 0x14593ef98
140217e57:     	movups	%xmm15, 0x700(%rbp)
140217e5f:     	movaps	0x572668a(%rip), %xmm0  # 0x14593e4f0
140217e66:     	movups	%xmm0, 0x720(%rbp)
140217e6d:     	movl	$0x1, 0x730(%rbp)
140217e77:     	movq	$0x0, 0x734(%rbp)
140217e82:     	movb	$0x1, 0x73c(%rbp)
140217e89:     	movq	$0x0, 0x740(%rbp)
140217e94:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
140217e9e:     	movw	$0x0, 0x74c(%rbp)
140217ea7:     	movw	$0x0, 0x752(%rbp)
140217eb0:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
140217eba:     	movw	$0x0, 0x758(%rbp)
140217ec3:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
140217ecd:     	movl	$0x0, 0x75a(%rbp)
140217ed7:     	movabsq	$0x500000500000001, %rcx # imm = 0x500000500000001
140217ee1:     	movq	%rcx, 0x75e(%rbp)
140217ee8:     	movq	(%rdx), %rcx
140217eeb:     	movq	%rcx, 0x538(%rbp)
140217ef2:     	movq	%rax, 0x5e0(%rbp)
140217ef9:     	movq	0x8(%rdx), %rax
140217efd:     	movq	%rax, 0x548(%rbp)
140217f04:     	movb	$0x0, 0x824(%rbp)
140217f0b:     	movq	0x10(%rdx), %r14
140217f0f:     	leaq	0x38(%rbp), %rdx
140217f13:     	movq	%rbp, %rcx
140217f16:     	leaq	0x5e0(%rbp), %r8
140217f1d:     	callq	0x1401e3e60 <.text+0x1e2e60>
140217f22:     	nop
140217f23:     	movq	(%rbp), %r12
140217f27:     	movq	0x28(%rbp), %rax
140217f2b:     	movq	%r12, 0xf0(%rbp)
140217f32:     	leaq	0xf8(%rbp), %rsi
140217f39:     	movups	0x8(%rbp), %xmm0
140217f3d:     	movups	%xmm0, 0xf8(%rbp)
140217f44:     	movups	0x18(%rbp), %xmm0
140217f48:     	movups	%xmm0, 0x108(%rbp)
140217f4f:     	movq	%rax, 0x118(%rbp)
140217f56:     	xorps	%xmm8, %xmm8
140217f5a:     	movaps	%xmm8, 0x3a0(%rbp)
140217f62:     	movaps	%xmm8, 0x390(%rbp)
140217f6a:     	movaps	%xmm8, 0x380(%rbp)
140217f72:     	movaps	%xmm8, 0x370(%rbp)
140217f7a:     	movaps	%xmm8, 0x360(%rbp)
140217f82:     	movq	$0x0, 0x3b0(%rbp)
140217f8d:     	movups	%xmm11, 0x3b8(%rbp)
140217f95:     	movups	%xmm12, 0x3c8(%rbp)
140217f9d:     	movups	%xmm13, 0x3d8(%rbp)
140217fa5:     	movaps	%xmm10, %xmm13
140217fa9:     	movups	%xmm10, 0x3e8(%rbp)
140217fb1:     	movups	%xmm9, 0x3f8(%rbp)
140217fb9:     	movups	%xmm7, 0x408(%rbp)
140217fc0:     	movups	%xmm6, 0x428(%rbp)
140217fc7:     	movups	%xmm15, 0x418(%rbp)
140217fcf:     	movaps	%xmm14, 0x300(%rbp)
140217fd7:     	movq	$0x0, 0x310(%rbp)
140217fe2:     	movups	0x5726eaf(%rip), %xmm0  # 0x14593ee98
140217fe9:     	movups	%xmm0, 0x318(%rbp)
140217ff0:     	movq	$0x0, 0x328(%rbp)
140217ffb:     	movups	0x5726eae(%rip), %xmm0  # 0x14593eeb0
140218002:     	movaps	%xmm0, 0x330(%rbp)
140218009:     	movq	$0x0, 0x340(%rbp)
140218014:     	movups	0x5726ead(%rip), %xmm0  # 0x14593eec8
14021801b:     	movups	%xmm0, 0x348(%rbp)
140218022:     	movq	$0x0, 0x358(%rbp)
14021802d:     	leaq	0x5e8(%rbp), %rcx
140218034:     	leaq	0x300(%rbp), %rdx
14021803b:     	movl	$0x138, %r8d            # imm = 0x138
140218041:     	callq	0x145756ddd <.text+0x5755ddd>
140218046:     	movaps	0x56d3462(%rip), %xmm10 # 0x1458eb4b0
14021804e:     	movups	%xmm10, 0x720(%rbp)
140218056:     	movl	$0x1, 0x730(%rbp)
140218060:     	movq	$0x0, 0x734(%rbp)
14021806b:     	movb	$0x1, 0x73c(%rbp)
140218072:     	movq	$0x0, 0x740(%rbp)
14021807d:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
140218087:     	movw	$0x0, 0x74c(%rbp)
140218090:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
14021809a:     	movw	$0x0, 0x752(%rbp)
1402180a3:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
1402180ad:     	movw	$0x0, 0x758(%rbp)
1402180b6:     	movl	$0x0, 0x75a(%rbp)
1402180c0:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
1402180ca:     	movq	%rax, 0x75e(%rbp)
1402180d1:     	movq	%r12, 0x238(%rbp)
1402180d8:     	movq	%r12, 0x5e0(%rbp)
1402180df:     	movb	$0x0, 0x827(%rbp)
1402180e6:     	leaq	0x240(%rbp), %rcx
1402180ed:     	leaq	0x5e0(%rbp), %r8
1402180f4:     	movq	%rsi, %rdx
1402180f7:     	callq	0x1401e3e60 <.text+0x1e2e60>
1402180fc:     	nop
1402180fd:     	movaps	%xmm9, %xmm14
140218101:     	movq	0x240(%rbp), %r13
140218108:     	movq	0x268(%rbp), %rax
14021810f:     	movq	%r13, 0x290(%rbp)
140218116:     	movups	0x248(%rbp), %xmm0
14021811d:     	movups	%xmm0, 0x298(%rbp)
140218124:     	movups	0x258(%rbp), %xmm0
14021812b:     	movups	%xmm0, 0x2a8(%rbp)
140218132:     	movq	%rax, 0x2b8(%rbp)
140218139:     	movw	$0x0, 0x744(%rbp)
140218142:     	movb	$0x1, 0x734(%rbp)
140218149:     	movaps	%xmm8, 0x640(%rbp)
140218151:     	movaps	%xmm8, 0x650(%rbp)
140218159:     	movaps	%xmm8, 0x660(%rbp)
140218161:     	movaps	%xmm8, 0x670(%rbp)
140218169:     	movaps	%xmm8, 0x680(%rbp)
140218171:     	movq	$0x0, 0x690(%rbp)
14021817c:     	movl	$0x0, 0x758(%rbp)
140218186:     	movw	$0x0, 0x75c(%rbp)
14021818f:     	movups	%xmm11, 0x698(%rbp)
140218197:     	movups	%xmm12, 0x6a8(%rbp)
14021819f:     	movaps	0x56e0c2a(%rip), %xmm0  # 0x1458f8dd0
1402181a6:     	movups	%xmm0, 0x6b8(%rbp)
1402181ad:     	movaps	0x56e483c(%rip), %xmm0  # 0x1458fc9f0
1402181b4:     	movups	%xmm0, 0x6c8(%rbp)
1402181bb:     	movups	%xmm9, 0x6d8(%rbp)
1402181c3:     	movups	%xmm7, 0x6e8(%rbp)
1402181ca:     	movaps	0x56f2bce(%rip), %xmm15 # 0x14590ada0
1402181d2:     	movups	%xmm15, 0x6f8(%rbp)
1402181da:     	movups	%xmm15, 0x708(%rbp)
1402181e2:     	movb	$0x0, 0x756(%rbp)
1402181e9:     	movl	$0x0, 0x752(%rbp)
1402181f3:     	movq	$0x0, 0x738(%rbp)
1402181fe:     	movl	$0x3f800000, 0x740(%rbp) # imm = 0x3F800000
140218208:     	movups	%xmm10, 0x718(%rbp)
140218210:     	movl	$0x1, 0x728(%rbp)
14021821a:     	movq	$0x0, 0x72c(%rbp)
140218225:     	movb	$0x0, 0x757(%rbp)
14021822c:     	movups	0x5726c4d(%rip), %xmm6  # 0x14593ee80
140218233:     	movaps	%xmm6, 0x5e0(%rbp)
14021823a:     	movq	$0x0, 0x5f0(%rbp)
140218245:     	movups	0x5726c4b(%rip), %xmm8  # 0x14593ee98
14021824d:     	movups	%xmm8, 0x5f8(%rbp)
140218255:     	movq	$0x0, 0x608(%rbp)
140218260:     	movups	0x5726c49(%rip), %xmm0  # 0x14593eeb0
140218267:     	movaps	%xmm0, 0x610(%rbp)
14021826e:     	movq	$0x0, 0x620(%rbp)
140218279:     	movups	0x5726c47(%rip), %xmm9  # 0x14593eec8
140218281:     	movups	%xmm9, 0x628(%rbp)
140218289:     	movq	$0x0, 0x638(%rbp)
140218294:     	movw	$0x0, 0x74a(%rbp)
14021829d:     	movl	$0x10000, 0x746(%rbp)   # imm = 0x10000
1402182a7:     	movw	$0x0, 0x750(%rbp)
1402182b0:     	movl	$0x10000, 0x74c(%rbp)   # imm = 0x10000
1402182ba:     	movl	0x10(%rbx), %eax
1402182bd:     	movl	%eax, 0x190(%rbp)
1402182c3:     	movups	(%rbx), %xmm0
1402182c6:     	movaps	%xmm0, 0x180(%rbp)
1402182cd:     	movups	(%rbx), %xmm0
1402182d0:     	movaps	%xmm0, 0x1f0(%rbp)
1402182d7:     	movl	$0x3f333333, 0x200(%rbp) # imm = 0x3F333333
1402182e1:     	leaq	0x550(%rbp), %rcx
1402182e8:     	leaq	0x1f0(%rbp), %rdx
1402182ef:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1402182f4:     	nop
1402182f5:     	movaps	0x550(%rbp), %xmm0
1402182fc:     	movups	%xmm0, 0x304(%rbp)
140218303:     	movl	$0x1, 0x300(%rbp)
14021830d:     	movl	$0x41900000, 0x48(%rsp) # imm = 0x41900000
140218315:     	movl	$0x1, 0x40(%rsp)
14021831d:     	movl	$0x0, 0x38(%rsp)
140218325:     	movl	$0x1, 0x30(%rsp)
14021832d:     	movl	$0x0, 0x28(%rsp)
140218335:     	movl	$0x1, 0x20(%rsp)
14021833d:     	leaq	0x550(%rbp), %rcx
140218344:     	leaq	0x300(%rbp), %rdx
14021834b:     	xorps	%xmm3, %xmm3
14021834e:     	movl	$0x1, %r8d
140218354:     	callq	0x14264cf40 <.text+0x264bf40>
140218359:     	nop
14021835a:     	leaq	0x298(%rbp), %rbx
140218361:     	leaq	0x300(%rbp), %rsi
140218368:     	leaq	0x5e0(%rbp), %rdx
14021836f:     	movl	$0x180, %r8d            # imm = 0x180
140218375:     	movq	%rsi, %rcx
140218378:     	callq	0x145756ddd <.text+0x5755ddd>
14021837d:     	movaps	0x180(%rbp), %xmm0
140218384:     	movups	%xmm0, 0x480(%rbp)
14021838b:     	movl	0x190(%rbp), %eax
140218391:     	movl	%eax, 0x490(%rbp)
140218397:     	movups	0x550(%rbp), %xmm0
14021839e:     	movups	%xmm0, 0x498(%rbp)
1402183a5:     	movq	0x560(%rbp), %rax
1402183ac:     	movq	%rax, 0x4a8(%rbp)
1402183b3:     	leaq	0x5e8(%rbp), %rcx
1402183ba:     	movl	$0x1b0, %r8d            # imm = 0x1B0
1402183c0:     	movq	%rsi, %rdx
1402183c3:     	callq	0x145756ddd <.text+0x5755ddd>
1402183c8:     	movq	%r13, 0x5e0(%rbp)
1402183cf:     	movb	$0x0, 0x826(%rbp)
1402183d6:     	leaq	0x550(%rbp), %rcx
1402183dd:     	leaq	0x5e0(%rbp), %r8
1402183e4:     	movq	%rbx, %rdx
1402183e7:     	callq	0x1401e64c0 <.text+0x1e54c0>
1402183ec:     	nop
1402183ed:     	movq	0x8(%r15), %rdx
1402183f1:     	movq	0x10(%r15), %r8
1402183f5:     	movb	$0x0, 0x826(%rbp)
1402183fc:     	leaq	0x5e0(%rbp), %rcx
140218403:     	callq	0x1400c6cf0 <.text+0xc5cf0>
140218408:     	nop
140218409:     	movq	0x5f0(%rbp), %rax
140218410:     	movq	%rax, 0x310(%rbp)
140218417:     	movups	0x5e0(%rbp), %xmm0
14021841e:     	movaps	%xmm0, 0x300(%rbp)
140218425:     	movq	0x818(%rbp), %rax
14021842c:     	movq	(%rax), %rax
14021842f:     	cmpb	$0x1, (%rax)
140218432:     	jne	0x140218452 <.text+0x217452>
140218434:     	movl	0x1(%rax), %ecx
140218437:     	movl	0x4(%rax), %edx
14021843a:     	movl	%edx, 0x1f3(%rbp)
140218440:     	movl	%ecx, 0x1f0(%rbp)
140218446:     	movzbl	0x10(%rax), %ecx
14021844a:     	addq	$0x8, %rax
14021844e:     	movb	$0x1, %dl
140218450:     	jmp	0x140218466 <.text+0x217466>
140218452:     	movq	0x8(%rax), %rcx
140218456:     	lock
140218457:     	incq	(%rcx)
14021845a:     	jle	0x14021a34a <.text+0x21934a>
140218460:     	addq	$0x8, %rax
140218464:     	xorl	%edx, %edx
140218466:     	movq	(%rax), %rax
140218469:     	movq	$0x0, 0x5f8(%rbp)
140218474:     	movq	$0x4, 0x600(%rbp)
14021847f:     	movq	$0x0, 0x608(%rbp)
14021848a:     	movaps	0x300(%rbp), %xmm0
140218491:     	movaps	%xmm0, 0x5e0(%rbp)
140218498:     	movq	0x310(%rbp), %r8
14021849f:     	movq	%r8, 0x5f0(%rbp)
1402184a6:     	movb	%dl, 0x610(%rbp)
1402184ac:     	movl	0x1f0(%rbp), %edx
1402184b2:     	movl	0x1f3(%rbp), %r8d
1402184b9:     	movl	%edx, 0x611(%rbp)
1402184bf:     	movl	%r8d, 0x614(%rbp)
1402184c6:     	movq	%rax, 0x618(%rbp)
1402184cd:     	movq	%rcx, 0x620(%rbp)
1402184d4:     	movl	$0x41500000, 0x628(%rbp) # imm = 0x41500000
1402184de:     	movw	$0x190, 0x62c(%rbp)     # imm = 0x190
1402184e7:     	movb	$0x1, 0x62e(%rbp)
1402184ee:     	movups	0x5726c63(%rip), %xmm0  # 0x14593f158
1402184f5:     	movaps	%xmm0, 0x630(%rbp)
1402184fc:     	movl	$0x3f800000, 0x640(%rbp) # imm = 0x3F800000
140218506:     	movb	$0x0, 0x826(%rbp)
14021850d:     	leaq	0x550(%rbp), %rcx
140218514:     	leaq	0x5e0(%rbp), %rdx
14021851b:     	callq	0x1401fdd70 <.text+0x1fcd70>
140218520:     	nop
140218521:     	movq	0x818(%rbp), %rax
140218528:     	movq	(%rax), %rcx
14021852b:     	cmpb	$0x1, 0x18(%rcx)
14021852f:     	jne	0x14021854f <.text+0x21754f>
140218531:     	movl	0x19(%rcx), %eax
140218534:     	movl	0x1c(%rcx), %edx
140218537:     	movl	%edx, 0x303(%rbp)
14021853d:     	movl	%eax, 0x300(%rbp)
140218543:     	movq	0x20(%rcx), %rax
140218547:     	movzbl	0x28(%rcx), %edx
14021854b:     	movb	$0x1, %cl
14021854d:     	jmp	0x14021855f <.text+0x21755f>
14021854f:     	movq	0x20(%rcx), %rax
140218553:     	lock
140218554:     	incq	(%rax)
140218557:     	jle	0x14021a34a <.text+0x21934a>
14021855d:     	xorl	%ecx, %ecx
14021855f:     	movl	0x300(%rbp), %r8d
140218566:     	movl	0x303(%rbp), %r9d
14021856d:     	movl	%r9d, 0x61c(%rbp)
140218574:     	movl	%r8d, 0x619(%rbp)
14021857b:     	movups	0x57268ea(%rip), %xmm0  # 0x14593ee6c
140218582:     	movups	%xmm0, 0x551(%rbp)
140218589:     	movl	$0x3f800000, 0x561(%rbp) # imm = 0x3F800000
140218593:     	movq	0x538(%rbp), %r8
14021859a:     	movq	%r8, 0x5e8(%rbp)
1402185a1:     	movq	0x548(%rbp), %r8
1402185a8:     	movq	%r8, 0x5f0(%rbp)
1402185af:     	movq	%r14, 0x5f8(%rbp)
1402185b6:     	movq	$0x0, 0x600(%rbp)
1402185c1:     	movq	$0x4, 0x608(%rbp)
1402185cc:     	movq	$0x0, 0x610(%rbp)
1402185d7:     	movb	%cl, 0x618(%rbp)
1402185dd:     	movq	%rax, 0x620(%rbp)
1402185e4:     	movq	%rdx, 0x628(%rbp)
1402185eb:     	movl	$0x42780000, 0x630(%rbp) # imm = 0x42780000
1402185f5:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
1402185fe:     	movb	$0x1, 0x636(%rbp)
140218605:     	movq	0x55d(%rbp), %rax
14021860c:     	movq	%rax, 0x644(%rbp)
140218613:     	movups	0x550(%rbp), %xmm0
14021861a:     	movups	%xmm0, 0x637(%rbp)
140218621:     	movl	$0x0, 0x64c(%rbp)
14021862b:     	movaps	0x5725ece(%rip), %xmm0  # 0x14593e500
140218632:     	movups	%xmm0, 0x650(%rbp)
140218639:     	movsd	0x5725ecf(%rip), %xmm0  # 0x14593e510
140218641:     	movsd	%xmm0, 0x660(%rbp)
140218649:     	movq	%r13, 0x5e0(%rbp)
140218650:     	movb	$0x1, 0x826(%rbp)
140218657:     	leaq	0x300(%rbp), %rcx
14021865e:     	leaq	0x5e0(%rbp), %r8
140218665:     	movq	%rbx, %rdx
140218668:     	callq	0x1401e8b90 <.text+0x1e7b90>
14021866d:     	nop
14021866e:     	movq	0x8(%rdi), %rsi
140218672:     	testq	%rsi, %rsi
140218675:     	jns	0x140218692 <.text+0x217692>
140218677:     	xorl	%r15d, %r15d
14021867a:     	movb	$0x1, 0x826(%rbp)
140218681:     	movq	%r15, %rcx
140218684:     	movq	%rsi, %rdx
140218687:     	callq	0x1458e721b <.text+0x58e621b>
14021868c:     	nop
14021868d:     	jmp	0x14021a34a <.text+0x21934a>
140218692:     	movq	0x818(%rbp), %rax
140218699:     	movq	(%rax), %r12
14021869c:     	je	0x1402186fb <.text+0x2176fb>
14021869e:     	movq	(%rdi), %r14
1402186a1:     	callq	0x140002200 <.text+0x1200>
1402186a6:     	movl	$0x1, %r15d
1402186ac:     	movl	$0x1, %edx
1402186b1:     	movq	%rsi, %rcx
1402186b4:     	callq	0x1400021c0 <.text+0x11c0>
1402186b9:     	testq	%rax, %rax
1402186bc:     	je	0x14021867a <.text+0x21767a>
1402186be:     	movq	%rax, %rdi
1402186c1:     	movq	%rax, %rcx
1402186c4:     	movq	%r14, %rdx
1402186c7:     	movq	%rsi, %r8
1402186ca:     	callq	0x145756ddd <.text+0x5755ddd>
1402186cf:     	cmpb	$0x1, (%r12)
1402186d4:     	jne	0x140218707 <.text+0x217707>
1402186d6:     	movl	0x1(%r12), %eax
1402186db:     	movl	0x4(%r12), %ecx
1402186e0:     	movl	%ecx, 0x303(%rbp)
1402186e6:     	movl	%eax, 0x300(%rbp)
1402186ec:     	movq	0x8(%r12), %rax
1402186f1:     	movzbl	0x10(%r12), %edx
1402186f7:     	movb	$0x1, %cl
1402186f9:     	jmp	0x140218718 <.text+0x217718>
1402186fb:     	movl	$0x1, %edi
140218700:     	cmpb	$0x1, (%r12)
140218705:     	je	0x1402186d6 <.text+0x2176d6>
140218707:     	movq	0x8(%r12), %rax
14021870c:     	lock
14021870d:     	incq	(%rax)
140218710:     	jle	0x14021a34a <.text+0x21934a>
140218716:     	xorl	%ecx, %ecx
140218718:     	movl	0x300(%rbp), %r8d
14021871f:     	movl	0x303(%rbp), %r9d
140218726:     	movl	%r9d, 0x61c(%rbp)
14021872d:     	movl	%r8d, 0x619(%rbp)
140218734:     	movups	0x5726701(%rip), %xmm0  # 0x14593ee3c
14021873b:     	movups	%xmm0, 0x551(%rbp)
140218742:     	movl	$0x3f800000, 0x561(%rbp) # imm = 0x3F800000
14021874c:     	movq	%rsi, 0x5e8(%rbp)
140218753:     	movq	%rdi, 0x5f0(%rbp)
14021875a:     	movq	%rsi, 0x5f8(%rbp)
140218761:     	movq	$0x0, 0x600(%rbp)
14021876c:     	movq	$0x4, 0x608(%rbp)
140218777:     	movq	$0x0, 0x610(%rbp)
140218782:     	movb	%cl, 0x618(%rbp)
140218788:     	movq	%rax, 0x620(%rbp)
14021878f:     	movq	%rdx, 0x628(%rbp)
140218796:     	movl	$0x41800000, 0x630(%rbp) # imm = 0x41800000
1402187a0:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
1402187a9:     	movb	$0x1, 0x636(%rbp)
1402187b0:     	movq	0x55d(%rbp), %rax
1402187b7:     	movq	%rax, 0x644(%rbp)
1402187be:     	movups	0x550(%rbp), %xmm0
1402187c5:     	movups	%xmm0, 0x637(%rbp)
1402187cc:     	movl	0x56e510a(%rip), %eax   # 0x1458fd8dc
1402187d2:     	movl	%eax, 0x65c(%rbp)
1402187d8:     	movups	0x56e50ed(%rip), %xmm0  # 0x1458fd8cc
1402187df:     	movups	%xmm0, 0x64c(%rbp)
1402187e6:     	movsd	0x56e0722(%rip), %xmm0  # 0x1458f8f10
1402187ee:     	movsd	%xmm0, 0x660(%rbp)
1402187f6:     	movq	%r13, 0x5e0(%rbp)
1402187fd:     	movb	$0x1, 0x826(%rbp)
140218804:     	leaq	0x300(%rbp), %rcx
14021880b:     	leaq	0x5e0(%rbp), %r8
140218812:     	movq	%rbx, %rdx
140218815:     	callq	0x1401e8b90 <.text+0x1e7b90>
14021881a:     	nop
14021881b:     	xorps	%xmm0, %xmm0
14021881e:     	movaps	%xmm0, 0x3a0(%rbp)
140218825:     	movaps	%xmm0, 0x390(%rbp)
14021882c:     	movaps	%xmm0, 0x380(%rbp)
140218833:     	movaps	%xmm0, 0x370(%rbp)
14021883a:     	movaps	%xmm0, 0x360(%rbp)
140218841:     	movq	$0x0, 0x3b0(%rbp)
14021884c:     	movups	%xmm11, 0x3b8(%rbp)
140218854:     	movups	%xmm12, 0x3c8(%rbp)
14021885c:     	movups	0x57266f5(%rip), %xmm0  # 0x14593ef58
140218863:     	movups	%xmm0, 0x3d8(%rbp)
14021886a:     	movups	%xmm13, 0x3e8(%rbp)
140218872:     	movups	%xmm14, 0x3f8(%rbp)
14021887a:     	movups	%xmm7, 0x408(%rbp)
140218881:     	movups	0x5726720(%rip), %xmm1  # 0x14593efa8
140218888:     	movups	%xmm1, 0x428(%rbp)
14021888f:     	movups	0x5726702(%rip), %xmm1  # 0x14593ef98
140218896:     	movups	%xmm1, 0x418(%rbp)
14021889d:     	movaps	%xmm6, 0x300(%rbp)
1402188a4:     	movaps	%xmm0, %xmm6
1402188a7:     	movq	$0x0, 0x310(%rbp)
1402188b2:     	movups	%xmm8, 0x318(%rbp)
1402188ba:     	movq	$0x0, 0x328(%rbp)
1402188c5:     	movups	0x57265e4(%rip), %xmm0  # 0x14593eeb0
1402188cc:     	movaps	%xmm0, 0x330(%rbp)
1402188d3:     	movq	$0x0, 0x340(%rbp)
1402188de:     	movups	%xmm9, 0x348(%rbp)
1402188e6:     	movq	$0x0, 0x358(%rbp)
1402188f1:     	leaq	0x5e8(%rbp), %rcx
1402188f8:     	leaq	0x300(%rbp), %rdx
1402188ff:     	movl	$0x138, %r8d            # imm = 0x138
140218905:     	callq	0x145756ddd <.text+0x5755ddd>
14021890a:     	movups	%xmm10, 0x720(%rbp)
140218912:     	movl	$0x1, 0x730(%rbp)
14021891c:     	movss	0x5725bfc(%rip), %xmm0  # 0x14593e520
140218924:     	movlps	%xmm0, 0x734(%rbp)
14021892b:     	movb	$0x1, 0x73c(%rbp)
140218932:     	movq	$0x0, 0x740(%rbp)
14021893d:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
140218947:     	movw	$0x0, 0x74c(%rbp)
140218950:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
14021895a:     	movw	$0x0, 0x752(%rbp)
140218963:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
14021896d:     	movw	$0x0, 0x758(%rbp)
140218976:     	movq	$0x0, 0x75a(%rbp)
140218981:     	movl	$0x7, 0x762(%rbp)
14021898b:     	movq	0x238(%rbp), %rax
140218992:     	movq	%rax, 0x5e0(%rbp)
140218999:     	movb	$0x1, 0x827(%rbp)
1402189a0:     	leaq	0x240(%rbp), %rcx
1402189a7:     	leaq	0x5e0(%rbp), %r8
1402189ae:     	leaq	0xf8(%rbp), %rdx
1402189b5:     	callq	0x1401e3e60 <.text+0x1e2e60>
1402189ba:     	nop
1402189bb:     	movq	0x240(%rbp), %rbx
1402189c2:     	movq	0x268(%rbp), %rax
1402189c9:     	movq	%rbx, 0x290(%rbp)
1402189d0:     	movups	0x248(%rbp), %xmm0
1402189d7:     	movups	%xmm0, 0x298(%rbp)
1402189de:     	movups	0x258(%rbp), %xmm0
1402189e5:     	movups	%xmm0, 0x2a8(%rbp)
1402189ec:     	movq	%rax, 0x2b8(%rbp)
1402189f3:     	movq	0x158(%rbp), %rax
1402189fa:     	movq	0x10(%rax), %r13
1402189fe:     	testq	%r13, %r13
140218a01:     	je	0x140218c76 <.text+0x217c76>
140218a07:     	movq	0x8(%rax), %r14
140218a0b:     	shlq	$0x5, %r13
140218a0f:     	addq	%r14, %r13
140218a12:     	leaq	0x3b8(%rbp), %rdi
140218a19:     	leaq	0x5e8(%rbp), %r15
140218a20:     	xorl	%r12d, %r12d
140218a23:     	xorps	%xmm8, %xmm8
140218a27:     	movaps	0x56e0501(%rip), %xmm9  # 0x1458f8f30
140218a2f:     	leaq	0x5e0(%rbp), %rsi
140218a36:     	jmp	0x140218a50 <.text+0x217a50>
140218a38:     	nopl	(%rax,%rax)
140218a40:     	addq	$0x20, %r14
140218a44:     	incq	%r12
140218a47:     	cmpq	%r13, %r14
140218a4a:     	je	0x140218c76 <.text+0x217c76>
140218a50:     	movups	%xmm8, -0x18(%rdi)
140218a55:     	movups	%xmm8, -0x28(%rdi)
140218a5a:     	movups	%xmm8, -0x38(%rdi)
140218a5f:     	movups	%xmm8, -0x48(%rdi)
140218a64:     	movups	%xmm8, -0x58(%rdi)
140218a69:     	movq	$0x0, -0x8(%rdi)
140218a71:     	movups	%xmm12, 0x10(%rdi)
140218a76:     	movups	%xmm11, (%rdi)
140218a7a:     	movups	%xmm13, 0x30(%rdi)
140218a7f:     	movups	%xmm6, 0x20(%rdi)
140218a83:     	movups	%xmm7, 0x50(%rdi)
140218a87:     	movups	%xmm14, 0x40(%rdi)
140218a8c:     	movups	0x5726515(%rip), %xmm0  # 0x14593efa8
140218a93:     	movups	%xmm0, 0x70(%rdi)
140218a97:     	movups	0x57264fa(%rip), %xmm0  # 0x14593ef98
140218a9e:     	movups	%xmm0, 0x60(%rdi)
140218aa2:     	movups	0x57263d7(%rip), %xmm0  # 0x14593ee80
140218aa9:     	movaps	%xmm0, 0x300(%rbp)
140218ab0:     	movq	$0x0, 0x310(%rbp)
140218abb:     	movups	0x57263d6(%rip), %xmm0  # 0x14593ee98
140218ac2:     	movups	%xmm0, -0xa0(%rdi)
140218ac9:     	movq	$0x0, -0x90(%rdi)
140218ad4:     	movups	0x57263d5(%rip), %xmm0  # 0x14593eeb0
140218adb:     	movups	%xmm0, -0x88(%rdi)
140218ae2:     	movq	$0x0, -0x78(%rdi)
140218aea:     	movups	0x57263d7(%rip), %xmm0  # 0x14593eec8
140218af1:     	movups	%xmm0, -0x70(%rdi)
140218af5:     	movq	$0x0, -0x60(%rdi)
140218afd:     	movl	$0x138, %r8d            # imm = 0x138
140218b03:     	movq	%r15, %rcx
140218b06:     	leaq	0x300(%rbp), %rdx
140218b0d:     	callq	0x145756ddd <.text+0x5755ddd>
140218b12:     	movups	%xmm9, 0x720(%rbp)
140218b1a:     	movl	$0x1, 0x730(%rbp)
140218b24:     	movq	$0x0, 0x734(%rbp)
140218b2f:     	movb	$0x1, 0x73c(%rbp)
140218b36:     	movq	$0x0, 0x740(%rbp)
140218b41:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
140218b4b:     	movw	$0x0, 0x74c(%rbp)
140218b54:     	movl	$0x10000, 0x166(%r15)   # imm = 0x10000
140218b5f:     	movw	$0x0, 0x16a(%r15)
140218b69:     	movw	$0x0, 0x170(%r15)
140218b73:     	movl	$0x10000, 0x16c(%r15)   # imm = 0x10000
140218b7e:     	movl	$0x0, 0x75a(%rbp)
140218b88:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
140218b92:     	movq	%rax, 0x75e(%rbp)
140218b99:     	movq	%rbx, 0x5e0(%rbp)
140218ba0:     	movb	$0x1, 0x827(%rbp)
140218ba7:     	leaq	0x550(%rbp), %rcx
140218bae:     	leaq	0x298(%rbp), %rdx
140218bb5:     	movq	%rsi, %r8
140218bb8:     	callq	0x1401e3e60 <.text+0x1e2e60>
140218bbd:     	nop
140218bbe:     	movq	0x550(%rbp), %rax
140218bc5:     	movq	0x578(%rbp), %rcx
140218bcc:     	movq	%rax, 0x5e0(%rbp)
140218bd3:     	movups	0x558(%rbp), %xmm0
140218bda:     	movups	%xmm0, 0x5e8(%rbp)
140218be1:     	movups	0x568(%rbp), %xmm0
140218be8:     	movups	%xmm0, 0x5f8(%rbp)
140218bef:     	movq	%rcx, 0x608(%rbp)
140218bf6:     	movq	0x818(%rbp), %rax
140218bfd:     	movq	(%rax), %rdx
140218c00:     	movq	0x228(%rbp), %rax
140218c07:     	movq	(%rax), %r8
140218c0a:     	movq	0x230(%rbp), %rax
140218c11:     	movq	(%rax), %r9
140218c14:     	movb	$0x1, 0x827(%rbp)
140218c1b:     	movq	%r14, 0x28(%rsp)
140218c20:     	movq	%r12, 0x20(%rsp)
140218c25:     	movq	%rsi, %rcx
140218c28:     	callq	0x1400c1d40 <.text+0xc0d40>
140218c2d:     	nop
140218c2e:     	movq	0x150(%rbp), %rax
140218c35:     	cmpb	$0x1, (%rax)
140218c38:     	jne	0x140218a40 <.text+0x217a40>
140218c3e:     	movq	0x818(%rbp), %rax
140218c45:     	movq	(%rax), %rdx
140218c48:     	movq	0x2f8(%rbp), %rax
140218c4f:     	movq	(%rax), %rax
140218c52:     	movq	0x38(%rax), %rax
140218c56:     	movb	$0x1, 0x827(%rbp)
140218c5d:     	movq	%rax, 0x20(%rsp)
140218c62:     	movq	%rsi, %rcx
140218c65:     	movq	%r12, %r8
140218c68:     	movq	%r14, %r9
140218c6b:     	callq	0x1400c1500 <.text+0xc0500>
140218c70:     	nop
140218c71:     	jmp	0x140218a40 <.text+0x217a40>
140218c76:     	xorps	%xmm0, %xmm0
140218c79:     	movaps	%xmm0, 0x3a0(%rbp)
140218c80:     	movaps	%xmm0, 0x390(%rbp)
140218c87:     	movaps	%xmm0, 0x380(%rbp)
140218c8e:     	movaps	%xmm0, 0x370(%rbp)
140218c95:     	movaps	%xmm0, 0x360(%rbp)
140218c9c:     	movq	$0x0, 0x3b0(%rbp)
140218ca7:     	movups	%xmm11, 0x3b8(%rbp)
140218caf:     	movups	%xmm12, 0x3c8(%rbp)
140218cb7:     	movups	%xmm6, 0x3d8(%rbp)
140218cbe:     	movups	%xmm13, 0x3e8(%rbp)
140218cc6:     	movups	%xmm14, 0x3f8(%rbp)
140218cce:     	movups	%xmm7, 0x408(%rbp)
140218cd5:     	movups	0x57262cc(%rip), %xmm0  # 0x14593efa8
140218cdc:     	movups	%xmm0, 0x428(%rbp)
140218ce3:     	movups	0x57262ae(%rip), %xmm0  # 0x14593ef98
140218cea:     	movups	%xmm0, 0x418(%rbp)
140218cf1:     	movups	0x5726188(%rip), %xmm0  # 0x14593ee80
140218cf8:     	movaps	%xmm0, 0x300(%rbp)
140218cff:     	movq	$0x0, 0x310(%rbp)
140218d0a:     	movups	0x5726187(%rip), %xmm0  # 0x14593ee98
140218d11:     	movups	%xmm0, 0x318(%rbp)
140218d18:     	movq	$0x0, 0x328(%rbp)
140218d23:     	movups	0x5726186(%rip), %xmm0  # 0x14593eeb0
140218d2a:     	movaps	%xmm0, 0x330(%rbp)
140218d31:     	movq	$0x0, 0x340(%rbp)
140218d3c:     	movups	0x5726185(%rip), %xmm0  # 0x14593eec8
140218d43:     	movups	%xmm0, 0x348(%rbp)
140218d4a:     	movq	$0x0, 0x358(%rbp)
140218d55:     	leaq	0x5e8(%rbp), %rcx
140218d5c:     	leaq	0x300(%rbp), %rdx
140218d63:     	movl	$0x138, %r8d            # imm = 0x138
140218d69:     	callq	0x145756ddd <.text+0x5755ddd>
140218d6e:     	movups	%xmm10, 0x720(%rbp)
140218d76:     	movl	$0x1, 0x730(%rbp)
140218d80:     	movss	0x56e0218(%rip), %xmm0  # 0x1458f8fa0
140218d88:     	movlps	%xmm0, 0x734(%rbp)
140218d8f:     	movb	$0x1, 0x73c(%rbp)
140218d96:     	movq	$0x0, 0x740(%rbp)
140218da1:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
140218dab:     	movw	$0x0, 0x74c(%rbp)
140218db4:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
140218dbe:     	movw	$0x0, 0x752(%rbp)
140218dc7:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
140218dd1:     	movw	$0x0, 0x758(%rbp)
140218dda:     	movq	$0x0, 0x75a(%rbp)
140218de5:     	movl	$0x5, 0x762(%rbp)
140218def:     	movq	0x238(%rbp), %rax
140218df6:     	movq	%rax, 0x5e0(%rbp)
140218dfd:     	movb	$0x1, 0x827(%rbp)
140218e04:     	leaq	-0x30(%rbp), %rcx
140218e08:     	leaq	0x5e0(%rbp), %r8
140218e0f:     	leaq	0xf8(%rbp), %rdx
140218e16:     	callq	0x1401e3e60 <.text+0x1e2e60>
140218e1b:     	nop
140218e1c:     	movq	-0x30(%rbp), %rax
140218e20:     	movq	-0x8(%rbp), %rcx
140218e24:     	movq	%rax, 0x120(%rbp)
140218e2b:     	movups	-0x28(%rbp), %xmm0
140218e2f:     	movups	%xmm0, 0x128(%rbp)
140218e36:     	movups	-0x18(%rbp), %xmm0
140218e3a:     	movups	%xmm0, 0x138(%rbp)
140218e41:     	movq	%rcx, 0x148(%rbp)
140218e48:     	movq	0x818(%rbp), %rax
140218e4f:     	movq	(%rax), %rdx
140218e52:     	movq	0x228(%rbp), %rax
140218e59:     	movq	(%rax), %r8
140218e5c:     	movq	0x230(%rbp), %rax
140218e63:     	movq	(%rax), %r9
140218e66:     	movb	$0x1, 0x827(%rbp)
140218e6d:     	movq	0x168(%rbp), %rax
140218e74:     	movq	%rax, 0x28(%rsp)
140218e79:     	movq	0x160(%rbp), %rax
140218e80:     	movq	%rax, 0x20(%rsp)
140218e85:     	leaq	0x120(%rbp), %rcx
140218e8c:     	callq	0x1400c61a0 <.text+0xc51a0>
140218e91:     	nop
140218e92:     	leaq	0x128(%rbp), %rdi
140218e99:     	movq	0x170(%rbp), %rax
140218ea0:     	cmpl	$0x1, (%rax)
140218ea3:     	jne	0x14021948f <.text+0x21848f>
140218ea9:     	movq	0x8(%rax), %rax
140218ead:     	movq	%rax, 0xc0(%rbp)
140218eb4:     	movw	$0x0, 0x464(%rbp)
140218ebd:     	movb	$0x1, 0x454(%rbp)
140218ec4:     	xorps	%xmm0, %xmm0
140218ec7:     	movaps	%xmm0, 0x360(%rbp)
140218ece:     	movaps	%xmm0, 0x370(%rbp)
140218ed5:     	movaps	%xmm0, 0x380(%rbp)
140218edc:     	movaps	%xmm0, 0x390(%rbp)
140218ee3:     	movaps	%xmm0, 0x3a0(%rbp)
140218eea:     	movq	$0x0, 0x3b0(%rbp)
140218ef5:     	movl	$0x5, 0x47a(%rbp)
140218eff:     	movups	%xmm11, 0x3b8(%rbp)
140218f07:     	movups	%xmm12, 0x3c8(%rbp)
140218f0f:     	movaps	0x56dffea(%rip), %xmm0  # 0x1458f8f00
140218f16:     	movups	%xmm0, 0x3d8(%rbp)
140218f1d:     	movaps	0x56dfe7c(%rip), %xmm0  # 0x1458f8da0
140218f24:     	movups	%xmm0, 0x3e8(%rbp)
140218f2b:     	movaps	0x56d23be(%rip), %xmm0  # 0x1458eb2f0
140218f32:     	movups	%xmm0, 0x3f8(%rbp)
140218f39:     	movups	%xmm0, 0x408(%rbp)
140218f40:     	movaps	0x56d23b9(%rip), %xmm0  # 0x1458eb300
140218f47:     	movups	%xmm0, 0x418(%rbp)
140218f4e:     	movups	%xmm0, 0x428(%rbp)
140218f55:     	movq	$0x0, 0x458(%rbp)
140218f60:     	movl	$0x3f800000, 0x460(%rbp) # imm = 0x3F800000
140218f6a:     	movups	%xmm10, 0x438(%rbp)
140218f72:     	movl	$0x1, 0x448(%rbp)
140218f7c:     	movq	$0x0, 0x44c(%rbp)
140218f87:     	movq	$0x0, 0x472(%rbp)
140218f92:     	movups	0x5725ee7(%rip), %xmm0  # 0x14593ee80
140218f99:     	movaps	%xmm0, 0x300(%rbp)
140218fa0:     	movq	$0x0, 0x310(%rbp)
140218fab:     	movups	0x5725ee6(%rip), %xmm0  # 0x14593ee98
140218fb2:     	movups	%xmm0, 0x318(%rbp)
140218fb9:     	movq	$0x0, 0x328(%rbp)
140218fc4:     	movups	0x5725ee5(%rip), %xmm0  # 0x14593eeb0
140218fcb:     	movaps	%xmm0, 0x330(%rbp)
140218fd2:     	movq	$0x0, 0x340(%rbp)
140218fdd:     	movups	0x5725ee4(%rip), %xmm0  # 0x14593eec8
140218fe4:     	movups	%xmm0, 0x348(%rbp)
140218feb:     	movq	$0x0, 0x358(%rbp)
140218ff6:     	movw	$0x0, 0x46a(%rbp)
140218fff:     	movl	$0x10000, 0x466(%rbp)   # imm = 0x10000
140219009:     	movw	$0x0, 0x470(%rbp)
140219012:     	movl	$0x10000, 0x46c(%rbp)   # imm = 0x10000
14021901c:     	leaq	0x290(%rbp), %rcx
140219023:     	callq	0x1400c7a20 <.text+0xc6a20>
140219028:     	nop
140219029:     	leaq	0x5e8(%rbp), %rcx
140219030:     	leaq	0x300(%rbp), %rsi
140219037:     	movl	$0x180, %r8d            # imm = 0x180
14021903d:     	movq	%rsi, %rdx
140219040:     	callq	0x145756ddd <.text+0x5755ddd>
140219045:     	movq	0x2f0(%rbp), %rax
14021904c:     	movq	%rax, 0x5b7(%rbp)
140219053:     	movups	0x2e0(%rbp), %xmm0
14021905a:     	movups	%xmm0, 0x5a7(%rbp)
140219061:     	movups	0x2d0(%rbp), %xmm0
140219068:     	movups	%xmm0, 0x597(%rbp)
14021906f:     	movups	0x290(%rbp), %xmm0
140219076:     	movups	0x2a0(%rbp), %xmm1
14021907d:     	movups	0x2b0(%rbp), %xmm2
140219084:     	movups	0x2c0(%rbp), %xmm3
14021908b:     	movups	%xmm3, 0x587(%rbp)
140219092:     	movups	%xmm2, 0x577(%rbp)
140219099:     	movups	%xmm1, 0x567(%rbp)
1402190a0:     	movups	%xmm0, 0x557(%rbp)
1402190a7:     	movq	0x120(%rbp), %rax
1402190ae:     	movb	$0x2, 0x768(%rbp)
1402190b5:     	movq	0x5af(%rbp), %rcx
1402190bc:     	movq	%rcx, 0x7c8(%rbp)
1402190c3:     	movq	0x5b7(%rbp), %rcx
1402190ca:     	movq	%rcx, 0x7d0(%rbp)
1402190d1:     	movups	0x5a0(%rbp), %xmm0
1402190d8:     	movups	%xmm0, 0x7b9(%rbp)
1402190df:     	movups	0x590(%rbp), %xmm0
1402190e6:     	movups	%xmm0, 0x7a9(%rbp)
1402190ed:     	movups	0x580(%rbp), %xmm0
1402190f4:     	movups	%xmm0, 0x799(%rbp)
1402190fb:     	movups	0x570(%rbp), %xmm0
140219102:     	movups	%xmm0, 0x789(%rbp)
140219109:     	movups	0x560(%rbp), %xmm0
140219110:     	movups	%xmm0, 0x779(%rbp)
140219117:     	movups	0x550(%rbp), %xmm0
14021911e:     	movups	%xmm0, 0x769(%rbp)
140219125:     	movq	%rax, 0x5e0(%rbp)
14021912c:     	movb	$0x1, 0x827(%rbp)
140219133:     	leaq	0x290(%rbp), %rcx
14021913a:     	leaq	0x5e0(%rbp), %r8
140219141:     	movq	%rdi, %rdx
140219144:     	callq	0x1401eb8a0 <.text+0x1ea8a0>
140219149:     	nop
14021914a:     	movq	0x818(%rbp), %rax
140219151:     	movq	(%rax), %rbx
140219154:     	movq	0x290(%rbp), %r14
14021915b:     	movq	0x2b8(%rbp), %rax
140219162:     	movq	%r14, 0x550(%rbp)
140219169:     	movups	0x298(%rbp), %xmm0
140219170:     	movups	%xmm0, 0x558(%rbp)
140219177:     	movups	0x2a8(%rbp), %xmm0
14021917e:     	movups	%xmm0, 0x568(%rbp)
140219185:     	movq	%rax, 0x578(%rbp)
14021918c:     	movb	$0x1, 0x827(%rbp)
140219193:     	leaq	0x5725c56(%rip), %rcx   # 0x14593edf0
14021919a:     	movl	$0x4, %edx
14021919f:     	callq	0x145452350 <.text+0x5451350>
1402191a4:     	nop
1402191a5:     	movq	%rax, 0x300(%rbp)
1402191ac:     	movq	%rdx, 0x308(%rbp)
1402191b3:     	movq	%rsi, 0x5e0(%rbp)
1402191ba:     	leaq	-0x217101(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
1402191c1:     	movq	%rax, 0x5e8(%rbp)
1402191c8:     	movb	$0x1, 0x827(%rbp)
1402191cf:     	leaq	0x5725c1e(%rip), %rdx   # 0x14593edf4
1402191d6:     	leaq	0x180(%rbp), %rcx
1402191dd:     	leaq	0x5e0(%rbp), %r8
1402191e4:     	callq	0x14570bf80 <.text+0x570af80>
1402191e9:     	nop
1402191ea:     	cmpb	$0x1, (%rbx)
1402191ed:     	jne	0x14021920e <.text+0x21820e>
1402191ef:     	movl	0x1(%rbx), %eax
1402191f2:     	movl	0x4(%rbx), %ecx
1402191f5:     	movl	%ecx, 0x303(%rbp)
1402191fb:     	movl	%eax, 0x300(%rbp)
140219201:     	movq	0x8(%rbx), %rax
140219205:     	movzbl	0x10(%rbx), %r8d
14021920a:     	movb	$0x1, %cl
14021920c:     	jmp	0x14021921e <.text+0x21821e>
14021920e:     	movq	0x8(%rbx), %rax
140219212:     	lock
140219213:     	incq	(%rax)
140219216:     	jle	0x14021a34a <.text+0x21934a>
14021921c:     	xorl	%ecx, %ecx
14021921e:     	leaq	0x558(%rbp), %rdx
140219225:     	movq	0x190(%rbp), %r9
14021922c:     	movq	%r9, 0x5f8(%rbp)
140219233:     	movups	0x180(%rbp), %xmm0
14021923a:     	movups	%xmm0, 0x5e8(%rbp)
140219241:     	movl	0x300(%rbp), %r9d
140219248:     	movl	0x303(%rbp), %r10d
14021924f:     	movl	%r9d, 0x619(%rbp)
140219256:     	movl	%r10d, 0x61c(%rbp)
14021925d:     	movups	0x5725b94(%rip), %xmm0  # 0x14593edf8
140219264:     	movups	%xmm0, 0x241(%rbp)
14021926b:     	movl	$0x3f800000, 0x251(%rbp) # imm = 0x3F800000
140219275:     	movq	$0x0, 0x600(%rbp)
140219280:     	movq	$0x4, 0x608(%rbp)
14021928b:     	movq	$0x0, 0x610(%rbp)
140219296:     	movb	%cl, 0x618(%rbp)
14021929c:     	movq	%rax, 0x620(%rbp)
1402192a3:     	movq	%r8, 0x628(%rbp)
1402192aa:     	movl	$0x41880000, 0x630(%rbp) # imm = 0x41880000
1402192b4:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
1402192bd:     	movb	$0x1, 0x636(%rbp)
1402192c4:     	movq	0x24d(%rbp), %rax
1402192cb:     	movq	%rax, 0x644(%rbp)
1402192d2:     	movups	0x240(%rbp), %xmm0
1402192d9:     	movups	%xmm0, 0x637(%rbp)
1402192e0:     	movl	0x56e45f6(%rip), %eax   # 0x1458fd8dc
1402192e6:     	movl	%eax, 0x65c(%rbp)
1402192ec:     	movups	0x56e45d9(%rip), %xmm0  # 0x1458fd8cc
1402192f3:     	movups	%xmm0, 0x64c(%rbp)
1402192fa:     	movsd	0x56dfc0e(%rip), %xmm0  # 0x1458f8f10
140219302:     	movsd	%xmm0, 0x660(%rbp)
14021930a:     	movq	%r14, 0x5e0(%rbp)
140219311:     	movb	$0x1, 0x827(%rbp)
140219318:     	leaq	0x300(%rbp), %rcx
14021931f:     	leaq	0x5e0(%rbp), %r8
140219326:     	callq	0x1401e8b90 <.text+0x1e7b90>
14021932b:     	nop
14021932c:     	movb	$0x1, 0x827(%rbp)
140219333:     	leaq	0x5725ad2(%rip), %rcx   # 0x14593ee0c
14021933a:     	movl	$0x9, %edx
14021933f:     	callq	0x145452350 <.text+0x5451350>
140219344:     	nop
140219345:     	movq	%rdx, %r8
140219348:     	leaq	0x5725ae9(%rip), %rcx   # 0x14593ee38
14021934f:     	movq	%rcx, 0x240(%rbp)
140219356:     	movq	$0x1, 0x248(%rbp)
140219361:     	leaq	0xc0(%rbp), %rcx
140219368:     	movq	%rcx, 0x250(%rbp)
14021936f:     	leaq	0x5725aa2(%rip), %rcx   # 0x14593ee18
140219376:     	movq	%rcx, 0x258(%rbp)
14021937d:     	movb	$0x1, 0x827(%rbp)
140219384:     	movq	$0x1, 0x20(%rsp)
14021938d:     	leaq	0x1f0(%rbp), %rcx
140219394:     	leaq	0x240(%rbp), %r9
14021939b:     	movq	%rax, %rdx
14021939e:     	callq	0x145452790 <.text+0x5451790>
1402193a3:     	nop
1402193a4:     	cmpb	$0x1, (%rbx)
1402193a7:     	jne	0x1402193c7 <.text+0x2183c7>
1402193a9:     	movl	0x1(%rbx), %eax
1402193ac:     	movl	0x4(%rbx), %ecx
1402193af:     	movl	%ecx, 0x1bb(%rbp)
1402193b5:     	movl	%eax, 0x1b8(%rbp)
1402193bb:     	movq	0x8(%rbx), %rax
1402193bf:     	movzbl	0x10(%rbx), %ecx
1402193c3:     	movb	$0x1, %dl
1402193c5:     	jmp	0x1402193d7 <.text+0x2183d7>
1402193c7:     	movq	0x8(%rbx), %rax
1402193cb:     	lock
1402193cc:     	incq	(%rax)
1402193cf:     	jle	0x14021a34a <.text+0x21934a>
1402193d5:     	xorl	%edx, %edx
1402193d7:     	movq	0x200(%rbp), %r8
1402193de:     	movq	%r8, 0x5f0(%rbp)
1402193e5:     	movups	0x1f0(%rbp), %xmm0
1402193ec:     	movaps	%xmm0, 0x5e0(%rbp)
1402193f3:     	movq	$0x0, 0x5f8(%rbp)
1402193fe:     	movq	$0x4, 0x600(%rbp)
140219409:     	movq	$0x0, 0x608(%rbp)
140219414:     	movb	%dl, 0x610(%rbp)
14021941a:     	movl	0x1b8(%rbp), %edx
140219420:     	movl	0x1bb(%rbp), %r8d
140219427:     	movl	%edx, 0x611(%rbp)
14021942d:     	movl	%r8d, 0x614(%rbp)
140219434:     	movq	%rax, 0x618(%rbp)
14021943b:     	movq	%rcx, 0x620(%rbp)
140219442:     	movl	$0x41600000, 0x628(%rbp) # imm = 0x41600000
14021944c:     	movw	$0x190, 0x62c(%rbp)     # imm = 0x190
140219455:     	movb	$0x1, 0x62e(%rbp)
14021945c:     	movups	0x57259d9(%rip), %xmm0  # 0x14593ee3c
140219463:     	movaps	%xmm0, 0x630(%rbp)
14021946a:     	movl	$0x3f800000, 0x640(%rbp) # imm = 0x3F800000
140219474:     	movb	$0x1, 0x827(%rbp)
14021947b:     	leaq	0x300(%rbp), %rcx
140219482:     	leaq	0x5e0(%rbp), %rdx
140219489:     	callq	0x1401fdab0 <.text+0x1fcab0>
14021948e:     	nop
14021948f:     	movq	0x2f8(%rbp), %rax
140219496:     	movq	(%rax), %rax
140219499:     	cmpb	$0x0, 0x48(%rax)
14021949d:     	movups	0x57259f4(%rip), %xmm1  # 0x14593ee98
1402194a4:     	movups	0x5725a1d(%rip), %xmm2  # 0x14593eec8
1402194ab:     	je	0x1402194c3 <.text+0x2184c3>
1402194ad:     	movb	$0x1, %bl
1402194af:     	cmpq	$0x0, 0x20(%rax)
1402194b4:     	jne	0x1402194c5 <.text+0x2184c5>
1402194b6:     	movq	0x30(%rax), %rcx
1402194ba:     	cmpq	0x28(%rax), %rcx
1402194be:     	setae	%bl
1402194c1:     	jmp	0x1402194c5 <.text+0x2184c5>
1402194c3:     	xorl	%ebx, %ebx
1402194c5:     	movw	$0x0, 0x464(%rbp)
1402194ce:     	movb	$0x1, 0x454(%rbp)
1402194d5:     	xorps	%xmm0, %xmm0
1402194d8:     	movaps	%xmm0, 0x360(%rbp)
1402194df:     	movaps	%xmm0, 0x370(%rbp)
1402194e6:     	movaps	%xmm0, 0x380(%rbp)
1402194ed:     	movaps	%xmm0, 0x390(%rbp)
1402194f4:     	movaps	%xmm0, 0x3a0(%rbp)
1402194fb:     	movq	$0x0, 0x3b0(%rbp)
140219506:     	movl	$0x5, 0x47a(%rbp)
140219510:     	movups	%xmm11, 0x3b8(%rbp)
140219518:     	movups	%xmm12, 0x3c8(%rbp)
140219520:     	movaps	0x56df9d9(%rip), %xmm0  # 0x1458f8f00
140219527:     	movups	%xmm0, 0x3d8(%rbp)
14021952e:     	movaps	0x56df86b(%rip), %xmm0  # 0x1458f8da0
140219535:     	movups	%xmm0, 0x3e8(%rbp)
14021953c:     	movaps	0x56d1dad(%rip), %xmm6  # 0x1458eb2f0
140219543:     	movups	%xmm6, 0x3f8(%rbp)
14021954a:     	movups	%xmm6, 0x408(%rbp)
140219551:     	movaps	0x56d1da8(%rip), %xmm0  # 0x1458eb300
140219558:     	movups	%xmm0, 0x418(%rbp)
14021955f:     	movups	%xmm0, 0x428(%rbp)
140219566:     	movq	$0x0, 0x458(%rbp)
140219571:     	movl	$0x3f800000, 0x460(%rbp) # imm = 0x3F800000
14021957b:     	movups	%xmm10, 0x438(%rbp)
140219583:     	movl	$0x1, 0x448(%rbp)
14021958d:     	movss	0x56df86b(%rip), %xmm0  # 0x1458f8e00
140219595:     	movlps	%xmm0, 0x44c(%rbp)
14021959c:     	movq	$0x0, 0x472(%rbp)
1402195a7:     	movups	0x57258d2(%rip), %xmm0  # 0x14593ee80
1402195ae:     	movaps	%xmm0, 0x300(%rbp)
1402195b5:     	movq	$0x0, 0x310(%rbp)
1402195c0:     	movups	%xmm1, 0x318(%rbp)
1402195c7:     	movq	$0x0, 0x328(%rbp)
1402195d2:     	movups	0x57258d7(%rip), %xmm0  # 0x14593eeb0
1402195d9:     	movaps	%xmm0, 0x330(%rbp)
1402195e0:     	movq	$0x0, 0x340(%rbp)
1402195eb:     	movups	%xmm2, 0x348(%rbp)
1402195f2:     	movq	$0x0, 0x358(%rbp)
1402195fd:     	movw	$0x0, 0x46a(%rbp)
140219606:     	movl	$0x10000, 0x466(%rbp)   # imm = 0x10000
140219610:     	movw	$0x0, 0x470(%rbp)
140219619:     	movl	$0x10000, 0x46c(%rbp)   # imm = 0x10000
140219623:     	leaq	0x290(%rbp), %rcx
14021962a:     	callq	0x1400c7a20 <.text+0xc6a20>
14021962f:     	nop
140219630:     	leaq	0x5e8(%rbp), %rcx
140219637:     	leaq	0x300(%rbp), %rsi
14021963e:     	movl	$0x180, %r8d            # imm = 0x180
140219644:     	movq	%rsi, %rdx
140219647:     	callq	0x145756ddd <.text+0x5755ddd>
14021964c:     	movq	0x2f0(%rbp), %rax
140219653:     	movq	%rax, 0x5b7(%rbp)
14021965a:     	movups	0x2e0(%rbp), %xmm0
140219661:     	movups	%xmm0, 0x5a7(%rbp)
140219668:     	movups	0x2d0(%rbp), %xmm0
14021966f:     	movups	%xmm0, 0x597(%rbp)
140219676:     	movups	0x290(%rbp), %xmm0
14021967d:     	movups	0x2a0(%rbp), %xmm1
140219684:     	movups	0x2b0(%rbp), %xmm2
14021968b:     	movups	0x2c0(%rbp), %xmm3
140219692:     	movups	%xmm3, 0x587(%rbp)
140219699:     	movups	%xmm2, 0x577(%rbp)
1402196a0:     	movups	%xmm1, 0x567(%rbp)
1402196a7:     	movups	%xmm0, 0x557(%rbp)
1402196ae:     	movq	0x120(%rbp), %rax
1402196b5:     	movb	$0x2, 0x768(%rbp)
1402196bc:     	movq	0x5af(%rbp), %rcx
1402196c3:     	movq	%rcx, 0x7c8(%rbp)
1402196ca:     	movq	0x5b7(%rbp), %rcx
1402196d1:     	movq	%rcx, 0x7d0(%rbp)
1402196d8:     	movups	0x5a0(%rbp), %xmm0
1402196df:     	movups	%xmm0, 0x7b9(%rbp)
1402196e6:     	movups	0x590(%rbp), %xmm0
1402196ed:     	movups	%xmm0, 0x7a9(%rbp)
1402196f4:     	movups	0x580(%rbp), %xmm0
1402196fb:     	movups	%xmm0, 0x799(%rbp)
140219702:     	movups	0x570(%rbp), %xmm0
140219709:     	movups	%xmm0, 0x789(%rbp)
140219710:     	movups	0x560(%rbp), %xmm0
140219717:     	movups	%xmm0, 0x779(%rbp)
14021971e:     	movups	0x550(%rbp), %xmm0
140219725:     	movups	%xmm0, 0x769(%rbp)
14021972c:     	movq	%rax, 0x5e0(%rbp)
140219733:     	movb	$0x1, 0x827(%rbp)
14021973a:     	leaq	0xc0(%rbp), %rcx
140219741:     	leaq	0x5e0(%rbp), %r8
140219748:     	movq	%rdi, %rdx
14021974b:     	callq	0x1401ebb50 <.text+0x1eab50>
140219750:     	nop
140219751:     	movq	0xc0(%rbp), %r12
140219758:     	movq	0xe8(%rbp), %rax
14021975f:     	movq	%r12, 0x180(%rbp)
140219766:     	movups	0xc8(%rbp), %xmm0
14021976d:     	movups	%xmm0, 0x188(%rbp)
140219774:     	movups	0xd8(%rbp), %xmm0
14021977b:     	movups	%xmm0, 0x198(%rbp)
140219782:     	movq	%rax, 0x1a8(%rbp)
140219789:     	testb	%bl, %bl
14021978b:     	jne	0x140219797 <.text+0x218797>
14021978d:     	movss	0x56f1767(%rip), %xmm7  # 0x14590aefc
140219795:     	jmp	0x14021979f <.text+0x21879f>
140219797:     	movss	0x56d1ce1(%rip), %xmm7  # 0x1458eb480
14021979f:     	movq	0x818(%rbp), %rax
1402197a6:     	movq	(%rax), %rdi
1402197a9:     	movb	$0x1, 0x827(%rbp)
1402197b0:     	leaq	0x5725699(%rip), %rcx   # 0x14593ee50
1402197b7:     	movl	$0x6, %edx
1402197bc:     	callq	0x145452350 <.text+0x5451350>
1402197c1:     	nop
1402197c2:     	movq	%rax, 0x300(%rbp)
1402197c9:     	movq	%rdx, 0x308(%rbp)
1402197d0:     	movq	%rsi, 0x5e0(%rbp)
1402197d7:     	leaq	-0x21771e(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
1402197de:     	movq	%rax, 0x5e8(%rbp)
1402197e5:     	movb	$0x1, 0x827(%rbp)
1402197ec:     	leaq	0x5725601(%rip), %rdx   # 0x14593edf4
1402197f3:     	leaq	0x1b8(%rbp), %rcx
1402197fa:     	leaq	0x5e0(%rbp), %r8
140219801:     	callq	0x14570bf80 <.text+0x570af80>
140219806:     	nop
140219807:     	cmpb	$0x1, (%rdi)
14021980a:     	jne	0x14021982a <.text+0x21882a>
14021980c:     	movl	0x1(%rdi), %eax
14021980f:     	movl	0x4(%rdi), %ecx
140219812:     	movl	%ecx, 0x553(%rbp)
140219818:     	movl	%eax, 0x550(%rbp)
14021981e:     	movq	0x8(%rdi), %rax
140219822:     	movzbl	0x10(%rdi), %edx
140219826:     	movb	$0x1, %cl
140219828:     	jmp	0x14021983a <.text+0x21883a>
14021982a:     	movq	0x8(%rdi), %rax
14021982e:     	lock
14021982f:     	incq	(%rax)
140219832:     	jle	0x14021a34a <.text+0x21934a>
140219838:     	xorl	%ecx, %ecx
14021983a:     	leaq	0x188(%rbp), %r15
140219841:     	movq	0x1c8(%rbp), %r8
140219848:     	movq	%r8, 0x5f8(%rbp)
14021984f:     	movups	0x1b8(%rbp), %xmm0
140219856:     	movups	%xmm0, 0x5e8(%rbp)
14021985d:     	movl	0x550(%rbp), %r8d
140219864:     	movl	0x553(%rbp), %r9d
14021986b:     	movl	%r8d, 0x619(%rbp)
140219872:     	movl	%r9d, 0x61c(%rbp)
140219879:     	movups	0x5725577(%rip), %xmm8  # 0x14593edf8
140219881:     	movups	%xmm8, 0x301(%rbp)
140219889:     	movq	$0x0, 0x600(%rbp)
140219894:     	movq	$0x4, 0x608(%rbp)
14021989f:     	movq	$0x0, 0x610(%rbp)
1402198aa:     	movb	%cl, 0x618(%rbp)
1402198b0:     	movq	%rax, 0x620(%rbp)
1402198b7:     	movq	%rdx, 0x628(%rbp)
1402198be:     	movl	$0x41880000, 0x630(%rbp) # imm = 0x41880000
1402198c8:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
1402198d1:     	movb	$0x1, 0x636(%rbp)
1402198d8:     	movzbl	0x310(%rbp), %eax
1402198df:     	movb	%al, 0x647(%rbp)
1402198e5:     	movups	0x300(%rbp), %xmm0
1402198ec:     	movups	%xmm0, 0x637(%rbp)
1402198f3:     	movss	%xmm7, 0x648(%rbp)
1402198fb:     	movl	0x56e3fdb(%rip), %eax   # 0x1458fd8dc
140219901:     	movl	%eax, 0x65c(%rbp)
140219907:     	movups	0x56e3fbe(%rip), %xmm0  # 0x1458fd8cc
14021990e:     	movups	%xmm0, 0x64c(%rbp)
140219915:     	movsd	0x56df5f3(%rip), %xmm0  # 0x1458f8f10
14021991d:     	movsd	%xmm0, 0x660(%rbp)
140219925:     	movq	%r12, 0x5e0(%rbp)
14021992c:     	movb	$0x1, 0x827(%rbp)
140219933:     	leaq	0x1f0(%rbp), %rcx
14021993a:     	leaq	0x5e0(%rbp), %r8
140219941:     	movq	%r15, %rdx
140219944:     	callq	0x1401e8b90 <.text+0x1e7b90>
140219949:     	nop
14021994a:     	movq	0x2f8(%rbp), %rax
140219951:     	movq	(%rax), %rax
140219954:     	movq	0x20(%rax), %rcx
140219958:     	testq	%rcx, %rcx
14021995b:     	je	0x1402199a4 <.text+0x2189a4>
14021995d:     	movq	0x818(%rbp), %rax
140219964:     	movq	(%rax), %rdi
140219967:     	movb	$0x1, 0x827(%rbp)
14021996e:     	leaq	0x5e0(%rbp), %rdx
140219975:     	movl	$0x14, %r8d
14021997b:     	callq	0x1457134f0 <.text+0x57124f0>
140219980:     	nop
140219981:     	movq	%rdx, %rsi
140219984:     	testq	%rdx, %rdx
140219987:     	jns	0x1402199b1 <.text+0x2189b1>
140219989:     	xorl	%r15d, %r15d
14021998c:     	movb	$0x1, 0x827(%rbp)
140219993:     	movq	%r15, %rcx
140219996:     	movq	%rsi, %rdx
140219999:     	callq	0x1458e721b <.text+0x58e621b>
14021999e:     	nop
14021999f:     	jmp	0x14021a34a <.text+0x21934a>
1402199a4:     	testb	%bl, %bl
1402199a6:     	je	0x140219a1b <.text+0x218a1b>
1402199a8:     	movups	0x57254bd(%rip), %xmm0  # 0x14593ee6c
1402199af:     	jmp	0x140219a22 <.text+0x218a22>
1402199b1:     	testq	%rsi, %rsi
1402199b4:     	je	0x140219b26 <.text+0x218b26>
1402199ba:     	movq	%r15, %r13
1402199bd:     	movq	%rax, %r14
1402199c0:     	callq	0x140002200 <.text+0x1200>
1402199c5:     	movl	$0x1, %r15d
1402199cb:     	movl	$0x1, %edx
1402199d0:     	movq	%rsi, %rcx
1402199d3:     	callq	0x1400021c0 <.text+0x11c0>
1402199d8:     	testq	%rax, %rax
1402199db:     	je	0x14021998c <.text+0x21898c>
1402199dd:     	movq	%rax, %rbx
1402199e0:     	movq	%rax, %rcx
1402199e3:     	movq	%r14, %rdx
1402199e6:     	movq	%rsi, %r8
1402199e9:     	callq	0x145756ddd <.text+0x5755ddd>
1402199ee:     	movq	%r13, %r15
1402199f1:     	cmpb	$0x1, (%rdi)
1402199f4:     	jne	0x140219b34 <.text+0x218b34>
1402199fa:     	movl	0x1(%rdi), %eax
1402199fd:     	movl	0x4(%rdi), %ecx
140219a00:     	movl	%ecx, 0x303(%rbp)
140219a06:     	movl	%eax, 0x300(%rbp)
140219a0c:     	movq	0x8(%rdi), %rax
140219a10:     	movzbl	0x10(%rdi), %ecx
140219a14:     	movb	$0x1, %dl
140219a16:     	jmp	0x140219b44 <.text+0x218b44>
140219a1b:     	movups	0x5725436(%rip), %xmm0  # 0x14593ee58
140219a22:     	movaps	%xmm0, 0x1d0(%rbp)
140219a29:     	movl	$0x3f800000, 0x1e0(%rbp) # imm = 0x3F800000
140219a33:     	movq	0x1f0(%rbp), %rdi
140219a3a:     	movq	0x218(%rbp), %rcx
140219a41:     	movq	%rdi, 0x550(%rbp)
140219a48:     	movups	0x1f8(%rbp), %xmm0
140219a4f:     	movups	%xmm0, 0x558(%rbp)
140219a56:     	movups	0x208(%rbp), %xmm0
140219a5d:     	movups	%xmm0, 0x568(%rbp)
140219a64:     	movq	%rcx, 0x578(%rbp)
140219a6b:     	movq	0x818(%rbp), %rcx
140219a72:     	movq	(%rcx), %r13
140219a75:     	movq	0x28(%rax), %rcx
140219a79:     	movb	$0x1, 0x827(%rbp)
140219a80:     	leaq	0x5e0(%rbp), %rdx
140219a87:     	movl	$0x14, %r8d
140219a8d:     	callq	0x1457134f0 <.text+0x57124f0>
140219a92:     	nop
140219a93:     	movq	%rdx, %rsi
140219a96:     	testq	%rdx, %rdx
140219a99:     	jns	0x140219ab6 <.text+0x218ab6>
140219a9b:     	xorl	%r15d, %r15d
140219a9e:     	movb	$0x1, 0x827(%rbp)
140219aa5:     	movq	%r15, %rcx
140219aa8:     	movq	%rsi, %rdx
140219aab:     	callq	0x1458e721b <.text+0x58e621b>
140219ab0:     	nop
140219ab1:     	jmp	0x14021a34a <.text+0x21934a>
140219ab6:     	testq	%rsi, %rsi
140219ab9:     	je	0x140219bfa <.text+0x218bfa>
140219abf:     	movq	%rax, %rbx
140219ac2:     	callq	0x140002200 <.text+0x1200>
140219ac7:     	movl	$0x1, %r15d
140219acd:     	movl	$0x1, %edx
140219ad2:     	movq	%rsi, %rcx
140219ad5:     	callq	0x1400021c0 <.text+0x11c0>
140219ada:     	testq	%rax, %rax
140219add:     	je	0x140219a9e <.text+0x218a9e>
140219adf:     	movq	%rax, %r14
140219ae2:     	movq	%rax, %rcx
140219ae5:     	movq	%rbx, %rdx
140219ae8:     	movq	%rsi, %r8
140219aeb:     	callq	0x145756ddd <.text+0x5755ddd>
140219af0:     	leaq	0x188(%rbp), %r15
140219af7:     	cmpb	$0x1, (%r13)
140219afc:     	jne	0x140219c0b <.text+0x218c0b>
140219b02:     	movl	0x1(%r13), %eax
140219b06:     	movl	0x4(%r13), %ecx
140219b0a:     	movl	%ecx, 0x533(%rbp)
140219b10:     	movl	%eax, 0x530(%rbp)
140219b16:     	movq	0x8(%r13), %rax
140219b1a:     	movzbl	0x10(%r13), %ecx
140219b1f:     	movb	$0x1, %dl
140219b21:     	jmp	0x140219c1b <.text+0x218c1b>
140219b26:     	movl	$0x1, %ebx
140219b2b:     	cmpb	$0x1, (%rdi)
140219b2e:     	je	0x1402199fa <.text+0x2189fa>
140219b34:     	movq	0x8(%rdi), %rax
140219b38:     	lock
140219b39:     	incq	(%rax)
140219b3c:     	jle	0x14021a34a <.text+0x21934a>
140219b42:     	xorl	%edx, %edx
140219b44:     	movq	%rsi, 0x5e0(%rbp)
140219b4b:     	movq	%rbx, 0x5e8(%rbp)
140219b52:     	movq	%rsi, 0x5f0(%rbp)
140219b59:     	movq	$0x0, 0x5f8(%rbp)
140219b64:     	movq	$0x4, 0x600(%rbp)
140219b6f:     	movq	$0x0, 0x608(%rbp)
140219b7a:     	movb	%dl, 0x610(%rbp)
140219b80:     	movl	0x300(%rbp), %edx
140219b86:     	movl	0x303(%rbp), %r8d
140219b8d:     	movl	%edx, 0x611(%rbp)
140219b93:     	movl	%r8d, 0x614(%rbp)
140219b9a:     	movq	%rax, 0x618(%rbp)
140219ba1:     	movq	%rcx, 0x620(%rbp)
140219ba8:     	movl	$0x41880000, 0x628(%rbp) # imm = 0x41880000
140219bb2:     	movw	$0x190, 0x62c(%rbp)     # imm = 0x190
140219bbb:     	movb	$0x1, 0x62e(%rbp)
140219bc2:     	movups	0x57252a3(%rip), %xmm0  # 0x14593ee6c
140219bc9:     	movups	%xmm0, 0x630(%rbp)
140219bd0:     	movl	$0x3f800000, 0x640(%rbp) # imm = 0x3F800000
140219bda:     	movb	$0x1, 0x827(%rbp)
140219be1:     	leaq	0x1f0(%rbp), %rcx
140219be8:     	leaq	0x5e0(%rbp), %rdx
140219bef:     	callq	0x1401fdab0 <.text+0x1fcab0>
140219bf4:     	nop
140219bf5:     	jmp	0x140219e74 <.text+0x218e74>
140219bfa:     	movl	$0x1, %r14d
140219c00:     	cmpb	$0x1, (%r13)
140219c05:     	je	0x140219b02 <.text+0x218b02>
140219c0b:     	movq	0x8(%r13), %rax
140219c0f:     	lock
140219c10:     	incq	(%rax)
140219c13:     	jle	0x14021a34a <.text+0x21934a>
140219c19:     	xorl	%edx, %edx
140219c1b:     	leaq	0x558(%rbp), %rbx
140219c22:     	movl	0x1e0(%rbp), %r8d
140219c29:     	movl	%r8d, 0x2a1(%rbp)
140219c30:     	movaps	0x1d0(%rbp), %xmm0
140219c37:     	movups	%xmm0, 0x291(%rbp)
140219c3e:     	movq	%rsi, 0x5e8(%rbp)
140219c45:     	movq	%r14, 0x5f0(%rbp)
140219c4c:     	movq	%rsi, 0x5f8(%rbp)
140219c53:     	movq	$0x0, 0x600(%rbp)
140219c5e:     	movq	$0x4, 0x608(%rbp)
140219c69:     	movq	$0x0, 0x610(%rbp)
140219c74:     	movb	%dl, 0x618(%rbp)
140219c7a:     	movl	0x530(%rbp), %edx
140219c80:     	movl	0x533(%rbp), %r8d
140219c87:     	movl	%edx, 0x619(%rbp)
140219c8d:     	movl	%r8d, 0x61c(%rbp)
140219c94:     	movq	%rax, 0x620(%rbp)
140219c9b:     	movq	%rcx, 0x628(%rbp)
140219ca2:     	movl	$0x41880000, 0x630(%rbp) # imm = 0x41880000
140219cac:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
140219cb5:     	movb	$0x1, 0x636(%rbp)
140219cbc:     	movups	0x290(%rbp), %xmm0
140219cc3:     	movups	%xmm0, 0x637(%rbp)
140219cca:     	movq	0x29d(%rbp), %rax
140219cd1:     	movq	%rax, 0x644(%rbp)
140219cd8:     	movq	%rdi, 0x5e0(%rbp)
140219cdf:     	movb	$0x1, 0x827(%rbp)
140219ce6:     	leaq	0x300(%rbp), %rsi
140219ced:     	leaq	0x5e0(%rbp), %r8
140219cf4:     	movq	%rsi, %rcx
140219cf7:     	movq	%rbx, %rdx
140219cfa:     	callq	0x1401e85c0 <.text+0x1e75c0>
140219cff:     	nop
140219d00:     	movq	0x818(%rbp), %rax
140219d07:     	movq	(%rax), %r14
140219d0a:     	movb	$0x1, 0x827(%rbp)
140219d11:     	leaq	0x57250d0(%rip), %rcx   # 0x14593ede8
140219d18:     	movl	$0x4, %edx
140219d1d:     	callq	0x145452350 <.text+0x5451350>
140219d22:     	nop
140219d23:     	movq	%rax, 0x300(%rbp)
140219d2a:     	movq	%rdx, 0x308(%rbp)
140219d31:     	movq	%rsi, 0x5e0(%rbp)
140219d38:     	leaq	-0x217c7f(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
140219d3f:     	movq	%rax, 0x5e8(%rbp)
140219d46:     	movb	$0x1, 0x827(%rbp)
140219d4d:     	leaq	0x5725098(%rip), %rdx   # 0x14593edec
140219d54:     	leaq	0x290(%rbp), %rcx
140219d5b:     	leaq	0x5e0(%rbp), %r8
140219d62:     	callq	0x14570bf80 <.text+0x570af80>
140219d67:     	nop
140219d68:     	cmpb	$0x1, (%r14)
140219d6c:     	jne	0x140219d8f <.text+0x218d8f>
140219d6e:     	movl	0x1(%r14), %eax
140219d72:     	movl	0x4(%r14), %ecx
140219d76:     	movl	%ecx, 0x52b(%rbp)
140219d7c:     	movl	%eax, 0x528(%rbp)
140219d82:     	movq	0x8(%r14), %rax
140219d86:     	movzbl	0x10(%r14), %ecx
140219d8b:     	movb	$0x1, %dl
140219d8d:     	jmp	0x140219d9f <.text+0x218d9f>
140219d8f:     	movq	0x8(%r14), %rax
140219d93:     	lock
140219d94:     	incq	(%rax)
140219d97:     	jle	0x14021a34a <.text+0x21934a>
140219d9d:     	xorl	%edx, %edx
140219d9f:     	movq	0x2a0(%rbp), %r8
140219da6:     	movq	%r8, 0x5f8(%rbp)
140219dad:     	movups	0x290(%rbp), %xmm0
140219db4:     	movups	%xmm0, 0x5e8(%rbp)
140219dbb:     	movups	%xmm8, 0x241(%rbp)
140219dc3:     	movq	$0x0, 0x600(%rbp)
140219dce:     	movq	$0x4, 0x608(%rbp)
140219dd9:     	movq	$0x0, 0x610(%rbp)
140219de4:     	movb	%dl, 0x618(%rbp)
140219dea:     	movl	0x528(%rbp), %edx
140219df0:     	movl	0x52b(%rbp), %r8d
140219df7:     	movl	%edx, 0x619(%rbp)
140219dfd:     	movl	%r8d, 0x61c(%rbp)
140219e04:     	movq	%rax, 0x620(%rbp)
140219e0b:     	movq	%rcx, 0x628(%rbp)
140219e12:     	movl	$0x41600000, 0x630(%rbp) # imm = 0x41600000
140219e1c:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
140219e25:     	movb	$0x1, 0x636(%rbp)
140219e2c:     	movzbl	0x250(%rbp), %eax
140219e33:     	movb	%al, 0x647(%rbp)
140219e39:     	movups	0x240(%rbp), %xmm0
140219e40:     	movups	%xmm0, 0x637(%rbp)
140219e47:     	movss	%xmm7, 0x648(%rbp)
140219e4f:     	movq	%rdi, 0x5e0(%rbp)
140219e56:     	movb	$0x1, 0x827(%rbp)
140219e5d:     	leaq	0x300(%rbp), %rcx
140219e64:     	leaq	0x5e0(%rbp), %r8
140219e6b:     	movq	%rbx, %rdx
140219e6e:     	callq	0x1401e85c0 <.text+0x1e75c0>
140219e73:     	nop
140219e74:     	movups	0x5725005(%rip), %xmm0  # 0x14593ee80
140219e7b:     	movaps	%xmm0, 0x550(%rbp)
140219e82:     	movq	$0x0, 0x560(%rbp)
140219e8d:     	movups	0x5725004(%rip), %xmm0  # 0x14593ee98
140219e94:     	movups	%xmm0, 0x568(%rbp)
140219e9b:     	movq	$0x0, 0x578(%rbp)
140219ea6:     	movups	0x5725003(%rip), %xmm0  # 0x14593eeb0
140219ead:     	movaps	%xmm0, 0x580(%rbp)
140219eb4:     	movq	$0x0, 0x590(%rbp)
140219ebf:     	movups	0x5725002(%rip), %xmm0  # 0x14593eec8
140219ec6:     	movups	%xmm0, 0x598(%rbp)
140219ecd:     	movq	$0x0, 0x5a8(%rbp)
140219ed8:     	movups	0x5725121(%rip), %xmm0  # 0x14593f000
140219edf:     	movaps	%xmm0, 0x240(%rbp)
140219ee6:     	movl	$0x3f800000, 0x250(%rbp) # imm = 0x3F800000
140219ef0:     	movups	%xmm0, 0x254(%rbp)
140219ef7:     	movl	$0x3f800000, 0x264(%rbp) # imm = 0x3F800000
140219f01:     	movups	%xmm0, 0x268(%rbp)
140219f08:     	movl	$0x3f800000, 0x278(%rbp) # imm = 0x3F800000
140219f12:     	movups	%xmm0, 0x27c(%rbp)
140219f19:     	movl	$0x3f800000, 0x28c(%rbp) # imm = 0x3F800000
140219f23:     	movq	0x5a0(%rbp), %rax
140219f2a:     	movq	%rax, 0x350(%rbp)
140219f31:     	movq	0x5a8(%rbp), %rax
140219f38:     	movq	%rax, 0x358(%rbp)
140219f3f:     	movq	0x590(%rbp), %rax
140219f46:     	movq	%rax, 0x340(%rbp)
140219f4d:     	movq	0x598(%rbp), %rax
140219f54:     	movq	%rax, 0x348(%rbp)
140219f5b:     	movaps	0x550(%rbp), %xmm0
140219f62:     	movaps	0x560(%rbp), %xmm1
140219f69:     	movaps	0x570(%rbp), %xmm2
140219f70:     	movaps	0x580(%rbp), %xmm3
140219f77:     	movaps	%xmm3, 0x330(%rbp)
140219f7e:     	movaps	%xmm2, 0x320(%rbp)
140219f85:     	movaps	%xmm1, 0x310(%rbp)
140219f8c:     	movaps	%xmm0, 0x300(%rbp)
140219f93:     	xorps	%xmm0, %xmm0
140219f96:     	movaps	%xmm0, 0x3a0(%rbp)
140219f9d:     	movaps	%xmm0, 0x390(%rbp)
140219fa4:     	movaps	%xmm0, 0x380(%rbp)
140219fab:     	movaps	%xmm0, 0x370(%rbp)
140219fb2:     	movaps	%xmm0, 0x360(%rbp)
140219fb9:     	movq	$0x0, 0x3b0(%rbp)
140219fc4:     	movups	%xmm12, 0x3c8(%rbp)
140219fcc:     	movups	%xmm11, 0x3b8(%rbp)
140219fd4:     	movl	$0x0, 0x762(%rbp)
140219fde:     	movq	$0x0, 0x75a(%rbp)
140219fe9:     	movaps	0x280(%rbp), %xmm0
140219ff0:     	movups	%xmm0, 0x2d2(%rbp)
140219ff7:     	movaps	0x240(%rbp), %xmm0
140219ffe:     	movaps	0x250(%rbp), %xmm1
14021a005:     	movaps	0x260(%rbp), %xmm2
14021a00c:     	movaps	0x270(%rbp), %xmm3
14021a013:     	movups	%xmm3, 0x2c2(%rbp)
14021a01a:     	movups	%xmm2, 0x2b2(%rbp)
14021a021:     	movups	%xmm1, 0x2a2(%rbp)
14021a028:     	movups	%xmm0, 0x292(%rbp)
14021a02f:     	leaq	0x5e8(%rbp), %rcx
14021a036:     	leaq	0x300(%rbp), %rdx
14021a03d:     	movl	$0xd8, %r8d
14021a043:     	callq	0x145756ddd <.text+0x5755ddd>
14021a048:     	movaps	0x56d1491(%rip), %xmm0  # 0x1458eb4e0
14021a04f:     	movups	%xmm0, 0x6c0(%rbp)
14021a056:     	movaps	0x56e2a83(%rip), %xmm0  # 0x1458fcae0
14021a05d:     	movups	%xmm0, 0x6d0(%rbp)
14021a064:     	movups	%xmm6, 0x6e0(%rbp)
14021a06b:     	movups	%xmm6, 0x6f0(%rbp)
14021a072:     	movups	%xmm15, 0x700(%rbp)
14021a07a:     	movups	%xmm15, 0x710(%rbp)
14021a082:     	movups	%xmm10, 0x720(%rbp)
14021a08a:     	movl	$0x1, 0x730(%rbp)
14021a094:     	movq	$0x0, 0x734(%rbp)
14021a09f:     	movb	$0x1, 0x73c(%rbp)
14021a0a6:     	movq	$0x0, 0x740(%rbp)
14021a0b1:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
14021a0bb:     	movw	$0x0, 0x74c(%rbp)
14021a0c4:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
14021a0ce:     	movw	$0x0, 0x752(%rbp)
14021a0d7:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
14021a0e1:     	movw	$0x0, 0x758(%rbp)
14021a0ea:     	movzwl	0x2e0(%rbp), %eax
14021a0f1:     	movw	%ax, 0x7b6(%rbp)
14021a0f8:     	movups	0x2d0(%rbp), %xmm0
14021a0ff:     	movups	%xmm0, 0x7a6(%rbp)
14021a106:     	movups	0x290(%rbp), %xmm0
14021a10d:     	movups	0x2a0(%rbp), %xmm1
14021a114:     	movups	0x2b0(%rbp), %xmm2
14021a11b:     	movups	0x2c0(%rbp), %xmm3
14021a122:     	movups	%xmm3, 0x796(%rbp)
14021a129:     	movups	%xmm2, 0x786(%rbp)
14021a130:     	movups	%xmm1, 0x776(%rbp)
14021a137:     	movups	%xmm0, 0x766(%rbp)
14021a13e:     	movq	%r12, 0x5e0(%rbp)
14021a145:     	movb	$0x1, 0x827(%rbp)
14021a14c:     	leaq	0x550(%rbp), %rcx
14021a153:     	leaq	0x5e0(%rbp), %r8
14021a15a:     	movq	%r15, %rdx
14021a15d:     	callq	0x1401e43c0 <.text+0x1e33c0>
14021a162:     	nop
14021a163:     	movq	0x818(%rbp), %rax
14021a16a:     	movq	(%rax), %rsi
14021a16d:     	callq	0x140002200 <.text+0x1200>
14021a172:     	movl	$0x1, %ecx
14021a177:     	movl	$0x1, %edx
14021a17c:     	callq	0x1400021c0 <.text+0x11c0>
14021a181:     	testq	%rax, %rax
14021a184:     	je	0x14021a333 <.text+0x219333>
14021a18a:     	movb	$0x52, (%rax)
14021a18d:     	cmpb	$0x1, (%rsi)
14021a190:     	jne	0x14021a1b1 <.text+0x2191b1>
14021a192:     	movl	0x1(%rsi), %ecx
14021a195:     	movl	0x4(%rsi), %edx
14021a198:     	movl	%edx, 0x303(%rbp)
14021a19e:     	movl	%ecx, 0x300(%rbp)
14021a1a4:     	movq	0x8(%rsi), %rcx
14021a1a8:     	movzbl	0x10(%rsi), %edx
14021a1ac:     	movb	$0x1, %r8b
14021a1af:     	jmp	0x14021a1c2 <.text+0x2191c2>
14021a1b1:     	movq	0x8(%rsi), %rcx
14021a1b5:     	lock
14021a1b6:     	incq	(%rcx)
14021a1b9:     	jle	0x14021a34a <.text+0x21934a>
14021a1bf:     	xorl	%r8d, %r8d
14021a1c2:     	movq	$0x1, 0x5e0(%rbp)
14021a1cd:     	movq	%rax, 0x5e8(%rbp)
14021a1d4:     	movq	$0x1, 0x5f0(%rbp)
14021a1df:     	movq	$0x0, 0x5f8(%rbp)
14021a1ea:     	movq	$0x4, 0x600(%rbp)
14021a1f5:     	movq	$0x0, 0x608(%rbp)
14021a200:     	movb	%r8b, 0x610(%rbp)
14021a207:     	movl	0x300(%rbp), %eax
14021a20d:     	movl	0x303(%rbp), %r8d
14021a214:     	movl	%eax, 0x611(%rbp)
14021a21a:     	movl	%r8d, 0x614(%rbp)
14021a221:     	movq	%rcx, 0x618(%rbp)
14021a228:     	movq	%rdx, 0x620(%rbp)
14021a22f:     	movl	$0x41300000, 0x628(%rbp) # imm = 0x41300000
14021a239:     	movw	$0x190, 0x62c(%rbp)     # imm = 0x190
14021a242:     	movb	$0x1, 0x62e(%rbp)
14021a249:     	movups	0x5724bec(%rip), %xmm0  # 0x14593ee3c
14021a250:     	movups	%xmm0, 0x630(%rbp)
14021a257:     	movl	$0x3f800000, 0x640(%rbp) # imm = 0x3F800000
14021a261:     	movl	0x56e3675(%rip), %eax   # 0x1458fd8dc
14021a267:     	movl	%eax, 0x654(%rbp)
14021a26d:     	movups	0x56e3658(%rip), %xmm0  # 0x1458fd8cc
14021a274:     	movups	%xmm0, 0x644(%rbp)
14021a27b:     	movsd	0x56dec8d(%rip), %xmm0  # 0x1458f8f10
14021a283:     	movsd	%xmm0, 0x658(%rbp)
14021a28b:     	movb	$0x1, 0x827(%rbp)
14021a292:     	leaq	0x550(%rbp), %rcx
14021a299:     	leaq	0x5e0(%rbp), %rdx
14021a2a0:     	callq	0x1401fe030 <.text+0x1fd030>
14021a2a5:     	nop
14021a2a6:     	movq	0x178(%rbp), %rax
14021a2ad:     	movaps	0x830(%rbp), %xmm6
14021a2b4:     	movaps	0x840(%rbp), %xmm7
14021a2bb:     	movaps	0x850(%rbp), %xmm8
14021a2c3:     	movaps	0x860(%rbp), %xmm9
14021a2cb:     	movaps	0x870(%rbp), %xmm10
14021a2d3:     	movaps	0x880(%rbp), %xmm11
14021a2db:     	movaps	0x890(%rbp), %xmm12
14021a2e3:     	movaps	0x8a0(%rbp), %xmm13
14021a2eb:     	movaps	0x8b0(%rbp), %xmm14
14021a2f3:     	movaps	0x8c0(%rbp), %xmm15
14021a2fb:     	addq	$0x958, %rsp            # imm = 0x958
14021a302:     	popq	%rbx
14021a303:     	popq	%rdi
14021a304:     	popq	%rsi
14021a305:     	popq	%r12
14021a307:     	popq	%r13
14021a309:     	popq	%r14
14021a30b:     	popq	%r15
14021a30d:     	popq	%rbp
14021a30e:     	retq
14021a30f:     	movl	$0x4, %ecx
14021a314:     	movl	$0x40, %edx
14021a319:     	callq	0x1458e7201 <.text+0x58e6201>
14021a31e:     	nop
14021a31f:     	jmp	0x14021a34a <.text+0x21934a>
14021a321:     	movl	$0x8, %ecx
14021a326:     	movl	$0x48, %edx
14021a32b:     	callq	0x1458e7201 <.text+0x58e6201>
14021a330:     	nop
14021a331:     	jmp	0x14021a34a <.text+0x21934a>
14021a333:     	movb	$0x1, 0x827(%rbp)
14021a33a:     	movl	$0x1, %ecx
14021a33f:     	movl	$0x1, %edx
14021a344:     	callq	0x1458e721b <.text+0x58e621b>
14021a349:     	nop
14021a34a:     	ud2

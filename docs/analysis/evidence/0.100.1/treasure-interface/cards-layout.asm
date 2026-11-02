
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14010cdf0:     	pushq	%rbp
14010cdf1:     	pushq	%r15
14010cdf3:     	pushq	%r14
14010cdf5:     	pushq	%r13
14010cdf7:     	pushq	%r12
14010cdf9:     	pushq	%rsi
14010cdfa:     	pushq	%rdi
14010cdfb:     	pushq	%rbx
14010cdfc:     	subq	$0x958, %rsp            # imm = 0x958
14010ce03:     	leaq	0x80(%rsp), %rbp
14010ce0b:     	movaps	%xmm15, 0x8c0(%rbp)
14010ce13:     	movaps	%xmm14, 0x8b0(%rbp)
14010ce1b:     	movaps	%xmm13, 0x8a0(%rbp)
14010ce23:     	movaps	%xmm12, 0x890(%rbp)
14010ce2b:     	movaps	%xmm11, 0x880(%rbp)
14010ce33:     	movaps	%xmm10, 0x870(%rbp)
14010ce3b:     	movaps	%xmm9, 0x860(%rbp)
14010ce43:     	movaps	%xmm8, 0x850(%rbp)
14010ce4b:     	movaps	%xmm7, 0x840(%rbp)
14010ce52:     	movaps	%xmm6, 0x830(%rbp)
14010ce59:     	movq	$-0x2, 0x828(%rbp)
14010ce64:     	movq	%rcx, %r15
14010ce67:     	movq	(%rcx), %r14
14010ce6a:     	movq	0x28(%rcx), %rax
14010ce6e:     	movq	%r14, 0x90(%rbp)
14010ce75:     	movups	0x8(%rcx), %xmm0
14010ce79:     	movups	%xmm0, 0x98(%rbp)
14010ce80:     	movups	0x18(%rcx), %xmm0
14010ce84:     	movups	%xmm0, 0xa8(%rbp)
14010ce8b:     	movq	%rax, 0xb8(%rbp)
14010ce92:     	movw	$0x0, 0x744(%rbp)
14010ce9b:     	movb	$0x1, 0x734(%rbp)
14010cea2:     	movsd	0x5832d16(%rip), %xmm0  # 0x14593fbc0
14010ceaa:     	movups	%xmm0, 0x648(%rbp)
14010ceb1:     	movsd	0x5832d17(%rip), %xmm0  # 0x14593fbd0
14010ceb9:     	movups	%xmm0, 0x658(%rbp)
14010cec0:     	movaps	0x5832d19(%rip), %xmm0  # 0x14593fbe0
14010cec7:     	movups	%xmm0, 0x668(%rbp)
14010cece:     	movq	$0x0, 0x640(%rbp)
14010ced9:     	xorps	%xmm0, %xmm0
14010cedc:     	movups	%xmm0, 0x678(%rbp)
14010cee3:     	movups	%xmm0, 0x688(%rbp)
14010ceea:     	movl	$0x0, 0x758(%rbp)
14010cef4:     	movw	$0x0, 0x75c(%rbp)
14010cefd:     	movaps	0x58089fc(%rip), %xmm0  # 0x145915900
14010cf04:     	movups	%xmm0, 0x698(%rbp)
14010cf0b:     	movaps	0x5832cde(%rip), %xmm0  # 0x14593fbf0
14010cf12:     	movups	%xmm0, 0x6a8(%rbp)
14010cf19:     	movups	0x58338c8(%rip), %xmm0  # 0x1459407e8
14010cf20:     	movups	%xmm0, 0x6b8(%rbp)
14010cf27:     	movups	0x58338c9(%rip), %xmm13 # 0x1459407f8
14010cf2f:     	movups	%xmm13, 0x6c8(%rbp)
14010cf37:     	movups	0x58338ca(%rip), %xmm0  # 0x145940808
14010cf3e:     	movups	%xmm0, 0x6d8(%rbp)
14010cf45:     	movups	0x58338cc(%rip), %xmm7  # 0x145940818
14010cf4c:     	movups	%xmm7, 0x6e8(%rbp)
14010cf53:     	movups	0x58338dd(%rip), %xmm12 # 0x145940838
14010cf5b:     	movups	%xmm12, 0x708(%rbp)
14010cf63:     	movups	0x58338be(%rip), %xmm0  # 0x145940828
14010cf6a:     	movups	%xmm0, 0x6f8(%rbp)
14010cf71:     	movb	$0x0, 0x756(%rbp)
14010cf78:     	movl	$0x100, 0x752(%rbp)     # imm = 0x100
14010cf82:     	movq	$0x0, 0x738(%rbp)
14010cf8d:     	movl	$0x3f800000, 0x740(%rbp) # imm = 0x3F800000
14010cf97:     	movaps	0x57fa522(%rip), %xmm0  # 0x1459074c0
14010cf9e:     	movups	%xmm0, 0x718(%rbp)
14010cfa5:     	movl	$0x1, 0x728(%rbp)
14010cfaf:     	movq	$0x0, 0x72c(%rbp)
14010cfba:     	movb	$0x0, 0x757(%rbp)
14010cfc1:     	movups	0x5833747(%rip), %xmm8  # 0x145940710
14010cfc9:     	movaps	%xmm8, 0x5e0(%rbp)
14010cfd1:     	movq	$0x0, 0x5f0(%rbp)
14010cfdc:     	movups	0x5833745(%rip), %xmm0  # 0x145940728
14010cfe3:     	movups	%xmm0, 0x5f8(%rbp)
14010cfea:     	movq	$0x0, 0x608(%rbp)
14010cff5:     	movups	0x5833744(%rip), %xmm0  # 0x145940740
14010cffc:     	movaps	%xmm0, 0x610(%rbp)
14010d003:     	movq	$0x0, 0x620(%rbp)
14010d00e:     	movups	0x5833743(%rip), %xmm0  # 0x145940758
14010d015:     	movups	%xmm0, 0x628(%rbp)
14010d01c:     	movq	$0x0, 0x638(%rbp)
14010d027:     	movw	$0x0, 0x74a(%rbp)
14010d030:     	movl	$0x10000, 0x746(%rbp)   # imm = 0x10000
14010d03a:     	movw	$0x0, 0x750(%rbp)
14010d043:     	movl	$0x10000, 0x74c(%rbp)   # imm = 0x10000
14010d04d:     	movq	%rdx, 0x540(%rbp)
14010d054:     	movq	0x18(%rdx), %rax
14010d058:     	movq	(%rax), %rax
14010d05b:     	cmpb	$0x1, (%rax)
14010d05e:     	jne	0x14010d06f <.text+0x10c06f>
14010d060:     	movups	0x1(%rax), %xmm0
14010d064:     	movups	%xmm0, 0x301(%rbp)
14010d06b:     	movb	$0x1, %al
14010d06d:     	jmp	0x14010d08a <.text+0x10c08a>
14010d06f:     	movq	0x8(%rax), %rcx
14010d073:     	lock
14010d074:     	incq	(%rcx)
14010d077:     	jle	0x14010fdca <.text+0x10edca>
14010d07d:     	movq	0x8(%rax), %rax
14010d081:     	movq	%rax, 0x308(%rbp)
14010d088:     	xorl	%eax, %eax
14010d08a:     	movb	%al, 0x300(%rbp)
14010d090:     	leaq	0x550(%rbp), %rcx
14010d097:     	leaq	0x300(%rbp), %rdx
14010d09e:     	callq	0x142702820 <.text+0x2701820>
14010d0a3:     	nop
14010d0a4:     	leaq	0x98(%rbp), %rdi
14010d0ab:     	movq	0x540(%rbp), %rax
14010d0b2:     	movq	0x20(%rax), %rbx
14010d0b6:     	movups	(%rbx), %xmm0
14010d0b9:     	movups	%xmm0, 0x588(%rbp)
14010d0c0:     	movl	$0x3dcccccd, 0x598(%rbp) # imm = 0x3DCCCCCD
14010d0ca:     	leaq	0x480(%rbp), %rcx
14010d0d1:     	leaq	0x550(%rbp), %rdx
14010d0d8:     	movl	$0x88, %r8d
14010d0de:     	callq	0x1457731ed <.text+0x57721ed>
14010d0e3:     	leaq	0x300(%rbp), %rsi
14010d0ea:     	leaq	0x5e0(%rbp), %rdx
14010d0f1:     	movl	$0x180, %r8d            # imm = 0x180
14010d0f7:     	movq	%rsi, %rcx
14010d0fa:     	callq	0x1457731ed <.text+0x57721ed>
14010d0ff:     	movups	0x5833a09(%rip), %xmm14 # 0x145940b10
14010d107:     	movups	%xmm14, 0x508(%rbp)
14010d10f:     	movups	0x5833a09(%rip), %xmm10 # 0x145940b20
14010d117:     	movups	%xmm10, 0x518(%rbp)
14010d11f:     	leaq	0x5e8(%rbp), %rcx
14010d126:     	movl	$0x228, %r8d            # imm = 0x228
14010d12c:     	movq	%rsi, %rdx
14010d12f:     	callq	0x1457731ed <.text+0x57721ed>
14010d134:     	movq	%r14, 0x5e0(%rbp)
14010d13b:     	movb	$0x1, 0x825(%rbp)
14010d142:     	leaq	0x550(%rbp), %rcx
14010d149:     	leaq	0x5e0(%rbp), %r8
14010d150:     	movq	%rdi, %rdx
14010d153:     	callq	0x1400dfa00 <.text+0xdea00>
14010d158:     	nop
14010d159:     	movw	$0x0, 0x464(%rbp)
14010d162:     	movb	$0x1, 0x454(%rbp)
14010d169:     	xorps	%xmm0, %xmm0
14010d16c:     	movups	%xmm0, 0x368(%rbp)
14010d173:     	movups	%xmm0, 0x378(%rbp)
14010d17a:     	movaps	0x5805faf(%rip), %xmm1  # 0x145913130
14010d181:     	movups	%xmm1, 0x388(%rbp)
14010d188:     	movq	$0x0, 0x360(%rbp)
14010d193:     	movups	%xmm0, 0x398(%rbp)
14010d19a:     	movups	%xmm0, 0x3a8(%rbp)
14010d1a1:     	movl	$0x0, 0x478(%rbp)
14010d1ab:     	movw	$0x0, 0x47c(%rbp)
14010d1b4:     	movups	0x583360c(%rip), %xmm15 # 0x1459407c8
14010d1bc:     	movups	%xmm15, 0x3b8(%rbp)
14010d1c4:     	movups	0x583360d(%rip), %xmm0  # 0x1459407d8
14010d1cb:     	movaps	%xmm0, %xmm9
14010d1cf:     	movups	%xmm0, 0x3c8(%rbp)
14010d1d6:     	movups	0x583360b(%rip), %xmm0  # 0x1459407e8
14010d1dd:     	movups	%xmm0, 0x3d8(%rbp)
14010d1e4:     	movups	%xmm13, 0x3e8(%rbp)
14010d1ec:     	movups	%xmm7, 0x408(%rbp)
14010d1f3:     	movups	0x583360e(%rip), %xmm0  # 0x145940808
14010d1fa:     	movups	%xmm0, 0x3f8(%rbp)
14010d201:     	movups	%xmm12, 0x428(%rbp)
14010d209:     	movups	0x5833618(%rip), %xmm0  # 0x145940828
14010d210:     	movups	%xmm0, 0x418(%rbp)
14010d217:     	movb	$0x0, 0x476(%rbp)
14010d21e:     	movl	$0x100, 0x472(%rbp)     # imm = 0x100
14010d228:     	movq	$0x0, 0x458(%rbp)
14010d233:     	movl	$0x3f800000, 0x460(%rbp) # imm = 0x3F800000
14010d23d:     	movaps	0x57fa27c(%rip), %xmm0  # 0x1459074c0
14010d244:     	movups	%xmm0, 0x438(%rbp)
14010d24b:     	movl	$0x1, 0x448(%rbp)
14010d255:     	movq	$0x0, 0x44c(%rbp)
14010d260:     	movb	$0x0, 0x477(%rbp)
14010d267:     	movaps	%xmm8, 0x300(%rbp)
14010d26f:     	movq	$0x0, 0x310(%rbp)
14010d27a:     	movups	0x58334a7(%rip), %xmm0  # 0x145940728
14010d281:     	movups	%xmm0, 0x318(%rbp)
14010d288:     	movq	$0x0, 0x328(%rbp)
14010d293:     	movups	0x58334a6(%rip), %xmm0  # 0x145940740
14010d29a:     	movaps	%xmm0, 0x330(%rbp)
14010d2a1:     	movq	$0x0, 0x340(%rbp)
14010d2ac:     	movups	0x58334a5(%rip), %xmm0  # 0x145940758
14010d2b3:     	movups	%xmm0, 0x348(%rbp)
14010d2ba:     	movq	$0x0, 0x358(%rbp)
14010d2c5:     	movw	$0x0, 0x46a(%rbp)
14010d2ce:     	movl	$0x10000, 0x466(%rbp)   # imm = 0x10000
14010d2d8:     	movw	$0x0, 0x470(%rbp)
14010d2e1:     	movl	$0x10000, 0x46c(%rbp)   # imm = 0x10000
14010d2eb:     	callq	0x140002200 <.text+0x1200>
14010d2f0:     	movl	$0x40, %ecx
14010d2f5:     	movl	$0x4, %edx
14010d2fa:     	callq	0x1400021c0 <.text+0x11c0>
14010d2ff:     	testq	%rax, %rax
14010d302:     	je	0x14010fd8f <.text+0x10ed8f>
14010d308:     	movq	%rax, 0x818(%rbp)
14010d30f:     	movups	0x5833baa(%rip), %xmm0  # 0x145940ec0
14010d316:     	movaps	%xmm0, 0x5e0(%rbp)
14010d31d:     	movl	$0x0, 0x5f0(%rbp)
14010d327:     	leaq	0x550(%rbp), %rcx
14010d32e:     	leaq	0x5e0(%rbp), %rdx
14010d335:     	callq	0x144c8c290 <.text+0x4c8b290>
14010d33a:     	nop
14010d33b:     	movaps	0x550(%rbp), %xmm11
14010d343:     	movaps	0x58328b6(%rip), %xmm0  # 0x14593fc00
14010d34a:     	movups	%xmm0, 0x5e4(%rbp)
14010d351:     	movl	$0x0, 0x5e0(%rbp)
14010d35b:     	leaq	0x550(%rbp), %rcx
14010d362:     	leaq	0x5e0(%rbp), %rdx
14010d369:     	callq	0x144c8c290 <.text+0x4c8b290>
14010d36e:     	nop
14010d36f:     	movaps	0x550(%rbp), %xmm0
14010d376:     	movabsq	$0x4190000000000002, %rax # imm = 0x4190000000000002
14010d380:     	movq	0x818(%rbp), %r12
14010d387:     	movq	%rax, (%r12)
14010d38b:     	movl	$0x1, 0x8(%r12)
14010d394:     	movups	%xmm11, 0xc(%r12)
14010d39a:     	movaps	0x583286f(%rip), %xmm1  # 0x14593fc10
14010d3a1:     	movups	%xmm1, 0x1c(%r12)
14010d3a7:     	movups	%xmm0, 0x2c(%r12)
14010d3ad:     	movl	$0x3f000000, 0x3c(%r12) # imm = 0x3F000000
14010d3b6:     	callq	0x140002200 <.text+0x1200>
14010d3bb:     	movl	$0x48, %ecx
14010d3c0:     	movl	$0x8, %edx
14010d3c5:     	callq	0x1400021c0 <.text+0x11c0>
14010d3ca:     	testq	%rax, %rax
14010d3cd:     	je	0x14010fda1 <.text+0x10eda1>
14010d3d3:     	movq	%rax, %rsi
14010d3d6:     	movq	$0x2, (%rax)
14010d3dd:     	movq	%r12, 0x8(%rax)
14010d3e1:     	movq	$0x2, 0x10(%rax)
14010d3e9:     	movq	$0x1, 0x18(%rax)
14010d3f1:     	movl	$0x2, 0x20(%rax)
14010d3f8:     	movss	0x5832820(%rip), %xmm0  # 0x14593fc20
14010d400:     	movlps	%xmm0, 0x24(%rax)
14010d404:     	movabsq	$0xa00000000, %rax      # imm = 0xA00000000
14010d40e:     	movq	%rax, 0x2c(%rsi)
14010d412:     	movb	$0x0, 0x40(%rsi)
14010d416:     	leaq	0x5e8(%rbp), %rcx
14010d41d:     	leaq	0x300(%rbp), %rdx
14010d424:     	movl	$0x180, %r8d            # imm = 0x180
14010d42a:     	callq	0x1457731ed <.text+0x57721ed>
14010d42f:     	movq	$0x1, 0x768(%rbp)
14010d43a:     	movq	%rsi, 0x770(%rbp)
14010d441:     	movq	$0x1, 0x778(%rbp)
14010d44c:     	movq	%r14, 0x5e0(%rbp)
14010d453:     	movb	$0x1, 0x825(%rbp)
14010d45a:     	leaq	0x300(%rbp), %rcx
14010d461:     	leaq	0x5e0(%rbp), %r8
14010d468:     	movq	%rdi, %rdx
14010d46b:     	callq	0x1400da640 <.text+0xd9640>
14010d470:     	nop
14010d471:     	xorps	%xmm11, %xmm11
14010d475:     	movups	%xmm11, 0x660(%rbp)
14010d47d:     	movups	%xmm11, 0x650(%rbp)
14010d485:     	movups	%xmm11, 0x680(%rbp)
14010d48d:     	movups	%xmm11, 0x690(%rbp)
14010d495:     	movl	$0x0, 0x760(%rbp)
14010d49f:     	movw	$0x0, 0x764(%rbp)
14010d4a8:     	movaps	%xmm8, 0x300(%rbp)
14010d4b0:     	movq	$0x0, 0x310(%rbp)
14010d4bb:     	movups	0x5833266(%rip), %xmm0  # 0x145940728
14010d4c2:     	movups	%xmm0, 0x318(%rbp)
14010d4c9:     	movq	$0x0, 0x328(%rbp)
14010d4d4:     	movups	0x5833265(%rip), %xmm0  # 0x145940740
14010d4db:     	movaps	%xmm0, 0x330(%rbp)
14010d4e2:     	movq	$0x0, 0x340(%rbp)
14010d4ed:     	movups	0x5833264(%rip), %xmm0  # 0x145940758
14010d4f4:     	movups	%xmm0, 0x348(%rbp)
14010d4fb:     	movq	$0x0, 0x358(%rbp)
14010d506:     	movq	0x350(%rbp), %rax
14010d50d:     	movq	%rax, 0x638(%rbp)
14010d514:     	movq	0x358(%rbp), %rax
14010d51b:     	movq	%rax, 0x640(%rbp)
14010d522:     	movq	0x340(%rbp), %rax
14010d529:     	movq	%rax, 0x628(%rbp)
14010d530:     	movq	0x348(%rbp), %rax
14010d537:     	movq	%rax, 0x630(%rbp)
14010d53e:     	movaps	0x330(%rbp), %xmm0
14010d545:     	movups	%xmm0, 0x618(%rbp)
14010d54c:     	movaps	0x310(%rbp), %xmm0
14010d553:     	movups	%xmm0, 0x5f8(%rbp)
14010d55a:     	movaps	0x300(%rbp), %xmm0
14010d561:     	movq	0x320(%rbp), %rax
14010d568:     	movq	0x328(%rbp), %rcx
14010d56f:     	movq	%rax, 0x608(%rbp)
14010d576:     	movq	%rcx, 0x610(%rbp)
14010d57d:     	movups	%xmm0, 0x5e8(%rbp)
14010d584:     	movq	$0x0, 0x648(%rbp)
14010d58f:     	movaps	0x583269a(%rip), %xmm0  # 0x14593fc30
14010d596:     	movups	%xmm0, 0x670(%rbp)
14010d59d:     	movups	%xmm9, 0x6b0(%rbp)
14010d5a5:     	movups	%xmm15, 0x6a0(%rbp)
14010d5ad:     	movups	%xmm13, 0x6d0(%rbp)
14010d5b5:     	movups	0x583322c(%rip), %xmm0  # 0x1459407e8
14010d5bc:     	movups	%xmm0, 0x6c0(%rbp)
14010d5c3:     	movups	%xmm7, 0x6f0(%rbp)
14010d5ca:     	movups	0x5833237(%rip), %xmm0  # 0x145940808
14010d5d1:     	movups	%xmm0, 0x6e0(%rbp)
14010d5d8:     	movups	%xmm12, 0x710(%rbp)
14010d5e0:     	movups	0x5833241(%rip), %xmm0  # 0x145940828
14010d5e7:     	movups	%xmm0, 0x700(%rbp)
14010d5ee:     	movaps	0x57f9ecb(%rip), %xmm0  # 0x1459074c0
14010d5f5:     	movups	%xmm0, 0x720(%rbp)
14010d5fc:     	movl	$0x1, 0x730(%rbp)
14010d606:     	movq	$0x0, 0x734(%rbp)
14010d611:     	movb	$0x1, 0x73c(%rbp)
14010d618:     	movq	$0x0, 0x740(%rbp)
14010d623:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
14010d62d:     	movw	$0x0, 0x74c(%rbp)
14010d636:     	movw	$0x0, 0x752(%rbp)
14010d63f:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
14010d649:     	movw	$0x0, 0x758(%rbp)
14010d652:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
14010d65c:     	movw	$0x100, 0x75a(%rbp)     # imm = 0x100
14010d665:     	movl	$0x0, 0x75c(%rbp)
14010d66f:     	movsd	0x58325c9(%rip), %xmm0  # 0x14593fc40
14010d677:     	movsd	%xmm0, 0x768(%rbp)
14010d67f:     	movl	$0x3faccccd, 0x770(%rbp) # imm = 0x3FACCCCD
14010d689:     	movups	%xmm10, 0x784(%rbp)
14010d691:     	movups	%xmm14, 0x774(%rbp)
14010d699:     	movq	%r14, 0x5e0(%rbp)
14010d6a0:     	movb	$0x1, 0x825(%rbp)
14010d6a7:     	leaq	0x60(%rbp), %rcx
14010d6ab:     	leaq	0x5e0(%rbp), %r8
14010d6b2:     	movq	%rdi, %rdx
14010d6b5:     	callq	0x1400dbcf0 <.text+0xdacf0>
14010d6ba:     	nop
14010d6bb:     	movq	%r15, 0x178(%rbp)
14010d6c2:     	movq	0x540(%rbp), %rdx
14010d6c9:     	movq	0x28(%rdx), %r15
14010d6cd:     	movq	0x30(%rdx), %rax
14010d6d1:     	movq	%rax, 0x818(%rbp)
14010d6d8:     	movq	0x38(%rdx), %rdi
14010d6dc:     	movq	0x40(%rdx), %rax
14010d6e0:     	movq	%rax, 0x158(%rbp)
14010d6e7:     	movq	0x48(%rdx), %rax
14010d6eb:     	movq	%rax, 0x228(%rbp)
14010d6f2:     	movq	0x50(%rdx), %rax
14010d6f6:     	movq	%rax, 0x230(%rbp)
14010d6fd:     	movq	0x58(%rdx), %rax
14010d701:     	movq	%rax, 0x150(%rbp)
14010d708:     	movq	0x60(%rdx), %rax
14010d70c:     	movq	%rax, 0x2f8(%rbp)
14010d713:     	movq	0x68(%rdx), %rax
14010d717:     	movq	%rax, 0x160(%rbp)
14010d71e:     	movq	0x70(%rdx), %rax
14010d722:     	movq	%rax, 0x168(%rbp)
14010d729:     	movq	0x78(%rdx), %rax
14010d72d:     	movq	%rax, 0x170(%rbp)
14010d734:     	movq	0x60(%rbp), %rax
14010d738:     	movq	0x88(%rbp), %rcx
14010d73f:     	movq	%rax, 0x30(%rbp)
14010d743:     	movups	0x68(%rbp), %xmm0
14010d747:     	movups	%xmm0, 0x38(%rbp)
14010d74b:     	movups	0x78(%rbp), %xmm0
14010d74f:     	movups	%xmm0, 0x48(%rbp)
14010d753:     	movq	%rcx, 0x58(%rbp)
14010d757:     	movups	%xmm11, 0x660(%rbp)
14010d75f:     	movups	%xmm11, 0x650(%rbp)
14010d767:     	movups	%xmm11, 0x680(%rbp)
14010d76f:     	movups	%xmm11, 0x690(%rbp)
14010d777:     	movaps	%xmm12, %xmm6
14010d77b:     	movaps	%xmm9, %xmm3
14010d77f:     	movaps	%xmm8, %xmm14
14010d783:     	movaps	%xmm8, 0x300(%rbp)
14010d78b:     	movq	$0x0, 0x310(%rbp)
14010d796:     	movups	0x5832f8a(%rip), %xmm9  # 0x145940728
14010d79e:     	movups	%xmm9, 0x318(%rbp)
14010d7a6:     	movq	$0x0, 0x328(%rbp)
14010d7b1:     	movups	0x5832f87(%rip), %xmm10 # 0x145940740
14010d7b9:     	movaps	%xmm10, 0x330(%rbp)
14010d7c1:     	movq	$0x0, 0x340(%rbp)
14010d7cc:     	movups	0x5832f84(%rip), %xmm11 # 0x145940758
14010d7d4:     	movups	%xmm11, 0x348(%rbp)
14010d7dc:     	movq	$0x0, 0x358(%rbp)
14010d7e7:     	movq	0x350(%rbp), %rcx
14010d7ee:     	movq	%rcx, 0x638(%rbp)
14010d7f5:     	movq	0x358(%rbp), %rcx
14010d7fc:     	movq	%rcx, 0x640(%rbp)
14010d803:     	movq	0x340(%rbp), %rcx
14010d80a:     	movq	%rcx, 0x628(%rbp)
14010d811:     	movq	0x348(%rbp), %rcx
14010d818:     	movq	%rcx, 0x630(%rbp)
14010d81f:     	movaps	0x300(%rbp), %xmm0
14010d826:     	movaps	0x310(%rbp), %xmm1
14010d82d:     	movq	0x320(%rbp), %rcx
14010d834:     	movq	%rcx, 0x608(%rbp)
14010d83b:     	movq	0x328(%rbp), %rcx
14010d842:     	movaps	0x330(%rbp), %xmm2
14010d849:     	movups	%xmm2, 0x618(%rbp)
14010d850:     	movq	%rcx, 0x610(%rbp)
14010d857:     	movups	%xmm1, 0x5f8(%rbp)
14010d85e:     	movups	%xmm0, 0x5e8(%rbp)
14010d865:     	movq	$0x0, 0x648(%rbp)
14010d870:     	movaps	0x58058b9(%rip), %xmm0  # 0x145913130
14010d877:     	movups	%xmm0, 0x670(%rbp)
14010d87e:     	movaps	%xmm3, %xmm12
14010d882:     	movups	%xmm3, 0x6b0(%rbp)
14010d889:     	movaps	%xmm15, %xmm11
14010d88d:     	movups	%xmm15, 0x6a0(%rbp)
14010d895:     	movups	%xmm13, 0x6d0(%rbp)
14010d89d:     	movups	0x5832f63(%rip), %xmm9  # 0x145940808
14010d8a5:     	movaps	%xmm13, %xmm10
14010d8a9:     	movups	0x5832f37(%rip), %xmm13 # 0x1459407e8
14010d8b1:     	movups	%xmm13, 0x6c0(%rbp)
14010d8b9:     	movups	%xmm7, 0x6f0(%rbp)
14010d8c0:     	movups	%xmm9, 0x6e0(%rbp)
14010d8c8:     	movups	%xmm6, 0x710(%rbp)
14010d8cf:     	movups	0x5832f51(%rip), %xmm15 # 0x145940828
14010d8d7:     	movups	%xmm15, 0x700(%rbp)
14010d8df:     	movaps	0x583236a(%rip), %xmm0  # 0x14593fc50
14010d8e6:     	movups	%xmm0, 0x720(%rbp)
14010d8ed:     	movl	$0x1, 0x730(%rbp)
14010d8f7:     	movq	$0x0, 0x734(%rbp)
14010d902:     	movb	$0x1, 0x73c(%rbp)
14010d909:     	movq	$0x0, 0x740(%rbp)
14010d914:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
14010d91e:     	movw	$0x0, 0x74c(%rbp)
14010d927:     	movw	$0x0, 0x752(%rbp)
14010d930:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
14010d93a:     	movw	$0x0, 0x758(%rbp)
14010d943:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
14010d94d:     	movl	$0x0, 0x75a(%rbp)
14010d957:     	movabsq	$0x500000500000001, %rcx # imm = 0x500000500000001
14010d961:     	movq	%rcx, 0x75e(%rbp)
14010d968:     	movq	(%rdx), %rcx
14010d96b:     	movq	%rcx, 0x538(%rbp)
14010d972:     	movq	%rax, 0x5e0(%rbp)
14010d979:     	movq	0x8(%rdx), %rax
14010d97d:     	movq	%rax, 0x548(%rbp)
14010d984:     	movb	$0x0, 0x824(%rbp)
14010d98b:     	movq	0x10(%rdx), %r14
14010d98f:     	leaq	0x38(%rbp), %rdx
14010d993:     	movq	%rbp, %rcx
14010d996:     	leaq	0x5e0(%rbp), %r8
14010d99d:     	callq	0x1400d7270 <.text+0xd6270>
14010d9a2:     	nop
14010d9a3:     	movq	(%rbp), %r12
14010d9a7:     	movq	0x28(%rbp), %rax
14010d9ab:     	movq	%r12, 0xf0(%rbp)
14010d9b2:     	leaq	0xf8(%rbp), %rsi
14010d9b9:     	movups	0x8(%rbp), %xmm0
14010d9bd:     	movups	%xmm0, 0xf8(%rbp)
14010d9c4:     	movups	0x18(%rbp), %xmm0
14010d9c8:     	movups	%xmm0, 0x108(%rbp)
14010d9cf:     	movq	%rax, 0x118(%rbp)
14010d9d6:     	xorps	%xmm8, %xmm8
14010d9da:     	movaps	%xmm8, 0x3a0(%rbp)
14010d9e2:     	movaps	%xmm8, 0x390(%rbp)
14010d9ea:     	movaps	%xmm8, 0x380(%rbp)
14010d9f2:     	movaps	%xmm8, 0x370(%rbp)
14010d9fa:     	movaps	%xmm8, 0x360(%rbp)
14010da02:     	movq	$0x0, 0x3b0(%rbp)
14010da0d:     	movups	%xmm11, 0x3b8(%rbp)
14010da15:     	movups	%xmm12, 0x3c8(%rbp)
14010da1d:     	movups	%xmm13, 0x3d8(%rbp)
14010da25:     	movaps	%xmm10, %xmm13
14010da29:     	movups	%xmm10, 0x3e8(%rbp)
14010da31:     	movups	%xmm9, 0x3f8(%rbp)
14010da39:     	movups	%xmm7, 0x408(%rbp)
14010da40:     	movups	%xmm6, 0x428(%rbp)
14010da47:     	movups	%xmm15, 0x418(%rbp)
14010da4f:     	movaps	%xmm14, 0x300(%rbp)
14010da57:     	movq	$0x0, 0x310(%rbp)
14010da62:     	movups	0x5832cbf(%rip), %xmm0  # 0x145940728
14010da69:     	movups	%xmm0, 0x318(%rbp)
14010da70:     	movq	$0x0, 0x328(%rbp)
14010da7b:     	movups	0x5832cbe(%rip), %xmm0  # 0x145940740
14010da82:     	movaps	%xmm0, 0x330(%rbp)
14010da89:     	movq	$0x0, 0x340(%rbp)
14010da94:     	movups	0x5832cbd(%rip), %xmm0  # 0x145940758
14010da9b:     	movups	%xmm0, 0x348(%rbp)
14010daa2:     	movq	$0x0, 0x358(%rbp)
14010daad:     	leaq	0x5e8(%rbp), %rcx
14010dab4:     	leaq	0x300(%rbp), %rdx
14010dabb:     	movl	$0x138, %r8d            # imm = 0x138
14010dac1:     	callq	0x1457731ed <.text+0x57721ed>
14010dac6:     	movaps	0x57f99f2(%rip), %xmm10 # 0x1459074c0
14010dace:     	movups	%xmm10, 0x720(%rbp)
14010dad6:     	movl	$0x1, 0x730(%rbp)
14010dae0:     	movq	$0x0, 0x734(%rbp)
14010daeb:     	movb	$0x1, 0x73c(%rbp)
14010daf2:     	movq	$0x0, 0x740(%rbp)
14010dafd:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
14010db07:     	movw	$0x0, 0x74c(%rbp)
14010db10:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
14010db1a:     	movw	$0x0, 0x752(%rbp)
14010db23:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
14010db2d:     	movw	$0x0, 0x758(%rbp)
14010db36:     	movl	$0x0, 0x75a(%rbp)
14010db40:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
14010db4a:     	movq	%rax, 0x75e(%rbp)
14010db51:     	movq	%r12, 0x238(%rbp)
14010db58:     	movq	%r12, 0x5e0(%rbp)
14010db5f:     	movb	$0x0, 0x827(%rbp)
14010db66:     	leaq	0x240(%rbp), %rcx
14010db6d:     	leaq	0x5e0(%rbp), %r8
14010db74:     	movq	%rsi, %rdx
14010db77:     	callq	0x1400d7270 <.text+0xd6270>
14010db7c:     	nop
14010db7d:     	movaps	%xmm9, %xmm14
14010db81:     	movq	0x240(%rbp), %r13
14010db88:     	movq	0x268(%rbp), %rax
14010db8f:     	movq	%r13, 0x290(%rbp)
14010db96:     	movups	0x248(%rbp), %xmm0
14010db9d:     	movups	%xmm0, 0x298(%rbp)
14010dba4:     	movups	0x258(%rbp), %xmm0
14010dbab:     	movups	%xmm0, 0x2a8(%rbp)
14010dbb2:     	movq	%rax, 0x2b8(%rbp)
14010dbb9:     	movw	$0x0, 0x744(%rbp)
14010dbc2:     	movb	$0x1, 0x734(%rbp)
14010dbc9:     	movaps	%xmm8, 0x640(%rbp)
14010dbd1:     	movaps	%xmm8, 0x650(%rbp)
14010dbd9:     	movaps	%xmm8, 0x660(%rbp)
14010dbe1:     	movaps	%xmm8, 0x670(%rbp)
14010dbe9:     	movaps	%xmm8, 0x680(%rbp)
14010dbf1:     	movq	$0x0, 0x690(%rbp)
14010dbfc:     	movl	$0x0, 0x758(%rbp)
14010dc06:     	movw	$0x0, 0x75c(%rbp)
14010dc0f:     	movups	%xmm11, 0x698(%rbp)
14010dc17:     	movups	%xmm12, 0x6a8(%rbp)
14010dc1f:     	movaps	0x580ac0a(%rip), %xmm0  # 0x145918830
14010dc26:     	movups	%xmm0, 0x6b8(%rbp)
14010dc2d:     	movaps	0x5831bbc(%rip), %xmm0  # 0x14593f7f0
14010dc34:     	movups	%xmm0, 0x6c8(%rbp)
14010dc3b:     	movups	%xmm9, 0x6d8(%rbp)
14010dc43:     	movups	%xmm7, 0x6e8(%rbp)
14010dc4a:     	movaps	0x5831c3e(%rip), %xmm15 # 0x14593f890
14010dc52:     	movups	%xmm15, 0x6f8(%rbp)
14010dc5a:     	movups	%xmm15, 0x708(%rbp)
14010dc62:     	movb	$0x0, 0x756(%rbp)
14010dc69:     	movl	$0x0, 0x752(%rbp)
14010dc73:     	movq	$0x0, 0x738(%rbp)
14010dc7e:     	movl	$0x3f800000, 0x740(%rbp) # imm = 0x3F800000
14010dc88:     	movups	%xmm10, 0x718(%rbp)
14010dc90:     	movl	$0x1, 0x728(%rbp)
14010dc9a:     	movq	$0x0, 0x72c(%rbp)
14010dca5:     	movb	$0x0, 0x757(%rbp)
14010dcac:     	movups	0x5832a5d(%rip), %xmm6  # 0x145940710
14010dcb3:     	movaps	%xmm6, 0x5e0(%rbp)
14010dcba:     	movq	$0x0, 0x5f0(%rbp)
14010dcc5:     	movups	0x5832a5b(%rip), %xmm8  # 0x145940728
14010dccd:     	movups	%xmm8, 0x5f8(%rbp)
14010dcd5:     	movq	$0x0, 0x608(%rbp)
14010dce0:     	movups	0x5832a59(%rip), %xmm0  # 0x145940740
14010dce7:     	movaps	%xmm0, 0x610(%rbp)
14010dcee:     	movq	$0x0, 0x620(%rbp)
14010dcf9:     	movups	0x5832a57(%rip), %xmm9  # 0x145940758
14010dd01:     	movups	%xmm9, 0x628(%rbp)
14010dd09:     	movq	$0x0, 0x638(%rbp)
14010dd14:     	movw	$0x0, 0x74a(%rbp)
14010dd1d:     	movl	$0x10000, 0x746(%rbp)   # imm = 0x10000
14010dd27:     	movw	$0x0, 0x750(%rbp)
14010dd30:     	movl	$0x10000, 0x74c(%rbp)   # imm = 0x10000
14010dd3a:     	movl	0x10(%rbx), %eax
14010dd3d:     	movl	%eax, 0x190(%rbp)
14010dd43:     	movups	(%rbx), %xmm0
14010dd46:     	movaps	%xmm0, 0x180(%rbp)
14010dd4d:     	movups	(%rbx), %xmm0
14010dd50:     	movaps	%xmm0, 0x1f0(%rbp)
14010dd57:     	movl	$0x3f333333, 0x200(%rbp) # imm = 0x3F333333
14010dd61:     	leaq	0x550(%rbp), %rcx
14010dd68:     	leaq	0x1f0(%rbp), %rdx
14010dd6f:     	callq	0x144c8c290 <.text+0x4c8b290>
14010dd74:     	nop
14010dd75:     	movaps	0x550(%rbp), %xmm0
14010dd7c:     	movups	%xmm0, 0x304(%rbp)
14010dd83:     	movl	$0x1, 0x300(%rbp)
14010dd8d:     	movl	$0x41900000, 0x48(%rsp) # imm = 0x41900000
14010dd95:     	movl	$0x1, 0x40(%rsp)
14010dd9d:     	movl	$0x0, 0x38(%rsp)
14010dda5:     	movl	$0x1, 0x30(%rsp)
14010ddad:     	movl	$0x0, 0x28(%rsp)
14010ddb5:     	movl	$0x1, 0x20(%rsp)
14010ddbd:     	leaq	0x550(%rbp), %rcx
14010ddc4:     	leaq	0x300(%rbp), %rdx
14010ddcb:     	xorps	%xmm3, %xmm3
14010ddce:     	movl	$0x1, %r8d
14010ddd4:     	callq	0x14265f6a0 <.text+0x265e6a0>
14010ddd9:     	nop
14010ddda:     	leaq	0x298(%rbp), %rbx
14010dde1:     	leaq	0x300(%rbp), %rsi
14010dde8:     	leaq	0x5e0(%rbp), %rdx
14010ddef:     	movl	$0x180, %r8d            # imm = 0x180
14010ddf5:     	movq	%rsi, %rcx
14010ddf8:     	callq	0x1457731ed <.text+0x57721ed>
14010ddfd:     	movaps	0x180(%rbp), %xmm0
14010de04:     	movups	%xmm0, 0x480(%rbp)
14010de0b:     	movl	0x190(%rbp), %eax
14010de11:     	movl	%eax, 0x490(%rbp)
14010de17:     	movups	0x550(%rbp), %xmm0
14010de1e:     	movups	%xmm0, 0x498(%rbp)
14010de25:     	movq	0x560(%rbp), %rax
14010de2c:     	movq	%rax, 0x4a8(%rbp)
14010de33:     	leaq	0x5e8(%rbp), %rcx
14010de3a:     	movl	$0x1b0, %r8d            # imm = 0x1B0
14010de40:     	movq	%rsi, %rdx
14010de43:     	callq	0x1457731ed <.text+0x57721ed>
14010de48:     	movq	%r13, 0x5e0(%rbp)
14010de4f:     	movb	$0x0, 0x826(%rbp)
14010de56:     	leaq	0x550(%rbp), %rcx
14010de5d:     	leaq	0x5e0(%rbp), %r8
14010de64:     	movq	%rbx, %rdx
14010de67:     	callq	0x1400d98d0 <.text+0xd88d0>
14010de6c:     	nop
14010de6d:     	movq	0x8(%r15), %rdx
14010de71:     	movq	0x10(%r15), %r8
14010de75:     	movb	$0x0, 0x826(%rbp)
14010de7c:     	leaq	0x5e0(%rbp), %rcx
14010de83:     	callq	0x1401f9790 <.text+0x1f8790>
14010de88:     	nop
14010de89:     	movq	0x5f0(%rbp), %rax
14010de90:     	movq	%rax, 0x310(%rbp)
14010de97:     	movups	0x5e0(%rbp), %xmm0
14010de9e:     	movaps	%xmm0, 0x300(%rbp)
14010dea5:     	movq	0x818(%rbp), %rax
14010deac:     	movq	(%rax), %rax
14010deaf:     	cmpb	$0x1, (%rax)
14010deb2:     	jne	0x14010ded2 <.text+0x10ced2>
14010deb4:     	movl	0x1(%rax), %ecx
14010deb7:     	movl	0x4(%rax), %edx
14010deba:     	movl	%edx, 0x1f3(%rbp)
14010dec0:     	movl	%ecx, 0x1f0(%rbp)
14010dec6:     	movzbl	0x10(%rax), %ecx
14010deca:     	addq	$0x8, %rax
14010dece:     	movb	$0x1, %dl
14010ded0:     	jmp	0x14010dee6 <.text+0x10cee6>
14010ded2:     	movq	0x8(%rax), %rcx
14010ded6:     	lock
14010ded7:     	incq	(%rcx)
14010deda:     	jle	0x14010fdca <.text+0x10edca>
14010dee0:     	addq	$0x8, %rax
14010dee4:     	xorl	%edx, %edx
14010dee6:     	movq	(%rax), %rax
14010dee9:     	movq	$0x0, 0x5f8(%rbp)
14010def4:     	movq	$0x4, 0x600(%rbp)
14010deff:     	movq	$0x0, 0x608(%rbp)
14010df0a:     	movaps	0x300(%rbp), %xmm0
14010df11:     	movaps	%xmm0, 0x5e0(%rbp)
14010df18:     	movq	0x310(%rbp), %r8
14010df1f:     	movq	%r8, 0x5f0(%rbp)
14010df26:     	movb	%dl, 0x610(%rbp)
14010df2c:     	movl	0x1f0(%rbp), %edx
14010df32:     	movl	0x1f3(%rbp), %r8d
14010df39:     	movl	%edx, 0x611(%rbp)
14010df3f:     	movl	%r8d, 0x614(%rbp)
14010df46:     	movq	%rax, 0x618(%rbp)
14010df4d:     	movq	%rcx, 0x620(%rbp)
14010df54:     	movl	$0x41500000, 0x628(%rbp) # imm = 0x41500000
14010df5e:     	movw	$0x190, 0x62c(%rbp)     # imm = 0x190
14010df67:     	movb	$0x1, 0x62e(%rbp)
14010df6e:     	movups	0x5832a63(%rip), %xmm0  # 0x1459409d8
14010df75:     	movaps	%xmm0, 0x630(%rbp)
14010df7c:     	movl	$0x3f800000, 0x640(%rbp) # imm = 0x3F800000
14010df86:     	movb	$0x0, 0x826(%rbp)
14010df8d:     	leaq	0x550(%rbp), %rcx
14010df94:     	leaq	0x5e0(%rbp), %rdx
14010df9b:     	callq	0x1400f16c0 <.text+0xf06c0>
14010dfa0:     	nop
14010dfa1:     	movq	0x818(%rbp), %rax
14010dfa8:     	movq	(%rax), %rcx
14010dfab:     	cmpb	$0x1, 0x18(%rcx)
14010dfaf:     	jne	0x14010dfcf <.text+0x10cfcf>
14010dfb1:     	movl	0x19(%rcx), %eax
14010dfb4:     	movl	0x1c(%rcx), %edx
14010dfb7:     	movl	%edx, 0x303(%rbp)
14010dfbd:     	movl	%eax, 0x300(%rbp)
14010dfc3:     	movq	0x20(%rcx), %rax
14010dfc7:     	movzbl	0x28(%rcx), %edx
14010dfcb:     	movb	$0x1, %cl
14010dfcd:     	jmp	0x14010dfdf <.text+0x10cfdf>
14010dfcf:     	movq	0x20(%rcx), %rax
14010dfd3:     	lock
14010dfd4:     	incq	(%rax)
14010dfd7:     	jle	0x14010fdca <.text+0x10edca>
14010dfdd:     	xorl	%ecx, %ecx
14010dfdf:     	movl	0x300(%rbp), %r8d
14010dfe6:     	movl	0x303(%rbp), %r9d
14010dfed:     	movl	%r9d, 0x61c(%rbp)
14010dff4:     	movl	%r8d, 0x619(%rbp)
14010dffb:     	movups	0x58326fa(%rip), %xmm0  # 0x1459406fc
14010e002:     	movups	%xmm0, 0x551(%rbp)
14010e009:     	movl	$0x3f800000, 0x561(%rbp) # imm = 0x3F800000
14010e013:     	movq	0x538(%rbp), %r8
14010e01a:     	movq	%r8, 0x5e8(%rbp)
14010e021:     	movq	0x548(%rbp), %r8
14010e028:     	movq	%r8, 0x5f0(%rbp)
14010e02f:     	movq	%r14, 0x5f8(%rbp)
14010e036:     	movq	$0x0, 0x600(%rbp)
14010e041:     	movq	$0x4, 0x608(%rbp)
14010e04c:     	movq	$0x0, 0x610(%rbp)
14010e057:     	movb	%cl, 0x618(%rbp)
14010e05d:     	movq	%rax, 0x620(%rbp)
14010e064:     	movq	%rdx, 0x628(%rbp)
14010e06b:     	movl	$0x42780000, 0x630(%rbp) # imm = 0x42780000
14010e075:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
14010e07e:     	movb	$0x1, 0x636(%rbp)
14010e085:     	movq	0x55d(%rbp), %rax
14010e08c:     	movq	%rax, 0x644(%rbp)
14010e093:     	movups	0x550(%rbp), %xmm0
14010e09a:     	movups	%xmm0, 0x637(%rbp)
14010e0a1:     	movl	$0x0, 0x64c(%rbp)
14010e0ab:     	movaps	0x58319ce(%rip), %xmm0  # 0x14593fa80
14010e0b2:     	movups	%xmm0, 0x650(%rbp)
14010e0b9:     	movsd	0x5831b9f(%rip), %xmm0  # 0x14593fc60
14010e0c1:     	movsd	%xmm0, 0x660(%rbp)
14010e0c9:     	movq	%r13, 0x5e0(%rbp)
14010e0d0:     	movb	$0x1, 0x826(%rbp)
14010e0d7:     	leaq	0x300(%rbp), %rcx
14010e0de:     	leaq	0x5e0(%rbp), %r8
14010e0e5:     	movq	%rbx, %rdx
14010e0e8:     	callq	0x1400dbfa0 <.text+0xdafa0>
14010e0ed:     	nop
14010e0ee:     	movq	0x8(%rdi), %rsi
14010e0f2:     	testq	%rsi, %rsi
14010e0f5:     	jns	0x14010e112 <.text+0x10d112>
14010e0f7:     	xorl	%r15d, %r15d
14010e0fa:     	movb	$0x1, 0x826(%rbp)
14010e101:     	movq	%r15, %rcx
14010e104:     	movq	%rsi, %rdx
14010e107:     	callq	0x14590379b <.text+0x590279b>
14010e10c:     	nop
14010e10d:     	jmp	0x14010fdca <.text+0x10edca>
14010e112:     	movq	0x818(%rbp), %rax
14010e119:     	movq	(%rax), %r12
14010e11c:     	je	0x14010e17b <.text+0x10d17b>
14010e11e:     	movq	(%rdi), %r14
14010e121:     	callq	0x140002200 <.text+0x1200>
14010e126:     	movl	$0x1, %r15d
14010e12c:     	movl	$0x1, %edx
14010e131:     	movq	%rsi, %rcx
14010e134:     	callq	0x1400021c0 <.text+0x11c0>
14010e139:     	testq	%rax, %rax
14010e13c:     	je	0x14010e0fa <.text+0x10d0fa>
14010e13e:     	movq	%rax, %rdi
14010e141:     	movq	%rax, %rcx
14010e144:     	movq	%r14, %rdx
14010e147:     	movq	%rsi, %r8
14010e14a:     	callq	0x1457731ed <.text+0x57721ed>
14010e14f:     	cmpb	$0x1, (%r12)
14010e154:     	jne	0x14010e187 <.text+0x10d187>
14010e156:     	movl	0x1(%r12), %eax
14010e15b:     	movl	0x4(%r12), %ecx
14010e160:     	movl	%ecx, 0x303(%rbp)
14010e166:     	movl	%eax, 0x300(%rbp)
14010e16c:     	movq	0x8(%r12), %rax
14010e171:     	movzbl	0x10(%r12), %edx
14010e177:     	movb	$0x1, %cl
14010e179:     	jmp	0x14010e198 <.text+0x10d198>
14010e17b:     	movl	$0x1, %edi
14010e180:     	cmpb	$0x1, (%r12)
14010e185:     	je	0x14010e156 <.text+0x10d156>
14010e187:     	movq	0x8(%r12), %rax
14010e18c:     	lock
14010e18d:     	incq	(%rax)
14010e190:     	jle	0x14010fdca <.text+0x10edca>
14010e196:     	xorl	%ecx, %ecx
14010e198:     	movl	0x300(%rbp), %r8d
14010e19f:     	movl	0x303(%rbp), %r9d
14010e1a6:     	movl	%r9d, 0x61c(%rbp)
14010e1ad:     	movl	%r8d, 0x619(%rbp)
14010e1b4:     	movups	0x5832511(%rip), %xmm0  # 0x1459406cc
14010e1bb:     	movups	%xmm0, 0x551(%rbp)
14010e1c2:     	movl	$0x3f800000, 0x561(%rbp) # imm = 0x3F800000
14010e1cc:     	movq	%rsi, 0x5e8(%rbp)
14010e1d3:     	movq	%rdi, 0x5f0(%rbp)
14010e1da:     	movq	%rsi, 0x5f8(%rbp)
14010e1e1:     	movq	$0x0, 0x600(%rbp)
14010e1ec:     	movq	$0x4, 0x608(%rbp)
14010e1f7:     	movq	$0x0, 0x610(%rbp)
14010e202:     	movb	%cl, 0x618(%rbp)
14010e208:     	movq	%rax, 0x620(%rbp)
14010e20f:     	movq	%rdx, 0x628(%rbp)
14010e216:     	movl	$0x41800000, 0x630(%rbp) # imm = 0x41800000
14010e220:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
14010e229:     	movb	$0x1, 0x636(%rbp)
14010e230:     	movq	0x55d(%rbp), %rax
14010e237:     	movq	%rax, 0x644(%rbp)
14010e23e:     	movups	0x550(%rbp), %xmm0
14010e245:     	movups	%xmm0, 0x637(%rbp)
14010e24c:     	movl	0x580af2e(%rip), %eax   # 0x145919180
14010e252:     	movl	%eax, 0x65c(%rbp)
14010e258:     	movups	0x580af11(%rip), %xmm0  # 0x145919170
14010e25f:     	movups	%xmm0, 0x64c(%rbp)
14010e266:     	movsd	0x5807562(%rip), %xmm0  # 0x1459157d0
14010e26e:     	movsd	%xmm0, 0x660(%rbp)
14010e276:     	movq	%r13, 0x5e0(%rbp)
14010e27d:     	movb	$0x1, 0x826(%rbp)
14010e284:     	leaq	0x300(%rbp), %rcx
14010e28b:     	leaq	0x5e0(%rbp), %r8
14010e292:     	movq	%rbx, %rdx
14010e295:     	callq	0x1400dbfa0 <.text+0xdafa0>
14010e29a:     	nop
14010e29b:     	xorps	%xmm0, %xmm0
14010e29e:     	movaps	%xmm0, 0x3a0(%rbp)
14010e2a5:     	movaps	%xmm0, 0x390(%rbp)
14010e2ac:     	movaps	%xmm0, 0x380(%rbp)
14010e2b3:     	movaps	%xmm0, 0x370(%rbp)
14010e2ba:     	movaps	%xmm0, 0x360(%rbp)
14010e2c1:     	movq	$0x0, 0x3b0(%rbp)
14010e2cc:     	movups	%xmm11, 0x3b8(%rbp)
14010e2d4:     	movups	%xmm12, 0x3c8(%rbp)
14010e2dc:     	movups	0x5832505(%rip), %xmm0  # 0x1459407e8
14010e2e3:     	movups	%xmm0, 0x3d8(%rbp)
14010e2ea:     	movups	%xmm13, 0x3e8(%rbp)
14010e2f2:     	movups	%xmm14, 0x3f8(%rbp)
14010e2fa:     	movups	%xmm7, 0x408(%rbp)
14010e301:     	movups	0x5832530(%rip), %xmm1  # 0x145940838
14010e308:     	movups	%xmm1, 0x428(%rbp)
14010e30f:     	movups	0x5832512(%rip), %xmm1  # 0x145940828
14010e316:     	movups	%xmm1, 0x418(%rbp)
14010e31d:     	movaps	%xmm6, 0x300(%rbp)
14010e324:     	movaps	%xmm0, %xmm6
14010e327:     	movq	$0x0, 0x310(%rbp)
14010e332:     	movups	%xmm8, 0x318(%rbp)
14010e33a:     	movq	$0x0, 0x328(%rbp)
14010e345:     	movups	0x58323f4(%rip), %xmm0  # 0x145940740
14010e34c:     	movaps	%xmm0, 0x330(%rbp)
14010e353:     	movq	$0x0, 0x340(%rbp)
14010e35e:     	movups	%xmm9, 0x348(%rbp)
14010e366:     	movq	$0x0, 0x358(%rbp)
14010e371:     	leaq	0x5e8(%rbp), %rcx
14010e378:     	leaq	0x300(%rbp), %rdx
14010e37f:     	movl	$0x138, %r8d            # imm = 0x138
14010e385:     	callq	0x1457731ed <.text+0x57721ed>
14010e38a:     	movups	%xmm10, 0x720(%rbp)
14010e392:     	movl	$0x1, 0x730(%rbp)
14010e39c:     	movss	0x58318cc(%rip), %xmm0  # 0x14593fc70
14010e3a4:     	movlps	%xmm0, 0x734(%rbp)
14010e3ab:     	movb	$0x1, 0x73c(%rbp)
14010e3b2:     	movq	$0x0, 0x740(%rbp)
14010e3bd:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
14010e3c7:     	movw	$0x0, 0x74c(%rbp)
14010e3d0:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
14010e3da:     	movw	$0x0, 0x752(%rbp)
14010e3e3:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
14010e3ed:     	movw	$0x0, 0x758(%rbp)
14010e3f6:     	movq	$0x0, 0x75a(%rbp)
14010e401:     	movl	$0x7, 0x762(%rbp)
14010e40b:     	movq	0x238(%rbp), %rax
14010e412:     	movq	%rax, 0x5e0(%rbp)
14010e419:     	movb	$0x1, 0x827(%rbp)
14010e420:     	leaq	0x240(%rbp), %rcx
14010e427:     	leaq	0x5e0(%rbp), %r8
14010e42e:     	leaq	0xf8(%rbp), %rdx
14010e435:     	callq	0x1400d7270 <.text+0xd6270>
14010e43a:     	nop
14010e43b:     	movq	0x240(%rbp), %rbx
14010e442:     	movq	0x268(%rbp), %rax
14010e449:     	movq	%rbx, 0x290(%rbp)
14010e450:     	movups	0x248(%rbp), %xmm0
14010e457:     	movups	%xmm0, 0x298(%rbp)
14010e45e:     	movups	0x258(%rbp), %xmm0
14010e465:     	movups	%xmm0, 0x2a8(%rbp)
14010e46c:     	movq	%rax, 0x2b8(%rbp)
14010e473:     	movq	0x158(%rbp), %rax
14010e47a:     	movq	0x10(%rax), %r13
14010e47e:     	testq	%r13, %r13
14010e481:     	je	0x14010e6f6 <.text+0x10d6f6>
14010e487:     	movq	0x8(%rax), %r14
14010e48b:     	shlq	$0x5, %r13
14010e48f:     	addq	%r14, %r13
14010e492:     	leaq	0x3b8(%rbp), %rdi
14010e499:     	leaq	0x5e8(%rbp), %r15
14010e4a0:     	xorl	%r12d, %r12d
14010e4a3:     	xorps	%xmm8, %xmm8
14010e4a7:     	movaps	0x580a571(%rip), %xmm9  # 0x145918a20
14010e4af:     	leaq	0x5e0(%rbp), %rsi
14010e4b6:     	jmp	0x14010e4d0 <.text+0x10d4d0>
14010e4b8:     	nopl	(%rax,%rax)
14010e4c0:     	addq	$0x20, %r14
14010e4c4:     	incq	%r12
14010e4c7:     	cmpq	%r13, %r14
14010e4ca:     	je	0x14010e6f6 <.text+0x10d6f6>
14010e4d0:     	movups	%xmm8, -0x18(%rdi)
14010e4d5:     	movups	%xmm8, -0x28(%rdi)
14010e4da:     	movups	%xmm8, -0x38(%rdi)
14010e4df:     	movups	%xmm8, -0x48(%rdi)
14010e4e4:     	movups	%xmm8, -0x58(%rdi)
14010e4e9:     	movq	$0x0, -0x8(%rdi)
14010e4f1:     	movups	%xmm12, 0x10(%rdi)
14010e4f6:     	movups	%xmm11, (%rdi)
14010e4fa:     	movups	%xmm13, 0x30(%rdi)
14010e4ff:     	movups	%xmm6, 0x20(%rdi)
14010e503:     	movups	%xmm7, 0x50(%rdi)
14010e507:     	movups	%xmm14, 0x40(%rdi)
14010e50c:     	movups	0x5832325(%rip), %xmm0  # 0x145940838
14010e513:     	movups	%xmm0, 0x70(%rdi)
14010e517:     	movups	0x583230a(%rip), %xmm0  # 0x145940828
14010e51e:     	movups	%xmm0, 0x60(%rdi)
14010e522:     	movups	0x58321e7(%rip), %xmm0  # 0x145940710
14010e529:     	movaps	%xmm0, 0x300(%rbp)
14010e530:     	movq	$0x0, 0x310(%rbp)
14010e53b:     	movups	0x58321e6(%rip), %xmm0  # 0x145940728
14010e542:     	movups	%xmm0, -0xa0(%rdi)
14010e549:     	movq	$0x0, -0x90(%rdi)
14010e554:     	movups	0x58321e5(%rip), %xmm0  # 0x145940740
14010e55b:     	movups	%xmm0, -0x88(%rdi)
14010e562:     	movq	$0x0, -0x78(%rdi)
14010e56a:     	movups	0x58321e7(%rip), %xmm0  # 0x145940758
14010e571:     	movups	%xmm0, -0x70(%rdi)
14010e575:     	movq	$0x0, -0x60(%rdi)
14010e57d:     	movl	$0x138, %r8d            # imm = 0x138
14010e583:     	movq	%r15, %rcx
14010e586:     	leaq	0x300(%rbp), %rdx
14010e58d:     	callq	0x1457731ed <.text+0x57721ed>
14010e592:     	movups	%xmm9, 0x720(%rbp)
14010e59a:     	movl	$0x1, 0x730(%rbp)
14010e5a4:     	movq	$0x0, 0x734(%rbp)
14010e5af:     	movb	$0x1, 0x73c(%rbp)
14010e5b6:     	movq	$0x0, 0x740(%rbp)
14010e5c1:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
14010e5cb:     	movw	$0x0, 0x74c(%rbp)
14010e5d4:     	movl	$0x10000, 0x166(%r15)   # imm = 0x10000
14010e5df:     	movw	$0x0, 0x16a(%r15)
14010e5e9:     	movw	$0x0, 0x170(%r15)
14010e5f3:     	movl	$0x10000, 0x16c(%r15)   # imm = 0x10000
14010e5fe:     	movl	$0x0, 0x75a(%rbp)
14010e608:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
14010e612:     	movq	%rax, 0x75e(%rbp)
14010e619:     	movq	%rbx, 0x5e0(%rbp)
14010e620:     	movb	$0x1, 0x827(%rbp)
14010e627:     	leaq	0x550(%rbp), %rcx
14010e62e:     	leaq	0x298(%rbp), %rdx
14010e635:     	movq	%rsi, %r8
14010e638:     	callq	0x1400d7270 <.text+0xd6270>
14010e63d:     	nop
14010e63e:     	movq	0x550(%rbp), %rax
14010e645:     	movq	0x578(%rbp), %rcx
14010e64c:     	movq	%rax, 0x5e0(%rbp)
14010e653:     	movups	0x558(%rbp), %xmm0
14010e65a:     	movups	%xmm0, 0x5e8(%rbp)
14010e661:     	movups	0x568(%rbp), %xmm0
14010e668:     	movups	%xmm0, 0x5f8(%rbp)
14010e66f:     	movq	%rcx, 0x608(%rbp)
14010e676:     	movq	0x818(%rbp), %rax
14010e67d:     	movq	(%rax), %rdx
14010e680:     	movq	0x228(%rbp), %rax
14010e687:     	movq	(%rax), %r8
14010e68a:     	movq	0x230(%rbp), %rax
14010e691:     	movq	(%rax), %r9
14010e694:     	movb	$0x1, 0x827(%rbp)
14010e69b:     	movq	%r14, 0x28(%rsp)
14010e6a0:     	movq	%r12, 0x20(%rsp)
14010e6a5:     	movq	%rsi, %rcx
14010e6a8:     	callq	0x1401f47e0 <.text+0x1f37e0>
14010e6ad:     	nop
14010e6ae:     	movq	0x150(%rbp), %rax
14010e6b5:     	cmpb	$0x1, (%rax)
14010e6b8:     	jne	0x14010e4c0 <.text+0x10d4c0>
14010e6be:     	movq	0x818(%rbp), %rax
14010e6c5:     	movq	(%rax), %rdx
14010e6c8:     	movq	0x2f8(%rbp), %rax
14010e6cf:     	movq	(%rax), %rax
14010e6d2:     	movq	0x38(%rax), %rax
14010e6d6:     	movb	$0x1, 0x827(%rbp)
14010e6dd:     	movq	%rax, 0x20(%rsp)
14010e6e2:     	movq	%rsi, %rcx
14010e6e5:     	movq	%r12, %r8
14010e6e8:     	movq	%r14, %r9
14010e6eb:     	callq	0x1401f3fa0 <.text+0x1f2fa0>
14010e6f0:     	nop
14010e6f1:     	jmp	0x14010e4c0 <.text+0x10d4c0>
14010e6f6:     	xorps	%xmm0, %xmm0
14010e6f9:     	movaps	%xmm0, 0x3a0(%rbp)
14010e700:     	movaps	%xmm0, 0x390(%rbp)
14010e707:     	movaps	%xmm0, 0x380(%rbp)
14010e70e:     	movaps	%xmm0, 0x370(%rbp)
14010e715:     	movaps	%xmm0, 0x360(%rbp)
14010e71c:     	movq	$0x0, 0x3b0(%rbp)
14010e727:     	movups	%xmm11, 0x3b8(%rbp)
14010e72f:     	movups	%xmm12, 0x3c8(%rbp)
14010e737:     	movups	%xmm6, 0x3d8(%rbp)
14010e73e:     	movups	%xmm13, 0x3e8(%rbp)
14010e746:     	movups	%xmm14, 0x3f8(%rbp)
14010e74e:     	movups	%xmm7, 0x408(%rbp)
14010e755:     	movups	0x58320dc(%rip), %xmm0  # 0x145940838
14010e75c:     	movups	%xmm0, 0x428(%rbp)
14010e763:     	movups	0x58320be(%rip), %xmm0  # 0x145940828
14010e76a:     	movups	%xmm0, 0x418(%rbp)
14010e771:     	movups	0x5831f98(%rip), %xmm0  # 0x145940710
14010e778:     	movaps	%xmm0, 0x300(%rbp)
14010e77f:     	movq	$0x0, 0x310(%rbp)
14010e78a:     	movups	0x5831f97(%rip), %xmm0  # 0x145940728
14010e791:     	movups	%xmm0, 0x318(%rbp)
14010e798:     	movq	$0x0, 0x328(%rbp)
14010e7a3:     	movups	0x5831f96(%rip), %xmm0  # 0x145940740
14010e7aa:     	movaps	%xmm0, 0x330(%rbp)
14010e7b1:     	movq	$0x0, 0x340(%rbp)
14010e7bc:     	movups	0x5831f95(%rip), %xmm0  # 0x145940758
14010e7c3:     	movups	%xmm0, 0x348(%rbp)
14010e7ca:     	movq	$0x0, 0x358(%rbp)
14010e7d5:     	leaq	0x5e8(%rbp), %rcx
14010e7dc:     	leaq	0x300(%rbp), %rdx
14010e7e3:     	movl	$0x138, %r8d            # imm = 0x138
14010e7e9:     	callq	0x1457731ed <.text+0x57721ed>
14010e7ee:     	movups	%xmm10, 0x720(%rbp)
14010e7f6:     	movl	$0x1, 0x730(%rbp)
14010e800:     	movss	0x58070d0(%rip), %xmm0  # 0x1459158d8
14010e808:     	movlps	%xmm0, 0x734(%rbp)
14010e80f:     	movb	$0x1, 0x73c(%rbp)
14010e816:     	movq	$0x0, 0x740(%rbp)
14010e821:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
14010e82b:     	movw	$0x0, 0x74c(%rbp)
14010e834:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
14010e83e:     	movw	$0x0, 0x752(%rbp)
14010e847:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
14010e851:     	movw	$0x0, 0x758(%rbp)
14010e85a:     	movq	$0x0, 0x75a(%rbp)
14010e865:     	movl	$0x5, 0x762(%rbp)
14010e86f:     	movq	0x238(%rbp), %rax
14010e876:     	movq	%rax, 0x5e0(%rbp)
14010e87d:     	movb	$0x1, 0x827(%rbp)
14010e884:     	leaq	-0x30(%rbp), %rcx
14010e888:     	leaq	0x5e0(%rbp), %r8
14010e88f:     	leaq	0xf8(%rbp), %rdx
14010e896:     	callq	0x1400d7270 <.text+0xd6270>
14010e89b:     	nop
14010e89c:     	movq	-0x30(%rbp), %rax
14010e8a0:     	movq	-0x8(%rbp), %rcx
14010e8a4:     	movq	%rax, 0x120(%rbp)
14010e8ab:     	movups	-0x28(%rbp), %xmm0
14010e8af:     	movups	%xmm0, 0x128(%rbp)
14010e8b6:     	movups	-0x18(%rbp), %xmm0
14010e8ba:     	movups	%xmm0, 0x138(%rbp)
14010e8c1:     	movq	%rcx, 0x148(%rbp)
14010e8c8:     	movq	0x818(%rbp), %rax
14010e8cf:     	movq	(%rax), %rdx
14010e8d2:     	movq	0x228(%rbp), %rax
14010e8d9:     	movq	(%rax), %r8
14010e8dc:     	movq	0x230(%rbp), %rax
14010e8e3:     	movq	(%rax), %r9
14010e8e6:     	movb	$0x1, 0x827(%rbp)
14010e8ed:     	movq	0x168(%rbp), %rax
14010e8f4:     	movq	%rax, 0x28(%rsp)
14010e8f9:     	movq	0x160(%rbp), %rax
14010e900:     	movq	%rax, 0x20(%rsp)
14010e905:     	leaq	0x120(%rbp), %rcx
14010e90c:     	callq	0x1401f8c40 <.text+0x1f7c40>
14010e911:     	nop
14010e912:     	leaq	0x128(%rbp), %rdi
14010e919:     	movq	0x170(%rbp), %rax
14010e920:     	cmpl	$0x1, (%rax)
14010e923:     	jne	0x14010ef0f <.text+0x10df0f>
14010e929:     	movq	0x8(%rax), %rax
14010e92d:     	movq	%rax, 0xc0(%rbp)
14010e934:     	movw	$0x0, 0x464(%rbp)
14010e93d:     	movb	$0x1, 0x454(%rbp)
14010e944:     	xorps	%xmm0, %xmm0
14010e947:     	movaps	%xmm0, 0x360(%rbp)
14010e94e:     	movaps	%xmm0, 0x370(%rbp)
14010e955:     	movaps	%xmm0, 0x380(%rbp)
14010e95c:     	movaps	%xmm0, 0x390(%rbp)
14010e963:     	movaps	%xmm0, 0x3a0(%rbp)
14010e96a:     	movq	$0x0, 0x3b0(%rbp)
14010e975:     	movl	$0x5, 0x47a(%rbp)
14010e97f:     	movups	%xmm11, 0x3b8(%rbp)
14010e987:     	movups	%xmm12, 0x3c8(%rbp)
14010e98f:     	movaps	0x580a06a(%rip), %xmm0  # 0x145918a00
14010e996:     	movups	%xmm0, 0x3d8(%rbp)
14010e99d:     	movaps	0x5809e0c(%rip), %xmm0  # 0x1459187b0
14010e9a4:     	movups	%xmm0, 0x3e8(%rbp)
14010e9ab:     	movaps	0x57f893e(%rip), %xmm0  # 0x1459072f0
14010e9b2:     	movups	%xmm0, 0x3f8(%rbp)
14010e9b9:     	movups	%xmm0, 0x408(%rbp)
14010e9c0:     	movaps	0x57f8939(%rip), %xmm0  # 0x145907300
14010e9c7:     	movups	%xmm0, 0x418(%rbp)
14010e9ce:     	movups	%xmm0, 0x428(%rbp)
14010e9d5:     	movq	$0x0, 0x458(%rbp)
14010e9e0:     	movl	$0x3f800000, 0x460(%rbp) # imm = 0x3F800000
14010e9ea:     	movups	%xmm10, 0x438(%rbp)
14010e9f2:     	movl	$0x1, 0x448(%rbp)
14010e9fc:     	movq	$0x0, 0x44c(%rbp)
14010ea07:     	movq	$0x0, 0x472(%rbp)
14010ea12:     	movups	0x5831cf7(%rip), %xmm0  # 0x145940710
14010ea19:     	movaps	%xmm0, 0x300(%rbp)
14010ea20:     	movq	$0x0, 0x310(%rbp)
14010ea2b:     	movups	0x5831cf6(%rip), %xmm0  # 0x145940728
14010ea32:     	movups	%xmm0, 0x318(%rbp)
14010ea39:     	movq	$0x0, 0x328(%rbp)
14010ea44:     	movups	0x5831cf5(%rip), %xmm0  # 0x145940740
14010ea4b:     	movaps	%xmm0, 0x330(%rbp)
14010ea52:     	movq	$0x0, 0x340(%rbp)
14010ea5d:     	movups	0x5831cf4(%rip), %xmm0  # 0x145940758
14010ea64:     	movups	%xmm0, 0x348(%rbp)
14010ea6b:     	movq	$0x0, 0x358(%rbp)
14010ea76:     	movw	$0x0, 0x46a(%rbp)
14010ea7f:     	movl	$0x10000, 0x466(%rbp)   # imm = 0x10000
14010ea89:     	movw	$0x0, 0x470(%rbp)
14010ea92:     	movl	$0x10000, 0x46c(%rbp)   # imm = 0x10000
14010ea9c:     	leaq	0x290(%rbp), %rcx
14010eaa3:     	callq	0x1400b68f0 <.text+0xb58f0>
14010eaa8:     	nop
14010eaa9:     	leaq	0x5e8(%rbp), %rcx
14010eab0:     	leaq	0x300(%rbp), %rsi
14010eab7:     	movl	$0x180, %r8d            # imm = 0x180
14010eabd:     	movq	%rsi, %rdx
14010eac0:     	callq	0x1457731ed <.text+0x57721ed>
14010eac5:     	movq	0x2f0(%rbp), %rax
14010eacc:     	movq	%rax, 0x5b7(%rbp)
14010ead3:     	movups	0x2e0(%rbp), %xmm0
14010eada:     	movups	%xmm0, 0x5a7(%rbp)
14010eae1:     	movups	0x2d0(%rbp), %xmm0
14010eae8:     	movups	%xmm0, 0x597(%rbp)
14010eaef:     	movups	0x290(%rbp), %xmm0
14010eaf6:     	movups	0x2a0(%rbp), %xmm1
14010eafd:     	movups	0x2b0(%rbp), %xmm2
14010eb04:     	movups	0x2c0(%rbp), %xmm3
14010eb0b:     	movups	%xmm3, 0x587(%rbp)
14010eb12:     	movups	%xmm2, 0x577(%rbp)
14010eb19:     	movups	%xmm1, 0x567(%rbp)
14010eb20:     	movups	%xmm0, 0x557(%rbp)
14010eb27:     	movq	0x120(%rbp), %rax
14010eb2e:     	movb	$0x2, 0x768(%rbp)
14010eb35:     	movq	0x5af(%rbp), %rcx
14010eb3c:     	movq	%rcx, 0x7c8(%rbp)
14010eb43:     	movq	0x5b7(%rbp), %rcx
14010eb4a:     	movq	%rcx, 0x7d0(%rbp)
14010eb51:     	movups	0x5a0(%rbp), %xmm0
14010eb58:     	movups	%xmm0, 0x7b9(%rbp)
14010eb5f:     	movups	0x590(%rbp), %xmm0
14010eb66:     	movups	%xmm0, 0x7a9(%rbp)
14010eb6d:     	movups	0x580(%rbp), %xmm0
14010eb74:     	movups	%xmm0, 0x799(%rbp)
14010eb7b:     	movups	0x570(%rbp), %xmm0
14010eb82:     	movups	%xmm0, 0x789(%rbp)
14010eb89:     	movups	0x560(%rbp), %xmm0
14010eb90:     	movups	%xmm0, 0x779(%rbp)
14010eb97:     	movups	0x550(%rbp), %xmm0
14010eb9e:     	movups	%xmm0, 0x769(%rbp)
14010eba5:     	movq	%rax, 0x5e0(%rbp)
14010ebac:     	movb	$0x1, 0x827(%rbp)
14010ebb3:     	leaq	0x290(%rbp), %rcx
14010ebba:     	leaq	0x5e0(%rbp), %r8
14010ebc1:     	movq	%rdi, %rdx
14010ebc4:     	callq	0x1400df1f0 <.text+0xde1f0>
14010ebc9:     	nop
14010ebca:     	movq	0x818(%rbp), %rax
14010ebd1:     	movq	(%rax), %rbx
14010ebd4:     	movq	0x290(%rbp), %r14
14010ebdb:     	movq	0x2b8(%rbp), %rax
14010ebe2:     	movq	%r14, 0x550(%rbp)
14010ebe9:     	movups	0x298(%rbp), %xmm0
14010ebf0:     	movups	%xmm0, 0x558(%rbp)
14010ebf7:     	movups	0x2a8(%rbp), %xmm0
14010ebfe:     	movups	%xmm0, 0x568(%rbp)
14010ec05:     	movq	%rax, 0x578(%rbp)
14010ec0c:     	movb	$0x1, 0x827(%rbp)
14010ec13:     	leaq	0x5831a66(%rip), %rcx   # 0x145940680
14010ec1a:     	movl	$0x4, %edx
14010ec1f:     	callq	0x145457c00 <.text+0x5456c00>
14010ec24:     	nop
14010ec25:     	movq	%rax, 0x300(%rbp)
14010ec2c:     	movq	%rdx, 0x308(%rbp)
14010ec33:     	movq	%rsi, 0x5e0(%rbp)
14010ec3a:     	leaq	-0x10cb81(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14010ec41:     	movq	%rax, 0x5e8(%rbp)
14010ec48:     	movb	$0x1, 0x827(%rbp)
14010ec4f:     	leaq	0x5831a2e(%rip), %rdx   # 0x145940684
14010ec56:     	leaq	0x180(%rbp), %rcx
14010ec5d:     	leaq	0x5e0(%rbp), %r8
14010ec64:     	callq	0x145728390 <.text+0x5727390>
14010ec69:     	nop
14010ec6a:     	cmpb	$0x1, (%rbx)
14010ec6d:     	jne	0x14010ec8e <.text+0x10dc8e>
14010ec6f:     	movl	0x1(%rbx), %eax
14010ec72:     	movl	0x4(%rbx), %ecx
14010ec75:     	movl	%ecx, 0x303(%rbp)
14010ec7b:     	movl	%eax, 0x300(%rbp)
14010ec81:     	movq	0x8(%rbx), %rax
14010ec85:     	movzbl	0x10(%rbx), %r8d
14010ec8a:     	movb	$0x1, %cl
14010ec8c:     	jmp	0x14010ec9e <.text+0x10dc9e>
14010ec8e:     	movq	0x8(%rbx), %rax
14010ec92:     	lock
14010ec93:     	incq	(%rax)
14010ec96:     	jle	0x14010fdca <.text+0x10edca>
14010ec9c:     	xorl	%ecx, %ecx
14010ec9e:     	leaq	0x558(%rbp), %rdx
14010eca5:     	movq	0x190(%rbp), %r9
14010ecac:     	movq	%r9, 0x5f8(%rbp)
14010ecb3:     	movups	0x180(%rbp), %xmm0
14010ecba:     	movups	%xmm0, 0x5e8(%rbp)
14010ecc1:     	movl	0x300(%rbp), %r9d
14010ecc8:     	movl	0x303(%rbp), %r10d
14010eccf:     	movl	%r9d, 0x619(%rbp)
14010ecd6:     	movl	%r10d, 0x61c(%rbp)
14010ecdd:     	movups	0x58319a4(%rip), %xmm0  # 0x145940688
14010ece4:     	movups	%xmm0, 0x241(%rbp)
14010eceb:     	movl	$0x3f800000, 0x251(%rbp) # imm = 0x3F800000
14010ecf5:     	movq	$0x0, 0x600(%rbp)
14010ed00:     	movq	$0x4, 0x608(%rbp)
14010ed0b:     	movq	$0x0, 0x610(%rbp)
14010ed16:     	movb	%cl, 0x618(%rbp)
14010ed1c:     	movq	%rax, 0x620(%rbp)
14010ed23:     	movq	%r8, 0x628(%rbp)
14010ed2a:     	movl	$0x41880000, 0x630(%rbp) # imm = 0x41880000
14010ed34:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
14010ed3d:     	movb	$0x1, 0x636(%rbp)
14010ed44:     	movq	0x24d(%rbp), %rax
14010ed4b:     	movq	%rax, 0x644(%rbp)
14010ed52:     	movups	0x240(%rbp), %xmm0
14010ed59:     	movups	%xmm0, 0x637(%rbp)
14010ed60:     	movl	0x580a41a(%rip), %eax   # 0x145919180
14010ed66:     	movl	%eax, 0x65c(%rbp)
14010ed6c:     	movups	0x580a3fd(%rip), %xmm0  # 0x145919170
14010ed73:     	movups	%xmm0, 0x64c(%rbp)
14010ed7a:     	movsd	0x5806a4e(%rip), %xmm0  # 0x1459157d0
14010ed82:     	movsd	%xmm0, 0x660(%rbp)
14010ed8a:     	movq	%r14, 0x5e0(%rbp)
14010ed91:     	movb	$0x1, 0x827(%rbp)
14010ed98:     	leaq	0x300(%rbp), %rcx
14010ed9f:     	leaq	0x5e0(%rbp), %r8
14010eda6:     	callq	0x1400dbfa0 <.text+0xdafa0>
14010edab:     	nop
14010edac:     	movb	$0x1, 0x827(%rbp)
14010edb3:     	leaq	0x58318e2(%rip), %rcx   # 0x14594069c
14010edba:     	movl	$0x9, %edx
14010edbf:     	callq	0x145457c00 <.text+0x5456c00>
14010edc4:     	nop
14010edc5:     	movq	%rdx, %r8
14010edc8:     	leaq	0x58318f9(%rip), %rcx   # 0x1459406c8
14010edcf:     	movq	%rcx, 0x240(%rbp)
14010edd6:     	movq	$0x1, 0x248(%rbp)
14010ede1:     	leaq	0xc0(%rbp), %rcx
14010ede8:     	movq	%rcx, 0x250(%rbp)
14010edef:     	leaq	0x58318b2(%rip), %rcx   # 0x1459406a8
14010edf6:     	movq	%rcx, 0x258(%rbp)
14010edfd:     	movb	$0x1, 0x827(%rbp)
14010ee04:     	movq	$0x1, 0x20(%rsp)
14010ee0d:     	leaq	0x1f0(%rbp), %rcx
14010ee14:     	leaq	0x240(%rbp), %r9
14010ee1b:     	movq	%rax, %rdx
14010ee1e:     	callq	0x145458060 <.text+0x5457060>
14010ee23:     	nop
14010ee24:     	cmpb	$0x1, (%rbx)
14010ee27:     	jne	0x14010ee47 <.text+0x10de47>
14010ee29:     	movl	0x1(%rbx), %eax
14010ee2c:     	movl	0x4(%rbx), %ecx
14010ee2f:     	movl	%ecx, 0x1bb(%rbp)
14010ee35:     	movl	%eax, 0x1b8(%rbp)
14010ee3b:     	movq	0x8(%rbx), %rax
14010ee3f:     	movzbl	0x10(%rbx), %ecx
14010ee43:     	movb	$0x1, %dl
14010ee45:     	jmp	0x14010ee57 <.text+0x10de57>
14010ee47:     	movq	0x8(%rbx), %rax
14010ee4b:     	lock
14010ee4c:     	incq	(%rax)
14010ee4f:     	jle	0x14010fdca <.text+0x10edca>
14010ee55:     	xorl	%edx, %edx
14010ee57:     	movq	0x200(%rbp), %r8
14010ee5e:     	movq	%r8, 0x5f0(%rbp)
14010ee65:     	movups	0x1f0(%rbp), %xmm0
14010ee6c:     	movaps	%xmm0, 0x5e0(%rbp)
14010ee73:     	movq	$0x0, 0x5f8(%rbp)
14010ee7e:     	movq	$0x4, 0x600(%rbp)
14010ee89:     	movq	$0x0, 0x608(%rbp)
14010ee94:     	movb	%dl, 0x610(%rbp)
14010ee9a:     	movl	0x1b8(%rbp), %edx
14010eea0:     	movl	0x1bb(%rbp), %r8d
14010eea7:     	movl	%edx, 0x611(%rbp)
14010eead:     	movl	%r8d, 0x614(%rbp)
14010eeb4:     	movq	%rax, 0x618(%rbp)
14010eebb:     	movq	%rcx, 0x620(%rbp)
14010eec2:     	movl	$0x41600000, 0x628(%rbp) # imm = 0x41600000
14010eecc:     	movw	$0x190, 0x62c(%rbp)     # imm = 0x190
14010eed5:     	movb	$0x1, 0x62e(%rbp)
14010eedc:     	movups	0x58317e9(%rip), %xmm0  # 0x1459406cc
14010eee3:     	movaps	%xmm0, 0x630(%rbp)
14010eeea:     	movl	$0x3f800000, 0x640(%rbp) # imm = 0x3F800000
14010eef4:     	movb	$0x1, 0x827(%rbp)
14010eefb:     	leaq	0x300(%rbp), %rcx
14010ef02:     	leaq	0x5e0(%rbp), %rdx
14010ef09:     	callq	0x1400f1400 <.text+0xf0400>
14010ef0e:     	nop
14010ef0f:     	movq	0x2f8(%rbp), %rax
14010ef16:     	movq	(%rax), %rax
14010ef19:     	cmpb	$0x0, 0x48(%rax)
14010ef1d:     	movups	0x5831804(%rip), %xmm1  # 0x145940728
14010ef24:     	movups	0x583182d(%rip), %xmm2  # 0x145940758
14010ef2b:     	je	0x14010ef43 <.text+0x10df43>
14010ef2d:     	movb	$0x1, %bl
14010ef2f:     	cmpq	$0x0, 0x20(%rax)
14010ef34:     	jne	0x14010ef45 <.text+0x10df45>
14010ef36:     	movq	0x30(%rax), %rcx
14010ef3a:     	cmpq	0x28(%rax), %rcx
14010ef3e:     	setae	%bl
14010ef41:     	jmp	0x14010ef45 <.text+0x10df45>
14010ef43:     	xorl	%ebx, %ebx
14010ef45:     	movw	$0x0, 0x464(%rbp)
14010ef4e:     	movb	$0x1, 0x454(%rbp)
14010ef55:     	xorps	%xmm0, %xmm0
14010ef58:     	movaps	%xmm0, 0x360(%rbp)
14010ef5f:     	movaps	%xmm0, 0x370(%rbp)
14010ef66:     	movaps	%xmm0, 0x380(%rbp)
14010ef6d:     	movaps	%xmm0, 0x390(%rbp)
14010ef74:     	movaps	%xmm0, 0x3a0(%rbp)
14010ef7b:     	movq	$0x0, 0x3b0(%rbp)
14010ef86:     	movl	$0x5, 0x47a(%rbp)
14010ef90:     	movups	%xmm11, 0x3b8(%rbp)
14010ef98:     	movups	%xmm12, 0x3c8(%rbp)
14010efa0:     	movaps	0x5809a59(%rip), %xmm0  # 0x145918a00
14010efa7:     	movups	%xmm0, 0x3d8(%rbp)
14010efae:     	movaps	0x58097fb(%rip), %xmm0  # 0x1459187b0
14010efb5:     	movups	%xmm0, 0x3e8(%rbp)
14010efbc:     	movaps	0x57f832d(%rip), %xmm6  # 0x1459072f0
14010efc3:     	movups	%xmm6, 0x3f8(%rbp)
14010efca:     	movups	%xmm6, 0x408(%rbp)
14010efd1:     	movaps	0x57f8328(%rip), %xmm0  # 0x145907300
14010efd8:     	movups	%xmm0, 0x418(%rbp)
14010efdf:     	movups	%xmm0, 0x428(%rbp)
14010efe6:     	movq	$0x0, 0x458(%rbp)
14010eff1:     	movl	$0x3f800000, 0x460(%rbp) # imm = 0x3F800000
14010effb:     	movups	%xmm10, 0x438(%rbp)
14010f003:     	movl	$0x1, 0x448(%rbp)
14010f00d:     	movss	0x58068bf(%rip), %xmm0  # 0x1459158d4
14010f015:     	movlps	%xmm0, 0x44c(%rbp)
14010f01c:     	movq	$0x0, 0x472(%rbp)
14010f027:     	movups	0x58316e2(%rip), %xmm0  # 0x145940710
14010f02e:     	movaps	%xmm0, 0x300(%rbp)
14010f035:     	movq	$0x0, 0x310(%rbp)
14010f040:     	movups	%xmm1, 0x318(%rbp)
14010f047:     	movq	$0x0, 0x328(%rbp)
14010f052:     	movups	0x58316e7(%rip), %xmm0  # 0x145940740
14010f059:     	movaps	%xmm0, 0x330(%rbp)
14010f060:     	movq	$0x0, 0x340(%rbp)
14010f06b:     	movups	%xmm2, 0x348(%rbp)
14010f072:     	movq	$0x0, 0x358(%rbp)
14010f07d:     	movw	$0x0, 0x46a(%rbp)
14010f086:     	movl	$0x10000, 0x466(%rbp)   # imm = 0x10000
14010f090:     	movw	$0x0, 0x470(%rbp)
14010f099:     	movl	$0x10000, 0x46c(%rbp)   # imm = 0x10000
14010f0a3:     	leaq	0x290(%rbp), %rcx
14010f0aa:     	callq	0x1400b68f0 <.text+0xb58f0>
14010f0af:     	nop
14010f0b0:     	leaq	0x5e8(%rbp), %rcx
14010f0b7:     	leaq	0x300(%rbp), %rsi
14010f0be:     	movl	$0x180, %r8d            # imm = 0x180
14010f0c4:     	movq	%rsi, %rdx
14010f0c7:     	callq	0x1457731ed <.text+0x57721ed>
14010f0cc:     	movq	0x2f0(%rbp), %rax
14010f0d3:     	movq	%rax, 0x5b7(%rbp)
14010f0da:     	movups	0x2e0(%rbp), %xmm0
14010f0e1:     	movups	%xmm0, 0x5a7(%rbp)
14010f0e8:     	movups	0x2d0(%rbp), %xmm0
14010f0ef:     	movups	%xmm0, 0x597(%rbp)
14010f0f6:     	movups	0x290(%rbp), %xmm0
14010f0fd:     	movups	0x2a0(%rbp), %xmm1
14010f104:     	movups	0x2b0(%rbp), %xmm2
14010f10b:     	movups	0x2c0(%rbp), %xmm3
14010f112:     	movups	%xmm3, 0x587(%rbp)
14010f119:     	movups	%xmm2, 0x577(%rbp)
14010f120:     	movups	%xmm1, 0x567(%rbp)
14010f127:     	movups	%xmm0, 0x557(%rbp)
14010f12e:     	movq	0x120(%rbp), %rax
14010f135:     	movb	$0x2, 0x768(%rbp)
14010f13c:     	movq	0x5af(%rbp), %rcx
14010f143:     	movq	%rcx, 0x7c8(%rbp)
14010f14a:     	movq	0x5b7(%rbp), %rcx
14010f151:     	movq	%rcx, 0x7d0(%rbp)
14010f158:     	movups	0x5a0(%rbp), %xmm0
14010f15f:     	movups	%xmm0, 0x7b9(%rbp)
14010f166:     	movups	0x590(%rbp), %xmm0
14010f16d:     	movups	%xmm0, 0x7a9(%rbp)
14010f174:     	movups	0x580(%rbp), %xmm0
14010f17b:     	movups	%xmm0, 0x799(%rbp)
14010f182:     	movups	0x570(%rbp), %xmm0
14010f189:     	movups	%xmm0, 0x789(%rbp)
14010f190:     	movups	0x560(%rbp), %xmm0
14010f197:     	movups	%xmm0, 0x779(%rbp)
14010f19e:     	movups	0x550(%rbp), %xmm0
14010f1a5:     	movups	%xmm0, 0x769(%rbp)
14010f1ac:     	movq	%rax, 0x5e0(%rbp)
14010f1b3:     	movb	$0x1, 0x827(%rbp)
14010f1ba:     	leaq	0xc0(%rbp), %rcx
14010f1c1:     	leaq	0x5e0(%rbp), %r8
14010f1c8:     	movq	%rdi, %rdx
14010f1cb:     	callq	0x1400df4a0 <.text+0xde4a0>
14010f1d0:     	nop
14010f1d1:     	movq	0xc0(%rbp), %r12
14010f1d8:     	movq	0xe8(%rbp), %rax
14010f1df:     	movq	%r12, 0x180(%rbp)
14010f1e6:     	movups	0xc8(%rbp), %xmm0
14010f1ed:     	movups	%xmm0, 0x188(%rbp)
14010f1f4:     	movups	0xd8(%rbp), %xmm0
14010f1fb:     	movups	%xmm0, 0x198(%rbp)
14010f202:     	movq	%rax, 0x1a8(%rbp)
14010f209:     	testb	%bl, %bl
14010f20b:     	jne	0x14010f217 <.text+0x10e217>
14010f20d:     	movss	0x5830a5f(%rip), %xmm7  # 0x14593fc74
14010f215:     	jmp	0x14010f21f <.text+0x10e21f>
14010f217:     	movss	0x57f8271(%rip), %xmm7  # 0x145907490
14010f21f:     	movq	0x818(%rbp), %rax
14010f226:     	movq	(%rax), %rdi
14010f229:     	movb	$0x1, 0x827(%rbp)
14010f230:     	leaq	0x58314a9(%rip), %rcx   # 0x1459406e0
14010f237:     	movl	$0x6, %edx
14010f23c:     	callq	0x145457c00 <.text+0x5456c00>
14010f241:     	nop
14010f242:     	movq	%rax, 0x300(%rbp)
14010f249:     	movq	%rdx, 0x308(%rbp)
14010f250:     	movq	%rsi, 0x5e0(%rbp)
14010f257:     	leaq	-0x10d19e(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14010f25e:     	movq	%rax, 0x5e8(%rbp)
14010f265:     	movb	$0x1, 0x827(%rbp)
14010f26c:     	leaq	0x5831411(%rip), %rdx   # 0x145940684
14010f273:     	leaq	0x1b8(%rbp), %rcx
14010f27a:     	leaq	0x5e0(%rbp), %r8
14010f281:     	callq	0x145728390 <.text+0x5727390>
14010f286:     	nop
14010f287:     	cmpb	$0x1, (%rdi)
14010f28a:     	jne	0x14010f2aa <.text+0x10e2aa>
14010f28c:     	movl	0x1(%rdi), %eax
14010f28f:     	movl	0x4(%rdi), %ecx
14010f292:     	movl	%ecx, 0x553(%rbp)
14010f298:     	movl	%eax, 0x550(%rbp)
14010f29e:     	movq	0x8(%rdi), %rax
14010f2a2:     	movzbl	0x10(%rdi), %edx
14010f2a6:     	movb	$0x1, %cl
14010f2a8:     	jmp	0x14010f2ba <.text+0x10e2ba>
14010f2aa:     	movq	0x8(%rdi), %rax
14010f2ae:     	lock
14010f2af:     	incq	(%rax)
14010f2b2:     	jle	0x14010fdca <.text+0x10edca>
14010f2b8:     	xorl	%ecx, %ecx
14010f2ba:     	leaq	0x188(%rbp), %r15
14010f2c1:     	movq	0x1c8(%rbp), %r8
14010f2c8:     	movq	%r8, 0x5f8(%rbp)
14010f2cf:     	movups	0x1b8(%rbp), %xmm0
14010f2d6:     	movups	%xmm0, 0x5e8(%rbp)
14010f2dd:     	movl	0x550(%rbp), %r8d
14010f2e4:     	movl	0x553(%rbp), %r9d
14010f2eb:     	movl	%r8d, 0x619(%rbp)
14010f2f2:     	movl	%r9d, 0x61c(%rbp)
14010f2f9:     	movups	0x5831387(%rip), %xmm8  # 0x145940688
14010f301:     	movups	%xmm8, 0x301(%rbp)
14010f309:     	movq	$0x0, 0x600(%rbp)
14010f314:     	movq	$0x4, 0x608(%rbp)
14010f31f:     	movq	$0x0, 0x610(%rbp)
14010f32a:     	movb	%cl, 0x618(%rbp)
14010f330:     	movq	%rax, 0x620(%rbp)
14010f337:     	movq	%rdx, 0x628(%rbp)
14010f33e:     	movl	$0x41880000, 0x630(%rbp) # imm = 0x41880000
14010f348:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
14010f351:     	movb	$0x1, 0x636(%rbp)
14010f358:     	movzbl	0x310(%rbp), %eax
14010f35f:     	movb	%al, 0x647(%rbp)
14010f365:     	movups	0x300(%rbp), %xmm0
14010f36c:     	movups	%xmm0, 0x637(%rbp)
14010f373:     	movss	%xmm7, 0x648(%rbp)
14010f37b:     	movl	0x5809dff(%rip), %eax   # 0x145919180
14010f381:     	movl	%eax, 0x65c(%rbp)
14010f387:     	movups	0x5809de2(%rip), %xmm0  # 0x145919170
14010f38e:     	movups	%xmm0, 0x64c(%rbp)
14010f395:     	movsd	0x5806433(%rip), %xmm0  # 0x1459157d0
14010f39d:     	movsd	%xmm0, 0x660(%rbp)
14010f3a5:     	movq	%r12, 0x5e0(%rbp)
14010f3ac:     	movb	$0x1, 0x827(%rbp)
14010f3b3:     	leaq	0x1f0(%rbp), %rcx
14010f3ba:     	leaq	0x5e0(%rbp), %r8
14010f3c1:     	movq	%r15, %rdx
14010f3c4:     	callq	0x1400dbfa0 <.text+0xdafa0>
14010f3c9:     	nop
14010f3ca:     	movq	0x2f8(%rbp), %rax
14010f3d1:     	movq	(%rax), %rax
14010f3d4:     	movq	0x20(%rax), %rcx
14010f3d8:     	testq	%rcx, %rcx
14010f3db:     	je	0x14010f424 <.text+0x10e424>
14010f3dd:     	movq	0x818(%rbp), %rax
14010f3e4:     	movq	(%rax), %rdi
14010f3e7:     	movb	$0x1, 0x827(%rbp)
14010f3ee:     	leaq	0x5e0(%rbp), %rdx
14010f3f5:     	movl	$0x14, %r8d
14010f3fb:     	callq	0x14572f900 <.text+0x572e900>
14010f400:     	nop
14010f401:     	movq	%rdx, %rsi
14010f404:     	testq	%rdx, %rdx
14010f407:     	jns	0x14010f431 <.text+0x10e431>
14010f409:     	xorl	%r15d, %r15d
14010f40c:     	movb	$0x1, 0x827(%rbp)
14010f413:     	movq	%r15, %rcx
14010f416:     	movq	%rsi, %rdx
14010f419:     	callq	0x14590379b <.text+0x590279b>
14010f41e:     	nop
14010f41f:     	jmp	0x14010fdca <.text+0x10edca>
14010f424:     	testb	%bl, %bl
14010f426:     	je	0x14010f49b <.text+0x10e49b>
14010f428:     	movups	0x58312cd(%rip), %xmm0  # 0x1459406fc
14010f42f:     	jmp	0x14010f4a2 <.text+0x10e4a2>
14010f431:     	testq	%rsi, %rsi
14010f434:     	je	0x14010f5a6 <.text+0x10e5a6>
14010f43a:     	movq	%r15, %r13
14010f43d:     	movq	%rax, %r14
14010f440:     	callq	0x140002200 <.text+0x1200>
14010f445:     	movl	$0x1, %r15d
14010f44b:     	movl	$0x1, %edx
14010f450:     	movq	%rsi, %rcx
14010f453:     	callq	0x1400021c0 <.text+0x11c0>
14010f458:     	testq	%rax, %rax
14010f45b:     	je	0x14010f40c <.text+0x10e40c>
14010f45d:     	movq	%rax, %rbx
14010f460:     	movq	%rax, %rcx
14010f463:     	movq	%r14, %rdx
14010f466:     	movq	%rsi, %r8
14010f469:     	callq	0x1457731ed <.text+0x57721ed>
14010f46e:     	movq	%r13, %r15
14010f471:     	cmpb	$0x1, (%rdi)
14010f474:     	jne	0x14010f5b4 <.text+0x10e5b4>
14010f47a:     	movl	0x1(%rdi), %eax
14010f47d:     	movl	0x4(%rdi), %ecx
14010f480:     	movl	%ecx, 0x303(%rbp)
14010f486:     	movl	%eax, 0x300(%rbp)
14010f48c:     	movq	0x8(%rdi), %rax
14010f490:     	movzbl	0x10(%rdi), %ecx
14010f494:     	movb	$0x1, %dl
14010f496:     	jmp	0x14010f5c4 <.text+0x10e5c4>
14010f49b:     	movups	0x5831246(%rip), %xmm0  # 0x1459406e8
14010f4a2:     	movaps	%xmm0, 0x1d0(%rbp)
14010f4a9:     	movl	$0x3f800000, 0x1e0(%rbp) # imm = 0x3F800000
14010f4b3:     	movq	0x1f0(%rbp), %rdi
14010f4ba:     	movq	0x218(%rbp), %rcx
14010f4c1:     	movq	%rdi, 0x550(%rbp)
14010f4c8:     	movups	0x1f8(%rbp), %xmm0
14010f4cf:     	movups	%xmm0, 0x558(%rbp)
14010f4d6:     	movups	0x208(%rbp), %xmm0
14010f4dd:     	movups	%xmm0, 0x568(%rbp)
14010f4e4:     	movq	%rcx, 0x578(%rbp)
14010f4eb:     	movq	0x818(%rbp), %rcx
14010f4f2:     	movq	(%rcx), %r13
14010f4f5:     	movq	0x28(%rax), %rcx
14010f4f9:     	movb	$0x1, 0x827(%rbp)
14010f500:     	leaq	0x5e0(%rbp), %rdx
14010f507:     	movl	$0x14, %r8d
14010f50d:     	callq	0x14572f900 <.text+0x572e900>
14010f512:     	nop
14010f513:     	movq	%rdx, %rsi
14010f516:     	testq	%rdx, %rdx
14010f519:     	jns	0x14010f536 <.text+0x10e536>
14010f51b:     	xorl	%r15d, %r15d
14010f51e:     	movb	$0x1, 0x827(%rbp)
14010f525:     	movq	%r15, %rcx
14010f528:     	movq	%rsi, %rdx
14010f52b:     	callq	0x14590379b <.text+0x590279b>
14010f530:     	nop
14010f531:     	jmp	0x14010fdca <.text+0x10edca>
14010f536:     	testq	%rsi, %rsi
14010f539:     	je	0x14010f67a <.text+0x10e67a>
14010f53f:     	movq	%rax, %rbx
14010f542:     	callq	0x140002200 <.text+0x1200>
14010f547:     	movl	$0x1, %r15d
14010f54d:     	movl	$0x1, %edx
14010f552:     	movq	%rsi, %rcx
14010f555:     	callq	0x1400021c0 <.text+0x11c0>
14010f55a:     	testq	%rax, %rax
14010f55d:     	je	0x14010f51e <.text+0x10e51e>
14010f55f:     	movq	%rax, %r14
14010f562:     	movq	%rax, %rcx
14010f565:     	movq	%rbx, %rdx
14010f568:     	movq	%rsi, %r8
14010f56b:     	callq	0x1457731ed <.text+0x57721ed>
14010f570:     	leaq	0x188(%rbp), %r15
14010f577:     	cmpb	$0x1, (%r13)
14010f57c:     	jne	0x14010f68b <.text+0x10e68b>
14010f582:     	movl	0x1(%r13), %eax
14010f586:     	movl	0x4(%r13), %ecx
14010f58a:     	movl	%ecx, 0x533(%rbp)
14010f590:     	movl	%eax, 0x530(%rbp)
14010f596:     	movq	0x8(%r13), %rax
14010f59a:     	movzbl	0x10(%r13), %ecx
14010f59f:     	movb	$0x1, %dl
14010f5a1:     	jmp	0x14010f69b <.text+0x10e69b>
14010f5a6:     	movl	$0x1, %ebx
14010f5ab:     	cmpb	$0x1, (%rdi)
14010f5ae:     	je	0x14010f47a <.text+0x10e47a>
14010f5b4:     	movq	0x8(%rdi), %rax
14010f5b8:     	lock
14010f5b9:     	incq	(%rax)
14010f5bc:     	jle	0x14010fdca <.text+0x10edca>
14010f5c2:     	xorl	%edx, %edx
14010f5c4:     	movq	%rsi, 0x5e0(%rbp)
14010f5cb:     	movq	%rbx, 0x5e8(%rbp)
14010f5d2:     	movq	%rsi, 0x5f0(%rbp)
14010f5d9:     	movq	$0x0, 0x5f8(%rbp)
14010f5e4:     	movq	$0x4, 0x600(%rbp)
14010f5ef:     	movq	$0x0, 0x608(%rbp)
14010f5fa:     	movb	%dl, 0x610(%rbp)
14010f600:     	movl	0x300(%rbp), %edx
14010f606:     	movl	0x303(%rbp), %r8d
14010f60d:     	movl	%edx, 0x611(%rbp)
14010f613:     	movl	%r8d, 0x614(%rbp)
14010f61a:     	movq	%rax, 0x618(%rbp)
14010f621:     	movq	%rcx, 0x620(%rbp)
14010f628:     	movl	$0x41880000, 0x628(%rbp) # imm = 0x41880000
14010f632:     	movw	$0x190, 0x62c(%rbp)     # imm = 0x190
14010f63b:     	movb	$0x1, 0x62e(%rbp)
14010f642:     	movups	0x58310b3(%rip), %xmm0  # 0x1459406fc
14010f649:     	movups	%xmm0, 0x630(%rbp)
14010f650:     	movl	$0x3f800000, 0x640(%rbp) # imm = 0x3F800000
14010f65a:     	movb	$0x1, 0x827(%rbp)
14010f661:     	leaq	0x1f0(%rbp), %rcx
14010f668:     	leaq	0x5e0(%rbp), %rdx
14010f66f:     	callq	0x1400f1400 <.text+0xf0400>
14010f674:     	nop
14010f675:     	jmp	0x14010f8f4 <.text+0x10e8f4>
14010f67a:     	movl	$0x1, %r14d
14010f680:     	cmpb	$0x1, (%r13)
14010f685:     	je	0x14010f582 <.text+0x10e582>
14010f68b:     	movq	0x8(%r13), %rax
14010f68f:     	lock
14010f690:     	incq	(%rax)
14010f693:     	jle	0x14010fdca <.text+0x10edca>
14010f699:     	xorl	%edx, %edx
14010f69b:     	leaq	0x558(%rbp), %rbx
14010f6a2:     	movl	0x1e0(%rbp), %r8d
14010f6a9:     	movl	%r8d, 0x2a1(%rbp)
14010f6b0:     	movaps	0x1d0(%rbp), %xmm0
14010f6b7:     	movups	%xmm0, 0x291(%rbp)
14010f6be:     	movq	%rsi, 0x5e8(%rbp)
14010f6c5:     	movq	%r14, 0x5f0(%rbp)
14010f6cc:     	movq	%rsi, 0x5f8(%rbp)
14010f6d3:     	movq	$0x0, 0x600(%rbp)
14010f6de:     	movq	$0x4, 0x608(%rbp)
14010f6e9:     	movq	$0x0, 0x610(%rbp)
14010f6f4:     	movb	%dl, 0x618(%rbp)
14010f6fa:     	movl	0x530(%rbp), %edx
14010f700:     	movl	0x533(%rbp), %r8d
14010f707:     	movl	%edx, 0x619(%rbp)
14010f70d:     	movl	%r8d, 0x61c(%rbp)
14010f714:     	movq	%rax, 0x620(%rbp)
14010f71b:     	movq	%rcx, 0x628(%rbp)
14010f722:     	movl	$0x41880000, 0x630(%rbp) # imm = 0x41880000
14010f72c:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
14010f735:     	movb	$0x1, 0x636(%rbp)
14010f73c:     	movups	0x290(%rbp), %xmm0
14010f743:     	movups	%xmm0, 0x637(%rbp)
14010f74a:     	movq	0x29d(%rbp), %rax
14010f751:     	movq	%rax, 0x644(%rbp)
14010f758:     	movq	%rdi, 0x5e0(%rbp)
14010f75f:     	movb	$0x1, 0x827(%rbp)
14010f766:     	leaq	0x300(%rbp), %rsi
14010f76d:     	leaq	0x5e0(%rbp), %r8
14010f774:     	movq	%rsi, %rcx
14010f777:     	movq	%rbx, %rdx
14010f77a:     	callq	0x1400db9d0 <.text+0xda9d0>
14010f77f:     	nop
14010f780:     	movq	0x818(%rbp), %rax
14010f787:     	movq	(%rax), %r14
14010f78a:     	movb	$0x1, 0x827(%rbp)
14010f791:     	leaq	0x5830ee0(%rip), %rcx   # 0x145940678
14010f798:     	movl	$0x4, %edx
14010f79d:     	callq	0x145457c00 <.text+0x5456c00>
14010f7a2:     	nop
14010f7a3:     	movq	%rax, 0x300(%rbp)
14010f7aa:     	movq	%rdx, 0x308(%rbp)
14010f7b1:     	movq	%rsi, 0x5e0(%rbp)
14010f7b8:     	leaq	-0x10d6ff(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14010f7bf:     	movq	%rax, 0x5e8(%rbp)
14010f7c6:     	movb	$0x1, 0x827(%rbp)
14010f7cd:     	leaq	0x5830ea8(%rip), %rdx   # 0x14594067c
14010f7d4:     	leaq	0x290(%rbp), %rcx
14010f7db:     	leaq	0x5e0(%rbp), %r8
14010f7e2:     	callq	0x145728390 <.text+0x5727390>
14010f7e7:     	nop
14010f7e8:     	cmpb	$0x1, (%r14)
14010f7ec:     	jne	0x14010f80f <.text+0x10e80f>
14010f7ee:     	movl	0x1(%r14), %eax
14010f7f2:     	movl	0x4(%r14), %ecx
14010f7f6:     	movl	%ecx, 0x52b(%rbp)
14010f7fc:     	movl	%eax, 0x528(%rbp)
14010f802:     	movq	0x8(%r14), %rax
14010f806:     	movzbl	0x10(%r14), %ecx
14010f80b:     	movb	$0x1, %dl
14010f80d:     	jmp	0x14010f81f <.text+0x10e81f>
14010f80f:     	movq	0x8(%r14), %rax
14010f813:     	lock
14010f814:     	incq	(%rax)
14010f817:     	jle	0x14010fdca <.text+0x10edca>
14010f81d:     	xorl	%edx, %edx
14010f81f:     	movq	0x2a0(%rbp), %r8
14010f826:     	movq	%r8, 0x5f8(%rbp)
14010f82d:     	movups	0x290(%rbp), %xmm0
14010f834:     	movups	%xmm0, 0x5e8(%rbp)
14010f83b:     	movups	%xmm8, 0x241(%rbp)
14010f843:     	movq	$0x0, 0x600(%rbp)
14010f84e:     	movq	$0x4, 0x608(%rbp)
14010f859:     	movq	$0x0, 0x610(%rbp)
14010f864:     	movb	%dl, 0x618(%rbp)
14010f86a:     	movl	0x528(%rbp), %edx
14010f870:     	movl	0x52b(%rbp), %r8d
14010f877:     	movl	%edx, 0x619(%rbp)
14010f87d:     	movl	%r8d, 0x61c(%rbp)
14010f884:     	movq	%rax, 0x620(%rbp)
14010f88b:     	movq	%rcx, 0x628(%rbp)
14010f892:     	movl	$0x41600000, 0x630(%rbp) # imm = 0x41600000
14010f89c:     	movw	$0x190, 0x634(%rbp)     # imm = 0x190
14010f8a5:     	movb	$0x1, 0x636(%rbp)
14010f8ac:     	movzbl	0x250(%rbp), %eax
14010f8b3:     	movb	%al, 0x647(%rbp)
14010f8b9:     	movups	0x240(%rbp), %xmm0
14010f8c0:     	movups	%xmm0, 0x637(%rbp)
14010f8c7:     	movss	%xmm7, 0x648(%rbp)
14010f8cf:     	movq	%rdi, 0x5e0(%rbp)
14010f8d6:     	movb	$0x1, 0x827(%rbp)
14010f8dd:     	leaq	0x300(%rbp), %rcx
14010f8e4:     	leaq	0x5e0(%rbp), %r8
14010f8eb:     	movq	%rbx, %rdx
14010f8ee:     	callq	0x1400db9d0 <.text+0xda9d0>
14010f8f3:     	nop
14010f8f4:     	movups	0x5830e15(%rip), %xmm0  # 0x145940710
14010f8fb:     	movaps	%xmm0, 0x550(%rbp)
14010f902:     	movq	$0x0, 0x560(%rbp)
14010f90d:     	movups	0x5830e14(%rip), %xmm0  # 0x145940728
14010f914:     	movups	%xmm0, 0x568(%rbp)
14010f91b:     	movq	$0x0, 0x578(%rbp)
14010f926:     	movups	0x5830e13(%rip), %xmm0  # 0x145940740
14010f92d:     	movaps	%xmm0, 0x580(%rbp)
14010f934:     	movq	$0x0, 0x590(%rbp)
14010f93f:     	movups	0x5830e12(%rip), %xmm0  # 0x145940758
14010f946:     	movups	%xmm0, 0x598(%rbp)
14010f94d:     	movq	$0x0, 0x5a8(%rbp)
14010f958:     	movups	0x5830f31(%rip), %xmm0  # 0x145940890
14010f95f:     	movaps	%xmm0, 0x240(%rbp)
14010f966:     	movl	$0x3f800000, 0x250(%rbp) # imm = 0x3F800000
14010f970:     	movups	%xmm0, 0x254(%rbp)
14010f977:     	movl	$0x3f800000, 0x264(%rbp) # imm = 0x3F800000
14010f981:     	movups	%xmm0, 0x268(%rbp)
14010f988:     	movl	$0x3f800000, 0x278(%rbp) # imm = 0x3F800000
14010f992:     	movups	%xmm0, 0x27c(%rbp)
14010f999:     	movl	$0x3f800000, 0x28c(%rbp) # imm = 0x3F800000
14010f9a3:     	movq	0x5a0(%rbp), %rax
14010f9aa:     	movq	%rax, 0x350(%rbp)
14010f9b1:     	movq	0x5a8(%rbp), %rax
14010f9b8:     	movq	%rax, 0x358(%rbp)
14010f9bf:     	movq	0x590(%rbp), %rax
14010f9c6:     	movq	%rax, 0x340(%rbp)
14010f9cd:     	movq	0x598(%rbp), %rax
14010f9d4:     	movq	%rax, 0x348(%rbp)
14010f9db:     	movaps	0x550(%rbp), %xmm0
14010f9e2:     	movaps	0x560(%rbp), %xmm1
14010f9e9:     	movaps	0x570(%rbp), %xmm2
14010f9f0:     	movaps	0x580(%rbp), %xmm3
14010f9f7:     	movaps	%xmm3, 0x330(%rbp)
14010f9fe:     	movaps	%xmm2, 0x320(%rbp)
14010fa05:     	movaps	%xmm1, 0x310(%rbp)
14010fa0c:     	movaps	%xmm0, 0x300(%rbp)
14010fa13:     	xorps	%xmm0, %xmm0
14010fa16:     	movaps	%xmm0, 0x3a0(%rbp)
14010fa1d:     	movaps	%xmm0, 0x390(%rbp)
14010fa24:     	movaps	%xmm0, 0x380(%rbp)
14010fa2b:     	movaps	%xmm0, 0x370(%rbp)
14010fa32:     	movaps	%xmm0, 0x360(%rbp)
14010fa39:     	movq	$0x0, 0x3b0(%rbp)
14010fa44:     	movups	%xmm12, 0x3c8(%rbp)
14010fa4c:     	movups	%xmm11, 0x3b8(%rbp)
14010fa54:     	movl	$0x0, 0x762(%rbp)
14010fa5e:     	movq	$0x0, 0x75a(%rbp)
14010fa69:     	movaps	0x280(%rbp), %xmm0
14010fa70:     	movups	%xmm0, 0x2d2(%rbp)
14010fa77:     	movaps	0x240(%rbp), %xmm0
14010fa7e:     	movaps	0x250(%rbp), %xmm1
14010fa85:     	movaps	0x260(%rbp), %xmm2
14010fa8c:     	movaps	0x270(%rbp), %xmm3
14010fa93:     	movups	%xmm3, 0x2c2(%rbp)
14010fa9a:     	movups	%xmm2, 0x2b2(%rbp)
14010faa1:     	movups	%xmm1, 0x2a2(%rbp)
14010faa8:     	movups	%xmm0, 0x292(%rbp)
14010faaf:     	leaq	0x5e8(%rbp), %rcx
14010fab6:     	leaq	0x300(%rbp), %rdx
14010fabd:     	movl	$0xd8, %r8d
14010fac3:     	callq	0x1457731ed <.text+0x57721ed>
14010fac8:     	movaps	0x57f7a21(%rip), %xmm0  # 0x1459074f0
14010facf:     	movups	%xmm0, 0x6c0(%rbp)
14010fad6:     	movaps	0x5805e23(%rip), %xmm0  # 0x145915900
14010fadd:     	movups	%xmm0, 0x6d0(%rbp)
14010fae4:     	movups	%xmm6, 0x6e0(%rbp)
14010faeb:     	movups	%xmm6, 0x6f0(%rbp)
14010faf2:     	movups	%xmm15, 0x700(%rbp)
14010fafa:     	movups	%xmm15, 0x710(%rbp)
14010fb02:     	movups	%xmm10, 0x720(%rbp)
14010fb0a:     	movl	$0x1, 0x730(%rbp)
14010fb14:     	movq	$0x0, 0x734(%rbp)
14010fb1f:     	movb	$0x1, 0x73c(%rbp)
14010fb26:     	movq	$0x0, 0x740(%rbp)
14010fb31:     	movl	$0x3f800000, 0x748(%rbp) # imm = 0x3F800000
14010fb3b:     	movw	$0x0, 0x74c(%rbp)
14010fb44:     	movl	$0x10000, 0x74e(%rbp)   # imm = 0x10000
14010fb4e:     	movw	$0x0, 0x752(%rbp)
14010fb57:     	movl	$0x10000, 0x754(%rbp)   # imm = 0x10000
14010fb61:     	movw	$0x0, 0x758(%rbp)
14010fb6a:     	movzwl	0x2e0(%rbp), %eax
14010fb71:     	movw	%ax, 0x7b6(%rbp)
14010fb78:     	movups	0x2d0(%rbp), %xmm0
14010fb7f:     	movups	%xmm0, 0x7a6(%rbp)
14010fb86:     	movups	0x290(%rbp), %xmm0
14010fb8d:     	movups	0x2a0(%rbp), %xmm1
14010fb94:     	movups	0x2b0(%rbp), %xmm2
14010fb9b:     	movups	0x2c0(%rbp), %xmm3
14010fba2:     	movups	%xmm3, 0x796(%rbp)
14010fba9:     	movups	%xmm2, 0x786(%rbp)
14010fbb0:     	movups	%xmm1, 0x776(%rbp)
14010fbb7:     	movups	%xmm0, 0x766(%rbp)
14010fbbe:     	movq	%r12, 0x5e0(%rbp)
14010fbc5:     	movb	$0x1, 0x827(%rbp)
14010fbcc:     	leaq	0x550(%rbp), %rcx
14010fbd3:     	leaq	0x5e0(%rbp), %r8
14010fbda:     	movq	%r15, %rdx
14010fbdd:     	callq	0x1400d77d0 <.text+0xd67d0>
14010fbe2:     	nop
14010fbe3:     	movq	0x818(%rbp), %rax
14010fbea:     	movq	(%rax), %rsi
14010fbed:     	callq	0x140002200 <.text+0x1200>
14010fbf2:     	movl	$0x1, %ecx
14010fbf7:     	movl	$0x1, %edx
14010fbfc:     	callq	0x1400021c0 <.text+0x11c0>
14010fc01:     	testq	%rax, %rax
14010fc04:     	je	0x14010fdb3 <.text+0x10edb3>
14010fc0a:     	movb	$0x52, (%rax)
14010fc0d:     	cmpb	$0x1, (%rsi)
14010fc10:     	jne	0x14010fc31 <.text+0x10ec31>
14010fc12:     	movl	0x1(%rsi), %ecx
14010fc15:     	movl	0x4(%rsi), %edx
14010fc18:     	movl	%edx, 0x303(%rbp)
14010fc1e:     	movl	%ecx, 0x300(%rbp)
14010fc24:     	movq	0x8(%rsi), %rcx
14010fc28:     	movzbl	0x10(%rsi), %edx
14010fc2c:     	movb	$0x1, %r8b
14010fc2f:     	jmp	0x14010fc42 <.text+0x10ec42>
14010fc31:     	movq	0x8(%rsi), %rcx
14010fc35:     	lock
14010fc36:     	incq	(%rcx)
14010fc39:     	jle	0x14010fdca <.text+0x10edca>
14010fc3f:     	xorl	%r8d, %r8d
14010fc42:     	movq	$0x1, 0x5e0(%rbp)
14010fc4d:     	movq	%rax, 0x5e8(%rbp)
14010fc54:     	movq	$0x1, 0x5f0(%rbp)
14010fc5f:     	movq	$0x0, 0x5f8(%rbp)
14010fc6a:     	movq	$0x4, 0x600(%rbp)
14010fc75:     	movq	$0x0, 0x608(%rbp)
14010fc80:     	movb	%r8b, 0x610(%rbp)
14010fc87:     	movl	0x300(%rbp), %eax
14010fc8d:     	movl	0x303(%rbp), %r8d
14010fc94:     	movl	%eax, 0x611(%rbp)
14010fc9a:     	movl	%r8d, 0x614(%rbp)
14010fca1:     	movq	%rcx, 0x618(%rbp)
14010fca8:     	movq	%rdx, 0x620(%rbp)
14010fcaf:     	movl	$0x41300000, 0x628(%rbp) # imm = 0x41300000
14010fcb9:     	movw	$0x190, 0x62c(%rbp)     # imm = 0x190
14010fcc2:     	movb	$0x1, 0x62e(%rbp)
14010fcc9:     	movups	0x58309fc(%rip), %xmm0  # 0x1459406cc
14010fcd0:     	movups	%xmm0, 0x630(%rbp)
14010fcd7:     	movl	$0x3f800000, 0x640(%rbp) # imm = 0x3F800000
14010fce1:     	movl	0x5809499(%rip), %eax   # 0x145919180
14010fce7:     	movl	%eax, 0x654(%rbp)
14010fced:     	movups	0x580947c(%rip), %xmm0  # 0x145919170
14010fcf4:     	movups	%xmm0, 0x644(%rbp)
14010fcfb:     	movsd	0x5805acd(%rip), %xmm0  # 0x1459157d0
14010fd03:     	movsd	%xmm0, 0x658(%rbp)
14010fd0b:     	movb	$0x1, 0x827(%rbp)
14010fd12:     	leaq	0x550(%rbp), %rcx
14010fd19:     	leaq	0x5e0(%rbp), %rdx
14010fd20:     	callq	0x1400f1980 <.text+0xf0980>
14010fd25:     	nop
14010fd26:     	movq	0x178(%rbp), %rax
14010fd2d:     	movaps	0x830(%rbp), %xmm6
14010fd34:     	movaps	0x840(%rbp), %xmm7
14010fd3b:     	movaps	0x850(%rbp), %xmm8
14010fd43:     	movaps	0x860(%rbp), %xmm9
14010fd4b:     	movaps	0x870(%rbp), %xmm10
14010fd53:     	movaps	0x880(%rbp), %xmm11
14010fd5b:     	movaps	0x890(%rbp), %xmm12
14010fd63:     	movaps	0x8a0(%rbp), %xmm13
14010fd6b:     	movaps	0x8b0(%rbp), %xmm14
14010fd73:     	movaps	0x8c0(%rbp), %xmm15
14010fd7b:     	addq	$0x958, %rsp            # imm = 0x958
14010fd82:     	popq	%rbx
14010fd83:     	popq	%rdi
14010fd84:     	popq	%rsi
14010fd85:     	popq	%r12
14010fd87:     	popq	%r13
14010fd89:     	popq	%r14
14010fd8b:     	popq	%r15
14010fd8d:     	popq	%rbp
14010fd8e:     	retq
14010fd8f:     	movl	$0x4, %ecx
14010fd94:     	movl	$0x40, %edx
14010fd99:     	callq	0x145903781 <.text+0x5902781>
14010fd9e:     	nop
14010fd9f:     	jmp	0x14010fdca <.text+0x10edca>
14010fda1:     	movl	$0x8, %ecx
14010fda6:     	movl	$0x48, %edx
14010fdab:     	callq	0x145903781 <.text+0x5902781>
14010fdb0:     	nop
14010fdb1:     	jmp	0x14010fdca <.text+0x10edca>
14010fdb3:     	movb	$0x1, 0x827(%rbp)
14010fdba:     	movl	$0x1, %ecx
14010fdbf:     	movl	$0x1, %edx
14010fdc4:     	callq	0x14590379b <.text+0x590279b>
14010fdc9:     	nop
14010fdca:     	ud2

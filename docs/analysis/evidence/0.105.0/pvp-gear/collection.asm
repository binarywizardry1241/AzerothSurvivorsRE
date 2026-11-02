
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401df3e0:     	pushq	%rbp
1401df3e1:     	pushq	%r15
1401df3e3:     	pushq	%r14
1401df3e5:     	pushq	%r13
1401df3e7:     	pushq	%r12
1401df3e9:     	pushq	%rsi
1401df3ea:     	pushq	%rdi
1401df3eb:     	pushq	%rbx
1401df3ec:     	subq	$0x6a8, %rsp            # imm = 0x6A8
1401df3f3:     	leaq	0x80(%rsp), %rbp
1401df3fb:     	movdqa	%xmm15, 0x610(%rbp)
1401df404:     	movdqa	%xmm14, 0x600(%rbp)
1401df40d:     	movdqa	%xmm13, 0x5f0(%rbp)
1401df416:     	movdqa	%xmm12, 0x5e0(%rbp)
1401df41f:     	movdqa	%xmm11, 0x5d0(%rbp)
1401df428:     	movdqa	%xmm10, 0x5c0(%rbp)
1401df431:     	movaps	%xmm9, 0x5b0(%rbp)
1401df439:     	movaps	%xmm8, 0x5a0(%rbp)
1401df441:     	movaps	%xmm7, 0x590(%rbp)
1401df448:     	movaps	%xmm6, 0x580(%rbp)
1401df44f:     	movq	$-0x2, 0x578(%rbp)
1401df45a:     	movq	%rdx, %rsi
1401df45d:     	movq	(%rcx), %rdi
1401df460:     	movq	0x28(%rcx), %rax
1401df464:     	movq	%rdi, -0x40(%rbp)
1401df468:     	leaq	-0x38(%rbp), %r15
1401df46c:     	movups	0x8(%rcx), %xmm0
1401df470:     	movups	%xmm0, -0x38(%rbp)
1401df474:     	movq	%rcx, 0x2c0(%rbp)
1401df47b:     	movups	0x18(%rcx), %xmm0
1401df47f:     	movups	%xmm0, -0x28(%rbp)
1401df483:     	movq	%rax, -0x18(%rbp)
1401df487:     	movq	(%rdx), %r14
1401df48a:     	leaq	0x5bdc044(%rip), %rcx   # 0x145dbb4d5
1401df491:     	movl	$0x15, %edx
1401df496:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401df49b:     	movq	%rax, 0xf0(%rbp)
1401df4a2:     	movq	%rdx, 0xf8(%rbp)
1401df4a9:     	movq	0x5b8f8f0(%rip), %rax   # 0x145d6eda0
1401df4b0:     	movq	%rax, 0x130(%rbp)
1401df4b7:     	movups	0x5b8f8d2(%rip), %xmm0  # 0x145d6ed90
1401df4be:     	movaps	%xmm0, 0x120(%rbp)
1401df4c5:     	movq	0x5b8f8ec(%rip), %rax   # 0x145d6edb8
1401df4cc:     	movq	%rax, 0x148(%rbp)
1401df4d3:     	movups	0x5b8f8ce(%rip), %xmm0  # 0x145d6eda8
1401df4da:     	movups	%xmm0, 0x138(%rbp)
1401df4e1:     	movups	0x5b8f8d8(%rip), %xmm0  # 0x145d6edc0
1401df4e8:     	movaps	%xmm0, 0x150(%rbp)
1401df4ef:     	movq	0x5b8f8da(%rip), %rax   # 0x145d6edd0
1401df4f6:     	movq	%rax, 0x160(%rbp)
1401df4fd:     	movups	0x5b8f8d4(%rip), %xmm0  # 0x145d6edd8
1401df504:     	movups	%xmm0, 0x168(%rbp)
1401df50b:     	movq	0x5b8f8d6(%rip), %rax   # 0x145d6ede8
1401df512:     	movq	%rax, 0x178(%rbp)
1401df519:     	movq	0x170(%rbp), %rax
1401df520:     	movq	%rax, 0x328(%rbp)
1401df527:     	movq	0x178(%rbp), %rax
1401df52e:     	movq	%rax, 0x330(%rbp)
1401df535:     	movq	0x160(%rbp), %rax
1401df53c:     	movq	%rax, 0x318(%rbp)
1401df543:     	movq	0x168(%rbp), %rax
1401df54a:     	movq	%rax, 0x320(%rbp)
1401df551:     	movaps	0x150(%rbp), %xmm0
1401df558:     	movups	%xmm0, 0x308(%rbp)
1401df55f:     	movaps	0x140(%rbp), %xmm0
1401df566:     	movups	%xmm0, 0x2f8(%rbp)
1401df56d:     	movaps	0x130(%rbp), %xmm0
1401df574:     	movups	%xmm0, 0x2e8(%rbp)
1401df57b:     	movaps	0x120(%rbp), %xmm0
1401df582:     	movups	%xmm0, 0x2d8(%rbp)
1401df589:     	xorps	%xmm6, %xmm6
1401df58c:     	movups	%xmm6, 0x338(%rbp)
1401df593:     	movups	%xmm6, 0x348(%rbp)
1401df59a:     	movq	$0x0, 0x358(%rbp)
1401df5a5:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
1401df5af:     	movq	%rax, 0x360(%rbp)
1401df5b6:     	movups	%xmm6, 0x368(%rbp)
1401df5bd:     	movups	%xmm6, 0x378(%rbp)
1401df5c4:     	movq	$0x0, 0x388(%rbp)
1401df5cf:     	movups	0x5b8f882(%rip), %xmm0  # 0x145d6ee58
1401df5d6:     	movups	%xmm0, 0x3a0(%rbp)
1401df5dd:     	movups	0x5b8f864(%rip), %xmm0  # 0x145d6ee48
1401df5e4:     	movups	%xmm0, 0x390(%rbp)
1401df5eb:     	movups	0x5b8f876(%rip), %xmm0  # 0x145d6ee68
1401df5f2:     	movups	%xmm0, 0x3b0(%rbp)
1401df5f9:     	movups	0x5b8f878(%rip), %xmm0  # 0x145d6ee78
1401df600:     	movups	%xmm0, 0x3c0(%rbp)
1401df607:     	movups	0x5b8f87a(%rip), %xmm0  # 0x145d6ee88
1401df60e:     	movups	%xmm0, 0x3d0(%rbp)
1401df615:     	movups	0x5b8f87c(%rip), %xmm0  # 0x145d6ee98
1401df61c:     	movups	%xmm0, 0x3e0(%rbp)
1401df623:     	movups	0x5b8f87e(%rip), %xmm0  # 0x145d6eea8
1401df62a:     	movups	%xmm0, 0x3f0(%rbp)
1401df631:     	movups	0x5b8f880(%rip), %xmm0  # 0x145d6eeb8
1401df638:     	movups	%xmm0, 0x400(%rbp)
1401df63f:     	movaps	0x5b8dc1a(%rip), %xmm0  # 0x145d6d260
1401df646:     	movups	%xmm0, 0x410(%rbp)
1401df64d:     	movl	$0x1, 0x420(%rbp)
1401df657:     	movss	0x5b8dc11(%rip), %xmm0  # 0x145d6d270
1401df65f:     	movlps	%xmm0, 0x424(%rbp)
1401df666:     	movb	$0x1, 0x42c(%rbp)
1401df66d:     	movq	$0x0, 0x430(%rbp)
1401df678:     	movl	$0x3f800000, 0x438(%rbp) # imm = 0x3F800000
1401df682:     	movw	$0x0, 0x43c(%rbp)
1401df68b:     	movzwl	0x5b8f868(%rip), %eax   # 0x145d6eefa
1401df692:     	movw	%ax, 0x442(%rbp)
1401df699:     	movl	0x5b8f857(%rip), %eax   # 0x145d6eef6
1401df69f:     	movl	%eax, 0x43e(%rbp)
1401df6a5:     	movzwl	0x5b8f854(%rip), %eax   # 0x145d6ef00
1401df6ac:     	movw	%ax, 0x448(%rbp)
1401df6b3:     	movl	0x5b8f843(%rip), %eax   # 0x145d6eefc
1401df6b9:     	movl	%eax, 0x444(%rbp)
1401df6bf:     	movq	$0x0, 0x44a(%rbp)
1401df6ca:     	movl	$0x5, 0x452(%rbp)
1401df6d4:     	movq	%rdi, 0x2d0(%rbp)
1401df6db:     	leaq	-0x10(%rbp), %rdi
1401df6df:     	leaq	0x2d0(%rbp), %r8
1401df6e6:     	movq	%rdi, %rcx
1401df6e9:     	movq	%r15, %rdx
1401df6ec:     	callq	0x140189f40 <.text+0x188f40>
1401df6f1:     	leaq	0xf0(%rbp), %r8
1401df6f8:     	movq	%rdi, %rcx
1401df6fb:     	movq	%r14, %rdx
1401df6fe:     	callq	0x1401d6140 <.text+0x1d5140>
1401df703:     	movaps	0x5bd8aa6(%rip), %xmm0  # 0x145db81b0
1401df70a:     	movups	%xmm0, 0x120(%rbp)
1401df711:     	leaq	0x2e8(%rbp), %rcx
1401df718:     	leaq	0x120(%rbp), %rdx
1401df71f:     	callq	0x1426686c0 <.text+0x26676c0>
1401df724:     	movq	0x8(%rsi), %rdi
1401df728:     	movq	(%rdi), %rax
1401df72b:     	movq	$0x1, 0x2d0(%rbp)
1401df736:     	movq	$0x0, 0x2d8(%rbp)
1401df741:     	movq	%rax, 0x2e0(%rbp)
1401df748:     	leaq	0x138(%rbp), %rcx
1401df74f:     	leaq	0x2d0(%rbp), %rdx
1401df756:     	callq	0x140263420 <.text+0x262420>
1401df75b:     	movw	$0x0, 0x284(%rbp)
1401df764:     	movb	$0x1, 0x274(%rbp)
1401df76b:     	movaps	%xmm6, 0x180(%rbp)
1401df772:     	movaps	%xmm6, 0x190(%rbp)
1401df779:     	movaps	%xmm6, 0x1a0(%rbp)
1401df780:     	movaps	%xmm6, 0x1b0(%rbp)
1401df787:     	movaps	%xmm6, 0x1c0(%rbp)
1401df78e:     	movq	$0x0, 0x1d0(%rbp)
1401df799:     	movl	$0x505, 0x29a(%rbp)     # imm = 0x505
1401df7a3:     	movups	0x5bd918e(%rip), %xmm0  # 0x145db8938
1401df7aa:     	movups	%xmm0, 0x1d8(%rbp)
1401df7b1:     	movups	0x5bd9190(%rip), %xmm0  # 0x145db8948
1401df7b8:     	movups	%xmm0, 0x1e8(%rbp)
1401df7bf:     	movups	0x5bd9192(%rip), %xmm0  # 0x145db8958
1401df7c6:     	movups	%xmm0, 0x1f8(%rbp)
1401df7cd:     	movups	0x5bd9194(%rip), %xmm0  # 0x145db8968
1401df7d4:     	movups	%xmm0, 0x208(%rbp)
1401df7db:     	movups	0x5bd91a6(%rip), %xmm0  # 0x145db8988
1401df7e2:     	movups	%xmm0, 0x228(%rbp)
1401df7e9:     	movups	0x5bd9188(%rip), %xmm0  # 0x145db8978
1401df7f0:     	movups	%xmm0, 0x218(%rbp)
1401df7f7:     	movups	0x5bd919a(%rip), %xmm0  # 0x145db8998
1401df7fe:     	movups	%xmm0, 0x238(%rbp)
1401df805:     	movups	0x5bd919c(%rip), %xmm0  # 0x145db89a8
1401df80c:     	movups	%xmm0, 0x248(%rbp)
1401df813:     	movq	$0x0, 0x278(%rbp)
1401df81e:     	movl	$0x3f800000, 0x280(%rbp) # imm = 0x3F800000
1401df828:     	movaps	0x5b94781(%rip), %xmm0  # 0x145d73fb0
1401df82f:     	movups	%xmm0, 0x258(%rbp)
1401df836:     	movl	$0x1, 0x268(%rbp)
1401df840:     	movd	0x5b8dbe0(%rip), %xmm0  # 0x145d6d428
1401df848:     	movq	%xmm0, 0x26c(%rbp)
1401df850:     	movq	$0x1000000, 0x292(%rbp) # imm = 0x1000000
1401df85b:     	movups	0x5bd901e(%rip), %xmm7  # 0x145db8880
1401df862:     	movaps	%xmm7, 0x120(%rbp)
1401df869:     	movq	$0x0, 0x130(%rbp)
1401df874:     	movups	0x5bd9035(%rip), %xmm6  # 0x145db88b0
1401df87b:     	movaps	%xmm6, 0x150(%rbp)
1401df882:     	movq	$0x0, 0x160(%rbp)
1401df88d:     	movups	0x5bd9033(%rip), %xmm8  # 0x145db88c8
1401df895:     	movups	%xmm8, 0x168(%rbp)
1401df89d:     	movq	$0x0, 0x178(%rbp)
1401df8a8:     	movw	$0x0, 0x28a(%rbp)
1401df8b1:     	movl	$0x10000, 0x286(%rbp)   # imm = 0x10000
1401df8bb:     	movw	$0x0, 0x290(%rbp)
1401df8c4:     	movl	$0x10000, 0x28c(%rbp)   # imm = 0x10000
1401df8ce:     	movq	-0x40(%rbp), %rbx
1401df8d2:     	leaq	0x2d8(%rbp), %rcx
1401df8d9:     	leaq	0x120(%rbp), %rdx
1401df8e0:     	movl	$0x180, %r8d            # imm = 0x180
1401df8e6:     	callq	0x145bc977b <.text+0x5bc877b>
1401df8eb:     	movq	%rbx, 0x2d0(%rbp)
1401df8f2:     	movq	%r14, %rbx
1401df8f5:     	leaq	0x30(%rbp), %rcx
1401df8f9:     	leaq	0x2d0(%rbp), %r8
1401df900:     	movq	%r15, %rdx
1401df903:     	callq	0x140189f40 <.text+0x188f40>
1401df908:     	nop
1401df909:     	movq	0x10(%rsi), %rax
1401df90d:     	movq	%rax, 0x2a8(%rbp)
1401df914:     	movq	0x18(%rsi), %rax
1401df918:     	movq	%rax, 0x4e0(%rbp)
1401df91f:     	movq	0x20(%rsi), %rax
1401df923:     	movq	%rax, 0x508(%rbp)
1401df92a:     	movq	0x28(%rsi), %rax
1401df92e:     	movq	%rax, 0x2b0(%rbp)
1401df935:     	movq	0x30(%rbp), %rsi
1401df939:     	movq	0x58(%rbp), %rax
1401df93d:     	movq	%rsi, 0x78(%rbp)
1401df941:     	leaq	0x80(%rbp), %r14
1401df948:     	movups	0x38(%rbp), %xmm0
1401df94c:     	movups	%xmm0, 0x80(%rbp)
1401df953:     	movdqu	0x48(%rbp), %xmm0
1401df958:     	movdqu	%xmm0, 0x90(%rbp)
1401df960:     	movq	%rax, 0xa0(%rbp)
1401df967:     	leaq	0x2d8(%rbp), %rcx
1401df96e:     	leaq	0x5bd8f0b(%rip), %rdx   # 0x145db8880
1401df975:     	movl	$0x180, %r8d            # imm = 0x180
1401df97b:     	callq	0x145bc977b <.text+0x5bc877b>
1401df980:     	movq	%rsi, 0x2d0(%rbp)
1401df987:     	leaq	0x120(%rbp), %rcx
1401df98e:     	leaq	0x2d0(%rbp), %r8
1401df995:     	movq	%r14, %rdx
1401df998:     	callq	0x140189f40 <.text+0x188f40>
1401df99d:     	nop
1401df99e:     	movq	(%rdi), %rsi
1401df9a1:     	leaq	0x180(%rbp), %r15
1401df9a8:     	leaq	0x1(%rbx), %rax
1401df9ac:     	movq	%rax, 0x550(%rbp)
1401df9b3:     	leaq	0x2d0(%rbp), %rdi
1401df9ba:     	xorps	%xmm9, %xmm9
1401df9be:     	movabsq	$0x300000000000000, %r12 # imm = 0x300000000000000
1401df9c8:     	movdqa	0x5bd848f(%rip), %xmm10 # 0x145db7e60
1401df9d1:     	movdqa	0x5b8d816(%rip), %xmm11 # 0x145d6d1f0
1401df9da:     	movdqa	0x5b8d81d(%rip), %xmm12 # 0x145d6d200
1401df9e3:     	movdqa	0x5bd8464(%rip), %xmm13 # 0x145db7e50
1401df9ec:     	movdqa	0x5b8d77b(%rip), %xmm14 # 0x145d6d170
1401df9f5:     	movdqa	0x5b8d782(%rip), %xmm15 # 0x145d6d180
1401df9fe:     	xorl	%edx, %edx
1401dfa00:     	movq	%rbx, 0x568(%rbp)
1401dfa07:     	movq	%rsi, 0x2b8(%rbp)
1401dfa0e:     	cmpq	%rsi, %rdx
1401dfa11:     	jae	0x1401e00af <.text+0x1df0af>
1401dfa17:     	movq	0x2a8(%rbp), %rax
1401dfa1e:     	movzbl	(%rax), %ecx
1401dfa21:     	movq	%rdx, 0x560(%rbp)
1401dfa28:     	xorl	%r8d, %r8d
1401dfa2b:     	callq	0x1458bea70 <.text+0x58bda70>
1401dfa30:     	nop
1401dfa31:     	movq	%rdi, %rcx
1401dfa34:     	movl	%eax, %edx
1401dfa36:     	callq	0x1458bd6f0 <.text+0x58bc6f0>
1401dfa3b:     	nop
1401dfa3c:     	movq	0x2d0(%rbp), %rdx
1401dfa43:     	cmpq	$-0x1, %rdx
1401dfa47:     	je	0x1401dfc20 <.text+0x1dec20>
1401dfa4d:     	movq	0x2e8(%rbp), %r13
1401dfa54:     	movq	0x2f0(%rbp), %rdi
1401dfa5b:     	movzbl	0x338(%rbp), %esi
1401dfa62:     	testq	%rdx, %rdx
1401dfa65:     	je	0x1401dfa79 <.text+0x1dea79>
1401dfa67:     	movq	0x2d8(%rbp), %rcx
1401dfa6e:     	movl	$0x1, %r8d
1401dfa74:     	callq	0x1400021d0 <.text+0x11d0>
1401dfa79:     	testq	%r13, %r13
1401dfa7c:     	je	0x1401dfa93 <.text+0x1dea93>
1401dfa7e:     	shlq	$0x3, %r13
1401dfa82:     	movl	$0x4, %r8d
1401dfa88:     	movq	%rdi, %rcx
1401dfa8b:     	movq	%r13, %rdx
1401dfa8e:     	callq	0x1400021d0 <.text+0x11d0>
1401dfa93:     	movq	0x4e0(%rbp), %rax
1401dfa9a:     	cmpb	$0x0, 0x70(%rax)
1401dfa9e:     	je	0x1401dfc33 <.text+0x1dec33>
1401dfaa4:     	cmpb	%sil, 0x71(%rax)
1401dfaa8:     	movw	$0x0, 0x284(%rbp)
1401dfab1:     	movb	$0x1, 0x274(%rbp)
1401dfab8:     	movups	%xmm9, 0x40(%r15)
1401dfabd:     	movups	%xmm9, 0x30(%r15)
1401dfac2:     	movups	%xmm9, 0x20(%r15)
1401dfac7:     	movups	%xmm9, 0x10(%r15)
1401dfacc:     	movups	%xmm9, (%r15)
1401dfad0:     	movq	$0x0, 0x50(%r15)
1401dfad8:     	movl	$0x0, 0x29a(%rbp)
1401dfae2:     	movups	0x5bd8e5f(%rip), %xmm0  # 0x145db8948
1401dfae9:     	movups	%xmm0, 0x68(%r15)
1401dfaee:     	movups	0x5bd8e43(%rip), %xmm0  # 0x145db8938
1401dfaf5:     	movups	%xmm0, 0x58(%r15)
1401dfafa:     	movups	0x5bd8e67(%rip), %xmm0  # 0x145db8968
1401dfb01:     	movups	%xmm0, 0x88(%r15)
1401dfb09:     	movups	0x5bd8e48(%rip), %xmm0  # 0x145db8958
1401dfb10:     	movups	%xmm0, 0x78(%r15)
1401dfb15:     	movups	0x5bd8e6c(%rip), %xmm0  # 0x145db8988
1401dfb1c:     	movups	%xmm0, 0xa8(%r15)
1401dfb24:     	movups	0x5bd8e4d(%rip), %xmm0  # 0x145db8978
1401dfb2b:     	movups	%xmm0, 0x98(%r15)
1401dfb33:     	movups	0x5bd8e6e(%rip), %xmm0  # 0x145db89a8
1401dfb3a:     	movups	%xmm0, 0xc8(%r15)
1401dfb42:     	movups	0x5bd8e4f(%rip), %xmm0  # 0x145db8998
1401dfb49:     	movups	%xmm0, 0xb8(%r15)
1401dfb51:     	movq	$0x0, 0x278(%rbp)
1401dfb5c:     	movl	$0x3f800000, 0x280(%rbp) # imm = 0x3F800000
1401dfb66:     	movaps	0x5b8d6f3(%rip), %xmm0  # 0x145d6d260
1401dfb6d:     	movups	%xmm0, 0x258(%rbp)
1401dfb74:     	movl	$0x1, 0x268(%rbp)
1401dfb7e:     	movq	$0x0, 0x26c(%rbp)
1401dfb89:     	movq	%r12, 0x292(%rbp)
1401dfb90:     	movaps	%xmm7, 0x120(%rbp)
1401dfb97:     	movq	$0x0, 0x130(%rbp)
1401dfba2:     	movups	0x5bd8cef(%rip), %xmm0  # 0x145db8898
1401dfba9:     	leaq	0x138(%rbp), %rax
1401dfbb0:     	movups	%xmm0, (%rax)
1401dfbb3:     	movq	$0x0, 0x10(%rax)
1401dfbbb:     	movups	%xmm6, -0x30(%r15)
1401dfbc0:     	movq	$0x0, -0x20(%r15)
1401dfbc8:     	movups	%xmm8, -0x18(%r15)
1401dfbcd:     	movq	$0x0, -0x8(%r15)
1401dfbd5:     	movl	$0x10000, 0x106(%r15)   # imm = 0x10000
1401dfbe0:     	movw	$0x0, 0x10a(%r15)
1401dfbea:     	movw	$0x0, 0x110(%r15)
1401dfbf4:     	movl	$0x10000, 0x10c(%r15)   # imm = 0x10000
1401dfbff:     	jne	0x1401dfd8a <.text+0x1ded8a>
1401dfc05:     	movdqu	0x5bd8c5f(%rip), %xmm0  # 0x145db886c
1401dfc0d:     	jmp	0x1401dfd92 <.text+0x1ded92>
1401dfc12:     	nopw	%cs:(%rax,%rax)
1401dfc20:     	xorl	%esi, %esi
1401dfc22:     	movq	0x4e0(%rbp), %rax
1401dfc29:     	cmpb	$0x0, 0x70(%rax)
1401dfc2d:     	jne	0x1401dfaa4 <.text+0x1deaa4>
1401dfc33:     	movw	$0x0, 0x284(%rbp)
1401dfc3c:     	movb	$0x1, 0x274(%rbp)
1401dfc43:     	movups	%xmm9, 0x40(%r15)
1401dfc48:     	movups	%xmm9, 0x30(%r15)
1401dfc4d:     	movups	%xmm9, 0x20(%r15)
1401dfc52:     	movups	%xmm9, 0x10(%r15)
1401dfc57:     	movups	%xmm9, (%r15)
1401dfc5b:     	movq	$0x0, 0x50(%r15)
1401dfc63:     	movl	$0x0, 0x29a(%rbp)
1401dfc6d:     	movups	0x5bd8cd4(%rip), %xmm0  # 0x145db8948
1401dfc74:     	movups	%xmm0, 0x68(%r15)
1401dfc79:     	movups	0x5bd8cb8(%rip), %xmm0  # 0x145db8938
1401dfc80:     	movups	%xmm0, 0x58(%r15)
1401dfc85:     	movups	0x5bd8cdc(%rip), %xmm0  # 0x145db8968
1401dfc8c:     	movups	%xmm0, 0x88(%r15)
1401dfc94:     	movups	0x5bd8cbd(%rip), %xmm0  # 0x145db8958
1401dfc9b:     	movups	%xmm0, 0x78(%r15)
1401dfca0:     	movups	0x5bd8ce1(%rip), %xmm0  # 0x145db8988
1401dfca7:     	movups	%xmm0, 0xa8(%r15)
1401dfcaf:     	movups	0x5bd8cc2(%rip), %xmm0  # 0x145db8978
1401dfcb6:     	movups	%xmm0, 0x98(%r15)
1401dfcbe:     	movups	0x5bd8ce3(%rip), %xmm0  # 0x145db89a8
1401dfcc5:     	movups	%xmm0, 0xc8(%r15)
1401dfccd:     	movups	0x5bd8cc4(%rip), %xmm0  # 0x145db8998
1401dfcd4:     	movups	%xmm0, 0xb8(%r15)
1401dfcdc:     	movq	$0x0, 0x278(%rbp)
1401dfce7:     	movl	$0x3f800000, 0x280(%rbp) # imm = 0x3F800000
1401dfcf1:     	movaps	0x5b8d568(%rip), %xmm0  # 0x145d6d260
1401dfcf8:     	movups	%xmm0, 0x258(%rbp)
1401dfcff:     	movl	$0x1, 0x268(%rbp)
1401dfd09:     	movq	$0x0, 0x26c(%rbp)
1401dfd14:     	movq	%r12, 0x292(%rbp)
1401dfd1b:     	movaps	%xmm7, 0x120(%rbp)
1401dfd22:     	movq	$0x0, 0x130(%rbp)
1401dfd2d:     	movups	0x5bd8b64(%rip), %xmm0  # 0x145db8898
1401dfd34:     	leaq	0x138(%rbp), %rax
1401dfd3b:     	movups	%xmm0, (%rax)
1401dfd3e:     	movq	$0x0, 0x10(%rax)
1401dfd46:     	movups	%xmm6, -0x30(%r15)
1401dfd4b:     	movq	$0x0, -0x20(%r15)
1401dfd53:     	movups	%xmm8, -0x18(%r15)
1401dfd58:     	movq	$0x0, -0x8(%r15)
1401dfd60:     	movl	$0x10000, 0x106(%r15)   # imm = 0x10000
1401dfd6b:     	movw	$0x0, 0x10a(%r15)
1401dfd75:     	movw	$0x0, 0x110(%r15)
1401dfd7f:     	movl	$0x10000, 0x10c(%r15)   # imm = 0x10000
1401dfd8a:     	movdqu	0x5bd8aaa(%rip), %xmm0  # 0x145db883c
1401dfd92:     	movdqa	%xmm0, 0xc0(%rbp)
1401dfd9a:     	movl	$0x3f800000, 0xd0(%rbp) # imm = 0x3F800000
1401dfda4:     	movl	%esi, %ecx
1401dfda6:     	callq	0x1458bfc90 <.text+0x58bec90>
1401dfdab:     	nop
1401dfdac:     	movq	%rdx, %rsi
1401dfdaf:     	testq	%rdx, %rdx
1401dfdb2:     	js	0x1401e099a <.text+0x1df99a>
1401dfdb8:     	testq	%rsi, %rsi
1401dfdbb:     	je	0x1401dfdf9 <.text+0x1dedf9>
1401dfdbd:     	movq	%rax, %r13
1401dfdc0:     	callq	0x140002200 <.text+0x1200>
1401dfdc5:     	movl	$0x1, %edx
1401dfdca:     	movq	%rsi, %rcx
1401dfdcd:     	callq	0x1400021c0 <.text+0x11c0>
1401dfdd2:     	testq	%rax, %rax
1401dfdd5:     	je	0x1401e1209 <.text+0x1e0209>
1401dfddb:     	movq	%rax, %r14
1401dfdde:     	movq	%rax, %rcx
1401dfde1:     	movq	%r13, %rdx
1401dfde4:     	movq	%rsi, %r8
1401dfde7:     	callq	0x145bc977b <.text+0x5bc877b>
1401dfdec:     	cmpq	$0x8, %rsi
1401dfdf0:     	jae	0x1401dfe04 <.text+0x1dee04>
1401dfdf2:     	xorl	%eax, %eax
1401dfdf4:     	jmp	0x1401dfef0 <.text+0x1deef0>
1401dfdf9:     	movl	$0x1, %r14d
1401dfdff:     	jmp	0x1401dff0f <.text+0x1def0f>
1401dfe04:     	cmpq	$0x20, %rsi
1401dfe08:     	jae	0x1401dfe11 <.text+0x1dee11>
1401dfe0a:     	xorl	%eax, %eax
1401dfe0c:     	jmp	0x1401dfe9c <.text+0x1dee9c>
1401dfe11:     	movq	%rsi, %rax
1401dfe14:     	movabsq	$0x7fffffffffffffe0, %rcx # imm = 0x7FFFFFFFFFFFFFE0
1401dfe1e:     	andq	%rcx, %rax
1401dfe21:     	xorl	%ecx, %ecx
1401dfe23:     	nopw	%cs:(%rax,%rax)
1401dfe30:     	movdqu	(%r14,%rcx), %xmm0
1401dfe36:     	movdqu	0x10(%r14,%rcx), %xmm1
1401dfe3d:     	movdqa	%xmm0, %xmm2
1401dfe41:     	paddb	%xmm13, %xmm2
1401dfe46:     	movdqa	%xmm1, %xmm3
1401dfe4a:     	paddb	%xmm13, %xmm3
1401dfe4f:     	movdqa	%xmm2, %xmm4
1401dfe53:     	pminub	%xmm14, %xmm4
1401dfe58:     	pcmpeqb	%xmm2, %xmm4
1401dfe5c:     	pand	%xmm15, %xmm4
1401dfe61:     	movdqa	%xmm3, %xmm2
1401dfe65:     	pminub	%xmm14, %xmm2
1401dfe6a:     	pcmpeqb	%xmm3, %xmm2
1401dfe6e:     	pand	%xmm15, %xmm2
1401dfe73:     	pxor	%xmm0, %xmm4
1401dfe77:     	pxor	%xmm1, %xmm2
1401dfe7b:     	movdqu	%xmm4, (%r14,%rcx)
1401dfe81:     	movdqu	%xmm2, 0x10(%r14,%rcx)
1401dfe88:     	addq	$0x20, %rcx
1401dfe8c:     	cmpq	%rcx, %rax
1401dfe8f:     	jne	0x1401dfe30 <.text+0x1dee30>
1401dfe91:     	cmpq	%rax, %rsi
1401dfe94:     	je	0x1401dff0f <.text+0x1def0f>
1401dfe96:     	testb	$0x18, %sil
1401dfe9a:     	je	0x1401dfef0 <.text+0x1deef0>
1401dfe9c:     	movq	%rax, %rcx
1401dfe9f:     	movq	%rsi, %rax
1401dfea2:     	movabsq	$0x7ffffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFFF8
1401dfeac:     	andq	%rdx, %rax
1401dfeaf:     	nop
1401dfeb0:     	movq	(%r14,%rcx), %xmm0
1401dfeb6:     	movdqa	%xmm0, %xmm1
1401dfeba:     	paddb	%xmm10, %xmm1
1401dfebf:     	movdqa	%xmm1, %xmm2
1401dfec3:     	pmaxub	%xmm11, %xmm2
1401dfec8:     	pcmpeqb	%xmm1, %xmm2
1401dfecc:     	pandn	%xmm12, %xmm2
1401dfed1:     	pxor	%xmm0, %xmm2
1401dfed5:     	movq	%xmm2, (%r14,%rcx)
1401dfedb:     	addq	$0x8, %rcx
1401dfedf:     	cmpq	%rcx, %rax
1401dfee2:     	jne	0x1401dfeb0 <.text+0x1deeb0>
1401dfee4:     	jmp	0x1401dff0a <.text+0x1def0a>
1401dfee6:     	nopw	%cs:(%rax,%rax)
1401dfef0:     	movzbl	(%r14,%rax), %ecx
1401dfef5:     	leal	-0x61(%rcx), %edx
1401dfef8:     	cmpb	$0x1a, %dl
1401dfefb:     	setb	%dl
1401dfefe:     	shlb	$0x5, %dl
1401dff01:     	xorb	%cl, %dl
1401dff03:     	movb	%dl, (%r14,%rax)
1401dff07:     	incq	%rax
1401dff0a:     	cmpq	%rax, %rsi
1401dff0d:     	jne	0x1401dfef0 <.text+0x1deef0>
1401dff0f:     	cmpb	$0x1, (%rbx)
1401dff12:     	jne	0x1401dff40 <.text+0x1def40>
1401dff14:     	movq	0x550(%rbp), %rcx
1401dff1b:     	movl	(%rcx), %eax
1401dff1d:     	movl	0x3(%rcx), %ecx
1401dff20:     	movl	%ecx, 0x533(%rbp)
1401dff26:     	movl	%eax, 0x530(%rbp)
1401dff2c:     	movq	0x8(%rbx), %rdi
1401dff30:     	movzbl	0x10(%rbx), %ebx
1401dff34:     	movb	$0x1, %r13b
1401dff37:     	jmp	0x1401dff51 <.text+0x1def51>
1401dff39:     	nopl	(%rax)
1401dff40:     	movq	0x8(%rbx), %rdi
1401dff44:     	lock
1401dff45:     	incq	(%rdi)
1401dff48:     	jle	0x1401e1216 <.text+0x1e0216>
1401dff4e:     	xorl	%r13d, %r13d
1401dff51:     	movl	0x530(%rbp), %eax
1401dff57:     	movl	0x533(%rbp), %ecx
1401dff5d:     	leaq	0x2d8(%rbp), %r12
1401dff64:     	movl	%ecx, 0x1b4(%r12)
1401dff6c:     	movl	%eax, 0x1b1(%r12)
1401dff74:     	movl	0xd0(%rbp), %eax
1401dff7a:     	leaq	0xf1(%rbp), %rcx
1401dff81:     	movl	%eax, 0x10(%rcx)
1401dff84:     	movaps	0xc0(%rbp), %xmm0
1401dff8b:     	movups	%xmm0, (%rcx)
1401dff8e:     	movq	0xfd(%rbp), %rax
1401dff95:     	movq	%rax, 0x1dc(%r12)
1401dff9d:     	movups	0xf0(%rbp), %xmm0
1401dffa4:     	movups	%xmm0, 0x1cf(%r12)
1401dffad:     	movl	$0x180, %r8d            # imm = 0x180
1401dffb3:     	movq	%r12, %rcx
1401dffb6:     	leaq	0x120(%rbp), %rdx
1401dffbd:     	callq	0x145bc977b <.text+0x5bc877b>
1401dffc2:     	movq	0x78(%rbp), %rax
1401dffc6:     	movq	%rsi, 0x458(%rbp)
1401dffcd:     	movq	%r14, 0x460(%rbp)
1401dffd4:     	movq	%rsi, 0x468(%rbp)
1401dffdb:     	movq	$0x0, 0x470(%rbp)
1401dffe6:     	movq	$0x4, 0x478(%rbp)
1401dfff1:     	movq	$0x0, 0x480(%rbp)
1401dfffc:     	movb	%r13b, 0x488(%rbp)
1401e0003:     	movq	%rdi, 0x490(%rbp)
1401e000a:     	movq	%rbx, 0x498(%rbp)
1401e0011:     	movl	$0x41200000, 0x4a0(%rbp) # imm = 0x41200000
1401e001b:     	movw	$0x190, 0x4a4(%rbp)     # imm = 0x190
1401e0024:     	movb	$0x1, 0x4a6(%rbp)
1401e002b:     	movl	0x5b8e2b7(%rip), %ecx   # 0x145d6e2e8
1401e0031:     	movl	%ecx, 0x1f4(%r12)
1401e0039:     	movups	0x5b8e298(%rip), %xmm0  # 0x145d6e2d8
1401e0040:     	movups	%xmm0, 0x1e4(%r12)
1401e0049:     	movq	0x5b8d17f(%rip), %xmm0  # 0x145d6d1d0
1401e0051:     	movq	%xmm0, 0x4d0(%rbp)
1401e0059:     	movw	$0x1, 0x4d8(%rbp)
1401e0062:     	movq	%rax, 0x2d0(%rbp)
1401e0069:     	leaq	-0x10(%rbp), %rcx
1401e006d:     	leaq	0x80(%rbp), %rdx
1401e0074:     	leaq	0x2d0(%rbp), %rdi
1401e007b:     	movq	%rdi, %r8
1401e007e:     	callq	0x14018e670 <.text+0x18d670>
1401e0083:     	nop
1401e0084:     	movq	0x568(%rbp), %rbx
1401e008b:     	movq	0x2b8(%rbp), %rsi
1401e0092:     	movabsq	$0x300000000000000, %r12 # imm = 0x300000000000000
1401e009c:     	movq	0x560(%rbp), %rdx
1401e00a3:     	incq	%rdx
1401e00a6:     	cmpq	%rsi, %rdx
1401e00a9:     	jb	0x1401dfa17 <.text+0x1dea17>
1401e00af:     	movups	0x5bd92ca(%rip), %xmm0  # 0x145db9380
1401e00b6:     	movups	%xmm0, 0x20(%rbp)
1401e00ba:     	movups	0x5bd92af(%rip), %xmm0  # 0x145db9370
1401e00c1:     	movups	%xmm0, 0x10(%rbp)
1401e00c5:     	movdqu	0x5bd9293(%rip), %xmm0  # 0x145db9360
1401e00cd:     	movdqu	%xmm0, (%rbp)
1401e00d2:     	leaq	0x500(%rbp), %rdx
1401e00d9:     	leaq	0xa8(%rbp), %rcx
1401e00e0:     	movd	0x5b8d25b(%rip), %xmm12 # 0x145d6d344
1401e00e9:     	pxor	%xmm13, %xmm13
1401e00ee:     	movdqa	0x5bbdc79(%rip), %xmm14 # 0x145d9dd70
1401e00f7:     	leaq	0x59ced72(%rip), %r12   # 0x145baee70 <.text+0x5bade70>
1401e00fe:     	xorl	%r14d, %r14d
1401e0101:     	movq	0x508(%rbp), %rdi
1401e0108:     	cmpq	$0x6, %r14
1401e010c:     	je	0x1401e0938 <.text+0x1df938>
1401e0112:     	movq	(%rbp,%r14,8), %rax
1401e0117:     	movq	%rax, 0x500(%rbp)
1401e011e:     	movq	$0x0, 0x2e0(%rbp)
1401e0129:     	movq	%rsi, 0x2e8(%rbp)
1401e0130:     	movq	0x2a8(%rbp), %rax
1401e0137:     	movq	%rax, 0x2d0(%rbp)
1401e013e:     	movq	%rdx, 0x2d8(%rbp)
1401e0145:     	leaq	0x2d0(%rbp), %rdx
1401e014c:     	callq	0x140264790 <.text+0x263790>
1401e0151:     	nop
1401e0152:     	movq	%r14, 0x2c8(%rbp)
1401e0159:     	movq	0xb0(%rbp), %rax
1401e0160:     	movq	%rax, 0x560(%rbp)
1401e0167:     	movq	0xb8(%rbp), %r13
1401e016e:     	testq	%r13, %r13
1401e0171:     	je	0x1401e01ba <.text+0x1df1ba>
1401e0173:     	movq	0x508(%rbp), %rax
1401e017a:     	movq	0x120(%rax), %rsi
1401e0181:     	xorl	%ebx, %ebx
1401e0183:     	xorl	%edi, %edi
1401e0185:     	nopw	%cs:(%rax,%rax)
1401e0190:     	movq	0x560(%rbp), %rax
1401e0197:     	movl	(%rax,%rbx,4), %edx
1401e019a:     	movb	$0x1, 0x577(%rbp)
1401e01a1:     	movq	%rsi, %rcx
1401e01a4:     	callq	0x145885c40 <.text+0x5884c40>
1401e01a9:     	nop
1401e01aa:     	movzbl	%al, %eax
1401e01ad:     	addq	%rax, %rdi
1401e01b0:     	incq	%rbx
1401e01b3:     	cmpq	%r13, %rbx
1401e01b6:     	jne	0x1401e0190 <.text+0x1df190>
1401e01b8:     	jmp	0x1401e01bc <.text+0x1df1bc>
1401e01ba:     	xorl	%edi, %edi
1401e01bc:     	movq	%rdi, 0x2a0(%rbp)
1401e01c3:     	movq	0x500(%rbp), %rax
1401e01ca:     	leaq	-0x1(%rax), %rcx
1401e01ce:     	movdqa	%xmm12, %xmm9
1401e01d3:     	movdqa	%xmm12, %xmm10
1401e01d8:     	movdqa	%xmm12, %xmm11
1401e01dd:     	cmpq	$0x4, %rcx
1401e01e1:     	ja	0x1401e020d <.text+0x1df20d>
1401e01e3:     	leaq	0x5bdceae(%rip), %rcx   # 0x145dbd098
1401e01ea:     	movd	-0x4(%rcx,%rax,4), %xmm9
1401e01f1:     	leaq	0x5bdceb4(%rip), %rcx   # 0x145dbd0ac
1401e01f8:     	movd	-0x4(%rcx,%rax,4), %xmm10
1401e01ff:     	leaq	0x5bdceba(%rip), %rcx   # 0x145dbd0c0
1401e0206:     	movd	-0x4(%rcx,%rax,4), %xmm11
1401e020d:     	movdqu	%xmm13, 0x40(%r15)
1401e0213:     	movdqu	%xmm13, 0x30(%r15)
1401e0219:     	movdqu	%xmm13, 0x20(%r15)
1401e021f:     	movdqu	%xmm13, 0x10(%r15)
1401e0225:     	movdqu	%xmm13, (%r15)
1401e022a:     	movq	$0x0, 0x50(%r15)
1401e0232:     	leaq	0x2d8(%rbp), %rdi
1401e0239:     	movw	$0x0, 0x17c(%rdi)
1401e0242:     	movl	$0x0, 0x178(%rdi)
1401e024c:     	movups	0x5bd86f5(%rip), %xmm0  # 0x145db8948
1401e0253:     	movups	%xmm0, 0x68(%r15)
1401e0258:     	movups	0x5bd86d9(%rip), %xmm0  # 0x145db8938
1401e025f:     	movups	%xmm0, 0x58(%r15)
1401e0264:     	movups	0x5bd86fd(%rip), %xmm0  # 0x145db8968
1401e026b:     	movups	%xmm0, 0x88(%r15)
1401e0273:     	movups	0x5bd86de(%rip), %xmm0  # 0x145db8958
1401e027a:     	movups	%xmm0, 0x78(%r15)
1401e027f:     	movups	0x5bd8702(%rip), %xmm0  # 0x145db8988
1401e0286:     	movups	%xmm0, 0xa8(%r15)
1401e028e:     	movups	0x5bd86e3(%rip), %xmm0  # 0x145db8978
1401e0295:     	movups	%xmm0, 0x98(%r15)
1401e029d:     	movups	0x5bd8704(%rip), %xmm0  # 0x145db89a8
1401e02a4:     	movups	%xmm0, 0xc8(%r15)
1401e02ac:     	movups	0x5bd86e5(%rip), %xmm0  # 0x145db8998
1401e02b3:     	movups	%xmm0, 0xb8(%r15)
1401e02bb:     	movaps	%xmm7, 0x120(%rbp)
1401e02c2:     	movq	$0x0, 0x130(%rbp)
1401e02cd:     	movups	0x5bd85c4(%rip), %xmm0  # 0x145db8898
1401e02d4:     	leaq	0x138(%rbp), %rax
1401e02db:     	movups	%xmm0, (%rax)
1401e02de:     	movq	$0x0, 0x10(%rax)
1401e02e6:     	movups	%xmm6, -0x30(%r15)
1401e02eb:     	movq	$0x0, -0x20(%r15)
1401e02f3:     	movups	%xmm8, -0x18(%r15)
1401e02f8:     	movq	$0x0, -0x8(%r15)
1401e0300:     	movq	0x78(%rbp), %rsi
1401e0304:     	movl	$0x138, %r8d            # imm = 0x138
1401e030a:     	movq	%rdi, %rcx
1401e030d:     	leaq	0x120(%rbp), %rdx
1401e0314:     	callq	0x145bc977b <.text+0x5bc877b>
1401e0319:     	movdqu	%xmm14, 0x410(%rbp)
1401e0322:     	movl	$0x1, 0x420(%rbp)
1401e032c:     	movq	$0x0, 0x424(%rbp)
1401e0337:     	movb	$0x1, 0x42c(%rbp)
1401e033e:     	movq	$0x0, 0x430(%rbp)
1401e0349:     	movl	$0x3f800000, 0x438(%rbp) # imm = 0x3F800000
1401e0353:     	movw	$0x0, 0x43c(%rbp)
1401e035c:     	movl	$0x10000, 0x166(%rdi)   # imm = 0x10000
1401e0366:     	movw	$0x0, 0x16a(%rdi)
1401e036f:     	movw	$0x0, 0x170(%rdi)
1401e0378:     	movl	$0x10000, 0x16c(%rdi)   # imm = 0x10000
1401e0382:     	movl	$0x0, 0x44a(%rbp)
1401e038c:     	movw	$0x1, 0x44e(%rbp)
1401e0395:     	movq	%rsi, 0x2d0(%rbp)
1401e039c:     	movb	$0x1, 0x577(%rbp)
1401e03a3:     	leaq	0xc0(%rbp), %rcx
1401e03aa:     	leaq	0x80(%rbp), %rdx
1401e03b1:     	leaq	0x2d0(%rbp), %r8
1401e03b8:     	callq	0x140189f40 <.text+0x188f40>
1401e03bd:     	nop
1401e03be:     	movq	0xc0(%rbp), %rcx
1401e03c5:     	movq	0xe8(%rbp), %rax
1401e03cc:     	movq	%rcx, 0x558(%rbp)
1401e03d3:     	movq	%rcx, 0xf0(%rbp)
1401e03da:     	movups	0xc8(%rbp), %xmm0
1401e03e1:     	movups	%xmm0, 0xf8(%rbp)
1401e03e8:     	movups	0xd8(%rbp), %xmm0
1401e03ef:     	movups	%xmm0, 0x108(%rbp)
1401e03f6:     	movq	%rax, 0x118(%rbp)
1401e03fd:     	movq	0x500(%rbp), %rsi
1401e0404:     	movb	$0x1, 0x577(%rbp)
1401e040b:     	movq	%rsi, %rcx
1401e040e:     	callq	0x1458bc1d0 <.text+0x58bb1d0>
1401e0413:     	nop
1401e0414:     	movq	%rdx, %r14
1401e0417:     	testq	%rdx, %rdx
1401e041a:     	js	0x1401e09aa <.text+0x1df9aa>
1401e0420:     	testq	%r14, %r14
1401e0423:     	je	0x1401e0489 <.text+0x1df489>
1401e0425:     	movq	%rax, %rbx
1401e0428:     	callq	0x140002200 <.text+0x1200>
1401e042d:     	movl	$0x1, %edi
1401e0432:     	movl	$0x1, %edx
1401e0437:     	movq	%r14, %rcx
1401e043a:     	callq	0x1400021c0 <.text+0x11c0>
1401e043f:     	testq	%rax, %rax
1401e0442:     	je	0x1401e09ac <.text+0x1df9ac>
1401e0448:     	movq	%rax, %r12
1401e044b:     	movq	%rax, %rcx
1401e044e:     	movq	%rbx, %rdx
1401e0451:     	movq	%r14, %r8
1401e0454:     	callq	0x145bc977b <.text+0x5bc877b>
1401e0459:     	movq	0x568(%rbp), %rdx
1401e0460:     	cmpb	$0x1, (%rdx)
1401e0463:     	jne	0x1401e049b <.text+0x1df49b>
1401e0465:     	movq	0x550(%rbp), %rcx
1401e046c:     	movl	(%rcx), %eax
1401e046e:     	movl	0x3(%rcx), %ecx
1401e0471:     	movl	%ecx, 0x123(%rbp)
1401e0477:     	movl	%eax, 0x120(%rbp)
1401e047d:     	movq	0x8(%rdx), %rax
1401e0481:     	movzbl	0x10(%rdx), %edx
1401e0485:     	movb	$0x1, %cl
1401e0487:     	jmp	0x1401e04ab <.text+0x1df4ab>
1401e0489:     	movl	$0x1, %r12d
1401e048f:     	movq	0x568(%rbp), %rdx
1401e0496:     	cmpb	$0x1, (%rdx)
1401e0499:     	je	0x1401e0465 <.text+0x1df465>
1401e049b:     	movq	0x8(%rdx), %rax
1401e049f:     	lock
1401e04a0:     	incq	(%rax)
1401e04a3:     	jle	0x1401e1216 <.text+0x1e0216>
1401e04a9:     	xorl	%ecx, %ecx
1401e04ab:     	movl	0x120(%rbp), %r8d
1401e04b2:     	movl	0x123(%rbp), %r9d
1401e04b9:     	leaq	0x2d8(%rbp), %r10
1401e04c0:     	movl	%r9d, 0x34(%r10)
1401e04c4:     	movl	%r8d, 0x31(%r10)
1401e04c8:     	movq	%r14, 0x2d8(%rbp)
1401e04cf:     	movq	%r12, 0x2e0(%rbp)
1401e04d6:     	movq	%r14, 0x2e8(%rbp)
1401e04dd:     	movq	$0x0, 0x2f0(%rbp)
1401e04e8:     	movq	$0x4, 0x2f8(%rbp)
1401e04f3:     	movq	$0x0, 0x300(%rbp)
1401e04fe:     	movb	%cl, 0x308(%rbp)
1401e0504:     	movq	%rax, 0x310(%rbp)
1401e050b:     	movq	%rdx, 0x318(%rbp)
1401e0512:     	movl	$0x41880000, 0x320(%rbp) # imm = 0x41880000
1401e051c:     	movw	$0x190, 0x324(%rbp)     # imm = 0x190
1401e0525:     	movb	$0x1, 0x326(%rbp)
1401e052c:     	movl	$0x0, 0x328(%rbp)
1401e0536:     	movd	%xmm9, 0x32c(%rbp)
1401e053f:     	movd	%xmm10, 0x330(%rbp)
1401e0548:     	movd	%xmm11, 0x334(%rbp)
1401e0551:     	movl	$0x3f800000, 0x338(%rbp) # imm = 0x3F800000
1401e055b:     	movl	0x5b8dd87(%rip), %edi   # 0x145d6e2e8
1401e0561:     	movl	%edi, 0x74(%r10)
1401e0565:     	movups	0x5b8dd6b(%rip), %xmm9  # 0x145d6e2d8
1401e056d:     	movups	%xmm9, 0x64(%r10)
1401e0572:     	movsd	0x5b8cc56(%rip), %xmm0  # 0x145d6d1d0
1401e057a:     	movsd	%xmm0, 0x350(%rbp)
1401e0582:     	movq	0x558(%rbp), %rax
1401e0589:     	movq	%rax, 0x2d0(%rbp)
1401e0590:     	movb	$0x1, 0x577(%rbp)
1401e0597:     	leaq	0x120(%rbp), %rcx
1401e059e:     	leaq	0xf8(%rbp), %rdx
1401e05a5:     	leaq	0x2d0(%rbp), %r8
1401e05ac:     	callq	0x14018ef20 <.text+0x18df20>
1401e05b1:     	nop
1401e05b2:     	leaq	0x59ce8b7(%rip), %r12   # 0x145baee70 <.text+0x5bade70>
1401e05b9:     	cmpq	%r13, 0x2a0(%rbp)
1401e05c0:     	jne	0x1401e05cb <.text+0x1df5cb>
1401e05c2:     	movups	0x5bd8477(%rip), %xmm0  # 0x145db8a40
1401e05c9:     	jmp	0x1401e05d2 <.text+0x1df5d2>
1401e05cb:     	movups	0x5bd826a(%rip), %xmm0  # 0x145db883c
1401e05d2:     	movaps	%xmm0, 0x510(%rbp)
1401e05d9:     	movl	$0x3f800000, 0x520(%rbp) # imm = 0x3F800000
1401e05e3:     	movq	%r13, 0x4f8(%rbp)
1401e05ea:     	leaq	0x2a0(%rbp), %rax
1401e05f1:     	movq	%rax, 0x530(%rbp)
1401e05f8:     	movq	%r12, 0x538(%rbp)
1401e05ff:     	leaq	0x4f8(%rbp), %rax
1401e0606:     	movq	%rax, 0x540(%rbp)
1401e060d:     	movq	%r12, 0x548(%rbp)
1401e0614:     	movb	$0x1, 0x577(%rbp)
1401e061b:     	leaq	0x60(%rbp), %rcx
1401e061f:     	leaq	0x5bd8a00(%rip), %rdx   # 0x145db9026
1401e0626:     	leaq	0x530(%rbp), %r8
1401e062d:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401e0632:     	nop
1401e0633:     	movq	0x568(%rbp), %rdx
1401e063a:     	cmpb	$0x1, (%rdx)
1401e063d:     	jne	0x1401e0663 <.text+0x1df663>
1401e063f:     	movq	0x550(%rbp), %rcx
1401e0646:     	movl	(%rcx), %eax
1401e0648:     	movl	0x3(%rcx), %ecx
1401e064b:     	movl	%ecx, 0x533(%rbp)
1401e0651:     	movl	%eax, 0x530(%rbp)
1401e0657:     	movq	0x8(%rdx), %rax
1401e065b:     	movzbl	0x10(%rdx), %ecx
1401e065f:     	movb	$0x1, %dl
1401e0661:     	jmp	0x1401e0673 <.text+0x1df673>
1401e0663:     	movq	0x8(%rdx), %rax
1401e0667:     	lock
1401e0668:     	incq	(%rax)
1401e066b:     	jle	0x1401e1216 <.text+0x1e0216>
1401e0671:     	xorl	%edx, %edx
1401e0673:     	movq	0x70(%rbp), %r8
1401e0677:     	movq	%r8, 0x2e0(%rbp)
1401e067e:     	movups	0x60(%rbp), %xmm0
1401e0682:     	movaps	%xmm0, 0x2d0(%rbp)
1401e0689:     	movq	$0x0, 0x2e8(%rbp)
1401e0694:     	movq	$0x4, 0x2f0(%rbp)
1401e069f:     	movq	$0x0, 0x2f8(%rbp)
1401e06aa:     	movb	%dl, 0x300(%rbp)
1401e06b0:     	movl	0x530(%rbp), %edx
1401e06b6:     	movl	0x533(%rbp), %r8d
1401e06bd:     	leaq	0x2d8(%rbp), %r9
1401e06c4:     	movl	%r8d, 0x2c(%r9)
1401e06c8:     	movl	%edx, 0x29(%r9)
1401e06cc:     	movq	%rax, 0x308(%rbp)
1401e06d3:     	movq	%rcx, 0x310(%rbp)
1401e06da:     	movl	$0x41400000, 0x318(%rbp) # imm = 0x41400000
1401e06e4:     	movw	$0x190, 0x31c(%rbp)     # imm = 0x190
1401e06ed:     	movb	$0x1, 0x31e(%rbp)
1401e06f4:     	movl	0x520(%rbp), %eax
1401e06fa:     	movl	%eax, 0x58(%r9)
1401e06fe:     	movaps	0x510(%rbp), %xmm0
1401e0705:     	movups	%xmm0, 0x48(%r9)
1401e070a:     	movb	$0x1, 0x577(%rbp)
1401e0711:     	leaq	0x120(%rbp), %rcx
1401e0718:     	leaq	0x2d0(%rbp), %rdx
1401e071f:     	callq	0x1401a48e0 <.text+0x1a38e0>
1401e0724:     	nop
1401e0725:     	movb	$0x1, 0x577(%rbp)
1401e072c:     	leaq	0x120(%rbp), %rcx
1401e0733:     	movq	%rsi, %rdx
1401e0736:     	callq	0x140014bf0 <.text+0x13bf0>
1401e073b:     	nop
1401e073c:     	movq	0x568(%rbp), %rdx
1401e0743:     	cmpb	$0x1, (%rdx)
1401e0746:     	jne	0x1401e076c <.text+0x1df76c>
1401e0748:     	movq	0x550(%rbp), %rcx
1401e074f:     	movl	(%rcx), %eax
1401e0751:     	movl	0x3(%rcx), %ecx
1401e0754:     	movl	%ecx, 0x513(%rbp)
1401e075a:     	movl	%eax, 0x510(%rbp)
1401e0760:     	movq	0x8(%rdx), %rax
1401e0764:     	movzbl	0x10(%rdx), %edx
1401e0768:     	movb	$0x1, %cl
1401e076a:     	jmp	0x1401e077c <.text+0x1df77c>
1401e076c:     	movq	0x8(%rdx), %rax
1401e0770:     	lock
1401e0771:     	incq	(%rax)
1401e0774:     	jle	0x1401e1216 <.text+0x1e0216>
1401e077a:     	xorl	%ecx, %ecx
1401e077c:     	movq	0x130(%rbp), %r8
1401e0783:     	leaq	0x2d8(%rbp), %r10
1401e078a:     	movq	%r8, 0x10(%r10)
1401e078e:     	movups	0x120(%rbp), %xmm0
1401e0795:     	movups	%xmm0, (%r10)
1401e0799:     	movl	0x510(%rbp), %r8d
1401e07a0:     	movl	0x513(%rbp), %r9d
1401e07a7:     	movl	%r9d, 0x34(%r10)
1401e07ab:     	movl	%r8d, 0x31(%r10)
1401e07af:     	movups	0x5bd8086(%rip), %xmm0  # 0x145db883c
1401e07b6:     	leaq	0x531(%rbp), %r8
1401e07bd:     	movups	%xmm0, (%r8)
1401e07c1:     	movl	$0x3f800000, 0x10(%r8)  # imm = 0x3F800000
1401e07c9:     	movq	$0x0, 0x2f0(%rbp)
1401e07d4:     	movq	$0x4, 0x2f8(%rbp)
1401e07df:     	movq	$0x0, 0x300(%rbp)
1401e07ea:     	movb	%cl, 0x308(%rbp)
1401e07f0:     	movq	%rax, 0x310(%rbp)
1401e07f7:     	movq	%rdx, 0x318(%rbp)
1401e07fe:     	movl	$0x41200000, 0x320(%rbp) # imm = 0x41200000
1401e0808:     	movw	$0x190, 0x324(%rbp)     # imm = 0x190
1401e0811:     	movb	$0x1, 0x326(%rbp)
1401e0818:     	movq	0x53d(%rbp), %rax
1401e081f:     	movq	%rax, 0x5c(%r10)
1401e0823:     	movups	0x530(%rbp), %xmm0
1401e082a:     	movups	%xmm0, 0x4f(%r10)
1401e082f:     	movl	%edi, 0x74(%r10)
1401e0833:     	movups	%xmm9, 0x64(%r10)
1401e0838:     	movq	0x5b8c990(%rip), %xmm0  # 0x145d6d1d0
1401e0840:     	movq	%xmm0, 0x350(%rbp)
1401e0848:     	movq	0x558(%rbp), %rax
1401e084f:     	movq	%rax, 0x2d0(%rbp)
1401e0856:     	movb	$0x1, 0x577(%rbp)
1401e085d:     	leaq	0x120(%rbp), %rcx
1401e0864:     	leaq	0xf8(%rbp), %rdx
1401e086b:     	leaq	0x2d0(%rbp), %r8
1401e0872:     	callq	0x14018ef20 <.text+0x18df20>
1401e0877:     	nop
1401e0878:     	incq	0x2c8(%rbp)
1401e087f:     	movq	0xa8(%rbp), %rax
1401e0886:     	movq	%rax, 0x558(%rbp)
1401e088d:     	shlq	$0x2, %r13
1401e0891:     	xorl	%esi, %esi
1401e0893:     	movq	0x568(%rbp), %rbx
1401e089a:     	movq	0x508(%rbp), %rdi
1401e08a1:     	leaq	0x78(%rbp), %r14
1401e08a5:     	nopw	%cs:(%rax,%rax)
1401e08b0:     	cmpq	%rsi, %r13
1401e08b3:     	je	0x1401e08f0 <.text+0x1df8f0>
1401e08b5:     	movq	0x560(%rbp), %rax
1401e08bc:     	movl	(%rax,%rsi), %eax
1401e08bf:     	addq	$0x4, %rsi
1401e08c3:     	movl	%eax, 0x28(%rsp)
1401e08c7:     	movq	%rdi, 0x20(%rsp)
1401e08cc:     	movl	$0x42580000, 0x30(%rsp) # imm = 0x42580000
1401e08d4:     	movq	%r14, %rcx
1401e08d7:     	movq	%rbx, %rdx
1401e08da:     	movq	0x2b0(%rbp), %r8
1401e08e1:     	movq	0x4e0(%rbp), %r9
1401e08e8:     	callq	0x140013eb0 <.text+0x12eb0>
1401e08ed:     	nop
1401e08ee:     	jmp	0x1401e08b0 <.text+0x1df8b0>
1401e08f0:     	movq	0x558(%rbp), %rdx
1401e08f7:     	testq	%rdx, %rdx
1401e08fa:     	je	0x1401e0912 <.text+0x1df912>
1401e08fc:     	shlq	$0x2, %rdx
1401e0900:     	movl	$0x4, %r8d
1401e0906:     	movq	0x560(%rbp), %rcx
1401e090d:     	callq	0x1400021d0 <.text+0x11d0>
1401e0912:     	movq	0x2b8(%rbp), %rsi
1401e0919:     	leaq	0xa8(%rbp), %rcx
1401e0920:     	leaq	0x500(%rbp), %rdx
1401e0927:     	movq	0x2c8(%rbp), %r14
1401e092e:     	cmpq	$0x6, %r14
1401e0932:     	jne	0x1401e0112 <.text+0x1df112>
1401e0938:     	movq	%rcx, %r13
1401e093b:     	movq	%rdi, 0x20(%rsp)
1401e0940:     	leaq	-0x40(%rbp), %rcx
1401e0944:     	movq	%rbx, %rdx
1401e0947:     	movq	0x2b0(%rbp), %r8
1401e094e:     	movq	0x4e0(%rbp), %r9
1401e0955:     	callq	0x140014f50 <.text+0x13f50>
1401e095a:     	movq	0x28(%rdi), %rbx
1401e095e:     	testq	%rbx, %rbx
1401e0961:     	je	0x1401e09c4 <.text+0x1df9c4>
1401e0963:     	movq	0x20(%rdi), %r14
1401e0967:     	movq	0x120(%rdi), %rsi
1401e096e:     	xorl	%edi, %edi
1401e0970:     	xorl	%r15d, %r15d
1401e0973:     	movl	(%r14,%r15,4), %edx
1401e0977:     	movq	%rsi, %rcx
1401e097a:     	callq	0x145885c40 <.text+0x5884c40>
1401e097f:     	movzbl	%al, %eax
1401e0982:     	addq	%rax, %rdi
1401e0985:     	incq	%r15
1401e0988:     	cmpq	%r15, %rbx
1401e098b:     	jne	0x1401e0973 <.text+0x1df973>
1401e098d:     	movq	0x508(%rbp), %rax
1401e0994:     	movq	0x28(%rax), %rax
1401e0998:     	jmp	0x1401e09c8 <.text+0x1df9c8>
1401e099a:     	xorl	%ecx, %ecx
1401e099c:     	movq	%r14, %rdx
1401e099f:     	callq	0x145d6944b <.text+0x5d6844b>
1401e09a4:     	nop
1401e09a5:     	jmp	0x1401e1216 <.text+0x1e0216>
1401e09aa:     	xorl	%edi, %edi
1401e09ac:     	movb	$0x1, 0x577(%rbp)
1401e09b3:     	movq	%rdi, %rcx
1401e09b6:     	movq	%r14, %rdx
1401e09b9:     	callq	0x145d6944b <.text+0x5d6844b>
1401e09be:     	nop
1401e09bf:     	jmp	0x1401e1216 <.text+0x1e0216>
1401e09c4:     	xorl	%eax, %eax
1401e09c6:     	xorl	%edi, %edi
1401e09c8:     	movq	%rdi, 0x4f8(%rbp)
1401e09cf:     	movq	%rax, 0x510(%rbp)
1401e09d6:     	pxor	%xmm10, %xmm10
1401e09db:     	movdqa	%xmm10, 0x1c0(%rbp)
1401e09e4:     	movdqa	%xmm10, 0x1b0(%rbp)
1401e09ed:     	movdqa	%xmm10, 0x1a0(%rbp)
1401e09f6:     	movdqa	%xmm10, 0x190(%rbp)
1401e09ff:     	movdqa	%xmm10, 0x180(%rbp)
1401e0a08:     	movq	$0x0, 0x1d0(%rbp)
1401e0a13:     	movw	$0x0, 0x454(%rbp)
1401e0a1c:     	movl	$0x0, 0x450(%rbp)
1401e0a26:     	movaps	%xmm7, 0x120(%rbp)
1401e0a2d:     	movq	$0x0, 0x130(%rbp)
1401e0a38:     	movups	0x5bd7e59(%rip), %xmm0  # 0x145db8898
1401e0a3f:     	movups	%xmm0, 0x138(%rbp)
1401e0a46:     	movq	$0x0, 0x148(%rbp)
1401e0a51:     	movaps	%xmm6, 0x150(%rbp)
1401e0a58:     	movq	$0x0, 0x160(%rbp)
1401e0a63:     	movups	%xmm8, 0x168(%rbp)
1401e0a6b:     	movq	$0x0, 0x178(%rbp)
1401e0a76:     	movq	-0x40(%rbp), %rsi
1401e0a7a:     	leaq	0x2d8(%rbp), %rcx
1401e0a81:     	leaq	0x120(%rbp), %rdx
1401e0a88:     	movl	$0xb8, %r8d
1401e0a8e:     	callq	0x145bc977b <.text+0x5bc877b>
1401e0a93:     	movaps	0x5b8c876(%rip), %xmm0  # 0x145d6d310
1401e0a9a:     	movups	%xmm0, 0x390(%rbp)
1401e0aa1:     	movl	$0x0, 0x3a0(%rbp)
1401e0aab:     	movq	$0x1, 0x3a8(%rbp)
1401e0ab6:     	movdqu	0x5bd7e99(%rip), %xmm11 # 0x145db8958
1401e0abf:     	movdqu	%xmm11, 0x3b0(%rbp)
1401e0ac8:     	movdqu	0x5bd7e97(%rip), %xmm12 # 0x145db8968
1401e0ad1:     	movdqu	%xmm12, 0x3c0(%rbp)
1401e0ada:     	movdqu	0x5bd7e95(%rip), %xmm14 # 0x145db8978
1401e0ae3:     	movdqu	%xmm14, 0x3d0(%rbp)
1401e0aec:     	movdqu	0x5bd7e93(%rip), %xmm13 # 0x145db8988
1401e0af5:     	movdqu	%xmm13, 0x3e0(%rbp)
1401e0afe:     	movdqu	0x5bd7e91(%rip), %xmm15 # 0x145db8998
1401e0b07:     	movdqu	%xmm15, 0x3f0(%rbp)
1401e0b10:     	movups	0x5bd7e90(%rip), %xmm9  # 0x145db89a8
1401e0b18:     	movups	%xmm9, 0x400(%rbp)
1401e0b20:     	movaps	0x5b8cab9(%rip), %xmm0  # 0x145d6d5e0
1401e0b27:     	movups	%xmm0, 0x410(%rbp)
1401e0b2e:     	movl	$0x1, 0x420(%rbp)
1401e0b38:     	movq	$0x0, 0x424(%rbp)
1401e0b43:     	movb	$0x1, 0x42c(%rbp)
1401e0b4a:     	movq	$0x0, 0x430(%rbp)
1401e0b55:     	movl	$0x3f800000, 0x438(%rbp) # imm = 0x3F800000
1401e0b5f:     	movw	$0x0, 0x43c(%rbp)
1401e0b68:     	movw	$0x0, 0x442(%rbp)
1401e0b71:     	movl	$0x10000, 0x43e(%rbp)   # imm = 0x10000
1401e0b7b:     	movl	$0x10000, 0x444(%rbp)   # imm = 0x10000
1401e0b85:     	movw	$0x0, 0x448(%rbp)
1401e0b8e:     	movl	$0x0, 0x44a(%rbp)
1401e0b98:     	movw	$0x1, 0x44e(%rbp)
1401e0ba1:     	movq	%rsi, 0x2d0(%rbp)
1401e0ba8:     	leaq	0x30(%rbp), %rcx
1401e0bac:     	leaq	0x2d0(%rbp), %r8
1401e0bb3:     	leaq	-0x38(%rbp), %rdx
1401e0bb7:     	callq	0x140189f40 <.text+0x188f40>
1401e0bbc:     	movq	0x30(%rbp), %rdi
1401e0bc0:     	movq	0x58(%rbp), %rax
1401e0bc4:     	movq	%rdi, 0x78(%rbp)
1401e0bc8:     	leaq	0x80(%rbp), %rsi
1401e0bcf:     	movups	0x38(%rbp), %xmm0
1401e0bd3:     	movups	%xmm0, 0x80(%rbp)
1401e0bda:     	movups	0x48(%rbp), %xmm0
1401e0bde:     	movups	%xmm0, 0x90(%rbp)
1401e0be5:     	movq	%rax, 0xa0(%rbp)
1401e0bec:     	movdqa	%xmm10, 0x1c0(%rbp)
1401e0bf5:     	movdqa	%xmm10, 0x1b0(%rbp)
1401e0bfe:     	movdqa	%xmm10, 0x1a0(%rbp)
1401e0c07:     	movdqa	%xmm10, 0x190(%rbp)
1401e0c10:     	movdqa	%xmm10, 0x180(%rbp)
1401e0c19:     	movq	$0x0, 0x1d0(%rbp)
1401e0c24:     	movb	$0x0, 0x454(%rbp)
1401e0c2b:     	movl	$0x0, 0x450(%rbp)
1401e0c35:     	movups	0x5bd7cfc(%rip), %xmm0  # 0x145db8938
1401e0c3c:     	movups	%xmm0, 0x1d8(%rbp)
1401e0c43:     	movups	0x5bd7cfe(%rip), %xmm0  # 0x145db8948
1401e0c4a:     	movups	%xmm0, 0x1e8(%rbp)
1401e0c51:     	movdqu	%xmm11, 0x1f8(%rbp)
1401e0c5a:     	movdqu	%xmm12, 0x208(%rbp)
1401e0c63:     	movdqu	%xmm13, 0x228(%rbp)
1401e0c6c:     	movdqu	%xmm14, 0x218(%rbp)
1401e0c75:     	movups	%xmm9, 0x248(%rbp)
1401e0c7d:     	movdqu	%xmm15, 0x238(%rbp)
1401e0c86:     	movaps	%xmm7, 0x120(%rbp)
1401e0c8d:     	movq	$0x0, 0x130(%rbp)
1401e0c98:     	movups	0x5bd7bf9(%rip), %xmm0  # 0x145db8898
1401e0c9f:     	movups	%xmm0, 0x138(%rbp)
1401e0ca6:     	movq	$0x0, 0x148(%rbp)
1401e0cb1:     	movaps	%xmm6, 0x150(%rbp)
1401e0cb8:     	movq	$0x0, 0x160(%rbp)
1401e0cc3:     	movups	%xmm8, 0x168(%rbp)
1401e0ccb:     	movq	$0x0, 0x178(%rbp)
1401e0cd6:     	leaq	0x2d8(%rbp), %rcx
1401e0cdd:     	leaq	0x120(%rbp), %rdx
1401e0ce4:     	movl	$0x138, %r8d            # imm = 0x138
1401e0cea:     	callq	0x145bc977b <.text+0x5bc877b>
1401e0cef:     	movaps	0x5b8c56a(%rip), %xmm0  # 0x145d6d260
1401e0cf6:     	movups	%xmm0, 0x410(%rbp)
1401e0cfd:     	movl	$0x1, 0x420(%rbp)
1401e0d07:     	movq	$0x0, 0x424(%rbp)
1401e0d12:     	movb	$0x1, 0x42c(%rbp)
1401e0d19:     	movq	$0x0, 0x430(%rbp)
1401e0d24:     	movl	$0x3f800000, 0x438(%rbp) # imm = 0x3F800000
1401e0d2e:     	movw	$0x0, 0x43c(%rbp)
1401e0d37:     	movl	$0x10000, 0x43e(%rbp)   # imm = 0x10000
1401e0d41:     	movw	$0x0, 0x442(%rbp)
1401e0d4a:     	movl	$0x10000, 0x444(%rbp)   # imm = 0x10000
1401e0d54:     	movw	$0x0, 0x448(%rbp)
1401e0d5d:     	movl	$0x0, 0x44a(%rbp)
1401e0d67:     	movw	$0x0, 0x44e(%rbp)
1401e0d70:     	movb	$0x7, 0x455(%rbp)
1401e0d77:     	movq	%rdi, 0x2d0(%rbp)
1401e0d7e:     	leaq	0xc0(%rbp), %rcx
1401e0d85:     	leaq	0x2d0(%rbp), %r8
1401e0d8c:     	movq	%rsi, %rdx
1401e0d8f:     	callq	0x140189f40 <.text+0x188f40>
1401e0d94:     	movq	0xc0(%rbp), %rdi
1401e0d9b:     	movq	0xe8(%rbp), %rax
1401e0da2:     	movq	%rdi, 0xf0(%rbp)
1401e0da9:     	movups	0xc8(%rbp), %xmm0
1401e0db0:     	movups	%xmm0, 0xf8(%rbp)
1401e0db7:     	movdqu	0xd8(%rbp), %xmm0
1401e0dbf:     	movdqu	%xmm0, 0x108(%rbp)
1401e0dc7:     	movq	%rax, 0x118(%rbp)
1401e0dce:     	leaq	0x5bd81ef(%rip), %rcx   # 0x145db8fc4
1401e0dd5:     	movl	$0x10, %edx
1401e0dda:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401e0ddf:     	movq	%rax, 0xa8(%rbp)
1401e0de6:     	movq	%rdx, 0xb0(%rbp)
1401e0ded:     	leaq	0x5bd8208(%rip), %rcx   # 0x145db8ffc
1401e0df4:     	movl	$0x10, %edx
1401e0df9:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401e0dfe:     	movq	%rax, 0x60(%rbp)
1401e0e02:     	movq	%rdx, 0x68(%rbp)
1401e0e06:     	leaq	0x5bd81eb(%rip), %rax   # 0x145db8ff8
1401e0e0d:     	movq	%rax, 0x120(%rbp)
1401e0e14:     	movq	$0x4, 0x128(%rbp)
1401e0e1f:     	movq	%r13, 0x130(%rbp)
1401e0e26:     	leaq	0x5bd81ab(%rip), %rax   # 0x145db8fd8
1401e0e2d:     	movq	%rax, 0x138(%rbp)
1401e0e34:     	leaq	0x5bd81d1(%rip), %rcx   # 0x145db900c
1401e0e3b:     	movq	%rcx, 0x140(%rbp)
1401e0e42:     	movq	$0x4, 0x148(%rbp)
1401e0e4d:     	leaq	0x60(%rbp), %rcx
1401e0e51:     	movq	%rcx, 0x150(%rbp)
1401e0e58:     	movq	%rax, 0x158(%rbp)
1401e0e5f:     	movq	$0x2, 0x20(%rsp)
1401e0e68:     	leaq	0x5bd81a1(%rip), %rdx   # 0x145db9010
1401e0e6f:     	leaq	-0x10(%rbp), %rcx
1401e0e73:     	leaq	0x120(%rbp), %r9
1401e0e7a:     	movl	$0x16, %r8d
1401e0e80:     	callq	0x1458da540 <.text+0x58d9540>
1401e0e85:     	movq	0x568(%rbp), %r14
1401e0e8c:     	cmpb	$0x1, (%r14)
1401e0e90:     	jne	0x1401e0eb7 <.text+0x1dfeb7>
1401e0e92:     	movq	0x550(%rbp), %rcx
1401e0e99:     	movl	(%rcx), %eax
1401e0e9b:     	movl	0x3(%rcx), %ecx
1401e0e9e:     	movl	%ecx, 0x4f3(%rbp)
1401e0ea4:     	movl	%eax, 0x4f0(%rbp)
1401e0eaa:     	movq	0x8(%r14), %rax
1401e0eae:     	movzbl	0x10(%r14), %ecx
1401e0eb3:     	movb	$0x1, %dl
1401e0eb5:     	jmp	0x1401e0ece <.text+0x1dfece>
1401e0eb7:     	movq	0x8(%r14), %rax
1401e0ebb:     	lock
1401e0ebc:     	incq	(%rax)
1401e0ebf:     	jle	0x1401e1216 <.text+0x1e0216>
1401e0ec5:     	xorl	%edx, %edx
1401e0ec7:     	movq	0x568(%rbp), %r14
1401e0ece:     	leaq	0xf8(%rbp), %rsi
1401e0ed5:     	movq	(%rbp), %r8
1401e0ed9:     	movq	%r8, 0x2e8(%rbp)
1401e0ee0:     	movups	-0x10(%rbp), %xmm0
1401e0ee4:     	movups	%xmm0, 0x2d8(%rbp)
1401e0eeb:     	movups	0x5bd794a(%rip), %xmm0  # 0x145db883c
1401e0ef2:     	movups	%xmm0, 0x531(%rbp)
1401e0ef9:     	movl	$0x3f800000, 0x541(%rbp) # imm = 0x3F800000
1401e0f03:     	movq	$0x0, 0x2f0(%rbp)
1401e0f0e:     	movq	$0x4, 0x2f8(%rbp)
1401e0f19:     	movq	$0x0, 0x300(%rbp)
1401e0f24:     	movb	%dl, 0x308(%rbp)
1401e0f2a:     	movl	0x4f0(%rbp), %edx
1401e0f30:     	movl	0x4f3(%rbp), %r8d
1401e0f37:     	movl	%edx, 0x309(%rbp)
1401e0f3d:     	movl	%r8d, 0x30c(%rbp)
1401e0f44:     	movq	%rax, 0x310(%rbp)
1401e0f4b:     	movq	%rcx, 0x318(%rbp)
1401e0f52:     	movl	$0x41400000, 0x320(%rbp) # imm = 0x41400000
1401e0f5c:     	movw	$0x190, 0x324(%rbp)     # imm = 0x190
1401e0f65:     	movb	$0x1, 0x326(%rbp)
1401e0f6c:     	movq	0x53d(%rbp), %rax
1401e0f73:     	movq	%rax, 0x334(%rbp)
1401e0f7a:     	movups	0x530(%rbp), %xmm0
1401e0f81:     	movups	%xmm0, 0x327(%rbp)
1401e0f88:     	movl	0x5b8d35a(%rip), %ebx   # 0x145d6e2e8
1401e0f8e:     	movl	%ebx, 0x34c(%rbp)
1401e0f94:     	movups	0x5b8d33d(%rip), %xmm6  # 0x145d6e2d8
1401e0f9b:     	movups	%xmm6, 0x33c(%rbp)
1401e0fa2:     	movq	0x5b8c226(%rip), %xmm0  # 0x145d6d1d0
1401e0faa:     	movq	%xmm0, 0x350(%rbp)
1401e0fb2:     	movq	%rdi, 0x2d0(%rbp)
1401e0fb9:     	leaq	-0x10(%rbp), %rcx
1401e0fbd:     	leaq	0x2d0(%rbp), %r8
1401e0fc4:     	movq	%rsi, %rdx
1401e0fc7:     	callq	0x14018ef20 <.text+0x18df20>
1401e0fcc:     	leaq	0x4f8(%rbp), %rax
1401e0fd3:     	movq	%rax, 0x2d0(%rbp)
1401e0fda:     	movq	%r12, 0x2d8(%rbp)
1401e0fe1:     	leaq	0x510(%rbp), %rax
1401e0fe8:     	movq	%rax, 0x2e0(%rbp)
1401e0fef:     	movq	%r12, 0x2e8(%rbp)
1401e0ff6:     	leaq	0x5bd7cdf(%rip), %rdx   # 0x145db8cdc
1401e0ffd:     	leaq	-0x10(%rbp), %rcx
1401e1001:     	leaq	0x2d0(%rbp), %r8
1401e1008:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401e100d:     	cmpb	$0x1, (%r14)
1401e1011:     	jne	0x1401e1038 <.text+0x1e0038>
1401e1013:     	movq	0x550(%rbp), %rcx
1401e101a:     	movl	(%rcx), %eax
1401e101c:     	movl	0x3(%rcx), %ecx
1401e101f:     	movl	%ecx, 0x4eb(%rbp)
1401e1025:     	movl	%eax, 0x4e8(%rbp)
1401e102b:     	movq	0x8(%r14), %rax
1401e102f:     	movzbl	0x10(%r14), %ecx
1401e1034:     	movb	$0x1, %dl
1401e1036:     	jmp	0x1401e1048 <.text+0x1e0048>
1401e1038:     	movq	0x8(%r14), %rax
1401e103c:     	lock
1401e103d:     	incq	(%rax)
1401e1040:     	jle	0x1401e1216 <.text+0x1e0216>
1401e1046:     	xorl	%edx, %edx
1401e1048:     	movq	(%rbp), %r8
1401e104c:     	movq	%r8, 0x2e8(%rbp)
1401e1053:     	movups	-0x10(%rbp), %xmm0
1401e1057:     	movups	%xmm0, 0x2d8(%rbp)
1401e105e:     	movups	0x5bd7793(%rip), %xmm0  # 0x145db87f8
1401e1065:     	movups	%xmm0, 0x531(%rbp)
1401e106c:     	movl	$0x3f800000, 0x541(%rbp) # imm = 0x3F800000
1401e1076:     	movq	$0x0, 0x2f0(%rbp)
1401e1081:     	movq	$0x4, 0x2f8(%rbp)
1401e108c:     	movq	$0x0, 0x300(%rbp)
1401e1097:     	movb	%dl, 0x308(%rbp)
1401e109d:     	movl	0x4e8(%rbp), %edx
1401e10a3:     	movl	0x4eb(%rbp), %r8d
1401e10aa:     	movl	%edx, 0x309(%rbp)
1401e10b0:     	movl	%r8d, 0x30c(%rbp)
1401e10b7:     	movq	%rax, 0x310(%rbp)
1401e10be:     	movq	%rcx, 0x318(%rbp)
1401e10c5:     	movl	$0x41500000, 0x320(%rbp) # imm = 0x41500000
1401e10cf:     	movw	$0x190, 0x324(%rbp)     # imm = 0x190
1401e10d8:     	movb	$0x1, 0x326(%rbp)
1401e10df:     	movq	0x53d(%rbp), %rax
1401e10e6:     	movq	%rax, 0x334(%rbp)
1401e10ed:     	movups	0x530(%rbp), %xmm0
1401e10f4:     	movups	%xmm0, 0x327(%rbp)
1401e10fb:     	movups	%xmm6, 0x33c(%rbp)
1401e1102:     	movl	%ebx, 0x34c(%rbp)
1401e1108:     	movsd	0x5b8c0c0(%rip), %xmm0  # 0x145d6d1d0
1401e1110:     	movsd	%xmm0, 0x350(%rbp)
1401e1118:     	movq	%rdi, 0x2d0(%rbp)
1401e111f:     	leaq	0x120(%rbp), %rcx
1401e1126:     	leaq	0x2d0(%rbp), %r8
1401e112d:     	movq	%rsi, %rdx
1401e1130:     	callq	0x14018ef20 <.text+0x18df20>
1401e1135:     	movq	0x4f8(%rbp), %rax
1401e113c:     	testq	%rax, %rax
1401e113f:     	js	0x1401e1148 <.text+0x1e0148>
1401e1141:     	cvtsi2ss	%rax, %xmm1
1401e1146:     	jmp	0x1401e115d <.text+0x1e015d>
1401e1148:     	movq	%rax, %rcx
1401e114b:     	shrq	%rcx
1401e114e:     	andl	$0x1, %eax
1401e1151:     	orq	%rcx, %rax
1401e1154:     	cvtsi2ss	%rax, %xmm1
1401e1159:     	addss	%xmm1, %xmm1
1401e115d:     	movq	0x2c0(%rbp), %rsi
1401e1164:     	movq	0x510(%rbp), %rax
1401e116b:     	cmpq	$0x1, %rax
1401e116f:     	adcq	$0x0, %rax
1401e1173:     	js	0x1401e117f <.text+0x1e017f>
1401e1175:     	xorps	%xmm0, %xmm0
1401e1178:     	cvtsi2ss	%rax, %xmm0
1401e117d:     	jmp	0x1401e1197 <.text+0x1e0197>
1401e117f:     	movq	%rax, %rcx
1401e1182:     	shrq	%rcx
1401e1185:     	andl	$0x1, %eax
1401e1188:     	orq	%rcx, %rax
1401e118b:     	xorps	%xmm0, %xmm0
1401e118e:     	cvtsi2ss	%rax, %xmm0
1401e1193:     	addss	%xmm0, %xmm0
1401e1197:     	divss	%xmm0, %xmm1
1401e119b:     	leaq	0x78(%rbp), %rcx
1401e119f:     	callq	0x140015c00 <.text+0x14c00>
1401e11a4:     	movq	%rsi, %rax
1401e11a7:     	movaps	0x580(%rbp), %xmm6
1401e11ae:     	movaps	0x590(%rbp), %xmm7
1401e11b5:     	movaps	0x5a0(%rbp), %xmm8
1401e11bd:     	movaps	0x5b0(%rbp), %xmm9
1401e11c5:     	movaps	0x5c0(%rbp), %xmm10
1401e11cd:     	movaps	0x5d0(%rbp), %xmm11
1401e11d5:     	movaps	0x5e0(%rbp), %xmm12
1401e11dd:     	movaps	0x5f0(%rbp), %xmm13
1401e11e5:     	movaps	0x600(%rbp), %xmm14
1401e11ed:     	movaps	0x610(%rbp), %xmm15
1401e11f5:     	addq	$0x6a8, %rsp            # imm = 0x6A8
1401e11fc:     	popq	%rbx
1401e11fd:     	popq	%rdi
1401e11fe:     	popq	%rsi
1401e11ff:     	popq	%r12
1401e1201:     	popq	%r13
1401e1203:     	popq	%r14
1401e1205:     	popq	%r15
1401e1207:     	popq	%rbp
1401e1208:     	retq
1401e1209:     	movq	%rsi, %r14
1401e120c:     	movl	$0x1, %ecx
1401e1211:     	jmp	0x1401e099c <.text+0x1df99c>
1401e1216:     	ud2

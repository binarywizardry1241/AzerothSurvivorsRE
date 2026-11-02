
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14021aed0:     	pushq	%rbp
14021aed1:     	pushq	%r15
14021aed3:     	pushq	%r14
14021aed5:     	pushq	%r13
14021aed7:     	pushq	%r12
14021aed9:     	pushq	%rsi
14021aeda:     	pushq	%rdi
14021aedb:     	pushq	%rbx
14021aedc:     	subq	$0x7c8, %rsp            # imm = 0x7C8
14021aee3:     	leaq	0x80(%rsp), %rbp
14021aeeb:     	movaps	%xmm15, 0x730(%rbp)
14021aef3:     	movaps	%xmm14, 0x720(%rbp)
14021aefb:     	movaps	%xmm13, 0x710(%rbp)
14021af03:     	movaps	%xmm12, 0x700(%rbp)
14021af0b:     	movaps	%xmm11, 0x6f0(%rbp)
14021af13:     	movaps	%xmm10, 0x6e0(%rbp)
14021af1b:     	movaps	%xmm9, 0x6d0(%rbp)
14021af23:     	movaps	%xmm8, 0x6c0(%rbp)
14021af2b:     	movaps	%xmm7, 0x6b0(%rbp)
14021af32:     	movaps	%xmm6, 0x6a0(%rbp)
14021af39:     	movq	$-0x2, 0x698(%rbp)
14021af44:     	movq	%rdx, %r14
14021af47:     	movq	%rcx, %r12
14021af4a:     	movq	(%rcx), %rax
14021af4d:     	movq	0x28(%rcx), %rcx
14021af51:     	movq	%rax, 0x258(%rbp)
14021af58:     	leaq	0x260(%rbp), %rdx
14021af5f:     	movups	0x8(%r12), %xmm0
14021af65:     	movups	%xmm0, 0x260(%rbp)
14021af6c:     	movups	0x18(%r12), %xmm0
14021af72:     	movups	%xmm0, 0x270(%rbp)
14021af79:     	movq	%rcx, 0x280(%rbp)
14021af80:     	xorps	%xmm9, %xmm9
14021af84:     	movups	%xmm9, 0x410(%rbp)
14021af8c:     	movups	%xmm9, 0x400(%rbp)
14021af94:     	movups	%xmm9, 0x428(%rbp)
14021af9c:     	movups	%xmm9, 0x438(%rbp)
14021afa4:     	movq	$0x0, 0x448(%rbp)
14021afaf:     	movups	0x5b9d8ca(%rip), %xmm6  # 0x145db8880
14021afb6:     	movaps	%xmm6, (%rbp)
14021afba:     	movq	$0x0, 0x10(%rbp)
14021afc2:     	movups	0x5b9d8cf(%rip), %xmm7  # 0x145db8898
14021afc9:     	movups	%xmm7, 0x18(%rbp)
14021afcd:     	movq	$0x0, 0x28(%rbp)
14021afd5:     	movups	0x5b9d8d3(%rip), %xmm8  # 0x145db88b0
14021afdd:     	movaps	%xmm8, 0x30(%rbp)
14021afe2:     	movq	$0x0, 0x40(%rbp)
14021afea:     	movups	0x5b9d8d6(%rip), %xmm15 # 0x145db88c8
14021aff2:     	movups	%xmm15, 0x48(%rbp)
14021aff7:     	movq	$0x0, 0x58(%rbp)
14021afff:     	movq	0x50(%rbp), %rcx
14021b003:     	movq	%rcx, 0x3e8(%rbp)
14021b00a:     	movq	0x58(%rbp), %rcx
14021b00e:     	movq	%rcx, 0x3f0(%rbp)
14021b015:     	movq	0x40(%rbp), %rcx
14021b019:     	movq	%rcx, 0x3d8(%rbp)
14021b020:     	movq	0x48(%rbp), %rcx
14021b024:     	movq	%rcx, 0x3e0(%rbp)
14021b02b:     	movaps	(%rbp), %xmm0
14021b02f:     	movaps	0x10(%rbp), %xmm1
14021b033:     	movaps	0x20(%rbp), %xmm2
14021b037:     	movaps	0x30(%rbp), %xmm3
14021b03b:     	movups	%xmm3, 0x3c8(%rbp)
14021b042:     	movups	%xmm2, 0x3b8(%rbp)
14021b049:     	movups	%xmm1, 0x3a8(%rbp)
14021b050:     	movups	%xmm0, 0x398(%rbp)
14021b057:     	movq	$0x0, 0x3f8(%rbp)
14021b062:     	movabsq	$0x43b4000000000001, %rcx # imm = 0x43B4000000000001
14021b06c:     	movq	%rcx, 0x420(%rbp)
14021b073:     	movups	0x5b9d8cd(%rip), %xmm14 # 0x145db8948
14021b07b:     	movups	%xmm14, 0x460(%rbp)
14021b083:     	movups	0x5b9d8ad(%rip), %xmm11 # 0x145db8938
14021b08b:     	movups	%xmm11, 0x450(%rbp)
14021b093:     	movups	0x5b9d8cd(%rip), %xmm10 # 0x145db8968
14021b09b:     	movups	%xmm10, 0x480(%rbp)
14021b0a3:     	movups	0x5b9d8ad(%rip), %xmm12 # 0x145db8958
14021b0ab:     	movups	%xmm12, 0x470(%rbp)
14021b0b3:     	movups	0x5b9d8ce(%rip), %xmm0  # 0x145db8988
14021b0ba:     	movups	%xmm0, 0x4a0(%rbp)
14021b0c1:     	movups	0x5b9d8b0(%rip), %xmm0  # 0x145db8978
14021b0c8:     	movups	%xmm0, 0x490(%rbp)
14021b0cf:     	movups	0x5b9d8d2(%rip), %xmm0  # 0x145db89a8
14021b0d6:     	movups	%xmm0, 0x4c0(%rbp)
14021b0dd:     	movups	0x5b9d8b4(%rip), %xmm0  # 0x145db8998
14021b0e4:     	movups	%xmm0, 0x4b0(%rbp)
14021b0eb:     	movaps	0x5b5216d(%rip), %xmm13 # 0x145d6d260
14021b0f3:     	movups	%xmm13, 0x4d0(%rbp)
14021b0fb:     	movl	$0x1, 0x4e0(%rbp)
14021b105:     	movss	0x5b52543(%rip), %xmm0  # 0x145d6d650
14021b10d:     	movlps	%xmm0, 0x4e4(%rbp)
14021b114:     	movb	$0x1, 0x4ec(%rbp)
14021b11b:     	movq	$0x0, 0x4f0(%rbp)
14021b126:     	movl	$0x3f800000, 0x4f8(%rbp) # imm = 0x3F800000
14021b130:     	movw	$0x0, 0x4fc(%rbp)
14021b139:     	movw	$0x0, 0x502(%rbp)
14021b142:     	movl	$0x10000, 0x4fe(%rbp)   # imm = 0x10000
14021b14c:     	movw	$0x0, 0x508(%rbp)
14021b155:     	movl	$0x10000, 0x504(%rbp)   # imm = 0x10000
14021b15f:     	movq	$0x0, 0x50a(%rbp)
14021b16a:     	movl	$0x5, 0x512(%rbp)
14021b174:     	movq	%rax, 0x390(%rbp)
14021b17b:     	leaq	-0x30(%rbp), %rcx
14021b17f:     	leaq	0x390(%rbp), %r8
14021b186:     	callq	0x140189f40 <.text+0x188f40>
14021b18b:     	movq	(%r14), %rdi
14021b18e:     	movq	0x8(%r14), %r15
14021b192:     	movq	0x10(%r14), %rax
14021b196:     	movq	%rax, 0x688(%rbp)
14021b19d:     	movq	0x18(%r14), %rax
14021b1a1:     	movq	%rax, 0x668(%rbp)
14021b1a8:     	movq	-0x30(%rbp), %r13
14021b1ac:     	movq	-0x8(%rbp), %rax
14021b1b0:     	movq	%r13, 0x340(%rbp)
14021b1b7:     	movups	-0x28(%rbp), %xmm0
14021b1bb:     	movups	%xmm0, 0x348(%rbp)
14021b1c2:     	movups	-0x18(%rbp), %xmm0
14021b1c6:     	movups	%xmm0, 0x358(%rbp)
14021b1cd:     	movq	%rax, 0x368(%rbp)
14021b1d4:     	movw	$0x0, 0x4f4(%rbp)
14021b1dd:     	movb	$0x1, 0x4e4(%rbp)
14021b1e4:     	movups	%xmm9, 0x3f8(%rbp)
14021b1ec:     	movups	%xmm9, 0x408(%rbp)
14021b1f4:     	movaps	0x5b9c985(%rip), %xmm0  # 0x145db7b80
14021b1fb:     	movups	%xmm0, 0x418(%rbp)
14021b202:     	movq	$0x0, 0x3f0(%rbp)
14021b20d:     	movups	%xmm9, 0x428(%rbp)
14021b215:     	movups	%xmm9, 0x438(%rbp)
14021b21d:     	movaps	%xmm14, %xmm0
14021b221:     	movaps	%xmm6, %xmm14
14021b225:     	movl	$0x0, 0x508(%rbp)
14021b22f:     	movw	$0x0, 0x50c(%rbp)
14021b238:     	movups	%xmm11, 0x448(%rbp)
14021b240:     	movups	%xmm0, 0x458(%rbp)
14021b247:     	movups	%xmm12, 0x468(%rbp)
14021b24f:     	movups	%xmm10, 0x478(%rbp)
14021b257:     	movaps	0x5b52031(%rip), %xmm9  # 0x145d6d290
14021b25f:     	movups	%xmm9, 0x488(%rbp)
14021b267:     	movups	%xmm9, 0x498(%rbp)
14021b26f:     	movaps	0x5b5221a(%rip), %xmm6  # 0x145d6d490
14021b276:     	movups	%xmm6, 0x4a8(%rbp)
14021b27d:     	movups	%xmm6, 0x4b8(%rbp)
14021b284:     	movb	$0x0, 0x506(%rbp)
14021b28b:     	movl	$0x0, 0x502(%rbp)
14021b295:     	movq	$0x0, 0x4e8(%rbp)
14021b2a0:     	movl	$0x3f800000, 0x4f0(%rbp) # imm = 0x3F800000
14021b2aa:     	movups	%xmm13, 0x4c8(%rbp)
14021b2b2:     	movl	$0x1, 0x4d8(%rbp)
14021b2bc:     	movq	$0x0, 0x4dc(%rbp)
14021b2c7:     	movb	$0x0, 0x507(%rbp)
14021b2ce:     	movaps	%xmm14, 0x390(%rbp)
14021b2d6:     	movq	$0x0, 0x3a0(%rbp)
14021b2e1:     	movups	%xmm7, 0x3a8(%rbp)
14021b2e8:     	movq	$0x0, 0x3b8(%rbp)
14021b2f3:     	movaps	%xmm8, 0x3c0(%rbp)
14021b2fb:     	movq	$0x0, 0x3d0(%rbp)
14021b306:     	movups	%xmm15, 0x3d8(%rbp)
14021b30e:     	movq	$0x0, 0x3e8(%rbp)
14021b319:     	movw	$0x0, 0x4fa(%rbp)
14021b322:     	movl	$0x10000, 0x4f6(%rbp)   # imm = 0x10000
14021b32c:     	movw	$0x0, 0x500(%rbp)
14021b335:     	movl	$0x10000, 0x4fc(%rbp)   # imm = 0x10000
14021b33f:     	movups	0x5b9d82a(%rip), %xmm0  # 0x145db8b70
14021b346:     	movaps	%xmm0, 0x610(%rbp)
14021b34d:     	movl	$0x3f800000, 0x620(%rbp) # imm = 0x3F800000
14021b357:     	movups	%xmm0, 0x624(%rbp)
14021b35e:     	movl	$0x3f800000, 0x634(%rbp) # imm = 0x3F800000
14021b368:     	movups	%xmm0, 0x638(%rbp)
14021b36f:     	movl	$0x3f800000, 0x648(%rbp) # imm = 0x3F800000
14021b379:     	movups	%xmm0, 0x64c(%rbp)
14021b380:     	movl	$0x3f800000, 0x65c(%rbp) # imm = 0x3F800000
14021b38a:     	movq	0x20(%r15), %r8
14021b38e:     	movq	0x28(%r15), %r9
14021b392:     	movq	%rbp, %rcx
14021b395:     	movq	%rdi, %rdx
14021b398:     	callq	0x1400123b0 <.text+0x113b0>
14021b39d:     	nop
14021b39e:     	leaq	0x2a0(%rbp), %rcx
14021b3a5:     	movq	%rbp, %rdx
14021b3a8:     	callq	0x1426d6630 <.text+0x26d5630>
14021b3ad:     	nop
14021b3ae:     	leaq	0x348(%rbp), %rsi
14021b3b5:     	movq	%rbp, %rbx
14021b3b8:     	leaq	0x390(%rbp), %rdx
14021b3bf:     	movl	$0x180, %r8d            # imm = 0x180
14021b3c5:     	movq	%rbx, %rcx
14021b3c8:     	callq	0x145bc977b <.text+0x5bc877b>
14021b3cd:     	movaps	0x610(%rbp), %xmm0
14021b3d4:     	movaps	0x620(%rbp), %xmm1
14021b3db:     	movaps	0x630(%rbp), %xmm2
14021b3e2:     	movaps	0x640(%rbp), %xmm3
14021b3e9:     	movups	%xmm0, 0x180(%rbp)
14021b3f0:     	movups	%xmm1, 0x190(%rbp)
14021b3f7:     	movups	%xmm2, 0x1a0(%rbp)
14021b3fe:     	movups	%xmm3, 0x1b0(%rbp)
14021b405:     	movaps	0x650(%rbp), %xmm0
14021b40c:     	movups	%xmm0, 0x1c0(%rbp)
14021b413:     	leaq	0x1d0(%rbp), %rcx
14021b41a:     	leaq	0x2a0(%rbp), %rdx
14021b421:     	movl	$0x88, %r8d
14021b427:     	callq	0x145bc977b <.text+0x5bc877b>
14021b42c:     	leaq	0x398(%rbp), %rcx
14021b433:     	movl	$0x258, %r8d            # imm = 0x258
14021b439:     	movq	%rbx, %rdx
14021b43c:     	callq	0x145bc977b <.text+0x5bc877b>
14021b441:     	movq	%r13, 0x390(%rbp)
14021b448:     	leaq	0x2a0(%rbp), %rcx
14021b44f:     	leaq	0x390(%rbp), %r8
14021b456:     	movq	%rsi, %rdx
14021b459:     	callq	0x14018ba80 <.text+0x18aa80>
14021b45e:     	movw	$0x0, 0x164(%rbp)
14021b467:     	movb	$0x1, 0x154(%rbp)
14021b46e:     	xorps	%xmm0, %xmm0
14021b471:     	movaps	%xmm0, 0x60(%rbp)
14021b475:     	movaps	%xmm0, 0x70(%rbp)
14021b479:     	movaps	%xmm0, 0x80(%rbp)
14021b480:     	movaps	%xmm0, 0x90(%rbp)
14021b487:     	movaps	%xmm0, 0xa0(%rbp)
14021b48e:     	movq	$0x0, 0xb0(%rbp)
14021b499:     	movl	$0x0, 0x178(%rbp)
14021b4a3:     	movw	$0x0, 0x17c(%rbp)
14021b4ac:     	movups	%xmm11, 0xb8(%rbp)
14021b4b4:     	movups	0x5b9d48d(%rip), %xmm0  # 0x145db8948
14021b4bb:     	movups	%xmm0, 0xc8(%rbp)
14021b4c2:     	movups	%xmm12, 0xd8(%rbp)
14021b4ca:     	movups	%xmm10, 0xe8(%rbp)
14021b4d2:     	movups	0x5b9d4af(%rip), %xmm0  # 0x145db8988
14021b4d9:     	movups	%xmm0, 0x108(%rbp)
14021b4e0:     	movups	0x5b9d491(%rip), %xmm0  # 0x145db8978
14021b4e7:     	movups	%xmm0, 0xf8(%rbp)
14021b4ee:     	movups	0x5b9d4b3(%rip), %xmm0  # 0x145db89a8
14021b4f5:     	movups	%xmm0, 0x128(%rbp)
14021b4fc:     	movups	0x5b9d495(%rip), %xmm0  # 0x145db8998
14021b503:     	movups	%xmm0, 0x118(%rbp)
14021b50a:     	movb	$0x0, 0x176(%rbp)
14021b511:     	movl	$0x0, 0x172(%rbp)
14021b51b:     	movsd	0x5b51ddd(%rip), %xmm0  # 0x145d6d300
14021b523:     	movsd	%xmm0, 0x158(%rbp)
14021b52b:     	movl	$0x3f800000, 0x160(%rbp) # imm = 0x3F800000
14021b535:     	movaps	0x5b51d24(%rip), %xmm0  # 0x145d6d260
14021b53c:     	movups	%xmm0, 0x138(%rbp)
14021b543:     	movl	$0x1, 0x148(%rbp)
14021b54d:     	movq	$0x0, 0x14c(%rbp)
14021b558:     	movb	$0x0, 0x177(%rbp)
14021b55f:     	movaps	%xmm14, (%rbp)
14021b564:     	movq	$0x0, 0x10(%rbp)
14021b56c:     	movups	%xmm7, 0x18(%rbp)
14021b570:     	movq	$0x0, 0x28(%rbp)
14021b578:     	movaps	%xmm8, 0x30(%rbp)
14021b57d:     	movq	$0x0, 0x40(%rbp)
14021b585:     	movups	%xmm15, 0x48(%rbp)
14021b58a:     	movq	$0x0, 0x58(%rbp)
14021b592:     	movw	$0x0, 0x16a(%rbp)
14021b59b:     	movl	$0x10000, 0x166(%rbp)   # imm = 0x10000
14021b5a5:     	movw	$0x0, 0x170(%rbp)
14021b5ae:     	movl	$0x10000, 0x16c(%rbp)   # imm = 0x10000
14021b5b8:     	movq	%r15, %rcx
14021b5bb:     	callq	0x1458df560 <.text+0x58de560>
14021b5c0:     	nop
14021b5c1:     	movq	%rdx, %rbx
14021b5c4:     	testq	%rdx, %rdx
14021b5c7:     	jns	0x14021b5dd <.text+0x21a5dd>
14021b5c9:     	xorl	%r15d, %r15d
14021b5cc:     	movq	%r15, %rcx
14021b5cf:     	movq	%rbx, %rdx
14021b5d2:     	callq	0x145d6944b <.text+0x5d6844b>
14021b5d7:     	nop
14021b5d8:     	jmp	0x14021bdde <.text+0x21adde>
14021b5dd:     	movq	%r13, 0x680(%rbp)
14021b5e4:     	movq	%r15, 0x690(%rbp)
14021b5eb:     	testq	%rbx, %rbx
14021b5ee:     	je	0x14021b660 <.text+0x21a660>
14021b5f0:     	movq	%rax, %rsi
14021b5f3:     	callq	0x140002200 <.text+0x1200>
14021b5f8:     	movl	$0x1, %r15d
14021b5fe:     	movl	$0x1, %edx
14021b603:     	movq	%rbx, %rcx
14021b606:     	callq	0x1400021c0 <.text+0x11c0>
14021b60b:     	testq	%rax, %rax
14021b60e:     	je	0x14021b5cc <.text+0x21a5cc>
14021b610:     	movq	%rax, %r13
14021b613:     	movq	%rax, %rcx
14021b616:     	movq	%rsi, %rdx
14021b619:     	movq	%rbx, %r8
14021b61c:     	callq	0x145bc977b <.text+0x5bc877b>
14021b621:     	movq	0x688(%rbp), %rdx
14021b628:     	cmpb	$0x1, 0x18(%rdx)
14021b62c:     	movq	%rdi, 0x330(%rbp)
14021b633:     	jne	0x14021b67a <.text+0x21a67a>
14021b635:     	movaps	%xmm6, %xmm13
14021b639:     	movaps	%xmm8, %xmm15
14021b63d:     	movaps	%xmm7, %xmm8
14021b641:     	movl	0x19(%rdx), %eax
14021b644:     	movl	0x1c(%rdx), %ecx
14021b647:     	movl	%ecx, 0x67b(%rbp)
14021b64d:     	movl	%eax, 0x678(%rbp)
14021b653:     	movq	0x20(%rdx), %rsi
14021b657:     	movzbl	0x28(%rdx), %edi
14021b65b:     	movb	$0x1, %r15b
14021b65e:     	jmp	0x14021b697 <.text+0x21a697>
14021b660:     	movl	$0x1, %r13d
14021b666:     	movq	0x688(%rbp), %rdx
14021b66d:     	cmpb	$0x1, 0x18(%rdx)
14021b671:     	movq	%rdi, 0x330(%rbp)
14021b678:     	je	0x14021b635 <.text+0x21a635>
14021b67a:     	movq	0x20(%rdx), %rsi
14021b67e:     	lock
14021b67f:     	incq	(%rsi)
14021b682:     	jle	0x14021bdde <.text+0x21adde>
14021b688:     	movaps	%xmm8, %xmm15
14021b68c:     	movaps	%xmm6, %xmm13
14021b690:     	movaps	%xmm7, %xmm8
14021b694:     	xorl	%r15d, %r15d
14021b697:     	movups	0x5b9d15a(%rip), %xmm0  # 0x145db87f8
14021b69e:     	movups	%xmm0, 0x28c(%rbp)
14021b6a5:     	movl	$0x3f800000, 0x29c(%rbp) # imm = 0x3F800000
14021b6af:     	leaq	0x398(%rbp), %rcx
14021b6b6:     	movq	%rbp, %rdx
14021b6b9:     	movl	$0x180, %r8d            # imm = 0x180
14021b6bf:     	callq	0x145bc977b <.text+0x5bc877b>
14021b6c4:     	movq	%rbx, 0x518(%rbp)
14021b6cb:     	movq	%r13, 0x520(%rbp)
14021b6d2:     	movq	%rbx, 0x528(%rbp)
14021b6d9:     	movq	$0x0, 0x530(%rbp)
14021b6e4:     	movq	$0x4, 0x538(%rbp)
14021b6ef:     	movq	$0x0, 0x540(%rbp)
14021b6fa:     	movb	%r15b, 0x548(%rbp)
14021b701:     	movl	0x678(%rbp), %eax
14021b707:     	movl	0x67b(%rbp), %ecx
14021b70d:     	movl	%eax, 0x549(%rbp)
14021b713:     	movl	%ecx, 0x54c(%rbp)
14021b719:     	movq	%rsi, 0x550(%rbp)
14021b720:     	movq	%rdi, 0x558(%rbp)
14021b727:     	movl	$0x41c00000, 0x560(%rbp) # imm = 0x41C00000
14021b731:     	movw	$0x190, 0x564(%rbp)     # imm = 0x190
14021b73a:     	movb	$0x1, 0x566(%rbp)
14021b741:     	movups	0x28b(%rbp), %xmm0
14021b748:     	movups	%xmm0, 0x567(%rbp)
14021b74f:     	movq	0x298(%rbp), %rax
14021b756:     	movq	%rax, 0x574(%rbp)
14021b75d:     	movl	0x5b52b85(%rip), %esi   # 0x145d6e2e8
14021b763:     	movl	%esi, 0x58c(%rbp)
14021b769:     	movups	0x5b52b68(%rip), %xmm6  # 0x145d6e2d8
14021b770:     	movups	%xmm6, 0x57c(%rbp)
14021b777:     	movsd	0x5b51a51(%rip), %xmm7  # 0x145d6d1d0
14021b77f:     	movsd	%xmm7, 0x590(%rbp)
14021b787:     	movq	0x680(%rbp), %rax
14021b78e:     	movq	%rax, 0x390(%rbp)
14021b795:     	movq	%rbp, %rcx
14021b798:     	leaq	0x390(%rbp), %r8
14021b79f:     	leaq	0x348(%rbp), %rdx
14021b7a6:     	callq	0x14018e390 <.text+0x18d390>
14021b7ab:     	movq	0x668(%rbp), %r15
14021b7b2:     	cmpl	$0x0, (%r15)
14021b7b6:     	je	0x14021b7c1 <.text+0x21a7c1>
14021b7b8:     	movups	0x5b9d0ad(%rip), %xmm0  # 0x145db886c
14021b7bf:     	jmp	0x14021b7c8 <.text+0x21a7c8>
14021b7c1:     	movups	0x5b9d074(%rip), %xmm0  # 0x145db883c
14021b7c8:     	movaps	%xmm0, 0x5f0(%rbp)
14021b7cf:     	movl	$0x3f800000, 0x600(%rbp) # imm = 0x3F800000
14021b7d9:     	leaq	0x260(%rbp), %rbx
14021b7e0:     	movq	0x690(%rbp), %r13
14021b7e7:     	movq	0x688(%rbp), %rdi
14021b7ee:     	leaq	0x5b9f305(%rip), %rcx   # 0x145dbaafa
14021b7f5:     	movl	$0xe, %edx
14021b7fa:     	callq	0x1458da4e0 <.text+0x58d94e0>
14021b7ff:     	movq	%rdx, %r8
14021b802:     	leaq	0x5b9f2ff(%rip), %rcx   # 0x145dbab08
14021b809:     	movq	%rcx, 0x2a0(%rbp)
14021b810:     	movq	$0x5, 0x2a8(%rbp)
14021b81b:     	movq	%r15, 0x2b0(%rbp)
14021b822:     	leaq	0x5b9d2a7(%rip), %rcx   # 0x145db8ad0
14021b829:     	movq	%rcx, 0x2b8(%rbp)
14021b830:     	movq	$0x1, 0x20(%rsp)
14021b839:     	movq	%rbp, %rcx
14021b83c:     	leaq	0x2a0(%rbp), %r9
14021b843:     	movq	%rax, %rdx
14021b846:     	callq	0x1458da940 <.text+0x58d9940>
14021b84b:     	cmpb	$0x1, (%rdi)
14021b84e:     	movq	%r12, 0x338(%rbp)
14021b855:     	jne	0x14021b875 <.text+0x21a875>
14021b857:     	movl	0x1(%rdi), %eax
14021b85a:     	movl	0x4(%rdi), %ecx
14021b85d:     	movl	%ecx, 0x673(%rbp)
14021b863:     	movl	%eax, 0x670(%rbp)
14021b869:     	movq	0x8(%rdi), %rax
14021b86d:     	movzbl	0x10(%rdi), %ecx
14021b871:     	movb	$0x1, %dl
14021b873:     	jmp	0x14021b885 <.text+0x21a885>
14021b875:     	movq	0x8(%rdi), %rax
14021b879:     	lock
14021b87a:     	incq	(%rax)
14021b87d:     	jle	0x14021bdde <.text+0x21adde>
14021b883:     	xorl	%edx, %edx
14021b885:     	movq	0x10(%rbp), %r8
14021b889:     	movq	%r8, 0x3a8(%rbp)
14021b890:     	movups	(%rbp), %xmm0
14021b894:     	movups	%xmm0, 0x398(%rbp)
14021b89b:     	movaps	0x5f0(%rbp), %xmm0
14021b8a2:     	movups	%xmm0, 0x611(%rbp)
14021b8a9:     	movl	0x600(%rbp), %r8d
14021b8b0:     	movl	%r8d, 0x621(%rbp)
14021b8b7:     	movq	$0x0, 0x3b0(%rbp)
14021b8c2:     	movq	$0x4, 0x3b8(%rbp)
14021b8cd:     	movq	$0x0, 0x3c0(%rbp)
14021b8d8:     	movb	%dl, 0x3c8(%rbp)
14021b8de:     	movl	0x670(%rbp), %edx
14021b8e4:     	movl	0x673(%rbp), %r8d
14021b8eb:     	movl	%edx, 0x3c9(%rbp)
14021b8f1:     	movl	%r8d, 0x3cc(%rbp)
14021b8f8:     	movq	%rax, 0x3d0(%rbp)
14021b8ff:     	movq	%rcx, 0x3d8(%rbp)
14021b906:     	movl	$0x41700000, 0x3e0(%rbp) # imm = 0x41700000
14021b910:     	movw	$0x190, 0x3e4(%rbp)     # imm = 0x190
14021b919:     	movb	$0x1, 0x3e6(%rbp)
14021b920:     	movq	0x61d(%rbp), %rax
14021b927:     	movq	%rax, 0x3f4(%rbp)
14021b92e:     	movups	0x610(%rbp), %xmm0
14021b935:     	movups	%xmm0, 0x3e7(%rbp)
14021b93c:     	movl	%esi, 0x40c(%rbp)
14021b942:     	movups	%xmm6, 0x3fc(%rbp)
14021b949:     	movsd	%xmm7, 0x410(%rbp)
14021b951:     	movq	0x680(%rbp), %rax
14021b958:     	movq	%rax, 0x390(%rbp)
14021b95f:     	movq	%rbp, %rcx
14021b962:     	leaq	0x390(%rbp), %r8
14021b969:     	leaq	0x348(%rbp), %rdx
14021b970:     	callq	0x14018ef20 <.text+0x18df20>
14021b975:     	movaps	%xmm14, 0x2a0(%rbp)
14021b97d:     	movq	$0x0, 0x2b0(%rbp)
14021b988:     	movups	%xmm8, 0x2b8(%rbp)
14021b990:     	movq	$0x0, 0x2c8(%rbp)
14021b99b:     	movaps	%xmm15, 0x2d0(%rbp)
14021b9a3:     	movq	$0x0, 0x2e0(%rbp)
14021b9ae:     	movups	0x5b9cf13(%rip), %xmm0  # 0x145db88c8
14021b9b5:     	movups	%xmm0, 0x2e8(%rbp)
14021b9bc:     	movq	$0x0, 0x2f8(%rbp)
14021b9c7:     	movups	0x5b9d22a(%rip), %xmm0  # 0x145db8bf8
14021b9ce:     	movaps	%xmm0, 0x340(%rbp)
14021b9d5:     	movl	$0x3f800000, 0x350(%rbp) # imm = 0x3F800000
14021b9df:     	movups	%xmm0, 0x354(%rbp)
14021b9e6:     	movl	$0x3f800000, 0x364(%rbp) # imm = 0x3F800000
14021b9f0:     	movups	%xmm0, 0x368(%rbp)
14021b9f7:     	movl	$0x3f800000, 0x378(%rbp) # imm = 0x3F800000
14021ba01:     	movups	%xmm0, 0x37c(%rbp)
14021ba08:     	movl	$0x3f800000, 0x38c(%rbp) # imm = 0x3F800000
14021ba12:     	movq	0x2f0(%rbp), %rax
14021ba19:     	movq	%rax, 0x50(%rbp)
14021ba1d:     	movq	0x2f8(%rbp), %rax
14021ba24:     	movq	%rax, 0x58(%rbp)
14021ba28:     	movq	0x2e0(%rbp), %rax
14021ba2f:     	movq	%rax, 0x40(%rbp)
14021ba33:     	movq	0x2e8(%rbp), %rax
14021ba3a:     	movq	%rax, 0x48(%rbp)
14021ba3e:     	movaps	0x2a0(%rbp), %xmm0
14021ba45:     	movaps	0x2b0(%rbp), %xmm1
14021ba4c:     	movaps	0x2c0(%rbp), %xmm2
14021ba53:     	movaps	0x2d0(%rbp), %xmm3
14021ba5a:     	movaps	%xmm3, 0x30(%rbp)
14021ba5e:     	movaps	%xmm2, 0x20(%rbp)
14021ba62:     	movaps	%xmm1, 0x10(%rbp)
14021ba66:     	movaps	%xmm0, (%rbp)
14021ba6a:     	xorps	%xmm0, %xmm0
14021ba6d:     	movaps	%xmm0, 0x70(%rbp)
14021ba71:     	movaps	%xmm0, 0x60(%rbp)
14021ba75:     	movq	$0x0, 0x80(%rbp)
14021ba80:     	movups	%xmm0, 0x440(%rbp)
14021ba87:     	movups	%xmm0, 0x430(%rbp)
14021ba8e:     	movq	$0x0, 0x50a(%rbp)
14021ba99:     	movl	$0x0, 0x512(%rbp)
14021baa3:     	movaps	0x380(%rbp), %xmm0
14021baaa:     	movups	%xmm0, 0x652(%rbp)
14021bab1:     	movaps	0x340(%rbp), %xmm0
14021bab8:     	movaps	0x350(%rbp), %xmm1
14021babf:     	movaps	0x360(%rbp), %xmm2
14021bac6:     	movaps	0x370(%rbp), %xmm3
14021bacd:     	movups	%xmm3, 0x642(%rbp)
14021bad4:     	movups	%xmm2, 0x632(%rbp)
14021badb:     	movups	%xmm1, 0x622(%rbp)
14021bae2:     	movups	%xmm0, 0x612(%rbp)
14021bae9:     	movq	0x258(%rbp), %rsi
14021baf0:     	leaq	0x398(%rbp), %rcx
14021baf7:     	movq	%rbp, %rdx
14021bafa:     	movl	$0x88, %r8d
14021bb00:     	callq	0x145bc977b <.text+0x5bc877b>
14021bb05:     	movaps	0x5b9cbd4(%rip), %xmm0  # 0x145db86e0
14021bb0c:     	movups	%xmm0, 0x420(%rbp)
14021bb13:     	movups	%xmm11, 0x450(%rbp)
14021bb1b:     	movups	0x5b9ce26(%rip), %xmm0  # 0x145db8948
14021bb22:     	movups	%xmm0, 0x460(%rbp)
14021bb29:     	movups	%xmm12, 0x470(%rbp)
14021bb31:     	movups	%xmm10, 0x480(%rbp)
14021bb39:     	movups	%xmm9, 0x490(%rbp)
14021bb41:     	movups	%xmm9, 0x4a0(%rbp)
14021bb49:     	movups	%xmm13, 0x4b0(%rbp)
14021bb51:     	movups	%xmm13, 0x4c0(%rbp)
14021bb59:     	movaps	0x5b51700(%rip), %xmm0  # 0x145d6d260
14021bb60:     	movups	%xmm0, 0x4d0(%rbp)
14021bb67:     	movl	$0x1, 0x4e0(%rbp)
14021bb71:     	movq	$0x0, 0x4e4(%rbp)
14021bb7c:     	movb	$0x1, 0x4ec(%rbp)
14021bb83:     	movq	$0x0, 0x4f0(%rbp)
14021bb8e:     	movl	$0x3f800000, 0x4f8(%rbp) # imm = 0x3F800000
14021bb98:     	movw	$0x101, 0x4fc(%rbp)     # imm = 0x101
14021bba1:     	movw	$0x0, 0x502(%rbp)
14021bbaa:     	movl	$0x10000, 0x4fe(%rbp)   # imm = 0x10000
14021bbb4:     	movl	$0x10000, 0x504(%rbp)   # imm = 0x10000
14021bbbe:     	movw	$0x0, 0x508(%rbp)
14021bbc7:     	movups	0x610(%rbp), %xmm0
14021bbce:     	movups	0x620(%rbp), %xmm1
14021bbd5:     	movups	0x630(%rbp), %xmm2
14021bbdc:     	movups	0x640(%rbp), %xmm3
14021bbe3:     	movups	%xmm0, 0x516(%rbp)
14021bbea:     	movups	%xmm1, 0x526(%rbp)
14021bbf1:     	movups	%xmm2, 0x536(%rbp)
14021bbf8:     	movups	%xmm3, 0x546(%rbp)
14021bbff:     	movups	0x650(%rbp), %xmm0
14021bc06:     	movups	%xmm0, 0x556(%rbp)
14021bc0d:     	movzwl	0x660(%rbp), %eax
14021bc14:     	movw	%ax, 0x566(%rbp)
14021bc1b:     	movups	0x5b9cf26(%rip), %xmm0  # 0x145db8b48
14021bc22:     	movups	%xmm0, 0x568(%rbp)
14021bc29:     	movl	$0x3f800000, 0x578(%rbp) # imm = 0x3F800000
14021bc33:     	movq	%rsi, 0x390(%rbp)
14021bc3a:     	leaq	0x2a0(%rbp), %rcx
14021bc41:     	leaq	0x390(%rbp), %r8
14021bc48:     	movq	%rbx, %rdx
14021bc4b:     	callq	0x14018a750 <.text+0x189750>
14021bc50:     	movq	0x20(%r14), %rdi
14021bc54:     	movq	0x28(%r14), %rbx
14021bc58:     	movq	0x30(%r14), %rax
14021bc5c:     	movq	%rax, 0x668(%rbp)
14021bc63:     	movq	0x38(%r14), %rax
14021bc67:     	movq	%rax, 0x680(%rbp)
14021bc6e:     	movq	0x40(%r14), %r14
14021bc72:     	movq	0x2a0(%rbp), %rax
14021bc79:     	movq	0x2c8(%rbp), %rcx
14021bc80:     	movq	%rax, 0x390(%rbp)
14021bc87:     	movups	0x2a8(%rbp), %xmm0
14021bc8e:     	movups	%xmm0, 0x398(%rbp)
14021bc95:     	movups	0x2b8(%rbp), %xmm0
14021bc9c:     	movups	%xmm0, 0x3a8(%rbp)
14021bca3:     	movq	%rcx, 0x3b8(%rbp)
14021bcaa:     	movq	0x10(%r13), %r8
14021bcae:     	movq	0x18(%r13), %r9
14021bcb2:     	leaq	0x390(%rbp), %rsi
14021bcb9:     	movq	%rsi, %rcx
14021bcbc:     	movq	%r13, %r12
14021bcbf:     	movq	0x330(%rbp), %r13
14021bcc6:     	movq	%r13, %rdx
14021bcc9:     	callq	0x140128540 <.text+0x127540>
14021bcce:     	movzbl	(%rdi), %edi
14021bcd1:     	movq	%rsi, %rcx
14021bcd4:     	movl	%edi, %edx
14021bcd6:     	movq	%r12, %r8
14021bcd9:     	movq	%rbx, %r9
14021bcdc:     	callq	0x14012cde0 <.text+0x12bde0>
14021bce1:     	movq	0x38(%r12), %rax
14021bce6:     	testq	%rax, %rax
14021bce9:     	movq	0x688(%rbp), %r15
14021bcf0:     	je	0x14021bd57 <.text+0x21ad57>
14021bcf2:     	movq	0x690(%rbp), %rcx
14021bcf9:     	movq	0x30(%rcx), %r12
14021bcfd:     	imulq	$0x78, %rax, %rsi
14021bd01:     	nopw	%cs:(%rax,%rax)
14021bd10:     	movq	0x680(%rbp), %rax
14021bd17:     	movl	(%rax), %eax
14021bd19:     	movzbl	(%r14), %ecx
14021bd1d:     	movq	%r12, 0x28(%rsp)
14021bd22:     	addq	$0x78, %r12
14021bd26:     	movb	%cl, 0x40(%rsp)
14021bd2a:     	movl	%eax, 0x38(%rsp)
14021bd2e:     	movq	%rbx, 0x30(%rsp)
14021bd33:     	movb	%dil, 0x20(%rsp)
14021bd38:     	leaq	0x390(%rbp), %rcx
14021bd3f:     	movq	%r15, %rdx
14021bd42:     	movq	%r13, %r8
14021bd45:     	movq	0x668(%rbp), %r9
14021bd4c:     	callq	0x140129140 <.text+0x128140>
14021bd51:     	addq	$-0x78, %rsi
14021bd55:     	jne	0x14021bd10 <.text+0x21ad10>
14021bd57:     	movq	%rbx, 0x20(%rsp)
14021bd5c:     	leaq	0x258(%rbp), %rcx
14021bd63:     	movq	%r15, %rdx
14021bd66:     	movq	%r13, %r8
14021bd69:     	movq	0x690(%rbp), %r9
14021bd70:     	callq	0x140128e80 <.text+0x127e80>
14021bd75:     	movq	0x338(%rbp), %rax
14021bd7c:     	movaps	0x6a0(%rbp), %xmm6
14021bd83:     	movaps	0x6b0(%rbp), %xmm7
14021bd8a:     	movaps	0x6c0(%rbp), %xmm8
14021bd92:     	movaps	0x6d0(%rbp), %xmm9
14021bd9a:     	movaps	0x6e0(%rbp), %xmm10
14021bda2:     	movaps	0x6f0(%rbp), %xmm11
14021bdaa:     	movaps	0x700(%rbp), %xmm12
14021bdb2:     	movaps	0x710(%rbp), %xmm13
14021bdba:     	movaps	0x720(%rbp), %xmm14
14021bdc2:     	movaps	0x730(%rbp), %xmm15
14021bdca:     	addq	$0x7c8, %rsp            # imm = 0x7C8
14021bdd1:     	popq	%rbx
14021bdd2:     	popq	%rdi
14021bdd3:     	popq	%rsi
14021bdd4:     	popq	%r12
14021bdd6:     	popq	%r13
14021bdd8:     	popq	%r14
14021bdda:     	popq	%r15
14021bddc:     	popq	%rbp
14021bddd:     	retq
14021bdde:     	ud2

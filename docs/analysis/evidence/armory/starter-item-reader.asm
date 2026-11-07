
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453df730:     	pushq	%rbp
1453df731:     	pushq	%r15
1453df733:     	pushq	%r14
1453df735:     	pushq	%r13
1453df737:     	pushq	%r12
1453df739:     	pushq	%rsi
1453df73a:     	pushq	%rdi
1453df73b:     	pushq	%rbx
1453df73c:     	subq	$0x68, %rsp
1453df740:     	leaq	0x60(%rsp), %rbp
1453df745:     	movq	$-0x2, (%rbp)
1453df74d:     	movl	%edx, %r12d
1453df750:     	movq	%rcx, %rsi
1453df753:     	cmpl	$0x838, %edx            # imm = 0x838
1453df759:     	jg	0x1453df794 <.text+0x53de794>
1453df75b:     	cmpl	$0x572, %r12d           # imm = 0x572
1453df762:     	jg	0x1453df839 <.text+0x53de839>
1453df768:     	leal	-0x19(%r12), %eax
1453df76d:     	cmpl	$0x81, %eax
1453df772:     	ja	0x1453dfa58 <.text+0x53dea58>
1453df778:     	leaq	0x12fa8dd(%rip), %rcx   # 0x1466da05c
1453df77f:     	movslq	(%rcx,%rax,4), %rax
1453df783:     	addq	%rcx, %rax
1453df786:     	jmpq	*%rax
1453df788:     	leaq	0x12ea1e1(%rip), %r13   # 0x1466c9970
1453df78f:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df794:     	cmpl	$0xe4c, %r12d           # imm = 0xE4C
1453df79b:     	jle	0x1453df7ca <.text+0x53de7ca>
1453df79d:     	leal	-0x17d0(%r12), %eax
1453df7a5:     	cmpl	$0x30, %eax
1453df7a8:     	ja	0x1453df88e <.text+0x53de88e>
1453df7ae:     	leaq	0x12faaaf(%rip), %rcx   # 0x1466da264
1453df7b5:     	movslq	(%rcx,%rax,4), %rax
1453df7b9:     	addq	%rcx, %rax
1453df7bc:     	jmpq	*%rax
1453df7be:     	leaq	0x12ea813(%rip), %r13   # 0x1466c9fd8
1453df7c5:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df7ca:     	cmpl	$0x9c7, %r12d           # imm = 0x9C7
1453df7d1:     	jle	0x1453df806 <.text+0x53de806>
1453df7d3:     	cmpl	$0xb82, %r12d           # imm = 0xB82
1453df7da:     	jg	0x1453df86c <.text+0x53de86c>
1453df7e0:     	cmpl	$0x9c8, %r12d           # imm = 0x9C8
1453df7e7:     	je	0x1453df8b4 <.text+0x53de8b4>
1453df7ed:     	cmpl	$0x9cc, %r12d           # imm = 0x9CC
1453df7f4:     	jne	0x1453dfa58 <.text+0x53dea58>
1453df7fa:     	leaq	0x12ea737(%rip), %r13   # 0x1466c9f38
1453df801:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df806:     	cmpl	$0x839, %r12d           # imm = 0x839
1453df80d:     	je	0x1453df8d8 <.text+0x53de8d8>
1453df813:     	cmpl	$0x939, %r12d           # imm = 0x939
1453df81a:     	je	0x1453df8cc <.text+0x53de8cc>
1453df820:     	cmpl	$0x93a, %r12d           # imm = 0x93A
1453df827:     	jne	0x1453dfa58 <.text+0x53dea58>
1453df82d:     	leaq	0x12ea6b4(%rip), %r13   # 0x1466c9ee8
1453df834:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df839:     	cmpl	$0x573, %r12d           # imm = 0x573
1453df840:     	je	0x1453dfa4c <.text+0x53dea4c>
1453df846:     	cmpl	$0x574, %r12d           # imm = 0x574
1453df84d:     	je	0x1453dfa40 <.text+0x53dea40>
1453df853:     	cmpl	$0x82c, %r12d           # imm = 0x82C
1453df85a:     	jne	0x1453dfa58 <.text+0x53dea58>
1453df860:     	leaq	0x12ea609(%rip), %r13   # 0x1466c9e70
1453df867:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df86c:     	cmpl	$0xb83, %r12d           # imm = 0xB83
1453df873:     	je	0x1453df8c0 <.text+0x53de8c0>
1453df875:     	cmpl	$0xc27, %r12d           # imm = 0xC27
1453df87c:     	jne	0x1453dfa58 <.text+0x53dea58>
1453df882:     	leaq	0x12ea6ff(%rip), %r13   # 0x1466c9f88
1453df889:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df88e:     	cmpl	$0xe4d, %r12d           # imm = 0xE4D
1453df895:     	je	0x1453dfb4e <.text+0x53deb4e>
1453df89b:     	cmpl	$0x2ffa, %r12d          # imm = 0x2FFA
1453df8a2:     	jne	0x1453dfa58 <.text+0x53dea58>
1453df8a8:     	leaq	0x12eaae9(%rip), %r13   # 0x1466ca398
1453df8af:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df8b4:     	leaq	0x12ea655(%rip), %r13   # 0x1466c9f10
1453df8bb:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df8c0:     	leaq	0x12ea699(%rip), %r13   # 0x1466c9f60
1453df8c7:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df8cc:     	leaq	0x12ea5ed(%rip), %r13   # 0x1466c9ec0
1453df8d3:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df8d8:     	leaq	0x12ea5b9(%rip), %r13   # 0x1466c9e98
1453df8df:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df8e4:     	leaq	0x12ea3a5(%rip), %r13   # 0x1466c9c90
1453df8eb:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df8f0:     	leaq	0x12ea461(%rip), %r13   # 0x1466c9d58
1453df8f7:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df8fc:     	leaq	0x12ea3dd(%rip), %r13   # 0x1466c9ce0
1453df903:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df908:     	leaq	0x12ea499(%rip), %r13   # 0x1466c9da8
1453df90f:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df914:     	leaq	0x12ea2d5(%rip), %r13   # 0x1466c9bf0
1453df91b:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df920:     	leaq	0x12ea071(%rip), %r13   # 0x1466c9998
1453df927:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df92c:     	leaq	0x12ea105(%rip), %r13   # 0x1466c9a38
1453df933:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df938:     	leaq	0x12ea0d1(%rip), %r13   # 0x1466c9a10
1453df93f:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df944:     	leaq	0x12ea075(%rip), %r13   # 0x1466c99c0
1453df94b:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df950:     	leaq	0x12ea2e9(%rip), %r13   # 0x1466c9c40
1453df957:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df95c:     	leaq	0x12ea085(%rip), %r13   # 0x1466c99e8
1453df963:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df968:     	leaq	0x12ea169(%rip), %r13   # 0x1466c9ad8
1453df96f:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df974:     	leaq	0x12ea10d(%rip), %r13   # 0x1466c9a88
1453df97b:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df980:     	leaq	0x12ea1c9(%rip), %r13   # 0x1466c9b50
1453df987:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df98c:     	leaq	0x12ea0cd(%rip), %r13   # 0x1466c9a60
1453df993:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df998:     	leaq	0x12ea279(%rip), %r13   # 0x1466c9c18
1453df99f:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df9a4:     	leaq	0x12ea2bd(%rip), %r13   # 0x1466c9c68
1453df9ab:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df9b0:     	leaq	0x12ea0f9(%rip), %r13   # 0x1466c9ab0
1453df9b7:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df9bc:     	leaq	0x12ea1b5(%rip), %r13   # 0x1466c9b78
1453df9c3:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df9c8:     	leaq	0x12ea1d1(%rip), %r13   # 0x1466c9ba0
1453df9cf:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df9d4:     	leaq	0x12ea125(%rip), %r13   # 0x1466c9b00
1453df9db:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df9e0:     	leaq	0x12ea321(%rip), %r13   # 0x1466c9d08
1453df9e7:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df9ec:     	leaq	0x12ea3dd(%rip), %r13   # 0x1466c9dd0
1453df9f3:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453df9f8:     	leaq	0x12ea381(%rip), %r13   # 0x1466c9d80
1453df9ff:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa04:     	leaq	0x12ea3ed(%rip), %r13   # 0x1466c9df8
1453dfa0b:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa10:     	leaq	0x12ea111(%rip), %r13   # 0x1466c9b28
1453dfa17:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa1c:     	leaq	0x12ea30d(%rip), %r13   # 0x1466c9d30
1453dfa23:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa28:     	leaq	0x12ea199(%rip), %r13   # 0x1466c9bc8
1453dfa2f:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa34:     	leaq	0x12ea27d(%rip), %r13   # 0x1466c9cb8
1453dfa3b:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa40:     	leaq	0x12ea401(%rip), %r13   # 0x1466c9e48
1453dfa47:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa4c:     	leaq	0x12ea3cd(%rip), %r13   # 0x1466c9e20
1453dfa53:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa58:     	movq	$-0x1, (%rsi)
1453dfa5f:     	jmp	0x1453dfc83 <.text+0x53dec83>
1453dfa64:     	leaq	0x12ea8b5(%rip), %r13   # 0x1466ca320
1453dfa6b:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa70:     	leaq	0x12ea881(%rip), %r13   # 0x1466ca2f8
1453dfa77:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa7c:     	leaq	0x12ea7fd(%rip), %r13   # 0x1466ca280
1453dfa83:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa88:     	leaq	0x12ea7a1(%rip), %r13   # 0x1466ca230
1453dfa8f:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfa94:     	leaq	0x12ea62d(%rip), %r13   # 0x1466ca0c8
1453dfa9b:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfaa0:     	leaq	0x12ea829(%rip), %r13   # 0x1466ca2d0
1453dfaa7:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfaac:     	leaq	0x12ea5c5(%rip), %r13   # 0x1466ca078
1453dfab3:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfab8:     	leaq	0x12ea799(%rip), %r13   # 0x1466ca258
1453dfabf:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfac4:     	leaq	0x12ea585(%rip), %r13   # 0x1466ca050
1453dfacb:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfad0:     	leaq	0x12ea641(%rip), %r13   # 0x1466ca118
1453dfad7:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfad9:     	leaq	0x12ea728(%rip), %r13   # 0x1466ca208
1453dfae0:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfae2:     	leaq	0x12ea53f(%rip), %r13   # 0x1466ca028
1453dfae9:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfaeb:     	leaq	0x12ea50e(%rip), %r13   # 0x1466ca000
1453dfaf2:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfaf4:     	leaq	0x12ea5f5(%rip), %r13   # 0x1466ca0f0
1453dfafb:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfafd:     	leaq	0x12ea6dc(%rip), %r13   # 0x1466ca1e0
1453dfb04:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfb06:     	leaq	0x12ea683(%rip), %r13   # 0x1466ca190
1453dfb0d:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfb0f:     	leaq	0x12ea58a(%rip), %r13   # 0x1466ca0a0
1453dfb16:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfb18:     	leaq	0x12ea621(%rip), %r13   # 0x1466ca140
1453dfb1f:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfb21:     	leaq	0x12ea640(%rip), %r13   # 0x1466ca168
1453dfb28:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfb2a:     	leaq	0x12ea777(%rip), %r13   # 0x1466ca2a8
1453dfb31:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfb33:     	leaq	0x12ea67e(%rip), %r13   # 0x1466ca1b8
1453dfb3a:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfb3c:     	leaq	0x12ea805(%rip), %r13   # 0x1466ca348
1453dfb43:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfb45:     	leaq	0x12ea824(%rip), %r13   # 0x1466ca370
1453dfb4c:     	jmp	0x1453dfb55 <.text+0x53deb55>
1453dfb4e:     	leaq	0x12ea45b(%rip), %r13   # 0x1466c9fb0
1453dfb55:     	movl	0x18(%r13), %eax
1453dfb59:     	decl	%eax
1453dfb5b:     	movb	$0x11, %dil
1453dfb5e:     	cmpl	$0x17, %eax
1453dfb61:     	jae	0x1453dfb70 <.text+0x53deb70>
1453dfb63:     	movl	%eax, %eax
1453dfb65:     	leaq	0x12f9dbc(%rip), %rcx   # 0x1466d9928
1453dfb6c:     	movzbl	(%rax,%rcx), %edi
1453dfb70:     	leaq	0x10(%r13), %rax
1453dfb74:     	movq	%rax, -0x38(%rbp)
1453dfb78:     	leaq	0x2fc0e1(%rip), %rax    # 0x1456dbc60 <.text+0x56dac60>
1453dfb7f:     	movq	%rax, -0x30(%rbp)
1453dfb83:     	leaq	0x12eb013(%rip), %rdx   # 0x1466cab9d
1453dfb8a:     	leaq	-0x28(%rbp), %rcx
1453dfb8e:     	leaq	-0x38(%rbp), %r8
1453dfb92:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453dfb97:     	movq	-0x20(%rbp), %rcx
1453dfb9b:     	movq	-0x18(%rbp), %rdx
1453dfb9f:     	movq	(%r13), %r14
1453dfba3:     	movq	0x8(%r13), %r15
1453dfba7:     	movq	%rcx, -0x8(%rbp)
1453dfbab:     	callq	0x14541f0e0 <.text+0x541e0e0>
1453dfbb0:     	nop
1453dfbb1:     	movq	%rdx, %rbx
1453dfbb4:     	testq	%rax, %rax
1453dfbb7:     	cmovneq	%rax, %r14
1453dfbbb:     	cmoveq	%r15, %rbx
1453dfbbf:     	testq	%rbx, %rbx
1453dfbc2:     	jns	0x1453dfbd5 <.text+0x53debd5>
1453dfbc4:     	xorl	%r12d, %r12d
1453dfbc7:     	movq	%r12, %rcx
1453dfbca:     	movq	%rbx, %rdx
1453dfbcd:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1453dfbd2:     	nop
1453dfbd3:     	ud2
1453dfbd5:     	je	0x1453dfc0f <.text+0x53dec0f>
1453dfbd7:     	movq	%r12, -0x10(%rbp)
1453dfbdb:     	callq	0x140002200 <.text+0x1200>
1453dfbe0:     	movl	$0x1, %r12d
1453dfbe6:     	movl	$0x1, %edx
1453dfbeb:     	movq	%rbx, %rcx
1453dfbee:     	callq	0x1400021c0 <.text+0x11c0>
1453dfbf3:     	testq	%rax, %rax
1453dfbf6:     	je	0x1453dfbc7 <.text+0x53debc7>
1453dfbf8:     	movq	%rax, %r15
1453dfbfb:     	movq	%rax, %rcx
1453dfbfe:     	movq	%r14, %rdx
1453dfc01:     	movq	%rbx, %r8
1453dfc04:     	callq	0x1457149fd <.text+0x57139fd>
1453dfc09:     	movq	-0x10(%rbp), %r12
1453dfc0d:     	jmp	0x1453dfc15 <.text+0x53dec15>
1453dfc0f:     	movl	$0x1, %r15d
1453dfc15:     	movl	0x24(%r13), %eax
1453dfc19:     	movq	%rbx, (%rsi)
1453dfc1c:     	movq	%r15, 0x8(%rsi)
1453dfc20:     	movq	%rbx, 0x10(%rsi)
1453dfc24:     	movq	$0x0, 0x18(%rsi)
1453dfc2c:     	movq	$0x4, 0x20(%rsi)
1453dfc34:     	movq	$0x0, 0x48(%rsi)
1453dfc3c:     	xorps	%xmm0, %xmm0
1453dfc3f:     	movups	%xmm0, 0x28(%rsi)
1453dfc43:     	movq	$0x0, 0x38(%rsi)
1453dfc4b:     	movl	%r12d, 0x50(%rsi)
1453dfc4f:     	movdqu	0x14(%r13), %xmm0
1453dfc55:     	pshufd	$0x78, %xmm0, %xmm0     # xmm0 = xmm0[0,2,3,1]
1453dfc5a:     	movdqu	%xmm0, 0x54(%rsi)
1453dfc5f:     	movl	%eax, 0x64(%rsi)
1453dfc62:     	movb	%dil, 0x68(%rsi)
1453dfc66:     	movb	$0x0, 0x69(%rsi)
1453dfc6a:     	movq	-0x28(%rbp), %rdx
1453dfc6e:     	testq	%rdx, %rdx
1453dfc71:     	je	0x1453dfc83 <.text+0x53dec83>
1453dfc73:     	movl	$0x1, %r8d
1453dfc79:     	movq	-0x8(%rbp), %rcx
1453dfc7d:     	callq	0x1400021d0 <.text+0x11d0>
1453dfc82:     	nop
1453dfc83:     	addq	$0x68, %rsp
1453dfc87:     	popq	%rbx
1453dfc88:     	popq	%rdi
1453dfc89:     	popq	%rsi
1453dfc8a:     	popq	%r12
1453dfc8c:     	popq	%r13
1453dfc8e:     	popq	%r14
1453dfc90:     	popq	%r15
1453dfc92:     	popq	%rbp
1453dfc93:     	retq

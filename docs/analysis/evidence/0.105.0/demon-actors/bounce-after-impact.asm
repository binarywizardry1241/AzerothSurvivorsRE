
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14590a838:     	movq	%r14, %rsi
14590a83b:     	testq	%r14, %r14
14590a83e:     	je	0x14590a710 <.text+0x5909710>
14590a844:     	leaq	0xa0(%rbp), %rcx
14590a84b:     	movq	0x378(%rbp), %rdx
14590a852:     	callq	0x14594f150 <.text+0x594e150>
14590a857:     	nop
14590a858:     	cmpl	$0x1, 0xa0(%rbp)
14590a85f:     	jne	0x14590a710 <.text+0x5909710>
14590a865:     	movl	0xa4(%rbp), %r14d
14590a86c:     	movss	0xa8(%rbp), %xmm10
14590a875:     	movq	0x378(%rbp), %rcx
14590a87c:     	movss	0x9ec(%rcx), %xmm0
14590a884:     	movq	0x560(%rcx), %rax
14590a88b:     	imulq	$0x160, 0x568(%rcx), %rdx # imm = 0x160
14590a896:     	xorl	%ecx, %ecx
14590a898:     	movq	%rax, %r8
14590a89b:     	nopl	(%rax,%rax)
14590a8a0:     	cmpq	%rcx, %rdx
14590a8a3:     	je	0x14590a710 <.text+0x5909710>
14590a8a9:     	addq	$0x160, %rcx            # imm = 0x160
14590a8b0:     	cmpq	%rbx, 0x88(%r8)
14590a8b7:     	leaq	0x160(%r8), %r8
14590a8be:     	jne	0x14590a8a0 <.text+0x59098a0>
14590a8c0:     	movss	-0x38(%rax,%rcx), %xmm1
14590a8c6:     	ucomiss	%xmm1, %xmm7
14590a8c9:     	jae	0x14590aa14 <.text+0x5909a14>
14590a8cf:     	subss	-0x3c(%rax,%rcx), %xmm0
14590a8d5:     	divss	%xmm1, %xmm0
14590a8d9:     	xorps	%xmm1, %xmm1
14590a8dc:     	maxss	%xmm0, %xmm1
14590a8e0:     	movss	0x462a84(%rip), %xmm0   # 0x145d6d36c
14590a8e8:     	minss	%xmm1, %xmm0
14590a8ec:     	movss	-0x4c(%rax,%rcx), %xmm1
14590a8f2:     	movss	-0x40(%rax,%rcx), %xmm2
14590a8f8:     	subss	%xmm1, %xmm2
14590a8fc:     	mulss	%xmm0, %xmm2
14590a900:     	addss	%xmm1, %xmm2
14590a904:     	movsd	-0x54(%rax,%rcx), %xmm1
14590a90a:     	movsd	-0x48(%rax,%rcx), %xmm3
14590a910:     	subps	%xmm1, %xmm3
14590a913:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
14590a917:     	mulps	%xmm3, %xmm0
14590a91a:     	addps	%xmm1, %xmm0
14590a91d:     	movlps	%xmm0, 0x8(%rbp)
14590a921:     	movss	%xmm2, 0x10(%rbp)
14590a926:     	jmp	0x14590aa24 <.text+0x5909a24>
14590a92b:     	leaq	0x156a76e(%rip), %rsi   # 0x146e750a0
14590a932:     	testl	%edx, %edx
14590a934:     	jne	0x14590a57a <.text+0x590957a>
14590a93a:     	jmp	0x14590a57c <.text+0x590957c>
14590a93f:     	leaq	0x156a832(%rip), %rsi   # 0x146e75178
14590a946:     	cmpl	$0x162c, %edx           # imm = 0x162C
14590a94c:     	jne	0x14590a57a <.text+0x590957a>
14590a952:     	jmp	0x14590a57c <.text+0x590957c>
14590a957:     	leaq	0x155090a(%rip), %rsi   # 0x146e5b268
14590a95e:     	testl	%edx, %edx
14590a960:     	jne	0x14590a57a <.text+0x590957a>
14590a966:     	jmp	0x14590a57c <.text+0x590957c>
14590a96b:     	leaq	0x156a89e(%rip), %rsi   # 0x146e75210
14590a972:     	cmpl	$0x2ae, %edx            # imm = 0x2AE
14590a978:     	jne	0x14590a57a <.text+0x590957a>
14590a97e:     	jmp	0x14590a57c <.text+0x590957c>
14590a983:     	leaq	0x156a75e(%rip), %rsi   # 0x146e750e8
14590a98a:     	testl	%edx, %edx
14590a98c:     	jne	0x14590a57a <.text+0x590957a>
14590a992:     	jmp	0x14590a57c <.text+0x590957c>
14590a997:     	leaq	0x156a622(%rip), %rsi   # 0x146e74fc0
14590a99e:     	cmpl	$0x85, %edx
14590a9a4:     	jne	0x14590a57a <.text+0x590957a>
14590a9aa:     	jmp	0x14590a57c <.text+0x590957c>
14590a9af:     	leaq	0x156a6a2(%rip), %rsi   # 0x146e75058
14590a9b6:     	testl	%edx, %edx
14590a9b8:     	jne	0x14590a57a <.text+0x590957a>
14590a9be:     	jmp	0x14590a57c <.text+0x590957c>
14590a9c3:     	leaq	0x156a5ae(%rip), %rsi   # 0x146e74f78
14590a9ca:     	cmpl	$0x74, %edx
14590a9cd:     	jne	0x14590a57a <.text+0x590957a>
14590a9d3:     	jmp	0x14590a57c <.text+0x590957c>
14590a9d8:     	leaq	0x156a881(%rip), %rsi   # 0x146e75260
14590a9df:     	testl	%edx, %edx
14590a9e1:     	jne	0x14590a57a <.text+0x590957a>
14590a9e7:     	jmp	0x14590a57c <.text+0x590957c>
14590a9ec:     	leaq	0x156a7cd(%rip), %rsi   # 0x146e751c0
14590a9f3:     	testl	%edx, %edx
14590a9f5:     	jne	0x14590a57a <.text+0x590957a>
14590a9fb:     	jmp	0x14590a57c <.text+0x590957c>
14590aa00:     	leaq	0x15507f1(%rip), %rsi   # 0x146e5b1f8
14590aa07:     	testl	%edx, %edx
14590aa09:     	jne	0x14590a57a <.text+0x590957a>
14590aa0f:     	jmp	0x14590a57c <.text+0x590957c>
14590aa14:     	movl	-0x40(%rax,%rcx), %edx
14590aa18:     	movl	%edx, 0x10(%rbp)
14590aa1b:     	movq	-0x48(%rax,%rcx), %rax
14590aa20:     	movq	%rax, 0x8(%rbp)
14590aa24:     	movq	%rbx, 0x2c0(%rbp)
14590aa2b:     	leaq	0x2c0(%rbp), %rax
14590aa32:     	movq	%rax, 0x20(%rsp)
14590aa37:     	movq	$0x1, 0x28(%rsp)
14590aa40:     	leaq	0xa0(%rbp), %rcx
14590aa47:     	movq	0x378(%rbp), %rdx
14590aa4e:     	leaq	0x8(%rbp), %r8
14590aa52:     	movss	0x462bf6(%rip), %xmm3   # 0x145d6d650
14590aa5a:     	callq	0x145925c80 <.text+0x5924c80>
14590aa5f:     	nop
14590aa60:     	movq	0xa8(%rbp), %r8
14590aa67:     	movq	%r8, 0x338(%rbp)
14590aa6e:     	testl	%r14d, %r14d
14590aa71:     	je	0x14590aab8 <.text+0x5909ab8>
14590aa73:     	movq	0xb0(%rbp), %rax
14590aa7a:     	leaq	(%r8,%rax,8), %rcx
14590aa7e:     	movq	%rcx, 0x338(%rbp)
14590aa85:     	leaq	(,%r14,8), %rcx
14590aa8d:     	shlq	$0x3, %rax
14590aa91:     	xorl	%edx, %edx
14590aa93:     	nopw	%cs:(%rax,%rax)
14590aaa0:     	cmpq	%rdx, %rax
14590aaa3:     	je	0x14590aab8 <.text+0x5909ab8>
14590aaa5:     	addq	$0x8, %rdx
14590aaa9:     	cmpq	%rdx, %rcx
14590aaac:     	jne	0x14590aaa0 <.text+0x5909aa0>
14590aaae:     	addq	%r8, %rdx
14590aab1:     	movq	%rdx, 0x338(%rbp)
14590aab8:     	movq	0xa0(%rbp), %rax
14590aabf:     	movq	%rax, 0x40(%rbp)
14590aac3:     	mulss	%xmm10, %xmm8
14590aac8:     	movl	0x34(%rsi), %eax
14590aacb:     	movl	%eax, 0x330(%rbp)
14590aad1:     	movzbl	0x38(%rsi), %eax
14590aad5:     	movb	%al, 0x60(%rbp)
14590aad8:     	movq	%r8, -0x8(%rbp)
14590aadc:     	movq	%rsi, 0x48(%rbp)
14590aae0:     	cmpq	0x338(%rbp), %r8
14590aae7:     	je	0x14590ac9a <.text+0x5909c9a>
14590aaed:     	nopl	(%rax)
14590aaf0:     	movq	%r8, %rbx
14590aaf3:     	movq	(%r8), %r14
14590aaf6:     	movq	%r14, 0x30(%rbp)
14590aafa:     	movq	%r14, 0x2c8(%rbp)
14590ab01:     	movl	$0x0, 0x2c0(%rbp)
14590ab0b:     	movl	$0x0, 0x18(%rbp)
14590ab12:     	leaq	0x18(%rbp), %rax
14590ab16:     	movq	%rax, 0x30(%rsp)
14590ab1b:     	leaq	0x2c0(%rbp), %rax
14590ab22:     	movq	%rax, 0x28(%rsp)
14590ab27:     	movq	$0x1, 0x20(%rsp)
14590ab30:     	leaq	0xa0(%rbp), %rcx
14590ab37:     	movq	0x360(%rbp), %rdx
14590ab3e:     	movl	$0x6af7, %r8d           # imm = 0x6AF7
14590ab44:     	leaq	0x30(%rbp), %r9
14590ab48:     	callq	0x1458b5100 <.text+0x58b4100>
14590ab4d:     	nop
14590ab4e:     	movq	0x378(%rbp), %rax
14590ab55:     	movq	0x5e0(%rax), %rsi
14590ab5c:     	cmpq	0x5d0(%rax), %rsi
14590ab63:     	jne	0x14590ab72 <.text+0x5909b72>
14590ab65:     	movq	0x350(%rbp), %rcx
14590ab6c:     	callq	0x145bcb530 <.text+0x5bca530>
14590ab71:     	nop
14590ab72:     	movq	0x378(%rbp), %r12
14590ab79:     	movq	0x5d8(%r12), %rax
14590ab81:     	movq	%rsi, %rcx
14590ab84:     	shlq	$0x5, %rcx
14590ab88:     	movups	0xa0(%rbp), %xmm0
14590ab8f:     	movups	0xb0(%rbp), %xmm1
14590ab96:     	movups	%xmm1, 0x10(%rax,%rcx)
14590ab9b:     	movups	%xmm0, (%rax,%rcx)
14590ab9f:     	incq	%rsi
14590aba2:     	movq	%rsi, 0x5e0(%r12)
14590abaa:     	movb	0x195(%r12), %dil
14590abb2:     	movb	$0x2, 0x195(%r12)
14590abbb:     	movq	0x170(%r12), %r15
14590abc3:     	movq	0x48(%rbp), %rsi
14590abc7:     	movq	%rsi, 0x170(%r12)
14590abcf:     	movq	0x370(%rbp), %rax
14590abd6:     	movups	(%rax), %xmm0
14590abd9:     	movups	0x10(%rax), %xmm1
14590abdd:     	movups	0x20(%rax), %xmm2
14590abe1:     	movaps	%xmm2, 0xc0(%rbp)
14590abe8:     	movaps	%xmm1, 0xb0(%rbp)
14590abef:     	movaps	%xmm0, 0xa0(%rbp)
14590abf6:     	leaq	0x156fc13(%rip), %rax   # 0x146e7a810
14590abfd:     	movq	%rax, 0x140(%r12)
14590ac05:     	movq	$0xd, 0x148(%r12)
14590ac11:     	movq	$0x0, 0x150(%r12)
14590ac1d:     	movb	$0x0, 0x168(%r12)
14590ac26:     	movzbl	0x60(%rbp), %eax
14590ac2a:     	movb	%al, 0x20(%rsp)
14590ac2e:     	movb	$0x0, 0x30(%rsp)
14590ac33:     	movb	$0x0, 0x28(%rsp)
14590ac38:     	movq	%r12, %rcx
14590ac3b:     	movq	%r14, %rdx
14590ac3e:     	movaps	%xmm8, %xmm2
14590ac42:     	movl	0x330(%rbp), %r9d
14590ac49:     	callq	0x145933ec0 <.text+0x5932ec0>
14590ac4e:     	nop
14590ac4f:     	movq	%rbx, %r8
14590ac52:     	addq	$0x8, %r8
14590ac56:     	movaps	0xa0(%rbp), %xmm0
14590ac5d:     	movaps	0xb0(%rbp), %xmm1
14590ac64:     	movaps	0xc0(%rbp), %xmm2
14590ac6b:     	movq	0x370(%rbp), %rax
14590ac72:     	movups	%xmm2, 0x20(%rax)
14590ac76:     	movups	%xmm1, 0x10(%rax)
14590ac7a:     	movups	%xmm0, (%rax)
14590ac7d:     	movq	%r15, 0x170(%r12)
14590ac85:     	movb	%dil, 0x195(%r12)
14590ac8d:     	cmpq	0x338(%rbp), %r8
14590ac94:     	jne	0x14590aaf0 <.text+0x5909af0>
14590ac9a:     	movq	0x40(%rbp), %rdx
14590ac9e:     	testq	%rdx, %rdx
14590aca1:     	leaq	0xb0(%rbp), %r12
14590aca8:     	je	0x14590a710 <.text+0x5909710>
14590acae:     	shlq	$0x3, %rdx
14590acb2:     	movl	$0x8, %r8d
14590acb8:     	movq	-0x8(%rbp), %rcx
14590acbc:     	callq	0x1400021d0 <.text+0x11d0>
14590acc1:     	jmp	0x14590a710 <.text+0x5909710>

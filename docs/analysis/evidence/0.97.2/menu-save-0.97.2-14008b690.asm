
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14008b690:     	pushq	%rbp
14008b691:     	pushq	%r14
14008b693:     	pushq	%rsi
14008b694:     	pushq	%rdi
14008b695:     	pushq	%rbx
14008b696:     	subq	$0x2c0, %rsp            # imm = 0x2C0
14008b69d:     	leaq	0x80(%rsp), %rbp
14008b6a5:     	movq	$-0x2, 0x238(%rbp)
14008b6b0:     	movq	%rcx, %rsi
14008b6b3:     	leaq	-0x58(%rbp), %rcx
14008b6b7:     	callq	0x14541e3c0 <.text+0x541d3c0>
14008b6bc:     	cmpq	$-0x1, 0xe0(%rbp)
14008b6c4:     	je	0x14008b7ba <.text+0x8a7ba>
14008b6ca:     	leaq	0xe0(%rbp), %rdx
14008b6d1:     	movb	0x118(%rbp), %bl
14008b6d7:     	movb	0x119(%rbp), %dil
14008b6de:     	movb	0x11a(%rbp), %r14b
14008b6e5:     	leaq	0x1d8(%rbp), %rcx
14008b6ec:     	callq	0x14570c440 <.text+0x570b440>
14008b6f1:     	nop
14008b6f2:     	leaq	0xf8(%rbp), %rdx
14008b6f9:     	leaq	0x160(%rbp), %rcx
14008b700:     	callq	0x14570c440 <.text+0x570b440>
14008b705:     	nop
14008b706:     	movzbl	0x11f(%rbp), %eax
14008b70d:     	movb	%al, 0x22f(%rbp)
14008b713:     	movl	0x11b(%rbp), %eax
14008b719:     	movl	%eax, 0x22b(%rbp)
14008b71f:     	movq	0x110(%rbp), %rax
14008b726:     	movups	0x1d8(%rbp), %xmm0
14008b72d:     	movaps	%xmm0, 0x1a0(%rbp)
14008b734:     	movq	0x1e8(%rbp), %rcx
14008b73b:     	movq	%rcx, 0x1b0(%rbp)
14008b742:     	movq	0x170(%rbp), %rcx
14008b749:     	movq	%rcx, 0x1c8(%rbp)
14008b750:     	movups	0x160(%rbp), %xmm1
14008b757:     	movups	%xmm1, 0x1b8(%rbp)
14008b75e:     	movaps	%xmm0, 0x1f0(%rbp)
14008b765:     	movq	0x1b0(%rbp), %rcx
14008b76c:     	movq	%rcx, 0x200(%rbp)
14008b773:     	movq	0x1b8(%rbp), %rcx
14008b77a:     	movq	%rcx, 0x208(%rbp)
14008b781:     	movq	0x1c0(%rbp), %rcx
14008b788:     	movq	%rcx, 0x210(%rbp)
14008b78f:     	movq	0x1c8(%rbp), %rcx
14008b796:     	movq	%rcx, 0x218(%rbp)
14008b79d:     	movq	%rax, 0x220(%rbp)
14008b7a4:     	movb	%bl, 0x228(%rbp)
14008b7aa:     	movb	%dil, 0x229(%rbp)
14008b7b1:     	movb	%r14b, 0x22a(%rbp)
14008b7b8:     	jmp	0x14008b7c7 <.text+0x8a7c7>
14008b7ba:     	leaq	0x1f0(%rbp), %rcx
14008b7c1:     	callq	0x145428ae0 <.text+0x5427ae0>
14008b7c6:     	nop
14008b7c7:     	leaq	0x160(%rbp), %rcx
14008b7ce:     	leaq	0x1f0(%rbp), %rdx
14008b7d5:     	callq	0x145427b30 <.text+0x5426b30>
14008b7da:     	nop
14008b7db:     	leaq	0x1f0(%rbp), %rcx
14008b7e2:     	leaq	-0x58(%rbp), %rdx
14008b7e6:     	leaq	0x160(%rbp), %r8
14008b7ed:     	callq	0x14541d7f0 <.text+0x541c7f0>
14008b7f2:     	nop
14008b7f3:     	cmpq	$0x4, 0x200(%rbp)
14008b7fb:     	jne	0x14008b84f <.text+0x8a84f>
14008b7fd:     	movq	0x1f8(%rbp), %rdi
14008b804:     	cmpl	$0x6f726548, (%rdi)     # imm = 0x6F726548
14008b80a:     	jne	0x14008b84f <.text+0x8a84f>
14008b80c:     	leaq	0x160(%rbp), %rcx
14008b813:     	callq	0x14008e4e0 <.text+0x8d4e0>
14008b818:     	nop
14008b819:     	movq	0x1f0(%rbp), %rdx
14008b820:     	testq	%rdx, %rdx
14008b823:     	je	0x14008b833 <.text+0x8a833>
14008b825:     	movl	$0x1, %r8d
14008b82b:     	movq	%rdi, %rcx
14008b82e:     	callq	0x1400021d0 <.text+0x11d0>
14008b833:     	movq	0x170(%rbp), %rax
14008b83a:     	movq	%rax, 0x200(%rbp)
14008b841:     	movups	0x160(%rbp), %xmm0
14008b848:     	movaps	%xmm0, 0x1f0(%rbp)
14008b84f:     	movaps	0x1f0(%rbp), %xmm0
14008b856:     	movq	0x200(%rbp), %rax
14008b85d:     	movq	0x208(%rbp), %rcx
14008b864:     	movaps	0x210(%rbp), %xmm1
14008b86b:     	movaps	0x220(%rbp), %xmm2
14008b872:     	movups	%xmm2, 0x30(%rsi)
14008b876:     	movups	%xmm1, 0x20(%rsi)
14008b87a:     	movq	%rax, 0x10(%rsi)
14008b87e:     	movq	%rcx, 0x18(%rsi)
14008b882:     	movups	%xmm0, (%rsi)
14008b885:     	leaq	-0x58(%rbp), %rcx
14008b889:     	callq	0x140088730 <.text+0x87730>
14008b88e:     	movq	%rsi, %rax
14008b891:     	addq	$0x2c0, %rsp            # imm = 0x2C0
14008b898:     	popq	%rbx
14008b899:     	popq	%rdi
14008b89a:     	popq	%rsi
14008b89b:     	popq	%r14
14008b89d:     	popq	%rbp
14008b89e:     	retq

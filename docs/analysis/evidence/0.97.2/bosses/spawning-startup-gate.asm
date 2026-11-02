
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b07c0:     	pushq	%rbp
1454b07c1:     	pushq	%r15
1454b07c3:     	pushq	%r14
1454b07c5:     	pushq	%r13
1454b07c7:     	pushq	%r12
1454b07c9:     	pushq	%rsi
1454b07ca:     	pushq	%rdi
1454b07cb:     	pushq	%rbx
1454b07cc:     	subq	$0x2a8, %rsp            # imm = 0x2A8
1454b07d3:     	leaq	0x80(%rsp), %rbp
1454b07db:     	movaps	%xmm15, 0x210(%rbp)
1454b07e3:     	movaps	%xmm14, 0x200(%rbp)
1454b07eb:     	movaps	%xmm13, 0x1f0(%rbp)
1454b07f3:     	movaps	%xmm12, 0x1e0(%rbp)
1454b07fb:     	movaps	%xmm11, 0x1d0(%rbp)
1454b0803:     	movaps	%xmm10, 0x1c0(%rbp)
1454b080b:     	movaps	%xmm9, 0x1b0(%rbp)
1454b0813:     	movaps	%xmm8, 0x1a0(%rbp)
1454b081b:     	movaps	%xmm7, 0x190(%rbp)
1454b0822:     	movaps	%xmm6, 0x180(%rbp)
1454b0829:     	movq	$-0x2, 0x178(%rbp)
1454b0834:     	movq	%rcx, %r12
1454b0837:     	movb	$0x1, 0x95f(%rcx)
1454b083e:     	xorl	%ecx, %ecx
1454b0840:     	callq	0x14545cd00 <.text+0x545bd00>
1454b0845:     	cmpb	$0x0, 0x958(%r12)
1454b084e:     	movq	%r12, 0x120(%rbp)

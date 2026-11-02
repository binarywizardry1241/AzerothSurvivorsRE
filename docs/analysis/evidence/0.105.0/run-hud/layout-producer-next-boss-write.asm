
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458fd54c:     	movq	0x118(%rbp), %rcx
1458fd553:     	movq	0x120(%rbp), %rdx
1458fd55a:     	movaps	0x140(%rbp), %xmm0
1458fd561:     	movaps	0x150(%rbp), %xmm1
1458fd568:     	movaps	%xmm1, 0x50(%rbp)
1458fd56c:     	xorps	%xmm1, %xmm1
1458fd56f:     	ucomiss	%xmm1, %xmm7
1458fd572:     	movaps	%xmm0, 0x40(%rbp)
1458fd576:     	seta	%al
1458fd579:     	testb	%al, 0xef(%rbp)
1458fd57f:     	je	0x1458fd5d1 <.text+0x58fc5d1>
1458fd581:     	movq	%rcx, 0x138(%rbp)
1458fd588:     	movq	%rdx, 0x130(%rbp)
1458fd58f:     	movb	$0x0, 0x177(%rbp)
1458fd596:     	movb	$0x0, 0x176(%rbp)
1458fd59d:     	movb	$0x0, 0x175(%rbp)
1458fd5a4:     	movb	$0x0, 0x174(%rbp)
1458fd5ab:     	movss	%xmm7, 0x20(%rsp)
1458fd5b1:     	leaq	0x157be6e(%rip), %r8    # 0x146e79426
1458fd5b8:     	leaq	0x140(%rbp), %rcx
1458fd5bf:     	leaq	0x40(%rbp), %rdx
1458fd5c3:     	movl	$0x8, %r9d
1458fd5c9:     	callq	0x1458d6ca0 <.text+0x58d5ca0>
1458fd5ce:     	nop
1458fd5cf:     	jmp	0x1458fd623 <.text+0x58fc623>
1458fd5d1:     	leaq	0x157be4e(%rip), %rdx   # 0x146e79426
1458fd5d8:     	leaq	0x40(%rbp), %rcx
1458fd5dc:     	movl	$0x8, %r8d
1458fd5e2:     	callq	0x1458d9500 <.text+0x58d8500>
1458fd5e7:     	nop
1458fd5e8:     	movq	0x40(%rbp), %rax
1458fd5ec:     	movq	0x50(%rbp), %rdx
1458fd5f0:     	subq	%rdx, %rax
1458fd5f3:     	cmpq	$0x3, %rax
1458fd5f7:     	jbe	0x1458fd86b <.text+0x58fc86b>
1458fd5fd:     	movq	0x48(%rbp), %rax
1458fd601:     	movl	$0x6c6c756e, (%rax,%rdx) # imm = 0x6C6C756E
1458fd608:     	addq	$0x4, 0x50(%rbp)
1458fd60d:     	movaps	0x40(%rbp), %xmm0
1458fd611:     	movaps	%xmm0, 0x140(%rbp)
1458fd618:     	movaps	0x50(%rbp), %xmm0
1458fd61c:     	movaps	%xmm0, 0x150(%rbp)

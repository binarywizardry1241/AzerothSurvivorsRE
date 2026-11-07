
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453f66f0:     	pushq	%r15
1453f66f2:     	pushq	%r14
1453f66f4:     	pushq	%r13
1453f66f6:     	pushq	%r12
1453f66f8:     	pushq	%rsi
1453f66f9:     	pushq	%rdi
1453f66fa:     	pushq	%rbp
1453f66fb:     	pushq	%rbx
1453f66fc:     	subq	$0x78, %rsp
1453f6700:     	movaps	%xmm9, 0x60(%rsp)
1453f6706:     	movaps	%xmm8, 0x50(%rsp)
1453f670c:     	movaps	%xmm7, 0x40(%rsp)
1453f6711:     	movaps	%xmm6, 0x30(%rsp)
1453f6716:     	cmpb	$0x0, 0x5c(%rcx)
1453f671a:     	je	0x1453f672b <.text+0x53f572b>
1453f671c:     	movss	0x58(%rcx), %xmm0
1453f6721:     	movl	$0x1, %esi
1453f6726:     	jmp	0x1453f68d9 <.text+0x53f58d9>
1453f672b:     	movq	0x10(%rcx), %rbx
1453f672f:     	movq	0x28(%rcx), %rax
1453f6733:     	cmpq	%rbx, %rax
1453f6736:     	cmovbq	%rax, %rbx
1453f673a:     	xorl	%esi, %esi
1453f673c:     	testq	%rbx, %rbx
1453f673f:     	je	0x1453f68d9 <.text+0x53f58d9>
1453f6745:     	movaps	%xmm2, %xmm6
1453f6748:     	movaps	%xmm1, %xmm7
1453f674b:     	movq	0x8(%rcx), %r14
1453f674f:     	movq	0x20(%rcx), %r15
1453f6753:     	movaps	%xmm1, %xmm8
1453f6757:     	unpcklps	%xmm2, %xmm8            # xmm8 = xmm8[0],xmm2[0],xmm8[1],xmm2[1]
1453f675b:     	xorps	%xmm9, %xmm9
1453f675f:     	addps	%xmm8, %xmm9
1453f6763:     	leaq	0xc(%r15), %r12
1453f6767:     	leaq	0x10(%r14), %r13
1453f676b:     	leaq	0x20(%rsp), %rdi
1453f6770:     	movq	%rbx, %rbp
1453f6773:     	jmp	0x1453f678d <.text+0x53f578d>
1453f6775:     	nopw	%cs:(%rax,%rax)
1453f6780:     	addq	$0x10, %r12
1453f6784:     	addq	$0x48, %r13
1453f6788:     	decq	%rbp
1453f678b:     	je	0x1453f67db <.text+0x53f57db>
1453f678d:     	ucomiss	-0xc(%r12), %xmm7
1453f6793:     	jb	0x1453f6780 <.text+0x53f5780>
1453f6795:     	ucomiss	-0x8(%r12), %xmm6
1453f679b:     	jb	0x1453f6780 <.text+0x53f5780>
1453f679d:     	movss	-0x4(%r12), %xmm0
1453f67a4:     	ucomiss	%xmm7, %xmm0
1453f67a7:     	jb	0x1453f6780 <.text+0x53f5780>
1453f67a9:     	movss	(%r12), %xmm0
1453f67af:     	ucomiss	%xmm6, %xmm0
1453f67b2:     	jb	0x1453f6780 <.text+0x53f5780>
1453f67b4:     	movq	-0x8(%r13), %rcx
1453f67b8:     	movq	(%r13), %rdx
1453f67bc:     	movlps	%xmm9, 0x20(%rsp)
1453f67c2:     	movl	$0x0, 0x28(%rsp)
1453f67ca:     	movq	%rdi, %r8
1453f67cd:     	callq	0x145616ec0 <.text+0x5615ec0>
1453f67d2:     	testb	$0x1, %al
1453f67d4:     	je	0x1453f6780 <.text+0x53f5780>
1453f67d6:     	jmp	0x1453f68d2 <.text+0x53f58d2>
1453f67db:     	movaps	0x12e3c5e(%rip), %xmm6  # 0x1466da440
1453f67e2:     	addps	%xmm8, %xmm6
1453f67e6:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
1453f67ea:     	leaq	0xc(%r15), %r12
1453f67ee:     	leaq	0x10(%r14), %r13
1453f67f2:     	leaq	0x20(%rsp), %rdi
1453f67f7:     	movq	%rbx, %rbp
1453f67fa:     	jmp	0x1453f680d <.text+0x53f580d>
1453f67fc:     	nopl	(%rax)
1453f6800:     	addq	$0x10, %r12
1453f6804:     	addq	$0x48, %r13
1453f6808:     	decq	%rbp
1453f680b:     	je	0x1453f6857 <.text+0x53f5857>
1453f680d:     	ucomiss	-0xc(%r12), %xmm6
1453f6813:     	jb	0x1453f6800 <.text+0x53f5800>
1453f6815:     	ucomiss	-0x8(%r12), %xmm7
1453f681b:     	jb	0x1453f6800 <.text+0x53f5800>
1453f681d:     	movss	-0x4(%r12), %xmm0
1453f6824:     	ucomiss	%xmm6, %xmm0
1453f6827:     	jb	0x1453f6800 <.text+0x53f5800>
1453f6829:     	movss	(%r12), %xmm0
1453f682f:     	ucomiss	%xmm7, %xmm0
1453f6832:     	jb	0x1453f6800 <.text+0x53f5800>
1453f6834:     	movq	-0x8(%r13), %rcx
1453f6838:     	movq	(%r13), %rdx
1453f683c:     	movlps	%xmm6, 0x20(%rsp)
1453f6841:     	movl	$0x0, 0x28(%rsp)
1453f6849:     	movq	%rdi, %r8
1453f684c:     	callq	0x145616ec0 <.text+0x5615ec0>
1453f6851:     	testb	$0x1, %al
1453f6853:     	je	0x1453f6800 <.text+0x53f5800>
1453f6855:     	jmp	0x1453f68d2 <.text+0x53f58d2>
1453f6857:     	addps	0x12e3bf1(%rip), %xmm8  # 0x1466da450
1453f685f:     	movshdup	%xmm8, %xmm6            # xmm6 = xmm8[1,1,3,3]
1453f6864:     	addq	$0xc, %r15
1453f6868:     	addq	$0x10, %r14
1453f686c:     	leaq	0x20(%rsp), %rdi
1453f6871:     	jmp	0x1453f688d <.text+0x53f588d>
1453f6873:     	nopw	%cs:(%rax,%rax)
1453f6880:     	addq	$0x10, %r15
1453f6884:     	addq	$0x48, %r14
1453f6888:     	decq	%rbx
1453f688b:     	je	0x1453f68d9 <.text+0x53f58d9>
1453f688d:     	ucomiss	-0xc(%r15), %xmm8
1453f6892:     	jb	0x1453f6880 <.text+0x53f5880>
1453f6894:     	ucomiss	-0x8(%r15), %xmm6
1453f6899:     	jb	0x1453f6880 <.text+0x53f5880>
1453f689b:     	movss	-0x4(%r15), %xmm0
1453f68a1:     	ucomiss	%xmm8, %xmm0
1453f68a5:     	jb	0x1453f6880 <.text+0x53f5880>
1453f68a7:     	movss	(%r15), %xmm0
1453f68ac:     	ucomiss	%xmm6, %xmm0
1453f68af:     	jb	0x1453f6880 <.text+0x53f5880>
1453f68b1:     	movq	-0x8(%r14), %rcx
1453f68b5:     	movq	(%r14), %rdx
1453f68b8:     	movlps	%xmm8, 0x20(%rsp)
1453f68be:     	movl	$0x0, 0x28(%rsp)
1453f68c6:     	movq	%rdi, %r8
1453f68c9:     	callq	0x145616ec0 <.text+0x5615ec0>
1453f68ce:     	testb	$0x1, %al
1453f68d0:     	je	0x1453f6880 <.text+0x53f5880>
1453f68d2:     	movl	$0x1, %esi
1453f68d7:     	jmp	0x1453f68d9 <.text+0x53f58d9>
1453f68d9:     	movl	%esi, %eax
1453f68db:     	movaps	0x30(%rsp), %xmm6
1453f68e0:     	movaps	0x40(%rsp), %xmm7
1453f68e5:     	movaps	0x50(%rsp), %xmm8
1453f68eb:     	movaps	0x60(%rsp), %xmm9
1453f68f1:     	addq	$0x78, %rsp
1453f68f5:     	popq	%rbx
1453f68f6:     	popq	%rbp
1453f68f7:     	popq	%rdi
1453f68f8:     	popq	%rsi
1453f68f9:     	popq	%r12
1453f68fb:     	popq	%r13
1453f68fd:     	popq	%r14
1453f68ff:     	popq	%r15
1453f6901:     	retq

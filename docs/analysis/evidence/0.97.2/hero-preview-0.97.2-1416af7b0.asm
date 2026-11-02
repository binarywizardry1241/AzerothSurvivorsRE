
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1416af7b0:     	pushq	%rsi
1416af7b1:     	subq	$0xe0, %rsp
1416af7b8:     	movaps	%xmm7, 0xd0(%rsp)
1416af7c0:     	movaps	%xmm6, 0xc0(%rsp)
1416af7c8:     	movq	%rcx, %rsi
1416af7cb:     	movss	0x8(%rdx), %xmm6
1416af7d0:     	movsd	(%rdx), %xmm7
1416af7d4:     	movsd	%xmm7, (%rcx)
1416af7d8:     	movss	%xmm6, 0x8(%rcx)
1416af7dd:     	movl	$0x3f800000, 0xc(%rcx)  # imm = 0x3F800000
1416af7e4:     	movss	0x8(%r8), %xmm0
1416af7ea:     	movsd	(%r8), %xmm1
1416af7ef:     	movsd	%xmm1, 0x10(%rcx)
1416af7f4:     	movss	%xmm0, 0x18(%rcx)
1416af7f9:     	movl	$0x3f800000, 0x1c(%rcx) # imm = 0x3F800000
1416af800:     	movss	0x8(%r9), %xmm0
1416af806:     	movsd	(%r9), %xmm1
1416af80b:     	movsd	%xmm1, 0x20(%rcx)
1416af810:     	movss	%xmm0, 0x28(%rcx)
1416af815:     	movl	$0x3f800000, 0x2c(%rcx) # imm = 0x3F800000
1416af81c:     	movl	$0x0, 0x30(%rsp)
1416af824:     	movq	$0x0, 0x28(%rsp)
1416af82d:     	movaps	0x424971c(%rip), %xmm2  # 0x1458f8f50
1416af834:     	xorps	%xmm2, %xmm0
1416af837:     	xorps	%xmm2, %xmm1
1416af83a:     	movlps	%xmm1, 0x38(%rsp)
1416af83f:     	movss	%xmm0, 0x40(%rsp)
1416af845:     	movq	(%r8), %rax
1416af848:     	movq	%rax, 0x44(%rsp)
1416af84d:     	movl	0x8(%r8), %eax
1416af851:     	movl	%eax, 0x4c(%rsp)
1416af855:     	leaq	0x50(%rsp), %rcx
1416af85a:     	leaq	0x28(%rsp), %rdx
1416af85f:     	leaq	0x38(%rsp), %r8
1416af864:     	movl	$0x1, %r9d
1416af86a:     	callq	0x1416af950 <.text+0x16ae950>
1416af86f:     	movl	0x58(%rsp), %eax
1416af873:     	movl	%eax, 0x68(%rsi)
1416af876:     	movq	0x50(%rsp), %rax
1416af87b:     	movq	%rax, 0x60(%rsi)
1416af87f:     	movl	0x68(%rsp), %eax
1416af883:     	movl	%eax, 0x78(%rsi)
1416af886:     	movq	0x60(%rsp), %rax
1416af88b:     	movq	%rax, 0x70(%rsi)
1416af88f:     	movl	0x78(%rsp), %eax
1416af893:     	movl	%eax, 0x88(%rsi)
1416af899:     	movq	0x70(%rsp), %rax
1416af89e:     	movq	%rax, 0x80(%rsi)
1416af8a5:     	movaps	0x80(%rsp), %xmm0
1416af8ad:     	movups	%xmm0, 0x90(%rsi)
1416af8b4:     	movaps	0x90(%rsp), %xmm0
1416af8bc:     	movups	%xmm0, 0xa0(%rsi)
1416af8c3:     	movaps	0xa0(%rsp), %xmm0
1416af8cb:     	movups	%xmm0, 0xb0(%rsi)
1416af8d2:     	movss	%xmm7, 0x6c(%rsi)
1416af8d7:     	movshdup	%xmm7, %xmm0            # xmm0 = xmm7[1,1,3,3]
1416af8db:     	movss	%xmm0, 0x7c(%rsi)
1416af8e0:     	movss	%xmm6, 0x8c(%rsi)
1416af8e8:     	movsd	0xb0(%rsp), %xmm0
1416af8f1:     	movsd	%xmm0, 0xc0(%rsi)
1416af8f9:     	movss	0xb8(%rsp), %xmm0
1416af902:     	movss	%xmm0, 0xc8(%rsi)
1416af90a:     	movss	0x5c(%rsp), %xmm0
1416af910:     	movss	%xmm0, 0x114(%rsi)
1416af918:     	movss	0x6c(%rsp), %xmm0
1416af91e:     	movss	%xmm0, 0x118(%rsi)
1416af926:     	movss	0x7c(%rsp), %xmm0
1416af92c:     	movss	%xmm0, 0x11c(%rsi)
1416af934:     	movaps	0xc0(%rsp), %xmm6
1416af93c:     	movaps	0xd0(%rsp), %xmm7
1416af944:     	addq	$0xe0, %rsp
1416af94b:     	popq	%rsi
1416af94c:     	retq

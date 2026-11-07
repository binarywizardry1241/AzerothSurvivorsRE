
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d68b0:     	pushq	%rsi
1454d68b1:     	pushq	%rdi
1454d68b2:     	subq	$0x58, %rsp
1454d68b6:     	movaps	%xmm8, 0x40(%rsp)
1454d68bc:     	movaps	%xmm7, 0x30(%rsp)
1454d68c1:     	movaps	%xmm6, 0x20(%rsp)
1454d68c6:     	movq	0x2a0(%rcx), %rax
1454d68cd:     	testq	%rax, %rax
1454d68d0:     	je	0x1454d69d7 <.text+0x54d59d7>
1454d68d6:     	movq	0x298(%rcx), %rdx
1454d68dd:     	imulq	$0x58, %rax, %r9
1454d68e1:     	xorl	%r8d, %r8d
1454d68e4:     	movabsq	$0x7269665f6c756f73, %r11 # imm = 0x7269665F6C756F73
1454d68ee:     	jmp	0x1454d68fd <.text+0x54d58fd>
1454d68f0:     	addq	$0x58, %r8
1454d68f4:     	cmpq	%r8, %r9
1454d68f7:     	je	0x1454d69d7 <.text+0x54d59d7>
1454d68fd:     	movq	(%rdx,%r8), %r10
1454d6901:     	cmpq	$0x9, 0x8(%r10)
1454d6906:     	jne	0x1454d68f0 <.text+0x54d58f0>
1454d6908:     	movq	(%r10), %rax
1454d690b:     	movq	(%rax), %rsi
1454d690e:     	xorq	%r11, %rsi
1454d6911:     	movzbl	0x8(%rax), %edi
1454d6915:     	xorq	$0x65, %rdi
1454d6919:     	orq	%rsi, %rdi
1454d691c:     	jne	0x1454d68f0 <.text+0x54d58f0>
1454d691e:     	movl	0x7d8(%rcx), %edi
1454d6924:     	cmpl	$0x4, %edi
1454d6927:     	ja	0x1454d69d7 <.text+0x54d59d7>
1454d692d:     	movss	0x8e4(%rcx), %xmm6
1454d6935:     	movss	0x7dc(%rcx), %xmm0
1454d693d:     	ucomiss	%xmm6, %xmm0
1454d6940:     	ja	0x1454d69d7 <.text+0x54d59d7>
1454d6946:     	movss	0x50(%rdx,%r8), %xmm7
1454d694d:     	movss	0x48(%r10), %xmm8
1454d6953:     	mulss	0x4223e4(%rip), %xmm8   # 0x1458f8d40
1454d695c:     	mulss	0x14(%rdx,%r8), %xmm8
1454d6963:     	mulss	0x3c(%rdx,%r8), %xmm8
1454d696a:     	mulss	0x460(%rcx), %xmm8
1454d6973:     	maxss	0x416694(%rip), %xmm8   # 0x1458ed010
1454d697c:     	movl	$0x9, %edx
1454d6981:     	movq	%rcx, %rsi
1454d6984:     	movq	%rax, %rcx
1454d6987:     	callq	0x14541b8b0 <.text+0x541a8b0>
1454d698c:     	maxss	%xmm8, %xmm0
1454d6991:     	maxss	0x41fc87(%rip), %xmm7   # 0x1458f6620
1454d6999:     	divss	%xmm7, %xmm0
1454d699d:     	incl	%edi
1454d699f:     	divss	0x42243d(%rip), %xmm0   # 0x1458f8de4
1454d69a7:     	movl	%edi, 0x7d8(%rsi)
1454d69ad:     	addss	%xmm0, %xmm6
1454d69b1:     	movss	%xmm6, 0x7dc(%rsi)
1454d69b9:     	movq	%rsi, %rcx
1454d69bc:     	movaps	0x20(%rsp), %xmm6
1454d69c1:     	movaps	0x30(%rsp), %xmm7
1454d69c6:     	movaps	0x40(%rsp), %xmm8
1454d69cc:     	addq	$0x58, %rsp
1454d69d0:     	popq	%rdi
1454d69d1:     	popq	%rsi
1454d69d2:     	jmp	0x1454d5bd0 <.text+0x54d4bd0>
1454d69d7:     	movaps	0x20(%rsp), %xmm6
1454d69dc:     	movaps	0x30(%rsp), %xmm7
1454d69e1:     	movaps	0x40(%rsp), %xmm8
1454d69e7:     	addq	$0x58, %rsp
1454d69eb:     	popq	%rdi
1454d69ec:     	popq	%rsi
1454d69ed:     	retq

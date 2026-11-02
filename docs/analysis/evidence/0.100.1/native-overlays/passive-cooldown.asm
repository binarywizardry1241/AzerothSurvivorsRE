
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454537e0:     	pushq	%rsi
1454537e1:     	subq	$0x30, %rsp
1454537e5:     	movaps	%xmm6, 0x20(%rsp)
1454537ea:     	movq	%rdx, %r8
1454537ed:     	movq	(%rcx), %r9
1454537f0:     	movq	(%r9), %rax
1454537f3:     	movq	0x8(%r9), %rdx
1454537f7:     	cmpq	$0xb, %rdx
1454537fb:     	je	0x145453877 <.text+0x5452877>
1454537fd:     	cmpq	$0xa, %rdx
145453801:     	jne	0x145453821 <.text+0x5452821>
145453803:     	movabsq	$0x6974706d65646572, %r10 # imm = 0x6974706D65646572
14545380d:     	xorq	(%rax), %r10
145453810:     	movzwl	0x8(%rax), %r11d
145453815:     	xorq	$0x6e6f, %r11           # imm = 0x6E6F
14545381c:     	orq	%r10, %r11
14545381f:     	je	0x145453897 <.text+0x5452897>
145453821:     	movss	0x48(%r9), %xmm6
145453827:     	mulss	0x4c4ec1(%rip), %xmm6   # 0x1459186f0
14545382f:     	mulss	0x14(%rcx), %xmm6
145453834:     	mulss	0x3c(%rcx), %xmm6
145453839:     	mulss	0x8(%r8), %xmm6
14545383f:     	maxss	0x4b5d99(%rip), %xmm6   # 0x1459095e0
145453847:     	movq	%rcx, %rsi
14545384a:     	movq	%rax, %rcx
14545384d:     	callq	0x1454536c0 <.text+0x54526c0>
145453852:     	maxss	%xmm6, %xmm0
145453856:     	movss	0x50(%rsi), %xmm1
14545385b:     	maxss	0x4bfa8d(%rip), %xmm1   # 0x1459132f0
145453863:     	divss	%xmm1, %xmm0
145453867:     	movl	$0x1, %eax
14545386c:     	movaps	0x20(%rsp), %xmm6
145453871:     	addq	$0x30, %rsp
145453875:     	popq	%rsi
145453876:     	retq
145453877:     	movabsq	$0x665f656972656166, %r10 # imm = 0x665F656972656166
145453881:     	xorq	(%rax), %r10
145453884:     	movabsq	$0x657269665f656972, %r11 # imm = 0x657269665F656972
14545388e:     	xorq	0x3(%rax), %r11
145453892:     	orq	%r10, %r11
145453895:     	jne	0x145453821 <.text+0x5452821>
145453897:     	xorl	%eax, %eax
145453899:     	movaps	0x20(%rsp), %xmm6
14545389e:     	addq	$0x30, %rsp
1454538a2:     	popq	%rsi
1454538a3:     	retq

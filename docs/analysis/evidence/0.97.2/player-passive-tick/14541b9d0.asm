
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14541b9d0:     	pushq	%rsi
14541b9d1:     	subq	$0x30, %rsp
14541b9d5:     	movaps	%xmm6, 0x20(%rsp)
14541b9da:     	movq	%rdx, %r8
14541b9dd:     	movq	(%rcx), %r9
14541b9e0:     	movq	(%r9), %rax
14541b9e3:     	movq	0x8(%r9), %rdx
14541b9e7:     	cmpq	$0xb, %rdx
14541b9eb:     	je	0x14541ba67 <.text+0x541aa67>
14541b9ed:     	cmpq	$0xa, %rdx
14541b9f1:     	jne	0x14541ba11 <.text+0x541aa11>
14541b9f3:     	movabsq	$0x6974706d65646572, %r10 # imm = 0x6974706D65646572
14541b9fd:     	xorq	(%rax), %r10
14541ba00:     	movzwl	0x8(%rax), %r11d
14541ba05:     	xorq	$0x6e6f, %r11           # imm = 0x6E6F
14541ba0c:     	orq	%r10, %r11
14541ba0f:     	je	0x14541ba87 <.text+0x541aa87>
14541ba11:     	movss	0x48(%r9), %xmm6
14541ba17:     	mulss	0x4dd321(%rip), %xmm6   # 0x1458f8d40
14541ba1f:     	mulss	0x14(%rcx), %xmm6
14541ba24:     	mulss	0x3c(%rcx), %xmm6
14541ba29:     	mulss	0x8(%r8), %xmm6
14541ba2f:     	maxss	0x4d15d9(%rip), %xmm6   # 0x1458ed010
14541ba37:     	movq	%rcx, %rsi
14541ba3a:     	movq	%rax, %rcx
14541ba3d:     	callq	0x14541b8b0 <.text+0x541a8b0>
14541ba42:     	maxss	%xmm6, %xmm0
14541ba46:     	movss	0x50(%rsi), %xmm1
14541ba4b:     	maxss	0x4dabcd(%rip), %xmm1   # 0x1458f6620
14541ba53:     	divss	%xmm1, %xmm0
14541ba57:     	movl	$0x1, %eax
14541ba5c:     	movaps	0x20(%rsp), %xmm6
14541ba61:     	addq	$0x30, %rsp
14541ba65:     	popq	%rsi
14541ba66:     	retq
14541ba67:     	movabsq	$0x665f656972656166, %r10 # imm = 0x665F656972656166
14541ba71:     	xorq	(%rax), %r10
14541ba74:     	movabsq	$0x657269665f656972, %r11 # imm = 0x657269665F656972
14541ba7e:     	xorq	0x3(%rax), %r11
14541ba82:     	orq	%r10, %r11
14541ba85:     	jne	0x14541ba11 <.text+0x541aa11>
14541ba87:     	xorl	%eax, %eax
14541ba89:     	movaps	0x20(%rsp), %xmm6
14541ba8e:     	addq	$0x30, %rsp
14541ba92:     	popq	%rsi
14541ba93:     	retq

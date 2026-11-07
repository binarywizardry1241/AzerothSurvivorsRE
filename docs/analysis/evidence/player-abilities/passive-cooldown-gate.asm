
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14541b790:     	subq	$0x38, %rsp
14541b794:     	movaps	%xmm6, 0x20(%rsp)
14541b799:     	movq	(%rcx), %r9
14541b79c:     	movq	(%r9), %r8
14541b79f:     	movq	0x8(%r9), %rax
14541b7a3:     	cmpq	$0xb, %rax
14541b7a7:     	je	0x14541b83b <.text+0x541a83b>
14541b7ad:     	cmpq	$0xa, %rax
14541b7b1:     	jne	0x14541b85b <.text+0x541a85b>
14541b7b7:     	movabsq	$0x6974706d65646572, %r10 # imm = 0x6974706D65646572
14541b7c1:     	xorq	(%r8), %r10
14541b7c4:     	movzwl	0x8(%r8), %r11d
14541b7c9:     	xorq	$0x6e6f, %r11           # imm = 0x6E6F
14541b7d0:     	orq	%r10, %r11
14541b7d3:     	jne	0x14541b85b <.text+0x541a85b>
14541b7d9:     	movss	0x48(%r9), %xmm0
14541b7df:     	movss	0x4dae39(%rip), %xmm1   # 0x1458f6620
14541b7e7:     	mulss	%xmm0, %xmm1
14541b7eb:     	movss	0x4dd54d(%rip), %xmm2   # 0x1458f8d40
14541b7f3:     	mulss	%xmm2, %xmm0
14541b7f7:     	mulss	0x14(%rcx), %xmm0
14541b7fc:     	mulss	0x3c(%rcx), %xmm0
14541b801:     	mulss	0x8(%rdx), %xmm0
14541b806:     	maxss	0x4d1802(%rip), %xmm0   # 0x1458ed010
14541b80e:     	mulss	%xmm2, %xmm1
14541b812:     	divss	%xmm0, %xmm1
14541b816:     	minss	0x4cfcee(%rip), %xmm1   # 0x1458eb50c
14541b81e:     	mulss	0x50(%rcx), %xmm1
14541b823:     	movss	0x1301a45(%rip), %xmm0  # 0x14671d270
14541b82b:     	ucomiss	%xmm1, %xmm0
14541b82e:     	seta	%al
14541b831:     	movaps	0x20(%rsp), %xmm6
14541b836:     	addq	$0x38, %rsp
14541b83a:     	retq
14541b83b:     	movabsq	$0x665f656972656166, %r10 # imm = 0x665F656972656166
14541b845:     	xorq	(%r8), %r10
14541b848:     	movabsq	$0x657269665f656972, %r11 # imm = 0x657269665F656972
14541b852:     	xorq	0x3(%r8), %r11
14541b856:     	orq	%r10, %r11
14541b859:     	je	0x14541b8a3 <.text+0x541a8a3>
14541b85b:     	movss	0x48(%r9), %xmm6
14541b861:     	mulss	0x4dd4d7(%rip), %xmm6   # 0x1458f8d40
14541b869:     	mulss	0x14(%rcx), %xmm6
14541b86e:     	mulss	0x3c(%rcx), %xmm6
14541b873:     	mulss	0x8(%rdx), %xmm6
14541b878:     	maxss	0x4d1790(%rip), %xmm6   # 0x1458ed010
14541b880:     	movq	%r8, %rcx
14541b883:     	movq	%rax, %rdx
14541b886:     	callq	0x14541b8b0 <.text+0x541a8b0>
14541b88b:     	mulss	0x13019e1(%rip), %xmm0  # 0x14671d274
14541b893:     	ucomiss	%xmm0, %xmm6
14541b896:     	seta	%al
14541b899:     	movaps	0x20(%rsp), %xmm6
14541b89e:     	addq	$0x38, %rsp
14541b8a2:     	retq
14541b8a3:     	xorl	%eax, %eax
14541b8a5:     	movaps	0x20(%rsp), %xmm6
14541b8aa:     	addq	$0x38, %rsp
14541b8ae:     	retq

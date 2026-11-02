
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145495820:     	pushq	%rbp
145495821:     	pushq	%rsi
145495822:     	pushq	%rdi
145495823:     	subq	$0x30, %rsp
145495827:     	leaq	0x30(%rsp), %rbp
14549582c:     	movq	$-0x2, -0x8(%rbp)
145495834:     	cmpb	$0x1, 0x94e(%rcx)
14549583b:     	jne	0x14549597e <.text+0x549497e>
145495841:     	movq	0x530(%rcx), %r8
145495848:     	testq	%r8, %r8
14549584b:     	je	0x14549597e <.text+0x549497e>
145495851:     	movsd	0x3e8(%rcx), %xmm0
145495859:     	movq	0x528(%rcx), %rax
145495860:     	shlq	$0x3, %r8
145495864:     	leaq	(%r8,%r8,8), %r8
145495868:     	xorl	%esi, %esi
14549586a:     	xorl	%r9d, %r9d
14549586d:     	jmp	0x145495880 <.text+0x5494880>
14549586f:     	nop
145495870:     	incq	%rsi
145495873:     	addq	$0x48, %r9
145495877:     	cmpq	%r9, %r8
14549587a:     	je	0x14549597e <.text+0x549497e>
145495880:     	cmpq	%rdx, 0x28(%rax,%r9)
145495885:     	jne	0x145495870 <.text+0x5494870>
145495887:     	cmpl	$0x2, 0x20(%rax,%r9)
14549588d:     	jne	0x145495870 <.text+0x5494870>
14549588f:     	movsd	0x34(%rax,%r9), %xmm1
145495896:     	subps	%xmm0, %xmm1
145495899:     	mulps	%xmm1, %xmm1
14549589c:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454958a0:     	addss	%xmm1, %xmm0
1454958a4:     	sqrtss	%xmm0, %xmm0
1454958a8:     	ucomiss	0x412d21(%rip), %xmm0   # 0x1458a85d0
1454958af:     	ja	0x14549597e <.text+0x549497e>
1454958b5:     	movq	%rcx, %rdi
1454958b8:     	callq	0x1454a81a0 <.text+0x54a71a0>
1454958bd:     	testb	%al, %al
1454958bf:     	je	0x14549597e <.text+0x549497e>
1454958c5:     	movq	%rdi, %rcx
1454958c8:     	movq	%rsi, %rdx
1454958cb:     	callq	0x1454a5d50 <.text+0x54a4d50>
1454958d0:     	callq	0x140002200 <.text+0x1200>
1454958d5:     	movl	$0x20, %ecx
1454958da:     	movl	$0x1, %edx
1454958df:     	callq	0x1400021c0 <.text+0x11c0>
1454958e4:     	testq	%rax, %rax
1454958e7:     	je	0x145495986 <.text+0x5494986>
1454958ed:     	movq	%rax, -0x10(%rbp)
1454958f1:     	movl	$0x4b4, (%rax)          # imm = 0x4B4
1454958f7:     	movq	%rdi, %rcx
1454958fa:     	movq	0x548(%rdi), %rsi
145495901:     	cmpq	0x538(%rdi), %rsi
145495908:     	jne	0x145495919 <.text+0x5494919>
14549590a:     	addq	$0x538, %rcx            # imm = 0x538
145495911:     	callq	0x145717d60 <.text+0x5716d60>
145495916:     	movq	%rdi, %rcx
145495919:     	movq	0x540(%rcx), %rax
145495920:     	movq	%rsi, %rdx
145495923:     	shlq	$0x5, %rdx
145495927:     	movq	$0x20, (%rax,%rdx)
14549592f:     	movq	-0x10(%rbp), %r8
145495933:     	movq	%r8, 0x8(%rax,%rdx)
145495938:     	movq	$0x4, 0x10(%rax,%rdx)
145495941:     	movw	$0x2d2, 0x18(%rax,%rdx) # imm = 0x2D2
145495948:     	incq	%rsi
14549594b:     	movq	%rsi, 0x548(%rcx)
145495952:     	cmpb	$0x1, 0x94e(%rcx)
145495959:     	jne	0x14549597e <.text+0x549497e>
14549595b:     	cmpl	$0x0, 0x8e0(%rcx)
145495962:     	je	0x14549597e <.text+0x549497e>
145495964:     	cmpb	$0x0, 0x947(%rcx)
14549596b:     	jne	0x14549597e <.text+0x549497e>
14549596d:     	movb	$0x1, %dl
14549596f:     	movb	$0x1, %r8b
145495972:     	addq	$0x30, %rsp
145495976:     	popq	%rdi
145495977:     	popq	%rsi
145495978:     	popq	%rbp
145495979:     	jmp	0x1454af2b0 <.text+0x54ae2b0>
14549597e:     	addq	$0x30, %rsp
145495982:     	popq	%rdi
145495983:     	popq	%rsi
145495984:     	popq	%rbp
145495985:     	retq
145495986:     	movl	$0x1, %ecx
14549598b:     	movl	$0x20, %edx
145495990:     	callq	0x1458a3b8b <.text+0x58a2b8b>
145495995:     	ud2

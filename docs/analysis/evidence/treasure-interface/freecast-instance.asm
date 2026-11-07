
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d08d0:     	pushq	%r15
1454d08d2:     	pushq	%r14
1454d08d4:     	pushq	%r13
1454d08d6:     	pushq	%r12
1454d08d8:     	pushq	%rsi
1454d08d9:     	pushq	%rdi
1454d08da:     	pushq	%rbp
1454d08db:     	pushq	%rbx
1454d08dc:     	subq	$0x38, %rsp
1454d08e0:     	movq	%r8, 0x28(%rsp)
1454d08e5:     	movq	%rdx, %rbx
1454d08e8:     	movq	%rcx, %rsi
1454d08eb:     	movq	0x2b0(%rdx), %r13
1454d08f2:     	movq	0x2b8(%rdx), %rax
1454d08f9:     	movq	%rax, 0x30(%rsp)
1454d08fe:     	testq	%rax, %rax
1454d0901:     	je	0x1454d09a8 <.text+0x54cf9a8>
1454d0907:     	imulq	$0x58, 0x30(%rsp), %r12
1454d090d:     	movq	0x28(%rsp), %rax
1454d0912:     	movq	(%rax), %r14
1454d0915:     	movq	0x8(%rax), %r15
1454d0919:     	xorl	%ebp, %ebp
1454d091b:     	jmp	0x1454d0929 <.text+0x54cf929>
1454d091d:     	nopl	(%rax)
1454d0920:     	addq	$0x58, %rbp
1454d0924:     	cmpq	%rbp, %r12
1454d0927:     	je	0x1454d09a8 <.text+0x54cf9a8>
1454d0929:     	movq	(%r13,%rbp), %rdi
1454d092e:     	cmpq	%r15, 0x8(%rdi)
1454d0932:     	jne	0x1454d0920 <.text+0x54cf920>
1454d0934:     	movq	(%rdi), %rcx
1454d0937:     	movq	%r14, %rdx
1454d093a:     	movq	%r15, %r8
1454d093d:     	callq	0x1457731e7 <.text+0x57721e7>
1454d0942:     	testl	%eax, %eax
1454d0944:     	jne	0x1454d0920 <.text+0x54cf920>
1454d0946:     	movl	0x8(%r13,%rbp), %eax
1454d094b:     	movss	0x14(%r13,%rbp), %xmm0
1454d0952:     	movl	0x18(%r13,%rbp), %ecx
1454d0957:     	movl	0x34(%r13,%rbp), %edx
1454d095c:     	movl	%edx, 0x34(%rsi)
1454d095f:     	movups	0x24(%r13,%rbp), %xmm1
1454d0965:     	movups	%xmm1, 0x24(%rsi)
1454d0969:     	movups	0x38(%r13,%rbp), %xmm1
1454d096f:     	movups	0x44(%r13,%rbp), %xmm2
1454d0975:     	movups	%xmm2, 0x44(%rsi)
1454d0979:     	movups	%xmm1, 0x38(%rsi)
1454d097d:     	movq	%rdi, (%rsi)
1454d0980:     	movl	%eax, 0x8(%rsi)
1454d0983:     	movsd	0xc(%r13,%rbp), %xmm1
1454d098a:     	movsd	%xmm1, 0xc(%rsi)
1454d098f:     	movss	%xmm0, 0x14(%rsi)
1454d0994:     	movl	%ecx, 0x18(%rsi)
1454d0997:     	movsd	0x1c(%r13,%rbp), %xmm0
1454d099e:     	movsd	%xmm0, 0x1c(%rsi)
1454d09a3:     	jmp	0x1454d0ad4 <.text+0x54cfad4>
1454d09a8:     	xorps	%xmm0, %xmm0
1454d09ab:     	movups	%xmm0, 0x24(%rsi)
1454d09af:     	movl	$0x0, 0x34(%rsi)
1454d09b6:     	movq	0x28(%rsp), %r8
1454d09bb:     	movq	%r8, (%rsi)
1454d09be:     	movl	$0x1, 0x8(%rsi)
1454d09c5:     	movsd	0x447d03(%rip), %xmm0   # 0x1459186d0
1454d09cd:     	movsd	%xmm0, 0xc(%rsi)
1454d09d2:     	movq	$0x3f800000, 0x14(%rsi) # imm = 0x3F800000
1454d09da:     	movsd	0x436b6e(%rip), %xmm0   # 0x145907550
1454d09e2:     	movsd	%xmm0, 0x1c(%rsi)
1454d09e7:     	leaq	0x38(%rsi), %rcx
1454d09eb:     	movsd	%xmm0, 0x38(%rsi)
1454d09f0:     	movl	$0x0, 0x40(%rsi)
1454d09f7:     	movaps	0x447ce2(%rip), %xmm0   # 0x1459186e0
1454d09fe:     	movups	%xmm0, 0x44(%rsi)
1454d0a02:     	addq	$0x6d8, %rbx            # imm = 0x6D8
1454d0a09:     	movq	%rbx, %rdx
1454d0a0c:     	callq	0x145451c30 <.text+0x5450c30>
1454d0a11:     	movq	0x30(%rsp), %r9
1454d0a16:     	testq	%r9, %r9
1454d0a19:     	je	0x1454d0ad4 <.text+0x54cfad4>
1454d0a1f:     	movl	%r9d, %eax
1454d0a22:     	andl	$0x3, %eax
1454d0a25:     	cmpq	$0x4, %r9
1454d0a29:     	jae	0x1454d0a37 <.text+0x54cfa37>
1454d0a2b:     	movss	0x442919(%rip), %xmm0   # 0x14591334c
1454d0a33:     	xorl	%ecx, %ecx
1454d0a35:     	jmp	0x1454d0a92 <.text+0x54cfa92>
1454d0a37:     	movabsq	$0x1fffffffffffffc, %rdx # imm = 0x1FFFFFFFFFFFFFC
1454d0a41:     	andq	%r9, %rdx
1454d0a44:     	leaq	0x118(%r13), %r8
1454d0a4b:     	movss	0x4428f9(%rip), %xmm0   # 0x14591334c
1454d0a53:     	xorl	%ecx, %ecx
1454d0a55:     	nopw	%cs:(%rax,%rax)
1454d0a60:     	addss	-0x108(%r8), %xmm0
1454d0a69:     	addss	-0xb0(%r8), %xmm0
1454d0a72:     	addss	-0x58(%r8), %xmm0
1454d0a78:     	addss	(%r8), %xmm0
1454d0a7d:     	addq	$0x4, %rcx
1454d0a81:     	addq	$0x160, %r8             # imm = 0x160
1454d0a88:     	cmpq	%rcx, %rdx
1454d0a8b:     	jne	0x1454d0a60 <.text+0x54cfa60>
1454d0a8d:     	testq	%rax, %rax
1454d0a90:     	je	0x1454d0abe <.text+0x54cfabe>
1454d0a92:     	imulq	$0x58, %rcx, %rcx
1454d0a96:     	addq	%r13, %rcx
1454d0a99:     	addq	$0x10, %rcx
1454d0a9d:     	imulq	$0x58, %rax, %rax
1454d0aa1:     	xorl	%edx, %edx
1454d0aa3:     	nopw	%cs:(%rax,%rax)
1454d0ab0:     	addss	(%rcx,%rdx), %xmm0
1454d0ab5:     	addq	$0x58, %rdx
1454d0ab9:     	cmpq	%rdx, %rax
1454d0abc:     	jne	0x1454d0ab0 <.text+0x54cfab0>
1454d0abe:     	cvtsi2ss	%r9, %xmm1
1454d0ac3:     	divss	%xmm1, %xmm0
1454d0ac7:     	maxss	0x4369c1(%rip), %xmm0   # 0x145907490
1454d0acf:     	movss	%xmm0, 0x10(%rsi)
1454d0ad4:     	addq	$0x38, %rsp
1454d0ad8:     	popq	%rbx
1454d0ad9:     	popq	%rbp
1454d0ada:     	popq	%rdi
1454d0adb:     	popq	%rsi
1454d0adc:     	popq	%r12
1454d0ade:     	popq	%r13
1454d0ae0:     	popq	%r14
1454d0ae2:     	popq	%r15
1454d0ae4:     	retq

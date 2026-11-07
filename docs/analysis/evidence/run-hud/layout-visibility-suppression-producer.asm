
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14003c8a0:     	pushq	%rsi
14003c8a1:     	pushq	%rdi
14003c8a2:     	subq	$0x38, %rsp
14003c8a6:     	movq	%rdx, %rsi
14003c8a9:     	movq	%rdx, %rcx
14003c8ac:     	callq	0x14063cee0 <.text+0x63bee0>
14003c8b1:     	cmpq	$0x0, 0x90(%rsi)
14003c8b9:     	je	0x14003c9b0 <.text+0x3b9b0>
14003c8bf:     	movq	0x78(%rsi), %rcx
14003c8c3:     	movq	0x80(%rsi), %rdx
14003c8ca:     	movabsq	$0x4878caffe80135d0, %r8 # imm = 0x4878CAFFE80135D0
14003c8d4:     	xorl	%r9d, %r9d
14003c8d7:     	movdqa	0x5d310b1(%rip), %xmm0  # 0x145d6d990
14003c8df:     	pcmpeqd	%xmm1, %xmm1
14003c8e3:     	movdqa	0x5d310b5(%rip), %xmm2  # 0x145d6d9a0
14003c8eb:     	andq	%rdx, %r8
14003c8ee:     	movdqu	(%rcx,%r8), %xmm3
14003c8f4:     	movdqa	%xmm3, %xmm4
14003c8f8:     	pcmpeqb	%xmm0, %xmm4
14003c8fc:     	pmovmskb	%xmm4, %r10d
14003c901:     	testl	%r10d, %r10d
14003c904:     	je	0x14003c940 <.text+0x3b940>
14003c906:     	tzcntl	%r10d, %r11d
14003c90b:     	addq	%r8, %r11
14003c90e:     	andq	%rdx, %r11
14003c911:     	negq	%r11
14003c914:     	leaq	(%r11,%r11,2), %r11
14003c918:     	movdqu	-0x18(%rcx,%r11,8), %xmm4
14003c91f:     	pcmpeqb	%xmm2, %xmm4
14003c923:     	pmovmskb	%xmm4, %edi
14003c927:     	cmpl	$0xffff, %edi           # imm = 0xFFFF
14003c92d:     	je	0x14003c95b <.text+0x3b95b>
14003c92f:     	leal	-0x1(%r10), %r11d
14003c933:     	andw	%r10w, %r11w
14003c937:     	movl	%r11d, %r10d
14003c93a:     	jne	0x14003c906 <.text+0x3b906>
14003c93c:     	nopl	(%rax)
14003c940:     	pcmpeqb	%xmm1, %xmm3
14003c944:     	pmovmskb	%xmm3, %r10d
14003c949:     	testl	%r10d, %r10d
14003c94c:     	jne	0x14003c9b0 <.text+0x3b9b0>
14003c94e:     	addq	%r9, %r8
14003c951:     	addq	$0x10, %r8
14003c955:     	addq	$0x10, %r9
14003c959:     	jmp	0x14003c8eb <.text+0x3b8eb>
14003c95b:     	leaq	(%rcx,%r11,8), %rcx
14003c95f:     	movq	-0x8(%rcx), %rcx
14003c963:     	cmpq	0x218(%rsi), %rcx
14003c96a:     	jae	0x14003c9b0 <.text+0x3b9b0>
14003c96c:     	movq	0x210(%rsi), %rdx
14003c973:     	movq	(%rdx,%rcx,8), %rdx
14003c977:     	testq	%rdx, %rdx
14003c97a:     	je	0x14003c9b0 <.text+0x3b9b0>
14003c97c:     	movq	0x1e0(%rsi), %rcx
14003c983:     	notq	%rdx
14003c986:     	imulq	$0x38, %rdx, %rdx
14003c98a:     	cmpb	$0x0, 0x30(%rcx,%rdx)
14003c98f:     	je	0x14003c9b0 <.text+0x3b9b0>
14003c991:     	addq	%rdx, %rcx
14003c994:     	movq	0x10(%rcx), %rdx
14003c998:     	movl	0x5b0(%rsi), %r8d
14003c99f:     	cmpb	(%rdx), %al
14003c9a1:     	je	0x14003c9a9 <.text+0x3b9a9>
14003c9a3:     	movl	%r8d, 0x2c(%rcx)
14003c9a7:     	movb	%al, (%rdx)
14003c9a9:     	addq	$0x38, %rsp
14003c9ad:     	popq	%rdi
14003c9ae:     	popq	%rsi
14003c9af:     	retq

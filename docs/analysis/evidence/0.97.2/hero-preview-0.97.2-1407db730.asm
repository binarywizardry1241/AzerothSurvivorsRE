
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1407db730:     	pushq	%rbp
1407db731:     	pushq	%r15
1407db733:     	pushq	%r14
1407db735:     	pushq	%r13
1407db737:     	pushq	%r12
1407db739:     	pushq	%rsi
1407db73a:     	pushq	%rdi
1407db73b:     	pushq	%rbx
1407db73c:     	subq	$0x688, %rsp            # imm = 0x688
1407db743:     	leaq	0x80(%rsp), %rbp
1407db74b:     	movq	$-0x2, 0x600(%rbp)
1407db756:     	movq	%r9, %rsi
1407db759:     	movq	%r8, %r14
1407db75c:     	movq	%rdx, 0x5d0(%rbp)
1407db763:     	movq	%rcx, %rbx
1407db766:     	movzbl	(%r9), %edi
1407db76a:     	cmpb	$0x1, %dil
1407db76e:     	jne	0x1407db79a <.text+0x7da79a>
1407db770:     	movdqu	0x1(%rsi), %xmm0
1407db775:     	movdqu	%xmm0, 0x1b1(%rbp)
1407db77d:     	movb	$0x1, %r12b
1407db780:     	movb	%r12b, 0x1b0(%rbp)
1407db787:     	movq	0x5d0(%rbp), %rax
1407db78e:     	cmpq	$0x0, 0x18(%rax)
1407db793:     	jne	0x1407db7c5 <.text+0x7da7c5>
1407db795:     	jmp	0x1407db9c6 <.text+0x7da9c6>
1407db79a:     	movq	0x8(%rsi), %rax
1407db79e:     	movq	0x68(%rax), %rax
1407db7a2:     	movq	%rax, 0x1b4(%rbp)
1407db7a9:     	xorl	%r12d, %r12d
1407db7ac:     	movb	%r12b, 0x1b0(%rbp)
1407db7b3:     	movq	0x5d0(%rbp), %rax
1407db7ba:     	cmpq	$0x0, 0x18(%rax)
1407db7bf:     	je	0x1407db9c6 <.text+0x7da9c6>
1407db7c5:     	movq	0x5d0(%rbp), %r15
1407db7cc:     	leaq	0x20(%r15), %rcx
1407db7d0:     	leaq	0x1b0(%rbp), %rdx
1407db7d7:     	callq	0x140bb7cb0 <.text+0xbb6cb0>
1407db7dc:     	movq	%rax, %r8
1407db7df:     	shrq	$0x39, %r8
1407db7e3:     	movq	(%r15), %rcx
1407db7e6:     	movq	0x8(%r15), %rdx
1407db7ea:     	movd	%r8d, %xmm0
1407db7ef:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1407db7f3:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1407db7f8:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
1407db7fd:     	movl	0x1b4(%rbp), %r10d
1407db804:     	movl	0x1b8(%rbp), %r8d
1407db80b:     	testb	%r12b, %r12b
1407db80e:     	je	0x1407db94a <.text+0x7da94a>
1407db814:     	movq	0x1bc(%rbp), %r9
1407db81b:     	shlq	$0x18, %r9
1407db81f:     	movq	%r8, %r11
1407db822:     	shlq	$0x38, %r11
1407db826:     	shrl	$0x8, %r8d
1407db82a:     	orq	%r9, %r8
1407db82d:     	shlq	$0x18, %r10
1407db831:     	orq	%r11, %r10
1407db834:     	movzwl	0x1b1(%rbp), %r11d
1407db83c:     	movzbl	0x1b3(%rbp), %r9d
1407db844:     	shll	$0x10, %r9d
1407db848:     	orq	%r11, %r9
1407db84b:     	orq	%r10, %r9
1407db84e:     	xorl	%r11d, %r11d
1407db851:     	pcmpeqd	%xmm1, %xmm1
1407db855:     	andq	%rdx, %rax
1407db858:     	movdqu	(%rcx,%rax), %xmm2
1407db85d:     	movdqa	%xmm2, %xmm3
1407db861:     	pcmpeqb	%xmm0, %xmm3
1407db865:     	pmovmskb	%xmm3, %r12d
1407db86a:     	testl	%r12d, %r12d
1407db86d:     	je	0x1407db928 <.text+0x7da928>
1407db873:     	movq	%r11, 0x5e0(%rbp)
1407db87a:     	tzcntl	%r12d, %r10d
1407db87f:     	addq	%rax, %r10
1407db882:     	andq	%rdx, %r10
1407db885:     	negq	%r10
1407db888:     	leaq	(%r10,%r10,2), %r11
1407db88c:     	shlq	$0x4, %r11
1407db890:     	cmpb	$0x1, -0x30(%rcx,%r11)
1407db896:     	jne	0x1407db90f <.text+0x7da90f>
1407db898:     	addq	%rcx, %r11
1407db89b:     	movl	-0x2c(%r11), %r13d
1407db89f:     	movl	-0x28(%r11), %r10d
1407db8a3:     	movq	%rsi, 0x5d8(%rbp)
1407db8aa:     	movq	%rdx, %rsi
1407db8ad:     	movq	%r14, %rdx
1407db8b0:     	movzwl	-0x2f(%r11), %r14d
1407db8b5:     	movq	%rbx, 0x5f0(%rbp)
1407db8bc:     	movzbl	-0x2d(%r11), %r15d
1407db8c1:     	shll	$0x10, %r15d
1407db8c5:     	orq	%r14, %r15
1407db8c8:     	movq	-0x24(%r11), %r14
1407db8cc:     	shlq	$0x18, %r14
1407db8d0:     	movl	%edi, %ebx
1407db8d2:     	movq	%r10, %rdi
1407db8d5:     	shlq	$0x38, %rdi
1407db8d9:     	shrl	$0x8, %r10d
1407db8dd:     	orq	%r14, %r10
1407db8e0:     	movq	%rdx, %r14
1407db8e3:     	movq	%rsi, %rdx
1407db8e6:     	movq	0x5d8(%rbp), %rsi
1407db8ed:     	xorq	%r8, %r10
1407db8f0:     	shlq	$0x18, %r13
1407db8f4:     	orq	%rdi, %r13
1407db8f7:     	movl	%ebx, %edi
1407db8f9:     	orq	%r15, %r13
1407db8fc:     	movq	0x5f0(%rbp), %rbx
1407db903:     	xorq	%r9, %r13
1407db906:     	orq	%r10, %r13
1407db909:     	je	0x1407dbb24 <.text+0x7dab24>
1407db90f:     	leal	-0x1(%r12), %r10d
1407db914:     	andw	%r12w, %r10w
1407db918:     	movl	%r10d, %r12d
1407db91b:     	movq	0x5e0(%rbp), %r11
1407db922:     	jne	0x1407db873 <.text+0x7da873>
1407db928:     	pcmpeqb	%xmm1, %xmm2
1407db92c:     	pmovmskb	%xmm2, %r10d
1407db931:     	testl	%r10d, %r10d
1407db934:     	jne	0x1407db9c6 <.text+0x7da9c6>
1407db93a:     	addq	%r11, %rax
1407db93d:     	addq	$0x10, %rax
1407db941:     	addq	$0x10, %r11
1407db945:     	jmp	0x1407db855 <.text+0x7da855>
1407db94a:     	xorl	%r9d, %r9d
1407db94d:     	pcmpeqd	%xmm1, %xmm1
1407db951:     	andq	%rdx, %rax
1407db954:     	movdqu	(%rcx,%rax), %xmm2
1407db959:     	movdqa	%xmm2, %xmm3
1407db95d:     	pcmpeqb	%xmm0, %xmm3
1407db961:     	pmovmskb	%xmm3, %r12d
1407db966:     	testl	%r12d, %r12d
1407db969:     	je	0x1407db9ab <.text+0x7da9ab>
1407db96b:     	tzcntl	%r12d, %r11d
1407db970:     	addq	%rax, %r11
1407db973:     	andq	%rdx, %r11
1407db976:     	negq	%r11
1407db979:     	leaq	(%r11,%r11,2), %r11
1407db97d:     	shlq	$0x4, %r11
1407db981:     	testb	$0x1, -0x30(%rcx,%r11)
1407db987:     	jne	0x1407db99d <.text+0x7da99d>
1407db989:     	cmpl	-0x2c(%rcx,%r11), %r10d
1407db98e:     	jne	0x1407db99d <.text+0x7da99d>
1407db990:     	addq	%rcx, %r11
1407db993:     	cmpl	-0x28(%r11), %r8d
1407db997:     	je	0x1407dbb24 <.text+0x7dab24>
1407db99d:     	leal	-0x1(%r12), %r11d
1407db9a2:     	andw	%r12w, %r11w
1407db9a6:     	movl	%r11d, %r12d
1407db9a9:     	jne	0x1407db96b <.text+0x7da96b>
1407db9ab:     	pcmpeqb	%xmm1, %xmm2
1407db9af:     	pmovmskb	%xmm2, %r11d
1407db9b4:     	testl	%r11d, %r11d
1407db9b7:     	jne	0x1407db9c6 <.text+0x7da9c6>
1407db9b9:     	addq	%r9, %rax
1407db9bc:     	addq	$0x10, %rax
1407db9c0:     	addq	$0x10, %r9
1407db9c4:     	jmp	0x1407db951 <.text+0x7da951>
1407db9c6:     	movq	0x670(%rbp), %r15
1407db9cd:     	testb	%dil, %dil
1407db9d0:     	je	0x1407dbb46 <.text+0x7dab46>
1407db9d6:     	movdqu	0x1(%rsi), %xmm0
1407db9db:     	movdqu	%xmm0, 0x1b1(%rbp)
1407db9e3:     	movb	$0x1, 0x1b0(%rbp)
1407db9ea:     	leaq	0x1b0(%rbp), %rdx
1407db9f1:     	movq	%r15, %rcx
1407db9f4:     	callq	0x1415e7420 <.text+0x15e6420>
1407db9f9:     	cmpq	$0x0, 0x90(%r15)
1407dba01:     	je	0x1407dbb9f <.text+0x7dab9f>
1407dba07:     	movzwl	0x1(%rsi), %eax
1407dba0b:     	movzbl	0x3(%rsi), %edx
1407dba0f:     	shll	$0x10, %edx
1407dba12:     	orq	%rax, %rdx
1407dba15:     	movl	0x4(%rsi), %eax
1407dba18:     	movl	0x8(%rsi), %ecx
1407dba1b:     	movl	0x10(%rsi), %r8d
1407dba1f:     	movl	0xc(%rsi), %r9d
1407dba23:     	shlq	$0x18, %rax
1407dba27:     	orq	%rdx, %rax
1407dba2a:     	movl	%ecx, %edx
1407dba2c:     	shrl	$0x8, %edx
1407dba2f:     	shlq	$0x38, %rcx
1407dba33:     	orq	%rax, %rcx
1407dba36:     	shlq	$0x18, %r9
1407dba3a:     	shlq	$0x38, %r8
1407dba3e:     	orq	%r9, %r8
1407dba41:     	orq	%rdx, %r8
1407dba44:     	movabsq	$-0x210e623f01a31098, %rdx # imm = 0xDEF19DC0FE5CEF68
1407dba4e:     	xorq	%rcx, %rdx
1407dba51:     	movabsq	$0x3f84d5b5b5470917, %rax # imm = 0x3F84D5B5B5470917
1407dba5b:     	xorq	%r8, %rax
1407dba5e:     	mulq	%rdx
1407dba61:     	xorq	%rax, %rdx
1407dba64:     	movq	%rdx, %rax
1407dba67:     	shrq	$0x39, %rax
1407dba6b:     	movq	0x78(%r15), %r9
1407dba6f:     	movq	0x80(%r15), %r10
1407dba76:     	movd	%eax, %xmm0
1407dba7a:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1407dba7e:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1407dba83:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
1407dba88:     	xorl	%r11d, %r11d
1407dba8b:     	pcmpeqd	%xmm1, %xmm1
1407dba8f:     	andq	%r10, %rdx
1407dba92:     	movdqu	(%r9,%rdx), %xmm2
1407dba98:     	movdqa	%xmm2, %xmm3
1407dba9c:     	pcmpeqb	%xmm0, %xmm3
1407dbaa0:     	pmovmskb	%xmm3, %r12d
1407dbaa5:     	testl	%r12d, %r12d
1407dbaa8:     	je	0x1407dbb04 <.text+0x7dab04>
1407dbaaa:     	movq	%r11, 0x5f0(%rbp)
1407dbab1:     	movq	%r14, %r11
1407dbab4:     	movl	%edi, %r13d
1407dbab7:     	tzcntl	%r12d, %edi
1407dbabc:     	addq	%rdx, %rdi
1407dbabf:     	andq	%r10, %rdi
1407dbac2:     	shlq	$0x9, %rdi
1407dbac6:     	movq	%r9, %rax
1407dbac9:     	subq	%rdi, %rax
1407dbacc:     	movq	-0x1f8(%rax), %rdi
1407dbad3:     	xorq	%r8, %rdi
1407dbad6:     	movq	-0x200(%rax), %r14
1407dbadd:     	xorq	%rcx, %r14
1407dbae0:     	orq	%rdi, %r14
1407dbae3:     	je	0x1407dbbdb <.text+0x7dabdb>
1407dbae9:     	leal	-0x1(%r12), %eax
1407dbaee:     	andw	%r12w, %ax
1407dbaf2:     	movl	%eax, %r12d
1407dbaf5:     	movl	%r13d, %edi
1407dbaf8:     	movq	%r11, %r14
1407dbafb:     	movq	0x5f0(%rbp), %r11
1407dbb02:     	jne	0x1407dbab1 <.text+0x7daab1>
1407dbb04:     	pcmpeqb	%xmm1, %xmm2
1407dbb08:     	pmovmskb	%xmm2, %eax
1407dbb0c:     	testl	%eax, %eax
1407dbb0e:     	jne	0x1407dbb9f <.text+0x7dab9f>
1407dbb14:     	addq	%r11, %rdx
1407dbb17:     	addq	$0x10, %rdx
1407dbb1b:     	addq	$0x10, %r11
1407dbb1f:     	jmp	0x1407dba8f <.text+0x7daa8f>
1407dbb24:     	cmpb	$0x0, -0x18(%r11)
1407dbb29:     	je	0x1407dbba7 <.text+0x7daba7>
1407dbb2b:     	movl	-0x17(%r11), %eax
1407dbb2f:     	movl	-0x14(%r11), %ecx
1407dbb33:     	movl	%ecx, -0x3d(%rbp)
1407dbb36:     	movl	%eax, -0x40(%rbp)
1407dbb39:     	movzbl	-0x8(%r11), %eax
1407dbb3e:     	addq	$-0x10, %r11
1407dbb42:     	movb	$0x1, %cl
1407dbb44:     	jmp	0x1407dbbbb <.text+0x7dabbb>
1407dbb46:     	movq	0x8(%rsi), %r12
1407dbb4a:     	movq	0x68(%r12), %rax
1407dbb4f:     	movq	%rax, 0x1b4(%rbp)
1407dbb56:     	movb	$0x0, 0x1b0(%rbp)
1407dbb5d:     	leaq	0x1b0(%rbp), %rdx
1407dbb64:     	movq	%r15, %rcx
1407dbb67:     	callq	0x1415e7420 <.text+0x15e6420>
1407dbb6c:     	movl	0x6c(%r12), %ecx
1407dbb71:     	cmpq	%rcx, 0x48(%r15)
1407dbb75:     	jbe	0x1407dbb9f <.text+0x7dab9f>
1407dbb77:     	movq	0x40(%r15), %rax
1407dbb7b:     	shlq	$0x9, %rcx
1407dbb7f:     	cmpl	$0x1, (%rax,%rcx)
1407dbb83:     	jne	0x1407dbb9f <.text+0x7dab9f>
1407dbb85:     	movl	0x68(%r12), %edx
1407dbb8a:     	addq	%rcx, %rax
1407dbb8d:     	cmpl	%edx, 0x4(%rax)
1407dbb90:     	jne	0x1407dbb9f <.text+0x7dab9f>
1407dbb92:     	cmpl	$0x2, 0x1ec(%rax)
1407dbb99:     	jne	0x1407dbe6d <.text+0x7dae6d>
1407dbb9f:     	movb	$0x2, (%rbx)
1407dbba2:     	jmp	0x1407dbe56 <.text+0x7dae56>
1407dbba7:     	movq	-0x10(%r11), %rax
1407dbbab:     	lock
1407dbbac:     	incq	(%rax)
1407dbbaf:     	jle	0x1407dbeb9 <.text+0x7daeb9>
1407dbbb5:     	addq	$-0x10, %r11
1407dbbb9:     	xorl	%ecx, %ecx
1407dbbbb:     	movq	(%r11), %rdx
1407dbbbe:     	movb	%cl, (%rbx)
1407dbbc0:     	movl	-0x40(%rbp), %ecx
1407dbbc3:     	movl	-0x3d(%rbp), %r8d
1407dbbc7:     	movl	%ecx, 0x1(%rbx)
1407dbbca:     	movl	%r8d, 0x4(%rbx)
1407dbbce:     	movq	%rdx, 0x8(%rbx)
1407dbbd2:     	movq	%rax, 0x10(%rbx)
1407dbbd6:     	jmp	0x1407dbe56 <.text+0x7dae56>
1407dbbdb:     	addq	$-0x1f0, %rax           # imm = 0xFE10
1407dbbe1:     	movl	%r13d, %edi
1407dbbe4:     	movq	%r11, %r14
1407dbbe7:     	leaq	0x3a0(%rbp), %rcx
1407dbbee:     	movq	%rax, %rdx
1407dbbf1:     	callq	0x140857610 <.text+0x856610>
1407dbbf6:     	movl	0x20(%r14), %eax
1407dbbfa:     	movq	(%r14), %rcx
1407dbbfd:     	lock
1407dbbfe:     	incq	(%rcx)
1407dbc01:     	jle	0x1407dbeb9 <.text+0x7daeb9>
1407dbc07:     	movq	%rcx, 0x5d8(%rbp)
1407dbc0e:     	movl	%eax, 0x5f0(%rbp)
1407dbc14:     	movq	0x8(%r14), %rax
1407dbc18:     	movq	%rax, 0x5e0(%rbp)
1407dbc1f:     	lock
1407dbc20:     	incq	(%rax)
1407dbc23:     	jle	0x1407dbeb9 <.text+0x7daeb9>
1407dbc29:     	movq	0x10(%r14), %rax
1407dbc2d:     	movq	%rax, 0x5b0(%rbp)
1407dbc34:     	movl	0x18(%r14), %eax
1407dbc38:     	movl	%eax, 0x5ec(%rbp)
1407dbc3e:     	movq	0x400(%rbp), %rax
1407dbc45:     	lock
1407dbc46:     	decq	(%rax)
1407dbc49:     	jne	0x1407dbc58 <.text+0x7dac58>
1407dbc4b:     	leaq	0x400(%rbp), %rcx
1407dbc52:     	callq	0x143df8960 <.text+0x3df7960>
1407dbc57:     	nop
1407dbc58:     	movq	0x408(%rbp), %rax
1407dbc5f:     	lock
1407dbc60:     	decq	(%rax)
1407dbc63:     	jne	0x1407dbc72 <.text+0x7dac72>
1407dbc65:     	leaq	0x408(%rbp), %rcx
1407dbc6c:     	callq	0x143df83c0 <.text+0x3df73c0>
1407dbc71:     	nop
1407dbc72:     	movzbl	0x678(%rbp), %eax
1407dbc79:     	movq	0x5d8(%rbp), %rcx
1407dbc80:     	movq	%rcx, 0x400(%rbp)
1407dbc87:     	movq	0x5e0(%rbp), %rcx
1407dbc8e:     	movq	%rcx, 0x408(%rbp)
1407dbc95:     	movq	0x5b0(%rbp), %rcx
1407dbc9c:     	movq	%rcx, 0x410(%rbp)
1407dbca3:     	movl	0x5ec(%rbp), %ecx
1407dbca9:     	movl	%ecx, 0x418(%rbp)
1407dbcaf:     	movl	0x5f0(%rbp), %ecx
1407dbcb5:     	movl	%ecx, 0x420(%rbp)
1407dbcbb:     	testb	%al, %al
1407dbcbd:     	je	0x1407dbd01 <.text+0x7dad01>
1407dbcbf:     	movl	$0x40000000, 0x3c0(%rbp) # imm = 0x40000000
1407dbcc9:     	cmpb	$0x1, %al
1407dbccb:     	jne	0x1407dbd01 <.text+0x7dad01>
1407dbccd:     	pxor	%xmm0, %xmm0
1407dbcd1:     	maxss	0x3a8(%rbp), %xmm0
1407dbcd9:     	movss	0x521ba8f(%rip), %xmm1  # 0x1459f7770
1407dbce1:     	minss	%xmm0, %xmm1
1407dbce5:     	cvttss2si	%xmm1, %eax
1407dbce9:     	andl	$-0x71, %eax
1407dbcec:     	orl	$0x40, %eax
1407dbcef:     	movzwl	%ax, %eax
1407dbcf2:     	xorps	%xmm0, %xmm0
1407dbcf5:     	cvtsi2ss	%eax, %xmm0
1407dbcf9:     	movss	%xmm0, 0x3a8(%rbp)
1407dbd01:     	leaq	-0x40(%rbp), %rcx
1407dbd05:     	leaq	0x3a0(%rbp), %rdx
1407dbd0c:     	movl	$0x1f0, %r8d            # imm = 0x1F0
1407dbd12:     	callq	0x145756ddd <.text+0x5755ddd>
1407dbd17:     	movq	0x50(%r15), %rcx
1407dbd1b:     	addq	$0x10, %rcx
1407dbd1f:     	movb	$0x1, 0x5fe(%rbp)
1407dbd26:     	callq	0x144966220 <.text+0x4965220>
1407dbd2b:     	nop
1407dbd2c:     	movl	%eax, %r14d
1407dbd2f:     	movl	%edx, %r12d
1407dbd32:     	movq	%r15, %r13
1407dbd35:     	leaq	0x1b0(%rbp), %r15
1407dbd3c:     	leaq	-0x40(%rbp), %rdx
1407dbd40:     	movl	$0x1f0, %r8d            # imm = 0x1F0
1407dbd46:     	movq	%r15, %rcx
1407dbd49:     	callq	0x145756ddd <.text+0x5755ddd>
1407dbd4e:     	movb	$0x0, 0x5fe(%rbp)
1407dbd55:     	movq	%r15, 0x20(%rsp)
1407dbd5a:     	leaq	0x5b8(%rbp), %rcx
1407dbd61:     	movq	%r13, %rdx
1407dbd64:     	movl	%r14d, %r8d
1407dbd67:     	movl	%r12d, %r9d
1407dbd6a:     	callq	0x140f91400 <.text+0xf90400>
1407dbd6f:     	nop
1407dbd70:     	cmpl	$0x2, 0x5b8(%rbp)
1407dbd77:     	jne	0x1407dbe76 <.text+0x7dae76>
1407dbd7d:     	movq	$-0x1, 0x1b0(%rbp)
1407dbd88:     	movb	$0x0, 0x5fe(%rbp)
1407dbd8f:     	movq	%r15, 0x20(%rsp)
1407dbd94:     	movq	$0x0, 0x28(%rsp)
1407dbd9d:     	movq	%r13, %rcx
1407dbda0:     	movl	%r14d, %edx
1407dbda3:     	movl	%r12d, %r8d
1407dbda6:     	xorl	%r9d, %r9d
1407dbda9:     	callq	0x144978da0 <.text+0x4977da0>
1407dbdae:     	nop
1407dbdaf:     	movq	%rax, 0x5c0(%rbp)
1407dbdb6:     	movb	$0x0, 0x5b8(%rbp)
1407dbdbd:     	testb	%dil, %dil
1407dbdc0:     	je	0x1407dbdd3 <.text+0x7dadd3>
1407dbdc2:     	movdqu	0x1(%rsi), %xmm0
1407dbdc7:     	movdqu	%xmm0, 0x59d(%rbp)
1407dbdcf:     	movb	$0x1, %cl
1407dbdd1:     	jmp	0x1407dbde4 <.text+0x7dade4>
1407dbdd3:     	movq	0x8(%rsi), %rcx
1407dbdd7:     	movq	0x68(%rcx), %rcx
1407dbddb:     	movq	%rcx, 0x5a0(%rbp)
1407dbde2:     	xorl	%ecx, %ecx
1407dbde4:     	movb	%cl, 0x59c(%rbp)
1407dbdea:     	lock
1407dbdeb:     	incq	(%rax)
1407dbdee:     	jle	0x1407dbeb9 <.text+0x7daeb9>
1407dbdf4:     	movq	%rax, 0x1b8(%rbp)
1407dbdfb:     	movb	$0x0, 0x1b0(%rbp)
1407dbe02:     	leaq	-0x40(%rbp), %rcx
1407dbe06:     	leaq	0x59c(%rbp), %r8
1407dbe0d:     	leaq	0x1b0(%rbp), %r9
1407dbe14:     	movq	0x5d0(%rbp), %rdx
1407dbe1b:     	callq	0x140bc7370 <.text+0xbc6370>
1407dbe20:     	nop
1407dbe21:     	movzbl	-0x40(%rbp), %eax
1407dbe25:     	cmpb	$0x2, %al
1407dbe27:     	je	0x1407dbe41 <.text+0x7dae41>
1407dbe29:     	testb	%al, %al
1407dbe2b:     	jne	0x1407dbe41 <.text+0x7dae41>
1407dbe2d:     	movq	-0x38(%rbp), %rax
1407dbe31:     	lock
1407dbe32:     	decq	(%rax)
1407dbe35:     	jne	0x1407dbe41 <.text+0x7dae41>
1407dbe37:     	leaq	-0x38(%rbp), %rcx
1407dbe3b:     	callq	0x1449886d0 <.text+0x49876d0>
1407dbe40:     	nop
1407dbe41:     	movq	0x5c8(%rbp), %rax
1407dbe48:     	movq	%rax, 0x10(%rbx)
1407dbe4c:     	movups	0x5b8(%rbp), %xmm0
1407dbe53:     	movups	%xmm0, (%rbx)
1407dbe56:     	movq	%rbx, %rax
1407dbe59:     	addq	$0x688, %rsp            # imm = 0x688
1407dbe60:     	popq	%rbx
1407dbe61:     	popq	%rdi
1407dbe62:     	popq	%rsi
1407dbe63:     	popq	%r12
1407dbe65:     	popq	%r13
1407dbe67:     	popq	%r14
1407dbe69:     	popq	%r15
1407dbe6b:     	popq	%rbp
1407dbe6c:     	retq
1407dbe6d:     	addq	$0x10, %rax
1407dbe71:     	jmp	0x1407dbbe7 <.text+0x7dabe7>
1407dbe76:     	movdqu	0x5b8(%rbp), %xmm0
1407dbe7e:     	movdqa	%xmm0, 0x1b0(%rbp)
1407dbe86:     	movb	$0x0, 0x5fe(%rbp)
1407dbe8d:     	leaq	0x521c954(%rip), %rax   # 0x1459f87e8
1407dbe94:     	movq	%rax, 0x20(%rsp)
1407dbe99:     	leaq	0x521dd60(%rip), %rcx   # 0x1459f9c00
1407dbea0:     	leaq	0x521dda9(%rip), %r9    # 0x1459f9c50
1407dbea7:     	leaq	0x1b0(%rbp), %r8
1407dbeae:     	movl	$0x2b, %edx
1407dbeb3:     	callq	0x1458e7530 <.text+0x58e6530>
1407dbeb8:     	nop
1407dbeb9:     	ud2

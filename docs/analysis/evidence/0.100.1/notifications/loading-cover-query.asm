
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14064e8c0:     	pushq	%rsi
14064e8c1:     	cmpq	$0x0, 0x90(%rcx)
14064e8c9:     	je	0x14064e9ae <.text+0x64d9ae>
14064e8cf:     	movq	0x78(%rcx), %rax
14064e8d3:     	movq	0x80(%rcx), %rdx
14064e8da:     	movabsq	$0x3e96bbc955e649b6, %r8 # imm = 0x3E96BBC955E649B6
14064e8e4:     	xorl	%r9d, %r9d
14064e8e7:     	movdqa	0x52c4991(%rip), %xmm0  # 0x145913280
14064e8ef:     	pcmpeqd	%xmm1, %xmm1
14064e8f3:     	movdqa	0x53a56e5(%rip), %xmm2  # 0x1459f3fe0
14064e8fb:     	andq	%rdx, %r8
14064e8fe:     	movdqu	(%rax,%r8), %xmm3
14064e904:     	movdqa	%xmm3, %xmm4
14064e908:     	pcmpeqb	%xmm0, %xmm4
14064e90c:     	pmovmskb	%xmm4, %r10d
14064e911:     	testl	%r10d, %r10d
14064e914:     	je	0x14064e950 <.text+0x64d950>
14064e916:     	tzcntl	%r10d, %r11d
14064e91b:     	addq	%r8, %r11
14064e91e:     	andq	%rdx, %r11
14064e921:     	negq	%r11
14064e924:     	leaq	(%r11,%r11,2), %r11
14064e928:     	movdqu	-0x18(%rax,%r11,8), %xmm4
14064e92f:     	pcmpeqb	%xmm2, %xmm4
14064e933:     	pmovmskb	%xmm4, %esi
14064e937:     	cmpl	$0xffff, %esi           # imm = 0xFFFF
14064e93d:     	je	0x14064e96b <.text+0x64d96b>
14064e93f:     	leal	-0x1(%r10), %r11d
14064e943:     	andw	%r10w, %r11w
14064e947:     	movl	%r11d, %r10d
14064e94a:     	jne	0x14064e916 <.text+0x64d916>
14064e94c:     	nopl	(%rax)
14064e950:     	pcmpeqb	%xmm1, %xmm3
14064e954:     	pmovmskb	%xmm3, %r10d
14064e959:     	testl	%r10d, %r10d
14064e95c:     	jne	0x14064e9ae <.text+0x64d9ae>
14064e95e:     	addq	%r9, %r8
14064e961:     	addq	$0x10, %r8
14064e965:     	addq	$0x10, %r9
14064e969:     	jmp	0x14064e8fb <.text+0x64d8fb>
14064e96b:     	leaq	(%rax,%r11,8), %rax
14064e96f:     	movq	-0x8(%rax), %rax
14064e973:     	cmpq	0x218(%rcx), %rax
14064e97a:     	jae	0x14064e9ae <.text+0x64d9ae>
14064e97c:     	movq	0x210(%rcx), %rdx
14064e983:     	movq	(%rdx,%rax,8), %rdx
14064e987:     	testq	%rdx, %rdx
14064e98a:     	je	0x14064e9ae <.text+0x64d9ae>
14064e98c:     	movq	0x1e0(%rcx), %rax
14064e993:     	notq	%rdx
14064e996:     	imulq	$0x38, %rdx, %rcx
14064e99a:     	cmpb	$0x1, 0x30(%rax,%rcx)
14064e99f:     	jne	0x14064e9ae <.text+0x64d9ae>
14064e9a1:     	addq	%rcx, %rax
14064e9a4:     	movq	0x10(%rax), %rax
14064e9a8:     	movzbl	0x58(%rax), %eax
14064e9ac:     	popq	%rsi
14064e9ad:     	retq
14064e9ae:     	xorl	%eax, %eax
14064e9b0:     	popq	%rsi
14064e9b1:     	retq

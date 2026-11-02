
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400a4890:     	pushq	%rsi
1400a4891:     	pushq	%rdi
1400a4892:     	pushq	%rbp
1400a4893:     	pushq	%rbx
1400a4894:     	movq	%rcx, %rax
1400a4897:     	leaq	(%rcx,%rdx), %r8
1400a489b:     	testq	%rdx, %rdx
1400a489e:     	je	0x1400a49e2 <.text+0xa39e2>
1400a48a4:     	movq	0x79935b5(%rip), %r10   # 0x147a37e60
1400a48ab:     	xorl	%edx, %edx
1400a48ad:     	movq	%rax, %r9
1400a48b0:     	jmp	0x1400a48d9 <.text+0xa38d9>
1400a48b2:     	movzbl	%r11b, %r11d
1400a48b6:     	movzbl	(%r10,%r11), %r11d
1400a48bb:     	shrb	%r11b
1400a48be:     	testb	$0x1, %r11b
1400a48c2:     	je	0x1400a49e9 <.text+0xa39e9>
1400a48c8:     	nopl	(%rax,%rax)
1400a48d0:     	cmpq	%r8, %r9
1400a48d3:     	je	0x1400a49d9 <.text+0xa39d9>
1400a48d9:     	movq	%r9, %rsi
1400a48dc:     	movq	%rdx, %rcx
1400a48df:     	movzbl	(%r9), %r9d
1400a48e3:     	movzbl	%r9b, %r11d
1400a48e7:     	testb	%r11b, %r11b
1400a48ea:     	js	0x1400a4900 <.text+0xa3900>
1400a48ec:     	leaq	0x1(%rsi), %r9
1400a48f0:     	jmp	0x1400a4960 <.text+0xa3960>
1400a48f2:     	nopw	%cs:(%rax,%rax)
1400a4900:     	movl	%r11d, %edx
1400a4903:     	andl	$0x1f, %edx
1400a4906:     	movzbl	0x1(%rsi), %edi
1400a490a:     	andl	$0x3f, %edi
1400a490d:     	cmpb	$-0x21, %r11b
1400a4911:     	jbe	0x1400a4947 <.text+0xa3947>
1400a4913:     	movzbl	0x2(%rsi), %r11d
1400a4918:     	shll	$0x6, %edi
1400a491b:     	andl	$0x3f, %r11d
1400a491f:     	orl	%edi, %r11d
1400a4922:     	cmpb	$-0x10, %r9b
1400a4926:     	jb	0x1400a4955 <.text+0xa3955>
1400a4928:     	leaq	0x4(%rsi), %r9
1400a492c:     	movzbl	0x3(%rsi), %edi
1400a4930:     	andl	$0x7, %edx
1400a4933:     	shll	$0x12, %edx
1400a4936:     	shll	$0x6, %r11d
1400a493a:     	andl	$0x3f, %edi
1400a493d:     	orl	%r11d, %edi
1400a4940:     	orl	%edx, %edi
1400a4942:     	movl	%edi, %r11d
1400a4945:     	jmp	0x1400a4960 <.text+0xa3960>
1400a4947:     	leaq	0x2(%rsi), %r9
1400a494b:     	shll	$0x6, %edx
1400a494e:     	orl	%edi, %edx
1400a4950:     	movl	%edx, %r11d
1400a4953:     	jmp	0x1400a4960 <.text+0xa3960>
1400a4955:     	leaq	0x3(%rsi), %r9
1400a4959:     	shll	$0xc, %edx
1400a495c:     	orl	%edx, %r11d
1400a495f:     	nop
1400a4960:     	movq	%r9, %rdx
1400a4963:     	subq	%rsi, %rdx
1400a4966:     	addq	%rcx, %rdx
1400a4969:     	leal	-0x9(%r11), %esi
1400a496d:     	cmpl	$0x5, %esi
1400a4970:     	jb	0x1400a48d0 <.text+0xa38d0>
1400a4976:     	cmpl	$0x20, %r11d
1400a497a:     	je	0x1400a48d0 <.text+0xa38d0>
1400a4980:     	cmpl	$0x85, %r11d
1400a4987:     	jb	0x1400a49e9 <.text+0xa39e9>
1400a4989:     	movl	%r11d, %esi
1400a498c:     	shrl	$0x8, %esi
1400a498f:     	cmpl	$0x1f, %esi
1400a4992:     	jg	0x1400a49ad <.text+0xa39ad>
1400a4994:     	testl	%esi, %esi
1400a4996:     	je	0x1400a49cb <.text+0xa39cb>
1400a4998:     	cmpl	$0x16, %esi
1400a499b:     	jne	0x1400a49e9 <.text+0xa39e9>
1400a499d:     	cmpl	$0x1680, %r11d          # imm = 0x1680
1400a49a4:     	sete	%r11b
1400a49a8:     	jmp	0x1400a48be <.text+0xa38be>
1400a49ad:     	cmpl	$0x20, %esi
1400a49b0:     	je	0x1400a48b2 <.text+0xa38b2>
1400a49b6:     	cmpl	$0x30, %esi
1400a49b9:     	jne	0x1400a49e9 <.text+0xa39e9>
1400a49bb:     	cmpl	$0x3000, %r11d          # imm = 0x3000
1400a49c2:     	sete	%r11b
1400a49c6:     	jmp	0x1400a48be <.text+0xa38be>
1400a49cb:     	movzbl	%r11b, %r11d
1400a49cf:     	movzbl	(%r10,%r11), %r11d
1400a49d4:     	jmp	0x1400a48be <.text+0xa38be>
1400a49d9:     	xorl	%ecx, %ecx
1400a49db:     	xorl	%edx, %edx
1400a49dd:     	jmp	0x1400a4afe <.text+0xa3afe>
1400a49e2:     	xorl	%edx, %edx
1400a49e4:     	movq	%rax, %r9
1400a49e7:     	xorl	%ecx, %ecx
1400a49e9:     	cmpq	%r8, %r9
1400a49ec:     	je	0x1400a4afe <.text+0xa3afe>
1400a49f2:     	movq	0x7993467(%rip), %r10   # 0x147a37e60
1400a49f9:     	jmp	0x1400a4a19 <.text+0xa3a19>
1400a49fb:     	movzbl	%sil, %esi
1400a49ff:     	movzbl	(%r10,%rsi), %ebx
1400a4a04:     	shrb	%bl
1400a4a06:     	testb	$0x1, %bl
1400a4a09:     	je	0x1400a4af8 <.text+0xa3af8>
1400a4a0f:     	nop
1400a4a10:     	cmpq	%r8, %r9
1400a4a13:     	je	0x1400a4afe <.text+0xa3afe>
1400a4a19:     	movq	%r8, %r11
1400a4a1c:     	movsbl	-0x1(%r8), %esi
1400a4a21:     	testl	%esi, %esi
1400a4a23:     	js	0x1400a4a40 <.text+0xa3a40>
1400a4a25:     	leaq	-0x1(%r11), %r8
1400a4a29:     	leal	-0x9(%rsi), %edi
1400a4a2c:     	cmpl	$0x5, %edi
1400a4a2f:     	jb	0x1400a4a10 <.text+0xa3a10>
1400a4a31:     	jmp	0x1400a4a9c <.text+0xa3a9c>
1400a4a33:     	nopw	%cs:(%rax,%rax)
1400a4a40:     	movzbl	-0x2(%r11), %edi
1400a4a45:     	cmpb	$-0x40, %dil
1400a4a49:     	jge	0x1400a4a6b <.text+0xa3a6b>
1400a4a4b:     	movzbl	-0x3(%r11), %ebx
1400a4a50:     	cmpb	$-0x40, %bl
1400a4a53:     	jge	0x1400a4a74 <.text+0xa3a74>
1400a4a55:     	leaq	-0x4(%r11), %r8
1400a4a59:     	movzbl	-0x4(%r11), %ebp
1400a4a5e:     	andl	$0x7, %ebp
1400a4a61:     	shll	$0x6, %ebp
1400a4a64:     	andl	$0x3f, %ebx
1400a4a67:     	orl	%ebp, %ebx
1400a4a69:     	jmp	0x1400a4a7b <.text+0xa3a7b>
1400a4a6b:     	leaq	-0x2(%r11), %r8
1400a4a6f:     	andl	$0x1f, %edi
1400a4a72:     	jmp	0x1400a4a83 <.text+0xa3a83>
1400a4a74:     	leaq	-0x3(%r11), %r8
1400a4a78:     	andl	$0xf, %ebx
1400a4a7b:     	shll	$0x6, %ebx
1400a4a7e:     	andl	$0x3f, %edi
1400a4a81:     	orl	%ebx, %edi
1400a4a83:     	shll	$0x6, %edi
1400a4a86:     	andb	$0x3f, %sil
1400a4a8a:     	movzbl	%sil, %esi
1400a4a8e:     	orl	%edi, %esi
1400a4a90:     	leal	-0x9(%rsi), %edi
1400a4a93:     	cmpl	$0x5, %edi
1400a4a96:     	jb	0x1400a4a10 <.text+0xa3a10>
1400a4a9c:     	cmpl	$0x20, %esi
1400a4a9f:     	je	0x1400a4a10 <.text+0xa3a10>
1400a4aa5:     	cmpl	$0x85, %esi
1400a4aab:     	jb	0x1400a4af8 <.text+0xa3af8>
1400a4aad:     	movl	%esi, %edi
1400a4aaf:     	shrl	$0x8, %edi
1400a4ab2:     	cmpl	$0x1f, %edi
1400a4ab5:     	jg	0x1400a4ace <.text+0xa3ace>
1400a4ab7:     	testl	%edi, %edi
1400a4ab9:     	je	0x1400a4aea <.text+0xa3aea>
1400a4abb:     	cmpl	$0x16, %edi
1400a4abe:     	jne	0x1400a4af8 <.text+0xa3af8>
1400a4ac0:     	cmpl	$0x1680, %esi           # imm = 0x1680
1400a4ac6:     	sete	%bl
1400a4ac9:     	jmp	0x1400a4a06 <.text+0xa3a06>
1400a4ace:     	cmpl	$0x20, %edi
1400a4ad1:     	je	0x1400a49fb <.text+0xa39fb>
1400a4ad7:     	cmpl	$0x30, %edi
1400a4ada:     	jne	0x1400a4af8 <.text+0xa3af8>
1400a4adc:     	cmpl	$0x3000, %esi           # imm = 0x3000
1400a4ae2:     	sete	%bl
1400a4ae5:     	jmp	0x1400a4a06 <.text+0xa3a06>
1400a4aea:     	movzbl	%sil, %esi
1400a4aee:     	movzbl	(%r10,%rsi), %ebx
1400a4af3:     	jmp	0x1400a4a06 <.text+0xa3a06>
1400a4af8:     	subq	%r9, %rdx
1400a4afb:     	addq	%r11, %rdx
1400a4afe:     	subq	%rcx, %rdx
1400a4b01:     	addq	%rcx, %rax
1400a4b04:     	popq	%rbx
1400a4b05:     	popq	%rbp
1400a4b06:     	popq	%rdi
1400a4b07:     	popq	%rsi
1400a4b08:     	retq

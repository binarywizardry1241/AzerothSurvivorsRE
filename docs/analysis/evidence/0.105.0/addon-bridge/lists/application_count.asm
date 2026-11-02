
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458df730:     	pushq	%r15
1458df732:     	pushq	%r14
1458df734:     	pushq	%r13
1458df736:     	pushq	%r12
1458df738:     	pushq	%rsi
1458df739:     	pushq	%rdi
1458df73a:     	pushq	%rbp
1458df73b:     	pushq	%rbx
1458df73c:     	subq	$0x28, %rsp
1458df740:     	movq	%rcx, %r8
1458df743:     	shlq	$0x2, %rdx
1458df747:     	movq	0x10(%rcx), %r9
1458df74b:     	testq	%r9, %r9
1458df74e:     	je	0x1458dfa1a <.text+0x58dea1a>
1458df754:     	movq	0x8(%r8), %r10
1458df758:     	leaq	-0x1(%r9), %r11
1458df75c:     	movq	%r9, %rsi
1458df75f:     	andq	$-0x2, %rsi
1458df763:     	xorl	%r15d, %r15d
1458df766:     	xorl	%eax, %eax
1458df768:     	jmp	0x1458df7a2 <.text+0x58de7a2>
1458df76a:     	nopw	(%rax,%rax)
1458df770:     	testq	%r15, %r15
1458df773:     	je	0x1458df92f <.text+0x58de92f>
1458df779:     	cmpq	$0xff, %r15
1458df780:     	movl	$0xff, %edi
1458df785:     	cmovbq	%r15, %rdi
1458df789:     	decl	%edi
1458df78b:     	testq	%r15, %r15
1458df78e:     	movl	$0x0, %ebx
1458df793:     	cmovel	%ebx, %edi
1458df796:     	shll	$0x3, %ecx
1458df799:     	shll	%cl, %edi
1458df79b:     	orl	%eax, %edi
1458df79d:     	movq	%r14, %r15
1458df7a0:     	movl	%edi, %eax
1458df7a2:     	cmpq	$0x4, %r15
1458df7a6:     	jae	0x1458dfa9e <.text+0x58dea9e>
1458df7ac:     	movq	%r15, %rdi
1458df7af:     	orq	%rdx, %rdi
1458df7b2:     	cmpq	$0xf, %rdi
1458df7b6:     	ja	0x1458dfaaf <.text+0x58deaaf>
1458df7bc:     	leaq	0x1(%r15), %rcx
1458df7c0:     	movl	0xb0(%r8,%rdi,4), %ebp
1458df7c8:     	testl	%ebp, %ebp
1458df7ca:     	je	0x1458df7e0 <.text+0x58de7e0>
1458df7cc:     	movq	%rcx, %r14
1458df7cf:     	movq	%r15, %rcx
1458df7d2:     	jmp	0x1458df870 <.text+0x58de870>
1458df7d7:     	nopw	(%rax,%rax)
1458df7e0:     	cmpq	$0x3, %r15
1458df7e4:     	je	0x1458dfa9e <.text+0x58dea9e>
1458df7ea:     	movq	%rcx, %rbx
1458df7ed:     	orq	%rdx, %rbx
1458df7f0:     	cmpq	$0xf, %rbx
1458df7f4:     	ja	0x1458dfaaf <.text+0x58deaaf>
1458df7fa:     	leaq	0x2(%r15), %rdi
1458df7fe:     	movl	0xb0(%r8,%rbx,4), %ebp
1458df806:     	testl	%ebp, %ebp
1458df808:     	je	0x1458df80f <.text+0x58de80f>
1458df80a:     	movq	%rdi, %r14
1458df80d:     	jmp	0x1458df870 <.text+0x58de870>
1458df80f:     	cmpq	$0x1, %r15
1458df813:     	ja	0x1458dfa9e <.text+0x58dea9e>
1458df819:     	movq	%rdi, %rbx
1458df81c:     	orq	%rdx, %rbx
1458df81f:     	cmpq	$0xf, %rbx
1458df823:     	ja	0x1458dfaaf <.text+0x58deaaf>
1458df829:     	leaq	0x3(%r15), %rcx
1458df82d:     	movl	0xb0(%r8,%rbx,4), %ebp
1458df835:     	testl	%ebp, %ebp
1458df837:     	je	0x1458df841 <.text+0x58de841>
1458df839:     	movq	%rcx, %r14
1458df83c:     	movq	%rdi, %rcx
1458df83f:     	jmp	0x1458df870 <.text+0x58de870>
1458df841:     	testq	%r15, %r15
1458df844:     	jne	0x1458dfa9e <.text+0x58dea9e>
1458df84a:     	cmpq	$0xf, %rdx
1458df84e:     	ja	0x1458dfaaf <.text+0x58deaaf>
1458df854:     	movl	0xbc(%r8,%rdx,4), %ebp
1458df85c:     	movl	$0x4, %r14d
1458df862:     	testl	%ebp, %ebp
1458df864:     	je	0x1458dfa9e <.text+0x58dea9e>
1458df86a:     	nopw	(%rax,%rax)
1458df870:     	testq	%r11, %r11
1458df873:     	je	0x1458df900 <.text+0x58de900>
1458df879:     	leaq	0x50(%r10), %r13
1458df87d:     	xorl	%r12d, %r12d
1458df880:     	xorl	%r15d, %r15d
1458df883:     	jmp	0x1458df8a5 <.text+0x58de8a5>
1458df885:     	nopw	%cs:(%rax,%rax)
1458df890:     	xorl	%ebx, %ebx
1458df892:     	addq	%rdi, %r15
1458df895:     	addq	%rbx, %r15
1458df898:     	addq	$0x2, %r12
1458df89c:     	addq	$0x60, %r13
1458df8a0:     	cmpq	%r12, %rsi
1458df8a3:     	je	0x1458df8e0 <.text+0x58de8e0>
1458df8a5:     	cmpl	%ebp, -0x40(%r13)
1458df8a9:     	jne	0x1458df8b2 <.text+0x58de8b2>
1458df8ab:     	cmpb	$0x0, -0x50(%r13)
1458df8b0:     	je	0x1458df8cd <.text+0x58de8cd>
1458df8b2:     	xorl	%edi, %edi
1458df8b4:     	cmpl	%ebp, -0x10(%r13)
1458df8b8:     	jne	0x1458df890 <.text+0x58de890>
1458df8ba:     	cmpb	$0x0, -0x20(%r13)
1458df8bf:     	jne	0x1458df890 <.text+0x58de890>
1458df8c1:     	xorl	%ebx, %ebx
1458df8c3:     	cmpl	$0x0, (%r13)
1458df8c8:     	setne	%bl
1458df8cb:     	jmp	0x1458df892 <.text+0x58de892>
1458df8cd:     	xorl	%edi, %edi
1458df8cf:     	cmpl	$0x0, -0x30(%r13)
1458df8d4:     	setne	%dil
1458df8d8:     	cmpl	%ebp, -0x10(%r13)
1458df8dc:     	jne	0x1458df890 <.text+0x58de890>
1458df8de:     	jmp	0x1458df8ba <.text+0x58de8ba>
1458df8e0:     	testb	$0x1, %r9b
1458df8e4:     	je	0x1458df770 <.text+0x58de770>
1458df8ea:     	leaq	(%r12,%r12,2), %rbx
1458df8ee:     	shlq	$0x4, %rbx
1458df8f2:     	cmpl	%ebp, 0x10(%r10,%rbx)
1458df8f7:     	jne	0x1458df921 <.text+0x58de921>
1458df8f9:     	jmp	0x1458df915 <.text+0x58de915>
1458df8fb:     	nopl	(%rax,%rax)
1458df900:     	xorl	%r12d, %r12d
1458df903:     	xorl	%r15d, %r15d
1458df906:     	leaq	(%r12,%r12,2), %rbx
1458df90a:     	shlq	$0x4, %rbx
1458df90e:     	cmpl	%ebp, 0x10(%r10,%rbx)
1458df913:     	jne	0x1458df921 <.text+0x58de921>
1458df915:     	addq	%r10, %rbx
1458df918:     	cmpb	$0x0, (%rbx)
1458df91b:     	je	0x1458df9ff <.text+0x58de9ff>
1458df921:     	xorl	%edi, %edi
1458df923:     	addq	%rdi, %r15
1458df926:     	testq	%r15, %r15
1458df929:     	jne	0x1458df779 <.text+0x58de779>
1458df92f:     	testq	%r11, %r11
1458df932:     	je	0x1458df9cb <.text+0x58de9cb>
1458df938:     	leaq	0x50(%r10), %r13
1458df93c:     	xorl	%r12d, %r12d
1458df93f:     	xorl	%r15d, %r15d
1458df942:     	jmp	0x1458df965 <.text+0x58de965>
1458df944:     	nopw	%cs:(%rax,%rax)
1458df950:     	xorl	%ebx, %ebx
1458df952:     	addq	%rdi, %r15
1458df955:     	addq	%rbx, %r15
1458df958:     	addq	$0x2, %r12
1458df95c:     	addq	$0x60, %r13
1458df960:     	cmpq	%r12, %rsi
1458df963:     	je	0x1458df9b0 <.text+0x58de9b0>
1458df965:     	cmpl	%ebp, -0x40(%r13)
1458df969:     	jne	0x1458df990 <.text+0x58de990>
1458df96b:     	cmpq	$0x0, -0x50(%r13)
1458df970:     	je	0x1458df990 <.text+0x58de990>
1458df972:     	xorl	%edi, %edi
1458df974:     	cmpl	$0x0, -0x30(%r13)
1458df979:     	setne	%dil
1458df97d:     	cmpl	%ebp, -0x10(%r13)
1458df981:     	jne	0x1458df950 <.text+0x58de950>
1458df983:     	jmp	0x1458df998 <.text+0x58de998>
1458df985:     	nopw	%cs:(%rax,%rax)
1458df990:     	xorl	%edi, %edi
1458df992:     	cmpl	%ebp, -0x10(%r13)
1458df996:     	jne	0x1458df950 <.text+0x58de950>
1458df998:     	cmpq	$0x0, -0x20(%r13)
1458df99d:     	je	0x1458df950 <.text+0x58de950>
1458df99f:     	xorl	%ebx, %ebx
1458df9a1:     	cmpl	$0x0, (%r13)
1458df9a6:     	setne	%bl
1458df9a9:     	jmp	0x1458df952 <.text+0x58de952>
1458df9ab:     	nopl	(%rax,%rax)
1458df9b0:     	testb	$0x1, %r9b
1458df9b4:     	je	0x1458df779 <.text+0x58de779>
1458df9ba:     	leaq	(%r12,%r12,2), %rbx
1458df9be:     	shlq	$0x4, %rbx
1458df9c2:     	cmpl	%ebp, 0x10(%r10,%rbx)
1458df9c7:     	jne	0x1458df9f5 <.text+0x58de9f5>
1458df9c9:     	jmp	0x1458df9e0 <.text+0x58de9e0>
1458df9cb:     	xorl	%r12d, %r12d
1458df9ce:     	xorl	%r15d, %r15d
1458df9d1:     	leaq	(%r12,%r12,2), %rbx
1458df9d5:     	shlq	$0x4, %rbx
1458df9d9:     	cmpl	%ebp, 0x10(%r10,%rbx)
1458df9de:     	jne	0x1458df9f5 <.text+0x58de9f5>
1458df9e0:     	addq	%r10, %rbx
1458df9e3:     	cmpq	$0x0, (%rbx)
1458df9e7:     	je	0x1458df9f5 <.text+0x58de9f5>
1458df9e9:     	xorl	%edi, %edi
1458df9eb:     	cmpl	$0x0, 0x20(%rbx)
1458df9ef:     	setne	%dil
1458df9f3:     	jmp	0x1458df9f7 <.text+0x58de9f7>
1458df9f5:     	xorl	%edi, %edi
1458df9f7:     	addq	%rdi, %r15
1458df9fa:     	jmp	0x1458df779 <.text+0x58de779>
1458df9ff:     	xorl	%edi, %edi
1458dfa01:     	cmpl	$0x0, 0x20(%rbx)
1458dfa05:     	setne	%dil
1458dfa09:     	addq	%rdi, %r15
1458dfa0c:     	testq	%r15, %r15
1458dfa0f:     	jne	0x1458df779 <.text+0x58de779>
1458dfa15:     	jmp	0x1458df92f <.text+0x58de92f>
1458dfa1a:     	xorl	%eax, %eax
1458dfa1c:     	xorl	%ecx, %ecx
1458dfa1e:     	nop
1458dfa20:     	cmpq	$0x3, %rcx
1458dfa24:     	ja	0x1458dfa9e <.text+0x58dea9e>
1458dfa26:     	movq	%rcx, %r15
1458dfa29:     	movq	%rcx, %r9
1458dfa2c:     	orq	%rdx, %r9
1458dfa2f:     	cmpq	$0xf, %r9
1458dfa33:     	ja	0x1458dfaaf <.text+0x58deaaf>
1458dfa35:     	leaq	0x1(%r15), %rcx
1458dfa39:     	cmpl	$0x0, 0xb0(%r8,%r9,4)
1458dfa42:     	jne	0x1458dfa20 <.text+0x58dea20>
1458dfa44:     	cmpq	$0x3, %r15
1458dfa48:     	je	0x1458dfa9e <.text+0x58dea9e>
1458dfa4a:     	orq	%rdx, %rcx
1458dfa4d:     	cmpq	$0xf, %rcx
1458dfa51:     	ja	0x1458dfaaf <.text+0x58deaaf>
1458dfa53:     	leaq	0x2(%r15), %r9
1458dfa57:     	cmpl	$0x0, 0xb0(%r8,%rcx,4)
1458dfa60:     	movq	%r9, %rcx
1458dfa63:     	jne	0x1458dfa20 <.text+0x58dea20>
1458dfa65:     	cmpq	$0x1, %r15
1458dfa69:     	ja	0x1458dfa9e <.text+0x58dea9e>
1458dfa6b:     	orq	%rdx, %r9
1458dfa6e:     	cmpq	$0xf, %r9
1458dfa72:     	ja	0x1458dfaaf <.text+0x58deaaf>
1458dfa74:     	leaq	0x3(%r15), %rcx
1458dfa78:     	cmpl	$0x0, 0xb0(%r8,%r9,4)
1458dfa81:     	jne	0x1458dfa20 <.text+0x58dea20>
1458dfa83:     	testq	%r15, %r15
1458dfa86:     	jne	0x1458dfa9e <.text+0x58dea9e>
1458dfa88:     	cmpq	$0xf, %rdx
1458dfa8c:     	ja	0x1458dfaaf <.text+0x58deaaf>
1458dfa8e:     	movl	$0x4, %ecx
1458dfa93:     	cmpl	$0x0, 0xbc(%r8,%rdx,4)
1458dfa9c:     	jne	0x1458dfa20 <.text+0x58dea20>
1458dfa9e:     	addq	$0x28, %rsp
1458dfaa2:     	popq	%rbx
1458dfaa3:     	popq	%rbp
1458dfaa4:     	popq	%rdi
1458dfaa5:     	popq	%rsi
1458dfaa6:     	popq	%r12
1458dfaa8:     	popq	%r13
1458dfaaa:     	popq	%r14
1458dfaac:     	popq	%r15
1458dfaae:     	retq
1458dfaaf:     	orq	%rdx, %r15
1458dfab2:     	cmpq	$0x11, %r15
1458dfab6:     	movl	$0x10, %ecx
1458dfabb:     	cmovaeq	%r15, %rcx
1458dfabf:     	leaq	0x157b21a(%rip), %r8    # 0x146e5ace0
1458dfac6:     	movl	$0x10, %edx
1458dfacb:     	callq	0x145d697e3 <.text+0x5d687e3>
1458dfad0:     	ud2

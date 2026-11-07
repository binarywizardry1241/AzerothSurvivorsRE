
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e7820:     	pushq	%rsi
1454e7821:     	pushq	%rdi
1454e7822:     	pushq	%rbx
1454e7823:     	subq	$0x70, %rsp
1454e7827:     	cmpb	$0x2, 0x95f(%rcx)
1454e782e:     	jne	0x1454e7914 <.text+0x54e6914>
1454e7834:     	movzbl	0x95d(%rcx), %ebx
1454e783b:     	cmpb	$-0x1, %bl
1454e783e:     	je	0x1454e7914 <.text+0x54e6914>
1454e7844:     	movl	0x4ac(%rcx), %eax
1454e784a:     	testl	%eax, %eax
1454e784c:     	je	0x1454e7867 <.text+0x54e6867>
1454e784e:     	decl	%eax
1454e7850:     	movl	%eax, 0x4ac(%rcx)
1454e7856:     	movl	%ebx, %edx
1454e7858:     	xorl	%r8d, %r8d
1454e785b:     	addq	$0x70, %rsp
1454e785f:     	popq	%rbx
1454e7860:     	popq	%rdi
1454e7861:     	popq	%rsi
1454e7862:     	jmp	0x1454da5f0 <.text+0x54d95f0>
1454e7867:     	movl	0x4b0(%rcx), %r9d
1454e786e:     	movl	$0x1, %eax
1454e7873:     	testl	%r9d, %r9d
1454e7876:     	je	0x1454e78f5 <.text+0x54e68f5>
1454e7878:     	testb	$0x1, %r9b
1454e787c:     	je	0x1454e7889 <.text+0x54e6889>
1454e787e:     	movl	$0x3, %eax
1454e7883:     	cmpl	$0x1, %r9d
1454e7887:     	je	0x1454e78f5 <.text+0x54e68f5>
1454e7889:     	testb	$0x2, %r9b
1454e788d:     	je	0x1454e789d <.text+0x54e689d>
1454e788f:     	leal	(%rax,%rax,8), %eax
1454e7892:     	movl	%r9d, %edx
1454e7895:     	andl	$-0x2, %edx
1454e7898:     	cmpl	$0x2, %edx
1454e789b:     	je	0x1454e78f5 <.text+0x54e68f5>
1454e789d:     	testb	$0x4, %r9b
1454e78a1:     	je	0x1454e78b4 <.text+0x54e68b4>
1454e78a3:     	leal	(%rax,%rax,8), %eax
1454e78a6:     	leal	(%rax,%rax,8), %eax
1454e78a9:     	movl	%r9d, %edx
1454e78ac:     	andl	$-0x4, %edx
1454e78af:     	cmpl	$0x4, %edx
1454e78b2:     	je	0x1454e78f5 <.text+0x54e68f5>
1454e78b4:     	testb	$0x8, %r9b
1454e78b8:     	je	0x1454e78cb <.text+0x54e68cb>
1454e78ba:     	imull	$0x19a1, %eax, %eax     # imm = 0x19A1
1454e78c0:     	movl	%r9d, %edx
1454e78c3:     	andl	$-0x8, %edx
1454e78c6:     	cmpl	$0x8, %edx
1454e78c9:     	je	0x1454e78f5 <.text+0x54e68f5>
1454e78cb:     	movb	$0x1, %r10b
1454e78ce:     	movl	$0xffffff9c, %r8d       # imm = 0xFFFFFF9C
1454e78d4:     	testb	$0x10, %r9b
1454e78d8:     	je	0x1454e7903 <.text+0x54e6903>
1454e78da:     	movl	$0x290d741, %edx        # imm = 0x290D741
1454e78df:     	mull	%edx
1454e78e1:     	seto	%dl
1454e78e4:     	movl	%r9d, %r11d
1454e78e7:     	andl	$-0x10, %r11d
1454e78eb:     	cmpl	$0x10, %r11d
1454e78ef:     	jne	0x1454e7903 <.text+0x54e6903>
1454e78f1:     	testb	%dl, %dl
1454e78f3:     	jne	0x1454e7903 <.text+0x54e6903>
1454e78f5:     	movl	$0x64, %edx
1454e78fa:     	mull	%edx
1454e78fc:     	movl	%eax, %r8d
1454e78ff:     	seto	%r10b
1454e7903:     	testb	$0x1, %r10b
1454e7907:     	jne	0x1454e791c <.text+0x54e691c>
1454e7909:     	movl	0x408(%rcx), %eax
1454e790f:     	subl	%r8d, %eax
1454e7912:     	jae	0x1454e792d <.text+0x54e692d>
1454e7914:     	addq	$0x70, %rsp
1454e7918:     	popq	%rbx
1454e7919:     	popq	%rdi
1454e791a:     	popq	%rsi
1454e791b:     	retq
1454e791c:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454e7922:     	movl	0x408(%rcx), %eax
1454e7928:     	subl	%r8d, %eax
1454e792b:     	jb	0x1454e7914 <.text+0x54e6914>
1454e792d:     	movl	%eax, 0x408(%rcx)
1454e7933:     	incl	%r9d
1454e7936:     	movl	%r9d, 0x4b0(%rcx)
1454e793d:     	imull	$0x2710, %eax, %r8d     # imm = 0x2710
1454e7944:     	movq	0x8b8(%rcx), %rax
1454e794b:     	testq	%rax, %rax
1454e794e:     	je	0x1454e79b8 <.text+0x54e69b8>
1454e7950:     	movq	0x8c0(%rcx), %rdx
1454e7957:     	movl	$0x498, %r9d            # imm = 0x498
1454e795d:     	movzwl	0x36(%rax), %r11d
1454e7962:     	movl	%r11d, %esi
1454e7965:     	addl	%esi, %esi
1454e7967:     	movq	$-0x1, %r10
1454e796e:     	nop
1454e7970:     	testq	%rsi, %rsi
1454e7973:     	je	0x1454e799e <.text+0x54e699e>
1454e7975:     	movzwl	0x3a(%rax,%r10,2), %edi
1454e797b:     	cmpl	%edi, %r9d
1454e797e:     	seta	%dil
1454e7982:     	sbbb	$0x0, %dil
1454e7986:     	incq	%r10
1454e7989:     	addq	$-0x2, %rsi
1454e798d:     	cmpb	$0x1, %dil
1454e7991:     	je	0x1454e7970 <.text+0x54e6970>
1454e7993:     	movzbl	%dil, %r11d
1454e7997:     	testl	%r11d, %r11d
1454e799a:     	je	0x1454e79ae <.text+0x54e69ae>
1454e799c:     	jmp	0x1454e79a1 <.text+0x54e69a1>
1454e799e:     	movq	%r11, %r10
1454e79a1:     	subq	$0x1, %rdx
1454e79a5:     	jb	0x1454e79ba <.text+0x54e69ba>
1454e79a7:     	movq	0x50(%rax,%r10,8), %rax
1454e79ac:     	jmp	0x1454e795d <.text+0x54e695d>
1454e79ae:     	movl	%r8d, 0x8(%rax,%r10,4)
1454e79b3:     	jmp	0x1454e7856 <.text+0x54e6856>
1454e79b8:     	xorl	%eax, %eax
1454e79ba:     	leaq	0x8b8(%rcx), %rdx
1454e79c1:     	movq	%rdx, 0x28(%rsp)
1454e79c6:     	movq	%rax, 0x30(%rsp)
1454e79cb:     	movq	$0x0, 0x38(%rsp)
1454e79d4:     	movq	%r10, 0x40(%rsp)
1454e79d9:     	movq	$0x498, 0x48(%rsp)      # imm = 0x498
1454e79e2:     	leaq	0x50(%rsp), %rax
1454e79e7:     	leaq	0x28(%rsp), %rdx
1454e79ec:     	movq	%rcx, %rsi
1454e79ef:     	movq	%rax, %rcx
1454e79f2:     	callq	0x145427a50 <.text+0x5426a50>
1454e79f7:     	movq	%rsi, %rcx
1454e79fa:     	jmp	0x1454e7856 <.text+0x54e6856>

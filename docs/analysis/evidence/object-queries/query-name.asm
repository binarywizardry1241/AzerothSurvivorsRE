
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145420890:     	pushq	%rbp
145420891:     	pushq	%r14
145420893:     	pushq	%rsi
145420894:     	pushq	%rdi
145420895:     	pushq	%rbx
145420896:     	subq	$0x70, %rsp
14542089a:     	leaq	0x70(%rsp), %rbp
14542089f:     	movq	$-0x2, -0x8(%rbp)
1454208a7:     	movl	%ecx, %esi
1454208a9:     	leal	-0x2329(%rsi), %edi
1454208af:     	cmpl	$0x3, %edi
1454208b2:     	jae	0x145420909 <.text+0x541f909>
1454208b4:     	leaq	0x130b155(%rip), %rax   # 0x14672ba10
1454208bb:     	movq	%rax, -0x18(%rbp)
1454208bf:     	movq	$0x2, -0x10(%rbp)
1454208c7:     	leaq	-0x18(%rbp), %rax
1454208cb:     	movq	%rax, -0x48(%rbp)
1454208cf:     	leaq	-0x541e816(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454208d6:     	movq	%rax, -0x40(%rbp)
1454208da:     	leaq	0x130b175(%rip), %rdx   # 0x14672ba56
1454208e1:     	leaq	-0x38(%rbp), %rcx
1454208e5:     	leaq	-0x48(%rbp), %r8
1454208e9:     	callq	0x145728390 <.text+0x5727390>
1454208ee:     	movq	-0x30(%rbp), %r9
1454208f2:     	movq	-0x28(%rbp), %rdx
1454208f6:     	cmpl	$0x3, %edi
1454208f9:     	jae	0x145420934 <.text+0x541f934>
1454208fb:     	leaq	0x13154e8(%rip), %rsi   # 0x146735dea
145420902:     	movl	$0xa, %ebx
145420907:     	jmp	0x145420988 <.text+0x541f988>
145420909:     	leal	-0x232c(%rsi), %eax
14542090f:     	cmpl	$0x9, %eax
145420912:     	ja	0x1454209d2 <.text+0x541f9d2>
145420918:     	leaq	0x1319939(%rip), %rcx   # 0x14673a258
14542091f:     	movslq	(%rcx,%rax,4), %rax
145420923:     	addq	%rcx, %rax
145420926:     	jmpq	*%rax
145420928:     	leaq	0x130b0e3(%rip), %rax   # 0x14672ba12
14542092f:     	jmp	0x145420a24 <.text+0x541fa24>
145420934:     	leal	-0x232c(%rsi), %ecx
14542093a:     	cmpl	$0xa, %ecx
14542093d:     	setb	%al
145420940:     	movl	$0x31f, %r8d            # imm = 0x31F
145420946:     	shrl	%cl, %r8d
145420949:     	testb	%r8b, %al
14542094c:     	je	0x145420968 <.text+0x541f968>
14542094e:     	movl	%ecx, %eax
145420950:     	leaq	0x1319811(%rip), %rcx   # 0x14673a168
145420957:     	movq	(%rcx,%rax,8), %rbx
14542095b:     	leaq	0x1319856(%rip), %rcx   # 0x14673a1b8
145420962:     	movq	(%rcx,%rax,8), %rsi
145420966:     	jmp	0x145420988 <.text+0x541f988>
145420968:     	addl	$0xffffdccf, %esi       # imm = 0xFFFFDCCF
14542096e:     	cmpl	$0x3, %esi
145420971:     	leaq	0x131546c(%rip), %rax   # 0x146735de4
145420978:     	leaq	0x131545f(%rip), %rsi   # 0x146735dde
14542097f:     	cmovbq	%rax, %rsi
145420983:     	movl	$0x6, %ebx
145420988:     	movq	%r9, -0x20(%rbp)
14542098c:     	movq	%r9, %rcx
14542098f:     	callq	0x145457cb0 <.text+0x5456cb0>
145420994:     	nop
145420995:     	movq	%rax, %rdi
145420998:     	movq	-0x38(%rbp), %rax
14542099c:     	testq	%rax, %rax
14542099f:     	je	0x1454209b9 <.text+0x541f9b9>
1454209a1:     	movl	$0x1, %r8d
1454209a7:     	movq	-0x20(%rbp), %rcx
1454209ab:     	movq	%rdx, %r14
1454209ae:     	movq	%rax, %rdx
1454209b1:     	callq	0x1400021d0 <.text+0x11d0>
1454209b6:     	movq	%r14, %rdx
1454209b9:     	testq	%rdi, %rdi
1454209bc:     	cmovneq	%rdi, %rsi
1454209c0:     	cmoveq	%rbx, %rdx
1454209c4:     	movq	%rsi, %rax
1454209c7:     	addq	$0x70, %rsp
1454209cb:     	popq	%rbx
1454209cc:     	popq	%rdi
1454209cd:     	popq	%rsi
1454209ce:     	popq	%r14
1454209d0:     	popq	%rbp
1454209d1:     	retq
1454209d2:     	leal	-0x2331(%rsi), %eax
1454209d8:     	cmpl	$0x3, %eax
1454209db:     	jae	0x145420a6e <.text+0x541fa6e>
1454209e1:     	leaq	0x130b055(%rip), %rax   # 0x14672ba3d
1454209e8:     	jmp	0x145420a75 <.text+0x541fa75>
1454209ed:     	leaq	0x130b04f(%rip), %rax   # 0x14672ba43
1454209f4:     	movq	%rax, -0x18(%rbp)
1454209f8:     	movq	$0x9, -0x10(%rbp)
145420a00:     	jmp	0x1454208c7 <.text+0x541f8c7>
145420a05:     	leaq	0x130b00a(%rip), %rax   # 0x14672ba16
145420a0c:     	movq	%rax, -0x18(%rbp)
145420a10:     	movq	$0x5, -0x10(%rbp)
145420a18:     	jmp	0x1454208c7 <.text+0x541f8c7>
145420a1d:     	leaq	0x130b028(%rip), %rax   # 0x14672ba4c
145420a24:     	movq	%rax, -0x18(%rbp)
145420a28:     	movq	$0x4, -0x10(%rbp)
145420a30:     	jmp	0x1454208c7 <.text+0x541f8c7>
145420a35:     	leaq	0x130afdf(%rip), %rax   # 0x14672ba1b
145420a3c:     	movq	%rax, -0x18(%rbp)
145420a40:     	movq	$0xa, -0x10(%rbp)
145420a48:     	jmp	0x1454208c7 <.text+0x541f8c7>
145420a4d:     	leaq	0x130afd1(%rip), %rax   # 0x14672ba25
145420a54:     	jmp	0x145420a5d <.text+0x541fa5d>
145420a56:     	leaq	0x130afd4(%rip), %rax   # 0x14672ba31
145420a5d:     	movq	%rax, -0x18(%rbp)
145420a61:     	movq	$0xc, -0x10(%rbp)
145420a69:     	jmp	0x1454208c7 <.text+0x541f8c7>
145420a6e:     	leaq	0x130afdb(%rip), %rax   # 0x14672ba50
145420a75:     	movq	%rax, -0x18(%rbp)
145420a79:     	movq	$0x6, -0x10(%rbp)
145420a81:     	jmp	0x1454208c7 <.text+0x541f8c7>

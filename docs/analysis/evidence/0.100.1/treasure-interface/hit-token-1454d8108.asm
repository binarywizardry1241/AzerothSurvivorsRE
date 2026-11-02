
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d8108:     	movzbl	0x129(%rsi), %r14d
1454d8110:     	cmpb	$0x3, %r14b
1454d8114:     	je	0x1454d816a <.text+0x54d716a>
1454d8116:     	cmpq	$0x0, 0x718(%rsi)
1454d811e:     	je	0x1454d816a <.text+0x54d716a>
1454d8120:     	xorl	%eax, %eax
1454d8122:     	cmpb	$0x1, %r14b
1454d8126:     	sete	%cl
1454d8129:     	movl	0x128(%rsi), %edx
1454d812f:     	cmovel	%edx, %eax
1454d8132:     	jne	0x1454d818c <.text+0x54d718c>
1454d8134:     	testb	%dl, %dl
1454d8136:     	je	0x1454d8191 <.text+0x54d7191>
1454d8138:     	movq	0xf0(%rsi), %rdx
1454d813f:     	testq	%rdx, %rdx
1454d8142:     	je	0x1454d8165 <.text+0x54d7165>
1454d8144:     	movq	0xe8(%rsi), %r8
1454d814b:     	leaq	(,%rdx,4), %r10
1454d8153:     	xorl	%r9d, %r9d
1454d8156:     	cmpl	%ebx, (%r8,%r9,4)
1454d815a:     	je	0x1454d8196 <.text+0x54d7196>
1454d815c:     	incq	%r9
1454d815f:     	addq	$-0x4, %r10
1454d8163:     	jne	0x1454d8156 <.text+0x54d7156>
1454d8165:     	xorl	%r15d, %r15d
1454d8168:     	jmp	0x1454d81ac <.text+0x54d71ac>
1454d816a:     	movq	0xe0(%rbp), %rcx
1454d8171:     	leaq	-0x1(%rcx), %rax
1454d8175:     	cmpq	$-0x3, %rax
1454d8179:     	ja	0x1454d8355 <.text+0x54d7355>
1454d817f:     	shlq	$0x4, %rcx
1454d8183:     	leaq	(%rcx,%rcx,2), %rdx
1454d8187:     	jmp	0x1454d8343 <.text+0x54d7343>
1454d818c:     	testb	%r14b, %r14b
1454d818f:     	je	0x1454d8138 <.text+0x54d7138>
1454d8191:     	xorl	%r15d, %r15d
1454d8194:     	jmp	0x1454d81f4 <.text+0x54d71f4>
1454d8196:     	movl	-0x4(%r8,%rdx,4), %r10d
1454d819b:     	decq	%rdx
1454d819e:     	movl	%r10d, (%r8,%r9,4)
1454d81a2:     	movq	%rdx, 0xf0(%rsi)
1454d81a9:     	movb	$0x1, %r15b
1454d81ac:     	testb	%r14b, %r14b
1454d81af:     	setne	%dl
1454d81b2:     	movzbl	0x298(%rbp), %r8d
1454d81ba:     	xorb	$0x1, %r8b
1454d81be:     	orb	%dl, %r8b
1454d81c1:     	jne	0x1454d81f4 <.text+0x54d71f4>
1454d81c3:     	movq	0x108(%rsi), %rdx
1454d81ca:     	testq	%rdx, %rdx
1454d81cd:     	je	0x1454d81f4 <.text+0x54d71f4>
1454d81cf:     	movq	0x100(%rsi), %r8
1454d81d6:     	leaq	(,%rdx,4), %r10
1454d81de:     	xorl	%r9d, %r9d
1454d81e1:     	cmpl	%ebx, (%r8,%r9,4)
1454d81e5:     	je	0x1454d83c0 <.text+0x54d73c0>
1454d81eb:     	incq	%r9
1454d81ee:     	addq	$-0x4, %r10
1454d81f2:     	jne	0x1454d81e1 <.text+0x54d71e1>
1454d81f4:     	xorl	%r12d, %r12d
1454d81f7:     	movb	%cl, 0xa5(%rbp)
1454d81fd:     	movl	%ebx, 0x90(%rbp)
1454d8203:     	movzbl	0x290(%rbp), %ecx
1454d820a:     	movb	%cl, 0xa4(%rbp)
1454d8210:     	movzbl	0x298(%rbp), %ecx
1454d8217:     	movb	%cl, 0xa7(%rbp)
1454d821d:     	movq	%rdi, 0x88(%rbp)
1454d8224:     	movlps	%xmm9, 0x94(%rbp)
1454d822c:     	movss	%xmm10, 0x9c(%rbp)
1454d8235:     	movss	%xmm6, 0xa0(%rbp)
1454d823d:     	movb	%r14b, 0xa6(%rbp)
1454d8244:     	movb	%r15b, 0xa8(%rbp)
1454d824b:     	movb	%r12b, 0xa9(%rbp)
1454d8252:     	movb	%al, 0xaa(%rbp)

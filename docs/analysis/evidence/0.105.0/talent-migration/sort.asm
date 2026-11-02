
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459822f0:     	pushq	%r14
1459822f2:     	pushq	%rsi
1459822f3:     	pushq	%rdi
1459822f4:     	pushq	%rbp
1459822f5:     	pushq	%rbx
1459822f6:     	leaq	-0x1(%r8), %rax
1459822fa:     	cmpq	%rdx, %rax
1459822fd:     	jae	0x1459823fe <.text+0x59813fe>
145982303:     	cmpq	%rdx, %r8
145982306:     	jne	0x14598230f <.text+0x598130f>
145982308:     	popq	%rbx
145982309:     	popq	%rbp
14598230a:     	popq	%rdi
14598230b:     	popq	%rsi
14598230c:     	popq	%r14
14598230e:     	retq
14598230f:     	leaq	(%rdx,%rdx,2), %rax
145982313:     	leaq	(%rcx,%rax,8), %rax
145982317:     	shlq	$0x3, %r8
14598231b:     	leaq	(%r8,%r8,2), %rdx
14598231f:     	leaq	(%rcx,%rdx), %r8
145982323:     	jmp	0x14598234b <.text+0x598134b>
145982325:     	nopw	%cs:(%rax,%rax)
145982330:     	movq	%rcx, %rsi
145982333:     	movq	%r9, (%rsi)
145982336:     	movq	%r10, 0x8(%rsi)
14598233a:     	movq	%r11, 0x10(%rsi)
14598233e:     	addq	$0x18, %r8
145982342:     	addq	$0x18, %rdx
145982346:     	cmpq	%rax, %r8
145982349:     	je	0x145982308 <.text+0x5981308>
14598234b:     	movq	-0x18(%r8), %r11
14598234f:     	movq	(%r8), %r9
145982352:     	movq	0x8(%r8), %r10
145982356:     	movzbl	0x71(%r9), %ebx
14598235b:     	xorl	%esi, %esi
14598235d:     	cmpb	0x71(%r11), %bl
145982361:     	setb	%sil
145982365:     	xorl	%edi, %edi
145982367:     	cmpq	-0x10(%r8), %r10
14598236b:     	setb	%dil
14598236f:     	cmovnel	%edi, %esi
145982372:     	movzbl	0x70(%r9), %ebx
145982377:     	xorl	%edi, %edi
145982379:     	cmpb	0x70(%r11), %bl
14598237d:     	setb	%dil
145982381:     	cmovel	%esi, %edi
145982384:     	cmpb	$0x1, %dil
145982388:     	jne	0x14598233e <.text+0x598133e>
14598238a:     	movq	0x10(%r8), %r11
14598238e:     	movq	%rdx, %rsi
145982391:     	nopw	%cs:(%rax,%rax)
1459823a0:     	movq	-0x8(%rcx,%rsi), %rdi
1459823a5:     	movq	%rdi, 0x10(%rcx,%rsi)
1459823aa:     	movups	-0x18(%rcx,%rsi), %xmm0
1459823af:     	movups	%xmm0, (%rcx,%rsi)
1459823b3:     	cmpq	$0x18, %rsi
1459823b7:     	je	0x145982330 <.text+0x5981330>
1459823bd:     	movq	-0x30(%rcx,%rsi), %rdi
1459823c2:     	movzbl	0x71(%r9), %ebx
1459823c7:     	xorl	%ebp, %ebp
1459823c9:     	cmpb	0x71(%rdi), %bl
1459823cc:     	setb	%bpl
1459823d0:     	xorl	%ebx, %ebx
1459823d2:     	cmpq	-0x28(%rcx,%rsi), %r10
1459823d7:     	movzbl	0x70(%r9), %r14d
1459823dc:     	setb	%bl
1459823df:     	cmovnel	%ebx, %ebp
1459823e2:     	xorl	%ebx, %ebx
1459823e4:     	cmpb	0x70(%rdi), %r14b
1459823e8:     	setb	%bl
1459823eb:     	cmovel	%ebp, %ebx
1459823ee:     	addq	$-0x18, %rsi
1459823f2:     	testb	%bl, %bl
1459823f4:     	jne	0x1459823a0 <.text+0x59813a0>
1459823f6:     	addq	%rcx, %rsi
1459823f9:     	jmp	0x145982333 <.text+0x5981333>
1459823fe:     	ud2

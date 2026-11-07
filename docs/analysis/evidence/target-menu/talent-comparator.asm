
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145507670:     	pushq	%r14
145507672:     	pushq	%rsi
145507673:     	pushq	%rdi
145507674:     	pushq	%rbp
145507675:     	pushq	%rbx
145507676:     	leaq	-0x1(%r8), %rax
14550767a:     	cmpq	%rdx, %rax
14550767d:     	jae	0x14550777e <.text+0x550677e>
145507683:     	cmpq	%rdx, %r8
145507686:     	jne	0x14550768f <.text+0x550668f>
145507688:     	popq	%rbx
145507689:     	popq	%rbp
14550768a:     	popq	%rdi
14550768b:     	popq	%rsi
14550768c:     	popq	%r14
14550768e:     	retq
14550768f:     	leaq	(%rdx,%rdx,2), %rax
145507693:     	leaq	(%rcx,%rax,8), %rax
145507697:     	shlq	$0x3, %r8
14550769b:     	leaq	(%r8,%r8,2), %rdx
14550769f:     	leaq	(%rcx,%rdx), %r8
1455076a3:     	jmp	0x1455076cb <.text+0x55066cb>
1455076a5:     	nopw	%cs:(%rax,%rax)
1455076b0:     	movq	%rcx, %rsi
1455076b3:     	movq	%r9, (%rsi)
1455076b6:     	movq	%r10, 0x8(%rsi)
1455076ba:     	movq	%r11, 0x10(%rsi)
1455076be:     	addq	$0x18, %r8
1455076c2:     	addq	$0x18, %rdx
1455076c6:     	cmpq	%rax, %r8
1455076c9:     	je	0x145507688 <.text+0x5506688>
1455076cb:     	movq	-0x18(%r8), %r11
1455076cf:     	movq	(%r8), %r9
1455076d2:     	movq	0x8(%r8), %r10
1455076d6:     	movzbl	0x61(%r9), %ebx
1455076db:     	xorl	%esi, %esi
1455076dd:     	cmpb	0x61(%r11), %bl
1455076e1:     	setb	%sil
1455076e5:     	xorl	%edi, %edi
1455076e7:     	cmpq	-0x10(%r8), %r10
1455076eb:     	setb	%dil
1455076ef:     	cmovnel	%edi, %esi
1455076f2:     	movzbl	0x60(%r9), %ebx
1455076f7:     	xorl	%edi, %edi
1455076f9:     	cmpb	0x60(%r11), %bl
1455076fd:     	setb	%dil
145507701:     	cmovel	%esi, %edi
145507704:     	cmpb	$0x1, %dil
145507708:     	jne	0x1455076be <.text+0x55066be>
14550770a:     	movq	0x10(%r8), %r11
14550770e:     	movq	%rdx, %rsi
145507711:     	nopw	%cs:(%rax,%rax)
145507720:     	movq	-0x8(%rcx,%rsi), %rdi
145507725:     	movq	%rdi, 0x10(%rcx,%rsi)
14550772a:     	movups	-0x18(%rcx,%rsi), %xmm0
14550772f:     	movups	%xmm0, (%rcx,%rsi)
145507733:     	cmpq	$0x18, %rsi
145507737:     	je	0x1455076b0 <.text+0x55066b0>
14550773d:     	movq	-0x30(%rcx,%rsi), %rdi
145507742:     	movzbl	0x61(%r9), %ebx
145507747:     	xorl	%ebp, %ebp
145507749:     	cmpb	0x61(%rdi), %bl
14550774c:     	setb	%bpl
145507750:     	xorl	%ebx, %ebx
145507752:     	cmpq	-0x28(%rcx,%rsi), %r10
145507757:     	movzbl	0x60(%r9), %r14d
14550775c:     	setb	%bl
14550775f:     	cmovnel	%ebx, %ebp
145507762:     	xorl	%ebx, %ebx
145507764:     	cmpb	0x60(%rdi), %r14b
145507768:     	setb	%bl
14550776b:     	cmovel	%ebp, %ebx
14550776e:     	addq	$-0x18, %rsi
145507772:     	testb	%bl, %bl
145507774:     	jne	0x145507720 <.text+0x5506720>
145507776:     	addq	%rcx, %rsi
145507779:     	jmp	0x1455076b3 <.text+0x55066b3>
14550777e:     	ud2

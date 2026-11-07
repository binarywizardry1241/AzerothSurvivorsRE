
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e27c0:     	pushq	%r15
1458e27c2:     	pushq	%r14
1458e27c4:     	pushq	%r13
1458e27c6:     	pushq	%r12
1458e27c8:     	pushq	%rsi
1458e27c9:     	pushq	%rdi
1458e27ca:     	pushq	%rbp
1458e27cb:     	pushq	%rbx
1458e27cc:     	subq	$0x68, %rsp
1458e27d0:     	movq	%r9, %r14
1458e27d3:     	movq	%r8, %r15
1458e27d6:     	movl	%edx, %ebx
1458e27d8:     	movq	%rcx, %rsi
1458e27db:     	movl	%edx, %ecx
1458e27dd:     	movq	%r8, %rdx
1458e27e0:     	movq	%r9, %r8
1458e27e3:     	callq	0x1458e6190 <.text+0x58e5190>
1458e27e8:     	testq	%rdx, %rdx
1458e27eb:     	je	0x1458e2934 <.text+0x58e1934>
1458e27f1:     	movq	%rax, %r8
1458e27f4:     	movq	%rdx, %rdi
1458e27f7:     	movl	0xd0(%rsp), %ecx
1458e27fe:     	movq	0x10(%rsi), %r13
1458e2802:     	testq	%r13, %r13
1458e2805:     	je	0x1458e2823 <.text+0x58e1823>
1458e2807:     	movq	%r8, 0x30(%rsp)
1458e280c:     	movq	0x8(%rsi), %rbp
1458e2810:     	movl	%r13d, %eax
1458e2813:     	andl	$0x3, %eax
1458e2816:     	cmpq	$0x4, %r13
1458e281a:     	jae	0x1458e283b <.text+0x58e183b>
1458e281c:     	xorl	%r8d, %r8d
1458e281f:     	xorl	%edx, %edx
1458e2821:     	jmp	0x1458e2881 <.text+0x58e1881>
1458e2823:     	xorl	%eax, %eax
1458e2825:     	testl	%ecx, %ecx
1458e2827:     	je	0x1458e2936 <.text+0x58e1936>
1458e282d:     	cmpb	0x72(%rdi), %al
1458e2830:     	jae	0x1458e2934 <.text+0x58e1934>
1458e2836:     	jmp	0x1458e2905 <.text+0x58e1905>
1458e283b:     	movq	%r13, %r9
1458e283e:     	andq	$-0x4, %r9
1458e2842:     	leaq	0x38(%rbp), %r10
1458e2846:     	xorl	%r8d, %r8d
1458e2849:     	xorl	%edx, %edx
1458e284b:     	nopl	(%rax,%rax)
1458e2850:     	movzbl	-0x30(%r10), %r11d
1458e2855:     	addl	%edx, %r11d
1458e2858:     	movzbl	-0x20(%r10), %edx
1458e285d:     	movzbl	-0x10(%r10), %r12d
1458e2862:     	addl	%edx, %r12d
1458e2865:     	addl	%r11d, %r12d
1458e2868:     	movzbl	(%r10), %edx
1458e286c:     	addl	%r12d, %edx
1458e286f:     	addq	$0x4, %r8
1458e2873:     	addq	$0x40, %r10
1458e2877:     	cmpq	%r8, %r9
1458e287a:     	jne	0x1458e2850 <.text+0x58e1850>
1458e287c:     	testq	%rax, %rax
1458e287f:     	je	0x1458e28b1 <.text+0x58e18b1>
1458e2881:     	shlq	$0x4, %r8
1458e2885:     	addq	%rbp, %r8
1458e2888:     	addq	$0x8, %r8
1458e288c:     	shll	$0x4, %eax
1458e288f:     	xorl	%r9d, %r9d
1458e2892:     	nopw	%cs:(%rax,%rax)
1458e28a0:     	movzbl	(%r8,%r9), %r10d
1458e28a5:     	addl	%r10d, %edx
1458e28a8:     	addq	$0x10, %r9
1458e28ac:     	cmpq	%r9, %rax
1458e28af:     	jne	0x1458e28a0 <.text+0x58e18a0>
1458e28b1:     	cmpl	%ecx, %edx
1458e28b3:     	jae	0x1458e2934 <.text+0x58e1934>
1458e28b5:     	shlq	$0x4, %r13
1458e28b9:     	xorl	%r12d, %r12d
1458e28bc:     	jmp	0x1458e28c9 <.text+0x58e18c9>
1458e28be:     	nop
1458e28c0:     	addq	$0x10, %r12
1458e28c4:     	cmpq	%r12, %r13
1458e28c7:     	je	0x1458e28f9 <.text+0x58e18f9>
1458e28c9:     	movq	(%rbp,%r12), %rax
1458e28ce:     	cmpq	%r14, 0x28(%rax)
1458e28d2:     	jne	0x1458e28c0 <.text+0x58e18c0>
1458e28d4:     	movq	0x20(%rax), %rcx
1458e28d8:     	movq	%r15, %rdx
1458e28db:     	movq	%r14, %r8
1458e28de:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e28e3:     	testl	%eax, %eax
1458e28e5:     	jne	0x1458e28c0 <.text+0x58e18c0>
1458e28e7:     	movzbl	0x8(%rbp,%r12), %eax
1458e28ed:     	movq	0x30(%rsp), %r8
1458e28f2:     	cmpb	0x72(%rdi), %al
1458e28f5:     	jb	0x1458e2905 <.text+0x58e1905>
1458e28f7:     	jmp	0x1458e2934 <.text+0x58e1934>
1458e28f9:     	xorl	%eax, %eax
1458e28fb:     	movq	0x30(%rsp), %r8
1458e2900:     	cmpb	0x72(%rdi), %al
1458e2903:     	jae	0x1458e2934 <.text+0x58e1934>
1458e2905:     	movzbl	0x70(%rdi), %r9d
1458e290a:     	movq	%rsi, %rcx
1458e290d:     	movl	%ebx, %edx
1458e290f:     	callq	0x1458e29a0 <.text+0x58e19a0>
1458e2914:     	movzbl	0x70(%rdi), %ecx
1458e2918:     	leal	(%rcx,%rcx,4), %ecx
1458e291b:     	cmpl	%ecx, %eax
1458e291d:     	jb	0x1458e2934 <.text+0x58e1934>
1458e291f:     	movq	%rsi, %rcx
1458e2922:     	movl	%ebx, %edx
1458e2924:     	movq	%r15, %r8
1458e2927:     	movq	%r14, %r9
1458e292a:     	callq	0x1458e2070 <.text+0x58e1070>
1458e292f:     	testq	%rax, %rax
1458e2932:     	je	0x1458e2947 <.text+0x58e1947>
1458e2934:     	xorl	%eax, %eax
1458e2936:     	addq	$0x68, %rsp
1458e293a:     	popq	%rbx
1458e293b:     	popq	%rbp
1458e293c:     	popq	%rdi
1458e293d:     	popq	%rsi
1458e293e:     	popq	%r12
1458e2940:     	popq	%r13
1458e2942:     	popq	%r14
1458e2944:     	popq	%r15
1458e2946:     	retq
1458e2947:     	movb	%bl, 0x2f(%rsp)
1458e294b:     	movq	(%rdi), %rax
1458e294e:     	testq	%rax, %rax
1458e2951:     	je	0x1458e2990 <.text+0x58e1990>
1458e2953:     	movq	0x8(%rdi), %rcx
1458e2957:     	movups	0x10(%rdi), %xmm0
1458e295b:     	movq	$0x1, 0x38(%rsp)
1458e2964:     	movq	%rax, 0x40(%rsp)
1458e2969:     	movq	%rcx, 0x48(%rsp)
1458e296e:     	movq	$0x1, 0x50(%rsp)
1458e2977:     	movups	%xmm0, 0x58(%rsp)
1458e297c:     	leaq	0x38(%rsp), %rcx
1458e2981:     	leaq	0x2f(%rsp), %rdx
1458e2986:     	movq	%rsi, %r8
1458e2989:     	callq	0x1458b9220 <.text+0x58b8220>
1458e298e:     	jmp	0x1458e2936 <.text+0x58e1936>
1458e2990:     	movb	$0x1, %al
1458e2992:     	jmp	0x1458e2936 <.text+0x58e1936>

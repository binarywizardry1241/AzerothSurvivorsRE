
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458d6970:     	leaq	-0x2(%r8), %rax
1458d6974:     	cmpq	$0x6, %rax
1458d6978:     	ja	0x1458d6ae7 <.text+0x58d5ae7>
1458d697e:     	leaq	0x12ec347(%rip), %rcx   # 0x146bc2ccc
1458d6985:     	movslq	(%rcx,%rax,4), %rax
1458d6989:     	addq	%rcx, %rax
1458d698c:     	jmpq	*%rax
1458d698e:     	movzwl	0x12cd75c(%rip), %ecx   # 0x146ba40f1
1458d6995:     	movl	$0x1, %eax
1458d699a:     	cmpw	(%rdx), %cx
1458d699d:     	je	0x1458d6afb <.text+0x58d5afb>
1458d69a3:     	movzwl	0x12cf566(%rip), %ecx   # 0x146ba5f10
1458d69aa:     	cmpw	(%rdx), %cx
1458d69ad:     	je	0x1458d6b0f <.text+0x58d5b0f>
1458d69b3:     	movzwl	0x12cffd8(%rip), %ecx   # 0x146ba6992
1458d69ba:     	cmpw	(%rdx), %cx
1458d69bd:     	je	0x1458d6b15 <.text+0x58d5b15>
1458d69c3:     	movzwl	0x12d145d(%rip), %ecx   # 0x146ba7e27
1458d69ca:     	cmpw	(%rdx), %cx
1458d69cd:     	jne	0x1458d6ace <.text+0x58d5ace>
1458d69d3:     	movl	$0xa, %edx
1458d69d8:     	retq
1458d69d9:     	movzwl	0x12cc2a6(%rip), %ecx   # 0x146ba2c86
1458d69e0:     	xorw	(%rdx), %cx
1458d69e3:     	movzbl	0x12cc29e(%rip), %eax   # 0x146ba2c88
1458d69ea:     	xorb	0x2(%rdx), %al
1458d69ed:     	movzbl	%al, %r9d
1458d69f1:     	movl	$0x1, %eax
1458d69f6:     	orw	%cx, %r9w
1458d69fa:     	je	0x1458d6af5 <.text+0x58d5af5>
1458d6a00:     	movzwl	0x12d094a(%rip), %ecx   # 0x146ba7351
1458d6a07:     	xorw	(%rdx), %cx
1458d6a0a:     	movzbl	0x12d0941(%rip), %r9d   # 0x146ba7353
1458d6a12:     	xorb	0x2(%rdx), %r9b
1458d6a16:     	movzbl	%r9b, %r9d
1458d6a1a:     	orw	%cx, %r9w
1458d6a1e:     	jne	0x1458d6ace <.text+0x58d5ace>
1458d6a24:     	movl	$0x9, %edx
1458d6a29:     	retq
1458d6a2a:     	movl	0x12caf78(%rip), %ecx   # 0x146ba19a8
1458d6a30:     	xorl	(%rdx), %ecx
1458d6a32:     	movzwl	0x12caf73(%rip), %eax   # 0x146ba19ac
1458d6a39:     	xorw	0x4(%rdx), %ax
1458d6a3d:     	movzwl	%ax, %r9d
1458d6a41:     	movl	$0x1, %eax
1458d6a46:     	orl	%ecx, %r9d
1458d6a49:     	je	0x1458d6b01 <.text+0x58d5b01>
1458d6a4f:     	movl	0x12cccb2(%rip), %ecx   # 0x146ba3707
1458d6a55:     	xorl	(%rdx), %ecx
1458d6a57:     	movzwl	0x12cccac(%rip), %r9d   # 0x146ba370b
1458d6a5f:     	xorw	0x4(%rdx), %r9w
1458d6a64:     	movzwl	%r9w, %r9d
1458d6a68:     	orl	%ecx, %r9d
1458d6a6b:     	jne	0x1458d6a83 <.text+0x58d5a83>
1458d6a6d:     	movl	$0x3, %edx
1458d6a72:     	retq
1458d6a73:     	movq	0x12cb889(%rip), %rax   # 0x146ba2303
1458d6a7a:     	cmpq	(%rdx), %rax
1458d6a7d:     	je	0x1458d6b04 <.text+0x58d5b04>
1458d6a83:     	cmpq	$0x4, %r8
1458d6a87:     	je	0x1458d6ad4 <.text+0x58d5ad4>
1458d6a89:     	cmpq	$0x5, %r8
1458d6a8d:     	je	0x1458d6ab5 <.text+0x58d5ab5>
1458d6a8f:     	cmpq	$0x7, %r8
1458d6a93:     	jne	0x1458d6ae7 <.text+0x58d5ae7>
1458d6a95:     	movl	0x12ce095(%rip), %eax   # 0x146ba4b30
1458d6a9b:     	xorl	(%rdx), %eax
1458d6a9d:     	movl	0x12ce090(%rip), %ecx   # 0x146ba4b33
1458d6aa3:     	xorl	0x3(%rdx), %ecx
1458d6aa6:     	orl	%eax, %ecx
1458d6aa8:     	jne	0x1458d6ace <.text+0x58d5ace>
1458d6aaa:     	movl	$0x1, %eax
1458d6aaf:     	movl	$0x5, %edx
1458d6ab4:     	retq
1458d6ab5:     	movl	0x12cea1b(%rip), %eax   # 0x146ba54d6
1458d6abb:     	xorl	(%rdx), %eax
1458d6abd:     	movzbl	0x12cea16(%rip), %ecx   # 0x146ba54da
1458d6ac4:     	xorb	0x4(%rdx), %cl
1458d6ac7:     	movzbl	%cl, %ecx
1458d6aca:     	orl	%eax, %ecx
1458d6acc:     	je	0x1458d6aea <.text+0x58d5aea>
1458d6ace:     	cmpq	$0x4, %r8
1458d6ad2:     	jne	0x1458d6ae7 <.text+0x58d5ae7>
1458d6ad4:     	movl	0x12d1d28(%rip), %ecx   # 0x146ba8802
1458d6ada:     	xorl	%eax, %eax
1458d6adc:     	cmpl	(%rdx), %ecx
1458d6ade:     	sete	%al
1458d6ae1:     	movl	$0xb, %edx
1458d6ae6:     	retq
1458d6ae7:     	xorl	%eax, %eax
1458d6ae9:     	retq
1458d6aea:     	movl	$0x1, %eax
1458d6aef:     	movl	$0x6, %edx
1458d6af4:     	retq
1458d6af5:     	movl	$0x2, %edx
1458d6afa:     	retq
1458d6afb:     	movl	$0x4, %edx
1458d6b00:     	retq
1458d6b01:     	xorl	%edx, %edx
1458d6b03:     	retq
1458d6b04:     	movl	$0x1, %edx
1458d6b09:     	movl	$0x1, %eax
1458d6b0e:     	retq
1458d6b0f:     	movl	$0x7, %edx
1458d6b14:     	retq
1458d6b15:     	movl	$0x8, %edx
1458d6b1a:     	retq

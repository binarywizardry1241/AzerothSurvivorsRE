Disassembly of section .text:

0000000140001000 <.text>:
140639a80:     	pushq	%rsi
140639a81:     	pushq	%rdi
140639a82:     	movq	%rcx, %rax
140639a85:     	cmpq	$0x0, 0x90(%rdx)
140639a8d:     	je	0x140639b2b <.text+0x638b2b>
140639a93:     	movq	0x78(%rdx), %rcx
140639a97:     	movq	0x80(%rdx), %r8
140639a9e:     	movabsq	$0x30402193ab907194, %r9 # imm = 0x30402193AB907194
140639aa8:     	xorl	%r10d, %r10d
140639aab:     	movdqa	0x573422d(%rip), %xmm0  # 0x145d6dce0
140639ab3:     	pcmpeqd	%xmm1, %xmm1
140639ab7:     	movdqa	0x5821db1(%rip), %xmm2  # 0x145e5b870
140639abf:     	andq	%r8, %r9
140639ac2:     	movdqu	(%rcx,%r9), %xmm3
140639ac8:     	movdqa	%xmm3, %xmm4
140639acc:     	pcmpeqb	%xmm0, %xmm4
140639ad0:     	pmovmskb	%xmm4, %r11d
140639ad5:     	testl	%r11d, %r11d
140639ad8:     	je	0x140639b10 <.text+0x638b10>
140639ada:     	tzcntl	%r11d, %esi
140639adf:     	addq	%r9, %rsi
140639ae2:     	andq	%r8, %rsi
140639ae5:     	negq	%rsi
140639ae8:     	leaq	(%rsi,%rsi,2), %rsi
140639aec:     	movdqu	-0x18(%rcx,%rsi,8), %xmm4
140639af2:     	pcmpeqb	%xmm2, %xmm4
140639af6:     	pmovmskb	%xmm4, %edi
140639afa:     	cmpl	$0xffff, %edi           # imm = 0xFFFF
140639b00:     	je	0x140639b32 <.text+0x638b32>
140639b02:     	leal	-0x1(%r11), %esi
140639b06:     	andw	%r11w, %si
140639b0a:     	movl	%esi, %r11d
140639b0d:     	jne	0x140639ada <.text+0x638ada>
140639b0f:     	nop
140639b10:     	pcmpeqb	%xmm1, %xmm3
140639b14:     	pmovmskb	%xmm3, %r11d
140639b19:     	testl	%r11d, %r11d
140639b1c:     	jne	0x140639b2b <.text+0x638b2b>
140639b1e:     	addq	%r10, %r9
140639b21:     	addq	$0x10, %r9
140639b25:     	addq	$0x10, %r10
140639b29:     	jmp	0x140639abf <.text+0x638abf>
140639b2b:     	xorl	%ecx, %ecx
140639b2d:     	movl	%ecx, (%rax)
140639b2f:     	popq	%rdi
140639b30:     	popq	%rsi
140639b31:     	retq
140639b32:     	leaq	(%rcx,%rsi,8), %rcx
140639b36:     	movq	-0x8(%rcx), %r8
140639b3a:     	xorl	%ecx, %ecx
140639b3c:     	cmpq	0x218(%rdx), %r8
140639b43:     	jae	0x140639b2d <.text+0x638b2d>
140639b45:     	movq	0x210(%rdx), %r9
140639b4c:     	movq	(%r9,%r8,8), %r8
140639b50:     	testq	%r8, %r8
140639b53:     	je	0x140639b2d <.text+0x638b2d>
140639b55:     	movq	0x1e0(%rdx), %rdx
140639b5c:     	notq	%r8
140639b5f:     	imulq	$0x38, %r8, %r8
140639b63:     	cmpb	$0x1, 0x30(%rdx,%r8)
140639b69:     	jne	0x140639b2d <.text+0x638b2d>
140639b6b:     	addq	%r8, %rdx
140639b6e:     	movq	0x10(%rdx), %rdx
140639b72:     	testb	$0x1, (%rdx)
140639b75:     	je	0x140639b2d <.text+0x638b2d>
140639b77:     	movups	0x10(%rdx), %xmm0
140639b7b:     	movups	%xmm0, 0x4(%rax)
140639b7f:     	movl	$0x1, %ecx
140639b84:     	movl	%ecx, (%rax)
140639b86:     	popq	%rdi
140639b87:     	popq	%rsi
140639b88:     	retq

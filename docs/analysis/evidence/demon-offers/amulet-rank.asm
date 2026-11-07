
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14587af80:     	pushq	%rsi
14587af81:     	pushq	%rdi
14587af82:     	subq	$0x48, %rsp
14587af86:     	movq	%rdx, %rdi
14587af89:     	movq	%rcx, %rsi
14587af8c:     	cmpq	$0x1d, 0x10(%rdx)
14587af91:     	jne	0x14587afc3 <.text+0x5879fc3>
14587af93:     	movq	0x8(%rdi), %rax
14587af97:     	movdqu	(%rax), %xmm0
14587af9b:     	movdqu	0xd(%rax), %xmm1
14587afa0:     	pcmpeqb	0x13380f8(%rip), %xmm1  # 0x146bb30a0
14587afa8:     	pcmpeqb	0x1338100(%rip), %xmm0  # 0x146bb30b0
14587afb0:     	pand	%xmm1, %xmm0
14587afb4:     	pmovmskb	%xmm0, %eax
14587afb8:     	cmpl	$0xffff, %eax           # imm = 0xFFFF
14587afbd:     	je	0x14587b055 <.text+0x587a055>
14587afc3:     	movq	0x60(%rdi), %rax
14587afc7:     	cmpq	$0x4, %rax
14587afcb:     	movl	$0x4, %ecx
14587afd0:     	cmovbq	%rax, %rcx
14587afd4:     	movl	%ecx, %eax
14587afd6:     	leaq	0x133b4e7(%rip), %rcx   # 0x146bb64c4
14587afdd:     	movss	(%rcx,%rax,4), %xmm0
14587afe2:     	mulss	0x4f5cc6(%rip), %xmm0   # 0x145d70cb0
14587afea:     	addss	0x4f237a(%rip), %xmm0   # 0x145d6d36c
14587aff2:     	cmpl	$0x1, %r8d
14587aff6:     	adcl	$-0x1, %r8d
14587affa:     	xorps	%xmm1, %xmm1
14587affd:     	cvtsi2ss	%r8d, %xmm1
14587b002:     	callq	0x145bc9805 <.text+0x5bc8805>
14587b007:     	addss	%xmm0, %xmm0
14587b00b:     	movss	0x4f5c29(%rip), %xmm1   # 0x145d70c3c
14587b013:     	subss	%xmm0, %xmm1
14587b017:     	movss	%xmm1, 0x2c(%rsp)
14587b01d:     	movq	0x38(%rdi), %rax
14587b021:     	movq	0x40(%rdi), %rcx
14587b025:     	shlq	$0x6, %rcx
14587b029:     	addq	%rax, %rcx
14587b02c:     	movq	%rax, 0x30(%rsp)
14587b031:     	movq	%rcx, 0x38(%rsp)
14587b036:     	leaq	0x2c(%rsp), %rax
14587b03b:     	movq	%rax, 0x40(%rsp)
14587b040:     	leaq	0x30(%rsp), %rdx
14587b045:     	movq	%rsi, %rcx
14587b048:     	callq	0x1459a8f10 <.text+0x59a7f10>
14587b04d:     	nop
14587b04e:     	addq	$0x48, %rsp
14587b052:     	popq	%rdi
14587b053:     	popq	%rsi
14587b054:     	retq
14587b055:     	cmpl	$0x4, %r8d
14587b059:     	movl	$0x3, %eax
14587b05e:     	cmovael	%r8d, %eax
14587b062:     	cmpl	$0xa, %eax
14587b065:     	movl	$0xa, %ecx
14587b06a:     	cmovbl	%eax, %ecx
14587b06d:     	addl	$-0x3, %ecx
14587b070:     	xorps	%xmm0, %xmm0
14587b073:     	cvtsi2ss	%ecx, %xmm0
14587b077:     	movq	0x38(%rdi), %rax
14587b07b:     	divss	0x5435bd(%rip), %xmm0   # 0x145dbe640
14587b083:     	movq	0x40(%rdi), %rcx
14587b087:     	movss	%xmm0, 0x2c(%rsp)
14587b08d:     	shlq	$0x6, %rcx
14587b091:     	addq	%rax, %rcx
14587b094:     	movq	%rax, 0x30(%rsp)
14587b099:     	movq	%rcx, 0x38(%rsp)
14587b09e:     	leaq	0x2c(%rsp), %rax
14587b0a3:     	movq	%rax, 0x40(%rsp)
14587b0a8:     	leaq	0x30(%rsp), %rdx
14587b0ad:     	movq	%rsi, %rcx
14587b0b0:     	callq	0x1459a9020 <.text+0x59a8020>
14587b0b5:     	nop
14587b0b6:     	addq	$0x48, %rsp
14587b0ba:     	popq	%rdi
14587b0bb:     	popq	%rsi
14587b0bc:     	retq

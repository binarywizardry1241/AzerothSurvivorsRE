
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145919949:     	leaq	0x958(%r13), %rcx
145919950:     	leaq	0x15601f1(%rip), %rdx   # 0x146e79b48
145919957:     	callq	0x145961e80 <.text+0x5960e80>
14591995c:     	movq	%rax, %rdi
14591995f:     	movq	0x290(%r13), %r14
145919966:     	movq	0x298(%r13), %r15
14591996d:     	movq	%r14, %rcx
145919970:     	movq	%r15, %rdx
145919973:     	callq	0x1458753b0 <.text+0x58743b0>
145919978:     	imulq	$0xf0, %rax, %rax
14591997f:     	leaq	0x128faca(%rip), %rcx   # 0x146ba9450
145919986:     	movq	0x88(%rax,%rcx), %rax
14591998e:     	cmpq	$-0x160, %rax           # imm = 0xFEA0
145919994:     	je	0x1459199a8 <.text+0x59189a8>
145919996:     	movss	0x1a0(%rax), %xmm6
14591999e:     	mulss	0x4a5bda(%rip), %xmm6   # 0x145dbf580
1459199a6:     	jmp	0x1459199b0 <.text+0x59189b0>
1459199a8:     	movss	0x155ebb4(%rip), %xmm6  # 0x146e78564
1459199b0:     	movq	%rdi, %rcx
1459199b3:     	shrq	%rcx
1459199b6:     	movl	%edi, %eax
1459199b8:     	andl	$0x1, %eax
1459199bb:     	orq	%rcx, %rax
1459199be:     	leaq	0x728(%r13), %rbx
1459199c5:     	testq	%rdi, %rdi
1459199c8:     	js	0x145919b42 <.text+0x5918b42>
1459199ce:     	cvtsi2ss	%rdi, %xmm0
1459199d3:     	movq	$0x0, 0x738(%r13)
1459199de:     	je	0x145919b5c <.text+0x5918b5c>
1459199e4:     	divss	%xmm0, %xmm6
1459199e8:     	xorl	%esi, %esi
1459199ea:     	movss	0x45a322(%rip), %xmm7   # 0x145d73d14
1459199f2:     	movss	0x155eb6d(%rip), %xmm8  # 0x146e78568
1459199fb:     	movss	0x45a604(%rip), %xmm9   # 0x145d74008
145919a04:     	movss	0x45395f(%rip), %xmm10  # 0x145d6d36c
145919a0d:     	jmp	0x145919a46 <.text+0x5918a46>
145919a0f:     	nop
145919a10:     	mulss	%xmm6, %xmm12
145919a15:     	mulss	%xmm6, %xmm11
145919a1a:     	addss	%xmm12, %xmm11
145919a1f:     	movq	0x730(%r13), %rax
145919a26:     	movss	%xmm12, (%rax,%rsi,8)
145919a2c:     	movss	%xmm11, 0x4(%rax,%rsi,8)
145919a33:     	incq	%rsi
145919a36:     	movq	%rsi, 0x738(%r13)
145919a3d:     	cmpq	%rdi, %rsi
145919a40:     	je	0x145919b24 <.text+0x5918b24>
145919a46:     	movq	0x958(%r13), %rdx
145919a4d:     	movq	0x960(%r13), %rax
145919a54:     	movq	0x970(%r13), %r8
145919a5b:     	movq	0x968(%r13), %rcx
145919a62:     	nopw	%cs:(%rax,%rax)
145919a70:     	leaq	(%rdx,%r8), %r9
145919a74:     	rolq	$0x17, %r9
145919a78:     	addq	%rdx, %r9
145919a7b:     	movq	%rax, %r10
145919a7e:     	shlq	$0x11, %r10
145919a82:     	xorq	%rdx, %rcx
145919a85:     	xorq	%rax, %r8
145919a88:     	xorq	%rcx, %rax
145919a8b:     	xorq	%r8, %rdx
145919a8e:     	xorq	%r10, %rcx
145919a91:     	rolq	$0x2d, %r8
145919a95:     	shrq	$0x29, %r9
145919a99:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
145919aa0:     	movd	%r9d, %xmm11
145919aa5:     	addss	%xmm7, %xmm11
145919aaa:     	mulss	%xmm8, %xmm11
145919aaf:     	addss	%xmm9, %xmm11
145919ab4:     	ucomiss	%xmm11, %xmm10
145919ab8:     	jbe	0x145919a70 <.text+0x5918a70>
145919aba:     	testq	%rsi, %rsi
145919abd:     	js	0x145919ad0 <.text+0x5918ad0>
145919abf:     	xorps	%xmm12, %xmm12
145919ac3:     	cvtsi2ss	%rsi, %xmm12
145919ac8:     	jmp	0x145919aee <.text+0x5918aee>
145919aca:     	nopw	(%rax,%rax)
145919ad0:     	movq	%rsi, %r9
145919ad3:     	shrq	%r9
145919ad6:     	movl	%esi, %r10d
145919ad9:     	andl	$0x1, %r10d
145919add:     	orq	%r9, %r10
145919ae0:     	xorps	%xmm12, %xmm12
145919ae4:     	cvtsi2ss	%r10, %xmm12
145919ae9:     	addss	%xmm12, %xmm12
145919aee:     	movq	%rdx, 0x958(%r13)
145919af5:     	movq	%r8, 0x970(%r13)
145919afc:     	movq	%rax, 0x960(%r13)
145919b03:     	movq	%rcx, 0x968(%r13)
145919b0a:     	cmpq	0x728(%r13), %rsi
145919b11:     	jne	0x145919a10 <.text+0x5918a10>
145919b17:     	movq	%rbx, %rcx
145919b1a:     	callq	0x145bfb120 <.text+0x5bfa120>
145919b1f:     	jmp	0x145919a10 <.text+0x5918a10>

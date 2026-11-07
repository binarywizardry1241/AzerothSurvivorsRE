
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145491906:     	movzbl	0x285(%rdi), %r15d
14549190e:     	leal	-0x2(%r15), %r13d
145491912:     	movl	$0x1, %r8d
145491918:     	cmpb	$0x6, %r13b
14549191c:     	ja	0x14549192d <.text+0x549092d>
14549191e:     	movzbl	%r13b, %eax
145491922:     	leaq	0x151b18f(%rip), %rcx   # 0x1469acab8
145491929:     	movl	(%rcx,%rax,4), %r8d
14549192d:     	movq	0x28(%rbp), %rax
145491931:     	testq	%rax, %rax
145491934:     	je	0x145491997 <.text+0x5490997>
145491936:     	movq	0x30(%rbp), %rcx
14549193a:     	movw	$0x23, %dx
14549193e:     	movzwl	0x36(%rax), %r10d
145491943:     	movl	%r10d, %r11d
145491946:     	addl	%r11d, %r11d
145491949:     	movq	$-0x1, %r9
145491950:     	testq	%r11, %r11
145491953:     	je	0x145491980 <.text+0x5490980>
145491955:     	cmpw	0x3a(%rax,%r9,2), %dx
14549195b:     	seta	%sil
14549195f:     	sbbb	$0x0, %sil
145491963:     	incq	%r9
145491966:     	addq	$-0x2, %r11
14549196a:     	cmpb	$0x1, %sil
14549196e:     	je	0x145491950 <.text+0x5490950>
145491970:     	movzbl	%sil, %r10d
145491974:     	testl	%r10d, %r10d
145491977:     	je	0x145491990 <.text+0x5490990>
145491979:     	jmp	0x145491983 <.text+0x5490983>
14549197b:     	nopl	(%rax,%rax)
145491980:     	movq	%r10, %r9
145491983:     	subq	$0x1, %rcx
145491987:     	jb	0x145491999 <.text+0x5490999>
145491989:     	movq	0x50(%rax,%r9,8), %rax
14549198e:     	jmp	0x14549193e <.text+0x549093e>
145491990:     	movl	%r8d, 0x8(%rax,%r9,4)
145491995:     	jmp	0x1454919c3 <.text+0x54909c3>
145491997:     	xorl	%eax, %eax
145491999:     	movq	%rbx, -0x28(%rbp)
14549199d:     	movq	%rax, -0x20(%rbp)
1454919a1:     	movq	$0x0, -0x18(%rbp)
1454919a9:     	movq	%r9, -0x10(%rbp)
1454919ad:     	movq	$0x23, -0x8(%rbp)
1454919b5:     	leaq	-0x48(%rbp), %rcx
1454919b9:     	leaq	-0x28(%rbp), %rdx
1454919bd:     	callq	0x145427a50 <.text+0x5426a50>
1454919c2:     	nop

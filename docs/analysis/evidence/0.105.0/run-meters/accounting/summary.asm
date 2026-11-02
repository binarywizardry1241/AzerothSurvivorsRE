
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458fcc54:     	callq	0x1458d9670 <.text+0x58d8670>
1458fcc59:     	nop
1458fcc5a:     	movq	0x668(%r14), %rdi
1458fcc61:     	movq	0x670(%r14), %r14
1458fcc68:     	testq	%r14, %r14
1458fcc6b:     	je	0x1458fcc93 <.text+0x58fbc93>
1458fcc6d:     	movl	%r14d, %eax
1458fcc70:     	andl	$0x3, %eax
1458fcc73:     	cmpq	$0x4, %r14
1458fcc77:     	jae	0x1458fccae <.text+0x58fbcae>
1458fcc79:     	movsd	0x4af8f7(%rip), %xmm0   # 0x145dac578
1458fcc81:     	xorl	%ecx, %ecx
1458fcc83:     	movq	0x118(%rbp), %rsi
1458fcc8a:     	movq	0x120(%rbp), %r15
1458fcc91:     	jmp	0x1458fcd10 <.text+0x58fbd10>
1458fcc93:     	movsd	0x4af8dd(%rip), %xmm0   # 0x145dac578
1458fcc9b:     	movq	0x118(%rbp), %rsi
1458fcca2:     	movq	0x120(%rbp), %r15
1458fcca9:     	jmp	0x1458fcd43 <.text+0x58fbd43>
1458fccae:     	movq	%r14, %rdx
1458fccb1:     	andq	$-0x4, %rdx
1458fccb5:     	leaq	0x130(%rdi), %r8
1458fccbc:     	movsd	0x4af8b4(%rip), %xmm0   # 0x145dac578
1458fccc4:     	xorl	%ecx, %ecx
1458fccc6:     	nopw	%cs:(%rax,%rax)
1458fccd0:     	addsd	-0xf0(%r8), %xmm0
1458fccd9:     	addsd	-0xa0(%r8), %xmm0
1458fcce2:     	addsd	-0x50(%r8), %xmm0
1458fcce8:     	addsd	(%r8), %xmm0
1458fcced:     	addq	$0x4, %rcx
1458fccf1:     	addq	$0x140, %r8             # imm = 0x140
1458fccf8:     	cmpq	%rcx, %rdx
1458fccfb:     	jne	0x1458fccd0 <.text+0x58fbcd0>
1458fccfd:     	testq	%rax, %rax
1458fcd00:     	movq	0x118(%rbp), %rsi
1458fcd07:     	movq	0x120(%rbp), %r15
1458fcd0e:     	je	0x1458fcd3e <.text+0x58fbd3e>
1458fcd10:     	leaq	(%rcx,%rcx,4), %rcx
1458fcd14:     	shlq	$0x4, %rcx
1458fcd18:     	addq	%rdi, %rcx
1458fcd1b:     	addq	$0x40, %rcx
1458fcd1f:     	shll	$0x4, %eax
1458fcd22:     	leaq	(%rax,%rax,4), %rax
1458fcd26:     	xorl	%edx, %edx
1458fcd28:     	nopl	(%rax,%rax)
1458fcd30:     	addsd	(%rcx,%rdx), %xmm0
1458fcd35:     	addq	$0x50, %rdx
1458fcd39:     	cmpq	%rdx, %rax
1458fcd3c:     	jne	0x1458fcd30 <.text+0x58fbd30>
1458fcd3e:     	callq	0x145bc97db <.text+0x5bc87db>
1458fcd43:     	movq	%rsi, 0x138(%rbp)
1458fcd4a:     	movq	%r15, 0x130(%rbp)
1458fcd51:     	movb	$0x0, 0x177(%rbp)
1458fcd58:     	movb	$0x1, 0x176(%rbp)
1458fcd5f:     	movb	$0x0, 0x175(%rbp)
1458fcd66:     	movb	$0x0, 0x174(%rbp)
1458fcd6d:     	movsd	%xmm0, 0x20(%rsp)
1458fcd73:     	leaq	0x157c593(%rip), %r8    # 0x146e7930d
1458fcd7a:     	leaq	0xf0(%rbp), %rcx
1458fcd81:     	leaq	0x140(%rbp), %rdx
1458fcd88:     	movl	$0x5, %r9d
1458fcd8e:     	callq	0x1458d6b20 <.text+0x58d5b20>
1458fcd93:     	nop
1458fcd94:     	movb	$0x1, 0xeb(%rbp)
1458fcd9b:     	leaq	0xc0(%rbp), %r15
1458fcda2:     	movq	%r15, %rcx
1458fcda5:     	movq	%rdi, %rdx
1458fcda8:     	movq	%r14, %r8
1458fcdab:     	callq	0x14595f7a0 <.text+0x595e7a0>
1458fcdb0:     	nop
1458fcdb1:     	movb	$0x0, 0xeb(%rbp)
1458fcdb8:     	movq	%r15, 0x20(%rsp)
1458fcdbd:     	leaq	0x157c641(%rip), %r8    # 0x146e79405
1458fcdc4:     	leaq	0x140(%rbp), %rcx
1458fcdcb:     	leaq	0xf0(%rbp), %rdx
1458fcdd2:     	movl	$0x5, %r9d
1458fcdd8:     	callq	0x1458d9670 <.text+0x58d8670>
1458fcddd:     	nop
1458fcdde:     	movq	0xb0(%rbp), %rax
1458fcde5:     	movq	0x680(%rax), %rdi
1458fcdec:     	movq	0x688(%rax), %r14
1458fcdf3:     	testq	%r14, %r14
1458fcdf6:     	je	0x1458fce1e <.text+0x58fbe1e>
1458fcdf8:     	movl	%r14d, %eax
1458fcdfb:     	andl	$0x3, %eax
1458fcdfe:     	cmpq	$0x4, %r14
1458fce02:     	movq	0x120(%rbp), %r15
1458fce09:     	jae	0x1458fce39 <.text+0x58fbe39>
1458fce0b:     	movsd	0x4af765(%rip), %xmm0   # 0x145dac578
1458fce13:     	xorl	%ecx, %ecx
1458fce15:     	movq	0x118(%rbp), %rsi
1458fce1c:     	jmp	0x1458fce99 <.text+0x58fbe99>
1458fce1e:     	movsd	0x4af752(%rip), %xmm0   # 0x145dac578
1458fce26:     	movq	0x118(%rbp), %rsi
1458fce2d:     	movq	0x120(%rbp), %r15
1458fce34:     	jmp	0x1458fced3 <.text+0x58fbed3>
1458fce39:     	movq	%r14, %rdx
1458fce3c:     	andq	$-0x4, %rdx
1458fce40:     	leaq	0x130(%rdi), %r8
1458fce47:     	movsd	0x4af729(%rip), %xmm0   # 0x145dac578
1458fce4f:     	xorl	%ecx, %ecx
1458fce51:     	nopw	%cs:(%rax,%rax)
1458fce60:     	addsd	-0xf0(%r8), %xmm0
1458fce69:     	addsd	-0xa0(%r8), %xmm0
1458fce72:     	addsd	-0x50(%r8), %xmm0
1458fce78:     	addsd	(%r8), %xmm0
1458fce7d:     	addq	$0x4, %rcx
1458fce81:     	addq	$0x140, %r8             # imm = 0x140
1458fce88:     	cmpq	%rcx, %rdx
1458fce8b:     	jne	0x1458fce60 <.text+0x58fbe60>
1458fce8d:     	testq	%rax, %rax
1458fce90:     	movq	0x118(%rbp), %rsi
1458fce97:     	je	0x1458fcece <.text+0x58fbece>
1458fce99:     	leaq	(%rcx,%rcx,4), %rcx
1458fce9d:     	shlq	$0x4, %rcx
1458fcea1:     	addq	%rdi, %rcx
1458fcea4:     	addq	$0x40, %rcx
1458fcea8:     	shll	$0x4, %eax
1458fceab:     	leaq	(%rax,%rax,4), %rax
1458fceaf:     	xorl	%edx, %edx
1458fceb1:     	nopw	%cs:(%rax,%rax)
1458fcec0:     	addsd	(%rcx,%rdx), %xmm0
1458fcec5:     	addq	$0x50, %rdx
1458fcec9:     	cmpq	%rdx, %rax
1458fcecc:     	jne	0x1458fcec0 <.text+0x58fbec0>
1458fcece:     	callq	0x145bc97db <.text+0x5bc87db>
1458fced3:     	movq	%rsi, 0x138(%rbp)
1458fceda:     	movq	%r15, 0x130(%rbp)
1458fcee1:     	movb	$0x0, 0x177(%rbp)
1458fcee8:     	movb	$0x1, 0x176(%rbp)
1458fceef:     	movb	$0x0, 0x175(%rbp)
1458fcef6:     	movb	$0x0, 0x174(%rbp)
1458fcefd:     	movsd	%xmm0, 0x20(%rsp)
1458fcf03:     	leaq	0x157c500(%rip), %r8    # 0x146e7940a
1458fcf0a:     	leaq	0xf0(%rbp), %rcx
1458fcf11:     	leaq	0x140(%rbp), %rdx
1458fcf18:     	movl	$0x6, %r9d
1458fcf1e:     	callq	0x1458d6b20 <.text+0x58d5b20>
1458fcf23:     	nop
1458fcf24:     	movb	$0x1, 0xea(%rbp)
1458fcf2b:     	leaq	0x140(%rbp), %r15
1458fcf32:     	movq	%r15, %rcx
1458fcf35:     	movq	%rdi, %rdx
1458fcf38:     	movq	%r14, %r8
1458fcf3b:     	callq	0x14595f7a0 <.text+0x595e7a0>
1458fcf40:     	nop
1458fcf41:     	movb	$0x0, 0xea(%rbp)
1458fcf48:     	movq	%r15, 0x20(%rsp)
1458fcf4d:     	leaq	0x157c4bc(%rip), %r8    # 0x146e79410
1458fcf54:     	leaq	0xc0(%rbp), %rcx
1458fcf5b:     	leaq	0xf0(%rbp), %rdx
1458fcf62:     	movl	$0x7, %r9d
1458fcf68:     	callq	0x1458d9670 <.text+0x58d8670>
1458fcf6d:     	nop
1458fcf6e:     	movq	0xb0(%rbp), %r14
1458fcf75:     	movl	0x704(%r14), %esi
1458fcf7c:     	cmpl	$0x2, %esi
1458fcf7f:     	jne	0x1458fd01b <.text+0x58fc01b>
1458fcf85:     	callq	0x140002200 <.text+0x1200>
1458fcf8a:     	movl	$0x1, %ecx
1458fcf8f:     	movl	$0x1, %edx
1458fcf94:     	callq	0x1400021c0 <.text+0x11c0>
1458fcf99:     	testq	%rax, %rax
1458fcf9c:     	je	0x1458fda1b <.text+0x58fca1b>
1458fcfa2:     	movb	$0x7b, (%rax)
1458fcfa5:     	movq	$0x1, 0x140(%rbp)
1458fcfb0:     	movq	%rax, 0x148(%rbp)
1458fcfb7:     	movq	$0x1, 0x150(%rbp)
1458fcfc2:     	movb	$0x1, 0x158(%rbp)
1458fcfc9:     	movq	$0x1, 0x20(%rsp)
1458fcfd2:     	leaq	0x140(%rbp), %rcx
1458fcfd9:     	movl	$0x1, %edx
1458fcfde:     	movl	$0x1, %r8d
1458fcfe4:     	movl	$0x1, %r9d
1458fcfea:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458fcfef:     	nop
1458fcff0:     	movq	0x148(%rbp), %rax
1458fcff7:     	movb	$0x7d, 0x1(%rax)
1458fcffb:     	movupd	0x140(%rbp), %xmm0
1458fd003:     	movapd	%xmm0, 0x80(%rbp)
1458fd00b:     	movq	$0x2, 0x90(%rbp)
1458fd016:     	jmp	0x1458fd29b <.text+0x58fc29b>
1458fd01b:     	movss	0x700(%r14), %xmm9
1458fd024:     	movss	0x708(%r14), %xmm6
1458fd02d:     	callq	0x140002200 <.text+0x1200>
1458fd032:     	movl	$0x1, %ecx
1458fd037:     	movl	$0x1, %edx
1458fd03c:     	callq	0x1400021c0 <.text+0x11c0>
1458fd041:     	testq	%rax, %rax
1458fd044:     	je	0x1458fda34 <.text+0x58fca34>
1458fd04a:     	movb	$0x7b, (%rax)
1458fd04d:     	movq	$0x1, 0x140(%rbp)
1458fd058:     	movq	%rax, 0x148(%rbp)
1458fd05f:     	movq	$0x1, 0x150(%rbp)
1458fd06a:     	movb	$0x1, 0x158(%rbp)
1458fd071:     	movq	0x698(%r14), %rdi
1458fd078:     	movq	0x6a0(%r14), %r14
1458fd07f:     	testq	%r14, %r14
1458fd082:     	je	0x1458fd09c <.text+0x58fc09c>
1458fd084:     	movl	%r14d, %eax
1458fd087:     	andl	$0x3, %eax
1458fd08a:     	cmpq	$0x4, %r14
1458fd08e:     	jae	0x1458fd0a6 <.text+0x58fc0a6>
1458fd090:     	movsd	0x4af4e0(%rip), %xmm0   # 0x145dac578
1458fd098:     	xorl	%ecx, %ecx
1458fd09a:     	jmp	0x1458fd0f2 <.text+0x58fc0f2>
1458fd09c:     	movsd	0x4af4d4(%rip), %xmm0   # 0x145dac578
1458fd0a4:     	jmp	0x1458fd123 <.text+0x58fc123>
1458fd0a6:     	movq	%r14, %rdx
1458fd0a9:     	andq	$-0x4, %rdx
1458fd0ad:     	leaq	0x130(%rdi), %r8
1458fd0b4:     	movsd	0x4af4bc(%rip), %xmm0   # 0x145dac578
1458fd0bc:     	xorl	%ecx, %ecx
1458fd0be:     	nop
1458fd0c0:     	addsd	-0xf0(%r8), %xmm0
1458fd0c9:     	addsd	-0xa0(%r8), %xmm0
1458fd0d2:     	addsd	-0x50(%r8), %xmm0
1458fd0d8:     	addsd	(%r8), %xmm0
1458fd0dd:     	addq	$0x4, %rcx
1458fd0e1:     	addq	$0x140, %r8             # imm = 0x140
1458fd0e8:     	cmpq	%rcx, %rdx
1458fd0eb:     	jne	0x1458fd0c0 <.text+0x58fc0c0>
1458fd0ed:     	testq	%rax, %rax
1458fd0f0:     	je	0x1458fd11e <.text+0x58fc11e>
1458fd0f2:     	leaq	(%rcx,%rcx,4), %rcx
1458fd0f6:     	shlq	$0x4, %rcx
1458fd0fa:     	addq	%rdi, %rcx
1458fd0fd:     	addq	$0x40, %rcx
1458fd101:     	shll	$0x4, %eax
1458fd104:     	leaq	(%rax,%rax,4), %rax
1458fd108:     	xorl	%edx, %edx
1458fd10a:     	nopw	(%rax,%rax)
1458fd110:     	addsd	(%rcx,%rdx), %xmm0
1458fd115:     	addq	$0x50, %rdx
1458fd119:     	cmpq	%rdx, %rax
1458fd11c:     	jne	0x1458fd110 <.text+0x58fc110>
1458fd11e:     	callq	0x145bc97db <.text+0x5bc87db>
1458fd123:     	movb	$0x1, 0x172(%rbp)
1458fd12a:     	movsd	%xmm0, 0x20(%rsp)
1458fd130:     	leaq	0x157c1d6(%rip), %r8    # 0x146e7930d
1458fd137:     	leaq	0xf0(%rbp), %rcx
1458fd13e:     	leaq	0x140(%rbp), %rdx
1458fd145:     	movl	$0x5, %r9d
1458fd14b:     	callq	0x1458d6b20 <.text+0x58d5b20>
1458fd150:     	nop
1458fd151:     	testb	$0x1, %sil
1458fd155:     	jne	0x1458fd15b <.text+0x58fc15b>
1458fd157:     	movaps	%xmm8, %xmm6
1458fd15b:     	subss	%xmm9, %xmm6
1458fd160:     	movb	$0x1, 0x172(%rbp)
1458fd167:     	movss	%xmm6, 0x20(%rsp)
1458fd16d:     	leaq	0x157c19e(%rip), %r8    # 0x146e79312
1458fd174:     	leaq	0x140(%rbp), %rcx
1458fd17b:     	leaq	0xf0(%rbp), %rdx
1458fd182:     	movl	$0x4, %r9d
1458fd188:     	callq	0x1458d6ca0 <.text+0x58d5ca0>
1458fd18d:     	nop
1458fd18e:     	leaq	0x157c181(%rip), %rdx   # 0x146e79316
1458fd195:     	leaq	0x140(%rbp), %rcx
1458fd19c:     	movl	$0x4, %r8d
1458fd1a2:     	callq	0x1458d9500 <.text+0x58d8500>
1458fd1a7:     	nop
1458fd1a8:     	xorl	%r15d, %r15d
1458fd1ab:     	cmpl	$0x1, %esi
1458fd1ae:     	sete	%r15b
1458fd1b2:     	orq	$0x4, %r15
1458fd1b6:     	movq	0x140(%rbp), %rax
1458fd1bd:     	movq	0x150(%rbp), %rdx
1458fd1c4:     	subq	%rdx, %rax
1458fd1c7:     	cmpq	%rax, %r15
1458fd1ca:     	ja	0x1458fd816 <.text+0x58fc816>
1458fd1d0:     	cmpl	$0x1, %esi
1458fd1d3:     	leaq	0x12c5c55(%rip), %rax   # 0x146bc2e2f
1458fd1da:     	cmovneq	%rax, %r12
1458fd1de:     	addq	0x148(%rbp), %rdx
1458fd1e5:     	movq	%rdx, %rcx
1458fd1e8:     	movq	%r12, %rdx
1458fd1eb:     	movq	%r15, %r8
1458fd1ee:     	callq	0x145bc977b <.text+0x5bc877b>
1458fd1f3:     	addq	%r15, 0x150(%rbp)
1458fd1fa:     	movups	0x140(%rbp), %xmm0
1458fd201:     	movaps	%xmm0, 0xf0(%rbp)
1458fd208:     	movupd	0x150(%rbp), %xmm0
1458fd210:     	movapd	%xmm0, 0x100(%rbp)
1458fd218:     	movb	$0x1, 0xe9(%rbp)
1458fd21f:     	leaq	0x80(%rbp), %rsi
1458fd226:     	movq	%rsi, %rcx
1458fd229:     	movq	%rdi, %rdx
1458fd22c:     	movq	%r14, %r8
1458fd22f:     	callq	0x14595f7a0 <.text+0x595e7a0>
1458fd234:     	nop
1458fd235:     	movb	$0x0, 0xe9(%rbp)
1458fd23c:     	movq	%rsi, 0x20(%rsp)
1458fd241:     	leaq	0x157c0d2(%rip), %r8    # 0x146e7931a
1458fd248:     	leaq	0x140(%rbp), %rcx
1458fd24f:     	leaq	0xf0(%rbp), %rdx
1458fd256:     	movl	$0x5, %r9d
1458fd25c:     	callq	0x1458d9670 <.text+0x58d8670>
1458fd261:     	nop
1458fd262:     	movq	0x150(%rbp), %rsi
1458fd269:     	cmpq	%rsi, 0x140(%rbp)
1458fd270:     	je	0x1458fd841 <.text+0x58fc841>
1458fd276:     	movq	0x148(%rbp), %rax
1458fd27d:     	movb	$0x7d, (%rax,%rsi)
1458fd281:     	incq	%rsi
1458fd284:     	movq	%rsi, 0x90(%rbp)
1458fd28b:     	movupd	0x140(%rbp), %xmm0
1458fd293:     	movapd	%xmm0, 0x80(%rbp)
1458fd29b:     	movb	$0x0, 0x172(%rbp)
1458fd2a2:     	leaq	0x80(%rbp), %rax
1458fd2a9:     	movq	%rax, 0x20(%rsp)
1458fd2ae:     	leaq	0x157c162(%rip), %r8    # 0x146e79417
1458fd2b5:     	leaq	0xf0(%rbp), %rcx
1458fd2bc:     	leaq	0xc0(%rbp), %rsi
1458fd2c3:     	movl	$0x9, %r9d
1458fd2c9:     	movq	%rsi, %rdx
1458fd2cc:     	callq	0x1458d9670 <.text+0x58d8670>

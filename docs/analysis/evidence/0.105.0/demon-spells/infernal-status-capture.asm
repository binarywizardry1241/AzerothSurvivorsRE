
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14594f752:     	movl	$0xffffffff, 0xc0(%rbp) # imm = 0xFFFFFFFF
14594f75c:     	testq	%rax, %rax
14594f75f:     	je	0x14594f7d8 <.text+0x594e7d8>
14594f761:     	shlq	$0x6, %rax
14594f765:     	addq	%rcx, %rax
14594f768:     	movq	%rcx, %r8
14594f76b:     	jmp	0x14594f779 <.text+0x594e779>
14594f76d:     	nopl	(%rax)
14594f770:     	addq	$0x40, %r8
14594f774:     	cmpq	%rax, %r8
14594f777:     	je	0x14594f7d8 <.text+0x594e7d8>
14594f779:     	cmpb	$0x8, (%r8)
14594f77d:     	jne	0x14594f770 <.text+0x594e770>
14594f77f:     	cmpl	$0x0, 0x18(%r8)
14594f784:     	jne	0x14594f770 <.text+0x594e770>
14594f786:     	movl	0x8(%r8), %r9d
14594f78a:     	cmpl	$-0x1, %r9d
14594f78e:     	je	0x14594f770 <.text+0x594e770>
14594f790:     	cmpb	$0x1, 0x20(%r8)
14594f795:     	jne	0x14594f770 <.text+0x594e770>
14594f797:     	cmpq	$0x8, 0x30(%r8)
14594f79c:     	jne	0x14594f770 <.text+0x594e770>
14594f79e:     	movq	0x28(%r8), %r10
14594f7a2:     	movq	(%r10), %r10
14594f7a5:     	cmpq	0x1865a2b(%rip), %r10   # 0x1471b51d7
14594f7ac:     	jne	0x14594f770 <.text+0x594e770>
14594f7ae:     	movss	0x4(%r8), %xmm10
14594f7b4:     	movq	0xc(%r8), %rax
14594f7b8:     	movq	%rax, -0x8(%rbp)
14594f7bc:     	movl	%r9d, 0xc0(%rbp)

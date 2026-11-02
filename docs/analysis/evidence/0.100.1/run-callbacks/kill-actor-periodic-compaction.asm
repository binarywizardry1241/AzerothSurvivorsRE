
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454dd962:     	leaq	0x1(%rdx), %r9
1454dd966:     	cmpq	%rax, %r9
1454dd969:     	jae	0x1454dd9ba <.text+0x54dc9ba>
1454dd96b:     	leal	(%rax,%rdx), %r11d
1454dd96f:     	movq	%rdx, %r10
1454dd972:     	testb	$0x1, %r11b
1454dd976:     	jne	0x1454dd9aa <.text+0x54dc9aa>
1454dd978:     	cmpl	$0x0, (%r8)
1454dd97c:     	movq	%rdx, %r10
1454dd97f:     	je	0x1454dd9a6 <.text+0x54dc9a6>
1454dd981:     	leaq	-0x20(%r8), %r9
1454dd985:     	movups	(%r9), %xmm0
1454dd989:     	movups	0x10(%r9), %xmm1
1454dd98e:     	movups	0x20(%r9), %xmm2
1454dd993:     	movups	%xmm2, -0x30(%r8)
1454dd998:     	movups	%xmm1, -0x40(%r8)
1454dd99d:     	movups	%xmm0, -0x50(%r8)
1454dd9a2:     	leaq	0x1(%rdx), %r10
1454dd9a6:     	leaq	0x2(%rdx), %r9
1454dd9aa:     	leaq	-0x2(%rax), %r8
1454dd9ae:     	cmpq	%rdx, %r8
1454dd9b1:     	movq	%r10, %rdx
1454dd9b4:     	jne	0x1454ddc0a <.text+0x54dcc0a>
1454dd9ba:     	movq	%rdx, 0x10(%rdi)
1454dd9be:     	jmp	0x1454dbef7 <.text+0x54daef7>

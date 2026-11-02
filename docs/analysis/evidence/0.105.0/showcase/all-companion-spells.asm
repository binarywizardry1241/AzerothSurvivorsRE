
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459187ae:     	cmpb	$0x0, 0xa6c(%r13)
1459187b6:     	je	0x145918886 <.text+0x5917886>
1459187bc:     	movzbl	0x304(%r13), %edx
1459187c4:     	leaq	0x140(%rbp), %rcx
1459187cb:     	callq	0x1458e62c0 <.text+0x58e52c0>
1459187d0:     	movq	0x140(%rbp), %rax
1459187d7:     	movq	%rax, 0x180(%rbp)
1459187de:     	movq	0x148(%rbp), %rax
1459187e5:     	movq	%rax, 0x190(%rbp)
1459187ec:     	movq	0x150(%rbp), %rsi
1459187f3:     	testq	%rsi, %rsi
1459187f6:     	je	0x14591884f <.text+0x591784f>
1459187f8:     	shlq	$0x3, %rsi
1459187fc:     	xorl	%edi, %edi
1459187fe:     	movss	0x45846e(%rip), %xmm6   # 0x145d70c74
145918806:     	jmp	0x145918819 <.text+0x5917819>
145918808:     	nopl	(%rax,%rax)
145918810:     	addq	$0x8, %rdi
145918814:     	cmpq	%rdi, %rsi
145918817:     	je	0x14591884f <.text+0x591784f>
145918819:     	movq	0x190(%rbp), %rax
145918820:     	movq	(%rax,%rdi), %rdx
145918824:     	cmpb	$0x0, 0x39(%rdx)
145918828:     	je	0x145918810 <.text+0x5917810>
14591882a:     	movl	$0x3f800000, 0x28(%rsp) # imm = 0x3F800000
145918832:     	movq	$-0x1, 0x20(%rsp)
14591883b:     	movq	%r13, %rcx
14591883e:     	movl	$0x1, %r8d
145918844:     	movaps	%xmm6, %xmm3
145918847:     	callq	0x14594e4f0 <.text+0x594d4f0>
14591884c:     	nop
14591884d:     	jmp	0x145918810 <.text+0x5917810>
14591884f:     	movq	0x180(%rbp), %rdx
145918856:     	testq	%rdx, %rdx
145918859:     	leaq	0x140(%rbp), %rsi
145918860:     	je	0x145918878 <.text+0x5917878>
145918862:     	shlq	$0x3, %rdx
145918866:     	movl	$0x8, %r8d
14591886c:     	movq	0x190(%rbp), %rcx
145918873:     	callq	0x1400021d0 <.text+0x11d0>

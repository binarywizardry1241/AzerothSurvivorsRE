
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14016c8ed:     	cmpb	$0x2, (%rax)
14016c8f0:     	jne	0x14016c77e <.text+0x16b77e>
14016c8f6:     	testq	%rcx, %rcx
14016c8f9:     	je	0x14016c920 <.text+0x16b920>
14016c8fb:     	movzbl	(%rcx), %eax
14016c8fe:     	movq	0x68(%rsp), %rcx
14016c903:     	cmpb	0x32(%rcx), %al
14016c906:     	jne	0x14016c920 <.text+0x16b920>
14016c908:     	movups	%xmm6, 0xc4(%rsp)
14016c910:     	movl	$0x0, 0xc0(%rsp)
14016c91b:     	jmp	0x14016c93a <.text+0x16b93a>
14016c91d:     	nopl	(%rax)
14016c920:     	movups	0x5c49fa1(%rip), %xmm0  # 0x145db68c8
14016c927:     	movaps	%xmm0, 0xc0(%rsp)
14016c92f:     	movl	$0x0, 0xd0(%rsp)
14016c93a:     	incl	%r15d
14016c93d:     	movq	%r12, %rcx
14016c940:     	leaq	0xc0(%rsp), %rdx
14016c948:     	callq	0x140186410 <.text+0x185410>
14016c94d:     	testb	%al, %al
14016c94f:     	jne	0x14016c5e2 <.text+0x16b5e2>
14016c955:     	movl	0x3c(%rsp), %eax
14016c959:     	movl	%eax, (%rsi)
14016c95b:     	movl	0xd0(%rsp), %eax
14016c962:     	movl	%eax, 0x10(%r12)
14016c967:     	movaps	0xc0(%rsp), %xmm0
14016c96f:     	movups	%xmm0, (%r12)

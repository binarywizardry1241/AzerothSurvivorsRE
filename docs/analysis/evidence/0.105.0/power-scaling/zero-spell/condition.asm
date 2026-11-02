
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145929aa0:     	subq	$0x28, %rsp
145929aa4:     	movl	(%rdx), %eax
145929aa6:     	movzbl	0x1d(%r8), %r9d
145929aab:     	leaq	0x1551b12(%rip), %r10   # 0x146e7b5c4
145929ab2:     	movslq	(%r10,%rax,4), %rax
145929ab6:     	addq	%r10, %rax
145929ab9:     	jmpq	*%rax
145929abb:     	testb	%r9b, %r9b
145929abe:     	je	0x145929b5c <.text+0x5928b5c>
145929ac4:     	cmpb	$0x0, 0x22(%r8)
145929ac9:     	je	0x145929b87 <.text+0x5928b87>
145929acf:     	jmp	0x145929b5c <.text+0x5928b5c>
145929ad4:     	cmpb	$0x7, %r9b
145929ad8:     	sete	%al
145929adb:     	addq	$0x28, %rsp
145929adf:     	retq
145929ae0:     	cmpb	$0x1, %r9b
145929ae4:     	jne	0x145929b87 <.text+0x5928b87>
145929aea:     	jmp	0x145929b5c <.text+0x5928b5c>
145929aec:     	cmpb	$0x5, %r9b
145929af0:     	jne	0x145929b87 <.text+0x5928b87>
145929af6:     	movss	0x4(%rdx), %xmm0
145929afb:     	mulss	0x478(%rcx), %xmm0
145929b03:     	ucomiss	0x4e0(%rcx), %xmm0
145929b0a:     	seta	%al
145929b0d:     	addq	$0x28, %rsp
145929b11:     	retq
145929b12:     	xorl	%eax, %eax
145929b14:     	testb	%r9b, %r9b
145929b17:     	jne	0x145929b0d <.text+0x5928b0d>
145929b19:     	cmpb	$0x0, 0x1f(%r8)
145929b1e:     	jne	0x145929b5c <.text+0x5928b5c>
145929b20:     	jmp	0x145929b0d <.text+0x5928b0d>
145929b22:     	xorl	%eax, %eax
145929b24:     	testb	%r9b, %r9b
145929b27:     	jne	0x145929b0d <.text+0x5928b0d>
145929b29:     	cmpb	$0x0, 0x21(%r8)
145929b2e:     	jne	0x145929b5c <.text+0x5928b5c>
145929b30:     	jmp	0x145929b0d <.text+0x5928b0d>
145929b32:     	cmpb	$0x3, %r9b
145929b36:     	jne	0x145929b87 <.text+0x5928b87>
145929b38:     	jmp	0x145929b5c <.text+0x5928b5c>
145929b3a:     	testb	%r9b, %r9b
145929b3d:     	sete	%r9b
145929b41:     	orb	0x22(%r8), %r9b
145929b45:     	xorl	%eax, %eax
145929b47:     	testb	$0x1, %r9b
145929b4b:     	je	0x145929b0d <.text+0x5928b0d>
145929b4d:     	cmpb	$0x0, 0x20(%r8)
145929b52:     	jne	0x145929b5c <.text+0x5928b5c>
145929b54:     	jmp	0x145929b0d <.text+0x5928b0d>
145929b56:     	cmpb	$0x2, %r9b
145929b5a:     	jae	0x145929b87 <.text+0x5928b87>
145929b5c:     	addq	$0x8, %rdx
145929b60:     	movl	0x8(%r8), %eax
145929b64:     	movzbl	0x1c(%r8), %r9d
145929b69:     	movzbl	0x1e(%r8), %r8d
145929b6e:     	movb	%r8b, 0x20(%rsp)
145929b73:     	movl	%eax, %r8d
145929b76:     	callq	0x14592e820 <.text+0x592d820>
145929b7b:     	nop
145929b7c:     	addq	$0x28, %rsp
145929b80:     	retq
145929b81:     	cmpb	$0x2, %r9b
145929b85:     	je	0x145929b5c <.text+0x5928b5c>
145929b87:     	xorl	%eax, %eax
145929b89:     	addq	$0x28, %rsp
145929b8d:     	retq
145929b8e:     	cmpb	$0x6, %r9b
145929b92:     	sete	%al
145929b95:     	addq	$0x28, %rsp
145929b99:     	retq
145929b9a:     	cmpb	$0x4, %r9b
145929b9e:     	sete	%al
145929ba1:     	addq	$0x28, %rsp
145929ba5:     	retq

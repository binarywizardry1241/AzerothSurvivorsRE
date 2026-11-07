
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145444b14:     	movzbl	0x1(%rbx), %edx
145444b18:     	shll	$0x8, %edx
145444b1b:     	cmpq	$0x3, %r12
145444b1f:     	jb	0x145444b3a <.text+0x5443b3a>
145444b21:     	movzbl	0x2(%rbx), %eax
145444b25:     	shll	$0x10, %eax
145444b28:     	cmpq	$0x3, %r12
145444b2c:     	je	0x145444b3a <.text+0x5443b3a>
145444b2e:     	movzbl	0x3(%rbx), %r8d
145444b33:     	shll	$0x18, %r8d
145444b37:     	orl	%r8d, %eax
145444b3a:     	orl	%edx, %eax
145444b3c:     	movzbl	%cl, %ebx
145444b3f:     	orl	%eax, %ebx
145444b41:     	leal	-0x232d(%rbx), %eax
145444b47:     	cmpl	$0x9, %eax
145444b4a:     	jae	0x145444b66 <.text+0x5443b66>
145444b4c:     	movl	%eax, %eax
145444b4e:     	leaq	0x12f9d5f(%rip), %rcx   # 0x14673e8b4
145444b55:     	movl	(%rcx,%rax,4), %r14d
145444b59:     	leaq	0x12f9d78(%rip), %rcx   # 0x14673e8d8
145444b60:     	movl	(%rcx,%rax,4), %r15d
145444b64:     	jmp	0x145444b72 <.text+0x5443b72>
145444b66:     	movl	$0xa36, %r15d           # imm = 0xA36
145444b6c:     	movl	$0x5, %r14d
145444b72:     	movl	%ebx, %ecx
145444b74:     	callq	0x145420890 <.text+0x541f890>
145444b79:     	movq	%rdx, 0x28(%rsp)
145444b7e:     	movq	%rax, 0x20(%rsp)
145444b83:     	leaq	0x1600(%rbp), %r12
145444b8a:     	movq	%r12, %rcx
145444b8d:     	movl	%ebx, %edx
145444b8f:     	movl	%r14d, %r8d
145444b92:     	movl	%r15d, %r9d
145444b95:     	callq	0x145465300 <.text+0x5464300>
145444b9a:     	movq	0xa08(%rsi), %rcx
145444ba1:     	movq	0xa10(%rsi), %rdx
145444ba8:     	movq	%rdi, %r8
145444bab:     	movq	%r12, %r9
145444bae:     	jmp	0x145447a7d <.text+0x5446a7d>

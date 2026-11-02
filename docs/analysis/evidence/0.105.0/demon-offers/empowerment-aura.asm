
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145922af4:     	xorl	%ebx, %ebx
145922af6:     	addss	%xmm8, %xmm7
145922afb:     	cmpq	(%rcx), %rbx
145922afe:     	jne	0x145922b05 <.text+0x5921b05>
145922b00:     	callq	0x145bfaf60 <.text+0x5bf9f60>
145922b05:     	movq	0x378(%rdi), %rax
145922b0c:     	leaq	(%rbx,%rbx,2), %rcx
145922b10:     	movl	%r14d, (%rax,%rcx,8)
145922b14:     	movss	%xmm10, 0x4(%rax,%rcx,8)
145922b1b:     	movss	%xmm6, 0x8(%rax,%rcx,8)
145922b21:     	movl	%r15d, 0xc(%rax,%rcx,8)
145922b26:     	movss	%xmm7, 0x10(%rax,%rcx,8)
145922b2c:     	movl	$0x0, 0x14(%rax,%rcx,8)
145922b34:     	incq	%rbx
145922b37:     	movq	%rbx, 0x380(%rdi)
145922b3e:     	movq	%rdi, %rcx
145922b41:     	callq	0x1458f96f0 <.text+0x58f86f0>
145922b46:     	movq	%rdi, %rcx
145922b49:     	callq	0x1458f0ed0 <.text+0x58efed0>

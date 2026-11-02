
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005d9eb:     	movb	%bl, 0x1a0(%rbp)
14005d9f1:     	movq	0xd8(%rbp), %rax
14005d9f8:     	movq	(%rax), %rbx
14005d9fb:     	movq	0x138(%rbp), %rax
14005da02:     	cmpq	(%rax), %rbx
14005da05:     	jne	0x14005da14 <.text+0x5ca14>
14005da07:     	movq	0x138(%rbp), %rcx
14005da0e:     	callq	0x145bcb530 <.text+0x5bca530>
14005da13:     	nop
14005da14:     	movq	0x258(%rbp), %rdx
14005da1b:     	movq	0x20(%rdx), %rax
14005da1f:     	movq	%rbx, %rcx
14005da22:     	shlq	$0x5, %rcx
14005da26:     	movups	0x1a0(%rbp), %xmm0
14005da2d:     	movups	0x1b0(%rbp), %xmm1
14005da34:     	movups	%xmm1, 0x10(%rax,%rcx)
14005da39:     	movups	%xmm0, (%rax,%rcx)
14005da3d:     	incq	%rbx
14005da40:     	movq	%rbx, 0x28(%rdx)
14005da44:     	movq	0x248(%rbp), %rax
14005da4b:     	movl	0x274(%rbp), %ecx
14005da51:     	movl	%ecx, (%rax)
14005da53:     	movdqa	0x170(%rbp), %xmm0
14005da5b:     	movaps	0x180(%rbp), %xmm1
14005da62:     	movaps	%xmm1, 0x1b0(%rbp)
14005da69:     	movdqa	%xmm0, 0x1a0(%rbp)
14005da71:     	movss	%xmm6, 0x1c0(%rbp)
14005da79:     	movq	0x40(%rdx), %rbx
14005da7d:     	cmpq	0x30(%rdx), %rbx
14005da81:     	jne	0x14005da90 <.text+0x5ca90>
14005da83:     	movq	0x110(%rbp), %rcx
14005da8a:     	callq	0x145bcb5a0 <.text+0x5bca5a0>
14005da8f:     	nop
14005da90:     	movq	0x258(%rbp), %r8
14005da97:     	movq	0x38(%r8), %rax
14005da9b:     	leaq	(%rbx,%rbx,4), %rcx
14005da9f:     	movq	0x1c0(%rbp), %rdx
14005daa6:     	movq	%rdx, 0x20(%rax,%rcx,8)
14005daab:     	movdqa	0x1a0(%rbp), %xmm0
14005dab3:     	movaps	0x1b0(%rbp), %xmm1
14005daba:     	movups	%xmm1, 0x10(%rax,%rcx,8)
14005dabf:     	movdqu	%xmm0, (%rax,%rcx,8)
14005dac4:     	incq	%rbx
14005dac7:     	movq	%rbx, 0x40(%r8)

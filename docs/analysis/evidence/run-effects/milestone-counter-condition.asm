
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cbcf4:     	movq	%rdi, %r15
1454cbcf7:     	movq	%rdx, 0x140(%rbp)
1454cbcfe:     	movq	%r10, 0x148(%rbp)
1454cbd05:     	movq	%rax, 0x150(%rbp)
1454cbd0c:     	movq	%rcx, 0x158(%rbp)
1454cbd13:     	movq	%r12, %rcx
1454cbd16:     	leaq	0x140(%rbp), %rdx
1454cbd1d:     	movq	0x178(%rbp), %r8
1454cbd24:     	callq	0x1454cb900 <.text+0x54ca900>
1454cbd29:     	nop
1454cbd2a:     	movq	0x208(%rbp), %rcx
1454cbd31:     	cmpq	0x90(%r12), %rcx
1454cbd39:     	setb	%cl
1454cbd3c:     	testb	%cl, %al
1454cbd3e:     	je	0x1454ccde4 <.text+0x54cbde4>
1454cbd44:     	movq	0x88(%r12), %rax
1454cbd4c:     	movq	0x208(%rbp), %rdx
1454cbd53:     	movl	(%rax,%rdx,4), %ecx
1454cbd56:     	incl	%ecx
1454cbd58:     	cmpl	%ecx, %ebx
1454cbd5a:     	cmovbl	%ebx, %ecx
1454cbd5d:     	movl	%ecx, (%rax,%rdx,4)
1454cbd60:     	ja	0x1454ccde4 <.text+0x54cbde4>
1454cbd66:     	cmpl	$0x0, 0x200(%rbp)
1454cbd6d:     	movq	0x208(%rbp), %rcx
1454cbd74:     	je	0x1454cc9d3 <.text+0x54cb9d3>
1454cbd7a:     	cmpq	0xa8(%r12), %rcx
1454cbd82:     	jae	0x1454cc9d3 <.text+0x54cb9d3>
1454cbd88:     	movq	0xa0(%r12), %rax
1454cbd90:     	leaq	(%rcx,%rcx,2), %rcx
1454cbd94:     	leaq	(%rax,%rcx,8), %rbx
1454cbd98:     	movq	0x10(%rax,%rcx,8), %rdi
1454cbd9d:     	testq	%rdi, %rdi
1454cbda0:     	je	0x1454cc99e <.text+0x54cb99e>
1454cbda6:     	movq	0x8(%rbx), %rax
1454cbdaa:     	xorl	%edx, %edx
1454cbdac:     	nopl	(%rax)
1454cbdb0:     	movaps	%xmm11, %xmm0
1454cbdb4:     	subss	(%rax,%rdx,4), %xmm0
1454cbdb9:     	ucomiss	%xmm0, %xmm15
1454cbdbd:     	jbe	0x1454ccd8a <.text+0x54cbd8a>
1454cbdc3:     	incq	%rdx
1454cbdc6:     	cmpq	%rdx, %rdi
1454cbdc9:     	jne	0x1454cbdb0 <.text+0x54cadb0>
1454cbdcb:     	cmpq	0x200(%rbp), %rdi
1454cbdd2:     	jae	0x1454ccde4 <.text+0x54cbde4>
1454cbdd8:     	jmp	0x1454cc9ad <.text+0x54cb9ad>

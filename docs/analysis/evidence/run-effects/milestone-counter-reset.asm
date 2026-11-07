
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cc99e:     	xorl	%edi, %edi
1454cc9a0:     	cmpq	0x200(%rbp), %rdi
1454cc9a7:     	jae	0x1454ccde4 <.text+0x54cbde4>
1454cc9ad:     	cmpq	(%rbx), %rdi
1454cc9b0:     	jne	0x1454cc9bb <.text+0x54cb9bb>
1454cc9b2:     	movq	%rbx, %rcx
1454cc9b5:     	callq	0x145777a50 <.text+0x5776a50>
1454cc9ba:     	nop
1454cc9bb:     	movq	0x8(%rbx), %rax
1454cc9bf:     	movss	%xmm11, (%rax,%rdi,4)
1454cc9c5:     	incq	%rdi
1454cc9c8:     	movq	%rdi, 0x10(%rbx)
1454cc9cc:     	movq	0x208(%rbp), %rcx
1454cc9d3:     	movq	%r15, 0x1f0(%rbp)
1454cc9da:     	movq	0x90(%r12), %rdx
1454cc9e2:     	cmpq	%rdx, %rcx
1454cc9e5:     	jae	0x1454cf2af <.text+0x54ce2af>
1454cc9eb:     	movq	0x88(%r12), %rax
1454cc9f3:     	movl	$0x0, (%rax,%rcx,4)
1454cc9fa:     	testq	%r14, %r14
1454cc9fd:     	movl	0x1fc(%rbp), %eax
1454cca03:     	jne	0x1454cde33 <.text+0x54cce33>
1454cca09:     	testl	%eax, %eax
1454cca0b:     	movq	0x1f0(%rbp), %r15
1454cca12:     	je	0x1454ccde4 <.text+0x54cbde4>
1454cca18:     	movzbl	0x29c(%r12), %eax
1454cca21:     	addb	$-0x2, %al
1454cca23:     	leaq	0x1268e1e(%rip), %rcx   # 0x146735848
1454cca2a:     	cmpb	$0x9, %al
1454cca2c:     	ja	0x1454cca3c <.text+0x54cba3c>
1454cca2e:     	movzbl	%al, %eax
1454cca31:     	leaq	0x152ba88(%rip), %rcx   # 0x1469f84c0
1454cca38:     	movq	(%rcx,%rax,8), %rcx

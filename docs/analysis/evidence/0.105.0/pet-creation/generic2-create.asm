
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592cf39:     	movq	%rcx, %r9
14592cf3c:     	andq	$-0x2, %r9
14592cf40:     	leaq	0x88(%rax), %r10
14592cf47:     	xorl	%r8d, %r8d
14592cf4a:     	xorl	%edx, %edx
14592cf4c:     	cmpq	%rbx, -0x78(%r10)
14592cf50:     	sete	%r11b
14592cf54:     	andb	-0x88(%r10), %r11b
14592cf5b:     	movzbl	%r11b, %r11d
14592cf5f:     	addq	%rdx, %r11
14592cf62:     	cmpq	%rbx, (%r10)
14592cf65:     	sete	%dl
14592cf68:     	andb	-0x10(%r10), %dl
14592cf6c:     	movzbl	%dl, %edx
14592cf6f:     	addq	%r11, %rdx
14592cf72:     	addq	$0x2, %r8
14592cf76:     	addq	$0xf0, %r10
14592cf7d:     	cmpq	%r8, %r9
14592cf80:     	jne	0x14592cf4c <.text+0x592bf4c>
14592cf82:     	testb	$0x1, %cl
14592cf85:     	je	0x14592cfa2 <.text+0x592bfa2>
14592cf87:     	movq	%rdx, %rcx
14592cf8a:     	imulq	$0x78, %r8, %rdx
14592cf8e:     	cmpq	%rbx, 0x10(%rax,%rdx)
14592cf93:     	sete	%r8b
14592cf97:     	andb	(%rax,%rdx), %r8b
14592cf9b:     	movzbl	%r8b, %edx
14592cf9f:     	addq	%rcx, %rdx
14592cfa2:     	cmpq	%r14, %rdx
14592cfa5:     	jae	0x145929e10 <.text+0x5928e10>
14592cfab:     	movd	%esi, %xmm0
14592cfaf:     	addss	%xmm11, %xmm0
14592cfb4:     	movss	%xmm0, 0x130(%rbp)
14592cfbc:     	movq	%rbx, 0x138(%rbp)
14592cfc3:     	movq	$0x1, 0x128(%rbp)
14592cfce:     	xorps	%xmm1, %xmm1
14592cfd1:     	movq	0x48(%rbp), %rcx
14592cfd5:     	movss	0x44706b(%rip), %xmm2   # 0x145d74048
14592cfdd:     	callq	0x145961d00 <.text+0x5960d00>
14592cfe2:     	nop
14592cfe3:     	movl	$0x0, 0x100(%rbp)
14592cfed:     	leaq	0x100(%rbp), %rax
14592cff4:     	movq	%rax, 0x20(%rsp)
14592cff9:     	movq	0x218(%rbp), %rcx
14592d000:     	movq	%rdi, %rdx
14592d003:     	movaps	%xmm0, %xmm2
14592d006:     	leaq	0x128(%rbp), %r9
14592d00d:     	callq	0x145928bd0 <.text+0x5927bd0>
14592d012:     	nop

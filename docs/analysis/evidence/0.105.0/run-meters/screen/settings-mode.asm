
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140168f0c:     	movss	0x14(%rcx), %xmm1
140168f11:     	cvttss2si	%xmm1, %rax
140168f16:     	movq	%rax, %rcx
140168f19:     	movaps	%xmm1, %xmm2
140168f1c:     	subss	0x5c34f3c(%rip), %xmm2  # 0x145d9de60
140168f24:     	sarq	$0x3f, %rcx
140168f28:     	cvttss2si	%xmm2, %rdx
140168f2d:     	andq	%rcx, %rdx
140168f30:     	orq	%rax, %rdx
140168f33:     	xorl	%r13d, %r13d
140168f36:     	ucomiss	%xmm0, %xmm1
140168f39:     	movl	$0x0, %ecx
140168f3e:     	cmovaeq	%rdx, %rcx
140168f42:     	ucomiss	0x5c34f1b(%rip), %xmm1  # 0x145d9de64
140168f49:     	movq	$-0x1, %rax
140168f50:     	cmovbeq	%rcx, %rax
140168f54:     	cmpq	$0x3, %rax
140168f58:     	jae	0x1401665cd <.text+0x1655cd>
140168f5e:     	leaq	0x5c4d733(%rip), %rcx   # 0x145db6698
140168f65:     	movzbl	(%rax,%rcx), %r13d

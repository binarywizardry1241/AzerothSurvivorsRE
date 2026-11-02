
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14594f9d2:     	cmpl	$-0x1, 0xc0(%rbp)
14594f9d9:     	je	0x14594f8f0 <.text+0x594e8f0>
14594f9df:     	movl	0xc0(%rbp), %eax
14594f9e5:     	movl	%eax, (%rbp)
14594f9e8:     	movq	-0x8(%rbp), %rax
14594f9ec:     	movq	%rax, 0x4(%rbp)
14594f9f0:     	movq	0x970(%rdi), %rax
14594f9f7:     	movq	0x958(%rdi), %rcx
14594f9fe:     	movq	0x960(%rdi), %rdx
14594fa05:     	leaq	(%rax,%rcx), %r8
14594fa09:     	rolq	$0x17, %r8
14594fa0d:     	addq	%rcx, %r8
14594fa10:     	movq	%rdx, %r9
14594fa13:     	shlq	$0x11, %r9
14594fa17:     	movq	0x968(%rdi), %r10
14594fa1e:     	xorq	%rcx, %r10
14594fa21:     	xorq	%rdx, %rax
14594fa24:     	xorq	%r10, %rdx
14594fa27:     	movq	%rdx, 0x960(%rdi)
14594fa2e:     	xorq	%rax, %rcx
14594fa31:     	movq	%rcx, 0x958(%rdi)
14594fa38:     	xorq	%r9, %r10
14594fa3b:     	movq	%r10, 0x968(%rdi)
14594fa42:     	rolq	$0x2d, %rax
14594fa46:     	shrq	$0x28, %r8
14594fa4a:     	xorps	%xmm0, %xmm0
14594fa4d:     	cvtsi2ss	%r8d, %xmm0
14594fa52:     	movq	%rax, 0x970(%rdi)
14594fa59:     	mulss	%xmm8, %xmm0
14594fa5e:     	ucomiss	%xmm0, %xmm10
14594fa62:     	jbe	0x14594f8f0 <.text+0x594e8f0>
14594fa68:     	movl	0xb4(%rbp), %eax
14594fa6e:     	movl	%eax, 0x20(%rsp)
14594fa72:     	movq	%rdi, %rcx
14594fa75:     	movq	%r15, %rdx
14594fa78:     	movq	%rbp, %r8
14594fa7b:     	movaps	%xmm7, %xmm3
14594fa7e:     	callq	0x1459251b0 <.text+0x59241b0>
14594fa83:     	nop
14594fa84:     	jmp	0x14594f8f0 <.text+0x594e8f0>

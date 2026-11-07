
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cc453:     	movq	0x200(%rbp), %rax
1454cc45a:     	movl	%eax, 0x180(%rbp)
1454cc460:     	movl	%r13d, 0x184(%rbp)
1454cc467:     	movq	%rsi, 0x188(%rbp)
1454cc46e:     	movq	%r14, 0x190(%rbp)
1454cc475:     	movq	%rdx, 0x198(%rbp)
1454cc47c:     	movq	%r12, %rcx
1454cc47f:     	leaq	0x180(%rbp), %rdx
1454cc486:     	movq	0x178(%rbp), %r8
1454cc48d:     	callq	0x1454cb900 <.text+0x54ca900>
1454cc492:     	nop
1454cc493:     	testb	%al, %al
1454cc495:     	movl	0x1fc(%rbp), %r9d
1454cc49c:     	movq	0x1e0(%rbp), %r8
1454cc4a3:     	movq	%rdi, %r10
1454cc4a6:     	je	0x1454cc638 <.text+0x54cb638>
1454cc4ac:     	movq	0x4e8(%r12), %rcx
1454cc4b4:     	testq	%rcx, %rcx
1454cc4b7:     	je	0x1454cc638 <.text+0x54cb638>
1454cc4bd:     	movd	%ebx, %xmm2
1454cc4c1:     	movq	0x4e0(%r12), %rax
1454cc4c9:     	imulq	$0x160, %rcx, %rdx      # imm = 0x160
1454cc4d0:     	xorl	%ecx, %ecx
1454cc4d2:     	jmp	0x1454cc4f0 <.text+0x54cb4f0>
1454cc4d4:     	nopw	%cs:(%rax,%rax)
1454cc4e0:     	addq	$0x160, %rcx            # imm = 0x160
1454cc4e7:     	cmpq	%rcx, %rdx
1454cc4ea:     	je	0x1454cc638 <.text+0x54cb638>
1454cc4f0:     	cmpq	%r8, 0x88(%rax,%rcx)
1454cc4f8:     	jne	0x1454cc4e0 <.text+0x54cb4e0>
1454cc4fa:     	cmpl	$0x1, 0x68(%rax,%rcx)
1454cc4ff:     	je	0x1454cc4e0 <.text+0x54cb4e0>
1454cc501:     	jmp	0x1454cd244 <.text+0x54cc244>

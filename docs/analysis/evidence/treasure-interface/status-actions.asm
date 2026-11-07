
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ce02d:     	movq	0x200(%rbp), %rax
1454ce034:     	cmpl	$0x5, %eax
1454ce037:     	je	0x1454cec28 <.text+0x54cdc28>
1454ce03d:     	cmpl	$-0x1, %eax
1454ce040:     	movq	0x1e0(%rbp), %rdx
1454ce047:     	jne	0x1454cec85 <.text+0x54cdc85>
1454ce04d:     	movq	0x4e8(%r12), %rcx
1454ce055:     	testq	%rcx, %rcx
1454ce058:     	je	0x1454cf10c <.text+0x54ce10c>
1454ce05e:     	movd	%esi, %xmm0
1454ce062:     	movq	0x4e0(%r12), %rax
1454ce06a:     	imulq	$0x160, %rcx, %r8       # imm = 0x160
1454ce071:     	xorl	%ecx, %ecx
1454ce073:     	jmp	0x1454ce085 <.text+0x54cd085>
1454ce075:     	addq	$0x160, %rcx            # imm = 0x160
1454ce07c:     	cmpq	%rcx, %r8
1454ce07f:     	je	0x1454cf10c <.text+0x54ce10c>
1454ce085:     	cmpq	%rdx, 0x88(%rax,%rcx)
1454ce08d:     	jne	0x1454ce075 <.text+0x54cd075>
1454ce08f:     	cmpl	$0x1, 0x68(%rax,%rcx)
1454ce094:     	je	0x1454ce075 <.text+0x54cd075>
1454ce096:     	addss	%xmm11, %xmm0
1454ce09b:     	movl	%r13d, 0xa8(%rax,%rcx)
1454ce0a3:     	movss	%xmm0, 0xac(%rax,%rcx)
1454ce0ac:     	movq	%r15, %rdi
1454ce0af:     	jmp	0x1454cbc68 <.text+0x54cac68>


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cecba:     	movq	%rcx, %r9
1454cecbd:     	andq	$-0x2, %r9
1454cecc1:     	leaq	0x70(%rax), %r10
1454cecc5:     	xorl	%r8d, %r8d
1454cecc8:     	xorl	%edx, %edx
1454cecca:     	movq	0x208(%rbp), %rdi
1454cecd1:     	cmpq	%rdi, -0x60(%r10)
1454cecd5:     	sete	%r11b
1454cecd9:     	andb	-0x70(%r10), %r11b
1454cecdd:     	movzbl	%r11b, %r11d
1454cece1:     	addq	%rdx, %r11
1454cece4:     	cmpq	%rdi, (%r10)
1454cece7:     	sete	%dl
1454cecea:     	andb	-0x10(%r10), %dl
1454cecee:     	movzbl	%dl, %edx
1454cecf1:     	addq	%r11, %rdx
1454cecf4:     	addq	$0x2, %r8
1454cecf8:     	addq	$0xc0, %r10
1454cecff:     	cmpq	%r8, %r9
1454ced02:     	jne	0x1454cecd1 <.text+0x54cdcd1>
1454ced04:     	testb	$0x1, %cl
1454ced07:     	je	0x1454ced2f <.text+0x54cdd2f>
1454ced09:     	movq	%rdx, %rcx
1454ced0c:     	leaq	(%r8,%r8,2), %rdx
1454ced10:     	shlq	$0x5, %rdx
1454ced14:     	movq	0x208(%rbp), %r8
1454ced1b:     	cmpq	%r8, 0x10(%rax,%rdx)
1454ced20:     	sete	%r8b
1454ced24:     	andb	(%rax,%rdx), %r8b
1454ced28:     	movzbl	%r8b, %edx
1454ced2c:     	addq	%rcx, %rdx
1454ced2f:     	cmpq	%r13, %rdx
1454ced32:     	jae	0x1454ced8d <.text+0x54cdd8d>
1454ced34:     	movss	0x200(%rbp), %xmm0
1454ced3c:     	addss	%xmm11, %xmm0
1454ced41:     	movss	%xmm0, 0x148(%rbp)
1454ced49:     	movq	0x208(%rbp), %rax
1454ced50:     	movq	%rax, 0x150(%rbp)
1454ced57:     	movq	$0x1, 0x140(%rbp)
1454ced62:     	xorps	%xmm1, %xmm1
1454ced65:     	movq	0x8(%rbp), %rcx
1454ced69:     	movss	0x43a873(%rip), %xmm2   # 0x1459095e4
1454ced71:     	callq	0x14550d590 <.text+0x550c590>
1454ced76:     	nop
1454ced77:     	movq	%r12, %rcx
1454ced7a:     	movq	%rsi, %rdx
1454ced7d:     	movaps	%xmm0, %xmm2
1454ced80:     	leaq	0x140(%rbp), %r9
1454ced87:     	callq	0x1454caaa0 <.text+0x54c9aa0>
1454ced8c:     	nop
1454ced8d:     	movq	0x1f0(%rbp), %rdi
1454ced94:     	jmp	0x1454cbc68 <.text+0x54cac68>

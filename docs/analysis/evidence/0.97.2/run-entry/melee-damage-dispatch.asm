
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cc190:     	addq	$0x10, %r12
1454cc194:     	movq	0x540(%r13), %rax
1454cc19b:     	movq	%rsi, %rcx
1454cc19e:     	shlq	$0x5, %rcx
1454cc1a2:     	movups	0x1f0(%rbp), %xmm0
1454cc1a9:     	movups	0x200(%rbp), %xmm1
1454cc1b0:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cc1b5:     	movups	%xmm0, (%rax,%rcx)
1454cc1b9:     	incq	%rsi
1454cc1bc:     	movq	%rsi, 0x548(%r13)
1454cc1c3:     	movq	%r13, %rcx
1454cc1c6:     	movaps	%xmm7, %xmm1
1454cc1c9:     	movq	%r14, %r8
1454cc1cc:     	movb	$0x1, %r9b
1454cc1cf:     	callq	0x14548f420 <.text+0x548e420>
1454cc1d4:     	nop
1454cc1d5:     	cmpq	%rdi, %r12
1454cc1d8:     	je	0x1454cc255 <.text+0x54cb255>
1454cc1da:     	movss	(%r12), %xmm7
1454cc1e0:     	movaps	%xmm12, %xmm0
1454cc1e4:     	subss	0x478(%r13), %xmm0
1454cc1ed:     	mulss	%xmm7, %xmm0
1454cc1f1:     	maxss	%xmm12, %xmm0
1454cc1f6:     	cvttss2si	%xmm0, %rax
1454cc1fb:     	ucomiss	%xmm8, %xmm0
1454cc1ff:     	cmovbl	%r15d, %eax
1454cc203:     	ucomiss	%xmm13, %xmm0
1454cc207:     	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
1454cc20d:     	ja	0x1454cc212 <.text+0x54cb212>
1454cc20f:     	movl	%eax, %r9d
1454cc212:     	movq	0x8(%r12), %r14
1454cc217:     	movq	0x3d0(%r13), %r8
1454cc21e:     	movb	$0x0, 0x20(%rsp)
1454cc223:     	movq	%rbx, %rcx
1454cc226:     	movq	%r14, %rdx
1454cc229:     	callq	0x145441e90 <.text+0x5440e90>
1454cc22e:     	nop
1454cc22f:     	movq	0x548(%r13), %rsi
1454cc236:     	cmpq	0x538(%r13), %rsi
1454cc23d:     	jne	0x1454cc190 <.text+0x54cb190>
1454cc243:     	movq	0x290(%rbp), %rcx
1454cc24a:     	callq	0x1457580b0 <.text+0x57570b0>
1454cc24f:     	nop
1454cc250:     	jmp	0x1454cc190 <.text+0x54cb190>

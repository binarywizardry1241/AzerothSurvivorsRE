
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
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

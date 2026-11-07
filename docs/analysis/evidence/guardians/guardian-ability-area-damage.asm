
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cd09d:     	callq	0x140002200 <.text+0x1200>
1454cd0a2:     	movl	$0x8, %ecx
1454cd0a7:     	movl	$0x8, %edx
1454cd0ac:     	callq	0x1400021c0 <.text+0x11c0>
1454cd0b1:     	testq	%rax, %rax
1454cd0b4:     	je	0x1454ce661 <.text+0x54cd661>
1454cd0ba:     	movq	%rax, %r9
1454cd0bd:     	movq	0x2a0(%rbp), %rax
1454cd0c4:     	movq	0x3d0(%rax), %rax
1454cd0cb:     	movq	%rax, (%r9)
1454cd0ce:     	movl	$0x1, %ecx
1454cd0d3:     	movl	$0x2, 0x190(%rbp)
1454cd0dd:     	movl	$0x0, 0x1b8(%rbp)
1454cd0e7:     	movb	%bl, 0x1b0(%rbp)
1454cd0ed:     	movb	%bl, 0x283(%rbp)
1454cd0f3:     	leaq	0x1b8(%rbp), %rax
1454cd0fa:     	movq	%rax, 0x30(%rsp)
1454cd0ff:     	leaq	0x190(%rbp), %rax
1454cd106:     	movq	%rax, 0x28(%rsp)
1454cd10b:     	movq	%rcx, 0x170(%rbp)
1454cd112:     	movq	%rcx, 0x20(%rsp)
1454cd117:     	leaq	0x1f0(%rbp), %rcx
1454cd11e:     	movq	%r13, %rdx
1454cd121:     	movl	%r15d, %r8d
1454cd124:     	movq	%r9, 0x240(%rbp)
1454cd12b:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454cd130:     	nop
1454cd131:     	movq	0x2a0(%rbp), %rax
1454cd138:     	movq	0x548(%rax), %rsi
1454cd13f:     	cmpq	0x538(%rax), %rsi
1454cd146:     	jne	0x1454cd155 <.text+0x54cc155>
1454cd148:     	movq	0x290(%rbp), %rcx
1454cd14f:     	callq	0x1457580b0 <.text+0x57570b0>
1454cd154:     	nop
1454cd155:     	movq	%rsi, %rax
1454cd158:     	shlq	$0x5, %rax
1454cd15c:     	incq	%rsi
1454cd15f:     	ucomiss	%xmm6, %xmm9
1454cd163:     	movq	0x2a0(%rbp), %rcx
1454cd16a:     	movq	0x540(%rcx), %rdx
1454cd171:     	movups	0x1f0(%rbp), %xmm0
1454cd178:     	movups	0x200(%rbp), %xmm1
1454cd17f:     	movups	%xmm1, 0x10(%rdx,%rax)
1454cd184:     	movups	%xmm0, (%rdx,%rax)
1454cd188:     	movq	%rsi, 0x548(%rcx)
1454cd18f:     	jb	0x1454ccbb0 <.text+0x54cbbb0>
1454cd195:     	mulss	%xmm7, %xmm8
1454cd19a:     	movb	$0x0, 0x283(%rbp)
1454cd1a1:     	movaps	%xmm8, %xmm1
1454cd1a5:     	movq	%r13, %r8
1454cd1a8:     	xorl	%r9d, %r9d
1454cd1ab:     	callq	0x14548f420 <.text+0x548e420>
1454cd1b0:     	nop
1454cd1b1:     	movq	0x170(%rbp), %rdx
1454cd1b8:     	shll	$0x3, %edx
1454cd1bb:     	movl	$0x8, %r8d
1454cd1c1:     	movq	0x240(%rbp), %rcx
1454cd1c8:     	callq	0x1400021d0 <.text+0x11d0>
1454cd1cd:     	jmp	0x1454ccbb0 <.text+0x54cbbb0>

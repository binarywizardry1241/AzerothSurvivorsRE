
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c6a59:     	addl	0x414(%rcx), %edi
1454c6a5f:     	movl	%edi, 0x414(%rcx)
1454c6a65:     	leaq	0x8d8(%rcx), %r15
1454c6a6c:     	movss	0x440a94(%rip), %xmm7   # 0x145907508
1454c6a74:     	movss	0x451dc3(%rip), %xmm8   # 0x145918840
1454c6a7d:     	movss	0x440a92(%rip), %xmm9   # 0x145907518
1454c6a86:     	xorps	%xmm10, %xmm10
1454c6a8a:     	movss	0x440a99(%rip), %xmm11  # 0x14590752c
1454c6a93:     	movq	%rbp, %r14
1454c6a96:     	leaq	0x20(%rbp), %r13
1454c6a9a:     	movss	0x440a99(%rip), %xmm12  # 0x14590753c
1454c6aa3:     	movss	0x440a70(%rip), %xmm13  # 0x14590751c
1454c6aac:     	jmp	0x1454c6aba <.text+0x54c5aba>
1454c6aae:     	nop
1454c6ab0:     	movl	%edi, 0x8(%rax,%rdx,4)
1454c6ab4:     	movl	0x414(%rsi), %edi
1454c6aba:     	movl	0x410(%rsi), %r12d
1454c6ac1:     	cmpl	$0x1, %r12d
1454c6ac5:     	movl	%r12d, %eax
1454c6ac8:     	adcl	$-0x1, %eax
1454c6acb:     	xorps	%xmm1, %xmm1
1454c6ace:     	cvtsi2ss	%rax, %xmm1
1454c6ad3:     	movaps	%xmm1, %xmm0
1454c6ad6:     	mulss	%xmm9, %xmm0
1454c6adb:     	mulss	%xmm1, %xmm0
1454c6adf:     	mulss	%xmm7, %xmm1
1454c6ae3:     	addss	%xmm8, %xmm1
1454c6ae8:     	addss	%xmm1, %xmm0
1454c6aec:     	callq	0x14577322f <.text+0x577222f>
1454c6af1:     	cvttss2si	%xmm0, %rax
1454c6af6:     	ucomiss	%xmm10, %xmm0
1454c6afa:     	movl	$0x0, %ecx
1454c6aff:     	cmovbl	%ecx, %eax
1454c6b02:     	ucomiss	%xmm11, %xmm0
1454c6b06:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454c6b0b:     	cmoval	%ecx, %eax
1454c6b0e:     	cmpl	$0x62, %r12d
1454c6b12:     	ja	0x1454c727b <.text+0x54c627b>
1454c6b18:     	movl	%edi, %ecx
1454c6b1a:     	subl	%eax, %ecx
1454c6b1c:     	jb	0x1454c727b <.text+0x54c627b>
1454c6b22:     	movl	%ecx, 0x414(%rsi)
1454c6b28:     	incl	%r12d
1454c6b2b:     	movl	%r12d, 0x410(%rsi)
1454c6b32:     	incl	0x93c(%rsi)

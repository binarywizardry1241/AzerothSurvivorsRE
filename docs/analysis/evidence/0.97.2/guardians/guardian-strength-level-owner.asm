
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b49fa:     	movl	0x3f8(%rsi), %r12d
1454b4a01:     	cmpl	$0x1, %r12d
1454b4a05:     	movl	%r12d, %eax
1454b4a08:     	adcl	$-0x1, %eax
1454b4a0b:     	xorps	%xmm1, %xmm1
1454b4a0e:     	cvtsi2ss	%rax, %xmm1
1454b4a13:     	movaps	%xmm1, %xmm0
1454b4a16:     	mulss	%xmm9, %xmm0
1454b4a1b:     	mulss	%xmm1, %xmm0
1454b4a1f:     	mulss	%xmm7, %xmm1
1454b4a23:     	addss	%xmm8, %xmm1
1454b4a28:     	addss	%xmm1, %xmm0
1454b4a2c:     	callq	0x145756e1f <.text+0x5755e1f>
1454b4a31:     	cvttss2si	%xmm0, %rax
1454b4a36:     	ucomiss	%xmm10, %xmm0
1454b4a3a:     	movl	$0x0, %ecx
1454b4a3f:     	cmovbl	%ecx, %eax
1454b4a42:     	ucomiss	%xmm11, %xmm0
1454b4a46:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454b4a4b:     	cmoval	%ecx, %eax
1454b4a4e:     	cmpl	$0x62, %r12d
1454b4a52:     	ja	0x1454b51bb <.text+0x54b41bb>
1454b4a58:     	movl	%edi, %ecx
1454b4a5a:     	subl	%eax, %ecx
1454b4a5c:     	jb	0x1454b51bb <.text+0x54b41bb>
1454b4a62:     	movl	%ecx, 0x3fc(%rsi)
1454b4a68:     	incl	%r12d
1454b4a6b:     	movl	%r12d, 0x3f8(%rsi)
1454b4a72:     	incl	0x8ec(%rsi)

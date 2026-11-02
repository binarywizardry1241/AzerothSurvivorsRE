
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ccd73:     	callq	0x14540d290 <.text+0x540c290>
1454ccd78:     	nop
1454ccd79:     	movq	%rax, %rbx
1454ccd7c:     	movq	%rdx, %r14
1454ccd7f:     	movl	$0xf, %edx
1454ccd84:     	leaq	0x14deb25(%rip), %rcx   # 0x1469ab8b0
1454ccd8b:     	callq	0x145452400 <.text+0x5451400>
1454ccd90:     	nop
1454ccd91:     	testq	%rax, %rax
1454ccd94:     	leaq	0x14deb15(%rip), %rcx   # 0x1469ab8b0
1454ccd9b:     	cmoveq	%rcx, %rax
1454ccd9f:     	movl	$0xf, %ecx
1454ccda4:     	cmoveq	%rcx, %rdx
1454ccda8:     	movq	%rdx, 0x28(%rsp)
1454ccdad:     	movq	%rax, 0x20(%rsp)
1454ccdb2:     	leaq	0x1f0(%rbp), %rcx
1454ccdb9:     	movq	%r13, %rdx
1454ccdbc:     	movq	%rbx, %r8
1454ccdbf:     	movq	%r14, %r9
1454ccdc2:     	callq	0x145441160 <.text+0x5440160>
1454ccdc7:     	nop
1454ccdc8:     	movq	0x2a0(%rbp), %rbx
1454ccdcf:     	movq	0x548(%rbx), %rsi
1454ccdd6:     	cmpq	0x538(%rbx), %rsi
1454ccddd:     	jne	0x1454ccdec <.text+0x54cbdec>
1454ccddf:     	movq	0x290(%rbp), %rcx
1454ccde6:     	callq	0x1457580b0 <.text+0x57570b0>
1454ccdeb:     	nop
1454ccdec:     	movq	0x540(%rbx), %rax
1454ccdf3:     	movq	%rsi, %rcx
1454ccdf6:     	shlq	$0x5, %rcx
1454ccdfa:     	movups	0x1f0(%rbp), %xmm0
1454cce01:     	movups	0x200(%rbp), %xmm1
1454cce08:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cce0d:     	movups	%xmm0, (%rax,%rcx)
1454cce11:     	incq	%rsi
1454cce14:     	movq	%rsi, 0x548(%rbx)
1454cce1b:     	testl	%r15d, %r15d
1454cce1e:     	je	0x1454ccbb0 <.text+0x54cbbb0>
1454cce24:     	movl	%r15d, %eax
1454cce27:     	cvtsi2ss	%rax, %xmm9
1454cce2c:     	xorl	%ebx, %ebx
1454cce2e:     	nop
1454cce30:     	movl	%ebx, %eax
1454cce32:     	xorps	%xmm8, %xmm8
1454cce36:     	cvtsi2ss	%rax, %xmm8
1454cce3b:     	divss	%xmm9, %xmm8
1454cce40:     	mulss	0x4201cb(%rip), %xmm8   # 0x1458ed014
1454cce49:     	movaps	%xmm8, %xmm0
1454cce4d:     	callq	0x145756e31 <.text+0x5755e31>
1454cce52:     	movaps	%xmm0, %xmm7
1454cce55:     	movaps	%xmm8, %xmm0
1454cce59:     	callq	0x145756e2b <.text+0x5755e2b>
1454cce5e:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
1454cce61:     	mulps	0x51e428(%rip), %xmm7   # 0x1459eb290
1454cce68:     	addps	%xmm6, %xmm7
1454cce6b:     	movshdup	%xmm7, %xmm8            # xmm8 = xmm7[1,1,3,3]
1454cce70:     	movq	0x2a0(%rbp), %rax
1454cce77:     	movq	0x878(%rax), %rsi
1454cce7e:     	leaq	0x10(%rsi), %rcx
1454cce82:     	movaps	%xmm7, %xmm1
1454cce85:     	movaps	%xmm8, %xmm2
1454cce89:     	callq	0x1454627f0 <.text+0x54617f0>
1454cce8e:     	nop
1454cce8f:     	testb	$0x1, %al
1454cce91:     	jne	0x1454cced8 <.text+0x54cbed8>
1454cce93:     	cmpq	$-0x1, 0x68(%rsi)
1454cce98:     	je	0x1454cced0 <.text+0x54cbed0>
1454cce9a:     	leaq	0x68(%rsi), %rdx
1454cce9e:     	leaq	0x1f0(%rbp), %rcx
1454ccea5:     	movaps	%xmm7, %xmm2
1454ccea8:     	movaps	%xmm8, %xmm3
1454cceac:     	callq	0x145467bf0 <.text+0x5466bf0>
1454cceb1:     	nop
1454cceb2:     	cmpl	$0x1, 0x1f0(%rbp)
1454cceb9:     	jne	0x1454cced0 <.text+0x54cbed0>
1454ccebb:     	movss	0x1fc(%rbp), %xmm0
1454ccec3:     	jmp	0x1454cced8 <.text+0x54cbed8>
1454ccec5:     	nopw	%cs:(%rax,%rax)
1454cced0:     	movss	0x90(%rsi), %xmm0
1454cced8:     	movq	0x2a0(%rbp), %rcx
1454ccedf:     	imull	$0xaaaaaaab, %ebx, %eax # imm = 0xAAAAAAAB
1454ccee5:     	addl	$0xaaaaaaaa, %eax       # imm = 0xAAAAAAAA
1454cceea:     	xorl	%edx, %edx
1454cceec:     	cmpl	$0x55555555, %eax       # imm = 0x55555555
1454ccef1:     	setb	%dl
1454ccef4:     	movlps	%xmm7, 0x1f4(%rbp)
1454ccefb:     	movss	%xmm0, 0x1fc(%rbp)
1454ccf03:     	movl	$0x1, 0x1f0(%rbp)
1454ccf0d:     	leaq	0x1f0(%rbp), %r8
1454ccf14:     	callq	0x1454c2040 <.text+0x54c1040>
1454ccf19:     	nop
1454ccf1a:     	incl	%ebx
1454ccf1c:     	cmpl	%r15d, %ebx
1454ccf1f:     	jne	0x1454cce30 <.text+0x54cbe30>
1454ccf25:     	jmp	0x1454ccbb0 <.text+0x54cbbb0>

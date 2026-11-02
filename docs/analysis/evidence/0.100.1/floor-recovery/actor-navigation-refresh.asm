
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454db89e:     	movq	0x898(%r12), %rax
1454db8a6:     	lock
1454db8a7:     	incq	(%rax)
1454db8aa:     	jle	0x1454e094e <.text+0x54df94e>
1454db8b0:     	movq	0x898(%r12), %rdx
1454db8b8:     	movq	%rdx, 0xc0(%rbp)
1454db8bf:     	cmpq	$-0x1, 0x40(%rdx)
1454db8c4:     	movq	0x8c0(%r12), %rsi
1454db8cc:     	movaps	%xmm8, 0x10(%rbp)
1454db8d1:     	je	0x1454dbad6 <.text+0x54daad6>
1454db8d7:     	testq	%rsi, %rsi
1454db8da:     	je	0x1454db9c0 <.text+0x54da9c0>
1454db8e0:     	movsd	0x60(%rdx), %xmm1
1454db8e5:     	movaps	%xmm8, %xmm0
1454db8e9:     	subps	%xmm1, %xmm0
1454db8ec:     	xorps	%xmm1, %xmm1
1454db8ef:     	movaps	%xmm0, %xmm2
1454db8f2:     	cmpltps	%xmm1, %xmm2
1454db8f6:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
1454db8f9:     	movmskpd	%xmm2, %eax
1454db8fd:     	testl	%eax, %eax
1454db8ff:     	jne	0x1454db9a6 <.text+0x54da9a6>
1454db905:     	movss	0x42b8d3(%rip), %xmm1   # 0x1459071e0
1454db90d:     	movaps	%xmm0, %xmm2
1454db910:     	subss	%xmm1, %xmm2
1454db914:     	cvttss2si	%xmm2, %rcx
1454db919:     	cvttss2si	%xmm0, %r8
1454db91e:     	movq	%r8, %rax
1454db921:     	sarq	$0x3f, %rax
1454db925:     	andq	%rcx, %rax
1454db928:     	orq	%r8, %rax
1454db92b:     	xorl	%r8d, %r8d
1454db92e:     	xorps	%xmm2, %xmm2
1454db931:     	ucomiss	%xmm2, %xmm0
1454db934:     	cmovbq	%r8, %rax
1454db938:     	movss	0x42b8a4(%rip), %xmm3   # 0x1459071e4
1454db940:     	ucomiss	%xmm3, %xmm0
1454db943:     	movq	$-0x1, %r9
1454db94a:     	cmovaq	%r9, %rax
1454db94e:     	movshdup	%xmm0, %xmm0            # xmm0 = xmm0[1,1,3,3]
1454db952:     	movaps	%xmm0, %xmm4
1454db955:     	subss	%xmm1, %xmm4
1454db959:     	cvttss2si	%xmm4, %r10
1454db95e:     	cvttss2si	%xmm0, %r11
1454db963:     	movq	%r11, %rcx
1454db966:     	sarq	$0x3f, %rcx
1454db96a:     	andq	%r10, %rcx
1454db96d:     	orq	%r11, %rcx
1454db970:     	ucomiss	%xmm2, %xmm0
1454db973:     	cmovbq	%r8, %rcx
1454db977:     	ucomiss	%xmm3, %xmm0
1454db97a:     	cmovaq	%r9, %rcx
1454db97e:     	movq	0x58(%rdx), %r8
1454db982:     	cmpq	%r8, %rax
1454db985:     	setae	%r9b
1454db989:     	cmpq	%r8, %rcx
1454db98c:     	setae	%r10b
1454db990:     	orb	%r9b, %r10b
1454db993:     	jne	0x1454db9a6 <.text+0x54da9a6>
1454db995:     	imulq	%rcx, %r8
1454db999:     	addq	%rax, %r8
1454db99c:     	cmpq	0x28(%rsi), %r8
1454db9a0:     	je	0x1454dbadb <.text+0x54daadb>
1454db9a6:     	movaps	%xmm6, %xmm0
1454db9a9:     	subss	0x938(%r12), %xmm0
1454db9b3:     	ucomiss	0x42bb62(%rip), %xmm0   # 0x14590751c
1454db9ba:     	jb	0x1454dbadb <.text+0x54daadb>
1454db9c0:     	addq	$0x40, %rdx
1454db9c4:     	movshdup	%xmm8, %xmm3            # xmm3 = xmm8[1,1,3,3]
1454db9c9:     	movb	$0x1, 0x28f(%rbp)
1454db9d0:     	movb	$0x1, 0x28e(%rbp)
1454db9d7:     	movb	$0x1, 0x28d(%rbp)
1454db9de:     	movb	$0x1, 0x28c(%rbp)
1454db9e5:     	movb	$0x1, 0x28b(%rbp)
1454db9ec:     	movb	$0x1, 0x28a(%rbp)
1454db9f3:     	movb	$0x1, 0x289(%rbp)
1454db9fa:     	movb	$0x1, 0x288(%rbp)
1454dba01:     	movb	$0x1, 0x287(%rbp)
1454dba08:     	movb	$0x1, 0x286(%rbp)
1454dba0f:     	leaq	0x1f0(%rbp), %rcx
1454dba16:     	movaps	%xmm8, %xmm2
1454dba1a:     	callq	0x14552aaf0 <.text+0x5529af0>
1454dba1f:     	nop
1454dba20:     	movq	0x1f0(%rbp), %rsi
1454dba27:     	cmpq	$-0x1, %rsi
1454dba2b:     	je	0x1454dba87 <.text+0x54daa87>
1454dba2d:     	movq	0x1f8(%rbp), %rbx
1454dba34:     	callq	0x140002200 <.text+0x1200>
1454dba39:     	movl	$0x38, %ecx
1454dba3e:     	movl	$0x8, %edx
1454dba43:     	callq	0x1400021c0 <.text+0x11c0>
1454dba48:     	testq	%rax, %rax
1454dba4b:     	je	0x1454e0826 <.text+0x54df826>
1454dba51:     	movq	$0x1, (%rax)
1454dba58:     	movq	$0x1, 0x8(%rax)
1454dba60:     	movq	%rsi, 0x10(%rax)
1454dba64:     	movq	%rbx, 0x18(%rax)
1454dba68:     	movups	0x200(%rbp), %xmm0
1454dba6f:     	movups	%xmm0, 0x20(%rax)
1454dba73:     	movq	0x210(%rbp), %rdx
1454dba7a:     	movq	%rax, 0x290(%rbp)
1454dba81:     	movq	%rdx, 0x30(%rax)
1454dba85:     	jmp	0x1454dba92 <.text+0x54daa92>
1454dba87:     	movq	$0x0, 0x290(%rbp)
1454dba92:     	leaq	0x8c0(%r12), %rax
1454dba9a:     	movq	%rax, 0x260(%rbp)
1454dbaa1:     	movq	(%rax), %rax
1454dbaa4:     	testq	%rax, %rax
1454dbaa7:     	je	0x1454dbabd <.text+0x54daabd>
1454dbaa9:     	lock
1454dbaaa:     	decq	(%rax)
1454dbaad:     	jne	0x1454dbabd <.text+0x54daabd>
1454dbaaf:     	leaq	0x8c0(%r12), %rcx
1454dbab7:     	callq	0x145427f30 <.text+0x5426f30>
1454dbabc:     	nop
1454dbabd:     	movq	0x290(%rbp), %rsi
1454dbac4:     	movq	%rsi, 0x8c0(%r12)
1454dbacc:     	movss	%xmm6, 0x938(%r12)

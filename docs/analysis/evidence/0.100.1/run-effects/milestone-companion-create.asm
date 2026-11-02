
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454caaa0:     	pushq	%rbp
1454caaa1:     	pushq	%r15
1454caaa3:     	pushq	%r14
1454caaa5:     	pushq	%r12
1454caaa7:     	pushq	%rsi
1454caaa8:     	pushq	%rdi
1454caaa9:     	pushq	%rbx
1454caaaa:     	subq	$0x140, %rsp            # imm = 0x140
1454caab1:     	leaq	0x80(%rsp), %rbp
1454caab9:     	movaps	%xmm10, 0xb0(%rbp)
1454caac1:     	movaps	%xmm9, 0xa0(%rbp)
1454caac9:     	movaps	%xmm8, 0x90(%rbp)
1454caad1:     	movaps	%xmm7, 0x80(%rbp)
1454caad8:     	movaps	%xmm6, 0x70(%rbp)
1454caadc:     	movq	$-0x2, 0x68(%rbp)
1454caae4:     	movq	%r9, %rbx
1454caae7:     	movaps	%xmm2, %xmm6
1454caaea:     	movq	%rdx, %rdi
1454caaed:     	movq	%rcx, %rsi
1454caaf0:     	movss	0x40c(%rcx), %xmm10
1454caaf9:     	movaps	%xmm2, %xmm8
1454caafd:     	addss	%xmm10, %xmm8
1454cab02:     	movaps	%xmm8, %xmm0
1454cab06:     	callq	0x145773247 <.text+0x5772247>
1454cab0b:     	movaps	%xmm0, %xmm7
1454cab0e:     	movaps	%xmm8, %xmm0
1454cab12:     	callq	0x145773235 <.text+0x5772235>
1454cab17:     	movsd	0x400(%rsi), %xmm1
1454cab1f:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
1454cab22:     	mulps	0x152b307(%rip), %xmm7  # 0x1469f5e30
1454cab29:     	addps	%xmm1, %xmm7
1454cab2c:     	movshdup	%xmm7, %xmm9            # xmm9 = xmm7[1,1,3,3]
1454cab31:     	movq	0x898(%rsi), %r14
1454cab38:     	leaq	0x10(%r14), %rcx
1454cab3c:     	movaps	%xmm7, %xmm1
1454cab3f:     	movaps	%xmm9, %xmm2
1454cab43:     	callq	0x14552a140 <.text+0x5529140>
1454cab48:     	testb	$0x1, %al
1454cab4a:     	je	0x1454cab52 <.text+0x54c9b52>
1454cab4c:     	movaps	%xmm0, %xmm8
1454cab50:     	jmp	0x1454cab84 <.text+0x54c9b84>
1454cab52:     	cmpq	$-0x1, 0x68(%r14)
1454cab57:     	je	0x1454cab7b <.text+0x54c9b7b>
1454cab59:     	leaq	0x68(%r14), %rdx
1454cab5d:     	leaq	0x30(%rbp), %rcx
1454cab61:     	movaps	%xmm7, %xmm2
1454cab64:     	movaps	%xmm9, %xmm3
1454cab68:     	callq	0x14552d220 <.text+0x552c220>
1454cab6d:     	cmpl	$0x1, 0x30(%rbp)
1454cab71:     	jne	0x1454cab7b <.text+0x54c9b7b>
1454cab73:     	movss	0x3c(%rbp), %xmm8
1454cab79:     	jmp	0x1454cab84 <.text+0x54c9b84>
1454cab7b:     	movss	0xb8(%r14), %xmm8
1454cab84:     	movl	0x10(%rdi), %r12d
1454cab88:     	movl	0x954(%rsi), %eax
1454cab8e:     	incl	%eax
1454cab90:     	movl	%eax, 0x954(%rsi)
1454cab96:     	movl	%r12d, %ecx
1454cab99:     	andl	$0xffffff, %ecx         # imm = 0xFFFFFF
1454cab9f:     	shlq	$0x18, %rcx
1454caba3:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454caba8:     	orq	%rcx, %rax
1454cabab:     	movabsq	$-0xed0000000000000, %r14 # imm = 0xF130000000000000
1454cabb5:     	orq	%rax, %r14
1454cabb8:     	movq	$0x0, 0x18(%rbp)
1454cabc0:     	movq	$0x0, 0x28(%rbp)
1454cabc8:     	leaq	0x18(%rbp), %r15
1454cabcc:     	movq	%r15, %rcx
1454cabcf:     	xorl	%edx, %edx
1454cabd1:     	movq	%r14, %r8
1454cabd4:     	callq	0x145513710 <.text+0x5512710>
1454cabd9:     	nop
1454cabda:     	movq	0x18(%rbp), %rax
1454cabde:     	testq	%rax, %rax
1454cabe1:     	je	0x1454cac4b <.text+0x54c9c4b>
1454cabe3:     	movq	0x20(%rbp), %rcx
1454cabe7:     	movw	$0x2, %dx
1454cabeb:     	movzwl	0x36(%rax), %r9d
1454cabf0:     	movl	%r9d, %r10d
1454cabf3:     	addl	%r10d, %r10d
1454cabf6:     	movq	$-0x1, %r8
1454cabfd:     	nopl	(%rax)
1454cac00:     	testq	%r10, %r10
1454cac03:     	je	0x1454cac30 <.text+0x54c9c30>
1454cac05:     	cmpw	0x3a(%rax,%r8,2), %dx
1454cac0b:     	seta	%r11b
1454cac0f:     	sbbb	$0x0, %r11b
1454cac13:     	incq	%r8
1454cac16:     	addq	$-0x2, %r10
1454cac1a:     	cmpb	$0x1, %r11b
1454cac1e:     	je	0x1454cac00 <.text+0x54c9c00>
1454cac20:     	movzbl	%r11b, %r9d
1454cac24:     	testl	%r9d, %r9d
1454cac27:     	jne	0x1454cac33 <.text+0x54c9c33>
1454cac29:     	jmp	0x1454cac40 <.text+0x54c9c40>
1454cac2b:     	nopl	(%rax,%rax)
1454cac30:     	movq	%r9, %r8
1454cac33:     	subq	$0x1, %rcx
1454cac37:     	jb	0x1454cac4d <.text+0x54c9c4d>
1454cac39:     	movq	0x50(%rax,%r8,8), %rax
1454cac3e:     	jmp	0x1454cabeb <.text+0x54c9beb>
1454cac40:     	movl	$0x9, 0x8(%rax,%r8,4)
1454cac49:     	jmp	0x1454cac7d <.text+0x54c9c7d>
1454cac4b:     	xorl	%eax, %eax
1454cac4d:     	movq	%r15, 0x30(%rbp)
1454cac51:     	movq	%rax, 0x38(%rbp)
1454cac55:     	movq	$0x0, 0x40(%rbp)
1454cac5d:     	movq	%r8, 0x48(%rbp)
1454cac61:     	movq	$0x2, 0x50(%rbp)
1454cac69:     	leaq	-0x8(%rbp), %rcx
1454cac6d:     	leaq	0x30(%rbp), %rdx
1454cac71:     	movl	$0x9, %r8d
1454cac77:     	callq	0x14552a730 <.text+0x5529730>
1454cac7c:     	nop
1454cac7d:     	movq	0x18(%rbp), %rax
1454cac81:     	testq	%rax, %rax
1454cac84:     	je	0x1454cace7 <.text+0x54c9ce7>
1454cac86:     	movq	0x20(%rbp), %rcx
1454cac8a:     	movw	$0x3, %dx
1454cac8e:     	movzwl	0x36(%rax), %r9d
1454cac93:     	movl	%r9d, %r10d
1454cac96:     	addl	%r10d, %r10d
1454cac99:     	movq	$-0x1, %r8
1454caca0:     	testq	%r10, %r10
1454caca3:     	je	0x1454cacd0 <.text+0x54c9cd0>
1454caca5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454cacab:     	seta	%r11b
1454cacaf:     	sbbb	$0x0, %r11b
1454cacb3:     	incq	%r8
1454cacb6:     	addq	$-0x2, %r10
1454cacba:     	cmpb	$0x1, %r11b
1454cacbe:     	je	0x1454caca0 <.text+0x54c9ca0>
1454cacc0:     	movzbl	%r11b, %r9d
1454cacc4:     	testl	%r9d, %r9d
1454cacc7:     	jne	0x1454cacd3 <.text+0x54c9cd3>
1454cacc9:     	jmp	0x1454cace0 <.text+0x54c9ce0>
1454caccb:     	nopl	(%rax,%rax)
1454cacd0:     	movq	%r9, %r8
1454cacd3:     	subq	$0x1, %rcx
1454cacd7:     	jb	0x1454cace9 <.text+0x54c9ce9>
1454cacd9:     	movq	0x50(%rax,%r8,8), %rax
1454cacde:     	jmp	0x1454cac8e <.text+0x54c9c8e>
1454cace0:     	movl	%r12d, 0x8(%rax,%r8,4)
1454cace5:     	jmp	0x1454cad16 <.text+0x54c9d16>
1454cace7:     	xorl	%eax, %eax
1454cace9:     	movq	%r15, 0x30(%rbp)
1454caced:     	movq	%rax, 0x38(%rbp)
1454cacf1:     	movq	$0x0, 0x40(%rbp)
1454cacf9:     	movq	%r8, 0x48(%rbp)
1454cacfd:     	movq	$0x3, 0x50(%rbp)
1454cad05:     	leaq	-0x8(%rbp), %rcx
1454cad09:     	leaq	0x30(%rbp), %rdx
1454cad0d:     	movl	%r12d, %r8d
1454cad10:     	callq	0x14552a730 <.text+0x5529730>
1454cad15:     	nop
1454cad16:     	movd	0x18(%rdi), %xmm9
1454cad1c:     	movq	0x18(%rbp), %rax
1454cad20:     	testq	%rax, %rax
1454cad23:     	je	0x1454cad89 <.text+0x54c9d89>
1454cad25:     	movq	0x20(%rbp), %rcx
1454cad29:     	movw	$0x4, %dx
1454cad2d:     	movzwl	0x36(%rax), %r8d
1454cad32:     	movl	%r8d, %r10d
1454cad35:     	addl	%r10d, %r10d
1454cad38:     	movq	$-0x1, %r9
1454cad3f:     	nop
1454cad40:     	testq	%r10, %r10
1454cad43:     	je	0x1454cad70 <.text+0x54c9d70>
1454cad45:     	cmpw	0x3a(%rax,%r9,2), %dx
1454cad4b:     	seta	%r11b
1454cad4f:     	sbbb	$0x0, %r11b
1454cad53:     	incq	%r9
1454cad56:     	addq	$-0x2, %r10
1454cad5a:     	cmpb	$0x1, %r11b
1454cad5e:     	je	0x1454cad40 <.text+0x54c9d40>
1454cad60:     	movzbl	%r11b, %r8d
1454cad64:     	testl	%r8d, %r8d
1454cad67:     	jne	0x1454cad73 <.text+0x54c9d73>
1454cad69:     	jmp	0x1454cad80 <.text+0x54c9d80>
1454cad6b:     	nopl	(%rax,%rax)
1454cad70:     	movq	%r8, %r9
1454cad73:     	subq	$0x1, %rcx
1454cad77:     	jb	0x1454cad8b <.text+0x54c9d8b>
1454cad79:     	movq	0x50(%rax,%r9,8), %rax
1454cad7e:     	jmp	0x1454cad2d <.text+0x54c9d2d>
1454cad80:     	movd	%xmm9, 0x8(%rax,%r9,4)
1454cad87:     	jmp	0x1454cadba <.text+0x54c9dba>
1454cad89:     	xorl	%eax, %eax
1454cad8b:     	movd	%xmm9, %r8d
1454cad90:     	movq	%r15, 0x30(%rbp)
1454cad94:     	movq	%rax, 0x38(%rbp)
1454cad98:     	movq	$0x0, 0x40(%rbp)
1454cada0:     	movq	%r9, 0x48(%rbp)
1454cada4:     	movq	$0x4, 0x50(%rbp)
1454cadac:     	leaq	-0x8(%rbp), %rcx
1454cadb0:     	leaq	0x30(%rbp), %rdx
1454cadb4:     	callq	0x14552a730 <.text+0x5529730>
1454cadb9:     	nop
1454cadba:     	movq	0x18(%rbp), %rax
1454cadbe:     	testq	%rax, %rax
1454cadc1:     	je	0x1454cae2b <.text+0x54c9e2b>
1454cadc3:     	movq	0x20(%rbp), %rcx
1454cadc7:     	movw	$0x16, %dx
1454cadcb:     	movzwl	0x36(%rax), %r9d
1454cadd0:     	movl	%r9d, %r10d
1454cadd3:     	addl	%r10d, %r10d
1454cadd6:     	movq	$-0x1, %r8
1454caddd:     	nopl	(%rax)
1454cade0:     	testq	%r10, %r10
1454cade3:     	je	0x1454cae10 <.text+0x54c9e10>
1454cade5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454cadeb:     	seta	%r11b
1454cadef:     	sbbb	$0x0, %r11b
1454cadf3:     	incq	%r8
1454cadf6:     	addq	$-0x2, %r10
1454cadfa:     	cmpb	$0x1, %r11b
1454cadfe:     	je	0x1454cade0 <.text+0x54c9de0>
1454cae00:     	movzbl	%r11b, %r9d
1454cae04:     	testl	%r9d, %r9d
1454cae07:     	jne	0x1454cae13 <.text+0x54c9e13>
1454cae09:     	jmp	0x1454cae20 <.text+0x54c9e20>
1454cae0b:     	nopl	(%rax,%rax)
1454cae10:     	movq	%r9, %r8
1454cae13:     	subq	$0x1, %rcx
1454cae17:     	jb	0x1454cae2d <.text+0x54c9e2d>
1454cae19:     	movq	0x50(%rax,%r8,8), %rax
1454cae1e:     	jmp	0x1454cadcb <.text+0x54c9dcb>
1454cae20:     	movl	$0x64, 0x8(%rax,%r8,4)
1454cae29:     	jmp	0x1454cae5d <.text+0x54c9e5d>
1454cae2b:     	xorl	%eax, %eax
1454cae2d:     	movq	%r15, 0x30(%rbp)
1454cae31:     	movq	%rax, 0x38(%rbp)
1454cae35:     	movq	$0x0, 0x40(%rbp)
1454cae3d:     	movq	%r8, 0x48(%rbp)
1454cae41:     	movq	$0x16, 0x50(%rbp)
1454cae49:     	leaq	-0x8(%rbp), %rcx
1454cae4d:     	leaq	0x30(%rbp), %rdx
1454cae51:     	movl	$0x64, %r8d
1454cae57:     	callq	0x14552a730 <.text+0x5529730>
1454cae5c:     	nop
1454cae5d:     	movq	0x18(%rbp), %rax
1454cae61:     	testq	%rax, %rax
1454cae64:     	je	0x1454caecb <.text+0x54c9ecb>
1454cae66:     	movq	0x20(%rbp), %rcx
1454cae6a:     	movw	$0x1c, %dx
1454cae6e:     	movzwl	0x36(%rax), %r9d
1454cae73:     	movl	%r9d, %r10d
1454cae76:     	addl	%r10d, %r10d
1454cae79:     	movq	$-0x1, %r8
1454cae80:     	testq	%r10, %r10
1454cae83:     	je	0x1454caeb0 <.text+0x54c9eb0>
1454cae85:     	cmpw	0x3a(%rax,%r8,2), %dx
1454cae8b:     	seta	%r11b
1454cae8f:     	sbbb	$0x0, %r11b
1454cae93:     	incq	%r8
1454cae96:     	addq	$-0x2, %r10
1454cae9a:     	cmpb	$0x1, %r11b
1454cae9e:     	je	0x1454cae80 <.text+0x54c9e80>
1454caea0:     	movzbl	%r11b, %r9d
1454caea4:     	testl	%r9d, %r9d
1454caea7:     	jne	0x1454caeb3 <.text+0x54c9eb3>
1454caea9:     	jmp	0x1454caec0 <.text+0x54c9ec0>
1454caeab:     	nopl	(%rax,%rax)
1454caeb0:     	movq	%r9, %r8
1454caeb3:     	subq	$0x1, %rcx
1454caeb7:     	jb	0x1454caecd <.text+0x54c9ecd>
1454caeb9:     	movq	0x50(%rax,%r8,8), %rax
1454caebe:     	jmp	0x1454cae6e <.text+0x54c9e6e>
1454caec0:     	movl	$0x64, 0x8(%rax,%r8,4)
1454caec9:     	jmp	0x1454caefd <.text+0x54c9efd>
1454caecb:     	xorl	%eax, %eax
1454caecd:     	movq	%r15, 0x30(%rbp)
1454caed1:     	movq	%rax, 0x38(%rbp)
1454caed5:     	movq	$0x0, 0x40(%rbp)
1454caedd:     	movq	%r8, 0x48(%rbp)
1454caee1:     	movq	$0x1c, 0x50(%rbp)
1454caee9:     	leaq	-0x8(%rbp), %rcx
1454caeed:     	leaq	0x30(%rbp), %rdx
1454caef1:     	movl	$0x64, %r8d
1454caef7:     	callq	0x14552a730 <.text+0x5529730>
1454caefc:     	nop
1454caefd:     	movl	0x410(%rsi), %r8d
1454caf04:     	movq	0x18(%rbp), %rax
1454caf08:     	testq	%rax, %rax
1454caf0b:     	je	0x1454caf77 <.text+0x54c9f77>
1454caf0d:     	movq	0x20(%rbp), %rcx
1454caf11:     	movw	$0x22, %dx
1454caf15:     	movzwl	0x36(%rax), %r10d
1454caf1a:     	movl	%r10d, %r11d
1454caf1d:     	addl	%r11d, %r11d
1454caf20:     	movq	$-0x1, %r9
1454caf27:     	nopw	(%rax,%rax)
1454caf30:     	testq	%r11, %r11
1454caf33:     	je	0x1454caf60 <.text+0x54c9f60>
1454caf35:     	cmpw	0x3a(%rax,%r9,2), %dx
1454caf3b:     	seta	%r12b
1454caf3f:     	sbbb	$0x0, %r12b
1454caf43:     	incq	%r9
1454caf46:     	addq	$-0x2, %r11
1454caf4a:     	cmpb	$0x1, %r12b
1454caf4e:     	je	0x1454caf30 <.text+0x54c9f30>
1454caf50:     	movzbl	%r12b, %r10d
1454caf54:     	testl	%r10d, %r10d
1454caf57:     	jne	0x1454caf63 <.text+0x54c9f63>
1454caf59:     	jmp	0x1454caf70 <.text+0x54c9f70>
1454caf5b:     	nopl	(%rax,%rax)
1454caf60:     	movq	%r10, %r9
1454caf63:     	subq	$0x1, %rcx
1454caf67:     	jb	0x1454caf79 <.text+0x54c9f79>
1454caf69:     	movq	0x50(%rax,%r9,8), %rax
1454caf6e:     	jmp	0x1454caf15 <.text+0x54c9f15>
1454caf70:     	movl	%r8d, 0x8(%rax,%r9,4)
1454caf75:     	jmp	0x1454cafa3 <.text+0x54c9fa3>
1454caf77:     	xorl	%eax, %eax
1454caf79:     	movq	%r15, 0x30(%rbp)
1454caf7d:     	movq	%rax, 0x38(%rbp)
1454caf81:     	movq	$0x0, 0x40(%rbp)
1454caf89:     	movq	%r9, 0x48(%rbp)
1454caf8d:     	movq	$0x22, 0x50(%rbp)
1454caf95:     	leaq	-0x8(%rbp), %rcx
1454caf99:     	leaq	0x30(%rbp), %rdx
1454caf9d:     	callq	0x14552a730 <.text+0x5529730>
1454cafa2:     	nop
1454cafa3:     	movzbl	0x29d(%rsi), %eax
1454cafaa:     	addb	$-0x2, %al
1454cafac:     	movl	$0x1, %r8d
1454cafb2:     	cmpb	$0x6, %al
1454cafb4:     	ja	0x1454cafc4 <.text+0x54c9fc4>
1454cafb6:     	movzbl	%al, %eax
1454cafb9:     	leaq	0x152d590(%rip), %rcx   # 0x1469f8550
1454cafc0:     	movl	(%rcx,%rax,4), %r8d
1454cafc4:     	movq	0x18(%rbp), %rax
1454cafc8:     	testq	%rax, %rax
1454cafcb:     	je	0x1454cb037 <.text+0x54ca037>
1454cafcd:     	movq	0x20(%rbp), %rcx
1454cafd1:     	movw	$0x23, %dx
1454cafd5:     	movzwl	0x36(%rax), %r10d
1454cafda:     	movl	%r10d, %r11d
1454cafdd:     	addl	%r11d, %r11d
1454cafe0:     	movq	$-0x1, %r9
1454cafe7:     	nopw	(%rax,%rax)
1454caff0:     	testq	%r11, %r11
1454caff3:     	je	0x1454cb020 <.text+0x54ca020>
1454caff5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454caffb:     	seta	%r12b
1454cafff:     	sbbb	$0x0, %r12b
1454cb003:     	incq	%r9
1454cb006:     	addq	$-0x2, %r11
1454cb00a:     	cmpb	$0x1, %r12b
1454cb00e:     	je	0x1454caff0 <.text+0x54c9ff0>
1454cb010:     	movzbl	%r12b, %r10d
1454cb014:     	testl	%r10d, %r10d
1454cb017:     	jne	0x1454cb023 <.text+0x54ca023>
1454cb019:     	jmp	0x1454cb030 <.text+0x54ca030>
1454cb01b:     	nopl	(%rax,%rax)
1454cb020:     	movq	%r10, %r9
1454cb023:     	subq	$0x1, %rcx
1454cb027:     	jb	0x1454cb039 <.text+0x54ca039>
1454cb029:     	movq	0x50(%rax,%r9,8), %rax
1454cb02e:     	jmp	0x1454cafd5 <.text+0x54c9fd5>
1454cb030:     	movl	%r8d, 0x8(%rax,%r9,4)
1454cb035:     	jmp	0x1454cb063 <.text+0x54ca063>
1454cb037:     	xorl	%eax, %eax
1454cb039:     	movq	%r15, 0x30(%rbp)
1454cb03d:     	movq	%rax, 0x38(%rbp)
1454cb041:     	movq	$0x0, 0x40(%rbp)
1454cb049:     	movq	%r9, 0x48(%rbp)
1454cb04d:     	movq	$0x23, 0x50(%rbp)
1454cb055:     	leaq	-0x8(%rbp), %rcx
1454cb059:     	leaq	0x30(%rbp), %rdx
1454cb05d:     	callq	0x14552a730 <.text+0x5529730>
1454cb062:     	nop
1454cb063:     	movq	0x3e8(%rsi), %r12
1454cb06a:     	leaq	0x18(%rbp), %rcx
1454cb06e:     	movw	$0xc, %dx
1454cb072:     	movq	%r12, %r8
1454cb075:     	callq	0x145513710 <.text+0x5512710>
1454cb07a:     	nop
1454cb07b:     	leaq	0x18(%rbp), %r15
1454cb07f:     	movq	%r15, %rcx
1454cb082:     	movw	$0xe, %dx
1454cb086:     	movq	%r12, %r8
1454cb089:     	callq	0x145513710 <.text+0x5512710>
1454cb08e:     	nop
1454cb08f:     	movq	0x18(%rbp), %rax
1454cb093:     	testq	%rax, %rax
1454cb096:     	je	0x1454cb10b <.text+0x54ca10b>
1454cb098:     	movq	0x20(%rbp), %rcx
1454cb09c:     	movw	$0x2e, %dx
1454cb0a0:     	movzwl	0x36(%rax), %r9d
1454cb0a5:     	movl	%r9d, %r10d
1454cb0a8:     	addl	%r10d, %r10d
1454cb0ab:     	movq	$-0x1, %r8
1454cb0b2:     	nopw	%cs:(%rax,%rax)
1454cb0c0:     	testq	%r10, %r10
1454cb0c3:     	je	0x1454cb0f0 <.text+0x54ca0f0>
1454cb0c5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454cb0cb:     	seta	%r11b
1454cb0cf:     	sbbb	$0x0, %r11b
1454cb0d3:     	incq	%r8
1454cb0d6:     	addq	$-0x2, %r10
1454cb0da:     	cmpb	$0x1, %r11b
1454cb0de:     	je	0x1454cb0c0 <.text+0x54ca0c0>
1454cb0e0:     	movzbl	%r11b, %r9d
1454cb0e4:     	testl	%r9d, %r9d
1454cb0e7:     	jne	0x1454cb0f3 <.text+0x54ca0f3>
1454cb0e9:     	jmp	0x1454cb100 <.text+0x54ca100>
1454cb0eb:     	nopl	(%rax,%rax)
1454cb0f0:     	movq	%r9, %r8
1454cb0f3:     	subq	$0x1, %rcx
1454cb0f7:     	jb	0x1454cb10d <.text+0x54ca10d>
1454cb0f9:     	movq	0x50(%rax,%r8,8), %rax
1454cb0fe:     	jmp	0x1454cb0a0 <.text+0x54ca0a0>
1454cb100:     	movl	$0x2, 0x8(%rax,%r8,4)
1454cb109:     	jmp	0x1454cb13d <.text+0x54ca13d>
1454cb10b:     	xorl	%eax, %eax
1454cb10d:     	movq	%r15, 0x30(%rbp)
1454cb111:     	movq	%rax, 0x38(%rbp)
1454cb115:     	movq	$0x0, 0x40(%rbp)
1454cb11d:     	movq	%r8, 0x48(%rbp)
1454cb121:     	movq	$0x2e, 0x50(%rbp)
1454cb129:     	leaq	-0x8(%rbp), %rcx
1454cb12d:     	leaq	0x30(%rbp), %rdx
1454cb131:     	movl	$0x2, %r8d
1454cb137:     	callq	0x14552a730 <.text+0x5529730>
1454cb13c:     	nop
1454cb13d:     	movss	0x20(%rdi), %xmm0
1454cb142:     	mulss	0x44a7ce(%rip), %xmm0   # 0x145915918
1454cb14a:     	cvttss2si	%xmm0, %rax
1454cb14f:     	xorl	%ecx, %ecx
1454cb151:     	xorps	%xmm1, %xmm1
1454cb154:     	ucomiss	%xmm1, %xmm0
1454cb157:     	cmovbl	%ecx, %eax
1454cb15a:     	ucomiss	0x43c3cb(%rip), %xmm0   # 0x14590752c
1454cb161:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454cb167:     	cmovbel	%eax, %r8d
1454cb16b:     	movq	0x18(%rbp), %rax
1454cb16f:     	testq	%rax, %rax
1454cb172:     	je	0x1454cb1d7 <.text+0x54ca1d7>
1454cb174:     	movq	0x20(%rbp), %rcx
1454cb178:     	movw	$0x7e, %dx
1454cb17c:     	movzwl	0x36(%rax), %r10d
1454cb181:     	movl	%r10d, %r11d
1454cb184:     	addl	%r11d, %r11d
1454cb187:     	movq	$-0x1, %r9
1454cb18e:     	nop
1454cb190:     	testq	%r11, %r11
1454cb193:     	je	0x1454cb1c0 <.text+0x54ca1c0>
1454cb195:     	cmpw	0x3a(%rax,%r9,2), %dx
1454cb19b:     	seta	%r12b
1454cb19f:     	sbbb	$0x0, %r12b
1454cb1a3:     	incq	%r9
1454cb1a6:     	addq	$-0x2, %r11
1454cb1aa:     	cmpb	$0x1, %r12b
1454cb1ae:     	je	0x1454cb190 <.text+0x54ca190>
1454cb1b0:     	movzbl	%r12b, %r10d
1454cb1b4:     	testl	%r10d, %r10d
1454cb1b7:     	jne	0x1454cb1c3 <.text+0x54ca1c3>
1454cb1b9:     	jmp	0x1454cb1d0 <.text+0x54ca1d0>
1454cb1bb:     	nopl	(%rax,%rax)
1454cb1c0:     	movq	%r10, %r9
1454cb1c3:     	subq	$0x1, %rcx
1454cb1c7:     	jb	0x1454cb1d9 <.text+0x54ca1d9>
1454cb1c9:     	movq	0x50(%rax,%r9,8), %rax
1454cb1ce:     	jmp	0x1454cb17c <.text+0x54ca17c>
1454cb1d0:     	movl	%r8d, 0x8(%rax,%r9,4)
1454cb1d5:     	jmp	0x1454cb203 <.text+0x54ca203>
1454cb1d7:     	xorl	%eax, %eax
1454cb1d9:     	movq	%r15, 0x30(%rbp)
1454cb1dd:     	movq	%rax, 0x38(%rbp)
1454cb1e1:     	movq	$0x0, 0x40(%rbp)
1454cb1e9:     	movq	%r9, 0x48(%rbp)
1454cb1ed:     	movq	$0x7e, 0x50(%rbp)
1454cb1f5:     	leaq	-0x8(%rbp), %rcx
1454cb1f9:     	leaq	0x30(%rbp), %rdx
1454cb1fd:     	callq	0x14552a730 <.text+0x5529730>
1454cb202:     	nop
1454cb203:     	movss	0x43c28d(%rip), %xmm0   # 0x145907498
1454cb20b:     	mulss	%xmm9, %xmm0
1454cb210:     	movq	0x18(%rbp), %rax
1454cb214:     	testq	%rax, %rax
1454cb217:     	je	0x1454cb289 <.text+0x54ca289>
1454cb219:     	movq	0x20(%rbp), %rcx
1454cb21d:     	movl	$0x81, %edx
1454cb222:     	movzwl	0x36(%rax), %r8d
1454cb227:     	movl	%r8d, %r10d
1454cb22a:     	addl	%r10d, %r10d
1454cb22d:     	movq	$-0x1, %r9
1454cb234:     	nopw	%cs:(%rax,%rax)
1454cb240:     	testq	%r10, %r10
1454cb243:     	je	0x1454cb270 <.text+0x54ca270>
1454cb245:     	movzwl	0x3a(%rax,%r9,2), %r11d
1454cb24b:     	cmpl	%r11d, %edx
1454cb24e:     	seta	%r11b
1454cb252:     	sbbb	$0x0, %r11b
1454cb256:     	incq	%r9
1454cb259:     	addq	$-0x2, %r10
1454cb25d:     	cmpb	$0x1, %r11b
1454cb261:     	je	0x1454cb240 <.text+0x54ca240>
1454cb263:     	movzbl	%r11b, %r8d
1454cb267:     	testl	%r8d, %r8d
1454cb26a:     	jne	0x1454cb273 <.text+0x54ca273>
1454cb26c:     	jmp	0x1454cb280 <.text+0x54ca280>
1454cb26e:     	nop
1454cb270:     	movq	%r8, %r9
1454cb273:     	subq	$0x1, %rcx
1454cb277:     	jb	0x1454cb28b <.text+0x54ca28b>
1454cb279:     	movq	0x50(%rax,%r9,8), %rax
1454cb27e:     	jmp	0x1454cb222 <.text+0x54ca222>
1454cb280:     	movss	%xmm0, 0x8(%rax,%r9,4)
1454cb287:     	jmp	0x1454cb2ba <.text+0x54ca2ba>
1454cb289:     	xorl	%eax, %eax
1454cb28b:     	movd	%xmm0, %r8d
1454cb290:     	movq	%r15, 0x30(%rbp)
1454cb294:     	movq	%rax, 0x38(%rbp)
1454cb298:     	movq	$0x0, 0x40(%rbp)
1454cb2a0:     	movq	%r9, 0x48(%rbp)
1454cb2a4:     	movq	$0x81, 0x50(%rbp)
1454cb2ac:     	leaq	-0x8(%rbp), %rcx
1454cb2b0:     	leaq	0x30(%rbp), %rdx
1454cb2b4:     	callq	0x14552a730 <.text+0x5529730>
1454cb2b9:     	nop
1454cb2ba:     	mulss	0x480115(%rip), %xmm9   # 0x14594b3d8
1454cb2c3:     	movq	0x18(%rbp), %rax
1454cb2c7:     	testq	%rax, %rax
1454cb2ca:     	je	0x1454cb339 <.text+0x54ca339>
1454cb2cc:     	movq	0x20(%rbp), %rcx
1454cb2d0:     	movl	$0x82, %edx
1454cb2d5:     	movzwl	0x36(%rax), %r8d
1454cb2da:     	movl	%r8d, %r10d
1454cb2dd:     	addl	%r10d, %r10d
1454cb2e0:     	movq	$-0x1, %r9
1454cb2e7:     	nopw	(%rax,%rax)
1454cb2f0:     	testq	%r10, %r10
1454cb2f3:     	je	0x1454cb320 <.text+0x54ca320>
1454cb2f5:     	movzwl	0x3a(%rax,%r9,2), %r11d
1454cb2fb:     	cmpl	%r11d, %edx
1454cb2fe:     	seta	%r11b
1454cb302:     	sbbb	$0x0, %r11b
1454cb306:     	incq	%r9
1454cb309:     	addq	$-0x2, %r10
1454cb30d:     	cmpb	$0x1, %r11b
1454cb311:     	je	0x1454cb2f0 <.text+0x54ca2f0>
1454cb313:     	movzbl	%r11b, %r8d
1454cb317:     	testl	%r8d, %r8d
1454cb31a:     	jne	0x1454cb323 <.text+0x54ca323>
1454cb31c:     	jmp	0x1454cb330 <.text+0x54ca330>
1454cb31e:     	nop
1454cb320:     	movq	%r8, %r9
1454cb323:     	subq	$0x1, %rcx
1454cb327:     	jb	0x1454cb33b <.text+0x54ca33b>
1454cb329:     	movq	0x50(%rax,%r9,8), %rax
1454cb32e:     	jmp	0x1454cb2d5 <.text+0x54ca2d5>
1454cb330:     	movss	%xmm9, 0x8(%rax,%r9,4)
1454cb337:     	jmp	0x1454cb36a <.text+0x54ca36a>
1454cb339:     	xorl	%eax, %eax
1454cb33b:     	movd	%xmm9, %r8d
1454cb340:     	movq	%r15, 0x30(%rbp)
1454cb344:     	movq	%rax, 0x38(%rbp)
1454cb348:     	movq	$0x0, 0x40(%rbp)
1454cb350:     	movq	%r9, 0x48(%rbp)
1454cb354:     	movq	$0x82, 0x50(%rbp)
1454cb35c:     	leaq	-0x8(%rbp), %rcx
1454cb360:     	leaq	0x30(%rbp), %rdx
1454cb364:     	callq	0x14552a730 <.text+0x5529730>
1454cb369:     	nop
1454cb36a:     	movl	0x14(%rdi), %r12d
1454cb36e:     	movq	0x18(%rbp), %rax
1454cb372:     	testq	%rax, %rax
1454cb375:     	je	0x1454cb3e7 <.text+0x54ca3e7>
1454cb377:     	movq	0x20(%rbp), %rcx
1454cb37b:     	movl	$0x83, %edx
1454cb380:     	movzwl	0x36(%rax), %r9d
1454cb385:     	movl	%r9d, %r10d
1454cb388:     	addl	%r10d, %r10d
1454cb38b:     	movq	$-0x1, %r8
1454cb392:     	nopw	%cs:(%rax,%rax)
1454cb3a0:     	testq	%r10, %r10
1454cb3a3:     	je	0x1454cb3d0 <.text+0x54ca3d0>
1454cb3a5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454cb3ab:     	cmpl	%r11d, %edx
1454cb3ae:     	seta	%r11b
1454cb3b2:     	sbbb	$0x0, %r11b
1454cb3b6:     	incq	%r8
1454cb3b9:     	addq	$-0x2, %r10
1454cb3bd:     	cmpb	$0x1, %r11b
1454cb3c1:     	je	0x1454cb3a0 <.text+0x54ca3a0>
1454cb3c3:     	movzbl	%r11b, %r9d
1454cb3c7:     	testl	%r9d, %r9d
1454cb3ca:     	jne	0x1454cb3d3 <.text+0x54ca3d3>
1454cb3cc:     	jmp	0x1454cb3e0 <.text+0x54ca3e0>
1454cb3ce:     	nop
1454cb3d0:     	movq	%r9, %r8
1454cb3d3:     	subq	$0x1, %rcx
1454cb3d7:     	jb	0x1454cb3e9 <.text+0x54ca3e9>
1454cb3d9:     	movq	0x50(%rax,%r8,8), %rax
1454cb3de:     	jmp	0x1454cb380 <.text+0x54ca380>
1454cb3e0:     	movl	%r12d, 0x8(%rax,%r8,4)
1454cb3e5:     	jmp	0x1454cb416 <.text+0x54ca416>
1454cb3e7:     	xorl	%eax, %eax
1454cb3e9:     	movq	%r15, 0x30(%rbp)
1454cb3ed:     	movq	%rax, 0x38(%rbp)
1454cb3f1:     	movq	$0x0, 0x40(%rbp)
1454cb3f9:     	movq	%r8, 0x48(%rbp)
1454cb3fd:     	movq	$0x83, 0x50(%rbp)
1454cb405:     	leaq	-0x8(%rbp), %rcx
1454cb409:     	leaq	0x30(%rbp), %rdx
1454cb40d:     	movl	%r12d, %r8d
1454cb410:     	callq	0x14552a730 <.text+0x5529730>
1454cb415:     	nop
1454cb416:     	movq	0x18(%rbp), %rax
1454cb41a:     	testq	%rax, %rax
1454cb41d:     	je	0x1454cb487 <.text+0x54ca487>
1454cb41f:     	movq	0x20(%rbp), %rcx
1454cb423:     	movl	$0x84, %edx
1454cb428:     	movzwl	0x36(%rax), %r9d
1454cb42d:     	movl	%r9d, %r10d
1454cb430:     	addl	%r10d, %r10d
1454cb433:     	movq	$-0x1, %r8
1454cb43a:     	nopw	(%rax,%rax)
1454cb440:     	testq	%r10, %r10
1454cb443:     	je	0x1454cb470 <.text+0x54ca470>
1454cb445:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454cb44b:     	cmpl	%r11d, %edx
1454cb44e:     	seta	%r11b
1454cb452:     	sbbb	$0x0, %r11b
1454cb456:     	incq	%r8
1454cb459:     	addq	$-0x2, %r10
1454cb45d:     	cmpb	$0x1, %r11b
1454cb461:     	je	0x1454cb440 <.text+0x54ca440>
1454cb463:     	movzbl	%r11b, %r9d
1454cb467:     	testl	%r9d, %r9d
1454cb46a:     	jne	0x1454cb473 <.text+0x54ca473>
1454cb46c:     	jmp	0x1454cb480 <.text+0x54ca480>
1454cb46e:     	nop
1454cb470:     	movq	%r9, %r8
1454cb473:     	subq	$0x1, %rcx
1454cb477:     	jb	0x1454cb489 <.text+0x54ca489>
1454cb479:     	movq	0x50(%rax,%r8,8), %rax
1454cb47e:     	jmp	0x1454cb428 <.text+0x54ca428>
1454cb480:     	movl	%r12d, 0x8(%rax,%r8,4)
1454cb485:     	jmp	0x1454cb4b6 <.text+0x54ca4b6>
1454cb487:     	xorl	%eax, %eax
1454cb489:     	movq	%r15, 0x30(%rbp)
1454cb48d:     	movq	%rax, 0x38(%rbp)
1454cb491:     	movq	$0x0, 0x40(%rbp)
1454cb499:     	movq	%r8, 0x48(%rbp)
1454cb49d:     	movq	$0x84, 0x50(%rbp)
1454cb4a5:     	leaq	-0x8(%rbp), %rcx
1454cb4a9:     	leaq	0x30(%rbp), %rdx
1454cb4ad:     	movl	%r12d, %r8d
1454cb4b0:     	callq	0x14552a730 <.text+0x5529730>
1454cb4b5:     	nop
1454cb4b6:     	movq	0x18(%rbp), %rax
1454cb4ba:     	testq	%rax, %rax
1454cb4bd:     	je	0x1454cb52b <.text+0x54ca52b>
1454cb4bf:     	movq	0x20(%rbp), %rcx
1454cb4c3:     	movl	$0x91, %edx
1454cb4c8:     	movzwl	0x36(%rax), %r9d
1454cb4cd:     	movl	%r9d, %r10d
1454cb4d0:     	addl	%r10d, %r10d
1454cb4d3:     	movq	$-0x1, %r8
1454cb4da:     	nopw	(%rax,%rax)
1454cb4e0:     	testq	%r10, %r10
1454cb4e3:     	je	0x1454cb510 <.text+0x54ca510>
1454cb4e5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454cb4eb:     	cmpl	%r11d, %edx
1454cb4ee:     	seta	%r11b
1454cb4f2:     	sbbb	$0x0, %r11b
1454cb4f6:     	incq	%r8
1454cb4f9:     	addq	$-0x2, %r10
1454cb4fd:     	cmpb	$0x1, %r11b
1454cb501:     	je	0x1454cb4e0 <.text+0x54ca4e0>
1454cb503:     	movzbl	%r11b, %r9d
1454cb507:     	testl	%r9d, %r9d
1454cb50a:     	jne	0x1454cb513 <.text+0x54ca513>
1454cb50c:     	jmp	0x1454cb520 <.text+0x54ca520>
1454cb50e:     	nop
1454cb510:     	movq	%r9, %r8
1454cb513:     	subq	$0x1, %rcx
1454cb517:     	jb	0x1454cb52d <.text+0x54ca52d>
1454cb519:     	movq	0x50(%rax,%r8,8), %rax
1454cb51e:     	jmp	0x1454cb4c8 <.text+0x54ca4c8>
1454cb520:     	movl	$0x3f800000, 0x8(%rax,%r8,4) # imm = 0x3F800000
1454cb529:     	jmp	0x1454cb55d <.text+0x54ca55d>
1454cb52b:     	xorl	%eax, %eax
1454cb52d:     	movq	%r15, 0x30(%rbp)
1454cb531:     	movq	%rax, 0x38(%rbp)
1454cb535:     	movq	$0x0, 0x40(%rbp)
1454cb53d:     	movq	%r8, 0x48(%rbp)
1454cb541:     	movq	$0x91, 0x50(%rbp)
1454cb549:     	leaq	-0x8(%rbp), %rcx
1454cb54d:     	leaq	0x30(%rbp), %rdx
1454cb551:     	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1454cb557:     	callq	0x14552a730 <.text+0x5529730>
1454cb55c:     	nop
1454cb55d:     	movl	$0x0, -0x10(%rbp)
1454cb564:     	movq	$0x0, -0x28(%rbp)
1454cb56c:     	movq	$0x1, -0x20(%rbp)
1454cb574:     	movq	$0x0, -0x18(%rbp)
1454cb57c:     	movups	0x152b485(%rip), %xmm0  # 0x1469f6a08
1454cb583:     	movaps	%xmm0, -0x40(%rbp)
1454cb587:     	movabsq	$0x40490fdb40200000, %rax # imm = 0x40490FDB40200000
1454cb591:     	movq	%rax, -0x30(%rbp)
1454cb595:     	movl	$0x41100000, -0x3c(%rbp) # imm = 0x41100000
1454cb59c:     	movlps	%xmm7, 0x30(%rbp)
1454cb5a0:     	movss	%xmm8, 0x38(%rbp)
1454cb5a6:     	movb	$0x1, 0x67(%rbp)
1454cb5aa:     	movq	%r15, 0x38(%rsp)
1454cb5af:     	leaq	-0x40(%rbp), %rax
1454cb5b3:     	movq	%rax, 0x30(%rsp)
1454cb5b8:     	movss	%xmm10, 0x28(%rsp)
1454cb5bf:     	leaq	0x30(%rbp), %rax
1454cb5c3:     	movq	%rax, 0x20(%rsp)
1454cb5c8:     	leaq	-0x28(%rbp), %rcx
1454cb5cc:     	movq	%r14, %rdx
1454cb5cf:     	movb	$0x3, %r8b
1454cb5d2:     	xorl	%r9d, %r9d
1454cb5d5:     	callq	0x145512720 <.text+0x5511720>
1454cb5da:     	nop
1454cb5db:     	movups	-0x28(%rbp), %xmm0
1454cb5df:     	movups	-0x18(%rbp), %xmm1
1454cb5e3:     	movaps	%xmm1, 0x40(%rbp)
1454cb5e7:     	movaps	%xmm0, 0x30(%rbp)
1454cb5eb:     	movb	$0x0, 0x67(%rbp)
1454cb5ef:     	leaq	-0x8(%rbp), %rcx
1454cb5f3:     	leaq	0x30(%rbp), %rdx
1454cb5f7:     	callq	0x145512ef0 <.text+0x5511ef0>
1454cb5fc:     	nop
1454cb5fd:     	movq	0x560(%rsi), %r15
1454cb604:     	cmpq	0x550(%rsi), %r15
1454cb60b:     	jne	0x1454cb61a <.text+0x54ca61a>
1454cb60d:     	leaq	0x550(%rsi), %rcx
1454cb614:     	callq	0x145774710 <.text+0x5773710>
1454cb619:     	nop
1454cb61a:     	movq	0x558(%rsi), %rax
1454cb621:     	movq	%r15, %rcx
1454cb624:     	shlq	$0x5, %rcx
1454cb628:     	movups	-0x8(%rbp), %xmm0
1454cb62c:     	movups	0x8(%rbp), %xmm1
1454cb630:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cb635:     	movups	%xmm0, (%rax,%rcx)
1454cb639:     	incq	%r15
1454cb63c:     	movq	%r15, 0x560(%rsi)
1454cb643:     	movss	0x934(%rsi), %xmm9
1454cb64c:     	movq	0xd8(%rsi), %r15
1454cb653:     	cmpq	0xc8(%rsi), %r15
1454cb65a:     	jne	0x1454cb66d <.text+0x54ca66d>
1454cb65c:     	leaq	0xc8(%rsi), %rcx
1454cb663:     	movb	$0x0, 0x67(%rbp)
1454cb667:     	callq	0x145780110 <.text+0x577f110>
1454cb66c:     	nop
1454cb66d:     	movq	0xd0(%rsi), %rax
1454cb674:     	leaq	(%r15,%r15,2), %rcx
1454cb678:     	shlq	$0x5, %rcx
1454cb67c:     	movq	0x10(%rbx), %rdx
1454cb680:     	movq	%rdx, 0x10(%rax,%rcx)
1454cb685:     	movups	(%rbx), %xmm0
1454cb688:     	movups	%xmm0, (%rax,%rcx)
1454cb68c:     	movq	%rdi, 0x18(%rax,%rcx)
1454cb691:     	movq	%r14, 0x20(%rax,%rcx)
1454cb696:     	movq	$0x0, 0x28(%rax,%rcx)
1454cb69f:     	movlps	%xmm7, 0x30(%rax,%rcx)
1454cb6a4:     	movss	%xmm8, 0x38(%rax,%rcx)
1454cb6ab:     	movlps	%xmm7, 0x3c(%rax,%rcx)
1454cb6b0:     	movss	%xmm8, 0x44(%rax,%rcx)
1454cb6b7:     	movaps	0x53cb62(%rip), %xmm0   # 0x145a08220
1454cb6be:     	movss	%xmm9, %xmm0            # xmm0 = xmm9[0],xmm0[1,2,3]
1454cb6c3:     	shufps	$0x4, %xmm0, %xmm0      # xmm0 = xmm0[0,1,0,0]
1454cb6c7:     	addps	0x152a772(%rip), %xmm0  # 0x1469f5e40
1454cb6ce:     	movups	%xmm0, 0x48(%rax,%rcx)
1454cb6d3:     	movss	%xmm6, 0x58(%rax,%rcx)
1454cb6d9:     	incq	%r15
1454cb6dc:     	movq	%r15, 0xd8(%rsi)
1454cb6e3:     	leaq	0x18(%rbp), %rcx
1454cb6e7:     	callq	0x14550cd20 <.text+0x550bd20>
1454cb6ec:     	movaps	0x70(%rbp), %xmm6
1454cb6f0:     	movaps	0x80(%rbp), %xmm7
1454cb6f7:     	movaps	0x90(%rbp), %xmm8
1454cb6ff:     	movaps	0xa0(%rbp), %xmm9
1454cb707:     	movaps	0xb0(%rbp), %xmm10
1454cb70f:     	addq	$0x140, %rsp            # imm = 0x140
1454cb716:     	popq	%rbx
1454cb717:     	popq	%rdi
1454cb718:     	popq	%rsi
1454cb719:     	popq	%r12
1454cb71b:     	popq	%r14
1454cb71d:     	popq	%r15
1454cb71f:     	popq	%rbp
1454cb720:     	retq

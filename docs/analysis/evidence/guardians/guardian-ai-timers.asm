
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454caa55:     	cmpq	$-0x1, 0x40(%rdi)
1454caa5a:     	je	0x1454cae7d <.text+0x54c9e7d>
1454caa60:     	movq	0x58(%rdi), %rax
1454caa64:     	movq	0x2a0(%rbp), %rcx
1454caa6b:     	cmpq	0x590(%rcx), %rax
1454caa72:     	jae	0x1454caa8c <.text+0x54c9a8c>
1454caa74:     	movq	0x588(%rcx), %rcx
1454caa7b:     	leaq	(%rax,%rax,4), %rax
1454caa7f:     	movsd	0x18(%rcx,%rax,8), %xmm9
1454caa86:     	movl	0x20(%rcx,%rax,8), %ebx
1454caa8a:     	jmp	0x1454caa96 <.text+0x54c9a96>
1454caa8c:     	movl	0x278(%rbp), %ebx
1454caa92:     	movaps	%xmm13, %xmm9
1454caa96:     	movlps	%xmm9, 0x1b8(%rbp)
1454caa9e:     	movl	%ebx, 0x1c0(%rbp)
1454caaa4:     	movaps	0x10(%rbp), %xmm0
1454caaa8:     	movlps	%xmm0, 0x1f0(%rbp)
1454caaaf:     	movss	0x18c(%rbp), %xmm0
1454caab7:     	movss	%xmm0, 0x1f8(%rbp)
1454caabf:     	movb	$0x1, 0x2b7(%rbp)
1454caac6:     	movb	$0x1, 0x2b6(%rbp)
1454caacd:     	movb	$0x1, 0x2b5(%rbp)
1454caad4:     	movb	$0x1, 0x2b4(%rbp)
1454caadb:     	movb	$0x1, 0x2b3(%rbp)
1454caae2:     	movb	$0x1, 0x2b2(%rbp)
1454caae9:     	movb	$0x1, 0x2b1(%rbp)
1454caaf0:     	movb	$0x1, 0x2b0(%rbp)
1454caaf7:     	movb	$0x1, 0x2af(%rbp)
1454caafe:     	movq	%rdi, %rcx
1454cab01:     	leaq	0x1b8(%rbp), %rdx
1454cab08:     	leaq	0x1f0(%rbp), %r8
1454cab0f:     	movaps	%xmm6, %xmm3
1454cab12:     	callq	0x14550a0a0 <.text+0x55090a0>
1454cab17:     	nop
1454cab18:     	movzbl	%al, %eax
1454cab1b:     	leaq	0x14e22b2(%rip), %rcx   # 0x1469acdd4
1454cab22:     	movslq	(%rcx,%rax,4), %rax
1454cab26:     	addq	%rcx, %rax
1454cab29:     	jmpq	*%rax
1454cab2b:     	movq	0x290(%rbp), %rcx
1454cab32:     	movss	0x128(%rcx), %xmm0
1454cab3a:     	ucomiss	%xmm8, %xmm0
1454cab3e:     	movq	0x2a0(%rbp), %r12
1454cab45:     	jbe	0x1454cab58 <.text+0x54c9b58>
1454cab47:     	addss	0x124(%rcx), %xmm0
1454cab4f:     	ucomiss	%xmm6, %xmm0
1454cab52:     	ja	0x1454c9a4c <.text+0x54c8a4c>
1454cab58:     	subps	%xmm9, %xmm13
1454cab5c:     	mulps	%xmm13, %xmm13
1454cab60:     	movshdup	%xmm13, %xmm0           # xmm0 = xmm13[1,1,3,3]
1454cab65:     	addss	%xmm13, %xmm0
1454cab6a:     	xorps	%xmm10, %xmm10
1454cab6e:     	sqrtss	%xmm0, %xmm10
1454cab73:     	ucomiss	0x42baa9(%rip), %xmm10  # 0x1458f6624
1454cab7b:     	jbe	0x1454c9a4c <.text+0x54c8a4c>
1454cab81:     	movaps	%xmm11, %xmm0
1454cab85:     	subss	0x98(%rcx), %xmm0
1454cab8d:     	movss	0xfc(%rcx), %xmm2
1454cab95:     	movaps	%xmm6, %xmm1
1454cab98:     	cmpltss	0x9c(%rcx), %xmm1
1454caba1:     	mulss	%xmm2, %xmm0
1454caba5:     	andps	%xmm1, %xmm0
1454caba8:     	andnps	%xmm2, %xmm1
1454cabab:     	orps	%xmm0, %xmm1
1454cabae:     	movaps	%xmm1, %xmm0
1454cabb1:     	mulss	0x52c91b(%rip), %xmm0   # 0x1459f74d4
1454cabb9:     	testb	$0x1, 0x38(%rcx)
1454cabbd:     	jne	0x1454cabc2 <.text+0x54c9bc2>
1454cabbf:     	movaps	%xmm1, %xmm0
1454cabc2:     	cmpq	$-0x1, 0x18(%rcx)
1454cabc7:     	jne	0x1454cabcc <.text+0x54c9bcc>
1454cabc9:     	movaps	%xmm1, %xmm0
1454cabcc:     	movq	0x270(%rbp), %rax
1454cabd3:     	movq	%rax, 0x10c(%rcx)
1454cabda:     	movl	0x278(%rbp), %eax
1454cabe0:     	movl	%eax, 0x114(%rcx)
1454cabe6:     	movlps	%xmm9, 0x118(%rcx)
1454cabee:     	movl	%ebx, 0x120(%rcx)
1454cabf4:     	movss	%xmm6, 0x124(%rcx)
1454cabfc:     	maxss	0x420884(%rip), %xmm0   # 0x1458eb488
1454cac04:     	divss	%xmm0, %xmm10
1454cac09:     	movss	%xmm10, 0x128(%rcx)
1454cac12:     	movq	0x88(%rcx), %rdi
1454cac19:     	movq	0x1e8(%rbp), %rsi
1454cac20:     	cmpq	0x1d8(%rbp), %rsi
1454cac27:     	jne	0x1454cac75 <.text+0x54c9c75>
1454cac29:     	movb	$0x1, 0x2b7(%rbp)
1454cac30:     	movb	$0x1, 0x2b6(%rbp)
1454cac37:     	movb	$0x1, 0x2b5(%rbp)
1454cac3e:     	movb	$0x1, 0x2b4(%rbp)
1454cac45:     	movb	$0x1, 0x2b3(%rbp)
1454cac4c:     	movb	$0x1, 0x2b2(%rbp)
1454cac53:     	movb	$0x1, 0x2b1(%rbp)
1454cac5a:     	movb	$0x1, 0x2b0(%rbp)
1454cac61:     	movb	$0x1, 0x2af(%rbp)
1454cac68:     	leaq	0x1d8(%rbp), %rcx
1454cac6f:     	callq	0x145758120 <.text+0x5757120>
1454cac74:     	nop
1454cac75:     	movq	0x1e0(%rbp), %rax
1454cac7c:     	leaq	(%rsi,%rsi,4), %rcx
1454cac80:     	movq	%rdi, (%rax,%rcx,8)
1454cac84:     	movq	0x270(%rbp), %rdx
1454cac8b:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454cac90:     	movl	0x278(%rbp), %edx
1454cac96:     	movl	%edx, 0x10(%rax,%rcx,8)
1454cac9a:     	movlps	%xmm9, 0x14(%rax,%rcx,8)
1454caca0:     	movl	%ebx, 0x1c(%rax,%rcx,8)
1454caca4:     	movss	%xmm10, 0x20(%rax,%rcx,8)
1454cacab:     	jmp	0x1454ca78b <.text+0x54c978b>
1454cacb0:     	movq	0x290(%rbp), %rax
1454cacb7:     	movq	0x88(%rax), %rdi
1454cacbe:     	movq	0x88(%rbp), %rsi
1454cacc5:     	cmpq	0x78(%rbp), %rsi
1454cacc9:     	jne	0x1454cad14 <.text+0x54c9d14>
1454caccb:     	movb	$0x1, 0x2b7(%rbp)
1454cacd2:     	movb	$0x1, 0x2b6(%rbp)
1454cacd9:     	movb	$0x1, 0x2b5(%rbp)
1454cace0:     	movb	$0x1, 0x2b4(%rbp)
1454cace7:     	movb	$0x1, 0x2b3(%rbp)
1454cacee:     	movb	$0x1, 0x2b2(%rbp)
1454cacf5:     	movb	$0x1, 0x2b1(%rbp)
1454cacfc:     	movb	$0x1, 0x2b0(%rbp)
1454cad03:     	movb	$0x1, 0x2af(%rbp)
1454cad0a:     	leaq	0x78(%rbp), %rcx
1454cad0e:     	callq	0x145757ef0 <.text+0x5756ef0>
1454cad13:     	nop
1454cad14:     	movq	0x80(%rbp), %rax
1454cad1b:     	movq	%rdi, (%rax,%rsi,8)
1454cad1f:     	incq	%rsi
1454cad22:     	movq	%rsi, 0x88(%rbp)
1454cad29:     	movq	0x290(%rbp), %rdi
1454cad30:     	cmpq	$-0x1, 0x40(%rdi)
1454cad35:     	je	0x1454cae7d <.text+0x54c9e7d>
1454cad3b:     	movss	0xf4(%rdi), %xmm0
1454cad43:     	mulss	0x4400f9(%rip), %xmm0   # 0x14590ae44
1454cad4b:     	xorl	%eax, %eax
1454cad4d:     	ucomiss	0xf0(%rdi), %xmm0
1454cad54:     	seta	%al
1454cad57:     	movq	0x48(%rdi), %r15
1454cad5b:     	movq	0x50(%rdi), %rcx
1454cad5f:     	leaq	(%r15,%rcx,4), %r14
1454cad63:     	leaq	0x14df886(%rip), %rcx   # 0x1469aa5f0
1454cad6a:     	movss	(%rcx,%rax,4), %xmm9
1454cad70:     	xorl	%r13d, %r13d
1454cad73:     	jmp	0x1454cadc5 <.text+0x54c9dc5>
1454cad75:     	nopw	%cs:(%rax,%rax)
1454cad80:     	leaq	0x14dfe0d(%rip), %rax   # 0x1469aab94
1454cad87:     	addq	%rax, %rsi
1454cad8a:     	movq	0xe8(%rbp), %rax
1454cad91:     	movq	%rdi, %rcx
1454cad94:     	shlq	$0x5, %rcx
1454cad98:     	movq	0x128(%rbp), %rdx
1454cad9f:     	movq	%rdx, (%rax,%rcx)
1454cada3:     	movups	(%rsi), %xmm0
1454cada6:     	movups	%xmm0, 0x8(%rax,%rcx)
1454cadab:     	movq	0x10(%rsi), %rdx
1454cadaf:     	movq	%rdx, 0x18(%rax,%rcx)
1454cadb4:     	incq	%rdi
1454cadb7:     	movq	%rdi, 0xf0(%rbp)
1454cadbe:     	movq	0x290(%rbp), %rdi
1454cadc5:     	cmpq	%r14, %r15
1454cadc8:     	je	0x1454cae7d <.text+0x54c9e7d>
1454cadce:     	movq	%r13, %rcx
1454cadd1:     	movq	%r15, %rax
1454cadd4:     	addq	$0x4, %r15
1454cadd8:     	incq	%r13
1454caddb:     	movss	(%rax), %xmm0
1454caddf:     	subss	%xmm7, %xmm0
1454cade3:     	movss	%xmm0, (%rax)
1454cade7:     	ucomiss	%xmm0, %xmm8
1454cadeb:     	jb	0x1454cadc5 <.text+0x54c9dc5>
1454caded:     	cmpq	$0x2, %rcx
1454cadf1:     	ja	0x1454ce74d <.text+0x54cd74d>
1454cadf7:     	leaq	(%rcx,%rcx,8), %rdx
1454cadfb:     	leaq	(%rdx,%rdx,2), %rsi
1454cadff:     	addq	%rcx, %rsi
1454cae02:     	leaq	0x14dfd8b(%rip), %rcx   # 0x1469aab94
1454cae09:     	movss	0x18(%rcx,%rsi), %xmm0
1454cae0f:     	mulss	%xmm9, %xmm0
1454cae14:     	movss	%xmm0, (%rax)
1454cae18:     	movq	0xf0(%rbp), %rdi
1454cae1f:     	cmpq	0xe0(%rbp), %rdi
1454cae26:     	jne	0x1454cad80 <.text+0x54c9d80>
1454cae2c:     	movb	$0x1, 0x2b7(%rbp)
1454cae33:     	movb	$0x1, 0x2b6(%rbp)
1454cae3a:     	movb	$0x1, 0x2b5(%rbp)
1454cae41:     	movb	$0x1, 0x2b4(%rbp)
1454cae48:     	movb	$0x1, 0x2b3(%rbp)
1454cae4f:     	movb	$0x1, 0x2b2(%rbp)
1454cae56:     	movb	$0x1, 0x2b1(%rbp)
1454cae5d:     	movb	$0x1, 0x2b0(%rbp)
1454cae64:     	movb	$0x1, 0x2af(%rbp)
1454cae6b:     	leaq	0xe0(%rbp), %rcx
1454cae72:     	callq	0x1457580b0 <.text+0x57570b0>
1454cae77:     	nop
1454cae78:     	jmp	0x1454cad80 <.text+0x54c9d80>


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ccbb0:     	cmpq	0x260(%rbp), %rdi
1454ccbb7:     	je	0x1454cdd10 <.text+0x54ccd10>
1454ccbbd:     	movq	%rdi, %rax
1454ccbc0:     	movl	0x8(%rdi), %edx
1454ccbc3:     	cmpl	$-0x1, %edx
1454ccbc6:     	je	0x1454cdd10 <.text+0x54ccd10>
1454ccbcc:     	leaq	0x20(%rax), %rdi
1454ccbd0:     	movq	(%rax), %r12
1454ccbd3:     	movq	0x2a0(%rbp), %r8
1454ccbda:     	cmpq	0x4d0(%r8), %r12
1454ccbe1:     	jae	0x1454ccbb0 <.text+0x54cbbb0>
1454ccbe3:     	movq	0x4c8(%r8), %rcx
1454ccbea:     	imulq	$0x160, %r12, %rbx      # imm = 0x160
1454ccbf1:     	cmpb	$0x0, 0x68(%rcx,%rbx)
1454ccbf6:     	jne	0x1454ccbb0 <.text+0x54cbbb0>
1454ccbf8:     	movss	0x8e4(%r8), %xmm3
1454ccc01:     	addq	%rbx, %rcx
1454ccc04:     	movss	0x128(%rcx), %xmm0
1454ccc0c:     	xorps	%xmm1, %xmm1
1454ccc0f:     	ucomiss	%xmm0, %xmm1
1454ccc12:     	jae	0x1454ccc71 <.text+0x54cbc71>
1454ccc14:     	movaps	%xmm3, %xmm1
1454ccc17:     	subss	0x124(%rcx), %xmm1
1454ccc1f:     	divss	%xmm0, %xmm1
1454ccc23:     	xorps	%xmm0, %xmm0
1454ccc26:     	maxss	%xmm1, %xmm0
1454ccc2a:     	movaps	%xmm12, %xmm1
1454ccc2e:     	minss	%xmm0, %xmm1
1454ccc32:     	movsd	0x10c(%rcx), %xmm0
1454ccc3a:     	movsd	0x118(%rcx), %xmm2
1454ccc42:     	subps	%xmm0, %xmm2
1454ccc45:     	movsldup	%xmm1, %xmm6            # xmm6 = xmm1[0,0,2,2]
1454ccc49:     	mulps	%xmm2, %xmm6
1454ccc4c:     	addps	%xmm0, %xmm6
1454ccc4f:     	movss	0x114(%rcx), %xmm0
1454ccc57:     	movss	0x120(%rcx), %xmm11
1454ccc60:     	subss	%xmm0, %xmm11
1454ccc65:     	mulss	%xmm1, %xmm11
1454ccc6a:     	addss	%xmm0, %xmm11
1454ccc6f:     	jmp	0x1454ccc82 <.text+0x54cbc82>
1454ccc71:     	movsd	0x118(%rcx), %xmm6
1454ccc79:     	movss	0x120(%rcx), %xmm11
1454ccc82:     	movaps	%xmm12, %xmm1
1454ccc86:     	subss	0xa0(%rcx), %xmm1
1454ccc8e:     	movss	0xf8(%rcx), %xmm2
1454ccc96:     	movaps	%xmm3, %xmm0
1454ccc99:     	cmpltss	0xa4(%rcx), %xmm0
1454ccca2:     	mulss	%xmm2, %xmm1
1454ccca6:     	andps	%xmm0, %xmm1
1454ccca9:     	andnps	%xmm2, %xmm0
1454cccac:     	orps	%xmm1, %xmm0
1454cccaf:     	movaps	%xmm0, %xmm7
1454cccb2:     	mulss	0x42c086(%rip), %xmm7   # 0x1458f8d40
1454cccba:     	testb	$0x1, 0x38(%rcx)
1454cccbe:     	jne	0x1454cccc3 <.text+0x54cbcc3>
1454cccc0:     	movaps	%xmm0, %xmm7
1454cccc3:     	cmpq	$-0x1, 0x18(%rcx)
1454cccc8:     	jne	0x1454ccccd <.text+0x54cbccd>
1454cccca:     	movaps	%xmm0, %xmm7
1454ccccd:     	movl	0xc(%rax), %r15d
1454cccd1:     	movl	0x10(%rax), %r14d
1454cccd5:     	movss	0x14(%rax), %xmm8
1454cccdb:     	movq	0x88(%rcx), %r13
1454ccce2:     	movq	0x2a0(%rbp), %rsi
1454ccce9:     	movsd	0x3e8(%rsi), %xmm1
1454cccf1:     	movl	%edx, %edx
1454cccf3:     	leaq	0x14e00c6(%rip), %r8    # 0x1469acdc0
1454cccfa:     	movslq	(%r8,%rdx,4), %rdx
1454cccfe:     	addq	%r8, %rdx
1454ccd01:     	movaps	%xmm3, 0x240(%rbp)
1454ccd08:     	jmpq	*%rdx
1454ccd0a:     	movss	0x18(%rax), %xmm10
1454ccd10:     	movss	0x1c(%rax), %xmm11
1454ccd16:     	movq	0x878(%rsi), %rsi
1454ccd1d:     	leaq	0x10(%rsi), %rcx
1454ccd21:     	movshdup	%xmm1, %xmm9            # xmm9 = xmm1[1,1,3,3]
1454ccd26:     	movaps	%xmm1, %xmm14
1454ccd2a:     	movaps	%xmm9, %xmm2
1454ccd2e:     	callq	0x1454627f0 <.text+0x54617f0>
1454ccd33:     	nop
1454ccd34:     	testb	$0x1, %al
1454ccd36:     	je	0x1454cd211 <.text+0x54cc211>
1454ccd3c:     	movaps	%xmm0, %xmm6
1454ccd3f:     	jmp	0x1454cd8e1 <.text+0x54cc8e1>
1454ccd44:     	movq	0x878(%rsi), %rsi
1454ccd4b:     	leaq	0x10(%rsi), %rcx
1454ccd4f:     	movshdup	%xmm1, %xmm10           # xmm10 = xmm1[1,1,3,3]
1454ccd54:     	movaps	%xmm1, %xmm14
1454ccd58:     	movaps	%xmm10, %xmm2
1454ccd5c:     	callq	0x1454627f0 <.text+0x54617f0>
1454ccd61:     	nop
1454ccd62:     	testb	$0x1, %al
1454ccd64:     	je	0x1454cd1d2 <.text+0x54cc1d2>
1454ccd6a:     	movaps	%xmm0, %xmm8
1454ccd6e:     	jmp	0x1454cd7c9 <.text+0x54cc7c9>
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
1454ccf2a:     	movd	%r14d, %xmm9
1454ccf2f:     	subps	%xmm1, %xmm6
1454ccf32:     	mulps	%xmm6, %xmm6
1454ccf35:     	movshdup	%xmm6, %xmm0            # xmm0 = xmm6[1,1,3,3]
1454ccf39:     	addss	%xmm6, %xmm0
1454ccf3d:     	xorps	%xmm6, %xmm6
1454ccf40:     	sqrtss	%xmm0, %xmm6
1454ccf44:     	ucomiss	%xmm6, %xmm9
1454ccf48:     	setb	%bl
1454ccf4b:     	jae	0x1454cd09d <.text+0x54cc09d>
1454ccf51:     	movl	$0x8, %r9d
1454ccf57:     	xorl	%ecx, %ecx
1454ccf59:     	jmp	0x1454cd0d3 <.text+0x54cc0d3>
1454ccf5e:     	movaps	%xmm1, 0x170(%rbp)
1454ccf65:     	movl	%r15d, %ecx
1454ccf68:     	callq	0x1454f08d0 <.text+0x54ef8d0>
1454ccf6d:     	maxss	0x42be6b(%rip), %xmm0   # 0x1458f8de0
1454ccf75:     	movss	%xmm0, 0x1b0(%rbp)
1454ccf7d:     	testl	%r14d, %r14d
1454ccf80:     	je	0x1454ccbb0 <.text+0x54cbbb0>
1454ccf86:     	movq	0x880(%rsi), %rdx
1454ccf8d:     	movq	0x888(%rsi), %rax
1454ccf94:     	movq	0x898(%rsi), %r8
1454ccf9b:     	movq	0x890(%rsi), %rcx
1454ccfa2:     	nopw	%cs:(%rax,%rax)
1454ccfb0:     	leaq	(%rdx,%r8), %r9
1454ccfb4:     	rolq	$0x17, %r9
1454ccfb8:     	addq	%rdx, %r9
1454ccfbb:     	movq	%rax, %r10
1454ccfbe:     	shlq	$0x11, %r10
1454ccfc2:     	xorq	%rdx, %rcx
1454ccfc5:     	xorq	%rax, %r8
1454ccfc8:     	xorq	%rcx, %rax
1454ccfcb:     	xorq	%r8, %rdx
1454ccfce:     	xorq	%r10, %rcx
1454ccfd1:     	rolq	$0x2d, %r8
1454ccfd5:     	shrq	$0x29, %r9
1454ccfd9:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454ccfe0:     	movd	%r9d, %xmm0
1454ccfe5:     	addss	%xmm15, %xmm0
1454ccfea:     	ucomiss	%xmm0, %xmm12
1454ccfee:     	jbe	0x1454ccfb0 <.text+0x54cbfb0>
1454ccff0:     	movl	%r14d, %r9d
1454ccff3:     	xorps	%xmm1, %xmm1
1454ccff6:     	cvtsi2ss	%r9, %xmm1
1454ccffb:     	mulss	0x41e50d(%rip), %xmm7   # 0x1458eb510
1454cd003:     	movq	0x2a0(%rbp), %r9
1454cd00a:     	movq	%rdx, 0x880(%r9)
1454cd011:     	movq	%r8, 0x898(%r9)
1454cd018:     	movq	%rax, 0x888(%r9)
1454cd01f:     	movq	%rcx, 0x890(%r9)
1454cd026:     	xorps	%xmm10, %xmm10
1454cd02a:     	movss	%xmm1, 0x168(%rbp)
1454cd032:     	divss	%xmm1, %xmm10
1454cd037:     	mulss	0x41ffd4(%rip), %xmm10  # 0x1458ed014
1454cd040:     	addss	%xmm0, %xmm10
1454cd045:     	movq	0x878(%r9), %rbx
1454cd04c:     	movaps	%xmm10, %xmm0
1454cd050:     	callq	0x145756e31 <.text+0x5755e31>
1454cd055:     	movaps	%xmm0, %xmm9
1454cd059:     	movaps	%xmm10, %xmm0
1454cd05d:     	callq	0x145756e2b <.text+0x5755e2b>
1454cd062:     	unpcklps	%xmm0, %xmm9            # xmm9 = xmm9[0],xmm0[0],xmm9[1],xmm0[1]
1454cd066:     	xorps	%xmm0, %xmm0
1454cd069:     	mulps	%xmm0, %xmm9
1454cd06d:     	addps	0x170(%rbp), %xmm9
1454cd075:     	movshdup	%xmm9, %xmm10           # xmm10 = xmm9[1,1,3,3]
1454cd07a:     	leaq	0x10(%rbx), %rcx
1454cd07e:     	movaps	%xmm9, %xmm1
1454cd082:     	movaps	%xmm10, %xmm2
1454cd086:     	callq	0x1454627f0 <.text+0x54617f0>
1454cd08b:     	nop
1454cd08c:     	testb	$0x1, %al
1454cd08e:     	je	0x1454cd24f <.text+0x54cc24f>
1454cd094:     	movaps	%xmm0, %xmm11
1454cd098:     	jmp	0x1454cd28c <.text+0x54cc28c>
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
1454cd1d2:     	cmpq	$-0x1, 0x68(%rsi)
1454cd1d7:     	movaps	%xmm14, %xmm2
1454cd1db:     	je	0x1454cd7a8 <.text+0x54cc7a8>
1454cd1e1:     	leaq	0x68(%rsi), %rdx
1454cd1e5:     	leaq	0x1f0(%rbp), %rcx
1454cd1ec:     	movaps	%xmm10, %xmm3
1454cd1f0:     	callq	0x145467bf0 <.text+0x5466bf0>
1454cd1f5:     	nop
1454cd1f6:     	cmpl	$0x1, 0x1f0(%rbp)
1454cd1fd:     	jne	0x1454cd7c0 <.text+0x54cc7c0>
1454cd203:     	movss	0x1fc(%rbp), %xmm8
1454cd20c:     	jmp	0x1454cd7c9 <.text+0x54cc7c9>
1454cd211:     	cmpq	$-0x1, 0x68(%rsi)
1454cd216:     	movaps	%xmm14, %xmm2
1454cd21a:     	je	0x1454cd7b3 <.text+0x54cc7b3>
1454cd220:     	leaq	0x68(%rsi), %rdx
1454cd224:     	leaq	0x1f0(%rbp), %rcx
1454cd22b:     	movaps	%xmm9, %xmm3
1454cd22f:     	callq	0x145467bf0 <.text+0x5466bf0>
1454cd234:     	nop
1454cd235:     	cmpl	$0x1, 0x1f0(%rbp)
1454cd23c:     	jne	0x1454cd8d9 <.text+0x54cc8d9>
1454cd242:     	movss	0x1fc(%rbp), %xmm6
1454cd24a:     	jmp	0x1454cd8e1 <.text+0x54cc8e1>
1454cd24f:     	cmpq	$-0x1, 0x68(%rbx)
1454cd254:     	je	0x1454cd283 <.text+0x54cc283>
1454cd256:     	leaq	0x68(%rbx), %rdx
1454cd25a:     	leaq	0x1f0(%rbp), %rcx
1454cd261:     	movaps	%xmm9, %xmm2
1454cd265:     	movaps	%xmm10, %xmm3
1454cd269:     	callq	0x145467bf0 <.text+0x5466bf0>
1454cd26e:     	nop
1454cd26f:     	cmpl	$0x1, 0x1f0(%rbp)
1454cd276:     	jne	0x1454cd283 <.text+0x54cc283>
1454cd278:     	movss	0x1fc(%rbp), %xmm11
1454cd281:     	jmp	0x1454cd28c <.text+0x54cc28c>
1454cd283:     	movss	0x90(%rbx), %xmm11
1454cd28c:     	movlps	%xmm9, 0x194(%rbp)
1454cd294:     	movss	%xmm11, 0x19c(%rbp)
1454cd29d:     	movl	$0x1, 0x190(%rbp)
1454cd2a7:     	movl	$0x0, 0x1b8(%rbp)
1454cd2b1:     	leaq	0x1b8(%rbp), %rax
1454cd2b8:     	movq	%rax, 0x30(%rsp)
1454cd2bd:     	leaq	0x190(%rbp), %rax
1454cd2c4:     	movq	%rax, 0x28(%rsp)
1454cd2c9:     	movq	$0x0, 0x20(%rsp)
1454cd2d2:     	movl	$0x8, %r9d
1454cd2d8:     	leaq	0x1f0(%rbp), %rcx
1454cd2df:     	movq	%r13, %rdx
1454cd2e2:     	movl	%r15d, %r8d
1454cd2e5:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454cd2ea:     	nop
1454cd2eb:     	movq	0x2a0(%rbp), %rax
1454cd2f2:     	movq	0x548(%rax), %rsi
1454cd2f9:     	cmpq	0x538(%rax), %rsi
1454cd300:     	jne	0x1454cd30f <.text+0x54cc30f>
1454cd302:     	movq	0x290(%rbp), %rcx
1454cd309:     	callq	0x1457580b0 <.text+0x57570b0>
1454cd30e:     	nop
1454cd30f:     	movq	0x2a0(%rbp), %rdx
1454cd316:     	movq	0x540(%rdx), %rax
1454cd31d:     	movq	%rsi, %rcx
1454cd320:     	shlq	$0x5, %rcx
1454cd324:     	movups	0x1f0(%rbp), %xmm0
1454cd32b:     	movups	0x200(%rbp), %xmm1
1454cd332:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cd337:     	movups	%xmm0, (%rax,%rcx)
1454cd33b:     	incq	%rsi
1454cd33e:     	movq	%rsi, 0x548(%rdx)
1454cd345:     	movq	0x4e8(%rdx), %rsi
1454cd34c:     	cmpq	0x4d8(%rdx), %rsi
1454cd353:     	jne	0x1454cd362 <.text+0x54cc362>
1454cd355:     	movq	0x148(%rbp), %rcx
1454cd35c:     	callq	0x14575b510 <.text+0x575a510>
1454cd361:     	nop
1454cd362:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454cd367:     	movaps	%xmm8, %xmm0
1454cd36b:     	subss	%xmm10, %xmm0
1454cd370:     	movaps	%xmm6, %xmm1
1454cd373:     	subss	%xmm9, %xmm1
1454cd378:     	mulss	%xmm1, %xmm1
1454cd37c:     	mulss	%xmm0, %xmm0
1454cd380:     	addss	%xmm1, %xmm0
1454cd384:     	sqrtss	%xmm0, %xmm0
1454cd388:     	divss	0x1b0(%rbp), %xmm0
1454cd390:     	movaps	0x240(%rbp), %xmm1
1454cd397:     	addss	%xmm1, %xmm0
1454cd39b:     	movq	0x2a0(%rbp), %r9
1454cd3a2:     	movq	0x4e0(%r9), %rax
1454cd3a9:     	imulq	$0x58, %rsi, %rcx
1454cd3ad:     	movq	$0x1, (%rax,%rcx)
1454cd3b5:     	movq	%r13, 0x8(%rax,%rcx)
1454cd3ba:     	movl	$0x0, 0x10(%rax,%rcx)
1454cd3c2:     	movq	$0x0, 0x18(%rax,%rcx)
1454cd3cb:     	movl	$0x0, 0x20(%rax,%rcx)
1454cd3d3:     	movlps	%xmm9, 0x2c(%rax,%rcx)
1454cd3d9:     	movss	%xmm11, 0x34(%rax,%rcx)
1454cd3e0:     	movl	$0x40200000, 0x38(%rax,%rcx) # imm = 0x40200000
1454cd3e8:     	movl	%r15d, 0x3c(%rax,%rcx)
1454cd3ed:     	movaps	0x42b97b(%rip), %xmm14  # 0x1458f8d70
1454cd3f5:     	movss	%xmm1, %xmm14           # xmm14 = xmm1[0],xmm14[1,2,3]
1454cd3fa:     	movlps	%xmm14, 0x40(%rax,%rcx)
1454cd400:     	movl	$0x0, 0x48(%rax,%rcx)
1454cd408:     	movss	%xmm7, 0x4c(%rax,%rcx)
1454cd40e:     	movss	%xmm0, 0x50(%rax,%rcx)
1454cd414:     	movb	$0x5, 0x54(%rax,%rcx)
1454cd419:     	incq	%rsi
1454cd41c:     	movq	%rsi, 0x4e8(%r9)
1454cd423:     	cmpl	$0x1, %r14d
1454cd427:     	je	0x1454ccbb0 <.text+0x54cbbb0>
1454cd42d:     	movl	$0x1, %ebx
1454cd432:     	jmp	0x1454cd4f7 <.text+0x54cc4f7>
1454cd437:     	nopw	(%rax,%rax)
1454cd440:     	incl	%ebx
1454cd442:     	movaps	%xmm8, %xmm0
1454cd446:     	subss	%xmm10, %xmm0
1454cd44b:     	movaps	%xmm6, %xmm1
1454cd44e:     	subss	%xmm9, %xmm1
1454cd453:     	mulss	%xmm1, %xmm1
1454cd457:     	mulss	%xmm0, %xmm0
1454cd45b:     	addss	%xmm1, %xmm0
1454cd45f:     	sqrtss	%xmm0, %xmm0
1454cd463:     	divss	0x1b0(%rbp), %xmm0
1454cd46b:     	addss	0x240(%rbp), %xmm0
1454cd473:     	movq	0x2a0(%rbp), %r9
1454cd47a:     	movq	0x4e0(%r9), %rax
1454cd481:     	imulq	$0x58, %rsi, %rcx
1454cd485:     	movq	$0x1, (%rax,%rcx)
1454cd48d:     	movq	%r13, 0x8(%rax,%rcx)
1454cd492:     	movl	$0x0, 0x10(%rax,%rcx)
1454cd49a:     	movq	$0x0, 0x18(%rax,%rcx)
1454cd4a3:     	movl	$0x0, 0x20(%rax,%rcx)
1454cd4ab:     	movlps	%xmm9, 0x2c(%rax,%rcx)
1454cd4b1:     	movss	%xmm11, 0x34(%rax,%rcx)
1454cd4b8:     	movl	$0x40200000, 0x38(%rax,%rcx) # imm = 0x40200000
1454cd4c0:     	movl	%r15d, 0x3c(%rax,%rcx)
1454cd4c5:     	movlps	%xmm14, 0x40(%rax,%rcx)
1454cd4cb:     	movl	$0x0, 0x48(%rax,%rcx)
1454cd4d3:     	movss	%xmm7, 0x4c(%rax,%rcx)
1454cd4d9:     	movss	%xmm0, 0x50(%rax,%rcx)
1454cd4df:     	movb	$0x5, 0x54(%rax,%rcx)
1454cd4e4:     	incq	%rsi
1454cd4e7:     	movq	%rsi, 0x4e8(%r9)
1454cd4ee:     	cmpl	%r14d, %ebx
1454cd4f1:     	je	0x1454ccbb0 <.text+0x54cbbb0>
1454cd4f7:     	movq	0x880(%r9), %rdx
1454cd4fe:     	movq	0x888(%r9), %rcx
1454cd505:     	movq	0x898(%r9), %r8
1454cd50c:     	movq	0x890(%r9), %rax
1454cd513:     	nopw	%cs:(%rax,%rax)
1454cd520:     	leaq	(%rdx,%r8), %r9
1454cd524:     	rolq	$0x17, %r9
1454cd528:     	addq	%rdx, %r9
1454cd52b:     	movq	%rcx, %r10
1454cd52e:     	shlq	$0x11, %r10
1454cd532:     	xorq	%rdx, %rax
1454cd535:     	xorq	%rcx, %r8
1454cd538:     	xorq	%rax, %rcx
1454cd53b:     	xorq	%r8, %rdx
1454cd53e:     	xorq	%r10, %rax
1454cd541:     	rolq	$0x2d, %r8
1454cd545:     	shrq	$0x29, %r9
1454cd549:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454cd550:     	movd	%r9d, %xmm0
1454cd555:     	addss	%xmm15, %xmm0
1454cd55a:     	ucomiss	%xmm0, %xmm12
1454cd55e:     	jbe	0x1454cd520 <.text+0x54cc520>
1454cd560:     	movq	0x2a0(%rbp), %r9
1454cd567:     	movq	%rdx, 0x880(%r9)
1454cd56e:     	movq	%r8, 0x898(%r9)
1454cd575:     	movq	%rcx, 0x888(%r9)
1454cd57c:     	movq	%rax, 0x890(%r9)
1454cd583:     	movss	0x429099(%rip), %xmm1   # 0x1458f6624
1454cd58b:     	movss	0x41df65(%rip), %xmm2   # 0x1458eb4f8
1454cd593:     	nopw	%cs:(%rax,%rax)
1454cd5a0:     	leaq	(%rdx,%r8), %r9
1454cd5a4:     	rolq	$0x17, %r9
1454cd5a8:     	addq	%rdx, %r9
1454cd5ab:     	movq	%rcx, %r10
1454cd5ae:     	shlq	$0x11, %r10
1454cd5b2:     	xorq	%rdx, %rax
1454cd5b5:     	xorq	%rcx, %r8
1454cd5b8:     	xorq	%rax, %rcx
1454cd5bb:     	xorq	%r8, %rdx
1454cd5be:     	xorq	%r10, %rax
1454cd5c1:     	rolq	$0x2d, %r8
1454cd5c5:     	shrq	$0x29, %r9
1454cd5c9:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454cd5d0:     	movd	%r9d, %xmm11
1454cd5d5:     	addss	%xmm15, %xmm11
1454cd5da:     	mulss	%xmm2, %xmm11
1454cd5df:     	addss	%xmm1, %xmm11
1454cd5e4:     	ucomiss	%xmm11, %xmm13
1454cd5e8:     	jbe	0x1454cd5a0 <.text+0x54cc5a0>
1454cd5ea:     	movq	0x2a0(%rbp), %rsi
1454cd5f1:     	movq	%rdx, 0x880(%rsi)
1454cd5f8:     	movq	%r8, 0x898(%rsi)
1454cd5ff:     	movq	%rcx, 0x888(%rsi)
1454cd606:     	movl	%ebx, %ecx
1454cd608:     	cvtsi2ss	%rcx, %xmm9
1454cd60d:     	movq	%rax, 0x890(%rsi)
1454cd614:     	divss	0x168(%rbp), %xmm9
1454cd61d:     	mulss	0x41f9ee(%rip), %xmm9   # 0x1458ed014
1454cd626:     	addss	%xmm0, %xmm9
1454cd62b:     	movaps	%xmm9, %xmm0
1454cd62f:     	callq	0x145756e31 <.text+0x5755e31>
1454cd634:     	movaps	%xmm0, %xmm10
1454cd638:     	movaps	%xmm9, %xmm0
1454cd63c:     	callq	0x145756e2b <.text+0x5755e2b>
1454cd641:     	unpcklps	%xmm0, %xmm10           # xmm10 = xmm10[0],xmm0[0],xmm10[1],xmm0[1]
1454cd645:     	movsldup	%xmm11, %xmm9           # xmm9 = xmm11[0,0,2,2]
1454cd64a:     	mulps	%xmm10, %xmm9
1454cd64e:     	addps	0x170(%rbp), %xmm9
1454cd656:     	movshdup	%xmm9, %xmm10           # xmm10 = xmm9[1,1,3,3]
1454cd65b:     	movq	0x878(%rsi), %rsi
1454cd662:     	leaq	0x10(%rsi), %rcx
1454cd666:     	movaps	%xmm9, %xmm1
1454cd66a:     	movaps	%xmm10, %xmm2
1454cd66e:     	callq	0x1454627f0 <.text+0x54617f0>
1454cd673:     	nop
1454cd674:     	testb	$0x1, %al
1454cd676:     	je	0x1454cd680 <.text+0x54cc680>
1454cd678:     	movaps	%xmm0, %xmm11
1454cd67c:     	jmp	0x1454cd6c9 <.text+0x54cc6c9>
1454cd67e:     	nop
1454cd680:     	cmpq	$-0x1, 0x68(%rsi)
1454cd685:     	je	0x1454cd6c0 <.text+0x54cc6c0>
1454cd687:     	leaq	0x68(%rsi), %rdx
1454cd68b:     	leaq	0x1f0(%rbp), %rcx
1454cd692:     	movaps	%xmm9, %xmm2
1454cd696:     	movaps	%xmm10, %xmm3
1454cd69a:     	callq	0x145467bf0 <.text+0x5466bf0>
1454cd69f:     	nop
1454cd6a0:     	cmpl	$0x1, 0x1f0(%rbp)
1454cd6a7:     	jne	0x1454cd6c0 <.text+0x54cc6c0>
1454cd6a9:     	movss	0x1fc(%rbp), %xmm11
1454cd6b2:     	jmp	0x1454cd6c9 <.text+0x54cc6c9>
1454cd6b4:     	nopw	%cs:(%rax,%rax)
1454cd6c0:     	movss	0x90(%rsi), %xmm11
1454cd6c9:     	movlps	%xmm9, 0x194(%rbp)
1454cd6d1:     	movss	%xmm11, 0x19c(%rbp)
1454cd6da:     	movl	$0x1, 0x190(%rbp)
1454cd6e4:     	movl	$0x0, 0x1b8(%rbp)
1454cd6ee:     	leaq	0x1b8(%rbp), %rax
1454cd6f5:     	movq	%rax, 0x30(%rsp)
1454cd6fa:     	leaq	0x190(%rbp), %rax
1454cd701:     	movq	%rax, 0x28(%rsp)
1454cd706:     	movq	$0x0, 0x20(%rsp)
1454cd70f:     	movl	$0x8, %r9d
1454cd715:     	leaq	0x1f0(%rbp), %rcx
1454cd71c:     	movq	%r13, %rdx
1454cd71f:     	movl	%r15d, %r8d
1454cd722:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454cd727:     	nop
1454cd728:     	movq	0x2a0(%rbp), %rax
1454cd72f:     	movq	0x548(%rax), %rsi
1454cd736:     	cmpq	0x538(%rax), %rsi
1454cd73d:     	jne	0x1454cd74c <.text+0x54cc74c>
1454cd73f:     	movq	0x290(%rbp), %rcx
1454cd746:     	callq	0x1457580b0 <.text+0x57570b0>
1454cd74b:     	nop
1454cd74c:     	movq	0x2a0(%rbp), %rdx
1454cd753:     	movq	0x540(%rdx), %rax
1454cd75a:     	movq	%rsi, %rcx
1454cd75d:     	shlq	$0x5, %rcx
1454cd761:     	movups	0x1f0(%rbp), %xmm0
1454cd768:     	movups	0x200(%rbp), %xmm1
1454cd76f:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cd774:     	movups	%xmm0, (%rax,%rcx)
1454cd778:     	incq	%rsi
1454cd77b:     	movq	%rsi, 0x548(%rdx)
1454cd782:     	movq	0x4e8(%rdx), %rsi
1454cd789:     	cmpq	0x4d8(%rdx), %rsi
1454cd790:     	jne	0x1454cd440 <.text+0x54cc440>
1454cd796:     	movq	0x148(%rbp), %rcx
1454cd79d:     	callq	0x14575b510 <.text+0x575a510>
1454cd7a2:     	nop
1454cd7a3:     	jmp	0x1454cd440 <.text+0x54cc440>
1454cd7a8:     	movss	0x90(%rsi), %xmm8
1454cd7b1:     	jmp	0x1454cd7cd <.text+0x54cc7cd>
1454cd7b3:     	movss	0x90(%rsi), %xmm6
1454cd7bb:     	jmp	0x1454cd8e5 <.text+0x54cc8e5>
1454cd7c0:     	movss	0x90(%rsi), %xmm8
1454cd7c9:     	movaps	%xmm14, %xmm2
1454cd7cd:     	movq	0x2a0(%rbp), %rax
1454cd7d4:     	movq	0x878(%rax), %rcx
1454cd7db:     	cmpq	$-0x1, 0x40(%rcx)
1454cd7e0:     	movshdup	%xmm6, %xmm9            # xmm9 = xmm6[1,1,3,3]
1454cd7e5:     	je	0x1454cd9cc <.text+0x54cc9cc>
1454cd7eb:     	addq	$0x40, %rcx
1454cd7ef:     	movd	%xmm6, %edx
1454cd7f3:     	movd	%xmm9, %eax
1454cd7f8:     	shlq	$0x20, %rax
1454cd7fc:     	orq	%rax, %rdx
1454cd7ff:     	movd	%xmm2, %r8d
1454cd804:     	movd	%xmm10, %eax
1454cd809:     	shlq	$0x20, %rax
1454cd80d:     	orq	%rax, %r8
1454cd810:     	callq	0x14545e830 <.text+0x545d830>
1454cd815:     	nop
1454cd816:     	ucomiss	%xmm12, %xmm0
1454cd81a:     	jae	0x1454cd864 <.text+0x54cc864>
1454cd81c:     	movaps	%xmm6, %xmm1
1454cd81f:     	subps	%xmm14, %xmm1
1454cd823:     	mulps	%xmm1, %xmm1
1454cd826:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454cd82a:     	addss	%xmm1, %xmm2
1454cd82e:     	xorps	%xmm1, %xmm1
1454cd831:     	sqrtss	%xmm2, %xmm1
1454cd835:     	movss	0x41dc4b(%rip), %xmm2   # 0x1458eb488
1454cd83d:     	maxss	%xmm2, %xmm1
1454cd841:     	divss	%xmm1, %xmm2
1454cd845:     	subss	%xmm2, %xmm0
1454cd849:     	xorps	%xmm1, %xmm1
1454cd84c:     	maxss	%xmm1, %xmm0
1454cd850:     	subps	%xmm6, %xmm14
1454cd854:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454cd858:     	mulps	%xmm14, %xmm0
1454cd85c:     	addps	%xmm6, %xmm0
1454cd85f:     	movaps	%xmm0, %xmm1
1454cd862:     	jmp	0x1454cd868 <.text+0x54cc868>
1454cd864:     	movaps	%xmm14, %xmm1
1454cd868:     	movshdup	%xmm1, %xmm10           # xmm10 = xmm1[1,1,3,3]
1454cd86d:     	movq	0x2a0(%rbp), %rax
1454cd874:     	movq	0x878(%rax), %rsi
1454cd87b:     	leaq	0x10(%rsi), %rcx
1454cd87f:     	movaps	%xmm1, %xmm14
1454cd883:     	movaps	%xmm10, %xmm2
1454cd887:     	callq	0x1454627f0 <.text+0x54617f0>
1454cd88c:     	nop
1454cd88d:     	testb	$0x1, %al
1454cd88f:     	je	0x1454cd89a <.text+0x54cc89a>
1454cd891:     	movaps	%xmm0, %xmm8
1454cd895:     	jmp	0x1454cd9c8 <.text+0x54cc9c8>
1454cd89a:     	cmpq	$-0x1, 0x68(%rsi)
1454cd89f:     	movaps	%xmm14, %xmm2
1454cd8a3:     	je	0x1454cd9b4 <.text+0x54cc9b4>
1454cd8a9:     	leaq	0x68(%rsi), %rdx
1454cd8ad:     	leaq	0x1f0(%rbp), %rcx
1454cd8b4:     	movaps	%xmm10, %xmm3
1454cd8b8:     	callq	0x145467bf0 <.text+0x5466bf0>
1454cd8bd:     	nop
1454cd8be:     	cmpl	$0x1, 0x1f0(%rbp)
1454cd8c5:     	jne	0x1454cd9bf <.text+0x54cc9bf>
1454cd8cb:     	movss	0x1fc(%rbp), %xmm8
1454cd8d4:     	jmp	0x1454cd9c8 <.text+0x54cc9c8>
1454cd8d9:     	movss	0x90(%rsi), %xmm6
1454cd8e1:     	movaps	%xmm14, %xmm2
1454cd8e5:     	movlps	%xmm2, 0x1f0(%rbp)
1454cd8ec:     	movss	%xmm6, 0x1f8(%rbp)
1454cd8f4:     	movq	0x2a0(%rbp), %rcx
1454cd8fb:     	movl	%r15d, %edx
1454cd8fe:     	leaq	0x1f0(%rbp), %r8
1454cd905:     	movaps	%xmm8, %xmm3
1454cd909:     	callq	0x1454eeaa0 <.text+0x54edaa0>
1454cd90e:     	nop
1454cd90f:     	movq	%rax, %rbx
1454cd912:     	movq	0x2a0(%rbp), %rax
1454cd919:     	movq	0x4e8(%rax), %rsi
1454cd920:     	cmpq	0x4d8(%rax), %rsi
1454cd927:     	jne	0x1454cd936 <.text+0x54cc936>
1454cd929:     	movq	0x148(%rbp), %rcx
1454cd930:     	callq	0x14575b510 <.text+0x575a510>
1454cd935:     	nop
1454cd936:     	mulss	%xmm7, %xmm11
1454cd93b:     	movaps	0x240(%rbp), %xmm1
1454cd942:     	addss	%xmm1, %xmm10
1454cd947:     	movq	0x2a0(%rbp), %rdx
1454cd94e:     	movq	0x4e0(%rdx), %rax
1454cd955:     	imulq	$0x58, %rsi, %rcx
1454cd959:     	movq	$0x1, (%rax,%rcx)
1454cd961:     	movq	%r13, 0x8(%rax,%rcx)
1454cd966:     	movl	%r14d, 0x10(%rax,%rcx)
1454cd96b:     	movq	%rbx, 0x18(%rax,%rcx)
1454cd970:     	movl	$0x0, 0x20(%rax,%rcx)
1454cd978:     	movlps	%xmm14, 0x2c(%rax,%rcx)
1454cd97e:     	movss	%xmm6, 0x34(%rax,%rcx)
1454cd984:     	movss	%xmm8, 0x38(%rax,%rcx)
1454cd98b:     	movl	%r15d, 0x3c(%rax,%rcx)
1454cd990:     	movaps	0x42b3d9(%rip), %xmm0   # 0x1458f8d70
1454cd997:     	movss	%xmm1, %xmm0            # xmm0 = xmm1[0],xmm0[1,2,3]
1454cd99b:     	movlps	%xmm0, 0x40(%rax,%rcx)
1454cd9a0:     	movl	$0x0, 0x48(%rax,%rcx)
1454cd9a8:     	movss	%xmm11, 0x4c(%rax,%rcx)
1454cd9af:     	jmp	0x1454cdcf5 <.text+0x54cccf5>
1454cd9b4:     	movss	0x90(%rsi), %xmm8
1454cd9bd:     	jmp	0x1454cd9cc <.text+0x54cc9cc>
1454cd9bf:     	movss	0x90(%rsi), %xmm8
1454cd9c8:     	movaps	%xmm14, %xmm2
1454cd9cc:     	movaps	%xmm6, %xmm0
1454cd9cf:     	movaps	%xmm2, %xmm14
1454cd9d3:     	subss	%xmm2, %xmm0
1454cd9d7:     	movaps	%xmm9, %xmm1
1454cd9db:     	subss	%xmm10, %xmm1
1454cd9e0:     	mulss	%xmm0, %xmm0
1454cd9e4:     	mulss	%xmm1, %xmm1
1454cd9e8:     	addss	%xmm0, %xmm1
1454cd9ec:     	xorps	%xmm10, %xmm10
1454cd9f0:     	sqrtss	%xmm1, %xmm10
1454cd9f5:     	divss	0x470896(%rip), %xmm10  # 0x14593e294
1454cd9fe:     	maxss	0x55cb99(%rip), %xmm10  # 0x145a2a5a0
1454cda07:     	movq	0x2a0(%rbp), %rax
1454cda0e:     	movq	0x3d0(%rax), %rax
1454cda15:     	movq	%rax, 0x130(%rbp)
1454cda1c:     	movq	%rax, 0x198(%rbp)
1454cda23:     	movl	$0x0, 0x190(%rbp)
1454cda2d:     	movl	$0x0, 0x1b8(%rbp)
1454cda37:     	leaq	0x1b8(%rbp), %rax
1454cda3e:     	movq	%rax, 0x30(%rsp)
1454cda43:     	leaq	0x190(%rbp), %rax
1454cda4a:     	movq	%rax, 0x28(%rsp)
1454cda4f:     	movq	$0x1, 0x20(%rsp)
1454cda58:     	leaq	0x1f0(%rbp), %rcx
1454cda5f:     	movq	%r13, %rdx
1454cda62:     	movl	%r15d, %r8d
1454cda65:     	leaq	0x130(%rbp), %r9
1454cda6c:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454cda71:     	nop
1454cda72:     	movq	0x2a0(%rbp), %rax
1454cda79:     	movq	0x548(%rax), %rsi
1454cda80:     	cmpq	0x538(%rax), %rsi
1454cda87:     	jne	0x1454cda96 <.text+0x54cca96>
1454cda89:     	movq	0x290(%rbp), %rcx
1454cda90:     	callq	0x1457580b0 <.text+0x57570b0>
1454cda95:     	nop
1454cda96:     	movq	0x2a0(%rbp), %rdx
1454cda9d:     	movq	0x540(%rdx), %rax
1454cdaa4:     	movq	%rsi, %rcx
1454cdaa7:     	shlq	$0x5, %rcx
1454cdaab:     	movups	0x1f0(%rbp), %xmm0
1454cdab2:     	movups	0x200(%rbp), %xmm1
1454cdab9:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cdabe:     	movups	%xmm0, (%rax,%rcx)
1454cdac2:     	incq	%rsi
1454cdac5:     	movq	%rsi, 0x548(%rdx)
1454cdacc:     	movq	0x878(%rdx), %rcx
1454cdad3:     	addq	$0x10, %rcx
1454cdad7:     	movaps	%xmm6, %xmm1
1454cdada:     	movaps	%xmm9, %xmm2
1454cdade:     	callq	0x1454627f0 <.text+0x54617f0>
1454cdae3:     	nop
1454cdae4:     	movaps	%xmm0, %xmm9
1454cdae8:     	testb	$0x1, %al
1454cdaea:     	jne	0x1454cdaf0 <.text+0x54ccaf0>
1454cdaec:     	movaps	%xmm11, %xmm9
1454cdaf0:     	movq	0x2a0(%rbp), %rdx
1454cdaf7:     	movl	0x908(%rdx), %eax
1454cdafd:     	incl	%eax
1454cdaff:     	movaps	%xmm10, %xmm0
1454cdb03:     	mulss	0x463405(%rip), %xmm0   # 0x145930f10
1454cdb0b:     	cvttss2si	%xmm0, %rcx
1454cdb10:     	xorps	%xmm1, %xmm1
1454cdb13:     	ucomiss	%xmm1, %xmm0
1454cdb16:     	movl	$0x0, %r8d
1454cdb1c:     	cmovbl	%r8d, %ecx
1454cdb20:     	ucomiss	0x41d9f5(%rip), %xmm0   # 0x1458eb51c
1454cdb27:     	movl	%eax, 0x908(%rdx)
1454cdb2d:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454cdb32:     	cmoval	%edx, %ecx
1454cdb35:     	movlps	%xmm14, 0x1b8(%rbp)
1454cdb3d:     	movss	%xmm8, 0x1c0(%rbp)
1454cdb46:     	movlpd	%xmm6, 0x190(%rbp)
1454cdb4e:     	movss	%xmm9, 0x198(%rbp)
1454cdb57:     	movl	%ecx, 0x28(%rsp)
1454cdb5b:     	movl	%eax, 0x20(%rsp)
1454cdb5f:     	leaq	0x1f0(%rbp), %rcx
1454cdb66:     	movq	%r13, %rdx
1454cdb69:     	leaq	0x190(%rbp), %r8
1454cdb70:     	leaq	0x1b8(%rbp), %r9
1454cdb77:     	callq	0x145440d40 <.text+0x543fd40>
1454cdb7c:     	nop
1454cdb7d:     	movq	0x2a0(%rbp), %rax
1454cdb84:     	movq	0x548(%rax), %rsi
1454cdb8b:     	cmpq	0x538(%rax), %rsi
1454cdb92:     	jne	0x1454cdba1 <.text+0x54ccba1>
1454cdb94:     	movq	0x290(%rbp), %rcx
1454cdb9b:     	callq	0x1457580b0 <.text+0x57570b0>
1454cdba0:     	nop
1454cdba1:     	movq	0x2a0(%rbp), %rdx
1454cdba8:     	movq	0x540(%rdx), %rax
1454cdbaf:     	movq	%rsi, %rcx
1454cdbb2:     	shlq	$0x5, %rcx
1454cdbb6:     	movups	0x1f0(%rbp), %xmm0
1454cdbbd:     	movups	0x200(%rbp), %xmm1
1454cdbc4:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cdbc9:     	movups	%xmm0, (%rax,%rcx)
1454cdbcd:     	incq	%rsi
1454cdbd0:     	movq	%rsi, 0x548(%rdx)
1454cdbd7:     	cmpq	0x4d0(%rdx), %r12
1454cdbde:     	jae	0x1454cdc58 <.text+0x54ccc58>
1454cdbe0:     	movq	0x4c8(%rdx), %rax
1454cdbe7:     	movlpd	%xmm6, 0x10c(%rax,%rbx)
1454cdbf0:     	movss	%xmm9, 0x114(%rax,%rbx)
1454cdbfa:     	movlps	%xmm14, 0x118(%rax,%rbx)
1454cdc03:     	movss	%xmm8, 0x120(%rax,%rbx)
1454cdc0d:     	movaps	0x240(%rbp), %xmm0
1454cdc14:     	movss	%xmm0, 0x124(%rax,%rbx)
1454cdc1d:     	movss	%xmm10, 0x128(%rax,%rbx)
1454cdc27:     	addss	%xmm10, %xmm0
1454cdc2c:     	movaps	%xmm0, %xmm1
1454cdc2f:     	unpcklps	%xmm10, %xmm1           # xmm1 = xmm1[0],xmm10[0],xmm1[1],xmm10[1]
1454cdc33:     	addps	0x14dc9a6(%rip), %xmm1  # 0x1469aa5e0
1454cdc3a:     	movlps	%xmm1, 0x12c(%rax,%rbx)
1454cdc42:     	movaps	%xmm0, %xmm10
1454cdc46:     	movq	0x4e8(%rdx), %rsi
1454cdc4d:     	cmpq	0x4d8(%rdx), %rsi
1454cdc54:     	je	0x1454cdc71 <.text+0x54ccc71>
1454cdc56:     	jmp	0x1454cdc7e <.text+0x54ccc7e>
1454cdc58:     	addss	0x240(%rbp), %xmm10
1454cdc61:     	movq	0x4e8(%rdx), %rsi
1454cdc68:     	cmpq	0x4d8(%rdx), %rsi
1454cdc6f:     	jne	0x1454cdc7e <.text+0x54ccc7e>
1454cdc71:     	movq	0x148(%rbp), %rcx
1454cdc78:     	callq	0x14575b510 <.text+0x575a510>
1454cdc7d:     	nop
1454cdc7e:     	addss	%xmm7, %xmm7
1454cdc82:     	movq	0x2a0(%rbp), %rdx
1454cdc89:     	movq	0x4e0(%rdx), %rax
1454cdc90:     	imulq	$0x58, %rsi, %rcx
1454cdc94:     	movq	$0x1, (%rax,%rcx)
1454cdc9c:     	movq	%r13, 0x8(%rax,%rcx)
1454cdca1:     	movl	$0x18c7, 0x10(%rax,%rcx) # imm = 0x18C7
1454cdca9:     	movq	$0x0, 0x18(%rax,%rcx)
1454cdcb2:     	movl	$0x0, 0x20(%rax,%rcx)
1454cdcba:     	movlps	%xmm14, 0x2c(%rax,%rcx)
1454cdcc0:     	movss	%xmm8, 0x34(%rax,%rcx)
1454cdcc7:     	movq	$0x40900000, 0x38(%rax,%rcx) # imm = 0x40900000
1454cdcd0:     	movaps	0x42b099(%rip), %xmm0   # 0x1458f8d70
1454cdcd7:     	movaps	0x240(%rbp), %xmm1
1454cdcde:     	movss	%xmm1, %xmm0            # xmm0 = xmm1[0],xmm0[1,2,3]
1454cdce2:     	movlps	%xmm0, 0x40(%rax,%rcx)
1454cdce7:     	movl	$0x0, 0x48(%rax,%rcx)
1454cdcef:     	movss	%xmm7, 0x4c(%rax,%rcx)
1454cdcf5:     	movss	%xmm10, 0x50(%rax,%rcx)
1454cdcfc:     	movb	$0x0, 0x54(%rax,%rcx)
1454cdd01:     	incq	%rsi
1454cdd04:     	movq	%rsi, 0x4e8(%rdx)

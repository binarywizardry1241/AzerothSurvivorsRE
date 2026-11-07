
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cdd32:     	movq	0x78(%rbp), %rax
1454cdd36:     	movq	%rax, 0x260(%rbp)
1454cdd3d:     	movq	0x80(%rbp), %r14
1454cdd44:     	movq	0x88(%rbp), %rax
1454cdd4b:     	leaq	(%r14,%rax,8), %r15
1454cdd4f:     	xorl	%esi, %esi
1454cdd51:     	xorps	%xmm7, %xmm7
1454cdd54:     	xorps	%xmm8, %xmm8
1454cdd58:     	movq	%r14, 0x240(%rbp)
1454cdd5f:     	movss	0x41d7b4(%rip), %xmm9   # 0x1458eb51c
1454cdd68:     	jmp	0x1454cddb0 <.text+0x54ccdb0>
1454cdd6a:     	movq	0x540(%rdi), %rax
1454cdd71:     	movq	%rsi, %rcx
1454cdd74:     	shlq	$0x5, %rcx
1454cdd78:     	movups	0x1f0(%rbp), %xmm0
1454cdd7f:     	movups	0x200(%rbp), %xmm1
1454cdd86:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cdd8b:     	movups	%xmm0, (%rax,%rcx)
1454cdd8f:     	incq	%rsi
1454cdd92:     	movq	%rsi, 0x548(%rdi)
1454cdd99:     	leaq	0x130(%rbp), %rcx
1454cdda0:     	callq	0x1455127d0 <.text+0x55117d0>
1454cdda5:     	nop
1454cdda6:     	xorl	%esi, %esi
1454cdda8:     	nopl	(%rax,%rax)
1454cddb0:     	cmpq	%r15, %r14
1454cddb3:     	je	0x1454ce220 <.text+0x54cd220>
1454cddb9:     	movq	(%r14), %r13
1454cddbc:     	addq	$0x8, %r14
1454cddc0:     	movq	0x2a0(%rbp), %rax
1454cddc7:     	movq	0x4c8(%rax), %rbx
1454cddce:     	imulq	$0x160, 0x4d0(%rax), %r12 # imm = 0x160
1454cddd9:     	xorl	%eax, %eax
1454cdddb:     	movq	%rbx, %rcx
1454cddde:     	nop
1454cdde0:     	cmpq	%rax, %r12
1454cdde3:     	je	0x1454cddb0 <.text+0x54ccdb0>
1454cdde5:     	addq	$0x160, %rax            # imm = 0x160
1454cddeb:     	cmpq	%r13, 0x88(%rcx)
1454cddf2:     	leaq	0x160(%rcx), %rcx
1454cddf9:     	jne	0x1454cdde0 <.text+0x54ccde0>
1454cddfb:     	cmpq	$-0x1, -0x120(%rbx,%rax)
1454cde04:     	je	0x1454cddb0 <.text+0x54ccdb0>
1454cde06:     	movq	-0x108(%rbx,%rax), %rax
1454cde0e:     	movq	0x2a0(%rbp), %rcx
1454cde15:     	cmpq	0x590(%rcx), %rax
1454cde1c:     	jae	0x1454cddb0 <.text+0x54ccdb0>
1454cde1e:     	movq	0x2a0(%rbp), %rcx
1454cde25:     	movq	0x588(%rcx), %rdx
1454cde2c:     	leaq	(%rax,%rax,4), %rax
1454cde30:     	movq	0x10(%rdx,%rax,8), %rdi
1454cde35:     	movq	%rdi, %rdx
1454cde38:     	callq	0x1454ef9f0 <.text+0x54ee9f0>
1454cde3d:     	nop
1454cde3e:     	movaps	%xmm0, %xmm6
1454cde41:     	movq	0x2a0(%rbp), %rcx
1454cde48:     	movq	%rdi, %rdx
1454cde4b:     	callq	0x1454efdf0 <.text+0x54eedf0>
1454cde50:     	nop
1454cde51:     	addq	$-0x160, %rbx           # imm = 0xFEA0
1454cde58:     	nopl	(%rax,%rax)
1454cde60:     	testq	%r12, %r12
1454cde63:     	je	0x1454cddb0 <.text+0x54ccdb0>
1454cde69:     	leaq	0x160(%rbx), %rdi
1454cde70:     	addq	$-0x160, %r12           # imm = 0xFEA0
1454cde77:     	cmpq	%r13, 0x1e8(%rbx)
1454cde7e:     	movq	%rdi, %rbx
1454cde81:     	jne	0x1454cde60 <.text+0x54cce60>
1454cde83:     	movss	0xf4(%rdi), %xmm1
1454cde8b:     	ucomiss	%xmm1, %xmm6
1454cde8e:     	jbe	0x1454cdebf <.text+0x54ccebf>
1454cde90:     	movss	0xf0(%rdi), %xmm2
1454cde98:     	divss	%xmm1, %xmm2
1454cde9c:     	xorps	%xmm1, %xmm1
1454cde9f:     	maxss	%xmm2, %xmm1
1454cdea3:     	movaps	%xmm12, %xmm2
1454cdea7:     	minss	%xmm1, %xmm2
1454cdeab:     	movss	%xmm6, 0xf4(%rdi)
1454cdeb3:     	mulss	%xmm2, %xmm6
1454cdeb7:     	movss	%xmm6, 0xf0(%rdi)
1454cdebf:     	movss	0xf8(%rdi), %xmm1
1454cdec7:     	movaps	%xmm1, %xmm2
1454cdeca:     	maxss	%xmm0, %xmm2
1454cdece:     	movaps	%xmm2, %xmm0
1454cded1:     	cmpunordss	%xmm2, %xmm0
1454cded6:     	movaps	%xmm0, %xmm3
1454cded9:     	andnps	%xmm2, %xmm3
1454cdedc:     	andps	%xmm1, %xmm0
1454cdedf:     	orps	%xmm3, %xmm0
1454cdee2:     	movss	%xmm0, 0xf8(%rdi)
1454cdeea:     	movq	%rdi, %rcx
1454cdeed:     	callq	0x14540d290 <.text+0x540c290>
1454cdef2:     	nop
1454cdef3:     	movq	%rax, %r12
1454cdef6:     	movq	%rdx, %rbx
1454cdef9:     	movss	0xf0(%rdi), %xmm6
1454cdf01:     	movss	0xf4(%rdi), %xmm0
1454cdf09:     	callq	0x145756e6d <.text+0x5755e6d>
1454cdf0e:     	cvttss2si	%xmm0, %r8
1454cdf13:     	ucomiss	%xmm7, %xmm0
1454cdf16:     	cmovbl	%esi, %r8d
1454cdf1a:     	ucomiss	%xmm9, %xmm0
1454cdf1e:     	movl	$0xffffffff, %edi       # imm = 0xFFFFFFFF
1454cdf23:     	cmoval	%edi, %r8d
1454cdf27:     	movq	$0x0, 0x130(%rbp)
1454cdf32:     	movq	$0x0, 0x140(%rbp)
1454cdf3d:     	leaq	0x130(%rbp), %rax
1454cdf44:     	movq	%rax, 0x1f0(%rbp)
1454cdf4b:     	leaq	0x1f8(%rbp), %rax
1454cdf52:     	movups	%xmm8, (%rax)
1454cdf56:     	movq	$0x1c, 0x210(%rbp)
1454cdf61:     	leaq	0x190(%rbp), %rcx
1454cdf68:     	leaq	0x1f0(%rbp), %rdx
1454cdf6f:     	callq	0x145427a50 <.text+0x5426a50>
1454cdf74:     	nop
1454cdf75:     	movaps	%xmm6, %xmm0
1454cdf78:     	callq	0x145756e6d <.text+0x5755e6d>
1454cdf7d:     	cvttss2si	%xmm0, %r8
1454cdf82:     	ucomiss	%xmm7, %xmm0
1454cdf85:     	cmovbl	%esi, %r8d
1454cdf89:     	ucomiss	%xmm9, %xmm0
1454cdf8d:     	cmoval	%edi, %r8d
1454cdf91:     	movq	0x130(%rbp), %rax
1454cdf98:     	testq	%rax, %rax
1454cdf9b:     	je	0x1454ce007 <.text+0x54cd007>
1454cdf9d:     	movq	0x138(%rbp), %rcx
1454cdfa4:     	movw	$0x16, %si
1454cdfa8:     	movzwl	0x36(%rax), %r9d
1454cdfad:     	movl	%r9d, %r10d
1454cdfb0:     	addl	%r10d, %r10d
1454cdfb3:     	movq	$-0x1, %rdx
1454cdfba:     	nopw	(%rax,%rax)
1454cdfc0:     	testq	%r10, %r10
1454cdfc3:     	je	0x1454cdff0 <.text+0x54ccff0>
1454cdfc5:     	cmpw	0x3a(%rax,%rdx,2), %si
1454cdfca:     	seta	%r11b
1454cdfce:     	sbbb	$0x0, %r11b
1454cdfd2:     	incq	%rdx
1454cdfd5:     	addq	$-0x2, %r10
1454cdfd9:     	cmpb	$0x1, %r11b
1454cdfdd:     	je	0x1454cdfc0 <.text+0x54ccfc0>
1454cdfdf:     	movzbl	%r11b, %r9d
1454cdfe3:     	testl	%r9d, %r9d
1454cdfe6:     	je	0x1454ce000 <.text+0x54cd000>
1454cdfe8:     	subq	$0x1, %rcx
1454cdfec:     	jae	0x1454cdff9 <.text+0x54ccff9>
1454cdfee:     	jmp	0x1454ce009 <.text+0x54cd009>
1454cdff0:     	movq	%r9, %rdx
1454cdff3:     	subq	$0x1, %rcx
1454cdff7:     	jb	0x1454ce009 <.text+0x54cd009>
1454cdff9:     	movq	0x50(%rax,%rdx,8), %rax
1454cdffe:     	jmp	0x1454cdfa8 <.text+0x54ccfa8>
1454ce000:     	movl	%r8d, 0x8(%rax,%rdx,4)
1454ce005:     	jmp	0x1454ce04f <.text+0x54cd04f>
1454ce007:     	xorl	%eax, %eax
1454ce009:     	leaq	0x130(%rbp), %rcx
1454ce010:     	movq	%rcx, 0x1f0(%rbp)
1454ce017:     	movq	%rax, 0x1f8(%rbp)
1454ce01e:     	movq	$0x0, 0x200(%rbp)
1454ce029:     	movq	%rdx, 0x208(%rbp)
1454ce030:     	movq	$0x16, 0x210(%rbp)
1454ce03b:     	leaq	0x190(%rbp), %rcx
1454ce042:     	leaq	0x1f0(%rbp), %rdx
1454ce049:     	callq	0x145427a50 <.text+0x5426a50>
1454ce04e:     	nop
1454ce04f:     	movl	$0x0, 0x1d0(%rbp)
1454ce059:     	movq	$0x0, 0x1b8(%rbp)
1454ce064:     	movq	$0x1, 0x1c0(%rbp)
1454ce06f:     	movq	$0x0, 0x1c8(%rbp)
1454ce07a:     	cmpq	$0x0, 0x140(%rbp)
1454ce082:     	je	0x1454ce0e5 <.text+0x54cd0e5>
1454ce084:     	movb	$0x1, 0x29f(%rbp)
1454ce08b:     	leaq	0x1b8(%rbp), %rcx
1454ce092:     	callq	0x1458e7110 <.text+0x58e6110>
1454ce097:     	nop
1454ce098:     	movq	0x1c0(%rbp), %rax
1454ce09f:     	movb	$0x0, (%rax)
1454ce0a2:     	movq	$0x1, 0x1c8(%rbp)
1454ce0ad:     	movb	$0x1, 0x29f(%rbp)
1454ce0b4:     	movq	%r13, %rcx
1454ce0b7:     	leaq	0x1b8(%rbp), %rdx
1454ce0be:     	callq	0x145509090 <.text+0x5508090>
1454ce0c3:     	nop
1454ce0c4:     	movb	$0x1, 0x29f(%rbp)
1454ce0cb:     	leaq	0x130(%rbp), %rcx
1454ce0d2:     	leaq	0x1b8(%rbp), %rdx
1454ce0d9:     	callq	0x145500460 <.text+0x54ff460>
1454ce0de:     	nop
1454ce0df:     	incl	0x1d0(%rbp)
1454ce0e5:     	movq	0x1b8(%rbp), %rax
1454ce0ec:     	movq	0x1c0(%rbp), %rcx
1454ce0f3:     	movq	0x1c8(%rbp), %rdx
1454ce0fa:     	movq	%rdx, 0x200(%rbp)
1454ce101:     	movl	0x1d0(%rbp), %edx
1454ce107:     	movl	%edx, 0x208(%rbp)
1454ce10d:     	movl	0x1d4(%rbp), %edx
1454ce113:     	movl	%edx, 0x20c(%rbp)
1454ce119:     	movq	%rax, 0x1f0(%rbp)
1454ce120:     	movq	%rcx, 0x1f8(%rbp)
1454ce127:     	movb	$0x0, 0x29f(%rbp)
1454ce12e:     	leaq	0x190(%rbp), %rcx
1454ce135:     	leaq	0x1f0(%rbp), %rdx
1454ce13c:     	callq	0x1454ffad0 <.text+0x54fead0>
1454ce141:     	nop
1454ce142:     	movq	0x2a0(%rbp), %rax
1454ce149:     	movq	0x548(%rax), %rsi
1454ce150:     	cmpq	0x538(%rax), %rsi
1454ce157:     	jne	0x1454ce166 <.text+0x54cd166>
1454ce159:     	movq	0x290(%rbp), %rcx
1454ce160:     	callq	0x1457580b0 <.text+0x57570b0>
1454ce165:     	nop
1454ce166:     	movq	0x2a0(%rbp), %rdx
1454ce16d:     	movq	0x540(%rdx), %rax
1454ce174:     	movq	%rsi, %rcx
1454ce177:     	shlq	$0x5, %rcx
1454ce17b:     	movups	0x190(%rbp), %xmm0
1454ce182:     	movups	0x1a0(%rbp), %xmm1
1454ce189:     	movups	%xmm1, 0x10(%rax,%rcx)
1454ce18e:     	movups	%xmm0, (%rax,%rcx)
1454ce192:     	incq	%rsi
1454ce195:     	movq	%rsi, 0x548(%rdx)
1454ce19c:     	movb	$0x0, 0x29f(%rbp)
1454ce1a3:     	movl	$0x18, %edx
1454ce1a8:     	leaq	0x14dd5ff(%rip), %rcx   # 0x1469ab7ae
1454ce1af:     	callq	0x145452400 <.text+0x5451400>
1454ce1b4:     	nop
1454ce1b5:     	testq	%rax, %rax
1454ce1b8:     	leaq	0x14dd5ef(%rip), %rcx   # 0x1469ab7ae
1454ce1bf:     	cmoveq	%rcx, %rax
1454ce1c3:     	movl	$0x18, %ecx
1454ce1c8:     	cmoveq	%rcx, %rdx
1454ce1cc:     	movb	$0x0, 0x29f(%rbp)
1454ce1d3:     	movq	%rdx, 0x28(%rsp)
1454ce1d8:     	movq	%rax, 0x20(%rsp)
1454ce1dd:     	leaq	0x1f0(%rbp), %rcx
1454ce1e4:     	movq	%r13, %rdx
1454ce1e7:     	movq	%r12, %r8
1454ce1ea:     	movq	%rbx, %r9
1454ce1ed:     	callq	0x145441160 <.text+0x5440160>
1454ce1f2:     	nop
1454ce1f3:     	movq	0x2a0(%rbp), %rdi
1454ce1fa:     	movq	0x548(%rdi), %rsi
1454ce201:     	cmpq	0x538(%rdi), %rsi
1454ce208:     	jne	0x1454cdd6a <.text+0x54ccd6a>
1454ce20e:     	movq	0x290(%rbp), %rcx
1454ce215:     	callq	0x1457580b0 <.text+0x57570b0>
1454ce21a:     	nop
1454ce21b:     	jmp	0x1454cdd6a <.text+0x54ccd6a>

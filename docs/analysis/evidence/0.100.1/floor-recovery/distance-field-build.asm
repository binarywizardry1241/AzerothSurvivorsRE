
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552aaf0:     	pushq	%rbp
14552aaf1:     	pushq	%r15
14552aaf3:     	pushq	%r14
14552aaf5:     	pushq	%r13
14552aaf7:     	pushq	%r12
14552aaf9:     	pushq	%rsi
14552aafa:     	pushq	%rdi
14552aafb:     	pushq	%rbx
14552aafc:     	subq	$0x118, %rsp            # imm = 0x118
14552ab03:     	leaq	0x80(%rsp), %rbp
14552ab0b:     	movq	$-0x2, 0x90(%rbp)
14552ab16:     	subss	0x20(%rdx), %xmm2
14552ab1b:     	xorps	%xmm0, %xmm0
14552ab1e:     	ucomiss	%xmm2, %xmm0
14552ab21:     	ja	0x14552abfd <.text+0x5529bfd>
14552ab27:     	movq	%rdx, %r14
14552ab2a:     	subss	0x24(%rdx), %xmm3
14552ab2f:     	ucomiss	%xmm3, %xmm0
14552ab32:     	ja	0x14552abfd <.text+0x5529bfd>
14552ab38:     	movss	0x3dc6a0(%rip), %xmm0   # 0x1459071e0
14552ab40:     	movaps	%xmm2, %xmm1
14552ab43:     	subss	%xmm0, %xmm1
14552ab47:     	cvttss2si	%xmm1, %rax
14552ab4c:     	movq	%rcx, 0x58(%rbp)
14552ab50:     	cvttss2si	%xmm2, %rcx
14552ab55:     	movq	%rcx, %rsi
14552ab58:     	sarq	$0x3f, %rsi
14552ab5c:     	andq	%rax, %rsi
14552ab5f:     	orq	%rcx, %rsi
14552ab62:     	xorl	%eax, %eax
14552ab64:     	xorps	%xmm1, %xmm1
14552ab67:     	ucomiss	%xmm1, %xmm2
14552ab6a:     	cmovbq	%rax, %rsi
14552ab6e:     	movss	0x3dc66e(%rip), %xmm4   # 0x1459071e4
14552ab76:     	ucomiss	%xmm4, %xmm2
14552ab79:     	movq	$-0x1, %rcx
14552ab80:     	cmovaq	%rcx, %rsi
14552ab84:     	movaps	%xmm3, %xmm2
14552ab87:     	subss	%xmm0, %xmm2
14552ab8b:     	cvttss2si	%xmm2, %rdx
14552ab90:     	cvttss2si	%xmm3, %r8
14552ab95:     	movq	%r8, %r9
14552ab98:     	sarq	$0x3f, %r9
14552ab9c:     	andq	%rdx, %r9
14552ab9f:     	orq	%r8, %r9
14552aba2:     	ucomiss	%xmm1, %xmm3
14552aba5:     	cmovbq	%rax, %r9
14552aba9:     	ucomiss	%xmm4, %xmm3
14552abac:     	cmovaq	%rcx, %r9
14552abb0:     	movq	0x18(%r14), %rbx
14552abb4:     	cmpq	%rbx, %rsi
14552abb7:     	setae	%al
14552abba:     	cmpq	%rbx, %r9
14552abbd:     	setae	%cl
14552abc0:     	orb	%al, %cl
14552abc2:     	movq	0x58(%rbp), %rcx
14552abc6:     	jne	0x14552abfd <.text+0x5529bfd>
14552abc8:     	movq	%rbx, %rdx
14552abcb:     	imulq	%rbx, %rdx
14552abcf:     	leaq	(%rdx,%rdx), %r15
14552abd3:     	testq	%rdx, %rdx
14552abd6:     	sets	%al
14552abd9:     	movabsq	$0x7ffffffffffffffe, %rcx # imm = 0x7FFFFFFFFFFFFFFE
14552abe3:     	cmpq	%rcx, %r15
14552abe6:     	seta	%cl
14552abe9:     	orb	%al, %cl
14552abeb:     	je	0x14552ac1b <.text+0x5529c1b>
14552abed:     	xorl	%r12d, %r12d
14552abf0:     	movq	%r12, %rcx
14552abf3:     	movq	%r15, %rdx
14552abf6:     	callq	0x14590379b <.text+0x590279b>
14552abfb:     	ud2
14552abfd:     	movq	$-0x1, (%rcx)
14552ac04:     	movq	%rcx, %rax
14552ac07:     	addq	$0x118, %rsp            # imm = 0x118
14552ac0e:     	popq	%rbx
14552ac0f:     	popq	%rdi
14552ac10:     	popq	%rsi
14552ac11:     	popq	%r12
14552ac13:     	popq	%r13
14552ac15:     	popq	%r14
14552ac17:     	popq	%r15
14552ac19:     	popq	%rbp
14552ac1a:     	retq
14552ac1b:     	movq	%r9, %rdi
14552ac1e:     	movq	%rdx, 0x80(%rbp)
14552ac25:     	testq	%r15, %r15
14552ac28:     	je	0x14552ac5d <.text+0x5529c5d>
14552ac2a:     	callq	0x140002200 <.text+0x1200>
14552ac2f:     	movl	$0x2, %r12d
14552ac35:     	movl	$0x2, %edx
14552ac3a:     	movq	%r15, %rcx
14552ac3d:     	callq	0x1400021c0 <.text+0x11c0>
14552ac42:     	movq	%rax, 0x88(%rbp)
14552ac49:     	testq	%rax, %rax
14552ac4c:     	je	0x14552abf0 <.text+0x5529bf0>
14552ac4e:     	movq	0x80(%rbp), %r12
14552ac55:     	movq	%r12, %rax
14552ac58:     	movq	%rdi, %rcx
14552ac5b:     	jmp	0x14552ac75 <.text+0x5529c75>
14552ac5d:     	movl	$0x2, %eax
14552ac62:     	movq	%rax, 0x88(%rbp)
14552ac69:     	xorl	%eax, %eax
14552ac6b:     	movq	%rdi, %rcx
14552ac6e:     	movq	0x80(%rbp), %r12
14552ac75:     	imulq	%rbx, %rcx
14552ac79:     	addq	%rsi, %rcx
14552ac7c:     	cmpq	$0x2, %r12
14552ac80:     	movq	%rax, 0x48(%rbp)
14552ac84:     	jb	0x14552acab <.text+0x5529cab>
14552ac86:     	leaq	-0x2(%r15), %r8
14552ac8a:     	movq	0x88(%rbp), %rsi
14552ac91:     	movq	%rcx, %rdi
14552ac94:     	movq	%rsi, %rcx
14552ac97:     	movb	$-0x1, %dl
14552ac99:     	callq	0x1457731db <.text+0x57721db>
14552ac9e:     	movq	%rdi, %rcx
14552aca1:     	leaq	(%rsi,%r15), %rax
14552aca5:     	addq	$-0x2, %rax
14552aca9:     	jmp	0x14552acbb <.text+0x5529cbb>
14552acab:     	movq	0x88(%rbp), %rax
14552acb2:     	testq	%r12, %r12
14552acb5:     	je	0x14552b03c <.text+0x552a03c>
14552acbb:     	movw	$0xffff, (%rax)         # imm = 0xFFFF
14552acc0:     	movq	$0x0, 0x60(%rbp)
14552acc8:     	xorps	%xmm0, %xmm0
14552accb:     	movups	%xmm0, 0x70(%rbp)
14552accf:     	movq	$0x8, 0x68(%rbp)
14552acd7:     	cmpq	%r12, %rcx
14552acda:     	jae	0x14552b053 <.text+0x552a053>
14552ace0:     	movq	0x88(%rbp), %rax
14552ace7:     	movq	%rcx, 0x40(%rbp)
14552aceb:     	movw	$0x0, (%rax,%rcx,2)
14552acf1:     	movq	0x60(%rbp), %rcx
14552acf5:     	movq	0x78(%rbp), %rax
14552acf9:     	cmpq	%rcx, %rax
14552acfc:     	jne	0x14552ad10 <.text+0x5529d10>
14552acfe:     	leaq	0x60(%rbp), %rcx
14552ad02:     	callq	0x14047b780 <.text+0x47a780>
14552ad07:     	nop
14552ad08:     	movq	0x60(%rbp), %rcx
14552ad0c:     	movq	0x78(%rbp), %rax
14552ad10:     	leaq	0x1(%rax), %rdx
14552ad14:     	movq	%rdx, 0x78(%rbp)
14552ad18:     	addq	0x70(%rbp), %rax
14552ad1c:     	xorl	%edx, %edx
14552ad1e:     	cmpq	%rcx, %rax
14552ad21:     	cmovaeq	%rcx, %rdx
14552ad25:     	subq	%rdx, %rax
14552ad28:     	movq	0x68(%rbp), %rcx
14552ad2c:     	movq	0x40(%rbp), %rdx
14552ad30:     	movq	%rdx, (%rcx,%rax,8)
14552ad34:     	movq	0x8(%r14), %rdi
14552ad38:     	movq	0x10(%r14), %r14
14552ad3c:     	movl	$0x1, %eax
14552ad41:     	movq	%rax, 0x38(%rbp)
14552ad45:     	nopw	%cs:(%rax,%rax)
14552ad50:     	movq	0x78(%rbp), %rax
14552ad54:     	testq	%rax, %rax
14552ad57:     	je	0x14552af74 <.text+0x5529f74>
14552ad5d:     	movq	0x70(%rbp), %rcx
14552ad61:     	leaq	0x1(%rcx), %rdx
14552ad65:     	movq	0x60(%rbp), %r8
14552ad69:     	movq	0x68(%rbp), %r9
14552ad6d:     	cmpq	%r8, %rdx
14552ad70:     	movl	$0x0, %edx
14552ad75:     	cmovaeq	%r8, %rdx
14552ad79:     	negq	%rdx
14552ad7c:     	addq	%rcx, %rdx
14552ad7f:     	incq	%rdx
14552ad82:     	movq	%rdx, 0x70(%rbp)
14552ad86:     	decq	%rax
14552ad89:     	movq	%rax, 0x78(%rbp)
14552ad8d:     	movq	(%r9,%rcx,8), %rcx
14552ad91:     	movq	%rcx, %rax
14552ad94:     	orq	%rbx, %rax
14552ad97:     	shrq	$0x20, %rax
14552ad9b:     	je	0x14552adc0 <.text+0x5529dc0>
14552ad9d:     	movq	%rcx, %rax
14552ada0:     	xorl	%edx, %edx
14552ada2:     	divq	%rbx
14552ada5:     	movq	%rdx, %r12
14552ada8:     	movq	%rax, %r13
14552adab:     	cmpq	0x80(%rbp), %rcx
14552adb2:     	jb	0x14552add9 <.text+0x5529dd9>
14552adb4:     	jmp	0x14552b026 <.text+0x552a026>
14552adb9:     	nopl	(%rax)
14552adc0:     	movl	%ecx, %eax
14552adc2:     	xorl	%edx, %edx
14552adc4:     	divl	%ebx
14552adc6:     	movl	%edx, %r12d
14552adc9:     	movl	%eax, %r13d
14552adcc:     	cmpq	0x80(%rbp), %rcx
14552add3:     	jae	0x14552b026 <.text+0x552a026>
14552add9:     	movq	0x88(%rbp), %rax
14552ade0:     	movzwl	(%rax,%rcx,2), %eax
14552ade4:     	incl	%eax
14552ade6:     	movl	%eax, 0x54(%rbp)
14552ade9:     	movups	0x180a058(%rip), %xmm0  # 0x146d34e48
14552adf0:     	leaq	-0x50(%rbp), %rax
14552adf4:     	movups	%xmm0, 0x70(%rax)
14552adf8:     	movups	0x180a039(%rip), %xmm0  # 0x146d34e38
14552adff:     	movups	%xmm0, 0x60(%rax)
14552ae03:     	movups	0x180a01e(%rip), %xmm0  # 0x146d34e28
14552ae0a:     	movups	%xmm0, 0x50(%rax)
14552ae0e:     	movups	0x180a003(%rip), %xmm0  # 0x146d34e18
14552ae15:     	movups	%xmm0, 0x40(%rax)
14552ae19:     	movups	0x1809fe8(%rip), %xmm0  # 0x146d34e08
14552ae20:     	movups	%xmm0, 0x30(%rax)
14552ae24:     	movups	0x1809fcd(%rip), %xmm0  # 0x146d34df8
14552ae2b:     	movups	%xmm0, 0x20(%rax)
14552ae2f:     	movups	0x1809fb2(%rip), %xmm0  # 0x146d34de8
14552ae36:     	movups	%xmm0, 0x10(%rax)
14552ae3a:     	movups	0x1809f97(%rip), %xmm0  # 0x146d34dd8
14552ae41:     	movups	%xmm0, (%rax)
14552ae44:     	movq	%r13, %rax
14552ae47:     	imulq	%rbx, %rax
14552ae4b:     	movq	%rax, 0x30(%rbp)
14552ae4f:     	xorl	%esi, %esi
14552ae51:     	cmpq	$0x8, %rsi
14552ae55:     	je	0x14552ad50 <.text+0x5529d50>
14552ae5b:     	movq	%rsi, %rdx
14552ae5e:     	shlq	$0x4, %rdx
14552ae62:     	leaq	-0x48(%rbp), %rax
14552ae66:     	addq	%rax, %rdx
14552ae69:     	jmp	0x14552ae81 <.text+0x5529e81>
14552ae6b:     	nopl	(%rax,%rax)
14552ae70:     	incq	%rsi
14552ae73:     	addq	$0x10, %rdx
14552ae77:     	cmpq	$0x8, %rsi
14552ae7b:     	je	0x14552ad50 <.text+0x5529d50>
14552ae81:     	movq	(%rdx), %r8
14552ae84:     	leaq	(%r8,%r13), %rcx
14552ae88:     	cmpq	%rbx, %rcx
14552ae8b:     	jge	0x14552ae70 <.text+0x5529e70>
14552ae8d:     	movq	-0x8(%rdx), %r9
14552ae91:     	leaq	(%r9,%r12), %rax
14552ae95:     	cmpq	%rbx, %rax
14552ae98:     	jge	0x14552ae70 <.text+0x5529e70>
14552ae9a:     	movq	%rcx, %r10
14552ae9d:     	orq	%rax, %r10
14552aea0:     	js	0x14552ae70 <.text+0x5529e70>
14552aea2:     	imulq	%rbx, %rcx
14552aea6:     	leaq	(%rcx,%rax), %r15
14552aeaa:     	cmpq	%r14, %r15
14552aead:     	jae	0x14552afce <.text+0x5529fce>
14552aeb3:     	cmpb	$0x0, (%rdi,%r15)
14552aeb8:     	jne	0x14552ae70 <.text+0x5529e70>
14552aeba:     	cmpq	0x80(%rbp), %r15
14552aec1:     	jae	0x14552afe6 <.text+0x5529fe6>
14552aec7:     	movq	0x88(%rbp), %r10
14552aece:     	cmpw	$-0x1, (%r10,%r15,2)
14552aed4:     	jne	0x14552ae70 <.text+0x5529e70>
14552aed6:     	testq	%r9, %r9
14552aed9:     	je	0x14552af0d <.text+0x5529f0d>
14552aedb:     	testq	%r8, %r8
14552aede:     	je	0x14552af0d <.text+0x5529f0d>
14552aee0:     	addq	0x30(%rbp), %rax
14552aee4:     	cmpq	%r14, %rax
14552aee7:     	jae	0x14552afff <.text+0x5529fff>
14552aeed:     	cmpb	$0x0, (%rdi,%rax)
14552aef1:     	jne	0x14552ae70 <.text+0x5529e70>
14552aef7:     	addq	%r12, %rcx
14552aefa:     	cmpq	%r14, %rcx
14552aefd:     	jae	0x14552b014 <.text+0x552a014>
14552af03:     	cmpb	$0x0, (%rdi,%rcx)
14552af07:     	jne	0x14552ae70 <.text+0x5529e70>
14552af0d:     	movq	0x88(%rbp), %rax
14552af14:     	movl	0x54(%rbp), %ecx
14552af17:     	movw	%cx, (%rax,%r15,2)
14552af1c:     	movq	0x60(%rbp), %rcx
14552af20:     	movq	0x78(%rbp), %rax
14552af24:     	cmpq	%rcx, %rax
14552af27:     	jne	0x14552af3b <.text+0x5529f3b>
14552af29:     	leaq	0x60(%rbp), %rcx
14552af2d:     	callq	0x14047b780 <.text+0x47a780>
14552af32:     	nop
14552af33:     	movq	0x60(%rbp), %rcx
14552af37:     	movq	0x78(%rbp), %rax
14552af3b:     	incq	%rsi
14552af3e:     	leaq	0x1(%rax), %rdx
14552af42:     	movq	%rdx, 0x78(%rbp)
14552af46:     	addq	0x70(%rbp), %rax
14552af4a:     	cmpq	%rcx, %rax
14552af4d:     	movl	$0x0, %edx
14552af52:     	cmovaeq	%rcx, %rdx
14552af56:     	subq	%rdx, %rax
14552af59:     	movq	0x68(%rbp), %rcx
14552af5d:     	movq	%r15, (%rcx,%rax,8)
14552af61:     	incq	0x38(%rbp)
14552af65:     	cmpq	$0x8, %rsi
14552af69:     	jne	0x14552ae5b <.text+0x5529e5b>
14552af6f:     	jmp	0x14552ad50 <.text+0x5529d50>
14552af74:     	movq	0x58(%rbp), %rcx
14552af78:     	movq	0x48(%rbp), %rax
14552af7c:     	movq	%rax, (%rcx)
14552af7f:     	movq	0x88(%rbp), %rax
14552af86:     	movq	%rax, 0x8(%rcx)
14552af8a:     	movq	0x80(%rbp), %rax
14552af91:     	movq	%rax, 0x10(%rcx)
14552af95:     	movq	0x40(%rbp), %rax
14552af99:     	movq	%rax, 0x18(%rcx)
14552af9d:     	movq	0x38(%rbp), %rax
14552afa1:     	movq	%rax, 0x20(%rcx)
14552afa5:     	movq	0x60(%rbp), %rdx
14552afa9:     	testq	%rdx, %rdx
14552afac:     	je	0x14552ac04 <.text+0x5529c04>
14552afb2:     	movq	0x68(%rbp), %rcx
14552afb6:     	shlq	$0x3, %rdx
14552afba:     	movl	$0x8, %r8d
14552afc0:     	callq	0x1400021d0 <.text+0x11d0>
14552afc5:     	movq	0x58(%rbp), %rcx
14552afc9:     	jmp	0x14552ac04 <.text+0x5529c04>
14552afce:     	leaq	0x1809efb(%rip), %r8    # 0x146d34ed0
14552afd5:     	movq	%r15, %rcx
14552afd8:     	movq	%r14, %rdx
14552afdb:     	callq	0x145903b33 <.text+0x5902b33>
14552afe0:     	nop
14552afe1:     	jmp	0x14552b067 <.text+0x552a067>
14552afe6:     	leaq	0x1809efb(%rip), %r8    # 0x146d34ee8
14552afed:     	movq	%r15, %rcx
14552aff0:     	movq	0x80(%rbp), %rdx
14552aff7:     	callq	0x145903b33 <.text+0x5902b33>
14552affc:     	nop
14552affd:     	jmp	0x14552b067 <.text+0x552a067>
14552afff:     	leaq	0x1809efa(%rip), %r8    # 0x146d34f00
14552b006:     	movq	%rax, %rcx
14552b009:     	movq	%r14, %rdx
14552b00c:     	callq	0x145903b33 <.text+0x5902b33>
14552b011:     	nop
14552b012:     	jmp	0x14552b067 <.text+0x552a067>
14552b014:     	leaq	0x1809efd(%rip), %r8    # 0x146d34f18
14552b01b:     	movq	%r14, %rdx
14552b01e:     	callq	0x145903b33 <.text+0x5902b33>
14552b023:     	nop
14552b024:     	jmp	0x14552b067 <.text+0x552a067>
14552b026:     	leaq	0x1809e8b(%rip), %r8    # 0x146d34eb8
14552b02d:     	movq	0x80(%rbp), %rdx
14552b034:     	callq	0x145903b33 <.text+0x5902b33>
14552b039:     	nop
14552b03a:     	jmp	0x14552b067 <.text+0x552a067>
14552b03c:     	movq	$0x0, 0x60(%rbp)
14552b044:     	xorps	%xmm0, %xmm0
14552b047:     	movups	%xmm0, 0x70(%rbp)
14552b04b:     	movq	$0x8, 0x68(%rbp)
14552b053:     	leaq	0x1809e46(%rip), %r8    # 0x146d34ea0
14552b05a:     	movq	0x80(%rbp), %rdx
14552b061:     	callq	0x145903b33 <.text+0x5902b33>
14552b066:     	nop
14552b067:     	ud2

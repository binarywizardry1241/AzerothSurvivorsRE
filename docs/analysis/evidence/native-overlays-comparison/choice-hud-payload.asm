
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454dc9c0:     	pushq	%rbp
1454dc9c1:     	pushq	%r15
1454dc9c3:     	pushq	%r14
1454dc9c5:     	pushq	%r13
1454dc9c7:     	pushq	%r12
1454dc9c9:     	pushq	%rsi
1454dc9ca:     	pushq	%rdi
1454dc9cb:     	pushq	%rbx
1454dc9cc:     	subq	$0x1f8, %rsp            # imm = 0x1F8
1454dc9d3:     	leaq	0x80(%rsp), %rbp
1454dc9db:     	movq	$-0x2, 0x170(%rbp)
1454dc9e6:     	movq	%r9, 0x28(%rbp)
1454dc9ea:     	movq	%r8, 0x20(%rbp)
1454dc9ee:     	movq	%rdx, %r12
1454dc9f1:     	movq	%rcx, 0x30(%rbp)
1454dc9f5:     	callq	0x140002200 <.text+0x1200>
1454dc9fa:     	movl	$0x1, %ecx
1454dc9ff:     	movl	$0x1, %edx
1454dca04:     	callq	0x1400021c0 <.text+0x11c0>
1454dca09:     	testq	%rax, %rax
1454dca0c:     	je	0x1454ddbb5 <.text+0x54dcbb5>
1454dca12:     	movq	%rax, 0xc0(%rbp)
1454dca19:     	movb	$0x5b, (%rax)
1454dca1c:     	movq	0x570(%r12), %r13
1454dca24:     	movq	0x578(%r12), %rax
1454dca2c:     	leaq	(%rax,%rax,4), %rax
1454dca30:     	shlq	$0x5, %rax
1454dca34:     	addq	%r13, %rax
1454dca37:     	movq	%rax, -0x40(%rbp)
1454dca3b:     	leaq	0x308(%r12), %rax
1454dca43:     	movq	%rax, -0x18(%rbp)
1454dca47:     	movq	0x308(%r12), %rax
1454dca4f:     	movq	%rax, -0x38(%rbp)
1454dca53:     	movq	0x318(%r12), %rax
1454dca5b:     	movq	%rax, 0x58(%rbp)
1454dca5f:     	movq	0x310(%r12), %rax
1454dca67:     	movq	%rax, 0x10(%rbp)
1454dca6b:     	movq	0x328(%r12), %rax
1454dca73:     	movq	%rax, -0x28(%rbp)
1454dca77:     	movq	0x330(%r12), %rax
1454dca7f:     	movq	%rax, -0x20(%rbp)
1454dca83:     	movq	0x350(%r12), %rax
1454dca8b:     	movq	%rax, -0x10(%rbp)
1454dca8f:     	movq	0x358(%r12), %rax
1454dca97:     	movq	%rax, -0x8(%rbp)
1454dca9b:     	movq	0x2b8(%r12), %rcx
1454dcaa3:     	leaq	(,%rcx,8), %rax
1454dcaab:     	leaq	(%rax,%rax,2), %rax
1454dcaaf:     	movq	%rax, -0x48(%rbp)
1454dcab3:     	movq	%rcx, 0x70(%rbp)
1454dcab7:     	andq	$-0x2, %rcx
1454dcabb:     	movq	%rcx, 0x18(%rbp)
1454dcabf:     	movb	$0x1, %bl
1454dcac1:     	movl	0x360(%r12), %eax
1454dcac9:     	movl	%eax, 0x68(%rbp)
1454dcacc:     	movl	0x370(%r12), %eax
1454dcad4:     	movq	%rax, (%rbp)
1454dcad8:     	incl	%eax
1454dcada:     	movl	%eax, 0x6c(%rbp)
1454dcadd:     	movq	0x2b0(%r12), %rax
1454dcae5:     	movq	%rax, 0xa8(%rbp)
1454dcaec:     	movq	0x298(%r12), %rax
1454dcaf4:     	movq	%rax, 0x8(%rbp)
1454dcaf8:     	movq	0x2a0(%r12), %rax
1454dcb00:     	movq	%rax, -0x30(%rbp)
1454dcb04:     	movl	0x948(%r12), %eax
1454dcb0c:     	movl	%eax, 0xbc(%rbp)
1454dcb12:     	leaq	0x159(%rbp), %r15
1454dcb19:     	movabsq	$-0x8000000000000000, %rdi # imm = 0x8000000000000000
1454dcb23:     	movl	$0x1, %r14d
1454dcb29:     	movl	$0x1, %eax
1454dcb2e:     	movq	%rax, 0xd8(%rbp)
1454dcb35:     	movq	%r12, 0xb0(%rbp)
1454dcb3c:     	jmp	0x1454dcb47 <.text+0x54dbb47>
1454dcb3e:     	nop
1454dcb40:     	addq	$0xa0, %r13
1454dcb47:     	cmpq	-0x40(%rbp), %r13
1454dcb4b:     	je	0x1454dd6de <.text+0x54dc6de>
1454dcb51:     	movq	%r14, %rsi
1454dcb54:     	callq	0x140002200 <.text+0x1200>
1454dcb59:     	movl	$0x1, %ecx
1454dcb5e:     	movl	$0x1, %edx
1454dcb63:     	callq	0x1400021c0 <.text+0x11c0>
1454dcb68:     	testq	%rax, %rax
1454dcb6b:     	je	0x1454ddb9c <.text+0x54dcb9c>
1454dcb71:     	movq	%rax, 0x130(%rbp)
1454dcb78:     	movb	$0x7b, (%rax)
1454dcb7b:     	movq	0x78(%r13), %rcx
1454dcb7f:     	movq	%rcx, %rax
1454dcb82:     	xorq	%rdi, %rax
1454dcb85:     	testq	%rcx, %rcx
1454dcb88:     	movl	$0x1, %edi
1454dcb8d:     	cmovnsq	%rdi, %rax
1454dcb91:     	movb	$0x1, %r14b
1454dcb94:     	cmpq	$0x1, %rax
1454dcb98:     	je	0x1454dcf10 <.text+0x54dbf10>
1454dcb9e:     	cmpq	$0x2, %rax
1454dcba2:     	je	0x1454dce10 <.text+0x54dbe10>
1454dcba8:     	cmpq	$0x3, %rax
1454dcbac:     	jne	0x1454dcfb0 <.text+0x54dbfb0>
1454dcbb2:     	cmpq	$-0x1, -0x38(%rbp)
1454dcbb7:     	je	0x1454dcfb0 <.text+0x54dbfb0>
1454dcbbd:     	movq	0x80(%r13), %rax
1454dcbc4:     	movq	0x58(%rbp), %rcx
1454dcbc8:     	cmpq	0x10(%rax), %rcx
1454dcbcc:     	jne	0x1454dcbe7 <.text+0x54dbbe7>
1454dcbce:     	movq	0x8(%rax), %rdx
1454dcbd2:     	movq	0x10(%rbp), %rcx
1454dcbd6:     	movq	0x58(%rbp), %r8
1454dcbda:     	callq	0x145756dd7 <.text+0x5755dd7>
1454dcbdf:     	testl	%eax, %eax
1454dcbe1:     	je	0x1454dd616 <.text+0x54dc616>
1454dcbe7:     	movq	$0x1, 0x140(%rbp)
1454dcbf2:     	movq	0x130(%rbp), %rax
1454dcbf9:     	movq	%rax, 0x148(%rbp)
1454dcc00:     	movq	$0x1, 0x150(%rbp)
1454dcc0b:     	movb	$0x1, 0x158(%rbp)
1454dcc12:     	movq	%rax, 0xf8(%rbp)
1454dcc19:     	movq	$0x1, 0xf0(%rbp)
1454dcc24:     	movb	$0x0, 0x16e(%rbp)
1454dcc2b:     	movb	$0x1, 0x16d(%rbp)
1454dcc32:     	movq	-0x20(%rbp), %rax
1454dcc36:     	movq	%rax, 0x28(%rsp)
1454dcc3b:     	movq	-0x28(%rbp), %rax
1454dcc3f:     	movq	%rax, 0x20(%rsp)
1454dcc44:     	movl	$0x8, %r9d
1454dcc4a:     	leaq	0x100(%rbp), %rcx
1454dcc51:     	leaq	0x140(%rbp), %rdx
1454dcc58:     	leaq	0x14cf7df(%rip), %r8    # 0x1469ac43e
1454dcc5f:     	callq	0x145451620 <.text+0x5450620>
1454dcc64:     	nop
1454dcc65:     	movb	%bl, 0xe8(%rbp)
1454dcc6b:     	leaq	0x38(%rbp), %rcx
1454dcc6f:     	movq	-0x18(%rbp), %rdx
1454dcc73:     	callq	0x145414120 <.text+0x5413120>
1454dcc78:     	nop
1454dcc79:     	movq	0x40(%rbp), %rdx
1454dcc7d:     	movq	0x48(%rbp), %rbx
1454dcc81:     	movq	$0x1, 0x20(%rsp)
1454dcc8a:     	leaq	0x140(%rbp), %r14
1454dcc91:     	movq	%r14, %rcx
1454dcc94:     	movq	%rdx, 0xc8(%rbp)
1454dcc9b:     	movq	%rbx, %r8
1454dcc9e:     	leaq	0x14cf7a1(%rip), %r9    # 0x1469ac446
1454dcca5:     	callq	0x145455eb0 <.text+0x5454eb0>
1454dccaa:     	nop
1454dccab:     	leaq	0x100(%rbp), %rdi
1454dccb2:     	movq	0x140(%rbp), %rax
1454dccb9:     	movq	%rax, 0x78(%rbp)
1454dccbd:     	movq	0x148(%rbp), %rcx
1454dccc4:     	movq	0x150(%rbp), %rax
1454dcccb:     	movq	%rax, 0x28(%rsp)
1454dccd0:     	movq	%rcx, 0x60(%rbp)
1454dccd4:     	movq	%rcx, 0x20(%rsp)
1454dccd9:     	movl	$0xc, %r9d
1454dccdf:     	movq	%r14, %rcx
1454dcce2:     	movq	%rdi, %rdx
1454dcce5:     	leaq	0x14cf75b(%rip), %r8    # 0x1469ac447
1454dccec:     	callq	0x145451620 <.text+0x5450620>
1454dccf1:     	nop
1454dccf2:     	movq	-0x8(%rbp), %rax
1454dccf6:     	movq	%rax, 0x28(%rsp)
1454dccfb:     	movq	-0x10(%rbp), %rax
1454dccff:     	movq	%rax, 0x20(%rsp)
1454dcd04:     	movl	$0xc, %r9d
1454dcd0a:     	movq	%rdi, %rcx
1454dcd0d:     	movq	%r14, %rdx
1454dcd10:     	leaq	0x14cf73c(%rip), %r8    # 0x1469ac453
1454dcd17:     	callq	0x145451620 <.text+0x5450620>
1454dcd1c:     	nop
1454dcd1d:     	movl	0x68(%rbp), %eax
1454dcd20:     	movl	%eax, 0x20(%rsp)
1454dcd24:     	movl	$0xe, %r9d
1454dcd2a:     	movq	%r14, %rcx
1454dcd2d:     	movq	%rdi, %rdx
1454dcd30:     	leaq	0x14cf728(%rip), %r8    # 0x1469ac45f
1454dcd37:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dcd3c:     	nop
1454dcd3d:     	movq	(%rbp), %rax
1454dcd41:     	movl	%eax, 0x20(%rsp)
1454dcd45:     	movl	$0xc, %r9d
1454dcd4b:     	leaq	0x80(%rbp), %rcx
1454dcd52:     	movq	%r14, %rdx
1454dcd55:     	leaq	0x14cf711(%rip), %r8    # 0x1469ac46d
1454dcd5c:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dcd61:     	nop
1454dcd62:     	movq	0x80(%rbp), %rax
1454dcd69:     	movq	%rax, 0xe0(%rbp)
1454dcd70:     	movq	0x88(%rbp), %rax
1454dcd77:     	movq	%rax, 0x130(%rbp)
1454dcd7e:     	movq	0x90(%rbp), %rdi
1454dcd85:     	movzbl	0x98(%rbp), %r14d
1454dcd8d:     	leaq	0x99(%rbp), %rcx
1454dcd94:     	movl	(%rcx), %eax
1454dcd96:     	movl	0x3(%rcx), %ecx
1454dcd99:     	movl	%eax, 0x128(%rbp)
1454dcd9f:     	movl	%ecx, 0x12b(%rbp)
1454dcda5:     	movq	0x78(%rbp), %rdx
1454dcda9:     	testq	%rdx, %rdx
1454dcdac:     	je	0x1454dcdbd <.text+0x54dbdbd>
1454dcdae:     	movl	$0x1, %r8d
1454dcdb4:     	movq	0x60(%rbp), %rcx
1454dcdb8:     	callq	0x1400021d0 <.text+0x11d0>
1454dcdbd:     	testq	%rbx, %rbx
1454dcdc0:     	je	0x1454dcfc4 <.text+0x54dbfc4>
1454dcdc6:     	movq	0xc8(%rbp), %rax
1454dcdcd:     	leaq	0x8(%rax), %r12
1454dcdd1:     	jmp	0x1454dcded <.text+0x54dbded>
1454dcdd3:     	nopw	%cs:(%rax,%rax)
1454dcde0:     	addq	$0x18, %r12
1454dcde4:     	decq	%rbx
1454dcde7:     	je	0x1454dcfc4 <.text+0x54dbfc4>
1454dcded:     	movq	-0x8(%r12), %rdx
1454dcdf2:     	testq	%rdx, %rdx
1454dcdf5:     	je	0x1454dcde0 <.text+0x54dbde0>
1454dcdf7:     	movq	(%r12), %rcx
1454dcdfb:     	movl	$0x1, %r8d
1454dce01:     	callq	0x1400021d0 <.text+0x11d0>
1454dce06:     	jmp	0x1454dcde0 <.text+0x54dbde0>
1454dce08:     	nopl	(%rax,%rax)
1454dce10:     	cmpq	$0x0, 0x70(%rbp)
1454dce15:     	je	0x1454dd046 <.text+0x54dc046>
1454dce1b:     	movb	%bl, 0xe8(%rbp)
1454dce21:     	movq	0x80(%r13), %rdi
1454dce28:     	movq	(%rdi), %rbx
1454dce2b:     	movq	0x8(%rdi), %r12
1454dce2f:     	xorl	%r14d, %r14d
1454dce32:     	jmp	0x1454dce4e <.text+0x54dbe4e>
1454dce34:     	nopw	%cs:(%rax,%rax)
1454dce40:     	addq	$0x18, %r14
1454dce44:     	cmpq	%r14, -0x48(%rbp)
1454dce48:     	je	0x1454dd01f <.text+0x54dc01f>
1454dce4e:     	movq	0xa8(%rbp), %rax
1454dce55:     	movq	(%rax,%r14), %rax
1454dce59:     	cmpq	%r12, 0x8(%rax)
1454dce5d:     	jne	0x1454dce40 <.text+0x54dbe40>
1454dce5f:     	movq	(%rax), %rcx
1454dce62:     	movq	%rbx, %rdx
1454dce65:     	movq	%r12, %r8
1454dce68:     	callq	0x145756dd7 <.text+0x5755dd7>
1454dce6d:     	testl	%eax, %eax
1454dce6f:     	jne	0x1454dce40 <.text+0x54dbe40>
1454dce71:     	movq	$0x1, 0x140(%rbp)
1454dce7c:     	movq	0x130(%rbp), %rcx
1454dce83:     	movq	%rcx, 0x148(%rbp)
1454dce8a:     	movq	$0x1, 0x150(%rbp)
1454dce95:     	movb	$0x1, 0x158(%rbp)
1454dce9c:     	movq	0xa8(%rbp), %rax
1454dcea3:     	movl	0x14(%rax,%r14), %eax
1454dcea8:     	incl	%eax
1454dceaa:     	movq	%rcx, 0xf8(%rbp)
1454dceb1:     	movq	$0x1, 0xf0(%rbp)
1454dcebc:     	movb	$0x0, 0x16e(%rbp)
1454dcec3:     	movb	$0x1, 0x16d(%rbp)
1454dceca:     	movl	%eax, 0x20(%rsp)
1454dcece:     	movl	$0x4, %r9d
1454dced4:     	leaq	0x100(%rbp), %rcx
1454dcedb:     	leaq	0x140(%rbp), %rdx
1454dcee2:     	leaq	0x14ce145(%rip), %r8    # 0x1469ab02e
1454dcee9:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dceee:     	nop
1454dceef:     	movq	0xb0(%rbp), %r12
1454dcef6:     	movb	0xe8(%rbp), %bl
1454dcefc:     	jmp	0x1454dd12b <.text+0x54dc12b>
1454dcf01:     	nopw	%cs:(%rax,%rax)
1454dcf10:     	movq	0x90(%r13), %rax
1454dcf17:     	cmpq	-0x30(%rbp), %rax
1454dcf1b:     	jae	0x1454dcfb0 <.text+0x54dbfb0>
1454dcf21:     	imulq	$0x58, %rax, %rax
1454dcf25:     	movq	$0x1, 0x140(%rbp)
1454dcf30:     	movq	0x130(%rbp), %rdx
1454dcf37:     	movq	%rdx, 0x148(%rbp)
1454dcf3e:     	movq	$0x1, 0x150(%rbp)
1454dcf49:     	movb	$0x1, 0x158(%rbp)
1454dcf50:     	movq	0x8(%rbp), %rcx
1454dcf54:     	movl	0x8(%rcx,%rax), %eax
1454dcf58:     	incl	%eax
1454dcf5a:     	movq	%rdx, 0xf8(%rbp)
1454dcf61:     	movq	$0x1, 0xf0(%rbp)
1454dcf6c:     	movb	$0x0, 0x16e(%rbp)
1454dcf73:     	movb	$0x1, 0x16d(%rbp)
1454dcf7a:     	movl	%eax, 0x20(%rsp)
1454dcf7e:     	movl	$0x4, %r9d
1454dcf84:     	leaq	0x100(%rbp), %rcx
1454dcf8b:     	leaq	0x140(%rbp), %rdx
1454dcf92:     	leaq	0x14ce095(%rip), %r8    # 0x1469ab02e
1454dcf99:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dcf9e:     	nop
1454dcf9f:     	jmp	0x1454dd12b <.text+0x54dc12b>
1454dcfa4:     	nopw	%cs:(%rax,%rax)
1454dcfb0:     	movl	$0x1, %edx
1454dcfb5:     	cmpl	$0x0, 0xbc(%rbp)
1454dcfbc:     	jne	0x1454dd174 <.text+0x54dc174>
1454dcfc2:     	jmp	0x1454dd010 <.text+0x54dc010>
1454dcfc4:     	movq	0x38(%rbp), %rax
1454dcfc8:     	testq	%rax, %rax
1454dcfcb:     	je	0x1454dcfe7 <.text+0x54dbfe7>
1454dcfcd:     	shlq	$0x3, %rax
1454dcfd1:     	leaq	(%rax,%rax,2), %rdx
1454dcfd5:     	movl	$0x8, %r8d
1454dcfdb:     	movq	0xc8(%rbp), %rcx
1454dcfe2:     	callq	0x1400021d0 <.text+0x11d0>
1454dcfe7:     	movq	0xb0(%rbp), %r12
1454dcfee:     	movzbl	0xe8(%rbp), %ebx
1454dcff5:     	movq	0xe0(%rbp), %rdx
1454dcffc:     	cmpl	$0x0, 0xbc(%rbp)
1454dd003:     	jne	0x1454dd174 <.text+0x54dc174>
1454dd009:     	nopl	(%rax)
1454dd010:     	movq	0x130(%rbp), %r8
1454dd017:     	movq	%rdx, %r9
1454dd01a:     	jmp	0x1454dd2ae <.text+0x54dc2ae>
1454dd01f:     	movzbl	0x45(%rdi), %r14d
1454dd024:     	cmpq	$0x1, 0x70(%rbp)
1454dd029:     	leaq	0x100(%rbp), %rcx
1454dd030:     	jne	0x1454dd051 <.text+0x54dc051>
1454dd032:     	xorl	%edx, %edx
1454dd034:     	xorl	%eax, %eax
1454dd036:     	movq	0xb0(%rbp), %r12
1454dd03d:     	movzbl	0xe8(%rbp), %ebx
1454dd044:     	jmp	0x1454dd0a4 <.text+0x54dc0a4>
1454dd046:     	xorl	%eax, %eax
1454dd048:     	leaq	0x100(%rbp), %rcx
1454dd04f:     	jmp	0x1454dd0c2 <.text+0x54dc0c2>
1454dd051:     	movq	0xa8(%rbp), %r8
1454dd058:     	xorl	%edx, %edx
1454dd05a:     	xorl	%eax, %eax
1454dd05c:     	movq	0xb0(%rbp), %r12
1454dd063:     	movzbl	0xe8(%rbp), %ebx
1454dd06a:     	movq	0x18(%rbp), %rdi
1454dd06e:     	nop
1454dd070:     	movq	(%r8), %r9
1454dd073:     	movq	0x18(%r8), %r10
1454dd077:     	xorl	%r11d, %r11d
1454dd07a:     	cmpb	%r14b, 0x45(%r9)
1454dd07e:     	sete	%r11b
1454dd082:     	addq	%rax, %r11
1454dd085:     	xorl	%eax, %eax
1454dd087:     	cmpb	%r14b, 0x45(%r10)
1454dd08b:     	sete	%al
1454dd08e:     	addq	%r11, %rax
1454dd091:     	addq	$0x2, %rdx
1454dd095:     	addq	$0x30, %r8
1454dd099:     	cmpq	%rdx, %rdi
1454dd09c:     	jne	0x1454dd070 <.text+0x54dc070>
1454dd09e:     	testb	$0x1, 0x70(%rbp)
1454dd0a2:     	je	0x1454dd0c2 <.text+0x54dc0c2>
1454dd0a4:     	movq	%rax, %r8
1454dd0a7:     	leaq	(%rdx,%rdx,2), %rax
1454dd0ab:     	movq	0xa8(%rbp), %rdx
1454dd0b2:     	movq	(%rdx,%rax,8), %rdx
1454dd0b6:     	xorl	%eax, %eax
1454dd0b8:     	cmpb	%r14b, 0x45(%rdx)
1454dd0bc:     	sete	%al
1454dd0bf:     	addq	%r8, %rax
1454dd0c2:     	movq	$0x1, 0x140(%rbp)
1454dd0cd:     	movq	0x130(%rbp), %rdx
1454dd0d4:     	movq	%rdx, 0x148(%rbp)
1454dd0db:     	movq	$0x1, 0x150(%rbp)
1454dd0e6:     	movb	$0x1, 0x158(%rbp)
1454dd0ed:     	movq	%rdx, 0xf8(%rbp)
1454dd0f4:     	movq	$0x1, 0xf0(%rbp)
1454dd0ff:     	movb	$0x0, 0x16e(%rbp)
1454dd106:     	movb	$0x1, 0x16d(%rbp)
1454dd10d:     	movl	%eax, 0x20(%rsp)
1454dd111:     	movl	$0x4, %r9d
1454dd117:     	leaq	0x140(%rbp), %rdx
1454dd11e:     	leaq	0x14cf315(%rip), %r8    # 0x1469ac43a
1454dd125:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dd12a:     	nop
1454dd12b:     	movq	0x100(%rbp), %rdx
1454dd132:     	movq	0x108(%rbp), %rax
1454dd139:     	movq	%rax, 0x130(%rbp)
1454dd140:     	movq	0x110(%rbp), %rdi
1454dd147:     	movzbl	0x118(%rbp), %r14d
1454dd14f:     	leaq	0x119(%rbp), %rcx
1454dd156:     	movl	(%rcx), %eax
1454dd158:     	movl	0x3(%rcx), %ecx
1454dd15b:     	movl	%eax, 0x128(%rbp)
1454dd161:     	movl	%ecx, 0x12b(%rbp)
1454dd167:     	cmpl	$0x0, 0xbc(%rbp)
1454dd16e:     	je	0x1454dd010 <.text+0x54dc010>
1454dd174:     	movq	0x130(%rbp), %rax
1454dd17b:     	movq	%rax, 0xf8(%rbp)
1454dd182:     	movq	%rdx, 0xe0(%rbp)
1454dd189:     	movq	%rdx, 0xf0(%rbp)
1454dd190:     	movb	$0x1, 0x16e(%rbp)
1454dd197:     	movb	$0x1, 0x16d(%rbp)
1454dd19e:     	leaq	0x140(%rbp), %rcx
1454dd1a5:     	movq	%r12, %rdx
1454dd1a8:     	movq	%r13, %r8
1454dd1ab:     	callq	0x1454da3d0 <.text+0x54d93d0>
1454dd1b0:     	nop
1454dd1b1:     	movq	0x140(%rbp), %rdx
1454dd1b8:     	cmpq	$-0x1, %rdx
1454dd1bc:     	je	0x1454dd2a0 <.text+0x54dc2a0>
1454dd1c2:     	testq	%rdx, %rdx
1454dd1c5:     	je	0x1454dd1d9 <.text+0x54dc1d9>
1454dd1c7:     	movq	0x148(%rbp), %rcx
1454dd1ce:     	movl	$0x1, %r8d
1454dd1d4:     	callq	0x1400021d0 <.text+0x11d0>
1454dd1d9:     	movq	0xe0(%rbp), %rax
1454dd1e0:     	movq	%rax, 0x140(%rbp)
1454dd1e7:     	movq	0x130(%rbp), %rax
1454dd1ee:     	movq	%rax, 0x148(%rbp)
1454dd1f5:     	movq	%rdi, 0x150(%rbp)
1454dd1fc:     	movb	%r14b, 0x158(%rbp)
1454dd203:     	movl	0x128(%rbp), %eax
1454dd209:     	movl	0x12b(%rbp), %ecx
1454dd20f:     	movl	%ecx, 0x3(%r15)
1454dd213:     	movl	%eax, (%r15)
1454dd216:     	movl	$0x6, %r8d
1454dd21c:     	leaq	0x140(%rbp), %rdi
1454dd223:     	movq	%rdi, %rcx
1454dd226:     	leaq	0x14cf24c(%rip), %rdx   # 0x1469ac479
1454dd22d:     	callq	0x145451370 <.text+0x5450370>
1454dd232:     	nop
1454dd233:     	movq	0x140(%rbp), %rax
1454dd23a:     	movq	0x150(%rbp), %rdx
1454dd241:     	subq	%rdx, %rax
1454dd244:     	cmpq	$0x3, %rax
1454dd248:     	jbe	0x1454dd6b4 <.text+0x54dc6b4>
1454dd24e:     	movq	0x148(%rbp), %rax
1454dd255:     	movl	$0x65757274, (%rax,%rdx) # imm = 0x65757274
1454dd25c:     	movq	0x150(%rbp), %rdi
1454dd263:     	addq	$0x4, %rdi
1454dd267:     	movq	%rdi, 0x150(%rbp)
1454dd26e:     	movq	0x140(%rbp), %r9
1454dd275:     	movq	0x148(%rbp), %r8
1454dd27c:     	movzbl	0x158(%rbp), %r14d
1454dd284:     	movl	(%r15), %eax
1454dd287:     	movl	0x3(%r15), %ecx
1454dd28b:     	movl	%eax, 0x128(%rbp)
1454dd291:     	movl	%ecx, 0x12b(%rbp)
1454dd297:     	jmp	0x1454dd2ae <.text+0x54dc2ae>
1454dd299:     	nopl	(%rax)
1454dd2a0:     	movq	0x130(%rbp), %r8
1454dd2a7:     	movq	0xe0(%rbp), %r9
1454dd2ae:     	movq	0xd8(%rbp), %rax
1454dd2b5:     	movq	%rax, 0x80(%rbp)
1454dd2bc:     	movq	0xc0(%rbp), %rax
1454dd2c3:     	movq	%rax, 0x88(%rbp)
1454dd2ca:     	movq	%rsi, 0x90(%rbp)
1454dd2d1:     	movb	%bl, 0x98(%rbp)
1454dd2d7:     	movl	0xd0(%rbp), %eax
1454dd2dd:     	movl	0xd3(%rbp), %ecx
1454dd2e3:     	leaq	0x99(%rbp), %rdx
1454dd2ea:     	movl	%ecx, 0x3(%rdx)
1454dd2ed:     	movl	%eax, (%rdx)
1454dd2ef:     	movq	%r9, 0xe0(%rbp)
1454dd2f6:     	movq	%r9, 0x140(%rbp)
1454dd2fd:     	movq	%r8, 0x130(%rbp)
1454dd304:     	movq	%r8, 0x148(%rbp)
1454dd30b:     	movq	%rdi, 0x150(%rbp)
1454dd312:     	movb	%r14b, 0x158(%rbp)
1454dd319:     	movl	0x128(%rbp), %eax
1454dd31f:     	movl	0x12b(%rbp), %ecx
1454dd325:     	movl	%ecx, 0x3(%r15)
1454dd329:     	movl	%eax, (%r15)
1454dd32c:     	movups	0x8(%r13), %xmm0
1454dd331:     	movups	%xmm0, 0x20(%rsp)
1454dd336:     	movl	$0x5, %r9d
1454dd33c:     	leaq	0x100(%rbp), %rsi
1454dd343:     	movq	%rsi, %rcx
1454dd346:     	leaq	0x140(%rbp), %r14
1454dd34d:     	movq	%r14, %rdx
1454dd350:     	leaq	0x14cf128(%rip), %r8    # 0x1469ac47f
1454dd357:     	callq	0x145451620 <.text+0x5450620>
1454dd35c:     	nop
1454dd35d:     	movups	0x50(%r13), %xmm0
1454dd362:     	movups	%xmm0, 0x20(%rsp)
1454dd367:     	movl	$0x4, %r9d
1454dd36d:     	movq	%r14, %rcx
1454dd370:     	movq	%rsi, %rdx
1454dd373:     	leaq	0x14cdcac(%rip), %r8    # 0x1469ab026
1454dd37a:     	callq	0x145451620 <.text+0x5450620>
1454dd37f:     	nop
1454dd380:     	movq	0x68(%r13), %rdx
1454dd384:     	movq	0x70(%r13), %r8
1454dd388:     	movq	$0x1, 0x20(%rsp)
1454dd391:     	movq	%rsi, %rcx
1454dd394:     	leaq	0x14cf0ab(%rip), %r9    # 0x1469ac446
1454dd39b:     	callq	0x145455eb0 <.text+0x5454eb0>
1454dd3a0:     	nop
1454dd3a1:     	movabsq	$-0x8000000000000000, %rdi # imm = 0x8000000000000000
1454dd3ab:     	movq	0x100(%rbp), %rax
1454dd3b2:     	movq	%rax, 0xe8(%rbp)
1454dd3b9:     	movq	0x108(%rbp), %rcx
1454dd3c0:     	movq	0x110(%rbp), %rax
1454dd3c7:     	movb	$0x1, 0x16c(%rbp)
1454dd3ce:     	movq	%rax, 0x28(%rsp)
1454dd3d3:     	movq	%rcx, 0xc8(%rbp)
1454dd3da:     	movq	%rcx, 0x20(%rsp)
1454dd3df:     	movl	$0x5, %r9d
1454dd3e5:     	movq	%rsi, %rcx
1454dd3e8:     	movq	%r14, %rdx
1454dd3eb:     	leaq	0x14cdc08(%rip), %r8    # 0x1469aaffa
1454dd3f2:     	callq	0x145451620 <.text+0x5450620>
1454dd3f7:     	nop
1454dd3f8:     	movups	0x20(%r13), %xmm0
1454dd3fd:     	movb	$0x1, 0x16c(%rbp)
1454dd404:     	movups	%xmm0, 0x20(%rsp)
1454dd409:     	movl	$0x4, %r9d
1454dd40f:     	movq	%r14, %rcx
1454dd412:     	movq	%rsi, %rdx
1454dd415:     	leaq	0x14cdc2d(%rip), %r8    # 0x1469ab049
1454dd41c:     	callq	0x145451620 <.text+0x5450620>
1454dd421:     	nop
1454dd422:     	movups	0x38(%r13), %xmm0
1454dd427:     	movb	$0x1, 0x16c(%rbp)
1454dd42e:     	movups	%xmm0, 0x20(%rsp)
1454dd433:     	movl	$0x4, %r9d
1454dd439:     	movq	%rsi, %rcx
1454dd43c:     	movq	%r14, %rdx
1454dd43f:     	leaq	0x14cdbe4(%rip), %r8    # 0x1469ab02a
1454dd446:     	callq	0x145451620 <.text+0x5450620>
1454dd44b:     	nop
1454dd44c:     	movl	0x98(%r13), %eax
1454dd453:     	movb	$0x1, 0x16c(%rbp)
1454dd45a:     	movl	%eax, 0x20(%rsp)
1454dd45e:     	movl	$0x6, %r9d
1454dd464:     	movq	%r14, %rcx
1454dd467:     	movq	%rsi, %rdx
1454dd46a:     	leaq	0x14cdbd2(%rip), %r8    # 0x1469ab043
1454dd471:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dd476:     	nop
1454dd477:     	movq	0x98(%r13), %rcx
1454dd47e:     	movb	$0x1, 0x13f(%rbp)
1454dd485:     	callq	0x145458e00 <.text+0x5457e00>
1454dd48a:     	nop
1454dd48b:     	movb	$0x0, 0x13f(%rbp)
1454dd492:     	movq	%rdx, 0x28(%rsp)
1454dd497:     	movq	%rax, 0x20(%rsp)
1454dd49c:     	movl	$0xa, %r9d
1454dd4a2:     	movq	%rsi, %rcx
1454dd4a5:     	movq	%r14, %rdx
1454dd4a8:     	leaq	0x14cefd5(%rip), %r8    # 0x1469ac484
1454dd4af:     	callq	0x145451620 <.text+0x5450620>
1454dd4b4:     	nop
1454dd4b5:     	movq	0x78(%r13), %rax
1454dd4b9:     	movq	%rax, %rcx
1454dd4bc:     	xorq	%rdi, %rcx
1454dd4bf:     	testq	%rax, %rax
1454dd4c2:     	movl	$0x1, %eax
1454dd4c7:     	cmovnsq	%rax, %rcx
1454dd4cb:     	leaq	0x14cf93a(%rip), %rdx   # 0x1469ace0c
1454dd4d2:     	movslq	(%rdx,%rcx,4), %rax
1454dd4d6:     	addq	%rdx, %rax
1454dd4d9:     	jmpq	*%rax
1454dd4db:     	movl	$0x3, %eax
1454dd4e0:     	leaq	0x14cefa7(%rip), %rcx   # 0x1469ac48e
1454dd4e7:     	jmp	0x1454dd540 <.text+0x54dc540>
1454dd4e9:     	movl	$0x4, %eax
1454dd4ee:     	leaq	0x14cdb86(%rip), %rcx   # 0x1469ab07b
1454dd4f5:     	jmp	0x1454dd540 <.text+0x54dc540>
1454dd4f7:     	movq	0x80(%r13), %rax
1454dd4fe:     	movzbl	0x45(%rax), %ecx
1454dd502:     	leaq	(%rcx,%rcx,2), %rax
1454dd506:     	addq	$0x4, %rax
1454dd50a:     	testq	%rcx, %rcx
1454dd50d:     	leaq	0x14cdc0b(%rip), %rcx   # 0x1469ab11f
1454dd514:     	leaq	0x14cdc08(%rip), %rdx   # 0x1469ab123
1454dd51b:     	cmovneq	%rdx, %rcx
1454dd51f:     	jmp	0x1454dd540 <.text+0x54dc540>
1454dd521:     	movl	$0x6, %eax
1454dd526:     	leaq	0x14cdb10(%rip), %rcx   # 0x1469ab03d
1454dd52d:     	jmp	0x1454dd540 <.text+0x54dc540>
1454dd52f:     	movl	$0x7, %eax
1454dd534:     	leaq	0x14cef56(%rip), %rcx   # 0x1469ac491
1454dd53b:     	nopl	(%rax,%rax)
1454dd540:     	movb	$0x1, 0x16c(%rbp)
1454dd547:     	movq	%rax, 0x28(%rsp)
1454dd54c:     	movq	%rcx, 0x20(%rsp)
1454dd551:     	movl	$0x4, %r9d
1454dd557:     	movq	%r14, %rcx
1454dd55a:     	movq	%rsi, %rdx
1454dd55d:     	leaq	0x14cef34(%rip), %r8    # 0x1469ac498
1454dd564:     	callq	0x145451620 <.text+0x5450620>
1454dd569:     	nop
1454dd56a:     	movq	0x150(%rbp), %rbx
1454dd571:     	cmpq	%rbx, 0x140(%rbp)
1454dd578:     	je	0x1454dd68e <.text+0x54dc68e>
1454dd57e:     	movq	0x148(%rbp), %rax
1454dd585:     	movb	$0x7d, (%rax,%rbx)
1454dd589:     	incq	%rbx
1454dd58c:     	movq	%rbx, 0x110(%rbp)
1454dd593:     	movups	0x140(%rbp), %xmm0
1454dd59a:     	movaps	%xmm0, 0x100(%rbp)
1454dd5a1:     	movb	$0x0, 0x16c(%rbp)
1454dd5a8:     	leaq	0x38(%rbp), %rcx
1454dd5ac:     	leaq	0x80(%rbp), %rdx
1454dd5b3:     	movq	%rsi, %r8
1454dd5b6:     	callq	0x145450cb0 <.text+0x544fcb0>
1454dd5bb:     	nop
1454dd5bc:     	movq	0x38(%rbp), %rax
1454dd5c0:     	movq	%rax, 0xd8(%rbp)
1454dd5c7:     	movq	0x40(%rbp), %rax
1454dd5cb:     	movq	%rax, 0xc0(%rbp)
1454dd5d2:     	movq	0x48(%rbp), %r14
1454dd5d6:     	movzbl	0x50(%rbp), %ebx
1454dd5da:     	leaq	0x51(%rbp), %rcx
1454dd5de:     	movl	(%rcx), %eax
1454dd5e0:     	movl	0x3(%rcx), %ecx
1454dd5e3:     	movl	%eax, 0xd0(%rbp)
1454dd5e9:     	movl	%ecx, 0xd3(%rbp)
1454dd5ef:     	movq	0xe8(%rbp), %rdx
1454dd5f6:     	testq	%rdx, %rdx
1454dd5f9:     	je	0x1454dcb40 <.text+0x54dbb40>
1454dd5ff:     	movl	$0x1, %r8d
1454dd605:     	movq	0xc8(%rbp), %rcx
1454dd60c:     	callq	0x1400021d0 <.text+0x11d0>
1454dd611:     	jmp	0x1454dcb40 <.text+0x54dbb40>
1454dd616:     	movq	$0x1, 0x140(%rbp)
1454dd621:     	movq	0x130(%rbp), %rax
1454dd628:     	movq	%rax, 0x148(%rbp)
1454dd62f:     	movq	$0x1, 0x150(%rbp)
1454dd63a:     	movb	$0x1, 0x158(%rbp)
1454dd641:     	movq	%rax, 0xf8(%rbp)
1454dd648:     	movq	$0x1, 0xf0(%rbp)
1454dd653:     	movb	$0x0, 0x16e(%rbp)
1454dd65a:     	movb	$0x1, 0x16d(%rbp)
1454dd661:     	movl	0x6c(%rbp), %eax
1454dd664:     	movl	%eax, 0x20(%rsp)
1454dd668:     	movl	$0x4, %r9d
1454dd66e:     	leaq	0x100(%rbp), %rcx
1454dd675:     	leaq	0x140(%rbp), %rdx
1454dd67c:     	leaq	0x14cd9ab(%rip), %r8    # 0x1469ab02e
1454dd683:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dd688:     	nop
1454dd689:     	jmp	0x1454dd12b <.text+0x54dc12b>
1454dd68e:     	movq	$0x1, 0x20(%rsp)
1454dd697:     	movl	$0x1, %r8d
1454dd69d:     	movl	$0x1, %r9d
1454dd6a3:     	movq	%r14, %rcx
1454dd6a6:     	movq	%rbx, %rdx
1454dd6a9:     	callq	0x145757d40 <.text+0x5756d40>
1454dd6ae:     	nop
1454dd6af:     	jmp	0x1454dd57e <.text+0x54dc57e>
1454dd6b4:     	movq	$0x1, 0x20(%rsp)
1454dd6bd:     	movl	$0x4, %r8d
1454dd6c3:     	movl	$0x1, %r9d
1454dd6c9:     	movq	%rdi, %rcx
1454dd6cc:     	callq	0x145757d40 <.text+0x5756d40>
1454dd6d1:     	nop
1454dd6d2:     	movq	0x150(%rbp), %rdx
1454dd6d9:     	jmp	0x1454dd24e <.text+0x54dc24e>
1454dd6de:     	callq	0x140002200 <.text+0x1200>
1454dd6e3:     	movl	$0x1, %ecx
1454dd6e8:     	movl	$0x1, %edx
1454dd6ed:     	callq	0x1400021c0 <.text+0x11c0>
1454dd6f2:     	testq	%rax, %rax
1454dd6f5:     	je	0x1454ddbc6 <.text+0x54dcbc6>
1454dd6fb:     	movb	$0x7b, (%rax)
1454dd6fe:     	movq	$0x1, 0x140(%rbp)
1454dd709:     	movq	%rax, 0x148(%rbp)
1454dd710:     	movq	$0x1, 0x150(%rbp)
1454dd71b:     	movb	$0x1, 0x158(%rbp)
1454dd722:     	movb	$0x1, 0x16f(%rbp)
1454dd729:     	leaq	0x14ced6c(%rip), %rax   # 0x1469ac49c
1454dd730:     	movq	%rax, 0x20(%rsp)
1454dd735:     	movq	$0x7, 0x28(%rsp)
1454dd73e:     	leaq	0x14cd90c(%rip), %r8    # 0x1469ab051
1454dd745:     	leaq	0x100(%rbp), %rcx
1454dd74c:     	leaq	0x140(%rbp), %rdx
1454dd753:     	movl	$0x4, %r9d
1454dd759:     	callq	0x145451620 <.text+0x5450620>
1454dd75e:     	nop
1454dd75f:     	movb	$0x1, 0x16f(%rbp)
1454dd766:     	movq	0x28(%rbp), %rax
1454dd76a:     	movq	%rax, 0x28(%rsp)
1454dd76f:     	movq	0x20(%rbp), %rax
1454dd773:     	movq	%rax, 0x20(%rsp)
1454dd778:     	leaq	0x14ced24(%rip), %r8    # 0x1469ac4a3
1454dd77f:     	leaq	0x140(%rbp), %rcx
1454dd786:     	leaq	0x100(%rbp), %rdx
1454dd78d:     	movl	$0x3, %r9d
1454dd793:     	callq	0x145451620 <.text+0x5450620>
1454dd798:     	nop
1454dd799:     	movl	0x3f8(%r12), %eax
1454dd7a1:     	movb	$0x1, 0x16f(%rbp)
1454dd7a8:     	movl	%eax, 0x20(%rsp)
1454dd7ac:     	leaq	0x14cd8ae(%rip), %r8    # 0x1469ab061
1454dd7b3:     	leaq	0x100(%rbp), %rcx
1454dd7ba:     	leaq	0x140(%rbp), %rdx
1454dd7c1:     	movl	$0x5, %r9d
1454dd7c7:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dd7cc:     	nop
1454dd7cd:     	movl	0x4ac(%r12), %esi
1454dd7d5:     	movb	$0x1, 0x16f(%rbp)
1454dd7dc:     	movl	%esi, 0x20(%rsp)
1454dd7e0:     	leaq	0x14cd8ad(%rip), %r8    # 0x1469ab094
1454dd7e7:     	leaq	0x140(%rbp), %rcx
1454dd7ee:     	leaq	0x100(%rbp), %rdx
1454dd7f5:     	movl	$0x7, %r9d
1454dd7fb:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dd800:     	nop
1454dd801:     	xorl	%ecx, %ecx
1454dd803:     	testl	%esi, %esi
1454dd805:     	jne	0x1454dd8ad <.text+0x54dc8ad>
1454dd80b:     	movl	0x4b0(%r12), %r8d
1454dd813:     	movl	$0x1, %eax
1454dd818:     	testl	%r8d, %r8d
1454dd81b:     	je	0x1454dd896 <.text+0x54dc896>
1454dd81d:     	testb	$0x1, %r8b
1454dd821:     	je	0x1454dd82e <.text+0x54dc82e>
1454dd823:     	movl	$0x3, %eax
1454dd828:     	cmpl	$0x1, %r8d
1454dd82c:     	je	0x1454dd896 <.text+0x54dc896>
1454dd82e:     	testb	$0x2, %r8b
1454dd832:     	je	0x1454dd842 <.text+0x54dc842>
1454dd834:     	leal	(%rax,%rax,8), %eax
1454dd837:     	movl	%r8d, %ecx
1454dd83a:     	andl	$-0x2, %ecx
1454dd83d:     	cmpl	$0x2, %ecx
1454dd840:     	je	0x1454dd896 <.text+0x54dc896>
1454dd842:     	testb	$0x4, %r8b
1454dd846:     	je	0x1454dd859 <.text+0x54dc859>
1454dd848:     	leal	(%rax,%rax,8), %eax
1454dd84b:     	leal	(%rax,%rax,8), %eax
1454dd84e:     	movl	%r8d, %ecx
1454dd851:     	andl	$-0x4, %ecx
1454dd854:     	cmpl	$0x4, %ecx
1454dd857:     	je	0x1454dd896 <.text+0x54dc896>
1454dd859:     	testb	$0x8, %r8b
1454dd85d:     	je	0x1454dd870 <.text+0x54dc870>
1454dd85f:     	imull	$0x19a1, %eax, %eax     # imm = 0x19A1
1454dd865:     	movl	%r8d, %ecx
1454dd868:     	andl	$-0x8, %ecx
1454dd86b:     	cmpl	$0x8, %ecx
1454dd86e:     	je	0x1454dd896 <.text+0x54dc896>
1454dd870:     	movb	$0x1, %r9b
1454dd873:     	movl	$0xffffff9c, %ecx       # imm = 0xFFFFFF9C
1454dd878:     	testb	$0x10, %r8b
1454dd87c:     	je	0x1454dd8a3 <.text+0x54dc8a3>
1454dd87e:     	movl	$0x290d741, %edx        # imm = 0x290D741
1454dd883:     	mull	%edx
1454dd885:     	seto	%dl
1454dd888:     	andl	$-0x10, %r8d
1454dd88c:     	cmpl	$0x10, %r8d
1454dd890:     	jne	0x1454dd8a3 <.text+0x54dc8a3>
1454dd892:     	testb	%dl, %dl
1454dd894:     	jne	0x1454dd8a3 <.text+0x54dc8a3>
1454dd896:     	movl	$0x64, %ecx
1454dd89b:     	mull	%ecx
1454dd89d:     	movl	%eax, %ecx
1454dd89f:     	seto	%r9b
1454dd8a3:     	testb	$0x1, %r9b
1454dd8a7:     	jne	0x1454ddb92 <.text+0x54dcb92>
1454dd8ad:     	movb	$0x1, 0x16f(%rbp)
1454dd8b4:     	movl	%ecx, 0x20(%rsp)
1454dd8b8:     	leaq	0x14cd7dc(%rip), %r8    # 0x1469ab09b
1454dd8bf:     	leaq	0x100(%rbp), %rcx
1454dd8c6:     	leaq	0x140(%rbp), %rdx
1454dd8cd:     	movl	$0xa, %r9d
1454dd8d3:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dd8d8:     	nop
1454dd8d9:     	movl	0x408(%r12), %eax
1454dd8e1:     	movb	$0x1, 0x16f(%rbp)
1454dd8e8:     	movl	%eax, 0x20(%rsp)
1454dd8ec:     	leaq	0x14cd788(%rip), %r8    # 0x1469ab07b
1454dd8f3:     	leaq	0x140(%rbp), %rcx
1454dd8fa:     	leaq	0x100(%rbp), %rdx
1454dd901:     	movl	$0x4, %r9d
1454dd907:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dd90c:     	nop
1454dd90d:     	movb	$0x1, 0x16f(%rbp)
1454dd914:     	movl	0xbc(%rbp), %eax
1454dd91a:     	movl	%eax, 0x20(%rsp)
1454dd91e:     	leaq	0x14ceb81(%rip), %r8    # 0x1469ac4a6
1454dd925:     	leaq	0x100(%rbp), %rcx
1454dd92c:     	leaq	0x140(%rbp), %rdx
1454dd933:     	movl	$0x8, %r9d
1454dd939:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dd93e:     	nop
1454dd93f:     	movb	%bl, %dil
1454dd942:     	movb	0x20e(%r12), %bl
1454dd94a:     	leaq	0x14ceb5d(%rip), %rdx   # 0x1469ac4ae
1454dd951:     	leaq	0x100(%rbp), %rcx
1454dd958:     	movl	$0x4, %r8d
1454dd95e:     	callq	0x145451370 <.text+0x5450370>
1454dd963:     	nop
1454dd964:     	movzbl	%bl, %esi
1454dd967:     	xorq	$0x5, %rsi
1454dd96b:     	movq	0x100(%rbp), %rax
1454dd972:     	movq	0x110(%rbp), %rcx
1454dd979:     	subq	%rcx, %rax
1454dd97c:     	cmpq	%rax, %rsi
1454dd97f:     	ja	0x1454ddb09 <.text+0x54dcb09>
1454dd985:     	leaq	0x1245862(%rip), %rax   # 0x1467231ee
1454dd98c:     	leaq	0x1245856(%rip), %rdx   # 0x1467231e9
1454dd993:     	testb	%bl, %bl
1454dd995:     	cmovneq	%rax, %rdx
1454dd999:     	addq	0x108(%rbp), %rcx
1454dd9a0:     	movq	%rsi, %r8
1454dd9a3:     	callq	0x145756ddd <.text+0x5755ddd>
1454dd9a8:     	addq	%rsi, 0x110(%rbp)
1454dd9af:     	movups	0x100(%rbp), %xmm0
1454dd9b6:     	movaps	%xmm0, 0x140(%rbp)
1454dd9bd:     	movups	0x110(%rbp), %xmm0
1454dd9c4:     	movaps	%xmm0, 0x150(%rbp)
1454dd9cb:     	movl	0x930(%r12), %eax
1454dd9d3:     	shrl	$0x2, %eax
1454dd9d6:     	cmpl	$0xb, %eax
1454dd9d9:     	movl	$0xa, %ecx
1454dd9de:     	cmovael	%eax, %ecx
1454dd9e1:     	movb	$0x1, 0x16f(%rbp)
1454dd9e8:     	movl	%ecx, 0x20(%rsp)
1454dd9ec:     	leaq	0x14ceabf(%rip), %r8    # 0x1469ac4b2
1454dd9f3:     	leaq	0x100(%rbp), %rcx
1454dd9fa:     	leaq	0x140(%rbp), %rdx
1454dda01:     	movl	$0x8, %r9d
1454dda07:     	callq	0x14544e7c0 <.text+0x544d7c0>
1454dda0c:     	nop
1454dda0d:     	movq	0xd8(%rbp), %r8
1454dda14:     	movq	%r8, 0x140(%rbp)
1454dda1b:     	movq	0xc0(%rbp), %rdx
1454dda22:     	movq	%rdx, 0x148(%rbp)
1454dda29:     	movq	%r14, 0x150(%rbp)
1454dda30:     	movb	%dil, 0x158(%rbp)
1454dda37:     	movl	0xd0(%rbp), %eax
1454dda3d:     	movl	0xd3(%rbp), %ecx
1454dda43:     	movl	%eax, 0x159(%rbp)
1454dda49:     	movl	%ecx, 0x15c(%rbp)
1454dda4f:     	movq	%rdx, %rax
1454dda52:     	cmpq	%r14, %r8
1454dda55:     	je	0x1454ddb37 <.text+0x54dcb37>
1454dda5b:     	movb	$0x5d, (%rax,%r14)
1454dda60:     	incq	%r14
1454dda63:     	movq	%r14, 0x90(%rbp)
1454dda6a:     	movq	0x140(%rbp), %rax
1454dda71:     	movq	%rax, 0x80(%rbp)
1454dda78:     	movq	0x148(%rbp), %rax
1454dda7f:     	movq	%rax, 0x88(%rbp)
1454dda86:     	movb	$0x0, 0x13e(%rbp)
1454dda8d:     	leaq	0x80(%rbp), %rax
1454dda94:     	movq	%rax, 0x20(%rsp)
1454dda99:     	leaq	0x14ce9fc(%rip), %r8    # 0x1469ac49c
1454ddaa0:     	leaq	0x140(%rbp), %rcx
1454ddaa7:     	leaq	0x100(%rbp), %rdx
1454ddaae:     	movl	$0x7, %r9d
1454ddab4:     	callq	0x1454514e0 <.text+0x54504e0>
1454ddab9:     	nop
1454ddaba:     	movq	0x150(%rbp), %rsi
1454ddac1:     	cmpq	%rsi, 0x140(%rbp)
1454ddac8:     	je	0x1454ddb68 <.text+0x54dcb68>
1454ddace:     	movq	0x148(%rbp), %rax
1454ddad5:     	movb	$0x7d, (%rax,%rsi)
1454ddad9:     	incq	%rsi
1454ddadc:     	movq	%rsi, 0x150(%rbp)
1454ddae3:     	movq	0x30(%rbp), %rax
1454ddae7:     	movq	%rsi, 0x10(%rax)
1454ddaeb:     	movups	0x140(%rbp), %xmm0
1454ddaf2:     	movups	%xmm0, (%rax)
1454ddaf5:     	addq	$0x1f8, %rsp            # imm = 0x1F8
1454ddafc:     	popq	%rbx
1454ddafd:     	popq	%rdi
1454ddafe:     	popq	%rsi
1454ddaff:     	popq	%r12
1454ddb01:     	popq	%r13
1454ddb03:     	popq	%r14
1454ddb05:     	popq	%r15
1454ddb07:     	popq	%rbp
1454ddb08:     	retq
1454ddb09:     	movq	$0x1, 0x20(%rsp)
1454ddb12:     	movq	%rcx, %rdx
1454ddb15:     	leaq	0x100(%rbp), %rcx
1454ddb1c:     	movl	$0x1, %r9d
1454ddb22:     	movq	%rsi, %r8
1454ddb25:     	callq	0x145757d40 <.text+0x5756d40>
1454ddb2a:     	nop
1454ddb2b:     	movq	0x110(%rbp), %rcx
1454ddb32:     	jmp	0x1454dd985 <.text+0x54dc985>
1454ddb37:     	movq	$0x1, 0x20(%rsp)
1454ddb40:     	leaq	0x140(%rbp), %rcx
1454ddb47:     	movl	$0x1, %r8d
1454ddb4d:     	movl	$0x1, %r9d
1454ddb53:     	movq	%r14, %rdx
1454ddb56:     	callq	0x145757d40 <.text+0x5756d40>
1454ddb5b:     	nop
1454ddb5c:     	movq	0x148(%rbp), %rax
1454ddb63:     	jmp	0x1454dda5b <.text+0x54dca5b>
1454ddb68:     	movq	$0x1, 0x20(%rsp)
1454ddb71:     	leaq	0x140(%rbp), %rcx
1454ddb78:     	movl	$0x1, %r8d
1454ddb7e:     	movl	$0x1, %r9d
1454ddb84:     	movq	%rsi, %rdx
1454ddb87:     	callq	0x145757d40 <.text+0x5756d40>
1454ddb8c:     	nop
1454ddb8d:     	jmp	0x1454ddace <.text+0x54dcace>
1454ddb92:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454ddb97:     	jmp	0x1454dd8ad <.text+0x54dc8ad>
1454ddb9c:     	movb	$0x1, 0x16f(%rbp)
1454ddba3:     	movl	$0x1, %ecx
1454ddba8:     	movl	$0x1, %edx
1454ddbad:     	callq	0x1458e721b <.text+0x58e621b>
1454ddbb2:     	nop
1454ddbb3:     	jmp	0x1454ddbdd <.text+0x54dcbdd>
1454ddbb5:     	movl	$0x1, %ecx
1454ddbba:     	movl	$0x1, %edx
1454ddbbf:     	callq	0x1458e721b <.text+0x58e621b>
1454ddbc4:     	ud2
1454ddbc6:     	movb	$0x1, 0x16f(%rbp)
1454ddbcd:     	movl	$0x1, %ecx
1454ddbd2:     	movl	$0x1, %edx
1454ddbd7:     	callq	0x1458e721b <.text+0x58e621b>
1454ddbdc:     	nop
1454ddbdd:     	ud2

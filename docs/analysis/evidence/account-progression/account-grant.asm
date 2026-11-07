
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552fae0:     	pushq	%rbp
14552fae1:     	pushq	%r15
14552fae3:     	pushq	%r14
14552fae5:     	pushq	%r13
14552fae7:     	pushq	%r12
14552fae9:     	pushq	%rsi
14552faea:     	pushq	%rdi
14552faeb:     	pushq	%rbx
14552faec:     	subq	$0xa8, %rsp
14552faf3:     	leaq	0x80(%rsp), %rbp
14552fafb:     	movq	$-0x2, 0x20(%rbp)
14552fb03:     	movq	%rcx, %r14
14552fb06:     	movq	0x28(%rdx), %rdi
14552fb0a:     	movq	%rdi, %r15
14552fb0d:     	shlq	$0x4, %r15
14552fb11:     	movq	%rdi, %rax
14552fb14:     	shrq	$0x3c, %rax
14552fb18:     	setne	%al
14552fb1b:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
14552fb25:     	cmpq	%rcx, %r15
14552fb28:     	seta	%cl
14552fb2b:     	orb	%al, %cl
14552fb2d:     	je	0x14552fb3f <.text+0x552eb3f>
14552fb2f:     	xorl	%r12d, %r12d
14552fb32:     	movq	%r12, %rcx
14552fb35:     	movq	%r15, %rdx
14552fb38:     	callq	0x14590379b <.text+0x590279b>
14552fb3d:     	ud2
14552fb3f:     	movq	%r8, -0x38(%rbp)
14552fb43:     	movq	%rdx, 0x18(%rbp)
14552fb47:     	movq	0x20(%rdx), %rsi
14552fb4b:     	testq	%r15, %r15
14552fb4e:     	movq	%r14, -0x30(%rbp)
14552fb52:     	movq	%r9, -0x28(%rbp)
14552fb56:     	je	0x14552fb87 <.text+0x552eb87>
14552fb58:     	callq	0x140002200 <.text+0x1200>
14552fb5d:     	movl	$0x8, %r12d
14552fb63:     	movl	$0x8, %edx
14552fb68:     	movq	%r15, %rcx
14552fb6b:     	callq	0x1400021c0 <.text+0x11c0>
14552fb70:     	movq	%rax, 0x10(%rbp)
14552fb74:     	testq	%rax, %rax
14552fb77:     	je	0x14552fb32 <.text+0x552eb32>
14552fb79:     	movq	%rdi, (%rbp)
14552fb7d:     	testq	%rdi, %rdi
14552fb80:     	jne	0x14552fba1 <.text+0x552eba1>
14552fb82:     	jmp	0x14552fd1e <.text+0x552ed1e>
14552fb87:     	movl	$0x8, %eax
14552fb8c:     	movq	%rax, 0x10(%rbp)
14552fb90:     	movq	$0x0, (%rbp)
14552fb98:     	testq	%rdi, %rdi
14552fb9b:     	je	0x14552fd1e <.text+0x552ed1e>
14552fba1:     	movq	0x10(%rbp), %rdi
14552fba5:     	movq	%rdi, %rcx
14552fba8:     	movq	%rsi, %rdx
14552fbab:     	movq	%r15, %r8
14552fbae:     	callq	0x1457731ed <.text+0x57721ed>
14552fbb3:     	addq	%rdi, %r15
14552fbb6:     	movq	0x18(%rbp), %rax
14552fbba:     	addq	$0xd8, %rax
14552fbc0:     	movq	%rax, 0x8(%rbp)
14552fbc4:     	movq	%r15, -0x8(%rbp)
14552fbc8:     	jmp	0x14552fbe4 <.text+0x552ebe4>
14552fbca:     	nopw	(%rax,%rax)
14552fbd0:     	movq	%r14, %rdi
14552fbd3:     	addq	$0x10, %rdi
14552fbd7:     	movq	-0x8(%rbp), %r15
14552fbdb:     	cmpq	%r15, %rdi
14552fbde:     	je	0x14552fd1e <.text+0x552ed1e>
14552fbe4:     	movq	%rdi, %r14
14552fbe7:     	movq	0x8(%rdi), %rax
14552fbeb:     	cmpq	$0x1, %rax
14552fbef:     	movq	%rax, %rbx
14552fbf2:     	adcq	$-0x1, %rbx
14552fbf6:     	cmpq	$0xc, %rbx
14552fbfa:     	movl	$0xc, %ecx
14552fbff:     	cmovaeq	%rcx, %rbx
14552fc03:     	cmpq	$0x2, %rax
14552fc07:     	movq	0x18(%rbp), %rsi
14552fc0b:     	jb	0x14552fbd0 <.text+0x552ebd0>
14552fc0d:     	movzbl	(%r14), %r13d
14552fc11:     	movq	0xe8(%rsi), %r12
14552fc18:     	xorl	%edi, %edi
14552fc1a:     	jmp	0x14552fc3d <.text+0x552ec3d>
14552fc1c:     	nopl	(%rax)
14552fc20:     	movb	%r13b, (%rsi)
14552fc23:     	movq	%rdi, 0x8(%rsi)
14552fc27:     	incq	%r12
14552fc2a:     	movq	0x18(%rbp), %rsi
14552fc2e:     	movq	%r12, 0xe8(%rsi)
14552fc35:     	incq	%rdi
14552fc38:     	cmpq	%rbx, %rdi
14552fc3b:     	je	0x14552fbd0 <.text+0x552ebd0>
14552fc3d:     	movq	0xe0(%rsi), %rax
14552fc44:     	movq	%r12, %r15
14552fc47:     	testq	%r12, %r12
14552fc4a:     	je	0x14552fcd9 <.text+0x552ecd9>
14552fc50:     	cmpq	$0x1, %r12
14552fc54:     	jne	0x14552fc60 <.text+0x552ec60>
14552fc56:     	xorl	%r15d, %r15d
14552fc59:     	jmp	0x14552fcae <.text+0x552ecae>
14552fc5b:     	nopl	(%rax,%rax)
14552fc60:     	movq	%r12, %rcx
14552fc63:     	xorl	%r15d, %r15d
14552fc66:     	nopw	%cs:(%rax,%rax)
14552fc70:     	movq	%r15, %rdx
14552fc73:     	movq	%rcx, %r8
14552fc76:     	shrq	%r8
14552fc79:     	addq	%r8, %r15
14552fc7c:     	movq	%r15, %r9
14552fc7f:     	shlq	$0x4, %r9
14552fc83:     	xorl	%r10d, %r10d
14552fc86:     	cmpq	%rdi, 0x8(%rax,%r9)
14552fc8b:     	seta	%r10b
14552fc8f:     	xorl	%r11d, %r11d
14552fc92:     	cmpb	%r13b, (%rax,%r9)
14552fc96:     	seta	%r11b
14552fc9a:     	cmovel	%r10d, %r11d
14552fc9e:     	testb	%r11b, %r11b
14552fca1:     	cmovneq	%rdx, %r15
14552fca5:     	subq	%r8, %rcx
14552fca8:     	cmpq	$0x1, %rcx
14552fcac:     	ja	0x14552fc70 <.text+0x552ec70>
14552fcae:     	movq	%r15, %rcx
14552fcb1:     	shlq	$0x4, %rcx
14552fcb5:     	cmpb	%r13b, (%rax,%rcx)
14552fcb9:     	jne	0x14552fcc0 <.text+0x552ecc0>
14552fcbb:     	cmpq	%rdi, 0x8(%rax,%rcx)
14552fcc0:     	seta	%cl
14552fcc3:     	sbbb	$0x0, %cl
14552fcc6:     	testb	%cl, %cl
14552fcc8:     	je	0x14552fc35 <.text+0x552ec35>
14552fcce:     	xorl	%edx, %edx
14552fcd0:     	cmpb	$-0x1, %cl
14552fcd3:     	sete	%dl
14552fcd6:     	addq	%rdx, %r15
14552fcd9:     	movq	0x8(%rbp), %rcx
14552fcdd:     	cmpq	(%rcx), %r12
14552fce0:     	jne	0x14552fcf3 <.text+0x552ecf3>
14552fce2:     	movq	0x8(%rbp), %rcx
14552fce6:     	callq	0x145774860 <.text+0x5773860>
14552fceb:     	nop
14552fcec:     	movq	0xe0(%rsi), %rax
14552fcf3:     	movq	%r15, %rsi
14552fcf6:     	shlq	$0x4, %rsi
14552fcfa:     	addq	%rax, %rsi
14552fcfd:     	movq	%r12, %r8
14552fd00:     	subq	%r15, %r8
14552fd03:     	jbe	0x14552fc20 <.text+0x552ec20>
14552fd09:     	leaq	0x10(%rsi), %rcx
14552fd0d:     	shlq	$0x4, %r8
14552fd11:     	movq	%rsi, %rdx
14552fd14:     	callq	0x1457731e1 <.text+0x57721e1>
14552fd19:     	jmp	0x14552fc20 <.text+0x552ec20>
14552fd1e:     	movq	(%rbp), %rdx
14552fd22:     	testq	%rdx, %rdx
14552fd25:     	je	0x14552fd3a <.text+0x552ed3a>
14552fd27:     	shlq	$0x4, %rdx
14552fd2b:     	movl	$0x8, %r8d
14552fd31:     	movq	0x10(%rbp), %rcx
14552fd35:     	callq	0x1400021d0 <.text+0x11d0>
14552fd3a:     	movq	0x18(%rbp), %r11
14552fd3e:     	movq	0x10(%r11), %r8
14552fd42:     	testq	%r8, %r8
14552fd45:     	movq	-0x28(%rbp), %r12
14552fd49:     	movq	-0x30(%rbp), %r14
14552fd4d:     	je	0x14552fd66 <.text+0x552ed66>
14552fd4f:     	movq	0x8(%r11), %rcx
14552fd53:     	movl	%r8d, %edx
14552fd56:     	andl	$0x3, %edx
14552fd59:     	cmpq	$0x4, %r8
14552fd5d:     	jae	0x14552fd70 <.text+0x552ed70>
14552fd5f:     	xorl	%r9d, %r9d
14552fd62:     	xorl	%eax, %eax
14552fd64:     	jmp	0x14552fdc3 <.text+0x552edc3>
14552fd66:     	xorl	%eax, %eax
14552fd68:     	xorl	%r9d, %r9d
14552fd6b:     	jmp	0x14552fe80 <.text+0x552ee80>
14552fd70:     	movq	%r8, %r10
14552fd73:     	andq	$-0x4, %r10
14552fd77:     	leaq	0xd0(%rcx), %r11
14552fd7e:     	xorl	%r9d, %r9d
14552fd81:     	xorl	%eax, %eax
14552fd83:     	nopw	%cs:(%rax,%rax)
14552fd90:     	movl	-0xa8(%r11), %esi
14552fd97:     	movl	-0x70(%r11), %edi
14552fd9b:     	addq	%rax, %rsi
14552fd9e:     	movl	-0x38(%r11), %ebx
14552fda2:     	addq	%rdi, %rbx
14552fda5:     	addq	%rsi, %rbx
14552fda8:     	movl	(%r11), %eax
14552fdab:     	addq	%rbx, %rax
14552fdae:     	addq	$0x4, %r9
14552fdb2:     	addq	$0xe0, %r11
14552fdb9:     	cmpq	%r9, %r10
14552fdbc:     	jne	0x14552fd90 <.text+0x552ed90>
14552fdbe:     	testq	%rdx, %rdx
14552fdc1:     	je	0x14552fdf0 <.text+0x552edf0>
14552fdc3:     	imulq	$0x38, %r9, %r9
14552fdc7:     	addq	%rcx, %r9
14552fdca:     	addq	$0x28, %r9
14552fdce:     	imulq	$0x38, %rdx, %r10
14552fdd2:     	xorl	%r11d, %r11d
14552fdd5:     	nopw	%cs:(%rax,%rax)
14552fde0:     	movl	(%r9,%r11), %esi
14552fde4:     	addq	%rsi, %rax
14552fde7:     	addq	$0x38, %r11
14552fdeb:     	cmpq	%r11, %r10
14552fdee:     	jne	0x14552fde0 <.text+0x552ede0>
14552fdf0:     	cmpq	$0x4, %r8
14552fdf4:     	jae	0x14552fdfe <.text+0x552edfe>
14552fdf6:     	xorl	%r10d, %r10d
14552fdf9:     	xorl	%r9d, %r9d
14552fdfc:     	jmp	0x14552fe56 <.text+0x552ee56>
14552fdfe:     	movq	%r8, %r11
14552fe01:     	andq	$-0x4, %r11
14552fe05:     	leaq	0xd4(%rcx), %rsi
14552fe0c:     	xorl	%r10d, %r10d
14552fe0f:     	xorl	%r9d, %r9d
14552fe12:     	nopw	%cs:(%rax,%rax)
14552fe20:     	movl	-0xa8(%rsi), %edi
14552fe26:     	movl	-0x70(%rsi), %ebx
14552fe29:     	addq	%r9, %rdi
14552fe2c:     	movl	-0x38(%rsi), %r15d
14552fe30:     	addq	%rbx, %r15
14552fe33:     	addq	%rdi, %r15
14552fe36:     	movl	(%rsi), %r9d
14552fe39:     	addq	%r15, %r9
14552fe3c:     	addq	$0x4, %r10
14552fe40:     	addq	$0xe0, %rsi
14552fe47:     	cmpq	%r10, %r11
14552fe4a:     	jne	0x14552fe20 <.text+0x552ee20>
14552fe4c:     	testb	$0x3, %r8b
14552fe50:     	je	0x145530075 <.text+0x552f075>
14552fe56:     	imulq	$0x38, %r10, %r8
14552fe5a:     	addq	%r8, %rcx
14552fe5d:     	addq	$0x2c, %rcx
14552fe61:     	imulq	$0x38, %rdx, %rdx
14552fe65:     	xorl	%r8d, %r8d
14552fe68:     	movq	0x18(%rbp), %r11
14552fe6c:     	nopl	(%rax)
14552fe70:     	movl	(%rcx,%r8), %r10d
14552fe74:     	addq	%r10, %r9
14552fe77:     	addq	$0x38, %r8
14552fe7b:     	cmpq	%r8, %rdx
14552fe7e:     	jne	0x14552fe70 <.text+0x552ee70>
14552fe80:     	movq	0x1b0(%r11), %rcx
14552fe87:     	movq	0x1b8(%r11), %rdx
14552fe8e:     	cmpq	%rcx, %rax
14552fe91:     	cmovaq	%rax, %rcx
14552fe95:     	cmpq	%rdx, %r9
14552fe98:     	cmovaq	%r9, %rdx
14552fe9c:     	movq	%rcx, 0x1b0(%r11)
14552fea3:     	movq	%rdx, 0x1b8(%r11)
14552feaa:     	movq	$0x0, -0x20(%rbp)
14552feb2:     	movq	$0x8, -0x18(%rbp)
14552feba:     	movq	$0x0, -0x10(%rbp)
14552fec2:     	movq	0x250a617(%rip), %rax   # 0x147a3a4e0
14552fec9:     	cmpq	$0xd, %rax
14552fecd:     	movl	$0xd, %ecx
14552fed2:     	cmovbq	%rax, %rcx
14552fed6:     	shll	$0x5, %ecx
14552fed9:     	leaq	0x2507bc0(%rip), %rax   # 0x147a37aa0
14552fee0:     	leaq	(%rax,%rcx), %rsi
14552fee4:     	movl	0x18(%rcx,%rax), %eax
14552fee8:     	testl	%eax, %eax
14552feea:     	jne	0x14553007e <.text+0x552f07e>
14552fef0:     	imulq	$0x70, 0x10(%rsi), %rax
14552fef5:     	movq	0x8(%rsi), %rbx
14552fef9:     	addq	%rbx, %rax
14552fefc:     	movq	%rax, 0x10(%rbp)
14552ff00:     	jmp	0x14552ff1f <.text+0x552ef1f>
14552ff02:     	nopw	%cs:(%rax,%rax)
14552ff10:     	movq	-0x18(%rbp), %rax
14552ff14:     	movq	%r15, (%rax,%rsi,8)
14552ff18:     	incq	%rsi
14552ff1b:     	movq	%rsi, -0x10(%rbp)
14552ff1f:     	movq	0x18(%rbp), %r9
14552ff23:     	cmpq	0x10(%rbp), %rbx
14552ff27:     	je	0x145530051 <.text+0x552f051>
14552ff2d:     	movq	%rbx, %r15
14552ff30:     	addq	$0x70, %rbx
14552ff34:     	movq	0xb8(%r9), %rdi
14552ff3b:     	testq	%rdi, %rdi
14552ff3e:     	je	0x14552ffee <.text+0x552efee>
14552ff44:     	movq	0x8(%r15), %r12
14552ff48:     	movq	%r15, -0x8(%rbp)
14552ff4c:     	movq	0x10(%r15), %r15
14552ff50:     	movq	0xb0(%r9), %r14
14552ff57:     	xorl	%ebx, %ebx
14552ff59:     	cmpq	$0x1, %rdi
14552ff5d:     	je	0x14552ffa6 <.text+0x552efa6>
14552ff5f:     	nop
14552ff60:     	movq	%rbx, 0x8(%rbp)
14552ff64:     	movq	%rdi, %r13
14552ff67:     	shrq	%r13
14552ff6a:     	addq	%r13, %rbx
14552ff6d:     	leaq	(%rbx,%rbx,2), %rax
14552ff71:     	movq	0x8(%r14,%rax,8), %rcx
14552ff76:     	movq	0x10(%r14,%rax,8), %r8
14552ff7b:     	movq	%r8, %rsi
14552ff7e:     	subq	%r15, %rsi
14552ff81:     	cmovaeq	%r15, %r8
14552ff85:     	movq	%r12, %rdx
14552ff88:     	callq	0x1457731e7 <.text+0x57721e7>
14552ff8d:     	cltq
14552ff8f:     	testl	%eax, %eax
14552ff91:     	cmovneq	%rax, %rsi
14552ff95:     	testq	%rsi, %rsi
14552ff98:     	cmovgq	0x8(%rbp), %rbx
14552ff9d:     	subq	%r13, %rdi
14552ffa0:     	cmpq	$0x1, %rdi
14552ffa4:     	ja	0x14552ff60 <.text+0x552ef60>
14552ffa6:     	leaq	(%rbx,%rbx,2), %rax
14552ffaa:     	movq	0x8(%r14,%rax,8), %rcx
14552ffaf:     	movq	0x10(%r14,%rax,8), %rax
14552ffb4:     	movq	%rax, %rsi
14552ffb7:     	subq	%r15, %rsi
14552ffba:     	cmovbq	%rax, %r15
14552ffbe:     	movq	%r12, %rdx
14552ffc1:     	movq	%r15, %r8
14552ffc4:     	callq	0x1457731e7 <.text+0x57721e7>
14552ffc9:     	cltq
14552ffcb:     	testl	%eax, %eax
14552ffcd:     	cmovneq	%rax, %rsi
14552ffd1:     	testq	%rsi, %rsi
14552ffd4:     	movq	-0x30(%rbp), %r14
14552ffd8:     	movq	-0x28(%rbp), %r12
14552ffdc:     	movq	0x18(%rbp), %r9
14552ffe0:     	movq	-0x8(%rbp), %r15
14552ffe4:     	leaq	0x70(%r15), %rbx
14552ffe8:     	je	0x14552ff23 <.text+0x552ef23>
14552ffee:     	leaq	-0x50(%rbp), %rcx
14552fff2:     	movq	%r9, %rdx
14552fff5:     	movq	%r15, %r8
14552fff8:     	callq	0x14552e100 <.text+0x552d100>
14552fffd:     	nop
14552fffe:     	cmpl	$0x1, -0x50(%rbp)
145530002:     	movq	0x18(%rbp), %r9
145530006:     	jne	0x14552ff23 <.text+0x552ef23>
14553000c:     	movq	-0x40(%rbp), %rax
145530010:     	cmpq	%rax, -0x48(%rbp)
145530014:     	jb	0x14552ff23 <.text+0x552ef23>
14553001a:     	movq	0x8(%r15), %rdx
14553001e:     	movq	0x10(%r15), %r8
145530022:     	movq	%r12, 0x20(%rsp)
145530027:     	movq	%r9, %rcx
14553002a:     	movq	-0x38(%rbp), %r9
14553002e:     	callq	0x14542e180 <.text+0x542d180>
145530033:     	nop
145530034:     	movq	-0x10(%rbp), %rsi
145530038:     	cmpq	-0x20(%rbp), %rsi
14553003c:     	jne	0x14552ff10 <.text+0x552ef10>
145530042:     	leaq	-0x20(%rbp), %rcx
145530046:     	callq	0x145774550 <.text+0x5773550>
14553004b:     	nop
14553004c:     	jmp	0x14552ff10 <.text+0x552ef10>
145530051:     	movq	-0x10(%rbp), %rax
145530055:     	movq	%rax, 0x10(%r14)
145530059:     	movups	-0x20(%rbp), %xmm0
14553005d:     	movups	%xmm0, (%r14)
145530061:     	addq	$0xa8, %rsp
145530068:     	popq	%rbx
145530069:     	popq	%rdi
14553006a:     	popq	%rsi
14553006b:     	popq	%r12
14553006d:     	popq	%r13
14553006f:     	popq	%r14
145530071:     	popq	%r15
145530073:     	popq	%rbp
145530074:     	retq
145530075:     	movq	0x18(%rbp), %r11
145530079:     	jmp	0x14552fe80 <.text+0x552ee80>
14553007e:     	movq	%rsi, %rcx
145530081:     	callq	0x1458e9ead <.text+0x58e8ead>
145530086:     	nop
145530087:     	jmp	0x14552fef0 <.text+0x552eef0>

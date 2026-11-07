
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14554dcd0:     	pushq	%r15
14554dcd2:     	pushq	%r14
14554dcd4:     	pushq	%r13
14554dcd6:     	pushq	%r12
14554dcd8:     	pushq	%rsi
14554dcd9:     	pushq	%rdi
14554dcda:     	pushq	%rbp
14554dcdb:     	pushq	%rbx
14554dcdc:     	subq	$0xd8, %rsp
14554dce3:     	movdqa	%xmm6, 0xc0(%rsp)
14554dcec:     	movq	%r8, %rsi
14554dcef:     	movq	%rdx, %rdi
14554dcf2:     	movq	(%rcx), %r15
14554dcf5:     	movq	0x8(%rcx), %rax
14554dcf9:     	cmpq	%rax, %r15
14554dcfc:     	je	0x14554e02b <.text+0x554d02b>
14554dd02:     	movq	0x10(%rcx), %r14
14554dd06:     	subq	%r15, %rax
14554dd09:     	shrq	$0x4, %rax
14554dd0d:     	movabsq	$-0x71c71c71c71c71c7, %rcx # imm = 0x8E38E38E38E38E39
14554dd17:     	imulq	%rax, %rcx
14554dd1b:     	movq	%rcx, 0x48(%rsp)
14554dd20:     	xorl	%ebp, %ebp
14554dd22:     	movdqa	0x3c7bd6(%rip), %xmm6   # 0x145915900
14554dd2a:     	movq	%r14, 0x50(%rsp)
14554dd2f:     	jmp	0x14554dd94 <.text+0x554cd94>
14554dd31:     	nopw	%cs:(%rax,%rax)
14554dd40:     	xorps	%xmm2, %xmm2
14554dd43:     	cvtsi2ss	%rax, %xmm2
14554dd48:     	xorps	%xmm3, %xmm3
14554dd4b:     	cvtsi2ss	%rcx, %xmm3
14554dd50:     	unpcklps	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
14554dd53:     	unpcklps	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
14554dd56:     	divps	%xmm2, %xmm0
14554dd59:     	movaps	%xmm0, %xmm1
14554dd5c:     	psrad	$0x1f, %xmm1
14554dd61:     	psrld	$0x1, %xmm1
14554dd66:     	pxor	%xmm0, %xmm1
14554dd6a:     	pshufd	$0x55, %xmm1, %xmm0     # xmm0 = xmm1[1,1,1,1]
14554dd6f:     	pcmpgtd	%xmm0, %xmm1
14554dd73:     	movd	%xmm1, %eax
14554dd77:     	testb	$0x1, %al
14554dd79:     	cmoveq	%rbx, %rsi
14554dd7d:     	cmoveq	%r14, %rdi
14554dd81:     	incq	%rbp
14554dd84:     	cmpq	0x48(%rsp), %rbp
14554dd89:     	movq	0x50(%rsp), %r14
14554dd8e:     	je	0x14554e02b <.text+0x554d02b>
14554dd94:     	leaq	(,%rbp,8), %rax
14554dd9c:     	addq	%rbp, %rax
14554dd9f:     	shlq	$0x4, %rax
14554dda3:     	movzbl	0x8c(%r15,%rax), %eax
14554ddac:     	movb	%al, 0x2f(%rsp)
14554ddb0:     	movq	$0x0, 0x58(%rsp)
14554ddb9:     	movq	$0x0, 0x80(%rsp)
14554ddc5:     	leaq	0x1488f7c(%rip), %rax   # 0x1469d6d48
14554ddcc:     	movq	%rax, 0xa8(%rsp)
14554ddd4:     	leaq	0x1488f9d(%rip), %rax   # 0x1469d6d78
14554dddb:     	movq	%rax, 0xb0(%rsp)
14554dde3:     	leaq	0x2f(%rsp), %rax
14554dde8:     	movq	%rax, 0xb8(%rsp)
14554ddf0:     	leaq	0x30(%rsp), %rbx
14554ddf5:     	movq	%rbx, %rcx
14554ddf8:     	leaq	0x58(%rsp), %r12
14554ddfd:     	movq	%r12, %rdx
14554de00:     	callq	0x14553eda0 <.text+0x553dda0>
14554de05:     	movq	0x30(%rsp), %rax
14554de0a:     	movq	0x38(%rsp), %rcx
14554de0f:     	movq	0x40(%rsp), %rdx
14554de14:     	leaq	(%rcx,%rdx,4), %rdx
14554de18:     	movq	%rcx, 0x58(%rsp)
14554de1d:     	movq	%rcx, 0x60(%rsp)
14554de22:     	movq	%rax, 0x68(%rsp)
14554de27:     	movq	%rdx, 0x70(%rsp)
14554de2c:     	movq	%rbx, %rcx
14554de2f:     	movq	%r12, %rdx
14554de32:     	callq	0x1455590f0 <.text+0x55580f0>
14554de37:     	movq	0x38(%rsp), %rcx
14554de3c:     	movq	0x40(%rsp), %rbx
14554de41:     	testq	%rbx, %rbx
14554de44:     	je	0x14554de70 <.text+0x554ce70>
14554de46:     	movq	0x40(%r14), %rax
14554de4a:     	testq	%rax, %rax
14554de4d:     	je	0x14554de80 <.text+0x554ce80>
14554de4f:     	movq	0x38(%r14), %rdx
14554de53:     	cmpq	$0x1, %rax
14554de57:     	jne	0x14554de90 <.text+0x554ce90>
14554de59:     	movl	(%rdx), %eax
14554de5b:     	cmpq	$0x4, %rbx
14554de5f:     	jae	0x14554dee5 <.text+0x554cee5>
14554de65:     	xorl	%edx, %edx
14554de67:     	xorl	%r14d, %r14d
14554de6a:     	jmp	0x14554e019 <.text+0x554d019>
14554de6f:     	nop
14554de70:     	xorl	%r14d, %r14d
14554de73:     	jmp	0x14554df50 <.text+0x554cf50>
14554de78:     	nopl	(%rax,%rax)
14554de80:     	movq	%rax, %r14
14554de83:     	jmp	0x14554df50 <.text+0x554cf50>
14554de88:     	nopl	(%rax,%rax)
14554de90:     	xorl	%r8d, %r8d
14554de93:     	xorl	%r14d, %r14d
14554de96:     	nopw	%cs:(%rax,%rax)
14554dea0:     	movl	(%rcx,%r8,4), %r9d
14554dea4:     	movq	%rax, %r10
14554dea7:     	xorl	%r11d, %r11d
14554deaa:     	nopw	(%rax,%rax)
14554deb0:     	movq	%r11, %r12
14554deb3:     	movq	%r10, %r13
14554deb6:     	shrq	%r13
14554deb9:     	addq	%r13, %r11
14554debc:     	cmpl	%r9d, (%rdx,%r11,4)
14554dec0:     	cmovaq	%r12, %r11
14554dec4:     	subq	%r13, %r10
14554dec7:     	cmpq	$0x1, %r10
14554decb:     	ja	0x14554deb0 <.text+0x554ceb0>
14554decd:     	xorl	%r10d, %r10d
14554ded0:     	cmpl	%r9d, (%rdx,%r11,4)
14554ded4:     	sete	%r10b
14554ded8:     	addq	%r10, %r14
14554dedb:     	incq	%r8
14554dede:     	cmpq	%rbx, %r8
14554dee1:     	jne	0x14554dea0 <.text+0x554cea0>
14554dee3:     	jmp	0x14554df50 <.text+0x554cf50>
14554dee5:     	movq	%rbx, %rdx
14554dee8:     	andq	$-0x4, %rdx
14554deec:     	movd	%eax, %xmm0
14554def0:     	pshufd	$0x0, %xmm0, %xmm1      # xmm1 = xmm0[0,0,0,0]
14554def5:     	pxor	%xmm0, %xmm0
14554def9:     	xorl	%r8d, %r8d
14554defc:     	pxor	%xmm2, %xmm2
14554df00:     	movq	(%rcx,%r8,4), %xmm3
14554df06:     	movq	0x8(%rcx,%r8,4), %xmm4
14554df0d:     	pcmpeqd	%xmm1, %xmm3
14554df11:     	pshufd	$0xd4, %xmm3, %xmm3     # xmm3 = xmm3[0,1,1,3]
14554df16:     	pand	%xmm6, %xmm3
14554df1a:     	paddq	%xmm3, %xmm2
14554df1e:     	pcmpeqd	%xmm1, %xmm4
14554df22:     	pshufd	$0xd4, %xmm4, %xmm3     # xmm3 = xmm4[0,1,1,3]
14554df27:     	pand	%xmm6, %xmm3
14554df2b:     	paddq	%xmm3, %xmm0
14554df2f:     	addq	$0x4, %r8
14554df33:     	cmpq	%r8, %rdx
14554df36:     	jne	0x14554df00 <.text+0x554cf00>
14554df38:     	paddq	%xmm2, %xmm0
14554df3c:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
14554df41:     	paddq	%xmm0, %xmm1
14554df45:     	movq	%xmm1, %r14
14554df4a:     	jmp	0x14554e010 <.text+0x554d010>
14554df4f:     	nop
14554df50:     	movq	0x30(%rsp), %rdx
14554df55:     	testq	%rdx, %rdx
14554df58:     	je	0x14554df69 <.text+0x554cf69>
14554df5a:     	shlq	$0x2, %rdx
14554df5e:     	movl	$0x4, %r8d
14554df64:     	callq	0x1400021d0 <.text+0x11d0>
14554df69:     	testq	%rdi, %rdi
14554df6c:     	js	0x14554df80 <.text+0x554cf80>
14554df6e:     	xorps	%xmm0, %xmm0
14554df71:     	cvtsi2ss	%rdi, %xmm0
14554df76:     	jmp	0x14554df9a <.text+0x554cf9a>
14554df78:     	nopl	(%rax,%rax)
14554df80:     	movq	%rdi, %rax
14554df83:     	shrq	%rax
14554df86:     	movl	%edi, %ecx
14554df88:     	andl	$0x1, %ecx
14554df8b:     	orq	%rax, %rcx
14554df8e:     	xorps	%xmm0, %xmm0
14554df91:     	cvtsi2ss	%rcx, %xmm0
14554df96:     	addss	%xmm0, %xmm0
14554df9a:     	cmpq	$0x1, %rsi
14554df9e:     	movq	%rsi, %rax
14554dfa1:     	adcq	$0x0, %rax
14554dfa5:     	testq	%r14, %r14
14554dfa8:     	js	0x14554dfc0 <.text+0x554cfc0>
14554dfaa:     	xorps	%xmm1, %xmm1
14554dfad:     	cvtsi2ss	%r14, %xmm1
14554dfb2:     	jmp	0x14554dfdb <.text+0x554cfdb>
14554dfb4:     	nopw	%cs:(%rax,%rax)
14554dfc0:     	movq	%r14, %rcx
14554dfc3:     	shrq	%rcx
14554dfc6:     	movl	%r14d, %edx
14554dfc9:     	andl	$0x1, %edx
14554dfcc:     	orq	%rcx, %rdx
14554dfcf:     	xorps	%xmm1, %xmm1
14554dfd2:     	cvtsi2ss	%rdx, %xmm1
14554dfd7:     	addss	%xmm1, %xmm1
14554dfdb:     	cmpq	$0x1, %rbx
14554dfdf:     	movq	%rbx, %rcx
14554dfe2:     	adcq	$0x0, %rcx
14554dfe6:     	testq	%rax, %rax
14554dfe9:     	jns	0x14554dd40 <.text+0x554cd40>
14554dfef:     	movq	%rax, %rdx
14554dff2:     	shrq	%rdx
14554dff5:     	andl	$0x1, %eax
14554dff8:     	orq	%rdx, %rax
14554dffb:     	xorps	%xmm2, %xmm2
14554dffe:     	cvtsi2ss	%rax, %xmm2
14554e003:     	addss	%xmm2, %xmm2
14554e007:     	jmp	0x14554dd48 <.text+0x554cd48>
14554e00c:     	nopl	(%rax)
14554e010:     	cmpq	%rdx, %rbx
14554e013:     	je	0x14554df50 <.text+0x554cf50>
14554e019:     	xorl	%r8d, %r8d
14554e01c:     	cmpl	(%rcx,%rdx,4), %eax
14554e01f:     	sete	%r8b
14554e023:     	addq	%r8, %r14
14554e026:     	incq	%rdx
14554e029:     	jmp	0x14554e010 <.text+0x554d010>
14554e02b:     	movq	%rdi, %rax
14554e02e:     	movq	%rsi, %rdx
14554e031:     	movaps	0xc0(%rsp), %xmm6
14554e039:     	addq	$0xd8, %rsp
14554e040:     	popq	%rbx
14554e041:     	popq	%rbp
14554e042:     	popq	%rdi
14554e043:     	popq	%rsi
14554e044:     	popq	%r12
14554e046:     	popq	%r13
14554e048:     	popq	%r14
14554e04a:     	popq	%r15
14554e04c:     	retq

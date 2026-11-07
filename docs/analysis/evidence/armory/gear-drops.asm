
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453de990:     	pushq	%rbp
1453de991:     	pushq	%r15
1453de993:     	pushq	%r14
1453de995:     	pushq	%r13
1453de997:     	pushq	%r12
1453de999:     	pushq	%rsi
1453de99a:     	pushq	%rdi
1453de99b:     	pushq	%rbx
1453de99c:     	subq	$0xe8, %rsp
1453de9a3:     	leaq	0x80(%rsp), %rbp
1453de9ab:     	movaps	%xmm7, 0x50(%rbp)
1453de9af:     	movaps	%xmm6, 0x40(%rbp)
1453de9b3:     	movq	$-0x2, 0x38(%rbp)
1453de9bb:     	movq	%rcx, %rsi
1453de9be:     	movb	%dl, 0x37(%rbp)
1453de9c1:     	cmpq	$0x9, %r8
1453de9c5:     	setb	%al
1453de9c8:     	cmpq	$0x5, %r9
1453de9cc:     	setb	%cl
1453de9cf:     	testb	%cl, %al
1453de9d1:     	je	0x1453dea4a <.text+0x53dda4a>
1453de9d3:     	imulq	$0xb8, %r8, %rcx
1453de9da:     	leaq	0x12f4027(%rip), %rax   # 0x1466d2a08
1453de9e1:     	movq	0x58(%rcx,%rax), %rcx
1453de9e6:     	leaq	0x12ea233(%rip), %r10   # 0x1466c8c20
1453de9ed:     	movq	(%r10,%r8,8), %r12
1453de9f1:     	movq	%r12, 0x10(%rbp)
1453de9f5:     	imulq	$0x58, %r9, %r10
1453de9f9:     	leaq	0x12eabd0(%rip), %r11   # 0x1466c95d0
1453dea00:     	movss	(%r11,%r12,4), %xmm6
1453dea06:     	movss	%xmm6, 0x30(%rbp)
1453dea0b:     	cmpb	$0x0, 0x54(%rcx,%r10)
1453dea11:     	je	0x1453dea66 <.text+0x53dda66>
1453dea13:     	leal	-0x1(%rdx), %eax
1453dea16:     	cmpb	$0xa, %al
1453dea18:     	ja	0x1453deb4f <.text+0x53ddb4f>
1453dea1e:     	movzbl	%al, %eax
1453dea21:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453dea26:     	btl	%eax, %ecx
1453dea29:     	jae	0x1453deb4f <.text+0x53ddb4f>
1453dea2f:     	leaq	0x12fb20a(%rip), %rcx   # 0x1466d9c40
1453dea36:     	movq	(%rcx,%rax,8), %rax
1453dea3a:     	movq	0x80(%rax), %r14
1453dea41:     	addq	$0x8, %r14
1453dea45:     	jmp	0x1453deb52 <.text+0x53ddb52>
1453dea4a:     	movq	$0x0, (%rsi)
1453dea51:     	movq	$0x4, 0x8(%rsi)
1453dea59:     	movq	$0x0, 0x10(%rsi)
1453dea61:     	jmp	0x1453ded1f <.text+0x53ddd1f>
1453dea66:     	movq	%rax, -0x58(%rbp)
1453dea6a:     	leaq	0x12f460f(%rip), %rax   # 0x1466d3080
1453dea71:     	movq	%rax, -0x50(%rbp)
1453dea75:     	movq	$0x0, -0x48(%rbp)
1453dea7d:     	leaq	0x10(%rbp), %rbx
1453dea81:     	movq	%rbx, -0x40(%rbp)
1453dea85:     	movq	$0x0, -0x38(%rbp)
1453dea8d:     	movq	$0x0, -0x18(%rbp)
1453dea95:     	leaq	0x18(%rbp), %rdi
1453dea99:     	leaq	-0x58(%rbp), %rdx
1453dea9d:     	movq	%rdi, %rcx
1453deaa0:     	movq	%r9, %r14
1453deaa3:     	movq	%r8, %r15
1453deaa6:     	callq	0x1454e1330 <.text+0x54e0330>
1453deaab:     	movq	0x20(%rbp), %rcx
1453deaaf:     	movq	0x28(%rbp), %r8
1453deab3:     	testq	%r8, %r8
1453deab6:     	je	0x1453deb92 <.text+0x53ddb92>
1453deabc:     	movq	%r15, %rax
1453deabf:     	movq	%r14, %rdx
1453deac2:     	shlq	$0x4, %r8
1453deac6:     	addq	%rcx, %r8
1453deac9:     	xorl	%r9d, %r9d
1453deacc:     	movq	%rcx, %r10
1453deacf:     	jmp	0x1453deaf0 <.text+0x53ddaf0>
1453dead1:     	nopw	%cs:(%rax,%rax)
1453deae0:     	addq	$0x10, %r10
1453deae4:     	incq	%r9
1453deae7:     	cmpq	%r8, %r10
1453deaea:     	je	0x1453deb92 <.text+0x53ddb92>
1453deaf0:     	cmpq	%rax, (%r10)
1453deaf3:     	jne	0x1453deae0 <.text+0x53ddae0>
1453deaf5:     	cmpq	%rdx, 0x8(%r10)
1453deaf9:     	jne	0x1453deae0 <.text+0x53ddae0>
1453deafb:     	movq	%r9, 0x8(%rbp)
1453deaff:     	movq	%rdi, -0x58(%rbp)
1453deb03:     	leaq	0x8(%rbp), %rax
1453deb07:     	movq	%rax, -0x50(%rbp)
1453deb0b:     	movq	$0x0, -0x48(%rbp)
1453deb13:     	movq	$0x8, -0x40(%rbp)
1453deb1b:     	leaq	0x37(%rbp), %rax
1453deb1f:     	movq	%rax, -0x38(%rbp)
1453deb23:     	movq	%rbx, -0x30(%rbp)
1453deb27:     	leaq	0x30(%rbp), %rax
1453deb2b:     	movq	%rax, -0x28(%rbp)
1453deb2f:     	leaq	-0x58(%rbp), %rdx
1453deb33:     	movq	%rsi, %rcx
1453deb36:     	callq	0x1454dcf90 <.text+0x54dbf90>
1453deb3b:     	nop
1453deb3c:     	movq	0x18(%rbp), %rdx
1453deb40:     	testq	%rdx, %rdx
1453deb43:     	je	0x1453ded1f <.text+0x53ddd1f>
1453deb49:     	movq	0x20(%rbp), %rcx
1453deb4d:     	jmp	0x1453debb6 <.text+0x53ddbb6>
1453deb4f:     	xorl	%r14d, %r14d
1453deb52:     	xorl	%ebx, %ebx
1453deb54:     	movq	%r14, %r15
1453deb57:     	subq	$0x8, %r15
1453deb5b:     	cmovbq	%rbx, %r15
1453deb5f:     	leaq	(,%r15,8), %rdi
1453deb67:     	movq	%r15, %rax
1453deb6a:     	shrq	$0x3d, %rax
1453deb6e:     	setne	%al
1453deb71:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
1453deb7b:     	cmpq	%rcx, %rdi
1453deb7e:     	seta	%cl
1453deb81:     	orb	%al, %cl
1453deb83:     	je	0x1453debca <.text+0x53ddbca>
1453deb85:     	movq	%rbx, %rcx
1453deb88:     	movq	%rdi, %rdx
1453deb8b:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1453deb90:     	ud2
1453deb92:     	movq	$0x0, (%rsi)
1453deb99:     	movq	$0x4, 0x8(%rsi)
1453deba1:     	movq	$0x0, 0x10(%rsi)
1453deba9:     	movq	0x18(%rbp), %rdx
1453debad:     	testq	%rdx, %rdx
1453debb0:     	je	0x1453ded1f <.text+0x53ddd1f>
1453debb6:     	shlq	$0x4, %rdx
1453debba:     	movl	$0x8, %r8d
1453debc0:     	callq	0x1400021d0 <.text+0x11d0>
1453debc5:     	jmp	0x1453ded1f <.text+0x53ddd1f>
1453debca:     	testq	%rdi, %rdi
1453debcd:     	je	0x1453dec2a <.text+0x53ddc2a>
1453debcf:     	movq	%rdx, %r13
1453debd2:     	callq	0x140002200 <.text+0x1200>
1453debd7:     	movl	$0x4, %ebx
1453debdc:     	movl	$0x4, %edx
1453debe1:     	movq	%rdi, %rcx
1453debe4:     	callq	0x1400021c0 <.text+0x11c0>
1453debe9:     	testq	%rax, %rax
1453debec:     	je	0x1453deb85 <.text+0x53ddb85>
1453debee:     	movq	%r13, %rdx
1453debf1:     	cmpq	$0x9, %r14
1453debf5:     	jb	0x1453dec38 <.text+0x53ddc38>
1453debf7:     	movzbl	%dl, %ecx
1453debfa:     	imull	$0x3e8, %ecx, %edx      # imm = 0x3E8
1453dec00:     	cmpq	$0x4, %r12
1453dec04:     	movl	$0x4, %ecx
1453dec09:     	cmovbq	%r12, %rcx
1453dec0d:     	addl	%ecx, %ecx
1453dec0f:     	leal	(%rcx,%rcx,4), %r8d
1453dec13:     	leaq	-0x8(%r14), %r10
1453dec17:     	cmpq	$0x4, %r10
1453dec1b:     	jae	0x1453dec3f <.text+0x53ddc3f>
1453dec1d:     	movl	$0x8, %r9d
1453dec23:     	xorl	%ecx, %ecx
1453dec25:     	jmp	0x1453dece8 <.text+0x53ddce8>
1453dec2a:     	movl	$0x4, %eax
1453dec2f:     	xorl	%r15d, %r15d
1453dec32:     	cmpq	$0x9, %r14
1453dec36:     	jae	0x1453debf7 <.text+0x53ddbf7>
1453dec38:     	xorl	%ecx, %ecx
1453dec3a:     	jmp	0x1453ded14 <.text+0x53ddd14>
1453dec3f:     	leal	(%rdx,%r8), %r11d
1453dec43:     	addl	$0x186a0, %r11d         # imm = 0x186A0
1453dec4a:     	movq	%r10, %rcx
1453dec4d:     	andq	$-0x4, %rcx
1453dec51:     	leaq	0x8(%rcx), %r9
1453dec55:     	movd	%r11d, %xmm0
1453dec5a:     	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
1453dec5f:     	movdqa	0x12e9d79(%rip), %xmm1  # 0x1466c89e0
1453dec67:     	paddd	%xmm0, %xmm1
1453dec6b:     	movq	0x12e9d7d(%rip), %xmm2  # 0x1466c89f0
1453dec73:     	xorl	%r11d, %r11d
1453dec76:     	movdqa	0x12e9d82(%rip), %xmm3  # 0x1466c8a00
1453dec7e:     	movdqa	0x91859a(%rip), %xmm4   # 0x145cf7220
1453dec86:     	nopw	%cs:(%rax,%rax)
1453dec90:     	movdqa	%xmm2, %xmm5
1453dec94:     	pmuludq	%xmm3, %xmm5
1453dec98:     	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
1453dec9d:     	pshufd	$0xf5, %xmm2, %xmm7     # xmm7 = xmm2[1,1,3,3]
1453deca2:     	pmuludq	%xmm3, %xmm7
1453deca6:     	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
1453decab:     	punpckldq	%xmm7, %xmm5    # xmm5 = xmm5[0],xmm7[0],xmm5[1],xmm7[1]
1453decaf:     	movdqa	%xmm5, %xmm7
1453decb3:     	paddd	%xmm0, %xmm7
1453decb7:     	paddd	%xmm1, %xmm5
1453decbb:     	shufps	$0x4, %xmm6, %xmm7      # xmm7 = xmm7[0,1],xmm6[0,0]
1453decbf:     	shufps	$0xd8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,1,3]
1453decc3:     	movups	%xmm7, (%rax,%r11,8)
1453decc8:     	shufps	$0x4, %xmm6, %xmm5      # xmm5 = xmm5[0,1],xmm6[0,0]
1453deccc:     	shufps	$0xd8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,1,3]
1453decd0:     	movups	%xmm5, 0x10(%rax,%r11,8)
1453decd6:     	addq	$0x4, %r11
1453decda:     	paddd	%xmm4, %xmm2
1453decde:     	cmpq	%r11, %rcx
1453dece1:     	jne	0x1453dec90 <.text+0x53ddc90>
1453dece3:     	cmpq	%rcx, %r10
1453dece6:     	je	0x1453ded14 <.text+0x53ddd14>
1453dece8:     	subq	%r9, %r14
1453deceb:     	imull	$0x64, %r9d, %r9d
1453decef:     	addl	%r9d, %edx
1453decf2:     	addl	%r8d, %edx
1453decf5:     	addl	$0x186a0, %edx          # imm = 0x186A0
1453decfb:     	nopl	(%rax,%rax)
1453ded00:     	movl	%edx, (%rax,%rcx,8)
1453ded03:     	movss	%xmm6, 0x4(%rax,%rcx,8)
1453ded09:     	incq	%rcx
1453ded0c:     	addl	$0x64, %edx
1453ded0f:     	decq	%r14
1453ded12:     	jne	0x1453ded00 <.text+0x53ddd00>
1453ded14:     	movq	%r15, (%rsi)
1453ded17:     	movq	%rax, 0x8(%rsi)
1453ded1b:     	movq	%rcx, 0x10(%rsi)
1453ded1f:     	movq	%rsi, %rax
1453ded22:     	movaps	0x40(%rbp), %xmm6
1453ded26:     	movaps	0x50(%rbp), %xmm7
1453ded2a:     	addq	$0xe8, %rsp
1453ded31:     	popq	%rbx
1453ded32:     	popq	%rdi
1453ded33:     	popq	%rsi
1453ded34:     	popq	%r12
1453ded36:     	popq	%r13
1453ded38:     	popq	%r14
1453ded3a:     	popq	%r15
1453ded3c:     	popq	%rbp
1453ded3d:     	retq

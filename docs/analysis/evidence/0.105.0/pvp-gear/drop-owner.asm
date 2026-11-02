
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458bbdc0:     	pushq	%rbp
1458bbdc1:     	pushq	%r15
1458bbdc3:     	pushq	%r14
1458bbdc5:     	pushq	%r13
1458bbdc7:     	pushq	%r12
1458bbdc9:     	pushq	%rsi
1458bbdca:     	pushq	%rdi
1458bbdcb:     	pushq	%rbx
1458bbdcc:     	subq	$0xe8, %rsp
1458bbdd3:     	leaq	0x80(%rsp), %rbp
1458bbddb:     	movaps	%xmm7, 0x50(%rbp)
1458bbddf:     	movaps	%xmm6, 0x40(%rbp)
1458bbde3:     	movq	$-0x2, 0x38(%rbp)
1458bbdeb:     	movq	%rcx, %rsi
1458bbdee:     	movb	%dl, 0x37(%rbp)
1458bbdf1:     	cmpq	$0xc, %r8
1458bbdf5:     	setb	%al
1458bbdf8:     	cmpq	$0x5, %r9
1458bbdfc:     	setb	%cl
1458bbdff:     	testb	%cl, %al
1458bbe01:     	je	0x1458bbe7d <.text+0x58bae7d>
1458bbe03:     	imulq	$0xf0, %r8, %rcx
1458bbe0a:     	leaq	0x12ed63f(%rip), %rax   # 0x146ba9450
1458bbe11:     	movq	0x88(%rcx,%rax), %rcx
1458bbe19:     	imulq	$0x58, %r9, %r10
1458bbe1d:     	leaq	0x12fd95c(%rip), %r11   # 0x146bb9780
1458bbe24:     	movq	(%r11,%r8,8), %r12
1458bbe28:     	movq	%r12, 0x10(%rbp)
1458bbe2c:     	leaq	0x12fe309(%rip), %r11   # 0x146bba13c
1458bbe33:     	movss	(%r11,%r12,4), %xmm6
1458bbe39:     	movss	%xmm6, 0x30(%rbp)
1458bbe3e:     	cmpb	$0x0, 0x54(%rcx,%r10)
1458bbe44:     	je	0x1458bbe99 <.text+0x58bae99>
1458bbe46:     	leal	-0x1(%rdx), %eax
1458bbe49:     	cmpb	$0xa, %al
1458bbe4b:     	ja	0x1458bbf7f <.text+0x58baf7f>
1458bbe51:     	movzbl	%al, %eax
1458bbe54:     	movl	$0x5df, %ecx            # imm = 0x5DF
1458bbe59:     	btl	%eax, %ecx
1458bbe5c:     	jae	0x1458bbf7f <.text+0x58baf7f>
1458bbe62:     	leaq	0x130343f(%rip), %rcx   # 0x146bbf2a8
1458bbe69:     	movq	(%rcx,%rax,8), %rax
1458bbe6d:     	movq	0x80(%rax), %r14
1458bbe74:     	addq	$0x8, %r14
1458bbe78:     	jmp	0x1458bbf82 <.text+0x58baf82>
1458bbe7d:     	movq	$0x0, (%rsi)
1458bbe84:     	movq	$0x4, 0x8(%rsi)
1458bbe8c:     	movq	$0x0, 0x10(%rsi)
1458bbe94:     	jmp	0x1458bc14f <.text+0x58bb14f>
1458bbe99:     	movq	%rax, -0x58(%rbp)
1458bbe9d:     	leaq	0x12ee0ec(%rip), %rax   # 0x146ba9f90
1458bbea4:     	movq	%rax, -0x50(%rbp)
1458bbea8:     	movq	$0x0, -0x48(%rbp)
1458bbeb0:     	leaq	0x10(%rbp), %rbx
1458bbeb4:     	movq	%rbx, -0x40(%rbp)
1458bbeb8:     	movq	$0x0, -0x38(%rbp)
1458bbec0:     	movq	$0x0, -0x18(%rbp)
1458bbec8:     	leaq	0x18(%rbp), %rdi
1458bbecc:     	leaq	-0x58(%rbp), %rdx
1458bbed0:     	movq	%rdi, %rcx
1458bbed3:     	movq	%r9, %r14
1458bbed6:     	movq	%r8, %r15
1458bbed9:     	callq	0x14599fbe0 <.text+0x599ebe0>
1458bbede:     	movq	0x20(%rbp), %rcx
1458bbee2:     	movq	0x28(%rbp), %r8
1458bbee6:     	testq	%r8, %r8
1458bbee9:     	je	0x1458bbfc2 <.text+0x58bafc2>
1458bbeef:     	movq	%r15, %rax
1458bbef2:     	movq	%r14, %rdx
1458bbef5:     	shlq	$0x4, %r8
1458bbef9:     	addq	%rcx, %r8
1458bbefc:     	xorl	%r9d, %r9d
1458bbeff:     	movq	%rcx, %r10
1458bbf02:     	jmp	0x1458bbf20 <.text+0x58baf20>
1458bbf04:     	nopw	%cs:(%rax,%rax)
1458bbf10:     	addq	$0x10, %r10
1458bbf14:     	incq	%r9
1458bbf17:     	cmpq	%r8, %r10
1458bbf1a:     	je	0x1458bbfc2 <.text+0x58bafc2>
1458bbf20:     	cmpq	%rax, (%r10)
1458bbf23:     	jne	0x1458bbf10 <.text+0x58baf10>
1458bbf25:     	cmpq	%rdx, 0x8(%r10)
1458bbf29:     	jne	0x1458bbf10 <.text+0x58baf10>
1458bbf2b:     	movq	%r9, 0x8(%rbp)
1458bbf2f:     	movq	%rdi, -0x58(%rbp)
1458bbf33:     	leaq	0x8(%rbp), %rax
1458bbf37:     	movq	%rax, -0x50(%rbp)
1458bbf3b:     	movq	$0x0, -0x48(%rbp)
1458bbf43:     	movq	$0x8, -0x40(%rbp)
1458bbf4b:     	leaq	0x37(%rbp), %rax
1458bbf4f:     	movq	%rax, -0x38(%rbp)
1458bbf53:     	movq	%rbx, -0x30(%rbp)
1458bbf57:     	leaq	0x30(%rbp), %rax
1458bbf5b:     	movq	%rax, -0x28(%rbp)
1458bbf5f:     	leaq	-0x58(%rbp), %rdx
1458bbf63:     	movq	%rsi, %rcx
1458bbf66:     	callq	0x14599b690 <.text+0x599a690>
1458bbf6b:     	nop
1458bbf6c:     	movq	0x18(%rbp), %rdx
1458bbf70:     	testq	%rdx, %rdx
1458bbf73:     	je	0x1458bc14f <.text+0x58bb14f>
1458bbf79:     	movq	0x20(%rbp), %rcx
1458bbf7d:     	jmp	0x1458bbfe6 <.text+0x58bafe6>
1458bbf7f:     	xorl	%r14d, %r14d
1458bbf82:     	xorl	%ebx, %ebx
1458bbf84:     	movq	%r14, %r15
1458bbf87:     	subq	$0x8, %r15
1458bbf8b:     	cmovbq	%rbx, %r15
1458bbf8f:     	leaq	(,%r15,8), %rdi
1458bbf97:     	movq	%r15, %rax
1458bbf9a:     	shrq	$0x3d, %rax
1458bbf9e:     	setne	%al
1458bbfa1:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
1458bbfab:     	cmpq	%rcx, %rdi
1458bbfae:     	seta	%cl
1458bbfb1:     	orb	%al, %cl
1458bbfb3:     	je	0x1458bbffa <.text+0x58baffa>
1458bbfb5:     	movq	%rbx, %rcx
1458bbfb8:     	movq	%rdi, %rdx
1458bbfbb:     	callq	0x145d6944b <.text+0x5d6844b>
1458bbfc0:     	ud2
1458bbfc2:     	movq	$0x0, (%rsi)
1458bbfc9:     	movq	$0x4, 0x8(%rsi)
1458bbfd1:     	movq	$0x0, 0x10(%rsi)
1458bbfd9:     	movq	0x18(%rbp), %rdx
1458bbfdd:     	testq	%rdx, %rdx
1458bbfe0:     	je	0x1458bc14f <.text+0x58bb14f>
1458bbfe6:     	shlq	$0x4, %rdx
1458bbfea:     	movl	$0x8, %r8d
1458bbff0:     	callq	0x1400021d0 <.text+0x11d0>
1458bbff5:     	jmp	0x1458bc14f <.text+0x58bb14f>
1458bbffa:     	testq	%rdi, %rdi
1458bbffd:     	je	0x1458bc05a <.text+0x58bb05a>
1458bbfff:     	movq	%rdx, %r13
1458bc002:     	callq	0x140002200 <.text+0x1200>
1458bc007:     	movl	$0x4, %ebx
1458bc00c:     	movl	$0x4, %edx
1458bc011:     	movq	%rdi, %rcx
1458bc014:     	callq	0x1400021c0 <.text+0x11c0>
1458bc019:     	testq	%rax, %rax
1458bc01c:     	je	0x1458bbfb5 <.text+0x58bafb5>
1458bc01e:     	movq	%r13, %rdx
1458bc021:     	cmpq	$0x9, %r14
1458bc025:     	jb	0x1458bc068 <.text+0x58bb068>
1458bc027:     	movzbl	%dl, %ecx
1458bc02a:     	imull	$0x3e8, %ecx, %edx      # imm = 0x3E8
1458bc030:     	cmpq	$0x5, %r12
1458bc034:     	movl	$0x5, %ecx
1458bc039:     	cmovbq	%r12, %rcx
1458bc03d:     	addl	%ecx, %ecx
1458bc03f:     	leal	(%rcx,%rcx,4), %r8d
1458bc043:     	leaq	-0x8(%r14), %r10
1458bc047:     	cmpq	$0x4, %r10
1458bc04b:     	jae	0x1458bc06f <.text+0x58bb06f>
1458bc04d:     	movl	$0x8, %r9d
1458bc053:     	xorl	%ecx, %ecx
1458bc055:     	jmp	0x1458bc118 <.text+0x58bb118>
1458bc05a:     	movl	$0x4, %eax
1458bc05f:     	xorl	%r15d, %r15d
1458bc062:     	cmpq	$0x9, %r14
1458bc066:     	jae	0x1458bc027 <.text+0x58bb027>
1458bc068:     	xorl	%ecx, %ecx
1458bc06a:     	jmp	0x1458bc144 <.text+0x58bb144>
1458bc06f:     	leal	(%rdx,%r8), %r11d
1458bc073:     	addl	$0x186a0, %r11d         # imm = 0x186A0
1458bc07a:     	movq	%r10, %rcx
1458bc07d:     	andq	$-0x4, %rcx
1458bc081:     	leaq	0x8(%rcx), %r9
1458bc085:     	movd	%r11d, %xmm0
1458bc08a:     	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
1458bc08f:     	movdqa	0x12fd139(%rip), %xmm1  # 0x146bb91d0
1458bc097:     	paddd	%xmm0, %xmm1
1458bc09b:     	movq	0x12fd13d(%rip), %xmm2  # 0x146bb91e0
1458bc0a3:     	xorl	%r11d, %r11d
1458bc0a6:     	movdqa	0x12fd142(%rip), %xmm3  # 0x146bb91f0
1458bc0ae:     	movdqa	0x9041ea(%rip), %xmm4   # 0x1461c02a0
1458bc0b6:     	nopw	%cs:(%rax,%rax)
1458bc0c0:     	movdqa	%xmm2, %xmm5
1458bc0c4:     	pmuludq	%xmm3, %xmm5
1458bc0c8:     	pshufd	$0xe8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,2,3]
1458bc0cd:     	pshufd	$0xf5, %xmm2, %xmm7     # xmm7 = xmm2[1,1,3,3]
1458bc0d2:     	pmuludq	%xmm3, %xmm7
1458bc0d6:     	pshufd	$0xe8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,2,3]
1458bc0db:     	punpckldq	%xmm7, %xmm5    # xmm5 = xmm5[0],xmm7[0],xmm5[1],xmm7[1]
1458bc0df:     	movdqa	%xmm5, %xmm7
1458bc0e3:     	paddd	%xmm0, %xmm7
1458bc0e7:     	paddd	%xmm1, %xmm5
1458bc0eb:     	shufps	$0x4, %xmm6, %xmm7      # xmm7 = xmm7[0,1],xmm6[0,0]
1458bc0ef:     	shufps	$0xd8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,1,3]
1458bc0f3:     	movups	%xmm7, (%rax,%r11,8)
1458bc0f8:     	shufps	$0x4, %xmm6, %xmm5      # xmm5 = xmm5[0,1],xmm6[0,0]
1458bc0fc:     	shufps	$0xd8, %xmm5, %xmm5     # xmm5 = xmm5[0,2,1,3]
1458bc100:     	movups	%xmm5, 0x10(%rax,%r11,8)
1458bc106:     	addq	$0x4, %r11
1458bc10a:     	paddd	%xmm4, %xmm2
1458bc10e:     	cmpq	%r11, %rcx
1458bc111:     	jne	0x1458bc0c0 <.text+0x58bb0c0>
1458bc113:     	cmpq	%rcx, %r10
1458bc116:     	je	0x1458bc144 <.text+0x58bb144>
1458bc118:     	subq	%r9, %r14
1458bc11b:     	imull	$0x64, %r9d, %r9d
1458bc11f:     	addl	%r9d, %edx
1458bc122:     	addl	%r8d, %edx
1458bc125:     	addl	$0x186a0, %edx          # imm = 0x186A0
1458bc12b:     	nopl	(%rax,%rax)
1458bc130:     	movl	%edx, (%rax,%rcx,8)
1458bc133:     	movss	%xmm6, 0x4(%rax,%rcx,8)
1458bc139:     	incq	%rcx
1458bc13c:     	addl	$0x64, %edx
1458bc13f:     	decq	%r14
1458bc142:     	jne	0x1458bc130 <.text+0x58bb130>
1458bc144:     	movq	%r15, (%rsi)
1458bc147:     	movq	%rax, 0x8(%rsi)
1458bc14b:     	movq	%rcx, 0x10(%rsi)
1458bc14f:     	movq	%rsi, %rax
1458bc152:     	movaps	0x40(%rbp), %xmm6
1458bc156:     	movaps	0x50(%rbp), %xmm7
1458bc15a:     	addq	$0xe8, %rsp
1458bc161:     	popq	%rbx
1458bc162:     	popq	%rdi
1458bc163:     	popq	%rsi
1458bc164:     	popq	%r12
1458bc166:     	popq	%r13
1458bc168:     	popq	%r14
1458bc16a:     	popq	%r15
1458bc16c:     	popq	%rbp
1458bc16d:     	retq

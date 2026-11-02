
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458beb10:     	pushq	%rbp
1458beb11:     	pushq	%r15
1458beb13:     	pushq	%r14
1458beb15:     	pushq	%r13
1458beb17:     	pushq	%r12
1458beb19:     	pushq	%rsi
1458beb1a:     	pushq	%rdi
1458beb1b:     	pushq	%rbx
1458beb1c:     	subq	$0x128, %rsp            # imm = 0x128
1458beb23:     	leaq	0x80(%rsp), %rbp
1458beb2b:     	movq	$-0x2, 0xa0(%rbp)
1458beb36:     	movq	%rdx, %rdi
1458beb39:     	movq	%rcx, 0x70(%rbp)
1458beb3d:     	leaq	0x4c(%rdx), %rax
1458beb41:     	movq	$0x0, 0x78(%rbp)
1458beb49:     	movq	$0x4, 0x80(%rbp)
1458beb54:     	movq	$0x0, 0x88(%rbp)
1458beb5f:     	movq	$0x0, 0x18(%rbp)
1458beb67:     	movq	$0x0, 0x38(%rbp)
1458beb6f:     	movq	%rdx, 0x58(%rbp)
1458beb73:     	movq	%rax, 0x60(%rbp)
1458beb77:     	xorl	%ebx, %ebx
1458beb79:     	leaq	-0x58(%rbp), %r14
1458beb7d:     	xorl	%r15d, %r15d
1458beb80:     	testq	%rbx, %rbx
1458beb83:     	sete	%al
1458beb86:     	movq	%rbx, %r13
1458beb89:     	movq	0x68(%rbp), %rcx
1458beb8d:     	testb	$0x1, %al
1458beb8f:     	jne	0x1458bec00 <.text+0x58bdc00>
1458beb91:     	cmpq	%rcx, %r12
1458beb94:     	movq	%rcx, 0x68(%rbp)
1458beb98:     	je	0x1458becb0 <.text+0x58bdcb0>
1458beb9e:     	leaq	0x8(%r12), %rax
1458beba3:     	movq	%rax, 0x98(%rbp)
1458bebaa:     	movq	%rax, 0x20(%rbp)
1458bebae:     	movq	(%r12), %rsi
1458bebb2:     	cmpl	$-0x1, %esi
1458bebb5:     	jne	0x1458becd1 <.text+0x58bdcd1>
1458bebbb:     	movq	0x90(%rbp), %rax
1458bebc2:     	testq	%rax, %rax
1458bebc5:     	je	0x1458bebdd <.text+0x58bdbdd>
1458bebc7:     	leaq	(,%rax,8), %rdx
1458bebcf:     	movl	$0x4, %r8d
1458bebd5:     	movq	%r13, %rcx
1458bebd8:     	callq	0x1400021d0 <.text+0x11d0>
1458bebdd:     	movq	$0x0, 0x18(%rbp)
1458bebe5:     	movl	$0x0, %r13d
1458bebeb:     	movl	$0x0, %ebx
1458bebf0:     	cmpl	$-0x1, %esi
1458bebf3:     	jne	0x1458becd4 <.text+0x58bdcd4>
1458bebf9:     	nopl	(%rax)
1458bec00:     	cmpq	$0x4c, %r15
1458bec04:     	je	0x1458beedc <.text+0x58bdedc>
1458bec0a:     	leaq	(%rdi,%r15), %rax
1458bec0e:     	addq	$0x4, %rax
1458bec12:     	movq	%rax, 0x58(%rbp)
1458bec16:     	movl	(%rdi,%r15), %edx
1458bec1a:     	movq	%r14, %rcx
1458bec1d:     	callq	0x1458bd6f0 <.text+0x58bc6f0>
1458bec22:     	nop
1458bec23:     	addq	$0x4, %r15
1458bec27:     	movq	-0x58(%rbp), %rdx
1458bec2b:     	cmpq	$-0x1, %rdx
1458bec2f:     	je	0x1458bec00 <.text+0x58bdc00>
1458bec31:     	testq	%rdx, %rdx
1458bec34:     	je	0x1458bec45 <.text+0x58bdc45>
1458bec36:     	movq	-0x50(%rbp), %rcx
1458bec3a:     	movl	$0x1, %r8d
1458bec40:     	callq	0x1400021d0 <.text+0x11d0>
1458bec45:     	movq	-0x40(%rbp), %rsi
1458bec49:     	cmpq	$-0x1, %rsi
1458bec4d:     	je	0x1458beedc <.text+0x58bdedc>
1458bec53:     	movq	-0x38(%rbp), %r12
1458bec57:     	movq	-0x30(%rbp), %rbx
1458bec5b:     	testq	%r13, %r13
1458bec5e:     	je	0x1458bec83 <.text+0x58bdc83>
1458bec60:     	cmpq	$0x0, 0x90(%rbp)
1458bec68:     	je	0x1458bec83 <.text+0x58bdc83>
1458bec6a:     	movq	0x90(%rbp), %rdx
1458bec71:     	shlq	$0x3, %rdx
1458bec75:     	movl	$0x4, %r8d
1458bec7b:     	movq	%r13, %rcx
1458bec7e:     	callq	0x1400021d0 <.text+0x11d0>
1458bec83:     	leaq	(%r12,%rbx,8), %rcx
1458bec87:     	movq	%r12, 0x18(%rbp)
1458bec8b:     	movq	%r12, 0x20(%rbp)
1458bec8f:     	movq	%rsi, 0x28(%rbp)
1458bec93:     	movq	%rcx, 0x30(%rbp)
1458bec97:     	xorl	%eax, %eax
1458bec99:     	movq	%rsi, 0x90(%rbp)
1458beca0:     	movq	%r12, %r13
1458beca3:     	testb	$0x1, %al
1458beca5:     	jne	0x1458bec00 <.text+0x58bdc00>
1458becab:     	jmp	0x1458beb91 <.text+0x58bdb91>
1458becb0:     	movl	$0xffffffff, %esi       # imm = 0xFFFFFFFF
1458becb5:     	movq	%r12, 0x98(%rbp)
1458becbc:     	movq	0x90(%rbp), %rax
1458becc3:     	testq	%rax, %rax
1458becc6:     	jne	0x1458bebc7 <.text+0x58bdbc7>
1458beccc:     	jmp	0x1458bebdd <.text+0x58bdbdd>
1458becd1:     	movq	%r13, %rbx
1458becd4:     	cmpl	$-0x1, %esi
1458becd7:     	je	0x1458beed9 <.text+0x58bded9>
1458becdd:     	movq	0x80(%rbp), %rax
1458bece4:     	movq	0x88(%rbp), %r12
1458beceb:     	leaq	(,%r12,8), %rdx
1458becf3:     	xorl	%r8d, %r8d
1458becf6:     	nopw	%cs:(%rax,%rax)
1458bed00:     	cmpq	%r8, %rdx
1458bed03:     	je	0x1458bed41 <.text+0x58bdd41>
1458bed05:     	leaq	0x8(%r8), %rcx
1458bed09:     	cmpl	%esi, (%rax,%r8)
1458bed0d:     	movq	%rcx, %r8
1458bed10:     	jne	0x1458bed00 <.text+0x58bdd00>
1458bed12:     	movq	-0x8(%rax,%rcx), %r8
1458bed17:     	movq	%r8, %rdx
1458bed1a:     	shrq	$0x20, %rdx
1458bed1e:     	movl	%esi, %r9d
1458bed21:     	xorl	%r8d, %r9d
1458bed24:     	je	0x1458bed72 <.text+0x58bdd72>
1458bed26:     	movl	%r8d, %r8d
1458bed29:     	movq	0x98(%rbp), %r12
1458bed30:     	shlq	$0x20, %rdx
1458bed34:     	orq	%r8, %rdx
1458bed37:     	movq	%rdx, -0x8(%rax,%rcx)
1458bed3c:     	jmp	0x1458beb80 <.text+0x58bdb80>
1458bed41:     	cmpq	0x78(%rbp), %r12
1458bed45:     	jne	0x1458bed58 <.text+0x58bdd58>
1458bed47:     	leaq	0x78(%rbp), %rcx
1458bed4b:     	callq	0x145bfb120 <.text+0x5bfa120>
1458bed50:     	nop
1458bed51:     	movq	0x80(%rbp), %rax
1458bed58:     	movq	%rsi, (%rax,%r12,8)
1458bed5c:     	incq	%r12
1458bed5f:     	movq	%r12, 0x88(%rbp)
1458bed66:     	movq	0x98(%rbp), %r12
1458bed6d:     	jmp	0x1458beb80 <.text+0x58bdb80>
1458bed72:     	shrq	$0x20, %rsi
1458bed76:     	movl	%r8d, %r8d
1458bed79:     	leaq	0x1300b9c(%rip), %r9    # 0x146bbf91c
1458bed80:     	movslq	(%r9,%r8,4), %r8
1458bed84:     	addq	%r9, %r8
1458bed87:     	movq	0x98(%rbp), %r12
1458bed8e:     	jmpq	*%r8
1458bed91:     	movd	%edx, %xmm0
1458bed95:     	movd	%esi, %xmm1
1458bed99:     	addss	%xmm0, %xmm1
1458bed9d:     	movd	%xmm1, %edx
1458beda1:     	xorl	%r8d, %r8d
1458beda4:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458beda6:     	addl	%esi, %edx
1458beda8:     	movl	$0xb, %r8d
1458bedae:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458bedb0:     	movd	%edx, %xmm0
1458bedb4:     	movd	%esi, %xmm1
1458bedb8:     	addss	%xmm0, %xmm1
1458bedbc:     	movd	%xmm1, %edx
1458bedc0:     	movl	$0x4, %r8d
1458bedc6:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458bedcb:     	movd	%edx, %xmm0
1458bedcf:     	movd	%esi, %xmm1
1458bedd3:     	addss	%xmm0, %xmm1
1458bedd7:     	movd	%xmm1, %edx
1458beddb:     	movl	$0xc, %r8d
1458bede1:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458bede6:     	movd	%edx, %xmm0
1458bedea:     	movd	%esi, %xmm1
1458bedee:     	addss	%xmm0, %xmm1
1458bedf2:     	movd	%xmm1, %edx
1458bedf6:     	movl	$0x9, %r8d
1458bedfc:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458bee01:     	movd	%edx, %xmm0
1458bee05:     	movd	%esi, %xmm1
1458bee09:     	addss	%xmm0, %xmm1
1458bee0d:     	movd	%xmm1, %edx
1458bee11:     	movl	$0x2, %r8d
1458bee17:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458bee1c:     	movd	%edx, %xmm0
1458bee20:     	movd	%esi, %xmm1
1458bee24:     	addss	%xmm0, %xmm1
1458bee28:     	movd	%xmm1, %edx
1458bee2c:     	movl	$0x3, %r8d
1458bee32:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458bee37:     	movd	%edx, %xmm0
1458bee3b:     	movd	%esi, %xmm1
1458bee3f:     	addss	%xmm0, %xmm1
1458bee43:     	movd	%xmm1, %edx
1458bee47:     	movl	$0x7, %r8d
1458bee4d:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458bee52:     	movd	%edx, %xmm0
1458bee56:     	movd	%esi, %xmm1
1458bee5a:     	addss	%xmm0, %xmm1
1458bee5e:     	movd	%xmm1, %edx
1458bee62:     	movl	$0x1, %r8d
1458bee68:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458bee6d:     	movd	%edx, %xmm0
1458bee71:     	movd	%esi, %xmm1
1458bee75:     	addss	%xmm0, %xmm1
1458bee79:     	movd	%xmm1, %edx
1458bee7d:     	movl	$0x5, %r8d
1458bee83:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458bee88:     	movd	%edx, %xmm0
1458bee8c:     	movd	%esi, %xmm1
1458bee90:     	addss	%xmm0, %xmm1
1458bee94:     	movd	%xmm1, %edx
1458bee98:     	movl	$0x6, %r8d
1458bee9e:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458beea3:     	movd	%edx, %xmm0
1458beea7:     	movd	%esi, %xmm1
1458beeab:     	addss	%xmm0, %xmm1
1458beeaf:     	movd	%xmm1, %edx
1458beeb3:     	movl	$0xa, %r8d
1458beeb9:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458beebe:     	movd	%edx, %xmm0
1458beec2:     	movd	%esi, %xmm1
1458beec6:     	addss	%xmm0, %xmm1
1458beeca:     	movd	%xmm1, %edx
1458beece:     	movl	$0x8, %r8d
1458beed4:     	jmp	0x1458bed30 <.text+0x58bdd30>
1458beed9:     	movq	%rbx, %r13
1458beedc:     	testq	%r13, %r13
1458beedf:     	movq	0x90(%rbp), %rdx
1458beee6:     	je	0x1458beeff <.text+0x58bdeff>
1458beee8:     	testq	%rdx, %rdx
1458beeeb:     	je	0x1458beeff <.text+0x58bdeff>
1458beeed:     	shlq	$0x3, %rdx
1458beef1:     	movl	$0x4, %r8d
1458beef7:     	movq	%r13, %rcx
1458beefa:     	callq	0x1400021d0 <.text+0x11d0>
1458beeff:     	movq	0x88(%rbp), %rcx
1458bef06:     	movq	0x70(%rbp), %rax
1458bef0a:     	movq	%rcx, 0x10(%rax)
1458bef0e:     	movups	0x78(%rbp), %xmm0
1458bef12:     	movups	%xmm0, (%rax)
1458bef15:     	addq	$0x128, %rsp            # imm = 0x128
1458bef1c:     	popq	%rbx
1458bef1d:     	popq	%rdi
1458bef1e:     	popq	%rsi
1458bef1f:     	popq	%r12
1458bef21:     	popq	%r13
1458bef23:     	popq	%r14
1458bef25:     	popq	%r15
1458bef27:     	popq	%rbp
1458bef28:     	retq

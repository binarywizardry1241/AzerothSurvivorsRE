
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145924e50:     	pushq	%rbp
145924e51:     	pushq	%r15
145924e53:     	pushq	%r14
145924e55:     	pushq	%r13
145924e57:     	pushq	%r12
145924e59:     	pushq	%rsi
145924e5a:     	pushq	%rdi
145924e5b:     	pushq	%rbx
145924e5c:     	subq	$0xe8, %rsp
145924e63:     	leaq	0x80(%rsp), %rbp
145924e6b:     	movaps	%xmm11, 0x50(%rbp)
145924e70:     	movaps	%xmm10, 0x40(%rbp)
145924e75:     	movaps	%xmm9, 0x30(%rbp)
145924e7a:     	movaps	%xmm8, 0x20(%rbp)
145924e7f:     	movaps	%xmm7, 0x10(%rbp)
145924e83:     	movaps	%xmm6, (%rbp)
145924e87:     	movq	$-0x2, -0x8(%rbp)
145924e8f:     	movq	%rcx, -0x40(%rbp)
145924e93:     	movq	0xb8(%rdx), %r12
145924e9a:     	imulq	$0x70, 0xc0(%rdx), %rax
145924ea2:     	movq	$0x0, -0x30(%rbp)
145924eaa:     	movq	$0x4, -0x28(%rbp)
145924eb2:     	movq	$0x0, -0x20(%rbp)
145924eba:     	movq	0x318(%rdx), %rdi
145924ec1:     	imulq	$0x68, 0x320(%rdx), %rcx
145924ec9:     	addq	%rdi, %rcx
145924ecc:     	movq	%rcx, -0x50(%rbp)
145924ed0:     	addq	%r12, %rax
145924ed3:     	movq	%rax, -0x58(%rbp)
145924ed7:     	movss	0x4a0(%rdx), %xmm8
145924ee0:     	addq	$0x3f8, %rdx            # imm = 0x3F8
145924ee7:     	movq	%rdx, -0x48(%rbp)
145924eeb:     	movl	$0x1, %eax
145924ef0:     	movq	%rax, -0x10(%rbp)
145924ef4:     	xorl	%r13d, %r13d
145924ef7:     	movss	0x741990(%rip), %xmm9   # 0x146066890
145924f00:     	movss	0x155355f(%rip), %xmm10 # 0x146e78468
145924f09:     	movss	0x44873e(%rip), %xmm11  # 0x145d6d650
145924f12:     	movq	$0x0, -0x18(%rbp)
145924f1a:     	movq	$0x0, -0x38(%rbp)
145924f22:     	jmp	0x145924f5b <.text+0x5923f5b>
145924f24:     	nopw	%cs:(%rax,%rax)
145924f30:     	movq	-0x28(%rbp), %r15
145924f34:     	divss	%xmm6, %xmm7
145924f38:     	leaq	(%r14,%r14,2), %rax
145924f3c:     	movl	%esi, (%r15,%rax,4)
145924f40:     	movss	%xmm7, 0x4(%r15,%rax,4)
145924f47:     	movb	%bl, 0x8(%r15,%rax,4)
145924f4c:     	incq	%r14
145924f4f:     	movq	%r14, -0x18(%rbp)
145924f53:     	movq	%r14, -0x20(%rbp)
145924f57:     	addq	$0xc, %r13
145924f5b:     	movq	-0x28(%rbp), %r15
145924f5f:     	movq	%rdi, %rdx
145924f62:     	movq	%r12, %rcx
145924f65:     	cmpq	$0x2, -0x10(%rbp)
145924f6a:     	jne	0x145924f90 <.text+0x5923f90>
145924f6c:     	movq	%rdx, %rdi
145924f6f:     	cmpq	-0x58(%rbp), %rcx
145924f73:     	je	0x1459250c0 <.text+0x59240c0>
145924f79:     	leaq	0x70(%rcx), %r12
145924f7d:     	movl	$0x2, %eax
145924f82:     	movq	%rax, -0x10(%rbp)
145924f86:     	movq	%rcx, %rbx
145924f89:     	jmp	0x145924fe0 <.text+0x5923fe0>
145924f8b:     	nopl	(%rax,%rax)
145924f90:     	testq	%rdx, %rdx
145924f93:     	je	0x145924fb0 <.text+0x5923fb0>
145924f95:     	cmpq	-0x50(%rbp), %rdx
145924f99:     	je	0x145924fb0 <.text+0x5923fb0>
145924f9b:     	leaq	0x68(%rdx), %rdi
145924f9f:     	movl	$0x1, %eax
145924fa4:     	movq	%rax, -0x10(%rbp)
145924fa8:     	movq	%rcx, %r12
145924fab:     	movq	%rdx, %rbx
145924fae:     	jmp	0x145924fe0 <.text+0x5923fe0>
145924fb0:     	movl	$0x0, %edi
145924fb5:     	cmpq	$0x1, -0x38(%rbp)
145924fba:     	je	0x145924f6f <.text+0x5923f6f>
145924fbc:     	movl	$0x1, %eax
145924fc1:     	movq	%rax, -0x10(%rbp)
145924fc5:     	xorl	%edi, %edi
145924fc7:     	movq	%rax, -0x38(%rbp)
145924fcb:     	movq	%rcx, %r12
145924fce:     	movq	-0x48(%rbp), %rbx
145924fd2:     	nopw	%cs:(%rax,%rax)
145924fe0:     	movq	(%rbx), %rsi
145924fe3:     	movl	0x40(%rsi), %r14d
145924fe7:     	movl	%r14d, %ecx
145924fea:     	callq	0x1459614e0 <.text+0x59604e0>
145924fef:     	movq	%rdi, %rdx
145924ff2:     	movq	%r12, %rcx
145924ff5:     	cmpl	$0x1, %eax
145924ff8:     	jne	0x145924f65 <.text+0x5923f65>
145924ffe:     	movaps	%xmm0, %xmm6
145925001:     	xorl	%eax, %eax
145925003:     	nopw	%cs:(%rax,%rax)
145925010:     	cmpq	%rax, %r13
145925013:     	je	0x145925030 <.text+0x5924030>
145925015:     	cmpl	%r14d, (%r15,%rax)
145925019:     	leaq	0xc(%rax), %rax
14592501d:     	jne	0x145925010 <.text+0x5924010>
14592501f:     	jmp	0x145924f5f <.text+0x5923f5f>
145925024:     	nopw	%cs:(%rax,%rax)
145925030:     	cmpb	$0x8, 0x75(%rsi)
145925034:     	jne	0x145925060 <.text+0x5924060>
145925036:     	movss	0x34(%rbx), %xmm7
14592503b:     	mulss	0x50(%rbx), %xmm7
145925040:     	mulss	0x4c(%rsi), %xmm7
145925045:     	mulss	%xmm8, %xmm7
14592504a:     	ucomiss	%xmm7, %xmm9
14592504e:     	movq	-0x18(%rbp), %r14
145925052:     	jb	0x14592507e <.text+0x592407e>
145925054:     	jmp	0x14592509d <.text+0x592409d>
145925056:     	nopw	%cs:(%rax,%rax)
145925060:     	movss	0x34(%rbx), %xmm7
145925065:     	mulss	0x50(%rbx), %xmm7
14592506a:     	mulss	0x50(%rsi), %xmm7
14592506f:     	mulss	%xmm8, %xmm7
145925074:     	ucomiss	%xmm7, %xmm9
145925078:     	movq	-0x18(%rbp), %r14
14592507c:     	jae	0x14592509d <.text+0x592409d>
14592507e:     	addss	%xmm10, %xmm7
145925083:     	divss	%xmm11, %xmm7
145925088:     	movaps	%xmm7, %xmm0
14592508b:     	callq	0x145bc98dd <.text+0x5bc88dd>
145925090:     	movaps	%xmm0, %xmm7
145925093:     	mulss	%xmm11, %xmm7
145925098:     	addss	%xmm9, %xmm7
14592509d:     	cmpb	$0x8, 0x75(%rsi)
1459250a1:     	movl	0x40(%rsi), %esi
1459250a4:     	sete	%bl
1459250a7:     	cmpq	-0x30(%rbp), %r14
1459250ab:     	jne	0x145924f34 <.text+0x5923f34>
1459250b1:     	leaq	-0x30(%rbp), %rcx
1459250b5:     	callq	0x145bfafd0 <.text+0x5bf9fd0>
1459250ba:     	nop
1459250bb:     	jmp	0x145924f30 <.text+0x5923f30>
1459250c0:     	movq	-0x20(%rbp), %rcx
1459250c4:     	movq	-0x40(%rbp), %rax
1459250c8:     	movq	%rcx, 0x10(%rax)
1459250cc:     	movups	-0x30(%rbp), %xmm0
1459250d0:     	movups	%xmm0, (%rax)
1459250d3:     	movaps	(%rbp), %xmm6
1459250d7:     	movaps	0x10(%rbp), %xmm7
1459250db:     	movaps	0x20(%rbp), %xmm8
1459250e0:     	movaps	0x30(%rbp), %xmm9
1459250e5:     	movaps	0x40(%rbp), %xmm10
1459250ea:     	movaps	0x50(%rbp), %xmm11
1459250ef:     	addq	$0xe8, %rsp
1459250f6:     	popq	%rbx
1459250f7:     	popq	%rdi
1459250f8:     	popq	%rsi
1459250f9:     	popq	%r12
1459250fb:     	popq	%r13
1459250fd:     	popq	%r14
1459250ff:     	popq	%r15
145925101:     	popq	%rbp
145925102:     	retq


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145945c10:     	pushq	%rbp
145945c11:     	pushq	%r15
145945c13:     	pushq	%r14
145945c15:     	pushq	%r13
145945c17:     	pushq	%r12
145945c19:     	pushq	%rsi
145945c1a:     	pushq	%rdi
145945c1b:     	pushq	%rbx
145945c1c:     	subq	$0x108, %rsp            # imm = 0x108
145945c23:     	leaq	0x80(%rsp), %rbp
145945c2b:     	movaps	%xmm9, 0x70(%rbp)
145945c30:     	movaps	%xmm8, 0x60(%rbp)
145945c35:     	movaps	%xmm7, 0x50(%rbp)
145945c39:     	movaps	%xmm6, 0x40(%rbp)
145945c3d:     	movq	$-0x2, 0x38(%rbp)
145945c45:     	movl	%r9d, 0x20(%rbp)
145945c49:     	movq	%r8, 0x28(%rbp)
145945c4d:     	movq	%rcx, %rsi
145945c50:     	movss	0x100(%rbp), %xmm6
145945c58:     	movq	0xf0(%rbp), %r13
145945c5f:     	movq	0xf8(%rbp), %rbx
145945c66:     	movq	(%rdx), %r12
145945c69:     	testq	%rbx, %rbx
145945c6c:     	je	0x145945d8d <.text+0x5944d8d>
145945c72:     	leaq	(,%rbx,8), %r15
145945c7a:     	movzbl	0x195(%rsi), %edi
145945c81:     	movups	0x20(%rsi), %xmm7
145945c85:     	movups	0x40(%rsi), %xmm8
145945c8a:     	xorl	%r14d, %r14d
145945c8d:     	movss	0x50715e(%rip), %xmm9   # 0x145e4cdf4
145945c96:     	jmp	0x145945cd3 <.text+0x5944cd3>
145945c98:     	nopl	(%rax,%rax)
145945ca0:     	seta	0x28(%rsp)
145945ca5:     	movb	%al, 0x20(%rsp)
145945ca9:     	movb	$0x0, 0x30(%rsp)
145945cae:     	movq	%rsi, %rcx
145945cb1:     	callq	0x145933ec0 <.text+0x5932ec0>
145945cb6:     	movb	%dil, 0x195(%rsi)
145945cbd:     	movups	%xmm7, 0x20(%rsi)
145945cc1:     	movups	%xmm8, 0x40(%rsi)
145945cc6:     	addq	$0x8, %r14
145945cca:     	cmpq	%r14, %r15
145945ccd:     	je	0x145945d8d <.text+0x5944d8d>
145945cd3:     	movq	(%r13,%r14), %rdx
145945cd8:     	movq	0x958(%rsi), %rax
145945cdf:     	movq	0x970(%rsi), %rcx
145945ce6:     	leaq	(%rcx,%rax), %r8
145945cea:     	rolq	$0x17, %r8
145945cee:     	addq	%rax, %r8
145945cf1:     	movq	0x960(%rsi), %r9
145945cf8:     	movq	%r9, %r10
145945cfb:     	shlq	$0x11, %r10
145945cff:     	movq	0x968(%rsi), %r11
145945d06:     	xorq	%rax, %r11
145945d09:     	xorq	%r9, %rcx
145945d0c:     	xorq	%r11, %r9
145945d0f:     	movq	%r9, 0x960(%rsi)
145945d16:     	xorq	%rcx, %rax
145945d19:     	movq	%rax, 0x958(%rsi)
145945d20:     	xorq	%r10, %r11
145945d23:     	movq	%r11, 0x968(%rsi)
145945d2a:     	rolq	$0x2d, %rcx
145945d2e:     	movq	%rcx, 0x970(%rsi)
145945d35:     	shrq	$0x28, %r8
145945d39:     	xorps	%xmm0, %xmm0
145945d3c:     	cvtsi2ss	%r8d, %xmm0
145945d41:     	mulss	%xmm9, %xmm0
145945d46:     	movss	0x484(%rsi), %xmm1
145945d4e:     	movss	0x488(%rsi), %xmm2
145945d56:     	mulss	%xmm6, %xmm2
145945d5a:     	movl	0x40(%r12), %r9d
145945d5f:     	movzbl	0x74(%r12), %eax
145945d65:     	movb	$0x3, 0x195(%rsi)
145945d6c:     	movq	$0x0, 0x20(%rsi)
145945d74:     	movq	$0x0, 0x40(%rsi)
145945d7c:     	ucomiss	%xmm0, %xmm1
145945d7f:     	ja	0x145945ca0 <.text+0x5944ca0>
145945d85:     	movaps	%xmm6, %xmm2
145945d88:     	jmp	0x145945ca0 <.text+0x5944ca0>
145945d8d:     	movq	0x7b0(%rsi), %rdi
145945d94:     	testq	%rdi, %rdi
145945d97:     	je	0x145946063 <.text+0x5945063>
145945d9d:     	leaq	(,%rbx,8), %rax
145945da5:     	addq	%r13, %rax
145945da8:     	movq	%rax, -0x28(%rbp)
145945dac:     	movq	(%r12), %r14
145945db0:     	movq	0x8(%r12), %r15
145945db5:     	movq	0x7a8(%rsi), %rbx
145945dbc:     	addq	$0x10, %rbx
145945dc0:     	movss	0x42aea8(%rip), %xmm7   # 0x145d70c70
145945dc8:     	jmp	0x145945dd9 <.text+0x5944dd9>
145945dca:     	nopw	(%rax,%rax)
145945dd0:     	addq	$0x40, %rbx
145945dd4:     	decq	%rdi
145945dd7:     	je	0x145945dfe <.text+0x5944dfe>
145945dd9:     	cmpb	$0xd, -0x10(%rbx)
145945ddd:     	jne	0x145945dd0 <.text+0x5944dd0>
145945ddf:     	cmpq	%r15, (%rbx)
145945de2:     	jne	0x145945dd0 <.text+0x5944dd0>
145945de4:     	movq	-0x8(%rbx), %rcx
145945de8:     	movq	%r14, %rdx
145945deb:     	movq	%r15, %r8
145945dee:     	callq	0x145bc9787 <.text+0x5bc8787>
145945df3:     	testl	%eax, %eax
145945df5:     	jne	0x145945dd0 <.text+0x5944dd0>
145945df7:     	addss	-0xc(%rbx), %xmm7
145945dfc:     	jmp	0x145945dd0 <.text+0x5944dd0>
145945dfe:     	xorps	%xmm0, %xmm0
145945e01:     	ucomiss	%xmm7, %xmm0
145945e04:     	jae	0x145946063 <.text+0x5945063>
145945e0a:     	leaq	0x558(%rsi), %rax
145945e11:     	movq	%r13, -0x20(%rbp)
145945e15:     	movq	-0x28(%rbp), %rcx
145945e19:     	movq	%rcx, -0x18(%rbp)
145945e1d:     	movq	%rax, -0x10(%rbp)
145945e21:     	movq	%rbp, %rcx
145945e24:     	leaq	-0x20(%rbp), %rdx
145945e28:     	callq	0x1459a5520 <.text+0x59a4520>
145945e2d:     	movq	0x10(%rbp), %r14
145945e31:     	testq	%r14, %r14
145945e34:     	je	0x145945e6d <.text+0x5944e6d>
145945e36:     	movq	0x560(%rsi), %rcx
145945e3d:     	imulq	$0x160, 0x568(%rsi), %rax # imm = 0x160
145945e48:     	movq	0x28(%rbp), %rdx
145945e4c:     	nopl	(%rax)
145945e50:     	testq	%rax, %rax
145945e53:     	je	0x145945e87 <.text+0x5944e87>
145945e55:     	addq	$-0x160, %rax           # imm = 0xFEA0
145945e5b:     	cmpq	%rdx, 0x88(%rcx)
145945e62:     	leaq	0x160(%rcx), %rcx
145945e69:     	jne	0x145945e50 <.text+0x5944e50>
145945e6b:     	jmp	0x145945e94 <.text+0x5944e94>
145945e6d:     	movq	(%rbp), %rdx
145945e71:     	testq	%rdx, %rdx
145945e74:     	je	0x145946063 <.text+0x5945063>
145945e7a:     	movq	0x8(%rbp), %rax
145945e7e:     	movq	%rax, 0x28(%rbp)
145945e82:     	jmp	0x145946050 <.text+0x5945050>
145945e87:     	cmpq	0x460(%rsi), %rdx
145945e8e:     	jne	0x145945f1f <.text+0x5944f1f>
145945e94:     	movq	0x8(%rbp), %r9
145945e98:     	movl	$0x2, -0x48(%rbp)
145945e9f:     	movl	$0x0, -0x34(%rbp)
145945ea6:     	movq	%r9, 0x18(%rbp)
145945eaa:     	movb	$0x1, 0x37(%rbp)
145945eae:     	leaq	-0x34(%rbp), %rax
145945eb2:     	movq	%rax, 0x30(%rsp)
145945eb7:     	leaq	-0x48(%rbp), %rax
145945ebb:     	movq	%rax, 0x28(%rsp)
145945ec0:     	movq	%r14, 0x20(%rsp)
145945ec5:     	leaq	-0x20(%rbp), %rcx
145945ec9:     	movl	0x20(%rbp), %r8d
145945ecd:     	movq	%r9, 0x28(%rbp)
145945ed1:     	callq	0x1458b5100 <.text+0x58b4100>
145945ed6:     	nop
145945ed7:     	movq	0x5e0(%rsi), %rdi
145945ede:     	cmpq	0x5d0(%rsi), %rdi
145945ee5:     	jne	0x145945ef4 <.text+0x5944ef4>
145945ee7:     	leaq	0x5d0(%rsi), %rcx
145945eee:     	callq	0x145bcb530 <.text+0x5bca530>
145945ef3:     	nop
145945ef4:     	movq	0x5d8(%rsi), %rax
145945efb:     	movq	%rdi, %rcx
145945efe:     	shlq	$0x5, %rcx
145945f02:     	movups	-0x20(%rbp), %xmm0
145945f06:     	movups	-0x10(%rbp), %xmm1
145945f0a:     	movups	%xmm1, 0x10(%rax,%rcx)
145945f0f:     	movups	%xmm0, (%rax,%rcx)
145945f13:     	incq	%rdi
145945f16:     	movq	%rdi, 0x5e0(%rsi)
145945f1d:     	jmp	0x145945f27 <.text+0x5944f27>
145945f1f:     	movq	0x8(%rbp), %rax
145945f23:     	movq	%rax, 0x28(%rbp)
145945f27:     	movq	(%rbp), %rax
145945f2b:     	movq	%rax, 0x20(%rbp)
145945f2f:     	shlq	$0x3, %r14
145945f33:     	mulss	%xmm7, %xmm6
145945f37:     	movzbl	0x195(%rsi), %ebx
145945f3e:     	movups	0x20(%rsi), %xmm7
145945f42:     	movups	0x40(%rsi), %xmm8
145945f47:     	xorl	%edi, %edi
145945f49:     	movss	0x506ea2(%rip), %xmm9   # 0x145e4cdf4
145945f52:     	nopw	%cs:(%rax,%rax)
145945f60:     	movq	0x28(%rbp), %rax
145945f64:     	movq	(%rax,%rdi), %rdx
145945f68:     	movq	0x958(%rsi), %rax
145945f6f:     	movq	0x970(%rsi), %rcx
145945f76:     	leaq	(%rcx,%rax), %r8
145945f7a:     	rolq	$0x17, %r8
145945f7e:     	addq	%rax, %r8
145945f81:     	movq	0x960(%rsi), %r9
145945f88:     	movq	%r9, %r10
145945f8b:     	shlq	$0x11, %r10
145945f8f:     	movq	0x968(%rsi), %r11
145945f96:     	xorq	%rax, %r11
145945f99:     	xorq	%r9, %rcx
145945f9c:     	xorq	%r11, %r9
145945f9f:     	movq	%r9, 0x960(%rsi)
145945fa6:     	xorq	%rcx, %rax
145945fa9:     	movq	%rax, 0x958(%rsi)
145945fb0:     	xorq	%r10, %r11
145945fb3:     	movq	%r11, 0x968(%rsi)
145945fba:     	rolq	$0x2d, %rcx
145945fbe:     	movq	%rcx, 0x970(%rsi)
145945fc5:     	shrq	$0x28, %r8
145945fc9:     	xorps	%xmm0, %xmm0
145945fcc:     	cvtsi2ss	%r8d, %xmm0
145945fd1:     	mulss	%xmm9, %xmm0
145945fd6:     	movss	0x484(%rsi), %xmm1
145945fde:     	movss	0x488(%rsi), %xmm2
145945fe6:     	mulss	%xmm6, %xmm2
145945fea:     	movl	0x40(%r12), %r9d
145945fef:     	movzbl	0x74(%r12), %eax
145945ff5:     	movb	$0x3, 0x195(%rsi)
145945ffc:     	movq	$0x0, 0x20(%rsi)
145946004:     	movq	$0x0, 0x40(%rsi)
14594600c:     	ucomiss	%xmm0, %xmm1
14594600f:     	ja	0x145946014 <.text+0x5945014>
145946011:     	movaps	%xmm6, %xmm2
145946014:     	seta	0x28(%rsp)
145946019:     	movb	%al, 0x20(%rsp)
14594601d:     	movb	$0x0, 0x30(%rsp)
145946022:     	movq	%rsi, %rcx
145946025:     	callq	0x145933ec0 <.text+0x5932ec0>
14594602a:     	nop
14594602b:     	movb	%bl, 0x195(%rsi)
145946031:     	movups	%xmm7, 0x20(%rsi)
145946035:     	movups	%xmm8, 0x40(%rsi)
14594603a:     	addq	$0x8, %rdi
14594603e:     	cmpq	%rdi, %r14
145946041:     	jne	0x145945f60 <.text+0x5944f60>
145946047:     	movq	0x20(%rbp), %rdx
14594604b:     	testq	%rdx, %rdx
14594604e:     	je	0x145946063 <.text+0x5945063>
145946050:     	shlq	$0x3, %rdx
145946054:     	movl	$0x8, %r8d
14594605a:     	movq	0x28(%rbp), %rcx
14594605e:     	callq	0x1400021d0 <.text+0x11d0>
145946063:     	movaps	0x40(%rbp), %xmm6
145946067:     	movaps	0x50(%rbp), %xmm7
14594606b:     	movaps	0x60(%rbp), %xmm8
145946070:     	movaps	0x70(%rbp), %xmm9
145946075:     	addq	$0x108, %rsp            # imm = 0x108
14594607c:     	popq	%rbx
14594607d:     	popq	%rdi
14594607e:     	popq	%rsi
14594607f:     	popq	%r12
145946081:     	popq	%r13
145946083:     	popq	%r14
145946085:     	popq	%r15
145946087:     	popq	%rbp
145946088:     	retq

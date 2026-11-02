
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140342b20:     	pushq	%rbp
140342b21:     	pushq	%r15
140342b23:     	pushq	%r14
140342b25:     	pushq	%r13
140342b27:     	pushq	%r12
140342b29:     	pushq	%rsi
140342b2a:     	pushq	%rdi
140342b2b:     	pushq	%rbx
140342b2c:     	subq	$0x148, %rsp            # imm = 0x148
140342b33:     	leaq	0x80(%rsp), %rbp
140342b3b:     	movq	$-0x2, 0xc0(%rbp)
140342b46:     	movq	%rdx, %rbx
140342b49:     	movq	%rcx, %rsi
140342b4c:     	movq	0x18(%rcx), %rax
140342b50:     	movq	0x20(%rcx), %rcx
140342b54:     	movabsq	$0x43eb10d038c2ed54, %rdx # imm = 0x43EB10D038C2ED54
140342b5e:     	xorl	%r9d, %r9d
140342b61:     	movdqa	0x55d5d77(%rip), %xmm0  # 0x1459188e0
140342b69:     	pcmpeqd	%xmm1, %xmm1
140342b6d:     	movdqa	0x5619d8b(%rip), %xmm2  # 0x14595c900
140342b75:     	andq	%rcx, %rdx
140342b78:     	movdqu	(%rax,%rdx), %xmm3
140342b7d:     	movdqa	%xmm3, %xmm4
140342b81:     	pcmpeqb	%xmm0, %xmm4
140342b85:     	pmovmskb	%xmm4, %r10d
140342b8a:     	testl	%r10d, %r10d
140342b8d:     	je	0x140342bd0 <.text+0x341bd0>
140342b8f:     	tzcntl	%r10d, %r11d
140342b94:     	addq	%rdx, %r11
140342b97:     	andq	%rcx, %r11
140342b9a:     	negq	%r11
140342b9d:     	leaq	(%r11,%r11,2), %r11
140342ba1:     	movdqu	-0x18(%rax,%r11,8), %xmm4
140342ba8:     	pcmpeqb	%xmm2, %xmm4
140342bac:     	pmovmskb	%xmm4, %edi
140342bb0:     	cmpl	$0xffff, %edi           # imm = 0xFFFF
140342bb6:     	je	0x140342beb <.text+0x341beb>
140342bb8:     	leal	-0x1(%r10), %r11d
140342bbc:     	andw	%r10w, %r11w
140342bc0:     	movl	%r11d, %r10d
140342bc3:     	jne	0x140342b8f <.text+0x341b8f>
140342bc5:     	nopw	%cs:(%rax,%rax)
140342bd0:     	pcmpeqb	%xmm1, %xmm3
140342bd4:     	pmovmskb	%xmm3, %r10d
140342bd9:     	testl	%r10d, %r10d
140342bdc:     	jne	0x140342bf8 <.text+0x341bf8>
140342bde:     	addq	%r9, %rdx
140342be1:     	addq	$0x10, %rdx
140342be5:     	addq	$0x10, %r9
140342be9:     	jmp	0x140342b75 <.text+0x341b75>
140342beb:     	leaq	(%rax,%r11,8), %rax
140342bef:     	movq	-0x8(%rax), %rdi
140342bf3:     	jmp	0x140342e46 <.text+0x341e46>
140342bf8:     	movq	%rbx, %rcx
140342bfb:     	movq	%r8, 0x80(%rbp)
140342c02:     	callq	0x140360080 <.text+0x35f080>
140342c07:     	movq	%rdx, 0xa0(%rbp)
140342c0e:     	movq	%rbx, %rcx
140342c11:     	callq	0x14024ed30 <.text+0x24dd30>
140342c16:     	movq	%rax, 0x88(%rbp)
140342c1d:     	movq	%rbx, %rcx
140342c20:     	callq	0x140204480 <.text+0x203480>
140342c25:     	movq	%rax, 0x90(%rbp)
140342c2c:     	movq	%rdx, 0x98(%rbp)
140342c33:     	movq	%rbx, %rcx
140342c36:     	callq	0x1400bfca0 <.text+0xbeca0>
140342c3b:     	movq	%rax, 0xa8(%rbp)
140342c42:     	movq	%rdx, 0xb0(%rbp)
140342c49:     	movq	%rbx, %rcx
140342c4c:     	callq	0x140361830 <.text+0x360830>
140342c51:     	movq	%rdx, 0xb8(%rbp)
140342c58:     	movq	%rbx, %rcx
140342c5b:     	callq	0x140360570 <.text+0x35f570>
140342c60:     	movq	%rdx, %r12
140342c63:     	movq	%rbx, %rcx
140342c66:     	callq	0x140361380 <.text+0x360380>
140342c6b:     	movq	%rdx, %r13
140342c6e:     	movq	%rbx, %rcx
140342c71:     	callq	0x140013cc0 <.text+0x12cc0>
140342c76:     	movq	%rax, %rdi
140342c79:     	movq	%rdx, %r14
140342c7c:     	movq	%rbx, %rcx
140342c7f:     	callq	0x140362200 <.text+0x361200>
140342c84:     	movq	%rdx, %r15
140342c87:     	movq	%rbx, %rcx
140342c8a:     	callq	0x1400135e0 <.text+0x125e0>
140342c8f:     	movq	$0x1, -0x30(%rbp)
140342c97:     	movq	0xa0(%rbp), %rcx
140342c9e:     	movq	%rcx, -0x28(%rbp)
140342ca2:     	movb	$0x1, -0x20(%rbp)
140342ca6:     	movq	%rax, -0x18(%rbp)
140342caa:     	movq	%rdx, -0x10(%rbp)
140342cae:     	movq	$0x1, -0x8(%rbp)
140342cb6:     	movq	%r15, (%rbp)
140342cba:     	movq	%rdi, 0x8(%rbp)
140342cbe:     	movq	%r14, 0x10(%rbp)
140342cc2:     	movq	$0x1, 0x18(%rbp)
140342cca:     	movq	%r13, 0x20(%rbp)
140342cce:     	movq	$0x1, 0x28(%rbp)
140342cd6:     	movq	%r12, 0x30(%rbp)
140342cda:     	movq	$0x1, 0x38(%rbp)
140342ce2:     	movq	0xb8(%rbp), %rax
140342ce9:     	movq	%rax, 0x40(%rbp)
140342ced:     	movq	0xa8(%rbp), %rax
140342cf4:     	movq	%rax, 0x48(%rbp)
140342cf8:     	movq	0xb0(%rbp), %rax
140342cff:     	movq	%rax, 0x50(%rbp)
140342d03:     	movq	0x90(%rbp), %rax
140342d0a:     	movq	%rax, 0x58(%rbp)
140342d0e:     	movq	0x98(%rbp), %rax
140342d15:     	movq	%rax, 0x60(%rbp)
140342d19:     	movq	$0x1, 0x68(%rbp)
140342d21:     	movq	0x88(%rbp), %rax
140342d28:     	movq	%rax, 0x70(%rbp)
140342d2c:     	movb	$0x1, 0x78(%rbp)
140342d30:     	leaq	-0x48(%rbp), %r14
140342d34:     	leaq	-0x30(%rbp), %rdx
140342d38:     	movq	%r14, %rcx
140342d3b:     	callq	0x1401a87f0 <.text+0x1a77f0>
140342d40:     	movq	0x10(%rsi), %rdi
140342d44:     	movq	0x18(%rbx), %rax
140342d48:     	movq	%rdi, 0x30(%rsp)
140342d4d:     	movq	%r14, 0x28(%rsp)
140342d52:     	movq	%rax, 0x20(%rsp)
140342d57:     	leaq	0x561de59(%rip), %rdx   # 0x145960bb7
140342d5e:     	leaq	-0x30(%rbp), %rcx
140342d62:     	movl	$0x14f, %r8d            # imm = 0x14F
140342d68:     	movq	0x80(%rbp), %r9
140342d6f:     	callq	0x144e6b4c0 <.text+0x4e6a4c0>
140342d74:     	cmpq	(%rsi), %rdi
140342d77:     	jne	0x140342d82 <.text+0x341d82>
140342d79:     	movq	%rsi, %rcx
140342d7c:     	callq	0x145774780 <.text+0x5773780>
140342d81:     	nop
140342d82:     	movq	0x8(%rsi), %rax
140342d86:     	leaq	(%rdi,%rdi,4), %rcx
140342d8a:     	movq	-0x10(%rbp), %rdx
140342d8e:     	movq	%rdx, 0x20(%rax,%rcx,8)
140342d93:     	movups	-0x30(%rbp), %xmm0
140342d97:     	movdqu	-0x20(%rbp), %xmm1
140342d9c:     	movdqu	%xmm1, 0x10(%rax,%rcx,8)
140342da2:     	movups	%xmm0, (%rax,%rcx,8)
140342da6:     	leaq	0x1(%rdi), %rax
140342daa:     	movq	%rax, 0x10(%rsi)
140342dae:     	movq	0x18(%rsi), %rbx
140342db2:     	movq	0x20(%rsi), %r14
140342db6:     	movabsq	$0x43eb10d038c2ed54, %r15 # imm = 0x43EB10D038C2ED54
140342dc0:     	movq	%r14, %rcx
140342dc3:     	andq	%r15, %rcx
140342dc6:     	movdqu	(%rbx,%rcx), %xmm0
140342dcb:     	pmovmskb	%xmm0, %eax
140342dcf:     	testl	%eax, %eax
140342dd1:     	je	0x140342e5d <.text+0x341e5d>
140342dd7:     	tzcntl	%eax, %eax
140342ddb:     	addq	%rcx, %rax
140342dde:     	andq	%r14, %rax
140342de1:     	movzbl	(%rbx,%rax), %ecx
140342de5:     	testb	%cl, %cl
140342de7:     	jns	0x140342e7f <.text+0x341e7f>
140342ded:     	movq	0x28(%rsi), %rdx
140342df1:     	testq	%rdx, %rdx
140342df4:     	setne	%r8b
140342df8:     	andb	$0x1, %cl
140342dfb:     	sete	%r9b
140342dff:     	orb	%r8b, %r9b
140342e02:     	je	0x140342e94 <.text+0x341e94>
140342e08:     	movzbl	%cl, %ecx
140342e0b:     	subq	%rcx, %rdx
140342e0e:     	movq	%rdx, 0x28(%rsi)
140342e12:     	leaq	-0x10(%rax), %rcx
140342e16:     	andq	%r14, %rcx
140342e19:     	movb	$0x21, (%rbx,%rax)
140342e1d:     	movb	$0x21, 0x10(%rbx,%rcx)
140342e22:     	incq	0x30(%rsi)
140342e26:     	negq	%rax
140342e29:     	leaq	(%rax,%rax,2), %rax
140342e2d:     	movabsq	$-0x4c73e98a62724ed, %rcx # imm = 0xFB38C16759D8DB13
140342e37:     	movq	%rcx, -0x18(%rbx,%rax,8)
140342e3c:     	movq	%r15, -0x10(%rbx,%rax,8)
140342e41:     	movq	%rdi, -0x8(%rbx,%rax,8)
140342e46:     	movq	%rdi, %rax
140342e49:     	addq	$0x148, %rsp            # imm = 0x148
140342e50:     	popq	%rbx
140342e51:     	popq	%rdi
140342e52:     	popq	%rsi
140342e53:     	popq	%r12
140342e55:     	popq	%r13
140342e57:     	popq	%r14
140342e59:     	popq	%r15
140342e5b:     	popq	%rbp
140342e5c:     	retq
140342e5d:     	movl	$0x10, %edx
140342e62:     	addq	%rdx, %rcx
140342e65:     	andq	%r14, %rcx
140342e68:     	movdqu	(%rbx,%rcx), %xmm0
140342e6d:     	pmovmskb	%xmm0, %eax
140342e71:     	addq	$0x10, %rdx
140342e75:     	testl	%eax, %eax
140342e77:     	jne	0x140342dd7 <.text+0x341dd7>
140342e7d:     	jmp	0x140342e62 <.text+0x341e62>
140342e7f:     	movdqa	(%rbx), %xmm0
140342e83:     	pmovmskb	%xmm0, %eax
140342e87:     	tzcntl	%eax, %eax
140342e8b:     	movzbl	(%rbx,%rax), %ecx
140342e8f:     	jmp	0x140342ded <.text+0x341ded>
140342e94:     	leaq	0x18(%rsi), %rcx
140342e98:     	leaq	0x38(%rsi), %r8
140342e9c:     	movl	$0x1, %edx
140342ea1:     	movb	$0x1, %r9b
140342ea4:     	callq	0x1458c1ee0 <.text+0x58c0ee0>
140342ea9:     	movq	0x18(%rsi), %rbx
140342ead:     	movq	0x20(%rsi), %r14
140342eb1:     	movabsq	$0x43eb10d038c2ed54, %r8 # imm = 0x43EB10D038C2ED54
140342ebb:     	movq	%rbx, %rcx
140342ebe:     	movq	%r14, %rdx
140342ec1:     	callq	0x14000efd0 <.text+0xdfd0>
140342ec6:     	movzbl	(%rbx,%rax), %ecx
140342eca:     	movq	0x28(%rsi), %rdx
140342ece:     	andb	$0x1, %cl
140342ed1:     	jmp	0x140342e08 <.text+0x341e08>

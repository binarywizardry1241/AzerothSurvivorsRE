
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145524ac0:     	pushq	%rbp
145524ac1:     	pushq	%r15
145524ac3:     	pushq	%r14
145524ac5:     	pushq	%r13
145524ac7:     	pushq	%r12
145524ac9:     	pushq	%rsi
145524aca:     	pushq	%rdi
145524acb:     	pushq	%rbx
145524acc:     	subq	$0xe8, %rsp
145524ad3:     	leaq	0x80(%rsp), %rbp
145524adb:     	movq	$-0x2, 0x60(%rbp)
145524ae3:     	movq	0x18(%rcx), %r14
145524ae7:     	movq	%r14, %rbx
145524aea:     	imulq	%r14, %rbx
145524aee:     	testq	%rbx, %rbx
145524af1:     	movq	%rdx, 0x20(%rbp)
145524af5:     	jns	0x145524b0e <.text+0x5523b0e>
145524af7:     	xorl	%esi, %esi
145524af9:     	movb	$0x1, 0x5f(%rbp)
145524afd:     	movq	%rsi, %rcx
145524b00:     	movq	%rbx, %rdx
145524b03:     	callq	0x14590379b <.text+0x590279b>
145524b08:     	nop
145524b09:     	jmp	0x145524ec9 <.text+0x5523ec9>
145524b0e:     	movq	%rdx, %r15
145524b11:     	je	0x145524b37 <.text+0x5523b37>
145524b13:     	movq	%rcx, %rdi
145524b16:     	callq	0x140002200 <.text+0x1200>
145524b1b:     	movl	$0x1, %esi
145524b20:     	movl	$0x1, %edx
145524b25:     	movq	%rbx, %rcx
145524b28:     	callq	0x1400021f0 <.text+0x11f0>
145524b2d:     	testq	%rax, %rax
145524b30:     	je	0x145524af9 <.text+0x5523af9>
145524b32:     	movq	%rdi, %rcx
145524b35:     	jmp	0x145524b3c <.text+0x5523b3c>
145524b37:     	movl	$0x1, %eax
145524b3c:     	movq	(%r15), %r9
145524b3f:     	movq	0x8(%r15), %rdx
145524b43:     	movq	0x10(%r15), %r8
145524b47:     	movq	$0x0, 0x40(%rbp)
145524b4f:     	movq	%r8, 0x48(%rbp)
145524b53:     	movq	%r9, 0x30(%rbp)
145524b57:     	movq	%rdx, 0x38(%rbp)
145524b5b:     	testq	%r8, %r8
145524b5e:     	je	0x145524b76 <.text+0x5523b76>
145524b60:     	cmpq	%r8, %r9
145524b63:     	movq	%r8, %r11
145524b66:     	cmovbq	%r9, %r11
145524b6a:     	xorl	%r10d, %r10d
145524b6d:     	subq	%r9, %r8
145524b70:     	cmovaeq	%r8, %r10
145524b74:     	jmp	0x145524b7c <.text+0x5523b7c>
145524b76:     	xorl	%r11d, %r11d
145524b79:     	xorl	%r10d, %r10d
145524b7c:     	leaq	(%rdx,%r11,8), %r11
145524b80:     	leaq	(%rdx,%r10,8), %r8
145524b84:     	movq	%rdx, %r9
145524b87:     	movq	%rbx, 0x50(%rbp)
145524b8b:     	movq	%rax, 0x28(%rbp)
145524b8f:     	cmpq	%r11, %rdx
145524b92:     	je	0x145524bb0 <.text+0x5523bb0>
145524b94:     	nopw	%cs:(%rax,%rax)
145524ba0:     	movq	%r8, %r10
145524ba3:     	movq	%r11, %r8
145524ba6:     	jmp	0x145524bbe <.text+0x5523bbe>
145524ba8:     	nopl	(%rax,%rax)
145524bb0:     	movq	%r11, %r10
145524bb3:     	cmpq	%r8, %r9
145524bb6:     	movq	%r9, %rdx
145524bb9:     	movq	%r11, %r9
145524bbc:     	je	0x145524be0 <.text+0x5523be0>
145524bbe:     	movq	(%rdx), %r11
145524bc1:     	cmpq	%rbx, %r11
145524bc4:     	jae	0x145524e7c <.text+0x5523e7c>
145524bca:     	addq	$0x8, %rdx
145524bce:     	movb	$0x1, (%rax,%r11)
145524bd3:     	movq	%r8, %r11
145524bd6:     	movq	%r10, %r8
145524bd9:     	cmpq	%r11, %rdx
145524bdc:     	jne	0x145524ba0 <.text+0x5523ba0>
145524bde:     	jmp	0x145524bb0 <.text+0x5523bb0>
145524be0:     	movq	0x8(%rcx), %r15
145524be4:     	movq	0x10(%rcx), %rsi
145524be8:     	leaq	-0x38(%rbp), %r13
145524bec:     	xorl	%edi, %edi
145524bee:     	nop
145524bf0:     	movq	0x48(%rbp), %rcx
145524bf4:     	testq	%rcx, %rcx
145524bf7:     	je	0x145524d69 <.text+0x5523d69>
145524bfd:     	movq	0x30(%rbp), %rdx
145524c01:     	movq	0x40(%rbp), %rax
145524c05:     	leaq	0x1(%rax), %r8
145524c09:     	cmpq	%rdx, %r8
145524c0c:     	cmovbq	%rdi, %rdx
145524c10:     	negq	%rdx
145524c13:     	decq	%rcx
145524c16:     	addq	%rax, %rdx
145524c19:     	incq	%rdx
145524c1c:     	movq	%rdx, 0x40(%rbp)
145524c20:     	movq	%rcx, 0x48(%rbp)
145524c24:     	testq	%r14, %r14
145524c27:     	je	0x145524e91 <.text+0x5523e91>
145524c2d:     	movq	0x38(%rbp), %rcx
145524c31:     	movq	(%rcx,%rax,8), %rcx
145524c35:     	movq	%rcx, %rax
145524c38:     	orq	%r14, %rax
145524c3b:     	shrq	$0x20, %rax
145524c3f:     	je	0x145524c50 <.text+0x5523c50>
145524c41:     	movq	%rcx, %rax
145524c44:     	xorl	%edx, %edx
145524c46:     	divq	%r14
145524c49:     	jmp	0x145524c57 <.text+0x5523c57>
145524c4b:     	nopl	(%rax,%rax)
145524c50:     	movl	%ecx, %eax
145524c52:     	xorl	%edx, %edx
145524c54:     	divl	%r14d
145524c57:     	xorl	%r8d, %r8d
145524c5a:     	testq	%rdx, %rdx
145524c5d:     	setne	%r8b
145524c61:     	leaq	-0x1(%rcx), %r9
145524c65:     	xorl	%r10d, %r10d
145524c68:     	leaq	-0x1(%r14), %r11
145524c6c:     	cmpq	%r11, %rdx
145524c6f:     	setb	%r10b
145524c73:     	leaq	0x1(%rcx), %rdx
145524c77:     	xorl	%r11d, %r11d
145524c7a:     	movq	%rcx, %rbx
145524c7d:     	subq	%r14, %rbx
145524c80:     	setae	%r11b
145524c84:     	incq	%rax
145524c87:     	xorl	%r12d, %r12d
145524c8a:     	cmpq	%r14, %rax
145524c8d:     	setb	%r12b
145524c91:     	addq	%r14, %rcx
145524c94:     	movq	%r8, -0x40(%rbp)
145524c98:     	movq	%r9, -0x38(%rbp)
145524c9c:     	movq	%r10, -0x30(%rbp)
145524ca0:     	movq	%rdx, -0x28(%rbp)
145524ca4:     	movq	%r11, -0x20(%rbp)
145524ca8:     	movq	%rbx, -0x18(%rbp)
145524cac:     	movq	%r12, -0x10(%rbp)
145524cb0:     	movq	%rcx, -0x8(%rbp)
145524cb4:     	xorl	%r12d, %r12d
145524cb7:     	cmpq	$0x4, %r12
145524cbb:     	je	0x145524bf0 <.text+0x5523bf0>
145524cc1:     	movq	%r12, %rax
145524cc4:     	shlq	$0x4, %rax
145524cc8:     	addq	%r13, %rax
145524ccb:     	nopl	(%rax,%rax)
145524cd0:     	cmpl	$0x1, -0x8(%rax)
145524cd4:     	je	0x145524cf0 <.text+0x5523cf0>
145524cd6:     	incq	%r12
145524cd9:     	addq	$0x10, %rax
145524cdd:     	cmpq	$0x4, %r12
145524ce1:     	jne	0x145524cd0 <.text+0x5523cd0>
145524ce3:     	jmp	0x145524bf0 <.text+0x5523bf0>
145524ce8:     	nopl	(%rax,%rax)
145524cf0:     	movq	(%rax), %rbx
145524cf3:     	cmpq	%rsi, %rbx
145524cf6:     	jae	0x145524ea0 <.text+0x5523ea0>
145524cfc:     	incq	%r12
145524cff:     	cmpb	$0x0, (%r15,%rbx)
145524d04:     	jne	0x145524cb7 <.text+0x5523cb7>
145524d06:     	cmpq	0x50(%rbp), %rbx
145524d0a:     	jae	0x145524eb5 <.text+0x5523eb5>
145524d10:     	movq	0x28(%rbp), %rax
145524d14:     	cmpb	$0x0, (%rax,%rbx)
145524d18:     	jne	0x145524cb7 <.text+0x5523cb7>
145524d1a:     	movq	0x28(%rbp), %rax
145524d1e:     	movb	$0x1, (%rax,%rbx)
145524d22:     	movq	0x30(%rbp), %rcx
145524d26:     	movq	0x48(%rbp), %rax
145524d2a:     	cmpq	%rcx, %rax
145524d2d:     	jne	0x145524d41 <.text+0x5523d41>
145524d2f:     	leaq	0x30(%rbp), %rcx
145524d33:     	callq	0x14047b780 <.text+0x47a780>
145524d38:     	nop
145524d39:     	movq	0x30(%rbp), %rcx
145524d3d:     	movq	0x48(%rbp), %rax
145524d41:     	leaq	0x1(%rax), %rdx
145524d45:     	movq	%rdx, 0x48(%rbp)
145524d49:     	addq	0x40(%rbp), %rax
145524d4d:     	cmpq	%rcx, %rax
145524d50:     	movl	$0x0, %edx
145524d55:     	cmovaeq	%rcx, %rdx
145524d59:     	subq	%rdx, %rax
145524d5c:     	movq	0x38(%rbp), %rcx
145524d60:     	movq	%rbx, (%rcx,%rax,8)
145524d64:     	jmp	0x145524cb7 <.text+0x5523cb7>
145524d69:     	testq	%rsi, %rsi
145524d6c:     	movq	0x50(%rbp), %rdx
145524d70:     	movq	0x28(%rbp), %rcx
145524d74:     	je	0x145524e3b <.text+0x5523e3b>
145524d7a:     	leaq	-0x1(%rsi), %rax
145524d7e:     	cmpq	%rdx, %rax
145524d81:     	movq	%rdx, %r9
145524d84:     	cmovbq	%rax, %r9
145524d88:     	cmpq	$0x20, %r9
145524d8c:     	jb	0x145524dac <.text+0x5523dac>
145524d8e:     	cmpq	%rdx, %rax
145524d91:     	cmovaeq	%rdx, %rax
145524d95:     	leaq	(%rcx,%rax), %r8
145524d99:     	incq	%r8
145524d9c:     	cmpq	%r8, %r15
145524d9f:     	jae	0x145524db4 <.text+0x5523db4>
145524da1:     	addq	%r15, %rax
145524da4:     	incq	%rax
145524da7:     	cmpq	%rcx, %rax
145524daa:     	jbe	0x145524db4 <.text+0x5523db4>
145524dac:     	movq	%rcx, %rax
145524daf:     	movq	%r15, %r10
145524db2:     	jmp	0x145524e16 <.text+0x5523e16>
145524db4:     	incq	%r9
145524db7:     	movl	%r9d, %eax
145524dba:     	andl	$0x1f, %eax
145524dbd:     	movl	$0x20, %r8d
145524dc3:     	cmovneq	%rax, %r8
145524dc7:     	subq	%r8, %r9
145524dca:     	leaq	(%rcx,%r9), %rax
145524dce:     	leaq	(%r15,%r9), %r10
145524dd2:     	xorl	%r8d, %r8d
145524dd5:     	movaps	0x4232e4(%rip), %xmm0   # 0x1459480c0
145524ddc:     	nopl	(%rax)
145524de0:     	movups	(%rcx,%r8), %xmm1
145524de5:     	movups	0x10(%rcx,%r8), %xmm2
145524deb:     	movups	(%r15,%r8), %xmm3
145524df0:     	movups	0x10(%r15,%r8), %xmm4
145524df6:     	xorps	%xmm0, %xmm1
145524df9:     	orps	%xmm3, %xmm1
145524dfc:     	xorps	%xmm0, %xmm2
145524dff:     	orps	%xmm4, %xmm2
145524e02:     	movups	%xmm1, (%r15,%r8)
145524e07:     	movups	%xmm2, 0x10(%r15,%r8)
145524e0d:     	addq	$0x20, %r8
145524e11:     	cmpq	%r8, %r9
145524e14:     	jne	0x145524de0 <.text+0x5523de0>
145524e16:     	addq	%rsi, %r15
145524e19:     	leaq	(%rcx,%rdx), %r9
145524e1d:     	nopl	(%rax)
145524e20:     	cmpq	%r9, %rax
145524e23:     	je	0x145524e3b <.text+0x5523e3b>
145524e25:     	movzbl	(%rax), %r8d
145524e29:     	xorb	$0x1, %r8b
145524e2d:     	orb	%r8b, (%r10)
145524e30:     	incq	%rax
145524e33:     	incq	%r10
145524e36:     	cmpq	%r15, %r10
145524e39:     	jne	0x145524e20 <.text+0x5523e20>
145524e3b:     	testq	%rdx, %rdx
145524e3e:     	je	0x145524e4b <.text+0x5523e4b>
145524e40:     	movl	$0x1, %r8d
145524e46:     	callq	0x1400021d0 <.text+0x11d0>
145524e4b:     	movq	0x30(%rbp), %rdx
145524e4f:     	testq	%rdx, %rdx
145524e52:     	je	0x145524e68 <.text+0x5523e68>
145524e54:     	movq	0x38(%rbp), %rcx
145524e58:     	shlq	$0x3, %rdx
145524e5c:     	movl	$0x8, %r8d
145524e62:     	callq	0x1400021d0 <.text+0x11d0>
145524e67:     	nop
145524e68:     	addq	$0xe8, %rsp
145524e6f:     	popq	%rbx
145524e70:     	popq	%rdi
145524e71:     	popq	%rsi
145524e72:     	popq	%r12
145524e74:     	popq	%r13
145524e76:     	popq	%r14
145524e78:     	popq	%r15
145524e7a:     	popq	%rbp
145524e7b:     	retq
145524e7c:     	leaq	0x180fdb5(%rip), %r8    # 0x146d34c38
145524e83:     	movq	%r11, %rcx
145524e86:     	movq	%rbx, %rdx
145524e89:     	callq	0x145903b33 <.text+0x5902b33>
145524e8e:     	nop
145524e8f:     	jmp	0x145524ec9 <.text+0x5523ec9>
145524e91:     	leaq	0x180fd58(%rip), %rcx   # 0x146d34bf0
145524e98:     	callq	0x145903e30 <.text+0x5902e30>
145524e9d:     	nop
145524e9e:     	jmp	0x145524ec9 <.text+0x5523ec9>
145524ea0:     	leaq	0x180fd61(%rip), %r8    # 0x146d34c08
145524ea7:     	movq	%rbx, %rcx
145524eaa:     	movq	%rsi, %rdx
145524ead:     	callq	0x145903b33 <.text+0x5902b33>
145524eb2:     	nop
145524eb3:     	jmp	0x145524ec9 <.text+0x5523ec9>
145524eb5:     	leaq	0x180fd64(%rip), %r8    # 0x146d34c20
145524ebc:     	movq	%rbx, %rcx
145524ebf:     	movq	0x50(%rbp), %rdx
145524ec3:     	callq	0x145903b33 <.text+0x5902b33>
145524ec8:     	nop
145524ec9:     	ud2

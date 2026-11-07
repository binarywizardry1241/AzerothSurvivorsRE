
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145441c20:     	pushq	%rbp
145441c21:     	pushq	%r15
145441c23:     	pushq	%r14
145441c25:     	pushq	%r13
145441c27:     	pushq	%r12
145441c29:     	pushq	%rsi
145441c2a:     	pushq	%rdi
145441c2b:     	pushq	%rbx
145441c2c:     	subq	$0x428, %rsp            # imm = 0x428
145441c33:     	leaq	0x80(%rsp), %rbp
145441c3b:     	movq	$-0x2, 0x3a0(%rbp)
145441c46:     	movq	%r8, %rbx
145441c49:     	movq	%rdx, %rdi
145441c4c:     	movq	%rcx, %rsi
145441c4f:     	leaq	0x198(%rbp), %rcx
145441c56:     	movl	$0x1e0, %r8d            # imm = 0x1E0
145441c5c:     	xorl	%edx, %edx
145441c5e:     	callq	0x145756dcb <.text+0x5755dcb>
145441c63:     	testq	%rbx, %rbx
145441c66:     	je	0x145441ce0 <.text+0x5440ce0>
145441c68:     	shlq	$0x4, %rbx
145441c6c:     	leaq	-0x10(%rbx), %rcx
145441c70:     	movq	%rdi, %rax
145441c73:     	testb	$0x10, %cl
145441c76:     	jne	0x145441c91 <.text+0x5440c91>
145441c78:     	leaq	0x10(%rdi), %rax
145441c7c:     	movq	(%rdi), %rdx
145441c7f:     	cmpq	$0x77, %rdx
145441c83:     	ja	0x145441c91 <.text+0x5440c91>
145441c85:     	movl	0x8(%rdi), %r8d
145441c89:     	movl	%r8d, 0x198(%rbp,%rdx,4)
145441c91:     	testq	%rcx, %rcx
145441c94:     	je	0x145441ce0 <.text+0x5440ce0>
145441c96:     	addq	%rbx, %rdi
145441c99:     	jmp	0x145441ca9 <.text+0x5440ca9>
145441c9b:     	nopl	(%rax,%rax)
145441ca0:     	addq	$0x20, %rax
145441ca4:     	cmpq	%rdi, %rax
145441ca7:     	je	0x145441ce0 <.text+0x5440ce0>
145441ca9:     	movq	(%rax), %rcx
145441cac:     	cmpq	$0x78, %rcx
145441cb0:     	jb	0x145441cc0 <.text+0x5440cc0>
145441cb2:     	movq	0x10(%rax), %rcx
145441cb6:     	cmpq	$0x77, %rcx
145441cba:     	ja	0x145441ca0 <.text+0x5440ca0>
145441cbc:     	jmp	0x145441cd4 <.text+0x5440cd4>
145441cbe:     	nop
145441cc0:     	movl	0x8(%rax), %edx
145441cc3:     	movl	%edx, 0x198(%rbp,%rcx,4)
145441cca:     	movq	0x10(%rax), %rcx
145441cce:     	cmpq	$0x77, %rcx
145441cd2:     	ja	0x145441ca0 <.text+0x5440ca0>
145441cd4:     	movl	0x18(%rax), %edx
145441cd7:     	movl	%edx, 0x198(%rbp,%rcx,4)
145441cde:     	jmp	0x145441ca0 <.text+0x5440ca0>
145441ce0:     	callq	0x140002200 <.text+0x1200>
145441ce5:     	movl	$0x20, %r14d
145441ceb:     	movl	$0x20, %ecx
145441cf0:     	movl	$0x1, %edx
145441cf5:     	callq	0x1400021c0 <.text+0x11c0>
145441cfa:     	testq	%rax, %rax
145441cfd:     	je	0x145441e24 <.text+0x5440e24>
145441d03:     	movq	%rax, %rdi
145441d06:     	leaq	-0x48(%rbp), %rcx
145441d0a:     	leaq	0x198(%rbp), %rdx
145441d11:     	movl	$0x1e0, %r8d            # imm = 0x1E0
145441d17:     	callq	0x145756ddd <.text+0x5755ddd>
145441d1c:     	movw	$0x129, %ax             # imm = 0x129
145441d20:     	movl	$0x4, %r15d
145441d26:     	leaq	0x392(%rbp), %r12
145441d2d:     	xorl	%edx, %edx
145441d2f:     	leaq	0x378(%rbp), %rbx
145441d36:     	nopw	%cs:(%rax,%rax)
145441d40:     	movl	-0x58(%rbp,%r15,4), %r13d
145441d45:     	movq	%r14, 0x378(%rbp)
145441d4c:     	movq	%rdi, 0x380(%rbp)
145441d53:     	movq	%rdx, 0x388(%rbp)
145441d5a:     	movw	%ax, 0x390(%rbp)
145441d61:     	movzwl	0x39c(%rbp), %ecx
145441d68:     	movw	%cx, 0x4(%r12)
145441d6e:     	movl	0x398(%rbp), %ecx
145441d74:     	movl	%ecx, (%r12)
145441d78:     	movq	%r14, %rcx
145441d7b:     	subq	%rdx, %rcx
145441d7e:     	cmpq	$0x3, %rcx
145441d82:     	jbe	0x145441dae <.text+0x5440dae>
145441d84:     	movl	%r13d, (%rdi,%rdx)
145441d88:     	addq	$0x4, %rdx
145441d8c:     	movzwl	0x4(%r12), %ecx
145441d92:     	movw	%cx, 0x39c(%rbp)
145441d99:     	movl	(%r12), %ecx
145441d9d:     	movl	%ecx, 0x398(%rbp)
145441da3:     	incq	%r15
145441da6:     	cmpq	$0x7c, %r15
145441daa:     	jne	0x145441d40 <.text+0x5440d40>
145441dac:     	jmp	0x145441dea <.text+0x5440dea>
145441dae:     	movq	$0x1, 0x20(%rsp)
145441db7:     	movl	$0x4, %r8d
145441dbd:     	movl	$0x1, %r9d
145441dc3:     	movq	%rbx, %rcx
145441dc6:     	callq	0x145757d40 <.text+0x5756d40>
145441dcb:     	nop
145441dcc:     	movq	0x388(%rbp), %rdx
145441dd3:     	movq	0x378(%rbp), %r14
145441dda:     	movq	0x380(%rbp), %rdi
145441de1:     	movzwl	0x390(%rbp), %eax
145441de8:     	jmp	0x145441d84 <.text+0x5440d84>
145441dea:     	movq	%r14, (%rsi)
145441ded:     	movq	%rdi, 0x8(%rsi)
145441df1:     	movq	%rdx, 0x10(%rsi)
145441df5:     	movw	%ax, 0x18(%rsi)
145441df9:     	movl	0x398(%rbp), %eax
145441dff:     	movl	%eax, 0x1a(%rsi)
145441e02:     	movzwl	0x39c(%rbp), %eax
145441e09:     	movw	%ax, 0x1e(%rsi)
145441e0d:     	movq	%rsi, %rax
145441e10:     	addq	$0x428, %rsp            # imm = 0x428
145441e17:     	popq	%rbx
145441e18:     	popq	%rdi
145441e19:     	popq	%rsi
145441e1a:     	popq	%r12
145441e1c:     	popq	%r13
145441e1e:     	popq	%r14
145441e20:     	popq	%r15
145441e22:     	popq	%rbp
145441e23:     	retq
145441e24:     	movl	$0x1, %ecx
145441e29:     	movl	$0x20, %edx
145441e2e:     	callq	0x1458e721b <.text+0x58e621b>
145441e33:     	ud2

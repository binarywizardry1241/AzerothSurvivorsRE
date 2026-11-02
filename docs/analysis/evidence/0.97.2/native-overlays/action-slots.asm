
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e3d30:     	pushq	%rbp
1454e3d31:     	pushq	%r14
1454e3d33:     	pushq	%rsi
1454e3d34:     	pushq	%rdi
1454e3d35:     	pushq	%rbx
1454e3d36:     	subq	$0x60, %rsp
1454e3d3a:     	leaq	0x60(%rsp), %rbp
1454e3d3f:     	movq	$-0x2, -0x8(%rbp)
1454e3d47:     	movq	%rcx, %rsi
1454e3d4a:     	movq	0x2a0(%rcx), %rdi
1454e3d51:     	movq	%rdi, %rbx
1454e3d54:     	shlq	$0x4, %rbx
1454e3d58:     	testq	%rdi, %rdi
1454e3d5b:     	je	0x1454e3d89 <.text+0x54e2d89>
1454e3d5d:     	movq	0x298(%rsi), %r14
1454e3d64:     	callq	0x140002200 <.text+0x1200>
1454e3d69:     	movl	$0x8, %edx
1454e3d6e:     	movq	%rbx, %rcx
1454e3d71:     	callq	0x1400021c0 <.text+0x11c0>
1454e3d76:     	testq	%rax, %rax
1454e3d79:     	je	0x1454e3ebf <.text+0x54e2ebf>
1454e3d7f:     	cmpq	$0x1, %rdi
1454e3d83:     	jne	0x1454e3d90 <.text+0x54e2d90>
1454e3d85:     	xorl	%ecx, %ecx
1454e3d87:     	jmp	0x1454e3dec <.text+0x54e2dec>
1454e3d89:     	movl	$0x8, %eax
1454e3d8e:     	jmp	0x1454e3e07 <.text+0x54e2e07>
1454e3d90:     	movq	%rdi, %rdx
1454e3d93:     	andq	$-0x2, %rdx
1454e3d97:     	movq	%rax, %r8
1454e3d9a:     	addq	$0x18, %r8
1454e3d9e:     	xorl	%ecx, %ecx
1454e3da0:     	movq	%r14, %r9
1454e3da3:     	nopw	%cs:(%rax,%rax)
1454e3db0:     	movq	(%r9), %r10
1454e3db3:     	movl	0x40(%r10), %r10d
1454e3db7:     	movq	%rcx, -0x18(%r8)
1454e3dbb:     	movl	%r10d, -0x10(%r8)
1454e3dbf:     	movq	0x58(%r9), %r10
1454e3dc3:     	movl	0x40(%r10), %r10d
1454e3dc7:     	leaq	0x1(%rcx), %r11
1454e3dcb:     	movq	%r11, -0x8(%r8)
1454e3dcf:     	movl	%r10d, (%r8)
1454e3dd2:     	addq	$0x2, %rcx
1454e3dd6:     	addq	$0xb0, %r9
1454e3ddd:     	addq	$0x20, %r8
1454e3de1:     	cmpq	%rdx, %rcx
1454e3de4:     	jne	0x1454e3db0 <.text+0x54e2db0>
1454e3de6:     	testb	$0x1, %dil
1454e3dea:     	je	0x1454e3e07 <.text+0x54e2e07>
1454e3dec:     	imulq	$0x58, %rcx, %rdx
1454e3df0:     	movq	(%r14,%rdx), %rdx
1454e3df4:     	movl	0x40(%rdx), %edx
1454e3df7:     	movq	%rcx, %r8
1454e3dfa:     	shlq	$0x4, %r8
1454e3dfe:     	movq	%rcx, (%rax,%r8)
1454e3e02:     	movl	%edx, 0x8(%rax,%r8)
1454e3e07:     	movq	%rdi, -0x20(%rbp)
1454e3e0b:     	movq	%rax, -0x18(%rbp)
1454e3e0f:     	movq	%rdi, -0x10(%rbp)
1454e3e13:     	movq	0x378(%rsi), %rax
1454e3e1a:     	movl	0x40(%rax), %r14d
1454e3e1e:     	leaq	-0x20(%rbp), %rcx
1454e3e22:     	callq	0x145758200 <.text+0x5757200>
1454e3e27:     	nop
1454e3e28:     	movq	-0x18(%rbp), %rax
1454e3e2c:     	movq	$0xb, (%rax,%rbx)
1454e3e34:     	movl	%r14d, 0x8(%rax,%rbx)
1454e3e39:     	incq	%rdi
1454e3e3c:     	movq	%rdi, -0x10(%rbp)
1454e3e40:     	movq	-0x18(%rbp), %rdx
1454e3e44:     	leaq	-0x40(%rbp), %rcx
1454e3e48:     	movq	%rdi, %r8
1454e3e4b:     	callq	0x145441c20 <.text+0x5440c20>
1454e3e50:     	nop
1454e3e51:     	movq	0x548(%rsi), %rdi
1454e3e58:     	cmpq	0x538(%rsi), %rdi
1454e3e5f:     	jne	0x1454e3e6e <.text+0x54e2e6e>
1454e3e61:     	leaq	0x538(%rsi), %rcx
1454e3e68:     	callq	0x1457580b0 <.text+0x57570b0>
1454e3e6d:     	nop
1454e3e6e:     	movq	0x540(%rsi), %rax
1454e3e75:     	movq	%rdi, %rcx
1454e3e78:     	shlq	$0x5, %rcx
1454e3e7c:     	movups	-0x40(%rbp), %xmm0
1454e3e80:     	movups	-0x30(%rbp), %xmm1
1454e3e84:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e3e89:     	movups	%xmm0, (%rax,%rcx)
1454e3e8d:     	incq	%rdi
1454e3e90:     	movq	%rdi, 0x548(%rsi)
1454e3e97:     	movq	-0x20(%rbp), %rdx
1454e3e9b:     	testq	%rdx, %rdx
1454e3e9e:     	je	0x1454e3eb4 <.text+0x54e2eb4>
1454e3ea0:     	movq	-0x18(%rbp), %rcx
1454e3ea4:     	shlq	$0x4, %rdx
1454e3ea8:     	movl	$0x8, %r8d
1454e3eae:     	callq	0x1400021d0 <.text+0x11d0>
1454e3eb3:     	nop
1454e3eb4:     	addq	$0x60, %rsp
1454e3eb8:     	popq	%rbx
1454e3eb9:     	popq	%rdi
1454e3eba:     	popq	%rsi
1454e3ebb:     	popq	%r14
1454e3ebd:     	popq	%rbp
1454e3ebe:     	retq
1454e3ebf:     	movl	$0x8, %ecx
1454e3ec4:     	movq	%rbx, %rdx
1454e3ec7:     	callq	0x1458e721b <.text+0x58e621b>
1454e3ecc:     	ud2

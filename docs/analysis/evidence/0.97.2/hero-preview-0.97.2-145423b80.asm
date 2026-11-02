
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145423b80:     	pushq	%rbp
145423b81:     	pushq	%r15
145423b83:     	pushq	%r14
145423b85:     	pushq	%r13
145423b87:     	pushq	%r12
145423b89:     	pushq	%rsi
145423b8a:     	pushq	%rdi
145423b8b:     	pushq	%rbx
145423b8c:     	subq	$0x1b8, %rsp            # imm = 0x1B8
145423b93:     	leaq	0x80(%rsp), %rbp
145423b9b:     	movq	$-0x2, 0x130(%rbp)
145423ba6:     	movl	%r9d, %ebx
145423ba9:     	movq	%rdx, %r14
145423bac:     	movq	%rcx, %rsi
145423baf:     	movq	0x50(%rdx), %rax
145423bb3:     	imulq	$0xe8, 0x58(%rdx), %rcx
145423bbb:     	xorl	%edx, %edx
145423bbd:     	nopl	(%rax)
145423bc0:     	cmpq	%rdx, %rcx
145423bc3:     	je	0x145423bf8 <.text+0x5422bf8>
145423bc5:     	leaq	0xe8(%rdx), %r9
145423bcc:     	cmpb	%r8b, 0xe4(%rax,%rdx)
145423bd4:     	movq	%r9, %rdx
145423bd7:     	jne	0x145423bc0 <.text+0x5422bc0>
145423bd9:     	leaq	(%rax,%r9), %rdx
145423bdd:     	addq	$-0xe8, %rdx
145423be4:     	leaq	-0x8(%rbp), %rcx
145423be8:     	movl	$0xe8, %r8d
145423bee:     	callq	0x145756ddd <.text+0x5755ddd>
145423bf3:     	jmp	0x145423cb0 <.text+0x5422cb0>
145423bf8:     	xorps	%xmm0, %xmm0
145423bfb:     	movups	%xmm0, 0xcc(%rbp)
145423c02:     	movups	%xmm0, 0xc0(%rbp)
145423c09:     	movups	%xmm0, 0xb0(%rbp)
145423c10:     	movups	%xmm0, 0xa0(%rbp)
145423c17:     	movups	%xmm0, 0x90(%rbp)
145423c1e:     	movb	%r8b, 0xdc(%rbp)
145423c25:     	movl	$0x0, -0x8(%rbp)
145423c2c:     	movl	$0x0, (%rbp)
145423c33:     	movl	$0x0, 0x8(%rbp)
145423c3a:     	movl	$0x0, 0x10(%rbp)
145423c41:     	movl	$0x0, 0x18(%rbp)
145423c48:     	movl	$0x0, 0x20(%rbp)
145423c4f:     	movl	$0x0, 0x28(%rbp)
145423c56:     	movl	$0x0, 0x30(%rbp)
145423c5d:     	movl	$0x0, 0x38(%rbp)
145423c64:     	movl	$0x0, 0x40(%rbp)
145423c6b:     	movl	$0x0, 0x48(%rbp)
145423c72:     	movl	$0x0, 0x50(%rbp)
145423c79:     	movl	$0x0, 0x58(%rbp)
145423c80:     	movl	$0x0, 0x60(%rbp)
145423c87:     	movl	$0x0, 0x68(%rbp)
145423c8e:     	movl	$0x0, 0x70(%rbp)
145423c95:     	movl	$0x0, 0x78(%rbp)
145423c9c:     	movl	$0x0, 0x80(%rbp)
145423ca6:     	movl	$0x0, 0x88(%rbp)
145423cb0:     	movq	0x40(%r14), %rdi
145423cb4:     	leaq	(,%rdi,4), %r15
145423cbc:     	movq	%rdi, %rax
145423cbf:     	shrq	$0x3e, %rax
145423cc3:     	setne	%al
145423cc6:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
145423cd0:     	cmpq	%rcx, %r15
145423cd3:     	seta	%cl
145423cd6:     	orb	%al, %cl
145423cd8:     	je	0x145423cea <.text+0x5422cea>
145423cda:     	xorl	%r13d, %r13d
145423cdd:     	movq	%r13, %rcx
145423ce0:     	movq	%r15, %rdx
145423ce3:     	callq	0x1458e721b <.text+0x58e621b>
145423ce8:     	ud2
145423cea:     	movq	%rsi, 0xe0(%rbp)
145423cf1:     	movq	0x38(%r14), %r12
145423cf5:     	testq	%r15, %r15
145423cf8:     	je	0x145423d1f <.text+0x5422d1f>
145423cfa:     	callq	0x140002200 <.text+0x1200>
145423cff:     	movl	$0x4, %r13d
145423d05:     	movl	$0x4, %edx
145423d0a:     	movq	%r15, %rcx
145423d0d:     	callq	0x1400021c0 <.text+0x11c0>
145423d12:     	testq	%rax, %rax
145423d15:     	je	0x145423cdd <.text+0x5422cdd>
145423d17:     	movq	%rax, %rsi
145423d1a:     	movq	%rdi, %r13
145423d1d:     	jmp	0x145423d27 <.text+0x5422d27>
145423d1f:     	movl	$0x4, %esi
145423d24:     	xorl	%r13d, %r13d
145423d27:     	movq	%r13, 0x108(%rbp)
145423d2e:     	movq	%rsi, 0x110(%rbp)
145423d35:     	movq	$0x0, 0x118(%rbp)
145423d40:     	testq	%rdi, %rdi
145423d43:     	je	0x145423d5a <.text+0x5422d5a>
145423d45:     	movq	%rsi, %rcx
145423d48:     	movq	%r12, %rdx
145423d4b:     	movq	%r15, %r8
145423d4e:     	callq	0x145756ddd <.text+0x5755ddd>
145423d53:     	movq	%rdi, 0x118(%rbp)
145423d5a:     	leaq	0x156a0d7(%rip), %rax   # 0x14698de38
145423d61:     	movq	%rax, -0x58(%rbp)
145423d65:     	leaq	0x156a5cc(%rip), %rax   # 0x14698e338
145423d6c:     	movq	%rax, -0x50(%rbp)
145423d70:     	movq	%r14, -0x48(%rbp)
145423d74:     	movq	%r13, 0x100(%rbp)
145423d7b:     	leaq	0xe8(%rbp), %rcx
145423d82:     	leaq	-0x58(%rbp), %rdx
145423d86:     	callq	0x14552f6b0 <.text+0x552e6b0>
145423d8b:     	nop
145423d8c:     	movq	0xe8(%rbp), %r15
145423d93:     	movq	0xf0(%rbp), %r12
145423d9a:     	movq	0xf8(%rbp), %r14
145423da1:     	subq	%rdi, %r13
145423da4:     	cmpq	%r13, %r14
145423da7:     	ja	0x145423f02 <.text+0x5422f02>
145423dad:     	testq	%r14, %r14
145423db0:     	je	0x145423dc6 <.text+0x5422dc6>
145423db2:     	leaq	(,%r14,4), %r8
145423dba:     	leaq	(%rsi,%rdi,4), %rcx
145423dbe:     	movq	%r12, %rdx
145423dc1:     	callq	0x145756ddd <.text+0x5755ddd>
145423dc6:     	addq	%r14, %rdi
145423dc9:     	testq	%r15, %r15
145423dcc:     	je	0x145423de3 <.text+0x5422de3>
145423dce:     	shlq	$0x2, %r15
145423dd2:     	movl	$0x4, %r8d
145423dd8:     	movq	%r12, %rcx
145423ddb:     	movq	%r15, %rdx
145423dde:     	callq	0x1400021d0 <.text+0x11d0>
145423de3:     	movq	0x108(%rbp), %rax
145423dea:     	movq	%rax, 0x128(%rbp)
145423df1:     	movzbl	0xdc(%rbp), %eax
145423df8:     	movb	%al, 0x108(%rbp)
145423dfe:     	leaq	0x108(%rbp), %rax
145423e05:     	movq	%rax, 0xe8(%rbp)
145423e0c:     	movq	%rsi, 0x120(%rbp)
145423e13:     	movq	%rsi, 0xf0(%rbp)
145423e1a:     	movq	%rdi, 0xf8(%rbp)
145423e21:     	xorl	%edi, %edi
145423e23:     	leaq	-0x58(%rbp), %r14
145423e27:     	leaq	0xe8(%rbp), %r15
145423e2e:     	movq	0xe0(%rbp), %rsi
145423e35:     	jmp	0x145423e49 <.text+0x5422e49>
145423e37:     	nopw	(%rax,%rax)
145423e40:     	incq	%rdi
145423e43:     	cmpq	$0x13, %rdi
145423e47:     	je	0x145423eb7 <.text+0x5422eb7>
145423e49:     	movl	0x90(%rbp,%rdi,4), %edx
145423e50:     	testl	%edx, %edx
145423e52:     	je	0x145423e6f <.text+0x5422e6f>
145423e54:     	movq	%r15, %rcx
145423e57:     	movq	%rdi, %r8
145423e5a:     	callq	0x14541d3e0 <.text+0x541c3e0>
145423e5f:     	nop
145423e60:     	testb	%al, %al
145423e62:     	jne	0x145423e6f <.text+0x5422e6f>
145423e64:     	movl	$0x0, 0x90(%rbp,%rdi,4)
145423e6f:     	cmpl	$0x1, -0x8(%rbp,%rdi,8)
145423e74:     	jne	0x145423e40 <.text+0x5422e40>
145423e76:     	movl	-0x4(%rbp,%rdi,8), %r12d
145423e7b:     	movzbl	0x108(%rbp), %r8d
145423e83:     	movq	%r14, %rcx
145423e86:     	movl	%ebx, %edx
145423e88:     	callq	0x145459600 <.text+0x5458600>
145423e8d:     	nop
145423e8e:     	testl	%r12d, %r12d
145423e91:     	je	0x145423e40 <.text+0x5422e40>
145423e93:     	cmpl	%r12d, -0x58(%rbp,%rdi,4)
145423e98:     	je	0x145423e40 <.text+0x5422e40>
145423e9a:     	movq	%r15, %rcx
145423e9d:     	movl	%r12d, %edx
145423ea0:     	movq	%rdi, %r8
145423ea3:     	callq	0x14541d3e0 <.text+0x541c3e0>
145423ea8:     	nop
145423ea9:     	testb	%al, %al
145423eab:     	jne	0x145423e40 <.text+0x5422e40>
145423ead:     	movl	$0x0, -0x8(%rbp,%rdi,8)
145423eb5:     	jmp	0x145423e40 <.text+0x5422e40>
145423eb7:     	leaq	-0x8(%rbp), %rdx
145423ebb:     	movl	$0xe8, %r8d
145423ec1:     	movq	%rsi, %rcx
145423ec4:     	callq	0x145756ddd <.text+0x5755ddd>
145423ec9:     	movq	0x128(%rbp), %rdx
145423ed0:     	testq	%rdx, %rdx
145423ed3:     	je	0x145423eeb <.text+0x5422eeb>
145423ed5:     	shlq	$0x2, %rdx
145423ed9:     	movl	$0x4, %r8d
145423edf:     	movq	0x120(%rbp), %rcx
145423ee6:     	callq	0x1400021d0 <.text+0x11d0>
145423eeb:     	movq	%rsi, %rax
145423eee:     	addq	$0x1b8, %rsp            # imm = 0x1B8
145423ef5:     	popq	%rbx
145423ef6:     	popq	%rdi
145423ef7:     	popq	%rsi
145423ef8:     	popq	%r12
145423efa:     	popq	%r13
145423efc:     	popq	%r14
145423efe:     	popq	%r15
145423f00:     	popq	%rbp
145423f01:     	retq
145423f02:     	movq	%r12, 0x120(%rbp)
145423f09:     	movq	%r15, 0x128(%rbp)
145423f10:     	movq	$0x4, 0x20(%rsp)
145423f19:     	leaq	0x108(%rbp), %rcx
145423f20:     	movl	$0x4, %r9d
145423f26:     	movq	%rdi, %rdx
145423f29:     	movq	%r14, %r8
145423f2c:     	callq	0x145757d40 <.text+0x5756d40>
145423f31:     	nop
145423f32:     	movq	0x110(%rbp), %rsi
145423f39:     	movq	0x118(%rbp), %rdi
145423f40:     	movq	0x128(%rbp), %r15
145423f47:     	movq	0x120(%rbp), %r12
145423f4e:     	jmp	0x145423db2 <.text+0x5422db2>

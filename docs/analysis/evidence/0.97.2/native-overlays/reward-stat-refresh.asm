
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b7b80:     	pushq	%rbp
1454b7b81:     	pushq	%r15
1454b7b83:     	pushq	%r14
1454b7b85:     	pushq	%r13
1454b7b87:     	pushq	%r12
1454b7b89:     	pushq	%rsi
1454b7b8a:     	pushq	%rdi
1454b7b8b:     	pushq	%rbx
1454b7b8c:     	subq	$0x278, %rsp            # imm = 0x278
1454b7b93:     	leaq	0x80(%rsp), %rbp
1454b7b9b:     	movaps	%xmm10, 0x1e0(%rbp)
1454b7ba3:     	movaps	%xmm9, 0x1d0(%rbp)
1454b7bab:     	movaps	%xmm8, 0x1c0(%rbp)
1454b7bb3:     	movaps	%xmm7, 0x1b0(%rbp)
1454b7bba:     	movaps	%xmm6, 0x1a0(%rbp)
1454b7bc1:     	movq	$-0x2, 0x198(%rbp)
1454b7bcc:     	movq	%rcx, %rsi
1454b7bcf:     	leaq	0x130(%rcx), %rdx
1454b7bd6:     	leaq	-0x50(%rbp), %rcx
1454b7bda:     	callq	0x145415d10 <.text+0x5414d10>
1454b7bdf:     	movq	-0x18(%rbp), %rdx
1454b7be3:     	movq	-0x10(%rbp), %r15
1454b7be7:     	movq	%r15, %r8
1454b7bea:     	shlq	$0x6, %r8
1454b7bee:     	addq	%rdx, %r8
1454b7bf1:     	movb	$0x1, 0x196(%rbp)
1454b7bf8:     	leaq	0x110(%rbp), %rcx
1454b7bff:     	callq	0x14552b5a0 <.text+0x552a5a0>
1454b7c04:     	nop
1454b7c05:     	movq	0x110(%rbp), %rax
1454b7c0c:     	movq	0x120(%rbp), %r12
1454b7c13:     	testq	%rax, %rax
1454b7c16:     	je	0x1454b7c32 <.text+0x54b6c32>
1454b7c18:     	movq	0x118(%rbp), %rcx
1454b7c1f:     	shlq	$0x3, %rax
1454b7c23:     	leaq	(%rax,%rax,2), %rdx
1454b7c27:     	movl	$0x8, %r8d
1454b7c2d:     	callq	0x1400021d0 <.text+0x11d0>
1454b7c32:     	movups	(%rbp), %xmm0
1454b7c36:     	movaps	%xmm0, 0x60(%rbp)
1454b7c3a:     	movups	-0x10(%rbp), %xmm0
1454b7c3e:     	movaps	%xmm0, 0x50(%rbp)
1454b7c42:     	movups	-0x50(%rbp), %xmm0
1454b7c46:     	movups	-0x40(%rbp), %xmm1
1454b7c4a:     	movups	-0x30(%rbp), %xmm2
1454b7c4e:     	movups	-0x20(%rbp), %xmm3
1454b7c52:     	movaps	%xmm3, 0x40(%rbp)
1454b7c56:     	movaps	%xmm2, 0x30(%rbp)
1454b7c5a:     	movaps	%xmm1, 0x20(%rbp)
1454b7c5e:     	movaps	%xmm0, 0x10(%rbp)
1454b7c62:     	cmpq	$-0x1, 0x308(%rsi)
1454b7c6a:     	movq	%r15, 0x188(%rbp)
1454b7c71:     	movq	%r12, 0x178(%rbp)
1454b7c78:     	je	0x1454b7e3f <.text+0x54b6e3f>
1454b7c7e:     	movq	0x368(%rsi), %rax
1454b7c85:     	cmpq	$0x4, %rax
1454b7c89:     	movl	$0x4, %ecx
1454b7c8e:     	cmovbq	%rax, %rcx
1454b7c92:     	movl	%ecx, %eax
1454b7c94:     	leaq	0x12687b1(%rip), %rcx   # 0x14672044c
1454b7c9b:     	movss	(%rcx,%rax,4), %xmm0
1454b7ca0:     	mulss	0x43e9dc(%rip), %xmm0   # 0x1458f6684
1454b7ca8:     	addss	0x4337d0(%rip), %xmm0   # 0x1458eb480
1454b7cb0:     	movl	0x370(%rsi), %eax
1454b7cb6:     	cmpl	$0x1, %eax
1454b7cb9:     	adcl	$-0x1, %eax
1454b7cbc:     	xorps	%xmm1, %xmm1
1454b7cbf:     	cvtsi2ss	%eax, %xmm1
1454b7cc3:     	callq	0x145756e73 <.text+0x5755e73>
1454b7cc8:     	addss	%xmm0, %xmm0
1454b7ccc:     	movss	0x43e958(%rip), %xmm1   # 0x1458f662c
1454b7cd4:     	subss	%xmm0, %xmm1
1454b7cd8:     	movss	%xmm1, 0xc8(%rbp)
1454b7ce0:     	movq	0x340(%rsi), %rax
1454b7ce7:     	movq	0x348(%rsi), %rcx
1454b7cee:     	shlq	$0x6, %rcx
1454b7cf2:     	addq	%rax, %rcx
1454b7cf5:     	movq	%rax, 0x110(%rbp)
1454b7cfc:     	movq	%rcx, 0x118(%rbp)
1454b7d03:     	leaq	0xc8(%rbp), %rax
1454b7d0a:     	movq	%rax, 0x120(%rbp)
1454b7d11:     	movb	$0x1, 0x197(%rbp)
1454b7d18:     	leaq	0xe0(%rbp), %rcx
1454b7d1f:     	leaq	0x110(%rbp), %rdx
1454b7d26:     	callq	0x145535e10 <.text+0x5534e10>
1454b7d2b:     	nop
1454b7d2c:     	movq	0xe0(%rbp), %rax
1454b7d33:     	movq	%rax, 0x170(%rbp)
1454b7d3a:     	movq	0xe8(%rbp), %rax
1454b7d41:     	movq	%rax, 0x180(%rbp)
1454b7d48:     	movq	0xf0(%rbp), %rdi
1454b7d4f:     	testq	%rdi, %rdi
1454b7d52:     	je	0x1454b7e0f <.text+0x54b6e0f>
1454b7d58:     	shlq	$0x6, %rdi
1454b7d5c:     	movq	0x180(%rbp), %rbx
1454b7d63:     	addq	%rbx, %rdi
1454b7d66:     	leaq	0x111(%rbp), %r13
1454b7d6d:     	leaq	0x10(%rbp), %r14
1454b7d71:     	leaq	0x110(%rbp), %r15
1454b7d78:     	leaq	0xe0(%rbp), %r12
1454b7d7f:     	nop
1454b7d80:     	movzbl	(%rbx), %eax
1454b7d83:     	cmpb	$-0x1, %al
1454b7d85:     	je	0x1454b7e0f <.text+0x54b6e0f>
1454b7d8b:     	movb	%al, 0x110(%rbp)
1454b7d91:     	movups	0x1(%rbx), %xmm0
1454b7d95:     	movups	0x11(%rbx), %xmm1
1454b7d99:     	movups	0x21(%rbx), %xmm2
1454b7d9d:     	movups	0x30(%rbx), %xmm3
1454b7da1:     	movups	%xmm3, 0x2f(%r13)
1454b7da6:     	movups	%xmm2, 0x20(%r13)
1454b7dab:     	movups	%xmm1, 0x10(%r13)
1454b7db0:     	movups	%xmm0, (%r13)
1454b7db5:     	leaq	0xc8(%rbp), %rcx
1454b7dbc:     	leaq	0x320(%rsi), %rdx
1454b7dc3:     	callq	0x14570c440 <.text+0x570b440>
1454b7dc8:     	nop
1454b7dc9:     	movq	0xd8(%rbp), %rax
1454b7dd0:     	movq	%rax, 0xf0(%rbp)
1454b7dd7:     	movups	0xc8(%rbp), %xmm0
1454b7dde:     	movaps	%xmm0, 0xe0(%rbp)
1454b7de5:     	movups	0x350(%rsi), %xmm0
1454b7dec:     	movups	%xmm0, 0xf8(%rbp)
1454b7df3:     	movq	%r14, %rcx
1454b7df6:     	movq	%r15, %rdx
1454b7df9:     	movq	%r12, %r8
1454b7dfc:     	callq	0x145415a50 <.text+0x5414a50>
1454b7e01:     	nop
1454b7e02:     	addq	$0x40, %rbx
1454b7e06:     	cmpq	%rdi, %rbx
1454b7e09:     	jne	0x1454b7d80 <.text+0x54b6d80>
1454b7e0f:     	movq	0x170(%rbp), %rdx
1454b7e16:     	testq	%rdx, %rdx
1454b7e19:     	movq	0x178(%rbp), %r12
1454b7e20:     	movq	0x188(%rbp), %r15
1454b7e27:     	je	0x1454b7e3f <.text+0x54b6e3f>
1454b7e29:     	shlq	$0x6, %rdx
1454b7e2d:     	movl	$0x8, %r8d
1454b7e33:     	movq	0x180(%rbp), %rcx
1454b7e3a:     	callq	0x1400021d0 <.text+0x11d0>
1454b7e3f:     	movaps	0x60(%rbp), %xmm0
1454b7e43:     	movaps	%xmm0, 0x160(%rbp)
1454b7e4a:     	movaps	0x50(%rbp), %xmm0
1454b7e4e:     	movaps	%xmm0, 0x150(%rbp)
1454b7e55:     	movaps	0x10(%rbp), %xmm0
1454b7e59:     	movaps	0x20(%rbp), %xmm1
1454b7e5d:     	movaps	0x30(%rbp), %xmm2
1454b7e61:     	movaps	0x40(%rbp), %xmm3
1454b7e65:     	movaps	%xmm3, 0x140(%rbp)
1454b7e6c:     	movaps	%xmm2, 0x130(%rbp)
1454b7e73:     	movaps	%xmm1, 0x120(%rbp)
1454b7e7a:     	movaps	%xmm0, 0x110(%rbp)
1454b7e81:     	leaq	0x6c0(%rsi), %r13
1454b7e88:     	movq	%r13, %rcx
1454b7e8b:     	callq	0x145411430 <.text+0x5410430>
1454b7e90:     	movaps	0x160(%rbp), %xmm0
1454b7e97:     	movups	%xmm0, 0x710(%rsi)
1454b7e9e:     	movaps	0x150(%rbp), %xmm0
1454b7ea5:     	movups	%xmm0, 0x700(%rsi)
1454b7eac:     	movaps	0x110(%rbp), %xmm0
1454b7eb3:     	movaps	0x120(%rbp), %xmm1
1454b7eba:     	movaps	0x130(%rbp), %xmm2
1454b7ec1:     	movaps	0x140(%rbp), %xmm3
1454b7ec8:     	movups	%xmm3, 0x6f0(%rsi)
1454b7ecf:     	movups	%xmm2, 0x6e0(%rsi)
1454b7ed6:     	movups	%xmm1, 0x6d0(%rsi)
1454b7edd:     	movups	%xmm0, 0x6c0(%rsi)
1454b7ee4:     	movq	0x78(%rsi), %rbx
1454b7ee8:     	cmpq	%rbx, %r15
1454b7eeb:     	ja	0x1454b7ef4 <.text+0x54b6ef4>
1454b7eed:     	movq	%r15, 0x78(%rsi)
1454b7ef1:     	movq	%r15, %rbx
1454b7ef4:     	movq	0x700(%rsi), %rdi
1454b7efb:     	movq	%rdi, %r14
1454b7efe:     	subq	%rbx, %r14
1454b7f01:     	jbe	0x1454b7f6d <.text+0x54b6f6d>
1454b7f03:     	leaq	0x68(%rsi), %rcx
1454b7f07:     	movq	(%rcx), %rax
1454b7f0a:     	subq	%rbx, %rax
1454b7f0d:     	movq	%rbx, %r15
1454b7f10:     	cmpq	%rax, %r14
1454b7f13:     	ja	0x1454b86c4 <.text+0x54b76c4>
1454b7f19:     	movq	0x70(%rsi), %r12
1454b7f1d:     	leaq	(%r12,%r15,4), %rcx
1454b7f21:     	cmpq	$0x2, %r14
1454b7f25:     	jb	0x1454b7f53 <.text+0x54b6f53>
1454b7f27:     	movq	%rbx, %r8
1454b7f2a:     	notq	%r8
1454b7f2d:     	addq	%rdi, %r8
1454b7f30:     	shlq	$0x2, %r8
1454b7f34:     	xorl	%edx, %edx
1454b7f36:     	callq	0x145756dcb <.text+0x5755dcb>
1454b7f3b:     	addq	%r15, %rdi
1454b7f3e:     	shlq	$0x2, %rbx
1454b7f42:     	leaq	(%r12,%rdi,4), %rcx
1454b7f46:     	subq	%rbx, %rcx
1454b7f49:     	addq	$-0x4, %rcx
1454b7f4d:     	addq	%r14, %r15
1454b7f50:     	decq	%r15
1454b7f53:     	movl	$0x0, (%rcx)
1454b7f59:     	incq	%r15
1454b7f5c:     	movq	%r15, %rdi
1454b7f5f:     	movq	0x178(%rbp), %r12
1454b7f66:     	movq	0x188(%rbp), %r15
1454b7f6d:     	movq	%rdi, 0x78(%rsi)
1454b7f71:     	movq	0x90(%rsi), %rbx
1454b7f78:     	cmpq	%rbx, %r15
1454b7f7b:     	ja	0x1454b7f87 <.text+0x54b6f87>
1454b7f7d:     	movq	%r15, 0x90(%rsi)
1454b7f84:     	movq	%r15, %rbx
1454b7f87:     	movq	0x700(%rsi), %rdi
1454b7f8e:     	movq	%rdi, %r14
1454b7f91:     	subq	%rbx, %r14
1454b7f94:     	jbe	0x1454b8006 <.text+0x54b7006>
1454b7f96:     	leaq	0x80(%rsi), %rcx
1454b7f9d:     	movq	(%rcx), %rax
1454b7fa0:     	subq	%rbx, %rax
1454b7fa3:     	movq	%rbx, %r15
1454b7fa6:     	cmpq	%rax, %r14
1454b7fa9:     	ja	0x1454b8701 <.text+0x54b7701>
1454b7faf:     	movq	0x88(%rsi), %r12
1454b7fb6:     	leaq	(%r12,%r15,4), %rcx
1454b7fba:     	cmpq	$0x2, %r14
1454b7fbe:     	jb	0x1454b7fec <.text+0x54b6fec>
1454b7fc0:     	movq	%rbx, %r8
1454b7fc3:     	notq	%r8
1454b7fc6:     	addq	%rdi, %r8
1454b7fc9:     	shlq	$0x2, %r8
1454b7fcd:     	xorl	%edx, %edx
1454b7fcf:     	callq	0x145756dcb <.text+0x5755dcb>
1454b7fd4:     	addq	%r15, %rdi
1454b7fd7:     	shlq	$0x2, %rbx
1454b7fdb:     	leaq	(%r12,%rdi,4), %rcx
1454b7fdf:     	subq	%rbx, %rcx
1454b7fe2:     	addq	$-0x4, %rcx
1454b7fe6:     	addq	%r14, %r15
1454b7fe9:     	decq	%r15
1454b7fec:     	movl	$0x0, (%rcx)
1454b7ff2:     	incq	%r15
1454b7ff5:     	movq	%r15, %rdi
1454b7ff8:     	movq	0x178(%rbp), %r12
1454b7fff:     	movq	0x188(%rbp), %r15
1454b8006:     	movq	%rdi, 0x90(%rsi)
1454b800d:     	movq	0xa8(%rsi), %rdi
1454b8014:     	movq	%rdi, %rbx
1454b8017:     	subq	%r15, %rbx
1454b801a:     	jb	0x1454b806d <.text+0x54b706d>
1454b801c:     	movq	0xa0(%rsi), %rax
1454b8023:     	movq	%r15, 0xa8(%rsi)
1454b802a:     	movq	%r15, %rdi
1454b802d:     	je	0x1454b806d <.text+0x54b706d>
1454b802f:     	leaq	(%r15,%r15,2), %rcx
1454b8033:     	leaq	(%rax,%rcx,8), %rdi
1454b8037:     	addq	$0x8, %rdi
1454b803b:     	jmp	0x1454b8049 <.text+0x54b7049>
1454b803d:     	nopl	(%rax)
1454b8040:     	addq	$0x18, %rdi
1454b8044:     	decq	%rbx
1454b8047:     	je	0x1454b8066 <.text+0x54b7066>
1454b8049:     	movq	-0x8(%rdi), %rdx
1454b804d:     	testq	%rdx, %rdx
1454b8050:     	je	0x1454b8040 <.text+0x54b7040>
1454b8052:     	movq	(%rdi), %rcx
1454b8055:     	shlq	$0x2, %rdx
1454b8059:     	movl	$0x4, %r8d
1454b805f:     	callq	0x1400021d0 <.text+0x11d0>
1454b8064:     	jmp	0x1454b8040 <.text+0x54b7040>
1454b8066:     	movq	0xa8(%rsi), %rdi
1454b806d:     	movq	0x700(%rsi), %rax
1454b8074:     	movq	%rax, %rdx
1454b8077:     	subq	%rdi, %rdx
1454b807a:     	jbe	0x1454b80ba <.text+0x54b70ba>
1454b807c:     	leaq	0x98(%rsi), %rcx
1454b8083:     	movq	$0x0, 0x110(%rbp)
1454b808e:     	movq	$0x4, 0x118(%rbp)
1454b8099:     	movq	$0x0, 0x120(%rbp)
1454b80a4:     	movb	$0x0, 0x197(%rbp)
1454b80ab:     	leaq	0x110(%rbp), %r8
1454b80b2:     	callq	0x1455255e0 <.text+0x55245e0>
1454b80b7:     	nop
1454b80b8:     	jmp	0x1454b80d1 <.text+0x54b70d1>
1454b80ba:     	movq	0xa0(%rsi), %rcx
1454b80c1:     	movq	%rax, 0xa8(%rsi)
1454b80c8:     	subq	%rax, %rdi
1454b80cb:     	jne	0x1454b8196 <.text+0x54b7196>
1454b80d1:     	movq	0x60(%rsi), %rax
1454b80d5:     	testq	%rax, %rax
1454b80d8:     	je	0x1454b8109 <.text+0x54b7109>
1454b80da:     	movq	0x58(%rsi), %rcx
1454b80de:     	leaq	0x10(%rcx), %r9
1454b80e2:     	movq	%rax, %rdx
1454b80e5:     	negq	%rdx
1454b80e8:     	xorl	%r8d, %r8d
1454b80eb:     	nopl	(%rax,%rax)
1454b80f0:     	cmpq	%r15, -0x10(%r9)
1454b80f4:     	jae	0x1454b85df <.text+0x54b75df>
1454b80fa:     	incq	%r8
1454b80fd:     	addq	$0x10, %r9
1454b8101:     	movq	%rdx, %r10
1454b8104:     	addq	%r8, %r10
1454b8107:     	jne	0x1454b80f0 <.text+0x54b70f0>
1454b8109:     	cmpq	0xc0(%rsi), %r12
1454b8110:     	ja	0x1454b8119 <.text+0x54b7119>
1454b8112:     	movq	%r12, 0xc0(%rsi)
1454b8119:     	movq	0x6f8(%rsi), %rdx
1454b8120:     	movq	0x700(%rsi), %r8
1454b8127:     	shlq	$0x6, %r8
1454b812b:     	addq	%rdx, %r8
1454b812e:     	movb	$0x0, 0x197(%rbp)
1454b8135:     	leaq	0x110(%rbp), %rcx
1454b813c:     	callq	0x14552b5a0 <.text+0x552a5a0>
1454b8141:     	nop
1454b8142:     	movq	0x110(%rbp), %rax
1454b8149:     	movq	%rax, 0x180(%rbp)
1454b8150:     	movq	0x118(%rbp), %rax
1454b8157:     	movq	%rax, 0x188(%rbp)
1454b815e:     	movq	0x120(%rbp), %rcx
1454b8165:     	xorl	%eax, %eax
1454b8167:     	movq	%rcx, %rdx
1454b816a:     	subq	%r12, %rdx
1454b816d:     	cmovaeq	%rdx, %rax
1454b8171:     	movq	%r12, %rdx
1454b8174:     	subq	%rcx, %rdx
1454b8177:     	jae	0x1454b8441 <.text+0x54b7441>
1454b817d:     	movl	%eax, %ecx
1454b817f:     	andl	$0x3, %ecx
1454b8182:     	cmpq	$-0x4, %rdx
1454b8186:     	jbe	0x1454b81da <.text+0x54b71da>
1454b8188:     	xorl	%edx, %edx
1454b818a:     	movq	0x188(%rbp), %rdi
1454b8191:     	jmp	0x1454b8260 <.text+0x54b7260>
1454b8196:     	leaq	(%rax,%rax,2), %rax
1454b819a:     	leaq	(%rcx,%rax,8), %rbx
1454b819e:     	addq	$0x8, %rbx
1454b81a2:     	jmp	0x1454b81bd <.text+0x54b71bd>
1454b81a4:     	nopw	%cs:(%rax,%rax)
1454b81b0:     	addq	$0x18, %rbx
1454b81b4:     	decq	%rdi
1454b81b7:     	je	0x1454b80d1 <.text+0x54b70d1>
1454b81bd:     	movq	-0x8(%rbx), %rdx
1454b81c1:     	testq	%rdx, %rdx
1454b81c4:     	je	0x1454b81b0 <.text+0x54b71b0>
1454b81c6:     	movq	(%rbx), %rcx
1454b81c9:     	shlq	$0x2, %rdx
1454b81cd:     	movl	$0x4, %r8d
1454b81d3:     	callq	0x1400021d0 <.text+0x11d0>
1454b81d8:     	jmp	0x1454b81b0 <.text+0x54b71b0>
1454b81da:     	movabsq	$0x7fffffffffffffc, %r8 # imm = 0x7FFFFFFFFFFFFFC
1454b81e4:     	andq	%rax, %r8
1454b81e7:     	leaq	(,%r12,8), %rdx
1454b81ef:     	leaq	(%rdx,%rdx,2), %r9
1454b81f3:     	xorl	%edx, %edx
1454b81f5:     	movq	0x188(%rbp), %rdi
1454b81fc:     	movq	%rdi, %r10
1454b81ff:     	nop
1454b8200:     	movups	(%r10,%r9), %xmm0
1454b8205:     	movq	0x10(%r10,%r9), %r11
1454b820a:     	movq	%r11, 0x10(%r10)
1454b820e:     	movups	%xmm0, (%r10)
1454b8212:     	movups	0x18(%r10,%r9), %xmm0
1454b8218:     	movq	0x28(%r10,%r9), %r11
1454b821d:     	movq	%r11, 0x28(%r10)
1454b8221:     	movups	%xmm0, 0x18(%r10)
1454b8226:     	movups	0x30(%r10,%r9), %xmm0
1454b822c:     	movq	0x40(%r10,%r9), %r11
1454b8231:     	movq	%r11, 0x40(%r10)
1454b8235:     	movups	%xmm0, 0x30(%r10)
1454b823a:     	addq	$0x4, %rdx
1454b823e:     	movups	0x48(%r10,%r9), %xmm0
1454b8244:     	movq	0x58(%r10,%r9), %r11
1454b8249:     	movq	%r11, 0x58(%r10)
1454b824d:     	movups	%xmm0, 0x48(%r10)
1454b8252:     	addq	$0x60, %r10
1454b8256:     	cmpq	%rdx, %r8
1454b8259:     	jne	0x1454b8200 <.text+0x54b7200>
1454b825b:     	testq	%rcx, %rcx
1454b825e:     	je	0x1454b828a <.text+0x54b728a>
1454b8260:     	leaq	(%rdx,%rdx,2), %rdx
1454b8264:     	leaq	(%rdi,%rdx,8), %rdx
1454b8268:     	shlq	$0x3, %r12
1454b826c:     	leaq	(%r12,%r12,2), %r8
1454b8270:     	movups	(%rdx,%r8), %xmm0
1454b8275:     	movq	0x10(%rdx,%r8), %r9
1454b827a:     	movq	%r9, 0x10(%rdx)
1454b827e:     	movups	%xmm0, (%rdx)
1454b8281:     	addq	$0x18, %rdx
1454b8285:     	decq	%rcx
1454b8288:     	jne	0x1454b8270 <.text+0x54b7270>
1454b828a:     	leaq	(%rax,%rax,2), %rax
1454b828e:     	leaq	(%rdi,%rax,8), %rax
1454b8292:     	movq	%rax, 0x178(%rbp)
1454b8299:     	leaq	0x12617c8(%rip), %r14   # 0x146719a68
1454b82a0:     	xorps	%xmm6, %xmm6
1454b82a3:     	movsd	0x440a75(%rip), %xmm7   # 0x1458f8d20
1454b82ab:     	movsd	0x43328c(%rip), %xmm8   # 0x1458eb540
1454b82b4:     	movaps	0x440a74(%rip), %xmm9   # 0x1458f8d30
1454b82bc:     	movq	%rdi, %rax
1454b82bf:     	jmp	0x1454b8344 <.text+0x54b7344>
1454b82c4:     	nopw	%cs:(%rax,%rax)
1454b82d0:     	movq	0xb8(%rsi), %rax
1454b82d7:     	leaq	(%r15,%r15,2), %rcx
1454b82db:     	shlq	$0x5, %rcx
1454b82df:     	movq	0xc0(%rbp), %rdx
1454b82e6:     	movq	%rdx, 0x50(%rax,%rcx)
1454b82eb:     	movups	0xb0(%rbp), %xmm0
1454b82f2:     	movups	%xmm0, 0x40(%rax,%rcx)
1454b82f7:     	movups	0x70(%rbp), %xmm0
1454b82fb:     	movups	0x80(%rbp), %xmm1
1454b8302:     	movups	0x90(%rbp), %xmm2
1454b8309:     	movups	0xa0(%rbp), %xmm3
1454b8310:     	movups	%xmm3, 0x30(%rax,%rcx)
1454b8315:     	movups	%xmm2, 0x20(%rax,%rcx)
1454b831a:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b831f:     	movups	%xmm0, (%rax,%rcx)
1454b8323:     	movss	%xmm10, 0x58(%rax,%rcx)
1454b832a:     	incq	%r15
1454b832d:     	movq	%r15, 0xc0(%rsi)
1454b8334:     	movq	%rdi, %rax
1454b8337:     	cmpq	0x178(%rbp), %rdi
1454b833e:     	je	0x1454b8441 <.text+0x54b7441>
1454b8344:     	movq	(%rax), %r12
1454b8347:     	testq	%r12, %r12
1454b834a:     	je	0x1454b8441 <.text+0x54b7441>
1454b8350:     	movq	%r13, %rbx
1454b8353:     	leaq	0x18(%rax), %rdi
1454b8357:     	movss	0x10(%rax), %xmm10
1454b835d:     	movq	0x8(%rax), %r13
1454b8361:     	movq	%r12, 0xe0(%rbp)
1454b8368:     	movq	%r13, 0xe8(%rbp)
1454b836f:     	xorl	%r15d, %r15d
1454b8372:     	jmp	0x1454b8391 <.text+0x54b7391>
1454b8374:     	nopw	%cs:(%rax,%rax)
1454b8380:     	addq	$0x78, %r15
1454b8384:     	cmpq	$0x3480, %r15           # imm = 0x3480
1454b838b:     	je	0x1454b868b <.text+0x54b768b>
1454b8391:     	cmpq	%r13, 0x8(%r15,%r14)
1454b8396:     	jne	0x1454b8380 <.text+0x54b7380>
1454b8398:     	movq	(%r15,%r14), %rcx
1454b839c:     	movq	%r12, %rdx
1454b839f:     	movq	%r13, %r8
1454b83a2:     	callq	0x145756dd7 <.text+0x5755dd7>
1454b83a7:     	testl	%eax, %eax
1454b83a9:     	jne	0x1454b8380 <.text+0x54b7380>
1454b83ab:     	leaq	0x94(%rbp), %rax
1454b83b2:     	movups	%xmm6, (%rax)
1454b83b5:     	movl	$0x0, 0x10(%rax)
1454b83bc:     	addq	%r14, %r15
1454b83bf:     	movq	%r15, 0x70(%rbp)
1454b83c3:     	movl	$0x1, 0x78(%rbp)
1454b83ca:     	movsd	%xmm7, 0x7c(%rbp)
1454b83cf:     	movq	$0x3f800000, 0x84(%rbp) # imm = 0x3F800000
1454b83da:     	movsd	%xmm8, 0x8c(%rbp)
1454b83e3:     	movsd	%xmm8, 0xa8(%rbp)
1454b83ec:     	movl	$0x0, 0xb0(%rbp)
1454b83f6:     	movups	%xmm9, 0xb4(%rbp)
1454b83fe:     	leaq	0xa8(%rbp), %rcx
1454b8405:     	movq	%rbx, %r13
1454b8408:     	movq	%rbx, %rdx
1454b840b:     	movq	%r15, %r8
1454b840e:     	callq	0x145415f40 <.text+0x5414f40>
1454b8413:     	nop
1454b8414:     	movl	$0x3f800000, 0x7c(%rbp) # imm = 0x3F800000
1454b841b:     	movq	0xc0(%rsi), %r15
1454b8422:     	cmpq	0xb0(%rsi), %r15
1454b8429:     	jne	0x1454b82d0 <.text+0x54b72d0>
1454b842f:     	leaq	0xb0(%rsi), %rcx
1454b8436:     	callq	0x145763d70 <.text+0x5762d70>
1454b843b:     	nop
1454b843c:     	jmp	0x1454b82d0 <.text+0x54b72d0>
1454b8441:     	movq	0x180(%rbp), %rax
1454b8448:     	testq	%rax, %rax
1454b844b:     	je	0x1454b8467 <.text+0x54b7467>
1454b844d:     	shlq	$0x3, %rax
1454b8451:     	leaq	(%rax,%rax,2), %rdx
1454b8455:     	movl	$0x8, %r8d
1454b845b:     	movq	0x188(%rbp), %rcx
1454b8462:     	callq	0x1400021d0 <.text+0x11d0>
1454b8467:     	movq	0x298(%rsi), %rax
1454b846e:     	imulq	$0x58, 0x2a0(%rsi), %rcx
1454b8476:     	addq	%rax, %rcx
1454b8479:     	movq	%rax, 0x110(%rbp)
1454b8480:     	movq	%rcx, 0x118(%rbp)
1454b8487:     	movq	%r13, 0x120(%rbp)
1454b848e:     	movb	$0x0, 0x197(%rbp)
1454b8495:     	leaq	0xe0(%rbp), %rcx
1454b849c:     	leaq	0x110(%rbp), %rdx
1454b84a3:     	callq	0x145535f20 <.text+0x5534f20>
1454b84a8:     	nop
1454b84a9:     	movq	0x2a0(%rsi), %r8
1454b84b0:     	movq	0xe0(%rbp), %rax
1454b84b7:     	movq	0xe8(%rbp), %rcx
1454b84be:     	testq	%r8, %r8
1454b84c1:     	je	0x1454b851f <.text+0x54b751f>
1454b84c3:     	movq	0x298(%rsi), %rdx
1454b84ca:     	imulq	$0x58, %r8, %r8
1454b84ce:     	movq	0xf0(%rbp), %r10
1454b84d5:     	addq	$0x38, %rdx
1454b84d9:     	leaq	(%r10,%r10,8), %r9
1454b84dd:     	leaq	(%r9,%r9,2), %r9
1454b84e1:     	addq	%r10, %r9
1454b84e4:     	xorl	%r10d, %r10d
1454b84e7:     	xorl	%r11d, %r11d
1454b84ea:     	nopw	(%rax,%rax)
1454b84f0:     	cmpq	%r10, %r9
1454b84f3:     	je	0x1454b851f <.text+0x54b751f>
1454b84f5:     	leaq	(%rcx,%r10), %rdi
1454b84f9:     	movups	(%rdi), %xmm0
1454b84fc:     	movq	0x10(%rdi), %rbx
1454b8500:     	movl	0x18(%rdi), %edi
1454b8503:     	movl	%edi, 0x18(%rdx,%r11)
1454b8508:     	movq	%rbx, 0x10(%rdx,%r11)
1454b850d:     	movups	%xmm0, (%rdx,%r11)
1454b8512:     	addq	$0x58, %r11
1454b8516:     	addq	$0x1c, %r10
1454b851a:     	cmpq	%r11, %r8
1454b851d:     	jne	0x1454b84f0 <.text+0x54b74f0>
1454b851f:     	testq	%rax, %rax
1454b8522:     	je	0x1454b853a <.text+0x54b753a>
1454b8524:     	leaq	(%rax,%rax,8), %rdx
1454b8528:     	leaq	(%rdx,%rdx,2), %rdx
1454b852c:     	addq	%rax, %rdx
1454b852f:     	movl	$0x4, %r8d
1454b8535:     	callq	0x1400021d0 <.text+0x11d0>
1454b853a:     	movq	0xb8(%rsi), %rdi
1454b8541:     	movq	0xc0(%rsi), %rax
1454b8548:     	leaq	(%rax,%rax,2), %r14
1454b854c:     	shlq	$0x5, %r14
1454b8550:     	addq	%rdi, %r14
1454b8553:     	leaq	0x110(%rbp), %rbx
1454b855a:     	cmpq	%r14, %rdi
1454b855d:     	je	0x1454b8595 <.text+0x54b7595>
1454b855f:     	nop
1454b8560:     	movq	(%rdi), %r8
1454b8563:     	movb	$0x0, 0x197(%rbp)
1454b856a:     	movq	%rbx, %rcx
1454b856d:     	movq	%r13, %rdx
1454b8570:     	callq	0x145415f40 <.text+0x5414f40>
1454b8575:     	nop
1454b8576:     	movups	0x110(%rbp), %xmm0
1454b857d:     	movups	0x11c(%rbp), %xmm1
1454b8584:     	movups	%xmm1, 0x44(%rdi)
1454b8588:     	movups	%xmm0, 0x38(%rdi)
1454b858c:     	addq	$0x60, %rdi
1454b8590:     	cmpq	%r14, %rdi
1454b8593:     	jne	0x1454b8560 <.text+0x54b7560>
1454b8595:     	movb	$0x0, 0x197(%rbp)
1454b859c:     	movq	%rsi, %rcx
1454b859f:     	callq	0x1454950d0 <.text+0x54940d0>
1454b85a4:     	nop
1454b85a5:     	movaps	0x1a0(%rbp), %xmm6
1454b85ac:     	movaps	0x1b0(%rbp), %xmm7
1454b85b3:     	movaps	0x1c0(%rbp), %xmm8
1454b85bb:     	movaps	0x1d0(%rbp), %xmm9
1454b85c3:     	movaps	0x1e0(%rbp), %xmm10
1454b85cb:     	addq	$0x278, %rsp            # imm = 0x278
1454b85d2:     	popq	%rbx
1454b85d3:     	popq	%rdi
1454b85d4:     	popq	%rsi
1454b85d5:     	popq	%r12
1454b85d7:     	popq	%r13
1454b85d9:     	popq	%r14
1454b85db:     	popq	%r15
1454b85dd:     	popq	%rbp
1454b85de:     	retq
1454b85df:     	leaq	0x1(%r8), %r11
1454b85e3:     	cmpq	%rax, %r11
1454b85e6:     	jae	0x1454b8618 <.text+0x54b7618>
1454b85e8:     	movq	%r8, %rdx
1454b85eb:     	subq	%rax, %rdx
1454b85ee:     	leaq	0x2(%rdx), %r10
1454b85f2:     	testb	$0x1, %dl
1454b85f5:     	jne	0x1454b8621 <.text+0x54b7621>
1454b85f7:     	movq	%r8, %rdx
1454b85fa:     	cmpq	%r15, (%r9)
1454b85fd:     	jae	0x1454b860c <.text+0x54b760c>
1454b85ff:     	movups	(%r9), %xmm0
1454b8603:     	movups	%xmm0, -0x10(%r9)
1454b8608:     	leaq	0x1(%r8), %rdx
1454b860c:     	addq	$0x2, %r8
1454b8610:     	movq	%r8, %r11
1454b8613:     	movq	%rdx, %r8
1454b8616:     	jmp	0x1454b8621 <.text+0x54b7621>
1454b8618:     	movq	%r8, 0x60(%rsi)
1454b861c:     	jmp	0x1454b8109 <.text+0x54b7109>
1454b8621:     	testq	%r10, %r10
1454b8624:     	je	0x1454b8682 <.text+0x54b7682>
1454b8626:     	subq	%r11, %rax
1454b8629:     	shlq	$0x4, %r11
1454b862d:     	leaq	(%r11,%rcx), %r9
1454b8631:     	addq	$0x10, %r9
1454b8635:     	movq	%r8, %rdx
1454b8638:     	jmp	0x1454b8644 <.text+0x54b7644>
1454b863a:     	addq	$0x20, %r9
1454b863e:     	addq	$-0x2, %rax
1454b8642:     	je	0x1454b8682 <.text+0x54b7682>
1454b8644:     	cmpq	%r15, -0x10(%r9)
1454b8648:     	jb	0x1454b8651 <.text+0x54b7651>
1454b864a:     	cmpq	%r15, (%r9)
1454b864d:     	jae	0x1454b863a <.text+0x54b763a>
1454b864f:     	jmp	0x1454b866d <.text+0x54b766d>
1454b8651:     	leaq	-0x10(%r9), %r8
1454b8655:     	movq	%rdx, %r10
1454b8658:     	shlq	$0x4, %r10
1454b865c:     	movups	(%r8), %xmm0
1454b8660:     	movups	%xmm0, (%rcx,%r10)
1454b8665:     	incq	%rdx
1454b8668:     	cmpq	%r15, (%r9)
1454b866b:     	jae	0x1454b863a <.text+0x54b763a>
1454b866d:     	movq	%rdx, %r8
1454b8670:     	shlq	$0x4, %r8
1454b8674:     	movups	(%r9), %xmm0
1454b8678:     	movups	%xmm0, (%rcx,%r8)
1454b867d:     	incq	%rdx
1454b8680:     	jmp	0x1454b863a <.text+0x54b763a>
1454b8682:     	movq	%rdx, 0x60(%rsi)
1454b8686:     	jmp	0x1454b8109 <.text+0x54b7109>
1454b868b:     	leaq	0xe0(%rbp), %rax
1454b8692:     	movq	%rax, 0x110(%rbp)
1454b8699:     	leaq	-0x54b65e0(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454b86a0:     	movq	%rax, 0x118(%rbp)
1454b86a7:     	leaq	0x12605ca(%rip), %rcx   # 0x146718c78
1454b86ae:     	leaq	0x12605d3(%rip), %r8    # 0x146718c88
1454b86b5:     	leaq	0x110(%rbp), %rdx
1454b86bc:     	callq	0x1458e7790 <.text+0x58e6790>
1454b86c1:     	nop
1454b86c2:     	ud2
1454b86c4:     	movb	$0x0, 0x197(%rbp)
1454b86cb:     	movq	$0x4, 0x20(%rsp)
1454b86d4:     	movl	$0x4, %r9d
1454b86da:     	movq	%rbx, %rdx
1454b86dd:     	movq	%r14, %r8
1454b86e0:     	callq	0x145757d40 <.text+0x5756d40>
1454b86e5:     	nop
1454b86e6:     	movq	0x78(%rsi), %r15
1454b86ea:     	movq	0x70(%rsi), %r12
1454b86ee:     	leaq	(%r12,%r15,4), %rcx
1454b86f2:     	cmpq	$0x2, %r14
1454b86f6:     	jae	0x1454b7f27 <.text+0x54b6f27>
1454b86fc:     	jmp	0x1454b7f53 <.text+0x54b6f53>
1454b8701:     	movb	$0x0, 0x197(%rbp)
1454b8708:     	movq	$0x4, 0x20(%rsp)
1454b8711:     	movl	$0x4, %r9d
1454b8717:     	movq	%rbx, %rdx
1454b871a:     	movq	%r14, %r8
1454b871d:     	callq	0x145757d40 <.text+0x5756d40>
1454b8722:     	nop
1454b8723:     	movq	0x90(%rsi), %r15
1454b872a:     	movq	0x88(%rsi), %r12
1454b8731:     	leaq	(%r12,%r15,4), %rcx
1454b8735:     	cmpq	$0x2, %r14
1454b8739:     	jae	0x1454b7fc0 <.text+0x54b6fc0>
1454b873f:     	jmp	0x1454b7fec <.text+0x54b6fec>

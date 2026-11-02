
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d7be0:     	pushq	%rbp
1454d7be1:     	pushq	%r15
1454d7be3:     	pushq	%r14
1454d7be5:     	pushq	%r13
1454d7be7:     	pushq	%r12
1454d7be9:     	pushq	%rsi
1454d7bea:     	pushq	%rdi
1454d7beb:     	pushq	%rbx
1454d7bec:     	subq	$0x228, %rsp            # imm = 0x228
1454d7bf3:     	leaq	0x80(%rsp), %rbp
1454d7bfb:     	movaps	%xmm8, 0x190(%rbp)
1454d7c03:     	movaps	%xmm7, 0x180(%rbp)
1454d7c0a:     	movaps	%xmm6, 0x170(%rbp)
1454d7c11:     	movq	$-0x2, 0x168(%rbp)
1454d7c1c:     	movq	%r8, %r14
1454d7c1f:     	movq	%rdx, %rbx
1454d7c22:     	movq	%rcx, %rsi
1454d7c25:     	movq	(%rdx), %r15
1454d7c28:     	movss	(%r8), %xmm2
1454d7c2d:     	movss	0x4(%r8), %xmm1
1454d7c33:     	movss	0x44(%r15), %xmm0
1454d7c39:     	movss	0x10(%rdx), %xmm6
1454d7c3e:     	movss	0x38(%rdx), %xmm7
1454d7c43:     	movzbl	0x75(%r15), %eax
1454d7c48:     	addb	$-0x2, %al
1454d7c4a:     	cmpb	$0x6, %al
1454d7c4c:     	ja	0x1454d7c5f <.text+0x54d6c5f>
1454d7c4e:     	movzbl	%al, %eax
1454d7c51:     	leaq	0x14d4e44(%rip), %rcx   # 0x1469aca9c
1454d7c58:     	movss	(%rcx,%rax,4), %xmm3
1454d7c5d:     	jmp	0x1454d7c67 <.text+0x54d6c67>
1454d7c5f:     	movss	0x413819(%rip), %xmm3   # 0x1458eb480
1454d7c67:     	mulss	0x4c(%rbx), %xmm2
1454d7c6c:     	xorps	%xmm4, %xmm4
1454d7c6f:     	cmpltss	%xmm0, %xmm4
1454d7c74:     	andps	%xmm2, %xmm4
1454d7c77:     	mulss	0x4210c1(%rip), %xmm0   # 0x1458f8d40
1454d7c7f:     	mulss	%xmm6, %xmm0
1454d7c83:     	mulss	%xmm7, %xmm0
1454d7c87:     	mulss	%xmm3, %xmm0
1454d7c8b:     	addss	%xmm4, %xmm0
1454d7c8f:     	mulss	%xmm0, %xmm1
1454d7c93:     	movq	%rbp, %rcx
1454d7c96:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d7c9b:     	movss	0x1c(%rbx), %xmm0
1454d7ca0:     	mulss	0x44(%rbx), %xmm0
1454d7ca5:     	mulss	0x50(%r15), %xmm0
1454d7cab:     	mulss	0x28(%r14), %xmm0
1454d7cb1:     	movss	0x72475b(%rip), %xmm1   # 0x145bfc414
1454d7cb9:     	ucomiss	%xmm0, %xmm1
1454d7cbc:     	jae	0x1454d7ce6 <.text+0x54d6ce6>
1454d7cbe:     	addss	0x14b6f0a(%rip), %xmm0  # 0x14698ebd0
1454d7cc6:     	movss	0x421111(%rip), %xmm8   # 0x1458f8de0
1454d7ccf:     	divss	%xmm8, %xmm0
1454d7cd4:     	callq	0x145756f57 <.text+0x5755f57>
1454d7cd9:     	mulss	%xmm8, %xmm0
1454d7cde:     	addss	0x72472e(%rip), %xmm0   # 0x145bfc414
1454d7ce6:     	leaq	-0x50(%rbp), %rcx
1454d7cea:     	movaps	%xmm0, %xmm1
1454d7ced:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d7cf2:     	nop
1454d7cf3:     	movq	(%r15), %rcx
1454d7cf6:     	movq	0x8(%r15), %rdx
1454d7cfa:     	cmpq	$0xb, %rdx
1454d7cfe:     	je	0x1454d7daa <.text+0x54d6daa>
1454d7d04:     	cmpq	$0xa, %rdx
1454d7d08:     	jne	0x1454d7d2e <.text+0x54d6d2e>
1454d7d0a:     	movq	(%rcx), %rax
1454d7d0d:     	xorq	0x1245a78(%rip), %rax   # 0x14671d78c
1454d7d14:     	movzwl	0x8(%rcx), %r8d
1454d7d19:     	xorw	0x1245a73(%rip), %r8w   # 0x14671d794
1454d7d21:     	movzwl	%r8w, %r8d
1454d7d25:     	orq	%rax, %r8
1454d7d28:     	je	0x1454d7dc8 <.text+0x54d6dc8>
1454d7d2e:     	movss	0x48(%r15), %xmm8
1454d7d34:     	mulss	0x421003(%rip), %xmm8   # 0x1458f8d40
1454d7d3d:     	mulss	0x14(%rbx), %xmm8
1454d7d43:     	mulss	0x3c(%rbx), %xmm8
1454d7d49:     	mulss	0x8(%r14), %xmm8
1454d7d4f:     	maxss	0x4152b8(%rip), %xmm8   # 0x1458ed010
1454d7d58:     	callq	0x14541b8b0 <.text+0x541a8b0>
1454d7d5d:     	maxss	%xmm8, %xmm0
1454d7d62:     	movss	0x50(%rbx), %xmm1
1454d7d67:     	maxss	0x41e8b1(%rip), %xmm1   # 0x1458f6620
1454d7d6f:     	divss	%xmm1, %xmm0
1454d7d73:     	movq	$0x0, (%rsi)
1454d7d7a:     	movq	$0x1, 0x8(%rsi)
1454d7d82:     	movq	$0x0, 0x10(%rsi)
1454d7d8a:     	leaq	-0x20(%rbp), %rcx
1454d7d8e:     	movaps	%xmm0, %xmm1
1454d7d91:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d7d96:     	nop
1454d7d97:     	movq	0x8(%r15), %rdx
1454d7d9b:     	addq	$-0x9, %rdx
1454d7d9f:     	cmpq	$0x4, %rdx
1454d7da3:     	jbe	0x1454d7e04 <.text+0x54d6e04>
1454d7da5:     	jmp	0x1454d94aa <.text+0x54d84aa>
1454d7daa:     	movq	(%rcx), %rax
1454d7dad:     	xorq	0x12459e2(%rip), %rax   # 0x14671d796
1454d7db4:     	movq	0x3(%rcx), %r8
1454d7db8:     	xorq	0x12459da(%rip), %r8    # 0x14671d799
1454d7dbf:     	orq	%rax, %r8
1454d7dc2:     	jne	0x1454d7d2e <.text+0x54d6d2e>
1454d7dc8:     	movq	$0x0, (%rsi)
1454d7dcf:     	movq	$0x1, 0x8(%rsi)
1454d7dd7:     	movq	$0x0, 0x10(%rsi)
1454d7ddf:     	movq	(%rsi), %rax
1454d7de2:     	movq	%rax, -0x20(%rbp)
1454d7de6:     	movq	0x8(%rsi), %rax
1454d7dea:     	movq	%rax, -0x18(%rbp)
1454d7dee:     	movq	$0x0, -0x10(%rbp)
1454d7df6:     	addq	$-0x9, %rdx
1454d7dfa:     	cmpq	$0x4, %rdx
1454d7dfe:     	ja	0x1454d94aa <.text+0x54d84aa>
1454d7e04:     	leaq	0x14d4fd9(%rip), %rax   # 0x1469acde4
1454d7e0b:     	movslq	(%rax,%rdx,4), %rcx
1454d7e0f:     	addq	%rax, %rcx
1454d7e12:     	jmpq	*%rcx
1454d7e14:     	movq	(%r15), %rax
1454d7e17:     	movabsq	$0x676172646f6f6c62, %rcx # imm = 0x676172646F6F6C62
1454d7e21:     	xorq	(%rax), %rcx
1454d7e24:     	movzbl	0x8(%rax), %edx
1454d7e28:     	xorq	$0x65, %rdx
1454d7e2c:     	orq	%rcx, %rdx
1454d7e2f:     	je	0x1454d84a0 <.text+0x54d74a0>
1454d7e35:     	movabsq	$0x7461665f6c616573, %rcx # imm = 0x7461665F6C616573
1454d7e3f:     	xorq	(%rax), %rcx
1454d7e42:     	movzbl	0x8(%rax), %edx
1454d7e46:     	xorq	$0x65, %rdx
1454d7e4a:     	orq	%rcx, %rdx
1454d7e4d:     	je	0x1454d856c <.text+0x54d756c>
1454d7e53:     	movabsq	$0x6c6577746867696c, %rcx # imm = 0x6C6577746867696C
1454d7e5d:     	xorq	(%rax), %rcx
1454d7e60:     	movzbl	0x8(%rax), %edx
1454d7e64:     	xorq	$0x6c, %rdx
1454d7e68:     	orq	%rcx, %rdx
1454d7e6b:     	je	0x1454d8698 <.text+0x54d7698>
1454d7e71:     	movabsq	$0x7269665f6c756f73, %rcx # imm = 0x7269665F6C756F73
1454d7e7b:     	xorq	(%rax), %rcx
1454d7e7e:     	movzbl	0x8(%rax), %edx
1454d7e82:     	xorq	$0x65, %rdx
1454d7e86:     	orq	%rcx, %rdx
1454d7e89:     	je	0x1454d88cc <.text+0x54d78cc>
1454d7e8f:     	movabsq	$0x70726f6d796c6f70, %rcx # imm = 0x70726F6D796C6F70
1454d7e99:     	xorq	(%rax), %rcx
1454d7e9c:     	movzbl	0x8(%rax), %eax
1454d7ea0:     	xorq	$0x68, %rax
1454d7ea4:     	orq	%rcx, %rax
1454d7ea7:     	jne	0x1454d94aa <.text+0x54d84aa>
1454d7ead:     	leaq	0x14d3b1d(%rip), %rbx   # 0x1469ab9d1
1454d7eb4:     	movl	$0x141, %r14d           # imm = 0x141
1454d7eba:     	movl	$0x141, %edx            # imm = 0x141
1454d7ebf:     	movq	%rbx, %rcx
1454d7ec2:     	callq	0x145452400 <.text+0x5451400>
1454d7ec7:     	nop
1454d7ec8:     	movq	%rdx, %rdi
1454d7ecb:     	testq	%rax, %rax
1454d7ece:     	cmovneq	%rax, %rbx
1454d7ed2:     	cmoveq	%r14, %rdi
1454d7ed6:     	leaq	0x120(%rbp), %r13
1454d7edd:     	movss	0x41361b(%rip), %xmm1   # 0x1458eb500
1454d7ee5:     	movq	%r13, %rcx
1454d7ee8:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d7eed:     	nop
1454d7eee:     	leaq	0x108(%rbp), %r14
1454d7ef5:     	movss	0x420ee3(%rip), %xmm1   # 0x1458f8de0
1454d7efd:     	movq	%r14, %rcx
1454d7f00:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d7f05:     	nop
1454d7f06:     	leaq	0x150(%rbp), %r12
1454d7f0d:     	movss	0x14d26f3(%rip), %xmm1  # 0x1469aa608
1454d7f15:     	movq	%r12, %rcx
1454d7f18:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d7f1d:     	nop
1454d7f1e:     	leaq	0x14d3aab(%rip), %rax   # 0x1469ab9d0
1454d7f25:     	movq	%rax, 0x28(%rbp)
1454d7f29:     	movq	$0x1, 0x30(%rbp)
1454d7f31:     	movq	%r13, 0x38(%rbp)
1454d7f35:     	leaq	0x14d32a4(%rip), %rax   # 0x1469ab1e0
1454d7f3c:     	movq	%rax, 0x40(%rbp)
1454d7f40:     	leaq	0x14d3bcb(%rip), %rcx   # 0x1469abb12
1454d7f47:     	movq	%rcx, 0x48(%rbp)
1454d7f4b:     	movq	$0x2, 0x50(%rbp)
1454d7f53:     	leaq	-0x20(%rbp), %rcx
1454d7f57:     	movq	%rcx, 0x58(%rbp)
1454d7f5b:     	movq	%rax, 0x60(%rbp)
1454d7f5f:     	leaq	0x14d3bba(%rip), %rcx   # 0x1469abb20
1454d7f66:     	movq	%rcx, 0x68(%rbp)
1454d7f6a:     	movq	$0x5, 0x70(%rbp)
1454d7f72:     	leaq	0x14d3b9f(%rip), %rcx   # 0x1469abb18
1454d7f79:     	movq	%rcx, 0x78(%rbp)
1454d7f7d:     	leaq	0x14d32cc(%rip), %rcx   # 0x1469ab250
1454d7f84:     	movq	%rcx, 0x80(%rbp)
1454d7f8b:     	leaq	0x14d3060(%rip), %rcx   # 0x1469aaff2
1454d7f92:     	movq	%rcx, 0x88(%rbp)
1454d7f99:     	movq	$0x4, 0x90(%rbp)
1454d7fa4:     	movq	%r14, 0x98(%rbp)
1454d7fab:     	movq	%rax, 0xa0(%rbp)
1454d7fb2:     	leaq	0x14d3b6c(%rip), %rcx   # 0x1469abb25
1454d7fb9:     	movq	%rcx, 0xa8(%rbp)
1454d7fc0:     	movq	$0x3, 0xb0(%rbp)
1454d7fcb:     	movq	%r12, 0xb8(%rbp)
1454d7fd2:     	movq	%rax, 0xc0(%rbp)
1454d7fd9:     	leaq	0x14d3b48(%rip), %rcx   # 0x1469abb28
1454d7fe0:     	movq	%rcx, 0xc8(%rbp)
1454d7fe7:     	movq	$0x3, 0xd0(%rbp)
1454d7ff2:     	movq	%rbp, %rcx
1454d7ff5:     	movq	%rcx, 0xd8(%rbp)
1454d7ffc:     	movq	%rax, 0xe0(%rbp)
1454d8003:     	leaq	0x14d3b21(%rip), %rcx   # 0x1469abb2b
1454d800a:     	movq	%rcx, 0xe8(%rbp)
1454d8011:     	movq	$0x1, 0xf0(%rbp)
1454d801c:     	leaq	-0x50(%rbp), %rcx
1454d8020:     	movq	%rcx, 0xf8(%rbp)
1454d8027:     	movq	%rax, 0x100(%rbp)
1454d802e:     	movq	$0x7, 0x20(%rsp)
1454d8037:     	leaq	0x28(%rbp), %r9
1454d803b:     	movq	%rsi, %rcx
1454d803e:     	movq	%rbx, %rdx
1454d8041:     	movq	%rdi, %r8
1454d8044:     	callq	0x145452790 <.text+0x5451790>
1454d8049:     	nop
1454d804a:     	jmp	0x1454d8ed7 <.text+0x54d7ed7>
1454d804f:     	movq	(%r15), %rax
1454d8052:     	movabsq	$0x5f666f5f6c6c6163, %rcx # imm = 0x5F666F5F6C6C6163
1454d805c:     	xorq	(%rax), %rcx
1454d805f:     	movabsq	$0x656d616c665f666f, %rdx # imm = 0x656D616C665F666F
1454d8069:     	xorq	0x5(%rax), %rdx
1454d806d:     	orq	%rcx, %rdx
1454d8070:     	jne	0x1454d94aa <.text+0x54d84aa>
1454d8076:     	leaq	0x14d3ce1(%rip), %rdi   # 0x1469abd5e
1454d807d:     	movl	$0x8b, %ebx
1454d8082:     	movl	$0x8b, %edx
1454d8087:     	movq	%rdi, %rcx
1454d808a:     	callq	0x145452400 <.text+0x5451400>
1454d808f:     	nop
1454d8090:     	movq	%rdx, %r8
1454d8093:     	testq	%rax, %rax
1454d8096:     	cmovneq	%rax, %rdi
1454d809a:     	cmoveq	%rbx, %r8
1454d809e:     	leaq	0x14d3a83(%rip), %rax   # 0x1469abb28
1454d80a5:     	movq	%rax, 0x28(%rbp)
1454d80a9:     	movq	$0x3, 0x30(%rbp)
1454d80b1:     	movq	%rbp, %rax
1454d80b4:     	movq	%rax, 0x38(%rbp)
1454d80b8:     	leaq	0x14d3121(%rip), %rax   # 0x1469ab1e0
1454d80bf:     	movq	%rax, 0x40(%rbp)
1454d80c3:     	leaq	0x14d3a61(%rip), %rcx   # 0x1469abb2b
1454d80ca:     	movq	%rcx, 0x48(%rbp)
1454d80ce:     	movq	$0x1, 0x50(%rbp)
1454d80d6:     	leaq	-0x50(%rbp), %rcx
1454d80da:     	movq	%rcx, 0x58(%rbp)
1454d80de:     	movq	%rax, 0x60(%rbp)
1454d80e2:     	leaq	0x14d3a29(%rip), %rcx   # 0x1469abb12
1454d80e9:     	movq	%rcx, 0x68(%rbp)
1454d80ed:     	movq	$0x2, 0x70(%rbp)
1454d80f5:     	leaq	-0x20(%rbp), %rcx
1454d80f9:     	movq	%rcx, 0x78(%rbp)
1454d80fd:     	movq	%rax, 0x80(%rbp)
1454d8104:     	movq	$0x3, 0x20(%rsp)
1454d810d:     	leaq	0x28(%rbp), %r9
1454d8111:     	movq	%rsi, %rcx
1454d8114:     	movq	%rdi, %rdx
1454d8117:     	callq	0x145452790 <.text+0x5451790>
1454d811c:     	nop
1454d811d:     	jmp	0x1454d94aa <.text+0x54d84aa>
1454d8122:     	movq	(%r15), %rax
1454d8125:     	movabsq	$0x665f656972656166, %rcx # imm = 0x665F656972656166
1454d812f:     	xorq	(%rax), %rcx
1454d8132:     	movabsq	$0x657269665f656972, %rdx # imm = 0x657269665F656972
1454d813c:     	xorq	0x3(%rax), %rdx
1454d8140:     	orq	%rcx, %rdx
1454d8143:     	jne	0x1454d94aa <.text+0x54d84aa>
1454d8149:     	movl	0x54(%r15), %eax
1454d814d:     	testl	%eax, %eax
1454d814f:     	je	0x1454d8616 <.text+0x54d7616>
1454d8155:     	addl	0x18(%rbx), %eax
1454d8158:     	addl	0x40(%rbx), %eax
1454d815b:     	addl	0x34(%r14), %eax
1454d815f:     	je	0x1454d8616 <.text+0x54d7616>
1454d8165:     	cmpl	$0x3, %eax
1454d8168:     	movl	$0x3, %ecx
1454d816d:     	cmovbl	%eax, %ecx
1454d8170:     	movl	%ecx, -0x38(%rbp)
1454d8173:     	cmpl	$0x1, %eax
1454d8176:     	je	0x1454d861d <.text+0x54d761d>
1454d817c:     	leaq	0x14d39ba(%rip), %rdi   # 0x1469abb3d
1454d8183:     	movl	$0x17, %ebx
1454d8188:     	movl	$0x17, %edx
1454d818d:     	movq	%rdi, %rcx
1454d8190:     	callq	0x145452400 <.text+0x5451400>
1454d8195:     	nop
1454d8196:     	movq	%rdx, %r8
1454d8199:     	testq	%rax, %rax
1454d819c:     	cmovneq	%rax, %rdi
1454d81a0:     	cmoveq	%rbx, %r8
1454d81a4:     	leaq	0x14d2915(%rip), %rax   # 0x1469aaac0
1454d81ab:     	movq	%rax, 0x28(%rbp)
1454d81af:     	movq	$0x1, 0x30(%rbp)
1454d81b7:     	leaq	-0x38(%rbp), %rax
1454d81bb:     	movq	%rax, 0x38(%rbp)
1454d81bf:     	leaq	0x14d28da(%rip), %rax   # 0x1469aaaa0
1454d81c6:     	movq	%rax, 0x40(%rbp)
1454d81ca:     	movq	$0x1, 0x20(%rsp)
1454d81d3:     	leaq	0x138(%rbp), %rcx
1454d81da:     	leaq	0x28(%rbp), %r9
1454d81de:     	movq	%rdi, %rdx
1454d81e1:     	callq	0x145452790 <.text+0x5451790>
1454d81e6:     	nop
1454d81e7:     	jmp	0x1454d8d01 <.text+0x54d7d01>
1454d81ec:     	movq	(%r15), %rax
1454d81ef:     	movabsq	$0x5f737265746e7568, %rcx # imm = 0x5F737265746E7568
1454d81f9:     	xorq	(%rax), %rcx
1454d81fc:     	movl	0x8(%rax), %eax
1454d81ff:     	xorq	$0x6b72616d, %rax       # imm = 0x6B72616D
1454d8205:     	orq	%rcx, %rax
1454d8208:     	jne	0x1454d94aa <.text+0x54d84aa>
1454d820e:     	leaq	0x14d3e33(%rip), %rdi   # 0x1469ac048
1454d8215:     	movl	$0xf0, %r14d
1454d821b:     	movl	$0xf0, %edx
1454d8220:     	movq	%rdi, %rcx
1454d8223:     	callq	0x145452400 <.text+0x5451400>
1454d8228:     	nop
1454d8229:     	movq	%rdx, %rbx
1454d822c:     	testq	%rax, %rax
1454d822f:     	cmovneq	%rax, %rdi
1454d8233:     	cmoveq	%r14, %rbx
1454d8237:     	movss	0x4c(%r15), %xmm1
1454d823d:     	leaq	0x108(%rbp), %r14
1454d8244:     	movq	%r14, %rcx
1454d8247:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d824c:     	nop
1454d824d:     	mulss	%xmm7, %xmm6
1454d8251:     	xorps	%xmm1, %xmm1
1454d8254:     	sqrtss	%xmm6, %xmm1
1454d8258:     	mulss	0x4132ac(%rip), %xmm1   # 0x1458eb50c
1454d8260:     	minss	0x432c94(%rip), %xmm1   # 0x14590aefc
1454d8268:     	mulss	0x4132bc(%rip), %xmm1   # 0x1458eb52c
1454d8270:     	leaq	0x150(%rbp), %r12
1454d8277:     	movq	%r12, %rcx
1454d827a:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d827f:     	nop
1454d8280:     	leaq	0x14d39f6(%rip), %rax   # 0x1469abc7d
1454d8287:     	movq	%rax, 0x28(%rbp)
1454d828b:     	movq	$0x5, 0x30(%rbp)
1454d8293:     	movq	%r14, 0x38(%rbp)
1454d8297:     	leaq	0x14d2f42(%rip), %rax   # 0x1469ab1e0
1454d829e:     	movq	%rax, 0x40(%rbp)
1454d82a2:     	leaq	0x14d3727(%rip), %rcx   # 0x1469ab9d0
1454d82a9:     	movq	%rcx, 0x48(%rbp)
1454d82ad:     	movq	$0x1, 0x50(%rbp)
1454d82b5:     	movq	%r12, 0x58(%rbp)
1454d82b9:     	movq	%rax, 0x60(%rbp)
1454d82bd:     	leaq	0x14d3864(%rip), %rcx   # 0x1469abb28
1454d82c4:     	movq	%rcx, 0x68(%rbp)
1454d82c8:     	movq	$0x3, 0x70(%rbp)
1454d82d0:     	movq	%rbp, %rcx
1454d82d3:     	movq	%rcx, 0x78(%rbp)
1454d82d7:     	movq	%rax, 0x80(%rbp)
1454d82de:     	leaq	0x14d3846(%rip), %rcx   # 0x1469abb2b
1454d82e5:     	movq	%rcx, 0x88(%rbp)
1454d82ec:     	movq	$0x1, 0x90(%rbp)
1454d82f7:     	leaq	-0x50(%rbp), %rcx
1454d82fb:     	movq	%rcx, 0x98(%rbp)
1454d8302:     	movq	%rax, 0xa0(%rbp)
1454d8309:     	leaq	0x14d3802(%rip), %rcx   # 0x1469abb12
1454d8310:     	movq	%rcx, 0xa8(%rbp)
1454d8317:     	movq	$0x2, 0xb0(%rbp)
1454d8322:     	leaq	-0x20(%rbp), %rcx
1454d8326:     	movq	%rcx, 0xb8(%rbp)
1454d832d:     	movq	%rax, 0xc0(%rbp)
1454d8334:     	movq	$0x5, 0x20(%rsp)
1454d833d:     	leaq	0x28(%rbp), %r9
1454d8341:     	movq	%rsi, %rcx
1454d8344:     	movq	%rdi, %rdx
1454d8347:     	movq	%rbx, %r8
1454d834a:     	callq	0x145452790 <.text+0x5451790>
1454d834f:     	nop
1454d8350:     	jmp	0x1454d946e <.text+0x54d846e>
1454d8355:     	movq	(%r15), %rax
1454d8358:     	movabsq	$0x6974706d65646572, %rcx # imm = 0x6974706D65646572
1454d8362:     	xorq	(%rax), %rcx
1454d8365:     	movzwl	0x8(%rax), %eax
1454d8369:     	xorq	$0x6e6f, %rax           # imm = 0x6E6F
1454d836f:     	orq	%rcx, %rax
1454d8372:     	jne	0x1454d94aa <.text+0x54d84aa>
1454d8378:     	leaq	0x14d3db9(%rip), %rdi   # 0x1469ac138
1454d837f:     	movl	$0xc2, %edx
1454d8384:     	movq	%rdi, %rcx
1454d8387:     	callq	0x145452400 <.text+0x5451400>
1454d838c:     	nop
1454d838d:     	movq	%rax, %r13
1454d8390:     	movq	%rdx, %r12
1454d8393:     	movss	0x48(%r15), %xmm0
1454d8399:     	movss	0x41e27f(%rip), %xmm1   # 0x1458f6620
1454d83a1:     	mulss	%xmm0, %xmm1
1454d83a5:     	movss	0x420993(%rip), %xmm2   # 0x1458f8d40
1454d83ad:     	mulss	%xmm2, %xmm0
1454d83b1:     	mulss	0x14(%rbx), %xmm0
1454d83b6:     	mulss	0x3c(%rbx), %xmm0
1454d83bb:     	mulss	0x8(%r14), %xmm0
1454d83c1:     	maxss	0x414c47(%rip), %xmm0   # 0x1458ed010
1454d83c9:     	mulss	%xmm2, %xmm1
1454d83cd:     	divss	%xmm0, %xmm1
1454d83d1:     	minss	0x413133(%rip), %xmm1   # 0x1458eb50c
1454d83d9:     	mulss	0x50(%rbx), %xmm1
1454d83de:     	mulss	0x413146(%rip), %xmm1   # 0x1458eb52c
1454d83e6:     	leaq	0x150(%rbp), %rbx
1454d83ed:     	movq	%rbx, %rcx
1454d83f0:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d83f5:     	nop
1454d83f6:     	testq	%r13, %r13
1454d83f9:     	movl	$0xc2, %eax
1454d83fe:     	cmoveq	%rax, %r12
1454d8402:     	cmovneq	%r13, %rdi
1454d8406:     	leaq	0x14d35c3(%rip), %rax   # 0x1469ab9d0
1454d840d:     	movq	%rax, 0x28(%rbp)
1454d8411:     	movq	$0x1, 0x30(%rbp)
1454d8419:     	movq	%rbx, 0x38(%rbp)
1454d841d:     	leaq	0x14d2dbc(%rip), %rax   # 0x1469ab1e0
1454d8424:     	movq	%rax, 0x40(%rbp)
1454d8428:     	leaq	0x14d36f9(%rip), %rcx   # 0x1469abb28
1454d842f:     	movq	%rcx, 0x48(%rbp)
1454d8433:     	movq	$0x3, 0x50(%rbp)
1454d843b:     	movq	%rbp, %rcx
1454d843e:     	movq	%rcx, 0x58(%rbp)
1454d8442:     	movq	%rax, 0x60(%rbp)
1454d8446:     	leaq	0x14d36de(%rip), %rcx   # 0x1469abb2b
1454d844d:     	movq	%rcx, 0x68(%rbp)
1454d8451:     	movq	$0x1, 0x70(%rbp)
1454d8459:     	leaq	-0x50(%rbp), %rcx
1454d845d:     	movq	%rcx, 0x78(%rbp)
1454d8461:     	movq	%rax, 0x80(%rbp)
1454d8468:     	movq	$0x3, 0x20(%rsp)
1454d8471:     	leaq	0x28(%rbp), %r9
1454d8475:     	movq	%rsi, %rcx
1454d8478:     	movq	%rdi, %rdx
1454d847b:     	movq	%r12, %r8
1454d847e:     	callq	0x145452790 <.text+0x5451790>
1454d8483:     	nop
1454d8484:     	movq	0x150(%rbp), %rdx
1454d848b:     	testq	%rdx, %rdx
1454d848e:     	je	0x1454d94aa <.text+0x54d84aa>
1454d8494:     	movq	0x158(%rbp), %rcx
1454d849b:     	jmp	0x1454d949f <.text+0x54d849f>
1454d84a0:     	leaq	0x14d3d53(%rip), %r12   # 0x1469ac1fa
1454d84a7:     	movl	$0xd4, %edi
1454d84ac:     	movl	$0xd4, %edx
1454d84b1:     	movq	%r12, %rcx
1454d84b4:     	callq	0x145452400 <.text+0x5451400>
1454d84b9:     	nop
1454d84ba:     	movq	%rdx, %r13
1454d84bd:     	testq	%rax, %rax
1454d84c0:     	cmovneq	%rax, %r12
1454d84c4:     	cmoveq	%rdi, %r13
1454d84c8:     	leaq	0x108(%rbp), %rdi
1454d84cf:     	movss	0x41e14d(%rip), %xmm1   # 0x1458f6624
1454d84d7:     	movq	%rdi, %rcx
1454d84da:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d84df:     	nop
1454d84e0:     	movq	(%r15), %rcx
1454d84e3:     	movq	0x8(%r15), %rdx
1454d84e7:     	cmpq	$0xb, %rdx
1454d84eb:     	je	0x1454d8785 <.text+0x54d7785>
1454d84f1:     	cmpq	$0xa, %rdx
1454d84f5:     	jne	0x1454d851b <.text+0x54d751b>
1454d84f7:     	movq	(%rcx), %rax
1454d84fa:     	xorq	0x124528b(%rip), %rax   # 0x14671d78c
1454d8501:     	movzwl	0x8(%rcx), %r8d
1454d8506:     	xorw	0x1245286(%rip), %r8w   # 0x14671d794
1454d850e:     	movzwl	%r8w, %r8d
1454d8512:     	orq	%rax, %r8
1454d8515:     	je	0x1454d87a3 <.text+0x54d77a3>
1454d851b:     	movss	0x48(%r15), %xmm6
1454d8521:     	mulss	0x420817(%rip), %xmm6   # 0x1458f8d40
1454d8529:     	mulss	0x14(%rbx), %xmm6
1454d852e:     	mulss	0x3c(%rbx), %xmm6
1454d8533:     	mulss	0x8(%r14), %xmm6
1454d8539:     	maxss	0x414acf(%rip), %xmm6   # 0x1458ed010
1454d8541:     	callq	0x14541b8b0 <.text+0x541a8b0>
1454d8546:     	movss	0x50(%rbx), %xmm1
1454d854b:     	maxss	0x41e0cd(%rip), %xmm1   # 0x1458f6620
1454d8553:     	maxss	%xmm6, %xmm0
1454d8557:     	divss	%xmm1, %xmm0
1454d855b:     	movss	0x412fc9(%rip), %xmm1   # 0x1458eb52c
1454d8563:     	divss	%xmm0, %xmm1
1454d8567:     	jmp	0x1454d87ab <.text+0x54d77ab>
1454d856c:     	movl	0x54(%r15), %eax
1454d8570:     	testl	%eax, %eax
1454d8572:     	je	0x1454d8739 <.text+0x54d7739>
1454d8578:     	addl	0x18(%rbx), %eax
1454d857b:     	addl	0x40(%rbx), %eax
1454d857e:     	addl	0x34(%r14), %eax
1454d8582:     	je	0x1454d8739 <.text+0x54d7739>
1454d8588:     	cmpl	$0x3, %eax
1454d858b:     	movl	$0x3, %ecx
1454d8590:     	cmovbl	%eax, %ecx
1454d8593:     	movl	%ecx, 0x138(%rbp)
1454d8599:     	cmpl	$0x1, %eax
1454d859c:     	je	0x1454d8743 <.text+0x54d7743>
1454d85a2:     	leaq	0x14d3968(%rip), %rdi   # 0x1469abf11
1454d85a9:     	movl	$0x11, %r12d
1454d85af:     	movl	$0x11, %edx
1454d85b4:     	movq	%rdi, %rcx
1454d85b7:     	callq	0x145452400 <.text+0x5451400>
1454d85bc:     	nop
1454d85bd:     	movq	%rdx, %r8
1454d85c0:     	testq	%rax, %rax
1454d85c3:     	cmovneq	%rax, %rdi
1454d85c7:     	cmoveq	%r12, %r8
1454d85cb:     	leaq	0x14d24ee(%rip), %rax   # 0x1469aaac0
1454d85d2:     	movq	%rax, 0x28(%rbp)
1454d85d6:     	movq	$0x1, 0x30(%rbp)
1454d85de:     	leaq	0x138(%rbp), %rax
1454d85e5:     	movq	%rax, 0x38(%rbp)
1454d85e9:     	leaq	0x14d24b0(%rip), %rax   # 0x1469aaaa0
1454d85f0:     	movq	%rax, 0x40(%rbp)
1454d85f4:     	movq	$0x1, 0x20(%rsp)
1454d85fd:     	leaq	0x120(%rbp), %rcx
1454d8604:     	leaq	0x28(%rbp), %r9
1454d8608:     	movq	%rdi, %rdx
1454d860b:     	callq	0x145452790 <.text+0x5451790>
1454d8610:     	nop
1454d8611:     	jmp	0x1454d92b7 <.text+0x54d82b7>
1454d8616:     	movl	$0x1, -0x38(%rbp)
1454d861d:     	leaq	0x14d3508(%rip), %rbx   # 0x1469abb2c
1454d8624:     	movl	$0x11, %r14d
1454d862a:     	movl	$0x11, %edx
1454d862f:     	movq	%rbx, %rcx
1454d8632:     	callq	0x145452400 <.text+0x5451400>
1454d8637:     	nop
1454d8638:     	movq	%rdx, %rdi
1454d863b:     	testq	%rax, %rax
1454d863e:     	cmovneq	%rax, %rbx
1454d8642:     	cmoveq	%r14, %rdi
1454d8646:     	testq	%rdi, %rdi
1454d8649:     	jns	0x1454d865f <.text+0x54d765f>
1454d864b:     	xorl	%r12d, %r12d
1454d864e:     	movq	%r12, %rcx
1454d8651:     	movq	%rdi, %rdx
1454d8654:     	callq	0x1458e721b <.text+0x58e621b>
1454d8659:     	nop
1454d865a:     	jmp	0x1454d9563 <.text+0x54d8563>
1454d865f:     	je	0x1454d8ce6 <.text+0x54d7ce6>
1454d8665:     	callq	0x140002200 <.text+0x1200>
1454d866a:     	movl	$0x1, %r12d
1454d8670:     	movl	$0x1, %edx
1454d8675:     	movq	%rdi, %rcx
1454d8678:     	callq	0x1400021c0 <.text+0x11c0>
1454d867d:     	testq	%rax, %rax
1454d8680:     	je	0x1454d864e <.text+0x54d764e>
1454d8682:     	movq	%rax, %r14
1454d8685:     	movq	%rax, %rcx
1454d8688:     	movq	%rbx, %rdx
1454d868b:     	movq	%rdi, %r8
1454d868e:     	callq	0x145756ddd <.text+0x5755ddd>
1454d8693:     	jmp	0x1454d8cec <.text+0x54d7cec>
1454d8698:     	movl	0x54(%r15), %eax
1454d869c:     	testl	%eax, %eax
1454d869e:     	je	0x1454d8976 <.text+0x54d7976>
1454d86a4:     	addl	0x18(%rbx), %eax
1454d86a7:     	addl	0x40(%rbx), %eax
1454d86aa:     	addl	0x34(%r14), %eax
1454d86ae:     	je	0x1454d8976 <.text+0x54d7976>
1454d86b4:     	cmpl	$0x3, %eax
1454d86b7:     	movl	$0x3, %ecx
1454d86bc:     	cmovbl	%eax, %ecx
1454d86bf:     	movl	%ecx, 0x1c(%rbp)
1454d86c2:     	cmpl	$0x1, %eax
1454d86c5:     	je	0x1454d897d <.text+0x54d797d>
1454d86cb:     	leaq	0x14d346b(%rip), %rdi   # 0x1469abb3d
1454d86d2:     	movl	$0x17, %r12d
1454d86d8:     	movl	$0x17, %edx
1454d86dd:     	movq	%rdi, %rcx
1454d86e0:     	callq	0x145452400 <.text+0x5451400>
1454d86e5:     	nop
1454d86e6:     	movq	%rdx, %r8
1454d86e9:     	testq	%rax, %rax
1454d86ec:     	cmovneq	%rax, %rdi
1454d86f0:     	cmoveq	%r12, %r8
1454d86f4:     	leaq	0x14d23c5(%rip), %rax   # 0x1469aaac0
1454d86fb:     	movq	%rax, 0x28(%rbp)
1454d86ff:     	movq	$0x1, 0x30(%rbp)
1454d8707:     	leaq	0x1c(%rbp), %rax
1454d870b:     	movq	%rax, 0x38(%rbp)
1454d870f:     	leaq	0x14d238a(%rip), %rax   # 0x1469aaaa0
1454d8716:     	movq	%rax, 0x40(%rbp)
1454d871a:     	movq	$0x1, 0x20(%rsp)
1454d8723:     	leaq	-0x38(%rbp), %rcx
1454d8727:     	leaq	0x28(%rbp), %r9
1454d872b:     	movq	%rdi, %rdx
1454d872e:     	callq	0x145452790 <.text+0x5451790>
1454d8733:     	nop
1454d8734:     	jmp	0x1454d89fd <.text+0x54d79fd>
1454d8739:     	movl	$0x1, 0x138(%rbp)
1454d8743:     	leaq	0x14d37bf(%rip), %r13   # 0x1469abf09
1454d874a:     	movl	$0x8, %r12d
1454d8750:     	movl	$0x8, %edx
1454d8755:     	movq	%r13, %rcx
1454d8758:     	callq	0x145452400 <.text+0x5451400>
1454d875d:     	nop
1454d875e:     	movq	%rdx, %rdi
1454d8761:     	testq	%rax, %rax
1454d8764:     	cmovneq	%rax, %r13
1454d8768:     	cmoveq	%r12, %rdi
1454d876c:     	testq	%rdi, %rdi
1454d876f:     	jns	0x1454d8890 <.text+0x54d7890>
1454d8775:     	xorl	%ecx, %ecx
1454d8777:     	movq	%rdi, %rdx
1454d877a:     	callq	0x1458e721b <.text+0x58e621b>
1454d877f:     	nop
1454d8780:     	jmp	0x1454d9563 <.text+0x54d8563>
1454d8785:     	movq	(%rcx), %rax
1454d8788:     	xorq	0x1245007(%rip), %rax   # 0x14671d796
1454d878f:     	movq	0x3(%rcx), %r8
1454d8793:     	xorq	0x1244fff(%rip), %r8    # 0x14671d799
1454d879a:     	orq	%rax, %r8
1454d879d:     	jne	0x1454d851b <.text+0x54d751b>
1454d87a3:     	movss	0x420635(%rip), %xmm1   # 0x1458f8de0
1454d87ab:     	leaq	0x150(%rbp), %rbx
1454d87b2:     	movq	%rbx, %rcx
1454d87b5:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d87ba:     	nop
1454d87bb:     	leaq	0x14d3b0c(%rip), %rax   # 0x1469ac2ce
1454d87c2:     	movq	%rax, 0x28(%rbp)
1454d87c6:     	movq	$0x4, 0x30(%rbp)
1454d87ce:     	movq	%rdi, 0x38(%rbp)
1454d87d2:     	leaq	0x14d2a07(%rip), %rax   # 0x1469ab1e0
1454d87d9:     	movq	%rax, 0x40(%rbp)
1454d87dd:     	leaq	0x14d34b0(%rip), %rcx   # 0x1469abc94
1454d87e4:     	movq	%rcx, 0x48(%rbp)
1454d87e8:     	movq	$0x7, 0x50(%rbp)
1454d87f0:     	movq	%rbx, 0x58(%rbp)
1454d87f4:     	movq	%rax, 0x60(%rbp)
1454d87f8:     	leaq	0x14d3329(%rip), %rcx   # 0x1469abb28
1454d87ff:     	movq	%rcx, 0x68(%rbp)
1454d8803:     	movq	$0x3, 0x70(%rbp)
1454d880b:     	movq	%rbp, %rcx
1454d880e:     	movq	%rcx, 0x78(%rbp)
1454d8812:     	movq	%rax, 0x80(%rbp)
1454d8819:     	leaq	0x14d330b(%rip), %rcx   # 0x1469abb2b
1454d8820:     	movq	%rcx, 0x88(%rbp)
1454d8827:     	movq	$0x1, 0x90(%rbp)
1454d8832:     	leaq	-0x50(%rbp), %rcx
1454d8836:     	movq	%rcx, 0x98(%rbp)
1454d883d:     	movq	%rax, 0xa0(%rbp)
1454d8844:     	leaq	0x14d32c7(%rip), %rcx   # 0x1469abb12
1454d884b:     	movq	%rcx, 0xa8(%rbp)
1454d8852:     	movq	$0x2, 0xb0(%rbp)
1454d885d:     	leaq	-0x20(%rbp), %rcx
1454d8861:     	movq	%rcx, 0xb8(%rbp)
1454d8868:     	movq	%rax, 0xc0(%rbp)
1454d886f:     	movq	$0x5, 0x20(%rsp)
1454d8878:     	leaq	0x28(%rbp), %r9
1454d887c:     	movq	%rsi, %rcx
1454d887f:     	movq	%r12, %rdx
1454d8882:     	movq	%r13, %r8
1454d8885:     	callq	0x145452790 <.text+0x5451790>
1454d888a:     	nop
1454d888b:     	jmp	0x1454d946e <.text+0x54d846e>
1454d8890:     	je	0x1454d929c <.text+0x54d829c>
1454d8896:     	callq	0x140002200 <.text+0x1200>
1454d889b:     	movl	$0x1, %edx
1454d88a0:     	movq	%rdi, %rcx
1454d88a3:     	callq	0x1400021c0 <.text+0x11c0>
1454d88a8:     	movl	$0x1, %ecx
1454d88ad:     	testq	%rax, %rax
1454d88b0:     	je	0x1454d8777 <.text+0x54d7777>
1454d88b6:     	movq	%rax, %r12
1454d88b9:     	movq	%rax, %rcx
1454d88bc:     	movq	%r13, %rdx
1454d88bf:     	movq	%rdi, %r8
1454d88c2:     	callq	0x145756ddd <.text+0x5755ddd>
1454d88c7:     	jmp	0x1454d92a2 <.text+0x54d82a2>
1454d88cc:     	movl	0x54(%r15), %eax
1454d88d0:     	testl	%eax, %eax
1454d88d2:     	je	0x1454d8f2f <.text+0x54d7f2f>
1454d88d8:     	addl	0x18(%rbx), %eax
1454d88db:     	addl	0x40(%rbx), %eax
1454d88de:     	addl	0x34(%r14), %eax
1454d88e2:     	je	0x1454d8f2f <.text+0x54d7f2f>
1454d88e8:     	cmpl	$0x3, %eax
1454d88eb:     	movl	$0x3, %ecx
1454d88f0:     	cmovbl	%eax, %ecx
1454d88f3:     	movl	%ecx, 0x138(%rbp)
1454d88f9:     	cmpl	$0x1, %eax
1454d88fc:     	je	0x1454d8f39 <.text+0x54d7f39>
1454d8902:     	leaq	0x14d33a4(%rip), %rdi   # 0x1469abcad
1454d8909:     	movl	$0x20, %r12d
1454d890f:     	movl	$0x20, %edx
1454d8914:     	movq	%rdi, %rcx
1454d8917:     	callq	0x145452400 <.text+0x5451400>
1454d891c:     	nop
1454d891d:     	movq	%rdx, %r8
1454d8920:     	testq	%rax, %rax
1454d8923:     	cmovneq	%rax, %rdi
1454d8927:     	cmoveq	%r12, %r8
1454d892b:     	leaq	0x14d218e(%rip), %rax   # 0x1469aaac0
1454d8932:     	movq	%rax, 0x28(%rbp)
1454d8936:     	movq	$0x1, 0x30(%rbp)
1454d893e:     	leaq	0x138(%rbp), %rax
1454d8945:     	movq	%rax, 0x38(%rbp)
1454d8949:     	leaq	0x14d2150(%rip), %rax   # 0x1469aaaa0
1454d8950:     	movq	%rax, 0x40(%rbp)
1454d8954:     	movq	$0x1, 0x20(%rsp)
1454d895d:     	leaq	0x120(%rbp), %rcx
1454d8964:     	leaq	0x28(%rbp), %r9
1454d8968:     	movq	%rdi, %rdx
1454d896b:     	callq	0x145452790 <.text+0x5451790>
1454d8970:     	nop
1454d8971:     	jmp	0x1454d8fc2 <.text+0x54d7fc2>
1454d8976:     	movl	$0x1, 0x1c(%rbp)
1454d897d:     	leaq	0x14d31a8(%rip), %rdi   # 0x1469abb2c
1454d8984:     	movl	$0x11, %r13d
1454d898a:     	movl	$0x11, %edx
1454d898f:     	movq	%rdi, %rcx
1454d8992:     	callq	0x145452400 <.text+0x5451400>
1454d8997:     	nop
1454d8998:     	movq	%rdx, %r12
1454d899b:     	testq	%rax, %rax
1454d899e:     	cmovneq	%rax, %rdi
1454d89a2:     	cmoveq	%r13, %r12
1454d89a6:     	movq	$0x1, 0x20(%rsp)
1454d89af:     	leaq	0x28(%rbp), %rcx
1454d89b3:     	movl	$0x1, %r9d
1454d89b9:     	movq	%r12, %rdx
1454d89bc:     	xorl	%r8d, %r8d
1454d89bf:     	callq	0x14003bf90 <.text+0x3af90>
1454d89c4:     	movq	0x30(%rbp), %rcx
1454d89c8:     	cmpl	$0x1, 0x28(%rbp)
1454d89cc:     	je	0x1454d954d <.text+0x54d854d>
1454d89d2:     	movq	0x38(%rbp), %r13
1454d89d6:     	testq	%r12, %r12
1454d89d9:     	je	0x1454d89f1 <.text+0x54d79f1>
1454d89db:     	movq	%rcx, 0x20(%rbp)
1454d89df:     	movq	%r13, %rcx
1454d89e2:     	movq	%rdi, %rdx
1454d89e5:     	movq	%r12, %r8
1454d89e8:     	callq	0x145756ddd <.text+0x5755ddd>
1454d89ed:     	movq	0x20(%rbp), %rcx
1454d89f1:     	movq	%rcx, -0x38(%rbp)
1454d89f5:     	movq	%r13, -0x30(%rbp)
1454d89f9:     	movq	%r12, -0x28(%rbp)
1454d89fd:     	movss	0x58(%r15), %xmm6
1454d8a03:     	mulss	0x420335(%rip), %xmm6   # 0x1458f8d40
1454d8a0b:     	mulss	0x20(%rbx), %xmm6
1454d8a10:     	mulss	0x48(%rbx), %xmm6
1454d8a15:     	leaq	0x14d33cd(%rip), %r12   # 0x1469abde9
1454d8a1c:     	movl	$0xb1, %r13d
1454d8a22:     	movl	$0xb1, %edx
1454d8a27:     	movq	%r12, %rcx
1454d8a2a:     	callq	0x145452400 <.text+0x5451400>
1454d8a2f:     	nop
1454d8a30:     	movq	%rdx, %rdi
1454d8a33:     	testq	%rax, %rax
1454d8a36:     	cmovneq	%rax, %r12
1454d8a3a:     	cmoveq	%r13, %rdi
1454d8a3e:     	movl	$0x41c80000, 0x150(%rbp) # imm = 0x41C80000
1454d8a48:     	leaq	0x150(%rbp), %rax
1454d8a4f:     	movq	%rax, 0x28(%rbp)
1454d8a53:     	leaq	0x244886(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
1454d8a5a:     	movq	%rax, 0x30(%rbp)
1454d8a5e:     	leaq	0x14d0c20(%rip), %rdx   # 0x1469a9685
1454d8a65:     	leaq	0x120(%rbp), %rcx
1454d8a6c:     	leaq	0x28(%rbp), %r8
1454d8a70:     	callq	0x14570bf80 <.text+0x570af80>
1454d8a75:     	nop
1454d8a76:     	leaq	0x108(%rbp), %rcx
1454d8a7d:     	movaps	%xmm6, %xmm1
1454d8a80:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d8a85:     	nop
1454d8a86:     	movss	0x4c(%r15), %xmm1
1454d8a8c:     	leaq	0x150(%rbp), %r13
1454d8a93:     	movq	%r13, %rcx
1454d8a96:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d8a9b:     	nop
1454d8a9c:     	leaq	0x14d306f(%rip), %rax   # 0x1469abb12
1454d8aa3:     	movq	%rax, 0x28(%rbp)
1454d8aa7:     	movq	$0x2, 0x30(%rbp)
1454d8aaf:     	leaq	-0x20(%rbp), %rax
1454d8ab3:     	movq	%rax, 0x38(%rbp)
1454d8ab7:     	leaq	0x14d2722(%rip), %rax   # 0x1469ab1e0
1454d8abe:     	movq	%rax, 0x40(%rbp)
1454d8ac2:     	leaq	0x14d33d1(%rip), %rcx   # 0x1469abe9a
1454d8ac9:     	movq	%rcx, 0x48(%rbp)
1454d8acd:     	movq	$0x4, 0x50(%rbp)
1454d8ad5:     	leaq	0x120(%rbp), %rcx
1454d8adc:     	movq	%rcx, 0x58(%rbp)
1454d8ae0:     	movq	%rax, 0x60(%rbp)
1454d8ae4:     	leaq	0x14d33b3(%rip), %rcx   # 0x1469abe9e
1454d8aeb:     	movq	%rcx, 0x68(%rbp)
1454d8aef:     	movq	$0x3, 0x70(%rbp)
1454d8af7:     	leaq	0x108(%rbp), %rcx
1454d8afe:     	movq	%rcx, 0x78(%rbp)
1454d8b02:     	movq	%rax, 0x80(%rbp)
1454d8b09:     	leaq	0x14d3169(%rip), %rcx   # 0x1469abc79
1454d8b10:     	movq	%rcx, 0x88(%rbp)
1454d8b17:     	movq	$0x4, 0x90(%rbp)
1454d8b22:     	leaq	-0x38(%rbp), %rcx
1454d8b26:     	movq	%rcx, 0x98(%rbp)
1454d8b2d:     	movq	%rax, 0xa0(%rbp)
1454d8b34:     	leaq	0x14d3142(%rip), %rcx   # 0x1469abc7d
1454d8b3b:     	movq	%rcx, 0xa8(%rbp)
1454d8b42:     	movq	$0x5, 0xb0(%rbp)
1454d8b4d:     	movq	%r13, 0xb8(%rbp)
1454d8b54:     	movq	%rax, 0xc0(%rbp)
1454d8b5b:     	leaq	0x14d2fc6(%rip), %rcx   # 0x1469abb28
1454d8b62:     	movq	%rcx, 0xc8(%rbp)
1454d8b69:     	movq	$0x3, 0xd0(%rbp)
1454d8b74:     	movq	%rbp, %rcx
1454d8b77:     	movq	%rcx, 0xd8(%rbp)
1454d8b7e:     	movq	%rax, 0xe0(%rbp)
1454d8b85:     	movq	$0x6, 0x20(%rsp)
1454d8b8e:     	leaq	0x138(%rbp), %rcx
1454d8b95:     	leaq	0x28(%rbp), %r9
1454d8b99:     	movq	%r12, %rdx
1454d8b9c:     	movq	%rdi, %r8
1454d8b9f:     	callq	0x145452790 <.text+0x5451790>
1454d8ba4:     	nop
1454d8ba5:     	movq	0x150(%rbp), %rdx
1454d8bac:     	testq	%rdx, %rdx
1454d8baf:     	je	0x1454d8bc3 <.text+0x54d7bc3>
1454d8bb1:     	movq	0x158(%rbp), %rcx
1454d8bb8:     	movl	$0x1, %r8d
1454d8bbe:     	callq	0x1400021d0 <.text+0x11d0>
1454d8bc3:     	movq	0x108(%rbp), %rdx
1454d8bca:     	testq	%rdx, %rdx
1454d8bcd:     	je	0x1454d8be1 <.text+0x54d7be1>
1454d8bcf:     	movq	0x110(%rbp), %rcx
1454d8bd6:     	movl	$0x1, %r8d
1454d8bdc:     	callq	0x1400021d0 <.text+0x11d0>
1454d8be1:     	movq	0x120(%rbp), %rdx
1454d8be8:     	testq	%rdx, %rdx
1454d8beb:     	je	0x1454d8c00 <.text+0x54d7c00>
1454d8bed:     	movq	0x128(%rbp), %rcx
1454d8bf4:     	movl	$0x1, %r8d
1454d8bfa:     	callq	0x1400021d0 <.text+0x11d0>
1454d8bff:     	nop
1454d8c00:     	leaq	0x14d329a(%rip), %r12   # 0x1469abea1
1454d8c07:     	movl	$0x26, %edi
1454d8c0c:     	movl	$0x26, %edx
1454d8c11:     	movq	%r12, %rcx
1454d8c14:     	callq	0x145452400 <.text+0x5451400>
1454d8c19:     	nop
1454d8c1a:     	movq	%rdx, %r13
1454d8c1d:     	testq	%rax, %rax
1454d8c20:     	cmovneq	%rax, %r12
1454d8c24:     	cmoveq	%rdi, %r13
1454d8c28:     	movq	0x138(%rbp), %rax
1454d8c2f:     	movq	0x148(%rbp), %rdi
1454d8c36:     	subq	%rdi, %rax
1454d8c39:     	cmpq	%rax, %r13
1454d8c3c:     	ja	0x1454d951f <.text+0x54d851f>
1454d8c42:     	testq	%r13, %r13
1454d8c45:     	je	0x1454d8c5c <.text+0x54d7c5c>
1454d8c47:     	movq	0x140(%rbp), %rcx
1454d8c4e:     	addq	%rdi, %rcx
1454d8c51:     	movq	%r12, %rdx
1454d8c54:     	movq	%r13, %r8
1454d8c57:     	callq	0x145756ddd <.text+0x5755ddd>
1454d8c5c:     	addq	%r13, %rdi
1454d8c5f:     	movq	%rdi, 0x148(%rbp)
1454d8c66:     	movq	(%r15), %rcx
1454d8c69:     	movq	0x8(%r15), %rdx
1454d8c6d:     	cmpq	$0xb, %rdx
1454d8c71:     	je	0x1454d900b <.text+0x54d800b>
1454d8c77:     	cmpq	$0xa, %rdx
1454d8c7b:     	jne	0x1454d8ca1 <.text+0x54d7ca1>
1454d8c7d:     	movq	(%rcx), %rax
1454d8c80:     	xorq	0x1244b05(%rip), %rax   # 0x14671d78c
1454d8c87:     	movzwl	0x8(%rcx), %r8d
1454d8c8c:     	xorw	0x1244b00(%rip), %r8w   # 0x14671d794
1454d8c94:     	movzwl	%r8w, %r8d
1454d8c98:     	orq	%rax, %r8
1454d8c9b:     	je	0x1454d9029 <.text+0x54d8029>
1454d8ca1:     	movss	0x48(%r15), %xmm7
1454d8ca7:     	mulss	0x420091(%rip), %xmm7   # 0x1458f8d40
1454d8caf:     	mulss	0x14(%rbx), %xmm7
1454d8cb4:     	mulss	0x3c(%rbx), %xmm7
1454d8cb9:     	mulss	0x8(%r14), %xmm7
1454d8cbf:     	maxss	0x414349(%rip), %xmm7   # 0x1458ed010
1454d8cc7:     	callq	0x14541b8b0 <.text+0x541a8b0>
1454d8ccc:     	maxss	%xmm7, %xmm0
1454d8cd0:     	movss	0x50(%rbx), %xmm1
1454d8cd5:     	maxss	0x41d943(%rip), %xmm1   # 0x1458f6620
1454d8cdd:     	divss	%xmm1, %xmm0
1454d8ce1:     	jmp	0x1454d9031 <.text+0x54d8031>
1454d8ce6:     	movl	$0x1, %r14d
1454d8cec:     	movq	%rdi, 0x138(%rbp)
1454d8cf3:     	movq	%r14, 0x140(%rbp)
1454d8cfa:     	movq	%rdi, 0x148(%rbp)
1454d8d01:     	leaq	0x14d2e4c(%rip), %rbx   # 0x1469abb54
1454d8d08:     	movl	$0x125, %edi            # imm = 0x125
1454d8d0d:     	movl	$0x125, %edx            # imm = 0x125
1454d8d12:     	movq	%rbx, %rcx
1454d8d15:     	callq	0x145452400 <.text+0x5451400>
1454d8d1a:     	nop
1454d8d1b:     	movq	%rdx, %r14
1454d8d1e:     	testq	%rax, %rax
1454d8d21:     	cmovneq	%rax, %rbx
1454d8d25:     	cmoveq	%rdi, %r14
1454d8d29:     	movss	0x4c(%r15), %xmm1
1454d8d2f:     	leaq	0x120(%rbp), %rdi
1454d8d36:     	movq	%rdi, %rcx
1454d8d39:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d8d3e:     	nop
1454d8d3f:     	mulss	%xmm7, %xmm6
1454d8d43:     	xorps	%xmm1, %xmm1
1454d8d46:     	sqrtss	%xmm6, %xmm1
1454d8d4a:     	mulss	0x41d8d6(%rip), %xmm1   # 0x1458f6628
1454d8d52:     	minss	0x424092(%rip), %xmm1   # 0x1458fcdec
1454d8d5a:     	mulss	0x4127ca(%rip), %xmm1   # 0x1458eb52c
1454d8d62:     	leaq	0x108(%rbp), %r13
1454d8d69:     	movq	%r13, %rcx
1454d8d6c:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d8d71:     	nop
1454d8d72:     	leaq	0x150(%rbp), %r12
1454d8d79:     	movss	0x412777(%rip), %xmm1   # 0x1458eb4f8
1454d8d81:     	movq	%r12, %rcx
1454d8d84:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d8d89:     	nop
1454d8d8a:     	leaq	0x14d2ee8(%rip), %rax   # 0x1469abc79
1454d8d91:     	movq	%rax, 0x28(%rbp)
1454d8d95:     	movq	$0x4, 0x30(%rbp)
1454d8d9d:     	leaq	0x138(%rbp), %rax
1454d8da4:     	movq	%rax, 0x38(%rbp)
1454d8da8:     	leaq	0x14d2431(%rip), %rax   # 0x1469ab1e0
1454d8daf:     	movq	%rax, 0x40(%rbp)
1454d8db3:     	leaq	0x14d2ec3(%rip), %rcx   # 0x1469abc7d
1454d8dba:     	movq	%rcx, 0x48(%rbp)
1454d8dbe:     	movq	$0x5, 0x50(%rbp)
1454d8dc6:     	movq	%rdi, 0x58(%rbp)
1454d8dca:     	movq	%rax, 0x60(%rbp)
1454d8dce:     	leaq	0x14d2bfb(%rip), %rcx   # 0x1469ab9d0
1454d8dd5:     	movq	%rcx, 0x68(%rbp)
1454d8dd9:     	movq	$0x1, 0x70(%rbp)
1454d8de1:     	movq	%r13, 0x78(%rbp)
1454d8de5:     	movq	%rax, 0x80(%rbp)
1454d8dec:     	leaq	0x14d2d35(%rip), %rcx   # 0x1469abb28
1454d8df3:     	movq	%rcx, 0x88(%rbp)
1454d8dfa:     	movq	$0x3, 0x90(%rbp)
1454d8e05:     	movq	%rbp, %rcx
1454d8e08:     	movq	%rcx, 0x98(%rbp)
1454d8e0f:     	movq	%rax, 0xa0(%rbp)
1454d8e16:     	leaq	0x14d2e73(%rip), %rcx   # 0x1469abc90
1454d8e1d:     	movq	%rcx, 0xa8(%rbp)
1454d8e24:     	movq	$0x4, 0xb0(%rbp)
1454d8e2f:     	leaq	0x14d2e52(%rip), %rcx   # 0x1469abc88
1454d8e36:     	movq	%rcx, 0xb8(%rbp)
1454d8e3d:     	leaq	0x14d240c(%rip), %rcx   # 0x1469ab250
1454d8e44:     	movq	%rcx, 0xc0(%rbp)
1454d8e4b:     	leaq	0x14d2cd9(%rip), %rcx   # 0x1469abb2b
1454d8e52:     	movq	%rcx, 0xc8(%rbp)
1454d8e59:     	movq	$0x1, 0xd0(%rbp)
1454d8e64:     	leaq	-0x50(%rbp), %rcx
1454d8e68:     	movq	%rcx, 0xd8(%rbp)
1454d8e6f:     	movq	%rax, 0xe0(%rbp)
1454d8e76:     	leaq	0x14d2e17(%rip), %rcx   # 0x1469abc94
1454d8e7d:     	movq	%rcx, 0xe8(%rbp)
1454d8e84:     	movq	$0x7, 0xf0(%rbp)
1454d8e8f:     	movq	%r12, 0xf8(%rbp)
1454d8e96:     	movq	%rax, 0x100(%rbp)
1454d8e9d:     	movq	$0x7, 0x20(%rsp)
1454d8ea6:     	leaq	0x28(%rbp), %r9
1454d8eaa:     	movq	%rsi, %rcx
1454d8ead:     	movq	%rbx, %rdx
1454d8eb0:     	movq	%r14, %r8
1454d8eb3:     	callq	0x145452790 <.text+0x5451790>
1454d8eb8:     	nop
1454d8eb9:     	movq	0x138(%rbp), %rdx
1454d8ec0:     	testq	%rdx, %rdx
1454d8ec3:     	je	0x1454d8ed7 <.text+0x54d7ed7>
1454d8ec5:     	movq	0x140(%rbp), %rcx
1454d8ecc:     	movl	$0x1, %r8d
1454d8ed2:     	callq	0x1400021d0 <.text+0x11d0>
1454d8ed7:     	movq	0x150(%rbp), %rdx
1454d8ede:     	testq	%rdx, %rdx
1454d8ee1:     	je	0x1454d8ef5 <.text+0x54d7ef5>
1454d8ee3:     	movq	0x158(%rbp), %rcx
1454d8eea:     	movl	$0x1, %r8d
1454d8ef0:     	callq	0x1400021d0 <.text+0x11d0>
1454d8ef5:     	movq	0x108(%rbp), %rdx
1454d8efc:     	testq	%rdx, %rdx
1454d8eff:     	je	0x1454d8f13 <.text+0x54d7f13>
1454d8f01:     	movq	0x110(%rbp), %rcx
1454d8f08:     	movl	$0x1, %r8d
1454d8f0e:     	callq	0x1400021d0 <.text+0x11d0>
1454d8f13:     	movq	0x120(%rbp), %rdx
1454d8f1a:     	testq	%rdx, %rdx
1454d8f1d:     	je	0x1454d94aa <.text+0x54d84aa>
1454d8f23:     	movq	0x128(%rbp), %rcx
1454d8f2a:     	jmp	0x1454d949f <.text+0x54d849f>
1454d8f2f:     	movl	$0x1, 0x138(%rbp)
1454d8f39:     	leaq	0x14d2d5b(%rip), %rdi   # 0x1469abc9b
1454d8f40:     	movl	$0x12, %r13d
1454d8f46:     	movl	$0x12, %edx
1454d8f4b:     	movq	%rdi, %rcx
1454d8f4e:     	callq	0x145452400 <.text+0x5451400>
1454d8f53:     	nop
1454d8f54:     	movq	%rdx, %r12
1454d8f57:     	testq	%rax, %rax
1454d8f5a:     	cmovneq	%rax, %rdi
1454d8f5e:     	cmoveq	%r13, %r12
1454d8f62:     	movq	$0x1, 0x20(%rsp)
1454d8f6b:     	leaq	0x28(%rbp), %rcx
1454d8f6f:     	movl	$0x1, %r9d
1454d8f75:     	movq	%r12, %rdx
1454d8f78:     	xorl	%r8d, %r8d
1454d8f7b:     	callq	0x14003bf90 <.text+0x3af90>
1454d8f80:     	movq	0x30(%rbp), %rcx
1454d8f84:     	cmpl	$0x1, 0x28(%rbp)
1454d8f88:     	je	0x1454d9559 <.text+0x54d8559>
1454d8f8e:     	movq	0x38(%rbp), %r13
1454d8f92:     	testq	%r12, %r12
1454d8f95:     	je	0x1454d8fad <.text+0x54d7fad>
1454d8f97:     	movq	%rcx, 0x20(%rbp)
1454d8f9b:     	movq	%r13, %rcx
1454d8f9e:     	movq	%rdi, %rdx
1454d8fa1:     	movq	%r12, %r8
1454d8fa4:     	callq	0x145756ddd <.text+0x5755ddd>
1454d8fa9:     	movq	0x20(%rbp), %rcx
1454d8fad:     	movq	%rcx, 0x120(%rbp)
1454d8fb4:     	movq	%r13, 0x128(%rbp)
1454d8fbb:     	movq	%r12, 0x130(%rbp)
1454d8fc2:     	leaq	0x14d2d04(%rip), %rdi   # 0x1469abccd
1454d8fc9:     	movl	$0x91, %r13d
1454d8fcf:     	movl	$0x91, %edx
1454d8fd4:     	movq	%rdi, %rcx
1454d8fd7:     	callq	0x145452400 <.text+0x5451400>
1454d8fdc:     	nop
1454d8fdd:     	movq	%rdx, %r12
1454d8fe0:     	testq	%rax, %rax
1454d8fe3:     	cmovneq	%rax, %rdi
1454d8fe7:     	cmoveq	%r13, %r12
1454d8feb:     	movq	%rbx, %rcx
1454d8fee:     	movq	%r14, %rdx
1454d8ff1:     	callq	0x14541b9d0 <.text+0x541a9d0>
1454d8ff6:     	testb	$0x1, %al
1454d8ff8:     	jne	0x1454d91be <.text+0x54d81be>
1454d8ffe:     	movss	0x423de6(%rip), %xmm0   # 0x1458fcdec
1454d9006:     	jmp	0x1454d91c6 <.text+0x54d81c6>
1454d900b:     	movq	(%rcx), %rax
1454d900e:     	xorq	0x1244781(%rip), %rax   # 0x14671d796
1454d9015:     	movq	0x3(%rcx), %r8
1454d9019:     	xorq	0x1244779(%rip), %r8    # 0x14671d799
1454d9020:     	orq	%rax, %r8
1454d9023:     	jne	0x1454d8ca1 <.text+0x54d7ca1>
1454d9029:     	movss	0x41ff6f(%rip), %xmm0   # 0x1458f8fa0
1454d9031:     	divss	%xmm0, %xmm6
1454d9035:     	movaps	%xmm6, %xmm0
1454d9038:     	callq	0x145756e6d <.text+0x5755e6d>
1454d903d:     	cvttss2si	%xmm0, %rax
1454d9042:     	movq	%rax, %rcx
1454d9045:     	sarq	$0x3f, %rcx
1454d9049:     	movaps	%xmm0, %xmm1
1454d904c:     	subss	0x41218c(%rip), %xmm1   # 0x1458eb1e0
1454d9054:     	cvttss2si	%xmm1, %rdx
1454d9059:     	andq	%rcx, %rdx
1454d905c:     	orq	%rax, %rdx
1454d905f:     	xorl	%eax, %eax
1454d9061:     	xorps	%xmm1, %xmm1
1454d9064:     	ucomiss	%xmm1, %xmm0
1454d9067:     	cmovaeq	%rdx, %rax
1454d906b:     	ucomiss	0x412172(%rip), %xmm0   # 0x1458eb1e4
1454d9072:     	movq	$-0x1, %rcx
1454d9079:     	cmovbeq	%rax, %rcx
1454d907d:     	cmpq	$0x3, %rcx
1454d9081:     	movl	$0x3, %eax
1454d9086:     	cmovbq	%rcx, %rax
1454d908a:     	testq	%rcx, %rcx
1454d908d:     	movl	$0x1, %ecx
1454d9092:     	cmovneq	%rax, %rcx
1454d9096:     	movq	%rcx, 0x108(%rbp)
1454d909d:     	cmpq	$0x1, %rcx
1454d90a1:     	jbe	0x1454d9193 <.text+0x54d8193>
1454d90a7:     	cmpq	%rdi, 0x138(%rbp)
1454d90ae:     	je	0x1454d9565 <.text+0x54d8565>
1454d90b4:     	movq	0x140(%rbp), %rbx
1454d90bb:     	movb	$0x20, (%rbx,%rdi)
1454d90bf:     	incq	%rdi
1454d90c2:     	movq	%rdi, 0x148(%rbp)
1454d90c9:     	leaq	0x14d2df7(%rip), %r14   # 0x1469abec7
1454d90d0:     	movl	$0x42, %r15d
1454d90d6:     	movl	$0x42, %edx
1454d90db:     	movq	%r14, %rcx
1454d90de:     	callq	0x145452400 <.text+0x5451400>
1454d90e3:     	nop
1454d90e4:     	movq	%rdx, %r8
1454d90e7:     	testq	%rax, %rax
1454d90ea:     	cmovneq	%rax, %r14
1454d90ee:     	cmoveq	%r15, %r8
1454d90f2:     	leaq	0x14d19c7(%rip), %rax   # 0x1469aaac0
1454d90f9:     	movq	%rax, 0x28(%rbp)
1454d90fd:     	movq	$0x1, 0x30(%rbp)
1454d9105:     	leaq	0x108(%rbp), %rax
1454d910c:     	movq	%rax, 0x38(%rbp)
1454d9110:     	leaq	0x14d2139(%rip), %rax   # 0x1469ab250
1454d9117:     	movq	%rax, 0x40(%rbp)
1454d911b:     	movq	$0x1, 0x20(%rsp)
1454d9124:     	leaq	0x150(%rbp), %rcx
1454d912b:     	leaq	0x28(%rbp), %r9
1454d912f:     	movq	%r14, %rdx
1454d9132:     	callq	0x145452790 <.text+0x5451790>
1454d9137:     	nop
1454d9138:     	movq	0x158(%rbp), %r15
1454d913f:     	movq	0x160(%rbp), %r14
1454d9146:     	movq	0x138(%rbp), %rax
1454d914d:     	subq	%rdi, %rax
1454d9150:     	cmpq	%rax, %r14
1454d9153:     	ja	0x1454d9596 <.text+0x54d8596>
1454d9159:     	testq	%r14, %r14
1454d915c:     	je	0x1454d916f <.text+0x54d816f>
1454d915e:     	addq	%rdi, %rbx
1454d9161:     	movq	%rbx, %rcx
1454d9164:     	movq	%r15, %rdx
1454d9167:     	movq	%r14, %r8
1454d916a:     	callq	0x145756ddd <.text+0x5755ddd>
1454d916f:     	addq	%r14, %rdi
1454d9172:     	movq	%rdi, 0x148(%rbp)
1454d9179:     	movq	0x150(%rbp), %rdx
1454d9180:     	testq	%rdx, %rdx
1454d9183:     	je	0x1454d9193 <.text+0x54d8193>
1454d9185:     	movl	$0x1, %r8d
1454d918b:     	movq	%r15, %rcx
1454d918e:     	callq	0x1400021d0 <.text+0x11d0>
1454d9193:     	movq	0x148(%rbp), %rax
1454d919a:     	movq	%rax, 0x10(%rsi)
1454d919e:     	movups	0x138(%rbp), %xmm0
1454d91a5:     	movups	%xmm0, (%rsi)
1454d91a8:     	movq	-0x38(%rbp), %rdx
1454d91ac:     	testq	%rdx, %rdx
1454d91af:     	je	0x1454d94aa <.text+0x54d84aa>
1454d91b5:     	movq	-0x30(%rbp), %rcx
1454d91b9:     	jmp	0x1454d949f <.text+0x54d849f>
1454d91be:     	divss	0x41fc1e(%rip), %xmm0   # 0x1458f8de4
1454d91c6:     	leaq	0x108(%rbp), %r14
1454d91cd:     	movq	%r14, %rcx
1454d91d0:     	movaps	%xmm0, %xmm1
1454d91d3:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d91d8:     	nop
1454d91d9:     	movss	0x4c(%r15), %xmm1
1454d91df:     	leaq	0x150(%rbp), %rbx
1454d91e6:     	movq	%rbx, %rcx
1454d91e9:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d91ee:     	nop
1454d91ef:     	leaq	0x14d1dfc(%rip), %rax   # 0x1469aaff2
1454d91f6:     	movq	%rax, 0x28(%rbp)
1454d91fa:     	movq	$0x4, 0x30(%rbp)
1454d9202:     	movq	%r14, 0x38(%rbp)
1454d9206:     	leaq	0x14d1fd3(%rip), %rax   # 0x1469ab1e0
1454d920d:     	movq	%rax, 0x40(%rbp)
1454d9211:     	leaq	0x14d2a61(%rip), %rcx   # 0x1469abc79
1454d9218:     	movq	%rcx, 0x48(%rbp)
1454d921c:     	movq	$0x4, 0x50(%rbp)
1454d9224:     	leaq	0x120(%rbp), %rcx
1454d922b:     	movq	%rcx, 0x58(%rbp)
1454d922f:     	movq	%rax, 0x60(%rbp)
1454d9233:     	leaq	0x14d2a43(%rip), %rcx   # 0x1469abc7d
1454d923a:     	movq	%rcx, 0x68(%rbp)
1454d923e:     	movq	$0x5, 0x70(%rbp)
1454d9246:     	movq	%rbx, 0x78(%rbp)
1454d924a:     	movq	%rax, 0x80(%rbp)
1454d9251:     	leaq	0x14d28d0(%rip), %rcx   # 0x1469abb28
1454d9258:     	movq	%rcx, 0x88(%rbp)
1454d925f:     	movq	$0x3, 0x90(%rbp)
1454d926a:     	movq	%rbp, %rcx
1454d926d:     	movq	%rcx, 0x98(%rbp)
1454d9274:     	movq	%rax, 0xa0(%rbp)
1454d927b:     	movq	$0x4, 0x20(%rsp)
1454d9284:     	leaq	0x28(%rbp), %r9
1454d9288:     	movq	%rsi, %rcx
1454d928b:     	movq	%rdi, %rdx
1454d928e:     	movq	%r12, %r8
1454d9291:     	callq	0x145452790 <.text+0x5451790>
1454d9296:     	nop
1454d9297:     	jmp	0x1454d9450 <.text+0x54d8450>
1454d929c:     	movl	$0x1, %r12d
1454d92a2:     	movq	%rdi, 0x120(%rbp)
1454d92a9:     	movq	%r12, 0x128(%rbp)
1454d92b0:     	movq	%rdi, 0x130(%rbp)
1454d92b7:     	leaq	0x14d2c64(%rip), %r13   # 0x1469abf22
1454d92be:     	movl	$0x126, %edi            # imm = 0x126
1454d92c3:     	movl	$0x126, %edx            # imm = 0x126
1454d92c8:     	movq	%r13, %rcx
1454d92cb:     	callq	0x145452400 <.text+0x5451400>
1454d92d0:     	nop
1454d92d1:     	movq	%rdx, %r12
1454d92d4:     	testq	%rax, %rax
1454d92d7:     	cmovneq	%rax, %r13
1454d92db:     	cmoveq	%rdi, %r12
1454d92df:     	movq	(%r15), %rcx
1454d92e2:     	movq	0x8(%r15), %rdx
1454d92e6:     	cmpq	$0xb, %rdx
1454d92ea:     	je	0x1454d9360 <.text+0x54d8360>
1454d92ec:     	cmpq	$0xa, %rdx
1454d92f0:     	jne	0x1454d9312 <.text+0x54d8312>
1454d92f2:     	movq	(%rcx), %rax
1454d92f5:     	xorq	0x1244490(%rip), %rax   # 0x14671d78c
1454d92fc:     	movzwl	0x8(%rcx), %r8d
1454d9301:     	xorw	0x124448b(%rip), %r8w   # 0x14671d794
1454d9309:     	movzwl	%r8w, %r8d
1454d930d:     	orq	%rax, %r8
1454d9310:     	je	0x1454d937a <.text+0x54d837a>
1454d9312:     	movss	0x48(%r15), %xmm6
1454d9318:     	mulss	0x41fa20(%rip), %xmm6   # 0x1458f8d40
1454d9320:     	mulss	0x14(%rbx), %xmm6
1454d9325:     	mulss	0x3c(%rbx), %xmm6
1454d932a:     	mulss	0x8(%r14), %xmm6
1454d9330:     	maxss	0x413cd8(%rip), %xmm6   # 0x1458ed010
1454d9338:     	callq	0x14541b8b0 <.text+0x541a8b0>
1454d933d:     	movss	0x50(%rbx), %xmm1
1454d9342:     	maxss	0x41d2d6(%rip), %xmm1   # 0x1458f6620
1454d934a:     	maxss	%xmm6, %xmm0
1454d934e:     	divss	%xmm1, %xmm0
1454d9352:     	movss	0x41fa8a(%rip), %xmm1   # 0x1458f8de4
1454d935a:     	divss	%xmm0, %xmm1
1454d935e:     	jmp	0x1454d9382 <.text+0x54d8382>
1454d9360:     	movq	(%rcx), %rax
1454d9363:     	xorq	0x124442c(%rip), %rax   # 0x14671d796
1454d936a:     	movq	0x3(%rcx), %r8
1454d936e:     	xorq	0x1244424(%rip), %r8    # 0x14671d799
1454d9375:     	orq	%rax, %r8
1454d9378:     	jne	0x1454d9312 <.text+0x54d8312>
1454d937a:     	movss	0x41d2a2(%rip), %xmm1   # 0x1458f6624
1454d9382:     	leaq	0x108(%rbp), %rbx
1454d9389:     	movq	%rbx, %rcx
1454d938c:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d9391:     	nop
1454d9392:     	movss	0x4c(%r15), %xmm1
1454d9398:     	leaq	0x150(%rbp), %rdi
1454d939f:     	movq	%rdi, %rcx
1454d93a2:     	callq	0x14547ccf0 <.text+0x547bcf0>
1454d93a7:     	nop
1454d93a8:     	leaq	0x14d28e5(%rip), %rax   # 0x1469abc94
1454d93af:     	movq	%rax, 0x28(%rbp)
1454d93b3:     	movq	$0x7, 0x30(%rbp)
1454d93bb:     	movq	%rbx, 0x38(%rbp)
1454d93bf:     	leaq	0x14d1e1a(%rip), %rax   # 0x1469ab1e0
1454d93c6:     	movq	%rax, 0x40(%rbp)
1454d93ca:     	leaq	0x14d28a8(%rip), %rcx   # 0x1469abc79
1454d93d1:     	movq	%rcx, 0x48(%rbp)
1454d93d5:     	movq	$0x4, 0x50(%rbp)
1454d93dd:     	leaq	0x120(%rbp), %rcx
1454d93e4:     	movq	%rcx, 0x58(%rbp)
1454d93e8:     	movq	%rax, 0x60(%rbp)
1454d93ec:     	leaq	0x14d288a(%rip), %rcx   # 0x1469abc7d
1454d93f3:     	movq	%rcx, 0x68(%rbp)
1454d93f7:     	movq	$0x5, 0x70(%rbp)
1454d93ff:     	movq	%rdi, 0x78(%rbp)
1454d9403:     	movq	%rax, 0x80(%rbp)
1454d940a:     	leaq	0x14d2717(%rip), %rcx   # 0x1469abb28
1454d9411:     	movq	%rcx, 0x88(%rbp)
1454d9418:     	movq	$0x3, 0x90(%rbp)
1454d9423:     	movq	%rbp, %rcx
1454d9426:     	movq	%rcx, 0x98(%rbp)
1454d942d:     	movq	%rax, 0xa0(%rbp)
1454d9434:     	movq	$0x4, 0x20(%rsp)
1454d943d:     	leaq	0x28(%rbp), %r9
1454d9441:     	movq	%rsi, %rcx
1454d9444:     	movq	%r13, %rdx
1454d9447:     	movq	%r12, %r8
1454d944a:     	callq	0x145452790 <.text+0x5451790>
1454d944f:     	nop
1454d9450:     	movq	0x120(%rbp), %rdx
1454d9457:     	testq	%rdx, %rdx
1454d945a:     	je	0x1454d946e <.text+0x54d846e>
1454d945c:     	movq	0x128(%rbp), %rcx
1454d9463:     	movl	$0x1, %r8d
1454d9469:     	callq	0x1400021d0 <.text+0x11d0>
1454d946e:     	movq	0x150(%rbp), %rdx
1454d9475:     	testq	%rdx, %rdx
1454d9478:     	je	0x1454d948c <.text+0x54d848c>
1454d947a:     	movq	0x158(%rbp), %rcx
1454d9481:     	movl	$0x1, %r8d
1454d9487:     	callq	0x1400021d0 <.text+0x11d0>
1454d948c:     	movq	0x108(%rbp), %rdx
1454d9493:     	testq	%rdx, %rdx
1454d9496:     	je	0x1454d94aa <.text+0x54d84aa>
1454d9498:     	movq	0x110(%rbp), %rcx
1454d949f:     	movl	$0x1, %r8d
1454d94a5:     	callq	0x1400021d0 <.text+0x11d0>
1454d94aa:     	movq	-0x20(%rbp), %rdx
1454d94ae:     	testq	%rdx, %rdx
1454d94b1:     	je	0x1454d94c2 <.text+0x54d84c2>
1454d94b3:     	movq	-0x18(%rbp), %rcx
1454d94b7:     	movl	$0x1, %r8d
1454d94bd:     	callq	0x1400021d0 <.text+0x11d0>
1454d94c2:     	movq	-0x50(%rbp), %rdx
1454d94c6:     	testq	%rdx, %rdx
1454d94c9:     	je	0x1454d94da <.text+0x54d84da>
1454d94cb:     	movq	-0x48(%rbp), %rcx
1454d94cf:     	movl	$0x1, %r8d
1454d94d5:     	callq	0x1400021d0 <.text+0x11d0>
1454d94da:     	movq	(%rbp), %rdx
1454d94de:     	testq	%rdx, %rdx
1454d94e1:     	je	0x1454d94f2 <.text+0x54d84f2>
1454d94e3:     	movq	0x8(%rbp), %rcx
1454d94e7:     	movl	$0x1, %r8d
1454d94ed:     	callq	0x1400021d0 <.text+0x11d0>
1454d94f2:     	movq	%rsi, %rax
1454d94f5:     	movaps	0x170(%rbp), %xmm6
1454d94fc:     	movaps	0x180(%rbp), %xmm7
1454d9503:     	movaps	0x190(%rbp), %xmm8
1454d950b:     	addq	$0x228, %rsp            # imm = 0x228
1454d9512:     	popq	%rbx
1454d9513:     	popq	%rdi
1454d9514:     	popq	%rsi
1454d9515:     	popq	%r12
1454d9517:     	popq	%r13
1454d9519:     	popq	%r14
1454d951b:     	popq	%r15
1454d951d:     	popq	%rbp
1454d951e:     	retq
1454d951f:     	movq	$0x1, 0x20(%rsp)
1454d9528:     	leaq	0x138(%rbp), %rcx
1454d952f:     	movl	$0x1, %r9d
1454d9535:     	movq	%rdi, %rdx
1454d9538:     	movq	%r13, %r8
1454d953b:     	callq	0x145757d40 <.text+0x5756d40>
1454d9540:     	nop
1454d9541:     	movq	0x148(%rbp), %rdi
1454d9548:     	jmp	0x1454d8c47 <.text+0x54d7c47>
1454d954d:     	movq	0x38(%rbp), %rdx
1454d9551:     	callq	0x1458e721b <.text+0x58e621b>
1454d9556:     	nop
1454d9557:     	jmp	0x1454d9563 <.text+0x54d8563>
1454d9559:     	movq	0x38(%rbp), %rdx
1454d955d:     	callq	0x1458e721b <.text+0x58e621b>
1454d9562:     	nop
1454d9563:     	ud2
1454d9565:     	movq	$0x1, 0x20(%rsp)
1454d956e:     	leaq	0x138(%rbp), %rcx
1454d9575:     	movl	$0x1, %r8d
1454d957b:     	movl	$0x1, %r9d
1454d9581:     	movq	%rdi, %rdx
1454d9584:     	callq	0x145757d40 <.text+0x5756d40>
1454d9589:     	nop
1454d958a:     	movq	0x148(%rbp), %rdi
1454d9591:     	jmp	0x1454d90b4 <.text+0x54d80b4>
1454d9596:     	movq	%r15, 0x20(%rbp)
1454d959a:     	movq	$0x1, 0x20(%rsp)
1454d95a3:     	leaq	0x138(%rbp), %rcx
1454d95aa:     	movl	$0x1, %r9d
1454d95b0:     	movq	%rdi, %rdx
1454d95b3:     	movq	%r14, %r8
1454d95b6:     	callq	0x145757d40 <.text+0x5756d40>
1454d95bb:     	nop
1454d95bc:     	movq	0x140(%rbp), %rbx
1454d95c3:     	movq	0x148(%rbp), %rdi
1454d95ca:     	movq	0x20(%rbp), %r15
1454d95ce:     	jmp	0x1454d915e <.text+0x54d815e>

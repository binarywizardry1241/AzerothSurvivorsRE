
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b07c0:     	pushq	%rbp
1454b07c1:     	pushq	%r15
1454b07c3:     	pushq	%r14
1454b07c5:     	pushq	%r13
1454b07c7:     	pushq	%r12
1454b07c9:     	pushq	%rsi
1454b07ca:     	pushq	%rdi
1454b07cb:     	pushq	%rbx
1454b07cc:     	subq	$0x2a8, %rsp            # imm = 0x2A8
1454b07d3:     	leaq	0x80(%rsp), %rbp
1454b07db:     	movaps	%xmm15, 0x210(%rbp)
1454b07e3:     	movaps	%xmm14, 0x200(%rbp)
1454b07eb:     	movaps	%xmm13, 0x1f0(%rbp)
1454b07f3:     	movaps	%xmm12, 0x1e0(%rbp)
1454b07fb:     	movaps	%xmm11, 0x1d0(%rbp)
1454b0803:     	movaps	%xmm10, 0x1c0(%rbp)
1454b080b:     	movaps	%xmm9, 0x1b0(%rbp)
1454b0813:     	movaps	%xmm8, 0x1a0(%rbp)
1454b081b:     	movaps	%xmm7, 0x190(%rbp)
1454b0822:     	movaps	%xmm6, 0x180(%rbp)
1454b0829:     	movq	$-0x2, 0x178(%rbp)
1454b0834:     	movq	%rcx, %r12
1454b0837:     	movb	$0x1, 0x95f(%rcx)
1454b083e:     	xorl	%ecx, %ecx
1454b0840:     	callq	0x14545cd00 <.text+0x545bd00>
1454b0845:     	cmpb	$0x0, 0x958(%r12)
1454b084e:     	movq	%r12, 0x120(%rbp)
1454b0855:     	je	0x1454b0b59 <.text+0x54afb59>
1454b085b:     	movzbl	0x284(%r12), %eax
1454b0864:     	addb	$-0x2, %al
1454b0866:     	cmpb	$0x9, %al
1454b0868:     	ja	0x1454b087a <.text+0x54af87a>
1454b086a:     	movzbl	%al, %eax
1454b086d:     	leaq	0x14fc1b4(%rip), %rcx   # 0x1469aca28
1454b0874:     	movq	(%rcx,%rax,8), %rax
1454b0878:     	jmp	0x1454b0881 <.text+0x54af881>
1454b087a:     	leaq	0x1267ee7(%rip), %rax   # 0x146718768
1454b0881:     	movq	0x30(%rax), %rcx
1454b0885:     	movq	0x38(%rax), %rax
1454b0889:     	shlq	$0x4, %rax
1454b088d:     	addq	%rcx, %rax
1454b0890:     	movq	%rcx, 0x130(%rbp)
1454b0897:     	movq	%rax, 0x138(%rbp)
1454b089e:     	movq	%r12, 0x140(%rbp)
1454b08a5:     	leaq	0x100(%rbp), %rcx
1454b08ac:     	leaq	0x130(%rbp), %rdx
1454b08b3:     	callq	0x145536460 <.text+0x5535460>
1454b08b8:     	leaq	0x290(%r12), %rsi
1454b08c0:     	movq	0x290(%r12), %rax
1454b08c8:     	testq	%rax, %rax
1454b08cb:     	je	0x1454b08e4 <.text+0x54af8e4>
1454b08cd:     	movq	0x298(%r12), %rcx
1454b08d5:     	imulq	$0x58, %rax, %rdx
1454b08d9:     	movl	$0x8, %r8d
1454b08df:     	callq	0x1400021d0 <.text+0x11d0>
1454b08e4:     	movq	0x110(%rbp), %rax
1454b08eb:     	movq	%rax, 0x10(%rsi)
1454b08ef:     	movups	0x100(%rbp), %xmm0
1454b08f6:     	movups	%xmm0, (%rsi)
1454b08f9:     	leaq	0x130(%rbp), %rcx
1454b0900:     	callq	0x1454764b0 <.text+0x54754b0>
1454b0905:     	movq	0x130(%rbp), %rax
1454b090c:     	movq	%rax, 0xf8(%rbp)
1454b0913:     	movq	0x138(%rbp), %rax
1454b091a:     	movq	%rax, 0xd8(%rbp)
1454b0921:     	movq	0x140(%rbp), %rsi
1454b0928:     	testq	%rsi, %rsi
1454b092b:     	je	0x1454b0abd <.text+0x54afabd>
1454b0931:     	shlq	$0x4, %rsi
1454b0935:     	movq	0xd8(%rbp), %r14
1454b093c:     	addq	%r14, %rsi
1454b093f:     	leaq	0x14(%rbp), %r15
1454b0943:     	leaq	0x6c0(%r12), %rax
1454b094b:     	movq	%rax, 0x170(%rbp)
1454b0952:     	leaq	0xb0(%r12), %rax
1454b095a:     	movq	%rax, 0x128(%rbp)
1454b0961:     	leaq	0x1269100(%rip), %rbx   # 0x146719a68
1454b0968:     	xorps	%xmm6, %xmm6
1454b096b:     	movsd	0x4483ad(%rip), %xmm7   # 0x1458f8d20
1454b0973:     	movsd	0x43abc4(%rip), %xmm8   # 0x1458eb540
1454b097c:     	movaps	0x4483ac(%rip), %xmm9   # 0x1458f8d30
1454b0984:     	jmp	0x1454b09f1 <.text+0x54af9f1>
1454b0986:     	nopw	%cs:(%rax,%rax)
1454b0990:     	movq	0xb8(%r12), %rax
1454b0998:     	leaq	(%rdi,%rdi,2), %rcx
1454b099c:     	shlq	$0x5, %rcx
1454b09a0:     	movq	0x40(%rbp), %rdx
1454b09a4:     	movq	%rdx, 0x50(%rax,%rcx)
1454b09a9:     	movups	0x30(%rbp), %xmm0
1454b09ad:     	movups	%xmm0, 0x40(%rax,%rcx)
1454b09b2:     	movups	-0x10(%rbp), %xmm0
1454b09b6:     	movups	(%rbp), %xmm1
1454b09ba:     	movups	0x10(%rbp), %xmm2
1454b09be:     	movups	0x20(%rbp), %xmm3
1454b09c2:     	movups	%xmm3, 0x30(%rax,%rcx)
1454b09c7:     	movups	%xmm2, 0x20(%rax,%rcx)
1454b09cc:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b09d1:     	movups	%xmm0, (%rax,%rcx)
1454b09d5:     	movl	$0x0, 0x58(%rax,%rcx)
1454b09dd:     	incq	%rdi
1454b09e0:     	movq	%rdi, 0xc0(%r12)
1454b09e8:     	cmpq	%rsi, %r14
1454b09eb:     	je	0x1454b0abd <.text+0x54afabd>
1454b09f1:     	movq	(%r14), %r13
1454b09f4:     	movq	0x8(%r14), %rdi
1454b09f8:     	addq	$0x10, %r14
1454b09fc:     	movq	%r13, 0x100(%rbp)
1454b0a03:     	movq	%rdi, 0x108(%rbp)
1454b0a0a:     	xorl	%r12d, %r12d
1454b0a0d:     	jmp	0x1454b0a21 <.text+0x54afa21>
1454b0a0f:     	nop
1454b0a10:     	addq	$0x78, %r12
1454b0a14:     	cmpq	$0x3480, %r12           # imm = 0x3480
1454b0a1b:     	je	0x1454b37e1 <.text+0x54b27e1>
1454b0a21:     	cmpq	%rdi, 0x8(%r12,%rbx)
1454b0a26:     	jne	0x1454b0a10 <.text+0x54afa10>
1454b0a28:     	movq	(%r12,%rbx), %rcx
1454b0a2c:     	movq	%r13, %rdx
1454b0a2f:     	movq	%rdi, %r8
1454b0a32:     	callq	0x145756dd7 <.text+0x5755dd7>
1454b0a37:     	testl	%eax, %eax
1454b0a39:     	jne	0x1454b0a10 <.text+0x54afa10>
1454b0a3b:     	movups	%xmm6, (%r15)
1454b0a3f:     	movl	$0x0, 0x10(%r15)
1454b0a47:     	addq	%rbx, %r12
1454b0a4a:     	movq	%r12, -0x10(%rbp)
1454b0a4e:     	movl	$0x1, -0x8(%rbp)
1454b0a55:     	movsd	%xmm7, -0x4(%rbp)
1454b0a5a:     	movq	$0x3f800000, 0x4(%rbp)  # imm = 0x3F800000
1454b0a62:     	movsd	%xmm8, 0xc(%rbp)
1454b0a68:     	movsd	%xmm8, 0x28(%rbp)
1454b0a6e:     	movl	$0x0, 0x30(%rbp)
1454b0a75:     	movups	%xmm9, 0x34(%rbp)
1454b0a7a:     	leaq	0x28(%rbp), %rcx
1454b0a7e:     	movq	0x170(%rbp), %rdx
1454b0a85:     	movq	%r12, %r8
1454b0a88:     	callq	0x145415f40 <.text+0x5414f40>
1454b0a8d:     	nop
1454b0a8e:     	movq	0x120(%rbp), %r12
1454b0a95:     	movq	0xc0(%r12), %rdi
1454b0a9d:     	cmpq	0xb0(%r12), %rdi
1454b0aa5:     	jne	0x1454b0990 <.text+0x54af990>
1454b0aab:     	movq	0x128(%rbp), %rcx
1454b0ab2:     	callq	0x145763d70 <.text+0x5762d70>
1454b0ab7:     	nop
1454b0ab8:     	jmp	0x1454b0990 <.text+0x54af990>
1454b0abd:     	movq	0xf8(%rbp), %rdx
1454b0ac4:     	testq	%rdx, %rdx
1454b0ac7:     	je	0x1454b0adf <.text+0x54afadf>
1454b0ac9:     	shlq	$0x4, %rdx
1454b0acd:     	movl	$0x8, %r8d
1454b0ad3:     	movq	0xd8(%rbp), %rcx
1454b0ada:     	callq	0x1400021d0 <.text+0x11d0>
1454b0adf:     	movq	%r12, %rcx
1454b0ae2:     	callq	0x1454e3d30 <.text+0x54e2d30>
1454b0ae7:     	movq	0x210(%r12), %rcx
1454b0aef:     	movq	0x218(%r12), %rdx
1454b0af7:     	callq	0x14540e820 <.text+0x540d820>
1454b0afc:     	imulq	$0xf0, %rax, %rax
1454b0b03:     	leaq	0x126592e(%rip), %rcx   # 0x146716438
1454b0b0a:     	movq	0x88(%rax,%rcx), %rdi
1454b0b12:     	movq	%r12, %rcx
1454b0b15:     	movq	%rdi, %rdx
1454b0b18:     	callq	0x1454bf100 <.text+0x54be100>
1454b0b1d:     	leaq	0x58(%rdi), %rdx
1454b0b21:     	movq	%r12, %rcx
1454b0b24:     	callq	0x1454bf100 <.text+0x54be100>
1454b0b29:     	leaq	0xb0(%rdi), %rdx
1454b0b30:     	movq	%r12, %rcx
1454b0b33:     	callq	0x1454bf100 <.text+0x54be100>
1454b0b38:     	leaq	0x108(%rdi), %rdx
1454b0b3f:     	movq	%r12, %rcx
1454b0b42:     	callq	0x1454bf100 <.text+0x54be100>
1454b0b47:     	addq	$0x160, %rdi            # imm = 0x160
1454b0b4e:     	movq	%r12, %rcx
1454b0b51:     	movq	%rdi, %rdx
1454b0b54:     	callq	0x1454bf100 <.text+0x54be100>
1454b0b59:     	movq	0x210(%r12), %rcx
1454b0b61:     	movq	0x218(%r12), %rdx
1454b0b69:     	callq	0x14540e820 <.text+0x540d820>
1454b0b6e:     	imulq	$0xf0, %rax, %rsi
1454b0b75:     	leaq	0x12658bc(%rip), %rdi   # 0x146716438
1454b0b7c:     	leaq	(%rsi,%rdi), %r13
1454b0b80:     	addq	$0x8, %r13
1454b0b84:     	movq	%r13, 0x100(%rbp)
1454b0b8b:     	leaq	-0x54aead2(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454b0b92:     	movq	%rax, 0x108(%rbp)
1454b0b99:     	leaq	0x125ddfd(%rip), %rdx   # 0x14670e99d
1454b0ba0:     	leaq	0x130(%rbp), %rcx
1454b0ba7:     	leaq	0x100(%rbp), %r8
1454b0bae:     	callq	0x14570bf80 <.text+0x570af80>
1454b0bb3:     	movq	0x138(%rbp), %rcx
1454b0bba:     	movq	0x140(%rbp), %rdx
1454b0bc1:     	movq	0x18(%rsi,%rdi), %r12
1454b0bc6:     	movq	0x20(%rsi,%rdi), %r15
1454b0bcb:     	movq	%rcx, 0x170(%rbp)
1454b0bd2:     	callq	0x145452400 <.text+0x5451400>
1454b0bd7:     	nop
1454b0bd8:     	movq	%rax, %r14
1454b0bdb:     	movq	%rdx, %rbx
1454b0bde:     	addq	%rdi, %rsi
1454b0be1:     	movq	0x130(%rbp), %rdx
1454b0be8:     	testq	%rdx, %rdx
1454b0beb:     	je	0x1454b0bff <.text+0x54afbff>
1454b0bed:     	movl	$0x1, %r8d
1454b0bf3:     	movq	0x170(%rbp), %rcx
1454b0bfa:     	callq	0x1400021d0 <.text+0x11d0>
1454b0bff:     	testq	%r14, %r14
1454b0c02:     	cmovneq	%r14, %r12
1454b0c06:     	movq	%r12, 0x170(%rbp)
1454b0c0d:     	cmoveq	%r15, %rbx
1454b0c11:     	leaq	0x14fa512(%rip), %r12   # 0x1469ab12a
1454b0c18:     	movl	$0x25, %edi
1454b0c1d:     	movl	$0x25, %edx
1454b0c22:     	movq	%r12, %rcx
1454b0c25:     	callq	0x145452400 <.text+0x5451400>
1454b0c2a:     	movq	%rax, %r14
1454b0c2d:     	movq	%rdx, %r15
1454b0c30:     	testq	%rax, %rax
1454b0c33:     	cmoveq	%r12, %r14
1454b0c37:     	cmoveq	%rdi, %r15
1454b0c3b:     	movq	%r13, 0x100(%rbp)
1454b0c42:     	leaq	-0x54aeb89(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454b0c49:     	movq	%rax, 0x108(%rbp)
1454b0c50:     	leaq	0x125dd34(%rip), %rdx   # 0x14670e98b
1454b0c57:     	leaq	0x130(%rbp), %rcx
1454b0c5e:     	leaq	0x100(%rbp), %r8
1454b0c65:     	callq	0x14570bf80 <.text+0x570af80>
1454b0c6a:     	movq	0x138(%rbp), %rcx
1454b0c71:     	movq	0x140(%rbp), %rdx
1454b0c78:     	movq	0x28(%rsi), %rdi
1454b0c7c:     	movq	0x30(%rsi), %rsi
1454b0c80:     	movq	%rcx, 0x128(%rbp)
1454b0c87:     	callq	0x145452400 <.text+0x5451400>
1454b0c8c:     	nop
1454b0c8d:     	movq	%rax, %r13
1454b0c90:     	movq	%rdx, %r12
1454b0c93:     	movq	0x130(%rbp), %rdx
1454b0c9a:     	testq	%rdx, %rdx
1454b0c9d:     	je	0x1454b0cb1 <.text+0x54afcb1>
1454b0c9f:     	movl	$0x1, %r8d
1454b0ca5:     	movq	0x128(%rbp), %rcx
1454b0cac:     	callq	0x1400021d0 <.text+0x11d0>
1454b0cb1:     	testq	%r13, %r13
1454b0cb4:     	cmovneq	%r13, %rdi
1454b0cb8:     	cmoveq	%rsi, %r12
1454b0cbc:     	movq	%rdi, 0x60(%rbp)
1454b0cc0:     	movq	%r12, 0x68(%rbp)
1454b0cc4:     	leaq	0x14fa4a5(%rip), %rax   # 0x1469ab170
1454b0ccb:     	movq	%rax, 0x130(%rbp)
1454b0cd2:     	movq	$0x8, 0x138(%rbp)
1454b0cdd:     	leaq	0x60(%rbp), %rax
1454b0ce1:     	movq	%rax, 0x140(%rbp)
1454b0ce8:     	leaq	0x14fa461(%rip), %rax   # 0x1469ab150
1454b0cef:     	movq	%rax, 0x148(%rbp)
1454b0cf6:     	movq	$0x1, 0x20(%rsp)
1454b0cff:     	leaq	0x80(%rbp), %rcx
1454b0d06:     	leaq	0x130(%rbp), %r9
1454b0d0d:     	movq	%r14, %rdx
1454b0d10:     	movq	%r15, %r8
1454b0d13:     	callq	0x145452790 <.text+0x5451790>
1454b0d18:     	movq	0x88(%rbp), %r9
1454b0d1f:     	movq	0x90(%rbp), %rax
1454b0d26:     	movq	%rax, 0x20(%rsp)
1454b0d2b:     	leaq	0x100(%rbp), %rcx
1454b0d32:     	movq	0x170(%rbp), %rdx
1454b0d39:     	movq	%rbx, %r8
1454b0d3c:     	movq	%r9, 0x170(%rbp)
1454b0d43:     	callq	0x14543f640 <.text+0x543e640>
1454b0d48:     	nop
1454b0d49:     	movq	0x120(%rbp), %r13
1454b0d50:     	leaq	0x538(%r13), %rax
1454b0d57:     	movq	%rax, 0xc8(%rbp)
1454b0d5e:     	movq	0x548(%r13), %rsi
1454b0d65:     	cmpq	0x538(%r13), %rsi
1454b0d6c:     	jne	0x1454b0d7b <.text+0x54afd7b>
1454b0d6e:     	leaq	0x538(%r13), %rcx
1454b0d75:     	callq	0x1457580b0 <.text+0x57570b0>
1454b0d7a:     	nop
1454b0d7b:     	movq	0x540(%r13), %rax
1454b0d82:     	movq	%rsi, %rcx
1454b0d85:     	shlq	$0x5, %rcx
1454b0d89:     	movups	0x100(%rbp), %xmm0
1454b0d90:     	movups	0x110(%rbp), %xmm1
1454b0d97:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b0d9c:     	movups	%xmm0, (%rax,%rcx)
1454b0da0:     	incq	%rsi
1454b0da3:     	movq	%rsi, 0x548(%r13)
1454b0daa:     	movq	0x80(%rbp), %rdx
1454b0db1:     	testq	%rdx, %rdx
1454b0db4:     	je	0x1454b0dc8 <.text+0x54afdc8>
1454b0db6:     	movl	$0x1, %r8d
1454b0dbc:     	movq	0x170(%rbp), %rcx
1454b0dc3:     	callq	0x1400021d0 <.text+0x11d0>
1454b0dc8:     	callq	0x140002200 <.text+0x1200>
1454b0dcd:     	movl	$0x1, %ecx
1454b0dd2:     	movl	$0x1, %edx
1454b0dd7:     	callq	0x1400021c0 <.text+0x11c0>
1454b0ddc:     	testq	%rax, %rax
1454b0ddf:     	je	0x1454b396a <.text+0x54b296a>
1454b0de5:     	movb	$0x7b, (%rax)
1454b0de8:     	movq	$0x1, 0x130(%rbp)
1454b0df3:     	movq	%rax, 0x138(%rbp)
1454b0dfa:     	movq	$0x1, 0x140(%rbp)
1454b0e05:     	movb	$0x1, 0x148(%rbp)
1454b0e0c:     	leaq	0x14fa365(%rip), %rax   # 0x1469ab178
1454b0e13:     	movq	%rax, 0x20(%rsp)
1454b0e18:     	movq	$0x5, 0x28(%rsp)
1454b0e21:     	leaq	0x14fa229(%rip), %r8    # 0x1469ab051
1454b0e28:     	leaq	0x100(%rbp), %rcx
1454b0e2f:     	leaq	0x130(%rbp), %rdx
1454b0e36:     	movl	$0x4, %r9d
1454b0e3c:     	callq	0x145451620 <.text+0x5450620>
1454b0e41:     	movq	0x100(%rbp), %rax
1454b0e48:     	movq	0x110(%rbp), %rdi
1454b0e4f:     	cmpq	%rdi, %rax
1454b0e52:     	je	0x1454b381d <.text+0x54b281d>
1454b0e58:     	movq	%rax, 0x170(%rbp)
1454b0e5f:     	movq	0x108(%rbp), %rax
1454b0e66:     	movq	%rax, 0x128(%rbp)
1454b0e6d:     	movb	$0x7d, (%rax,%rdi)
1454b0e71:     	movq	0x560(%r13), %rsi
1454b0e78:     	cmpq	0x550(%r13), %rsi
1454b0e7f:     	jne	0x1454b0e8e <.text+0x54afe8e>
1454b0e81:     	leaq	0x550(%r13), %rcx
1454b0e88:     	callq	0x145757f60 <.text+0x5756f60>
1454b0e8d:     	nop
1454b0e8e:     	incq	%rdi
1454b0e91:     	movq	0x558(%r13), %rax
1454b0e98:     	leaq	(%rsi,%rsi,2), %rcx
1454b0e9c:     	movq	0x170(%rbp), %rdx
1454b0ea3:     	movq	%rdx, (%rax,%rcx,8)
1454b0ea7:     	movq	0x128(%rbp), %rdx
1454b0eae:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454b0eb3:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454b0eb8:     	incq	%rsi
1454b0ebb:     	movq	%rsi, 0x560(%r13)
1454b0ec2:     	movq	0x6f8(%r13), %rdx
1454b0ec9:     	movq	0x700(%r13), %r8
1454b0ed0:     	shlq	$0x6, %r8
1454b0ed4:     	addq	%rdx, %r8
1454b0ed7:     	leaq	0x100(%rbp), %rcx
1454b0ede:     	callq	0x145529ee0 <.text+0x5528ee0>
1454b0ee3:     	movq	0x110(%rbp), %rsi
1454b0eea:     	cmpq	$0x1, %rsi
1454b0eee:     	movq	%rsi, %rax
1454b0ef1:     	adcq	$0x0, %rax
1454b0ef5:     	movq	0x100(%rbp), %rcx
1454b0efc:     	movq	%rcx, 0x128(%rbp)
1454b0f03:     	movq	0x108(%rbp), %rcx
1454b0f0a:     	movq	%rcx, 0x170(%rbp)
1454b0f11:     	testq	%rsi, %rsi
1454b0f14:     	je	0x1454b0f95 <.text+0x54aff95>
1454b0f16:     	cvtsi2ss	%rax, %xmm6
1454b0f1b:     	shlq	$0x3, %rsi
1454b0f1f:     	xorl	%ebx, %ebx
1454b0f21:     	movss	0x43a55f(%rip), %xmm7   # 0x1458eb488
1454b0f29:     	movss	0x47fffe(%rip), %xmm8   # 0x145930f30
1454b0f32:     	movss	0x459fcd(%rip), %xmm9   # 0x14590af08
1454b0f3b:     	leaq	0x130(%rbp), %rdi
1454b0f42:     	nopw	%cs:(%rax,%rax)
1454b0f50:     	movq	0x170(%rbp), %rax
1454b0f57:     	movq	(%rax,%rbx,8), %rdx
1454b0f5b:     	xorps	%xmm2, %xmm2
1454b0f5e:     	cvtsi2ss	%rbx, %xmm2
1454b0f63:     	mulss	%xmm7, %xmm2
1454b0f67:     	divss	%xmm6, %xmm2
1454b0f6b:     	addss	%xmm8, %xmm2
1454b0f70:     	mulss	%xmm9, %xmm2
1454b0f75:     	movq	$0x0, 0x130(%rbp)
1454b0f80:     	movq	%r13, %rcx
1454b0f83:     	movq	%rdi, %r9
1454b0f86:     	callq	0x1454b89d0 <.text+0x54b79d0>
1454b0f8b:     	nop
1454b0f8c:     	incq	%rbx
1454b0f8f:     	addq	$-0x8, %rsi
1454b0f93:     	jne	0x1454b0f50 <.text+0x54aff50>
1454b0f95:     	movq	0x128(%rbp), %rdx
1454b0f9c:     	testq	%rdx, %rdx
1454b0f9f:     	je	0x1454b0fb7 <.text+0x54affb7>
1454b0fa1:     	shlq	$0x3, %rdx
1454b0fa5:     	movl	$0x8, %r8d
1454b0fab:     	movq	0x170(%rbp), %rcx
1454b0fb2:     	callq	0x1400021d0 <.text+0x11d0>
1454b0fb7:     	cmpb	$0x0, 0x958(%r13)
1454b0fbf:     	leaq	0x130(%rbp), %rdx
1454b0fc6:     	jne	0x1454b1fda <.text+0x54b0fda>
1454b0fcc:     	leaq	0x1e0(%r13), %rax
1454b0fd3:     	leaq	0x200(%r13), %rcx
1454b0fda:     	movq	$0x0, 0x130(%rbp)
1454b0fe5:     	movq	$0x0, 0x140(%rbp)
1454b0ff0:     	movq	%rax, 0x150(%rbp)
1454b0ff7:     	movq	%rcx, 0x158(%rbp)
1454b0ffe:     	leaq	-0x28(%rbp), %rcx
1454b1002:     	callq	0x1455283d0 <.text+0x55273d0>
1454b1007:     	movq	-0x28(%rbp), %rax
1454b100b:     	movq	%rax, 0xd0(%rbp)
1454b1012:     	movq	-0x20(%rbp), %rdx
1454b1016:     	movq	-0x18(%rbp), %rcx
1454b101a:     	shlq	$0x4, %rcx
1454b101e:     	addq	%rdx, %rcx
1454b1021:     	movq	%rcx, 0xc0(%rbp)
1454b1028:     	leaq	0x820(%r13), %rcx
1454b102f:     	movq	%rcx, 0xa8(%rbp)
1454b1036:     	movss	0x14f9381(%rip), %xmm10 # 0x1469aa3c0
1454b103f:     	movss	0x459ec0(%rip), %xmm11  # 0x14590af08
1454b1048:     	movss	0x43a4bb(%rip), %xmm12  # 0x1458eb50c
1454b1051:     	movss	0x43a426(%rip), %xmm13  # 0x1458eb480
1454b105a:     	movss	0x44bd81(%rip), %xmm14  # 0x1458fcde4
1454b1063:     	movw	$0x1c, %bx
1454b1067:     	movw	$0x16, %r15w
1454b106c:     	movw	$0x4, %r13w
1454b1071:     	movw	$0x3, %r14w
1454b1076:     	movw	$0x2, %r12w
1454b107b:     	xorl	%edi, %edi
1454b107d:     	movq	%rdx, 0xb0(%rbp)
1454b1084:     	cmpq	0xc0(%rbp), %rdx
1454b108b:     	je	0x1454b1fb1 <.text+0x54b0fb1>
1454b1091:     	nopw	%cs:(%rax,%rax)
1454b10a0:     	testq	%rdi, %rdi
1454b10a3:     	js	0x1454b10b0 <.text+0x54b00b0>
1454b10a5:     	cvtsi2ss	%rdi, %xmm15
1454b10aa:     	jmp	0x1454b10c8 <.text+0x54b00c8>
1454b10ac:     	nopl	(%rax)
1454b10b0:     	movq	%rdi, %rax
1454b10b3:     	shrq	%rax
1454b10b6:     	movl	%edi, %ecx
1454b10b8:     	andl	$0x1, %ecx
1454b10bb:     	orq	%rax, %rcx
1454b10be:     	cvtsi2ss	%rcx, %xmm15
1454b10c3:     	addss	%xmm15, %xmm15
1454b10c8:     	movq	(%rdx), %rax
1454b10cb:     	movq	%rax, 0x170(%rbp)
1454b10d2:     	movq	%rdx, 0xf8(%rbp)
1454b10d9:     	movzbl	0x8(%rdx), %eax
1454b10dd:     	movb	%al, 0x128(%rbp)
1454b10e3:     	mulss	0x43a41c(%rip), %xmm15  # 0x1458eb508
1454b10ec:     	addss	%xmm10, %xmm15
1454b10f1:     	mulss	%xmm11, %xmm15
1454b10f6:     	movq	0x120(%rbp), %rsi
1454b10fd:     	movss	0x3f4(%rsi), %xmm7
1454b1105:     	addss	%xmm15, %xmm7
1454b110a:     	movaps	%xmm7, %xmm0
1454b110d:     	callq	0x145756e31 <.text+0x5755e31>
1454b1112:     	movaps	%xmm0, %xmm6
1454b1115:     	movaps	%xmm7, %xmm0
1454b1118:     	callq	0x145756e2b <.text+0x5755e2b>
1454b111d:     	movsd	0x3e8(%rsi), %xmm1
1454b1125:     	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1454b1128:     	addps	%xmm6, %xmm6
1454b112b:     	addps	%xmm1, %xmm6
1454b112e:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454b1133:     	movq	0x878(%rsi), %rsi
1454b113a:     	leaq	0x10(%rsi), %rcx
1454b113e:     	movaps	%xmm6, %xmm1
1454b1141:     	movaps	%xmm8, %xmm2
1454b1145:     	callq	0x1454627f0 <.text+0x54617f0>
1454b114a:     	nop
1454b114b:     	testb	$0x1, %al
1454b114d:     	movq	%rdi, 0xd8(%rbp)
1454b1154:     	je	0x1454b1160 <.text+0x54b0160>
1454b1156:     	movaps	%xmm0, %xmm7
1454b1159:     	jmp	0x1454b11a8 <.text+0x54b01a8>
1454b115b:     	nopl	(%rax,%rax)
1454b1160:     	cmpq	$-0x1, 0x68(%rsi)
1454b1165:     	je	0x1454b11a0 <.text+0x54b01a0>
1454b1167:     	leaq	0x68(%rsi), %rdx
1454b116b:     	leaq	0x130(%rbp), %rcx
1454b1172:     	movaps	%xmm6, %xmm2
1454b1175:     	movaps	%xmm8, %xmm3
1454b1179:     	callq	0x145467bf0 <.text+0x5466bf0>
1454b117e:     	nop
1454b117f:     	cmpl	$0x1, 0x130(%rbp)
1454b1186:     	jne	0x1454b11a0 <.text+0x54b01a0>
1454b1188:     	movss	0x13c(%rbp), %xmm7
1454b1190:     	jmp	0x1454b11a8 <.text+0x54b01a8>
1454b1192:     	nopw	%cs:(%rax,%rax)
1454b11a0:     	movss	0x90(%rsi), %xmm7
1454b11a8:     	movq	0x170(%rbp), %rax
1454b11af:     	movl	0x58(%rax), %eax
1454b11b2:     	movq	0x120(%rbp), %rcx
1454b11b9:     	movl	0x904(%rcx), %edi
1454b11bf:     	incl	%edi
1454b11c1:     	movl	%edi, 0x904(%rcx)
1454b11c7:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454b11cc:     	shlq	$0x18, %rax
1454b11d0:     	andl	$0xffffff, %edi         # imm = 0xFFFFFF
1454b11d6:     	orq	%rax, %rdi
1454b11d9:     	movabsq	$-0xed0000000000000, %rax # imm = 0xF130000000000000
1454b11e3:     	orq	%rax, %rdi
1454b11e6:     	movq	$0x0, 0xe0(%rbp)
1454b11f1:     	movq	$0x0, 0xf0(%rbp)
1454b11fc:     	leaq	0xe0(%rbp), %rcx
1454b1203:     	xorl	%edx, %edx
1454b1205:     	movq	%rdi, %r8
1454b1208:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454b120d:     	nop
1454b120e:     	movq	0xe0(%rbp), %rax
1454b1215:     	testq	%rax, %rax
1454b1218:     	je	0x1454b12a0 <.text+0x54b02a0>
1454b121e:     	movq	0xe8(%rbp), %rcx
1454b1225:     	movzwl	0x36(%rax), %r8d
1454b122a:     	movl	%r8d, %r9d
1454b122d:     	addl	%r9d, %r9d
1454b1230:     	movq	$-0x1, %rdx
1454b1237:     	nopw	(%rax,%rax)
1454b1240:     	testq	%r9, %r9
1454b1243:     	je	0x1454b1280 <.text+0x54b0280>
1454b1245:     	cmpw	0x3a(%rax,%rdx,2), %r12w
1454b124b:     	seta	%r10b
1454b124f:     	sbbb	$0x0, %r10b
1454b1253:     	incq	%rdx
1454b1256:     	addq	$-0x2, %r9
1454b125a:     	cmpb	$0x1, %r10b
1454b125e:     	je	0x1454b1240 <.text+0x54b0240>
1454b1260:     	movzbl	%r10b, %r8d
1454b1264:     	testl	%r8d, %r8d
1454b1267:     	je	0x1454b1290 <.text+0x54b0290>
1454b1269:     	subq	$0x1, %rcx
1454b126d:     	jae	0x1454b1289 <.text+0x54b0289>
1454b126f:     	jmp	0x1454b12a2 <.text+0x54b02a2>
1454b1271:     	nopw	%cs:(%rax,%rax)
1454b1280:     	movq	%r8, %rdx
1454b1283:     	subq	$0x1, %rcx
1454b1287:     	jb	0x1454b12a2 <.text+0x54b02a2>
1454b1289:     	movq	0x50(%rax,%rdx,8), %rax
1454b128e:     	jmp	0x1454b1225 <.text+0x54b0225>
1454b1290:     	movl	$0x9, 0x8(%rax,%rdx,4)
1454b1298:     	jmp	0x1454b12ee <.text+0x54b02ee>
1454b129a:     	nopw	(%rax,%rax)
1454b12a0:     	xorl	%eax, %eax
1454b12a2:     	leaq	0xe0(%rbp), %rcx
1454b12a9:     	movq	%rcx, 0x130(%rbp)
1454b12b0:     	movq	%rax, 0x138(%rbp)
1454b12b7:     	movq	$0x0, 0x140(%rbp)
1454b12c2:     	movq	%rdx, 0x148(%rbp)
1454b12c9:     	movq	$0x2, 0x150(%rbp)
1454b12d4:     	leaq	0x100(%rbp), %rcx
1454b12db:     	leaq	0x130(%rbp), %rdx
1454b12e2:     	movl	$0x9, %r8d
1454b12e8:     	callq	0x145427a50 <.text+0x5426a50>
1454b12ed:     	nop
1454b12ee:     	movq	0x170(%rbp), %rax
1454b12f5:     	movl	0x58(%rax), %r8d
1454b12f9:     	movq	0xe0(%rbp), %rax
1454b1300:     	testq	%rax, %rax
1454b1303:     	je	0x1454b1380 <.text+0x54b0380>
1454b1305:     	movq	0xe8(%rbp), %rcx
1454b130c:     	movzwl	0x36(%rax), %r9d
1454b1311:     	movl	%r9d, %r10d
1454b1314:     	addl	%r10d, %r10d
1454b1317:     	movq	$-0x1, %rdx
1454b131e:     	nop
1454b1320:     	testq	%r10, %r10
1454b1323:     	je	0x1454b1360 <.text+0x54b0360>
1454b1325:     	cmpw	0x3a(%rax,%rdx,2), %r14w
1454b132b:     	seta	%r11b
1454b132f:     	sbbb	$0x0, %r11b
1454b1333:     	incq	%rdx
1454b1336:     	addq	$-0x2, %r10
1454b133a:     	cmpb	$0x1, %r11b
1454b133e:     	je	0x1454b1320 <.text+0x54b0320>
1454b1340:     	movzbl	%r11b, %r9d
1454b1344:     	testl	%r9d, %r9d
1454b1347:     	je	0x1454b1370 <.text+0x54b0370>
1454b1349:     	subq	$0x1, %rcx
1454b134d:     	jae	0x1454b1369 <.text+0x54b0369>
1454b134f:     	jmp	0x1454b1382 <.text+0x54b0382>
1454b1351:     	nopw	%cs:(%rax,%rax)
1454b1360:     	movq	%r9, %rdx
1454b1363:     	subq	$0x1, %rcx
1454b1367:     	jb	0x1454b1382 <.text+0x54b0382>
1454b1369:     	movq	0x50(%rax,%rdx,8), %rax
1454b136e:     	jmp	0x1454b130c <.text+0x54b030c>
1454b1370:     	movl	%r8d, 0x8(%rax,%rdx,4)
1454b1375:     	jmp	0x1454b13c8 <.text+0x54b03c8>
1454b1377:     	nopw	(%rax,%rax)
1454b1380:     	xorl	%eax, %eax
1454b1382:     	leaq	0xe0(%rbp), %rcx
1454b1389:     	movq	%rcx, 0x130(%rbp)
1454b1390:     	movq	%rax, 0x138(%rbp)
1454b1397:     	movq	$0x0, 0x140(%rbp)
1454b13a2:     	movq	%rdx, 0x148(%rbp)
1454b13a9:     	movq	$0x3, 0x150(%rbp)
1454b13b4:     	leaq	0x100(%rbp), %rcx
1454b13bb:     	leaq	0x130(%rbp), %rdx
1454b13c2:     	callq	0x145427a50 <.text+0x5426a50>
1454b13c7:     	nop
1454b13c8:     	movq	0x170(%rbp), %rax
1454b13cf:     	movd	0x54(%rax), %xmm0
1454b13d4:     	movq	0xe0(%rbp), %rax
1454b13db:     	testq	%rax, %rax
1454b13de:     	je	0x1454b1460 <.text+0x54b0460>
1454b13e4:     	movq	0xe8(%rbp), %rcx
1454b13eb:     	movzwl	0x36(%rax), %r8d
1454b13f0:     	movl	%r8d, %r9d
1454b13f3:     	addl	%r9d, %r9d
1454b13f6:     	movq	$-0x1, %rdx
1454b13fd:     	nopl	(%rax)
1454b1400:     	testq	%r9, %r9
1454b1403:     	je	0x1454b1440 <.text+0x54b0440>
1454b1405:     	cmpw	0x3a(%rax,%rdx,2), %r13w
1454b140b:     	seta	%r10b
1454b140f:     	sbbb	$0x0, %r10b
1454b1413:     	incq	%rdx
1454b1416:     	addq	$-0x2, %r9
1454b141a:     	cmpb	$0x1, %r10b
1454b141e:     	je	0x1454b1400 <.text+0x54b0400>
1454b1420:     	movzbl	%r10b, %r8d
1454b1424:     	testl	%r8d, %r8d
1454b1427:     	je	0x1454b1450 <.text+0x54b0450>
1454b1429:     	subq	$0x1, %rcx
1454b142d:     	jae	0x1454b1449 <.text+0x54b0449>
1454b142f:     	jmp	0x1454b1462 <.text+0x54b0462>
1454b1431:     	nopw	%cs:(%rax,%rax)
1454b1440:     	movq	%r8, %rdx
1454b1443:     	subq	$0x1, %rcx
1454b1447:     	jb	0x1454b1462 <.text+0x54b0462>
1454b1449:     	movq	0x50(%rax,%rdx,8), %rax
1454b144e:     	jmp	0x1454b13eb <.text+0x54b03eb>
1454b1450:     	movd	%xmm0, 0x8(%rax,%rdx,4)
1454b1456:     	jmp	0x1454b14ad <.text+0x54b04ad>
1454b1458:     	nopl	(%rax,%rax)
1454b1460:     	xorl	%eax, %eax
1454b1462:     	movd	%xmm0, %r8d
1454b1467:     	leaq	0xe0(%rbp), %rcx
1454b146e:     	movq	%rcx, 0x130(%rbp)
1454b1475:     	movq	%rax, 0x138(%rbp)
1454b147c:     	movq	$0x0, 0x140(%rbp)
1454b1487:     	movq	%rdx, 0x148(%rbp)
1454b148e:     	movq	$0x4, 0x150(%rbp)
1454b1499:     	leaq	0x100(%rbp), %rcx
1454b14a0:     	leaq	0x130(%rbp), %rdx
1454b14a7:     	callq	0x145427a50 <.text+0x5426a50>
1454b14ac:     	nop
1454b14ad:     	movq	0xe0(%rbp), %rax
1454b14b4:     	testq	%rax, %rax
1454b14b7:     	je	0x1454b1540 <.text+0x54b0540>
1454b14bd:     	movq	0xe8(%rbp), %rcx
1454b14c4:     	movzwl	0x36(%rax), %r8d
1454b14c9:     	movl	%r8d, %r9d
1454b14cc:     	addl	%r9d, %r9d
1454b14cf:     	movq	$-0x1, %rdx
1454b14d6:     	nopw	%cs:(%rax,%rax)
1454b14e0:     	testq	%r9, %r9
1454b14e3:     	je	0x1454b1520 <.text+0x54b0520>
1454b14e5:     	cmpw	0x3a(%rax,%rdx,2), %r15w
1454b14eb:     	seta	%r10b
1454b14ef:     	sbbb	$0x0, %r10b
1454b14f3:     	incq	%rdx
1454b14f6:     	addq	$-0x2, %r9
1454b14fa:     	cmpb	$0x1, %r10b
1454b14fe:     	je	0x1454b14e0 <.text+0x54b04e0>
1454b1500:     	movzbl	%r10b, %r8d
1454b1504:     	testl	%r8d, %r8d
1454b1507:     	je	0x1454b1530 <.text+0x54b0530>
1454b1509:     	subq	$0x1, %rcx
1454b150d:     	jae	0x1454b1529 <.text+0x54b0529>
1454b150f:     	jmp	0x1454b1542 <.text+0x54b0542>
1454b1511:     	nopw	%cs:(%rax,%rax)
1454b1520:     	movq	%r8, %rdx
1454b1523:     	subq	$0x1, %rcx
1454b1527:     	jb	0x1454b1542 <.text+0x54b0542>
1454b1529:     	movq	0x50(%rax,%rdx,8), %rax
1454b152e:     	jmp	0x1454b14c4 <.text+0x54b04c4>
1454b1530:     	movl	$0x1, 0x8(%rax,%rdx,4)
1454b1538:     	jmp	0x1454b158e <.text+0x54b058e>
1454b153a:     	nopw	(%rax,%rax)
1454b1540:     	xorl	%eax, %eax
1454b1542:     	leaq	0xe0(%rbp), %rcx
1454b1549:     	movq	%rcx, 0x130(%rbp)
1454b1550:     	movq	%rax, 0x138(%rbp)
1454b1557:     	movq	$0x0, 0x140(%rbp)
1454b1562:     	movq	%rdx, 0x148(%rbp)
1454b1569:     	movq	$0x16, 0x150(%rbp)
1454b1574:     	leaq	0x100(%rbp), %rcx
1454b157b:     	leaq	0x130(%rbp), %rdx
1454b1582:     	movl	$0x1, %r8d
1454b1588:     	callq	0x145427a50 <.text+0x5426a50>
1454b158d:     	nop
1454b158e:     	movq	0xe0(%rbp), %rax
1454b1595:     	testq	%rax, %rax
1454b1598:     	je	0x1454b1610 <.text+0x54b0610>
1454b159a:     	movq	0xe8(%rbp), %rcx
1454b15a1:     	movzwl	0x36(%rax), %r8d
1454b15a6:     	movl	%r8d, %r9d
1454b15a9:     	addl	%r9d, %r9d
1454b15ac:     	movq	$-0x1, %rdx
1454b15b3:     	nopw	%cs:(%rax,%rax)
1454b15c0:     	testq	%r9, %r9
1454b15c3:     	je	0x1454b15f0 <.text+0x54b05f0>
1454b15c5:     	cmpw	0x3a(%rax,%rdx,2), %bx
1454b15ca:     	seta	%r10b
1454b15ce:     	sbbb	$0x0, %r10b
1454b15d2:     	incq	%rdx
1454b15d5:     	addq	$-0x2, %r9
1454b15d9:     	cmpb	$0x1, %r10b
1454b15dd:     	je	0x1454b15c0 <.text+0x54b05c0>
1454b15df:     	movzbl	%r10b, %r8d
1454b15e3:     	testl	%r8d, %r8d
1454b15e6:     	je	0x1454b1600 <.text+0x54b0600>
1454b15e8:     	subq	$0x1, %rcx
1454b15ec:     	jae	0x1454b15f9 <.text+0x54b05f9>
1454b15ee:     	jmp	0x1454b1612 <.text+0x54b0612>
1454b15f0:     	movq	%r8, %rdx
1454b15f3:     	subq	$0x1, %rcx
1454b15f7:     	jb	0x1454b1612 <.text+0x54b0612>
1454b15f9:     	movq	0x50(%rax,%rdx,8), %rax
1454b15fe:     	jmp	0x1454b15a1 <.text+0x54b05a1>
1454b1600:     	movl	$0x1, 0x8(%rax,%rdx,4)
1454b1608:     	jmp	0x1454b165e <.text+0x54b065e>
1454b160a:     	nopw	(%rax,%rax)
1454b1610:     	xorl	%eax, %eax
1454b1612:     	leaq	0xe0(%rbp), %rcx
1454b1619:     	movq	%rcx, 0x130(%rbp)
1454b1620:     	movq	%rax, 0x138(%rbp)
1454b1627:     	movq	$0x0, 0x140(%rbp)
1454b1632:     	movq	%rdx, 0x148(%rbp)
1454b1639:     	movq	$0x1c, 0x150(%rbp)
1454b1644:     	leaq	0x100(%rbp), %rcx
1454b164b:     	leaq	0x130(%rbp), %rdx
1454b1652:     	movl	$0x1, %r8d
1454b1658:     	callq	0x145427a50 <.text+0x5426a50>
1454b165d:     	nop
1454b165e:     	movq	0xe0(%rbp), %rax
1454b1665:     	testq	%rax, %rax
1454b1668:     	je	0x1454b16f0 <.text+0x54b06f0>
1454b166e:     	movq	0xe8(%rbp), %rcx
1454b1675:     	movzwl	0x36(%rax), %r8d
1454b167a:     	movl	%r8d, %r9d
1454b167d:     	addl	%r9d, %r9d
1454b1680:     	movq	$-0x1, %rdx
1454b1687:     	nopw	(%rax,%rax)
1454b1690:     	testq	%r9, %r9
1454b1693:     	je	0x1454b16d0 <.text+0x54b06d0>
1454b1695:     	movw	$0x22, %r10w
1454b169a:     	cmpw	0x3a(%rax,%rdx,2), %r10w
1454b16a0:     	seta	%r10b
1454b16a4:     	sbbb	$0x0, %r10b
1454b16a8:     	incq	%rdx
1454b16ab:     	addq	$-0x2, %r9
1454b16af:     	cmpb	$0x1, %r10b
1454b16b3:     	je	0x1454b1690 <.text+0x54b0690>
1454b16b5:     	movzbl	%r10b, %r8d
1454b16b9:     	testl	%r8d, %r8d
1454b16bc:     	je	0x1454b16e0 <.text+0x54b06e0>
1454b16be:     	subq	$0x1, %rcx
1454b16c2:     	jae	0x1454b16d9 <.text+0x54b06d9>
1454b16c4:     	jmp	0x1454b16f2 <.text+0x54b06f2>
1454b16c6:     	nopw	%cs:(%rax,%rax)
1454b16d0:     	movq	%r8, %rdx
1454b16d3:     	subq	$0x1, %rcx
1454b16d7:     	jb	0x1454b16f2 <.text+0x54b06f2>
1454b16d9:     	movq	0x50(%rax,%rdx,8), %rax
1454b16de:     	jmp	0x1454b1675 <.text+0x54b0675>
1454b16e0:     	movl	$0x1, 0x8(%rax,%rdx,4)
1454b16e8:     	jmp	0x1454b173e <.text+0x54b073e>
1454b16ea:     	nopw	(%rax,%rax)
1454b16f0:     	xorl	%eax, %eax
1454b16f2:     	leaq	0xe0(%rbp), %rcx
1454b16f9:     	movq	%rcx, 0x130(%rbp)
1454b1700:     	movq	%rax, 0x138(%rbp)
1454b1707:     	movq	$0x0, 0x140(%rbp)
1454b1712:     	movq	%rdx, 0x148(%rbp)
1454b1719:     	movq	$0x22, 0x150(%rbp)
1454b1724:     	leaq	0x100(%rbp), %rcx
1454b172b:     	leaq	0x130(%rbp), %rdx
1454b1732:     	movl	$0x1, %r8d
1454b1738:     	callq	0x145427a50 <.text+0x5426a50>
1454b173d:     	nop
1454b173e:     	movq	0xe0(%rbp), %rax
1454b1745:     	testq	%rax, %rax
1454b1748:     	je	0x1454b17d0 <.text+0x54b07d0>
1454b174e:     	movq	0xe8(%rbp), %rcx
1454b1755:     	movzwl	0x36(%rax), %r8d
1454b175a:     	movl	%r8d, %r9d
1454b175d:     	addl	%r9d, %r9d
1454b1760:     	movq	$-0x1, %rdx
1454b1767:     	nopw	(%rax,%rax)
1454b1770:     	testq	%r9, %r9
1454b1773:     	je	0x1454b17b0 <.text+0x54b07b0>
1454b1775:     	movw	$0x23, %r10w
1454b177a:     	cmpw	0x3a(%rax,%rdx,2), %r10w
1454b1780:     	seta	%r10b
1454b1784:     	sbbb	$0x0, %r10b
1454b1788:     	incq	%rdx
1454b178b:     	addq	$-0x2, %r9
1454b178f:     	cmpb	$0x1, %r10b
1454b1793:     	je	0x1454b1770 <.text+0x54b0770>
1454b1795:     	movzbl	%r10b, %r8d
1454b1799:     	testl	%r8d, %r8d
1454b179c:     	je	0x1454b17c0 <.text+0x54b07c0>
1454b179e:     	subq	$0x1, %rcx
1454b17a2:     	jae	0x1454b17b9 <.text+0x54b07b9>
1454b17a4:     	jmp	0x1454b17d2 <.text+0x54b07d2>
1454b17a6:     	nopw	%cs:(%rax,%rax)
1454b17b0:     	movq	%r8, %rdx
1454b17b3:     	subq	$0x1, %rcx
1454b17b7:     	jb	0x1454b17d2 <.text+0x54b07d2>
1454b17b9:     	movq	0x50(%rax,%rdx,8), %rax
1454b17be:     	jmp	0x1454b1755 <.text+0x54b0755>
1454b17c0:     	movl	$0x23, 0x8(%rax,%rdx,4)
1454b17c8:     	jmp	0x1454b181e <.text+0x54b081e>
1454b17ca:     	nopw	(%rax,%rax)
1454b17d0:     	xorl	%eax, %eax
1454b17d2:     	leaq	0xe0(%rbp), %rcx
1454b17d9:     	movq	%rcx, 0x130(%rbp)
1454b17e0:     	movq	%rax, 0x138(%rbp)
1454b17e7:     	movq	$0x0, 0x140(%rbp)
1454b17f2:     	movq	%rdx, 0x148(%rbp)
1454b17f9:     	movq	$0x23, 0x150(%rbp)
1454b1804:     	leaq	0x100(%rbp), %rcx
1454b180b:     	leaq	0x130(%rbp), %rdx
1454b1812:     	movl	$0x23, %r8d
1454b1818:     	callq	0x145427a50 <.text+0x5426a50>
1454b181d:     	nop
1454b181e:     	movq	0xe0(%rbp), %rax
1454b1825:     	testq	%rax, %rax
1454b1828:     	je	0x1454b18b0 <.text+0x54b08b0>
1454b182e:     	movq	0xe8(%rbp), %rcx
1454b1835:     	movzwl	0x36(%rax), %r8d
1454b183a:     	movl	%r8d, %r9d
1454b183d:     	addl	%r9d, %r9d
1454b1840:     	movq	$-0x1, %rdx
1454b1847:     	nopw	(%rax,%rax)
1454b1850:     	testq	%r9, %r9
1454b1853:     	je	0x1454b1890 <.text+0x54b0890>
1454b1855:     	movw	$0x2e, %r10w
1454b185a:     	cmpw	0x3a(%rax,%rdx,2), %r10w
1454b1860:     	seta	%r10b
1454b1864:     	sbbb	$0x0, %r10b
1454b1868:     	incq	%rdx
1454b186b:     	addq	$-0x2, %r9
1454b186f:     	cmpb	$0x1, %r10b
1454b1873:     	je	0x1454b1850 <.text+0x54b0850>
1454b1875:     	movzbl	%r10b, %r8d
1454b1879:     	testl	%r8d, %r8d
1454b187c:     	je	0x1454b18a0 <.text+0x54b08a0>
1454b187e:     	subq	$0x1, %rcx
1454b1882:     	jae	0x1454b1899 <.text+0x54b0899>
1454b1884:     	jmp	0x1454b18b2 <.text+0x54b08b2>
1454b1886:     	nopw	%cs:(%rax,%rax)
1454b1890:     	movq	%r8, %rdx
1454b1893:     	subq	$0x1, %rcx
1454b1897:     	jb	0x1454b18b2 <.text+0x54b08b2>
1454b1899:     	movq	0x50(%rax,%rdx,8), %rax
1454b189e:     	jmp	0x1454b1835 <.text+0x54b0835>
1454b18a0:     	movl	$0x2000002, 0x8(%rax,%rdx,4) # imm = 0x2000002
1454b18a8:     	jmp	0x1454b18fe <.text+0x54b08fe>
1454b18aa:     	nopw	(%rax,%rax)
1454b18b0:     	xorl	%eax, %eax
1454b18b2:     	leaq	0xe0(%rbp), %rcx
1454b18b9:     	movq	%rcx, 0x130(%rbp)
1454b18c0:     	movq	%rax, 0x138(%rbp)
1454b18c7:     	movq	$0x0, 0x140(%rbp)
1454b18d2:     	movq	%rdx, 0x148(%rbp)
1454b18d9:     	movq	$0x2e, 0x150(%rbp)
1454b18e4:     	leaq	0x100(%rbp), %rcx
1454b18eb:     	leaq	0x130(%rbp), %rdx
1454b18f2:     	movl	$0x2000002, %r8d        # imm = 0x2000002
1454b18f8:     	callq	0x145427a50 <.text+0x5426a50>
1454b18fd:     	nop
1454b18fe:     	movq	0xe0(%rbp), %rax
1454b1905:     	testq	%rax, %rax
1454b1908:     	je	0x1454b1990 <.text+0x54b0990>
1454b190e:     	movq	0xe8(%rbp), %rcx
1454b1915:     	movzwl	0x36(%rax), %r8d
1454b191a:     	movl	%r8d, %r9d
1454b191d:     	addl	%r9d, %r9d
1454b1920:     	movq	$-0x1, %rdx
1454b1927:     	nopw	(%rax,%rax)
1454b1930:     	testq	%r9, %r9
1454b1933:     	je	0x1454b1970 <.text+0x54b0970>
1454b1935:     	movzwl	0x3a(%rax,%rdx,2), %r10d
1454b193b:     	movl	$0x81, %r11d
1454b1941:     	cmpl	%r10d, %r11d
1454b1944:     	seta	%r10b
1454b1948:     	sbbb	$0x0, %r10b
1454b194c:     	incq	%rdx
1454b194f:     	addq	$-0x2, %r9
1454b1953:     	cmpb	$0x1, %r10b
1454b1957:     	je	0x1454b1930 <.text+0x54b0930>
1454b1959:     	movzbl	%r10b, %r8d
1454b195d:     	testl	%r8d, %r8d
1454b1960:     	je	0x1454b1980 <.text+0x54b0980>
1454b1962:     	subq	$0x1, %rcx
1454b1966:     	jae	0x1454b1979 <.text+0x54b0979>
1454b1968:     	jmp	0x1454b1992 <.text+0x54b0992>
1454b196a:     	nopw	(%rax,%rax)
1454b1970:     	movq	%r8, %rdx
1454b1973:     	subq	$0x1, %rcx
1454b1977:     	jb	0x1454b1992 <.text+0x54b0992>
1454b1979:     	movq	0x50(%rax,%rdx,8), %rax
1454b197e:     	jmp	0x1454b1915 <.text+0x54b0915>
1454b1980:     	movl	$0x3e99999a, 0x8(%rax,%rdx,4) # imm = 0x3E99999A
1454b1988:     	jmp	0x1454b19de <.text+0x54b09de>
1454b198a:     	nopw	(%rax,%rax)
1454b1990:     	xorl	%eax, %eax
1454b1992:     	leaq	0xe0(%rbp), %rcx
1454b1999:     	movq	%rcx, 0x130(%rbp)
1454b19a0:     	movq	%rax, 0x138(%rbp)
1454b19a7:     	movq	$0x0, 0x140(%rbp)
1454b19b2:     	movq	%rdx, 0x148(%rbp)
1454b19b9:     	movq	$0x81, 0x150(%rbp)
1454b19c4:     	leaq	0x100(%rbp), %rcx
1454b19cb:     	leaq	0x130(%rbp), %rdx
1454b19d2:     	movl	$0x3e99999a, %r8d       # imm = 0x3E99999A
1454b19d8:     	callq	0x145427a50 <.text+0x5426a50>
1454b19dd:     	nop
1454b19de:     	movq	0xe0(%rbp), %rax
1454b19e5:     	testq	%rax, %rax
1454b19e8:     	je	0x1454b1a70 <.text+0x54b0a70>
1454b19ee:     	movq	0xe8(%rbp), %rcx
1454b19f5:     	movzwl	0x36(%rax), %r8d
1454b19fa:     	movl	%r8d, %r9d
1454b19fd:     	addl	%r9d, %r9d
1454b1a00:     	movq	$-0x1, %rdx
1454b1a07:     	nopw	(%rax,%rax)
1454b1a10:     	testq	%r9, %r9
1454b1a13:     	je	0x1454b1a50 <.text+0x54b0a50>
1454b1a15:     	movzwl	0x3a(%rax,%rdx,2), %r10d
1454b1a1b:     	movl	$0x82, %r11d
1454b1a21:     	cmpl	%r10d, %r11d
1454b1a24:     	seta	%r10b
1454b1a28:     	sbbb	$0x0, %r10b
1454b1a2c:     	incq	%rdx
1454b1a2f:     	addq	$-0x2, %r9
1454b1a33:     	cmpb	$0x1, %r10b
1454b1a37:     	je	0x1454b1a10 <.text+0x54b0a10>
1454b1a39:     	movzbl	%r10b, %r8d
1454b1a3d:     	testl	%r8d, %r8d
1454b1a40:     	je	0x1454b1a60 <.text+0x54b0a60>
1454b1a42:     	subq	$0x1, %rcx
1454b1a46:     	jae	0x1454b1a59 <.text+0x54b0a59>
1454b1a48:     	jmp	0x1454b1a72 <.text+0x54b0a72>
1454b1a4a:     	nopw	(%rax,%rax)
1454b1a50:     	movq	%r8, %rdx
1454b1a53:     	subq	$0x1, %rcx
1454b1a57:     	jb	0x1454b1a72 <.text+0x54b0a72>
1454b1a59:     	movq	0x50(%rax,%rdx,8), %rax
1454b1a5e:     	jmp	0x1454b19f5 <.text+0x54b09f5>
1454b1a60:     	movl	$0x3f000000, 0x8(%rax,%rdx,4) # imm = 0x3F000000
1454b1a68:     	jmp	0x1454b1abe <.text+0x54b0abe>
1454b1a6a:     	nopw	(%rax,%rax)
1454b1a70:     	xorl	%eax, %eax
1454b1a72:     	leaq	0xe0(%rbp), %rcx
1454b1a79:     	movq	%rcx, 0x130(%rbp)
1454b1a80:     	movq	%rax, 0x138(%rbp)
1454b1a87:     	movq	$0x0, 0x140(%rbp)
1454b1a92:     	movq	%rdx, 0x148(%rbp)
1454b1a99:     	movq	$0x82, 0x150(%rbp)
1454b1aa4:     	leaq	0x100(%rbp), %rcx
1454b1aab:     	leaq	0x130(%rbp), %rdx
1454b1ab2:     	movl	$0x3f000000, %r8d       # imm = 0x3F000000
1454b1ab8:     	callq	0x145427a50 <.text+0x5426a50>
1454b1abd:     	nop
1454b1abe:     	movq	0x170(%rbp), %rax
1454b1ac5:     	movl	0x50(%rax), %r8d
1454b1ac9:     	movq	0xe0(%rbp), %rax
1454b1ad0:     	testq	%rax, %rax
1454b1ad3:     	je	0x1454b1b50 <.text+0x54b0b50>
1454b1ad5:     	movq	0xe8(%rbp), %rcx
1454b1adc:     	movzwl	0x36(%rax), %r9d
1454b1ae1:     	movl	%r9d, %r10d
1454b1ae4:     	addl	%r10d, %r10d
1454b1ae7:     	movq	$-0x1, %rdx
1454b1aee:     	nop
1454b1af0:     	testq	%r10, %r10
1454b1af3:     	je	0x1454b1b30 <.text+0x54b0b30>
1454b1af5:     	movzwl	0x3a(%rax,%rdx,2), %r11d
1454b1afb:     	movl	$0x83, %esi
1454b1b00:     	cmpl	%r11d, %esi
1454b1b03:     	seta	%r11b
1454b1b07:     	sbbb	$0x0, %r11b
1454b1b0b:     	incq	%rdx
1454b1b0e:     	addq	$-0x2, %r10
1454b1b12:     	cmpb	$0x1, %r11b
1454b1b16:     	je	0x1454b1af0 <.text+0x54b0af0>
1454b1b18:     	movzbl	%r11b, %r9d
1454b1b1c:     	testl	%r9d, %r9d
1454b1b1f:     	je	0x1454b1b40 <.text+0x54b0b40>
1454b1b21:     	subq	$0x1, %rcx
1454b1b25:     	jae	0x1454b1b39 <.text+0x54b0b39>
1454b1b27:     	jmp	0x1454b1b52 <.text+0x54b0b52>
1454b1b29:     	nopl	(%rax)
1454b1b30:     	movq	%r9, %rdx
1454b1b33:     	subq	$0x1, %rcx
1454b1b37:     	jb	0x1454b1b52 <.text+0x54b0b52>
1454b1b39:     	movq	0x50(%rax,%rdx,8), %rax
1454b1b3e:     	jmp	0x1454b1adc <.text+0x54b0adc>
1454b1b40:     	movl	%r8d, 0x8(%rax,%rdx,4)
1454b1b45:     	jmp	0x1454b1b98 <.text+0x54b0b98>
1454b1b47:     	nopw	(%rax,%rax)
1454b1b50:     	xorl	%eax, %eax
1454b1b52:     	leaq	0xe0(%rbp), %rcx
1454b1b59:     	movq	%rcx, 0x130(%rbp)
1454b1b60:     	movq	%rax, 0x138(%rbp)
1454b1b67:     	movq	$0x0, 0x140(%rbp)
1454b1b72:     	movq	%rdx, 0x148(%rbp)
1454b1b79:     	movq	$0x83, 0x150(%rbp)
1454b1b84:     	leaq	0x100(%rbp), %rcx
1454b1b8b:     	leaq	0x130(%rbp), %rdx
1454b1b92:     	callq	0x145427a50 <.text+0x5426a50>
1454b1b97:     	nop
1454b1b98:     	movq	0x170(%rbp), %rax
1454b1b9f:     	movl	0x50(%rax), %r8d
1454b1ba3:     	movq	0xe0(%rbp), %rax
1454b1baa:     	testq	%rax, %rax
1454b1bad:     	je	0x1454b1c30 <.text+0x54b0c30>
1454b1bb3:     	movq	0xe8(%rbp), %rcx
1454b1bba:     	movzwl	0x36(%rax), %r9d
1454b1bbf:     	movl	%r9d, %r10d
1454b1bc2:     	addl	%r10d, %r10d
1454b1bc5:     	movq	$-0x1, %rdx
1454b1bcc:     	nopl	(%rax)
1454b1bd0:     	testq	%r10, %r10
1454b1bd3:     	je	0x1454b1c10 <.text+0x54b0c10>
1454b1bd5:     	movzwl	0x3a(%rax,%rdx,2), %r11d
1454b1bdb:     	movl	$0x84, %esi
1454b1be0:     	cmpl	%r11d, %esi
1454b1be3:     	seta	%r11b
1454b1be7:     	sbbb	$0x0, %r11b
1454b1beb:     	incq	%rdx
1454b1bee:     	addq	$-0x2, %r10
1454b1bf2:     	cmpb	$0x1, %r11b
1454b1bf6:     	je	0x1454b1bd0 <.text+0x54b0bd0>
1454b1bf8:     	movzbl	%r11b, %r9d
1454b1bfc:     	testl	%r9d, %r9d
1454b1bff:     	je	0x1454b1c20 <.text+0x54b0c20>
1454b1c01:     	subq	$0x1, %rcx
1454b1c05:     	jae	0x1454b1c19 <.text+0x54b0c19>
1454b1c07:     	jmp	0x1454b1c32 <.text+0x54b0c32>
1454b1c09:     	nopl	(%rax)
1454b1c10:     	movq	%r9, %rdx
1454b1c13:     	subq	$0x1, %rcx
1454b1c17:     	jb	0x1454b1c32 <.text+0x54b0c32>
1454b1c19:     	movq	0x50(%rax,%rdx,8), %rax
1454b1c1e:     	jmp	0x1454b1bba <.text+0x54b0bba>
1454b1c20:     	movl	%r8d, 0x8(%rax,%rdx,4)
1454b1c25:     	jmp	0x1454b1c78 <.text+0x54b0c78>
1454b1c27:     	nopw	(%rax,%rax)
1454b1c30:     	xorl	%eax, %eax
1454b1c32:     	leaq	0xe0(%rbp), %rcx
1454b1c39:     	movq	%rcx, 0x130(%rbp)
1454b1c40:     	movq	%rax, 0x138(%rbp)
1454b1c47:     	movq	$0x0, 0x140(%rbp)
1454b1c52:     	movq	%rdx, 0x148(%rbp)
1454b1c59:     	movq	$0x84, 0x150(%rbp)
1454b1c64:     	leaq	0x100(%rbp), %rcx
1454b1c6b:     	leaq	0x130(%rbp), %rdx
1454b1c72:     	callq	0x145427a50 <.text+0x5426a50>
1454b1c77:     	nop
1454b1c78:     	movq	0xe0(%rbp), %rax
1454b1c7f:     	testq	%rax, %rax
1454b1c82:     	je	0x1454b1d00 <.text+0x54b0d00>
1454b1c84:     	movq	0xe8(%rbp), %rcx
1454b1c8b:     	movzwl	0x36(%rax), %r8d
1454b1c90:     	movl	%r8d, %r9d
1454b1c93:     	addl	%r9d, %r9d
1454b1c96:     	movq	$-0x1, %rdx
1454b1c9d:     	nopl	(%rax)
1454b1ca0:     	testq	%r9, %r9
1454b1ca3:     	je	0x1454b1ce0 <.text+0x54b0ce0>
1454b1ca5:     	movzwl	0x3a(%rax,%rdx,2), %r10d
1454b1cab:     	movl	$0x91, %r11d
1454b1cb1:     	cmpl	%r10d, %r11d
1454b1cb4:     	seta	%r10b
1454b1cb8:     	sbbb	$0x0, %r10b
1454b1cbc:     	incq	%rdx
1454b1cbf:     	addq	$-0x2, %r9
1454b1cc3:     	cmpb	$0x1, %r10b
1454b1cc7:     	je	0x1454b1ca0 <.text+0x54b0ca0>
1454b1cc9:     	movzbl	%r10b, %r8d
1454b1ccd:     	testl	%r8d, %r8d
1454b1cd0:     	je	0x1454b1cf0 <.text+0x54b0cf0>
1454b1cd2:     	subq	$0x1, %rcx
1454b1cd6:     	jae	0x1454b1ce9 <.text+0x54b0ce9>
1454b1cd8:     	jmp	0x1454b1d02 <.text+0x54b0d02>
1454b1cda:     	nopw	(%rax,%rax)
1454b1ce0:     	movq	%r8, %rdx
1454b1ce3:     	subq	$0x1, %rcx
1454b1ce7:     	jb	0x1454b1d02 <.text+0x54b0d02>
1454b1ce9:     	movq	0x50(%rax,%rdx,8), %rax
1454b1cee:     	jmp	0x1454b1c8b <.text+0x54b0c8b>
1454b1cf0:     	movl	$0x3f800000, 0x8(%rax,%rdx,4) # imm = 0x3F800000
1454b1cf8:     	jmp	0x1454b1d4e <.text+0x54b0d4e>
1454b1cfa:     	nopw	(%rax,%rax)
1454b1d00:     	xorl	%eax, %eax
1454b1d02:     	leaq	0xe0(%rbp), %rcx
1454b1d09:     	movq	%rcx, 0x130(%rbp)
1454b1d10:     	movq	%rax, 0x138(%rbp)
1454b1d17:     	movq	$0x0, 0x140(%rbp)
1454b1d22:     	movq	%rdx, 0x148(%rbp)
1454b1d29:     	movq	$0x91, 0x150(%rbp)
1454b1d34:     	leaq	0x100(%rbp), %rcx
1454b1d3b:     	leaq	0x130(%rbp), %rdx
1454b1d42:     	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1454b1d48:     	callq	0x145427a50 <.text+0x5426a50>
1454b1d4d:     	nop
1454b1d4e:     	movups	0x14f922b(%rip), %xmm0  # 0x1469aaf80
1454b1d55:     	movaps	%xmm0, 0x60(%rbp)
1454b1d59:     	movq	0x120(%rbp), %rcx
1454b1d60:     	movzbl	0x20d(%rcx), %eax
1454b1d67:     	xorps	%xmm0, %xmm0
1454b1d6a:     	cvtsi2ss	%eax, %xmm0
1454b1d6e:     	movabsq	$0x40490fdb40200000, %rax # imm = 0x40490FDB40200000
1454b1d78:     	movq	%rax, 0x70(%rbp)
1454b1d7c:     	movss	0x46c(%rcx), %xmm1
1454b1d84:     	mulss	%xmm12, %xmm0
1454b1d89:     	addss	%xmm13, %xmm0
1454b1d8e:     	mulss	%xmm14, %xmm0
1454b1d93:     	maxss	%xmm13, %xmm1
1454b1d98:     	mulss	%xmm0, %xmm1
1454b1d9c:     	movss	%xmm1, 0x64(%rbp)
1454b1da1:     	movl	$0x0, 0x98(%rbp)
1454b1dab:     	movq	$0x0, 0x80(%rbp)
1454b1db6:     	movq	$0x1, 0x88(%rbp)
1454b1dc1:     	movq	$0x0, 0x90(%rbp)
1454b1dcc:     	movss	0x3f4(%rcx), %xmm0
1454b1dd4:     	movlps	%xmm6, 0x130(%rbp)
1454b1ddb:     	movss	%xmm7, 0x138(%rbp)
1454b1de3:     	movb	$0x1, 0x16f(%rbp)
1454b1dea:     	leaq	0xe0(%rbp), %rax
1454b1df1:     	movq	%rax, 0x38(%rsp)
1454b1df6:     	leaq	0x60(%rbp), %rax
1454b1dfa:     	movq	%rax, 0x30(%rsp)
1454b1dff:     	movss	%xmm0, 0x28(%rsp)
1454b1e05:     	leaq	0x130(%rbp), %rax
1454b1e0c:     	movq	%rax, 0x20(%rsp)
1454b1e11:     	leaq	0x80(%rbp), %rcx
1454b1e18:     	movq	%rdi, %rdx
1454b1e1b:     	movb	$0x3, %r8b
1454b1e1e:     	xorl	%r9d, %r9d
1454b1e21:     	callq	0x1454ff300 <.text+0x54fe300>
1454b1e26:     	nop
1454b1e27:     	movups	0x80(%rbp), %xmm0
1454b1e2e:     	movups	0x90(%rbp), %xmm1
1454b1e35:     	movaps	%xmm1, 0x140(%rbp)
1454b1e3c:     	movaps	%xmm0, 0x130(%rbp)
1454b1e43:     	movb	$0x0, 0x16f(%rbp)
1454b1e4a:     	leaq	0x100(%rbp), %rcx
1454b1e51:     	leaq	0x130(%rbp), %rdx
1454b1e58:     	callq	0x1454ffad0 <.text+0x54fead0>
1454b1e5d:     	nop
1454b1e5e:     	movq	0x120(%rbp), %rax
1454b1e65:     	movq	0x548(%rax), %rsi
1454b1e6c:     	cmpq	0x538(%rax), %rsi
1454b1e73:     	jne	0x1454b1e82 <.text+0x54b0e82>
1454b1e75:     	movq	0xc8(%rbp), %rcx
1454b1e7c:     	callq	0x1457580b0 <.text+0x57570b0>
1454b1e81:     	nop
1454b1e82:     	movq	0x120(%rbp), %rdx
1454b1e89:     	movq	0x540(%rdx), %rax
1454b1e90:     	movq	%rsi, %rcx
1454b1e93:     	shlq	$0x5, %rcx
1454b1e97:     	movups	0x100(%rbp), %xmm0
1454b1e9e:     	movups	0x110(%rbp), %xmm1
1454b1ea5:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b1eaa:     	movups	%xmm0, (%rax,%rcx)
1454b1eae:     	incq	%rsi
1454b1eb1:     	movq	%rsi, 0x548(%rdx)
1454b1eb8:     	movss	0x8e4(%rdx), %xmm9
1454b1ec1:     	movaps	%xmm9, %xmm8
1454b1ec5:     	addss	%xmm13, %xmm8
1454b1eca:     	movq	0x830(%rdx), %rsi
1454b1ed1:     	cmpq	0x820(%rdx), %rsi
1454b1ed8:     	jne	0x1454b1eee <.text+0x54b0eee>
1454b1eda:     	movb	$0x0, 0x16f(%rbp)
1454b1ee1:     	movq	0xa8(%rbp), %rcx
1454b1ee8:     	callq	0x145763ec0 <.text+0x5762ec0>
1454b1eed:     	nop
1454b1eee:     	movq	0x120(%rbp), %rdx
1454b1ef5:     	movq	0x828(%rdx), %rax
1454b1efc:     	imulq	$0x68, %rsi, %rcx
1454b1f00:     	movq	$0x0, (%rax,%rcx)
1454b1f08:     	movq	$0x4, 0x8(%rax,%rcx)
1454b1f11:     	movq	$0x0, 0x10(%rax,%rcx)
1454b1f1a:     	movl	$0x0, 0x18(%rax,%rcx)
1454b1f22:     	movss	%xmm8, 0x1c(%rax,%rcx)
1454b1f29:     	movq	0x170(%rbp), %r8
1454b1f30:     	movq	%r8, 0x28(%rax,%rcx)
1454b1f35:     	movzbl	0x128(%rbp), %r8d
1454b1f3d:     	movb	%r8b, 0x30(%rax,%rcx)
1454b1f42:     	movq	%rdi, 0x38(%rax,%rcx)
1454b1f47:     	movlps	%xmm6, 0x40(%rax,%rcx)
1454b1f4c:     	movss	%xmm7, 0x48(%rax,%rcx)
1454b1f52:     	movlps	%xmm6, 0x4c(%rax,%rcx)
1454b1f57:     	movss	%xmm7, 0x54(%rax,%rcx)
1454b1f5d:     	xorps	%xmm0, %xmm0
1454b1f60:     	movss	%xmm9, %xmm0            # xmm0 = xmm9[0],xmm0[1,2,3]
1454b1f65:     	movlps	%xmm0, 0x58(%rax,%rcx)
1454b1f6a:     	movss	%xmm9, 0x60(%rax,%rcx)
1454b1f71:     	movss	%xmm15, 0x64(%rax,%rcx)
1454b1f78:     	incq	%rsi
1454b1f7b:     	movq	%rsi, 0x830(%rdx)
1454b1f82:     	leaq	0xe0(%rbp), %rcx
1454b1f89:     	callq	0x1455127d0 <.text+0x55117d0>
1454b1f8e:     	nop
1454b1f8f:     	movq	0xd8(%rbp), %rdi
1454b1f96:     	movq	0xf8(%rbp), %rdx
1454b1f9d:     	addq	$0x10, %rdx
1454b1fa1:     	incq	%rdi
1454b1fa4:     	cmpq	0xc0(%rbp), %rdx
1454b1fab:     	jne	0x1454b10a0 <.text+0x54b00a0>
1454b1fb1:     	movq	0xd0(%rbp), %rdx
1454b1fb8:     	testq	%rdx, %rdx
1454b1fbb:     	je	0x1454b1fd3 <.text+0x54b0fd3>
1454b1fbd:     	shlq	$0x4, %rdx
1454b1fc1:     	movl	$0x8, %r8d
1454b1fc7:     	movq	0xb0(%rbp), %rcx
1454b1fce:     	callq	0x1400021d0 <.text+0x11d0>
1454b1fd3:     	movq	0x120(%rbp), %r13
1454b1fda:     	movl	$0x0, 0x130(%rbp)
1454b1fe4:     	leaq	0x130(%rbp), %rdi
1454b1feb:     	movq	%r13, %rcx
1454b1fee:     	xorl	%edx, %edx
1454b1ff0:     	movq	%rdi, %r8
1454b1ff3:     	callq	0x1454c2040 <.text+0x54c1040>
1454b1ff8:     	movl	$0x0, 0x130(%rbp)
1454b2002:     	movq	%r13, %rcx
1454b2005:     	xorl	%edx, %edx
1454b2007:     	movq	%rdi, %r8
1454b200a:     	callq	0x1454c2040 <.text+0x54c1040>
1454b200f:     	movl	$0x0, 0x130(%rbp)
1454b2019:     	movq	%r13, %rcx
1454b201c:     	xorl	%edx, %edx
1454b201e:     	movq	%rdi, %r8
1454b2021:     	callq	0x1454c2040 <.text+0x54c1040>
1454b2026:     	movl	$0x0, 0x130(%rbp)
1454b2030:     	movq	%r13, %rcx
1454b2033:     	xorl	%edx, %edx
1454b2035:     	movq	%rdi, %r8
1454b2038:     	callq	0x1454c2040 <.text+0x54c1040>
1454b203d:     	movss	0x446f4b(%rip), %xmm6   # 0x1458f8f90
1454b2045:     	movss	0x515867(%rip), %xmm7   # 0x1459c78b4
1454b204d:     	movq	%rdi, %rcx
1454b2050:     	movq	%r13, %rdx
1454b2053:     	movaps	%xmm6, %xmm2
1454b2056:     	movaps	%xmm7, %xmm3
1454b2059:     	callq	0x1454c2a20 <.text+0x54c1a20>
1454b205e:     	movq	%r13, %rcx
1454b2061:     	movl	$0x2, %edx
1454b2066:     	movq	%rdi, %r9
1454b2069:     	callq	0x1454c8110 <.text+0x54c7110>
1454b206e:     	movq	%rdi, %rcx
1454b2071:     	movq	%r13, %rdx
1454b2074:     	movaps	%xmm6, %xmm2
1454b2077:     	movaps	%xmm7, %xmm3
1454b207a:     	callq	0x1454c2a20 <.text+0x54c1a20>
1454b207f:     	movq	%r13, %rcx
1454b2082:     	movl	$0x2, %edx
1454b2087:     	movq	%rdi, %r9
1454b208a:     	callq	0x1454c8110 <.text+0x54c7110>
1454b208f:     	leaq	0x880(%r13), %rcx
1454b2096:     	leaq	0x14f95d3(%rip), %rdx   # 0x1469ab670
1454b209d:     	callq	0x1454f9940 <.text+0x54f8940>
1454b20a2:     	movq	%rax, %rdi
1454b20a5:     	movq	0x210(%r13), %r14
1454b20ac:     	movq	0x218(%r13), %r15
1454b20b3:     	movq	%r14, %rcx
1454b20b6:     	movq	%r15, %rdx
1454b20b9:     	callq	0x14540e820 <.text+0x540d820>
1454b20be:     	imulq	$0xf0, %rax, %rax
1454b20c5:     	leaq	0x126436c(%rip), %rcx   # 0x146716438
1454b20cc:     	movq	0x88(%rax,%rcx), %rax
1454b20d4:     	cmpq	$-0x160, %rax           # imm = 0xFEA0
1454b20da:     	je	0x1454b20ee <.text+0x54b10ee>
1454b20dc:     	movss	0x1a0(%rax), %xmm6
1454b20e4:     	mulss	0x47ee14(%rip), %xmm6   # 0x145930f00
1454b20ec:     	jmp	0x1454b20f6 <.text+0x54b10f6>
1454b20ee:     	movss	0x14f839e(%rip), %xmm6  # 0x1469aa494
1454b20f6:     	movq	%rdi, %rcx
1454b20f9:     	shrq	%rcx
1454b20fc:     	movl	%edi, %eax
1454b20fe:     	andl	$0x1, %eax
1454b2101:     	orq	%rcx, %rax
1454b2104:     	leaq	0x678(%r13), %rbx
1454b210b:     	testq	%rdi, %rdi
1454b210e:     	js	0x1454b2292 <.text+0x54b1292>
1454b2114:     	cvtsi2ss	%rdi, %xmm0
1454b2119:     	movq	$0x0, 0x688(%r13)
1454b2124:     	je	0x1454b22ac <.text+0x54b12ac>
1454b212a:     	divss	%xmm0, %xmm6
1454b212e:     	xorl	%esi, %esi
1454b2130:     	movss	0x4393c4(%rip), %xmm7   # 0x1458eb4fc
1454b2138:     	movss	0x14f8357(%rip), %xmm8  # 0x1469aa498
1454b2141:     	movss	0x4393da(%rip), %xmm9   # 0x1458eb524
1454b214a:     	movss	0x43932d(%rip), %xmm10  # 0x1458eb480
1454b2153:     	jmp	0x1454b2196 <.text+0x54b1196>
1454b2155:     	nopw	%cs:(%rax,%rax)
1454b2160:     	mulss	%xmm6, %xmm12
1454b2165:     	mulss	%xmm6, %xmm11
1454b216a:     	addss	%xmm12, %xmm11
1454b216f:     	movq	0x680(%r13), %rax
1454b2176:     	movss	%xmm12, (%rax,%rsi,8)
1454b217c:     	movss	%xmm11, 0x4(%rax,%rsi,8)
1454b2183:     	incq	%rsi
1454b2186:     	movq	%rsi, 0x688(%r13)
1454b218d:     	cmpq	%rdi, %rsi
1454b2190:     	je	0x1454b2274 <.text+0x54b1274>
1454b2196:     	movq	0x880(%r13), %rdx
1454b219d:     	movq	0x888(%r13), %rax
1454b21a4:     	movq	0x898(%r13), %r8
1454b21ab:     	movq	0x890(%r13), %rcx
1454b21b2:     	nopw	%cs:(%rax,%rax)
1454b21c0:     	leaq	(%rdx,%r8), %r9
1454b21c4:     	rolq	$0x17, %r9
1454b21c8:     	addq	%rdx, %r9
1454b21cb:     	movq	%rax, %r10
1454b21ce:     	shlq	$0x11, %r10
1454b21d2:     	xorq	%rdx, %rcx
1454b21d5:     	xorq	%rax, %r8
1454b21d8:     	xorq	%rcx, %rax
1454b21db:     	xorq	%r8, %rdx
1454b21de:     	xorq	%r10, %rcx
1454b21e1:     	rolq	$0x2d, %r8
1454b21e5:     	shrq	$0x29, %r9
1454b21e9:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454b21f0:     	movd	%r9d, %xmm11
1454b21f5:     	addss	%xmm7, %xmm11
1454b21fa:     	mulss	%xmm8, %xmm11
1454b21ff:     	addss	%xmm9, %xmm11
1454b2204:     	ucomiss	%xmm11, %xmm10
1454b2208:     	jbe	0x1454b21c0 <.text+0x54b11c0>
1454b220a:     	testq	%rsi, %rsi
1454b220d:     	js	0x1454b2220 <.text+0x54b1220>
1454b220f:     	xorps	%xmm12, %xmm12
1454b2213:     	cvtsi2ss	%rsi, %xmm12
1454b2218:     	jmp	0x1454b223e <.text+0x54b123e>
1454b221a:     	nopw	(%rax,%rax)
1454b2220:     	movq	%rsi, %r9
1454b2223:     	shrq	%r9
1454b2226:     	movl	%esi, %r10d
1454b2229:     	andl	$0x1, %r10d
1454b222d:     	orq	%r9, %r10
1454b2230:     	xorps	%xmm12, %xmm12
1454b2234:     	cvtsi2ss	%r10, %xmm12
1454b2239:     	addss	%xmm12, %xmm12
1454b223e:     	movq	%rdx, 0x880(%r13)
1454b2245:     	movq	%r8, 0x898(%r13)
1454b224c:     	movq	%rax, 0x888(%r13)
1454b2253:     	movq	%rcx, 0x890(%r13)
1454b225a:     	cmpq	0x678(%r13), %rsi
1454b2261:     	jne	0x1454b2160 <.text+0x54b1160>
1454b2267:     	movq	%rbx, %rcx
1454b226a:     	callq	0x145763de0 <.text+0x5762de0>
1454b226f:     	jmp	0x1454b2160 <.text+0x54b1160>
1454b2274:     	movq	0x210(%r13), %r14
1454b227b:     	movq	0x218(%r13), %r15
1454b2282:     	cmpb	$0x0, 0x958(%r13)
1454b228a:     	jne	0x1454b238d <.text+0x54b138d>
1454b2290:     	jmp	0x1454b22ba <.text+0x54b12ba>
1454b2292:     	cvtsi2ss	%rax, %xmm0
1454b2297:     	addss	%xmm0, %xmm0
1454b229b:     	movq	$0x0, 0x688(%r13)
1454b22a6:     	jne	0x1454b212a <.text+0x54b112a>
1454b22ac:     	cmpb	$0x0, 0x958(%r13)
1454b22b4:     	jne	0x1454b238d <.text+0x54b138d>
1454b22ba:     	movq	%r14, %rcx
1454b22bd:     	movq	%r15, %rdx
1454b22c0:     	callq	0x14540e820 <.text+0x540d820>
1454b22c5:     	imulq	$0xf0, %rax, %rcx
1454b22cc:     	leaq	0x1264165(%rip), %rdx   # 0x146716438
1454b22d3:     	leaq	(%rdx,%rcx), %rsi
1454b22d7:     	cmpq	$0xb, %rax
1454b22db:     	jne	0x1454b230d <.text+0x54b130d>
1454b22dd:     	movq	0x50(%rcx,%rdx), %r15
1454b22e2:     	leaq	(,%r15,8), %rdi
1454b22ea:     	movabsq	$0x7ffffffffffffff8, %rax # imm = 0x7FFFFFFFFFFFFFF8
1454b22f4:     	cmpq	%rax, %rdi
1454b22f7:     	jbe	0x1454b2b19 <.text+0x54b1b19>
1454b22fd:     	xorl	%r14d, %r14d
1454b2300:     	movq	%r14, %rcx
1454b2303:     	movq	%rdi, %rdx
1454b2306:     	callq	0x1458e721b <.text+0x58e621b>
1454b230b:     	ud2
1454b230d:     	movq	0x78(%rsi), %rax
1454b2311:     	movq	0x80(%rsi), %rcx
1454b2318:     	leaq	(%rcx,%rcx,4), %rcx
1454b231c:     	shlq	$0x4, %rcx
1454b2320:     	addq	%rax, %rcx
1454b2323:     	movq	%rax, 0x130(%rbp)
1454b232a:     	movq	%rcx, 0x138(%rbp)
1454b2331:     	movq	$0x0, 0x140(%rbp)
1454b233c:     	leaq	0x100(%rbp), %rcx
1454b2343:     	leaq	0x130(%rbp), %rdx
1454b234a:     	callq	0x14552f2f0 <.text+0x552e2f0>
1454b234f:     	cmpq	$0x0, 0x110(%rbp)
1454b2357:     	jne	0x1454b2ced <.text+0x54b1ced>
1454b235d:     	movq	0x100(%rbp), %rdx
1454b2364:     	testq	%rdx, %rdx
1454b2367:     	je	0x1454b237f <.text+0x54b137f>
1454b2369:     	movq	0x108(%rbp), %rcx
1454b2370:     	shlq	$0x3, %rdx
1454b2374:     	movl	$0x8, %r8d
1454b237a:     	callq	0x1400021d0 <.text+0x11d0>
1454b237f:     	movq	0x210(%r13), %r14
1454b2386:     	movq	0x218(%r13), %r15
1454b238d:     	movq	%r14, %rcx
1454b2390:     	movq	%r15, %rdx
1454b2393:     	callq	0x14540e820 <.text+0x540d820>
1454b2398:     	imulq	$0xf0, %rax, %rcx
1454b239f:     	leaq	0x1264092(%rip), %rdx   # 0x146716438
1454b23a6:     	leaq	(%rdx,%rcx), %r8
1454b23aa:     	movq	$0x0, 0x130(%rbp)
1454b23b5:     	movq	$0x4, 0x138(%rbp)
1454b23c0:     	movq	$0x0, 0x140(%rbp)
1454b23cb:     	cmpq	$0x7, %rax
1454b23cf:     	movq	%r8, 0x170(%rbp)
1454b23d6:     	jne	0x1454b25e6 <.text+0x54b15e6>
1454b23dc:     	movq	0x60(%rcx,%rdx), %rcx
1454b23e1:     	movq	0x58(%r8), %r12
1454b23e5:     	leaq	(%r12,%rcx,8), %rax
1454b23e9:     	movq	%rax, 0x128(%rbp)
1454b23f0:     	movss	0x439087(%rip), %xmm9   # 0x1458eb480
1454b23f9:     	movss	0x438dde(%rip), %xmm10  # 0x1458eb1e0
1454b2402:     	xorps	%xmm11, %xmm11
1454b2406:     	movss	0x438dd5(%rip), %xmm12  # 0x1458eb1e4
1454b240f:     	leaq	0x130(%rbp), %rdi
1454b2416:     	xorl	%ebx, %ebx
1454b2418:     	movq	%r12, %r15
1454b241b:     	movq	%rcx, 0xd8(%rbp)
1454b2422:     	jmp	0x1454b243e <.text+0x54b143e>
1454b2424:     	nopw	%cs:(%rax,%rax)
1454b2430:     	movq	0x120(%rbp), %r13
1454b2437:     	movq	0xd8(%rbp), %rcx
1454b243e:     	cmpq	0x128(%rbp), %r15
1454b2445:     	je	0x1454b2669 <.text+0x54b1669>
1454b244b:     	incq	%rbx
1454b244e:     	movq	%rbx, %rax
1454b2451:     	orq	%rcx, %rax
1454b2454:     	shrq	$0x20, %rax
1454b2458:     	je	0x1454b2470 <.text+0x54b1470>
1454b245a:     	movq	%rbx, %rax
1454b245d:     	xorl	%edx, %edx
1454b245f:     	divq	%rcx
1454b2462:     	jmp	0x1454b2476 <.text+0x54b1476>
1454b2464:     	nopw	%cs:(%rax,%rax)
1454b2470:     	movl	%ebx, %eax
1454b2472:     	xorl	%edx, %edx
1454b2474:     	divl	%ecx
1454b2476:     	movss	(%r12,%rdx,8), %xmm6
1454b247c:     	movss	0x4(%r12,%rdx,8), %xmm7
1454b2483:     	movss	(%r15), %xmm13
1454b2488:     	movss	0x4(%r15), %xmm14
1454b248e:     	subss	%xmm13, %xmm6
1454b2493:     	subss	%xmm14, %xmm7
1454b2498:     	movaps	%xmm6, %xmm0
1454b249b:     	movaps	%xmm7, %xmm1
1454b249e:     	callq	0x145756e67 <.text+0x5755e67>
1454b24a3:     	divss	0x439055(%rip), %xmm0   # 0x1458eb500
1454b24ab:     	callq	0x145756e6d <.text+0x5755e6d>
1454b24b0:     	maxss	%xmm9, %xmm0
1454b24b5:     	cvttss2si	%xmm0, %rax
1454b24ba:     	movq	%rax, %rcx
1454b24bd:     	sarq	$0x3f, %rcx
1454b24c1:     	movaps	%xmm0, %xmm1
1454b24c4:     	subss	%xmm10, %xmm1
1454b24c9:     	cvttss2si	%xmm1, %r13
1454b24ce:     	andq	%rcx, %r13
1454b24d1:     	orq	%rax, %r13
1454b24d4:     	ucomiss	%xmm11, %xmm0
1454b24d8:     	movl	$0x0, %eax
1454b24dd:     	cmovbq	%rax, %r13
1454b24e1:     	ucomiss	%xmm12, %xmm0
1454b24e5:     	movq	$-0x1, %rax
1454b24ec:     	cmovaq	%rax, %r13
1454b24f0:     	testq	%r13, %r13
1454b24f3:     	js	0x1454b2500 <.text+0x54b1500>
1454b24f5:     	xorps	%xmm15, %xmm15
1454b24f9:     	cvtsi2ss	%r13, %xmm15
1454b24fe:     	jmp	0x1454b251d <.text+0x54b151d>
1454b2500:     	movq	%r13, %rax
1454b2503:     	shrq	%rax
1454b2506:     	movl	%r13d, %ecx
1454b2509:     	andl	$0x1, %ecx
1454b250c:     	orq	%rax, %rcx
1454b250f:     	xorps	%xmm15, %xmm15
1454b2513:     	cvtsi2ss	%rcx, %xmm15
1454b2518:     	addss	%xmm15, %xmm15
1454b251d:     	addq	$0x8, %r15
1454b2521:     	xorl	%r14d, %r14d
1454b2524:     	jmp	0x1454b2584 <.text+0x54b1584>
1454b2526:     	nopw	%cs:(%rax,%rax)
1454b2530:     	movb	$0x1, 0x16e(%rbp)
1454b2537:     	movq	%rdi, %rcx
1454b253a:     	callq	0x145763de0 <.text+0x5762de0>
1454b253f:     	nop
1454b2540:     	divss	%xmm15, %xmm8
1454b2545:     	movaps	%xmm6, %xmm0
1454b2548:     	mulss	%xmm8, %xmm0
1454b254d:     	addss	%xmm13, %xmm0
1454b2552:     	mulss	%xmm7, %xmm8
1454b2557:     	addss	%xmm14, %xmm8
1454b255c:     	movd	%xmm0, %eax
1454b2560:     	movd	%xmm8, %ecx
1454b2565:     	shlq	$0x20, %rcx
1454b2569:     	orq	%rcx, %rax
1454b256c:     	movq	0x138(%rbp), %rcx
1454b2573:     	movq	%rax, (%rcx,%rsi,8)
1454b2577:     	incq	%rsi
1454b257a:     	movq	%rsi, 0x140(%rbp)
1454b2581:     	incq	%r14
1454b2584:     	cmpq	%r13, %r14
1454b2587:     	jae	0x1454b2430 <.text+0x54b1430>
1454b258d:     	testq	%r14, %r14
1454b2590:     	js	0x1454b25b0 <.text+0x54b15b0>
1454b2592:     	xorps	%xmm8, %xmm8
1454b2596:     	cvtsi2ss	%r14, %xmm8
1454b259b:     	movq	0x140(%rbp), %rsi
1454b25a2:     	cmpq	0x130(%rbp), %rsi
1454b25a9:     	jne	0x1454b2540 <.text+0x54b1540>
1454b25ab:     	jmp	0x1454b2530 <.text+0x54b1530>
1454b25ad:     	nopl	(%rax)
1454b25b0:     	movq	%r14, %rax
1454b25b3:     	shrq	%rax
1454b25b6:     	movl	%r14d, %ecx
1454b25b9:     	andl	$0x1, %ecx
1454b25bc:     	orq	%rax, %rcx
1454b25bf:     	xorps	%xmm8, %xmm8
1454b25c3:     	cvtsi2ss	%rcx, %xmm8
1454b25c8:     	addss	%xmm8, %xmm8
1454b25cd:     	movq	0x140(%rbp), %rsi
1454b25d4:     	cmpq	0x130(%rbp), %rsi
1454b25db:     	jne	0x1454b2540 <.text+0x54b1540>
1454b25e1:     	jmp	0x1454b2530 <.text+0x54b1530>
1454b25e6:     	movss	0xd8(%r8), %xmm8
1454b25ef:     	addss	0x4467e8(%rip), %xmm8   # 0x1458f8de0
1454b25f8:     	movss	0x43aa14(%rip), %xmm0   # 0x1458ed014
1454b2600:     	mulss	%xmm8, %xmm0
1454b2605:     	divss	0x438ef3(%rip), %xmm0   # 0x1458eb500
1454b260d:     	callq	0x145756e6d <.text+0x5755e6d>
1454b2612:     	cvttss2si	%xmm0, %rax
1454b2617:     	movq	%rax, %rcx
1454b261a:     	sarq	$0x3f, %rcx
1454b261e:     	movaps	%xmm0, %xmm1
1454b2621:     	subss	0x438bb7(%rip), %xmm1   # 0x1458eb1e0
1454b2629:     	cvttss2si	%xmm1, %rdx
1454b262e:     	andq	%rcx, %rdx
1454b2631:     	orq	%rax, %rdx
1454b2634:     	xorl	%esi, %esi
1454b2636:     	xorps	%xmm1, %xmm1
1454b2639:     	ucomiss	%xmm1, %xmm0
1454b263c:     	cmovbq	%rsi, %rdx
1454b2640:     	ucomiss	0x438b9d(%rip), %xmm0   # 0x1458eb1e4
1454b2647:     	movq	$-0x1, %rbx
1454b264e:     	cmovbeq	%rdx, %rbx
1454b2652:     	testq	%rbx, %rbx
1454b2655:     	js	0x1454b2a09 <.text+0x54b1a09>
1454b265b:     	xorps	%xmm9, %xmm9
1454b265f:     	cvtsi2ss	%rbx, %xmm9
1454b2664:     	jmp	0x1454b2a25 <.text+0x54b1a25>
1454b2669:     	movq	0x140(%rbp), %rsi
1454b2670:     	movq	0x170(%rbp), %r12
1454b2677:     	movq	0x130(%rbp), %rax
1454b267e:     	movq	%rax, 0x128(%rbp)
1454b2685:     	movq	0x138(%rbp), %rax
1454b268c:     	movq	%rax, 0x170(%rbp)
1454b2693:     	testq	%rsi, %rsi
1454b2696:     	je	0x1454b2940 <.text+0x54b1940>
1454b269c:     	movq	0x170(%rbp), %r15
1454b26a3:     	leaq	(%r15,%rsi,8), %rsi
1454b26a7:     	movss	0x49cc60(%rip), %xmm8   # 0x14594f310
1454b26b0:     	xorps	%xmm9, %xmm9
1454b26b4:     	movss	0x438b23(%rip), %xmm10  # 0x1458eb1e0
1454b26bd:     	xorps	%xmm11, %xmm11
1454b26c1:     	movss	0x438b1a(%rip), %xmm12  # 0x1458eb1e4
1454b26ca:     	leaq	0x14f8463(%rip), %rdi   # 0x1469aab34
1454b26d1:     	leaq	0x100(%rbp), %rbx
1454b26d8:     	jmp	0x1454b2719 <.text+0x54b1719>
1454b26da:     	movaps	%xmm13, %xmm0
1454b26de:     	nop
1454b26e0:     	movlps	%xmm6, 0x100(%rbp)
1454b26e7:     	movss	%xmm0, 0x108(%rbp)
1454b26ef:     	movl	$0x10, 0x20(%rsp)
1454b26f7:     	movq	%r13, %rcx
1454b26fa:     	movq	%rdi, %rdx
1454b26fd:     	movq	%rbx, %r8
1454b2700:     	movl	$0x5, %r9d
1454b2706:     	callq	0x1454d2850 <.text+0x54d1850>
1454b270b:     	nop
1454b270c:     	addq	$0x8, %r15
1454b2710:     	cmpq	%rsi, %r15
1454b2713:     	je	0x1454b2940 <.text+0x54b1940>
1454b2719:     	movsd	(%r15), %xmm6
1454b271e:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
1454b2722:     	movq	0x878(%r13), %rcx
1454b2729:     	addq	$0x10, %rcx
1454b272d:     	movaps	%xmm6, %xmm1
1454b2730:     	movaps	%xmm7, %xmm2
1454b2733:     	callq	0x1454627f0 <.text+0x54617f0>
1454b2738:     	nop
1454b2739:     	testb	$0x1, %al
1454b273b:     	je	0x1454b2860 <.text+0x54b1860>
1454b2741:     	cmpb	$0x0, 0xe8(%r12)
1454b274a:     	je	0x1454b26e0 <.text+0x54b16e0>
1454b274c:     	movaps	%xmm0, %xmm13
1454b2750:     	movq	0x210(%r13), %rcx
1454b2757:     	movq	0x218(%r13), %rdx
1454b275e:     	callq	0x14540e820 <.text+0x540d820>
1454b2763:     	imulq	$0xf0, %rax, %rax
1454b276a:     	leaq	0x1263cc7(%rip), %rcx   # 0x146716438
1454b2771:     	movsd	0xc8(%rax,%rcx), %xmm7
1454b277a:     	subps	%xmm6, %xmm7
1454b277d:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
1454b2781:     	movaps	%xmm7, %xmm0
1454b2784:     	callq	0x145756e67 <.text+0x5755e67>
1454b2789:     	movq	0x878(%r13), %rax
1454b2790:     	cmpq	$-0x1, 0x40(%rax)
1454b2795:     	je	0x1454b26da <.text+0x54b16da>
1454b279b:     	maxss	%xmm8, %xmm0
1454b27a0:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454b27a4:     	divps	%xmm0, %xmm7
1454b27a7:     	addps	%xmm6, %xmm7
1454b27aa:     	movsd	0x60(%rax), %xmm0
1454b27af:     	subps	%xmm0, %xmm7
1454b27b2:     	movaps	%xmm7, %xmm0
1454b27b5:     	cmpltps	%xmm9, %xmm0
1454b27ba:     	unpcklps	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1]
1454b27bd:     	movmskpd	%xmm0, %ecx
1454b27c1:     	testl	%ecx, %ecx
1454b27c3:     	movaps	%xmm13, %xmm0
1454b27c7:     	jne	0x1454b26e0 <.text+0x54b16e0>
1454b27cd:     	ucomiss	%xmm11, %xmm7
1454b27d1:     	movl	$0x0, %ecx
1454b27d6:     	movl	$0x0, %r9d
1454b27dc:     	jb	0x1454b28cc <.text+0x54b18cc>
1454b27e2:     	movaps	%xmm7, %xmm1
1454b27e5:     	subss	%xmm10, %xmm1
1454b27ea:     	cvttss2si	%xmm1, %rdx
1454b27ef:     	cvttss2si	%xmm7, %r8
1454b27f4:     	movq	%r8, %r9
1454b27f7:     	sarq	$0x3f, %r9
1454b27fb:     	andq	%rdx, %r9
1454b27fe:     	orq	%r8, %r9
1454b2801:     	ucomiss	%xmm12, %xmm7
1454b2805:     	movq	$-0x1, %r8
1454b280c:     	movq	$-0x1, %rdx
1454b2813:     	jbe	0x1454b28e4 <.text+0x54b18e4>
1454b2819:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
1454b281d:     	ucomiss	%xmm11, %xmm1
1454b2821:     	jb	0x1454b28f5 <.text+0x54b18f5>
1454b2827:     	movaps	%xmm1, %xmm2
1454b282a:     	subss	%xmm10, %xmm2
1454b282f:     	cvttss2si	%xmm2, %r9
1454b2834:     	cvttss2si	%xmm1, %r10
1454b2839:     	movq	%r10, %rcx
1454b283c:     	sarq	$0x3f, %rcx
1454b2840:     	andq	%r9, %rcx
1454b2843:     	orq	%r10, %rcx
1454b2846:     	ucomiss	%xmm12, %xmm1
1454b284a:     	jbe	0x1454b28fb <.text+0x54b18fb>
1454b2850:     	jmp	0x1454b28fe <.text+0x54b18fe>
1454b2855:     	nopw	%cs:(%rax,%rax)
1454b2860:     	cmpb	$0x0, 0xe8(%r12)
1454b2869:     	jne	0x1454b270c <.text+0x54b170c>
1454b286f:     	movq	0x878(%r13), %r14
1454b2876:     	leaq	0x10(%r14), %rcx
1454b287a:     	movaps	%xmm6, %xmm1
1454b287d:     	movaps	%xmm7, %xmm2
1454b2880:     	callq	0x1454627f0 <.text+0x54617f0>
1454b2885:     	nop
1454b2886:     	testb	$0x1, %al
1454b2888:     	jne	0x1454b26e0 <.text+0x54b16e0>
1454b288e:     	cmpq	$-0x1, 0x68(%r14)
1454b2893:     	je	0x1454b28be <.text+0x54b18be>
1454b2895:     	leaq	0x68(%r14), %rdx
1454b2899:     	movq	%rbx, %rcx
1454b289c:     	movaps	%xmm6, %xmm2
1454b289f:     	movaps	%xmm7, %xmm3
1454b28a2:     	callq	0x145467bf0 <.text+0x5466bf0>
1454b28a7:     	nop
1454b28a8:     	cmpl	$0x1, 0x100(%rbp)
1454b28af:     	jne	0x1454b28be <.text+0x54b18be>
1454b28b1:     	movss	0x10c(%rbp), %xmm0
1454b28b9:     	jmp	0x1454b26e0 <.text+0x54b16e0>
1454b28be:     	movss	0x90(%r14), %xmm0
1454b28c7:     	jmp	0x1454b26e0 <.text+0x54b16e0>
1454b28cc:     	ucomiss	%xmm12, %xmm7
1454b28d0:     	movq	$-0x1, %r8
1454b28d7:     	movq	$-0x1, %rdx
1454b28de:     	ja	0x1454b2819 <.text+0x54b1819>
1454b28e4:     	movq	%r9, %rdx
1454b28e7:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
1454b28eb:     	ucomiss	%xmm11, %xmm1
1454b28ef:     	jae	0x1454b2827 <.text+0x54b1827>
1454b28f5:     	ucomiss	%xmm12, %xmm1
1454b28f9:     	ja	0x1454b28fe <.text+0x54b18fe>
1454b28fb:     	movq	%rcx, %r8
1454b28fe:     	movq	0x58(%rax), %rcx
1454b2902:     	cmpq	%rcx, %rdx
1454b2905:     	setae	%r9b
1454b2909:     	cmpq	%rcx, %r8
1454b290c:     	setae	%r10b
1454b2910:     	orb	%r9b, %r10b
1454b2913:     	jne	0x1454b26e0 <.text+0x54b16e0>
1454b2919:     	imulq	%r8, %rcx
1454b291d:     	addq	%rdx, %rcx
1454b2920:     	movq	0x50(%rax), %rdx
1454b2924:     	cmpq	%rdx, %rcx
1454b2927:     	jae	0x1454b397b <.text+0x54b297b>
1454b292d:     	movq	0x48(%rax), %rax
1454b2931:     	cmpb	$0x0, (%rax,%rcx)
1454b2935:     	je	0x1454b26e0 <.text+0x54b16e0>
1454b293b:     	jmp	0x1454b270c <.text+0x54b170c>
1454b2940:     	movq	0x128(%rbp), %rdx
1454b2947:     	testq	%rdx, %rdx
1454b294a:     	je	0x1454b2962 <.text+0x54b1962>
1454b294c:     	shlq	$0x3, %rdx
1454b2950:     	movl	$0x4, %r8d
1454b2956:     	movq	0x170(%rbp), %rcx
1454b295d:     	callq	0x1400021d0 <.text+0x11d0>
1454b2962:     	cmpb	$0x0, 0x959(%r13)
1454b296a:     	je	0x1454b2c64 <.text+0x54b1c64>
1454b2970:     	movq	0x210(%r13), %rcx
1454b2977:     	movq	0x218(%r13), %rdx
1454b297e:     	callq	0x14540e820 <.text+0x540d820>
1454b2983:     	movzbl	0x284(%r13), %edx
1454b298b:     	leaq	0x130(%rbp), %rcx
1454b2992:     	movq	%rax, %r8
1454b2995:     	xorl	%r9d, %r9d
1454b2998:     	callq	0x1454589f0 <.text+0x54579f0>
1454b299d:     	movq	0x138(%rbp), %rcx
1454b29a4:     	movq	0x140(%rbp), %rdi
1454b29ab:     	movq	0x598(%r13), %rax
1454b29b2:     	movq	0x5a8(%r13), %rdx
1454b29b9:     	subq	%rdx, %rax
1454b29bc:     	cmpq	%rax, %rdi
1454b29bf:     	ja	0x1454b38b7 <.text+0x54b28b7>
1454b29c5:     	testq	%rdi, %rdi
1454b29c8:     	je	0x1454b2c42 <.text+0x54b1c42>
1454b29ce:     	movq	0x5a0(%r13), %rax
1454b29d5:     	cmpq	$0x11, %rdi
1454b29d9:     	jb	0x1454b2a01 <.text+0x54b1a01>
1454b29db:     	leaq	(%rax,%rdx,4), %r9
1454b29df:     	leaq	(%rcx,%rdi,8), %r8
1454b29e3:     	addq	$-0x4, %r8
1454b29e7:     	cmpq	%r8, %r9
1454b29ea:     	jae	0x1454b2b52 <.text+0x54b1b52>
1454b29f0:     	leaq	(%rdx,%rdi), %r8
1454b29f4:     	leaq	(%rax,%r8,4), %r8
1454b29f8:     	cmpq	%r8, %rcx
1454b29fb:     	jae	0x1454b2b52 <.text+0x54b1b52>
1454b2a01:     	xorl	%r11d, %r11d
1454b2a04:     	jmp	0x1454b2bb3 <.text+0x54b1bb3>
1454b2a09:     	movq	%rbx, %rax
1454b2a0c:     	shrq	%rax
1454b2a0f:     	movl	%ebx, %ecx
1454b2a11:     	andl	$0x1, %ecx
1454b2a14:     	orq	%rax, %rcx
1454b2a17:     	xorps	%xmm9, %xmm9
1454b2a1b:     	cvtsi2ss	%rcx, %xmm9
1454b2a20:     	addss	%xmm9, %xmm9
1454b2a25:     	movss	0x43a5e6(%rip), %xmm10  # 0x1458ed014
1454b2a2e:     	leaq	0x130(%rbp), %rdi
1454b2a35:     	xorl	%r15d, %r15d
1454b2a38:     	movq	0x170(%rbp), %r14
1454b2a3f:     	jmp	0x1454b2a7e <.text+0x54b1a7e>
1454b2a41:     	nopw	%cs:(%rax,%rax)
1454b2a50:     	movd	%xmm6, %eax
1454b2a54:     	movd	%xmm7, %ecx
1454b2a58:     	shlq	$0x20, %rcx
1454b2a5c:     	orq	%rcx, %rax
1454b2a5f:     	movq	0x138(%rbp), %rcx
1454b2a66:     	movq	%rax, (%rcx,%rsi,8)
1454b2a6a:     	incq	%rsi
1454b2a6d:     	movq	%rsi, 0x140(%rbp)
1454b2a74:     	incq	%r15
1454b2a77:     	movq	0x120(%rbp), %r13
1454b2a7e:     	cmpq	%rbx, %r15
1454b2a81:     	jae	0x1454b2670 <.text+0x54b1670>
1454b2a87:     	testq	%r15, %r15
1454b2a8a:     	js	0x1454b2aa0 <.text+0x54b1aa0>
1454b2a8c:     	xorps	%xmm7, %xmm7
1454b2a8f:     	cvtsi2ss	%r15, %xmm7
1454b2a94:     	jmp	0x1454b2abb <.text+0x54b1abb>
1454b2a96:     	nopw	%cs:(%rax,%rax)
1454b2aa0:     	movq	%r15, %rax
1454b2aa3:     	shrq	%rax
1454b2aa6:     	movl	%r15d, %ecx
1454b2aa9:     	andl	$0x1, %ecx
1454b2aac:     	orq	%rax, %rcx
1454b2aaf:     	xorps	%xmm7, %xmm7
1454b2ab2:     	cvtsi2ss	%rcx, %xmm7
1454b2ab7:     	addss	%xmm7, %xmm7
1454b2abb:     	mulss	%xmm10, %xmm7
1454b2ac0:     	divss	%xmm9, %xmm7
1454b2ac5:     	movaps	%xmm7, %xmm0
1454b2ac8:     	callq	0x145756e31 <.text+0x5755e31>
1454b2acd:     	movaps	%xmm0, %xmm6
1454b2ad0:     	mulss	%xmm8, %xmm6
1454b2ad5:     	addss	0xc8(%r14), %xmm6
1454b2ade:     	movaps	%xmm7, %xmm0
1454b2ae1:     	callq	0x145756e2b <.text+0x5755e2b>
1454b2ae6:     	movaps	%xmm0, %xmm7
1454b2ae9:     	mulss	%xmm8, %xmm7
1454b2aee:     	addss	0xcc(%r14), %xmm7
1454b2af7:     	cmpq	0x130(%rbp), %rsi
1454b2afe:     	jne	0x1454b2a50 <.text+0x54b1a50>
1454b2b04:     	movb	$0x1, 0x16e(%rbp)
1454b2b0b:     	movq	%rdi, %rcx
1454b2b0e:     	callq	0x145763de0 <.text+0x5762de0>
1454b2b13:     	nop
1454b2b14:     	jmp	0x1454b2a50 <.text+0x54b1a50>
1454b2b19:     	movq	0x48(%rsi), %rbx
1454b2b1d:     	testq	%rdi, %rdi
1454b2b20:     	je	0x1454b2cc6 <.text+0x54b1cc6>
1454b2b26:     	callq	0x140002200 <.text+0x1200>
1454b2b2b:     	movl	$0x8, %r14d
1454b2b31:     	movl	$0x8, %edx
1454b2b36:     	movq	%rdi, %rcx
1454b2b39:     	callq	0x1400021c0 <.text+0x11c0>
1454b2b3e:     	testq	%rax, %rax
1454b2b41:     	je	0x1454b2300 <.text+0x54b1300>
1454b2b47:     	movq	%rax, %rcx
1454b2b4a:     	movq	%r15, %rax
1454b2b4d:     	jmp	0x1454b2ccd <.text+0x54b1ccd>
1454b2b52:     	leaq	(,%rdx,4), %r8
1454b2b5a:     	movl	%edi, %r10d
1454b2b5d:     	andl	$0x7, %r10d
1454b2b61:     	movl	$0x8, %r9d
1454b2b67:     	cmovneq	%r10, %r9
1454b2b6b:     	movq	%rdi, %r11
1454b2b6e:     	subq	%r9, %r11
1454b2b71:     	addq	%r11, %rdx
1454b2b74:     	addq	%rax, %r8
1454b2b77:     	addq	$0x10, %r8
1454b2b7b:     	xorl	%r9d, %r9d
1454b2b7e:     	nop
1454b2b80:     	movups	(%rcx,%r9,8), %xmm0
1454b2b85:     	movups	0x10(%rcx,%r9,8), %xmm1
1454b2b8b:     	shufps	$0x88, %xmm1, %xmm0     # xmm0 = xmm0[0,2],xmm1[0,2]
1454b2b8f:     	movups	0x20(%rcx,%r9,8), %xmm1
1454b2b95:     	movups	0x30(%rcx,%r9,8), %xmm2
1454b2b9b:     	shufps	$0x88, %xmm2, %xmm1     # xmm1 = xmm1[0,2],xmm2[0,2]
1454b2b9f:     	movups	%xmm0, -0x10(%r8,%r9,4)
1454b2ba5:     	movups	%xmm1, (%r8,%r9,4)
1454b2baa:     	addq	$0x8, %r9
1454b2bae:     	cmpq	%r9, %r11
1454b2bb1:     	jne	0x1454b2b80 <.text+0x54b1b80>
1454b2bb3:     	movl	%edi, %r9d
1454b2bb6:     	subl	%r11d, %r9d
1454b2bb9:     	movq	%r11, %r8
1454b2bbc:     	andl	$0x3, %r9d
1454b2bc0:     	je	0x1454b2be3 <.text+0x54b1be3>
1454b2bc2:     	nopw	%cs:(%rax,%rax)
1454b2bd0:     	movl	(%rcx,%r8,8), %r10d
1454b2bd4:     	movl	%r10d, (%rax,%rdx,4)
1454b2bd8:     	incq	%rdx
1454b2bdb:     	incq	%r8
1454b2bde:     	decq	%r9
1454b2be1:     	jne	0x1454b2bd0 <.text+0x54b1bd0>
1454b2be3:     	subq	%rdi, %r11
1454b2be6:     	cmpq	$-0x4, %r11
1454b2bea:     	ja	0x1454b2c42 <.text+0x54b1c42>
1454b2bec:     	leaq	(%rax,%rdx,4), %rax
1454b2bf0:     	addq	$0xc, %rax
1454b2bf4:     	leaq	(%rcx,%r8,8), %r10
1454b2bf8:     	addq	$0x18, %r10
1454b2bfc:     	subq	%r8, %rdi
1454b2bff:     	xorl	%r8d, %r8d
1454b2c02:     	nopw	%cs:(%rax,%rax)
1454b2c10:     	movl	-0x18(%r10,%r8,8), %r9d
1454b2c15:     	movl	%r9d, -0xc(%rax,%r8,4)
1454b2c1a:     	movl	-0x10(%r10,%r8,8), %r9d
1454b2c1f:     	movl	%r9d, -0x8(%rax,%r8,4)
1454b2c24:     	movl	-0x8(%r10,%r8,8), %r9d
1454b2c29:     	movl	%r9d, -0x4(%rax,%r8,4)
1454b2c2e:     	movl	(%r10,%r8,8), %r9d
1454b2c32:     	movl	%r9d, (%rax,%r8,4)
1454b2c36:     	addq	$0x4, %r8
1454b2c3a:     	cmpq	%r8, %rdi
1454b2c3d:     	jne	0x1454b2c10 <.text+0x54b1c10>
1454b2c3f:     	addq	%r8, %rdx
1454b2c42:     	movq	%rdx, 0x5a8(%r13)
1454b2c49:     	movq	0x130(%rbp), %rdx
1454b2c50:     	testq	%rdx, %rdx
1454b2c53:     	je	0x1454b2c64 <.text+0x54b1c64>
1454b2c55:     	shlq	$0x3, %rdx
1454b2c59:     	movl	$0x4, %r8d
1454b2c5f:     	callq	0x1400021d0 <.text+0x11d0>
1454b2c64:     	movaps	0x180(%rbp), %xmm6
1454b2c6b:     	movaps	0x190(%rbp), %xmm7
1454b2c72:     	movaps	0x1a0(%rbp), %xmm8
1454b2c7a:     	movaps	0x1b0(%rbp), %xmm9
1454b2c82:     	movaps	0x1c0(%rbp), %xmm10
1454b2c8a:     	movaps	0x1d0(%rbp), %xmm11
1454b2c92:     	movaps	0x1e0(%rbp), %xmm12
1454b2c9a:     	movaps	0x1f0(%rbp), %xmm13
1454b2ca2:     	movaps	0x200(%rbp), %xmm14
1454b2caa:     	movaps	0x210(%rbp), %xmm15
1454b2cb2:     	addq	$0x2a8, %rsp            # imm = 0x2A8
1454b2cb9:     	popq	%rbx
1454b2cba:     	popq	%rdi
1454b2cbb:     	popq	%rsi
1454b2cbc:     	popq	%r12
1454b2cbe:     	popq	%r13
1454b2cc0:     	popq	%r14
1454b2cc2:     	popq	%r15
1454b2cc4:     	popq	%rbp
1454b2cc5:     	retq
1454b2cc6:     	movl	$0x8, %ecx
1454b2ccb:     	xorl	%eax, %eax
1454b2ccd:     	movq	%rax, 0x100(%rbp)
1454b2cd4:     	movq	%rcx, 0x108(%rbp)
1454b2cdb:     	movq	%rbx, %rdx
1454b2cde:     	movq	%rdi, %r8
1454b2ce1:     	callq	0x145756ddd <.text+0x5755ddd>
1454b2ce6:     	movq	%r15, 0x110(%rbp)
1454b2ced:     	leaq	0xd8(%rsi), %rax
1454b2cf4:     	cmpb	$0x0, (%rsi)
1454b2cf7:     	leaq	0x4(%rsi), %rcx
1454b2cfb:     	cmovneq	%rcx, %rax
1454b2cff:     	movss	(%rax), %xmm13
1454b2d04:     	movq	0x878(%r13), %rdi
1454b2d0b:     	leaq	0x10(%rdi), %rcx
1454b2d0f:     	movsd	0xc8(%rsi), %xmm6
1454b2d17:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454b2d1c:     	movaps	%xmm6, %xmm1
1454b2d1f:     	movaps	%xmm8, %xmm2
1454b2d23:     	callq	0x1454627f0 <.text+0x54617f0>
1454b2d28:     	movss	%xmm0, 0xc0(%rbp)
1454b2d30:     	testb	$0x1, %al
1454b2d32:     	jne	0x1454b2d76 <.text+0x54b1d76>
1454b2d34:     	cmpq	$-0x1, 0x68(%rdi)
1454b2d39:     	je	0x1454b2d66 <.text+0x54b1d66>
1454b2d3b:     	leaq	0x68(%rdi), %rdx
1454b2d3f:     	leaq	0x130(%rbp), %rcx
1454b2d46:     	movaps	%xmm6, %xmm2
1454b2d49:     	movaps	%xmm8, %xmm3
1454b2d4d:     	callq	0x145467bf0 <.text+0x5466bf0>
1454b2d52:     	nop
1454b2d53:     	cmpl	$0x1, 0x130(%rbp)
1454b2d5a:     	jne	0x1454b2d66 <.text+0x54b1d66>
1454b2d5c:     	movss	0x13c(%rbp), %xmm0
1454b2d64:     	jmp	0x1454b2d6e <.text+0x54b1d6e>
1454b2d66:     	movss	0x90(%rdi), %xmm0
1454b2d6e:     	movss	%xmm0, 0xc0(%rbp)
1454b2d76:     	movss	0x43870a(%rip), %xmm0   # 0x1458eb488
1454b2d7e:     	mulss	%xmm13, %xmm0
1454b2d83:     	leaq	0x580(%r13), %rax
1454b2d8a:     	movq	%rax, 0x58(%rbp)
1454b2d8e:     	movss	0xd4(%rsi), %xmm1
1454b2d96:     	addss	0x544f76(%rip), %xmm1   # 0x1459f7d14
1454b2d9e:     	movss	%xmm1, 0xa4(%rbp)
1454b2da6:     	movq	0x38(%rsi), %rcx
1454b2daa:     	movq	0x40(%rsi), %rax
1454b2dae:     	movq	0x108(%rbp), %rdx
1454b2db5:     	movq	%rdx, 0x48(%rbp)
1454b2db9:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454b2dbd:     	movaps	%xmm0, -0x40(%rbp)
1454b2dc1:     	shlq	$0x4, %rax
1454b2dc5:     	movq	%rax, 0x128(%rbp)
1454b2dcc:     	movss	0x43840b(%rip), %xmm14  # 0x1458eb1e0
1454b2dd5:     	xorps	%xmm9, %xmm9
1454b2dd9:     	movss	0x438403(%rip), %xmm7   # 0x1458eb1e4
1454b2de1:     	movaps	0x14f76c7(%rip), %xmm8  # 0x1469aa4b0
1454b2de9:     	xorps	%xmm15, %xmm15
1454b2ded:     	xorl	%r8d, %r8d
1454b2df0:     	movq	%rcx, 0x50(%rbp)
1454b2df4:     	jmp	0x1454b2e42 <.text+0x54b1e42>
1454b2df6:     	nopw	%cs:(%rax,%rax)
1454b2e00:     	movq	0x588(%r13), %rax
1454b2e07:     	leaq	(%rsi,%rsi,4), %rcx
1454b2e0b:     	movq	$0x0, (%rax,%rcx,8)
1454b2e13:     	movq	%rbx, 0x10(%rax,%rcx,8)
1454b2e18:     	movlps	%xmm10, 0x18(%rax,%rcx,8)
1454b2e1e:     	movss	%xmm11, 0x20(%rax,%rcx,8)
1454b2e25:     	movl	$0x41a00000, 0x24(%rax,%rcx,8) # imm = 0x41A00000
1454b2e2d:     	incq	%rsi
1454b2e30:     	movq	%rsi, 0x590(%r13)
1454b2e37:     	movq	0xa8(%rbp), %r8
1454b2e3e:     	movq	0x50(%rbp), %rcx
1454b2e42:     	cmpq	$0x3, %r8
1454b2e46:     	ja	0x1454b235d <.text+0x54b135d>
1454b2e4c:     	leaq	0x1(%r8), %rdx
1454b2e50:     	xorps	%xmm10, %xmm10
1454b2e54:     	cvtsi2ss	%r8, %xmm10
1454b2e59:     	mulss	0x43a1b2(%rip), %xmm10  # 0x1458ed014
1454b2e62:     	mulss	0x43a1a5(%rip), %xmm10  # 0x1458ed010
1454b2e6b:     	addss	0xa4(%rbp), %xmm10
1454b2e74:     	xorl	%eax, %eax
1454b2e76:     	movq	%rdx, 0xa8(%rbp)
1454b2e7d:     	movq	%r8, 0xc8(%rbp)
1454b2e84:     	nopw	%cs:(%rax,%rax)
1454b2e90:     	movq	%rax, %rdi
1454b2e93:     	cmpq	%rax, 0x128(%rbp)
1454b2e9a:     	je	0x1454b2f22 <.text+0x54b1f22>
1454b2ea0:     	leaq	0x10(%rdi), %rax
1454b2ea4:     	cmpq	%r8, (%rcx,%rdi)
1454b2ea8:     	jne	0x1454b2e90 <.text+0x54b1e90>
1454b2eaa:     	movsd	-0x8(%rcx,%rax), %xmm1
1454b2eb0:     	movshdup	%xmm1, %xmm11           # xmm11 = xmm1[1,1,3,3]
1454b2eb5:     	movq	0x878(%r13), %rsi
1454b2ebc:     	leaq	0x10(%rsi), %rcx
1454b2ec0:     	movaps	%xmm1, 0xb0(%rbp)
1454b2ec7:     	movaps	%xmm11, %xmm2
1454b2ecb:     	callq	0x1454627f0 <.text+0x54617f0>
1454b2ed0:     	movss	%xmm0, 0xd0(%rbp)
1454b2ed8:     	testb	$0x1, %al
1454b2eda:     	jne	0x1454b2f22 <.text+0x54b1f22>
1454b2edc:     	cmpq	$-0x1, 0x68(%rsi)
1454b2ee1:     	je	0x1454b2f12 <.text+0x54b1f12>
1454b2ee3:     	leaq	0x68(%rsi), %rdx
1454b2ee7:     	leaq	0x130(%rbp), %rcx
1454b2eee:     	movaps	0xb0(%rbp), %xmm2
1454b2ef5:     	movaps	%xmm11, %xmm3
1454b2ef9:     	callq	0x145467bf0 <.text+0x5466bf0>
1454b2efe:     	nop
1454b2eff:     	cmpl	$0x1, 0x130(%rbp)
1454b2f06:     	jne	0x1454b2f12 <.text+0x54b1f12>
1454b2f08:     	movss	0x13c(%rbp), %xmm0
1454b2f10:     	jmp	0x1454b2f1a <.text+0x54b1f1a>
1454b2f12:     	movss	0x90(%rsi), %xmm0
1454b2f1a:     	movss	%xmm0, 0xd0(%rbp)
1454b2f22:     	movaps	0x14f7577(%rip), %xmm0  # 0x1469aa4a0
1454b2f29:     	movups	%xmm0, 0x140(%rbp)
1454b2f30:     	movl	$0x3ec28f5c, 0x150(%rbp) # imm = 0x3EC28F5C
1454b2f3a:     	movaps	%xmm10, %xmm0
1454b2f3e:     	callq	0x145756e31 <.text+0x5755e31>
1454b2f43:     	movaps	%xmm0, %xmm11
1454b2f47:     	movaps	%xmm10, %xmm0
1454b2f4b:     	callq	0x145756e2b <.text+0x5755e2b>
1454b2f50:     	unpcklps	%xmm0, %xmm11           # xmm11 = xmm11[0],xmm0[0],xmm11[1],xmm0[1]
1454b2f54:     	movq	$0x0, 0xd8(%rbp)
1454b2f5f:     	movq	%rdi, 0xf8(%rbp)
1454b2f66:     	jmp	0x1454b2f7e <.text+0x54b1f7e>
1454b2f68:     	nopl	(%rax,%rax)
1454b2f70:     	movq	0x120(%rbp), %r13
1454b2f77:     	movq	0xf8(%rbp), %rdi
1454b2f7e:     	movq	0xd8(%rbp), %rax
1454b2f85:     	cmpq	$0x5, %rax
1454b2f89:     	je	0x1454b36c0 <.text+0x54b26c0>
1454b2f8f:     	cmpq	%rdi, 0x128(%rbp)
1454b2f96:     	jne	0x1454b36e0 <.text+0x54b26e0>
1454b2f9c:     	movss	0x140(%rbp,%rax,4), %xmm0
1454b2fa5:     	mulss	%xmm13, %xmm0
1454b2faa:     	incq	%rax
1454b2fad:     	movq	%rax, 0xd8(%rbp)
1454b2fb4:     	movsldup	%xmm0, %xmm10           # xmm10 = xmm0[0,0,2,2]
1454b2fb9:     	mulps	%xmm11, %xmm10
1454b2fbd:     	addps	%xmm6, %xmm10
1454b2fc1:     	movq	0x878(%r13), %rcx
1454b2fc8:     	cmpq	$-0x1, 0x40(%rcx)
1454b2fcd:     	movshdup	%xmm10, %xmm2           # xmm2 = xmm10[1,1,3,3]
1454b2fd2:     	je	0x1454b34a0 <.text+0x54b24a0>
1454b2fd8:     	movaps	%xmm2, %xmm0
1454b2fdb:     	addss	0x449d05(%rip), %xmm0   # 0x1458fcce8
1454b2fe3:     	movss	0x64(%rcx), %xmm1
1454b2fe8:     	subss	%xmm1, %xmm0
1454b2fec:     	cvttss2si	%xmm0, %rax
1454b2ff1:     	movq	%rax, %rdx
1454b2ff4:     	sarq	$0x3f, %rdx
1454b2ff8:     	movaps	%xmm0, %xmm3
1454b2ffb:     	subss	%xmm14, %xmm3
1454b3000:     	cvttss2si	%xmm3, %r14
1454b3005:     	andq	%rdx, %r14
1454b3008:     	orq	%rax, %r14
1454b300b:     	ucomiss	%xmm9, %xmm0
1454b300f:     	movl	$0x0, %r8d
1454b3015:     	cmovbq	%r8, %r14
1454b3019:     	ucomiss	%xmm7, %xmm0
1454b301c:     	movq	$-0x1, %r13
1454b3023:     	cmovaq	%r13, %r14
1454b3027:     	movaps	%xmm10, %xmm3
1454b302b:     	shufps	$0x55, %xmm10, %xmm3    # xmm3 = xmm3[1,1],xmm10[1,1]
1454b3030:     	addps	%xmm8, %xmm3
1454b3034:     	shufps	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1454b3038:     	subps	%xmm1, %xmm3
1454b303b:     	movaps	%xmm3, %xmm1
1454b303e:     	shufps	$0xff, %xmm3, %xmm1     # xmm1 = xmm1[3,3],xmm3[3,3]
1454b3042:     	cvttss2si	%xmm1, %rax
1454b3047:     	movq	%rax, %rdx
1454b304a:     	sarq	$0x3f, %rdx
1454b304e:     	movaps	%xmm1, %xmm4
1454b3051:     	subss	%xmm14, %xmm4
1454b3056:     	cvttss2si	%xmm4, %rbx
1454b305b:     	andq	%rdx, %rbx
1454b305e:     	orq	%rax, %rbx
1454b3061:     	ucomiss	%xmm9, %xmm1
1454b3065:     	cmovbq	%r8, %rbx
1454b3069:     	ucomiss	%xmm7, %xmm1
1454b306c:     	cmovaq	%r13, %rbx
1454b3070:     	movaps	%xmm3, %xmm1
1454b3073:     	unpckhpd	%xmm3, %xmm1            # xmm1 = xmm1[1],xmm3[1]
1454b3077:     	cvttss2si	%xmm1, %rax
1454b307c:     	movq	%rax, %rdx
1454b307f:     	sarq	$0x3f, %rdx
1454b3083:     	movaps	%xmm1, %xmm4
1454b3086:     	subss	%xmm14, %xmm4
1454b308b:     	cvttss2si	%xmm4, %r11
1454b3090:     	andq	%rdx, %r11
1454b3093:     	orq	%rax, %r11
1454b3096:     	ucomiss	%xmm9, %xmm1
1454b309a:     	cmovbq	%r8, %r11
1454b309e:     	ucomiss	%xmm7, %xmm1
1454b30a1:     	cmovaq	%r13, %r11
1454b30a5:     	movshdup	%xmm3, %xmm1            # xmm1 = xmm3[1,1,3,3]
1454b30a9:     	cvttss2si	%xmm1, %rax
1454b30ae:     	movq	%rax, %rdx
1454b30b1:     	sarq	$0x3f, %rdx
1454b30b5:     	movaps	%xmm1, %xmm4
1454b30b8:     	subss	%xmm14, %xmm4
1454b30bd:     	cvttss2si	%xmm4, %r10
1454b30c2:     	andq	%rdx, %r10
1454b30c5:     	orq	%rax, %r10
1454b30c8:     	ucomiss	%xmm9, %xmm1
1454b30cc:     	cmovbq	%r8, %r10
1454b30d0:     	ucomiss	%xmm7, %xmm1
1454b30d3:     	cmovaq	%r13, %r10
1454b30d7:     	movss	0x60(%rcx), %xmm1
1454b30dc:     	movaps	%xmm3, %xmm4
1454b30df:     	cmpltps	%xmm15, %xmm4
1454b30e4:     	movmskps	%xmm4, %r9d
1454b30e8:     	movl	%r9d, %esi
1454b30eb:     	andb	$0x2, %sil
1454b30ef:     	shrb	%sil
1454b30f2:     	movl	%r9d, %r12d
1454b30f5:     	andb	$0x4, %r12b
1454b30f9:     	shrb	$0x2, %r12b
1454b30fd:     	movl	%r9d, %r15d
1454b3100:     	shrb	$0x3, %r15b
1454b3104:     	cvttss2si	%xmm3, %rax
1454b3109:     	movq	%rax, %rdx
1454b310c:     	sarq	$0x3f, %rdx
1454b3110:     	movaps	%xmm3, %xmm4
1454b3113:     	subss	%xmm14, %xmm4
1454b3118:     	cvttss2si	%xmm4, %rdi
1454b311d:     	andq	%rdx, %rdi
1454b3120:     	orq	%rax, %rdi
1454b3123:     	ucomiss	%xmm9, %xmm3
1454b3127:     	cmovbq	%r8, %rdi
1454b312b:     	ucomiss	%xmm7, %xmm3
1454b312e:     	movq	$-0x1, %r8
1454b3135:     	cmovaq	%r13, %rdi
1454b3139:     	movq	%rdi, 0x170(%rbp)
1454b3140:     	movl	$0xfffffffe, %r13d      # imm = 0xFFFFFFFE
1454b3146:     	jmp	0x1454b315d <.text+0x54b215d>
1454b3148:     	nopl	(%rax,%rax)
1454b3150:     	incl	%r13d
1454b3153:     	cmpl	$0x2, %r13d
1454b3157:     	je	0x1454b33c0 <.text+0x54b23c0>
1454b315d:     	xorps	%xmm3, %xmm3
1454b3160:     	cvtsi2ss	%r13d, %xmm3
1454b3165:     	addss	%xmm10, %xmm3
1454b316a:     	subss	%xmm1, %xmm3
1454b316e:     	ucomiss	%xmm3, %xmm9
1454b3172:     	ja	0x1454b31dd <.text+0x54b21dd>
1454b3174:     	ucomiss	%xmm0, %xmm9
1454b3178:     	ja	0x1454b31dd <.text+0x54b21dd>
1454b317a:     	cvttss2si	%xmm3, %rax
1454b317f:     	movq	%rax, %rdx
1454b3182:     	sarq	$0x3f, %rdx
1454b3186:     	movaps	%xmm3, %xmm4
1454b3189:     	subss	%xmm14, %xmm4
1454b318e:     	cvttss2si	%xmm4, %rdi
1454b3193:     	andq	%rdx, %rdi
1454b3196:     	orq	%rax, %rdi
1454b3199:     	ucomiss	%xmm9, %xmm3
1454b319d:     	movl	$0x0, %edx
1454b31a2:     	cmovaeq	%rdi, %rdx
1454b31a6:     	ucomiss	%xmm7, %xmm3
1454b31a9:     	cmovaq	%r8, %rdx
1454b31ad:     	movq	0x58(%rcx), %rax
1454b31b1:     	cmpq	%rax, %rdx
1454b31b4:     	jae	0x1454b31dd <.text+0x54b21dd>
1454b31b6:     	cmpq	%rax, %r14
1454b31b9:     	jae	0x1454b31dd <.text+0x54b21dd>
1454b31bb:     	imulq	%r14, %rax
1454b31bf:     	addq	%rdx, %rax
1454b31c2:     	movq	0x50(%rcx), %rdx
1454b31c6:     	cmpq	%rdx, %rax
1454b31c9:     	jae	0x1454b384e <.text+0x54b284e>
1454b31cf:     	movq	0x48(%rcx), %rdx
1454b31d3:     	cmpb	$0x0, (%rdx,%rax)
1454b31d7:     	jne	0x1454b2f70 <.text+0x54b1f70>
1454b31dd:     	ucomiss	%xmm3, %xmm9
1454b31e1:     	seta	%al
1454b31e4:     	orb	%r15b, %al
1454b31e7:     	jne	0x1454b324c <.text+0x54b224c>
1454b31e9:     	cvttss2si	%xmm3, %rax
1454b31ee:     	movq	%rax, %rdx
1454b31f1:     	sarq	$0x3f, %rdx
1454b31f5:     	movaps	%xmm3, %xmm4
1454b31f8:     	subss	%xmm14, %xmm4
1454b31fd:     	cvttss2si	%xmm4, %rdi
1454b3202:     	andq	%rdx, %rdi
1454b3205:     	orq	%rax, %rdi
1454b3208:     	ucomiss	%xmm9, %xmm3
1454b320c:     	movl	$0x0, %edx
1454b3211:     	cmovaeq	%rdi, %rdx
1454b3215:     	ucomiss	%xmm7, %xmm3
1454b3218:     	cmovaq	%r8, %rdx
1454b321c:     	movq	0x58(%rcx), %rax
1454b3220:     	cmpq	%rax, %rdx
1454b3223:     	jae	0x1454b324c <.text+0x54b224c>
1454b3225:     	cmpq	%rax, %rbx
1454b3228:     	jae	0x1454b324c <.text+0x54b224c>
1454b322a:     	imulq	%rbx, %rax
1454b322e:     	addq	%rdx, %rax
1454b3231:     	movq	0x50(%rcx), %rdx
1454b3235:     	cmpq	%rdx, %rax
1454b3238:     	jae	0x1454b3863 <.text+0x54b2863>
1454b323e:     	movq	0x48(%rcx), %rdx
1454b3242:     	cmpb	$0x0, (%rdx,%rax)
1454b3246:     	jne	0x1454b2f70 <.text+0x54b1f70>
1454b324c:     	ucomiss	%xmm3, %xmm9
1454b3250:     	seta	%al
1454b3253:     	orb	%r12b, %al
1454b3256:     	jne	0x1454b32bb <.text+0x54b22bb>
1454b3258:     	cvttss2si	%xmm3, %rax
1454b325d:     	movq	%rax, %rdx
1454b3260:     	sarq	$0x3f, %rdx
1454b3264:     	movaps	%xmm3, %xmm4
1454b3267:     	subss	%xmm14, %xmm4
1454b326c:     	cvttss2si	%xmm4, %rdi
1454b3271:     	andq	%rdx, %rdi
1454b3274:     	orq	%rax, %rdi
1454b3277:     	ucomiss	%xmm9, %xmm3
1454b327b:     	movl	$0x0, %edx
1454b3280:     	cmovaeq	%rdi, %rdx
1454b3284:     	ucomiss	%xmm7, %xmm3
1454b3287:     	cmovaq	%r8, %rdx
1454b328b:     	movq	0x58(%rcx), %rax
1454b328f:     	cmpq	%rax, %rdx
1454b3292:     	jae	0x1454b32bb <.text+0x54b22bb>
1454b3294:     	cmpq	%rax, %r11
1454b3297:     	jae	0x1454b32bb <.text+0x54b22bb>
1454b3299:     	imulq	%r11, %rax
1454b329d:     	addq	%rdx, %rax
1454b32a0:     	movq	0x50(%rcx), %rdx
1454b32a4:     	cmpq	%rdx, %rax
1454b32a7:     	jae	0x1454b3878 <.text+0x54b2878>
1454b32ad:     	movq	0x48(%rcx), %rdx
1454b32b1:     	cmpb	$0x0, (%rdx,%rax)
1454b32b5:     	jne	0x1454b2f70 <.text+0x54b1f70>
1454b32bb:     	ucomiss	%xmm3, %xmm9
1454b32bf:     	seta	%al
1454b32c2:     	orb	%sil, %al
1454b32c5:     	jne	0x1454b332a <.text+0x54b232a>
1454b32c7:     	cvttss2si	%xmm3, %rax
1454b32cc:     	movq	%rax, %rdx
1454b32cf:     	sarq	$0x3f, %rdx
1454b32d3:     	movaps	%xmm3, %xmm4
1454b32d6:     	subss	%xmm14, %xmm4
1454b32db:     	cvttss2si	%xmm4, %rdi
1454b32e0:     	andq	%rdx, %rdi
1454b32e3:     	orq	%rax, %rdi
1454b32e6:     	ucomiss	%xmm9, %xmm3
1454b32ea:     	movl	$0x0, %edx
1454b32ef:     	cmovaeq	%rdi, %rdx
1454b32f3:     	ucomiss	%xmm7, %xmm3
1454b32f6:     	cmovaq	%r8, %rdx
1454b32fa:     	movq	0x58(%rcx), %rax
1454b32fe:     	cmpq	%rax, %rdx
1454b3301:     	jae	0x1454b332a <.text+0x54b232a>
1454b3303:     	cmpq	%rax, %r10
1454b3306:     	jae	0x1454b332a <.text+0x54b232a>
1454b3308:     	imulq	%r10, %rax
1454b330c:     	addq	%rdx, %rax
1454b330f:     	movq	0x50(%rcx), %rdx
1454b3313:     	cmpq	%rdx, %rax
1454b3316:     	jae	0x1454b388d <.text+0x54b288d>
1454b331c:     	movq	0x48(%rcx), %rdx
1454b3320:     	cmpb	$0x0, (%rdx,%rax)
1454b3324:     	jne	0x1454b2f70 <.text+0x54b1f70>
1454b332a:     	ucomiss	%xmm3, %xmm9
1454b332e:     	seta	%al
1454b3331:     	orb	%r9b, %al
1454b3334:     	testb	$0x1, %al
1454b3336:     	jne	0x1454b3150 <.text+0x54b2150>
1454b333c:     	cvttss2si	%xmm3, %rax
1454b3341:     	movq	%rax, %rdx
1454b3344:     	sarq	$0x3f, %rdx
1454b3348:     	movaps	%xmm3, %xmm4
1454b334b:     	subss	%xmm14, %xmm4
1454b3350:     	cvttss2si	%xmm4, %rdi
1454b3355:     	andq	%rdx, %rdi
1454b3358:     	orq	%rax, %rdi
1454b335b:     	ucomiss	%xmm9, %xmm3
1454b335f:     	movl	$0x0, %edx
1454b3364:     	cmovaeq	%rdi, %rdx
1454b3368:     	ucomiss	%xmm7, %xmm3
1454b336b:     	cmovaq	%r8, %rdx
1454b336f:     	movq	0x58(%rcx), %rax
1454b3373:     	cmpq	%rax, %rdx
1454b3376:     	jae	0x1454b3150 <.text+0x54b2150>
1454b337c:     	cmpq	%rax, 0x170(%rbp)
1454b3383:     	jae	0x1454b3150 <.text+0x54b2150>
1454b3389:     	imulq	0x170(%rbp), %rax
1454b3391:     	addq	%rdx, %rax
1454b3394:     	movq	0x50(%rcx), %rdx
1454b3398:     	cmpq	%rdx, %rax
1454b339b:     	jae	0x1454b38a2 <.text+0x54b28a2>
1454b33a1:     	movq	0x48(%rcx), %rdx
1454b33a5:     	cmpb	$0x0, (%rdx,%rax)
1454b33a9:     	je	0x1454b3150 <.text+0x54b2150>
1454b33af:     	jmp	0x1454b2f70 <.text+0x54b1f70>
1454b33b4:     	nopw	%cs:(%rax,%rax)
1454b33c0:     	movaps	%xmm10, %xmm3
1454b33c4:     	addss	0x443258(%rip), %xmm3   # 0x1458f6624
1454b33cc:     	subss	%xmm1, %xmm3
1454b33d0:     	ucomiss	%xmm3, %xmm9
1454b33d4:     	movq	0x120(%rbp), %r13
1454b33db:     	movq	0xf8(%rbp), %rdi
1454b33e2:     	ja	0x1454b3460 <.text+0x54b2460>
1454b33e4:     	ucomiss	%xmm0, %xmm9
1454b33e8:     	ja	0x1454b3460 <.text+0x54b2460>
1454b33ea:     	cvttss2si	%xmm3, %rax
1454b33ef:     	movq	%rax, %rdx
1454b33f2:     	sarq	$0x3f, %rdx
1454b33f6:     	movaps	%xmm3, %xmm0
1454b33f9:     	subss	%xmm14, %xmm0
1454b33fe:     	cvttss2si	%xmm0, %rdi
1454b3403:     	andq	%rdx, %rdi
1454b3406:     	orq	%rax, %rdi
1454b3409:     	ucomiss	%xmm9, %xmm3
1454b340d:     	movl	$0x0, %edx
1454b3412:     	cmovaeq	%rdi, %rdx
1454b3416:     	movq	0xf8(%rbp), %rdi
1454b341d:     	ucomiss	%xmm7, %xmm3
1454b3420:     	cmovaq	%r8, %rdx
1454b3424:     	movq	0x58(%rcx), %rax
1454b3428:     	cmpq	%rax, %rdx
1454b342b:     	jae	0x1454b3460 <.text+0x54b2460>
1454b342d:     	cmpq	%rax, %r14
1454b3430:     	jae	0x1454b3460 <.text+0x54b2460>
1454b3432:     	imulq	%r14, %rax
1454b3436:     	addq	%rdx, %rax
1454b3439:     	movq	0x50(%rcx), %rdx
1454b343d:     	cmpq	%rdx, %rax
1454b3440:     	jae	0x1454b3910 <.text+0x54b2910>
1454b3446:     	movq	0x48(%rcx), %rdx
1454b344a:     	cmpb	$0x0, (%rdx,%rax)
1454b344e:     	jne	0x1454b2f7e <.text+0x54b1f7e>
1454b3454:     	nopw	%cs:(%rax,%rax)
1454b3460:     	ucomiss	%xmm3, %xmm9
1454b3464:     	seta	%al
1454b3467:     	orb	%r15b, %al
1454b346a:     	je	0x1454b34de <.text+0x54b24de>
1454b346c:     	ucomiss	%xmm3, %xmm9
1454b3470:     	seta	%al
1454b3473:     	orb	%r12b, %al
1454b3476:     	je	0x1454b3555 <.text+0x54b2555>
1454b347c:     	ucomiss	%xmm3, %xmm9
1454b3480:     	seta	%al
1454b3483:     	orb	%sil, %al
1454b3486:     	je	0x1454b35cc <.text+0x54b25cc>
1454b348c:     	ucomiss	%xmm3, %xmm9
1454b3490:     	seta	%al
1454b3493:     	orb	%r9b, %al
1454b3496:     	testb	$0x1, %al
1454b3498:     	je	0x1454b363c <.text+0x54b263c>
1454b349e:     	nop
1454b34a0:     	addq	$0x10, %rcx
1454b34a4:     	movaps	%xmm10, %xmm1
1454b34a8:     	callq	0x1454627f0 <.text+0x54617f0>
1454b34ad:     	nop
1454b34ae:     	testb	$0x1, %al
1454b34b0:     	je	0x1454b2f7e <.text+0x54b1f7e>
1454b34b6:     	movaps	%xmm0, %xmm1
1454b34b9:     	subss	0xc0(%rbp), %xmm1
1454b34c1:     	andps	0x457a68(%rip), %xmm1   # 0x14590af30
1454b34c8:     	movss	0x443130(%rip), %xmm2   # 0x1458f6600
1454b34d0:     	ucomiss	%xmm1, %xmm2
1454b34d3:     	jbe	0x1454b2f7e <.text+0x54b1f7e>
1454b34d9:     	jmp	0x1454b3787 <.text+0x54b2787>
1454b34de:     	cvttss2si	%xmm3, %rax
1454b34e3:     	movq	%rax, %rdx
1454b34e6:     	sarq	$0x3f, %rdx
1454b34ea:     	movaps	%xmm3, %xmm0
1454b34ed:     	subss	%xmm14, %xmm0
1454b34f2:     	cvttss2si	%xmm0, %rdi
1454b34f7:     	andq	%rdx, %rdi
1454b34fa:     	orq	%rax, %rdi
1454b34fd:     	ucomiss	%xmm9, %xmm3
1454b3501:     	movl	$0x0, %edx
1454b3506:     	cmovaeq	%rdi, %rdx
1454b350a:     	movq	0xf8(%rbp), %rdi
1454b3511:     	ucomiss	%xmm7, %xmm3
1454b3514:     	cmovaq	%r8, %rdx
1454b3518:     	movq	0x58(%rcx), %rax
1454b351c:     	cmpq	%rax, %rdx
1454b351f:     	jae	0x1454b346c <.text+0x54b246c>
1454b3525:     	cmpq	%rax, %rbx
1454b3528:     	jae	0x1454b346c <.text+0x54b246c>
1454b352e:     	imulq	%rbx, %rax
1454b3532:     	addq	%rdx, %rax
1454b3535:     	movq	0x50(%rcx), %rdx
1454b3539:     	cmpq	%rdx, %rax
1454b353c:     	jae	0x1454b3922 <.text+0x54b2922>
1454b3542:     	movq	0x48(%rcx), %rdx
1454b3546:     	cmpb	$0x0, (%rdx,%rax)
1454b354a:     	jne	0x1454b2f7e <.text+0x54b1f7e>
1454b3550:     	jmp	0x1454b346c <.text+0x54b246c>
1454b3555:     	cvttss2si	%xmm3, %rax
1454b355a:     	movq	%rax, %rdx
1454b355d:     	sarq	$0x3f, %rdx
1454b3561:     	movaps	%xmm3, %xmm0
1454b3564:     	subss	%xmm14, %xmm0
1454b3569:     	cvttss2si	%xmm0, %rdi
1454b356e:     	andq	%rdx, %rdi
1454b3571:     	orq	%rax, %rdi
1454b3574:     	ucomiss	%xmm9, %xmm3
1454b3578:     	movl	$0x0, %edx
1454b357d:     	cmovaeq	%rdi, %rdx
1454b3581:     	movq	0xf8(%rbp), %rdi
1454b3588:     	ucomiss	%xmm7, %xmm3
1454b358b:     	cmovaq	%r8, %rdx
1454b358f:     	movq	0x58(%rcx), %rax
1454b3593:     	cmpq	%rax, %rdx
1454b3596:     	jae	0x1454b347c <.text+0x54b247c>
1454b359c:     	cmpq	%rax, %r11
1454b359f:     	jae	0x1454b347c <.text+0x54b247c>
1454b35a5:     	imulq	%r11, %rax
1454b35a9:     	addq	%rdx, %rax
1454b35ac:     	movq	0x50(%rcx), %rdx
1454b35b0:     	cmpq	%rdx, %rax
1454b35b3:     	jae	0x1454b3934 <.text+0x54b2934>
1454b35b9:     	movq	0x48(%rcx), %rdx
1454b35bd:     	cmpb	$0x0, (%rdx,%rax)
1454b35c1:     	jne	0x1454b2f7e <.text+0x54b1f7e>
1454b35c7:     	jmp	0x1454b347c <.text+0x54b247c>
1454b35cc:     	cvttss2si	%xmm3, %rax
1454b35d1:     	movq	%rax, %rdx
1454b35d4:     	sarq	$0x3f, %rdx
1454b35d8:     	movaps	%xmm3, %xmm0
1454b35db:     	subss	%xmm14, %xmm0
1454b35e0:     	cvttss2si	%xmm0, %r11
1454b35e5:     	andq	%rdx, %r11
1454b35e8:     	orq	%rax, %r11
1454b35eb:     	ucomiss	%xmm9, %xmm3
1454b35ef:     	movl	$0x0, %edx
1454b35f4:     	cmovaeq	%r11, %rdx
1454b35f8:     	ucomiss	%xmm7, %xmm3
1454b35fb:     	cmovaq	%r8, %rdx
1454b35ff:     	movq	0x58(%rcx), %rax
1454b3603:     	cmpq	%rax, %rdx
1454b3606:     	jae	0x1454b348c <.text+0x54b248c>
1454b360c:     	cmpq	%rax, %r10
1454b360f:     	jae	0x1454b348c <.text+0x54b248c>
1454b3615:     	imulq	%r10, %rax
1454b3619:     	addq	%rdx, %rax
1454b361c:     	movq	0x50(%rcx), %rdx
1454b3620:     	cmpq	%rdx, %rax
1454b3623:     	jae	0x1454b3946 <.text+0x54b2946>
1454b3629:     	movq	0x48(%rcx), %rdx
1454b362d:     	cmpb	$0x0, (%rdx,%rax)
1454b3631:     	jne	0x1454b2f7e <.text+0x54b1f7e>
1454b3637:     	jmp	0x1454b348c <.text+0x54b248c>
1454b363c:     	cvttss2si	%xmm3, %rax
1454b3641:     	movq	%rax, %rdx
1454b3644:     	sarq	$0x3f, %rdx
1454b3648:     	movaps	%xmm3, %xmm0
1454b364b:     	subss	%xmm14, %xmm0
1454b3650:     	cvttss2si	%xmm0, %r9
1454b3655:     	andq	%rdx, %r9
1454b3658:     	orq	%rax, %r9
1454b365b:     	ucomiss	%xmm9, %xmm3
1454b365f:     	movl	$0x0, %edx
1454b3664:     	cmovaeq	%r9, %rdx
1454b3668:     	ucomiss	%xmm7, %xmm3
1454b366b:     	cmovaq	%r8, %rdx
1454b366f:     	movq	0x58(%rcx), %rax
1454b3673:     	cmpq	%rax, %rdx
1454b3676:     	jae	0x1454b34a0 <.text+0x54b24a0>
1454b367c:     	cmpq	%rax, 0x170(%rbp)
1454b3683:     	jae	0x1454b34a0 <.text+0x54b24a0>
1454b3689:     	imulq	0x170(%rbp), %rax
1454b3691:     	addq	%rdx, %rax
1454b3694:     	movq	0x50(%rcx), %rdx
1454b3698:     	cmpq	%rdx, %rax
1454b369b:     	jae	0x1454b3958 <.text+0x54b2958>
1454b36a1:     	movq	0x48(%rcx), %rdx
1454b36a5:     	cmpb	$0x0, (%rdx,%rax)
1454b36a9:     	jne	0x1454b2f7e <.text+0x54b1f7e>
1454b36af:     	jmp	0x1454b34a0 <.text+0x54b24a0>
1454b36b4:     	nopw	%cs:(%rax,%rax)
1454b36c0:     	cmpq	%rdi, 0x128(%rbp)
1454b36c7:     	je	0x1454b374f <.text+0x54b274f>
1454b36cd:     	movss	0xd0(%rbp), %xmm11
1454b36d6:     	movaps	0xb0(%rbp), %xmm10
1454b36de:     	jmp	0x1454b36f1 <.text+0x54b26f1>
1454b36e0:     	movaps	0xb0(%rbp), %xmm10
1454b36e8:     	movss	0xd0(%rbp), %xmm11
1454b36f1:     	movq	0xc8(%rbp), %rax
1454b36f8:     	movq	0x110(%rbp), %rcx
1454b36ff:     	testq	%rcx, %rcx
1454b3702:     	je	0x1454b3901 <.text+0x54b2901>
1454b3708:     	movq	%rax, %rdx
1454b370b:     	orq	%rcx, %rdx
1454b370e:     	shrq	$0x20, %rdx
1454b3712:     	je	0x1454b3720 <.text+0x54b2720>
1454b3714:     	xorl	%edx, %edx
1454b3716:     	divq	%rcx
1454b3719:     	jmp	0x1454b3724 <.text+0x54b2724>
1454b371b:     	nopl	(%rax,%rax)
1454b3720:     	xorl	%edx, %edx
1454b3722:     	divl	%ecx
1454b3724:     	movq	0x48(%rbp), %rax
1454b3728:     	movq	(%rax,%rdx,8), %rbx
1454b372c:     	movq	0x590(%r13), %rsi
1454b3733:     	cmpq	0x580(%r13), %rsi
1454b373a:     	jne	0x1454b2e00 <.text+0x54b1e00>
1454b3740:     	movq	0x58(%rbp), %rcx
1454b3744:     	callq	0x145758120 <.text+0x5757120>
1454b3749:     	nop
1454b374a:     	jmp	0x1454b2e00 <.text+0x54b1e00>
1454b374f:     	mulps	-0x40(%rbp), %xmm11
1454b3754:     	movaps	%xmm11, %xmm10
1454b3758:     	addps	%xmm6, %xmm10
1454b375c:     	movshdup	%xmm10, %xmm12          # xmm12 = xmm10[1,1,3,3]
1454b3761:     	movq	0x878(%r13), %rsi
1454b3768:     	leaq	0x10(%rsi), %rcx
1454b376c:     	movaps	%xmm10, %xmm1
1454b3770:     	movaps	%xmm12, %xmm2
1454b3774:     	callq	0x1454627f0 <.text+0x54617f0>
1454b3779:     	nop
1454b377a:     	testb	$0x1, %al
1454b377c:     	je	0x1454b379c <.text+0x54b279c>
1454b377e:     	movaps	%xmm0, %xmm11
1454b3782:     	jmp	0x1454b36f1 <.text+0x54b26f1>
1454b3787:     	movss	%xmm0, 0xd0(%rbp)
1454b378f:     	movaps	%xmm10, 0xb0(%rbp)
1454b3797:     	jmp	0x1454b36e8 <.text+0x54b26e8>
1454b379c:     	cmpq	$-0x1, 0x68(%rsi)
1454b37a1:     	je	0x1454b37d3 <.text+0x54b27d3>
1454b37a3:     	leaq	0x68(%rsi), %rdx
1454b37a7:     	leaq	0x130(%rbp), %rcx
1454b37ae:     	movaps	%xmm10, %xmm2
1454b37b2:     	movaps	%xmm12, %xmm3
1454b37b6:     	callq	0x145467bf0 <.text+0x5466bf0>
1454b37bb:     	nop
1454b37bc:     	cmpl	$0x1, 0x130(%rbp)
1454b37c3:     	jne	0x1454b37d3 <.text+0x54b27d3>
1454b37c5:     	movss	0x13c(%rbp), %xmm11
1454b37ce:     	jmp	0x1454b36f1 <.text+0x54b26f1>
1454b37d3:     	movss	0x90(%rsi), %xmm11
1454b37dc:     	jmp	0x1454b36f1 <.text+0x54b26f1>
1454b37e1:     	leaq	0x100(%rbp), %rax
1454b37e8:     	movq	%rax, 0x130(%rbp)
1454b37ef:     	leaq	-0x54b1736(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454b37f6:     	movq	%rax, 0x138(%rbp)
1454b37fd:     	leaq	0x1265474(%rip), %rcx   # 0x146718c78
1454b3804:     	leaq	0x126547d(%rip), %r8    # 0x146718c88
1454b380b:     	leaq	0x130(%rbp), %rdx
1454b3812:     	callq	0x1458e7790 <.text+0x58e6790>
1454b3817:     	nop
1454b3818:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b381d:     	movq	$0x1, 0x20(%rsp)
1454b3826:     	leaq	0x100(%rbp), %rcx
1454b382d:     	movl	$0x1, %r8d
1454b3833:     	movl	$0x1, %r9d
1454b3839:     	movq	%rdi, %rdx
1454b383c:     	callq	0x145757d40 <.text+0x5756d40>
1454b3841:     	nop
1454b3842:     	movq	0x100(%rbp), %rax
1454b3849:     	jmp	0x1454b0e58 <.text+0x54afe58>
1454b384e:     	leaq	0x14d84a3(%rip), %r8    # 0x14698bcf8
1454b3855:     	movq	%rax, %rcx
1454b3858:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b385d:     	nop
1454b385e:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b3863:     	leaq	0x14d848e(%rip), %r8    # 0x14698bcf8
1454b386a:     	movq	%rax, %rcx
1454b386d:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b3872:     	nop
1454b3873:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b3878:     	leaq	0x14d8479(%rip), %r8    # 0x14698bcf8
1454b387f:     	movq	%rax, %rcx
1454b3882:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b3887:     	nop
1454b3888:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b388d:     	leaq	0x14d8464(%rip), %r8    # 0x14698bcf8
1454b3894:     	movq	%rax, %rcx
1454b3897:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b389c:     	nop
1454b389d:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b38a2:     	leaq	0x14d844f(%rip), %r8    # 0x14698bcf8
1454b38a9:     	movq	%rax, %rcx
1454b38ac:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b38b1:     	nop
1454b38b2:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b38b7:     	movq	%rcx, 0x170(%rbp)
1454b38be:     	leaq	0x598(%r13), %rcx
1454b38c5:     	movq	$0x4, 0x20(%rsp)
1454b38ce:     	movl	$0x4, %r9d
1454b38d4:     	movq	%rdi, %r8
1454b38d7:     	callq	0x145757d40 <.text+0x5756d40>
1454b38dc:     	nop
1454b38dd:     	movq	0x5a8(%r13), %rdx
1454b38e4:     	movq	0x170(%rbp), %rcx
1454b38eb:     	movq	0x5a0(%r13), %rax
1454b38f2:     	cmpq	$0x11, %rdi
1454b38f6:     	jb	0x1454b2a01 <.text+0x54b1a01>
1454b38fc:     	jmp	0x1454b29db <.text+0x54b19db>
1454b3901:     	leaq	0x14f8f88(%rip), %rcx   # 0x1469ac890
1454b3908:     	callq	0x1458e78b0 <.text+0x58e68b0>
1454b390d:     	nop
1454b390e:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b3910:     	leaq	0x14d83e1(%rip), %r8    # 0x14698bcf8
1454b3917:     	movq	%rax, %rcx
1454b391a:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b391f:     	nop
1454b3920:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b3922:     	leaq	0x14d83cf(%rip), %r8    # 0x14698bcf8
1454b3929:     	movq	%rax, %rcx
1454b392c:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b3931:     	nop
1454b3932:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b3934:     	leaq	0x14d83bd(%rip), %r8    # 0x14698bcf8
1454b393b:     	movq	%rax, %rcx
1454b393e:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b3943:     	nop
1454b3944:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b3946:     	leaq	0x14d83ab(%rip), %r8    # 0x14698bcf8
1454b394d:     	movq	%rax, %rcx
1454b3950:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b3955:     	nop
1454b3956:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b3958:     	leaq	0x14d8399(%rip), %r8    # 0x14698bcf8
1454b395f:     	movq	%rax, %rcx
1454b3962:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b3967:     	nop
1454b3968:     	jmp	0x1454b3988 <.text+0x54b2988>
1454b396a:     	movl	$0x1, %ecx
1454b396f:     	movl	$0x1, %edx
1454b3974:     	callq	0x1458e721b <.text+0x58e621b>
1454b3979:     	ud2
1454b397b:     	leaq	0x14d8376(%rip), %r8    # 0x14698bcf8
1454b3982:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454b3987:     	nop
1454b3988:     	ud2

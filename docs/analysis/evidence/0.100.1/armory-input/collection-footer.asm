
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140249840:     	pushq	%rbp
140249841:     	pushq	%r15
140249843:     	pushq	%r14
140249845:     	pushq	%r13
140249847:     	pushq	%r12
140249849:     	pushq	%rsi
14024984a:     	pushq	%rdi
14024984b:     	pushq	%rbx
14024984c:     	subq	$0x548, %rsp            # imm = 0x548
140249853:     	leaq	0x80(%rsp), %rbp
14024985b:     	movaps	%xmm15, 0x4b0(%rbp)
140249863:     	movaps	%xmm14, 0x4a0(%rbp)
14024986b:     	movaps	%xmm13, 0x490(%rbp)
140249873:     	movaps	%xmm12, 0x480(%rbp)
14024987b:     	movaps	%xmm11, 0x470(%rbp)
140249883:     	movaps	%xmm10, 0x460(%rbp)
14024988b:     	movaps	%xmm9, 0x450(%rbp)
140249893:     	movaps	%xmm8, 0x440(%rbp)
14024989b:     	movaps	%xmm7, 0x430(%rbp)
1402498a2:     	movaps	%xmm6, 0x420(%rbp)
1402498a9:     	movq	$-0x2, 0x418(%rbp)
1402498b4:     	movq	%r8, %r12
1402498b7:     	movq	%rdx, %r13
1402498ba:     	movq	%rcx, %r15
1402498bd:     	movq	0x530(%rbp), %rsi
1402498c4:     	movq	%r9, 0x150(%rbp)
1402498cb:     	movq	0x120(%r9), %rcx
1402498d2:     	movl	0x50(%rsi), %edi
1402498d5:     	movq	%rcx, 0x118(%rbp)
1402498dc:     	movl	%edi, %edx
1402498de:     	callq	0x14542f520 <.text+0x542e520>
1402498e3:     	movb	%al, 0x417(%rbp)
1402498e9:     	movq	0x30(%rsi), %rax
1402498ed:     	decq	%rax
1402498f0:     	cmpq	$0x4, %rax
1402498f4:     	movl	%edi, 0x3f0(%rbp)
1402498fa:     	ja	0x1402499e0 <.text+0x2489e0>
140249900:     	leaq	0x5707589(%rip), %rcx   # 0x145950e90
140249907:     	movslq	(%rcx,%rax,4), %rax
14024990b:     	addq	%rcx, %rax
14024990e:     	jmpq	*%rax
140249910:     	movsd	0x5701967(%rip), %xmm13 # 0x14594b280
140249919:     	movsd	0x570196e(%rip), %xmm14 # 0x14594b290
140249922:     	movsd	0x56f6406(%rip), %xmm0  # 0x14593fd30
14024992a:     	movss	0x570196d(%rip), %xmm15 # 0x14594b2a0
140249933:     	xorps	%xmm1, %xmm1
140249936:     	xorps	%xmm7, %xmm7
140249939:     	jmp	0x140249a11 <.text+0x248a11>
14024993e:     	movq	0x530(%rbp), %rax
140249945:     	cmpl	$0x2, 0x58(%rax)
140249949:     	jne	0x14024997e <.text+0x24897e>
14024994b:     	movsd	0x57018ac(%rip), %xmm13 # 0x14594b200
140249954:     	movsd	0x57018b3(%rip), %xmm14 # 0x14594b210
14024995d:     	movsd	0x56f5fab(%rip), %xmm0  # 0x14593f910
140249965:     	movss	0x57018b2(%rip), %xmm15 # 0x14594b220
14024996e:     	xorps	%xmm7, %xmm7
140249971:     	movss	0x56f5fa7(%rip), %xmm1  # 0x14593f920
140249979:     	jmp	0x140249a11 <.text+0x248a11>
14024997e:     	movsd	0x57018a9(%rip), %xmm13 # 0x14594b230
140249987:     	movsd	0x57018b0(%rip), %xmm14 # 0x14594b240
140249990:     	movsd	0x56f6378(%rip), %xmm0  # 0x14593fd10
140249998:     	movss	0x56c999f(%rip), %xmm15 # 0x145913340
1402499a1:     	movss	0x57018a7(%rip), %xmm7  # 0x14594b250
1402499a9:     	jmp	0x1402499d6 <.text+0x2489d6>
1402499ab:     	movsd	0x57018ac(%rip), %xmm13 # 0x14594b260
1402499b4:     	movsd	0x57018b3(%rip), %xmm14 # 0x14594b270
1402499bd:     	movsd	0x56f635b(%rip), %xmm0  # 0x14593fd20
1402499c5:     	movss	0x56bdb4e(%rip), %xmm15 # 0x14590751c
1402499ce:     	movss	0x56f660a(%rip), %xmm7  # 0x14593ffe0
1402499d6:     	movss	0x56bdab2(%rip), %xmm1  # 0x145907490
1402499de:     	jmp	0x140249a11 <.text+0x248a11>
1402499e0:     	movsd	0x57017f7(%rip), %xmm13 # 0x14594b1e0
1402499e9:     	movaps	0x57017ff(%rip), %xmm14 # 0x14594b1f0
1402499f1:     	movaps	0x56f6308(%rip), %xmm0  # 0x14593fd00
1402499f8:     	movss	0x56f5f27(%rip), %xmm15 # 0x14593f928
140249a01:     	movss	0x56c993b(%rip), %xmm7  # 0x145913344
140249a09:     	movss	0x56f5f1f(%rip), %xmm1  # 0x14593f930
140249a11:     	movl	$0x0, 0x104(%rbp)
140249a1b:     	movlps	%xmm0, 0x108(%rbp)
140249a22:     	movss	%xmm1, 0x110(%rbp)
140249a2a:     	movl	$0x3f800000, 0x114(%rbp) # imm = 0x3F800000
140249a34:     	movups	0x5705b1d(%rip), %xmm6  # 0x14594f558
140249a3b:     	movaps	%xmm6, 0x160(%rbp)
140249a42:     	movq	$0x0, 0x170(%rbp)
140249a4d:     	movups	0x5705b1c(%rip), %xmm0  # 0x14594f570
140249a54:     	movups	%xmm0, 0x178(%rbp)
140249a5b:     	movq	$0x0, 0x188(%rbp)
140249a66:     	movups	0x5705b1a(%rip), %xmm8  # 0x14594f588
140249a6e:     	movaps	%xmm8, 0x190(%rbp)
140249a76:     	movq	$0x0, 0x1a0(%rbp)
140249a81:     	movups	0x5705b17(%rip), %xmm9  # 0x14594f5a0
140249a89:     	movups	%xmm9, 0x1a8(%rbp)
140249a91:     	movq	$0x0, 0x1b8(%rbp)
140249a9c:     	movaps	%xmm6, -0x40(%rbp)
140249aa0:     	movaps	%xmm8, -0x10(%rbp)
140249aa5:     	movq	0x170(%rbp), %rax
140249aac:     	movq	%rax, -0x30(%rbp)
140249ab0:     	movq	0x178(%rbp), %rax
140249ab7:     	movq	%rax, -0x28(%rbp)
140249abb:     	movq	0x180(%rbp), %rax
140249ac2:     	movq	%rax, -0x20(%rbp)
140249ac6:     	movq	0x188(%rbp), %rax
140249acd:     	movq	%rax, -0x18(%rbp)
140249ad1:     	movq	0x1a0(%rbp), %rax
140249ad8:     	movq	%rax, (%rbp)
140249adc:     	movq	0x1a8(%rbp), %rax
140249ae3:     	movq	%rax, 0x8(%rbp)
140249ae7:     	movaps	0x1b0(%rbp), %xmm0
140249aee:     	movaps	%xmm0, 0x10(%rbp)
140249af2:     	xorps	%xmm0, %xmm0
140249af5:     	movaps	%xmm0, 0x60(%rbp)
140249af9:     	movaps	%xmm0, 0x50(%rbp)
140249afd:     	movaps	%xmm0, 0x40(%rbp)
140249b01:     	movaps	%xmm0, 0x30(%rbp)
140249b05:     	movaps	%xmm0, 0x20(%rbp)
140249b09:     	movq	$0x0, 0x70(%rbp)
140249b11:     	movups	0x5705b07(%rip), %xmm11 # 0x14594f620
140249b19:     	movups	%xmm11, 0x88(%rbp)
140249b21:     	movups	0x5705ae7(%rip), %xmm12 # 0x14594f610
140249b29:     	movups	%xmm12, 0x78(%rbp)
140249b2e:     	movq	(%r15), %rsi
140249b31:     	leaq	0x8(%r15), %rdi
140249b35:     	leaq	0x168(%rbp), %rcx
140249b3c:     	leaq	-0x40(%rbp), %rdx
140249b40:     	movl	$0xd8, %r8d
140249b46:     	callq	0x1457731ed <.text+0x57721ed>
140249b4b:     	movaps	0x56cec5e(%rip), %xmm0  # 0x1459187b0
140249b52:     	movups	%xmm0, 0x240(%rbp)
140249b59:     	movups	%xmm0, 0x250(%rbp)
140249b60:     	movaps	0x56bd789(%rip), %xmm1  # 0x1459072f0
140249b67:     	movups	%xmm1, 0x260(%rbp)
140249b6e:     	movups	%xmm1, 0x270(%rbp)
140249b75:     	movups	%xmm0, 0x280(%rbp)
140249b7c:     	movups	%xmm0, 0x290(%rbp)
140249b83:     	movaps	0x56bd935(%rip), %xmm10 # 0x1459074c0
140249b8b:     	movups	%xmm10, 0x2a0(%rbp)
140249b93:     	movl	$0x1, 0x2b0(%rbp)
140249b9d:     	movss	0x56bd96b(%rip), %xmm0  # 0x145907510
140249ba5:     	movlps	%xmm0, 0x2b4(%rbp)
140249bac:     	movb	$0x1, 0x2bc(%rbp)
140249bb3:     	movq	$0x0, 0x2c0(%rbp)
140249bbe:     	movl	$0x3f800000, 0x2c8(%rbp) # imm = 0x3F800000
140249bc8:     	movw	$0x0, 0x2cc(%rbp)
140249bd1:     	movl	$0x10000, 0x2ce(%rbp)   # imm = 0x10000
140249bdb:     	movw	$0x0, 0x2d2(%rbp)
140249be4:     	movl	$0x10000, 0x2d4(%rbp)   # imm = 0x10000
140249bee:     	movw	$0x0, 0x2d8(%rbp)
140249bf7:     	movq	$0x0, 0x2da(%rbp)
140249c02:     	movl	$0x5, 0x2e2(%rbp)
140249c0c:     	movl	$0x0, 0x2e8(%rbp)
140249c16:     	movlps	%xmm14, 0x2ec(%rbp)
140249c1e:     	movss	%xmm7, 0x2f4(%rbp)
140249c26:     	movq	$0x3f800000, 0x2f8(%rbp) # imm = 0x3F800000
140249c31:     	movlps	%xmm14, 0x300(%rbp)
140249c39:     	movss	%xmm7, 0x308(%rbp)
140249c41:     	movq	$0x3f800000, 0x30c(%rbp) # imm = 0x3F800000
140249c4c:     	movlps	%xmm14, 0x314(%rbp)
140249c54:     	movss	%xmm7, 0x31c(%rbp)
140249c5c:     	movq	$0x3f800000, 0x320(%rbp) # imm = 0x3F800000
140249c67:     	movlps	%xmm14, 0x328(%rbp)
140249c6f:     	movss	%xmm7, 0x330(%rbp)
140249c77:     	movq	$0x3f800000, 0x334(%rbp) # imm = 0x3F800000
140249c82:     	movlps	%xmm13, 0x33c(%rbp)
140249c8a:     	movss	%xmm15, 0x344(%rbp)
140249c93:     	movl	$0x3f4ccccd, 0x348(%rbp) # imm = 0x3F4CCCCD
140249c9d:     	movq	%rsi, 0x160(%rbp)
140249ca4:     	leaq	0x5701f3d(%rip), %r9    # 0x14594bbe8
140249cab:     	leaq	0x378(%rbp), %rsi
140249cb2:     	leaq	0x160(%rbp), %r8
140249cb9:     	movq	%rsi, %rcx
140249cbc:     	movq	%rdi, 0x408(%rbp)
140249cc3:     	movq	%rdi, %rdx
140249cc6:     	callq	0x1400d7a80 <.text+0xd6a80>
140249ccb:     	leaq	0x104(%rbp), %rax
140249cd2:     	movq	%rax, 0x160(%rbp)
140249cd9:     	movq	%r12, 0x168(%rbp)
140249ce0:     	movq	0x530(%rbp), %rdi
140249ce7:     	movq	%rdi, 0x170(%rbp)
140249cee:     	leaq	0x417(%rbp), %rax
140249cf5:     	movq	%rax, 0x178(%rbp)
140249cfc:     	movq	%r13, 0x180(%rbp)
140249d03:     	leaq	0x160(%rbp), %rdx
140249d0a:     	movq	%rsi, %rcx
140249d0d:     	callq	0x14012a6d0 <.text+0x1296d0>
140249d12:     	movq	%rdi, %rcx
140249d15:     	callq	0x14546d180 <.text+0x546c180>
140249d1a:     	testl	%eax, %eax
140249d1c:     	jle	0x140249ec7 <.text+0x248ec7>
140249d22:     	movq	%rdi, %rcx
140249d25:     	callq	0x14546d180 <.text+0x546c180>
140249d2a:     	movl	%eax, 0x138(%rbp)
140249d30:     	leaq	0x5705b19(%rip), %rax   # 0x14594f850
140249d37:     	movq	%rax, 0x378(%rbp)
140249d3e:     	movq	$0x1, 0x380(%rbp)
140249d49:     	leaq	0x138(%rbp), %rax
140249d50:     	movq	%rax, 0x388(%rbp)
140249d57:     	leaq	0x5705bb2(%rip), %rax   # 0x14594f910
140249d5e:     	movq	%rax, 0x390(%rbp)
140249d65:     	movq	$0x1, 0x20(%rsp)
140249d6e:     	leaq	0x5705bbb(%rip), %rdx   # 0x14594f930
140249d75:     	leaq	-0x40(%rbp), %rcx
140249d79:     	leaq	0x378(%rbp), %r9
140249d80:     	movl	$0xb, %r8d
140249d86:     	callq	0x145457c60 <.text+0x5456c60>
140249d8b:     	cmpb	$0x1, (%r13)
140249d90:     	jne	0x140249db3 <.text+0x248db3>
140249d92:     	movl	0x1(%r13), %eax
140249d96:     	movl	0x4(%r13), %ecx
140249d9a:     	movl	%ecx, 0x3ab(%rbp)
140249da0:     	movl	%eax, 0x3a8(%rbp)
140249da6:     	movq	0x8(%r13), %rax
140249daa:     	movzbl	0x10(%r13), %edx
140249daf:     	movb	$0x1, %cl
140249db1:     	jmp	0x140249dc3 <.text+0x248dc3>
140249db3:     	movq	0x8(%r13), %rax
140249db7:     	lock
140249db8:     	incq	(%rax)
140249dbb:     	jle	0x14024ac73 <.text+0x249c73>
140249dc1:     	xorl	%ecx, %ecx
140249dc3:     	movq	-0x30(%rbp), %r8
140249dc7:     	movq	%r8, 0x178(%rbp)
140249dce:     	movups	-0x40(%rbp), %xmm0
140249dd2:     	movups	%xmm0, 0x168(%rbp)
140249dd9:     	movl	0x3a8(%rbp), %r8d
140249de0:     	movl	0x3ab(%rbp), %r9d
140249de7:     	movl	%r8d, 0x199(%rbp)
140249dee:     	movl	%r9d, 0x19c(%rbp)
140249df5:     	movups	0x57059b0(%rip), %xmm0  # 0x14594f7ac
140249dfc:     	movups	%xmm0, 0x359(%rbp)
140249e03:     	movl	$0x3f800000, 0x369(%rbp) # imm = 0x3F800000
140249e0d:     	movq	(%r15), %r8
140249e10:     	movq	$0x0, 0x180(%rbp)
140249e1b:     	movq	$0x4, 0x188(%rbp)
140249e26:     	movq	$0x0, 0x190(%rbp)
140249e31:     	movb	%cl, 0x198(%rbp)
140249e37:     	movq	%rax, 0x1a0(%rbp)
140249e3e:     	movq	%rdx, 0x1a8(%rbp)
140249e45:     	movl	$0x41600000, 0x1b0(%rbp) # imm = 0x41600000
140249e4f:     	movw	$0x190, 0x1b4(%rbp)     # imm = 0x190
140249e58:     	movb	$0x1, 0x1b6(%rbp)
140249e5f:     	movups	0x358(%rbp), %xmm0
140249e66:     	movups	%xmm0, 0x1b7(%rbp)
140249e6d:     	movq	0x365(%rbp), %rax
140249e74:     	movq	%rax, 0x1c4(%rbp)
140249e7b:     	movups	0x56cf2ee(%rip), %xmm0  # 0x145919170
140249e82:     	movups	%xmm0, 0x1cc(%rbp)
140249e89:     	movl	0x56cf2f1(%rip), %eax   # 0x145919180
140249e8f:     	movl	%eax, 0x1dc(%rbp)
140249e95:     	movsd	0x56cb933(%rip), %xmm0  # 0x1459157d0
140249e9d:     	movsd	%xmm0, 0x1e0(%rbp)
140249ea5:     	movq	%r8, 0x160(%rbp)
140249eac:     	leaq	0x5701d35(%rip), %r9    # 0x14594bbe8
140249eb3:     	leaq	-0x40(%rbp), %rcx
140249eb7:     	leaq	0x160(%rbp), %r8
140249ebe:     	leaq	0x8(%r15), %rdx
140249ec2:     	callq	0x1400dbfa0 <.text+0xdafa0>
140249ec7:     	leaq	0x160(%rbp), %rcx
140249ece:     	movq	%rdi, %rdx
140249ed1:     	callq	0x14546d160 <.text+0x546c160>
140249ed6:     	movq	0x160(%rbp), %r12
140249edd:     	movq	0x168(%rbp), %r14
140249ee4:     	movq	0x170(%rbp), %rax
140249eeb:     	leaq	(%rax,%rax,2), %rcx
140249eef:     	leaq	(%r14,%rcx,8), %rbx
140249ef3:     	movq	%r14, 0x358(%rbp)
140249efa:     	movq	%r12, 0x368(%rbp)
140249f01:     	movq	%rbx, 0x370(%rbp)
140249f08:     	movq	%r14, %r8
140249f0b:     	testq	%rax, %rax
140249f0e:     	movups	0x570565a(%rip), %xmm15 # 0x14594f570
140249f16:     	movq	%r13, 0x3e0(%rbp)
140249f1d:     	je	0x14024a191 <.text+0x249191>
140249f23:     	movq	%r12, 0x158(%rbp)
140249f2a:     	movzbl	(%r13), %eax
140249f2f:     	movb	%al, 0x3e8(%rbp)
140249f35:     	movq	%r13, %rax
140249f38:     	movq	0x8(%r13), %r13
140249f3c:     	leaq	0x1(%rax), %rcx
140249f40:     	movq	%rcx, 0x400(%rbp)
140249f47:     	movzbl	0x10(%rax), %r12d
140249f4c:     	leaq	0x139(%rbp), %rdi
140249f53:     	leaq	0x199(%rbp), %rsi
140249f5a:     	movq	%r14, 0x3f8(%rbp)
140249f61:     	leaq	0x18(%r14), %r8
140249f65:     	leaq	-0x40(%rbp), %r14
140249f69:     	movsd	0x56cb85f(%rip), %xmm7  # 0x1459157d0
140249f71:     	jmp	0x140249f9c <.text+0x248f9c>
140249f73:     	nopw	%cs:(%rax,%rax)
140249f80:     	movq	0x3d8(%rbp), %r8
140249f87:     	leaq	-0x18(%r8), %rax
140249f8b:     	addq	$0x18, %r8
140249f8f:     	addq	$0x18, %rax
140249f93:     	cmpq	%rbx, %rax
140249f96:     	je	0x14024a1e8 <.text+0x2491e8>
140249f9c:     	movq	-0x18(%r8), %rax
140249fa0:     	movups	-0x10(%r8), %xmm0
140249fa5:     	movaps	%xmm0, 0x120(%rbp)
140249fac:     	cmpq	$-0x1, %rax
140249fb0:     	je	0x14024a175 <.text+0x249175>
140249fb6:     	movq	%r8, 0x3d8(%rbp)
140249fbd:     	movq	%rax, 0x3a8(%rbp)
140249fc4:     	movaps	0x120(%rbp), %xmm0
140249fcb:     	leaq	0x3b0(%rbp), %rax
140249fd2:     	movups	%xmm0, (%rax)
140249fd5:     	leaq	0x57059dc(%rip), %rax   # 0x14594f9b8
140249fdc:     	movq	%rax, 0x378(%rbp)
140249fe3:     	movq	$0x4, 0x380(%rbp)
140249fee:     	leaq	0x3a8(%rbp), %rax
140249ff5:     	movq	%rax, 0x388(%rbp)
140249ffc:     	leaq	0x5705995(%rip), %rax   # 0x14594f998
14024a003:     	movq	%rax, 0x390(%rbp)
14024a00a:     	movq	$0x1, 0x20(%rsp)
14024a013:     	movl	$0xa, %r8d
14024a019:     	movq	%r14, %rcx
14024a01c:     	leaq	0x5705999(%rip), %rdx   # 0x14594f9bc
14024a023:     	leaq	0x378(%rbp), %r9
14024a02a:     	callq	0x145457c60 <.text+0x5456c60>
14024a02f:     	nop
14024a030:     	cmpb	$0x0, 0x3e8(%rbp)
14024a037:     	je	0x14024a060 <.text+0x249060>
14024a039:     	movq	0x400(%rbp), %rcx
14024a040:     	movl	(%rcx), %eax
14024a042:     	movl	0x3(%rcx), %ecx
14024a045:     	movl	%ecx, 0x3c3(%rbp)
14024a04b:     	movl	%eax, 0x3c0(%rbp)
14024a051:     	movb	$0x1, %al
14024a053:     	jmp	0x14024a06d <.text+0x24906d>
14024a055:     	nopw	%cs:(%rax,%rax)
14024a060:     	lock
14024a061:     	incq	(%r13)
14024a065:     	jle	0x14024ac73 <.text+0x249c73>
14024a06b:     	xorl	%eax, %eax
14024a06d:     	movq	-0x30(%rbp), %rcx
14024a071:     	leaq	0x168(%rbp), %rdx
14024a078:     	movq	%rcx, 0x10(%rdx)
14024a07c:     	movups	-0x40(%rbp), %xmm0
14024a080:     	movups	%xmm0, (%rdx)
14024a083:     	movl	0x3c0(%rbp), %ecx
14024a089:     	movl	0x3c3(%rbp), %edx
14024a08f:     	movl	%edx, 0x3(%rsi)
14024a092:     	movl	%ecx, (%rsi)
14024a094:     	movups	0x570592d(%rip), %xmm0  # 0x14594f9c8
14024a09b:     	movups	%xmm0, (%rdi)
14024a09e:     	movl	$0x3f800000, 0x10(%rdi) # imm = 0x3F800000
14024a0a5:     	movq	(%r15), %rcx
14024a0a8:     	movq	$0x0, 0x180(%rbp)
14024a0b3:     	movq	$0x4, 0x188(%rbp)
14024a0be:     	movq	$0x0, 0x190(%rbp)
14024a0c9:     	movb	%al, 0x198(%rbp)
14024a0cf:     	movq	%r13, 0x1a0(%rbp)
14024a0d6:     	movq	%r12, 0x1a8(%rbp)
14024a0dd:     	movl	$0x41500000, 0x1b0(%rbp) # imm = 0x41500000
14024a0e7:     	movw	$0x190, 0x1b4(%rbp)     # imm = 0x190
14024a0f0:     	movb	$0x1, 0x1b6(%rbp)
14024a0f7:     	movq	0x145(%rbp), %rax
14024a0fe:     	movq	%rax, 0x2b(%rsi)
14024a102:     	movups	0x138(%rbp), %xmm0
14024a109:     	movups	%xmm0, 0x1e(%rsi)
14024a10d:     	movl	0x56cf06d(%rip), %eax   # 0x145919180
14024a113:     	movl	%eax, 0x43(%rsi)
14024a116:     	movups	0x56cf053(%rip), %xmm0  # 0x145919170
14024a11d:     	movups	%xmm0, 0x33(%rsi)
14024a121:     	movsd	%xmm7, 0x1e0(%rbp)
14024a129:     	movq	%rcx, 0x160(%rbp)
14024a130:     	movq	%r14, %rcx
14024a133:     	movq	0x408(%rbp), %rdx
14024a13a:     	leaq	0x160(%rbp), %r8
14024a141:     	leaq	0x5701aa0(%rip), %r9    # 0x14594bbe8
14024a148:     	callq	0x1400dbfa0 <.text+0xdafa0>
14024a14d:     	nop
14024a14e:     	movq	0x3a8(%rbp), %rdx
14024a155:     	testq	%rdx, %rdx
14024a158:     	je	0x140249f80 <.text+0x248f80>
14024a15e:     	movq	0x3b0(%rbp), %rcx
14024a165:     	movl	$0x1, %r8d
14024a16b:     	callq	0x1400021d0 <.text+0x11d0>
14024a170:     	jmp	0x140249f80 <.text+0x248f80>
14024a175:     	movq	0x3e0(%rbp), %r13
14024a17c:     	movq	0x530(%rbp), %rdi
14024a183:     	movq	0x3f8(%rbp), %r14
14024a18a:     	movq	0x158(%rbp), %r12
14024a191:     	movq	%rbx, %rax
14024a194:     	subq	%r8, %rax
14024a197:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
14024a1a1:     	mulq	%rcx
14024a1a4:     	movq	%r8, 0x360(%rbp)
14024a1ab:     	cmpq	%r8, %rbx
14024a1ae:     	je	0x14024a204 <.text+0x249204>
14024a1b0:     	movq	%rdx, %rsi
14024a1b3:     	shrq	$0x4, %rsi
14024a1b7:     	addq	$0x8, %r8
14024a1bb:     	jmp	0x14024a1c9 <.text+0x2491c9>
14024a1bd:     	nopl	(%rax)
14024a1c0:     	addq	$0x18, %r8
14024a1c4:     	decq	%rsi
14024a1c7:     	je	0x14024a204 <.text+0x249204>
14024a1c9:     	movq	-0x8(%r8), %rdx
14024a1cd:     	testq	%rdx, %rdx
14024a1d0:     	je	0x14024a1c0 <.text+0x2491c0>
14024a1d2:     	movq	(%r8), %rcx
14024a1d5:     	movq	%r8, %rbx
14024a1d8:     	movl	$0x1, %r8d
14024a1de:     	callq	0x1400021d0 <.text+0x11d0>
14024a1e3:     	movq	%rbx, %r8
14024a1e6:     	jmp	0x14024a1c0 <.text+0x2491c0>
14024a1e8:     	movq	0x3e0(%rbp), %r13
14024a1ef:     	movq	0x530(%rbp), %rdi
14024a1f6:     	movq	0x3f8(%rbp), %r14
14024a1fd:     	movq	0x158(%rbp), %r12
14024a204:     	testq	%r12, %r12
14024a207:     	je	0x14024a21f <.text+0x24921f>
14024a209:     	shlq	$0x3, %r12
14024a20d:     	leaq	(%r12,%r12,2), %rdx
14024a211:     	movl	$0x8, %r8d
14024a217:     	movq	%r14, %rcx
14024a21a:     	callq	0x1400021d0 <.text+0x11d0>
14024a21f:     	movq	0x38(%rdi), %rax
14024a223:     	testq	%rax, %rax
14024a226:     	je	0x14024a3a4 <.text+0x2493a4>
14024a22c:     	movq	0x40(%rdi), %rcx
14024a230:     	movq	%rax, 0x358(%rbp)
14024a237:     	movq	%rcx, 0x360(%rbp)
14024a23e:     	leaq	0x358(%rbp), %rax
14024a245:     	movq	%rax, 0x160(%rbp)
14024a24c:     	leaq	-0x248193(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14024a253:     	movq	%rax, 0x168(%rbp)
14024a25a:     	leaq	0x57056da(%rip), %rdx   # 0x14594f93b
14024a261:     	leaq	-0x58(%rbp), %rcx
14024a265:     	leaq	0x160(%rbp), %r8
14024a26c:     	callq	0x145728390 <.text+0x5727390>
14024a271:     	cmpb	$0x1, (%r13)
14024a276:     	jne	0x14024a293 <.text+0x249293>
14024a278:     	movl	0x1(%r13), %eax
14024a27c:     	movl	0x4(%r13), %ecx
14024a280:     	movl	%ecx, -0x3d(%rbp)
14024a283:     	movl	%eax, -0x40(%rbp)
14024a286:     	movq	0x8(%r13), %rax
14024a28a:     	movzbl	0x10(%r13), %r10d
14024a28f:     	movb	$0x1, %cl
14024a291:     	jmp	0x14024a2a3 <.text+0x2492a3>
14024a293:     	movq	0x8(%r13), %rax
14024a297:     	lock
14024a298:     	incq	(%rax)
14024a29b:     	jle	0x14024ac73 <.text+0x249c73>
14024a2a1:     	xorl	%ecx, %ecx
14024a2a3:     	movq	0x408(%rbp), %rdx
14024a2aa:     	movq	-0x48(%rbp), %r8
14024a2ae:     	movq	%r8, 0x178(%rbp)
14024a2b5:     	movups	-0x58(%rbp), %xmm0
14024a2b9:     	movups	%xmm0, 0x168(%rbp)
14024a2c0:     	movl	-0x40(%rbp), %r8d
14024a2c4:     	movl	-0x3d(%rbp), %r9d
14024a2c8:     	movl	%r8d, 0x199(%rbp)
14024a2cf:     	movl	%r9d, 0x19c(%rbp)
14024a2d6:     	movups	0x5705667(%rip), %xmm0  # 0x14594f944
14024a2dd:     	movups	%xmm0, 0x379(%rbp)
14024a2e4:     	movl	$0x3f800000, 0x389(%rbp) # imm = 0x3F800000
14024a2ee:     	movq	(%r15), %r8
14024a2f1:     	movq	$0x0, 0x180(%rbp)
14024a2fc:     	movq	$0x4, 0x188(%rbp)
14024a307:     	movq	$0x0, 0x190(%rbp)
14024a312:     	movb	%cl, 0x198(%rbp)
14024a318:     	movq	%rax, 0x1a0(%rbp)
14024a31f:     	movq	%r10, 0x1a8(%rbp)
14024a326:     	movl	$0x41300000, 0x1b0(%rbp) # imm = 0x41300000
14024a330:     	movw	$0x190, 0x1b4(%rbp)     # imm = 0x190
14024a339:     	movb	$0x1, 0x1b6(%rbp)
14024a340:     	movups	0x378(%rbp), %xmm0
14024a347:     	movups	%xmm0, 0x1b7(%rbp)
14024a34e:     	movq	0x385(%rbp), %rax
14024a355:     	movq	%rax, 0x1c4(%rbp)
14024a35c:     	movups	0x56cee0d(%rip), %xmm0  # 0x145919170
14024a363:     	movups	%xmm0, 0x1cc(%rbp)
14024a36a:     	movl	0x56cee10(%rip), %eax   # 0x145919180
14024a370:     	movl	%eax, 0x1dc(%rbp)
14024a376:     	movsd	0x56cb452(%rip), %xmm0  # 0x1459157d0
14024a37e:     	movsd	%xmm0, 0x1e0(%rbp)
14024a386:     	movq	%r8, 0x160(%rbp)
14024a38d:     	leaq	0x5701854(%rip), %r9    # 0x14594bbe8
14024a394:     	leaq	-0x40(%rbp), %rcx
14024a398:     	leaq	0x160(%rbp), %r8
14024a39f:     	callq	0x1400dbfa0 <.text+0xdafa0>
14024a3a4:     	leaq	0x57055ad(%rip), %rcx   # 0x14594f958
14024a3ab:     	movl	$0x11, %edx
14024a3b0:     	callq	0x145457c00 <.text+0x5456c00>
14024a3b5:     	movq	%rdx, %rsi
14024a3b8:     	testq	%rdx, %rdx
14024a3bb:     	jns	0x14024a3cd <.text+0x2493cd>
14024a3bd:     	xorl	%r14d, %r14d
14024a3c0:     	movq	%r14, %rcx
14024a3c3:     	movq	%rsi, %rdx
14024a3c6:     	callq	0x14590379b <.text+0x590279b>
14024a3cb:     	ud2
14024a3cd:     	je	0x14024a431 <.text+0x249431>
14024a3cf:     	movq	%rax, %rbx
14024a3d2:     	callq	0x140002200 <.text+0x1200>
14024a3d7:     	movl	$0x1, %r14d
14024a3dd:     	movl	$0x1, %edx
14024a3e2:     	movq	%rsi, %rcx
14024a3e5:     	callq	0x1400021c0 <.text+0x11c0>
14024a3ea:     	testq	%rax, %rax
14024a3ed:     	je	0x14024a3c0 <.text+0x2493c0>
14024a3ef:     	movq	%rax, %rdi
14024a3f2:     	movq	%rax, %rcx
14024a3f5:     	movq	%rbx, %rdx
14024a3f8:     	movq	%rsi, %r8
14024a3fb:     	callq	0x1457731ed <.text+0x57721ed>
14024a400:     	movzbl	(%r13), %ecx
14024a405:     	cmpb	$0x1, %cl
14024a408:     	movb	%cl, 0x3f8(%rbp)
14024a40e:     	jne	0x14024a446 <.text+0x249446>
14024a410:     	movl	0x1(%r13), %eax
14024a414:     	movl	0x4(%r13), %ecx
14024a418:     	movl	%ecx, 0x3d3(%rbp)
14024a41e:     	movl	%eax, 0x3d0(%rbp)
14024a424:     	movq	0x8(%r13), %rax
14024a428:     	movzbl	0x10(%r13), %ecx
14024a42d:     	movb	$0x1, %dl
14024a42f:     	jmp	0x14024a456 <.text+0x249456>
14024a431:     	movl	$0x1, %edi
14024a436:     	movzbl	(%r13), %ecx
14024a43b:     	cmpb	$0x1, %cl
14024a43e:     	movb	%cl, 0x3f8(%rbp)
14024a444:     	je	0x14024a410 <.text+0x249410>
14024a446:     	movq	0x8(%r13), %rax
14024a44a:     	lock
14024a44b:     	incq	(%rax)
14024a44e:     	jle	0x14024ac73 <.text+0x249c73>
14024a454:     	xorl	%edx, %edx
14024a456:     	movups	0x5705327(%rip), %xmm0  # 0x14594f784
14024a45d:     	movups	%xmm0, 0x379(%rbp)
14024a464:     	movl	$0x3f800000, 0x389(%rbp) # imm = 0x3F800000
14024a46e:     	movq	%r15, 0x3e8(%rbp)
14024a475:     	movq	(%r15), %r8
14024a478:     	movq	%rsi, 0x168(%rbp)
14024a47f:     	movq	%rdi, 0x170(%rbp)
14024a486:     	movq	%rsi, 0x178(%rbp)
14024a48d:     	movq	$0x0, 0x180(%rbp)
14024a498:     	movq	$0x4, 0x188(%rbp)
14024a4a3:     	movq	$0x0, 0x190(%rbp)
14024a4ae:     	movb	%dl, 0x198(%rbp)
14024a4b4:     	movl	0x3d0(%rbp), %edx
14024a4ba:     	movl	0x3d3(%rbp), %r9d
14024a4c1:     	movl	%edx, 0x199(%rbp)
14024a4c7:     	movl	%r9d, 0x19c(%rbp)
14024a4ce:     	movq	%rax, 0x1a0(%rbp)
14024a4d5:     	movq	%rcx, 0x1a8(%rbp)
14024a4dc:     	movl	$0x41300000, 0x1b0(%rbp) # imm = 0x41300000
14024a4e6:     	movw	$0x190, 0x1b4(%rbp)     # imm = 0x190
14024a4ef:     	movb	$0x1, 0x1b6(%rbp)
14024a4f6:     	movups	0x378(%rbp), %xmm0
14024a4fd:     	movups	%xmm0, 0x1b7(%rbp)
14024a504:     	movq	0x385(%rbp), %rax
14024a50b:     	movq	%rax, 0x1c4(%rbp)
14024a512:     	movl	0x56cec68(%rip), %eax   # 0x145919180
14024a518:     	movl	%eax, 0x1dc(%rbp)
14024a51e:     	movups	0x56cec4a(%rip), %xmm13 # 0x145919170
14024a526:     	movups	%xmm13, 0x1cc(%rbp)
14024a52e:     	movsd	0x56cb299(%rip), %xmm14 # 0x1459157d0
14024a537:     	movsd	%xmm14, 0x1e0(%rbp)
14024a540:     	movq	%r8, 0x160(%rbp)
14024a547:     	leaq	0x570169a(%rip), %r9    # 0x14594bbe8
14024a54e:     	leaq	-0x40(%rbp), %r12
14024a552:     	leaq	0x160(%rbp), %r15
14024a559:     	movq	%r12, %rcx
14024a55c:     	movq	0x408(%rbp), %r13
14024a563:     	movq	%r13, %rdx
14024a566:     	movq	%r15, %r8
14024a569:     	callq	0x1400dbfa0 <.text+0xdafa0>
14024a56e:     	movq	0x150(%rbp), %rax
14024a575:     	movq	0x118(%rax), %rax
14024a57c:     	movzbl	0x38(%rax), %edx
14024a580:     	movq	0x118(%rbp), %rcx
14024a587:     	callq	0x145439bf0 <.text+0x5438bf0>
14024a58c:     	movq	%rax, 0x138(%rbp)
14024a593:     	leaq	0x160(%rbp), %rcx
14024a59a:     	movl	0x3f0(%rbp), %edx
14024a5a0:     	callq	0x1454711f0 <.text+0x54701f0>
14024a5a5:     	movq	0x160(%rbp), %rax
14024a5ac:     	movq	%rax, 0x400(%rbp)
14024a5b3:     	movq	0x168(%rbp), %rsi
14024a5ba:     	movq	0x170(%rbp), %rax
14024a5c1:     	leaq	(%rax,%rax,2), %rax
14024a5c5:     	leaq	(%rsi,%rax,8), %rax
14024a5c9:     	movq	%rax, 0x3d8(%rbp)
14024a5d0:     	movq	0x77ed2a9(%rip), %rcx   # 0x147a37880
14024a5d7:     	xorps	%xmm7, %xmm7
14024a5da:     	leaq	0x378(%rbp), %rdi
14024a5e1:     	movq	%rsi, 0x3f0(%rbp)
14024a5e8:     	cmpq	0x3d8(%rbp), %rsi
14024a5ef:     	je	0x14024a862 <.text+0x249862>
14024a5f5:     	nopw	%cs:(%rax,%rax)
14024a600:     	movq	(%rsi), %r14
14024a603:     	movq	0x8(%rsi), %rax
14024a607:     	movss	0x10(%rsi), %xmm0
14024a60c:     	movq	%r14, 0x3a8(%rbp)
14024a613:     	movq	%rax, 0x358(%rbp)
14024a61a:     	movss	%xmm0, 0x120(%rbp)
14024a622:     	movq	0x8(%rcx), %rdx
14024a626:     	cmpq	%rdx, %r14
14024a629:     	jae	0x14024ac63 <.text+0x249c63>
14024a62f:     	movq	(%rcx), %rbx
14024a632:     	movups	%xmm7, 0xa0(%r12)
14024a63b:     	movups	%xmm7, 0x90(%r12)
14024a644:     	movups	%xmm7, 0x80(%r12)
14024a64d:     	movups	%xmm7, 0x70(%r12)
14024a653:     	movups	%xmm7, 0x60(%r12)
14024a659:     	movq	$0x0, 0xb0(%r12)
14024a665:     	movw	$0x0, 0x184(%r15)
14024a66f:     	movl	$0x0, 0x180(%r15)
14024a67a:     	movups	%xmm11, 0xc8(%r12)
14024a683:     	movups	%xmm12, 0xb8(%r12)
14024a68c:     	movups	0x5704fad(%rip), %xmm0  # 0x14594f640
14024a693:     	movups	%xmm0, 0xe8(%r12)
14024a69c:     	movups	0x5704f8d(%rip), %xmm0  # 0x14594f630
14024a6a3:     	movups	%xmm0, 0xd8(%r12)
14024a6ac:     	movups	0x5704fad(%rip), %xmm0  # 0x14594f660
14024a6b3:     	movups	%xmm0, 0x108(%r12)
14024a6bc:     	movups	0x5704f8d(%rip), %xmm0  # 0x14594f650
14024a6c3:     	movups	%xmm0, 0xf8(%r12)
14024a6cc:     	movups	0x5704fad(%rip), %xmm0  # 0x14594f680
14024a6d3:     	movups	%xmm0, 0x128(%r12)
14024a6dc:     	movups	0x5704f8d(%rip), %xmm0  # 0x14594f670
14024a6e3:     	movups	%xmm0, 0x118(%r12)
14024a6ec:     	movaps	%xmm6, -0x40(%rbp)
14024a6f0:     	movq	$0x0, -0x30(%rbp)
14024a6f8:     	movups	%xmm15, 0x18(%r12)
14024a6fe:     	movq	$0x0, 0x28(%r12)
14024a707:     	movups	%xmm8, 0x30(%r12)
14024a70d:     	movq	$0x0, 0x40(%r12)
14024a716:     	movups	%xmm9, 0x48(%r12)
14024a71c:     	movq	$0x0, 0x58(%r12)
14024a725:     	movq	0x3e8(%rbp), %rax
14024a72c:     	movq	(%rax), %r13
14024a72f:     	movl	$0x138, %r8d            # imm = 0x138
14024a735:     	leaq	0x168(%rbp), %rcx
14024a73c:     	movq	%r12, %rdx
14024a73f:     	callq	0x1457731ed <.text+0x57721ed>
14024a744:     	movups	%xmm10, 0x2a0(%rbp)
14024a74c:     	movl	$0x1, 0x2b0(%rbp)
14024a756:     	movq	$0x0, 0x2b4(%rbp)
14024a761:     	movb	$0x1, 0x2bc(%rbp)
14024a768:     	movq	$0x0, 0x2c0(%rbp)
14024a773:     	movl	$0x3f800000, 0x2c8(%rbp) # imm = 0x3F800000
14024a77d:     	movw	$0x0, 0x2cc(%rbp)
14024a786:     	movl	$0x10000, 0x16e(%r15)   # imm = 0x10000
14024a791:     	movw	$0x0, 0x172(%r15)
14024a79b:     	movw	$0x0, 0x178(%r15)
14024a7a5:     	movl	$0x10000, 0x174(%r15)   # imm = 0x10000
14024a7b0:     	movl	$0x0, 0x2da(%rbp)
14024a7ba:     	movw	$0x1, 0x2de(%rbp)
14024a7c3:     	movq	%r13, 0x160(%rbp)
14024a7ca:     	movq	%rdi, %rcx
14024a7cd:     	movq	0x408(%rbp), %r13
14024a7d4:     	movq	%r13, %rdx
14024a7d7:     	movq	%r15, %r8
14024a7da:     	leaq	0x5701407(%rip), %r9    # 0x14594bbe8
14024a7e1:     	callq	0x1400d7270 <.text+0xd6270>
14024a7e6:     	nop
14024a7e7:     	imulq	$0xf0, %r14, %rax
14024a7ee:     	addq	%rax, %rbx
14024a7f1:     	movq	0x3e0(%rbp), %rax
14024a7f8:     	movq	%rax, 0x160(%rbp)
14024a7ff:     	movq	%rbx, 0x168(%rbp)
14024a806:     	leaq	0x358(%rbp), %rax
14024a80d:     	movq	%rax, 0x170(%rbp)
14024a814:     	leaq	0x120(%rbp), %rax
14024a81b:     	movq	%rax, 0x178(%rbp)
14024a822:     	leaq	0x3a8(%rbp), %rax
14024a829:     	movq	%rax, 0x180(%rbp)
14024a830:     	leaq	0x138(%rbp), %rax
14024a837:     	movq	%rax, 0x188(%rbp)
14024a83e:     	movq	%rdi, %rcx
14024a841:     	movq	%r15, %rdx
14024a844:     	callq	0x14012b4d0 <.text+0x12a4d0>
14024a849:     	nop
14024a84a:     	addq	$0x18, %rsi
14024a84e:     	movq	0x77ed02b(%rip), %rcx   # 0x147a37880
14024a855:     	cmpq	0x3d8(%rbp), %rsi
14024a85c:     	jne	0x14024a600 <.text+0x249600>
14024a862:     	movq	0x400(%rbp), %rax
14024a869:     	testq	%rax, %rax
14024a86c:     	je	0x14024a888 <.text+0x249888>
14024a86e:     	shlq	$0x3, %rax
14024a872:     	leaq	(%rax,%rax,2), %rdx
14024a876:     	movl	$0x8, %r8d
14024a87c:     	movq	0x3f0(%rbp), %rcx
14024a883:     	callq	0x1400021d0 <.text+0x11d0>
14024a888:     	cmpb	$0x0, 0x417(%rbp)
14024a88f:     	movq	0x3e8(%rbp), %r15
14024a896:     	movq	0x3e0(%rbp), %r12
14024a89d:     	je	0x14024ac01 <.text+0x249c01>
14024a8a3:     	xorps	%xmm0, %xmm0
14024a8a6:     	movaps	%xmm0, 0x60(%rbp)
14024a8aa:     	movaps	%xmm0, 0x50(%rbp)
14024a8ae:     	movaps	%xmm0, 0x40(%rbp)
14024a8b2:     	movaps	%xmm0, 0x30(%rbp)
14024a8b6:     	movaps	%xmm0, 0x20(%rbp)
14024a8ba:     	movq	$0x0, 0x70(%rbp)
14024a8c2:     	movw	$0x0, 0x2e4(%rbp)
14024a8cb:     	movl	$0x0, 0x2e0(%rbp)
14024a8d5:     	movaps	%xmm6, -0x40(%rbp)
14024a8d9:     	movq	$0x0, -0x30(%rbp)
14024a8e1:     	movups	%xmm15, -0x28(%rbp)
14024a8e6:     	movq	$0x0, -0x18(%rbp)
14024a8ee:     	movaps	%xmm8, -0x10(%rbp)
14024a8f3:     	movq	$0x0, (%rbp)
14024a8fb:     	movups	%xmm9, 0x8(%rbp)
14024a900:     	movq	$0x0, 0x18(%rbp)
14024a908:     	movq	(%r15), %rsi
14024a90b:     	leaq	0x168(%rbp), %rcx
14024a912:     	leaq	-0x40(%rbp), %rdx
14024a916:     	movl	$0xb8, %r8d
14024a91c:     	callq	0x1457731ed <.text+0x57721ed>
14024a921:     	movaps	0x56cafd8(%rip), %xmm0  # 0x145915900
14024a928:     	movups	%xmm0, 0x220(%rbp)
14024a92f:     	movaps	0x56f560a(%rip), %xmm0  # 0x14593ff40
14024a936:     	movups	%xmm0, 0x230(%rbp)
14024a93d:     	movups	0x5704cec(%rip), %xmm0  # 0x14594f630
14024a944:     	movups	%xmm0, 0x240(%rbp)
14024a94b:     	movups	0x5704cee(%rip), %xmm0  # 0x14594f640
14024a952:     	movups	%xmm0, 0x250(%rbp)
14024a959:     	movups	0x5704cf0(%rip), %xmm0  # 0x14594f650
14024a960:     	movups	%xmm0, 0x260(%rbp)
14024a967:     	movups	0x5704cf2(%rip), %xmm0  # 0x14594f660
14024a96e:     	movups	%xmm0, 0x270(%rbp)
14024a975:     	movups	0x5704cf4(%rip), %xmm0  # 0x14594f670
14024a97c:     	movups	%xmm0, 0x280(%rbp)
14024a983:     	movups	0x5704cf6(%rip), %xmm0  # 0x14594f680
14024a98a:     	movups	%xmm0, 0x290(%rbp)
14024a991:     	movups	%xmm10, 0x2a0(%rbp)
14024a999:     	movl	$0x1, 0x2b0(%rbp)
14024a9a3:     	movss	0x56caf29(%rip), %xmm0  # 0x1459158d4
14024a9ab:     	movlps	%xmm0, 0x2b4(%rbp)
14024a9b2:     	movb	$0x1, 0x2bc(%rbp)
14024a9b9:     	movq	$0x0, 0x2c0(%rbp)
14024a9c4:     	movl	$0x3f800000, 0x2c8(%rbp) # imm = 0x3F800000
14024a9ce:     	movw	$0x0, 0x2cc(%rbp)
14024a9d7:     	movw	$0x0, 0x2d2(%rbp)
14024a9e0:     	movl	$0x10000, 0x2ce(%rbp)   # imm = 0x10000
14024a9ea:     	movw	$0x0, 0x2d8(%rbp)
14024a9f3:     	movl	$0x10000, 0x2d4(%rbp)   # imm = 0x10000
14024a9fd:     	movw	$0x0, 0x2de(%rbp)
14024aa06:     	movl	$0x0, 0x2da(%rbp)
14024aa10:     	movq	%rsi, 0x160(%rbp)
14024aa17:     	leaq	0x57011ca(%rip), %r9    # 0x14594bbe8
14024aa1e:     	leaq	0x378(%rbp), %rsi
14024aa25:     	leaq	0x160(%rbp), %r8
14024aa2c:     	movq	%rsi, %rcx
14024aa2f:     	movq	%r13, %rdx
14024aa32:     	callq	0x1400d7270 <.text+0xd6270>
14024aa37:     	movq	0x150(%rbp), %rax
14024aa3e:     	movq	%rax, 0x160(%rbp)
14024aa45:     	movq	0x530(%rbp), %rax
14024aa4c:     	movq	%rax, 0x168(%rbp)
14024aa53:     	movq	%r12, 0x170(%rbp)
14024aa5a:     	leaq	0x160(%rbp), %rdx
14024aa61:     	movq	%rsi, %rcx
14024aa64:     	callq	0x14012b3f0 <.text+0x12a3f0>
14024aa69:     	leaq	0x5704ef9(%rip), %rcx   # 0x14594f969
14024aa70:     	movl	$0x11, %edx
14024aa75:     	callq	0x145457c00 <.text+0x5456c00>
14024aa7a:     	movq	%rdx, %rsi
14024aa7d:     	testq	%rdx, %rdx
14024aa80:     	js	0x14024a3bd <.text+0x2493bd>
14024aa86:     	je	0x14024aaeb <.text+0x249aeb>
14024aa88:     	movq	%rax, %rbx
14024aa8b:     	callq	0x140002200 <.text+0x1200>
14024aa90:     	movl	$0x1, %r14d
14024aa96:     	movl	$0x1, %edx
14024aa9b:     	movq	%rsi, %rcx
14024aa9e:     	callq	0x1400021c0 <.text+0x11c0>
14024aaa3:     	testq	%rax, %rax
14024aaa6:     	je	0x14024a3c0 <.text+0x2493c0>
14024aaac:     	movq	%rax, %rdi
14024aaaf:     	movq	%rax, %rcx
14024aab2:     	movq	%rbx, %rdx
14024aab5:     	movq	%rsi, %r8
14024aab8:     	callq	0x1457731ed <.text+0x57721ed>
14024aabd:     	cmpb	$0x0, 0x3f8(%rbp)
14024aac4:     	je	0x14024aaf9 <.text+0x249af9>
14024aac6:     	movl	0x1(%r12), %eax
14024aacb:     	movl	0x4(%r12), %ecx
14024aad0:     	movl	%ecx, 0x3cb(%rbp)
14024aad6:     	movl	%eax, 0x3c8(%rbp)
14024aadc:     	movq	0x8(%r12), %rax
14024aae1:     	movzbl	0x10(%r12), %ecx
14024aae7:     	movb	$0x1, %dl
14024aae9:     	jmp	0x14024ab0a <.text+0x249b0a>
14024aaeb:     	movl	$0x1, %edi
14024aaf0:     	cmpb	$0x0, 0x3f8(%rbp)
14024aaf7:     	jne	0x14024aac6 <.text+0x249ac6>
14024aaf9:     	movq	0x8(%r12), %rax
14024aafe:     	lock
14024aaff:     	incq	(%rax)
14024ab02:     	jle	0x14024ac73 <.text+0x249c73>
14024ab08:     	xorl	%edx, %edx
14024ab0a:     	movups	0x5704e33(%rip), %xmm0  # 0x14594f944
14024ab11:     	movups	%xmm0, 0x379(%rbp)
14024ab18:     	movl	$0x3f800000, 0x389(%rbp) # imm = 0x3F800000
14024ab22:     	movq	(%r15), %r8
14024ab25:     	movq	%rsi, 0x168(%rbp)
14024ab2c:     	movq	%rdi, 0x170(%rbp)
14024ab33:     	movq	%rsi, 0x178(%rbp)
14024ab3a:     	movq	$0x0, 0x180(%rbp)
14024ab45:     	movq	$0x4, 0x188(%rbp)
14024ab50:     	movq	$0x0, 0x190(%rbp)
14024ab5b:     	movb	%dl, 0x198(%rbp)
14024ab61:     	movl	0x3c8(%rbp), %edx
14024ab67:     	movl	0x3cb(%rbp), %r9d
14024ab6e:     	movl	%edx, 0x199(%rbp)
14024ab74:     	movl	%r9d, 0x19c(%rbp)
14024ab7b:     	movq	%rax, 0x1a0(%rbp)
14024ab82:     	movq	%rcx, 0x1a8(%rbp)
14024ab89:     	movl	$0x41300000, 0x1b0(%rbp) # imm = 0x41300000
14024ab93:     	movw	$0x190, 0x1b4(%rbp)     # imm = 0x190
14024ab9c:     	movb	$0x1, 0x1b6(%rbp)
14024aba3:     	movups	0x378(%rbp), %xmm0
14024abaa:     	movups	%xmm0, 0x1b7(%rbp)
14024abb1:     	movq	0x385(%rbp), %rax
14024abb8:     	movq	%rax, 0x1c4(%rbp)
14024abbf:     	movl	0x56ce5bb(%rip), %eax   # 0x145919180
14024abc5:     	movl	%eax, 0x1dc(%rbp)
14024abcb:     	movups	%xmm13, 0x1cc(%rbp)
14024abd3:     	movsd	%xmm14, 0x1e0(%rbp)
14024abdc:     	movq	%r8, 0x160(%rbp)
14024abe3:     	leaq	0x5700ffe(%rip), %r9    # 0x14594bbe8
14024abea:     	leaq	-0x40(%rbp), %rcx
14024abee:     	leaq	0x160(%rbp), %r8
14024abf5:     	movq	0x408(%rbp), %rdx
14024abfc:     	callq	0x1400dbfa0 <.text+0xdafa0>
14024ac01:     	movaps	0x420(%rbp), %xmm6
14024ac08:     	movaps	0x430(%rbp), %xmm7
14024ac0f:     	movaps	0x440(%rbp), %xmm8
14024ac17:     	movaps	0x450(%rbp), %xmm9
14024ac1f:     	movaps	0x460(%rbp), %xmm10
14024ac27:     	movaps	0x470(%rbp), %xmm11
14024ac2f:     	movaps	0x480(%rbp), %xmm12
14024ac37:     	movaps	0x490(%rbp), %xmm13
14024ac3f:     	movaps	0x4a0(%rbp), %xmm14
14024ac47:     	movaps	0x4b0(%rbp), %xmm15
14024ac4f:     	addq	$0x548, %rsp            # imm = 0x548
14024ac56:     	popq	%rbx
14024ac57:     	popq	%rdi
14024ac58:     	popq	%rsi
14024ac59:     	popq	%r12
14024ac5b:     	popq	%r13
14024ac5d:     	popq	%r14
14024ac5f:     	popq	%r15
14024ac61:     	popq	%rbp
14024ac62:     	retq
14024ac63:     	leaq	0x5704d16(%rip), %r8    # 0x14594f980
14024ac6a:     	movq	%r14, %rcx
14024ac6d:     	callq	0x145903b33 <.text+0x5902b33>
14024ac72:     	nop
14024ac73:     	ud2

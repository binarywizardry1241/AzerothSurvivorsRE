
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401f47e0:     	pushq	%rbp
1401f47e1:     	pushq	%r15
1401f47e3:     	pushq	%r14
1401f47e5:     	pushq	%r13
1401f47e7:     	pushq	%r12
1401f47e9:     	pushq	%rsi
1401f47ea:     	pushq	%rdi
1401f47eb:     	pushq	%rbx
1401f47ec:     	subq	$0x888, %rsp            # imm = 0x888
1401f47f3:     	leaq	0x80(%rsp), %rbp
1401f47fb:     	movaps	%xmm10, 0x7f0(%rbp)
1401f4803:     	movaps	%xmm9, 0x7e0(%rbp)
1401f480b:     	movaps	%xmm8, 0x7d0(%rbp)
1401f4813:     	movaps	%xmm7, 0x7c0(%rbp)
1401f481a:     	movaps	%xmm6, 0x7b0(%rbp)
1401f4821:     	movq	$-0x2, 0x7a8(%rbp)
1401f482c:     	movq	%r9, %r15
1401f482f:     	movq	%r8, %rsi
1401f4832:     	movq	%rdx, %r13
1401f4835:     	movq	%rcx, %r14
1401f4838:     	movq	0x878(%rbp), %rdi
1401f483f:     	leaq	0x5757f0a(%rip), %rcx   # 0x14594c750
1401f4846:     	movl	$0x6, %edx
1401f484b:     	movq	%rdi, %r8
1401f484e:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f4853:     	testq	%rax, %rax
1401f4856:     	jne	0x1401f485f <.text+0x1f385f>
1401f4858:     	movq	0x7818f59(%rip), %rax   # 0x147a0d7b8
1401f485f:     	movsd	0x5756979(%rip), %xmm0  # 0x14594b1e0
1401f4867:     	movaps	0x574b492(%rip), %xmm1  # 0x14593fd00
1401f486e:     	movaps	0x575697b(%rip), %xmm6  # 0x14594b1f0
1401f4875:     	movss	0x574b0ab(%rip), %xmm2  # 0x14593f928
1401f487d:     	movss	0x571eabf(%rip), %xmm7  # 0x145913344
1401f4885:     	movss	0x574b0a3(%rip), %xmm3  # 0x14593f930
1401f488d:     	cmpb	$0x2, (%rax)
1401f4890:     	jne	0x1401f489d <.text+0x1f389d>
1401f4892:     	cmpq	$0x0, 0x8(%rax)
1401f4897:     	je	0x1401f4992 <.text+0x1f3992>
1401f489d:     	xorl	%ebx, %ebx
1401f489f:     	movl	$0x0, 0x45c(%rbp)
1401f48a9:     	movlps	%xmm1, 0x460(%rbp)
1401f48b0:     	movss	%xmm3, 0x468(%rbp)
1401f48b8:     	movl	$0x3f800000, 0x46c(%rbp) # imm = 0x3F800000
1401f48c2:     	movl	$0x0, 0x274(%rbp)
1401f48cc:     	movlps	%xmm0, 0x278(%rbp)
1401f48d3:     	movss	%xmm2, 0x280(%rbp)
1401f48db:     	movl	$0x3f800000, 0x284(%rbp) # imm = 0x3F800000
1401f48e5:     	leaq	0x5757e8c(%rip), %rcx   # 0x14594c778
1401f48ec:     	movl	$0x4, %edx
1401f48f1:     	movq	%rdi, %r8
1401f48f4:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f48f9:     	testq	%rax, %rax
1401f48fc:     	jne	0x1401f4905 <.text+0x1f3905>
1401f48fe:     	movq	0x7818eb3(%rip), %rax   # 0x147a0d7b8
1401f4905:     	cmpb	$0x3, (%rax)
1401f4908:     	jne	0x1401f4920 <.text+0x1f3920>
1401f490a:     	movq	0x18(%rax), %rdx
1401f490e:     	testq	%rdx, %rdx
1401f4911:     	jns	0x1401f4a7e <.text+0x1f3a7e>
1401f4917:     	xorl	%ecx, %ecx
1401f4919:     	callq	0x14590379b <.text+0x590279b>
1401f491e:     	ud2
1401f4920:     	movl	$0x1, %eax
1401f4925:     	movq	%rax, 0x758(%rbp)
1401f492c:     	movq	$0x0, 0x778(%rbp)
1401f4937:     	movb	$0x1, 0x7a5(%rbp)
1401f493e:     	leaq	0x5757e37(%rip), %rcx   # 0x14594c77c
1401f4945:     	movl	$0x5, %edx
1401f494a:     	movq	%rdi, %r8
1401f494d:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f4952:     	nop
1401f4953:     	testq	%rax, %rax
1401f4956:     	jne	0x1401f495f <.text+0x1f395f>
1401f4958:     	movq	0x7818e59(%rip), %rax   # 0x147a0d7b8
1401f495f:     	movl	$0x1, %r12d
1401f4965:     	cmpb	$0x3, (%rax)
1401f4968:     	jne	0x1401f4b47 <.text+0x1f3b47>
1401f496e:     	movq	0x18(%rax), %r8
1401f4972:     	testq	%r8, %r8
1401f4975:     	jns	0x1401f4aee <.text+0x1f3aee>
1401f497b:     	xorl	%ecx, %ecx
1401f497d:     	movb	$0x1, 0x7a5(%rbp)
1401f4984:     	movq	%r8, %rdx
1401f4987:     	callq	0x14590379b <.text+0x590279b>
1401f498c:     	nop
1401f498d:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f4992:     	movq	0x10(%rax), %rcx
1401f4996:     	cmpq	$0x4, %rcx
1401f499a:     	movl	$0x4, %eax
1401f499f:     	cmovbq	%rcx, %rax
1401f49a3:     	decq	%rax
1401f49a6:     	cmpq	$0x3, %rax
1401f49aa:     	ja	0x1401f489d <.text+0x1f389d>
1401f49b0:     	leaq	0x5759b1d(%rip), %rcx   # 0x14594e4d4
1401f49b7:     	movslq	(%rcx,%rax,4), %rax
1401f49bb:     	addq	%rcx, %rax
1401f49be:     	jmpq	*%rax
1401f49c0:     	movsd	0x57568b8(%rip), %xmm0  # 0x14594b280
1401f49c8:     	movsd	0x574b360(%rip), %xmm1  # 0x14593fd30
1401f49d0:     	movsd	0x57568b8(%rip), %xmm6  # 0x14594b290
1401f49d8:     	movss	0x57568c0(%rip), %xmm2  # 0x14594b2a0
1401f49e0:     	xorps	%xmm3, %xmm3
1401f49e3:     	xorl	%ebx, %ebx
1401f49e5:     	xorps	%xmm7, %xmm7
1401f49e8:     	jmp	0x1401f489f <.text+0x1f389f>
1401f49ed:     	movsd	0x575683b(%rip), %xmm0  # 0x14594b230
1401f49f5:     	movsd	0x574b313(%rip), %xmm1  # 0x14593fd10
1401f49fd:     	movsd	0x575683b(%rip), %xmm6  # 0x14594b240
1401f4a05:     	movss	0x571e933(%rip), %xmm2  # 0x145913340
1401f4a0d:     	movss	0x575683b(%rip), %xmm7  # 0x14594b250
1401f4a15:     	jmp	0x1401f4a71 <.text+0x1f3a71>
1401f4a17:     	movsd	0x57567e1(%rip), %xmm0  # 0x14594b200
1401f4a1f:     	movsd	0x574aee9(%rip), %xmm1  # 0x14593f910
1401f4a27:     	movsd	0x57567e1(%rip), %xmm6  # 0x14594b210
1401f4a2f:     	movss	0x57567e9(%rip), %xmm2  # 0x14594b220
1401f4a37:     	xorps	%xmm7, %xmm7
1401f4a3a:     	movss	0x574aede(%rip), %xmm3  # 0x14593f920
1401f4a42:     	movb	$0x1, %bl
1401f4a44:     	jmp	0x1401f489f <.text+0x1f389f>
1401f4a49:     	movsd	0x575680f(%rip), %xmm0  # 0x14594b260
1401f4a51:     	movsd	0x574b2c7(%rip), %xmm1  # 0x14593fd20
1401f4a59:     	movsd	0x575680f(%rip), %xmm6  # 0x14594b270
1401f4a61:     	movss	0x5712ab3(%rip), %xmm2  # 0x14590751c
1401f4a69:     	movss	0x574b56f(%rip), %xmm7  # 0x14593ffe0
1401f4a71:     	movss	0x5712a17(%rip), %xmm3  # 0x145907490
1401f4a79:     	jmp	0x1401f489d <.text+0x1f389d>
1401f4a7e:     	movl	$0x1, %ecx
1401f4a83:     	movq	%rcx, 0x758(%rbp)
1401f4a8a:     	movq	%rdx, 0x778(%rbp)
1401f4a91:     	je	0x1401f492c <.text+0x1f392c>
1401f4a97:     	movq	0x10(%rax), %rax
1401f4a9b:     	movq	%rax, 0x790(%rbp)
1401f4aa2:     	callq	0x140002200 <.text+0x1200>
1401f4aa7:     	movl	$0x1, %edx
1401f4aac:     	movq	0x778(%rbp), %r12
1401f4ab3:     	movq	%r12, %rcx
1401f4ab6:     	callq	0x1400021c0 <.text+0x11c0>
1401f4abb:     	movq	%r12, %rdx
1401f4abe:     	movl	$0x1, %ecx
1401f4ac3:     	movq	%rax, 0x758(%rbp)
1401f4aca:     	testq	%rax, %rax
1401f4acd:     	je	0x1401f4919 <.text+0x1f3919>
1401f4ad3:     	movq	0x758(%rbp), %rcx
1401f4ada:     	movq	%rdx, %r8
1401f4add:     	movq	0x790(%rbp), %rdx
1401f4ae4:     	callq	0x1457731ed <.text+0x57721ed>
1401f4ae9:     	jmp	0x1401f4937 <.text+0x1f3937>
1401f4aee:     	movq	%r8, 0x790(%rbp)
1401f4af5:     	je	0x1401f4b47 <.text+0x1f3b47>
1401f4af7:     	movq	0x10(%rax), %rax
1401f4afb:     	movq	%rax, 0x768(%rbp)
1401f4b02:     	callq	0x140002200 <.text+0x1200>
1401f4b07:     	movl	$0x1, %edx
1401f4b0c:     	movq	0x790(%rbp), %r12
1401f4b13:     	movq	%r12, %rcx
1401f4b16:     	callq	0x1400021c0 <.text+0x11c0>
1401f4b1b:     	movq	%r12, %r8
1401f4b1e:     	movl	$0x1, %ecx
1401f4b23:     	testq	%rax, %rax
1401f4b26:     	je	0x1401f497d <.text+0x1f397d>
1401f4b2c:     	movq	%rax, %r12
1401f4b2f:     	movq	%rax, %rcx
1401f4b32:     	movq	0x768(%rbp), %rdx
1401f4b39:     	callq	0x1457731ed <.text+0x57721ed>
1401f4b3e:     	movq	0x790(%rbp), %rax
1401f4b45:     	jmp	0x1401f4b49 <.text+0x1f3b49>
1401f4b47:     	xorl	%eax, %eax
1401f4b49:     	movq	%rax, 0x790(%rbp)
1401f4b50:     	movq	$0x0, 0x490(%rbp)
1401f4b5b:     	movq	%rax, 0x498(%rbp)
1401f4b62:     	movq	%r12, 0x768(%rbp)
1401f4b69:     	movq	%r12, 0x4a0(%rbp)
1401f4b70:     	movq	%rax, 0x4a8(%rbp)
1401f4b77:     	movq	$0x0, 0x4b0(%rbp)
1401f4b82:     	movq	%rax, 0x4b8(%rbp)
1401f4b89:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1401f4b93:     	movq	%rax, 0x4c0(%rbp)
1401f4b9a:     	movb	$0x1, 0x4c8(%rbp)
1401f4ba1:     	movw	$0x1, 0x4d0(%rbp)
1401f4baa:     	leaq	0x720(%rbp), %rcx
1401f4bb1:     	leaq	0x490(%rbp), %rdx
1401f4bb8:     	callq	0x1401a9b90 <.text+0x1a8b90>
1401f4bbd:     	nop
1401f4bbe:     	movq	0x790(%rbp), %rdx
1401f4bc5:     	testq	%rdx, %rdx
1401f4bc8:     	je	0x1401f4bdc <.text+0x1f3bdc>
1401f4bca:     	movl	$0x1, %r8d
1401f4bd0:     	movq	0x768(%rbp), %rcx
1401f4bd7:     	callq	0x1400021d0 <.text+0x11d0>
1401f4bdc:     	movb	$0x1, 0x7a4(%rbp)
1401f4be3:     	movb	$0x1, 0x7a3(%rbp)
1401f4bea:     	leaq	0x5757b90(%rip), %r12   # 0x14594c781
1401f4bf1:     	movl	$0x4, %edx
1401f4bf6:     	movq	%r12, %rcx
1401f4bf9:     	movq	%rdi, %r8
1401f4bfc:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f4c01:     	nop
1401f4c02:     	testq	%rax, %rax
1401f4c05:     	jne	0x1401f4c0e <.text+0x1f3c0e>
1401f4c07:     	movq	0x7818baa(%rip), %rax   # 0x147a0d7b8
1401f4c0e:     	cmpb	$0x3, (%rax)
1401f4c11:     	jne	0x1401f4cbf <.text+0x1f3cbf>
1401f4c17:     	movq	0x18(%rax), %r8
1401f4c1b:     	testq	%r8, %r8
1401f4c1e:     	jns	0x1401f4c3e <.text+0x1f3c3e>
1401f4c20:     	xorl	%ecx, %ecx
1401f4c22:     	movb	$0x1, 0x7a4(%rbp)
1401f4c29:     	movb	$0x1, 0x7a3(%rbp)
1401f4c30:     	movq	%r8, %rdx
1401f4c33:     	callq	0x14590379b <.text+0x590279b>
1401f4c38:     	nop
1401f4c39:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f4c3e:     	movq	%r8, 0x790(%rbp)
1401f4c45:     	je	0x1401f4cbf <.text+0x1f3cbf>
1401f4c47:     	movq	%r13, 0x780(%rbp)
1401f4c4e:     	movq	%rsi, 0x748(%rbp)
1401f4c55:     	movq	0x10(%rax), %rsi
1401f4c59:     	callq	0x140002200 <.text+0x1200>
1401f4c5e:     	movl	$0x1, %edx
1401f4c63:     	movq	0x790(%rbp), %r13
1401f4c6a:     	movq	%r13, %rcx
1401f4c6d:     	callq	0x1400021c0 <.text+0x11c0>
1401f4c72:     	movq	%r13, %r8
1401f4c75:     	movl	$0x1, %ecx
1401f4c7a:     	movq	%rax, 0x750(%rbp)
1401f4c81:     	testq	%rax, %rax
1401f4c84:     	je	0x1401f4c22 <.text+0x1f3c22>
1401f4c86:     	movq	0x750(%rbp), %r13
1401f4c8d:     	movq	%r13, %rcx
1401f4c90:     	movq	%rsi, %rdx
1401f4c93:     	movq	%r8, %rsi
1401f4c96:     	callq	0x1457731ed <.text+0x57721ed>
1401f4c9b:     	movl	$0x0, 0x768(%rbp)
1401f4ca5:     	movq	%rsi, 0x798(%rbp)
1401f4cac:     	movq	%r13, 0x788(%rbp)
1401f4cb3:     	movq	0x748(%rbp), %rsi
1401f4cba:     	jmp	0x1401f7539 <.text+0x1f6539>
1401f4cbf:     	movq	$0x1, 0x740(%rbp)
1401f4cca:     	movq	$0x0, 0x738(%rbp)
1401f4cd5:     	movb	$0x1, 0x7a2(%rbp)
1401f4cdc:     	movb	$0x1, 0x7a1(%rbp)
1401f4ce3:     	movb	$0x1, 0x7a0(%rbp)
1401f4cea:     	leaq	0x5757a94(%rip), %rcx   # 0x14594c785
1401f4cf1:     	movl	$0x5, %edx
1401f4cf6:     	movq	%rdi, %r8
1401f4cf9:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f4cfe:     	nop
1401f4cff:     	testq	%rax, %rax
1401f4d02:     	jne	0x1401f4d0b <.text+0x1f3d0b>
1401f4d04:     	movq	0x7818aad(%rip), %rax   # 0x147a0d7b8
1401f4d0b:     	cmpb	$0x3, (%rax)
1401f4d0e:     	jne	0x1401f4d55 <.text+0x1f3d55>
1401f4d10:     	movq	0x18(%rax), %rdx
1401f4d14:     	testq	%rdx, %rdx
1401f4d17:     	jns	0x1401f7413 <.text+0x1f6413>
1401f4d1d:     	xorl	%ecx, %ecx
1401f4d1f:     	movq	$0x1, 0x740(%rbp)
1401f4d2a:     	movq	$0x0, 0x738(%rbp)
1401f4d35:     	movb	$0x1, 0x7a2(%rbp)
1401f4d3c:     	movb	$0x1, 0x7a1(%rbp)
1401f4d43:     	movb	$0x1, 0x7a0(%rbp)
1401f4d4a:     	callq	0x14590379b <.text+0x590279b>
1401f4d4f:     	nop
1401f4d50:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f4d55:     	movl	$0x1, %eax
1401f4d5a:     	movq	%rax, 0x750(%rbp)
1401f4d61:     	movb	$0x1, %al
1401f4d63:     	movl	%eax, 0x768(%rbp)
1401f4d69:     	movq	$0x0, 0x790(%rbp)
1401f4d74:     	movq	$0x0, 0x798(%rbp)
1401f4d7f:     	movl	$0x1, %eax
1401f4d84:     	movq	%rax, 0x788(%rbp)
1401f4d8b:     	movq	$0x0, 0x290(%rbp)
1401f4d96:     	movq	$0x8, 0x298(%rbp)
1401f4da1:     	movq	$0x0, 0x2a0(%rbp)
1401f4dac:     	leaq	0x57579d7(%rip), %rcx   # 0x14594c78a
1401f4db3:     	movl	$0x4, %edx
1401f4db8:     	movq	%rdi, %r8
1401f4dbb:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f4dc0:     	nop
1401f4dc1:     	movq	%r13, 0x780(%rbp)
1401f4dc8:     	testq	%rax, %rax
1401f4dcb:     	jne	0x1401f4dd4 <.text+0x1f3dd4>
1401f4dcd:     	movq	0x78189e4(%rip), %rax   # 0x147a0d7b8
1401f4dd4:     	movl	$0x1, %r13d
1401f4dda:     	cmpb	$0x3, (%rax)
1401f4ddd:     	jne	0x1401f4dfc <.text+0x1f3dfc>
1401f4ddf:     	movq	0x18(%rax), %rdx
1401f4de3:     	testq	%rdx, %rdx
1401f4de6:     	jns	0x1401f74a9 <.text+0x1f64a9>
1401f4dec:     	xorl	%esi, %esi
1401f4dee:     	movq	%rsi, %rcx
1401f4df1:     	callq	0x14590379b <.text+0x590279b>
1401f4df6:     	nop
1401f4df7:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f4dfc:     	movq	%rsi, 0x748(%rbp)
1401f4e03:     	xorl	%eax, %eax
1401f4e05:     	movq	0x798(%rbp), %rcx
1401f4e0c:     	movq	$0x0, 0x490(%rbp)
1401f4e17:     	movq	$0x1, 0x498(%rbp)
1401f4e22:     	movq	$0x0, 0x4a0(%rbp)
1401f4e2d:     	movb	$0x0, 0x590(%rbp)
1401f4e34:     	movq	%rcx, 0x4a8(%rbp)
1401f4e3b:     	movq	0x788(%rbp), %rdx
1401f4e42:     	movq	%rdx, 0x4b0(%rbp)
1401f4e49:     	movq	%rcx, 0x4b8(%rbp)
1401f4e50:     	movq	$0x0, 0x4c0(%rbp)
1401f4e5b:     	movq	$0x1, 0x4c8(%rbp)
1401f4e66:     	xorps	%xmm0, %xmm0
1401f4e69:     	movups	%xmm0, 0x4d0(%rbp)
1401f4e70:     	movq	$0x1, 0x4e0(%rbp)
1401f4e7b:     	movq	$0x0, 0x4e8(%rbp)
1401f4e86:     	movups	0x290(%rbp), %xmm0
1401f4e8d:     	movups	%xmm0, 0x4f0(%rbp)
1401f4e94:     	movq	0x2a0(%rbp), %rcx
1401f4e9b:     	movq	%rcx, 0x500(%rbp)
1401f4ea2:     	movq	$0x0, 0x508(%rbp)
1401f4ead:     	movq	$0x1, 0x510(%rbp)
1401f4eb8:     	movq	$0x0, 0x518(%rbp)
1401f4ec3:     	movq	%rax, 0x520(%rbp)
1401f4eca:     	movq	%r13, 0x528(%rbp)
1401f4ed1:     	movq	%rax, 0x530(%rbp)
1401f4ed8:     	movq	$-0x1, 0x538(%rbp)
1401f4ee3:     	movb	$0x1, 0x7a7(%rbp)
1401f4eea:     	movb	$0x1, 0x7a6(%rbp)
1401f4ef1:     	leaq	0x5757896(%rip), %rcx   # 0x14594c78e
1401f4ef8:     	movl	$0x4, %edx
1401f4efd:     	movq	%rdi, %r8
1401f4f00:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f4f05:     	nop
1401f4f06:     	movq	0x780(%rbp), %r13
1401f4f0d:     	testq	%rax, %rax
1401f4f10:     	jne	0x1401f4f19 <.text+0x1f3f19>
1401f4f12:     	movq	0x781889f(%rip), %rax   # 0x147a0d7b8
1401f4f19:     	cmpb	$0x3, (%rax)
1401f4f1c:     	jne	0x1401f50a5 <.text+0x1f40a5>
1401f4f22:     	movq	0x18(%rax), %rcx
1401f4f26:     	addq	$-0x3, %rcx
1401f4f2a:     	cmpq	$0x4, %rcx
1401f4f2e:     	ja	0x1401f50a5 <.text+0x1f40a5>
1401f4f34:     	movq	0x10(%rax), %rax
1401f4f38:     	leaq	0x57595a5(%rip), %rdx   # 0x14594e4e4
1401f4f3f:     	movslq	(%rdx,%rcx,4), %rcx
1401f4f43:     	addq	%rdx, %rcx
1401f4f46:     	jmpq	*%rcx
1401f4f48:     	movzwl	(%rax), %ecx
1401f4f4b:     	xorl	$0x656e, %ecx           # imm = 0x656E
1401f4f51:     	movzbl	0x2(%rax), %eax
1401f4f55:     	xorl	$0x77, %eax
1401f4f58:     	orw	%cx, %ax
1401f4f5b:     	jne	0x1401f50a5 <.text+0x1f40a5>
1401f4f61:     	movb	$0x1, 0x7a7(%rbp)
1401f4f68:     	movb	$0x1, 0x7a6(%rbp)
1401f4f6f:     	leaq	0x57579b6(%rip), %rcx   # 0x14594c92c
1401f4f76:     	movl	$0x3, %edx
1401f4f7b:     	callq	0x145457c00 <.text+0x5456c00>
1401f4f80:     	nop
1401f4f81:     	movq	%rdx, %r12
1401f4f84:     	testq	%rdx, %rdx
1401f4f87:     	jns	0x1401f5d31 <.text+0x1f4d31>
1401f4f8d:     	xorl	%r13d, %r13d
1401f4f90:     	movb	$0x1, 0x7a7(%rbp)
1401f4f97:     	movb	$0x1, 0x7a6(%rbp)
1401f4f9e:     	movq	%r13, %rcx
1401f4fa1:     	movq	%r12, %rdx
1401f4fa4:     	callq	0x14590379b <.text+0x590279b>
1401f4fa9:     	nop
1401f4faa:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f4faf:     	movl	$0x6c756d61, %ecx       # imm = 0x6C756D61
1401f4fb4:     	xorl	(%rax), %ecx
1401f4fb6:     	movzwl	0x4(%rax), %eax
1401f4fba:     	xorl	$0x7465, %eax           # imm = 0x7465
1401f4fbf:     	orl	%ecx, %eax
1401f4fc1:     	jne	0x1401f50a5 <.text+0x1f40a5>
1401f4fc7:     	movb	$0x1, 0x7a7(%rbp)
1401f4fce:     	movb	$0x1, 0x7a6(%rbp)
1401f4fd5:     	leaq	0x57577de(%rip), %rcx   # 0x14594c7ba
1401f4fdc:     	movl	$0x6, %edx
1401f4fe1:     	callq	0x145457c00 <.text+0x5456c00>
1401f4fe6:     	nop
1401f4fe7:     	movq	%rdx, %r15
1401f4fea:     	testq	%rdx, %rdx
1401f4fed:     	jns	0x1401f5ce6 <.text+0x1f4ce6>
1401f4ff3:     	xorl	%r13d, %r13d
1401f4ff6:     	movb	$0x1, 0x7a7(%rbp)
1401f4ffd:     	movb	$0x1, 0x7a6(%rbp)
1401f5004:     	movq	%r13, %rcx
1401f5007:     	movq	%r15, %rdx
1401f500a:     	callq	0x14590379b <.text+0x590279b>
1401f500f:     	nop
1401f5010:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f5015:     	cmpl	$0x676e6972, (%rax)     # imm = 0x676E6972
1401f501b:     	je	0x1401f5953 <.text+0x1f4953>
1401f5021:     	cmpl	$0x646c6f67, (%rax)     # imm = 0x646C6F67
1401f5027:     	jne	0x1401f50a5 <.text+0x1f40a5>
1401f5029:     	movb	$0x1, 0x7a7(%rbp)
1401f5030:     	movb	$0x1, 0x7a6(%rbp)
1401f5037:     	leaq	0x5757763(%rip), %rcx   # 0x14594c7a1
1401f503e:     	movl	$0x4, %edx
1401f5043:     	callq	0x145457c00 <.text+0x5456c00>
1401f5048:     	nop
1401f5049:     	movq	%rdx, %r15
1401f504c:     	testq	%rdx, %rdx
1401f504f:     	jns	0x1401f5dce <.text+0x1f4dce>
1401f5055:     	xorl	%r13d, %r13d
1401f5058:     	movb	$0x1, 0x7a7(%rbp)
1401f505f:     	movb	$0x1, 0x7a6(%rbp)
1401f5066:     	movq	%r13, %rcx
1401f5069:     	movq	%r15, %rdx
1401f506c:     	callq	0x14590379b <.text+0x590279b>
1401f5071:     	nop
1401f5072:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f5077:     	movl	$0x72677075, %ecx       # imm = 0x72677075
1401f507c:     	xorl	(%rax), %ecx
1401f507e:     	movl	$0x65646172, %edx       # imm = 0x65646172
1401f5083:     	xorl	0x3(%rax), %edx
1401f5086:     	orl	%ecx, %edx
1401f5088:     	je	0x1401f59ee <.text+0x1f49ee>
1401f508e:     	movl	$0x6e697274, %ecx       # imm = 0x6E697274
1401f5093:     	xorl	(%rax), %ecx
1401f5095:     	movl	$0x74656b6e, %edx       # imm = 0x74656B6E
1401f509a:     	xorl	0x3(%rax), %edx
1401f509d:     	orl	%ecx, %edx
1401f509f:     	je	0x1401f5953 <.text+0x1f4953>
1401f50a5:     	movq	0x4d8(%rbp), %rdx
1401f50ac:     	testq	%rdx, %rdx
1401f50af:     	je	0x1401f50c3 <.text+0x1f40c3>
1401f50b1:     	movq	0x4e0(%rbp), %rcx
1401f50b8:     	movl	$0x1, %r8d
1401f50be:     	callq	0x1400021d0 <.text+0x11d0>
1401f50c3:     	movq	0x778(%rbp), %rax
1401f50ca:     	movq	%rax, 0x4d8(%rbp)
1401f50d1:     	movq	0x758(%rbp), %rcx
1401f50d8:     	movq	%rcx, 0x4e0(%rbp)
1401f50df:     	movq	%rax, 0x4e8(%rbp)
1401f50e6:     	leaq	-0x30(%rbp), %rcx
1401f50ea:     	leaq	0x490(%rbp), %rdx
1401f50f1:     	movl	$0x108, %r8d            # imm = 0x108
1401f50f7:     	callq	0x1457731ed <.text+0x57721ed>
1401f50fc:     	movq	0x790(%rbp), %rdx
1401f5103:     	testq	%rdx, %rdx
1401f5106:     	setne	%al
1401f5109:     	testb	%al, 0x768(%rbp)
1401f510f:     	je	0x1401f5123 <.text+0x1f4123>
1401f5111:     	movl	$0x1, %r8d
1401f5117:     	movq	0x750(%rbp), %rcx
1401f511e:     	callq	0x1400021d0 <.text+0x11d0>
1401f5123:     	movq	0x728(%rbp), %r15
1401f512a:     	movq	0x730(%rbp), %rsi
1401f5131:     	testq	%rsi, %rsi
1401f5134:     	je	0x1401f5164 <.text+0x1f4164>
1401f5136:     	leaq	0x8(%r15), %r12
1401f513a:     	jmp	0x1401f5149 <.text+0x1f4149>
1401f513c:     	nopl	(%rax)
1401f5140:     	addq	$0x18, %r12
1401f5144:     	decq	%rsi
1401f5147:     	je	0x1401f5164 <.text+0x1f4164>
1401f5149:     	movq	-0x8(%r12), %rdx
1401f514e:     	testq	%rdx, %rdx
1401f5151:     	je	0x1401f5140 <.text+0x1f4140>
1401f5153:     	movq	(%r12), %rcx
1401f5157:     	movl	$0x1, %r8d
1401f515d:     	callq	0x1400021d0 <.text+0x11d0>
1401f5162:     	jmp	0x1401f5140 <.text+0x1f4140>
1401f5164:     	movq	0x720(%rbp), %rax
1401f516b:     	testq	%rax, %rax
1401f516e:     	je	0x1401f5186 <.text+0x1f4186>
1401f5170:     	shlq	$0x3, %rax
1401f5174:     	leaq	(%rax,%rax,2), %rdx
1401f5178:     	movl	$0x8, %r8d
1401f517e:     	movq	%r15, %rcx
1401f5181:     	callq	0x1400021d0 <.text+0x11d0>
1401f5186:     	movq	0x870(%rbp), %r15
1401f518d:     	testq	%r15, %r15
1401f5190:     	js	0x1401f5199 <.text+0x1f4199>
1401f5192:     	cvtsi2ss	%r15, %xmm8
1401f5197:     	jmp	0x1401f51b2 <.text+0x1f41b2>
1401f5199:     	movq	%r15, %rax
1401f519c:     	shrq	%rax
1401f519f:     	movl	%r15d, %ecx
1401f51a2:     	andl	$0x1, %ecx
1401f51a5:     	orq	%rax, %rcx
1401f51a8:     	cvtsi2ss	%rcx, %xmm8
1401f51ad:     	addss	%xmm8, %xmm8
1401f51b2:     	movups	0x45c(%rbp), %xmm0
1401f51b9:     	movaps	%xmm0, 0x470(%rbp)
1401f51c0:     	movl	0x46c(%rbp), %eax
1401f51c6:     	movl	%eax, 0x480(%rbp)
1401f51cc:     	movw	$0x0, 0x254(%rbp)
1401f51d5:     	movb	$0x1, 0x244(%rbp)
1401f51dc:     	xorps	%xmm0, %xmm0
1401f51df:     	movups	%xmm0, 0x158(%rbp)
1401f51e6:     	movups	%xmm0, 0x168(%rbp)
1401f51ed:     	movabsq	$0x437c000000000001, %rax # imm = 0x437C000000000001
1401f51f7:     	movq	%rax, 0x178(%rbp)
1401f51fe:     	movaps	%xmm0, 0x180(%rbp)
1401f5205:     	movabsq	$0x43c2000000000001, %rax # imm = 0x43C2000000000001
1401f520f:     	movq	%rax, 0x190(%rbp)
1401f5216:     	movq	$0x0, 0x150(%rbp)
1401f5221:     	movups	%xmm0, 0x198(%rbp)
1401f5228:     	movl	$0x5, 0x26a(%rbp)
1401f5232:     	movups	0x5756e1f(%rip), %xmm0  # 0x14594c058
1401f5239:     	movups	%xmm0, 0x1a8(%rbp)
1401f5240:     	movups	0x5756e21(%rip), %xmm0  # 0x14594c068
1401f5247:     	movups	%xmm0, 0x1b8(%rbp)
1401f524e:     	movups	0x5756e23(%rip), %xmm0  # 0x14594c078
1401f5255:     	movups	%xmm0, 0x1c8(%rbp)
1401f525c:     	movups	0x5756e25(%rip), %xmm0  # 0x14594c088
1401f5263:     	movups	%xmm0, 0x1d8(%rbp)
1401f526a:     	movaps	0x574a57f(%rip), %xmm0  # 0x14593f7f0
1401f5271:     	movups	%xmm0, 0x1e8(%rbp)
1401f5278:     	movups	%xmm0, 0x1f8(%rbp)
1401f527f:     	movaps	0x571204a(%rip), %xmm0  # 0x1459072d0
1401f5286:     	movups	%xmm0, 0x208(%rbp)
1401f528d:     	movups	%xmm0, 0x218(%rbp)
1401f5294:     	movsd	0x57234e4(%rip), %xmm0  # 0x145918780
1401f529c:     	movsd	%xmm0, 0x248(%rbp)
1401f52a4:     	movl	$0x3f800000, 0x250(%rbp) # imm = 0x3F800000
1401f52ae:     	movaps	0x571220b(%rip), %xmm0  # 0x1459074c0
1401f52b5:     	movups	%xmm0, 0x228(%rbp)
1401f52bc:     	movl	$0x1, 0x238(%rbp)
1401f52c6:     	movq	$0x0, 0x23c(%rbp)
1401f52d1:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
1401f52db:     	movq	%rax, 0x262(%rbp)
1401f52e2:     	movups	0x5756cb7(%rip), %xmm0  # 0x14594bfa0
1401f52e9:     	movaps	%xmm0, 0xf0(%rbp)
1401f52f0:     	movq	$0x0, 0x100(%rbp)
1401f52fb:     	movups	0x5756cb6(%rip), %xmm0  # 0x14594bfb8
1401f5302:     	movups	%xmm0, 0x108(%rbp)
1401f5309:     	movq	$0x0, 0x118(%rbp)
1401f5314:     	movups	0x5756cb5(%rip), %xmm0  # 0x14594bfd0
1401f531b:     	movaps	%xmm0, 0x120(%rbp)
1401f5322:     	movq	$0x0, 0x130(%rbp)
1401f532d:     	movups	0x5756cb4(%rip), %xmm0  # 0x14594bfe8
1401f5334:     	movups	%xmm0, 0x138(%rbp)
1401f533b:     	movq	$0x0, 0x148(%rbp)
1401f5346:     	movw	$0x0, 0x25a(%rbp)
1401f534f:     	movl	$0x10000, 0x256(%rbp)   # imm = 0x10000
1401f5359:     	movw	$0x0, 0x260(%rbp)
1401f5362:     	movl	$0x10000, 0x25c(%rbp)   # imm = 0x10000
1401f536c:     	callq	0x140002200 <.text+0x1200>
1401f5371:     	movl	$0x60, %ecx
1401f5376:     	movl	$0x4, %edx
1401f537b:     	callq	0x1400021c0 <.text+0x11c0>
1401f5380:     	movq	%rax, 0x778(%rbp)
1401f5387:     	testq	%rax, %rax
1401f538a:     	je	0x1401f72e9 <.text+0x1f62e9>
1401f5390:     	leaq	0x490(%rbp), %rcx
1401f5397:     	leaq	0x274(%rbp), %rdx
1401f539e:     	callq	0x144c8c290 <.text+0x4c8b290>
1401f53a3:     	nop
1401f53a4:     	movaps	0x490(%rbp), %xmm9
1401f53ac:     	movaps	0x5755efd(%rip), %xmm0  # 0x14594b2b0
1401f53b3:     	movups	%xmm0, 0x494(%rbp)
1401f53ba:     	movl	$0x0, 0x490(%rbp)
1401f53c4:     	leaq	0x290(%rbp), %rcx
1401f53cb:     	leaq	0x490(%rbp), %rdx
1401f53d2:     	callq	0x144c8c290 <.text+0x4c8b290>
1401f53d7:     	nop
1401f53d8:     	movaps	0x290(%rbp), %xmm10
1401f53e0:     	movaps	0x57235f9(%rip), %xmm0  # 0x1459189e0
1401f53e7:     	movups	%xmm0, 0x494(%rbp)
1401f53ee:     	movl	$0x0, 0x490(%rbp)
1401f53f8:     	leaq	0x290(%rbp), %rcx
1401f53ff:     	leaq	0x490(%rbp), %rdx
1401f5406:     	callq	0x144c8c290 <.text+0x4c8b290>
1401f540b:     	nop
1401f540c:     	movaps	0x290(%rbp), %xmm0
1401f5413:     	movq	0x778(%rbp), %rsi
1401f541a:     	movq	$0x2, (%rsi)
1401f5421:     	movl	$0x1, 0x8(%rsi)
1401f5428:     	movups	%xmm9, 0xc(%rsi)
1401f542d:     	movaps	0x5755e8c(%rip), %xmm1  # 0x14594b2c0
1401f5434:     	movups	%xmm1, 0x1c(%rsi)
1401f5438:     	movups	%xmm10, 0x2c(%rsi)
1401f543d:     	movaps	0x574a6cc(%rip), %xmm1  # 0x14593fb10
1401f5444:     	movups	%xmm1, 0x3c(%rsi)
1401f5448:     	movups	%xmm0, 0x4c(%rsi)
1401f544c:     	movl	$0x3f000000, 0x5c(%rsi) # imm = 0x3F000000
1401f5453:     	callq	0x140002200 <.text+0x1200>
1401f5458:     	movl	$0x48, %ecx
1401f545d:     	movl	$0x8, %edx
1401f5462:     	callq	0x1400021c0 <.text+0x11c0>
1401f5467:     	testq	%rax, %rax
1401f546a:     	je	0x1401f72fe <.text+0x1f62fe>
1401f5470:     	movq	$0x3, 0x8(%rax)
1401f5478:     	movq	%rsi, 0x10(%rax)
1401f547c:     	movq	$0x3, 0x18(%rax)
1401f5484:     	movl	$0x403e2e93, 0x20(%rax) # imm = 0x403E2E93
1401f548b:     	movb	$0x0, 0x24(%rax)
1401f548f:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
1401f5499:     	movq	%rcx, (%rax)
1401f549c:     	movq	$0x1, 0x440(%rbp)
1401f54a7:     	movq	%rax, 0x448(%rbp)
1401f54ae:     	movq	$0x1, 0x450(%rbp)
1401f54b9:     	movaps	0x5755e10(%rip), %xmm0  # 0x14594b2d0
1401f54c0:     	movups	%xmm0, 0x294(%rbp)
1401f54c7:     	movl	$0x0, 0x290(%rbp)
1401f54d1:     	leaq	0x700(%rbp), %rcx
1401f54d8:     	leaq	0x290(%rbp), %rdx
1401f54df:     	callq	0x144c8c290 <.text+0x4c8b290>
1401f54e4:     	nop
1401f54e5:     	movaps	0x700(%rbp), %xmm0
1401f54ec:     	movups	%xmm0, 0x494(%rbp)
1401f54f3:     	movl	$0x1, 0x490(%rbp)
1401f54fd:     	movl	$0x42200000, 0x48(%rsp) # imm = 0x42200000
1401f5505:     	movl	$0x1, 0x40(%rsp)
1401f550d:     	movl	$0x0, 0x38(%rsp)
1401f5515:     	movl	$0x1, 0x30(%rsp)
1401f551d:     	movl	$0x41900000, 0x28(%rsp) # imm = 0x41900000
1401f5525:     	movl	$0x1, 0x20(%rsp)
1401f552d:     	leaq	0x700(%rbp), %rcx
1401f5534:     	leaq	0x490(%rbp), %rdx
1401f553b:     	xorps	%xmm3, %xmm3
1401f553e:     	movl	$0x1, %r8d
1401f5544:     	callq	0x14265f6a0 <.text+0x265e6a0>
1401f5549:     	nop
1401f554a:     	mulss	0x5755d51(%rip), %xmm8  # 0x14594b2a4
1401f5553:     	addss	0x571dda4(%rip), %xmm8  # 0x145913300
1401f555c:     	movl	0x480(%rbp), %eax
1401f5562:     	movl	%eax, 0x6b0(%rbp)
1401f5568:     	movaps	0x470(%rbp), %xmm0
1401f556f:     	movups	%xmm0, 0x6a0(%rbp)
1401f5576:     	leaq	0x290(%rbp), %rsi
1401f557d:     	leaq	0xf0(%rbp), %rdx
1401f5584:     	movl	$0x180, %r8d            # imm = 0x180
1401f558a:     	movq	%rsi, %rcx
1401f558d:     	callq	0x1457731ed <.text+0x57721ed>
1401f5592:     	movups	0x440(%rbp), %xmm0
1401f5599:     	movups	%xmm0, 0x410(%rbp)
1401f55a0:     	movq	0x450(%rbp), %rax
1401f55a7:     	movq	%rax, 0x420(%rbp)
1401f55ae:     	movups	0x700(%rbp), %xmm0
1401f55b5:     	movups	%xmm0, 0x428(%rbp)
1401f55bc:     	movq	0x710(%rbp), %rax
1401f55c3:     	movq	%rax, 0x438(%rbp)
1401f55ca:     	movups	0x5757187(%rip), %xmm0  # 0x14594c758
1401f55d1:     	movups	%xmm0, 0xe0(%rbp)
1401f55d8:     	movq	(%r14), %r12
1401f55db:     	addq	$0x8, %r14
1401f55df:     	leaq	0x498(%rbp), %rcx
1401f55e6:     	movl	$0x1b0, %r8d            # imm = 0x1B0
1401f55ec:     	movq	%rsi, %rdx
1401f55ef:     	callq	0x1457731ed <.text+0x57721ed>
1401f55f4:     	movl	$0x0, 0x648(%rbp)
1401f55fe:     	movlps	%xmm6, 0x64c(%rbp)
1401f5605:     	movss	%xmm7, 0x654(%rbp)
1401f560d:     	movq	$0x3f800000, 0x658(%rbp) # imm = 0x3F800000
1401f5618:     	movlps	%xmm6, 0x660(%rbp)
1401f561f:     	movss	%xmm7, 0x668(%rbp)
1401f5627:     	movq	$0x3f800000, 0x66c(%rbp) # imm = 0x3F800000
1401f5632:     	movlps	%xmm6, 0x674(%rbp)
1401f5639:     	movss	%xmm7, 0x67c(%rbp)
1401f5641:     	movq	$0x3f800000, 0x680(%rbp) # imm = 0x3F800000
1401f564c:     	movlps	%xmm6, 0x688(%rbp)
1401f5653:     	movss	%xmm7, 0x690(%rbp)
1401f565b:     	movl	$0x3f800000, 0x694(%rbp) # imm = 0x3F800000
1401f5665:     	movq	%r15, 0x698(%rbp)
1401f566c:     	movl	$0x0, 0x6b4(%rbp)
1401f5676:     	movlps	%xmm6, 0x6b8(%rbp)
1401f567d:     	movss	%xmm7, 0x6c0(%rbp)
1401f5685:     	movl	$0x3f800000, 0x6c4(%rbp) # imm = 0x3F800000
1401f568f:     	movss	%xmm8, 0x6c8(%rbp)
1401f5698:     	movl	$0x0, 0x6cc(%rbp)
1401f56a2:     	movb	$0x2, 0x6d0(%rbp)
1401f56a9:     	movl	0xec(%rbp), %eax
1401f56af:     	movl	%eax, 0x6e0(%rbp)
1401f56b5:     	movups	0xdd(%rbp), %xmm0
1401f56bc:     	movups	%xmm0, 0x6d1(%rbp)
1401f56c3:     	movaps	0x5755c16(%rip), %xmm0  # 0x14594b2e0
1401f56ca:     	movups	%xmm0, 0x6e4(%rbp)
1401f56d1:     	movq	%r12, 0x490(%rbp)
1401f56d8:     	leaq	0x5756509(%rip), %r9    # 0x14594bbe8
1401f56df:     	leaq	0xf0(%rbp), %rcx
1401f56e6:     	leaq	0x490(%rbp), %r15
1401f56ed:     	movq	%r14, %rdx
1401f56f0:     	movq	%r15, %r8
1401f56f3:     	callq	0x1400df750 <.text+0xde750>
1401f56f8:     	nop
1401f56f9:     	testb	%bl, %bl
1401f56fb:     	je	0x1401f585e <.text+0x1f485e>
1401f5701:     	movl	$0x0, 0x490(%rbp)
1401f570b:     	movaps	0x5755bde(%rip), %xmm0  # 0x14594b2f0
1401f5712:     	movups	%xmm0, 0x494(%rbp)
1401f5719:     	movl	$0x0, 0x4a4(%rbp)
1401f5723:     	movaps	0x5755bd6(%rip), %xmm1  # 0x14594b300
1401f572a:     	movups	%xmm1, 0x4a8(%rbp)
1401f5731:     	movl	$0x0, 0x4b8(%rbp)
1401f573b:     	movaps	0x5755bce(%rip), %xmm1  # 0x14594b310
1401f5742:     	movups	%xmm1, 0x4bc(%rbp)
1401f5749:     	movl	$0x0, 0x4cc(%rbp)
1401f5753:     	movaps	0x5755bc6(%rip), %xmm1  # 0x14594b320
1401f575a:     	movups	%xmm1, 0x4d0(%rbp)
1401f5761:     	movl	$0x0, 0x4e0(%rbp)
1401f576b:     	movups	%xmm0, 0x4e4(%rbp)
1401f5772:     	leaq	0x4f4(%rbp), %rax
1401f5779:     	movq	%r15, 0x700(%rbp)
1401f5780:     	movq	%rax, 0x708(%rbp)
1401f5787:     	movq	$0x0, 0x710(%rbp)
1401f5792:     	leaq	0x290(%rbp), %rcx
1401f5799:     	leaq	0x700(%rbp), %rdx
1401f57a0:     	callq	0x1401b0420 <.text+0x1af420>
1401f57a5:     	nop
1401f57a6:     	movb	$0x0, 0x2c4(%rbp)
1401f57ad:     	movups	0x5756f50(%rip), %xmm0  # 0x14594c704
1401f57b4:     	movups	%xmm0, 0x2a8(%rbp)
1401f57bb:     	movq	$0x0, 0x2b8(%rbp)
1401f57c6:     	movl	$0x0, 0x2c0(%rbp)
1401f57d0:     	callq	0x140002200 <.text+0x1200>
1401f57d5:     	movl	$0x48, %ecx
1401f57da:     	movl	$0x8, %edx
1401f57df:     	callq	0x1400021c0 <.text+0x11c0>
1401f57e4:     	testq	%rax, %rax
1401f57e7:     	je	0x1401f7313 <.text+0x1f6313>
1401f57ed:     	movq	0x2c0(%rbp), %rcx
1401f57f4:     	movq	%rcx, 0x38(%rax)
1401f57f8:     	movups	0x290(%rbp), %xmm0
1401f57ff:     	movups	0x2a0(%rbp), %xmm1
1401f5806:     	movups	0x2b0(%rbp), %xmm2
1401f580d:     	movups	%xmm2, 0x28(%rax)
1401f5811:     	movups	%xmm1, 0x18(%rax)
1401f5815:     	movups	%xmm0, 0x8(%rax)
1401f5819:     	movabsq	$-0x7ffffffffffffffe, %rcx # imm = 0x8000000000000002
1401f5823:     	movq	%rcx, (%rax)
1401f5826:     	movq	$0x1, 0x490(%rbp)
1401f5831:     	movq	%rax, 0x498(%rbp)
1401f5838:     	movq	$0x1, 0x4a0(%rbp)
1401f5843:     	movb	$0x0, 0x4a8(%rbp)
1401f584a:     	leaq	0xf0(%rbp), %rcx
1401f5851:     	leaq	0x490(%rbp), %rdx
1401f5858:     	callq	0x1400f0b40 <.text+0xefb40>
1401f585d:     	nop
1401f585e:     	leaq	0xd0(%rbp), %rax
1401f5865:     	leaq	-0x18(%rbp), %rcx
1401f5869:     	leaq	(%rbp), %rdx
1401f586d:     	leaq	0x18(%rbp), %r8
1401f5871:     	leaq	0x30(%rbp), %r9
1401f5875:     	leaq	0x48(%rbp), %r10
1401f5879:     	leaq	0x60(%rbp), %r11
1401f587d:     	leaq	0x78(%rbp), %rsi
1401f5881:     	movq	%r13, 0x490(%rbp)
1401f5888:     	leaq	0x870(%rbp), %rbx
1401f588f:     	movq	%rbx, 0x498(%rbp)
1401f5896:     	leaq	-0x30(%rbp), %rbx
1401f589a:     	movq	%rbx, 0x4a0(%rbp)
1401f58a1:     	movq	%rax, 0x4a8(%rbp)
1401f58a8:     	movq	%rcx, 0x4b0(%rbp)
1401f58af:     	movq	%rdx, 0x4b8(%rbp)
1401f58b6:     	movq	%r8, 0x4c0(%rbp)
1401f58bd:     	movq	%r9, 0x4c8(%rbp)
1401f58c4:     	movq	%r10, 0x4d0(%rbp)
1401f58cb:     	movq	%r11, 0x4d8(%rbp)
1401f58d2:     	movq	%rsi, 0x4e0(%rbp)
1401f58d9:     	leaq	0x45c(%rbp), %rax
1401f58e0:     	movq	%rax, 0x4e8(%rbp)
1401f58e7:     	movq	0x748(%rbp), %rax
1401f58ee:     	movq	%rax, 0x4f0(%rbp)
1401f58f5:     	movq	%rdi, 0x4f8(%rbp)
1401f58fc:     	leaq	0xf0(%rbp), %rcx
1401f5903:     	leaq	0x490(%rbp), %rdx
1401f590a:     	callq	0x140109b00 <.text+0x108b00>
1401f590f:     	nop
1401f5910:     	leaq	-0x30(%rbp), %rcx
1401f5914:     	callq	0x1401ee510 <.text+0x1ed510>
1401f5919:     	movaps	0x7b0(%rbp), %xmm6
1401f5920:     	movaps	0x7c0(%rbp), %xmm7
1401f5927:     	movaps	0x7d0(%rbp), %xmm8
1401f592f:     	movaps	0x7e0(%rbp), %xmm9
1401f5937:     	movaps	0x7f0(%rbp), %xmm10
1401f593f:     	addq	$0x888, %rsp            # imm = 0x888
1401f5946:     	popq	%rbx
1401f5947:     	popq	%rdi
1401f5948:     	popq	%rsi
1401f5949:     	popq	%r12
1401f594b:     	popq	%r13
1401f594d:     	popq	%r14
1401f594f:     	popq	%r15
1401f5951:     	popq	%rbp
1401f5952:     	retq
1401f5953:     	movb	$0x1, 0x7a7(%rbp)
1401f595a:     	movb	$0x1, 0x7a6(%rbp)
1401f5961:     	leaq	0x5756e26(%rip), %rcx   # 0x14594c78e
1401f5968:     	movl	$0x4, %edx
1401f596d:     	movq	%rdi, %r8
1401f5970:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f5975:     	nop
1401f5976:     	testq	%rax, %rax
1401f5979:     	jne	0x1401f5982 <.text+0x1f4982>
1401f597b:     	movq	0x7817e36(%rip), %rax   # 0x147a0d7b8
1401f5982:     	cmpb	$0x3, (%rax)
1401f5985:     	jne	0x1401f599e <.text+0x1f499e>
1401f5987:     	cmpq	$0x4, 0x18(%rax)
1401f598c:     	jne	0x1401f599e <.text+0x1f499e>
1401f598e:     	movq	0x10(%rax), %rax
1401f5992:     	cmpl	$0x676e6972, (%rax)     # imm = 0x676E6972
1401f5998:     	je	0x1401f63c4 <.text+0x1f53c4>
1401f599e:     	movb	$0x1, 0x7a7(%rbp)
1401f59a5:     	movb	$0x1, 0x7a6(%rbp)
1401f59ac:     	leaq	0x5756eb8(%rip), %rcx   # 0x14594c86b
1401f59b3:     	movl	$0x7, %edx
1401f59b8:     	callq	0x145457c00 <.text+0x5456c00>
1401f59bd:     	nop
1401f59be:     	movq	%rdx, %r15
1401f59c1:     	xorl	%ecx, %ecx
1401f59c3:     	testq	%r15, %r15
1401f59c6:     	jns	0x1401f63f2 <.text+0x1f53f2>
1401f59cc:     	xorl	%r13d, %r13d
1401f59cf:     	movb	$0x1, 0x7a7(%rbp)
1401f59d6:     	movb	$0x1, 0x7a6(%rbp)
1401f59dd:     	movq	%r13, %rcx
1401f59e0:     	movq	%r15, %rdx
1401f59e3:     	callq	0x14590379b <.text+0x590279b>
1401f59e8:     	nop
1401f59e9:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f59ee:     	movb	$0x1, 0x7a7(%rbp)
1401f59f5:     	movb	$0x1, 0x7a6(%rbp)
1401f59fc:     	leaq	0x5756dbd(%rip), %rcx   # 0x14594c7c0
1401f5a03:     	movl	$0x4, %edx
1401f5a08:     	movq	%rdi, %r8
1401f5a0b:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f5a10:     	nop
1401f5a11:     	testq	%rax, %rax
1401f5a14:     	jne	0x1401f5a1d <.text+0x1f4a1d>
1401f5a16:     	movq	0x7817d9b(%rip), %rax   # 0x147a0d7b8
1401f5a1d:     	cmpb	$0x2, (%rax)
1401f5a20:     	jne	0x1401f5a2d <.text+0x1f4a2d>
1401f5a22:     	cmpq	$0x0, 0x8(%rax)
1401f5a27:     	je	0x1401f5e20 <.text+0x1f4e20>
1401f5a2d:     	xorl	%eax, %eax
1401f5a2f:     	movq	%rax, 0x470(%rbp)
1401f5a36:     	movb	$0x1, 0x7a7(%rbp)
1401f5a3d:     	movb	$0x1, 0x7a6(%rbp)
1401f5a44:     	leaq	0x5756e04(%rip), %rcx   # 0x14594c84f
1401f5a4b:     	movl	$0x8, %edx
1401f5a50:     	callq	0x145457c00 <.text+0x5456c00>
1401f5a55:     	nop
1401f5a56:     	movq	%rdx, %r8
1401f5a59:     	leaq	0x5756c78(%rip), %rsi   # 0x14594c6d8
1401f5a60:     	movq	%rsi, 0x290(%rbp)
1401f5a67:     	movq	$0x1, 0x298(%rbp)
1401f5a72:     	leaq	0x470(%rbp), %r15
1401f5a79:     	movq	%r15, 0x2a0(%rbp)
1401f5a80:     	leaq	0x5756c31(%rip), %r12   # 0x14594c6b8
1401f5a87:     	movq	%r12, 0x2a8(%rbp)
1401f5a8e:     	movb	$0x1, 0x7a7(%rbp)
1401f5a95:     	movb	$0x1, 0x7a6(%rbp)
1401f5a9c:     	movq	$0x1, 0x20(%rsp)
1401f5aa5:     	leaq	0xf0(%rbp), %rcx
1401f5aac:     	leaq	0x290(%rbp), %r9
1401f5ab3:     	movq	%rax, %rdx
1401f5ab6:     	callq	0x145458060 <.text+0x5457060>
1401f5abb:     	nop
1401f5abc:     	movq	0x490(%rbp), %rdx
1401f5ac3:     	testq	%rdx, %rdx
1401f5ac6:     	je	0x1401f5ada <.text+0x1f4ada>
1401f5ac8:     	movq	0x498(%rbp), %rcx
1401f5acf:     	movl	$0x1, %r8d
1401f5ad5:     	callq	0x1400021d0 <.text+0x11d0>
1401f5ada:     	movq	0x100(%rbp), %rax
1401f5ae1:     	movq	%rax, 0x4a0(%rbp)
1401f5ae8:     	movups	0xf0(%rbp), %xmm0
1401f5aef:     	movaps	%xmm0, 0x490(%rbp)
1401f5af6:     	movb	$0x1, 0x7a7(%rbp)
1401f5afd:     	movb	$0x1, 0x7a6(%rbp)
1401f5b04:     	leaq	0x5756ba5(%rip), %rcx   # 0x14594c6b0
1401f5b0b:     	movl	$0x8, %edx
1401f5b10:     	callq	0x145457c00 <.text+0x5456c00>
1401f5b15:     	nop
1401f5b16:     	movq	%rdx, %r8
1401f5b19:     	movq	0x470(%rbp), %rcx
1401f5b20:     	cmpq	$0x1, %rcx
1401f5b24:     	adcq	$-0x1, %rcx
1401f5b28:     	movq	%rcx, 0x440(%rbp)
1401f5b2f:     	movq	%rsi, 0xf0(%rbp)
1401f5b36:     	movq	$0x1, 0xf8(%rbp)
1401f5b41:     	leaq	0x440(%rbp), %rcx
1401f5b48:     	movq	%rcx, 0x100(%rbp)
1401f5b4f:     	movq	%r12, 0x108(%rbp)
1401f5b56:     	movb	$0x1, 0x7a7(%rbp)
1401f5b5d:     	movb	$0x1, 0x7a6(%rbp)
1401f5b64:     	movq	$0x1, 0x20(%rsp)
1401f5b6d:     	leaq	-0x30(%rbp), %rsi
1401f5b71:     	leaq	0xf0(%rbp), %r9
1401f5b78:     	movq	%rsi, %rcx
1401f5b7b:     	movq	%rax, %rdx
1401f5b7e:     	callq	0x145458060 <.text+0x5457060>
1401f5b83:     	nop
1401f5b84:     	movq	%rsi, 0x290(%rbp)
1401f5b8b:     	leaq	-0x1f3ab2(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
1401f5b92:     	movq	%rax, 0x298(%rbp)
1401f5b99:     	movq	%r15, 0x2a0(%rbp)
1401f5ba0:     	leaq	0x5545799(%rip), %rax   # 0x14573b340 <.text+0x573a340>
1401f5ba7:     	movq	%rax, 0x2a8(%rbp)
1401f5bae:     	leaq	0x5756d54(%rip), %rdx   # 0x14594c909
1401f5bb5:     	leaq	0x700(%rbp), %rcx
1401f5bbc:     	leaq	0x290(%rbp), %r8
1401f5bc3:     	callq	0x145728390 <.text+0x5727390>
1401f5bc8:     	nop
1401f5bc9:     	movq	-0x30(%rbp), %rdx
1401f5bcd:     	testq	%rdx, %rdx
1401f5bd0:     	je	0x1401f5be1 <.text+0x1f4be1>
1401f5bd2:     	movq	-0x28(%rbp), %rcx
1401f5bd6:     	movl	$0x1, %r8d
1401f5bdc:     	callq	0x1400021d0 <.text+0x11d0>
1401f5be1:     	leaq	0x4c0(%rbp), %rsi
1401f5be8:     	movq	0x4c0(%rbp), %rdx
1401f5bef:     	testq	%rdx, %rdx
1401f5bf2:     	je	0x1401f5c06 <.text+0x1f4c06>
1401f5bf4:     	movq	0x4c8(%rbp), %rcx
1401f5bfb:     	movl	$0x1, %r8d
1401f5c01:     	callq	0x1400021d0 <.text+0x11d0>
1401f5c06:     	movq	0x710(%rbp), %rax
1401f5c0d:     	movq	%rax, 0x10(%rsi)
1401f5c11:     	movups	0x700(%rbp), %xmm0
1401f5c18:     	movups	%xmm0, (%rsi)
1401f5c1b:     	movq	0x500(%rbp), %rsi
1401f5c22:     	testq	%rsi, %rsi
1401f5c25:     	je	0x1401f5c56 <.text+0x1f4c56>
1401f5c27:     	movq	0x4f8(%rbp), %r15
1401f5c2e:     	addq	$0x8, %r15
1401f5c32:     	jmp	0x1401f5c3d <.text+0x1f4c3d>
1401f5c34:     	addq	$0x18, %r15
1401f5c38:     	decq	%rsi
1401f5c3b:     	je	0x1401f5c56 <.text+0x1f4c56>
1401f5c3d:     	movq	-0x8(%r15), %rdx
1401f5c41:     	testq	%rdx, %rdx
1401f5c44:     	je	0x1401f5c34 <.text+0x1f4c34>
1401f5c46:     	movq	(%r15), %rcx
1401f5c49:     	movl	$0x1, %r8d
1401f5c4f:     	callq	0x1400021d0 <.text+0x11d0>
1401f5c54:     	jmp	0x1401f5c34 <.text+0x1f4c34>
1401f5c56:     	movq	0x4f0(%rbp), %rax
1401f5c5d:     	testq	%rax, %rax
1401f5c60:     	je	0x1401f5c7c <.text+0x1f4c7c>
1401f5c62:     	movq	0x4f8(%rbp), %rcx
1401f5c69:     	shlq	$0x3, %rax
1401f5c6d:     	leaq	(%rax,%rax,2), %rdx
1401f5c71:     	movl	$0x8, %r8d
1401f5c77:     	callq	0x1400021d0 <.text+0x11d0>
1401f5c7c:     	movq	0x730(%rbp), %rax
1401f5c83:     	leaq	0x4f0(%rbp), %rcx
1401f5c8a:     	movq	%rax, 0x10(%rcx)
1401f5c8e:     	movups	0x720(%rbp), %xmm0
1401f5c95:     	movups	%xmm0, (%rcx)
1401f5c98:     	movb	$0x0, 0x7a7(%rbp)
1401f5c9f:     	movb	$0x1, 0x7a6(%rbp)
1401f5ca6:     	leaq	0x5756c66(%rip), %rcx   # 0x14594c913
1401f5cad:     	movl	$0x19, %edx
1401f5cb2:     	callq	0x145457c00 <.text+0x5456c00>
1401f5cb7:     	nop
1401f5cb8:     	movq	%rdx, %r15
1401f5cbb:     	testq	%rdx, %rdx
1401f5cbe:     	jns	0x1401f5d7c <.text+0x1f4d7c>
1401f5cc4:     	xorl	%r13d, %r13d
1401f5cc7:     	movb	$0x0, 0x7a7(%rbp)
1401f5cce:     	movb	$0x1, 0x7a6(%rbp)
1401f5cd5:     	movq	%r13, %rcx
1401f5cd8:     	movq	%r15, %rdx
1401f5cdb:     	callq	0x14590379b <.text+0x590279b>
1401f5ce0:     	nop
1401f5ce1:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f5ce6:     	testq	%r15, %r15
1401f5ce9:     	je	0x1401f5e29 <.text+0x1f4e29>
1401f5cef:     	movq	%rax, 0x798(%rbp)
1401f5cf6:     	callq	0x140002200 <.text+0x1200>
1401f5cfb:     	movl	$0x1, %r13d
1401f5d01:     	movl	$0x1, %edx
1401f5d06:     	movq	%r15, %rcx
1401f5d09:     	callq	0x1400021c0 <.text+0x11c0>
1401f5d0e:     	testq	%rax, %rax
1401f5d11:     	je	0x1401f4ff6 <.text+0x1f3ff6>
1401f5d17:     	movq	%rax, %rsi
1401f5d1a:     	movq	%rax, %rcx
1401f5d1d:     	movq	0x798(%rbp), %rdx
1401f5d24:     	movq	%r15, %r8
1401f5d27:     	callq	0x1457731ed <.text+0x57721ed>
1401f5d2c:     	jmp	0x1401f5e2e <.text+0x1f4e2e>
1401f5d31:     	testq	%r12, %r12
1401f5d34:     	je	0x1401f62b6 <.text+0x1f52b6>
1401f5d3a:     	movq	%rax, 0x798(%rbp)
1401f5d41:     	callq	0x140002200 <.text+0x1200>
1401f5d46:     	movl	$0x1, %r13d
1401f5d4c:     	movl	$0x1, %edx
1401f5d51:     	movq	%r12, %rcx
1401f5d54:     	callq	0x1400021c0 <.text+0x11c0>
1401f5d59:     	testq	%rax, %rax
1401f5d5c:     	je	0x1401f4f90 <.text+0x1f3f90>
1401f5d62:     	movq	%rax, %rsi
1401f5d65:     	movq	%rax, %rcx
1401f5d68:     	movq	0x798(%rbp), %rdx
1401f5d6f:     	movq	%r12, %r8
1401f5d72:     	callq	0x1457731ed <.text+0x57721ed>
1401f5d77:     	jmp	0x1401f62bb <.text+0x1f52bb>
1401f5d7c:     	testq	%r15, %r15
1401f5d7f:     	je	0x1401f6386 <.text+0x1f5386>
1401f5d85:     	movq	%rax, 0x798(%rbp)
1401f5d8c:     	callq	0x140002200 <.text+0x1200>
1401f5d91:     	movl	$0x1, %r13d
1401f5d97:     	movl	$0x1, %edx
1401f5d9c:     	movq	%r15, %rcx
1401f5d9f:     	callq	0x1400021c0 <.text+0x11c0>
1401f5da4:     	testq	%rax, %rax
1401f5da7:     	je	0x1401f5cc7 <.text+0x1f4cc7>
1401f5dad:     	movq	%rax, %r12
1401f5db0:     	movq	%rax, %rcx
1401f5db3:     	movq	0x798(%rbp), %rdx
1401f5dba:     	movq	%r15, %r8
1401f5dbd:     	callq	0x1457731ed <.text+0x57721ed>
1401f5dc2:     	movq	0x780(%rbp), %r13
1401f5dc9:     	jmp	0x1401f638c <.text+0x1f538c>
1401f5dce:     	testq	%r15, %r15
1401f5dd1:     	je	0x1401f6a88 <.text+0x1f5a88>
1401f5dd7:     	movq	%rax, 0x798(%rbp)
1401f5dde:     	callq	0x140002200 <.text+0x1200>
1401f5de3:     	movl	$0x1, %r13d
1401f5de9:     	movl	$0x1, %edx
1401f5dee:     	movq	%r15, %rcx
1401f5df1:     	callq	0x1400021c0 <.text+0x11c0>
1401f5df6:     	testq	%rax, %rax
1401f5df9:     	je	0x1401f5058 <.text+0x1f4058>
1401f5dff:     	movq	%rax, %r12
1401f5e02:     	movq	%rax, %rcx
1401f5e05:     	movq	0x798(%rbp), %rdx
1401f5e0c:     	movq	%r15, %r8
1401f5e0f:     	callq	0x1457731ed <.text+0x57721ed>
1401f5e14:     	movq	0x780(%rbp), %r13
1401f5e1b:     	jmp	0x1401f6a8e <.text+0x1f5a8e>
1401f5e20:     	movq	0x10(%rax), %rax
1401f5e24:     	jmp	0x1401f5a2f <.text+0x1f4a2f>
1401f5e29:     	movl	$0x1, %esi
1401f5e2e:     	movq	0x4c0(%rbp), %rdx
1401f5e35:     	testq	%rdx, %rdx
1401f5e38:     	je	0x1401f5e4c <.text+0x1f4e4c>
1401f5e3a:     	movq	0x4c8(%rbp), %rcx
1401f5e41:     	movl	$0x1, %r8d
1401f5e47:     	callq	0x1400021d0 <.text+0x11d0>
1401f5e4c:     	movq	%r15, 0x4c0(%rbp)
1401f5e53:     	movq	%rsi, 0x4c8(%rbp)
1401f5e5a:     	movq	%r15, 0x4d0(%rbp)
1401f5e61:     	movq	0x500(%rbp), %rsi
1401f5e68:     	testq	%rsi, %rsi
1401f5e6b:     	je	0x1401f5e9c <.text+0x1f4e9c>
1401f5e6d:     	movq	0x4f8(%rbp), %r15
1401f5e74:     	addq	$0x8, %r15
1401f5e78:     	jmp	0x1401f5e83 <.text+0x1f4e83>
1401f5e7a:     	addq	$0x18, %r15
1401f5e7e:     	decq	%rsi
1401f5e81:     	je	0x1401f5e9c <.text+0x1f4e9c>
1401f5e83:     	movq	-0x8(%r15), %rdx
1401f5e87:     	testq	%rdx, %rdx
1401f5e8a:     	je	0x1401f5e7a <.text+0x1f4e7a>
1401f5e8c:     	movq	(%r15), %rcx
1401f5e8f:     	movl	$0x1, %r8d
1401f5e95:     	callq	0x1400021d0 <.text+0x11d0>
1401f5e9a:     	jmp	0x1401f5e7a <.text+0x1f4e7a>
1401f5e9c:     	movq	0x4f0(%rbp), %rax
1401f5ea3:     	testq	%rax, %rax
1401f5ea6:     	je	0x1401f5ec2 <.text+0x1f4ec2>
1401f5ea8:     	movq	0x4f8(%rbp), %rcx
1401f5eaf:     	shlq	$0x3, %rax
1401f5eb3:     	leaq	(%rax,%rax,2), %rdx
1401f5eb7:     	movl	$0x8, %r8d
1401f5ebd:     	callq	0x1400021d0 <.text+0x11d0>
1401f5ec2:     	movq	0x730(%rbp), %rax
1401f5ec9:     	leaq	0x4f0(%rbp), %rcx
1401f5ed0:     	movq	%rax, 0x10(%rcx)
1401f5ed4:     	movups	0x720(%rbp), %xmm0
1401f5edb:     	movups	%xmm0, (%rcx)
1401f5ede:     	movb	$0x0, 0x7a7(%rbp)
1401f5ee5:     	movb	$0x1, 0x7a6(%rbp)
1401f5eec:     	leaq	0x57568cd(%rip), %rcx   # 0x14594c7c0
1401f5ef3:     	movl	$0x4, %edx
1401f5ef8:     	movq	%rdi, %r8
1401f5efb:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f5f00:     	nop
1401f5f01:     	testq	%rax, %rax
1401f5f04:     	jne	0x1401f5f0d <.text+0x1f4f0d>
1401f5f06:     	movq	0x78178ab(%rip), %rax   # 0x147a0d7b8
1401f5f0d:     	cmpb	$0x2, (%rax)
1401f5f10:     	jne	0x1401f5f1d <.text+0x1f4f1d>
1401f5f12:     	cmpq	$0x0, 0x8(%rax)
1401f5f17:     	je	0x1401f6b51 <.text+0x1f5b51>
1401f5f1d:     	xorl	%r15d, %r15d
1401f5f20:     	movb	$0x0, 0x7a7(%rbp)
1401f5f27:     	movb	$0x1, 0x7a6(%rbp)
1401f5f2e:     	leaq	0x575688f(%rip), %rcx   # 0x14594c7c4
1401f5f35:     	movl	$0x8, %edx
1401f5f3a:     	movq	%rdi, %r8
1401f5f3d:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f5f42:     	nop
1401f5f43:     	testq	%rax, %rax
1401f5f46:     	jne	0x1401f5f4f <.text+0x1f4f4f>
1401f5f48:     	movq	0x7817869(%rip), %rax   # 0x147a0d7b8
1401f5f4f:     	cmpb	$0x3, (%rax)
1401f5f52:     	jne	0x1401f6171 <.text+0x1f5171>
1401f5f58:     	testb	%r15b, %r15b
1401f5f5b:     	jne	0x1401f617a <.text+0x1f517a>
1401f5f61:     	movups	0x10(%rax), %xmm0
1401f5f65:     	movups	%xmm0, -0x30(%rbp)
1401f5f69:     	movb	$0x0, 0x7a7(%rbp)
1401f5f70:     	movb	$0x1, 0x7a6(%rbp)
1401f5f77:     	leaq	0x575684e(%rip), %rcx   # 0x14594c7cc
1401f5f7e:     	movl	$0x6, %edx
1401f5f83:     	callq	0x145457c00 <.text+0x5456c00>
1401f5f88:     	nop
1401f5f89:     	movq	%rdx, %r15
1401f5f8c:     	movq	%rax, 0x798(%rbp)
1401f5f93:     	movq	$0x1, 0x20(%rsp)
1401f5f9c:     	leaq	0x290(%rbp), %rcx
1401f5fa3:     	movl	$0x1, %r9d
1401f5fa9:     	xorl	%r8d, %r8d
1401f5fac:     	callq	0x140188f20 <.text+0x187f20>
1401f5fb1:     	movq	0x298(%rbp), %rsi
1401f5fb8:     	cmpl	$0x1, 0x290(%rbp)
1401f5fbf:     	je	0x1401f736e <.text+0x1f636e>
1401f5fc5:     	movq	0x2a0(%rbp), %r13
1401f5fcc:     	testq	%r15, %r15
1401f5fcf:     	je	0x1401f5fe3 <.text+0x1f4fe3>
1401f5fd1:     	movq	%r13, %rcx
1401f5fd4:     	movq	0x798(%rbp), %rdx
1401f5fdb:     	movq	%r15, %r8
1401f5fde:     	callq	0x1457731ed <.text+0x57721ed>
1401f5fe3:     	movq	0x490(%rbp), %rdx
1401f5fea:     	testq	%rdx, %rdx
1401f5fed:     	je	0x1401f6001 <.text+0x1f5001>
1401f5fef:     	movq	0x498(%rbp), %rcx
1401f5ff6:     	movl	$0x1, %r8d
1401f5ffc:     	callq	0x1400021d0 <.text+0x11d0>
1401f6001:     	movq	%rsi, 0x490(%rbp)
1401f6008:     	movq	%r13, 0x498(%rbp)
1401f600f:     	movq	%r15, 0x4a0(%rbp)
1401f6016:     	movb	$0x0, 0x7a7(%rbp)
1401f601d:     	movb	$0x1, 0x7a6(%rbp)
1401f6024:     	leaq	0x57567a7(%rip), %rcx   # 0x14594c7d2
1401f602b:     	movl	$0xf, %edx
1401f6030:     	callq	0x145457c00 <.text+0x5456c00>
1401f6035:     	nop
1401f6036:     	movq	%rdx, %r8
1401f6039:     	movq	%r12, 0x290(%rbp)
1401f6040:     	movq	$0x4, 0x298(%rbp)
1401f604b:     	leaq	-0x30(%rbp), %rcx
1401f604f:     	movq	%rcx, 0x2a0(%rbp)
1401f6056:     	leaq	0x575678b(%rip), %rcx   # 0x14594c7e8
1401f605d:     	movq	%rcx, 0x2a8(%rbp)
1401f6064:     	movb	$0x0, 0x7a7(%rbp)
1401f606b:     	movb	$0x1, 0x7a6(%rbp)
1401f6072:     	movq	$0x1, 0x20(%rsp)
1401f607b:     	leaq	0xf0(%rbp), %rcx
1401f6082:     	leaq	0x290(%rbp), %r9
1401f6089:     	movq	%rax, %rdx
1401f608c:     	callq	0x145458060 <.text+0x5457060>
1401f6091:     	nop
1401f6092:     	movq	0x508(%rbp), %rdx
1401f6099:     	testq	%rdx, %rdx
1401f609c:     	je	0x1401f60b0 <.text+0x1f50b0>
1401f609e:     	movq	0x510(%rbp), %rcx
1401f60a5:     	movl	$0x1, %r8d
1401f60ab:     	callq	0x1400021d0 <.text+0x11d0>
1401f60b0:     	movq	0x100(%rbp), %rax
1401f60b7:     	leaq	0x4f0(%rbp), %rcx
1401f60be:     	movq	%rax, 0x28(%rcx)
1401f60c2:     	movups	0xf0(%rbp), %xmm0
1401f60c9:     	movups	%xmm0, 0x18(%rcx)
1401f60cd:     	movq	-0x30(%rbp), %r15
1401f60d1:     	movq	-0x28(%rbp), %r12
1401f60d5:     	movq	$0x1, 0x20(%rsp)
1401f60de:     	leaq	0x290(%rbp), %rcx
1401f60e5:     	movl	$0x1, %r9d
1401f60eb:     	movq	%r12, %rdx
1401f60ee:     	xorl	%r8d, %r8d
1401f60f1:     	callq	0x140188f20 <.text+0x187f20>
1401f60f6:     	movq	0x298(%rbp), %rax
1401f60fd:     	movq	%rax, 0x788(%rbp)
1401f6104:     	cmpl	$0x1, 0x290(%rbp)
1401f610b:     	je	0x1401f73d1 <.text+0x1f63d1>
1401f6111:     	movq	0x2a0(%rbp), %rsi
1401f6118:     	testq	%r12, %r12
1401f611b:     	je	0x1401f612c <.text+0x1f512c>
1401f611d:     	movq	%rsi, %rcx
1401f6120:     	movq	%r15, %rdx
1401f6123:     	movq	%r12, %r8
1401f6126:     	callq	0x1457731ed <.text+0x57721ed>
1401f612b:     	nop
1401f612c:     	movq	%rsi, 0x770(%rbp)
1401f6133:     	leaq	0x57566ce(%rip), %rcx   # 0x14594c808
1401f613a:     	movl	$0xc, %edx
1401f613f:     	movq	%rdi, %r8
1401f6142:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f6147:     	nop
1401f6148:     	testq	%rax, %rax
1401f614b:     	jne	0x1401f6154 <.text+0x1f5154>
1401f614d:     	movq	0x7817664(%rip), %rax   # 0x147a0d7b8
1401f6154:     	movq	%r12, 0x288(%rbp)
1401f615b:     	cmpb	$0x3, (%rax)
1401f615e:     	jne	0x1401f6cf2 <.text+0x1f5cf2>
1401f6164:     	movq	0x10(%rax), %r13
1401f6168:     	movq	0x18(%rax), %r12
1401f616c:     	jmp	0x1401f6cfb <.text+0x1f5cfb>
1401f6171:     	testb	%r15b, %r15b
1401f6174:     	je	0x1401f673f <.text+0x1f573f>
1401f617a:     	movq	%rsi, -0x30(%rbp)
1401f617e:     	movb	$0x0, 0x7a7(%rbp)
1401f6185:     	movb	$0x1, 0x7a6(%rbp)
1401f618c:     	leaq	0x57566bc(%rip), %rcx   # 0x14594c84f
1401f6193:     	movl	$0x8, %edx
1401f6198:     	callq	0x145457c00 <.text+0x5456c00>
1401f619d:     	nop
1401f619e:     	movq	%rdx, %r8
1401f61a1:     	leaq	0x5756530(%rip), %rcx   # 0x14594c6d8
1401f61a8:     	movq	%rcx, 0x290(%rbp)
1401f61af:     	movq	$0x1, 0x298(%rbp)
1401f61ba:     	leaq	-0x30(%rbp), %rcx
1401f61be:     	movq	%rcx, 0x2a0(%rbp)
1401f61c5:     	leaq	0x57564ec(%rip), %rcx   # 0x14594c6b8
1401f61cc:     	movq	%rcx, 0x2a8(%rbp)
1401f61d3:     	movb	$0x0, 0x7a7(%rbp)
1401f61da:     	movb	$0x1, 0x7a6(%rbp)
1401f61e1:     	movq	$0x1, 0x20(%rsp)
1401f61ea:     	leaq	0xf0(%rbp), %rcx
1401f61f1:     	leaq	0x290(%rbp), %r9
1401f61f8:     	movq	%rax, %rdx
1401f61fb:     	callq	0x145458060 <.text+0x5457060>
1401f6200:     	nop
1401f6201:     	movq	0x490(%rbp), %rdx
1401f6208:     	testq	%rdx, %rdx
1401f620b:     	je	0x1401f621f <.text+0x1f521f>
1401f620d:     	movq	0x498(%rbp), %rcx
1401f6214:     	movl	$0x1, %r8d
1401f621a:     	callq	0x1400021d0 <.text+0x11d0>
1401f621f:     	movq	0x100(%rbp), %rax
1401f6226:     	movq	%rax, 0x4a0(%rbp)
1401f622d:     	movups	0xf0(%rbp), %xmm0
1401f6234:     	movaps	%xmm0, 0x490(%rbp)
1401f623b:     	movb	$0x0, 0x7a7(%rbp)
1401f6242:     	movb	$0x1, 0x7a6(%rbp)
1401f6249:     	leaq	0x5756607(%rip), %rcx   # 0x14594c857
1401f6250:     	movl	$0x14, %edx
1401f6255:     	callq	0x145457c00 <.text+0x5456c00>
1401f625a:     	nop
1401f625b:     	movq	%rax, %rsi
1401f625e:     	movq	%rdx, %r15
1401f6261:     	movq	$0x1, 0x20(%rsp)
1401f626a:     	leaq	0x290(%rbp), %rcx
1401f6271:     	movl	$0x1, %r9d
1401f6277:     	xorl	%r8d, %r8d
1401f627a:     	callq	0x140188f20 <.text+0x187f20>
1401f627f:     	movq	0x298(%rbp), %r12
1401f6286:     	cmpl	$0x1, 0x290(%rbp)
1401f628d:     	jne	0x1401f6843 <.text+0x1f5843>
1401f6293:     	movq	0x2a0(%rbp), %rdx
1401f629a:     	movb	$0x0, 0x7a7(%rbp)
1401f62a1:     	movb	$0x1, 0x7a6(%rbp)
1401f62a8:     	movq	%r12, %rcx
1401f62ab:     	callq	0x14590379b <.text+0x590279b>
1401f62b0:     	nop
1401f62b1:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f62b6:     	movl	$0x1, %esi
1401f62bb:     	movq	0x490(%rbp), %rdx
1401f62c2:     	testq	%rdx, %rdx
1401f62c5:     	je	0x1401f62d9 <.text+0x1f52d9>
1401f62c7:     	movq	0x498(%rbp), %rcx
1401f62ce:     	movl	$0x1, %r8d
1401f62d4:     	callq	0x1400021d0 <.text+0x11d0>
1401f62d9:     	movq	%r12, 0x490(%rbp)
1401f62e0:     	movq	%rsi, 0x498(%rbp)
1401f62e7:     	movq	%r12, 0x4a0(%rbp)
1401f62ee:     	movb	$0x1, 0x590(%rbp)
1401f62f5:     	movb	$0x1, 0x7a7(%rbp)
1401f62fc:     	movb	$0x1, 0x7a6(%rbp)
1401f6303:     	leaq	0x5756625(%rip), %rcx   # 0x14594c92f
1401f630a:     	movl	$0x9, %edx
1401f630f:     	callq	0x145457c00 <.text+0x5456c00>
1401f6314:     	nop
1401f6315:     	movq	%rdx, %r12
1401f6318:     	testq	%rdx, %rdx
1401f631b:     	jns	0x1401f633f <.text+0x1f533f>
1401f631d:     	xorl	%r13d, %r13d
1401f6320:     	movb	$0x1, 0x7a7(%rbp)
1401f6327:     	movb	$0x1, 0x7a6(%rbp)
1401f632e:     	movq	%r13, %rcx
1401f6331:     	movq	%r12, %rdx
1401f6334:     	callq	0x14590379b <.text+0x590279b>
1401f6339:     	nop
1401f633a:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f633f:     	movq	%rax, 0x798(%rbp)
1401f6346:     	testq	%r12, %r12
1401f6349:     	je	0x1401f6b5d <.text+0x1f5b5d>
1401f634f:     	callq	0x140002200 <.text+0x1200>
1401f6354:     	movl	$0x1, %r13d
1401f635a:     	movl	$0x1, %edx
1401f635f:     	movq	%r12, %rcx
1401f6362:     	callq	0x1400021c0 <.text+0x11c0>
1401f6367:     	testq	%rax, %rax
1401f636a:     	je	0x1401f6320 <.text+0x1f5320>
1401f636c:     	movq	%rax, %rsi
1401f636f:     	movq	%rax, %rcx
1401f6372:     	movq	0x798(%rbp), %rdx
1401f6379:     	movq	%r12, %r8
1401f637c:     	callq	0x1457731ed <.text+0x57721ed>
1401f6381:     	jmp	0x1401f6b62 <.text+0x1f5b62>
1401f6386:     	movl	$0x1, %r12d
1401f638c:     	movq	0x508(%rbp), %rdx
1401f6393:     	testq	%rdx, %rdx
1401f6396:     	je	0x1401f63aa <.text+0x1f53aa>
1401f6398:     	movq	0x510(%rbp), %rcx
1401f639f:     	movl	$0x1, %r8d
1401f63a5:     	callq	0x1400021d0 <.text+0x11d0>
1401f63aa:     	movq	%r15, 0x508(%rbp)
1401f63b1:     	movq	%r12, 0x510(%rbp)
1401f63b8:     	movq	%r15, 0x518(%rbp)
1401f63bf:     	jmp	0x1401f6a81 <.text+0x1f5a81>
1401f63c4:     	movb	$0x1, 0x7a7(%rbp)
1401f63cb:     	movb	$0x1, 0x7a6(%rbp)
1401f63d2:     	leaq	0x5756499(%rip), %rcx   # 0x14594c872
1401f63d9:     	movl	$0x4, %edx
1401f63de:     	callq	0x145457c00 <.text+0x5456c00>
1401f63e3:     	nop
1401f63e4:     	movq	%rdx, %r15
1401f63e7:     	movb	$0x1, %cl
1401f63e9:     	testq	%r15, %r15
1401f63ec:     	js	0x1401f59cc <.text+0x1f49cc>
1401f63f2:     	movl	%ecx, 0x798(%rbp)
1401f63f8:     	je	0x1401f6440 <.text+0x1f5440>
1401f63fa:     	movq	%rax, 0x788(%rbp)
1401f6401:     	callq	0x140002200 <.text+0x1200>
1401f6406:     	movl	$0x1, %r13d
1401f640c:     	movl	$0x1, %edx
1401f6411:     	movq	%r15, %rcx
1401f6414:     	callq	0x1400021c0 <.text+0x11c0>
1401f6419:     	testq	%rax, %rax
1401f641c:     	je	0x1401f59cf <.text+0x1f49cf>
1401f6422:     	movq	%rax, %r12
1401f6425:     	movq	%rax, %rcx
1401f6428:     	movq	0x788(%rbp), %rdx
1401f642f:     	movq	%r15, %r8
1401f6432:     	callq	0x1457731ed <.text+0x57721ed>
1401f6437:     	movq	0x780(%rbp), %r13
1401f643e:     	jmp	0x1401f6446 <.text+0x1f5446>
1401f6440:     	movl	$0x1, %r12d
1401f6446:     	movq	0x4c0(%rbp), %rdx
1401f644d:     	testq	%rdx, %rdx
1401f6450:     	je	0x1401f6464 <.text+0x1f5464>
1401f6452:     	movq	0x4c8(%rbp), %rcx
1401f6459:     	movl	$0x1, %r8d
1401f645f:     	callq	0x1400021d0 <.text+0x11d0>
1401f6464:     	movq	%r15, 0x4c0(%rbp)
1401f646b:     	movq	%r12, 0x4c8(%rbp)
1401f6472:     	movq	%r15, 0x4d0(%rbp)
1401f6479:     	movq	0x500(%rbp), %rsi
1401f6480:     	testq	%rsi, %rsi
1401f6483:     	movl	0x798(%rbp), %r12d
1401f648a:     	je	0x1401f64bb <.text+0x1f54bb>
1401f648c:     	movq	0x4f8(%rbp), %r15
1401f6493:     	addq	$0x8, %r15
1401f6497:     	jmp	0x1401f64a2 <.text+0x1f54a2>
1401f6499:     	addq	$0x18, %r15
1401f649d:     	decq	%rsi
1401f64a0:     	je	0x1401f64bb <.text+0x1f54bb>
1401f64a2:     	movq	-0x8(%r15), %rdx
1401f64a6:     	testq	%rdx, %rdx
1401f64a9:     	je	0x1401f6499 <.text+0x1f5499>
1401f64ab:     	movq	(%r15), %rcx
1401f64ae:     	movl	$0x1, %r8d
1401f64b4:     	callq	0x1400021d0 <.text+0x11d0>
1401f64b9:     	jmp	0x1401f6499 <.text+0x1f5499>
1401f64bb:     	movq	0x4f0(%rbp), %rax
1401f64c2:     	testq	%rax, %rax
1401f64c5:     	je	0x1401f64e1 <.text+0x1f54e1>
1401f64c7:     	movq	0x4f8(%rbp), %rcx
1401f64ce:     	shlq	$0x3, %rax
1401f64d2:     	leaq	(%rax,%rax,2), %rdx
1401f64d6:     	movl	$0x8, %r8d
1401f64dc:     	callq	0x1400021d0 <.text+0x11d0>
1401f64e1:     	movq	0x730(%rbp), %rax
1401f64e8:     	leaq	0x4f0(%rbp), %rcx
1401f64ef:     	movq	%rax, 0x10(%rcx)
1401f64f3:     	movups	0x720(%rbp), %xmm0
1401f64fa:     	movups	%xmm0, (%rcx)
1401f64fd:     	movb	$0x0, 0x7a7(%rbp)
1401f6504:     	movb	$0x1, 0x7a6(%rbp)
1401f650b:     	leaq	0x57562ae(%rip), %rcx   # 0x14594c7c0
1401f6512:     	movl	$0x4, %edx
1401f6517:     	movq	%rdi, %r8
1401f651a:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f651f:     	nop
1401f6520:     	testq	%rax, %rax
1401f6523:     	jne	0x1401f652c <.text+0x1f552c>
1401f6525:     	movq	0x781728c(%rip), %rax   # 0x147a0d7b8
1401f652c:     	cmpb	$0x2, (%rax)
1401f652f:     	jne	0x1401f653c <.text+0x1f553c>
1401f6531:     	cmpq	$0x0, 0x8(%rax)
1401f6536:     	je	0x1401f664c <.text+0x1f564c>
1401f653c:     	movb	$0x0, 0x7a7(%rbp)
1401f6543:     	movb	$0x1, 0x7a6(%rbp)
1401f654a:     	leaq	0x5756358(%rip), %rcx   # 0x14594c8a9
1401f6551:     	movl	$0x4, %edx
1401f6556:     	movq	%rdi, %r8
1401f6559:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f655e:     	nop
1401f655f:     	testq	%rax, %rax
1401f6562:     	jne	0x1401f656b <.text+0x1f556b>
1401f6564:     	movq	0x781724d(%rip), %rax   # 0x147a0d7b8
1401f656b:     	movl	$0x1, %esi
1401f6570:     	cmpb	$0x2, (%rax)
1401f6573:     	jne	0x1401f6590 <.text+0x1f5590>
1401f6575:     	cmpq	$0x0, 0x8(%rax)
1401f657a:     	jne	0x1401f6590 <.text+0x1f5590>
1401f657c:     	movq	0x10(%rax), %rax
1401f6580:     	incq	%rax
1401f6583:     	cmpq	$0x2, %rax
1401f6587:     	movl	$0x2, %esi
1401f658c:     	cmovbq	%rax, %rsi
1401f6590:     	testb	%r12b, %r12b
1401f6593:     	je	0x1401f65b7 <.text+0x1f55b7>
1401f6595:     	movb	$0x0, 0x7a7(%rbp)
1401f659c:     	movb	$0x1, 0x7a6(%rbp)
1401f65a3:     	leaq	0x575630a(%rip), %rcx   # 0x14594c8b4
1401f65aa:     	movl	$0x4, %edx
1401f65af:     	callq	0x145457c00 <.text+0x5456c00>
1401f65b4:     	nop
1401f65b5:     	jmp	0x1401f65d7 <.text+0x1f55d7>
1401f65b7:     	movb	$0x0, 0x7a7(%rbp)
1401f65be:     	movb	$0x1, 0x7a6(%rbp)
1401f65c5:     	leaq	0x57562e1(%rip), %rcx   # 0x14594c8ad
1401f65cc:     	movl	$0x7, %edx
1401f65d1:     	callq	0x145457c00 <.text+0x5456c00>
1401f65d6:     	nop
1401f65d7:     	movq	%rdx, %r15
1401f65da:     	testq	%rdx, %rdx
1401f65dd:     	jns	0x1401f6601 <.text+0x1f5601>
1401f65df:     	xorl	%r13d, %r13d
1401f65e2:     	movb	$0x0, 0x7a7(%rbp)
1401f65e9:     	movb	$0x1, 0x7a6(%rbp)
1401f65f0:     	movq	%r13, %rcx
1401f65f3:     	movq	%r15, %rdx
1401f65f6:     	callq	0x14590379b <.text+0x590279b>
1401f65fb:     	nop
1401f65fc:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f6601:     	je	0x1401f688e <.text+0x1f588e>
1401f6607:     	movq	%rax, 0x788(%rbp)
1401f660e:     	callq	0x140002200 <.text+0x1200>
1401f6613:     	movl	$0x1, %r13d
1401f6619:     	movl	$0x1, %edx
1401f661e:     	movq	%r15, %rcx
1401f6621:     	callq	0x1400021c0 <.text+0x11c0>
1401f6626:     	testq	%rax, %rax
1401f6629:     	je	0x1401f65e2 <.text+0x1f55e2>
1401f662b:     	movq	%rax, %r12
1401f662e:     	movq	%rax, %rcx
1401f6631:     	movq	0x788(%rbp), %rdx
1401f6638:     	movq	%r15, %r8
1401f663b:     	callq	0x1457731ed <.text+0x57721ed>
1401f6640:     	movq	0x780(%rbp), %r13
1401f6647:     	jmp	0x1401f6894 <.text+0x1f5894>
1401f664c:     	movq	0x10(%rax), %rax
1401f6650:     	movq	%rax, -0x30(%rbp)
1401f6654:     	movb	$0x0, 0x7a7(%rbp)
1401f665b:     	movb	$0x1, 0x7a6(%rbp)
1401f6662:     	leaq	0x57561e6(%rip), %rcx   # 0x14594c84f
1401f6669:     	movl	$0x8, %edx
1401f666e:     	callq	0x145457c00 <.text+0x5456c00>
1401f6673:     	nop
1401f6674:     	movq	%rdx, %r8
1401f6677:     	leaq	0x575605a(%rip), %rcx   # 0x14594c6d8
1401f667e:     	movq	%rcx, 0x290(%rbp)
1401f6685:     	movq	$0x1, 0x298(%rbp)
1401f6690:     	leaq	-0x30(%rbp), %rcx
1401f6694:     	movq	%rcx, 0x2a0(%rbp)
1401f669b:     	leaq	0x5756016(%rip), %rcx   # 0x14594c6b8
1401f66a2:     	movq	%rcx, 0x2a8(%rbp)
1401f66a9:     	movb	$0x0, 0x7a7(%rbp)
1401f66b0:     	movb	$0x1, 0x7a6(%rbp)
1401f66b7:     	movq	$0x1, 0x20(%rsp)
1401f66c0:     	leaq	0xf0(%rbp), %rcx
1401f66c7:     	leaq	0x290(%rbp), %r9
1401f66ce:     	movq	%rax, %rdx
1401f66d1:     	callq	0x145458060 <.text+0x5457060>
1401f66d6:     	nop
1401f66d7:     	movq	0x490(%rbp), %rdx
1401f66de:     	testq	%rdx, %rdx
1401f66e1:     	je	0x1401f66f5 <.text+0x1f56f5>
1401f66e3:     	movq	0x498(%rbp), %rcx
1401f66ea:     	movl	$0x1, %r8d
1401f66f0:     	callq	0x1400021d0 <.text+0x11d0>
1401f66f5:     	movq	0x100(%rbp), %rax
1401f66fc:     	movq	%rax, 0x4a0(%rbp)
1401f6703:     	movups	0xf0(%rbp), %xmm0
1401f670a:     	movaps	%xmm0, 0x490(%rbp)
1401f6711:     	testb	%r12b, %r12b
1401f6714:     	je	0x1401f6c3f <.text+0x1f5c3f>
1401f671a:     	movb	$0x0, 0x7a7(%rbp)
1401f6721:     	movb	$0x1, 0x7a6(%rbp)
1401f6728:     	leaq	0x5756162(%rip), %rcx   # 0x14594c891
1401f672f:     	movl	$0x18, %edx
1401f6734:     	callq	0x145457c00 <.text+0x5456c00>
1401f6739:     	nop
1401f673a:     	jmp	0x1401f6c5f <.text+0x1f5c5f>
1401f673f:     	movb	$0x0, 0x7a7(%rbp)
1401f6746:     	movb	$0x1, 0x7a6(%rbp)
1401f674d:     	leaq	0x5756078(%rip), %rcx   # 0x14594c7cc
1401f6754:     	movl	$0x6, %edx
1401f6759:     	callq	0x145457c00 <.text+0x5456c00>
1401f675e:     	nop
1401f675f:     	movq	%rax, %rsi
1401f6762:     	movq	%rdx, %r15
1401f6765:     	movq	$0x1, 0x20(%rsp)
1401f676e:     	leaq	0x290(%rbp), %rcx
1401f6775:     	movl	$0x1, %r9d
1401f677b:     	xorl	%r8d, %r8d
1401f677e:     	callq	0x140188f20 <.text+0x187f20>
1401f6783:     	movq	0x298(%rbp), %r12
1401f678a:     	cmpl	$0x1, 0x290(%rbp)
1401f6791:     	je	0x1401f7391 <.text+0x1f6391>
1401f6797:     	movq	0x2a0(%rbp), %r13
1401f679e:     	testq	%r15, %r15
1401f67a1:     	je	0x1401f67b1 <.text+0x1f57b1>
1401f67a3:     	movq	%r13, %rcx
1401f67a6:     	movq	%rsi, %rdx
1401f67a9:     	movq	%r15, %r8
1401f67ac:     	callq	0x1457731ed <.text+0x57721ed>
1401f67b1:     	movq	0x490(%rbp), %rdx
1401f67b8:     	testq	%rdx, %rdx
1401f67bb:     	je	0x1401f67cf <.text+0x1f57cf>
1401f67bd:     	movq	0x498(%rbp), %rcx
1401f67c4:     	movl	$0x1, %r8d
1401f67ca:     	callq	0x1400021d0 <.text+0x11d0>
1401f67cf:     	movq	%r12, 0x490(%rbp)
1401f67d6:     	movq	%r13, 0x498(%rbp)
1401f67dd:     	movq	%r15, 0x4a0(%rbp)
1401f67e4:     	movb	$0x1, 0x590(%rbp)
1401f67eb:     	movb	$0x0, 0x7a7(%rbp)
1401f67f2:     	movb	$0x1, 0x7a6(%rbp)
1401f67f9:     	leaq	0x575603a(%rip), %rcx   # 0x14594c83a
1401f6800:     	movl	$0x15, %edx
1401f6805:     	callq	0x145457c00 <.text+0x5456c00>
1401f680a:     	nop
1401f680b:     	movq	%rax, %rsi
1401f680e:     	movq	%rdx, %r15
1401f6811:     	movq	$0x1, 0x20(%rsp)
1401f681a:     	leaq	0x290(%rbp), %rcx
1401f6821:     	movl	$0x1, %r9d
1401f6827:     	xorl	%r8d, %r8d
1401f682a:     	callq	0x140188f20 <.text+0x187f20>
1401f682f:     	movq	0x298(%rbp), %r12
1401f6836:     	cmpl	$0x1, 0x290(%rbp)
1401f683d:     	je	0x1401f73b1 <.text+0x1f63b1>
1401f6843:     	movq	0x2a0(%rbp), %r13
1401f684a:     	testq	%r15, %r15
1401f684d:     	je	0x1401f685d <.text+0x1f585d>
1401f684f:     	movq	%r13, %rcx
1401f6852:     	movq	%rsi, %rdx
1401f6855:     	movq	%r15, %r8
1401f6858:     	callq	0x1457731ed <.text+0x57721ed>
1401f685d:     	movq	0x508(%rbp), %rdx
1401f6864:     	testq	%rdx, %rdx
1401f6867:     	je	0x1401f687b <.text+0x1f587b>
1401f6869:     	movq	0x510(%rbp), %rcx
1401f6870:     	movl	$0x1, %r8d
1401f6876:     	callq	0x1400021d0 <.text+0x11d0>
1401f687b:     	movq	%r12, 0x508(%rbp)
1401f6882:     	movq	%r13, 0x510(%rbp)
1401f6889:     	jmp	0x1401f6cdd <.text+0x1f5cdd>
1401f688e:     	movl	$0x1, %r12d
1401f6894:     	movq	0x490(%rbp), %rdx
1401f689b:     	testq	%rdx, %rdx
1401f689e:     	je	0x1401f68b2 <.text+0x1f58b2>
1401f68a0:     	movq	0x498(%rbp), %rcx
1401f68a7:     	movl	$0x1, %r8d
1401f68ad:     	callq	0x1400021d0 <.text+0x11d0>
1401f68b2:     	movq	%r15, 0x490(%rbp)
1401f68b9:     	movq	%r12, 0x498(%rbp)
1401f68c0:     	movq	%r15, 0x4a0(%rbp)
1401f68c7:     	movb	$0x1, 0x590(%rbp)
1401f68ce:     	movq	%rsi, -0x30(%rbp)
1401f68d2:     	cmpb	$0x0, 0x798(%rbp)
1401f68d9:     	je	0x1401f6995 <.text+0x1f5995>
1401f68df:     	movb	$0x0, 0x7a7(%rbp)
1401f68e6:     	movb	$0x1, 0x7a6(%rbp)
1401f68ed:     	leaq	0x5755ff7(%rip), %rcx   # 0x14594c8eb
1401f68f4:     	movl	$0x1e, %edx
1401f68f9:     	callq	0x145457c00 <.text+0x5456c00>
1401f68fe:     	nop
1401f68ff:     	movq	%rdx, %r8
1401f6902:     	leaq	0x5755dcf(%rip), %rcx   # 0x14594c6d8
1401f6909:     	movq	%rcx, 0x290(%rbp)
1401f6910:     	movq	$0x1, 0x298(%rbp)
1401f691b:     	leaq	-0x30(%rbp), %rcx
1401f691f:     	movq	%rcx, 0x2a0(%rbp)
1401f6926:     	leaq	0x5755d8b(%rip), %rcx   # 0x14594c6b8
1401f692d:     	movq	%rcx, 0x2a8(%rbp)
1401f6934:     	leaq	0x5755fad(%rip), %rdx   # 0x14594c8e8
1401f693b:     	movq	%rdx, 0x2b0(%rbp)
1401f6942:     	movq	$0x3, 0x2b8(%rbp)
1401f694d:     	leaq	0x5755f8c(%rip), %rdx   # 0x14594c8e0
1401f6954:     	movq	%rdx, 0x2c0(%rbp)
1401f695b:     	movq	%rcx, 0x2c8(%rbp)
1401f6962:     	movb	$0x0, 0x7a7(%rbp)
1401f6969:     	movb	$0x1, 0x7a6(%rbp)
1401f6970:     	movq	$0x2, 0x20(%rsp)
1401f6979:     	leaq	0xf0(%rbp), %rcx
1401f6980:     	leaq	0x290(%rbp), %r9
1401f6987:     	movq	%rax, %rdx
1401f698a:     	callq	0x145458060 <.text+0x5457060>
1401f698f:     	nop
1401f6990:     	jmp	0x1401f6a46 <.text+0x1f5a46>
1401f6995:     	movb	$0x0, 0x7a7(%rbp)
1401f699c:     	movb	$0x1, 0x7a6(%rbp)
1401f69a3:     	leaq	0x5755f0e(%rip), %rcx   # 0x14594c8b8
1401f69aa:     	movl	$0x21, %edx
1401f69af:     	callq	0x145457c00 <.text+0x5456c00>
1401f69b4:     	nop
1401f69b5:     	movq	%rdx, %r8
1401f69b8:     	leaq	0x5755d19(%rip), %rcx   # 0x14594c6d8
1401f69bf:     	movq	%rcx, 0x290(%rbp)
1401f69c6:     	movq	$0x1, 0x298(%rbp)
1401f69d1:     	leaq	-0x30(%rbp), %rcx
1401f69d5:     	movq	%rcx, 0x2a0(%rbp)
1401f69dc:     	leaq	0x5755cd5(%rip), %rcx   # 0x14594c6b8
1401f69e3:     	movq	%rcx, 0x2a8(%rbp)
1401f69ea:     	leaq	0x5755ef7(%rip), %rdx   # 0x14594c8e8
1401f69f1:     	movq	%rdx, 0x2b0(%rbp)
1401f69f8:     	movq	$0x3, 0x2b8(%rbp)
1401f6a03:     	leaq	0x5755ed6(%rip), %rdx   # 0x14594c8e0
1401f6a0a:     	movq	%rdx, 0x2c0(%rbp)
1401f6a11:     	movq	%rcx, 0x2c8(%rbp)
1401f6a18:     	movb	$0x0, 0x7a7(%rbp)
1401f6a1f:     	movb	$0x1, 0x7a6(%rbp)
1401f6a26:     	movq	$0x2, 0x20(%rsp)
1401f6a2f:     	leaq	0xf0(%rbp), %rcx
1401f6a36:     	leaq	0x290(%rbp), %r9
1401f6a3d:     	movq	%rax, %rdx
1401f6a40:     	callq	0x145458060 <.text+0x5457060>
1401f6a45:     	nop
1401f6a46:     	movq	0x508(%rbp), %rdx
1401f6a4d:     	testq	%rdx, %rdx
1401f6a50:     	leaq	0x4f0(%rbp), %rsi
1401f6a57:     	je	0x1401f6a6b <.text+0x1f5a6b>
1401f6a59:     	movq	0x510(%rbp), %rcx
1401f6a60:     	movl	$0x1, %r8d
1401f6a66:     	callq	0x1400021d0 <.text+0x11d0>
1401f6a6b:     	movq	0x100(%rbp), %rax
1401f6a72:     	movq	%rax, 0x28(%rsi)
1401f6a76:     	movups	0xf0(%rbp), %xmm0
1401f6a7d:     	movups	%xmm0, 0x18(%rsi)
1401f6a81:     	xorl	%esi, %esi
1401f6a83:     	jmp	0x1401f726e <.text+0x1f626e>
1401f6a88:     	movl	$0x1, %r12d
1401f6a8e:     	movq	0x490(%rbp), %rdx
1401f6a95:     	testq	%rdx, %rdx
1401f6a98:     	je	0x1401f6aac <.text+0x1f5aac>
1401f6a9a:     	movq	0x498(%rbp), %rcx
1401f6aa1:     	movl	$0x1, %r8d
1401f6aa7:     	callq	0x1400021d0 <.text+0x11d0>
1401f6aac:     	movq	%r15, 0x490(%rbp)
1401f6ab3:     	movq	%r12, 0x498(%rbp)
1401f6aba:     	movq	%r15, 0x4a0(%rbp)
1401f6ac1:     	movb	$0x1, 0x7a7(%rbp)
1401f6ac8:     	movb	$0x1, 0x7a6(%rbp)
1401f6acf:     	leaq	0x5755ccf(%rip), %rcx   # 0x14594c7a5
1401f6ad6:     	movl	$0x15, %edx
1401f6adb:     	callq	0x145457c00 <.text+0x5456c00>
1401f6ae0:     	nop
1401f6ae1:     	movq	%rdx, %r15
1401f6ae4:     	testq	%rdx, %rdx
1401f6ae7:     	jns	0x1401f6b0b <.text+0x1f5b0b>
1401f6ae9:     	xorl	%r13d, %r13d
1401f6aec:     	movb	$0x1, 0x7a7(%rbp)
1401f6af3:     	movb	$0x1, 0x7a6(%rbp)
1401f6afa:     	movq	%r13, %rcx
1401f6afd:     	movq	%r15, %rdx
1401f6b00:     	callq	0x14590379b <.text+0x590279b>
1401f6b05:     	nop
1401f6b06:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f6b0b:     	testq	%r15, %r15
1401f6b0e:     	je	0x1401f6eed <.text+0x1f5eed>
1401f6b14:     	movq	%rax, %rsi
1401f6b17:     	callq	0x140002200 <.text+0x1200>
1401f6b1c:     	movl	$0x1, %r13d
1401f6b22:     	movl	$0x1, %edx
1401f6b27:     	movq	%r15, %rcx
1401f6b2a:     	callq	0x1400021c0 <.text+0x11c0>
1401f6b2f:     	testq	%rax, %rax
1401f6b32:     	je	0x1401f6aec <.text+0x1f5aec>
1401f6b34:     	movq	%rax, %r12
1401f6b37:     	movq	%rax, %rcx
1401f6b3a:     	movq	%rsi, %rdx
1401f6b3d:     	movq	%r15, %r8
1401f6b40:     	callq	0x1457731ed <.text+0x57721ed>
1401f6b45:     	movq	0x780(%rbp), %r13
1401f6b4c:     	jmp	0x1401f6ef3 <.text+0x1f5ef3>
1401f6b51:     	movq	0x10(%rax), %rsi
1401f6b55:     	movb	$0x1, %r15b
1401f6b58:     	jmp	0x1401f5f20 <.text+0x1f4f20>
1401f6b5d:     	movl	$0x1, %esi
1401f6b62:     	movq	0x4c0(%rbp), %rdx
1401f6b69:     	testq	%rdx, %rdx
1401f6b6c:     	je	0x1401f6b80 <.text+0x1f5b80>
1401f6b6e:     	movq	0x4c8(%rbp), %rcx
1401f6b75:     	movl	$0x1, %r8d
1401f6b7b:     	callq	0x1400021d0 <.text+0x11d0>
1401f6b80:     	movq	%r12, 0x4c0(%rbp)
1401f6b87:     	movq	%rsi, 0x4c8(%rbp)
1401f6b8e:     	movq	%r12, 0x4d0(%rbp)
1401f6b95:     	movq	0x720(%rbp), %rax
1401f6b9c:     	movq	%rax, 0x788(%rbp)
1401f6ba3:     	movq	0x728(%rbp), %r12
1401f6baa:     	movq	0x730(%rbp), %rax
1401f6bb1:     	leaq	(%rax,%rax,2), %rdx
1401f6bb5:     	movq	%r12, %rsi
1401f6bb8:     	movq	0x758(%rbp), %r8
1401f6bbf:     	movq	0x778(%rbp), %rcx
1401f6bc6:     	movq	%rcx, %r9
1401f6bc9:     	movq	%rcx, %r13
1401f6bcc:     	testq	%rax, %rax
1401f6bcf:     	je	0x1401f6ff1 <.text+0x1f5ff1>
1401f6bd5:     	leaq	0x18(%r12), %rsi
1401f6bda:     	movq	(%r12), %r13
1401f6bde:     	cmpq	$-0x1, %r13
1401f6be2:     	je	0x1401f6fe4 <.text+0x1f5fe4>
1401f6be8:     	movq	%rdx, 0x760(%rbp)
1401f6bef:     	movq	0x8(%r12), %rax
1401f6bf4:     	movq	%rax, 0x798(%rbp)
1401f6bfb:     	movq	0x10(%r12), %rax
1401f6c00:     	movq	%rax, 0x770(%rbp)
1401f6c07:     	testq	%rcx, %rcx
1401f6c0a:     	je	0x1401f6c25 <.text+0x1f5c25>
1401f6c0c:     	movl	$0x1, %r8d
1401f6c12:     	movq	0x758(%rbp), %rcx
1401f6c19:     	movq	0x778(%rbp), %rdx
1401f6c20:     	callq	0x1400021d0 <.text+0x11d0>
1401f6c25:     	movq	0x798(%rbp), %r8
1401f6c2c:     	movq	0x770(%rbp), %r9
1401f6c33:     	movq	0x760(%rbp), %rdx
1401f6c3a:     	jmp	0x1401f6ff1 <.text+0x1f5ff1>
1401f6c3f:     	movb	$0x0, 0x7a7(%rbp)
1401f6c46:     	movb	$0x1, 0x7a6(%rbp)
1401f6c4d:     	leaq	0x5755c22(%rip), %rcx   # 0x14594c876
1401f6c54:     	movl	$0x1b, %edx
1401f6c59:     	callq	0x145457c00 <.text+0x5456c00>
1401f6c5e:     	nop
1401f6c5f:     	movq	%rax, %rsi
1401f6c62:     	movq	%rdx, %r15
1401f6c65:     	movq	$0x1, 0x20(%rsp)
1401f6c6e:     	leaq	0x290(%rbp), %rcx
1401f6c75:     	movl	$0x1, %r9d
1401f6c7b:     	xorl	%r8d, %r8d
1401f6c7e:     	callq	0x140188f20 <.text+0x187f20>
1401f6c83:     	movq	0x298(%rbp), %r13
1401f6c8a:     	cmpl	$0x1, 0x290(%rbp)
1401f6c91:     	je	0x1401f734b <.text+0x1f634b>
1401f6c97:     	movq	0x2a0(%rbp), %r12
1401f6c9e:     	testq	%r15, %r15
1401f6ca1:     	je	0x1401f6cb1 <.text+0x1f5cb1>
1401f6ca3:     	movq	%r12, %rcx
1401f6ca6:     	movq	%rsi, %rdx
1401f6ca9:     	movq	%r15, %r8
1401f6cac:     	callq	0x1457731ed <.text+0x57721ed>
1401f6cb1:     	movq	0x508(%rbp), %rdx
1401f6cb8:     	testq	%rdx, %rdx
1401f6cbb:     	je	0x1401f6ccf <.text+0x1f5ccf>
1401f6cbd:     	movq	0x510(%rbp), %rcx
1401f6cc4:     	movl	$0x1, %r8d
1401f6cca:     	callq	0x1400021d0 <.text+0x11d0>
1401f6ccf:     	movq	%r13, 0x508(%rbp)
1401f6cd6:     	movq	%r12, 0x510(%rbp)
1401f6cdd:     	movq	%r15, 0x518(%rbp)
1401f6ce4:     	xorl	%esi, %esi
1401f6ce6:     	movq	0x780(%rbp), %r13
1401f6ced:     	jmp	0x1401f726e <.text+0x1f626e>
1401f6cf2:     	movl	$0x1, %r13d
1401f6cf8:     	xorl	%r12d, %r12d
1401f6cfb:     	movq	$0x1, 0x20(%rsp)
1401f6d04:     	leaq	0x290(%rbp), %rcx
1401f6d0b:     	movl	$0x1, %r9d
1401f6d11:     	movq	%r12, %rdx
1401f6d14:     	xorl	%r8d, %r8d
1401f6d17:     	callq	0x140188f20 <.text+0x187f20>
1401f6d1c:     	movq	0x298(%rbp), %rcx
1401f6d23:     	cmpl	$0x1, 0x290(%rbp)
1401f6d2a:     	je	0x1401f73f5 <.text+0x1f63f5>
1401f6d30:     	movq	%rcx, 0x760(%rbp)
1401f6d37:     	movq	0x2a0(%rbp), %rsi
1401f6d3e:     	testq	%r12, %r12
1401f6d41:     	je	0x1401f6d52 <.text+0x1f5d52>
1401f6d43:     	movq	%rsi, %rcx
1401f6d46:     	movq	%r13, %rdx
1401f6d49:     	movq	%r12, %r8
1401f6d4c:     	callq	0x1457731ed <.text+0x57721ed>
1401f6d51:     	nop
1401f6d52:     	movq	%rsi, 0x488(%rbp)
1401f6d59:     	leaq	0x5755ab4(%rip), %rcx   # 0x14594c814
1401f6d60:     	movl	$0xc, %edx
1401f6d65:     	movq	%rdi, %r8
1401f6d68:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f6d6d:     	nop
1401f6d6e:     	testq	%rax, %rax
1401f6d71:     	jne	0x1401f6d7a <.text+0x1f5d7a>
1401f6d73:     	movq	0x7816a3e(%rip), %rax   # 0x147a0d7b8
1401f6d7a:     	cmpb	$0x3, (%rax)
1401f6d7d:     	jne	0x1401f6d89 <.text+0x1f5d89>
1401f6d7f:     	movq	0x10(%rax), %r15
1401f6d83:     	movq	0x18(%rax), %r13
1401f6d87:     	jmp	0x1401f6d92 <.text+0x1f5d92>
1401f6d89:     	movl	$0x1, %r15d
1401f6d8f:     	xorl	%r13d, %r13d
1401f6d92:     	movq	$0x1, 0x20(%rsp)
1401f6d9b:     	leaq	0x290(%rbp), %rcx
1401f6da2:     	movl	$0x1, %r9d
1401f6da8:     	movq	%r13, %rdx
1401f6dab:     	xorl	%r8d, %r8d
1401f6dae:     	callq	0x140188f20 <.text+0x187f20>
1401f6db3:     	movq	0x298(%rbp), %rcx
1401f6dba:     	cmpl	$0x1, 0x290(%rbp)
1401f6dc1:     	je	0x1401f7404 <.text+0x1f6404>
1401f6dc7:     	movq	%rcx, 0x6f8(%rbp)
1401f6dce:     	movq	0x2a0(%rbp), %rax
1401f6dd5:     	movq	%rax, 0x798(%rbp)
1401f6ddc:     	testq	%r13, %r13
1401f6ddf:     	je	0x1401f6df4 <.text+0x1f5df4>
1401f6de1:     	movq	0x798(%rbp), %rcx
1401f6de8:     	movq	%r15, %rdx
1401f6deb:     	movq	%r13, %r8
1401f6dee:     	callq	0x1457731ed <.text+0x57721ed>
1401f6df3:     	nop
1401f6df4:     	leaq	0x5755a25(%rip), %rcx   # 0x14594c820
1401f6dfb:     	movl	$0xe, %edx
1401f6e00:     	movq	%rdi, %r8
1401f6e03:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f6e08:     	nop
1401f6e09:     	testq	%rax, %rax
1401f6e0c:     	jne	0x1401f6e15 <.text+0x1f5e15>
1401f6e0e:     	movq	0x78169a3(%rip), %rax   # 0x147a0d7b8
1401f6e15:     	cmpb	$0x2, (%rax)
1401f6e18:     	jne	0x1401f6e25 <.text+0x1f5e25>
1401f6e1a:     	cmpq	$0x0, 0x8(%rax)
1401f6e1f:     	je	0x1401f72d3 <.text+0x1f62d3>
1401f6e25:     	xorl	%esi, %esi
1401f6e27:     	leaq	0x5755a00(%rip), %rcx   # 0x14594c82e
1401f6e2e:     	movl	$0xc, %edx
1401f6e33:     	movq	%rdi, %r8
1401f6e36:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f6e3b:     	nop
1401f6e3c:     	testq	%rax, %rax
1401f6e3f:     	jne	0x1401f6e48 <.text+0x1f5e48>
1401f6e41:     	movq	0x7816970(%rip), %rax   # 0x147a0d7b8
1401f6e48:     	leaq	0x538(%rbp), %rcx
1401f6e4f:     	movl	$0x1, %r15d
1401f6e55:     	cmpb	$0x2, (%rax)
1401f6e58:     	jne	0x1401f6e65 <.text+0x1f5e65>
1401f6e5a:     	cmpq	$0x0, 0x8(%rax)
1401f6e5f:     	jne	0x1401f6e65 <.text+0x1f5e65>
1401f6e61:     	movq	0x10(%rax), %r15
1401f6e65:     	callq	0x1401ee0b0 <.text+0x1ed0b0>
1401f6e6a:     	movq	0x788(%rbp), %rax
1401f6e71:     	movq	%rax, 0x538(%rbp)
1401f6e78:     	movq	0x770(%rbp), %rax
1401f6e7f:     	movq	%rax, 0x540(%rbp)
1401f6e86:     	movq	0x288(%rbp), %rax
1401f6e8d:     	movq	%rax, 0x548(%rbp)
1401f6e94:     	movq	0x760(%rbp), %rax
1401f6e9b:     	movq	%rax, 0x550(%rbp)
1401f6ea2:     	movq	0x488(%rbp), %rax
1401f6ea9:     	movq	%rax, 0x558(%rbp)
1401f6eb0:     	movq	%r12, 0x560(%rbp)
1401f6eb7:     	movq	0x6f8(%rbp), %rax
1401f6ebe:     	movq	%rax, 0x568(%rbp)
1401f6ec5:     	movq	0x798(%rbp), %rax
1401f6ecc:     	movq	%rax, 0x570(%rbp)
1401f6ed3:     	movq	%r13, 0x578(%rbp)
1401f6eda:     	movq	%rsi, 0x580(%rbp)
1401f6ee1:     	movq	%r15, 0x588(%rbp)
1401f6ee8:     	jmp	0x1401f6ce4 <.text+0x1f5ce4>
1401f6eed:     	movl	$0x1, %r12d
1401f6ef3:     	movq	0x4c0(%rbp), %rdx
1401f6efa:     	testq	%rdx, %rdx
1401f6efd:     	je	0x1401f6f11 <.text+0x1f5f11>
1401f6eff:     	movq	0x4c8(%rbp), %rcx
1401f6f06:     	movl	$0x1, %r8d
1401f6f0c:     	callq	0x1400021d0 <.text+0x11d0>
1401f6f11:     	movq	%r15, 0x4c0(%rbp)
1401f6f18:     	movq	%r12, 0x4c8(%rbp)
1401f6f1f:     	movq	%r15, 0x4d0(%rbp)
1401f6f26:     	callq	0x140002200 <.text+0x1200>
1401f6f2b:     	movl	$0x18, %ecx
1401f6f30:     	movl	$0x8, %edx
1401f6f35:     	callq	0x1400021c0 <.text+0x11c0>
1401f6f3a:     	testq	%rax, %rax
1401f6f3d:     	je	0x1401f7328 <.text+0x1f6328>
1401f6f43:     	movq	%rax, %r15
1401f6f46:     	movq	0x778(%rbp), %rax
1401f6f4d:     	movq	%rax, (%r15)
1401f6f50:     	movq	0x758(%rbp), %rcx
1401f6f57:     	movq	%rcx, 0x8(%r15)
1401f6f5b:     	movq	%rax, 0x10(%r15)
1401f6f5f:     	movq	0x500(%rbp), %rsi
1401f6f66:     	testq	%rsi, %rsi
1401f6f69:     	je	0x1401f6f9c <.text+0x1f5f9c>
1401f6f6b:     	movq	0x4f8(%rbp), %r12
1401f6f72:     	addq	$0x8, %r12
1401f6f76:     	jmp	0x1401f6f81 <.text+0x1f5f81>
1401f6f78:     	addq	$0x18, %r12
1401f6f7c:     	decq	%rsi
1401f6f7f:     	je	0x1401f6f9c <.text+0x1f5f9c>
1401f6f81:     	movq	-0x8(%r12), %rdx
1401f6f86:     	testq	%rdx, %rdx
1401f6f89:     	je	0x1401f6f78 <.text+0x1f5f78>
1401f6f8b:     	movq	(%r12), %rcx
1401f6f8f:     	movl	$0x1, %r8d
1401f6f95:     	callq	0x1400021d0 <.text+0x11d0>
1401f6f9a:     	jmp	0x1401f6f78 <.text+0x1f5f78>
1401f6f9c:     	movq	0x4f0(%rbp), %rax
1401f6fa3:     	testq	%rax, %rax
1401f6fa6:     	je	0x1401f6fc2 <.text+0x1f5fc2>
1401f6fa8:     	movq	0x4f8(%rbp), %rcx
1401f6faf:     	shlq	$0x3, %rax
1401f6fb3:     	leaq	(%rax,%rax,2), %rdx
1401f6fb7:     	movl	$0x8, %r8d
1401f6fbd:     	callq	0x1400021d0 <.text+0x11d0>
1401f6fc2:     	movq	$0x1, 0x4f0(%rbp)
1401f6fcd:     	movq	%r15, 0x4f8(%rbp)
1401f6fd4:     	movq	$0x1, 0x500(%rbp)
1401f6fdf:     	jmp	0x1401f50e6 <.text+0x1f40e6>
1401f6fe4:     	movq	0x758(%rbp), %r8
1401f6feb:     	movq	%rcx, %r9
1401f6fee:     	movq	%rcx, %r13
1401f6ff1:     	movq	%rsi, 0x770(%rbp)
1401f6ff8:     	leaq	(%r12,%rdx,8), %rcx
1401f6ffc:     	movq	0x4d8(%rbp), %rdx
1401f7003:     	testq	%rdx, %rdx
1401f7006:     	je	0x1401f703c <.text+0x1f603c>
1401f7008:     	movq	%rcx, 0x760(%rbp)
1401f700f:     	movq	0x4e0(%rbp), %rcx
1401f7016:     	movq	%r8, 0x798(%rbp)
1401f701d:     	movl	$0x1, %r8d
1401f7023:     	movq	%r9, %rsi
1401f7026:     	callq	0x1400021d0 <.text+0x11d0>
1401f702b:     	movq	0x760(%rbp), %rcx
1401f7032:     	movq	%rsi, %r9
1401f7035:     	movq	0x798(%rbp), %r8
1401f703c:     	movq	%r13, 0x4d8(%rbp)
1401f7043:     	movq	%r8, 0x4e0(%rbp)
1401f704a:     	movq	%r9, 0x4e8(%rbp)
1401f7051:     	movq	%r12, 0x290(%rbp)
1401f7058:     	movq	0x770(%rbp), %rax
1401f705f:     	movq	%rax, 0x298(%rbp)
1401f7066:     	movq	0x788(%rbp), %rax
1401f706d:     	movq	%rax, 0x2a0(%rbp)
1401f7074:     	movq	%rcx, 0x2a8(%rbp)
1401f707b:     	movb	$0x0, 0x7a7(%rbp)
1401f7082:     	movb	$0x0, 0x7a6(%rbp)
1401f7089:     	leaq	0xf0(%rbp), %rcx
1401f7090:     	leaq	0x290(%rbp), %rdx
1401f7097:     	callq	0x1401af200 <.text+0x1ae200>
1401f709c:     	nop
1401f709d:     	movq	0x780(%rbp), %r13
1401f70a4:     	movq	0x500(%rbp), %rsi
1401f70ab:     	testq	%rsi, %rsi
1401f70ae:     	je	0x1401f70e1 <.text+0x1f60e1>
1401f70b0:     	movq	0x4f8(%rbp), %r12
1401f70b7:     	addq	$0x8, %r12
1401f70bb:     	jmp	0x1401f70c6 <.text+0x1f60c6>
1401f70bd:     	addq	$0x18, %r12
1401f70c1:     	decq	%rsi
1401f70c4:     	je	0x1401f70e1 <.text+0x1f60e1>
1401f70c6:     	movq	-0x8(%r12), %rdx
1401f70cb:     	testq	%rdx, %rdx
1401f70ce:     	je	0x1401f70bd <.text+0x1f60bd>
1401f70d0:     	movq	(%r12), %rcx
1401f70d4:     	movl	$0x1, %r8d
1401f70da:     	callq	0x1400021d0 <.text+0x11d0>
1401f70df:     	jmp	0x1401f70bd <.text+0x1f60bd>
1401f70e1:     	movq	0x4f0(%rbp), %rax
1401f70e8:     	testq	%rax, %rax
1401f70eb:     	je	0x1401f7107 <.text+0x1f6107>
1401f70ed:     	movq	0x4f8(%rbp), %rcx
1401f70f4:     	shlq	$0x3, %rax
1401f70f8:     	leaq	(%rax,%rax,2), %rdx
1401f70fc:     	movl	$0x8, %r8d
1401f7102:     	callq	0x1400021d0 <.text+0x11d0>
1401f7107:     	movq	0x100(%rbp), %rax
1401f710e:     	leaq	0x4f0(%rbp), %rcx
1401f7115:     	movq	%rax, 0x10(%rcx)
1401f7119:     	movups	0xf0(%rbp), %xmm0
1401f7120:     	movups	%xmm0, (%rcx)
1401f7123:     	movl	$0x1, %esi
1401f7128:     	cmpb	$-0x1, 0x60(%r15)
1401f712d:     	je	0x1401f717b <.text+0x1f617b>
1401f712f:     	addq	$0x60, %r15
1401f7133:     	movb	$0x0, 0x7a7(%rbp)
1401f713a:     	movb	$0x0, 0x7a6(%rbp)
1401f7141:     	leaq	0x57557f0(%rip), %rcx   # 0x14594c938
1401f7148:     	movl	$0x9, %edx
1401f714d:     	movq	%r15, %r8
1401f7150:     	callq	0x142affbe0 <.text+0x2afebe0>
1401f7155:     	nop
1401f7156:     	testq	%rax, %rax
1401f7159:     	jne	0x1401f7162 <.text+0x1f6162>
1401f715b:     	movq	0x7816656(%rip), %rax   # 0x147a0d7b8
1401f7162:     	cmpb	$0x4, (%rax)
1401f7165:     	jne	0x1401f717b <.text+0x1f617b>
1401f7167:     	movq	0x18(%rax), %rax
1401f716b:     	cmpq	$0x5, %rax
1401f716f:     	movl	$0x5, %esi
1401f7174:     	cmovbq	%rax, %rsi
1401f7178:     	incq	%rsi
1401f717b:     	movb	$0x0, 0x7a7(%rbp)
1401f7182:     	movb	$0x0, 0x7a6(%rbp)
1401f7189:     	leaq	0x57557b1(%rip), %rcx   # 0x14594c941
1401f7190:     	movl	$0x1f, %edx
1401f7195:     	callq	0x145457c00 <.text+0x5456c00>
1401f719a:     	nop
1401f719b:     	movq	%rdx, %r8
1401f719e:     	movq	%rsi, -0x30(%rbp)
1401f71a2:     	leaq	0x575552f(%rip), %rcx   # 0x14594c6d8
1401f71a9:     	movq	%rcx, 0x290(%rbp)
1401f71b0:     	movq	$0x1, 0x298(%rbp)
1401f71bb:     	leaq	-0x30(%rbp), %rcx
1401f71bf:     	movq	%rcx, 0x2a0(%rbp)
1401f71c6:     	leaq	0x5755793(%rip), %rcx   # 0x14594c960
1401f71cd:     	movq	%rcx, 0x2a8(%rbp)
1401f71d4:     	leaq	0x575570d(%rip), %rdx   # 0x14594c8e8
1401f71db:     	movq	%rdx, 0x2b0(%rbp)
1401f71e2:     	movq	$0x3, 0x2b8(%rbp)
1401f71ed:     	leaq	0x575578c(%rip), %rdx   # 0x14594c980
1401f71f4:     	movq	%rdx, 0x2c0(%rbp)
1401f71fb:     	movq	%rcx, 0x2c8(%rbp)
1401f7202:     	movb	$0x0, 0x7a7(%rbp)
1401f7209:     	movb	$0x0, 0x7a6(%rbp)
1401f7210:     	movq	$0x2, 0x20(%rsp)
1401f7219:     	leaq	0xf0(%rbp), %rcx
1401f7220:     	leaq	0x290(%rbp), %r9
1401f7227:     	movq	%rax, %rdx
1401f722a:     	callq	0x145458060 <.text+0x5457060>
1401f722f:     	nop
1401f7230:     	movq	0x508(%rbp), %rdx
1401f7237:     	testq	%rdx, %rdx
1401f723a:     	je	0x1401f724e <.text+0x1f624e>
1401f723c:     	movq	0x510(%rbp), %rcx
1401f7243:     	movl	$0x1, %r8d
1401f7249:     	callq	0x1400021d0 <.text+0x11d0>
1401f724e:     	movq	0x100(%rbp), %rax
1401f7255:     	leaq	0x4f0(%rbp), %rcx
1401f725c:     	movq	%rax, 0x28(%rcx)
1401f7260:     	movups	0xf0(%rbp), %xmm0
1401f7267:     	movups	%xmm0, 0x18(%rcx)
1401f726b:     	movb	$0x1, %sil
1401f726e:     	leaq	-0x30(%rbp), %rcx
1401f7272:     	leaq	0x490(%rbp), %rdx
1401f7279:     	movl	$0x108, %r8d            # imm = 0x108
1401f727f:     	callq	0x1457731ed <.text+0x57721ed>
1401f7284:     	movq	0x790(%rbp), %rdx
1401f728b:     	testq	%rdx, %rdx
1401f728e:     	setne	%al
1401f7291:     	testb	%al, 0x768(%rbp)
1401f7297:     	je	0x1401f72ab <.text+0x1f62ab>
1401f7299:     	movl	$0x1, %r8d
1401f729f:     	movq	0x750(%rbp), %rcx
1401f72a6:     	callq	0x1400021d0 <.text+0x11d0>
1401f72ab:     	movq	0x778(%rbp), %rdx
1401f72b2:     	testq	%rdx, %rdx
1401f72b5:     	sete	%al
1401f72b8:     	orb	%al, %sil
1401f72bb:     	jne	0x1401f5186 <.text+0x1f4186>
1401f72c1:     	movl	$0x1, %r8d
1401f72c7:     	movq	0x758(%rbp), %rcx
1401f72ce:     	jmp	0x1401f5181 <.text+0x1f4181>
1401f72d3:     	movq	0x10(%rax), %rax
1401f72d7:     	cmpq	$0x4, %rax
1401f72db:     	movl	$0x4, %esi
1401f72e0:     	cmovbq	%rax, %rsi
1401f72e4:     	jmp	0x1401f6e27 <.text+0x1f5e27>
1401f72e9:     	movl	$0x4, %ecx
1401f72ee:     	movl	$0x60, %edx
1401f72f3:     	callq	0x145903781 <.text+0x5902781>
1401f72f8:     	nop
1401f72f9:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f72fe:     	movl	$0x8, %ecx
1401f7303:     	movl	$0x48, %edx
1401f7308:     	callq	0x145903781 <.text+0x5902781>
1401f730d:     	nop
1401f730e:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f7313:     	movl	$0x8, %ecx
1401f7318:     	movl	$0x48, %edx
1401f731d:     	callq	0x145903781 <.text+0x5902781>
1401f7322:     	nop
1401f7323:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f7328:     	movb	$0x1, 0x7a7(%rbp)
1401f732f:     	movb	$0x1, 0x7a6(%rbp)
1401f7336:     	movl	$0x8, %ecx
1401f733b:     	movl	$0x18, %edx
1401f7340:     	callq	0x145903781 <.text+0x5902781>
1401f7345:     	nop
1401f7346:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f734b:     	movq	0x2a0(%rbp), %rdx
1401f7352:     	movb	$0x0, 0x7a7(%rbp)
1401f7359:     	movb	$0x1, 0x7a6(%rbp)
1401f7360:     	movq	%r13, %rcx
1401f7363:     	callq	0x14590379b <.text+0x590279b>
1401f7368:     	nop
1401f7369:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f736e:     	movq	0x2a0(%rbp), %rdx
1401f7375:     	movb	$0x0, 0x7a7(%rbp)
1401f737c:     	movb	$0x1, 0x7a6(%rbp)
1401f7383:     	movq	%rsi, %rcx
1401f7386:     	callq	0x14590379b <.text+0x590279b>
1401f738b:     	nop
1401f738c:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f7391:     	movq	0x2a0(%rbp), %rdx
1401f7398:     	movb	$0x0, 0x7a7(%rbp)
1401f739f:     	movb	$0x1, 0x7a6(%rbp)
1401f73a6:     	movq	%r12, %rcx
1401f73a9:     	callq	0x14590379b <.text+0x590279b>
1401f73ae:     	nop
1401f73af:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f73b1:     	movq	0x2a0(%rbp), %rdx
1401f73b8:     	movb	$0x0, 0x7a7(%rbp)
1401f73bf:     	movb	$0x1, 0x7a6(%rbp)
1401f73c6:     	movq	%r12, %rcx
1401f73c9:     	callq	0x14590379b <.text+0x590279b>
1401f73ce:     	nop
1401f73cf:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f73d1:     	movq	0x2a0(%rbp), %rdx
1401f73d8:     	movb	$0x0, 0x7a7(%rbp)
1401f73df:     	movb	$0x1, 0x7a6(%rbp)
1401f73e6:     	movq	0x788(%rbp), %rcx
1401f73ed:     	callq	0x14590379b <.text+0x590279b>
1401f73f2:     	nop
1401f73f3:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f73f5:     	movq	0x2a0(%rbp), %rdx
1401f73fc:     	callq	0x14590379b <.text+0x590279b>
1401f7401:     	nop
1401f7402:     	jmp	0x1401f7411 <.text+0x1f6411>
1401f7404:     	movq	0x2a0(%rbp), %rdx
1401f740b:     	callq	0x14590379b <.text+0x590279b>
1401f7410:     	nop
1401f7411:     	ud2
1401f7413:     	movq	%rdx, 0x798(%rbp)
1401f741a:     	movl	$0x1, %ecx
1401f741f:     	movq	%rcx, 0x750(%rbp)
1401f7426:     	movb	$0x1, %cl
1401f7428:     	movl	%ecx, 0x768(%rbp)
1401f742e:     	movq	%r13, 0x780(%rbp)
1401f7435:     	je	0x1401f7517 <.text+0x1f6517>
1401f743b:     	movq	0x10(%rax), %rax
1401f743f:     	movq	%rax, 0x790(%rbp)
1401f7446:     	callq	0x140002200 <.text+0x1200>
1401f744b:     	movl	$0x1, %edx
1401f7450:     	movq	0x798(%rbp), %r13
1401f7457:     	movq	%r13, %rcx
1401f745a:     	callq	0x1400021c0 <.text+0x11c0>
1401f745f:     	movq	%r13, %rdx
1401f7462:     	movl	$0x1, %ecx
1401f7467:     	movq	%rax, 0x788(%rbp)
1401f746e:     	testq	%rax, %rax
1401f7471:     	je	0x1401f4d1f <.text+0x1f3d1f>
1401f7477:     	movq	0x788(%rbp), %rcx
1401f747e:     	movq	%rdx, %r8
1401f7481:     	movq	0x790(%rbp), %rdx
1401f7488:     	callq	0x1457731ed <.text+0x57721ed>
1401f748d:     	movl	$0x1, %eax
1401f7492:     	movq	%rax, 0x750(%rbp)
1401f7499:     	movq	$0x0, 0x790(%rbp)
1401f74a4:     	jmp	0x1401f7539 <.text+0x1f6539>
1401f74a9:     	movq	%rsi, 0x748(%rbp)
1401f74b0:     	movq	%rdx, 0x770(%rbp)
1401f74b7:     	je	0x1401f4e03 <.text+0x1f3e03>
1401f74bd:     	movq	0x10(%rax), %rax
1401f74c1:     	movq	%rax, 0x760(%rbp)
1401f74c8:     	callq	0x140002200 <.text+0x1200>
1401f74cd:     	movl	$0x1, %esi
1401f74d2:     	movl	$0x1, %edx
1401f74d7:     	movq	0x770(%rbp), %r13
1401f74de:     	movq	%r13, %rcx
1401f74e1:     	callq	0x1400021c0 <.text+0x11c0>
1401f74e6:     	movq	%r13, %rdx
1401f74e9:     	testq	%rax, %rax
1401f74ec:     	je	0x1401f4dee <.text+0x1f3dee>
1401f74f2:     	movq	%rax, %r13
1401f74f5:     	movq	%rax, %rcx
1401f74f8:     	movq	0x760(%rbp), %rdx
1401f74ff:     	movq	0x770(%rbp), %r8
1401f7506:     	callq	0x1457731ed <.text+0x57721ed>
1401f750b:     	movq	0x770(%rbp), %rax
1401f7512:     	jmp	0x1401f4e05 <.text+0x1f3e05>
1401f7517:     	movq	$0x0, 0x790(%rbp)
1401f7522:     	movq	$0x0, 0x798(%rbp)
1401f752d:     	movl	$0x1, %eax
1401f7532:     	movq	%rax, 0x788(%rbp)
1401f7539:     	movq	0x780(%rbp), %r13
1401f7540:     	jmp	0x1401f4d8b <.text+0x1f3d8b>

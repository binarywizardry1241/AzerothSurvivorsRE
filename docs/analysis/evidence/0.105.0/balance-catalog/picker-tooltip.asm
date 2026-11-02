
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14007e870:     	pushq	%rbp
14007e871:     	pushq	%r15
14007e873:     	pushq	%r14
14007e875:     	pushq	%r13
14007e877:     	pushq	%r12
14007e879:     	pushq	%rsi
14007e87a:     	pushq	%rdi
14007e87b:     	pushq	%rbx
14007e87c:     	subq	$0x188, %rsp            # imm = 0x188
14007e883:     	leaq	0x80(%rsp), %rbp
14007e88b:     	movaps	%xmm6, 0xf0(%rbp)
14007e892:     	movq	$-0x2, 0xe8(%rbp)
14007e89d:     	movq	%rdx, %rbx
14007e8a0:     	movq	%rcx, %rsi
14007e8a3:     	movq	%r8, %rcx
14007e8a6:     	movq	%r9, %rdx
14007e8a9:     	callq	0x145875720 <.text+0x5874720>
14007e8ae:     	movq	%rax, %rdi
14007e8b1:     	xorps	%xmm0, %xmm0
14007e8b4:     	movups	%xmm0, (%rbp)
14007e8b8:     	movq	$0x0, 0x10(%rbp)
14007e8c0:     	movq	%rax, -0x8(%rbp)
14007e8c4:     	movl	$0x1, 0x18(%rbp)
14007e8cb:     	movsd	0x5cf544d(%rip), %xmm0  # 0x145d73d20
14007e8d3:     	movsd	%xmm0, 0x1c(%rbp)
14007e8d8:     	movq	$0x3f800000, 0x24(%rbp) # imm = 0x3F800000
14007e8e0:     	movsd	0x5cf23b8(%rip), %xmm0  # 0x145d70ca0
14007e8e8:     	movups	%xmm0, 0x2c(%rbp)
14007e8ec:     	movsd	0x5cf23ac(%rip), %xmm0  # 0x145d70ca0
14007e8f4:     	movsd	%xmm0, 0x3c(%rbp)
14007e8f9:     	movl	$0x0, 0x44(%rbp)
14007e900:     	movaps	0x5cf5429(%rip), %xmm1  # 0x145d73d30
14007e907:     	movups	%xmm1, 0x48(%rbp)
14007e90b:     	movsd	%xmm0, 0x58(%rbp)
14007e910:     	leaq	-0x58(%rbp), %rcx
14007e914:     	xorps	%xmm2, %xmm2
14007e917:     	movq	%rbx, %rdx
14007e91a:     	callq	0x14592f0d0 <.text+0x592e0d0>
14007e91f:     	movzbl	0x74(%rdi), %ecx
14007e923:     	callq	0x14596e450 <.text+0x596d450>
14007e928:     	movq	%rdx, %rbx
14007e92b:     	testq	%rdx, %rdx
14007e92e:     	jns	0x14007e940 <.text+0x7d940>
14007e930:     	xorl	%r12d, %r12d
14007e933:     	movq	%r12, %rcx
14007e936:     	movq	%rbx, %rdx
14007e939:     	callq	0x145d6944b <.text+0x5d6844b>
14007e93e:     	ud2
14007e940:     	je	0x14007e975 <.text+0x7d975>
14007e942:     	movq	%rax, %r15
14007e945:     	callq	0x140002200 <.text+0x1200>
14007e94a:     	movl	$0x1, %r12d
14007e950:     	movl	$0x1, %edx
14007e955:     	movq	%rbx, %rcx
14007e958:     	callq	0x1400021c0 <.text+0x11c0>
14007e95d:     	testq	%rax, %rax
14007e960:     	je	0x14007e933 <.text+0x7d933>
14007e962:     	movq	%rax, %r14
14007e965:     	movq	%rax, %rcx
14007e968:     	movq	%r15, %rdx
14007e96b:     	movq	%rbx, %r8
14007e96e:     	callq	0x145bc977b <.text+0x5bc877b>
14007e973:     	jmp	0x14007e97b <.text+0x7d97b>
14007e975:     	movl	$0x1, %r14d
14007e97b:     	movq	%rbx, 0xc0(%rbp)
14007e982:     	movq	%r14, 0xc8(%rbp)
14007e989:     	movq	%rbx, 0xd0(%rbp)
14007e990:     	movss	0x48(%rdi), %xmm6
14007e995:     	xorps	%xmm0, %xmm0
14007e998:     	ucomiss	%xmm0, %xmm6
14007e99b:     	jbe	0x14007eb68 <.text+0x7db68>
14007e9a1:     	mulss	0x5cf5397(%rip), %xmm6  # 0x145d73d40
14007e9a9:     	mulss	-0x50(%rbp), %xmm6
14007e9ae:     	maxss	0x5cf538e(%rip), %xmm6  # 0x145d73d44
14007e9b6:     	movss	%xmm6, 0xb4(%rbp)
14007e9be:     	movaps	%xmm6, %xmm0
14007e9c1:     	callq	0x145bc97b7 <.text+0x5bc87b7>
14007e9c6:     	subss	%xmm0, %xmm6
14007e9ca:     	movss	0x5cf5376(%rip), %xmm0  # 0x145d73d48
14007e9d2:     	leaq	0xb4(%rbp), %rax
14007e9d9:     	ucomiss	%xmm6, %xmm0
14007e9dc:     	jbe	0x14007ea14 <.text+0x7da14>
14007e9de:     	movq	%rax, 0x98(%rbp)
14007e9e5:     	leaq	0x5b2e894(%rip), %rax   # 0x145bad280 <.text+0x5bac280>
14007e9ec:     	movq	%rax, 0xa0(%rbp)
14007e9f3:     	movb	$0x1, 0xe7(%rbp)
14007e9fa:     	leaq	0x5d199af(%rip), %rdx   # 0x145d983b0
14007ea01:     	leaq	0x78(%rbp), %rcx
14007ea05:     	leaq	0x98(%rbp), %r8
14007ea0c:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14007ea11:     	nop
14007ea12:     	jmp	0x14007ea48 <.text+0x7da48>
14007ea14:     	movq	%rax, 0x98(%rbp)
14007ea1b:     	leaq	0x5b2e85e(%rip), %rax   # 0x145bad280 <.text+0x5bac280>
14007ea22:     	movq	%rax, 0xa0(%rbp)
14007ea29:     	movb	$0x1, 0xe7(%rbp)
14007ea30:     	leaq	0x5d19971(%rip), %rdx   # 0x145d983a8
14007ea37:     	leaq	0x78(%rbp), %rcx
14007ea3b:     	leaq	0x98(%rbp), %r8
14007ea42:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14007ea47:     	nop
14007ea48:     	movups	0x78(%rbp), %xmm0
14007ea4c:     	movaps	%xmm0, 0x60(%rbp)
14007ea50:     	movq	0x88(%rbp), %rax
14007ea57:     	movq	%rax, 0x70(%rbp)
14007ea5b:     	movq	$0x1, 0x20(%rsp)
14007ea64:     	leaq	0xc0(%rbp), %rcx
14007ea6b:     	movl	$0x4, %r8d
14007ea71:     	movl	$0x1, %r9d
14007ea77:     	movq	%rbx, %rdx
14007ea7a:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14007ea7f:     	nop
14007ea80:     	movq	0xc8(%rbp), %r14
14007ea87:     	movq	0xd0(%rbp), %rbx
14007ea8e:     	movl	$0x20b7c220, (%r14,%rbx) # imm = 0x20B7C220
14007ea96:     	addq	$0x4, %rbx
14007ea9a:     	movq	%rbx, 0xd0(%rbp)
14007eaa1:     	leaq	0x5d19930(%rip), %rax   # 0x145d983d8
14007eaa8:     	movq	%rax, 0x78(%rbp)
14007eaac:     	movq	$0x1, 0x80(%rbp)
14007eab7:     	leaq	0x60(%rbp), %rax
14007eabb:     	movq	%rax, 0x88(%rbp)
14007eac2:     	leaq	0x5d198ef(%rip), %rax   # 0x145d983b8
14007eac9:     	movq	%rax, 0x90(%rbp)
14007ead0:     	movq	$0x1, 0x20(%rsp)
14007ead9:     	leaq	0x5d198f9(%rip), %rdx   # 0x145d983d9
14007eae0:     	leaq	0x98(%rbp), %rcx
14007eae7:     	leaq	0x78(%rbp), %r9
14007eaeb:     	movl	$0x13, %r8d
14007eaf1:     	callq	0x1458da540 <.text+0x58d9540>
14007eaf6:     	nop
14007eaf7:     	movq	0xa0(%rbp), %r12
14007eafe:     	movq	0xa8(%rbp), %r15
14007eb05:     	movq	0xc0(%rbp), %rax
14007eb0c:     	subq	%rbx, %rax
14007eb0f:     	cmpq	%rax, %r15
14007eb12:     	ja	0x14007ecfa <.text+0x7dcfa>
14007eb18:     	testq	%r15, %r15
14007eb1b:     	je	0x14007eb2c <.text+0x7db2c>
14007eb1d:     	leaq	(%r14,%rbx), %rcx
14007eb21:     	movq	%r12, %rdx
14007eb24:     	movq	%r15, %r8
14007eb27:     	callq	0x145bc977b <.text+0x5bc877b>
14007eb2c:     	addq	%r15, %rbx
14007eb2f:     	movq	%rbx, 0xd0(%rbp)
14007eb36:     	movq	0x98(%rbp), %rdx
14007eb3d:     	testq	%rdx, %rdx
14007eb40:     	je	0x14007eb50 <.text+0x7db50>
14007eb42:     	movl	$0x1, %r8d
14007eb48:     	movq	%r12, %rcx
14007eb4b:     	callq	0x1400021d0 <.text+0x11d0>
14007eb50:     	movq	0x60(%rbp), %rdx
14007eb54:     	testq	%rdx, %rdx
14007eb57:     	je	0x14007eb68 <.text+0x7db68>
14007eb59:     	movq	0x68(%rbp), %rcx
14007eb5d:     	movl	$0x1, %r8d
14007eb63:     	callq	0x1400021d0 <.text+0x11d0>
14007eb68:     	movq	0x170(%rbp), %rax
14007eb6f:     	testq	%rax, %rax
14007eb72:     	je	0x14007ec13 <.text+0x7dc13>
14007eb78:     	movq	0x178(%rbp), %rcx
14007eb7f:     	movq	%rax, 0x60(%rbp)
14007eb83:     	movq	%rcx, 0x68(%rbp)
14007eb87:     	leaq	0x60(%rbp), %rax
14007eb8b:     	movq	%rax, 0x98(%rbp)
14007eb92:     	leaq	-0x7cad9(%rip), %rax    # 0x1400020c0 <.text+0x10c0>
14007eb99:     	movq	%rax, 0xa0(%rbp)
14007eba0:     	movb	$0x1, 0xe7(%rbp)
14007eba7:     	leaq	0x5d1983e(%rip), %rdx   # 0x145d983ec
14007ebae:     	leaq	0x78(%rbp), %rcx
14007ebb2:     	leaq	0x98(%rbp), %r8
14007ebb9:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14007ebbe:     	nop
14007ebbf:     	movq	0x78(%rbp), %r12
14007ebc3:     	movq	0x80(%rbp), %r13
14007ebca:     	movq	0x88(%rbp), %r15
14007ebd1:     	movq	0xc0(%rbp), %rax
14007ebd8:     	subq	%rbx, %rax
14007ebdb:     	cmpq	%rax, %r15
14007ebde:     	ja	0x14007eca9 <.text+0x7dca9>
14007ebe4:     	testq	%r15, %r15
14007ebe7:     	je	0x14007ebfa <.text+0x7dbfa>
14007ebe9:     	addq	%rbx, %r14
14007ebec:     	movq	%r14, %rcx
14007ebef:     	movq	%r13, %rdx
14007ebf2:     	movq	%r15, %r8
14007ebf5:     	callq	0x145bc977b <.text+0x5bc877b>
14007ebfa:     	testq	%r12, %r12
14007ebfd:     	je	0x14007ec10 <.text+0x7dc10>
14007ebff:     	movl	$0x1, %r8d
14007ec05:     	movq	%r13, %rcx
14007ec08:     	movq	%r12, %rdx
14007ec0b:     	callq	0x1400021d0 <.text+0x11d0>
14007ec10:     	addq	%r15, %rbx
14007ec13:     	movb	$0x1, 0xe7(%rbp)
14007ec1a:     	movq	%rdi, %rcx
14007ec1d:     	callq	0x1458744e0 <.text+0x58734e0>
14007ec22:     	nop
14007ec23:     	movq	%rax, %rdi
14007ec26:     	movq	%rdx, %r14
14007ec29:     	movq	0xc0(%rbp), %rax
14007ec30:     	movq	%rax, 0xd8(%rbp)
14007ec37:     	movq	0xc8(%rbp), %rax
14007ec3e:     	movq	%rax, 0xb8(%rbp)
14007ec45:     	leaq	0x78(%rbp), %rcx
14007ec49:     	leaq	-0x8(%rbp), %rdx
14007ec4d:     	leaq	-0x58(%rbp), %r8
14007ec51:     	callq	0x145987260 <.text+0x5986260>
14007ec56:     	nop
14007ec57:     	movq	%rdi, 0x30(%rsi)
14007ec5b:     	movq	%r14, 0x38(%rsi)
14007ec5f:     	movq	0xd8(%rbp), %rax
14007ec66:     	movq	%rax, (%rsi)
14007ec69:     	movq	0xb8(%rbp), %rax
14007ec70:     	movq	%rax, 0x8(%rsi)
14007ec74:     	movq	%rbx, 0x10(%rsi)
14007ec78:     	movups	0x78(%rbp), %xmm0
14007ec7c:     	movups	%xmm0, 0x18(%rsi)
14007ec80:     	movq	0x88(%rbp), %rax
14007ec87:     	movq	%rax, 0x28(%rsi)
14007ec8b:     	movq	%rsi, %rax
14007ec8e:     	movaps	0xf0(%rbp), %xmm6
14007ec95:     	addq	$0x188, %rsp            # imm = 0x188
14007ec9c:     	popq	%rbx
14007ec9d:     	popq	%rdi
14007ec9e:     	popq	%rsi
14007ec9f:     	popq	%r12
14007eca1:     	popq	%r13
14007eca3:     	popq	%r14
14007eca5:     	popq	%r15
14007eca7:     	popq	%rbp
14007eca8:     	retq
14007eca9:     	movq	%r13, 0xb8(%rbp)
14007ecb0:     	movq	%r12, 0xd8(%rbp)
14007ecb7:     	movq	$0x1, 0x20(%rsp)
14007ecc0:     	leaq	0xc0(%rbp), %rcx
14007ecc7:     	movl	$0x1, %r9d
14007eccd:     	movq	%rbx, %rdx
14007ecd0:     	movq	%r15, %r8
14007ecd3:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14007ecd8:     	nop
14007ecd9:     	movq	0xc8(%rbp), %r14
14007ece0:     	movq	0xd0(%rbp), %rbx
14007ece7:     	movq	0xd8(%rbp), %r12
14007ecee:     	movq	0xb8(%rbp), %r13
14007ecf5:     	jmp	0x14007ebe9 <.text+0x7dbe9>
14007ecfa:     	movq	%r12, 0xd8(%rbp)
14007ed01:     	movq	$0x1, 0x20(%rsp)
14007ed0a:     	leaq	0xc0(%rbp), %rcx
14007ed11:     	movl	$0x1, %r9d
14007ed17:     	movq	%rbx, %rdx
14007ed1a:     	movq	%r15, %r8
14007ed1d:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14007ed22:     	nop
14007ed23:     	movq	0xc8(%rbp), %r14
14007ed2a:     	movq	0xd0(%rbp), %rbx
14007ed31:     	movq	0xd8(%rbp), %r12
14007ed38:     	jmp	0x14007eb1d <.text+0x7db1d>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401b8700:     	pushq	%rbp
1401b8701:     	pushq	%r15
1401b8703:     	pushq	%r14
1401b8705:     	pushq	%r13
1401b8707:     	pushq	%r12
1401b8709:     	pushq	%rsi
1401b870a:     	pushq	%rdi
1401b870b:     	pushq	%rbx
1401b870c:     	subq	$0x968, %rsp            # imm = 0x968
1401b8713:     	leaq	0x80(%rsp), %rbp
1401b871b:     	movaps	%xmm15, 0x8d0(%rbp)
1401b8723:     	movaps	%xmm14, 0x8c0(%rbp)
1401b872b:     	movaps	%xmm13, 0x8b0(%rbp)
1401b8733:     	movaps	%xmm12, 0x8a0(%rbp)
1401b873b:     	movaps	%xmm11, 0x890(%rbp)
1401b8743:     	movaps	%xmm10, 0x880(%rbp)
1401b874b:     	movaps	%xmm9, 0x870(%rbp)
1401b8753:     	movaps	%xmm8, 0x860(%rbp)
1401b875b:     	movaps	%xmm7, 0x850(%rbp)
1401b8762:     	movaps	%xmm6, 0x840(%rbp)
1401b8769:     	movq	$-0x2, 0x838(%rbp)
1401b8774:     	movq	%rdx, %r14
1401b8777:     	movq	%rcx, %r12
1401b877a:     	movq	(%rcx), %r13
1401b877d:     	movq	0x28(%rcx), %rax
1401b8781:     	movq	%r13, 0xc0(%rbp)
1401b8788:     	leaq	0xc8(%rbp), %rdx
1401b878f:     	movups	0x8(%rcx), %xmm0
1401b8793:     	movups	%xmm0, 0xc8(%rbp)
1401b879a:     	movups	0x18(%rcx), %xmm0
1401b879e:     	movups	%xmm0, 0xd8(%rbp)
1401b87a5:     	movq	%rax, 0xe8(%rbp)
1401b87ac:     	xorps	%xmm0, %xmm0
1401b87af:     	movups	%xmm0, 0x610(%rbp)
1401b87b6:     	movups	%xmm0, 0x638(%rbp)
1401b87bd:     	movups	%xmm0, 0x648(%rbp)
1401b87c4:     	movq	$0x0, 0x658(%rbp)
1401b87cf:     	movups	0x5c000aa(%rip), %xmm6  # 0x145db8880
1401b87d6:     	movaps	%xmm6, 0x180(%rbp)
1401b87dd:     	movq	$0x0, 0x190(%rbp)
1401b87e8:     	movups	0x5c000a9(%rip), %xmm7  # 0x145db8898
1401b87ef:     	movups	%xmm7, 0x198(%rbp)
1401b87f6:     	movq	$0x0, 0x1a8(%rbp)
1401b8801:     	movups	0x5c000a7(%rip), %xmm8  # 0x145db88b0
1401b8809:     	movaps	%xmm8, 0x1b0(%rbp)
1401b8811:     	movq	$0x0, 0x1c0(%rbp)
1401b881c:     	movups	0x5c000a4(%rip), %xmm9  # 0x145db88c8
1401b8824:     	movups	%xmm9, 0x1c8(%rbp)
1401b882c:     	movq	$0x0, 0x1d8(%rbp)
1401b8837:     	movq	0x1d0(%rbp), %rax
1401b883e:     	movq	%rax, 0x5f8(%rbp)
1401b8845:     	movq	0x1d8(%rbp), %rax
1401b884c:     	movq	%rax, 0x600(%rbp)
1401b8853:     	movq	0x1c0(%rbp), %rax
1401b885a:     	movq	%rax, 0x5e8(%rbp)
1401b8861:     	movq	0x1c8(%rbp), %rax
1401b8868:     	movq	%rax, 0x5f0(%rbp)
1401b886f:     	movaps	0x180(%rbp), %xmm0
1401b8876:     	movaps	0x190(%rbp), %xmm1
1401b887d:     	movaps	0x1a0(%rbp), %xmm2
1401b8884:     	movaps	0x1b0(%rbp), %xmm3
1401b888b:     	movups	%xmm3, 0x5d8(%rbp)
1401b8892:     	movups	%xmm2, 0x5c8(%rbp)
1401b8899:     	movups	%xmm1, 0x5b8(%rbp)
1401b88a0:     	movups	%xmm0, 0x5a8(%rbp)
1401b88a7:     	movq	$0x0, 0x608(%rbp)
1401b88b2:     	movsd	0x5bff476(%rip), %xmm0  # 0x145db7d30
1401b88ba:     	movups	%xmm0, 0x620(%rbp)
1401b88c1:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
1401b88cb:     	movq	%rax, 0x630(%rbp)
1401b88d2:     	movups	0x5c0006e(%rip), %xmm12 # 0x145db8948
1401b88da:     	movups	%xmm12, 0x670(%rbp)
1401b88e2:     	movups	0x5c0004f(%rip), %xmm0  # 0x145db8938
1401b88e9:     	movups	%xmm0, 0x660(%rbp)
1401b88f0:     	movups	0x5c00070(%rip), %xmm15 # 0x145db8968
1401b88f8:     	movups	%xmm15, 0x690(%rbp)
1401b8900:     	movups	0x5c00051(%rip), %xmm0  # 0x145db8958
1401b8907:     	movups	%xmm0, 0x680(%rbp)
1401b890e:     	movups	0x5c00073(%rip), %xmm0  # 0x145db8988
1401b8915:     	movups	%xmm0, 0x6b0(%rbp)
1401b891c:     	movups	0x5c00055(%rip), %xmm0  # 0x145db8978
1401b8923:     	movups	%xmm0, 0x6a0(%rbp)
1401b892a:     	movups	0x5c00077(%rip), %xmm0  # 0x145db89a8
1401b8931:     	movups	%xmm0, 0x6d0(%rbp)
1401b8938:     	movups	0x5c00058(%rip), %xmm11 # 0x145db8998
1401b8940:     	movups	%xmm11, 0x6c0(%rbp)
1401b8948:     	movaps	0x5bbb4b1(%rip), %xmm0  # 0x145d73e00
1401b894f:     	movups	%xmm0, 0x6e0(%rbp)
1401b8956:     	movl	$0x1, 0x6f0(%rbp)
1401b8960:     	movq	$0x0, 0x6f4(%rbp)
1401b896b:     	movb	$0x1, 0x6fc(%rbp)
1401b8972:     	movq	$0x0, 0x700(%rbp)
1401b897d:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
1401b8987:     	movw	$0x0, 0x70c(%rbp)
1401b8990:     	movw	$0x0, 0x712(%rbp)
1401b8999:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
1401b89a3:     	movw	$0x0, 0x718(%rbp)
1401b89ac:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
1401b89b6:     	movabsq	$0x100000100, %rax      # imm = 0x100000100
1401b89c0:     	movq	%rax, 0x71a(%rbp)
1401b89c7:     	movl	$0x5, 0x722(%rbp)
1401b89d1:     	movq	%r13, 0x5a0(%rbp)
1401b89d8:     	leaq	0x4b0(%rbp), %rcx
1401b89df:     	leaq	0x5a0(%rbp), %r8
1401b89e6:     	callq	0x140189f40 <.text+0x188f40>
1401b89eb:     	movq	(%r14), %rsi
1401b89ee:     	movq	0x4b0(%rbp), %rbx
1401b89f5:     	movq	0x4d8(%rbp), %rax
1401b89fc:     	movq	%rbx, 0x410(%rbp)
1401b8a03:     	movups	0x4b8(%rbp), %xmm0
1401b8a0a:     	movups	%xmm0, 0x418(%rbp)
1401b8a11:     	movups	0x4c8(%rbp), %xmm0
1401b8a18:     	movups	%xmm0, 0x428(%rbp)
1401b8a1f:     	movq	%rax, 0x438(%rbp)
1401b8a26:     	callq	0x140002200 <.text+0x1200>
1401b8a2b:     	movl	$0x5, %ecx
1401b8a30:     	movl	$0x1, %edx
1401b8a35:     	callq	0x1400021c0 <.text+0x11c0>
1401b8a3a:     	testq	%rax, %rax
1401b8a3d:     	je	0x1401bb922 <.text+0x1ba922>
1401b8a43:     	movb	$0x30, 0x4(%rax)
1401b8a47:     	movl	$0x303a3030, (%rax)     # imm = 0x303A3030
1401b8a4d:     	cmpb	$0x1, (%rsi)
1401b8a50:     	jne	0x1401b8a71 <.text+0x1b7a71>
1401b8a52:     	movl	0x1(%rsi), %ecx
1401b8a55:     	movl	0x4(%rsi), %edx
1401b8a58:     	movl	%edx, 0x183(%rbp)
1401b8a5e:     	movl	%ecx, 0x180(%rbp)
1401b8a64:     	movq	0x8(%rsi), %rcx
1401b8a68:     	movzbl	0x10(%rsi), %r8d
1401b8a6d:     	movb	$0x1, %dl
1401b8a6f:     	jmp	0x1401b8a81 <.text+0x1b7a81>
1401b8a71:     	movq	0x8(%rsi), %rcx
1401b8a75:     	lock
1401b8a76:     	incq	(%rcx)
1401b8a79:     	jle	0x1401bb943 <.text+0x1ba943>
1401b8a7f:     	xorl	%edx, %edx
1401b8a81:     	leaq	0x418(%rbp), %r15
1401b8a88:     	movl	0x180(%rbp), %r9d
1401b8a8f:     	movl	0x183(%rbp), %r10d
1401b8a96:     	movl	%r10d, 0x5dc(%rbp)
1401b8a9d:     	movl	%r9d, 0x5d9(%rbp)
1401b8aa4:     	movups	0x5bffd4d(%rip), %xmm0  # 0x145db87f8
1401b8aab:     	movups	%xmm0, 0x511(%rbp)
1401b8ab2:     	movl	$0x3f800000, 0x521(%rbp) # imm = 0x3F800000
1401b8abc:     	movq	$0x5, 0x5a8(%rbp)
1401b8ac7:     	movq	%rax, 0x5b0(%rbp)
1401b8ace:     	movq	$0x5, 0x5b8(%rbp)
1401b8ad9:     	movq	$0x0, 0x5c0(%rbp)
1401b8ae4:     	movq	$0x4, 0x5c8(%rbp)
1401b8aef:     	movq	$0x0, 0x5d0(%rbp)
1401b8afa:     	movb	%dl, 0x5d8(%rbp)
1401b8b00:     	movq	%rcx, 0x5e0(%rbp)
1401b8b07:     	movq	%r8, 0x5e8(%rbp)
1401b8b0e:     	movl	$0x42000000, 0x5f0(%rbp) # imm = 0x42000000
1401b8b18:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
1401b8b21:     	movb	$0x1, 0x5f6(%rbp)
1401b8b28:     	movq	0x51d(%rbp), %rax
1401b8b2f:     	movq	%rax, 0x604(%rbp)
1401b8b36:     	movups	0x510(%rbp), %xmm0
1401b8b3d:     	movups	%xmm0, 0x5f7(%rbp)
1401b8b44:     	movl	0x5bb579e(%rip), %edi   # 0x145d6e2e8
1401b8b4a:     	movl	%edi, 0x61c(%rbp)
1401b8b50:     	movups	0x5bb5781(%rip), %xmm0  # 0x145d6e2d8
1401b8b57:     	movups	%xmm0, 0x60c(%rbp)
1401b8b5e:     	movsd	0x5bb466a(%rip), %xmm0  # 0x145d6d1d0
1401b8b66:     	movsd	%xmm0, 0x620(%rbp)
1401b8b6e:     	movq	%rbx, 0x5a0(%rbp)
1401b8b75:     	leaq	0x180(%rbp), %rcx
1401b8b7c:     	leaq	0x5a0(%rbp), %r8
1401b8b83:     	movq	%r15, %rdx
1401b8b86:     	callq	0x140191c30 <.text+0x190c30>
1401b8b8b:     	cmpb	$0x1, (%rsi)
1401b8b8e:     	movq	%r14, 0x120(%rbp)
1401b8b95:     	jne	0x1401b8bb5 <.text+0x1b7bb5>
1401b8b97:     	movl	0x1(%rsi), %eax
1401b8b9a:     	movl	0x4(%rsi), %ecx
1401b8b9d:     	movl	%ecx, 0x183(%rbp)
1401b8ba3:     	movl	%eax, 0x180(%rbp)
1401b8ba9:     	movq	0x8(%rsi), %rax
1401b8bad:     	movzbl	0x10(%rsi), %edx
1401b8bb1:     	movb	$0x1, %cl
1401b8bb3:     	jmp	0x1401b8bc5 <.text+0x1b7bc5>
1401b8bb5:     	movq	0x8(%rsi), %rax
1401b8bb9:     	lock
1401b8bba:     	incq	(%rax)
1401b8bbd:     	jle	0x1401bb943 <.text+0x1ba943>
1401b8bc3:     	xorl	%ecx, %ecx
1401b8bc5:     	movl	0x180(%rbp), %r8d
1401b8bcc:     	movl	0x183(%rbp), %r9d
1401b8bd3:     	movl	%r9d, 0x5dc(%rbp)
1401b8bda:     	movl	%r8d, 0x5d9(%rbp)
1401b8be1:     	movups	0x5bffc53(%rip), %xmm13 # 0x145db883c
1401b8be9:     	movups	%xmm13, 0x511(%rbp)
1401b8bf1:     	movl	$0x3f800000, 0x521(%rbp) # imm = 0x3F800000
1401b8bfb:     	movq	$0x0, 0x5a8(%rbp)
1401b8c06:     	movq	$0x1, 0x5b0(%rbp)
1401b8c11:     	xorps	%xmm14, %xmm14
1401b8c15:     	movups	%xmm14, 0x5b8(%rbp)
1401b8c1d:     	movq	$0x4, 0x5c8(%rbp)
1401b8c28:     	movq	$0x0, 0x5d0(%rbp)
1401b8c33:     	movb	%cl, 0x5d8(%rbp)
1401b8c39:     	movq	%rax, 0x5e0(%rbp)
1401b8c40:     	movq	%rdx, 0x5e8(%rbp)
1401b8c47:     	movl	$0x41600000, 0x5f0(%rbp) # imm = 0x41600000
1401b8c51:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
1401b8c5a:     	movb	$0x1, 0x5f6(%rbp)
1401b8c61:     	movq	0x51d(%rbp), %rax
1401b8c68:     	movq	%rax, 0x604(%rbp)
1401b8c6f:     	movups	0x510(%rbp), %xmm0
1401b8c76:     	movups	%xmm0, 0x5f7(%rbp)
1401b8c7d:     	movl	%edi, 0x61c(%rbp)
1401b8c83:     	movups	0x5bb564e(%rip), %xmm0  # 0x145d6e2d8
1401b8c8a:     	movups	%xmm0, 0x60c(%rbp)
1401b8c91:     	movsd	0x5bb4537(%rip), %xmm0  # 0x145d6d1d0
1401b8c99:     	movsd	%xmm0, 0x620(%rbp)
1401b8ca1:     	movq	%rbx, 0x5a0(%rbp)
1401b8ca8:     	leaq	0x180(%rbp), %rcx
1401b8caf:     	leaq	0x5a0(%rbp), %r8
1401b8cb6:     	movq	%r15, %rdx
1401b8cb9:     	callq	0x140190460 <.text+0x18f460>
1401b8cbe:     	movaps	%xmm6, 0x5a0(%rbp)
1401b8cc5:     	movq	$0x0, 0x5b0(%rbp)
1401b8cd0:     	movups	%xmm7, 0x5b8(%rbp)
1401b8cd7:     	movq	$0x0, 0x5c8(%rbp)
1401b8ce2:     	movaps	%xmm8, 0x5d0(%rbp)
1401b8cea:     	movq	$0x0, 0x5e0(%rbp)
1401b8cf5:     	movups	%xmm9, 0x5e8(%rbp)
1401b8cfd:     	movq	$0x0, 0x5f8(%rbp)
1401b8d08:     	movaps	%xmm6, 0x180(%rbp)
1401b8d0f:     	movaps	%xmm8, 0x1b0(%rbp)
1401b8d17:     	movq	0x5b0(%rbp), %rax
1401b8d1e:     	movq	%rax, 0x190(%rbp)
1401b8d25:     	movq	0x5b8(%rbp), %rax
1401b8d2c:     	movq	%rax, 0x198(%rbp)
1401b8d33:     	movq	0x5c0(%rbp), %rax
1401b8d3a:     	movq	%rax, 0x1a0(%rbp)
1401b8d41:     	movq	0x5c8(%rbp), %rax
1401b8d48:     	movq	%rax, 0x1a8(%rbp)
1401b8d4f:     	movq	0x5e0(%rbp), %rax
1401b8d56:     	movq	%rax, 0x1c0(%rbp)
1401b8d5d:     	movq	0x5e8(%rbp), %rax
1401b8d64:     	movq	%rax, 0x1c8(%rbp)
1401b8d6b:     	movaps	0x5f0(%rbp), %xmm0
1401b8d72:     	movaps	%xmm0, 0x1d0(%rbp)
1401b8d79:     	movaps	%xmm14, 0x220(%rbp)
1401b8d81:     	movaps	%xmm14, 0x210(%rbp)
1401b8d89:     	movaps	%xmm14, 0x200(%rbp)
1401b8d91:     	movaps	%xmm14, 0x1f0(%rbp)
1401b8d99:     	movaps	%xmm14, 0x1e0(%rbp)
1401b8da1:     	movq	$0x0, 0x230(%rbp)
1401b8dac:     	leaq	0x5a8(%rbp), %rcx
1401b8db3:     	leaq	0x180(%rbp), %rdi
1401b8dba:     	movl	$0xb8, %r8d
1401b8dc0:     	movq	%rdi, %rdx
1401b8dc3:     	callq	0x145bc977b <.text+0x5bc877b>
1401b8dc8:     	movaps	0x5bb4541(%rip), %xmm0  # 0x145d6d310
1401b8dcf:     	movups	%xmm0, 0x660(%rbp)
1401b8dd6:     	movaps	0x5be2023(%rip), %xmm0  # 0x145d9ae00
1401b8ddd:     	movups	%xmm0, 0x670(%rbp)
1401b8de4:     	movups	0x5bffb6d(%rip), %xmm0  # 0x145db8958
1401b8deb:     	movups	%xmm0, 0x680(%rbp)
1401b8df2:     	movups	%xmm15, 0x690(%rbp)
1401b8dfa:     	movaps	%xmm7, %xmm9
1401b8dfe:     	movups	0x5bffb73(%rip), %xmm7  # 0x145db8978
1401b8e05:     	movups	%xmm7, 0x6a0(%rbp)
1401b8e0c:     	movups	0x5bffb74(%rip), %xmm10 # 0x145db8988
1401b8e14:     	movups	%xmm10, 0x6b0(%rbp)
1401b8e1c:     	movups	%xmm11, 0x6c0(%rbp)
1401b8e24:     	movups	0x5bffb7d(%rip), %xmm0  # 0x145db89a8
1401b8e2b:     	movups	%xmm0, 0x6d0(%rbp)
1401b8e32:     	movaps	0x5bb47a7(%rip), %xmm0  # 0x145d6d5e0
1401b8e39:     	movups	%xmm0, 0x6e0(%rbp)
1401b8e40:     	movl	$0x1, 0x6f0(%rbp)
1401b8e4a:     	movq	$0x0, 0x6f4(%rbp)
1401b8e55:     	movb	$0x1, 0x6fc(%rbp)
1401b8e5c:     	movq	$0x0, 0x700(%rbp)
1401b8e67:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
1401b8e71:     	movw	$0x0, 0x70c(%rbp)
1401b8e7a:     	movw	$0x0, 0x712(%rbp)
1401b8e83:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
1401b8e8d:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
1401b8e97:     	movw	$0x0, 0x718(%rbp)
1401b8ea0:     	movl	$0x0, 0x71a(%rbp)
1401b8eaa:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
1401b8eb4:     	movq	%rax, 0x71e(%rbp)
1401b8ebb:     	movq	%rbx, 0x5a0(%rbp)
1401b8ec2:     	leaq	0x510(%rbp), %rcx
1401b8ec9:     	leaq	0x5a0(%rbp), %r8
1401b8ed0:     	movq	%r15, %rdx
1401b8ed3:     	callq	0x140190ee0 <.text+0x18fee0>
1401b8ed8:     	movaps	%xmm6, 0x510(%rbp)
1401b8edf:     	movq	$0x0, 0x520(%rbp)
1401b8eea:     	movups	%xmm9, 0x528(%rbp)
1401b8ef2:     	movups	0x5bff9ce(%rip), %xmm9  # 0x145db88c8
1401b8efa:     	movq	$0x0, 0x538(%rbp)
1401b8f05:     	movaps	%xmm8, 0x540(%rbp)
1401b8f0d:     	movq	$0x0, 0x550(%rbp)
1401b8f18:     	movups	%xmm9, 0x558(%rbp)
1401b8f20:     	movq	$0x0, 0x568(%rbp)
1401b8f2b:     	movaps	%xmm6, 0x180(%rbp)
1401b8f32:     	movaps	%xmm8, 0x1b0(%rbp)
1401b8f3a:     	movq	0x520(%rbp), %rax
1401b8f41:     	movq	%rax, 0x190(%rbp)
1401b8f48:     	movq	0x528(%rbp), %rax
1401b8f4f:     	movq	%rax, 0x198(%rbp)
1401b8f56:     	movq	0x530(%rbp), %rax
1401b8f5d:     	movq	%rax, 0x1a0(%rbp)
1401b8f64:     	movq	0x538(%rbp), %rax
1401b8f6b:     	movq	%rax, 0x1a8(%rbp)
1401b8f72:     	movq	0x550(%rbp), %rax
1401b8f79:     	movq	%rax, 0x1c0(%rbp)
1401b8f80:     	movq	0x558(%rbp), %rax
1401b8f87:     	movq	%rax, 0x1c8(%rbp)
1401b8f8e:     	movaps	0x560(%rbp), %xmm0
1401b8f95:     	movaps	%xmm0, 0x1d0(%rbp)
1401b8f9c:     	movaps	%xmm14, 0x1e0(%rbp)
1401b8fa4:     	movups	%xmm14, 0x648(%rbp)
1401b8fac:     	movups	%xmm14, 0x638(%rbp)
1401b8fb4:     	movups	%xmm14, 0x628(%rbp)
1401b8fbc:     	movq	$0x0, 0x658(%rbp)
1401b8fc7:     	movq	$0x0, 0x71c(%rbp)
1401b8fd2:     	movw	$0x0, 0x724(%rbp)
1401b8fdb:     	movups	%xmm14, 0x411(%rbp)
1401b8fe3:     	movups	%xmm14, 0x608(%rbp)
1401b8feb:     	movaps	0x180(%rbp), %xmm0
1401b8ff2:     	movaps	0x190(%rbp), %xmm1
1401b8ff9:     	movaps	0x1a0(%rbp), %xmm2
1401b9000:     	movaps	0x1b0(%rbp), %xmm3
1401b9007:     	movups	%xmm0, 0x5a8(%rbp)
1401b900e:     	movups	%xmm1, 0x5b8(%rbp)
1401b9015:     	movups	%xmm2, 0x5c8(%rbp)
1401b901c:     	movups	%xmm3, 0x5d8(%rbp)
1401b9023:     	movaps	0x1c0(%rbp), %xmm0
1401b902a:     	movups	%xmm0, 0x5e8(%rbp)
1401b9031:     	movaps	0x1d0(%rbp), %xmm0
1401b9038:     	movups	%xmm0, 0x5f8(%rbp)
1401b903f:     	movaps	0x5bfecfa(%rip), %xmm0  # 0x145db7d40
1401b9046:     	movups	%xmm0, 0x618(%rbp)
1401b904d:     	movups	%xmm12, 0x670(%rbp)
1401b9055:     	movups	0x5bff8dc(%rip), %xmm0  # 0x145db8938
1401b905c:     	movups	%xmm0, 0x660(%rbp)
1401b9063:     	movaps	0x5bb4286(%rip), %xmm0  # 0x145d6d2f0
1401b906a:     	movups	%xmm0, 0x680(%rbp)
1401b9071:     	movaps	0x5bb4578(%rip), %xmm0  # 0x145d6d5f0
1401b9078:     	movups	%xmm0, 0x690(%rbp)
1401b907f:     	movups	%xmm10, 0x6b0(%rbp)
1401b9087:     	movups	%xmm7, 0x6a0(%rbp)
1401b908e:     	movaps	0x5bb43fb(%rip), %xmm0  # 0x145d6d490
1401b9095:     	movups	%xmm0, 0x6c0(%rbp)
1401b909c:     	movups	%xmm0, 0x6d0(%rbp)
1401b90a3:     	movaps	0x5bb41b6(%rip), %xmm0  # 0x145d6d260
1401b90aa:     	movups	%xmm0, 0x6e0(%rbp)
1401b90b1:     	movl	$0x1, 0x6f0(%rbp)
1401b90bb:     	movss	0x5be4c9d(%rip), %xmm0  # 0x145d9dd60
1401b90c3:     	movlps	%xmm0, 0x6f4(%rbp)
1401b90ca:     	movb	$0x1, 0x6fc(%rbp)
1401b90d1:     	movq	$0x0, 0x700(%rbp)
1401b90dc:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
1401b90e6:     	movw	$0x0, 0x70c(%rbp)
1401b90ef:     	movw	$0x0, 0x712(%rbp)
1401b90f8:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
1401b9102:     	movw	$0x0, 0x718(%rbp)
1401b910b:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
1401b9115:     	movw	$0x100, 0x71a(%rbp)     # imm = 0x100
1401b911e:     	movw	$0x0, 0x728(%rbp)
1401b9127:     	movb	$0x2, 0x72a(%rbp)
1401b912e:     	movzbl	0x420(%rbp), %eax
1401b9135:     	movb	%al, 0x73b(%rbp)
1401b913b:     	movups	0x410(%rbp), %xmm0
1401b9142:     	movups	%xmm0, 0x72b(%rbp)
1401b9149:     	movl	$0x3ee66666, 0x73c(%rbp) # imm = 0x3EE66666
1401b9153:     	movq	%r13, 0x5a0(%rbp)
1401b915a:     	leaq	0x4b0(%rbp), %rcx
1401b9161:     	leaq	0x5a0(%rbp), %r8
1401b9168:     	leaq	0xc8(%rbp), %rdx
1401b916f:     	callq	0x140190c30 <.text+0x18fc30>
1401b9174:     	movq	0x4b0(%rbp), %r14
1401b917b:     	movq	0x4d8(%rbp), %rax
1401b9182:     	movq	%r14, 0x410(%rbp)
1401b9189:     	movups	0x4b8(%rbp), %xmm0
1401b9190:     	movups	%xmm0, 0x418(%rbp)
1401b9197:     	movups	0x4c8(%rbp), %xmm0
1401b919e:     	movups	%xmm0, 0x428(%rbp)
1401b91a5:     	movq	%rax, 0x438(%rbp)
1401b91ac:     	leaq	0x5c000af(%rip), %rcx   # 0x145db9262
1401b91b3:     	movl	$0x9, %edx
1401b91b8:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401b91bd:     	movq	%rax, 0x180(%rbp)
1401b91c4:     	movq	%rdx, 0x188(%rbp)
1401b91cb:     	movq	%rdi, 0x5a0(%rbp)
1401b91d2:     	leaq	-0x1b7119(%rip), %r15   # 0x1400020c0 <.text+0x10c0>
1401b91d9:     	movq	%r15, 0x5a8(%rbp)
1401b91e0:     	leaq	0x5bff60d(%rip), %rdx   # 0x145db87f4
1401b91e7:     	leaq	0xf0(%rbp), %rcx
1401b91ee:     	leaq	0x5a0(%rbp), %r8
1401b91f5:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401b91fa:     	cmpb	$0x1, (%rsi)
1401b91fd:     	jne	0x1401b9222 <.text+0x1b8222>
1401b91ff:     	movaps	%xmm9, %xmm14
1401b9203:     	movl	0x1(%rsi), %eax
1401b9206:     	movl	0x4(%rsi), %ecx
1401b9209:     	movl	%ecx, 0x513(%rbp)
1401b920f:     	movl	%eax, 0x510(%rbp)
1401b9215:     	movq	0x8(%rsi), %rax
1401b9219:     	movzbl	0x10(%rsi), %r10d
1401b921e:     	movb	$0x1, %cl
1401b9220:     	jmp	0x1401b9236 <.text+0x1b8236>
1401b9222:     	movq	0x8(%rsi), %rax
1401b9226:     	lock
1401b9227:     	incq	(%rax)
1401b922a:     	jle	0x1401bb943 <.text+0x1ba943>
1401b9230:     	movaps	%xmm9, %xmm14
1401b9234:     	xorl	%ecx, %ecx
1401b9236:     	movaps	%xmm12, %xmm10
1401b923a:     	movups	0x5bff656(%rip), %xmm9  # 0x145db8898
1401b9242:     	leaq	0x418(%rbp), %rdx
1401b9249:     	movq	0x100(%rbp), %r8
1401b9250:     	movq	%r8, 0x5b8(%rbp)
1401b9257:     	movups	0xf0(%rbp), %xmm0
1401b925e:     	movups	%xmm0, 0x5a8(%rbp)
1401b9265:     	movl	0x510(%rbp), %r8d
1401b926c:     	movl	0x513(%rbp), %r9d
1401b9273:     	movl	%r8d, 0x5d9(%rbp)
1401b927a:     	movl	%r9d, 0x5dc(%rbp)
1401b9281:     	movups	%xmm13, 0x181(%rbp)
1401b9289:     	movl	$0x3f800000, 0x191(%rbp) # imm = 0x3F800000
1401b9293:     	movq	$0x0, 0x5c0(%rbp)
1401b929e:     	movq	$0x4, 0x5c8(%rbp)
1401b92a9:     	movq	$0x0, 0x5d0(%rbp)
1401b92b4:     	movb	%cl, 0x5d8(%rbp)
1401b92ba:     	movq	%rax, 0x5e0(%rbp)
1401b92c1:     	movq	%r10, 0x5e8(%rbp)
1401b92c8:     	movl	$0x41700000, 0x5f0(%rbp) # imm = 0x41700000
1401b92d2:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
1401b92db:     	movb	$0x1, 0x5f6(%rbp)
1401b92e2:     	movq	0x18d(%rbp), %rax
1401b92e9:     	movq	%rax, 0x604(%rbp)
1401b92f0:     	movups	0x180(%rbp), %xmm0
1401b92f7:     	movups	%xmm0, 0x5f7(%rbp)
1401b92fe:     	movl	0x5bb4fe4(%rip), %eax   # 0x145d6e2e8
1401b9304:     	movl	%eax, 0x61c(%rbp)
1401b930a:     	movups	0x5bb4fc7(%rip), %xmm0  # 0x145d6e2d8
1401b9311:     	movups	%xmm0, 0x60c(%rbp)
1401b9318:     	movsd	0x5bb3eb0(%rip), %xmm0  # 0x145d6d1d0
1401b9320:     	movsd	%xmm0, 0x620(%rbp)
1401b9328:     	movq	%r14, 0x5a0(%rbp)
1401b932f:     	leaq	0x510(%rbp), %rcx
1401b9336:     	leaq	0x5a0(%rbp), %r8
1401b933d:     	callq	0x14018ef20 <.text+0x18df20>
1401b9342:     	callq	0x140002200 <.text+0x1200>
1401b9347:     	movl	$0x1, %ecx
1401b934c:     	movl	$0x1, %edx
1401b9351:     	callq	0x1400021c0 <.text+0x11c0>
1401b9356:     	testq	%rax, %rax
1401b9359:     	movups	0x5bff5f7(%rip), %xmm15 # 0x145db8958
1401b9361:     	movups	0x5bff5d0(%rip), %xmm7  # 0x145db8938
1401b9368:     	je	0x1401bb911 <.text+0x1ba911>
1401b936e:     	movb	$0x30, (%rax)
1401b9371:     	cmpb	$0x1, (%rsi)
1401b9374:     	jne	0x1401b9395 <.text+0x1b8395>
1401b9376:     	movl	0x1(%rsi), %ecx
1401b9379:     	movl	0x4(%rsi), %edx
1401b937c:     	movl	%edx, 0x5a3(%rbp)
1401b9382:     	movl	%ecx, 0x5a0(%rbp)
1401b9388:     	movq	0x8(%rsi), %rcx
1401b938c:     	movzbl	0x10(%rsi), %edx
1401b9390:     	movb	$0x1, %r8b
1401b9393:     	jmp	0x1401b93a6 <.text+0x1b83a6>
1401b9395:     	movq	0x8(%rsi), %rcx
1401b9399:     	lock
1401b939a:     	incq	(%rcx)
1401b939d:     	jle	0x1401bb943 <.text+0x1ba943>
1401b93a3:     	xorl	%r8d, %r8d
1401b93a6:     	movq	%r13, %rdi
1401b93a9:     	movq	%r12, 0x128(%rbp)
1401b93b0:     	movq	$0x1, 0x180(%rbp)
1401b93bb:     	movq	%rax, 0x188(%rbp)
1401b93c2:     	movq	$0x1, 0x190(%rbp)
1401b93cd:     	movq	$0x0, 0x198(%rbp)
1401b93d8:     	movq	$0x4, 0x1a0(%rbp)
1401b93e3:     	movq	$0x0, 0x1a8(%rbp)
1401b93ee:     	movb	%r8b, 0x1b0(%rbp)
1401b93f5:     	movl	0x5a0(%rbp), %eax
1401b93fb:     	movl	0x5a3(%rbp), %r8d
1401b9402:     	movl	%eax, 0x1b1(%rbp)
1401b9408:     	movl	%r8d, 0x1b4(%rbp)
1401b940f:     	movq	%rcx, 0x1b8(%rbp)
1401b9416:     	movq	%rdx, 0x1c0(%rbp)
1401b941d:     	movl	$0x41880000, 0x1c8(%rbp) # imm = 0x41880000
1401b9427:     	movw	$0x190, 0x1cc(%rbp)     # imm = 0x190
1401b9430:     	movb	$0x1, 0x1ce(%rbp)
1401b9437:     	movups	0x5bff3ba(%rip), %xmm0  # 0x145db87f8
1401b943e:     	movups	%xmm0, 0x1d0(%rbp)
1401b9445:     	movl	$0x3f800000, 0x1e0(%rbp) # imm = 0x3F800000
1401b944f:     	movq	0x510(%rbp), %rax
1401b9456:     	movq	0x520(%rbp), %rcx
1401b945d:     	movq	%rax, 0x1e8(%rbp)
1401b9464:     	movb	$0x1, 0x837(%rbp)
1401b946b:     	callq	0x144e07d20 <.text+0x4e06d20>
1401b9470:     	nop
1401b9471:     	movq	%rax, %r12
1401b9474:     	movq	0x528(%rbp), %r13
1401b947b:     	testq	%r13, %r13
1401b947e:     	je	0x1401b9528 <.text+0x1b8528>
1401b9484:     	movups	0x1e0(%rbp), %xmm0
1401b948b:     	movaps	%xmm0, 0x600(%rbp)
1401b9492:     	movups	0x1d0(%rbp), %xmm0
1401b9499:     	movaps	%xmm0, 0x5f0(%rbp)
1401b94a0:     	movups	0x1c0(%rbp), %xmm0
1401b94a7:     	movaps	%xmm0, 0x5e0(%rbp)
1401b94ae:     	movups	0x180(%rbp), %xmm0
1401b94b5:     	movups	0x190(%rbp), %xmm1
1401b94bc:     	movups	0x1a0(%rbp), %xmm2
1401b94c3:     	movups	0x1b0(%rbp), %xmm3
1401b94ca:     	movaps	%xmm3, 0x5d0(%rbp)
1401b94d1:     	movaps	%xmm2, 0x5c0(%rbp)
1401b94d8:     	movaps	%xmm1, 0x5b0(%rbp)
1401b94df:     	movaps	%xmm0, 0x5a0(%rbp)
1401b94e6:     	movq	%r12, 0x610(%rbp)
1401b94ed:     	movq	(%r13), %rax
1401b94f1:     	movq	0x10(%r13), %rbx
1401b94f5:     	subq	%rbx, %rax
1401b94f8:     	cmpq	$0x7f, %rax
1401b94fc:     	ja	0x1401b95ad <.text+0x1b85ad>
1401b9502:     	movq	$0x1, 0x20(%rsp)
1401b950b:     	movl	$0x80, %r8d
1401b9511:     	movl	$0x1, %r9d
1401b9517:     	movq	%r13, %rcx
1401b951a:     	movq	%rbx, %rdx
1401b951d:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401b9522:     	nop
1401b9523:     	jmp	0x1401b95ad <.text+0x1b85ad>
1401b9528:     	movq	0x530(%rbp), %r13
1401b952f:     	movups	0x1e0(%rbp), %xmm0
1401b9536:     	movaps	%xmm0, 0x600(%rbp)
1401b953d:     	movups	0x1d0(%rbp), %xmm0
1401b9544:     	movaps	%xmm0, 0x5f0(%rbp)
1401b954b:     	movups	0x1c0(%rbp), %xmm0
1401b9552:     	movaps	%xmm0, 0x5e0(%rbp)
1401b9559:     	movups	0x180(%rbp), %xmm0
1401b9560:     	movups	0x190(%rbp), %xmm1
1401b9567:     	movups	0x1a0(%rbp), %xmm2
1401b956e:     	movups	0x1b0(%rbp), %xmm3
1401b9575:     	movaps	%xmm3, 0x5d0(%rbp)
1401b957c:     	movaps	%xmm2, 0x5c0(%rbp)
1401b9583:     	movaps	%xmm1, 0x5b0(%rbp)
1401b958a:     	movaps	%xmm0, 0x5a0(%rbp)
1401b9591:     	movq	%r12, 0x610(%rbp)
1401b9598:     	movq	(%r13), %rax
1401b959c:     	movq	0x10(%r13), %rbx
1401b95a0:     	subq	%rbx, %rax
1401b95a3:     	cmpq	$0x7f, %rax
1401b95a7:     	jbe	0x1401bb879 <.text+0x1ba879>
1401b95ad:     	movq	0x8(%r13), %rax
1401b95b1:     	leaq	0x71788(%rip), %rcx     # 0x14022ad40 <.text+0x229d40>
1401b95b8:     	movq	%rcx, (%rax,%rbx)
1401b95bc:     	movups	0x180(%rbp), %xmm0
1401b95c3:     	movups	0x190(%rbp), %xmm1
1401b95ca:     	movups	0x1a0(%rbp), %xmm2
1401b95d1:     	movups	0x1b0(%rbp), %xmm3
1401b95d8:     	movups	%xmm0, 0x8(%rax,%rbx)
1401b95dd:     	movups	%xmm1, 0x18(%rax,%rbx)
1401b95e2:     	movups	%xmm2, 0x28(%rax,%rbx)
1401b95e7:     	movups	%xmm3, 0x38(%rax,%rbx)
1401b95ec:     	movups	0x1c0(%rbp), %xmm0
1401b95f3:     	movups	%xmm0, 0x48(%rax,%rbx)
1401b95f8:     	movups	0x1d0(%rbp), %xmm0
1401b95ff:     	movups	%xmm0, 0x58(%rax,%rbx)
1401b9604:     	movups	0x1e0(%rbp), %xmm0
1401b960b:     	movups	%xmm0, 0x68(%rax,%rbx)
1401b9610:     	movq	%r12, 0x78(%rax,%rbx)
1401b9615:     	subq	$-0x80, %rbx
1401b9619:     	movq	%rbx, 0x10(%r13)
1401b961d:     	leaq	0x5bffc47(%rip), %rcx   # 0x145db926b
1401b9624:     	movl	$0x8, %edx
1401b9629:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401b962e:     	movq	%rax, 0x180(%rbp)
1401b9635:     	movq	%rdx, 0x188(%rbp)
1401b963c:     	leaq	0x180(%rbp), %rax
1401b9643:     	movq	%rax, 0x5a0(%rbp)
1401b964a:     	movq	%r15, 0x5a8(%rbp)
1401b9651:     	leaq	0x5bff19c(%rip), %rdx   # 0x145db87f4
1401b9658:     	leaq	0x130(%rbp), %rcx
1401b965f:     	leaq	0x5a0(%rbp), %r8
1401b9666:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401b966b:     	cmpb	$0x1, (%rsi)
1401b966e:     	movl	0x5bb4c73(%rip), %r12d  # 0x145d6e2e8
1401b9675:     	leaq	0x418(%rbp), %rdx
1401b967c:     	jne	0x1401b969d <.text+0x1b869d>
1401b967e:     	movl	0x1(%rsi), %eax
1401b9681:     	movl	0x4(%rsi), %ecx
1401b9684:     	movl	%ecx, 0x513(%rbp)
1401b968a:     	movl	%eax, 0x510(%rbp)
1401b9690:     	movq	0x8(%rsi), %rax
1401b9694:     	movzbl	0x10(%rsi), %r10d
1401b9699:     	movb	$0x1, %cl
1401b969b:     	jmp	0x1401b96ad <.text+0x1b86ad>
1401b969d:     	movq	0x8(%rsi), %rax
1401b96a1:     	lock
1401b96a2:     	incq	(%rax)
1401b96a5:     	jle	0x1401bb943 <.text+0x1ba943>
1401b96ab:     	xorl	%ecx, %ecx
1401b96ad:     	movq	0x140(%rbp), %r8
1401b96b4:     	movq	%r8, 0x5b8(%rbp)
1401b96bb:     	movups	0x130(%rbp), %xmm0
1401b96c2:     	movups	%xmm0, 0x5a8(%rbp)
1401b96c9:     	movl	0x510(%rbp), %r8d
1401b96d0:     	movl	0x513(%rbp), %r9d
1401b96d7:     	movl	%r8d, 0x5d9(%rbp)
1401b96de:     	movl	%r9d, 0x5dc(%rbp)
1401b96e5:     	movups	%xmm13, 0x181(%rbp)
1401b96ed:     	movl	$0x3f800000, 0x191(%rbp) # imm = 0x3F800000
1401b96f7:     	movq	$0x0, 0x5c0(%rbp)
1401b9702:     	movq	$0x4, 0x5c8(%rbp)
1401b970d:     	movq	$0x0, 0x5d0(%rbp)
1401b9718:     	movb	%cl, 0x5d8(%rbp)
1401b971e:     	movq	%rax, 0x5e0(%rbp)
1401b9725:     	movq	%r10, 0x5e8(%rbp)
1401b972c:     	movl	$0x41700000, 0x5f0(%rbp) # imm = 0x41700000
1401b9736:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
1401b973f:     	movb	$0x1, 0x5f6(%rbp)
1401b9746:     	movq	0x18d(%rbp), %rax
1401b974d:     	movq	%rax, 0x604(%rbp)
1401b9754:     	movups	0x180(%rbp), %xmm0
1401b975b:     	movups	%xmm0, 0x5f7(%rbp)
1401b9762:     	movl	%r12d, 0x61c(%rbp)
1401b9769:     	movups	0x5bb4b68(%rip), %xmm0  # 0x145d6e2d8
1401b9770:     	movups	%xmm0, 0x60c(%rbp)
1401b9777:     	movsd	0x5bb3a51(%rip), %xmm0  # 0x145d6d1d0
1401b977f:     	movsd	%xmm0, 0x620(%rbp)
1401b9787:     	movq	%r14, 0x5a0(%rbp)
1401b978e:     	leaq	0x510(%rbp), %rcx
1401b9795:     	leaq	0x5a0(%rbp), %r8
1401b979c:     	callq	0x14018ef20 <.text+0x18df20>
1401b97a1:     	callq	0x140002200 <.text+0x1200>
1401b97a6:     	movl	$0x1, %ecx
1401b97ab:     	movl	$0x1, %edx
1401b97b0:     	callq	0x1400021c0 <.text+0x11c0>
1401b97b5:     	testq	%rax, %rax
1401b97b8:     	je	0x1401bb911 <.text+0x1ba911>
1401b97be:     	movb	$0x30, (%rax)
1401b97c1:     	cmpb	$0x1, (%rsi)
1401b97c4:     	jne	0x1401b97e5 <.text+0x1b87e5>
1401b97c6:     	movl	0x1(%rsi), %ecx
1401b97c9:     	movl	0x4(%rsi), %edx
1401b97cc:     	movl	%edx, 0x5a3(%rbp)
1401b97d2:     	movl	%ecx, 0x5a0(%rbp)
1401b97d8:     	movq	0x8(%rsi), %rcx
1401b97dc:     	movzbl	0x10(%rsi), %edx
1401b97e0:     	movb	$0x1, %r8b
1401b97e3:     	jmp	0x1401b97f6 <.text+0x1b87f6>
1401b97e5:     	movq	0x8(%rsi), %rcx
1401b97e9:     	lock
1401b97ea:     	incq	(%rcx)
1401b97ed:     	jle	0x1401bb943 <.text+0x1ba943>
1401b97f3:     	xorl	%r8d, %r8d
1401b97f6:     	movq	$0x1, 0x180(%rbp)
1401b9801:     	movq	%rax, 0x188(%rbp)
1401b9808:     	movq	$0x1, 0x190(%rbp)
1401b9813:     	movq	$0x0, 0x198(%rbp)
1401b981e:     	movq	$0x4, 0x1a0(%rbp)
1401b9829:     	movq	$0x0, 0x1a8(%rbp)
1401b9834:     	movb	%r8b, 0x1b0(%rbp)
1401b983b:     	movl	0x5a0(%rbp), %eax
1401b9841:     	movl	0x5a3(%rbp), %r8d
1401b9848:     	movl	%eax, 0x1b1(%rbp)
1401b984e:     	movl	%r8d, 0x1b4(%rbp)
1401b9855:     	movq	%rcx, 0x1b8(%rbp)
1401b985c:     	movq	%rdx, 0x1c0(%rbp)
1401b9863:     	movl	$0x41880000, 0x1c8(%rbp) # imm = 0x41880000
1401b986d:     	movw	$0x190, 0x1cc(%rbp)     # imm = 0x190
1401b9876:     	movb	$0x1, 0x1ce(%rbp)
1401b987d:     	movups	0x5bfef74(%rip), %xmm0  # 0x145db87f8
1401b9884:     	movups	%xmm0, 0x1d0(%rbp)
1401b988b:     	movl	$0x3f800000, 0x1e0(%rbp) # imm = 0x3F800000
1401b9895:     	movq	0x510(%rbp), %rax
1401b989c:     	movq	0x520(%rbp), %rcx
1401b98a3:     	movq	%rax, 0x1e8(%rbp)
1401b98aa:     	movb	$0x1, 0x836(%rbp)
1401b98b1:     	callq	0x144e07d20 <.text+0x4e06d20>
1401b98b6:     	nop
1401b98b7:     	movq	%rax, %r14
1401b98ba:     	movq	0x528(%rbp), %r15
1401b98c1:     	movaps	%xmm8, %xmm13
1401b98c5:     	movaps	%xmm11, %xmm6
1401b98c9:     	testq	%r15, %r15
1401b98cc:     	je	0x1401b9975 <.text+0x1b8975>
1401b98d2:     	movups	0x1e0(%rbp), %xmm0
1401b98d9:     	movaps	%xmm0, 0x600(%rbp)
1401b98e0:     	movups	0x1d0(%rbp), %xmm0
1401b98e7:     	movaps	%xmm0, 0x5f0(%rbp)
1401b98ee:     	movups	0x1c0(%rbp), %xmm0
1401b98f5:     	movaps	%xmm0, 0x5e0(%rbp)
1401b98fc:     	movups	0x180(%rbp), %xmm0
1401b9903:     	movups	0x190(%rbp), %xmm1
1401b990a:     	movups	0x1a0(%rbp), %xmm2
1401b9911:     	movups	0x1b0(%rbp), %xmm3
1401b9918:     	movaps	%xmm3, 0x5d0(%rbp)
1401b991f:     	movaps	%xmm2, 0x5c0(%rbp)
1401b9926:     	movaps	%xmm1, 0x5b0(%rbp)
1401b992d:     	movaps	%xmm0, 0x5a0(%rbp)
1401b9934:     	movq	%r14, 0x610(%rbp)
1401b993b:     	movq	(%r15), %rax
1401b993e:     	movq	0x10(%r15), %rbx
1401b9942:     	subq	%rbx, %rax
1401b9945:     	cmpq	$0x7f, %rax
1401b9949:     	ja	0x1401b99f9 <.text+0x1b89f9>
1401b994f:     	movq	$0x1, 0x20(%rsp)
1401b9958:     	movl	$0x80, %r8d
1401b995e:     	movl	$0x1, %r9d
1401b9964:     	movq	%r15, %rcx
1401b9967:     	movq	%rbx, %rdx
1401b996a:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401b996f:     	nop
1401b9970:     	jmp	0x1401b99f9 <.text+0x1b89f9>
1401b9975:     	movq	0x530(%rbp), %r15
1401b997c:     	movups	0x1e0(%rbp), %xmm0
1401b9983:     	movaps	%xmm0, 0x600(%rbp)
1401b998a:     	movups	0x1d0(%rbp), %xmm0
1401b9991:     	movaps	%xmm0, 0x5f0(%rbp)
1401b9998:     	movups	0x1c0(%rbp), %xmm0
1401b999f:     	movaps	%xmm0, 0x5e0(%rbp)
1401b99a6:     	movups	0x180(%rbp), %xmm0
1401b99ad:     	movups	0x190(%rbp), %xmm1
1401b99b4:     	movups	0x1a0(%rbp), %xmm2
1401b99bb:     	movups	0x1b0(%rbp), %xmm3
1401b99c2:     	movaps	%xmm3, 0x5d0(%rbp)
1401b99c9:     	movaps	%xmm2, 0x5c0(%rbp)
1401b99d0:     	movaps	%xmm1, 0x5b0(%rbp)
1401b99d7:     	movaps	%xmm0, 0x5a0(%rbp)
1401b99de:     	movq	%r14, 0x610(%rbp)
1401b99e5:     	movq	(%r15), %rax
1401b99e8:     	movq	0x10(%r15), %rbx
1401b99ec:     	subq	%rbx, %rax
1401b99ef:     	cmpq	$0x7f, %rax
1401b99f3:     	jbe	0x1401bb89f <.text+0x1ba89f>
1401b99f9:     	movq	0x8(%r15), %rax
1401b99fd:     	leaq	0x7124c(%rip), %rcx     # 0x14022ac50 <.text+0x229c50>
1401b9a04:     	movq	%rcx, (%rax,%rbx)
1401b9a08:     	movups	0x180(%rbp), %xmm0
1401b9a0f:     	movups	0x190(%rbp), %xmm1
1401b9a16:     	movups	0x1a0(%rbp), %xmm2
1401b9a1d:     	movups	0x1b0(%rbp), %xmm3
1401b9a24:     	movups	%xmm0, 0x8(%rax,%rbx)
1401b9a29:     	movups	%xmm1, 0x18(%rax,%rbx)
1401b9a2e:     	movups	%xmm2, 0x28(%rax,%rbx)
1401b9a33:     	movups	%xmm3, 0x38(%rax,%rbx)
1401b9a38:     	movups	0x1c0(%rbp), %xmm0
1401b9a3f:     	movups	%xmm0, 0x48(%rax,%rbx)
1401b9a44:     	movups	0x1d0(%rbp), %xmm0
1401b9a4b:     	movups	%xmm0, 0x58(%rax,%rbx)
1401b9a50:     	movups	0x1e0(%rbp), %xmm0
1401b9a57:     	movups	%xmm0, 0x68(%rax,%rbx)
1401b9a5c:     	movq	%r14, 0x78(%rax,%rbx)
1401b9a61:     	subq	$-0x80, %rbx
1401b9a65:     	movq	%rbx, 0x10(%r15)
1401b9a69:     	movups	0x5bfee0f(%rip), %xmm8  # 0x145db8880
1401b9a71:     	movaps	%xmm8, 0x510(%rbp)
1401b9a79:     	movq	$0x0, 0x520(%rbp)
1401b9a84:     	movups	%xmm9, 0x528(%rbp)
1401b9a8c:     	movq	$0x0, 0x538(%rbp)
1401b9a97:     	movaps	%xmm13, 0x540(%rbp)
1401b9a9f:     	movq	$0x0, 0x550(%rbp)
1401b9aaa:     	movups	%xmm14, 0x558(%rbp)
1401b9ab2:     	movq	$0x0, 0x568(%rbp)
1401b9abd:     	movups	%xmm8, 0x185(%rbp)
1401b9ac5:     	movups	%xmm13, 0x1b5(%rbp)
1401b9acd:     	movq	0x520(%rbp), %rax
1401b9ad4:     	movq	%rax, 0x195(%rbp)
1401b9adb:     	movq	0x528(%rbp), %rax
1401b9ae2:     	movq	%rax, 0x19d(%rbp)
1401b9ae9:     	movq	0x530(%rbp), %rax
1401b9af0:     	movq	%rax, 0x1a5(%rbp)
1401b9af7:     	movq	0x538(%rbp), %rax
1401b9afe:     	movq	%rax, 0x1ad(%rbp)
1401b9b05:     	movq	0x550(%rbp), %rax
1401b9b0c:     	movq	%rax, 0x1c5(%rbp)
1401b9b13:     	movq	0x558(%rbp), %rax
1401b9b1a:     	movq	%rax, 0x1cd(%rbp)
1401b9b21:     	movaps	0x560(%rbp), %xmm0
1401b9b28:     	movups	%xmm0, 0x1d5(%rbp)
1401b9b2f:     	xorps	%xmm14, %xmm14
1401b9b33:     	movups	%xmm14, 0x650(%rbp)
1401b9b3b:     	movups	%xmm14, 0x640(%rbp)
1401b9b43:     	movups	%xmm14, 0x630(%rbp)
1401b9b4b:     	movq	$0x0, 0x660(%rbp)
1401b9b56:     	movl	$0x0, 0x727(%rbp)
1401b9b60:     	movl	$0x0, 0x72a(%rbp)
1401b9b6a:     	movw	$0x1, 0x5a8(%rbp)
1401b9b73:     	movb	$0x2, 0x5aa(%rbp)
1401b9b7a:     	movups	0x180(%rbp), %xmm0
1401b9b81:     	movups	%xmm0, 0x5ab(%rbp)
1401b9b88:     	movups	0x190(%rbp), %xmm0
1401b9b8f:     	movups	%xmm0, 0x5bb(%rbp)
1401b9b96:     	movups	0x1a0(%rbp), %xmm0
1401b9b9d:     	movups	%xmm0, 0x5cb(%rbp)
1401b9ba4:     	movups	0x1b0(%rbp), %xmm0
1401b9bab:     	movups	%xmm0, 0x5db(%rbp)
1401b9bb2:     	movups	0x1c0(%rbp), %xmm0
1401b9bb9:     	movups	%xmm0, 0x5eb(%rbp)
1401b9bc0:     	movups	0x1d0(%rbp), %xmm0
1401b9bc7:     	movups	%xmm0, 0x5fb(%rbp)
1401b9bce:     	movq	0x1dd(%rbp), %rax
1401b9bd5:     	movq	%rax, 0x608(%rbp)
1401b9bdc:     	movaps	0x5bba3cd(%rip), %xmm0  # 0x145d73fb0
1401b9be3:     	movups	%xmm0, 0x610(%rbp)
1401b9bea:     	movaps	0x5bfe15f(%rip), %xmm0  # 0x145db7d50
1401b9bf1:     	movups	%xmm0, 0x620(%rbp)
1401b9bf8:     	movups	%xmm10, 0x678(%rbp)
1401b9c00:     	movups	%xmm7, 0x668(%rbp)
1401b9c07:     	movups	0x5bfed5a(%rip), %xmm7  # 0x145db8968
1401b9c0e:     	movups	%xmm7, 0x698(%rbp)
1401b9c15:     	movups	%xmm15, 0x688(%rbp)
1401b9c1d:     	movaps	%xmm10, %xmm12
1401b9c21:     	movups	0x5bfed5f(%rip), %xmm10 # 0x145db8988
1401b9c29:     	movups	%xmm10, 0x6b8(%rbp)
1401b9c31:     	movups	0x5bfed3f(%rip), %xmm15 # 0x145db8978
1401b9c39:     	movups	%xmm15, 0x6a8(%rbp)
1401b9c41:     	movups	0x5bfed5f(%rip), %xmm11 # 0x145db89a8
1401b9c49:     	movups	%xmm11, 0x6d8(%rbp)
1401b9c51:     	movups	%xmm6, 0x6c8(%rbp)
1401b9c58:     	movaps	0x5bba1c1(%rip), %xmm0  # 0x145d73e20
1401b9c5f:     	movups	%xmm0, 0x6e8(%rbp)
1401b9c66:     	movl	$0x1, 0x6f8(%rbp)
1401b9c70:     	movq	$0x0, 0x6fc(%rbp)
1401b9c7b:     	movb	$0x1, 0x704(%rbp)
1401b9c82:     	movq	$0x0, 0x708(%rbp)
1401b9c8d:     	movl	$0x3f800000, 0x710(%rbp) # imm = 0x3F800000
1401b9c97:     	movw	$0x0, 0x714(%rbp)
1401b9ca0:     	movw	$0x0, 0x71a(%rbp)
1401b9ca9:     	movl	$0x10000, 0x716(%rbp)   # imm = 0x10000
1401b9cb3:     	movw	$0x0, 0x720(%rbp)
1401b9cbc:     	movl	$0x10000, 0x71c(%rbp)   # imm = 0x10000
1401b9cc6:     	movl	$0x100, 0x722(%rbp)     # imm = 0x100
1401b9cd0:     	movb	$0x1, 0x726(%rbp)
1401b9cd7:     	movq	%rdi, 0x5a0(%rbp)
1401b9cde:     	leaq	0x510(%rbp), %rcx
1401b9ce5:     	leaq	0x5a0(%rbp), %r8
1401b9cec:     	leaq	0xc8(%rbp), %rbx
1401b9cf3:     	movq	%rbx, %rdx
1401b9cf6:     	callq	0x140191980 <.text+0x190980>
1401b9cfb:     	movaps	%xmm8, 0x510(%rbp)
1401b9d03:     	movq	$0x0, 0x520(%rbp)
1401b9d0e:     	movups	%xmm9, 0x528(%rbp)
1401b9d16:     	movups	0x5bfebaa(%rip), %xmm9  # 0x145db88c8
1401b9d1e:     	movq	$0x0, 0x538(%rbp)
1401b9d29:     	movaps	%xmm13, 0x540(%rbp)
1401b9d31:     	movq	$0x0, 0x550(%rbp)
1401b9d3c:     	movups	%xmm9, 0x558(%rbp)
1401b9d44:     	movq	$0x0, 0x568(%rbp)
1401b9d4f:     	movaps	0x560(%rbp), %xmm0
1401b9d56:     	movaps	%xmm0, 0x1d0(%rbp)
1401b9d5d:     	movaps	%xmm8, 0x180(%rbp)
1401b9d65:     	movaps	%xmm13, %xmm8
1401b9d69:     	movaps	%xmm13, 0x1b0(%rbp)
1401b9d71:     	movq	0x520(%rbp), %rax
1401b9d78:     	movq	%rax, 0x190(%rbp)
1401b9d7f:     	movq	0x528(%rbp), %rax
1401b9d86:     	movq	%rax, 0x198(%rbp)
1401b9d8d:     	movq	0x530(%rbp), %rax
1401b9d94:     	movq	%rax, 0x1a0(%rbp)
1401b9d9b:     	movq	0x538(%rbp), %rax
1401b9da2:     	movq	%rax, 0x1a8(%rbp)
1401b9da9:     	movq	0x550(%rbp), %rax
1401b9db0:     	movq	%rax, 0x1c0(%rbp)
1401b9db7:     	movq	0x558(%rbp), %rax
1401b9dbe:     	movq	%rax, 0x1c8(%rbp)
1401b9dc5:     	movaps	%xmm14, 0x1e0(%rbp)
1401b9dcd:     	movq	$0x0, 0x1f0(%rbp)
1401b9dd8:     	movups	%xmm14, 0x648(%rbp)
1401b9de0:     	movups	%xmm14, 0x638(%rbp)
1401b9de8:     	movq	$0x0, 0x658(%rbp)
1401b9df3:     	movq	$0x0, 0x71c(%rbp)
1401b9dfe:     	movb	$0x0, 0x724(%rbp)
1401b9e05:     	movaps	0x180(%rbp), %xmm0
1401b9e0c:     	movups	%xmm0, 0x5a8(%rbp)
1401b9e13:     	movaps	0x190(%rbp), %xmm0
1401b9e1a:     	movups	%xmm0, 0x5b8(%rbp)
1401b9e21:     	movaps	0x1a0(%rbp), %xmm0
1401b9e28:     	movups	%xmm0, 0x5c8(%rbp)
1401b9e2f:     	movaps	0x1b0(%rbp), %xmm0
1401b9e36:     	movups	%xmm0, 0x5d8(%rbp)
1401b9e3d:     	movaps	0x1c0(%rbp), %xmm0
1401b9e44:     	movups	%xmm0, 0x5e8(%rbp)
1401b9e4b:     	movaps	0x1d0(%rbp), %xmm0
1401b9e52:     	movups	%xmm0, 0x5f8(%rbp)
1401b9e59:     	movaps	0x1e0(%rbp), %xmm0
1401b9e60:     	movups	%xmm0, 0x608(%rbp)
1401b9e67:     	movq	0x1f0(%rbp), %rax
1401b9e6e:     	movq	%rax, 0x618(%rbp)
1401b9e75:     	movsd	0x5bfdee3(%rip), %xmm0  # 0x145db7d60
1401b9e7d:     	movups	%xmm0, 0x620(%rbp)
1401b9e84:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
1401b9e8e:     	movq	%rax, 0x630(%rbp)
1401b9e95:     	movups	%xmm12, 0x670(%rbp)
1401b9e9d:     	movups	0x5bfea94(%rip), %xmm0  # 0x145db8938
1401b9ea4:     	movups	%xmm0, 0x660(%rbp)
1401b9eab:     	movups	%xmm7, 0x690(%rbp)
1401b9eb2:     	movups	0x5bfea9f(%rip), %xmm0  # 0x145db8958
1401b9eb9:     	movups	%xmm0, 0x680(%rbp)
1401b9ec0:     	movups	%xmm10, 0x6b0(%rbp)
1401b9ec8:     	movups	%xmm15, 0x6a0(%rbp)
1401b9ed0:     	movups	%xmm11, 0x6d0(%rbp)
1401b9ed8:     	movaps	%xmm6, %xmm11
1401b9edc:     	movups	%xmm6, 0x6c0(%rbp)
1401b9ee3:     	movaps	0x5bb3375(%rip), %xmm14 # 0x145d6d260
1401b9eeb:     	movups	%xmm14, 0x6e0(%rbp)
1401b9ef3:     	movl	$0x1, 0x6f0(%rbp)
1401b9efd:     	movq	$0x0, 0x6f4(%rbp)
1401b9f08:     	movb	$0x1, 0x6fc(%rbp)
1401b9f0f:     	movq	$0x0, 0x700(%rbp)
1401b9f1a:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
1401b9f24:     	movw	$0x0, 0x70c(%rbp)
1401b9f2d:     	movw	$0x0, 0x712(%rbp)
1401b9f36:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
1401b9f40:     	movw	$0x0, 0x718(%rbp)
1401b9f49:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
1401b9f53:     	movw	$0x100, 0x71a(%rbp)     # imm = 0x100
1401b9f5c:     	movb	$0x5, 0x725(%rbp)
1401b9f63:     	movq	%rdi, 0x5a0(%rbp)
1401b9f6a:     	leaq	0x510(%rbp), %rcx
1401b9f71:     	leaq	0x5a0(%rbp), %r8
1401b9f78:     	movq	%rbx, %rdx
1401b9f7b:     	callq	0x14018a1f0 <.text+0x1891f0>
1401b9f80:     	leaq	0x5c00c8c(%rip), %rcx   # 0x145dbac13
1401b9f87:     	movl	$0x11, %edx
1401b9f8c:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401b9f91:     	movq	%rdx, %r14
1401b9f94:     	testq	%rdx, %rdx
1401b9f97:     	jns	0x1401b9fa9 <.text+0x1b8fa9>
1401b9f99:     	xorl	%r12d, %r12d
1401b9f9c:     	movq	%r12, %rcx
1401b9f9f:     	movq	%r14, %rdx
1401b9fa2:     	callq	0x145d6944b <.text+0x5d6844b>
1401b9fa7:     	ud2
1401b9fa9:     	je	0x1401ba020 <.text+0x1b9020>
1401b9fab:     	movl	%r12d, %r13d
1401b9fae:     	movq	%rax, %rbx
1401b9fb1:     	callq	0x140002200 <.text+0x1200>
1401b9fb6:     	movl	$0x1, %r12d
1401b9fbc:     	movl	$0x1, %edx
1401b9fc1:     	movq	%r14, %rcx
1401b9fc4:     	callq	0x1400021c0 <.text+0x11c0>
1401b9fc9:     	testq	%rax, %rax
1401b9fcc:     	movups	0x5bfe8c5(%rip), %xmm7  # 0x145db8898
1401b9fd3:     	movups	0x5bfe8a6(%rip), %xmm6  # 0x145db8880
1401b9fda:     	je	0x1401b9f9c <.text+0x1b8f9c>
1401b9fdc:     	movq	%rax, %r15
1401b9fdf:     	movaps	%xmm12, %xmm10
1401b9fe3:     	movq	%rax, %rcx
1401b9fe6:     	movq	%rbx, %rdx
1401b9fe9:     	movq	%r14, %r8
1401b9fec:     	callq	0x145bc977b <.text+0x5bc877b>
1401b9ff1:     	movups	0x5bfe93f(%rip), %xmm12 # 0x145db8938
1401b9ff9:     	movl	%r13d, %r12d
1401b9ffc:     	cmpb	$0x1, 0x18(%rsi)
1401ba000:     	jne	0x1401ba046 <.text+0x1b9046>
1401ba002:     	movl	0x19(%rsi), %eax
1401ba005:     	movl	0x1c(%rsi), %ecx
1401ba008:     	movl	%ecx, 0x5a3(%rbp)
1401ba00e:     	movl	%eax, 0x5a0(%rbp)
1401ba014:     	movq	0x20(%rsi), %rax
1401ba018:     	movzbl	0x28(%rsi), %ecx
1401ba01c:     	movb	$0x1, %dl
1401ba01e:     	jmp	0x1401ba056 <.text+0x1b9056>
1401ba020:     	movl	$0x1, %r15d
1401ba026:     	movaps	%xmm12, %xmm10
1401ba02a:     	movups	0x5bfe906(%rip), %xmm12 # 0x145db8938
1401ba032:     	movups	0x5bfe85f(%rip), %xmm7  # 0x145db8898
1401ba039:     	movups	0x5bfe840(%rip), %xmm6  # 0x145db8880
1401ba040:     	cmpb	$0x1, 0x18(%rsi)
1401ba044:     	je	0x1401ba002 <.text+0x1b9002>
1401ba046:     	movq	0x20(%rsi), %rax
1401ba04a:     	lock
1401ba04b:     	incq	(%rax)
1401ba04e:     	jle	0x1401bb943 <.text+0x1ba943>
1401ba054:     	xorl	%edx, %edx
1401ba056:     	movq	%r14, 0x180(%rbp)
1401ba05d:     	movq	%r15, 0x188(%rbp)
1401ba064:     	movq	%r14, 0x190(%rbp)
1401ba06b:     	movq	$0x0, 0x198(%rbp)
1401ba076:     	movq	$0x4, 0x1a0(%rbp)
1401ba081:     	movq	$0x0, 0x1a8(%rbp)
1401ba08c:     	movb	%dl, 0x1b0(%rbp)
1401ba092:     	movl	0x5a0(%rbp), %edx
1401ba098:     	movl	0x5a3(%rbp), %r8d
1401ba09f:     	movl	%edx, 0x1b1(%rbp)
1401ba0a5:     	movl	%r8d, 0x1b4(%rbp)
1401ba0ac:     	movq	%rax, 0x1b8(%rbp)
1401ba0b3:     	movq	%rcx, 0x1c0(%rbp)
1401ba0ba:     	movl	$0x42200000, 0x1c8(%rbp) # imm = 0x42200000
1401ba0c4:     	movw	$0x190, 0x1cc(%rbp)     # imm = 0x190
1401ba0cd:     	movb	$0x1, 0x1ce(%rbp)
1401ba0d4:     	movups	0x5bfe71d(%rip), %xmm0  # 0x145db87f8
1401ba0db:     	movups	%xmm0, 0x1d0(%rbp)
1401ba0e2:     	movl	$0x3f800000, 0x1e0(%rbp) # imm = 0x3F800000
1401ba0ec:     	movl	%r12d, 0x1f4(%rbp)
1401ba0f3:     	movups	0x5bb41de(%rip), %xmm0  # 0x145d6e2d8
1401ba0fa:     	movups	%xmm0, 0x1e4(%rbp)
1401ba101:     	movsd	0x5bb30c7(%rip), %xmm0  # 0x145d6d1d0
1401ba109:     	movsd	%xmm0, 0x1f8(%rbp)
1401ba111:     	movq	0x510(%rbp), %rax
1401ba118:     	movq	0x520(%rbp), %rcx
1401ba11f:     	movq	%rax, 0x200(%rbp)
1401ba126:     	movb	$0x1, 0x835(%rbp)
1401ba12d:     	callq	0x144e07d20 <.text+0x4e06d20>
1401ba132:     	nop
1401ba133:     	movq	%rax, %r14
1401ba136:     	movq	0x528(%rbp), %r15
1401ba13d:     	testq	%r15, %r15
1401ba140:     	je	0x1401ba197 <.text+0x1b9197>
1401ba142:     	leaq	0x5a0(%rbp), %rcx
1401ba149:     	leaq	0x180(%rbp), %rdx
1401ba150:     	movl	$0x88, %r8d
1401ba156:     	callq	0x145bc977b <.text+0x5bc877b>
1401ba15b:     	movq	%r14, 0x628(%rbp)
1401ba162:     	movq	(%r15), %rax
1401ba165:     	movq	0x10(%r15), %rbx
1401ba169:     	subq	%rbx, %rax
1401ba16c:     	cmpq	$0x97, %rax
1401ba172:     	ja	0x1401ba1d4 <.text+0x1b91d4>
1401ba174:     	movq	$0x1, 0x20(%rsp)
1401ba17d:     	movl	$0x98, %r8d
1401ba183:     	movl	$0x1, %r9d
1401ba189:     	movq	%r15, %rcx
1401ba18c:     	movq	%rbx, %rdx
1401ba18f:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401ba194:     	nop
1401ba195:     	jmp	0x1401ba1d4 <.text+0x1b91d4>
1401ba197:     	movq	0x530(%rbp), %r15
1401ba19e:     	leaq	0x5a0(%rbp), %rcx
1401ba1a5:     	leaq	0x180(%rbp), %rdx
1401ba1ac:     	movl	$0x88, %r8d
1401ba1b2:     	callq	0x145bc977b <.text+0x5bc877b>
1401ba1b7:     	movq	%r14, 0x628(%rbp)
1401ba1be:     	movq	(%r15), %rax
1401ba1c1:     	movq	0x10(%r15), %rbx
1401ba1c5:     	subq	%rbx, %rax
1401ba1c8:     	cmpq	$0x97, %rax
1401ba1ce:     	jbe	0x1401bb8c5 <.text+0x1ba8c5>
1401ba1d4:     	movq	0x8(%r15), %r12
1401ba1d8:     	leaq	0x70c51(%rip), %rax     # 0x14022ae30 <.text+0x229e30>
1401ba1df:     	movq	%rax, (%r12,%rbx)
1401ba1e3:     	leaq	(%r12,%rbx), %rcx
1401ba1e7:     	addq	$0x8, %rcx
1401ba1eb:     	leaq	0x180(%rbp), %rdx
1401ba1f2:     	movl	$0x88, %r8d
1401ba1f8:     	callq	0x145bc977b <.text+0x5bc877b>
1401ba1fd:     	movq	%r14, 0x90(%r12,%rbx)
1401ba205:     	addq	$0x98, %rbx
1401ba20c:     	movq	%rbx, 0x10(%r15)
1401ba210:     	xorps	%xmm13, %xmm13
1401ba214:     	movups	%xmm13, 0x610(%rbp)
1401ba21c:     	movq	$0x0, 0x620(%rbp)
1401ba227:     	movups	%xmm13, 0x638(%rbp)
1401ba22f:     	movups	%xmm13, 0x648(%rbp)
1401ba237:     	movq	$0x0, 0x658(%rbp)
1401ba242:     	movl	$0x0, 0x720(%rbp)
1401ba24c:     	movb	$0x0, 0x724(%rbp)
1401ba253:     	movaps	%xmm6, 0x180(%rbp)
1401ba25a:     	movq	$0x0, 0x190(%rbp)
1401ba265:     	movups	%xmm7, 0x198(%rbp)
1401ba26c:     	movq	$0x0, 0x1a8(%rbp)
1401ba277:     	movaps	%xmm8, 0x1b0(%rbp)
1401ba27f:     	movq	$0x0, 0x1c0(%rbp)
1401ba28a:     	movups	%xmm9, 0x1c8(%rbp)
1401ba292:     	movq	$0x0, 0x1d8(%rbp)
1401ba29d:     	movq	0x1d0(%rbp), %rax
1401ba2a4:     	movq	%rax, 0x5f8(%rbp)
1401ba2ab:     	movq	0x1d8(%rbp), %rax
1401ba2b2:     	movq	%rax, 0x600(%rbp)
1401ba2b9:     	movq	0x1c0(%rbp), %rax
1401ba2c0:     	movq	%rax, 0x5e8(%rbp)
1401ba2c7:     	movq	0x1c8(%rbp), %rax
1401ba2ce:     	movq	%rax, 0x5f0(%rbp)
1401ba2d5:     	movaps	0x1b0(%rbp), %xmm0
1401ba2dc:     	movups	%xmm0, 0x5d8(%rbp)
1401ba2e3:     	movaps	0x190(%rbp), %xmm0
1401ba2ea:     	movups	%xmm0, 0x5b8(%rbp)
1401ba2f1:     	movaps	0x180(%rbp), %xmm0
1401ba2f8:     	movq	0x1a0(%rbp), %rax
1401ba2ff:     	movq	0x1a8(%rbp), %rcx
1401ba306:     	movq	%rax, 0x5c8(%rbp)
1401ba30d:     	movq	%rcx, 0x5d0(%rbp)
1401ba314:     	movups	%xmm0, 0x5a8(%rbp)
1401ba31b:     	movq	$0x0, 0x608(%rbp)
1401ba326:     	movaps	0x5bfda43(%rip), %xmm0  # 0x145db7d70
1401ba32d:     	movups	%xmm0, 0x628(%rbp)
1401ba334:     	movups	%xmm10, 0x670(%rbp)
1401ba33c:     	movups	%xmm12, 0x660(%rbp)
1401ba344:     	movups	0x5bfe61d(%rip), %xmm0  # 0x145db8968
1401ba34b:     	movups	%xmm0, 0x690(%rbp)
1401ba352:     	movups	0x5bfe5ff(%rip), %xmm0  # 0x145db8958
1401ba359:     	movups	%xmm0, 0x680(%rbp)
1401ba360:     	movups	0x5bfe621(%rip), %xmm0  # 0x145db8988
1401ba367:     	movups	%xmm0, 0x6b0(%rbp)
1401ba36e:     	movups	%xmm15, 0x6a0(%rbp)
1401ba376:     	movups	0x5bfe62b(%rip), %xmm0  # 0x145db89a8
1401ba37d:     	movups	%xmm0, 0x6d0(%rbp)
1401ba384:     	movups	%xmm11, 0x6c0(%rbp)
1401ba38c:     	movups	%xmm14, 0x6e0(%rbp)
1401ba394:     	movl	$0x1, 0x6f0(%rbp)
1401ba39e:     	movq	$0x0, 0x6f4(%rbp)
1401ba3a9:     	movb	$0x1, 0x6fc(%rbp)
1401ba3b0:     	movq	$0x0, 0x700(%rbp)
1401ba3bb:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
1401ba3c5:     	movw	$0x0, 0x70c(%rbp)
1401ba3ce:     	movw	$0x0, 0x712(%rbp)
1401ba3d7:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
1401ba3e1:     	movw	$0x0, 0x718(%rbp)
1401ba3ea:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
1401ba3f4:     	movw	$0x100, 0x71a(%rbp)     # imm = 0x100
1401ba3fd:     	movl	$0x0, 0x71c(%rbp)
1401ba407:     	movb	$0x5, 0x725(%rbp)
1401ba40e:     	movq	%rdi, 0x5a0(%rbp)
1401ba415:     	leaq	0x90(%rbp), %rcx
1401ba41c:     	leaq	0x5a0(%rbp), %r8
1401ba423:     	leaq	0xc8(%rbp), %rdx
1401ba42a:     	callq	0x140189f40 <.text+0x188f40>
1401ba42f:     	movq	0x120(%rbp), %rax
1401ba436:     	movq	0x8(%rax), %rbx
1401ba43a:     	movq	0x10(%rax), %r15
1401ba43e:     	movq	0x90(%rbp), %r12
1401ba445:     	movq	0xb8(%rbp), %rax
1401ba44c:     	movq	%r12, 0x60(%rbp)
1401ba450:     	movups	0x98(%rbp), %xmm0
1401ba457:     	movups	%xmm0, 0x68(%rbp)
1401ba45b:     	movups	0xa8(%rbp), %xmm0
1401ba462:     	movups	%xmm0, 0x78(%rbp)
1401ba466:     	movq	%rax, 0x88(%rbp)
1401ba46d:     	movw	$0x0, 0x704(%rbp)
1401ba476:     	movb	$0x1, 0x6f4(%rbp)
1401ba47d:     	movaps	%xmm13, 0x600(%rbp)
1401ba485:     	movaps	%xmm13, 0x610(%rbp)
1401ba48d:     	movaps	%xmm13, 0x620(%rbp)
1401ba495:     	movaps	%xmm13, 0x630(%rbp)
1401ba49d:     	movaps	%xmm13, 0x640(%rbp)
1401ba4a5:     	movq	$0x0, 0x650(%rbp)
1401ba4b0:     	movl	$0x5, 0x71a(%rbp)
1401ba4ba:     	movups	%xmm12, 0x658(%rbp)
1401ba4c2:     	movups	%xmm10, 0x668(%rbp)
1401ba4ca:     	movaps	0x5bfd8af(%rip), %xmm0  # 0x145db7d80
1401ba4d1:     	movups	%xmm0, 0x678(%rbp)
1401ba4d8:     	movaps	0x5bb9971(%rip), %xmm0  # 0x145d73e50
1401ba4df:     	movups	%xmm0, 0x688(%rbp)
1401ba4e6:     	movaps	0x5bb2da2(%rip), %xmm13 # 0x145d6d290
1401ba4ee:     	movups	%xmm13, 0x698(%rbp)
1401ba4f6:     	movups	%xmm13, 0x6a8(%rbp)
1401ba4fe:     	movaps	0x5bb309b(%rip), %xmm0  # 0x145d6d5a0
1401ba505:     	movups	%xmm0, 0x6b8(%rbp)
1401ba50c:     	movups	%xmm0, 0x6c8(%rbp)
1401ba513:     	movq	$0x0, 0x6f8(%rbp)
1401ba51e:     	movl	$0x3f800000, 0x700(%rbp) # imm = 0x3F800000
1401ba528:     	movups	%xmm14, 0x6d8(%rbp)
1401ba530:     	movl	$0x1, 0x6e8(%rbp)
1401ba53a:     	movss	0x5bb2d2e(%rip), %xmm0  # 0x145d6d270
1401ba542:     	movlps	%xmm0, 0x6ec(%rbp)
1401ba549:     	movq	$0x3000000, 0x712(%rbp) # imm = 0x3000000
1401ba554:     	movaps	%xmm6, 0x5a0(%rbp)
1401ba55b:     	movq	$0x0, 0x5b0(%rbp)
1401ba566:     	movups	%xmm7, 0x5b8(%rbp)
1401ba56d:     	movq	$0x0, 0x5c8(%rbp)
1401ba578:     	movaps	%xmm8, 0x5d0(%rbp)
1401ba580:     	movq	$0x0, 0x5e0(%rbp)
1401ba58b:     	movups	%xmm9, 0x5e8(%rbp)
1401ba593:     	movq	$0x0, 0x5f8(%rbp)
1401ba59e:     	movw	$0x0, 0x70a(%rbp)
1401ba5a7:     	movl	$0x10000, 0x706(%rbp)   # imm = 0x10000
1401ba5b1:     	movw	$0x0, 0x710(%rbp)
1401ba5ba:     	movl	$0x10000, 0x70c(%rbp)   # imm = 0x10000
1401ba5c4:     	leaq	0x510(%rbp), %rcx
1401ba5cb:     	callq	0x140012180 <.text+0x11180>
1401ba5d0:     	nop
1401ba5d1:     	movups	0x5bfe220(%rip), %xmm0  # 0x145db87f8
1401ba5d8:     	movaps	%xmm0, 0x410(%rbp)
1401ba5df:     	movl	$0x3eb33333, 0x420(%rbp) # imm = 0x3EB33333
1401ba5e9:     	leaq	0x4b0(%rbp), %rcx
1401ba5f0:     	leaq	0x410(%rbp), %rdx
1401ba5f7:     	callq	0x144c67100 <.text+0x4c66100>
1401ba5fc:     	nop
1401ba5fd:     	movaps	0x4b0(%rbp), %xmm0
1401ba604:     	movups	%xmm0, 0x184(%rbp)
1401ba60b:     	movl	$0x1, 0x180(%rbp)
1401ba615:     	movl	$0x41900000, 0x48(%rsp) # imm = 0x41900000
1401ba61d:     	movl	$0x1, 0x40(%rsp)
1401ba625:     	movl	$0x0, 0x38(%rsp)
1401ba62d:     	movl	$0x1, 0x30(%rsp)
1401ba635:     	movl	$0x0, 0x28(%rsp)
1401ba63d:     	movl	$0x1, 0x20(%rsp)
1401ba645:     	leaq	0x4b0(%rbp), %rcx
1401ba64c:     	leaq	0x180(%rbp), %rdx
1401ba653:     	xorps	%xmm3, %xmm3
1401ba656:     	movl	$0x1, %r8d
1401ba65c:     	callq	0x142633750 <.text+0x2632750>
1401ba661:     	nop
1401ba662:     	leaq	0x68(%rbp), %rdi
1401ba666:     	leaq	0x180(%rbp), %r14
1401ba66d:     	leaq	0x5a0(%rbp), %rdx
1401ba674:     	movl	$0x180, %r8d            # imm = 0x180
1401ba67a:     	movq	%r14, %rcx
1401ba67d:     	callq	0x145bc977b <.text+0x5bc877b>
1401ba682:     	movups	0x510(%rbp), %xmm0
1401ba689:     	movups	0x520(%rbp), %xmm1
1401ba690:     	movups	0x530(%rbp), %xmm2
1401ba697:     	movups	0x540(%rbp), %xmm3
1401ba69e:     	movups	%xmm0, 0x318(%rbp)
1401ba6a5:     	movups	%xmm1, 0x328(%rbp)
1401ba6ac:     	movups	%xmm2, 0x338(%rbp)
1401ba6b3:     	movups	%xmm3, 0x348(%rbp)
1401ba6ba:     	movups	0x550(%rbp), %xmm0
1401ba6c1:     	movups	%xmm0, 0x358(%rbp)
1401ba6c8:     	movups	0x560(%rbp), %xmm0
1401ba6cf:     	movups	%xmm0, 0x368(%rbp)
1401ba6d6:     	movq	0x570(%rbp), %rax
1401ba6dd:     	movq	%rax, 0x378(%rbp)
1401ba6e4:     	movups	0x4b0(%rbp), %xmm0
1401ba6eb:     	movups	%xmm0, 0x300(%rbp)
1401ba6f2:     	movq	0x4c0(%rbp), %rax
1401ba6f9:     	movq	%rax, 0x310(%rbp)
1401ba700:     	movups	0x5bfe589(%rip), %xmm0  # 0x145db8c90
1401ba707:     	movups	%xmm0, 0x422(%rbp)
1401ba70e:     	movups	0x5bfe56b(%rip), %xmm0  # 0x145db8c80
1401ba715:     	movups	%xmm0, 0x412(%rbp)
1401ba71c:     	leaq	0x5a8(%rbp), %rcx
1401ba723:     	movl	$0x200, %r8d            # imm = 0x200
1401ba729:     	movq	%r14, %rdx
1401ba72c:     	callq	0x145bc977b <.text+0x5bc877b>
1401ba731:     	movl	$0x0, 0x7a8(%rbp)
1401ba73b:     	movw	$0x200, 0x7ac(%rbp)     # imm = 0x200
1401ba744:     	movups	0x410(%rbp), %xmm0
1401ba74b:     	movups	0x420(%rbp), %xmm1
1401ba752:     	movups	%xmm0, 0x7ae(%rbp)
1401ba759:     	movups	%xmm1, 0x7be(%rbp)
1401ba760:     	movzwl	0x430(%rbp), %eax
1401ba767:     	movw	%ax, 0x7ce(%rbp)
1401ba76e:     	movq	%r12, 0x5a0(%rbp)
1401ba775:     	leaq	0x30(%rbp), %rcx
1401ba779:     	leaq	0x5a0(%rbp), %r8
1401ba780:     	movq	%rdi, %rdx
1401ba783:     	callq	0x1401906f0 <.text+0x18f6f0>
1401ba788:     	movq	0x30(%rbp), %r12
1401ba78c:     	movq	0x58(%rbp), %rax
1401ba790:     	movq	%r12, (%rbp)
1401ba794:     	movups	0x38(%rbp), %xmm0
1401ba798:     	movups	%xmm0, 0x8(%rbp)
1401ba79c:     	movups	0x48(%rbp), %xmm0
1401ba7a0:     	movups	%xmm0, 0x18(%rbp)
1401ba7a4:     	movq	%rax, 0x28(%rbp)
1401ba7a8:     	movw	$0x0, 0x704(%rbp)
1401ba7b1:     	movb	$0x1, 0x6f4(%rbp)
1401ba7b8:     	xorps	%xmm0, %xmm0
1401ba7bb:     	movups	%xmm0, 0x608(%rbp)
1401ba7c2:     	movups	%xmm0, 0x618(%rbp)
1401ba7c9:     	movaps	0x5bfd3a0(%rip), %xmm1  # 0x145db7b70
1401ba7d0:     	movups	%xmm1, 0x628(%rbp)
1401ba7d7:     	movq	$0x0, 0x600(%rbp)
1401ba7e2:     	movups	%xmm0, 0x638(%rbp)
1401ba7e9:     	movups	%xmm0, 0x648(%rbp)
1401ba7f0:     	movl	$0x0, 0x718(%rbp)
1401ba7fa:     	movw	$0x0, 0x71c(%rbp)
1401ba803:     	movups	%xmm12, 0x658(%rbp)
1401ba80b:     	movups	%xmm10, 0x668(%rbp)
1401ba813:     	movups	0x5bfe13e(%rip), %xmm0  # 0x145db8958
1401ba81a:     	movups	%xmm0, 0x678(%rbp)
1401ba821:     	movups	0x5bfe140(%rip), %xmm0  # 0x145db8968
1401ba828:     	movups	%xmm0, 0x688(%rbp)
1401ba82f:     	movaps	0x5bb2bca(%rip), %xmm0  # 0x145d6d400
1401ba836:     	movups	%xmm0, 0x698(%rbp)
1401ba83d:     	movups	%xmm0, 0x6a8(%rbp)
1401ba844:     	movaps	0x5bfd545(%rip), %xmm0  # 0x145db7d90
1401ba84b:     	movups	%xmm0, 0x6b8(%rbp)
1401ba852:     	movups	%xmm0, 0x6c8(%rbp)
1401ba859:     	movb	$0x0, 0x716(%rbp)
1401ba860:     	movl	$0x0, 0x712(%rbp)
1401ba86a:     	movq	$0x0, 0x6f8(%rbp)
1401ba875:     	movl	$0x0, 0x700(%rbp)
1401ba87f:     	movups	%xmm14, 0x6d8(%rbp)
1401ba887:     	movl	$0x1, 0x6e8(%rbp)
1401ba891:     	movq	$0x0, 0x6ec(%rbp)
1401ba89c:     	movb	$0x0, 0x717(%rbp)
1401ba8a3:     	movaps	%xmm6, 0x5a0(%rbp)
1401ba8aa:     	movq	$0x0, 0x5b0(%rbp)
1401ba8b5:     	movups	%xmm7, 0x5b8(%rbp)
1401ba8bc:     	movq	$0x0, 0x5c8(%rbp)
1401ba8c7:     	movaps	%xmm8, 0x5d0(%rbp)
1401ba8cf:     	movq	$0x0, 0x5e0(%rbp)
1401ba8da:     	movups	%xmm9, 0x5e8(%rbp)
1401ba8e2:     	movq	$0x0, 0x5f8(%rbp)
1401ba8ed:     	movw	$0x0, 0x70a(%rbp)
1401ba8f6:     	movl	$0x10000, 0x706(%rbp)   # imm = 0x10000
1401ba900:     	movw	$0x0, 0x710(%rbp)
1401ba909:     	movl	$0x10000, 0x70c(%rbp)   # imm = 0x10000
1401ba913:     	movups	0x5bfdede(%rip), %xmm0  # 0x145db87f8
1401ba91a:     	movaps	%xmm0, 0x4b0(%rbp)
1401ba921:     	movl	$0x3f800000, 0x4c0(%rbp) # imm = 0x3F800000
1401ba92b:     	movups	%xmm0, 0x4c4(%rbp)
1401ba932:     	movl	$0x3f800000, 0x4d4(%rbp) # imm = 0x3F800000
1401ba93c:     	movups	%xmm0, 0x4d8(%rbp)
1401ba943:     	movl	$0x3f800000, 0x4e8(%rbp) # imm = 0x3F800000
1401ba94d:     	movups	%xmm0, 0x4ec(%rbp)
1401ba954:     	movl	$0x3f800000, 0x4fc(%rbp) # imm = 0x3F800000
1401ba95e:     	callq	0x140002200 <.text+0x1200>
1401ba963:     	movl	$0x44, %ecx
1401ba968:     	movl	$0x1, %edx
1401ba96d:     	callq	0x1400021c0 <.text+0x11c0>
1401ba972:     	testq	%rax, %rax
1401ba975:     	je	0x1401bb933 <.text+0x1ba933>
1401ba97b:     	movups	0x5bfe4d3(%rip), %xmm0  # 0x145db8e55
1401ba982:     	movups	%xmm0, 0x30(%rax)
1401ba986:     	movups	0x5bfe4b8(%rip), %xmm0  # 0x145db8e45
1401ba98d:     	movups	%xmm0, 0x20(%rax)
1401ba991:     	movups	0x5bfe49d(%rip), %xmm0  # 0x145db8e35
1401ba998:     	movups	%xmm0, 0x10(%rax)
1401ba99c:     	movups	0x5bfe482(%rip), %xmm0  # 0x145db8e25
1401ba9a3:     	movups	%xmm0, (%rax)
1401ba9a6:     	movl	$0x706c622e, 0x40(%rax) # imm = 0x706C622E
1401ba9ad:     	movq	$0x44, 0x180(%rbp)
1401ba9b8:     	movq	%rax, 0x188(%rbp)
1401ba9bf:     	movq	$0x44, 0x190(%rbp)
1401ba9ca:     	leaq	0x5bf24a7(%rip), %rax   # 0x145dace78
1401ba9d1:     	movq	%rax, 0x20(%rsp)
1401ba9d6:     	leaq	0x130(%rbp), %rcx
1401ba9dd:     	leaq	0x180(%rbp), %r8
1401ba9e4:     	movl	$0x1, %r9d
1401ba9ea:     	movq	%rbx, %rdx
1401ba9ed:     	callq	0x1401471a0 <.text+0x1461a0>
1401ba9f2:     	nop
1401ba9f3:     	movzbl	(%r15), %ecx
1401ba9f7:     	callq	0x145875700 <.text+0x5874700>
1401ba9fc:     	nop
1401ba9fd:     	movups	0x5bfdf63(%rip), %xmm15 # 0x145db8968
1401baa05:     	leaq	0x484(%rbp), %rcx
1401baa0c:     	movq	%rax, %rdx
1401baa0f:     	callq	0x140081190 <.text+0x80190>
1401baa14:     	movups	0x5bfe235(%rip), %xmm0  # 0x145db8c50
1401baa1b:     	movups	%xmm0, 0x548(%rbp)
1401baa22:     	movabsq	$0x23f800000, %rax      # imm = 0x23F800000
1401baa2c:     	movq	%rax, 0x558(%rbp)
1401baa33:     	movups	0x5bfe22e(%rip), %xmm1  # 0x145db8c68
1401baa3a:     	movups	%xmm1, 0x530(%rbp)
1401baa41:     	movq	$0x46, 0x540(%rbp)
1401baa4c:     	movb	$0x2, 0x510(%rbp)
1401baa53:     	movw	$0x0, 0x594(%rbp)
1401baa5c:     	movl	$0x0, 0x580(%rbp)
1401baa66:     	movups	%xmm0, 0x448(%rbp)
1401baa6d:     	movl	$0x3f800000, 0x458(%rbp) # imm = 0x3F800000
1401baa77:     	movups	0x130(%rbp), %xmm0
1401baa7e:     	movaps	%xmm0, 0x430(%rbp)
1401baa85:     	movq	0x140(%rbp), %rax
1401baa8c:     	movq	%rax, 0x440(%rbp)
1401baa93:     	movups	0x520(%rbp), %xmm0
1401baa9a:     	movaps	%xmm0, 0x420(%rbp)
1401baaa1:     	movzbl	0x510(%rbp), %eax
1401baaa8:     	movb	%al, 0x410(%rbp)
1401baaae:     	movq	0x511(%rbp), %rax
1401baab5:     	movq	%rax, 0x411(%rbp)
1401baabc:     	movl	0x519(%rbp), %eax
1401baac2:     	movl	%eax, 0x419(%rbp)
1401baac8:     	movzwl	0x51d(%rbp), %eax
1401baacf:     	movw	%ax, 0x41d(%rbp)
1401baad6:     	movzbl	0x51f(%rbp), %eax
1401baadd:     	movb	%al, 0x41f(%rbp)
1401baae3:     	movw	$0x0, 0x494(%rbp)
1401baaec:     	movl	$0x1, 0x480(%rbp)
1401baaf6:     	movups	0x55c(%rbp), %xmm0
1401baafd:     	movups	%xmm0, 0x45c(%rbp)
1401bab04:     	movl	0x57c(%rbp), %eax
1401bab0a:     	movl	%eax, 0x47c(%rbp)
1401bab10:     	movups	0x56c(%rbp), %xmm0
1401bab17:     	movups	%xmm0, 0x46c(%rbp)
1401bab1e:     	movups	0x5bfe00b(%rip), %xmm0  # 0x145db8b30
1401bab25:     	movaps	%xmm0, 0xf0(%rbp)
1401bab2c:     	movl	$0x3f59999a, 0x100(%rbp) # imm = 0x3F59999A
1401bab36:     	leaq	0x130(%rbp), %rcx
1401bab3d:     	leaq	0xf0(%rbp), %rdx
1401bab44:     	callq	0x144c67100 <.text+0x4c66100>
1401bab49:     	nop
1401bab4a:     	movaps	0x130(%rbp), %xmm0
1401bab51:     	movups	%xmm0, 0x184(%rbp)
1401bab58:     	movl	$0x1, 0x180(%rbp)
1401bab62:     	movl	$0x40c00000, 0x48(%rsp) # imm = 0x40C00000
1401bab6a:     	movl	$0x1, 0x40(%rsp)
1401bab72:     	movl	$0x0, 0x38(%rsp)
1401bab7a:     	movl	$0x1, 0x30(%rsp)
1401bab82:     	movl	$0x40000000, 0x28(%rsp) # imm = 0x40000000
1401bab8a:     	movl	$0x1, 0x20(%rsp)
1401bab92:     	leaq	0x130(%rbp), %rcx
1401bab99:     	leaq	0x180(%rbp), %rdx
1401baba0:     	xorps	%xmm3, %xmm3
1401baba3:     	movl	$0x1, %r8d
1401baba9:     	callq	0x142633750 <.text+0x2632750>
1401babae:     	nop
1401babaf:     	leaq	0x8(%rbp), %rdi
1401babb3:     	leaq	0x180(%rbp), %rbx
1401babba:     	leaq	0x5a0(%rbp), %rdx
1401babc1:     	movl	$0x180, %r8d            # imm = 0x180
1401babc7:     	movq	%rbx, %rcx
1401babca:     	callq	0x145bc977b <.text+0x5bc877b>
1401babcf:     	movaps	0x4b0(%rbp), %xmm0
1401babd6:     	movaps	0x4c0(%rbp), %xmm1
1401babdd:     	movaps	0x4d0(%rbp), %xmm2
1401babe4:     	movaps	0x4e0(%rbp), %xmm3
1401babeb:     	movups	%xmm0, 0x388(%rbp)
1401babf2:     	movups	%xmm1, 0x398(%rbp)
1401babf9:     	movups	%xmm2, 0x3a8(%rbp)
1401bac00:     	movups	%xmm3, 0x3b8(%rbp)
1401bac07:     	movaps	0x4f0(%rbp), %xmm0
1401bac0e:     	movups	%xmm0, 0x3c8(%rbp)
1401bac15:     	movups	0x5bfdf2b(%rip), %xmm14 # 0x145db8b48
1401bac1d:     	movups	%xmm14, 0x3d8(%rbp)
1401bac25:     	movl	$0x3f800000, 0x3e8(%rbp) # imm = 0x3F800000
1401bac2f:     	leaq	0x300(%rbp), %rcx
1401bac36:     	leaq	0x410(%rbp), %rdx
1401bac3d:     	movl	$0x88, %r8d
1401bac43:     	callq	0x145bc977b <.text+0x5bc877b>
1401bac48:     	movups	0x130(%rbp), %xmm0
1401bac4f:     	movups	%xmm0, 0x3f0(%rbp)
1401bac56:     	movq	0x140(%rbp), %rax
1401bac5d:     	movq	%rax, 0x400(%rbp)
1401bac64:     	leaq	0x5a8(%rbp), %rcx
1401bac6b:     	movl	$0x288, %r8d            # imm = 0x288
1401bac71:     	movq	%rbx, %rdx
1401bac74:     	callq	0x145bc977b <.text+0x5bc877b>
1401bac79:     	movq	%r12, 0x5a0(%rbp)
1401bac80:     	leaq	-0x30(%rbp), %rcx
1401bac84:     	leaq	0x5a0(%rbp), %r8
1401bac8b:     	movq	%rdi, %rdx
1401bac8e:     	callq	0x14018af80 <.text+0x189f80>
1401bac93:     	nop
1401bac94:     	movq	-0x30(%rbp), %rax
1401bac98:     	movq	-0x8(%rbp), %rcx
1401bac9c:     	movq	%rax, 0xf0(%rbp)
1401baca3:     	leaq	0xf8(%rbp), %rdx
1401bacaa:     	movups	-0x28(%rbp), %xmm0
1401bacae:     	movups	%xmm0, 0xf8(%rbp)
1401bacb5:     	movups	-0x18(%rbp), %xmm0
1401bacb9:     	movups	%xmm0, 0x108(%rbp)
1401bacc0:     	movq	%rcx, 0x118(%rbp)
1401bacc7:     	movaps	%xmm6, 0x410(%rbp)
1401bacce:     	movq	$0x0, 0x420(%rbp)
1401bacd9:     	movups	%xmm7, 0x428(%rbp)
1401bace0:     	movq	$0x0, 0x438(%rbp)
1401baceb:     	movaps	%xmm8, 0x440(%rbp)
1401bacf3:     	movq	$0x0, 0x450(%rbp)
1401bacfe:     	movups	%xmm9, 0x458(%rbp)
1401bad06:     	movq	$0x0, 0x468(%rbp)
1401bad11:     	movaps	%xmm14, 0x130(%rbp)
1401bad19:     	movl	$0x3f800000, 0x140(%rbp) # imm = 0x3F800000
1401bad23:     	movups	%xmm14, 0x144(%rbp)
1401bad2b:     	movl	$0x3f800000, 0x154(%rbp) # imm = 0x3F800000
1401bad35:     	movups	%xmm14, 0x158(%rbp)
1401bad3d:     	movl	$0x3f800000, 0x168(%rbp) # imm = 0x3F800000
1401bad47:     	movups	%xmm14, 0x16c(%rbp)
1401bad4f:     	movl	$0x3f800000, 0x17c(%rbp) # imm = 0x3F800000
1401bad59:     	movq	0x460(%rbp), %rcx
1401bad60:     	movq	%rcx, 0x1d0(%rbp)
1401bad67:     	movq	0x468(%rbp), %rcx
1401bad6e:     	movq	%rcx, 0x1d8(%rbp)
1401bad75:     	movq	0x450(%rbp), %rcx
1401bad7c:     	movq	%rcx, 0x1c0(%rbp)
1401bad83:     	movq	0x458(%rbp), %rcx
1401bad8a:     	movq	%rcx, 0x1c8(%rbp)
1401bad91:     	movaps	0x410(%rbp), %xmm0
1401bad98:     	movaps	0x420(%rbp), %xmm1
1401bad9f:     	movaps	0x430(%rbp), %xmm2
1401bada6:     	movaps	0x440(%rbp), %xmm3
1401badad:     	movaps	%xmm3, 0x1b0(%rbp)
1401badb4:     	movaps	%xmm2, 0x1a0(%rbp)
1401badbb:     	movaps	%xmm1, 0x190(%rbp)
1401badc2:     	movaps	%xmm0, 0x180(%rbp)
1401badc9:     	xorps	%xmm0, %xmm0
1401badcc:     	movaps	%xmm0, 0x1e0(%rbp)
1401badd3:     	movups	%xmm0, 0x628(%rbp)
1401badda:     	movups	%xmm0, 0x648(%rbp)
1401bade1:     	movq	$0x0, 0x658(%rbp)
1401badec:     	movl	$0x0, 0x71c(%rbp)
1401badf6:     	movw	$0x0, 0x720(%rbp)
1401badff:     	movaps	0x170(%rbp), %xmm0
1401bae06:     	movups	%xmm0, 0x4f2(%rbp)
1401bae0d:     	movaps	0x130(%rbp), %xmm0
1401bae14:     	movaps	0x140(%rbp), %xmm1
1401bae1b:     	movaps	0x150(%rbp), %xmm2
1401bae22:     	movaps	0x160(%rbp), %xmm3
1401bae29:     	movups	%xmm3, 0x4e2(%rbp)
1401bae30:     	movups	%xmm2, 0x4d2(%rbp)
1401bae37:     	movups	%xmm1, 0x4c2(%rbp)
1401bae3e:     	movups	%xmm0, 0x4b2(%rbp)
1401bae45:     	movaps	0x180(%rbp), %xmm0
1401bae4c:     	movaps	0x190(%rbp), %xmm1
1401bae53:     	movaps	0x1a0(%rbp), %xmm2
1401bae5a:     	movaps	0x1b0(%rbp), %xmm3
1401bae61:     	movups	%xmm0, 0x5a8(%rbp)
1401bae68:     	movups	%xmm1, 0x5b8(%rbp)
1401bae6f:     	movups	%xmm2, 0x5c8(%rbp)
1401bae76:     	movups	%xmm3, 0x5d8(%rbp)
1401bae7d:     	movaps	0x1c0(%rbp), %xmm0
1401bae84:     	movups	%xmm0, 0x5e8(%rbp)
1401bae8b:     	movaps	0x1d0(%rbp), %xmm0
1401bae92:     	movups	%xmm0, 0x5f8(%rbp)
1401bae99:     	movaps	0x1e0(%rbp), %xmm0
1401baea0:     	movups	%xmm0, 0x608(%rbp)
1401baea7:     	movaps	0x5bfcef2(%rip), %xmm0  # 0x145db7da0
1401baeae:     	movups	%xmm0, 0x618(%rbp)
1401baeb5:     	movaps	0x5bb8ee4(%rip), %xmm0  # 0x145d73da0
1401baebc:     	movups	%xmm0, 0x638(%rbp)
1401baec3:     	movups	%xmm10, 0x670(%rbp)
1401baecb:     	movups	%xmm12, 0x660(%rbp)
1401baed3:     	movaps	0x5bb25b6(%rip), %xmm0  # 0x145d6d490
1401baeda:     	movups	%xmm0, 0x680(%rbp)
1401baee1:     	movaps	0x5bb2428(%rip), %xmm0  # 0x145d6d310
1401baee8:     	movups	%xmm0, 0x690(%rbp)
1401baeef:     	movups	%xmm13, 0x6a0(%rbp)
1401baef7:     	movups	%xmm13, 0x6b0(%rbp)
1401baeff:     	movaps	0x5bb239a(%rip), %xmm0  # 0x145d6d2a0
1401baf06:     	movups	%xmm0, 0x6c0(%rbp)
1401baf0d:     	movups	%xmm0, 0x6d0(%rbp)
1401baf14:     	movaps	0x5bb2345(%rip), %xmm0  # 0x145d6d260
1401baf1b:     	movups	%xmm0, 0x6e0(%rbp)
1401baf22:     	movl	$0x1, 0x6f0(%rbp)
1401baf2c:     	movq	$0x0, 0x6f4(%rbp)
1401baf37:     	movb	$0x1, 0x6fc(%rbp)
1401baf3e:     	movq	$0x0, 0x700(%rbp)
1401baf49:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
1401baf53:     	movw	$0x0, 0x70c(%rbp)
1401baf5c:     	movw	$0x0, 0x712(%rbp)
1401baf65:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
1401baf6f:     	movw	$0x0, 0x718(%rbp)
1401baf78:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
1401baf82:     	movw	$0x100, 0x71a(%rbp)     # imm = 0x100
1401baf8b:     	movl	$0x5000005, 0x722(%rbp) # imm = 0x5000005
1401baf95:     	movzwl	0x500(%rbp), %ecx
1401baf9c:     	movw	%cx, 0x776(%rbp)
1401bafa3:     	movups	0x4f0(%rbp), %xmm0
1401bafaa:     	movups	%xmm0, 0x766(%rbp)
1401bafb1:     	movups	0x4b0(%rbp), %xmm0
1401bafb8:     	movups	0x4c0(%rbp), %xmm1
1401bafbf:     	movups	0x4d0(%rbp), %xmm2
1401bafc6:     	movups	0x4e0(%rbp), %xmm3
1401bafcd:     	movups	%xmm3, 0x756(%rbp)
1401bafd4:     	movups	%xmm2, 0x746(%rbp)
1401bafdb:     	movups	%xmm1, 0x736(%rbp)
1401bafe2:     	movups	%xmm0, 0x726(%rbp)
1401bafe9:     	movups	0x5bfd808(%rip), %xmm0  # 0x145db87f8
1401baff0:     	movups	%xmm0, 0x778(%rbp)
1401baff7:     	movl	$0x3f800000, 0x788(%rbp) # imm = 0x3F800000
1401bb001:     	movq	%rax, 0x5a0(%rbp)
1401bb008:     	leaq	0x130(%rbp), %rcx
1401bb00f:     	leaq	0x5a0(%rbp), %r8
1401bb016:     	callq	0x14018a750 <.text+0x189750>
1401bb01b:     	nop
1401bb01c:     	cmpb	$0x1, (%rsi)
1401bb01f:     	jne	0x1401bb03f <.text+0x1ba03f>
1401bb021:     	movl	0x1(%rsi), %eax
1401bb024:     	movl	0x4(%rsi), %ecx
1401bb027:     	movl	%ecx, 0x4ab(%rbp)
1401bb02d:     	movl	%eax, 0x4a8(%rbp)
1401bb033:     	movq	0x8(%rsi), %rax
1401bb037:     	movzbl	0x10(%rsi), %ecx
1401bb03b:     	movb	$0x1, %dl
1401bb03d:     	jmp	0x1401bb04f <.text+0x1ba04f>
1401bb03f:     	movq	0x8(%rsi), %rax
1401bb043:     	lock
1401bb044:     	incq	(%rax)
1401bb047:     	jle	0x1401bb943 <.text+0x1ba943>
1401bb04d:     	xorl	%edx, %edx
1401bb04f:     	movb	$0x1, 0x428(%rbp)
1401bb056:     	movups	0x5bfdaff(%rip), %xmm0  # 0x145db8b5c
1401bb05d:     	movups	%xmm0, 0x429(%rbp)
1401bb064:     	movl	$0x41a00000, 0x440(%rbp) # imm = 0x41A00000
1401bb06e:     	movw	$0x190, 0x444(%rbp)     # imm = 0x190
1401bb077:     	movb	$0x1, 0x446(%rbp)
1401bb07e:     	movq	$0x0, 0x410(%rbp)
1401bb089:     	movq	$0x4, 0x418(%rbp)
1401bb094:     	movq	$0x0, 0x420(%rbp)
1401bb09f:     	movq	0x410(%rbp), %r8
1401bb0a6:     	movq	%r8, 0x198(%rbp)
1401bb0ad:     	movq	0x418(%rbp), %r8
1401bb0b4:     	movq	%r8, 0x1a0(%rbp)
1401bb0bb:     	movq	$0x0, 0x1a8(%rbp)
1401bb0c6:     	movups	%xmm14, 0x4b1(%rbp)
1401bb0ce:     	movl	$0x3f800000, 0x4c1(%rbp) # imm = 0x3F800000
1401bb0d8:     	movq	0x130(%rbp), %r8
1401bb0df:     	movq	$0x0, 0x180(%rbp)
1401bb0ea:     	movq	$0x1, 0x188(%rbp)
1401bb0f5:     	movq	$0x0, 0x190(%rbp)
1401bb100:     	movb	%dl, 0x1b0(%rbp)
1401bb106:     	movl	0x4a8(%rbp), %edx
1401bb10c:     	movl	0x4ab(%rbp), %r9d
1401bb113:     	movl	%edx, 0x1b1(%rbp)
1401bb119:     	movl	%r9d, 0x1b4(%rbp)
1401bb120:     	movq	%rax, 0x1b8(%rbp)
1401bb127:     	movq	%rcx, 0x1c0(%rbp)
1401bb12e:     	movl	$0x41400000, 0x1c8(%rbp) # imm = 0x41400000
1401bb138:     	movw	$0x190, 0x1cc(%rbp)     # imm = 0x190
1401bb141:     	movb	$0x1, 0x1ce(%rbp)
1401bb148:     	movq	0x4bd(%rbp), %rax
1401bb14f:     	movq	%rax, 0x1dc(%rbp)
1401bb156:     	movups	0x4b0(%rbp), %xmm0
1401bb15d:     	movups	%xmm0, 0x1cf(%rbp)
1401bb164:     	movq	%r8, 0x1e8(%rbp)
1401bb16b:     	movq	0x140(%rbp), %rcx
1401bb172:     	movb	$0x1, 0x834(%rbp)
1401bb179:     	callq	0x144e07d20 <.text+0x4e06d20>
1401bb17e:     	nop
1401bb17f:     	movq	%rax, %rbx
1401bb182:     	movq	0x148(%rbp), %r14
1401bb189:     	testq	%r14, %r14
1401bb18c:     	je	0x1401bb235 <.text+0x1ba235>
1401bb192:     	movups	0x1e0(%rbp), %xmm0
1401bb199:     	movaps	%xmm0, 0x600(%rbp)
1401bb1a0:     	movups	0x1d0(%rbp), %xmm0
1401bb1a7:     	movaps	%xmm0, 0x5f0(%rbp)
1401bb1ae:     	movups	0x1c0(%rbp), %xmm0
1401bb1b5:     	movaps	%xmm0, 0x5e0(%rbp)
1401bb1bc:     	movups	0x180(%rbp), %xmm0
1401bb1c3:     	movups	0x190(%rbp), %xmm1
1401bb1ca:     	movups	0x1a0(%rbp), %xmm2
1401bb1d1:     	movups	0x1b0(%rbp), %xmm3
1401bb1d8:     	movaps	%xmm3, 0x5d0(%rbp)
1401bb1df:     	movaps	%xmm2, 0x5c0(%rbp)
1401bb1e6:     	movaps	%xmm1, 0x5b0(%rbp)
1401bb1ed:     	movaps	%xmm0, 0x5a0(%rbp)
1401bb1f4:     	movq	%rbx, 0x610(%rbp)
1401bb1fb:     	movq	(%r14), %rax
1401bb1fe:     	movq	0x10(%r14), %r15
1401bb202:     	subq	%r15, %rax
1401bb205:     	cmpq	$0x7f, %rax
1401bb209:     	ja	0x1401bb2b9 <.text+0x1ba2b9>
1401bb20f:     	movq	$0x1, 0x20(%rsp)
1401bb218:     	movl	$0x80, %r8d
1401bb21e:     	movl	$0x1, %r9d
1401bb224:     	movq	%r14, %rcx
1401bb227:     	movq	%r15, %rdx
1401bb22a:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401bb22f:     	nop
1401bb230:     	jmp	0x1401bb2b9 <.text+0x1ba2b9>
1401bb235:     	movq	0x150(%rbp), %r14
1401bb23c:     	movups	0x1e0(%rbp), %xmm0
1401bb243:     	movaps	%xmm0, 0x600(%rbp)
1401bb24a:     	movups	0x1d0(%rbp), %xmm0
1401bb251:     	movaps	%xmm0, 0x5f0(%rbp)
1401bb258:     	movups	0x1c0(%rbp), %xmm0
1401bb25f:     	movaps	%xmm0, 0x5e0(%rbp)
1401bb266:     	movups	0x180(%rbp), %xmm0
1401bb26d:     	movups	0x190(%rbp), %xmm1
1401bb274:     	movups	0x1a0(%rbp), %xmm2
1401bb27b:     	movups	0x1b0(%rbp), %xmm3
1401bb282:     	movaps	%xmm3, 0x5d0(%rbp)
1401bb289:     	movaps	%xmm2, 0x5c0(%rbp)
1401bb290:     	movaps	%xmm1, 0x5b0(%rbp)
1401bb297:     	movaps	%xmm0, 0x5a0(%rbp)
1401bb29e:     	movq	%rbx, 0x610(%rbp)
1401bb2a5:     	movq	(%r14), %rax
1401bb2a8:     	movq	0x10(%r14), %r15
1401bb2ac:     	subq	%r15, %rax
1401bb2af:     	cmpq	$0x7f, %rax
1401bb2b3:     	jbe	0x1401bb8eb <.text+0x1ba8eb>
1401bb2b9:     	movq	0x8(%r14), %rax
1401bb2bd:     	leaq	0x6f73c(%rip), %rcx     # 0x14022aa00 <.text+0x229a00>
1401bb2c4:     	movq	%rcx, (%rax,%r15)
1401bb2c8:     	movups	0x180(%rbp), %xmm0
1401bb2cf:     	movups	0x190(%rbp), %xmm1
1401bb2d6:     	movups	0x1a0(%rbp), %xmm2
1401bb2dd:     	movups	0x1b0(%rbp), %xmm3
1401bb2e4:     	movups	%xmm0, 0x8(%rax,%r15)
1401bb2ea:     	movups	%xmm1, 0x18(%rax,%r15)
1401bb2f0:     	movups	%xmm2, 0x28(%rax,%r15)
1401bb2f6:     	movups	%xmm3, 0x38(%rax,%r15)
1401bb2fc:     	movups	0x1c0(%rbp), %xmm0
1401bb303:     	movups	%xmm0, 0x48(%rax,%r15)
1401bb309:     	movups	0x1d0(%rbp), %xmm0
1401bb310:     	movups	%xmm0, 0x58(%rax,%r15)
1401bb316:     	movups	0x1e0(%rbp), %xmm0
1401bb31d:     	movups	%xmm0, 0x68(%rax,%r15)
1401bb323:     	movq	%rbx, 0x78(%rax,%r15)
1401bb328:     	subq	$-0x80, %r15
1401bb32c:     	movq	%r15, 0x10(%r14)
1401bb330:     	cmpb	$0x0, 0x428(%rbp)
1401bb337:     	jne	0x1401bb353 <.text+0x1ba353>
1401bb339:     	movq	0x430(%rbp), %rax
1401bb340:     	lock
1401bb341:     	decq	(%rax)
1401bb344:     	jne	0x1401bb353 <.text+0x1ba353>
1401bb346:     	leaq	0x430(%rbp), %rcx
1401bb34d:     	callq	0x14496e3f0 <.text+0x496d3f0>
1401bb352:     	nop
1401bb353:     	cmpb	$0x0, 0x530(%rbp)
1401bb35a:     	jne	0x1401bb375 <.text+0x1ba375>
1401bb35c:     	movq	0x538(%rbp), %rax
1401bb363:     	lock
1401bb364:     	decq	(%rax)
1401bb367:     	jne	0x1401bb375 <.text+0x1ba375>
1401bb369:     	leaq	0x538(%rbp), %rcx
1401bb370:     	callq	0x14496e3f0 <.text+0x496d3f0>
1401bb375:     	xorps	%xmm0, %xmm0
1401bb378:     	movaps	%xmm0, 0x220(%rbp)
1401bb37f:     	movaps	%xmm0, 0x210(%rbp)
1401bb386:     	movaps	%xmm0, 0x200(%rbp)
1401bb38d:     	movaps	%xmm0, 0x1f0(%rbp)
1401bb394:     	movaps	%xmm0, 0x1e0(%rbp)
1401bb39b:     	movq	$0x0, 0x230(%rbp)
1401bb3a6:     	movw	$0x0, 0x724(%rbp)
1401bb3af:     	movl	$0x0, 0x720(%rbp)
1401bb3b9:     	movups	%xmm12, 0x238(%rbp)
1401bb3c1:     	movups	%xmm10, 0x248(%rbp)
1401bb3c9:     	movups	0x5bfd588(%rip), %xmm0  # 0x145db8958
1401bb3d0:     	movups	%xmm0, 0x258(%rbp)
1401bb3d7:     	movups	%xmm15, 0x268(%rbp)
1401bb3df:     	movups	0x5bfd5a2(%rip), %xmm0  # 0x145db8988
1401bb3e6:     	movups	%xmm0, 0x288(%rbp)
1401bb3ed:     	movups	0x5bfd584(%rip), %xmm0  # 0x145db8978
1401bb3f4:     	movups	%xmm0, 0x278(%rbp)
1401bb3fb:     	movups	0x5bfd5a6(%rip), %xmm0  # 0x145db89a8
1401bb402:     	movups	%xmm0, 0x2a8(%rbp)
1401bb409:     	movups	%xmm11, 0x298(%rbp)
1401bb411:     	movaps	%xmm6, 0x180(%rbp)
1401bb418:     	movq	$0x0, 0x190(%rbp)
1401bb423:     	movups	%xmm7, 0x198(%rbp)
1401bb42a:     	movq	$0x0, 0x1a8(%rbp)
1401bb435:     	movaps	%xmm8, 0x1b0(%rbp)
1401bb43d:     	movq	$0x0, 0x1c0(%rbp)
1401bb448:     	movups	%xmm9, 0x1c8(%rbp)
1401bb450:     	movq	$0x0, 0x1d8(%rbp)
1401bb45b:     	leaq	0x5a8(%rbp), %rcx
1401bb462:     	leaq	0x180(%rbp), %rdx
1401bb469:     	movl	$0x138, %r8d            # imm = 0x138
1401bb46f:     	callq	0x145bc977b <.text+0x5bc877b>
1401bb474:     	movaps	0x5bb1de5(%rip), %xmm0  # 0x145d6d260
1401bb47b:     	movups	%xmm0, 0x6e0(%rbp)
1401bb482:     	movl	$0x1, 0x6f0(%rbp)
1401bb48c:     	movq	$0x0, 0x6f4(%rbp)
1401bb497:     	movb	$0x1, 0x6fc(%rbp)
1401bb49e:     	movq	$0x0, 0x700(%rbp)
1401bb4a9:     	movl	$0x3f800000, 0x708(%rbp) # imm = 0x3F800000
1401bb4b3:     	movw	$0x0, 0x70c(%rbp)
1401bb4bc:     	movl	$0x10000, 0x70e(%rbp)   # imm = 0x10000
1401bb4c6:     	movw	$0x0, 0x712(%rbp)
1401bb4cf:     	movl	$0x10000, 0x714(%rbp)   # imm = 0x10000
1401bb4d9:     	movw	$0x0, 0x718(%rbp)
1401bb4e2:     	movl	$0x0, 0x71a(%rbp)
1401bb4ec:     	movw	$0x1, 0x71e(%rbp)
1401bb4f5:     	movq	%r12, 0x5a0(%rbp)
1401bb4fc:     	leaq	0x410(%rbp), %rcx
1401bb503:     	leaq	0x5a0(%rbp), %r8
1401bb50a:     	movq	%rdi, %rdx
1401bb50d:     	callq	0x140189f40 <.text+0x188f40>
1401bb512:     	movq	0x410(%rbp), %r13
1401bb519:     	movq	0x438(%rbp), %rax
1401bb520:     	movq	%r13, 0x510(%rbp)
1401bb527:     	movups	0x418(%rbp), %xmm0
1401bb52e:     	movups	%xmm0, 0x518(%rbp)
1401bb535:     	movups	0x428(%rbp), %xmm0
1401bb53c:     	movups	%xmm0, 0x528(%rbp)
1401bb543:     	movq	%rax, 0x538(%rbp)
1401bb54a:     	cmpb	$0x1, (%rsi)
1401bb54d:     	jne	0x1401bb56d <.text+0x1ba56d>
1401bb54f:     	movl	0x1(%rsi), %eax
1401bb552:     	movl	0x4(%rsi), %ecx
1401bb555:     	movl	%ecx, 0x4a3(%rbp)
1401bb55b:     	movl	%eax, 0x4a0(%rbp)
1401bb561:     	movq	0x8(%rsi), %rax
1401bb565:     	movzbl	0x10(%rsi), %ecx
1401bb569:     	movb	$0x1, %dl
1401bb56b:     	jmp	0x1401bb57d <.text+0x1ba57d>
1401bb56d:     	movq	0x8(%rsi), %rax
1401bb571:     	lock
1401bb572:     	incq	(%rax)
1401bb575:     	jle	0x1401bb943 <.text+0x1ba943>
1401bb57b:     	xorl	%edx, %edx
1401bb57d:     	leaq	0x518(%rbp), %rdi
1401bb584:     	movups	0x5bfd5e5(%rip), %xmm0  # 0x145db8b70
1401bb58b:     	movups	%xmm0, 0x4b1(%rbp)
1401bb592:     	movl	$0x3f800000, 0x4c1(%rbp) # imm = 0x3F800000
1401bb59c:     	movq	$0x0, 0x5a8(%rbp)
1401bb5a7:     	movq	$0x1, 0x5b0(%rbp)
1401bb5b2:     	xorps	%xmm0, %xmm0
1401bb5b5:     	movups	%xmm0, 0x5b8(%rbp)
1401bb5bc:     	movq	$0x4, 0x5c8(%rbp)
1401bb5c7:     	movq	$0x0, 0x5d0(%rbp)
1401bb5d2:     	movb	%dl, 0x5d8(%rbp)
1401bb5d8:     	movl	0x4a0(%rbp), %edx
1401bb5de:     	movl	0x4a3(%rbp), %r8d
1401bb5e5:     	movl	%edx, 0x5d9(%rbp)
1401bb5eb:     	movl	%r8d, 0x5dc(%rbp)
1401bb5f2:     	movq	%rax, 0x5e0(%rbp)
1401bb5f9:     	movq	%rcx, 0x5e8(%rbp)
1401bb600:     	movl	$0x41300000, 0x5f0(%rbp) # imm = 0x41300000
1401bb60a:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
1401bb613:     	movb	$0x1, 0x5f6(%rbp)
1401bb61a:     	movups	0x4b0(%rbp), %xmm0
1401bb621:     	movups	%xmm0, 0x5f7(%rbp)
1401bb628:     	movq	0x4bd(%rbp), %rax
1401bb62f:     	movq	%rax, 0x604(%rbp)
1401bb636:     	movl	0x5bb2cac(%rip), %eax   # 0x145d6e2e8
1401bb63c:     	movl	%eax, 0x61c(%rbp)
1401bb642:     	movups	0x5bb2c8f(%rip), %xmm0  # 0x145d6e2d8
1401bb649:     	movups	%xmm0, 0x60c(%rbp)
1401bb650:     	movsd	0x5bb1b78(%rip), %xmm0  # 0x145d6d1d0
1401bb658:     	movsd	%xmm0, 0x620(%rbp)
1401bb660:     	movq	%r13, 0x5a0(%rbp)
1401bb667:     	leaq	0x180(%rbp), %rcx
1401bb66e:     	leaq	0x5a0(%rbp), %r8
1401bb675:     	movq	%rdi, %rdx
1401bb678:     	callq	0x1401909a0 <.text+0x18f9a0>
1401bb67d:     	leaq	0x5bfd500(%rip), %rcx   # 0x145db8b84
1401bb684:     	movl	$0x9, %edx
1401bb689:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401bb68e:     	movq	%rdx, %rbx
1401bb691:     	testq	%rdx, %rdx
1401bb694:     	jns	0x1401bb6a6 <.text+0x1ba6a6>
1401bb696:     	xorl	%r12d, %r12d
1401bb699:     	movq	%r12, %rcx
1401bb69c:     	movq	%rbx, %rdx
1401bb69f:     	callq	0x145d6944b <.text+0x5d6844b>
1401bb6a4:     	ud2
1401bb6a6:     	je	0x1401bb6fd <.text+0x1ba6fd>
1401bb6a8:     	movq	%rax, %r15
1401bb6ab:     	callq	0x140002200 <.text+0x1200>
1401bb6b0:     	movl	$0x1, %r12d
1401bb6b6:     	movl	$0x1, %edx
1401bb6bb:     	movq	%rbx, %rcx
1401bb6be:     	callq	0x1400021c0 <.text+0x11c0>
1401bb6c3:     	testq	%rax, %rax
1401bb6c6:     	je	0x1401bb699 <.text+0x1ba699>
1401bb6c8:     	movq	%rax, %r14
1401bb6cb:     	movq	%rax, %rcx
1401bb6ce:     	movq	%r15, %rdx
1401bb6d1:     	movq	%rbx, %r8
1401bb6d4:     	callq	0x145bc977b <.text+0x5bc877b>
1401bb6d9:     	cmpb	$0x1, 0x18(%rsi)
1401bb6dd:     	jne	0x1401bb709 <.text+0x1ba709>
1401bb6df:     	movl	0x19(%rsi), %eax
1401bb6e2:     	movl	0x1c(%rsi), %ecx
1401bb6e5:     	movl	%ecx, 0x49b(%rbp)
1401bb6eb:     	movl	%eax, 0x498(%rbp)
1401bb6f1:     	movq	0x20(%rsi), %rax
1401bb6f5:     	movzbl	0x28(%rsi), %ecx
1401bb6f9:     	movb	$0x1, %dl
1401bb6fb:     	jmp	0x1401bb719 <.text+0x1ba719>
1401bb6fd:     	movl	$0x1, %r14d
1401bb703:     	cmpb	$0x1, 0x18(%rsi)
1401bb707:     	je	0x1401bb6df <.text+0x1ba6df>
1401bb709:     	movq	0x20(%rsi), %rax
1401bb70d:     	lock
1401bb70e:     	incq	(%rax)
1401bb711:     	jle	0x1401bb943 <.text+0x1ba943>
1401bb717:     	xorl	%edx, %edx
1401bb719:     	movups	0x5bfd14c(%rip), %xmm0  # 0x145db886c
1401bb720:     	movups	%xmm0, 0x4b1(%rbp)
1401bb727:     	movl	$0x3f800000, 0x4c1(%rbp) # imm = 0x3F800000
1401bb731:     	movq	%rbx, 0x5a8(%rbp)
1401bb738:     	movq	%r14, 0x5b0(%rbp)
1401bb73f:     	movq	%rbx, 0x5b8(%rbp)
1401bb746:     	movq	$0x0, 0x5c0(%rbp)
1401bb751:     	movq	$0x4, 0x5c8(%rbp)
1401bb75c:     	movq	$0x0, 0x5d0(%rbp)
1401bb767:     	movb	%dl, 0x5d8(%rbp)
1401bb76d:     	movl	0x498(%rbp), %edx
1401bb773:     	movl	0x49b(%rbp), %r8d
1401bb77a:     	movl	%edx, 0x5d9(%rbp)
1401bb780:     	movl	%r8d, 0x5dc(%rbp)
1401bb787:     	movq	%rax, 0x5e0(%rbp)
1401bb78e:     	movq	%rcx, 0x5e8(%rbp)
1401bb795:     	movl	$0x41c00000, 0x5f0(%rbp) # imm = 0x41C00000
1401bb79f:     	movw	$0x190, 0x5f4(%rbp)     # imm = 0x190
1401bb7a8:     	movb	$0x1, 0x5f6(%rbp)
1401bb7af:     	movups	0x4b0(%rbp), %xmm0
1401bb7b6:     	movups	%xmm0, 0x5f7(%rbp)
1401bb7bd:     	movq	0x4bd(%rbp), %rax
1401bb7c4:     	movq	%rax, 0x604(%rbp)
1401bb7cb:     	movl	$0x0, 0x60c(%rbp)
1401bb7d5:     	movaps	0x5bfc5d4(%rip), %xmm0  # 0x145db7db0
1401bb7dc:     	movups	%xmm0, 0x610(%rbp)
1401bb7e3:     	movsd	0x5bfc5d5(%rip), %xmm0  # 0x145db7dc0
1401bb7eb:     	movsd	%xmm0, 0x620(%rbp)
1401bb7f3:     	movq	%r13, 0x5a0(%rbp)
1401bb7fa:     	leaq	0x180(%rbp), %rcx
1401bb801:     	leaq	0x5a0(%rbp), %r8
1401bb808:     	movq	%rdi, %rdx
1401bb80b:     	callq	0x14018ef20 <.text+0x18df20>
1401bb810:     	movq	0x128(%rbp), %rax
1401bb817:     	movaps	0x840(%rbp), %xmm6
1401bb81e:     	movaps	0x850(%rbp), %xmm7
1401bb825:     	movaps	0x860(%rbp), %xmm8
1401bb82d:     	movaps	0x870(%rbp), %xmm9
1401bb835:     	movaps	0x880(%rbp), %xmm10
1401bb83d:     	movaps	0x890(%rbp), %xmm11
1401bb845:     	movaps	0x8a0(%rbp), %xmm12
1401bb84d:     	movaps	0x8b0(%rbp), %xmm13
1401bb855:     	movaps	0x8c0(%rbp), %xmm14
1401bb85d:     	movaps	0x8d0(%rbp), %xmm15
1401bb865:     	addq	$0x968, %rsp            # imm = 0x968
1401bb86c:     	popq	%rbx
1401bb86d:     	popq	%rdi
1401bb86e:     	popq	%rsi
1401bb86f:     	popq	%r12
1401bb871:     	popq	%r13
1401bb873:     	popq	%r14
1401bb875:     	popq	%r15
1401bb877:     	popq	%rbp
1401bb878:     	retq
1401bb879:     	movq	$0x1, 0x20(%rsp)
1401bb882:     	movl	$0x80, %r8d
1401bb888:     	movl	$0x1, %r9d
1401bb88e:     	movq	%r13, %rcx
1401bb891:     	movq	%rbx, %rdx
1401bb894:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401bb899:     	nop
1401bb89a:     	jmp	0x1401b95ad <.text+0x1b85ad>
1401bb89f:     	movq	$0x1, 0x20(%rsp)
1401bb8a8:     	movl	$0x80, %r8d
1401bb8ae:     	movl	$0x1, %r9d
1401bb8b4:     	movq	%r15, %rcx
1401bb8b7:     	movq	%rbx, %rdx
1401bb8ba:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401bb8bf:     	nop
1401bb8c0:     	jmp	0x1401b99f9 <.text+0x1b89f9>
1401bb8c5:     	movq	$0x1, 0x20(%rsp)
1401bb8ce:     	movl	$0x98, %r8d
1401bb8d4:     	movl	$0x1, %r9d
1401bb8da:     	movq	%r15, %rcx
1401bb8dd:     	movq	%rbx, %rdx
1401bb8e0:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401bb8e5:     	nop
1401bb8e6:     	jmp	0x1401ba1d4 <.text+0x1b91d4>
1401bb8eb:     	movq	$0x1, 0x20(%rsp)
1401bb8f4:     	movl	$0x80, %r8d
1401bb8fa:     	movl	$0x1, %r9d
1401bb900:     	movq	%r14, %rcx
1401bb903:     	movq	%r15, %rdx
1401bb906:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401bb90b:     	nop
1401bb90c:     	jmp	0x1401bb2b9 <.text+0x1ba2b9>
1401bb911:     	movl	$0x1, %ecx
1401bb916:     	movl	$0x1, %edx
1401bb91b:     	callq	0x145d6944b <.text+0x5d6844b>
1401bb920:     	ud2
1401bb922:     	movl	$0x1, %ecx
1401bb927:     	movl	$0x5, %edx
1401bb92c:     	callq	0x145d6944b <.text+0x5d6844b>
1401bb931:     	ud2
1401bb933:     	movl	$0x1, %ecx
1401bb938:     	movl	$0x44, %edx
1401bb93d:     	callq	0x145d6944b <.text+0x5d6844b>
1401bb942:     	nop
1401bb943:     	ud2

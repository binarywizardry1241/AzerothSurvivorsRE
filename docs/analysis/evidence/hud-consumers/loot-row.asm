
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401b2970:     	pushq	%rbp
1401b2971:     	pushq	%r15
1401b2973:     	pushq	%r14
1401b2975:     	pushq	%r13
1401b2977:     	pushq	%r12
1401b2979:     	pushq	%rsi
1401b297a:     	pushq	%rdi
1401b297b:     	pushq	%rbx
1401b297c:     	subq	$0x6c8, %rsp            # imm = 0x6C8
1401b2983:     	leaq	0x80(%rsp), %rbp
1401b298b:     	movaps	%xmm15, 0x630(%rbp)
1401b2993:     	movaps	%xmm14, 0x620(%rbp)
1401b299b:     	movaps	%xmm13, 0x610(%rbp)
1401b29a3:     	movaps	%xmm12, 0x600(%rbp)
1401b29ab:     	movaps	%xmm11, 0x5f0(%rbp)
1401b29b3:     	movaps	%xmm10, 0x5e0(%rbp)
1401b29bb:     	movaps	%xmm9, 0x5d0(%rbp)
1401b29c3:     	movaps	%xmm8, 0x5c0(%rbp)
1401b29cb:     	movaps	%xmm7, 0x5b0(%rbp)
1401b29d2:     	movaps	%xmm6, 0x5a0(%rbp)
1401b29d9:     	movq	$-0x2, 0x598(%rbp)
1401b29e4:     	movq	%rcx, %r13
1401b29e7:     	movq	(%rcx), %rbx
1401b29ea:     	movq	0x28(%rcx), %rax
1401b29ee:     	movq	%rbx, 0x240(%rbp)
1401b29f5:     	movups	0x8(%rcx), %xmm0
1401b29f9:     	movups	%xmm0, 0x248(%rbp)
1401b2a00:     	movups	0x18(%rcx), %xmm0
1401b2a04:     	movups	%xmm0, 0x258(%rbp)
1401b2a0b:     	movq	%rax, 0x268(%rbp)
1401b2a12:     	movq	(%rdx), %rax
1401b2a15:     	movq	(%rax), %rax
1401b2a18:     	movq	0x40(%rax), %rcx
1401b2a1c:     	testq	%rcx, %rcx
1401b2a1f:     	je	0x1401b39e1 <.text+0x1b29e1>
1401b2a25:     	leaq	0x248(%rbp), %r12
1401b2a2c:     	movq	0x38(%rax), %r15
1401b2a30:     	leaq	(%rcx,%rcx,4), %rax
1401b2a34:     	leaq	(%r15,%rax,8), %rax
1401b2a38:     	movq	%rax, 0x550(%rbp)
1401b2a3f:     	leaq	0x318(%rbp), %r14
1401b2a46:     	movq	0x8(%rdx), %rax
1401b2a4a:     	movq	%rax, 0x540(%rbp)
1401b2a51:     	movq	0x10(%rdx), %rax
1401b2a55:     	movq	%rax, 0x570(%rbp)
1401b2a5c:     	leaq	0xf8(%rbp), %rsi
1401b2a63:     	movss	0x5bba8d8(%rip), %xmm9  # 0x145d6d344
1401b2a6c:     	leaq	0x5c06865(%rip), %rcx   # 0x145db92d8
1401b2a73:     	movq	%rbx, 0x548(%rbp)
1401b2a7a:     	movl	$0x6, %edx
1401b2a7f:     	movq	%r15, %r8
1401b2a82:     	callq	0x142ad39e0 <.text+0x2ad29e0>
1401b2a87:     	testq	%rax, %rax
1401b2a8a:     	jne	0x1401b2a93 <.text+0x1b1a93>
1401b2a8c:     	movq	0x7e277fd(%rip), %rax   # 0x147fda290
1401b2a93:     	movq	$-0x1, %rdi
1401b2a9a:     	cmpb	$0x2, (%rax)
1401b2a9d:     	jne	0x1401b2ab0 <.text+0x1b1ab0>
1401b2a9f:     	cmpq	$0x0, 0x8(%rax)
1401b2aa4:     	jne	0x1401b2ab0 <.text+0x1b1ab0>
1401b2aa6:     	movq	0x10(%rax), %rdi
1401b2aaa:     	decq	%rdi
1401b2aad:     	nopl	(%rax)
1401b2ab0:     	movl	$0x3, %edx
1401b2ab5:     	leaq	0x5c08154(%rip), %rcx   # 0x145dbac10
1401b2abc:     	movq	%r15, %r8
1401b2abf:     	callq	0x142ad39e0 <.text+0x2ad29e0>
1401b2ac4:     	testq	%rax, %rax
1401b2ac7:     	jne	0x1401b2ad0 <.text+0x1b1ad0>
1401b2ac9:     	movq	0x7e277c0(%rip), %rax   # 0x147fda290
1401b2ad0:     	movq	%r15, 0x588(%rbp)
1401b2ad7:     	cmpb	$0x1, (%rax)
1401b2ada:     	leaq	-0x30(%rbp), %rcx
1401b2ade:     	jne	0x1401b2af0 <.text+0x1b1af0>
1401b2ae0:     	movzbl	0x1(%rax), %eax
1401b2ae4:     	movl	%eax, 0x594(%rbp)
1401b2aea:     	jmp	0x1401b2afa <.text+0x1b1afa>
1401b2aec:     	nopl	(%rax)
1401b2af0:     	movl	$0x0, 0x594(%rbp)
1401b2afa:     	leaq	0x2b0(%rbp), %r15
1401b2b01:     	movaps	%xmm9, %xmm10
1401b2b05:     	movaps	%xmm9, %xmm8
1401b2b09:     	movss	0x5bba82e(%rip), %xmm15 # 0x145d6d340
1401b2b12:     	movaps	%xmm15, %xmm12
1401b2b16:     	movaps	%xmm15, %xmm13
1401b2b1a:     	movss	0x5bba885(%rip), %xmm14 # 0x145d6d3a8
1401b2b23:     	movss	0x5c0517d(%rip), %xmm6  # 0x145db7ca8
1401b2b2b:     	movss	0x5bba9ad(%rip), %xmm7  # 0x145d6d4e0
1401b2b33:     	cmpq	$0x5, %rdi
1401b2b37:     	jae	0x1401b2bac <.text+0x1b1bac>
1401b2b39:     	leaq	0x5c0a558(%rip), %rax   # 0x145dbd098
1401b2b40:     	movss	(%rax,%rdi,4), %xmm10
1401b2b46:     	leaq	0x5c0a55f(%rip), %rax   # 0x145dbd0ac
1401b2b4d:     	movss	(%rax,%rdi,4), %xmm8
1401b2b53:     	leaq	0x5c0a566(%rip), %rax   # 0x145dbd0c0
1401b2b5a:     	movss	(%rax,%rdi,4), %xmm9
1401b2b60:     	leaq	0x5c0a489(%rip), %rax   # 0x145dbcff0
1401b2b67:     	movss	(%rax,%rdi,4), %xmm12
1401b2b6d:     	leaq	0x5c0a490(%rip), %rax   # 0x145dbd004
1401b2b74:     	movss	(%rax,%rdi,4), %xmm13
1401b2b7a:     	leaq	0x5c0a497(%rip), %rax   # 0x145dbd018
1401b2b81:     	movss	(%rax,%rdi,4), %xmm15
1401b2b87:     	leaq	0x5c0a49e(%rip), %rax   # 0x145dbd02c
1401b2b8e:     	movss	(%rax,%rdi,4), %xmm14
1401b2b94:     	leaq	0x5c0a4a5(%rip), %rax   # 0x145dbd040
1401b2b9b:     	movss	(%rax,%rdi,4), %xmm6
1401b2ba0:     	leaq	0x5c0a4ad(%rip), %rax   # 0x145dbd054
1401b2ba7:     	movss	(%rax,%rdi,4), %xmm7
1401b2bac:     	movq	0x588(%rbp), %rax
1401b2bb3:     	movss	0x20(%rax), %xmm11
1401b2bb9:     	movw	$0x0, 0x414(%rbp)
1401b2bc2:     	movb	$0x1, 0x404(%rbp)
1401b2bc9:     	xorps	%xmm0, %xmm0
1401b2bcc:     	movups	%xmm0, 0x20(%r14)
1401b2bd1:     	movups	%xmm0, 0x10(%r14)
1401b2bd6:     	movups	%xmm0, (%r14)
1401b2bda:     	movabsq	$0x438c000000000001, %rax # imm = 0x438C000000000001
1401b2be4:     	movq	%rax, 0x348(%rbp)
1401b2beb:     	movq	$0x0, 0x310(%rbp)
1401b2bf6:     	movups	%xmm0, 0x38(%r14)
1401b2bfb:     	movq	$0x0, 0x48(%r14)
1401b2c03:     	movl	$0x5, 0x42a(%rbp)
1401b2c0d:     	movups	0x5c05d34(%rip), %xmm0  # 0x145db8948
1401b2c14:     	movups	%xmm0, 0x60(%r14)
1401b2c19:     	movups	0x5c05d18(%rip), %xmm0  # 0x145db8938
1401b2c20:     	movups	%xmm0, 0x50(%r14)
1401b2c25:     	movaps	0x5c05084(%rip), %xmm0  # 0x145db7cb0
1401b2c2c:     	movups	%xmm0, 0x388(%rbp)
1401b2c33:     	movaps	0x5bc1216(%rip), %xmm0  # 0x145d73e50
1401b2c3a:     	movups	%xmm0, 0x398(%rbp)
1401b2c41:     	movaps	0x5bba648(%rip), %xmm0  # 0x145d6d290
1401b2c48:     	movups	%xmm0, 0x3a8(%rbp)
1401b2c4f:     	movups	%xmm0, 0x3b8(%rbp)
1401b2c56:     	movaps	0x5bba943(%rip), %xmm0  # 0x145d6d5a0
1401b2c5d:     	movups	%xmm0, 0x3c8(%rbp)
1401b2c64:     	movups	%xmm0, 0x3d8(%rbp)
1401b2c6b:     	movq	$0x0, 0x408(%rbp)
1401b2c76:     	movl	$0x3f800000, 0x410(%rbp) # imm = 0x3F800000
1401b2c80:     	movaps	0x5bba5d9(%rip), %xmm0  # 0x145d6d260
1401b2c87:     	movups	%xmm0, 0x3e8(%rbp)
1401b2c8e:     	movl	$0x1, 0x3f8(%rbp)
1401b2c98:     	movss	0x5bba9b0(%rip), %xmm0  # 0x145d6d650
1401b2ca0:     	movlps	%xmm0, 0x3fc(%rbp)
1401b2ca7:     	movq	$0x0, 0x422(%rbp)
1401b2cb2:     	movups	0x5c05bc7(%rip), %xmm0  # 0x145db8880
1401b2cb9:     	movaps	%xmm0, 0x2b0(%rbp)
1401b2cc0:     	movq	$0x0, 0x2c0(%rbp)
1401b2ccb:     	movups	0x5c05bc6(%rip), %xmm0  # 0x145db8898
1401b2cd2:     	movups	%xmm0, -0x50(%r14)
1401b2cd7:     	movq	$0x0, -0x40(%r14)
1401b2cdf:     	movups	0x5c05bca(%rip), %xmm0  # 0x145db88b0
1401b2ce6:     	movups	%xmm0, -0x38(%r14)
1401b2ceb:     	movq	$0x0, -0x28(%r14)
1401b2cf3:     	movups	0x5c05bce(%rip), %xmm0  # 0x145db88c8
1401b2cfa:     	movups	%xmm0, -0x20(%r14)
1401b2cff:     	movq	$0x0, -0x10(%r14)
1401b2d07:     	movl	$0x10000, 0xfe(%r14)    # imm = 0x10000
1401b2d12:     	movw	$0x0, 0x102(%r14)
1401b2d1c:     	movw	$0x0, 0x108(%r14)
1401b2d26:     	movl	$0x10000, 0x104(%r14)   # imm = 0x10000
1401b2d31:     	movl	$0x0, 0x510(%rbp)
1401b2d3b:     	movss	%xmm10, 0x514(%rbp)
1401b2d44:     	movss	%xmm8, 0x518(%rbp)
1401b2d4d:     	movss	%xmm9, 0x51c(%rbp)
1401b2d56:     	movl	$0x3eb33333, 0x520(%rbp) # imm = 0x3EB33333
1401b2d60:     	movq	%rcx, %rdi
1401b2d63:     	leaq	0x510(%rbp), %rdx
1401b2d6a:     	callq	0x144c67100 <.text+0x4c66100>
1401b2d6f:     	nop
1401b2d70:     	movaps	-0x30(%rbp), %xmm0
1401b2d74:     	movups	%xmm0, 0x274(%rbp)
1401b2d7b:     	movl	$0x1, 0x270(%rbp)
1401b2d85:     	movl	$0x41600000, 0x48(%rsp) # imm = 0x41600000
1401b2d8d:     	movl	$0x1, 0x40(%rsp)
1401b2d95:     	movl	$0x0, 0x38(%rsp)
1401b2d9d:     	movl	$0x1, 0x30(%rsp)
1401b2da5:     	movl	$0x0, 0x28(%rsp)
1401b2dad:     	movl	$0x1, 0x20(%rsp)
1401b2db5:     	xorps	%xmm3, %xmm3
1401b2db8:     	movq	%rdi, %rcx
1401b2dbb:     	leaq	0x270(%rbp), %rdx
1401b2dc2:     	movl	$0x1, %r8d
1401b2dc8:     	callq	0x142633750 <.text+0x2632750>
1401b2dcd:     	nop
1401b2dce:     	movl	$0x180, %r8d            # imm = 0x180
1401b2dd4:     	leaq	0x90(%rbp), %rdi
1401b2ddb:     	movq	%rdi, %rcx
1401b2dde:     	movq	%r15, %rdx
1401b2de1:     	callq	0x145bc977b <.text+0x5bc877b>
1401b2de6:     	movups	-0x30(%rbp), %xmm0
1401b2dea:     	movups	%xmm0, 0x118(%rsi)
1401b2df1:     	movq	-0x20(%rbp), %rax
1401b2df5:     	movq	%rax, 0x128(%rsi)
1401b2dfc:     	movl	$0x198, %r8d            # imm = 0x198
1401b2e02:     	leaq	0x2b8(%rbp), %rcx
1401b2e09:     	movq	%rdi, %rdx
1401b2e0c:     	callq	0x145bc977b <.text+0x5bc877b>
1401b2e11:     	movl	$0x0, 0x450(%rbp)
1401b2e1b:     	movss	%xmm12, 0x454(%rbp)
1401b2e24:     	movss	%xmm13, 0x458(%rbp)
1401b2e2d:     	movss	%xmm15, 0x45c(%rbp)
1401b2e36:     	movq	$0x3f800000, 0x460(%rbp) # imm = 0x3F800000
1401b2e41:     	movss	%xmm12, 0x468(%rbp)
1401b2e4a:     	movss	%xmm13, 0x46c(%rbp)
1401b2e53:     	movss	%xmm15, 0x470(%rbp)
1401b2e5c:     	movq	$0x3f800000, 0x474(%rbp) # imm = 0x3F800000
1401b2e67:     	movss	%xmm12, 0x47c(%rbp)
1401b2e70:     	movss	%xmm13, 0x480(%rbp)
1401b2e79:     	movss	%xmm15, 0x484(%rbp)
1401b2e82:     	movq	$0x3f800000, 0x488(%rbp) # imm = 0x3F800000
1401b2e8d:     	movss	%xmm12, 0x490(%rbp)
1401b2e96:     	movss	%xmm13, 0x494(%rbp)
1401b2e9f:     	movss	%xmm15, 0x498(%rbp)
1401b2ea8:     	movq	$0x3f800000, 0x49c(%rbp) # imm = 0x3F800000
1401b2eb3:     	movss	%xmm14, 0x4a4(%rbp)
1401b2ebc:     	movss	%xmm6, 0x4a8(%rbp)
1401b2ec4:     	movss	%xmm7, 0x4ac(%rbp)
1401b2ecc:     	movl	$0x3f6b851f, 0x4b0(%rbp) # imm = 0x3F6B851F
1401b2ed6:     	movss	%xmm11, 0x4b4(%rbp)
1401b2edf:     	movups	0x5c05daa(%rip), %xmm0  # 0x145db8c90
1401b2ee6:     	movups	%xmm0, 0x1b0(%r14)
1401b2eee:     	movups	0x5c05d8b(%rip), %xmm0  # 0x145db8c80
1401b2ef5:     	movups	%xmm0, 0x1a0(%r14)
1401b2efd:     	movq	%rbx, 0x2b0(%rbp)
1401b2f04:     	leaq	0x60(%rbp), %rcx
1401b2f08:     	movq	%r12, %rdx
1401b2f0b:     	movq	%r15, %r8
1401b2f0e:     	callq	0x1401916d0 <.text+0x1906d0>
1401b2f13:     	movq	0x60(%rbp), %r12
1401b2f17:     	movq	0x88(%rbp), %rax
1401b2f1e:     	movq	%r12, 0x510(%rbp)
1401b2f25:     	movups	0x68(%rbp), %xmm0
1401b2f29:     	movups	%xmm0, 0x518(%rbp)
1401b2f30:     	movups	0x78(%rbp), %xmm0
1401b2f34:     	movups	%xmm0, 0x528(%rbp)
1401b2f3b:     	movq	%rax, 0x538(%rbp)
1401b2f42:     	movw	$0x0, 0x1f4(%rbp)
1401b2f4b:     	movb	$0x1, 0x1e4(%rbp)
1401b2f52:     	xorps	%xmm0, %xmm0
1401b2f55:     	movups	%xmm0, 0x10(%rsi)
1401b2f59:     	movups	%xmm0, (%rsi)
1401b2f5c:     	movaps	0x5c04c0d(%rip), %xmm1  # 0x145db7b70
1401b2f63:     	movups	%xmm1, 0x118(%rbp)
1401b2f6a:     	movq	$0x0, 0xf0(%rbp)
1401b2f75:     	movups	%xmm0, 0x40(%rsi)
1401b2f79:     	movups	%xmm0, 0x30(%rsi)
1401b2f7d:     	movw	$0x0, 0x114(%rsi)
1401b2f86:     	movl	$0x0, 0x110(%rsi)
1401b2f90:     	movups	0x5c059b1(%rip), %xmm0  # 0x145db8948
1401b2f97:     	movups	%xmm0, 0x60(%rsi)
1401b2f9b:     	movups	0x5c05996(%rip), %xmm0  # 0x145db8938
1401b2fa2:     	movups	%xmm0, 0x50(%rsi)
1401b2fa6:     	movups	0x5c059ab(%rip), %xmm6  # 0x145db8958
1401b2fad:     	movups	%xmm6, 0x70(%rsi)
1401b2fb1:     	movups	0x5c059b0(%rip), %xmm7  # 0x145db8968
1401b2fb8:     	movups	%xmm7, 0x80(%rsi)
1401b2fbf:     	movaps	0x5bba43a(%rip), %xmm0  # 0x145d6d400
1401b2fc6:     	movups	%xmm0, 0x188(%rbp)
1401b2fcd:     	movups	%xmm0, 0x198(%rbp)
1401b2fd4:     	movaps	0x5bba615(%rip), %xmm0  # 0x145d6d5f0
1401b2fdb:     	movups	%xmm0, 0x1a8(%rbp)
1401b2fe2:     	movups	%xmm0, 0x1b8(%rbp)
1401b2fe9:     	movw	$0x0, 0x206(%rbp)
1401b2ff2:     	movl	$0x0, 0x202(%rbp)
1401b2ffc:     	movq	$0x0, 0x1e8(%rbp)
1401b3007:     	movl	$0x3f800000, 0x1f0(%rbp) # imm = 0x3F800000
1401b3011:     	movaps	0x5bba248(%rip), %xmm0  # 0x145d6d260
1401b3018:     	movups	%xmm0, 0x1c8(%rbp)
1401b301f:     	movl	$0x1, 0x1d8(%rbp)
1401b3029:     	movq	$0x0, 0x1dc(%rbp)
1401b3034:     	movups	0x5c05845(%rip), %xmm0  # 0x145db8880
1401b303b:     	movaps	%xmm0, 0x90(%rbp)
1401b3042:     	movq	$0x0, 0xa0(%rbp)
1401b304d:     	movups	0x5c05844(%rip), %xmm0  # 0x145db8898
1401b3054:     	movups	%xmm0, -0x50(%rsi)
1401b3058:     	movq	$0x0, -0x40(%rsi)
1401b3060:     	movups	0x5c05849(%rip), %xmm0  # 0x145db88b0
1401b3067:     	movups	%xmm0, -0x38(%rsi)
1401b306b:     	movq	$0x0, -0x28(%rsi)
1401b3073:     	movups	0x5c0584e(%rip), %xmm0  # 0x145db88c8
1401b307a:     	movups	%xmm0, -0x20(%rsi)
1401b307e:     	movq	$0x0, -0x10(%rsi)
1401b3086:     	movl	$0x10000, 0xfe(%rsi)    # imm = 0x10000
1401b3090:     	movw	$0x0, 0x102(%rsi)
1401b3099:     	movw	$0x0, 0x108(%rsi)
1401b30a2:     	movl	$0x10000, 0x104(%rsi)   # imm = 0x10000
1401b30ac:     	movq	0x540(%rbp), %rax
1401b30b3:     	movq	(%rax), %rdi
1401b30b6:     	movl	$0x4, %edx
1401b30bb:     	leaq	0x5c06190(%rip), %rcx   # 0x145db9252
1401b30c2:     	movq	0x588(%rbp), %r8
1401b30c9:     	callq	0x142ad39e0 <.text+0x2ad29e0>
1401b30ce:     	nop
1401b30cf:     	testq	%rax, %rax
1401b30d2:     	jne	0x1401b30db <.text+0x1b20db>
1401b30d4:     	movq	0x7e271b5(%rip), %rax   # 0x147fda290
1401b30db:     	cmpb	$0x3, (%rax)
1401b30de:     	jne	0x1401b30f0 <.text+0x1b20f0>
1401b30e0:     	movq	0x10(%rax), %r8
1401b30e4:     	movq	0x18(%rax), %r9
1401b30e8:     	jmp	0x1401b30f9 <.text+0x1b20f9>
1401b30ea:     	nopw	(%rax,%rax)
1401b30f0:     	movl	$0x1, %r8d
1401b30f6:     	xorl	%r9d, %r9d
1401b30f9:     	movq	%r15, %rcx
1401b30fc:     	movq	%rdi, %rdx
1401b30ff:     	callq	0x1400123b0 <.text+0x113b0>
1401b3104:     	nop
1401b3105:     	leaq	-0x30(%rbp), %rcx
1401b3109:     	movq	%r15, %rdx
1401b310c:     	callq	0x1426d6630 <.text+0x26d5630>
1401b3111:     	nop
1401b3112:     	movl	$0x180, %r8d            # imm = 0x180
1401b3118:     	leaq	0x2b8(%rbp), %rcx
1401b311f:     	leaq	0x90(%rbp), %r15
1401b3126:     	movq	%r15, %rdx
1401b3129:     	callq	0x145bc977b <.text+0x5bc877b>
1401b312e:     	movl	$0x88, %r8d
1401b3134:     	leaq	0x488(%rbp), %rcx
1401b313b:     	leaq	-0x30(%rbp), %rdx
1401b313f:     	callq	0x145bc977b <.text+0x5bc877b>
1401b3144:     	movl	$0x0, 0x438(%rbp)
1401b314e:     	movss	%xmm10, 0x43c(%rbp)
1401b3157:     	movss	%xmm8, 0x440(%rbp)
1401b3160:     	movss	%xmm9, 0x444(%rbp)
1401b3169:     	movq	$0x3f800000, 0x448(%rbp) # imm = 0x3F800000
1401b3174:     	movss	%xmm10, 0x450(%rbp)
1401b317d:     	movss	%xmm8, 0x454(%rbp)
1401b3186:     	movss	%xmm9, 0x458(%rbp)
1401b318f:     	movq	$0x3f800000, 0x45c(%rbp) # imm = 0x3F800000
1401b319a:     	movss	%xmm10, 0x464(%rbp)
1401b31a3:     	movss	%xmm8, 0x468(%rbp)
1401b31ac:     	movss	%xmm9, 0x46c(%rbp)
1401b31b5:     	movq	$0x3f800000, 0x470(%rbp) # imm = 0x3F800000
1401b31c0:     	movss	%xmm10, 0x478(%rbp)
1401b31c9:     	movss	%xmm8, 0x47c(%rbp)
1401b31d2:     	movss	%xmm9, 0x480(%rbp)
1401b31db:     	movl	$0x3f800000, 0x484(%rbp) # imm = 0x3F800000
1401b31e5:     	movq	%r12, 0x2b0(%rbp)
1401b31ec:     	movq	%r15, %rcx
1401b31ef:     	leaq	0x518(%rbp), %rdi
1401b31f6:     	movq	%rdi, %rdx
1401b31f9:     	leaq	0x2b0(%rbp), %r8
1401b3200:     	callq	0x14018ba80 <.text+0x18aa80>
1401b3205:     	xorps	%xmm0, %xmm0
1401b3208:     	movups	%xmm0, 0x38(%rsi)
1401b320c:     	movups	%xmm0, 0x28(%rsi)
1401b3210:     	movups	%xmm0, 0x18(%rsi)
1401b3214:     	movups	%xmm0, 0x8(%rsi)
1401b3218:     	movups	%xmm0, -0x8(%rsi)
1401b321c:     	movq	$0x0, 0x48(%rsi)
1401b3224:     	movw	$0x0, 0x11c(%r14)
1401b322e:     	movl	$0x0, 0x118(%r14)
1401b3239:     	movups	0x5c05708(%rip), %xmm0  # 0x145db8948
1401b3240:     	movups	%xmm0, 0x60(%rsi)
1401b3244:     	movups	0x5c056ed(%rip), %xmm0  # 0x145db8938
1401b324b:     	movups	%xmm0, 0x50(%rsi)
1401b324f:     	movups	%xmm7, 0x80(%rsi)
1401b3256:     	movups	%xmm6, 0x70(%rsi)
1401b325a:     	movups	0x5c05727(%rip), %xmm0  # 0x145db8988
1401b3261:     	movups	%xmm0, 0xa0(%rsi)
1401b3268:     	movups	0x5c05709(%rip), %xmm0  # 0x145db8978
1401b326f:     	movups	%xmm0, 0x90(%rsi)
1401b3276:     	movups	0x5c0572b(%rip), %xmm0  # 0x145db89a8
1401b327d:     	movups	%xmm0, 0xc0(%rsi)
1401b3284:     	movups	0x5c0570d(%rip), %xmm0  # 0x145db8998
1401b328b:     	movups	%xmm0, 0xb0(%rsi)
1401b3292:     	movups	0x5c055e7(%rip), %xmm0  # 0x145db8880
1401b3299:     	movaps	%xmm0, 0x90(%rbp)
1401b32a0:     	movq	$0x0, 0xa0(%rbp)
1401b32ab:     	movups	0x5c055e6(%rip), %xmm0  # 0x145db8898
1401b32b2:     	movups	%xmm0, -0x50(%rsi)
1401b32b6:     	movq	$0x0, -0x40(%rsi)
1401b32be:     	movups	0x5c055eb(%rip), %xmm0  # 0x145db88b0
1401b32c5:     	movups	%xmm0, -0x38(%rsi)
1401b32c9:     	movq	$0x0, -0x28(%rsi)
1401b32d1:     	movups	0x5c055f0(%rip), %xmm0  # 0x145db88c8
1401b32d8:     	movups	%xmm0, -0x20(%rsi)
1401b32dc:     	movq	$0x0, -0x10(%rsi)
1401b32e4:     	movl	$0x138, %r8d            # imm = 0x138
1401b32ea:     	leaq	0x2b8(%rbp), %rcx
1401b32f1:     	movq	%r15, %rdx
1401b32f4:     	callq	0x145bc977b <.text+0x5bc877b>
1401b32f9:     	movaps	0x5bc0b00(%rip), %xmm0  # 0x145d73e00
1401b3300:     	movups	%xmm0, 0x3f0(%rbp)
1401b3307:     	movl	$0x1, 0x400(%rbp)
1401b3311:     	movq	$0x0, 0x404(%rbp)
1401b331c:     	movb	$0x1, 0x40c(%rbp)
1401b3323:     	movq	$0x0, 0x410(%rbp)
1401b332e:     	movl	$0x3f800000, 0x418(%rbp) # imm = 0x3F800000
1401b3338:     	movw	$0x0, 0x41c(%rbp)
1401b3341:     	movl	$0x10000, 0x106(%r14)   # imm = 0x10000
1401b334c:     	movw	$0x0, 0x10a(%r14)
1401b3356:     	movw	$0x0, 0x110(%r14)
1401b3360:     	movl	$0x10000, 0x10c(%r14)   # imm = 0x10000
1401b336b:     	movl	$0x0, 0x42a(%rbp)
1401b3375:     	movw	$0x1, 0x42e(%rbp)
1401b337e:     	movq	%r12, 0x2b0(%rbp)
1401b3385:     	leaq	0x270(%rbp), %rcx
1401b338c:     	movq	%rdi, %rdx
1401b338f:     	leaq	0x2b0(%rbp), %r8
1401b3396:     	callq	0x140189f40 <.text+0x188f40>
1401b339b:     	movq	0x270(%rbp), %rcx
1401b33a2:     	movq	0x298(%rbp), %rax
1401b33a9:     	movq	%rcx, 0x578(%rbp)
1401b33b0:     	movq	%rcx, -0x30(%rbp)
1401b33b4:     	movups	0x278(%rbp), %xmm0
1401b33bb:     	movups	%xmm0, -0x28(%rbp)
1401b33bf:     	movups	0x288(%rbp), %xmm0
1401b33c6:     	movups	%xmm0, -0x18(%rbp)
1401b33ca:     	movq	%rax, -0x8(%rbp)
1401b33ce:     	movq	0x570(%rbp), %r12
1401b33d5:     	movq	(%r12), %rdi
1401b33d9:     	movl	$0x8, %edx
1401b33de:     	leaq	0x5c059c6(%rip), %rcx   # 0x145db8dab
1401b33e5:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401b33ea:     	movq	%rax, 0x2a0(%rbp)
1401b33f1:     	movq	%rdx, 0x2a8(%rbp)
1401b33f8:     	movl	$0x4, %edx
1401b33fd:     	leaq	0x5c059af(%rip), %rcx   # 0x145db8db3
1401b3404:     	movq	0x588(%rbp), %r8
1401b340b:     	callq	0x142ad39e0 <.text+0x2ad29e0>
1401b3410:     	testq	%rax, %rax
1401b3413:     	jne	0x1401b341c <.text+0x1b241c>
1401b3415:     	movq	0x7e26e74(%rip), %rax   # 0x147fda290
1401b341c:     	cmpb	$0x3, (%rax)
1401b341f:     	movsd	0x5bb9da9(%rip), %xmm6  # 0x145d6d1d0
1401b3427:     	jne	0x1401b3440 <.text+0x1b2440>
1401b3429:     	movq	0x10(%rax), %rdx
1401b342d:     	movq	0x18(%rax), %r8
1401b3431:     	jmp	0x1401b3448 <.text+0x1b2448>
1401b3433:     	nopw	%cs:(%rax,%rax)
1401b3440:     	movl	$0x1, %edx
1401b3445:     	xorl	%r8d, %r8d
1401b3448:     	movq	%r15, %rcx
1401b344b:     	callq	0x145b9af10 <.text+0x5b99f10>
1401b3450:     	leaq	0x2a0(%rbp), %rax
1401b3457:     	movq	%rax, 0x2b0(%rbp)
1401b345e:     	leaq	-0x1b13a5(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
1401b3465:     	movq	%rax, 0x2b8(%rbp)
1401b346c:     	movq	%r15, 0x2c0(%rbp)
1401b3473:     	leaq	-0x1b139a(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
1401b347a:     	movq	%rax, 0x2c8(%rbp)
1401b3481:     	leaq	0x228(%rbp), %rcx
1401b3488:     	leaq	0x5c05928(%rip), %rdx   # 0x145db8db7
1401b348f:     	leaq	0x2b0(%rbp), %r15
1401b3496:     	movq	%r15, %r8
1401b3499:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401b349e:     	nop
1401b349f:     	movq	0x90(%rbp), %rdx
1401b34a6:     	testq	%rdx, %rdx
1401b34a9:     	je	0x1401b34bd <.text+0x1b24bd>
1401b34ab:     	movq	0x98(%rbp), %rcx
1401b34b2:     	movl	$0x1, %r8d
1401b34b8:     	callq	0x1400021d0 <.text+0x11d0>
1401b34bd:     	cmpb	$0x1, (%rdi)
1401b34c0:     	jne	0x1401b34f0 <.text+0x1b24f0>
1401b34c2:     	movl	0x1(%rdi), %eax
1401b34c5:     	movl	0x4(%rdi), %ecx
1401b34c8:     	movl	%ecx, 0x93(%rbp)
1401b34ce:     	movl	%eax, 0x90(%rbp)
1401b34d4:     	movq	0x8(%rdi), %rax
1401b34d8:     	movzbl	0x10(%rdi), %r10d
1401b34dd:     	movb	$0x1, %cl
1401b34df:     	jmp	0x1401b3500 <.text+0x1b2500>
1401b34e1:     	nopw	%cs:(%rax,%rax)
1401b34f0:     	movq	0x8(%rdi), %rax
1401b34f4:     	lock
1401b34f5:     	incq	(%rax)
1401b34f8:     	jle	0x1401b3a61 <.text+0x1b2a61>
1401b34fe:     	xorl	%ecx, %ecx
1401b3500:     	leaq	-0x28(%rbp), %rdx
1401b3504:     	movq	0x578(%rbp), %r11
1401b350b:     	movq	0x238(%rbp), %r8
1401b3512:     	leaq	0x2b8(%rbp), %r9
1401b3519:     	movq	%r8, 0x10(%r9)
1401b351d:     	movups	0x228(%rbp), %xmm0
1401b3524:     	movups	%xmm0, (%r9)
1401b3528:     	movl	0x90(%rbp), %r8d
1401b352f:     	movl	0x93(%rbp), %r9d
1401b3536:     	movl	%r9d, -0x2c(%r14)
1401b353a:     	movl	%r8d, -0x2f(%r14)
1401b353e:     	movups	0x5c052f7(%rip), %xmm0  # 0x145db883c
1401b3545:     	leaq	0x55c(%rbp), %r8
1401b354c:     	movups	%xmm0, (%r8)
1401b3550:     	movl	$0x3f800000, 0x10(%r8)  # imm = 0x3F800000
1401b3558:     	movq	$0x0, 0x2d0(%rbp)
1401b3563:     	movq	$0x4, 0x2d8(%rbp)
1401b356e:     	movq	$0x0, 0x2e0(%rbp)
1401b3579:     	movb	%cl, 0x2e8(%rbp)
1401b357f:     	movq	%rax, 0x2f0(%rbp)
1401b3586:     	movq	%r10, 0x2f8(%rbp)
1401b358d:     	movl	$0x41300000, 0x300(%rbp) # imm = 0x41300000
1401b3597:     	movw	$0x190, 0x304(%rbp)     # imm = 0x190
1401b35a0:     	movb	$0x1, 0x306(%rbp)
1401b35a7:     	movq	0x568(%rbp), %rax
1401b35ae:     	movq	%rax, -0x4(%r14)
1401b35b2:     	movups	0x55b(%rbp), %xmm0
1401b35b9:     	movups	%xmm0, -0x11(%r14)
1401b35be:     	movl	0x5bbad24(%rip), %eax   # 0x145d6e2e8
1401b35c4:     	movl	%eax, 0x14(%r14)
1401b35c8:     	movups	0x5bbad08(%rip), %xmm12 # 0x145d6e2d8
1401b35d0:     	movups	%xmm12, 0x4(%r14)
1401b35d5:     	movsd	%xmm6, 0x330(%rbp)
1401b35dd:     	movq	%r11, 0x2b0(%rbp)
1401b35e4:     	leaq	0x90(%rbp), %rcx
1401b35eb:     	movq	%r15, %r8
1401b35ee:     	callq	0x14018ef20 <.text+0x18df20>
1401b35f3:     	movq	(%r12), %rbx
1401b35f7:     	movl	$0x4, %edx
1401b35fc:     	leaq	0x5c057bc(%rip), %rcx   # 0x145db8dbf
1401b3603:     	movq	0x588(%rbp), %r8
1401b360a:     	callq	0x142ad39e0 <.text+0x2ad29e0>
1401b360f:     	testq	%rax, %rax
1401b3612:     	jne	0x1401b361b <.text+0x1b261b>
1401b3614:     	movq	0x7e26c75(%rip), %rax   # 0x147fda290
1401b361b:     	cmpb	$0x3, (%rax)
1401b361e:     	jne	0x1401b3690 <.text+0x1b2690>
1401b3620:     	movq	0x18(%rax), %rdx
1401b3624:     	testq	%rdx, %rdx
1401b3627:     	js	0x1401b3a46 <.text+0x1b2a46>
1401b362d:     	movq	%r13, 0x580(%rbp)
1401b3634:     	je	0x1401b36c3 <.text+0x1b26c3>
1401b363a:     	movq	%rdx, %r12
1401b363d:     	movq	0x10(%rax), %r15
1401b3641:     	callq	0x140002200 <.text+0x1200>
1401b3646:     	movl	$0x1, %r13d
1401b364c:     	movl	$0x1, %edx
1401b3651:     	movq	%r12, %rcx
1401b3654:     	callq	0x1400021c0 <.text+0x11c0>
1401b3659:     	movq	%r12, %rdx
1401b365c:     	testq	%rax, %rax
1401b365f:     	je	0x1401b3a49 <.text+0x1b2a49>
1401b3665:     	movq	%rax, %rdi
1401b3668:     	movq	%rax, %rcx
1401b366b:     	movq	%r15, %rdx
1401b366e:     	movq	%r12, %r8
1401b3671:     	callq	0x145bc977b <.text+0x5bc877b>
1401b3676:     	movq	0x580(%rbp), %r13
1401b367d:     	leaq	0x2b0(%rbp), %r15
1401b3684:     	jmp	0x1401b36d2 <.text+0x1b26d2>
1401b3686:     	nopw	%cs:(%rax,%rax)
1401b3690:     	movl	$0x1, %edi
1401b3695:     	xorl	%r12d, %r12d
1401b3698:     	cmpb	$0x1, (%rbx)
1401b369b:     	movq	%r13, 0x580(%rbp)
1401b36a2:     	jne	0x1401b36f0 <.text+0x1b26f0>
1401b36a4:     	movl	0x1(%rbx), %eax
1401b36a7:     	movl	0x4(%rbx), %ecx
1401b36aa:     	movl	%ecx, 0x93(%rbp)
1401b36b0:     	movl	%eax, 0x90(%rbp)
1401b36b6:     	movq	0x8(%rbx), %rax
1401b36ba:     	movzbl	0x10(%rbx), %edx
1401b36be:     	movb	$0x1, %r10b
1401b36c1:     	jmp	0x1401b3701 <.text+0x1b2701>
1401b36c3:     	movl	$0x1, %edi
1401b36c8:     	xorl	%r12d, %r12d
1401b36cb:     	movq	0x580(%rbp), %r13
1401b36d2:     	movsd	0x5bb9af6(%rip), %xmm6  # 0x145d6d1d0
1401b36da:     	cmpb	$0x1, (%rbx)
1401b36dd:     	movq	%r13, 0x580(%rbp)
1401b36e4:     	je	0x1401b36a4 <.text+0x1b26a4>
1401b36e6:     	nopw	%cs:(%rax,%rax)
1401b36f0:     	movq	0x8(%rbx), %rax
1401b36f4:     	lock
1401b36f5:     	incq	(%rax)
1401b36f8:     	jle	0x1401b3a61 <.text+0x1b2a61>
1401b36fe:     	xorl	%r10d, %r10d
1401b3701:     	leaq	0x90(%rbp), %rcx
1401b3708:     	movl	0x594(%rbp), %ebx
1401b370e:     	movl	0x90(%rbp), %r8d
1401b3715:     	movl	0x93(%rbp), %r9d
1401b371c:     	movl	%r9d, -0x2c(%r14)
1401b3720:     	movl	%r8d, -0x2f(%r14)
1401b3724:     	movq	%r12, 0x2b8(%rbp)
1401b372b:     	movq	%rdi, 0x2c0(%rbp)
1401b3732:     	movq	%r12, 0x2c8(%rbp)
1401b3739:     	movq	$0x0, 0x2d0(%rbp)
1401b3744:     	movq	$0x4, 0x2d8(%rbp)
1401b374f:     	movq	$0x0, 0x2e0(%rbp)
1401b375a:     	movb	%r10b, 0x2e8(%rbp)
1401b3761:     	movq	%rax, 0x2f0(%rbp)
1401b3768:     	movq	%rdx, 0x2f8(%rbp)
1401b376f:     	movl	$0x41880000, 0x300(%rbp) # imm = 0x41880000
1401b3779:     	movw	$0x190, 0x304(%rbp)     # imm = 0x190
1401b3782:     	movb	$0x1, 0x306(%rbp)
1401b3789:     	movl	$0x0, 0x308(%rbp)
1401b3793:     	movss	%xmm10, 0x30c(%rbp)
1401b379c:     	movss	%xmm8, 0x310(%rbp)
1401b37a5:     	movss	%xmm9, 0x314(%rbp)
1401b37ae:     	movl	$0x3f800000, 0x318(%rbp) # imm = 0x3F800000
1401b37b8:     	movl	0x5bbab2a(%rip), %eax   # 0x145d6e2e8
1401b37be:     	movl	%eax, 0x14(%r14)
1401b37c2:     	movups	%xmm12, 0x4(%r14)
1401b37c7:     	movsd	%xmm6, 0x330(%rbp)
1401b37cf:     	movq	0x578(%rbp), %rax
1401b37d6:     	movq	%rax, 0x2b0(%rbp)
1401b37dd:     	leaq	-0x28(%rbp), %rdx
1401b37e1:     	movq	%r15, %r8
1401b37e4:     	callq	0x14018ef20 <.text+0x18df20>
1401b37e9:     	testb	%bl, %bl
1401b37eb:     	leaq	0x5c055d1(%rip), %rcx   # 0x145db8dc3
1401b37f2:     	leaq	0x5c055df(%rip), %rax   # 0x145db8dd8
1401b37f9:     	cmovneq	%rax, %rcx
1401b37fd:     	movq	0x570(%rbp), %rax
1401b3804:     	movq	(%rax), %r12
1401b3807:     	leaq	0x5c0502e(%rip), %rbx   # 0x145db883c
1401b380e:     	leaq	0x5c0522b(%rip), %rax   # 0x145db8a40
1401b3815:     	cmovneq	%rax, %rbx
1401b3819:     	movl	$0x15, %edx
1401b381e:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401b3823:     	movq	%rdx, %rdi
1401b3826:     	testq	%rdx, %rdx
1401b3829:     	js	0x1401b3a53 <.text+0x1b2a53>
1401b382f:     	je	0x1401b38a3 <.text+0x1b28a3>
1401b3831:     	movq	%rax, %r13
1401b3834:     	callq	0x140002200 <.text+0x1200>
1401b3839:     	movl	$0x1, %r15d
1401b383f:     	movl	$0x1, %edx
1401b3844:     	movq	%rdi, %rcx
1401b3847:     	callq	0x1400021c0 <.text+0x11c0>
1401b384c:     	testq	%rax, %rax
1401b384f:     	je	0x1401b3a56 <.text+0x1b2a56>
1401b3855:     	movq	%rax, %rcx
1401b3858:     	movq	%r13, %rdx
1401b385b:     	movq	%rdi, %r8
1401b385e:     	movq	%rax, %r15
1401b3861:     	callq	0x145bc977b <.text+0x5bc877b>
1401b3866:     	movq	%r15, %r10
1401b3869:     	cmpb	$0x1, (%r12)
1401b386e:     	movq	0x580(%rbp), %r13
1401b3875:     	movq	0x588(%rbp), %r15
1401b387c:     	jne	0x1401b38be <.text+0x1b28be>
1401b387e:     	movl	0x1(%r12), %eax
1401b3883:     	movl	0x4(%r12), %ecx
1401b3888:     	movl	%ecx, 0x93(%rbp)
1401b388e:     	movl	%eax, 0x90(%rbp)
1401b3894:     	movq	0x8(%r12), %rax
1401b3899:     	movzbl	0x10(%r12), %edx
1401b389f:     	movb	$0x1, %cl
1401b38a1:     	jmp	0x1401b38cf <.text+0x1b28cf>
1401b38a3:     	movl	$0x1, %r10d
1401b38a9:     	cmpb	$0x1, (%r12)
1401b38ae:     	movq	0x580(%rbp), %r13
1401b38b5:     	movq	0x588(%rbp), %r15
1401b38bc:     	je	0x1401b387e <.text+0x1b287e>
1401b38be:     	movq	0x8(%r12), %rax
1401b38c3:     	lock
1401b38c4:     	incq	(%rax)
1401b38c7:     	jle	0x1401b3a61 <.text+0x1b2a61>
1401b38cd:     	xorl	%ecx, %ecx
1401b38cf:     	leaq	0x248(%rbp), %r12
1401b38d6:     	movl	0x90(%rbp), %r8d
1401b38dd:     	movl	0x93(%rbp), %r9d
1401b38e4:     	movl	%r9d, -0x2c(%r14)
1401b38e8:     	movl	%r8d, -0x2f(%r14)
1401b38ec:     	movl	0x10(%rbx), %r8d
1401b38f0:     	leaq	0x55c(%rbp), %r9
1401b38f7:     	movl	%r8d, 0x10(%r9)
1401b38fb:     	movups	(%rbx), %xmm0
1401b38fe:     	movups	%xmm0, (%r9)
1401b3902:     	movq	%rdi, 0x2b8(%rbp)
1401b3909:     	movq	%r10, 0x2c0(%rbp)
1401b3910:     	movq	%rdi, 0x2c8(%rbp)
1401b3917:     	movq	$0x0, 0x2d0(%rbp)
1401b3922:     	movq	$0x4, 0x2d8(%rbp)
1401b392d:     	movq	$0x0, 0x2e0(%rbp)
1401b3938:     	movb	%cl, 0x2e8(%rbp)
1401b393e:     	movq	%rax, 0x2f0(%rbp)
1401b3945:     	movq	%rdx, 0x2f8(%rbp)
1401b394c:     	movl	$0x41400000, 0x300(%rbp) # imm = 0x41400000
1401b3956:     	movw	$0x190, 0x304(%rbp)     # imm = 0x190
1401b395f:     	movb	$0x1, 0x306(%rbp)
1401b3966:     	movq	0x568(%rbp), %rax
1401b396d:     	movq	%rax, -0x4(%r14)
1401b3971:     	movups	0x55b(%rbp), %xmm0
1401b3978:     	movups	%xmm0, -0x11(%r14)
1401b397d:     	movl	0x5bba965(%rip), %eax   # 0x145d6e2e8
1401b3983:     	movl	%eax, 0x14(%r14)
1401b3987:     	movups	%xmm12, 0x4(%r14)
1401b398c:     	movsd	%xmm6, 0x330(%rbp)
1401b3994:     	movq	0x578(%rbp), %rax
1401b399b:     	movq	%rax, 0x2b0(%rbp)
1401b39a2:     	leaq	0x90(%rbp), %rcx
1401b39a9:     	leaq	-0x28(%rbp), %rdx
1401b39ad:     	leaq	0x2b0(%rbp), %r8
1401b39b4:     	callq	0x14018ef20 <.text+0x18df20>
1401b39b9:     	addq	$0x28, %r15
1401b39bd:     	cmpq	0x550(%rbp), %r15
1401b39c4:     	movq	0x548(%rbp), %rbx
1401b39cb:     	movss	0x5bb9970(%rip), %xmm9  # 0x145d6d344
1401b39d4:     	leaq	0x5c058fd(%rip), %rcx   # 0x145db92d8
1401b39db:     	jne	0x1401b2a7a <.text+0x1b1a7a>
1401b39e1:     	movq	%r13, %rax
1401b39e4:     	movaps	0x5a0(%rbp), %xmm6
1401b39eb:     	movaps	0x5b0(%rbp), %xmm7
1401b39f2:     	movaps	0x5c0(%rbp), %xmm8
1401b39fa:     	movaps	0x5d0(%rbp), %xmm9
1401b3a02:     	movaps	0x5e0(%rbp), %xmm10
1401b3a0a:     	movaps	0x5f0(%rbp), %xmm11
1401b3a12:     	movaps	0x600(%rbp), %xmm12
1401b3a1a:     	movaps	0x610(%rbp), %xmm13
1401b3a22:     	movaps	0x620(%rbp), %xmm14
1401b3a2a:     	movaps	0x630(%rbp), %xmm15
1401b3a32:     	addq	$0x6c8, %rsp            # imm = 0x6C8
1401b3a39:     	popq	%rbx
1401b3a3a:     	popq	%rdi
1401b3a3b:     	popq	%rsi
1401b3a3c:     	popq	%r12
1401b3a3e:     	popq	%r13
1401b3a40:     	popq	%r14
1401b3a42:     	popq	%r15
1401b3a44:     	popq	%rbp
1401b3a45:     	retq
1401b3a46:     	xorl	%r13d, %r13d
1401b3a49:     	movq	%r13, %rcx
1401b3a4c:     	callq	0x145d6944b <.text+0x5d6844b>
1401b3a51:     	ud2
1401b3a53:     	xorl	%r15d, %r15d
1401b3a56:     	movq	%r15, %rcx
1401b3a59:     	movq	%rdi, %rdx
1401b3a5c:     	callq	0x145d6944b <.text+0x5d6844b>
1401b3a61:     	ud2

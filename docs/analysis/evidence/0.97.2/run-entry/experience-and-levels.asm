
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b4920:     	pushq	%rbp
1454b4921:     	pushq	%r15
1454b4923:     	pushq	%r14
1454b4925:     	pushq	%r13
1454b4927:     	pushq	%r12
1454b4929:     	pushq	%rsi
1454b492a:     	pushq	%rdi
1454b492b:     	pushq	%rbx
1454b492c:     	subq	$0x1d8, %rsp            # imm = 0x1D8
1454b4933:     	leaq	0x80(%rsp), %rbp
1454b493b:     	movaps	%xmm15, 0x140(%rbp)
1454b4943:     	movaps	%xmm14, 0x130(%rbp)
1454b494b:     	movaps	%xmm13, 0x120(%rbp)
1454b4953:     	movaps	%xmm12, 0x110(%rbp)
1454b495b:     	movaps	%xmm11, 0x100(%rbp)
1454b4963:     	movaps	%xmm10, 0xf0(%rbp)
1454b496b:     	movaps	%xmm9, 0xe0(%rbp)
1454b4973:     	movaps	%xmm8, 0xd0(%rbp)
1454b497b:     	movaps	%xmm7, 0xc0(%rbp)
1454b4982:     	movaps	%xmm6, 0xb0(%rbp)
1454b4989:     	movq	$-0x2, 0xa8(%rbp)
1454b4994:     	movl	%edx, %edi
1454b4996:     	movq	%rcx, %rsi
1454b4999:     	addl	0x3fc(%rcx), %edi
1454b499f:     	movl	%edi, 0x3fc(%rcx)
1454b49a5:     	leaq	0x8b8(%rcx), %r15
1454b49ac:     	movss	0x436b44(%rip), %xmm7   # 0x1458eb4f8
1454b49b4:     	movss	0x444427(%rip), %xmm8   # 0x1458f8de4
1454b49bd:     	movss	0x436b42(%rip), %xmm9   # 0x1458eb508
1454b49c6:     	xorps	%xmm10, %xmm10
1454b49ca:     	movss	0x436b49(%rip), %xmm11  # 0x1458eb51c
1454b49d3:     	movq	%rbp, %r14
1454b49d6:     	leaq	0x20(%rbp), %r13
1454b49da:     	movss	0x436b49(%rip), %xmm12  # 0x1458eb52c
1454b49e3:     	movss	0x436b20(%rip), %xmm13  # 0x1458eb50c
1454b49ec:     	jmp	0x1454b49fa <.text+0x54b39fa>
1454b49ee:     	nop
1454b49f0:     	movl	%edi, 0x8(%rax,%rdx,4)
1454b49f4:     	movl	0x3fc(%rsi), %edi
1454b49fa:     	movl	0x3f8(%rsi), %r12d
1454b4a01:     	cmpl	$0x1, %r12d
1454b4a05:     	movl	%r12d, %eax
1454b4a08:     	adcl	$-0x1, %eax
1454b4a0b:     	xorps	%xmm1, %xmm1
1454b4a0e:     	cvtsi2ss	%rax, %xmm1
1454b4a13:     	movaps	%xmm1, %xmm0
1454b4a16:     	mulss	%xmm9, %xmm0
1454b4a1b:     	mulss	%xmm1, %xmm0
1454b4a1f:     	mulss	%xmm7, %xmm1
1454b4a23:     	addss	%xmm8, %xmm1
1454b4a28:     	addss	%xmm1, %xmm0
1454b4a2c:     	callq	0x145756e1f <.text+0x5755e1f>
1454b4a31:     	cvttss2si	%xmm0, %rax
1454b4a36:     	ucomiss	%xmm10, %xmm0
1454b4a3a:     	movl	$0x0, %ecx
1454b4a3f:     	cmovbl	%ecx, %eax
1454b4a42:     	ucomiss	%xmm11, %xmm0
1454b4a46:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454b4a4b:     	cmoval	%ecx, %eax
1454b4a4e:     	cmpl	$0x62, %r12d
1454b4a52:     	ja	0x1454b51bb <.text+0x54b41bb>
1454b4a58:     	movl	%edi, %ecx
1454b4a5a:     	subl	%eax, %ecx
1454b4a5c:     	jb	0x1454b51bb <.text+0x54b41bb>
1454b4a62:     	movl	%ecx, 0x3fc(%rsi)
1454b4a68:     	incl	%r12d
1454b4a6b:     	movl	%r12d, 0x3f8(%rsi)
1454b4a72:     	incl	0x8ec(%rsi)
1454b4a78:     	movq	0x8b8(%rsi), %rax
1454b4a7f:     	testq	%rax, %rax
1454b4a82:     	je	0x1454b4b10 <.text+0x54b3b10>
1454b4a88:     	movq	0x8c0(%rsi), %rcx
1454b4a8f:     	movw	$0x22, %r11w
1454b4a94:     	movzwl	0x36(%rax), %r8d
1454b4a99:     	movl	%r8d, %r9d
1454b4a9c:     	addl	%r9d, %r9d
1454b4a9f:     	movq	$-0x1, %rdx
1454b4aa6:     	nopw	%cs:(%rax,%rax)
1454b4ab0:     	testq	%r9, %r9
1454b4ab3:     	je	0x1454b4af0 <.text+0x54b3af0>
1454b4ab5:     	cmpw	0x3a(%rax,%rdx,2), %r11w
1454b4abb:     	seta	%r10b
1454b4abf:     	sbbb	$0x0, %r10b
1454b4ac3:     	incq	%rdx
1454b4ac6:     	addq	$-0x2, %r9
1454b4aca:     	cmpb	$0x1, %r10b
1454b4ace:     	je	0x1454b4ab0 <.text+0x54b3ab0>
1454b4ad0:     	movzbl	%r10b, %r8d
1454b4ad4:     	testl	%r8d, %r8d
1454b4ad7:     	je	0x1454b4b00 <.text+0x54b3b00>
1454b4ad9:     	subq	$0x1, %rcx
1454b4add:     	jae	0x1454b4af9 <.text+0x54b3af9>
1454b4adf:     	jmp	0x1454b4b12 <.text+0x54b3b12>
1454b4ae1:     	nopw	%cs:(%rax,%rax)
1454b4af0:     	movq	%r8, %rdx
1454b4af3:     	subq	$0x1, %rcx
1454b4af7:     	jb	0x1454b4b12 <.text+0x54b3b12>
1454b4af9:     	movq	0x50(%rax,%rdx,8), %rax
1454b4afe:     	jmp	0x1454b4a94 <.text+0x54b3a94>
1454b4b00:     	movl	%r12d, 0x8(%rax,%rdx,4)
1454b4b05:     	jmp	0x1454b4b3c <.text+0x54b3b3c>
1454b4b07:     	nopw	(%rax,%rax)
1454b4b10:     	xorl	%eax, %eax
1454b4b12:     	movq	%r15, 0x20(%rbp)
1454b4b16:     	movq	%rax, 0x28(%rbp)
1454b4b1a:     	movq	$0x0, 0x30(%rbp)
1454b4b22:     	movq	%rdx, 0x38(%rbp)
1454b4b26:     	movq	$0x22, 0x40(%rbp)
1454b4b2e:     	movq	%r14, %rcx
1454b4b31:     	movq	%r13, %rdx
1454b4b34:     	movl	%r12d, %r8d
1454b4b37:     	callq	0x145427a50 <.text+0x5426a50>
1454b4b3c:     	movq	%r14, %r15
1454b4b3f:     	movss	0x458(%rsi), %xmm14
1454b4b48:     	movss	0x45c(%rsi), %xmm15
1454b4b51:     	movss	0x47c(%rsi), %xmm6
1454b4b59:     	movl	0x49c(%rsi), %eax
1454b4b5f:     	movl	%eax, -0x4(%rbp)
1454b4b62:     	movq	%rsi, %rcx
1454b4b65:     	callq	0x1454950d0 <.text+0x54940d0>
1454b4b6a:     	movl	$0x58, %edx
1454b4b6f:     	leaq	0x14f6607(%rip), %r14   # 0x1469ab17d
1454b4b76:     	movq	%r14, %rcx
1454b4b79:     	callq	0x145452400 <.text+0x5451400>
1454b4b7e:     	movq	%rax, %rdi
1454b4b81:     	movq	%rdx, %r12
1454b4b84:     	testq	%rax, %rax
1454b4b87:     	cmoveq	%r14, %rdi
1454b4b8b:     	movl	$0x58, %eax
1454b4b90:     	cmoveq	%rax, %r12
1454b4b94:     	movss	0x45c(%rsi), %xmm0
1454b4b9c:     	subss	%xmm15, %xmm0
1454b4ba1:     	mulss	%xmm12, %xmm0
1454b4ba6:     	movss	%xmm0, 0x80(%rbp)
1454b4bae:     	leaq	0x80(%rbp), %r14
1454b4bb5:     	movq	%r14, (%rbp)
1454b4bb9:     	leaq	0x268720(%rip), %rbx    # 0x14571d2e0 <.text+0x571c2e0>
1454b4bc0:     	movq	%rbx, 0x8(%rbp)
1454b4bc4:     	movq	%r13, %rcx
1454b4bc7:     	movq	%r13, %r14
1454b4bca:     	leaq	0x14f6604(%rip), %r13   # 0x1469ab1d5
1454b4bd1:     	movq	%r13, %rdx
1454b4bd4:     	movq	%r15, %r8
1454b4bd7:     	callq	0x14570bf80 <.text+0x570af80>
1454b4bdc:     	movups	0x20(%rbp), %xmm0
1454b4be0:     	movaps	%xmm0, -0x40(%rbp)
1454b4be4:     	movq	0x30(%rbp), %rax
1454b4be8:     	movq	%rax, -0x30(%rbp)
1454b4bec:     	movss	0x458(%rsi), %xmm0
1454b4bf4:     	subss	%xmm14, %xmm0
1454b4bf9:     	movss	%xmm0, 0x80(%rbp)
1454b4c01:     	leaq	0x80(%rbp), %rax
1454b4c08:     	movq	%rax, (%rbp)
1454b4c0c:     	movq	%rbx, 0x8(%rbp)
1454b4c10:     	movq	%r14, %rcx
1454b4c13:     	movq	%r13, %rdx
1454b4c16:     	movq	%r15, %r8
1454b4c19:     	callq	0x14570bf80 <.text+0x570af80>
1454b4c1e:     	nop
1454b4c1f:     	movups	0x20(%rbp), %xmm0
1454b4c23:     	movaps	%xmm0, -0x20(%rbp)
1454b4c27:     	movq	0x30(%rbp), %rax
1454b4c2b:     	movq	%rax, -0x10(%rbp)
1454b4c2f:     	movq	%rsi, %r13
1454b4c32:     	movss	0x47c(%rsi), %xmm0
1454b4c3a:     	subss	%xmm6, %xmm0
1454b4c3e:     	movss	%xmm0, 0x80(%rbp)
1454b4c46:     	leaq	0x80(%rbp), %rsi
1454b4c4d:     	movq	%rsi, (%rbp)
1454b4c51:     	movq	%rbx, 0x8(%rbp)
1454b4c55:     	movq	%r14, %rcx
1454b4c58:     	leaq	0x14f65a7(%rip), %rdx   # 0x1469ab206
1454b4c5f:     	movq	%r15, %r8
1454b4c62:     	callq	0x14570bf80 <.text+0x570af80>
1454b4c67:     	nop
1454b4c68:     	movq	%r15, %rbx
1454b4c6b:     	movq	%r14, %r15
1454b4c6e:     	movups	0x20(%rbp), %xmm0
1454b4c72:     	movaps	%xmm0, 0x80(%rbp)
1454b4c79:     	movq	0x30(%rbp), %rax
1454b4c7d:     	movq	%rax, 0x90(%rbp)
1454b4c84:     	leaq	0x14f641a(%rip), %rax   # 0x1469ab0a5
1454b4c8b:     	movq	%rax, 0x20(%rbp)
1454b4c8f:     	movq	$0x6, 0x28(%rbp)
1454b4c97:     	leaq	-0x40(%rbp), %rax
1454b4c9b:     	movq	%rax, 0x30(%rbp)
1454b4c9f:     	leaq	0x14f653a(%rip), %rax   # 0x1469ab1e0
1454b4ca6:     	movq	%rax, 0x38(%rbp)
1454b4caa:     	leaq	0x14f654f(%rip), %rcx   # 0x1469ab200
1454b4cb1:     	movq	%rcx, 0x40(%rbp)
1454b4cb5:     	movq	$0x6, 0x48(%rbp)
1454b4cbd:     	leaq	-0x20(%rbp), %rcx
1454b4cc1:     	movq	%rcx, 0x50(%rbp)
1454b4cc5:     	movq	%rax, 0x58(%rbp)
1454b4cc9:     	leaq	0x14f63f1(%rip), %rcx   # 0x1469ab0c1
1454b4cd0:     	movq	%rcx, 0x60(%rbp)
1454b4cd4:     	movq	$0x5, 0x68(%rbp)
1454b4cdc:     	movq	%rsi, 0x70(%rbp)
1454b4ce0:     	movq	%rax, 0x78(%rbp)
1454b4ce4:     	movq	$0x3, 0x20(%rsp)
1454b4ced:     	leaq	-0x58(%rbp), %rcx
1454b4cf1:     	movq	%rdi, %rdx
1454b4cf4:     	movq	%r12, %r8
1454b4cf7:     	movq	%r14, %r9
1454b4cfa:     	callq	0x145452790 <.text+0x5451790>
1454b4cff:     	nop
1454b4d00:     	movq	%rsi, %r14
1454b4d03:     	movq	-0x50(%rbp), %rdx
1454b4d07:     	movq	-0x48(%rbp), %r8
1454b4d0b:     	movq	%rbx, %rcx
1454b4d0e:     	movq	%rdx, 0xa0(%rbp)
1454b4d15:     	callq	0x145443490 <.text+0x5442490>
1454b4d1a:     	nop
1454b4d1b:     	movq	%r13, %rsi
1454b4d1e:     	movq	0x548(%r13), %rdi
1454b4d25:     	cmpq	0x538(%r13), %rdi
1454b4d2c:     	jne	0x1454b4d3b <.text+0x54b3d3b>
1454b4d2e:     	leaq	0x538(%rsi), %rcx
1454b4d35:     	callq	0x1457580b0 <.text+0x57570b0>
1454b4d3a:     	nop
1454b4d3b:     	movq	0x540(%rsi), %rax
1454b4d42:     	movq	%rdi, %rcx
1454b4d45:     	shlq	$0x5, %rcx
1454b4d49:     	movups	(%rbp), %xmm0
1454b4d4d:     	movups	0x10(%rbp), %xmm1
1454b4d51:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b4d56:     	movups	%xmm0, (%rax,%rcx)
1454b4d5a:     	incq	%rdi
1454b4d5d:     	movq	%rdi, 0x548(%rsi)
1454b4d64:     	movq	-0x58(%rbp), %rdx
1454b4d68:     	testq	%rdx, %rdx
1454b4d6b:     	je	0x1454b4d7f <.text+0x54b3d7f>
1454b4d6d:     	movl	$0x1, %r8d
1454b4d73:     	movq	0xa0(%rbp), %rcx
1454b4d7a:     	callq	0x1400021d0 <.text+0x11d0>
1454b4d7f:     	movq	0x80(%rbp), %rdx
1454b4d86:     	testq	%rdx, %rdx
1454b4d89:     	je	0x1454b4d9d <.text+0x54b3d9d>
1454b4d8b:     	movq	0x88(%rbp), %rcx
1454b4d92:     	movl	$0x1, %r8d
1454b4d98:     	callq	0x1400021d0 <.text+0x11d0>
1454b4d9d:     	movq	-0x20(%rbp), %rdx
1454b4da1:     	testq	%rdx, %rdx
1454b4da4:     	je	0x1454b4db5 <.text+0x54b3db5>
1454b4da6:     	movq	-0x18(%rbp), %rcx
1454b4daa:     	movl	$0x1, %r8d
1454b4db0:     	callq	0x1400021d0 <.text+0x11d0>
1454b4db5:     	movq	-0x40(%rbp), %rdx
1454b4db9:     	testq	%rdx, %rdx
1454b4dbc:     	je	0x1454b4dcd <.text+0x54b3dcd>
1454b4dbe:     	movq	-0x38(%rbp), %rcx
1454b4dc2:     	movl	$0x1, %r8d
1454b4dc8:     	callq	0x1400021d0 <.text+0x11d0>
1454b4dcd:     	movq	0x298(%rsi), %rax
1454b4dd4:     	imulq	$0x58, 0x2a0(%rsi), %rcx
1454b4ddc:     	xorl	%edx, %edx
1454b4dde:     	nop
1454b4de0:     	cmpq	%rdx, %rcx
1454b4de3:     	je	0x1454b4f10 <.text+0x54b3f10>
1454b4de9:     	movq	(%rax,%rdx), %r8
1454b4ded:     	addq	$0x58, %rdx
1454b4df1:     	cmpb	$0x6, 0x75(%r8)
1454b4df6:     	jne	0x1454b4de0 <.text+0x54b3de0>
1454b4df8:     	movl	-0x4(%rbp), %eax
1454b4dfb:     	cmpl	%eax, 0x49c(%rsi)
1454b4e01:     	jbe	0x1454b4f10 <.text+0x54b3f10>
1454b4e07:     	movl	$0x3e, %edx
1454b4e0c:     	leaq	0x14f63fb(%rip), %rdi   # 0x1469ab20e
1454b4e13:     	movq	%rdi, %rcx
1454b4e16:     	callq	0x145452400 <.text+0x5451400>
1454b4e1b:     	movq	%rdx, %r8
1454b4e1e:     	testq	%rax, %rax
1454b4e21:     	cmoveq	%rdi, %rax
1454b4e25:     	movl	$0x3e, %ecx
1454b4e2a:     	cmoveq	%rcx, %r8
1454b4e2e:     	movl	0x49c(%rsi), %ecx
1454b4e34:     	cmpl	$0x3, %ecx
1454b4e37:     	movl	$0x3, %edx
1454b4e3c:     	cmovael	%edx, %ecx
1454b4e3f:     	incl	%ecx
1454b4e41:     	movq	%rcx, -0x20(%rbp)
1454b4e45:     	leaq	0x14f5c74(%rip), %rcx   # 0x1469aaac0
1454b4e4c:     	movq	%rcx, 0x20(%rbp)
1454b4e50:     	movq	$0x1, 0x28(%rbp)
1454b4e58:     	leaq	-0x20(%rbp), %rcx
1454b4e5c:     	movq	%rcx, 0x30(%rbp)
1454b4e60:     	leaq	0x14f63e9(%rip), %rcx   # 0x1469ab250
1454b4e67:     	movq	%rcx, 0x38(%rbp)
1454b4e6b:     	movq	$0x1, 0x20(%rsp)
1454b4e74:     	movq	%r14, %rcx
1454b4e77:     	movq	%rax, %rdx
1454b4e7a:     	movq	%r15, %r9
1454b4e7d:     	callq	0x145452790 <.text+0x5451790>
1454b4e82:     	movq	0x88(%rbp), %rdx
1454b4e89:     	movq	0x90(%rbp), %r8
1454b4e90:     	movq	%rbx, %rcx
1454b4e93:     	movq	%rdx, 0xa0(%rbp)
1454b4e9a:     	callq	0x145443490 <.text+0x5442490>
1454b4e9f:     	nop
1454b4ea0:     	movq	0x548(%rsi), %rdi
1454b4ea7:     	cmpq	0x538(%rsi), %rdi
1454b4eae:     	jne	0x1454b4ebd <.text+0x54b3ebd>
1454b4eb0:     	leaq	0x538(%rsi), %rcx
1454b4eb7:     	callq	0x1457580b0 <.text+0x57570b0>
1454b4ebc:     	nop
1454b4ebd:     	movq	0x540(%rsi), %rax
1454b4ec4:     	movq	%rdi, %rcx
1454b4ec7:     	shlq	$0x5, %rcx
1454b4ecb:     	movups	(%rbp), %xmm0
1454b4ecf:     	movups	0x10(%rbp), %xmm1
1454b4ed3:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b4ed8:     	movups	%xmm0, (%rax,%rcx)
1454b4edc:     	incq	%rdi
1454b4edf:     	movq	%rdi, 0x548(%rsi)
1454b4ee6:     	movq	0x80(%rbp), %rdx
1454b4eed:     	testq	%rdx, %rdx
1454b4ef0:     	je	0x1454b4f10 <.text+0x54b3f10>
1454b4ef2:     	movl	$0x1, %r8d
1454b4ef8:     	movq	0xa0(%rbp), %rcx
1454b4eff:     	callq	0x1400021d0 <.text+0x11d0>
1454b4f04:     	nopw	%cs:(%rax,%rax)
1454b4f10:     	movq	%r15, %r13
1454b4f13:     	movq	%rbx, %r14
1454b4f16:     	movss	0x458(%rsi), %xmm14
1454b4f1f:     	mulss	%xmm13, %xmm14
1454b4f24:     	movl	$0x8, %edx
1454b4f29:     	leaq	0x14f6340(%rip), %rcx   # 0x1469ab270
1454b4f30:     	callq	0x145452400 <.text+0x5451400>
1454b4f35:     	movss	0x400(%rsi), %xmm2
1454b4f3d:     	movss	0x458(%rsi), %xmm6
1454b4f45:     	addss	%xmm2, %xmm14
1454b4f4a:     	movaps	%xmm14, %xmm1
1454b4f4e:     	minss	%xmm6, %xmm1
1454b4f52:     	movaps	%xmm1, %xmm0
1454b4f55:     	cmpunordss	%xmm1, %xmm0
1454b4f5a:     	andps	%xmm0, %xmm14
1454b4f5e:     	andnps	%xmm1, %xmm0
1454b4f61:     	orps	%xmm14, %xmm0
1454b4f65:     	movss	%xmm0, 0x400(%rsi)
1454b4f6d:     	movaps	%xmm0, %xmm1
1454b4f70:     	subss	%xmm2, %xmm1
1454b4f74:     	ucomiss	%xmm1, %xmm10
1454b4f78:     	jae	0x1454b4fde <.text+0x54b3fde>
1454b4f7a:     	testq	%rax, %rax
1454b4f7d:     	movl	$0x8, %ecx
1454b4f82:     	cmoveq	%rcx, %rdx
1454b4f86:     	leaq	0x14f62e3(%rip), %rcx   # 0x1469ab270
1454b4f8d:     	cmoveq	%rcx, %rax
1454b4f91:     	movq	$-0x1, 0x20(%rbp)
1454b4f99:     	movq	%rax, 0x28(%rbp)
1454b4f9d:     	movq	%rdx, 0x30(%rbp)
1454b4fa1:     	leaq	0x14f62d0(%rip), %rax   # 0x1469ab278
1454b4fa8:     	movq	%rax, 0x38(%rbp)
1454b4fac:     	movq	$0x13, 0x40(%rbp)
1454b4fb4:     	movb	$0x0, 0x48(%rbp)
1454b4fb8:     	xorps	%xmm2, %xmm2
1454b4fbb:     	cvtss2sd	%xmm1, %xmm2
1454b4fbf:     	leaq	0x5e0(%rsi), %rcx
1454b4fc6:     	movq	%r13, %rdx
1454b4fc9:     	callq	0x1454eff80 <.text+0x54eef80>
1454b4fce:     	movss	0x400(%rsi), %xmm0
1454b4fd6:     	movss	0x458(%rsi), %xmm6
1454b4fde:     	maxss	%xmm10, %xmm0
1454b4fe3:     	callq	0x145756e6d <.text+0x5755e6d>
1454b4fe8:     	cvttss2si	%xmm0, %r12
1454b4fed:     	ucomiss	%xmm10, %xmm0
1454b4ff1:     	movl	$0x0, %r15d
1454b4ff7:     	cmovbl	%r15d, %r12d
1454b4ffb:     	ucomiss	%xmm11, %xmm0
1454b4fff:     	movl	$0xffffffff, %ebx       # imm = 0xFFFFFFFF
1454b5004:     	cmoval	%ebx, %r12d
1454b5008:     	movaps	%xmm6, %xmm0
1454b500b:     	callq	0x145756e6d <.text+0x5755e6d>
1454b5010:     	cvttss2si	%xmm0, %rdi
1454b5015:     	ucomiss	%xmm10, %xmm0
1454b5019:     	cmovbl	%r15d, %edi
1454b501d:     	ucomiss	%xmm11, %xmm0
1454b5021:     	cmoval	%ebx, %edi
1454b5024:     	leaq	0x8b8(%rsi), %r15
1454b502b:     	movq	(%r15), %rax
1454b502e:     	testq	%rax, %rax
1454b5031:     	je	0x1454b5140 <.text+0x54b4140>
1454b5037:     	movq	0x8c0(%rsi), %rcx
1454b503e:     	movw	$0x1c, %bx
1454b5042:     	movw	$0x16, %r11w
1454b5047:     	movzwl	0x36(%rax), %r8d
1454b504c:     	movl	%r8d, %r9d
1454b504f:     	addl	%r9d, %r9d
1454b5052:     	movq	$-0x1, %rdx
1454b5059:     	nopl	(%rax)
1454b5060:     	testq	%r9, %r9
1454b5063:     	je	0x1454b50a0 <.text+0x54b40a0>
1454b5065:     	cmpw	0x3a(%rax,%rdx,2), %r11w
1454b506b:     	seta	%r10b
1454b506f:     	sbbb	$0x0, %r10b
1454b5073:     	incq	%rdx
1454b5076:     	addq	$-0x2, %r9
1454b507a:     	cmpb	$0x1, %r10b
1454b507e:     	je	0x1454b5060 <.text+0x54b4060>
1454b5080:     	movzbl	%r10b, %r8d
1454b5084:     	testl	%r8d, %r8d
1454b5087:     	je	0x1454b50c0 <.text+0x54b40c0>
1454b5089:     	subq	$0x1, %rcx
1454b508d:     	jae	0x1454b50ad <.text+0x54b40ad>
1454b508f:     	jmp	0x1454b51b6 <.text+0x54b41b6>
1454b5094:     	nopw	%cs:(%rax,%rax)
1454b50a0:     	movq	%r8, %rdx
1454b50a3:     	subq	$0x1, %rcx
1454b50a7:     	jb	0x1454b51b6 <.text+0x54b41b6>
1454b50ad:     	movq	0x50(%rax,%rdx,8), %rax
1454b50b2:     	jmp	0x1454b5047 <.text+0x54b4047>
1454b50b4:     	nopw	%cs:(%rax,%rax)
1454b50c0:     	movl	%r12d, 0x8(%rax,%rdx,4)
1454b50c5:     	movq	(%r15), %rax
1454b50c8:     	testq	%rax, %rax
1454b50cb:     	je	0x1454b517f <.text+0x54b417f>
1454b50d1:     	movq	0x8c0(%rsi), %rcx
1454b50d8:     	movzwl	0x36(%rax), %r8d
1454b50dd:     	movl	%r8d, %r9d
1454b50e0:     	addl	%r9d, %r9d
1454b50e3:     	movq	$-0x1, %rdx
1454b50ea:     	nopw	(%rax,%rax)
1454b50f0:     	testq	%r9, %r9
1454b50f3:     	je	0x1454b5130 <.text+0x54b4130>
1454b50f5:     	cmpw	0x3a(%rax,%rdx,2), %bx
1454b50fa:     	seta	%r10b
1454b50fe:     	sbbb	$0x0, %r10b
1454b5102:     	incq	%rdx
1454b5105:     	addq	$-0x2, %r9
1454b5109:     	cmpb	$0x1, %r10b
1454b510d:     	je	0x1454b50f0 <.text+0x54b40f0>
1454b510f:     	movzbl	%r10b, %r8d
1454b5113:     	testl	%r8d, %r8d
1454b5116:     	je	0x1454b49f0 <.text+0x54b39f0>
1454b511c:     	subq	$0x1, %rcx
1454b5120:     	jae	0x1454b5139 <.text+0x54b4139>
1454b5122:     	jmp	0x1454b5181 <.text+0x54b4181>
1454b5124:     	nopw	%cs:(%rax,%rax)
1454b5130:     	movq	%r8, %rdx
1454b5133:     	subq	$0x1, %rcx
1454b5137:     	jb	0x1454b5181 <.text+0x54b4181>
1454b5139:     	movq	0x50(%rax,%rdx,8), %rax
1454b513e:     	jmp	0x1454b50d8 <.text+0x54b40d8>
1454b5140:     	xorl	%eax, %eax
1454b5142:     	movq	%r14, %rcx
1454b5145:     	movw	$0x1c, %bx
1454b5149:     	movq	%r15, 0x20(%rbp)
1454b514d:     	movq	%rax, 0x28(%rbp)
1454b5151:     	movq	$0x0, 0x30(%rbp)
1454b5159:     	movq	%rdx, 0x38(%rbp)
1454b515d:     	movq	$0x16, 0x40(%rbp)
1454b5165:     	movq	%rcx, %r14
1454b5168:     	movq	%r13, %rdx
1454b516b:     	movl	%r12d, %r8d
1454b516e:     	callq	0x145427a50 <.text+0x5426a50>
1454b5173:     	movq	(%r15), %rax
1454b5176:     	testq	%rax, %rax
1454b5179:     	jne	0x1454b50d1 <.text+0x54b40d1>
1454b517f:     	xorl	%eax, %eax
1454b5181:     	movq	%r15, 0x20(%rbp)
1454b5185:     	movq	%rax, 0x28(%rbp)
1454b5189:     	movq	$0x0, 0x30(%rbp)
1454b5191:     	movq	%rdx, 0x38(%rbp)
1454b5195:     	movq	$0x1c, 0x40(%rbp)
1454b519d:     	movq	%r14, %rcx
1454b51a0:     	movq	%r13, %rdx
1454b51a3:     	movl	%edi, %r8d
1454b51a6:     	callq	0x145427a50 <.text+0x5426a50>
1454b51ab:     	movl	0x3fc(%rsi), %edi
1454b51b1:     	jmp	0x1454b49fa <.text+0x54b39fa>
1454b51b6:     	movq	%r14, %rcx
1454b51b9:     	jmp	0x1454b5149 <.text+0x54b4149>
1454b51bb:     	movq	(%r15), %rax
1454b51be:     	testq	%rax, %rax
1454b51c1:     	je	0x1454b5237 <.text+0x54b4237>
1454b51c3:     	movq	0x8c0(%rsi), %rcx
1454b51ca:     	movl	$0x2cc, %edx            # imm = 0x2CC
1454b51cf:     	movzwl	0x36(%rax), %r9d
1454b51d4:     	movl	%r9d, %r10d
1454b51d7:     	addl	%r10d, %r10d
1454b51da:     	movq	$-0x1, %r8
1454b51e1:     	nopw	%cs:(%rax,%rax)
1454b51f0:     	testq	%r10, %r10
1454b51f3:     	je	0x1454b5220 <.text+0x54b4220>
1454b51f5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454b51fb:     	cmpl	%r11d, %edx
1454b51fe:     	seta	%r11b
1454b5202:     	sbbb	$0x0, %r11b
1454b5206:     	incq	%r8
1454b5209:     	addq	$-0x2, %r10
1454b520d:     	cmpb	$0x1, %r11b
1454b5211:     	je	0x1454b51f0 <.text+0x54b41f0>
1454b5213:     	movzbl	%r11b, %r9d
1454b5217:     	testl	%r9d, %r9d
1454b521a:     	je	0x1454b5230 <.text+0x54b4230>
1454b521c:     	jmp	0x1454b5223 <.text+0x54b4223>
1454b521e:     	nop
1454b5220:     	movq	%r9, %r8
1454b5223:     	subq	$0x1, %rcx
1454b5227:     	jb	0x1454b5239 <.text+0x54b4239>
1454b5229:     	movq	0x50(%rax,%r8,8), %rax
1454b522e:     	jmp	0x1454b51cf <.text+0x54b41cf>
1454b5230:     	movl	%edi, 0x8(%rax,%r8,4)
1454b5235:     	jmp	0x1454b5264 <.text+0x54b4264>
1454b5237:     	xorl	%eax, %eax
1454b5239:     	movq	%r15, 0x20(%rbp)
1454b523d:     	movq	%rax, 0x28(%rbp)
1454b5241:     	movq	$0x0, 0x30(%rbp)
1454b5249:     	movq	%r8, 0x38(%rbp)
1454b524d:     	movq	$0x2cc, 0x40(%rbp)      # imm = 0x2CC
1454b5255:     	movq	%rbp, %rcx
1454b5258:     	leaq	0x20(%rbp), %rdx
1454b525c:     	movl	%edi, %r8d
1454b525f:     	callq	0x145427a50 <.text+0x5426a50>
1454b5264:     	movl	0x3f8(%rsi), %eax
1454b526a:     	cmpl	$0x1, %eax
1454b526d:     	adcl	$-0x1, %eax
1454b5270:     	xorps	%xmm1, %xmm1
1454b5273:     	cvtsi2ss	%rax, %xmm1
1454b5278:     	movss	0x436278(%rip), %xmm2   # 0x1458eb4f8
1454b5280:     	mulss	%xmm1, %xmm2
1454b5284:     	addss	0x443b58(%rip), %xmm2   # 0x1458f8de4
1454b528c:     	movss	0x436274(%rip), %xmm0   # 0x1458eb508
1454b5294:     	mulss	%xmm1, %xmm0
1454b5298:     	mulss	%xmm1, %xmm0
1454b529c:     	addss	%xmm2, %xmm0
1454b52a0:     	callq	0x145756e1f <.text+0x5755e1f>
1454b52a5:     	cvttss2si	%xmm0, %rax
1454b52aa:     	xorl	%ecx, %ecx
1454b52ac:     	xorps	%xmm1, %xmm1
1454b52af:     	ucomiss	%xmm1, %xmm0
1454b52b2:     	cmovbl	%ecx, %eax
1454b52b5:     	ucomiss	0x436260(%rip), %xmm0   # 0x1458eb51c
1454b52bc:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454b52c2:     	cmovbel	%eax, %r8d
1454b52c6:     	movq	0x8b8(%rsi), %rax
1454b52cd:     	testq	%rax, %rax
1454b52d0:     	je	0x1454b5340 <.text+0x54b4340>
1454b52d2:     	movq	0x8c0(%rsi), %rcx
1454b52d9:     	movl	$0x2cd, %edx            # imm = 0x2CD
1454b52de:     	movzwl	0x36(%rax), %r10d
1454b52e3:     	movl	%r10d, %r11d
1454b52e6:     	addl	%r11d, %r11d
1454b52e9:     	movq	$-0x1, %r9
1454b52f0:     	testq	%r11, %r11
1454b52f3:     	je	0x1454b5320 <.text+0x54b4320>
1454b52f5:     	movzwl	0x3a(%rax,%r9,2), %edi
1454b52fb:     	cmpl	%edi, %edx
1454b52fd:     	seta	%bl
1454b5300:     	sbbb	$0x0, %bl
1454b5303:     	incq	%r9
1454b5306:     	addq	$-0x2, %r11
1454b530a:     	cmpb	$0x1, %bl
1454b530d:     	je	0x1454b52f0 <.text+0x54b42f0>
1454b530f:     	movzbl	%bl, %r10d
1454b5313:     	testl	%r10d, %r10d
1454b5316:     	je	0x1454b5330 <.text+0x54b4330>
1454b5318:     	jmp	0x1454b5323 <.text+0x54b4323>
1454b531a:     	nopw	(%rax,%rax)
1454b5320:     	movq	%r10, %r9
1454b5323:     	subq	$0x1, %rcx
1454b5327:     	jb	0x1454b5342 <.text+0x54b4342>
1454b5329:     	movq	0x50(%rax,%r9,8), %rax
1454b532e:     	jmp	0x1454b52de <.text+0x54b42de>
1454b5330:     	movl	%r8d, 0x8(%rax,%r9,4)
1454b5335:     	cmpl	$0x0, 0x8ec(%rsi)
1454b533c:     	jne	0x1454b5373 <.text+0x54b4373>
1454b533e:     	jmp	0x1454b5392 <.text+0x54b4392>
1454b5340:     	xorl	%eax, %eax
1454b5342:     	movq	%r15, 0x20(%rbp)
1454b5346:     	movq	%rax, 0x28(%rbp)
1454b534a:     	movq	$0x0, 0x30(%rbp)
1454b5352:     	movq	%r9, 0x38(%rbp)
1454b5356:     	movq	$0x2cd, 0x40(%rbp)      # imm = 0x2CD
1454b535e:     	movq	%rbp, %rcx
1454b5361:     	leaq	0x20(%rbp), %rdx
1454b5365:     	callq	0x145427a50 <.text+0x5426a50>
1454b536a:     	cmpl	$0x0, 0x8ec(%rsi)
1454b5371:     	je	0x1454b5392 <.text+0x54b4392>
1454b5373:     	cmpb	$0x1, 0x95f(%rsi)
1454b537a:     	jne	0x1454b5392 <.text+0x54b4392>
1454b537c:     	cmpb	$0x0, 0x958(%rsi)
1454b5383:     	jne	0x1454b5392 <.text+0x54b4392>
1454b5385:     	movq	%rsi, %rcx
1454b5388:     	xorl	%edx, %edx
1454b538a:     	movb	$0x1, %r8b
1454b538d:     	callq	0x1454da5f0 <.text+0x54d95f0>
1454b5392:     	movaps	0xb0(%rbp), %xmm6
1454b5399:     	movaps	0xc0(%rbp), %xmm7
1454b53a0:     	movaps	0xd0(%rbp), %xmm8
1454b53a8:     	movaps	0xe0(%rbp), %xmm9
1454b53b0:     	movaps	0xf0(%rbp), %xmm10
1454b53b8:     	movaps	0x100(%rbp), %xmm11
1454b53c0:     	movaps	0x110(%rbp), %xmm12
1454b53c8:     	movaps	0x120(%rbp), %xmm13
1454b53d0:     	movaps	0x130(%rbp), %xmm14
1454b53d8:     	movaps	0x140(%rbp), %xmm15
1454b53e0:     	addq	$0x1d8, %rsp            # imm = 0x1D8
1454b53e7:     	popq	%rbx
1454b53e8:     	popq	%rdi
1454b53e9:     	popq	%rsi
1454b53ea:     	popq	%r12
1454b53ec:     	popq	%r13
1454b53ee:     	popq	%r14
1454b53f0:     	popq	%r15
1454b53f2:     	popq	%rbp
1454b53f3:     	retq

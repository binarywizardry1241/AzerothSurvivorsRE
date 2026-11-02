
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145902c51:     	xorl	%r12d, %r12d
145902c54:     	movzbl	0x304(%r13), %eax
145902c5c:     	addb	$-0x2, %al
145902c5e:     	cmpb	$0x9, %al
145902c60:     	jbe	0x145902c8b <.text+0x5901c8b>
145902c62:     	leaq	0x12a8b3f(%rip), %rax   # 0x146bab7a8
145902c69:     	testb	$0x1, (%rax)
145902c6c:     	movl	%r12d, 0x370(%rbp)
145902c73:     	jne	0x145902ca9 <.text+0x5901ca9>
145902c75:     	jmp	0x145902f6b <.text+0x5901f6b>
145902c7a:     	xorl	%r12d, %r12d
145902c7d:     	movzbl	0x304(%r13), %eax
145902c85:     	addb	$-0x2, %al
145902c87:     	cmpb	$0x9, %al
145902c89:     	ja	0x145902c62 <.text+0x5901c62>
145902c8b:     	movzbl	%al, %eax
145902c8e:     	leaq	0x15784fb(%rip), %rcx   # 0x146e7b190
145902c95:     	movq	(%rcx,%rax,8), %rax
145902c99:     	testb	$0x1, (%rax)
145902c9c:     	movl	%r12d, 0x370(%rbp)
145902ca3:     	je	0x145902f6b <.text+0x5901f6b>
145902ca9:     	movq	0x780(%r13), %r8
145902cb0:     	testq	%r8, %r8
145902cb3:     	je	0x145902cce <.text+0x5901cce>
145902cb5:     	movq	0x778(%r13), %rcx
145902cbc:     	cmpq	$0x1, %r8
145902cc0:     	jne	0x145902cd8 <.text+0x5901cd8>
145902cc2:     	movss	0x46dfa6(%rip), %xmm7   # 0x145d70c70
145902cca:     	xorl	%edx, %edx
145902ccc:     	jmp	0x145902d2b <.text+0x5901d2b>
145902cce:     	movss	0x46a696(%rip), %xmm7   # 0x145d6d36c
145902cd6:     	jmp	0x145902d3f <.text+0x5901d3f>
145902cd8:     	movq	%r8, %r9
145902cdb:     	andq	$-0x2, %r9
145902cdf:     	movss	0x46df89(%rip), %xmm7   # 0x145d70c70
145902ce7:     	xorl	%edx, %edx
145902ce9:     	jmp	0x145902cf9 <.text+0x5901cf9>
145902ceb:     	nopl	(%rax,%rax)
145902cf0:     	addq	$0x2, %rdx
145902cf4:     	cmpq	%rdx, %r9
145902cf7:     	je	0x145902d25 <.text+0x5901d25>
145902cf9:     	cmpb	$0x10, (%rcx,%rdx,8)
145902cfd:     	je	0x145902d10 <.text+0x5901d10>
145902cff:     	cmpb	$0x10, 0x8(%rcx,%rdx,8)
145902d04:     	jne	0x145902cf0 <.text+0x5901cf0>
145902d06:     	jmp	0x145902d1d <.text+0x5901d1d>
145902d08:     	nopl	(%rax,%rax)
145902d10:     	addss	0x4(%rcx,%rdx,8), %xmm7
145902d16:     	cmpb	$0x10, 0x8(%rcx,%rdx,8)
145902d1b:     	jne	0x145902cf0 <.text+0x5901cf0>
145902d1d:     	addss	0xc(%rcx,%rdx,8), %xmm7
145902d23:     	jmp	0x145902cf0 <.text+0x5901cf0>
145902d25:     	testb	$0x1, %r8b
145902d29:     	je	0x145902d37 <.text+0x5901d37>
145902d2b:     	cmpb	$0x10, (%rcx,%rdx,8)
145902d2f:     	jne	0x145902d37 <.text+0x5901d37>
145902d31:     	addss	0x4(%rcx,%rdx,8), %xmm7
145902d37:     	addss	0x46a62d(%rip), %xmm7   # 0x145d6d36c
145902d3f:     	movss	0x8(%rax), %xmm8
145902d45:     	movss	0xc(%rax), %xmm3
145902d4a:     	movss	0x4(%rax), %xmm9
145902d50:     	movss	0x538(%r13), %xmm0
145902d59:     	subss	%xmm6, %xmm0
145902d5d:     	movss	%xmm0, 0x538(%r13)
145902d66:     	xorps	%xmm1, %xmm1
145902d69:     	ucomiss	%xmm0, %xmm1
145902d6c:     	jb	0x145902f6b <.text+0x5901f6b>
145902d72:     	movl	0x4d0(%r13), %eax
145902d79:     	movl	%eax, 0xa8(%rbp)
145902d7f:     	movq	0x4c8(%r13), %rax
145902d86:     	movq	%rax, 0xa0(%rbp)
145902d8d:     	movb	%r12b, 0x386(%rbp)
145902d94:     	leaq	0x230(%rbp), %rcx
145902d9b:     	leaq	0xa0(%rbp), %r8
145902da2:     	movq	%r13, %rdx
145902da5:     	callq	0x145925e50 <.text+0x5924e50>
145902daa:     	nop
145902dab:     	movq	0x238(%rbp), %rcx
145902db2:     	cmpq	$0x0, 0x240(%rbp)
145902dba:     	je	0x145904029 <.text+0x5903029>
145902dc0:     	mulss	0x4980d3(%rip), %xmm9   # 0x145d9ae9c
145902dc9:     	mulss	%xmm9, %xmm7
145902dce:     	movq	0x958(%r13), %rdx
145902dd5:     	movq	0x970(%r13), %rax
145902ddc:     	leaq	(%rax,%rdx), %r11
145902de0:     	rolq	$0x17, %r11
145902de4:     	movq	%rcx, 0x350(%rbp)
145902deb:     	movq	(%rcx), %rdi
145902dee:     	addq	%rdx, %r11
145902df1:     	movq	0x960(%r13), %r8
145902df8:     	movq	%r8, %r9
145902dfb:     	shlq	$0x11, %r9
145902dff:     	movq	0x968(%r13), %r10
145902e06:     	xorq	%rdx, %r10
145902e09:     	xorq	%r8, %rax
145902e0c:     	xorq	%r10, %r8
145902e0f:     	movq	%r8, 0x960(%r13)
145902e16:     	xorq	%rax, %rdx
145902e19:     	movq	%rdx, 0x958(%r13)
145902e20:     	xorq	%r9, %r10
145902e23:     	movq	%r10, 0x968(%r13)
145902e2a:     	rolq	$0x2d, %rax
145902e2e:     	shrq	$0x28, %r11
145902e32:     	xorps	%xmm9, %xmm9
145902e36:     	cvtsi2ss	%r11d, %xmm9
145902e3b:     	movq	%rax, 0x970(%r13)
145902e42:     	mulss	0x549fa9(%rip), %xmm9   # 0x145e4cdf4
145902e4b:     	movss	0x484(%r13), %xmm10
145902e54:     	ucomiss	%xmm9, %xmm10
145902e58:     	mulss	0x47c(%r13), %xmm7
145902e61:     	jbe	0x145902e6c <.text+0x5901e6c>
145902e63:     	mulss	0x488(%r13), %xmm7
145902e6c:     	movq	0x460(%r13), %rdx
145902e73:     	ucomiss	%xmm9, %xmm10
145902e77:     	seta	0x20(%rsp)
145902e7c:     	cvttss2si	%xmm7, %rax
145902e81:     	xorl	%ecx, %ecx
145902e83:     	xorps	%xmm0, %xmm0
145902e86:     	ucomiss	%xmm0, %xmm7
145902e89:     	cmovael	%eax, %ecx
145902e8c:     	ucomiss	0x46a9e1(%rip), %xmm7   # 0x145d6d874
145902e93:     	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
145902e99:     	cmovbel	%ecx, %r9d
145902e9d:     	leaq	0xa0(%rbp), %rcx
145902ea4:     	movq	%rdi, %r8
145902ea7:     	callq	0x1458ab9e0 <.text+0x58aa9e0>
145902eac:     	nop
145902ead:     	movq	0x5e0(%r13), %rsi
145902eb4:     	cmpq	0x5d0(%r13), %rsi
145902ebb:     	jne	0x145902eca <.text+0x5901eca>
145902ebd:     	leaq	0x5d0(%r13), %rcx
145902ec4:     	callq	0x145bcb530 <.text+0x5bca530>
145902ec9:     	nop
145902eca:     	movq	0x5d8(%r13), %rax
145902ed1:     	movq	%rsi, %rcx
145902ed4:     	shlq	$0x5, %rcx
145902ed8:     	movups	0xa0(%rbp), %xmm0
145902edf:     	movups	0xb0(%rbp), %xmm1
145902ee6:     	movups	%xmm1, 0x10(%rax,%rcx)
145902eeb:     	movups	%xmm0, (%rax,%rcx)
145902eef:     	incq	%rsi
145902ef2:     	movq	%rsi, 0x5e0(%r13)
145902ef9:     	ucomiss	%xmm9, %xmm10
145902efd:     	seta	0x28(%rsp)
145902f02:     	movb	$0x1, 0x30(%rsp)
145902f07:     	movb	$0x0, 0x20(%rsp)
145902f0c:     	movq	%r13, %rcx
145902f0f:     	movq	%rdi, %rdx
145902f12:     	movaps	%xmm7, %xmm2
145902f15:     	xorl	%r9d, %r9d
145902f18:     	callq	0x145933ec0 <.text+0x5932ec0>
145902f1d:     	nop
145902f1e:     	mulss	0x498015(%rip), %xmm8   # 0x145d9af3c
145902f27:     	movss	0x480(%r13), %xmm0
145902f30:     	sqrtss	%xmm0, %xmm0
145902f34:     	mulss	%xmm8, %xmm0
145902f39:     	movl	0x370(%rbp), %r12d
145902f40:     	movq	0x350(%rbp), %rcx
145902f47:     	movss	%xmm0, 0x538(%r13)
145902f50:     	movq	0x230(%rbp), %rdx
145902f57:     	testq	%rdx, %rdx
145902f5a:     	je	0x145902f6b <.text+0x5901f6b>
145902f5c:     	shlq	$0x3, %rdx
145902f60:     	movl	$0x8, %r8d
145902f66:     	callq	0x1400021d0 <.text+0x11d0>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145904029:     	movss	0x4693f3(%rip), %xmm0   # 0x145d6d424
145904031:     	movss	%xmm0, 0x538(%r13)
14590403a:     	movq	0x230(%rbp), %rdx
145904041:     	testq	%rdx, %rdx
145904044:     	jne	0x145902f5c <.text+0x5901f5c>
14590404a:     	jmp	0x145902f6b <.text+0x5901f6b>

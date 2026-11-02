145c68a30:     	pushq	%rbp
145c68a31:     	pushq	%r15
145c68a33:     	pushq	%r14
145c68a35:     	pushq	%r13
145c68a37:     	pushq	%r12
145c68a39:     	pushq	%rsi
145c68a3a:     	pushq	%rdi
145c68a3b:     	pushq	%rbx
145c68a3c:     	subq	$0xf8, %rsp
145c68a43:     	leaq	0x80(%rsp), %rbp
145c68a4b:     	movaps	%xmm8, 0x60(%rbp)
145c68a50:     	movaps	%xmm7, 0x50(%rbp)
145c68a54:     	movaps	%xmm6, 0x40(%rbp)
145c68a58:     	movq	$-0x2, 0x38(%rbp)
145c68a60:     	movaps	%xmm3, %xmm6
145c68a63:     	movq	%rcx, %rsi
145c68a66:     	movl	0xe0(%rbp), %edi
145c68a6c:     	movss	0xcc0(%rcx), %xmm3
145c68a74:     	movl	(%r8), %eax
145c68a77:     	leaq	0x1778f8a(%rip), %rcx   # 0x1473e1a08
145c68a7e:     	movslq	(%rcx,%rax,4), %rax
145c68a82:     	addq	%rcx, %rax
145c68a85:     	jmpq	*%rax
145c68a87:     	movaps	0x40(%rbp), %xmm6
145c68a8b:     	movaps	0x50(%rbp), %xmm7
145c68a8f:     	movaps	0x60(%rbp), %xmm8
145c68a94:     	addq	$0xf8, %rsp
145c68a9b:     	popq	%rbx
145c68a9c:     	popq	%rdi
145c68a9d:     	popq	%rsi
145c68a9e:     	popq	%r12
145c68aa0:     	popq	%r13
145c68aa2:     	popq	%r14
145c68aa4:     	popq	%r15
145c68aa6:     	popq	%rbp
145c68aa7:     	retq
145c68aa8:     	movss	0x4(%r8), %xmm0
145c68aae:     	movq	0x5b8(%rsi), %rax
145c68ab5:     	movq	0x5c0(%rsi), %rcx
145c68abc:     	imulq	$0x1f8, %rcx, %r8       # imm = 0x1F8
145c68ac3:     	movss	0x5ca3f5(%rip), %xmm1   # 0x146232ec0
145c68acb:     	movss	0x5ca665(%rip), %xmm2   # 0x146233138
145c68ad3:     	movq	%rax, %r9
145c68ad6:     	nopw	%cs:(%rax,%rax)
145c68ae0:     	testq	%r8, %r8
145c68ae3:     	je	0x145c68b09 <.text+0x5c67b09>
145c68ae5:     	movq	%r9, %r10
145c68ae8:     	addq	$0x1f8, %r9             # imm = 0x1F8
145c68aef:     	addq	$-0x1f8, %r8            # imm = 0xFE08
145c68af6:     	cmpq	%rdx, 0xf0(%r10)
145c68afd:     	jne	0x145c68ae0 <.text+0x5c67ae0>
145c68aff:     	cmpq	$-0x1, 0x18(%r10)
145c68b04:     	je	0x145c68ae0 <.text+0x5c67ae0>
145c68b06:     	movaps	%xmm2, %xmm1
145c68b09:     	testq	%rcx, %rcx
145c68b0c:     	je	0x145c68a87 <.text+0x5c67a87>
145c68b12:     	mulss	%xmm1, %xmm0
145c68b16:     	imulq	$0x1f8, %rcx, %r8       # imm = 0x1F8
145c68b1d:     	xorl	%ecx, %ecx
145c68b1f:     	jmp	0x145c68b40 <.text+0x5c67b40>
145c68b21:     	nopw	%cs:(%rax,%rax)
145c68b30:     	addq	$0x1f8, %rcx            # imm = 0x1F8
145c68b37:     	cmpq	%rcx, %r8
145c68b3a:     	je	0x145c68a87 <.text+0x5c67a87>
145c68b40:     	cmpq	%rdx, 0xf0(%rax,%rcx)
145c68b48:     	jne	0x145c68b30 <.text+0x5c67b30>
145c68b4a:     	cmpl	$0x1, 0xb0(%rax,%rcx)
145c68b52:     	je	0x145c68b30 <.text+0x5c67b30>
145c68b54:     	movss	0x1dc(%rax,%rcx), %xmm1
145c68b5d:     	ucomiss	%xmm3, %xmm1
145c68b60:     	ja	0x145c68a87 <.text+0x5c67a87>
145c68b66:     	movzbl	0x1f5(%rax,%rcx), %r8d
145c68b6f:     	cmpq	$0x5, %r8
145c68b73:     	jae	0x145c69652 <.text+0x5c68652>
145c68b79:     	leal	0x1(%r8), %r9d
145c68b7d:     	movb	%r9b, 0x1f5(%rax,%rcx)
145c68b85:     	cmpb	$0x0, 0x1f4(%rax,%rcx)
145c68b8d:     	je	0x145c68b97 <.text+0x5c67b97>
145c68b8f:     	minss	0x5ca329(%rip), %xmm0   # 0x146232ec0
145c68b97:     	movq	0x5c0(%rsi), %rax
145c68b9e:     	testq	%rax, %rax
145c68ba1:     	je	0x145c68a87 <.text+0x5c67a87>
145c68ba7:     	leaq	0x1775c9e(%rip), %rcx   # 0x1473de84c
145c68bae:     	xorps	%xmm1, %xmm1
145c68bb1:     	maxss	%xmm1, %xmm0
145c68bb5:     	mulss	(%rcx,%r8,4), %xmm0
145c68bbb:     	movq	0x5b8(%rsi), %rbx
145c68bc2:     	imulq	$0x1f8, %rax, %rax      # imm = 0x1F8
145c68bc9:     	jmp	0x145c68bde <.text+0x5c67bde>
145c68bcb:     	addq	$0x1f8, %rbx            # imm = 0x1F8
145c68bd2:     	addq	$-0x1f8, %rax           # imm = 0xFE08
145c68bd8:     	je	0x145c68a87 <.text+0x5c67a87>
145c68bde:     	cmpq	%rdx, 0xf0(%rbx)
145c68be5:     	jne	0x145c68bcb <.text+0x5c67bcb>
145c68be7:     	cmpl	$0x1, 0xb0(%rbx)
145c68bee:     	je	0x145c68bcb <.text+0x5c67bcb>
145c68bf0:     	movss	0x1d0(%rbx), %xmm1
145c68bf8:     	ucomiss	%xmm1, %xmm3
145c68bfb:     	jb	0x145c68c05 <.text+0x5c67c05>
145c68bfd:     	movss	%xmm3, 0x1d4(%rbx)
145c68c05:     	addss	%xmm3, %xmm0
145c68c09:     	ucomiss	%xmm0, %xmm1
145c68c0c:     	jae	0x145c68a87 <.text+0x5c67a87>
145c68c12:     	movss	%xmm0, 0x1d0(%rbx)
145c68c1a:     	movq	0xc18(%rsi), %r15
145c68c21:     	addq	$0x10, %r15
145c68c25:     	leaq	0x8(%rbp), %r12
145c68c29:     	movq	%r12, %rcx
145c68c2c:     	movq	%rdx, %r14
145c68c2f:     	movq	%rbx, %rdx
145c68c32:     	movaps	%xmm3, %xmm2
145c68c35:     	movaps	%xmm3, %xmm6
145c68c38:     	callq	0x145b75660 <.text+0x5b74660>
145c68c3d:     	leaq	-0x4(%rbp), %r13
145c68c41:     	movq	%r13, %rcx
145c68c44:     	movq	%r15, %rdx
145c68c47:     	movq	%r12, %r8
145c68c4a:     	callq	0x145b9e150 <.text+0x5b9d150>
145c68c4f:     	movl	0x4(%rbp), %eax
145c68c52:     	movl	%eax, 0x19c(%rbx)
145c68c58:     	movq	-0x4(%rbp), %rax
145c68c5c:     	movq	%rax, 0x194(%rbx)
145c68c63:     	movq	-0x4(%rbp), %rax
145c68c67:     	movq	%rax, 0x1a0(%rbx)
145c68c6e:     	movl	0x4(%rbp), %eax
145c68c71:     	movl	%eax, 0x1a8(%rbx)
145c68c77:     	xorps	%xmm0, %xmm0
145c68c7a:     	movss	%xmm6, %xmm0            # xmm0 = xmm6[0],xmm0[1,2,3]
145c68c7e:     	movlps	%xmm0, 0x1ac(%rbx)
145c68c85:     	movl	0xcf8(%rsi), %r9d
145c68c8c:     	incl	%r9d
145c68c8f:     	movl	%r9d, 0xcf8(%rsi)
145c68c96:     	leaq	0x8(%rbp), %rcx
145c68c9a:     	movq	%r14, %rbx
145c68c9d:     	movq	%r14, %rdx
145c68ca0:     	movq	%r13, %r8
145c68ca3:     	callq	0x145afc160 <.text+0x5afb160>
145c68ca8:     	movq	0x680(%rsi), %r14
145c68caf:     	cmpq	0x670(%rsi), %r14
145c68cb6:     	jne	0x145c68cc5 <.text+0x5c67cc5>
145c68cb8:     	leaq	0x670(%rsi), %rcx
145c68cbf:     	callq	0x146061ee0 <.text+0x6060ee0>
145c68cc4:     	nop
145c68cc5:     	movq	0x678(%rsi), %rax
145c68ccc:     	movq	%r14, %rcx
145c68ccf:     	shlq	$0x5, %rcx
145c68cd3:     	movups	0x8(%rbp), %xmm0
145c68cd7:     	movups	0x18(%rbp), %xmm1
145c68cdb:     	movups	%xmm1, 0x10(%rax,%rcx)
145c68ce0:     	movups	%xmm0, (%rax,%rcx)
145c68ce4:     	incq	%r14
145c68ce7:     	movq	%r14, 0x680(%rsi)
145c68cee:     	movq	%rsi, %rcx
145c68cf1:     	movq	%rbx, %rdx
145c68cf4:     	jmp	0x145c691e2 <.text+0x5c681e2>
145c68cf9:     	movss	0x4c8(%rsi), %xmm6
145c68d01:     	movss	0x4(%r8), %xmm1
145c68d07:     	mulss	%xmm6, %xmm1
145c68d0b:     	xorl	%eax, %eax
145c68d0d:     	cmpb	$0x5, 0x36f(%rsi)
145c68d14:     	setae	%al
145c68d17:     	leaq	0x1774e5a(%rip), %rcx   # 0x1473ddb78
145c68d1e:     	mulss	(%rcx,%rax,4), %xmm1
145c68d23:     	movss	0x538(%rsi), %xmm2
145c68d2b:     	addss	%xmm2, %xmm1
145c68d2f:     	movaps	%xmm1, %xmm3
145c68d32:     	minss	%xmm6, %xmm3
145c68d36:     	movaps	%xmm3, %xmm0
145c68d39:     	cmpunordss	%xmm3, %xmm0
145c68d3e:     	andps	%xmm0, %xmm1
145c68d41:     	andnps	%xmm3, %xmm0
145c68d44:     	orps	%xmm1, %xmm0
145c68d47:     	movss	%xmm0, 0x538(%rsi)
145c68d4f:     	movaps	%xmm0, %xmm8
145c68d53:     	subss	%xmm2, %xmm8
145c68d58:     	xorps	%xmm7, %xmm7
145c68d5b:     	ucomiss	%xmm8, %xmm7
145c68d5f:     	jae	0x145c68de7 <.text+0x5c67de7>
145c68d65:     	leaq	0x1776154(%rip), %rdi   # 0x1473deec0
145c68d6c:     	movl	$0x5, %ebx
145c68d71:     	movl	$0x5, %edx
145c68d76:     	movq	%rdi, %rcx
145c68d79:     	callq	0x145be82d0 <.text+0x5be72d0>
145c68d7e:     	testq	%rax, %rax
145c68d81:     	cmoveq	%rdi, %rax
145c68d85:     	cmoveq	%rbx, %rdx
145c68d89:     	movq	$-0x1, 0x8(%rbp)
145c68d91:     	movq	%rax, 0x10(%rbp)
145c68d95:     	movq	%rdx, 0x18(%rbp)
145c68d99:     	leaq	0x1776125(%rip), %rax   # 0x1473deec5
145c68da0:     	movq	%rax, 0x20(%rbp)
145c68da4:     	movq	$0x18, 0x28(%rbp)
145c68dac:     	movb	$0x0, 0x30(%rbp)
145c68db0:     	leaq	0x750(%rsi), %rcx
145c68db7:     	xorps	%xmm2, %xmm2
145c68dba:     	cvtss2sd	%xmm8, %xmm2
145c68dbf:     	movq	$0x0, 0x20(%rsp)
145c68dc8:     	leaq	0x8(%rbp), %rdx
145c68dcc:     	movl	$0x8, %r9d
145c68dd2:     	callq	0x145c9e440 <.text+0x5c9d440>
145c68dd7:     	movss	0x4c8(%rsi), %xmm6
145c68ddf:     	movss	0x538(%rsi), %xmm0
145c68de7:     	maxss	%xmm7, %xmm0
145c68deb:     	callq	0x146061787 <.text+0x6060787>
145c68df0:     	cvttss2si	%xmm0, %rbx
145c68df5:     	xorl	%r14d, %r14d
145c68df8:     	ucomiss	%xmm7, %xmm0
145c68dfb:     	cmovbl	%r14d, %ebx
145c68dff:     	movss	0x5e3dec(%rip), %xmm8   # 0x14624cbf4
145c68e08:     	ucomiss	%xmm8, %xmm0
145c68e0c:     	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
145c68e12:     	cmoval	%r15d, %ebx
145c68e16:     	movaps	%xmm6, %xmm0
145c68e19:     	callq	0x146061787 <.text+0x6060787>
145c68e1e:     	cvttss2si	%xmm0, %rdi
145c68e23:     	ucomiss	%xmm7, %xmm0
145c68e26:     	cmovbl	%r14d, %edi
145c68e2a:     	ucomiss	%xmm8, %xmm0
145c68e2e:     	cmoval	%r15d, %edi
145c68e32:     	leaq	0xc58(%rsi), %r14
145c68e39:     	movq	0xc58(%rsi), %rax
145c68e40:     	testq	%rax, %rax
145c68e43:     	je	0x145c69376 <.text+0x5c68376>
145c68e49:     	movq	0xc60(%rsi), %rcx
145c68e50:     	movw	$0x16, %dx
145c68e54:     	movzwl	0x36(%rax), %r9d
145c68e59:     	movl	%r9d, %r10d
145c68e5c:     	addl	%r10d, %r10d
145c68e5f:     	movq	$-0x1, %r8
145c68e66:     	nopw	%cs:(%rax,%rax)
145c68e70:     	testq	%r10, %r10
145c68e73:     	je	0x145c68e9e <.text+0x5c67e9e>
145c68e75:     	cmpw	0x3a(%rax,%r8,2), %dx
145c68e7b:     	seta	%r11b
145c68e7f:     	sbbb	$0x0, %r11b
145c68e83:     	incq	%r8
145c68e86:     	addq	$-0x2, %r10
145c68e8a:     	cmpb	$0x1, %r11b
145c68e8e:     	je	0x145c68e70 <.text+0x5c67e70>
145c68e90:     	movzbl	%r11b, %r9d
145c68e94:     	testl	%r9d, %r9d
145c68e97:     	jne	0x145c68ea1 <.text+0x5c67ea1>
145c68e99:     	jmp	0x145c692d7 <.text+0x5c682d7>
145c68e9e:     	movq	%r9, %r8
145c68ea1:     	subq	$0x1, %rcx
145c68ea5:     	jb	0x145c69378 <.text+0x5c68378>
145c68eab:     	movq	0x50(%rax,%r8,8), %rax
145c68eb0:     	jmp	0x145c68e54 <.text+0x5c67e54>
145c68eb2:     	movss	0x4(%r8), %xmm0
145c68eb8:     	movl	0x4c4(%rsi), %eax
145c68ebe:     	incl	%eax
145c68ec0:     	ucomiss	0x4c0(%rsi), %xmm3
145c68ec7:     	movl	$0x1, %ecx
145c68ecc:     	cmovnel	%ecx, %eax
145c68ecf:     	cmovpl	%ecx, %eax
145c68ed2:     	movl	%eax, 0x4c4(%rsi)
145c68ed8:     	movss	%xmm3, 0x4c0(%rsi)
145c68ee0:     	mulss	0x4c8(%rsi), %xmm0
145c68ee8:     	cmpl	$0x5, %eax
145c68eeb:     	movl	$0x5, %ecx
145c68ef0:     	cmovbl	%eax, %ecx
145c68ef3:     	cvtsi2ss	%ecx, %xmm1
145c68ef7:     	mulss	%xmm0, %xmm1
145c68efb:     	movss	0x53c(%rsi), %xmm0
145c68f03:     	movaps	%xmm0, %xmm2
145c68f06:     	maxss	%xmm1, %xmm2
145c68f0a:     	movaps	%xmm2, %xmm1
145c68f0d:     	cmpunordss	%xmm2, %xmm1
145c68f12:     	movaps	%xmm1, %xmm3
145c68f15:     	andnps	%xmm2, %xmm3
145c68f18:     	andps	%xmm0, %xmm1
145c68f1b:     	orps	%xmm3, %xmm1
145c68f1e:     	movss	%xmm1, 0x53c(%rsi)
145c68f26:     	testl	%edi, %edi
145c68f28:     	je	0x145c68a87 <.text+0x5c67a87>
145c68f2e:     	movq	0x3d8(%rsi), %rax
145c68f35:     	movq	0x3e0(%rsi), %rbx
145c68f3c:     	movq	%rbx, %rcx
145c68f3f:     	shlq	$0x5, %rcx
145c68f43:     	movq	%rax, %rdx
145c68f46:     	nopw	%cs:(%rax,%rax)
145c68f50:     	testq	%rcx, %rcx
145c68f53:     	je	0x145c693d7 <.text+0x5c683d7>
145c68f59:     	addq	$-0x20, %rcx
145c68f5d:     	cmpl	%edi, 0x14(%rdx)
145c68f60:     	leaq	0x20(%rdx), %rdx
145c68f64:     	jne	0x145c68f50 <.text+0x5c67f50>
145c68f66:     	jmp	0x145c68a87 <.text+0x5c67a87>
145c68f6b:     	movq	0x5c0(%rsi), %rcx
145c68f72:     	testq	%rcx, %rcx
145c68f75:     	je	0x145c68a87 <.text+0x5c67a87>
145c68f7b:     	movss	0x4(%r8), %xmm0
145c68f81:     	movq	0x5b8(%rsi), %rax
145c68f88:     	imulq	$0x1f8, %rcx, %r8       # imm = 0x1F8
145c68f8f:     	xorl	%ecx, %ecx
145c68f91:     	jmp	0x145c68fb0 <.text+0x5c67fb0>
145c68f93:     	nopw	%cs:(%rax,%rax)
145c68fa0:     	addq	$0x1f8, %rcx            # imm = 0x1F8
145c68fa7:     	cmpq	%rcx, %r8
145c68faa:     	je	0x145c68a87 <.text+0x5c67a87>
145c68fb0:     	cmpq	%rdx, 0xf0(%rax,%rcx)
145c68fb8:     	jne	0x145c68fa0 <.text+0x5c67fa0>
145c68fba:     	cmpl	$0x0, 0xb0(%rax,%rcx)
145c68fc2:     	jne	0x145c68fa0 <.text+0x5c67fa0>
145c68fc4:     	cmpq	$-0x1, 0x18(%rax,%rcx)
145c68fca:     	jne	0x145c68fa0 <.text+0x5c67fa0>
145c68fcc:     	xorl	%ecx, %ecx
145c68fce:     	jmp	0x145c68fe0 <.text+0x5c67fe0>
145c68fd0:     	addq	$0x1f8, %rcx            # imm = 0x1F8
145c68fd7:     	cmpq	%rcx, %r8
145c68fda:     	je	0x145c68a87 <.text+0x5c67a87>
145c68fe0:     	cmpq	%rdx, 0xf0(%rax,%rcx)
145c68fe8:     	jne	0x145c68fd0 <.text+0x5c67fd0>
145c68fea:     	cmpl	$0x1, 0xb0(%rax,%rcx)
145c68ff2:     	je	0x145c68fd0 <.text+0x5c67fd0>
145c68ff4:     	movss	0x1dc(%rax,%rcx), %xmm1
145c68ffd:     	ucomiss	%xmm3, %xmm1
145c69000:     	ja	0x145c68a87 <.text+0x5c67a87>
145c69006:     	movzbl	0x1f5(%rax,%rcx), %r8d
145c6900f:     	cmpq	$0x5, %r8
145c69013:     	jae	0x145c69652 <.text+0x5c68652>
145c69019:     	leaq	0x177582c(%rip), %r9    # 0x1473de84c
145c69020:     	leal	0x1(%r8), %r10d
145c69024:     	movb	%r10b, 0x1f5(%rax,%rcx)
145c6902c:     	cmpb	$0x0, 0x1f4(%rax,%rcx)
145c69034:     	je	0x145c6903e <.text+0x5c6803e>
145c69036:     	minss	0x5c9e82(%rip), %xmm0   # 0x146232ec0
145c6903e:     	xorps	%xmm1, %xmm1
145c69041:     	maxss	%xmm1, %xmm0
145c69045:     	mulss	(%r9,%r8,4), %xmm0
145c6904b:     	movq	0x5b8(%rsi), %rax
145c69052:     	imulq	$0x1f8, 0x5c0(%rsi), %r8 # imm = 0x1F8
145c6905d:     	xorl	%ecx, %ecx
145c6905f:     	movq	%rax, %r9
145c69062:     	cmpq	%rcx, %r8
145c69065:     	je	0x145c68a87 <.text+0x5c67a87>
145c6906b:     	addq	$0x1f8, %rcx            # imm = 0x1F8
145c69072:     	cmpq	%rdx, 0xf0(%r9)
145c69079:     	leaq	0x1f8(%r9), %r9
145c69080:     	jne	0x145c69062 <.text+0x5c68062>
145c69082:     	addss	%xmm3, %xmm0
145c69086:     	ucomiss	-0x20(%rax,%rcx), %xmm0
145c6908b:     	jbe	0x145c68a87 <.text+0x5c67a87>
145c69091:     	movss	%xmm0, -0x20(%rax,%rcx)
145c69097:     	movss	%xmm3, -0x44(%rax,%rcx)
145c6909d:     	jmp	0x145c68a87 <.text+0x5c67a87>
145c690a2:     	movq	0x5c0(%rsi), %rcx
145c690a9:     	testq	%rcx, %rcx
145c690ac:     	je	0x145c68a87 <.text+0x5c67a87>
145c690b2:     	movss	0x4(%r8), %xmm0
145c690b8:     	movss	0x8(%r8), %xmm1
145c690be:     	movq	0x5b8(%rsi), %rax
145c690c5:     	imulq	$0x1f8, %rcx, %r8       # imm = 0x1F8
145c690cc:     	xorl	%ecx, %ecx
145c690ce:     	jmp	0x145c690e0 <.text+0x5c680e0>
145c690d0:     	addq	$0x1f8, %rcx            # imm = 0x1F8
145c690d7:     	cmpq	%rcx, %r8
145c690da:     	je	0x145c68a87 <.text+0x5c67a87>
145c690e0:     	cmpq	%rdx, 0xf0(%rax,%rcx)
145c690e8:     	jne	0x145c690d0 <.text+0x5c680d0>
145c690ea:     	cmpl	$0x1, 0xb0(%rax,%rcx)
145c690f2:     	je	0x145c690d0 <.text+0x5c680d0>
145c690f4:     	addss	%xmm1, %xmm3
145c690f8:     	movss	%xmm0, 0x108(%rax,%rcx)
145c69101:     	movss	%xmm3, 0x10c(%rax,%rcx)
145c6910a:     	jmp	0x145c68a87 <.text+0x5c67a87>
145c6910f:     	movq	0x5c0(%rsi), %rax
145c69116:     	testq	%rax, %rax
145c69119:     	je	0x145c68a87 <.text+0x5c67a87>
145c6911f:     	movss	0x4(%r8), %xmm6
145c69125:     	movss	0x8(%r8), %xmm8
145c6912b:     	movq	0x5b8(%rsi), %rbx
145c69132:     	imulq	$0x1f8, %rax, %rax      # imm = 0x1F8
145c69139:     	addq	$0x110, %rbx            # imm = 0x110
145c69140:     	jmp	0x145c69163 <.text+0x5c68163>
145c69142:     	nopw	%cs:(%rax,%rax)
145c69150:     	addq	$0x1f8, %rbx            # imm = 0x1F8
145c69157:     	addq	$-0x1f8, %rax           # imm = 0xFE08
145c6915d:     	je	0x145c68a87 <.text+0x5c67a87>
145c69163:     	cmpq	%rdx, -0x20(%rbx)
145c69167:     	jne	0x145c69150 <.text+0x5c68150>
145c69169:     	cmpl	$0x1, -0x60(%rbx)
145c6916d:     	je	0x145c69150 <.text+0x5c68150>
145c6916f:     	movq	%rdx, %r14
145c69172:     	movaps	%xmm3, %xmm7
145c69175:     	addss	%xmm8, %xmm7
145c6917a:     	movq	%rbx, %rcx
145c6917d:     	movaps	%xmm6, %xmm1
145c69180:     	movaps	%xmm7, %xmm2
145c69183:     	callq	0x145b760b0 <.text+0x5b750b0>
145c69188:     	movss	(%rbx), %xmm0
145c6918c:     	ucomiss	%xmm6, %xmm0
145c6918f:     	jne	0x145c691a8 <.text+0x5c681a8>
145c69191:     	jp	0x145c691a8 <.text+0x5c681a8>
145c69193:     	movss	0x4(%rbx), %xmm0
145c69198:     	ucomiss	%xmm7, %xmm0
145c6919b:     	jne	0x145c691a8 <.text+0x5c681a8>
145c6919d:     	jp	0x145c691a8 <.text+0x5c681a8>
145c6919f:     	movss	%xmm8, 0xb0(%rbx)
145c691a8:     	testl	%edi, %edi
145c691aa:     	je	0x145c68a87 <.text+0x5c67a87>
145c691b0:     	movl	0xac(%rbx), %r8d
145c691b7:     	cmpl	%edi, %r8d
145c691ba:     	je	0x145c68a87 <.text+0x5c67a87>
145c691c0:     	movq	%r14, %rdx
145c691c3:     	movl	%edi, 0xac(%rbx)
145c691c9:     	testl	%r8d, %r8d
145c691cc:     	je	0x145c691df <.text+0x5c681df>
145c691ce:     	movq	%rsi, %rcx
145c691d1:     	movq	%r14, %rdx
145c691d4:     	xorl	%r9d, %r9d
145c691d7:     	callq	0x145c4b730 <.text+0x5c4a730>
145c691dc:     	movq	%r14, %rdx
145c691df:     	movq	%rsi, %rcx
145c691e2:     	movl	%edi, %r8d
145c691e5:     	movb	$0x1, %r9b
145c691e8:     	movaps	0x40(%rbp), %xmm6
145c691ec:     	movaps	0x50(%rbp), %xmm7
145c691f0:     	movaps	0x60(%rbp), %xmm8
145c691f5:     	addq	$0xf8, %rsp
145c691fc:     	popq	%rbx
145c691fd:     	popq	%rdi
145c691fe:     	popq	%rsi
145c691ff:     	popq	%r12
145c69201:     	popq	%r13
145c69203:     	popq	%r14
145c69205:     	popq	%r15
145c69207:     	popq	%rbp
145c69208:     	jmp	0x145c4b730 <.text+0x5c4a730>
145c6920d:     	mulss	0x4(%r8), %xmm6
145c69213:     	leaq	-0x38(%rbp), %rcx
145c69217:     	movq	%rsi, %rdx
145c6921a:     	movl	%edi, %r8d
145c6921d:     	callq	0x145c11ed0 <.text+0x5c10ed0>
145c69222:     	xorl	%eax, %eax
145c69224:     	cmpb	$0x5, 0x36f(%rsi)
145c6922b:     	setae	%al
145c6922e:     	leaq	0x1774943(%rip), %rcx   # 0x1473ddb78
145c69235:     	mulss	(%rcx,%rax,4), %xmm6
145c6923a:     	movss	0x538(%rsi), %xmm0
145c69242:     	addss	%xmm0, %xmm6
145c69246:     	movaps	%xmm6, %xmm1
145c69249:     	minss	0x4c8(%rsi), %xmm1
145c69251:     	movaps	%xmm1, %xmm7
145c69254:     	cmpunordss	%xmm1, %xmm7
145c69259:     	andps	%xmm7, %xmm6
145c6925c:     	andnps	%xmm1, %xmm7
145c6925f:     	orps	%xmm6, %xmm7
145c69262:     	movss	%xmm7, 0x538(%rsi)
145c6926a:     	subss	%xmm0, %xmm7
145c6926e:     	xorps	%xmm0, %xmm0
145c69271:     	ucomiss	%xmm7, %xmm0
145c69274:     	movq	-0x38(%rbp), %rdx
145c69278:     	jae	0x145c6934f <.text+0x5c6834f>
145c6927e:     	cmpq	$-0x2, %rdx
145c69282:     	jne	0x145c6945b <.text+0x5c6845b>
145c69288:     	leaq	0x1775c31(%rip), %rdi   # 0x1473deec0
145c6928f:     	movl	$0x5, %ebx
145c69294:     	movl	$0x5, %edx
145c69299:     	movq	%rdi, %rcx
145c6929c:     	callq	0x145be82d0 <.text+0x5be72d0>
145c692a1:     	testq	%rax, %rax
145c692a4:     	cmoveq	%rdi, %rax
145c692a8:     	cmoveq	%rbx, %rdx
145c692ac:     	movq	%rax, 0x10(%rbp)
145c692b0:     	movq	%rdx, 0x18(%rbp)
145c692b4:     	leaq	0x1775c0a(%rip), %rax   # 0x1473deec5
145c692bb:     	movq	%rax, 0x20(%rbp)
145c692bf:     	movq	$0x18, 0x28(%rbp)
145c692c7:     	movb	$0x0, 0x30(%rbp)
145c692cb:     	movq	$-0x1, %rdx
145c692d2:     	jmp	0x145c69473 <.text+0x5c68473>
145c692d7:     	movl	%ebx, 0x8(%rax,%r8,4)
145c692dc:     	movq	(%r14), %rax
145c692df:     	testq	%rax, %rax
145c692e2:     	je	0x145c693b0 <.text+0x5c683b0>
145c692e8:     	movq	0xc60(%rsi), %rcx
145c692ef:     	movw	$0x1c, %dx
145c692f3:     	movzwl	0x36(%rax), %r9d
145c692f8:     	movl	%r9d, %r10d
145c692fb:     	addl	%r10d, %r10d
145c692fe:     	movq	$-0x1, %r8
145c69305:     	nopw	%cs:(%rax,%rax)
145c69310:     	testq	%r10, %r10
145c69313:     	je	0x145c6933f <.text+0x5c6833f>
145c69315:     	cmpw	0x3a(%rax,%r8,2), %dx
145c6931b:     	seta	%r11b
145c6931f:     	sbbb	$0x0, %r11b
145c69323:     	incq	%r8
145c69326:     	addq	$-0x2, %r10
145c6932a:     	cmpb	$0x1, %r11b
145c6932e:     	je	0x145c69310 <.text+0x5c68310>
145c69330:     	movzbl	%r11b, %r9d
145c69334:     	testl	%r9d, %r9d
145c69337:     	je	0x145c695db <.text+0x5c685db>
145c6933d:     	jmp	0x145c69342 <.text+0x5c68342>
145c6933f:     	movq	%r9, %r8
145c69342:     	subq	$0x1, %rcx
145c69346:     	jb	0x145c693b2 <.text+0x5c683b2>
145c69348:     	movq	0x50(%rax,%r8,8), %rax
145c6934d:     	jmp	0x145c692f3 <.text+0x5c682f3>
145c6934f:     	cmpq	$-0x3, %rdx
145c69353:     	ja	0x145c6949a <.text+0x5c6849a>
145c69359:     	testq	%rdx, %rdx
145c6935c:     	je	0x145c6949a <.text+0x5c6849a>
145c69362:     	movq	-0x30(%rbp), %rcx
145c69366:     	movl	$0x1, %r8d
145c6936c:     	callq	0x1400021d0 <.text+0x11d0>
145c69371:     	jmp	0x145c6949a <.text+0x5c6849a>
145c69376:     	xorl	%eax, %eax
145c69378:     	movq	%r14, 0x8(%rbp)
145c6937c:     	movq	%rax, 0x10(%rbp)
145c69380:     	movq	$0x0, 0x18(%rbp)
145c69388:     	movq	%r8, 0x20(%rbp)
145c6938c:     	movq	$0x16, 0x28(%rbp)
145c69394:     	leaq	-0x38(%rbp), %rcx
145c69398:     	leaq	0x8(%rbp), %rdx
145c6939c:     	movl	%ebx, %r8d
145c6939f:     	callq	0x145cc1610 <.text+0x5cc0610>
145c693a4:     	movq	(%r14), %rax
145c693a7:     	testq	%rax, %rax
145c693aa:     	jne	0x145c692e8 <.text+0x5c682e8>
145c693b0:     	xorl	%eax, %eax
145c693b2:     	movq	%r14, 0x8(%rbp)
145c693b6:     	movq	%rax, 0x10(%rbp)
145c693ba:     	movq	$0x0, 0x18(%rbp)
145c693c2:     	movq	%r8, 0x20(%rbp)
145c693c6:     	movq	$0x1c, 0x28(%rbp)
145c693ce:     	leaq	-0x38(%rbp), %rcx
145c693d2:     	jmp	0x145c69641 <.text+0x5c68641>
145c693d7:     	cmpq	0x3d0(%rsi), %rbx
145c693de:     	jne	0x145c693f9 <.text+0x5c683f9>
145c693e0:     	leaq	0x3d0(%rsi), %rcx
145c693e7:     	movq	%r8, %r14
145c693ea:     	callq	0x146061ee0 <.text+0x6060ee0>
145c693ef:     	movq	%r14, %r8
145c693f2:     	movq	0x3d8(%rsi), %rax
145c693f9:     	movq	%rbx, %rcx
145c693fc:     	shlq	$0x5, %rcx
145c69400:     	movq	$0x0, (%rax,%rcx)
145c69408:     	movq	(%r8), %rdx
145c6940b:     	movq	%rdx, 0x8(%rax,%rcx)
145c69410:     	movl	0x8(%r8), %edx
145c69414:     	movl	%edx, 0x10(%rax,%rcx)
145c69418:     	movl	%edi, 0x14(%rax,%rcx)
145c6941c:     	movss	0x611bf0(%rip), %xmm0   # 0x14627b014
145c69424:     	movlps	%xmm0, 0x18(%rax,%rcx)
145c69429:     	incq	%rbx
145c6942c:     	movq	%rbx, 0x3e0(%rsi)
145c69433:     	movq	%rsi, %rcx
145c69436:     	movaps	0x40(%rbp), %xmm6
145c6943a:     	movaps	0x50(%rbp), %xmm7
145c6943e:     	movaps	0x60(%rbp), %xmm8
145c69443:     	addq	$0xf8, %rsp
145c6944a:     	popq	%rbx
145c6944b:     	popq	%rdi
145c6944c:     	popq	%rsi
145c6944d:     	popq	%r12
145c6944f:     	popq	%r13
145c69451:     	popq	%r14
145c69453:     	popq	%r15
145c69455:     	popq	%rbp
145c69456:     	jmp	0x145c0d580 <.text+0x5c0c580>
145c6945b:     	movq	-0x10(%rbp), %rax
145c6945f:     	movq	%rax, 0x30(%rbp)
145c69463:     	movups	-0x30(%rbp), %xmm0
145c69467:     	movups	-0x20(%rbp), %xmm1
145c6946b:     	movups	%xmm1, 0x20(%rbp)
145c6946f:     	movups	%xmm0, 0x10(%rbp)
145c69473:     	movq	%rdx, 0x8(%rbp)
145c69477:     	leaq	0x750(%rsi), %rcx
145c6947e:     	cvtss2sd	%xmm7, %xmm2
145c69482:     	movq	$0x0, 0x20(%rsp)
145c6948b:     	leaq	0x8(%rbp), %rdx
145c6948f:     	movl	$0x8, %r9d
145c69495:     	callq	0x145c9e440 <.text+0x5c9d440>
145c6949a:     	movss	0x4c8(%rsi), %xmm6
145c694a2:     	movss	0x538(%rsi), %xmm0
145c694aa:     	xorps	%xmm7, %xmm7
145c694ad:     	maxss	%xmm7, %xmm0
145c694b1:     	callq	0x146061787 <.text+0x6060787>
145c694b6:     	cvttss2si	%xmm0, %rbx
145c694bb:     	xorl	%r14d, %r14d
145c694be:     	ucomiss	%xmm7, %xmm0
145c694c1:     	cmovbl	%r14d, %ebx
145c694c5:     	movss	0x5e3726(%rip), %xmm8   # 0x14624cbf4
145c694ce:     	ucomiss	%xmm8, %xmm0
145c694d2:     	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
145c694d8:     	cmoval	%r15d, %ebx
145c694dc:     	movaps	%xmm6, %xmm0
145c694df:     	callq	0x146061787 <.text+0x6060787>
145c694e4:     	cvttss2si	%xmm0, %rdi
145c694e9:     	ucomiss	%xmm7, %xmm0
145c694ec:     	cmovbl	%r14d, %edi
145c694f0:     	ucomiss	%xmm8, %xmm0
145c694f4:     	cmoval	%r15d, %edi
145c694f8:     	leaq	0xc58(%rsi), %r14
145c694ff:     	movq	0xc58(%rsi), %rax
145c69506:     	testq	%rax, %rax
145c69509:     	je	0x145c695e5 <.text+0x5c685e5>
145c6950f:     	movq	0xc60(%rsi), %rcx
145c69516:     	movw	$0x16, %dx
145c6951a:     	movzwl	0x36(%rax), %r9d
145c6951f:     	movl	%r9d, %r10d
145c69522:     	addl	%r10d, %r10d
145c69525:     	movq	$-0x1, %r8
145c6952c:     	nopl	(%rax)
145c69530:     	testq	%r10, %r10
145c69533:     	je	0x145c6955b <.text+0x5c6855b>
145c69535:     	cmpw	0x3a(%rax,%r8,2), %dx
145c6953b:     	seta	%r11b
145c6953f:     	sbbb	$0x0, %r11b
145c69543:     	incq	%r8
145c69546:     	addq	$-0x2, %r10
145c6954a:     	cmpb	$0x1, %r11b
145c6954e:     	je	0x145c69530 <.text+0x5c68530>
145c69550:     	movzbl	%r11b, %r9d
145c69554:     	testl	%r9d, %r9d
145c69557:     	jne	0x145c6955e <.text+0x5c6855e>
145c69559:     	jmp	0x145c6956f <.text+0x5c6856f>
145c6955b:     	movq	%r9, %r8
145c6955e:     	subq	$0x1, %rcx
145c69562:     	jb	0x145c695e7 <.text+0x5c685e7>
145c69568:     	movq	0x50(%rax,%r8,8), %rax
145c6956d:     	jmp	0x145c6951a <.text+0x5c6851a>
145c6956f:     	movl	%ebx, 0x8(%rax,%r8,4)
145c69574:     	movq	(%r14), %rax
145c69577:     	testq	%rax, %rax
145c6957a:     	je	0x145c6961f <.text+0x5c6861f>
145c69580:     	movq	0xc60(%rsi), %rcx
145c69587:     	movw	$0x1c, %dx
145c6958b:     	movzwl	0x36(%rax), %r9d
145c69590:     	movl	%r9d, %r10d
145c69593:     	addl	%r10d, %r10d
145c69596:     	movq	$-0x1, %r8
145c6959d:     	nopl	(%rax)
145c695a0:     	testq	%r10, %r10
145c695a3:     	je	0x145c695cb <.text+0x5c685cb>
145c695a5:     	cmpw	0x3a(%rax,%r8,2), %dx
145c695ab:     	seta	%r11b
145c695af:     	sbbb	$0x0, %r11b
145c695b3:     	incq	%r8
145c695b6:     	addq	$-0x2, %r10
145c695ba:     	cmpb	$0x1, %r11b
145c695be:     	je	0x145c695a0 <.text+0x5c685a0>
145c695c0:     	movzbl	%r11b, %r9d
145c695c4:     	testl	%r9d, %r9d
145c695c7:     	jne	0x145c695ce <.text+0x5c685ce>
145c695c9:     	jmp	0x145c695db <.text+0x5c685db>
145c695cb:     	movq	%r9, %r8
145c695ce:     	subq	$0x1, %rcx
145c695d2:     	jb	0x145c69621 <.text+0x5c68621>
145c695d4:     	movq	0x50(%rax,%r8,8), %rax
145c695d9:     	jmp	0x145c6958b <.text+0x5c6858b>
145c695db:     	movl	%edi, 0x8(%rax,%r8,4)
145c695e0:     	jmp	0x145c68a87 <.text+0x5c67a87>
145c695e5:     	xorl	%eax, %eax
145c695e7:     	movq	%r14, 0x8(%rbp)
145c695eb:     	movq	%rax, 0x10(%rbp)
145c695ef:     	movq	$0x0, 0x18(%rbp)
145c695f7:     	movq	%r8, 0x20(%rbp)
145c695fb:     	movq	$0x16, 0x28(%rbp)
145c69603:     	leaq	-0x58(%rbp), %rcx
145c69607:     	leaq	0x8(%rbp), %rdx
145c6960b:     	movl	%ebx, %r8d
145c6960e:     	callq	0x145cc1610 <.text+0x5cc0610>
145c69613:     	movq	(%r14), %rax
145c69616:     	testq	%rax, %rax
145c69619:     	jne	0x145c69580 <.text+0x5c68580>
145c6961f:     	xorl	%eax, %eax
145c69621:     	movq	%r14, 0x8(%rbp)
145c69625:     	movq	%rax, 0x10(%rbp)
145c69629:     	movq	$0x0, 0x18(%rbp)
145c69631:     	movq	%r8, 0x20(%rbp)
145c69635:     	movq	$0x1c, 0x28(%rbp)
145c6963d:     	leaq	-0x58(%rbp), %rcx
145c69641:     	leaq	0x8(%rbp), %rdx
145c69645:     	movl	%edi, %r8d
145c69648:     	callq	0x145cc1610 <.text+0x5cc0610>
145c6964d:     	jmp	0x145c68a87 <.text+0x5c67a87>
145c69652:     	movss	0x5e3186(%rip), %xmm0   # 0x14624c7e0
145c6965a:     	addss	%xmm3, %xmm0
145c6965e:     	movss	%xmm0, 0x1dc(%rax,%rcx)
145c69667:     	movb	$0x0, 0x1f5(%rax,%rcx)
145c6966f:     	movss	0x1c8(%rax,%rcx), %xmm0
145c69678:     	movss	0x1d0(%rax,%rcx), %xmm1
145c69681:     	movaps	%xmm1, %xmm2
145c69684:     	minss	%xmm3, %xmm2
145c69688:     	movaps	%xmm2, %xmm4
145c6968b:     	cmpunordss	%xmm2, %xmm4
145c69690:     	andps	%xmm4, %xmm1
145c69693:     	andnps	%xmm2, %xmm4
145c69696:     	orps	%xmm1, %xmm4
145c69699:     	movss	%xmm4, 0x1d0(%rax,%rcx)
145c696a2:     	movss	0x1d8(%rax,%rcx), %xmm1
145c696ab:     	movaps	%xmm1, %xmm2
145c696ae:     	minss	%xmm3, %xmm2
145c696b2:     	movaps	%xmm2, %xmm4
145c696b5:     	cmpunordss	%xmm2, %xmm4
145c696ba:     	andps	%xmm4, %xmm1
145c696bd:     	andnps	%xmm2, %xmm4
145c696c0:     	orps	%xmm1, %xmm4
145c696c3:     	movss	%xmm4, 0x1d8(%rax,%rcx)
145c696cc:     	movaps	%xmm0, %xmm1
145c696cf:     	minss	%xmm3, %xmm1
145c696d3:     	movaps	%xmm1, %xmm2
145c696d6:     	cmpunordss	%xmm1, %xmm2
145c696db:     	andps	%xmm2, %xmm0
145c696de:     	andnps	%xmm1, %xmm2
145c696e1:     	orps	%xmm0, %xmm2
145c696e4:     	movss	%xmm2, 0x1c8(%rax,%rcx)
145c696ed:     	movss	%xmm3, 0x1b4(%rax,%rcx)
145c696f6:     	jmp	0x145c68a87 <.text+0x5c67a87>

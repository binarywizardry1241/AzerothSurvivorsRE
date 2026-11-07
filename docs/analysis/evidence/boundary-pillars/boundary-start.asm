
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145919c2f:     	movq	0x290(%r13), %r14
145919c36:     	movq	0x298(%r13), %r15
145919c3d:     	movq	%r14, %rcx
145919c40:     	movq	%r15, %rdx
145919c43:     	callq	0x1458753b0 <.text+0x58743b0>
145919c48:     	imulq	$0xf0, %rax, %rcx
145919c4f:     	leaq	0x128f7fa(%rip), %rdx   # 0x146ba9450
145919c56:     	leaq	(%rdx,%rcx), %r8
145919c5a:     	movq	$0x0, 0x140(%rbp)
145919c65:     	movq	$0x4, 0x148(%rbp)
145919c70:     	movq	$0x0, 0x150(%rbp)
145919c7b:     	movq	0x60(%rcx,%rdx), %rcx
145919c80:     	cmpq	$0x2, %rax
145919c84:     	movq	%r8, 0xf0(%rbp)
145919c8b:     	je	0x145919c96 <.text+0x5918c96>
145919c8d:     	cmpl	$0x7, %eax
145919c90:     	jne	0x14591a239 <.text+0x5919239>
145919c96:     	movq	0x58(%r8), %r12
145919c9a:     	leaq	(%r12,%rcx,8), %rax
145919c9e:     	movq	%rax, 0x190(%rbp)
145919ca5:     	movss	0x4536be(%rip), %xmm9   # 0x145d6d36c
145919cae:     	movss	0x4841a9(%rip), %xmm10  # 0x145d9de60
145919cb7:     	xorps	%xmm11, %xmm11
145919cbb:     	movss	0x4841a0(%rip), %xmm12  # 0x145d9de64
145919cc4:     	leaq	0x140(%rbp), %rdi
145919ccb:     	xorl	%ebx, %ebx
145919ccd:     	movq	%r12, %r15
145919cd0:     	movq	%rcx, 0x180(%rbp)
145919cd7:     	jmp	0x145919cee <.text+0x5918cee>
145919cd9:     	nopl	(%rax)
145919ce0:     	movq	0x138(%rbp), %r13
145919ce7:     	movq	0x180(%rbp), %rcx
145919cee:     	cmpq	0x190(%rbp), %r15
145919cf5:     	je	0x145919e96 <.text+0x5918e96>
145919cfb:     	incq	%rbx
145919cfe:     	movq	%rbx, %rax
145919d01:     	orq	%rcx, %rax
145919d04:     	shrq	$0x20, %rax
145919d08:     	je	0x145919d20 <.text+0x5918d20>
145919d0a:     	movq	%rbx, %rax
145919d0d:     	xorl	%edx, %edx
145919d0f:     	divq	%rcx
145919d12:     	jmp	0x145919d26 <.text+0x5918d26>
145919d14:     	nopw	%cs:(%rax,%rax)
145919d20:     	movl	%ebx, %eax
145919d22:     	xorl	%edx, %edx
145919d24:     	divl	%ecx
145919d26:     	movss	(%r12,%rdx,8), %xmm6
145919d2c:     	movss	0x4(%r12,%rdx,8), %xmm7
145919d33:     	movss	(%r15), %xmm13
145919d38:     	movss	0x4(%r15), %xmm14
145919d3e:     	subss	%xmm13, %xmm6
145919d43:     	subss	%xmm14, %xmm7
145919d48:     	movaps	%xmm6, %xmm0
145919d4b:     	movaps	%xmm7, %xmm1
145919d4e:     	callq	0x145bc97f9 <.text+0x5bc87f9>
145919d53:     	divss	0x453515(%rip), %xmm0   # 0x145d6d270
145919d5b:     	callq	0x145bc981d <.text+0x5bc881d>
145919d60:     	maxss	%xmm9, %xmm0
145919d65:     	cvttss2si	%xmm0, %rax
145919d6a:     	movq	%rax, %rcx
145919d6d:     	sarq	$0x3f, %rcx
145919d71:     	movaps	%xmm0, %xmm1
145919d74:     	subss	%xmm10, %xmm1
145919d79:     	cvttss2si	%xmm1, %r13
145919d7e:     	andq	%rcx, %r13
145919d81:     	orq	%rax, %r13
145919d84:     	ucomiss	%xmm11, %xmm0
145919d88:     	movl	$0x0, %eax
145919d8d:     	cmovbq	%rax, %r13
145919d91:     	ucomiss	%xmm12, %xmm0
145919d95:     	movq	$-0x1, %rax
145919d9c:     	cmovaq	%rax, %r13
145919da0:     	testq	%r13, %r13
145919da3:     	js	0x145919db0 <.text+0x5918db0>
145919da5:     	xorps	%xmm15, %xmm15
145919da9:     	cvtsi2ss	%r13, %xmm15
145919dae:     	jmp	0x145919dcd <.text+0x5918dcd>
145919db0:     	movq	%r13, %rax
145919db3:     	shrq	%rax
145919db6:     	movl	%r13d, %ecx
145919db9:     	andl	$0x1, %ecx
145919dbc:     	orq	%rax, %rcx
145919dbf:     	xorps	%xmm15, %xmm15
145919dc3:     	cvtsi2ss	%rcx, %xmm15
145919dc8:     	addss	%xmm15, %xmm15
145919dcd:     	addq	$0x8, %r15
145919dd1:     	xorl	%r14d, %r14d
145919dd4:     	jmp	0x145919e34 <.text+0x5918e34>
145919dd6:     	nopw	%cs:(%rax,%rax)
145919de0:     	movb	$0x1, 0x17f(%rbp)
145919de7:     	movq	%rdi, %rcx
145919dea:     	callq	0x145bfb120 <.text+0x5bfa120>
145919def:     	nop
145919df0:     	divss	%xmm15, %xmm8
145919df5:     	movaps	%xmm6, %xmm0
145919df8:     	mulss	%xmm8, %xmm0
145919dfd:     	addss	%xmm13, %xmm0
145919e02:     	mulss	%xmm7, %xmm8
145919e07:     	addss	%xmm14, %xmm8
145919e0c:     	movd	%xmm0, %eax
145919e10:     	movd	%xmm8, %ecx
145919e15:     	shlq	$0x20, %rcx
145919e19:     	orq	%rcx, %rax
145919e1c:     	movq	0x148(%rbp), %rcx
145919e23:     	movq	%rax, (%rcx,%rsi,8)
145919e27:     	incq	%rsi
145919e2a:     	movq	%rsi, 0x150(%rbp)
145919e31:     	incq	%r14
145919e34:     	cmpq	%r13, %r14
145919e37:     	jae	0x145919ce0 <.text+0x5918ce0>
145919e3d:     	testq	%r14, %r14
145919e40:     	js	0x145919e60 <.text+0x5918e60>
145919e42:     	xorps	%xmm8, %xmm8
145919e46:     	cvtsi2ss	%r14, %xmm8
145919e4b:     	movq	0x150(%rbp), %rsi
145919e52:     	cmpq	0x140(%rbp), %rsi
145919e59:     	jne	0x145919df0 <.text+0x5918df0>
145919e5b:     	jmp	0x145919de0 <.text+0x5918de0>
145919e5d:     	nopl	(%rax)
145919e60:     	movq	%r14, %rax
145919e63:     	shrq	%rax
145919e66:     	movl	%r14d, %ecx
145919e69:     	andl	$0x1, %ecx
145919e6c:     	orq	%rax, %rcx
145919e6f:     	xorps	%xmm8, %xmm8
145919e73:     	cvtsi2ss	%rcx, %xmm8
145919e78:     	addss	%xmm8, %xmm8
145919e7d:     	movq	0x150(%rbp), %rsi
145919e84:     	cmpq	0x140(%rbp), %rsi
145919e8b:     	jne	0x145919df0 <.text+0x5918df0>
145919e91:     	jmp	0x145919de0 <.text+0x5918de0>
145919e96:     	movq	0x150(%rbp), %rsi
145919e9d:     	movq	0xf0(%rbp), %r12
145919ea4:     	movq	0x140(%rbp), %rax
145919eab:     	movq	%rax, 0x180(%rbp)
145919eb2:     	movq	0x148(%rbp), %rax
145919eb9:     	movq	%rax, 0x190(%rbp)
145919ec0:     	testq	%rsi, %rsi
145919ec3:     	je	0x14591a170 <.text+0x5919170>
145919ec9:     	movq	0x190(%rbp), %r15
145919ed0:     	leaq	(%r15,%rsi,8), %rsi
145919ed4:     	movss	0x480fb3(%rip), %xmm8   # 0x145d9ae90
145919edd:     	xorps	%xmm9, %xmm9
145919ee1:     	movss	0x483f76(%rip), %xmm10  # 0x145d9de60
145919eea:     	xorps	%xmm11, %xmm11
145919eee:     	movss	0x483f6d(%rip), %xmm12  # 0x145d9de64
145919ef7:     	leaq	0x155ef2a(%rip), %rdi   # 0x146e78e28
145919efe:     	leaq	0x118(%rbp), %rbx
145919f05:     	jmp	0x145919f49 <.text+0x5918f49>
145919f07:     	movaps	%xmm13, %xmm0
145919f0b:     	nopl	(%rax,%rax)
145919f10:     	movlps	%xmm6, 0x118(%rbp)
145919f17:     	movss	%xmm0, 0x120(%rbp)
145919f1f:     	movl	$0x10, 0x20(%rsp)
145919f27:     	movq	%r13, %rcx
145919f2a:     	movq	%rdi, %rdx
145919f2d:     	movq	%rbx, %r8
145919f30:     	movl	$0x5, %r9d
145919f36:     	callq	0x145944080 <.text+0x5943080>
145919f3b:     	nop
145919f3c:     	addq	$0x8, %r15
145919f40:     	cmpq	%rsi, %r15
145919f43:     	je	0x14591a170 <.text+0x5919170>
145919f49:     	movsd	(%r15), %xmm6
145919f4e:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
145919f52:     	movq	0x950(%r13), %rcx
145919f59:     	addq	$0x10, %rcx
145919f5d:     	movaps	%xmm6, %xmm1
145919f60:     	movaps	%xmm7, %xmm2
145919f63:     	callq	0x1458c7b60 <.text+0x58c6b60>
145919f68:     	nop
145919f69:     	testb	$0x1, %al
145919f6b:     	je	0x14591a090 <.text+0x5919090>
145919f71:     	cmpb	$0x0, 0xec(%r12)
145919f7a:     	je	0x145919f10 <.text+0x5918f10>
145919f7c:     	movaps	%xmm0, %xmm13
145919f80:     	movq	0x290(%r13), %rcx
145919f87:     	movq	0x298(%r13), %rdx
145919f8e:     	callq	0x1458753b0 <.text+0x58743b0>
145919f93:     	imulq	$0xf0, %rax, %rax
145919f9a:     	leaq	0x128f4af(%rip), %rcx   # 0x146ba9450
145919fa1:     	movsd	0xc8(%rax,%rcx), %xmm7
145919faa:     	subps	%xmm6, %xmm7
145919fad:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
145919fb1:     	movaps	%xmm7, %xmm0
145919fb4:     	callq	0x145bc97f9 <.text+0x5bc87f9>
145919fb9:     	movq	0x950(%r13), %rax
145919fc0:     	cmpq	$-0x1, 0x40(%rax)
145919fc5:     	je	0x145919f07 <.text+0x5918f07>
145919fcb:     	maxss	%xmm8, %xmm0
145919fd0:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
145919fd4:     	divps	%xmm0, %xmm7
145919fd7:     	addps	%xmm6, %xmm7
145919fda:     	movsd	0x60(%rax), %xmm0
145919fdf:     	subps	%xmm0, %xmm7
145919fe2:     	movaps	%xmm7, %xmm0
145919fe5:     	cmpltps	%xmm9, %xmm0
145919fea:     	unpcklps	%xmm0, %xmm0            # xmm0 = xmm0[0,0,1,1]
145919fed:     	movmskpd	%xmm0, %ecx
145919ff1:     	testl	%ecx, %ecx
145919ff3:     	movaps	%xmm13, %xmm0
145919ff7:     	jne	0x145919f10 <.text+0x5918f10>
145919ffd:     	ucomiss	%xmm11, %xmm7
14591a001:     	movl	$0x0, %ecx
14591a006:     	movl	$0x0, %r9d
14591a00c:     	jb	0x14591a0fc <.text+0x59190fc>
14591a012:     	movaps	%xmm7, %xmm1
14591a015:     	subss	%xmm10, %xmm1
14591a01a:     	cvttss2si	%xmm1, %rdx
14591a01f:     	cvttss2si	%xmm7, %r8
14591a024:     	movq	%r8, %r9
14591a027:     	sarq	$0x3f, %r9
14591a02b:     	andq	%rdx, %r9
14591a02e:     	orq	%r8, %r9
14591a031:     	ucomiss	%xmm12, %xmm7
14591a035:     	movq	$-0x1, %r8
14591a03c:     	movq	$-0x1, %rdx
14591a043:     	jbe	0x14591a114 <.text+0x5919114>
14591a049:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
14591a04d:     	ucomiss	%xmm11, %xmm1
14591a051:     	jb	0x14591a125 <.text+0x5919125>
14591a057:     	movaps	%xmm1, %xmm2
14591a05a:     	subss	%xmm10, %xmm2
14591a05f:     	cvttss2si	%xmm2, %r9
14591a064:     	cvttss2si	%xmm1, %r10
14591a069:     	movq	%r10, %rcx
14591a06c:     	sarq	$0x3f, %rcx
14591a070:     	andq	%r9, %rcx
14591a073:     	orq	%r10, %rcx
14591a076:     	ucomiss	%xmm12, %xmm1
14591a07a:     	jbe	0x14591a12b <.text+0x591912b>
14591a080:     	jmp	0x14591a12e <.text+0x591912e>
14591a085:     	nopw	%cs:(%rax,%rax)
14591a090:     	cmpb	$0x0, 0xec(%r12)
14591a099:     	jne	0x145919f3c <.text+0x5918f3c>
14591a09f:     	movq	0x950(%r13), %r14
14591a0a6:     	leaq	0x10(%r14), %rcx
14591a0aa:     	movaps	%xmm6, %xmm1
14591a0ad:     	movaps	%xmm7, %xmm2
14591a0b0:     	callq	0x1458c7b60 <.text+0x58c6b60>
14591a0b5:     	nop
14591a0b6:     	testb	$0x1, %al
14591a0b8:     	jne	0x145919f10 <.text+0x5918f10>
14591a0be:     	cmpq	$-0x1, 0x68(%r14)
14591a0c3:     	je	0x14591a0ee <.text+0x59190ee>
14591a0c5:     	leaq	0x68(%r14), %rdx
14591a0c9:     	movq	%rbx, %rcx
14591a0cc:     	movaps	%xmm6, %xmm2
14591a0cf:     	movaps	%xmm7, %xmm3
14591a0d2:     	callq	0x1458cc950 <.text+0x58cb950>
14591a0d7:     	nop
14591a0d8:     	cmpl	$0x1, 0x118(%rbp)
14591a0df:     	jne	0x14591a0ee <.text+0x59190ee>
14591a0e1:     	movss	0x124(%rbp), %xmm0
14591a0e9:     	jmp	0x145919f10 <.text+0x5918f10>
14591a0ee:     	movss	0xb8(%r14), %xmm0
14591a0f7:     	jmp	0x145919f10 <.text+0x5918f10>
14591a0fc:     	ucomiss	%xmm12, %xmm7
14591a100:     	movq	$-0x1, %r8
14591a107:     	movq	$-0x1, %rdx
14591a10e:     	ja	0x14591a049 <.text+0x5919049>
14591a114:     	movq	%r9, %rdx
14591a117:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
14591a11b:     	ucomiss	%xmm11, %xmm1
14591a11f:     	jae	0x14591a057 <.text+0x5919057>
14591a125:     	ucomiss	%xmm12, %xmm1
14591a129:     	ja	0x14591a12e <.text+0x591912e>
14591a12b:     	movq	%rcx, %r8
14591a12e:     	movq	0x58(%rax), %rcx
14591a132:     	cmpq	%rcx, %rdx
14591a135:     	setae	%r9b
14591a139:     	cmpq	%rcx, %r8
14591a13c:     	setae	%r10b
14591a140:     	orb	%r9b, %r10b
14591a143:     	jne	0x145919f10 <.text+0x5918f10>
14591a149:     	imulq	%r8, %rcx
14591a14d:     	addq	%rdx, %rcx
14591a150:     	movq	0x50(%rax), %rdx
14591a154:     	cmpq	%rdx, %rcx
14591a157:     	jae	0x14591b20b <.text+0x591a20b>
14591a15d:     	movq	0x48(%rax), %rax
14591a161:     	cmpb	$0x0, (%rax,%rcx)
14591a165:     	je	0x145919f10 <.text+0x5918f10>
14591a16b:     	jmp	0x145919f3c <.text+0x5918f3c>

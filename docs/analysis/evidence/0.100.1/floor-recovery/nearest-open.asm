
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145525bb0:     	pushq	%r15
145525bb2:     	pushq	%r14
145525bb4:     	pushq	%r13
145525bb6:     	pushq	%r12
145525bb8:     	pushq	%rsi
145525bb9:     	pushq	%rdi
145525bba:     	pushq	%rbp
145525bbb:     	pushq	%rbx
145525bbc:     	subq	$0x118, %rsp            # imm = 0x118
145525bc3:     	movaps	%xmm15, 0x100(%rsp)
145525bcc:     	movaps	%xmm14, 0xf0(%rsp)
145525bd5:     	movaps	%xmm13, 0xe0(%rsp)
145525bde:     	movaps	%xmm12, 0xd0(%rsp)
145525be7:     	movaps	%xmm11, 0xc0(%rsp)
145525bf0:     	movaps	%xmm10, 0xb0(%rsp)
145525bf9:     	movaps	%xmm9, 0xa0(%rsp)
145525c02:     	movaps	%xmm8, 0x90(%rsp)
145525c0b:     	movaps	%xmm7, 0x80(%rsp)
145525c13:     	movaps	%xmm6, 0x70(%rsp)
145525c18:     	movaps	%xmm3, %xmm6
145525c1b:     	movaps	%xmm2, %xmm7
145525c1e:     	movq	%rdx, %rdi
145525c21:     	movq	%rcx, %r14
145525c24:     	movss	0x180(%rsp), %xmm8
145525c2e:     	movaps	%xmm8, %xmm0
145525c32:     	callq	0x14577327d <.text+0x577227d>
145525c37:     	cvttss2si	%xmm0, %eax
145525c3b:     	ucomiss	0x4bf59e(%rip), %xmm0   # 0x1459e51e0
145525c42:     	movl	$0x7fffffff, %r8d       # imm = 0x7FFFFFFF
145525c48:     	cmovbel	%eax, %r8d
145525c4c:     	xorl	%eax, %eax
145525c4e:     	ucomiss	%xmm0, %xmm0
145525c51:     	cmovpl	%eax, %r8d
145525c55:     	movl	%r8d, %esi
145525c58:     	negl	%esi
145525c5a:     	cmpl	%esi, %r8d
145525c5d:     	jl	0x145526435 <.text+0x5525435>
145525c63:     	movsd	0x20(%rdi), %xmm0
145525c68:     	movq	0x18(%rdi), %r11
145525c6c:     	testq	%r11, %r11
145525c6f:     	je	0x1455263b7 <.text+0x55253b7>
145525c75:     	movq	%r14, 0x68(%rsp)
145525c7a:     	mulss	%xmm8, %xmm8
145525c7f:     	movq	0x8(%rdi), %rax
145525c83:     	movq	%rax, 0x30(%rsp)
145525c88:     	movq	0x10(%rdi), %rax
145525c8c:     	movq	%rax, 0x28(%rsp)
145525c91:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
145525c95:     	movaps	%xmm7, %xmm2
145525c98:     	unpcklps	%xmm6, %xmm2            # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1]
145525c9b:     	movss	0x3e153d(%rip), %xmm3   # 0x1459071e0
145525ca3:     	xorps	%xmm4, %xmm4
145525ca6:     	movss	0x3e1536(%rip), %xmm5   # 0x1459071e4
145525cae:     	movq	$-0x1, %r14
145525cb5:     	movaps	0x428943(%rip), %xmm9   # 0x14594e600
145525cbd:     	movss	0x3e1846(%rip), %xmm15  # 0x14590750c
145525cc6:     	xorl	%edi, %edi
145525cc8:     	movl	%esi, %ebp
145525cca:     	movaps	%xmm1, 0x40(%rsp)
145525ccf:     	nop
145525cd0:     	xorl	%r13d, %r13d
145525cd3:     	cmpl	%r8d, %ebp
145525cd6:     	xorps	%xmm10, %xmm10
145525cda:     	cvtsi2ss	%ebp, %xmm10
145525cdf:     	addss	%xmm6, %xmm10
145525ce4:     	subss	%xmm1, %xmm10
145525ce9:     	cvttss2si	%xmm10, %rax
145525cee:     	setl	%r15b
145525cf2:     	movq	%rax, %rcx
145525cf5:     	sarq	$0x3f, %rcx
145525cf9:     	movaps	%xmm10, %xmm11
145525cfd:     	subss	%xmm3, %xmm11
145525d02:     	cvttss2si	%xmm11, %rdx
145525d07:     	andq	%rcx, %rdx
145525d0a:     	orq	%rax, %rdx
145525d0d:     	ucomiss	%xmm4, %xmm10
145525d11:     	movl	$0x0, %ebx
145525d16:     	cmovaeq	%rdx, %rbx
145525d1a:     	ucomiss	%xmm5, %xmm10
145525d1e:     	cmovaq	%r14, %rbx
145525d22:     	ucomiss	%xmm10, %xmm4
145525d26:     	movl	%esi, %eax
145525d28:     	jbe	0x145525d50 <.text+0x5524d50>
145525d2a:     	nopw	(%rax,%rax)
145525d30:     	xorl	%ecx, %ecx
145525d32:     	cmpl	%r8d, %eax
145525d35:     	setl	%dl
145525d38:     	jge	0x145526380 <.text+0x5525380>
145525d3e:     	movb	%dl, %cl
145525d40:     	addl	%ecx, %eax
145525d42:     	cmpl	%r8d, %eax
145525d45:     	jle	0x145525d30 <.text+0x5524d30>
145525d47:     	jmp	0x145526380 <.text+0x5525380>
145525d4c:     	nopl	(%rax)
145525d50:     	movl	%esi, %eax
145525d52:     	cmpq	%r11, %rbx
145525d55:     	jae	0x145526360 <.text+0x5525360>
145525d5b:     	imulq	%r11, %rbx
145525d5f:     	movl	%esi, %r9d
145525d62:     	movl	%r9d, %r10d
145525d65:     	nopw	%cs:(%rax,%rax)
145525d70:     	xorl	%r9d, %r9d
145525d73:     	cmpl	%r8d, %r10d
145525d76:     	setl	%r9b
145525d7a:     	addl	%r10d, %r9d
145525d7d:     	xorps	%xmm10, %xmm10
145525d81:     	cvtsi2ss	%r10d, %xmm10
145525d86:     	addss	%xmm7, %xmm10
145525d8b:     	subss	%xmm0, %xmm10
145525d90:     	ucomiss	%xmm10, %xmm4
145525d94:     	ja	0x145525e80 <.text+0x5524e80>
145525d9a:     	cvttss2si	%xmm10, %rax
145525d9f:     	movq	%rax, %rcx
145525da2:     	sarq	$0x3f, %rcx
145525da6:     	movaps	%xmm10, %xmm11
145525daa:     	subss	%xmm3, %xmm11
145525daf:     	cvttss2si	%xmm11, %rdx
145525db4:     	andq	%rcx, %rdx
145525db7:     	orq	%rax, %rdx
145525dba:     	ucomiss	%xmm4, %xmm10
145525dbe:     	movl	$0x0, %eax
145525dc3:     	cmovaeq	%rdx, %rax
145525dc7:     	ucomiss	%xmm5, %xmm10
145525dcb:     	cmovaq	%r14, %rax
145525dcf:     	cmpq	%r11, %rax
145525dd2:     	jae	0x145525e80 <.text+0x5524e80>
145525dd8:     	addq	%rbx, %rax
145525ddb:     	movq	%rax, %rcx
145525dde:     	orq	%r11, %rcx
145525de1:     	shrq	$0x20, %rcx
145525de5:     	je	0x145525e1b <.text+0x5524e1b>
145525de7:     	xorl	%edx, %edx
145525de9:     	divq	%r11
145525dec:     	testq	%rax, %rax
145525def:     	js	0x145525e25 <.text+0x5524e25>
145525df1:     	xorps	%xmm10, %xmm10
145525df5:     	cvtsi2ss	%rax, %xmm10
145525dfa:     	testq	%rdx, %rdx
145525dfd:     	jns	0x145525e44 <.text+0x5524e44>
145525dff:     	movq	%rdx, %rax
145525e02:     	shrq	%rax
145525e05:     	andl	$0x1, %edx
145525e08:     	orq	%rax, %rdx
145525e0b:     	xorps	%xmm13, %xmm13
145525e0f:     	cvtsi2ss	%rdx, %xmm13
145525e14:     	addss	%xmm13, %xmm13
145525e19:     	jmp	0x145525e4d <.text+0x5524e4d>
145525e1b:     	xorl	%edx, %edx
145525e1d:     	divl	%r11d
145525e20:     	testq	%rax, %rax
145525e23:     	jns	0x145525df1 <.text+0x5524df1>
145525e25:     	movq	%rax, %rcx
145525e28:     	shrq	%rcx
145525e2b:     	andl	$0x1, %eax
145525e2e:     	orq	%rcx, %rax
145525e31:     	xorps	%xmm10, %xmm10
145525e35:     	cvtsi2ss	%rax, %xmm10
145525e3a:     	addss	%xmm10, %xmm10
145525e3f:     	testq	%rdx, %rdx
145525e42:     	js	0x145525dff <.text+0x5524dff>
145525e44:     	xorps	%xmm13, %xmm13
145525e48:     	cvtsi2ss	%rdx, %xmm13
145525e4d:     	unpcklps	%xmm10, %xmm13          # xmm13 = xmm13[0],xmm10[0],xmm13[1],xmm10[1]
145525e51:     	addps	%xmm9, %xmm13
145525e55:     	addps	%xmm0, %xmm13
145525e59:     	movaps	%xmm13, %xmm10
145525e5d:     	subps	%xmm2, %xmm10
145525e61:     	mulps	%xmm10, %xmm10
145525e65:     	movshdup	%xmm10, %xmm14          # xmm14 = xmm10[1,1,3,3]
145525e6a:     	addps	%xmm10, %xmm14
145525e6e:     	ucomiss	%xmm12, %xmm14
145525e72:     	setae	%al
145525e75:     	ucomiss	%xmm8, %xmm14
145525e79:     	ja	0x145525e80 <.text+0x5524e80>
145525e7b:     	andb	%dil, %al
145525e7e:     	je	0x145525ea0 <.text+0x5524ea0>
145525e80:     	cmpl	%r8d, %r10d
145525e83:     	jge	0x145526380 <.text+0x5525380>
145525e89:     	movl	%r9d, %r10d
145525e8c:     	cmpl	%r8d, %r9d
145525e8f:     	jle	0x145525d70 <.text+0x5524d70>
145525e95:     	jmp	0x145526380 <.text+0x5525380>
145525e9a:     	nopw	(%rax,%rax)
145525ea0:     	movl	%edi, 0x24(%rsp)
145525ea4:     	movaps	%xmm13, %xmm10
145525ea8:     	addss	%xmm15, %xmm10
145525ead:     	subss	%xmm0, %xmm10
145525eb2:     	ucomiss	%xmm10, %xmm4
145525eb6:     	setbe	0x23(%rsp)
145525ebb:     	cvttss2si	%xmm10, %rdx
145525ec0:     	movq	%rdx, %rdi
145525ec3:     	sarq	$0x3f, %rdi
145525ec7:     	movaps	%xmm10, %xmm11
145525ecb:     	subss	%xmm3, %xmm11
145525ed0:     	cvttss2si	%xmm11, %rcx
145525ed5:     	andq	%rdi, %rcx
145525ed8:     	orq	%rdx, %rcx
145525edb:     	ucomiss	%xmm4, %xmm10
145525edf:     	movl	$0x0, %edx
145525ee4:     	cmovbq	%rdx, %rcx
145525ee8:     	ucomiss	%xmm5, %xmm10
145525eec:     	cmovaq	%r14, %rcx
145525ef0:     	movaps	%xmm13, %xmm11
145525ef4:     	addss	0x3e1593(%rip), %xmm11  # 0x145907490
145525efd:     	movaps	%xmm13, %xmm10
145525f01:     	subss	%xmm0, %xmm10
145525f06:     	cvttss2si	%xmm10, %rdi
145525f0b:     	movq	%rdi, %r12
145525f0e:     	sarq	$0x3f, %r12
145525f12:     	movaps	%xmm15, %xmm1
145525f16:     	movaps	%xmm10, %xmm15
145525f1a:     	subss	%xmm3, %xmm15
145525f1f:     	cvttss2si	%xmm15, %rax
145525f24:     	andq	%r12, %rax
145525f27:     	orq	%rdi, %rax
145525f2a:     	ucomiss	%xmm4, %xmm10
145525f2e:     	cmovbq	%rdx, %rax
145525f32:     	ucomiss	%xmm5, %xmm10
145525f36:     	cmovaq	%r14, %rax
145525f3a:     	movq	%rax, 0x38(%rsp)
145525f3f:     	subss	%xmm0, %xmm11
145525f44:     	cvttss2si	%xmm11, %rax
145525f49:     	movq	%rax, %r12
145525f4c:     	sarq	$0x3f, %r12
145525f50:     	movaps	%xmm11, %xmm15
145525f54:     	subss	%xmm3, %xmm15
145525f59:     	cvttss2si	%xmm15, %rdi
145525f5e:     	andq	%r12, %rdi
145525f61:     	orq	%rax, %rdi
145525f64:     	ucomiss	%xmm4, %xmm11
145525f68:     	cmovbq	%rdx, %rdi
145525f6c:     	ucomiss	%xmm5, %xmm11
145525f70:     	cmovaq	%r14, %rdi
145525f74:     	cmpq	%r11, %rcx
145525f77:     	setb	%al
145525f7a:     	testb	%al, 0x23(%rsp)
145525f7e:     	je	0x14552601f <.text+0x552501f>
145525f84:     	movshdup	%xmm13, %xmm9           # xmm9 = xmm13[1,1,3,3]
145525f89:     	movaps	%xmm9, 0x50(%rsp)
145525f8f:     	addss	%xmm1, %xmm9
145525f94:     	movaps	0x40(%rsp), %xmm1
145525f99:     	subss	%xmm1, %xmm9
145525f9e:     	ucomiss	%xmm9, %xmm4
145525fa2:     	setbe	0x23(%rsp)
145525fa7:     	cvttss2si	%xmm9, %rax
145525fac:     	movq	%rax, %r12
145525faf:     	sarq	$0x3f, %r12
145525fb3:     	movaps	%xmm9, %xmm15
145525fb7:     	subss	%xmm3, %xmm15
145525fbc:     	cvttss2si	%xmm15, %rdx
145525fc1:     	andq	%r12, %rdx
145525fc4:     	orq	%rax, %rdx
145525fc7:     	ucomiss	%xmm4, %xmm9
145525fcb:     	movl	$0x0, %eax
145525fd0:     	cmovaeq	%rdx, %rax
145525fd4:     	ucomiss	%xmm5, %xmm9
145525fd8:     	cmovaq	%r14, %rax
145525fdc:     	cmpq	%r11, %rax
145525fdf:     	setb	%r12b
145525fe3:     	andb	0x23(%rsp), %r12b
145525fe8:     	ucomiss	%xmm10, %xmm4
145525fec:     	jbe	0x145526043 <.text+0x5525043>
145525fee:     	testb	%r12b, %r12b
145525ff1:     	je	0x145526252 <.text+0x5525252>
145525ff7:     	imulq	%r11, %rax
145525ffb:     	addq	%rcx, %rax
145525ffe:     	cmpq	0x28(%rsp), %rax
145526003:     	movaps	0x4285f5(%rip), %xmm9   # 0x14594e600
14552600b:     	movss	0x3e14f8(%rip), %xmm15  # 0x14590750c
145526014:     	movl	0x24(%rsp), %edi
145526018:     	jb	0x14552602c <.text+0x552502c>
14552601a:     	jmp	0x1455264ac <.text+0x55254ac>
14552601f:     	movaps	%xmm1, %xmm15
145526023:     	movaps	0x40(%rsp), %xmm1
145526028:     	movl	0x24(%rsp), %edi
14552602c:     	cmpl	%r8d, %r10d
14552602f:     	jge	0x145526380 <.text+0x5525380>
145526035:     	cmpl	%r8d, %r9d
145526038:     	jle	0x145525d62 <.text+0x5524d62>
14552603e:     	jmp	0x145526380 <.text+0x5525380>
145526043:     	cmpq	%r11, 0x38(%rsp)
145526048:     	jae	0x145526268 <.text+0x5525268>
14552604e:     	ucomiss	%xmm11, %xmm4
145526052:     	movaps	0x4285a6(%rip), %xmm9   # 0x14594e600
14552605a:     	movss	0x3e14a9(%rip), %xmm15  # 0x14590750c
145526063:     	ja	0x14552629d <.text+0x552529d>
145526069:     	cmpq	%r11, %rdi
14552606c:     	jae	0x14552629d <.text+0x552529d>
145526072:     	testb	%r12b, %r12b
145526075:     	je	0x145526028 <.text+0x5525028>
145526077:     	imulq	%r11, %rax
14552607b:     	leaq	(%rax,%rcx), %r12
14552607f:     	cmpq	0x28(%rsp), %r12
145526084:     	jae	0x1455264a9 <.text+0x55254a9>
14552608a:     	movq	0x30(%rsp), %rdx
14552608f:     	cmpb	$0x0, (%rdx,%r12)
145526094:     	jne	0x145526028 <.text+0x5525028>
145526096:     	movq	0x38(%rsp), %rdx
14552609b:     	leaq	(%rax,%rdx), %r12
14552609f:     	cmpq	0x28(%rsp), %r12
1455260a4:     	jae	0x1455264a9 <.text+0x55254a9>
1455260aa:     	movq	0x30(%rsp), %rdx
1455260af:     	cmpb	$0x0, (%rdx,%r12)
1455260b4:     	jne	0x145526028 <.text+0x5525028>
1455260ba:     	addq	%rdi, %rax
1455260bd:     	cmpq	0x28(%rsp), %rax
1455260c2:     	jae	0x1455264ac <.text+0x55254ac>
1455260c8:     	movq	0x30(%rsp), %rdx
1455260cd:     	cmpb	$0x0, (%rdx,%rax)
1455260d1:     	jne	0x145526028 <.text+0x5525028>
1455260d7:     	movaps	0x50(%rsp), %xmm9
1455260dd:     	subss	%xmm1, %xmm9
1455260e2:     	ucomiss	%xmm9, %xmm4
1455260e6:     	seta	0x23(%rsp)
1455260eb:     	cvttss2si	%xmm9, %rdx
1455260f0:     	movq	%rdx, %r12
1455260f3:     	sarq	$0x3f, %r12
1455260f7:     	movaps	%xmm9, %xmm10
1455260fb:     	subss	%xmm3, %xmm10
145526100:     	cvttss2si	%xmm10, %rax
145526105:     	andq	%r12, %rax
145526108:     	orq	%rdx, %rax
14552610b:     	ucomiss	%xmm4, %xmm9
14552610f:     	movl	$0x0, %r12d
145526115:     	cmovaeq	%rax, %r12
145526119:     	ucomiss	%xmm5, %xmm9
14552611d:     	cmovaq	%r14, %r12
145526121:     	cmpq	%r11, %r12
145526124:     	setae	%al
145526127:     	orb	0x23(%rsp), %al
14552612b:     	jne	0x1455262e0 <.text+0x55252e0>
145526131:     	imulq	%r11, %r12
145526135:     	leaq	(%r12,%rcx), %rax
145526139:     	cmpq	0x28(%rsp), %rax
14552613e:     	jae	0x1455264ac <.text+0x55254ac>
145526144:     	movq	0x30(%rsp), %rdx
145526149:     	cmpb	$0x0, (%rdx,%rax)
14552614d:     	movaps	0x4284ab(%rip), %xmm9   # 0x14594e600
145526155:     	jne	0x145526028 <.text+0x5525028>
14552615b:     	movq	0x38(%rsp), %rax
145526160:     	addq	%r12, %rax
145526163:     	cmpq	0x28(%rsp), %rax
145526168:     	jae	0x1455264ac <.text+0x55254ac>
14552616e:     	movq	0x30(%rsp), %rdx
145526173:     	cmpb	$0x0, (%rdx,%rax)
145526177:     	jne	0x145526028 <.text+0x5525028>
14552617d:     	addq	%rdi, %r12
145526180:     	cmpq	0x28(%rsp), %r12
145526185:     	jae	0x1455264a9 <.text+0x55254a9>
14552618b:     	movq	0x30(%rsp), %rax
145526190:     	cmpb	$0x0, (%rax,%r12)
145526195:     	jne	0x145526028 <.text+0x5525028>
14552619b:     	movaps	0x50(%rsp), %xmm9
1455261a1:     	addss	0x3e12e6(%rip), %xmm9   # 0x145907490
1455261aa:     	subss	%xmm1, %xmm9
1455261af:     	ucomiss	%xmm9, %xmm4
1455261b3:     	setbe	0x23(%rsp)
1455261b8:     	cvttss2si	%xmm9, %rdx
1455261bd:     	movq	%rdx, %r12
1455261c0:     	sarq	$0x3f, %r12
1455261c4:     	movaps	%xmm9, %xmm10
1455261c8:     	subss	%xmm3, %xmm10
1455261cd:     	cvttss2si	%xmm10, %rax
1455261d2:     	andq	%r12, %rax
1455261d5:     	orq	%rdx, %rax
1455261d8:     	ucomiss	%xmm4, %xmm9
1455261dc:     	movl	$0x0, %r12d
1455261e2:     	cmovaeq	%rax, %r12
1455261e6:     	ucomiss	%xmm5, %xmm9
1455261ea:     	cmovaq	%r14, %r12
1455261ee:     	cmpq	%r11, %r12
1455261f1:     	setb	%al
1455261f4:     	testb	%al, 0x23(%rsp)
1455261f8:     	je	0x14552623c <.text+0x552523c>
1455261fa:     	imulq	%r11, %r12
1455261fe:     	addq	%r12, %rcx
145526201:     	cmpq	0x28(%rsp), %rcx
145526206:     	jae	0x1455264c2 <.text+0x55254c2>
14552620c:     	movq	0x30(%rsp), %rax
145526211:     	cmpb	$0x0, (%rax,%rcx)
145526215:     	jne	0x14552623c <.text+0x552523c>
145526217:     	movq	0x38(%rsp), %rax
14552621c:     	addq	%r12, %rax
14552621f:     	movq	%rax, %rcx
145526222:     	cmpq	0x28(%rsp), %rax
145526227:     	jae	0x1455264c2 <.text+0x55254c2>
14552622d:     	movq	0x30(%rsp), %rax
145526232:     	cmpb	$0x0, (%rax,%rcx)
145526236:     	je	0x1455262ed <.text+0x55252ed>
14552623c:     	movaps	0x4283bc(%rip), %xmm9   # 0x14594e600
145526244:     	movss	0x3e12bf(%rip), %xmm15  # 0x14590750c
14552624d:     	jmp	0x145526023 <.text+0x5525023>
145526252:     	movaps	0x4283a6(%rip), %xmm9   # 0x14594e600
14552625a:     	movss	0x3e12a9(%rip), %xmm15  # 0x14590750c
145526263:     	jmp	0x145526028 <.text+0x5525028>
145526268:     	testb	%r12b, %r12b
14552626b:     	movaps	0x42838d(%rip), %xmm9   # 0x14594e600
145526273:     	movss	0x3e1290(%rip), %xmm15  # 0x14590750c
14552627c:     	je	0x145526028 <.text+0x5525028>
145526282:     	imulq	%r11, %rax
145526286:     	addq	%rcx, %rax
145526289:     	cmpq	0x28(%rsp), %rax
14552628e:     	movl	0x24(%rsp), %edi
145526292:     	jb	0x14552602c <.text+0x552502c>
145526298:     	jmp	0x1455264ac <.text+0x55254ac>
14552629d:     	testb	%r12b, %r12b
1455262a0:     	je	0x145526028 <.text+0x5525028>
1455262a6:     	imulq	%r11, %rax
1455262aa:     	addq	%rax, %rcx
1455262ad:     	cmpq	0x28(%rsp), %rcx
1455262b2:     	movl	0x24(%rsp), %edi
1455262b6:     	jae	0x1455264a4 <.text+0x55254a4>
1455262bc:     	movq	0x30(%rsp), %rdx
1455262c1:     	cmpb	$0x0, (%rdx,%rcx)
1455262c5:     	jne	0x14552602c <.text+0x552502c>
1455262cb:     	addq	0x38(%rsp), %rax
1455262d0:     	cmpq	0x28(%rsp), %rax
1455262d5:     	jb	0x14552602c <.text+0x552502c>
1455262db:     	jmp	0x1455264ac <.text+0x55254ac>
1455262e0:     	movaps	0x428318(%rip), %xmm9   # 0x14594e600
1455262e8:     	jmp	0x145526028 <.text+0x5525028>
1455262ed:     	addq	%rdi, %r12
1455262f0:     	cmpq	0x28(%rsp), %r12
1455262f5:     	jae	0x1455264d5 <.text+0x55254d5>
1455262fb:     	movq	0x30(%rsp), %rax
145526300:     	cmpb	$0x0, (%rax,%r12)
145526305:     	movaps	0x4282f3(%rip), %xmm9   # 0x14594e600
14552630d:     	movss	0x3e11f6(%rip), %xmm15  # 0x14590750c
145526316:     	movaps	0x40(%rsp), %xmm1
14552631b:     	movl	0x24(%rsp), %edi
14552631f:     	jne	0x14552602c <.text+0x552502c>
145526325:     	movd	%xmm13, %eax
14552632a:     	movdqa	0x50(%rsp), %xmm10
145526331:     	movd	%xmm10, %ecx
145526336:     	shlq	$0x20, %rcx
14552633a:     	movl	%eax, %eax
14552633c:     	orq	%rcx, %rax
14552633f:     	movq	%rax, 0x60(%rsp)
145526344:     	movl	$0x1, %edi
145526349:     	movaps	%xmm14, %xmm12
14552634d:     	jmp	0x14552602c <.text+0x552502c>
145526352:     	nopw	%cs:(%rax,%rax)
145526360:     	xorl	%ecx, %ecx
145526362:     	cmpl	%r8d, %eax
145526365:     	setl	%dl
145526368:     	jge	0x145526380 <.text+0x5525380>
14552636a:     	movb	%dl, %cl
14552636c:     	addl	%ecx, %eax
14552636e:     	cmpl	%r8d, %eax
145526371:     	jle	0x145526360 <.text+0x5525360>
145526373:     	nopw	%cs:(%rax,%rax)
145526380:     	cmpl	%r8d, %ebp
145526383:     	jge	0x145526394 <.text+0x5525394>
145526385:     	movb	%r15b, %r13b
145526388:     	addl	%r13d, %ebp
14552638b:     	cmpl	%r8d, %ebp
14552638e:     	jle	0x145525cd0 <.text+0x5524cd0>
145526394:     	xorl	%eax, %eax
145526396:     	cmpl	$0x1, %edi
145526399:     	movq	0x68(%rsp), %r14
14552639e:     	jne	0x145526435 <.text+0x5525435>
1455263a4:     	movq	0x60(%rsp), %rax
1455263a9:     	movq	%rax, 0x4(%r14)
1455263ad:     	movl	$0x1, %eax
1455263b2:     	jmp	0x145526435 <.text+0x5525435>
1455263b7:     	movshdup	%xmm0, %xmm0            # xmm0 = xmm0[1,1,3,3]
1455263bb:     	xorps	%xmm1, %xmm1
1455263be:     	movl	%esi, %ecx
1455263c0:     	xorl	%edx, %edx
1455263c2:     	xorps	%xmm2, %xmm2
1455263c5:     	cvtsi2ss	%ecx, %xmm2
1455263c9:     	cmpl	%r8d, %ecx
1455263cc:     	setl	%r9b
1455263d0:     	addss	%xmm6, %xmm2
1455263d4:     	subss	%xmm0, %xmm2
1455263d8:     	ucomiss	%xmm2, %xmm1
1455263db:     	movl	%esi, %r10d
1455263de:     	movl	%esi, %r11d
1455263e1:     	jbe	0x145526410 <.text+0x5525410>
1455263e3:     	nopw	%cs:(%rax,%rax)
1455263f0:     	xorl	%r11d, %r11d
1455263f3:     	cmpl	%r8d, %r10d
1455263f6:     	setl	%bl
1455263f9:     	jge	0x145526426 <.text+0x5525426>
1455263fb:     	movb	%bl, %r11b
1455263fe:     	addl	%r11d, %r10d
145526401:     	cmpl	%r8d, %r10d
145526404:     	jle	0x1455263f0 <.text+0x55253f0>
145526406:     	jmp	0x145526426 <.text+0x5525426>
145526408:     	nopl	(%rax,%rax)
145526410:     	xorl	%r10d, %r10d
145526413:     	cmpl	%r8d, %r11d
145526416:     	setl	%bl
145526419:     	jge	0x145526426 <.text+0x5525426>
14552641b:     	movb	%bl, %r10b
14552641e:     	addl	%r10d, %r11d
145526421:     	cmpl	%r8d, %r11d
145526424:     	jle	0x145526410 <.text+0x5525410>
145526426:     	cmpl	%r8d, %ecx
145526429:     	jge	0x145526435 <.text+0x5525435>
14552642b:     	movb	%r9b, %dl
14552642e:     	addl	%edx, %ecx
145526430:     	cmpl	%r8d, %ecx
145526433:     	jle	0x1455263c0 <.text+0x55253c0>
145526435:     	movl	%eax, (%r14)
145526438:     	movq	%r14, %rax
14552643b:     	movaps	0x70(%rsp), %xmm6
145526440:     	movaps	0x80(%rsp), %xmm7
145526448:     	movaps	0x90(%rsp), %xmm8
145526451:     	movaps	0xa0(%rsp), %xmm9
14552645a:     	movaps	0xb0(%rsp), %xmm10
145526463:     	movaps	0xc0(%rsp), %xmm11
14552646c:     	movaps	0xd0(%rsp), %xmm12
145526475:     	movaps	0xe0(%rsp), %xmm13
14552647e:     	movaps	0xf0(%rsp), %xmm14
145526487:     	movaps	0x100(%rsp), %xmm15
145526490:     	addq	$0x118, %rsp            # imm = 0x118
145526497:     	popq	%rbx
145526498:     	popq	%rbp
145526499:     	popq	%rdi
14552649a:     	popq	%rsi
14552649b:     	popq	%r12
14552649d:     	popq	%r13
14552649f:     	popq	%r14
1455264a1:     	popq	%r15
1455264a3:     	retq
1455264a4:     	movq	%rcx, %rax
1455264a7:     	jmp	0x1455264ac <.text+0x55254ac>
1455264a9:     	movq	%r12, %rax
1455264ac:     	leaq	0x180e645(%rip), %r8    # 0x146d34af8
1455264b3:     	movq	%rax, %rcx
1455264b6:     	movq	0x28(%rsp), %rdx
1455264bb:     	callq	0x145903b33 <.text+0x5902b33>
1455264c0:     	ud2
1455264c2:     	leaq	0x180e62f(%rip), %r8    # 0x146d34af8
1455264c9:     	movq	0x28(%rsp), %rdx
1455264ce:     	callq	0x145903b33 <.text+0x5902b33>
1455264d3:     	ud2
1455264d5:     	leaq	0x180e61c(%rip), %r8    # 0x146d34af8
1455264dc:     	movq	%r12, %rcx
1455264df:     	movq	0x28(%rsp), %rdx
1455264e4:     	callq	0x145903b33 <.text+0x5902b33>
1455264e9:     	ud2

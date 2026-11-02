
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145501bc0:     	pushq	%r15
145501bc2:     	pushq	%r14
145501bc4:     	pushq	%r13
145501bc6:     	pushq	%r12
145501bc8:     	pushq	%rsi
145501bc9:     	pushq	%rdi
145501bca:     	pushq	%rbp
145501bcb:     	pushq	%rbx
145501bcc:     	subq	$0x1e8, %rsp            # imm = 0x1E8
145501bd3:     	movaps	%xmm7, 0x1d0(%rsp)
145501bdb:     	movaps	%xmm6, 0x1c0(%rsp)
145501be3:     	movq	%rdx, %r15
145501be6:     	movq	%rcx, %rsi
145501be9:     	leaq	0xd0(%rsp), %rbx
145501bf1:     	xorps	%xmm0, %xmm0
145501bf4:     	movups	%xmm0, 0x100(%rsp)
145501bfc:     	movups	%xmm0, 0xf0(%rsp)
145501c04:     	movups	%xmm0, 0xe0(%rsp)
145501c0c:     	movups	%xmm0, 0xd0(%rsp)
145501c14:     	movb	$0x0, 0x110(%rsp)
145501c1c:     	leaq	0xb8(%rsp), %r14
145501c24:     	movaps	0xca09f5(%rip), %xmm6   # 0x1461a2620
145501c2b:     	movups	%xmm6, 0xb8(%rsp)
145501c33:     	movl	$0xc3d2e1f0, 0xc8(%rsp) # imm = 0xC3D2E1F0
145501c3e:     	movaps	0x14ab59b(%rip), %xmm0  # 0x1469ad1e0
145501c45:     	movaps	%xmm0, 0x40(%rsp)
145501c4a:     	movaps	0x14ab59f(%rip), %xmm0  # 0x1469ad1f0
145501c51:     	movaps	%xmm0, 0x50(%rsp)
145501c56:     	movaps	0x14ab5a3(%rip), %xmm0  # 0x1469ad200
145501c5d:     	movaps	%xmm0, 0x60(%rsp)
145501c62:     	movaps	0x4943e7(%rip), %xmm0   # 0x145996050
145501c69:     	movaps	%xmm0, 0x70(%rsp)
145501c6e:     	movq	$0x1, 0xb0(%rsp)
145501c7a:     	leaq	0x40(%rsp), %rdx
145501c7f:     	movl	$0x1, %r8d
145501c85:     	movq	%r14, %rcx
145501c88:     	callq	0x1455aff30 <.text+0x55aef30>
145501c8d:     	movb	$0x0, 0x110(%rsp)
145501c95:     	movq	(%r15), %rdx
145501c98:     	movq	0x8(%r15), %r13
145501c9c:     	movabsq	$0x7fffffffffffffc0, %rdi # imm = 0x7FFFFFFFFFFFFFC0
145501ca6:     	cmpq	$0x40, %r13
145501caa:     	jae	0x145501cb9 <.text+0x5500cb9>
145501cac:     	movq	%rbx, %rcx
145501caf:     	movq	%r13, %r8
145501cb2:     	callq	0x145756ddd <.text+0x5755ddd>
145501cb7:     	jmp	0x145501cf0 <.text+0x5500cf0>
145501cb9:     	movq	%r13, %r12
145501cbc:     	andq	%rdi, %r12
145501cbf:     	movl	%r13d, %ebp
145501cc2:     	andl	$0x3f, %ebp
145501cc5:     	addq	%rdx, %r12
145501cc8:     	shrq	$0x6, %r13
145501ccc:     	addq	%r13, 0xb0(%rsp)
145501cd4:     	movq	%r14, %rcx
145501cd7:     	movq	%r13, %r8
145501cda:     	callq	0x1455aff30 <.text+0x55aef30>
145501cdf:     	movq	%rbx, %rcx
145501ce2:     	movq	%r12, %rdx
145501ce5:     	movq	%rbp, %r8
145501ce8:     	callq	0x145756ddd <.text+0x5755ddd>
145501ced:     	movq	%rbp, %r13
145501cf0:     	movb	%r13b, 0x110(%rsp)
145501cf8:     	movq	0x10(%r15), %rdx
145501cfc:     	movq	0x18(%r15), %rbp
145501d00:     	movl	$0x40, %r8d
145501d06:     	subq	%r13, %r8
145501d09:     	movq	%rbp, %r12
145501d0c:     	subq	%r8, %r12
145501d0f:     	jae	0x145501d25 <.text+0x5500d25>
145501d11:     	leaq	(%rbx,%r13), %rcx
145501d15:     	movq	%rbp, %r8
145501d18:     	callq	0x145756ddd <.text+0x5755ddd>
145501d1d:     	addq	%r13, %rbp
145501d20:     	movq	%rbp, %r12
145501d23:     	jmp	0x145501d91 <.text+0x5500d91>
145501d25:     	testq	%r13, %r13
145501d28:     	je	0x145501d57 <.text+0x5500d57>
145501d2a:     	leaq	(%rdx,%r8), %rbp
145501d2e:     	addq	%rbx, %r13
145501d31:     	movq	%r13, %rcx
145501d34:     	callq	0x145756ddd <.text+0x5755ddd>
145501d39:     	incq	0xb0(%rsp)
145501d41:     	movl	$0x1, %r8d
145501d47:     	movq	%r14, %rcx
145501d4a:     	movq	%rbx, %rdx
145501d4d:     	callq	0x1455aff30 <.text+0x55aef30>
145501d52:     	movq	%rbp, %rdx
145501d55:     	jmp	0x145501d5a <.text+0x5500d5a>
145501d57:     	movq	%rbp, %r12
145501d5a:     	movq	%r12, %r8
145501d5d:     	shrq	$0x6, %r8
145501d61:     	movq	%r12, %r13
145501d64:     	andq	%rdi, %r13
145501d67:     	andl	$0x3f, %r12d
145501d6b:     	addq	%rdx, %r13
145501d6e:     	testq	%r8, %r8
145501d71:     	je	0x145501d83 <.text+0x5500d83>
145501d73:     	addq	%r8, 0xb0(%rsp)
145501d7b:     	movq	%r14, %rcx
145501d7e:     	callq	0x1455aff30 <.text+0x55aef30>
145501d83:     	movq	%rbx, %rcx
145501d86:     	movq	%r13, %rdx
145501d89:     	movq	%r12, %r8
145501d8c:     	callq	0x145756ddd <.text+0x5755ddd>
145501d91:     	movb	%r12b, 0x110(%rsp)
145501d99:     	movq	0x20(%r15), %rdx
145501d9d:     	movq	0x28(%r15), %r13
145501da1:     	movl	$0x40, %r8d
145501da7:     	subq	%r12, %r8
145501daa:     	movq	%r13, %r15
145501dad:     	subq	%r8, %r15
145501db0:     	jae	0x145501dc8 <.text+0x5500dc8>
145501db2:     	addq	%r12, %rbx
145501db5:     	movq	%rbx, %rcx
145501db8:     	movq	%r13, %r8
145501dbb:     	callq	0x145756ddd <.text+0x5755ddd>
145501dc0:     	addq	%r12, %r13
145501dc3:     	movq	%r13, %r15
145501dc6:     	jmp	0x145501e34 <.text+0x5500e34>
145501dc8:     	testq	%r12, %r12
145501dcb:     	je	0x145501dfa <.text+0x5500dfa>
145501dcd:     	leaq	(%rdx,%r8), %r13
145501dd1:     	addq	%rbx, %r12
145501dd4:     	movq	%r12, %rcx
145501dd7:     	callq	0x145756ddd <.text+0x5755ddd>
145501ddc:     	incq	0xb0(%rsp)
145501de4:     	movl	$0x1, %r8d
145501dea:     	movq	%r14, %rcx
145501ded:     	movq	%rbx, %rdx
145501df0:     	callq	0x1455aff30 <.text+0x55aef30>
145501df5:     	movq	%r13, %rdx
145501df8:     	jmp	0x145501dfd <.text+0x5500dfd>
145501dfa:     	movq	%r13, %r15
145501dfd:     	movq	%r15, %r8
145501e00:     	shrq	$0x6, %r8
145501e04:     	movq	%r15, %r12
145501e07:     	andq	%rdi, %r12
145501e0a:     	andl	$0x3f, %r15d
145501e0e:     	addq	%rdx, %r12
145501e11:     	testq	%r8, %r8
145501e14:     	je	0x145501e26 <.text+0x5500e26>
145501e16:     	addq	%r8, 0xb0(%rsp)
145501e1e:     	movq	%r14, %rcx
145501e21:     	callq	0x1455aff30 <.text+0x55aef30>
145501e26:     	movq	%rbx, %rcx
145501e29:     	movq	%r12, %rdx
145501e2c:     	movq	%r15, %r8
145501e2f:     	callq	0x145756ddd <.text+0x5755ddd>
145501e34:     	movb	%r15b, 0x110(%rsp)
145501e3c:     	xorps	%xmm7, %xmm7
145501e3f:     	movups	%xmm7, 0x168(%rsp)
145501e47:     	movups	%xmm7, 0x158(%rsp)
145501e4f:     	movups	%xmm7, 0x148(%rsp)
145501e57:     	movups	%xmm7, 0x138(%rsp)
145501e5f:     	movb	$0x0, 0x178(%rsp)
145501e67:     	leaq	0x120(%rsp), %rbx
145501e6f:     	movups	%xmm6, 0x120(%rsp)
145501e77:     	movl	$0xc3d2e1f0, 0x130(%rsp) # imm = 0xC3D2E1F0
145501e82:     	movaps	0x14ab387(%rip), %xmm0  # 0x1469ad210
145501e89:     	movaps	%xmm0, 0x40(%rsp)
145501e8e:     	movaps	0x14ab38b(%rip), %xmm0  # 0x1469ad220
145501e95:     	movaps	%xmm0, 0x50(%rsp)
145501e9a:     	movaps	0x14ab38f(%rip), %xmm0  # 0x1469ad230
145501ea1:     	movaps	%xmm0, 0x60(%rsp)
145501ea6:     	movaps	0x441a43(%rip), %xmm0   # 0x1459438f0
145501ead:     	movaps	%xmm0, 0x70(%rsp)
145501eb2:     	movq	$0x1, 0x118(%rsp)
145501ebe:     	leaq	0x40(%rsp), %rdx
145501ec3:     	movl	$0x1, %r8d
145501ec9:     	movq	%rbx, %rcx
145501ecc:     	callq	0x1455aff30 <.text+0x55aef30>
145501ed1:     	movb	$0x0, 0x178(%rsp)
145501ed9:     	movups	0xb0(%rsp), %xmm0
145501ee1:     	movups	0xc0(%rsp), %xmm1
145501ee9:     	movups	0xd0(%rsp), %xmm2
145501ef1:     	movups	0xe0(%rsp), %xmm3
145501ef9:     	movaps	%xmm0, 0x40(%rsp)
145501efe:     	movq	0x110(%rsp), %rax
145501f06:     	movq	%rax, 0xa0(%rsp)
145501f0e:     	movups	0x100(%rsp), %xmm0
145501f16:     	movaps	%xmm0, 0x90(%rsp)
145501f1e:     	movups	0xf0(%rsp), %xmm0
145501f26:     	movaps	%xmm0, 0x80(%rsp)
145501f2e:     	movaps	%xmm3, 0x70(%rsp)
145501f33:     	movaps	%xmm2, 0x60(%rsp)
145501f38:     	movaps	%xmm1, 0x50(%rsp)
145501f3d:     	leaq	0x60(%rsp), %r14
145501f42:     	movzbl	%al, %ecx
145501f45:     	movq	0x40(%rsp), %rdx
145501f4a:     	shlq	$0x9, %rdx
145501f4e:     	leal	(,%rcx,8), %r12d
145501f56:     	orq	%rdx, %r12
145501f59:     	movzbl	%al, %r15d
145501f5d:     	movl	0xc8(%rsp), %eax
145501f64:     	movl	%eax, 0x30(%rsp)
145501f68:     	movdqu	0xb8(%rsp), %xmm0
145501f71:     	movdqa	%xmm0, 0x20(%rsp)
145501f77:     	bswapq	%r12
145501f7a:     	movb	$-0x80, 0x60(%rsp,%r15)
145501f80:     	cmpl	$0x3f, %ecx
145501f83:     	je	0x145501fa8 <.text+0x5500fa8>
145501f85:     	leaq	(%rsp,%r15), %rcx
145501f89:     	addq	$0x60, %rcx
145501f8d:     	incq	%rcx
145501f90:     	movq	%r15, %r8
145501f93:     	xorq	$0x3f, %r8
145501f97:     	xorl	%edx, %edx
145501f99:     	callq	0x145756dcb <.text+0x5755dcb>
145501f9e:     	xorl	$0x38, %r15d
145501fa2:     	cmpl	$0x7, %r15d
145501fa6:     	ja	0x145501ffd <.text+0x5500ffd>
145501fa8:     	leaq	0x20(%rsp), %r15
145501fad:     	movl	$0x1, %r8d
145501fb3:     	movq	%r15, %rcx
145501fb6:     	movq	%r14, %rdx
145501fb9:     	callq	0x1455aff30 <.text+0x55aef30>
145501fbe:     	movaps	%xmm7, 0x1a0(%rsp)
145501fc6:     	movaps	%xmm7, 0x190(%rsp)
145501fce:     	movaps	%xmm7, 0x180(%rsp)
145501fd6:     	movq	$0x0, 0x1b0(%rsp)
145501fe2:     	movq	%r12, 0x1b8(%rsp)
145501fea:     	leaq	0x180(%rsp), %rdx
145501ff2:     	movl	$0x1, %r8d
145501ff8:     	movq	%r15, %rcx
145501ffb:     	jmp	0x145502013 <.text+0x5501013>
145501ffd:     	movq	%r12, 0x98(%rsp)
145502005:     	leaq	0x20(%rsp), %rcx
14550200a:     	movl	$0x1, %r8d
145502010:     	movq	%r14, %rdx
145502013:     	callq	0x1455aff30 <.text+0x55aef30>
145502018:     	leaq	0x138(%rsp), %r14
145502020:     	movl	0x30(%rsp), %eax
145502024:     	bswapl	%eax
145502026:     	pxor	%xmm0, %xmm0
14550202a:     	movdqa	0x20(%rsp), %xmm1
145502030:     	movdqa	%xmm1, %xmm2
145502034:     	punpckhbw	%xmm0, %xmm2    # xmm2 = xmm2[8],xmm0[8],xmm2[9],xmm0[9],xmm2[10],xmm0[10],xmm2[11],xmm0[11],xmm2[12],xmm0[12],xmm2[13],xmm0[13],xmm2[14],xmm0[14],xmm2[15],xmm0[15]
145502038:     	pshuflw	$0x1b, %xmm2, %xmm2     # xmm2 = xmm2[3,2,1,0,4,5,6,7]
14550203d:     	pshufhw	$0x1b, %xmm2, %xmm2     # xmm2 = xmm2[0,1,2,3,7,6,5,4]
145502042:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
145502046:     	pshuflw	$0x1b, %xmm1, %xmm0     # xmm0 = xmm1[3,2,1,0,4,5,6,7]
14550204b:     	pshufhw	$0x1b, %xmm0, %xmm0     # xmm0 = xmm0[0,1,2,3,7,6,5,4]
145502050:     	packuswb	%xmm2, %xmm0
145502054:     	movdqa	%xmm0, 0x40(%rsp)
14550205a:     	movl	%eax, 0x50(%rsp)
14550205e:     	movzbl	0x178(%rsp), %r15d
145502067:     	cmpq	$0x2c, %r15
14550206b:     	jae	0x145502088 <.text+0x5501088>
14550206d:     	movl	0x50(%rsp), %eax
145502071:     	movl	%eax, 0x10(%r14,%r15)
145502076:     	movdqa	0x40(%rsp), %xmm0
14550207c:     	movdqu	%xmm0, (%r14,%r15)
145502082:     	addq	$0x14, %r15
145502086:     	jmp	0x1455020d8 <.text+0x55010d8>
145502088:     	movl	$0x40, %r8d
14550208e:     	subq	%r15, %r8
145502091:     	leaq	(%rsp,%r8), %r12
145502095:     	addq	$0x40, %r12
145502099:     	leaq	(%r14,%r15), %rcx
14550209d:     	addq	$-0x2c, %r15
1455020a1:     	leaq	0x40(%rsp), %rdx
1455020a6:     	callq	0x145756ddd <.text+0x5755ddd>
1455020ab:     	incq	0x118(%rsp)
1455020b3:     	movl	$0x1, %r8d
1455020b9:     	movq	%rbx, %rcx
1455020bc:     	movq	%r14, %rdx
1455020bf:     	callq	0x1455aff30 <.text+0x55aef30>
1455020c4:     	andq	%r15, %rdi
1455020c7:     	addq	%r12, %rdi
1455020ca:     	movq	%r14, %rcx
1455020cd:     	movq	%rdi, %rdx
1455020d0:     	movq	%r15, %r8
1455020d3:     	callq	0x145756ddd <.text+0x5755ddd>
1455020d8:     	movb	%r15b, 0x178(%rsp)
1455020e0:     	movups	0x118(%rsp), %xmm0
1455020e8:     	movups	0x128(%rsp), %xmm1
1455020f0:     	movups	0x138(%rsp), %xmm2
1455020f8:     	movups	0x148(%rsp), %xmm3
145502100:     	movaps	%xmm0, 0x40(%rsp)
145502105:     	movq	0x178(%rsp), %rax
14550210d:     	movq	%rax, 0xa0(%rsp)
145502115:     	movups	0x168(%rsp), %xmm0
14550211d:     	movaps	%xmm0, 0x90(%rsp)
145502125:     	movups	0x158(%rsp), %xmm0
14550212d:     	movaps	%xmm0, 0x80(%rsp)
145502135:     	movaps	%xmm3, 0x70(%rsp)
14550213a:     	movaps	%xmm2, 0x60(%rsp)
14550213f:     	movaps	%xmm1, 0x50(%rsp)
145502144:     	leaq	0x60(%rsp), %rdi
145502149:     	movzbl	%al, %ecx
14550214c:     	movq	0x40(%rsp), %rdx
145502151:     	shlq	$0x9, %rdx
145502155:     	leal	(,%rcx,8), %r14d
14550215d:     	orq	%rdx, %r14
145502160:     	movzbl	%al, %ebx
145502163:     	movl	0x130(%rsp), %eax
14550216a:     	movl	%eax, 0x30(%rsp)
14550216e:     	movdqu	0x120(%rsp), %xmm0
145502177:     	movdqa	%xmm0, 0x20(%rsp)
14550217d:     	bswapq	%r14
145502180:     	movb	$-0x80, 0x60(%rsp,%rbx)
145502185:     	cmpl	$0x3f, %ecx
145502188:     	je	0x1455021ab <.text+0x55011ab>
14550218a:     	leaq	(%rsp,%rbx), %rcx
14550218e:     	addq	$0x60, %rcx
145502192:     	incq	%rcx
145502195:     	movq	%rbx, %r8
145502198:     	xorq	$0x3f, %r8
14550219c:     	xorl	%edx, %edx
14550219e:     	callq	0x145756dcb <.text+0x5755dcb>
1455021a3:     	xorl	$0x38, %ebx
1455021a6:     	cmpl	$0x7, %ebx
1455021a9:     	ja	0x145502207 <.text+0x5501207>
1455021ab:     	leaq	0x20(%rsp), %rbx
1455021b0:     	movl	$0x1, %r8d
1455021b6:     	movq	%rbx, %rcx
1455021b9:     	movq	%rdi, %rdx
1455021bc:     	callq	0x1455aff30 <.text+0x55aef30>
1455021c1:     	pxor	%xmm0, %xmm0
1455021c5:     	movdqa	%xmm0, 0x1a0(%rsp)
1455021ce:     	movdqa	%xmm0, 0x190(%rsp)
1455021d7:     	movdqa	%xmm0, 0x180(%rsp)
1455021e0:     	movq	$0x0, 0x1b0(%rsp)
1455021ec:     	movq	%r14, 0x1b8(%rsp)
1455021f4:     	leaq	0x180(%rsp), %rdx
1455021fc:     	movl	$0x1, %r8d
145502202:     	movq	%rbx, %rcx
145502205:     	jmp	0x14550221d <.text+0x550121d>
145502207:     	movq	%r14, 0x98(%rsp)
14550220f:     	leaq	0x20(%rsp), %rcx
145502214:     	movl	$0x1, %r8d
14550221a:     	movq	%rdi, %rdx
14550221d:     	callq	0x1455aff30 <.text+0x55aef30>
145502222:     	movl	0x30(%rsp), %eax
145502226:     	bswapl	%eax
145502228:     	pxor	%xmm0, %xmm0
14550222c:     	movdqa	0x20(%rsp), %xmm1
145502232:     	movdqa	%xmm1, %xmm2
145502236:     	punpckhbw	%xmm0, %xmm2    # xmm2 = xmm2[8],xmm0[8],xmm2[9],xmm0[9],xmm2[10],xmm0[10],xmm2[11],xmm0[11],xmm2[12],xmm0[12],xmm2[13],xmm0[13],xmm2[14],xmm0[14],xmm2[15],xmm0[15]
14550223a:     	pshuflw	$0x1b, %xmm2, %xmm2     # xmm2 = xmm2[3,2,1,0,4,5,6,7]
14550223f:     	pshufhw	$0x1b, %xmm2, %xmm2     # xmm2 = xmm2[0,1,2,3,7,6,5,4]
145502244:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
145502248:     	pshuflw	$0x1b, %xmm1, %xmm0     # xmm0 = xmm1[3,2,1,0,4,5,6,7]
14550224d:     	pshufhw	$0x1b, %xmm0, %xmm0     # xmm0 = xmm0[0,1,2,3,7,6,5,4]
145502252:     	packuswb	%xmm2, %xmm0
145502256:     	movdqu	%xmm0, (%rsi)
14550225a:     	movl	%eax, 0x10(%rsi)
14550225d:     	movaps	0x1c0(%rsp), %xmm6
145502265:     	movaps	0x1d0(%rsp), %xmm7
14550226d:     	addq	$0x1e8, %rsp            # imm = 0x1E8
145502274:     	popq	%rbx
145502275:     	popq	%rbp
145502276:     	popq	%rdi
145502277:     	popq	%rsi
145502278:     	popq	%r12
14550227a:     	popq	%r13
14550227c:     	popq	%r14
14550227e:     	popq	%r15
145502280:     	retq

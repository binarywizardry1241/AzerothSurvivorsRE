
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401f2c20:     	pushq	%r15
1401f2c22:     	pushq	%r14
1401f2c24:     	pushq	%r13
1401f2c26:     	pushq	%r12
1401f2c28:     	pushq	%rsi
1401f2c29:     	pushq	%rdi
1401f2c2a:     	pushq	%rbp
1401f2c2b:     	pushq	%rbx
1401f2c2c:     	subq	$0x268, %rsp            # imm = 0x268
1401f2c33:     	movq	%r9, %rbx
1401f2c36:     	movq	%r8, %r15
1401f2c39:     	movq	%rdx, %rsi
1401f2c3c:     	movq	%rcx, 0x30(%rsp)
1401f2c41:     	movq	0x48(%r9), %rax
1401f2c45:     	leaq	-0x1(%rax), %rcx
1401f2c49:     	cmpq	$0x4, %rcx
1401f2c4d:     	ja	0x1401f2c78 <.text+0x1f1c78>
1401f2c4f:     	leaq	0x575b7a2(%rip), %rcx   # 0x14594e3f8
1401f2c56:     	movss	-0x4(%rcx,%rax,4), %xmm0
1401f2c5c:     	leaq	0x575b7a9(%rip), %rcx   # 0x14594e40c
1401f2c63:     	movss	-0x4(%rcx,%rax,4), %xmm1
1401f2c69:     	leaq	0x575b7b0(%rip), %rcx   # 0x14594e420
1401f2c70:     	movss	-0x4(%rcx,%rax,4), %xmm2
1401f2c76:     	jmp	0x1401f2c86 <.text+0x1f1c86>
1401f2c78:     	movss	0x574ccb0(%rip), %xmm0  # 0x14593f930
1401f2c80:     	movaps	%xmm0, %xmm1
1401f2c83:     	movaps	%xmm0, %xmm2
1401f2c86:     	movl	$0x0, 0x3c(%rsp)
1401f2c8e:     	movss	%xmm0, 0x40(%rsp)
1401f2c94:     	movss	%xmm1, 0x44(%rsp)
1401f2c9a:     	movss	%xmm2, 0x48(%rsp)
1401f2ca0:     	movl	$0x3f800000, 0x4c(%rsp) # imm = 0x3F800000
1401f2ca8:     	movups	0x57592f1(%rip), %xmm0  # 0x14594bfa0
1401f2caf:     	movaps	%xmm0, 0x50(%rsp)
1401f2cb4:     	movq	$0x0, 0x60(%rsp)
1401f2cbd:     	movups	0x57592f4(%rip), %xmm1  # 0x14594bfb8
1401f2cc4:     	movups	%xmm1, 0x68(%rsp)
1401f2cc9:     	movq	$0x0, 0x78(%rsp)
1401f2cd2:     	movups	0x57592f7(%rip), %xmm1  # 0x14594bfd0
1401f2cd9:     	movaps	%xmm1, 0x80(%rsp)
1401f2ce1:     	movq	$0x0, 0x90(%rsp)
1401f2ced:     	movups	0x57592f4(%rip), %xmm2  # 0x14594bfe8
1401f2cf4:     	movups	%xmm2, 0x98(%rsp)
1401f2cfc:     	movq	$0x0, 0xa8(%rsp)
1401f2d08:     	movq	0x30(%rsp), %rax
1401f2d0d:     	movq	(%rax), %r13
1401f2d10:     	leaq	0x8(%rax), %r14
1401f2d14:     	movq	0xa0(%rsp), %rax
1401f2d1c:     	movq	%rax, 0x108(%rsp)
1401f2d24:     	movq	0xa8(%rsp), %rax
1401f2d2c:     	movq	%rax, 0x110(%rsp)
1401f2d34:     	movq	0x90(%rsp), %rax
1401f2d3c:     	movq	%rax, 0xf8(%rsp)
1401f2d44:     	movq	0x98(%rsp), %rax
1401f2d4c:     	movq	%rax, 0x100(%rsp)
1401f2d54:     	movups	%xmm1, 0xe8(%rsp)
1401f2d5c:     	movaps	0x70(%rsp), %xmm1
1401f2d61:     	movups	%xmm1, 0xd8(%rsp)
1401f2d69:     	movaps	0x60(%rsp), %xmm1
1401f2d6e:     	movups	%xmm1, 0xc8(%rsp)
1401f2d76:     	movups	%xmm0, 0xb8(%rsp)
1401f2d7e:     	xorps	%xmm0, %xmm0
1401f2d81:     	movups	%xmm0, 0x118(%rsp)
1401f2d89:     	movups	%xmm0, 0x128(%rsp)
1401f2d91:     	movups	%xmm0, 0x138(%rsp)
1401f2d99:     	movups	%xmm0, 0x148(%rsp)
1401f2da1:     	movups	%xmm0, 0x158(%rsp)
1401f2da9:     	movq	$0x0, 0x168(%rsp)
1401f2db5:     	movups	0x57592ac(%rip), %xmm0  # 0x14594c068
1401f2dbc:     	movups	%xmm0, 0x180(%rsp)
1401f2dc4:     	movups	0x575928d(%rip), %xmm0  # 0x14594c058
1401f2dcb:     	movups	%xmm0, 0x170(%rsp)
1401f2dd3:     	movups	0x57592ae(%rip), %xmm0  # 0x14594c088
1401f2dda:     	movups	%xmm0, 0x1a0(%rsp)
1401f2de2:     	movups	0x575928f(%rip), %xmm0  # 0x14594c078
1401f2de9:     	movups	%xmm0, 0x190(%rsp)
1401f2df1:     	movups	0x57592b0(%rip), %xmm0  # 0x14594c0a8
1401f2df8:     	movups	%xmm0, 0x1c0(%rsp)
1401f2e00:     	movups	0x5759291(%rip), %xmm0  # 0x14594c098
1401f2e07:     	movups	%xmm0, 0x1b0(%rsp)
1401f2e0f:     	movups	0x57592b2(%rip), %xmm0  # 0x14594c0c8
1401f2e16:     	movups	%xmm0, 0x1e0(%rsp)
1401f2e1e:     	movups	0x5759293(%rip), %xmm0  # 0x14594c0b8
1401f2e25:     	movups	%xmm0, 0x1d0(%rsp)
1401f2e2d:     	movaps	0x571468c(%rip), %xmm0  # 0x1459074c0
1401f2e34:     	movups	%xmm0, 0x1f0(%rsp)
1401f2e3c:     	movl	$0x1, 0x200(%rsp)
1401f2e47:     	movss	0x5722a85(%rip), %xmm0  # 0x1459158d4
1401f2e4f:     	movlps	%xmm0, 0x204(%rsp)
1401f2e57:     	movb	$0x1, 0x20c(%rsp)
1401f2e5f:     	movq	$0x0, 0x210(%rsp)
1401f2e6b:     	movl	$0x3f800000, 0x218(%rsp) # imm = 0x3F800000
1401f2e76:     	movw	$0x0, 0x21c(%rsp)
1401f2e80:     	movw	$0x0, 0x222(%rsp)
1401f2e8a:     	movl	$0x10000, 0x21e(%rsp)   # imm = 0x10000
1401f2e95:     	movw	$0x0, 0x228(%rsp)
1401f2e9f:     	movl	$0x10000, 0x224(%rsp)   # imm = 0x10000
1401f2eaa:     	movq	$0x0, 0x22a(%rsp)
1401f2eb6:     	movl	$0x5, 0x232(%rsp)
1401f2ec1:     	movq	%r13, 0xb0(%rsp)
1401f2ec9:     	leaq	0x5758d18(%rip), %r9    # 0x14594bbe8
1401f2ed0:     	leaq	0x238(%rsp), %r12
1401f2ed8:     	leaq	0xb0(%rsp), %r8
1401f2ee0:     	movq	%r12, %rcx
1401f2ee3:     	movq	%r14, %rdx
1401f2ee6:     	callq	0x1400d7270 <.text+0xd6270>
1401f2eeb:     	leaq	0x3c(%rsp), %rax
1401f2ef0:     	movq	%rax, 0xb0(%rsp)
1401f2ef8:     	movq	%r15, 0xb8(%rsp)
1401f2f00:     	movq	%rbx, 0xc0(%rsp)
1401f2f08:     	movq	%rsi, 0xc8(%rsp)
1401f2f10:     	leaq	0xb0(%rsp), %rdx
1401f2f18:     	movq	%r12, %rcx
1401f2f1b:     	callq	0x140109640 <.text+0x108640>
1401f2f20:     	cmpq	$0x2, 0x50(%rbx)
1401f2f25:     	jb	0x1401f30b7 <.text+0x1f20b7>
1401f2f2b:     	leaq	0x50(%rbx), %rdi
1401f2f2f:     	leaq	0x575977a(%rip), %rcx   # 0x14594c6b0
1401f2f36:     	movl	$0x8, %edx
1401f2f3b:     	callq	0x145457c00 <.text+0x5456c00>
1401f2f40:     	movq	%rdx, %r8
1401f2f43:     	leaq	0x575978e(%rip), %rcx   # 0x14594c6d8
1401f2f4a:     	movq	%rcx, 0x238(%rsp)
1401f2f52:     	movq	$0x1, 0x240(%rsp)
1401f2f5e:     	movq	%rdi, 0x248(%rsp)
1401f2f66:     	leaq	0x575974b(%rip), %rcx   # 0x14594c6b8
1401f2f6d:     	movq	%rcx, 0x250(%rsp)
1401f2f75:     	movq	$0x1, 0x20(%rsp)
1401f2f7e:     	leaq	0x50(%rsp), %rcx
1401f2f83:     	leaq	0x238(%rsp), %r9
1401f2f8b:     	movq	%rax, %rdx
1401f2f8e:     	callq	0x145458060 <.text+0x5457060>
1401f2f93:     	cmpb	$0x1, (%rsi)
1401f2f96:     	jne	0x1401f2fb2 <.text+0x1f1fb2>
1401f2f98:     	movl	0x1(%rsi), %eax
1401f2f9b:     	movl	0x4(%rsi), %ecx
1401f2f9e:     	movl	%ecx, 0x2b(%rsp)
1401f2fa2:     	movl	%eax, 0x28(%rsp)
1401f2fa6:     	movq	0x8(%rsi), %rax
1401f2faa:     	movzbl	0x10(%rsi), %ecx
1401f2fae:     	movb	$0x1, %dl
1401f2fb0:     	jmp	0x1401f2fc2 <.text+0x1f1fc2>
1401f2fb2:     	movq	0x8(%rsi), %rax
1401f2fb6:     	lock
1401f2fb7:     	incq	(%rax)
1401f2fba:     	jle	0x1401f31ff <.text+0x1f21ff>
1401f2fc0:     	xorl	%edx, %edx
1401f2fc2:     	leaq	0xb8(%rsp), %r8
1401f2fca:     	movq	0x60(%rsp), %r9
1401f2fcf:     	movq	%r9, 0x10(%r8)
1401f2fd3:     	movups	0x50(%rsp), %xmm0
1401f2fd8:     	movups	%xmm0, (%r8)
1401f2fdc:     	movq	$0x0, 0xd0(%rsp)
1401f2fe8:     	movq	$0x4, 0xd8(%rsp)
1401f2ff4:     	movq	$0x0, 0xe0(%rsp)
1401f3000:     	movb	%dl, 0xe8(%rsp)
1401f3007:     	movl	0x28(%rsp), %edx
1401f300b:     	movl	0x2b(%rsp), %r8d
1401f3010:     	movl	%edx, 0xe9(%rsp)
1401f3017:     	movl	%r8d, 0xec(%rsp)
1401f301f:     	movq	%rax, 0xf0(%rsp)
1401f3027:     	movq	%rcx, 0xf8(%rsp)
1401f302f:     	movl	$0x41400000, 0x100(%rsp) # imm = 0x41400000
1401f303a:     	movw	$0x190, 0x104(%rsp)     # imm = 0x190
1401f3044:     	movb	$0x1, 0x106(%rsp)
1401f304c:     	movups	0x5759689(%rip), %xmm0  # 0x14594c6dc
1401f3053:     	movups	%xmm0, 0x108(%rsp)
1401f305b:     	movl	$0x3f800000, 0x118(%rsp) # imm = 0x3F800000
1401f3066:     	movl	0x5726114(%rip), %eax   # 0x145919180
1401f306c:     	movl	%eax, 0x12c(%rsp)
1401f3073:     	movups	0x57260f6(%rip), %xmm0  # 0x145919170
1401f307a:     	movups	%xmm0, 0x11c(%rsp)
1401f3082:     	movsd	0x5722746(%rip), %xmm0  # 0x1459157d0
1401f308a:     	movsd	%xmm0, 0x130(%rsp)
1401f3093:     	movq	%r13, 0xb0(%rsp)
1401f309b:     	leaq	0x5758b46(%rip), %r9    # 0x14594bbe8
1401f30a2:     	leaq	0x50(%rsp), %rcx
1401f30a7:     	leaq	0xb0(%rsp), %r8
1401f30af:     	movq	%r14, %rdx
1401f30b2:     	callq	0x1400dbfa0 <.text+0xdafa0>
1401f30b7:     	movq	0x20(%rbx), %r14
1401f30bb:     	movq	0x28(%rbx), %r15
1401f30bf:     	xorl	%r12d, %r12d
1401f30c2:     	xorl	%edi, %edi
1401f30c4:     	xorl	%r13d, %r13d
1401f30c7:     	xorl	%ebp, %ebp
1401f30c9:     	nopl	(%rax)
1401f30d0:     	testb	$0x1, %bpl
1401f30d4:     	jne	0x1401f31eb <.text+0x1f21eb>
1401f30da:     	movq	%rdi, %rbx
1401f30dd:     	movb	$0x1, %bpl
1401f30e0:     	cmpq	%r13, %r15
1401f30e3:     	jae	0x1401f310c <.text+0x1f210c>
1401f30e5:     	movb	$0x1, %r12b
1401f30e8:     	movq	%rbx, %rdi
1401f30eb:     	movq	%r15, %r9
1401f30ee:     	subq	%rbx, %r9
1401f30f1:     	je	0x1401f30d0 <.text+0x1f20d0>
1401f30f3:     	jmp	0x1401f31d0 <.text+0x1f21d0>
1401f30f8:     	nopl	(%rax,%rax)
1401f3100:     	movq	%rax, %r13
1401f3103:     	cmpq	%r15, %rax
1401f3106:     	ja	0x1401f31b4 <.text+0x1f21b4>
1401f310c:     	movq	%r15, %r8
1401f310f:     	subq	%r13, %r8
1401f3112:     	leaq	(%r14,%r13), %rdx
1401f3116:     	cmpq	$0x10, %r8
1401f311a:     	jae	0x1401f3150 <.text+0x1f2150>
1401f311c:     	xorl	%r9d, %r9d
1401f311f:     	testq	%r8, %r8
1401f3122:     	je	0x1401f3142 <.text+0x1f2142>
1401f3124:     	nopw	%cs:(%rax,%rax)
1401f3130:     	cmpb	$0xa, (%rdx,%r9)
1401f3135:     	je	0x1401f3162 <.text+0x1f2162>
1401f3137:     	incq	%r9
1401f313a:     	cmpq	%r9, %r8
1401f313d:     	jne	0x1401f3130 <.text+0x1f2130>
1401f313f:     	movq	%r8, %r9
1401f3142:     	xorl	%eax, %eax
1401f3144:     	cmpq	$0x1, %rax
1401f3148:     	je	0x1401f3170 <.text+0x1f2170>
1401f314a:     	jmp	0x1401f319d <.text+0x1f219d>
1401f314c:     	nopl	(%rax)
1401f3150:     	movb	$0xa, %cl
1401f3152:     	callq	0x1457311c0 <.text+0x57301c0>
1401f3157:     	movq	%rdx, %r9
1401f315a:     	cmpq	$0x1, %rax
1401f315e:     	je	0x1401f3170 <.text+0x1f2170>
1401f3160:     	jmp	0x1401f319d <.text+0x1f219d>
1401f3162:     	movl	$0x1, %eax
1401f3167:     	cmpq	$0x1, %rax
1401f316b:     	jne	0x1401f319d <.text+0x1f219d>
1401f316d:     	nopl	(%rax)
1401f3170:     	leaq	(%r9,%r13), %rax
1401f3174:     	incq	%rax
1401f3177:     	addq	%r13, %r9
1401f317a:     	cmpq	%r15, %r9
1401f317d:     	jae	0x1401f3100 <.text+0x1f2100>
1401f317f:     	cmpb	$0xa, (%r14,%r9)
1401f3184:     	jne	0x1401f3100 <.text+0x1f2100>
1401f318a:     	xorl	%ebp, %ebp
1401f318c:     	movq	%rax, %rdi
1401f318f:     	movq	%rax, %r13
1401f3192:     	subq	%rbx, %r9
1401f3195:     	je	0x1401f30d0 <.text+0x1f20d0>
1401f319b:     	jmp	0x1401f31d0 <.text+0x1f21d0>
1401f319d:     	movb	$0x1, %r12b
1401f31a0:     	movq	%rbx, %rdi
1401f31a3:     	movq	%r15, %r13
1401f31a6:     	movq	%r15, %r9
1401f31a9:     	subq	%rbx, %r9
1401f31ac:     	je	0x1401f30d0 <.text+0x1f20d0>
1401f31b2:     	jmp	0x1401f31d0 <.text+0x1f21d0>
1401f31b4:     	movb	$0x1, %r12b
1401f31b7:     	movq	%rbx, %rdi
1401f31ba:     	movq	%rax, %r13
1401f31bd:     	movq	%r15, %r9
1401f31c0:     	subq	%rbx, %r9
1401f31c3:     	je	0x1401f30d0 <.text+0x1f20d0>
1401f31c9:     	nopl	(%rax)
1401f31d0:     	addq	%r14, %rbx
1401f31d3:     	movq	0x30(%rsp), %rcx
1401f31d8:     	movq	%rsi, %rdx
1401f31db:     	movq	%rbx, %r8
1401f31de:     	callq	0x1401f9d10 <.text+0x1f8d10>
1401f31e3:     	movl	%r12d, %ebp
1401f31e6:     	jmp	0x1401f30d0 <.text+0x1f20d0>
1401f31eb:     	addq	$0x268, %rsp            # imm = 0x268
1401f31f2:     	popq	%rbx
1401f31f3:     	popq	%rbp
1401f31f4:     	popq	%rdi
1401f31f5:     	popq	%rsi
1401f31f6:     	popq	%r12
1401f31f8:     	popq	%r13
1401f31fa:     	popq	%r14
1401f31fc:     	popq	%r15
1401f31fe:     	retq
1401f31ff:     	ud2
1401f3201:     	int3
1401f3202:     	int3
1401f3203:     	int3
1401f3204:     	int3
1401f3205:     	int3
1401f3206:     	int3
1401f3207:     	int3
1401f3208:     	int3
1401f3209:     	int3
1401f320a:     	int3
1401f320b:     	int3
1401f320c:     	int3
1401f320d:     	int3
1401f320e:     	int3
1401f320f:     	int3

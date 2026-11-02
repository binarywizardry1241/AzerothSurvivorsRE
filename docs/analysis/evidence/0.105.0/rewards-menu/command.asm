
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140126a20:     	pushq	%r15
140126a22:     	pushq	%r14
140126a24:     	pushq	%r13
140126a26:     	pushq	%r12
140126a28:     	pushq	%rsi
140126a29:     	pushq	%rdi
140126a2a:     	pushq	%rbp
140126a2b:     	pushq	%rbx
140126a2c:     	subq	$0x3c8, %rsp            # imm = 0x3C8
140126a33:     	movaps	%xmm7, 0x3b0(%rsp)
140126a3b:     	movaps	%xmm6, 0x3a0(%rsp)
140126a43:     	movq	%r9, %rsi
140126a46:     	movq	%r8, %rbx
140126a49:     	movq	%rdx, %rdi
140126a4c:     	movzbl	0x430(%rsp), %ebp
140126a54:     	xorps	%xmm6, %xmm6
140126a57:     	movaps	%xmm6, 0x360(%rsp)
140126a5f:     	movaps	%xmm6, 0x350(%rsp)
140126a67:     	movaps	%xmm6, 0x340(%rsp)
140126a6f:     	movaps	%xmm6, 0x330(%rsp)
140126a77:     	movaps	%xmm6, 0x320(%rsp)
140126a7f:     	movq	$0x0, 0x370(%rsp)
140126a8b:     	movups	0x5c833e6(%rip), %xmm0  # 0x145da9e78
140126a92:     	movups	%xmm0, 0x378(%rsp)
140126a9a:     	movups	0x5c833e7(%rip), %xmm0  # 0x145da9e88
140126aa1:     	movups	%xmm0, 0x388(%rsp)
140126aa9:     	movups	0x5c83310(%rip), %xmm0  # 0x145da9dc0
140126ab0:     	movaps	%xmm0, 0x2c0(%rsp)
140126ab8:     	movq	$0x0, 0x2d0(%rsp)
140126ac4:     	movups	0x5c8330d(%rip), %xmm0  # 0x145da9dd8
140126acb:     	movups	%xmm0, 0x2d8(%rsp)
140126ad3:     	movq	$0x0, 0x2e8(%rsp)
140126adf:     	movups	0x5c8330a(%rip), %xmm0  # 0x145da9df0
140126ae6:     	movaps	%xmm0, 0x2f0(%rsp)
140126aee:     	movq	$0x0, 0x300(%rsp)
140126afa:     	movups	0x5c83307(%rip), %xmm0  # 0x145da9e08
140126b01:     	movups	%xmm0, 0x308(%rsp)
140126b09:     	movq	$0x0, 0x318(%rsp)
140126b15:     	movq	(%rcx), %r15
140126b18:     	leaq	0x8(%rcx), %r14
140126b1c:     	leaq	0xe8(%rsp), %rcx
140126b24:     	leaq	0x2c0(%rsp), %rdx
140126b2c:     	movl	$0xd8, %r8d
140126b32:     	callq	0x145bc977b <.text+0x5bc877b>
140126b37:     	movaps	0x5c467a2(%rip), %xmm0  # 0x145d6d2e0
140126b3e:     	movups	%xmm0, 0x1c0(%rsp)
140126b46:     	movaps	0x5c468c3(%rip), %xmm0  # 0x145d6d410
140126b4d:     	movups	%xmm0, 0x1d0(%rsp)
140126b55:     	movaps	0x5c46734(%rip), %xmm0  # 0x145d6d290
140126b5c:     	movups	%xmm0, 0x1e0(%rsp)
140126b64:     	movups	%xmm0, 0x1f0(%rsp)
140126b6c:     	movaps	0x5c46a7d(%rip), %xmm0  # 0x145d6d5f0
140126b73:     	movups	%xmm0, 0x200(%rsp)
140126b7b:     	movups	%xmm0, 0x210(%rsp)
140126b83:     	movaps	0x5c466d6(%rip), %xmm0  # 0x145d6d260
140126b8a:     	movups	%xmm0, 0x220(%rsp)
140126b92:     	movl	$0x1, 0x230(%rsp)
140126b9d:     	movq	$0x0, 0x234(%rsp)
140126ba9:     	movb	$0x1, 0x23c(%rsp)
140126bb1:     	movq	$0x0, 0x240(%rsp)
140126bbd:     	movl	$0x3f800000, 0x248(%rsp) # imm = 0x3F800000
140126bc8:     	movw	$0x0, 0x24c(%rsp)
140126bd2:     	movl	$0x10000, 0x24e(%rsp)   # imm = 0x10000
140126bdd:     	movw	$0x0, 0x252(%rsp)
140126be7:     	movl	$0x10000, 0x254(%rsp)   # imm = 0x10000
140126bf2:     	movw	$0x0, 0x258(%rsp)
140126bfc:     	movq	$0x0, 0x25a(%rsp)
140126c08:     	movl	$0x5000305, 0x262(%rsp) # imm = 0x5000305
140126c13:     	movq	%r15, 0xe0(%rsp)
140126c1b:     	leaq	0x5c4738e(%rip), %r9    # 0x145d6dfb0
140126c22:     	leaq	0x80(%rsp), %rcx
140126c2a:     	leaq	0xe0(%rsp), %r8
140126c32:     	movq	%r14, %rdx
140126c35:     	callq	0x140189f40 <.text+0x188f40>
140126c3a:     	testb	%bpl, %bpl
140126c3d:     	je	0x140126ec4 <.text+0x125ec4>
140126c43:     	movl	$0x3f800000, 0xf0(%rsp) # imm = 0x3F800000
140126c4e:     	movups	0x5c8369b(%rip), %xmm7  # 0x145daa2f0
140126c55:     	movups	0x5c83ba8(%rip), %xmm6  # 0x145daa804
140126c5c:     	movups	%xmm6, 0xf4(%rsp)
140126c64:     	movl	$0x3f800000, 0x104(%rsp) # imm = 0x3F800000
140126c6f:     	movups	%xmm7, 0xb8(%rsp)
140126c77:     	movl	0xf0(%rsp), %eax
140126c7e:     	movl	%eax, 0xc8(%rsp)
140126c85:     	movq	0xf4(%rsp), %rax
140126c8d:     	movq	%rax, 0xcc(%rsp)
140126c95:     	movl	0xfc(%rsp), %eax
140126c9c:     	movl	%eax, 0xd4(%rsp)
140126ca3:     	movq	0x100(%rsp), %rax
140126cab:     	movq	%rax, 0xd8(%rsp)
140126cb3:     	movq	0x98(%rsp), %r14
140126cbb:     	testq	%r14, %r14
140126cbe:     	jne	0x140126cc8 <.text+0x125cc8>
140126cc0:     	movq	0xa0(%rsp), %r14
140126cc8:     	movq	0x438(%rsp), %r13
140126cd0:     	movq	0x80(%rsp), %r12
140126cd8:     	movq	(%r14), %rax
140126cdb:     	movq	0x10(%r14), %r15
140126cdf:     	subq	%r15, %rax
140126ce2:     	cmpq	$0x67, %rax
140126ce6:     	jbe	0x140127175 <.text+0x126175>
140126cec:     	movq	0x8(%r14), %rax
140126cf0:     	leaq	0x1051b9(%rip), %rcx    # 0x14022beb0 <.text+0x22aeb0>
140126cf7:     	movq	%rcx, (%rax,%r15)
140126cfb:     	movups	(%r13), %xmm0
140126d00:     	movups	0x10(%r13), %xmm1
140126d05:     	movups	%xmm0, 0x8(%rax,%r15)
140126d0b:     	movups	%xmm1, 0x18(%rax,%r15)
140126d11:     	movb	$0x2, 0x28(%rax,%r15)
140126d17:     	movups	0xb5(%rsp), %xmm0
140126d1f:     	movups	0xc5(%rsp), %xmm1
140126d27:     	movups	0xd0(%rsp), %xmm2
140126d2f:     	movups	%xmm0, 0x29(%rax,%r15)
140126d35:     	movups	%xmm1, 0x39(%rax,%r15)
140126d3b:     	movups	%xmm2, 0x44(%rax,%r15)
140126d41:     	movl	$0x0, 0x54(%rax,%r15)
140126d4a:     	movb	$0x0, 0x58(%rax,%r15)
140126d50:     	movq	%r12, 0x60(%rax,%r15)
140126d55:     	addq	$0x68, %r15
140126d59:     	movq	%r15, 0x10(%r14)
140126d5d:     	leaq	0xe0(%rsp), %r15
140126d65:     	movq	%r15, %rcx
140126d68:     	callq	0x140012180 <.text+0x11180>
140126d6d:     	movb	$0x0, 0x148(%rsp)
140126d75:     	leaq	0x80(%rsp), %rcx
140126d7d:     	movq	%r15, %rdx
140126d80:     	callq	0x1401a3c10 <.text+0x1a2c10>
140126d85:     	movaps	%xmm7, 0x270(%rsp)
140126d8d:     	movl	$0x3f800000, 0x280(%rsp) # imm = 0x3F800000
140126d98:     	movups	%xmm7, 0x284(%rsp)
140126da0:     	movl	$0x3f800000, 0x294(%rsp) # imm = 0x3F800000
140126dab:     	movups	%xmm7, 0x298(%rsp)
140126db3:     	movl	$0x3f800000, 0x2a8(%rsp) # imm = 0x3F800000
140126dbe:     	movups	%xmm7, 0x2ac(%rsp)
140126dc6:     	movl	$0x3f800000, 0x2bc(%rsp) # imm = 0x3F800000
140126dd1:     	movq	(%r14), %rax
140126dd4:     	movq	0x10(%r14), %r15
140126dd8:     	subq	%r15, %rax
140126ddb:     	cmpq	$0x67, %rax
140126ddf:     	jbe	0x14012719a <.text+0x12619a>
140126de5:     	movq	0x8(%r14), %rax
140126de9:     	leaq	0x104750(%rip), %rcx    # 0x14022b540 <.text+0x22a540>
140126df0:     	movq	%rcx, (%rax,%r15)
140126df4:     	movq	%r12, 0x8(%rax,%r15)
140126df9:     	movaps	0x270(%rsp), %xmm0
140126e01:     	movaps	0x280(%rsp), %xmm1
140126e09:     	movaps	0x290(%rsp), %xmm2
140126e11:     	movaps	0x2a0(%rsp), %xmm3
140126e19:     	movups	%xmm0, 0x10(%rax,%r15)
140126e1f:     	movups	%xmm1, 0x20(%rax,%r15)
140126e25:     	movups	%xmm2, 0x30(%rax,%r15)
140126e2b:     	movups	%xmm3, 0x40(%rax,%r15)
140126e31:     	movaps	0x2b0(%rsp), %xmm0
140126e39:     	movups	%xmm0, 0x50(%rax,%r15)
140126e3f:     	movb	$0x0, 0x60(%rax,%r15)
140126e45:     	addq	$0x68, %r15
140126e49:     	movq	%r15, 0x10(%r14)
140126e4d:     	movaps	%xmm6, 0x2c0(%rsp)
140126e55:     	movss	0x5c4650f(%rip), %xmm6  # 0x145d6d36c
140126e5d:     	testq	%rsi, %rsi
140126e60:     	js	0x14012703f <.text+0x12603f>
140126e66:     	je	0x14012704f <.text+0x12604f>
140126e6c:     	callq	0x140002200 <.text+0x1200>
140126e71:     	movl	$0x1, %r15d
140126e77:     	movl	$0x1, %edx
140126e7c:     	movq	%rsi, %rcx
140126e7f:     	callq	0x1400021c0 <.text+0x11c0>
140126e84:     	testq	%rax, %rax
140126e87:     	je	0x140127042 <.text+0x126042>
140126e8d:     	movq	%rax, %r14
140126e90:     	movq	%rax, %rcx
140126e93:     	movq	%rbx, %rdx
140126e96:     	movq	%rsi, %r8
140126e99:     	callq	0x145bc977b <.text+0x5bc877b>
140126e9e:     	cmpb	$0x1, (%rdi)
140126ea1:     	jne	0x14012705e <.text+0x12605e>
140126ea7:     	movl	0x1(%rdi), %eax
140126eaa:     	movl	0x4(%rdi), %ecx
140126ead:     	movl	%ecx, 0x2b(%rsp)
140126eb1:     	movl	%eax, 0x28(%rsp)
140126eb5:     	movq	0x8(%rdi), %rax
140126eb9:     	movzbl	0x10(%rdi), %ecx
140126ebd:     	movb	$0x1, %dl
140126ebf:     	jmp	0x14012706e <.text+0x12606e>
140126ec4:     	movups	0x5c83451(%rip), %xmm0  # 0x145daa31c
140126ecb:     	movaps	%xmm0, 0x30(%rsp)
140126ed0:     	movl	$0x3f800000, 0x40(%rsp) # imm = 0x3F800000
140126ed8:     	movups	%xmm0, 0x44(%rsp)
140126edd:     	movl	$0x3f800000, 0x54(%rsp) # imm = 0x3F800000
140126ee5:     	movups	%xmm0, 0x58(%rsp)
140126eea:     	movl	$0x3f800000, 0x68(%rsp) # imm = 0x3F800000
140126ef2:     	movups	%xmm0, 0x6c(%rsp)
140126ef7:     	movl	$0x3f800000, 0x7c(%rsp) # imm = 0x3F800000
140126eff:     	movq	0x70(%rsp), %rax
140126f04:     	movq	%rax, 0x120(%rsp)
140126f0c:     	movl	0x78(%rsp), %eax
140126f10:     	movl	%eax, 0x128(%rsp)
140126f17:     	movl	0x7c(%rsp), %eax
140126f1b:     	movl	%eax, 0x12c(%rsp)
140126f22:     	movq	0x60(%rsp), %rax
140126f27:     	movq	%rax, 0x110(%rsp)
140126f2f:     	movl	0x68(%rsp), %eax
140126f33:     	movl	%eax, 0x118(%rsp)
140126f3a:     	movl	0x6c(%rsp), %eax
140126f3e:     	movl	%eax, 0x11c(%rsp)
140126f45:     	movaps	0x50(%rsp), %xmm1
140126f4a:     	movaps	%xmm1, 0x100(%rsp)
140126f52:     	movaps	0x40(%rsp), %xmm1
140126f57:     	movaps	%xmm1, 0xf0(%rsp)
140126f5f:     	movaps	%xmm0, 0xe0(%rsp)
140126f67:     	movaps	%xmm6, 0x130(%rsp)
140126f6f:     	movq	0x98(%rsp), %r14
140126f77:     	testq	%r14, %r14
140126f7a:     	jne	0x140126f84 <.text+0x125f84>
140126f7c:     	movq	0xa0(%rsp), %r14
140126f84:     	movq	0x80(%rsp), %r12
140126f8c:     	movq	(%r14), %rax
140126f8f:     	movq	0x10(%r14), %r15
140126f93:     	subq	%r15, %rax
140126f96:     	cmpq	$0x77, %rax
140126f9a:     	jbe	0x1401271bf <.text+0x1261bf>
140126fa0:     	movq	0x8(%r14), %rax
140126fa4:     	leaq	0x104845(%rip), %rcx    # 0x14022b7f0 <.text+0x22a7f0>
140126fab:     	movq	%rcx, (%rax,%r15)
140126faf:     	movaps	0xe0(%rsp), %xmm0
140126fb7:     	movaps	0xf0(%rsp), %xmm1
140126fbf:     	movaps	0x100(%rsp), %xmm2
140126fc7:     	movaps	0x110(%rsp), %xmm3
140126fcf:     	movups	%xmm0, 0x8(%rax,%r15)
140126fd5:     	movups	%xmm1, 0x18(%rax,%r15)
140126fdb:     	movups	%xmm2, 0x28(%rax,%r15)
140126fe1:     	movups	%xmm3, 0x38(%rax,%r15)
140126fe7:     	movaps	0x120(%rsp), %xmm0
140126fef:     	movups	%xmm0, 0x48(%rax,%r15)
140126ff5:     	movaps	0x130(%rsp), %xmm0
140126ffd:     	movups	%xmm0, 0x58(%rax,%r15)
140127003:     	movl	$0x3ecccccd, 0x68(%rax,%r15) # imm = 0x3ECCCCCD
14012700c:     	movb	$0x0, 0x6c(%rax,%r15)
140127012:     	movq	%r12, 0x70(%rax,%r15)
140127017:     	addq	$0x78, %r15
14012701b:     	movq	%r15, 0x10(%r14)
14012701f:     	movups	0x5c832b6(%rip), %xmm0  # 0x145daa2dc
140127026:     	movaps	%xmm0, 0x2c0(%rsp)
14012702e:     	movss	0x5c4671e(%rip), %xmm6  # 0x145d6d754
140127036:     	testq	%rsi, %rsi
140127039:     	jns	0x140126e66 <.text+0x125e66>
14012703f:     	xorl	%r15d, %r15d
140127042:     	movq	%r15, %rcx
140127045:     	movq	%rsi, %rdx
140127048:     	callq	0x145d6944b <.text+0x5d6844b>
14012704d:     	ud2
14012704f:     	movl	$0x1, %r14d
140127055:     	cmpb	$0x1, (%rdi)
140127058:     	je	0x140126ea7 <.text+0x125ea7>
14012705e:     	movq	0x8(%rdi), %rax
140127062:     	lock
140127063:     	incq	(%rax)
140127066:     	jle	0x1401271e4 <.text+0x1261e4>
14012706c:     	xorl	%edx, %edx
14012706e:     	movq	%rsi, 0xe0(%rsp)
140127076:     	movq	%r14, 0xe8(%rsp)
14012707e:     	movq	%rsi, 0xf0(%rsp)
140127086:     	movq	$0x0, 0xf8(%rsp)
140127092:     	movq	$0x4, 0x100(%rsp)
14012709e:     	movq	$0x0, 0x108(%rsp)
1401270aa:     	movb	%dl, 0x110(%rsp)
1401270b1:     	movl	0x28(%rsp), %edx
1401270b5:     	movl	0x2b(%rsp), %r8d
1401270ba:     	movl	%edx, 0x111(%rsp)
1401270c1:     	movl	%r8d, 0x114(%rsp)
1401270c9:     	movq	%rax, 0x118(%rsp)
1401270d1:     	movq	%rcx, 0x120(%rsp)
1401270d9:     	movl	$0x41700000, 0x128(%rsp) # imm = 0x41700000
1401270e4:     	movw	$0x190, 0x12c(%rsp)     # imm = 0x190
1401270ee:     	movb	$0x1, 0x12e(%rsp)
1401270f6:     	movaps	0x2c0(%rsp), %xmm0
1401270fe:     	movups	%xmm0, 0x130(%rsp)
140127106:     	movss	%xmm6, 0x140(%rsp)
14012710f:     	movups	0x5c471c2(%rip), %xmm0  # 0x145d6e2d8
140127116:     	movups	%xmm0, 0x144(%rsp)
14012711e:     	movl	0x5c471c4(%rip), %eax   # 0x145d6e2e8
140127124:     	movl	%eax, 0x154(%rsp)
14012712b:     	movsd	0x5c4609d(%rip), %xmm0  # 0x145d6d1d0
140127133:     	movsd	%xmm0, 0x158(%rsp)
14012713c:     	leaq	0x80(%rsp), %rcx
140127144:     	leaq	0xe0(%rsp), %rdx
14012714c:     	callq	0x1401a4e60 <.text+0x1a3e60>
140127151:     	movaps	0x3a0(%rsp), %xmm6
140127159:     	movaps	0x3b0(%rsp), %xmm7
140127161:     	addq	$0x3c8, %rsp            # imm = 0x3C8
140127168:     	popq	%rbx
140127169:     	popq	%rbp
14012716a:     	popq	%rdi
14012716b:     	popq	%rsi
14012716c:     	popq	%r12
14012716e:     	popq	%r13
140127170:     	popq	%r14
140127172:     	popq	%r15
140127174:     	retq
140127175:     	movq	$0x1, 0x20(%rsp)
14012717e:     	movl	$0x68, %r8d
140127184:     	movl	$0x1, %r9d
14012718a:     	movq	%r14, %rcx
14012718d:     	movq	%r15, %rdx
140127190:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
140127195:     	jmp	0x140126cec <.text+0x125cec>
14012719a:     	movq	$0x1, 0x20(%rsp)
1401271a3:     	movl	$0x68, %r8d
1401271a9:     	movl	$0x1, %r9d
1401271af:     	movq	%r14, %rcx
1401271b2:     	movq	%r15, %rdx
1401271b5:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401271ba:     	jmp	0x140126de5 <.text+0x125de5>
1401271bf:     	movq	$0x1, 0x20(%rsp)
1401271c8:     	movl	$0x78, %r8d
1401271ce:     	movl	$0x1, %r9d
1401271d4:     	movq	%r14, %rcx
1401271d7:     	movq	%r15, %rdx
1401271da:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401271df:     	jmp	0x140126fa0 <.text+0x125fa0>
1401271e4:     	ud2

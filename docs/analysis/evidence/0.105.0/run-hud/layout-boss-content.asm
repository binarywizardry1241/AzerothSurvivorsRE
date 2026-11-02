
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401b6c20:     	pushq	%rbp
1401b6c21:     	pushq	%r15
1401b6c23:     	pushq	%r14
1401b6c25:     	pushq	%r12
1401b6c27:     	pushq	%rsi
1401b6c28:     	pushq	%rdi
1401b6c29:     	pushq	%rbx
1401b6c2a:     	subq	$0x5a0, %rsp            # imm = 0x5A0
1401b6c31:     	leaq	0x80(%rsp), %rbp
1401b6c39:     	movaps	%xmm14, 0x510(%rbp)
1401b6c41:     	movaps	%xmm13, 0x500(%rbp)
1401b6c49:     	movaps	%xmm12, 0x4f0(%rbp)
1401b6c51:     	movaps	%xmm11, 0x4e0(%rbp)
1401b6c59:     	movaps	%xmm10, 0x4d0(%rbp)
1401b6c61:     	movaps	%xmm9, 0x4c0(%rbp)
1401b6c69:     	movaps	%xmm8, 0x4b0(%rbp)
1401b6c71:     	movaps	%xmm7, 0x4a0(%rbp)
1401b6c78:     	movaps	%xmm6, 0x490(%rbp)
1401b6c7f:     	movq	$-0x2, 0x488(%rbp)
1401b6c8a:     	movq	%rdx, %rbx
1401b6c8d:     	movq	%rcx, %rsi
1401b6c90:     	movq	(%rcx), %r15
1401b6c93:     	movq	0x28(%rcx), %rax
1401b6c97:     	movq	%r15, 0x1a0(%rbp)
1401b6c9e:     	movups	0x8(%rcx), %xmm0
1401b6ca2:     	movups	%xmm0, 0x1a8(%rbp)
1401b6ca9:     	movups	0x18(%rcx), %xmm0
1401b6cad:     	movups	%xmm0, 0x1b8(%rbp)
1401b6cb4:     	movq	%rax, 0x1c8(%rbp)
1401b6cbb:     	movq	(%rdx), %rax
1401b6cbe:     	movq	(%rax), %r14
1401b6cc1:     	xorl	%ecx, %ecx
1401b6cc3:     	testq	%r14, %r14
1401b6cc6:     	sete	%r8b
1401b6cca:     	movq	0x8(%rdx), %rdx
1401b6cce:     	cmpb	$0x1, (%rdx)
1401b6cd1:     	jne	0x1401b6cf4 <.text+0x1b5cf4>
1401b6cd3:     	movl	0x1(%rdx), %eax
1401b6cd6:     	movl	0x4(%rdx), %r9d
1401b6cda:     	movl	%r9d, 0x483(%rbp)
1401b6ce1:     	movl	%eax, 0x480(%rbp)
1401b6ce7:     	movq	0x8(%rdx), %rax
1401b6ceb:     	movzbl	0x10(%rdx), %edx
1401b6cef:     	movb	$0x1, %r9b
1401b6cf2:     	jmp	0x1401b6d05 <.text+0x1b5d05>
1401b6cf4:     	movq	0x8(%rdx), %rax
1401b6cf8:     	lock
1401b6cf9:     	incq	(%rax)
1401b6cfc:     	jle	0x1401b75ae <.text+0x1b65ae>
1401b6d02:     	xorl	%r9d, %r9d
1401b6d05:     	leaq	0x1a8(%rbp), %rdi
1401b6d0c:     	movb	%r8b, %cl
1401b6d0f:     	leaq	0x5c00fc2(%rip), %r8    # 0x145db7cd8
1401b6d16:     	movss	(%r8,%rcx,4), %xmm0
1401b6d1c:     	xorl	%r12d, %r12d
1401b6d1f:     	testq	%r14, %r14
1401b6d22:     	sete	%r12b
1401b6d26:     	movups	0x5c01b2b(%rip), %xmm1  # 0x145db8858
1401b6d2d:     	movups	%xmm1, 0x401(%rbp)
1401b6d34:     	movl	$0x3f800000, 0x411(%rbp) # imm = 0x3F800000
1401b6d3e:     	movq	%r14, 0x1f8(%rbp)
1401b6d45:     	movq	$0x0, 0x200(%rbp)
1401b6d50:     	movq	$0x1, 0x208(%rbp)
1401b6d5b:     	xorps	%xmm6, %xmm6
1401b6d5e:     	movups	%xmm6, 0x210(%rbp)
1401b6d65:     	movq	$0x4, 0x220(%rbp)
1401b6d70:     	movq	$0x0, 0x228(%rbp)
1401b6d7b:     	movb	%r9b, 0x230(%rbp)
1401b6d82:     	movl	0x480(%rbp), %ecx
1401b6d88:     	movl	0x483(%rbp), %r8d
1401b6d8f:     	movl	%ecx, 0x231(%rbp)
1401b6d95:     	movl	%r8d, 0x234(%rbp)
1401b6d9c:     	movq	%rax, 0x238(%rbp)
1401b6da3:     	movq	%rdx, 0x240(%rbp)
1401b6daa:     	movss	%xmm0, 0x248(%rbp)
1401b6db2:     	movw	$0x190, 0x24c(%rbp)     # imm = 0x190
1401b6dbb:     	movb	$0x1, 0x24e(%rbp)
1401b6dc2:     	movups	0x400(%rbp), %xmm0
1401b6dc9:     	movups	%xmm0, 0x24f(%rbp)
1401b6dd0:     	movq	0x40d(%rbp), %rax
1401b6dd7:     	movq	%rax, 0x25c(%rbp)
1401b6dde:     	movl	0x5bb7504(%rip), %eax   # 0x145d6e2e8
1401b6de4:     	movl	%eax, 0x274(%rbp)
1401b6dea:     	movups	0x5bb74e7(%rip), %xmm0  # 0x145d6e2d8
1401b6df1:     	movups	%xmm0, 0x264(%rbp)
1401b6df8:     	movsd	0x5bb63d0(%rip), %xmm0  # 0x145d6d1d0
1401b6e00:     	movsd	%xmm0, 0x278(%rbp)
1401b6e08:     	movq	%r15, 0x1f0(%rbp)
1401b6e0f:     	leaq	-0x30(%rbp), %rcx
1401b6e13:     	leaq	0x1f0(%rbp), %r8
1401b6e1a:     	movq	%rdi, %rdx
1401b6e1d:     	callq	0x140191190 <.text+0x190190>
1401b6e22:     	movq	0x10(%rbx), %rax
1401b6e26:     	movss	(%rax), %xmm0
1401b6e2a:     	leaq	0x5c00eaf(%rip), %rax   # 0x145db7ce0
1401b6e31:     	movss	(%rax,%r12,4), %xmm1
1401b6e37:     	movw	$0x101, 0x354(%rbp)     # imm = 0x101
1401b6e40:     	movb	$0x1, 0x344(%rbp)
1401b6e47:     	movups	%xmm6, 0x258(%rbp)
1401b6e4e:     	movups	%xmm6, 0x268(%rbp)
1401b6e55:     	movl	$0x1, 0x278(%rbp)
1401b6e5f:     	movss	%xmm0, 0x27c(%rbp)
1401b6e67:     	movl	$0x1, 0x280(%rbp)
1401b6e71:     	movss	%xmm1, 0x284(%rbp)
1401b6e79:     	movq	$0x0, 0x250(%rbp)
1401b6e84:     	movups	%xmm6, 0x288(%rbp)
1401b6e8b:     	movups	%xmm6, 0x298(%rbp)
1401b6e92:     	movl	$0x0, 0x368(%rbp)
1401b6e9c:     	movw	$0x0, 0x36c(%rbp)
1401b6ea5:     	movups	0x5c01a8c(%rip), %xmm6  # 0x145db8938
1401b6eac:     	movups	%xmm6, 0x2a8(%rbp)
1401b6eb3:     	movups	0x5c01a8e(%rip), %xmm7  # 0x145db8948
1401b6eba:     	movups	%xmm7, 0x2b8(%rbp)
1401b6ec1:     	movups	0x5c01a9f(%rip), %xmm8  # 0x145db8968
1401b6ec9:     	movups	%xmm8, 0x2d8(%rbp)
1401b6ed1:     	movups	0x5c01a7f(%rip), %xmm10 # 0x145db8958
1401b6ed9:     	movups	%xmm10, 0x2c8(%rbp)
1401b6ee1:     	movaps	0x5bb63a8(%rip), %xmm0  # 0x145d6d290
1401b6ee8:     	movups	%xmm0, 0x2e8(%rbp)
1401b6eef:     	movups	%xmm0, 0x2f8(%rbp)
1401b6ef6:     	movaps	0x5bb6743(%rip), %xmm0  # 0x145d6d640
1401b6efd:     	movups	%xmm0, 0x308(%rbp)
1401b6f04:     	movups	%xmm0, 0x318(%rbp)
1401b6f0b:     	movb	$0x0, 0x366(%rbp)
1401b6f12:     	movl	$0x0, 0x362(%rbp)
1401b6f1c:     	movq	$0x0, 0x348(%rbp)
1401b6f27:     	movl	$0x3f800000, 0x350(%rbp) # imm = 0x3F800000
1401b6f31:     	movaps	0x5bb6327(%rip), %xmm9  # 0x145d6d260
1401b6f39:     	movups	%xmm9, 0x328(%rbp)
1401b6f41:     	movl	$0x1, 0x338(%rbp)
1401b6f4b:     	movq	$0x0, 0x33c(%rbp)
1401b6f56:     	movb	$0x0, 0x367(%rbp)
1401b6f5d:     	movups	0x5c0191b(%rip), %xmm11 # 0x145db8880
1401b6f65:     	movaps	%xmm11, 0x1f0(%rbp)
1401b6f6d:     	movq	$0x0, 0x200(%rbp)
1401b6f78:     	movups	0x5c01918(%rip), %xmm12 # 0x145db8898
1401b6f80:     	movups	%xmm12, 0x208(%rbp)
1401b6f88:     	movq	$0x0, 0x218(%rbp)
1401b6f93:     	movups	0x5c01915(%rip), %xmm13 # 0x145db88b0
1401b6f9b:     	movaps	%xmm13, 0x220(%rbp)
1401b6fa3:     	movq	$0x0, 0x230(%rbp)
1401b6fae:     	movups	0x5c01912(%rip), %xmm14 # 0x145db88c8
1401b6fb6:     	movups	%xmm14, 0x238(%rbp)
1401b6fbe:     	movq	$0x0, 0x248(%rbp)
1401b6fc9:     	movw	$0x0, 0x35a(%rbp)
1401b6fd2:     	movl	$0x10000, 0x356(%rbp)   # imm = 0x10000
1401b6fdc:     	movw	$0x0, 0x360(%rbp)
1401b6fe5:     	movl	$0x10000, 0x35c(%rbp)   # imm = 0x10000
1401b6fef:     	movups	0x5c01b52(%rip), %xmm0  # 0x145db8b48
1401b6ff6:     	movaps	%xmm0, 0x400(%rbp)
1401b6ffd:     	movl	$0x3f800000, 0x410(%rbp) # imm = 0x3F800000
1401b7007:     	movups	%xmm0, 0x414(%rbp)
1401b700e:     	movl	$0x3f800000, 0x424(%rbp) # imm = 0x3F800000
1401b7018:     	movups	%xmm0, 0x428(%rbp)
1401b701f:     	movl	$0x3f800000, 0x438(%rbp) # imm = 0x3F800000
1401b7029:     	movups	%xmm0, 0x43c(%rbp)
1401b7030:     	movl	$0x3f800000, 0x44c(%rbp) # imm = 0x3F800000
1401b703a:     	movups	0x5c019bf(%rip), %xmm0  # 0x145db8a00
1401b7041:     	movaps	%xmm0, 0x450(%rbp)
1401b7048:     	movl	$0x3f800000, 0x460(%rbp) # imm = 0x3F800000
1401b7052:     	leaq	0x1d0(%rbp), %rcx
1401b7059:     	leaq	0x450(%rbp), %rdx
1401b7060:     	callq	0x144c67100 <.text+0x4c66100>
1401b7065:     	nop
1401b7066:     	movaps	0x1d0(%rbp), %xmm0
1401b706d:     	movups	%xmm0, -0x2c(%rbp)
1401b7071:     	movl	$0x1, -0x30(%rbp)
1401b7078:     	movl	$0x0, 0x48(%rsp)
1401b7080:     	movl	$0x1, 0x40(%rsp)
1401b7088:     	movl	$0x3f800000, 0x38(%rsp) # imm = 0x3F800000
1401b7090:     	movl	$0x1, 0x30(%rsp)
1401b7098:     	movl	$0x0, 0x28(%rsp)
1401b70a0:     	movl	$0x1, 0x20(%rsp)
1401b70a8:     	leaq	0x1d0(%rbp), %rcx
1401b70af:     	leaq	-0x30(%rbp), %rdx
1401b70b3:     	xorps	%xmm3, %xmm3
1401b70b6:     	movl	$0x1, %r8d
1401b70bc:     	callq	0x142633750 <.text+0x2632750>
1401b70c1:     	nop
1401b70c2:     	leaq	-0x30(%rbp), %rbx
1401b70c6:     	leaq	0x1f0(%rbp), %rdx
1401b70cd:     	movl	$0x180, %r8d            # imm = 0x180
1401b70d3:     	movq	%rbx, %rcx
1401b70d6:     	callq	0x145bc977b <.text+0x5bc877b>
1401b70db:     	movaps	0x400(%rbp), %xmm0
1401b70e2:     	movaps	0x410(%rbp), %xmm1
1401b70e9:     	movaps	0x420(%rbp), %xmm2
1401b70f0:     	movaps	0x430(%rbp), %xmm3
1401b70f7:     	movups	%xmm0, 0x150(%rbp)
1401b70fe:     	movups	%xmm1, 0x160(%rbp)
1401b7105:     	movups	%xmm2, 0x170(%rbp)
1401b710c:     	movups	%xmm3, 0x180(%rbp)
1401b7113:     	movaps	0x440(%rbp), %xmm0
1401b711a:     	movups	%xmm0, 0x190(%rbp)
1401b7121:     	movups	0x1d0(%rbp), %xmm0
1401b7128:     	movups	%xmm0, 0x454(%rbp)
1401b712f:     	movq	0x1e0(%rbp), %rax
1401b7136:     	movq	%rax, 0x464(%rbp)
1401b713d:     	leaq	0x1f8(%rbp), %rcx
1401b7144:     	movl	$0x1d0, %r8d            # imm = 0x1D0
1401b714a:     	movq	%rbx, %rdx
1401b714d:     	callq	0x145bc977b <.text+0x5bc877b>
1401b7152:     	movl	$0x0, 0x3c8(%rbp)
1401b715c:     	movaps	0x5c00b8d(%rip), %xmm0  # 0x145db7cf0
1401b7163:     	movups	%xmm0, 0x3cc(%rbp)
1401b716a:     	movups	0x450(%rbp), %xmm0
1401b7171:     	movups	0x45c(%rbp), %xmm1
1401b7178:     	movups	%xmm0, 0x3dc(%rbp)
1401b717f:     	movups	%xmm1, 0x3e8(%rbp)
1401b7186:     	movq	%r15, 0x1f0(%rbp)
1401b718d:     	leaq	0x400(%rbp), %rcx
1401b7194:     	leaq	0x1f0(%rbp), %r8
1401b719b:     	movq	%rdi, %rdx
1401b719e:     	callq	0x14018aa00 <.text+0x189a00>
1401b71a3:     	movw	$0x0, 0x354(%rbp)
1401b71ac:     	movb	$0x1, 0x344(%rbp)
1401b71b3:     	xorps	%xmm0, %xmm0
1401b71b6:     	movups	%xmm0, 0x258(%rbp)
1401b71bd:     	movups	%xmm0, 0x268(%rbp)
1401b71c4:     	movaps	0x5bb6635(%rip), %xmm1  # 0x145d6d800
1401b71cb:     	movups	%xmm1, 0x278(%rbp)
1401b71d2:     	movq	$0x0, 0x250(%rbp)
1401b71dd:     	movups	%xmm0, 0x288(%rbp)
1401b71e4:     	movups	%xmm0, 0x298(%rbp)
1401b71eb:     	movl	$0x0, 0x368(%rbp)
1401b71f5:     	movw	$0x0, 0x36c(%rbp)
1401b71fe:     	movups	%xmm6, 0x2a8(%rbp)
1401b7205:     	movups	%xmm7, 0x2b8(%rbp)
1401b720c:     	movups	%xmm10, 0x2c8(%rbp)
1401b7214:     	movups	%xmm8, 0x2d8(%rbp)
1401b721c:     	movups	0x5c01765(%rip), %xmm0  # 0x145db8988
1401b7223:     	movups	%xmm0, 0x2f8(%rbp)
1401b722a:     	movups	0x5c01747(%rip), %xmm0  # 0x145db8978
1401b7231:     	movups	%xmm0, 0x2e8(%rbp)
1401b7238:     	movups	0x5c01769(%rip), %xmm0  # 0x145db89a8
1401b723f:     	movups	%xmm0, 0x318(%rbp)
1401b7246:     	movups	0x5c0174b(%rip), %xmm0  # 0x145db8998
1401b724d:     	movups	%xmm0, 0x308(%rbp)
1401b7254:     	movw	$0x0, 0x366(%rbp)
1401b725d:     	movl	$0x0, 0x362(%rbp)
1401b7267:     	movq	$0x0, 0x348(%rbp)
1401b7272:     	movl	$0x3f800000, 0x350(%rbp) # imm = 0x3F800000
1401b727c:     	movups	%xmm9, 0x328(%rbp)
1401b7284:     	movl	$0x1, 0x338(%rbp)
1401b728e:     	movq	$0x0, 0x33c(%rbp)
1401b7299:     	movaps	%xmm11, 0x1f0(%rbp)
1401b72a1:     	movq	$0x0, 0x200(%rbp)
1401b72ac:     	movups	%xmm12, 0x208(%rbp)
1401b72b4:     	movq	$0x0, 0x218(%rbp)
1401b72bf:     	movaps	%xmm13, 0x220(%rbp)
1401b72c7:     	movq	$0x0, 0x230(%rbp)
1401b72d2:     	movups	%xmm14, 0x238(%rbp)
1401b72da:     	movq	$0x0, 0x248(%rbp)
1401b72e5:     	movw	$0x0, 0x35a(%rbp)
1401b72ee:     	movl	$0x10000, 0x356(%rbp)   # imm = 0x10000
1401b72f8:     	movw	$0x0, 0x360(%rbp)
1401b7301:     	movl	$0x10000, 0x35c(%rbp)   # imm = 0x10000
1401b730b:     	callq	0x140002200 <.text+0x1200>
1401b7310:     	movl	$0x40, %ecx
1401b7315:     	movl	$0x4, %edx
1401b731a:     	callq	0x1400021c0 <.text+0x11c0>
1401b731f:     	testq	%rax, %rax
1401b7322:     	je	0x1401b759e <.text+0x1b659e>
1401b7328:     	movq	%rax, 0x478(%rbp)
1401b732f:     	movaps	0x5c009ca(%rip), %xmm0  # 0x145db7d00
1401b7336:     	movups	%xmm0, -0x2c(%rbp)
1401b733a:     	movl	$0x0, -0x30(%rbp)
1401b7341:     	leaq	0x450(%rbp), %rcx
1401b7348:     	leaq	-0x30(%rbp), %rdx
1401b734c:     	callq	0x144c67100 <.text+0x4c66100>
1401b7351:     	nop
1401b7352:     	movaps	0x450(%rbp), %xmm6
1401b7359:     	movaps	0x5c009b0(%rip), %xmm0  # 0x145db7d10
1401b7360:     	movups	%xmm0, -0x2c(%rbp)
1401b7364:     	movl	$0x0, -0x30(%rbp)
1401b736b:     	leaq	0x450(%rbp), %rcx
1401b7372:     	leaq	-0x30(%rbp), %rdx
1401b7376:     	callq	0x144c67100 <.text+0x4c66100>
1401b737b:     	nop
1401b737c:     	movaps	0x450(%rbp), %xmm0
1401b7383:     	movq	0x478(%rbp), %rbx
1401b738a:     	movl	$0x0, (%rbx)
1401b7390:     	movl	$0x1, 0x8(%rbx)
1401b7397:     	movups	%xmm6, 0xc(%rbx)
1401b739b:     	movq	$0x3f000000, 0x1c(%rbx) # imm = 0x3F000000
1401b73a3:     	movl	$0x1, 0x28(%rbx)
1401b73aa:     	movups	%xmm0, 0x2c(%rbx)
1401b73ae:     	movl	$0x3f000000, 0x3c(%rbx) # imm = 0x3F000000
1401b73b5:     	callq	0x140002200 <.text+0x1200>
1401b73ba:     	movl	$0x48, %ecx
1401b73bf:     	movl	$0x8, %edx
1401b73c4:     	callq	0x1400021c0 <.text+0x11c0>
1401b73c9:     	testq	%rax, %rax
1401b73cc:     	je	0x1401b758c <.text+0x1b658c>
1401b73d2:     	movq	%rax, %rdi
1401b73d5:     	movq	$0x2, 0x8(%rax)
1401b73dd:     	movq	%rbx, 0x10(%rax)
1401b73e1:     	movq	$0x2, 0x18(%rax)
1401b73e9:     	movl	$0x40490fdb, 0x20(%rax) # imm = 0x40490FDB
1401b73f0:     	movb	$0x0, 0x24(%rax)
1401b73f4:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
1401b73fe:     	movq	%rax, (%rdi)
1401b7401:     	leaq	-0x30(%rbp), %rcx
1401b7405:     	leaq	0x1f0(%rbp), %rdx
1401b740c:     	movl	$0x180, %r8d            # imm = 0x180
1401b7412:     	callq	0x145bc977b <.text+0x5bc877b>
1401b7417:     	movq	$0x1, 0x158(%rbp)
1401b7422:     	movq	%rdi, 0x160(%rbp)
1401b7429:     	movq	$0x1, 0x168(%rbp)
1401b7434:     	movq	%r14, 0x150(%rbp)
1401b743b:     	movq	0x400(%rbp), %rax
1401b7442:     	movq	0x410(%rbp), %rcx
1401b7449:     	movq	%rax, 0x170(%rbp)
1401b7450:     	movb	$0x1, 0x487(%rbp)
1401b7457:     	callq	0x144e07d20 <.text+0x4e06d20>
1401b745c:     	nop
1401b745d:     	movq	%rax, %rdi
1401b7460:     	movq	0x418(%rbp), %rbx
1401b7467:     	testq	%rbx, %rbx
1401b746a:     	je	0x1401b74be <.text+0x1b64be>
1401b746c:     	leaq	0x1f0(%rbp), %rcx
1401b7473:     	leaq	-0x30(%rbp), %rdx
1401b7477:     	movl	$0x1a8, %r8d            # imm = 0x1A8
1401b747d:     	callq	0x145bc977b <.text+0x5bc877b>
1401b7482:     	movq	%rdi, 0x398(%rbp)
1401b7489:     	movq	(%rbx), %rax
1401b748c:     	movq	0x10(%rbx), %r14
1401b7490:     	subq	%r14, %rax
1401b7493:     	cmpq	$0x1b7, %rax            # imm = 0x1B7
1401b7499:     	ja	0x1401b74f8 <.text+0x1b64f8>
1401b749b:     	movq	$0x1, 0x20(%rsp)
1401b74a4:     	movl	$0x1b8, %r8d            # imm = 0x1B8
1401b74aa:     	movl	$0x1, %r9d
1401b74b0:     	movq	%rbx, %rcx
1401b74b3:     	movq	%r14, %rdx
1401b74b6:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401b74bb:     	nop
1401b74bc:     	jmp	0x1401b74f8 <.text+0x1b64f8>
1401b74be:     	movq	0x420(%rbp), %rbx
1401b74c5:     	leaq	0x1f0(%rbp), %rcx
1401b74cc:     	leaq	-0x30(%rbp), %rdx
1401b74d0:     	movl	$0x1a8, %r8d            # imm = 0x1A8
1401b74d6:     	callq	0x145bc977b <.text+0x5bc877b>
1401b74db:     	movq	%rdi, 0x398(%rbp)
1401b74e2:     	movq	(%rbx), %rax
1401b74e5:     	movq	0x10(%rbx), %r14
1401b74e9:     	subq	%r14, %rax
1401b74ec:     	cmpq	$0x1b7, %rax            # imm = 0x1B7
1401b74f2:     	jbe	0x1401b75b0 <.text+0x1b65b0>
1401b74f8:     	movq	0x8(%rbx), %r15
1401b74fc:     	leaq	0x735ed(%rip), %rax     # 0x14022aaf0 <.text+0x229af0>
1401b7503:     	movq	%rax, (%r15,%r14)
1401b7507:     	leaq	(%r15,%r14), %rcx
1401b750b:     	addq	$0x8, %rcx
1401b750f:     	leaq	-0x30(%rbp), %rdx
1401b7513:     	movl	$0x1a8, %r8d            # imm = 0x1A8
1401b7519:     	callq	0x145bc977b <.text+0x5bc877b>
1401b751e:     	movq	%rdi, 0x1b0(%r15,%r14)
1401b7526:     	addq	$0x1b8, %r14            # imm = 0x1B8
1401b752d:     	movq	%r14, 0x10(%rbx)
1401b7531:     	movq	%rsi, %rax
1401b7534:     	movaps	0x490(%rbp), %xmm6
1401b753b:     	movaps	0x4a0(%rbp), %xmm7
1401b7542:     	movaps	0x4b0(%rbp), %xmm8
1401b754a:     	movaps	0x4c0(%rbp), %xmm9
1401b7552:     	movaps	0x4d0(%rbp), %xmm10
1401b755a:     	movaps	0x4e0(%rbp), %xmm11
1401b7562:     	movaps	0x4f0(%rbp), %xmm12
1401b756a:     	movaps	0x500(%rbp), %xmm13
1401b7572:     	movaps	0x510(%rbp), %xmm14
1401b757a:     	addq	$0x5a0, %rsp            # imm = 0x5A0
1401b7581:     	popq	%rbx
1401b7582:     	popq	%rdi
1401b7583:     	popq	%rsi
1401b7584:     	popq	%r12
1401b7586:     	popq	%r14
1401b7588:     	popq	%r15
1401b758a:     	popq	%rbp
1401b758b:     	retq
1401b758c:     	movl	$0x8, %ecx
1401b7591:     	movl	$0x48, %edx
1401b7596:     	callq	0x145d69431 <.text+0x5d68431>
1401b759b:     	nop
1401b759c:     	jmp	0x1401b75ae <.text+0x1b65ae>
1401b759e:     	movl	$0x4, %ecx
1401b75a3:     	movl	$0x40, %edx
1401b75a8:     	callq	0x145d69431 <.text+0x5d68431>
1401b75ad:     	nop
1401b75ae:     	ud2
1401b75b0:     	movq	$0x1, 0x20(%rsp)
1401b75b9:     	movl	$0x1b8, %r8d            # imm = 0x1B8
1401b75bf:     	movl	$0x1, %r9d
1401b75c5:     	movq	%rbx, %rcx
1401b75c8:     	movq	%r14, %rdx
1401b75cb:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1401b75d0:     	nop
1401b75d1:     	jmp	0x1401b74f8 <.text+0x1b64f8>

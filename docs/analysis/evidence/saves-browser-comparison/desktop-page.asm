
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140279c80:     	pushq	%rbp
140279c81:     	pushq	%r15
140279c83:     	pushq	%r14
140279c85:     	pushq	%r13
140279c87:     	pushq	%r12
140279c89:     	pushq	%rsi
140279c8a:     	pushq	%rdi
140279c8b:     	pushq	%rbx
140279c8c:     	subq	$0x528, %rsp            # imm = 0x528
140279c93:     	leaq	0x80(%rsp), %rbp
140279c9b:     	movaps	%xmm15, 0x490(%rbp)
140279ca3:     	movaps	%xmm14, 0x480(%rbp)
140279cab:     	movaps	%xmm13, 0x470(%rbp)
140279cb3:     	movaps	%xmm12, 0x460(%rbp)
140279cbb:     	movaps	%xmm11, 0x450(%rbp)
140279cc3:     	movaps	%xmm10, 0x440(%rbp)
140279ccb:     	movaps	%xmm9, 0x430(%rbp)
140279cd3:     	movaps	%xmm8, 0x420(%rbp)
140279cdb:     	movaps	%xmm7, 0x410(%rbp)
140279ce2:     	movaps	%xmm6, 0x400(%rbp)
140279ce9:     	movq	$-0x2, 0x3f8(%rbp)
140279cf4:     	movq	%r9, %rbx
140279cf7:     	movq	%r8, %r15
140279cfa:     	movq	%rdx, %rdi
140279cfd:     	movq	%rcx, %rsi
140279d00:     	leaq	0x56d8d33(%rip), %rcx   # 0x145952a3a
140279d07:     	movl	$0x13, %edx
140279d0c:     	callq	0x145457c00 <.text+0x5456c00>
140279d11:     	movq	%rdx, %r12
140279d14:     	testq	%rdx, %rdx
140279d17:     	jns	0x140279d29 <.text+0x278d29>
140279d19:     	xorl	%r13d, %r13d
140279d1c:     	movq	%r13, %rcx
140279d1f:     	movq	%r12, %rdx
140279d22:     	callq	0x14590379b <.text+0x590279b>
140279d27:     	ud2
140279d29:     	movq	%rbx, -0x50(%rbp)
140279d2d:     	je	0x140279d85 <.text+0x278d85>
140279d2f:     	movq	%rax, %rbx
140279d32:     	callq	0x140002200 <.text+0x1200>
140279d37:     	movl	$0x1, %r13d
140279d3d:     	movl	$0x1, %edx
140279d42:     	movq	%r12, %rcx
140279d45:     	callq	0x1400021c0 <.text+0x11c0>
140279d4a:     	testq	%rax, %rax
140279d4d:     	je	0x140279d1c <.text+0x278d1c>
140279d4f:     	movq	%rax, %r14
140279d52:     	movq	%rax, %rcx
140279d55:     	movq	%rbx, %rdx
140279d58:     	movq	%r12, %r8
140279d5b:     	callq	0x1457731ed <.text+0x57721ed>
140279d60:     	movzbl	(%rdi), %eax
140279d63:     	movb	%al, 0x3e0(%rbp)
140279d69:     	cmpb	$0x1, %al
140279d6b:     	jne	0x140279d98 <.text+0x278d98>
140279d6d:     	movl	0x1(%rdi), %eax
140279d70:     	movl	0x4(%rdi), %ecx
140279d73:     	movl	%ecx, -0x3d(%rbp)
140279d76:     	movl	%eax, -0x40(%rbp)
140279d79:     	movq	0x8(%rdi), %rax
140279d7d:     	movzbl	0x10(%rdi), %edx
140279d81:     	movb	$0x1, %cl
140279d83:     	jmp	0x140279da8 <.text+0x278da8>
140279d85:     	movl	$0x1, %r14d
140279d8b:     	movzbl	(%rdi), %eax
140279d8e:     	movb	%al, 0x3e0(%rbp)
140279d94:     	cmpb	$0x1, %al
140279d96:     	je	0x140279d6d <.text+0x278d6d>
140279d98:     	movq	0x8(%rdi), %rax
140279d9c:     	lock
140279d9d:     	incq	(%rax)
140279da0:     	jle	0x14027b111 <.text+0x27a111>
140279da6:     	xorl	%ecx, %ecx
140279da8:     	movl	-0x40(%rbp), %r8d
140279dac:     	movl	-0x3d(%rbp), %r9d
140279db0:     	movl	%r9d, 0x184(%rbp)
140279db7:     	movl	%r8d, 0x181(%rbp)
140279dbe:     	movups	0x56d8c8b(%rip), %xmm0  # 0x145952a50
140279dc5:     	movups	%xmm0, 0x3a9(%rbp)
140279dcc:     	movl	$0x3f800000, 0x3b9(%rbp) # imm = 0x3F800000
140279dd6:     	movq	(%rsi), %r8
140279dd9:     	leaq	0x8(%rsi), %rbx
140279ddd:     	movq	%r12, 0x150(%rbp)
140279de4:     	movq	%r14, 0x158(%rbp)
140279deb:     	movq	%r12, 0x160(%rbp)
140279df2:     	movq	$0x0, 0x168(%rbp)
140279dfd:     	movq	$0x4, 0x170(%rbp)
140279e08:     	movq	$0x0, 0x178(%rbp)
140279e13:     	movb	%cl, 0x180(%rbp)
140279e19:     	movq	%rax, 0x188(%rbp)
140279e20:     	movq	%rdx, 0x190(%rbp)
140279e27:     	movl	$0x41700000, 0x198(%rbp) # imm = 0x41700000
140279e31:     	movw	$0x190, 0x19c(%rbp)     # imm = 0x190
140279e3a:     	movb	$0x1, 0x19e(%rbp)
140279e41:     	movups	0x3a8(%rbp), %xmm0
140279e48:     	movups	%xmm0, 0x19f(%rbp)
140279e4f:     	movq	0x3b5(%rbp), %rax
140279e56:     	movq	%rax, 0x1ac(%rbp)
140279e5d:     	movups	0x569f30b(%rip), %xmm9  # 0x145919170
140279e65:     	movups	%xmm9, 0x1b4(%rbp)
140279e6d:     	movl	0x569f30d(%rip), %eax   # 0x145919180
140279e73:     	movl	%eax, 0x1c4(%rbp)
140279e79:     	movsd	0x569b94f(%rip), %xmm0  # 0x1459157d0
140279e81:     	movsd	%xmm0, 0x1c8(%rbp)
140279e89:     	movq	%r8, 0x148(%rbp)
140279e90:     	leaq	0x56d1d51(%rip), %r14   # 0x14594bbe8
140279e97:     	leaq	-0x40(%rbp), %r13
140279e9b:     	leaq	0x148(%rbp), %r8
140279ea2:     	movq	%r13, %rcx
140279ea5:     	movq	%rbx, %rdx
140279ea8:     	movq	%r14, %r9
140279eab:     	callq	0x1400dbfa0 <.text+0xdafa0>
140279eb0:     	xorps	%xmm0, %xmm0
140279eb3:     	movups	%xmm0, 0x1c8(%rbp)
140279eba:     	movups	%xmm0, 0x1b8(%rbp)
140279ec1:     	movups	%xmm0, 0x1e0(%rbp)
140279ec8:     	movups	%xmm0, 0x1f8(%rbp)
140279ecf:     	movups	0x56d83da(%rip), %xmm0  # 0x1459522b0
140279ed6:     	movaps	%xmm0, -0x40(%rbp)
140279eda:     	movq	$0x0, -0x30(%rbp)
140279ee2:     	movups	0x56d83df(%rip), %xmm0  # 0x1459522c8
140279ee9:     	movups	%xmm0, -0x28(%rbp)
140279eed:     	movq	$0x0, -0x18(%rbp)
140279ef5:     	movups	0x56d83e3(%rip), %xmm10 # 0x1459522e0
140279efd:     	movaps	%xmm10, -0x10(%rbp)
140279f02:     	movq	$0x0, (%rbp)
140279f0a:     	movups	0x56d83e6(%rip), %xmm11 # 0x1459522f8
140279f12:     	movups	%xmm11, 0x8(%rbp)
140279f17:     	movq	$0x0, 0x18(%rbp)
140279f1f:     	movq	(%rsi), %rax
140279f22:     	movq	0x10(%rbp), %rcx
140279f26:     	movq	%rcx, 0x1a0(%rbp)
140279f2d:     	movq	0x18(%rbp), %rcx
140279f31:     	movq	%rcx, 0x1a8(%rbp)
140279f38:     	movq	(%rbp), %rcx
140279f3c:     	movq	%rcx, 0x190(%rbp)
140279f43:     	movq	0x8(%rbp), %rcx
140279f47:     	movq	%rcx, 0x198(%rbp)
140279f4e:     	movaps	-0x40(%rbp), %xmm0
140279f52:     	movaps	-0x30(%rbp), %xmm1
140279f56:     	movaps	-0x20(%rbp), %xmm2
140279f5a:     	movaps	-0x10(%rbp), %xmm3
140279f5e:     	movups	%xmm3, 0x180(%rbp)
140279f65:     	movups	%xmm2, 0x170(%rbp)
140279f6c:     	movups	%xmm1, 0x160(%rbp)
140279f73:     	movups	%xmm0, 0x150(%rbp)
140279f7a:     	movq	$0x0, 0x1b0(%rbp)
140279f85:     	movabsq	$0x42c8000000000002, %rcx # imm = 0x42C8000000000002
140279f8f:     	movq	%rcx, 0x1d8(%rbp)
140279f96:     	movabsq	$0x4240000000000001, %rcx # imm = 0x4240000000000001
140279fa0:     	movq	%rcx, 0x1f0(%rbp)
140279fa7:     	movups	0x56d83ba(%rip), %xmm0  # 0x145952368
140279fae:     	movups	%xmm0, 0x208(%rbp)
140279fb5:     	movups	0x56d83bc(%rip), %xmm0  # 0x145952378
140279fbc:     	movups	%xmm0, 0x218(%rbp)
140279fc3:     	movups	0x56d83cd(%rip), %xmm14 # 0x145952398
140279fcb:     	movups	%xmm14, 0x238(%rbp)
140279fd3:     	movups	0x56d83ad(%rip), %xmm15 # 0x145952388
140279fdb:     	movups	%xmm15, 0x228(%rbp)
140279fe3:     	movups	0x56d83ce(%rip), %xmm6  # 0x1459523b8
140279fea:     	movups	%xmm6, 0x258(%rbp)
140279ff1:     	movups	0x56d83b0(%rip), %xmm7  # 0x1459523a8
140279ff8:     	movups	%xmm7, 0x248(%rbp)
140279fff:     	movups	0x56d83d1(%rip), %xmm12 # 0x1459523d8
14027a007:     	movups	%xmm12, 0x278(%rbp)
14027a00f:     	movups	0x56d83b1(%rip), %xmm13 # 0x1459523c8
14027a017:     	movups	%xmm13, 0x268(%rbp)
14027a01f:     	movaps	0x568d499(%rip), %xmm8  # 0x1459074c0
14027a027:     	movups	%xmm8, 0x288(%rbp)
14027a02f:     	movl	$0x1, 0x298(%rbp)
14027a039:     	movss	0x569b877(%rip), %xmm0  # 0x1459158b8
14027a041:     	movlps	%xmm0, 0x29c(%rbp)
14027a048:     	movb	$0x1, 0x2a4(%rbp)
14027a04f:     	movq	$0x0, 0x2ae(%rbp)
14027a05a:     	movq	$0x0, 0x2a8(%rbp)
14027a065:     	movw	$0x0, 0x2ba(%rbp)
14027a06e:     	movl	$0x10000, 0x2b6(%rbp)   # imm = 0x10000
14027a078:     	movw	$0x0, 0x2c0(%rbp)
14027a081:     	movl	$0x10000, 0x2bc(%rbp)   # imm = 0x10000
14027a08b:     	movq	$0x0, 0x2c2(%rbp)
14027a096:     	movl	$0x5, 0x2ca(%rbp)
14027a0a0:     	movq	%rax, 0x148(%rbp)
14027a0a7:     	leaq	0x3a8(%rbp), %r12
14027a0ae:     	leaq	0x148(%rbp), %r8
14027a0b5:     	movq	%r12, %rcx
14027a0b8:     	movq	%rbx, 0x3a0(%rbp)
14027a0bf:     	movq	%rbx, %rdx
14027a0c2:     	movq	%r14, %r9
14027a0c5:     	callq	0x1400d7270 <.text+0xd6270>
14027a0ca:     	movq	0x3a8(%rbp), %rax
14027a0d1:     	movq	0x3d0(%rbp), %rcx
14027a0d8:     	movq	%rax, 0x148(%rbp)
14027a0df:     	movups	0x3b0(%rbp), %xmm0
14027a0e6:     	movups	%xmm0, 0x150(%rbp)
14027a0ed:     	movups	0x3c0(%rbp), %xmm0
14027a0f4:     	movups	%xmm0, 0x160(%rbp)
14027a0fb:     	movq	%rcx, 0x170(%rbp)
14027a102:     	leaq	0x56c94af(%rip), %rcx   # 0x1459435b8
14027a109:     	movl	$0x13, %edx
14027a10e:     	callq	0x145457c00 <.text+0x5456c00>
14027a113:     	movq	%rdx, %r9
14027a116:     	movabsq	$-0x7ffffffffffffff7, %rcx # imm = 0x8000000000000009
14027a120:     	movq	%rcx, -0x40(%rbp)
14027a124:     	movq	%r13, 0x20(%rsp)
14027a129:     	leaq	0x148(%rbp), %r14
14027a130:     	movq	%r14, %rcx
14027a133:     	movq	%rdi, %rdx
14027a136:     	movq	%rax, %r8
14027a139:     	callq	0x14027f930 <.text+0x27e930>
14027a13e:     	leaq	0x56c9486(%rip), %rcx   # 0x1459435cb
14027a145:     	movl	$0x19, %edx
14027a14a:     	callq	0x145457c00 <.text+0x5456c00>
14027a14f:     	movq	%rdx, %r9
14027a152:     	movabsq	$-0x7ffffffffffffff3, %rcx # imm = 0x800000000000000D
14027a15c:     	movq	%rcx, -0x40(%rbp)
14027a160:     	movq	%r13, 0x20(%rsp)
14027a165:     	movq	%r14, %rcx
14027a168:     	movq	%rdi, %rdx
14027a16b:     	movq	%rax, %r8
14027a16e:     	callq	0x14027f930 <.text+0x27e930>
14027a173:     	cmpq	$0x0, 0x70(%r15)
14027a178:     	je	0x14027a2c0 <.text+0x2792c0>
14027a17e:     	leaq	0x60(%r15), %rdx
14027a182:     	leaq	-0x40(%rbp), %rcx
14027a186:     	callq	0x145728850 <.text+0x5727850>
14027a18b:     	cmpb	$0x0, 0x3e0(%rbp)
14027a192:     	je	0x14027a1b2 <.text+0x2791b2>
14027a194:     	movl	0x1(%rdi), %eax
14027a197:     	movl	0x4(%rdi), %ecx
14027a19a:     	movl	%ecx, 0x383(%rbp)
14027a1a0:     	movl	%eax, 0x380(%rbp)
14027a1a6:     	movq	0x8(%rdi), %rax
14027a1aa:     	movzbl	0x10(%rdi), %edx
14027a1ae:     	movb	$0x1, %cl
14027a1b0:     	jmp	0x14027a1c2 <.text+0x2791c2>
14027a1b2:     	movq	0x8(%rdi), %rax
14027a1b6:     	lock
14027a1b7:     	incq	(%rax)
14027a1ba:     	jle	0x14027b111 <.text+0x27a111>
14027a1c0:     	xorl	%ecx, %ecx
14027a1c2:     	movq	-0x30(%rbp), %r8
14027a1c6:     	movq	%r8, 0x160(%rbp)
14027a1cd:     	movups	-0x40(%rbp), %xmm0
14027a1d1:     	movups	%xmm0, 0x150(%rbp)
14027a1d8:     	movl	0x380(%rbp), %r8d
14027a1df:     	movl	0x383(%rbp), %r9d
14027a1e6:     	movl	%r8d, 0x181(%rbp)
14027a1ed:     	movl	%r9d, 0x184(%rbp)
14027a1f4:     	movups	0x56d8249(%rip), %xmm0  # 0x145952444
14027a1fb:     	movups	%xmm0, 0x3a9(%rbp)
14027a202:     	movl	$0x3f800000, 0x3b9(%rbp) # imm = 0x3F800000
14027a20c:     	movq	(%rsi), %r8
14027a20f:     	movq	$0x0, 0x168(%rbp)
14027a21a:     	movq	$0x4, 0x170(%rbp)
14027a225:     	movq	$0x0, 0x178(%rbp)
14027a230:     	movb	%cl, 0x180(%rbp)
14027a236:     	movq	%rax, 0x188(%rbp)
14027a23d:     	movq	%rdx, 0x190(%rbp)
14027a244:     	movl	$0x41700000, 0x198(%rbp) # imm = 0x41700000
14027a24e:     	movw	$0x190, 0x19c(%rbp)     # imm = 0x190
14027a257:     	movb	$0x1, 0x19e(%rbp)
14027a25e:     	movups	0x3a8(%rbp), %xmm0
14027a265:     	movups	%xmm0, 0x19f(%rbp)
14027a26c:     	movq	0x3b5(%rbp), %rax
14027a273:     	movq	%rax, 0x1ac(%rbp)
14027a27a:     	movups	%xmm9, 0x1b4(%rbp)
14027a282:     	movl	0x569eef8(%rip), %eax   # 0x145919180
14027a288:     	movl	%eax, 0x1c4(%rbp)
14027a28e:     	movsd	0x569b53a(%rip), %xmm0  # 0x1459157d0
14027a296:     	movsd	%xmm0, 0x1c8(%rbp)
14027a29e:     	movq	%r8, 0x148(%rbp)
14027a2a5:     	leaq	0x56d193c(%rip), %r9    # 0x14594bbe8
14027a2ac:     	leaq	-0x40(%rbp), %rcx
14027a2b0:     	leaq	0x148(%rbp), %r8
14027a2b7:     	leaq	0x8(%rsi), %rdx
14027a2bb:     	callq	0x1400dbfa0 <.text+0xdafa0>
14027a2c0:     	cmpq	$-0x1, 0x170(%r15)
14027a2c8:     	je	0x14027a4c0 <.text+0x2794c0>
14027a2ce:     	xorps	%xmm0, %xmm0
14027a2d1:     	movups	%xmm0, 0x1c8(%rbp)
14027a2d8:     	movups	%xmm0, 0x1b8(%rbp)
14027a2df:     	movups	%xmm0, 0x1e0(%rbp)
14027a2e6:     	movups	%xmm0, 0x1f8(%rbp)
14027a2ed:     	movups	0x56d7fbc(%rip), %xmm0  # 0x1459522b0
14027a2f4:     	movaps	%xmm0, -0x40(%rbp)
14027a2f8:     	movq	$0x0, -0x30(%rbp)
14027a300:     	movups	0x56d7fc1(%rip), %xmm0  # 0x1459522c8
14027a307:     	movups	%xmm0, -0x28(%rbp)
14027a30b:     	movq	$0x0, -0x18(%rbp)
14027a313:     	movaps	%xmm10, -0x10(%rbp)
14027a318:     	movq	$0x0, (%rbp)
14027a320:     	movups	%xmm11, 0x8(%rbp)
14027a325:     	movq	$0x0, 0x18(%rbp)
14027a32d:     	movaps	-0x10(%rbp), %xmm0
14027a331:     	movups	%xmm0, 0x180(%rbp)
14027a338:     	movaps	-0x20(%rbp), %xmm0
14027a33c:     	movups	%xmm0, 0x170(%rbp)
14027a343:     	movaps	-0x30(%rbp), %xmm0
14027a347:     	movups	%xmm0, 0x160(%rbp)
14027a34e:     	movaps	-0x40(%rbp), %xmm0
14027a352:     	movups	%xmm0, 0x150(%rbp)
14027a359:     	addq	$0x170, %r15            # imm = 0x170
14027a360:     	movq	%r15, 0x380(%rbp)
14027a367:     	movq	(%rsi), %rax
14027a36a:     	movq	0x10(%rbp), %rcx
14027a36e:     	movq	%rcx, 0x1a0(%rbp)
14027a375:     	movq	0x18(%rbp), %rcx
14027a379:     	movq	%rcx, 0x1a8(%rbp)
14027a380:     	movq	(%rbp), %rcx
14027a384:     	movq	%rcx, 0x190(%rbp)
14027a38b:     	movq	0x8(%rbp), %rcx
14027a38f:     	movq	%rcx, 0x198(%rbp)
14027a396:     	movq	$0x0, 0x1b0(%rbp)
14027a3a1:     	movabsq	$0x42c8000000000002, %rcx # imm = 0x42C8000000000002
14027a3ab:     	movq	%rcx, 0x1d8(%rbp)
14027a3b2:     	movabsq	$0x4240000000000001, %rcx # imm = 0x4240000000000001
14027a3bc:     	movq	%rcx, 0x1f0(%rbp)
14027a3c3:     	movups	0x56d7f9e(%rip), %xmm0  # 0x145952368
14027a3ca:     	movups	%xmm0, 0x208(%rbp)
14027a3d1:     	movups	0x56d7fa0(%rip), %xmm0  # 0x145952378
14027a3d8:     	movups	%xmm0, 0x218(%rbp)
14027a3df:     	movups	%xmm14, 0x238(%rbp)
14027a3e7:     	movups	%xmm15, 0x228(%rbp)
14027a3ef:     	movups	%xmm6, 0x258(%rbp)
14027a3f6:     	movups	%xmm7, 0x248(%rbp)
14027a3fd:     	movups	%xmm12, 0x278(%rbp)
14027a405:     	movups	%xmm13, 0x268(%rbp)
14027a40d:     	movups	%xmm8, 0x288(%rbp)
14027a415:     	movl	$0x1, 0x298(%rbp)
14027a41f:     	movss	0x569b491(%rip), %xmm0  # 0x1459158b8
14027a427:     	movlps	%xmm0, 0x29c(%rbp)
14027a42e:     	movb	$0x1, 0x2a4(%rbp)
14027a435:     	movq	$0x0, 0x2ae(%rbp)
14027a440:     	movq	$0x0, 0x2a8(%rbp)
14027a44b:     	movw	$0x0, 0x2ba(%rbp)
14027a454:     	movl	$0x10000, 0x2b6(%rbp)   # imm = 0x10000
14027a45e:     	movw	$0x0, 0x2c0(%rbp)
14027a467:     	movl	$0x10000, 0x2bc(%rbp)   # imm = 0x10000
14027a471:     	movq	$0x0, 0x2c2(%rbp)
14027a47c:     	movl	$0x5, 0x2ca(%rbp)
14027a486:     	movq	%rax, 0x148(%rbp)
14027a48d:     	leaq	0x56d1754(%rip), %r9    # 0x14594bbe8
14027a494:     	leaq	0x3a8(%rbp), %r14
14027a49b:     	leaq	0x148(%rbp), %r8
14027a4a2:     	movq	%r14, %rcx
14027a4a5:     	leaq	0x8(%rsi), %rdx
14027a4a9:     	callq	0x1400d7270 <.text+0xd6270>
14027a4ae:     	leaq	0x380(%rbp), %r8
14027a4b5:     	movq	%r14, %rcx
14027a4b8:     	movq	%rdi, %rdx
14027a4bb:     	callq	0x140151bf0 <.text+0x150bf0>
14027a4c0:     	leaq	0x148(%rbp), %rcx
14027a4c7:     	callq	0x14543a9c0 <.text+0x54399c0>
14027a4cc:     	movq	0x148(%rbp), %rax
14027a4d3:     	cmpq	$-0x1, %rax
14027a4d7:     	je	0x14027a594 <.text+0x279594>
14027a4dd:     	movq	%rax, 0x3f0(%rbp)
14027a4e4:     	movq	0x150(%rbp), %rcx
14027a4eb:     	movq	0x158(%rbp), %rax
14027a4f2:     	movq	%rcx, 0x3e8(%rbp)
14027a4f9:     	movq	%rcx, 0x368(%rbp)
14027a500:     	movq	%rax, 0x370(%rbp)
14027a507:     	movq	$0x0, 0x3a8(%rbp)
14027a512:     	movq	$0x1, 0x3b0(%rbp)
14027a51d:     	movq	$0x0, 0x3b8(%rbp)
14027a528:     	movq	$0x60000020, -0x30(%rbp) # imm = 0x60000020
14027a530:     	movq	%r12, -0x40(%rbp)
14027a534:     	leaq	0x56e0c2d(%rip), %rax   # 0x14595b168
14027a53b:     	movq	%rax, -0x38(%rbp)
14027a53f:     	leaq	0x368(%rbp), %rcx
14027a546:     	leaq	-0x40(%rbp), %rdx
14027a54a:     	callq	0x14571b240 <.text+0x571a240>
14027a54f:     	nop
14027a550:     	testb	%al, %al
14027a552:     	jne	0x14027b0e5 <.text+0x27a0e5>
14027a558:     	movq	0x3b8(%rbp), %rax
14027a55f:     	movq	%rax, 0x390(%rbp)
14027a566:     	movups	0x3a8(%rbp), %xmm0
14027a56d:     	movaps	%xmm0, 0x380(%rbp)
14027a574:     	movq	0x3f0(%rbp), %rdx
14027a57b:     	testq	%rdx, %rdx
14027a57e:     	je	0x14027a5b5 <.text+0x2795b5>
14027a580:     	movl	$0x1, %r8d
14027a586:     	movq	0x3e8(%rbp), %rcx
14027a58d:     	callq	0x1400021d0 <.text+0x11d0>
14027a592:     	jmp	0x14027a5b5 <.text+0x2795b5>
14027a594:     	movq	$0x0, 0x380(%rbp)
14027a59f:     	movq	$0x1, 0x388(%rbp)
14027a5aa:     	movq	$0x0, 0x390(%rbp)
14027a5b5:     	movw	$0x0, 0x124(%rbp)
14027a5be:     	movb	$0x1, 0x114(%rbp)
14027a5c5:     	xorps	%xmm0, %xmm0
14027a5c8:     	movaps	%xmm0, 0x20(%rbp)
14027a5cc:     	movaps	%xmm0, 0x30(%rbp)
14027a5d0:     	movaps	%xmm0, 0x40(%rbp)
14027a5d4:     	movaps	%xmm0, 0x50(%rbp)
14027a5d8:     	movaps	%xmm0, 0x60(%rbp)
14027a5dc:     	movq	$0x0, 0x70(%rbp)
14027a5e4:     	movl	$0x0, 0x138(%rbp)
14027a5ee:     	movw	$0x0, 0x13c(%rbp)
14027a5f7:     	movaps	0x569b302(%rip), %xmm0  # 0x145915900
14027a5fe:     	movups	%xmm0, 0x78(%rbp)
14027a602:     	movaps	0x56d6c17(%rip), %xmm0  # 0x145951220
14027a609:     	movups	%xmm0, 0x88(%rbp)
14027a610:     	movups	%xmm15, 0x98(%rbp)
14027a618:     	movups	%xmm14, 0xa8(%rbp)
14027a620:     	movups	%xmm6, 0xc8(%rbp)
14027a627:     	movups	%xmm7, 0xb8(%rbp)
14027a62e:     	movups	%xmm12, 0xe8(%rbp)
14027a636:     	movups	%xmm13, 0xd8(%rbp)
14027a63e:     	movb	$0x0, 0x136(%rbp)
14027a645:     	movl	$0x0, 0x132(%rbp)
14027a64f:     	movq	$0x0, 0x118(%rbp)
14027a65a:     	movl	$0x3f800000, 0x120(%rbp) # imm = 0x3F800000
14027a664:     	movups	%xmm8, 0xf8(%rbp)
14027a66c:     	movl	$0x1, 0x108(%rbp)
14027a676:     	movq	$0x0, 0x10c(%rbp)
14027a681:     	movb	$0x0, 0x137(%rbp)
14027a688:     	movups	0x56d7c21(%rip), %xmm0  # 0x1459522b0
14027a68f:     	movaps	%xmm0, -0x40(%rbp)
14027a693:     	movq	$0x0, -0x30(%rbp)
14027a69b:     	movups	0x56d7c26(%rip), %xmm0  # 0x1459522c8
14027a6a2:     	movups	%xmm0, -0x28(%rbp)
14027a6a6:     	movq	$0x0, -0x18(%rbp)
14027a6ae:     	movaps	%xmm10, -0x10(%rbp)
14027a6b3:     	movq	$0x0, (%rbp)
14027a6bb:     	movups	%xmm11, 0x8(%rbp)
14027a6c0:     	movq	$0x0, 0x18(%rbp)
14027a6c8:     	movw	$0x0, 0x12a(%rbp)
14027a6d1:     	movl	$0x10000, 0x126(%rbp)   # imm = 0x10000
14027a6db:     	movw	$0x0, 0x130(%rbp)
14027a6e4:     	movl	$0x10000, 0x12c(%rbp)   # imm = 0x10000
14027a6ee:     	leaq	0x56d836f(%rip), %rcx   # 0x145952a64
14027a6f5:     	movl	$0x12, %edx
14027a6fa:     	callq	0x145457c00 <.text+0x5456c00>
14027a6ff:     	nop
14027a700:     	movq	%rdx, %r12
14027a703:     	testq	%rdx, %rdx
14027a706:     	jns	0x14027a71c <.text+0x27971c>
14027a708:     	xorl	%r13d, %r13d
14027a70b:     	movq	%r13, %rcx
14027a70e:     	movq	%r12, %rdx
14027a711:     	callq	0x14590379b <.text+0x590279b>
14027a716:     	nop
14027a717:     	jmp	0x14027b111 <.text+0x27a111>
14027a71c:     	testq	%r12, %r12
14027a71f:     	je	0x14027a788 <.text+0x279788>
14027a721:     	movq	%rax, %r15
14027a724:     	callq	0x140002200 <.text+0x1200>
14027a729:     	movl	$0x1, %r13d
14027a72f:     	movl	$0x1, %edx
14027a734:     	movq	%r12, %rcx
14027a737:     	callq	0x1400021c0 <.text+0x11c0>
14027a73c:     	testq	%rax, %rax
14027a73f:     	je	0x14027a70b <.text+0x27970b>
14027a741:     	movq	%rax, %r14
14027a744:     	movq	%rax, %rcx
14027a747:     	movq	%r15, %rdx
14027a74a:     	movq	%r12, %r8
14027a74d:     	callq	0x1457731ed <.text+0x57721ed>
14027a752:     	movq	%rsi, 0x3f0(%rbp)
14027a759:     	cmpb	$0x0, 0x3e0(%rbp)
14027a760:     	movq	%rdi, 0x3e8(%rbp)
14027a767:     	je	0x14027a7a5 <.text+0x2797a5>
14027a769:     	movl	0x1(%rdi), %eax
14027a76c:     	movl	0x4(%rdi), %ecx
14027a76f:     	movl	%ecx, 0x36b(%rbp)
14027a775:     	movl	%eax, 0x368(%rbp)
14027a77b:     	movq	0x8(%rdi), %rsi
14027a77f:     	movzbl	0x10(%rdi), %ebx
14027a783:     	movb	$0x1, %dil
14027a786:     	jmp	0x14027a7b5 <.text+0x2797b5>
14027a788:     	movl	$0x1, %r14d
14027a78e:     	movq	%rsi, 0x3f0(%rbp)
14027a795:     	cmpb	$0x0, 0x3e0(%rbp)
14027a79c:     	movq	%rdi, 0x3e8(%rbp)
14027a7a3:     	jne	0x14027a769 <.text+0x279769>
14027a7a5:     	movq	0x8(%rdi), %rsi
14027a7a9:     	lock
14027a7aa:     	incq	(%rsi)
14027a7ad:     	jle	0x14027b111 <.text+0x27a111>
14027a7b3:     	xorl	%edi, %edi
14027a7b5:     	movl	0x368(%rbp), %eax
14027a7bb:     	movl	0x36b(%rbp), %ecx
14027a7c1:     	movl	%ecx, 0x304(%rbp)
14027a7c7:     	movl	%eax, 0x301(%rbp)
14027a7cd:     	movups	0x56d7c70(%rip), %xmm0  # 0x145952444
14027a7d4:     	movups	%xmm0, 0x3a9(%rbp)
14027a7db:     	movl	$0x3f800000, 0x3b9(%rbp) # imm = 0x3F800000
14027a7e5:     	leaq	0x150(%rbp), %r15
14027a7ec:     	leaq	-0x40(%rbp), %rdx
14027a7f0:     	movl	$0x180, %r8d            # imm = 0x180
14027a7f6:     	movq	%r15, %rcx
14027a7f9:     	callq	0x1457731ed <.text+0x57721ed>
14027a7fe:     	movups	0x3a8(%rbp), %xmm0
14027a805:     	movups	%xmm0, 0x31f(%rbp)
14027a80c:     	movq	0x3b5(%rbp), %rax
14027a813:     	movq	%rax, 0x32c(%rbp)
14027a81a:     	movq	0x3f0(%rbp), %rax
14027a821:     	movq	(%rax), %rax
14027a824:     	movq	%r12, 0x2d0(%rbp)
14027a82b:     	movq	%r14, 0x2d8(%rbp)
14027a832:     	movq	%r12, 0x2e0(%rbp)
14027a839:     	movq	$0x0, 0x2e8(%rbp)
14027a844:     	movq	$0x4, 0x2f0(%rbp)
14027a84f:     	movq	$0x0, 0x2f8(%rbp)
14027a85a:     	movb	%dil, 0x300(%rbp)
14027a861:     	movq	%rsi, 0x308(%rbp)
14027a868:     	movq	%rbx, 0x310(%rbp)
14027a86f:     	movl	$0x41880000, 0x318(%rbp) # imm = 0x41880000
14027a879:     	movw	$0x190, 0x31c(%rbp)     # imm = 0x190
14027a882:     	movb	$0x1, 0x31e(%rbp)
14027a889:     	movups	%xmm9, 0x334(%rbp)
14027a891:     	movl	0x569e8e9(%rip), %ecx   # 0x145919180
14027a897:     	movl	%ecx, 0x344(%rbp)
14027a89d:     	movsd	0x569af2b(%rip), %xmm0  # 0x1459157d0
14027a8a5:     	movsd	%xmm0, 0x348(%rbp)
14027a8ad:     	movq	%rax, 0x148(%rbp)
14027a8b4:     	leaq	0x56d132d(%rip), %r9    # 0x14594bbe8
14027a8bb:     	leaq	-0x40(%rbp), %rcx
14027a8bf:     	leaq	0x148(%rbp), %r8
14027a8c6:     	movq	0x3a0(%rbp), %rdx
14027a8cd:     	callq	0x1400db410 <.text+0xda410>
14027a8d2:     	nop
14027a8d3:     	leaq	0x56d819c(%rip), %rax   # 0x145952a76
14027a8da:     	movq	%rax, 0x3a8(%rbp)
14027a8e1:     	movq	$0x4, 0x3b0(%rbp)
14027a8ec:     	leaq	0x380(%rbp), %rax
14027a8f3:     	movq	%rax, 0x3b8(%rbp)
14027a8fa:     	leaq	0x56d7e8f(%rip), %rax   # 0x145952790
14027a901:     	movq	%rax, 0x3c0(%rbp)
14027a908:     	movq	$0x1, 0x20(%rsp)
14027a911:     	leaq	0x56d8162(%rip), %rdx   # 0x145952a7a
14027a918:     	leaq	-0x40(%rbp), %rcx
14027a91c:     	leaq	0x3a8(%rbp), %r9
14027a923:     	movl	$0x15, %r8d
14027a929:     	callq	0x145457c60 <.text+0x5456c60>
14027a92e:     	nop
14027a92f:     	cmpb	$0x0, 0x3e0(%rbp)
14027a936:     	je	0x14027a964 <.text+0x279964>
14027a938:     	movq	0x3e8(%rbp), %rdx
14027a93f:     	movl	0x1(%rdx), %eax
14027a942:     	movl	0x4(%rdx), %ecx
14027a945:     	movl	%ecx, 0x363(%rbp)
14027a94b:     	movl	%eax, 0x360(%rbp)
14027a951:     	movq	0x8(%rdx), %rax
14027a955:     	movzbl	0x10(%rdx), %edx
14027a959:     	movb	$0x1, %cl
14027a95b:     	movq	0x3f0(%rbp), %r10
14027a962:     	jmp	0x14027a982 <.text+0x279982>
14027a964:     	movq	0x3e8(%rbp), %rax
14027a96b:     	movq	0x8(%rax), %rax
14027a96f:     	lock
14027a970:     	incq	(%rax)
14027a973:     	movq	0x3f0(%rbp), %r10
14027a97a:     	jle	0x14027b111 <.text+0x27a111>
14027a980:     	xorl	%ecx, %ecx
14027a982:     	movq	-0x30(%rbp), %r8
14027a986:     	movq	%r8, 0x160(%rbp)
14027a98d:     	movups	-0x40(%rbp), %xmm0
14027a991:     	movups	%xmm0, 0x150(%rbp)
14027a998:     	movl	0x360(%rbp), %r8d
14027a99f:     	movl	0x363(%rbp), %r9d
14027a9a6:     	movl	%r8d, 0x181(%rbp)
14027a9ad:     	movl	%r9d, 0x184(%rbp)
14027a9b4:     	movups	0x56d7c0d(%rip), %xmm0  # 0x1459525c8
14027a9bb:     	movups	%xmm0, 0x369(%rbp)
14027a9c2:     	movl	$0x3f800000, 0x379(%rbp) # imm = 0x3F800000
14027a9cc:     	movq	(%r10), %r8
14027a9cf:     	movq	$0x0, 0x168(%rbp)
14027a9da:     	movq	$0x4, 0x170(%rbp)
14027a9e5:     	movq	$0x0, 0x178(%rbp)
14027a9f0:     	movb	%cl, 0x180(%rbp)
14027a9f6:     	movq	%rax, 0x188(%rbp)
14027a9fd:     	movq	%rdx, 0x190(%rbp)
14027aa04:     	movl	$0x41600000, 0x198(%rbp) # imm = 0x41600000
14027aa0e:     	movw	$0x190, 0x19c(%rbp)     # imm = 0x190
14027aa17:     	movb	$0x1, 0x19e(%rbp)
14027aa1e:     	movups	0x368(%rbp), %xmm0
14027aa25:     	movups	%xmm0, 0x19f(%rbp)
14027aa2c:     	movq	0x375(%rbp), %rax
14027aa33:     	movq	%rax, 0x1ac(%rbp)
14027aa3a:     	movups	%xmm9, 0x1b4(%rbp)
14027aa42:     	movl	0x569e738(%rip), %eax   # 0x145919180
14027aa48:     	movl	%eax, 0x1c4(%rbp)
14027aa4e:     	movsd	0x569ad7a(%rip), %xmm0  # 0x1459157d0
14027aa56:     	movsd	%xmm0, 0x1c8(%rbp)
14027aa5e:     	movq	%r8, 0x148(%rbp)
14027aa65:     	leaq	0x56d117c(%rip), %r9    # 0x14594bbe8
14027aa6c:     	leaq	-0x40(%rbp), %rcx
14027aa70:     	leaq	0x148(%rbp), %r8
14027aa77:     	movq	0x3a0(%rbp), %rdx
14027aa7e:     	callq	0x1400dbfa0 <.text+0xdafa0>
14027aa83:     	nop
14027aa84:     	leaq	0x56d8004(%rip), %rcx   # 0x145952a8f
14027aa8b:     	movl	$0x15, %edx
14027aa90:     	callq	0x145457c00 <.text+0x5456c00>
14027aa95:     	nop
14027aa96:     	movq	%rdx, %r12
14027aa99:     	testq	%rdx, %rdx
14027aa9c:     	jns	0x14027aab2 <.text+0x279ab2>
14027aa9e:     	xorl	%r13d, %r13d
14027aaa1:     	movq	%r13, %rcx
14027aaa4:     	movq	%r12, %rdx
14027aaa7:     	callq	0x14590379b <.text+0x590279b>
14027aaac:     	nop
14027aaad:     	jmp	0x14027b111 <.text+0x27a111>
14027aab2:     	testq	%r12, %r12
14027aab5:     	je	0x14027ab1f <.text+0x279b1f>
14027aab7:     	movq	%rax, -0x48(%rbp)
14027aabb:     	callq	0x140002200 <.text+0x1200>
14027aac0:     	movl	$0x1, %r13d
14027aac6:     	movl	$0x1, %edx
14027aacb:     	movq	%r12, %rcx
14027aace:     	callq	0x1400021c0 <.text+0x11c0>
14027aad3:     	testq	%rax, %rax
14027aad6:     	movq	0x3f0(%rbp), %rsi
14027aadd:     	movq	0x3e8(%rbp), %rdi
14027aae4:     	je	0x14027aaa1 <.text+0x279aa1>
14027aae6:     	movq	%rax, %r14
14027aae9:     	movq	%rax, %rcx
14027aaec:     	movq	-0x48(%rbp), %rdx
14027aaf0:     	movq	%r12, %r8
14027aaf3:     	callq	0x1457731ed <.text+0x57721ed>
14027aaf8:     	cmpb	$0x0, 0x3e0(%rbp)
14027aaff:     	je	0x14027ab3c <.text+0x279b3c>
14027ab01:     	movl	0x1(%rdi), %eax
14027ab04:     	movl	0x4(%rdi), %ecx
14027ab07:     	movl	%ecx, 0x35b(%rbp)
14027ab0d:     	movl	%eax, 0x358(%rbp)
14027ab13:     	movq	0x8(%rdi), %rax
14027ab17:     	movzbl	0x10(%rdi), %ecx
14027ab1b:     	movb	$0x1, %dl
14027ab1d:     	jmp	0x14027ab4c <.text+0x279b4c>
14027ab1f:     	movl	$0x1, %r14d
14027ab25:     	movq	0x3f0(%rbp), %rsi
14027ab2c:     	movq	0x3e8(%rbp), %rdi
14027ab33:     	cmpb	$0x0, 0x3e0(%rbp)
14027ab3a:     	jne	0x14027ab01 <.text+0x279b01>
14027ab3c:     	movq	0x8(%rdi), %rax
14027ab40:     	lock
14027ab41:     	incq	(%rax)
14027ab44:     	jle	0x14027b111 <.text+0x27a111>
14027ab4a:     	xorl	%edx, %edx
14027ab4c:     	movups	0x56d7a75(%rip), %xmm0  # 0x1459525c8
14027ab53:     	movups	%xmm0, 0x3a9(%rbp)
14027ab5a:     	movl	$0x3f800000, 0x3b9(%rbp) # imm = 0x3F800000
14027ab64:     	movq	(%rsi), %r8
14027ab67:     	movq	%r12, 0x150(%rbp)
14027ab6e:     	movq	%r14, 0x158(%rbp)
14027ab75:     	movq	%r12, 0x160(%rbp)
14027ab7c:     	movq	$0x0, 0x168(%rbp)
14027ab87:     	movq	$0x4, 0x170(%rbp)
14027ab92:     	movq	$0x0, 0x178(%rbp)
14027ab9d:     	movb	%dl, 0x180(%rbp)
14027aba3:     	movl	0x358(%rbp), %edx
14027aba9:     	movl	0x35b(%rbp), %r9d
14027abb0:     	movl	%edx, 0x181(%rbp)
14027abb6:     	movl	%r9d, 0x184(%rbp)
14027abbd:     	movq	%rax, 0x188(%rbp)
14027abc4:     	movq	%rcx, 0x190(%rbp)
14027abcb:     	movl	$0x41600000, 0x198(%rbp) # imm = 0x41600000
14027abd5:     	movw	$0x190, 0x19c(%rbp)     # imm = 0x190
14027abde:     	movb	$0x1, 0x19e(%rbp)
14027abe5:     	movups	0x3a8(%rbp), %xmm0
14027abec:     	movups	%xmm0, 0x19f(%rbp)
14027abf3:     	movq	0x3b5(%rbp), %rax
14027abfa:     	movq	%rax, 0x1ac(%rbp)
14027ac01:     	movl	0x569e579(%rip), %eax   # 0x145919180
14027ac07:     	movl	%eax, 0x1c4(%rbp)
14027ac0d:     	movups	%xmm9, 0x1b4(%rbp)
14027ac15:     	movsd	0x569abb3(%rip), %xmm0  # 0x1459157d0
14027ac1d:     	movsd	%xmm0, 0x1c8(%rbp)
14027ac25:     	movq	%r8, 0x148(%rbp)
14027ac2c:     	leaq	0x56d0fb5(%rip), %r9    # 0x14594bbe8
14027ac33:     	leaq	-0x40(%rbp), %rcx
14027ac37:     	leaq	0x148(%rbp), %r8
14027ac3e:     	movq	0x3a0(%rbp), %rdx
14027ac45:     	callq	0x1400dbfa0 <.text+0xdafa0>
14027ac4a:     	nop
14027ac4b:     	movq	-0x50(%rbp), %rcx
14027ac4f:     	movq	0x88(%rcx), %rax
14027ac56:     	testq	%rax, %rax
14027ac59:     	je	0x14027aea7 <.text+0x279ea7>
14027ac5f:     	movq	0x80(%rcx), %rbx
14027ac66:     	imulq	$0x38, %rax, %rax
14027ac6a:     	addq	%rbx, %rax
14027ac6d:     	movq	%rax, 0x3e0(%rbp)
14027ac74:     	leaq	-0x28(%rbp), %rdi
14027ac78:     	leaq	0x1b8(%rbp), %r14
14027ac7f:     	xorl	%r12d, %r12d
14027ac82:     	xorps	%xmm9, %xmm9
14027ac86:     	leaq	0x3a8(%rbp), %r13
14027ac8d:     	leaq	0x148(%rbp), %rsi
14027ac94:     	cmpq	0x3e0(%rbp), %rbx
14027ac9b:     	je	0x14027b065 <.text+0x27a065>
14027aca1:     	nopw	%cs:(%rax,%rax)
14027acb0:     	movups	%xmm9, 0x10(%r14)
14027acb5:     	movups	%xmm9, (%r14)
14027acb9:     	movups	%xmm9, 0x28(%r14)
14027acbe:     	movups	%xmm9, 0x40(%r14)
14027acc3:     	movups	0x56d75e6(%rip), %xmm0  # 0x1459522b0
14027acca:     	movaps	%xmm0, -0x40(%rbp)
14027acce:     	movq	$0x0, -0x30(%rbp)
14027acd6:     	movups	0x56d75eb(%rip), %xmm0  # 0x1459522c8
14027acdd:     	movups	%xmm0, (%rdi)
14027ace0:     	movq	$0x0, 0x10(%rdi)
14027ace8:     	movups	%xmm10, 0x18(%rdi)
14027aced:     	movq	$0x0, 0x28(%rdi)
14027acf5:     	movups	%xmm11, 0x30(%rdi)
14027acfa:     	movq	$0x0, 0x40(%rdi)
14027ad02:     	movaps	0x10(%rbp), %xmm0
14027ad06:     	movups	%xmm0, 0x50(%r15)
14027ad0b:     	movaps	(%rbp), %xmm0
14027ad0f:     	movups	%xmm0, 0x40(%r15)
14027ad14:     	movaps	-0x10(%rbp), %xmm0
14027ad18:     	movups	%xmm0, 0x30(%r15)
14027ad1d:     	movaps	-0x20(%rbp), %xmm0
14027ad21:     	movups	%xmm0, 0x20(%r15)
14027ad26:     	movaps	-0x40(%rbp), %xmm0
14027ad2a:     	movups	%xmm0, (%r15)
14027ad2e:     	movq	%r12, 0x368(%rbp)
14027ad35:     	movq	0x3f0(%rbp), %rax
14027ad3c:     	movq	(%rax), %rax
14027ad3f:     	movq	-0x30(%rbp), %rcx
14027ad43:     	movq	-0x28(%rbp), %rdx
14027ad47:     	movq	%rcx, 0x10(%r15)
14027ad4b:     	movq	%rdx, 0x18(%r15)
14027ad4f:     	movq	$0x0, 0x1b0(%rbp)
14027ad5a:     	movabsq	$0x42c8000000000002, %rcx # imm = 0x42C8000000000002
14027ad64:     	movq	%rcx, 0x1d8(%rbp)
14027ad6b:     	movabsq	$0x4240000000000001, %rcx # imm = 0x4240000000000001
14027ad75:     	movq	%rcx, 0x1f0(%rbp)
14027ad7c:     	movups	0x56d75f5(%rip), %xmm0  # 0x145952378
14027ad83:     	movups	%xmm0, 0x60(%r14)
14027ad88:     	movups	0x56d75d9(%rip), %xmm0  # 0x145952368
14027ad8f:     	movups	%xmm0, 0x50(%r14)
14027ad94:     	movups	%xmm14, 0x80(%r14)
14027ad9c:     	movups	%xmm15, 0x70(%r14)
14027ada1:     	movups	%xmm6, 0xa0(%r14)
14027ada9:     	movups	%xmm7, 0x90(%r14)
14027adb1:     	movups	%xmm13, 0xb0(%r14)
14027adb9:     	movups	%xmm12, 0xc0(%r14)
14027adc1:     	movups	%xmm8, 0x288(%rbp)
14027adc9:     	movl	$0x1, 0x298(%rbp)
14027add3:     	movss	0x569aadd(%rip), %xmm0  # 0x1459158b8
14027addb:     	movlps	%xmm0, 0x29c(%rbp)
14027ade2:     	movb	$0x1, 0x2a4(%rbp)
14027ade9:     	movq	$0x0, 0xf6(%r14)
14027adf4:     	movq	$0x0, 0xf0(%r14)
14027adff:     	movw	$0x0, 0x102(%r14)
14027ae09:     	movl	$0x10000, 0xfe(%r14)    # imm = 0x10000
14027ae14:     	movw	$0x0, 0x108(%r14)
14027ae1e:     	movl	$0x10000, 0x104(%r14)   # imm = 0x10000
14027ae29:     	movq	$0x0, 0x2c2(%rbp)
14027ae34:     	movl	$0x5, 0x2ca(%rbp)
14027ae3e:     	movq	%rax, 0x148(%rbp)
14027ae45:     	movq	%r13, %rcx
14027ae48:     	movq	0x3a0(%rbp), %rdx
14027ae4f:     	movq	%rsi, %r8
14027ae52:     	leaq	0x56d0d8f(%rip), %r9    # 0x14594bbe8
14027ae59:     	callq	0x1400d7270 <.text+0xd6270>
14027ae5e:     	nop
14027ae5f:     	movq	0x3e8(%rbp), %rax
14027ae66:     	movq	%rax, 0x148(%rbp)
14027ae6d:     	movq	%rbx, 0x150(%rbp)
14027ae74:     	leaq	0x368(%rbp), %rax
14027ae7b:     	movq	%rax, 0x158(%rbp)
14027ae82:     	movq	%r13, %rcx
14027ae85:     	movq	%rsi, %rdx
14027ae88:     	callq	0x1401517c0 <.text+0x1507c0>
14027ae8d:     	nop
14027ae8e:     	addq	$0x38, %rbx
14027ae92:     	incq	%r12
14027ae95:     	cmpq	0x3e0(%rbp), %rbx
14027ae9c:     	jne	0x14027acb0 <.text+0x279cb0>
14027aea2:     	jmp	0x14027b065 <.text+0x27a065>
14027aea7:     	leaq	0x56d7bf6(%rip), %rcx   # 0x145952aa4
14027aeae:     	movl	$0x15, %edx
14027aeb3:     	callq	0x145457c00 <.text+0x5456c00>
14027aeb8:     	nop
14027aeb9:     	movq	%rdx, %r14
14027aebc:     	testq	%rdx, %rdx
14027aebf:     	jns	0x14027aed5 <.text+0x279ed5>
14027aec1:     	xorl	%r13d, %r13d
14027aec4:     	movq	%r13, %rcx
14027aec7:     	movq	%r14, %rdx
14027aeca:     	callq	0x14590379b <.text+0x590279b>
14027aecf:     	nop
14027aed0:     	jmp	0x14027b111 <.text+0x27a111>
14027aed5:     	testq	%r14, %r14
14027aed8:     	je	0x14027af1b <.text+0x279f1b>
14027aeda:     	movq	%rax, %r12
14027aedd:     	callq	0x140002200 <.text+0x1200>
14027aee2:     	movl	$0x1, %r13d
14027aee8:     	movl	$0x1, %edx
14027aeed:     	movq	%r14, %rcx
14027aef0:     	callq	0x1400021c0 <.text+0x11c0>
14027aef5:     	testq	%rax, %rax
14027aef8:     	movq	0x3f0(%rbp), %rsi
14027aeff:     	movq	0x3e8(%rbp), %rdi
14027af06:     	je	0x14027aec4 <.text+0x279ec4>
14027af08:     	movq	%rax, %r15
14027af0b:     	movq	%rax, %rcx
14027af0e:     	movq	%r12, %rdx
14027af11:     	movq	%r14, %r8
14027af14:     	callq	0x1457731ed <.text+0x57721ed>
14027af19:     	jmp	0x14027af2f <.text+0x279f2f>
14027af1b:     	movl	$0x1, %r15d
14027af21:     	movq	0x3f0(%rbp), %rsi
14027af28:     	movq	0x3e8(%rbp), %rdi
14027af2f:     	cmpb	$0x0, 0x3e0(%rbp)
14027af36:     	je	0x14027af56 <.text+0x279f56>
14027af38:     	movl	0x1(%rdi), %eax
14027af3b:     	movl	0x4(%rdi), %ecx
14027af3e:     	movl	%ecx, 0x353(%rbp)
14027af44:     	movl	%eax, 0x350(%rbp)
14027af4a:     	movq	0x8(%rdi), %rax
14027af4e:     	movzbl	0x10(%rdi), %ecx
14027af52:     	movb	$0x1, %dl
14027af54:     	jmp	0x14027af66 <.text+0x279f66>
14027af56:     	movq	0x8(%rdi), %rax
14027af5a:     	lock
14027af5b:     	incq	(%rax)
14027af5e:     	jle	0x14027b111 <.text+0x27a111>
14027af64:     	xorl	%edx, %edx
14027af66:     	movups	0x56d765b(%rip), %xmm0  # 0x1459525c8
14027af6d:     	movups	%xmm0, 0x3a9(%rbp)
14027af74:     	movl	$0x3f800000, 0x3b9(%rbp) # imm = 0x3F800000
14027af7e:     	movq	(%rsi), %r8
14027af81:     	movq	%r14, 0x150(%rbp)
14027af88:     	movq	%r15, 0x158(%rbp)
14027af8f:     	movq	%r14, 0x160(%rbp)
14027af96:     	movq	$0x0, 0x168(%rbp)
14027afa1:     	movq	$0x4, 0x170(%rbp)
14027afac:     	movq	$0x0, 0x178(%rbp)
14027afb7:     	movb	%dl, 0x180(%rbp)
14027afbd:     	movl	0x350(%rbp), %edx
14027afc3:     	movl	0x353(%rbp), %r9d
14027afca:     	movl	%edx, 0x181(%rbp)
14027afd0:     	movl	%r9d, 0x184(%rbp)
14027afd7:     	movq	%rax, 0x188(%rbp)
14027afde:     	movq	%rcx, 0x190(%rbp)
14027afe5:     	movl	$0x41700000, 0x198(%rbp) # imm = 0x41700000
14027afef:     	movw	$0x190, 0x19c(%rbp)     # imm = 0x190
14027aff8:     	movb	$0x1, 0x19e(%rbp)
14027afff:     	movups	0x3a8(%rbp), %xmm0
14027b006:     	movups	%xmm0, 0x19f(%rbp)
14027b00d:     	movq	0x3b5(%rbp), %rax
14027b014:     	movq	%rax, 0x1ac(%rbp)
14027b01b:     	movl	0x569e15f(%rip), %eax   # 0x145919180
14027b021:     	movl	%eax, 0x1c4(%rbp)
14027b027:     	movups	%xmm9, 0x1b4(%rbp)
14027b02f:     	movsd	0x569a799(%rip), %xmm0  # 0x1459157d0
14027b037:     	movsd	%xmm0, 0x1c8(%rbp)
14027b03f:     	movq	%r8, 0x148(%rbp)
14027b046:     	leaq	0x56d0b9b(%rip), %r9    # 0x14594bbe8
14027b04d:     	leaq	-0x40(%rbp), %rcx
14027b051:     	leaq	0x148(%rbp), %r8
14027b058:     	movq	0x3a0(%rbp), %rdx
14027b05f:     	callq	0x1400dbfa0 <.text+0xdafa0>
14027b064:     	nop
14027b065:     	movq	0x380(%rbp), %rdx
14027b06c:     	testq	%rdx, %rdx
14027b06f:     	je	0x14027b083 <.text+0x27a083>
14027b071:     	movq	0x388(%rbp), %rcx
14027b078:     	movl	$0x1, %r8d
14027b07e:     	callq	0x1400021d0 <.text+0x11d0>
14027b083:     	movaps	0x400(%rbp), %xmm6
14027b08a:     	movaps	0x410(%rbp), %xmm7
14027b091:     	movaps	0x420(%rbp), %xmm8
14027b099:     	movaps	0x430(%rbp), %xmm9
14027b0a1:     	movaps	0x440(%rbp), %xmm10
14027b0a9:     	movaps	0x450(%rbp), %xmm11
14027b0b1:     	movaps	0x460(%rbp), %xmm12
14027b0b9:     	movaps	0x470(%rbp), %xmm13
14027b0c1:     	movaps	0x480(%rbp), %xmm14
14027b0c9:     	movaps	0x490(%rbp), %xmm15
14027b0d1:     	addq	$0x528, %rsp            # imm = 0x528
14027b0d8:     	popq	%rbx
14027b0d9:     	popq	%rdi
14027b0da:     	popq	%rsi
14027b0db:     	popq	%r12
14027b0dd:     	popq	%r13
14027b0df:     	popq	%r14
14027b0e1:     	popq	%r15
14027b0e3:     	popq	%rbp
14027b0e4:     	retq
14027b0e5:     	leaq	0x56e0134(%rip), %rax   # 0x14595b220
14027b0ec:     	movq	%rax, 0x20(%rsp)
14027b0f1:     	leaq	0x56e00a0(%rip), %rcx   # 0x14595b198
14027b0f8:     	leaq	0x56d70d9(%rip), %r9    # 0x1459521d8
14027b0ff:     	leaq	0x3df(%rbp), %r8
14027b106:     	movl	$0x37, %edx
14027b10b:     	callq	0x145903ab0 <.text+0x5902ab0>
14027b110:     	nop
14027b111:     	ud2

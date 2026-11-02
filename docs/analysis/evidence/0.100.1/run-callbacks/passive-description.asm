
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e9d90:     	pushq	%rbp
1454e9d91:     	pushq	%r15
1454e9d93:     	pushq	%r14
1454e9d95:     	pushq	%r13
1454e9d97:     	pushq	%r12
1454e9d99:     	pushq	%rsi
1454e9d9a:     	pushq	%rdi
1454e9d9b:     	pushq	%rbx
1454e9d9c:     	subq	$0x228, %rsp            # imm = 0x228
1454e9da3:     	leaq	0x80(%rsp), %rbp
1454e9dab:     	movaps	%xmm8, 0x190(%rbp)
1454e9db3:     	movaps	%xmm7, 0x180(%rbp)
1454e9dba:     	movaps	%xmm6, 0x170(%rbp)
1454e9dc1:     	movq	$-0x2, 0x168(%rbp)
1454e9dcc:     	movq	%r8, %r14
1454e9dcf:     	movq	%rdx, %rbx
1454e9dd2:     	movq	%rcx, %rsi
1454e9dd5:     	movq	(%rdx), %r15
1454e9dd8:     	movss	(%r8), %xmm2
1454e9ddd:     	movss	0x4(%r8), %xmm1
1454e9de3:     	movss	0x44(%r15), %xmm0
1454e9de9:     	movss	0x10(%rdx), %xmm6
1454e9dee:     	movss	0x38(%rdx), %xmm7
1454e9df3:     	movzbl	0x75(%r15), %eax
1454e9df8:     	addb	$-0x2, %al
1454e9dfa:     	cmpb	$0x6, %al
1454e9dfc:     	ja	0x1454e9e0f <.text+0x54e8e0f>
1454e9dfe:     	movzbl	%al, %eax
1454e9e01:     	leaq	0x150e72c(%rip), %rcx   # 0x1469f8534
1454e9e08:     	movss	(%rcx,%rax,4), %xmm3
1454e9e0d:     	jmp	0x1454e9e17 <.text+0x54e8e17>
1454e9e0f:     	movss	0x41d679(%rip), %xmm3   # 0x145907490
1454e9e17:     	mulss	0x4c(%rbx), %xmm2
1454e9e1c:     	xorps	%xmm4, %xmm4
1454e9e1f:     	cmpltss	%xmm0, %xmm4
1454e9e24:     	andps	%xmm2, %xmm4
1454e9e27:     	mulss	0x42e8c1(%rip), %xmm0   # 0x1459186f0
1454e9e2f:     	mulss	%xmm6, %xmm0
1454e9e33:     	mulss	%xmm7, %xmm0
1454e9e37:     	mulss	%xmm3, %xmm0
1454e9e3b:     	addss	%xmm4, %xmm0
1454e9e3f:     	mulss	%xmm0, %xmm1
1454e9e43:     	movq	%rbp, %rcx
1454e9e46:     	callq	0x14548d390 <.text+0x548c390>
1454e9e4b:     	movss	0x1c(%rbx), %xmm0
1454e9e50:     	mulss	0x44(%rbx), %xmm0
1454e9e55:     	mulss	0x50(%r15), %xmm0
1454e9e5b:     	mulss	0x28(%r14), %xmm0
1454e9e61:     	movss	0x72f57b(%rip), %xmm1   # 0x145c193e4
1454e9e69:     	ucomiss	%xmm0, %xmm1
1454e9e6c:     	jae	0x1454e9e96 <.text+0x54e8e96>
1454e9e6e:     	addss	0x14f038a(%rip), %xmm0  # 0x1469da200
1454e9e76:     	movss	0x42b981(%rip), %xmm8   # 0x145915800
1454e9e7f:     	divss	%xmm8, %xmm0
1454e9e84:     	callq	0x145773367 <.text+0x5772367>
1454e9e89:     	mulss	%xmm8, %xmm0
1454e9e8e:     	addss	0x72f54e(%rip), %xmm0   # 0x145c193e4
1454e9e96:     	leaq	-0x50(%rbp), %rcx
1454e9e9a:     	movaps	%xmm0, %xmm1
1454e9e9d:     	callq	0x14548d390 <.text+0x548c390>
1454e9ea2:     	nop
1454e9ea3:     	movq	(%r15), %rcx
1454e9ea6:     	movq	0x8(%r15), %rdx
1454e9eaa:     	cmpq	$0xb, %rdx
1454e9eae:     	je	0x1454e9f5a <.text+0x54e8f5a>
1454e9eb4:     	cmpq	$0xa, %rdx
1454e9eb8:     	jne	0x1454e9ede <.text+0x54e8ede>
1454e9eba:     	movq	(%rcx), %rax
1454e9ebd:     	xorq	0x12549b1(%rip), %rax   # 0x14673e875
1454e9ec4:     	movzwl	0x8(%rcx), %r8d
1454e9ec9:     	xorw	0x12549ac(%rip), %r8w   # 0x14673e87d
1454e9ed1:     	movzwl	%r8w, %r8d
1454e9ed5:     	orq	%rax, %r8
1454e9ed8:     	je	0x1454e9f78 <.text+0x54e8f78>
1454e9ede:     	movss	0x48(%r15), %xmm8
1454e9ee4:     	mulss	0x42e803(%rip), %xmm8   # 0x1459186f0
1454e9eed:     	mulss	0x14(%rbx), %xmm8
1454e9ef3:     	mulss	0x3c(%rbx), %xmm8
1454e9ef9:     	mulss	0x8(%r14), %xmm8
1454e9eff:     	maxss	0x41f6d8(%rip), %xmm8   # 0x1459095e0
1454e9f08:     	callq	0x1454536c0 <.text+0x54526c0>
1454e9f0d:     	maxss	%xmm8, %xmm0
1454e9f12:     	movss	0x50(%rbx), %xmm1
1454e9f17:     	maxss	0x4293d1(%rip), %xmm1   # 0x1459132f0
1454e9f1f:     	divss	%xmm1, %xmm0
1454e9f23:     	movq	$0x0, (%rsi)
1454e9f2a:     	movq	$0x1, 0x8(%rsi)
1454e9f32:     	movq	$0x0, 0x10(%rsi)
1454e9f3a:     	leaq	-0x20(%rbp), %rcx
1454e9f3e:     	movaps	%xmm0, %xmm1
1454e9f41:     	callq	0x14548d390 <.text+0x548c390>
1454e9f46:     	nop
1454e9f47:     	movq	0x8(%r15), %rdx
1454e9f4b:     	addq	$-0x9, %rdx
1454e9f4f:     	cmpq	$0x4, %rdx
1454e9f53:     	jbe	0x1454e9fb4 <.text+0x54e8fb4>
1454e9f55:     	jmp	0x1454eb65a <.text+0x54ea65a>
1454e9f5a:     	movq	(%rcx), %rax
1454e9f5d:     	xorq	0x1254942(%rip), %rax   # 0x14673e8a6
1454e9f64:     	movq	0x3(%rcx), %r8
1454e9f68:     	xorq	0x125493a(%rip), %r8    # 0x14673e8a9
1454e9f6f:     	orq	%rax, %r8
1454e9f72:     	jne	0x1454e9ede <.text+0x54e8ede>
1454e9f78:     	movq	$0x0, (%rsi)
1454e9f7f:     	movq	$0x1, 0x8(%rsi)
1454e9f87:     	movq	$0x0, 0x10(%rsi)
1454e9f8f:     	movq	(%rsi), %rax
1454e9f92:     	movq	%rax, -0x20(%rbp)
1454e9f96:     	movq	0x8(%rsi), %rax
1454e9f9a:     	movq	%rax, -0x18(%rbp)
1454e9f9e:     	movq	$0x0, -0x10(%rbp)
1454e9fa6:     	addq	$-0x9, %rdx
1454e9faa:     	cmpq	$0x4, %rdx
1454e9fae:     	ja	0x1454eb65a <.text+0x54ea65a>
1454e9fb4:     	leaq	0x150e8c5(%rip), %rax   # 0x1469f8880
1454e9fbb:     	movslq	(%rax,%rdx,4), %rcx
1454e9fbf:     	addq	%rax, %rcx
1454e9fc2:     	jmpq	*%rcx
1454e9fc4:     	movq	(%r15), %rax
1454e9fc7:     	movabsq	$0x676172646f6f6c62, %rcx # imm = 0x676172646F6F6C62
1454e9fd1:     	xorq	(%rax), %rcx
1454e9fd4:     	movzbl	0x8(%rax), %edx
1454e9fd8:     	xorq	$0x65, %rdx
1454e9fdc:     	orq	%rcx, %rdx
1454e9fdf:     	je	0x1454ea650 <.text+0x54e9650>
1454e9fe5:     	movabsq	$0x7461665f6c616573, %rcx # imm = 0x7461665F6C616573
1454e9fef:     	xorq	(%rax), %rcx
1454e9ff2:     	movzbl	0x8(%rax), %edx
1454e9ff6:     	xorq	$0x65, %rdx
1454e9ffa:     	orq	%rcx, %rdx
1454e9ffd:     	je	0x1454ea71c <.text+0x54e971c>
1454ea003:     	movabsq	$0x6c6577746867696c, %rcx # imm = 0x6C6577746867696C
1454ea00d:     	xorq	(%rax), %rcx
1454ea010:     	movzbl	0x8(%rax), %edx
1454ea014:     	xorq	$0x6c, %rdx
1454ea018:     	orq	%rcx, %rdx
1454ea01b:     	je	0x1454ea848 <.text+0x54e9848>
1454ea021:     	movabsq	$0x7269665f6c756f73, %rcx # imm = 0x7269665F6C756F73
1454ea02b:     	xorq	(%rax), %rcx
1454ea02e:     	movzbl	0x8(%rax), %edx
1454ea032:     	xorq	$0x65, %rdx
1454ea036:     	orq	%rcx, %rdx
1454ea039:     	je	0x1454eaa7c <.text+0x54e9a7c>
1454ea03f:     	movabsq	$0x70726f6d796c6f70, %rcx # imm = 0x70726F6D796C6F70
1454ea049:     	xorq	(%rax), %rcx
1454ea04c:     	movzbl	0x8(%rax), %eax
1454ea050:     	xorq	$0x68, %rax
1454ea054:     	orq	%rcx, %rax
1454ea057:     	jne	0x1454eb65a <.text+0x54ea65a>
1454ea05d:     	leaq	0x150d3dd(%rip), %rbx   # 0x1469f7441
1454ea064:     	movl	$0x141, %r14d           # imm = 0x141
1454ea06a:     	movl	$0x141, %edx            # imm = 0x141
1454ea06f:     	movq	%rbx, %rcx
1454ea072:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea077:     	nop
1454ea078:     	movq	%rdx, %rdi
1454ea07b:     	testq	%rax, %rax
1454ea07e:     	cmovneq	%rax, %rbx
1454ea082:     	cmoveq	%r14, %rdi
1454ea086:     	leaq	0x120(%rbp), %r13
1454ea08d:     	movss	0x41d47b(%rip), %xmm1   # 0x145907510
1454ea095:     	movq	%r13, %rcx
1454ea098:     	callq	0x14548d390 <.text+0x548c390>
1454ea09d:     	nop
1454ea09e:     	leaq	0x108(%rbp), %r14
1454ea0a5:     	movss	0x42b753(%rip), %xmm1   # 0x145915800
1454ea0ad:     	movq	%r14, %rcx
1454ea0b0:     	callq	0x14548d390 <.text+0x548c390>
1454ea0b5:     	nop
1454ea0b6:     	leaq	0x150(%rbp), %r12
1454ea0bd:     	movss	0x150be93(%rip), %xmm1  # 0x1469f5f58
1454ea0c5:     	movq	%r12, %rcx
1454ea0c8:     	callq	0x14548d390 <.text+0x548c390>
1454ea0cd:     	nop
1454ea0ce:     	leaq	0x150d36b(%rip), %rax   # 0x1469f7440
1454ea0d5:     	movq	%rax, 0x28(%rbp)
1454ea0d9:     	movq	$0x1, 0x30(%rbp)
1454ea0e1:     	movq	%r13, 0x38(%rbp)
1454ea0e5:     	leaq	0x150cb64(%rip), %rax   # 0x1469f6c50
1454ea0ec:     	movq	%rax, 0x40(%rbp)
1454ea0f0:     	leaq	0x150d48b(%rip), %rcx   # 0x1469f7582
1454ea0f7:     	movq	%rcx, 0x48(%rbp)
1454ea0fb:     	movq	$0x2, 0x50(%rbp)
1454ea103:     	leaq	-0x20(%rbp), %rcx
1454ea107:     	movq	%rcx, 0x58(%rbp)
1454ea10b:     	movq	%rax, 0x60(%rbp)
1454ea10f:     	leaq	0x150d47a(%rip), %rcx   # 0x1469f7590
1454ea116:     	movq	%rcx, 0x68(%rbp)
1454ea11a:     	movq	$0x5, 0x70(%rbp)
1454ea122:     	leaq	0x150d45f(%rip), %rcx   # 0x1469f7588
1454ea129:     	movq	%rcx, 0x78(%rbp)
1454ea12d:     	leaq	0x150cb8c(%rip), %rcx   # 0x1469f6cc0
1454ea134:     	movq	%rcx, 0x80(%rbp)
1454ea13b:     	leaq	0x150c938(%rip), %rcx   # 0x1469f6a7a
1454ea142:     	movq	%rcx, 0x88(%rbp)
1454ea149:     	movq	$0x4, 0x90(%rbp)
1454ea154:     	movq	%r14, 0x98(%rbp)
1454ea15b:     	movq	%rax, 0xa0(%rbp)
1454ea162:     	leaq	0x150d42c(%rip), %rcx   # 0x1469f7595
1454ea169:     	movq	%rcx, 0xa8(%rbp)
1454ea170:     	movq	$0x3, 0xb0(%rbp)
1454ea17b:     	movq	%r12, 0xb8(%rbp)
1454ea182:     	movq	%rax, 0xc0(%rbp)
1454ea189:     	leaq	0x150d408(%rip), %rcx   # 0x1469f7598
1454ea190:     	movq	%rcx, 0xc8(%rbp)
1454ea197:     	movq	$0x3, 0xd0(%rbp)
1454ea1a2:     	movq	%rbp, %rcx
1454ea1a5:     	movq	%rcx, 0xd8(%rbp)
1454ea1ac:     	movq	%rax, 0xe0(%rbp)
1454ea1b3:     	leaq	0x150d3e1(%rip), %rcx   # 0x1469f759b
1454ea1ba:     	movq	%rcx, 0xe8(%rbp)
1454ea1c1:     	movq	$0x1, 0xf0(%rbp)
1454ea1cc:     	leaq	-0x50(%rbp), %rcx
1454ea1d0:     	movq	%rcx, 0xf8(%rbp)
1454ea1d7:     	movq	%rax, 0x100(%rbp)
1454ea1de:     	movq	$0x7, 0x20(%rsp)
1454ea1e7:     	leaq	0x28(%rbp), %r9
1454ea1eb:     	movq	%rsi, %rcx
1454ea1ee:     	movq	%rbx, %rdx
1454ea1f1:     	movq	%rdi, %r8
1454ea1f4:     	callq	0x145458060 <.text+0x5457060>
1454ea1f9:     	nop
1454ea1fa:     	jmp	0x1454eb087 <.text+0x54ea087>
1454ea1ff:     	movq	(%r15), %rax
1454ea202:     	movabsq	$0x5f666f5f6c6c6163, %rcx # imm = 0x5F666F5F6C6C6163
1454ea20c:     	xorq	(%rax), %rcx
1454ea20f:     	movabsq	$0x656d616c665f666f, %rdx # imm = 0x656D616C665F666F
1454ea219:     	xorq	0x5(%rax), %rdx
1454ea21d:     	orq	%rcx, %rdx
1454ea220:     	jne	0x1454eb65a <.text+0x54ea65a>
1454ea226:     	leaq	0x150d5a1(%rip), %rdi   # 0x1469f77ce
1454ea22d:     	movl	$0x8b, %ebx
1454ea232:     	movl	$0x8b, %edx
1454ea237:     	movq	%rdi, %rcx
1454ea23a:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea23f:     	nop
1454ea240:     	movq	%rdx, %r8
1454ea243:     	testq	%rax, %rax
1454ea246:     	cmovneq	%rax, %rdi
1454ea24a:     	cmoveq	%rbx, %r8
1454ea24e:     	leaq	0x150d343(%rip), %rax   # 0x1469f7598
1454ea255:     	movq	%rax, 0x28(%rbp)
1454ea259:     	movq	$0x3, 0x30(%rbp)
1454ea261:     	movq	%rbp, %rax
1454ea264:     	movq	%rax, 0x38(%rbp)
1454ea268:     	leaq	0x150c9e1(%rip), %rax   # 0x1469f6c50
1454ea26f:     	movq	%rax, 0x40(%rbp)
1454ea273:     	leaq	0x150d321(%rip), %rcx   # 0x1469f759b
1454ea27a:     	movq	%rcx, 0x48(%rbp)
1454ea27e:     	movq	$0x1, 0x50(%rbp)
1454ea286:     	leaq	-0x50(%rbp), %rcx
1454ea28a:     	movq	%rcx, 0x58(%rbp)
1454ea28e:     	movq	%rax, 0x60(%rbp)
1454ea292:     	leaq	0x150d2e9(%rip), %rcx   # 0x1469f7582
1454ea299:     	movq	%rcx, 0x68(%rbp)
1454ea29d:     	movq	$0x2, 0x70(%rbp)
1454ea2a5:     	leaq	-0x20(%rbp), %rcx
1454ea2a9:     	movq	%rcx, 0x78(%rbp)
1454ea2ad:     	movq	%rax, 0x80(%rbp)
1454ea2b4:     	movq	$0x3, 0x20(%rsp)
1454ea2bd:     	leaq	0x28(%rbp), %r9
1454ea2c1:     	movq	%rsi, %rcx
1454ea2c4:     	movq	%rdi, %rdx
1454ea2c7:     	callq	0x145458060 <.text+0x5457060>
1454ea2cc:     	nop
1454ea2cd:     	jmp	0x1454eb65a <.text+0x54ea65a>
1454ea2d2:     	movq	(%r15), %rax
1454ea2d5:     	movabsq	$0x665f656972656166, %rcx # imm = 0x665F656972656166
1454ea2df:     	xorq	(%rax), %rcx
1454ea2e2:     	movabsq	$0x657269665f656972, %rdx # imm = 0x657269665F656972
1454ea2ec:     	xorq	0x3(%rax), %rdx
1454ea2f0:     	orq	%rcx, %rdx
1454ea2f3:     	jne	0x1454eb65a <.text+0x54ea65a>
1454ea2f9:     	movl	0x54(%r15), %eax
1454ea2fd:     	testl	%eax, %eax
1454ea2ff:     	je	0x1454ea7c6 <.text+0x54e97c6>
1454ea305:     	addl	0x18(%rbx), %eax
1454ea308:     	addl	0x40(%rbx), %eax
1454ea30b:     	addl	0x34(%r14), %eax
1454ea30f:     	je	0x1454ea7c6 <.text+0x54e97c6>
1454ea315:     	cmpl	$0x3, %eax
1454ea318:     	movl	$0x3, %ecx
1454ea31d:     	cmovbl	%eax, %ecx
1454ea320:     	movl	%ecx, -0x38(%rbp)
1454ea323:     	cmpl	$0x1, %eax
1454ea326:     	je	0x1454ea7cd <.text+0x54e97cd>
1454ea32c:     	leaq	0x150d27a(%rip), %rdi   # 0x1469f75ad
1454ea333:     	movl	$0x17, %ebx
1454ea338:     	movl	$0x17, %edx
1454ea33d:     	movq	%rdi, %rcx
1454ea340:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea345:     	nop
1454ea346:     	movq	%rdx, %r8
1454ea349:     	testq	%rax, %rax
1454ea34c:     	cmovneq	%rax, %rdi
1454ea350:     	cmoveq	%rbx, %r8
1454ea354:     	leaq	0x150c115(%rip), %rax   # 0x1469f6470
1454ea35b:     	movq	%rax, 0x28(%rbp)
1454ea35f:     	movq	$0x1, 0x30(%rbp)
1454ea367:     	leaq	-0x38(%rbp), %rax
1454ea36b:     	movq	%rax, 0x38(%rbp)
1454ea36f:     	leaq	0x150c0da(%rip), %rax   # 0x1469f6450
1454ea376:     	movq	%rax, 0x40(%rbp)
1454ea37a:     	movq	$0x1, 0x20(%rsp)
1454ea383:     	leaq	0x138(%rbp), %rcx
1454ea38a:     	leaq	0x28(%rbp), %r9
1454ea38e:     	movq	%rdi, %rdx
1454ea391:     	callq	0x145458060 <.text+0x5457060>
1454ea396:     	nop
1454ea397:     	jmp	0x1454eaeb1 <.text+0x54e9eb1>
1454ea39c:     	movq	(%r15), %rax
1454ea39f:     	movabsq	$0x5f737265746e7568, %rcx # imm = 0x5F737265746E7568
1454ea3a9:     	xorq	(%rax), %rcx
1454ea3ac:     	movl	0x8(%rax), %eax
1454ea3af:     	xorq	$0x6b72616d, %rax       # imm = 0x6B72616D
1454ea3b5:     	orq	%rcx, %rax
1454ea3b8:     	jne	0x1454eb65a <.text+0x54ea65a>
1454ea3be:     	leaq	0x150d6f3(%rip), %rdi   # 0x1469f7ab8
1454ea3c5:     	movl	$0xf0, %r14d
1454ea3cb:     	movl	$0xf0, %edx
1454ea3d0:     	movq	%rdi, %rcx
1454ea3d3:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea3d8:     	nop
1454ea3d9:     	movq	%rdx, %rbx
1454ea3dc:     	testq	%rax, %rax
1454ea3df:     	cmovneq	%rax, %rdi
1454ea3e3:     	cmoveq	%r14, %rbx
1454ea3e7:     	movss	0x4c(%r15), %xmm1
1454ea3ed:     	leaq	0x108(%rbp), %r14
1454ea3f4:     	movq	%r14, %rcx
1454ea3f7:     	callq	0x14548d390 <.text+0x548c390>
1454ea3fc:     	nop
1454ea3fd:     	mulss	%xmm7, %xmm6
1454ea401:     	xorps	%xmm1, %xmm1
1454ea404:     	sqrtss	%xmm6, %xmm1
1454ea408:     	mulss	0x41d10c(%rip), %xmm1   # 0x14590751c
1454ea410:     	minss	0x45585c(%rip), %xmm1   # 0x14593fc74
1454ea418:     	mulss	0x41d11c(%rip), %xmm1   # 0x14590753c
1454ea420:     	leaq	0x150(%rbp), %r12
1454ea427:     	movq	%r12, %rcx
1454ea42a:     	callq	0x14548d390 <.text+0x548c390>
1454ea42f:     	nop
1454ea430:     	leaq	0x150d2b6(%rip), %rax   # 0x1469f76ed
1454ea437:     	movq	%rax, 0x28(%rbp)
1454ea43b:     	movq	$0x5, 0x30(%rbp)
1454ea443:     	movq	%r14, 0x38(%rbp)
1454ea447:     	leaq	0x150c802(%rip), %rax   # 0x1469f6c50
1454ea44e:     	movq	%rax, 0x40(%rbp)
1454ea452:     	leaq	0x150cfe7(%rip), %rcx   # 0x1469f7440
1454ea459:     	movq	%rcx, 0x48(%rbp)
1454ea45d:     	movq	$0x1, 0x50(%rbp)
1454ea465:     	movq	%r12, 0x58(%rbp)
1454ea469:     	movq	%rax, 0x60(%rbp)
1454ea46d:     	leaq	0x150d124(%rip), %rcx   # 0x1469f7598
1454ea474:     	movq	%rcx, 0x68(%rbp)
1454ea478:     	movq	$0x3, 0x70(%rbp)
1454ea480:     	movq	%rbp, %rcx
1454ea483:     	movq	%rcx, 0x78(%rbp)
1454ea487:     	movq	%rax, 0x80(%rbp)
1454ea48e:     	leaq	0x150d106(%rip), %rcx   # 0x1469f759b
1454ea495:     	movq	%rcx, 0x88(%rbp)
1454ea49c:     	movq	$0x1, 0x90(%rbp)
1454ea4a7:     	leaq	-0x50(%rbp), %rcx
1454ea4ab:     	movq	%rcx, 0x98(%rbp)
1454ea4b2:     	movq	%rax, 0xa0(%rbp)
1454ea4b9:     	leaq	0x150d0c2(%rip), %rcx   # 0x1469f7582
1454ea4c0:     	movq	%rcx, 0xa8(%rbp)
1454ea4c7:     	movq	$0x2, 0xb0(%rbp)
1454ea4d2:     	leaq	-0x20(%rbp), %rcx
1454ea4d6:     	movq	%rcx, 0xb8(%rbp)
1454ea4dd:     	movq	%rax, 0xc0(%rbp)
1454ea4e4:     	movq	$0x5, 0x20(%rsp)
1454ea4ed:     	leaq	0x28(%rbp), %r9
1454ea4f1:     	movq	%rsi, %rcx
1454ea4f4:     	movq	%rdi, %rdx
1454ea4f7:     	movq	%rbx, %r8
1454ea4fa:     	callq	0x145458060 <.text+0x5457060>
1454ea4ff:     	nop
1454ea500:     	jmp	0x1454eb61e <.text+0x54ea61e>
1454ea505:     	movq	(%r15), %rax
1454ea508:     	movabsq	$0x6974706d65646572, %rcx # imm = 0x6974706D65646572
1454ea512:     	xorq	(%rax), %rcx
1454ea515:     	movzwl	0x8(%rax), %eax
1454ea519:     	xorq	$0x6e6f, %rax           # imm = 0x6E6F
1454ea51f:     	orq	%rcx, %rax
1454ea522:     	jne	0x1454eb65a <.text+0x54ea65a>
1454ea528:     	leaq	0x150d679(%rip), %rdi   # 0x1469f7ba8
1454ea52f:     	movl	$0xc2, %edx
1454ea534:     	movq	%rdi, %rcx
1454ea537:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea53c:     	nop
1454ea53d:     	movq	%rax, %r13
1454ea540:     	movq	%rdx, %r12
1454ea543:     	movss	0x48(%r15), %xmm0
1454ea549:     	movss	0x428d9f(%rip), %xmm1   # 0x1459132f0
1454ea551:     	mulss	%xmm0, %xmm1
1454ea555:     	movss	0x42e193(%rip), %xmm2   # 0x1459186f0
1454ea55d:     	mulss	%xmm2, %xmm0
1454ea561:     	mulss	0x14(%rbx), %xmm0
1454ea566:     	mulss	0x3c(%rbx), %xmm0
1454ea56b:     	mulss	0x8(%r14), %xmm0
1454ea571:     	maxss	0x41f067(%rip), %xmm0   # 0x1459095e0
1454ea579:     	mulss	%xmm2, %xmm1
1454ea57d:     	divss	%xmm0, %xmm1
1454ea581:     	minss	0x41cf93(%rip), %xmm1   # 0x14590751c
1454ea589:     	mulss	0x50(%rbx), %xmm1
1454ea58e:     	mulss	0x41cfa6(%rip), %xmm1   # 0x14590753c
1454ea596:     	leaq	0x150(%rbp), %rbx
1454ea59d:     	movq	%rbx, %rcx
1454ea5a0:     	callq	0x14548d390 <.text+0x548c390>
1454ea5a5:     	nop
1454ea5a6:     	testq	%r13, %r13
1454ea5a9:     	movl	$0xc2, %eax
1454ea5ae:     	cmoveq	%rax, %r12
1454ea5b2:     	cmovneq	%r13, %rdi
1454ea5b6:     	leaq	0x150ce83(%rip), %rax   # 0x1469f7440
1454ea5bd:     	movq	%rax, 0x28(%rbp)
1454ea5c1:     	movq	$0x1, 0x30(%rbp)
1454ea5c9:     	movq	%rbx, 0x38(%rbp)
1454ea5cd:     	leaq	0x150c67c(%rip), %rax   # 0x1469f6c50
1454ea5d4:     	movq	%rax, 0x40(%rbp)
1454ea5d8:     	leaq	0x150cfb9(%rip), %rcx   # 0x1469f7598
1454ea5df:     	movq	%rcx, 0x48(%rbp)
1454ea5e3:     	movq	$0x3, 0x50(%rbp)
1454ea5eb:     	movq	%rbp, %rcx
1454ea5ee:     	movq	%rcx, 0x58(%rbp)
1454ea5f2:     	movq	%rax, 0x60(%rbp)
1454ea5f6:     	leaq	0x150cf9e(%rip), %rcx   # 0x1469f759b
1454ea5fd:     	movq	%rcx, 0x68(%rbp)
1454ea601:     	movq	$0x1, 0x70(%rbp)
1454ea609:     	leaq	-0x50(%rbp), %rcx
1454ea60d:     	movq	%rcx, 0x78(%rbp)
1454ea611:     	movq	%rax, 0x80(%rbp)
1454ea618:     	movq	$0x3, 0x20(%rsp)
1454ea621:     	leaq	0x28(%rbp), %r9
1454ea625:     	movq	%rsi, %rcx
1454ea628:     	movq	%rdi, %rdx
1454ea62b:     	movq	%r12, %r8
1454ea62e:     	callq	0x145458060 <.text+0x5457060>
1454ea633:     	nop
1454ea634:     	movq	0x150(%rbp), %rdx
1454ea63b:     	testq	%rdx, %rdx
1454ea63e:     	je	0x1454eb65a <.text+0x54ea65a>
1454ea644:     	movq	0x158(%rbp), %rcx
1454ea64b:     	jmp	0x1454eb64f <.text+0x54ea64f>
1454ea650:     	leaq	0x150d613(%rip), %r12   # 0x1469f7c6a
1454ea657:     	movl	$0xd4, %edi
1454ea65c:     	movl	$0xd4, %edx
1454ea661:     	movq	%r12, %rcx
1454ea664:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea669:     	nop
1454ea66a:     	movq	%rdx, %r13
1454ea66d:     	testq	%rax, %rax
1454ea670:     	cmovneq	%rax, %r12
1454ea674:     	cmoveq	%rdi, %r13
1454ea678:     	leaq	0x108(%rbp), %rdi
1454ea67f:     	movss	0x428c6d(%rip), %xmm1   # 0x1459132f4
1454ea687:     	movq	%rdi, %rcx
1454ea68a:     	callq	0x14548d390 <.text+0x548c390>
1454ea68f:     	nop
1454ea690:     	movq	(%r15), %rcx
1454ea693:     	movq	0x8(%r15), %rdx
1454ea697:     	cmpq	$0xb, %rdx
1454ea69b:     	je	0x1454ea935 <.text+0x54e9935>
1454ea6a1:     	cmpq	$0xa, %rdx
1454ea6a5:     	jne	0x1454ea6cb <.text+0x54e96cb>
1454ea6a7:     	movq	(%rcx), %rax
1454ea6aa:     	xorq	0x12541c4(%rip), %rax   # 0x14673e875
1454ea6b1:     	movzwl	0x8(%rcx), %r8d
1454ea6b6:     	xorw	0x12541bf(%rip), %r8w   # 0x14673e87d
1454ea6be:     	movzwl	%r8w, %r8d
1454ea6c2:     	orq	%rax, %r8
1454ea6c5:     	je	0x1454ea953 <.text+0x54e9953>
1454ea6cb:     	movss	0x48(%r15), %xmm6
1454ea6d1:     	mulss	0x42e017(%rip), %xmm6   # 0x1459186f0
1454ea6d9:     	mulss	0x14(%rbx), %xmm6
1454ea6de:     	mulss	0x3c(%rbx), %xmm6
1454ea6e3:     	mulss	0x8(%r14), %xmm6
1454ea6e9:     	maxss	0x41eeef(%rip), %xmm6   # 0x1459095e0
1454ea6f1:     	callq	0x1454536c0 <.text+0x54526c0>
1454ea6f6:     	movss	0x50(%rbx), %xmm1
1454ea6fb:     	maxss	0x428bed(%rip), %xmm1   # 0x1459132f0
1454ea703:     	maxss	%xmm6, %xmm0
1454ea707:     	divss	%xmm1, %xmm0
1454ea70b:     	movss	0x41ce29(%rip), %xmm1   # 0x14590753c
1454ea713:     	divss	%xmm0, %xmm1
1454ea717:     	jmp	0x1454ea95b <.text+0x54e995b>
1454ea71c:     	movl	0x54(%r15), %eax
1454ea720:     	testl	%eax, %eax
1454ea722:     	je	0x1454ea8e9 <.text+0x54e98e9>
1454ea728:     	addl	0x18(%rbx), %eax
1454ea72b:     	addl	0x40(%rbx), %eax
1454ea72e:     	addl	0x34(%r14), %eax
1454ea732:     	je	0x1454ea8e9 <.text+0x54e98e9>
1454ea738:     	cmpl	$0x3, %eax
1454ea73b:     	movl	$0x3, %ecx
1454ea740:     	cmovbl	%eax, %ecx
1454ea743:     	movl	%ecx, 0x138(%rbp)
1454ea749:     	cmpl	$0x1, %eax
1454ea74c:     	je	0x1454ea8f3 <.text+0x54e98f3>
1454ea752:     	leaq	0x150d228(%rip), %rdi   # 0x1469f7981
1454ea759:     	movl	$0x11, %r12d
1454ea75f:     	movl	$0x11, %edx
1454ea764:     	movq	%rdi, %rcx
1454ea767:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea76c:     	nop
1454ea76d:     	movq	%rdx, %r8
1454ea770:     	testq	%rax, %rax
1454ea773:     	cmovneq	%rax, %rdi
1454ea777:     	cmoveq	%r12, %r8
1454ea77b:     	leaq	0x150bcee(%rip), %rax   # 0x1469f6470
1454ea782:     	movq	%rax, 0x28(%rbp)
1454ea786:     	movq	$0x1, 0x30(%rbp)
1454ea78e:     	leaq	0x138(%rbp), %rax
1454ea795:     	movq	%rax, 0x38(%rbp)
1454ea799:     	leaq	0x150bcb0(%rip), %rax   # 0x1469f6450
1454ea7a0:     	movq	%rax, 0x40(%rbp)
1454ea7a4:     	movq	$0x1, 0x20(%rsp)
1454ea7ad:     	leaq	0x120(%rbp), %rcx
1454ea7b4:     	leaq	0x28(%rbp), %r9
1454ea7b8:     	movq	%rdi, %rdx
1454ea7bb:     	callq	0x145458060 <.text+0x5457060>
1454ea7c0:     	nop
1454ea7c1:     	jmp	0x1454eb467 <.text+0x54ea467>
1454ea7c6:     	movl	$0x1, -0x38(%rbp)
1454ea7cd:     	leaq	0x150cdc8(%rip), %rbx   # 0x1469f759c
1454ea7d4:     	movl	$0x11, %r14d
1454ea7da:     	movl	$0x11, %edx
1454ea7df:     	movq	%rbx, %rcx
1454ea7e2:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea7e7:     	nop
1454ea7e8:     	movq	%rdx, %rdi
1454ea7eb:     	testq	%rax, %rax
1454ea7ee:     	cmovneq	%rax, %rbx
1454ea7f2:     	cmoveq	%r14, %rdi
1454ea7f6:     	testq	%rdi, %rdi
1454ea7f9:     	jns	0x1454ea80f <.text+0x54e980f>
1454ea7fb:     	xorl	%r12d, %r12d
1454ea7fe:     	movq	%r12, %rcx
1454ea801:     	movq	%rdi, %rdx
1454ea804:     	callq	0x14590379b <.text+0x590279b>
1454ea809:     	nop
1454ea80a:     	jmp	0x1454eb713 <.text+0x54ea713>
1454ea80f:     	je	0x1454eae96 <.text+0x54e9e96>
1454ea815:     	callq	0x140002200 <.text+0x1200>
1454ea81a:     	movl	$0x1, %r12d
1454ea820:     	movl	$0x1, %edx
1454ea825:     	movq	%rdi, %rcx
1454ea828:     	callq	0x1400021c0 <.text+0x11c0>
1454ea82d:     	testq	%rax, %rax
1454ea830:     	je	0x1454ea7fe <.text+0x54e97fe>
1454ea832:     	movq	%rax, %r14
1454ea835:     	movq	%rax, %rcx
1454ea838:     	movq	%rbx, %rdx
1454ea83b:     	movq	%rdi, %r8
1454ea83e:     	callq	0x1457731ed <.text+0x57721ed>
1454ea843:     	jmp	0x1454eae9c <.text+0x54e9e9c>
1454ea848:     	movl	0x54(%r15), %eax
1454ea84c:     	testl	%eax, %eax
1454ea84e:     	je	0x1454eab26 <.text+0x54e9b26>
1454ea854:     	addl	0x18(%rbx), %eax
1454ea857:     	addl	0x40(%rbx), %eax
1454ea85a:     	addl	0x34(%r14), %eax
1454ea85e:     	je	0x1454eab26 <.text+0x54e9b26>
1454ea864:     	cmpl	$0x3, %eax
1454ea867:     	movl	$0x3, %ecx
1454ea86c:     	cmovbl	%eax, %ecx
1454ea86f:     	movl	%ecx, 0x1c(%rbp)
1454ea872:     	cmpl	$0x1, %eax
1454ea875:     	je	0x1454eab2d <.text+0x54e9b2d>
1454ea87b:     	leaq	0x150cd2b(%rip), %rdi   # 0x1469f75ad
1454ea882:     	movl	$0x17, %r12d
1454ea888:     	movl	$0x17, %edx
1454ea88d:     	movq	%rdi, %rcx
1454ea890:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea895:     	nop
1454ea896:     	movq	%rdx, %r8
1454ea899:     	testq	%rax, %rax
1454ea89c:     	cmovneq	%rax, %rdi
1454ea8a0:     	cmoveq	%r12, %r8
1454ea8a4:     	leaq	0x150bbc5(%rip), %rax   # 0x1469f6470
1454ea8ab:     	movq	%rax, 0x28(%rbp)
1454ea8af:     	movq	$0x1, 0x30(%rbp)
1454ea8b7:     	leaq	0x1c(%rbp), %rax
1454ea8bb:     	movq	%rax, 0x38(%rbp)
1454ea8bf:     	leaq	0x150bb8a(%rip), %rax   # 0x1469f6450
1454ea8c6:     	movq	%rax, 0x40(%rbp)
1454ea8ca:     	movq	$0x1, 0x20(%rsp)
1454ea8d3:     	leaq	-0x38(%rbp), %rcx
1454ea8d7:     	leaq	0x28(%rbp), %r9
1454ea8db:     	movq	%rdi, %rdx
1454ea8de:     	callq	0x145458060 <.text+0x5457060>
1454ea8e3:     	nop
1454ea8e4:     	jmp	0x1454eabad <.text+0x54e9bad>
1454ea8e9:     	movl	$0x1, 0x138(%rbp)
1454ea8f3:     	leaq	0x150d07f(%rip), %r13   # 0x1469f7979
1454ea8fa:     	movl	$0x8, %r12d
1454ea900:     	movl	$0x8, %edx
1454ea905:     	movq	%r13, %rcx
1454ea908:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ea90d:     	nop
1454ea90e:     	movq	%rdx, %rdi
1454ea911:     	testq	%rax, %rax
1454ea914:     	cmovneq	%rax, %r13
1454ea918:     	cmoveq	%r12, %rdi
1454ea91c:     	testq	%rdi, %rdi
1454ea91f:     	jns	0x1454eaa40 <.text+0x54e9a40>
1454ea925:     	xorl	%ecx, %ecx
1454ea927:     	movq	%rdi, %rdx
1454ea92a:     	callq	0x14590379b <.text+0x590279b>
1454ea92f:     	nop
1454ea930:     	jmp	0x1454eb713 <.text+0x54ea713>
1454ea935:     	movq	(%rcx), %rax
1454ea938:     	xorq	0x1253f67(%rip), %rax   # 0x14673e8a6
1454ea93f:     	movq	0x3(%rcx), %r8
1454ea943:     	xorq	0x1253f5f(%rip), %r8    # 0x14673e8a9
1454ea94a:     	orq	%rax, %r8
1454ea94d:     	jne	0x1454ea6cb <.text+0x54e96cb>
1454ea953:     	movss	0x42aea5(%rip), %xmm1   # 0x145915800
1454ea95b:     	leaq	0x150(%rbp), %rbx
1454ea962:     	movq	%rbx, %rcx
1454ea965:     	callq	0x14548d390 <.text+0x548c390>
1454ea96a:     	nop
1454ea96b:     	leaq	0x150d3cc(%rip), %rax   # 0x1469f7d3e
1454ea972:     	movq	%rax, 0x28(%rbp)
1454ea976:     	movq	$0x4, 0x30(%rbp)
1454ea97e:     	movq	%rdi, 0x38(%rbp)
1454ea982:     	leaq	0x150c2c7(%rip), %rax   # 0x1469f6c50
1454ea989:     	movq	%rax, 0x40(%rbp)
1454ea98d:     	leaq	0x150cd70(%rip), %rcx   # 0x1469f7704
1454ea994:     	movq	%rcx, 0x48(%rbp)
1454ea998:     	movq	$0x7, 0x50(%rbp)
1454ea9a0:     	movq	%rbx, 0x58(%rbp)
1454ea9a4:     	movq	%rax, 0x60(%rbp)
1454ea9a8:     	leaq	0x150cbe9(%rip), %rcx   # 0x1469f7598
1454ea9af:     	movq	%rcx, 0x68(%rbp)
1454ea9b3:     	movq	$0x3, 0x70(%rbp)
1454ea9bb:     	movq	%rbp, %rcx
1454ea9be:     	movq	%rcx, 0x78(%rbp)
1454ea9c2:     	movq	%rax, 0x80(%rbp)
1454ea9c9:     	leaq	0x150cbcb(%rip), %rcx   # 0x1469f759b
1454ea9d0:     	movq	%rcx, 0x88(%rbp)
1454ea9d7:     	movq	$0x1, 0x90(%rbp)
1454ea9e2:     	leaq	-0x50(%rbp), %rcx
1454ea9e6:     	movq	%rcx, 0x98(%rbp)
1454ea9ed:     	movq	%rax, 0xa0(%rbp)
1454ea9f4:     	leaq	0x150cb87(%rip), %rcx   # 0x1469f7582
1454ea9fb:     	movq	%rcx, 0xa8(%rbp)
1454eaa02:     	movq	$0x2, 0xb0(%rbp)
1454eaa0d:     	leaq	-0x20(%rbp), %rcx
1454eaa11:     	movq	%rcx, 0xb8(%rbp)
1454eaa18:     	movq	%rax, 0xc0(%rbp)
1454eaa1f:     	movq	$0x5, 0x20(%rsp)
1454eaa28:     	leaq	0x28(%rbp), %r9
1454eaa2c:     	movq	%rsi, %rcx
1454eaa2f:     	movq	%r12, %rdx
1454eaa32:     	movq	%r13, %r8
1454eaa35:     	callq	0x145458060 <.text+0x5457060>
1454eaa3a:     	nop
1454eaa3b:     	jmp	0x1454eb61e <.text+0x54ea61e>
1454eaa40:     	je	0x1454eb44c <.text+0x54ea44c>
1454eaa46:     	callq	0x140002200 <.text+0x1200>
1454eaa4b:     	movl	$0x1, %edx
1454eaa50:     	movq	%rdi, %rcx
1454eaa53:     	callq	0x1400021c0 <.text+0x11c0>
1454eaa58:     	movl	$0x1, %ecx
1454eaa5d:     	testq	%rax, %rax
1454eaa60:     	je	0x1454ea927 <.text+0x54e9927>
1454eaa66:     	movq	%rax, %r12
1454eaa69:     	movq	%rax, %rcx
1454eaa6c:     	movq	%r13, %rdx
1454eaa6f:     	movq	%rdi, %r8
1454eaa72:     	callq	0x1457731ed <.text+0x57721ed>
1454eaa77:     	jmp	0x1454eb452 <.text+0x54ea452>
1454eaa7c:     	movl	0x54(%r15), %eax
1454eaa80:     	testl	%eax, %eax
1454eaa82:     	je	0x1454eb0df <.text+0x54ea0df>
1454eaa88:     	addl	0x18(%rbx), %eax
1454eaa8b:     	addl	0x40(%rbx), %eax
1454eaa8e:     	addl	0x34(%r14), %eax
1454eaa92:     	je	0x1454eb0df <.text+0x54ea0df>
1454eaa98:     	cmpl	$0x3, %eax
1454eaa9b:     	movl	$0x3, %ecx
1454eaaa0:     	cmovbl	%eax, %ecx
1454eaaa3:     	movl	%ecx, 0x138(%rbp)
1454eaaa9:     	cmpl	$0x1, %eax
1454eaaac:     	je	0x1454eb0e9 <.text+0x54ea0e9>
1454eaab2:     	leaq	0x150cc64(%rip), %rdi   # 0x1469f771d
1454eaab9:     	movl	$0x20, %r12d
1454eaabf:     	movl	$0x20, %edx
1454eaac4:     	movq	%rdi, %rcx
1454eaac7:     	callq	0x145457cb0 <.text+0x5456cb0>
1454eaacc:     	nop
1454eaacd:     	movq	%rdx, %r8
1454eaad0:     	testq	%rax, %rax
1454eaad3:     	cmovneq	%rax, %rdi
1454eaad7:     	cmoveq	%r12, %r8
1454eaadb:     	leaq	0x150b98e(%rip), %rax   # 0x1469f6470
1454eaae2:     	movq	%rax, 0x28(%rbp)
1454eaae6:     	movq	$0x1, 0x30(%rbp)
1454eaaee:     	leaq	0x138(%rbp), %rax
1454eaaf5:     	movq	%rax, 0x38(%rbp)
1454eaaf9:     	leaq	0x150b950(%rip), %rax   # 0x1469f6450
1454eab00:     	movq	%rax, 0x40(%rbp)
1454eab04:     	movq	$0x1, 0x20(%rsp)
1454eab0d:     	leaq	0x120(%rbp), %rcx
1454eab14:     	leaq	0x28(%rbp), %r9
1454eab18:     	movq	%rdi, %rdx
1454eab1b:     	callq	0x145458060 <.text+0x5457060>
1454eab20:     	nop
1454eab21:     	jmp	0x1454eb172 <.text+0x54ea172>
1454eab26:     	movl	$0x1, 0x1c(%rbp)
1454eab2d:     	leaq	0x150ca68(%rip), %rdi   # 0x1469f759c
1454eab34:     	movl	$0x11, %r13d
1454eab3a:     	movl	$0x11, %edx
1454eab3f:     	movq	%rdi, %rcx
1454eab42:     	callq	0x145457cb0 <.text+0x5456cb0>
1454eab47:     	nop
1454eab48:     	movq	%rdx, %r12
1454eab4b:     	testq	%rax, %rax
1454eab4e:     	cmovneq	%rax, %rdi
1454eab52:     	cmoveq	%r13, %r12
1454eab56:     	movq	$0x1, 0x20(%rsp)
1454eab5f:     	leaq	0x28(%rbp), %rcx
1454eab63:     	movl	$0x1, %r9d
1454eab69:     	movq	%r12, %rdx
1454eab6c:     	xorl	%r8d, %r8d
1454eab6f:     	callq	0x140188f20 <.text+0x187f20>
1454eab74:     	movq	0x30(%rbp), %rcx
1454eab78:     	cmpl	$0x1, 0x28(%rbp)
1454eab7c:     	je	0x1454eb6fd <.text+0x54ea6fd>
1454eab82:     	movq	0x38(%rbp), %r13
1454eab86:     	testq	%r12, %r12
1454eab89:     	je	0x1454eaba1 <.text+0x54e9ba1>
1454eab8b:     	movq	%rcx, 0x20(%rbp)
1454eab8f:     	movq	%r13, %rcx
1454eab92:     	movq	%rdi, %rdx
1454eab95:     	movq	%r12, %r8
1454eab98:     	callq	0x1457731ed <.text+0x57721ed>
1454eab9d:     	movq	0x20(%rbp), %rcx
1454eaba1:     	movq	%rcx, -0x38(%rbp)
1454eaba5:     	movq	%r13, -0x30(%rbp)
1454eaba9:     	movq	%r12, -0x28(%rbp)
1454eabad:     	movss	0x58(%r15), %xmm6
1454eabb3:     	mulss	0x42db35(%rip), %xmm6   # 0x1459186f0
1454eabbb:     	mulss	0x20(%rbx), %xmm6
1454eabc0:     	mulss	0x48(%rbx), %xmm6
1454eabc5:     	leaq	0x150cc8d(%rip), %r12   # 0x1469f7859
1454eabcc:     	movl	$0xb1, %r13d
1454eabd2:     	movl	$0xb1, %edx
1454eabd7:     	movq	%r12, %rcx
1454eabda:     	callq	0x145457cb0 <.text+0x5456cb0>
1454eabdf:     	nop
1454eabe0:     	movq	%rdx, %rdi
1454eabe3:     	testq	%rax, %rax
1454eabe6:     	cmovneq	%rax, %r12
1454eabea:     	cmoveq	%r13, %rdi
1454eabee:     	movl	$0x41c80000, 0x150(%rbp) # imm = 0x41C80000
1454eabf8:     	leaq	0x150(%rbp), %rax
1454eabff:     	movq	%rax, 0x28(%rbp)
1454eac03:     	leaq	0x24eae6(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1454eac0a:     	movq	%rax, 0x30(%rbp)
1454eac0e:     	leaq	0x150a3c0(%rip), %rdx   # 0x1469f4fd5
1454eac15:     	leaq	0x120(%rbp), %rcx
1454eac1c:     	leaq	0x28(%rbp), %r8
1454eac20:     	callq	0x145728390 <.text+0x5727390>
1454eac25:     	nop
1454eac26:     	leaq	0x108(%rbp), %rcx
1454eac2d:     	movaps	%xmm6, %xmm1
1454eac30:     	callq	0x14548d390 <.text+0x548c390>
1454eac35:     	nop
1454eac36:     	movss	0x4c(%r15), %xmm1
1454eac3c:     	leaq	0x150(%rbp), %r13
1454eac43:     	movq	%r13, %rcx
1454eac46:     	callq	0x14548d390 <.text+0x548c390>
1454eac4b:     	nop
1454eac4c:     	leaq	0x150c92f(%rip), %rax   # 0x1469f7582
1454eac53:     	movq	%rax, 0x28(%rbp)
1454eac57:     	movq	$0x2, 0x30(%rbp)
1454eac5f:     	leaq	-0x20(%rbp), %rax
1454eac63:     	movq	%rax, 0x38(%rbp)
1454eac67:     	leaq	0x150bfe2(%rip), %rax   # 0x1469f6c50
1454eac6e:     	movq	%rax, 0x40(%rbp)
1454eac72:     	leaq	0x150cc91(%rip), %rcx   # 0x1469f790a
1454eac79:     	movq	%rcx, 0x48(%rbp)
1454eac7d:     	movq	$0x4, 0x50(%rbp)
1454eac85:     	leaq	0x120(%rbp), %rcx
1454eac8c:     	movq	%rcx, 0x58(%rbp)
1454eac90:     	movq	%rax, 0x60(%rbp)
1454eac94:     	leaq	0x150cc73(%rip), %rcx   # 0x1469f790e
1454eac9b:     	movq	%rcx, 0x68(%rbp)
1454eac9f:     	movq	$0x3, 0x70(%rbp)
1454eaca7:     	leaq	0x108(%rbp), %rcx
1454eacae:     	movq	%rcx, 0x78(%rbp)
1454eacb2:     	movq	%rax, 0x80(%rbp)
1454eacb9:     	leaq	0x150ca29(%rip), %rcx   # 0x1469f76e9
1454eacc0:     	movq	%rcx, 0x88(%rbp)
1454eacc7:     	movq	$0x4, 0x90(%rbp)
1454eacd2:     	leaq	-0x38(%rbp), %rcx
1454eacd6:     	movq	%rcx, 0x98(%rbp)
1454eacdd:     	movq	%rax, 0xa0(%rbp)
1454eace4:     	leaq	0x150ca02(%rip), %rcx   # 0x1469f76ed
1454eaceb:     	movq	%rcx, 0xa8(%rbp)
1454eacf2:     	movq	$0x5, 0xb0(%rbp)
1454eacfd:     	movq	%r13, 0xb8(%rbp)
1454ead04:     	movq	%rax, 0xc0(%rbp)
1454ead0b:     	leaq	0x150c886(%rip), %rcx   # 0x1469f7598
1454ead12:     	movq	%rcx, 0xc8(%rbp)
1454ead19:     	movq	$0x3, 0xd0(%rbp)
1454ead24:     	movq	%rbp, %rcx
1454ead27:     	movq	%rcx, 0xd8(%rbp)
1454ead2e:     	movq	%rax, 0xe0(%rbp)
1454ead35:     	movq	$0x6, 0x20(%rsp)
1454ead3e:     	leaq	0x138(%rbp), %rcx
1454ead45:     	leaq	0x28(%rbp), %r9
1454ead49:     	movq	%r12, %rdx
1454ead4c:     	movq	%rdi, %r8
1454ead4f:     	callq	0x145458060 <.text+0x5457060>
1454ead54:     	nop
1454ead55:     	movq	0x150(%rbp), %rdx
1454ead5c:     	testq	%rdx, %rdx
1454ead5f:     	je	0x1454ead73 <.text+0x54e9d73>
1454ead61:     	movq	0x158(%rbp), %rcx
1454ead68:     	movl	$0x1, %r8d
1454ead6e:     	callq	0x1400021d0 <.text+0x11d0>
1454ead73:     	movq	0x108(%rbp), %rdx
1454ead7a:     	testq	%rdx, %rdx
1454ead7d:     	je	0x1454ead91 <.text+0x54e9d91>
1454ead7f:     	movq	0x110(%rbp), %rcx
1454ead86:     	movl	$0x1, %r8d
1454ead8c:     	callq	0x1400021d0 <.text+0x11d0>
1454ead91:     	movq	0x120(%rbp), %rdx
1454ead98:     	testq	%rdx, %rdx
1454ead9b:     	je	0x1454eadb0 <.text+0x54e9db0>
1454ead9d:     	movq	0x128(%rbp), %rcx
1454eada4:     	movl	$0x1, %r8d
1454eadaa:     	callq	0x1400021d0 <.text+0x11d0>
1454eadaf:     	nop
1454eadb0:     	leaq	0x150cb5a(%rip), %r12   # 0x1469f7911
1454eadb7:     	movl	$0x26, %edi
1454eadbc:     	movl	$0x26, %edx
1454eadc1:     	movq	%r12, %rcx
1454eadc4:     	callq	0x145457cb0 <.text+0x5456cb0>
1454eadc9:     	nop
1454eadca:     	movq	%rdx, %r13
1454eadcd:     	testq	%rax, %rax
1454eadd0:     	cmovneq	%rax, %r12
1454eadd4:     	cmoveq	%rdi, %r13
1454eadd8:     	movq	0x138(%rbp), %rax
1454eaddf:     	movq	0x148(%rbp), %rdi
1454eade6:     	subq	%rdi, %rax
1454eade9:     	cmpq	%rax, %r13
1454eadec:     	ja	0x1454eb6cf <.text+0x54ea6cf>
1454eadf2:     	testq	%r13, %r13
1454eadf5:     	je	0x1454eae0c <.text+0x54e9e0c>
1454eadf7:     	movq	0x140(%rbp), %rcx
1454eadfe:     	addq	%rdi, %rcx
1454eae01:     	movq	%r12, %rdx
1454eae04:     	movq	%r13, %r8
1454eae07:     	callq	0x1457731ed <.text+0x57721ed>
1454eae0c:     	addq	%r13, %rdi
1454eae0f:     	movq	%rdi, 0x148(%rbp)
1454eae16:     	movq	(%r15), %rcx
1454eae19:     	movq	0x8(%r15), %rdx
1454eae1d:     	cmpq	$0xb, %rdx
1454eae21:     	je	0x1454eb1bb <.text+0x54ea1bb>
1454eae27:     	cmpq	$0xa, %rdx
1454eae2b:     	jne	0x1454eae51 <.text+0x54e9e51>
1454eae2d:     	movq	(%rcx), %rax
1454eae30:     	xorq	0x1253a3e(%rip), %rax   # 0x14673e875
1454eae37:     	movzwl	0x8(%rcx), %r8d
1454eae3c:     	xorw	0x1253a39(%rip), %r8w   # 0x14673e87d
1454eae44:     	movzwl	%r8w, %r8d
1454eae48:     	orq	%rax, %r8
1454eae4b:     	je	0x1454eb1d9 <.text+0x54ea1d9>
1454eae51:     	movss	0x48(%r15), %xmm7
1454eae57:     	mulss	0x42d891(%rip), %xmm7   # 0x1459186f0
1454eae5f:     	mulss	0x14(%rbx), %xmm7
1454eae64:     	mulss	0x3c(%rbx), %xmm7
1454eae69:     	mulss	0x8(%r14), %xmm7
1454eae6f:     	maxss	0x41e769(%rip), %xmm7   # 0x1459095e0
1454eae77:     	callq	0x1454536c0 <.text+0x54526c0>
1454eae7c:     	maxss	%xmm7, %xmm0
1454eae80:     	movss	0x50(%rbx), %xmm1
1454eae85:     	maxss	0x428463(%rip), %xmm1   # 0x1459132f0
1454eae8d:     	divss	%xmm1, %xmm0
1454eae91:     	jmp	0x1454eb1e1 <.text+0x54ea1e1>
1454eae96:     	movl	$0x1, %r14d
1454eae9c:     	movq	%rdi, 0x138(%rbp)
1454eaea3:     	movq	%r14, 0x140(%rbp)
1454eaeaa:     	movq	%rdi, 0x148(%rbp)
1454eaeb1:     	leaq	0x150c70c(%rip), %rbx   # 0x1469f75c4
1454eaeb8:     	movl	$0x125, %edi            # imm = 0x125
1454eaebd:     	movl	$0x125, %edx            # imm = 0x125
1454eaec2:     	movq	%rbx, %rcx
1454eaec5:     	callq	0x145457cb0 <.text+0x5456cb0>
1454eaeca:     	nop
1454eaecb:     	movq	%rdx, %r14
1454eaece:     	testq	%rax, %rax
1454eaed1:     	cmovneq	%rax, %rbx
1454eaed5:     	cmoveq	%rdi, %r14
1454eaed9:     	movss	0x4c(%r15), %xmm1
1454eaedf:     	leaq	0x120(%rbp), %rdi
1454eaee6:     	movq	%rdi, %rcx
1454eaee9:     	callq	0x14548d390 <.text+0x548c390>
1454eaeee:     	nop
1454eaeef:     	mulss	%xmm7, %xmm6
1454eaef3:     	xorps	%xmm1, %xmm1
1454eaef6:     	sqrtss	%xmm6, %xmm1
1454eaefa:     	mulss	0x4283f6(%rip), %xmm1   # 0x1459132f8
1454eaf02:     	minss	0x45cff2(%rip), %xmm1   # 0x145947efc
1454eaf0a:     	mulss	0x41c62a(%rip), %xmm1   # 0x14590753c
1454eaf12:     	leaq	0x108(%rbp), %r13
1454eaf19:     	movq	%r13, %rcx
1454eaf1c:     	callq	0x14548d390 <.text+0x548c390>
1454eaf21:     	nop
1454eaf22:     	leaq	0x150(%rbp), %r12
1454eaf29:     	movss	0x41c5d7(%rip), %xmm1   # 0x145907508
1454eaf31:     	movq	%r12, %rcx
1454eaf34:     	callq	0x14548d390 <.text+0x548c390>
1454eaf39:     	nop
1454eaf3a:     	leaq	0x150c7a8(%rip), %rax   # 0x1469f76e9
1454eaf41:     	movq	%rax, 0x28(%rbp)
1454eaf45:     	movq	$0x4, 0x30(%rbp)
1454eaf4d:     	leaq	0x138(%rbp), %rax
1454eaf54:     	movq	%rax, 0x38(%rbp)
1454eaf58:     	leaq	0x150bcf1(%rip), %rax   # 0x1469f6c50
1454eaf5f:     	movq	%rax, 0x40(%rbp)
1454eaf63:     	leaq	0x150c783(%rip), %rcx   # 0x1469f76ed
1454eaf6a:     	movq	%rcx, 0x48(%rbp)
1454eaf6e:     	movq	$0x5, 0x50(%rbp)
1454eaf76:     	movq	%rdi, 0x58(%rbp)
1454eaf7a:     	movq	%rax, 0x60(%rbp)
1454eaf7e:     	leaq	0x150c4bb(%rip), %rcx   # 0x1469f7440
1454eaf85:     	movq	%rcx, 0x68(%rbp)
1454eaf89:     	movq	$0x1, 0x70(%rbp)
1454eaf91:     	movq	%r13, 0x78(%rbp)
1454eaf95:     	movq	%rax, 0x80(%rbp)
1454eaf9c:     	leaq	0x150c5f5(%rip), %rcx   # 0x1469f7598
1454eafa3:     	movq	%rcx, 0x88(%rbp)
1454eafaa:     	movq	$0x3, 0x90(%rbp)
1454eafb5:     	movq	%rbp, %rcx
1454eafb8:     	movq	%rcx, 0x98(%rbp)
1454eafbf:     	movq	%rax, 0xa0(%rbp)
1454eafc6:     	leaq	0x150c733(%rip), %rcx   # 0x1469f7700
1454eafcd:     	movq	%rcx, 0xa8(%rbp)
1454eafd4:     	movq	$0x4, 0xb0(%rbp)
1454eafdf:     	leaq	0x150c712(%rip), %rcx   # 0x1469f76f8
1454eafe6:     	movq	%rcx, 0xb8(%rbp)
1454eafed:     	leaq	0x150bccc(%rip), %rcx   # 0x1469f6cc0
1454eaff4:     	movq	%rcx, 0xc0(%rbp)
1454eaffb:     	leaq	0x150c599(%rip), %rcx   # 0x1469f759b
1454eb002:     	movq	%rcx, 0xc8(%rbp)
1454eb009:     	movq	$0x1, 0xd0(%rbp)
1454eb014:     	leaq	-0x50(%rbp), %rcx
1454eb018:     	movq	%rcx, 0xd8(%rbp)
1454eb01f:     	movq	%rax, 0xe0(%rbp)
1454eb026:     	leaq	0x150c6d7(%rip), %rcx   # 0x1469f7704
1454eb02d:     	movq	%rcx, 0xe8(%rbp)
1454eb034:     	movq	$0x7, 0xf0(%rbp)
1454eb03f:     	movq	%r12, 0xf8(%rbp)
1454eb046:     	movq	%rax, 0x100(%rbp)
1454eb04d:     	movq	$0x7, 0x20(%rsp)
1454eb056:     	leaq	0x28(%rbp), %r9
1454eb05a:     	movq	%rsi, %rcx
1454eb05d:     	movq	%rbx, %rdx
1454eb060:     	movq	%r14, %r8
1454eb063:     	callq	0x145458060 <.text+0x5457060>
1454eb068:     	nop
1454eb069:     	movq	0x138(%rbp), %rdx
1454eb070:     	testq	%rdx, %rdx
1454eb073:     	je	0x1454eb087 <.text+0x54ea087>
1454eb075:     	movq	0x140(%rbp), %rcx
1454eb07c:     	movl	$0x1, %r8d
1454eb082:     	callq	0x1400021d0 <.text+0x11d0>
1454eb087:     	movq	0x150(%rbp), %rdx
1454eb08e:     	testq	%rdx, %rdx
1454eb091:     	je	0x1454eb0a5 <.text+0x54ea0a5>
1454eb093:     	movq	0x158(%rbp), %rcx
1454eb09a:     	movl	$0x1, %r8d
1454eb0a0:     	callq	0x1400021d0 <.text+0x11d0>
1454eb0a5:     	movq	0x108(%rbp), %rdx
1454eb0ac:     	testq	%rdx, %rdx
1454eb0af:     	je	0x1454eb0c3 <.text+0x54ea0c3>
1454eb0b1:     	movq	0x110(%rbp), %rcx
1454eb0b8:     	movl	$0x1, %r8d
1454eb0be:     	callq	0x1400021d0 <.text+0x11d0>
1454eb0c3:     	movq	0x120(%rbp), %rdx
1454eb0ca:     	testq	%rdx, %rdx
1454eb0cd:     	je	0x1454eb65a <.text+0x54ea65a>
1454eb0d3:     	movq	0x128(%rbp), %rcx
1454eb0da:     	jmp	0x1454eb64f <.text+0x54ea64f>
1454eb0df:     	movl	$0x1, 0x138(%rbp)
1454eb0e9:     	leaq	0x150c61b(%rip), %rdi   # 0x1469f770b
1454eb0f0:     	movl	$0x12, %r13d
1454eb0f6:     	movl	$0x12, %edx
1454eb0fb:     	movq	%rdi, %rcx
1454eb0fe:     	callq	0x145457cb0 <.text+0x5456cb0>
1454eb103:     	nop
1454eb104:     	movq	%rdx, %r12
1454eb107:     	testq	%rax, %rax
1454eb10a:     	cmovneq	%rax, %rdi
1454eb10e:     	cmoveq	%r13, %r12
1454eb112:     	movq	$0x1, 0x20(%rsp)
1454eb11b:     	leaq	0x28(%rbp), %rcx
1454eb11f:     	movl	$0x1, %r9d
1454eb125:     	movq	%r12, %rdx
1454eb128:     	xorl	%r8d, %r8d
1454eb12b:     	callq	0x140188f20 <.text+0x187f20>
1454eb130:     	movq	0x30(%rbp), %rcx
1454eb134:     	cmpl	$0x1, 0x28(%rbp)
1454eb138:     	je	0x1454eb709 <.text+0x54ea709>
1454eb13e:     	movq	0x38(%rbp), %r13
1454eb142:     	testq	%r12, %r12
1454eb145:     	je	0x1454eb15d <.text+0x54ea15d>
1454eb147:     	movq	%rcx, 0x20(%rbp)
1454eb14b:     	movq	%r13, %rcx
1454eb14e:     	movq	%rdi, %rdx
1454eb151:     	movq	%r12, %r8
1454eb154:     	callq	0x1457731ed <.text+0x57721ed>
1454eb159:     	movq	0x20(%rbp), %rcx
1454eb15d:     	movq	%rcx, 0x120(%rbp)
1454eb164:     	movq	%r13, 0x128(%rbp)
1454eb16b:     	movq	%r12, 0x130(%rbp)
1454eb172:     	leaq	0x150c5c4(%rip), %rdi   # 0x1469f773d
1454eb179:     	movl	$0x91, %r13d
1454eb17f:     	movl	$0x91, %edx
1454eb184:     	movq	%rdi, %rcx
1454eb187:     	callq	0x145457cb0 <.text+0x5456cb0>
1454eb18c:     	nop
1454eb18d:     	movq	%rdx, %r12
1454eb190:     	testq	%rax, %rax
1454eb193:     	cmovneq	%rax, %rdi
1454eb197:     	cmoveq	%r13, %r12
1454eb19b:     	movq	%rbx, %rcx
1454eb19e:     	movq	%r14, %rdx
1454eb1a1:     	callq	0x1454537e0 <.text+0x54527e0>
1454eb1a6:     	testb	$0x1, %al
1454eb1a8:     	jne	0x1454eb36e <.text+0x54ea36e>
1454eb1ae:     	movss	0x45cd46(%rip), %xmm0   # 0x145947efc
1454eb1b6:     	jmp	0x1454eb376 <.text+0x54ea376>
1454eb1bb:     	movq	(%rcx), %rax
1454eb1be:     	xorq	0x12536e1(%rip), %rax   # 0x14673e8a6
1454eb1c5:     	movq	0x3(%rcx), %r8
1454eb1c9:     	xorq	0x12536d9(%rip), %r8    # 0x14673e8a9
1454eb1d0:     	orq	%rax, %r8
1454eb1d3:     	jne	0x1454eae51 <.text+0x54e9e51>
1454eb1d9:     	movss	0x42a6f7(%rip), %xmm0   # 0x1459158d8
1454eb1e1:     	divss	%xmm0, %xmm6
1454eb1e5:     	movaps	%xmm6, %xmm0
1454eb1e8:     	callq	0x14577327d <.text+0x577227d>
1454eb1ed:     	cvttss2si	%xmm0, %rax
1454eb1f2:     	movq	%rax, %rcx
1454eb1f5:     	sarq	$0x3f, %rcx
1454eb1f9:     	movaps	%xmm0, %xmm1
1454eb1fc:     	subss	0x41bfdc(%rip), %xmm1   # 0x1459071e0
1454eb204:     	cvttss2si	%xmm1, %rdx
1454eb209:     	andq	%rcx, %rdx
1454eb20c:     	orq	%rax, %rdx
1454eb20f:     	xorl	%eax, %eax
1454eb211:     	xorps	%xmm1, %xmm1
1454eb214:     	ucomiss	%xmm1, %xmm0
1454eb217:     	cmovaeq	%rdx, %rax
1454eb21b:     	ucomiss	0x41bfc2(%rip), %xmm0   # 0x1459071e4
1454eb222:     	movq	$-0x1, %rcx
1454eb229:     	cmovbeq	%rax, %rcx
1454eb22d:     	cmpq	$0x3, %rcx
1454eb231:     	movl	$0x3, %eax
1454eb236:     	cmovbq	%rcx, %rax
1454eb23a:     	testq	%rcx, %rcx
1454eb23d:     	movl	$0x1, %ecx
1454eb242:     	cmovneq	%rax, %rcx
1454eb246:     	movq	%rcx, 0x108(%rbp)
1454eb24d:     	cmpq	$0x1, %rcx
1454eb251:     	jbe	0x1454eb343 <.text+0x54ea343>
1454eb257:     	cmpq	%rdi, 0x138(%rbp)
1454eb25e:     	je	0x1454eb715 <.text+0x54ea715>
1454eb264:     	movq	0x140(%rbp), %rbx
1454eb26b:     	movb	$0x20, (%rbx,%rdi)
1454eb26f:     	incq	%rdi
1454eb272:     	movq	%rdi, 0x148(%rbp)
1454eb279:     	leaq	0x150c6b7(%rip), %r14   # 0x1469f7937
1454eb280:     	movl	$0x42, %r15d
1454eb286:     	movl	$0x42, %edx
1454eb28b:     	movq	%r14, %rcx
1454eb28e:     	callq	0x145457cb0 <.text+0x5456cb0>
1454eb293:     	nop
1454eb294:     	movq	%rdx, %r8
1454eb297:     	testq	%rax, %rax
1454eb29a:     	cmovneq	%rax, %r14
1454eb29e:     	cmoveq	%r15, %r8
1454eb2a2:     	leaq	0x150b1c7(%rip), %rax   # 0x1469f6470
1454eb2a9:     	movq	%rax, 0x28(%rbp)
1454eb2ad:     	movq	$0x1, 0x30(%rbp)
1454eb2b5:     	leaq	0x108(%rbp), %rax
1454eb2bc:     	movq	%rax, 0x38(%rbp)
1454eb2c0:     	leaq	0x150b9f9(%rip), %rax   # 0x1469f6cc0
1454eb2c7:     	movq	%rax, 0x40(%rbp)
1454eb2cb:     	movq	$0x1, 0x20(%rsp)
1454eb2d4:     	leaq	0x150(%rbp), %rcx
1454eb2db:     	leaq	0x28(%rbp), %r9
1454eb2df:     	movq	%r14, %rdx
1454eb2e2:     	callq	0x145458060 <.text+0x5457060>
1454eb2e7:     	nop
1454eb2e8:     	movq	0x158(%rbp), %r15
1454eb2ef:     	movq	0x160(%rbp), %r14
1454eb2f6:     	movq	0x138(%rbp), %rax
1454eb2fd:     	subq	%rdi, %rax
1454eb300:     	cmpq	%rax, %r14
1454eb303:     	ja	0x1454eb746 <.text+0x54ea746>
1454eb309:     	testq	%r14, %r14
1454eb30c:     	je	0x1454eb31f <.text+0x54ea31f>
1454eb30e:     	addq	%rdi, %rbx
1454eb311:     	movq	%rbx, %rcx
1454eb314:     	movq	%r15, %rdx
1454eb317:     	movq	%r14, %r8
1454eb31a:     	callq	0x1457731ed <.text+0x57721ed>
1454eb31f:     	addq	%r14, %rdi
1454eb322:     	movq	%rdi, 0x148(%rbp)
1454eb329:     	movq	0x150(%rbp), %rdx
1454eb330:     	testq	%rdx, %rdx
1454eb333:     	je	0x1454eb343 <.text+0x54ea343>
1454eb335:     	movl	$0x1, %r8d
1454eb33b:     	movq	%r15, %rcx
1454eb33e:     	callq	0x1400021d0 <.text+0x11d0>
1454eb343:     	movq	0x148(%rbp), %rax
1454eb34a:     	movq	%rax, 0x10(%rsi)
1454eb34e:     	movups	0x138(%rbp), %xmm0
1454eb355:     	movups	%xmm0, (%rsi)
1454eb358:     	movq	-0x38(%rbp), %rdx
1454eb35c:     	testq	%rdx, %rdx
1454eb35f:     	je	0x1454eb65a <.text+0x54ea65a>
1454eb365:     	movq	-0x30(%rbp), %rcx
1454eb369:     	jmp	0x1454eb64f <.text+0x54ea64f>
1454eb36e:     	divss	0x42d4ca(%rip), %xmm0   # 0x145918840
1454eb376:     	leaq	0x108(%rbp), %r14
1454eb37d:     	movq	%r14, %rcx
1454eb380:     	movaps	%xmm0, %xmm1
1454eb383:     	callq	0x14548d390 <.text+0x548c390>
1454eb388:     	nop
1454eb389:     	movss	0x4c(%r15), %xmm1
1454eb38f:     	leaq	0x150(%rbp), %rbx
1454eb396:     	movq	%rbx, %rcx
1454eb399:     	callq	0x14548d390 <.text+0x548c390>
1454eb39e:     	nop
1454eb39f:     	leaq	0x150b6d4(%rip), %rax   # 0x1469f6a7a
1454eb3a6:     	movq	%rax, 0x28(%rbp)
1454eb3aa:     	movq	$0x4, 0x30(%rbp)
1454eb3b2:     	movq	%r14, 0x38(%rbp)
1454eb3b6:     	leaq	0x150b893(%rip), %rax   # 0x1469f6c50
1454eb3bd:     	movq	%rax, 0x40(%rbp)
1454eb3c1:     	leaq	0x150c321(%rip), %rcx   # 0x1469f76e9
1454eb3c8:     	movq	%rcx, 0x48(%rbp)
1454eb3cc:     	movq	$0x4, 0x50(%rbp)
1454eb3d4:     	leaq	0x120(%rbp), %rcx
1454eb3db:     	movq	%rcx, 0x58(%rbp)
1454eb3df:     	movq	%rax, 0x60(%rbp)
1454eb3e3:     	leaq	0x150c303(%rip), %rcx   # 0x1469f76ed
1454eb3ea:     	movq	%rcx, 0x68(%rbp)
1454eb3ee:     	movq	$0x5, 0x70(%rbp)
1454eb3f6:     	movq	%rbx, 0x78(%rbp)
1454eb3fa:     	movq	%rax, 0x80(%rbp)
1454eb401:     	leaq	0x150c190(%rip), %rcx   # 0x1469f7598
1454eb408:     	movq	%rcx, 0x88(%rbp)
1454eb40f:     	movq	$0x3, 0x90(%rbp)
1454eb41a:     	movq	%rbp, %rcx
1454eb41d:     	movq	%rcx, 0x98(%rbp)
1454eb424:     	movq	%rax, 0xa0(%rbp)
1454eb42b:     	movq	$0x4, 0x20(%rsp)
1454eb434:     	leaq	0x28(%rbp), %r9
1454eb438:     	movq	%rsi, %rcx
1454eb43b:     	movq	%rdi, %rdx
1454eb43e:     	movq	%r12, %r8
1454eb441:     	callq	0x145458060 <.text+0x5457060>
1454eb446:     	nop
1454eb447:     	jmp	0x1454eb600 <.text+0x54ea600>
1454eb44c:     	movl	$0x1, %r12d
1454eb452:     	movq	%rdi, 0x120(%rbp)
1454eb459:     	movq	%r12, 0x128(%rbp)
1454eb460:     	movq	%rdi, 0x130(%rbp)
1454eb467:     	leaq	0x150c524(%rip), %r13   # 0x1469f7992
1454eb46e:     	movl	$0x126, %edi            # imm = 0x126
1454eb473:     	movl	$0x126, %edx            # imm = 0x126
1454eb478:     	movq	%r13, %rcx
1454eb47b:     	callq	0x145457cb0 <.text+0x5456cb0>
1454eb480:     	nop
1454eb481:     	movq	%rdx, %r12
1454eb484:     	testq	%rax, %rax
1454eb487:     	cmovneq	%rax, %r13
1454eb48b:     	cmoveq	%rdi, %r12
1454eb48f:     	movq	(%r15), %rcx
1454eb492:     	movq	0x8(%r15), %rdx
1454eb496:     	cmpq	$0xb, %rdx
1454eb49a:     	je	0x1454eb510 <.text+0x54ea510>
1454eb49c:     	cmpq	$0xa, %rdx
1454eb4a0:     	jne	0x1454eb4c2 <.text+0x54ea4c2>
1454eb4a2:     	movq	(%rcx), %rax
1454eb4a5:     	xorq	0x12533c9(%rip), %rax   # 0x14673e875
1454eb4ac:     	movzwl	0x8(%rcx), %r8d
1454eb4b1:     	xorw	0x12533c4(%rip), %r8w   # 0x14673e87d
1454eb4b9:     	movzwl	%r8w, %r8d
1454eb4bd:     	orq	%rax, %r8
1454eb4c0:     	je	0x1454eb52a <.text+0x54ea52a>
1454eb4c2:     	movss	0x48(%r15), %xmm6
1454eb4c8:     	mulss	0x42d220(%rip), %xmm6   # 0x1459186f0
1454eb4d0:     	mulss	0x14(%rbx), %xmm6
1454eb4d5:     	mulss	0x3c(%rbx), %xmm6
1454eb4da:     	mulss	0x8(%r14), %xmm6
1454eb4e0:     	maxss	0x41e0f8(%rip), %xmm6   # 0x1459095e0
1454eb4e8:     	callq	0x1454536c0 <.text+0x54526c0>
1454eb4ed:     	movss	0x50(%rbx), %xmm1
1454eb4f2:     	maxss	0x427df6(%rip), %xmm1   # 0x1459132f0
1454eb4fa:     	maxss	%xmm6, %xmm0
1454eb4fe:     	divss	%xmm1, %xmm0
1454eb502:     	movss	0x42d336(%rip), %xmm1   # 0x145918840
1454eb50a:     	divss	%xmm0, %xmm1
1454eb50e:     	jmp	0x1454eb532 <.text+0x54ea532>
1454eb510:     	movq	(%rcx), %rax
1454eb513:     	xorq	0x125338c(%rip), %rax   # 0x14673e8a6
1454eb51a:     	movq	0x3(%rcx), %r8
1454eb51e:     	xorq	0x1253384(%rip), %r8    # 0x14673e8a9
1454eb525:     	orq	%rax, %r8
1454eb528:     	jne	0x1454eb4c2 <.text+0x54ea4c2>
1454eb52a:     	movss	0x427dc2(%rip), %xmm1   # 0x1459132f4
1454eb532:     	leaq	0x108(%rbp), %rbx
1454eb539:     	movq	%rbx, %rcx
1454eb53c:     	callq	0x14548d390 <.text+0x548c390>
1454eb541:     	nop
1454eb542:     	movss	0x4c(%r15), %xmm1
1454eb548:     	leaq	0x150(%rbp), %rdi
1454eb54f:     	movq	%rdi, %rcx
1454eb552:     	callq	0x14548d390 <.text+0x548c390>
1454eb557:     	nop
1454eb558:     	leaq	0x150c1a5(%rip), %rax   # 0x1469f7704
1454eb55f:     	movq	%rax, 0x28(%rbp)
1454eb563:     	movq	$0x7, 0x30(%rbp)
1454eb56b:     	movq	%rbx, 0x38(%rbp)
1454eb56f:     	leaq	0x150b6da(%rip), %rax   # 0x1469f6c50
1454eb576:     	movq	%rax, 0x40(%rbp)
1454eb57a:     	leaq	0x150c168(%rip), %rcx   # 0x1469f76e9
1454eb581:     	movq	%rcx, 0x48(%rbp)
1454eb585:     	movq	$0x4, 0x50(%rbp)
1454eb58d:     	leaq	0x120(%rbp), %rcx
1454eb594:     	movq	%rcx, 0x58(%rbp)
1454eb598:     	movq	%rax, 0x60(%rbp)
1454eb59c:     	leaq	0x150c14a(%rip), %rcx   # 0x1469f76ed
1454eb5a3:     	movq	%rcx, 0x68(%rbp)
1454eb5a7:     	movq	$0x5, 0x70(%rbp)
1454eb5af:     	movq	%rdi, 0x78(%rbp)
1454eb5b3:     	movq	%rax, 0x80(%rbp)
1454eb5ba:     	leaq	0x150bfd7(%rip), %rcx   # 0x1469f7598
1454eb5c1:     	movq	%rcx, 0x88(%rbp)
1454eb5c8:     	movq	$0x3, 0x90(%rbp)
1454eb5d3:     	movq	%rbp, %rcx
1454eb5d6:     	movq	%rcx, 0x98(%rbp)
1454eb5dd:     	movq	%rax, 0xa0(%rbp)
1454eb5e4:     	movq	$0x4, 0x20(%rsp)
1454eb5ed:     	leaq	0x28(%rbp), %r9
1454eb5f1:     	movq	%rsi, %rcx
1454eb5f4:     	movq	%r13, %rdx
1454eb5f7:     	movq	%r12, %r8
1454eb5fa:     	callq	0x145458060 <.text+0x5457060>
1454eb5ff:     	nop
1454eb600:     	movq	0x120(%rbp), %rdx
1454eb607:     	testq	%rdx, %rdx
1454eb60a:     	je	0x1454eb61e <.text+0x54ea61e>
1454eb60c:     	movq	0x128(%rbp), %rcx
1454eb613:     	movl	$0x1, %r8d
1454eb619:     	callq	0x1400021d0 <.text+0x11d0>
1454eb61e:     	movq	0x150(%rbp), %rdx
1454eb625:     	testq	%rdx, %rdx
1454eb628:     	je	0x1454eb63c <.text+0x54ea63c>
1454eb62a:     	movq	0x158(%rbp), %rcx
1454eb631:     	movl	$0x1, %r8d
1454eb637:     	callq	0x1400021d0 <.text+0x11d0>
1454eb63c:     	movq	0x108(%rbp), %rdx
1454eb643:     	testq	%rdx, %rdx
1454eb646:     	je	0x1454eb65a <.text+0x54ea65a>
1454eb648:     	movq	0x110(%rbp), %rcx
1454eb64f:     	movl	$0x1, %r8d
1454eb655:     	callq	0x1400021d0 <.text+0x11d0>
1454eb65a:     	movq	-0x20(%rbp), %rdx
1454eb65e:     	testq	%rdx, %rdx
1454eb661:     	je	0x1454eb672 <.text+0x54ea672>
1454eb663:     	movq	-0x18(%rbp), %rcx
1454eb667:     	movl	$0x1, %r8d
1454eb66d:     	callq	0x1400021d0 <.text+0x11d0>
1454eb672:     	movq	-0x50(%rbp), %rdx
1454eb676:     	testq	%rdx, %rdx
1454eb679:     	je	0x1454eb68a <.text+0x54ea68a>
1454eb67b:     	movq	-0x48(%rbp), %rcx
1454eb67f:     	movl	$0x1, %r8d
1454eb685:     	callq	0x1400021d0 <.text+0x11d0>
1454eb68a:     	movq	(%rbp), %rdx
1454eb68e:     	testq	%rdx, %rdx
1454eb691:     	je	0x1454eb6a2 <.text+0x54ea6a2>
1454eb693:     	movq	0x8(%rbp), %rcx
1454eb697:     	movl	$0x1, %r8d
1454eb69d:     	callq	0x1400021d0 <.text+0x11d0>
1454eb6a2:     	movq	%rsi, %rax
1454eb6a5:     	movaps	0x170(%rbp), %xmm6
1454eb6ac:     	movaps	0x180(%rbp), %xmm7
1454eb6b3:     	movaps	0x190(%rbp), %xmm8
1454eb6bb:     	addq	$0x228, %rsp            # imm = 0x228
1454eb6c2:     	popq	%rbx
1454eb6c3:     	popq	%rdi
1454eb6c4:     	popq	%rsi
1454eb6c5:     	popq	%r12
1454eb6c7:     	popq	%r13
1454eb6c9:     	popq	%r14
1454eb6cb:     	popq	%r15
1454eb6cd:     	popq	%rbp
1454eb6ce:     	retq
1454eb6cf:     	movq	$0x1, 0x20(%rsp)
1454eb6d8:     	leaq	0x138(%rbp), %rcx
1454eb6df:     	movl	$0x1, %r9d
1454eb6e5:     	movq	%rdi, %rdx
1454eb6e8:     	movq	%r13, %r8
1454eb6eb:     	callq	0x1457744b0 <.text+0x57734b0>
1454eb6f0:     	nop
1454eb6f1:     	movq	0x148(%rbp), %rdi
1454eb6f8:     	jmp	0x1454eadf7 <.text+0x54e9df7>
1454eb6fd:     	movq	0x38(%rbp), %rdx
1454eb701:     	callq	0x14590379b <.text+0x590279b>
1454eb706:     	nop
1454eb707:     	jmp	0x1454eb713 <.text+0x54ea713>
1454eb709:     	movq	0x38(%rbp), %rdx
1454eb70d:     	callq	0x14590379b <.text+0x590279b>
1454eb712:     	nop
1454eb713:     	ud2
1454eb715:     	movq	$0x1, 0x20(%rsp)
1454eb71e:     	leaq	0x138(%rbp), %rcx
1454eb725:     	movl	$0x1, %r8d
1454eb72b:     	movl	$0x1, %r9d
1454eb731:     	movq	%rdi, %rdx
1454eb734:     	callq	0x1457744b0 <.text+0x57734b0>
1454eb739:     	nop
1454eb73a:     	movq	0x148(%rbp), %rdi
1454eb741:     	jmp	0x1454eb264 <.text+0x54ea264>
1454eb746:     	movq	%r15, 0x20(%rbp)
1454eb74a:     	movq	$0x1, 0x20(%rsp)
1454eb753:     	leaq	0x138(%rbp), %rcx
1454eb75a:     	movl	$0x1, %r9d
1454eb760:     	movq	%rdi, %rdx
1454eb763:     	movq	%r14, %r8
1454eb766:     	callq	0x1457744b0 <.text+0x57734b0>
1454eb76b:     	nop
1454eb76c:     	movq	0x140(%rbp), %rbx
1454eb773:     	movq	0x148(%rbp), %rdi
1454eb77a:     	movq	0x20(%rbp), %r15
1454eb77e:     	jmp	0x1454eb30e <.text+0x54ea30e>

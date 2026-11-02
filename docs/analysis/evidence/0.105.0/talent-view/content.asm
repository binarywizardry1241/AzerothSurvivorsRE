
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401a5ce0:     	pushq	%rbp
1401a5ce1:     	pushq	%r15
1401a5ce3:     	pushq	%r14
1401a5ce5:     	pushq	%r13
1401a5ce7:     	pushq	%r12
1401a5ce9:     	pushq	%rsi
1401a5cea:     	pushq	%rdi
1401a5ceb:     	pushq	%rbx
1401a5cec:     	subq	$0x708, %rsp            # imm = 0x708
1401a5cf3:     	leaq	0x80(%rsp), %rbp
1401a5cfb:     	movaps	%xmm15, 0x670(%rbp)
1401a5d03:     	movaps	%xmm14, 0x660(%rbp)
1401a5d0b:     	movaps	%xmm13, 0x650(%rbp)
1401a5d13:     	movaps	%xmm12, 0x640(%rbp)
1401a5d1b:     	movaps	%xmm11, 0x630(%rbp)
1401a5d23:     	movaps	%xmm10, 0x620(%rbp)
1401a5d2b:     	movaps	%xmm9, 0x610(%rbp)
1401a5d33:     	movaps	%xmm8, 0x600(%rbp)
1401a5d3b:     	movaps	%xmm7, 0x5f0(%rbp)
1401a5d42:     	movaps	%xmm6, 0x5e0(%rbp)
1401a5d49:     	movq	$-0x2, 0x5d8(%rbp)
1401a5d54:     	movq	%rdx, %rdi
1401a5d57:     	movq	%rcx, %r14
1401a5d5a:     	movq	(%rcx), %rax
1401a5d5d:     	movq	0x28(%rcx), %rcx
1401a5d61:     	movq	%rax, 0x48(%rbp)
1401a5d65:     	leaq	0x50(%rbp), %rdx
1401a5d69:     	movups	0x8(%r14), %xmm0
1401a5d6e:     	movups	%xmm0, 0x50(%rbp)
1401a5d72:     	movups	0x18(%r14), %xmm0
1401a5d77:     	movups	%xmm0, 0x60(%rbp)
1401a5d7b:     	movq	%rcx, 0x70(%rbp)
1401a5d7f:     	xorps	%xmm12, %xmm12
1401a5d83:     	movups	%xmm12, 0x430(%rbp)
1401a5d8b:     	movups	%xmm12, 0x420(%rbp)
1401a5d93:     	movups	%xmm12, 0x450(%rbp)
1401a5d9b:     	movups	%xmm12, 0x460(%rbp)
1401a5da3:     	movl	$0x0, 0x530(%rbp)
1401a5dad:     	movw	$0x0, 0x534(%rbp)
1401a5db6:     	movups	0x5c12ac3(%rip), %xmm0  # 0x145db8880
1401a5dbd:     	movaps	%xmm0, 0x110(%rbp)
1401a5dc4:     	movq	$0x0, 0x120(%rbp)
1401a5dcf:     	movups	0x5c12ac1(%rip), %xmm8  # 0x145db8898
1401a5dd7:     	movups	%xmm8, 0x128(%rbp)
1401a5ddf:     	movq	$0x0, 0x138(%rbp)
1401a5dea:     	movups	0x5c12abe(%rip), %xmm10 # 0x145db88b0
1401a5df2:     	movaps	%xmm10, 0x140(%rbp)
1401a5dfa:     	movq	$0x0, 0x150(%rbp)
1401a5e05:     	movups	0x5c12abb(%rip), %xmm11 # 0x145db88c8
1401a5e0d:     	movups	%xmm11, 0x158(%rbp)
1401a5e15:     	movq	$0x0, 0x168(%rbp)
1401a5e20:     	movq	0x160(%rbp), %rcx
1401a5e27:     	movq	%rcx, 0x408(%rbp)
1401a5e2e:     	movq	0x168(%rbp), %rcx
1401a5e35:     	movq	%rcx, 0x410(%rbp)
1401a5e3c:     	movq	0x150(%rbp), %rcx
1401a5e43:     	movq	%rcx, 0x3f8(%rbp)
1401a5e4a:     	movq	0x158(%rbp), %rcx
1401a5e51:     	movq	%rcx, 0x400(%rbp)
1401a5e58:     	movaps	0x110(%rbp), %xmm0
1401a5e5f:     	movaps	0x120(%rbp), %xmm1
1401a5e66:     	movaps	0x130(%rbp), %xmm2
1401a5e6d:     	movaps	0x140(%rbp), %xmm3
1401a5e74:     	movups	%xmm3, 0x3e8(%rbp)
1401a5e7b:     	movups	%xmm2, 0x3d8(%rbp)
1401a5e82:     	movups	%xmm1, 0x3c8(%rbp)
1401a5e89:     	movups	%xmm0, 0x3b8(%rbp)
1401a5e90:     	movq	$0x0, 0x418(%rbp)
1401a5e9b:     	movaps	0x5bc795e(%rip), %xmm0  # 0x145d6d800
1401a5ea2:     	movups	%xmm0, 0x440(%rbp)
1401a5ea9:     	movups	0x5c12a97(%rip), %xmm9  # 0x145db8948
1401a5eb1:     	movups	%xmm9, 0x480(%rbp)
1401a5eb9:     	movups	0x5c12a78(%rip), %xmm6  # 0x145db8938
1401a5ec0:     	movups	%xmm6, 0x470(%rbp)
1401a5ec7:     	movaps	0x5c11ca2(%rip), %xmm0  # 0x145db7b70
1401a5ece:     	movups	%xmm0, 0x490(%rbp)
1401a5ed5:     	movaps	0x5bcdec4(%rip), %xmm0  # 0x145d73da0
1401a5edc:     	movups	%xmm0, 0x4a0(%rbp)
1401a5ee3:     	movups	0x5c12a9e(%rip), %xmm7  # 0x145db8988
1401a5eea:     	movups	%xmm7, 0x4c0(%rbp)
1401a5ef1:     	movups	0x5c12a7f(%rip), %xmm13 # 0x145db8978
1401a5ef9:     	movups	%xmm13, 0x4b0(%rbp)
1401a5f01:     	movups	0x5c12a9f(%rip), %xmm14 # 0x145db89a8
1401a5f09:     	movups	%xmm14, 0x4e0(%rbp)
1401a5f11:     	movups	0x5c12a7f(%rip), %xmm15 # 0x145db8998
1401a5f19:     	movups	%xmm15, 0x4d0(%rbp)
1401a5f21:     	movaps	0x5bce078(%rip), %xmm0  # 0x145d73fa0
1401a5f28:     	movups	%xmm0, 0x4f0(%rbp)
1401a5f2f:     	movl	$0x1, 0x500(%rbp)
1401a5f39:     	movq	$0x0, 0x504(%rbp)
1401a5f44:     	movb	$0x1, 0x50c(%rbp)
1401a5f4b:     	movq	$0x0, 0x510(%rbp)
1401a5f56:     	movl	$0x3f800000, 0x518(%rbp) # imm = 0x3F800000
1401a5f60:     	movw	$0x0, 0x51c(%rbp)
1401a5f69:     	movw	$0x0, 0x522(%rbp)
1401a5f72:     	movl	$0x10000, 0x51e(%rbp)   # imm = 0x10000
1401a5f7c:     	movw	$0x0, 0x528(%rbp)
1401a5f85:     	movl	$0x10000, 0x524(%rbp)   # imm = 0x10000
1401a5f8f:     	movl	$0x0, 0x52a(%rbp)
1401a5f99:     	movw	$0x1, 0x52e(%rbp)
1401a5fa2:     	movq	%rax, 0x3b0(%rbp)
1401a5fa9:     	leaq	0x18(%rbp), %rcx
1401a5fad:     	leaq	0x3b0(%rbp), %r8
1401a5fb4:     	callq	0x140189f40 <.text+0x188f40>
1401a5fb9:     	movq	(%rdi), %rsi
1401a5fbc:     	movq	0x8(%rdi), %rbx
1401a5fc0:     	movq	0x10(%rdi), %rax
1401a5fc4:     	movq	%rax, 0x360(%rbp)
1401a5fcb:     	movq	0x18(%rdi), %rax
1401a5fcf:     	movq	%rax, 0x368(%rbp)
1401a5fd6:     	movq	0x20(%rdi), %rax
1401a5fda:     	movq	%rax, 0x338(%rbp)
1401a5fe1:     	movq	0x28(%rdi), %rax
1401a5fe5:     	movq	%rax, 0x340(%rbp)
1401a5fec:     	movq	0x18(%rbp), %rdi
1401a5ff0:     	movq	0x40(%rbp), %rax
1401a5ff4:     	movq	%rdi, 0x78(%rbp)
1401a5ff8:     	leaq	0x80(%rbp), %rdx
1401a5fff:     	movups	0x20(%rbp), %xmm0
1401a6003:     	movups	%xmm0, 0x80(%rbp)
1401a600a:     	movups	0x30(%rbp), %xmm0
1401a600e:     	movups	%xmm0, 0x90(%rbp)
1401a6015:     	movq	%rax, 0xa0(%rbp)
1401a601c:     	movups	%xmm12, 0x430(%rbp)
1401a6024:     	movups	%xmm12, 0x420(%rbp)
1401a602c:     	movups	%xmm12, 0x448(%rbp)
1401a6034:     	movups	%xmm12, 0x458(%rbp)
1401a603c:     	movq	$0x0, 0x468(%rbp)
1401a6047:     	movups	0x5c12832(%rip), %xmm0  # 0x145db8880
1401a604e:     	movaps	%xmm0, 0x110(%rbp)
1401a6055:     	movq	$0x0, 0x120(%rbp)
1401a6060:     	movups	%xmm8, 0x128(%rbp)
1401a6068:     	movq	$0x0, 0x138(%rbp)
1401a6073:     	movaps	%xmm10, 0x140(%rbp)
1401a607b:     	movq	$0x0, 0x150(%rbp)
1401a6086:     	movups	%xmm11, 0x158(%rbp)
1401a608e:     	movq	$0x0, 0x168(%rbp)
1401a6099:     	movq	0x160(%rbp), %rax
1401a60a0:     	movq	%rax, 0x408(%rbp)
1401a60a7:     	movq	0x168(%rbp), %rax
1401a60ae:     	movq	%rax, 0x410(%rbp)
1401a60b5:     	movq	0x150(%rbp), %rax
1401a60bc:     	movq	%rax, 0x3f8(%rbp)
1401a60c3:     	movq	0x158(%rbp), %rax
1401a60ca:     	movq	%rax, 0x400(%rbp)
1401a60d1:     	movaps	0x110(%rbp), %xmm0
1401a60d8:     	movaps	0x120(%rbp), %xmm1
1401a60df:     	movq	0x130(%rbp), %rax
1401a60e6:     	movq	0x138(%rbp), %rcx
1401a60ed:     	movaps	0x140(%rbp), %xmm2
1401a60f4:     	movups	%xmm2, 0x3e8(%rbp)
1401a60fb:     	movq	%rax, 0x3d8(%rbp)
1401a6102:     	movq	%rcx, 0x3e0(%rbp)
1401a6109:     	movups	%xmm1, 0x3c8(%rbp)
1401a6110:     	movups	%xmm0, 0x3b8(%rbp)
1401a6117:     	movq	$0x0, 0x418(%rbp)
1401a6122:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
1401a612c:     	movq	%rax, 0x440(%rbp)
1401a6133:     	movups	%xmm9, 0x480(%rbp)
1401a613b:     	movups	%xmm6, 0x470(%rbp)
1401a6142:     	movups	0x5c1281e(%rip), %xmm10 # 0x145db8968
1401a614a:     	movups	%xmm10, 0x4a0(%rbp)
1401a6152:     	movups	0x5c127fe(%rip), %xmm11 # 0x145db8958
1401a615a:     	movups	%xmm11, 0x490(%rbp)
1401a6162:     	movups	%xmm7, 0x4c0(%rbp)
1401a6169:     	movups	%xmm13, 0x4b0(%rbp)
1401a6171:     	movups	%xmm14, 0x4e0(%rbp)
1401a6179:     	movups	%xmm15, 0x4d0(%rbp)
1401a6181:     	movaps	0x5bc70d7(%rip), %xmm8  # 0x145d6d260
1401a6189:     	movups	%xmm8, 0x4f0(%rbp)
1401a6191:     	movl	$0x1, 0x500(%rbp)
1401a619b:     	movss	0x5bc717d(%rip), %xmm0  # 0x145d6d320
1401a61a3:     	movlps	%xmm0, 0x504(%rbp)
1401a61aa:     	movb	$0x1, 0x50c(%rbp)
1401a61b1:     	movq	$0x0, 0x510(%rbp)
1401a61bc:     	movl	$0x3f800000, 0x518(%rbp) # imm = 0x3F800000
1401a61c6:     	movw	$0x0, 0x51c(%rbp)
1401a61cf:     	movw	$0x0, 0x522(%rbp)
1401a61d8:     	movl	$0x10000, 0x51e(%rbp)   # imm = 0x10000
1401a61e2:     	movw	$0x0, 0x528(%rbp)
1401a61eb:     	movl	$0x10000, 0x524(%rbp)   # imm = 0x10000
1401a61f5:     	movq	$0x0, 0x52a(%rbp)
1401a6200:     	movl	$0x5, 0x532(%rbp)
1401a620a:     	movq	%rdi, 0x3b0(%rbp)
1401a6211:     	leaq	-0x18(%rbp), %rcx
1401a6215:     	leaq	0x3b0(%rbp), %r8
1401a621c:     	callq	0x140189f40 <.text+0x188f40>
1401a6221:     	movq	%rsi, 0x358(%rbp)
1401a6228:     	movq	(%rsi), %rax
1401a622b:     	movq	%rax, 0x330(%rbp)
1401a6232:     	movzbl	(%rbx), %esi
1401a6235:     	movq	-0x18(%rbp), %r15
1401a6239:     	movq	0x10(%rbp), %rax
1401a623d:     	movq	%r15, -0x48(%rbp)
1401a6241:     	leaq	-0x40(%rbp), %rbx
1401a6245:     	movups	-0x10(%rbp), %xmm0
1401a6249:     	movups	%xmm0, -0x40(%rbp)
1401a624d:     	movups	(%rbp), %xmm0
1401a6251:     	movups	%xmm0, -0x30(%rbp)
1401a6255:     	movq	%rax, -0x20(%rbp)
1401a6259:     	movaps	%xmm12, 0x1b0(%rbp)
1401a6261:     	movaps	%xmm12, 0x1a0(%rbp)
1401a6269:     	movaps	%xmm12, 0x190(%rbp)
1401a6271:     	movaps	%xmm12, 0x180(%rbp)
1401a6279:     	movaps	%xmm12, 0x170(%rbp)
1401a6281:     	movaps	%xmm7, %xmm0
1401a6284:     	movups	0x5c125f4(%rip), %xmm12 # 0x145db8880
1401a628c:     	movaps	%xmm6, %xmm1
1401a628f:     	movups	0x5c12632(%rip), %xmm2  # 0x145db88c8
1401a6296:     	movups	0x5c12613(%rip), %xmm7  # 0x145db88b0
1401a629d:     	movups	0x5c125f4(%rip), %xmm6  # 0x145db8898
1401a62a4:     	movq	$0x0, 0x1c0(%rbp)
1401a62af:     	movw	$0x0, 0x534(%rbp)
1401a62b8:     	movl	$0x0, 0x530(%rbp)
1401a62c2:     	movups	%xmm1, 0x1c8(%rbp)
1401a62c9:     	movups	%xmm9, 0x1d8(%rbp)
1401a62d1:     	movups	%xmm11, 0x1e8(%rbp)
1401a62d9:     	movups	%xmm10, 0x1f8(%rbp)
1401a62e1:     	movups	%xmm0, 0x218(%rbp)
1401a62e8:     	movups	%xmm13, 0x208(%rbp)
1401a62f0:     	movups	%xmm14, 0x238(%rbp)
1401a62f8:     	movups	%xmm15, 0x228(%rbp)
1401a6300:     	movaps	%xmm12, 0x110(%rbp)
1401a6308:     	movq	$0x0, 0x120(%rbp)
1401a6313:     	movups	%xmm6, 0x128(%rbp)
1401a631a:     	movq	$0x0, 0x138(%rbp)
1401a6325:     	movaps	%xmm7, 0x140(%rbp)
1401a632c:     	movq	$0x0, 0x150(%rbp)
1401a6337:     	movaps	%xmm2, %xmm10
1401a633b:     	movups	%xmm2, 0x158(%rbp)
1401a6342:     	movq	$0x0, 0x168(%rbp)
1401a634d:     	leaq	0x3b8(%rbp), %rcx
1401a6354:     	leaq	0x110(%rbp), %rdx
1401a635b:     	movl	$0x138, %r8d            # imm = 0x138
1401a6361:     	callq	0x145bc977b <.text+0x5bc877b>
1401a6366:     	movups	%xmm8, 0x4f0(%rbp)
1401a636e:     	movl	$0x1, 0x500(%rbp)
1401a6378:     	movq	$0x0, 0x504(%rbp)
1401a6383:     	movb	$0x1, 0x50c(%rbp)
1401a638a:     	movsd	0x5bc6f6e(%rip), %xmm0  # 0x145d6d300
1401a6392:     	movsd	%xmm0, 0x510(%rbp)
1401a639a:     	movl	$0x3f800000, 0x518(%rbp) # imm = 0x3F800000
1401a63a4:     	movw	$0x0, 0x51c(%rbp)
1401a63ad:     	movl	$0x10000, 0x51e(%rbp)   # imm = 0x10000
1401a63b7:     	movw	$0x0, 0x522(%rbp)
1401a63c0:     	movl	$0x10000, 0x524(%rbp)   # imm = 0x10000
1401a63ca:     	movw	$0x0, 0x528(%rbp)
1401a63d3:     	movl	$0x0, 0x52a(%rbp)
1401a63dd:     	movw	$0x1, 0x52e(%rbp)
1401a63e6:     	movq	%r15, 0x3b0(%rbp)
1401a63ed:     	leaq	0xa8(%rbp), %rcx
1401a63f4:     	leaq	0x3b0(%rbp), %r8
1401a63fb:     	movq	%rbx, %r13
1401a63fe:     	movq	%rbx, %rdx
1401a6401:     	callq	0x140189f40 <.text+0x188f40>
1401a6406:     	movq	0xa8(%rbp), %rbx
1401a640d:     	movq	0xd0(%rbp), %rax
1401a6414:     	movq	%rbx, 0x2c0(%rbp)
1401a641b:     	movups	0xb0(%rbp), %xmm0
1401a6422:     	movups	%xmm0, 0x2c8(%rbp)
1401a6429:     	movups	0xc0(%rbp), %xmm0
1401a6430:     	movups	%xmm0, 0x2d8(%rbp)
1401a6437:     	movq	%rax, 0x2e8(%rbp)
1401a643e:     	leaq	0x5c1260f(%rip), %rcx   # 0x145db8a54
1401a6445:     	movl	$0x7, %edx
1401a644a:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401a644f:     	movq	%rdx, %r12
1401a6452:     	testq	%rdx, %rdx
1401a6455:     	jns	0x1401a6466 <.text+0x1a5466>
1401a6457:     	xorl	%edi, %edi
1401a6459:     	movq	%rdi, %rcx
1401a645c:     	movq	%r12, %rdx
1401a645f:     	callq	0x145d6944b <.text+0x5d6844b>
1401a6464:     	ud2
1401a6466:     	movb	%sil, 0x5d7(%rbp)
1401a646d:     	movq	%rbx, 0x370(%rbp)
1401a6474:     	movq	%r15, 0x348(%rbp)
1401a647b:     	movq	%r13, %rbx
1401a647e:     	movq	0x330(%rbp), %rsi
1401a6485:     	movq	%rdi, 0x350(%rbp)
1401a648c:     	movq	%r14, 0x378(%rbp)
1401a6493:     	je	0x1401a64f0 <.text+0x1a54f0>
1401a6495:     	movq	%rax, %r14
1401a6498:     	callq	0x140002200 <.text+0x1200>
1401a649d:     	movl	$0x1, %edi
1401a64a2:     	movl	$0x1, %edx
1401a64a7:     	movq	%r12, %rcx
1401a64aa:     	callq	0x1400021c0 <.text+0x11c0>
1401a64af:     	testq	%rax, %rax
1401a64b2:     	je	0x1401a6459 <.text+0x1a5459>
1401a64b4:     	movq	%rax, %r13
1401a64b7:     	movq	%rax, %rcx
1401a64ba:     	movq	%r14, %rdx
1401a64bd:     	movq	%r12, %r8
1401a64c0:     	callq	0x145bc977b <.text+0x5bc877b>
1401a64c5:     	cmpb	$0x1, 0x18(%rsi)
1401a64c9:     	movzbl	0x5d7(%rbp), %edi
1401a64d0:     	jne	0x1401a6503 <.text+0x1a5503>
1401a64d2:     	movl	0x19(%rsi), %eax
1401a64d5:     	movl	0x1c(%rsi), %ecx
1401a64d8:     	movl	%ecx, 0x113(%rbp)
1401a64de:     	movl	%eax, 0x110(%rbp)
1401a64e4:     	movq	0x20(%rsi), %rax
1401a64e8:     	movzbl	0x28(%rsi), %edx
1401a64ec:     	movb	$0x1, %cl
1401a64ee:     	jmp	0x1401a6513 <.text+0x1a5513>
1401a64f0:     	movl	$0x1, %r13d
1401a64f6:     	cmpb	$0x1, 0x18(%rsi)
1401a64fa:     	movzbl	0x5d7(%rbp), %edi
1401a6501:     	je	0x1401a64d2 <.text+0x1a54d2>
1401a6503:     	movq	0x20(%rsi), %rax
1401a6507:     	lock
1401a6508:     	incq	(%rax)
1401a650b:     	jle	0x1401a7117 <.text+0x1a6117>
1401a6511:     	xorl	%ecx, %ecx
1401a6513:     	leaq	0x2c8(%rbp), %r14
1401a651a:     	movl	0x110(%rbp), %r8d
1401a6521:     	movl	0x113(%rbp), %r9d
1401a6528:     	movl	%r9d, 0x3ec(%rbp)
1401a652f:     	movl	%r8d, 0x3e9(%rbp)
1401a6536:     	movups	0x5c122bb(%rip), %xmm0  # 0x145db87f8
1401a653d:     	movaps	%xmm0, %xmm11
1401a6541:     	movups	%xmm0, 0x381(%rbp)
1401a6548:     	movl	$0x3f800000, 0x391(%rbp) # imm = 0x3F800000
1401a6552:     	xorps	%xmm0, %xmm0
1401a6555:     	movups	%xmm0, 0x41c(%rbp)
1401a655c:     	movq	%r12, 0x3b8(%rbp)
1401a6563:     	movq	%r13, 0x3c0(%rbp)
1401a656a:     	movq	%r12, 0x3c8(%rbp)
1401a6571:     	movq	$0x0, 0x3d0(%rbp)
1401a657c:     	movq	$0x4, 0x3d8(%rbp)
1401a6587:     	movq	$0x0, 0x3e0(%rbp)
1401a6592:     	movb	%cl, 0x3e8(%rbp)
1401a6598:     	movq	%rax, 0x3f0(%rbp)
1401a659f:     	movq	%rdx, 0x3f8(%rbp)
1401a65a6:     	movl	$0x42280000, 0x400(%rbp) # imm = 0x42280000
1401a65b0:     	movw	$0x190, 0x404(%rbp)     # imm = 0x190
1401a65b9:     	movb	$0x1, 0x406(%rbp)
1401a65c0:     	movq	0x38d(%rbp), %rax
1401a65c7:     	movq	%rax, 0x414(%rbp)
1401a65ce:     	movups	0x380(%rbp), %xmm0
1401a65d5:     	movups	%xmm0, 0x407(%rbp)
1401a65dc:     	movss	0x5bcda04(%rip), %xmm0  # 0x145d73fe8
1401a65e4:     	movlps	%xmm0, 0x42c(%rbp)
1401a65eb:     	movl	$0x40400000, 0x434(%rbp) # imm = 0x40400000
1401a65f5:     	movq	0x370(%rbp), %rax
1401a65fc:     	movq	%rax, 0x3b0(%rbp)
1401a6603:     	leaq	0x110(%rbp), %rcx
1401a660a:     	leaq	0x3b0(%rbp), %r8
1401a6611:     	movq	%r14, %rdx
1401a6614:     	callq	0x14018ef20 <.text+0x18df20>
1401a6619:     	movl	%edi, %ecx
1401a661b:     	callq	0x145875700 <.text+0x5874700>
1401a6620:     	movq	%rax, %r15
1401a6623:     	movq	0x50(%rax), %rdx
1401a6627:     	movq	0x58(%rax), %r8
1401a662b:     	movq	%r8, %rcx
1401a662e:     	subq	%rdx, %rcx
1401a6631:     	subq	%r8, %rcx
1401a6634:     	xorl	%r9d, %r9d
1401a6637:     	movq	0x358(%rbp), %r13
1401a663e:     	jmp	0x1401a6650 <.text+0x1a5650>
1401a6640:     	incq	%r9
1401a6643:     	addq	%rcx, %r9
1401a6646:     	cmpl	$0x23, %r10d
1401a664a:     	jne	0x1401a66e1 <.text+0x1a56e1>
1401a6650:     	cmpq	%r8, %r9
1401a6653:     	je	0x1401a66de <.text+0x1a56de>
1401a6659:     	movq	%r9, %rax
1401a665c:     	addq	%rdx, %r9
1401a665f:     	movzbl	(%r9), %edi
1401a6663:     	movzbl	%dil, %r10d
1401a6667:     	testb	%r10b, %r10b
1401a666a:     	jns	0x1401a6640 <.text+0x1a5640>
1401a666c:     	movl	%r10d, %r11d
1401a666f:     	andl	$0x1f, %r11d
1401a6673:     	movzbl	0x1(%r9), %r12d
1401a6678:     	andl	$0x3f, %r12d
1401a667c:     	cmpb	$-0x21, %r10b
1401a6680:     	jbe	0x1401a66bb <.text+0x1a56bb>
1401a6682:     	movzbl	0x2(%r9), %r10d
1401a6687:     	shll	$0x6, %r12d
1401a668b:     	andl	$0x3f, %r10d
1401a668f:     	orl	%r12d, %r10d
1401a6692:     	cmpb	$-0x10, %dil
1401a6696:     	jb	0x1401a66ce <.text+0x1a56ce>
1401a6698:     	movzbl	0x3(%r9), %edi
1401a669d:     	addq	$0x4, %r9
1401a66a1:     	andl	$0x7, %r11d
1401a66a5:     	shll	$0x12, %r11d
1401a66a9:     	shll	$0x6, %r10d
1401a66ad:     	andl	$0x3f, %edi
1401a66b0:     	orl	%r10d, %edi
1401a66b3:     	orl	%r11d, %edi
1401a66b6:     	movl	%edi, %r10d
1401a66b9:     	jmp	0x1401a6643 <.text+0x1a5643>
1401a66bb:     	addq	$0x2, %r9
1401a66bf:     	shll	$0x6, %r11d
1401a66c3:     	orl	%r12d, %r11d
1401a66c6:     	movl	%r11d, %r10d
1401a66c9:     	jmp	0x1401a6643 <.text+0x1a5643>
1401a66ce:     	addq	$0x3, %r9
1401a66d2:     	shll	$0xc, %r11d
1401a66d6:     	orl	%r11d, %r10d
1401a66d9:     	jmp	0x1401a6643 <.text+0x1a5643>
1401a66de:     	movq	%r8, %rax
1401a66e1:     	subq	%rax, %r8
1401a66e4:     	addq	%rax, %rdx
1401a66e7:     	leaq	0x3b0(%rbp), %rcx
1401a66ee:     	callq	0x14010f790 <.text+0x10e790>
1401a66f3:     	cmpl	$0x1, 0x3b0(%rbp)
1401a66fa:     	jne	0x1401a6705 <.text+0x1a5705>
1401a66fc:     	movups	0x5bc8811(%rip), %xmm0  # 0x145d6ef14
1401a6703:     	jmp	0x1401a670c <.text+0x1a570c>
1401a6705:     	movups	0x3b4(%rbp), %xmm0
1401a670c:     	movaps	%xmm0, 0x110(%rbp)
1401a6713:     	movq	%r15, %rcx
1401a6716:     	callq	0x145873d60 <.text+0x5872d60>
1401a671b:     	movq	%rdx, %r15
1401a671e:     	testq	%rdx, %rdx
1401a6721:     	jns	0x1401a6732 <.text+0x1a5732>
1401a6723:     	xorl	%edi, %edi
1401a6725:     	movq	%rdi, %rcx
1401a6728:     	movq	%r15, %rdx
1401a672b:     	callq	0x145d6944b <.text+0x5d6844b>
1401a6730:     	ud2
1401a6732:     	je	0x1401a6795 <.text+0x1a5795>
1401a6734:     	movq	%rax, %r13
1401a6737:     	callq	0x140002200 <.text+0x1200>
1401a673c:     	movl	$0x1, %edi
1401a6741:     	movl	$0x1, %edx
1401a6746:     	movq	%r15, %rcx
1401a6749:     	callq	0x1400021c0 <.text+0x11c0>
1401a674e:     	testq	%rax, %rax
1401a6751:     	je	0x1401a6725 <.text+0x1a5725>
1401a6753:     	movq	%rax, %r12
1401a6756:     	movq	%rax, %rcx
1401a6759:     	movq	%r13, %rdx
1401a675c:     	movq	%r15, %r8
1401a675f:     	callq	0x145bc977b <.text+0x5bc877b>
1401a6764:     	movq	0x358(%rbp), %r13
1401a676b:     	cmpb	$0x1, (%rsi)
1401a676e:     	movq	0x370(%rbp), %r9
1401a6775:     	jne	0x1401a67a7 <.text+0x1a57a7>
1401a6777:     	movl	0x1(%rsi), %eax
1401a677a:     	movl	0x4(%rsi), %ecx
1401a677d:     	movl	%ecx, 0x5d3(%rbp)
1401a6783:     	movl	%eax, 0x5d0(%rbp)
1401a6789:     	movq	0x8(%rsi), %rax
1401a678d:     	movzbl	0x10(%rsi), %ecx
1401a6791:     	movb	$0x1, %dl
1401a6793:     	jmp	0x1401a67b7 <.text+0x1a57b7>
1401a6795:     	movl	$0x1, %r12d
1401a679b:     	cmpb	$0x1, (%rsi)
1401a679e:     	movq	0x370(%rbp), %r9
1401a67a5:     	je	0x1401a6777 <.text+0x1a5777>
1401a67a7:     	movq	0x8(%rsi), %rax
1401a67ab:     	lock
1401a67ac:     	incq	(%rax)
1401a67af:     	jle	0x1401a7117 <.text+0x1a6117>
1401a67b5:     	xorl	%edx, %edx
1401a67b7:     	movaps	0x110(%rbp), %xmm0
1401a67be:     	movups	%xmm0, 0x40c(%rbp)
1401a67c5:     	movq	%r15, 0x3b8(%rbp)
1401a67cc:     	movq	%r12, 0x3c0(%rbp)
1401a67d3:     	movq	%r15, 0x3c8(%rbp)
1401a67da:     	movq	$0x0, 0x3d0(%rbp)
1401a67e5:     	movq	$0x4, 0x3d8(%rbp)
1401a67f0:     	movq	$0x0, 0x3e0(%rbp)
1401a67fb:     	movb	%dl, 0x3e8(%rbp)
1401a6801:     	movl	0x5d0(%rbp), %edx
1401a6807:     	movl	0x5d3(%rbp), %r8d
1401a680e:     	movl	%edx, 0x3e9(%rbp)
1401a6814:     	movl	%r8d, 0x3ec(%rbp)
1401a681b:     	movq	%rax, 0x3f0(%rbp)
1401a6822:     	movq	%rcx, 0x3f8(%rbp)
1401a6829:     	movl	$0x41700000, 0x400(%rbp) # imm = 0x41700000
1401a6833:     	movw	$0x190, 0x404(%rbp)     # imm = 0x190
1401a683c:     	movb	$0x1, 0x406(%rbp)
1401a6843:     	movl	$0x0, 0x408(%rbp)
1401a684d:     	movl	0x5bc7a94(%rip), %r12d  # 0x145d6e2e8
1401a6854:     	movl	%r12d, 0x42c(%rbp)
1401a685b:     	movups	0x5bc7a76(%rip), %xmm0  # 0x145d6e2d8
1401a6862:     	movups	%xmm0, 0x41c(%rbp)
1401a6869:     	movsd	0x5bc695f(%rip), %xmm0  # 0x145d6d1d0
1401a6871:     	movsd	%xmm0, 0x430(%rbp)
1401a6879:     	movq	%r9, 0x3b0(%rbp)
1401a6880:     	leaq	0x110(%rbp), %rcx
1401a6887:     	leaq	0x3b0(%rbp), %r8
1401a688e:     	movq	%r14, %rdx
1401a6891:     	callq	0x14018ef20 <.text+0x18df20>
1401a6896:     	callq	0x140002200 <.text+0x1200>
1401a689b:     	movl	$0x1e, %ecx
1401a68a0:     	movl	$0x1, %edx
1401a68a5:     	callq	0x1400021c0 <.text+0x11c0>
1401a68aa:     	testq	%rax, %rax
1401a68ad:     	je	0x1401a7119 <.text+0x1a6119>
1401a68b3:     	movups	0x5c121af(%rip), %xmm0  # 0x145db8a69
1401a68ba:     	movups	%xmm0, 0xe(%rax)
1401a68be:     	movups	0x5c12196(%rip), %xmm0  # 0x145db8a5b
1401a68c5:     	movups	%xmm0, (%rax)
1401a68c8:     	cmpb	$0x1, (%rsi)
1401a68cb:     	movq	0x360(%rbp), %rdi
1401a68d2:     	movq	0x368(%rbp), %r15
1401a68d9:     	jne	0x1401a68fa <.text+0x1a58fa>
1401a68db:     	movl	0x1(%rsi), %ecx
1401a68de:     	movl	0x4(%rsi), %edx
1401a68e1:     	movl	%edx, 0x383(%rbp)
1401a68e7:     	movl	%ecx, 0x380(%rbp)
1401a68ed:     	movq	0x8(%rsi), %rcx
1401a68f1:     	movzbl	0x10(%rsi), %edx
1401a68f5:     	movb	$0x1, %r8b
1401a68f8:     	jmp	0x1401a690b <.text+0x1a590b>
1401a68fa:     	movq	0x8(%rsi), %rcx
1401a68fe:     	lock
1401a68ff:     	incq	(%rcx)
1401a6902:     	jle	0x1401a7117 <.text+0x1a6117>
1401a6908:     	xorl	%r8d, %r8d
1401a690b:     	movq	$0x1e, 0x3b0(%rbp)
1401a6916:     	movq	%rax, 0x3b8(%rbp)
1401a691d:     	movq	$0x1e, 0x3c0(%rbp)
1401a6928:     	movq	$0x0, 0x3c8(%rbp)
1401a6933:     	movq	$0x4, 0x3d0(%rbp)
1401a693e:     	movq	$0x0, 0x3d8(%rbp)
1401a6949:     	movb	%r8b, 0x3e0(%rbp)
1401a6950:     	movl	0x380(%rbp), %eax
1401a6956:     	movl	0x383(%rbp), %r8d
1401a695d:     	movl	%eax, 0x3e1(%rbp)
1401a6963:     	movl	%r8d, 0x3e4(%rbp)
1401a696a:     	movq	%rcx, 0x3e8(%rbp)
1401a6971:     	movq	%rdx, 0x3f0(%rbp)
1401a6978:     	movl	$0x41700000, 0x3f8(%rbp) # imm = 0x41700000
1401a6982:     	movw	$0x190, 0x3fc(%rbp)     # imm = 0x190
1401a698b:     	movb	$0x1, 0x3fe(%rbp)
1401a6992:     	movups	0x5c11ea3(%rip), %xmm0  # 0x145db883c
1401a6999:     	movups	%xmm0, 0x400(%rbp)
1401a69a0:     	movl	$0x3f800000, 0x410(%rbp) # imm = 0x3F800000
1401a69aa:     	leaq	0x110(%rbp), %rcx
1401a69b1:     	leaq	0x3b0(%rbp), %rdx
1401a69b8:     	callq	0x1401a48e0 <.text+0x1a38e0>
1401a69bd:     	movaps	%xmm11, 0x380(%rbp)
1401a69c5:     	movl	$0x3f800000, 0x390(%rbp) # imm = 0x3F800000
1401a69cf:     	movups	0x5c11e95(%rip), %xmm11 # 0x145db886c
1401a69d7:     	movups	%xmm11, 0x394(%rbp)
1401a69df:     	movl	$0x3f800000, 0x3a4(%rbp) # imm = 0x3F800000
1401a69e9:     	movw	$0x0, 0x514(%rbp)
1401a69f2:     	movb	$0x1, 0x504(%rbp)
1401a69f9:     	xorps	%xmm0, %xmm0
1401a69fc:     	movaps	%xmm0, 0x410(%rbp)
1401a6a03:     	movaps	%xmm0, 0x420(%rbp)
1401a6a0a:     	movaps	%xmm0, 0x430(%rbp)
1401a6a11:     	movaps	%xmm0, 0x440(%rbp)
1401a6a18:     	movaps	%xmm0, 0x450(%rbp)
1401a6a1f:     	movq	$0x0, 0x460(%rbp)
1401a6a2a:     	movl	$0x5000005, 0x52a(%rbp) # imm = 0x5000005
1401a6a34:     	movups	0x5c11efd(%rip), %xmm0  # 0x145db8938
1401a6a3b:     	movups	%xmm0, 0x468(%rbp)
1401a6a42:     	movups	%xmm9, 0x478(%rbp)
1401a6a4a:     	movaps	0x5bc688f(%rip), %xmm0  # 0x145d6d2e0
1401a6a51:     	movups	%xmm0, 0x488(%rbp)
1401a6a58:     	movaps	0x5bc69b1(%rip), %xmm0  # 0x145d6d410
1401a6a5f:     	movups	%xmm0, 0x498(%rbp)
1401a6a66:     	movaps	0x5bc6823(%rip), %xmm0  # 0x145d6d290
1401a6a6d:     	movups	%xmm0, 0x4a8(%rbp)
1401a6a74:     	movups	%xmm0, 0x4b8(%rbp)
1401a6a7b:     	movaps	0x5bc6b6e(%rip), %xmm0  # 0x145d6d5f0
1401a6a82:     	movups	%xmm0, 0x4c8(%rbp)
1401a6a89:     	movups	%xmm0, 0x4d8(%rbp)
1401a6a90:     	movq	$0x0, 0x508(%rbp)
1401a6a9b:     	movl	$0x3f800000, 0x510(%rbp) # imm = 0x3F800000
1401a6aa5:     	movups	%xmm8, 0x4e8(%rbp)
1401a6aad:     	movl	$0x1, 0x4f8(%rbp)
1401a6ab7:     	movq	$0x0, 0x4fc(%rbp)
1401a6ac2:     	movq	$0x0, 0x522(%rbp)
1401a6acd:     	movaps	%xmm12, 0x3b0(%rbp)
1401a6ad5:     	movq	$0x0, 0x3c0(%rbp)
1401a6ae0:     	movups	%xmm6, 0x3c8(%rbp)
1401a6ae7:     	movq	$0x0, 0x3d8(%rbp)
1401a6af2:     	movaps	%xmm7, 0x3e0(%rbp)
1401a6af9:     	movq	$0x0, 0x3f0(%rbp)
1401a6b04:     	movups	%xmm10, 0x3f8(%rbp)
1401a6b0c:     	movq	$0x0, 0x408(%rbp)
1401a6b17:     	movw	$0x0, 0x51a(%rbp)
1401a6b20:     	movl	$0x10000, 0x516(%rbp)   # imm = 0x10000
1401a6b2a:     	movw	$0x0, 0x520(%rbp)
1401a6b33:     	movl	$0x10000, 0x51c(%rbp)   # imm = 0x10000
1401a6b3d:     	leaq	0xa8(%rbp), %rcx
1401a6b44:     	callq	0x140012180 <.text+0x11180>
1401a6b49:     	nop
1401a6b4a:     	movq	0x3a0(%rbp), %rax
1401a6b51:     	movq	%rax, 0x2b0(%rbp)
1401a6b58:     	movaps	0x380(%rbp), %xmm0
1401a6b5f:     	movaps	0x390(%rbp), %xmm1
1401a6b66:     	movups	%xmm1, 0x2a0(%rbp)
1401a6b6d:     	movups	%xmm0, 0x290(%rbp)
1401a6b74:     	leaq	0x110(%rbp), %r14
1401a6b7b:     	leaq	0x3b0(%rbp), %rdx
1401a6b82:     	movl	$0x180, %r8d            # imm = 0x180
1401a6b88:     	movq	%r14, %rcx
1401a6b8b:     	callq	0x145bc977b <.text+0x5bc877b>
1401a6b90:     	movups	0xa8(%rbp), %xmm0
1401a6b97:     	movups	0xb8(%rbp), %xmm1
1401a6b9e:     	movups	0xc8(%rbp), %xmm2
1401a6ba5:     	movups	0xd8(%rbp), %xmm3
1401a6bac:     	movups	%xmm0, 0x2c3(%rbp)
1401a6bb3:     	movups	%xmm1, 0x2d3(%rbp)
1401a6bba:     	movups	%xmm2, 0x2e3(%rbp)
1401a6bc1:     	movups	%xmm3, 0x2f3(%rbp)
1401a6bc8:     	movups	0xe8(%rbp), %xmm0
1401a6bcf:     	movups	%xmm0, 0x303(%rbp)
1401a6bd6:     	movups	0xf8(%rbp), %xmm0
1401a6bdd:     	movups	%xmm0, 0x313(%rbp)
1401a6be4:     	movq	0x108(%rbp), %rax
1401a6beb:     	movq	%rax, 0x323(%rbp)
1401a6bf2:     	leaq	0x3b8(%rbp), %rcx
1401a6bf9:     	movl	$0x1a8, %r8d            # imm = 0x1A8
1401a6bff:     	movq	%r14, %rdx
1401a6c02:     	callq	0x145bc977b <.text+0x5bc877b>
1401a6c07:     	movl	$0x0, 0x560(%rbp)
1401a6c11:     	movb	$0x2, 0x564(%rbp)
1401a6c18:     	movups	0x2c0(%rbp), %xmm0
1401a6c1f:     	movups	0x2d0(%rbp), %xmm1
1401a6c26:     	movups	0x2e0(%rbp), %xmm2
1401a6c2d:     	movups	0x2f0(%rbp), %xmm3
1401a6c34:     	movups	%xmm0, 0x565(%rbp)
1401a6c3b:     	movups	%xmm1, 0x575(%rbp)
1401a6c42:     	movups	%xmm2, 0x585(%rbp)
1401a6c49:     	movups	%xmm3, 0x595(%rbp)
1401a6c50:     	movups	0x300(%rbp), %xmm0
1401a6c57:     	movups	%xmm0, 0x5a5(%rbp)
1401a6c5e:     	movups	0x310(%rbp), %xmm0
1401a6c65:     	movups	%xmm0, 0x5b5(%rbp)
1401a6c6c:     	movups	0x31b(%rbp), %xmm0
1401a6c73:     	movups	%xmm0, 0x5c0(%rbp)
1401a6c7a:     	movq	0x348(%rbp), %rax
1401a6c81:     	movq	%rax, 0x3b0(%rbp)
1401a6c88:     	leaq	0xa8(%rbp), %rcx
1401a6c8f:     	leaq	0x3b0(%rbp), %r8
1401a6c96:     	movq	%rbx, %rdx
1401a6c99:     	callq	0x14018f460 <.text+0x18e460>
1401a6c9e:     	leaq	0x5c12015(%rip), %rcx   # 0x145db8cba
1401a6ca5:     	movl	$0x5, %edx
1401a6caa:     	callq	0x1458da4e0 <.text+0x58d94e0>
1401a6caf:     	movq	%rdx, %rbx
1401a6cb2:     	testq	%rdx, %rdx
1401a6cb5:     	jns	0x1401a6cc6 <.text+0x1a5cc6>
1401a6cb7:     	xorl	%edi, %edi
1401a6cb9:     	movq	%rdi, %rcx
1401a6cbc:     	movq	%rbx, %rdx
1401a6cbf:     	callq	0x145d6944b <.text+0x5d6844b>
1401a6cc4:     	ud2
1401a6cc6:     	je	0x1401a6d29 <.text+0x1a5d29>
1401a6cc8:     	movq	%rax, %r15
1401a6ccb:     	callq	0x140002200 <.text+0x1200>
1401a6cd0:     	movl	$0x1, %edi
1401a6cd5:     	movl	$0x1, %edx
1401a6cda:     	movq	%rbx, %rcx
1401a6cdd:     	callq	0x1400021c0 <.text+0x11c0>
1401a6ce2:     	testq	%rax, %rax
1401a6ce5:     	je	0x1401a6cb9 <.text+0x1a5cb9>
1401a6ce7:     	movq	%rax, %r14
1401a6cea:     	movq	%rax, %rcx
1401a6ced:     	movq	%r15, %rdx
1401a6cf0:     	movq	%rbx, %r8
1401a6cf3:     	callq	0x145bc977b <.text+0x5bc877b>
1401a6cf8:     	movq	0x360(%rbp), %rdi
1401a6cff:     	movq	0x368(%rbp), %r15
1401a6d06:     	cmpb	$0x1, (%rsi)
1401a6d09:     	jne	0x1401a6d34 <.text+0x1a5d34>
1401a6d0b:     	movl	0x1(%rsi), %eax
1401a6d0e:     	movl	0x4(%rsi), %ecx
1401a6d11:     	movl	%ecx, 0x113(%rbp)
1401a6d17:     	movl	%eax, 0x110(%rbp)
1401a6d1d:     	movq	0x8(%rsi), %rax
1401a6d21:     	movzbl	0x10(%rsi), %ecx
1401a6d25:     	movb	$0x1, %dl
1401a6d27:     	jmp	0x1401a6d44 <.text+0x1a5d44>
1401a6d29:     	movl	$0x1, %r14d
1401a6d2f:     	cmpb	$0x1, (%rsi)
1401a6d32:     	je	0x1401a6d0b <.text+0x1a5d0b>
1401a6d34:     	movq	0x8(%rsi), %rax
1401a6d38:     	lock
1401a6d39:     	incq	(%rax)
1401a6d3c:     	jle	0x1401a7117 <.text+0x1a6117>
1401a6d42:     	xorl	%edx, %edx
1401a6d44:     	movq	0x378(%rbp), %rsi
1401a6d4b:     	movq	%rbx, 0x3b0(%rbp)
1401a6d52:     	movq	%r14, 0x3b8(%rbp)
1401a6d59:     	movq	%rbx, 0x3c0(%rbp)
1401a6d60:     	movq	$0x0, 0x3c8(%rbp)
1401a6d6b:     	movq	$0x4, 0x3d0(%rbp)
1401a6d76:     	movq	$0x0, 0x3d8(%rbp)
1401a6d81:     	movb	%dl, 0x3e0(%rbp)
1401a6d87:     	movl	0x110(%rbp), %edx
1401a6d8d:     	movl	0x113(%rbp), %r8d
1401a6d94:     	movl	%edx, 0x3e1(%rbp)
1401a6d9a:     	movl	%r8d, 0x3e4(%rbp)
1401a6da1:     	movq	%rax, 0x3e8(%rbp)
1401a6da8:     	movq	%rcx, 0x3f0(%rbp)
1401a6daf:     	movl	$0x41900000, 0x3f8(%rbp) # imm = 0x41900000
1401a6db9:     	movw	$0x190, 0x3fc(%rbp)     # imm = 0x190
1401a6dc2:     	movb	$0x1, 0x3fe(%rbp)
1401a6dc9:     	movups	%xmm11, 0x400(%rbp)
1401a6dd1:     	movl	$0x3f800000, 0x410(%rbp) # imm = 0x3F800000
1401a6ddb:     	movl	%r12d, 0x424(%rbp)
1401a6de2:     	movups	0x5bc74ef(%rip), %xmm0  # 0x145d6e2d8
1401a6de9:     	movups	%xmm0, 0x414(%rbp)
1401a6df0:     	movsd	0x5bc63d8(%rip), %xmm0  # 0x145d6d1d0
1401a6df8:     	movsd	%xmm0, 0x428(%rbp)
1401a6e00:     	leaq	0xa8(%rbp), %rcx
1401a6e07:     	leaq	0x3b0(%rbp), %rdx
1401a6e0e:     	callq	0x1401a4e60 <.text+0x1a3e60>
1401a6e13:     	xorps	%xmm0, %xmm0
1401a6e16:     	movups	%xmm0, 0x430(%rbp)
1401a6e1d:     	movups	%xmm0, 0x420(%rbp)
1401a6e24:     	movups	%xmm0, 0x448(%rbp)
1401a6e2b:     	movups	%xmm0, 0x45c(%rbp)
1401a6e32:     	movl	$0x0, 0x46c(%rbp)
1401a6e3c:     	movl	$0x0, 0x530(%rbp)
1401a6e46:     	movw	$0x0, 0x534(%rbp)
1401a6e4f:     	movaps	%xmm12, 0x110(%rbp)
1401a6e57:     	movq	$0x0, 0x120(%rbp)
1401a6e62:     	movups	%xmm6, 0x128(%rbp)
1401a6e69:     	movq	$0x0, 0x138(%rbp)
1401a6e74:     	movaps	%xmm7, 0x140(%rbp)
1401a6e7b:     	movq	$0x0, 0x150(%rbp)
1401a6e86:     	movups	%xmm10, 0x158(%rbp)
1401a6e8e:     	movq	$0x0, 0x168(%rbp)
1401a6e99:     	movq	0x160(%rbp), %rax
1401a6ea0:     	movq	%rax, 0x408(%rbp)
1401a6ea7:     	movq	0x168(%rbp), %rax
1401a6eae:     	movq	%rax, 0x410(%rbp)
1401a6eb5:     	movq	0x150(%rbp), %rax
1401a6ebc:     	movq	%rax, 0x3f8(%rbp)
1401a6ec3:     	movq	0x158(%rbp), %rax
1401a6eca:     	movq	%rax, 0x400(%rbp)
1401a6ed1:     	movaps	0x110(%rbp), %xmm0
1401a6ed8:     	movaps	0x120(%rbp), %xmm1
1401a6edf:     	movq	0x130(%rbp), %rax
1401a6ee6:     	movq	0x138(%rbp), %rcx
1401a6eed:     	movaps	0x140(%rbp), %xmm2
1401a6ef4:     	movups	%xmm2, 0x3e8(%rbp)
1401a6efb:     	movq	%rax, 0x3d8(%rbp)
1401a6f02:     	movq	%rcx, 0x3e0(%rbp)
1401a6f09:     	movups	%xmm1, 0x3c8(%rbp)
1401a6f10:     	movups	%xmm0, 0x3b8(%rbp)
1401a6f17:     	movq	$0x0, 0x418(%rbp)
1401a6f22:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
1401a6f2c:     	movq	%rax, 0x440(%rbp)
1401a6f33:     	movl	$0x1, 0x458(%rbp)
1401a6f3d:     	movups	%xmm9, 0x480(%rbp)
1401a6f45:     	movups	0x5c119ec(%rip), %xmm0  # 0x145db8938
1401a6f4c:     	movups	%xmm0, 0x470(%rbp)
1401a6f53:     	movups	0x5c11a0e(%rip), %xmm0  # 0x145db8968
1401a6f5a:     	movups	%xmm0, 0x4a0(%rbp)
1401a6f61:     	movups	0x5c119f0(%rip), %xmm0  # 0x145db8958
1401a6f68:     	movups	%xmm0, 0x490(%rbp)
1401a6f6f:     	movups	0x5c11a12(%rip), %xmm0  # 0x145db8988
1401a6f76:     	movups	%xmm0, 0x4c0(%rbp)
1401a6f7d:     	movups	%xmm13, 0x4b0(%rbp)
1401a6f85:     	movups	%xmm14, 0x4e0(%rbp)
1401a6f8d:     	movups	%xmm15, 0x4d0(%rbp)
1401a6f95:     	movups	%xmm8, 0x4f0(%rbp)
1401a6f9d:     	movl	$0x1, 0x500(%rbp)
1401a6fa7:     	movss	0x5bc68d1(%rip), %xmm0  # 0x145d6d880
1401a6faf:     	movlps	%xmm0, 0x504(%rbp)
1401a6fb6:     	movb	$0x1, 0x50c(%rbp)
1401a6fbd:     	movsd	0x5bc633b(%rip), %xmm0  # 0x145d6d300
1401a6fc5:     	movsd	%xmm0, 0x510(%rbp)
1401a6fcd:     	movl	$0x3f800000, 0x518(%rbp) # imm = 0x3F800000
1401a6fd7:     	movw	$0x0, 0x51c(%rbp)
1401a6fe0:     	movw	$0x0, 0x522(%rbp)
1401a6fe9:     	movl	$0x10000, 0x51e(%rbp)   # imm = 0x10000
1401a6ff3:     	movw	$0x0, 0x528(%rbp)
1401a6ffc:     	movl	$0x10000, 0x524(%rbp)   # imm = 0x10000
1401a7006:     	movw	$0x0, 0x52e(%rbp)
1401a700f:     	movl	$0x0, 0x52a(%rbp)
1401a7019:     	movq	0x350(%rbp), %rax
1401a7020:     	movq	%rax, 0x3b0(%rbp)
1401a7027:     	leaq	0x2c0(%rbp), %rcx
1401a702e:     	leaq	0x3b0(%rbp), %r8
1401a7035:     	leaq	0x80(%rbp), %rdx
1401a703c:     	callq	0x140189f40 <.text+0x188f40>
1401a7041:     	movq	0x2c0(%rbp), %rax
1401a7048:     	movq	0x2e8(%rbp), %rcx
1401a704f:     	movq	%rax, 0x3b0(%rbp)
1401a7056:     	movups	0x2c8(%rbp), %xmm0
1401a705d:     	movups	%xmm0, 0x3b8(%rbp)
1401a7064:     	movups	0x2d8(%rbp), %xmm0
1401a706b:     	movups	%xmm0, 0x3c8(%rbp)
1401a7072:     	movq	%rcx, 0x3d8(%rbp)
1401a7079:     	movq	(%r13), %rdx
1401a707d:     	movq	(%rdi), %r8
1401a7080:     	movq	(%r15), %r9
1401a7083:     	movq	0x338(%rbp), %rax
1401a708a:     	movq	(%rax), %rax
1401a708d:     	movq	0x340(%rbp), %rcx
1401a7094:     	movq	(%rcx), %rcx
1401a7097:     	movq	%rcx, 0x28(%rsp)
1401a709c:     	movq	%rax, 0x20(%rsp)
1401a70a1:     	movb	$0x1, 0x30(%rsp)
1401a70a6:     	leaq	0x3b0(%rbp), %rcx
1401a70ad:     	callq	0x14012bb00 <.text+0x12ab00>
1401a70b2:     	movq	%rsi, %rax
1401a70b5:     	movaps	0x5e0(%rbp), %xmm6
1401a70bc:     	movaps	0x5f0(%rbp), %xmm7
1401a70c3:     	movaps	0x600(%rbp), %xmm8
1401a70cb:     	movaps	0x610(%rbp), %xmm9
1401a70d3:     	movaps	0x620(%rbp), %xmm10
1401a70db:     	movaps	0x630(%rbp), %xmm11
1401a70e3:     	movaps	0x640(%rbp), %xmm12
1401a70eb:     	movaps	0x650(%rbp), %xmm13
1401a70f3:     	movaps	0x660(%rbp), %xmm14
1401a70fb:     	movaps	0x670(%rbp), %xmm15
1401a7103:     	addq	$0x708, %rsp            # imm = 0x708
1401a710a:     	popq	%rbx
1401a710b:     	popq	%rdi
1401a710c:     	popq	%rsi
1401a710d:     	popq	%r12
1401a710f:     	popq	%r13
1401a7111:     	popq	%r14
1401a7113:     	popq	%r15
1401a7115:     	popq	%rbp
1401a7116:     	retq
1401a7117:     	ud2
1401a7119:     	movl	$0x1, %ecx
1401a711e:     	movl	$0x1e, %edx
1401a7123:     	callq	0x145d6944b <.text+0x5d6844b>
1401a7128:     	ud2

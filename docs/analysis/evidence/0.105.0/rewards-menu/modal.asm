
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14020ccc0:     	pushq	%rbp
14020ccc1:     	pushq	%r15
14020ccc3:     	pushq	%r14
14020ccc5:     	pushq	%r13
14020ccc7:     	pushq	%r12
14020ccc9:     	pushq	%rsi
14020ccca:     	pushq	%rdi
14020cccb:     	pushq	%rbx
14020cccc:     	subq	$0x578, %rsp            # imm = 0x578
14020ccd3:     	leaq	0x80(%rsp), %rbp
14020ccdb:     	movaps	%xmm15, 0x4e0(%rbp)
14020cce3:     	movaps	%xmm14, 0x4d0(%rbp)
14020cceb:     	movaps	%xmm13, 0x4c0(%rbp)
14020ccf3:     	movaps	%xmm12, 0x4b0(%rbp)
14020ccfb:     	movaps	%xmm11, 0x4a0(%rbp)
14020cd03:     	movaps	%xmm10, 0x490(%rbp)
14020cd0b:     	movaps	%xmm9, 0x480(%rbp)
14020cd13:     	movaps	%xmm8, 0x470(%rbp)
14020cd1b:     	movaps	%xmm7, 0x460(%rbp)
14020cd22:     	movaps	%xmm6, 0x450(%rbp)
14020cd29:     	movq	$-0x2, 0x448(%rbp)
14020cd34:     	movq	%rdx, %r14
14020cd37:     	movq	%rcx, %rsi
14020cd3a:     	movq	(%rcx), %rbx
14020cd3d:     	movq	0x28(%rcx), %rax
14020cd41:     	movq	%rbx, -0x20(%rbp)
14020cd45:     	leaq	-0x18(%rbp), %rdi
14020cd49:     	movups	0x8(%rcx), %xmm0
14020cd4d:     	movups	%xmm0, -0x18(%rbp)
14020cd51:     	movups	0x18(%rcx), %xmm0
14020cd55:     	movups	%xmm0, -0x8(%rbp)
14020cd59:     	movq	%rax, 0x8(%rbp)
14020cd5d:     	movw	$0x0, 0x414(%rbp)
14020cd66:     	movb	$0x1, 0x404(%rbp)
14020cd6d:     	xorps	%xmm0, %xmm0
14020cd70:     	movups	%xmm0, 0x318(%rbp)
14020cd77:     	movups	%xmm0, 0x328(%rbp)
14020cd7e:     	movabsq	$0x43e6000000000001, %rax # imm = 0x43E6000000000001
14020cd88:     	movq	%rax, 0x338(%rbp)
14020cd8f:     	movq	$0x0, 0x310(%rbp)
14020cd9a:     	movaps	%xmm0, 0x340(%rbp)
14020cda1:     	movaps	%xmm0, 0x350(%rbp)
14020cda8:     	movq	$0x0, 0x360(%rbp)
14020cdb3:     	movl	$0x5, 0x42a(%rbp)
14020cdbd:     	movups	0x5babb73(%rip), %xmm14 # 0x145db8938
14020cdc5:     	movups	%xmm14, 0x368(%rbp)
14020cdcd:     	movups	0x5babb73(%rip), %xmm15 # 0x145db8948
14020cdd5:     	movups	%xmm15, 0x378(%rbp)
14020cddd:     	movaps	0x5b9108c(%rip), %xmm0  # 0x145d9de70
14020cde4:     	movups	%xmm0, 0x388(%rbp)
14020cdeb:     	movaps	0x5b66fae(%rip), %xmm0  # 0x145d73da0
14020cdf2:     	movups	%xmm0, 0x398(%rbp)
14020cdf9:     	movups	0x5babb78(%rip), %xmm6  # 0x145db8978
14020ce00:     	movups	%xmm6, 0x3a8(%rbp)
14020ce07:     	movups	0x5babb7a(%rip), %xmm7  # 0x145db8988
14020ce0e:     	movups	%xmm7, 0x3b8(%rbp)
14020ce15:     	movups	0x5babb8b(%rip), %xmm8  # 0x145db89a8
14020ce1d:     	movups	%xmm8, 0x3d8(%rbp)
14020ce25:     	movups	0x5babb6b(%rip), %xmm9  # 0x145db8998
14020ce2d:     	movups	%xmm9, 0x3c8(%rbp)
14020ce35:     	movq	$0x0, 0x408(%rbp)
14020ce40:     	movl	$0x3f800000, 0x410(%rbp) # imm = 0x3F800000
14020ce4a:     	movaps	0x5baae6f(%rip), %xmm0  # 0x145db7cc0
14020ce51:     	movups	%xmm0, 0x3e8(%rbp)
14020ce58:     	movl	$0x1, 0x3f8(%rbp)
14020ce62:     	movq	$0x0, 0x3fc(%rbp)
14020ce6d:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
14020ce77:     	movq	%rax, 0x422(%rbp)
14020ce7e:     	movups	0x5bab9fa(%rip), %xmm10 # 0x145db8880
14020ce86:     	movaps	%xmm10, 0x2b0(%rbp)
14020ce8e:     	movq	$0x0, 0x2c0(%rbp)
14020ce99:     	movups	0x5bab9f7(%rip), %xmm11 # 0x145db8898
14020cea1:     	movups	%xmm11, 0x2c8(%rbp)
14020cea9:     	movq	$0x0, 0x2d8(%rbp)
14020ceb4:     	movups	0x5bab9f4(%rip), %xmm12 # 0x145db88b0
14020cebc:     	movaps	%xmm12, 0x2e0(%rbp)
14020cec4:     	movq	$0x0, 0x2f0(%rbp)
14020cecf:     	movups	0x5bab9f1(%rip), %xmm13 # 0x145db88c8
14020ced7:     	movups	%xmm13, 0x2f8(%rbp)
14020cedf:     	movq	$0x0, 0x308(%rbp)
14020ceea:     	movw	$0x0, 0x41a(%rbp)
14020cef3:     	movl	$0x10000, 0x416(%rbp)   # imm = 0x10000
14020cefd:     	movw	$0x0, 0x420(%rbp)
14020cf06:     	movl	$0x10000, 0x41c(%rbp)   # imm = 0x10000
14020cf10:     	leaq	0x48(%rbp), %rcx
14020cf14:     	leaq	0x2b0(%rbp), %rdx
14020cf1b:     	callq	0x140012c60 <.text+0x11c60>
14020cf20:     	movq	%rbx, 0x40(%rbp)
14020cf24:     	leaq	-0x50(%rbp), %rcx
14020cf28:     	leaq	0x40(%rbp), %r8
14020cf2c:     	movq	%rdi, %rdx
14020cf2f:     	callq	0x14018b7d0 <.text+0x18a7d0>
14020cf34:     	movq	(%r14), %rdi
14020cf37:     	movq	0x8(%r14), %rbx
14020cf3b:     	movq	0x10(%r14), %r15
14020cf3f:     	movq	-0x50(%rbp), %r14
14020cf43:     	movq	-0x28(%rbp), %rax
14020cf47:     	movq	%r14, 0x10(%rbp)
14020cf4b:     	movups	-0x48(%rbp), %xmm0
14020cf4f:     	movups	%xmm0, 0x18(%rbp)
14020cf53:     	movups	-0x38(%rbp), %xmm0
14020cf57:     	movups	%xmm0, 0x28(%rbp)
14020cf5b:     	movq	%rax, 0x38(%rbp)
14020cf5f:     	leaq	0x5bac7ab(%rip), %rcx   # 0x145db9711
14020cf66:     	movl	$0xf, %edx
14020cf6b:     	callq	0x1458da4e0 <.text+0x58d94e0>
14020cf70:     	movq	%rdx, %r12
14020cf73:     	testq	%rdx, %rdx
14020cf76:     	jns	0x14020cf87 <.text+0x20bf87>
14020cf78:     	xorl	%ebx, %ebx
14020cf7a:     	movq	%rbx, %rcx
14020cf7d:     	movq	%r12, %rdx
14020cf80:     	callq	0x145d6944b <.text+0x5d6844b>
14020cf85:     	ud2
14020cf87:     	movq	%r15, 0x2a0(%rbp)
14020cf8e:     	movq	%rbx, 0x298(%rbp)
14020cf95:     	je	0x14020cfec <.text+0x20bfec>
14020cf97:     	movq	%rax, %r15
14020cf9a:     	callq	0x140002200 <.text+0x1200>
14020cf9f:     	movl	$0x1, %ebx
14020cfa4:     	movl	$0x1, %edx
14020cfa9:     	movq	%r12, %rcx
14020cfac:     	callq	0x1400021c0 <.text+0x11c0>
14020cfb1:     	testq	%rax, %rax
14020cfb4:     	je	0x14020cf7a <.text+0x20bf7a>
14020cfb6:     	movq	%rax, %r13
14020cfb9:     	movq	%rax, %rcx
14020cfbc:     	movq	%r15, %rdx
14020cfbf:     	movq	%r12, %r8
14020cfc2:     	callq	0x145bc977b <.text+0x5bc877b>
14020cfc7:     	cmpb	$0x1, 0x18(%rdi)
14020cfcb:     	jne	0x14020cff8 <.text+0x20bff8>
14020cfcd:     	movl	0x19(%rdi), %eax
14020cfd0:     	movl	0x1c(%rdi), %ecx
14020cfd3:     	movl	%ecx, 0x443(%rbp)
14020cfd9:     	movl	%eax, 0x440(%rbp)
14020cfdf:     	movq	0x20(%rdi), %rax
14020cfe3:     	movzbl	0x28(%rdi), %ecx
14020cfe7:     	movb	$0x1, %r8b
14020cfea:     	jmp	0x14020d009 <.text+0x20c009>
14020cfec:     	movl	$0x1, %r13d
14020cff2:     	cmpb	$0x1, 0x18(%rdi)
14020cff6:     	je	0x14020cfcd <.text+0x20bfcd>
14020cff8:     	movq	0x20(%rdi), %rax
14020cffc:     	lock
14020cffd:     	incq	(%rax)
14020d000:     	jle	0x14020d6eb <.text+0x20c6eb>
14020d006:     	xorl	%r8d, %r8d
14020d009:     	leaq	0x18(%rbp), %rdx
14020d00d:     	movups	0x5bab7e4(%rip), %xmm0  # 0x145db87f8
14020d014:     	movups	%xmm0, 0x251(%rbp)
14020d01b:     	movl	$0x3f800000, 0x261(%rbp) # imm = 0x3F800000
14020d025:     	movq	%r12, 0x48(%rbp)
14020d029:     	movq	%r13, 0x50(%rbp)
14020d02d:     	movq	%r12, 0x58(%rbp)
14020d031:     	movq	$0x0, 0x60(%rbp)
14020d039:     	movq	$0x4, 0x68(%rbp)
14020d041:     	movq	$0x0, 0x70(%rbp)
14020d049:     	movb	%r8b, 0x78(%rbp)
14020d04d:     	movl	0x440(%rbp), %r9d
14020d054:     	movl	0x443(%rbp), %r8d
14020d05b:     	movl	%r9d, 0x79(%rbp)
14020d05f:     	movl	%r8d, 0x7c(%rbp)
14020d063:     	movq	%rax, 0x80(%rbp)
14020d06a:     	movq	%rcx, 0x88(%rbp)
14020d071:     	movl	$0x41d00000, 0x90(%rbp) # imm = 0x41D00000
14020d07b:     	movw	$0x190, 0x94(%rbp)      # imm = 0x190
14020d084:     	movb	$0x1, 0x96(%rbp)
14020d08b:     	movups	0x250(%rbp), %xmm0
14020d092:     	movups	%xmm0, 0x97(%rbp)
14020d099:     	movq	0x25d(%rbp), %rax
14020d0a0:     	movq	%rax, 0xa4(%rbp)
14020d0a7:     	movl	0x5b6123b(%rip), %eax   # 0x145d6e2e8
14020d0ad:     	movl	%eax, 0xbc(%rbp)
14020d0b3:     	movups	0x5b6121e(%rip), %xmm0  # 0x145d6e2d8
14020d0ba:     	movups	%xmm0, 0xac(%rbp)
14020d0c1:     	movsd	0x5b60107(%rip), %xmm0  # 0x145d6d1d0
14020d0c9:     	movsd	%xmm0, 0xc0(%rbp)
14020d0d1:     	movq	%r14, 0x40(%rbp)
14020d0d5:     	leaq	0x2b0(%rbp), %rcx
14020d0dc:     	leaq	0x40(%rbp), %r8
14020d0e0:     	callq	0x14018ef20 <.text+0x18df20>
14020d0e5:     	movw	$0x0, 0x414(%rbp)
14020d0ee:     	movb	$0x1, 0x404(%rbp)
14020d0f5:     	xorps	%xmm0, %xmm0
14020d0f8:     	movups	%xmm0, 0x318(%rbp)
14020d0ff:     	movups	%xmm0, 0x328(%rbp)
14020d106:     	movups	%xmm0, 0x338(%rbp)
14020d10d:     	movups	%xmm0, 0x348(%rbp)
14020d114:     	movsd	0x5bab574(%rip), %xmm0  # 0x145db8690
14020d11c:     	movups	%xmm0, 0x358(%rbp)
14020d123:     	movq	$0x0, 0x310(%rbp)
14020d12e:     	movl	$0x0, 0x428(%rbp)
14020d138:     	movw	$0x0, 0x42c(%rbp)
14020d141:     	movups	%xmm14, 0x368(%rbp)
14020d149:     	movups	%xmm15, 0x378(%rbp)
14020d151:     	movups	0x5bab800(%rip), %xmm0  # 0x145db8958
14020d158:     	movups	%xmm0, 0x388(%rbp)
14020d15f:     	movups	0x5bab801(%rip), %xmm15 # 0x145db8968
14020d167:     	movups	%xmm15, 0x398(%rbp)
14020d16f:     	movups	%xmm7, 0x3b8(%rbp)
14020d176:     	movups	%xmm6, 0x3a8(%rbp)
14020d17d:     	movups	%xmm8, 0x3d8(%rbp)
14020d185:     	movups	%xmm9, 0x3c8(%rbp)
14020d18d:     	movb	$0x0, 0x426(%rbp)
14020d194:     	movl	$0x0, 0x422(%rbp)
14020d19e:     	movq	$0x0, 0x408(%rbp)
14020d1a9:     	movl	$0x3f800000, 0x410(%rbp) # imm = 0x3F800000
14020d1b3:     	movaps	0x5b600a5(%rip), %xmm14 # 0x145d6d260
14020d1bb:     	movups	%xmm14, 0x3e8(%rbp)
14020d1c3:     	movl	$0x1, 0x3f8(%rbp)
14020d1cd:     	movq	$0x0, 0x3fc(%rbp)
14020d1d8:     	movb	$0x0, 0x427(%rbp)
14020d1df:     	movaps	%xmm10, 0x2b0(%rbp)
14020d1e7:     	movq	$0x0, 0x2c0(%rbp)
14020d1f2:     	movups	%xmm11, 0x2c8(%rbp)
14020d1fa:     	movq	$0x0, 0x2d8(%rbp)
14020d205:     	movaps	%xmm12, 0x2e0(%rbp)
14020d20d:     	movq	$0x0, 0x2f0(%rbp)
14020d218:     	movups	%xmm13, 0x2f8(%rbp)
14020d220:     	movq	$0x0, 0x308(%rbp)
14020d22b:     	movw	$0x0, 0x41a(%rbp)
14020d234:     	movl	$0x10000, 0x416(%rbp)   # imm = 0x10000
14020d23e:     	movw	$0x0, 0x420(%rbp)
14020d247:     	movl	$0x10000, 0x41c(%rbp)   # imm = 0x10000
14020d251:     	leaq	0x5bac4c8(%rip), %rcx   # 0x145db9720
14020d258:     	movl	$0x5d, %edx
14020d25d:     	callq	0x1458da4e0 <.text+0x58d94e0>
14020d262:     	nop
14020d263:     	movq	%rdx, %r12
14020d266:     	testq	%rdx, %rdx
14020d269:     	jns	0x14020d27e <.text+0x20c27e>
14020d26b:     	xorl	%ebx, %ebx
14020d26d:     	movq	%rbx, %rcx
14020d270:     	movq	%r12, %rdx
14020d273:     	callq	0x145d6944b <.text+0x5d6844b>
14020d278:     	nop
14020d279:     	jmp	0x14020d6eb <.text+0x20c6eb>
14020d27e:     	testq	%r12, %r12
14020d281:     	je	0x14020d2de <.text+0x20c2de>
14020d283:     	movq	%rax, %r15
14020d286:     	callq	0x140002200 <.text+0x1200>
14020d28b:     	movl	$0x1, %ebx
14020d290:     	movl	$0x1, %edx
14020d295:     	movq	%r12, %rcx
14020d298:     	callq	0x1400021c0 <.text+0x11c0>
14020d29d:     	testq	%rax, %rax
14020d2a0:     	je	0x14020d26d <.text+0x20c26d>
14020d2a2:     	movq	%rax, %r13
14020d2a5:     	movq	%rax, %rcx
14020d2a8:     	movq	%r15, %rdx
14020d2ab:     	movq	%r12, %r8
14020d2ae:     	callq	0x145bc977b <.text+0x5bc877b>
14020d2b3:     	cmpb	$0x1, (%rdi)
14020d2b6:     	jne	0x14020d2e9 <.text+0x20c2e9>
14020d2b8:     	movl	0x1(%rdi), %eax
14020d2bb:     	movl	0x4(%rdi), %ecx
14020d2be:     	movl	%ecx, 0x43b(%rbp)
14020d2c4:     	movl	%eax, 0x438(%rbp)
14020d2ca:     	movq	0x8(%rdi), %rbx
14020d2ce:     	movzbl	0x10(%rdi), %eax
14020d2d2:     	movq	%rax, 0x2a8(%rbp)
14020d2d9:     	movb	$0x1, %r15b
14020d2dc:     	jmp	0x14020d2fa <.text+0x20c2fa>
14020d2de:     	movl	$0x1, %r13d
14020d2e4:     	cmpb	$0x1, (%rdi)
14020d2e7:     	je	0x14020d2b8 <.text+0x20c2b8>
14020d2e9:     	movq	0x8(%rdi), %rbx
14020d2ed:     	lock
14020d2ee:     	incq	(%rbx)
14020d2f1:     	jle	0x14020d6eb <.text+0x20c6eb>
14020d2f7:     	xorl	%r15d, %r15d
14020d2fa:     	movups	0x5baba53(%rip), %xmm0  # 0x145db8d54
14020d301:     	movups	%xmm0, 0x284(%rbp)
14020d308:     	movl	$0x3f800000, 0x294(%rbp) # imm = 0x3F800000
14020d312:     	leaq	0x48(%rbp), %rcx
14020d316:     	leaq	0x2b0(%rbp), %rdx
14020d31d:     	movl	$0x180, %r8d            # imm = 0x180
14020d323:     	callq	0x145bc977b <.text+0x5bc877b>
14020d328:     	movq	%r12, 0x1c8(%rbp)
14020d32f:     	movq	%r13, 0x1d0(%rbp)
14020d336:     	movq	%r12, 0x1d8(%rbp)
14020d33d:     	movq	$0x0, 0x1e0(%rbp)
14020d348:     	movq	$0x4, 0x1e8(%rbp)
14020d353:     	movq	$0x0, 0x1f0(%rbp)
14020d35e:     	movb	%r15b, 0x1f8(%rbp)
14020d365:     	movl	0x438(%rbp), %eax
14020d36b:     	movl	0x43b(%rbp), %ecx
14020d371:     	movl	%eax, 0x1f9(%rbp)
14020d377:     	movl	%ecx, 0x1fc(%rbp)
14020d37d:     	movq	%rbx, 0x200(%rbp)
14020d384:     	movq	0x2a8(%rbp), %rax
14020d38b:     	movq	%rax, 0x208(%rbp)
14020d392:     	movl	$0x41700000, 0x210(%rbp) # imm = 0x41700000
14020d39c:     	movw	$0x190, 0x214(%rbp)     # imm = 0x190
14020d3a5:     	movb	$0x1, 0x216(%rbp)
14020d3ac:     	movups	0x283(%rbp), %xmm0
14020d3b3:     	movups	%xmm0, 0x217(%rbp)
14020d3ba:     	movq	0x290(%rbp), %rax
14020d3c1:     	movq	%rax, 0x224(%rbp)
14020d3c8:     	movl	0x5b60f1a(%rip), %eax   # 0x145d6e2e8
14020d3ce:     	movl	%eax, 0x23c(%rbp)
14020d3d4:     	movups	0x5b60efd(%rip), %xmm0  # 0x145d6e2d8
14020d3db:     	movups	%xmm0, 0x22c(%rbp)
14020d3e2:     	movsd	0x5b5fde6(%rip), %xmm0  # 0x145d6d1d0
14020d3ea:     	movsd	%xmm0, 0x240(%rbp)
14020d3f2:     	movw	$0x1, 0x248(%rbp)
14020d3fb:     	movq	%r14, 0x40(%rbp)
14020d3ff:     	leaq	0x2b0(%rbp), %rcx
14020d406:     	leaq	0x40(%rbp), %r8
14020d40a:     	leaq	0x18(%rbp), %rbx
14020d40e:     	movq	%rbx, %rdx
14020d411:     	callq	0x14018e670 <.text+0x18d670>
14020d416:     	xorps	%xmm0, %xmm0
14020d419:     	movaps	%xmm0, 0x350(%rbp)
14020d420:     	movaps	%xmm0, 0x340(%rbp)
14020d427:     	movaps	%xmm0, 0x330(%rbp)
14020d42e:     	movaps	%xmm0, 0x320(%rbp)
14020d435:     	movaps	%xmm0, 0x310(%rbp)
14020d43c:     	movq	$0x0, 0x360(%rbp)
14020d447:     	movw	$0x0, 0x1c4(%rbp)
14020d450:     	movl	$0x0, 0x1c0(%rbp)
14020d45a:     	movaps	%xmm10, 0x2b0(%rbp)
14020d462:     	movq	$0x0, 0x2c0(%rbp)
14020d46d:     	movups	%xmm11, 0x2c8(%rbp)
14020d475:     	movq	$0x0, 0x2d8(%rbp)
14020d480:     	movaps	%xmm12, 0x2e0(%rbp)
14020d488:     	movq	$0x0, 0x2f0(%rbp)
14020d493:     	movups	%xmm13, 0x2f8(%rbp)
14020d49b:     	movq	$0x0, 0x308(%rbp)
14020d4a6:     	leaq	0x48(%rbp), %rcx
14020d4aa:     	leaq	0x2b0(%rbp), %r12
14020d4b1:     	movl	$0xb8, %r8d
14020d4b7:     	movq	%r12, %rdx
14020d4ba:     	callq	0x145bc977b <.text+0x5bc877b>
14020d4bf:     	movaps	0x5b5fe4a(%rip), %xmm0  # 0x145d6d310
14020d4c6:     	movups	%xmm0, 0x100(%rbp)
14020d4cd:     	movaps	0x5b600dc(%rip), %xmm0  # 0x145d6d5b0
14020d4d4:     	movups	%xmm0, 0x110(%rbp)
14020d4db:     	movups	0x5bab476(%rip), %xmm0  # 0x145db8958
14020d4e2:     	movups	%xmm0, 0x120(%rbp)
14020d4e9:     	movups	%xmm15, 0x130(%rbp)
14020d4f1:     	movups	%xmm6, 0x140(%rbp)
14020d4f8:     	movups	%xmm7, 0x150(%rbp)
14020d4ff:     	movups	%xmm9, 0x160(%rbp)
14020d507:     	movups	%xmm8, 0x170(%rbp)
14020d50f:     	movups	%xmm14, 0x180(%rbp)
14020d517:     	movl	$0x1, 0x190(%rbp)
14020d521:     	movss	0x5b60127(%rip), %xmm0  # 0x145d6d650
14020d529:     	movlps	%xmm0, 0x194(%rbp)
14020d530:     	movb	$0x1, 0x19c(%rbp)
14020d537:     	movq	$0x0, 0x1a0(%rbp)
14020d542:     	movl	$0x3f800000, 0x1a8(%rbp) # imm = 0x3F800000
14020d54c:     	movw	$0x0, 0x1ac(%rbp)
14020d555:     	movw	$0x0, 0x1b2(%rbp)
14020d55e:     	movl	$0x10000, 0x1ae(%rbp)   # imm = 0x10000
14020d568:     	movl	$0x10000, 0x1b4(%rbp)   # imm = 0x10000
14020d572:     	movw	$0x0, 0x1b8(%rbp)
14020d57b:     	movl	$0x0, 0x1ba(%rbp)
14020d585:     	movw	$0x0, 0x1be(%rbp)
14020d58e:     	movq	%r14, 0x40(%rbp)
14020d592:     	leaq	0x250(%rbp), %rcx
14020d599:     	leaq	0x40(%rbp), %r8
14020d59d:     	movq	%rbx, %rdx
14020d5a0:     	callq	0x140189f40 <.text+0x188f40>
14020d5a5:     	movq	0x250(%rbp), %rax
14020d5ac:     	movq	0x278(%rbp), %rcx
14020d5b3:     	movq	%rax, 0x40(%rbp)
14020d5b7:     	movups	0x258(%rbp), %xmm0
14020d5be:     	movups	%xmm0, 0x48(%rbp)
14020d5c2:     	movups	0x268(%rbp), %xmm0
14020d5c9:     	movups	%xmm0, 0x58(%rbp)
14020d5cd:     	movq	%rcx, 0x68(%rbp)
14020d5d1:     	leaq	0x5babb3b(%rip), %rcx   # 0x145db9113
14020d5d8:     	movl	$0x7, %edx
14020d5dd:     	callq	0x1458da4e0 <.text+0x58d94e0>
14020d5e2:     	movq	%rax, %r15
14020d5e5:     	movq	%rdx, %r13
14020d5e8:     	movq	0x298(%rbp), %rcx
14020d5ef:     	movq	0x2a0(%rbp), %rdx
14020d5f6:     	callq	0x1458c8350 <.text+0x58c7350>
14020d5fb:     	movb	$0x9, 0x2b0(%rbp)
14020d602:     	movq	%r12, 0x28(%rsp)
14020d607:     	movb	%al, 0x20(%rsp)
14020d60b:     	leaq	0x40(%rbp), %rbx
14020d60f:     	movq	%rbx, %rcx
14020d612:     	movq	%rdi, %rdx
14020d615:     	movq	%r15, %r8
14020d618:     	movq	%r13, %r9
14020d61b:     	callq	0x140126a20 <.text+0x125a20>
14020d620:     	leaq	0x5babaf3(%rip), %rcx   # 0x145db911a
14020d627:     	movl	$0x7, %edx
14020d62c:     	callq	0x1458da4e0 <.text+0x58d94e0>
14020d631:     	movq	%rdx, %r9
14020d634:     	movb	$0xa, 0x2b0(%rbp)
14020d63b:     	movq	%r12, 0x28(%rsp)
14020d640:     	movb	$0x1, 0x20(%rsp)
14020d645:     	movq	%rbx, %rcx
14020d648:     	movq	%rdi, %rdx
14020d64b:     	movq	%rax, %r8
14020d64e:     	callq	0x140126a20 <.text+0x125a20>
14020d653:     	leaq	0x5babac7(%rip), %rcx   # 0x145db9121
14020d65a:     	movl	$0xc, %edx
14020d65f:     	callq	0x1458da4e0 <.text+0x58d94e0>
14020d664:     	movq	%rdx, %r9
14020d667:     	movb	$0xb, 0x2b0(%rbp)
14020d66e:     	movq	%r12, 0x28(%rsp)
14020d673:     	movb	$0x1, 0x20(%rsp)
14020d678:     	movq	%rbx, %rcx
14020d67b:     	movq	%rdi, %rdx
14020d67e:     	movq	%rax, %r8
14020d681:     	callq	0x140126a20 <.text+0x125a20>
14020d686:     	movq	%rsi, %rax
14020d689:     	movaps	0x450(%rbp), %xmm6
14020d690:     	movaps	0x460(%rbp), %xmm7
14020d697:     	movaps	0x470(%rbp), %xmm8
14020d69f:     	movaps	0x480(%rbp), %xmm9
14020d6a7:     	movaps	0x490(%rbp), %xmm10
14020d6af:     	movaps	0x4a0(%rbp), %xmm11
14020d6b7:     	movaps	0x4b0(%rbp), %xmm12
14020d6bf:     	movaps	0x4c0(%rbp), %xmm13
14020d6c7:     	movaps	0x4d0(%rbp), %xmm14
14020d6cf:     	movaps	0x4e0(%rbp), %xmm15
14020d6d7:     	addq	$0x578, %rsp            # imm = 0x578
14020d6de:     	popq	%rbx
14020d6df:     	popq	%rdi
14020d6e0:     	popq	%rsi
14020d6e1:     	popq	%r12
14020d6e3:     	popq	%r13
14020d6e5:     	popq	%r14
14020d6e7:     	popq	%r15
14020d6e9:     	popq	%rbp
14020d6ea:     	retq
14020d6eb:     	ud2

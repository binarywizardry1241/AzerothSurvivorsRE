
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140109b00:     	pushq	%rbp
140109b01:     	pushq	%r15
140109b03:     	pushq	%r14
140109b05:     	pushq	%r13
140109b07:     	pushq	%r12
140109b09:     	pushq	%rsi
140109b0a:     	pushq	%rdi
140109b0b:     	pushq	%rbx
140109b0c:     	subq	$0x9a8, %rsp            # imm = 0x9A8
140109b13:     	leaq	0x80(%rsp), %rbp
140109b1b:     	movaps	%xmm15, 0x910(%rbp)
140109b23:     	movaps	%xmm14, 0x900(%rbp)
140109b2b:     	movaps	%xmm13, 0x8f0(%rbp)
140109b33:     	movaps	%xmm12, 0x8e0(%rbp)
140109b3b:     	movaps	%xmm11, 0x8d0(%rbp)
140109b43:     	movaps	%xmm10, 0x8c0(%rbp)
140109b4b:     	movaps	%xmm9, 0x8b0(%rbp)
140109b53:     	movaps	%xmm8, 0x8a0(%rbp)
140109b5b:     	movaps	%xmm7, 0x890(%rbp)
140109b62:     	movaps	%xmm6, 0x880(%rbp)
140109b69:     	movq	$-0x2, 0x878(%rbp)
140109b74:     	movq	%rdx, %rbx
140109b77:     	movq	%rcx, %rsi
140109b7a:     	movq	(%rcx), %r12
140109b7d:     	movq	0x28(%rcx), %rax
140109b81:     	movq	%r12, 0x60(%rbp)
140109b85:     	leaq	0x68(%rbp), %r14
140109b89:     	movups	0x8(%rcx), %xmm0
140109b8d:     	movups	%xmm0, 0x68(%rbp)
140109b91:     	movups	0x18(%rcx), %xmm0
140109b95:     	movups	%xmm0, 0x78(%rbp)
140109b99:     	movq	%rax, 0x88(%rbp)
140109ba0:     	movups	0x5836b68(%rip), %xmm9  # 0x145940710
140109ba8:     	movaps	%xmm9, (%rbp)
140109bad:     	movq	$0x0, 0x10(%rbp)
140109bb5:     	movups	0x5836b6b(%rip), %xmm11 # 0x145940728
140109bbd:     	movups	%xmm11, 0x18(%rbp)
140109bc2:     	movq	$0x0, 0x28(%rbp)
140109bca:     	movups	0x5836b6e(%rip), %xmm10 # 0x145940740
140109bd2:     	movaps	%xmm10, 0x30(%rbp)
140109bd7:     	movq	$0x0, 0x40(%rbp)
140109bdf:     	movups	0x5836b71(%rip), %xmm12 # 0x145940758
140109be7:     	movups	%xmm12, 0x48(%rbp)
140109bec:     	movq	$0x0, 0x58(%rbp)
140109bf4:     	xorps	%xmm0, %xmm0
140109bf7:     	movups	%xmm0, 0x660(%rbp)
140109bfe:     	movups	%xmm0, 0x650(%rbp)
140109c05:     	movl	$0x0, 0x72c(%rbp)
140109c0f:     	movw	$0x0, 0x730(%rbp)
140109c18:     	movups	%xmm0, 0x788(%rbp)
140109c1f:     	movaps	(%rbp), %xmm0
140109c23:     	movq	0x10(%rbp), %rax
140109c27:     	movq	0x18(%rbp), %rcx
140109c2b:     	movq	0x20(%rbp), %rdx
140109c2f:     	movq	0x28(%rbp), %r8
140109c33:     	movdqa	0x30(%rbp), %xmm1
140109c38:     	movups	%xmm0, 0x5b8(%rbp)
140109c3f:     	movq	%rax, 0x5c8(%rbp)
140109c46:     	movq	%rcx, 0x5d0(%rbp)
140109c4d:     	movq	%rdx, 0x5d8(%rbp)
140109c54:     	movq	%r8, 0x5e0(%rbp)
140109c5b:     	movdqu	%xmm1, 0x5e8(%rbp)
140109c63:     	movaps	0x40(%rbp), %xmm0
140109c67:     	movups	%xmm0, 0x5f8(%rbp)
140109c6e:     	movaps	0x50(%rbp), %xmm0
140109c72:     	movups	%xmm0, 0x608(%rbp)
140109c79:     	movaps	0x580eda0(%rip), %xmm0  # 0x145918a20
140109c80:     	movups	%xmm0, 0x618(%rbp)
140109c87:     	movaps	0x5835e12(%rip), %xmm0  # 0x14593faa0
140109c8e:     	movups	%xmm0, 0x628(%rbp)
140109c95:     	movaps	0x5835e14(%rip), %xmm0  # 0x14593fab0
140109c9c:     	movups	%xmm0, 0x638(%rbp)
140109ca3:     	movabsq	$0x41d0000000000001, %rax # imm = 0x41D0000000000001
140109cad:     	movq	%rax, 0x648(%rbp)
140109cb4:     	movdqu	0x5836b1b(%rip), %xmm13 # 0x1459407d8
140109cbd:     	movdqu	%xmm13, 0x680(%rbp)
140109cc6:     	movups	0x5836afa(%rip), %xmm14 # 0x1459407c8
140109cce:     	movups	%xmm14, 0x670(%rbp)
140109cd6:     	movups	0x5836b1a(%rip), %xmm15 # 0x1459407f8
140109cde:     	movups	%xmm15, 0x6a0(%rbp)
140109ce6:     	movdqu	0x5836af9(%rip), %xmm8  # 0x1459407e8
140109cef:     	movdqu	%xmm8, 0x690(%rbp)
140109cf8:     	movdqa	0x57fd5f0(%rip), %xmm7  # 0x1459072f0
140109d00:     	movdqu	%xmm7, 0x6b0(%rbp)
140109d08:     	movdqu	%xmm7, 0x6c0(%rbp)
140109d10:     	movaps	0x5835d49(%rip), %xmm0  # 0x14593fa60
140109d17:     	movups	%xmm0, 0x6d0(%rbp)
140109d1e:     	movups	%xmm0, 0x6e0(%rbp)
140109d25:     	movdqa	0x57fd793(%rip), %xmm6  # 0x1459074c0
140109d2d:     	movdqu	%xmm6, 0x6f0(%rbp)
140109d35:     	movl	$0x1, 0x700(%rbp)
140109d3f:     	movq	$0x0, 0x704(%rbp)
140109d4a:     	movb	$0x1, 0x70c(%rbp)
140109d51:     	movq	$0x0, 0x710(%rbp)
140109d5c:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
140109d66:     	movw	$0x0, 0x71c(%rbp)
140109d6f:     	movw	$0x0, 0x722(%rbp)
140109d78:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
140109d82:     	movw	$0x0, 0x728(%rbp)
140109d8b:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
140109d95:     	movw	$0x100, 0x72a(%rbp)     # imm = 0x100
140109d9e:     	movl	$0x5000005, 0x732(%rbp) # imm = 0x5000005
140109da8:     	movl	$0x0, 0x738(%rbp)
140109db2:     	movdqa	0x5835d06(%rip), %xmm0  # 0x14593fac0
140109dba:     	movdqu	%xmm0, 0x73c(%rbp)
140109dc2:     	movl	$0x0, 0x74c(%rbp)
140109dcc:     	movdqu	%xmm0, 0x750(%rbp)
140109dd4:     	movl	$0x0, 0x760(%rbp)
140109dde:     	movdqu	%xmm0, 0x764(%rbp)
140109de6:     	movl	$0x0, 0x774(%rbp)
140109df0:     	movdqu	%xmm0, 0x778(%rbp)
140109df8:     	movl	$0x3f19999a, 0x798(%rbp) # imm = 0x3F19999A
140109e02:     	movq	%r12, 0x5b0(%rbp)
140109e09:     	leaq	0x90(%rbp), %rcx
140109e10:     	leaq	0x5b0(%rbp), %r8
140109e17:     	movq	%r14, %rdx
140109e1a:     	callq	0x1400d7a80 <.text+0xd6a80>
140109e1f:     	movq	(%rbx), %rdi
140109e22:     	movq	0x8(%rbx), %rax
140109e26:     	movq	(%rax), %rcx
140109e29:     	incq	%rcx
140109e2c:     	leaq	0x5b0(%rbp), %rdx
140109e33:     	movl	$0x14, %r8d
140109e39:     	callq	0x14572f900 <.text+0x572e900>
140109e3e:     	movq	%rdx, %r15
140109e41:     	testq	%rdx, %rdx
140109e44:     	jns	0x140109e56 <.text+0x108e56>
140109e46:     	xorl	%r14d, %r14d
140109e49:     	movq	%r14, %rcx
140109e4c:     	movq	%r15, %rdx
140109e4f:     	callq	0x14590379b <.text+0x590279b>
140109e54:     	ud2
140109e56:     	movq	%r12, 0x5a8(%rbp)
140109e5d:     	je	0x140109eb7 <.text+0x108eb7>
140109e5f:     	movq	%rax, %r13
140109e62:     	callq	0x140002200 <.text+0x1200>
140109e67:     	movl	$0x1, %r14d
140109e6d:     	movl	$0x1, %edx
140109e72:     	movq	%r15, %rcx
140109e75:     	callq	0x1400021c0 <.text+0x11c0>
140109e7a:     	testq	%rax, %rax
140109e7d:     	je	0x140109e49 <.text+0x108e49>
140109e7f:     	movq	%rax, %r12
140109e82:     	movq	%rax, %rcx
140109e85:     	movq	%r13, %rdx
140109e88:     	movq	%r15, %r8
140109e8b:     	callq	0x1457731ed <.text+0x57721ed>
140109e90:     	leaq	0x68(%rbp), %r14
140109e94:     	cmpb	$0x1, (%rdi)
140109e97:     	jne	0x140109ec2 <.text+0x108ec2>
140109e99:     	movl	0x1(%rdi), %eax
140109e9c:     	movl	0x4(%rdi), %ecx
140109e9f:     	movl	%ecx, 0x343(%rbp)
140109ea5:     	movl	%eax, 0x340(%rbp)
140109eab:     	movq	0x8(%rdi), %rax
140109eaf:     	movzbl	0x10(%rdi), %ecx
140109eb3:     	movb	$0x1, %dl
140109eb5:     	jmp	0x140109ed2 <.text+0x108ed2>
140109eb7:     	movl	$0x1, %r12d
140109ebd:     	cmpb	$0x1, (%rdi)
140109ec0:     	je	0x140109e99 <.text+0x108e99>
140109ec2:     	movq	0x8(%rdi), %rax
140109ec6:     	lock
140109ec7:     	incq	(%rax)
140109eca:     	jle	0x14010c243 <.text+0x10b243>
140109ed0:     	xorl	%edx, %edx
140109ed2:     	movq	%rsi, 0x578(%rbp)
140109ed9:     	movq	%r15, 0x5b0(%rbp)
140109ee0:     	movq	%r12, 0x5b8(%rbp)
140109ee7:     	movq	%r15, 0x5c0(%rbp)
140109eee:     	movq	$0x0, 0x5c8(%rbp)
140109ef9:     	movq	$0x4, 0x5d0(%rbp)
140109f04:     	movq	$0x0, 0x5d8(%rbp)
140109f0f:     	movb	%dl, 0x5e0(%rbp)
140109f15:     	movl	0x340(%rbp), %edx
140109f1b:     	movl	0x343(%rbp), %r8d
140109f22:     	movl	%edx, 0x5e1(%rbp)
140109f28:     	movl	%r8d, 0x5e4(%rbp)
140109f2f:     	movq	%rax, 0x5e8(%rbp)
140109f36:     	movq	%rcx, 0x5f0(%rbp)
140109f3d:     	movl	$0x41500000, 0x5f8(%rbp) # imm = 0x41500000
140109f47:     	movw	$0x190, 0x5fc(%rbp)     # imm = 0x190
140109f50:     	movb	$0x1, 0x5fe(%rbp)
140109f57:     	movups	0x583676e(%rip), %xmm0  # 0x1459406cc
140109f5e:     	movups	%xmm0, 0x600(%rbp)
140109f65:     	movl	$0x3f800000, 0x610(%rbp) # imm = 0x3F800000
140109f6f:     	movl	0x580f20b(%rip), %eax   # 0x145919180
140109f75:     	movl	%eax, 0x624(%rbp)
140109f7b:     	movups	0x580f1ee(%rip), %xmm0  # 0x145919170
140109f82:     	movups	%xmm0, 0x614(%rbp)
140109f89:     	movq	0x580b83f(%rip), %xmm0  # 0x1459157d0
140109f91:     	movq	%xmm0, 0x628(%rbp)
140109f99:     	leaq	0x90(%rbp), %rcx
140109fa0:     	leaq	0x5b0(%rbp), %rdx
140109fa7:     	callq	0x1400f1980 <.text+0xf0980>
140109fac:     	movq	0x10(%rbx), %r15
140109fb0:     	cmpq	$0x0, 0x10(%r15)
140109fb5:     	movq	0x5a8(%rbp), %r12
140109fbc:     	je	0x14010a400 <.text+0x109400>
140109fc2:     	movaps	%xmm9, 0x90(%rbp)
140109fca:     	movq	$0x0, 0xa0(%rbp)
140109fd5:     	movups	%xmm11, 0xa8(%rbp)
140109fdd:     	movq	$0x0, 0xb8(%rbp)
140109fe8:     	movaps	%xmm10, 0xc0(%rbp)
140109ff0:     	movq	$0x0, 0xd0(%rbp)
140109ffb:     	movups	%xmm12, 0xd8(%rbp)
14010a003:     	movq	$0x0, 0xe8(%rbp)
14010a00e:     	movq	0x18(%rbx), %rax
14010a012:     	movzbl	(%rax), %esi
14010a015:     	xorl	%eax, %eax
14010a017:     	testb	%sil, %sil
14010a01a:     	jne	0x14010a028 <.text+0x109028>
14010a01c:     	movq	0x58(%rbx), %rcx
14010a020:     	pxor	%xmm0, %xmm0
14010a024:     	je	0x14010a035 <.text+0x109035>
14010a026:     	jmp	0x14010a03d <.text+0x10903d>
14010a028:     	leaq	0x5836e91(%rip), %rcx   # 0x145940ec0
14010a02f:     	pxor	%xmm0, %xmm0
14010a033:     	jne	0x14010a03d <.text+0x10903d>
14010a035:     	movd	0x57fd45b(%rip), %xmm0  # 0x145907498
14010a03d:     	movups	(%rcx), %xmm1
14010a040:     	movaps	%xmm1, -0x30(%rbp)
14010a044:     	je	0x14010a053 <.text+0x109053>
14010a046:     	movq	0x58(%rbx), %rcx
14010a04a:     	movl	(%rcx), %eax
14010a04c:     	movdqu	0x4(%rcx), %xmm1
14010a051:     	jmp	0x14010a05b <.text+0x10905b>
14010a053:     	movdqa	0x580e6e5(%rip), %xmm1  # 0x145918740
14010a05b:     	movaps	0xe0(%rbp), %xmm2
14010a062:     	movups	%xmm2, 0x608(%rbp)
14010a069:     	movaps	0xd0(%rbp), %xmm2
14010a070:     	movups	%xmm2, 0x5f8(%rbp)
14010a077:     	movaps	0x90(%rbp), %xmm2
14010a07e:     	movaps	0xa0(%rbp), %xmm3
14010a085:     	movdqa	0xb0(%rbp), %xmm4
14010a08d:     	movdqa	0xc0(%rbp), %xmm5
14010a095:     	movdqu	%xmm5, 0x5e8(%rbp)
14010a09d:     	movdqu	%xmm4, 0x5d8(%rbp)
14010a0a5:     	movups	%xmm3, 0x5c8(%rbp)
14010a0ac:     	movups	%xmm2, 0x5b8(%rbp)
14010a0b3:     	xorps	%xmm2, %xmm2
14010a0b6:     	movups	%xmm2, 0x638(%rbp)
14010a0bd:     	movups	%xmm2, 0x648(%rbp)
14010a0c4:     	movups	%xmm2, 0x658(%rbp)
14010a0cb:     	movq	$0x0, 0x668(%rbp)
14010a0d6:     	movl	$0x0, 0x730(%rbp)
14010a0e0:     	movw	$0x0, 0x734(%rbp)
14010a0e9:     	movdqa	-0x30(%rbp), %xmm3
14010a0ee:     	movdqu	%xmm3, 0x738(%rbp)
14010a0f6:     	movdqu	%xmm3, 0x74c(%rbp)
14010a0fe:     	movdqu	%xmm3, 0x760(%rbp)
14010a106:     	movdqu	%xmm3, 0x774(%rbp)
14010a10e:     	movups	%xmm2, 0x618(%rbp)
14010a115:     	movaps	0x58359b4(%rip), %xmm2  # 0x14593fad0
14010a11c:     	movups	%xmm2, 0x628(%rbp)
14010a123:     	movups	%xmm14, 0x670(%rbp)
14010a12b:     	movdqu	%xmm13, 0x680(%rbp)
14010a134:     	movaps	0x580e745(%rip), %xmm2  # 0x145918880
14010a13b:     	movups	%xmm2, 0x690(%rbp)
14010a142:     	movaps	0x58356a7(%rip), %xmm2  # 0x14593f7f0
14010a149:     	movups	%xmm2, 0x6a0(%rbp)
14010a150:     	movdqu	%xmm7, 0x6b0(%rbp)
14010a158:     	movdqu	%xmm7, 0x6c0(%rbp)
14010a160:     	movdqa	0x5835728(%rip), %xmm2  # 0x14593f890
14010a168:     	movdqu	%xmm2, 0x6d0(%rbp)
14010a170:     	movdqu	%xmm2, 0x6e0(%rbp)
14010a178:     	movdqu	%xmm6, 0x6f0(%rbp)
14010a180:     	movl	$0x1, 0x700(%rbp)
14010a18a:     	movq	$0x0, 0x704(%rbp)
14010a195:     	movb	$0x1, 0x70c(%rbp)
14010a19c:     	movq	$0x0, 0x710(%rbp)
14010a1a7:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
14010a1b1:     	movw	$0x0, 0x71c(%rbp)
14010a1ba:     	movw	$0x0, 0x722(%rbp)
14010a1c3:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
14010a1cd:     	movw	$0x0, 0x728(%rbp)
14010a1d6:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
14010a1e0:     	movw	$0x100, 0x72a(%rbp)     # imm = 0x100
14010a1e9:     	movl	$0x0, 0x72c(%rbp)
14010a1f3:     	movd	%xmm0, 0x748(%rbp)
14010a1fb:     	movd	%xmm0, 0x75c(%rbp)
14010a203:     	movd	%xmm0, 0x770(%rbp)
14010a20b:     	movd	%xmm0, 0x784(%rbp)
14010a213:     	movl	%eax, 0x788(%rbp)
14010a219:     	movdqu	%xmm1, 0x78c(%rbp)
14010a221:     	movq	%r12, 0x5b0(%rbp)
14010a228:     	leaq	0x340(%rbp), %rcx
14010a22f:     	leaq	0x5b0(%rbp), %r8
14010a236:     	movq	%r14, %rdx
14010a239:     	callq	0x1400d7a80 <.text+0xd6a80>
14010a23e:     	leaq	0x520(%rbp), %rcx
14010a245:     	movq	%r15, %rdx
14010a248:     	callq	0x145728850 <.text+0x5727850>
14010a24d:     	cmpb	$0x1, (%rdi)
14010a250:     	jne	0x14010a270 <.text+0x109270>
14010a252:     	movl	0x1(%rdi), %eax
14010a255:     	movl	0x4(%rdi), %ecx
14010a258:     	movl	%ecx, 0x5b3(%rbp)
14010a25e:     	movl	%eax, 0x5b0(%rbp)
14010a264:     	leaq	0x8(%rdi), %rdx
14010a268:     	movzbl	0x10(%rdi), %eax
14010a26c:     	movb	$0x1, %cl
14010a26e:     	jmp	0x14010a284 <.text+0x109284>
14010a270:     	movq	0x8(%rdi), %rax
14010a274:     	lock
14010a275:     	incq	(%rax)
14010a278:     	jle	0x14010c243 <.text+0x10b243>
14010a27e:     	leaq	0x8(%rdi), %rdx
14010a282:     	xorl	%ecx, %ecx
14010a284:     	movq	(%rdx), %rdx
14010a287:     	movb	$0x1, 0xa8(%rbp)
14010a28e:     	movups	0x5836757(%rip), %xmm0  # 0x1459409ec
14010a295:     	movups	%xmm0, 0xa9(%rbp)
14010a29c:     	movl	$0x41a00000, 0xc0(%rbp) # imm = 0x41A00000
14010a2a6:     	movw	$0x190, 0xc4(%rbp)      # imm = 0x190
14010a2af:     	movb	$0x1, 0xc6(%rbp)
14010a2b6:     	movq	$0x0, 0x90(%rbp)
14010a2c1:     	movq	$0x4, 0x98(%rbp)
14010a2cc:     	movq	$0x0, 0xa0(%rbp)
14010a2d7:     	movl	0x5b0(%rbp), %r8d
14010a2de:     	movl	0x5b3(%rbp), %r9d
14010a2e5:     	movl	%r8d, 0x4f0(%rbp)
14010a2ec:     	movl	%r9d, 0x4f3(%rbp)
14010a2f3:     	testb	%sil, %sil
14010a2f6:     	je	0x14010a312 <.text+0x109312>
14010a2f8:     	movups	0x58366d9(%rip), %xmm0  # 0x1459409d8
14010a2ff:     	movaps	%xmm0, 0x840(%rbp)
14010a306:     	movl	$0x3f800000, 0x850(%rbp) # imm = 0x3F800000
14010a310:     	jmp	0x14010a32c <.text+0x10932c>
14010a312:     	movq	0x58(%rbx), %r8
14010a316:     	movl	0x10(%r8), %r9d
14010a31a:     	movl	%r9d, 0x850(%rbp)
14010a321:     	movups	(%r8), %xmm0
14010a325:     	movaps	%xmm0, 0x840(%rbp)
14010a32c:     	movl	0x850(%rbp), %r8d
14010a333:     	movl	%r8d, 0x610(%rbp)
14010a33a:     	movaps	0x840(%rbp), %xmm0
14010a341:     	movaps	%xmm0, 0x600(%rbp)
14010a348:     	movups	0x520(%rbp), %xmm0
14010a34f:     	movaps	%xmm0, 0x5b0(%rbp)
14010a356:     	movq	0x530(%rbp), %r8
14010a35d:     	movq	%r8, 0x5c0(%rbp)
14010a364:     	movdqu	0x90(%rbp), %xmm0
14010a36c:     	movdqu	%xmm0, 0x5c8(%rbp)
14010a374:     	movq	0xa0(%rbp), %r8
14010a37b:     	movq	%r8, 0x5d8(%rbp)
14010a382:     	movb	%cl, 0x5e0(%rbp)
14010a388:     	movl	0x4f0(%rbp), %ecx
14010a38e:     	movl	0x4f3(%rbp), %r8d
14010a395:     	movl	%ecx, 0x5e1(%rbp)
14010a39b:     	movl	%r8d, 0x5e4(%rbp)
14010a3a2:     	movq	%rdx, 0x5e8(%rbp)
14010a3a9:     	movq	%rax, 0x5f0(%rbp)
14010a3b0:     	movl	$0x41300000, 0x5f8(%rbp) # imm = 0x41300000
14010a3ba:     	movw	$0x190, 0x5fc(%rbp)     # imm = 0x190
14010a3c3:     	movb	$0x1, 0x5fe(%rbp)
14010a3ca:     	leaq	0x340(%rbp), %rcx
14010a3d1:     	leaq	0x5b0(%rbp), %rdx
14010a3d8:     	callq	0x1400f16c0 <.text+0xf06c0>
14010a3dd:     	nop
14010a3de:     	cmpb	$0x0, 0xa8(%rbp)
14010a3e5:     	jne	0x14010a400 <.text+0x109400>
14010a3e7:     	movq	0xb0(%rbp), %rax
14010a3ee:     	lock
14010a3ef:     	decq	(%rax)
14010a3f2:     	jne	0x14010a400 <.text+0x109400>
14010a3f4:     	leaq	0xb0(%rbp), %rcx
14010a3fb:     	callq	0x1449aac80 <.text+0x49a9c80>
14010a400:     	pxor	%xmm13, %xmm13
14010a405:     	movdqu	%xmm13, 0x630(%rbp)
14010a40e:     	movdqu	%xmm13, 0x620(%rbp)
14010a417:     	movdqu	%xmm13, 0x650(%rbp)
14010a420:     	movdqu	%xmm13, 0x660(%rbp)
14010a429:     	movaps	%xmm9, 0x90(%rbp)
14010a431:     	movq	$0x0, 0xa0(%rbp)
14010a43c:     	movups	%xmm11, 0xa8(%rbp)
14010a444:     	movq	$0x0, 0xb8(%rbp)
14010a44f:     	movaps	%xmm10, 0xc0(%rbp)
14010a457:     	movq	$0x0, 0xd0(%rbp)
14010a462:     	movups	%xmm12, 0xd8(%rbp)
14010a46a:     	movq	$0x0, 0xe8(%rbp)
14010a475:     	movq	0xe0(%rbp), %rax
14010a47c:     	movq	%rax, 0x608(%rbp)
14010a483:     	movq	0xe8(%rbp), %rax
14010a48a:     	movq	%rax, 0x610(%rbp)
14010a491:     	movq	0xd0(%rbp), %rax
14010a498:     	movq	%rax, 0x5f8(%rbp)
14010a49f:     	movq	0xd8(%rbp), %rax
14010a4a6:     	movq	%rax, 0x600(%rbp)
14010a4ad:     	movups	%xmm10, 0x5e8(%rbp)
14010a4b5:     	movq	0xb0(%rbp), %rax
14010a4bc:     	movq	%rax, 0x5d8(%rbp)
14010a4c3:     	movq	0xb8(%rbp), %rax
14010a4ca:     	movq	%rax, 0x5e0(%rbp)
14010a4d1:     	movaps	0xa0(%rbp), %xmm0
14010a4d8:     	movups	%xmm0, 0x5c8(%rbp)
14010a4df:     	movups	%xmm9, 0x5b8(%rbp)
14010a4e7:     	movq	$0x0, 0x618(%rbp)
14010a4f2:     	movaps	0x58355e7(%rip), %xmm0  # 0x14593fae0
14010a4f9:     	movups	%xmm0, 0x640(%rbp)
14010a500:     	movaps	0x580b3f9(%rip), %xmm0  # 0x145915900
14010a507:     	movups	%xmm0, 0x670(%rbp)
14010a50e:     	movaps	0x58355db(%rip), %xmm0  # 0x14593faf0
14010a515:     	movups	%xmm0, 0x680(%rbp)
14010a51c:     	movups	%xmm15, 0x6a0(%rbp)
14010a524:     	movdqu	%xmm8, 0x690(%rbp)
14010a52d:     	movups	0x58362e4(%rip), %xmm7  # 0x145940818
14010a534:     	movups	%xmm7, 0x6c0(%rbp)
14010a53b:     	movups	0x58362c5(%rip), %xmm12 # 0x145940808
14010a543:     	movups	%xmm12, 0x6b0(%rbp)
14010a54b:     	movdqu	0x58362e4(%rip), %xmm11 # 0x145940838
14010a554:     	movdqu	%xmm11, 0x6e0(%rbp)
14010a55d:     	movaps	%xmm15, %xmm6
14010a561:     	movups	0x58362bf(%rip), %xmm15 # 0x145940828
14010a569:     	movups	%xmm15, 0x6d0(%rbp)
14010a571:     	movaps	0x57fcf48(%rip), %xmm0  # 0x1459074c0
14010a578:     	movups	%xmm0, 0x6f0(%rbp)
14010a57f:     	movl	$0x1, 0x700(%rbp)
14010a589:     	movq	$0x0, 0x704(%rbp)
14010a594:     	movb	$0x1, 0x70c(%rbp)
14010a59b:     	movq	$0x0, 0x710(%rbp)
14010a5a6:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
14010a5b0:     	movw	$0x0, 0x71c(%rbp)
14010a5b9:     	movw	$0x0, 0x722(%rbp)
14010a5c2:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
14010a5cc:     	movw	$0x0, 0x728(%rbp)
14010a5d5:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
14010a5df:     	movq	$0x0, 0x72a(%rbp)
14010a5ea:     	movl	$0x5000005, 0x732(%rbp) # imm = 0x5000005
14010a5f4:     	movq	%r12, 0x5b0(%rbp)
14010a5fb:     	leaq	0x4f0(%rbp), %rcx
14010a602:     	leaq	0x5b0(%rbp), %r8
14010a609:     	movq	%r14, %rdx
14010a60c:     	callq	0x1400d7270 <.text+0xd6270>
14010a611:     	movq	0x48(%rbx), %rsi
14010a615:     	movq	0x58(%rbx), %r14
14010a619:     	movq	0x60(%rbx), %rax
14010a61d:     	movq	%rax, 0x4c0(%rbp)
14010a624:     	movq	0x4f0(%rbp), %r15
14010a62b:     	movq	0x518(%rbp), %rax
14010a632:     	movq	%r15, 0x840(%rbp)
14010a639:     	movups	0x4f8(%rbp), %xmm0
14010a640:     	movups	%xmm0, 0x848(%rbp)
14010a647:     	movups	0x508(%rbp), %xmm0
14010a64e:     	movups	%xmm0, 0x858(%rbp)
14010a655:     	movq	%rax, 0x868(%rbp)
14010a65c:     	movw	$0x0, 0x1f4(%rbp)
14010a665:     	movb	$0x1, 0x1e4(%rbp)
14010a66c:     	movdqu	%xmm13, 0xf8(%rbp)
14010a675:     	movdqu	%xmm13, 0x108(%rbp)
14010a67e:     	movaps	0x583547b(%rip), %xmm0  # 0x14593fb00
14010a685:     	movups	%xmm0, 0x118(%rbp)
14010a68c:     	movq	$0x0, 0xf0(%rbp)
14010a697:     	movdqu	%xmm13, 0x128(%rbp)
14010a6a0:     	movdqu	%xmm13, 0x138(%rbp)
14010a6a9:     	movl	$0x0, 0x208(%rbp)
14010a6b3:     	movw	$0x0, 0x20c(%rbp)
14010a6bc:     	movups	%xmm14, 0x148(%rbp)
14010a6c4:     	movdqu	0x583610c(%rip), %xmm0  # 0x1459407d8
14010a6cc:     	movdqu	%xmm0, 0x158(%rbp)
14010a6d4:     	movdqu	%xmm8, 0x168(%rbp)
14010a6dd:     	movups	%xmm6, 0x178(%rbp)
14010a6e4:     	movdqa	0x57fcdd4(%rip), %xmm6  # 0x1459074c0
14010a6ec:     	movups	%xmm7, 0x198(%rbp)
14010a6f3:     	movdqa	%xmm11, %xmm7
14010a6f8:     	movups	0x5836028(%rip), %xmm11 # 0x145940728
14010a700:     	movups	%xmm12, 0x188(%rbp)
14010a708:     	movups	0x5836048(%rip), %xmm12 # 0x145940758
14010a710:     	movdqu	%xmm7, 0x1b8(%rbp)
14010a718:     	movups	%xmm15, 0x1a8(%rbp)
14010a720:     	movb	$0x0, 0x206(%rbp)
14010a727:     	movl	$0x100, 0x202(%rbp)     # imm = 0x100
14010a731:     	movq	$0x0, 0x1e8(%rbp)
14010a73c:     	movl	$0x3f800000, 0x1f0(%rbp) # imm = 0x3F800000
14010a746:     	movdqu	%xmm6, 0x1c8(%rbp)
14010a74e:     	movl	$0x1, 0x1d8(%rbp)
14010a758:     	movq	$0x0, 0x1dc(%rbp)
14010a763:     	movb	$0x0, 0x207(%rbp)
14010a76a:     	movaps	%xmm9, 0x90(%rbp)
14010a772:     	movq	$0x0, 0xa0(%rbp)
14010a77d:     	movups	%xmm11, 0xa8(%rbp)
14010a785:     	movq	$0x0, 0xb8(%rbp)
14010a790:     	movaps	%xmm10, 0xc0(%rbp)
14010a798:     	movq	$0x0, 0xd0(%rbp)
14010a7a3:     	movups	%xmm12, 0xd8(%rbp)
14010a7ab:     	movq	$0x0, 0xe8(%rbp)
14010a7b6:     	movw	$0x0, 0x1fa(%rbp)
14010a7bf:     	movl	$0x10000, 0x1f6(%rbp)   # imm = 0x10000
14010a7c9:     	movw	$0x0, 0x200(%rbp)
14010a7d2:     	movl	$0x10000, 0x1fc(%rbp)   # imm = 0x10000
14010a7dc:     	callq	0x140002200 <.text+0x1200>
14010a7e1:     	movl	$0x40, %ecx
14010a7e6:     	movl	$0x4, %edx
14010a7eb:     	callq	0x1400021c0 <.text+0x11c0>
14010a7f0:     	testq	%rax, %rax
14010a7f3:     	je	0x14010c221 <.text+0x10b221>
14010a7f9:     	movq	%rax, 0x870(%rbp)
14010a800:     	movups	(%r14), %xmm0
14010a804:     	movaps	%xmm0, 0x580(%rbp)
14010a80b:     	movl	0x10(%r14), %eax
14010a80f:     	movl	%eax, 0x590(%rbp)
14010a815:     	movdqu	(%r14), %xmm0
14010a81a:     	movdqa	%xmm0, 0x5b0(%rbp)
14010a822:     	movl	$0x3ed70a3d, 0x5c0(%rbp) # imm = 0x3ED70A3D
14010a82c:     	leaq	0x340(%rbp), %rcx
14010a833:     	leaq	0x5b0(%rbp), %rdx
14010a83a:     	callq	0x144c8c290 <.text+0x4c8b290>
14010a83f:     	nop
14010a840:     	movdqa	0x340(%rbp), %xmm13
14010a849:     	movdqu	0x583666f(%rip), %xmm0  # 0x145940ec0
14010a851:     	movdqa	%xmm0, 0x5b0(%rbp)
14010a859:     	movl	$0x0, 0x5c0(%rbp)
14010a863:     	leaq	0x340(%rbp), %rcx
14010a86a:     	leaq	0x5b0(%rbp), %rdx
14010a871:     	callq	0x144c8c290 <.text+0x4c8b290>
14010a876:     	nop
14010a877:     	movdqa	0x340(%rbp), %xmm0
14010a87f:     	movq	0x870(%rbp), %r12
14010a886:     	movq	$0x2, (%r12)
14010a88e:     	movl	$0x1, 0x8(%r12)
14010a897:     	movdqu	%xmm13, 0xc(%r12)
14010a89e:     	movdqa	0x583526a(%rip), %xmm1  # 0x14593fb10
14010a8a6:     	movdqu	%xmm1, 0x1c(%r12)
14010a8ad:     	movdqu	%xmm0, 0x2c(%r12)
14010a8b4:     	movl	$0x3f000000, 0x3c(%r12) # imm = 0x3F000000
14010a8bd:     	callq	0x140002200 <.text+0x1200>
14010a8c2:     	movl	$0x48, %ecx
14010a8c7:     	movl	$0x8, %edx
14010a8cc:     	callq	0x1400021c0 <.text+0x11c0>
14010a8d1:     	testq	%rax, %rax
14010a8d4:     	movaps	0x580b024(%rip), %xmm14 # 0x145915900
14010a8dc:     	movups	0x5835f14(%rip), %xmm15 # 0x1459407f8
14010a8e4:     	movdqu	0x5835efb(%rip), %xmm8  # 0x1459407e8
14010a8ed:     	je	0x14010c233 <.text+0x10b233>
14010a8f3:     	movq	%rax, %r13
14010a8f6:     	leaq	0x848(%rbp), %rax
14010a8fd:     	movq	$0x2, (%r13)
14010a905:     	movq	%r12, 0x8(%r13)
14010a909:     	movq	%rax, %r12
14010a90c:     	movq	$0x2, 0x10(%r13)
14010a914:     	movups	0x58367d5(%rip), %xmm0  # 0x1459410f0
14010a91b:     	movups	%xmm0, 0x18(%r13)
14010a920:     	movq	$0x0, 0x28(%r13)
14010a928:     	movl	$0x7, 0x30(%r13)
14010a930:     	movb	$0x0, 0x40(%r13)
14010a935:     	leaq	0x5b8(%rbp), %rcx
14010a93c:     	leaq	0x90(%rbp), %rdx
14010a943:     	movl	$0x180, %r8d            # imm = 0x180
14010a949:     	callq	0x1457731ed <.text+0x57721ed>
14010a94e:     	movq	$0x1, 0x738(%rbp)
14010a959:     	movq	%r13, 0x740(%rbp)
14010a960:     	movq	$0x1, 0x748(%rbp)
14010a96b:     	movups	0x583619e(%rip), %xmm0  # 0x145940b10
14010a972:     	movups	%xmm0, 0x750(%rbp)
14010a979:     	movups	0x58361a0(%rip), %xmm0  # 0x145940b20
14010a980:     	movups	%xmm0, 0x760(%rbp)
14010a987:     	movq	%r15, 0x5b0(%rbp)
14010a98e:     	leaq	0x90(%rbp), %rcx
14010a995:     	leaq	0x5b0(%rbp), %r8
14010a99c:     	movq	%r12, %rdx
14010a99f:     	callq	0x1400dfcd0 <.text+0xdecd0>
14010a9a4:     	movw	$0x0, 0x714(%rbp)
14010a9ad:     	movb	$0x1, 0x704(%rbp)
14010a9b4:     	xorps	%xmm0, %xmm0
14010a9b7:     	movups	%xmm0, 0x618(%rbp)
14010a9be:     	movups	%xmm0, 0x628(%rbp)
14010a9c5:     	movaps	0x5835154(%rip), %xmm1  # 0x14593fb20
14010a9cc:     	movups	%xmm1, 0x638(%rbp)
14010a9d3:     	movq	$0x0, 0x610(%rbp)
14010a9de:     	movups	%xmm0, 0x648(%rbp)
14010a9e5:     	movups	%xmm0, 0x658(%rbp)
14010a9ec:     	movl	$0x0, 0x728(%rbp)
14010a9f6:     	movw	$0x0, 0x72c(%rbp)
14010a9ff:     	movups	0x5835dc2(%rip), %xmm0  # 0x1459407c8
14010aa06:     	movups	%xmm0, 0x668(%rbp)
14010aa0d:     	movups	0x5835dc4(%rip), %xmm0  # 0x1459407d8
14010aa14:     	movups	%xmm0, 0x678(%rbp)
14010aa1b:     	movdqu	%xmm8, 0x688(%rbp)
14010aa24:     	movups	%xmm15, 0x698(%rbp)
14010aa2c:     	movaps	0x5834dbd(%rip), %xmm0  # 0x14593f7f0
14010aa33:     	movups	%xmm0, 0x6a8(%rbp)
14010aa3a:     	movups	%xmm0, 0x6b8(%rbp)
14010aa41:     	movaps	0x57fc898(%rip), %xmm0  # 0x1459072e0
14010aa48:     	movups	%xmm0, 0x6c8(%rbp)
14010aa4f:     	movups	%xmm0, 0x6d8(%rbp)
14010aa56:     	movb	$0x0, 0x726(%rbp)
14010aa5d:     	movl	$0x0, 0x722(%rbp)
14010aa67:     	movq	$0x0, 0x708(%rbp)
14010aa72:     	movl	$0x3f800000, 0x710(%rbp) # imm = 0x3F800000
14010aa7c:     	movdqu	%xmm6, 0x6e8(%rbp)
14010aa84:     	movl	$0x1, 0x6f8(%rbp)
14010aa8e:     	movq	$0x0, 0x6fc(%rbp)
14010aa99:     	movb	$0x0, 0x727(%rbp)
14010aaa0:     	movaps	%xmm9, 0x5b0(%rbp)
14010aaa8:     	movq	$0x0, 0x5c0(%rbp)
14010aab3:     	movups	%xmm11, 0x5c8(%rbp)
14010aabb:     	movq	$0x0, 0x5d8(%rbp)
14010aac6:     	movaps	%xmm10, 0x5e0(%rbp)
14010aace:     	movq	$0x0, 0x5f0(%rbp)
14010aad9:     	movups	%xmm12, 0x5f8(%rbp)
14010aae1:     	movq	$0x0, 0x608(%rbp)
14010aaec:     	movw	$0x0, 0x71a(%rbp)
14010aaf5:     	movl	$0x10000, 0x716(%rbp)   # imm = 0x10000
14010aaff:     	movw	$0x0, 0x720(%rbp)
14010ab08:     	movl	$0x10000, 0x71c(%rbp)   # imm = 0x10000
14010ab12:     	movl	0x590(%rbp), %eax
14010ab18:     	movl	%eax, 0x530(%rbp)
14010ab1e:     	movaps	0x580(%rbp), %xmm0
14010ab25:     	movaps	%xmm0, 0x520(%rbp)
14010ab2c:     	movaps	0x580(%rbp), %xmm0
14010ab33:     	movups	%xmm0, 0x534(%rbp)
14010ab3a:     	movl	0x590(%rbp), %eax
14010ab40:     	movl	%eax, 0x544(%rbp)
14010ab46:     	movaps	0x580(%rbp), %xmm0
14010ab4d:     	movups	%xmm0, 0x548(%rbp)
14010ab54:     	movl	0x590(%rbp), %eax
14010ab5a:     	movl	%eax, 0x558(%rbp)
14010ab60:     	movaps	0x580(%rbp), %xmm0
14010ab67:     	movups	%xmm0, 0x55c(%rbp)
14010ab6e:     	movl	0x590(%rbp), %eax
14010ab74:     	movl	%eax, 0x56c(%rbp)
14010ab7a:     	movq	0x8(%rsi), %r8
14010ab7e:     	movq	0x10(%rsi), %r9
14010ab82:     	leaq	0x90(%rbp), %rcx
14010ab89:     	movq	0x4c0(%rbp), %rdx
14010ab90:     	callq	0x1400b6b20 <.text+0xb5b20>
14010ab95:     	nop
14010ab96:     	leaq	0x340(%rbp), %rcx
14010ab9d:     	leaq	0x90(%rbp), %rdx
14010aba4:     	callq	0x142702820 <.text+0x2701820>
14010aba9:     	nop
14010abaa:     	movaps	0x580(%rbp), %xmm0
14010abb1:     	movaps	%xmm0, -0x20(%rbp)
14010abb5:     	movl	$0x3f0ccccd, -0x10(%rbp) # imm = 0x3F0CCCCD
14010abbc:     	leaq	0x4d0(%rbp), %rcx
14010abc3:     	leaq	-0x20(%rbp), %rdx
14010abc7:     	callq	0x144c8c290 <.text+0x4c8b290>
14010abcc:     	nop
14010abcd:     	movq	0x580abfa(%rip), %xmm13 # 0x1459157d0
14010abd6:     	movaps	0x4d0(%rbp), %xmm0
14010abdd:     	movups	%xmm0, 0x94(%rbp)
14010abe4:     	movl	$0x1, 0x90(%rbp)
14010abee:     	movl	$0x41900000, 0x48(%rsp) # imm = 0x41900000
14010abf6:     	movl	$0x1, 0x40(%rsp)
14010abfe:     	movl	$0x3f800000, 0x38(%rsp) # imm = 0x3F800000
14010ac06:     	movl	$0x1, 0x30(%rsp)
14010ac0e:     	movl	$0x0, 0x28(%rsp)
14010ac16:     	movl	$0x1, 0x20(%rsp)
14010ac1e:     	leaq	0x4d0(%rbp), %rcx
14010ac25:     	leaq	0x90(%rbp), %rdx
14010ac2c:     	pxor	%xmm3, %xmm3
14010ac30:     	movl	$0x1, %r8d
14010ac36:     	callq	0x14265f6a0 <.text+0x265e6a0>
14010ac3b:     	nop
14010ac3c:     	leaq	0x90(%rbp), %r13
14010ac43:     	leaq	0x5b0(%rbp), %rdx
14010ac4a:     	movl	$0x180, %r8d            # imm = 0x180
14010ac50:     	movq	%r13, %rcx
14010ac53:     	callq	0x1457731ed <.text+0x57721ed>
14010ac58:     	movaps	0x520(%rbp), %xmm0
14010ac5f:     	movdqa	0x530(%rbp), %xmm1
14010ac67:     	movdqa	0x540(%rbp), %xmm2
14010ac6f:     	movdqa	0x550(%rbp), %xmm3
14010ac77:     	movups	%xmm0, 0x298(%rbp)
14010ac7e:     	movdqu	%xmm1, 0x2a8(%rbp)
14010ac86:     	movdqu	%xmm2, 0x2b8(%rbp)
14010ac8e:     	movdqu	%xmm3, 0x2c8(%rbp)
14010ac96:     	movaps	0x560(%rbp), %xmm0
14010ac9d:     	movups	%xmm0, 0x2d8(%rbp)
14010aca4:     	movups	0x5835d2d(%rip), %xmm0  # 0x1459409d8
14010acab:     	movups	%xmm0, 0x2e8(%rbp)
14010acb2:     	movl	$0x3f800000, 0x2f8(%rbp) # imm = 0x3F800000
14010acbc:     	leaq	0x210(%rbp), %rcx
14010acc3:     	leaq	0x340(%rbp), %rdx
14010acca:     	movl	$0x88, %r8d
14010acd0:     	callq	0x1457731ed <.text+0x57721ed>
14010acd5:     	movups	0x4d0(%rbp), %xmm0
14010acdc:     	movups	%xmm0, 0x300(%rbp)
14010ace3:     	movq	0x4e0(%rbp), %rax
14010acea:     	movq	%rax, 0x310(%rbp)
14010acf1:     	leaq	0x5b8(%rbp), %rcx
14010acf8:     	movl	$0x288, %r8d            # imm = 0x288
14010acfe:     	movq	%r13, %rdx
14010ad01:     	callq	0x1457731ed <.text+0x57721ed>
14010ad06:     	movq	%r15, 0x5b0(%rbp)
14010ad0d:     	leaq	0x340(%rbp), %rcx
14010ad14:     	leaq	0x5b0(%rbp), %r8
14010ad1b:     	movq	%r12, %rdx
14010ad1e:     	callq	0x1400d82b0 <.text+0xd72b0>
14010ad23:     	movw	$0x0, 0x4a4(%rbp)
14010ad2c:     	movb	$0x1, 0x494(%rbp)
14010ad33:     	xorps	%xmm0, %xmm0
14010ad36:     	movaps	%xmm0, 0x3a0(%rbp)
14010ad3d:     	movaps	%xmm0, 0x3b0(%rbp)
14010ad44:     	movaps	%xmm0, 0x3c0(%rbp)
14010ad4b:     	movaps	%xmm0, 0x3d0(%rbp)
14010ad52:     	movaps	%xmm0, 0x3e0(%rbp)
14010ad59:     	movq	$0x0, 0x3f0(%rbp)
14010ad64:     	movl	$0x0, 0x4b8(%rbp)
14010ad6e:     	movw	$0x0, 0x4bc(%rbp)
14010ad77:     	movups	%xmm14, 0x3f8(%rbp)
14010ad7f:     	movaps	0x5834daa(%rip), %xmm0  # 0x14593fb30
14010ad86:     	movups	%xmm0, 0x408(%rbp)
14010ad8d:     	movdqu	%xmm8, 0x418(%rbp)
14010ad96:     	movups	%xmm15, 0x428(%rbp)
14010ad9e:     	movups	0x5835a63(%rip), %xmm0  # 0x145940808
14010ada5:     	movups	%xmm0, 0x438(%rbp)
14010adac:     	movups	0x5835a65(%rip), %xmm0  # 0x145940818
14010adb3:     	movups	%xmm0, 0x448(%rbp)
14010adba:     	movdqu	%xmm7, 0x468(%rbp)
14010adc2:     	movups	0x5835a5f(%rip), %xmm0  # 0x145940828
14010adc9:     	movups	%xmm0, 0x458(%rbp)
14010add0:     	movb	$0x0, 0x4b6(%rbp)
14010add7:     	movl	$0x0, 0x4b2(%rbp)
14010ade1:     	movq	$0x0, 0x498(%rbp)
14010adec:     	movl	$0x3f800000, 0x4a0(%rbp) # imm = 0x3F800000
14010adf6:     	movdqu	%xmm6, 0x478(%rbp)
14010adfe:     	movl	$0x1, 0x488(%rbp)
14010ae08:     	movq	$0x0, 0x48c(%rbp)
14010ae13:     	movb	$0x0, 0x4b7(%rbp)
14010ae1a:     	movaps	%xmm9, 0x340(%rbp)
14010ae22:     	movq	$0x0, 0x350(%rbp)
14010ae2d:     	movups	%xmm11, 0x358(%rbp)
14010ae35:     	movq	$0x0, 0x368(%rbp)
14010ae40:     	movaps	%xmm10, 0x370(%rbp)
14010ae48:     	movq	$0x0, 0x380(%rbp)
14010ae53:     	movups	%xmm12, 0x388(%rbp)
14010ae5b:     	movq	$0x0, 0x398(%rbp)
14010ae66:     	movw	$0x0, 0x4aa(%rbp)
14010ae6f:     	movl	$0x10000, 0x4a6(%rbp)   # imm = 0x10000
14010ae79:     	movw	$0x0, 0x4b0(%rbp)
14010ae82:     	movl	$0x10000, 0x4ac(%rbp)   # imm = 0x10000
14010ae8c:     	movl	0x10(%r14), %eax
14010ae90:     	movl	%eax, 0x330(%rbp)
14010ae96:     	movdqu	(%r14), %xmm0
14010ae9b:     	movdqa	%xmm0, 0x320(%rbp)
14010aea3:     	movq	0x68(%rbx), %r8
14010aea7:     	leaq	0x5837b16(%rip), %rcx   # 0x1459429c4
14010aeae:     	movl	$0xa, %edx
14010aeb3:     	callq	0x142affbe0 <.text+0x2afebe0>
14010aeb8:     	nop
14010aeb9:     	testq	%rax, %rax
14010aebc:     	movl	0x580e2bd(%rip), %r13d  # 0x145919180
14010aec3:     	jne	0x14010aecc <.text+0x109ecc>
14010aec5:     	movq	0x79028ec(%rip), %rax   # 0x147a0d7b8
14010aecc:     	movl	$0x1, %edx
14010aed1:     	cmpb	$0x3, (%rax)
14010aed4:     	jne	0x14010aef0 <.text+0x109ef0>
14010aed6:     	movq	0x18(%rax), %rdx
14010aeda:     	testq	%rdx, %rdx
14010aedd:     	jns	0x14010c26a <.text+0x10b26a>
14010aee3:     	xorl	%ecx, %ecx
14010aee5:     	callq	0x14590379b <.text+0x590279b>
14010aeea:     	nop
14010aeeb:     	jmp	0x14010c243 <.text+0x10b243>
14010aef0:     	xorl	%r8d, %r8d
14010aef3:     	leaq	0x520(%rbp), %rcx
14010aefa:     	movq	%rdx, 0x4c8(%rbp)
14010af01:     	movq	%r8, 0x870(%rbp)
14010af08:     	callq	0x1401f9790 <.text+0x1f8790>
14010af0d:     	nop
14010af0e:     	cmpb	$0x1, (%rdi)
14010af11:     	jne	0x14010af33 <.text+0x109f33>
14010af13:     	movl	0x1(%rdi), %eax
14010af16:     	movl	0x4(%rdi), %ecx
14010af19:     	movl	%ecx, 0x4f3(%rbp)
14010af1f:     	movl	%eax, 0x4f0(%rbp)
14010af25:     	movq	0x8(%rdi), %rsi
14010af29:     	movzbl	0x10(%rdi), %r12d
14010af2e:     	movb	$0x1, %r15b
14010af31:     	jmp	0x14010af44 <.text+0x109f44>
14010af33:     	movq	0x8(%rdi), %rsi
14010af37:     	lock
14010af38:     	incq	(%rsi)
14010af3b:     	jle	0x14010c243 <.text+0x10b243>
14010af41:     	xorl	%r15d, %r15d
14010af44:     	movq	0x530(%rbp), %rax
14010af4b:     	movq	%rax, 0x220(%rbp)
14010af52:     	movups	0x520(%rbp), %xmm0
14010af59:     	movups	%xmm0, 0x210(%rbp)
14010af60:     	movl	0x4f0(%rbp), %eax
14010af66:     	movl	0x4f3(%rbp), %ecx
14010af6c:     	movl	%ecx, 0x76c(%rbp)
14010af72:     	movl	%eax, 0x769(%rbp)
14010af78:     	movaps	0x320(%rbp), %xmm0
14010af7f:     	movups	%xmm0, 0x841(%rbp)
14010af86:     	movl	0x330(%rbp), %eax
14010af8c:     	movl	%eax, 0x851(%rbp)
14010af92:     	leaq	0x90(%rbp), %r14
14010af99:     	leaq	0x340(%rbp), %rdx
14010afa0:     	movl	$0x180, %r8d            # imm = 0x180
14010afa6:     	movq	%r14, %rcx
14010afa9:     	callq	0x1457731ed <.text+0x57721ed>
14010afae:     	movups	0x840(%rbp), %xmm0
14010afb5:     	movups	%xmm0, 0x787(%rbp)
14010afbc:     	movq	0x84d(%rbp), %rax
14010afc3:     	movq	%rax, 0x794(%rbp)
14010afca:     	leaq	0x5b8(%rbp), %rcx
14010afd1:     	movl	$0x198, %r8d            # imm = 0x198
14010afd7:     	movq	%r14, %rdx
14010afda:     	callq	0x1457731ed <.text+0x57721ed>
14010afdf:     	movq	$0x0, 0x750(%rbp)
14010afea:     	movq	$0x4, 0x758(%rbp)
14010aff5:     	movq	$0x0, 0x760(%rbp)
14010b000:     	movb	%r15b, 0x768(%rbp)
14010b007:     	movq	%rsi, 0x770(%rbp)
14010b00e:     	movq	%r12, 0x778(%rbp)
14010b015:     	movl	$0x41300000, 0x780(%rbp) # imm = 0x41300000
14010b01f:     	movw	$0x190, 0x784(%rbp)     # imm = 0x190
14010b028:     	movb	$0x1, 0x786(%rbp)
14010b02f:     	movdqu	0x580e139(%rip), %xmm0  # 0x145919170
14010b037:     	movdqu	%xmm0, 0x79c(%rbp)
14010b03f:     	movl	%r13d, 0x7ac(%rbp)
14010b046:     	movq	%xmm13, 0x7b0(%rbp)
14010b04f:     	movq	0x5a8(%rbp), %rax
14010b056:     	movq	%rax, 0x5b0(%rbp)
14010b05d:     	leaq	0x340(%rbp), %rcx
14010b064:     	leaq	0x5b0(%rbp), %r8
14010b06b:     	leaq	0x68(%rbp), %rdx
14010b06f:     	callq	0x1400db410 <.text+0xda410>
14010b074:     	nop
14010b075:     	movq	0x870(%rbp), %rdx
14010b07c:     	testq	%rdx, %rdx
14010b07f:     	je	0x14010b093 <.text+0x10a093>
14010b081:     	movl	$0x1, %r8d
14010b087:     	movq	0x4c8(%rbp), %rcx
14010b08e:     	callq	0x1400021d0 <.text+0x11d0>
14010b093:     	movw	$0x0, 0x4a4(%rbp)
14010b09c:     	movb	$0x1, 0x494(%rbp)
14010b0a3:     	pxor	%xmm0, %xmm0
14010b0a7:     	movdqa	%xmm0, 0x3a0(%rbp)
14010b0af:     	movdqa	%xmm0, 0x3b0(%rbp)
14010b0b7:     	movdqa	%xmm0, 0x3c0(%rbp)
14010b0bf:     	movdqa	%xmm0, 0x3d0(%rbp)
14010b0c7:     	movdqa	%xmm0, 0x3e0(%rbp)
14010b0cf:     	movq	$0x0, 0x3f0(%rbp)
14010b0da:     	movl	$0x0, 0x4b8(%rbp)
14010b0e4:     	movw	$0x0, 0x4bc(%rbp)
14010b0ed:     	movaps	0x580d73c(%rip), %xmm0  # 0x145918830
14010b0f4:     	movups	%xmm0, 0x3f8(%rbp)
14010b0fb:     	movups	%xmm14, 0x408(%rbp)
14010b103:     	movdqu	%xmm8, 0x418(%rbp)
14010b10c:     	movups	%xmm15, 0x428(%rbp)
14010b114:     	movups	0x58356fd(%rip), %xmm0  # 0x145940818
14010b11b:     	movups	%xmm0, 0x448(%rbp)
14010b122:     	movups	0x58356df(%rip), %xmm0  # 0x145940808
14010b129:     	movups	%xmm0, 0x438(%rbp)
14010b130:     	movdqu	%xmm7, 0x468(%rbp)
14010b138:     	movdqu	0x58356e8(%rip), %xmm0  # 0x145940828
14010b140:     	movdqu	%xmm0, 0x458(%rbp)
14010b148:     	movb	$0x0, 0x4b6(%rbp)
14010b14f:     	movl	$0x0, 0x4b2(%rbp)
14010b159:     	movq	$0x0, 0x498(%rbp)
14010b164:     	movl	$0x3f800000, 0x4a0(%rbp) # imm = 0x3F800000
14010b16e:     	movdqu	%xmm6, 0x478(%rbp)
14010b176:     	movl	$0x1, 0x488(%rbp)
14010b180:     	movq	$0x0, 0x48c(%rbp)
14010b18b:     	movb	$0x0, 0x4b7(%rbp)
14010b192:     	movaps	%xmm9, 0x340(%rbp)
14010b19a:     	movq	$0x0, 0x350(%rbp)
14010b1a5:     	movups	%xmm11, 0x358(%rbp)
14010b1ad:     	movq	$0x0, 0x368(%rbp)
14010b1b8:     	movaps	%xmm10, 0x370(%rbp)
14010b1c0:     	movq	$0x0, 0x380(%rbp)
14010b1cb:     	movups	%xmm12, 0x388(%rbp)
14010b1d3:     	movq	$0x0, 0x398(%rbp)
14010b1de:     	movw	$0x0, 0x4aa(%rbp)
14010b1e7:     	movl	$0x10000, 0x4a6(%rbp)   # imm = 0x10000
14010b1f1:     	movw	$0x0, 0x4b0(%rbp)
14010b1fa:     	movl	$0x10000, 0x4ac(%rbp)   # imm = 0x10000
14010b204:     	movq	0x20(%rbx), %rdx
14010b208:     	leaq	0x520(%rbp), %rcx
14010b20f:     	callq	0x145728850 <.text+0x5727850>
14010b214:     	nop
14010b215:     	cmpb	$0x1, (%rdi)
14010b218:     	jne	0x14010b23a <.text+0x10a23a>
14010b21a:     	movl	0x1(%rdi), %eax
14010b21d:     	movl	0x4(%rdi), %ecx
14010b220:     	movl	%ecx, 0x4f3(%rbp)
14010b226:     	movl	%eax, 0x4f0(%rbp)
14010b22c:     	movq	0x8(%rdi), %rsi
14010b230:     	movzbl	0x10(%rdi), %r12d
14010b235:     	movb	$0x1, %r15b
14010b238:     	jmp	0x14010b24b <.text+0x10a24b>
14010b23a:     	movq	0x8(%rdi), %rsi
14010b23e:     	lock
14010b23f:     	incq	(%rsi)
14010b242:     	jle	0x14010c243 <.text+0x10b243>
14010b248:     	xorl	%r15d, %r15d
14010b24b:     	movl	0x330(%rbp), %eax
14010b251:     	movl	%eax, 0x851(%rbp)
14010b257:     	movaps	0x320(%rbp), %xmm0
14010b25e:     	movups	%xmm0, 0x841(%rbp)
14010b265:     	movups	0x520(%rbp), %xmm0
14010b26c:     	movups	%xmm0, 0x210(%rbp)
14010b273:     	movq	0x530(%rbp), %rax
14010b27a:     	movq	%rax, 0x220(%rbp)
14010b281:     	movl	0x4f0(%rbp), %eax
14010b287:     	movl	0x4f3(%rbp), %ecx
14010b28d:     	movl	%ecx, 0x76c(%rbp)
14010b293:     	movl	%eax, 0x769(%rbp)
14010b299:     	movups	0x840(%rbp), %xmm0
14010b2a0:     	movups	%xmm0, 0x787(%rbp)
14010b2a7:     	movq	0x84d(%rbp), %rax
14010b2ae:     	movq	%rax, 0x794(%rbp)
14010b2b5:     	leaq	0x340(%rbp), %rdx
14010b2bc:     	movl	$0x180, %r8d            # imm = 0x180
14010b2c2:     	movq	%r14, %rcx
14010b2c5:     	callq	0x1457731ed <.text+0x57721ed>
14010b2ca:     	leaq	0x5b8(%rbp), %rcx
14010b2d1:     	movl	$0x198, %r8d            # imm = 0x198
14010b2d7:     	movq	%r14, %rdx
14010b2da:     	callq	0x1457731ed <.text+0x57721ed>
14010b2df:     	movq	$0x0, 0x750(%rbp)
14010b2ea:     	movq	$0x4, 0x758(%rbp)
14010b2f5:     	movq	$0x0, 0x760(%rbp)
14010b300:     	movb	%r15b, 0x768(%rbp)
14010b307:     	movq	%rsi, 0x770(%rbp)
14010b30e:     	movq	%r12, 0x778(%rbp)
14010b315:     	movl	$0x41a80000, 0x780(%rbp) # imm = 0x41A80000
14010b31f:     	movw	$0x190, 0x784(%rbp)     # imm = 0x190
14010b328:     	movb	$0x1, 0x786(%rbp)
14010b32f:     	movdqu	0x580de39(%rip), %xmm0  # 0x145919170
14010b337:     	movdqu	%xmm0, 0x79c(%rbp)
14010b33f:     	movl	%r13d, 0x7ac(%rbp)
14010b346:     	movq	%xmm13, 0x7b0(%rbp)
14010b34f:     	movw	$0x1, 0x7b8(%rbp)
14010b358:     	movq	0x5a8(%rbp), %r14
14010b35f:     	movq	%r14, 0x5b0(%rbp)
14010b366:     	leaq	0x340(%rbp), %rcx
14010b36d:     	leaq	0x5b0(%rbp), %r8
14010b374:     	leaq	0x68(%rbp), %rsi
14010b378:     	movq	%rsi, %rdx
14010b37b:     	callq	0x1400db6f0 <.text+0xda6f0>
14010b380:     	movq	0x28(%rbx), %rdx
14010b384:     	cmpq	$0x0, 0x10(%rdx)
14010b389:     	je	0x14010b4cf <.text+0x10a4cf>
14010b38f:     	leaq	0x90(%rbp), %rcx
14010b396:     	callq	0x145728850 <.text+0x5727850>
14010b39b:     	cmpb	$0x1, (%rdi)
14010b39e:     	jne	0x14010b3be <.text+0x10a3be>
14010b3a0:     	movl	0x1(%rdi), %eax
14010b3a3:     	movl	0x4(%rdi), %ecx
14010b3a6:     	movl	%ecx, 0x523(%rbp)
14010b3ac:     	movl	%eax, 0x520(%rbp)
14010b3b2:     	movq	0x8(%rdi), %rax
14010b3b6:     	movzbl	0x10(%rdi), %edx
14010b3ba:     	movb	$0x1, %cl
14010b3bc:     	jmp	0x14010b3ce <.text+0x10a3ce>
14010b3be:     	movq	0x8(%rdi), %rax
14010b3c2:     	lock
14010b3c3:     	incq	(%rax)
14010b3c6:     	jle	0x14010c243 <.text+0x10b243>
14010b3cc:     	xorl	%ecx, %ecx
14010b3ce:     	movups	0x58352f7(%rip), %xmm0  # 0x1459406cc
14010b3d5:     	movups	%xmm0, 0x341(%rbp)
14010b3dc:     	movl	$0x3f800000, 0x351(%rbp) # imm = 0x3F800000
14010b3e6:     	movq	0xa0(%rbp), %r8
14010b3ed:     	movq	%r8, 0x5c8(%rbp)
14010b3f4:     	movups	0x90(%rbp), %xmm0
14010b3fb:     	movups	%xmm0, 0x5b8(%rbp)
14010b402:     	movl	0x520(%rbp), %r8d
14010b409:     	movl	0x523(%rbp), %r9d
14010b410:     	movl	%r8d, 0x5e9(%rbp)
14010b417:     	movl	%r9d, 0x5ec(%rbp)
14010b41e:     	movups	0x340(%rbp), %xmm0
14010b425:     	movups	%xmm0, 0x607(%rbp)
14010b42c:     	movq	0x34d(%rbp), %r8
14010b433:     	movq	%r8, 0x614(%rbp)
14010b43a:     	movq	$0x0, 0x5d0(%rbp)
14010b445:     	movq	$0x4, 0x5d8(%rbp)
14010b450:     	movq	$0x0, 0x5e0(%rbp)
14010b45b:     	movb	%cl, 0x5e8(%rbp)
14010b461:     	movq	%rax, 0x5f0(%rbp)
14010b468:     	movq	%rdx, 0x5f8(%rbp)
14010b46f:     	movl	$0x41500000, 0x600(%rbp) # imm = 0x41500000
14010b479:     	movw	$0x190, 0x604(%rbp)     # imm = 0x190
14010b482:     	movb	$0x1, 0x606(%rbp)
14010b489:     	movl	%r13d, 0x62c(%rbp)
14010b490:     	movdqu	0x580dcd8(%rip), %xmm0  # 0x145919170
14010b498:     	movdqu	%xmm0, 0x61c(%rbp)
14010b4a0:     	movq	%xmm13, 0x630(%rbp)
14010b4a9:     	movw	$0x1, 0x638(%rbp)
14010b4b2:     	movq	%r14, 0x5b0(%rbp)
14010b4b9:     	leaq	0x90(%rbp), %rcx
14010b4c0:     	leaq	0x5b0(%rbp), %r8
14010b4c7:     	movq	%rsi, %rdx
14010b4ca:     	callq	0x1400ebbc0 <.text+0xeabc0>
14010b4cf:     	movw	$0x0, 0x1f4(%rbp)
14010b4d8:     	movb	$0x1, 0x1e4(%rbp)
14010b4df:     	pxor	%xmm13, %xmm13
14010b4e4:     	movdqu	%xmm13, 0xf8(%rbp)
14010b4ed:     	movdqu	%xmm13, 0x108(%rbp)
14010b4f6:     	movabsq	$0x428c000000000002, %rax # imm = 0x428C000000000002
14010b500:     	movq	%rax, 0x118(%rbp)
14010b507:     	movq	$0x0, 0xf0(%rbp)
14010b512:     	movdqa	%xmm13, 0x120(%rbp)
14010b51b:     	movdqa	%xmm13, 0x130(%rbp)
14010b524:     	movq	$0x0, 0x140(%rbp)
14010b52f:     	movl	$0x0, 0x208(%rbp)
14010b539:     	movw	$0x0, 0x20c(%rbp)
14010b542:     	movups	%xmm14, 0x148(%rbp)
14010b54a:     	movaps	0x580d53f(%rip), %xmm0  # 0x145918a90
14010b551:     	movups	%xmm0, 0x158(%rbp)
14010b558:     	movdqu	%xmm8, 0x168(%rbp)
14010b561:     	movups	%xmm15, 0x178(%rbp)
14010b569:     	movups	0x58352a7(%rip), %xmm15 # 0x145940818
14010b571:     	movups	%xmm15, 0x198(%rbp)
14010b579:     	movups	0x5835287(%rip), %xmm12 # 0x145940808
14010b581:     	movups	%xmm12, 0x188(%rbp)
14010b589:     	movdqu	0x5835296(%rip), %xmm8  # 0x145940828
14010b592:     	movdqu	%xmm8, 0x1a8(%rbp)
14010b59b:     	movdqu	%xmm7, 0x1b8(%rbp)
14010b5a3:     	movw	$0x0, 0x206(%rbp)
14010b5ac:     	movl	$0x0, 0x202(%rbp)
14010b5b6:     	movq	$0x0, 0x1e8(%rbp)
14010b5c1:     	movl	$0x3f800000, 0x1f0(%rbp) # imm = 0x3F800000
14010b5cb:     	movdqu	%xmm6, 0x1c8(%rbp)
14010b5d3:     	movl	$0x1, 0x1d8(%rbp)
14010b5dd:     	movq	$0x0, 0x1dc(%rbp)
14010b5e8:     	movaps	%xmm9, 0x90(%rbp)
14010b5f0:     	movq	$0x0, 0xa0(%rbp)
14010b5fb:     	movups	%xmm11, 0xa8(%rbp)
14010b603:     	movq	$0x0, 0xb8(%rbp)
14010b60e:     	movaps	%xmm10, 0xc0(%rbp)
14010b616:     	movq	$0x0, 0xd0(%rbp)
14010b621:     	movups	0x5835130(%rip), %xmm6  # 0x145940758
14010b628:     	movups	%xmm6, 0xd8(%rbp)
14010b62f:     	movq	$0x0, 0xe8(%rbp)
14010b63a:     	movw	$0x0, 0x1fa(%rbp)
14010b643:     	movl	$0x10000, 0x1f6(%rbp)   # imm = 0x10000
14010b64d:     	movw	$0x0, 0x200(%rbp)
14010b656:     	movl	$0x10000, 0x1fc(%rbp)   # imm = 0x10000
14010b660:     	movaps	0x320(%rbp), %xmm0
14010b667:     	movaps	%xmm0, 0x340(%rbp)
14010b66e:     	movl	$0x3f333333, 0x350(%rbp) # imm = 0x3F333333
14010b678:     	leaq	0x5b8(%rbp), %rcx
14010b67f:     	leaq	0x90(%rbp), %rdx
14010b686:     	leaq	0x340(%rbp), %r8
14010b68d:     	callq	0x1400b6df0 <.text+0xb5df0>
14010b692:     	movq	%r14, 0x5b0(%rbp)
14010b699:     	leaq	0x90(%rbp), %rcx
14010b6a0:     	leaq	0x5b0(%rbp), %r8
14010b6a7:     	movq	%rsi, %rdx
14010b6aa:     	callq	0x1400da640 <.text+0xd9640>
14010b6af:     	movdqa	%xmm13, 0x130(%rbp)
14010b6b8:     	movdqa	%xmm13, 0x120(%rbp)
14010b6c1:     	movdqa	%xmm13, 0x110(%rbp)
14010b6ca:     	movdqa	%xmm13, 0x100(%rbp)
14010b6d3:     	movdqa	%xmm13, 0xf0(%rbp)
14010b6dc:     	movq	0x580a0eb(%rip), %xmm13 # 0x1459157d0
14010b6e5:     	movq	$0x0, 0x140(%rbp)
14010b6f0:     	movups	0x58350d1(%rip), %xmm0  # 0x1459407c8
14010b6f7:     	movups	%xmm0, 0x148(%rbp)
14010b6fe:     	movups	0x58350d3(%rip), %xmm0  # 0x1459407d8
14010b705:     	movups	%xmm0, 0x158(%rbp)
14010b70c:     	movaps	%xmm9, 0x90(%rbp)
14010b714:     	movq	$0x0, 0xa0(%rbp)
14010b71f:     	movups	%xmm11, 0xa8(%rbp)
14010b727:     	movq	$0x0, 0xb8(%rbp)
14010b732:     	movaps	%xmm10, 0xc0(%rbp)
14010b73a:     	movq	$0x0, 0xd0(%rbp)
14010b745:     	movups	%xmm6, 0xd8(%rbp)
14010b74c:     	movq	$0x0, 0xe8(%rbp)
14010b757:     	leaq	0x5b8(%rbp), %rcx
14010b75e:     	leaq	0x90(%rbp), %rdx
14010b765:     	movl	$0xd8, %r8d
14010b76b:     	callq	0x1457731ed <.text+0x57721ed>
14010b770:     	movaps	0x57fbb59(%rip), %xmm0  # 0x1459072d0
14010b777:     	movups	%xmm0, 0x690(%rbp)
14010b77e:     	movdqa	0x580d00a(%rip), %xmm6  # 0x145918790
14010b786:     	movdqu	%xmm6, 0x6a0(%rbp)
14010b78e:     	movups	%xmm12, 0x6b0(%rbp)
14010b796:     	movups	%xmm15, 0x6c0(%rbp)
14010b79e:     	movdqu	%xmm8, 0x6d0(%rbp)
14010b7a7:     	movdqu	%xmm7, 0x6e0(%rbp)
14010b7af:     	movaps	0x580d09a(%rip), %xmm0  # 0x145918850
14010b7b6:     	movups	%xmm0, 0x6f0(%rbp)
14010b7bd:     	movl	$0x1, 0x700(%rbp)
14010b7c7:     	movq	$0x0, 0x704(%rbp)
14010b7d2:     	movb	$0x1, 0x70c(%rbp)
14010b7d9:     	movq	$0x0, 0x710(%rbp)
14010b7e4:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
14010b7ee:     	movw	$0x0, 0x71c(%rbp)
14010b7f7:     	movw	$0x0, 0x722(%rbp)
14010b800:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
14010b80a:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
14010b814:     	movw	$0x0, 0x728(%rbp)
14010b81d:     	movl	$0x0, 0x72a(%rbp)
14010b827:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
14010b831:     	movq	%rax, 0x72e(%rbp)
14010b838:     	movq	%r14, 0x5b0(%rbp)
14010b83f:     	leaq	0x520(%rbp), %rcx
14010b846:     	leaq	0x5b0(%rbp), %r8
14010b84d:     	movq	%rsi, %rdx
14010b850:     	callq	0x1400d7270 <.text+0xd6270>
14010b855:     	movq	0x30(%rbx), %rdx
14010b859:     	movq	0x38(%rbx), %rsi
14010b85d:     	movq	0x520(%rbp), %r14
14010b864:     	movq	0x548(%rbp), %rax
14010b86b:     	movq	%r14, 0x340(%rbp)
14010b872:     	movups	0x528(%rbp), %xmm0
14010b879:     	movups	%xmm0, 0x348(%rbp)
14010b880:     	movdqu	0x538(%rbp), %xmm0
14010b888:     	movdqu	%xmm0, 0x358(%rbp)
14010b890:     	movq	%rax, 0x368(%rbp)
14010b897:     	cmpq	$0x0, 0x10(%rdx)
14010b89c:     	je	0x14010b9e9 <.text+0x10a9e9>
14010b8a2:     	leaq	0x90(%rbp), %rcx
14010b8a9:     	callq	0x145728850 <.text+0x5727850>
14010b8ae:     	cmpb	$0x1, (%rdi)
14010b8b1:     	jne	0x14010b8d2 <.text+0x10a8d2>
14010b8b3:     	movl	0x1(%rdi), %eax
14010b8b6:     	movl	0x4(%rdi), %ecx
14010b8b9:     	movl	%ecx, 0x5a3(%rbp)
14010b8bf:     	movl	%eax, 0x5a0(%rbp)
14010b8c5:     	movq	0x8(%rdi), %rax
14010b8c9:     	movzbl	0x10(%rdi), %ecx
14010b8cd:     	movb	$0x1, %r8b
14010b8d0:     	jmp	0x14010b8e3 <.text+0x10a8e3>
14010b8d2:     	movq	0x8(%rdi), %rax
14010b8d6:     	lock
14010b8d7:     	incq	(%rax)
14010b8da:     	jle	0x14010c243 <.text+0x10b243>
14010b8e0:     	xorl	%r8d, %r8d
14010b8e3:     	leaq	0x348(%rbp), %rdx
14010b8ea:     	movq	0xa0(%rbp), %r9
14010b8f1:     	movq	%r9, 0x5c8(%rbp)
14010b8f8:     	movups	0x90(%rbp), %xmm0
14010b8ff:     	movups	%xmm0, 0x5b8(%rbp)
14010b906:     	movups	0x58352d7(%rip), %xmm0  # 0x145940be4
14010b90d:     	movups	%xmm0, 0x841(%rbp)
14010b914:     	movl	$0x3f800000, 0x851(%rbp) # imm = 0x3F800000
14010b91e:     	movq	$0x0, 0x5d0(%rbp)
14010b929:     	movq	$0x4, 0x5d8(%rbp)
14010b934:     	movq	$0x0, 0x5e0(%rbp)
14010b93f:     	movb	%r8b, 0x5e8(%rbp)
14010b946:     	movl	0x5a0(%rbp), %r8d
14010b94d:     	movl	0x5a3(%rbp), %r9d
14010b954:     	movl	%r8d, 0x5e9(%rbp)
14010b95b:     	movl	%r9d, 0x5ec(%rbp)
14010b962:     	movq	%rax, 0x5f0(%rbp)
14010b969:     	movq	%rcx, 0x5f8(%rbp)
14010b970:     	movl	$0x41600000, 0x600(%rbp) # imm = 0x41600000
14010b97a:     	movw	$0x190, 0x604(%rbp)     # imm = 0x190
14010b983:     	movb	$0x1, 0x606(%rbp)
14010b98a:     	movq	0x84d(%rbp), %rax
14010b991:     	movq	%rax, 0x614(%rbp)
14010b998:     	movups	0x840(%rbp), %xmm0
14010b99f:     	movups	%xmm0, 0x607(%rbp)
14010b9a6:     	movl	%r13d, 0x62c(%rbp)
14010b9ad:     	movdqu	0x580d7bb(%rip), %xmm0  # 0x145919170
14010b9b5:     	movdqu	%xmm0, 0x61c(%rbp)
14010b9bd:     	movq	%xmm13, 0x630(%rbp)
14010b9c6:     	movw	$0x1, 0x638(%rbp)
14010b9cf:     	movq	%r14, 0x5b0(%rbp)
14010b9d6:     	leaq	0x90(%rbp), %rcx
14010b9dd:     	leaq	0x5b0(%rbp), %r8
14010b9e4:     	callq	0x1400ebbc0 <.text+0xeabc0>
14010b9e9:     	movq	0x10(%rsi), %rax
14010b9ed:     	testq	%rax, %rax
14010b9f0:     	je	0x14010ba2e <.text+0x10aa2e>
14010b9f2:     	movq	0x8(%rsi), %rsi
14010b9f6:     	shlq	$0x3, %rax
14010b9fa:     	leaq	(%rax,%rax,2), %r14
14010b9fe:     	xorl	%r15d, %r15d
14010ba01:     	leaq	0x340(%rbp), %r12
14010ba08:     	nopl	(%rax,%rax)
14010ba10:     	movq	0x8(%rsi,%r15), %r8
14010ba15:     	movq	0x10(%rsi,%r15), %r9
14010ba1a:     	movq	%r12, %rcx
14010ba1d:     	movq	%rdi, %rdx
14010ba20:     	callq	0x1401f9d10 <.text+0x1f8d10>
14010ba25:     	addq	$0x18, %r15
14010ba29:     	cmpq	%r15, %r14
14010ba2c:     	jne	0x14010ba10 <.text+0x10aa10>
14010ba2e:     	movaps	%xmm9, 0x340(%rbp)
14010ba36:     	movq	$0x0, 0x350(%rbp)
14010ba41:     	movups	%xmm11, 0x358(%rbp)
14010ba49:     	movq	$0x0, 0x368(%rbp)
14010ba54:     	movaps	%xmm10, 0x370(%rbp)
14010ba5c:     	movq	$0x0, 0x380(%rbp)
14010ba67:     	movups	0x5834cea(%rip), %xmm0  # 0x145940758
14010ba6e:     	movups	%xmm0, 0x388(%rbp)
14010ba75:     	movq	$0x0, 0x398(%rbp)
14010ba80:     	movaps	%xmm9, 0x90(%rbp)
14010ba88:     	movaps	%xmm10, 0xc0(%rbp)
14010ba90:     	movq	0x350(%rbp), %rax
14010ba97:     	movq	%rax, 0xa0(%rbp)
14010ba9e:     	movq	0x358(%rbp), %rax
14010baa5:     	movq	%rax, 0xa8(%rbp)
14010baac:     	movq	0x360(%rbp), %rax
14010bab3:     	movq	%rax, 0xb0(%rbp)
14010baba:     	movq	0x368(%rbp), %rax
14010bac1:     	movq	%rax, 0xb8(%rbp)
14010bac8:     	movq	0x380(%rbp), %rax
14010bacf:     	movq	%rax, 0xd0(%rbp)
14010bad6:     	movq	0x388(%rbp), %rax
14010badd:     	movq	%rax, 0xd8(%rbp)
14010bae4:     	movaps	0x390(%rbp), %xmm0
14010baeb:     	movaps	%xmm0, 0xe0(%rbp)
14010baf2:     	xorps	%xmm0, %xmm0
14010baf5:     	movaps	%xmm0, 0x100(%rbp)
14010bafc:     	movaps	%xmm0, 0xf0(%rbp)
14010bb03:     	movq	$0x0, 0x110(%rbp)
14010bb0e:     	movups	%xmm0, 0x658(%rbp)
14010bb15:     	movups	%xmm0, 0x648(%rbp)
14010bb1c:     	movq	$0x0, 0x668(%rbp)
14010bb27:     	movups	%xmm0, 0x788(%rbp)
14010bb2e:     	leaq	0x5b8(%rbp), %rcx
14010bb35:     	leaq	0x90(%rbp), %rdx
14010bb3c:     	movl	$0x88, %r8d
14010bb42:     	callq	0x1457731ed <.text+0x57721ed>
14010bb47:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
14010bb51:     	movq	%rax, 0x640(%rbp)
14010bb58:     	movups	%xmm14, 0x670(%rbp)
14010bb60:     	movl	$0x0, 0x680(%rbp)
14010bb6a:     	movaps	0x5833fef(%rip), %xmm0  # 0x14593fb60
14010bb71:     	movups	%xmm0, 0x688(%rbp)
14010bb78:     	movaps	0x5833ff1(%rip), %xmm0  # 0x14593fb70
14010bb7f:     	movups	%xmm0, 0x698(%rbp)
14010bb86:     	movaps	0x5833ff3(%rip), %xmm0  # 0x14593fb80
14010bb8d:     	movups	%xmm0, 0x6a8(%rbp)
14010bb94:     	movaps	0x5833ff5(%rip), %xmm0  # 0x14593fb90
14010bb9b:     	movups	%xmm0, 0x6b8(%rbp)
14010bba2:     	movups	%xmm14, 0x6c8(%rbp)
14010bbaa:     	movdqu	%xmm6, 0x6d8(%rbp)
14010bbb2:     	movsd	0x5833fe6(%rip), %xmm0  # 0x14593fba0
14010bbba:     	movups	%xmm0, 0x6e8(%rbp)
14010bbc1:     	movq	$0x1, 0x6f8(%rbp)
14010bbcc:     	movl	$0x1, 0x700(%rbp)
14010bbd6:     	movss	0x5833c02(%rip), %xmm0  # 0x14593f7e0
14010bbde:     	movlps	%xmm0, 0x704(%rbp)
14010bbe5:     	movb	$0x1, 0x70c(%rbp)
14010bbec:     	movq	$0x0, 0x710(%rbp)
14010bbf7:     	movl	$0x3f800000, 0x718(%rbp) # imm = 0x3F800000
14010bc01:     	movw	$0x0, 0x71c(%rbp)
14010bc0a:     	movw	$0x0, 0x722(%rbp)
14010bc13:     	movl	$0x10000, 0x71e(%rbp)   # imm = 0x10000
14010bc1d:     	movl	$0x10000, 0x724(%rbp)   # imm = 0x10000
14010bc27:     	movw	$0x0, 0x728(%rbp)
14010bc30:     	movq	$0x0, 0x72a(%rbp)
14010bc3b:     	movl	$0x5000005, 0x732(%rbp) # imm = 0x5000005
14010bc45:     	movl	$0x0, 0x738(%rbp)
14010bc4f:     	movdqa	0x5833f59(%rip), %xmm0  # 0x14593fbb0
14010bc57:     	movdqu	%xmm0, 0x73c(%rbp)
14010bc5f:     	movl	$0x0, 0x74c(%rbp)
14010bc69:     	movdqu	%xmm0, 0x750(%rbp)
14010bc71:     	movl	$0x0, 0x760(%rbp)
14010bc7b:     	movdqu	%xmm0, 0x764(%rbp)
14010bc83:     	movl	$0x0, 0x774(%rbp)
14010bc8d:     	movdqu	%xmm0, 0x778(%rbp)
14010bc95:     	movl	$0x3eb33333, 0x798(%rbp) # imm = 0x3EB33333
14010bc9f:     	movq	0x5a8(%rbp), %rax
14010bca6:     	movq	%rax, 0x5b0(%rbp)
14010bcad:     	leaq	0x520(%rbp), %rcx
14010bcb4:     	leaq	0x5b0(%rbp), %r8
14010bcbb:     	leaq	0x68(%rbp), %rdx
14010bcbf:     	callq	0x1400d7a80 <.text+0xd6a80>
14010bcc4:     	movq	0x50(%rbx), %r14
14010bcc8:     	cmpq	$-0x1, (%r14)
14010bccc:     	je	0x14010bd06 <.text+0x10ad06>
14010bcce:     	movq	0x48(%r14), %rax
14010bcd2:     	leaq	-0x1(%rax), %rcx
14010bcd6:     	cmpq	$0x4, %rcx
14010bcda:     	ja	0x14010bd47 <.text+0x10ad47>
14010bcdc:     	leaq	0x58390a5(%rip), %rcx   # 0x145944d88
14010bce3:     	movd	-0x4(%rcx,%rax,4), %xmm6
14010bce9:     	leaq	0x58390ac(%rip), %rcx   # 0x145944d9c
14010bcf0:     	movd	-0x4(%rcx,%rax,4), %xmm7
14010bcf6:     	leaq	0x58390b3(%rip), %rcx   # 0x145944db0
14010bcfd:     	movd	-0x4(%rcx,%rax,4), %xmm8
14010bd04:     	jmp	0x14010bd58 <.text+0x10ad58>
14010bd06:     	movq	0x40(%rbx), %rdx
14010bd0a:     	leaq	0x90(%rbp), %rcx
14010bd11:     	callq	0x145728850 <.text+0x5727850>
14010bd16:     	cmpb	$0x1, (%rdi)
14010bd19:     	movq	0x578(%rbp), %rsi
14010bd20:     	jne	0x14010c0b9 <.text+0x10b0b9>
14010bd26:     	movl	0x1(%rdi), %eax
14010bd29:     	movl	0x4(%rdi), %ecx
14010bd2c:     	movl	%ecx, 0x843(%rbp)
14010bd32:     	movl	%eax, 0x840(%rbp)
14010bd38:     	movq	0x8(%rdi), %rax
14010bd3c:     	movzbl	0x10(%rdi), %ecx
14010bd40:     	movb	$0x1, %dl
14010bd42:     	jmp	0x14010c0c9 <.text+0x10b0c9>
14010bd47:     	movd	0x5833be1(%rip), %xmm6  # 0x14593f930
14010bd4f:     	movdqa	%xmm6, %xmm7
14010bd53:     	movdqa	%xmm6, %xmm8
14010bd58:     	movq	0x520(%rbp), %rsi
14010bd5f:     	movq	0x538(%rbp), %r15
14010bd66:     	movq	0x540(%rbp), %r12
14010bd6d:     	testq	%r15, %r15
14010bd70:     	movq	%r15, %rbx
14010bd73:     	cmoveq	%r12, %rbx
14010bd77:     	movq	(%rbx), %rax
14010bd7a:     	movq	0x10(%rbx), %r13
14010bd7e:     	subq	%r13, %rax
14010bd81:     	cmpq	$0x17, %rax
14010bd85:     	jbe	0x14010c245 <.text+0x10b245>
14010bd8b:     	movq	0x8(%rbx), %rax
14010bd8f:     	leaq	0x6ba9a(%rip), %rcx     # 0x140177830 <.text+0x176830>
14010bd96:     	movq	%rcx, (%rax,%r13)
14010bd9a:     	movq	%rsi, 0x8(%rax,%r13)
14010bd9f:     	movb	$0x1, 0x12(%rax,%r13)
14010bda5:     	movw	$0x200, 0x10(%rax,%r13) # imm = 0x200
14010bdad:     	addq	$0x18, %r13
14010bdb1:     	movq	%r13, 0x10(%rbx)
14010bdb5:     	movq	0x548(%rbp), %rax
14010bdbc:     	movq	%rsi, 0x340(%rbp)
14010bdc3:     	movdqu	0x528(%rbp), %xmm0
14010bdcb:     	movdqu	%xmm0, 0x348(%rbp)
14010bdd3:     	movq	%r15, 0x358(%rbp)
14010bdda:     	movq	%r12, 0x360(%rbp)
14010bde1:     	movq	%rax, 0x368(%rbp)
14010bde8:     	leaq	0x5835319(%rip), %rcx   # 0x145941108
14010bdef:     	movl	$0x8, %edx
14010bdf4:     	callq	0x145457c00 <.text+0x5456c00>
14010bdf9:     	movq	%rax, 0x90(%rbp)
14010be00:     	movq	%rdx, 0x98(%rbp)
14010be07:     	leaq	0x90(%rbp), %rax
14010be0e:     	movq	%rax, 0x5b0(%rbp)
14010be15:     	leaq	-0x109d5c(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14010be1c:     	movq	%rax, 0x5b8(%rbp)
14010be23:     	leaq	0x583485a(%rip), %rdx   # 0x145940684
14010be2a:     	leaq	0x4f0(%rbp), %rcx
14010be31:     	leaq	0x5b0(%rbp), %r8
14010be38:     	callq	0x145728390 <.text+0x5727390>
14010be3d:     	cmpb	$0x1, (%rdi)
14010be40:     	jne	0x14010be68 <.text+0x10ae68>
14010be42:     	movl	0x1(%rdi), %eax
14010be45:     	movl	0x4(%rdi), %ecx
14010be48:     	movl	%ecx, 0x59b(%rbp)
14010be4e:     	movl	%eax, 0x598(%rbp)
14010be54:     	movq	0x8(%rdi), %rax
14010be58:     	movzbl	0x10(%rdi), %ecx
14010be5c:     	movb	$0x1, %r8b
14010be5f:     	movl	0x580d31a(%rip), %r10d  # 0x145919180
14010be66:     	jmp	0x14010be80 <.text+0x10ae80>
14010be68:     	movq	0x8(%rdi), %rax
14010be6c:     	lock
14010be6d:     	incq	(%rax)
14010be70:     	movl	0x580d309(%rip), %r10d  # 0x145919180
14010be77:     	jle	0x14010c243 <.text+0x10b243>
14010be7d:     	xorl	%r8d, %r8d
14010be80:     	leaq	0x348(%rbp), %rdx
14010be87:     	movq	0x500(%rbp), %r9
14010be8e:     	movq	%r9, 0x5c8(%rbp)
14010be95:     	movups	0x4f0(%rbp), %xmm0
14010be9c:     	movups	%xmm0, 0x5b8(%rbp)
14010bea3:     	movups	0x5834822(%rip), %xmm0  # 0x1459406cc
14010beaa:     	movups	%xmm0, 0x841(%rbp)
14010beb1:     	movl	$0x3f800000, 0x851(%rbp) # imm = 0x3F800000
14010bebb:     	movq	$0x0, 0x5d0(%rbp)
14010bec6:     	movq	$0x4, 0x5d8(%rbp)
14010bed1:     	movq	$0x0, 0x5e0(%rbp)
14010bedc:     	movb	%r8b, 0x5e8(%rbp)
14010bee3:     	movl	0x598(%rbp), %r8d
14010beea:     	movl	0x59b(%rbp), %r9d
14010bef1:     	movl	%r8d, 0x5e9(%rbp)
14010bef8:     	movl	%r9d, 0x5ec(%rbp)
14010beff:     	movq	%rax, 0x5f0(%rbp)
14010bf06:     	movq	%rcx, 0x5f8(%rbp)
14010bf0d:     	movl	$0x41400000, 0x600(%rbp) # imm = 0x41400000
14010bf17:     	movw	$0x190, 0x604(%rbp)     # imm = 0x190
14010bf20:     	movb	$0x1, 0x606(%rbp)
14010bf27:     	movq	0x84d(%rbp), %rax
14010bf2e:     	movq	%rax, 0x614(%rbp)
14010bf35:     	movups	0x840(%rbp), %xmm0
14010bf3c:     	movups	%xmm0, 0x607(%rbp)
14010bf43:     	movdqu	0x580d225(%rip), %xmm0  # 0x145919170
14010bf4b:     	movdqu	%xmm0, 0x61c(%rbp)
14010bf53:     	movl	%r10d, 0x62c(%rbp)
14010bf5a:     	movq	%xmm13, 0x630(%rbp)
14010bf63:     	movw	$0x1, 0x638(%rbp)
14010bf6c:     	movq	%rsi, 0x5b0(%rbp)
14010bf73:     	leaq	0x90(%rbp), %rcx
14010bf7a:     	leaq	0x5b0(%rbp), %r8
14010bf81:     	callq	0x1400ebbc0 <.text+0xeabc0>
14010bf86:     	leaq	0x840(%rbp), %rcx
14010bf8d:     	movq	%r14, %rdx
14010bf90:     	callq	0x145728850 <.text+0x5727850>
14010bf95:     	cmpb	$0x1, (%rdi)
14010bf98:     	jne	0x14010bfbf <.text+0x10afbf>
14010bf9a:     	movl	0x1(%rdi), %eax
14010bf9d:     	movl	0x4(%rdi), %ecx
14010bfa0:     	movl	%ecx, 0x4d3(%rbp)
14010bfa6:     	movl	%eax, 0x4d0(%rbp)
14010bfac:     	movq	0x8(%rdi), %rax
14010bfb0:     	movzbl	0x10(%rdi), %ecx
14010bfb4:     	movb	$0x1, %dl
14010bfb6:     	movq	0x578(%rbp), %rsi
14010bfbd:     	jmp	0x14010bfd6 <.text+0x10afd6>
14010bfbf:     	movq	0x8(%rdi), %rax
14010bfc3:     	lock
14010bfc4:     	incq	(%rax)
14010bfc7:     	movq	0x578(%rbp), %rsi
14010bfce:     	jle	0x14010c243 <.text+0x10b243>
14010bfd4:     	xorl	%edx, %edx
14010bfd6:     	movq	0x850(%rbp), %r8
14010bfdd:     	movq	%r8, 0x5c0(%rbp)
14010bfe4:     	movups	0x840(%rbp), %xmm0
14010bfeb:     	movaps	%xmm0, 0x5b0(%rbp)
14010bff2:     	movq	$0x0, 0x5c8(%rbp)
14010bffd:     	movq	$0x4, 0x5d0(%rbp)
14010c008:     	movq	$0x0, 0x5d8(%rbp)
14010c013:     	movb	%dl, 0x5e0(%rbp)
14010c019:     	movl	0x4d0(%rbp), %edx
14010c01f:     	movl	0x4d3(%rbp), %r8d
14010c026:     	movl	%edx, 0x5e1(%rbp)
14010c02c:     	movl	%r8d, 0x5e4(%rbp)
14010c033:     	movq	%rax, 0x5e8(%rbp)
14010c03a:     	movq	%rcx, 0x5f0(%rbp)
14010c041:     	movl	$0x41400000, 0x5f8(%rbp) # imm = 0x41400000
14010c04b:     	movw	$0x190, 0x5fc(%rbp)     # imm = 0x190
14010c054:     	movb	$0x1, 0x5fe(%rbp)
14010c05b:     	movl	$0x0, 0x600(%rbp)
14010c065:     	movd	%xmm6, 0x604(%rbp)
14010c06d:     	movd	%xmm7, 0x608(%rbp)
14010c075:     	movd	%xmm8, 0x60c(%rbp)
14010c07e:     	movl	$0x3f800000, 0x610(%rbp) # imm = 0x3F800000
14010c088:     	leaq	0x90(%rbp), %rcx
14010c08f:     	leaq	0x5b0(%rbp), %rdx
14010c096:     	callq	0x1400f1400 <.text+0xf0400>
14010c09b:     	leaq	0x340(%rbp), %rcx
14010c0a2:     	movq	%rdi, %rdx
14010c0a5:     	movq	0x4c0(%rbp), %r8
14010c0ac:     	movq	%r14, %r9
14010c0af:     	callq	0x1401f9880 <.text+0x1f8880>
14010c0b4:     	jmp	0x14010c1bc <.text+0x10b1bc>
14010c0b9:     	movq	0x8(%rdi), %rax
14010c0bd:     	lock
14010c0be:     	incq	(%rax)
14010c0c1:     	jle	0x14010c243 <.text+0x10b243>
14010c0c7:     	xorl	%edx, %edx
14010c0c9:     	movups	0x58345fc(%rip), %xmm0  # 0x1459406cc
14010c0d0:     	movups	%xmm0, 0x341(%rbp)
14010c0d7:     	movl	$0x3f800000, 0x351(%rbp) # imm = 0x3F800000
14010c0e1:     	movups	0x90(%rbp), %xmm0
14010c0e8:     	movaps	%xmm0, 0x5b0(%rbp)
14010c0ef:     	movq	0xa0(%rbp), %r8
14010c0f6:     	movq	%r8, 0x5c0(%rbp)
14010c0fd:     	movq	$0x0, 0x5c8(%rbp)
14010c108:     	movq	$0x4, 0x5d0(%rbp)
14010c113:     	movq	$0x0, 0x5d8(%rbp)
14010c11e:     	movb	%dl, 0x5e0(%rbp)
14010c124:     	movl	0x840(%rbp), %edx
14010c12a:     	movl	0x843(%rbp), %r8d
14010c131:     	movl	%edx, 0x5e1(%rbp)
14010c137:     	movl	%r8d, 0x5e4(%rbp)
14010c13e:     	movq	%rax, 0x5e8(%rbp)
14010c145:     	movq	%rcx, 0x5f0(%rbp)
14010c14c:     	movl	$0x41400000, 0x5f8(%rbp) # imm = 0x41400000
14010c156:     	movw	$0x190, 0x5fc(%rbp)     # imm = 0x190
14010c15f:     	movb	$0x1, 0x5fe(%rbp)
14010c166:     	movq	0x34d(%rbp), %rax
14010c16d:     	movq	%rax, 0x60c(%rbp)
14010c174:     	movups	0x340(%rbp), %xmm0
14010c17b:     	movups	%xmm0, 0x5ff(%rbp)
14010c182:     	movups	0x580cfe7(%rip), %xmm0  # 0x145919170
14010c189:     	movups	%xmm0, 0x614(%rbp)
14010c190:     	movl	%r13d, 0x624(%rbp)
14010c197:     	movq	%xmm13, 0x628(%rbp)
14010c1a0:     	movw	$0x1, 0x630(%rbp)
14010c1a9:     	leaq	0x520(%rbp), %rcx
14010c1b0:     	leaq	0x5b0(%rbp), %rdx
14010c1b7:     	callq	0x1400f1de0 <.text+0xf0de0>
14010c1bc:     	movq	%rsi, %rax
14010c1bf:     	movaps	0x880(%rbp), %xmm6
14010c1c6:     	movaps	0x890(%rbp), %xmm7
14010c1cd:     	movaps	0x8a0(%rbp), %xmm8
14010c1d5:     	movaps	0x8b0(%rbp), %xmm9
14010c1dd:     	movaps	0x8c0(%rbp), %xmm10
14010c1e5:     	movaps	0x8d0(%rbp), %xmm11
14010c1ed:     	movaps	0x8e0(%rbp), %xmm12
14010c1f5:     	movaps	0x8f0(%rbp), %xmm13
14010c1fd:     	movaps	0x900(%rbp), %xmm14
14010c205:     	movaps	0x910(%rbp), %xmm15
14010c20d:     	addq	$0x9a8, %rsp            # imm = 0x9A8
14010c214:     	popq	%rbx
14010c215:     	popq	%rdi
14010c216:     	popq	%rsi
14010c217:     	popq	%r12
14010c219:     	popq	%r13
14010c21b:     	popq	%r14
14010c21d:     	popq	%r15
14010c21f:     	popq	%rbp
14010c220:     	retq
14010c221:     	movl	$0x4, %ecx
14010c226:     	movl	$0x40, %edx
14010c22b:     	callq	0x145903781 <.text+0x5902781>
14010c230:     	nop
14010c231:     	jmp	0x14010c243 <.text+0x10b243>
14010c233:     	movl	$0x8, %ecx
14010c238:     	movl	$0x48, %edx
14010c23d:     	callq	0x145903781 <.text+0x5902781>
14010c242:     	nop
14010c243:     	ud2
14010c245:     	movq	$0x1, 0x20(%rsp)
14010c24e:     	movl	$0x18, %r8d
14010c254:     	movl	$0x1, %r9d
14010c25a:     	movq	%rbx, %rcx
14010c25d:     	movq	%r13, %rdx
14010c260:     	callq	0x1457744b0 <.text+0x57734b0>
14010c265:     	jmp	0x14010bd8b <.text+0x10ad8b>
14010c26a:     	je	0x14010c2b7 <.text+0x10b2b7>
14010c26c:     	movq	%rdx, %r14
14010c26f:     	movq	0x10(%rax), %r12
14010c273:     	callq	0x140002200 <.text+0x1200>
14010c278:     	movl	$0x1, %edx
14010c27d:     	movq	%r14, %rcx
14010c280:     	callq	0x1400021c0 <.text+0x11c0>
14010c285:     	movq	%r14, %rdx
14010c288:     	movl	$0x1, %ecx
14010c28d:     	testq	%rax, %rax
14010c290:     	je	0x14010aee5 <.text+0x109ee5>
14010c296:     	movq	%rax, %r15
14010c299:     	movq	%rax, %rcx
14010c29c:     	movq	%rdx, %rsi
14010c29f:     	movq	%r12, %rdx
14010c2a2:     	movq	%rsi, %r8
14010c2a5:     	callq	0x1457731ed <.text+0x57721ed>
14010c2aa:     	cmpq	$0x8, %rsi
14010c2ae:     	jae	0x14010c305 <.text+0x10b305>
14010c2b0:     	xorl	%eax, %eax
14010c2b2:     	jmp	0x14010c402 <.text+0x10b402>
14010c2b7:     	xorl	%r8d, %r8d
14010c2ba:     	movl	0x580cebf(%rip), %r13d  # 0x145919180
14010c2c1:     	movq	0x5809506(%rip), %xmm13 # 0x1459157d0
14010c2ca:     	movaps	0x580962e(%rip), %xmm14 # 0x145915900
14010c2d2:     	movups	0x583444e(%rip), %xmm11 # 0x145940728
14010c2da:     	movups	0x5834476(%rip), %xmm12 # 0x145940758
14010c2e2:     	movups	0x583450e(%rip), %xmm15 # 0x1459407f8
14010c2ea:     	movdqu	0x58344f5(%rip), %xmm8  # 0x1459407e8
14010c2f3:     	movdqa	0x57fb1c5(%rip), %xmm6  # 0x1459074c0
14010c2fb:     	movl	$0x1, %edx
14010c300:     	jmp	0x14010aef3 <.text+0x109ef3>
14010c305:     	cmpq	$0x20, %r14
14010c309:     	jae	0x14010c312 <.text+0x10b312>
14010c30b:     	xorl	%eax, %eax
14010c30d:     	jmp	0x14010c3a7 <.text+0x10b3a7>
14010c312:     	movabsq	$0x7fffffffffffffe0, %rax # imm = 0x7FFFFFFFFFFFFFE0
14010c31c:     	andq	%r14, %rax
14010c31f:     	xorl	%ecx, %ecx
14010c321:     	movdqa	0x5833817(%rip), %xmm6  # 0x14593fb40
14010c329:     	movdqa	0x57fdb0f(%rip), %xmm1  # 0x145909e40
14010c331:     	movdqa	0x57fdb17(%rip), %xmm2  # 0x145909e50
14010c339:     	movdqu	(%r15,%rcx), %xmm0
14010c33f:     	movdqu	0x10(%r15,%rcx), %xmm4
14010c346:     	movdqa	%xmm0, %xmm3
14010c34a:     	paddb	%xmm6, %xmm3
14010c34e:     	movdqa	%xmm4, %xmm13
14010c353:     	paddb	%xmm6, %xmm13
14010c358:     	movdqa	%xmm3, %xmm5
14010c35c:     	pminub	%xmm1, %xmm5
14010c360:     	pcmpeqb	%xmm3, %xmm5
14010c364:     	pand	%xmm2, %xmm5
14010c368:     	movdqa	%xmm13, %xmm3
14010c36d:     	pminub	%xmm1, %xmm3
14010c371:     	pcmpeqb	%xmm13, %xmm3
14010c376:     	pand	%xmm2, %xmm3
14010c37a:     	pxor	%xmm0, %xmm5
14010c37e:     	pxor	%xmm4, %xmm3
14010c382:     	movdqu	%xmm5, (%r15,%rcx)
14010c388:     	movdqu	%xmm3, 0x10(%r15,%rcx)
14010c38f:     	addq	$0x20, %rcx
14010c393:     	cmpq	%rcx, %rax
14010c396:     	jne	0x14010c339 <.text+0x10b339>
14010c398:     	cmpq	%rax, %r14
14010c39b:     	je	0x14010c421 <.text+0x10b421>
14010c3a1:     	testb	$0x18, %r14b
14010c3a5:     	je	0x14010c402 <.text+0x10b402>
14010c3a7:     	movq	%rax, %rcx
14010c3aa:     	movabsq	$0x7ffffffffffffff8, %rax # imm = 0x7FFFFFFFFFFFFFF8
14010c3b4:     	andq	%r14, %rax
14010c3b7:     	movdqa	0x5833791(%rip), %xmm0  # 0x14593fb50
14010c3bf:     	movdqa	0x57fdaa9(%rip), %xmm1  # 0x145909e70
14010c3c7:     	movdqa	0x57fdab1(%rip), %xmm2  # 0x145909e80
14010c3cf:     	movq	(%r15,%rcx), %xmm3
14010c3d5:     	movdqa	%xmm3, %xmm4
14010c3d9:     	paddb	%xmm0, %xmm4
14010c3dd:     	movdqa	%xmm4, %xmm5
14010c3e1:     	pmaxub	%xmm1, %xmm5
14010c3e5:     	pcmpeqb	%xmm4, %xmm5
14010c3e9:     	pandn	%xmm2, %xmm5
14010c3ed:     	pxor	%xmm3, %xmm5
14010c3f1:     	movq	%xmm5, (%r15,%rcx)
14010c3f7:     	addq	$0x8, %rcx
14010c3fb:     	cmpq	%rcx, %rax
14010c3fe:     	jne	0x14010c3cf <.text+0x10b3cf>
14010c400:     	jmp	0x14010c41c <.text+0x10b41c>
14010c402:     	movzbl	(%r15,%rax), %ecx
14010c407:     	leal	-0x61(%rcx), %edx
14010c40a:     	cmpb	$0x1a, %dl
14010c40d:     	setb	%dl
14010c410:     	shlb	$0x5, %dl
14010c413:     	xorb	%cl, %dl
14010c415:     	movb	%dl, (%r15,%rax)
14010c419:     	incq	%rax
14010c41c:     	cmpq	%rax, %r14
14010c41f:     	jne	0x14010c402 <.text+0x10b402>
14010c421:     	movl	0x580cd58(%rip), %r13d  # 0x145919180
14010c428:     	movq	0x580939f(%rip), %xmm13 # 0x1459157d0
14010c431:     	movaps	0x58094c7(%rip), %xmm14 # 0x145915900
14010c439:     	movups	0x58342e7(%rip), %xmm11 # 0x145940728
14010c441:     	movups	0x583430f(%rip), %xmm12 # 0x145940758
14010c449:     	movups	0x58343a7(%rip), %xmm15 # 0x1459407f8
14010c451:     	movdqu	0x583438e(%rip), %xmm8  # 0x1459407e8
14010c45a:     	movdqa	0x57fb05e(%rip), %xmm6  # 0x1459074c0
14010c462:     	movq	%r14, %r8
14010c465:     	movq	%r15, %rdx
14010c468:     	jmp	0x14010aef3 <.text+0x109ef3>

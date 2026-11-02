
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543e970:     	pushq	%rbp
14543e971:     	pushq	%r15
14543e973:     	pushq	%r14
14543e975:     	pushq	%r13
14543e977:     	pushq	%r12
14543e979:     	pushq	%rsi
14543e97a:     	pushq	%rdi
14543e97b:     	pushq	%rbx
14543e97c:     	subq	$0xcd8, %rsp            # imm = 0xCD8
14543e983:     	leaq	0x80(%rsp), %rbp
14543e98b:     	movaps	%xmm6, 0xc40(%rbp)
14543e992:     	movq	$-0x2, 0xc38(%rbp)
14543e99d:     	movq	%rcx, %rdi
14543e9a0:     	cmpq	$-0x1, 0xd80(%rdx)
14543e9a8:     	je	0x14543ea22 <.text+0x543da22>
14543e9aa:     	movq	%rdx, %rbx
14543e9ad:     	addq	$0xd80, %rdx            # imm = 0xD80
14543e9b4:     	movq	0xe88(%rbx), %rax
14543e9bb:     	movq	%rax, 0xc20(%rbp)
14543e9c2:     	movzbl	0xeec(%rbx), %r14d
14543e9ca:     	movzbl	0xeed(%rbx), %r15d
14543e9d2:     	movzbl	0xeee(%rbx), %r13d
14543e9da:     	leaq	-0x40(%rbp), %rcx
14543e9de:     	callq	0x14570c440 <.text+0x570b440>
14543e9e3:     	movq	0xda8(%rbx), %rsi
14543e9ea:     	movq	%rsi, %r12
14543e9ed:     	shlq	$0x4, %r12
14543e9f1:     	movq	%rsi, %rax
14543e9f4:     	shrq	$0x3c, %rax
14543e9f8:     	setne	%al
14543e9fb:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
14543ea05:     	cmpq	%rcx, %r12
14543ea08:     	seta	%cl
14543ea0b:     	orb	%al, %cl
14543ea0d:     	je	0x14543ea2e <.text+0x543da2e>
14543ea0f:     	xorl	%ebx, %ebx
14543ea11:     	movq	%rbx, %rcx
14543ea14:     	movq	%r12, %rdx
14543ea17:     	callq	0x1458e721b <.text+0x58e621b>
14543ea1c:     	nop
14543ea1d:     	jmp	0x14543f178 <.text+0x543e178>
14543ea22:     	movq	$0x2, (%rdi)
14543ea29:     	jmp	0x14543f14d <.text+0x543e14d>
14543ea2e:     	movb	%r13b, 0xc36(%rbp)
14543ea35:     	movb	%r15b, 0xc35(%rbp)
14543ea3c:     	movb	%r14b, 0xc34(%rbp)
14543ea43:     	movq	%rdi, 0xc28(%rbp)
14543ea4a:     	movq	0xe78(%rbx), %rdi
14543ea51:     	movq	0xe80(%rbx), %r14
14543ea58:     	movq	%rbx, 0xc18(%rbp)
14543ea5f:     	movq	0xda0(%rbx), %r13
14543ea66:     	testq	%r12, %r12
14543ea69:     	je	0x14543ecb4 <.text+0x543dcb4>
14543ea6f:     	callq	0x140002200 <.text+0x1200>
14543ea74:     	movl	$0x8, %ebx
14543ea79:     	movl	$0x8, %edx
14543ea7e:     	movq	%r12, %rcx
14543ea81:     	callq	0x1400021c0 <.text+0x11c0>
14543ea86:     	testq	%rax, %rax
14543ea89:     	je	0x14543ea11 <.text+0x543da11>
14543ea8b:     	movq	%rax, %r15
14543ea8e:     	movq	%rsi, %rbx
14543ea91:     	testq	%rsi, %rsi
14543ea94:     	je	0x14543eaa4 <.text+0x543daa4>
14543ea96:     	movq	%r15, %rcx
14543ea99:     	movq	%r13, %rdx
14543ea9c:     	movq	%r12, %r8
14543ea9f:     	callq	0x145756ddd <.text+0x5755ddd>
14543eaa4:     	movq	0xc18(%rbp), %r13
14543eaab:     	leaq	0xdb0(%r13), %rdx
14543eab2:     	movq	0xe98(%r13), %r12
14543eab9:     	movups	0xe48(%r13), %xmm0
14543eac1:     	movups	0xe58(%r13), %xmm1
14543eac9:     	movups	0xe68(%r13), %xmm2
14543ead1:     	movups	%xmm2, 0xa08(%rbp)
14543ead8:     	movups	%xmm1, 0x9f8(%rbp)
14543eadf:     	movups	%xmm0, 0x9e8(%rbp)
14543eae6:     	movzbl	0xef3(%r13), %eax
14543eaee:     	movb	%al, 0xa93(%rbp)
14543eaf4:     	movl	0xeef(%r13), %eax
14543eafb:     	movl	%eax, 0xa8f(%rbp)
14543eb01:     	movups	-0x40(%rbp), %xmm0
14543eb05:     	movaps	%xmm0, 0x920(%rbp)
14543eb0c:     	movq	-0x30(%rbp), %rax
14543eb10:     	movq	%rax, 0x930(%rbp)
14543eb17:     	movups	0xea0(%r13), %xmm0
14543eb1f:     	movups	0xeb0(%r13), %xmm1
14543eb27:     	movups	0xec0(%r13), %xmm2
14543eb2f:     	movups	0xed0(%r13), %xmm3
14543eb37:     	movaps	%xmm0, 0xa40(%rbp)
14543eb3e:     	movaps	%xmm1, 0xa50(%rbp)
14543eb45:     	movaps	%xmm2, 0xa60(%rbp)
14543eb4c:     	movaps	%xmm3, 0xa70(%rbp)
14543eb53:     	movups	0xedc(%r13), %xmm0
14543eb5b:     	movups	%xmm0, 0xa7c(%rbp)
14543eb62:     	leaq	0x950(%rbp), %rcx
14543eb69:     	movl	$0x98, %r8d
14543eb6f:     	callq	0x145756ddd <.text+0x5755ddd>
14543eb74:     	movq	%rbx, 0x938(%rbp)
14543eb7b:     	movq	%r15, 0x940(%rbp)
14543eb82:     	movq	%rsi, 0x948(%rbp)
14543eb89:     	movq	%rdi, 0xa18(%rbp)
14543eb90:     	movq	%r14, 0xa20(%rbp)
14543eb97:     	movq	0xc20(%rbp), %rax
14543eb9e:     	movq	%rax, 0xa28(%rbp)
14543eba5:     	movq	%r12, 0xa38(%rbp)
14543ebac:     	movzbl	0xc34(%rbp), %r15d
14543ebb4:     	movb	%r15b, 0xa8c(%rbp)
14543ebbb:     	movzbl	0xc35(%rbp), %eax
14543ebc2:     	movb	%al, 0xa8d(%rbp)
14543ebc8:     	movzbl	0xc36(%rbp), %eax
14543ebcf:     	movb	%al, 0xa8e(%rbp)
14543ebd5:     	movabsq	$0x5851f42d4c957f2d, %rax # imm = 0x5851F42D4C957F2D
14543ebdf:     	imulq	0xf80(%r13), %rax
14543ebe7:     	movabsq	$0x14057b7ef767814f, %rcx # imm = 0x14057B7EF767814F
14543ebf1:     	addq	%rax, %rcx
14543ebf4:     	movq	%rcx, 0xf80(%r13)
14543ebfb:     	movq	%rcx, 0xa30(%rbp)
14543ec02:     	movq	%rdi, %rcx
14543ec05:     	movq	%r14, %rdx
14543ec08:     	callq	0x14540e820 <.text+0x540d820>
14543ec0d:     	imulq	$0xf0, %rax, %rax
14543ec14:     	leaq	0x12d781d(%rip), %rbx   # 0x146716438
14543ec1b:     	addq	%rax, %rbx
14543ec1e:     	leaq	0xf68(%r13), %rdi
14543ec25:     	movq	0xf68(%r13), %rax
14543ec2c:     	testq	%rax, %rax
14543ec2f:     	je	0x14543ecca <.text+0x543dcca>
14543ec35:     	movl	0xf58(%r13), %ecx
14543ec3c:     	movl	0xc0(%rbx), %r14d
14543ec43:     	cmpl	%r14d, %ecx
14543ec46:     	movq	0xc28(%rbp), %rsi
14543ec4d:     	jne	0x14543ecf3 <.text+0x543dcf3>
14543ec53:     	movss	0xf5c(%r13), %xmm0
14543ec5c:     	ucomiss	0xc8(%rbx), %xmm0
14543ec63:     	jne	0x14543ecf0 <.text+0x543dcf0>
14543ec69:     	jp	0x14543ecf0 <.text+0x543dcf0>
14543ec6f:     	movss	0xf60(%r13), %xmm0
14543ec78:     	ucomiss	0xcc(%rbx), %xmm0
14543ec7f:     	jne	0x14543ed45 <.text+0x543dd45>
14543ec85:     	jp	0x14543ed45 <.text+0x543dd45>
14543ec8b:     	movss	0xf64(%r13), %xmm0
14543ec94:     	ucomiss	0xd0(%rbx), %xmm0
14543ec9b:     	movl	%ecx, %r14d
14543ec9e:     	jne	0x14543ecf3 <.text+0x543dcf3>
14543eca0:     	jp	0x14543ecf3 <.text+0x543dcf3>
14543eca2:     	lock
14543eca3:     	incq	(%rax)
14543eca6:     	jle	0x14543f178 <.text+0x543e178>
14543ecac:     	movq	(%rdi), %rdi
14543ecaf:     	jmp	0x14543eed1 <.text+0x543ded1>
14543ecb4:     	movl	$0x8, %r15d
14543ecba:     	xorl	%ebx, %ebx
14543ecbc:     	testq	%rsi, %rsi
14543ecbf:     	jne	0x14543ea96 <.text+0x543da96>
14543ecc5:     	jmp	0x14543eaa4 <.text+0x543daa4>
14543ecca:     	movl	0xc0(%rbx), %r14d
14543ecd1:     	movq	0xc28(%rbp), %rsi
14543ecd8:     	leaq	0x12e28e4(%rip), %rdx   # 0x1467215c3
14543ecdf:     	movl	$0x9, %r8d
14543ece5:     	cmpl	$0xbc, %r14d
14543ecec:     	jle	0x14543ed09 <.text+0x543dd09>
14543ecee:     	jmp	0x14543ed5e <.text+0x543dd5e>
14543ecf0:     	movl	%ecx, %r14d
14543ecf3:     	leaq	0x12e28c9(%rip), %rdx   # 0x1467215c3
14543ecfa:     	movl	$0x9, %r8d
14543ed00:     	cmpl	$0xbc, %r14d
14543ed07:     	jg	0x14543ed5e <.text+0x543dd5e>
14543ed09:     	testl	%r14d, %r14d
14543ed0c:     	je	0x14543ed27 <.text+0x543dd27>
14543ed0e:     	cmpl	$0x1, %r14d
14543ed12:     	je	0x14543ed36 <.text+0x543dd36>
14543ed14:     	cmpl	$0x1e, %r14d
14543ed18:     	jne	0x14543ed9e <.text+0x543dd9e>
14543ed1e:     	leaq	0x12e2895(%rip), %rdx   # 0x1467215ba
14543ed25:     	jmp	0x14543ed9e <.text+0x543dd9e>
14543ed27:     	leaq	0x12e285c(%rip), %rdx   # 0x14672158a
14543ed2e:     	movl	$0x7, %r8d
14543ed34:     	jmp	0x14543ed9e <.text+0x543dd9e>
14543ed36:     	leaq	0x12e2854(%rip), %rdx   # 0x146721591
14543ed3d:     	movl	$0x8, %r8d
14543ed43:     	jmp	0x14543ed9e <.text+0x543dd9e>
14543ed45:     	movl	%ecx, %r14d
14543ed48:     	leaq	0x12e2874(%rip), %rdx   # 0x1467215c3
14543ed4f:     	movl	$0x9, %r8d
14543ed55:     	cmpl	$0xbc, %r14d
14543ed5c:     	jle	0x14543ed09 <.text+0x543dd09>
14543ed5e:     	cmpl	$0xbd, %r14d
14543ed65:     	je	0x14543ed88 <.text+0x543dd88>
14543ed67:     	cmpl	$0x211, %r14d           # imm = 0x211
14543ed6e:     	je	0x14543ed97 <.text+0x543dd97>
14543ed70:     	cmpl	$0x215, %r14d           # imm = 0x215
14543ed77:     	jne	0x14543ed9e <.text+0x543dd9e>
14543ed79:     	leaq	0x12e282b(%rip), %rdx   # 0x1467215ab
14543ed80:     	movl	$0xf, %r8d
14543ed86:     	jmp	0x14543ed9e <.text+0x543dd9e>
14543ed88:     	leaq	0x12e280a(%rip), %rdx   # 0x146721599
14543ed8f:     	movl	$0x12, %r8d
14543ed95:     	jmp	0x14543ed9e <.text+0x543dd9e>
14543ed97:     	leaq	0x12e282e(%rip), %rdx   # 0x1467215cc
14543ed9e:     	movl	0xd0(%rbx), %eax
14543eda4:     	movl	%eax, 0xaa8(%rbp)
14543edaa:     	movq	0xc8(%rbx), %rax
14543edb1:     	movss	0xd8(%rbx), %xmm0
14543edb9:     	addss	0x4ba1df(%rip), %xmm0   # 0x1458f8fa0
14543edc1:     	movq	%rax, 0xaa0(%rbp)
14543edc8:     	movq	0x60(%rbx), %rax
14543edcc:     	cmpb	$0x0, 0xe8(%rbx)
14543edd3:     	je	0x14543eddb <.text+0x543dddb>
14543edd5:     	movq	0x58(%rbx), %r9
14543edd9:     	jmp	0x14543edde <.text+0x543ddde>
14543eddb:     	xorl	%r9d, %r9d
14543edde:     	leaq	-0x30(%rbp), %rcx
14543ede2:     	movb	$0x1, 0xc37(%rbp)
14543ede9:     	movq	%rax, 0x30(%rsp)
14543edee:     	movq	%r9, 0x28(%rsp)
14543edf3:     	movss	%xmm0, 0x20(%rsp)
14543edf9:     	leaq	0xaa0(%rbp), %r9
14543ee00:     	callq	0x145460720 <.text+0x545f720>
14543ee05:     	nop
14543ee06:     	movq	$0x1, -0x40(%rbp)
14543ee0e:     	movq	$0x1, -0x38(%rbp)
14543ee16:     	callq	0x140002200 <.text+0x1200>
14543ee1b:     	movl	$0x98, %ecx
14543ee20:     	movl	$0x8, %edx
14543ee25:     	callq	0x1400021c0 <.text+0x11c0>
14543ee2a:     	testq	%rax, %rax
14543ee2d:     	je	0x14543f168 <.text+0x543e168>
14543ee33:     	movq	%rax, %r12
14543ee36:     	movl	%r14d, 0xc20(%rbp)
14543ee3d:     	leaq	-0x40(%rbp), %rdx
14543ee41:     	movl	$0x98, %r8d
14543ee47:     	movq	%rax, %rcx
14543ee4a:     	callq	0x145756ddd <.text+0x5755ddd>
14543ee4f:     	movq	%r12, 0xaa0(%rbp)
14543ee56:     	movq	%r12, 0xc28(%rbp)
14543ee5d:     	lock
14543ee5e:     	incq	(%r12)
14543ee62:     	jle	0x14543f178 <.text+0x543e178>
14543ee68:     	addq	$0xc8, %rbx
14543ee6f:     	movl	0x8(%rbx), %eax
14543ee72:     	movl	%eax, -0x38(%rbp)
14543ee75:     	movq	(%rbx), %rax
14543ee78:     	movq	%rax, -0x40(%rbp)
14543ee7c:     	movq	(%rdi), %rax
14543ee7f:     	testq	%rax, %rax
14543ee82:     	je	0x14543ee93 <.text+0x543de93>
14543ee84:     	lock
14543ee85:     	decq	(%rax)
14543ee88:     	jne	0x14543ee93 <.text+0x543de93>
14543ee8a:     	movq	%rdi, %rcx
14543ee8d:     	callq	0x145416f10 <.text+0x5415f10>
14543ee92:     	nop
14543ee93:     	movq	0xc18(%rbp), %r13
14543ee9a:     	movl	0xc20(%rbp), %eax
14543eea0:     	movl	%eax, 0xf58(%r13)
14543eea7:     	movq	-0x40(%rbp), %rax
14543eeab:     	movq	%rax, 0xf5c(%r13)
14543eeb2:     	movl	-0x38(%rbp), %eax
14543eeb5:     	movl	%eax, 0xf64(%r13)
14543eebc:     	movq	0xc28(%rbp), %rax
14543eec3:     	movq	%rax, 0xf68(%r13)
14543eeca:     	movq	0xaa0(%rbp), %rdi
14543eed1:     	leaq	0xaa0(%rbp), %rbx
14543eed8:     	leaq	0x920(%rbp), %rdx
14543eedf:     	movl	$0x178, %r8d            # imm = 0x178
14543eee5:     	movq	%rbx, %rcx
14543eee8:     	callq	0x145756ddd <.text+0x5755ddd>
14543eeed:     	movb	$0x0, 0xc37(%rbp)
14543eef4:     	leaq	-0x40(%rbp), %rcx
14543eef8:     	movq	%rbx, %rdx
14543eefb:     	movq	%rdi, %r8
14543eefe:     	callq	0x14549bb90 <.text+0x549ab90>
14543ef03:     	nop
14543ef04:     	movq	0xef8(%r13), %rcx
14543ef0b:     	movq	0xf00(%r13), %rax
14543ef12:     	callq	*0x40(%rax)
14543ef15:     	nop
14543ef16:     	movb	%al, 0x910(%rbp)
14543ef1c:     	movzbl	0xfcb(%r13), %eax
14543ef24:     	movb	%al, 0x915(%rbp)
14543ef2a:     	leaq	0x12e26a4(%rip), %rdx   # 0x1467215d5
14543ef31:     	leaq	0xaa0(%rbp), %rcx
14543ef38:     	movl	$0x13, %r8d
14543ef3e:     	callq	0x1456fcac0 <.text+0x56fbac0>
14543ef43:     	nop
14543ef44:     	movq	0xaa0(%rbp), %rdx
14543ef4b:     	cmpq	$-0x2, %rdx
14543ef4f:     	jne	0x14543ef85 <.text+0x543df85>
14543ef51:     	cmpq	$0x1, 0xab8(%rbp)
14543ef59:     	jne	0x14543ef85 <.text+0x543df85>
14543ef5b:     	movq	0xab0(%rbp), %rax
14543ef62:     	cmpb	$0x31, (%rax)
14543ef65:     	sete	%dil
14543ef69:     	sete	0x917(%rbp)
14543ef70:     	movq	0xaa8(%rbp), %rdx
14543ef77:     	testq	%rdx, %rdx
14543ef7a:     	je	0x14543efb4 <.text+0x543dfb4>
14543ef7c:     	leaq	0xab0(%rbp), %rax
14543ef83:     	jmp	0x14543efa5 <.text+0x543dfa5>
14543ef85:     	movb	$0x0, 0x917(%rbp)
14543ef8c:     	xorl	%edi, %edi
14543ef8e:     	leaq	0x1(%rdx), %rax
14543ef92:     	cmpq	$0x2, %rax
14543ef96:     	jb	0x14543efb4 <.text+0x543dfb4>
14543ef98:     	cmpq	$-0x2, %rdx
14543ef9c:     	je	0x14543ef70 <.text+0x543df70>
14543ef9e:     	leaq	0xaa8(%rbp), %rax
14543efa5:     	movq	(%rax), %rcx
14543efa8:     	movl	$0x1, %r8d
14543efae:     	callq	0x1400021d0 <.text+0x11d0>
14543efb3:     	nop
14543efb4:     	leaq	0x12e262d(%rip), %rdx   # 0x1467215e8
14543efbb:     	leaq	0xaa0(%rbp), %rcx
14543efc2:     	movl	$0x12, %r8d
14543efc8:     	callq	0x1456fcac0 <.text+0x56fbac0>
14543efcd:     	nop
14543efce:     	movq	0xaa0(%rbp), %rdx
14543efd5:     	cmpq	$-0x2, %rdx
14543efd9:     	jne	0x14543f00e <.text+0x543e00e>
14543efdb:     	cmpq	$0x1, 0xab8(%rbp)
14543efe3:     	jne	0x14543f00e <.text+0x543e00e>
14543efe5:     	movq	0xab0(%rbp), %rax
14543efec:     	cmpb	$0x31, (%rax)
14543efef:     	sete	%bl
14543eff2:     	sete	0x918(%rbp)
14543eff9:     	movq	0xaa8(%rbp), %rdx
14543f000:     	testq	%rdx, %rdx
14543f003:     	je	0x14543f03d <.text+0x543e03d>
14543f005:     	leaq	0xab0(%rbp), %rax
14543f00c:     	jmp	0x14543f02e <.text+0x543e02e>
14543f00e:     	movb	$0x0, 0x918(%rbp)
14543f015:     	xorl	%ebx, %ebx
14543f017:     	leaq	0x1(%rdx), %rax
14543f01b:     	cmpq	$0x2, %rax
14543f01f:     	jb	0x14543f03d <.text+0x543e03d>
14543f021:     	cmpq	$-0x2, %rdx
14543f025:     	je	0x14543eff9 <.text+0x543dff9>
14543f027:     	leaq	0xaa8(%rbp), %rax
14543f02e:     	movq	(%rax), %rcx
14543f031:     	movl	$0x1, %r8d
14543f037:     	callq	0x1400021d0 <.text+0x11d0>
14543f03c:     	nop
14543f03d:     	leaq	0x12e25b6(%rip), %rdx   # 0x1467215fa
14543f044:     	leaq	0xaa0(%rbp), %rcx
14543f04b:     	movl	$0x14, %r8d
14543f051:     	callq	0x1456fcac0 <.text+0x56fbac0>
14543f056:     	nop
14543f057:     	movq	0xaa0(%rbp), %rdx
14543f05e:     	cmpq	$-0x2, %rdx
14543f062:     	jne	0x14543f094 <.text+0x543e094>
14543f064:     	cmpq	$0x1, 0xab8(%rbp)
14543f06c:     	jne	0x14543f094 <.text+0x543e094>
14543f06e:     	movq	0xab0(%rbp), %rax
14543f075:     	cmpb	$0x31, (%rax)
14543f078:     	sete	0x919(%rbp)
14543f07f:     	movq	0xaa8(%rbp), %rdx
14543f086:     	testq	%rdx, %rdx
14543f089:     	je	0x14543f0c0 <.text+0x543e0c0>
14543f08b:     	leaq	0xab0(%rbp), %rax
14543f092:     	jmp	0x14543f0b2 <.text+0x543e0b2>
14543f094:     	movb	$0x0, 0x919(%rbp)
14543f09b:     	leaq	0x1(%rdx), %rax
14543f09f:     	cmpq	$0x2, %rax
14543f0a3:     	jb	0x14543f0c0 <.text+0x543e0c0>
14543f0a5:     	cmpq	$-0x2, %rdx
14543f0a9:     	je	0x14543f07f <.text+0x543e07f>
14543f0ab:     	leaq	0xaa8(%rbp), %rax
14543f0b2:     	movq	(%rax), %rcx
14543f0b5:     	movl	$0x1, %r8d
14543f0bb:     	callq	0x1400021d0 <.text+0x11d0>
14543f0c0:     	orb	%dil, %bl
14543f0c3:     	movb	%bl, 0x917(%rbp)
14543f0c9:     	movb	$0x0, 0xfca(%r13)
14543f0d1:     	xorps	%xmm6, %xmm6
14543f0d4:     	movups	%xmm6, 0xf10(%r13)
14543f0dc:     	movups	%xmm6, 0xf20(%r13)
14543f0e4:     	movups	%xmm6, 0xf30(%r13)
14543f0ec:     	movq	$0x0, 0xf40(%r13)
14543f0f7:     	xorps	%xmm0, %xmm0
14543f0fa:     	cmpq	$0xffffff, 0xf08(%r13)  # imm = 0xFFFFFF
14543f105:     	je	0x14543f117 <.text+0x543e117>
14543f107:     	leaq	0x9b8(%r13), %rcx
14543f10e:     	movl	%r15d, %edx
14543f111:     	callq	0x145470ca0 <.text+0x546fca0>
14543f116:     	nop
14543f117:     	movss	%xmm0, 0xf88(%r13)
14543f120:     	movb	$-0x1, 0xfcc(%r13)
14543f128:     	movups	%xmm6, 0xf8c(%r13)
14543f130:     	movl	$0x0, 0xf9c(%r13)
14543f13b:     	leaq	-0x40(%rbp), %rdx
14543f13f:     	movl	$0x960, %r8d            # imm = 0x960
14543f145:     	movq	%rsi, %rcx
14543f148:     	callq	0x145756ddd <.text+0x5755ddd>
14543f14d:     	movaps	0xc40(%rbp), %xmm6
14543f154:     	addq	$0xcd8, %rsp            # imm = 0xCD8
14543f15b:     	popq	%rbx
14543f15c:     	popq	%rdi
14543f15d:     	popq	%rsi
14543f15e:     	popq	%r12
14543f160:     	popq	%r13
14543f162:     	popq	%r14
14543f164:     	popq	%r15
14543f166:     	popq	%rbp
14543f167:     	retq
14543f168:     	movl	$0x8, %ecx
14543f16d:     	movl	$0x98, %edx
14543f172:     	callq	0x1458e7201 <.text+0x58e6201>
14543f177:     	nop
14543f178:     	ud2

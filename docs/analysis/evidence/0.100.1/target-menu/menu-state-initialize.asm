
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543edf0:     	pushq	%rbp
14543edf1:     	pushq	%r14
14543edf3:     	pushq	%rsi
14543edf4:     	pushq	%rdi
14543edf5:     	pushq	%rbx
14543edf6:     	subq	$0x2f0, %rsp            # imm = 0x2F0
14543edfd:     	leaq	0x80(%rsp), %rbp
14543ee05:     	movq	$-0x2, 0x268(%rbp)
14543ee10:     	movq	%r9, 0x260(%rbp)
14543ee17:     	movq	%r8, 0x250(%rbp)
14543ee1e:     	movq	%rdx, 0x258(%rbp)
14543ee25:     	movq	%rcx, %rsi
14543ee28:     	leaq	-0x58(%rbp), %rcx
14543ee2c:     	callq	0x14542f910 <.text+0x542e910>
14543ee31:     	nop
14543ee32:     	leaq	0x210(%rbp), %rcx
14543ee39:     	leaq	-0x58(%rbp), %rdx
14543ee3d:     	xorl	%r8d, %r8d
14543ee40:     	callq	0x14552fae0 <.text+0x552eae0>
14543ee45:     	nop
14543ee46:     	cmpq	$0x0, 0x220(%rbp)
14543ee4e:     	je	0x14543ee7f <.text+0x543de7f>
14543ee50:     	movq	0x210(%rbp), %rdx
14543ee57:     	testq	%rdx, %rdx
14543ee5a:     	je	0x14543ee73 <.text+0x543de73>
14543ee5c:     	movq	0x218(%rbp), %rcx
14543ee63:     	shlq	$0x3, %rdx
14543ee67:     	movl	$0x8, %r8d
14543ee6d:     	callq	0x1400021d0 <.text+0x11d0>
14543ee72:     	nop
14543ee73:     	leaq	-0x58(%rbp), %rcx
14543ee77:     	callq	0x1454356a0 <.text+0x54346a0>
14543ee7c:     	nop
14543ee7d:     	jmp	0x14543eea1 <.text+0x543dea1>
14543ee7f:     	movq	0x210(%rbp), %rdx
14543ee86:     	testq	%rdx, %rdx
14543ee89:     	je	0x14543eea1 <.text+0x543dea1>
14543ee8b:     	movq	0x218(%rbp), %rcx
14543ee92:     	shlq	$0x3, %rdx
14543ee96:     	movl	$0x8, %r8d
14543ee9c:     	callq	0x1400021d0 <.text+0x11d0>
14543eea1:     	cmpq	$-0x1, 0xf8(%rbp)
14543eea9:     	je	0x14543ef9f <.text+0x543df9f>
14543eeaf:     	leaq	0xf8(%rbp), %rdx
14543eeb6:     	movb	0x130(%rbp), %bl
14543eebc:     	movb	0x131(%rbp), %dil
14543eec3:     	movb	0x132(%rbp), %r14b
14543eeca:     	leaq	0x1f8(%rbp), %rcx
14543eed1:     	callq	0x145728850 <.text+0x5727850>
14543eed6:     	nop
14543eed7:     	leaq	0x110(%rbp), %rdx
14543eede:     	leaq	0x178(%rbp), %rcx
14543eee5:     	callq	0x145728850 <.text+0x5727850>
14543eeea:     	nop
14543eeeb:     	movzbl	0x137(%rbp), %eax
14543eef2:     	movb	%al, 0x24f(%rbp)
14543eef8:     	movl	0x133(%rbp), %eax
14543eefe:     	movl	%eax, 0x24b(%rbp)
14543ef04:     	movq	0x128(%rbp), %rax
14543ef0b:     	movups	0x1f8(%rbp), %xmm0
14543ef12:     	movaps	%xmm0, 0x1c0(%rbp)
14543ef19:     	movq	0x208(%rbp), %rcx
14543ef20:     	movq	%rcx, 0x1d0(%rbp)
14543ef27:     	movq	0x188(%rbp), %rcx
14543ef2e:     	movq	%rcx, 0x1e8(%rbp)
14543ef35:     	movups	0x178(%rbp), %xmm1
14543ef3c:     	movups	%xmm1, 0x1d8(%rbp)
14543ef43:     	movaps	%xmm0, 0x210(%rbp)
14543ef4a:     	movq	0x1d0(%rbp), %rcx
14543ef51:     	movq	%rcx, 0x220(%rbp)
14543ef58:     	movq	0x1d8(%rbp), %rcx
14543ef5f:     	movq	%rcx, 0x228(%rbp)
14543ef66:     	movq	0x1e0(%rbp), %rcx
14543ef6d:     	movq	%rcx, 0x230(%rbp)
14543ef74:     	movq	0x1e8(%rbp), %rcx
14543ef7b:     	movq	%rcx, 0x238(%rbp)
14543ef82:     	movq	%rax, 0x240(%rbp)
14543ef89:     	movb	%bl, 0x248(%rbp)
14543ef8f:     	movb	%dil, 0x249(%rbp)
14543ef96:     	movb	%r14b, 0x24a(%rbp)
14543ef9d:     	jmp	0x14543efac <.text+0x543dfac>
14543ef9f:     	leaq	0x210(%rbp), %rcx
14543efa6:     	callq	0x14543b220 <.text+0x543a220>
14543efab:     	nop
14543efac:     	movq	0x2c0(%rbp), %rdi
14543efb3:     	movq	0x260(%rbp), %r8
14543efba:     	movq	(%r8), %rax
14543efbd:     	movabsq	$-0x8000000000000000, %rdx # imm = 0x8000000000000000
14543efc7:     	xorq	%rax, %rdx
14543efca:     	testq	%rax, %rax
14543efcd:     	movl	$0x2, %ecx
14543efd2:     	cmovsq	%rdx, %rcx
14543efd6:     	movq	$-0x1, %r14
14543efdd:     	testq	%rcx, %rcx
14543efe0:     	je	0x14543efec <.text+0x543dfec>
14543efe2:     	cmpq	$0x1, %rcx
14543efe6:     	jne	0x14543eff0 <.text+0x543dff0>
14543efe8:     	xorl	%ebx, %ebx
14543efea:     	jmp	0x14543f019 <.text+0x543e019>
14543efec:     	movb	$0x1, %bl
14543efee:     	jmp	0x14543f019 <.text+0x543e019>
14543eff0:     	movups	0x8(%r8), %xmm0
14543eff5:     	movups	0x18(%r8), %xmm1
14543effa:     	movups	0x28(%r8), %xmm2
14543efff:     	movaps	%xmm2, 0x1b0(%rbp)
14543f006:     	movaps	%xmm1, 0x1a0(%rbp)
14543f00d:     	movaps	%xmm0, 0x190(%rbp)
14543f014:     	xorl	%ebx, %ebx
14543f016:     	movq	%rax, %r14
14543f019:     	leaq	0xa18(%rsi), %rcx
14543f020:     	leaq	-0x58(%rbp), %rdx
14543f024:     	movl	$0x1d0, %r8d            # imm = 0x1D0
14543f02a:     	callq	0x1457731ed <.text+0x57721ed>
14543f02f:     	xorps	%xmm0, %xmm0
14543f032:     	movups	%xmm0, 0xc80(%rsi)
14543f039:     	movups	%xmm0, 0xc98(%rsi)
14543f040:     	movups	%xmm0, 0xcb0(%rsi)
14543f047:     	movups	%xmm0, 0xcc8(%rsi)
14543f04e:     	movups	%xmm0, 0xce0(%rsi)
14543f055:     	movups	%xmm0, 0xcf8(%rsi)
14543f05c:     	movups	%xmm0, 0xd10(%rsi)
14543f063:     	movups	%xmm0, 0xd28(%rsi)
14543f06a:     	movups	%xmm0, 0xd40(%rsi)
14543f071:     	movups	%xmm0, 0xd58(%rsi)
14543f078:     	movups	%xmm0, 0xd70(%rsi)
14543f07f:     	movups	%xmm0, 0xd88(%rsi)
14543f086:     	movups	%xmm0, 0xda0(%rsi)
14543f08d:     	movq	$0x0, 0x9d0(%rsi)
14543f098:     	movq	$0x8, 0x9d8(%rsi)
14543f0a3:     	movups	%xmm0, 0x9e0(%rsi)
14543f0aa:     	movq	$0x8, 0x9f0(%rsi)
14543f0b5:     	movups	%xmm0, 0x9f8(%rsi)
14543f0bc:     	movq	$0x8, 0xa08(%rsi)
14543f0c7:     	movq	$0x0, 0xa10(%rsi)
14543f0d2:     	movb	$0x0, 0x1018(%rsi)
14543f0d9:     	movq	%r14, 0xdc0(%rsi)
14543f0e0:     	movaps	0x190(%rbp), %xmm1
14543f0e7:     	movaps	0x1a0(%rbp), %xmm2
14543f0ee:     	movaps	0x1b0(%rbp), %xmm3
14543f0f5:     	movups	%xmm1, 0xdc8(%rsi)
14543f0fc:     	movups	%xmm2, 0xdd8(%rsi)
14543f103:     	movups	%xmm3, 0xde8(%rsi)
14543f10a:     	movb	%bl, 0x1041(%rsi)
14543f110:     	movaps	0x210(%rbp), %xmm1
14543f117:     	movaps	0x220(%rbp), %xmm2
14543f11e:     	movaps	0x230(%rbp), %xmm3
14543f125:     	movaps	0x240(%rbp), %xmm4
14543f12c:     	movups	%xmm1, 0xbe8(%rsi)
14543f133:     	movups	%xmm2, 0xbf8(%rsi)
14543f13a:     	movups	%xmm3, 0xc08(%rsi)
14543f141:     	movups	%xmm4, 0xc18(%rsi)
14543f148:     	movq	$-0x1, 0xdf8(%rsi)
14543f153:     	movq	$0x0, 0xf80(%rsi)
14543f15e:     	movq	$0x2, 0x10(%rsi)
14543f166:     	movups	%xmm0, 0xf88(%rsi)
14543f16d:     	movups	%xmm0, 0xf98(%rsi)
14543f174:     	movups	%xmm0, 0xfa8(%rsi)
14543f17b:     	movq	$0x0, 0xfb8(%rsi)
14543f186:     	movl	$0x0, 0x1000(%rsi)
14543f190:     	movups	%xmm0, 0x1004(%rsi)
14543f197:     	movl	$0x0, 0x1014(%rsi)
14543f1a1:     	movl	$0xff000000, 0x1042(%rsi) # imm = 0xFF000000
14543f1ab:     	movq	0x258(%rbp), %rax
14543f1b2:     	movq	%rax, 0xf70(%rsi)
14543f1b9:     	movq	0x250(%rbp), %rax
14543f1c0:     	movq	%rax, 0xf78(%rsi)
14543f1c7:     	movq	$0x0, (%rsi)
14543f1ce:     	movq	$0x0, 0xfc0(%rsi)
14543f1d9:     	movq	$0x0, 0xc28(%rsi)
14543f1e4:     	movq	$0x8, 0xc30(%rsi)
14543f1ef:     	movups	%xmm0, 0xc38(%rsi)
14543f1f6:     	movq	$0x4, 0xc48(%rsi)
14543f201:     	movups	%xmm0, 0xc50(%rsi)
14543f208:     	movq	$0x1, 0xc60(%rsi)
14543f213:     	movups	%xmm0, 0xc68(%rsi)
14543f21a:     	movq	$0x1, 0xc78(%rsi)
14543f225:     	movq	$0x1, 0xc90(%rsi)
14543f230:     	movq	$0x1, 0xca8(%rsi)
14543f23b:     	movq	$0x1, 0xcc0(%rsi)
14543f246:     	movq	$0x1, 0xcd8(%rsi)
14543f251:     	movq	$0x1, 0xcf0(%rsi)
14543f25c:     	movq	$0x1, 0xd08(%rsi)
14543f267:     	movq	$0x1, 0xd20(%rsi)
14543f272:     	movq	$0x1, 0xd38(%rsi)
14543f27d:     	movq	$0x1, 0xd50(%rsi)
14543f288:     	movq	$0x1, 0xd68(%rsi)
14543f293:     	movq	$0x1, 0xd80(%rsi)
14543f29e:     	movq	$0x1, 0xd98(%rsi)
14543f2a9:     	movq	$0x1, 0xdb0(%rsi)
14543f2b4:     	movq	$0x0, 0xdb8(%rsi)
14543f2bf:     	movq	$0x0, 0xfc8(%rsi)
14543f2ca:     	movups	%xmm0, 0xfe0(%rsi)
14543f2d1:     	movq	%rdi, 0xff8(%rsi)
14543f2d8:     	movq	%rsi, %rax
14543f2db:     	addq	$0x2f0, %rsp            # imm = 0x2F0
14543f2e2:     	popq	%rbx
14543f2e3:     	popq	%rdi
14543f2e4:     	popq	%rsi
14543f2e5:     	popq	%r14
14543f2e7:     	popq	%rbp
14543f2e8:     	retq

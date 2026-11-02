
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145986de0:     	subq	$0x28, %rsp
145986de4:     	movzbl	%dl, %eax
145986de7:     	movq	(%rcx), %r9
145986dea:     	cmpl	$0xa, 0x68(%r9)
145986def:     	jne	0x145986e2a <.text+0x5985e2a>
145986df1:     	leaq	0x182d6b8(%rip), %rdx   # 0x1471b44b0
145986df8:     	movslq	(%rdx,%rax,4), %rax
145986dfc:     	addq	%rdx, %rax
145986dff:     	jmpq	*%rax
145986e01:     	cmpq	$0x5, %r8
145986e05:     	jae	0x1459870aa <.text+0x59860aa>
145986e0b:     	leaq	0x182d3d6(%rip), %rax   # 0x1471b41e8
145986e12:     	movss	(%rax,%r8,4), %xmm0
145986e18:     	movss	0x3e6984(%rip), %xmm1   # 0x145d6d7a4
145986e20:     	subss	0x3c(%rcx), %xmm1
145986e25:     	jmp	0x145986fad <.text+0x5985fad>
145986e2a:     	leaq	0x182d667(%rip), %rdx   # 0x1471b4498
145986e31:     	movslq	(%rdx,%rax,4), %r10
145986e35:     	addq	%rdx, %r10
145986e38:     	jmpq	*%r10
145986e3b:     	cmpq	$0x5, %r8
145986e3f:     	jae	0x1459870b3 <.text+0x59860b3>
145986e45:     	movl	0x8(%rcx,%rax,4), %eax
145986e49:     	cvtsi2ss	%rax, %xmm1
145986e4e:     	leaq	0x182d43b(%rip), %rax   # 0x1471b4290
145986e55:     	mulss	0x3e68f7(%rip), %xmm1   # 0x145d6d754
145986e5d:     	movss	(%rax,%r8,4), %xmm0
145986e63:     	addss	0x3e6501(%rip), %xmm1   # 0x145d6d36c
145986e6b:     	divss	%xmm1, %xmm0
145986e6f:     	addq	$0x28, %rsp
145986e73:     	retq
145986e74:     	xorps	%xmm0, %xmm0
145986e77:     	addq	$0x28, %rsp
145986e7b:     	retq
145986e7c:     	cmpq	$0x5, %r8
145986e80:     	jae	0x145987098 <.text+0x5986098>
145986e86:     	leaq	0x182d493(%rip), %rax   # 0x1471b4320
145986e8d:     	movss	0x3ecf7b(%rip), %xmm0   # 0x145d73e10
145986e95:     	subss	0x34(%rcx), %xmm0
145986e9a:     	mulss	0x3ecea2(%rip), %xmm0   # 0x145d73d44
145986ea2:     	jmp	0x145986fe3 <.text+0x5985fe3>
145986ea7:     	cmpq	$0x5, %r8
145986eab:     	jae	0x1459870a1 <.text+0x59860a1>
145986eb1:     	leaq	0x182d408(%rip), %rax   # 0x1471b42c0
145986eb8:     	movss	0x2c(%rcx), %xmm0
145986ebd:     	addss	0x182d2e7(%rip), %xmm0  # 0x1471b41ac
145986ec5:     	divss	0x3e9d6b(%rip), %xmm0   # 0x145d70c38
145986ecd:     	jmp	0x145986fe3 <.text+0x5985fe3>
145986ed2:     	movl	$0xc, %eax
145986ed7:     	cmpb	$0xb, 0x75(%r9)
145986edc:     	jne	0x14598705d <.text+0x598605d>
145986ee2:     	movq	(%r9), %rdx
145986ee5:     	movq	0x8(%r9), %rax
145986ee9:     	cmpq	$0xb, %rax
145986eed:     	je	0x14598703b <.text+0x598603b>
145986ef3:     	cmpq	$0x9, %rax
145986ef7:     	jne	0x14598705b <.text+0x598605b>
145986efd:     	movabsq	$0x7461665f6c616573, %r9 # imm = 0x7461665F6C616573
145986f07:     	xorq	(%rdx), %r9
145986f0a:     	movzbl	0x8(%rdx), %r10d
145986f0f:     	xorq	$0x65, %r10
145986f13:     	movl	$0x2, %eax
145986f18:     	orq	%r9, %r10
145986f1b:     	je	0x14598705d <.text+0x598605d>
145986f21:     	movabsq	$0x7269665f6c756f73, %r9 # imm = 0x7269665F6C756F73
145986f2b:     	xorq	(%rdx), %r9
145986f2e:     	movzbl	0x8(%rdx), %r10d
145986f33:     	xorq	$0x65, %r10
145986f37:     	orq	%r9, %r10
145986f3a:     	je	0x14598705d <.text+0x598605d>
145986f40:     	movabsq	$0x6c6577746867696c, %r9 # imm = 0x6C6577746867696C
145986f4a:     	xorq	(%rdx), %r9
145986f4d:     	movzbl	0x8(%rdx), %edx
145986f51:     	xorq	$0x6c, %rdx
145986f55:     	orq	%r9, %rdx
145986f58:     	jne	0x14598705b <.text+0x598605b>
145986f5e:     	jmp	0x14598705d <.text+0x598605d>
145986f63:     	cmpq	$0x5, %r8
145986f67:     	jae	0x1459870bc <.text+0x59860bc>
145986f6d:     	leaq	0x182d2a4(%rip), %rax   # 0x1471b4218
145986f74:     	movss	(%rax,%r8,4), %xmm0
145986f7a:     	movss	0x2c(%rcx), %xmm1
145986f7f:     	addss	0x182d225(%rip), %xmm1  # 0x1471b41ac
145986f87:     	jmp	0x145986fad <.text+0x5985fad>
145986f89:     	cmpq	$0x5, %r8
145986f8d:     	jae	0x1459870c5 <.text+0x59860c5>
145986f93:     	leaq	0x182d24e(%rip), %rax   # 0x1471b41e8
145986f9a:     	movss	(%rax,%r8,4), %xmm0
145986fa0:     	movss	0x3e67a0(%rip), %xmm1   # 0x145d6d748
145986fa8:     	subss	0x40(%rcx), %xmm1
145986fad:     	xorps	%xmm2, %xmm2
145986fb0:     	maxss	%xmm2, %xmm1
145986fb4:     	minss	%xmm1, %xmm0
145986fb8:     	addq	$0x28, %rsp
145986fbc:     	retq
145986fbd:     	cmpq	$0x5, %r8
145986fc1:     	jae	0x1459870ce <.text+0x59860ce>
145986fc7:     	leaq	0x182d382(%rip), %rax   # 0x1471b4350
145986fce:     	movss	0x3e6452(%rip), %xmm0   # 0x145d6d428
145986fd6:     	subss	0x38(%rcx), %xmm0
145986fdb:     	divss	0x3ece2d(%rip), %xmm0   # 0x145d73e10
145986fe3:     	xorps	%xmm1, %xmm1
145986fe6:     	maxss	%xmm1, %xmm0
145986fea:     	mulss	(%rax,%r8,4), %xmm0
145986ff0:     	addq	$0x28, %rsp
145986ff4:     	retq
145986ff5:     	cmpq	$0x5, %r8
145986ff9:     	jae	0x1459870d7 <.text+0x59860d7>
145986fff:     	movss	0x3e6421(%rip), %xmm1   # 0x145d6d428
145987007:     	subss	0x38(%rcx), %xmm1
14598700c:     	xorps	%xmm0, %xmm0
14598700f:     	maxss	%xmm0, %xmm1
145987013:     	leaq	0x182d22e(%rip), %rax   # 0x1471b4248
14598701a:     	movss	0x58(%r9), %xmm2
145987020:     	maxss	0x3e9c0c(%rip), %xmm2   # 0x145d70c34
145987028:     	movss	(%rax,%r8,4), %xmm0
14598702e:     	divss	%xmm2, %xmm0
145987032:     	minss	%xmm1, %xmm0
145987036:     	addq	$0x28, %rsp
14598703a:     	retq
14598703b:     	movabsq	$0x665f656972656166, %rax # imm = 0x665F656972656166
145987045:     	xorq	(%rdx), %rax
145987048:     	movabsq	$0x657269665f656972, %r9 # imm = 0x657269665F656972
145987052:     	xorq	0x3(%rdx), %r9
145987056:     	orq	%rax, %r9
145987059:     	je	0x145987084 <.text+0x5986084>
14598705b:     	xorl	%eax, %eax
14598705d:     	cmpq	$0x4, %r8
145987061:     	ja	0x14598708f <.text+0x598608f>
145987063:     	xorl	%edx, %edx
145987065:     	subl	0x30(%rcx), %eax
145987068:     	leaq	0x182d281(%rip), %rcx   # 0x1471b42f0
14598706f:     	cmovbl	%edx, %eax
145987072:     	movl	(%rcx,%r8,4), %ecx
145987076:     	cmpl	%ecx, %eax
145987078:     	cmovael	%ecx, %eax
14598707b:     	cvtsi2ss	%eax, %xmm0
14598707f:     	addq	$0x28, %rsp
145987083:     	retq
145987084:     	movl	$0x2, %eax
145987089:     	cmpq	$0x4, %r8
14598708d:     	jbe	0x145987063 <.text+0x5986063>
14598708f:     	leaq	0x182d272(%rip), %rax   # 0x1471b4308
145987096:     	jmp	0x1459870de <.text+0x59860de>
145987098:     	leaq	0x182d299(%rip), %rax   # 0x1471b4338
14598709f:     	jmp	0x1459870de <.text+0x59860de>
1459870a1:     	leaq	0x182d230(%rip), %rax   # 0x1471b42d8
1459870a8:     	jmp	0x1459870de <.text+0x59860de>
1459870aa:     	leaq	0x182d14f(%rip), %rax   # 0x1471b4200
1459870b1:     	jmp	0x1459870de <.text+0x59860de>
1459870b3:     	leaq	0x182d1ee(%rip), %rax   # 0x1471b42a8
1459870ba:     	jmp	0x1459870de <.text+0x59860de>
1459870bc:     	leaq	0x182d16d(%rip), %rax   # 0x1471b4230
1459870c3:     	jmp	0x1459870de <.text+0x59860de>
1459870c5:     	leaq	0x182d1ac(%rip), %rax   # 0x1471b4278
1459870cc:     	jmp	0x1459870de <.text+0x59860de>
1459870ce:     	leaq	0x182d293(%rip), %rax   # 0x1471b4368
1459870d5:     	jmp	0x1459870de <.text+0x59860de>
1459870d7:     	leaq	0x182d182(%rip), %rax   # 0x1471b4260
1459870de:     	movl	$0x5, %edx
1459870e3:     	movq	%r8, %rcx
1459870e6:     	movq	%rax, %r8
1459870e9:     	callq	0x145d697e3 <.text+0x5d687e3>
1459870ee:     	ud2

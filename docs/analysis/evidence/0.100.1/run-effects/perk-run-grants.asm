
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547ede0:     	pushq	%rbp
14547ede1:     	pushq	%r15
14547ede3:     	pushq	%r14
14547ede5:     	pushq	%r13
14547ede7:     	pushq	%r12
14547ede9:     	pushq	%rsi
14547edea:     	pushq	%rdi
14547edeb:     	pushq	%rbx
14547edec:     	subq	$0x108, %rsp            # imm = 0x108
14547edf3:     	leaq	0x80(%rsp), %rbp
14547edfb:     	movaps	%xmm6, 0x70(%rbp)
14547edff:     	movq	$-0x2, 0x68(%rbp)
14547ee07:     	movq	%rdx, %r13
14547ee0a:     	movq	%rcx, %rsi
14547ee0d:     	addq	$0xf0, %rdx
14547ee14:     	leaq	-0x48(%rbp), %rcx
14547ee18:     	callq	0x145546de0 <.text+0x5545de0>
14547ee1d:     	movq	0x118(%r13), %rdi
14547ee24:     	leaq	(,%rdi,4), %rbx
14547ee2c:     	movq	%rdi, %rax
14547ee2f:     	shrq	$0x3e, %rax
14547ee33:     	setne	%al
14547ee36:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
14547ee40:     	cmpq	%rcx, %rbx
14547ee43:     	seta	%cl
14547ee46:     	orb	%al, %cl
14547ee48:     	je	0x14547ee5b <.text+0x547de5b>
14547ee4a:     	xorl	%r12d, %r12d
14547ee4d:     	movq	%r12, %rcx
14547ee50:     	movq	%rbx, %rdx
14547ee53:     	callq	0x14590379b <.text+0x590279b>
14547ee58:     	nop
14547ee59:     	ud2
14547ee5b:     	movq	%rsi, 0x30(%rbp)
14547ee5f:     	movq	0x110(%r13), %r14
14547ee66:     	testq	%rbx, %rbx
14547ee69:     	je	0x14547f025 <.text+0x547e025>
14547ee6f:     	callq	0x140002200 <.text+0x1200>
14547ee74:     	movl	$0x4, %r12d
14547ee7a:     	movl	$0x4, %edx
14547ee7f:     	movq	%rbx, %rcx
14547ee82:     	callq	0x1400021c0 <.text+0x11c0>
14547ee87:     	testq	%rax, %rax
14547ee8a:     	je	0x14547ee4d <.text+0x547de4d>
14547ee8c:     	movq	%rax, %r15
14547ee8f:     	movq	%rdi, %rsi
14547ee92:     	testq	%rdi, %rdi
14547ee95:     	je	0x14547eea5 <.text+0x547dea5>
14547ee97:     	movq	%r15, %rcx
14547ee9a:     	movq	%r14, %rdx
14547ee9d:     	movq	%rbx, %r8
14547eea0:     	callq	0x1457731ed <.text+0x57721ed>
14547eea5:     	movq	-0x38(%rbp), %rax
14547eea9:     	movq	%rax, -0x20(%rbp)
14547eead:     	movups	-0x48(%rbp), %xmm0
14547eeb1:     	movaps	%xmm0, -0x30(%rbp)
14547eeb5:     	movq	%rsi, -0x18(%rbp)
14547eeb9:     	movq	%r15, -0x10(%rbp)
14547eebd:     	movq	%rdi, -0x8(%rbp)
14547eec1:     	xorps	%xmm6, %xmm6
14547eec4:     	testq	%rax, %rax
14547eec7:     	je	0x14547f03b <.text+0x547e03b>
14547eecd:     	movq	-0x28(%rbp), %rcx
14547eed1:     	shlq	$0x5, %rax
14547eed5:     	xorl	%edx, %edx
14547eed7:     	movl	$0x6f726572, %r8d       # imm = 0x6F726572
14547eedd:     	movl	$0x736c6c6f, %r9d       # imm = 0x736C6C6F
14547eee3:     	movq	0x30(%rbp), %rdi
14547eee7:     	jmp	0x14547eef9 <.text+0x547def9>
14547eee9:     	nopl	(%rax)
14547eef0:     	addq	$0x20, %rdx
14547eef4:     	cmpq	%rdx, %rax
14547eef7:     	je	0x14547ef20 <.text+0x547df20>
14547eef9:     	cmpq	$0x7, 0x10(%rcx,%rdx)
14547eeff:     	jne	0x14547eef0 <.text+0x547def0>
14547ef01:     	movq	0x8(%rcx,%rdx), %r10
14547ef06:     	movl	(%r10), %r11d
14547ef09:     	xorl	%r8d, %r11d
14547ef0c:     	movl	0x3(%r10), %r10d
14547ef10:     	xorl	%r9d, %r10d
14547ef13:     	orl	%r11d, %r10d
14547ef16:     	jne	0x14547eef0 <.text+0x547def0>
14547ef18:     	movzbl	0x18(%rcx,%rdx), %r15d
14547ef1e:     	jmp	0x14547ef23 <.text+0x547df23>
14547ef20:     	xorl	%r15d, %r15d
14547ef23:     	xorl	%edx, %edx
14547ef25:     	movl	$0x696e6162, %r8d       # imm = 0x696E6162
14547ef2b:     	jmp	0x14547ef39 <.text+0x547df39>
14547ef2d:     	nopl	(%rax)
14547ef30:     	addq	$0x20, %rdx
14547ef34:     	cmpq	%rdx, %rax
14547ef37:     	je	0x14547ef64 <.text+0x547df64>
14547ef39:     	cmpq	$0x6, 0x10(%rcx,%rdx)
14547ef3f:     	jne	0x14547ef30 <.text+0x547df30>
14547ef41:     	movq	0x8(%rcx,%rdx), %r9
14547ef46:     	movl	(%r9), %r10d
14547ef49:     	xorl	%r8d, %r10d
14547ef4c:     	movzwl	0x4(%r9), %r9d
14547ef51:     	xorl	$0x6873, %r9d           # imm = 0x6873
14547ef58:     	orl	%r10d, %r9d
14547ef5b:     	jne	0x14547ef30 <.text+0x547df30>
14547ef5d:     	movzbl	0x18(%rcx,%rdx), %esi
14547ef62:     	jmp	0x14547ef66 <.text+0x547df66>
14547ef64:     	xorl	%esi, %esi
14547ef66:     	xorl	%edx, %edx
14547ef68:     	jmp	0x14547ef79 <.text+0x547df79>
14547ef6a:     	nopw	(%rax,%rax)
14547ef70:     	addq	$0x20, %rdx
14547ef74:     	cmpq	%rdx, %rax
14547ef77:     	je	0x14547ef97 <.text+0x547df97>
14547ef79:     	cmpq	$0x4, 0x10(%rcx,%rdx)
14547ef7f:     	jne	0x14547ef70 <.text+0x547df70>
14547ef81:     	movq	0x8(%rcx,%rdx), %r8
14547ef86:     	cmpl	$0x70696b73, (%r8)      # imm = 0x70696B73
14547ef8d:     	jne	0x14547ef70 <.text+0x547df70>
14547ef8f:     	movzbl	0x18(%rcx,%rdx), %r14d
14547ef95:     	jmp	0x14547ef9a <.text+0x547df9a>
14547ef97:     	xorl	%r14d, %r14d
14547ef9a:     	xorl	%edx, %edx
14547ef9c:     	movl	$0x6e65706f, %r8d       # imm = 0x6E65706F
14547efa2:     	movl	$0x676e696e, %r9d       # imm = 0x676E696E
14547efa8:     	jmp	0x14547efb9 <.text+0x547dfb9>
14547efaa:     	nopw	(%rax,%rax)
14547efb0:     	addq	$0x20, %rdx
14547efb4:     	cmpq	%rdx, %rax
14547efb7:     	je	0x14547efe2 <.text+0x547dfe2>
14547efb9:     	cmpq	$0x7, 0x10(%rcx,%rdx)
14547efbf:     	jne	0x14547efb0 <.text+0x547dfb0>
14547efc1:     	movq	0x8(%rcx,%rdx), %r10
14547efc6:     	movl	(%r10), %r11d
14547efc9:     	xorl	%r8d, %r11d
14547efcc:     	movl	0x3(%r10), %r10d
14547efd0:     	xorl	%r9d, %r10d
14547efd3:     	orl	%r11d, %r10d
14547efd6:     	jne	0x14547efb0 <.text+0x547dfb0>
14547efd8:     	movzbl	0x18(%rcx,%rdx), %edx
14547efdd:     	movl	%edx, 0x4c(%rbp)
14547efe0:     	jmp	0x14547efe9 <.text+0x547dfe9>
14547efe2:     	movl	$0x0, 0x4c(%rbp)
14547efe9:     	xorl	%edx, %edx
14547efeb:     	jmp	0x14547eff9 <.text+0x547dff9>
14547efed:     	nopl	(%rax)
14547eff0:     	addq	$0x20, %rdx
14547eff4:     	cmpq	%rdx, %rax
14547eff7:     	je	0x14547f04e <.text+0x547e04e>
14547eff9:     	cmpq	$0x4, 0x10(%rcx,%rdx)
14547efff:     	jne	0x14547eff0 <.text+0x547dff0>
14547f001:     	movq	0x8(%rcx,%rdx), %r8
14547f006:     	cmpl	$0x6e65656b, (%r8)      # imm = 0x6E65656B
14547f00d:     	jne	0x14547eff0 <.text+0x547dff0>
14547f00f:     	movzbl	0x18(%rcx,%rdx), %eax
14547f014:     	xorps	%xmm6, %xmm6
14547f017:     	cvtsi2ss	%eax, %xmm6
14547f01b:     	mulss	0x49687d(%rip), %xmm6   # 0x1459158a0
14547f023:     	jmp	0x14547f04e <.text+0x547e04e>
14547f025:     	movl	$0x4, %r15d
14547f02b:     	xorl	%esi, %esi
14547f02d:     	testq	%rdi, %rdi
14547f030:     	jne	0x14547ee97 <.text+0x547de97>
14547f036:     	jmp	0x14547eea5 <.text+0x547dea5>
14547f03b:     	movl	$0x0, 0x4c(%rbp)
14547f042:     	xorl	%esi, %esi
14547f044:     	xorl	%r15d, %r15d
14547f047:     	xorl	%r14d, %r14d
14547f04a:     	movq	0x30(%rbp), %rdi
14547f04e:     	movq	%r13, 0x38(%rbp)
14547f052:     	leaq	0x155a1df(%rip), %rax   # 0x1469d9238
14547f059:     	movq	%rax, -0x48(%rbp)
14547f05d:     	leaq	0x155a21c(%rip), %rax   # 0x1469d9280
14547f064:     	movq	%rax, -0x40(%rbp)
14547f068:     	leaq	-0x30(%rbp), %rax
14547f06c:     	movq	%rax, -0x38(%rbp)
14547f070:     	leaq	-0x60(%rbp), %rcx
14547f074:     	leaq	-0x48(%rbp), %rdx
14547f078:     	callq	0x145537140 <.text+0x5536140>
14547f07d:     	nop
14547f07e:     	movq	-0x28(%rbp), %r12
14547f082:     	movq	-0x20(%rbp), %r13
14547f086:     	movq	%r13, %rbx
14547f089:     	shlq	$0x5, %rbx
14547f08d:     	xorl	%r11d, %r11d
14547f090:     	testq	%r13, %r13
14547f093:     	je	0x14547f26e <.text+0x547e26e>
14547f099:     	movabsq	$0x6f696e61706d6f63, %rcx # imm = 0x6F696E61706D6F63
14547f0a3:     	xorl	%eax, %eax
14547f0a5:     	jmp	0x14547f0b9 <.text+0x547e0b9>
14547f0a7:     	nopw	(%rax,%rax)
14547f0b0:     	addq	$0x20, %rax
14547f0b4:     	cmpq	%rax, %rbx
14547f0b7:     	je	0x14547f0e6 <.text+0x547e0e6>
14547f0b9:     	cmpq	$0x9, 0x10(%r12,%rax)
14547f0bf:     	jne	0x14547f0b0 <.text+0x547e0b0>
14547f0c1:     	movq	0x8(%r12,%rax), %rdx
14547f0c6:     	movq	(%rdx), %r8
14547f0c9:     	xorq	%rcx, %r8
14547f0cc:     	movzbl	0x8(%rdx), %edx
14547f0d0:     	xorq	$0x6e, %rdx
14547f0d4:     	orq	%r8, %rdx
14547f0d7:     	jne	0x14547f0b0 <.text+0x547e0b0>
14547f0d9:     	xorl	%r11d, %r11d
14547f0dc:     	cmpb	$0x0, 0x18(%r12,%rax)
14547f0e2:     	setne	%r11b
14547f0e6:     	xorl	%eax, %eax
14547f0e8:     	movl	$0x6f636573, %edx       # imm = 0x6F636573
14547f0ed:     	xorl	%ecx, %ecx
14547f0ef:     	jmp	0x14547f109 <.text+0x547e109>
14547f0f1:     	nopw	%cs:(%rax,%rax)
14547f100:     	addq	$0x20, %rcx
14547f104:     	cmpq	%rcx, %rbx
14547f107:     	je	0x14547f138 <.text+0x547e138>
14547f109:     	cmpq	$0x6, 0x10(%r12,%rcx)
14547f10f:     	jne	0x14547f100 <.text+0x547e100>
14547f111:     	movq	0x8(%r12,%rcx), %r8
14547f116:     	movl	(%r8), %r9d
14547f119:     	xorl	%edx, %r9d
14547f11c:     	movzwl	0x4(%r8), %r8d
14547f121:     	xorl	$0x646e, %r8d           # imm = 0x646E
14547f128:     	orl	%r9d, %r8d
14547f12b:     	jne	0x14547f100 <.text+0x547e100>
14547f12d:     	xorl	%eax, %eax
14547f12f:     	cmpb	$0x0, 0x18(%r12,%rcx)
14547f135:     	setne	%al
14547f138:     	movb	$-0x1, %r9b
14547f13b:     	addq	%rax, %r11
14547f13e:     	movl	%r15d, 0xc(%rbp)
14547f142:     	je	0x14547f280 <.text+0x547e280>
14547f148:     	movq	0x38(%rbp), %rax
14547f14c:     	movq	0x128(%rax), %r10
14547f153:     	movq	0x130(%rax), %rax
14547f15a:     	movq	%rax, 0x40(%rbp)
14547f15e:     	testq	%rax, %rax
14547f161:     	je	0x14547f407 <.text+0x547e407>
14547f167:     	movq	%r11, 0x58(%rbp)
14547f16b:     	movq	0x8(%r10), %rcx
14547f16f:     	movq	%r10, 0x50(%rbp)
14547f173:     	movq	0x10(%r10), %rdx
14547f177:     	callq	0x145514d60 <.text+0x5513d60>
14547f17c:     	testq	%rax, %rax
14547f17f:     	je	0x14547f40b <.text+0x547e40b>
14547f185:     	movq	0x40(%rax), %rdx
14547f189:     	testq	%rdx, %rdx
14547f18c:     	je	0x14547f40d <.text+0x547e40d>
14547f192:     	movl	%r14d, 0x64(%rbp)
14547f196:     	movl	%esi, 0x60(%rbp)
14547f199:     	movq	0x38(%rbp), %rcx
14547f19d:     	movq	0xb8(%rcx), %rsi
14547f1a4:     	xorl	%r14d, %r14d
14547f1a7:     	testq	%rsi, %rsi
14547f1aa:     	movb	$-0x1, %r9b
14547f1ad:     	movq	0x58(%rbp), %r11
14547f1b1:     	movq	0x50(%rbp), %r10
14547f1b5:     	je	0x14547f41a <.text+0x547e41a>
14547f1bb:     	movq	%rbx, (%rbp)
14547f1bf:     	movq	%rax, 0x10(%rbp)
14547f1c3:     	movq	0x48(%rax), %r9
14547f1c7:     	movq	0xb0(%rcx), %rbx
14547f1ce:     	cmpq	$0x1, %rsi
14547f1d2:     	je	0x14547f22b <.text+0x547e22b>
14547f1d4:     	xorl	%r14d, %r14d
14547f1d7:     	movq	%rdx, 0x18(%rbp)
14547f1db:     	movq	%r9, 0x20(%rbp)
14547f1df:     	nop
14547f1e0:     	movq	%r14, 0x28(%rbp)
14547f1e4:     	movq	%rsi, %rdi
14547f1e7:     	shrq	%rdi
14547f1ea:     	addq	%rdi, %r14
14547f1ed:     	leaq	(%r14,%r14,2), %rax
14547f1f1:     	movq	0x8(%rbx,%rax,8), %rcx
14547f1f6:     	movq	0x10(%rbx,%rax,8), %r8
14547f1fb:     	movq	%r8, %r15
14547f1fe:     	subq	%r9, %r15
14547f201:     	cmovaeq	%r9, %r8
14547f205:     	callq	0x1457731e7 <.text+0x57721e7>
14547f20a:     	movq	0x20(%rbp), %r9
14547f20e:     	movq	0x18(%rbp), %rdx
14547f212:     	cltq
14547f214:     	testl	%eax, %eax
14547f216:     	cmovneq	%rax, %r15
14547f21a:     	testq	%r15, %r15
14547f21d:     	cmovgq	0x28(%rbp), %r14
14547f222:     	subq	%rdi, %rsi
14547f225:     	cmpq	$0x1, %rsi
14547f229:     	ja	0x14547f1e0 <.text+0x547e1e0>
14547f22b:     	leaq	(%r14,%r14,2), %rax
14547f22f:     	movq	0x8(%rbx,%rax,8), %rcx
14547f234:     	movq	0x10(%rbx,%rax,8), %rax
14547f239:     	movq	%rax, %rsi
14547f23c:     	subq	%r9, %rsi
14547f23f:     	cmovbq	%rax, %r9
14547f243:     	movq	%r9, %r8
14547f246:     	callq	0x1457731e7 <.text+0x57721e7>
14547f24b:     	cltq
14547f24d:     	testl	%eax, %eax
14547f24f:     	cmovneq	%rax, %rsi
14547f253:     	testq	%rsi, %rsi
14547f256:     	je	0x14547f425 <.text+0x547e425>
14547f25c:     	xorl	%eax, %eax
14547f25e:     	movq	0x30(%rbp), %rdi
14547f262:     	movl	0x60(%rbp), %esi
14547f265:     	movl	0x64(%rbp), %r14d
14547f269:     	jmp	0x14547f434 <.text+0x547e434>
14547f26e:     	xorl	%eax, %eax
14547f270:     	movb	$-0x1, %r9b
14547f273:     	addq	%rax, %r11
14547f276:     	movl	%r15d, 0xc(%rbp)
14547f27a:     	jne	0x14547f148 <.text+0x547e148>
14547f280:     	movb	$-0x1, %r10b
14547f283:     	movq	-0x60(%rbp), %rdx
14547f287:     	testq	%rdx, %rdx
14547f28a:     	je	0x14547f2b6 <.text+0x547e2b6>
14547f28c:     	movq	-0x58(%rbp), %rcx
14547f290:     	movl	$0x1, %r8d
14547f296:     	movl	%r9d, %ebx
14547f299:     	movl	%r10d, %r12d
14547f29c:     	callq	0x1400021d0 <.text+0x11d0>
14547f2a1:     	movl	%r12d, %r10d
14547f2a4:     	movl	%ebx, %r9d
14547f2a7:     	movq	-0x28(%rbp), %r12
14547f2ab:     	movq	-0x20(%rbp), %r13
14547f2af:     	movq	%r13, %rbx
14547f2b2:     	shlq	$0x5, %rbx
14547f2b6:     	testq	%r13, %r13
14547f2b9:     	je	0x14547f336 <.text+0x547e336>
14547f2bb:     	xorl	%eax, %eax
14547f2bd:     	movl	$0x7361656c, %ecx       # imm = 0x7361656C
14547f2c2:     	jmp	0x14547f2d9 <.text+0x547e2d9>
14547f2c4:     	nopw	%cs:(%rax,%rax)
14547f2d0:     	addq	$0x20, %rax
14547f2d4:     	cmpq	%rax, %rbx
14547f2d7:     	je	0x14547f300 <.text+0x547e300>
14547f2d9:     	cmpq	$0x5, 0x10(%r12,%rax)
14547f2df:     	jne	0x14547f2d0 <.text+0x547e2d0>
14547f2e1:     	movq	0x8(%r12,%rax), %rdx
14547f2e6:     	movl	(%rdx), %r8d
14547f2e9:     	xorl	%ecx, %r8d
14547f2ec:     	movzbl	0x4(%rdx), %edx
14547f2f0:     	xorl	$0x68, %edx
14547f2f3:     	orl	%r8d, %edx
14547f2f6:     	jne	0x14547f2d0 <.text+0x547e2d0>
14547f2f8:     	movzbl	0x18(%r12,%rax), %eax
14547f2fe:     	jmp	0x14547f302 <.text+0x547e302>
14547f300:     	xorl	%eax, %eax
14547f302:     	xorl	%ecx, %ecx
14547f304:     	jmp	0x14547f319 <.text+0x547e319>
14547f306:     	nopw	%cs:(%rax,%rax)
14547f310:     	addq	$0x20, %rcx
14547f314:     	cmpq	%rcx, %rbx
14547f317:     	je	0x14547f338 <.text+0x547e338>
14547f319:     	cmpq	$0x4, 0x10(%r12,%rcx)
14547f31f:     	jne	0x14547f310 <.text+0x547e310>
14547f321:     	movq	0x8(%r12,%rcx), %rdx
14547f326:     	cmpl	$0x73776170, (%rdx)     # imm = 0x73776170
14547f32c:     	jne	0x14547f310 <.text+0x547e310>
14547f32e:     	movzbl	0x18(%r12,%rcx), %ecx
14547f334:     	jmp	0x14547f33a <.text+0x547e33a>
14547f336:     	xorl	%eax, %eax
14547f338:     	xorl	%ecx, %ecx
14547f33a:     	testb	%r14b, %r14b
14547f33d:     	setne	0x2e(%rdi)
14547f341:     	cmpb	$0x0, 0x4c(%rbp)
14547f345:     	setne	0x2f(%rdi)
14547f349:     	movzbl	%sil, %edx
14547f34d:     	movzbl	0xc(%rbp), %r8d
14547f352:     	movl	%r8d, 0x20(%rdi)
14547f356:     	movl	%edx, 0x24(%rdi)
14547f359:     	movss	%xmm6, 0x28(%rdi)
14547f35e:     	movq	0x10(%rbp), %rdx
14547f362:     	movq	%rdx, (%rdi)
14547f365:     	movb	%r10b, 0x8(%rdi)
14547f369:     	movq	%r15, 0x10(%rdi)
14547f36d:     	movb	%r9b, 0x18(%rdi)
14547f371:     	movb	%al, 0x2c(%rdi)
14547f374:     	movb	%cl, 0x2d(%rdi)
14547f377:     	testq	%r13, %r13
14547f37a:     	je	0x14547f3b4 <.text+0x547e3b4>
14547f37c:     	addq	$0x8, %r12
14547f380:     	jmp	0x14547f399 <.text+0x547e399>
14547f382:     	nopw	%cs:(%rax,%rax)
14547f390:     	addq	$0x20, %r12
14547f394:     	decq	%r13
14547f397:     	je	0x14547f3b4 <.text+0x547e3b4>
14547f399:     	movq	-0x8(%r12), %rdx
14547f39e:     	testq	%rdx, %rdx
14547f3a1:     	je	0x14547f390 <.text+0x547e390>
14547f3a3:     	movq	(%r12), %rcx
14547f3a7:     	movl	$0x1, %r8d
14547f3ad:     	callq	0x1400021d0 <.text+0x11d0>
14547f3b2:     	jmp	0x14547f390 <.text+0x547e390>
14547f3b4:     	movq	-0x30(%rbp), %rdx
14547f3b8:     	testq	%rdx, %rdx
14547f3bb:     	je	0x14547f3d0 <.text+0x547e3d0>
14547f3bd:     	movq	-0x28(%rbp), %rcx
14547f3c1:     	shlq	$0x5, %rdx
14547f3c5:     	movl	$0x8, %r8d
14547f3cb:     	callq	0x1400021d0 <.text+0x11d0>
14547f3d0:     	movq	-0x18(%rbp), %rdx
14547f3d4:     	testq	%rdx, %rdx
14547f3d7:     	je	0x14547f3ec <.text+0x547e3ec>
14547f3d9:     	movq	-0x10(%rbp), %rcx
14547f3dd:     	shlq	$0x2, %rdx
14547f3e1:     	movl	$0x4, %r8d
14547f3e7:     	callq	0x1400021d0 <.text+0x11d0>
14547f3ec:     	movq	%rdi, %rax
14547f3ef:     	movaps	0x70(%rbp), %xmm6
14547f3f3:     	addq	$0x108, %rsp            # imm = 0x108
14547f3fa:     	popq	%rbx
14547f3fb:     	popq	%rdi
14547f3fc:     	popq	%rsi
14547f3fd:     	popq	%r12
14547f3ff:     	popq	%r13
14547f401:     	popq	%r14
14547f403:     	popq	%r15
14547f405:     	popq	%rbp
14547f406:     	retq
14547f407:     	xorl	%eax, %eax
14547f409:     	jmp	0x14547f443 <.text+0x547e443>
14547f40b:     	xorl	%eax, %eax
14547f40d:     	movb	$-0x1, %r9b
14547f410:     	movq	0x58(%rbp), %r11
14547f414:     	movq	0x50(%rbp), %r10
14547f418:     	jmp	0x14547f443 <.text+0x547e443>
14547f41a:     	xorl	%eax, %eax
14547f41c:     	movl	0x60(%rbp), %esi
14547f41f:     	movl	0x64(%rbp), %r14d
14547f423:     	jmp	0x14547f443 <.text+0x547e443>
14547f425:     	movq	0x30(%rbp), %rdi
14547f429:     	movl	0x60(%rbp), %esi
14547f42c:     	movl	0x64(%rbp), %r14d
14547f430:     	movq	0x10(%rbp), %rax
14547f434:     	movb	$-0x1, %r9b
14547f437:     	movq	0x58(%rbp), %r11
14547f43b:     	movq	0x50(%rbp), %r10
14547f43f:     	movq	(%rbp), %rbx
14547f443:     	testq	%rax, %rax
14547f446:     	leaq	0x155a81b(%rip), %r15   # 0x1469d9c68
14547f44d:     	cmoveq	%r15, %rax
14547f451:     	movq	-0x50(%rbp), %r8
14547f455:     	testq	%r8, %r8
14547f458:     	je	0x14547f480 <.text+0x547e480>
14547f45a:     	movq	-0x58(%rbp), %rcx
14547f45e:     	movzbl	(%rcx), %ecx
14547f461:     	cmpq	$0x1, %r11
14547f465:     	movq	%rax, 0x10(%rbp)
14547f469:     	jne	0x14547f48c <.text+0x547e48c>
14547f46b:     	movl	%ecx, %r10d
14547f46e:     	movq	-0x60(%rbp), %rdx
14547f472:     	testq	%rdx, %rdx
14547f475:     	jne	0x14547f28c <.text+0x547e28c>
14547f47b:     	jmp	0x14547f2b6 <.text+0x547e2b6>
14547f480:     	xorl	%ecx, %ecx
14547f482:     	cmpq	$0x1, %r11
14547f486:     	movq	%rax, 0x10(%rbp)
14547f48a:     	je	0x14547f46b <.text+0x547e46b>
14547f48c:     	cmpq	$0x2, 0x40(%rbp)
14547f491:     	jb	0x14547f5c6 <.text+0x547e5c6>
14547f497:     	movq	%r8, 0x58(%rbp)
14547f49b:     	movl	%ecx, 0x40(%rbp)
14547f49e:     	movq	0x20(%r10), %rcx
14547f4a2:     	movq	0x28(%r10), %rdx
14547f4a6:     	callq	0x145514d60 <.text+0x5513d60>
14547f4ab:     	testq	%rax, %rax
14547f4ae:     	je	0x14547f5ed <.text+0x547e5ed>
14547f4b4:     	movq	0x40(%rax), %rdx
14547f4b8:     	testq	%rdx, %rdx
14547f4bb:     	leaq	0x155a7a6(%rip), %r15   # 0x1469d9c68
14547f4c2:     	movl	0x40(%rbp), %r10d
14547f4c6:     	movq	0x58(%rbp), %r8
14547f4ca:     	je	0x14547f5fe <.text+0x547e5fe>
14547f4d0:     	movl	%r14d, 0x64(%rbp)
14547f4d4:     	movl	%esi, 0x60(%rbp)
14547f4d7:     	movq	0x38(%rbp), %rcx
14547f4db:     	movq	0xb8(%rcx), %rsi
14547f4e2:     	xorl	%r14d, %r14d
14547f4e5:     	testq	%rsi, %rsi
14547f4e8:     	je	0x14547f626 <.text+0x547e626>
14547f4ee:     	movq	%rax, 0x50(%rbp)
14547f4f2:     	movq	0x48(%rax), %r9
14547f4f6:     	movq	0xb0(%rcx), %r8
14547f4fd:     	cmpq	$0x1, %rsi
14547f501:     	je	0x14547f56a <.text+0x547e56a>
14547f503:     	xorl	%r14d, %r14d
14547f506:     	movq	%r9, 0x20(%rbp)
14547f50a:     	movq	%r8, 0x28(%rbp)
14547f50e:     	nop
14547f510:     	movq	%r14, 0x18(%rbp)
14547f514:     	movq	%rsi, %rcx
14547f517:     	shrq	%rcx
14547f51a:     	movq	%rcx, 0x38(%rbp)
14547f51e:     	addq	%rcx, %r14
14547f521:     	leaq	(%r14,%r14,2), %rax
14547f525:     	movq	0x8(%r8,%rax,8), %rcx
14547f52a:     	movq	0x28(%rbp), %r8
14547f52e:     	movq	0x10(%r8,%rax,8), %r8
14547f533:     	movq	%r8, %r15
14547f536:     	subq	%r9, %r15
14547f539:     	cmovaeq	%r9, %r8
14547f53d:     	movq	%rdx, %rdi
14547f540:     	callq	0x1457731e7 <.text+0x57721e7>
14547f545:     	movq	0x28(%rbp), %r8
14547f549:     	movq	0x20(%rbp), %r9
14547f54d:     	movq	%rdi, %rdx
14547f550:     	cltq
14547f552:     	testl	%eax, %eax
14547f554:     	cmovneq	%rax, %r15
14547f558:     	testq	%r15, %r15
14547f55b:     	cmovgq	0x18(%rbp), %r14
14547f560:     	subq	0x38(%rbp), %rsi
14547f564:     	cmpq	$0x1, %rsi
14547f568:     	ja	0x14547f510 <.text+0x547e510>
14547f56a:     	leaq	(%r14,%r14,2), %rax
14547f56e:     	movq	0x8(%r8,%rax,8), %rcx
14547f573:     	movq	0x10(%r8,%rax,8), %rax
14547f578:     	movq	%rax, %rsi
14547f57b:     	subq	%r9, %rsi
14547f57e:     	cmovbq	%rax, %r9
14547f582:     	movq	%r9, %r8
14547f585:     	callq	0x1457731e7 <.text+0x57721e7>
14547f58a:     	cltq
14547f58c:     	testl	%eax, %eax
14547f58e:     	cmovneq	%rax, %rsi
14547f592:     	testq	%rsi, %rsi
14547f595:     	movq	0x50(%rbp), %rax
14547f599:     	movq	0x30(%rbp), %rdi
14547f59d:     	movl	0x60(%rbp), %esi
14547f5a0:     	movl	0x64(%rbp), %r14d
14547f5a4:     	leaq	0x155a6bd(%rip), %r15   # 0x1469d9c68
14547f5ab:     	movl	0x40(%rbp), %r10d
14547f5af:     	movq	0x58(%rbp), %r8
14547f5b3:     	je	0x14547f5fe <.text+0x547e5fe>
14547f5b5:     	xorl	%eax, %eax
14547f5b7:     	testq	%rax, %rax
14547f5ba:     	cmovneq	%rax, %r15
14547f5be:     	cmpq	$0x2, %r8
14547f5c2:     	jae	0x14547f60b <.text+0x547e60b>
14547f5c4:     	jmp	0x14547f5d8 <.text+0x547e5d8>
14547f5c6:     	xorl	%eax, %eax
14547f5c8:     	movl	%ecx, %r10d
14547f5cb:     	testq	%rax, %rax
14547f5ce:     	cmovneq	%rax, %r15
14547f5d2:     	cmpq	$0x2, %r8
14547f5d6:     	jae	0x14547f60b <.text+0x547e60b>
14547f5d8:     	xorl	%r9d, %r9d
14547f5db:     	movq	-0x60(%rbp), %rdx
14547f5df:     	testq	%rdx, %rdx
14547f5e2:     	jne	0x14547f28c <.text+0x547e28c>
14547f5e8:     	jmp	0x14547f2b6 <.text+0x547e2b6>
14547f5ed:     	xorl	%eax, %eax
14547f5ef:     	leaq	0x155a672(%rip), %r15   # 0x1469d9c68
14547f5f6:     	movl	0x40(%rbp), %r10d
14547f5fa:     	movq	0x58(%rbp), %r8
14547f5fe:     	testq	%rax, %rax
14547f601:     	cmovneq	%rax, %r15
14547f605:     	cmpq	$0x2, %r8
14547f609:     	jb	0x14547f5d8 <.text+0x547e5d8>
14547f60b:     	movq	-0x58(%rbp), %rax
14547f60f:     	movzbl	0x1(%rax), %r9d
14547f614:     	movq	-0x60(%rbp), %rdx
14547f618:     	testq	%rdx, %rdx
14547f61b:     	jne	0x14547f28c <.text+0x547e28c>
14547f621:     	jmp	0x14547f2b6 <.text+0x547e2b6>
14547f626:     	xorl	%eax, %eax
14547f628:     	movl	0x60(%rbp), %esi
14547f62b:     	movl	0x64(%rbp), %r14d
14547f62f:     	testq	%rax, %rax
14547f632:     	cmovneq	%rax, %r15
14547f636:     	cmpq	$0x2, %r8
14547f63a:     	jae	0x14547f60b <.text+0x547e60b>
14547f63c:     	jmp	0x14547f5d8 <.text+0x547e5d8>

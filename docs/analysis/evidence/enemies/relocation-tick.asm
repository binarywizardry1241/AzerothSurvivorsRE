
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a70fd:     	movss	0x8e4(%r13), %xmm0
1454a7106:     	movss	%xmm0, 0x210(%rbp)
1454a710e:     	movq	0x2a0(%rbp), %rcx
1454a7115:     	movl	0x8(%rcx), %eax
1454a7118:     	movl	%eax, 0x2b8(%rbp)
1454a711e:     	movq	(%rcx), %rax
1454a7121:     	movq	%rax, 0x2b0(%rbp)
1454a7128:     	movq	0x4c8(%r13), %rax
1454a712f:     	imulq	$0x160, 0x4d0(%r13), %rcx # imm = 0x160
1454a713a:     	addq	%rax, %rcx
1454a713d:     	movq	%rax, 0xa0(%rbp)
1454a7144:     	movq	%rcx, 0xa8(%rbp)
1454a714b:     	leaq	0x210(%rbp), %rax
1454a7152:     	movq	%rax, 0xb0(%rbp)
1454a7159:     	leaq	0x2b0(%rbp), %rax
1454a7160:     	movq	%rax, 0xb8(%rbp)
1454a7167:     	movq	$0x4, 0xc0(%rbp)
1454a7172:     	leaq	0x230(%rbp), %rcx
1454a7179:     	leaq	0xa0(%rbp), %rbx
1454a7180:     	movq	%rbx, %rdx
1454a7183:     	callq	0x145531cb0 <.text+0x5530cb0>
1454a7188:     	movq	0x230(%rbp), %rax
1454a718f:     	movq	%rax, 0x358(%rbp)
1454a7196:     	movq	0x238(%rbp), %r15
1454a719d:     	movq	0x240(%rbp), %rax
1454a71a4:     	leaq	(%r15,%rax,8), %rdi
1454a71a8:     	leaq	0x2d8(%rbp), %rsi
1454a71af:     	movss	0x497368(%rip), %xmm12  # 0x14593e520
1454a71b8:     	movss	0x463d07(%rip), %xmm8   # 0x14590aec8
1454a71c1:     	movq	%r15, 0x348(%rbp)
1454a71c8:     	movss	0x44f45b(%rip), %xmm9   # 0x1458f662c
1454a71d1:     	movss	0x4442a6(%rip), %xmm10  # 0x1458eb480
1454a71da:     	jmp	0x1454a7212 <.text+0x54a6212>
1454a71dc:     	nopl	(%rax)
1454a71e0:     	movq	0x540(%r13), %rax
1454a71e7:     	movq	%rsi, %rcx
1454a71ea:     	shlq	$0x5, %rcx
1454a71ee:     	movups	0xa0(%rbp), %xmm0
1454a71f5:     	movups	0xb0(%rbp), %xmm1
1454a71fc:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a7201:     	movups	%xmm0, (%rax,%rcx)
1454a7205:     	incq	%rsi
1454a7208:     	movq	%rsi, 0x548(%r13)
1454a720f:     	movq	%r14, %rsi
1454a7212:     	cmpq	%rdi, %r15
1454a7215:     	je	0x1454a7317 <.text+0x54a6317>
1454a721b:     	movq	(%r15), %r14
1454a721e:     	movl	$0x3f800000, 0x20(%rsp) # imm = 0x3F800000
1454a7226:     	movq	%rsi, %rcx
1454a7229:     	movq	%r13, %rdx
1454a722c:     	movaps	%xmm12, %xmm2
1454a7230:     	movaps	%xmm8, %xmm3
1454a7234:     	callq	0x1454c17b0 <.text+0x54c07b0>
1454a7239:     	nop
1454a723a:     	addq	$0x8, %r15
1454a723e:     	movq	0x4c8(%r13), %rax
1454a7245:     	imulq	$0x160, 0x4d0(%r13), %rdx # imm = 0x160
1454a7250:     	xorl	%ecx, %ecx
1454a7252:     	movq	%rax, %r8
1454a7255:     	nopw	%cs:(%rax,%rax)
1454a7260:     	cmpq	%rcx, %rdx
1454a7263:     	je	0x1454a7212 <.text+0x54a6212>
1454a7265:     	addq	$0x160, %rcx            # imm = 0x160
1454a726c:     	cmpq	%r14, 0x88(%r8)
1454a7273:     	leaq	0x160(%r8), %r8
1454a727a:     	jne	0x1454a7260 <.text+0x54a6260>
1454a727c:     	movl	0x2e0(%rbp), %edx
1454a7282:     	movl	%edx, -0x4c(%rax,%rcx)
1454a7286:     	movq	0x2d8(%rbp), %rdx
1454a728d:     	movq	%rdx, -0x54(%rax,%rcx)
1454a7292:     	movq	0x2d8(%rbp), %rdx
1454a7299:     	movq	%rdx, -0x48(%rax,%rcx)
1454a729e:     	movl	0x2e0(%rbp), %edx
1454a72a4:     	movl	%edx, -0x40(%rax,%rcx)
1454a72a8:     	movss	0x210(%rbp), %xmm0
1454a72b0:     	movss	0x210(%rbp), %xmm1
1454a72b8:     	movlps	%xmm1, -0x3c(%rax,%rcx)
1454a72bd:     	movss	%xmm0, -0x34(%rax,%rcx)
1454a72c3:     	movl	$0x0, -0xf0(%rax,%rcx)
1454a72ce:     	movl	0x908(%r13), %r9d
1454a72d5:     	incl	%r9d
1454a72d8:     	movl	%r9d, 0x908(%r13)
1454a72df:     	movq	%rbx, %rcx
1454a72e2:     	movq	%r14, %rdx
1454a72e5:     	movq	%rsi, %r8
1454a72e8:     	callq	0x1454451b0 <.text+0x54441b0>
1454a72ed:     	nop
1454a72ee:     	movq	%rsi, %r14
1454a72f1:     	movq	0x548(%r13), %rsi
1454a72f8:     	cmpq	0x538(%r13), %rsi
1454a72ff:     	jne	0x1454a71e0 <.text+0x54a61e0>
1454a7305:     	movq	0x340(%rbp), %rcx
1454a730c:     	callq	0x1457580b0 <.text+0x57570b0>
1454a7311:     	nop
1454a7312:     	jmp	0x1454a71e0 <.text+0x54a61e0>
1454a7317:     	movq	0x358(%rbp), %rdx
1454a731e:     	testq	%rdx, %rdx
1454a7321:     	je	0x1454a7339 <.text+0x54a6339>
1454a7323:     	shlq	$0x3, %rdx
1454a7327:     	movl	$0x8, %r8d
1454a732d:     	movq	0x348(%rbp), %rcx
1454a7334:     	callq	0x1400021d0 <.text+0x11d0>

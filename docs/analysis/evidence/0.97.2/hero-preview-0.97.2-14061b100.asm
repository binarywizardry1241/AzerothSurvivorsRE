
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14061b100:     	pushq	%rbp
14061b101:     	pushq	%r15
14061b103:     	pushq	%r14
14061b105:     	pushq	%r13
14061b107:     	pushq	%r12
14061b109:     	pushq	%rsi
14061b10a:     	pushq	%rdi
14061b10b:     	pushq	%rbx
14061b10c:     	subq	$0xd8, %rsp
14061b113:     	leaq	0x80(%rsp), %rbp
14061b11b:     	movq	$-0x2, 0x50(%rbp)
14061b123:     	movq	(%rcx), %r14
14061b126:     	movq	0x8(%rcx), %r15
14061b12a:     	movq	(%rdx), %rax
14061b12d:     	movq	0x8(%rdx), %r8
14061b131:     	cmpq	%r15, %r14
14061b134:     	je	0x14061b2f5 <.text+0x61a2f5>
14061b13a:     	movq	%rax, 0x38(%rbp)
14061b13e:     	movq	0x10(%rcx), %rsi
14061b142:     	movq	0x18(%rcx), %rdi
14061b146:     	movq	0x10(%rdx), %rax
14061b14a:     	subq	%r14, %r15
14061b14d:     	shrq	$0x3, %r15
14061b151:     	leaq	-0x30(%rbp), %r13
14061b155:     	movq	%r8, %rcx
14061b158:     	shlq	$0x7, %rcx
14061b15c:     	movq	%r8, 0x40(%rbp)
14061b160:     	leaq	(%rcx,%r8,8), %rcx
14061b164:     	leaq	(%rax,%rcx), %r12
14061b168:     	addq	$0x80, %r12
14061b16f:     	xorl	%r10d, %r10d
14061b172:     	leaq	-0x18(%rbp), %rbx
14061b176:     	nopw	%cs:(%rax,%rax)
14061b180:     	movq	(%r14,%r10,8), %r8
14061b184:     	movzbl	0x30(%r8), %eax
14061b189:     	cmpb	$0x2, %al
14061b18b:     	jne	0x14061b1a0 <.text+0x61a1a0>
14061b18d:     	movb	$0x2, 0x18(%rbp)
14061b191:     	jmp	0x14061b1f4 <.text+0x61a1f4>
14061b193:     	nopw	%cs:(%rax,%rax)
14061b1a0:     	testb	$0x1, %al
14061b1a2:     	je	0x14061b1c0 <.text+0x61a1c0>
14061b1a4:     	movl	0x31(%r8), %eax
14061b1a8:     	movl	0x34(%r8), %ecx
14061b1ac:     	movl	%ecx, -0x15(%rbp)
14061b1af:     	movl	%eax, -0x18(%rbp)
14061b1b2:     	leaq	0x38(%r8), %rcx
14061b1b6:     	movzbl	0x40(%r8), %eax
14061b1bb:     	movb	$0x1, %dl
14061b1bd:     	jmp	0x14061b1d4 <.text+0x61a1d4>
14061b1bf:     	nop
14061b1c0:     	movq	0x38(%r8), %rax
14061b1c4:     	lock
14061b1c5:     	incq	(%rax)
14061b1c8:     	jle	0x14061b30c <.text+0x61a30c>
14061b1ce:     	leaq	0x38(%r8), %rcx
14061b1d2:     	xorl	%edx, %edx
14061b1d4:     	movq	(%rcx), %rcx
14061b1d7:     	movb	%dl, 0x18(%rbp)
14061b1da:     	movl	-0x18(%rbp), %edx
14061b1dd:     	movl	-0x15(%rbp), %r9d
14061b1e1:     	leaq	0x19(%rbp), %r11
14061b1e5:     	movl	%r9d, 0x3(%r11)
14061b1e9:     	movl	%edx, (%r11)
14061b1ec:     	movq	%rcx, 0x20(%rbp)
14061b1f0:     	movq	%rax, 0x28(%rbp)
14061b1f4:     	movzbl	(%r8), %ecx
14061b1f8:     	testb	%cl, %cl
14061b1fa:     	movq	%r10, 0x30(%rbp)
14061b1fe:     	movb	%cl, 0x4f(%rbp)
14061b201:     	je	0x14061b220 <.text+0x61a220>
14061b203:     	movups	0x1(%r8), %xmm0
14061b208:     	leaq	0x8(%rbp), %rax
14061b20c:     	movups	%xmm0, -0x7(%rax)
14061b210:     	movb	$0x1, %al
14061b212:     	jmp	0x14061b238 <.text+0x61a238>
14061b214:     	nopw	%cs:(%rax,%rax)
14061b220:     	movq	0x8(%r8), %rax
14061b224:     	lock
14061b225:     	incq	(%rax)
14061b228:     	jle	0x14061b30c <.text+0x61a30c>
14061b22e:     	movq	0x8(%r8), %rax
14061b232:     	movq	%rax, 0x8(%rbp)
14061b236:     	xorl	%eax, %eax
14061b238:     	movb	%al, (%rbp)
14061b23b:     	addq	$0x18, %r8
14061b23f:     	movq	%rbx, %rcx
14061b242:     	movq	%rsi, %rdx
14061b245:     	movq	%rdi, %r9
14061b248:     	callq	0x14079da50 <.text+0x79ca50>
14061b24d:     	nop
14061b24e:     	movq	0x28(%rbp), %rax
14061b252:     	movq	%rax, 0x10(%r13)
14061b256:     	movups	0x18(%rbp), %xmm0
14061b25a:     	movups	%xmm0, (%r13)
14061b25f:     	movups	(%rbp), %xmm0
14061b263:     	movaps	%xmm0, -0x60(%rbp)
14061b267:     	movq	0x10(%rbp), %rax
14061b26b:     	movq	%rax, -0x50(%rbp)
14061b26f:     	movq	-0x8(%rbp), %rax
14061b273:     	movq	%rax, -0x8(%r13)
14061b277:     	movups	-0x18(%rbp), %xmm0
14061b27b:     	movups	%xmm0, -0x18(%r13)
14061b280:     	movq	-0x20(%rbp), %rax
14061b284:     	movq	%rax, -0x40(%r12)
14061b289:     	movaps	-0x60(%rbp), %xmm0
14061b28d:     	movq	-0x50(%rbp), %rax
14061b291:     	movq	-0x48(%rbp), %rcx
14061b295:     	movaps	-0x40(%rbp), %xmm1
14061b299:     	movaps	-0x30(%rbp), %xmm2
14061b29d:     	movups	%xmm2, -0x50(%r12)
14061b2a3:     	movups	%xmm1, -0x60(%r12)
14061b2a9:     	movq	%rax, -0x70(%r12)
14061b2ae:     	movq	%rcx, -0x68(%r12)
14061b2b3:     	movups	%xmm0, -0x80(%r12)
14061b2b9:     	movb	$0x2, -0x38(%r12)
14061b2bf:     	movb	$0x2, -0x20(%r12)
14061b2c5:     	movq	$0x0, -0x8(%r12)
14061b2ce:     	movb	$0x0, (%r12)
14061b2d3:     	movq	0x30(%rbp), %r10
14061b2d7:     	incq	%r10
14061b2da:     	addq	$0x88, %r12
14061b2e1:     	cmpq	%r10, %r15
14061b2e4:     	jne	0x14061b180 <.text+0x61a180>
14061b2ea:     	movq	0x40(%rbp), %r8
14061b2ee:     	addq	%r10, %r8
14061b2f1:     	movq	0x38(%rbp), %rax
14061b2f5:     	movq	%r8, (%rax)
14061b2f8:     	addq	$0xd8, %rsp
14061b2ff:     	popq	%rbx
14061b300:     	popq	%rdi
14061b301:     	popq	%rsi
14061b302:     	popq	%r12
14061b304:     	popq	%r13
14061b306:     	popq	%r14
14061b308:     	popq	%r15
14061b30a:     	popq	%rbp
14061b30b:     	retq
14061b30c:     	ud2

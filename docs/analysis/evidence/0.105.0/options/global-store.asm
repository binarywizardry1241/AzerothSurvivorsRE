Disassembly of section .text:

0000000140001000 <.text>:
14063adf0:     	pushq	%rbp
14063adf1:     	pushq	%r14
14063adf3:     	pushq	%rsi
14063adf4:     	pushq	%rdi
14063adf5:     	pushq	%rbx
14063adf6:     	subq	$0x190, %rsp            # imm = 0x190
14063adfd:     	leaq	0x80(%rsp), %rbp
14063ae05:     	movq	$-0x2, 0x108(%rbp)
14063ae10:     	movq	%rcx, -0x18(%rbp)
14063ae14:     	movq	%rdx, -0x10(%rbp)
14063ae18:     	movq	%r8, -0x28(%rbp)
14063ae1c:     	movq	%r9, -0x20(%rbp)
14063ae20:     	leaq	0x78(%rbp), %rcx
14063ae24:     	callq	0x141188c00 <.text+0x1187c00>
14063ae29:     	movq	0x78(%rbp), %rax
14063ae2d:     	cmpq	$-0x1, %rax
14063ae31:     	je	0x14063b39f <.text+0x63a39f>
14063ae37:     	movq	%rax, 0xf0(%rbp)
14063ae3e:     	movq	0x80(%rbp), %rdx
14063ae45:     	movq	0x88(%rbp), %r8
14063ae4c:     	movq	$0x13, 0x20(%rsp)
14063ae55:     	leaq	0x5998e45(%rip), %r9    # 0x145fd3ca1
14063ae5c:     	leaq	-0x8(%rbp), %rcx
14063ae60:     	movq	%rdx, 0xe8(%rbp)
14063ae67:     	callq	0x145b763e0 <.text+0x5b753e0>
14063ae6c:     	nop
14063ae6d:     	movq	0xf0(%rbp), %rdx
14063ae74:     	testq	%rdx, %rdx
14063ae77:     	je	0x14063ae8b <.text+0x639e8b>
14063ae79:     	movl	$0x1, %r8d
14063ae7f:     	movq	0xe8(%rbp), %rcx
14063ae86:     	callq	0x1400021d0 <.text+0x11d0>
14063ae8b:     	movq	-0x8(%rbp), %rax
14063ae8f:     	cmpq	$-0x1, %rax
14063ae93:     	je	0x14063b39f <.text+0x63a39f>
14063ae99:     	movq	%rax, 0xd0(%rbp)
14063aea0:     	movq	(%rbp), %rdx
14063aea4:     	movq	0x8(%rbp), %rsi
14063aea8:     	leaq	-0x8(%rbp), %rcx
14063aeac:     	movq	%rdx, 0xf0(%rbp)
14063aeb3:     	movq	%rsi, %r8
14063aeb6:     	callq	0x145b8c930 <.text+0x5b8b930>
14063aebb:     	nop
14063aebc:     	movq	-0x8(%rbp), %rax
14063aec0:     	cmpq	$-0x1, %rax
14063aec4:     	je	0x14063aede <.text+0x639ede>
14063aec6:     	movq	%rax, 0xe0(%rbp)
14063aecd:     	movq	(%rbp), %rax
14063aed1:     	movq	%rax, 0xe8(%rbp)
14063aed8:     	movq	0x8(%rbp), %rbx
14063aedc:     	jmp	0x14063af28 <.text+0x639f28>
14063aede:     	movq	(%rbp), %rax
14063aee2:     	movl	%eax, %ecx
14063aee4:     	andl	$0x3, %ecx
14063aee7:     	leal	-0x2(%rcx), %edx
14063aeea:     	cmpl	$0x2, %edx
14063aeed:     	jb	0x14063af0f <.text+0x639f0f>
14063aeef:     	testq	%rcx, %rcx
14063aef2:     	je	0x14063af0f <.text+0x639f0f>
14063aef4:     	decq	%rax
14063aef7:     	leaq	0x80(%rbp), %rcx
14063aefe:     	movq	%rax, 0x80(%rbp)
14063af05:     	movb	$0x3, 0x78(%rbp)
14063af09:     	callq	0x145baee60 <.text+0x5bade60>
14063af0e:     	nop
14063af0f:     	movl	$0x1, %eax
14063af14:     	movq	%rax, 0xe8(%rbp)
14063af1b:     	movq	$0x0, 0xe0(%rbp)
14063af26:     	xorl	%ebx, %ebx
14063af28:     	leaq	-0x18(%rbp), %rax
14063af2c:     	movq	%rax, -0x8(%rbp)
14063af30:     	leaq	-0x638e77(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14063af37:     	movq	%rax, (%rbp)
14063af3b:     	leaq	-0x28(%rbp), %rcx
14063af3f:     	movq	%rcx, 0x8(%rbp)
14063af43:     	movq	%rax, 0x10(%rbp)
14063af47:     	leaq	0x58266b9(%rip), %rdx   # 0x145e61607
14063af4e:     	leaq	0x78(%rbp), %rdi
14063af52:     	leaq	-0x8(%rbp), %r8
14063af56:     	movq	%rdi, %rcx
14063af59:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14063af5e:     	nop
14063af5f:     	movups	0x78(%rbp), %xmm0
14063af63:     	movaps	%xmm0, 0xa0(%rbp)
14063af6a:     	movq	0x88(%rbp), %rax
14063af71:     	movq	%rax, 0xb0(%rbp)
14063af78:     	movb	$0x0, 0x106(%rbp)
14063af7f:     	movups	-0x18(%rbp), %xmm0
14063af83:     	movq	$0x0, 0x18(%rbp)
14063af8b:     	movq	%rbx, 0x20(%rbp)
14063af8f:     	movq	0xe8(%rbp), %rax
14063af96:     	movq	%rax, 0x28(%rbp)
14063af9a:     	movq	%rbx, 0x30(%rbp)
14063af9e:     	movq	$0x0, 0x38(%rbp)
14063afa6:     	movq	%rbx, 0x40(%rbp)
14063afaa:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
14063afb4:     	movq	%rax, 0x48(%rbp)
14063afb8:     	movb	$0x1, 0x50(%rbp)
14063afbc:     	movw	$0x0, 0x58(%rbp)
14063afc2:     	movups	%xmm0, -0x8(%rbp)
14063afc6:     	leaq	0x106(%rbp), %rax
14063afcd:     	movq	%rax, 0x8(%rbp)
14063afd1:     	leaq	0xa0(%rbp), %rax
14063afd8:     	movq	%rax, 0x10(%rbp)
14063afdc:     	movb	$0x1, 0x105(%rbp)
14063afe3:     	leaq	0xb8(%rbp), %rcx
14063afea:     	leaq	-0x8(%rbp), %rdx
14063afee:     	callq	0x1408f96c0 <.text+0x8f86c0>
14063aff3:     	nop
14063aff4:     	movb	$0x1, %al
14063aff6:     	movq	0xc8(%rbp), %rbx
14063affd:     	cmpb	$0x0, 0x106(%rbp)
14063b004:     	jne	0x14063b11d <.text+0x63a11d>
14063b00a:     	testq	%rbx, %rbx
14063b00d:     	jne	0x14063b0b1 <.text+0x63a0b1>
14063b013:     	callq	0x140002200 <.text+0x1200>
14063b018:     	movl	$0x3d, %ecx
14063b01d:     	movl	$0x1, %edx
14063b022:     	callq	0x1400021c0 <.text+0x11c0>
14063b027:     	testq	%rax, %rax
14063b02a:     	je	0x14063b3f5 <.text+0x63a3f5>
14063b030:     	movups	0x5826629(%rip), %xmm0  # 0x145e61660
14063b037:     	movups	%xmm0, 0x2d(%rax)
14063b03b:     	movups	0x5826611(%rip), %xmm0  # 0x145e61653
14063b042:     	movups	%xmm0, 0x20(%rax)
14063b046:     	movups	0x58265f6(%rip), %xmm0  # 0x145e61643
14063b04d:     	movups	%xmm0, 0x10(%rax)
14063b051:     	movups	0x58265db(%rip), %xmm0  # 0x145e61633
14063b058:     	movq	%rax, 0xf8(%rbp)
14063b05f:     	movups	%xmm0, (%rax)
14063b062:     	movq	0xc8(%rbp), %rbx
14063b069:     	cmpq	0xb8(%rbp), %rbx
14063b070:     	jne	0x14063b07f <.text+0x63a07f>
14063b072:     	leaq	0xb8(%rbp), %rcx
14063b079:     	callq	0x145bfed40 <.text+0x5bfdd40>
14063b07e:     	nop
14063b07f:     	movq	0xc0(%rbp), %rax
14063b086:     	leaq	(%rbx,%rbx,2), %rcx
14063b08a:     	movq	$0x3d, (%rax,%rcx,8)
14063b092:     	movq	0xf8(%rbp), %rdx
14063b099:     	movq	%rdx, 0x8(%rax,%rcx,8)
14063b09e:     	movq	$0x3d, 0x10(%rax,%rcx,8)
14063b0a7:     	incq	%rbx
14063b0aa:     	movq	%rbx, 0xc8(%rbp)
14063b0b1:     	movq	0xa0(%rbp), %rax
14063b0b8:     	movq	%rax, 0xf8(%rbp)
14063b0bf:     	movq	0xa8(%rbp), %rax
14063b0c6:     	movq	%rax, 0xd8(%rbp)
14063b0cd:     	movq	0xb0(%rbp), %r14
14063b0d4:     	cmpq	0xb8(%rbp), %rbx
14063b0db:     	jne	0x14063b0ea <.text+0x63a0ea>
14063b0dd:     	leaq	0xb8(%rbp), %rcx
14063b0e4:     	callq	0x145bfed40 <.text+0x5bfdd40>
14063b0e9:     	nop
14063b0ea:     	movq	0xc0(%rbp), %rax
14063b0f1:     	leaq	(%rbx,%rbx,2), %rcx
14063b0f5:     	movq	0xf8(%rbp), %rdx
14063b0fc:     	movq	%rdx, (%rax,%rcx,8)
14063b100:     	movq	0xd8(%rbp), %rdx
14063b107:     	movq	%rdx, 0x8(%rax,%rcx,8)
14063b10c:     	movq	%r14, 0x10(%rax,%rcx,8)
14063b111:     	incq	%rbx
14063b114:     	movq	%rbx, 0xc8(%rbp)
14063b11b:     	xorl	%eax, %eax
14063b11d:     	movq	0xc0(%rbp), %rdx
14063b124:     	movl	%eax, 0xf8(%rbp)
14063b12a:     	movb	%al, 0x107(%rbp)
14063b130:     	movq	$0x1, 0x20(%rsp)
14063b139:     	leaq	0x5821d9a(%rip), %r9    # 0x145e5ceda
14063b140:     	leaq	-0x8(%rbp), %rcx
14063b144:     	movq	%rbx, %r8
14063b147:     	callq	0x1411510c0 <.text+0x11500c0>
14063b14c:     	nop
14063b14d:     	movq	0x8(%rbp), %r9
14063b151:     	movq	%r9, 0x70(%rbp)
14063b155:     	movups	-0x8(%rbp), %xmm0
14063b159:     	movaps	%xmm0, 0x60(%rbp)
14063b15d:     	cmpq	%r9, 0x60(%rbp)
14063b161:     	je	0x14063b3ad <.text+0x63a3ad>
14063b167:     	movq	0x68(%rbp), %rbx
14063b16b:     	movb	$0xa, (%rbx,%r9)
14063b170:     	incq	%r9
14063b173:     	movq	%r9, 0x70(%rbp)
14063b177:     	movq	0xf0(%rbp), %rcx
14063b17e:     	movq	%rsi, %rdx
14063b181:     	movq	%rbx, %r8
14063b184:     	callq	0x141188250 <.text+0x1187250>
14063b189:     	nop
14063b18a:     	testq	%rax, %rax
14063b18d:     	je	0x14063b2b3 <.text+0x63a2b3>
14063b193:     	movq	%rbx, 0xd8(%rbp)
14063b19a:     	movq	%rax, 0x98(%rbp)
14063b1a1:     	movq	0x79bbe00(%rip), %rax   # 0x147ff6fa8
14063b1a8:     	movq	(%rax), %rax
14063b1ab:     	cmpq	$0x3, %rax
14063b1af:     	ja	0x14063b27e <.text+0x63a27e>
14063b1b5:     	movzbl	0x7980724(%rip), %edx   # 0x147fbb8e0
14063b1bc:     	movzbl	%dl, %eax
14063b1bf:     	leal	-0x1(%rax), %ecx
14063b1c2:     	cmpl	$0x2, %ecx
14063b1c5:     	jae	0x14063b276 <.text+0x63a276>
14063b1cb:     	movq	0x79806fe(%rip), %rcx   # 0x147fbb8d0
14063b1d2:     	callq	0x144c46ce0 <.text+0x4c45ce0>
14063b1d7:     	nop
14063b1d8:     	testb	%al, %al
14063b1da:     	je	0x14063b27e <.text+0x63a27e>
14063b1e0:     	movq	0x79806e9(%rip), %rcx   # 0x147fbb8d0
14063b1e7:     	leaq	0x30(%rcx), %rax
14063b1eb:     	movq	0xf0(%rbp), %rdx
14063b1f2:     	movq	%rdx, -0x58(%rbp)
14063b1f6:     	movq	%rsi, -0x50(%rbp)
14063b1fa:     	leaq	-0x58(%rbp), %rdx
14063b1fe:     	movq	%rdx, 0x78(%rbp)
14063b202:     	leaq	0x5554177(%rip), %rdx   # 0x145b8f380 <.text+0x5b8e380>
14063b209:     	movq	%rdx, 0x80(%rbp)
14063b210:     	leaq	0x98(%rbp), %rdx
14063b217:     	movq	%rdx, 0x88(%rbp)
14063b21e:     	leaq	0x5571f6b(%rip), %rdx   # 0x145bad190 <.text+0x5bac190>
14063b225:     	movq	%rdx, 0x90(%rbp)
14063b22c:     	leaq	0x582643d(%rip), %rdx   # 0x145e61670
14063b233:     	movq	%rdx, -0x48(%rbp)
14063b237:     	movq	%rdi, -0x40(%rbp)
14063b23b:     	leaq	-0x48(%rbp), %rdx
14063b23f:     	movq	%rdx, -0x38(%rbp)
14063b243:     	leaq	0x5820cf6(%rip), %rdx   # 0x145e5bf40
14063b24a:     	movq	%rdx, -0x30(%rbp)
14063b24e:     	movq	$0x1, -0x8(%rbp)
14063b256:     	leaq	-0x38(%rbp), %rdx
14063b25a:     	movq	%rdx, (%rbp)
14063b25e:     	movq	$0x1, 0x8(%rbp)
14063b266:     	movq	%rax, 0x10(%rbp)
14063b26a:     	leaq	-0x8(%rbp), %rdx
14063b26e:     	callq	0x144c48500 <.text+0x4c47500>
14063b273:     	nop
14063b274:     	jmp	0x14063b27e <.text+0x63a27e>
14063b276:     	testl	%eax, %eax
14063b278:     	jne	0x14063b3d9 <.text+0x63a3d9>
14063b27e:     	movq	0x98(%rbp), %rax
14063b285:     	movl	%eax, %ecx
14063b287:     	andl	$0x3, %ecx
14063b28a:     	leal	-0x2(%rcx), %edx
14063b28d:     	cmpl	$0x2, %edx
14063b290:     	jb	0x14063b2ac <.text+0x63a2ac>
14063b292:     	testq	%rcx, %rcx
14063b295:     	je	0x14063b2ac <.text+0x63a2ac>
14063b297:     	decq	%rax
14063b29a:     	leaq	(%rbp), %rcx
14063b29e:     	movq	%rax, (%rbp)
14063b2a2:     	movb	$0x3, -0x8(%rbp)
14063b2a6:     	callq	0x145baee60 <.text+0x5bade60>
14063b2ab:     	nop
14063b2ac:     	movq	0xd8(%rbp), %rbx
14063b2b3:     	movq	0x60(%rbp), %rdx
14063b2b7:     	testq	%rdx, %rdx
14063b2ba:     	je	0x14063b2ca <.text+0x63a2ca>
14063b2bc:     	movl	$0x1, %r8d
14063b2c2:     	movq	%rbx, %rcx
14063b2c5:     	callq	0x1400021d0 <.text+0x11d0>
14063b2ca:     	movq	0xc8(%rbp), %rsi
14063b2d1:     	testq	%rsi, %rsi
14063b2d4:     	je	0x14063b312 <.text+0x63a312>
14063b2d6:     	movq	0xc0(%rbp), %rdi
14063b2dd:     	addq	$0x8, %rdi
14063b2e1:     	jmp	0x14063b2f9 <.text+0x63a2f9>
14063b2e3:     	nopw	%cs:(%rax,%rax)
14063b2f0:     	addq	$0x18, %rdi
14063b2f4:     	decq	%rsi
14063b2f7:     	je	0x14063b312 <.text+0x63a312>
14063b2f9:     	movq	-0x8(%rdi), %rdx
14063b2fd:     	testq	%rdx, %rdx
14063b300:     	je	0x14063b2f0 <.text+0x63a2f0>
14063b302:     	movq	(%rdi), %rcx
14063b305:     	movl	$0x1, %r8d
14063b30b:     	callq	0x1400021d0 <.text+0x11d0>
14063b310:     	jmp	0x14063b2f0 <.text+0x63a2f0>
14063b312:     	movq	0xb8(%rbp), %rax
14063b319:     	testq	%rax, %rax
14063b31c:     	je	0x14063b338 <.text+0x63a338>
14063b31e:     	movq	0xc0(%rbp), %rcx
14063b325:     	shlq	$0x3, %rax
14063b329:     	leaq	(%rax,%rax,2), %rdx
14063b32d:     	movl	$0x8, %r8d
14063b333:     	callq	0x1400021d0 <.text+0x11d0>
14063b338:     	cmpb	$0x0, 0xf8(%rbp)
14063b33f:     	movq	0xd0(%rbp), %rsi
14063b346:     	je	0x14063b366 <.text+0x63a366>
14063b348:     	movq	0xa0(%rbp), %rdx
14063b34f:     	testq	%rdx, %rdx
14063b352:     	je	0x14063b366 <.text+0x63a366>
14063b354:     	movq	0xa8(%rbp), %rcx
14063b35b:     	movl	$0x1, %r8d
14063b361:     	callq	0x1400021d0 <.text+0x11d0>
14063b366:     	movq	0xe0(%rbp), %rdx
14063b36d:     	testq	%rdx, %rdx
14063b370:     	je	0x14063b384 <.text+0x63a384>
14063b372:     	movl	$0x1, %r8d
14063b378:     	movq	0xe8(%rbp), %rcx
14063b37f:     	callq	0x1400021d0 <.text+0x11d0>
14063b384:     	testq	%rsi, %rsi
14063b387:     	je	0x14063b39f <.text+0x63a39f>
14063b389:     	movl	$0x1, %r8d
14063b38f:     	movq	0xf0(%rbp), %rcx
14063b396:     	movq	%rsi, %rdx
14063b399:     	callq	0x1400021d0 <.text+0x11d0>
14063b39e:     	nop
14063b39f:     	addq	$0x190, %rsp            # imm = 0x190
14063b3a6:     	popq	%rbx
14063b3a7:     	popq	%rdi
14063b3a8:     	popq	%rsi
14063b3a9:     	popq	%r14
14063b3ab:     	popq	%rbp
14063b3ac:     	retq
14063b3ad:     	movq	$0x1, 0x20(%rsp)
14063b3b6:     	leaq	0x60(%rbp), %rcx
14063b3ba:     	movl	$0x1, %r8d
14063b3c0:     	movq	%r9, %rbx
14063b3c3:     	movl	$0x1, %r9d
14063b3c9:     	movq	%rbx, %rdx
14063b3cc:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14063b3d1:     	movq	%rbx, %r9
14063b3d4:     	jmp	0x14063b167 <.text+0x63a167>
14063b3d9:     	leaq	0x79804f0(%rip), %rcx   # 0x147fbb8d0
14063b3e0:     	callq	0x145d15470 <.text+0x5d14470>
14063b3e5:     	nop
14063b3e6:     	movl	%eax, %edx
14063b3e8:     	testb	%al, %al
14063b3ea:     	jne	0x14063b1cb <.text+0x63a1cb>
14063b3f0:     	jmp	0x14063b27e <.text+0x63a27e>
14063b3f5:     	movb	$0x1, 0x107(%rbp)
14063b3fc:     	movl	$0x1, %ecx
14063b401:     	movl	$0x3d, %edx
14063b406:     	callq	0x145d6944b <.text+0x5d6844b>
14063b40b:     	nop
14063b40c:     	ud2

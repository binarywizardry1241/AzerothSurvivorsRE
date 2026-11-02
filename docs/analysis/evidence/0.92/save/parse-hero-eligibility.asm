
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453fcf0d:     	leal	-0x1(%r12), %eax
1453fcf12:     	cmpb	$0xa, %al
1453fcf14:     	ja	0x1453fcd40 <.text+0x53fbd40>
1453fcf1a:     	movzbl	%al, %ecx
1453fcf1d:     	movl	$0x5df, %eax            # imm = 0x5DF
1453fcf22:     	btl	%ecx, %eax
1453fcf25:     	jae	0x1453fcd40 <.text+0x53fbd40>
1453fcf2b:     	shll	$0x3, %ecx
1453fcf2e:     	leaq	0x12df103(%rip), %rax   # 0x1466dc038
1453fcf35:     	movq	(%rcx,%rax), %rax
1453fcf39:     	leaq	0x12df150(%rip), %rdx   # 0x1466dc090
1453fcf40:     	movq	(%rcx,%rdx), %rcx
1453fcf44:     	xorl	%edx, %edx
1453fcf46:     	cmpb	%r11b, (%rax,%rdx)
1453fcf4a:     	je	0x1453fcf59 <.text+0x53fbf59>
1453fcf4c:     	incq	%rdx
1453fcf4f:     	cmpq	%rdx, %rcx
1453fcf52:     	jne	0x1453fcf46 <.text+0x53fbf46>
1453fcf54:     	jmp	0x1453fcd40 <.text+0x53fbd40>
1453fcf59:     	movq	0x38(%rbx), %rdx
1453fcf5d:     	testq	%rdx, %rdx
1453fcf60:     	je	0x1453fcd40 <.text+0x53fbd40>
1453fcf66:     	movq	0x30(%rbx), %rcx
1453fcf6a:     	cmpq	$0x1, %rdx
1453fcf6e:     	jne	0x1453fcf8a <.text+0x53fbf8a>
1453fcf70:     	movzbl	(%rcx), %r8d
1453fcf74:     	cmpl	$0x2b, %r8d
1453fcf78:     	je	0x1453fcd40 <.text+0x53fbd40>
1453fcf7e:     	cmpl	$0x2d, %r8d
1453fcf82:     	je	0x1453fcd40 <.text+0x53fbd40>
1453fcf88:     	jmp	0x1453fcf8e <.text+0x53fbf8e>
1453fcf8a:     	movzbl	(%rcx), %r8d
1453fcf8e:     	xorl	%eax, %eax
1453fcf90:     	cmpb	$0x2b, %r8b
1453fcf94:     	sete	%al
1453fcf97:     	movq	%rdx, %r8
1453fcf9a:     	subq	%rax, %r8
1453fcf9d:     	addq	%rax, %rcx
1453fcfa0:     	cmpq	$0x3, %r8
1453fcfa4:     	jae	0x1453fcfcd <.text+0x53fbfcd>
1453fcfa6:     	testq	%r8, %r8
1453fcfa9:     	je	0x1453fd016 <.text+0x53fc016>
1453fcfab:     	movzbl	(%rcx), %eax
1453fcfae:     	addl	$-0x30, %eax
1453fcfb1:     	cmpl	$0x9, %eax
1453fcfb4:     	ja	0x1453fcd40 <.text+0x53fbd40>
1453fcfba:     	cmpq	$0x1, %r8
1453fcfbe:     	jne	0x1453fd224 <.text+0x53fc224>
1453fcfc4:     	movl	%r11d, 0x358(%rbp)
1453fcfcb:     	jmp	0x1453fd01f <.text+0x53fc01f>
1453fcfcd:     	negq	%rax
1453fcfd0:     	addq	%rax, %rdx
1453fcfd3:     	negq	%rdx
1453fcfd6:     	xorl	%r8d, %r8d
1453fcfd9:     	xorl	%eax, %eax
1453fcfdb:     	movq	%rdx, %r9
1453fcfde:     	addq	%r8, %r9
1453fcfe1:     	je	0x1453fcfc4 <.text+0x53fbfc4>
1453fcfe3:     	movb	$0xa, %r9b
1453fcfe6:     	mulb	%r9b
1453fcfe9:     	jo	0x1453fcd40 <.text+0x53fbd40>
1453fcfef:     	movzbl	(%rcx,%r8), %r10d
1453fcff4:     	addl	$-0x30, %r10d
1453fcff8:     	addb	%r10b, %al
1453fcffb:     	setb	%r9b
1453fcfff:     	cmpl	$0x9, %r10d
1453fd003:     	ja	0x1453fcd40 <.text+0x53fbd40>
1453fd009:     	incq	%r8
1453fd00c:     	testb	%r9b, %r9b
1453fd00f:     	je	0x1453fcfdb <.text+0x53fbfdb>
1453fd011:     	jmp	0x1453fcd40 <.text+0x53fbd40>
1453fd016:     	movl	%r11d, 0x358(%rbp)
1453fd01d:     	xorl	%eax, %eax
1453fd01f:     	movl	%eax, 0x318(%rbp)
1453fd025:     	testb	%al, %al
1453fd027:     	setne	0x330(%rbp)
1453fd02e:     	movq	0x40(%rbx), %rax
1453fd032:     	movq	%rbx, 0x340(%rbp)
1453fd039:     	movq	0x48(%rbx), %rcx
1453fd03d:     	movq	$0x0, 0x1f0(%rbp)
1453fd048:     	movq	%rcx, 0x1f8(%rbp)
1453fd04f:     	movq	%rax, 0x200(%rbp)
1453fd056:     	movq	%rcx, 0x208(%rbp)
1453fd05d:     	movq	$0x0, 0x210(%rbp)
1453fd068:     	movq	%rcx, 0x218(%rbp)
1453fd06f:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
1453fd079:     	movq	%rax, 0x220(%rbp)
1453fd080:     	movb	$0x1, 0x228(%rbp)
1453fd087:     	movw	$0x1, 0x230(%rbp)
1453fd090:     	leaq	0x2c8(%rbp), %rcx
1453fd097:     	movq	%r15, %rdx
1453fd09a:     	callq	0x1454e3190 <.text+0x54e2190>
1453fd09f:     	nop
1453fd0a0:     	cmpq	$0x5, 0x2d8(%rbp)
1453fd0a8:     	jne	0x1453fd0f8 <.text+0x53fc0f8>
1453fd0aa:     	movq	0x2c8(%rbp), %rdx
1453fd0b1:     	movq	0x2d0(%rbp), %rcx
1453fd0b8:     	movl	(%rcx), %eax
1453fd0ba:     	movzbl	0x4(%rcx), %r8d
1453fd0bf:     	shlq	$0x20, %r8
1453fd0c3:     	orq	%rax, %r8
1453fd0c6:     	movabsq	$-0x10000000000, %rax   # imm = 0xFFFFFF0000000000
1453fd0d0:     	movq	0x310(%rbp), %r9
1453fd0d7:     	andq	%rax, %r9
1453fd0da:     	movq	%r9, %rax
1453fd0dd:     	orq	%r8, %rax
1453fd0e0:     	testq	%rdx, %rdx
1453fd0e3:     	je	0x1453fd13a <.text+0x53fc13a>
1453fd0e5:     	movl	$0x1, %r8d
1453fd0eb:     	movq	%rax, %rbx
1453fd0ee:     	callq	0x1400021d0 <.text+0x11d0>
1453fd0f3:     	movq	%rbx, %rax
1453fd0f6:     	jmp	0x1453fd13a <.text+0x53fc13a>
1453fd0f8:     	movq	0x2c8(%rbp), %rdx
1453fd0ff:     	movq	0x2d0(%rbp), %rax
1453fd106:     	cmpq	$-0x1, %rdx
1453fd10a:     	je	0x1453fd13a <.text+0x53fc13a>
1453fd10c:     	movq	%rax, 0x310(%rbp)
1453fd113:     	testq	%rdx, %rdx
1453fd116:     	movq	0x340(%rbp), %rbx
1453fd11d:     	je	0x1453fcd40 <.text+0x53fbd40>
1453fd123:     	movl	$0x1, %r8d
1453fd129:     	movq	0x310(%rbp), %rcx
1453fd130:     	callq	0x1400021d0 <.text+0x11d0>
1453fd135:     	jmp	0x1453fcd40 <.text+0x53fbd40>
1453fd13a:     	movl	0x358(%rbp), %edx
1453fd140:     	movzbl	0x330(%rbp), %r8d
1453fd148:     	movq	%rax, 0x310(%rbp)
1453fd14f:     	movq	%rax, %rcx
1453fd152:     	movl	%edx, 0x358(%rbp)
1453fd158:     	callq	0x14544e6f0 <.text+0x544d6f0>
1453fd15d:     	movq	%rax, 0x330(%rbp)
1453fd164:     	xorl	%ebx, %ebx
1453fd166:     	cmpb	$0x0, 0x318(%rbp)
1453fd16d:     	setne	%r8b
1453fd171:     	movq	0x130(%rbp), %rdx
1453fd178:     	testq	%rdx, %rdx
1453fd17b:     	je	0x1453fd1a2 <.text+0x53fc1a2>
1453fd17d:     	shlq	$0x4, %rdx
1453fd181:     	movb	%r8b, 0x318(%rbp)
1453fd188:     	movl	$0x8, %r8d
1453fd18e:     	movq	0x340(%rbp), %rcx
1453fd195:     	callq	0x1400021d0 <.text+0x11d0>
1453fd19a:     	movzbl	0x318(%rbp), %r8d
1453fd1a2:     	movzbl	%r12b, %eax
1453fd1a6:     	movzbl	0x358(%rbp), %ecx
1453fd1ad:     	shll	$0x8, %ecx
1453fd1b0:     	orq	%rax, %rcx
1453fd1b3:     	movb	%r8b, %bl
1453fd1b6:     	shll	$0x10, %ebx
1453fd1b9:     	orq	%rcx, %rbx
1453fd1bc:     	movq	0x330(%rbp), %r12
1453fd1c3:     	shlq	$0x18, %r12
1453fd1c7:     	orq	%rbx, %r12
1453fd1ca:     	movq	%r12, 0x1f0(%rbp)
1453fd1d1:     	leaq	0x1d8(%rbp), %rcx
1453fd1d8:     	movq	%r15, %rdx
1453fd1db:     	callq	0x1454d7a90 <.text+0x54d6a90>
1453fd1e0:     	movq	0x1e8(%rbp), %rbx
1453fd1e7:     	cmpq	0x1d8(%rbp), %rbx
1453fd1ee:     	jne	0x1453fd1fd <.text+0x53fc1fd>
1453fd1f0:     	leaq	0x1d8(%rbp), %rcx
1453fd1f7:     	callq	0x14588a110 <.text+0x5889110>
1453fd1fc:     	nop
1453fd1fd:     	movq	0x1e0(%rbp), %rax
1453fd204:     	movq	%r12, (%rax,%rbx,8)
1453fd208:     	incq	%rbx
1453fd20b:     	movq	%rbx, 0x1e8(%rbp)
1453fd212:     	movq	%rdi, %rbx
1453fd215:     	testb	$0x1, %sil
1453fd219:     	je	0x1453fcb7d <.text+0x53fbb7d>
1453fd21f:     	jmp	0x1453fc9a2 <.text+0x53fb9a2>
1453fd224:     	movzbl	0x1(%rcx), %ecx
1453fd228:     	addl	$-0x30, %ecx

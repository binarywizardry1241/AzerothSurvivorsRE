
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14085ad80:     	pushq	%rbp
14085ad81:     	pushq	%r15
14085ad83:     	pushq	%r14
14085ad85:     	pushq	%r12
14085ad87:     	pushq	%rsi
14085ad88:     	pushq	%rdi
14085ad89:     	pushq	%rbx
14085ad8a:     	movl	$0x1740, %eax           # imm = 0x1740
14085ad8f:     	callq	0x145756270 <.text+0x5755270>
14085ad94:     	subq	%rax, %rsp
14085ad97:     	leaq	0x80(%rsp), %rbp
14085ad9f:     	movaps	%xmm7, 0x16b0(%rbp)
14085ada6:     	movaps	%xmm6, 0x16a0(%rbp)
14085adad:     	movq	$-0x2, 0x1698(%rbp)
14085adb8:     	movq	%rdx, %rsi
14085adbb:     	leaq	0x40(%rdx), %rdi
14085adbf:     	leaq	0x5a8(%rdx), %r15
14085adc6:     	movq	%rdi, 0x1628(%rbp)
14085adcd:     	movq	%r15, 0x1630(%rbp)
14085add4:     	movq	$0x0, 0x1610(%rbp)
14085addf:     	movq	$0x8, 0x1618(%rbp)
14085adea:     	movq	$0x0, 0x1620(%rbp)
14085adf5:     	cmpq	$0x0, 0x90(%rdx)
14085adfd:     	je	0x14085aeab <.text+0x859eab>
14085ae03:     	movabsq	$0x2cbe46de464aaa6e, %rcx # imm = 0x2CBE46DE464AAA6E
14085ae0d:     	movq	0x78(%rsi), %rax
14085ae11:     	movq	0x80(%rsi), %rdx
14085ae18:     	xorl	%r8d, %r8d
14085ae1b:     	movdqa	0x50e8aad(%rip), %xmm0  # 0x1459438d0
14085ae23:     	pcmpeqd	%xmm1, %xmm1
14085ae27:     	movdqa	0x519cfc1(%rip), %xmm2  # 0x1459f7df0
14085ae2f:     	andq	%rdx, %rcx
14085ae32:     	movdqu	(%rax,%rcx), %xmm3
14085ae37:     	movdqa	%xmm3, %xmm4
14085ae3b:     	pcmpeqb	%xmm0, %xmm4
14085ae3f:     	pmovmskb	%xmm4, %r9d
14085ae44:     	testl	%r9d, %r9d
14085ae47:     	je	0x14085ae90 <.text+0x859e90>
14085ae49:     	tzcntl	%r9d, %r10d
14085ae4e:     	addq	%rcx, %r10
14085ae51:     	andq	%rdx, %r10
14085ae54:     	negq	%r10
14085ae57:     	leaq	(%r10,%r10,2), %r10
14085ae5b:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085ae62:     	pcmpeqb	%xmm2, %xmm4
14085ae66:     	pmovmskb	%xmm4, %r11d
14085ae6b:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085ae72:     	je	0x14085af5f <.text+0x859f5f>
14085ae78:     	leal	-0x1(%r9), %r10d
14085ae7c:     	andw	%r9w, %r10w
14085ae80:     	movl	%r10d, %r9d
14085ae83:     	jne	0x14085ae49 <.text+0x859e49>
14085ae85:     	nopw	%cs:(%rax,%rax)
14085ae90:     	pcmpeqb	%xmm1, %xmm3
14085ae94:     	pmovmskb	%xmm3, %r9d
14085ae99:     	testl	%r9d, %r9d
14085ae9c:     	jne	0x14085aeab <.text+0x859eab>
14085ae9e:     	addq	%r8, %rcx
14085aea1:     	addq	$0x10, %rcx
14085aea5:     	addq	$0x10, %r8
14085aea9:     	jmp	0x14085ae2f <.text+0x859e2f>
14085aeab:     	movzbl	0xa0(%rsi), %eax
14085aeb2:     	movq	0xe0(%rsi), %rax
14085aeb9:     	movq	0xe8(%rsi), %rcx
14085aec0:     	movabsq	$0x2cbe46de464aaa6e, %rdx # imm = 0x2CBE46DE464AAA6E
14085aeca:     	xorl	%r8d, %r8d
14085aecd:     	movdqa	0x50e89fb(%rip), %xmm0  # 0x1459438d0
14085aed5:     	pcmpeqd	%xmm1, %xmm1
14085aed9:     	movdqa	0x519cf0f(%rip), %xmm2  # 0x1459f7df0
14085aee1:     	andq	%rcx, %rdx
14085aee4:     	movdqu	(%rax,%rdx), %xmm3
14085aee9:     	movdqa	%xmm3, %xmm4
14085aeed:     	pcmpeqb	%xmm0, %xmm4
14085aef1:     	pmovmskb	%xmm4, %r11d
14085aef6:     	testl	%r11d, %r11d
14085aef9:     	je	0x14085af40 <.text+0x859f40>
14085aefb:     	tzcntl	%r11d, %r10d
14085af00:     	addq	%rdx, %r10
14085af03:     	andq	%rcx, %r10
14085af06:     	movq	%r10, %rbx
14085af09:     	shlq	$0x7, %rbx
14085af0d:     	movq	%rax, %r9
14085af10:     	subq	%rbx, %r9
14085af13:     	movdqu	-0x80(%r9), %xmm4
14085af19:     	pcmpeqb	%xmm2, %xmm4
14085af1d:     	pmovmskb	%xmm4, %ebx
14085af21:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
14085af27:     	je	0x14085af7c <.text+0x859f7c>
14085af29:     	leal	-0x1(%r11), %r9d
14085af2d:     	andw	%r11w, %r9w
14085af31:     	movl	%r9d, %r11d
14085af34:     	jne	0x14085aefb <.text+0x859efb>
14085af36:     	nopw	%cs:(%rax,%rax)
14085af40:     	pcmpeqb	%xmm1, %xmm3
14085af44:     	pmovmskb	%xmm3, %r9d
14085af49:     	testl	%r9d, %r9d
14085af4c:     	jne	0x14085afef <.text+0x859fef>
14085af52:     	addq	%r8, %rdx
14085af55:     	addq	$0x10, %rdx
14085af59:     	addq	$0x10, %r8
14085af5d:     	jmp	0x14085aee1 <.text+0x859ee1>
14085af5f:     	leaq	(%rax,%r10,8), %rax
14085af63:     	movq	-0x8(%rax), %r14
14085af67:     	movq	0x1610(%rbp), %rdx
14085af6e:     	testq	%rdx, %rdx
14085af71:     	jne	0x14085b08d <.text+0x85a08d>
14085af77:     	jmp	0x14085b0a3 <.text+0x85a0a3>
14085af7c:     	leaq	-0x10(%r10), %rdx
14085af80:     	andq	%rcx, %rdx
14085af83:     	movdqu	(%rax,%rdx), %xmm0
14085af88:     	pcmpeqd	%xmm1, %xmm1
14085af8c:     	pcmpeqb	%xmm1, %xmm0
14085af90:     	pmovmskb	%xmm0, %ecx
14085af94:     	movdqu	(%rax,%r10), %xmm0
14085af9a:     	pcmpeqb	%xmm1, %xmm0
14085af9e:     	pmovmskb	%xmm0, %r8d
14085afa3:     	movw	$0x1f, %r11w
14085afa8:     	bsrw	%cx, %r11w
14085afad:     	xorl	$0xf, %r11d
14085afb1:     	orl	$0x10000, %r8d          # imm = 0x10000
14085afb8:     	tzcntl	%r8d, %r8d
14085afbd:     	addl	%r11d, %r8d
14085afc0:     	movb	$-0x80, %cl
14085afc2:     	cmpw	$0xf, %r8w
14085afc7:     	ja	0x14085afd2 <.text+0x859fd2>
14085afc9:     	incq	0xf0(%rsi)
14085afd0:     	movb	$-0x1, %cl
14085afd2:     	movb	%cl, (%rax,%r10)
14085afd6:     	movb	%cl, 0x10(%rax,%rdx)
14085afda:     	decq	0xf8(%rsi)
14085afe1:     	movq	-0x70(%r9), %rax
14085afe5:     	cmpq	$0x2, %rax
14085afe9:     	jne	0x14085fc46 <.text+0x85ec46>
14085afef:     	movq	(%r15), %r14
14085aff2:     	leaq	0x1(%r14), %rax
14085aff6:     	movq	%rax, (%r15)
14085aff9:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085b002:     	movq	$0x1, 0x550(%rbp)
14085b00d:     	movdqu	0x519d1cb(%rip), %xmm0  # 0x1459f81e0
14085b015:     	movdqu	%xmm0, 0x558(%rbp)
14085b01d:     	movq	$0x8, 0x578(%rbp)
14085b028:     	movq	$0x30, 0x580(%rbp)
14085b033:     	leaq	-0x36543a(%rip), %rax   # 0x1404f5c00 <.text+0x4f4c00>
14085b03a:     	movq	%rax, 0x598(%rbp)
14085b041:     	movb	$0x1, 0x5a2(%rbp)
14085b048:     	movq	$0x0, 0x568(%rbp)
14085b053:     	movb	$0x2, 0x588(%rbp)
14085b05a:     	leaq	0x550(%rbp), %r8
14085b061:     	movq	%rdi, %rcx
14085b064:     	movq	%r14, %rdx
14085b067:     	callq	0x14004abc0 <.text+0x49bc0>
14085b06c:     	nop
14085b06d:     	leaq	0x78(%rsi), %rcx
14085b071:     	leaq	0x519d168(%rip), %rdx   # 0x1459f81e0
14085b078:     	movq	%r14, %r8
14085b07b:     	callq	0x14000e640 <.text+0xd640>
14085b080:     	nop
14085b081:     	movq	0x1610(%rbp), %rdx
14085b088:     	testq	%rdx, %rdx
14085b08b:     	je	0x14085b0a3 <.text+0x85a0a3>
14085b08d:     	movq	0x1618(%rbp), %rcx
14085b094:     	shlq	$0x3, %rdx
14085b098:     	movl	$0x8, %r8d
14085b09e:     	callq	0x1400021d0 <.text+0x11d0>
14085b0a3:     	leaq	0x1d8(%rsi), %rbx
14085b0aa:     	cmpq	0x218(%rsi), %r14
14085b0b1:     	jae	0x14085b0dc <.text+0x85a0dc>
14085b0b3:     	movq	0x210(%rsi), %rax
14085b0ba:     	movq	(%rax,%r14,8), %rax
14085b0be:     	testq	%rax, %rax
14085b0c1:     	je	0x14085b0dc <.text+0x85a0dc>
14085b0c3:     	movq	0x1e0(%rsi), %rcx
14085b0ca:     	notq	%rax
14085b0cd:     	imulq	$0x38, %rax, %rax
14085b0d1:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085b0d6:     	jne	0x14085b18d <.text+0x85a18d>
14085b0dc:     	callq	0x1456e35e0 <.text+0x56e25e0>
14085b0e1:     	cmpb	$0x1, 0x10(%rax)
14085b0e5:     	jne	0x140860723 <.text+0x85f723>
14085b0eb:     	movq	(%rax), %rcx
14085b0ee:     	movq	0x8(%rax), %rdx
14085b0f2:     	leaq	0x1(%rcx), %r8
14085b0f6:     	movq	%r8, (%rax)
14085b0f9:     	movaps	0x519dc60(%rip), %xmm0  # 0x1459f8d60
14085b100:     	movaps	%xmm0, 0x560(%rbp)
14085b107:     	movdqa	0x519dc41(%rip), %xmm0  # 0x1459f8d50
14085b10f:     	movdqa	%xmm0, 0x550(%rbp)
14085b117:     	movq	%rcx, 0x570(%rbp)
14085b11e:     	movq	%rdx, 0x578(%rbp)
14085b125:     	movl	0x5b0(%rsi), %r12d
14085b12c:     	movq	%rsi, %rcx
14085b12f:     	callq	0x144e76860 <.text+0x4e75860>
14085b134:     	movq	%r14, 0x1610(%rbp)
14085b13b:     	leaq	0x1610(%rbp), %r9
14085b142:     	movq	%rbx, %rcx
14085b145:     	movq	%r14, %rdx
14085b148:     	movq	%rdi, %r8
14085b14b:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085b150:     	movq	%rax, %r14
14085b153:     	cmpb	$0x1, 0x30(%rax)
14085b157:     	jne	0x14085b16c <.text+0x85a16c>
14085b159:     	leaq	0x550(%rbp), %r8
14085b160:     	movq	%r14, %rcx
14085b163:     	xorl	%edx, %edx
14085b165:     	callq	0x144e617b0 <.text+0x4e607b0>
14085b16a:     	jmp	0x14085b189 <.text+0x85a189>
14085b16c:     	movq	0x8(%r14), %r8
14085b170:     	movq	0x10(%r14), %rcx
14085b174:     	leaq	0x550(%rbp), %rdx
14085b17b:     	callq	0x145756dd1 <.text+0x5755dd1>
14085b180:     	movl	%r12d, 0x28(%r14)
14085b184:     	movb	$0x1, 0x30(%r14)
14085b189:     	movl	%r12d, 0x2c(%r14)
14085b18d:     	movq	%rdi, 0x1628(%rbp)
14085b194:     	movq	%r15, 0x1630(%rbp)
14085b19b:     	movq	$0x0, 0x1610(%rbp)
14085b1a6:     	movq	$0x8, 0x1618(%rbp)
14085b1b1:     	movq	$0x0, 0x1620(%rbp)
14085b1bc:     	cmpq	$0x0, 0x90(%rsi)
14085b1c4:     	je	0x14085b26b <.text+0x85a26b>
14085b1ca:     	movabsq	$-0x6c3d918998027cc, %rcx # imm = 0xF93C26E7667FD834
14085b1d4:     	movq	0x78(%rsi), %rax
14085b1d8:     	movq	0x80(%rsi), %rdx
14085b1df:     	xorl	%r8d, %r8d
14085b1e2:     	movdqa	0x50901e6(%rip), %xmm0  # 0x1458eb3d0
14085b1ea:     	pcmpeqd	%xmm1, %xmm1
14085b1ee:     	movdqa	0x519cc0a(%rip), %xmm2  # 0x1459f7e00
14085b1f6:     	andq	%rdx, %rcx
14085b1f9:     	movdqu	(%rax,%rcx), %xmm3
14085b1fe:     	movdqa	%xmm3, %xmm4
14085b202:     	pcmpeqb	%xmm0, %xmm4
14085b206:     	pmovmskb	%xmm4, %r9d
14085b20b:     	testl	%r9d, %r9d
14085b20e:     	je	0x14085b250 <.text+0x85a250>
14085b210:     	tzcntl	%r9d, %r10d
14085b215:     	addq	%rcx, %r10
14085b218:     	andq	%rdx, %r10
14085b21b:     	negq	%r10
14085b21e:     	leaq	(%r10,%r10,2), %r10
14085b222:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085b229:     	pcmpeqb	%xmm2, %xmm4
14085b22d:     	pmovmskb	%xmm4, %r11d
14085b232:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085b239:     	je	0x14085b31f <.text+0x85a31f>
14085b23f:     	leal	-0x1(%r9), %r10d
14085b243:     	andw	%r9w, %r10w
14085b247:     	movl	%r10d, %r9d
14085b24a:     	jne	0x14085b210 <.text+0x85a210>
14085b24c:     	nopl	(%rax)
14085b250:     	pcmpeqb	%xmm1, %xmm3
14085b254:     	pmovmskb	%xmm3, %r9d
14085b259:     	testl	%r9d, %r9d
14085b25c:     	jne	0x14085b26b <.text+0x85a26b>
14085b25e:     	addq	%r8, %rcx
14085b261:     	addq	$0x10, %rcx
14085b265:     	addq	$0x10, %r8
14085b269:     	jmp	0x14085b1f6 <.text+0x85a1f6>
14085b26b:     	movzbl	0xa0(%rsi), %eax
14085b272:     	movq	0xe0(%rsi), %rax
14085b279:     	movq	0xe8(%rsi), %rcx
14085b280:     	movabsq	$-0x6c3d918998027cc, %rdx # imm = 0xF93C26E7667FD834
14085b28a:     	xorl	%r8d, %r8d
14085b28d:     	movdqa	0x509013b(%rip), %xmm0  # 0x1458eb3d0
14085b295:     	pcmpeqd	%xmm1, %xmm1
14085b299:     	movdqa	0x519cb5f(%rip), %xmm2  # 0x1459f7e00
14085b2a1:     	andq	%rcx, %rdx
14085b2a4:     	movdqu	(%rax,%rdx), %xmm3
14085b2a9:     	movdqa	%xmm3, %xmm4
14085b2ad:     	pcmpeqb	%xmm0, %xmm4
14085b2b1:     	pmovmskb	%xmm4, %r11d
14085b2b6:     	testl	%r11d, %r11d
14085b2b9:     	je	0x14085b300 <.text+0x85a300>
14085b2bb:     	tzcntl	%r11d, %r10d
14085b2c0:     	addq	%rdx, %r10
14085b2c3:     	andq	%rcx, %r10
14085b2c6:     	movq	%r10, %r14
14085b2c9:     	shlq	$0x7, %r14
14085b2cd:     	movq	%rax, %r9
14085b2d0:     	subq	%r14, %r9
14085b2d3:     	movdqu	-0x80(%r9), %xmm4
14085b2d9:     	pcmpeqb	%xmm2, %xmm4
14085b2dd:     	pmovmskb	%xmm4, %r14d
14085b2e2:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085b2e9:     	je	0x14085b33c <.text+0x85a33c>
14085b2eb:     	leal	-0x1(%r11), %r9d
14085b2ef:     	andw	%r11w, %r9w
14085b2f3:     	movl	%r9d, %r11d
14085b2f6:     	jne	0x14085b2bb <.text+0x85a2bb>
14085b2f8:     	nopl	(%rax,%rax)
14085b300:     	pcmpeqb	%xmm1, %xmm3
14085b304:     	pmovmskb	%xmm3, %r9d
14085b309:     	testl	%r9d, %r9d
14085b30c:     	jne	0x14085b3af <.text+0x85a3af>
14085b312:     	addq	%r8, %rdx
14085b315:     	addq	$0x10, %rdx
14085b319:     	addq	$0x10, %r8
14085b31d:     	jmp	0x14085b2a1 <.text+0x85a2a1>
14085b31f:     	leaq	(%rax,%r10,8), %rax
14085b323:     	movq	-0x8(%rax), %r14
14085b327:     	movq	0x1610(%rbp), %rdx
14085b32e:     	testq	%rdx, %rdx
14085b331:     	jne	0x14085b44d <.text+0x85a44d>
14085b337:     	jmp	0x14085b463 <.text+0x85a463>
14085b33c:     	leaq	-0x10(%r10), %rdx
14085b340:     	andq	%rcx, %rdx
14085b343:     	movdqu	(%rax,%rdx), %xmm0
14085b348:     	pcmpeqd	%xmm1, %xmm1
14085b34c:     	pcmpeqb	%xmm1, %xmm0
14085b350:     	pmovmskb	%xmm0, %ecx
14085b354:     	movdqu	(%rax,%r10), %xmm0
14085b35a:     	pcmpeqb	%xmm1, %xmm0
14085b35e:     	pmovmskb	%xmm0, %r8d
14085b363:     	movw	$0x1f, %r11w
14085b368:     	bsrw	%cx, %r11w
14085b36d:     	xorl	$0xf, %r11d
14085b371:     	orl	$0x10000, %r8d          # imm = 0x10000
14085b378:     	tzcntl	%r8d, %r8d
14085b37d:     	addl	%r11d, %r8d
14085b380:     	movb	$-0x80, %cl
14085b382:     	cmpw	$0xf, %r8w
14085b387:     	ja	0x14085b392 <.text+0x85a392>
14085b389:     	incq	0xf0(%rsi)
14085b390:     	movb	$-0x1, %cl
14085b392:     	movb	%cl, (%rax,%r10)
14085b396:     	movb	%cl, 0x10(%rax,%rdx)
14085b39a:     	decq	0xf8(%rsi)
14085b3a1:     	movq	-0x70(%r9), %rax
14085b3a5:     	cmpq	$0x2, %rax
14085b3a9:     	jne	0x14085fcd4 <.text+0x85ecd4>
14085b3af:     	movq	(%r15), %r14
14085b3b2:     	leaq	0x1(%r14), %rax
14085b3b6:     	movq	%rax, (%r15)
14085b3b9:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085b3c2:     	movq	$0x1, 0x550(%rbp)
14085b3cd:     	movdqu	0x519cddb(%rip), %xmm0  # 0x1459f81b0
14085b3d5:     	movdqu	%xmm0, 0x558(%rbp)
14085b3dd:     	movq	$0x8, 0x578(%rbp)
14085b3e8:     	movq	$0x48, 0x580(%rbp)
14085b3f3:     	leaq	-0x36597a(%rip), %rax   # 0x1404f5a80 <.text+0x4f4a80>
14085b3fa:     	movq	%rax, 0x598(%rbp)
14085b401:     	movb	$0x1, 0x5a2(%rbp)
14085b408:     	movq	$0x0, 0x568(%rbp)
14085b413:     	movb	$0x2, 0x588(%rbp)
14085b41a:     	leaq	0x550(%rbp), %r8
14085b421:     	movq	%rdi, %rcx
14085b424:     	movq	%r14, %rdx
14085b427:     	callq	0x14004abc0 <.text+0x49bc0>
14085b42c:     	nop
14085b42d:     	leaq	0x78(%rsi), %rcx
14085b431:     	leaq	0x519cd78(%rip), %rdx   # 0x1459f81b0
14085b438:     	movq	%r14, %r8
14085b43b:     	callq	0x14000e640 <.text+0xd640>
14085b440:     	nop
14085b441:     	movq	0x1610(%rbp), %rdx
14085b448:     	testq	%rdx, %rdx
14085b44b:     	je	0x14085b463 <.text+0x85a463>
14085b44d:     	movq	0x1618(%rbp), %rcx
14085b454:     	shlq	$0x3, %rdx
14085b458:     	movl	$0x8, %r8d
14085b45e:     	callq	0x1400021d0 <.text+0x11d0>
14085b463:     	cmpq	0x218(%rsi), %r14
14085b46a:     	jae	0x14085b495 <.text+0x85a495>
14085b46c:     	movq	0x210(%rsi), %rax
14085b473:     	movq	(%rax,%r14,8), %rax
14085b477:     	testq	%rax, %rax
14085b47a:     	je	0x14085b495 <.text+0x85a495>
14085b47c:     	movq	0x1e0(%rsi), %rcx
14085b483:     	notq	%rax
14085b486:     	imulq	$0x38, %rax, %rax
14085b48a:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085b48f:     	jne	0x14085b56a <.text+0x85a56a>
14085b495:     	callq	0x1456e35e0 <.text+0x56e25e0>
14085b49a:     	movq	%rax, %rcx
14085b49d:     	cmpb	$0x1, 0x10(%rax)
14085b4a1:     	jne	0x140860745 <.text+0x85f745>
14085b4a7:     	movq	(%rcx), %rax
14085b4aa:     	movq	0x8(%rcx), %rdx
14085b4ae:     	leaq	0x1(%rax), %r8
14085b4b2:     	movq	%r8, (%rcx)
14085b4b5:     	movq	$0x0, 0x550(%rbp)
14085b4c0:     	movq	$0x8, 0x558(%rbp)
14085b4cb:     	movq	$0x0, 0x560(%rbp)
14085b4d6:     	movaps	0x519d873(%rip), %xmm0  # 0x1459f8d50
14085b4dd:     	movups	%xmm0, 0x568(%rbp)
14085b4e4:     	movdqa	0x519d874(%rip), %xmm0  # 0x1459f8d60
14085b4ec:     	movdqu	%xmm0, 0x578(%rbp)
14085b4f4:     	movq	%rax, 0x588(%rbp)
14085b4fb:     	movq	%rdx, 0x590(%rbp)
14085b502:     	movl	0x5b0(%rsi), %r12d
14085b509:     	movq	%rsi, %rcx
14085b50c:     	callq	0x144e76860 <.text+0x4e75860>
14085b511:     	movq	%r14, 0x1610(%rbp)
14085b518:     	leaq	0x1610(%rbp), %r9
14085b51f:     	movq	%rbx, %rcx
14085b522:     	movq	%r14, %rdx
14085b525:     	movq	%rdi, %r8
14085b528:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085b52d:     	movq	%rax, %r14
14085b530:     	cmpb	$0x1, 0x30(%rax)
14085b534:     	jne	0x14085b549 <.text+0x85a549>
14085b536:     	leaq	0x550(%rbp), %r8
14085b53d:     	movq	%r14, %rcx
14085b540:     	xorl	%edx, %edx
14085b542:     	callq	0x144e617b0 <.text+0x4e607b0>
14085b547:     	jmp	0x14085b566 <.text+0x85a566>
14085b549:     	movq	0x8(%r14), %r8
14085b54d:     	movq	0x10(%r14), %rcx
14085b551:     	leaq	0x550(%rbp), %rdx
14085b558:     	callq	0x145756dd1 <.text+0x5755dd1>
14085b55d:     	movl	%r12d, 0x28(%r14)
14085b561:     	movb	$0x1, 0x30(%r14)
14085b566:     	movl	%r12d, 0x2c(%r14)
14085b56a:     	movq	%rdi, 0x1628(%rbp)
14085b571:     	movq	%r15, 0x1630(%rbp)
14085b578:     	movq	$0x0, 0x1610(%rbp)
14085b583:     	movq	$0x8, 0x1618(%rbp)
14085b58e:     	movq	$0x0, 0x1620(%rbp)
14085b599:     	cmpq	$0x0, 0x90(%rsi)
14085b5a1:     	je	0x14085b64b <.text+0x85a64b>
14085b5a7:     	movabsq	$0x13a4869f66049df2, %rcx # imm = 0x13A4869F66049DF2
14085b5b1:     	movq	0x78(%rsi), %rax
14085b5b5:     	movq	0x80(%rsi), %rdx
14085b5bc:     	xorl	%r8d, %r8d
14085b5bf:     	movdqa	0x508ffb9(%rip), %xmm0  # 0x1458eb580
14085b5c7:     	pcmpeqd	%xmm1, %xmm1
14085b5cb:     	movdqa	0x519c83d(%rip), %xmm2  # 0x1459f7e10
14085b5d3:     	andq	%rdx, %rcx
14085b5d6:     	movdqu	(%rax,%rcx), %xmm3
14085b5db:     	movdqa	%xmm3, %xmm4
14085b5df:     	pcmpeqb	%xmm0, %xmm4
14085b5e3:     	pmovmskb	%xmm4, %r9d
14085b5e8:     	testl	%r9d, %r9d
14085b5eb:     	je	0x14085b630 <.text+0x85a630>
14085b5ed:     	tzcntl	%r9d, %r10d
14085b5f2:     	addq	%rcx, %r10
14085b5f5:     	andq	%rdx, %r10
14085b5f8:     	negq	%r10
14085b5fb:     	leaq	(%r10,%r10,2), %r10
14085b5ff:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085b606:     	pcmpeqb	%xmm2, %xmm4
14085b60a:     	pmovmskb	%xmm4, %r11d
14085b60f:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085b616:     	je	0x14085b6ff <.text+0x85a6ff>
14085b61c:     	leal	-0x1(%r9), %r10d
14085b620:     	andw	%r9w, %r10w
14085b624:     	movl	%r10d, %r9d
14085b627:     	jne	0x14085b5ed <.text+0x85a5ed>
14085b629:     	nopl	(%rax)
14085b630:     	pcmpeqb	%xmm1, %xmm3
14085b634:     	pmovmskb	%xmm3, %r9d
14085b639:     	testl	%r9d, %r9d
14085b63c:     	jne	0x14085b64b <.text+0x85a64b>
14085b63e:     	addq	%r8, %rcx
14085b641:     	addq	$0x10, %rcx
14085b645:     	addq	$0x10, %r8
14085b649:     	jmp	0x14085b5d3 <.text+0x85a5d3>
14085b64b:     	movzbl	0xa0(%rsi), %eax
14085b652:     	movq	0xe0(%rsi), %rax
14085b659:     	movq	0xe8(%rsi), %rcx
14085b660:     	movabsq	$0x13a4869f66049df2, %rdx # imm = 0x13A4869F66049DF2
14085b66a:     	xorl	%r8d, %r8d
14085b66d:     	movdqa	0x508ff0b(%rip), %xmm0  # 0x1458eb580
14085b675:     	pcmpeqd	%xmm1, %xmm1
14085b679:     	movdqa	0x519c78f(%rip), %xmm2  # 0x1459f7e10
14085b681:     	andq	%rcx, %rdx
14085b684:     	movdqu	(%rax,%rdx), %xmm3
14085b689:     	movdqa	%xmm3, %xmm4
14085b68d:     	pcmpeqb	%xmm0, %xmm4
14085b691:     	pmovmskb	%xmm4, %r11d
14085b696:     	testl	%r11d, %r11d
14085b699:     	je	0x14085b6e0 <.text+0x85a6e0>
14085b69b:     	tzcntl	%r11d, %r10d
14085b6a0:     	addq	%rdx, %r10
14085b6a3:     	andq	%rcx, %r10
14085b6a6:     	movq	%r10, %r14
14085b6a9:     	shlq	$0x7, %r14
14085b6ad:     	movq	%rax, %r9
14085b6b0:     	subq	%r14, %r9
14085b6b3:     	movdqu	-0x80(%r9), %xmm4
14085b6b9:     	pcmpeqb	%xmm2, %xmm4
14085b6bd:     	pmovmskb	%xmm4, %r14d
14085b6c2:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085b6c9:     	je	0x14085b71c <.text+0x85a71c>
14085b6cb:     	leal	-0x1(%r11), %r9d
14085b6cf:     	andw	%r11w, %r9w
14085b6d3:     	movl	%r9d, %r11d
14085b6d6:     	jne	0x14085b69b <.text+0x85a69b>
14085b6d8:     	nopl	(%rax,%rax)
14085b6e0:     	pcmpeqb	%xmm1, %xmm3
14085b6e4:     	pmovmskb	%xmm3, %r9d
14085b6e9:     	testl	%r9d, %r9d
14085b6ec:     	jne	0x14085b78f <.text+0x85a78f>
14085b6f2:     	addq	%r8, %rdx
14085b6f5:     	addq	$0x10, %rdx
14085b6f9:     	addq	$0x10, %r8
14085b6fd:     	jmp	0x14085b681 <.text+0x85a681>
14085b6ff:     	leaq	(%rax,%r10,8), %rax
14085b703:     	movq	-0x8(%rax), %r14
14085b707:     	movq	0x1610(%rbp), %rdx
14085b70e:     	testq	%rdx, %rdx
14085b711:     	jne	0x14085b82a <.text+0x85a82a>
14085b717:     	jmp	0x14085b840 <.text+0x85a840>
14085b71c:     	leaq	-0x10(%r10), %rdx
14085b720:     	andq	%rcx, %rdx
14085b723:     	movdqu	(%rax,%rdx), %xmm0
14085b728:     	pcmpeqd	%xmm1, %xmm1
14085b72c:     	pcmpeqb	%xmm1, %xmm0
14085b730:     	pmovmskb	%xmm0, %ecx
14085b734:     	movdqu	(%rax,%r10), %xmm0
14085b73a:     	pcmpeqb	%xmm1, %xmm0
14085b73e:     	pmovmskb	%xmm0, %r8d
14085b743:     	movw	$0x1f, %r11w
14085b748:     	bsrw	%cx, %r11w
14085b74d:     	xorl	$0xf, %r11d
14085b751:     	orl	$0x10000, %r8d          # imm = 0x10000
14085b758:     	tzcntl	%r8d, %r8d
14085b75d:     	addl	%r11d, %r8d
14085b760:     	movb	$-0x80, %cl
14085b762:     	cmpw	$0xf, %r8w
14085b767:     	ja	0x14085b772 <.text+0x85a772>
14085b769:     	incq	0xf0(%rsi)
14085b770:     	movb	$-0x1, %cl
14085b772:     	movb	%cl, (%rax,%r10)
14085b776:     	movb	%cl, 0x10(%rax,%rdx)
14085b77a:     	decq	0xf8(%rsi)
14085b781:     	movq	-0x70(%r9), %rax
14085b785:     	cmpq	$0x2, %rax
14085b789:     	jne	0x14085fd62 <.text+0x85ed62>
14085b78f:     	movq	(%r15), %r14
14085b792:     	leaq	0x1(%r14), %rax
14085b796:     	movq	%rax, (%r15)
14085b799:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085b7a2:     	movq	$0x1, 0x550(%rbp)
14085b7ad:     	movdqu	0x519ca5b(%rip), %xmm0  # 0x1459f8210
14085b7b5:     	movdqu	%xmm0, 0x558(%rbp)
14085b7bd:     	movq	$0x1, 0x578(%rbp)
14085b7c8:     	movq	$0x1, 0x580(%rbp)
14085b7d3:     	movq	$0x0, 0x598(%rbp)
14085b7de:     	movb	$0x1, 0x5a2(%rbp)
14085b7e5:     	movq	$0x0, 0x568(%rbp)
14085b7f0:     	movb	$0x2, 0x588(%rbp)
14085b7f7:     	leaq	0x550(%rbp), %r8
14085b7fe:     	movq	%rdi, %rcx
14085b801:     	movq	%r14, %rdx
14085b804:     	callq	0x14004abc0 <.text+0x49bc0>
14085b809:     	nop
14085b80a:     	leaq	0x78(%rsi), %rcx
14085b80e:     	leaq	0x519c9fb(%rip), %rdx   # 0x1459f8210
14085b815:     	movq	%r14, %r8
14085b818:     	callq	0x14000e640 <.text+0xd640>
14085b81d:     	nop
14085b81e:     	movq	0x1610(%rbp), %rdx
14085b825:     	testq	%rdx, %rdx
14085b828:     	je	0x14085b840 <.text+0x85a840>
14085b82a:     	movq	0x1618(%rbp), %rcx
14085b831:     	shlq	$0x3, %rdx
14085b835:     	movl	$0x8, %r8d
14085b83b:     	callq	0x1400021d0 <.text+0x11d0>
14085b840:     	cmpq	0x218(%rsi), %r14
14085b847:     	jae	0x14085b86e <.text+0x85a86e>
14085b849:     	movq	0x210(%rsi), %rax
14085b850:     	movq	(%rax,%r14,8), %rax
14085b854:     	testq	%rax, %rax
14085b857:     	je	0x14085b86e <.text+0x85a86e>
14085b859:     	movq	0x1e0(%rsi), %rcx
14085b860:     	notq	%rax
14085b863:     	imulq	$0x38, %rax, %rax
14085b867:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085b86c:     	jne	0x14085b8dd <.text+0x85a8dd>
14085b86e:     	movb	$0x1, 0x1610(%rbp)
14085b875:     	movl	0x5b0(%rsi), %r12d
14085b87c:     	movq	%rsi, %rcx
14085b87f:     	callq	0x144e76860 <.text+0x4e75860>
14085b884:     	movq	%r14, 0x550(%rbp)
14085b88b:     	leaq	0x550(%rbp), %r9
14085b892:     	movq	%rbx, %rcx
14085b895:     	movq	%r14, %rdx
14085b898:     	movq	%rdi, %r8
14085b89b:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085b8a0:     	movq	%rax, %r14
14085b8a3:     	cmpb	$0x1, 0x30(%rax)
14085b8a7:     	jne	0x14085b8bc <.text+0x85a8bc>
14085b8a9:     	leaq	0x1610(%rbp), %r8
14085b8b0:     	movq	%r14, %rcx
14085b8b3:     	xorl	%edx, %edx
14085b8b5:     	callq	0x144e617b0 <.text+0x4e607b0>
14085b8ba:     	jmp	0x14085b8d9 <.text+0x85a8d9>
14085b8bc:     	movq	0x8(%r14), %r8
14085b8c0:     	movq	0x10(%r14), %rcx
14085b8c4:     	leaq	0x1610(%rbp), %rdx
14085b8cb:     	callq	0x145756dd1 <.text+0x5755dd1>
14085b8d0:     	movl	%r12d, 0x28(%r14)
14085b8d4:     	movb	$0x1, 0x30(%r14)
14085b8d9:     	movl	%r12d, 0x2c(%r14)
14085b8dd:     	callq	0x140002200 <.text+0x1200>
14085b8e2:     	movl	$0x20, %ecx
14085b8e7:     	movl	$0x8, %edx
14085b8ec:     	callq	0x1400021c0 <.text+0x11c0>
14085b8f1:     	testq	%rax, %rax
14085b8f4:     	je	0x1408605b4 <.text+0x85f5b4>
14085b8fa:     	movq	$0x0, (%rax)
14085b901:     	movl	$0x0, 0x18(%rax)
14085b908:     	movb	$0x0, 0x1c(%rax)
14085b90c:     	leaq	0x86153d(%rip), %rcx    # 0x1410bce50 <.text+0x10bbe50>
14085b913:     	movq	%rcx, 0x598(%rbp)
14085b91a:     	pxor	%xmm0, %xmm0
14085b91e:     	movdqu	%xmm0, 0x5b8(%rbp)
14085b926:     	movq	%rax, 0x5a0(%rbp)
14085b92d:     	leaq	0x5298eac(%rip), %rax   # 0x145af47e0
14085b934:     	movq	%rax, 0x5a8(%rbp)
14085b93b:     	movq	$0x0, 0x550(%rbp)
14085b946:     	movq	$0x8, 0x558(%rbp)
14085b951:     	movdqu	%xmm0, 0x560(%rbp)
14085b959:     	movq	$0x8, 0x570(%rbp)
14085b964:     	movdqu	%xmm0, 0x578(%rbp)
14085b96c:     	movq	$0x8, 0x588(%rbp)
14085b977:     	movq	$0x0, 0x590(%rbp)
14085b982:     	leaq	0x865707(%rip), %rax    # 0x1410c1090 <.text+0x10c0090>
14085b989:     	movq	%rax, 0x5b0(%rbp)
14085b990:     	leaq	0x1610(%rbp), %rcx
14085b997:     	leaq	0x550(%rbp), %r8
14085b99e:     	movq	%rsi, %rdx
14085b9a1:     	callq	0x1411807d0 <.text+0x117f7d0>
14085b9a6:     	movq	%rdi, 0x1628(%rbp)
14085b9ad:     	movq	%r15, 0x1630(%rbp)
14085b9b4:     	movq	$0x0, 0x1610(%rbp)
14085b9bf:     	movq	$0x8, 0x1618(%rbp)
14085b9ca:     	movq	$0x0, 0x1620(%rbp)
14085b9d5:     	cmpq	$0x0, 0x90(%rsi)
14085b9dd:     	je	0x14085ba8b <.text+0x85aa8b>
14085b9e3:     	movabsq	$0x6ad3d7f45630634d, %rcx # imm = 0x6AD3D7F45630634D
14085b9ed:     	movq	0x78(%rsi), %rax
14085b9f1:     	movq	0x80(%rsi), %rdx
14085b9f8:     	xorl	%r8d, %r8d
14085b9fb:     	movdqa	0x508fd7d(%rip), %xmm0  # 0x1458eb780
14085ba03:     	pcmpeqd	%xmm1, %xmm1
14085ba07:     	movdqa	0x519c411(%rip), %xmm2  # 0x1459f7e20
14085ba0f:     	andq	%rdx, %rcx
14085ba12:     	movdqu	(%rax,%rcx), %xmm3
14085ba17:     	movdqa	%xmm3, %xmm4
14085ba1b:     	pcmpeqb	%xmm0, %xmm4
14085ba1f:     	pmovmskb	%xmm4, %r9d
14085ba24:     	testl	%r9d, %r9d
14085ba27:     	je	0x14085ba70 <.text+0x85aa70>
14085ba29:     	tzcntl	%r9d, %r10d
14085ba2e:     	addq	%rcx, %r10
14085ba31:     	andq	%rdx, %r10
14085ba34:     	negq	%r10
14085ba37:     	leaq	(%r10,%r10,2), %r10
14085ba3b:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085ba42:     	pcmpeqb	%xmm2, %xmm4
14085ba46:     	pmovmskb	%xmm4, %r11d
14085ba4b:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085ba52:     	je	0x14085bb3f <.text+0x85ab3f>
14085ba58:     	leal	-0x1(%r9), %r10d
14085ba5c:     	andw	%r9w, %r10w
14085ba60:     	movl	%r10d, %r9d
14085ba63:     	jne	0x14085ba29 <.text+0x85aa29>
14085ba65:     	nopw	%cs:(%rax,%rax)
14085ba70:     	pcmpeqb	%xmm1, %xmm3
14085ba74:     	pmovmskb	%xmm3, %r9d
14085ba79:     	testl	%r9d, %r9d
14085ba7c:     	jne	0x14085ba8b <.text+0x85aa8b>
14085ba7e:     	addq	%r8, %rcx
14085ba81:     	addq	$0x10, %rcx
14085ba85:     	addq	$0x10, %r8
14085ba89:     	jmp	0x14085ba0f <.text+0x85aa0f>
14085ba8b:     	movzbl	0xa0(%rsi), %eax
14085ba92:     	movq	0xe0(%rsi), %rax
14085ba99:     	movq	0xe8(%rsi), %rcx
14085baa0:     	movabsq	$0x6ad3d7f45630634d, %rdx # imm = 0x6AD3D7F45630634D
14085baaa:     	xorl	%r8d, %r8d
14085baad:     	movdqa	0x508fccb(%rip), %xmm0  # 0x1458eb780
14085bab5:     	pcmpeqd	%xmm1, %xmm1
14085bab9:     	movdqa	0x519c35f(%rip), %xmm2  # 0x1459f7e20
14085bac1:     	andq	%rcx, %rdx
14085bac4:     	movdqu	(%rax,%rdx), %xmm3
14085bac9:     	movdqa	%xmm3, %xmm4
14085bacd:     	pcmpeqb	%xmm0, %xmm4
14085bad1:     	pmovmskb	%xmm4, %r11d
14085bad6:     	testl	%r11d, %r11d
14085bad9:     	je	0x14085bb20 <.text+0x85ab20>
14085badb:     	tzcntl	%r11d, %r10d
14085bae0:     	addq	%rdx, %r10
14085bae3:     	andq	%rcx, %r10
14085bae6:     	movq	%r10, %r14
14085bae9:     	shlq	$0x7, %r14
14085baed:     	movq	%rax, %r9
14085baf0:     	subq	%r14, %r9
14085baf3:     	movdqu	-0x80(%r9), %xmm4
14085baf9:     	pcmpeqb	%xmm2, %xmm4
14085bafd:     	pmovmskb	%xmm4, %r14d
14085bb02:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085bb09:     	je	0x14085bb5c <.text+0x85ab5c>
14085bb0b:     	leal	-0x1(%r11), %r9d
14085bb0f:     	andw	%r11w, %r9w
14085bb13:     	movl	%r9d, %r11d
14085bb16:     	jne	0x14085badb <.text+0x85aadb>
14085bb18:     	nopl	(%rax,%rax)
14085bb20:     	pcmpeqb	%xmm1, %xmm3
14085bb24:     	pmovmskb	%xmm3, %r9d
14085bb29:     	testl	%r9d, %r9d
14085bb2c:     	jne	0x14085bbcf <.text+0x85abcf>
14085bb32:     	addq	%r8, %rdx
14085bb35:     	addq	$0x10, %rdx
14085bb39:     	addq	$0x10, %r8
14085bb3d:     	jmp	0x14085bac1 <.text+0x85aac1>
14085bb3f:     	leaq	(%rax,%r10,8), %rax
14085bb43:     	movq	-0x8(%rax), %r14
14085bb47:     	movq	0x1610(%rbp), %rdx
14085bb4e:     	testq	%rdx, %rdx
14085bb51:     	jne	0x14085bc6a <.text+0x85ac6a>
14085bb57:     	jmp	0x14085bc80 <.text+0x85ac80>
14085bb5c:     	leaq	-0x10(%r10), %rdx
14085bb60:     	andq	%rcx, %rdx
14085bb63:     	movdqu	(%rax,%rdx), %xmm0
14085bb68:     	pcmpeqd	%xmm1, %xmm1
14085bb6c:     	pcmpeqb	%xmm1, %xmm0
14085bb70:     	pmovmskb	%xmm0, %ecx
14085bb74:     	movdqu	(%rax,%r10), %xmm0
14085bb7a:     	pcmpeqb	%xmm1, %xmm0
14085bb7e:     	pmovmskb	%xmm0, %r8d
14085bb83:     	movw	$0x1f, %r11w
14085bb88:     	bsrw	%cx, %r11w
14085bb8d:     	xorl	$0xf, %r11d
14085bb91:     	orl	$0x10000, %r8d          # imm = 0x10000
14085bb98:     	tzcntl	%r8d, %r8d
14085bb9d:     	addl	%r11d, %r8d
14085bba0:     	movb	$-0x80, %cl
14085bba2:     	cmpw	$0xf, %r8w
14085bba7:     	ja	0x14085bbb2 <.text+0x85abb2>
14085bba9:     	incq	0xf0(%rsi)
14085bbb0:     	movb	$-0x1, %cl
14085bbb2:     	movb	%cl, (%rax,%r10)
14085bbb6:     	movb	%cl, 0x10(%rax,%rdx)
14085bbba:     	decq	0xf8(%rsi)
14085bbc1:     	movq	-0x70(%r9), %rax
14085bbc5:     	cmpq	$0x2, %rax
14085bbc9:     	jne	0x14085fdf0 <.text+0x85edf0>
14085bbcf:     	movq	(%r15), %r14
14085bbd2:     	leaq	0x1(%r14), %rax
14085bbd6:     	movq	%rax, (%r15)
14085bbd9:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085bbe2:     	movq	$0x1, 0x550(%rbp)
14085bbed:     	movdqu	0x519c5db(%rip), %xmm0  # 0x1459f81d0
14085bbf5:     	movdqu	%xmm0, 0x558(%rbp)
14085bbfd:     	movq	$0x4, 0x578(%rbp)
14085bc08:     	movq	$0x4, 0x580(%rbp)
14085bc13:     	movq	$0x0, 0x598(%rbp)
14085bc1e:     	movb	$0x1, 0x5a2(%rbp)
14085bc25:     	movq	$0x0, 0x568(%rbp)
14085bc30:     	movb	$0x2, 0x588(%rbp)
14085bc37:     	leaq	0x550(%rbp), %r8
14085bc3e:     	movq	%rdi, %rcx
14085bc41:     	movq	%r14, %rdx
14085bc44:     	callq	0x14004abc0 <.text+0x49bc0>
14085bc49:     	nop
14085bc4a:     	leaq	0x78(%rsi), %rcx
14085bc4e:     	leaq	0x519c57b(%rip), %rdx   # 0x1459f81d0
14085bc55:     	movq	%r14, %r8
14085bc58:     	callq	0x14000e640 <.text+0xd640>
14085bc5d:     	nop
14085bc5e:     	movq	0x1610(%rbp), %rdx
14085bc65:     	testq	%rdx, %rdx
14085bc68:     	je	0x14085bc80 <.text+0x85ac80>
14085bc6a:     	movq	0x1618(%rbp), %rcx
14085bc71:     	shlq	$0x3, %rdx
14085bc75:     	movl	$0x8, %r8d
14085bc7b:     	callq	0x1400021d0 <.text+0x11d0>
14085bc80:     	cmpq	0x218(%rsi), %r14
14085bc87:     	jae	0x14085bcae <.text+0x85acae>
14085bc89:     	movq	0x210(%rsi), %rax
14085bc90:     	movq	(%rax,%r14,8), %rax
14085bc94:     	testq	%rax, %rax
14085bc97:     	je	0x14085bcae <.text+0x85acae>
14085bc99:     	movq	0x1e0(%rsi), %rcx
14085bca0:     	notq	%rax
14085bca3:     	imulq	$0x38, %rax, %rax
14085bca7:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085bcac:     	jne	0x14085bd20 <.text+0x85ad20>
14085bcae:     	movl	$0x3f1c28f6, 0x1610(%rbp) # imm = 0x3F1C28F6
14085bcb8:     	movl	0x5b0(%rsi), %r12d
14085bcbf:     	movq	%rsi, %rcx
14085bcc2:     	callq	0x144e76860 <.text+0x4e75860>
14085bcc7:     	movq	%r14, 0x550(%rbp)
14085bcce:     	leaq	0x550(%rbp), %r9
14085bcd5:     	movq	%rbx, %rcx
14085bcd8:     	movq	%r14, %rdx
14085bcdb:     	movq	%rdi, %r8
14085bcde:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085bce3:     	movq	%rax, %r14
14085bce6:     	cmpb	$0x1, 0x30(%rax)
14085bcea:     	jne	0x14085bcff <.text+0x85acff>
14085bcec:     	leaq	0x1610(%rbp), %r8
14085bcf3:     	movq	%r14, %rcx
14085bcf6:     	xorl	%edx, %edx
14085bcf8:     	callq	0x144e617b0 <.text+0x4e607b0>
14085bcfd:     	jmp	0x14085bd1c <.text+0x85ad1c>
14085bcff:     	movq	0x8(%r14), %r8
14085bd03:     	movq	0x10(%r14), %rcx
14085bd07:     	leaq	0x1610(%rbp), %rdx
14085bd0e:     	callq	0x145756dd1 <.text+0x5755dd1>
14085bd13:     	movl	%r12d, 0x28(%r14)
14085bd17:     	movb	$0x1, 0x30(%r14)
14085bd1c:     	movl	%r12d, 0x2c(%r14)
14085bd20:     	movq	%rdi, 0x1628(%rbp)
14085bd27:     	movq	%r15, 0x1630(%rbp)
14085bd2e:     	movq	$0x0, 0x1610(%rbp)
14085bd39:     	movq	$0x8, 0x1618(%rbp)
14085bd44:     	movq	$0x0, 0x1620(%rbp)
14085bd4f:     	cmpq	$0x0, 0x90(%rsi)
14085bd57:     	je	0x14085bdfb <.text+0x85adfb>
14085bd5d:     	movabsq	$0x11929cbb4b067579, %rcx # imm = 0x11929CBB4B067579
14085bd67:     	movq	0x78(%rsi), %rax
14085bd6b:     	movq	0x80(%rsi), %rdx
14085bd72:     	xorl	%r8d, %r8d
14085bd75:     	movdqa	0x508f9e3(%rip), %xmm0  # 0x1458eb760
14085bd7d:     	pcmpeqd	%xmm1, %xmm1
14085bd81:     	movdqa	0x519c0a7(%rip), %xmm2  # 0x1459f7e30
14085bd89:     	andq	%rdx, %rcx
14085bd8c:     	movdqu	(%rax,%rcx), %xmm3
14085bd91:     	movdqa	%xmm3, %xmm4
14085bd95:     	pcmpeqb	%xmm0, %xmm4
14085bd99:     	pmovmskb	%xmm4, %r9d
14085bd9e:     	testl	%r9d, %r9d
14085bda1:     	je	0x14085bde0 <.text+0x85ade0>
14085bda3:     	tzcntl	%r9d, %r10d
14085bda8:     	addq	%rcx, %r10
14085bdab:     	andq	%rdx, %r10
14085bdae:     	negq	%r10
14085bdb1:     	leaq	(%r10,%r10,2), %r10
14085bdb5:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085bdbc:     	pcmpeqb	%xmm2, %xmm4
14085bdc0:     	pmovmskb	%xmm4, %r11d
14085bdc5:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085bdcc:     	je	0x14085beaf <.text+0x85aeaf>
14085bdd2:     	leal	-0x1(%r9), %r10d
14085bdd6:     	andw	%r9w, %r10w
14085bdda:     	movl	%r10d, %r9d
14085bddd:     	jne	0x14085bda3 <.text+0x85ada3>
14085bddf:     	nop
14085bde0:     	pcmpeqb	%xmm1, %xmm3
14085bde4:     	pmovmskb	%xmm3, %r9d
14085bde9:     	testl	%r9d, %r9d
14085bdec:     	jne	0x14085bdfb <.text+0x85adfb>
14085bdee:     	addq	%r8, %rcx
14085bdf1:     	addq	$0x10, %rcx
14085bdf5:     	addq	$0x10, %r8
14085bdf9:     	jmp	0x14085bd89 <.text+0x85ad89>
14085bdfb:     	movzbl	0xa0(%rsi), %eax
14085be02:     	movq	0xe0(%rsi), %rax
14085be09:     	movq	0xe8(%rsi), %rcx
14085be10:     	movabsq	$0x11929cbb4b067579, %rdx # imm = 0x11929CBB4B067579
14085be1a:     	xorl	%r8d, %r8d
14085be1d:     	movdqa	0x508f93b(%rip), %xmm0  # 0x1458eb760
14085be25:     	pcmpeqd	%xmm1, %xmm1
14085be29:     	movdqa	0x519bfff(%rip), %xmm2  # 0x1459f7e30
14085be31:     	andq	%rcx, %rdx
14085be34:     	movdqu	(%rax,%rdx), %xmm3
14085be39:     	movdqa	%xmm3, %xmm4
14085be3d:     	pcmpeqb	%xmm0, %xmm4
14085be41:     	pmovmskb	%xmm4, %r11d
14085be46:     	testl	%r11d, %r11d
14085be49:     	je	0x14085be90 <.text+0x85ae90>
14085be4b:     	tzcntl	%r11d, %r10d
14085be50:     	addq	%rdx, %r10
14085be53:     	andq	%rcx, %r10
14085be56:     	movq	%r10, %r14
14085be59:     	shlq	$0x7, %r14
14085be5d:     	movq	%rax, %r9
14085be60:     	subq	%r14, %r9
14085be63:     	movdqu	-0x80(%r9), %xmm4
14085be69:     	pcmpeqb	%xmm2, %xmm4
14085be6d:     	pmovmskb	%xmm4, %r14d
14085be72:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085be79:     	je	0x14085becc <.text+0x85aecc>
14085be7b:     	leal	-0x1(%r11), %r9d
14085be7f:     	andw	%r11w, %r9w
14085be83:     	movl	%r9d, %r11d
14085be86:     	jne	0x14085be4b <.text+0x85ae4b>
14085be88:     	nopl	(%rax,%rax)
14085be90:     	pcmpeqb	%xmm1, %xmm3
14085be94:     	pmovmskb	%xmm3, %r9d
14085be99:     	testl	%r9d, %r9d
14085be9c:     	jne	0x14085bf3f <.text+0x85af3f>
14085bea2:     	addq	%r8, %rdx
14085bea5:     	addq	$0x10, %rdx
14085bea9:     	addq	$0x10, %r8
14085bead:     	jmp	0x14085be31 <.text+0x85ae31>
14085beaf:     	leaq	(%rax,%r10,8), %rax
14085beb3:     	movq	-0x8(%rax), %r14
14085beb7:     	movq	0x1610(%rbp), %rdx
14085bebe:     	testq	%rdx, %rdx
14085bec1:     	jne	0x14085bfda <.text+0x85afda>
14085bec7:     	jmp	0x14085bff0 <.text+0x85aff0>
14085becc:     	leaq	-0x10(%r10), %rdx
14085bed0:     	andq	%rcx, %rdx
14085bed3:     	movdqu	(%rax,%rdx), %xmm0
14085bed8:     	pcmpeqd	%xmm1, %xmm1
14085bedc:     	pcmpeqb	%xmm1, %xmm0
14085bee0:     	pmovmskb	%xmm0, %ecx
14085bee4:     	movdqu	(%rax,%r10), %xmm0
14085beea:     	pcmpeqb	%xmm1, %xmm0
14085beee:     	pmovmskb	%xmm0, %r8d
14085bef3:     	movw	$0x1f, %r11w
14085bef8:     	bsrw	%cx, %r11w
14085befd:     	xorl	$0xf, %r11d
14085bf01:     	orl	$0x10000, %r8d          # imm = 0x10000
14085bf08:     	tzcntl	%r8d, %r8d
14085bf0d:     	addl	%r11d, %r8d
14085bf10:     	movb	$-0x80, %cl
14085bf12:     	cmpw	$0xf, %r8w
14085bf17:     	ja	0x14085bf22 <.text+0x85af22>
14085bf19:     	incq	0xf0(%rsi)
14085bf20:     	movb	$-0x1, %cl
14085bf22:     	movb	%cl, (%rax,%r10)
14085bf26:     	movb	%cl, 0x10(%rax,%rdx)
14085bf2a:     	decq	0xf8(%rsi)
14085bf31:     	movq	-0x70(%r9), %rax
14085bf35:     	cmpq	$0x2, %rax
14085bf39:     	jne	0x14085fe7e <.text+0x85ee7e>
14085bf3f:     	movq	(%r15), %r14
14085bf42:     	leaq	0x1(%r14), %rax
14085bf46:     	movq	%rax, (%r15)
14085bf49:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085bf52:     	movq	$0x1, 0x550(%rbp)
14085bf5d:     	movdqu	0x519c22b(%rip), %xmm0  # 0x1459f8190
14085bf65:     	movdqu	%xmm0, 0x558(%rbp)
14085bf6d:     	movq	$0x8, 0x578(%rbp)
14085bf78:     	movq	$0x10, 0x580(%rbp)
14085bf83:     	movq	$0x0, 0x598(%rbp)
14085bf8e:     	movb	$0x1, 0x5a2(%rbp)
14085bf95:     	movq	$0x0, 0x568(%rbp)
14085bfa0:     	movb	$0x2, 0x588(%rbp)
14085bfa7:     	leaq	0x550(%rbp), %r8
14085bfae:     	movq	%rdi, %rcx
14085bfb1:     	movq	%r14, %rdx
14085bfb4:     	callq	0x14004abc0 <.text+0x49bc0>
14085bfb9:     	nop
14085bfba:     	leaq	0x78(%rsi), %rcx
14085bfbe:     	leaq	0x519c1cb(%rip), %rdx   # 0x1459f8190
14085bfc5:     	movq	%r14, %r8
14085bfc8:     	callq	0x14000e640 <.text+0xd640>
14085bfcd:     	nop
14085bfce:     	movq	0x1610(%rbp), %rdx
14085bfd5:     	testq	%rdx, %rdx
14085bfd8:     	je	0x14085bff0 <.text+0x85aff0>
14085bfda:     	movq	0x1618(%rbp), %rcx
14085bfe1:     	shlq	$0x3, %rdx
14085bfe5:     	movl	$0x8, %r8d
14085bfeb:     	callq	0x1400021d0 <.text+0x11d0>
14085bff0:     	cmpq	0x218(%rsi), %r14
14085bff7:     	jae	0x14085c01e <.text+0x85b01e>
14085bff9:     	movq	0x210(%rsi), %rax
14085c000:     	movq	(%rax,%r14,8), %rax
14085c004:     	testq	%rax, %rax
14085c007:     	je	0x14085c01e <.text+0x85b01e>
14085c009:     	movq	0x1e0(%rsi), %rcx
14085c010:     	notq	%rax
14085c013:     	imulq	$0x38, %rax, %rax
14085c017:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085c01c:     	jne	0x14085c09a <.text+0x85b09a>
14085c01e:     	movl	$0x0, 0x550(%rbp)
14085c028:     	movl	$0x3f1c28f6, 0x558(%rbp) # imm = 0x3F1C28F6
14085c032:     	movl	0x5b0(%rsi), %r12d
14085c039:     	movq	%rsi, %rcx
14085c03c:     	callq	0x144e76860 <.text+0x4e75860>
14085c041:     	movq	%r14, 0x1610(%rbp)
14085c048:     	leaq	0x1610(%rbp), %r9
14085c04f:     	movq	%rbx, %rcx
14085c052:     	movq	%r14, %rdx
14085c055:     	movq	%rdi, %r8
14085c058:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085c05d:     	movq	%rax, %r14
14085c060:     	cmpb	$0x1, 0x30(%rax)
14085c064:     	jne	0x14085c079 <.text+0x85b079>
14085c066:     	leaq	0x550(%rbp), %r8
14085c06d:     	movq	%r14, %rcx
14085c070:     	xorl	%edx, %edx
14085c072:     	callq	0x144e617b0 <.text+0x4e607b0>
14085c077:     	jmp	0x14085c096 <.text+0x85b096>
14085c079:     	movq	0x8(%r14), %r8
14085c07d:     	movq	0x10(%r14), %rcx
14085c081:     	leaq	0x550(%rbp), %rdx
14085c088:     	callq	0x145756dd1 <.text+0x5755dd1>
14085c08d:     	movl	%r12d, 0x28(%r14)
14085c091:     	movb	$0x1, 0x30(%r14)
14085c096:     	movl	%r12d, 0x2c(%r14)
14085c09a:     	movq	%rdi, 0x1628(%rbp)
14085c0a1:     	movq	%r15, 0x1630(%rbp)
14085c0a8:     	movq	$0x0, 0x1610(%rbp)
14085c0b3:     	movq	$0x8, 0x1618(%rbp)
14085c0be:     	movq	$0x0, 0x1620(%rbp)
14085c0c9:     	cmpq	$0x0, 0x90(%rsi)
14085c0d1:     	je	0x14085c17b <.text+0x85b17b>
14085c0d7:     	movabsq	$-0x3f4561dc3b23bcc1, %rcx # imm = 0xC0BA9E23C4DC433F
14085c0e1:     	movq	0x78(%rsi), %rax
14085c0e5:     	movq	0x80(%rsi), %rdx
14085c0ec:     	xorl	%r8d, %r8d
14085c0ef:     	movdqa	0x508f529(%rip), %xmm0  # 0x1458eb620
14085c0f7:     	pcmpeqd	%xmm1, %xmm1
14085c0fb:     	movdqa	0x519bd3d(%rip), %xmm2  # 0x1459f7e40
14085c103:     	andq	%rdx, %rcx
14085c106:     	movdqu	(%rax,%rcx), %xmm3
14085c10b:     	movdqa	%xmm3, %xmm4
14085c10f:     	pcmpeqb	%xmm0, %xmm4
14085c113:     	pmovmskb	%xmm4, %r9d
14085c118:     	testl	%r9d, %r9d
14085c11b:     	je	0x14085c160 <.text+0x85b160>
14085c11d:     	tzcntl	%r9d, %r10d
14085c122:     	addq	%rcx, %r10
14085c125:     	andq	%rdx, %r10
14085c128:     	negq	%r10
14085c12b:     	leaq	(%r10,%r10,2), %r10
14085c12f:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085c136:     	pcmpeqb	%xmm2, %xmm4
14085c13a:     	pmovmskb	%xmm4, %r11d
14085c13f:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085c146:     	je	0x14085c22f <.text+0x85b22f>
14085c14c:     	leal	-0x1(%r9), %r10d
14085c150:     	andw	%r9w, %r10w
14085c154:     	movl	%r10d, %r9d
14085c157:     	jne	0x14085c11d <.text+0x85b11d>
14085c159:     	nopl	(%rax)
14085c160:     	pcmpeqb	%xmm1, %xmm3
14085c164:     	pmovmskb	%xmm3, %r9d
14085c169:     	testl	%r9d, %r9d
14085c16c:     	jne	0x14085c17b <.text+0x85b17b>
14085c16e:     	addq	%r8, %rcx
14085c171:     	addq	$0x10, %rcx
14085c175:     	addq	$0x10, %r8
14085c179:     	jmp	0x14085c103 <.text+0x85b103>
14085c17b:     	movzbl	0xa0(%rsi), %eax
14085c182:     	movq	0xe0(%rsi), %rax
14085c189:     	movq	0xe8(%rsi), %rcx
14085c190:     	movabsq	$-0x3f4561dc3b23bcc1, %rdx # imm = 0xC0BA9E23C4DC433F
14085c19a:     	xorl	%r8d, %r8d
14085c19d:     	movdqa	0x508f47b(%rip), %xmm0  # 0x1458eb620
14085c1a5:     	pcmpeqd	%xmm1, %xmm1
14085c1a9:     	movdqa	0x519bc8f(%rip), %xmm2  # 0x1459f7e40
14085c1b1:     	andq	%rcx, %rdx
14085c1b4:     	movdqu	(%rax,%rdx), %xmm3
14085c1b9:     	movdqa	%xmm3, %xmm4
14085c1bd:     	pcmpeqb	%xmm0, %xmm4
14085c1c1:     	pmovmskb	%xmm4, %r11d
14085c1c6:     	testl	%r11d, %r11d
14085c1c9:     	je	0x14085c210 <.text+0x85b210>
14085c1cb:     	tzcntl	%r11d, %r10d
14085c1d0:     	addq	%rdx, %r10
14085c1d3:     	andq	%rcx, %r10
14085c1d6:     	movq	%r10, %r14
14085c1d9:     	shlq	$0x7, %r14
14085c1dd:     	movq	%rax, %r9
14085c1e0:     	subq	%r14, %r9
14085c1e3:     	movdqu	-0x80(%r9), %xmm4
14085c1e9:     	pcmpeqb	%xmm2, %xmm4
14085c1ed:     	pmovmskb	%xmm4, %r14d
14085c1f2:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085c1f9:     	je	0x14085c24c <.text+0x85b24c>
14085c1fb:     	leal	-0x1(%r11), %r9d
14085c1ff:     	andw	%r11w, %r9w
14085c203:     	movl	%r9d, %r11d
14085c206:     	jne	0x14085c1cb <.text+0x85b1cb>
14085c208:     	nopl	(%rax,%rax)
14085c210:     	pcmpeqb	%xmm1, %xmm3
14085c214:     	pmovmskb	%xmm3, %r9d
14085c219:     	testl	%r9d, %r9d
14085c21c:     	jne	0x14085c2bf <.text+0x85b2bf>
14085c222:     	addq	%r8, %rdx
14085c225:     	addq	$0x10, %rdx
14085c229:     	addq	$0x10, %r8
14085c22d:     	jmp	0x14085c1b1 <.text+0x85b1b1>
14085c22f:     	leaq	(%rax,%r10,8), %rax
14085c233:     	movq	-0x8(%rax), %r14
14085c237:     	movq	0x1610(%rbp), %rdx
14085c23e:     	testq	%rdx, %rdx
14085c241:     	jne	0x14085c35a <.text+0x85b35a>
14085c247:     	jmp	0x14085c370 <.text+0x85b370>
14085c24c:     	leaq	-0x10(%r10), %rdx
14085c250:     	andq	%rcx, %rdx
14085c253:     	movdqu	(%rax,%rdx), %xmm0
14085c258:     	pcmpeqd	%xmm1, %xmm1
14085c25c:     	pcmpeqb	%xmm1, %xmm0
14085c260:     	pmovmskb	%xmm0, %ecx
14085c264:     	movdqu	(%rax,%r10), %xmm0
14085c26a:     	pcmpeqb	%xmm1, %xmm0
14085c26e:     	pmovmskb	%xmm0, %r8d
14085c273:     	movw	$0x1f, %r11w
14085c278:     	bsrw	%cx, %r11w
14085c27d:     	xorl	$0xf, %r11d
14085c281:     	orl	$0x10000, %r8d          # imm = 0x10000
14085c288:     	tzcntl	%r8d, %r8d
14085c28d:     	addl	%r11d, %r8d
14085c290:     	movb	$-0x80, %cl
14085c292:     	cmpw	$0xf, %r8w
14085c297:     	ja	0x14085c2a2 <.text+0x85b2a2>
14085c299:     	incq	0xf0(%rsi)
14085c2a0:     	movb	$-0x1, %cl
14085c2a2:     	movb	%cl, (%rax,%r10)
14085c2a6:     	movb	%cl, 0x10(%rax,%rdx)
14085c2aa:     	decq	0xf8(%rsi)
14085c2b1:     	movq	-0x70(%r9), %rax
14085c2b5:     	cmpq	$0x2, %rax
14085c2b9:     	jne	0x14085ff0c <.text+0x85ef0c>
14085c2bf:     	movq	(%r15), %r14
14085c2c2:     	leaq	0x1(%r14), %rax
14085c2c6:     	movq	%rax, (%r15)
14085c2c9:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085c2d2:     	movq	$0x1, 0x550(%rbp)
14085c2dd:     	movdqu	0x519bebb(%rip), %xmm0  # 0x1459f81a0
14085c2e5:     	movdqu	%xmm0, 0x558(%rbp)
14085c2ed:     	movq	$0x8, 0x578(%rbp)
14085c2f8:     	movq	$0x10, 0x580(%rbp)
14085c303:     	movq	$0x0, 0x598(%rbp)
14085c30e:     	movb	$0x1, 0x5a2(%rbp)
14085c315:     	movq	$0x0, 0x568(%rbp)
14085c320:     	movb	$0x2, 0x588(%rbp)
14085c327:     	leaq	0x550(%rbp), %r8
14085c32e:     	movq	%rdi, %rcx
14085c331:     	movq	%r14, %rdx
14085c334:     	callq	0x14004abc0 <.text+0x49bc0>
14085c339:     	nop
14085c33a:     	leaq	0x78(%rsi), %rcx
14085c33e:     	leaq	0x519be5b(%rip), %rdx   # 0x1459f81a0
14085c345:     	movq	%r14, %r8
14085c348:     	callq	0x14000e640 <.text+0xd640>
14085c34d:     	nop
14085c34e:     	movq	0x1610(%rbp), %rdx
14085c355:     	testq	%rdx, %rdx
14085c358:     	je	0x14085c370 <.text+0x85b370>
14085c35a:     	movq	0x1618(%rbp), %rcx
14085c361:     	shlq	$0x3, %rdx
14085c365:     	movl	$0x8, %r8d
14085c36b:     	callq	0x1400021d0 <.text+0x11d0>
14085c370:     	cmpq	0x218(%rsi), %r14
14085c377:     	jae	0x14085c39e <.text+0x85b39e>
14085c379:     	movq	0x210(%rsi), %rax
14085c380:     	movq	(%rax,%r14,8), %rax
14085c384:     	testq	%rax, %rax
14085c387:     	je	0x14085c39e <.text+0x85b39e>
14085c389:     	movq	0x1e0(%rsi), %rcx
14085c390:     	notq	%rax
14085c393:     	imulq	$0x38, %rax, %rax
14085c397:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085c39c:     	jne	0x14085c41a <.text+0x85b41a>
14085c39e:     	movl	$0x0, 0x550(%rbp)
14085c3a8:     	movl	$0x3f1c28f6, 0x558(%rbp) # imm = 0x3F1C28F6
14085c3b2:     	movl	0x5b0(%rsi), %r12d
14085c3b9:     	movq	%rsi, %rcx
14085c3bc:     	callq	0x144e76860 <.text+0x4e75860>
14085c3c1:     	movq	%r14, 0x1610(%rbp)
14085c3c8:     	leaq	0x1610(%rbp), %r9
14085c3cf:     	movq	%rbx, %rcx
14085c3d2:     	movq	%r14, %rdx
14085c3d5:     	movq	%rdi, %r8
14085c3d8:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085c3dd:     	movq	%rax, %r14
14085c3e0:     	cmpb	$0x1, 0x30(%rax)
14085c3e4:     	jne	0x14085c3f9 <.text+0x85b3f9>
14085c3e6:     	leaq	0x550(%rbp), %r8
14085c3ed:     	movq	%r14, %rcx
14085c3f0:     	xorl	%edx, %edx
14085c3f2:     	callq	0x144e617b0 <.text+0x4e607b0>
14085c3f7:     	jmp	0x14085c416 <.text+0x85b416>
14085c3f9:     	movq	0x8(%r14), %r8
14085c3fd:     	movq	0x10(%r14), %rcx
14085c401:     	leaq	0x550(%rbp), %rdx
14085c408:     	callq	0x145756dd1 <.text+0x5755dd1>
14085c40d:     	movl	%r12d, 0x28(%r14)
14085c411:     	movb	$0x1, 0x30(%r14)
14085c416:     	movl	%r12d, 0x2c(%r14)
14085c41a:     	movq	%rdi, 0x1628(%rbp)
14085c421:     	movq	%r15, 0x1630(%rbp)
14085c428:     	movq	$0x0, 0x1610(%rbp)
14085c433:     	movq	$0x8, 0x1618(%rbp)
14085c43e:     	movq	$0x0, 0x1620(%rbp)
14085c449:     	cmpq	$0x0, 0x90(%rsi)
14085c451:     	je	0x14085c4fb <.text+0x85b4fb>
14085c457:     	movabsq	$0x124144b845253594, %rcx # imm = 0x124144B845253594
14085c461:     	movq	0x78(%rsi), %rax
14085c465:     	movq	0x80(%rsi), %rdx
14085c46c:     	xorl	%r8d, %r8d
14085c46f:     	movdqa	0x508f109(%rip), %xmm0  # 0x1458eb580
14085c477:     	pcmpeqd	%xmm1, %xmm1
14085c47b:     	movdqa	0x519b9cd(%rip), %xmm2  # 0x1459f7e50
14085c483:     	andq	%rdx, %rcx
14085c486:     	movdqu	(%rax,%rcx), %xmm3
14085c48b:     	movdqa	%xmm3, %xmm4
14085c48f:     	pcmpeqb	%xmm0, %xmm4
14085c493:     	pmovmskb	%xmm4, %r9d
14085c498:     	testl	%r9d, %r9d
14085c49b:     	je	0x14085c4e0 <.text+0x85b4e0>
14085c49d:     	tzcntl	%r9d, %r10d
14085c4a2:     	addq	%rcx, %r10
14085c4a5:     	andq	%rdx, %r10
14085c4a8:     	negq	%r10
14085c4ab:     	leaq	(%r10,%r10,2), %r10
14085c4af:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085c4b6:     	pcmpeqb	%xmm2, %xmm4
14085c4ba:     	pmovmskb	%xmm4, %r11d
14085c4bf:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085c4c6:     	je	0x14085c5af <.text+0x85b5af>
14085c4cc:     	leal	-0x1(%r9), %r10d
14085c4d0:     	andw	%r9w, %r10w
14085c4d4:     	movl	%r10d, %r9d
14085c4d7:     	jne	0x14085c49d <.text+0x85b49d>
14085c4d9:     	nopl	(%rax)
14085c4e0:     	pcmpeqb	%xmm1, %xmm3
14085c4e4:     	pmovmskb	%xmm3, %r9d
14085c4e9:     	testl	%r9d, %r9d
14085c4ec:     	jne	0x14085c4fb <.text+0x85b4fb>
14085c4ee:     	addq	%r8, %rcx
14085c4f1:     	addq	$0x10, %rcx
14085c4f5:     	addq	$0x10, %r8
14085c4f9:     	jmp	0x14085c483 <.text+0x85b483>
14085c4fb:     	movzbl	0xa0(%rsi), %eax
14085c502:     	movq	0xe0(%rsi), %rax
14085c509:     	movq	0xe8(%rsi), %rcx
14085c510:     	movabsq	$0x124144b845253594, %rdx # imm = 0x124144B845253594
14085c51a:     	xorl	%r8d, %r8d
14085c51d:     	movdqa	0x508f05b(%rip), %xmm0  # 0x1458eb580
14085c525:     	pcmpeqd	%xmm1, %xmm1
14085c529:     	movdqa	0x519b91f(%rip), %xmm2  # 0x1459f7e50
14085c531:     	andq	%rcx, %rdx
14085c534:     	movdqu	(%rax,%rdx), %xmm3
14085c539:     	movdqa	%xmm3, %xmm4
14085c53d:     	pcmpeqb	%xmm0, %xmm4
14085c541:     	pmovmskb	%xmm4, %r11d
14085c546:     	testl	%r11d, %r11d
14085c549:     	je	0x14085c590 <.text+0x85b590>
14085c54b:     	tzcntl	%r11d, %r10d
14085c550:     	addq	%rdx, %r10
14085c553:     	andq	%rcx, %r10
14085c556:     	movq	%r10, %r14
14085c559:     	shlq	$0x7, %r14
14085c55d:     	movq	%rax, %r9
14085c560:     	subq	%r14, %r9
14085c563:     	movdqu	-0x80(%r9), %xmm4
14085c569:     	pcmpeqb	%xmm2, %xmm4
14085c56d:     	pmovmskb	%xmm4, %r14d
14085c572:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085c579:     	je	0x14085c5cc <.text+0x85b5cc>
14085c57b:     	leal	-0x1(%r11), %r9d
14085c57f:     	andw	%r11w, %r9w
14085c583:     	movl	%r9d, %r11d
14085c586:     	jne	0x14085c54b <.text+0x85b54b>
14085c588:     	nopl	(%rax,%rax)
14085c590:     	pcmpeqb	%xmm1, %xmm3
14085c594:     	pmovmskb	%xmm3, %r9d
14085c599:     	testl	%r9d, %r9d
14085c59c:     	jne	0x14085c63f <.text+0x85b63f>
14085c5a2:     	addq	%r8, %rdx
14085c5a5:     	addq	$0x10, %rdx
14085c5a9:     	addq	$0x10, %r8
14085c5ad:     	jmp	0x14085c531 <.text+0x85b531>
14085c5af:     	leaq	(%rax,%r10,8), %rax
14085c5b3:     	movq	-0x8(%rax), %r14
14085c5b7:     	movq	0x1610(%rbp), %rdx
14085c5be:     	testq	%rdx, %rdx
14085c5c1:     	jne	0x14085c6da <.text+0x85b6da>
14085c5c7:     	jmp	0x14085c6f0 <.text+0x85b6f0>
14085c5cc:     	leaq	-0x10(%r10), %rdx
14085c5d0:     	andq	%rcx, %rdx
14085c5d3:     	movdqu	(%rax,%rdx), %xmm0
14085c5d8:     	pcmpeqd	%xmm1, %xmm1
14085c5dc:     	pcmpeqb	%xmm1, %xmm0
14085c5e0:     	pmovmskb	%xmm0, %ecx
14085c5e4:     	movdqu	(%rax,%r10), %xmm0
14085c5ea:     	pcmpeqb	%xmm1, %xmm0
14085c5ee:     	pmovmskb	%xmm0, %r8d
14085c5f3:     	movw	$0x1f, %r11w
14085c5f8:     	bsrw	%cx, %r11w
14085c5fd:     	xorl	$0xf, %r11d
14085c601:     	orl	$0x10000, %r8d          # imm = 0x10000
14085c608:     	tzcntl	%r8d, %r8d
14085c60d:     	addl	%r11d, %r8d
14085c610:     	movb	$-0x80, %cl
14085c612:     	cmpw	$0xf, %r8w
14085c617:     	ja	0x14085c622 <.text+0x85b622>
14085c619:     	incq	0xf0(%rsi)
14085c620:     	movb	$-0x1, %cl
14085c622:     	movb	%cl, (%rax,%r10)
14085c626:     	movb	%cl, 0x10(%rax,%rdx)
14085c62a:     	decq	0xf8(%rsi)
14085c631:     	movq	-0x70(%r9), %rax
14085c635:     	cmpq	$0x2, %rax
14085c639:     	jne	0x14085ff9a <.text+0x85ef9a>
14085c63f:     	movq	(%r15), %r14
14085c642:     	leaq	0x1(%r14), %rax
14085c646:     	movq	%rax, (%r15)
14085c649:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085c652:     	movq	$0x1, 0x550(%rbp)
14085c65d:     	movdqu	0x519bb1b(%rip), %xmm0  # 0x1459f8180
14085c665:     	movdqu	%xmm0, 0x558(%rbp)
14085c66d:     	movq	$0x8, 0x578(%rbp)
14085c678:     	movq	$0x18, 0x580(%rbp)
14085c683:     	movq	$0x0, 0x598(%rbp)
14085c68e:     	movb	$0x1, 0x5a2(%rbp)
14085c695:     	movq	$0x0, 0x568(%rbp)
14085c6a0:     	movb	$0x2, 0x588(%rbp)
14085c6a7:     	leaq	0x550(%rbp), %r8
14085c6ae:     	movq	%rdi, %rcx
14085c6b1:     	movq	%r14, %rdx
14085c6b4:     	callq	0x14004abc0 <.text+0x49bc0>
14085c6b9:     	nop
14085c6ba:     	leaq	0x78(%rsi), %rcx
14085c6be:     	leaq	0x519babb(%rip), %rdx   # 0x1459f8180
14085c6c5:     	movq	%r14, %r8
14085c6c8:     	callq	0x14000e640 <.text+0xd640>
14085c6cd:     	nop
14085c6ce:     	movq	0x1610(%rbp), %rdx
14085c6d5:     	testq	%rdx, %rdx
14085c6d8:     	je	0x14085c6f0 <.text+0x85b6f0>
14085c6da:     	movq	0x1618(%rbp), %rcx
14085c6e1:     	shlq	$0x3, %rdx
14085c6e5:     	movl	$0x8, %r8d
14085c6eb:     	callq	0x1400021d0 <.text+0x11d0>
14085c6f0:     	cmpq	0x218(%rsi), %r14
14085c6f7:     	jae	0x14085c722 <.text+0x85b722>
14085c6f9:     	movq	0x210(%rsi), %rax
14085c700:     	movq	(%rax,%r14,8), %rax
14085c704:     	testq	%rax, %rax
14085c707:     	je	0x14085c722 <.text+0x85b722>
14085c709:     	movq	0x1e0(%rsi), %rcx
14085c710:     	notq	%rax
14085c713:     	imulq	$0x38, %rax, %rax
14085c717:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085c71c:     	jne	0x14085c7a8 <.text+0x85b7a8>
14085c722:     	movl	$0x0, 0x550(%rbp)
14085c72c:     	movl	$0x0, 0x558(%rbp)
14085c736:     	movl	$0x3f1c28f6, 0x560(%rbp) # imm = 0x3F1C28F6
14085c740:     	movl	0x5b0(%rsi), %r12d
14085c747:     	movq	%rsi, %rcx
14085c74a:     	callq	0x144e76860 <.text+0x4e75860>
14085c74f:     	movq	%r14, 0x1610(%rbp)
14085c756:     	leaq	0x1610(%rbp), %r9
14085c75d:     	movq	%rbx, %rcx
14085c760:     	movq	%r14, %rdx
14085c763:     	movq	%rdi, %r8
14085c766:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085c76b:     	movq	%rax, %r14
14085c76e:     	cmpb	$0x1, 0x30(%rax)
14085c772:     	jne	0x14085c787 <.text+0x85b787>
14085c774:     	leaq	0x550(%rbp), %r8
14085c77b:     	movq	%r14, %rcx
14085c77e:     	xorl	%edx, %edx
14085c780:     	callq	0x144e617b0 <.text+0x4e607b0>
14085c785:     	jmp	0x14085c7a4 <.text+0x85b7a4>
14085c787:     	movq	0x8(%r14), %r8
14085c78b:     	movq	0x10(%r14), %rcx
14085c78f:     	leaq	0x550(%rbp), %rdx
14085c796:     	callq	0x145756dd1 <.text+0x5755dd1>
14085c79b:     	movl	%r12d, 0x28(%r14)
14085c79f:     	movb	$0x1, 0x30(%r14)
14085c7a4:     	movl	%r12d, 0x2c(%r14)
14085c7a8:     	movq	%rdi, 0x1628(%rbp)
14085c7af:     	movq	%r15, 0x1630(%rbp)
14085c7b6:     	movq	$0x0, 0x1610(%rbp)
14085c7c1:     	movq	$0x8, 0x1618(%rbp)
14085c7cc:     	movq	$0x0, 0x1620(%rbp)
14085c7d7:     	cmpq	$0x0, 0x90(%rsi)
14085c7df:     	je	0x14085c88b <.text+0x85b88b>
14085c7e5:     	movabsq	$-0x6b2c9b3b9db3b4c9, %rcx # imm = 0x94D364C4624C4B37
14085c7ef:     	movq	0x78(%rsi), %rax
14085c7f3:     	movq	0x80(%rsi), %rdx
14085c7fa:     	xorl	%r8d, %r8d
14085c7fd:     	movdqa	0x5099d4b(%rip), %xmm0  # 0x1458f6550
14085c805:     	pcmpeqd	%xmm1, %xmm1
14085c809:     	movdqa	0x519b64f(%rip), %xmm2  # 0x1459f7e60
14085c811:     	andq	%rdx, %rcx
14085c814:     	movdqu	(%rax,%rcx), %xmm3
14085c819:     	movdqa	%xmm3, %xmm4
14085c81d:     	pcmpeqb	%xmm0, %xmm4
14085c821:     	pmovmskb	%xmm4, %r9d
14085c826:     	testl	%r9d, %r9d
14085c829:     	je	0x14085c870 <.text+0x85b870>
14085c82b:     	tzcntl	%r9d, %r10d
14085c830:     	addq	%rcx, %r10
14085c833:     	andq	%rdx, %r10
14085c836:     	negq	%r10
14085c839:     	leaq	(%r10,%r10,2), %r10
14085c83d:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085c844:     	pcmpeqb	%xmm2, %xmm4
14085c848:     	pmovmskb	%xmm4, %r11d
14085c84d:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085c854:     	je	0x14085c93f <.text+0x85b93f>
14085c85a:     	leal	-0x1(%r9), %r10d
14085c85e:     	andw	%r9w, %r10w
14085c862:     	movl	%r10d, %r9d
14085c865:     	jne	0x14085c82b <.text+0x85b82b>
14085c867:     	nopw	(%rax,%rax)
14085c870:     	pcmpeqb	%xmm1, %xmm3
14085c874:     	pmovmskb	%xmm3, %r9d
14085c879:     	testl	%r9d, %r9d
14085c87c:     	jne	0x14085c88b <.text+0x85b88b>
14085c87e:     	addq	%r8, %rcx
14085c881:     	addq	$0x10, %rcx
14085c885:     	addq	$0x10, %r8
14085c889:     	jmp	0x14085c811 <.text+0x85b811>
14085c88b:     	movzbl	0xa0(%rsi), %eax
14085c892:     	movq	0xe0(%rsi), %rax
14085c899:     	movq	0xe8(%rsi), %rcx
14085c8a0:     	movabsq	$-0x6b2c9b3b9db3b4c9, %rdx # imm = 0x94D364C4624C4B37
14085c8aa:     	xorl	%r8d, %r8d
14085c8ad:     	movdqa	0x5099c9b(%rip), %xmm0  # 0x1458f6550
14085c8b5:     	pcmpeqd	%xmm1, %xmm1
14085c8b9:     	movdqa	0x519b59f(%rip), %xmm2  # 0x1459f7e60
14085c8c1:     	andq	%rcx, %rdx
14085c8c4:     	movdqu	(%rax,%rdx), %xmm3
14085c8c9:     	movdqa	%xmm3, %xmm4
14085c8cd:     	pcmpeqb	%xmm0, %xmm4
14085c8d1:     	pmovmskb	%xmm4, %r11d
14085c8d6:     	testl	%r11d, %r11d
14085c8d9:     	je	0x14085c920 <.text+0x85b920>
14085c8db:     	tzcntl	%r11d, %r10d
14085c8e0:     	addq	%rdx, %r10
14085c8e3:     	andq	%rcx, %r10
14085c8e6:     	movq	%r10, %r14
14085c8e9:     	shlq	$0x7, %r14
14085c8ed:     	movq	%rax, %r9
14085c8f0:     	subq	%r14, %r9
14085c8f3:     	movdqu	-0x80(%r9), %xmm4
14085c8f9:     	pcmpeqb	%xmm2, %xmm4
14085c8fd:     	pmovmskb	%xmm4, %r14d
14085c902:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085c909:     	je	0x14085c95c <.text+0x85b95c>
14085c90b:     	leal	-0x1(%r11), %r9d
14085c90f:     	andw	%r11w, %r9w
14085c913:     	movl	%r9d, %r11d
14085c916:     	jne	0x14085c8db <.text+0x85b8db>
14085c918:     	nopl	(%rax,%rax)
14085c920:     	pcmpeqb	%xmm1, %xmm3
14085c924:     	pmovmskb	%xmm3, %r9d
14085c929:     	testl	%r9d, %r9d
14085c92c:     	jne	0x14085c9cf <.text+0x85b9cf>
14085c932:     	addq	%r8, %rdx
14085c935:     	addq	$0x10, %rdx
14085c939:     	addq	$0x10, %r8
14085c93d:     	jmp	0x14085c8c1 <.text+0x85b8c1>
14085c93f:     	leaq	(%rax,%r10,8), %rax
14085c943:     	movq	-0x8(%rax), %r14
14085c947:     	movq	0x1610(%rbp), %rdx
14085c94e:     	testq	%rdx, %rdx
14085c951:     	jne	0x14085ca6a <.text+0x85ba6a>
14085c957:     	jmp	0x14085ca80 <.text+0x85ba80>
14085c95c:     	leaq	-0x10(%r10), %rdx
14085c960:     	andq	%rcx, %rdx
14085c963:     	movdqu	(%rax,%rdx), %xmm0
14085c968:     	pcmpeqd	%xmm1, %xmm1
14085c96c:     	pcmpeqb	%xmm1, %xmm0
14085c970:     	pmovmskb	%xmm0, %ecx
14085c974:     	movdqu	(%rax,%r10), %xmm0
14085c97a:     	pcmpeqb	%xmm1, %xmm0
14085c97e:     	pmovmskb	%xmm0, %r8d
14085c983:     	movw	$0x1f, %r11w
14085c988:     	bsrw	%cx, %r11w
14085c98d:     	xorl	$0xf, %r11d
14085c991:     	orl	$0x10000, %r8d          # imm = 0x10000
14085c998:     	tzcntl	%r8d, %r8d
14085c99d:     	addl	%r11d, %r8d
14085c9a0:     	movb	$-0x80, %cl
14085c9a2:     	cmpw	$0xf, %r8w
14085c9a7:     	ja	0x14085c9b2 <.text+0x85b9b2>
14085c9a9:     	incq	0xf0(%rsi)
14085c9b0:     	movb	$-0x1, %cl
14085c9b2:     	movb	%cl, (%rax,%r10)
14085c9b6:     	movb	%cl, 0x10(%rax,%rdx)
14085c9ba:     	decq	0xf8(%rsi)
14085c9c1:     	movq	-0x70(%r9), %rax
14085c9c5:     	cmpq	$0x2, %rax
14085c9c9:     	jne	0x140860028 <.text+0x85f028>
14085c9cf:     	movq	(%r15), %r14
14085c9d2:     	leaq	0x1(%r14), %rax
14085c9d6:     	movq	%rax, (%r15)
14085c9d9:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085c9e2:     	movq	$0x1, 0x550(%rbp)
14085c9ed:     	movdqu	0x519b7cb(%rip), %xmm0  # 0x1459f81c0
14085c9f5:     	movdqu	%xmm0, 0x558(%rbp)
14085c9fd:     	movq	$0x8, 0x578(%rbp)
14085ca08:     	movq	$0x18, 0x580(%rbp)
14085ca13:     	movq	$0x0, 0x598(%rbp)
14085ca1e:     	movb	$0x1, 0x5a2(%rbp)
14085ca25:     	movq	$0x0, 0x568(%rbp)
14085ca30:     	movb	$0x2, 0x588(%rbp)
14085ca37:     	leaq	0x550(%rbp), %r8
14085ca3e:     	movq	%rdi, %rcx
14085ca41:     	movq	%r14, %rdx
14085ca44:     	callq	0x14004abc0 <.text+0x49bc0>
14085ca49:     	nop
14085ca4a:     	leaq	0x78(%rsi), %rcx
14085ca4e:     	leaq	0x519b76b(%rip), %rdx   # 0x1459f81c0
14085ca55:     	movq	%r14, %r8
14085ca58:     	callq	0x14000e640 <.text+0xd640>
14085ca5d:     	nop
14085ca5e:     	movq	0x1610(%rbp), %rdx
14085ca65:     	testq	%rdx, %rdx
14085ca68:     	je	0x14085ca80 <.text+0x85ba80>
14085ca6a:     	movq	0x1618(%rbp), %rcx
14085ca71:     	shlq	$0x3, %rdx
14085ca75:     	movl	$0x8, %r8d
14085ca7b:     	callq	0x1400021d0 <.text+0x11d0>
14085ca80:     	cmpq	0x218(%rsi), %r14
14085ca87:     	jae	0x14085cab2 <.text+0x85bab2>
14085ca89:     	movq	0x210(%rsi), %rax
14085ca90:     	movq	(%rax,%r14,8), %rax
14085ca94:     	testq	%rax, %rax
14085ca97:     	je	0x14085cab2 <.text+0x85bab2>
14085ca99:     	movq	0x1e0(%rsi), %rcx
14085caa0:     	notq	%rax
14085caa3:     	imulq	$0x38, %rax, %rax
14085caa7:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085caac:     	jne	0x14085cb35 <.text+0x85bb35>
14085cab2:     	movl	$0x0, 0x550(%rbp)
14085cabc:     	movl	$0x0, 0x558(%rbp)
14085cac6:     	movb	$0x0, 0x560(%rbp)
14085cacd:     	movl	0x5b0(%rsi), %r12d
14085cad4:     	movq	%rsi, %rcx
14085cad7:     	callq	0x144e76860 <.text+0x4e75860>
14085cadc:     	movq	%r14, 0x1610(%rbp)
14085cae3:     	leaq	0x1610(%rbp), %r9
14085caea:     	movq	%rbx, %rcx
14085caed:     	movq	%r14, %rdx
14085caf0:     	movq	%rdi, %r8
14085caf3:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085caf8:     	movq	%rax, %r14
14085cafb:     	cmpb	$0x1, 0x30(%rax)
14085caff:     	jne	0x14085cb14 <.text+0x85bb14>
14085cb01:     	leaq	0x550(%rbp), %r8
14085cb08:     	movq	%r14, %rcx
14085cb0b:     	xorl	%edx, %edx
14085cb0d:     	callq	0x144e617b0 <.text+0x4e607b0>
14085cb12:     	jmp	0x14085cb31 <.text+0x85bb31>
14085cb14:     	movq	0x8(%r14), %r8
14085cb18:     	movq	0x10(%r14), %rcx
14085cb1c:     	leaq	0x550(%rbp), %rdx
14085cb23:     	callq	0x145756dd1 <.text+0x5755dd1>
14085cb28:     	movl	%r12d, 0x28(%r14)
14085cb2c:     	movb	$0x1, 0x30(%r14)
14085cb31:     	movl	%r12d, 0x2c(%r14)
14085cb35:     	movq	%rdi, 0x1628(%rbp)
14085cb3c:     	movq	%r15, 0x1630(%rbp)
14085cb43:     	movq	$0x0, 0x1610(%rbp)
14085cb4e:     	movq	$0x8, 0x1618(%rbp)
14085cb59:     	movq	$0x0, 0x1620(%rbp)
14085cb64:     	cmpq	$0x0, 0x90(%rsi)
14085cb6c:     	je	0x14085cc1b <.text+0x85bc1b>
14085cb72:     	movabsq	$-0x41c5e30fa341a1ba, %rcx # imm = 0xBE3A1CF05CBE5E46
14085cb7c:     	movq	0x78(%rsi), %rax
14085cb80:     	movq	0x80(%rsi), %rdx
14085cb87:     	xorl	%r8d, %r8d
14085cb8a:     	movdqa	0x50d725e(%rip), %xmm0  # 0x145933df0
14085cb92:     	pcmpeqd	%xmm1, %xmm1
14085cb96:     	movdqa	0x519b2d2(%rip), %xmm2  # 0x1459f7e70
14085cb9e:     	andq	%rdx, %rcx
14085cba1:     	movdqu	(%rax,%rcx), %xmm3
14085cba6:     	movdqa	%xmm3, %xmm4
14085cbaa:     	pcmpeqb	%xmm0, %xmm4
14085cbae:     	pmovmskb	%xmm4, %r9d
14085cbb3:     	testl	%r9d, %r9d
14085cbb6:     	je	0x14085cc00 <.text+0x85bc00>
14085cbb8:     	tzcntl	%r9d, %r10d
14085cbbd:     	addq	%rcx, %r10
14085cbc0:     	andq	%rdx, %r10
14085cbc3:     	negq	%r10
14085cbc6:     	leaq	(%r10,%r10,2), %r10
14085cbca:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085cbd1:     	pcmpeqb	%xmm2, %xmm4
14085cbd5:     	pmovmskb	%xmm4, %r11d
14085cbda:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085cbe1:     	je	0x14085cccf <.text+0x85bccf>
14085cbe7:     	leal	-0x1(%r9), %r10d
14085cbeb:     	andw	%r9w, %r10w
14085cbef:     	movl	%r10d, %r9d
14085cbf2:     	jne	0x14085cbb8 <.text+0x85bbb8>
14085cbf4:     	nopw	%cs:(%rax,%rax)
14085cc00:     	pcmpeqb	%xmm1, %xmm3
14085cc04:     	pmovmskb	%xmm3, %r9d
14085cc09:     	testl	%r9d, %r9d
14085cc0c:     	jne	0x14085cc1b <.text+0x85bc1b>
14085cc0e:     	addq	%r8, %rcx
14085cc11:     	addq	$0x10, %rcx
14085cc15:     	addq	$0x10, %r8
14085cc19:     	jmp	0x14085cb9e <.text+0x85bb9e>
14085cc1b:     	movzbl	0xa0(%rsi), %eax
14085cc22:     	movq	0xe0(%rsi), %rax
14085cc29:     	movq	0xe8(%rsi), %rcx
14085cc30:     	movabsq	$-0x41c5e30fa341a1ba, %rdx # imm = 0xBE3A1CF05CBE5E46
14085cc3a:     	xorl	%r8d, %r8d
14085cc3d:     	movdqa	0x50d71ab(%rip), %xmm0  # 0x145933df0
14085cc45:     	pcmpeqd	%xmm1, %xmm1
14085cc49:     	movdqa	0x519b21f(%rip), %xmm2  # 0x1459f7e70
14085cc51:     	andq	%rcx, %rdx
14085cc54:     	movdqu	(%rax,%rdx), %xmm3
14085cc59:     	movdqa	%xmm3, %xmm4
14085cc5d:     	pcmpeqb	%xmm0, %xmm4
14085cc61:     	pmovmskb	%xmm4, %r11d
14085cc66:     	testl	%r11d, %r11d
14085cc69:     	je	0x14085ccb0 <.text+0x85bcb0>
14085cc6b:     	tzcntl	%r11d, %r10d
14085cc70:     	addq	%rdx, %r10
14085cc73:     	andq	%rcx, %r10
14085cc76:     	movq	%r10, %r14
14085cc79:     	shlq	$0x7, %r14
14085cc7d:     	movq	%rax, %r9
14085cc80:     	subq	%r14, %r9
14085cc83:     	movdqu	-0x80(%r9), %xmm4
14085cc89:     	pcmpeqb	%xmm2, %xmm4
14085cc8d:     	pmovmskb	%xmm4, %r14d
14085cc92:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085cc99:     	je	0x14085ccec <.text+0x85bcec>
14085cc9b:     	leal	-0x1(%r11), %r9d
14085cc9f:     	andw	%r11w, %r9w
14085cca3:     	movl	%r9d, %r11d
14085cca6:     	jne	0x14085cc6b <.text+0x85bc6b>
14085cca8:     	nopl	(%rax,%rax)
14085ccb0:     	pcmpeqb	%xmm1, %xmm3
14085ccb4:     	pmovmskb	%xmm3, %r9d
14085ccb9:     	testl	%r9d, %r9d
14085ccbc:     	jne	0x14085cd5f <.text+0x85bd5f>
14085ccc2:     	addq	%r8, %rdx
14085ccc5:     	addq	$0x10, %rdx
14085ccc9:     	addq	$0x10, %r8
14085cccd:     	jmp	0x14085cc51 <.text+0x85bc51>
14085cccf:     	leaq	(%rax,%r10,8), %rax
14085ccd3:     	movq	-0x8(%rax), %r14
14085ccd7:     	movq	0x1610(%rbp), %rdx
14085ccde:     	testq	%rdx, %rdx
14085cce1:     	jne	0x14085cdfa <.text+0x85bdfa>
14085cce7:     	jmp	0x14085ce10 <.text+0x85be10>
14085ccec:     	leaq	-0x10(%r10), %rdx
14085ccf0:     	andq	%rcx, %rdx
14085ccf3:     	movdqu	(%rax,%rdx), %xmm0
14085ccf8:     	pcmpeqd	%xmm1, %xmm1
14085ccfc:     	pcmpeqb	%xmm1, %xmm0
14085cd00:     	pmovmskb	%xmm0, %ecx
14085cd04:     	movdqu	(%rax,%r10), %xmm0
14085cd0a:     	pcmpeqb	%xmm1, %xmm0
14085cd0e:     	pmovmskb	%xmm0, %r8d
14085cd13:     	movw	$0x1f, %r11w
14085cd18:     	bsrw	%cx, %r11w
14085cd1d:     	xorl	$0xf, %r11d
14085cd21:     	orl	$0x10000, %r8d          # imm = 0x10000
14085cd28:     	tzcntl	%r8d, %r8d
14085cd2d:     	addl	%r11d, %r8d
14085cd30:     	movb	$-0x80, %cl
14085cd32:     	cmpw	$0xf, %r8w
14085cd37:     	ja	0x14085cd42 <.text+0x85bd42>
14085cd39:     	incq	0xf0(%rsi)
14085cd40:     	movb	$-0x1, %cl
14085cd42:     	movb	%cl, (%rax,%r10)
14085cd46:     	movb	%cl, 0x10(%rax,%rdx)
14085cd4a:     	decq	0xf8(%rsi)
14085cd51:     	movq	-0x70(%r9), %rax
14085cd55:     	cmpq	$0x2, %rax
14085cd59:     	jne	0x1408600b6 <.text+0x85f0b6>
14085cd5f:     	movq	(%r15), %r14
14085cd62:     	leaq	0x1(%r14), %rax
14085cd66:     	movq	%rax, (%r15)
14085cd69:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085cd72:     	movq	$0x1, 0x550(%rbp)
14085cd7d:     	movdqu	0x519b52b(%rip), %xmm0  # 0x1459f82b0
14085cd85:     	movdqu	%xmm0, 0x558(%rbp)
14085cd8d:     	movq	$0x4, 0x578(%rbp)
14085cd98:     	movq	$0xbc, 0x580(%rbp)
14085cda3:     	movq	$0x0, 0x598(%rbp)
14085cdae:     	movb	$0x1, 0x5a2(%rbp)
14085cdb5:     	movq	$0x0, 0x568(%rbp)
14085cdc0:     	movb	$0x2, 0x588(%rbp)
14085cdc7:     	leaq	0x550(%rbp), %r8
14085cdce:     	movq	%rdi, %rcx
14085cdd1:     	movq	%r14, %rdx
14085cdd4:     	callq	0x14004abc0 <.text+0x49bc0>
14085cdd9:     	nop
14085cdda:     	leaq	0x78(%rsi), %rcx
14085cdde:     	leaq	0x519b4cb(%rip), %rdx   # 0x1459f82b0
14085cde5:     	movq	%r14, %r8
14085cde8:     	callq	0x14000e640 <.text+0xd640>
14085cded:     	nop
14085cdee:     	movq	0x1610(%rbp), %rdx
14085cdf5:     	testq	%rdx, %rdx
14085cdf8:     	je	0x14085ce10 <.text+0x85be10>
14085cdfa:     	movq	0x1618(%rbp), %rcx
14085ce01:     	shlq	$0x3, %rdx
14085ce05:     	movl	$0x8, %r8d
14085ce0b:     	callq	0x1400021d0 <.text+0x11d0>
14085ce10:     	cmpq	0x218(%rsi), %r14
14085ce17:     	jae	0x14085ce42 <.text+0x85be42>
14085ce19:     	movq	0x210(%rsi), %rax
14085ce20:     	movq	(%rax,%r14,8), %rax
14085ce24:     	testq	%rax, %rax
14085ce27:     	je	0x14085ce42 <.text+0x85be42>
14085ce29:     	movq	0x1e0(%rsi), %rcx
14085ce30:     	notq	%rax
14085ce33:     	imulq	$0x38, %rax, %rax
14085ce37:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085ce3c:     	jne	0x14085cec2 <.text+0x85bec2>
14085ce42:     	movb	$0x2, 0x550(%rbp)
14085ce49:     	movl	$0x0, 0x604(%rbp)
14085ce53:     	movb	$0x2, 0x608(%rbp)
14085ce5a:     	movl	0x5b0(%rsi), %r12d
14085ce61:     	movq	%rsi, %rcx
14085ce64:     	callq	0x144e76860 <.text+0x4e75860>
14085ce69:     	movq	%r14, 0x1610(%rbp)
14085ce70:     	leaq	0x1610(%rbp), %r9
14085ce77:     	movq	%rbx, %rcx
14085ce7a:     	movq	%r14, %rdx
14085ce7d:     	movq	%rdi, %r8
14085ce80:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085ce85:     	movq	%rax, %r14
14085ce88:     	cmpb	$0x1, 0x30(%rax)
14085ce8c:     	jne	0x14085cea1 <.text+0x85bea1>
14085ce8e:     	leaq	0x550(%rbp), %r8
14085ce95:     	movq	%r14, %rcx
14085ce98:     	xorl	%edx, %edx
14085ce9a:     	callq	0x144e617b0 <.text+0x4e607b0>
14085ce9f:     	jmp	0x14085cebe <.text+0x85bebe>
14085cea1:     	movq	0x8(%r14), %r8
14085cea5:     	movq	0x10(%r14), %rcx
14085cea9:     	leaq	0x550(%rbp), %rdx
14085ceb0:     	callq	0x145756dd1 <.text+0x5755dd1>
14085ceb5:     	movl	%r12d, 0x28(%r14)
14085ceb9:     	movb	$0x1, 0x30(%r14)
14085cebe:     	movl	%r12d, 0x2c(%r14)
14085cec2:     	movq	%rdi, 0x1628(%rbp)
14085cec9:     	movq	%r15, 0x1630(%rbp)
14085ced0:     	movq	$0x0, 0x1610(%rbp)
14085cedb:     	movq	$0x8, 0x1618(%rbp)
14085cee6:     	movq	$0x0, 0x1620(%rbp)
14085cef1:     	cmpq	$0x0, 0x90(%rsi)
14085cef9:     	je	0x14085cfab <.text+0x85bfab>
14085ceff:     	movabsq	$0x63c9024d237b8feb, %rcx # imm = 0x63C9024D237B8FEB
14085cf09:     	movq	0x78(%rsi), %rax
14085cf0d:     	movq	0x80(%rsi), %rdx
14085cf14:     	xorl	%r8d, %r8d
14085cf17:     	movdqa	0x50e7a61(%rip), %xmm0  # 0x145944980
14085cf1f:     	pcmpeqd	%xmm1, %xmm1
14085cf23:     	movdqa	0x519af55(%rip), %xmm2  # 0x1459f7e80
14085cf2b:     	andq	%rdx, %rcx
14085cf2e:     	movdqu	(%rax,%rcx), %xmm3
14085cf33:     	movdqa	%xmm3, %xmm4
14085cf37:     	pcmpeqb	%xmm0, %xmm4
14085cf3b:     	pmovmskb	%xmm4, %r9d
14085cf40:     	testl	%r9d, %r9d
14085cf43:     	je	0x14085cf90 <.text+0x85bf90>
14085cf45:     	tzcntl	%r9d, %r10d
14085cf4a:     	addq	%rcx, %r10
14085cf4d:     	andq	%rdx, %r10
14085cf50:     	negq	%r10
14085cf53:     	leaq	(%r10,%r10,2), %r10
14085cf57:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085cf5e:     	pcmpeqb	%xmm2, %xmm4
14085cf62:     	pmovmskb	%xmm4, %r11d
14085cf67:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085cf6e:     	je	0x14085d05f <.text+0x85c05f>
14085cf74:     	leal	-0x1(%r9), %r10d
14085cf78:     	andw	%r9w, %r10w
14085cf7c:     	movl	%r10d, %r9d
14085cf7f:     	jne	0x14085cf45 <.text+0x85bf45>
14085cf81:     	nopw	%cs:(%rax,%rax)
14085cf90:     	pcmpeqb	%xmm1, %xmm3
14085cf94:     	pmovmskb	%xmm3, %r9d
14085cf99:     	testl	%r9d, %r9d
14085cf9c:     	jne	0x14085cfab <.text+0x85bfab>
14085cf9e:     	addq	%r8, %rcx
14085cfa1:     	addq	$0x10, %rcx
14085cfa5:     	addq	$0x10, %r8
14085cfa9:     	jmp	0x14085cf2b <.text+0x85bf2b>
14085cfab:     	movzbl	0xa0(%rsi), %eax
14085cfb2:     	movq	0xe0(%rsi), %rax
14085cfb9:     	movq	0xe8(%rsi), %rcx
14085cfc0:     	movabsq	$0x63c9024d237b8feb, %rdx # imm = 0x63C9024D237B8FEB
14085cfca:     	xorl	%r8d, %r8d
14085cfcd:     	movdqa	0x50e79ab(%rip), %xmm0  # 0x145944980
14085cfd5:     	pcmpeqd	%xmm1, %xmm1
14085cfd9:     	movdqa	0x519ae9f(%rip), %xmm2  # 0x1459f7e80
14085cfe1:     	andq	%rcx, %rdx
14085cfe4:     	movdqu	(%rax,%rdx), %xmm3
14085cfe9:     	movdqa	%xmm3, %xmm4
14085cfed:     	pcmpeqb	%xmm0, %xmm4
14085cff1:     	pmovmskb	%xmm4, %r11d
14085cff6:     	testl	%r11d, %r11d
14085cff9:     	je	0x14085d040 <.text+0x85c040>
14085cffb:     	tzcntl	%r11d, %r10d
14085d000:     	addq	%rdx, %r10
14085d003:     	andq	%rcx, %r10
14085d006:     	movq	%r10, %r14
14085d009:     	shlq	$0x7, %r14
14085d00d:     	movq	%rax, %r9
14085d010:     	subq	%r14, %r9
14085d013:     	movdqu	-0x80(%r9), %xmm4
14085d019:     	pcmpeqb	%xmm2, %xmm4
14085d01d:     	pmovmskb	%xmm4, %r14d
14085d022:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085d029:     	je	0x14085d07c <.text+0x85c07c>
14085d02b:     	leal	-0x1(%r11), %r9d
14085d02f:     	andw	%r11w, %r9w
14085d033:     	movl	%r9d, %r11d
14085d036:     	jne	0x14085cffb <.text+0x85bffb>
14085d038:     	nopl	(%rax,%rax)
14085d040:     	pcmpeqb	%xmm1, %xmm3
14085d044:     	pmovmskb	%xmm3, %r9d
14085d049:     	testl	%r9d, %r9d
14085d04c:     	jne	0x14085d0ef <.text+0x85c0ef>
14085d052:     	addq	%r8, %rdx
14085d055:     	addq	$0x10, %rdx
14085d059:     	addq	$0x10, %r8
14085d05d:     	jmp	0x14085cfe1 <.text+0x85bfe1>
14085d05f:     	leaq	(%rax,%r10,8), %rax
14085d063:     	movq	-0x8(%rax), %r14
14085d067:     	movq	0x1610(%rbp), %rdx
14085d06e:     	testq	%rdx, %rdx
14085d071:     	jne	0x14085d18d <.text+0x85c18d>
14085d077:     	jmp	0x14085d1a3 <.text+0x85c1a3>
14085d07c:     	leaq	-0x10(%r10), %rdx
14085d080:     	andq	%rcx, %rdx
14085d083:     	movdqu	(%rax,%rdx), %xmm0
14085d088:     	pcmpeqd	%xmm1, %xmm1
14085d08c:     	pcmpeqb	%xmm1, %xmm0
14085d090:     	pmovmskb	%xmm0, %ecx
14085d094:     	movdqu	(%rax,%r10), %xmm0
14085d09a:     	pcmpeqb	%xmm1, %xmm0
14085d09e:     	pmovmskb	%xmm0, %r8d
14085d0a3:     	movw	$0x1f, %r11w
14085d0a8:     	bsrw	%cx, %r11w
14085d0ad:     	xorl	$0xf, %r11d
14085d0b1:     	orl	$0x10000, %r8d          # imm = 0x10000
14085d0b8:     	tzcntl	%r8d, %r8d
14085d0bd:     	addl	%r11d, %r8d
14085d0c0:     	movb	$-0x80, %cl
14085d0c2:     	cmpw	$0xf, %r8w
14085d0c7:     	ja	0x14085d0d2 <.text+0x85c0d2>
14085d0c9:     	incq	0xf0(%rsi)
14085d0d0:     	movb	$-0x1, %cl
14085d0d2:     	movb	%cl, (%rax,%r10)
14085d0d6:     	movb	%cl, 0x10(%rax,%rdx)
14085d0da:     	decq	0xf8(%rsi)
14085d0e1:     	movq	-0x70(%r9), %rax
14085d0e5:     	cmpq	$0x2, %rax
14085d0e9:     	jne	0x140860144 <.text+0x85f144>
14085d0ef:     	movq	(%r15), %r14
14085d0f2:     	leaq	0x1(%r14), %rax
14085d0f6:     	movq	%rax, (%r15)
14085d0f9:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085d102:     	movq	$0x1, 0x550(%rbp)
14085d10d:     	movdqu	0x519b1ab(%rip), %xmm0  # 0x1459f82c0
14085d115:     	movdqu	%xmm0, 0x558(%rbp)
14085d11d:     	movq	$0x8, 0x578(%rbp)
14085d128:     	movq	$0x130, 0x580(%rbp)     # imm = 0x130
14085d133:     	leaq	-0x35f05a(%rip), %rax   # 0x1404fe0e0 <.text+0x4fd0e0>
14085d13a:     	movq	%rax, 0x598(%rbp)
14085d141:     	movb	$0x1, 0x5a2(%rbp)
14085d148:     	movq	$0x0, 0x568(%rbp)
14085d153:     	movb	$0x2, 0x588(%rbp)
14085d15a:     	leaq	0x550(%rbp), %r8
14085d161:     	movq	%rdi, %rcx
14085d164:     	movq	%r14, %rdx
14085d167:     	callq	0x14004abc0 <.text+0x49bc0>
14085d16c:     	nop
14085d16d:     	leaq	0x78(%rsi), %rcx
14085d171:     	leaq	0x519b148(%rip), %rdx   # 0x1459f82c0
14085d178:     	movq	%r14, %r8
14085d17b:     	callq	0x14000e640 <.text+0xd640>
14085d180:     	nop
14085d181:     	movq	0x1610(%rbp), %rdx
14085d188:     	testq	%rdx, %rdx
14085d18b:     	je	0x14085d1a3 <.text+0x85c1a3>
14085d18d:     	movq	0x1618(%rbp), %rcx
14085d194:     	shlq	$0x3, %rdx
14085d198:     	movl	$0x8, %r8d
14085d19e:     	callq	0x1400021d0 <.text+0x11d0>
14085d1a3:     	cmpq	0x218(%rsi), %r14
14085d1aa:     	jae	0x14085d1d5 <.text+0x85c1d5>
14085d1ac:     	movq	0x210(%rsi), %rax
14085d1b3:     	movq	(%rax,%r14,8), %rax
14085d1b7:     	testq	%rax, %rax
14085d1ba:     	je	0x14085d1d5 <.text+0x85c1d5>
14085d1bc:     	movq	0x1e0(%rsi), %rcx
14085d1c3:     	notq	%rax
14085d1c6:     	imulq	$0x38, %rax, %rax
14085d1ca:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085d1cf:     	jne	0x14085d2bc <.text+0x85c2bc>
14085d1d5:     	movq	$0x0, 0x550(%rbp)
14085d1e0:     	movq	$0x8, 0x558(%rbp)
14085d1eb:     	pxor	%xmm0, %xmm0
14085d1ef:     	movdqu	%xmm0, 0x560(%rbp)
14085d1f7:     	movq	$0x8, 0x570(%rbp)
14085d202:     	movdqu	%xmm0, 0x578(%rbp)
14085d20a:     	movq	$0x8, 0x588(%rbp)
14085d215:     	movdqu	%xmm0, 0x590(%rbp)
14085d21d:     	movq	$0x8, 0x5a0(%rbp)
14085d228:     	movdqu	%xmm0, 0x5a8(%rbp)
14085d230:     	movl	$0x0, 0x5b8(%rbp)
14085d23a:     	movb	$0x2, 0x5c4(%rbp)
14085d241:     	movl	$0x0, 0x678(%rbp)
14085d24b:     	movw	$0x0, 0x67c(%rbp)
14085d254:     	movl	0x5b0(%rsi), %r12d
14085d25b:     	movq	%rsi, %rcx
14085d25e:     	callq	0x144e76860 <.text+0x4e75860>
14085d263:     	movq	%r14, 0x1610(%rbp)
14085d26a:     	leaq	0x1610(%rbp), %r9
14085d271:     	movq	%rbx, %rcx
14085d274:     	movq	%r14, %rdx
14085d277:     	movq	%rdi, %r8
14085d27a:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085d27f:     	movq	%rax, %r14
14085d282:     	cmpb	$0x1, 0x30(%rax)
14085d286:     	jne	0x14085d29b <.text+0x85c29b>
14085d288:     	leaq	0x550(%rbp), %r8
14085d28f:     	movq	%r14, %rcx
14085d292:     	xorl	%edx, %edx
14085d294:     	callq	0x144e617b0 <.text+0x4e607b0>
14085d299:     	jmp	0x14085d2b8 <.text+0x85c2b8>
14085d29b:     	movq	0x8(%r14), %r8
14085d29f:     	movq	0x10(%r14), %rcx
14085d2a3:     	leaq	0x550(%rbp), %rdx
14085d2aa:     	callq	0x145756dd1 <.text+0x5755dd1>
14085d2af:     	movl	%r12d, 0x28(%r14)
14085d2b3:     	movb	$0x1, 0x30(%r14)
14085d2b8:     	movl	%r12d, 0x2c(%r14)
14085d2bc:     	movq	%rdi, 0x1628(%rbp)
14085d2c3:     	movq	%r15, 0x1630(%rbp)
14085d2ca:     	movq	$0x0, 0x1610(%rbp)
14085d2d5:     	movq	$0x8, 0x1618(%rbp)
14085d2e0:     	movq	$0x0, 0x1620(%rbp)
14085d2eb:     	cmpq	$0x0, 0x90(%rsi)
14085d2f3:     	je	0x14085d39b <.text+0x85c39b>
14085d2f9:     	movabsq	$-0x3c3211b3a384a73f, %rcx # imm = 0xC3CDEE4C5C7B58C1
14085d303:     	movq	0x78(%rsi), %rax
14085d307:     	movq	0x80(%rsi), %rdx
14085d30e:     	xorl	%r8d, %r8d
14085d311:     	movdqa	0x50e7ca7(%rip), %xmm0  # 0x145944fc0
14085d319:     	pcmpeqd	%xmm1, %xmm1
14085d31d:     	movdqa	0x519ab6b(%rip), %xmm2  # 0x1459f7e90
14085d325:     	andq	%rdx, %rcx
14085d328:     	movdqu	(%rax,%rcx), %xmm3
14085d32d:     	movdqa	%xmm3, %xmm4
14085d331:     	pcmpeqb	%xmm0, %xmm4
14085d335:     	pmovmskb	%xmm4, %r9d
14085d33a:     	testl	%r9d, %r9d
14085d33d:     	je	0x14085d380 <.text+0x85c380>
14085d33f:     	tzcntl	%r9d, %r10d
14085d344:     	addq	%rcx, %r10
14085d347:     	andq	%rdx, %r10
14085d34a:     	negq	%r10
14085d34d:     	leaq	(%r10,%r10,2), %r10
14085d351:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085d358:     	pcmpeqb	%xmm2, %xmm4
14085d35c:     	pmovmskb	%xmm4, %r11d
14085d361:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085d368:     	je	0x14085d44f <.text+0x85c44f>
14085d36e:     	leal	-0x1(%r9), %r10d
14085d372:     	andw	%r9w, %r10w
14085d376:     	movl	%r10d, %r9d
14085d379:     	jne	0x14085d33f <.text+0x85c33f>
14085d37b:     	nopl	(%rax,%rax)
14085d380:     	pcmpeqb	%xmm1, %xmm3
14085d384:     	pmovmskb	%xmm3, %r9d
14085d389:     	testl	%r9d, %r9d
14085d38c:     	jne	0x14085d39b <.text+0x85c39b>
14085d38e:     	addq	%r8, %rcx
14085d391:     	addq	$0x10, %rcx
14085d395:     	addq	$0x10, %r8
14085d399:     	jmp	0x14085d325 <.text+0x85c325>
14085d39b:     	movzbl	0xa0(%rsi), %eax
14085d3a2:     	movq	0xe0(%rsi), %rax
14085d3a9:     	movq	0xe8(%rsi), %rcx
14085d3b0:     	movabsq	$-0x3c3211b3a384a73f, %rdx # imm = 0xC3CDEE4C5C7B58C1
14085d3ba:     	xorl	%r8d, %r8d
14085d3bd:     	movdqa	0x50e7bfb(%rip), %xmm0  # 0x145944fc0
14085d3c5:     	pcmpeqd	%xmm1, %xmm1
14085d3c9:     	movdqa	0x519aabf(%rip), %xmm2  # 0x1459f7e90
14085d3d1:     	andq	%rcx, %rdx
14085d3d4:     	movdqu	(%rax,%rdx), %xmm3
14085d3d9:     	movdqa	%xmm3, %xmm4
14085d3dd:     	pcmpeqb	%xmm0, %xmm4
14085d3e1:     	pmovmskb	%xmm4, %r11d
14085d3e6:     	testl	%r11d, %r11d
14085d3e9:     	je	0x14085d430 <.text+0x85c430>
14085d3eb:     	tzcntl	%r11d, %r10d
14085d3f0:     	addq	%rdx, %r10
14085d3f3:     	andq	%rcx, %r10
14085d3f6:     	movq	%r10, %r14
14085d3f9:     	shlq	$0x7, %r14
14085d3fd:     	movq	%rax, %r9
14085d400:     	subq	%r14, %r9
14085d403:     	movdqu	-0x80(%r9), %xmm4
14085d409:     	pcmpeqb	%xmm2, %xmm4
14085d40d:     	pmovmskb	%xmm4, %r14d
14085d412:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085d419:     	je	0x14085d46c <.text+0x85c46c>
14085d41b:     	leal	-0x1(%r11), %r9d
14085d41f:     	andw	%r11w, %r9w
14085d423:     	movl	%r9d, %r11d
14085d426:     	jne	0x14085d3eb <.text+0x85c3eb>
14085d428:     	nopl	(%rax,%rax)
14085d430:     	pcmpeqb	%xmm1, %xmm3
14085d434:     	pmovmskb	%xmm3, %r9d
14085d439:     	testl	%r9d, %r9d
14085d43c:     	jne	0x14085d4df <.text+0x85c4df>
14085d442:     	addq	%r8, %rdx
14085d445:     	addq	$0x10, %rdx
14085d449:     	addq	$0x10, %r8
14085d44d:     	jmp	0x14085d3d1 <.text+0x85c3d1>
14085d44f:     	leaq	(%rax,%r10,8), %rax
14085d453:     	movq	-0x8(%rax), %r14
14085d457:     	movq	0x1610(%rbp), %rdx
14085d45e:     	testq	%rdx, %rdx
14085d461:     	jne	0x14085d57d <.text+0x85c57d>
14085d467:     	jmp	0x14085d593 <.text+0x85c593>
14085d46c:     	leaq	-0x10(%r10), %rdx
14085d470:     	andq	%rcx, %rdx
14085d473:     	movdqu	(%rax,%rdx), %xmm0
14085d478:     	pcmpeqd	%xmm1, %xmm1
14085d47c:     	pcmpeqb	%xmm1, %xmm0
14085d480:     	pmovmskb	%xmm0, %ecx
14085d484:     	movdqu	(%rax,%r10), %xmm0
14085d48a:     	pcmpeqb	%xmm1, %xmm0
14085d48e:     	pmovmskb	%xmm0, %r8d
14085d493:     	movw	$0x1f, %r11w
14085d498:     	bsrw	%cx, %r11w
14085d49d:     	xorl	$0xf, %r11d
14085d4a1:     	orl	$0x10000, %r8d          # imm = 0x10000
14085d4a8:     	tzcntl	%r8d, %r8d
14085d4ad:     	addl	%r11d, %r8d
14085d4b0:     	movb	$-0x80, %cl
14085d4b2:     	cmpw	$0xf, %r8w
14085d4b7:     	ja	0x14085d4c2 <.text+0x85c4c2>
14085d4b9:     	incq	0xf0(%rsi)
14085d4c0:     	movb	$-0x1, %cl
14085d4c2:     	movb	%cl, (%rax,%r10)
14085d4c6:     	movb	%cl, 0x10(%rax,%rdx)
14085d4ca:     	decq	0xf8(%rsi)
14085d4d1:     	movq	-0x70(%r9), %rax
14085d4d5:     	cmpq	$0x2, %rax
14085d4d9:     	jne	0x1408601d2 <.text+0x85f1d2>
14085d4df:     	movq	(%r15), %r14
14085d4e2:     	leaq	0x1(%r14), %rax
14085d4e6:     	movq	%rax, (%r15)
14085d4e9:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085d4f2:     	movq	$0x1, 0x550(%rbp)
14085d4fd:     	movdqu	0x519ad9b(%rip), %xmm0  # 0x1459f82a0
14085d505:     	movdqu	%xmm0, 0x558(%rbp)
14085d50d:     	movq	$0x8, 0x578(%rbp)
14085d518:     	movq	$0x58, 0x580(%rbp)
14085d523:     	leaq	-0x35f7aa(%rip), %rax   # 0x1404fdd80 <.text+0x4fcd80>
14085d52a:     	movq	%rax, 0x598(%rbp)
14085d531:     	movb	$0x1, 0x5a2(%rbp)
14085d538:     	movq	$0x0, 0x568(%rbp)
14085d543:     	movb	$0x2, 0x588(%rbp)
14085d54a:     	leaq	0x550(%rbp), %r8
14085d551:     	movq	%rdi, %rcx
14085d554:     	movq	%r14, %rdx
14085d557:     	callq	0x14004abc0 <.text+0x49bc0>
14085d55c:     	nop
14085d55d:     	leaq	0x78(%rsi), %rcx
14085d561:     	leaq	0x519ad38(%rip), %rdx   # 0x1459f82a0
14085d568:     	movq	%r14, %r8
14085d56b:     	callq	0x14000e640 <.text+0xd640>
14085d570:     	nop
14085d571:     	movq	0x1610(%rbp), %rdx
14085d578:     	testq	%rdx, %rdx
14085d57b:     	je	0x14085d593 <.text+0x85c593>
14085d57d:     	movq	0x1618(%rbp), %rcx
14085d584:     	shlq	$0x3, %rdx
14085d588:     	movl	$0x8, %r8d
14085d58e:     	callq	0x1400021d0 <.text+0x11d0>
14085d593:     	cmpq	0x218(%rsi), %r14
14085d59a:     	jae	0x14085d5c5 <.text+0x85c5c5>
14085d59c:     	movq	0x210(%rsi), %rax
14085d5a3:     	movq	(%rax,%r14,8), %rax
14085d5a7:     	testq	%rax, %rax
14085d5aa:     	je	0x14085d5c5 <.text+0x85c5c5>
14085d5ac:     	movq	0x1e0(%rsi), %rcx
14085d5b3:     	notq	%rax
14085d5b6:     	imulq	$0x38, %rax, %rax
14085d5ba:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085d5bf:     	jne	0x14085d680 <.text+0x85c680>
14085d5c5:     	pxor	%xmm0, %xmm0
14085d5c9:     	movdqu	%xmm0, 0x560(%rbp)
14085d5d1:     	movdqu	%xmm0, 0x578(%rbp)
14085d5d9:     	movdqu	%xmm0, 0x590(%rbp)
14085d5e1:     	movq	$0x0, 0x550(%rbp)
14085d5ec:     	movq	$0x8, 0x558(%rbp)
14085d5f7:     	movq	$0x8, 0x570(%rbp)
14085d602:     	movq	$0x8, 0x588(%rbp)
14085d60d:     	movq	$0x0, 0x5a0(%rbp)
14085d618:     	movl	0x5b0(%rsi), %r12d
14085d61f:     	movq	%rsi, %rcx
14085d622:     	callq	0x144e76860 <.text+0x4e75860>
14085d627:     	movq	%r14, 0x1610(%rbp)
14085d62e:     	leaq	0x1610(%rbp), %r9
14085d635:     	movq	%rbx, %rcx
14085d638:     	movq	%r14, %rdx
14085d63b:     	movq	%rdi, %r8
14085d63e:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085d643:     	movq	%rax, %r14
14085d646:     	cmpb	$0x1, 0x30(%rax)
14085d64a:     	jne	0x14085d65f <.text+0x85c65f>
14085d64c:     	leaq	0x550(%rbp), %r8
14085d653:     	movq	%r14, %rcx
14085d656:     	xorl	%edx, %edx
14085d658:     	callq	0x144e617b0 <.text+0x4e607b0>
14085d65d:     	jmp	0x14085d67c <.text+0x85c67c>
14085d65f:     	movq	0x8(%r14), %r8
14085d663:     	movq	0x10(%r14), %rcx
14085d667:     	leaq	0x550(%rbp), %rdx
14085d66e:     	callq	0x145756dd1 <.text+0x5755dd1>
14085d673:     	movl	%r12d, 0x28(%r14)
14085d677:     	movb	$0x1, 0x30(%r14)
14085d67c:     	movl	%r12d, 0x2c(%r14)
14085d680:     	movq	%rdi, 0x1628(%rbp)
14085d687:     	movq	%r15, 0x1630(%rbp)
14085d68e:     	movq	$0x0, 0x1610(%rbp)
14085d699:     	movq	$0x8, 0x1618(%rbp)
14085d6a4:     	movq	$0x0, 0x1620(%rbp)
14085d6af:     	cmpq	$0x0, 0x90(%rsi)
14085d6b7:     	je	0x14085d75b <.text+0x85c75b>
14085d6bd:     	movabsq	$-0xfd7d3e21a93a4e1, %rcx # imm = 0xF0282C1DE56C5B1F
14085d6c7:     	movq	0x78(%rsi), %rax
14085d6cb:     	movq	0x80(%rsi), %rdx
14085d6d2:     	xorl	%r8d, %r8d
14085d6d5:     	movdqa	0x50d66e3(%rip), %xmm0  # 0x145933dc0
14085d6dd:     	pcmpeqd	%xmm1, %xmm1
14085d6e1:     	movdqa	0x519a7b7(%rip), %xmm2  # 0x1459f7ea0
14085d6e9:     	andq	%rdx, %rcx
14085d6ec:     	movdqu	(%rax,%rcx), %xmm3
14085d6f1:     	movdqa	%xmm3, %xmm4
14085d6f5:     	pcmpeqb	%xmm0, %xmm4
14085d6f9:     	pmovmskb	%xmm4, %r9d
14085d6fe:     	testl	%r9d, %r9d
14085d701:     	je	0x14085d740 <.text+0x85c740>
14085d703:     	tzcntl	%r9d, %r10d
14085d708:     	addq	%rcx, %r10
14085d70b:     	andq	%rdx, %r10
14085d70e:     	negq	%r10
14085d711:     	leaq	(%r10,%r10,2), %r10
14085d715:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085d71c:     	pcmpeqb	%xmm2, %xmm4
14085d720:     	pmovmskb	%xmm4, %r11d
14085d725:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085d72c:     	je	0x14085d80f <.text+0x85c80f>
14085d732:     	leal	-0x1(%r9), %r10d
14085d736:     	andw	%r9w, %r10w
14085d73a:     	movl	%r10d, %r9d
14085d73d:     	jne	0x14085d703 <.text+0x85c703>
14085d73f:     	nop
14085d740:     	pcmpeqb	%xmm1, %xmm3
14085d744:     	pmovmskb	%xmm3, %r9d
14085d749:     	testl	%r9d, %r9d
14085d74c:     	jne	0x14085d75b <.text+0x85c75b>
14085d74e:     	addq	%r8, %rcx
14085d751:     	addq	$0x10, %rcx
14085d755:     	addq	$0x10, %r8
14085d759:     	jmp	0x14085d6e9 <.text+0x85c6e9>
14085d75b:     	movzbl	0xa0(%rsi), %eax
14085d762:     	movq	0xe0(%rsi), %rax
14085d769:     	movq	0xe8(%rsi), %rcx
14085d770:     	movabsq	$-0xfd7d3e21a93a4e1, %rdx # imm = 0xF0282C1DE56C5B1F
14085d77a:     	xorl	%r8d, %r8d
14085d77d:     	movdqa	0x50d663b(%rip), %xmm0  # 0x145933dc0
14085d785:     	pcmpeqd	%xmm1, %xmm1
14085d789:     	movdqa	0x519a70f(%rip), %xmm2  # 0x1459f7ea0
14085d791:     	andq	%rcx, %rdx
14085d794:     	movdqu	(%rax,%rdx), %xmm3
14085d799:     	movdqa	%xmm3, %xmm4
14085d79d:     	pcmpeqb	%xmm0, %xmm4
14085d7a1:     	pmovmskb	%xmm4, %r11d
14085d7a6:     	testl	%r11d, %r11d
14085d7a9:     	je	0x14085d7f0 <.text+0x85c7f0>
14085d7ab:     	tzcntl	%r11d, %r10d
14085d7b0:     	addq	%rdx, %r10
14085d7b3:     	andq	%rcx, %r10
14085d7b6:     	movq	%r10, %r14
14085d7b9:     	shlq	$0x7, %r14
14085d7bd:     	movq	%rax, %r9
14085d7c0:     	subq	%r14, %r9
14085d7c3:     	movdqu	-0x80(%r9), %xmm4
14085d7c9:     	pcmpeqb	%xmm2, %xmm4
14085d7cd:     	pmovmskb	%xmm4, %r14d
14085d7d2:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085d7d9:     	je	0x14085d82c <.text+0x85c82c>
14085d7db:     	leal	-0x1(%r11), %r9d
14085d7df:     	andw	%r11w, %r9w
14085d7e3:     	movl	%r9d, %r11d
14085d7e6:     	jne	0x14085d7ab <.text+0x85c7ab>
14085d7e8:     	nopl	(%rax,%rax)
14085d7f0:     	pcmpeqb	%xmm1, %xmm3
14085d7f4:     	pmovmskb	%xmm3, %r9d
14085d7f9:     	testl	%r9d, %r9d
14085d7fc:     	jne	0x14085d89f <.text+0x85c89f>
14085d802:     	addq	%r8, %rdx
14085d805:     	addq	$0x10, %rdx
14085d809:     	addq	$0x10, %r8
14085d80d:     	jmp	0x14085d791 <.text+0x85c791>
14085d80f:     	leaq	(%rax,%r10,8), %rax
14085d813:     	movq	-0x8(%rax), %r14
14085d817:     	movq	0x1610(%rbp), %rdx
14085d81e:     	testq	%rdx, %rdx
14085d821:     	jne	0x14085d93a <.text+0x85c93a>
14085d827:     	jmp	0x14085d950 <.text+0x85c950>
14085d82c:     	leaq	-0x10(%r10), %rdx
14085d830:     	andq	%rcx, %rdx
14085d833:     	movdqu	(%rax,%rdx), %xmm0
14085d838:     	pcmpeqd	%xmm1, %xmm1
14085d83c:     	pcmpeqb	%xmm1, %xmm0
14085d840:     	pmovmskb	%xmm0, %ecx
14085d844:     	movdqu	(%rax,%r10), %xmm0
14085d84a:     	pcmpeqb	%xmm1, %xmm0
14085d84e:     	pmovmskb	%xmm0, %r8d
14085d853:     	movw	$0x1f, %r11w
14085d858:     	bsrw	%cx, %r11w
14085d85d:     	xorl	$0xf, %r11d
14085d861:     	orl	$0x10000, %r8d          # imm = 0x10000
14085d868:     	tzcntl	%r8d, %r8d
14085d86d:     	addl	%r11d, %r8d
14085d870:     	movb	$-0x80, %cl
14085d872:     	cmpw	$0xf, %r8w
14085d877:     	ja	0x14085d882 <.text+0x85c882>
14085d879:     	incq	0xf0(%rsi)
14085d880:     	movb	$-0x1, %cl
14085d882:     	movb	%cl, (%rax,%r10)
14085d886:     	movb	%cl, 0x10(%rax,%rdx)
14085d88a:     	decq	0xf8(%rsi)
14085d891:     	movq	-0x70(%r9), %rax
14085d895:     	cmpq	$0x2, %rax
14085d899:     	jne	0x140860260 <.text+0x85f260>
14085d89f:     	movq	(%r15), %r14
14085d8a2:     	leaq	0x1(%r14), %rax
14085d8a6:     	movq	%rax, (%r15)
14085d8a9:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085d8b2:     	movq	$0x1, 0x550(%rbp)
14085d8bd:     	movdqu	0x519aa2b(%rip), %xmm0  # 0x1459f82f0
14085d8c5:     	movdqu	%xmm0, 0x558(%rbp)
14085d8cd:     	movq	$0x4, 0x578(%rbp)
14085d8d8:     	movq	$0xc0, 0x580(%rbp)
14085d8e3:     	movq	$0x0, 0x598(%rbp)
14085d8ee:     	movb	$0x1, 0x5a2(%rbp)
14085d8f5:     	movq	$0x0, 0x568(%rbp)
14085d900:     	movb	$0x2, 0x588(%rbp)
14085d907:     	leaq	0x550(%rbp), %r8
14085d90e:     	movq	%rdi, %rcx
14085d911:     	movq	%r14, %rdx
14085d914:     	callq	0x14004abc0 <.text+0x49bc0>
14085d919:     	nop
14085d91a:     	leaq	0x78(%rsi), %rcx
14085d91e:     	leaq	0x519a9cb(%rip), %rdx   # 0x1459f82f0
14085d925:     	movq	%r14, %r8
14085d928:     	callq	0x14000e640 <.text+0xd640>
14085d92d:     	nop
14085d92e:     	movq	0x1610(%rbp), %rdx
14085d935:     	testq	%rdx, %rdx
14085d938:     	je	0x14085d950 <.text+0x85c950>
14085d93a:     	movq	0x1618(%rbp), %rcx
14085d941:     	shlq	$0x3, %rdx
14085d945:     	movl	$0x8, %r8d
14085d94b:     	callq	0x1400021d0 <.text+0x11d0>
14085d950:     	cmpq	0x218(%rsi), %r14
14085d957:     	jae	0x14085d97e <.text+0x85c97e>
14085d959:     	movq	0x210(%rsi), %rax
14085d960:     	movq	(%rax,%r14,8), %rax
14085d964:     	testq	%rax, %rax
14085d967:     	je	0x14085d97e <.text+0x85c97e>
14085d969:     	movq	0x1e0(%rsi), %rcx
14085d970:     	notq	%rax
14085d973:     	imulq	$0x38, %rax, %rax
14085d977:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085d97c:     	jne	0x14085d9fa <.text+0x85c9fa>
14085d97e:     	movl	$0x2, 0x550(%rbp)
14085d988:     	movl	$0x3f1c28f6, 0x60c(%rbp) # imm = 0x3F1C28F6
14085d992:     	movl	0x5b0(%rsi), %r12d
14085d999:     	movq	%rsi, %rcx
14085d99c:     	callq	0x144e76860 <.text+0x4e75860>
14085d9a1:     	movq	%r14, 0x1610(%rbp)
14085d9a8:     	leaq	0x1610(%rbp), %r9
14085d9af:     	movq	%rbx, %rcx
14085d9b2:     	movq	%r14, %rdx
14085d9b5:     	movq	%rdi, %r8
14085d9b8:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085d9bd:     	movq	%rax, %r14
14085d9c0:     	cmpb	$0x1, 0x30(%rax)
14085d9c4:     	jne	0x14085d9d9 <.text+0x85c9d9>
14085d9c6:     	leaq	0x550(%rbp), %r8
14085d9cd:     	movq	%r14, %rcx
14085d9d0:     	xorl	%edx, %edx
14085d9d2:     	callq	0x144e617b0 <.text+0x4e607b0>
14085d9d7:     	jmp	0x14085d9f6 <.text+0x85c9f6>
14085d9d9:     	movq	0x8(%r14), %r8
14085d9dd:     	movq	0x10(%r14), %rcx
14085d9e1:     	leaq	0x550(%rbp), %rdx
14085d9e8:     	callq	0x145756dd1 <.text+0x5755dd1>
14085d9ed:     	movl	%r12d, 0x28(%r14)
14085d9f1:     	movb	$0x1, 0x30(%r14)
14085d9f6:     	movl	%r12d, 0x2c(%r14)
14085d9fa:     	movq	%rdi, 0x1628(%rbp)
14085da01:     	movq	%r15, 0x1630(%rbp)
14085da08:     	movq	$0x0, 0x1610(%rbp)
14085da13:     	movq	$0x8, 0x1618(%rbp)
14085da1e:     	movq	$0x0, 0x1620(%rbp)
14085da29:     	cmpq	$0x0, 0x90(%rsi)
14085da31:     	je	0x14085dadb <.text+0x85cadb>
14085da37:     	movabsq	$0x662d21a94934ad62, %rcx # imm = 0x662D21A94934AD62
14085da41:     	movq	0x78(%rsi), %rax
14085da45:     	movq	0x80(%rsi), %rdx
14085da4c:     	xorl	%r8d, %r8d
14085da4f:     	movdqa	0x50e7549(%rip), %xmm0  # 0x145944fa0
14085da57:     	pcmpeqd	%xmm1, %xmm1
14085da5b:     	movdqa	0x519a44d(%rip), %xmm2  # 0x1459f7eb0
14085da63:     	andq	%rdx, %rcx
14085da66:     	movdqu	(%rax,%rcx), %xmm3
14085da6b:     	movdqa	%xmm3, %xmm4
14085da6f:     	pcmpeqb	%xmm0, %xmm4
14085da73:     	pmovmskb	%xmm4, %r9d
14085da78:     	testl	%r9d, %r9d
14085da7b:     	je	0x14085dac0 <.text+0x85cac0>
14085da7d:     	tzcntl	%r9d, %r10d
14085da82:     	addq	%rcx, %r10
14085da85:     	andq	%rdx, %r10
14085da88:     	negq	%r10
14085da8b:     	leaq	(%r10,%r10,2), %r10
14085da8f:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085da96:     	pcmpeqb	%xmm2, %xmm4
14085da9a:     	pmovmskb	%xmm4, %r11d
14085da9f:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085daa6:     	je	0x14085db8f <.text+0x85cb8f>
14085daac:     	leal	-0x1(%r9), %r10d
14085dab0:     	andw	%r9w, %r10w
14085dab4:     	movl	%r10d, %r9d
14085dab7:     	jne	0x14085da7d <.text+0x85ca7d>
14085dab9:     	nopl	(%rax)
14085dac0:     	pcmpeqb	%xmm1, %xmm3
14085dac4:     	pmovmskb	%xmm3, %r9d
14085dac9:     	testl	%r9d, %r9d
14085dacc:     	jne	0x14085dadb <.text+0x85cadb>
14085dace:     	addq	%r8, %rcx
14085dad1:     	addq	$0x10, %rcx
14085dad5:     	addq	$0x10, %r8
14085dad9:     	jmp	0x14085da63 <.text+0x85ca63>
14085dadb:     	movzbl	0xa0(%rsi), %eax
14085dae2:     	movq	0xe0(%rsi), %rax
14085dae9:     	movq	0xe8(%rsi), %rcx
14085daf0:     	movabsq	$0x662d21a94934ad62, %rdx # imm = 0x662D21A94934AD62
14085dafa:     	xorl	%r8d, %r8d
14085dafd:     	movdqa	0x50e749b(%rip), %xmm0  # 0x145944fa0
14085db05:     	pcmpeqd	%xmm1, %xmm1
14085db09:     	movdqa	0x519a39f(%rip), %xmm2  # 0x1459f7eb0
14085db11:     	andq	%rcx, %rdx
14085db14:     	movdqu	(%rax,%rdx), %xmm3
14085db19:     	movdqa	%xmm3, %xmm4
14085db1d:     	pcmpeqb	%xmm0, %xmm4
14085db21:     	pmovmskb	%xmm4, %r11d
14085db26:     	testl	%r11d, %r11d
14085db29:     	je	0x14085db70 <.text+0x85cb70>
14085db2b:     	tzcntl	%r11d, %r10d
14085db30:     	addq	%rdx, %r10
14085db33:     	andq	%rcx, %r10
14085db36:     	movq	%r10, %r14
14085db39:     	shlq	$0x7, %r14
14085db3d:     	movq	%rax, %r9
14085db40:     	subq	%r14, %r9
14085db43:     	movdqu	-0x80(%r9), %xmm4
14085db49:     	pcmpeqb	%xmm2, %xmm4
14085db4d:     	pmovmskb	%xmm4, %r14d
14085db52:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085db59:     	je	0x14085dbac <.text+0x85cbac>
14085db5b:     	leal	-0x1(%r11), %r9d
14085db5f:     	andw	%r11w, %r9w
14085db63:     	movl	%r9d, %r11d
14085db66:     	jne	0x14085db2b <.text+0x85cb2b>
14085db68:     	nopl	(%rax,%rax)
14085db70:     	pcmpeqb	%xmm1, %xmm3
14085db74:     	pmovmskb	%xmm3, %r9d
14085db79:     	testl	%r9d, %r9d
14085db7c:     	jne	0x14085dc1f <.text+0x85cc1f>
14085db82:     	addq	%r8, %rdx
14085db85:     	addq	$0x10, %rdx
14085db89:     	addq	$0x10, %r8
14085db8d:     	jmp	0x14085db11 <.text+0x85cb11>
14085db8f:     	leaq	(%rax,%r10,8), %rax
14085db93:     	movq	-0x8(%rax), %r14
14085db97:     	movq	0x1610(%rbp), %rdx
14085db9e:     	testq	%rdx, %rdx
14085dba1:     	jne	0x14085dcbd <.text+0x85ccbd>
14085dba7:     	jmp	0x14085dcd3 <.text+0x85ccd3>
14085dbac:     	leaq	-0x10(%r10), %rdx
14085dbb0:     	andq	%rcx, %rdx
14085dbb3:     	movdqu	(%rax,%rdx), %xmm0
14085dbb8:     	pcmpeqd	%xmm1, %xmm1
14085dbbc:     	pcmpeqb	%xmm1, %xmm0
14085dbc0:     	pmovmskb	%xmm0, %ecx
14085dbc4:     	movdqu	(%rax,%r10), %xmm0
14085dbca:     	pcmpeqb	%xmm1, %xmm0
14085dbce:     	pmovmskb	%xmm0, %r8d
14085dbd3:     	movw	$0x1f, %r11w
14085dbd8:     	bsrw	%cx, %r11w
14085dbdd:     	xorl	$0xf, %r11d
14085dbe1:     	orl	$0x10000, %r8d          # imm = 0x10000
14085dbe8:     	tzcntl	%r8d, %r8d
14085dbed:     	addl	%r11d, %r8d
14085dbf0:     	movb	$-0x80, %cl
14085dbf2:     	cmpw	$0xf, %r8w
14085dbf7:     	ja	0x14085dc02 <.text+0x85cc02>
14085dbf9:     	incq	0xf0(%rsi)
14085dc00:     	movb	$-0x1, %cl
14085dc02:     	movb	%cl, (%rax,%r10)
14085dc06:     	movb	%cl, 0x10(%rax,%rdx)
14085dc0a:     	decq	0xf8(%rsi)
14085dc11:     	movq	-0x70(%r9), %rax
14085dc15:     	cmpq	$0x2, %rax
14085dc19:     	jne	0x1408602ee <.text+0x85f2ee>
14085dc1f:     	movq	(%r15), %r14
14085dc22:     	leaq	0x1(%r14), %rax
14085dc26:     	movq	%rax, (%r15)
14085dc29:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085dc32:     	movq	$0x1, 0x550(%rbp)
14085dc3d:     	movdqu	0x519a69b(%rip), %xmm0  # 0x1459f82e0
14085dc45:     	movdqu	%xmm0, 0x558(%rbp)
14085dc4d:     	movq	$0x8, 0x578(%rbp)
14085dc58:     	movq	$0x130, 0x580(%rbp)     # imm = 0x130
14085dc63:     	leaq	-0x35fb8a(%rip), %rax   # 0x1404fe0e0 <.text+0x4fd0e0>
14085dc6a:     	movq	%rax, 0x598(%rbp)
14085dc71:     	movb	$0x1, 0x5a2(%rbp)
14085dc78:     	movq	$0x0, 0x568(%rbp)
14085dc83:     	movb	$0x2, 0x588(%rbp)
14085dc8a:     	leaq	0x550(%rbp), %r8
14085dc91:     	movq	%rdi, %rcx
14085dc94:     	movq	%r14, %rdx
14085dc97:     	callq	0x14004abc0 <.text+0x49bc0>
14085dc9c:     	nop
14085dc9d:     	leaq	0x78(%rsi), %rcx
14085dca1:     	leaq	0x519a638(%rip), %rdx   # 0x1459f82e0
14085dca8:     	movq	%r14, %r8
14085dcab:     	callq	0x14000e640 <.text+0xd640>
14085dcb0:     	nop
14085dcb1:     	movq	0x1610(%rbp), %rdx
14085dcb8:     	testq	%rdx, %rdx
14085dcbb:     	je	0x14085dcd3 <.text+0x85ccd3>
14085dcbd:     	movq	0x1618(%rbp), %rcx
14085dcc4:     	shlq	$0x3, %rdx
14085dcc8:     	movl	$0x8, %r8d
14085dcce:     	callq	0x1400021d0 <.text+0x11d0>
14085dcd3:     	cmpq	0x218(%rsi), %r14
14085dcda:     	jae	0x14085dd05 <.text+0x85cd05>
14085dcdc:     	movq	0x210(%rsi), %rax
14085dce3:     	movq	(%rax,%r14,8), %rax
14085dce7:     	testq	%rax, %rax
14085dcea:     	je	0x14085dd05 <.text+0x85cd05>
14085dcec:     	movq	0x1e0(%rsi), %rcx
14085dcf3:     	notq	%rax
14085dcf6:     	imulq	$0x38, %rax, %rax
14085dcfa:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085dcff:     	jne	0x14085dde5 <.text+0x85cde5>
14085dd05:     	movq	$0x0, 0x550(%rbp)
14085dd10:     	movq	$0x8, 0x558(%rbp)
14085dd1b:     	pxor	%xmm0, %xmm0
14085dd1f:     	movdqu	%xmm0, 0x560(%rbp)
14085dd27:     	movq	$0x8, 0x570(%rbp)
14085dd32:     	movdqu	%xmm0, 0x578(%rbp)
14085dd3a:     	movq	$0x8, 0x588(%rbp)
14085dd45:     	movdqu	%xmm0, 0x590(%rbp)
14085dd4d:     	movq	$0x8, 0x5a0(%rbp)
14085dd58:     	movdqu	%xmm0, 0x5a8(%rbp)
14085dd60:     	movl	$0x2, 0x5b8(%rbp)
14085dd6a:     	movl	$0x0, 0x674(%rbp)
14085dd74:     	movw	$0x0, 0x678(%rbp)
14085dd7d:     	movl	0x5b0(%rsi), %r12d
14085dd84:     	movq	%rsi, %rcx
14085dd87:     	callq	0x144e76860 <.text+0x4e75860>
14085dd8c:     	movq	%r14, 0x1610(%rbp)
14085dd93:     	leaq	0x1610(%rbp), %r9
14085dd9a:     	movq	%rbx, %rcx
14085dd9d:     	movq	%r14, %rdx
14085dda0:     	movq	%rdi, %r8
14085dda3:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085dda8:     	movq	%rax, %r14
14085ddab:     	cmpb	$0x1, 0x30(%rax)
14085ddaf:     	jne	0x14085ddc4 <.text+0x85cdc4>
14085ddb1:     	leaq	0x550(%rbp), %r8
14085ddb8:     	movq	%r14, %rcx
14085ddbb:     	xorl	%edx, %edx
14085ddbd:     	callq	0x144e617b0 <.text+0x4e607b0>
14085ddc2:     	jmp	0x14085dde1 <.text+0x85cde1>
14085ddc4:     	movq	0x8(%r14), %r8
14085ddc8:     	movq	0x10(%r14), %rcx
14085ddcc:     	leaq	0x550(%rbp), %rdx
14085ddd3:     	callq	0x145756dd1 <.text+0x5755dd1>
14085ddd8:     	movl	%r12d, 0x28(%r14)
14085dddc:     	movb	$0x1, 0x30(%r14)
14085dde1:     	movl	%r12d, 0x2c(%r14)
14085dde5:     	movq	%rdi, 0x1628(%rbp)
14085ddec:     	movq	%r15, 0x1630(%rbp)
14085ddf3:     	movq	$0x0, 0x1610(%rbp)
14085ddfe:     	movq	$0x8, 0x1618(%rbp)
14085de09:     	movq	$0x0, 0x1620(%rbp)
14085de14:     	cmpq	$0x0, 0x90(%rsi)
14085de1c:     	je	0x14085decb <.text+0x85cecb>
14085de22:     	movabsq	$-0xeb75a3fe1fb42d4, %rcx # imm = 0xF148A5C01E04BD2C
14085de2c:     	movq	0x78(%rsi), %rax
14085de30:     	movq	0x80(%rsi), %rdx
14085de37:     	xorl	%r8d, %r8d
14085de3a:     	movdqa	0x50d5f7e(%rip), %xmm0  # 0x145933dc0
14085de42:     	pcmpeqd	%xmm1, %xmm1
14085de46:     	movdqa	0x519a072(%rip), %xmm2  # 0x1459f7ec0
14085de4e:     	andq	%rdx, %rcx
14085de51:     	movdqu	(%rax,%rcx), %xmm3
14085de56:     	movdqa	%xmm3, %xmm4
14085de5a:     	pcmpeqb	%xmm0, %xmm4
14085de5e:     	pmovmskb	%xmm4, %r9d
14085de63:     	testl	%r9d, %r9d
14085de66:     	je	0x14085deb0 <.text+0x85ceb0>
14085de68:     	tzcntl	%r9d, %r10d
14085de6d:     	addq	%rcx, %r10
14085de70:     	andq	%rdx, %r10
14085de73:     	negq	%r10
14085de76:     	leaq	(%r10,%r10,2), %r10
14085de7a:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085de81:     	pcmpeqb	%xmm2, %xmm4
14085de85:     	pmovmskb	%xmm4, %r11d
14085de8a:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085de91:     	je	0x14085df7f <.text+0x85cf7f>
14085de97:     	leal	-0x1(%r9), %r10d
14085de9b:     	andw	%r9w, %r10w
14085de9f:     	movl	%r10d, %r9d
14085dea2:     	jne	0x14085de68 <.text+0x85ce68>
14085dea4:     	nopw	%cs:(%rax,%rax)
14085deb0:     	pcmpeqb	%xmm1, %xmm3
14085deb4:     	pmovmskb	%xmm3, %r9d
14085deb9:     	testl	%r9d, %r9d
14085debc:     	jne	0x14085decb <.text+0x85cecb>
14085debe:     	addq	%r8, %rcx
14085dec1:     	addq	$0x10, %rcx
14085dec5:     	addq	$0x10, %r8
14085dec9:     	jmp	0x14085de4e <.text+0x85ce4e>
14085decb:     	movzbl	0xa0(%rsi), %eax
14085ded2:     	movq	0xe0(%rsi), %rax
14085ded9:     	movq	0xe8(%rsi), %rcx
14085dee0:     	movabsq	$-0xeb75a3fe1fb42d4, %rdx # imm = 0xF148A5C01E04BD2C
14085deea:     	xorl	%r8d, %r8d
14085deed:     	movdqa	0x50d5ecb(%rip), %xmm0  # 0x145933dc0
14085def5:     	pcmpeqd	%xmm1, %xmm1
14085def9:     	movdqa	0x5199fbf(%rip), %xmm2  # 0x1459f7ec0
14085df01:     	andq	%rcx, %rdx
14085df04:     	movdqu	(%rax,%rdx), %xmm3
14085df09:     	movdqa	%xmm3, %xmm4
14085df0d:     	pcmpeqb	%xmm0, %xmm4
14085df11:     	pmovmskb	%xmm4, %r11d
14085df16:     	testl	%r11d, %r11d
14085df19:     	je	0x14085df60 <.text+0x85cf60>
14085df1b:     	tzcntl	%r11d, %r10d
14085df20:     	addq	%rdx, %r10
14085df23:     	andq	%rcx, %r10
14085df26:     	movq	%r10, %r14
14085df29:     	shlq	$0x7, %r14
14085df2d:     	movq	%rax, %r9
14085df30:     	subq	%r14, %r9
14085df33:     	movdqu	-0x80(%r9), %xmm4
14085df39:     	pcmpeqb	%xmm2, %xmm4
14085df3d:     	pmovmskb	%xmm4, %r14d
14085df42:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085df49:     	je	0x14085df9c <.text+0x85cf9c>
14085df4b:     	leal	-0x1(%r11), %r9d
14085df4f:     	andw	%r11w, %r9w
14085df53:     	movl	%r9d, %r11d
14085df56:     	jne	0x14085df1b <.text+0x85cf1b>
14085df58:     	nopl	(%rax,%rax)
14085df60:     	pcmpeqb	%xmm1, %xmm3
14085df64:     	pmovmskb	%xmm3, %r9d
14085df69:     	testl	%r9d, %r9d
14085df6c:     	jne	0x14085e00f <.text+0x85d00f>
14085df72:     	addq	%r8, %rdx
14085df75:     	addq	$0x10, %rdx
14085df79:     	addq	$0x10, %r8
14085df7d:     	jmp	0x14085df01 <.text+0x85cf01>
14085df7f:     	leaq	(%rax,%r10,8), %rax
14085df83:     	movq	-0x8(%rax), %r14
14085df87:     	movq	0x1610(%rbp), %rdx
14085df8e:     	testq	%rdx, %rdx
14085df91:     	jne	0x14085e0ad <.text+0x85d0ad>
14085df97:     	jmp	0x14085e0c3 <.text+0x85d0c3>
14085df9c:     	leaq	-0x10(%r10), %rdx
14085dfa0:     	andq	%rcx, %rdx
14085dfa3:     	movdqu	(%rax,%rdx), %xmm0
14085dfa8:     	pcmpeqd	%xmm1, %xmm1
14085dfac:     	pcmpeqb	%xmm1, %xmm0
14085dfb0:     	pmovmskb	%xmm0, %ecx
14085dfb4:     	movdqu	(%rax,%r10), %xmm0
14085dfba:     	pcmpeqb	%xmm1, %xmm0
14085dfbe:     	pmovmskb	%xmm0, %r8d
14085dfc3:     	movw	$0x1f, %r11w
14085dfc8:     	bsrw	%cx, %r11w
14085dfcd:     	xorl	$0xf, %r11d
14085dfd1:     	orl	$0x10000, %r8d          # imm = 0x10000
14085dfd8:     	tzcntl	%r8d, %r8d
14085dfdd:     	addl	%r11d, %r8d
14085dfe0:     	movb	$-0x80, %cl
14085dfe2:     	cmpw	$0xf, %r8w
14085dfe7:     	ja	0x14085dff2 <.text+0x85cff2>
14085dfe9:     	incq	0xf0(%rsi)
14085dff0:     	movb	$-0x1, %cl
14085dff2:     	movb	%cl, (%rax,%r10)
14085dff6:     	movb	%cl, 0x10(%rax,%rdx)
14085dffa:     	decq	0xf8(%rsi)
14085e001:     	movq	-0x70(%r9), %rax
14085e005:     	cmpq	$0x2, %rax
14085e009:     	jne	0x14086037c <.text+0x85f37c>
14085e00f:     	movq	(%r15), %r14
14085e012:     	leaq	0x1(%r14), %rax
14085e016:     	movq	%rax, (%r15)
14085e019:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085e022:     	movq	$0x1, 0x550(%rbp)
14085e02d:     	movdqu	0x519a1bb(%rip), %xmm0  # 0x1459f81f0
14085e035:     	movdqu	%xmm0, 0x558(%rbp)
14085e03d:     	movq	$0x8, 0x578(%rbp)
14085e048:     	movq	$0x30, 0x580(%rbp)
14085e053:     	leaq	-0x36825a(%rip), %rax   # 0x1404f5e00 <.text+0x4f4e00>
14085e05a:     	movq	%rax, 0x598(%rbp)
14085e061:     	movb	$0x1, 0x5a2(%rbp)
14085e068:     	movq	$0x0, 0x568(%rbp)
14085e073:     	movb	$0x2, 0x588(%rbp)
14085e07a:     	leaq	0x550(%rbp), %r8
14085e081:     	movq	%rdi, %rcx
14085e084:     	movq	%r14, %rdx
14085e087:     	callq	0x14004abc0 <.text+0x49bc0>
14085e08c:     	nop
14085e08d:     	leaq	0x78(%rsi), %rcx
14085e091:     	leaq	0x519a158(%rip), %rdx   # 0x1459f81f0
14085e098:     	movq	%r14, %r8
14085e09b:     	callq	0x14000e640 <.text+0xd640>
14085e0a0:     	nop
14085e0a1:     	movq	0x1610(%rbp), %rdx
14085e0a8:     	testq	%rdx, %rdx
14085e0ab:     	je	0x14085e0c3 <.text+0x85d0c3>
14085e0ad:     	movq	0x1618(%rbp), %rcx
14085e0b4:     	shlq	$0x3, %rdx
14085e0b8:     	movl	$0x8, %r8d
14085e0be:     	callq	0x1400021d0 <.text+0x11d0>
14085e0c3:     	cmpq	0x218(%rsi), %r14
14085e0ca:     	jae	0x14085e0f5 <.text+0x85d0f5>
14085e0cc:     	movq	0x210(%rsi), %rax
14085e0d3:     	movq	(%rax,%r14,8), %rax
14085e0d7:     	testq	%rax, %rax
14085e0da:     	je	0x14085e0f5 <.text+0x85d0f5>
14085e0dc:     	movq	0x1e0(%rsi), %rcx
14085e0e3:     	notq	%rax
14085e0e6:     	imulq	$0x38, %rax, %rax
14085e0ea:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085e0ef:     	jne	0x14085e1a6 <.text+0x85d1a6>
14085e0f5:     	callq	0x1456e35e0 <.text+0x56e25e0>
14085e0fa:     	cmpb	$0x1, 0x10(%rax)
14085e0fe:     	jne	0x140860764 <.text+0x85f764>
14085e104:     	movq	(%rax), %rcx
14085e107:     	movq	0x8(%rax), %rdx
14085e10b:     	leaq	0x1(%rcx), %r8
14085e10f:     	movq	%r8, (%rax)
14085e112:     	movaps	0x519ac47(%rip), %xmm0  # 0x1459f8d60
14085e119:     	movaps	%xmm0, 0x560(%rbp)
14085e120:     	movdqa	0x519ac28(%rip), %xmm0  # 0x1459f8d50
14085e128:     	movdqa	%xmm0, 0x550(%rbp)
14085e130:     	movq	%rcx, 0x570(%rbp)
14085e137:     	movq	%rdx, 0x578(%rbp)
14085e13e:     	movl	0x5b0(%rsi), %r12d
14085e145:     	movq	%rsi, %rcx
14085e148:     	callq	0x144e76860 <.text+0x4e75860>
14085e14d:     	movq	%r14, 0x1610(%rbp)
14085e154:     	leaq	0x1610(%rbp), %r9
14085e15b:     	movq	%rbx, %rcx
14085e15e:     	movq	%r14, %rdx
14085e161:     	movq	%rdi, %r8
14085e164:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085e169:     	movq	%rax, %r14
14085e16c:     	cmpb	$0x1, 0x30(%rax)
14085e170:     	jne	0x14085e185 <.text+0x85d185>
14085e172:     	leaq	0x550(%rbp), %r8
14085e179:     	movq	%r14, %rcx
14085e17c:     	xorl	%edx, %edx
14085e17e:     	callq	0x144e617b0 <.text+0x4e607b0>
14085e183:     	jmp	0x14085e1a2 <.text+0x85d1a2>
14085e185:     	movq	0x8(%r14), %r8
14085e189:     	movq	0x10(%r14), %rcx
14085e18d:     	leaq	0x550(%rbp), %rdx
14085e194:     	callq	0x145756dd1 <.text+0x5755dd1>
14085e199:     	movl	%r12d, 0x28(%r14)
14085e19d:     	movb	$0x1, 0x30(%r14)
14085e1a2:     	movl	%r12d, 0x2c(%r14)
14085e1a6:     	movq	%rdi, 0x1628(%rbp)
14085e1ad:     	movq	%r15, 0x1630(%rbp)
14085e1b4:     	movq	$0x0, 0x1610(%rbp)
14085e1bf:     	movq	$0x8, 0x1618(%rbp)
14085e1ca:     	movq	$0x0, 0x1620(%rbp)
14085e1d5:     	cmpq	$0x0, 0x90(%rsi)
14085e1dd:     	je	0x14085e28b <.text+0x85d28b>
14085e1e3:     	movabsq	$-0x671887f8956ded9d, %rcx # imm = 0x98E778076A921263
14085e1ed:     	movq	0x78(%rsi), %rax
14085e1f1:     	movq	0x80(%rsi), %rdx
14085e1f8:     	xorl	%r8d, %r8d
14085e1fb:     	movdqa	0x509ec7d(%rip), %xmm0  # 0x1458fce80
14085e203:     	pcmpeqd	%xmm1, %xmm1
14085e207:     	movdqa	0x5199cc1(%rip), %xmm2  # 0x1459f7ed0
14085e20f:     	andq	%rdx, %rcx
14085e212:     	movdqu	(%rax,%rcx), %xmm3
14085e217:     	movdqa	%xmm3, %xmm4
14085e21b:     	pcmpeqb	%xmm0, %xmm4
14085e21f:     	pmovmskb	%xmm4, %r9d
14085e224:     	testl	%r9d, %r9d
14085e227:     	je	0x14085e270 <.text+0x85d270>
14085e229:     	tzcntl	%r9d, %r10d
14085e22e:     	addq	%rcx, %r10
14085e231:     	andq	%rdx, %r10
14085e234:     	negq	%r10
14085e237:     	leaq	(%r10,%r10,2), %r10
14085e23b:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085e242:     	pcmpeqb	%xmm2, %xmm4
14085e246:     	pmovmskb	%xmm4, %r11d
14085e24b:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085e252:     	je	0x14085e33f <.text+0x85d33f>
14085e258:     	leal	-0x1(%r9), %r10d
14085e25c:     	andw	%r9w, %r10w
14085e260:     	movl	%r10d, %r9d
14085e263:     	jne	0x14085e229 <.text+0x85d229>
14085e265:     	nopw	%cs:(%rax,%rax)
14085e270:     	pcmpeqb	%xmm1, %xmm3
14085e274:     	pmovmskb	%xmm3, %r9d
14085e279:     	testl	%r9d, %r9d
14085e27c:     	jne	0x14085e28b <.text+0x85d28b>
14085e27e:     	addq	%r8, %rcx
14085e281:     	addq	$0x10, %rcx
14085e285:     	addq	$0x10, %r8
14085e289:     	jmp	0x14085e20f <.text+0x85d20f>
14085e28b:     	movzbl	0xa0(%rsi), %eax
14085e292:     	movq	0xe0(%rsi), %rax
14085e299:     	movq	0xe8(%rsi), %rcx
14085e2a0:     	movabsq	$-0x671887f8956ded9d, %rdx # imm = 0x98E778076A921263
14085e2aa:     	xorl	%r8d, %r8d
14085e2ad:     	movdqa	0x509ebcb(%rip), %xmm0  # 0x1458fce80
14085e2b5:     	pcmpeqd	%xmm1, %xmm1
14085e2b9:     	movdqa	0x5199c0f(%rip), %xmm2  # 0x1459f7ed0
14085e2c1:     	andq	%rcx, %rdx
14085e2c4:     	movdqu	(%rax,%rdx), %xmm3
14085e2c9:     	movdqa	%xmm3, %xmm4
14085e2cd:     	pcmpeqb	%xmm0, %xmm4
14085e2d1:     	pmovmskb	%xmm4, %r11d
14085e2d6:     	testl	%r11d, %r11d
14085e2d9:     	je	0x14085e320 <.text+0x85d320>
14085e2db:     	tzcntl	%r11d, %r10d
14085e2e0:     	addq	%rdx, %r10
14085e2e3:     	andq	%rcx, %r10
14085e2e6:     	movq	%r10, %r14
14085e2e9:     	shlq	$0x7, %r14
14085e2ed:     	movq	%rax, %r9
14085e2f0:     	subq	%r14, %r9
14085e2f3:     	movdqu	-0x80(%r9), %xmm4
14085e2f9:     	pcmpeqb	%xmm2, %xmm4
14085e2fd:     	pmovmskb	%xmm4, %r14d
14085e302:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085e309:     	je	0x14085e35c <.text+0x85d35c>
14085e30b:     	leal	-0x1(%r11), %r9d
14085e30f:     	andw	%r11w, %r9w
14085e313:     	movl	%r9d, %r11d
14085e316:     	jne	0x14085e2db <.text+0x85d2db>
14085e318:     	nopl	(%rax,%rax)
14085e320:     	pcmpeqb	%xmm1, %xmm3
14085e324:     	pmovmskb	%xmm3, %r9d
14085e329:     	testl	%r9d, %r9d
14085e32c:     	jne	0x14085e3cf <.text+0x85d3cf>
14085e332:     	addq	%r8, %rdx
14085e335:     	addq	$0x10, %rdx
14085e339:     	addq	$0x10, %r8
14085e33d:     	jmp	0x14085e2c1 <.text+0x85d2c1>
14085e33f:     	leaq	(%rax,%r10,8), %rax
14085e343:     	movq	-0x8(%rax), %r14
14085e347:     	movq	0x1610(%rbp), %rdx
14085e34e:     	testq	%rdx, %rdx
14085e351:     	jne	0x14085e46d <.text+0x85d46d>
14085e357:     	jmp	0x14085e483 <.text+0x85d483>
14085e35c:     	leaq	-0x10(%r10), %rdx
14085e360:     	andq	%rcx, %rdx
14085e363:     	movdqu	(%rax,%rdx), %xmm0
14085e368:     	pcmpeqd	%xmm1, %xmm1
14085e36c:     	pcmpeqb	%xmm1, %xmm0
14085e370:     	pmovmskb	%xmm0, %ecx
14085e374:     	movdqu	(%rax,%r10), %xmm0
14085e37a:     	pcmpeqb	%xmm1, %xmm0
14085e37e:     	pmovmskb	%xmm0, %r8d
14085e383:     	movw	$0x1f, %r11w
14085e388:     	bsrw	%cx, %r11w
14085e38d:     	xorl	$0xf, %r11d
14085e391:     	orl	$0x10000, %r8d          # imm = 0x10000
14085e398:     	tzcntl	%r8d, %r8d
14085e39d:     	addl	%r11d, %r8d
14085e3a0:     	movb	$-0x80, %cl
14085e3a2:     	cmpw	$0xf, %r8w
14085e3a7:     	ja	0x14085e3b2 <.text+0x85d3b2>
14085e3a9:     	incq	0xf0(%rsi)
14085e3b0:     	movb	$-0x1, %cl
14085e3b2:     	movb	%cl, (%rax,%r10)
14085e3b6:     	movb	%cl, 0x10(%rax,%rdx)
14085e3ba:     	decq	0xf8(%rsi)
14085e3c1:     	movq	-0x70(%r9), %rax
14085e3c5:     	cmpq	$0x2, %rax
14085e3c9:     	jne	0x14086040a <.text+0x85f40a>
14085e3cf:     	movq	(%r15), %r14
14085e3d2:     	leaq	0x1(%r14), %rax
14085e3d6:     	movq	%rax, (%r15)
14085e3d9:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085e3e2:     	movq	$0x1, 0x550(%rbp)
14085e3ed:     	movdqu	0x5199d7b(%rip), %xmm0  # 0x1459f8170
14085e3f5:     	movdqu	%xmm0, 0x558(%rbp)
14085e3fd:     	movq	$0x8, 0x578(%rbp)
14085e408:     	movq	$0x30, 0x580(%rbp)
14085e413:     	leaq	-0x368a9a(%rip), %rax   # 0x1404f5980 <.text+0x4f4980>
14085e41a:     	movq	%rax, 0x598(%rbp)
14085e421:     	movb	$0x1, 0x5a2(%rbp)
14085e428:     	movq	$0x0, 0x568(%rbp)
14085e433:     	movb	$0x2, 0x588(%rbp)
14085e43a:     	leaq	0x550(%rbp), %r8
14085e441:     	movq	%rdi, %rcx
14085e444:     	movq	%r14, %rdx
14085e447:     	callq	0x14004abc0 <.text+0x49bc0>
14085e44c:     	nop
14085e44d:     	leaq	0x78(%rsi), %rcx
14085e451:     	leaq	0x5199d18(%rip), %rdx   # 0x1459f8170
14085e458:     	movq	%r14, %r8
14085e45b:     	callq	0x14000e640 <.text+0xd640>
14085e460:     	nop
14085e461:     	movq	0x1610(%rbp), %rdx
14085e468:     	testq	%rdx, %rdx
14085e46b:     	je	0x14085e483 <.text+0x85d483>
14085e46d:     	movq	0x1618(%rbp), %rcx
14085e474:     	shlq	$0x3, %rdx
14085e478:     	movl	$0x8, %r8d
14085e47e:     	callq	0x1400021d0 <.text+0x11d0>
14085e483:     	cmpq	0x218(%rsi), %r14
14085e48a:     	jae	0x14085e4b5 <.text+0x85d4b5>
14085e48c:     	movq	0x210(%rsi), %rax
14085e493:     	movq	(%rax,%r14,8), %rax
14085e497:     	testq	%rax, %rax
14085e49a:     	je	0x14085e4b5 <.text+0x85d4b5>
14085e49c:     	movq	0x1e0(%rsi), %rcx
14085e4a3:     	notq	%rax
14085e4a6:     	imulq	$0x38, %rax, %rax
14085e4aa:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085e4af:     	jne	0x14085e566 <.text+0x85d566>
14085e4b5:     	callq	0x1456e35e0 <.text+0x56e25e0>
14085e4ba:     	cmpb	$0x1, 0x10(%rax)
14085e4be:     	jne	0x140860786 <.text+0x85f786>
14085e4c4:     	movq	(%rax), %rcx
14085e4c7:     	movq	0x8(%rax), %rdx
14085e4cb:     	leaq	0x1(%rcx), %r8
14085e4cf:     	movq	%r8, (%rax)
14085e4d2:     	movaps	0x519a887(%rip), %xmm0  # 0x1459f8d60
14085e4d9:     	movaps	%xmm0, 0x560(%rbp)
14085e4e0:     	movdqa	0x519a868(%rip), %xmm0  # 0x1459f8d50
14085e4e8:     	movdqa	%xmm0, 0x550(%rbp)
14085e4f0:     	movq	%rcx, 0x570(%rbp)
14085e4f7:     	movq	%rdx, 0x578(%rbp)
14085e4fe:     	movl	0x5b0(%rsi), %r12d
14085e505:     	movq	%rsi, %rcx
14085e508:     	callq	0x144e76860 <.text+0x4e75860>
14085e50d:     	movq	%r14, 0x1610(%rbp)
14085e514:     	leaq	0x1610(%rbp), %r9
14085e51b:     	movq	%rbx, %rcx
14085e51e:     	movq	%r14, %rdx
14085e521:     	movq	%rdi, %r8
14085e524:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085e529:     	movq	%rax, %r14
14085e52c:     	cmpb	$0x1, 0x30(%rax)
14085e530:     	jne	0x14085e545 <.text+0x85d545>
14085e532:     	leaq	0x550(%rbp), %r8
14085e539:     	movq	%r14, %rcx
14085e53c:     	xorl	%edx, %edx
14085e53e:     	callq	0x144e617b0 <.text+0x4e607b0>
14085e543:     	jmp	0x14085e562 <.text+0x85d562>
14085e545:     	movq	0x8(%r14), %r8
14085e549:     	movq	0x10(%r14), %rcx
14085e54d:     	leaq	0x550(%rbp), %rdx
14085e554:     	callq	0x145756dd1 <.text+0x5755dd1>
14085e559:     	movl	%r12d, 0x28(%r14)
14085e55d:     	movb	$0x1, 0x30(%r14)
14085e562:     	movl	%r12d, 0x2c(%r14)
14085e566:     	movq	%rdi, 0x1628(%rbp)
14085e56d:     	movq	%r15, 0x1630(%rbp)
14085e574:     	movq	$0x0, 0x1610(%rbp)
14085e57f:     	movq	$0x8, 0x1618(%rbp)
14085e58a:     	movq	$0x0, 0x1620(%rbp)
14085e595:     	cmpq	$0x0, 0x90(%rsi)
14085e59d:     	je	0x14085e64b <.text+0x85d64b>
14085e5a3:     	movabsq	$-0x575b8bbf3458d3d3, %rcx # imm = 0xA8A47440CBA72C2D
14085e5ad:     	movq	0x78(%rsi), %rax
14085e5b1:     	movq	0x80(%rsi), %rdx
14085e5b8:     	xorl	%r8d, %r8d
14085e5bb:     	movdqa	0x50e63fd(%rip), %xmm0  # 0x1459449c0
14085e5c3:     	pcmpeqd	%xmm1, %xmm1
14085e5c7:     	movdqa	0x5199911(%rip), %xmm2  # 0x1459f7ee0
14085e5cf:     	andq	%rdx, %rcx
14085e5d2:     	movdqu	(%rax,%rcx), %xmm3
14085e5d7:     	movdqa	%xmm3, %xmm4
14085e5db:     	pcmpeqb	%xmm0, %xmm4
14085e5df:     	pmovmskb	%xmm4, %r9d
14085e5e4:     	testl	%r9d, %r9d
14085e5e7:     	je	0x14085e630 <.text+0x85d630>
14085e5e9:     	tzcntl	%r9d, %r10d
14085e5ee:     	addq	%rcx, %r10
14085e5f1:     	andq	%rdx, %r10
14085e5f4:     	negq	%r10
14085e5f7:     	leaq	(%r10,%r10,2), %r10
14085e5fb:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085e602:     	pcmpeqb	%xmm2, %xmm4
14085e606:     	pmovmskb	%xmm4, %r11d
14085e60b:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085e612:     	je	0x14085e6ff <.text+0x85d6ff>
14085e618:     	leal	-0x1(%r9), %r10d
14085e61c:     	andw	%r9w, %r10w
14085e620:     	movl	%r10d, %r9d
14085e623:     	jne	0x14085e5e9 <.text+0x85d5e9>
14085e625:     	nopw	%cs:(%rax,%rax)
14085e630:     	pcmpeqb	%xmm1, %xmm3
14085e634:     	pmovmskb	%xmm3, %r9d
14085e639:     	testl	%r9d, %r9d
14085e63c:     	jne	0x14085e64b <.text+0x85d64b>
14085e63e:     	addq	%r8, %rcx
14085e641:     	addq	$0x10, %rcx
14085e645:     	addq	$0x10, %r8
14085e649:     	jmp	0x14085e5cf <.text+0x85d5cf>
14085e64b:     	movzbl	0xa0(%rsi), %eax
14085e652:     	movq	0xe0(%rsi), %rax
14085e659:     	movq	0xe8(%rsi), %rcx
14085e660:     	movabsq	$-0x575b8bbf3458d3d3, %rdx # imm = 0xA8A47440CBA72C2D
14085e66a:     	xorl	%r8d, %r8d
14085e66d:     	movdqa	0x50e634b(%rip), %xmm0  # 0x1459449c0
14085e675:     	pcmpeqd	%xmm1, %xmm1
14085e679:     	movdqa	0x519985f(%rip), %xmm2  # 0x1459f7ee0
14085e681:     	andq	%rcx, %rdx
14085e684:     	movdqu	(%rax,%rdx), %xmm3
14085e689:     	movdqa	%xmm3, %xmm4
14085e68d:     	pcmpeqb	%xmm0, %xmm4
14085e691:     	pmovmskb	%xmm4, %r11d
14085e696:     	testl	%r11d, %r11d
14085e699:     	je	0x14085e6e0 <.text+0x85d6e0>
14085e69b:     	tzcntl	%r11d, %r10d
14085e6a0:     	addq	%rdx, %r10
14085e6a3:     	andq	%rcx, %r10
14085e6a6:     	movq	%r10, %r14
14085e6a9:     	shlq	$0x7, %r14
14085e6ad:     	movq	%rax, %r9
14085e6b0:     	subq	%r14, %r9
14085e6b3:     	movdqu	-0x80(%r9), %xmm4
14085e6b9:     	pcmpeqb	%xmm2, %xmm4
14085e6bd:     	pmovmskb	%xmm4, %r14d
14085e6c2:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085e6c9:     	je	0x14085e71c <.text+0x85d71c>
14085e6cb:     	leal	-0x1(%r11), %r9d
14085e6cf:     	andw	%r11w, %r9w
14085e6d3:     	movl	%r9d, %r11d
14085e6d6:     	jne	0x14085e69b <.text+0x85d69b>
14085e6d8:     	nopl	(%rax,%rax)
14085e6e0:     	pcmpeqb	%xmm1, %xmm3
14085e6e4:     	pmovmskb	%xmm3, %r9d
14085e6e9:     	testl	%r9d, %r9d
14085e6ec:     	jne	0x14085e78f <.text+0x85d78f>
14085e6f2:     	addq	%r8, %rdx
14085e6f5:     	addq	$0x10, %rdx
14085e6f9:     	addq	$0x10, %r8
14085e6fd:     	jmp	0x14085e681 <.text+0x85d681>
14085e6ff:     	leaq	(%rax,%r10,8), %rax
14085e703:     	movq	-0x8(%rax), %r14
14085e707:     	movq	0x1610(%rbp), %rdx
14085e70e:     	testq	%rdx, %rdx
14085e711:     	jne	0x14085e82a <.text+0x85d82a>
14085e717:     	jmp	0x14085e840 <.text+0x85d840>
14085e71c:     	leaq	-0x10(%r10), %rdx
14085e720:     	andq	%rcx, %rdx
14085e723:     	movdqu	(%rax,%rdx), %xmm0
14085e728:     	pcmpeqd	%xmm1, %xmm1
14085e72c:     	pcmpeqb	%xmm1, %xmm0
14085e730:     	pmovmskb	%xmm0, %ecx
14085e734:     	movdqu	(%rax,%r10), %xmm0
14085e73a:     	pcmpeqb	%xmm1, %xmm0
14085e73e:     	pmovmskb	%xmm0, %r8d
14085e743:     	movw	$0x1f, %r11w
14085e748:     	bsrw	%cx, %r11w
14085e74d:     	xorl	$0xf, %r11d
14085e751:     	orl	$0x10000, %r8d          # imm = 0x10000
14085e758:     	tzcntl	%r8d, %r8d
14085e75d:     	addl	%r11d, %r8d
14085e760:     	movb	$-0x80, %cl
14085e762:     	cmpw	$0xf, %r8w
14085e767:     	ja	0x14085e772 <.text+0x85d772>
14085e769:     	incq	0xf0(%rsi)
14085e770:     	movb	$-0x1, %cl
14085e772:     	movb	%cl, (%rax,%r10)
14085e776:     	movb	%cl, 0x10(%rax,%rdx)
14085e77a:     	decq	0xf8(%rsi)
14085e781:     	movq	-0x70(%r9), %rax
14085e785:     	cmpq	$0x2, %rax
14085e789:     	jne	0x140860498 <.text+0x85f498>
14085e78f:     	movq	(%r15), %r14
14085e792:     	leaq	0x1(%r14), %rax
14085e796:     	movq	%rax, (%r15)
14085e799:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085e7a2:     	movq	$0x1, 0x550(%rbp)
14085e7ad:     	movdqu	0x5199a4b(%rip), %xmm0  # 0x1459f8200
14085e7b5:     	movdqu	%xmm0, 0x558(%rbp)
14085e7bd:     	movq	$0x4, 0x578(%rbp)
14085e7c8:     	movq	$0x4, 0x580(%rbp)
14085e7d3:     	movq	$0x0, 0x598(%rbp)
14085e7de:     	movb	$0x1, 0x5a2(%rbp)
14085e7e5:     	movq	$0x0, 0x568(%rbp)
14085e7f0:     	movb	$0x2, 0x588(%rbp)
14085e7f7:     	leaq	0x550(%rbp), %r8
14085e7fe:     	movq	%rdi, %rcx
14085e801:     	movq	%r14, %rdx
14085e804:     	callq	0x14004abc0 <.text+0x49bc0>
14085e809:     	nop
14085e80a:     	leaq	0x78(%rsi), %rcx
14085e80e:     	leaq	0x51999eb(%rip), %rdx   # 0x1459f8200
14085e815:     	movq	%r14, %r8
14085e818:     	callq	0x14000e640 <.text+0xd640>
14085e81d:     	nop
14085e81e:     	movq	0x1610(%rbp), %rdx
14085e825:     	testq	%rdx, %rdx
14085e828:     	je	0x14085e840 <.text+0x85d840>
14085e82a:     	movq	0x1618(%rbp), %rcx
14085e831:     	shlq	$0x3, %rdx
14085e835:     	movl	$0x8, %r8d
14085e83b:     	callq	0x1400021d0 <.text+0x11d0>
14085e840:     	cmpq	0x218(%rsi), %r14
14085e847:     	jae	0x14085e86e <.text+0x85d86e>
14085e849:     	movq	0x210(%rsi), %rax
14085e850:     	movq	(%rax,%r14,8), %rax
14085e854:     	testq	%rax, %rax
14085e857:     	je	0x14085e86e <.text+0x85d86e>
14085e859:     	movq	0x1e0(%rsi), %rcx
14085e860:     	notq	%rax
14085e863:     	imulq	$0x38, %rax, %rax
14085e867:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085e86c:     	jne	0x14085e8e0 <.text+0x85d8e0>
14085e86e:     	movl	$0x3faaaaab, 0x1610(%rbp) # imm = 0x3FAAAAAB
14085e878:     	movl	0x5b0(%rsi), %r12d
14085e87f:     	movq	%rsi, %rcx
14085e882:     	callq	0x144e76860 <.text+0x4e75860>
14085e887:     	movq	%r14, 0x550(%rbp)
14085e88e:     	leaq	0x550(%rbp), %r9
14085e895:     	movq	%rbx, %rcx
14085e898:     	movq	%r14, %rdx
14085e89b:     	movq	%rdi, %r8
14085e89e:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085e8a3:     	movq	%rax, %r14
14085e8a6:     	cmpb	$0x1, 0x30(%rax)
14085e8aa:     	jne	0x14085e8bf <.text+0x85d8bf>
14085e8ac:     	leaq	0x1610(%rbp), %r8
14085e8b3:     	movq	%r14, %rcx
14085e8b6:     	xorl	%edx, %edx
14085e8b8:     	callq	0x144e617b0 <.text+0x4e607b0>
14085e8bd:     	jmp	0x14085e8dc <.text+0x85d8dc>
14085e8bf:     	movq	0x8(%r14), %r8
14085e8c3:     	movq	0x10(%r14), %rcx
14085e8c7:     	leaq	0x1610(%rbp), %rdx
14085e8ce:     	callq	0x145756dd1 <.text+0x5755dd1>
14085e8d3:     	movl	%r12d, 0x28(%r14)
14085e8d7:     	movb	$0x1, 0x30(%r14)
14085e8dc:     	movl	%r12d, 0x2c(%r14)
14085e8e0:     	movq	%rdi, 0x1628(%rbp)
14085e8e7:     	movq	%r15, 0x1630(%rbp)
14085e8ee:     	movq	$0x0, 0x1610(%rbp)
14085e8f9:     	movq	$0x8, 0x1618(%rbp)
14085e904:     	movq	$0x0, 0x1620(%rbp)
14085e90f:     	cmpq	$0x0, 0x90(%rsi)
14085e917:     	je	0x14085e9bb <.text+0x85d9bb>
14085e91d:     	movabsq	$-0x1a3428abe603706d, %rcx # imm = 0xE5CBD75419FC8F93
14085e927:     	movq	0x78(%rsi), %rax
14085e92b:     	movq	0x80(%rsi), %rdx
14085e932:     	xorl	%r8d, %r8d
14085e935:     	movdqa	0x50d5323(%rip), %xmm0  # 0x145933c60
14085e93d:     	pcmpeqd	%xmm1, %xmm1
14085e941:     	movdqa	0x51995a7(%rip), %xmm2  # 0x1459f7ef0
14085e949:     	andq	%rdx, %rcx
14085e94c:     	movdqu	(%rax,%rcx), %xmm3
14085e951:     	movdqa	%xmm3, %xmm4
14085e955:     	pcmpeqb	%xmm0, %xmm4
14085e959:     	pmovmskb	%xmm4, %r9d
14085e95e:     	testl	%r9d, %r9d
14085e961:     	je	0x14085e9a0 <.text+0x85d9a0>
14085e963:     	tzcntl	%r9d, %r10d
14085e968:     	addq	%rcx, %r10
14085e96b:     	andq	%rdx, %r10
14085e96e:     	negq	%r10
14085e971:     	leaq	(%r10,%r10,2), %r10
14085e975:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14085e97c:     	pcmpeqb	%xmm2, %xmm4
14085e980:     	pmovmskb	%xmm4, %r11d
14085e985:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14085e98c:     	je	0x14085ea6f <.text+0x85da6f>
14085e992:     	leal	-0x1(%r9), %r10d
14085e996:     	andw	%r9w, %r10w
14085e99a:     	movl	%r10d, %r9d
14085e99d:     	jne	0x14085e963 <.text+0x85d963>
14085e99f:     	nop
14085e9a0:     	pcmpeqb	%xmm1, %xmm3
14085e9a4:     	pmovmskb	%xmm3, %r9d
14085e9a9:     	testl	%r9d, %r9d
14085e9ac:     	jne	0x14085e9bb <.text+0x85d9bb>
14085e9ae:     	addq	%r8, %rcx
14085e9b1:     	addq	$0x10, %rcx
14085e9b5:     	addq	$0x10, %r8
14085e9b9:     	jmp	0x14085e949 <.text+0x85d949>
14085e9bb:     	movzbl	0xa0(%rsi), %eax
14085e9c2:     	movq	0xe0(%rsi), %rax
14085e9c9:     	movq	0xe8(%rsi), %rcx
14085e9d0:     	movabsq	$-0x1a3428abe603706d, %rdx # imm = 0xE5CBD75419FC8F93
14085e9da:     	xorl	%r8d, %r8d
14085e9dd:     	movdqa	0x50d527b(%rip), %xmm0  # 0x145933c60
14085e9e5:     	pcmpeqd	%xmm1, %xmm1
14085e9e9:     	movdqa	0x51994ff(%rip), %xmm2  # 0x1459f7ef0
14085e9f1:     	andq	%rcx, %rdx
14085e9f4:     	movdqu	(%rax,%rdx), %xmm3
14085e9f9:     	movdqa	%xmm3, %xmm4
14085e9fd:     	pcmpeqb	%xmm0, %xmm4
14085ea01:     	pmovmskb	%xmm4, %r11d
14085ea06:     	testl	%r11d, %r11d
14085ea09:     	je	0x14085ea50 <.text+0x85da50>
14085ea0b:     	tzcntl	%r11d, %r10d
14085ea10:     	addq	%rdx, %r10
14085ea13:     	andq	%rcx, %r10
14085ea16:     	movq	%r10, %r14
14085ea19:     	shlq	$0x7, %r14
14085ea1d:     	movq	%rax, %r9
14085ea20:     	subq	%r14, %r9
14085ea23:     	movdqu	-0x80(%r9), %xmm4
14085ea29:     	pcmpeqb	%xmm2, %xmm4
14085ea2d:     	pmovmskb	%xmm4, %r14d
14085ea32:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14085ea39:     	je	0x14085ea8c <.text+0x85da8c>
14085ea3b:     	leal	-0x1(%r11), %r9d
14085ea3f:     	andw	%r11w, %r9w
14085ea43:     	movl	%r9d, %r11d
14085ea46:     	jne	0x14085ea0b <.text+0x85da0b>
14085ea48:     	nopl	(%rax,%rax)
14085ea50:     	pcmpeqb	%xmm1, %xmm3
14085ea54:     	pmovmskb	%xmm3, %r9d
14085ea59:     	testl	%r9d, %r9d
14085ea5c:     	jne	0x14085eaff <.text+0x85daff>
14085ea62:     	addq	%r8, %rdx
14085ea65:     	addq	$0x10, %rdx
14085ea69:     	addq	$0x10, %r8
14085ea6d:     	jmp	0x14085e9f1 <.text+0x85d9f1>
14085ea6f:     	leaq	(%rax,%r10,8), %rax
14085ea73:     	movq	-0x8(%rax), %r14
14085ea77:     	movq	0x1610(%rbp), %rdx
14085ea7e:     	testq	%rdx, %rdx
14085ea81:     	jne	0x14085eb9d <.text+0x85db9d>
14085ea87:     	jmp	0x14085ebb3 <.text+0x85dbb3>
14085ea8c:     	leaq	-0x10(%r10), %rdx
14085ea90:     	andq	%rcx, %rdx
14085ea93:     	movdqu	(%rax,%rdx), %xmm0
14085ea98:     	pcmpeqd	%xmm1, %xmm1
14085ea9c:     	pcmpeqb	%xmm1, %xmm0
14085eaa0:     	pmovmskb	%xmm0, %ecx
14085eaa4:     	movdqu	(%rax,%r10), %xmm0
14085eaaa:     	pcmpeqb	%xmm1, %xmm0
14085eaae:     	pmovmskb	%xmm0, %r8d
14085eab3:     	movw	$0x1f, %r11w
14085eab8:     	bsrw	%cx, %r11w
14085eabd:     	xorl	$0xf, %r11d
14085eac1:     	orl	$0x10000, %r8d          # imm = 0x10000
14085eac8:     	tzcntl	%r8d, %r8d
14085eacd:     	addl	%r11d, %r8d
14085ead0:     	movb	$-0x80, %cl
14085ead2:     	cmpw	$0xf, %r8w
14085ead7:     	ja	0x14085eae2 <.text+0x85dae2>
14085ead9:     	incq	0xf0(%rsi)
14085eae0:     	movb	$-0x1, %cl
14085eae2:     	movb	%cl, (%rax,%r10)
14085eae6:     	movb	%cl, 0x10(%rax,%rdx)
14085eaea:     	decq	0xf8(%rsi)
14085eaf1:     	movq	-0x70(%r9), %rax
14085eaf5:     	cmpq	$0x2, %rax
14085eaf9:     	jne	0x140860526 <.text+0x85f526>
14085eaff:     	movq	(%r15), %r14
14085eb02:     	leaq	0x1(%r14), %rax
14085eb06:     	movq	%rax, (%r15)
14085eb09:     	movw	$0x100, 0x5a0(%rbp)     # imm = 0x100
14085eb12:     	movq	$0x1, 0x550(%rbp)
14085eb1d:     	movdqu	0x51997ab(%rip), %xmm0  # 0x1459f82d0
14085eb25:     	movdqu	%xmm0, 0x558(%rbp)
14085eb2d:     	movq	$0x8, 0x578(%rbp)
14085eb38:     	movq	$0xc0, 0x580(%rbp)
14085eb43:     	leaq	-0x36066a(%rip), %rax   # 0x1404fe4e0 <.text+0x4fd4e0>
14085eb4a:     	movq	%rax, 0x598(%rbp)
14085eb51:     	movb	$0x1, 0x5a2(%rbp)
14085eb58:     	movq	$0x0, 0x568(%rbp)
14085eb63:     	movb	$0x2, 0x588(%rbp)
14085eb6a:     	leaq	0x550(%rbp), %r8
14085eb71:     	movq	%rdi, %rcx
14085eb74:     	movq	%r14, %rdx
14085eb77:     	callq	0x14004abc0 <.text+0x49bc0>
14085eb7c:     	nop
14085eb7d:     	leaq	0x78(%rsi), %rcx
14085eb81:     	leaq	0x5199748(%rip), %rdx   # 0x1459f82d0
14085eb88:     	movq	%r14, %r8
14085eb8b:     	callq	0x14000e640 <.text+0xd640>
14085eb90:     	nop
14085eb91:     	movq	0x1610(%rbp), %rdx
14085eb98:     	testq	%rdx, %rdx
14085eb9b:     	je	0x14085ebb3 <.text+0x85dbb3>
14085eb9d:     	movq	0x1618(%rbp), %rcx
14085eba4:     	shlq	$0x3, %rdx
14085eba8:     	movl	$0x8, %r8d
14085ebae:     	callq	0x1400021d0 <.text+0x11d0>
14085ebb3:     	cmpq	0x218(%rsi), %r14
14085ebba:     	jae	0x14085ebe5 <.text+0x85dbe5>
14085ebbc:     	movq	0x210(%rsi), %rax
14085ebc3:     	movq	(%rax,%r14,8), %rax
14085ebc7:     	testq	%rax, %rax
14085ebca:     	je	0x14085ebe5 <.text+0x85dbe5>
14085ebcc:     	movq	0x1e0(%rsi), %rcx
14085ebd3:     	notq	%rax
14085ebd6:     	imulq	$0x38, %rax, %rax
14085ebda:     	cmpb	$0x0, 0x30(%rcx,%rax)
14085ebdf:     	jne	0x14085ee18 <.text+0x85de18>
14085ebe5:     	movq	$0x0, 0x550(%rbp)
14085ebf0:     	callq	0x1456e35e0 <.text+0x56e25e0>
14085ebf5:     	nop
14085ebf6:     	movq	%rax, %r15
14085ebf9:     	cmpb	$0x1, 0x10(%rax)
14085ebfd:     	jne	0x1408607a8 <.text+0x85f7a8>
14085ec03:     	movq	(%r15), %rax
14085ec06:     	movq	0x8(%r15), %rdx
14085ec0a:     	leaq	0x1(%rax), %rcx
14085ec0e:     	movq	%rcx, (%r15)
14085ec11:     	movq	0x570(%rbp), %rcx
14085ec18:     	movq	%rcx, 0x15e0(%rbp)
14085ec1f:     	movups	0x550(%rbp), %xmm0
14085ec26:     	movups	0x560(%rbp), %xmm1
14085ec2d:     	movaps	%xmm1, 0x15d0(%rbp)
14085ec34:     	movaps	%xmm0, 0x15c0(%rbp)
14085ec3b:     	movaps	0x519a10e(%rip), %xmm6  # 0x1459f8d50
14085ec42:     	movaps	%xmm6, 0x1590(%rbp)
14085ec49:     	movaps	0x519a110(%rip), %xmm7  # 0x1459f8d60
14085ec50:     	movaps	%xmm7, 0x15a0(%rbp)
14085ec57:     	movq	%rax, 0x15b0(%rbp)
14085ec5e:     	movq	%rdx, 0x15b8(%rbp)
14085ec65:     	movb	$0x0, 0x15e8(%rbp)
14085ec6c:     	movq	$0x0, 0x1610(%rbp)
14085ec77:     	callq	0x1456e35e0 <.text+0x56e25e0>
14085ec7c:     	nop
14085ec7d:     	movq	%rax, %r15
14085ec80:     	cmpb	$0x1, 0x10(%rax)
14085ec84:     	jne	0x1408607bf <.text+0x85f7bf>
14085ec8a:     	movq	(%r15), %rax
14085ec8d:     	movq	0x8(%r15), %rdx
14085ec91:     	leaq	0x1(%rax), %rcx
14085ec95:     	movq	%rcx, (%r15)
14085ec98:     	movq	0x1630(%rbp), %rcx
14085ec9f:     	movq	%rcx, 0x600(%rbp)
14085eca6:     	movups	0x1610(%rbp), %xmm0
14085ecad:     	movups	0x1620(%rbp), %xmm1
14085ecb4:     	movaps	%xmm1, 0x5f0(%rbp)
14085ecbb:     	movaps	%xmm0, 0x5e0(%rbp)
14085ecc2:     	movaps	0x1590(%rbp), %xmm0
14085ecc9:     	movaps	0x15a0(%rbp), %xmm1
14085ecd0:     	movaps	0x15b0(%rbp), %xmm2
14085ecd7:     	movaps	0x15c0(%rbp), %xmm3
14085ecde:     	movaps	%xmm0, 0x1610(%rbp)
14085ece5:     	movaps	%xmm1, 0x1620(%rbp)
14085ecec:     	movaps	%xmm2, 0x1630(%rbp)
14085ecf3:     	movaps	%xmm3, 0x1640(%rbp)
14085ecfa:     	movaps	0x15d0(%rbp), %xmm0
14085ed01:     	movaps	%xmm0, 0x1650(%rbp)
14085ed08:     	movaps	0x15e0(%rbp), %xmm0
14085ed0f:     	movaps	%xmm0, 0x1660(%rbp)
14085ed16:     	movaps	%xmm7, 0x1680(%rbp)
14085ed1d:     	movaps	%xmm6, 0x1670(%rbp)
14085ed24:     	movaps	0x1680(%rbp), %xmm0
14085ed2b:     	movaps	%xmm0, 0x5c0(%rbp)
14085ed32:     	movaps	0x1670(%rbp), %xmm0
14085ed39:     	movaps	%xmm0, 0x5b0(%rbp)
14085ed40:     	movaps	0x1660(%rbp), %xmm0
14085ed47:     	movaps	%xmm0, 0x5a0(%rbp)
14085ed4e:     	movaps	0x1650(%rbp), %xmm0
14085ed55:     	movaps	%xmm0, 0x590(%rbp)
14085ed5c:     	movdqa	0x1610(%rbp), %xmm0
14085ed64:     	movdqa	0x1620(%rbp), %xmm1
14085ed6c:     	movdqa	0x1630(%rbp), %xmm2
14085ed74:     	movdqa	0x1640(%rbp), %xmm3
14085ed7c:     	movdqa	%xmm3, 0x580(%rbp)
14085ed84:     	movdqa	%xmm2, 0x570(%rbp)
14085ed8c:     	movdqa	%xmm1, 0x560(%rbp)
14085ed94:     	movdqa	%xmm0, 0x550(%rbp)
14085ed9c:     	movq	%rax, 0x5d0(%rbp)
14085eda3:     	movq	%rdx, 0x5d8(%rbp)
14085edaa:     	movb	$0x0, 0x608(%rbp)
14085edb1:     	movl	0x5b0(%rsi), %r15d
14085edb8:     	movq	%rsi, %rcx
14085edbb:     	callq	0x144e76860 <.text+0x4e75860>
14085edc0:     	movq	%r14, 0x1590(%rbp)
14085edc7:     	leaq	0x1590(%rbp), %r9
14085edce:     	movq	%rbx, %rcx
14085edd1:     	movq	%r14, %rdx
14085edd4:     	movq	%rdi, %r8
14085edd7:     	callq	0x140a9fe70 <.text+0xa9ee70>
14085eddc:     	movq	%rax, %rdi
14085eddf:     	cmpb	$0x1, 0x30(%rax)
14085ede3:     	jne	0x14085edf8 <.text+0x85ddf8>
14085ede5:     	leaq	0x550(%rbp), %r8
14085edec:     	movq	%rdi, %rcx
14085edef:     	xorl	%edx, %edx
14085edf1:     	callq	0x144e617b0 <.text+0x4e607b0>
14085edf6:     	jmp	0x14085ee14 <.text+0x85de14>
14085edf8:     	movq	0x8(%rdi), %r8
14085edfc:     	movq	0x10(%rdi), %rcx
14085ee00:     	leaq	0x550(%rbp), %rdx
14085ee07:     	callq	0x145756dd1 <.text+0x5755dd1>
14085ee0c:     	movl	%r15d, 0x28(%rdi)
14085ee10:     	movb	$0x1, 0x30(%rdi)
14085ee14:     	movl	%r15d, 0x2c(%rdi)
14085ee18:     	movq	%rsi, %rcx
14085ee1b:     	callq	0x140f23f70 <.text+0xf22f70>
14085ee20:     	movq	%rsi, %rcx
14085ee23:     	callq	0x140f256e0 <.text+0xf246e0>
14085ee28:     	callq	0x140002200 <.text+0x1200>
14085ee2d:     	movl	$0x700, %ecx            # imm = 0x700
14085ee32:     	movl	$0x8, %edx
14085ee37:     	callq	0x1400021c0 <.text+0x11c0>
14085ee3c:     	testq	%rax, %rax
14085ee3f:     	je	0x1408605c5 <.text+0x85f5c5>
14085ee45:     	movq	%rax, 0x1600(%rbp)
14085ee4c:     	movq	$-0x1, 0x550(%rbp)
14085ee57:     	movl	$0x0, 0x7d8(%rbp)
14085ee61:     	movb	$0x0, 0x7dc(%rbp)
14085ee68:     	callq	0x140002200 <.text+0x1200>
14085ee6d:     	movl	$0x290, %ecx            # imm = 0x290
14085ee72:     	movl	$0x8, %edx
14085ee77:     	callq	0x1400021c0 <.text+0x11c0>
14085ee7c:     	testq	%rax, %rax
14085ee7f:     	je	0x1408605d6 <.text+0x85f5d6>
14085ee85:     	movq	%rax, %rdi
14085ee88:     	leaq	0x550(%rbp), %rdx
14085ee8f:     	movl	$0x290, %r8d            # imm = 0x290
14085ee95:     	movq	%rax, %rcx
14085ee98:     	callq	0x145756ddd <.text+0x5755ddd>
14085ee9d:     	nop
14085ee9e:     	leaq	0x51ad83b(%rip), %r8    # 0x145a0c6e0
14085eea5:     	leaq	0x4e0(%rbp), %rcx
14085eeac:     	movq	%rdi, %rdx
14085eeaf:     	callq	0x144e1b980 <.text+0x4e1a980>
14085eeb4:     	nop
14085eeb5:     	movq	$-0x1, 0x550(%rbp)
14085eec0:     	movl	$0x0, 0x730(%rbp)
14085eeca:     	movb	$0x0, 0x734(%rbp)
14085eed1:     	callq	0x140002200 <.text+0x1200>
14085eed6:     	movl	$0x1e8, %ecx            # imm = 0x1E8
14085eedb:     	movl	$0x8, %edx
14085eee0:     	callq	0x1400021c0 <.text+0x11c0>
14085eee5:     	testq	%rax, %rax
14085eee8:     	je	0x1408605eb <.text+0x85f5eb>
14085eeee:     	movq	%rax, %rdi
14085eef1:     	leaq	0x550(%rbp), %rdx
14085eef8:     	movl	$0x1e8, %r8d            # imm = 0x1E8
14085eefe:     	movq	%rax, %rcx
14085ef01:     	callq	0x145756ddd <.text+0x5755ddd>
14085ef06:     	nop
14085ef07:     	leaq	0x51af7fa(%rip), %r8    # 0x145a0e708
14085ef0e:     	leaq	0x470(%rbp), %rcx
14085ef15:     	movq	%rdi, %rdx
14085ef18:     	callq	0x144e1b980 <.text+0x4e1a980>
14085ef1d:     	nop
14085ef1e:     	movq	$-0x1, 0x550(%rbp)
14085ef29:     	movl	$0x0, 0x1588(%rbp)
14085ef33:     	movb	$0x0, 0x158c(%rbp)
14085ef3a:     	callq	0x140002200 <.text+0x1200>
14085ef3f:     	movl	$0x1040, %ecx           # imm = 0x1040
14085ef44:     	movl	$0x8, %edx
14085ef49:     	callq	0x1400021c0 <.text+0x11c0>
14085ef4e:     	testq	%rax, %rax
14085ef51:     	je	0x140860600 <.text+0x85f600>
14085ef57:     	movq	%rax, %rdi
14085ef5a:     	leaq	0x550(%rbp), %rdx
14085ef61:     	movl	$0x1040, %r8d           # imm = 0x1040
14085ef67:     	movq	%rax, %rcx
14085ef6a:     	callq	0x145756ddd <.text+0x5755ddd>
14085ef6f:     	nop
14085ef70:     	leaq	0x51ad421(%rip), %r8    # 0x145a0c398
14085ef77:     	leaq	0x400(%rbp), %rcx
14085ef7e:     	movq	%rdi, %rdx
14085ef81:     	callq	0x144e1b980 <.text+0x4e1a980>
14085ef86:     	nop
14085ef87:     	movq	$-0x1, 0x550(%rbp)
14085ef92:     	movl	$0x0, 0x1320(%rbp)
14085ef9c:     	movb	$0x0, 0x1324(%rbp)
14085efa3:     	callq	0x140002200 <.text+0x1200>
14085efa8:     	movl	$0xdd8, %ecx            # imm = 0xDD8
14085efad:     	movl	$0x8, %edx
14085efb2:     	callq	0x1400021c0 <.text+0x11c0>
14085efb7:     	testq	%rax, %rax
14085efba:     	je	0x140860615 <.text+0x85f615>
14085efc0:     	movq	%rax, %rdi
14085efc3:     	leaq	0x550(%rbp), %rdx
14085efca:     	movl	$0xdd8, %r8d            # imm = 0xDD8
14085efd0:     	movq	%rax, %rcx
14085efd3:     	callq	0x145756ddd <.text+0x5755ddd>
14085efd8:     	nop
14085efd9:     	leaq	0x51ad310(%rip), %r8    # 0x145a0c2f0
14085efe0:     	leaq	0x390(%rbp), %rcx
14085efe7:     	movq	%rdi, %rdx
14085efea:     	callq	0x144e1b980 <.text+0x4e1a980>
14085efef:     	nop
14085eff0:     	movq	$-0x1, 0x550(%rbp)
14085effb:     	movl	$0x0, 0x1208(%rbp)
14085f005:     	movb	$0x0, 0x120c(%rbp)
14085f00c:     	callq	0x140002200 <.text+0x1200>
14085f011:     	movl	$0xcc0, %ecx            # imm = 0xCC0
14085f016:     	movl	$0x8, %edx
14085f01b:     	callq	0x1400021c0 <.text+0x11c0>
14085f020:     	testq	%rax, %rax
14085f023:     	je	0x14086062a <.text+0x85f62a>
14085f029:     	movq	%rax, %rdi
14085f02c:     	leaq	0x550(%rbp), %rdx
14085f033:     	movl	$0xcc0, %r8d            # imm = 0xCC0
14085f039:     	movq	%rax, %rcx
14085f03c:     	callq	0x145756ddd <.text+0x5755ddd>
14085f041:     	nop
14085f042:     	leaq	0x51ad547(%rip), %r8    # 0x145a0c590
14085f049:     	leaq	0x320(%rbp), %rcx
14085f050:     	movq	%rdi, %rdx
14085f053:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f058:     	nop
14085f059:     	movq	$-0x1, 0x550(%rbp)
14085f064:     	movl	$0x0, 0x1208(%rbp)
14085f06e:     	movb	$0x0, 0x120c(%rbp)
14085f075:     	callq	0x140002200 <.text+0x1200>
14085f07a:     	movl	$0xcc0, %ecx            # imm = 0xCC0
14085f07f:     	movl	$0x8, %edx
14085f084:     	callq	0x1400021c0 <.text+0x11c0>
14085f089:     	testq	%rax, %rax
14085f08c:     	je	0x14086063f <.text+0x85f63f>
14085f092:     	movq	%rax, %rdi
14085f095:     	leaq	0x550(%rbp), %rdx
14085f09c:     	movl	$0xcc0, %r8d            # imm = 0xCC0
14085f0a2:     	movq	%rax, %rcx
14085f0a5:     	callq	0x145756ddd <.text+0x5755ddd>
14085f0aa:     	nop
14085f0ab:     	leaq	0x51ad586(%rip), %r8    # 0x145a0c638
14085f0b2:     	leaq	0x2b0(%rbp), %rcx
14085f0b9:     	movq	%rdi, %rdx
14085f0bc:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f0c1:     	nop
14085f0c2:     	callq	0x140002200 <.text+0x1200>
14085f0c7:     	movl	$0x60, %ecx
14085f0cc:     	movl	$0x8, %edx
14085f0d1:     	callq	0x1400021c0 <.text+0x11c0>
14085f0d6:     	testq	%rax, %rax
14085f0d9:     	je	0x140860654 <.text+0x85f654>
14085f0df:     	movq	$-0x1, (%rax)
14085f0e6:     	movl	$0x0, 0x58(%rax)
14085f0ed:     	movb	$0x0, 0x5c(%rax)
14085f0f1:     	leaq	0x51ad690(%rip), %r8    # 0x145a0c788
14085f0f8:     	leaq	0x240(%rbp), %rcx
14085f0ff:     	movq	%rax, %rdx
14085f102:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f107:     	nop
14085f108:     	movq	$-0x1, 0x550(%rbp)
14085f113:     	movl	$0x0, 0x1210(%rbp)
14085f11d:     	movb	$0x0, 0x1214(%rbp)
14085f124:     	callq	0x140002200 <.text+0x1200>
14085f129:     	movl	$0xcc8, %ecx            # imm = 0xCC8
14085f12e:     	movl	$0x8, %edx
14085f133:     	callq	0x1400021c0 <.text+0x11c0>
14085f138:     	testq	%rax, %rax
14085f13b:     	je	0x140860669 <.text+0x85f669>
14085f141:     	movq	%rax, %rdi
14085f144:     	leaq	0x550(%rbp), %rdx
14085f14b:     	movl	$0xcc8, %r8d            # imm = 0xCC8
14085f151:     	movq	%rax, %rcx
14085f154:     	callq	0x145756ddd <.text+0x5755ddd>
14085f159:     	nop
14085f15a:     	leaq	0x51ad2df(%rip), %r8    # 0x145a0c440
14085f161:     	leaq	0x1d0(%rbp), %rcx
14085f168:     	movq	%rdi, %rdx
14085f16b:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f170:     	nop
14085f171:     	movq	$-0x1, 0x550(%rbp)
14085f17c:     	movl	$0x0, 0x898(%rbp)
14085f186:     	movb	$0x0, 0x89c(%rbp)
14085f18d:     	callq	0x140002200 <.text+0x1200>
14085f192:     	movl	$0x350, %ecx            # imm = 0x350
14085f197:     	movl	$0x8, %edx
14085f19c:     	callq	0x1400021c0 <.text+0x11c0>
14085f1a1:     	testq	%rax, %rax
14085f1a4:     	je	0x14086067e <.text+0x85f67e>
14085f1aa:     	movq	%rax, %rdi
14085f1ad:     	leaq	0x550(%rbp), %rdx
14085f1b4:     	movl	$0x350, %r8d            # imm = 0x350
14085f1ba:     	movq	%rax, %rcx
14085f1bd:     	callq	0x145756ddd <.text+0x5755ddd>
14085f1c2:     	nop
14085f1c3:     	leaq	0x51aef56(%rip), %r8    # 0x145a0e120
14085f1ca:     	leaq	0x160(%rbp), %rcx
14085f1d1:     	movq	%rdi, %rdx
14085f1d4:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f1d9:     	nop
14085f1da:     	movq	$0x2, 0x710(%rbp)
14085f1e5:     	movl	$0x0, 0x550(%rbp)
14085f1ef:     	movb	$0x0, 0x554(%rbp)
14085f1f6:     	callq	0x140002200 <.text+0x1200>
14085f1fb:     	movl	$0x1e0, %ecx            # imm = 0x1E0
14085f200:     	movl	$0x8, %edx
14085f205:     	callq	0x1400021c0 <.text+0x11c0>
14085f20a:     	testq	%rax, %rax
14085f20d:     	je	0x140860693 <.text+0x85f693>
14085f213:     	movq	%rax, %rdi
14085f216:     	leaq	0x550(%rbp), %rdx
14085f21d:     	movl	$0x1e0, %r8d            # imm = 0x1E0
14085f223:     	movq	%rax, %rcx
14085f226:     	callq	0x145756ddd <.text+0x5755ddd>
14085f22b:     	nop
14085f22c:     	leaq	0x51aee45(%rip), %r8    # 0x145a0e078
14085f233:     	leaq	0xf0(%rbp), %rcx
14085f23a:     	movq	%rdi, %rdx
14085f23d:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f242:     	nop
14085f243:     	callq	0x140002200 <.text+0x1200>
14085f248:     	movl	$0x28, %ecx
14085f24d:     	movl	$0x8, %edx
14085f252:     	callq	0x1400021c0 <.text+0x11c0>
14085f257:     	testq	%rax, %rax
14085f25a:     	je	0x1408606a5 <.text+0x85f6a5>
14085f260:     	movq	$0x0, (%rax)
14085f267:     	movl	$0x0, 0x20(%rax)
14085f26e:     	movb	$0x0, 0x24(%rax)
14085f272:     	leaq	0x51aecaf(%rip), %r8    # 0x145a0df28
14085f279:     	leaq	0x80(%rbp), %rcx
14085f280:     	movq	%rax, %rdx
14085f283:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f288:     	nop
14085f289:     	movq	$-0x1, 0x640(%rbp)
14085f294:     	movl	$0x0, 0x7a0(%rbp)
14085f29e:     	movb	$0x0, 0x7a4(%rbp)
14085f2a5:     	callq	0x140002200 <.text+0x1200>
14085f2aa:     	movl	$0x258, %ecx            # imm = 0x258
14085f2af:     	movl	$0x8, %edx
14085f2b4:     	callq	0x1400021c0 <.text+0x11c0>
14085f2b9:     	testq	%rax, %rax
14085f2bc:     	je	0x1408606b7 <.text+0x85f6b7>
14085f2c2:     	movq	%rax, %rdi
14085f2c5:     	leaq	0x550(%rbp), %rdx
14085f2cc:     	movl	$0x258, %r8d            # imm = 0x258
14085f2d2:     	movq	%rax, %rcx
14085f2d5:     	callq	0x145756ddd <.text+0x5755ddd>
14085f2da:     	nop
14085f2db:     	leaq	0x51aef8e(%rip), %r8    # 0x145a0e270
14085f2e2:     	leaq	0x10(%rbp), %rcx
14085f2e6:     	movq	%rdi, %rdx
14085f2e9:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f2ee:     	nop
14085f2ef:     	callq	0x140002200 <.text+0x1200>
14085f2f4:     	movl	$0x80, %ecx
14085f2f9:     	movl	$0x8, %edx
14085f2fe:     	callq	0x1400021c0 <.text+0x11c0>
14085f303:     	testq	%rax, %rax
14085f306:     	je	0x1408606c9 <.text+0x85f6c9>
14085f30c:     	movq	$-0x1, (%rax)
14085f313:     	movl	$0x0, 0x78(%rax)
14085f31a:     	movb	$0x0, 0x7c(%rax)
14085f31e:     	leaq	0x51aecab(%rip), %r8    # 0x145a0dfd0
14085f325:     	leaq	-0x60(%rbp), %rcx
14085f329:     	movq	%rax, %rdx
14085f32c:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f331:     	nop
14085f332:     	movq	$0x2, 0x550(%rbp)
14085f33d:     	movl	$0x0, 0x720(%rbp)
14085f347:     	movb	$0x0, 0x724(%rbp)
14085f34e:     	callq	0x140002200 <.text+0x1200>
14085f353:     	movl	$0x1d8, %ecx            # imm = 0x1D8
14085f358:     	movl	$0x8, %edx
14085f35d:     	callq	0x1400021c0 <.text+0x11c0>
14085f362:     	testq	%rax, %rax
14085f365:     	je	0x1408606db <.text+0x85f6db>
14085f36b:     	movq	%rax, %rdi
14085f36e:     	leaq	0x550(%rbp), %rdx
14085f375:     	movl	$0x1d8, %r8d            # imm = 0x1D8
14085f37b:     	movq	%rax, %rcx
14085f37e:     	callq	0x145756ddd <.text+0x5755ddd>
14085f383:     	nop
14085f384:     	leaq	0x51af22d(%rip), %r8    # 0x145a0e5b8
14085f38b:     	leaq	0x1590(%rbp), %rcx
14085f392:     	movq	%rdi, %rdx
14085f395:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f39a:     	nop
14085f39b:     	callq	0x140002200 <.text+0x1200>
14085f3a0:     	movl	$0x150, %ecx            # imm = 0x150
14085f3a5:     	movl	$0x8, %edx
14085f3aa:     	callq	0x1400021c0 <.text+0x11c0>
14085f3af:     	testq	%rax, %rax
14085f3b2:     	je	0x1408606ed <.text+0x85f6ed>
14085f3b8:     	movl	$0x0, (%rax)
14085f3be:     	movb	$0x0, 0x4(%rax)
14085f3c2:     	movq	$-0x1, 0x100(%rax)
14085f3cd:     	leaq	0x51aef44(%rip), %r8    # 0x145a0e318
14085f3d4:     	leaq	0x1610(%rbp), %rcx
14085f3db:     	movq	%rax, %rdx
14085f3de:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f3e3:     	nop
14085f3e4:     	movq	$-0x1, 0x550(%rbp)
14085f3ef:     	movl	$0x0, 0x828(%rbp)
14085f3f9:     	movb	$0x0, 0x82c(%rbp)
14085f400:     	callq	0x140002200 <.text+0x1200>
14085f405:     	movl	$0x2e0, %ecx            # imm = 0x2E0
14085f40a:     	movl	$0x8, %edx
14085f40f:     	callq	0x1400021c0 <.text+0x11c0>
14085f414:     	testq	%rax, %rax
14085f417:     	je	0x1408606ff <.text+0x85f6ff>
14085f41d:     	movq	%rax, %rdi
14085f420:     	leaq	0x550(%rbp), %rdx
14085f427:     	movl	$0x2e0, %r8d            # imm = 0x2E0
14085f42d:     	movq	%rax, %rcx
14085f430:     	callq	0x145756ddd <.text+0x5755ddd>
14085f435:     	nop
14085f436:     	leaq	0x51ad0ab(%rip), %r8    # 0x145a0c4e8
14085f43d:     	leaq	0x550(%rbp), %rcx
14085f444:     	movq	%rdi, %rdx
14085f447:     	callq	0x144e1b980 <.text+0x4e1a980>
14085f44c:     	nop
14085f44d:     	movups	0x540(%rbp), %xmm0
14085f454:     	movq	0x1600(%rbp), %rax
14085f45b:     	movups	%xmm0, 0x60(%rax)
14085f45f:     	movups	0x530(%rbp), %xmm0
14085f466:     	movups	%xmm0, 0x50(%rax)
14085f46a:     	movups	0x520(%rbp), %xmm0
14085f471:     	movups	%xmm0, 0x40(%rax)
14085f475:     	movups	0x4e0(%rbp), %xmm0
14085f47c:     	movups	0x4f0(%rbp), %xmm1
14085f483:     	movups	0x500(%rbp), %xmm2
14085f48a:     	movups	0x510(%rbp), %xmm3
14085f491:     	movups	%xmm3, 0x30(%rax)
14085f495:     	movups	%xmm2, 0x20(%rax)
14085f499:     	movups	%xmm1, 0x10(%rax)
14085f49d:     	movups	%xmm0, (%rax)
14085f4a0:     	movups	0x470(%rbp), %xmm0
14085f4a7:     	movups	0x480(%rbp), %xmm1
14085f4ae:     	movups	0x490(%rbp), %xmm2
14085f4b5:     	movups	0x4a0(%rbp), %xmm3
14085f4bc:     	movups	%xmm0, 0x70(%rax)
14085f4c0:     	movups	%xmm1, 0x80(%rax)
14085f4c7:     	movups	%xmm2, 0x90(%rax)
14085f4ce:     	movups	%xmm3, 0xa0(%rax)
14085f4d5:     	movups	0x4b0(%rbp), %xmm0
14085f4dc:     	movups	%xmm0, 0xb0(%rax)
14085f4e3:     	movups	0x4c0(%rbp), %xmm0
14085f4ea:     	movups	%xmm0, 0xc0(%rax)
14085f4f1:     	movups	0x4d0(%rbp), %xmm0
14085f4f8:     	movups	%xmm0, 0xd0(%rax)
14085f4ff:     	movups	0x460(%rbp), %xmm0
14085f506:     	movups	%xmm0, 0x140(%rax)
14085f50d:     	movups	0x450(%rbp), %xmm0
14085f514:     	movups	%xmm0, 0x130(%rax)
14085f51b:     	movups	0x440(%rbp), %xmm0
14085f522:     	movups	%xmm0, 0x120(%rax)
14085f529:     	movups	0x400(%rbp), %xmm0
14085f530:     	movups	0x410(%rbp), %xmm1
14085f537:     	movups	0x420(%rbp), %xmm2
14085f53e:     	movups	0x430(%rbp), %xmm3
14085f545:     	movups	%xmm3, 0x110(%rax)
14085f54c:     	movups	%xmm2, 0x100(%rax)
14085f553:     	movups	%xmm1, 0xf0(%rax)
14085f55a:     	movups	%xmm0, 0xe0(%rax)
14085f561:     	movups	0x390(%rbp), %xmm0
14085f568:     	movups	0x3a0(%rbp), %xmm1
14085f56f:     	movups	0x3b0(%rbp), %xmm2
14085f576:     	movups	0x3c0(%rbp), %xmm3
14085f57d:     	movups	%xmm0, 0x150(%rax)
14085f584:     	movups	%xmm1, 0x160(%rax)
14085f58b:     	movups	%xmm2, 0x170(%rax)
14085f592:     	movups	%xmm3, 0x180(%rax)
14085f599:     	movups	0x3d0(%rbp), %xmm0
14085f5a0:     	movups	%xmm0, 0x190(%rax)
14085f5a7:     	movups	0x3e0(%rbp), %xmm0
14085f5ae:     	movups	%xmm0, 0x1a0(%rax)
14085f5b5:     	movups	0x3f0(%rbp), %xmm0
14085f5bc:     	movups	%xmm0, 0x1b0(%rax)
14085f5c3:     	movups	0x320(%rbp), %xmm0
14085f5ca:     	movups	0x330(%rbp), %xmm1
14085f5d1:     	movups	0x340(%rbp), %xmm2
14085f5d8:     	movups	0x350(%rbp), %xmm3
14085f5df:     	movups	%xmm0, 0x1c0(%rax)
14085f5e6:     	movups	%xmm1, 0x1d0(%rax)
14085f5ed:     	movups	%xmm2, 0x1e0(%rax)
14085f5f4:     	movups	%xmm3, 0x1f0(%rax)
14085f5fb:     	movups	0x360(%rbp), %xmm0
14085f602:     	movups	%xmm0, 0x200(%rax)
14085f609:     	movups	0x380(%rbp), %xmm0
14085f610:     	movups	%xmm0, 0x220(%rax)
14085f617:     	movups	0x370(%rbp), %xmm0
14085f61e:     	movups	%xmm0, 0x210(%rax)
14085f625:     	movups	0x310(%rbp), %xmm0
14085f62c:     	movups	%xmm0, 0x290(%rax)
14085f633:     	movups	0x300(%rbp), %xmm0
14085f63a:     	movups	%xmm0, 0x280(%rax)
14085f641:     	movups	0x2f0(%rbp), %xmm0
14085f648:     	movups	%xmm0, 0x270(%rax)
14085f64f:     	movups	0x2b0(%rbp), %xmm0
14085f656:     	movups	0x2c0(%rbp), %xmm1
14085f65d:     	movups	0x2d0(%rbp), %xmm2
14085f664:     	movups	0x2e0(%rbp), %xmm3
14085f66b:     	movups	%xmm3, 0x260(%rax)
14085f672:     	movups	%xmm2, 0x250(%rax)
14085f679:     	movups	%xmm1, 0x240(%rax)
14085f680:     	movups	%xmm0, 0x230(%rax)
14085f687:     	movups	0x240(%rbp), %xmm0
14085f68e:     	movups	0x250(%rbp), %xmm1
14085f695:     	movups	0x260(%rbp), %xmm2
14085f69c:     	movups	0x270(%rbp), %xmm3
14085f6a3:     	movups	%xmm0, 0x2a0(%rax)
14085f6aa:     	movups	%xmm1, 0x2b0(%rax)
14085f6b1:     	movups	%xmm2, 0x2c0(%rax)
14085f6b8:     	movups	%xmm3, 0x2d0(%rax)
14085f6bf:     	movups	0x280(%rbp), %xmm0
14085f6c6:     	movups	%xmm0, 0x2e0(%rax)
14085f6cd:     	movups	0x290(%rbp), %xmm0
14085f6d4:     	movups	%xmm0, 0x2f0(%rax)
14085f6db:     	movups	0x2a0(%rbp), %xmm0
14085f6e2:     	movups	%xmm0, 0x300(%rax)
14085f6e9:     	movups	0x1d0(%rbp), %xmm0
14085f6f0:     	movups	0x1e0(%rbp), %xmm1
14085f6f7:     	movups	0x1f0(%rbp), %xmm2
14085f6fe:     	movups	0x200(%rbp), %xmm3
14085f705:     	movups	%xmm0, 0x310(%rax)
14085f70c:     	movups	%xmm1, 0x320(%rax)
14085f713:     	movups	%xmm2, 0x330(%rax)
14085f71a:     	movups	%xmm3, 0x340(%rax)
14085f721:     	movups	0x210(%rbp), %xmm0
14085f728:     	movups	%xmm0, 0x350(%rax)
14085f72f:     	movups	0x220(%rbp), %xmm0
14085f736:     	movups	%xmm0, 0x360(%rax)
14085f73d:     	movups	0x230(%rbp), %xmm0
14085f744:     	movups	%xmm0, 0x370(%rax)
14085f74b:     	movups	0x160(%rbp), %xmm0
14085f752:     	movups	0x170(%rbp), %xmm1
14085f759:     	movups	0x180(%rbp), %xmm2
14085f760:     	movups	0x190(%rbp), %xmm3
14085f767:     	movups	%xmm0, 0x380(%rax)
14085f76e:     	movups	%xmm1, 0x390(%rax)
14085f775:     	movups	%xmm2, 0x3a0(%rax)
14085f77c:     	movups	%xmm3, 0x3b0(%rax)
14085f783:     	movups	0x1a0(%rbp), %xmm0
14085f78a:     	movups	%xmm0, 0x3c0(%rax)
14085f791:     	movups	0x1b0(%rbp), %xmm0
14085f798:     	movups	%xmm0, 0x3d0(%rax)
14085f79f:     	movups	0x1c0(%rbp), %xmm0
14085f7a6:     	movups	%xmm0, 0x3e0(%rax)
14085f7ad:     	movups	0xf0(%rbp), %xmm0
14085f7b4:     	movups	0x100(%rbp), %xmm1
14085f7bb:     	movups	0x110(%rbp), %xmm2
14085f7c2:     	movups	0x120(%rbp), %xmm3
14085f7c9:     	movups	%xmm0, 0x3f0(%rax)
14085f7d0:     	movups	%xmm1, 0x400(%rax)
14085f7d7:     	movups	%xmm2, 0x410(%rax)
14085f7de:     	movups	%xmm3, 0x420(%rax)
14085f7e5:     	movups	0x130(%rbp), %xmm0
14085f7ec:     	movups	%xmm0, 0x430(%rax)
14085f7f3:     	movups	0x140(%rbp), %xmm0
14085f7fa:     	movups	%xmm0, 0x440(%rax)
14085f801:     	movups	0x150(%rbp), %xmm0
14085f808:     	movups	%xmm0, 0x450(%rax)
14085f80f:     	movups	0x80(%rbp), %xmm0
14085f816:     	movups	0x90(%rbp), %xmm1
14085f81d:     	movups	0xa0(%rbp), %xmm2
14085f824:     	movups	0xb0(%rbp), %xmm3
14085f82b:     	movups	%xmm0, 0x460(%rax)
14085f832:     	movups	%xmm1, 0x470(%rax)
14085f839:     	movups	%xmm2, 0x480(%rax)
14085f840:     	movups	%xmm3, 0x490(%rax)
14085f847:     	movups	0xc0(%rbp), %xmm0
14085f84e:     	movups	%xmm0, 0x4a0(%rax)
14085f855:     	movups	0xd0(%rbp), %xmm0
14085f85c:     	movups	%xmm0, 0x4b0(%rax)
14085f863:     	movups	0xe0(%rbp), %xmm0
14085f86a:     	movups	%xmm0, 0x4c0(%rax)
14085f871:     	movups	0x10(%rbp), %xmm0
14085f875:     	movups	0x20(%rbp), %xmm1
14085f879:     	movups	0x30(%rbp), %xmm2
14085f87d:     	movups	0x40(%rbp), %xmm3
14085f881:     	movups	%xmm0, 0x4d0(%rax)
14085f888:     	movups	%xmm1, 0x4e0(%rax)
14085f88f:     	movups	%xmm2, 0x4f0(%rax)
14085f896:     	movups	%xmm3, 0x500(%rax)
14085f89d:     	movups	0x50(%rbp), %xmm0
14085f8a1:     	movups	%xmm0, 0x510(%rax)
14085f8a8:     	movups	0x60(%rbp), %xmm0
14085f8ac:     	movups	%xmm0, 0x520(%rax)
14085f8b3:     	movups	0x70(%rbp), %xmm0
14085f8b7:     	movups	%xmm0, 0x530(%rax)
14085f8be:     	movups	-0x60(%rbp), %xmm0
14085f8c2:     	movups	-0x50(%rbp), %xmm1
14085f8c6:     	movups	-0x40(%rbp), %xmm2
14085f8ca:     	movups	-0x30(%rbp), %xmm3
14085f8ce:     	movups	%xmm0, 0x540(%rax)
14085f8d5:     	movups	%xmm1, 0x550(%rax)
14085f8dc:     	movups	%xmm2, 0x560(%rax)
14085f8e3:     	movups	%xmm3, 0x570(%rax)
14085f8ea:     	movups	-0x20(%rbp), %xmm0
14085f8ee:     	movups	%xmm0, 0x580(%rax)
14085f8f5:     	movups	-0x10(%rbp), %xmm0
14085f8f9:     	movups	%xmm0, 0x590(%rax)
14085f900:     	movups	(%rbp), %xmm0
14085f904:     	movups	%xmm0, 0x5a0(%rax)
14085f90b:     	movups	0x1590(%rbp), %xmm0
14085f912:     	movups	0x15a0(%rbp), %xmm1
14085f919:     	movups	0x15b0(%rbp), %xmm2
14085f920:     	movups	0x15c0(%rbp), %xmm3
14085f927:     	movups	%xmm0, 0x5b0(%rax)
14085f92e:     	movups	%xmm1, 0x5c0(%rax)
14085f935:     	movups	%xmm2, 0x5d0(%rax)
14085f93c:     	movups	%xmm3, 0x5e0(%rax)
14085f943:     	movups	0x15d0(%rbp), %xmm0
14085f94a:     	movups	%xmm0, 0x5f0(%rax)
14085f951:     	movups	0x15e0(%rbp), %xmm0
14085f958:     	movups	%xmm0, 0x600(%rax)
14085f95f:     	movups	0x15f0(%rbp), %xmm0
14085f966:     	movups	%xmm0, 0x610(%rax)
14085f96d:     	movups	0x1610(%rbp), %xmm0
14085f974:     	movups	0x1620(%rbp), %xmm1
14085f97b:     	movups	0x1630(%rbp), %xmm2
14085f982:     	movups	0x1640(%rbp), %xmm3
14085f989:     	movups	%xmm0, 0x620(%rax)
14085f990:     	movups	%xmm1, 0x630(%rax)
14085f997:     	movups	%xmm2, 0x640(%rax)
14085f99e:     	movups	%xmm3, 0x650(%rax)
14085f9a5:     	movups	0x1650(%rbp), %xmm0
14085f9ac:     	movups	%xmm0, 0x660(%rax)
14085f9b3:     	movups	0x1660(%rbp), %xmm0
14085f9ba:     	movups	%xmm0, 0x670(%rax)
14085f9c1:     	movups	0x1670(%rbp), %xmm0
14085f9c8:     	movups	%xmm0, 0x680(%rax)
14085f9cf:     	movups	0x550(%rbp), %xmm0
14085f9d6:     	movups	0x560(%rbp), %xmm1
14085f9dd:     	movups	0x570(%rbp), %xmm2
14085f9e4:     	movups	0x580(%rbp), %xmm3
14085f9eb:     	movups	%xmm0, 0x690(%rax)
14085f9f2:     	movups	%xmm1, 0x6a0(%rax)
14085f9f9:     	movups	%xmm2, 0x6b0(%rax)
14085fa00:     	movups	%xmm3, 0x6c0(%rax)
14085fa07:     	movups	0x590(%rbp), %xmm0
14085fa0e:     	movups	%xmm0, 0x6d0(%rax)
14085fa15:     	movups	0x5b0(%rbp), %xmm0
14085fa1c:     	movups	%xmm0, 0x6f0(%rax)
14085fa23:     	movups	0x5a0(%rbp), %xmm0
14085fa2a:     	movups	%xmm0, 0x6e0(%rax)
14085fa31:     	movq	$0x10, 0x558(%rbp)
14085fa3c:     	movq	%rax, 0x560(%rbp)
14085fa43:     	movq	$0x10, 0x568(%rbp)
14085fa4e:     	movq	$0x0, 0x570(%rbp)
14085fa59:     	movq	$0x8, 0x578(%rbp)
14085fa64:     	xorps	%xmm0, %xmm0
14085fa67:     	movups	%xmm0, 0x580(%rbp)
14085fa6e:     	movq	$-0x1, 0x550(%rbp)
14085fa79:     	leaq	0x588(%rbp), %rcx
14085fa80:     	callq	0x144e8e920 <.text+0x4e8d920>
14085fa85:     	nop
14085fa86:     	movups	0x5b0(%rbp), %xmm0
14085fa8d:     	movaps	%xmm0, 0x1670(%rbp)
14085fa94:     	movups	0x5a0(%rbp), %xmm0
14085fa9b:     	movaps	%xmm0, 0x1660(%rbp)
14085faa2:     	movups	0x590(%rbp), %xmm0
14085faa9:     	movaps	%xmm0, 0x1650(%rbp)
14085fab0:     	movdqu	0x550(%rbp), %xmm0
14085fab8:     	movdqu	0x560(%rbp), %xmm1
14085fac0:     	movdqu	0x570(%rbp), %xmm2
14085fac8:     	movdqu	0x580(%rbp), %xmm3
14085fad0:     	movdqa	%xmm3, 0x1640(%rbp)
14085fad8:     	movdqa	%xmm2, 0x1630(%rbp)
14085fae0:     	movdqa	%xmm1, 0x1620(%rbp)
14085fae8:     	movdqa	%xmm0, 0x1610(%rbp)
14085faf0:     	leaq	0x1610(%rbp), %rdx
14085faf7:     	movq	%rsi, %rcx
14085fafa:     	callq	0x140f29810 <.text+0xf28810>
14085faff:     	movq	%rsi, %rcx
14085fb02:     	callq	0x140f1dbe0 <.text+0xf1cbe0>
14085fb07:     	movq	$-0x1, 0x650(%rbp)
14085fb12:     	movl	$0x0, 0x550(%rbp)
14085fb1c:     	movb	$0x0, 0x554(%rbp)
14085fb23:     	callq	0x140002200 <.text+0x1200>
14085fb28:     	movl	$0x140, %ecx            # imm = 0x140
14085fb2d:     	movl	$0x8, %edx
14085fb32:     	callq	0x1400021c0 <.text+0x11c0>
14085fb37:     	testq	%rax, %rax
14085fb3a:     	je	0x140860711 <.text+0x85f711>
14085fb40:     	movq	%rax, %rdi
14085fb43:     	leaq	0x550(%rbp), %rdx
14085fb4a:     	movl	$0x140, %r8d            # imm = 0x140
14085fb50:     	movq	%rax, %rcx
14085fb53:     	callq	0x145756ddd <.text+0x5755ddd>
14085fb58:     	leaq	0x51ae861(%rip), %r8    # 0x145a0e3c0
14085fb5f:     	leaq	0x550(%rbp), %rcx
14085fb66:     	movq	%rdi, %rdx
14085fb69:     	callq	0x144e1b980 <.text+0x4e1a980>
14085fb6e:     	nop
14085fb6f:     	movq	0x717ffda(%rip), %rcx   # 0x1479dfb50
14085fb76:     	leaq	0x52c7a73(%rip), %r8    # 0x145b275f0
14085fb7d:     	leaq	0x160f(%rbp), %rdx
14085fb84:     	callq	0x140f94df0 <.text+0xf93df0>
14085fb89:     	nop
14085fb8a:     	movq	%rdx, %r8
14085fb8d:     	leaq	0x550(%rbp), %rcx
14085fb94:     	movq	%rax, %rdx
14085fb97:     	callq	0x1410e0880 <.text+0x10df880>
14085fb9c:     	nop
14085fb9d:     	movups	0x5b0(%rbp), %xmm0
14085fba4:     	movaps	%xmm0, 0x1670(%rbp)
14085fbab:     	movups	0x5a0(%rbp), %xmm0
14085fbb2:     	movaps	%xmm0, 0x1660(%rbp)
14085fbb9:     	movups	0x590(%rbp), %xmm0
14085fbc0:     	movaps	%xmm0, 0x1650(%rbp)
14085fbc7:     	movups	0x550(%rbp), %xmm0
14085fbce:     	movups	0x560(%rbp), %xmm1
14085fbd5:     	movups	0x570(%rbp), %xmm2
14085fbdc:     	movups	0x580(%rbp), %xmm3
14085fbe3:     	movaps	%xmm3, 0x1640(%rbp)
14085fbea:     	movaps	%xmm2, 0x1630(%rbp)
14085fbf1:     	movaps	%xmm1, 0x1620(%rbp)
14085fbf8:     	movaps	%xmm0, 0x1610(%rbp)
14085fbff:     	leaq	0x1610(%rbp), %rdx
14085fc06:     	movq	%rsi, %rcx
14085fc09:     	callq	0x140f29810 <.text+0xf28810>
14085fc0e:     	movq	%rsi, %rcx
14085fc11:     	callq	0x140f24350 <.text+0xf23350>
14085fc16:     	movq	%rsi, %rcx
14085fc19:     	callq	0x140f24160 <.text+0xf23160>
14085fc1e:     	movq	%rsi, %rcx
14085fc21:     	callq	0x140f1f650 <.text+0xf1e650>
14085fc26:     	movaps	0x16a0(%rbp), %xmm6
14085fc2d:     	movaps	0x16b0(%rbp), %xmm7
14085fc34:     	addq	$0x1740, %rsp           # imm = 0x1740
14085fc3b:     	popq	%rbx
14085fc3c:     	popq	%rdi
14085fc3d:     	popq	%rsi
14085fc3e:     	popq	%r12
14085fc40:     	popq	%r14
14085fc42:     	popq	%r15
14085fc44:     	popq	%rbp
14085fc45:     	retq
14085fc46:     	movq	-0x8(%r9), %rcx
14085fc4a:     	movq	%rcx, 0x5b8(%rbp)
14085fc51:     	movups	-0x18(%r9), %xmm0
14085fc56:     	movups	%xmm0, 0x5a8(%rbp)
14085fc5d:     	movups	-0x28(%r9), %xmm0
14085fc62:     	movups	%xmm0, 0x598(%rbp)
14085fc69:     	movdqu	-0x68(%r9), %xmm0
14085fc6f:     	movdqu	-0x58(%r9), %xmm1
14085fc75:     	movdqu	-0x48(%r9), %xmm2
14085fc7b:     	movdqu	-0x38(%r9), %xmm3
14085fc81:     	movdqu	%xmm3, 0x588(%rbp)
14085fc89:     	movdqu	%xmm2, 0x578(%rbp)
14085fc91:     	movdqu	%xmm1, 0x568(%rbp)
14085fc99:     	movdqu	%xmm0, 0x558(%rbp)
14085fca1:     	movq	%rax, 0x550(%rbp)
14085fca8:     	leaq	0x550(%rbp), %rcx
14085fcaf:     	leaq	0x1610(%rbp), %rdx
14085fcb6:     	callq	0x144e04c70 <.text+0x4e03c70>
14085fcbb:     	nop
14085fcbc:     	movq	%rax, %r14
14085fcbf:     	movq	0x1610(%rbp), %rdx
14085fcc6:     	testq	%rdx, %rdx
14085fcc9:     	jne	0x14085b08d <.text+0x85a08d>
14085fccf:     	jmp	0x14085b0a3 <.text+0x85a0a3>
14085fcd4:     	movq	-0x8(%r9), %rcx
14085fcd8:     	movq	%rcx, 0x5b8(%rbp)
14085fcdf:     	movups	-0x18(%r9), %xmm0
14085fce4:     	movups	%xmm0, 0x5a8(%rbp)
14085fceb:     	movups	-0x28(%r9), %xmm0
14085fcf0:     	movups	%xmm0, 0x598(%rbp)
14085fcf7:     	movdqu	-0x68(%r9), %xmm0
14085fcfd:     	movdqu	-0x58(%r9), %xmm1
14085fd03:     	movdqu	-0x48(%r9), %xmm2
14085fd09:     	movdqu	-0x38(%r9), %xmm3
14085fd0f:     	movdqu	%xmm3, 0x588(%rbp)
14085fd17:     	movdqu	%xmm2, 0x578(%rbp)
14085fd1f:     	movdqu	%xmm1, 0x568(%rbp)
14085fd27:     	movdqu	%xmm0, 0x558(%rbp)
14085fd2f:     	movq	%rax, 0x550(%rbp)
14085fd36:     	leaq	0x550(%rbp), %rcx
14085fd3d:     	leaq	0x1610(%rbp), %rdx
14085fd44:     	callq	0x144e04c70 <.text+0x4e03c70>
14085fd49:     	nop
14085fd4a:     	movq	%rax, %r14
14085fd4d:     	movq	0x1610(%rbp), %rdx
14085fd54:     	testq	%rdx, %rdx
14085fd57:     	jne	0x14085b44d <.text+0x85a44d>
14085fd5d:     	jmp	0x14085b463 <.text+0x85a463>
14085fd62:     	movq	-0x8(%r9), %rcx
14085fd66:     	movq	%rcx, 0x5b8(%rbp)
14085fd6d:     	movups	-0x18(%r9), %xmm0
14085fd72:     	movups	%xmm0, 0x5a8(%rbp)
14085fd79:     	movups	-0x28(%r9), %xmm0
14085fd7e:     	movups	%xmm0, 0x598(%rbp)
14085fd85:     	movdqu	-0x68(%r9), %xmm0
14085fd8b:     	movdqu	-0x58(%r9), %xmm1
14085fd91:     	movdqu	-0x48(%r9), %xmm2
14085fd97:     	movdqu	-0x38(%r9), %xmm3
14085fd9d:     	movdqu	%xmm3, 0x588(%rbp)
14085fda5:     	movdqu	%xmm2, 0x578(%rbp)
14085fdad:     	movdqu	%xmm1, 0x568(%rbp)
14085fdb5:     	movdqu	%xmm0, 0x558(%rbp)
14085fdbd:     	movq	%rax, 0x550(%rbp)
14085fdc4:     	leaq	0x550(%rbp), %rcx
14085fdcb:     	leaq	0x1610(%rbp), %rdx
14085fdd2:     	callq	0x144e04c70 <.text+0x4e03c70>
14085fdd7:     	nop
14085fdd8:     	movq	%rax, %r14
14085fddb:     	movq	0x1610(%rbp), %rdx
14085fde2:     	testq	%rdx, %rdx
14085fde5:     	jne	0x14085b82a <.text+0x85a82a>
14085fdeb:     	jmp	0x14085b840 <.text+0x85a840>
14085fdf0:     	movq	-0x8(%r9), %rcx
14085fdf4:     	movq	%rcx, 0x5b8(%rbp)
14085fdfb:     	movups	-0x18(%r9), %xmm0
14085fe00:     	movups	%xmm0, 0x5a8(%rbp)
14085fe07:     	movups	-0x28(%r9), %xmm0
14085fe0c:     	movups	%xmm0, 0x598(%rbp)
14085fe13:     	movdqu	-0x68(%r9), %xmm0
14085fe19:     	movdqu	-0x58(%r9), %xmm1
14085fe1f:     	movdqu	-0x48(%r9), %xmm2
14085fe25:     	movdqu	-0x38(%r9), %xmm3
14085fe2b:     	movdqu	%xmm3, 0x588(%rbp)
14085fe33:     	movdqu	%xmm2, 0x578(%rbp)
14085fe3b:     	movdqu	%xmm1, 0x568(%rbp)
14085fe43:     	movdqu	%xmm0, 0x558(%rbp)
14085fe4b:     	movq	%rax, 0x550(%rbp)
14085fe52:     	leaq	0x550(%rbp), %rcx
14085fe59:     	leaq	0x1610(%rbp), %rdx
14085fe60:     	callq	0x144e04c70 <.text+0x4e03c70>
14085fe65:     	nop
14085fe66:     	movq	%rax, %r14
14085fe69:     	movq	0x1610(%rbp), %rdx
14085fe70:     	testq	%rdx, %rdx
14085fe73:     	jne	0x14085bc6a <.text+0x85ac6a>
14085fe79:     	jmp	0x14085bc80 <.text+0x85ac80>
14085fe7e:     	movq	-0x8(%r9), %rcx
14085fe82:     	movq	%rcx, 0x5b8(%rbp)
14085fe89:     	movups	-0x18(%r9), %xmm0
14085fe8e:     	movups	%xmm0, 0x5a8(%rbp)
14085fe95:     	movups	-0x28(%r9), %xmm0
14085fe9a:     	movups	%xmm0, 0x598(%rbp)
14085fea1:     	movdqu	-0x68(%r9), %xmm0
14085fea7:     	movdqu	-0x58(%r9), %xmm1
14085fead:     	movdqu	-0x48(%r9), %xmm2
14085feb3:     	movdqu	-0x38(%r9), %xmm3
14085feb9:     	movdqu	%xmm3, 0x588(%rbp)
14085fec1:     	movdqu	%xmm2, 0x578(%rbp)
14085fec9:     	movdqu	%xmm1, 0x568(%rbp)
14085fed1:     	movdqu	%xmm0, 0x558(%rbp)
14085fed9:     	movq	%rax, 0x550(%rbp)
14085fee0:     	leaq	0x550(%rbp), %rcx
14085fee7:     	leaq	0x1610(%rbp), %rdx
14085feee:     	callq	0x144e04c70 <.text+0x4e03c70>
14085fef3:     	nop
14085fef4:     	movq	%rax, %r14
14085fef7:     	movq	0x1610(%rbp), %rdx
14085fefe:     	testq	%rdx, %rdx
14085ff01:     	jne	0x14085bfda <.text+0x85afda>
14085ff07:     	jmp	0x14085bff0 <.text+0x85aff0>
14085ff0c:     	movq	-0x8(%r9), %rcx
14085ff10:     	movq	%rcx, 0x5b8(%rbp)
14085ff17:     	movups	-0x18(%r9), %xmm0
14085ff1c:     	movups	%xmm0, 0x5a8(%rbp)
14085ff23:     	movups	-0x28(%r9), %xmm0
14085ff28:     	movups	%xmm0, 0x598(%rbp)
14085ff2f:     	movdqu	-0x68(%r9), %xmm0
14085ff35:     	movdqu	-0x58(%r9), %xmm1
14085ff3b:     	movdqu	-0x48(%r9), %xmm2
14085ff41:     	movdqu	-0x38(%r9), %xmm3
14085ff47:     	movdqu	%xmm3, 0x588(%rbp)
14085ff4f:     	movdqu	%xmm2, 0x578(%rbp)
14085ff57:     	movdqu	%xmm1, 0x568(%rbp)
14085ff5f:     	movdqu	%xmm0, 0x558(%rbp)
14085ff67:     	movq	%rax, 0x550(%rbp)
14085ff6e:     	leaq	0x550(%rbp), %rcx
14085ff75:     	leaq	0x1610(%rbp), %rdx
14085ff7c:     	callq	0x144e04c70 <.text+0x4e03c70>
14085ff81:     	nop
14085ff82:     	movq	%rax, %r14
14085ff85:     	movq	0x1610(%rbp), %rdx
14085ff8c:     	testq	%rdx, %rdx
14085ff8f:     	jne	0x14085c35a <.text+0x85b35a>
14085ff95:     	jmp	0x14085c370 <.text+0x85b370>
14085ff9a:     	movq	-0x8(%r9), %rcx
14085ff9e:     	movq	%rcx, 0x5b8(%rbp)
14085ffa5:     	movups	-0x18(%r9), %xmm0
14085ffaa:     	movups	%xmm0, 0x5a8(%rbp)
14085ffb1:     	movups	-0x28(%r9), %xmm0
14085ffb6:     	movups	%xmm0, 0x598(%rbp)
14085ffbd:     	movdqu	-0x68(%r9), %xmm0
14085ffc3:     	movdqu	-0x58(%r9), %xmm1
14085ffc9:     	movdqu	-0x48(%r9), %xmm2
14085ffcf:     	movdqu	-0x38(%r9), %xmm3
14085ffd5:     	movdqu	%xmm3, 0x588(%rbp)
14085ffdd:     	movdqu	%xmm2, 0x578(%rbp)
14085ffe5:     	movdqu	%xmm1, 0x568(%rbp)
14085ffed:     	movdqu	%xmm0, 0x558(%rbp)
14085fff5:     	movq	%rax, 0x550(%rbp)
14085fffc:     	leaq	0x550(%rbp), %rcx
140860003:     	leaq	0x1610(%rbp), %rdx
14086000a:     	callq	0x144e04c70 <.text+0x4e03c70>
14086000f:     	nop
140860010:     	movq	%rax, %r14
140860013:     	movq	0x1610(%rbp), %rdx
14086001a:     	testq	%rdx, %rdx
14086001d:     	jne	0x14085c6da <.text+0x85b6da>
140860023:     	jmp	0x14085c6f0 <.text+0x85b6f0>
140860028:     	movq	-0x8(%r9), %rcx
14086002c:     	movq	%rcx, 0x5b8(%rbp)
140860033:     	movups	-0x18(%r9), %xmm0
140860038:     	movups	%xmm0, 0x5a8(%rbp)
14086003f:     	movups	-0x28(%r9), %xmm0
140860044:     	movups	%xmm0, 0x598(%rbp)
14086004b:     	movdqu	-0x68(%r9), %xmm0
140860051:     	movdqu	-0x58(%r9), %xmm1
140860057:     	movdqu	-0x48(%r9), %xmm2
14086005d:     	movdqu	-0x38(%r9), %xmm3
140860063:     	movdqu	%xmm3, 0x588(%rbp)
14086006b:     	movdqu	%xmm2, 0x578(%rbp)
140860073:     	movdqu	%xmm1, 0x568(%rbp)
14086007b:     	movdqu	%xmm0, 0x558(%rbp)
140860083:     	movq	%rax, 0x550(%rbp)
14086008a:     	leaq	0x550(%rbp), %rcx
140860091:     	leaq	0x1610(%rbp), %rdx
140860098:     	callq	0x144e04c70 <.text+0x4e03c70>
14086009d:     	nop
14086009e:     	movq	%rax, %r14
1408600a1:     	movq	0x1610(%rbp), %rdx
1408600a8:     	testq	%rdx, %rdx
1408600ab:     	jne	0x14085ca6a <.text+0x85ba6a>
1408600b1:     	jmp	0x14085ca80 <.text+0x85ba80>
1408600b6:     	movq	-0x8(%r9), %rcx
1408600ba:     	movq	%rcx, 0x5b8(%rbp)
1408600c1:     	movups	-0x18(%r9), %xmm0
1408600c6:     	movups	%xmm0, 0x5a8(%rbp)
1408600cd:     	movups	-0x28(%r9), %xmm0
1408600d2:     	movups	%xmm0, 0x598(%rbp)
1408600d9:     	movdqu	-0x68(%r9), %xmm0
1408600df:     	movdqu	-0x58(%r9), %xmm1
1408600e5:     	movdqu	-0x48(%r9), %xmm2
1408600eb:     	movdqu	-0x38(%r9), %xmm3
1408600f1:     	movdqu	%xmm3, 0x588(%rbp)
1408600f9:     	movdqu	%xmm2, 0x578(%rbp)
140860101:     	movdqu	%xmm1, 0x568(%rbp)
140860109:     	movdqu	%xmm0, 0x558(%rbp)
140860111:     	movq	%rax, 0x550(%rbp)
140860118:     	leaq	0x550(%rbp), %rcx
14086011f:     	leaq	0x1610(%rbp), %rdx
140860126:     	callq	0x144e04c70 <.text+0x4e03c70>
14086012b:     	nop
14086012c:     	movq	%rax, %r14
14086012f:     	movq	0x1610(%rbp), %rdx
140860136:     	testq	%rdx, %rdx
140860139:     	jne	0x14085cdfa <.text+0x85bdfa>
14086013f:     	jmp	0x14085ce10 <.text+0x85be10>
140860144:     	movq	-0x8(%r9), %rcx
140860148:     	movq	%rcx, 0x5b8(%rbp)
14086014f:     	movups	-0x18(%r9), %xmm0
140860154:     	movups	%xmm0, 0x5a8(%rbp)
14086015b:     	movups	-0x28(%r9), %xmm0
140860160:     	movups	%xmm0, 0x598(%rbp)
140860167:     	movdqu	-0x68(%r9), %xmm0
14086016d:     	movdqu	-0x58(%r9), %xmm1
140860173:     	movdqu	-0x48(%r9), %xmm2
140860179:     	movdqu	-0x38(%r9), %xmm3
14086017f:     	movdqu	%xmm3, 0x588(%rbp)
140860187:     	movdqu	%xmm2, 0x578(%rbp)
14086018f:     	movdqu	%xmm1, 0x568(%rbp)
140860197:     	movdqu	%xmm0, 0x558(%rbp)
14086019f:     	movq	%rax, 0x550(%rbp)
1408601a6:     	leaq	0x550(%rbp), %rcx
1408601ad:     	leaq	0x1610(%rbp), %rdx
1408601b4:     	callq	0x144e04c70 <.text+0x4e03c70>
1408601b9:     	nop
1408601ba:     	movq	%rax, %r14
1408601bd:     	movq	0x1610(%rbp), %rdx
1408601c4:     	testq	%rdx, %rdx
1408601c7:     	jne	0x14085d18d <.text+0x85c18d>
1408601cd:     	jmp	0x14085d1a3 <.text+0x85c1a3>
1408601d2:     	movq	-0x8(%r9), %rcx
1408601d6:     	movq	%rcx, 0x5b8(%rbp)
1408601dd:     	movups	-0x18(%r9), %xmm0
1408601e2:     	movups	%xmm0, 0x5a8(%rbp)
1408601e9:     	movups	-0x28(%r9), %xmm0
1408601ee:     	movups	%xmm0, 0x598(%rbp)
1408601f5:     	movdqu	-0x68(%r9), %xmm0
1408601fb:     	movdqu	-0x58(%r9), %xmm1
140860201:     	movdqu	-0x48(%r9), %xmm2
140860207:     	movdqu	-0x38(%r9), %xmm3
14086020d:     	movdqu	%xmm3, 0x588(%rbp)
140860215:     	movdqu	%xmm2, 0x578(%rbp)
14086021d:     	movdqu	%xmm1, 0x568(%rbp)
140860225:     	movdqu	%xmm0, 0x558(%rbp)
14086022d:     	movq	%rax, 0x550(%rbp)
140860234:     	leaq	0x550(%rbp), %rcx
14086023b:     	leaq	0x1610(%rbp), %rdx
140860242:     	callq	0x144e04c70 <.text+0x4e03c70>
140860247:     	nop
140860248:     	movq	%rax, %r14
14086024b:     	movq	0x1610(%rbp), %rdx
140860252:     	testq	%rdx, %rdx
140860255:     	jne	0x14085d57d <.text+0x85c57d>
14086025b:     	jmp	0x14085d593 <.text+0x85c593>
140860260:     	movq	-0x8(%r9), %rcx
140860264:     	movq	%rcx, 0x5b8(%rbp)
14086026b:     	movups	-0x18(%r9), %xmm0
140860270:     	movups	%xmm0, 0x5a8(%rbp)
140860277:     	movups	-0x28(%r9), %xmm0
14086027c:     	movups	%xmm0, 0x598(%rbp)
140860283:     	movdqu	-0x68(%r9), %xmm0
140860289:     	movdqu	-0x58(%r9), %xmm1
14086028f:     	movdqu	-0x48(%r9), %xmm2
140860295:     	movdqu	-0x38(%r9), %xmm3
14086029b:     	movdqu	%xmm3, 0x588(%rbp)
1408602a3:     	movdqu	%xmm2, 0x578(%rbp)
1408602ab:     	movdqu	%xmm1, 0x568(%rbp)
1408602b3:     	movdqu	%xmm0, 0x558(%rbp)
1408602bb:     	movq	%rax, 0x550(%rbp)
1408602c2:     	leaq	0x550(%rbp), %rcx
1408602c9:     	leaq	0x1610(%rbp), %rdx
1408602d0:     	callq	0x144e04c70 <.text+0x4e03c70>
1408602d5:     	nop
1408602d6:     	movq	%rax, %r14
1408602d9:     	movq	0x1610(%rbp), %rdx
1408602e0:     	testq	%rdx, %rdx
1408602e3:     	jne	0x14085d93a <.text+0x85c93a>
1408602e9:     	jmp	0x14085d950 <.text+0x85c950>
1408602ee:     	movq	-0x8(%r9), %rcx
1408602f2:     	movq	%rcx, 0x5b8(%rbp)
1408602f9:     	movups	-0x18(%r9), %xmm0
1408602fe:     	movups	%xmm0, 0x5a8(%rbp)
140860305:     	movups	-0x28(%r9), %xmm0
14086030a:     	movups	%xmm0, 0x598(%rbp)
140860311:     	movdqu	-0x68(%r9), %xmm0
140860317:     	movdqu	-0x58(%r9), %xmm1
14086031d:     	movdqu	-0x48(%r9), %xmm2
140860323:     	movdqu	-0x38(%r9), %xmm3
140860329:     	movdqu	%xmm3, 0x588(%rbp)
140860331:     	movdqu	%xmm2, 0x578(%rbp)
140860339:     	movdqu	%xmm1, 0x568(%rbp)
140860341:     	movdqu	%xmm0, 0x558(%rbp)
140860349:     	movq	%rax, 0x550(%rbp)
140860350:     	leaq	0x550(%rbp), %rcx
140860357:     	leaq	0x1610(%rbp), %rdx
14086035e:     	callq	0x144e04c70 <.text+0x4e03c70>
140860363:     	nop
140860364:     	movq	%rax, %r14
140860367:     	movq	0x1610(%rbp), %rdx
14086036e:     	testq	%rdx, %rdx
140860371:     	jne	0x14085dcbd <.text+0x85ccbd>
140860377:     	jmp	0x14085dcd3 <.text+0x85ccd3>
14086037c:     	movq	-0x8(%r9), %rcx
140860380:     	movq	%rcx, 0x5b8(%rbp)
140860387:     	movups	-0x18(%r9), %xmm0
14086038c:     	movups	%xmm0, 0x5a8(%rbp)
140860393:     	movups	-0x28(%r9), %xmm0
140860398:     	movups	%xmm0, 0x598(%rbp)
14086039f:     	movdqu	-0x68(%r9), %xmm0
1408603a5:     	movdqu	-0x58(%r9), %xmm1
1408603ab:     	movdqu	-0x48(%r9), %xmm2
1408603b1:     	movdqu	-0x38(%r9), %xmm3
1408603b7:     	movdqu	%xmm3, 0x588(%rbp)
1408603bf:     	movdqu	%xmm2, 0x578(%rbp)
1408603c7:     	movdqu	%xmm1, 0x568(%rbp)
1408603cf:     	movdqu	%xmm0, 0x558(%rbp)
1408603d7:     	movq	%rax, 0x550(%rbp)
1408603de:     	leaq	0x550(%rbp), %rcx
1408603e5:     	leaq	0x1610(%rbp), %rdx
1408603ec:     	callq	0x144e04c70 <.text+0x4e03c70>
1408603f1:     	nop
1408603f2:     	movq	%rax, %r14
1408603f5:     	movq	0x1610(%rbp), %rdx
1408603fc:     	testq	%rdx, %rdx
1408603ff:     	jne	0x14085e0ad <.text+0x85d0ad>
140860405:     	jmp	0x14085e0c3 <.text+0x85d0c3>
14086040a:     	movq	-0x8(%r9), %rcx
14086040e:     	movq	%rcx, 0x5b8(%rbp)
140860415:     	movups	-0x18(%r9), %xmm0
14086041a:     	movups	%xmm0, 0x5a8(%rbp)
140860421:     	movups	-0x28(%r9), %xmm0
140860426:     	movups	%xmm0, 0x598(%rbp)
14086042d:     	movdqu	-0x68(%r9), %xmm0
140860433:     	movdqu	-0x58(%r9), %xmm1
140860439:     	movdqu	-0x48(%r9), %xmm2
14086043f:     	movdqu	-0x38(%r9), %xmm3
140860445:     	movdqu	%xmm3, 0x588(%rbp)
14086044d:     	movdqu	%xmm2, 0x578(%rbp)
140860455:     	movdqu	%xmm1, 0x568(%rbp)
14086045d:     	movdqu	%xmm0, 0x558(%rbp)
140860465:     	movq	%rax, 0x550(%rbp)
14086046c:     	leaq	0x550(%rbp), %rcx
140860473:     	leaq	0x1610(%rbp), %rdx
14086047a:     	callq	0x144e04c70 <.text+0x4e03c70>
14086047f:     	nop
140860480:     	movq	%rax, %r14
140860483:     	movq	0x1610(%rbp), %rdx
14086048a:     	testq	%rdx, %rdx
14086048d:     	jne	0x14085e46d <.text+0x85d46d>
140860493:     	jmp	0x14085e483 <.text+0x85d483>
140860498:     	movq	-0x8(%r9), %rcx
14086049c:     	movq	%rcx, 0x5b8(%rbp)
1408604a3:     	movups	-0x18(%r9), %xmm0
1408604a8:     	movups	%xmm0, 0x5a8(%rbp)
1408604af:     	movups	-0x28(%r9), %xmm0
1408604b4:     	movups	%xmm0, 0x598(%rbp)
1408604bb:     	movdqu	-0x68(%r9), %xmm0
1408604c1:     	movdqu	-0x58(%r9), %xmm1
1408604c7:     	movdqu	-0x48(%r9), %xmm2
1408604cd:     	movdqu	-0x38(%r9), %xmm3
1408604d3:     	movdqu	%xmm3, 0x588(%rbp)
1408604db:     	movdqu	%xmm2, 0x578(%rbp)
1408604e3:     	movdqu	%xmm1, 0x568(%rbp)
1408604eb:     	movdqu	%xmm0, 0x558(%rbp)
1408604f3:     	movq	%rax, 0x550(%rbp)
1408604fa:     	leaq	0x550(%rbp), %rcx
140860501:     	leaq	0x1610(%rbp), %rdx
140860508:     	callq	0x144e04c70 <.text+0x4e03c70>
14086050d:     	nop
14086050e:     	movq	%rax, %r14
140860511:     	movq	0x1610(%rbp), %rdx
140860518:     	testq	%rdx, %rdx
14086051b:     	jne	0x14085e82a <.text+0x85d82a>
140860521:     	jmp	0x14085e840 <.text+0x85d840>
140860526:     	movq	-0x8(%r9), %rcx
14086052a:     	movq	%rcx, 0x5b8(%rbp)
140860531:     	movups	-0x18(%r9), %xmm0
140860536:     	movups	%xmm0, 0x5a8(%rbp)
14086053d:     	movups	-0x28(%r9), %xmm0
140860542:     	movups	%xmm0, 0x598(%rbp)
140860549:     	movdqu	-0x68(%r9), %xmm0
14086054f:     	movdqu	-0x58(%r9), %xmm1
140860555:     	movdqu	-0x48(%r9), %xmm2
14086055b:     	movdqu	-0x38(%r9), %xmm3
140860561:     	movdqu	%xmm3, 0x588(%rbp)
140860569:     	movdqu	%xmm2, 0x578(%rbp)
140860571:     	movdqu	%xmm1, 0x568(%rbp)
140860579:     	movdqu	%xmm0, 0x558(%rbp)
140860581:     	movq	%rax, 0x550(%rbp)
140860588:     	leaq	0x550(%rbp), %rcx
14086058f:     	leaq	0x1610(%rbp), %rdx
140860596:     	callq	0x144e04c70 <.text+0x4e03c70>
14086059b:     	nop
14086059c:     	movq	%rax, %r14
14086059f:     	movq	0x1610(%rbp), %rdx
1408605a6:     	testq	%rdx, %rdx
1408605a9:     	jne	0x14085eb9d <.text+0x85db9d>
1408605af:     	jmp	0x14085ebb3 <.text+0x85dbb3>
1408605b4:     	movl	$0x8, %ecx
1408605b9:     	movl	$0x20, %edx
1408605be:     	callq	0x1458e7201 <.text+0x58e6201>
1408605c3:     	ud2
1408605c5:     	movl	$0x8, %ecx
1408605ca:     	movl	$0x700, %edx            # imm = 0x700
1408605cf:     	callq	0x1458e7201 <.text+0x58e6201>
1408605d4:     	ud2
1408605d6:     	movl	$0x8, %ecx
1408605db:     	movl	$0x290, %edx            # imm = 0x290
1408605e0:     	callq	0x1458e7201 <.text+0x58e6201>
1408605e5:     	nop
1408605e6:     	jmp	0x140860721 <.text+0x85f721>
1408605eb:     	movl	$0x8, %ecx
1408605f0:     	movl	$0x1e8, %edx            # imm = 0x1E8
1408605f5:     	callq	0x1458e7201 <.text+0x58e6201>
1408605fa:     	nop
1408605fb:     	jmp	0x140860721 <.text+0x85f721>
140860600:     	movl	$0x8, %ecx
140860605:     	movl	$0x1040, %edx           # imm = 0x1040
14086060a:     	callq	0x1458e7201 <.text+0x58e6201>
14086060f:     	nop
140860610:     	jmp	0x140860721 <.text+0x85f721>
140860615:     	movl	$0x8, %ecx
14086061a:     	movl	$0xdd8, %edx            # imm = 0xDD8
14086061f:     	callq	0x1458e7201 <.text+0x58e6201>
140860624:     	nop
140860625:     	jmp	0x140860721 <.text+0x85f721>
14086062a:     	movl	$0x8, %ecx
14086062f:     	movl	$0xcc0, %edx            # imm = 0xCC0
140860634:     	callq	0x1458e7201 <.text+0x58e6201>
140860639:     	nop
14086063a:     	jmp	0x140860721 <.text+0x85f721>
14086063f:     	movl	$0x8, %ecx
140860644:     	movl	$0xcc0, %edx            # imm = 0xCC0
140860649:     	callq	0x1458e7201 <.text+0x58e6201>
14086064e:     	nop
14086064f:     	jmp	0x140860721 <.text+0x85f721>
140860654:     	movl	$0x8, %ecx
140860659:     	movl	$0x60, %edx
14086065e:     	callq	0x1458e7201 <.text+0x58e6201>
140860663:     	nop
140860664:     	jmp	0x140860721 <.text+0x85f721>
140860669:     	movl	$0x8, %ecx
14086066e:     	movl	$0xcc8, %edx            # imm = 0xCC8
140860673:     	callq	0x1458e7201 <.text+0x58e6201>
140860678:     	nop
140860679:     	jmp	0x140860721 <.text+0x85f721>
14086067e:     	movl	$0x8, %ecx
140860683:     	movl	$0x350, %edx            # imm = 0x350
140860688:     	callq	0x1458e7201 <.text+0x58e6201>
14086068d:     	nop
14086068e:     	jmp	0x140860721 <.text+0x85f721>
140860693:     	movl	$0x8, %ecx
140860698:     	movl	$0x1e0, %edx            # imm = 0x1E0
14086069d:     	callq	0x1458e7201 <.text+0x58e6201>
1408606a2:     	nop
1408606a3:     	jmp	0x140860721 <.text+0x85f721>
1408606a5:     	movl	$0x8, %ecx
1408606aa:     	movl	$0x28, %edx
1408606af:     	callq	0x1458e7201 <.text+0x58e6201>
1408606b4:     	nop
1408606b5:     	jmp	0x140860721 <.text+0x85f721>
1408606b7:     	movl	$0x8, %ecx
1408606bc:     	movl	$0x258, %edx            # imm = 0x258
1408606c1:     	callq	0x1458e7201 <.text+0x58e6201>
1408606c6:     	nop
1408606c7:     	jmp	0x140860721 <.text+0x85f721>
1408606c9:     	movl	$0x8, %ecx
1408606ce:     	movl	$0x80, %edx
1408606d3:     	callq	0x1458e7201 <.text+0x58e6201>
1408606d8:     	nop
1408606d9:     	jmp	0x140860721 <.text+0x85f721>
1408606db:     	movl	$0x8, %ecx
1408606e0:     	movl	$0x1d8, %edx            # imm = 0x1D8
1408606e5:     	callq	0x1458e7201 <.text+0x58e6201>
1408606ea:     	nop
1408606eb:     	jmp	0x140860721 <.text+0x85f721>
1408606ed:     	movl	$0x8, %ecx
1408606f2:     	movl	$0x150, %edx            # imm = 0x150
1408606f7:     	callq	0x1458e7201 <.text+0x58e6201>
1408606fc:     	nop
1408606fd:     	jmp	0x140860721 <.text+0x85f721>
1408606ff:     	movl	$0x8, %ecx
140860704:     	movl	$0x2e0, %edx            # imm = 0x2E0
140860709:     	callq	0x1458e7201 <.text+0x58e6201>
14086070e:     	nop
14086070f:     	jmp	0x140860721 <.text+0x85f721>
140860711:     	movl	$0x8, %ecx
140860716:     	movl	$0x140, %edx            # imm = 0x140
14086071b:     	callq	0x1458e7201 <.text+0x58e6201>
140860720:     	nop
140860721:     	ud2
140860723:     	movq	%rax, %r12
140860726:     	callq	0x1456f6890 <.text+0x56f5890>
14086072b:     	movq	%rax, %rcx
14086072e:     	movq	%r12, %rax
140860731:     	movq	%rcx, (%r12)
140860735:     	movq	%rdx, 0x8(%r12)
14086073a:     	movb	$0x1, 0x10(%r12)
140860740:     	jmp	0x14085b0f2 <.text+0x85a0f2>
140860745:     	movq	%rcx, %r12
140860748:     	callq	0x1456f6890 <.text+0x56f5890>
14086074d:     	movq	%r12, %rcx
140860750:     	movq	%rax, (%r12)
140860754:     	movq	%rdx, 0x8(%r12)
140860759:     	movb	$0x1, 0x10(%r12)
14086075f:     	jmp	0x14085b4ae <.text+0x85a4ae>
140860764:     	movq	%rax, %r12
140860767:     	callq	0x1456f6890 <.text+0x56f5890>
14086076c:     	movq	%rax, %rcx
14086076f:     	movq	%r12, %rax
140860772:     	movq	%rcx, (%r12)
140860776:     	movq	%rdx, 0x8(%r12)
14086077b:     	movb	$0x1, 0x10(%r12)
140860781:     	jmp	0x14085e10b <.text+0x85d10b>
140860786:     	movq	%rax, %r12
140860789:     	callq	0x1456f6890 <.text+0x56f5890>
14086078e:     	movq	%rax, %rcx
140860791:     	movq	%r12, %rax
140860794:     	movq	%rcx, (%r12)
140860798:     	movq	%rdx, 0x8(%r12)
14086079d:     	movb	$0x1, 0x10(%r12)
1408607a3:     	jmp	0x14085e4cb <.text+0x85d4cb>
1408607a8:     	callq	0x1456f6890 <.text+0x56f5890>
1408607ad:     	nop
1408607ae:     	movq	%rax, (%r15)
1408607b1:     	movq	%rdx, 0x8(%r15)
1408607b5:     	movb	$0x1, 0x10(%r15)
1408607ba:     	jmp	0x14085ec0a <.text+0x85dc0a>
1408607bf:     	callq	0x1456f6890 <.text+0x56f5890>
1408607c4:     	nop
1408607c5:     	movq	%rax, (%r15)
1408607c8:     	movq	%rdx, 0x8(%r15)
1408607cc:     	movb	$0x1, 0x10(%r15)
1408607d1:     	jmp	0x14085ec91 <.text+0x85dc91>

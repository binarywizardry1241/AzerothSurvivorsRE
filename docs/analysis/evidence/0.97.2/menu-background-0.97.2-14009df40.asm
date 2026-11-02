
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14009df40:     	pushq	%rbp
14009df41:     	pushq	%r15
14009df43:     	pushq	%r14
14009df45:     	pushq	%rsi
14009df46:     	pushq	%rdi
14009df47:     	pushq	%rbx
14009df48:     	subq	$0x88, %rsp
14009df4f:     	leaq	0x80(%rsp), %rbp
14009df57:     	movq	$-0x2, (%rbp)
14009df5f:     	movq	%rdx, %rsi
14009df62:     	cmpb	$0x0, (%r8)
14009df66:     	movb	$0x1, (%r8)
14009df6a:     	jne	0x14009df91 <.text+0x9cf91>
14009df6c:     	movq	$0x1, 0x20(%rsp)
14009df75:     	leaq	0x585bf4c(%rip), %rdx   # 0x1458f9ec8
14009df7c:     	leaq	0x585d0cc(%rip), %r9    # 0x1458fb04f
14009df83:     	movl	$0x9, %r8d
14009df89:     	movq	%rsi, %rcx
14009df8c:     	callq	0x140638a20 <.text+0x637a20>
14009df91:     	leaq	0x585d0b8(%rip), %rdx   # 0x1458fb050
14009df98:     	leaq	-0x28(%rbp), %rcx
14009df9c:     	movl	$0xe, %r8d
14009dfa2:     	callq	0x1408df980 <.text+0x8de980>
14009dfa7:     	cmpq	$-0x1, -0x28(%rbp)
14009dfac:     	je	0x14009e008 <.text+0x9d008>
14009dfae:     	movq	-0x18(%rbp), %rax
14009dfb2:     	movq	%rax, -0x40(%rbp)
14009dfb6:     	movdqu	-0x28(%rbp), %xmm0
14009dfbb:     	movdqa	%xmm0, -0x50(%rbp)
14009dfc0:     	movq	-0x50(%rbp), %rax
14009dfc4:     	cmpq	$-0x1, %rax
14009dfc8:     	je	0x14009e02b <.text+0x9d02b>
14009dfca:     	movq	%rax, -0x10(%rbp)
14009dfce:     	movq	-0x48(%rbp), %rcx
14009dfd2:     	movq	-0x40(%rbp), %rdx
14009dfd6:     	movq	%rcx, -0x30(%rbp)
14009dfda:     	callq	0x1400e9d30 <.text+0xe8d30>
14009dfdf:     	nop
14009dfe0:     	movb	$0x1, %bl
14009dfe2:     	cmpq	$0x1, %rdx
14009dfe6:     	jne	0x14009dfee <.text+0x9cfee>
14009dfe8:     	cmpb	$0x30, (%rax)
14009dfeb:     	setne	%bl
14009dfee:     	movq	-0x10(%rbp), %rdx
14009dff2:     	testq	%rdx, %rdx
14009dff5:     	je	0x14009e02d <.text+0x9d02d>
14009dff7:     	movl	$0x1, %r8d
14009dffd:     	movq	-0x30(%rbp), %rcx
14009e001:     	callq	0x1400021d0 <.text+0x11d0>
14009e006:     	jmp	0x14009e02d <.text+0x9d02d>
14009e008:     	leaq	0x585beb9(%rip), %r8    # 0x1458f9ec8
14009e00f:     	leaq	-0x50(%rbp), %rcx
14009e013:     	movl	$0x9, %r9d
14009e019:     	movq	%rsi, %rdx
14009e01c:     	callq	0x14063bc40 <.text+0x63ac40>
14009e021:     	movq	-0x50(%rbp), %rax
14009e025:     	cmpq	$-0x1, %rax
14009e029:     	jne	0x14009dfca <.text+0x9cfca>
14009e02b:     	movb	$0x1, %bl
14009e02d:     	cmpq	$0x0, 0x90(%rsi)
14009e035:     	je	0x14009e1b5 <.text+0x9d1b5>
14009e03b:     	movq	0x78(%rsi), %rax
14009e03f:     	movq	0x80(%rsi), %rcx
14009e046:     	movabsq	$-0x990d3248f4f83d5, %rdx # imm = 0xF66F2CDB70B07C2B
14009e050:     	xorl	%r8d, %r8d
14009e053:     	movdqa	0x585ac95(%rip), %xmm0  # 0x1458f8cf0
14009e05b:     	pcmpeqd	%xmm2, %xmm2
14009e05f:     	movdqa	0x585ac99(%rip), %xmm1  # 0x1458f8d00
14009e067:     	andq	%rcx, %rdx
14009e06a:     	movdqu	(%rax,%rdx), %xmm3
14009e06f:     	movdqa	%xmm3, %xmm4
14009e073:     	pcmpeqb	%xmm0, %xmm4
14009e077:     	pmovmskb	%xmm4, %r9d
14009e07c:     	testl	%r9d, %r9d
14009e07f:     	je	0x14009e0c0 <.text+0x9d0c0>
14009e081:     	tzcntl	%r9d, %r10d
14009e086:     	addq	%rdx, %r10
14009e089:     	andq	%rcx, %r10
14009e08c:     	negq	%r10
14009e08f:     	leaq	(%r10,%r10,2), %r10
14009e093:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14009e09a:     	pcmpeqb	%xmm1, %xmm4
14009e09e:     	pmovmskb	%xmm4, %r11d
14009e0a3:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14009e0aa:     	je	0x14009e0df <.text+0x9d0df>
14009e0ac:     	leal	-0x1(%r9), %r10d
14009e0b0:     	andw	%r9w, %r10w
14009e0b4:     	movl	%r10d, %r9d
14009e0b7:     	jne	0x14009e081 <.text+0x9d081>
14009e0b9:     	nopl	(%rax)
14009e0c0:     	pcmpeqb	%xmm2, %xmm3
14009e0c4:     	pmovmskb	%xmm3, %r9d
14009e0c9:     	testl	%r9d, %r9d
14009e0cc:     	jne	0x14009e1b5 <.text+0x9d1b5>
14009e0d2:     	addq	%r8, %rdx
14009e0d5:     	addq	$0x10, %rdx
14009e0d9:     	addq	$0x10, %r8
14009e0dd:     	jmp	0x14009e067 <.text+0x9d067>
14009e0df:     	leaq	(%rax,%r10,8), %rdx
14009e0e3:     	movq	-0x8(%rdx), %rdx
14009e0e7:     	movq	0x218(%rsi), %r8
14009e0ee:     	cmpq	%r8, %rdx
14009e0f1:     	jae	0x14009e1b5 <.text+0x9d1b5>
14009e0f7:     	movq	0x210(%rsi), %r9
14009e0fe:     	movq	(%r9,%rdx,8), %r10
14009e102:     	testq	%r10, %r10
14009e105:     	je	0x14009e1b5 <.text+0x9d1b5>
14009e10b:     	movq	0x1e0(%rsi), %rdx
14009e112:     	notq	%r10
14009e115:     	imulq	$0x38, %r10, %r10
14009e119:     	cmpb	$0x0, 0x30(%rdx,%r10)
14009e11f:     	je	0x14009e1b5 <.text+0x9d1b5>
14009e125:     	addq	%rdx, %r10
14009e128:     	movq	0x10(%r10), %r10
14009e12c:     	cmpb	0x1c(%r10), %bl
14009e130:     	je	0x14009e218 <.text+0x9d218>
14009e136:     	movabsq	$-0x990d3248f4f83d5, %r10 # imm = 0xF66F2CDB70B07C2B
14009e140:     	xorl	%r11d, %r11d
14009e143:     	pcmpeqd	%xmm2, %xmm2
14009e147:     	andq	%rcx, %r10
14009e14a:     	movdqu	(%rax,%r10), %xmm3
14009e150:     	movdqa	%xmm3, %xmm4
14009e154:     	pcmpeqb	%xmm0, %xmm4
14009e158:     	pmovmskb	%xmm4, %edi
14009e15c:     	testl	%edi, %edi
14009e15e:     	je	0x14009e198 <.text+0x9d198>
14009e160:     	tzcntl	%edi, %r14d
14009e165:     	addq	%r10, %r14
14009e168:     	andq	%rcx, %r14
14009e16b:     	negq	%r14
14009e16e:     	leaq	(%r14,%r14,2), %r14
14009e172:     	movdqu	-0x18(%rax,%r14,8), %xmm4
14009e179:     	pcmpeqb	%xmm1, %xmm4
14009e17d:     	pmovmskb	%xmm4, %r15d
14009e182:     	cmpl	$0xffff, %r15d          # imm = 0xFFFF
14009e189:     	je	0x14009e1e1 <.text+0x9d1e1>
14009e18b:     	leal	-0x1(%rdi), %r14d
14009e18f:     	andw	%di, %r14w
14009e193:     	movl	%r14d, %edi
14009e196:     	jne	0x14009e160 <.text+0x9d160>
14009e198:     	pcmpeqb	%xmm2, %xmm3
14009e19c:     	pmovmskb	%xmm3, %edi
14009e1a0:     	testl	%edi, %edi
14009e1a2:     	jne	0x14009e228 <.text+0x9d228>
14009e1a8:     	addq	%r11, %r10
14009e1ab:     	addq	$0x10, %r10
14009e1af:     	addq	$0x10, %r11
14009e1b3:     	jmp	0x14009e147 <.text+0x9d147>
14009e1b5:     	leaq	-0x1(%rbp), %rax
14009e1b9:     	movq	%rax, -0x28(%rbp)
14009e1bd:     	leaq	0x4f5adec(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
14009e1c4:     	movq	%rax, -0x20(%rbp)
14009e1c8:     	leaq	0x585b0f1(%rip), %rcx   # 0x1458f92c0
14009e1cf:     	leaq	0x585ceba(%rip), %r8    # 0x1458fb090
14009e1d6:     	leaq	-0x28(%rbp), %rdx
14009e1da:     	callq	0x1458e7790 <.text+0x58e6790>
14009e1df:     	ud2
14009e1e1:     	leaq	(%rax,%r14,8), %rax
14009e1e5:     	movq	-0x8(%rax), %rax
14009e1e9:     	cmpq	%r8, %rax
14009e1ec:     	jae	0x14009e228 <.text+0x9d228>
14009e1ee:     	movq	(%r9,%rax,8), %rax
14009e1f2:     	testq	%rax, %rax
14009e1f5:     	je	0x14009e228 <.text+0x9d228>
14009e1f7:     	notq	%rax
14009e1fa:     	imulq	$0x38, %rax, %rax
14009e1fe:     	cmpb	$0x0, 0x30(%rdx,%rax)
14009e203:     	je	0x14009e228 <.text+0x9d228>
14009e205:     	addq	%rax, %rdx
14009e208:     	movq	0x10(%rdx), %rax
14009e20c:     	movl	0x5b0(%rsi), %ecx
14009e212:     	movl	%ecx, 0x2c(%rdx)
14009e215:     	movb	%bl, 0x1c(%rax)
14009e218:     	addq	$0x88, %rsp
14009e21f:     	popq	%rbx
14009e220:     	popq	%rdi
14009e221:     	popq	%rsi
14009e222:     	popq	%r14
14009e224:     	popq	%r15
14009e226:     	popq	%rbp
14009e227:     	retq
14009e228:     	leaq	-0x1(%rbp), %rax
14009e22c:     	movq	%rax, -0x28(%rbp)
14009e230:     	leaq	0x4f5ad79(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
14009e237:     	movq	%rax, -0x20(%rbp)
14009e23b:     	leaq	0x585b07e(%rip), %rcx   # 0x1458f92c0
14009e242:     	leaq	0x585ce5f(%rip), %r8    # 0x1458fb0a8
14009e249:     	leaq	-0x28(%rbp), %rdx
14009e24d:     	callq	0x1458e7790 <.text+0x58e6790>
14009e252:     	ud2

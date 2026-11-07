
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140adbb90:     	pushq	%rbp
140adbb91:     	pushq	%r15
140adbb93:     	pushq	%r14
140adbb95:     	pushq	%r12
140adbb97:     	pushq	%rsi
140adbb98:     	pushq	%rdi
140adbb99:     	pushq	%rbx
140adbb9a:     	subq	$0x640, %rsp            # imm = 0x640
140adbba1:     	leaq	0x80(%rsp), %rbp
140adbba9:     	movq	$-0x2, 0x5b8(%rbp)
140adbbb4:     	movq	%rdx, %rsi
140adbbb7:     	leaq	0x40(%rdx), %rdi
140adbbbb:     	leaq	0x5a8(%rdx), %r12
140adbbc2:     	movq	%rdi, 0x548(%rbp)
140adbbc9:     	movq	%r12, 0x550(%rbp)
140adbbd0:     	movq	$0x0, 0x530(%rbp)
140adbbdb:     	movq	$0x8, 0x538(%rbp)
140adbbe6:     	movq	$0x0, 0x540(%rbp)
140adbbf1:     	cmpq	$0x0, 0x90(%rdx)
140adbbf9:     	je	0x140adbcab <.text+0xadacab>
140adbbff:     	movabsq	$-0x57edb0dd5f2a9758, %rcx # imm = 0xA8124F22A0D568A8
140adbc09:     	movq	0x78(%rsi), %rax
140adbc0d:     	movq	0x80(%rsi), %rdx
140adbc14:     	xorl	%r8d, %r8d
140adbc17:     	movdqa	0x52e6f01(%rip), %xmm0  # 0x145dc2b20
140adbc1f:     	pcmpeqd	%xmm1, %xmm1
140adbc23:     	movdqa	0x537fad5(%rip), %xmm2  # 0x145e5b700
140adbc2b:     	andq	%rdx, %rcx
140adbc2e:     	movdqu	(%rax,%rcx), %xmm3
140adbc33:     	movdqa	%xmm3, %xmm4
140adbc37:     	pcmpeqb	%xmm0, %xmm4
140adbc3b:     	pmovmskb	%xmm4, %r9d
140adbc40:     	testl	%r9d, %r9d
140adbc43:     	je	0x140adbc90 <.text+0xadac90>
140adbc45:     	tzcntl	%r9d, %r10d
140adbc4a:     	addq	%rcx, %r10
140adbc4d:     	andq	%rdx, %r10
140adbc50:     	negq	%r10
140adbc53:     	leaq	(%r10,%r10,2), %r10
140adbc57:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140adbc5e:     	pcmpeqb	%xmm2, %xmm4
140adbc62:     	pmovmskb	%xmm4, %r11d
140adbc67:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140adbc6e:     	je	0x140adbd5f <.text+0xadad5f>
140adbc74:     	leal	-0x1(%r9), %r10d
140adbc78:     	andw	%r9w, %r10w
140adbc7c:     	movl	%r10d, %r9d
140adbc7f:     	jne	0x140adbc45 <.text+0xadac45>
140adbc81:     	nopw	%cs:(%rax,%rax)
140adbc90:     	pcmpeqb	%xmm1, %xmm3
140adbc94:     	pmovmskb	%xmm3, %r9d
140adbc99:     	testl	%r9d, %r9d
140adbc9c:     	jne	0x140adbcab <.text+0xadacab>
140adbc9e:     	addq	%r8, %rcx
140adbca1:     	addq	$0x10, %rcx
140adbca5:     	addq	$0x10, %r8
140adbca9:     	jmp	0x140adbc2b <.text+0xadac2b>
140adbcab:     	movzbl	0xa0(%rsi), %eax
140adbcb2:     	movq	0xe0(%rsi), %rax
140adbcb9:     	movq	0xe8(%rsi), %rcx
140adbcc0:     	movabsq	$-0x57edb0dd5f2a9758, %rdx # imm = 0xA8124F22A0D568A8
140adbcca:     	xorl	%r8d, %r8d
140adbccd:     	movdqa	0x52e6e4b(%rip), %xmm0  # 0x145dc2b20
140adbcd5:     	pcmpeqd	%xmm1, %xmm1
140adbcd9:     	movdqa	0x537fa1f(%rip), %xmm2  # 0x145e5b700
140adbce1:     	andq	%rcx, %rdx
140adbce4:     	movdqu	(%rax,%rdx), %xmm3
140adbce9:     	movdqa	%xmm3, %xmm4
140adbced:     	pcmpeqb	%xmm0, %xmm4
140adbcf1:     	pmovmskb	%xmm4, %r11d
140adbcf6:     	testl	%r11d, %r11d
140adbcf9:     	je	0x140adbd40 <.text+0xadad40>
140adbcfb:     	tzcntl	%r11d, %r10d
140adbd00:     	addq	%rdx, %r10
140adbd03:     	andq	%rcx, %r10
140adbd06:     	movq	%r10, %rbx
140adbd09:     	shlq	$0x7, %rbx
140adbd0d:     	movq	%rax, %r9
140adbd10:     	subq	%rbx, %r9
140adbd13:     	movdqu	-0x80(%r9), %xmm4
140adbd19:     	pcmpeqb	%xmm2, %xmm4
140adbd1d:     	pmovmskb	%xmm4, %ebx
140adbd21:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
140adbd27:     	je	0x140adbd7c <.text+0xadad7c>
140adbd29:     	leal	-0x1(%r11), %r9d
140adbd2d:     	andw	%r11w, %r9w
140adbd31:     	movl	%r9d, %r11d
140adbd34:     	jne	0x140adbcfb <.text+0xadacfb>
140adbd36:     	nopw	%cs:(%rax,%rax)
140adbd40:     	pcmpeqb	%xmm1, %xmm3
140adbd44:     	pmovmskb	%xmm3, %r9d
140adbd49:     	testl	%r9d, %r9d
140adbd4c:     	jne	0x140adbdef <.text+0xadadef>
140adbd52:     	addq	%r8, %rdx
140adbd55:     	addq	$0x10, %rdx
140adbd59:     	addq	$0x10, %r8
140adbd5d:     	jmp	0x140adbce1 <.text+0xadace1>
140adbd5f:     	leaq	(%rax,%r10,8), %rax
140adbd63:     	movq	-0x8(%rax), %r14
140adbd67:     	movq	0x530(%rbp), %rdx
140adbd6e:     	testq	%rdx, %rdx
140adbd71:     	jne	0x140adbe71 <.text+0xadae71>
140adbd77:     	jmp	0x140adbe87 <.text+0xadae87>
140adbd7c:     	leaq	-0x10(%r10), %rdx
140adbd80:     	andq	%rcx, %rdx
140adbd83:     	movdqu	(%rax,%rdx), %xmm0
140adbd88:     	pcmpeqd	%xmm1, %xmm1
140adbd8c:     	pcmpeqb	%xmm1, %xmm0
140adbd90:     	pmovmskb	%xmm0, %ecx
140adbd94:     	movdqu	(%rax,%r10), %xmm0
140adbd9a:     	pcmpeqb	%xmm1, %xmm0
140adbd9e:     	pmovmskb	%xmm0, %r8d
140adbda3:     	movw	$0x1f, %r11w
140adbda8:     	bsrw	%cx, %r11w
140adbdad:     	xorl	$0xf, %r11d
140adbdb1:     	orl	$0x10000, %r8d          # imm = 0x10000
140adbdb8:     	tzcntl	%r8d, %r8d
140adbdbd:     	addl	%r11d, %r8d
140adbdc0:     	movb	$-0x80, %cl
140adbdc2:     	cmpw	$0xf, %r8w
140adbdc7:     	ja	0x140adbdd2 <.text+0xadadd2>
140adbdc9:     	incq	0xf0(%rsi)
140adbdd0:     	movb	$-0x1, %cl
140adbdd2:     	movb	%cl, (%rax,%r10)
140adbdd6:     	movb	%cl, 0x10(%rax,%rdx)
140adbdda:     	decq	0xf8(%rsi)
140adbde1:     	movq	-0x70(%r9), %rax
140adbde5:     	cmpq	$0x2, %rax
140adbde9:     	jne	0x140adc730 <.text+0xadb730>
140adbdef:     	movq	(%r12), %r14
140adbdf3:     	leaq	0x1(%r14), %rax
140adbdf7:     	movq	%rax, (%r12)
140adbdfb:     	movw	$0x100, -0x10(%rbp)     # imm = 0x100
140adbe01:     	movq	$0x1, -0x60(%rbp)
140adbe09:     	movdqu	0x547371f(%rip), %xmm0  # 0x145f4f530
140adbe11:     	movdqu	%xmm0, -0x58(%rbp)
140adbe16:     	movq	$0x8, -0x38(%rbp)
140adbe1e:     	movq	$0x50, -0x30(%rbp)
140adbe26:     	leaq	-0x4914d(%rip), %rax    # 0x140a92ce0 <.text+0xa91ce0>
140adbe2d:     	movq	%rax, -0x18(%rbp)
140adbe31:     	movb	$0x1, -0xe(%rbp)
140adbe35:     	movq	$0x0, -0x48(%rbp)
140adbe3d:     	movb	$0x2, -0x28(%rbp)
140adbe41:     	leaq	-0x60(%rbp), %r8
140adbe45:     	movq	%rdi, %rcx
140adbe48:     	movq	%r14, %rdx
140adbe4b:     	callq	0x140011c70 <.text+0x10c70>
140adbe50:     	nop
140adbe51:     	leaq	0x78(%rsi), %rcx
140adbe55:     	leaq	0x54736d4(%rip), %rdx   # 0x145f4f530
140adbe5c:     	movq	%r14, %r8
140adbe5f:     	callq	0x140011ac0 <.text+0x10ac0>

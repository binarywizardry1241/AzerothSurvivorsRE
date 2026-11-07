
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552dd50:     	pushq	%rbp
14552dd51:     	pushq	%r14
14552dd53:     	pushq	%rsi
14552dd54:     	pushq	%rdi
14552dd55:     	pushq	%rbx
14552dd56:     	subq	$0x80, %rsp
14552dd5d:     	leaq	0x80(%rsp), %rbp
14552dd65:     	movq	$-0x2, -0x8(%rbp)
14552dd6d:     	movq	%rdx, %rdi
14552dd70:     	movq	%rcx, %rsi
14552dd73:     	callq	0x140002200 <.text+0x1200>
14552dd78:     	movl	$0x1, %ecx
14552dd7d:     	movl	$0x1, %edx
14552dd82:     	callq	0x1400021c0 <.text+0x11c0>
14552dd87:     	testq	%rax, %rax
14552dd8a:     	je	0x14552dede <.text+0x552cede>
14552dd90:     	movb	$0x7b, (%rax)
14552dd93:     	movq	$0x1, -0x28(%rbp)
14552dd9b:     	movq	%rax, -0x20(%rbp)
14552dd9f:     	movq	$0x1, -0x18(%rbp)
14552dda7:     	movb	$0x1, -0x10(%rbp)
14552ddab:     	leaq	0x1807ee2(%rip), %rax   # 0x146d35c94
14552ddb2:     	movq	%rax, 0x20(%rsp)
14552ddb7:     	movq	$0xb, 0x28(%rsp)
14552ddc0:     	leaq	0x1807ec9(%rip), %r8    # 0x146d35c90
14552ddc7:     	leaq	-0x48(%rbp), %rbx
14552ddcb:     	leaq	-0x28(%rbp), %rdx
14552ddcf:     	movl	$0x4, %r9d
14552ddd5:     	movq	%rbx, %rcx
14552ddd8:     	callq	0x145456ed0 <.text+0x5455ed0>
14552dddd:     	movups	0x8(%rdi), %xmm0
14552dde1:     	movups	%xmm0, 0x20(%rsp)
14552dde6:     	leaq	0x1807eb2(%rip), %r8    # 0x146d35c9f
14552dded:     	leaq	-0x28(%rbp), %r14
14552ddf1:     	movl	$0x3, %r9d
14552ddf7:     	movq	%r14, %rcx
14552ddfa:     	movq	%rbx, %rdx
14552ddfd:     	callq	0x145456ed0 <.text+0x5455ed0>
14552de02:     	movups	0x20(%rdi), %xmm0
14552de06:     	movups	%xmm0, 0x20(%rsp)
14552de0b:     	leaq	0x1807e90(%rip), %r8    # 0x146d35ca2
14552de12:     	movl	$0x4, %r9d
14552de18:     	movq	%rbx, %rcx
14552de1b:     	movq	%r14, %rdx
14552de1e:     	callq	0x145456ed0 <.text+0x5455ed0>
14552de23:     	movups	0x38(%rdi), %xmm0
14552de27:     	movups	%xmm0, 0x20(%rsp)
14552de2c:     	leaq	0x1807e73(%rip), %r8    # 0x146d35ca6
14552de33:     	movl	$0x4, %r9d
14552de39:     	movq	%r14, %rcx
14552de3c:     	movq	%rbx, %rdx
14552de3f:     	callq	0x145456ed0 <.text+0x5455ed0>
14552de44:     	movups	0x58(%rdi), %xmm0
14552de48:     	movups	%xmm0, 0x20(%rsp)
14552de4d:     	leaq	0x1807e56(%rip), %r8    # 0x146d35caa
14552de54:     	movl	$0x4, %r9d
14552de5a:     	movq	%rbx, %rcx
14552de5d:     	movq	%r14, %rdx
14552de60:     	callq	0x145456ed0 <.text+0x5455ed0>
14552de65:     	movl	0x68(%rdi), %eax
14552de68:     	movl	%eax, 0x20(%rsp)
14552de6c:     	leaq	0x1807e3b(%rip), %r8    # 0x146d35cae
14552de73:     	leaq	-0x28(%rbp), %rcx
14552de77:     	movl	$0x6, %r9d
14552de7d:     	movq	%rbx, %rdx
14552de80:     	callq	0x145454010 <.text+0x5453010>
14552de85:     	movq	-0x18(%rbp), %rdi
14552de89:     	cmpq	%rdi, -0x28(%rbp)
14552de8d:     	je	0x14552deba <.text+0x552ceba>
14552de8f:     	movq	-0x20(%rbp), %rax
14552de93:     	movb	$0x7d, (%rax,%rdi)
14552de97:     	incq	%rdi
14552de9a:     	movq	%rdi, -0x18(%rbp)
14552de9e:     	movq	%rdi, 0x10(%rsi)
14552dea2:     	movups	-0x28(%rbp), %xmm0
14552dea6:     	movups	%xmm0, (%rsi)
14552dea9:     	movq	%rsi, %rax
14552deac:     	addq	$0x80, %rsp
14552deb3:     	popq	%rbx
14552deb4:     	popq	%rdi
14552deb5:     	popq	%rsi
14552deb6:     	popq	%r14
14552deb8:     	popq	%rbp
14552deb9:     	retq
14552deba:     	movq	$0x1, 0x20(%rsp)
14552dec3:     	leaq	-0x28(%rbp), %rcx
14552dec7:     	movl	$0x1, %r8d
14552decd:     	movl	$0x1, %r9d
14552ded3:     	movq	%rdi, %rdx
14552ded6:     	callq	0x1457744b0 <.text+0x57734b0>
14552dedb:     	nop
14552dedc:     	jmp	0x14552de8f <.text+0x552ce8f>
14552dede:     	movl	$0x1, %ecx
14552dee3:     	movl	$0x1, %edx
14552dee8:     	callq	0x14590379b <.text+0x590279b>
14552deed:     	ud2

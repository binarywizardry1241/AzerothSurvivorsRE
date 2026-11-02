
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145961e80:     	pushq	%r14
145961e82:     	pushq	%rsi
145961e83:     	pushq	%rdi
145961e84:     	pushq	%rbx
145961e85:     	subq	$0x28, %rsp
145961e89:     	movq	(%rdx), %r8
145961e8c:     	movq	0x8(%rdx), %r10
145961e90:     	subq	%r8, %r10
145961e93:     	jb	0x145961f5c <.text+0x5960f5c>
145961e99:     	movq	%rcx, %r9
145961e9c:     	incq	%r10
145961e9f:     	jne	0x145961ee6 <.text+0x5960ee6>
145961ea1:     	movq	0x18(%r9), %rax
145961ea5:     	movq	(%r9), %rcx
145961ea8:     	leaq	(%rax,%rcx), %r8
145961eac:     	rolq	$0x17, %r8
145961eb0:     	movq	0x8(%r9), %rdx
145961eb4:     	addq	%rcx, %r8
145961eb7:     	movq	%rdx, %r10
145961eba:     	shlq	$0x11, %r10
145961ebe:     	movq	0x10(%r9), %r11
145961ec2:     	xorq	%rcx, %r11
145961ec5:     	xorq	%rdx, %rax
145961ec8:     	xorq	%r11, %rdx
145961ecb:     	movq	%rdx, 0x8(%r9)
145961ecf:     	xorq	%rax, %rcx
145961ed2:     	movq	%rcx, (%r9)
145961ed5:     	xorq	%r10, %r11
145961ed8:     	movq	%r11, 0x10(%r9)
145961edc:     	rolq	$0x2d, %rax
145961ee0:     	movq	%rax, 0x18(%r9)
145961ee4:     	jmp	0x145961f4f <.text+0x5960f4f>
145961ee6:     	bsrq	%r10, %rcx
145961eea:     	notl	%ecx
145961eec:     	movq	%r10, %r11
145961eef:     	shlq	%cl, %r11
145961ef2:     	decq	%r11
145961ef5:     	movq	(%r9), %rdi
145961ef8:     	movq	0x8(%r9), %rcx
145961efc:     	movq	0x18(%r9), %rbx
145961f00:     	movq	0x10(%r9), %rsi
145961f04:     	nopw	%cs:(%rax,%rax)
145961f10:     	leaq	(%rdi,%rbx), %rax
145961f14:     	rolq	$0x17, %rax
145961f18:     	addq	%rdi, %rax
145961f1b:     	movq	%rcx, %r14
145961f1e:     	shlq	$0x11, %r14
145961f22:     	xorq	%rdi, %rsi
145961f25:     	xorq	%rcx, %rbx
145961f28:     	xorq	%rbx, %rdi
145961f2b:     	rolq	$0x2d, %rbx
145961f2f:     	xorq	%rsi, %rcx
145961f32:     	mulq	%r10
145961f35:     	xorq	%r14, %rsi
145961f38:     	cmpq	%rax, %r11
145961f3b:     	jb	0x145961f10 <.text+0x5960f10>
145961f3d:     	movq	%rdi, (%r9)
145961f40:     	movq	%rbx, 0x18(%r9)
145961f44:     	movq	%rcx, 0x8(%r9)
145961f48:     	movq	%rsi, 0x10(%r9)
145961f4c:     	addq	%rdx, %r8
145961f4f:     	movq	%r8, %rax
145961f52:     	addq	$0x28, %rsp
145961f56:     	popq	%rbx
145961f57:     	popq	%rdi
145961f58:     	popq	%rsi
145961f59:     	popq	%r14
145961f5b:     	retq
145961f5c:     	leaq	0x1519ada(%rip), %rcx   # 0x146e7ba3d
145961f63:     	leaq	0x1519b4e(%rip), %r8    # 0x146e7bab8
145961f6a:     	movl	$0x19, %edx
145961f6f:     	callq	0x145d699a0 <.text+0x5d689a0>
145961f74:     	ud2

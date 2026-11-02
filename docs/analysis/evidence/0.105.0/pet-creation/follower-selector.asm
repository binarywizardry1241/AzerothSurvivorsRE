
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14599cd90:     	pushq	%rbp
14599cd91:     	pushq	%r15
14599cd93:     	pushq	%r14
14599cd95:     	pushq	%r13
14599cd97:     	pushq	%r12
14599cd99:     	pushq	%rsi
14599cd9a:     	pushq	%rdi
14599cd9b:     	pushq	%rbx
14599cd9c:     	subq	$0x48, %rsp
14599cda0:     	leaq	0x40(%rsp), %rbp
14599cda5:     	movq	$-0x2, (%rbp)
14599cdad:     	movq	%rcx, %rsi
14599cdb0:     	movq	(%rdx), %r14
14599cdb3:     	movq	0x8(%rdx), %r15
14599cdb7:     	cmpq	%r15, %r14
14599cdba:     	je	0x14599ced3 <.text+0x599bed3>
14599cdc0:     	movq	0x10(%rdx), %r12
14599cdc4:     	addq	$0x40, %r14
14599cdc8:     	jmp	0x14599cde5 <.text+0x599bde5>
14599cdca:     	nopw	(%rax,%rax)
14599cdd0:     	leaq	-0x40(%r14), %rax
14599cdd4:     	addq	$0x40, %r14
14599cdd8:     	addq	$0x40, %rax
14599cddc:     	cmpq	%r15, %rax
14599cddf:     	je	0x14599ced3 <.text+0x599bed3>
14599cde5:     	cmpb	$0x1d, -0x40(%r14)
14599cdea:     	jne	0x14599cdd0 <.text+0x599bdd0>
14599cdec:     	movq	-0x38(%r14), %rdi
14599cdf0:     	cmpb	$0x1, (%r12)
14599cdf5:     	jne	0x14599ce01 <.text+0x599be01>
14599cdf7:     	movzbl	0x39(%rdi), %eax
14599cdfb:     	decb	%al
14599cdfd:     	cmpb	$0x3, %al
14599cdff:     	jbe	0x14599cdd0 <.text+0x599bdd0>
14599ce01:     	movq	%r14, (%rdx)
14599ce04:     	callq	0x140002200 <.text+0x1200>
14599ce09:     	movl	$0x20, %ecx
14599ce0e:     	movl	$0x8, %edx
14599ce13:     	callq	0x1400021c0 <.text+0x11c0>
14599ce18:     	testq	%rax, %rax
14599ce1b:     	je	0x14599cefe <.text+0x599befe>
14599ce21:     	movq	%rdi, (%rax)
14599ce24:     	movq	$0x4, -0x18(%rbp)
14599ce2c:     	movq	%rax, -0x10(%rbp)
14599ce30:     	movq	$0x1, -0x8(%rbp)
14599ce38:     	cmpq	%r15, %r14
14599ce3b:     	je	0x14599ceba <.text+0x599beba>
14599ce41:     	movl	$0x1, %edi
14599ce46:     	leaq	-0x18(%rbp), %rbx
14599ce4a:     	addq	$0x40, %r14
14599ce4e:     	jmp	0x14599ce61 <.text+0x599be61>
14599ce50:     	leaq	-0x40(%r14), %rcx
14599ce54:     	addq	$0x40, %r14
14599ce58:     	addq	$0x40, %rcx
14599ce5c:     	cmpq	%r15, %rcx
14599ce5f:     	je	0x14599ceba <.text+0x599beba>
14599ce61:     	cmpb	$0x1d, -0x40(%r14)
14599ce66:     	jne	0x14599ce50 <.text+0x599be50>
14599ce68:     	movq	-0x38(%r14), %r13
14599ce6c:     	cmpb	$0x1, (%r12)
14599ce71:     	jne	0x14599ce7f <.text+0x599be7f>
14599ce73:     	movzbl	0x39(%r13), %ecx
14599ce78:     	decb	%cl
14599ce7a:     	cmpb	$0x3, %cl
14599ce7d:     	jbe	0x14599ce50 <.text+0x599be50>
14599ce7f:     	cmpq	-0x18(%rbp), %rdi
14599ce83:     	jne	0x14599ceaa <.text+0x599beaa>
14599ce85:     	movq	$0x8, 0x20(%rsp)
14599ce8e:     	movl	$0x1, %r8d
14599ce94:     	movl	$0x8, %r9d
14599ce9a:     	movq	%rbx, %rcx
14599ce9d:     	movq	%rdi, %rdx
14599cea0:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14599cea5:     	nop
14599cea6:     	movq	-0x10(%rbp), %rax
14599ceaa:     	movq	%r13, (%rax,%rdi,8)
14599ceae:     	incq	%rdi
14599ceb1:     	movq	%rdi, -0x8(%rbp)
14599ceb5:     	cmpq	%r15, %r14
14599ceb8:     	jne	0x14599ce4a <.text+0x599be4a>
14599ceba:     	movq	-0x8(%rbp), %rax
14599cebe:     	movq	%rax, 0x10(%rsi)
14599cec2:     	movq	-0x18(%rbp), %rax
14599cec6:     	movq	%rax, (%rsi)
14599cec9:     	movq	-0x10(%rbp), %rax
14599cecd:     	movq	%rax, 0x8(%rsi)
14599ced1:     	jmp	0x14599ceea <.text+0x599beea>
14599ced3:     	movq	$0x0, (%rsi)
14599ceda:     	movq	$0x8, 0x8(%rsi)
14599cee2:     	movq	$0x0, 0x10(%rsi)
14599ceea:     	movq	%rsi, %rax
14599ceed:     	addq	$0x48, %rsp
14599cef1:     	popq	%rbx
14599cef2:     	popq	%rdi
14599cef3:     	popq	%rsi
14599cef4:     	popq	%r12
14599cef6:     	popq	%r13
14599cef8:     	popq	%r14
14599cefa:     	popq	%r15
14599cefc:     	popq	%rbp
14599cefd:     	retq
14599cefe:     	movl	$0x8, %ecx
14599cf03:     	movl	$0x20, %edx
14599cf08:     	callq	0x145d6944b <.text+0x5d6844b>
14599cf0d:     	ud2

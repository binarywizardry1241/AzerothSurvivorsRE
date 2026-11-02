
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f5f00:     	pushq	%rbp
1454f5f01:     	pushq	%r14
1454f5f03:     	pushq	%rsi
1454f5f04:     	pushq	%rdi
1454f5f05:     	pushq	%rbx
1454f5f06:     	subq	$0x60, %rsp
1454f5f0a:     	leaq	0x60(%rsp), %rbp
1454f5f0f:     	movq	$-0x2, -0x8(%rbp)
1454f5f17:     	movq	%rcx, %rsi
1454f5f1a:     	movq	0x2b8(%rcx), %rdi
1454f5f21:     	movq	%rdi, %rbx
1454f5f24:     	shlq	$0x4, %rbx
1454f5f28:     	testq	%rdi, %rdi
1454f5f2b:     	je	0x1454f5f59 <.text+0x54f4f59>
1454f5f2d:     	movq	0x2b0(%rsi), %r14
1454f5f34:     	callq	0x140002200 <.text+0x1200>
1454f5f39:     	movl	$0x8, %edx
1454f5f3e:     	movq	%rbx, %rcx
1454f5f41:     	callq	0x1400021c0 <.text+0x11c0>
1454f5f46:     	testq	%rax, %rax
1454f5f49:     	je	0x1454f608f <.text+0x54f508f>
1454f5f4f:     	cmpq	$0x1, %rdi
1454f5f53:     	jne	0x1454f5f60 <.text+0x54f4f60>
1454f5f55:     	xorl	%ecx, %ecx
1454f5f57:     	jmp	0x1454f5fbc <.text+0x54f4fbc>
1454f5f59:     	movl	$0x8, %eax
1454f5f5e:     	jmp	0x1454f5fd7 <.text+0x54f4fd7>
1454f5f60:     	movq	%rdi, %rdx
1454f5f63:     	andq	$-0x2, %rdx
1454f5f67:     	movq	%rax, %r8
1454f5f6a:     	addq	$0x18, %r8
1454f5f6e:     	xorl	%ecx, %ecx
1454f5f70:     	movq	%r14, %r9
1454f5f73:     	nopw	%cs:(%rax,%rax)
1454f5f80:     	movq	(%r9), %r10
1454f5f83:     	movl	0x40(%r10), %r10d
1454f5f87:     	movq	%rcx, -0x18(%r8)
1454f5f8b:     	movl	%r10d, -0x10(%r8)
1454f5f8f:     	movq	0x58(%r9), %r10
1454f5f93:     	movl	0x40(%r10), %r10d
1454f5f97:     	leaq	0x1(%rcx), %r11
1454f5f9b:     	movq	%r11, -0x8(%r8)
1454f5f9f:     	movl	%r10d, (%r8)
1454f5fa2:     	addq	$0x2, %rcx
1454f5fa6:     	addq	$0xb0, %r9
1454f5fad:     	addq	$0x20, %r8
1454f5fb1:     	cmpq	%rdx, %rcx
1454f5fb4:     	jne	0x1454f5f80 <.text+0x54f4f80>
1454f5fb6:     	testb	$0x1, %dil
1454f5fba:     	je	0x1454f5fd7 <.text+0x54f4fd7>
1454f5fbc:     	imulq	$0x58, %rcx, %rdx
1454f5fc0:     	movq	(%r14,%rdx), %rdx
1454f5fc4:     	movl	0x40(%rdx), %edx
1454f5fc7:     	movq	%rcx, %r8
1454f5fca:     	shlq	$0x4, %r8
1454f5fce:     	movq	%rcx, (%rax,%r8)
1454f5fd2:     	movl	%edx, 0x8(%rax,%r8)
1454f5fd7:     	movq	%rdi, -0x20(%rbp)
1454f5fdb:     	movq	%rax, -0x18(%rbp)
1454f5fdf:     	movq	%rdi, -0x10(%rbp)
1454f5fe3:     	movq	0x390(%rsi), %rax
1454f5fea:     	movl	0x40(%rax), %r14d
1454f5fee:     	leaq	-0x20(%rbp), %rcx
1454f5ff2:     	callq	0x145774860 <.text+0x5773860>
1454f5ff7:     	nop
1454f5ff8:     	movq	-0x18(%rbp), %rax
1454f5ffc:     	movq	$0xb, (%rax,%rbx)
1454f6004:     	movl	%r14d, 0x8(%rax,%rbx)
1454f6009:     	incq	%rdi
1454f600c:     	movq	%rdi, -0x10(%rbp)
1454f6010:     	movq	-0x18(%rbp), %rdx
1454f6014:     	leaq	-0x40(%rbp), %rcx
1454f6018:     	movq	%rdi, %r8
1454f601b:     	callq	0x14545c420 <.text+0x545b420>
1454f6020:     	nop
1454f6021:     	movq	0x560(%rsi), %rdi
1454f6028:     	cmpq	0x550(%rsi), %rdi
1454f602f:     	jne	0x1454f603e <.text+0x54f503e>
1454f6031:     	leaq	0x550(%rsi), %rcx
1454f6038:     	callq	0x145774710 <.text+0x5773710>
1454f603d:     	nop
1454f603e:     	movq	0x558(%rsi), %rax
1454f6045:     	movq	%rdi, %rcx
1454f6048:     	shlq	$0x5, %rcx
1454f604c:     	movups	-0x40(%rbp), %xmm0
1454f6050:     	movups	-0x30(%rbp), %xmm1
1454f6054:     	movups	%xmm1, 0x10(%rax,%rcx)
1454f6059:     	movups	%xmm0, (%rax,%rcx)
1454f605d:     	incq	%rdi
1454f6060:     	movq	%rdi, 0x560(%rsi)
1454f6067:     	movq	-0x20(%rbp), %rdx
1454f606b:     	testq	%rdx, %rdx
1454f606e:     	je	0x1454f6084 <.text+0x54f5084>
1454f6070:     	movq	-0x18(%rbp), %rcx
1454f6074:     	shlq	$0x4, %rdx
1454f6078:     	movl	$0x8, %r8d
1454f607e:     	callq	0x1400021d0 <.text+0x11d0>
1454f6083:     	nop
1454f6084:     	addq	$0x60, %rsp
1454f6088:     	popq	%rbx
1454f6089:     	popq	%rdi
1454f608a:     	popq	%rsi
1454f608b:     	popq	%r14
1454f608d:     	popq	%rbp
1454f608e:     	retq
1454f608f:     	movl	$0x8, %ecx
1454f6094:     	movq	%rbx, %rdx
1454f6097:     	callq	0x14590379b <.text+0x590279b>
1454f609c:     	ud2

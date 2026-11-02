
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140069df0:     	pushq	%r15
140069df2:     	pushq	%r14
140069df4:     	pushq	%r13
140069df6:     	pushq	%r12
140069df8:     	pushq	%rsi
140069df9:     	pushq	%rdi
140069dfa:     	pushq	%rbp
140069dfb:     	pushq	%rbx
140069dfc:     	subq	$0x148, %rsp            # imm = 0x148
140069e03:     	movq	0x1e0(%rsp), %rbx
140069e0b:     	movq	0x1d8(%rsp), %rcx
140069e13:     	movq	0x1d0(%rsp), %r11
140069e1b:     	movq	0x1c8(%rsp), %rsi
140069e23:     	movq	0x1c0(%rsp), %rdi
140069e2b:     	movq	0x1b8(%rsp), %r10
140069e33:     	movq	0x1b0(%rsp), %rax
140069e3b:     	movq	(%rdx), %r14
140069e3e:     	movq	0x10(%rdx), %r13
140069e42:     	movl	0x1c(%rdx), %r12d
140069e46:     	movq	(%rdi), %rdx
140069e49:     	movq	0x10(%rdi), %r15
140069e4d:     	movl	0x1c(%rdi), %ebp
140069e50:     	movq	(%rsi), %rdi
140069e53:     	movq	(%r11), %r11
140069e56:     	cmpb	$0x0, (%rdx)
140069e59:     	je	0x140069e71 <.text+0x68e71>
140069e5b:     	cmpb	$0x0, 0xd(%rdi)
140069e5f:     	jne	0x140069e71 <.text+0x68e71>
140069e61:     	cmpb	$0x0, 0xe8(%r11)
140069e69:     	jne	0x140069e71 <.text+0x68e71>
140069e6b:     	movl	%ebp, (%r15)
140069e6e:     	movb	$0x0, (%rdx)
140069e71:     	movq	%r11, 0x28(%rsp)
140069e76:     	movl	%ebp, 0x24(%rsp)
140069e7a:     	movq	%r15, 0x30(%rsp)
140069e7f:     	movq	%rdx, 0x40(%rsp)
140069e84:     	movq	(%r8), %rsi
140069e87:     	movq	0x10(%r8), %r11
140069e8b:     	movl	0x1c(%r8), %ebp
140069e8f:     	movq	(%r9), %r15
140069e92:     	movq	0x10(%r9), %rdx
140069e96:     	movq	%rdx, 0x58(%rsp)
140069e9b:     	movl	0x1c(%r9), %r9d
140069e9f:     	movq	(%rax), %r8
140069ea2:     	movq	0x10(%rax), %rdx
140069ea6:     	movq	%rdx, 0x50(%rsp)
140069eab:     	movl	0x1c(%rax), %eax
140069eae:     	movl	%eax, 0x3c(%rsp)
140069eb2:     	movq	(%r10), %rdx
140069eb5:     	movq	0x10(%r10), %rax
140069eb9:     	movq	%rax, 0x48(%rsp)
140069ebe:     	movl	0x1c(%r10), %r10d
140069ec2:     	movq	(%rcx), %rcx
140069ec5:     	movq	(%rbx), %rax
140069ec8:     	movl	%r12d, (%r13)
140069ecc:     	cmpb	$0x0, (%r14)
140069ed0:     	movb	$0x0, (%r14)
140069ed4:     	je	0x140069f14 <.text+0x68f14>
140069ed6:     	cmpb	$0x1, (%rax)
140069ed9:     	jne	0x140069ee1 <.text+0x68ee1>
140069edb:     	cmpb	$0x1, 0xd(%rdi)
140069edf:     	jne	0x140069f14 <.text+0x68f14>
140069ee1:     	cmpq	$-0x1, 0x78(%rsi)
140069ee6:     	je	0x140069f28 <.text+0x68f28>
140069ee8:     	movl	%ebp, (%r11)
140069eeb:     	movq	0x78(%rsi), %rdx
140069eef:     	cmpq	$-0x1, %rdx
140069ef3:     	je	0x140069f0c <.text+0x68f0c>
140069ef5:     	testq	%rdx, %rdx
140069ef8:     	je	0x140069f0c <.text+0x68f0c>
140069efa:     	movq	0x80(%rsi), %rcx
140069f01:     	movl	$0x1, %r8d
140069f07:     	callq	0x1400021d0 <.text+0x11d0>
140069f0c:     	movq	$-0x1, 0x78(%rsi)
140069f14:     	addq	$0x148, %rsp            # imm = 0x148
140069f1b:     	popq	%rbx
140069f1c:     	popq	%rbp
140069f1d:     	popq	%rdi
140069f1e:     	popq	%rsi
140069f1f:     	popq	%r12
140069f21:     	popq	%r13
140069f23:     	popq	%r14
140069f25:     	popq	%r15
140069f27:     	retq
140069f28:     	cmpb	$0x0, 0x190(%rsi)
140069f2f:     	je	0x140069f4f <.text+0x68f4f>
140069f31:     	movl	%ebp, (%r11)
140069f34:     	movq	%rsi, %rcx
140069f37:     	addq	$0x148, %rsp            # imm = 0x148
140069f3e:     	popq	%rbx
140069f3f:     	popq	%rbp
140069f40:     	popq	%rdi
140069f41:     	popq	%rsi
140069f42:     	popq	%r12
140069f44:     	popq	%r13
140069f46:     	popq	%r14
140069f48:     	popq	%r15
140069f4a:     	jmp	0x1401b4a40 <.text+0x1b3a40>
140069f4f:     	cmpb	$0x0, (%r15)
140069f53:     	je	0x140069f63 <.text+0x68f63>
140069f55:     	movq	0x58(%rsp), %rax
140069f5a:     	movl	%r9d, (%rax)
140069f5d:     	movb	$0x0, (%r15)
140069f61:     	jmp	0x140069f14 <.text+0x68f14>
140069f63:     	cmpb	$0x0, 0x72(%r8)
140069f68:     	je	0x140069f7c <.text+0x68f7c>
140069f6a:     	movq	0x50(%rsp), %rax
140069f6f:     	movl	0x3c(%rsp), %ecx
140069f73:     	movl	%ecx, (%rax)
140069f75:     	movb	$0x0, 0x72(%r8)
140069f7a:     	jmp	0x140069f14 <.text+0x68f14>
140069f7c:     	cmpb	$0x0, (%rdx)
140069f7f:     	je	0x140069f8e <.text+0x68f8e>
140069f81:     	movq	0x48(%rsp), %rax
140069f86:     	movl	%r10d, (%rax)
140069f89:     	movb	$0x0, (%rdx)
140069f8c:     	jmp	0x140069f14 <.text+0x68f14>
140069f8e:     	movq	0x40(%rsp), %rdx
140069f93:     	cmpb	$0x0, (%rdx)
140069f96:     	je	0x140069fab <.text+0x68fab>
140069f98:     	movq	0x30(%rsp), %rax
140069f9d:     	movl	0x24(%rsp), %ecx
140069fa1:     	movl	%ecx, (%rax)
140069fa3:     	movb	$0x0, (%rdx)
140069fa6:     	jmp	0x140069f14 <.text+0x68f14>
140069fab:     	cmpb	$0x0, 0xd(%rdi)
140069faf:     	movq	0x30(%rsp), %r8
140069fb4:     	movl	0x24(%rsp), %r9d
140069fb9:     	je	0x140069fca <.text+0x68fca>
140069fbb:     	movzbl	(%rdi), %eax
140069fbe:     	movl	%r9d, (%r8)
140069fc1:     	xorb	$0x1, %al
140069fc3:     	movb	%al, (%rdx)
140069fc5:     	jmp	0x140069f14 <.text+0x68f14>
140069fca:     	movq	0x28(%rsp), %rax
140069fcf:     	cmpb	$0x0, 0xea(%rax)
140069fd6:     	je	0x140069ff4 <.text+0x68ff4>
140069fd8:     	movb	$0x0, 0x64(%rsp)
140069fdd:     	movl	$0x7, 0x60(%rsp)
140069fe5:     	leaq	0x60(%rsp), %rdx
140069fea:     	callq	0x14004adf0 <.text+0x49df0>
140069fef:     	jmp	0x140069f14 <.text+0x68f14>
140069ff4:     	cmpb	$0x0, 0xe8(%rax)
140069ffb:     	je	0x140069f14 <.text+0x68f14>
14006a001:     	movq	0x28(%rsp), %rax
14006a006:     	cmpb	$-0x1, 0x80(%rax)
14006a00d:     	jne	0x140069f14 <.text+0x68f14>
14006a013:     	movq	0x28(%rsp), %rax
14006a018:     	cmpb	$-0x1, 0xa0(%rax)
14006a01f:     	jne	0x140069f14 <.text+0x68f14>
14006a025:     	movq	0x28(%rsp), %rax
14006a02a:     	cmpb	$0x0, 0xe9(%rax)
14006a031:     	je	0x14006a03a <.text+0x6903a>
14006a033:     	movb	$0x1, 0x64(%rsp)
14006a038:     	jmp	0x140069fdd <.text+0x68fdd>
14006a03a:     	movq	0x30(%rsp), %rax
14006a03f:     	movl	0x24(%rsp), %ecx
14006a043:     	movl	%ecx, (%rax)
14006a045:     	movq	0x40(%rsp), %rax
14006a04a:     	movb	$0x1, (%rax)
14006a04d:     	jmp	0x140069f14 <.text+0x68f14>


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145420ad0:     	pushq	%rbp
145420ad1:     	pushq	%r14
145420ad3:     	pushq	%rsi
145420ad4:     	pushq	%rdi
145420ad5:     	pushq	%rbx
145420ad6:     	subq	$0x90, %rsp
145420add:     	leaq	0x80(%rsp), %rbp
145420ae5:     	movaps	%xmm6, (%rbp)
145420ae9:     	movq	$-0x2, -0x8(%rbp)
145420af1:     	movaps	%xmm2, %xmm6
145420af4:     	movss	0x4e6994(%rip), %xmm0   # 0x145907490
145420afc:     	addss	%xmm2, %xmm0
145420b00:     	sqrtss	%xmm0, %xmm0
145420b04:     	addss	0x4e6a00(%rip), %xmm0   # 0x14590750c
145420b0c:     	mulss	0x4e6a28(%rip), %xmm0   # 0x14590753c
145420b14:     	movq	%rcx, %rsi
145420b17:     	movss	%xmm0, -0x2c(%rbp)
145420b1c:     	cmpb	$0x9, 0x75(%rdx)
145420b20:     	jne	0x145420bcc <.text+0x541fbcc>
145420b26:     	movl	0x68(%rdx), %eax
145420b29:     	cmpl	$0x6, %eax
145420b2c:     	je	0x145420c92 <.text+0x541fc92>
145420b32:     	cmpl	$0x7, %eax
145420b35:     	jne	0x145420bcc <.text+0x541fbcc>
145420b3b:     	leaq	0x13194bf(%rip), %rdi   # 0x14673a001
145420b42:     	movl	$0xc, %ebx
145420b47:     	movl	$0xc, %edx
145420b4c:     	movq	%rdi, %rcx
145420b4f:     	callq	0x145457cb0 <.text+0x5456cb0>
145420b54:     	testq	%rax, %rax
145420b57:     	cmovneq	%rax, %rdi
145420b5b:     	cmovneq	%rdx, %rbx
145420b5f:     	leaq	-0x2c(%rbp), %rax
145420b63:     	movq	%rax, -0x28(%rbp)
145420b67:     	leaq	0x318b82(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145420b6e:     	movq	%rax, -0x20(%rbp)
145420b72:     	leaq	0x131945c(%rip), %rdx   # 0x146739fd5
145420b79:     	leaq	-0x48(%rbp), %r14
145420b7d:     	leaq	-0x28(%rbp), %r8
145420b81:     	movq	%r14, %rcx
145420b84:     	callq	0x145728390 <.text+0x5727390>
145420b89:     	leaq	0x1319470(%rip), %rax   # 0x14673a000
145420b90:     	movq	%rax, -0x28(%rbp)
145420b94:     	movq	$0x1, -0x20(%rbp)
145420b9c:     	movq	%r14, -0x18(%rbp)
145420ba0:     	leaq	0x1319439(%rip), %rax   # 0x146739fe0
145420ba7:     	movq	%rax, -0x10(%rbp)
145420bab:     	movq	$0x1, 0x20(%rsp)
145420bb4:     	leaq	-0x28(%rbp), %r9
145420bb8:     	movq	%rsi, %rcx
145420bbb:     	movq	%rdi, %rdx
145420bbe:     	movq	%rbx, %r8
145420bc1:     	callq	0x145458060 <.text+0x5457060>
145420bc6:     	nop
145420bc7:     	jmp	0x145420c65 <.text+0x541fc65>
145420bcc:     	leaq	0x131943a(%rip), %rdi   # 0x14673a00d
145420bd3:     	movl	$0xc, %ebx
145420bd8:     	movl	$0xc, %edx
145420bdd:     	movq	%rdi, %rcx
145420be0:     	callq	0x145457cb0 <.text+0x5456cb0>
145420be5:     	testq	%rax, %rax
145420be8:     	cmovneq	%rax, %rdi
145420bec:     	cmovneq	%rdx, %rbx
145420bf0:     	mulss	0x4e6944(%rip), %xmm6   # 0x14590753c
145420bf8:     	movss	%xmm6, -0x4c(%rbp)
145420bfd:     	leaq	-0x4c(%rbp), %rax
145420c01:     	movq	%rax, -0x28(%rbp)
145420c05:     	leaq	0x318ae4(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145420c0c:     	movq	%rax, -0x20(%rbp)
145420c10:     	leaq	0x13193be(%rip), %rdx   # 0x146739fd5
145420c17:     	leaq	-0x48(%rbp), %r14
145420c1b:     	leaq	-0x28(%rbp), %r8
145420c1f:     	movq	%r14, %rcx
145420c22:     	callq	0x145728390 <.text+0x5727390>
145420c27:     	leaq	0x13193d2(%rip), %rax   # 0x14673a000
145420c2e:     	movq	%rax, -0x28(%rbp)
145420c32:     	movq	$0x1, -0x20(%rbp)
145420c3a:     	movq	%r14, -0x18(%rbp)
145420c3e:     	leaq	0x131939b(%rip), %rax   # 0x146739fe0
145420c45:     	movq	%rax, -0x10(%rbp)
145420c49:     	movq	$0x1, 0x20(%rsp)
145420c52:     	leaq	-0x28(%rbp), %r9
145420c56:     	movq	%rsi, %rcx
145420c59:     	movq	%rdi, %rdx
145420c5c:     	movq	%rbx, %r8
145420c5f:     	callq	0x145458060 <.text+0x5457060>
145420c64:     	nop
145420c65:     	movq	-0x48(%rbp), %rdx
145420c69:     	testq	%rdx, %rdx
145420c6c:     	je	0x145420c7d <.text+0x541fc7d>
145420c6e:     	movq	-0x40(%rbp), %rcx
145420c72:     	movl	$0x1, %r8d
145420c78:     	callq	0x1400021d0 <.text+0x11d0>
145420c7d:     	movq	%rsi, %rax
145420c80:     	movaps	(%rbp), %xmm6
145420c84:     	addq	$0x90, %rsp
145420c8b:     	popq	%rbx
145420c8c:     	popq	%rdi
145420c8d:     	popq	%rsi
145420c8e:     	popq	%r14
145420c90:     	popq	%rbp
145420c91:     	retq
145420c92:     	leaq	0x131932f(%rip), %rdi   # 0x146739fc8
145420c99:     	movl	$0xd, %ebx
145420c9e:     	movl	$0xd, %edx
145420ca3:     	movq	%rdi, %rcx
145420ca6:     	callq	0x145457cb0 <.text+0x5456cb0>
145420cab:     	testq	%rax, %rax
145420cae:     	cmovneq	%rax, %rdi
145420cb2:     	cmovneq	%rdx, %rbx
145420cb6:     	leaq	-0x2c(%rbp), %rax
145420cba:     	movq	%rax, -0x28(%rbp)
145420cbe:     	leaq	0x318a2b(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145420cc5:     	movq	%rax, -0x20(%rbp)
145420cc9:     	leaq	0x1319305(%rip), %rdx   # 0x146739fd5
145420cd0:     	leaq	-0x48(%rbp), %r14
145420cd4:     	leaq	-0x28(%rbp), %r8
145420cd8:     	movq	%r14, %rcx
145420cdb:     	callq	0x145728390 <.text+0x5727390>
145420ce0:     	leaq	0x1319319(%rip), %rax   # 0x14673a000
145420ce7:     	movq	%rax, -0x28(%rbp)
145420ceb:     	movq	$0x1, -0x20(%rbp)
145420cf3:     	movq	%r14, -0x18(%rbp)
145420cf7:     	leaq	0x13192e2(%rip), %rax   # 0x146739fe0
145420cfe:     	movq	%rax, -0x10(%rbp)
145420d02:     	movq	$0x1, 0x20(%rsp)
145420d0b:     	leaq	-0x28(%rbp), %r9
145420d0f:     	movq	%rsi, %rcx
145420d12:     	movq	%rdi, %rdx
145420d15:     	movq	%rbx, %r8
145420d18:     	callq	0x145458060 <.text+0x5457060>
145420d1d:     	nop
145420d1e:     	jmp	0x145420c65 <.text+0x541fc65>

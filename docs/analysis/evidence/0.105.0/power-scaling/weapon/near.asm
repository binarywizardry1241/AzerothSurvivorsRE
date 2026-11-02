
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459adf00:     	pushq	%rbp
1459adf01:     	pushq	%r15
1459adf03:     	pushq	%r14
1459adf05:     	pushq	%r13
1459adf07:     	pushq	%r12
1459adf09:     	pushq	%rsi
1459adf0a:     	pushq	%rdi
1459adf0b:     	pushq	%rbx
1459adf0c:     	subq	$0xb8, %rsp
1459adf13:     	leaq	0x80(%rsp), %rbp
1459adf1b:     	movaps	%xmm8, 0x20(%rbp)
1459adf20:     	movaps	%xmm7, 0x10(%rbp)
1459adf24:     	movaps	%xmm6, (%rbp)
1459adf28:     	movq	$-0x2, -0x8(%rbp)
1459adf30:     	movq	%rcx, %rsi
1459adf33:     	movq	$0x0, -0x28(%rbp)
1459adf3b:     	movq	$0x8, -0x20(%rbp)
1459adf43:     	movq	$0x0, -0x18(%rbp)
1459adf4b:     	movq	$0x0, -0x40(%rbp)
1459adf53:     	movq	$0x8, -0x38(%rbp)
1459adf5b:     	movq	$0x0, -0x30(%rbp)
1459adf63:     	movq	(%rdx), %rax
1459adf66:     	movq	%rax, -0x48(%rbp)
1459adf6a:     	movq	0x8(%rdx), %r14
1459adf6e:     	movq	0x10(%rdx), %rax
1459adf72:     	movq	%rax, -0x10(%rbp)
1459adf76:     	movq	0x18(%rdx), %r15
1459adf7a:     	cmpq	%r15, %r14
1459adf7d:     	je	0x1459ae07c <.text+0x59ad07c>
1459adf83:     	movsd	(%r8), %xmm6
1459adf88:     	movss	0x3bf868(%rip), %xmm7   # 0x145d6d7f8
1459adf90:     	leaq	-0x40(%rbp), %rdi
1459adf94:     	leaq	-0x28(%rbp), %rbx
1459adf98:     	jmp	0x1459adfd9 <.text+0x59acfd9>
1459adf9a:     	nopw	(%rax,%rax)
1459adfa0:     	movq	-0x20(%rbp), %rax
1459adfa4:     	movq	%r13, %rcx
1459adfa7:     	shlq	$0x5, %rcx
1459adfab:     	movl	%r12d, (%rax,%rcx)
1459adfaf:     	movlps	%xmm8, 0x4(%rax,%rcx)
1459adfb5:     	movaps	-0x60(%rbp), %xmm0
1459adfb9:     	movups	%xmm0, 0xc(%rax,%rcx)
1459adfbe:     	movl	-0x50(%rbp), %edx
1459adfc1:     	movl	%edx, 0x1c(%rax,%rcx)
1459adfc5:     	incq	%r13
1459adfc8:     	movq	%r13, -0x18(%rbp)
1459adfcc:     	addq	$0x20, %r14
1459adfd0:     	cmpq	%r15, %r14
1459adfd3:     	je	0x1459ae07c <.text+0x59ad07c>
1459adfd9:     	movl	(%r14), %r12d
1459adfdc:     	movsd	0x4(%r14), %xmm8
1459adfe2:     	movl	0x1c(%r14), %eax
1459adfe6:     	movl	%eax, -0x50(%rbp)
1459adfe9:     	movups	0xc(%r14), %xmm0
1459adfee:     	movaps	%xmm0, -0x60(%rbp)
1459adff2:     	movaps	%xmm8, %xmm0
1459adff6:     	subps	%xmm6, %xmm0
1459adff9:     	mulps	%xmm0, %xmm0
1459adffc:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1459ae000:     	addss	%xmm0, %xmm1
1459ae004:     	ucomiss	%xmm1, %xmm7
1459ae007:     	jae	0x1459ae060 <.text+0x59ad060>
1459ae009:     	movq	-0x30(%rbp), %r13
1459ae00d:     	cmpq	-0x40(%rbp), %r13
1459ae011:     	jne	0x1459ae01c <.text+0x59ad01c>
1459ae013:     	movq	%rdi, %rcx
1459ae016:     	callq	0x145bcb530 <.text+0x5bca530>
1459ae01b:     	nop
1459ae01c:     	movq	-0x38(%rbp), %rax
1459ae020:     	movq	%r13, %rcx
1459ae023:     	shlq	$0x5, %rcx
1459ae027:     	movl	%r12d, (%rax,%rcx)
1459ae02b:     	movlps	%xmm8, 0x4(%rax,%rcx)
1459ae031:     	movaps	-0x60(%rbp), %xmm0
1459ae035:     	movups	%xmm0, 0xc(%rax,%rcx)
1459ae03a:     	movl	-0x50(%rbp), %edx
1459ae03d:     	movl	%edx, 0x1c(%rax,%rcx)
1459ae041:     	incq	%r13
1459ae044:     	movq	%r13, -0x30(%rbp)
1459ae048:     	addq	$0x20, %r14
1459ae04c:     	cmpq	%r15, %r14
1459ae04f:     	jne	0x1459adfd9 <.text+0x59acfd9>
1459ae051:     	jmp	0x1459ae07c <.text+0x59ad07c>
1459ae053:     	nopw	%cs:(%rax,%rax)
1459ae060:     	movq	-0x18(%rbp), %r13
1459ae064:     	cmpq	-0x28(%rbp), %r13
1459ae068:     	jne	0x1459adfa0 <.text+0x59acfa0>
1459ae06e:     	movq	%rbx, %rcx
1459ae071:     	callq	0x145bcb530 <.text+0x5bca530>
1459ae076:     	nop
1459ae077:     	jmp	0x1459adfa0 <.text+0x59acfa0>
1459ae07c:     	movq	-0x10(%rbp), %rdx
1459ae080:     	testq	%rdx, %rdx
1459ae083:     	je	0x1459ae098 <.text+0x59ad098>
1459ae085:     	shlq	$0x5, %rdx
1459ae089:     	movl	$0x8, %r8d
1459ae08f:     	movq	-0x48(%rbp), %rcx
1459ae093:     	callq	0x1400021d0 <.text+0x11d0>
1459ae098:     	movq	-0x18(%rbp), %rax
1459ae09c:     	movq	%rax, 0x10(%rsi)
1459ae0a0:     	movups	-0x28(%rbp), %xmm0
1459ae0a4:     	movups	%xmm0, (%rsi)
1459ae0a7:     	movups	-0x40(%rbp), %xmm0
1459ae0ab:     	movups	%xmm0, 0x18(%rsi)
1459ae0af:     	movq	-0x30(%rbp), %rax
1459ae0b3:     	movq	%rax, 0x28(%rsi)
1459ae0b7:     	movq	%rsi, %rax
1459ae0ba:     	movaps	(%rbp), %xmm6
1459ae0be:     	movaps	0x10(%rbp), %xmm7
1459ae0c2:     	movaps	0x20(%rbp), %xmm8
1459ae0c7:     	addq	$0xb8, %rsp
1459ae0ce:     	popq	%rbx
1459ae0cf:     	popq	%rdi
1459ae0d0:     	popq	%rsi
1459ae0d1:     	popq	%r12
1459ae0d3:     	popq	%r13
1459ae0d5:     	popq	%r14
1459ae0d7:     	popq	%r15
1459ae0d9:     	popq	%rbp
1459ae0da:     	retq


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145917d45:     	cmpb	$0x0, 0xa6c(%r12)
145917d4e:     	movq	%r12, 0x138(%rbp)
145917d55:     	je	0x14591806e <.text+0x591706e>
145917d5b:     	movzbl	0x304(%r12), %eax
145917d64:     	addb	$-0x2, %al
145917d66:     	cmpb	$0x9, %al
145917d68:     	ja	0x145917d7a <.text+0x5916d7a>
145917d6a:     	movzbl	%al, %eax
145917d6d:     	leaq	0x156341c(%rip), %rcx   # 0x146e7b190
145917d74:     	movq	(%rcx,%rax,8), %rax
145917d78:     	jmp	0x145917d81 <.text+0x5916d81>
145917d7a:     	leaq	0x1293a27(%rip), %rax   # 0x146bab7a8
145917d81:     	movq	0x30(%rax), %rcx
145917d85:     	movq	0x38(%rax), %rax
145917d89:     	shlq	$0x4, %rax
145917d8d:     	addq	%rcx, %rax
145917d90:     	movq	%rcx, 0x140(%rbp)
145917d97:     	movq	%rax, 0x148(%rbp)
145917d9e:     	movq	%r12, 0x150(%rbp)
145917da5:     	leaq	0x118(%rbp), %rcx
145917dac:     	leaq	0x140(%rbp), %rdx
145917db3:     	callq	0x1459a9700 <.text+0x59a8700>
145917db8:     	leaq	0x310(%r12), %rsi
145917dc0:     	movq	0x310(%r12), %rax
145917dc8:     	testq	%rax, %rax
145917dcb:     	je	0x145917de4 <.text+0x5916de4>
145917dcd:     	movq	0x318(%r12), %rcx
145917dd5:     	imulq	$0x68, %rax, %rdx
145917dd9:     	movl	$0x8, %r8d
145917ddf:     	callq	0x1400021d0 <.text+0x11d0>
145917de4:     	movq	0x128(%rbp), %rax
145917deb:     	movq	%rax, 0x10(%rsi)
145917def:     	movups	0x118(%rbp), %xmm0
145917df6:     	movups	%xmm0, (%rsi)
145917df9:     	leaq	0x140(%rbp), %rcx
145917e00:     	callq	0x1458e5d80 <.text+0x58e4d80>
145917e05:     	movq	0x140(%rbp), %rax
145917e0c:     	movq	%rax, 0xf8(%rbp)
145917e13:     	movq	0x148(%rbp), %rax
145917e1a:     	movq	%rax, 0xf0(%rbp)
145917e21:     	movq	0x150(%rbp), %rsi
145917e28:     	testq	%rsi, %rsi
145917e2b:     	je	0x145917fd2 <.text+0x5916fd2>
145917e31:     	shlq	$0x4, %rsi
145917e35:     	movq	0xf0(%rbp), %r14
145917e3c:     	addq	%r14, %rsi
145917e3f:     	leaq	-0x8(%rbp), %r15
145917e43:     	leaq	0x770(%r12), %rax
145917e4b:     	movq	%rax, 0x190(%rbp)
145917e52:     	leaq	0xb0(%r12), %rax
145917e5a:     	movq	%rax, 0x180(%rbp)
145917e61:     	leaq	0x1294c70(%rip), %rbx   # 0x146bacad8
145917e68:     	xorps	%xmm6, %xmm6
145917e6b:     	movsd	0x45bead(%rip), %xmm7   # 0x145d73d20
145917e73:     	movsd	0x458e24(%rip), %xmm8   # 0x145d70ca0
145917e7c:     	movsd	0x458e1b(%rip), %xmm9   # 0x145d70ca0
145917e85:     	movaps	0x45bea3(%rip), %xmm10  # 0x145d73d30
145917e8d:     	jmp	0x145917ef6 <.text+0x5916ef6>
145917e8f:     	nop
145917e90:     	movq	0xb8(%r12), %rax
145917e98:     	imulq	$0x70, %rdi, %rcx
145917e9c:     	movq	0x50(%rbp), %rdx
145917ea0:     	movq	%rdx, 0x60(%rax,%rcx)
145917ea5:     	movups	0x40(%rbp), %xmm0
145917ea9:     	movups	%xmm0, 0x50(%rax,%rcx)
145917eae:     	movups	0x30(%rbp), %xmm0
145917eb2:     	movups	%xmm0, 0x40(%rax,%rcx)
145917eb7:     	movups	-0x10(%rbp), %xmm0
145917ebb:     	movups	(%rbp), %xmm1
145917ebf:     	movups	0x10(%rbp), %xmm2
145917ec3:     	movups	0x20(%rbp), %xmm3
145917ec7:     	movups	%xmm3, 0x30(%rax,%rcx)
145917ecc:     	movups	%xmm2, 0x20(%rax,%rcx)
145917ed1:     	movups	%xmm1, 0x10(%rax,%rcx)
145917ed6:     	movups	%xmm0, (%rax,%rcx)
145917eda:     	movl	$0x0, 0x68(%rax,%rcx)
145917ee2:     	incq	%rdi
145917ee5:     	movq	%rdi, 0xc0(%r12)
145917eed:     	cmpq	%rsi, %r14
145917ef0:     	je	0x145917fd2 <.text+0x5916fd2>
145917ef6:     	movq	(%r14), %r13
145917ef9:     	movq	0x8(%r14), %rdi
145917efd:     	addq	$0x10, %r14
145917f01:     	movq	%r13, 0x118(%rbp)
145917f08:     	movq	%rdi, 0x120(%rbp)
145917f0f:     	xorl	%r12d, %r12d
145917f12:     	jmp	0x145917f31 <.text+0x5916f31>
145917f14:     	nopw	%cs:(%rax,%rax)
145917f20:     	addq	$0x78, %r12
145917f24:     	cmpq	$0x34f8, %r12           # imm = 0x34F8
145917f2b:     	je	0x14591b071 <.text+0x591a071>
145917f31:     	cmpq	%rdi, 0x8(%r12,%rbx)
145917f36:     	jne	0x145917f20 <.text+0x5916f20>
145917f38:     	movq	(%r12,%rbx), %rcx
145917f3c:     	movq	%r13, %rdx
145917f3f:     	movq	%rdi, %r8
145917f42:     	callq	0x145bc9787 <.text+0x5bc8787>
145917f47:     	testl	%eax, %eax
145917f49:     	jne	0x145917f20 <.text+0x5916f20>
145917f4b:     	movups	%xmm6, (%r15)
145917f4f:     	movq	$0x0, 0x10(%r15)
145917f57:     	addq	%rbx, %r12
145917f5a:     	movq	%r12, -0x10(%rbp)
145917f5e:     	movl	$0x1, 0x10(%rbp)
145917f65:     	movsd	%xmm7, 0x14(%rbp)
145917f6a:     	movq	$0x3f800000, 0x1c(%rbp) # imm = 0x3F800000
145917f72:     	movups	%xmm8, 0x24(%rbp)
145917f77:     	movsd	%xmm9, 0x34(%rbp)
145917f7d:     	movl	$0x0, 0x3c(%rbp)
145917f84:     	movups	%xmm10, 0x40(%rbp)
145917f89:     	movsd	%xmm9, 0x50(%rbp)
145917f8f:     	leaq	0x34(%rbp), %rcx
145917f93:     	movq	0x190(%rbp), %rdx
145917f9a:     	movq	%r12, %r8
145917f9d:     	callq	0x1458e3a30 <.text+0x58e2a30>
145917fa2:     	nop
145917fa3:     	movq	0x138(%rbp), %r12
145917faa:     	movq	0xc0(%r12), %rdi
145917fb2:     	cmpq	0xb0(%r12), %rdi
145917fba:     	jne	0x145917e90 <.text+0x5916e90>
145917fc0:     	movq	0x180(%rbp), %rcx
145917fc7:     	callq	0x145bce8c0 <.text+0x5bcd8c0>
145917fcc:     	nop
145917fcd:     	jmp	0x145917e90 <.text+0x5916e90>
145917fd2:     	movq	0xf8(%rbp), %rdx
145917fd9:     	testq	%rdx, %rdx
145917fdc:     	je	0x145917ff4 <.text+0x5916ff4>
145917fde:     	shlq	$0x4, %rdx
145917fe2:     	movl	$0x8, %r8d
145917fe8:     	movq	0xf0(%rbp), %rcx
145917fef:     	callq	0x1400021d0 <.text+0x11d0>
145917ff4:     	movq	%r12, %rcx
145917ff7:     	callq	0x14595b7a0 <.text+0x595a7a0>
145917ffc:     	movq	0x290(%r12), %rcx
145918004:     	movq	0x298(%r12), %rdx
14591800c:     	callq	0x1458753b0 <.text+0x58743b0>
145918011:     	imulq	$0xf0, %rax, %rax
145918018:     	leaq	0x1291431(%rip), %rcx   # 0x146ba9450
14591801f:     	movq	0x88(%rax,%rcx), %rdi
145918027:     	movq	%r12, %rcx
14591802a:     	movq	%rdi, %rdx
14591802d:     	callq	0x14592ff90 <.text+0x592ef90>
145918032:     	leaq	0x58(%rdi), %rdx
145918036:     	movq	%r12, %rcx
145918039:     	callq	0x14592ff90 <.text+0x592ef90>
14591803e:     	leaq	0xb0(%rdi), %rdx
145918045:     	movq	%r12, %rcx
145918048:     	callq	0x14592ff90 <.text+0x592ef90>
14591804d:     	leaq	0x108(%rdi), %rdx
145918054:     	movq	%r12, %rcx
145918057:     	callq	0x14592ff90 <.text+0x592ef90>
14591805c:     	addq	$0x160, %rdi            # imm = 0x160
145918063:     	movq	%r12, %rcx
145918066:     	movq	%rdi, %rdx
145918069:     	callq	0x14592ff90 <.text+0x592ef90>

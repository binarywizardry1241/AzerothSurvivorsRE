
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545d980:     	pushq	%rbp
14545d981:     	pushq	%r14
14545d983:     	pushq	%rsi
14545d984:     	pushq	%rdi
14545d985:     	pushq	%rbx
14545d986:     	subq	$0x80, %rsp
14545d98d:     	leaq	0x80(%rsp), %rbp
14545d995:     	movq	$-0x2, -0x8(%rbp)
14545d99d:     	movl	%r9d, %edi
14545d9a0:     	movq	%r8, %rbx
14545d9a3:     	movq	%rdx, %r14
14545d9a6:     	movq	%rcx, %rsi
14545d9a9:     	callq	0x140002200 <.text+0x1200>
14545d9ae:     	movl	$0x20, %ecx
14545d9b3:     	movl	$0x1, %edx
14545d9b8:     	callq	0x1400021c0 <.text+0x11c0>
14545d9bd:     	testq	%rax, %rax
14545d9c0:     	je	0x14545db33 <.text+0x545cb33>
14545d9c6:     	movw	$0x150, -0x18(%rbp)     # imm = 0x150
14545d9cc:     	movq	$0x20, -0x30(%rbp)
14545d9d4:     	movq	%rax, -0x28(%rbp)
14545d9d8:     	movq	$0x0, -0x20(%rbp)
14545d9e0:     	leaq	-0x30(%rbp), %rdx
14545d9e4:     	movq	%r14, %rcx
14545d9e7:     	callq	0x14551c6a0 <.text+0x551b6a0>
14545d9ec:     	nop
14545d9ed:     	movups	-0x30(%rbp), %xmm0
14545d9f1:     	movups	-0x20(%rbp), %xmm1
14545d9f5:     	movaps	%xmm1, -0x40(%rbp)
14545d9f9:     	movaps	%xmm0, -0x50(%rbp)
14545d9fd:     	leaq	-0x50(%rbp), %rdx
14545da01:     	movq	%rbx, %rcx
14545da04:     	callq	0x14551c6a0 <.text+0x551b6a0>
14545da09:     	nop
14545da0a:     	movaps	-0x50(%rbp), %xmm0
14545da0e:     	movaps	-0x40(%rbp), %xmm1
14545da12:     	movaps	%xmm1, -0x20(%rbp)
14545da16:     	movaps	%xmm0, -0x30(%rbp)
14545da1a:     	movq	-0x20(%rbp), %rdx
14545da1e:     	movq	-0x30(%rbp), %rax
14545da22:     	subq	%rdx, %rax
14545da25:     	cmpq	$0x3, %rax
14545da29:     	jbe	0x14545dae3 <.text+0x545cae3>
14545da2f:     	movq	-0x28(%rbp), %rax
14545da33:     	movl	%edi, (%rax,%rdx)
14545da36:     	addq	$0x4, %rdx
14545da3a:     	movq	%rdx, -0x20(%rbp)
14545da3e:     	movaps	-0x30(%rbp), %xmm0
14545da42:     	movaps	%xmm0, -0x50(%rbp)
14545da46:     	movq	-0x20(%rbp), %rax
14545da4a:     	movq	%rax, -0x40(%rbp)
14545da4e:     	movq	-0x18(%rbp), %rax
14545da52:     	movq	%rax, -0x38(%rbp)
14545da56:     	movq	-0x40(%rbp), %rdx
14545da5a:     	movq	-0x50(%rbp), %rax
14545da5e:     	subq	%rdx, %rax
14545da61:     	cmpq	$0x3, %rax
14545da65:     	jbe	0x14545db0b <.text+0x545cb0b>
14545da6b:     	movl	0x50(%rbp), %eax
14545da6e:     	movq	-0x48(%rbp), %rcx
14545da72:     	movl	%eax, (%rcx,%rdx)
14545da75:     	addq	$0x4, %rdx
14545da79:     	movq	%rdx, -0x40(%rbp)
14545da7d:     	movaps	-0x50(%rbp), %xmm0
14545da81:     	movaps	%xmm0, -0x30(%rbp)
14545da85:     	movq	-0x40(%rbp), %rax
14545da89:     	movq	%rax, -0x20(%rbp)
14545da8d:     	movq	-0x38(%rbp), %rax
14545da91:     	movq	%rax, -0x18(%rbp)
14545da95:     	movq	-0x20(%rbp), %rdi
14545da99:     	cmpq	-0x30(%rbp), %rdi
14545da9d:     	jne	0x14545daa9 <.text+0x545caa9>
14545da9f:     	leaq	-0x30(%rbp), %rcx
14545daa3:     	callq	0x145903690 <.text+0x5902690>
14545daa8:     	nop
14545daa9:     	movzbl	0x58(%rbp), %eax
14545daad:     	movq	-0x28(%rbp), %rcx
14545dab1:     	movb	%al, (%rcx,%rdi)
14545dab4:     	incq	%rdi
14545dab7:     	movq	%rdi, -0x20(%rbp)
14545dabb:     	movaps	-0x30(%rbp), %xmm0
14545dabf:     	movups	%xmm0, (%rsi)
14545dac2:     	movq	-0x20(%rbp), %rax
14545dac6:     	movq	%rax, 0x10(%rsi)
14545daca:     	movq	-0x18(%rbp), %rax
14545dace:     	movq	%rax, 0x18(%rsi)
14545dad2:     	movq	%rsi, %rax
14545dad5:     	addq	$0x80, %rsp
14545dadc:     	popq	%rbx
14545dadd:     	popq	%rdi
14545dade:     	popq	%rsi
14545dadf:     	popq	%r14
14545dae1:     	popq	%rbp
14545dae2:     	retq
14545dae3:     	movq	$0x1, 0x20(%rsp)
14545daec:     	leaq	-0x30(%rbp), %rcx
14545daf0:     	movl	$0x4, %r8d
14545daf6:     	movl	$0x1, %r9d
14545dafc:     	callq	0x1457744b0 <.text+0x57734b0>
14545db01:     	nop
14545db02:     	movq	-0x20(%rbp), %rdx
14545db06:     	jmp	0x14545da2f <.text+0x545ca2f>
14545db0b:     	movq	$0x1, 0x20(%rsp)
14545db14:     	leaq	-0x50(%rbp), %rcx
14545db18:     	movl	$0x4, %r8d
14545db1e:     	movl	$0x1, %r9d
14545db24:     	callq	0x1457744b0 <.text+0x57734b0>
14545db29:     	nop
14545db2a:     	movq	-0x40(%rbp), %rdx
14545db2e:     	jmp	0x14545da6b <.text+0x545ca6b>
14545db33:     	movl	$0x1, %ecx


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14541dae0:     	pushq	%rbp
14541dae1:     	pushq	%r14
14541dae3:     	pushq	%rsi
14541dae4:     	pushq	%rdi
14541dae5:     	pushq	%rbx
14541dae6:     	subq	$0x80, %rsp
14541daed:     	leaq	0x80(%rsp), %rbp
14541daf5:     	movq	$-0x2, -0x8(%rbp)
14541dafd:     	movq	%rcx, %rsi
14541db00:     	movb	%r9b, 0x38(%r8)
14541db04:     	movq	0x128(%rdx), %rax
14541db0b:     	movq	0x130(%rdx), %rcx
14541db12:     	shlq	$0x3, %rcx
14541db16:     	xorl	%r11d, %r11d
14541db19:     	movq	%r8, -0x18(%rbp)
14541db1d:     	nopl	(%rax)
14541db20:     	cmpq	%r11, %rcx
14541db23:     	je	0x14541db4b <.text+0x541cb4b>
14541db25:     	leaq	0x8(%r11), %r10
14541db29:     	cmpb	%r9b, (%rax,%r11)
14541db2d:     	movq	%r10, %r11
14541db30:     	jne	0x14541db20 <.text+0x541cb20>
14541db32:     	movq	-0x8(%rax,%r10), %rcx
14541db37:     	movq	%rcx, %rax
14541db3a:     	shrq	$0x18, %rax
14541db3e:     	shrl	$0x8, %ecx
14541db41:     	movw	%cx, 0x39(%r8)
14541db46:     	jmp	0x14541dc4b <.text+0x541cc4b>
14541db4b:     	decb	%r9b
14541db4e:     	cmpb	$0xa, %r9b
14541db52:     	ja	0x14541db73 <.text+0x541cb73>
14541db54:     	movzbl	%r9b, %ecx
14541db58:     	shll	$0x3, %ecx
14541db5b:     	leaq	0x1303316(%rip), %rax   # 0x146720e78
14541db62:     	movq	(%rcx,%rax), %rax
14541db66:     	leaq	0x1303363(%rip), %r9    # 0x146720ed0
14541db6d:     	movq	(%rcx,%r9), %rcx
14541db71:     	jmp	0x14541db7f <.text+0x541cb7f>
14541db73:     	leaq	0x1302e1f(%rip), %rcx   # 0x146720999
14541db7a:     	movl	$0x1, %eax
14541db7f:     	movzbl	0x39(%r8), %edi
14541db84:     	movzbl	%dil, %r9d
14541db88:     	xorl	%r10d, %r10d
14541db8b:     	nopl	(%rax,%rax)
14541db90:     	cmpb	%dil, (%rcx,%r10)
14541db94:     	je	0x14541dc1a <.text+0x541cc1a>
14541db9a:     	incq	%r10
14541db9d:     	cmpq	%r10, %rax
14541dba0:     	jne	0x14541db90 <.text+0x541cb90>
14541dba2:     	cmpl	$0x7, %r9d
14541dba6:     	ja	0x14541dcbb <.text+0x541ccbb>
14541dbac:     	movb	$0x1, %r14b
14541dbaf:     	movl	$0x9a, %r10d
14541dbb5:     	btl	%r9d, %r10d
14541dbb9:     	jae	0x14541dcbb <.text+0x541ccbb>
14541dbbf:     	xorl	%ebx, %ebx
14541dbc1:     	movl	$0x9a, %r11d
14541dbc7:     	jmp	0x14541dbe0 <.text+0x541cbe0>
14541dbc9:     	movb	$0x1, %dil
14541dbcc:     	leaq	0x1(%r9), %rbx
14541dbd0:     	cmpb	%dil, %r14b
14541dbd3:     	jne	0x14541dc04 <.text+0x541cc04>
14541dbd5:     	nopw	%cs:(%rax,%rax)
14541dbe0:     	movq	%rbx, %r9
14541dbe3:     	cmpq	%rbx, %rax
14541dbe6:     	je	0x14541dc04 <.text+0x541cc04>
14541dbe8:     	movzbl	(%rcx,%r9), %r10d
14541dbed:     	cmpl	$0x7, %r10d
14541dbf1:     	ja	0x14541dbc9 <.text+0x541cbc9>
14541dbf3:     	btl	%r10d, %r11d
14541dbf7:     	jae	0x14541dbc9 <.text+0x541cbc9>
14541dbf9:     	xorl	%edi, %edi
14541dbfb:     	leaq	0x1(%r9), %rbx
14541dbff:     	cmpb	%dil, %r14b
14541dc02:     	je	0x14541dbe0 <.text+0x541cbe0>
14541dc04:     	movq	%rdx, %r14
14541dc07:     	cmpq	%r9, %rax
14541dc0a:     	movzbl	(%rcx), %eax
14541dc0d:     	movzbl	%r10b, %edi
14541dc11:     	cmovel	%eax, %edi
14541dc14:     	movb	%dil, 0x39(%r8)
14541dc18:     	jmp	0x14541dc1d <.text+0x541cc1d>
14541dc1a:     	movq	%rdx, %r14
14541dc1d:     	movb	0x3a(%r8), %bl
14541dc21:     	movb	$0x1, -0x9(%rbp)
14541dc25:     	callq	0x145501470 <.text+0x5500470>
14541dc2a:     	nop
14541dc2b:     	testq	%rax, %rax
14541dc2e:     	je	0x14541dc42 <.text+0x541cc42>
14541dc30:     	movb	$0x1, -0x9(%rbp)
14541dc34:     	movq	%rax, %rcx
14541dc37:     	movl	%edi, %edx
14541dc39:     	movl	%ebx, %r8d
14541dc3c:     	callq	0x145625c70 <.text+0x5624c70>
14541dc41:     	nop
14541dc42:     	xorl	%eax, %eax
14541dc44:     	movq	%r14, %rdx
14541dc47:     	movq	-0x18(%rbp), %r8
14541dc4b:     	movl	%eax, 0x3b(%r8)
14541dc4f:     	shrq	$0x20, %rax
14541dc53:     	movb	%al, 0x3f(%r8)
14541dc57:     	movups	(%r8), %xmm0
14541dc5b:     	movups	0x10(%r8), %xmm1
14541dc60:     	movups	0x20(%r8), %xmm2
14541dc65:     	movq	0x30(%r8), %rax
14541dc69:     	movq	%rax, -0x30(%rbp)
14541dc6d:     	movzbl	0x38(%r8), %eax
14541dc72:     	movb	%al, -0x28(%rbp)
14541dc75:     	movzwl	0x39(%r8), %eax
14541dc7a:     	movw	%ax, -0x27(%rbp)
14541dc7e:     	movl	0x3b(%r8), %eax
14541dc82:     	movl	%eax, -0x25(%rbp)
14541dc85:     	movzbl	0x3f(%r8), %eax
14541dc8a:     	movb	%al, -0x21(%rbp)
14541dc8d:     	movaps	%xmm2, -0x40(%rbp)
14541dc91:     	movaps	%xmm1, -0x50(%rbp)
14541dc95:     	movaps	%xmm0, -0x60(%rbp)
14541dc99:     	movb	$0x0, -0x9(%rbp)
14541dc9d:     	leaq	-0x60(%rbp), %r8
14541dca1:     	movq	%rsi, %rcx
14541dca4:     	callq	0x14541d7f0 <.text+0x541c7f0>
14541dca9:     	nop
14541dcaa:     	movq	%rsi, %rax
14541dcad:     	addq	$0x80, %rsp
14541dcb4:     	popq	%rbx
14541dcb5:     	popq	%rdi
14541dcb6:     	popq	%rsi
14541dcb7:     	popq	%r14
14541dcb9:     	popq	%rbp
14541dcba:     	retq
14541dcbb:     	xorl	%r14d, %r14d
14541dcbe:     	jmp	0x14541dbbf <.text+0x541cbbf>

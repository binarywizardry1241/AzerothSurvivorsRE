
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145934b13:     	movq	%rdi, %rcx
145934b16:     	callq	0x1459178e0 <.text+0x59168e0>
145934b1b:     	xorps	%xmm12, %xmm12
145934b1f:     	ucomiss	%xmm12, %xmm0
145934b23:     	jbe	0x145934de7 <.text+0x5933de7>
145934b29:     	mulss	%xmm0, %xmm8
145934b2e:     	movss	0x478(%rdi), %xmm7
145934b36:     	movss	0x4e0(%rdi), %xmm1
145934b3e:     	addss	%xmm1, %xmm8
145934b43:     	movaps	%xmm8, %xmm2
145934b47:     	minss	%xmm7, %xmm2
145934b4b:     	movaps	%xmm2, %xmm0
145934b4e:     	cmpunordss	%xmm2, %xmm0
145934b53:     	andps	%xmm0, %xmm8
145934b57:     	andnps	%xmm2, %xmm0
145934b5a:     	orps	%xmm8, %xmm0
145934b5e:     	movss	%xmm0, 0x4e0(%rdi)
145934b66:     	movaps	%xmm0, %xmm8
145934b6a:     	subss	%xmm1, %xmm8
145934b6f:     	ucomiss	%xmm8, %xmm12
145934b73:     	jae	0x145934c20 <.text+0x5933c20>
145934b79:     	movb	$0x0, 0x185(%rbp)
145934b80:     	leaq	0x1544769(%rip), %r14   # 0x146e792f0
145934b87:     	movl	$0x5, %esi
145934b8c:     	movl	$0x5, %edx
145934b91:     	movq	%r14, %rcx
145934b94:     	callq	0x1458da590 <.text+0x58d9590>
145934b99:     	nop
145934b9a:     	testq	%rax, %rax
145934b9d:     	cmovneq	%rax, %r14
145934ba1:     	cmoveq	%rsi, %rdx
145934ba5:     	movq	$-0x1, 0xb0(%rbp)
145934bb0:     	movq	%r14, 0xb8(%rbp)
145934bb7:     	movq	%rdx, 0xc0(%rbp)
145934bbe:     	leaq	0x1544730(%rip), %rax   # 0x146e792f5
145934bc5:     	movq	%rax, 0xc8(%rbp)
145934bcc:     	movq	$0x18, 0xd0(%rbp)
145934bd7:     	movb	$0x0, 0xd8(%rbp)
145934bde:     	leaq	0x678(%rdi), %rcx
145934be5:     	xorps	%xmm2, %xmm2
145934be8:     	cvtss2sd	%xmm8, %xmm2
145934bed:     	movb	$0x0, 0x185(%rbp)
145934bf4:     	movq	$0x0, 0x20(%rsp)
145934bfd:     	leaq	0xb0(%rbp), %rdx
145934c04:     	movl	$0x8, %r9d
145934c0a:     	callq	0x14595f3c0 <.text+0x595e3c0>
145934c0f:     	nop
145934c10:     	movss	0x478(%rdi), %xmm7
145934c18:     	movss	0x4e0(%rdi), %xmm0
145934c20:     	xorps	%xmm8, %xmm8
145934c24:     	maxss	%xmm8, %xmm0
145934c29:     	callq	0x145bc981d <.text+0x5bc881d>
145934c2e:     	cvttss2si	%xmm0, %rax
145934c33:     	xorl	%ecx, %ecx
145934c35:     	ucomiss	%xmm8, %xmm0
145934c39:     	cmovbl	%ecx, %eax
145934c3c:     	ucomiss	0x438c31(%rip), %xmm0   # 0x145d6d874
145934c43:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
145934c49:     	cmovbel	%eax, %r8d
145934c4d:     	leaq	0x990(%rdi), %r14
145934c54:     	movq	0x990(%rdi), %rax
145934c5b:     	testq	%rax, %rax
145934c5e:     	je	0x145934cbf <.text+0x5933cbf>
145934c60:     	movq	0x998(%rdi), %rcx
145934c67:     	movw	$0x16, %dx
145934c6b:     	movzwl	0x36(%rax), %r10d
145934c70:     	movl	%r10d, %r11d
145934c73:     	addl	%r11d, %r11d
145934c76:     	movq	$-0x1, %r9
145934c7d:     	nopl	(%rax)
145934c80:     	testq	%r11, %r11
145934c83:     	je	0x145934ca8 <.text+0x5933ca8>
145934c85:     	cmpw	0x3a(%rax,%r9,2), %dx
145934c8b:     	seta	%bl
145934c8e:     	sbbb	$0x0, %bl
145934c91:     	incq	%r9
145934c94:     	addq	$-0x2, %r11
145934c98:     	cmpb	$0x1, %bl
145934c9b:     	je	0x145934c80 <.text+0x5933c80>
145934c9d:     	movzbl	%bl, %r10d
145934ca1:     	testl	%r10d, %r10d
145934ca4:     	jne	0x145934cab <.text+0x5933cab>
145934ca6:     	jmp	0x145934cb8 <.text+0x5933cb8>
145934ca8:     	movq	%r10, %r9
145934cab:     	subq	$0x1, %rcx
145934caf:     	jb	0x145934cc1 <.text+0x5933cc1>
145934cb1:     	movq	0x50(%rax,%r9,8), %rax
145934cb6:     	jmp	0x145934c6b <.text+0x5933c6b>
145934cb8:     	movl	%r8d, 0x8(%rax,%r9,4)
145934cbd:     	jmp	0x145934d07 <.text+0x5933d07>
145934cbf:     	xorl	%eax, %eax
145934cc1:     	movq	%r14, 0xb0(%rbp)
145934cc8:     	movq	%rax, 0xb8(%rbp)
145934ccf:     	movq	$0x0, 0xc0(%rbp)
145934cda:     	movq	%r9, 0xc8(%rbp)
145934ce1:     	movq	$0x16, 0xd0(%rbp)
145934cec:     	movb	$0x0, 0x185(%rbp)
145934cf3:     	leaq	0x120(%rbp), %rcx
145934cfa:     	leaq	0xb0(%rbp), %rdx
145934d01:     	callq	0x1458e1710 <.text+0x58e0710>
145934d06:     	nop
145934d07:     	movaps	%xmm7, %xmm0
145934d0a:     	callq	0x145bc981d <.text+0x5bc881d>
145934d0f:     	cvttss2si	%xmm0, %rax
145934d14:     	xorl	%ecx, %ecx
145934d16:     	xorps	%xmm1, %xmm1
145934d19:     	ucomiss	%xmm1, %xmm0
145934d1c:     	cmovbl	%ecx, %eax
145934d1f:     	ucomiss	0x438b4e(%rip), %xmm0   # 0x145d6d874
145934d26:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
145934d2c:     	cmovbel	%eax, %r8d
145934d30:     	movq	(%r14), %rax
145934d33:     	testq	%rax, %rax
145934d36:     	je	0x145934d9f <.text+0x5933d9f>
145934d38:     	movq	0x998(%rdi), %rcx
145934d3f:     	movw	$0x1c, %dx
145934d43:     	movzwl	0x36(%rax), %r10d
145934d48:     	movl	%r10d, %r11d
145934d4b:     	addl	%r11d, %r11d
145934d4e:     	movq	$-0x1, %r9
145934d55:     	nopw	%cs:(%rax,%rax)
145934d60:     	testq	%r11, %r11
145934d63:     	je	0x145934d88 <.text+0x5933d88>
145934d65:     	cmpw	0x3a(%rax,%r9,2), %dx
145934d6b:     	seta	%bl
145934d6e:     	sbbb	$0x0, %bl
145934d71:     	incq	%r9
145934d74:     	addq	$-0x2, %r11
145934d78:     	cmpb	$0x1, %bl
145934d7b:     	je	0x145934d60 <.text+0x5933d60>
145934d7d:     	movzbl	%bl, %r10d
145934d81:     	testl	%r10d, %r10d
145934d84:     	jne	0x145934d8b <.text+0x5933d8b>
145934d86:     	jmp	0x145934d98 <.text+0x5933d98>
145934d88:     	movq	%r10, %r9
145934d8b:     	subq	$0x1, %rcx
145934d8f:     	jb	0x145934da1 <.text+0x5933da1>
145934d91:     	movq	0x50(%rax,%r9,8), %rax
145934d96:     	jmp	0x145934d43 <.text+0x5933d43>
145934d98:     	movl	%r8d, 0x8(%rax,%r9,4)
145934d9d:     	jmp	0x145934de7 <.text+0x5933de7>
145934d9f:     	xorl	%eax, %eax
145934da1:     	movq	%r14, 0xb0(%rbp)
145934da8:     	movq	%rax, 0xb8(%rbp)
145934daf:     	movq	$0x0, 0xc0(%rbp)
145934dba:     	movq	%r9, 0xc8(%rbp)
145934dc1:     	movq	$0x1c, 0xd0(%rbp)
145934dcc:     	movb	$0x0, 0x185(%rbp)
145934dd3:     	leaq	0x120(%rbp), %rcx
145934dda:     	leaq	0xb0(%rbp), %rdx
145934de1:     	callq	0x1458e1710 <.text+0x58e0710>
145934de6:     	nop

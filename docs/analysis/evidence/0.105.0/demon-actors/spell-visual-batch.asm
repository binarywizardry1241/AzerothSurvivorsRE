
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145950ab0:     	pushq	%rbp
145950ab1:     	pushq	%r15
145950ab3:     	pushq	%r14
145950ab5:     	pushq	%r12
145950ab7:     	pushq	%rsi
145950ab8:     	pushq	%rdi
145950ab9:     	pushq	%rbx
145950aba:     	subq	$0xa0, %rsp
145950ac1:     	leaq	0x80(%rsp), %rbp
145950ac9:     	movq	$-0x2, 0x18(%rbp)
145950ad1:     	movq	0xd8(%rcx), %rax
145950ad8:     	cmpq	%rax, %rdx
145950adb:     	jae	0x145950c22 <.text+0x594fc22>
145950ae1:     	movq	%r9, %rdi
145950ae4:     	movq	%rcx, %rsi
145950ae7:     	movq	0xd0(%rcx), %rax
145950aee:     	imulq	$0x78, %rdx, %rcx
145950af2:     	movq	0x18(%rax,%rcx), %rdx
145950af7:     	movq	0x20(%rax,%rcx), %r14
145950afc:     	leaq	0x5d0(%rsi), %rbx
145950b03:     	movl	0x34(%rdx), %eax
145950b06:     	movq	%r8, 0x10(%rbp)
145950b0a:     	movl	$0x0, 0x8(%rbp)
145950b11:     	movl	$0x0, -0x3c(%rbp)
145950b18:     	movl	0x8(%rbp), %ecx
145950b1b:     	movl	%ecx, -0x30(%rbp)
145950b1e:     	movl	0xc(%rbp), %ecx
145950b21:     	movl	%ecx, -0x2c(%rbp)
145950b24:     	movq	0x10(%rbp), %rcx
145950b28:     	movq	%rcx, -0x28(%rbp)
145950b2c:     	leaq	-0x3c(%rbp), %r15
145950b30:     	movq	%r15, 0x30(%rsp)
145950b35:     	leaq	-0x30(%rbp), %rcx
145950b39:     	movq	%rcx, 0x28(%rsp)
145950b3e:     	movq	$0x0, 0x20(%rsp)
145950b47:     	leaq	-0x18(%rbp), %rcx
145950b4b:     	movl	$0x8, %r9d
145950b51:     	movl	%eax, %r8d
145950b54:     	movq	%r14, %rdx
145950b57:     	callq	0x1458b5100 <.text+0x58b4100>
145950b5c:     	movq	0x5e0(%rsi), %r12
145950b63:     	cmpq	0x5d0(%rsi), %r12
145950b6a:     	jne	0x145950b75 <.text+0x594fb75>
145950b6c:     	movq	%rbx, %rcx
145950b6f:     	callq	0x145bcb530 <.text+0x5bca530>
145950b74:     	nop
145950b75:     	movl	0x88(%rbp), %r8d
145950b7c:     	movq	0x80(%rbp), %rax
145950b83:     	movq	0x5d8(%rsi), %rcx
145950b8a:     	movq	%r12, %rdx
145950b8d:     	shlq	$0x5, %rdx
145950b91:     	movups	-0x18(%rbp), %xmm0
145950b95:     	movups	-0x8(%rbp), %xmm1
145950b99:     	movups	%xmm1, 0x10(%rcx,%rdx)
145950b9e:     	movups	%xmm0, (%rcx,%rdx)
145950ba2:     	incq	%r12
145950ba5:     	movq	%r12, 0x5e0(%rsi)
145950bac:     	movq	%r15, 0x30(%rsp)
145950bb1:     	leaq	0x8(%rbp), %rcx
145950bb5:     	movq	%rcx, 0x28(%rsp)
145950bba:     	movq	%rax, 0x20(%rsp)
145950bbf:     	leaq	-0x18(%rbp), %rcx
145950bc3:     	movq	%r14, %rdx
145950bc6:     	movq	%rdi, %r9
145950bc9:     	callq	0x1458b5100 <.text+0x58b4100>
145950bce:     	movq	0x5e0(%rsi), %rdi
145950bd5:     	cmpq	0x5d0(%rsi), %rdi
145950bdc:     	jne	0x145950be7 <.text+0x594fbe7>
145950bde:     	movq	%rbx, %rcx
145950be1:     	callq	0x145bcb530 <.text+0x5bca530>
145950be6:     	nop
145950be7:     	movq	0x5d8(%rsi), %rax
145950bee:     	movq	%rdi, %rcx
145950bf1:     	shlq	$0x5, %rcx
145950bf5:     	movups	-0x18(%rbp), %xmm0
145950bf9:     	movups	-0x8(%rbp), %xmm1
145950bfd:     	movups	%xmm1, 0x10(%rax,%rcx)
145950c02:     	movups	%xmm0, (%rax,%rcx)
145950c06:     	incq	%rdi
145950c09:     	movq	%rdi, 0x5e0(%rsi)
145950c10:     	addq	$0xa0, %rsp
145950c17:     	popq	%rbx
145950c18:     	popq	%rdi
145950c19:     	popq	%rsi
145950c1a:     	popq	%r12
145950c1c:     	popq	%r14
145950c1e:     	popq	%r15
145950c20:     	popq	%rbp
145950c21:     	retq
145950c22:     	leaq	0x1529e17(%rip), %r8    # 0x146e7aa40
145950c29:     	movq	%rdx, %rcx
145950c2c:     	movq	%rax, %rdx
145950c2f:     	callq	0x145d697e3 <.text+0x5d687e3>
145950c34:     	ud2

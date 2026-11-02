
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454dbcd1:     	movq	0x10(%r8), %rax
1454dbcd5:     	leaq	(%rax,%rax,2), %rax
1454dbcd9:     	shlq	$0x4, %rax
1454dbcdd:     	addq	%r13, %rax
1454dbce0:     	movq	%rax, 0x170(%rbp)
1454dbce7:     	movq	%r8, 0x290(%rbp)
1454dbcee:     	cmpq	0x170(%rbp), %r13
1454dbcf5:     	jne	0x1454dbd14 <.text+0x54dad14>
1454dbcf7:     	jmp	0x1454dbe54 <.text+0x54dae54>
1454dbcfc:     	nopl	(%rax)
1454dbd00:     	movq	0x240(%rbp), %r13
1454dbd07:     	cmpq	0x170(%rbp), %r13
1454dbd0e:     	je	0x1454dbe54 <.text+0x54dae54>
1454dbd14:     	leaq	0x30(%r13), %rax
1454dbd18:     	movq	%rax, 0x240(%rbp)
1454dbd1f:     	jmp	0x1454dbd70 <.text+0x54dad70>
1454dbd21:     	nopw	%cs:(%rax,%rax)
1454dbd30:     	movq	0x50(%rbp), %rax
1454dbd34:     	leaq	(%rbx,%rbx,4), %rcx
1454dbd38:     	movq	%rsi, (%rax,%rcx,8)
1454dbd3c:     	movq	%r12, 0x8(%rax,%rcx,8)
1454dbd41:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454dbd46:     	movl	%r15d, 0x18(%rax,%rcx,8)
1454dbd4b:     	movss	%xmm9, 0x1c(%rax,%rcx,8)
1454dbd52:     	movss	%xmm10, 0x20(%rax,%rcx,8)
1454dbd59:     	movb	%r14b, 0x24(%rax,%rcx,8)
1454dbd5e:     	movb	%dl, 0x25(%rax,%rcx,8)
1454dbd62:     	incq	%rbx
1454dbd65:     	movq	%rbx, 0x58(%rbp)
1454dbd69:     	movq	0x290(%rbp), %r8
1454dbd70:     	movl	0x20(%r13), %eax
1454dbd74:     	testl	%eax, %eax
1454dbd76:     	je	0x1454dbd00 <.text+0x54dad00>
1454dbd78:     	movss	0x1c(%r13), %xmm0
1454dbd7e:     	ucomiss	%xmm0, %xmm6
1454dbd81:     	jb	0x1454dbe40 <.text+0x54dae40>
1454dbd87:     	movq	(%r13), %rsi
1454dbd8b:     	testq	%rsi, %rsi
1454dbd8e:     	je	0x1454dbda0 <.text+0x54dada0>
1454dbd90:     	xorl	%edx, %edx
1454dbd92:     	jmp	0x1454dbda7 <.text+0x54dada7>
1454dbd94:     	nopw	%cs:(%rax,%rax)
1454dbda0:     	cmpl	0x24(%r13), %eax
1454dbda4:     	sete	%dl
1454dbda7:     	decl	%eax
1454dbda9:     	movl	%eax, 0x20(%r13)
1454dbdad:     	addss	0x18(%r13), %xmm0
1454dbdb3:     	movss	%xmm0, 0x1c(%r13)
1454dbdb9:     	movq	0x88(%r8), %rdi
1454dbdc0:     	movl	0x10(%r13), %r15d
1454dbdc4:     	movzbl	0x2c(%r13), %r14d
1454dbdc9:     	movss	0x14(%r13), %xmm9
1454dbdcf:     	movss	0x28(%r13), %xmm10
1454dbdd5:     	movq	0x8(%r13), %r12
1454dbdd9:     	movq	0x58(%rbp), %rbx
1454dbddd:     	cmpq	0x48(%rbp), %rbx
1454dbde1:     	jne	0x1454dbd30 <.text+0x54dad30>
1454dbde7:     	movb	$0x1, 0x2b7(%rbp)
1454dbdee:     	movb	$0x1, 0x2b6(%rbp)
1454dbdf5:     	movb	$0x1, 0x2b5(%rbp)
1454dbdfc:     	movb	$0x1, 0x2b4(%rbp)
1454dbe03:     	movb	$0x1, 0x2b3(%rbp)
1454dbe0a:     	movb	$0x1, 0x2b2(%rbp)
1454dbe11:     	movb	$0x1, 0x2b1(%rbp)
1454dbe18:     	movb	$0x1, 0x2b0(%rbp)
1454dbe1f:     	movb	$0x1, 0x2af(%rbp)
1454dbe26:     	leaq	0x48(%rbp), %rcx
1454dbe2a:     	movl	%edx, 0x260(%rbp)
1454dbe30:     	callq	0x145774780 <.text+0x5773780>
1454dbe35:     	movl	0x260(%rbp), %edx
1454dbe3b:     	jmp	0x1454dbd30 <.text+0x54dad30>
1454dbe40:     	movq	0x240(%rbp), %r13
1454dbe47:     	cmpq	0x170(%rbp), %r13
1454dbe4e:     	jne	0x1454dbd14 <.text+0x54dad14>

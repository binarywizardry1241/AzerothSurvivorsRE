
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552e9a0:     	pushq	%rbp
14552e9a1:     	pushq	%r15
14552e9a3:     	pushq	%r14
14552e9a5:     	pushq	%r13
14552e9a7:     	pushq	%r12
14552e9a9:     	pushq	%rsi
14552e9aa:     	pushq	%rdi
14552e9ab:     	pushq	%rbx
14552e9ac:     	subq	$0xc8, %rsp
14552e9b3:     	leaq	0x80(%rsp), %rbp
14552e9bb:     	movq	$-0x2, 0x40(%rbp)
14552e9c3:     	movq	%rcx, %r12
14552e9c6:     	cmpb	$0x0, 0x41(%rdx)
14552e9ca:     	je	0x14552e9fd <.text+0x552d9fd>
14552e9cc:     	movq	$0x0, (%r12)
14552e9d4:     	movq	$0x1, 0x8(%r12)
14552e9dd:     	movq	$0x0, 0x10(%r12)
14552e9e6:     	movq	%r12, %rax
14552e9e9:     	addq	$0xc8, %rsp
14552e9f0:     	popq	%rbx
14552e9f1:     	popq	%rdi
14552e9f2:     	popq	%rsi
14552e9f3:     	popq	%r12
14552e9f5:     	popq	%r13
14552e9f7:     	popq	%r14
14552e9f9:     	popq	%r15
14552e9fb:     	popq	%rbp
14552e9fc:     	retq
14552e9fd:     	movq	%rdx, %rbx
14552ea00:     	leaq	0x10(%rdx), %rdi
14552ea04:     	leaq	-0x40(%rbp), %r14
14552ea08:     	movb	$0xa, %sil
14552ea0b:     	jmp	0x14552ea16 <.text+0x552da16>
14552ea0d:     	nopl	(%rax)
14552ea10:     	cmpb	$0x0, 0x41(%rbx)
14552ea14:     	jne	0x14552e9cc <.text+0x552d9cc>
14552ea16:     	movq	(%rdi), %r15
14552ea19:     	movq	%r14, %rcx
14552ea1c:     	movq	%rdi, %rdx
14552ea1f:     	callq	0x1455336a0 <.text+0x55326a0>
14552ea24:     	cmpl	$0x1, -0x40(%rbp)
14552ea28:     	jne	0x14552ea50 <.text+0x552da50>
14552ea2a:     	movq	-0x38(%rbp), %rcx
14552ea2e:     	movq	-0x30(%rbp), %rax
14552ea32:     	movq	(%rbx), %rdx
14552ea35:     	subq	%rdx, %rcx
14552ea38:     	addq	%rdx, %r15
14552ea3b:     	movq	%rax, (%rbx)
14552ea3e:     	testq	%rcx, %rcx
14552ea41:     	jne	0x14552ea7e <.text+0x552da7e>
14552ea43:     	jmp	0x14552ea10 <.text+0x552da10>
14552ea45:     	nopw	%cs:(%rax,%rax)
14552ea50:     	cmpb	$0x0, 0x41(%rbx)
14552ea54:     	jne	0x14552e9cc <.text+0x552d9cc>
14552ea5a:     	movb	$0x1, 0x41(%rbx)
14552ea5e:     	movq	(%rbx), %r15
14552ea61:     	movq	0x8(%rbx), %rcx
14552ea65:     	subq	%r15, %rcx
14552ea68:     	setne	%al
14552ea6b:     	orb	0x40(%rbx), %al
14552ea6e:     	cmpb	$0x1, %al
14552ea70:     	jne	0x14552e9cc <.text+0x552d9cc>
14552ea76:     	addq	(%rdi), %r15
14552ea79:     	testq	%rcx, %rcx
14552ea7c:     	je	0x14552ea10 <.text+0x552da10>
14552ea7e:     	cmpq	$0x1, %rcx
14552ea82:     	jne	0x14552eaa0 <.text+0x552daa0>
14552ea84:     	movzbl	(%r15), %edx
14552ea88:     	cmpl	$0x2b, %edx
14552ea8b:     	je	0x14552ea10 <.text+0x552da10>
14552ea8d:     	cmpl	$0x2d, %edx
14552ea90:     	je	0x14552ea10 <.text+0x552da10>
14552ea96:     	jmp	0x14552eaa4 <.text+0x552daa4>
14552ea98:     	nopl	(%rax,%rax)
14552eaa0:     	movzbl	(%r15), %edx
14552eaa4:     	xorl	%eax, %eax
14552eaa6:     	cmpb	$0x2b, %dl
14552eaa9:     	sete	%al
14552eaac:     	movq	%rcx, %rdx
14552eaaf:     	subq	%rax, %rdx
14552eab2:     	addq	%rax, %r15
14552eab5:     	cmpq	$0x3, %rdx
14552eab9:     	jae	0x14552eaf0 <.text+0x552daf0>
14552eabb:     	testq	%rdx, %rdx
14552eabe:     	je	0x14552eb3a <.text+0x552db3a>
14552eac0:     	movzbl	(%r15), %eax
14552eac4:     	addl	$-0x30, %eax
14552eac7:     	cmpl	$0x9, %eax
14552eaca:     	ja	0x14552ea10 <.text+0x552da10>
14552ead0:     	cmpq	$0x1, %rdx
14552ead4:     	je	0x14552eb3e <.text+0x552db3e>
14552ead6:     	movzbl	0x1(%r15), %ecx
14552eadb:     	addl	$-0x30, %ecx
14552eade:     	cmpl	$0x9, %ecx
14552eae1:     	ja	0x14552ea10 <.text+0x552da10>
14552eae7:     	jmp	0x14552eb42 <.text+0x552db42>
14552eae9:     	nopl	(%rax)
14552eaf0:     	negq	%rax
14552eaf3:     	addq	%rax, %rcx
14552eaf6:     	negq	%rcx
14552eaf9:     	xorl	%edx, %edx
14552eafb:     	xorl	%eax, %eax
14552eafd:     	movq	%rcx, %r8
14552eb00:     	addq	%rdx, %r8
14552eb03:     	je	0x14552eb35 <.text+0x552db35>
14552eb05:     	mulb	%sil
14552eb08:     	jo	0x14552ea10 <.text+0x552da10>
14552eb0e:     	movzbl	(%r15,%rdx), %r9d
14552eb13:     	addl	$-0x30, %r9d
14552eb17:     	addb	%r9b, %al
14552eb1a:     	setb	%r8b
14552eb1e:     	cmpl	$0x9, %r9d
14552eb22:     	ja	0x14552ea10 <.text+0x552da10>
14552eb28:     	incq	%rdx
14552eb2b:     	testb	%r8b, %r8b
14552eb2e:     	je	0x14552eafd <.text+0x552dafd>
14552eb30:     	jmp	0x14552ea10 <.text+0x552da10>
14552eb35:     	movq	%rax, %rsi
14552eb38:     	jmp	0x14552eb4c <.text+0x552db4c>
14552eb3a:     	xorl	%esi, %esi
14552eb3c:     	jmp	0x14552eb4c <.text+0x552db4c>
14552eb3e:     	movl	%eax, %esi
14552eb40:     	jmp	0x14552eb4c <.text+0x552db4c>
14552eb42:     	addl	%eax, %eax
14552eb44:     	leal	(%rax,%rax,4), %eax
14552eb47:     	addb	%al, %cl
14552eb49:     	movq	%rcx, %rsi
14552eb4c:     	movq	%r12, -0x48(%rbp)
14552eb50:     	callq	0x140002200 <.text+0x1200>
14552eb55:     	movl	$0x1, %eax
14552eb5a:     	movq	%rax, 0x30(%rbp)
14552eb5e:     	movl	$0x8, %ecx
14552eb63:     	movl	$0x1, %edx
14552eb68:     	callq	0x1400021c0 <.text+0x11c0>
14552eb6d:     	testq	%rax, %rax
14552eb70:     	je	0x14552eeb4 <.text+0x552deb4>
14552eb76:     	movb	%sil, (%rax)
14552eb79:     	movq	$0x8, 0x18(%rbp)
14552eb81:     	movq	%rax, 0x10(%rbp)
14552eb85:     	movq	%rax, 0x20(%rbp)
14552eb89:     	movq	$0x1, 0x28(%rbp)
14552eb91:     	movups	(%rbx), %xmm0
14552eb94:     	movups	0x10(%rbx), %xmm1
14552eb98:     	movups	0x20(%rbx), %xmm2
14552eb9c:     	movups	0x30(%rbx), %xmm3
14552eba0:     	movaps	%xmm1, -0x30(%rbp)
14552eba4:     	movaps	%xmm2, -0x20(%rbp)
14552eba8:     	movaps	%xmm3, -0x10(%rbp)
14552ebac:     	movaps	%xmm0, -0x40(%rbp)
14552ebb0:     	movq	0x40(%rbx), %rcx
14552ebb4:     	movq	%rcx, -0x58(%rbp)
14552ebb8:     	movq	%rcx, (%rbp)
14552ebbc:     	movq	-0x30(%rbp), %rdi
14552ebc0:     	movq	-0x28(%rbp), %r14
14552ebc4:     	movq	-0x18(%rbp), %r12
14552ebc8:     	movzbl	-0x8(%rbp), %eax
14552ebcc:     	movb	%al, 0x3f(%rbp)
14552ebcf:     	movzbl	%al, %ebx
14552ebd2:     	movq	-0x38(%rbp), %rax
14552ebd6:     	movq	%rax, -0x50(%rbp)
14552ebda:     	movzbl	0x1(%rbp), %ecx
14552ebde:     	nop
14552ebe0:     	testb	$0x1, %cl
14552ebe3:     	jne	0x14552ee99 <.text+0x552de99>
14552ebe9:     	cmpq	%r14, %r12
14552ebec:     	seta	%al
14552ebef:     	movq	-0x20(%rbp), %rsi
14552ebf3:     	cmpq	%rsi, %r12
14552ebf6:     	setb	%cl
14552ebf9:     	orb	%al, %cl
14552ebfb:     	jne	0x14552ed1b <.text+0x552dd1b>
14552ec01:     	movzbl	-0x11(%rbp,%rbx), %r13d
14552ec07:     	cmpb	$0x5, 0x3f(%rbp)
14552ec0b:     	jb	0x14552ec89 <.text+0x552dc89>
14552ec0d:     	movq	%r12, %r8
14552ec10:     	subq	%rsi, %r8
14552ec13:     	leaq	(%rdi,%rsi), %rax
14552ec17:     	cmpq	$0xf, %r8
14552ec1b:     	ja	0x14552ec39 <.text+0x552dc39>
14552ec1d:     	xorl	%edx, %edx
14552ec1f:     	testq	%r8, %r8
14552ec22:     	je	0x14552ec35 <.text+0x552dc35>
14552ec24:     	cmpb	%r13b, (%rax,%rdx)
14552ec28:     	je	0x14552ec47 <.text+0x552dc47>
14552ec2a:     	incq	%rdx
14552ec2d:     	cmpq	%rdx, %r8
14552ec30:     	jne	0x14552ec24 <.text+0x552dc24>
14552ec32:     	movq	%r8, %rdx
14552ec35:     	xorl	%eax, %eax
14552ec37:     	jmp	0x14552ec4c <.text+0x552dc4c>
14552ec39:     	movl	%r13d, %ecx
14552ec3c:     	movq	%rax, %rdx
14552ec3f:     	callq	0x145714db0 <.text+0x5713db0>
14552ec44:     	nop
14552ec45:     	jmp	0x14552ec4c <.text+0x552dc4c>
14552ec47:     	movl	$0x1, %eax
14552ec4c:     	cmpq	$0x1, %rax
14552ec50:     	jne	0x14552ed17 <.text+0x552dd17>
14552ec56:     	addq	%rdx, %rsi
14552ec59:     	incq	%rsi
14552ec5c:     	movq	%rsi, -0x20(%rbp)
14552ec60:     	cmpq	%rbx, %rsi
14552ec63:     	setb	%al
14552ec66:     	cmpq	%r14, %rsi
14552ec69:     	seta	%cl
14552ec6c:     	orb	%al, %cl
14552ec6e:     	je	0x14552eec5 <.text+0x552dec5>
14552ec74:     	cmpq	%rsi, %r12
14552ec77:     	jae	0x14552ec0d <.text+0x552dc0d>
14552ec79:     	jmp	0x14552ed1b <.text+0x552dd1b>
14552ec7e:     	nop
14552ec80:     	cmpq	%rsi, %r12
14552ec83:     	jb	0x14552ed1b <.text+0x552dd1b>
14552ec89:     	movq	%r12, %r8
14552ec8c:     	subq	%rsi, %r8
14552ec8f:     	leaq	(%rdi,%rsi), %rax
14552ec93:     	cmpq	$0x10, %r8
14552ec97:     	jae	0x14552ecc0 <.text+0x552dcc0>
14552ec99:     	xorl	%edx, %edx
14552ec9b:     	testq	%r8, %r8
14552ec9e:     	je	0x14552ecb1 <.text+0x552dcb1>
14552eca0:     	cmpb	%r13b, (%rax,%rdx)
14552eca4:     	je	0x14552ed0c <.text+0x552dd0c>
14552eca6:     	incq	%rdx
14552eca9:     	cmpq	%rdx, %r8
14552ecac:     	jne	0x14552eca0 <.text+0x552dca0>
14552ecae:     	movq	%r8, %rdx
14552ecb1:     	xorl	%eax, %eax
14552ecb3:     	cmpq	$0x1, %rax
14552ecb7:     	je	0x14552ecd2 <.text+0x552dcd2>
14552ecb9:     	jmp	0x14552ed17 <.text+0x552dd17>
14552ecbb:     	nopl	(%rax,%rax)
14552ecc0:     	movl	%r13d, %ecx
14552ecc3:     	movq	%rax, %rdx
14552ecc6:     	callq	0x145714db0 <.text+0x5713db0>
14552eccb:     	nop
14552eccc:     	cmpq	$0x1, %rax
14552ecd0:     	jne	0x14552ed17 <.text+0x552dd17>
14552ecd2:     	addq	%rdx, %rsi
14552ecd5:     	incq	%rsi
14552ecd8:     	movq	%rsi, -0x20(%rbp)
14552ecdc:     	movq	%rsi, %r15
14552ecdf:     	subq	%rbx, %r15
14552ece2:     	setb	%al
14552ece5:     	cmpq	%r14, %rsi
14552ece8:     	seta	%cl
14552eceb:     	orb	%al, %cl
14552eced:     	jne	0x14552ec80 <.text+0x552dc80>
14552ecef:     	leaq	(%rdi,%r15), %rcx
14552ecf3:     	leaq	-0x10(%rbp), %rdx
14552ecf7:     	movq	%rbx, %r8
14552ecfa:     	callq	0x145756dd7 <.text+0x5755dd7>
14552ecff:     	testl	%eax, %eax
14552ed01:     	jne	0x14552ec80 <.text+0x552dc80>
14552ed07:     	jmp	0x14552ee1e <.text+0x552de1e>
14552ed0c:     	movl	$0x1, %eax
14552ed11:     	cmpq	$0x1, %rax
14552ed15:     	je	0x14552ecd2 <.text+0x552dcd2>
14552ed17:     	movq	%r12, -0x20(%rbp)
14552ed1b:     	movb	$0x1, 0x1(%rbp)
14552ed1f:     	movq	-0x40(%rbp), %rdx
14552ed23:     	movq	-0x50(%rbp), %r15
14552ed27:     	subq	%rdx, %r15
14552ed2a:     	setne	%al
14552ed2d:     	orb	-0x58(%rbp), %al
14552ed30:     	testb	$0x1, %al
14552ed32:     	je	0x14552ee99 <.text+0x552de99>
14552ed38:     	movb	$0x1, %cl
14552ed3a:     	testq	%r15, %r15
14552ed3d:     	je	0x14552ebe0 <.text+0x552dbe0>
14552ed43:     	addq	%rdi, %rdx
14552ed46:     	cmpq	$0x1, %r15
14552ed4a:     	jne	0x14552ed70 <.text+0x552dd70>
14552ed4c:     	movzbl	(%rdx), %eax
14552ed4f:     	cmpl	$0x2b, %eax
14552ed52:     	je	0x14552ebe0 <.text+0x552dbe0>
14552ed58:     	cmpl	$0x2d, %eax
14552ed5b:     	je	0x14552ebe0 <.text+0x552dbe0>
14552ed61:     	jmp	0x14552ed73 <.text+0x552dd73>
14552ed63:     	nopw	%cs:(%rax,%rax)
14552ed70:     	movzbl	(%rdx), %eax
14552ed73:     	xorl	%r8d, %r8d
14552ed76:     	cmpb	$0x2b, %al
14552ed78:     	sete	%r8b
14552ed7c:     	movq	%r15, %rax
14552ed7f:     	subq	%r8, %rax
14552ed82:     	addq	%r8, %rdx
14552ed85:     	cmpq	$0x3, %rax
14552ed89:     	jae	0x14552edd0 <.text+0x552ddd0>
14552ed8b:     	testq	%rax, %rax
14552ed8e:     	je	0x14552ee39 <.text+0x552de39>
14552ed94:     	movzbl	(%rdx), %r13d
14552ed98:     	addl	$-0x30, %r13d
14552ed9c:     	cmpl	$0x9, %r13d
14552eda0:     	ja	0x14552ebe0 <.text+0x552dbe0>
14552eda6:     	cmpq	$0x1, %rax
14552edaa:     	je	0x14552ee4c <.text+0x552de4c>
14552edb0:     	movzbl	0x1(%rdx), %eax
14552edb4:     	addl	$-0x30, %eax
14552edb7:     	cmpl	$0x9, %eax
14552edba:     	ja	0x14552ebe0 <.text+0x552dbe0>
14552edc0:     	jmp	0x14552ee3e <.text+0x552de3e>
14552edc2:     	nopw	%cs:(%rax,%rax)
14552edd0:     	negq	%r8
14552edd3:     	addq	%r8, %r15
14552edd6:     	negq	%r15
14552edd9:     	xorl	%r8d, %r8d
14552eddc:     	xorl	%r13d, %r13d
14552eddf:     	movq	%r15, %rax
14552ede2:     	addq	%r8, %rax
14552ede5:     	je	0x14552ee4c <.text+0x552de4c>
14552ede7:     	movl	%r13d, %eax
14552edea:     	movb	$0xa, %r9b
14552eded:     	mulb	%r9b
14552edf0:     	jo	0x14552ebe0 <.text+0x552dbe0>
14552edf6:     	movl	%eax, %r13d
14552edf9:     	movzbl	(%rdx,%r8), %r9d
14552edfe:     	addl	$-0x30, %r9d
14552ee02:     	addb	%r9b, %r13b
14552ee05:     	setb	%al
14552ee08:     	cmpl	$0x9, %r9d
14552ee0c:     	ja	0x14552ebe0 <.text+0x552dbe0>
14552ee12:     	incq	%r8
14552ee15:     	testb	%al, %al
14552ee17:     	je	0x14552eddf <.text+0x552dddf>
14552ee19:     	jmp	0x14552ebe0 <.text+0x552dbe0>
14552ee1e:     	movq	-0x40(%rbp), %rdx
14552ee22:     	subq	%rdx, %r15
14552ee25:     	movq	%rsi, -0x40(%rbp)
14552ee29:     	xorl	%ecx, %ecx
14552ee2b:     	testq	%r15, %r15
14552ee2e:     	jne	0x14552ed43 <.text+0x552dd43>
14552ee34:     	jmp	0x14552ebe0 <.text+0x552dbe0>
14552ee39:     	xorl	%r13d, %r13d
14552ee3c:     	jmp	0x14552ee4c <.text+0x552de4c>
14552ee3e:     	movzbl	%r13b, %ecx
14552ee42:     	addl	%ecx, %ecx
14552ee44:     	leal	(%rcx,%rcx,4), %ecx
14552ee47:     	addb	%cl, %al
14552ee49:     	movl	%eax, %r13d
14552ee4c:     	movq	0x30(%rbp), %rdx
14552ee50:     	cmpq	0x18(%rbp), %rdx
14552ee54:     	movq	0x10(%rbp), %rax
14552ee58:     	jne	0x14552ee81 <.text+0x552de81>
14552ee5a:     	movq	$0x1, 0x20(%rsp)
14552ee63:     	movl	$0x1, %r8d
14552ee69:     	movl	$0x1, %r9d
14552ee6f:     	leaq	0x18(%rbp), %rcx
14552ee73:     	callq	0x145757d40 <.text+0x5756d40>
14552ee78:     	nop
14552ee79:     	movq	0x20(%rbp), %rax
14552ee7d:     	movq	0x30(%rbp), %rdx
14552ee81:     	movq	%rax, 0x10(%rbp)
14552ee85:     	movb	%r13b, (%rax,%rdx)
14552ee89:     	incq	%rdx
14552ee8c:     	movq	%rdx, 0x30(%rbp)
14552ee90:     	movq	%rdx, 0x28(%rbp)
14552ee94:     	jmp	0x14552ebda <.text+0x552dbda>
14552ee99:     	movq	0x28(%rbp), %rax
14552ee9d:     	movq	-0x48(%rbp), %r12
14552eea1:     	movq	%rax, 0x10(%r12)
14552eea6:     	movups	0x18(%rbp), %xmm0
14552eeaa:     	movups	%xmm0, (%r12)
14552eeaf:     	jmp	0x14552e9e6 <.text+0x552d9e6>
14552eeb4:     	movl	$0x1, %ecx
14552eeb9:     	movl	$0x8, %edx
14552eebe:     	callq	0x1458e721b <.text+0x58e621b>
14552eec3:     	ud2
14552eec5:     	leaq	0x17bb55c(%rip), %r9    # 0x146cea428
14552eecc:     	movl	$0x4, %r8d
14552eed2:     	xorl	%ecx, %ecx
14552eed4:     	movq	%rbx, %rdx
14552eed7:     	callq	0x1458e77c0 <.text+0x58e67c0>
14552eedc:     	nop
14552eedd:     	ud2

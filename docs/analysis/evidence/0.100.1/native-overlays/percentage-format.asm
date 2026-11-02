
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543eb60:     	pushq	%rbp
14543eb61:     	pushq	%r15
14543eb63:     	pushq	%r14
14543eb65:     	pushq	%rsi
14543eb66:     	pushq	%rdi
14543eb67:     	pushq	%rbx
14543eb68:     	subq	$0x68, %rsp
14543eb6c:     	leaq	0x60(%rsp), %rbp
14543eb71:     	movq	$-0x2, (%rbp)
14543eb79:     	movq	%rcx, %rsi
14543eb7c:     	mulss	0x4c89b8(%rip), %xmm1   # 0x14590753c
14543eb84:     	movss	%xmm1, -0x4(%rbp)
14543eb89:     	leaq	-0x4(%rbp), %rax
14543eb8d:     	movq	%rax, -0x20(%rbp)
14543eb91:     	leaq	0x2fab58(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
14543eb98:     	movq	%rax, -0x18(%rbp)
14543eb9c:     	leaq	0x12ff455(%rip), %rdx   # 0x14673dff8
14543eba3:     	leaq	-0x38(%rbp), %rcx
14543eba7:     	leaq	-0x20(%rbp), %r8
14543ebab:     	callq	0x145728390 <.text+0x5727390>
14543ebb0:     	movq	-0x30(%rbp), %rbx
14543ebb4:     	movq	-0x28(%rbp), %rdi
14543ebb8:     	cmpq	$0x2, %rdi
14543ebbc:     	jae	0x14543ebc3 <.text+0x543dbc3>
14543ebbe:     	xorl	%r14d, %r14d
14543ebc1:     	jmp	0x14543ebce <.text+0x543dbce>
14543ebc3:     	cmpw	$0x302e, -0x2(%rbx,%rdi) # imm = 0x302E
14543ebca:     	sete	%r14b
14543ebce:     	leaq	-0x20(%rbp), %rcx
14543ebd2:     	leaq	-0x38(%rbp), %rdx
14543ebd6:     	callq	0x145728850 <.text+0x5727850>
14543ebdb:     	nop
14543ebdc:     	testb	%r14b, %r14b
14543ebdf:     	je	0x14543ebfb <.text+0x543dbfb>
14543ebe1:     	addq	$-0x2, %rdi
14543ebe5:     	testq	%rdi, %rdi
14543ebe8:     	jns	0x14543ec0c <.text+0x543dc0c>
14543ebea:     	xorl	%r15d, %r15d
14543ebed:     	movq	%r15, %rcx
14543ebf0:     	movq	%rdi, %rdx
14543ebf3:     	callq	0x14590379b <.text+0x590279b>
14543ebf8:     	nop
14543ebf9:     	ud2
14543ebfb:     	movq	-0x10(%rbp), %rax
14543ebff:     	movq	%rax, 0x10(%rsi)
14543ec03:     	movups	-0x20(%rbp), %xmm0
14543ec07:     	movups	%xmm0, (%rsi)
14543ec0a:     	jmp	0x14543ec67 <.text+0x543dc67>
14543ec0c:     	je	0x14543ec3e <.text+0x543dc3e>
14543ec0e:     	callq	0x140002200 <.text+0x1200>
14543ec13:     	movl	$0x1, %r15d
14543ec19:     	movl	$0x1, %edx
14543ec1e:     	movq	%rdi, %rcx
14543ec21:     	callq	0x1400021c0 <.text+0x11c0>
14543ec26:     	testq	%rax, %rax
14543ec29:     	je	0x14543ebed <.text+0x543dbed>
14543ec2b:     	movq	%rax, %r14
14543ec2e:     	movq	%rax, %rcx
14543ec31:     	movq	%rbx, %rdx
14543ec34:     	movq	%rdi, %r8
14543ec37:     	callq	0x1457731ed <.text+0x57721ed>
14543ec3c:     	jmp	0x14543ec44 <.text+0x543dc44>
14543ec3e:     	movl	$0x1, %r14d
14543ec44:     	movq	%rdi, (%rsi)
14543ec47:     	movq	%r14, 0x8(%rsi)
14543ec4b:     	movq	%rdi, 0x10(%rsi)
14543ec4f:     	movq	-0x20(%rbp), %rdx
14543ec53:     	testq	%rdx, %rdx
14543ec56:     	je	0x14543ec67 <.text+0x543dc67>
14543ec58:     	movq	-0x18(%rbp), %rcx
14543ec5c:     	movl	$0x1, %r8d
14543ec62:     	callq	0x1400021d0 <.text+0x11d0>
14543ec67:     	movq	-0x38(%rbp), %rdx
14543ec6b:     	testq	%rdx, %rdx
14543ec6e:     	je	0x14543ec80 <.text+0x543dc80>
14543ec70:     	movq	-0x30(%rbp), %rcx
14543ec74:     	movl	$0x1, %r8d
14543ec7a:     	callq	0x1400021d0 <.text+0x11d0>
14543ec7f:     	nop
14543ec80:     	addq	$0x68, %rsp
14543ec84:     	popq	%rbx
14543ec85:     	popq	%rdi
14543ec86:     	popq	%rsi
14543ec87:     	popq	%r14
14543ec89:     	popq	%r15
14543ec8b:     	popq	%rbp
14543ec8c:     	retq

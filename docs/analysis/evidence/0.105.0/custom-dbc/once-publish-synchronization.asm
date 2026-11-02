
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145d67f70:     	pushq	%rbp
145d67f71:     	pushq	%r15
145d67f73:     	pushq	%r14
145d67f75:     	pushq	%r12
145d67f77:     	pushq	%rsi
145d67f78:     	pushq	%rdi
145d67f79:     	pushq	%rbx
145d67f7a:     	subq	$0x40, %rsp
145d67f7e:     	leaq	0x40(%rsp), %rbp
145d67f83:     	movq	$-0x2, -0x8(%rbp)
145d67f8b:     	movq	%r9, %rsi
145d67f8e:     	movq	%r8, %rdi
145d67f91:     	movq	%rcx, %r12
145d67f94:     	movl	(%rcx), %eax
145d67f96:     	testb	%dl, %dl
145d67f98:     	je	0x145d6806a <.text+0x5d6706a>
145d67f9e:     	leaq	-0xc(%rbp), %rbx
145d67fa2:     	movq	0x232f(%rip), %r14      # 0x145d6a2d8
145d67fa9:     	movq	0x2940(%rip), %r15      # 0x145d6a8f0
145d67fb0:     	jmp	0x145d67fcb <.text+0x5d66fcb>
145d67fb2:     	nopw	%cs:(%rax,%rax)
145d67fc0:     	orl	$0x1, %edx
145d67fc3:     	lock
145d67fc4:     	cmpxchgl	%edx, (%r12)
145d67fc9:     	je	0x145d68028 <.text+0x5d67028>
145d67fcb:     	movl	%eax, %ecx
145d67fcd:     	andl	$0x3, %ecx
145d67fd0:     	movl	%eax, %edx
145d67fd2:     	andl	$0x4, %edx
145d67fd5:     	leal	-0x2(%rcx), %r8d
145d67fd9:     	cmpl	$0x2, %r8d
145d67fdd:     	jb	0x145d67fc0 <.text+0x5d66fc0>
145d67fdf:     	cmpl	$0x1, %ecx
145d67fe2:     	jne	0x145d6805b <.text+0x5d6705b>
145d67fe4:     	testl	%edx, %edx
145d67fe6:     	jne	0x145d67ffe <.text+0x5d66ffe>
145d67fe8:     	orl	$0x4, %eax
145d67feb:     	movl	%eax, %edx
145d67fed:     	movl	$0x1, %eax
145d67ff2:     	lock
145d67ff3:     	cmpxchgl	%edx, (%r12)
145d67ff8:     	movl	%eax, %ecx
145d67ffa:     	movl	%edx, %eax
145d67ffc:     	jne	0x145d68024 <.text+0x5d67024>
145d67ffe:     	movl	%eax, -0xc(%rbp)
145d68001:     	movl	$0x4, %r8d
145d68007:     	movq	%r12, %rcx
145d6800a:     	movq	%rbx, %rdx
145d6800d:     	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
145d68013:     	callq	*%r14
145d68016:     	cmpl	$0x1, %eax
145d68019:     	je	0x145d6801e <.text+0x5d6701e>
145d6801b:     	callq	*%r15
145d6801e:     	movl	(%r12), %eax
145d68022:     	jmp	0x145d67fcb <.text+0x5d66fcb>
145d68024:     	movl	%ecx, %eax
145d68026:     	jmp	0x145d67fcb <.text+0x5d66fcb>
145d68028:     	movq	%r12, -0x18(%rbp)
145d6802c:     	cmpl	$0x2, %ecx
145d6802f:     	sete	%al
145d68032:     	movl	$0x0, -0x20(%rbp)
145d68039:     	movb	%al, -0x1c(%rbp)
145d6803c:     	leaq	-0x20(%rbp), %rdx
145d68040:     	movq	%rdi, %rcx
145d68043:     	callq	*0x20(%rsi)
145d68046:     	nop
145d68047:     	movl	-0x20(%rbp), %eax
145d6804a:     	movq	-0x18(%rbp), %rcx
145d6804e:     	xchgl	%eax, (%rcx)
145d68050:     	testb	$0x4, %al
145d68052:     	je	0x145d6805b <.text+0x5d6705b>
145d68054:     	callq	*0x2286(%rip)           # 0x145d6a2e0
145d6805a:     	nop
145d6805b:     	addq	$0x40, %rsp
145d6805f:     	popq	%rbx
145d68060:     	popq	%rdi
145d68061:     	popq	%rsi
145d68062:     	popq	%r12
145d68064:     	popq	%r14
145d68066:     	popq	%r15
145d68068:     	popq	%rbp
145d68069:     	retq
145d6806a:     	movl	%eax, %edx
145d6806c:     	andl	$0x3, %edx
145d6806f:     	movl	%eax, %ecx
145d68071:     	andl	$0x4, %ecx
145d68074:     	leaq	0x1480179(%rip), %rbx   # 0x1471e81f4
145d6807b:     	movslq	(%rbx,%rdx,4), %rdx
145d6807f:     	addq	%rbx, %rdx
145d68082:     	jmpq	*%rdx
145d68084:     	orl	$0x1, %ecx
145d68087:     	lock
145d68088:     	cmpxchgl	%ecx, (%r12)
145d6808d:     	jne	0x145d68108 <.text+0x5d67108>
145d6808f:     	movq	%r12, -0x18(%rbp)
145d68093:     	xorl	%eax, %eax
145d68095:     	jmp	0x145d68032 <.text+0x5d67032>
145d68097:     	movq	0x60(%rbp), %r8
145d6809b:     	leaq	0x147dbec(%rip), %rcx   # 0x1471e5c8e
145d680a2:     	movl	$0x55, %edx
145d680a7:     	callq	0x145d699c0 <.text+0x5d689c0>
145d680ac:     	ud2
145d680ae:     	testl	%ecx, %ecx
145d680b0:     	jne	0x145d680c8 <.text+0x5d670c8>
145d680b2:     	orl	$0x4, %eax
145d680b5:     	movl	%eax, %edx
145d680b7:     	movl	$0x1, %eax
145d680bc:     	lock
145d680bd:     	cmpxchgl	%edx, (%r12)
145d680c2:     	movl	%eax, %ecx
145d680c4:     	movl	%edx, %eax
145d680c6:     	jne	0x145d68106 <.text+0x5d67106>
145d680c8:     	movl	%eax, -0xc(%rbp)
145d680cb:     	leaq	-0xc(%rbp), %rdx
145d680cf:     	movl	$0x4, %r8d
145d680d5:     	movq	%r12, %rcx
145d680d8:     	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
145d680de:     	callq	*0x21f4(%rip)           # 0x145d6a2d8
145d680e4:     	cmpl	$0x1, %eax
145d680e7:     	je	0x145d680ef <.text+0x5d670ef>
145d680e9:     	callq	*0x2801(%rip)           # 0x145d6a8f0
145d680ef:     	movl	(%r12), %eax
145d680f3:     	movl	%eax, %edx
145d680f5:     	andl	$0x3, %edx
145d680f8:     	movl	%eax, %ecx
145d680fa:     	andl	$0x4, %ecx
145d680fd:     	movslq	(%rbx,%rdx,4), %rdx
145d68101:     	addq	%rbx, %rdx
145d68104:     	jmpq	*%rdx
145d68106:     	movl	%ecx, %eax
145d68108:     	movl	%eax, %edx
145d6810a:     	andl	$0x3, %edx
145d6810d:     	movl	%eax, %ecx
145d6810f:     	andl	$0x4, %ecx
145d68112:     	movslq	(%rbx,%rdx,4), %rdx
145d68116:     	addq	%rbx, %rdx
145d68119:     	jmpq	*%rdx

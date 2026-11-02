
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458fb994:     	movq	%rsi, 0xb8(%rbp)
1458fb99b:     	movq	0xb0(%rbp), %rax
1458fb9a2:     	movq	0x560(%rax), %rsi
1458fb9a9:     	movq	0x568(%rax), %rax
1458fb9b0:     	imulq	$0x160, %rax, %r15      # imm = 0x160
1458fb9b7:     	movq	%rax, -0x38(%rbp)
1458fb9bb:     	testq	%rax, %rax
1458fb9be:     	je	0x1458fb9ee <.text+0x58fa9ee>
1458fb9c0:     	movq	%r15, %rax
1458fb9c3:     	movq	%rsi, %rbx
1458fb9c6:     	jmp	0x1458fb9df <.text+0x58fa9df>
1458fb9c8:     	nopl	(%rax,%rax)
1458fb9d0:     	addq	$0x160, %rbx            # imm = 0x160
1458fb9d7:     	addq	$-0x160, %rax           # imm = 0xFEA0
1458fb9dd:     	je	0x1458fb9ee <.text+0x58fa9ee>
1458fb9df:     	cmpq	$-0x1, 0x18(%rbx)
1458fb9e4:     	je	0x1458fb9d0 <.text+0x58fa9d0>
1458fb9e6:     	cmpl	$0x1, 0x68(%rbx)
1458fb9ea:     	je	0x1458fb9d0 <.text+0x58fa9d0>
1458fb9ec:     	jmp	0x1458fb9f0 <.text+0x58fa9f0>
1458fb9ee:     	xorl	%ebx, %ebx
1458fb9f0:     	movb	%r12b, 0xe4(%rbp)
1458fb9f7:     	movq	%r14, 0xa8(%rbp)
1458fb9fe:     	movq	%rdi, 0x70(%rbp)
1458fba02:     	callq	0x140002200 <.text+0x1200>
1458fba07:     	movl	$0x1, %ecx
1458fba0c:     	movl	$0x1, %edx
1458fba11:     	callq	0x1400021c0 <.text+0x11c0>
1458fba16:     	testq	%rax, %rax
1458fba19:     	je	0x1458fd946 <.text+0x58fc946>
1458fba1f:     	addq	%rsi, %r15
1458fba22:     	movb	$0x5b, (%rax)
1458fba25:     	movb	$0x1, %r9b
1458fba28:     	leaq	0xf0(%rbp), %rdi
1458fba2f:     	leaq	0x140(%rbp), %r14
1458fba36:     	xorps	%xmm7, %xmm7
1458fba39:     	movl	$0x1, %ecx
1458fba3e:     	movq	%rcx, 0x38(%rbp)
1458fba42:     	movq	%rsi, %rcx
1458fba45:     	movq	%rsi, %r12
1458fba48:     	movl	$0x1, %r8d
1458fba4e:     	movq	%rsi, -0x10(%rbp)
1458fba52:     	testq	%rcx, %rcx
1458fba55:     	movq	%rax, 0x28(%rbp)
1458fba59:     	jne	0x1458fbbf7 <.text+0x58fabf7>
1458fba5f:     	jmp	0x1458fbc27 <.text+0x58fac27>
1458fba64:     	movb	$0x7b, (%rax)
1458fba67:     	movq	$0x1, 0x140(%rbp)
1458fba72:     	movq	%rax, 0x148(%rbp)
1458fba79:     	movq	$0x1, 0x150(%rbp)
1458fba84:     	movb	$0x1, 0x158(%rbp)
1458fba8b:     	movb	$0x1, 0xe6(%rbp)
1458fba92:     	movq	%r12, %rcx
1458fba95:     	callq	0x1458dfb70 <.text+0x58deb70>
1458fba9a:     	nop
1458fba9b:     	movb	$0x0, 0xe6(%rbp)
1458fbaa2:     	movq	%rdx, 0x28(%rsp)
1458fbaa7:     	movq	%rax, 0x20(%rsp)
1458fbaac:     	movl	$0x4, %r9d
1458fbab2:     	movq	%rdi, %rcx
1458fbab5:     	movq	%r14, %rdx
1458fbab8:     	leaq	0x157d87c(%rip), %r8    # 0x146e7933b
1458fbabf:     	callq	0x1458d97b0 <.text+0x58d87b0>
1458fbac4:     	nop
1458fbac5:     	movss	0xf0(%r12), %xmm0
1458fbacf:     	maxss	%xmm7, %xmm0
1458fbad3:     	movb	$0x1, 0x16d(%rbp)
1458fbada:     	movss	%xmm0, 0x20(%rsp)
1458fbae0:     	movl	$0x2, %r9d
1458fbae6:     	movq	%r14, %rcx
1458fbae9:     	movq	%rdi, %rdx
1458fbaec:     	leaq	0x157d88c(%rip), %r8    # 0x146e7937f
1458fbaf3:     	callq	0x1458d6ca0 <.text+0x58d5ca0>
1458fbaf8:     	nop
1458fbaf9:     	movss	0xf4(%r12), %xmm0
1458fbb03:     	movb	$0x1, 0x16d(%rbp)
1458fbb0a:     	movss	%xmm0, 0x20(%rsp)
1458fbb10:     	movl	$0x5, %r9d
1458fbb16:     	movq	%rdi, %rcx
1458fbb19:     	movq	%r14, %rdx
1458fbb1c:     	leaq	0x157d85e(%rip), %r8    # 0x146e79381
1458fbb23:     	callq	0x1458d6ca0 <.text+0x58d5ca0>
1458fbb28:     	nop
1458fbb29:     	movq	0x100(%rbp), %r12
1458fbb30:     	cmpq	%r12, 0xf0(%rbp)
1458fbb37:     	je	0x1458fbbc6 <.text+0x58fabc6>
1458fbb3d:     	movq	0xf8(%rbp), %rax
1458fbb44:     	movb	$0x7d, (%rax,%r12)
1458fbb49:     	incq	%r12
1458fbb4c:     	movq	%r12, 0x150(%rbp)
1458fbb53:     	movups	0xf0(%rbp), %xmm0
1458fbb5a:     	movaps	%xmm0, 0x140(%rbp)
1458fbb61:     	movb	$0x0, 0x16d(%rbp)
1458fbb68:     	leaq	0x80(%rbp), %rcx
1458fbb6f:     	leaq	0xc0(%rbp), %rdx
1458fbb76:     	movq	%r14, %r8
1458fbb79:     	callq	0x1458d92b0 <.text+0x58d82b0>
1458fbb7e:     	nop
1458fbb7f:     	movq	0x80(%rbp), %rax
1458fbb86:     	movq	%rax, 0x38(%rbp)
1458fbb8a:     	movq	0x88(%rbp), %rdx
1458fbb91:     	movq	0x90(%rbp), %r8
1458fbb98:     	movzbl	0x98(%rbp), %r9d
1458fbba0:     	leaq	0x99(%rbp), %rcx
1458fbba7:     	movl	(%rcx), %eax
1458fbba9:     	movl	0x3(%rcx), %ecx
1458fbbac:     	movl	%eax, -0x8(%rbp)
1458fbbaf:     	movl	%ecx, -0x5(%rbp)
1458fbbb2:     	movq	%rsi, %rcx
1458fbbb5:     	movq	%rdx, %rax
1458fbbb8:     	movq	%r13, %r12
1458fbbbb:     	testq	%rcx, %rcx
1458fbbbe:     	movq	%rax, 0x28(%rbp)
1458fbbc2:     	jne	0x1458fbbf7 <.text+0x58fabf7>
1458fbbc4:     	jmp	0x1458fbc27 <.text+0x58fac27>
1458fbbc6:     	movq	$0x1, 0x20(%rsp)
1458fbbcf:     	movl	$0x1, %r8d
1458fbbd5:     	movl	$0x1, %r9d
1458fbbdb:     	movq	%rdi, %rcx
1458fbbde:     	movq	%r12, %rdx
1458fbbe1:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458fbbe6:     	nop
1458fbbe7:     	jmp	0x1458fbb3d <.text+0x58fab3d>
1458fbbec:     	nopl	(%rax)
1458fbbf0:     	addq	$0x160, %rcx            # imm = 0x160
1458fbbf7:     	cmpq	%r15, %rcx
1458fbbfa:     	je	0x1458fbc27 <.text+0x58fac27>
1458fbbfc:     	cmpb	$0x0, 0x68(%rcx)
1458fbc00:     	jne	0x1458fbbf0 <.text+0x58fabf0>
1458fbc02:     	cmpq	$-0x1, 0x18(%rcx)
1458fbc07:     	je	0x1458fbbf0 <.text+0x58fabf0>
1458fbc09:     	leaq	0x160(%rcx), %rsi
1458fbc10:     	movq	%r12, %r13
1458fbc13:     	movq	%rcx, %r12
1458fbc16:     	jmp	0x1458fbc52 <.text+0x58fac52>
1458fbc18:     	nopl	(%rax,%rax)
1458fbc20:     	addq	$0x160, %r12            # imm = 0x160
1458fbc27:     	cmpq	%r15, %r12
1458fbc2a:     	je	0x1458fbcc1 <.text+0x58facc1>
1458fbc30:     	cmpb	$0x0, 0x68(%r12)
1458fbc36:     	jne	0x1458fbc20 <.text+0x58fac20>
1458fbc38:     	cmpq	$-0x1, 0x40(%r12)
1458fbc3e:     	je	0x1458fbc20 <.text+0x58fac20>
1458fbc40:     	cmpb	$0x0, 0x60(%r12)
1458fbc46:     	je	0x1458fbc20 <.text+0x58fac20>
1458fbc48:     	leaq	0x160(%r12), %r13
1458fbc50:     	xorl	%esi, %esi
1458fbc52:     	movq	0x38(%rbp), %rax
1458fbc56:     	movq	%rax, 0xc0(%rbp)
1458fbc5d:     	movq	0x28(%rbp), %rax
1458fbc61:     	movq	%rax, 0xc8(%rbp)
1458fbc68:     	movq	%r8, 0xd0(%rbp)
1458fbc6f:     	movb	%r9b, 0xd8(%rbp)
1458fbc76:     	movl	-0x8(%rbp), %eax
1458fbc79:     	movl	-0x5(%rbp), %ecx
1458fbc7c:     	leaq	0xd9(%rbp), %rdx
1458fbc83:     	movl	%ecx, 0x3(%rdx)
1458fbc86:     	movl	%eax, (%rdx)
1458fbc88:     	callq	0x140002200 <.text+0x1200>
1458fbc8d:     	movl	$0x1, %ecx
1458fbc92:     	movl	$0x1, %edx
1458fbc97:     	callq	0x1400021c0 <.text+0x11c0>
1458fbc9c:     	testq	%rax, %rax
1458fbc9f:     	jne	0x1458fba64 <.text+0x58faa64>
1458fbca5:     	movb	$0x1, 0x16d(%rbp)
1458fbcac:     	movl	$0x1, %ecx
1458fbcb1:     	movl	$0x1, %edx
1458fbcb6:     	callq	0x145d6944b <.text+0x5d6844b>
1458fbcbb:     	nop
1458fbcbc:     	jmp	0x1458fda4b <.text+0x58fca4b>

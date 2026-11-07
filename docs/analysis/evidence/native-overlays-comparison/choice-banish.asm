
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e3f50:     	pushq	%rbp
1454e3f51:     	pushq	%r14
1454e3f53:     	pushq	%rsi
1454e3f54:     	pushq	%rdi
1454e3f55:     	pushq	%rbx
1454e3f56:     	subq	$0x50, %rsp
1454e3f5a:     	leaq	0x50(%rsp), %rbp
1454e3f5f:     	movq	$-0x2, -0x8(%rbp)
1454e3f67:     	cmpb	$0x2, 0x95f(%rcx)
1454e3f6e:     	sete	%al
1454e3f71:     	movl	0x948(%rcx), %edi
1454e3f77:     	testl	%edi, %edi
1454e3f79:     	setne	%r8b
1454e3f7d:     	andb	%al, %r8b
1454e3f80:     	cmpb	$0x1, %r8b
1454e3f84:     	jne	0x1454e404b <.text+0x54e304b>
1454e3f8a:     	movzbl	0x95d(%rcx), %ebx
1454e3f91:     	cmpb	$-0x1, %bl
1454e3f94:     	je	0x1454e404b <.text+0x54e304b>
1454e3f9a:     	cmpq	0x578(%rcx), %rdx
1454e3fa1:     	jae	0x1454e404b <.text+0x54e304b>
1454e3fa7:     	leaq	(%rdx,%rdx,4), %r8
1454e3fab:     	shlq	$0x5, %r8
1454e3faf:     	addq	0x570(%rcx), %r8
1454e3fb6:     	leaq	-0x30(%rbp), %rax
1454e3fba:     	movq	%rcx, %rsi
1454e3fbd:     	movq	%rax, %rcx
1454e3fc0:     	movq	%rsi, %rdx
1454e3fc3:     	callq	0x1454da3d0 <.text+0x54d93d0>
1454e3fc8:     	movq	-0x30(%rbp), %rax
1454e3fcc:     	cmpq	$-0x1, %rax
1454e3fd0:     	je	0x1454e404b <.text+0x54e304b>
1454e3fd2:     	movq	%rsi, %rcx
1454e3fd5:     	movq	%rax, -0x10(%rbp)
1454e3fd9:     	movq	-0x28(%rbp), %rax
1454e3fdd:     	movq	%rax, -0x18(%rbp)
1454e3fe1:     	movq	-0x20(%rbp), %r14
1454e3fe5:     	decl	%edi
1454e3fe7:     	movl	%edi, 0x948(%rsi)
1454e3fed:     	movq	0x818(%rsi), %rdi
1454e3ff4:     	cmpq	0x808(%rsi), %rdi
1454e3ffb:     	jne	0x1454e400c <.text+0x54e300c>
1454e3ffd:     	addq	$0x808, %rcx            # imm = 0x808
1454e4004:     	callq	0x145757f60 <.text+0x5756f60>
1454e4009:     	movq	%rsi, %rcx
1454e400c:     	movq	0x810(%rcx), %rax
1454e4013:     	leaq	(%rdi,%rdi,2), %rdx
1454e4017:     	movq	-0x10(%rbp), %r8
1454e401b:     	movq	%r8, (%rax,%rdx,8)
1454e401f:     	movq	-0x18(%rbp), %r8
1454e4023:     	movq	%r8, 0x8(%rax,%rdx,8)
1454e4028:     	movq	%r14, 0x10(%rax,%rdx,8)
1454e402d:     	incq	%rdi
1454e4030:     	movq	%rdi, 0x818(%rcx)
1454e4037:     	movl	%ebx, %edx
1454e4039:     	xorl	%r8d, %r8d
1454e403c:     	addq	$0x50, %rsp
1454e4040:     	popq	%rbx
1454e4041:     	popq	%rdi
1454e4042:     	popq	%rsi
1454e4043:     	popq	%r14
1454e4045:     	popq	%rbp
1454e4046:     	jmp	0x1454da5f0 <.text+0x54d95f0>
1454e404b:     	addq	$0x50, %rsp
1454e404f:     	popq	%rbx
1454e4050:     	popq	%rdi
1454e4051:     	popq	%rsi
1454e4052:     	popq	%r14
1454e4054:     	popq	%rbp
1454e4055:     	retq

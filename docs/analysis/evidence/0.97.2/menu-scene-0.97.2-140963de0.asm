
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140963de0:     	pushq	%r15
140963de2:     	pushq	%r14
140963de4:     	pushq	%rsi
140963de5:     	pushq	%rdi
140963de6:     	pushq	%rbx
140963de7:     	subq	$0x60, %rsp
140963deb:     	movl	$0x1, %ebx
140963df0:     	lock
140963df1:     	xaddl	%ebx, 0x5b0(%r8)
140963df9:     	cmpl	$0x1, (%rdx)
140963dfc:     	jne	0x140963eda <.text+0x962eda>
140963e02:     	movq	%rdx, %rsi
140963e05:     	movq	0x5a0(%r8), %rax
140963e0c:     	movq	%rax, 0x40(%rsp)
140963e11:     	cmpq	%rax, 0x18(%rdx)
140963e15:     	jne	0x140963ef4 <.text+0x962ef4>
140963e1b:     	movq	0x8(%rsi), %rax
140963e1f:     	movq	0x218(%r8), %rdx
140963e26:     	cmpq	%rdx, %rax
140963e29:     	jae	0x140963f25 <.text+0x962f25>
140963e2f:     	movq	%rcx, %rdi
140963e32:     	movq	0x210(%r8), %r9
140963e39:     	movq	(%r9,%rax,8), %rcx
140963e3d:     	testq	%rcx, %rcx
140963e40:     	je	0x140963f25 <.text+0x962f25>
140963e46:     	movq	0x1e0(%r8), %rax
140963e4d:     	notq	%rcx
140963e50:     	imulq	$0x38, %rcx, %rcx
140963e54:     	cmpb	$0x0, 0x30(%rax,%rcx)
140963e59:     	je	0x140963f25 <.text+0x962f25>
140963e5f:     	movq	0x10(%rsi), %r10
140963e63:     	cmpq	%rdx, %r10
140963e66:     	jae	0x140963f63 <.text+0x962f63>
140963e6c:     	movq	(%r9,%r10,8), %rdx
140963e70:     	testq	%rdx, %rdx
140963e73:     	je	0x140963f63 <.text+0x962f63>
140963e79:     	notq	%rdx
140963e7c:     	imulq	$0x38, %rdx, %r14
140963e80:     	cmpb	$0x0, 0x30(%rax,%r14)
140963e86:     	je	0x140963f63 <.text+0x962f63>
140963e8c:     	addq	%rax, %rcx
140963e8f:     	movq	0x10(%rcx), %rcx
140963e93:     	addq	%rax, %r14
140963e96:     	movq	0x10(%r14), %r15
140963e9a:     	movl	0x5b0(%r8), %eax
140963ea1:     	cmpb	$0x3, (%rcx)
140963ea4:     	jne	0x140963eb0 <.text+0x962eb0>
140963ea6:     	movb	$0x1, %al
140963ea8:     	cmpb	$0x0, (%r15)
140963eac:     	je	0x140963eba <.text+0x962eba>
140963eae:     	jmp	0x140963ec1 <.text+0x962ec1>
140963eb0:     	callq	0x1406cc320 <.text+0x6cb320>
140963eb5:     	cmpb	(%r15), %al
140963eb8:     	je	0x140963ec1 <.text+0x962ec1>
140963eba:     	movl	%ebx, 0x2c(%r14)
140963ebe:     	movb	%al, (%r15)
140963ec1:     	movl	%ebx, 0x20(%rsi)
140963ec4:     	movq	$-0x3, (%rdi)
140963ecb:     	movq	%rdi, %rax
140963ece:     	addq	$0x60, %rsp
140963ed2:     	popq	%rbx
140963ed3:     	popq	%rdi
140963ed4:     	popq	%rsi
140963ed5:     	popq	%r14
140963ed7:     	popq	%r15
140963ed9:     	retq
140963eda:     	leaq	0x50c2877(%rip), %rcx   # 0x145a26758
140963ee1:     	leaq	0x50c28d0(%rip), %r8    # 0x145a267b8
140963ee8:     	movl	$0x59, %edx
140963eed:     	callq	0x1458e74d0 <.text+0x58e64d0>
140963ef2:     	ud2
140963ef4:     	addq	$0x18, %rsi
140963ef8:     	leaq	0x50c2941(%rip), %rax   # 0x145a26840
140963eff:     	movq	%rax, 0x28(%rsp)
140963f04:     	movq	$0xdf, 0x20(%rsp)
140963f0d:     	leaq	0x50c28bc(%rip), %r9    # 0x145a267d0
140963f14:     	leaq	0x40(%rsp), %r8
140963f19:     	xorl	%ecx, %ecx
140963f1b:     	movq	%rsi, %rdx
140963f1e:     	callq	0x14589fabd <.text+0x589eabd>
140963f23:     	ud2
140963f25:     	addq	$0x24, %rsi
140963f29:     	movq	%rsi, 0x40(%rsp)
140963f2e:     	leaq	0x469507b(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
140963f35:     	movq	%rax, 0x48(%rsp)
140963f3a:     	leaq	0x3f(%rsp), %rcx
140963f3f:     	movq	%rcx, 0x50(%rsp)
140963f44:     	movq	%rax, 0x58(%rsp)
140963f49:     	leaq	0x50c21c8(%rip), %rcx   # 0x145a26118
140963f50:     	leaq	0x50c2261(%rip), %r8    # 0x145a261b8
140963f57:     	leaq	0x40(%rsp), %rdx
140963f5c:     	callq	0x1458e7790 <.text+0x58e6790>
140963f61:     	ud2
140963f63:     	addq	$0x24, %rsi
140963f67:     	movq	%rsi, 0x40(%rsp)
140963f6c:     	leaq	0x469503d(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
140963f73:     	movq	%rax, 0x48(%rsp)
140963f78:     	leaq	0x3f(%rsp), %rcx
140963f7d:     	movq	%rcx, 0x50(%rsp)
140963f82:     	movq	%rax, 0x58(%rsp)
140963f87:     	leaq	0x50c218a(%rip), %rcx   # 0x145a26118
140963f8e:     	leaq	0x50c23cb(%rip), %r8    # 0x145a26360
140963f95:     	leaq	0x40(%rsp), %rdx
140963f9a:     	callq	0x1458e7790 <.text+0x58e6790>
140963f9f:     	ud2

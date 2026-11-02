
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145544ec0:     	pushq	%r15
145544ec2:     	pushq	%r14
145544ec4:     	pushq	%r13
145544ec6:     	pushq	%r12
145544ec8:     	pushq	%rsi
145544ec9:     	pushq	%rdi
145544eca:     	pushq	%rbx
145544ecb:     	movq	%rcx, %rax
145544ece:     	movq	(%rdx), %rcx
145544ed1:     	movq	0x10(%rdx), %r8
145544ed5:     	movq	0x30(%rdx), %r9
145544ed9:     	movq	%rcx, %r10
145544edc:     	testq	%r9, %r9
145544edf:     	je	0x145544f70 <.text+0x5543f70>
145544ee5:     	movq	0x8(%rdx), %r11
145544ee9:     	movq	0x18(%rdx), %rsi
145544eed:     	movq	%rcx, %r10
145544ef0:     	cmpq	%rsi, %r11
145544ef3:     	je	0x145544f70 <.text+0x5543f70>
145544ef5:     	movq	0x20(%rdx), %rdi
145544ef9:     	movq	0x28(%rdx), %rdx
145544efd:     	movq	%rcx, %r10
145544f00:     	jmp	0x145544f15 <.text+0x5543f15>
145544f02:     	movq	%rbx, (%r10)
145544f05:     	addq	$0x8, %r10
145544f09:     	decq	%r9
145544f0c:     	je	0x145544f70 <.text+0x5543f70>
145544f0e:     	nop
145544f10:     	cmpq	%rsi, %r11
145544f13:     	je	0x145544f70 <.text+0x5543f70>
145544f15:     	movq	(%r11), %rbx
145544f18:     	addq	$0x8, %r11
145544f1c:     	movq	0x8(%rdi), %r14
145544f20:     	imulq	$0x160, 0x10(%rdi), %r12 # imm = 0x160
145544f28:     	xorl	%r15d, %r15d
145544f2b:     	movq	%r14, %r13
145544f2e:     	nop
145544f30:     	cmpq	%r15, %r12
145544f33:     	je	0x145544f10 <.text+0x5543f10>
145544f35:     	addq	$0x160, %r15            # imm = 0x160
145544f3c:     	cmpq	%rbx, 0x88(%r13)
145544f43:     	leaq	0x160(%r13), %r13
145544f4a:     	jne	0x145544f30 <.text+0x5543f30>
145544f4c:     	movss	(%rdx), %xmm0
145544f50:     	ucomiss	-0x20(%r14,%r15), %xmm0
145544f56:     	jb	0x145544f10 <.text+0x5543f10>
145544f58:     	cmpq	$-0x1, -0x120(%r14,%r15)
145544f61:     	je	0x145544f02 <.text+0x5543f02>
145544f63:     	cmpb	$0x1, -0x100(%r14,%r15)
145544f6c:     	je	0x145544f02 <.text+0x5543f02>
145544f6e:     	jmp	0x145544f10 <.text+0x5543f10>
145544f70:     	subq	%rcx, %r10
145544f73:     	shrq	$0x3, %r10
145544f77:     	movq	%r8, (%rax)
145544f7a:     	movq	%rcx, 0x8(%rax)
145544f7e:     	movq	%r10, 0x10(%rax)
145544f82:     	popq	%rbx
145544f83:     	popq	%rdi
145544f84:     	popq	%rsi
145544f85:     	popq	%r12
145544f87:     	popq	%r13
145544f89:     	popq	%r14
145544f8b:     	popq	%r15
145544f8d:     	retq

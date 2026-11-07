
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14014acf0:     	pushq	%rbp
14014acf1:     	pushq	%r15
14014acf3:     	pushq	%r14
14014acf5:     	pushq	%r13
14014acf7:     	pushq	%r12
14014acf9:     	pushq	%rsi
14014acfa:     	pushq	%rdi
14014acfb:     	pushq	%rbx
14014acfc:     	subq	$0x48, %rsp
14014ad00:     	leaq	0x40(%rsp), %rbp
14014ad05:     	movq	$-0x2, (%rbp)
14014ad0d:     	movq	%rcx, %rdi
14014ad10:     	movq	(%r8), %rax
14014ad13:     	movq	%rax, -0x8(%rbp)
14014ad17:     	movq	0x8(%r8), %rcx
14014ad1b:     	cmpq	%rdx, %rdi
14014ad1e:     	je	0x14014addf <.text+0x149ddf>
14014ad24:     	movq	%rdx, %rsi
14014ad27:     	movq	0x10(%r8), %r13
14014ad2b:     	subq	%rdi, %rsi
14014ad2e:     	shrq	$0x5, %rsi
14014ad32:     	leaq	0x5c624ef(%rip), %rbx   # 0x145dad228
14014ad39:     	xorl	%r12d, %r12d
14014ad3c:     	movq	%rcx, -0x10(%rbp)
14014ad40:     	movq	%r12, %r8
14014ad43:     	shlq	$0x5, %r8
14014ad47:     	addq	%rdi, %r8
14014ad4a:     	movl	$0x4, %edx
14014ad4f:     	movq	%rbx, %rcx
14014ad52:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14014ad57:     	nop
14014ad58:     	testq	%rax, %rax
14014ad5b:     	jne	0x14014ad64 <.text+0x149d64>
14014ad5d:     	movq	0x7e8f52c(%rip), %rax   # 0x147fda290
14014ad64:     	cmpb	$0x3, (%rax)
14014ad67:     	jne	0x14014adb0 <.text+0x149db0>
14014ad69:     	movq	0x18(%rax), %r15
14014ad6d:     	testq	%r15, %r15
14014ad70:     	js	0x14014adf7 <.text+0x149df7>
14014ad76:     	je	0x14014adb0 <.text+0x149db0>
14014ad78:     	movq	0x10(%rax), %rax
14014ad7c:     	movq	%rax, -0x18(%rbp)
14014ad80:     	callq	0x140002200 <.text+0x1200>
14014ad85:     	movl	$0x1, %edx
14014ad8a:     	movq	%r15, %rcx
14014ad8d:     	callq	0x1400021c0 <.text+0x11c0>
14014ad92:     	testq	%rax, %rax
14014ad95:     	je	0x14014ae04 <.text+0x149e04>
14014ad97:     	movq	%rax, %r14
14014ad9a:     	movq	%rax, %rcx
14014ad9d:     	movq	-0x18(%rbp), %rdx
14014ada1:     	movq	%r15, %r8
14014ada4:     	callq	0x145bc977b <.text+0x5bc877b>
14014ada9:     	jmp	0x14014adb9 <.text+0x149db9>
14014adab:     	nopl	(%rax,%rax)
14014adb0:     	movl	$0x1, %r14d
14014adb6:     	xorl	%r15d, %r15d
14014adb9:     	movq	-0x10(%rbp), %rcx
14014adbd:     	leaq	(%rcx,%rcx,2), %rax
14014adc1:     	movq	%r15, (%r13,%rax,8)
14014adc6:     	movq	%r14, 0x8(%r13,%rax,8)
14014adcb:     	movq	%r15, 0x10(%r13,%rax,8)
14014add0:     	incq	%rcx
14014add3:     	incq	%r12
14014add6:     	cmpq	%rsi, %r12
14014add9:     	jne	0x14014ad3c <.text+0x149d3c>
14014addf:     	movq	-0x8(%rbp), %rax
14014ade3:     	movq	%rcx, (%rax)
14014ade6:     	addq	$0x48, %rsp
14014adea:     	popq	%rbx
14014adeb:     	popq	%rdi
14014adec:     	popq	%rsi
14014aded:     	popq	%r12
14014adef:     	popq	%r13
14014adf1:     	popq	%r14
14014adf3:     	popq	%r15
14014adf5:     	popq	%rbp
14014adf6:     	retq
14014adf7:     	xorl	%ecx, %ecx
14014adf9:     	movq	%r14, %rdx
14014adfc:     	callq	0x145d6944b <.text+0x5d6844b>
14014ae01:     	nop
14014ae02:     	ud2
14014ae04:     	movq	%r15, %r14
14014ae07:     	movl	$0x1, %ecx
14014ae0c:     	jmp	0x14014adf9 <.text+0x149df9>

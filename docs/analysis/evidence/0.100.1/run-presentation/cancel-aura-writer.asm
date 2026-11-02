
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14558a7c0:     	pushq	%rbp
14558a7c1:     	pushq	%rsi
14558a7c2:     	pushq	%rdi
14558a7c3:     	pushq	%rbx
14558a7c4:     	subq	$0x38, %rsp
14558a7c8:     	leaq	0x30(%rsp), %rbp
14558a7cd:     	movq	$-0x2, (%rbp)
14558a7d5:     	movl	%edx, %edi
14558a7d7:     	movq	%rcx, %rsi
14558a7da:     	callq	0x140002200 <.text+0x1200>
14558a7df:     	movl	$0x4, %ecx
14558a7e4:     	movl	$0x1, %edx
14558a7e9:     	callq	0x1400021c0 <.text+0x11c0>
14558a7ee:     	testq	%rax, %rax
14558a7f1:     	je	0x14558a886 <.text+0x5589886>
14558a7f7:     	movl	%edi, (%rax)
14558a7f9:     	leaq	0x18(%rsi), %rcx
14558a7fd:     	leaq	0x2c(%rsi), %rdx
14558a801:     	movq	$0x4, 0x20(%rsp)
14558a80a:     	movw	$0x136, %r8w            # imm = 0x136
14558a80f:     	movq	%rax, -0x8(%rbp)
14558a813:     	movq	%rax, %r9
14558a816:     	callq	0x145570140 <.text+0x556f140>
14558a81b:     	nop
14558a81c:     	movq	%rax, %rdi
14558a81f:     	testq	%rax, %rax
14558a822:     	setne	%cl
14558a825:     	movq	(%rsi), %rax
14558a828:     	cmpq	$-0x1, %rax
14558a82c:     	sete	%dl
14558a82f:     	orb	%cl, %dl
14558a831:     	jne	0x14558a866 <.text+0x5589866>
14558a833:     	movq	0x10(%rsi), %rbx
14558a837:     	cmpq	%rax, %rbx
14558a83a:     	jne	0x14558a845 <.text+0x5589845>
14558a83c:     	movq	%rsi, %rcx
14558a83f:     	callq	0x145774860 <.text+0x5773860>
14558a844:     	nop
14558a845:     	movq	0x8(%rsi), %rax
14558a849:     	movq	%rbx, %rcx
14558a84c:     	shlq	$0x4, %rcx
14558a850:     	movw	$0x136, (%rax,%rcx)     # imm = 0x136
14558a856:     	movq	$0x4, 0x8(%rax,%rcx)
14558a85f:     	incq	%rbx
14558a862:     	movq	%rbx, 0x10(%rsi)
14558a866:     	movl	$0x4, %edx
14558a86b:     	movl	$0x1, %r8d
14558a871:     	movq	-0x8(%rbp), %rcx
14558a875:     	callq	0x1400021d0 <.text+0x11d0>
14558a87a:     	movq	%rdi, %rax
14558a87d:     	addq	$0x38, %rsp
14558a881:     	popq	%rbx
14558a882:     	popq	%rdi
14558a883:     	popq	%rsi
14558a884:     	popq	%rbp
14558a885:     	retq
14558a886:     	movl	$0x1, %ecx
14558a88b:     	movl	$0x4, %edx
14558a890:     	callq	0x14590379b <.text+0x590279b>
14558a895:     	ud2

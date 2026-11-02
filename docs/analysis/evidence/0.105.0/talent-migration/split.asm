
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459a67a0:     	pushq	%r15
1459a67a2:     	pushq	%r14
1459a67a4:     	pushq	%r13
1459a67a6:     	pushq	%r12
1459a67a8:     	pushq	%rsi
1459a67a9:     	pushq	%rdi
1459a67aa:     	pushq	%rbp
1459a67ab:     	pushq	%rbx
1459a67ac:     	subq	$0x28, %rsp
1459a67b0:     	movq	%rdx, %rdi
1459a67b3:     	movq	0x8(%rdx), %r12
1459a67b7:     	movq	0x18(%rdx), %r15
1459a67bb:     	cmpq	%r12, %r15
1459a67be:     	seta	%al
1459a67c1:     	movq	0x10(%rdx), %r14
1459a67c5:     	cmpq	%r14, %r15
1459a67c8:     	setb	%dl
1459a67cb:     	orb	%al, %dl
1459a67cd:     	jne	0x1459a692b <.text+0x59a592b>
1459a67d3:     	movq	(%rdi), %rsi
1459a67d6:     	movzbl	0x28(%rdi), %ebx
1459a67da:     	movzbl	0x1f(%rdi,%rbx), %ebp
1459a67df:     	cmpq	$0x5, %rbx
1459a67e3:     	movq	%rcx, 0x20(%rsp)
1459a67e8:     	jb	0x1459a6879 <.text+0x59a5879>
1459a67ee:     	movq	%r15, %r8
1459a67f1:     	subq	%r14, %r8
1459a67f4:     	leaq	(%rsi,%r14), %rax
1459a67f8:     	cmpq	$0xf, %r8
1459a67fc:     	ja	0x1459a681a <.text+0x59a581a>
1459a67fe:     	xorl	%edx, %edx
1459a6800:     	testq	%r8, %r8
1459a6803:     	je	0x1459a6826 <.text+0x59a5826>
1459a6805:     	cmpb	%bpl, (%rax,%rdx)
1459a6809:     	je	0x1459a682a <.text+0x59a582a>
1459a680b:     	incq	%rdx
1459a680e:     	cmpq	%rdx, %r8
1459a6811:     	jne	0x1459a6805 <.text+0x59a5805>
1459a6813:     	movq	%r8, %rdx
1459a6816:     	xorl	%eax, %eax
1459a6818:     	jmp	0x1459a682f <.text+0x59a582f>
1459a681a:     	movl	%ebp, %ecx
1459a681c:     	movq	%rax, %rdx
1459a681f:     	callq	0x145ba4f00 <.text+0x5ba3f00>
1459a6824:     	jmp	0x1459a682f <.text+0x59a582f>
1459a6826:     	xorl	%eax, %eax
1459a6828:     	jmp	0x1459a682f <.text+0x59a582f>
1459a682a:     	movl	$0x1, %eax
1459a682f:     	cmpq	$0x1, %rax
1459a6833:     	jne	0x1459a6919 <.text+0x59a5919>
1459a6839:     	addq	%rdx, %r14
1459a683c:     	incq	%r14
1459a683f:     	movq	%r14, 0x10(%rdi)
1459a6843:     	cmpq	%rbx, %r14
1459a6846:     	setb	%al
1459a6849:     	cmpq	%r12, %r14
1459a684c:     	seta	%cl
1459a684f:     	orb	%al, %cl
1459a6851:     	je	0x1459a6941 <.text+0x59a5941>
1459a6857:     	cmpq	%r14, %r15
1459a685a:     	movq	0x20(%rsp), %rcx
1459a685f:     	movl	$0x0, %eax
1459a6864:     	jae	0x1459a67ee <.text+0x59a57ee>
1459a6866:     	jmp	0x1459a692d <.text+0x59a592d>
1459a686b:     	nopl	(%rax,%rax)
1459a6870:     	cmpq	%r14, %r15
1459a6873:     	jb	0x1459a6926 <.text+0x59a5926>
1459a6879:     	movq	%r15, %r8
1459a687c:     	subq	%r14, %r8
1459a687f:     	leaq	(%rsi,%r14), %rax
1459a6883:     	cmpq	$0x10, %r8
1459a6887:     	jae	0x1459a68b0 <.text+0x59a58b0>
1459a6889:     	xorl	%edx, %edx
1459a688b:     	testq	%r8, %r8
1459a688e:     	je	0x1459a68a1 <.text+0x59a58a1>
1459a6890:     	cmpb	%bpl, (%rax,%rdx)
1459a6894:     	je	0x1459a68c2 <.text+0x59a58c2>
1459a6896:     	incq	%rdx
1459a6899:     	cmpq	%rdx, %r8
1459a689c:     	jne	0x1459a6890 <.text+0x59a5890>
1459a689e:     	movq	%r8, %rdx
1459a68a1:     	xorl	%eax, %eax
1459a68a3:     	cmpq	$0x1, %rax
1459a68a7:     	je	0x1459a68d0 <.text+0x59a58d0>
1459a68a9:     	jmp	0x1459a6919 <.text+0x59a5919>
1459a68ab:     	nopl	(%rax,%rax)
1459a68b0:     	movl	%ebp, %ecx
1459a68b2:     	movq	%rax, %rdx
1459a68b5:     	callq	0x145ba4f00 <.text+0x5ba3f00>
1459a68ba:     	cmpq	$0x1, %rax
1459a68be:     	je	0x1459a68d0 <.text+0x59a58d0>
1459a68c0:     	jmp	0x1459a6919 <.text+0x59a5919>
1459a68c2:     	movl	$0x1, %eax
1459a68c7:     	cmpq	$0x1, %rax
1459a68cb:     	jne	0x1459a6919 <.text+0x59a5919>
1459a68cd:     	nopl	(%rax)
1459a68d0:     	addq	%rdx, %r14
1459a68d3:     	incq	%r14
1459a68d6:     	movq	%r14, 0x10(%rdi)
1459a68da:     	movq	%r14, %r13
1459a68dd:     	subq	%rbx, %r13
1459a68e0:     	setb	%al
1459a68e3:     	cmpq	%r12, %r14
1459a68e6:     	seta	%cl
1459a68e9:     	orb	%al, %cl
1459a68eb:     	jne	0x1459a6870 <.text+0x59a5870>
1459a68ed:     	leaq	(%rsi,%r13), %rcx
1459a68f1:     	leaq	0x20(%rdi), %rdx
1459a68f5:     	movq	%rbx, %r8
1459a68f8:     	callq	0x145bc9787 <.text+0x5bc8787>
1459a68fd:     	testl	%eax, %eax
1459a68ff:     	jne	0x1459a6870 <.text+0x59a5870>
1459a6905:     	movq	0x20(%rsp), %rcx
1459a690a:     	movq	%r13, 0x8(%rcx)
1459a690e:     	movq	%r14, 0x10(%rcx)
1459a6912:     	movl	$0x1, %eax
1459a6917:     	jmp	0x1459a692d <.text+0x59a592d>
1459a6919:     	movq	%r15, 0x10(%rdi)
1459a691d:     	xorl	%eax, %eax
1459a691f:     	movq	0x20(%rsp), %rcx
1459a6924:     	jmp	0x1459a692d <.text+0x59a592d>
1459a6926:     	movq	0x20(%rsp), %rcx
1459a692b:     	xorl	%eax, %eax
1459a692d:     	movq	%rax, (%rcx)
1459a6930:     	addq	$0x28, %rsp
1459a6934:     	popq	%rbx
1459a6935:     	popq	%rbp
1459a6936:     	popq	%rdi
1459a6937:     	popq	%rsi
1459a6938:     	popq	%r12
1459a693a:     	popq	%r13
1459a693c:     	popq	%r14
1459a693e:     	popq	%r15
1459a6940:     	retq
1459a6941:     	leaq	0x180e740(%rip), %r9    # 0x1471b5088
1459a6948:     	movl	$0x4, %r8d
1459a694e:     	xorl	%ecx, %ecx
1459a6950:     	movq	%rbx, %rdx
1459a6953:     	callq	0x145d699f0 <.text+0x5d689f0>
1459a6958:     	ud2


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f9790:     	pushq	%rbp
1454f9791:     	pushq	%r15
1454f9793:     	pushq	%r14
1454f9795:     	pushq	%r13
1454f9797:     	pushq	%r12
1454f9799:     	pushq	%rsi
1454f979a:     	pushq	%rdi
1454f979b:     	pushq	%rbx
1454f979c:     	subq	$0x58, %rsp
1454f97a0:     	leaq	0x50(%rsp), %rbp
1454f97a5:     	movq	$-0x2, (%rbp)
1454f97ad:     	movq	%r8, %r14
1454f97b0:     	movl	0x950(%rcx), %ebx
1454f97b6:     	incl	%ebx
1454f97b8:     	movl	%ebx, 0x950(%rcx)
1454f97be:     	movq	0x3e8(%rcx), %rax
1454f97c5:     	movq	$0x1, 0x10(%rcx)
1454f97cd:     	movq	%rax, 0x18(%rcx)
1454f97d1:     	testq	%r8, %r8
1454f97d4:     	jns	0x1454f97e6 <.text+0x54f87e6>
1454f97d6:     	xorl	%r13d, %r13d
1454f97d9:     	movq	%r13, %rcx
1454f97dc:     	movq	%r14, %rdx
1454f97df:     	callq	0x14590379b <.text+0x590279b>
1454f97e4:     	ud2
1454f97e6:     	movq	%r9, %rdi
1454f97e9:     	movq	%rdx, %r15
1454f97ec:     	movq	%rcx, %rsi
1454f97ef:     	je	0x1454f9928 <.text+0x54f8928>
1454f97f5:     	callq	0x140002200 <.text+0x1200>
1454f97fa:     	movl	$0x1, %r13d
1454f9800:     	movl	$0x1, %edx
1454f9805:     	movq	%r14, %rcx
1454f9808:     	callq	0x1400021c0 <.text+0x11c0>
1454f980d:     	testq	%rax, %rax
1454f9810:     	je	0x1454f97d9 <.text+0x54f87d9>
1454f9812:     	movq	%rax, %r12
1454f9815:     	movq	%rax, %rcx
1454f9818:     	movq	%r15, %rdx
1454f981b:     	movq	%r14, %r8
1454f981e:     	callq	0x1457731ed <.text+0x57721ed>
1454f9823:     	movq	0x858(%rsi), %rdx
1454f982a:     	testq	%rdx, %rdx
1454f982d:     	je	0x1454f9841 <.text+0x54f8841>
1454f982f:     	movq	0x860(%rsi), %rcx
1454f9836:     	movl	$0x1, %r8d
1454f983c:     	callq	0x1400021d0 <.text+0x11d0>
1454f9841:     	movl	%ebx, 0x850(%rsi)
1454f9847:     	movq	%r14, 0x858(%rsi)
1454f984e:     	movq	%r12, 0x860(%rsi)
1454f9855:     	movq	%r14, 0x868(%rsi)
1454f985c:     	leaq	0x550(%rsi), %r12
1454f9863:     	leaq	-0x20(%rbp), %rcx
1454f9867:     	movl	%ebx, %edx
1454f9869:     	movq	%r15, %r8
1454f986c:     	movq	%r14, %r9
1454f986f:     	callq	0x14545e340 <.text+0x545d340>
1454f9874:     	movq	0x560(%rsi), %r14
1454f987b:     	cmpq	0x550(%rsi), %r14
1454f9882:     	jne	0x1454f988d <.text+0x54f888d>
1454f9884:     	movq	%r12, %rcx
1454f9887:     	callq	0x145774710 <.text+0x5773710>
1454f988c:     	nop
1454f988d:     	movq	0x70(%rbp), %rax
1454f9891:     	movq	0x558(%rsi), %rcx
1454f9898:     	movq	%r14, %rdx
1454f989b:     	shlq	$0x5, %rdx
1454f989f:     	movups	-0x20(%rbp), %xmm0
1454f98a3:     	movups	-0x10(%rbp), %xmm1
1454f98a7:     	movups	%xmm1, 0x10(%rcx,%rdx)
1454f98ac:     	movups	%xmm0, (%rcx,%rdx)
1454f98b0:     	incq	%r14
1454f98b3:     	movq	%r14, 0x560(%rsi)
1454f98ba:     	movq	0x3e8(%rsi), %rdx
1454f98c1:     	movq	%rax, 0x20(%rsp)
1454f98c6:     	leaq	-0x20(%rbp), %rcx
1454f98ca:     	movl	%ebx, %r8d
1454f98cd:     	movq	%rdi, %r9
1454f98d0:     	callq	0x14545cf50 <.text+0x545bf50>
1454f98d5:     	movq	0x560(%rsi), %rdi
1454f98dc:     	cmpq	0x550(%rsi), %rdi
1454f98e3:     	jne	0x1454f98ee <.text+0x54f88ee>
1454f98e5:     	movq	%r12, %rcx
1454f98e8:     	callq	0x145774710 <.text+0x5773710>
1454f98ed:     	nop
1454f98ee:     	movq	0x558(%rsi), %rax
1454f98f5:     	movq	%rdi, %rcx
1454f98f8:     	shlq	$0x5, %rcx
1454f98fc:     	movups	-0x20(%rbp), %xmm0
1454f9900:     	movups	-0x10(%rbp), %xmm1
1454f9904:     	movups	%xmm1, 0x10(%rax,%rcx)
1454f9909:     	movups	%xmm0, (%rax,%rcx)
1454f990d:     	incq	%rdi
1454f9910:     	movq	%rdi, 0x560(%rsi)
1454f9917:     	addq	$0x58, %rsp
1454f991b:     	popq	%rbx
1454f991c:     	popq	%rdi
1454f991d:     	popq	%rsi
1454f991e:     	popq	%r12
1454f9920:     	popq	%r13
1454f9922:     	popq	%r14
1454f9924:     	popq	%r15
1454f9926:     	popq	%rbp
1454f9927:     	retq
1454f9928:     	movl	$0x1, %r12d
1454f992e:     	movq	0x858(%rsi), %rdx
1454f9935:     	testq	%rdx, %rdx
1454f9938:     	jne	0x1454f982f <.text+0x54f882f>
1454f993e:     	jmp	0x1454f9841 <.text+0x54f8841>

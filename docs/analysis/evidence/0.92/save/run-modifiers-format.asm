
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454248a0:     	pushq	%rbp
1454248a1:     	pushq	%r14
1454248a3:     	pushq	%rsi
1454248a4:     	pushq	%rdi
1454248a5:     	pushq	%rbx
1454248a6:     	subq	$0x60, %rsp
1454248aa:     	leaq	0x60(%rsp), %rbp
1454248af:     	movq	$-0x2, -0x8(%rbp)
1454248b7:     	movq	%rcx, %rsi
1454248ba:     	leaq	0x8(%rdx), %r8
1454248be:     	leaq	-0x20(%rbp), %rcx
1454248c2:     	callq	0x1454e9b00 <.text+0x54e8b00>
1454248c7:     	movq	-0x18(%rbp), %rdi
1454248cb:     	movq	-0x10(%rbp), %rbx
1454248cf:     	movq	$0x1, 0x20(%rsp)
1454248d8:     	leaq	0x1470c69(%rip), %r9    # 0x146895548
1454248df:     	leaq	-0x38(%rbp), %rcx
1454248e3:     	movq	%rdi, %rdx
1454248e6:     	movq	%rbx, %r8
1454248e9:     	callq	0x145422a70 <.text+0x5421a70>
1454248ee:     	nop
1454248ef:     	movq	-0x28(%rbp), %rax
1454248f3:     	movq	%rax, 0x10(%rsi)
1454248f7:     	movups	-0x38(%rbp), %xmm0
1454248fb:     	movups	%xmm0, (%rsi)
1454248fe:     	testq	%rbx, %rbx
145424901:     	je	0x145424932 <.text+0x5423932>
145424903:     	leaq	0x8(%rdi), %r14
145424907:     	jmp	0x145424919 <.text+0x5423919>
145424909:     	nopl	(%rax)
145424910:     	addq	$0x18, %r14
145424914:     	decq	%rbx
145424917:     	je	0x145424932 <.text+0x5423932>
145424919:     	movq	-0x8(%r14), %rdx
14542491d:     	testq	%rdx, %rdx
145424920:     	je	0x145424910 <.text+0x5423910>
145424922:     	movq	(%r14), %rcx
145424925:     	movl	$0x1, %r8d
14542492b:     	callq	0x1400021d0 <.text+0x11d0>
145424930:     	jmp	0x145424910 <.text+0x5423910>
145424932:     	movq	-0x20(%rbp), %rax
145424936:     	testq	%rax, %rax
145424939:     	je	0x145424951 <.text+0x5423951>
14542493b:     	shlq	$0x3, %rax
14542493f:     	leaq	(%rax,%rax,2), %rdx
145424943:     	movl	$0x8, %r8d
145424949:     	movq	%rdi, %rcx
14542494c:     	callq	0x1400021d0 <.text+0x11d0>
145424951:     	movq	%rsi, %rax
145424954:     	addq	$0x60, %rsp
145424958:     	popq	%rbx
145424959:     	popq	%rdi
14542495a:     	popq	%rsi
14542495b:     	popq	%r14
14542495d:     	popq	%rbp
14542495e:     	retq


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145516740:     	pushq	%rsi
145516741:     	pushq	%rdi
145516742:     	pushq	%rbx
145516743:     	subq	$0x20, %rsp
145516747:     	movq	0x10(%rcx), %r8
14551674b:     	movq	(%rcx), %r10
14551674e:     	movq	0x8(%rcx), %r9
145516752:     	movq	0x8(%rdx), %r11
145516756:     	movl	$0x88, %esi
14551675b:     	addq	(%rdx), %rsi
14551675e:     	movq	%r9, %rdi
145516761:     	negq	%rdi
145516764:     	nopw	%cs:(%rax,%rax)
145516770:     	cmpq	%r8, %r9
145516773:     	jae	0x1455167b6 <.text+0x55157b6>
145516775:     	leaq	0x1(%r9), %rbx
145516779:     	movq	%rbx, 0x8(%rcx)
14551677d:     	movq	(%r10), %rdx
145516780:     	leaq	(%rdi,%rdx), %rax
145516784:     	cmpq	%rdx, %r9
145516787:     	cmovaq	%r9, %rax
14551678b:     	cmpq	$0x4, %rax
14551678f:     	ja	0x1455167d6 <.text+0x55157d6>
145516791:     	movq	(%r11), %r9
145516794:     	cmpq	$0x8, %r9
145516798:     	jae	0x1455167c0 <.text+0x55157c0>
14551679a:     	shlq	$0x5, %rax
14551679e:     	addq	%rsi, %rax
1455167a1:     	movl	(%rax,%r9,4), %edx
1455167a5:     	decq	%rdi
1455167a8:     	movq	%rbx, %r9
1455167ab:     	testl	%edx, %edx
1455167ad:     	je	0x145516770 <.text+0x5515770>
1455167af:     	movl	$0x1, %eax
1455167b4:     	jmp	0x1455167b8 <.text+0x55157b8>
1455167b6:     	xorl	%eax, %eax
1455167b8:     	addq	$0x20, %rsp
1455167bc:     	popq	%rbx
1455167bd:     	popq	%rdi
1455167be:     	popq	%rsi
1455167bf:     	retq
1455167c0:     	leaq	0x17d3079(%rip), %r8    # 0x146ce9840
1455167c7:     	movl	$0x8, %edx
1455167cc:     	movq	%r9, %rcx
1455167cf:     	callq	0x1458e75b3 <.text+0x58e65b3>
1455167d4:     	ud2
1455167d6:     	leaq	0x17d3063(%rip), %r8    # 0x146ce9840
1455167dd:     	movl	$0x5, %edx
1455167e2:     	movq	%rax, %rcx
1455167e5:     	callq	0x1458e75b3 <.text+0x58e65b3>
1455167ea:     	ud2


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145497900:     	pushq	%r15
145497902:     	pushq	%r14
145497904:     	pushq	%r12
145497906:     	pushq	%rsi
145497907:     	pushq	%rdi
145497908:     	pushq	%rbp
145497909:     	pushq	%rbx
14549790a:     	subq	$0x20, %rsp
14549790e:     	movq	%rcx, %rax
145497911:     	movq	(%rcx), %rcx
145497914:     	movq	(%rcx), %rcx
145497917:     	shlq	$0x3, %rcx
14549791b:     	movq	0x10(%rax), %rdx
14549791f:     	cmpq	%rdx, %rcx
145497922:     	jae	0x145497ac2 <.text+0x5496ac2>
145497928:     	movq	%rcx, %r14
14549792b:     	orq	$0x1, %r14
14549792f:     	cmpq	%rdx, %r14
145497932:     	jae	0x145497a59 <.text+0x5496a59>
145497938:     	movq	%rcx, %rbx
14549793b:     	orq	$0x2, %rbx
14549793f:     	cmpq	%rdx, %rbx
145497942:     	jae	0x145497a6a <.text+0x5496a6a>
145497948:     	movq	%rcx, %rdi
14549794b:     	orq	$0x3, %rdi
14549794f:     	cmpq	%rdx, %rdi
145497952:     	jae	0x145497a7b <.text+0x5496a7b>
145497958:     	movq	%rcx, %r11
14549795b:     	orq	$0x4, %r11
14549795f:     	cmpq	%rdx, %r11
145497962:     	jae	0x145497a8c <.text+0x5496a8c>
145497968:     	movq	%rcx, %r9
14549796b:     	orq	$0x5, %r9
14549796f:     	cmpq	%rdx, %r9
145497972:     	jae	0x145497a9d <.text+0x5496a9d>
145497978:     	movq	%rcx, %r10
14549797b:     	orq	$0x6, %r10
14549797f:     	cmpq	%rdx, %r10
145497982:     	jae	0x145497aae <.text+0x5496aae>
145497988:     	movq	%rcx, %r8
14549798b:     	orq	$0x7, %r8
14549798f:     	cmpq	%rdx, %r8
145497992:     	jae	0x145497abf <.text+0x5496abf>
145497998:     	movq	0x8(%rax), %rsi
14549799c:     	shlq	$0x4, %r10
1454979a0:     	movq	%rcx, %rax
1454979a3:     	shlq	$0x4, %rax
1454979a7:     	xorl	%edx, %edx
1454979a9:     	cmpq	$0x20, %rcx
1454979ad:     	setb	%dl
1454979b0:     	leal	0x8(%rdx), %ecx
1454979b3:     	xorl	%ebp, %ebp
1454979b5:     	cmpb	$0x0, (%rsi,%rax)
1454979b9:     	movl	$0x0, %r15d
1454979bf:     	cmovnel	%ecx, %r15d
1454979c3:     	shlq	$0x4, %r14
1454979c7:     	movl	%ecx, %r12d
1454979ca:     	shll	$0x4, %r12d
1454979ce:     	cmpb	$0x0, (%rsi,%r14)
1454979d3:     	cmovel	%ebp, %r12d
1454979d7:     	shlq	$0x4, %rbx
1454979db:     	movl	%ecx, %r14d
1454979de:     	shll	$0x8, %r14d
1454979e2:     	cmpb	$0x0, (%rsi,%rbx)
1454979e6:     	cmovel	%ebp, %r14d
1454979ea:     	shlq	$0x4, %rdi
1454979ee:     	movl	%ecx, %ebx
1454979f0:     	shll	$0xc, %ebx
1454979f3:     	cmpb	$0x0, (%rsi,%rdi)
1454979f7:     	cmovel	%ebp, %ebx
1454979fa:     	shlq	$0x4, %r11
1454979fe:     	movl	%ecx, %edi
145497a00:     	shll	$0x10, %edi
145497a03:     	cmpb	$0x0, (%rsi,%r11)
145497a08:     	cmovel	%ebp, %edi
145497a0b:     	shlq	$0x4, %r9
145497a0f:     	movl	%ecx, %eax
145497a11:     	shll	$0x14, %eax
145497a14:     	cmpb	$0x0, (%rsi,%r9)
145497a19:     	cmovel	%ebp, %eax
145497a1c:     	shll	$0x18, %ecx
145497a1f:     	cmpb	$0x0, (%rsi,%r10)
145497a24:     	cmovel	%ebp, %ecx
145497a27:     	shlq	$0x4, %r8
145497a2b:     	orl	$-0x8, %edx
145497a2e:     	shll	$0x1c, %edx
145497a31:     	cmpb	$0x0, (%rsi,%r8)
145497a36:     	cmovel	%ebp, %edx
145497a39:     	orl	%r15d, %ecx
145497a3c:     	orl	%r12d, %ecx
145497a3f:     	orl	%r14d, %ecx
145497a42:     	orl	%ebx, %ecx
145497a44:     	orl	%edi, %eax
145497a46:     	orl	%edx, %eax
145497a48:     	orl	%ecx, %eax
145497a4a:     	addq	$0x20, %rsp
145497a4e:     	popq	%rbx
145497a4f:     	popq	%rbp
145497a50:     	popq	%rdi
145497a51:     	popq	%rsi
145497a52:     	popq	%r12
145497a54:     	popq	%r14
145497a56:     	popq	%r15
145497a58:     	retq

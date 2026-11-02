
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145531920:     	pushq	%rbp
145531921:     	pushq	%r15
145531923:     	pushq	%r14
145531925:     	pushq	%r13
145531927:     	pushq	%r12
145531929:     	pushq	%rsi
14553192a:     	pushq	%rdi
14553192b:     	pushq	%rbx
14553192c:     	subq	$0x58, %rsp
145531930:     	leaq	0x50(%rsp), %rbp
145531935:     	movq	$-0x2, (%rbp)
14553193d:     	movq	%rcx, %rsi
145531940:     	movq	(%rdx), %rax
145531943:     	movq	0x8(%rdx), %r14
145531947:     	cmpq	%r14, %rax
14553194a:     	je	0x145531976 <.text+0x5530976>
14553194c:     	movq	0x10(%rdx), %rbx
145531950:     	movq	0x18(%rdx), %r12
145531954:     	movss	(%rbx), %xmm0
145531958:     	nopl	(%rax,%rax)
145531960:     	ucomiss	0x14(%rax), %xmm0
145531964:     	jae	0x145531992 <.text+0x5530992>
145531966:     	cmpq	$0x0, (%r12)
14553196b:     	je	0x145531992 <.text+0x5530992>
14553196d:     	addq	$0x20, %rax
145531971:     	cmpq	%r14, %rax
145531974:     	jne	0x145531960 <.text+0x5530960>
145531976:     	movq	$0x0, (%rsi)
14553197d:     	movq	$0x8, 0x8(%rsi)
145531985:     	movq	$0x0, 0x10(%rsi)
14553198d:     	jmp	0x145531a7b <.text+0x5530a7b>
145531992:     	leaq	0x20(%rax), %r13
145531996:     	movq	%r13, (%rdx)
145531999:     	movq	(%rax), %rdi
14553199c:     	callq	0x140002200 <.text+0x1200>
1455319a1:     	movl	$0x20, %ecx
1455319a6:     	movl	$0x8, %edx
1455319ab:     	callq	0x1400021c0 <.text+0x11c0>
1455319b0:     	testq	%rax, %rax
1455319b3:     	je	0x145531a8f <.text+0x5530a8f>
1455319b9:     	movq	%rdi, (%rax)
1455319bc:     	movq	$0x4, -0x18(%rbp)
1455319c4:     	movq	%rax, -0x10(%rbp)
1455319c8:     	movq	$0x1, -0x8(%rbp)
1455319d0:     	cmpq	%r14, %r13
1455319d3:     	je	0x145531a64 <.text+0x5530a64>
1455319d9:     	movl	$0x1, %edi
1455319de:     	leaq	-0x18(%rbp), %rcx
1455319e2:     	movq	%rbx, -0x20(%rbp)
1455319e6:     	jmp	0x145531a08 <.text+0x5530a08>
1455319e8:     	nopl	(%rax,%rax)
1455319f0:     	addq	$0x20, %r13
1455319f4:     	movq	%rbx, (%rax,%rdi,8)
1455319f8:     	incq	%rdi
1455319fb:     	movq	%rdi, -0x8(%rbp)
1455319ff:     	cmpq	%r14, %r13
145531a02:     	movq	-0x20(%rbp), %rbx
145531a06:     	je	0x145531a64 <.text+0x5530a64>
145531a08:     	movss	(%rbx), %xmm0
145531a0c:     	nopl	(%rax)
145531a10:     	ucomiss	0x14(%r13), %xmm0
145531a15:     	jae	0x145531a30 <.text+0x5530a30>
145531a17:     	cmpq	$0x0, (%r12)
145531a1c:     	je	0x145531a30 <.text+0x5530a30>
145531a1e:     	addq	$0x20, %r13
145531a22:     	cmpq	%r14, %r13
145531a25:     	jne	0x145531a10 <.text+0x5530a10>
145531a27:     	jmp	0x145531a64 <.text+0x5530a64>
145531a29:     	nopl	(%rax)
145531a30:     	movq	(%r13), %rbx
145531a34:     	cmpq	-0x18(%rbp), %rdi
145531a38:     	jne	0x1455319f0 <.text+0x55309f0>
145531a3a:     	movq	$0x8, 0x20(%rsp)
145531a43:     	movl	$0x1, %r8d
145531a49:     	movl	$0x8, %r9d
145531a4f:     	movq	%rcx, %r15
145531a52:     	movq	%rdi, %rdx
145531a55:     	callq	0x145757d40 <.text+0x5756d40>
145531a5a:     	nop
145531a5b:     	movq	-0x10(%rbp), %rax
145531a5f:     	movq	%r15, %rcx
145531a62:     	jmp	0x1455319f0 <.text+0x55309f0>
145531a64:     	movq	-0x8(%rbp), %rax
145531a68:     	movq	%rax, 0x10(%rsi)
145531a6c:     	movq	-0x18(%rbp), %rax
145531a70:     	movq	%rax, (%rsi)
145531a73:     	movq	-0x10(%rbp), %rax
145531a77:     	movq	%rax, 0x8(%rsi)
145531a7b:     	movq	%rsi, %rax
145531a7e:     	addq	$0x58, %rsp
145531a82:     	popq	%rbx
145531a83:     	popq	%rdi
145531a84:     	popq	%rsi
145531a85:     	popq	%r12
145531a87:     	popq	%r13
145531a89:     	popq	%r14
145531a8b:     	popq	%r15
145531a8d:     	popq	%rbp
145531a8e:     	retq
145531a8f:     	movl	$0x8, %ecx
145531a94:     	movl	$0x20, %edx
145531a99:     	callq	0x1458e721b <.text+0x58e621b>
145531a9e:     	ud2

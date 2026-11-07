
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140122a63:     	movq	0x390(%rbp), %r15
140122a6a:     	cmpb	$0x1, (%r15)
140122a6e:     	jne	0x140122a92 <.text+0x121a92>
140122a70:     	movl	0x1(%r15), %eax
140122a74:     	movl	0x4(%r15), %ecx
140122a78:     	movl	%ecx, 0x3bb(%rbp)
140122a7e:     	movl	%eax, 0x3b8(%rbp)
140122a84:     	movq	0x8(%r15), %rsi
140122a88:     	movzbl	0x10(%r15), %edi
140122a8d:     	movb	$0x1, %r14b
140122a90:     	jmp	0x140122aa3 <.text+0x121aa3>
140122a92:     	movq	0x8(%r15), %rsi
140122a96:     	lock
140122a97:     	incq	(%rsi)
140122a9a:     	jle	0x140122c99 <.text+0x121c99>
140122aa0:     	xorl	%r14d, %r14d
140122aa3:     	movups	0x5c87caa(%rip), %xmm0  # 0x145daa754
140122aaa:     	movups	%xmm0, 0x37c(%rbp)
140122ab1:     	movl	$0x3f800000, 0x38c(%rbp) # imm = 0x3F800000
140122abb:     	leaq	-0x50(%rbp), %rcx
140122abf:     	leaq	0x5c872fa(%rip), %rdx   # 0x145da9dc0
140122ac6:     	movl	$0x180, %r8d            # imm = 0x180
140122acc:     	callq	0x145bc977b <.text+0x5bc877b>
140122ad1:     	movq	0x398(%rbp), %r12
140122ad8:     	movq	(%r12), %rbx
140122adc:     	addq	$0x8, %r12
140122ae0:     	movq	$0x0, 0x168(%rbp)
140122aeb:     	movq	$0x1, 0x170(%rbp)
140122af6:     	xorps	%xmm0, %xmm0
140122af9:     	movups	%xmm0, 0x178(%rbp)
140122b00:     	movq	$0x4, 0x188(%rbp)
140122b0b:     	movq	$0x0, 0x190(%rbp)
140122b16:     	movb	%r14b, 0x198(%rbp)
140122b1d:     	movl	0x3b8(%rbp), %eax
140122b23:     	movl	0x3bb(%rbp), %ecx
140122b29:     	movl	%eax, 0x199(%rbp)
140122b2f:     	movl	%ecx, 0x19c(%rbp)
140122b35:     	movq	%rsi, 0x1a0(%rbp)
140122b3c:     	movq	%rdi, 0x1a8(%rbp)
140122b43:     	movl	$0x41700000, 0x1b0(%rbp) # imm = 0x41700000
140122b4d:     	movw	$0x190, 0x1b4(%rbp)     # imm = 0x190
140122b56:     	movb	$0x1, 0x1b6(%rbp)
140122b5d:     	movups	0x37b(%rbp), %xmm0
140122b64:     	movups	%xmm0, 0x1b7(%rbp)
140122b6b:     	movq	0x388(%rbp), %rax
140122b72:     	movq	%rax, 0x1c4(%rbp)
140122b79:     	movl	0x5c4b769(%rip), %eax   # 0x145d6e2e8
140122b7f:     	movl	%eax, 0x1dc(%rbp)
140122b85:     	movups	0x5c4b74c(%rip), %xmm0  # 0x145d6e2d8
140122b8c:     	movups	%xmm0, 0x1cc(%rbp)
140122b93:     	movsd	0x5c4a635(%rip), %xmm0  # 0x145d6d1d0
140122b9b:     	movsd	%xmm0, 0x1e0(%rbp)
140122ba3:     	movw	$0x1, 0x1e8(%rbp)
140122bac:     	leaq	0x1ea(%rbp), %rcx
140122bb3:     	leaq	-0x56(%rbp), %rdx
140122bb7:     	movl	$0x186, %r8d            # imm = 0x186
140122bbd:     	callq	0x145bc977b <.text+0x5bc877b>

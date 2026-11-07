
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401abbc0:     	pushq	%rbp
1401abbc1:     	pushq	%r15
1401abbc3:     	pushq	%r14
1401abbc5:     	pushq	%r12
1401abbc7:     	pushq	%rsi
1401abbc8:     	pushq	%rdi
1401abbc9:     	pushq	%rbx
1401abbca:     	subq	$0x820, %rsp            # imm = 0x820
1401abbd1:     	leaq	0x80(%rsp), %rbp
1401abbd9:     	movq	$-0x2, 0x798(%rbp)
1401abbe4:     	movq	%rcx, %rsi
1401abbe7:     	movb	$0x1, 0x797(%rbp)
1401abbee:     	leaq	0x728(%rbp), %rcx
1401abbf5:     	movq	%rdx, 0x788(%rbp)
1401abbfc:     	callq	0x1401adcf0 <.text+0x1accf0>
1401abc01:     	nop
1401abc02:     	cmpq	$-0x1, 0x728(%rbp)
1401abc0a:     	je	0x1401abd76 <.text+0x1aad76>
1401abc10:     	callq	0x140002200 <.text+0x1200>
1401abc15:     	movl	$0x120, %ecx            # imm = 0x120
1401abc1a:     	movl	$0x8, %edx
1401abc1f:     	callq	0x1400021c0 <.text+0x11c0>
1401abc24:     	testq	%rax, %rax
1401abc27:     	je	0x1401abdae <.text+0x1aadae>
1401abc2d:     	movq	%rax, %rdi
1401abc30:     	movq	0x768(%rbp), %rax
1401abc37:     	movq	%rax, 0x40(%rdi)
1401abc3b:     	movups	0x728(%rbp), %xmm0
1401abc42:     	movups	0x738(%rbp), %xmm1
1401abc49:     	movups	0x748(%rbp), %xmm2
1401abc50:     	movups	0x758(%rbp), %xmm3
1401abc57:     	movups	%xmm3, 0x30(%rdi)
1401abc5b:     	movups	%xmm2, 0x20(%rdi)
1401abc5f:     	movups	%xmm1, 0x10(%rdi)
1401abc63:     	movups	%xmm0, (%rdi)
1401abc66:     	movq	$0x4, 0x770(%rbp)
1401abc71:     	movq	%rdi, 0x778(%rbp)
1401abc78:     	movq	$0x1, 0x780(%rbp)
1401abc83:     	leaq	-0x50(%rbp), %rbx
1401abc87:     	movl	$0x730, %r8d            # imm = 0x730
1401abc8d:     	movq	%rbx, %rcx
1401abc90:     	movq	0x788(%rbp), %rdx
1401abc97:     	callq	0x1457731ed <.text+0x57721ed>
1401abc9c:     	movl	$0x1, %r14d
1401abca2:     	leaq	0x6e0(%rbp), %r15
1401abca9:     	leaq	0x770(%rbp), %r12
1401abcb0:     	jmp	0x1401abd10 <.text+0x1aad10>
1401abcb2:     	nopw	%cs:(%rax,%rax)
1401abcc0:     	movq	0x778(%rbp), %rdi
1401abcc7:     	leaq	(%r14,%r14,8), %rax
1401abccb:     	movq	0x720(%rbp), %rcx
1401abcd2:     	movq	%rcx, 0x40(%rdi,%rax,8)
1401abcd7:     	movups	0x6e0(%rbp), %xmm0
1401abcde:     	movups	0x6f0(%rbp), %xmm1
1401abce5:     	movups	0x700(%rbp), %xmm2
1401abcec:     	movups	0x710(%rbp), %xmm3
1401abcf3:     	movups	%xmm3, 0x30(%rdi,%rax,8)
1401abcf8:     	movups	%xmm2, 0x20(%rdi,%rax,8)
1401abcfd:     	movups	%xmm1, 0x10(%rdi,%rax,8)
1401abd02:     	movups	%xmm0, (%rdi,%rax,8)
1401abd06:     	incq	%r14
1401abd09:     	movq	%r14, 0x780(%rbp)
1401abd10:     	movq	%r15, %rcx
1401abd13:     	movq	%rbx, %rdx
1401abd16:     	callq	0x1401adcf0 <.text+0x1accf0>
1401abd1b:     	nop
1401abd1c:     	cmpq	$-0x1, 0x6e0(%rbp)
1401abd24:     	je	0x1401abd55 <.text+0x1aad55>
1401abd26:     	cmpq	0x770(%rbp), %r14
1401abd2d:     	jne	0x1401abcc7 <.text+0x1aacc7>
1401abd2f:     	movq	$0x48, 0x20(%rsp)
1401abd38:     	movl	$0x1, %r8d
1401abd3e:     	movl	$0x8, %r9d
1401abd44:     	movq	%r12, %rcx
1401abd47:     	movq	%r14, %rdx
1401abd4a:     	callq	0x1457744b0 <.text+0x57734b0>
1401abd4f:     	nop
1401abd50:     	jmp	0x1401abcc0 <.text+0x1aacc0>
1401abd55:     	leaq	-0x50(%rbp), %rcx
1401abd59:     	callq	0x140198060 <.text+0x197060>
1401abd5e:     	nop
1401abd5f:     	movq	0x780(%rbp), %rax
1401abd66:     	movq	%rax, 0x10(%rsi)
1401abd6a:     	movups	0x770(%rbp), %xmm0
1401abd71:     	movups	%xmm0, (%rsi)
1401abd74:     	jmp	0x1401abd99 <.text+0x1aad99>
1401abd76:     	movq	$0x0, (%rsi)
1401abd7d:     	movq	$0x8, 0x8(%rsi)
1401abd85:     	movq	$0x0, 0x10(%rsi)
1401abd8d:     	movq	0x788(%rbp), %rcx
1401abd94:     	callq	0x140198060 <.text+0x197060>
1401abd99:     	movq	%rsi, %rax
1401abd9c:     	addq	$0x820, %rsp            # imm = 0x820
1401abda3:     	popq	%rbx
1401abda4:     	popq	%rdi
1401abda5:     	popq	%rsi
1401abda6:     	popq	%r12
1401abda8:     	popq	%r14
1401abdaa:     	popq	%r15
1401abdac:     	popq	%rbp
1401abdad:     	retq
1401abdae:     	movl	$0x8, %ecx
1401abdb3:     	movl	$0x120, %edx            # imm = 0x120
1401abdb8:     	callq	0x14590379b <.text+0x590279b>
1401abdbd:     	nop
1401abdbe:     	ud2


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458b7e58:     	addq	$0x50, %rdx
1458b7e5c:     	movq	%rdx, %rbx
1458b7e5f:     	movzbl	(%rbx), %ebx
1458b7e62:     	callq	0x140002200 <.text+0x1200>
1458b7e67:     	movl	$0x6, %ecx
1458b7e6c:     	movl	$0x1, %edx
1458b7e71:     	callq	0x1400021c0 <.text+0x11c0>
1458b7e76:     	testq	%rax, %rax
1458b7e79:     	je	0x1458b7ee9 <.text+0x58b6ee9>
1458b7e7b:     	movw	$0x7265, 0x4(%rax)      # imm = 0x7265
1458b7e81:     	movl	$0x74736554, (%rax)     # imm = 0x74736554
1458b7e87:     	movq	-0x28(%rbp), %rcx
1458b7e8b:     	movzbl	0x8c(%rcx), %ecx
1458b7e92:     	movq	-0x30(%rbp), %rdx
1458b7e96:     	movb	$0x0, 0x37(%rdx)
1458b7e9a:     	movl	$0x0, 0x33(%rdx)
1458b7ea1:     	movq	$0xffffff, 0x18(%rdx)   # imm = 0xFFFFFF
1458b7ea9:     	movq	$0x6, (%rdx)
1458b7eb0:     	movq	%rax, 0x8(%rdx)
1458b7eb4:     	movq	$0x6, 0x10(%rdx)
1458b7ebc:     	movb	%bl, 0x30(%rdx)
1458b7ebf:     	movb	%cl, 0x31(%rdx)
1458b7ec2:     	movb	$0x0, 0x32(%rdx)
1458b7ec6:     	movss	0x5001b2(%rip), %xmm0   # 0x145db8080
1458b7ece:     	movups	%xmm0, 0x20(%rdx)
1458b7ed2:     	movq	%rdx, %rax
1458b7ed5:     	addq	$0x88, %rsp
1458b7edc:     	popq	%rbx
1458b7edd:     	popq	%rdi
1458b7ede:     	popq	%rsi
1458b7edf:     	popq	%r12
1458b7ee1:     	popq	%r13
1458b7ee3:     	popq	%r14
1458b7ee5:     	popq	%r15
1458b7ee7:     	popq	%rbp
1458b7ee8:     	retq

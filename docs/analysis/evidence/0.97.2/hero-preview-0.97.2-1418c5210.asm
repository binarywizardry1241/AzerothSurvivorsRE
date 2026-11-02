
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1418c5210:     	pushq	%r15
1418c5212:     	pushq	%r14
1418c5214:     	pushq	%rsi
1418c5215:     	pushq	%rdi
1418c5216:     	pushq	%rbx
1418c5217:     	subq	$0x170, %rsp            # imm = 0x170
1418c521e:     	movq	%r9, %rdi
1418c5221:     	movq	%r8, %rbx
1418c5224:     	movq	%rdx, %r14
1418c5227:     	movq	%rcx, %rsi
1418c522a:     	leaq	0x20(%rsp), %r15
1418c522f:     	movl	$0x150, %r8d            # imm = 0x150
1418c5235:     	movq	%r15, %rcx
1418c5238:     	xorl	%edx, %edx
1418c523a:     	callq	0x145756dcb <.text+0x5755dcb>
1418c523f:     	movq	%r15, %rcx
1418c5242:     	movq	%r14, %rdx
1418c5245:     	movq	%rbx, %r8
1418c5248:     	movq	%rdi, %r9
1418c524b:     	callq	0x1416af7b0 <.text+0x16ae7b0>
1418c5250:     	movups	0x43397d1(%rip), %xmm0  # 0x145bfea28
1418c5257:     	movups	%xmm0, 0x50(%rsp)
1418c525c:     	movups	0x43397d5(%rip), %xmm0  # 0x145bfea38
1418c5263:     	movups	%xmm0, 0x60(%rsp)
1418c5268:     	movups	0x43397d9(%rip), %xmm0  # 0x145bfea48
1418c526f:     	movups	%xmm0, 0x70(%rsp)
1418c5274:     	leaq	0x80(%rsi), %rcx
1418c527b:     	movl	$0x150, %r8d            # imm = 0x150
1418c5281:     	movq	%r15, %rdx
1418c5284:     	callq	0x145756ddd <.text+0x5755ddd>
1418c5289:     	movq	$0x0, 0x1d0(%rsi)
1418c5294:     	movq	$0x4, 0x1d8(%rsi)
1418c529f:     	movq	$0x0, 0x1e0(%rsi)
1418c52aa:     	xorps	%xmm0, %xmm0
1418c52ad:     	movaps	%xmm0, (%rsi)
1418c52b0:     	movq	%rsi, %rax
1418c52b3:     	addq	$0x170, %rsp            # imm = 0x170
1418c52ba:     	popq	%rbx
1418c52bb:     	popq	%rdi
1418c52bc:     	popq	%rsi
1418c52bd:     	popq	%r14
1418c52bf:     	popq	%r15
1418c52c1:     	retq

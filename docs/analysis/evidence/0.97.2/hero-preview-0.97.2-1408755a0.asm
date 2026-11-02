
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1408755a0:     	pushq	%rbp
1408755a1:     	pushq	%r14
1408755a3:     	pushq	%rsi
1408755a4:     	pushq	%rdi
1408755a5:     	pushq	%rbx
1408755a6:     	subq	$0x190, %rsp            # imm = 0x190
1408755ad:     	leaq	0x80(%rsp), %rbp
1408755b5:     	movq	$-0x2, 0x108(%rbp)
1408755c0:     	movq	%r8, %rdi
1408755c3:     	movq	%rcx, %rsi
1408755c6:     	cmpq	$-0x1, 0x108(%rdx)
1408755ce:     	je	0x140875612 <.text+0x874612>
1408755d0:     	movq	0x5a0(%rdi), %rax
1408755d7:     	movq	%rax, -0x48(%rbp)
1408755db:     	cmpq	%rax, 0x8(%rdx)
1408755df:     	je	0x1408756b9 <.text+0x8746b9>
1408755e5:     	addq	$0x8, %rdx
1408755e9:     	leaq	0x519a2e8(%rip), %rax   # 0x145a0f8d8
1408755f0:     	movq	%rax, 0x28(%rsp)
1408755f5:     	movq	$0x83, 0x20(%rsp)
1408755fe:     	leaq	0x519a28b(%rip), %r9    # 0x145a0f890
140875605:     	leaq	-0x48(%rbp), %r8
140875609:     	xorl	%ecx, %ecx
14087560b:     	callq	0x14589fabd <.text+0x589eabd>
140875610:     	ud2
140875612:     	movq	%rdx, %r14
140875615:     	leaq	0x40(%rdi), %rax
140875619:     	leaq	0x5a8(%rdi), %rcx
140875620:     	movq	%rax, 0xf8(%rbp)
140875627:     	movq	%rcx, 0x100(%rbp)
14087562e:     	movq	$0x0, 0xe0(%rbp)
140875639:     	movq	$0x8, 0xe8(%rbp)
140875644:     	movq	$0x0, 0xf0(%rbp)
14087564f:     	leaq	0x523bb0a(%rip), %rdx   # 0x145ab1160
140875656:     	leaq	0xe0(%rbp), %rcx
14087565d:     	callq	0x140ce00a0 <.text+0xcdf0a0>
140875662:     	nop
140875663:     	movq	%rax, %rbx
140875666:     	movq	0xe0(%rbp), %rdx
14087566d:     	testq	%rdx, %rdx
140875670:     	je	0x140875688 <.text+0x874688>
140875672:     	movq	0xe8(%rbp), %rcx
140875679:     	shlq	$0x3, %rdx
14087567d:     	movl	$0x8, %r8d
140875683:     	callq	0x1400021d0 <.text+0x11d0>
140875688:     	leaq	-0x40(%rbp), %rcx
14087568c:     	movq	%rdi, %rdx
14087568f:     	callq	0x1412a44f0 <.text+0x12a34f0>
140875694:     	movq	%rbx, -0x48(%rbp)
140875698:     	movq	0x5a0(%rdi), %rax
14087569f:     	movq	%rax, 0x8(%r14)
1408756a3:     	leaq	0x10(%r14), %rcx
1408756a7:     	leaq	-0x48(%rbp), %rdx
1408756ab:     	movl	$0x128, %r8d            # imm = 0x128
1408756b1:     	callq	0x145756ddd <.text+0x5755ddd>
1408756b6:     	movq	%r14, %rdx
1408756b9:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
1408756be:     	addl	0x5b0(%rdi), %eax
1408756c4:     	movl	%eax, (%rdx)
1408756c6:     	movq	$0x10, -0x30(%rbp)
1408756ce:     	xorps	%xmm0, %xmm0
1408756d1:     	movups	%xmm0, -0x28(%rbp)
1408756d5:     	movq	$0x10, -0x18(%rbp)
1408756dd:     	movups	%xmm0, -0x10(%rbp)
1408756e1:     	movq	$0x10, (%rbp)
1408756e9:     	movups	%xmm0, 0x8(%rbp)
1408756ed:     	movq	$0x10, 0x18(%rbp)
1408756f5:     	movups	%xmm0, 0x20(%rbp)
1408756f9:     	movq	$0x10, 0x30(%rbp)
140875701:     	movq	$0x0, -0x48(%rbp)
140875709:     	movups	%xmm0, 0x38(%rbp)
14087570d:     	movl	$0x0, 0x48(%rbp)
140875714:     	movq	$0x8, -0x40(%rbp)
14087571c:     	movq	$0x0, -0x38(%rbp)
140875724:     	leaq	0x10(%rdx), %rcx
140875728:     	leaq	-0x48(%rbp), %r8
14087572c:     	movq	%rdi, %r9
14087572f:     	callq	0x140d60d70 <.text+0xd5fd70>
140875734:     	nop
140875735:     	leaq	-0x48(%rbp), %rdx
140875739:     	movl	$0x98, %r8d
14087573f:     	movq	%rsi, %rcx
140875742:     	callq	0x145756ddd <.text+0x5755ddd>
140875747:     	movq	%rsi, %rax
14087574a:     	addq	$0x190, %rsp            # imm = 0x190
140875751:     	popq	%rbx
140875752:     	popq	%rdi
140875753:     	popq	%rsi
140875754:     	popq	%r14
140875756:     	popq	%rbp
140875757:     	retq

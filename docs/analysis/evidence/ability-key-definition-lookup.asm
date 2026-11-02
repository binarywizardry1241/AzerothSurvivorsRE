
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453e37e0: 41 56                       	pushq	%r14
1453e37e2: 56                          	pushq	%rsi
1453e37e3: 57                          	pushq	%rdi
1453e37e4: 53                          	pushq	%rbx
1453e37e5: 48 83 ec 48                 	subq	$0x48, %rsp
1453e37e9: 48 89 d6                    	movq	%rdx, %rsi
1453e37ec: 48 89 cf                    	movq	%rcx, %rdi
1453e37ef: 48 89 4c 24 28              	movq	%rcx, 0x28(%rsp)
1453e37f4: 48 89 54 24 30              	movq	%rdx, 0x30(%rsp)
1453e37f9: 45 31 f6                    	xorl	%r14d, %r14d
1453e37fc: 48 8d 1d 2d 73 2e 01        	leaq	0x12e732d(%rip), %rbx   # 0x1466cab30
1453e3803: eb 18                       	jmp	0x1453e381d <.text+0x53e281d>
1453e3805: 66 66 2e 0f 1f 84 00 00 00 00 00    	nopw	%cs:(%rax,%rax)
1453e3810: 49 83 c6 78                 	addq	$0x78, %r14
1453e3814: 49 81 fe 08 34 00 00        	cmpq	$0x3408, %r14           # imm = 0x3408
1453e381b: 74 2a                       	je	0x1453e3847 <.text+0x53e2847>
1453e381d: 49 39 74 1e 08              	cmpq	%rsi, 0x8(%r14,%rbx)
1453e3822: 75 ec                       	jne	0x1453e3810 <.text+0x53e2810>
1453e3824: 49 8b 0c 1e                 	movq	(%r14,%rbx), %rcx
1453e3828: 48 89 fa                    	movq	%rdi, %rdx
1453e382b: 49 89 f0                    	movq	%rsi, %r8
1453e382e: e8 5e 79 32 00              	callq	0x14570b191 <.text+0x570a191>
1453e3833: 85 c0                       	testl	%eax, %eax
1453e3835: 75 d9                       	jne	0x1453e3810 <.text+0x53e2810>
1453e3837: 4c 01 f3                    	addq	%r14, %rbx
1453e383a: 48 89 d8                    	movq	%rbx, %rax
1453e383d: 48 83 c4 48                 	addq	$0x48, %rsp
1453e3841: 5b                          	popq	%rbx
1453e3842: 5f                          	popq	%rdi
1453e3843: 5e                          	popq	%rsi
1453e3844: 41 5e                       	popq	%r14
1453e3846: c3                          	retq
1453e3847: 48 8d 44 24 28              	leaq	0x28(%rsp), %rax
1453e384c: 48 89 44 24 38              	movq	%rax, 0x38(%rsp)
1453e3851: 48 8d 05 68 e8 c1 fa        	leaq	-0x53e1798(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1453e3858: 48 89 44 24 40              	movq	%rax, 0x40(%rsp)
1453e385d: 48 8d 0d 14 65 2e 01        	leaq	0x12e6514(%rip), %rcx   # 0x1466c9d78
1453e3864: 4c 8d 05 1d 65 2e 01        	leaq	0x12e651d(%rip), %r8    # 0x1466c9d88
1453e386b: 48 8d 54 24 38              	leaq	0x38(%rsp), %rdx
1453e3870: e8 eb 6b 4b 00              	callq	0x14589a460 <.text+0x5899460>
1453e3875: 0f 0b                       	ud2

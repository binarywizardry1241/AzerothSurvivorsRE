

Disassembly of section .text:

0000000140001000 <.text>:
14593357a: 41 0f b6 5f 4c              	movzbl	0x4c(%r15), %ebx



Disassembly of section .text:

0000000140001000 <.text>:
1459338ab: c7 84 08 58 01 00 00 00 00 00 00    	movl	$0x0, 0x158(%rax,%rcx)
1459338b6: 88 9c 08 5c 01 00 00        	movb	%bl, 0x15c(%rax,%rcx)



Disassembly of section .text:

0000000140001000 <.text>:
1459306cd: c7 45 38 00 00 00 00        	movl	$0x0, 0x38(%rbp)
1459306d4: c6 85 24 01 00 00 01        	movb	$0x1, 0x124(%rbp)
1459306db: 48 c7 45 08 ff ff ff ff     	movq	$-0x1, 0x8(%rbp)
1459306e3: c7 45 40 00 00 00 00        	movl	$0x0, 0x40(%rbp)
1459306ea: 0f 11 8d 14 01 00 00        	movups	%xmm1, 0x114(%rbp)
1459306f1: 48 8b be 68 05 00 00        	movq	0x568(%rsi), %rdi
1459306f8: 48 3b be 58 05 00 00        	cmpq	0x558(%rsi), %rdi
1459306ff: 75 0d                       	jne	0x14593070e <.text+0x592f70e>
145930701: 48 8d 8e 58 05 00 00        	leaq	0x558(%rsi), %rcx
145930708: e8 d3 1d 35 00              	callq	0x145c824e0 <.text+0x5c814e0>
14593070d: 90                          	nop
14593070e: 4d 8d 75 30                 	leaq	0x30(%r13), %r14
145930712: 48 69 cf 60 01 00 00        	imulq	$0x160, %rdi, %rcx      # imm = 0x160
145930719: 48 03 8e 60 05 00 00        	addq	0x560(%rsi), %rcx
145930720: 48 8d 55 c8                 	leaq	-0x38(%rbp), %rdx
145930724: 41 b8 60 01 00 00           	movl	$0x160, %r8d            # imm = 0x160
14593072a: e8 4c 90 29 00              	callq	0x145bc977b <.text+0x5bc877b>



Disassembly of section .text:

0000000140001000 <.text>:
145910834: 47 0f b6 74 35 4c           	movzbl	0x4c(%r13,%r14), %r14d



Disassembly of section .text:

0000000140001000 <.text>:
145910a77: c7 85 f8 01 00 00 00 00 00 00       	movl	$0x0, 0x1f8(%rbp)
145910a81: 44 88 b5 fc 01 00 00        	movb	%r14b, 0x1fc(%rbp)
145910a88: 49 8b bd 68 05 00 00        	movq	0x568(%r13), %rdi
145910a8f: 49 3b bd 58 05 00 00        	cmpq	0x558(%r13), %rdi
145910a96: 75 0d                       	jne	0x145910aa5 <.text+0x590faa5>
145910a98: 48 8b 8d 48 03 00 00        	movq	0x348(%rbp), %rcx
145910a9f: e8 3c 1a 37 00              	callq	0x145c824e0 <.text+0x5c814e0>
145910aa4: 90                          	nop
145910aa5: 48 69 cf 60 01 00 00        	imulq	$0x160, %rdi, %rcx      # imm = 0x160
145910aac: 49 03 8d 60 05 00 00        	addq	0x560(%r13), %rcx
145910ab3: 41 b8 60 01 00 00           	movl	$0x160, %r8d            # imm = 0x160
145910ab9: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
145910ac0: e8 b6 8c 2b 00              	callq	0x145bc977b <.text+0x5bc877b>

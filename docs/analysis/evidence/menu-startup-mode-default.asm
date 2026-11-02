
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140010bcf: 80 7f 61 00                 	cmpb	$0x0, 0x61(%rdi)
140010bd3: 74 31                       	je	0x140010c06 <.text+0xfc06>
140010bd5: 31 c0                       	xorl	%eax, %eax
140010bd7: 48 89 f1                    	movq	%rsi, %rcx
140010bda: 48 89 c2                    	movq	%rax, %rdx
140010bdd: 45 31 c9                    	xorl	%r9d, %r9d
140010be0: e8 fb a7 3c 05              	callq	0x1453db3e0 <.text+0x53da3e0>
140010be5: 48 b8 01 00 00 00 00 00 00 80       	movabsq	$-0x7fffffffffffffff, %rax # imm = 0x8000000000000001
140010bef: 48 89 46 18                 	movq	%rax, 0x18(%rsi)
140010bf3: 48 89 f0                    	movq	%rsi, %rax
140010bf6: 48 81 c4 a8 00 00 00        	addq	$0xa8, %rsp
140010bfd: 5b                          	popq	%rbx
140010bfe: 5f                          	popq	%rdi
140010bff: 5e                          	popq	%rsi
140010c00: 41 5e                       	popq	%r14
140010c02: 41 5f                       	popq	%r15
140010c04: 5d                          	popq	%rbp
140010c05: c3                          	retq
140010c06: b9 01 00 00 00              	movl	$0x1, %ecx
140010c0b: 31 d2                       	xorl	%edx, %edx
140010c0d: e8 5e cf 3f 05              	callq	0x14540db70 <.text+0x540cb70>
140010c12: 49 89 d0                    	movq	%rdx, %r8
140010c15: 48 89 f1                    	movq	%rsi, %rcx
140010c18: 48 89 c2                    	movq	%rax, %rdx
140010c1b: 45 31 c9                    	xorl	%r9d, %r9d
140010c1e: e8 bd a7 3c 05              	callq	0x1453db3e0 <.text+0x53da3e0>
140010c23: 48 b8 00 00 00 00 00 00 00 80       	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
140010c2d: eb c0                       	jmp	0x140010bef <.text+0xfbef>

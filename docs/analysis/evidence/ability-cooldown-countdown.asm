
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145471476: 49 8b 94 24 a0 02 00 00     	movq	0x2a0(%r12), %rdx
14547147e: 48 39 d7                    	cmpq	%rdx, %rdi
145471481: 0f 83 15 bc 00 00           	jae	0x14547d09c <.text+0x547c09c>
145471487: 49 8b 84 24 98 02 00 00     	movq	0x298(%r12), %rax
14547148f: 4c 8d 34 bf                 	leaq	(%rdi,%rdi,4), %r14
145471493: 49 c1 e6 04                 	shlq	$0x4, %r14
145471497: f3 42 0f 10 44 30 24        	movss	0x24(%rax,%r14), %xmm0
14547149e: 0f 28 c8                    	movaps	%xmm0, %xmm1
1454714a1: f3 0f 5c ce                 	subss	%xmm6, %xmm1
1454714a5: f3 42 0f 11 4c 30 24        	movss	%xmm1, 0x24(%rax,%r14)
1454714ac: 49 8b 94 24 a0 02 00 00     	movq	0x2a0(%r12), %rdx
1454714b4: 48 39 d7                    	cmpq	%rdx, %rdi
1454714b7: 0f 83 c3 bb 00 00           	jae	0x14547d080 <.text+0x547c080>
1454714bd: 49 8b 8c 24 98 02 00 00     	movq	0x298(%r12), %rcx
1454714c5: 4a 8b 04 31                 	movq	(%rcx,%r14), %rax
1454714c9: 83 78 68 0b                 	cmpl	$0xb, 0x68(%rax)

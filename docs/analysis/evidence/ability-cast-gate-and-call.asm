
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145471700: 48 39 d7                    	cmpq	%rdx, %rdi
145471703: 0f 83 d1 b9 00 00           	jae	0x14547d0da <.text+0x547c0da>
145471709: 49 8b 8c 24 98 02 00 00     	movq	0x298(%r12), %rcx
145471711: 4a 8d 04 31                 	leaq	(%rcx,%r14), %rax
145471715: 4a 8b 14 31                 	movq	(%rcx,%r14), %rdx
145471719: 80 7a 75 0b                 	cmpb	$0xb, 0x75(%rdx)
14547171d: f3 42 0f 10 44 31 24        	movss	0x24(%rcx,%r14), %xmm0
145471724: 0f 84 36 fd ff ff           	je	0x145471460 <.text+0x5470460>
14547172a: 41 0f 2e c2                 	ucomiss	%xmm10, %xmm0
14547172e: 0f 87 36 fd ff ff           	ja	0x14547146a <.text+0x547046a>
145471734: c7 40 24 00 00 80 7f        	movl	$0x7f800000, 0x24(%rax) # imm = 0x7F800000
14547173b: 49 8b 94 24 a0 02 00 00     	movq	0x2a0(%r12), %rdx
145471743: 48 39 d7                    	cmpq	%rdx, %rdi
145471746: 0f 83 af ba 00 00           	jae	0x14547d1fb <.text+0x547c1fb>
14547174c: 49 8b 84 24 98 02 00 00     	movq	0x298(%r12), %rax
145471754: 4a 8b 0c 30                 	movq	(%rax,%r14), %rcx
145471758: 42 8b 54 30 20              	movl	0x20(%rax,%r14), %edx
14547175d: f3 42 0f 10 44 30 2c        	movss	0x2c(%rax,%r14), %xmm0
145471764: 46 8b 44 30 30              	movl	0x30(%rax,%r14), %r8d
145471769: 46 8b 4c 30 4c              	movl	0x4c(%rax,%r14), %r9d
14547176e: 4c 8d 95 8c 00 00 00        	leaq	0x8c(%rbp), %r10
145471775: 45 89 4a 10                 	movl	%r9d, 0x10(%r10)
145471779: 42 0f 10 4c 30 3c           	movups	0x3c(%rax,%r14), %xmm1
14547177f: 41 0f 11 0a                 	movups	%xmm1, (%r10)
145471783: 4e 8b 4c 30 18              	movq	0x18(%rax,%r14), %r9
145471788: 4d 89 4a dc                 	movq	%r9, -0x24(%r10)
14547178c: 42 0f 10 4c 30 08           	movups	0x8(%rax,%r14), %xmm1
145471792: 41 0f 11 4a cc              	movups	%xmm1, -0x34(%r10)
145471797: 48 89 4d 50                 	movq	%rcx, 0x50(%rbp)
14547179b: 89 55 70                    	movl	%edx, 0x70(%rbp)
14547179e: f2 42 0f 10 4c 30 24        	movsd	0x24(%rax,%r14), %xmm1
1454717a5: f2 0f 11 4d 74              	movsd	%xmm1, 0x74(%rbp)
1454717aa: f3 0f 11 45 7c              	movss	%xmm0, 0x7c(%rbp)
1454717af: 44 89 85 80 00 00 00        	movl	%r8d, 0x80(%rbp)
1454717b6: f2 42 0f 10 44 30 34        	movsd	0x34(%rax,%r14), %xmm0
1454717bd: f2 0f 11 85 84 00 00 00     	movsd	%xmm0, 0x84(%rbp)
1454717c5: 44 88 ad 17 03 00 00        	movb	%r13b, 0x317(%rbp)
1454717cc: 4c 89 e1                    	movq	%r12, %rcx
1454717cf: 48 8d 55 50                 	leaq	0x50(%rbp), %rdx
1454717d3: e8 c8 5e 04 00              	callq	0x1454b76a0 <.text+0x54b66a0>
1454717d8: 88 85 f8 02 00 00           	movb	%al, 0x2f8(%rbp)
1454717de: 44 0f b6 85 f8 02 00 00     	movzbl	0x2f8(%rbp), %r8d
1454717e6: 45 84 c0                    	testb	%r8b, %r8b
1454717e9: 0f 84 1b 03 00 00           	je	0x145471b0a <.text+0x5470b0a>


AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145471b0a: 49 8b 94 24 a0 02 00 00     	movq	0x2a0(%r12), %rdx
145471b12: 48 39 d7                    	cmpq	%rdx, %rdi
145471b15: 0f 83 c4 b6 00 00           	jae	0x14547d1df <.text+0x547c1df>
145471b1b: 49 8b 8c 24 98 02 00 00     	movq	0x298(%r12), %rcx
145471b23: 4a 8b 04 31                 	movq	(%rcx,%r14), %rax
145471b27: f3 0f 10 40 48              	movss	0x48(%rax), %xmm0
145471b2c: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
145471b31: f3 42 0f 59 44 31 2c        	mulss	0x2c(%rcx,%r14), %xmm0
145471b38: f3 42 0f 59 44 31 0c        	mulss	0xc(%rcx,%r14), %xmm0
145471b3f: f3 41 0f 59 84 24 58 04 00 00       	mulss	0x458(%r12), %xmm0
145471b49: 4c 01 f1                    	addq	%r14, %rcx
145471b4c: f3 41 0f 5f c1              	maxss	%xmm9, %xmm0
145471b51: 83 78 68 0b                 	cmpl	$0xb, 0x68(%rax)
145471b55: 75 1d                       	jne	0x145471b74 <.text+0x5470b74>
145471b57: f3 0f 10 48 58              	movss	0x58(%rax), %xmm1
145471b5c: f3 41 0f 59 c8              	mulss	%xmm8, %xmm1
145471b61: f3 0f 59 49 38              	mulss	0x38(%rcx), %xmm1
145471b66: f3 0f 59 49 18              	mulss	0x18(%rcx), %xmm1
145471b6b: f3 41 0f 5f ce              	maxss	%xmm14, %xmm1
145471b70: f3 0f 58 c1                 	addss	%xmm1, %xmm0
145471b74: 45 84 c0                    	testb	%r8b, %r8b
145471b77: 0f 84 68 01 00 00           	je	0x145471ce5 <.text+0x5470ce5>
145471b7d: f3 0f 10 49 24              	movss	0x24(%rcx), %xmm1
145471b82: 0f 28 d1                    	movaps	%xmm1, %xmm2
145471b85: f3 0f 5d d0                 	minss	%xmm0, %xmm2
145471b89: 0f 28 c2                    	movaps	%xmm2, %xmm0
145471b8c: f3 0f c2 c2 03              	cmpunordss	%xmm2, %xmm0
145471b91: 0f 28 d8                    	movaps	%xmm0, %xmm3
145471b94: 0f 55 da                    	andnps	%xmm2, %xmm3
145471b97: 0f 54 c1                    	andps	%xmm1, %xmm0
145471b9a: 0f 56 c3                    	orps	%xmm3, %xmm0
145471b9d: f3 0f 11 41 24              	movss	%xmm0, 0x24(%rcx)

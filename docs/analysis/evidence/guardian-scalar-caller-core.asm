
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547be10: 49 ff c6                    	incq	%r14
14547be13: 4d 39 ee                    	cmpq	%r13, %r14
14547be16: 0f 84 51 05 00 00           	je	0x14547c36d <.text+0x547b36d>
14547be1c: 49 8b 94 24 88 05 00 00     	movq	0x588(%r12), %rdx
14547be24: 49 39 d6                    	cmpq	%rdx, %r14
14547be27: 0f 83 ea 13 00 00           	jae	0x14547d217 <.text+0x547c217>
14547be2d: 49 8b 84 24 80 05 00 00     	movq	0x580(%r12), %rax
14547be35: 4b 8d 1c b6                 	leaq	(%r14,%r14,4), %rbx
14547be39: 48 83 3c d8 00              	cmpq	$0x0, (%rax,%rbx,8)
14547be3e: 75 d0                       	jne	0x14547be10 <.text+0x547ae10>
14547be40: 48 8d 34 d8                 	leaq	(%rax,%rbx,8), %rsi
14547be44: f3 41 0f 10 84 24 cc 08 00 00       	movss	0x8cc(%r12), %xmm0
14547be4e: 0f 2e 46 24                 	ucomiss	0x24(%rsi), %xmm0
14547be52: 72 bc                       	jb	0x14547be10 <.text+0x547ae10>
14547be54: 49 8b 8c 24 10 02 00 00     	movq	0x210(%r12), %rcx
14547be5c: 49 8b 94 24 18 02 00 00     	movq	0x218(%r12), %rdx
14547be64: e8 27 78 f6 ff              	callq	0x1453e3690 <.text+0x53e2690>
14547be69: 8b 4e 20                    	movl	0x20(%rsi), %ecx
14547be6c: 89 4d 08                    	movl	%ecx, 0x8(%rbp)
14547be6f: 48 8b 4e 18                 	movq	0x18(%rsi), %rcx
14547be73: 48 89 4d 00                 	movq	%rcx, (%rbp)
14547be77: 48 8b 7e 10                 	movq	0x10(%rsi), %rdi
14547be7b: 48 83 ff 0b                 	cmpq	$0xb, %rdi
14547be7f: 0f 87 a7 14 00 00           	ja	0x14547d32c <.text+0x547c32c>
14547be85: 4c 89 e6                    	movq	%r12, %rsi
14547be88: 48 69 c0 b8 00 00 00        	imulq	$0xb8, %rax, %rax
14547be8f: 48 8d 0d 82 bb 24 01        	leaq	0x124bb82(%rip), %rcx   # 0x1466c7a18
14547be96: 4c 8b 6c 08 48              	movq	0x48(%rax,%rcx), %r13
14547be9b: 4c 8d 24 bf                 	leaq	(%rdi,%rdi,4), %r12
14547be9f: 49 c1 e4 04                 	shlq	$0x4, %r12
14547bea3: 4b 8d 04 2c                 	leaq	(%r12,%r13), %rax
14547bea7: 48 89 85 f8 02 00 00        	movq	%rax, 0x2f8(%rbp)
14547beae: 48 89 f1                    	movq	%rsi, %rcx
14547beb1: 48 89 fa                    	movq	%rdi, %rdx
14547beb4: e8 b7 2b 04 00              	callq	0x1454bea70 <.text+0x54bda70>
14547beb9: 0f 28 f0                    	movaps	%xmm0, %xmm6
14547bebc: 48 89 f1                    	movq	%rsi, %rcx
14547bebf: 48 89 fa                    	movq	%rdi, %rdx
14547bec2: e8 99 2f 04 00              	callq	0x1454bee60 <.text+0x54bde60>
14547bec7: 0f 28 f8                    	movaps	%xmm0, %xmm7
14547beca: f3 47 0f 10 6c 25 28        	movss	0x28(%r13,%r12), %xmm13
14547bed1: f3 44 0f 59 2d b6 8c 62 01  	mulss	0x1628cb6(%rip), %xmm13 # 0x146aa4b90
14547beda: 47 8b 44 25 20              	movl	0x20(%r13,%r12), %r8d
14547bedf: 44 8b be e8 08 00 00        	movl	0x8e8(%rsi), %r15d
14547bee6: 41 ff c7                    	incl	%r15d
14547bee9: 44 89 be e8 08 00 00        	movl	%r15d, 0x8e8(%rsi)
14547bef0: 44 89 c0                    	movl	%r8d, %eax
14547bef3: 25 ff ff ff 00              	andl	$0xffffff, %eax         # imm = 0xFFFFFF
14547bef8: 48 c1 e0 18                 	shlq	$0x18, %rax
14547befc: 41 81 e7 ff ff ff 00        	andl	$0xffffff, %r15d        # imm = 0xFFFFFF
14547bf03: 49 09 c7                    	orq	%rax, %r15
14547bf06: 48 b8 00 00 00 00 00 00 30 f1       	movabsq	$-0xed0000000000000, %rax # imm = 0xF130000000000000
14547bf10: 49 09 c7                    	orq	%rax, %r15
14547bf13: 47 8b 4c 25 24              	movl	0x24(%r13,%r12), %r9d
14547bf18: 48 89 e8                    	movq	%rbp, %rax
14547bf1b: 48 89 44 24 38              	movq	%rax, 0x38(%rsp)
14547bf20: f3 0f 11 74 24 28           	movss	%xmm6, 0x28(%rsp)
14547bf26: f3 44 0f 11 6c 24 20        	movss	%xmm13, 0x20(%rsp)
14547bf2d: c6 44 24 30 01              	movb	$0x1, 0x30(%rsp)
14547bf32: 48 89 f1                    	movq	%rsi, %rcx
14547bf35: 4c 89 fa                    	movq	%r15, %rdx
14547bf38: e8 83 4d 01 00              	callq	0x145490cc0 <.text+0x548fcc0>
14547bf3d: f3 44 0f 10 b6 cc 08 00 00  	movss	0x8cc(%rsi), %xmm14
14547bf46: f3 47 0f 10 7c 25 38        	movss	0x38(%r13,%r12), %xmm15
14547bf4d: f3 47 0f 10 44 25 3c        	movss	0x3c(%r13,%r12), %xmm8
14547bf54: 47 0f b6 6c 25 4c           	movzbl	0x4c(%r13,%r12), %r13d
14547bf5a: 0f b7 be 36 02 00 00        	movzwl	0x236(%rsi), %edi
14547bf61: 4c 8b 86 68 08 00 00        	movq	0x868(%rsi), %r8
14547bf68: 48 8b 96 80 08 00 00        	movq	0x880(%rsi), %rdx
14547bf6f: 48 8b 8e 70 08 00 00        	movq	0x870(%rsi), %rcx
14547bf76: 48 8b 86 78 08 00 00        	movq	0x878(%rsi), %rax
14547bf7d: 49 89 f4                    	movq	%rsi, %r12
14547bf80: 4d 8d 0c 10                 	leaq	(%r8,%rdx), %r9
14547bf84: 49 c1 c1 17                 	rolq	$0x17, %r9
14547bf88: 4d 01 c1                    	addq	%r8, %r9
14547bf8b: 49 89 ca                    	movq	%rcx, %r10
14547bf8e: 49 c1 e2 11                 	shlq	$0x11, %r10
14547bf92: 4c 31 c0                    	xorq	%r8, %rax
14547bf95: 48 31 ca                    	xorq	%rcx, %rdx
14547bf98: 48 31 c1                    	xorq	%rax, %rcx
14547bf9b: 49 31 d0                    	xorq	%rdx, %r8
14547bf9e: 48 c1 c2 2d                 	rolq	$0x2d, %rdx
14547bfa2: 4c 31 d0                    	xorq	%r10, %rax
14547bfa5: 49 c1 e9 29                 	shrq	$0x29, %r9
14547bfa9: 41 81 c9 00 00 80 3f        	orl	$0x3f800000, %r9d       # imm = 0x3F800000
14547bfb0: 66 45 0f 6e e1              	movd	%r9d, %xmm12
14547bfb5: f3 45 0f 58 e1              	addss	%xmm9, %xmm12
14547bfba: f3 45 0f 59 e2              	mulss	%xmm10, %xmm12
14547bfbf: 45 0f 2e d4                 	ucomiss	%xmm12, %xmm10
14547bfc3: 76 bb                       	jbe	0x14547bf80 <.text+0x547af80>
14547bfc5: 4d 89 84 24 68 08 00 00     	movq	%r8, 0x868(%r12)
14547bfcd: 49 89 94 24 80 08 00 00     	movq	%rdx, 0x880(%r12)
14547bfd5: 49 89 8c 24 70 08 00 00     	movq	%rcx, 0x870(%r12)
14547bfdd: 49 89 84 24 78 08 00 00     	movq	%rax, 0x878(%r12)
14547bfe5: e8 16 62 b8 fa              	callq	0x140002200 <.text+0x1200>
14547bfea: b9 0c 00 00 00              	movl	$0xc, %ecx
14547bfef: ba 04 00 00 00              	movl	$0x4, %edx
14547bff4: e8 c7 61 b8 fa              	callq	0x1400021c0 <.text+0x11c0>
14547bff9: 48 85 c0                    	testq	%rax, %rax
14547bffc: 0f 84 51 13 00 00           	je	0x14547d353 <.text+0x547c353>
14547c002: 0f 57 c0                    	xorps	%xmm0, %xmm0
14547c005: f3 44 0f 58 e0              	addss	%xmm0, %xmm12
14547c00a: 0f b7 cf                    	movzwl	%di, %ecx
14547c00d: 0f 57 c0                    	xorps	%xmm0, %xmm0
14547c010: f3 0f 2a c1                 	cvtsi2ss	%ecx, %xmm0
14547c014: f3 0f 5e 05 14 4b 42 00     	divss	0x424b14(%rip), %xmm0   # 0x1458a0b30
14547c01c: f3 44 0f 59 c0              	mulss	%xmm0, %xmm8

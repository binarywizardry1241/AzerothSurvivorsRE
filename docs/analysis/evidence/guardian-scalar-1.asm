
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454bee60: 56                          	pushq	%rsi
1454bee61: 57                          	pushq	%rdi
1454bee62: 48 83 ec 78                 	subq	$0x78, %rsp
1454bee66: 44 0f 29 54 24 60           	movaps	%xmm10, 0x60(%rsp)
1454bee6c: 44 0f 29 4c 24 50           	movaps	%xmm9, 0x50(%rsp)
1454bee72: 44 0f 29 44 24 40           	movaps	%xmm8, 0x40(%rsp)
1454bee78: 0f 29 7c 24 30              	movaps	%xmm7, 0x30(%rsp)
1454bee7d: 0f 29 74 24 20              	movaps	%xmm6, 0x20(%rsp)
1454bee82: 48 89 d7                    	movq	%rdx, %rdi
1454bee85: 48 83 fa 0b                 	cmpq	$0xb, %rdx
1454bee89: 0f 87 48 01 00 00           	ja	0x1454befd7 <.text+0x54bdfd7>
1454bee8f: 48 89 ce                    	movq	%rcx, %rsi
1454bee92: 48 8b 89 10 02 00 00        	movq	0x210(%rcx), %rcx
1454bee99: 48 8b 96 18 02 00 00        	movq	0x218(%rsi), %rdx
1454beea0: e8 eb 47 f2 ff              	callq	0x1453e3690 <.text+0x53e2690>
1454beea5: 48 69 c0 b8 00 00 00        	imulq	$0xb8, %rax, %rax
1454beeac: 48 8d 0d 65 8b 20 01        	leaq	0x1208b65(%rip), %rcx   # 0x1466c7a18
1454beeb3: 48 8b 54 08 48              	movq	0x48(%rax,%rcx), %rdx
1454beeb8: 4c 8d 04 bf                 	leaq	(%rdi,%rdi,4), %r8
1454beebc: 49 c1 e0 04                 	shlq	$0x4, %r8
1454beec0: f3 42 0f 10 74 02 34        	movss	0x34(%rdx,%r8), %xmm6
1454beec7: f3 44 0f 10 96 cc 08 00 00  	movss	0x8cc(%rsi), %xmm10
1454beed0: f3 44 0f 10 84 08 b0 00 00 00       	movss	0xb0(%rax,%rcx), %xmm8
1454beeda: f3 44 0f 10 8e 28 09 00 00  	movss	0x928(%rsi), %xmm9
1454beee3: f3 0f 10 3d e5 1a 3e 00     	movss	0x3e1ae5(%rip), %xmm7   # 0x1458a09d0
1454beeeb: 83 be 50 08 00 00 01        	cmpl	$0x1, 0x850(%rsi)
1454beef2: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454beef5: 75 34                       	jne	0x1454bef2b <.text+0x54bdf2b>
1454beef7: 80 be 35 09 00 00 00        	cmpb	$0x0, 0x935(%rsi)
1454beefe: 0f 28 c7                    	movaps	%xmm7, %xmm0
1454bef01: 74 28                       	je	0x1454bef2b <.text+0x54bdf2b>
1454bef03: 41 0f 28 ca                 	movaps	%xmm10, %xmm1
1454bef07: f3 0f 5c 8e 54 08 00 00     	subss	0x854(%rsi), %xmm1
1454bef0f: f3 0f 5e 0d 19 a9 41 00     	divss	0x41a919(%rip), %xmm1   # 0x1458d9830
1454bef17: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454bef1a: f3 0f 5f c8                 	maxss	%xmm0, %xmm1
1454bef1e: f3 0f 10 05 6a 5d 5e 01     	movss	0x15e5d6a(%rip), %xmm0  # 0x146aa4c90
1454bef26: e8 08 c3 24 00              	callq	0x14570b233 <.text+0x570a233>
1454bef2b: f3 44 0f 5e 15 fc a8 41 00  	divss	0x41a8fc(%rip), %xmm10  # 0x1458d9830
1454bef34: f3 0f 10 0d 44 8a 3e 00     	movss	0x3e8a44(%rip), %xmm1   # 0x1458a7980
1454bef3c: f3 41 0f 59 ca              	mulss	%xmm10, %xmm1
1454bef41: f3 0f 58 cf                 	addss	%xmm7, %xmm1
1454bef45: f3 0f 10 15 23 5e 5e 01     	movss	0x15e5e23(%rip), %xmm2  # 0x146aa4d70
1454bef4d: f3 41 0f 59 d2              	mulss	%xmm10, %xmm2
1454bef52: f3 41 0f 59 d2              	mulss	%xmm10, %xmm2
1454bef57: f3 0f 58 d1                 	addss	%xmm1, %xmm2
1454bef5b: f3 45 0f 59 c1              	mulss	%xmm9, %xmm8
1454bef60: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454bef63: f3 41 0f 51 c8              	sqrtss	%xmm8, %xmm1
1454bef68: f3 0f 59 ca                 	mulss	%xmm2, %xmm1
1454bef6c: f3 0f 59 f1                 	mulss	%xmm1, %xmm6
1454bef70: f3 0f 59 35 dc 1b 3e 00     	mulss	0x3e1bdc(%rip), %xmm6   # 0x1458a0b54
1454bef78: f3 0f 59 f0                 	mulss	%xmm0, %xmm6
1454bef7c: 8b 86 5c 06 00 00           	movl	0x65c(%rsi), %eax
1454bef82: 0f 57 c9                    	xorps	%xmm1, %xmm1
1454bef85: f3 48 0f 2a c8              	cvtsi2ss	%rax, %xmm1
1454bef8a: f3 0f 59 0d 2e 87 3e 00     	mulss	0x3e872e(%rip), %xmm1   # 0x1458a76c0
1454bef92: f3 0f 58 cf                 	addss	%xmm7, %xmm1
1454bef96: f3 0f 59 ce                 	mulss	%xmm6, %xmm1
1454bef9a: 0f b7 86 34 02 00 00        	movzwl	0x234(%rsi), %eax
1454befa1: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454befa4: f3 0f 2a c0                 	cvtsi2ss	%eax, %xmm0
1454befa8: f3 0f 5e 05 80 1b 3e 00     	divss	0x3e1b80(%rip), %xmm0   # 0x1458a0b30
1454befb0: f3 0f 59 c1                 	mulss	%xmm1, %xmm0
1454befb4: 0f 28 74 24 20              	movaps	0x20(%rsp), %xmm6
1454befb9: 0f 28 7c 24 30              	movaps	0x30(%rsp), %xmm7
1454befbe: 44 0f 28 44 24 40           	movaps	0x40(%rsp), %xmm8
1454befc4: 44 0f 28 4c 24 50           	movaps	0x50(%rsp), %xmm9
1454befca: 44 0f 28 54 24 60           	movaps	0x60(%rsp), %xmm10
1454befd0: 48 83 c4 78                 	addq	$0x78, %rsp
1454befd4: 5f                          	popq	%rdi
1454befd5: 5e                          	popq	%rsi
1454befd6: c3                          	retq
1454befd7: 4c 8d 05 32 7f 5e 01        	leaq	0x15e7f32(%rip), %r8    # 0x146aa6f10
1454befde: ba 0c 00 00 00              	movl	$0xc, %edx
1454befe3: 48 89 f9                    	movq	%rdi, %rcx
1454befe6: e8 98 b2 3d 00              	callq	0x14589a283 <.text+0x5899283>
1454befeb: 0f 0b                       	ud2

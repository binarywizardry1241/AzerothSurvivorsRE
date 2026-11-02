
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145546730: 55                          	pushq	%rbp
145546731: 41 57                       	pushq	%r15
145546733: 41 56                       	pushq	%r14
145546735: 41 55                       	pushq	%r13
145546737: 41 54                       	pushq	%r12
145546739: 56                          	pushq	%rsi
14554673a: 57                          	pushq	%rdi
14554673b: 53                          	pushq	%rbx
14554673c: 48 81 ec b8 00 00 00        	subq	$0xb8, %rsp
145546743: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
14554674b: 44 0f 29 45 20              	movaps	%xmm8, 0x20(%rbp)
145546750: 0f 29 7d 10                 	movaps	%xmm7, 0x10(%rbp)
145546754: 0f 29 75 00                 	movaps	%xmm6, (%rbp)
145546758: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
145546760: 48 89 ce                    	movq	%rcx, %rsi
145546763: 48 c7 45 d8 00 00 00 00     	movq	$0x0, -0x28(%rbp)
14554676b: 48 c7 45 e0 08 00 00 00     	movq	$0x8, -0x20(%rbp)
145546773: 48 c7 45 e8 00 00 00 00     	movq	$0x0, -0x18(%rbp)
14554677b: 48 c7 45 c0 00 00 00 00     	movq	$0x0, -0x40(%rbp)
145546783: 48 c7 45 c8 08 00 00 00     	movq	$0x8, -0x38(%rbp)
14554678b: 48 c7 45 d0 00 00 00 00     	movq	$0x0, -0x30(%rbp)
145546793: 48 8b 02                    	movq	(%rdx), %rax
145546796: 48 89 45 b8                 	movq	%rax, -0x48(%rbp)
14554679a: 4c 8b 72 08                 	movq	0x8(%rdx), %r14
14554679e: 48 8b 42 10                 	movq	0x10(%rdx), %rax
1455467a2: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
1455467a6: 4c 8b 7a 18                 	movq	0x18(%rdx), %r15
1455467aa: 4d 39 fe                    	cmpq	%r15, %r14
1455467ad: 0f 84 f9 00 00 00           	je	0x1455468ac <.text+0x55458ac>
1455467b3: f2 41 0f 10 30              	movsd	(%r8), %xmm6
1455467b8: f3 0f 10 3d 08 47 3c 00     	movss	0x3c4708(%rip), %xmm7   # 0x14590aec8
1455467c0: 48 8d 7d c0                 	leaq	-0x40(%rbp), %rdi
1455467c4: 48 8d 5d d8                 	leaq	-0x28(%rbp), %rbx
1455467c8: eb 3f                       	jmp	0x145546809 <.text+0x5545809>
1455467ca: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1455467d0: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
1455467d4: 4c 89 e9                    	movq	%r13, %rcx
1455467d7: 48 c1 e1 05                 	shlq	$0x5, %rcx
1455467db: 44 89 24 08                 	movl	%r12d, (%rax,%rcx)
1455467df: 44 0f 13 44 08 04           	movlps	%xmm8, 0x4(%rax,%rcx)
1455467e5: 0f 28 45 a0                 	movaps	-0x60(%rbp), %xmm0
1455467e9: 0f 11 44 08 0c              	movups	%xmm0, 0xc(%rax,%rcx)
1455467ee: 8b 55 b0                    	movl	-0x50(%rbp), %edx
1455467f1: 89 54 08 1c                 	movl	%edx, 0x1c(%rax,%rcx)
1455467f5: 49 ff c5                    	incq	%r13
1455467f8: 4c 89 6d e8                 	movq	%r13, -0x18(%rbp)
1455467fc: 49 83 c6 20                 	addq	$0x20, %r14
145546800: 4d 39 fe                    	cmpq	%r15, %r14
145546803: 0f 84 a3 00 00 00           	je	0x1455468ac <.text+0x55458ac>
145546809: 45 8b 26                    	movl	(%r14), %r12d
14554680c: f2 45 0f 10 46 04           	movsd	0x4(%r14), %xmm8
145546812: 41 8b 46 1c                 	movl	0x1c(%r14), %eax
145546816: 89 45 b0                    	movl	%eax, -0x50(%rbp)
145546819: 41 0f 10 46 0c              	movups	0xc(%r14), %xmm0
14554681e: 0f 29 45 a0                 	movaps	%xmm0, -0x60(%rbp)
145546822: 41 0f 28 c0                 	movaps	%xmm8, %xmm0
145546826: 0f 5c c6                    	subps	%xmm6, %xmm0
145546829: 0f 59 c0                    	mulps	%xmm0, %xmm0
14554682c: f3 0f 16 c8                 	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
145546830: f3 0f 58 c8                 	addss	%xmm0, %xmm1
145546834: 0f 2e f9                    	ucomiss	%xmm1, %xmm7
145546837: 73 57                       	jae	0x145546890 <.text+0x5545890>
145546839: 4c 8b 6d d0                 	movq	-0x30(%rbp), %r13
14554683d: 4c 3b 6d c0                 	cmpq	-0x40(%rbp), %r13
145546841: 75 09                       	jne	0x14554684c <.text+0x554584c>
145546843: 48 89 f9                    	movq	%rdi, %rcx
145546846: e8 65 18 21 00              	callq	0x1457580b0 <.text+0x57570b0>
14554684b: 90                          	nop
14554684c: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
145546850: 4c 89 e9                    	movq	%r13, %rcx
145546853: 48 c1 e1 05                 	shlq	$0x5, %rcx
145546857: 44 89 24 08                 	movl	%r12d, (%rax,%rcx)
14554685b: 44 0f 13 44 08 04           	movlps	%xmm8, 0x4(%rax,%rcx)
145546861: 0f 28 45 a0                 	movaps	-0x60(%rbp), %xmm0
145546865: 0f 11 44 08 0c              	movups	%xmm0, 0xc(%rax,%rcx)
14554686a: 8b 55 b0                    	movl	-0x50(%rbp), %edx
14554686d: 89 54 08 1c                 	movl	%edx, 0x1c(%rax,%rcx)
145546871: 49 ff c5                    	incq	%r13
145546874: 4c 89 6d d0                 	movq	%r13, -0x30(%rbp)
145546878: 49 83 c6 20                 	addq	$0x20, %r14
14554687c: 4d 39 fe                    	cmpq	%r15, %r14
14554687f: 75 88                       	jne	0x145546809 <.text+0x5545809>
145546881: eb 29                       	jmp	0x1455468ac <.text+0x55458ac>
145546883: 66 66 66 66 2e 0f 1f 84 00 00 00 00 00      	nopw	%cs:(%rax,%rax)
145546890: 4c 8b 6d e8                 	movq	-0x18(%rbp), %r13
145546894: 4c 3b 6d d8                 	cmpq	-0x28(%rbp), %r13
145546898: 0f 85 32 ff ff ff           	jne	0x1455467d0 <.text+0x55457d0>
14554689e: 48 89 d9                    	movq	%rbx, %rcx
1455468a1: e8 0a 18 21 00              	callq	0x1457580b0 <.text+0x57570b0>
1455468a6: 90                          	nop
1455468a7: e9 24 ff ff ff              	jmp	0x1455467d0 <.text+0x55457d0>
1455468ac: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
1455468b0: 48 85 d2                    	testq	%rdx, %rdx
1455468b3: 74 13                       	je	0x1455468c8 <.text+0x55458c8>
1455468b5: 48 c1 e2 05                 	shlq	$0x5, %rdx
1455468b9: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1455468bf: 48 8b 4d b8                 	movq	-0x48(%rbp), %rcx
1455468c3: e8 08 b9 ab fa              	callq	0x1400021d0 <.text+0x11d0>
1455468c8: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
1455468cc: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1455468d0: 0f 10 45 d8                 	movups	-0x28(%rbp), %xmm0
1455468d4: 0f 11 06                    	movups	%xmm0, (%rsi)
1455468d7: 0f 10 45 c0                 	movups	-0x40(%rbp), %xmm0
1455468db: 0f 11 46 18                 	movups	%xmm0, 0x18(%rsi)
1455468df: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
1455468e3: 48 89 46 28                 	movq	%rax, 0x28(%rsi)
1455468e7: 48 89 f0                    	movq	%rsi, %rax
1455468ea: 0f 28 75 00                 	movaps	(%rbp), %xmm6
1455468ee: 0f 28 7d 10                 	movaps	0x10(%rbp), %xmm7
1455468f2: 44 0f 28 45 20              	movaps	0x20(%rbp), %xmm8
1455468f7: 48 81 c4 b8 00 00 00        	addq	$0xb8, %rsp
1455468fe: 5b                          	popq	%rbx
1455468ff: 5f                          	popq	%rdi
145546900: 5e                          	popq	%rsi
145546901: 41 5c                       	popq	%r12
145546903: 41 5d                       	popq	%r13
145546905: 41 5e                       	popq	%r14
145546907: 41 5f                       	popq	%r15
145546909: 5d                          	popq	%rbp
14554690a: c3                          	retq

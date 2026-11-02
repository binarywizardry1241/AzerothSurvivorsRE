
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
141928eb0: 56                          	pushq	%rsi
141928eb1: 57                          	pushq	%rdi
141928eb2: 48 83 ec 28                 	subq	$0x28, %rsp
141928eb6: 49 8d 40 ff                 	leaq	-0x1(%r8), %rax
141928eba: 48 39 d0                    	cmpq	%rdx, %rax
141928ebd: 0f 83 b9 00 00 00           	jae	0x141928f7c <.text+0x1927f7c>
141928ec3: 49 39 d0                    	cmpq	%rdx, %r8
141928ec6: 75 07                       	jne	0x141928ecf <.text+0x1927ecf>
141928ec8: 48 83 c4 28                 	addq	$0x28, %rsp
141928ecc: 5f                          	popq	%rdi
141928ecd: 5e                          	popq	%rsi
141928ece: c3                          	retq
141928ecf: 48 c1 e2 05                 	shlq	$0x5, %rdx
141928ed3: 48 01 ca                    	addq	%rcx, %rdx
141928ed6: 49 c1 e0 05                 	shlq	$0x5, %r8
141928eda: 4a 8d 04 01                 	leaq	(%rcx,%r8), %rax
141928ede: eb 26                       	jmp	0x141928f06 <.text+0x1927f06>
141928ee0: 49 89 cb                    	movq	%rcx, %r11
141928ee3: 45 89 0b                    	movl	%r9d, (%r11)
141928ee6: 0f 28 04 24                 	movaps	(%rsp), %xmm0
141928eea: 41 0f 11 43 04              	movups	%xmm0, 0x4(%r11)
141928eef: 0f 10 44 24 0c              	movups	0xc(%rsp), %xmm0
141928ef4: 41 0f 11 43 10              	movups	%xmm0, 0x10(%r11)
141928ef9: 48 83 c0 20                 	addq	$0x20, %rax
141928efd: 49 83 c0 20                 	addq	$0x20, %r8
141928f01: 48 39 d0                    	cmpq	%rdx, %rax
141928f04: 74 c2                       	je	0x141928ec8 <.text+0x1927ec8>
141928f06: 44 8b 58 e0                 	movl	-0x20(%rax), %r11d
141928f0a: 44 8b 08                    	movl	(%rax), %r9d
141928f0d: 45 89 ca                    	movl	%r9d, %r10d
141928f10: 41 c1 fa 1f                 	sarl	$0x1f, %r10d
141928f14: 41 d1 ea                    	shrl	%r10d
141928f17: 45 31 ca                    	xorl	%r9d, %r10d
141928f1a: 44 89 de                    	movl	%r11d, %esi
141928f1d: c1 fe 1f                    	sarl	$0x1f, %esi
141928f20: d1 ee                       	shrl	%esi
141928f22: 44 31 de                    	xorl	%r11d, %esi
141928f25: 41 39 f2                    	cmpl	%esi, %r10d
141928f28: 7d cf                       	jge	0x141928ef9 <.text+0x1927ef9>
141928f2a: 0f 10 40 04                 	movups	0x4(%rax), %xmm0
141928f2e: 0f 10 48 10                 	movups	0x10(%rax), %xmm1
141928f32: 0f 11 4c 24 0c              	movups	%xmm1, 0xc(%rsp)
141928f37: 0f 29 04 24                 	movaps	%xmm0, (%rsp)
141928f3b: 4d 89 c3                    	movq	%r8, %r11
141928f3e: 66 90                       	nop
141928f40: 42 0f 10 44 19 e0           	movups	-0x20(%rcx,%r11), %xmm0
141928f46: 42 0f 10 4c 19 f0           	movups	-0x10(%rcx,%r11), %xmm1
141928f4c: 42 0f 11 4c 19 10           	movups	%xmm1, 0x10(%rcx,%r11)
141928f52: 42 0f 11 04 19              	movups	%xmm0, (%rcx,%r11)
141928f57: 49 83 fb 20                 	cmpq	$0x20, %r11
141928f5b: 74 83                       	je	0x141928ee0 <.text+0x1927ee0>
141928f5d: 42 8b 74 19 c0              	movl	-0x40(%rcx,%r11), %esi
141928f62: 89 f7                       	movl	%esi, %edi
141928f64: c1 ff 1f                    	sarl	$0x1f, %edi
141928f67: d1 ef                       	shrl	%edi
141928f69: 31 f7                       	xorl	%esi, %edi
141928f6b: 49 83 c3 e0                 	addq	$-0x20, %r11
141928f6f: 41 39 fa                    	cmpl	%edi, %r10d
141928f72: 7c cc                       	jl	0x141928f40 <.text+0x1927f40>
141928f74: 49 01 cb                    	addq	%rcx, %r11
141928f77: e9 67 ff ff ff              	jmp	0x141928ee3 <.text+0x1927ee3>
141928f7c: 0f 0b                       	ud2

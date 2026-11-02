
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
141929100: 56                          	pushq	%rsi
141929101: 57                          	pushq	%rdi
141929102: 53                          	pushq	%rbx
141929103: 49 8d 40 ff                 	leaq	-0x1(%r8), %rax
141929107: 48 39 d0                    	cmpq	%rdx, %rax
14192910a: 0f 83 9a 00 00 00           	jae	0x1419291aa <.text+0x19281aa>
141929110: 49 39 d0                    	cmpq	%rdx, %r8
141929113: 75 04                       	jne	0x141929119 <.text+0x1928119>
141929115: 5b                          	popq	%rbx
141929116: 5f                          	popq	%rdi
141929117: 5e                          	popq	%rsi
141929118: c3                          	retq
141929119: 48 c1 e2 04                 	shlq	$0x4, %rdx
14192911d: 48 01 ca                    	addq	%rcx, %rdx
141929120: 49 c1 e0 04                 	shlq	$0x4, %r8
141929124: 4a 8d 04 01                 	leaq	(%rcx,%r8), %rax
141929128: eb 1d                       	jmp	0x141929147 <.text+0x1928147>
14192912a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
141929130: 48 89 ce                    	movq	%rcx, %rsi
141929133: 44 89 0e                    	movl	%r9d, (%rsi)
141929136: 4c 89 5e 08                 	movq	%r11, 0x8(%rsi)
14192913a: 48 83 c0 10                 	addq	$0x10, %rax
14192913e: 49 83 c0 10                 	addq	$0x10, %r8
141929142: 48 39 d0                    	cmpq	%rdx, %rax
141929145: 74 ce                       	je	0x141929115 <.text+0x1928115>
141929147: 44 8b 58 f0                 	movl	-0x10(%rax), %r11d
14192914b: 44 8b 08                    	movl	(%rax), %r9d
14192914e: 45 89 ca                    	movl	%r9d, %r10d
141929151: 41 c1 fa 1f                 	sarl	$0x1f, %r10d
141929155: 41 d1 ea                    	shrl	%r10d
141929158: 45 31 ca                    	xorl	%r9d, %r10d
14192915b: 44 89 de                    	movl	%r11d, %esi
14192915e: c1 fe 1f                    	sarl	$0x1f, %esi
141929161: d1 ee                       	shrl	%esi
141929163: 44 31 de                    	xorl	%r11d, %esi
141929166: 41 39 f2                    	cmpl	%esi, %r10d
141929169: 7d cf                       	jge	0x14192913a <.text+0x192813a>
14192916b: 4c 8b 58 08                 	movq	0x8(%rax), %r11
14192916f: 4c 89 c6                    	movq	%r8, %rsi
141929172: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
141929180: 0f 10 44 31 f0              	movups	-0x10(%rcx,%rsi), %xmm0
141929185: 0f 11 04 31                 	movups	%xmm0, (%rcx,%rsi)
141929189: 48 83 fe 10                 	cmpq	$0x10, %rsi
14192918d: 74 a1                       	je	0x141929130 <.text+0x1928130>
14192918f: 8b 7c 31 e0                 	movl	-0x20(%rcx,%rsi), %edi
141929193: 89 fb                       	movl	%edi, %ebx
141929195: c1 fb 1f                    	sarl	$0x1f, %ebx
141929198: d1 eb                       	shrl	%ebx
14192919a: 31 fb                       	xorl	%edi, %ebx
14192919c: 48 83 c6 f0                 	addq	$-0x10, %rsi
1419291a0: 41 39 da                    	cmpl	%ebx, %r10d
1419291a3: 7c db                       	jl	0x141929180 <.text+0x1928180>
1419291a5: 48 01 ce                    	addq	%rcx, %rsi
1419291a8: eb 89                       	jmp	0x141929133 <.text+0x1928133>
1419291aa: 0f 0b                       	ud2

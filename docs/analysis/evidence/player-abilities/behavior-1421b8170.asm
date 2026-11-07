
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1421b8170: 56                          	pushq	%rsi
1421b8171: 49 8d 40 ff                 	leaq	-0x1(%r8), %rax
1421b8175: 48 39 d0                    	cmpq	%rdx, %rax
1421b8178: 73 78                       	jae	0x1421b81f2 <.text+0x21b71f2>
1421b817a: 49 39 d0                    	cmpq	%rdx, %r8
1421b817d: 75 02                       	jne	0x1421b8181 <.text+0x21b7181>
1421b817f: 5e                          	popq	%rsi
1421b8180: c3                          	retq
1421b8181: 48 c1 e2 04                 	shlq	$0x4, %rdx
1421b8185: 48 01 ca                    	addq	%rcx, %rdx
1421b8188: 49 c1 e0 04                 	shlq	$0x4, %r8
1421b818c: 4a 8d 04 01                 	leaq	(%rcx,%r8), %rax
1421b8190: eb 25                       	jmp	0x1421b81b7 <.text+0x21b71b7>
1421b8192: 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00   	nopw	%cs:(%rax,%rax)
1421b81a0: 49 89 cb                    	movq	%rcx, %r11
1421b81a3: 4d 89 0b                    	movq	%r9, (%r11)
1421b81a6: 4d 89 53 08                 	movq	%r10, 0x8(%r11)
1421b81aa: 48 83 c0 10                 	addq	$0x10, %rax
1421b81ae: 49 83 c0 10                 	addq	$0x10, %r8
1421b81b2: 48 39 d0                    	cmpq	%rdx, %rax
1421b81b5: 74 c8                       	je	0x1421b817f <.text+0x21b717f>
1421b81b7: 4c 8b 08                    	movq	(%rax), %r9
1421b81ba: 4c 3b 48 f0                 	cmpq	-0x10(%rax), %r9
1421b81be: 73 ea                       	jae	0x1421b81aa <.text+0x21b71aa>
1421b81c0: 4c 8b 50 08                 	movq	0x8(%rax), %r10
1421b81c4: 4c 89 c6                    	movq	%r8, %rsi
1421b81c7: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
1421b81d0: 0f 10 44 31 f0              	movups	-0x10(%rcx,%rsi), %xmm0
1421b81d5: 0f 11 04 31                 	movups	%xmm0, (%rcx,%rsi)
1421b81d9: 48 83 fe 10                 	cmpq	$0x10, %rsi
1421b81dd: 74 c1                       	je	0x1421b81a0 <.text+0x21b71a0>
1421b81df: 4c 8d 5e f0                 	leaq	-0x10(%rsi), %r11
1421b81e3: 4c 3b 4c 31 e0              	cmpq	-0x20(%rcx,%rsi), %r9
1421b81e8: 4c 89 de                    	movq	%r11, %rsi
1421b81eb: 72 e3                       	jb	0x1421b81d0 <.text+0x21b71d0>
1421b81ed: 49 01 cb                    	addq	%rcx, %r11
1421b81f0: eb b1                       	jmp	0x1421b81a3 <.text+0x21b71a3>
1421b81f2: 0f 0b                       	ud2

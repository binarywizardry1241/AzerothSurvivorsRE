
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f4d00: 48 83 ec 28                 	subq	$0x28, %rsp
1454f4d04: 49 8d 40 ff                 	leaq	-0x1(%r8), %rax
1454f4d08: 48 39 d0                    	cmpq	%rdx, %rax
1454f4d0b: 0f 83 b2 00 00 00           	jae	0x1454f4dc3 <.text+0x54f3dc3>
1454f4d11: 49 39 d0                    	cmpq	%rdx, %r8
1454f4d14: 75 05                       	jne	0x1454f4d1b <.text+0x54f3d1b>
1454f4d16: 48 83 c4 28                 	addq	$0x28, %rsp
1454f4d1a: c3                          	retq
1454f4d1b: 48 c1 e2 05                 	shlq	$0x5, %rdx
1454f4d1f: 48 01 ca                    	addq	%rcx, %rdx
1454f4d22: 49 c1 e0 05                 	shlq	$0x5, %r8
1454f4d26: 4a 8d 04 01                 	leaq	(%rcx,%r8), %rax
1454f4d2a: eb 35                       	jmp	0x1454f4d61 <.text+0x54f3d61>
1454f4d2c: 0f 1f 40 00                 	nopl	(%rax)
1454f4d30: 49 89 cb                    	movq	%rcx, %r11
1454f4d33: 0f 28 44 24 10              	movaps	0x10(%rsp), %xmm0
1454f4d38: 41 0f 11 03                 	movups	%xmm0, (%r11)
1454f4d3c: 46 88 4c 11 f0              	movb	%r9b, -0x10(%rcx,%r10)
1454f4d41: 4c 8b 0c 24                 	movq	(%rsp), %r9
1454f4d45: 4c 8b 5c 24 07              	movq	0x7(%rsp), %r11
1454f4d4a: 4e 89 4c 11 f1              	movq	%r9, -0xf(%rcx,%r10)
1454f4d4f: 4e 89 5c 11 f8              	movq	%r11, -0x8(%rcx,%r10)
1454f4d54: 48 83 c0 20                 	addq	$0x20, %rax
1454f4d58: 49 83 c0 20                 	addq	$0x20, %r8
1454f4d5c: 48 39 d0                    	cmpq	%rdx, %rax
1454f4d5f: 74 b5                       	je	0x1454f4d16 <.text+0x54f3d16>
1454f4d61: 44 0f b6 48 10              	movzbl	0x10(%rax), %r9d
1454f4d66: 44 3a 48 f0                 	cmpb	-0x10(%rax), %r9b
1454f4d6a: 73 e8                       	jae	0x1454f4d54 <.text+0x54f3d54>
1454f4d6c: 0f 10 00                    	movups	(%rax), %xmm0
1454f4d6f: 0f 29 44 24 10              	movaps	%xmm0, 0x10(%rsp)
1454f4d74: 4c 8b 50 11                 	movq	0x11(%rax), %r10
1454f4d78: 4c 8b 58 18                 	movq	0x18(%rax), %r11
1454f4d7c: 4c 89 14 24                 	movq	%r10, (%rsp)
1454f4d80: 4c 89 5c 24 07              	movq	%r11, 0x7(%rsp)
1454f4d85: 4d 89 c3                    	movq	%r8, %r11
1454f4d88: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1454f4d90: 4d 89 da                    	movq	%r11, %r10
1454f4d93: 42 0f 10 44 19 e0           	movups	-0x20(%rcx,%r11), %xmm0
1454f4d99: 42 0f 10 4c 19 f0           	movups	-0x10(%rcx,%r11), %xmm1
1454f4d9f: 42 0f 11 4c 19 10           	movups	%xmm1, 0x10(%rcx,%r11)
1454f4da5: 42 0f 11 04 19              	movups	%xmm0, (%rcx,%r11)
1454f4daa: 49 83 fb 20                 	cmpq	$0x20, %r11
1454f4dae: 74 80                       	je	0x1454f4d30 <.text+0x54f3d30>
1454f4db0: 4d 8d 5a e0                 	leaq	-0x20(%r10), %r11
1454f4db4: 46 3a 4c 11 d0              	cmpb	-0x30(%rcx,%r10), %r9b
1454f4db9: 72 d5                       	jb	0x1454f4d90 <.text+0x54f3d90>
1454f4dbb: 49 01 cb                    	addq	%rcx, %r11
1454f4dbe: e9 70 ff ff ff              	jmp	0x1454f4d33 <.text+0x54f3d33>
1454f4dc3: 0f 0b                       	ud2

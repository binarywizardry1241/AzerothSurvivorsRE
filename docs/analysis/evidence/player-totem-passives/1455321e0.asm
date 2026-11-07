
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455321e0: 55                          	pushq	%rbp
1455321e1: 41 57                       	pushq	%r15
1455321e3: 41 56                       	pushq	%r14
1455321e5: 41 55                       	pushq	%r13
1455321e7: 41 54                       	pushq	%r12
1455321e9: 56                          	pushq	%rsi
1455321ea: 57                          	pushq	%rdi
1455321eb: 53                          	pushq	%rbx
1455321ec: 48 83 ec 48                 	subq	$0x48, %rsp
1455321f0: 48 8d 6c 24 40              	leaq	0x40(%rsp), %rbp
1455321f5: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
1455321fd: 48 89 ce                    	movq	%rcx, %rsi
145532200: 4c 8b 32                    	movq	(%rdx), %r14
145532203: 4c 8b 7a 08                 	movq	0x8(%rdx), %r15
145532207: 4d 39 fe                    	cmpq	%r15, %r14
14553220a: 74 59                       	je	0x145532265 <.text+0x5531265>
14553220c: 4c 8b 62 10                 	movq	0x10(%rdx), %r12
145532210: 49 8b 44 24 08              	movq	0x8(%r12), %rax
145532215: 49 69 4c 24 10 60 01 00 00  	imulq	$0x160, 0x10(%r12), %rcx # imm = 0x160
14553221e: 49 8b 3e                    	movq	(%r14), %rdi
145532221: 49 83 c6 08                 	addq	$0x8, %r14
145532225: 49 89 c8                    	movq	%rcx, %r8
145532228: 49 89 c1                    	movq	%rax, %r9
14553222b: 0f 1f 44 00 00              	nopl	(%rax,%rax)
145532230: 4d 85 c0                    	testq	%r8, %r8
145532233: 74 2b                       	je	0x145532260 <.text+0x5531260>
145532235: 4d 89 ca                    	movq	%r9, %r10
145532238: 49 81 c1 60 01 00 00        	addq	$0x160, %r9             # imm = 0x160
14553223f: 49 81 c0 a0 fe ff ff        	addq	$-0x160, %r8            # imm = 0xFEA0
145532246: 49 39 ba 88 00 00 00        	cmpq	%rdi, 0x88(%r10)
14553224d: 75 e1                       	jne	0x145532230 <.text+0x5531230>
14553224f: 41 f6 42 68 01              	testb	$0x1, 0x68(%r10)
145532254: 75 da                       	jne	0x145532230 <.text+0x5531230>
145532256: eb 29                       	jmp	0x145532281 <.text+0x5531281>
145532258: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
145532260: 4d 39 fe                    	cmpq	%r15, %r14
145532263: 75 b9                       	jne	0x14553221e <.text+0x553121e>
145532265: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
14553226c: 48 c7 46 08 08 00 00 00     	movq	$0x8, 0x8(%rsi)
145532274: 48 c7 46 10 00 00 00 00     	movq	$0x0, 0x10(%rsi)
14553227c: e9 06 01 00 00              	jmp	0x145532387 <.text+0x5531387>
145532281: 4c 89 32                    	movq	%r14, (%rdx)
145532284: e8 77 ff ac fa              	callq	0x140002200 <.text+0x1200>
145532289: b9 20 00 00 00              	movl	$0x20, %ecx
14553228e: ba 08 00 00 00              	movl	$0x8, %edx
145532293: e8 28 ff ac fa              	callq	0x1400021c0 <.text+0x11c0>
145532298: 48 85 c0                    	testq	%rax, %rax
14553229b: 0f 84 fa 00 00 00           	je	0x14553239b <.text+0x553139b>
1455322a1: 48 89 38                    	movq	%rdi, (%rax)
1455322a4: 48 c7 45 e8 04 00 00 00     	movq	$0x4, -0x18(%rbp)
1455322ac: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
1455322b0: 48 c7 45 f8 01 00 00 00     	movq	$0x1, -0x8(%rbp)
1455322b8: 4d 39 fe                    	cmpq	%r15, %r14
1455322bb: 0f 84 af 00 00 00           	je	0x145532370 <.text+0x5531370>
1455322c1: bf 01 00 00 00              	movl	$0x1, %edi
1455322c6: 48 8d 5d e8                 	leaq	-0x18(%rbp), %rbx
1455322ca: eb 18                       	jmp	0x1455322e4 <.text+0x55312e4>
1455322cc: 0f 1f 40 00                 	nopl	(%rax)
1455322d0: 4c 89 2c f8                 	movq	%r13, (%rax,%rdi,8)
1455322d4: 48 ff c7                    	incq	%rdi
1455322d7: 48 89 7d f8                 	movq	%rdi, -0x8(%rbp)
1455322db: 4d 39 fe                    	cmpq	%r15, %r14
1455322de: 0f 84 8c 00 00 00           	je	0x145532370 <.text+0x5531370>
1455322e4: 49 8b 4c 24 08              	movq	0x8(%r12), %rcx
1455322e9: 49 69 54 24 10 60 01 00 00  	imulq	$0x160, 0x10(%r12), %rdx # imm = 0x160
1455322f2: 4d 8b 2e                    	movq	(%r14), %r13
1455322f5: 49 83 c6 08                 	addq	$0x8, %r14
1455322f9: 49 89 d0                    	movq	%rdx, %r8
1455322fc: 49 89 c9                    	movq	%rcx, %r9
1455322ff: 90                          	nop
145532300: 4d 85 c0                    	testq	%r8, %r8
145532303: 74 2b                       	je	0x145532330 <.text+0x5531330>
145532305: 4d 89 ca                    	movq	%r9, %r10
145532308: 49 81 c1 60 01 00 00        	addq	$0x160, %r9             # imm = 0x160
14553230f: 49 81 c0 a0 fe ff ff        	addq	$-0x160, %r8            # imm = 0xFEA0
145532316: 4d 39 aa 88 00 00 00        	cmpq	%r13, 0x88(%r10)
14553231d: 75 e1                       	jne	0x145532300 <.text+0x5531300>
14553231f: 41 f6 42 68 01              	testb	$0x1, 0x68(%r10)
145532324: 75 da                       	jne	0x145532300 <.text+0x5531300>
145532326: eb 18                       	jmp	0x145532340 <.text+0x5531340>
145532328: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
145532330: 4d 39 fe                    	cmpq	%r15, %r14
145532333: 75 bd                       	jne	0x1455322f2 <.text+0x55312f2>
145532335: eb 39                       	jmp	0x145532370 <.text+0x5531370>
145532337: 66 0f 1f 84 00 00 00 00 00  	nopw	(%rax,%rax)
145532340: 48 3b 7d e8                 	cmpq	-0x18(%rbp), %rdi
145532344: 75 8a                       	jne	0x1455322d0 <.text+0x55312d0>
145532346: 48 c7 44 24 20 08 00 00 00  	movq	$0x8, 0x20(%rsp)
14553234f: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145532355: 41 b9 08 00 00 00           	movl	$0x8, %r9d
14553235b: 48 89 d9                    	movq	%rbx, %rcx
14553235e: 48 89 fa                    	movq	%rdi, %rdx
145532361: e8 da 59 22 00              	callq	0x145757d40 <.text+0x5756d40>
145532366: 90                          	nop
145532367: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
14553236b: e9 60 ff ff ff              	jmp	0x1455322d0 <.text+0x55312d0>
145532370: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
145532374: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
145532378: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
14553237c: 48 89 06                    	movq	%rax, (%rsi)
14553237f: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
145532383: 48 89 46 08                 	movq	%rax, 0x8(%rsi)
145532387: 48 89 f0                    	movq	%rsi, %rax
14553238a: 48 83 c4 48                 	addq	$0x48, %rsp
14553238e: 5b                          	popq	%rbx
14553238f: 5f                          	popq	%rdi
145532390: 5e                          	popq	%rsi
145532391: 41 5c                       	popq	%r12
145532393: 41 5d                       	popq	%r13
145532395: 41 5e                       	popq	%r14
145532397: 41 5f                       	popq	%r15
145532399: 5d                          	popq	%rbp
14553239a: c3                          	retq
14553239b: b9 08 00 00 00              	movl	$0x8, %ecx
1455323a0: ba 20 00 00 00              	movl	$0x20, %edx
1455323a5: e8 71 4e 3b 00              	callq	0x1458e721b <.text+0x58e621b>
1455323aa: 0f 0b                       	ud2

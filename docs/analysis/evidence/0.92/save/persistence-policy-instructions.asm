; Supplied0.92.0 EXE SHA-256 47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2
; Original x86_64 Windows instructions. Section labels are analyst descriptions.
; Bounded ranges may omit surrounding code; full function hashes are in persistence-policy.json.

; picker-input 0x140125b70..0x140126d27

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140125b70: 55                          	pushq	%rbp
140125b71: 41 57                       	pushq	%r15
140125b73: 41 56                       	pushq	%r14
140125b75: 41 55                       	pushq	%r13
140125b77: 41 54                       	pushq	%r12
140125b79: 56                          	pushq	%rsi
140125b7a: 57                          	pushq	%rdi
140125b7b: 53                          	pushq	%rbx
140125b7c: 48 81 ec 08 03 00 00        	subq	$0x308, %rsp            # imm = 0x308
140125b83: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
140125b8b: 0f 29 b5 70 02 00 00        	movaps	%xmm6, 0x270(%rbp)
140125b92: 48 c7 85 68 02 00 00 fe ff ff ff    	movq	$-0x2, 0x268(%rbp)
140125b9d: 48 8b 8d 20 03 00 00        	movq	0x320(%rbp), %rcx
140125ba4: 4c 8b 95 18 03 00 00        	movq	0x318(%rbp), %r10
140125bab: 4c 8b 9d 10 03 00 00        	movq	0x310(%rbp), %r11
140125bb2: 48 8b b5 08 03 00 00        	movq	0x308(%rbp), %rsi
140125bb9: 48 8b 9d 00 03 00 00        	movq	0x300(%rbp), %rbx
140125bc0: 4c 8b bd f8 02 00 00        	movq	0x2f8(%rbp), %r15
140125bc7: 4c 8b a5 f0 02 00 00        	movq	0x2f0(%rbp), %r12
140125bce: 4c 8b 32                    	movq	(%rdx), %r14
140125bd1: 49 8b 3c 24                 	movq	(%r12), %rdi
140125bd5: 83 3f 01                    	cmpl	$0x1, (%rdi)
140125bd8: 44 8b 6a 10                 	movl	0x10(%rdx), %r13d
140125bdc: 8b 42 14                    	movl	0x14(%rdx), %eax
140125bdf: 89 85 3c 02 00 00           	movl	%eax, 0x23c(%rbp)
140125be5: 49 8b 00                    	movq	(%r8), %rax
140125be8: 48 89 85 58 02 00 00        	movq	%rax, 0x258(%rbp)
140125bef: 48 8b 03                    	movq	(%rbx), %rax
140125bf2: 48 89 85 38 01 00 00        	movq	%rax, 0x138(%rbp)
140125bf9: 48 8b 06                    	movq	(%rsi), %rax
140125bfc: 48 89 85 00 02 00 00        	movq	%rax, 0x200(%rbp)
140125c03: b8 00 00 00 00              	movl	$0x0, %eax
140125c08: 75 15                       	jne	0x140125c1f <.text+0x124c1f>
140125c0a: f3 0f 10 05 52 29 78 05     	movss	0x5782952(%rip), %xmm0  # 0x1458a8564
140125c12: f3 0f c2 47 04 00           	cmpeqss	0x4(%rdi), %xmm0
140125c18: 66 0f 7e c0                 	movd	%xmm0, %eax
140125c1c: 83 e0 01                    	andl	$0x1, %eax
140125c1f: 48 89 85 f0 00 00 00        	movq	%rax, 0xf0(%rbp)
140125c26: 48 89 bd 30 01 00 00        	movq	%rdi, 0x130(%rbp)
140125c2d: 48 8b 7a 08                 	movq	0x8(%rdx), %rdi
140125c31: 8b 95 3c 02 00 00           	movl	0x23c(%rbp), %edx
140125c37: 44 29 ea                    	subl	%r13d, %edx
140125c3a: 81 fa 00 b0 33 c2           	cmpl	$0xc233b000, %edx       # imm = 0xC233B000
140125c40: b8 00 b0 33 c2              	movl	$0xc233b000, %eax       # imm = 0xC233B000
140125c45: 0f 42 c2                    	cmovbl	%edx, %eax
140125c48: 89 85 34 02 00 00           	movl	%eax, 0x234(%rbp)
140125c4e: 49 8b 40 10                 	movq	0x10(%r8), %rax
140125c52: 48 89 85 b8 01 00 00        	movq	%rax, 0x1b8(%rbp)
140125c59: 41 8b 40 1c                 	movl	0x1c(%r8), %eax
140125c5d: 89 85 38 02 00 00           	movl	%eax, 0x238(%rbp)
140125c63: 49 8b 01                    	movq	(%r9), %rax
140125c66: 48 89 85 08 02 00 00        	movq	%rax, 0x208(%rbp)
140125c6d: 49 8b 41 10                 	movq	0x10(%r9), %rax
140125c71: 48 89 85 f8 00 00 00        	movq	%rax, 0xf8(%rbp)
140125c78: 41 8b 41 1c                 	movl	0x1c(%r9), %eax
140125c7c: 89 85 ec 01 00 00           	movl	%eax, 0x1ec(%rbp)
140125c82: 49 8b 44 24 10              	movq	0x10(%r12), %rax
140125c87: 48 89 45 b8                 	movq	%rax, -0x48(%rbp)
140125c8b: 41 8b 44 24 1c              	movl	0x1c(%r12), %eax
140125c90: 89 85 14 01 00 00           	movl	%eax, 0x114(%rbp)
140125c96: 49 8b 07                    	movq	(%r15), %rax
140125c99: 48 89 85 f8 01 00 00        	movq	%rax, 0x1f8(%rbp)
140125ca0: 49 8b 47 10                 	movq	0x10(%r15), %rax
140125ca4: 48 89 85 48 01 00 00        	movq	%rax, 0x148(%rbp)
140125cab: 41 8b 47 1c                 	movl	0x1c(%r15), %eax
140125caf: 89 85 14 02 00 00           	movl	%eax, 0x214(%rbp)
140125cb5: 48 8b 43 10                 	movq	0x10(%rbx), %rax
140125cb9: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
140125cbd: 8b 43 1c                    	movl	0x1c(%rbx), %eax
140125cc0: 89 85 18 01 00 00           	movl	%eax, 0x118(%rbp)
140125cc6: 48 8b 46 10                 	movq	0x10(%rsi), %rax
140125cca: 48 89 45 d0                 	movq	%rax, -0x30(%rbp)
140125cce: 8b 46 1c                    	movl	0x1c(%rsi), %eax
140125cd1: 89 85 1c 01 00 00           	movl	%eax, 0x11c(%rbp)
140125cd7: 49 8b 03                    	movq	(%r11), %rax
140125cda: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
140125cde: 49 8b 43 10                 	movq	0x10(%r11), %rax
140125ce2: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
140125ce6: 41 8b 43 1c                 	movl	0x1c(%r11), %eax
140125cea: 89 85 20 01 00 00           	movl	%eax, 0x120(%rbp)
140125cf0: 49 8b 02                    	movq	(%r10), %rax
140125cf3: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
140125cf7: 49 8b 42 10                 	movq	0x10(%r10), %rax
140125cfb: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
140125cff: 41 8b 42 1c                 	movl	0x1c(%r10), %eax
140125d03: 89 85 24 01 00 00           	movl	%eax, 0x124(%rbp)
140125d09: 48 8b 01                    	movq	(%rcx), %rax
140125d0c: 48 89 85 40 01 00 00        	movq	%rax, 0x140(%rbp)
140125d13: 48 8b 85 28 03 00 00        	movq	0x328(%rbp), %rax
140125d1a: 48 8b 00                    	movq	(%rax), %rax
140125d1d: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
140125d21: 49 8b b6 f8 00 00 00        	movq	0xf8(%r14), %rsi
140125d28: 49 8b 86 00 01 00 00        	movq	0x100(%r14), %rax
140125d2f: 4c 8d 3c 86                 	leaq	(%rsi,%rax,4), %r15
140125d33: 0f 57 f6                    	xorps	%xmm6, %xmm6
140125d36: 45 0f b6 8e 08 01 00 00     	movzbl	0x108(%r14), %r9d
140125d3e: 48 8b 85 38 01 00 00        	movq	0x138(%rbp), %rax
140125d45: 48 8d 40 20                 	leaq	0x20(%rax), %rax
140125d49: 48 89 45 f8                 	movq	%rax, -0x8(%rbp)
140125d4d: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
140125d54: 48 8d 48 18                 	leaq	0x18(%rax), %rcx
140125d58: 48 89 8d 18 02 00 00        	movq	%rcx, 0x218(%rbp)
140125d5f: 48 8d 40 3b                 	leaq	0x3b(%rax), %rax
140125d63: 48 89 85 f0 01 00 00        	movq	%rax, 0x1f0(%rbp)
140125d6a: 48 8b 85 00 02 00 00        	movq	0x200(%rbp), %rax
140125d71: 48 8d 88 98 00 00 00        	leaq	0x98(%rax), %rcx
140125d78: 48 89 8d 00 01 00 00        	movq	%rcx, 0x100(%rbp)
140125d7f: 48 83 c0 30                 	addq	$0x30, %rax
140125d83: 48 89 85 08 01 00 00        	movq	%rax, 0x108(%rbp)
140125d8a: b8 08 00 00 00              	movl	$0x8, %eax
140125d8f: 48 89 85 b0 01 00 00        	movq	%rax, 0x1b0(%rbp)
140125d96: 48 c7 85 20 02 00 00 00 00 00 00    	movq	$0x0, 0x220(%rbp)
140125da1: 48 c7 85 28 02 00 00 00 00 00 00    	movq	$0x0, 0x228(%rbp)
140125dac: 45 31 ed                    	xorl	%r13d, %r13d
140125daf: 31 db                       	xorl	%ebx, %ebx
140125db1: 45 31 e4                    	xorl	%r12d, %r12d
140125db4: 44 88 8d 67 02 00 00        	movb	%r9b, 0x267(%rbp)
140125dbb: 45 84 c9                    	testb	%r9b, %r9b
140125dbe: 0f 84 dc 01 00 00           	je	0x140125fa0 <.text+0x124fa0>
140125dc4: 44 8b 85 3c 02 00 00        	movl	0x23c(%rbp), %r8d
140125dcb: 44 8b 8d 34 02 00 00        	movl	0x234(%rbp), %r9d
140125dd2: eb 51                       	jmp	0x140125e25 <.text+0x124e25>
140125dd4: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
140125de0: 48 c7 85 28 02 00 00 00 00 00 00    	movq	$0x0, 0x228(%rbp)
140125deb: 49 8b 96 20 01 00 00        	movq	0x120(%r14), %rdx
140125df2: e8 39 73 cf 04              	callq	0x144e1d130 <.text+0x4e1c130>
140125df7: 49 89 c5                    	movq	%rax, %r13
140125dfa: 48 8b 1b                    	movq	(%rbx), %rbx
140125dfd: 45 31 e4                    	xorl	%r12d, %r12d
140125e00: 44 8b 85 3c 02 00 00        	movl	0x23c(%rbp), %r8d
140125e07: 44 8b 8d 34 02 00 00        	movl	0x234(%rbp), %r9d
140125e0e: 44 89 e0                    	movl	%r12d, %eax
140125e11: 41 ff c4                    	incl	%r12d
140125e14: 44 89 c1                    	movl	%r8d, %ecx
140125e17: 41 2b 4c 85 00              	subl	(%r13,%rax,4), %ecx
140125e1c: 44 39 c9                    	cmpl	%r9d, %ecx
140125e1f: 0f 82 26 01 00 00           	jb	0x140125f4b <.text+0x124f4b>
140125e25: 41 39 dc                    	cmpl	%ebx, %r12d
140125e28: 75 e4                       	jne	0x140125e0e <.text+0x124e0e>
140125e2a: 4c 39 fe                    	cmpq	%r15, %rsi
140125e2d: 0f 84 09 01 00 00           	je	0x140125f3c <.text+0x124f3c>
140125e33: 8b 0e                       	movl	(%rsi), %ecx
140125e35: 48 83 c6 04                 	addq	$0x4, %rsi
140125e39: 48 8b 87 a8 01 00 00        	movq	0x1a8(%rdi), %rax
140125e40: 48 8d 14 c9                 	leaq	(%rcx,%rcx,8), %rdx
140125e44: 48 83 7c d0 10 00           	cmpq	$0x0, 0x10(%rax,%rdx,8)
140125e4a: 74 24                       	je	0x140125e70 <.text+0x124e70>
140125e4c: 48 8d 0c d0                 	leaq	(%rax,%rdx,8), %rcx
140125e50: 48 8d 1c d0                 	leaq	(%rax,%rdx,8), %rbx
140125e54: 48 83 c3 10                 	addq	$0x10, %rbx
140125e58: 49 8b 96 10 01 00 00        	movq	0x110(%r14), %rdx
140125e5f: 48 8b 41 40                 	movq	0x40(%rcx), %rax
140125e63: 48 39 c2                    	cmpq	%rax, %rdx
140125e66: 0f 83 84 00 00 00           	jae	0x140125ef0 <.text+0x124ef0>
140125e6c: eb 3c                       	jmp	0x140125eaa <.text+0x124eaa>
140125e6e: 66 90                       	nop
140125e70: 4c 39 fe                    	cmpq	%r15, %rsi
140125e73: 0f 84 c3 00 00 00           	je	0x140125f3c <.text+0x124f3c>
140125e79: 8b 0e                       	movl	(%rsi), %ecx
140125e7b: 48 83 c6 04                 	addq	$0x4, %rsi
140125e7f: 48 8b 87 a8 01 00 00        	movq	0x1a8(%rdi), %rax
140125e86: 48 8d 0c c9                 	leaq	(%rcx,%rcx,8), %rcx
140125e8a: 48 83 7c c8 10 00           	cmpq	$0x0, 0x10(%rax,%rcx,8)
140125e90: 74 de                       	je	0x140125e70 <.text+0x124e70>
140125e92: 48 8d 0c c8                 	leaq	(%rax,%rcx,8), %rcx
140125e96: 48 8d 59 10                 	leaq	0x10(%rcx), %rbx
140125e9a: 49 8b 96 10 01 00 00        	movq	0x110(%r14), %rdx
140125ea1: 48 8b 41 40                 	movq	0x40(%rcx), %rax
140125ea5: 48 39 c2                    	cmpq	%rax, %rdx
140125ea8: 73 46                       	jae	0x140125ef0 <.text+0x124ef0>
140125eaa: 4c 8b 41 38                 	movq	0x38(%rcx), %r8
140125eae: 49 8b 14 d0                 	movq	(%r8,%rdx,8), %rdx
140125eb2: 48 85 d2                    	testq	%rdx, %rdx
140125eb5: 74 39                       	je	0x140125ef0 <.text+0x124ef0>
140125eb7: 4c 8b 41 18                 	movq	0x18(%rcx), %r8
140125ebb: 48 f7 d2                    	notq	%rdx
140125ebe: 48 8d 14 52                 	leaq	(%rdx,%rdx,2), %rdx
140125ec2: 48 c1 e2 04                 	shlq	$0x4, %rdx
140125ec6: 49 8b 54 10 10              	movq	0x10(%r8,%rdx), %rdx
140125ecb: 48 89 95 20 02 00 00        	movq	%rdx, 0x220(%rbp)
140125ed2: 49 8b 96 18 01 00 00        	movq	0x118(%r14), %rdx
140125ed9: 48 39 c2                    	cmpq	%rax, %rdx
140125edc: 0f 83 fe fe ff ff           	jae	0x140125de0 <.text+0x124de0>
140125ee2: eb 27                       	jmp	0x140125f0b <.text+0x124f0b>
140125ee4: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
140125ef0: 48 c7 85 20 02 00 00 00 00 00 00    	movq	$0x0, 0x220(%rbp)
140125efb: 49 8b 96 18 01 00 00        	movq	0x118(%r14), %rdx
140125f02: 48 39 c2                    	cmpq	%rax, %rdx
140125f05: 0f 83 d5 fe ff ff           	jae	0x140125de0 <.text+0x124de0>
140125f0b: 48 8b 41 38                 	movq	0x38(%rcx), %rax
140125f0f: 48 8b 04 d0                 	movq	(%rax,%rdx,8), %rax
140125f13: 48 85 c0                    	testq	%rax, %rax
140125f16: 0f 84 c4 fe ff ff           	je	0x140125de0 <.text+0x124de0>
140125f1c: 48 8b 51 18                 	movq	0x18(%rcx), %rdx
140125f20: 48 f7 d0                    	notq	%rax
140125f23: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
140125f27: 48 c1 e0 04                 	shlq	$0x4, %rax
140125f2b: 48 8b 44 02 10              	movq	0x10(%rdx,%rax), %rax
140125f30: 48 89 85 28 02 00 00        	movq	%rax, 0x228(%rbp)
140125f37: e9 af fe ff ff              	jmp	0x140125deb <.text+0x124deb>
140125f3c: 41 89 dc                    	movl	%ebx, %r12d
140125f3f: 31 c9                       	xorl	%ecx, %ecx
140125f41: 48 85 c9                    	testq	%rcx, %rcx
140125f44: 75 27                       	jne	0x140125f6d <.text+0x124f6d>
140125f46: e9 fd 0b 00 00              	jmp	0x140126b48 <.text+0x125b48>
140125f4b: 48 8b 8d 20 02 00 00        	movq	0x220(%rbp), %rcx
140125f52: 48 01 c1                    	addq	%rax, %rcx
140125f55: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
140125f59: 48 8b 95 28 02 00 00        	movq	0x228(%rbp), %rdx
140125f60: 48 8d 04 c2                 	leaq	(%rdx,%rax,8), %rax
140125f64: 48 85 c9                    	testq	%rcx, %rcx
140125f67: 0f 84 db 0b 00 00           	je	0x140126b48 <.text+0x125b48>
140125f6d: 80 39 00                    	cmpb	$0x0, (%rcx)
140125f70: 0f 85 af fe ff ff           	jne	0x140125e25 <.text+0x124e25>
140125f76: 48 8b 8d 30 01 00 00        	movq	0x130(%rbp), %rcx
140125f7d: 83 39 01                    	cmpl	$0x1, (%rcx)
140125f80: 75 0e                       	jne	0x140125f90 <.text+0x124f90>
140125f82: f3 0f 10 41 04              	movss	0x4(%rcx), %xmm0
140125f87: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
140125f8a: 0f 83 95 fe ff ff           	jae	0x140125e25 <.text+0x124e25>
140125f90: 4c 8b 8d b0 01 00 00        	movq	0x1b0(%rbp), %r9
140125f97: e9 e4 01 00 00              	jmp	0x140126180 <.text+0x125180>
140125f9c: 0f 1f 40 00                 	nopl	(%rax)
140125fa0: 8b 95 3c 02 00 00           	movl	0x23c(%rbp), %edx
140125fa6: 44 8b 85 34 02 00 00        	movl	0x234(%rbp), %r8d
140125fad: 4c 8b 8d b0 01 00 00        	movq	0x1b0(%rbp), %r9
140125fb4: eb 5d                       	jmp	0x140126013 <.text+0x125013>
140125fb6: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
140125fc0: 48 c7 85 28 02 00 00 00 00 00 00    	movq	$0x0, 0x228(%rbp)
140125fcb: 49 8b 96 20 01 00 00        	movq	0x120(%r14), %rdx
140125fd2: e8 59 71 cf 04              	callq	0x144e1d130 <.text+0x4e1c130>
140125fd7: 49 89 c5                    	movq	%rax, %r13
140125fda: 4d 8b 4c 24 50              	movq	0x50(%r12), %r9
140125fdf: 48 8b 1b                    	movq	(%rbx), %rbx
140125fe2: 45 31 e4                    	xorl	%r12d, %r12d
140125fe5: 8b 95 3c 02 00 00           	movl	0x23c(%rbp), %edx
140125feb: 44 8b 85 34 02 00 00        	movl	0x234(%rbp), %r8d
140125ff2: 44 89 e0                    	movl	%r12d, %eax
140125ff5: 48 c1 e0 04                 	shlq	$0x4, %rax
140125ff9: 41 ff c4                    	incl	%r12d
140125ffc: 41 8b 44 01 08              	movl	0x8(%r9,%rax), %eax
140126001: f7 d0                       	notl	%eax
140126003: 89 d1                       	movl	%edx, %ecx
140126005: 41 2b 4c 85 00              	subl	(%r13,%rax,4), %ecx
14012600a: 44 39 c1                    	cmpl	%r8d, %ecx
14012600d: 0f 82 28 01 00 00           	jb	0x14012613b <.text+0x12513b>
140126013: 41 39 dc                    	cmpl	%ebx, %r12d
140126016: 75 da                       	jne	0x140125ff2 <.text+0x124ff2>
140126018: 4c 39 fe                    	cmpq	%r15, %rsi
14012601b: 0f 84 0b 01 00 00           	je	0x14012612c <.text+0x12512c>
140126021: 8b 0e                       	movl	(%rsi), %ecx
140126023: 48 83 c6 04                 	addq	$0x4, %rsi
140126027: 48 8b 87 08 01 00 00        	movq	0x108(%rdi), %rax
14012602e: 48 8d 0c 89                 	leaq	(%rcx,%rcx,4), %rcx
140126032: 48 c1 e1 05                 	shlq	$0x5, %rcx
140126036: 48 83 7c 08 58 00           	cmpq	$0x0, 0x58(%rax,%rcx)
14012603c: 74 12                       	je	0x140126050 <.text+0x125050>
14012603e: 4c 8d 24 08                 	leaq	(%rax,%rcx), %r12
140126042: 48 8d 1c 08                 	leaq	(%rax,%rcx), %rbx
140126046: 48 83 c3 58                 	addq	$0x58, %rbx
14012604a: eb 32                       	jmp	0x14012607e <.text+0x12507e>
14012604c: 0f 1f 40 00                 	nopl	(%rax)
140126050: 4c 39 fe                    	cmpq	%r15, %rsi
140126053: 0f 84 d3 00 00 00           	je	0x14012612c <.text+0x12512c>
140126059: 8b 06                       	movl	(%rsi), %eax
14012605b: 48 83 c6 04                 	addq	$0x4, %rsi
14012605f: 4c 8b a7 08 01 00 00        	movq	0x108(%rdi), %r12
140126066: 48 8d 04 80                 	leaq	(%rax,%rax,4), %rax
14012606a: 48 c1 e0 05                 	shlq	$0x5, %rax
14012606e: 49 83 7c 04 58 00           	cmpq	$0x0, 0x58(%r12,%rax)
140126074: 74 da                       	je	0x140126050 <.text+0x125050>
140126076: 49 01 c4                    	addq	%rax, %r12
140126079: 49 8d 5c 24 58              	leaq	0x58(%r12), %rbx
14012607e: 41 8b 84 24 94 00 00 00     	movl	0x94(%r12), %eax
140126086: 4c 8b 87 a8 01 00 00        	movq	0x1a8(%rdi), %r8
14012608d: 48 8d 04 c0                 	leaq	(%rax,%rax,8), %rax
140126091: 49 8d 0c c0                 	leaq	(%r8,%rax,8), %rcx
140126095: 49 8b 96 10 01 00 00        	movq	0x110(%r14), %rdx
14012609c: 49 8b 44 c0 40              	movq	0x40(%r8,%rax,8), %rax
1401260a1: 48 39 c2                    	cmpq	%rax, %rdx
1401260a4: 73 3a                       	jae	0x1401260e0 <.text+0x1250e0>
1401260a6: 4c 8b 41 38                 	movq	0x38(%rcx), %r8
1401260aa: 49 8b 14 d0                 	movq	(%r8,%rdx,8), %rdx
1401260ae: 48 85 d2                    	testq	%rdx, %rdx
1401260b1: 74 2d                       	je	0x1401260e0 <.text+0x1250e0>
1401260b3: 4c 8b 41 18                 	movq	0x18(%rcx), %r8
1401260b7: 48 f7 d2                    	notq	%rdx
1401260ba: 48 8d 14 52                 	leaq	(%rdx,%rdx,2), %rdx
1401260be: 48 c1 e2 04                 	shlq	$0x4, %rdx
1401260c2: 49 8b 54 10 10              	movq	0x10(%r8,%rdx), %rdx
1401260c7: 48 89 95 20 02 00 00        	movq	%rdx, 0x220(%rbp)
1401260ce: 49 8b 96 18 01 00 00        	movq	0x118(%r14), %rdx
1401260d5: 48 39 c2                    	cmpq	%rax, %rdx
1401260d8: 0f 83 e2 fe ff ff           	jae	0x140125fc0 <.text+0x124fc0>
1401260de: eb 1b                       	jmp	0x1401260fb <.text+0x1250fb>
1401260e0: 48 c7 85 20 02 00 00 00 00 00 00    	movq	$0x0, 0x220(%rbp)
1401260eb: 49 8b 96 18 01 00 00        	movq	0x118(%r14), %rdx
1401260f2: 48 39 c2                    	cmpq	%rax, %rdx
1401260f5: 0f 83 c5 fe ff ff           	jae	0x140125fc0 <.text+0x124fc0>
1401260fb: 48 8b 41 38                 	movq	0x38(%rcx), %rax
1401260ff: 48 8b 04 d0                 	movq	(%rax,%rdx,8), %rax
140126103: 48 85 c0                    	testq	%rax, %rax
140126106: 0f 84 b4 fe ff ff           	je	0x140125fc0 <.text+0x124fc0>
14012610c: 48 8b 51 18                 	movq	0x18(%rcx), %rdx
140126110: 48 f7 d0                    	notq	%rax
140126113: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
140126117: 48 c1 e0 04                 	shlq	$0x4, %rax
14012611b: 48 8b 44 02 10              	movq	0x10(%rdx,%rax), %rax
140126120: 48 89 85 28 02 00 00        	movq	%rax, 0x228(%rbp)
140126127: e9 9f fe ff ff              	jmp	0x140125fcb <.text+0x124fcb>
14012612c: 41 89 dc                    	movl	%ebx, %r12d
14012612f: 31 c9                       	xorl	%ecx, %ecx
140126131: 48 85 c9                    	testq	%rcx, %rcx
140126134: 75 27                       	jne	0x14012615d <.text+0x12515d>
140126136: e9 0d 0a 00 00              	jmp	0x140126b48 <.text+0x125b48>
14012613b: 48 8b 8d 20 02 00 00        	movq	0x220(%rbp), %rcx
140126142: 48 01 c1                    	addq	%rax, %rcx
140126145: 48 8d 04 40                 	leaq	(%rax,%rax,2), %rax
140126149: 4c 8b 95 28 02 00 00        	movq	0x228(%rbp), %r10
140126150: 49 8d 04 c2                 	leaq	(%r10,%rax,8), %rax
140126154: 48 85 c9                    	testq	%rcx, %rcx
140126157: 0f 84 eb 09 00 00           	je	0x140126b48 <.text+0x125b48>
14012615d: 80 39 00                    	cmpb	$0x0, (%rcx)
140126160: 0f 85 ad fe ff ff           	jne	0x140126013 <.text+0x125013>
140126166: 48 8b 8d 30 01 00 00        	movq	0x130(%rbp), %rcx
14012616d: 83 39 01                    	cmpl	$0x1, (%rcx)
140126170: 75 0e                       	jne	0x140126180 <.text+0x125180>
140126172: f3 0f 10 41 04              	movss	0x4(%rcx), %xmm0
140126177: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
14012617a: 0f 83 93 fe ff ff           	jae	0x140126013 <.text+0x125013>
140126180: 4c 89 8d b0 01 00 00        	movq	%r9, 0x1b0(%rbp)
140126187: 0f b6 08                    	movzbl	(%rax), %ecx
14012618a: 48 8d 15 d3 0b 7c 05        	leaq	0x57c0bd3(%rip), %rdx   # 0x1458e6d64
140126191: 48 63 0c 8a                 	movslq	(%rdx,%rcx,4), %rcx
140126195: 48 01 d1                    	addq	%rdx, %rcx
140126198: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
1401261a0: 48 89 ea                    	movq	%rbp, %rdx
1401261a3: ff e1                       	jmpq	*%rcx
1401261a5: 0f b6 40 01                 	movzbl	0x1(%rax), %eax
1401261a9: 88 85 4f 02 00 00           	movb	%al, 0x24f(%rbp)
1401261af: 48 8b 85 f8 00 00 00        	movq	0xf8(%rbp), %rax
1401261b6: 8b 8d ec 01 00 00           	movl	0x1ec(%rbp), %ecx
1401261bc: 89 08                       	movl	%ecx, (%rax)
1401261be: 48 8b 8d 08 02 00 00        	movq	0x208(%rbp), %rcx
1401261c5: 48 8b 95 58 02 00 00        	movq	0x258(%rbp), %rdx
1401261cc: e8 1f 36 2d 05              	callq	0x1453f97f0 <.text+0x53f87f0>
1401261d1: 48 8b 95 58 02 00 00        	movq	0x258(%rbp), %rdx
1401261d8: 0f b6 42 38                 	movzbl	0x38(%rdx), %eax
1401261dc: 88 85 50 02 00 00           	movb	%al, 0x250(%rbp)
1401261e2: 0f b6 42 39                 	movzbl	0x39(%rdx), %eax
1401261e6: 88 85 40 02 00 00           	movb	%al, 0x240(%rbp)
1401261ec: 0f b6 42 3a                 	movzbl	0x3a(%rdx), %eax
1401261f0: 88 85 66 02 00 00           	movb	%al, 0x266(%rbp)
1401261f6: 48 8d 8d 98 01 00 00        	leaq	0x198(%rbp), %rcx
1401261fd: e8 5e 3e 5a 05              	callq	0x1456ca060 <.text+0x56c9060>
140126202: 90                          	nop
140126203: 48 8d 8d c8 01 00 00        	leaq	0x1c8(%rbp), %rcx
14012620a: 48 8b 95 18 02 00 00        	movq	0x218(%rbp), %rdx
140126211: e8 4a 3e 5a 05              	callq	0x1456ca060 <.text+0x56c9060>
140126216: 90                          	nop
140126217: 48 8b 95 f0 01 00 00        	movq	0x1f0(%rbp), %rdx
14012621e: 0f b6 42 04                 	movzbl	0x4(%rdx), %eax
140126222: 4c 8d 45 08                 	leaq	0x8(%rbp), %r8
140126226: 41 88 40 3f                 	movb	%al, 0x3f(%r8)
14012622a: 8b 02                       	movl	(%rdx), %eax
14012622c: 41 89 40 3b                 	movl	%eax, 0x3b(%r8)
140126230: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
140126237: 48 8b 40 30                 	movq	0x30(%rax), %rax
14012623b: 48 8b 8d a8 01 00 00        	movq	0x1a8(%rbp), %rcx
140126242: 48 89 8d 60 01 00 00        	movq	%rcx, 0x160(%rbp)
140126249: 0f 10 85 98 01 00 00        	movups	0x198(%rbp), %xmm0
140126250: 0f 29 85 50 01 00 00        	movaps	%xmm0, 0x150(%rbp)
140126257: 48 8b 8d d8 01 00 00        	movq	0x1d8(%rbp), %rcx
14012625e: 48 8d 95 68 01 00 00        	leaq	0x168(%rbp), %rdx
140126265: 48 89 4a 10                 	movq	%rcx, 0x10(%rdx)
140126269: 0f 10 85 c8 01 00 00        	movups	0x1c8(%rbp), %xmm0
140126270: 0f 11 02                    	movups	%xmm0, (%rdx)
140126273: 0f 28 85 50 01 00 00        	movaps	0x150(%rbp), %xmm0
14012627a: 48 8b 8d 60 01 00 00        	movq	0x160(%rbp), %rcx
140126281: 48 8b 95 68 01 00 00        	movq	0x168(%rbp), %rdx
140126288: 0f 28 8d 70 01 00 00        	movaps	0x170(%rbp), %xmm1
14012628f: 41 0f 11 48 20              	movups	%xmm1, 0x20(%r8)
140126294: 49 89 48 10                 	movq	%rcx, 0x10(%r8)
140126298: 49 89 50 18                 	movq	%rdx, 0x18(%r8)
14012629c: 41 0f 11 00                 	movups	%xmm0, (%r8)
1401262a0: 48 89 45 38                 	movq	%rax, 0x38(%rbp)
1401262a4: 0f b6 85 50 02 00 00        	movzbl	0x250(%rbp), %eax
1401262ab: 88 45 40                    	movb	%al, 0x40(%rbp)
1401262ae: 0f b6 85 40 02 00 00        	movzbl	0x240(%rbp), %eax
1401262b5: 88 45 41                    	movb	%al, 0x41(%rbp)
1401262b8: 0f b6 85 66 02 00 00        	movzbl	0x266(%rbp), %eax
1401262bf: 88 45 42                    	movb	%al, 0x42(%rbp)
1401262c2: c7 45 00 0b 00 00 00        	movl	$0xb, (%rbp)
1401262c9: 48 8b 8d 40 01 00 00        	movq	0x140(%rbp), %rcx
1401262d0: 48 89 ea                    	movq	%rbp, %rdx
1401262d3: e8 98 b9 f3 ff              	callq	0x140061c70 <.text+0x60c70>
1401262d8: 48 8b 95 58 02 00 00        	movq	0x258(%rbp), %rdx
1401262df: 0f b6 42 38                 	movzbl	0x38(%rdx), %eax
1401262e3: 88 85 50 02 00 00           	movb	%al, 0x250(%rbp)
1401262e9: 0f b6 42 39                 	movzbl	0x39(%rdx), %eax
1401262ed: 88 85 40 02 00 00           	movb	%al, 0x240(%rbp)
1401262f3: 0f b6 42 3a                 	movzbl	0x3a(%rdx), %eax
1401262f7: 88 85 66 02 00 00           	movb	%al, 0x266(%rbp)
1401262fd: 48 8d 8d c8 01 00 00        	leaq	0x1c8(%rbp), %rcx
140126304: e8 57 3d 5a 05              	callq	0x1456ca060 <.text+0x56c9060>
140126309: 90                          	nop
14012630a: 48 8d 8d 50 01 00 00        	leaq	0x150(%rbp), %rcx
140126311: 48 8b 95 18 02 00 00        	movq	0x218(%rbp), %rdx
140126318: e8 43 3d 5a 05              	callq	0x1456ca060 <.text+0x56c9060>
14012631d: 90                          	nop
14012631e: 4c 8b 85 f0 01 00 00        	movq	0x1f0(%rbp), %r8
140126325: 41 0f b6 40 04              	movzbl	0x4(%r8), %eax
14012632a: 48 8d 55 08                 	leaq	0x8(%rbp), %rdx
14012632e: 88 42 37                    	movb	%al, 0x37(%rdx)
140126331: 41 8b 00                    	movl	(%r8), %eax
140126334: 89 42 33                    	movl	%eax, 0x33(%rdx)
140126337: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
14012633e: 48 8b 40 30                 	movq	0x30(%rax), %rax
140126342: 0f b6 8d 50 02 00 00        	movzbl	0x250(%rbp), %ecx
140126349: 88 4d 38                    	movb	%cl, 0x38(%rbp)
14012634c: 0f b6 8d 40 02 00 00        	movzbl	0x240(%rbp), %ecx
140126353: 88 4d 39                    	movb	%cl, 0x39(%rbp)
140126356: 0f b6 8d 66 02 00 00        	movzbl	0x266(%rbp), %ecx
14012635d: 88 4d 3a                    	movb	%cl, 0x3a(%rbp)
140126360: 48 8b 8d d8 01 00 00        	movq	0x1d8(%rbp), %rcx
140126367: 48 89 4d 10                 	movq	%rcx, 0x10(%rbp)
14012636b: 0f 10 85 c8 01 00 00        	movups	0x1c8(%rbp), %xmm0
140126372: 0f 29 45 00                 	movaps	%xmm0, (%rbp)
140126376: 48 8b 8d 60 01 00 00        	movq	0x160(%rbp), %rcx
14012637d: 48 89 4a 20                 	movq	%rcx, 0x20(%rdx)
140126381: 0f 10 85 50 01 00 00        	movups	0x150(%rbp), %xmm0
140126388: 0f 11 42 10                 	movups	%xmm0, 0x10(%rdx)
14012638c: 48 89 45 30                 	movq	%rax, 0x30(%rbp)
140126390: 48 8d 8d 50 01 00 00        	leaq	0x150(%rbp), %rcx
140126397: 48 8b 95 08 02 00 00        	movq	0x208(%rbp), %rdx
14012639e: 49 89 e8                    	movq	%rbp, %r8
1401263a1: 44 0f b6 8d 4f 02 00 00     	movzbl	0x24f(%rbp), %r9d
1401263a9: e8 72 30 2d 05              	callq	0x1453f9420 <.text+0x53f8420>
1401263ae: 48 8b 85 b8 01 00 00        	movq	0x1b8(%rbp), %rax
1401263b5: 8b 8d 38 02 00 00           	movl	0x238(%rbp), %ecx
1401263bb: 89 08                       	movl	%ecx, (%rax)
1401263bd: 48 8b 8d 58 02 00 00        	movq	0x258(%rbp), %rcx
1401263c4: 48 8b 11                    	movq	(%rcx), %rdx
1401263c7: 48 85 d2                    	testq	%rdx, %rdx
1401263ca: 74 1d                       	je	0x1401263e9 <.text+0x1253e9>
1401263cc: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
1401263d3: 48 8b 48 08                 	movq	0x8(%rax), %rcx
1401263d7: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1401263dd: e8 ee bd ed ff              	callq	0x1400021d0 <.text+0x11d0>
1401263e2: 48 8b 8d 58 02 00 00        	movq	0x258(%rbp), %rcx
1401263e9: 48 8b 85 18 02 00 00        	movq	0x218(%rbp), %rax
1401263f0: 48 8b 10                    	movq	(%rax), %rdx
1401263f3: 48 85 d2                    	testq	%rdx, %rdx
1401263f6: 74 1d                       	je	0x140126415 <.text+0x125415>
1401263f8: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
1401263ff: 48 8b 48 20                 	movq	0x20(%rax), %rcx
140126403: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140126409: e8 c2 bd ed ff              	callq	0x1400021d0 <.text+0x11d0>
14012640e: 48 8b 8d 58 02 00 00        	movq	0x258(%rbp), %rcx
140126415: 0f 10 85 50 01 00 00        	movups	0x150(%rbp), %xmm0
14012641c: 0f 10 8d 60 01 00 00        	movups	0x160(%rbp), %xmm1
140126423: 0f 10 95 70 01 00 00        	movups	0x170(%rbp), %xmm2
14012642a: 0f 10 9d 80 01 00 00        	movups	0x180(%rbp), %xmm3
140126431: 0f 11 59 30                 	movups	%xmm3, 0x30(%rcx)
140126435: 0f 11 51 20                 	movups	%xmm2, 0x20(%rcx)
140126439: 0f 11 49 10                 	movups	%xmm1, 0x10(%rcx)
14012643d: 0f 11 01                    	movups	%xmm0, (%rcx)
140126440: 48 8b 85 f8 00 00 00        	movq	0xf8(%rbp), %rax
140126447: 48 89 ca                    	movq	%rcx, %rdx
14012644a: 8b 8d ec 01 00 00           	movl	0x1ec(%rbp), %ecx
140126450: 89 08                       	movl	%ecx, (%rax)
140126452: 48 8b 8d 08 02 00 00        	movq	0x208(%rbp), %rcx
140126459: e8 92 33 2d 05              	callq	0x1453f97f0 <.text+0x53f87f0>
14012645e: 48 8b 95 58 02 00 00        	movq	0x258(%rbp), %rdx
140126465: 0f b6 42 38                 	movzbl	0x38(%rdx), %eax
140126469: 88 85 50 02 00 00           	movb	%al, 0x250(%rbp)
14012646f: 0f b6 42 39                 	movzbl	0x39(%rdx), %eax
140126473: 88 85 40 02 00 00           	movb	%al, 0x240(%rbp)
140126479: 0f b6 42 3a                 	movzbl	0x3a(%rdx), %eax
14012647d: 88 85 66 02 00 00           	movb	%al, 0x266(%rbp)
140126483: 48 8d 8d 98 01 00 00        	leaq	0x198(%rbp), %rcx
14012648a: e8 d1 3b 5a 05              	callq	0x1456ca060 <.text+0x56c9060>
14012648f: 90                          	nop
140126490: 48 8d 8d c8 01 00 00        	leaq	0x1c8(%rbp), %rcx
140126497: 48 8b 95 18 02 00 00        	movq	0x218(%rbp), %rdx
14012649e: e8 bd 3b 5a 05              	callq	0x1456ca060 <.text+0x56c9060>
1401264a3: 90                          	nop
1401264a4: 48 8b 8d f0 01 00 00        	movq	0x1f0(%rbp), %rcx
1401264ab: 0f b6 41 04                 	movzbl	0x4(%rcx), %eax
1401264af: 4c 8d 45 08                 	leaq	0x8(%rbp), %r8
1401264b3: 41 88 40 3f                 	movb	%al, 0x3f(%r8)
1401264b7: 8b 01                       	movl	(%rcx), %eax
1401264b9: 41 89 40 3b                 	movl	%eax, 0x3b(%r8)
1401264bd: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
1401264c4: 48 8b 40 30                 	movq	0x30(%rax), %rax
1401264c8: 48 8b 8d a8 01 00 00        	movq	0x1a8(%rbp), %rcx
1401264cf: 48 89 8d 60 01 00 00        	movq	%rcx, 0x160(%rbp)
1401264d6: 0f 10 85 98 01 00 00        	movups	0x198(%rbp), %xmm0
1401264dd: 0f 29 85 50 01 00 00        	movaps	%xmm0, 0x150(%rbp)
1401264e4: 48 8b 8d d8 01 00 00        	movq	0x1d8(%rbp), %rcx
1401264eb: 48 8d 95 68 01 00 00        	leaq	0x168(%rbp), %rdx
1401264f2: 48 89 4a 10                 	movq	%rcx, 0x10(%rdx)
1401264f6: 0f 10 85 c8 01 00 00        	movups	0x1c8(%rbp), %xmm0
1401264fd: 0f 11 02                    	movups	%xmm0, (%rdx)
140126500: 0f 28 85 50 01 00 00        	movaps	0x150(%rbp), %xmm0
140126507: 48 8b 8d 60 01 00 00        	movq	0x160(%rbp), %rcx
14012650e: 48 8b 95 68 01 00 00        	movq	0x168(%rbp), %rdx
140126515: 0f 28 8d 70 01 00 00        	movaps	0x170(%rbp), %xmm1
14012651c: 41 0f 11 48 20              	movups	%xmm1, 0x20(%r8)
140126521: 49 89 48 10                 	movq	%rcx, 0x10(%r8)
140126525: 49 89 50 18                 	movq	%rdx, 0x18(%r8)
140126529: 41 0f 11 00                 	movups	%xmm0, (%r8)
14012652d: 48 89 45 38                 	movq	%rax, 0x38(%rbp)
140126531: 0f b6 85 50 02 00 00        	movzbl	0x250(%rbp), %eax
140126538: 88 45 40                    	movb	%al, 0x40(%rbp)
14012653b: 0f b6 85 40 02 00 00        	movzbl	0x240(%rbp), %eax
140126542: 88 45 41                    	movb	%al, 0x41(%rbp)
140126545: 0f b6 85 66 02 00 00        	movzbl	0x266(%rbp), %eax
14012654c: 88 45 42                    	movb	%al, 0x42(%rbp)
14012654f: c7 45 00 0b 00 00 00        	movl	$0xb, (%rbp)
140126556: 48 8b 8d 40 01 00 00        	movq	0x140(%rbp), %rcx
14012655d: 48 89 ea                    	movq	%rbp, %rdx
140126560: e8 0b b7 f3 ff              	callq	0x140061c70 <.text+0x60c70>
140126565: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
14012656d: e9 49 f8 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
140126572: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
140126576: 0f b6 01                    	movzbl	(%rcx), %eax
140126579: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
14012657d: 44 8b 85 24 01 00 00        	movl	0x124(%rbp), %r8d
140126584: 44 89 02                    	movl	%r8d, (%rdx)
140126587: 34 01                       	xorb	$0x1, %al
140126589: 88 01                       	movb	%al, (%rcx)
14012658b: e9 2b f8 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
140126590: 0f b6 48 01                 	movzbl	0x1(%rax), %ecx
140126594: 88 8d 50 02 00 00           	movb	%cl, 0x250(%rbp)
14012659a: 0f b6 40 02                 	movzbl	0x2(%rax), %eax
14012659e: 88 85 40 02 00 00           	movb	%al, 0x240(%rbp)
1401265a4: 48 8b 85 48 01 00 00        	movq	0x148(%rbp), %rax
1401265ab: 8b 8d 14 02 00 00           	movl	0x214(%rbp), %ecx
1401265b1: 89 08                       	movl	%ecx, (%rax)
1401265b3: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
1401265ba: 44 0f b6 40 38              	movzbl	0x38(%rax), %r8d
1401265bf: 44 0f b6 48 39              	movzbl	0x39(%rax), %r9d
1401265c4: 48 89 d1                    	movq	%rdx, %rcx
1401265c7: 48 8b 95 08 02 00 00        	movq	0x208(%rbp), %rdx
1401265ce: e8 dd 86 2d 05              	callq	0x1453fecb0 <.text+0x53fdcb0>
1401265d3: 0f b6 95 40 02 00 00        	movzbl	0x240(%rbp), %edx
1401265da: 48 8b 85 f8 01 00 00        	movq	0x1f8(%rbp), %rax
1401265e1: c6 40 72 01                 	movb	$0x1, 0x72(%rax)
1401265e5: 44 0f b6 85 50 02 00 00     	movzbl	0x250(%rbp), %r8d
1401265ed: 44 88 40 76                 	movb	%r8b, 0x76(%rax)
1401265f1: 44 88 40 70                 	movb	%r8b, 0x70(%rax)
1401265f5: 88 50 71                    	movb	%dl, 0x71(%rax)
1401265f8: 31 c0                       	xorl	%eax, %eax
1401265fa: 41 80 f8 01                 	cmpb	$0x1, %r8b
1401265fe: 75 1a                       	jne	0x14012661a <.text+0x12561a>
140126600: 0f b6 ca                    	movzbl	%dl, %ecx
140126603: 80 fa 12                    	cmpb	$0x12, %dl
140126606: 0f 87 e7 06 00 00           	ja	0x140126cf3 <.text+0x125cf3>
14012660c: 8b 8c 8d 98 00 00 00        	movl	0x98(%rbp,%rcx,4), %ecx
140126613: 31 c0                       	xorl	%eax, %eax
140126615: 85 c9                       	testl	%ecx, %ecx
140126617: 0f 95 c0                    	setne	%al
14012661a: 48 8b 95 f8 01 00 00        	movq	0x1f8(%rbp), %rdx
140126621: 89 42 48                    	movl	%eax, 0x48(%rdx)
140126624: 89 4a 4c                    	movl	%ecx, 0x4c(%rdx)
140126627: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
14012662f: e9 87 f7 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
140126634: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
140126638: 8b 8d 20 01 00 00           	movl	0x120(%rbp), %ecx
14012663e: 89 08                       	movl	%ecx, (%rax)
140126640: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
140126644: c6 00 01                    	movb	$0x1, (%rax)
140126647: e9 6f f7 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
14012664c: 48 89 d1                    	movq	%rdx, %rcx
14012664f: e8 9c 40 ff ff              	callq	0x14011a6f0 <.text+0x1196f0>
140126654: 48 8b 85 b8 01 00 00        	movq	0x1b8(%rbp), %rax
14012665b: 8b 8d 38 02 00 00           	movl	0x238(%rbp), %ecx
140126661: 89 08                       	movl	%ecx, (%rax)
140126663: 48 8b 8d 58 02 00 00        	movq	0x258(%rbp), %rcx
14012666a: 48 8b 11                    	movq	(%rcx), %rdx
14012666d: 48 85 d2                    	testq	%rdx, %rdx
140126670: 74 1d                       	je	0x14012668f <.text+0x12568f>
140126672: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
140126679: 48 8b 48 08                 	movq	0x8(%rax), %rcx
14012667d: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140126683: e8 48 bb ed ff              	callq	0x1400021d0 <.text+0x11d0>
140126688: 48 8b 8d 58 02 00 00        	movq	0x258(%rbp), %rcx
14012668f: 48 8b 45 10                 	movq	0x10(%rbp), %rax
140126693: 48 89 41 10                 	movq	%rax, 0x10(%rcx)
140126697: 0f 10 45 00                 	movups	(%rbp), %xmm0
14012669b: 0f 11 01                    	movups	%xmm0, (%rcx)
14012669e: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
1401266a6: e9 10 f7 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
1401266ab: b0 01                       	movb	$0x1, %al
1401266ad: 48 89 85 f0 00 00 00        	movq	%rax, 0xf0(%rbp)
1401266b4: e9 02 f7 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
1401266b9: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
1401266bd: 8b 8d 18 01 00 00           	movl	0x118(%rbp), %ecx
1401266c3: 89 08                       	movl	%ecx, (%rax)
1401266c5: 48 8b 85 38 01 00 00        	movq	0x138(%rbp), %rax
1401266cc: 4c 8b 40 30                 	movq	0x30(%rax), %r8
1401266d0: 4c 8b 48 40                 	movq	0x40(%rax), %r9
1401266d4: 4c 3b 40 20                 	cmpq	0x20(%rax), %r8
1401266d8: 75 25                       	jne	0x1401266ff <.text+0x1256ff>
1401266da: 48 8b 4d f8                 	movq	-0x8(%rbp), %rcx
1401266de: 4c 89 85 50 02 00 00        	movq	%r8, 0x250(%rbp)
1401266e5: 4c 89 8d 40 02 00 00        	movq	%r9, 0x240(%rbp)
1401266ec: e8 bf 17 5f 05              	callq	0x145717eb0 <.text+0x5716eb0>
1401266f1: 4c 8b 8d 40 02 00 00        	movq	0x240(%rbp), %r9
1401266f8: 4c 8b 85 50 02 00 00        	movq	0x250(%rbp), %r8
1401266ff: 48 8b 95 38 01 00 00        	movq	0x138(%rbp), %rdx
140126706: 48 8b 42 28                 	movq	0x28(%rdx), %rax
14012670a: 4c 89 c1                    	movq	%r8, %rcx
14012670d: 48 c1 e1 04                 	shlq	$0x4, %rcx
140126711: 4c 89 0c 08                 	movq	%r9, (%rax,%rcx)
140126715: c6 44 08 08 00              	movb	$0x0, 0x8(%rax,%rcx)
14012671a: 49 ff c0                    	incq	%r8
14012671d: 4c 89 42 30                 	movq	%r8, 0x30(%rdx)
140126721: 48 ff 42 40                 	incq	0x40(%rdx)
140126725: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
14012672d: e9 89 f6 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
140126732: 48 8b 48 10                 	movq	0x10(%rax), %rcx
140126736: 48 85 c9                    	testq	%rcx, %rcx
140126739: 0f 88 a4 05 00 00           	js	0x140126ce3 <.text+0x125ce3>
14012673f: 48 89 8d 50 02 00 00        	movq	%rcx, 0x250(%rbp)
140126746: 0f 84 2a 03 00 00           	je	0x140126a76 <.text+0x125a76>
14012674c: 48 8b 40 08                 	movq	0x8(%rax), %rax
140126750: 48 89 85 40 02 00 00        	movq	%rax, 0x240(%rbp)
140126757: e8 a4 ba ed ff              	callq	0x140002200 <.text+0x1200>
14012675c: ba 01 00 00 00              	movl	$0x1, %edx
140126761: 48 8b 8d 50 02 00 00        	movq	0x250(%rbp), %rcx
140126768: e8 53 ba ed ff              	callq	0x1400021c0 <.text+0x11c0>
14012676d: 48 85 c0                    	testq	%rax, %rax
140126770: 0f 84 90 05 00 00           	je	0x140126d06 <.text+0x125d06>
140126776: 48 89 85 c0 01 00 00        	movq	%rax, 0x1c0(%rbp)
14012677d: 48 89 c1                    	movq	%rax, %rcx
140126780: 48 8b 95 40 02 00 00        	movq	0x240(%rbp), %rdx
140126787: 4c 8b 85 50 02 00 00        	movq	0x250(%rbp), %r8
14012678e: e8 6a e2 5e 05              	callq	0x1457149fd <.text+0x57139fd>
140126793: e9 ea 02 00 00              	jmp	0x140126a82 <.text+0x125a82>
140126798: 48 8b 85 48 01 00 00        	movq	0x148(%rbp), %rax
14012679f: 8b 8d 14 02 00 00           	movl	0x214(%rbp), %ecx
1401267a5: 89 08                       	movl	%ecx, (%rax)
1401267a7: 48 8b 85 f8 01 00 00        	movq	0x1f8(%rbp), %rax
1401267ae: c6 40 72 01                 	movb	$0x1, 0x72(%rax)
1401267b2: c6 40 76 04                 	movb	$0x4, 0x76(%rax)
1401267b6: e9 00 f6 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
1401267bb: 0f b6 50 01                 	movzbl	0x1(%rax), %edx
1401267bf: 48 8b 85 48 01 00 00        	movq	0x148(%rbp), %rax
1401267c6: 8b 8d 14 02 00 00           	movl	0x214(%rbp), %ecx
1401267cc: 89 08                       	movl	%ecx, (%rax)
1401267ce: 84 d2                       	testb	%dl, %dl
1401267d0: 0f 84 59 02 00 00           	je	0x140126a2f <.text+0x125a2f>
1401267d6: 48 8b 8d f8 01 00 00        	movq	0x1f8(%rbp), %rcx
1401267dd: e8 ae d1 f0 ff              	callq	0x140033990 <.text+0x32990>
1401267e2: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
1401267ea: e9 cc f5 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
1401267ef: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1401267f5: 48 89 d1                    	movq	%rdx, %rcx
1401267f8: 48 8d 15 95 e2 7b 05        	leaq	0x57be295(%rip), %rdx   # 0x1458e4a94
1401267ff: e8 4c 51 58 05              	callq	0x1456ab950 <.text+0x56aa950>
140126804: 90                          	nop
140126805: 41 b8 1c 00 00 00           	movl	$0x1c, %r8d
14012680b: 48 89 e9                    	movq	%rbp, %rcx
14012680e: 48 8d 15 87 e2 7b 05        	leaq	0x57be287(%rip), %rdx   # 0x1458e4a9c
140126815: e8 66 50 58 05              	callq	0x1456ab880 <.text+0x56aa880>
14012681a: 90                          	nop
14012681b: 48 8d 8d 50 01 00 00        	leaq	0x150(%rbp), %rcx
140126822: 48 89 ea                    	movq	%rbp, %rdx
140126825: e8 f6 7d 58 05              	callq	0x1456ae620 <.text+0x56ad620>
14012682a: 90                          	nop
14012682b: c6 85 65 02 00 00 01        	movb	$0x1, 0x265(%rbp)
140126832: 48 89 e9                    	movq	%rbp, %rcx
140126835: e8 76 78 fe ff              	callq	0x14010e0b0 <.text+0x10d0b0>
14012683a: 90                          	nop
14012683b: 83 bd 50 01 00 00 02        	cmpl	$0x2, 0x150(%rbp)
140126842: 0f 85 ce 01 00 00           	jne	0x140126a16 <.text+0x125a16>
140126848: 48 8b 85 58 01 00 00        	movq	0x158(%rbp), %rax
14012684f: 48 89 85 50 02 00 00        	movq	%rax, 0x250(%rbp)
140126856: 48 89 85 28 01 00 00        	movq	%rax, 0x128(%rbp)
14012685d: 48 8b 05 b4 8b 67 07        	movq	0x7678bb4(%rip), %rax   # 0x14779f418
140126864: 48 8b 00                    	movq	(%rax), %rax
140126867: 48 83 f8 03                 	cmpq	$0x3, %rax
14012686b: 0f 87 77 02 00 00           	ja	0x140126ae8 <.text+0x125ae8>
140126871: 0f b6 15 e8 d7 63 07        	movzbl	0x763d7e8(%rip), %edx   # 0x147764060
140126878: 0f b6 c2                    	movzbl	%dl, %eax
14012687b: 8d 48 ff                    	leal	-0x1(%rax), %ecx
14012687e: 83 f9 02                    	cmpl	$0x2, %ecx
140126881: 0f 83 5d 02 00 00           	jae	0x140126ae4 <.text+0x125ae4>
140126887: 48 8b 0d c2 d7 63 07        	movq	0x763d7c2(%rip), %rcx   # 0x147764050
14012688e: e8 5d 4f b0 04              	callq	0x144c2b7f0 <.text+0x4c2a7f0>
140126893: 90                          	nop
140126894: 84 c0                       	testb	%al, %al
140126896: 0f 84 4c 02 00 00           	je	0x140126ae8 <.text+0x125ae8>
14012689c: 48 8b 0d ad d7 63 07        	movq	0x763d7ad(%rip), %rcx   # 0x147764050
1401268a3: 48 8d 41 30                 	leaq	0x30(%rcx), %rax
1401268a7: 48 8d 15 0a e2 7b 05        	leaq	0x57be20a(%rip), %rdx   # 0x1458e4ab8
1401268ae: 48 89 95 c8 01 00 00        	movq	%rdx, 0x1c8(%rbp)
1401268b5: 48 8d 15 04 b8 ed ff        	leaq	-0x1247fc(%rip), %rdx   # 0x1400020c0 <.text+0x10c0>
1401268bc: 48 89 95 d0 01 00 00        	movq	%rdx, 0x1d0(%rbp)
1401268c3: 48 8d 95 28 01 00 00        	leaq	0x128(%rbp), %rdx
1401268ca: 48 89 95 d8 01 00 00        	movq	%rdx, 0x1d8(%rbp)
1401268d1: 48 8d 15 38 45 5b 05        	leaq	0x55b4538(%rip), %rdx   # 0x1456dae10 <.text+0x56d9e10>
1401268d8: 48 89 95 e0 01 00 00        	movq	%rdx, 0x1e0(%rbp)
1401268df: 48 8d 15 e2 e1 7b 05        	leaq	0x57be1e2(%rip), %rdx   # 0x1458e4ac8
1401268e6: 48 89 95 98 01 00 00        	movq	%rdx, 0x198(%rbp)
1401268ed: 48 8d 95 c8 01 00 00        	leaq	0x1c8(%rbp), %rdx
1401268f4: 48 89 95 a0 01 00 00        	movq	%rdx, 0x1a0(%rbp)
1401268fb: 48 8d 95 98 01 00 00        	leaq	0x198(%rbp), %rdx
140126902: 48 89 55 a8                 	movq	%rdx, -0x58(%rbp)
140126906: 48 8d 15 d3 a0 79 05        	leaq	0x579a0d3(%rip), %rdx   # 0x1458c09e0
14012690d: 48 89 55 b0                 	movq	%rdx, -0x50(%rbp)
140126911: 48 c7 45 00 01 00 00 00     	movq	$0x1, (%rbp)
140126919: 48 8d 55 a8                 	leaq	-0x58(%rbp), %rdx
14012691d: 48 89 55 08                 	movq	%rdx, 0x8(%rbp)
140126921: 48 c7 45 10 01 00 00 00     	movq	$0x1, 0x10(%rbp)
140126929: 48 89 45 18                 	movq	%rax, 0x18(%rbp)
14012692d: 48 89 ea                    	movq	%rbp, %rdx
140126930: e8 db 66 b0 04              	callq	0x144c2d010 <.text+0x4c2c010>
140126935: 90                          	nop
140126936: 48 8b 85 28 01 00 00        	movq	0x128(%rbp), %rax
14012693d: 48 89 85 50 02 00 00        	movq	%rax, 0x250(%rbp)
140126944: e9 9f 01 00 00              	jmp	0x140126ae8 <.text+0x125ae8>
140126949: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
14012694d: 8b 8d 1c 01 00 00           	movl	0x11c(%rbp), %ecx
140126953: 89 08                       	movl	%ecx, (%rax)
140126955: 48 8b 85 00 02 00 00        	movq	0x200(%rbp), %rax
14012695c: c6 80 90 01 00 00 01        	movb	$0x1, 0x190(%rax)
140126963: 48 8b 50 78                 	movq	0x78(%rax), %rdx
140126967: 48 83 fa ff                 	cmpq	$-0x1, %rdx
14012696b: 74 25                       	je	0x140126992 <.text+0x125992>
14012696d: 48 85 d2                    	testq	%rdx, %rdx
140126970: 74 20                       	je	0x140126992 <.text+0x125992>
140126972: 48 8b 85 00 02 00 00        	movq	0x200(%rbp), %rax
140126979: 48 8b 88 80 00 00 00        	movq	0x80(%rax), %rcx
140126980: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140126986: e8 45 b8 ed ff              	callq	0x1400021d0 <.text+0x11d0>
14012698b: 48 8b 85 00 02 00 00        	movq	0x200(%rbp), %rax
140126992: 48 c7 40 78 ff ff ff ff     	movq	$-0x1, 0x78(%rax)
14012699a: 48 8b 8d 00 01 00 00        	movq	0x100(%rbp), %rcx
1401269a1: e8 ca 47 04 00              	callq	0x14016b170 <.text+0x16a170>
1401269a6: 90                          	nop
1401269a7: 48 8b 85 00 02 00 00        	movq	0x200(%rbp), %rax
1401269ae: 48 c7 80 98 00 00 00 ff ff ff ff    	movq	$-0x1, 0x98(%rax)
1401269b9: c7 80 8c 01 00 00 00 00 00 00       	movl	$0x0, 0x18c(%rax)
1401269c3: 48 83 78 40 00              	cmpq	$0x0, 0x40(%rax)
1401269c8: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
1401269d0: 0f 85 e5 f3 ff ff           	jne	0x140125dbb <.text+0x124dbb>
1401269d6: 48 8b 85 08 01 00 00        	movq	0x108(%rbp), %rax
1401269dd: 48 83 38 00                 	cmpq	$0x0, (%rax)
1401269e1: 75 0c                       	jne	0x1401269ef <.text+0x1259ef>
1401269e3: 48 8b 8d 08 01 00 00        	movq	0x108(%rbp), %rcx
1401269ea: e8 b1 11 5f 05              	callq	0x145717ba0 <.text+0x5716ba0>
1401269ef: 48 8b 8d 00 02 00 00        	movq	0x200(%rbp), %rcx
1401269f6: 48 8b 41 38                 	movq	0x38(%rcx), %rax
1401269fa: 48 c7 00 00 00 00 00        	movq	$0x0, (%rax)
140126a01: 48 c7 41 40 01 00 00 00     	movq	$0x1, 0x40(%rcx)
140126a09: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
140126a11: e9 a5 f3 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
140126a16: 48 8d 8d 50 01 00 00        	leaq	0x150(%rbp), %rcx
140126a1d: e8 fe 58 fe ff              	callq	0x14010c320 <.text+0x10b320>
140126a22: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
140126a2a: e9 8c f3 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
140126a2f: 48 8b 85 58 02 00 00        	movq	0x258(%rbp), %rax
140126a36: 44 0f b6 40 38              	movzbl	0x38(%rax), %r8d
140126a3b: 44 0f b6 48 39              	movzbl	0x39(%rax), %r9d
140126a40: 48 89 e9                    	movq	%rbp, %rcx
140126a43: 48 8b 95 08 02 00 00        	movq	0x208(%rbp), %rdx
140126a4a: e8 61 82 2d 05              	callq	0x1453fecb0 <.text+0x53fdcb0>
140126a4f: 48 8b 85 f8 01 00 00        	movq	0x1f8(%rbp), %rax
140126a56: c6 40 72 01                 	movb	$0x1, 0x72(%rax)
140126a5a: c6 40 76 00                 	movb	$0x0, 0x76(%rax)
140126a5e: c6 40 70 00                 	movb	$0x0, 0x70(%rax)
140126a62: c7 40 48 00 00 00 00        	movl	$0x0, 0x48(%rax)
140126a69: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
140126a71: e9 45 f3 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
140126a76: b8 01 00 00 00              	movl	$0x1, %eax
140126a7b: 48 89 85 c0 01 00 00        	movq	%rax, 0x1c0(%rbp)
140126a82: 48 8b 85 b8 01 00 00        	movq	0x1b8(%rbp), %rax
140126a89: 8b 8d 38 02 00 00           	movl	0x238(%rbp), %ecx
140126a8f: 89 08                       	movl	%ecx, (%rax)
140126a91: 48 8b 85 18 02 00 00        	movq	0x218(%rbp), %rax
140126a98: 48 8b 10                    	movq	(%rax), %rdx
140126a9b: 48 85 d2                    	testq	%rdx, %rdx
140126a9e: 4c 8b 85 58 02 00 00        	movq	0x258(%rbp), %r8
140126aa5: 74 16                       	je	0x140126abd <.text+0x125abd>
140126aa7: 49 8b 48 20                 	movq	0x20(%r8), %rcx
140126aab: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140126ab1: e8 1a b7 ed ff              	callq	0x1400021d0 <.text+0x11d0>
140126ab6: 4c 8b 85 58 02 00 00        	movq	0x258(%rbp), %r8
140126abd: 48 8b 8d 50 02 00 00        	movq	0x250(%rbp), %rcx
140126ac4: 49 89 48 18                 	movq	%rcx, 0x18(%r8)
140126ac8: 48 8b 85 c0 01 00 00        	movq	0x1c0(%rbp), %rax
140126acf: 49 89 40 20                 	movq	%rax, 0x20(%r8)
140126ad3: 49 89 48 28                 	movq	%rcx, 0x28(%r8)
140126ad7: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
140126adf: e9 d7 f2 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
140126ae4: 85 c0                       	testl	%eax, %eax
140126ae6: 75 47                       	jne	0x140126b2f <.text+0x125b2f>
140126ae8: 48 8b 85 50 02 00 00        	movq	0x250(%rbp), %rax
140126aef: 83 e0 03                    	andl	$0x3, %eax
140126af2: 8d 48 fe                    	leal	-0x2(%rax), %ecx
140126af5: 83 f9 02                    	cmpl	$0x2, %ecx
140126af8: 72 28                       	jb	0x140126b22 <.text+0x125b22>
140126afa: 48 85 c0                    	testq	%rax, %rax
140126afd: 74 23                       	je	0x140126b22 <.text+0x125b22>
140126aff: 48 8d 4d 08                 	leaq	0x8(%rbp), %rcx
140126b03: 48 8b 85 50 02 00 00        	movq	0x250(%rbp), %rax
140126b0a: 48 ff c8                    	decq	%rax
140126b0d: 48 89 45 08                 	movq	%rax, 0x8(%rbp)
140126b11: c6 45 00 03                 	movb	$0x3, (%rbp)
140126b15: c6 85 65 02 00 00 00        	movb	$0x0, 0x265(%rbp)
140126b1c: e8 1f 60 5b 05              	callq	0x1456dcb40 <.text+0x56dbb40>
140126b21: 90                          	nop
140126b22: 44 0f b6 8d 67 02 00 00     	movzbl	0x267(%rbp), %r9d
140126b2a: e9 8c f2 ff ff              	jmp	0x140125dbb <.text+0x124dbb>
140126b2f: 48 8d 0d 1a d5 63 07        	leaq	0x763d51a(%rip), %rcx   # 0x147764050
140126b36: e8 c5 2c 73 05              	callq	0x145859800 <.text+0x5858800>
140126b3b: 90                          	nop
140126b3c: 89 c2                       	movl	%eax, %edx
140126b3e: 84 c0                       	testb	%al, %al
140126b40: 0f 85 41 fd ff ff           	jne	0x140126887 <.text+0x125887>
140126b46: eb a0                       	jmp	0x140126ae8 <.text+0x125ae8>
140126b48: f6 85 f0 00 00 00 01        	testb	$0x1, 0xf0(%rbp)
140126b4f: 0f 84 73 01 00 00           	je	0x140126cc8 <.text+0x125cc8>
140126b55: 4c 8b b5 58 02 00 00        	movq	0x258(%rbp), %r14
140126b5c: 49 8b 56 08                 	movq	0x8(%r14), %rdx
140126b60: 4d 8b 46 10                 	movq	0x10(%r14), %r8
140126b64: 48 89 e9                    	movq	%rbp, %rcx
140126b67: e8 74 c4 2d 05              	callq	0x145402fe0 <.text+0x5401fe0>
140126b6c: 48 8b 55 00                 	movq	(%rbp), %rdx
140126b70: 48 83 fa ff                 	cmpq	$-0x1, %rdx
140126b74: 74 24                       	je	0x140126b9a <.text+0x125b9a>
140126b76: 48 85 d2                    	testq	%rdx, %rdx
140126b79: 4c 8b bd f0 01 00 00        	movq	0x1f0(%rbp), %r15
140126b80: 4c 8b a5 18 02 00 00        	movq	0x218(%rbp), %r12
140126b87: 74 5d                       	je	0x140126be6 <.text+0x125be6>
140126b89: 48 8b 4d 08                 	movq	0x8(%rbp), %rcx
140126b8d: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140126b93: e8 38 b6 ed ff              	callq	0x1400021d0 <.text+0x11d0>
140126b98: eb 4c                       	jmp	0x140126be6 <.text+0x125be6>
140126b9a: 48 89 e9                    	movq	%rbp, %rcx
140126b9d: e8 4e 3b ff ff              	callq	0x14011a6f0 <.text+0x1196f0>
140126ba2: 48 8b 85 b8 01 00 00        	movq	0x1b8(%rbp), %rax
140126ba9: 8b 8d 38 02 00 00           	movl	0x238(%rbp), %ecx
140126baf: 89 08                       	movl	%ecx, (%rax)
140126bb1: 49 8b 16                    	movq	(%r14), %rdx
140126bb4: 48 85 d2                    	testq	%rdx, %rdx
140126bb7: 4c 8b bd f0 01 00 00        	movq	0x1f0(%rbp), %r15
140126bbe: 4c 8b a5 18 02 00 00        	movq	0x218(%rbp), %r12
140126bc5: 74 0f                       	je	0x140126bd6 <.text+0x125bd6>
140126bc7: 49 8b 4e 08                 	movq	0x8(%r14), %rcx
140126bcb: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140126bd1: e8 fa b5 ed ff              	callq	0x1400021d0 <.text+0x11d0>
140126bd6: 48 8b 45 10                 	movq	0x10(%rbp), %rax
140126bda: 49 89 46 10                 	movq	%rax, 0x10(%r14)
140126bde: 0f 10 45 00                 	movups	(%rbp), %xmm0
140126be2: 41 0f 11 06                 	movups	%xmm0, (%r14)
140126be6: 41 8a 5e 38                 	movb	0x38(%r14), %bl
140126bea: 41 8a 76 39                 	movb	0x39(%r14), %sil
140126bee: 41 8a 7e 3a                 	movb	0x3a(%r14), %dil
140126bf2: 48 8d 8d c8 01 00 00        	leaq	0x1c8(%rbp), %rcx
140126bf9: 4c 89 f2                    	movq	%r14, %rdx
140126bfc: e8 5f 34 5a 05              	callq	0x1456ca060 <.text+0x56c9060>
140126c01: 90                          	nop
140126c02: 48 8d 8d 50 01 00 00        	leaq	0x150(%rbp), %rcx
140126c09: 4c 89 e2                    	movq	%r12, %rdx
140126c0c: e8 4f 34 5a 05              	callq	0x1456ca060 <.text+0x56c9060>
140126c11: 90                          	nop
140126c12: 41 0f b6 47 04              	movzbl	0x4(%r15), %eax
140126c17: 88 45 3f                    	movb	%al, 0x3f(%rbp)
140126c1a: 41 8b 07                    	movl	(%r15), %eax
140126c1d: 89 45 3b                    	movl	%eax, 0x3b(%rbp)
140126c20: 49 8b 46 30                 	movq	0x30(%r14), %rax
140126c24: 88 5d 38                    	movb	%bl, 0x38(%rbp)
140126c27: 40 88 75 39                 	movb	%sil, 0x39(%rbp)
140126c2b: 40 88 7d 3a                 	movb	%dil, 0x3a(%rbp)
140126c2f: 48 8b 8d d8 01 00 00        	movq	0x1d8(%rbp), %rcx
140126c36: 48 89 4d 10                 	movq	%rcx, 0x10(%rbp)
140126c3a: 0f 10 85 c8 01 00 00        	movups	0x1c8(%rbp), %xmm0
140126c41: 0f 29 45 00                 	movaps	%xmm0, (%rbp)
140126c45: 48 8b 8d 60 01 00 00        	movq	0x160(%rbp), %rcx
140126c4c: 48 89 4d 28                 	movq	%rcx, 0x28(%rbp)
140126c50: 0f 10 85 50 01 00 00        	movups	0x150(%rbp), %xmm0
140126c57: 0f 11 45 18                 	movups	%xmm0, 0x18(%rbp)
140126c5b: 48 89 45 30                 	movq	%rax, 0x30(%rbp)
140126c5f: 48 8d b5 50 01 00 00        	leaq	0x150(%rbp), %rsi
140126c66: 48 89 ea                    	movq	%rbp, %rdx
140126c69: 48 89 f1                    	movq	%rsi, %rcx
140126c6c: e8 6f bb 2d 05              	callq	0x1454027e0 <.text+0x54017e0>
140126c71: 48 8d 4d 08                 	leaq	0x8(%rbp), %rcx
140126c75: 48 8b 95 08 02 00 00        	movq	0x208(%rbp), %rdx
140126c7c: 49 89 f0                    	movq	%rsi, %r8
140126c7f: e8 ac 24 2d 05              	callq	0x1453f9130 <.text+0x53f8130>
140126c84: c7 45 00 0a 00 00 00        	movl	$0xa, (%rbp)
140126c8b: 48 89 ea                    	movq	%rbp, %rdx
140126c8e: 48 8b 8d 40 01 00 00        	movq	0x140(%rbp), %rcx
140126c95: e8 d6 af f3 ff              	callq	0x140061c70 <.text+0x60c70>
140126c9a: 48 8b 4d b8                 	movq	-0x48(%rbp), %rcx
140126c9e: 8b 95 14 01 00 00           	movl	0x114(%rbp), %edx
140126ca4: 89 11                       	movl	%edx, (%rcx)
140126ca6: 48 8b 85 30 01 00 00        	movq	0x130(%rbp), %rax
140126cad: c6 40 0f 00                 	movb	$0x0, 0xf(%rax)
140126cb1: 4c 8b 45 c0                 	movq	-0x40(%rbp), %r8
140126cb5: f3 41 0f 10 40 5c           	movss	0x5c(%r8), %xmm0
140126cbb: 89 11                       	movl	%edx, (%rcx)
140126cbd: c7 00 01 00 00 00           	movl	$0x1, (%rax)
140126cc3: f3 0f 11 40 04              	movss	%xmm0, 0x4(%rax)
140126cc8: 0f 28 b5 70 02 00 00        	movaps	0x270(%rbp), %xmm6
140126ccf: 48 81 c4 08 03 00 00        	addq	$0x308, %rsp            # imm = 0x308
140126cd6: 5b                          	popq	%rbx
140126cd7: 5f                          	popq	%rdi
140126cd8: 5e                          	popq	%rsi
140126cd9: 41 5c                       	popq	%r12
140126cdb: 41 5d                       	popq	%r13
140126cdd: 41 5e                       	popq	%r14
140126cdf: 41 5f                       	popq	%r15
140126ce1: 5d                          	popq	%rbp
140126ce2: c3                          	retq
140126ce3: 31 c9                       	xorl	%ecx, %ecx
140126ce5: 48 8b 95 c0 01 00 00        	movq	0x1c0(%rbp), %rdx
140126cec: e8 9a ce 77 05              	callq	0x1458a3b8b <.text+0x58a2b8b>
140126cf1: 0f 0b                       	ud2
140126cf3: 4c 8d 05 96 4d 78 05        	leaq	0x5784d96(%rip), %r8    # 0x1458aba90
140126cfa: ba 13 00 00 00              	movl	$0x13, %edx
140126cff: e8 1f d2 77 05              	callq	0x1458a3f23 <.text+0x58a2f23>
140126d04: 0f 0b                       	ud2
140126d06: 48 8b 85 50 02 00 00        	movq	0x250(%rbp), %rax
140126d0d: 48 89 85 c0 01 00 00        	movq	%rax, 0x1c0(%rbp)
140126d14: b9 01 00 00 00              	movl	$0x1, %ecx
140126d19: 48 8b 95 c0 01 00 00        	movq	0x1c0(%rbp), %rdx
140126d20: e8 66 ce 77 05              	callq	0x1458a3b8b <.text+0x58a2b8b>
140126d25: 0f 0b                       	ud2


; name-typing 0x140128fe0..0x1401294de

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140128fe0: 55                          	pushq	%rbp
140128fe1: 41 57                       	pushq	%r15
140128fe3: 41 56                       	pushq	%r14
140128fe5: 41 55                       	pushq	%r13
140128fe7: 41 54                       	pushq	%r12
140128fe9: 56                          	pushq	%rsi
140128fea: 57                          	pushq	%rdi
140128feb: 53                          	pushq	%rbx
140128fec: 48 81 ec 98 00 00 00        	subq	$0x98, %rsp
140128ff3: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
140128ffb: 48 c7 45 10 fe ff ff ff     	movq	$-0x2, 0x10(%rbp)
140129003: 48 8b 1a                    	movq	(%rdx), %rbx
140129006: 48 8b 7a 08                 	movq	0x8(%rdx), %rdi
14012900a: 49 8b 00                    	movq	(%r8), %rax
14012900d: 80 78 0d 00                 	cmpb	$0x0, 0xd(%rax)
140129011: 74 30                       	je	0x140129043 <.text+0x128043>
140129013: 80 38 00                    	cmpb	$0x0, (%rax)
140129016: 75 2b                       	jne	0x140129043 <.text+0x128043>
140129018: 49 8b 01                    	movq	(%r9), %rax
14012901b: 80 78 72 00                 	cmpb	$0x0, 0x72(%rax)
14012901f: 75 22                       	jne	0x140129043 <.text+0x128043>
140129021: 48 8b 85 80 00 00 00        	movq	0x80(%rbp), %rax
140129028: 48 8b 00                    	movq	(%rax), %rax
14012902b: 80 b8 90 01 00 00 00        	cmpb	$0x0, 0x190(%rax)
140129032: 75 0f                       	jne	0x140129043 <.text+0x128043>
140129034: 48 8b 85 88 00 00 00        	movq	0x88(%rbp), %rax
14012903b: 48 8b 00                    	movq	(%rax), %rax
14012903e: 80 38 00                    	cmpb	$0x0, (%rax)
140129041: 74 1b                       	je	0x14012905e <.text+0x12805e>
140129043: 48 8b 47 40                 	movq	0x40(%rdi), %rax
140129047: 48 89 03                    	movq	%rax, (%rbx)
14012904a: 48 81 c4 98 00 00 00        	addq	$0x98, %rsp
140129051: 5b                          	popq	%rbx
140129052: 5f                          	popq	%rdi
140129053: 5e                          	popq	%rsi
140129054: 41 5c                       	popq	%r12
140129056: 41 5d                       	popq	%r13
140129058: 41 5e                       	popq	%r14
14012905a: 41 5f                       	popq	%r15
14012905c: 5d                          	popq	%rbp
14012905d: c3                          	retq
14012905e: 48 8b 85 90 00 00 00        	movq	0x90(%rbp), %rax
140129065: 48 8b 10                    	movq	(%rax), %rdx
140129068: 48 8b 48 10                 	movq	0x10(%rax), %rcx
14012906c: 48 89 4d e0                 	movq	%rcx, -0x20(%rbp)
140129070: 8b 40 1c                    	movl	0x1c(%rax), %eax
140129073: 89 45 f4                    	movl	%eax, -0xc(%rbp)
140129076: 48 8d 4d f8                 	leaq	-0x8(%rbp), %rcx
14012907a: 48 89 55 e8                 	movq	%rdx, -0x18(%rbp)
14012907e: e8 dd 0f 5a 05              	callq	0x1456ca060 <.text+0x56c9060>
140129083: 48 8b 03                    	movq	(%rbx), %rax
140129086: 45 31 c9                    	xorl	%r9d, %r9d
140129089: 48 89 c1                    	movq	%rax, %rcx
14012908c: 48 2b 4f 18                 	subq	0x18(%rdi), %rcx
140129090: 49 0f 42 c9                 	cmovbq	%r9, %rcx
140129094: 48 2b 47 38                 	subq	0x38(%rdi), %rax
140129098: 49 0f 42 c1                 	cmovbq	%r9, %rax
14012909c: 48 6b f1 58                 	imulq	$0x58, %rcx, %rsi
1401290a0: 48 03 77 08                 	addq	0x8(%rdi), %rsi
1401290a4: 48 8b 57 10                 	movq	0x10(%rdi), %rdx
1401290a8: 48 29 ca                    	subq	%rcx, %rdx
1401290ab: 49 0f 42 d1                 	cmovbq	%r9, %rdx
1401290af: b9 08 00 00 00              	movl	$0x8, %ecx
1401290b4: 48 0f 42 f1                 	cmovbq	%rcx, %rsi
1401290b8: 4c 6b e8 58                 	imulq	$0x58, %rax, %r13
1401290bc: 4c 03 6f 28                 	addq	0x28(%rdi), %r13
1401290c0: 4c 8b 47 30                 	movq	0x30(%rdi), %r8
1401290c4: 49 29 c0                    	subq	%rax, %r8
1401290c7: 4c 0f 42 e9                 	cmovbq	%rcx, %r13
1401290cb: 4d 0f 42 c1                 	cmovbq	%r9, %r8
1401290cf: 48 8b 47 40                 	movq	0x40(%rdi), %rax
1401290d3: 4c 29 c0                    	subq	%r8, %rax
1401290d6: 48 29 d0                    	subq	%rdx, %rax
1401290d9: 48 89 03                    	movq	%rax, (%rbx)
1401290dc: 4c 6b d2 58                 	imulq	$0x58, %rdx, %r10
1401290e0: 49 01 f2                    	addq	%rsi, %r10
1401290e3: 4d 6b d8 58                 	imulq	$0x58, %r8, %r11
1401290e7: 4d 01 eb                    	addq	%r13, %r11
1401290ea: 48 89 5d c8                 	movq	%rbx, -0x38(%rbp)
1401290ee: 4c 89 55 d0                 	movq	%r10, -0x30(%rbp)
1401290f2: 4c 89 5d d8                 	movq	%r11, -0x28(%rbp)
1401290f6: eb 18                       	jmp	0x140129110 <.text+0x128110>
1401290f8: 48 8b 5d c8                 	movq	-0x38(%rbp), %rbx
1401290fc: 4c 8b 55 d0                 	movq	-0x30(%rbp), %r10
140129100: 4c 8b 5d d8                 	movq	-0x28(%rbp), %r11
140129104: 66 66 66 2e 0f 1f 84 00 00 00 00 00 	nopw	%cs:(%rax,%rax)
140129110: 48 85 f6                    	testq	%rsi, %rsi
140129113: 74 1b                       	je	0x140129130 <.text+0x128130>
140129115: 4c 39 d6                    	cmpq	%r10, %rsi
140129118: 74 16                       	je	0x140129130 <.text+0x128130>
14012911a: 48 8d 4e 58                 	leaq	0x58(%rsi), %rcx
14012911e: 48 89 f0                    	movq	%rsi, %rax
140129121: 48 ff 03                    	incq	(%rbx)
140129124: 48 89 ce                    	movq	%rcx, %rsi
140129127: 80 78 54 00                 	cmpb	$0x0, 0x54(%rax)
14012912b: 75 e3                       	jne	0x140129110 <.text+0x128110>
14012912d: eb 28                       	jmp	0x140129157 <.text+0x128157>
14012912f: 90                          	nop
140129130: 4d 85 ed                    	testq	%r13, %r13
140129133: 0f 84 03 03 00 00           	je	0x14012943c <.text+0x12843c>
140129139: 4d 39 dd                    	cmpq	%r11, %r13
14012913c: 0f 84 fa 02 00 00           	je	0x14012943c <.text+0x12843c>
140129142: 4c 89 e8                    	movq	%r13, %rax
140129145: 49 83 c5 58                 	addq	$0x58, %r13
140129149: 31 c9                       	xorl	%ecx, %ecx
14012914b: 48 ff 03                    	incq	(%rbx)
14012914e: 48 89 ce                    	movq	%rcx, %rsi
140129151: 80 78 54 00                 	cmpb	$0x0, 0x54(%rax)
140129155: 75 b9                       	jne	0x140129110 <.text+0x128110>
140129157: 8b 48 08                    	movl	0x8(%rax), %ecx
14012915a: 83 f9 1c                    	cmpl	$0x1c, %ecx
14012915d: 74 2d                       	je	0x14012918c <.text+0x12818c>
14012915f: 85 c9                       	testl	%ecx, %ecx
140129161: 75 ad                       	jne	0x140129110 <.text+0x128110>
140129163: 0f b6 58 10                 	movzbl	0x10(%rax), %ebx
140129167: 48 8d 4b e9                 	leaq	-0x17(%rbx), %rcx
14012916b: 48 83 fb 18                 	cmpq	$0x18, %rbx
14012916f: ba 00 00 00 00              	movl	$0x0, %edx
140129174: 48 0f 42 ca                 	cmovbq	%rdx, %rcx
140129178: 48 85 c9                    	testq	%rcx, %rcx
14012917b: 74 6c                       	je	0x1401291e9 <.text+0x1281e9>
14012917d: 83 f9 01                    	cmpl	$0x1, %ecx
140129180: 75 79                       	jne	0x1401291fb <.text+0x1281fb>
140129182: 48 8b 78 18                 	movq	0x18(%rax), %rdi
140129186: 48 8b 58 20                 	movq	0x20(%rax), %rbx
14012918a: eb 7b                       	jmp	0x140129207 <.text+0x128207>
14012918c: 48 8b 45 08                 	movq	0x8(%rbp), %rax
140129190: 48 85 c0                    	testq	%rax, %rax
140129193: 0f 84 77 ff ff ff           	je	0x140129110 <.text+0x128110>
140129199: 4c 8b 4d 00                 	movq	(%rbp), %r9
14012919d: 48 c7 c1 ff ff ff ff        	movq	$-0x1, %rcx
1401291a4: 41 80 7c 01 ff 00           	cmpb	$0x0, -0x1(%r9,%rax)
1401291aa: 0f 89 80 02 00 00           	jns	0x140129430 <.text+0x128430>
1401291b0: 41 0f b6 54 01 fe           	movzbl	-0x2(%r9,%rax), %edx
1401291b6: 80 fa bf                    	cmpb	$-0x41, %dl
1401291b9: 0f 8f 3e 02 00 00           	jg	0x1401293fd <.text+0x1283fd>
1401291bf: 45 0f b6 44 01 fd           	movzbl	-0x3(%r9,%rax), %r8d
1401291c5: 41 80 f8 bf                 	cmpb	$-0x41, %r8b
1401291c9: 0f 8f 33 02 00 00           	jg	0x140129402 <.text+0x128402>
1401291cf: 45 0f b6 4c 01 fc           	movzbl	-0x4(%r9,%rax), %r9d
1401291d5: 41 83 e1 07                 	andl	$0x7, %r9d
1401291d9: 41 c1 e1 06                 	shll	$0x6, %r9d
1401291dd: 41 83 e0 3f                 	andl	$0x3f, %r8d
1401291e1: 45 09 c8                    	orl	%r9d, %r8d
1401291e4: e9 1d 02 00 00              	jmp	0x140129406 <.text+0x128406>
1401291e9: 80 fb 18                    	cmpb	$0x18, %bl
1401291ec: 0f 83 d2 02 00 00           	jae	0x1401294c4 <.text+0x1284c4>
1401291f2: 48 83 c0 11                 	addq	$0x11, %rax
1401291f6: 48 89 c7                    	movq	%rax, %rdi
1401291f9: eb 0c                       	jmp	0x140129207 <.text+0x128207>
1401291fb: 48 8b 78 18                 	movq	0x18(%rax), %rdi
1401291ff: 48 8b 58 20                 	movq	0x20(%rax), %rbx
140129203: 48 83 c7 10                 	addq	$0x10, %rdi
140129207: 48 01 fb                    	addq	%rdi, %rbx
14012920a: eb 18                       	jmp	0x140129224 <.text+0x128224>
14012920c: 80 c9 c0                    	orb	$-0x40, %cl
14012920f: 43 88 0c 37                 	movb	%cl, (%r15,%r14)
140129213: 43 88 44 37 01              	movb	%al, 0x1(%r15,%r14)
140129218: b8 02 00 00 00              	movl	$0x2, %eax
14012921d: 4c 01 f0                    	addq	%r14, %rax
140129220: 48 89 45 08                 	movq	%rax, 0x8(%rbp)
140129224: 48 39 df                    	cmpq	%rbx, %rdi
140129227: 0f 84 cb fe ff ff           	je	0x1401290f8 <.text+0x1280f8>
14012922d: 0f b6 0f                    	movzbl	(%rdi), %ecx
140129230: 44 0f b6 e1                 	movzbl	%cl, %r12d
140129234: 45 84 e4                    	testb	%r12b, %r12b
140129237: 78 07                       	js	0x140129240 <.text+0x128240>
140129239: 48 ff c7                    	incq	%rdi
14012923c: eb 62                       	jmp	0x1401292a0 <.text+0x1282a0>
14012923e: 66 90                       	nop
140129240: 44 89 e0                    	movl	%r12d, %eax
140129243: 83 e0 1f                    	andl	$0x1f, %eax
140129246: 0f b6 57 01                 	movzbl	0x1(%rdi), %edx
14012924a: 83 e2 3f                    	andl	$0x3f, %edx
14012924d: 41 80 fc df                 	cmpb	$-0x21, %r12b
140129251: 76 33                       	jbe	0x140129286 <.text+0x128286>
140129253: 44 0f b6 67 02              	movzbl	0x2(%rdi), %r12d
140129258: c1 e2 06                    	shll	$0x6, %edx
14012925b: 41 83 e4 3f                 	andl	$0x3f, %r12d
14012925f: 41 09 d4                    	orl	%edx, %r12d
140129262: 80 f9 f0                    	cmpb	$-0x10, %cl
140129265: 72 2d                       	jb	0x140129294 <.text+0x128294>
140129267: 0f b6 4f 03                 	movzbl	0x3(%rdi), %ecx
14012926b: 48 83 c7 04                 	addq	$0x4, %rdi
14012926f: 83 e0 07                    	andl	$0x7, %eax
140129272: c1 e0 12                    	shll	$0x12, %eax
140129275: 41 c1 e4 06                 	shll	$0x6, %r12d
140129279: 83 e1 3f                    	andl	$0x3f, %ecx
14012927c: 44 09 e1                    	orl	%r12d, %ecx
14012927f: 09 c1                       	orl	%eax, %ecx
140129281: 41 89 cc                    	movl	%ecx, %r12d
140129284: eb 1a                       	jmp	0x1401292a0 <.text+0x1282a0>
140129286: 48 83 c7 02                 	addq	$0x2, %rdi
14012928a: c1 e0 06                    	shll	$0x6, %eax
14012928d: 09 d0                       	orl	%edx, %eax
14012928f: 41 89 c4                    	movl	%eax, %r12d
140129292: eb 0c                       	jmp	0x1401292a0 <.text+0x1282a0>
140129294: 48 83 c7 03                 	addq	$0x3, %rdi
140129298: c1 e0 0c                    	shll	$0xc, %eax
14012929b: 41 09 c4                    	orl	%eax, %r12d
14012929e: 66 90                       	nop
1401292a0: 44 89 e0                    	movl	%r12d, %eax
1401292a3: 83 e0 df                    	andl	$-0x21, %eax
1401292a6: 83 c0 bf                    	addl	$-0x41, %eax
1401292a9: 83 f8 19                    	cmpl	$0x19, %eax
1401292ac: 0f 87 72 ff ff ff           	ja	0x140129224 <.text+0x128224>
1401292b2: 4c 8b 7d 00                 	movq	(%rbp), %r15
1401292b6: 4c 8b 75 08                 	movq	0x8(%rbp), %r14
1401292ba: 49 83 fe 20                 	cmpq	$0x20, %r14
1401292be: 73 10                       	jae	0x1401292d0 <.text+0x1282d0>
1401292c0: 4c 89 f9                    	movq	%r15, %rcx
1401292c3: 4c 89 f2                    	movq	%r14, %rdx
1401292c6: e8 35 94 5a 05              	callq	0x1456d2700 <.text+0x56d1700>
1401292cb: 90                          	nop
1401292cc: eb 0e                       	jmp	0x1401292dc <.text+0x1282dc>
1401292ce: 66 90                       	nop
1401292d0: 4c 89 f9                    	movq	%r15, %rcx
1401292d3: 4c 89 f2                    	movq	%r14, %rdx
1401292d6: e8 05 8e 5a 05              	callq	0x1456d20e0 <.text+0x56d10e0>
1401292db: 90                          	nop
1401292dc: 48 83 f8 0b                 	cmpq	$0xb, %rax
1401292e0: 0f 87 3e ff ff ff           	ja	0x140129224 <.text+0x128224>
1401292e6: 41 81 fc 80 00 00 00        	cmpl	$0x80, %r12d
1401292ed: 73 18                       	jae	0x140129307 <.text+0x128307>
1401292ef: 4c 39 75 f8                 	cmpq	%r14, -0x8(%rbp)
1401292f3: 0f 84 b4 00 00 00           	je	0x1401293ad <.text+0x1283ad>
1401292f9: 47 88 24 37                 	movb	%r12b, (%r15,%r14)
1401292fd: b8 01 00 00 00              	movl	$0x1, %eax
140129302: e9 16 ff ff ff              	jmp	0x14012921d <.text+0x12821d>
140129307: 41 81 fc 00 00 01 00        	cmpl	$0x10000, %r12d         # imm = 0x10000
14012930e: 41 b8 04 00 00 00           	movl	$0x4, %r8d
140129314: 49 83 d8 00                 	sbbq	$0x0, %r8
140129318: 41 81 fc 00 08 00 00        	cmpl	$0x800, %r12d           # imm = 0x800
14012931f: b8 02 00 00 00              	movl	$0x2, %eax
140129324: 4c 0f 42 c0                 	cmovbq	%rax, %r8
140129328: 48 8b 45 f8                 	movq	-0x8(%rbp), %rax
14012932c: 4c 29 f0                    	subq	%r14, %rax
14012932f: 49 39 c0                    	cmpq	%rax, %r8
140129332: 0f 87 a0 00 00 00           	ja	0x1401293d8 <.text+0x1283d8>
140129338: 44 89 e0                    	movl	%r12d, %eax
14012933b: 24 3f                       	andb	$0x3f, %al
14012933d: 0c 80                       	orb	$-0x80, %al
14012933f: 44 89 e1                    	movl	%r12d, %ecx
140129342: c1 e9 06                    	shrl	$0x6, %ecx
140129345: 41 81 fc 00 08 00 00        	cmpl	$0x800, %r12d           # imm = 0x800
14012934c: 0f 82 ba fe ff ff           	jb	0x14012920c <.text+0x12820c>
140129352: 80 e1 3f                    	andb	$0x3f, %cl
140129355: 80 c9 80                    	orb	$-0x80, %cl
140129358: 44 89 e2                    	movl	%r12d, %edx
14012935b: c1 ea 0c                    	shrl	$0xc, %edx
14012935e: 41 81 fc ff ff 00 00        	cmpl	$0xffff, %r12d          # imm = 0xFFFF
140129365: 77 1b                       	ja	0x140129382 <.text+0x128382>
140129367: 80 ca e0                    	orb	$-0x20, %dl
14012936a: 43 88 14 37                 	movb	%dl, (%r15,%r14)
14012936e: 43 88 4c 37 01              	movb	%cl, 0x1(%r15,%r14)
140129373: 43 88 44 37 02              	movb	%al, 0x2(%r15,%r14)
140129378: b8 03 00 00 00              	movl	$0x3, %eax
14012937d: e9 9b fe ff ff              	jmp	0x14012921d <.text+0x12821d>
140129382: 80 e2 3f                    	andb	$0x3f, %dl
140129385: 80 ca 80                    	orb	$-0x80, %dl
140129388: 41 c1 ec 12                 	shrl	$0x12, %r12d
14012938c: 41 80 cc f0                 	orb	$-0x10, %r12b
140129390: 47 88 24 37                 	movb	%r12b, (%r15,%r14)
140129394: 43 88 54 37 01              	movb	%dl, 0x1(%r15,%r14)
140129399: 43 88 4c 37 02              	movb	%cl, 0x2(%r15,%r14)
14012939e: 43 88 44 37 03              	movb	%al, 0x3(%r15,%r14)
1401293a3: b8 04 00 00 00              	movl	$0x4, %eax
1401293a8: e9 70 fe ff ff              	jmp	0x14012921d <.text+0x12821d>
1401293ad: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1401293b6: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1401293bc: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1401293c2: 48 8d 4d f8                 	leaq	-0x8(%rbp), %rcx
1401293c6: 4c 89 f2                    	movq	%r14, %rdx
1401293c9: e8 72 e4 5e 05              	callq	0x145717840 <.text+0x5716840>
1401293ce: 90                          	nop
1401293cf: 4c 8b 7d 00                 	movq	(%rbp), %r15
1401293d3: e9 21 ff ff ff              	jmp	0x1401292f9 <.text+0x1282f9>
1401293d8: 48 c7 44 24 20 01 00 00 00  	movq	$0x1, 0x20(%rsp)
1401293e1: 41 b9 01 00 00 00           	movl	$0x1, %r9d
1401293e7: 48 8d 4d f8                 	leaq	-0x8(%rbp), %rcx
1401293eb: 4c 89 f2                    	movq	%r14, %rdx
1401293ee: e8 4d e4 5e 05              	callq	0x145717840 <.text+0x5716840>
1401293f3: 90                          	nop
1401293f4: 4c 8b 7d 00                 	movq	(%rbp), %r15
1401293f8: e9 3b ff ff ff              	jmp	0x140129338 <.text+0x128338>
1401293fd: 83 e2 1f                    	andl	$0x1f, %edx
140129400: eb 0e                       	jmp	0x140129410 <.text+0x128410>
140129402: 41 83 e0 0f                 	andl	$0xf, %r8d
140129406: 41 c1 e0 06                 	shll	$0x6, %r8d
14012940a: 83 e2 3f                    	andl	$0x3f, %edx
14012940d: 44 09 c2                    	orl	%r8d, %edx
140129410: 83 fa 02                    	cmpl	$0x2, %edx
140129413: 72 1b                       	jb	0x140129430 <.text+0x128430>
140129415: 48 c7 c1 fe ff ff ff        	movq	$-0x2, %rcx
14012941c: 83 fa 20                    	cmpl	$0x20, %edx
14012941f: 72 0f                       	jb	0x140129430 <.text+0x128430>
140129421: 31 c9                       	xorl	%ecx, %ecx
140129423: 81 fa 00 04 00 00           	cmpl	$0x400, %edx            # imm = 0x400
140129429: 0f 92 c1                    	setb	%cl
14012942c: 48 83 c9 fc                 	orq	$-0x4, %rcx
140129430: 48 01 c1                    	addq	%rax, %rcx
140129433: 48 89 4d 08                 	movq	%rcx, 0x8(%rbp)
140129437: e9 d4 fc ff ff              	jmp	0x140129110 <.text+0x128110>
14012943c: 48 8b 7d 00                 	movq	(%rbp), %rdi
140129440: 48 8b 5d 08                 	movq	0x8(%rbp), %rbx
140129444: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
140129448: 48 3b 58 10                 	cmpq	0x10(%rax), %rbx
14012944c: 75 13                       	jne	0x140129461 <.text+0x128461>
14012944e: 48 8b 50 08                 	movq	0x8(%rax), %rdx
140129452: 48 89 f9                    	movq	%rdi, %rcx
140129455: 49 89 d8                    	movq	%rbx, %r8
140129458: e8 9a b5 5e 05              	callq	0x1457149f7 <.text+0x57139f7>
14012945d: 85 c0                       	testl	%eax, %eax
14012945f: 74 43                       	je	0x1401294a4 <.text+0x1284a4>
140129461: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
140129465: 48 89 fa                    	movq	%rdi, %rdx
140129468: 49 89 d8                    	movq	%rbx, %r8
14012946b: e8 50 17 ff ff              	callq	0x14011abc0 <.text+0x119bc0>
140129470: 90                          	nop
140129471: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
140129475: 8b 4d f4                    	movl	-0xc(%rbp), %ecx
140129478: 89 08                       	movl	%ecx, (%rax)
14012947a: 48 8b 75 e8                 	movq	-0x18(%rbp), %rsi
14012947e: 48 8b 16                    	movq	(%rsi), %rdx
140129481: 48 85 d2                    	testq	%rdx, %rdx
140129484: 74 0f                       	je	0x140129495 <.text+0x128495>
140129486: 48 8b 4e 08                 	movq	0x8(%rsi), %rcx
14012948a: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140129490: e8 3b 8d ed ff              	callq	0x1400021d0 <.text+0x11d0>
140129495: 48 8b 45 c0                 	movq	-0x40(%rbp), %rax
140129499: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
14012949d: 0f 10 45 b0                 	movups	-0x50(%rbp), %xmm0
1401294a1: 0f 11 06                    	movups	%xmm0, (%rsi)
1401294a4: 48 8b 55 f8                 	movq	-0x8(%rbp), %rdx
1401294a8: 48 85 d2                    	testq	%rdx, %rdx
1401294ab: 0f 84 99 fb ff ff           	je	0x14012904a <.text+0x12804a>
1401294b1: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1401294b7: 48 89 f9                    	movq	%rdi, %rcx
1401294ba: e8 11 8d ed ff              	callq	0x1400021d0 <.text+0x11d0>
1401294bf: e9 86 fb ff ff              	jmp	0x14012904a <.text+0x12804a>
1401294c4: 4c 8d 0d 5d ae 7b 05        	leaq	0x57bae5d(%rip), %r9    # 0x1458e4328
1401294cb: 41 b8 17 00 00 00           	movl	$0x17, %r8d
1401294d1: 31 c9                       	xorl	%ecx, %ecx
1401294d3: 48 89 da                    	movq	%rbx, %rdx
1401294d6: e8 55 ac 77 05              	callq	0x1458a4130 <.text+0x58a3130>
1401294db: 90                          	nop
1401294dc: 0f 0b                       	ud2


; class-icon-action-spawn 0x140200358..0x140200483

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140200358: 4c 8d ad 28 05 00 00        	leaq	0x528(%rbp), %r13
14020035f: 41 80 3c 24 00              	cmpb	$0x0, (%r12)
140200364: 75 0a                       	jne	0x140200370 <.text+0x1ff370>
140200366: f3 0f 10 35 b2 80 6a 05     	movss	0x56a80b2(%rip), %xmm6  # 0x1458a8420
14020036e: eb 08                       	jmp	0x140200378 <.text+0x1ff378>
140200370: f3 0f 10 35 ac 2c 6f 05     	movss	0x56f2cac(%rip), %xmm6  # 0x1458f3024
140200378: 4c 8d 75 d0                 	leaq	-0x30(%rbp), %r14
14020037c: 48 8d 95 70 02 00 00        	leaq	0x270(%rbp), %rdx
140200383: 41 b8 80 01 00 00           	movl	$0x180, %r8d            # imm = 0x180
140200389: 4c 89 f1                    	movq	%r14, %rcx
14020038c: e8 6c 46 51 05              	callq	0x1457149fd <.text+0x57139fd>
140200391: 0f 28 85 50 05 00 00        	movaps	0x550(%rbp), %xmm0
140200398: 0f 28 8d 60 05 00 00        	movaps	0x560(%rbp), %xmm1
14020039f: 0f 28 95 70 05 00 00        	movaps	0x570(%rbp), %xmm2
1402003a6: 0f 28 9d 80 05 00 00        	movaps	0x580(%rbp), %xmm3
1402003ad: 0f 11 85 f0 01 00 00        	movups	%xmm0, 0x1f0(%rbp)
1402003b4: 0f 11 8d 00 02 00 00        	movups	%xmm1, 0x200(%rbp)
1402003bb: 0f 11 95 10 02 00 00        	movups	%xmm2, 0x210(%rbp)
1402003c2: 0f 11 9d 20 02 00 00        	movups	%xmm3, 0x220(%rbp)
1402003c9: 0f 28 85 90 05 00 00        	movaps	0x590(%rbp), %xmm0
1402003d0: 0f 11 85 30 02 00 00        	movups	%xmm0, 0x230(%rbp)
1402003d7: 0f 10 05 da 34 6f 05        	movups	0x56f34da(%rip), %xmm0  # 0x1458f38b8
1402003de: 0f 11 85 40 02 00 00        	movups	%xmm0, 0x240(%rbp)
1402003e5: c7 85 50 02 00 00 00 00 80 3f       	movl	$0x3f800000, 0x250(%rbp) # imm = 0x3F800000
1402003ef: 48 8d 8d 68 01 00 00        	leaq	0x168(%rbp), %rcx
1402003f6: 48 8d 95 a0 05 00 00        	leaq	0x5a0(%rbp), %rdx
1402003fd: 41 b8 88 00 00 00           	movl	$0x88, %r8d
140200403: e8 f5 45 51 05              	callq	0x1457149fd <.text+0x57139fd>
140200408: 0f 10 85 30 06 00 00        	movups	0x630(%rbp), %xmm0
14020040f: 0f 11 85 50 01 00 00        	movups	%xmm0, 0x150(%rbp)
140200416: 48 8b 85 40 06 00 00        	movq	0x640(%rbp), %rax
14020041d: 48 89 85 60 01 00 00        	movq	%rax, 0x160(%rbp)
140200424: 0f 10 05 8d 35 6f 05        	movups	0x56f358d(%rip), %xmm0  # 0x1458f39b8
14020042b: 0f 11 85 54 02 00 00        	movups	%xmm0, 0x254(%rbp)
140200432: 48 8d 8d 78 02 00 00        	leaq	0x278(%rbp), %rcx
140200439: 41 b8 94 02 00 00           	movl	$0x294, %r8d            # imm = 0x294
14020043f: 4c 89 f2                    	movq	%r14, %rdx
140200442: e8 b6 45 51 05              	callq	0x1457149fd <.text+0x57139fd>
140200447: f3 0f 11 b5 0c 05 00 00     	movss	%xmm6, 0x50c(%rbp)
14020044f: f3 0f 11 b5 10 05 00 00     	movss	%xmm6, 0x510(%rbp)
140200457: f3 0f 10 05 c1 7f 6a 05     	movss	0x56a7fc1(%rip), %xmm0  # 0x1458a8420
14020045f: 0f 13 85 14 05 00 00        	movlps	%xmm0, 0x514(%rbp)
140200466: 4c 89 bd 70 02 00 00        	movq	%r15, 0x270(%rbp)
14020046d: 48 8d 8d a0 05 00 00        	leaq	0x5a0(%rbp), %rcx
140200474: 4c 8d 85 70 02 00 00        	leaq	0x270(%rbp), %r8
14020047b: 4c 89 ea                    	movq	%r13, %rdx
14020047e: e8 4d 16 fa ff              	callq	0x1401a1ad0 <.text+0x1a0ad0>


; pick-destructor 0x140091ec0..0x140091f02

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140091ec0: 56                          	pushq	%rsi
140091ec1: 48 83 ec 20                 	subq	$0x20, %rsp
140091ec5: 48 89 ce                    	movq	%rcx, %rsi
140091ec8: 48 8b 11                    	movq	(%rcx), %rdx
140091ecb: 48 85 d2                    	testq	%rdx, %rdx
140091ece: 74 0f                       	je	0x140091edf <.text+0x90edf>
140091ed0: 48 8b 4e 08                 	movq	0x8(%rsi), %rcx
140091ed4: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140091eda: e8 f1 02 f7 ff              	callq	0x1400021d0 <.text+0x11d0>
140091edf: 48 8b 56 18                 	movq	0x18(%rsi), %rdx
140091ee3: 48 85 d2                    	testq	%rdx, %rdx
140091ee6: 74 14                       	je	0x140091efc <.text+0x90efc>
140091ee8: 48 8b 4e 20                 	movq	0x20(%rsi), %rcx
140091eec: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140091ef2: 48 83 c4 20                 	addq	$0x20, %rsp
140091ef6: 5e                          	popq	%rsi
140091ef7: e9 d4 02 f7 ff              	jmp	0x1400021d0 <.text+0x11d0>
140091efc: 48 83 c4 20                 	addq	$0x20, %rsp
140091f00: 5e                          	popq	%rsi
140091f01: c3                          	retq


; core-queue-producer 0x140061c70..0x140061d2b

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140061c70: 55                          	pushq	%rbp
140061c71: 56                          	pushq	%rsi
140061c72: 57                          	pushq	%rdi
140061c73: 53                          	pushq	%rbx
140061c74: 48 83 ec 48                 	subq	$0x48, %rsp
140061c78: 48 8d 6c 24 40              	leaq	0x40(%rsp), %rbp
140061c7d: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
140061c85: 48 89 55 f0                 	movq	%rdx, -0x10(%rbp)
140061c89: c6 45 ff 01                 	movb	$0x1, -0x1(%rbp)
140061c8d: e8 fe 03 60 00              	callq	0x140662090 <.text+0x661090>
140061c92: 90                          	nop
140061c93: 89 d3                       	movl	%edx, %ebx
140061c95: 48 8b 70 38                 	movq	0x38(%rax), %rsi
140061c99: 48 3b 70 28                 	cmpq	0x28(%rax), %rsi
140061c9d: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
140061ca1: 75 15                       	jne	0x140061cb8 <.text+0x60cb8>
140061ca3: 89 d8                       	movl	%ebx, %eax
140061ca5: 24 01                       	andb	$0x1, %al
140061ca7: 88 45 fe                    	movb	%al, -0x2(%rbp)
140061caa: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
140061cae: 48 83 c1 28                 	addq	$0x28, %rcx
140061cb2: e8 29 71 6b 05              	callq	0x145718de0 <.text+0x5717de0>
140061cb7: 90                          	nop
140061cb8: 48 69 ce e8 00 00 00        	imulq	$0xe8, %rsi, %rcx
140061cbf: 48 8b 7d e8                 	movq	-0x18(%rbp), %rdi
140061cc3: 48 03 4f 30                 	addq	0x30(%rdi), %rcx
140061cc7: 41 b8 e8 00 00 00           	movl	$0xe8, %r8d
140061ccd: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
140061cd1: e8 27 2d 6b 05              	callq	0x1457149fd <.text+0x57139fd>
140061cd6: 48 ff c6                    	incq	%rsi
140061cd9: 48 89 77 38                 	movq	%rsi, 0x38(%rdi)
140061cdd: f6 c3 01                    	testb	$0x1, %bl
140061ce0: 48 89 fe                    	movq	%rdi, %rsi
140061ce3: 75 12                       	jne	0x140061cf7 <.text+0x60cf7>
140061ce5: 48 8b 05 a4 af 74 07        	movq	0x774afa4(%rip), %rax   # 0x1477acc90
140061cec: 48 8b 00                    	movq	(%rax), %rax
140061cef: 48 d1 e0                    	shlq	%rax
140061cf2: 48 85 c0                    	testq	%rax, %rax
140061cf5: 75 20                       	jne	0x140061d17 <.text+0x60d17>
140061cf7: 31 c0                       	xorl	%eax, %eax
140061cf9: 86 06                       	xchgb	%al, (%rsi)
140061cfb: 3c 02                       	cmpb	$0x2, %al
140061cfd: 74 09                       	je	0x140061d08 <.text+0x60d08>
140061cff: 48 83 c4 48                 	addq	$0x48, %rsp
140061d03: 5b                          	popq	%rbx
140061d04: 5f                          	popq	%rdi
140061d05: 5e                          	popq	%rsi
140061d06: 5d                          	popq	%rbp
140061d07: c3                          	retq
140061d08: c6 45 ff 00                 	movb	$0x0, -0x1(%rbp)
140061d0c: 48 89 f1                    	movq	%rsi, %rcx
140061d0f: e8 dc 05 84 05              	callq	0x1458a22f0 <.text+0x58a12f0>
140061d14: 90                          	nop
140061d15: eb e8                       	jmp	0x140061cff <.text+0x60cff>
140061d17: c6 45 ff 00                 	movb	$0x0, -0x1(%rbp)
140061d1b: e8 a0 12 84 05              	callq	0x1458a2fc0 <.text+0x58a1fc0>
140061d20: 90                          	nop
140061d21: 84 c0                       	testb	%al, %al
140061d23: 75 d2                       	jne	0x140061cf7 <.text+0x60cf7>
140061d25: c6 46 01 01                 	movb	$0x1, 0x1(%rsi)
140061d29: eb cc                       	jmp	0x140061cf7 <.text+0x60cf7>


; run-options-commit 0x14001e3fb..0x14001e4fb

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14001e3fb: 48 8b 85 28 01 00 00        	movq	0x128(%rbp), %rax
14001e402: 48 8b 8d f0 00 00 00        	movq	0xf0(%rbp), %rcx
14001e409: 48 39 08                    	cmpq	%rcx, (%rax)
14001e40c: 0f 84 d5 00 00 00           	je	0x14001e4e7 <.text+0x1d4e7>
14001e412: 4c 8b b5 f8 00 00 00        	movq	0xf8(%rbp), %r14
14001e419: 41 8a 5e 38                 	movb	0x38(%r14), %bl
14001e41d: 41 8a 76 39                 	movb	0x39(%r14), %sil
14001e421: 41 8a 7e 3a                 	movb	0x3a(%r14), %dil
14001e425: 48 8d 8d d0 00 00 00        	leaq	0xd0(%rbp), %rcx
14001e42c: 4c 89 f2                    	movq	%r14, %rdx
14001e42f: e8 2c bc 6a 05              	callq	0x1456ca060 <.text+0x56c9060>
14001e434: 49 8d 56 18                 	leaq	0x18(%r14), %rdx
14001e438: 48 8d 8d 88 00 00 00        	leaq	0x88(%rbp), %rcx
14001e43f: e8 1c bc 6a 05              	callq	0x1456ca060 <.text+0x56c9060>
14001e444: 90                          	nop
14001e445: 41 0f b6 46 3f              	movzbl	0x3f(%r14), %eax
14001e44a: 88 45 e7                    	movb	%al, -0x19(%rbp)
14001e44d: 41 8b 46 3b                 	movl	0x3b(%r14), %eax
14001e451: 89 45 e3                    	movl	%eax, -0x1d(%rbp)
14001e454: 49 8b 46 30                 	movq	0x30(%r14), %rax
14001e458: 48 8b 8d e0 00 00 00        	movq	0xe0(%rbp), %rcx
14001e45f: 48 89 8d b0 00 00 00        	movq	%rcx, 0xb0(%rbp)
14001e466: 0f 10 85 d0 00 00 00        	movups	0xd0(%rbp), %xmm0
14001e46d: 0f 29 85 a0 00 00 00        	movaps	%xmm0, 0xa0(%rbp)
14001e474: 48 8b 8d 98 00 00 00        	movq	0x98(%rbp), %rcx
14001e47b: 48 89 8d c8 00 00 00        	movq	%rcx, 0xc8(%rbp)
14001e482: 0f 10 8d 88 00 00 00        	movups	0x88(%rbp), %xmm1
14001e489: 0f 11 8d b8 00 00 00        	movups	%xmm1, 0xb8(%rbp)
14001e490: 0f 11 45 a8                 	movups	%xmm0, -0x58(%rbp)
14001e494: 48 8b 8d c0 00 00 00        	movq	0xc0(%rbp), %rcx
14001e49b: 48 89 4d c8                 	movq	%rcx, -0x38(%rbp)
14001e49f: 48 8b 8d c8 00 00 00        	movq	0xc8(%rbp), %rcx
14001e4a6: 48 89 4d d0                 	movq	%rcx, -0x30(%rbp)
14001e4aa: 48 8b 8d b0 00 00 00        	movq	0xb0(%rbp), %rcx
14001e4b1: 48 89 4d b8                 	movq	%rcx, -0x48(%rbp)
14001e4b5: 48 8b 8d b8 00 00 00        	movq	0xb8(%rbp), %rcx
14001e4bc: 48 89 4d c0                 	movq	%rcx, -0x40(%rbp)
14001e4c0: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
14001e4c4: 88 5d e0                    	movb	%bl, -0x20(%rbp)
14001e4c7: 40 88 75 e1                 	movb	%sil, -0x1f(%rbp)
14001e4cb: 40 88 7d e2                 	movb	%dil, -0x1e(%rbp)
14001e4cf: c7 45 a0 0b 00 00 00        	movl	$0xb, -0x60(%rbp)
14001e4d6: 48 8d 55 a0                 	leaq	-0x60(%rbp), %rdx
14001e4da: 48 8b 8d 00 01 00 00        	movq	0x100(%rbp), %rcx
14001e4e1: e8 8a 37 04 00              	callq	0x140061c70 <.text+0x60c70>
14001e4e6: 90                          	nop
14001e4e7: 48 81 c4 d8 01 00 00        	addq	$0x1d8, %rsp            # imm = 0x1D8
14001e4ee: 5b                          	popq	%rbx
14001e4ef: 5f                          	popq	%rdi
14001e4f0: 5e                          	popq	%rsi
14001e4f1: 41 5c                       	popq	%r12
14001e4f3: 41 5d                       	popq	%r13
14001e4f5: 41 5e                       	popq	%r14
14001e4f7: 41 5f                       	popq	%r15
14001e4f9: 5d                          	popq	%rbp
14001e4fa: c3                          	retq


; core-command-loop 0x1453e6680..0x1453e66e0

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453e6680: 8b 81 18 ff ff ff           	movl	-0xe8(%rcx), %eax
1453e6686: 83 f8 ff                    	cmpl	$-0x1, %eax
1453e6689: 74 54                       	je	0x1453e66df <.text+0x53e56df>
1453e668b: 4c 8d b1 18 ff ff ff        	leaq	-0xe8(%rcx), %r14
1453e6692: 89 85 80 00 00 00           	movl	%eax, 0x80(%rbp)
1453e6698: 49 8d 56 04                 	leaq	0x4(%r14), %rdx
1453e669c: 41 b8 e4 00 00 00           	movl	$0xe4, %r8d
1453e66a2: 48 89 8d 88 04 00 00        	movq	%rcx, 0x488(%rbp)
1453e66a9: 48 89 f1                    	movq	%rsi, %rcx
1453e66ac: e8 4c e3 32 00              	callq	0x1457149fd <.text+0x57139fd>
1453e66b1: 90                          	nop
1453e66b2: 48 8b 8d b8 04 00 00        	movq	0x4b8(%rbp), %rcx
1453e66b9: 48 89 fa                    	movq	%rdi, %rdx
1453e66bc: e8 bf cc 00 00              	callq	0x1453f3380 <.text+0x53f2380>
1453e66c1: 90                          	nop
1453e66c2: 48 8b 8d 88 04 00 00        	movq	0x488(%rbp), %rcx
1453e66c9: 48 81 c1 e8 00 00 00        	addq	$0xe8, %rcx
1453e66d0: 49 81 c6 e8 00 00 00        	addq	$0xe8, %r14
1453e66d7: 49 39 de                    	cmpq	%rbx, %r14
1453e66da: 75 a4                       	jne	0x1453e6680 <.text+0x53e5680>
1453e66dc: 48 89 d9                    	movq	%rbx, %rcx
1453e66df: 48 89 8d f8 02 00 00        	movq	%rcx, 0x2f8(%rbp)


; core-command11 0x1453f35b0..0x1453f3c0e

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453f35b0: 41 0f 10 41 08              	movups	0x8(%r9), %xmm0
1453f35b5: 41 0f 10 49 18              	movups	0x18(%r9), %xmm1
1453f35ba: 41 0f 10 51 28              	movups	0x28(%r9), %xmm2
1453f35bf: 41 0f 10 59 38              	movups	0x38(%r9), %xmm3
1453f35c4: 0f 29 5d e0                 	movaps	%xmm3, -0x20(%rbp)
1453f35c8: 0f 29 55 d0                 	movaps	%xmm2, -0x30(%rbp)
1453f35cc: 0f 29 4d c0                 	movaps	%xmm1, -0x40(%rbp)
1453f35d0: 0f 29 45 b0                 	movaps	%xmm0, -0x50(%rbp)
1453f35d4: 48 8d be a8 09 00 00        	leaq	0x9a8(%rsi), %rdi
1453f35db: 48 8d 9d 00 09 00 00        	leaq	0x900(%rbp), %rbx
1453f35e2: 48 8d 55 b0                 	leaq	-0x50(%rbp), %rdx
1453f35e6: 48 89 d9                    	movq	%rbx, %rcx
1453f35e9: e8 f2 f1 00 00              	callq	0x1454027e0 <.text+0x54017e0>
1453f35ee: 48 8d 8d 50 12 00 00        	leaq	0x1250(%rbp), %rcx
1453f35f5: 48 89 fa                    	movq	%rdi, %rdx
1453f35f8: 49 89 d8                    	movq	%rbx, %r8
1453f35fb: e8 30 5b 00 00              	callq	0x1453f9130 <.text+0x53f8130>
1453f3600: 48 8b 96 60 0b 00 00        	movq	0xb60(%rsi), %rdx
1453f3607: 48 85 d2                    	testq	%rdx, %rdx
1453f360a: 74 12                       	je	0x1453f361e <.text+0x53f261e>
1453f360c: 48 8b 8e 68 0b 00 00        	movq	0xb68(%rsi), %rcx
1453f3613: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f3619: e8 b2 eb c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f361e: 4c 8d b6 60 0b 00 00        	leaq	0xb60(%rsi), %r14
1453f3625: 48 8d 9e 78 0b 00 00        	leaq	0xb78(%rsi), %rbx
1453f362c: 48 8b 96 78 0b 00 00        	movq	0xb78(%rsi), %rdx
1453f3633: 48 85 d2                    	testq	%rdx, %rdx
1453f3636: 74 12                       	je	0x1453f364a <.text+0x53f264a>
1453f3638: 48 8b 8e 80 0b 00 00        	movq	0xb80(%rsi), %rcx
1453f363f: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f3645: e8 86 eb c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f364a: 0f 10 85 50 12 00 00        	movups	0x1250(%rbp), %xmm0
1453f3651: 0f 10 8d 60 12 00 00        	movups	0x1260(%rbp), %xmm1
1453f3658: 0f 10 95 70 12 00 00        	movups	0x1270(%rbp), %xmm2
1453f365f: 0f 10 9d 80 12 00 00        	movups	0x1280(%rbp), %xmm3
1453f3666: 41 0f 11 5e 30              	movups	%xmm3, 0x30(%r14)
1453f366b: 41 0f 11 56 20              	movups	%xmm2, 0x20(%r14)
1453f3670: 41 0f 11 4e 10              	movups	%xmm1, 0x10(%r14)
1453f3675: 41 0f 11 06                 	movups	%xmm0, (%r14)
1453f3679: 44 8a be 98 0b 00 00        	movb	0xb98(%rsi), %r15b
1453f3680: 44 8a a6 99 0b 00 00        	movb	0xb99(%rsi), %r12b
1453f3687: 44 8a ae 9a 0b 00 00        	movb	0xb9a(%rsi), %r13b
1453f368e: 48 8d 8d 50 12 00 00        	leaq	0x1250(%rbp), %rcx
1453f3695: 4c 89 f2                    	movq	%r14, %rdx
1453f3698: e8 c3 69 2d 00              	callq	0x1456ca060 <.text+0x56c9060>
1453f369d: 90                          	nop
1453f369e: 48 8d 8d 00 09 00 00        	leaq	0x900(%rbp), %rcx
1453f36a5: 48 89 da                    	movq	%rbx, %rdx
1453f36a8: e8 b3 69 2d 00              	callq	0x1456ca060 <.text+0x56c9060>
1453f36ad: 90                          	nop
1453f36ae: 0f b6 86 9f 0b 00 00        	movzbl	0xb9f(%rsi), %eax
1453f36b5: 88 85 8c 1c 00 00           	movb	%al, 0x1c8c(%rbp)
1453f36bb: 8b 86 9b 0b 00 00           	movl	0xb9b(%rsi), %eax
1453f36c1: 89 85 88 1c 00 00           	movl	%eax, 0x1c88(%rbp)
1453f36c7: 48 8b 9e 90 0b 00 00        	movq	0xb90(%rsi), %rbx
1453f36ce: 48 8b 85 60 12 00 00        	movq	0x1260(%rbp), %rax
1453f36d5: 48 89 85 10 1c 00 00        	movq	%rax, 0x1c10(%rbp)
1453f36dc: 0f 10 85 50 12 00 00        	movups	0x1250(%rbp), %xmm0
1453f36e3: 0f 29 85 00 1c 00 00        	movaps	%xmm0, 0x1c00(%rbp)
1453f36ea: 48 8b 85 10 09 00 00        	movq	0x910(%rbp), %rax
1453f36f1: 48 89 85 28 1c 00 00        	movq	%rax, 0x1c28(%rbp)
1453f36f8: 0f 10 85 00 09 00 00        	movups	0x900(%rbp), %xmm0
1453f36ff: 0f 11 85 18 1c 00 00        	movups	%xmm0, 0x1c18(%rbp)
1453f3706: 4c 8d b6 e0 0a 00 00        	leaq	0xae0(%rsi), %r14
1453f370d: 48 8b 96 e0 0a 00 00        	movq	0xae0(%rsi), %rdx
1453f3714: 48 83 fa ff                 	cmpq	$-0x1, %rdx
1453f3718: 74 35                       	je	0x1453f374f <.text+0x53f274f>
1453f371a: 48 85 d2                    	testq	%rdx, %rdx
1453f371d: 74 12                       	je	0x1453f3731 <.text+0x53f2731>
1453f371f: 48 8b 8e e8 0a 00 00        	movq	0xae8(%rsi), %rcx
1453f3726: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f372c: e8 9f ea c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f3731: 48 8b 96 f8 0a 00 00        	movq	0xaf8(%rsi), %rdx
1453f3738: 48 85 d2                    	testq	%rdx, %rdx
1453f373b: 74 12                       	je	0x1453f374f <.text+0x53f274f>
1453f373d: 48 8b 8e 00 0b 00 00        	movq	0xb00(%rsi), %rcx
1453f3744: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f374a: e8 81 ea c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f374f: 0f 28 85 00 1c 00 00        	movaps	0x1c00(%rbp), %xmm0
1453f3756: 48 8b 85 10 1c 00 00        	movq	0x1c10(%rbp), %rax
1453f375d: 48 8b 8d 18 1c 00 00        	movq	0x1c18(%rbp), %rcx
1453f3764: 48 8b 95 20 1c 00 00        	movq	0x1c20(%rbp), %rdx
1453f376b: 49 89 56 20                 	movq	%rdx, 0x20(%r14)
1453f376f: 48 8b 95 28 1c 00 00        	movq	0x1c28(%rbp), %rdx
1453f3776: 49 89 56 28                 	movq	%rdx, 0x28(%r14)
1453f377a: 49 89 46 10                 	movq	%rax, 0x10(%r14)
1453f377e: 49 89 4e 18                 	movq	%rcx, 0x18(%r14)
1453f3782: 41 0f 11 06                 	movups	%xmm0, (%r14)
1453f3786: 48 89 9e 10 0b 00 00        	movq	%rbx, 0xb10(%rsi)
1453f378d: 44 88 be 18 0b 00 00        	movb	%r15b, 0xb18(%rsi)
1453f3794: 44 88 a6 19 0b 00 00        	movb	%r12b, 0xb19(%rsi)
1453f379b: 44 88 ae 1a 0b 00 00        	movb	%r13b, 0xb1a(%rsi)
1453f37a2: 8b 85 88 1c 00 00           	movl	0x1c88(%rbp), %eax
1453f37a8: 89 86 1b 0b 00 00           	movl	%eax, 0xb1b(%rsi)
1453f37ae: 0f b6 85 8c 1c 00 00        	movzbl	0x1c8c(%rbp), %eax
1453f37b5: 88 86 1f 0b 00 00           	movb	%al, 0xb1f(%rsi)
1453f37bb: 48 8b 9e 98 0b 00 00        	movq	0xb98(%rsi), %rbx
1453f37c2: 48 8b 86 d0 0a 00 00        	movq	0xad0(%rsi), %rax
1453f37c9: 4c 8b b6 d8 0a 00 00        	movq	0xad8(%rsi), %r14
1453f37d0: 4a 8d 0c f5 00 00 00 00     	leaq	(,%r14,8), %rcx
1453f37d8: 31 d2                       	xorl	%edx, %edx
1453f37da: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1453f37e0: 48 39 d1                    	cmpq	%rdx, %rcx
1453f37e3: 0f 84 cb 07 00 00           	je	0x1453f3fb4 <.text+0x53f2fb4>
1453f37e9: 4c 8d 42 08                 	leaq	0x8(%rdx), %r8
1453f37ed: 38 1c 10                    	cmpb	%bl, (%rax,%rdx)
1453f37f0: 4c 89 c2                    	movq	%r8, %rdx
1453f37f3: 75 eb                       	jne	0x1453f37e0 <.text+0x53f27e0>
1453f37f5: 4a 89 5c 00 f8              	movq	%rbx, -0x8(%rax,%r8)
1453f37fa: e9 df 07 00 00              	jmp	0x1453f3fde <.text+0x53f2fde>
1453f37ff: 83 7e 10 02                 	cmpl	$0x2, 0x10(%rsi)
1453f3803: 0f 84 01 12 00 00           	je	0x1453f4a0a <.text+0x53f3a0a>
1453f3809: 48 83 c6 10                 	addq	$0x10, %rsi
1453f380d: 49 8b 51 08                 	movq	0x8(%r9), %rdx
1453f3811: 48 89 f1                    	movq	%rsi, %rcx
1453f3814: 48 81 c4 48 1d 00 00        	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f381b: 5b                          	popq	%rbx
1453f381c: 5f                          	popq	%rdi
1453f381d: 5e                          	popq	%rsi
1453f381e: 41 5c                       	popq	%r12
1453f3820: 41 5d                       	popq	%r13
1453f3822: 41 5e                       	popq	%r14
1453f3824: 41 5f                       	popq	%r15
1453f3826: 5d                          	popq	%rbp
1453f3827: e9 14 55 0c 00              	jmp	0x1454b8d40 <.text+0x54b7d40>
1453f382c: 4d 8b 71 08                 	movq	0x8(%r9), %r14
1453f3830: 49 8b 79 10                 	movq	0x10(%r9), %rdi
1453f3834: 4c 89 8d a8 1c 00 00        	movq	%r9, 0x1ca8(%rbp)
1453f383b: 4d 8b 79 18                 	movq	0x18(%r9), %r15
1453f383f: 4b 8d 04 7f                 	leaq	(%r15,%r15,2), %rax
1453f3843: 48 8d 04 c7                 	leaq	(%rdi,%rax,8), %rax
1453f3847: 48 8d 9e a8 09 00 00        	leaq	0x9a8(%rsi), %rbx
1453f384e: 48 89 bd 00 09 00 00        	movq	%rdi, 0x900(%rbp)
1453f3855: 48 89 85 08 09 00 00        	movq	%rax, 0x908(%rbp)
1453f385c: 48 c7 85 10 09 00 00 02 00 00 00    	movq	$0x2, 0x910(%rbp)
1453f3867: 48 89 9d 18 09 00 00        	movq	%rbx, 0x918(%rbp)
1453f386e: 48 8d 8d 50 12 00 00        	leaq	0x1250(%rbp), %rcx
1453f3875: 48 8d 95 00 09 00 00        	leaq	0x900(%rbp), %rdx
1453f387c: e8 4f 4c 0f 00              	callq	0x1454e84d0 <.text+0x54e74d0>
1453f3881: 90                          	nop
1453f3882: 4c 89 b5 b0 1c 00 00        	movq	%r14, 0x1cb0(%rbp)
1453f3889: 4c 8d a6 b0 0a 00 00        	leaq	0xab0(%rsi), %r12
1453f3890: 4c 8b ae c0 0a 00 00        	movq	0xac0(%rsi), %r13
1453f3897: 4d 85 ed                    	testq	%r13, %r13
1453f389a: 0f 84 bf 05 00 00           	je	0x1453f3e5f <.text+0x53f2e5f>
1453f38a0: 4c 8b b6 b8 0a 00 00        	movq	0xab8(%rsi), %r14
1453f38a7: 49 83 c6 08                 	addq	$0x8, %r14
1453f38ab: eb 10                       	jmp	0x1453f38bd <.text+0x53f28bd>
1453f38ad: 0f 1f 00                    	nopl	(%rax)
1453f38b0: 49 83 c6 18                 	addq	$0x18, %r14
1453f38b4: 49 ff cd                    	decq	%r13
1453f38b7: 0f 84 a2 05 00 00           	je	0x1453f3e5f <.text+0x53f2e5f>
1453f38bd: 49 8b 56 f8                 	movq	-0x8(%r14), %rdx
1453f38c1: 48 85 d2                    	testq	%rdx, %rdx
1453f38c4: 74 ea                       	je	0x1453f38b0 <.text+0x53f28b0>
1453f38c6: 49 8b 0e                    	movq	(%r14), %rcx
1453f38c9: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f38cf: e8 fc e8 c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f38d4: eb da                       	jmp	0x1453f38b0 <.text+0x53f28b0>
1453f38d6: 83 7e 10 02                 	cmpl	$0x2, 0x10(%rsi)
1453f38da: 0f 84 2a 11 00 00           	je	0x1453f4a0a <.text+0x53f3a0a>
1453f38e0: 80 be 5e 09 00 00 02        	cmpb	$0x2, 0x95e(%rsi)
1453f38e7: 0f 85 1d 11 00 00           	jne	0x1453f4a0a <.text+0x53f3a0a>
1453f38ed: 80 be 1e 02 00 00 00        	cmpb	$0x0, 0x21e(%rsi)
1453f38f4: 0f 84 10 11 00 00           	je	0x1453f4a0a <.text+0x53f3a0a>
1453f38fa: 0f b6 9e 5c 09 00 00        	movzbl	0x95c(%rsi), %ebx
1453f3901: 80 fb ff                    	cmpb	$-0x1, %bl
1453f3904: 0f 84 00 11 00 00           	je	0x1453f4a0a <.text+0x53f3a0a>
1453f390a: 8b 86 30 09 00 00           	movl	0x930(%rsi), %eax
1453f3910: c1 e8 02                    	shrl	$0x2, %eax
1453f3913: 83 f8 0b                    	cmpl	$0xb, %eax
1453f3916: b9 0a 00 00 00              	movl	$0xa, %ecx
1453f391b: 0f 43 c8                    	cmovael	%eax, %ecx
1453f391e: f3 0f 2a c1                 	cvtsi2ss	%ecx, %xmm0
1453f3922: 48 8d 7e 10                 	leaq	0x10(%rsi), %rdi
1453f3926: f3 0f 59 86 98 04 00 00     	mulss	0x498(%rsi), %xmm0
1453f392e: e8 2a 11 32 00              	callq	0x145714a5d <.text+0x5713a5d>
1453f3933: f3 48 0f 2c c0              	cvttss2si	%xmm0, %rax
1453f3938: 31 c9                       	xorl	%ecx, %ecx
1453f393a: 0f 57 c9                    	xorps	%xmm1, %xmm1
1453f393d: 0f 2e c1                    	ucomiss	%xmm1, %xmm0
1453f3940: 0f 43 c8                    	cmovael	%eax, %ecx
1453f3943: 0f 2e 05 fa 7a 4b 00        	ucomiss	0x4b7afa(%rip), %xmm0   # 0x1458ab444
1453f394a: b8 ff ff ff ff              	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1453f394f: 0f 46 c1                    	cmovbel	%ecx, %eax
1453f3952: 8b 8e 18 04 00 00           	movl	0x418(%rsi), %ecx
1453f3958: 01 c1                       	addl	%eax, %ecx
1453f395a: 89 8e 18 04 00 00           	movl	%ecx, 0x418(%rsi)
1453f3960: 01 86 7c 06 00 00           	addl	%eax, 0x67c(%rsi)
1453f3966: 44 69 c1 10 27 00 00        	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
1453f396d: 48 81 c6 b8 08 00 00        	addq	$0x8b8, %rsi            # imm = 0x8B8
1453f3974: 48 89 f1                    	movq	%rsi, %rcx
1453f3977: 66 ba 98 04                 	movw	$0x498, %dx             # imm = 0x498
1453f397b: e8 00 88 0d 00              	callq	0x1454cc180 <.text+0x54cb180>
1453f3980: 48 89 f9                    	movq	%rdi, %rcx
1453f3983: 89 da                       	movl	%ebx, %edx
1453f3985: 48 81 c4 48 1d 00 00        	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f398c: 5b                          	popq	%rbx
1453f398d: 5f                          	popq	%rdi
1453f398e: 5e                          	popq	%rsi
1453f398f: 41 5c                       	popq	%r12
1453f3991: 41 5d                       	popq	%r13
1453f3993: 41 5e                       	popq	%r14
1453f3995: 41 5f                       	popq	%r15
1453f3997: 5d                          	popq	%rbp
1453f3998: e9 e3 ce 0b 00              	jmp	0x1454b0880 <.text+0x54af880>
1453f399d: 48 89 f1                    	movq	%rsi, %rcx
1453f39a0: 48 81 c4 48 1d 00 00        	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f39a7: 5b                          	popq	%rbx
1453f39a8: 5f                          	popq	%rdi
1453f39a9: 5e                          	popq	%rsi
1453f39aa: 41 5c                       	popq	%r12
1453f39ac: 41 5d                       	popq	%r13
1453f39ae: 41 5e                       	popq	%r14
1453f39b0: 41 5f                       	popq	%r15
1453f39b2: 5d                          	popq	%rbp
1453f39b3: e9 88 c4 ff ff              	jmp	0x1453efe40 <.text+0x53eee40>
1453f39b8: 83 7e 10 02                 	cmpl	$0x2, 0x10(%rsi)
1453f39bc: 0f 84 48 10 00 00           	je	0x1453f4a0a <.text+0x53f3a0a>
1453f39c2: 48 83 c6 10                 	addq	$0x10, %rsi
1453f39c6: 48 89 f1                    	movq	%rsi, %rcx
1453f39c9: 48 81 c4 48 1d 00 00        	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f39d0: 5b                          	popq	%rbx
1453f39d1: 5f                          	popq	%rdi
1453f39d2: 5e                          	popq	%rsi
1453f39d3: 41 5c                       	popq	%r12
1453f39d5: 41 5d                       	popq	%r13
1453f39d7: 41 5e                       	popq	%r14
1453f39d9: 41 5f                       	popq	%r15
1453f39db: 5d                          	popq	%rbp
1453f39dc: e9 5f 8d 0c 00              	jmp	0x1454bc740 <.text+0x54bb740>
1453f39e1: 83 7e 10 02                 	cmpl	$0x2, 0x10(%rsi)
1453f39e5: 0f 84 1f 10 00 00           	je	0x1453f4a0a <.text+0x53f3a0a>
1453f39eb: 48 83 c6 10                 	addq	$0x10, %rsi
1453f39ef: 41 80 79 04 00              	cmpb	$0x0, 0x4(%r9)
1453f39f4: 0f 84 3c 09 00 00           	je	0x1453f4336 <.text+0x53f3336>
1453f39fa: 48 89 f1                    	movq	%rsi, %rcx
1453f39fd: 48 81 c4 48 1d 00 00        	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f3a04: 5b                          	popq	%rbx
1453f3a05: 5f                          	popq	%rdi
1453f3a06: 5e                          	popq	%rsi
1453f3a07: 41 5c                       	popq	%r12
1453f3a09: 41 5d                       	popq	%r13
1453f3a0b: 41 5e                       	popq	%r14
1453f3a0d: 41 5f                       	popq	%r15
1453f3a0f: 5d                          	popq	%rbp
1453f3a10: e9 eb 36 09 00              	jmp	0x145487100 <.text+0x5486100>
1453f3a15: 41 0f 10 41 08              	movups	0x8(%r9), %xmm0
1453f3a1a: 41 0f 10 49 18              	movups	0x18(%r9), %xmm1
1453f3a1f: 41 0f 10 51 28              	movups	0x28(%r9), %xmm2
1453f3a24: 0f 29 95 20 09 00 00        	movaps	%xmm2, 0x920(%rbp)
1453f3a2b: 0f 29 8d 10 09 00 00        	movaps	%xmm1, 0x910(%rbp)
1453f3a32: 0f 29 85 00 09 00 00        	movaps	%xmm0, 0x900(%rbp)
1453f3a39: 48 81 c6 a8 09 00 00        	addq	$0x9a8, %rsi            # imm = 0x9A8
1453f3a40: 48 8d 8d 00 09 00 00        	leaq	0x900(%rbp), %rcx
1453f3a47: 48 89 f2                    	movq	%rsi, %rdx
1453f3a4a: e8 e1 da 03 00              	callq	0x145431530 <.text+0x5430530>
1453f3a4f: 84 c0                       	testb	%al, %al
1453f3a51: 0f 84 b3 0f 00 00           	je	0x1453f4a0a <.text+0x53f3a0a>
1453f3a57: 48 89 f1                    	movq	%rsi, %rcx
1453f3a5a: e8 61 ae 00 00              	callq	0x1453fe8c0 <.text+0x53fd8c0>
1453f3a5f: e9 a6 0f 00 00              	jmp	0x1453f4a0a <.text+0x53f3a0a>
1453f3a64: 83 7e 10 02                 	cmpl	$0x2, 0x10(%rsi)
1453f3a68: 0f 84 9c 0f 00 00           	je	0x1453f4a0a <.text+0x53f3a0a>
1453f3a6e: 48 8d 4e 10                 	leaq	0x10(%rsi), %rcx
1453f3a72: e8 29 00 07 00              	callq	0x145463aa0 <.text+0x5462aa0>
1453f3a77: 48 c7 46 20 00 00 00 00     	movq	$0x0, 0x20(%rsi)
1453f3a7f: e8 7c e7 c0 fa              	callq	0x140002200 <.text+0x1200>
1453f3a84: b9 20 00 00 00              	movl	$0x20, %ecx
1453f3a89: ba 01 00 00 00              	movl	$0x1, %edx
1453f3a8e: e8 2d e7 c0 fa              	callq	0x1400021c0 <.text+0x11c0>
1453f3a93: 48 89 85 b0 1c 00 00        	movq	%rax, 0x1cb0(%rbp)
1453f3a9a: 48 85 c0                    	testq	%rax, %rax
1453f3a9d: 0f 84 ca 0f 00 00           	je	0x1453f4a6d <.text+0x53f3a6d>
1453f3aa3: 48 8b be 58 05 00 00        	movq	0x558(%rsi), %rdi
1453f3aaa: 48 3b be 48 05 00 00        	cmpq	0x548(%rsi), %rdi
1453f3ab1: 75 0d                       	jne	0x1453f3ac0 <.text+0x53f2ac0>
1453f3ab3: 48 8d 8e 48 05 00 00        	leaq	0x548(%rsi), %rcx
1453f3aba: e8 a1 42 32 00              	callq	0x145717d60 <.text+0x5716d60>
1453f3abf: 90                          	nop
1453f3ac0: 48 8b 86 50 05 00 00        	movq	0x550(%rsi), %rax
1453f3ac7: 48 89 f9                    	movq	%rdi, %rcx
1453f3aca: 48 c1 e1 05                 	shlq	$0x5, %rcx
1453f3ace: 48 c7 04 08 20 00 00 00     	movq	$0x20, (%rax,%rcx)
1453f3ad6: 48 8b 95 b0 1c 00 00        	movq	0x1cb0(%rbp), %rdx
1453f3add: 48 89 54 08 08              	movq	%rdx, 0x8(%rax,%rcx)
1453f3ae2: 48 c7 44 08 10 00 00 00 00  	movq	$0x0, 0x10(%rax,%rcx)
1453f3aeb: 66 c7 44 08 18 7e 01        	movw	$0x17e, 0x18(%rax,%rcx) # imm = 0x17E
1453f3af2: 48 ff c7                    	incq	%rdi
1453f3af5: 48 89 be 58 05 00 00        	movq	%rdi, 0x558(%rsi)
1453f3afc: e9 09 0f 00 00              	jmp	0x1453f4a0a <.text+0x53f3a0a>
1453f3b01: 48 8d 8d 00 09 00 00        	leaq	0x900(%rbp), %rcx
1453f3b08: 41 b8 e8 00 00 00           	movl	$0xe8, %r8d
1453f3b0e: 4c 89 ca                    	movq	%r9, %rdx
1453f3b11: e8 e7 0e 32 00              	callq	0x1457149fd <.text+0x57139fd>
1453f3b16: 0f b6 9e 99 0b 00 00        	movzbl	0xb99(%rsi), %ebx
1453f3b1d: 48 8d be a8 09 00 00        	leaq	0x9a8(%rsi), %rdi
1453f3b24: 48 8d 8d 88 1c 00 00        	leaq	0x1c88(%rbp), %rcx
1453f3b2b: 48 89 fa                    	movq	%rdi, %rdx
1453f3b2e: e8 7d 6d 00 00              	callq	0x1453fa8b0 <.text+0x53f98b0>
1453f3b33: 48 8b 95 90 1c 00 00        	movq	0x1c90(%rbp), %rdx
1453f3b3a: 48 8b 85 98 1c 00 00        	movq	0x1c98(%rbp), %rax
1453f3b41: 0f b6 8d e4 09 00 00        	movzbl	0x9e4(%rbp), %ecx
1453f3b48: 88 8d 68 1c 00 00           	movb	%cl, 0x1c68(%rbp)
1453f3b4e: 48 8d 8d 68 1c 00 00        	leaq	0x1c68(%rbp), %rcx
1453f3b55: 48 89 4d b0                 	movq	%rcx, -0x50(%rbp)
1453f3b59: 48 89 95 b0 1c 00 00        	movq	%rdx, 0x1cb0(%rbp)
1453f3b60: 48 89 55 b8                 	movq	%rdx, -0x48(%rbp)
1453f3b64: 48 89 45 c0                 	movq	%rax, -0x40(%rbp)
1453f3b68: 45 31 f6                    	xorl	%r14d, %r14d
1453f3b6b: 4c 8d bd 50 12 00 00        	leaq	0x1250(%rbp), %r15
1453f3b72: 4c 8d 65 b0                 	leaq	-0x50(%rbp), %r12
1453f3b76: eb 15                       	jmp	0x1453f3b8d <.text+0x53f2b8d>
1453f3b78: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1453f3b80: 49 ff c6                    	incq	%r14
1453f3b83: 49 83 fe 13                 	cmpq	$0x13, %r14
1453f3b87: 0f 84 87 03 00 00           	je	0x1453f3f14 <.text+0x53f2f14>
1453f3b8d: 42 8b 94 b5 98 09 00 00     	movl	0x998(%rbp,%r14,4), %edx
1453f3b95: 85 d2                       	testl	%edx, %edx
1453f3b97: 74 1c                       	je	0x1453f3bb5 <.text+0x53f2bb5>
1453f3b99: 4c 89 e1                    	movq	%r12, %rcx
1453f3b9c: 4d 89 f0                    	movq	%r14, %r8
1453f3b9f: e8 7c 51 00 00              	callq	0x1453f8d20 <.text+0x53f7d20>
1453f3ba4: 90                          	nop
1453f3ba5: 84 c0                       	testb	%al, %al
1453f3ba7: 75 0c                       	jne	0x1453f3bb5 <.text+0x53f2bb5>
1453f3ba9: 42 c7 84 b5 98 09 00 00 00 00 00 00 	movl	$0x0, 0x998(%rbp,%r14,4)
1453f3bb5: 42 83 bc f5 00 09 00 00 01  	cmpl	$0x1, 0x900(%rbp,%r14,8)
1453f3bbe: 75 c0                       	jne	0x1453f3b80 <.text+0x53f2b80>
1453f3bc0: 46 8b ac f5 04 09 00 00     	movl	0x904(%rbp,%r14,8), %r13d
1453f3bc8: 44 0f b6 85 68 1c 00 00     	movzbl	0x1c68(%rbp), %r8d
1453f3bd0: 4c 89 f9                    	movq	%r15, %rcx
1453f3bd3: 89 da                       	movl	%ebx, %edx
1453f3bd5: e8 86 b8 fe ff              	callq	0x1453df460 <.text+0x53de460>
1453f3bda: 90                          	nop
1453f3bdb: 45 85 ed                    	testl	%r13d, %r13d
1453f3bde: 74 a0                       	je	0x1453f3b80 <.text+0x53f2b80>
1453f3be0: 46 39 ac b5 50 12 00 00     	cmpl	%r13d, 0x1250(%rbp,%r14,4)
1453f3be8: 74 96                       	je	0x1453f3b80 <.text+0x53f2b80>
1453f3bea: 4c 89 e1                    	movq	%r12, %rcx
1453f3bed: 44 89 ea                    	movl	%r13d, %edx
1453f3bf0: 4d 89 f0                    	movq	%r14, %r8
1453f3bf3: e8 28 51 00 00              	callq	0x1453f8d20 <.text+0x53f7d20>
1453f3bf8: 90                          	nop
1453f3bf9: 84 c0                       	testb	%al, %al
1453f3bfb: 75 83                       	jne	0x1453f3b80 <.text+0x53f2b80>
1453f3bfd: 42 c7 84 f5 00 09 00 00 00 00 00 00 	movl	$0x0, 0x900(%rbp,%r14,8)
1453f3c09: e9 72 ff ff ff              	jmp	0x1453f3b80 <.text+0x53f2b80>


; core-command11-write 0x1453f3f40..0x1453f400b

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453f3f40: 48 8d 8d e5 09 00 00        	leaq	0x9e5(%rbp), %rcx
1453f3f47: 4c 8b be f8 09 00 00        	movq	0x9f8(%rsi), %r15
1453f3f4e: 4c 8b a6 00 0a 00 00        	movq	0xa00(%rsi), %r12
1453f3f55: 4d 69 ec e8 00 00 00        	imulq	$0xe8, %r12, %r13
1453f3f5c: 31 c0                       	xorl	%eax, %eax
1453f3f5e: 66 90                       	nop
1453f3f60: 49 39 c5                    	cmpq	%rax, %r13
1453f3f63: 0f 84 9d 01 00 00           	je	0x1453f4106 <.text+0x53f3106>
1453f3f69: 48 8d b8 e8 00 00 00        	leaq	0xe8(%rax), %rdi
1453f3f70: 41 38 9c 07 e4 00 00 00     	cmpb	%bl, 0xe4(%r15,%rax)
1453f3f78: 48 89 f8                    	movq	%rdi, %rax
1453f3f7b: 75 e3                       	jne	0x1453f3f60 <.text+0x53f2f60>
1453f3f7d: 48 89 ce                    	movq	%rcx, %rsi
1453f3f80: 49 8d 0c 3f                 	leaq	(%r15,%rdi), %rcx
1453f3f84: 48 81 c1 18 ff ff ff        	addq	$-0xe8, %rcx
1453f3f8b: 48 8d 95 00 09 00 00        	leaq	0x900(%rbp), %rdx
1453f3f92: 41 b8 e4 00 00 00           	movl	$0xe4, %r8d
1453f3f98: e8 60 0a 32 00              	callq	0x1457149fd <.text+0x57139fd>
1453f3f9d: 0f b7 06                    	movzwl	(%rsi), %eax
1453f3fa0: 66 41 89 44 3f fd           	movw	%ax, -0x3(%r15,%rdi)
1453f3fa6: 0f b6 46 02                 	movzbl	0x2(%rsi), %eax
1453f3faa: 41 88 44 3f ff              	movb	%al, -0x1(%r15,%rdi)
1453f3faf: e9 b1 01 00 00              	jmp	0x1453f4165 <.text+0x53f3165>
1453f3fb4: 4c 3b b6 c8 0a 00 00        	cmpq	0xac8(%rsi), %r14
1453f3fbb: 75 13                       	jne	0x1453f3fd0 <.text+0x53f2fd0>
1453f3fbd: 48 8d 8e c8 0a 00 00        	leaq	0xac8(%rsi), %rcx
1453f3fc4: e8 47 61 49 00              	callq	0x14588a110 <.text+0x5889110>
1453f3fc9: 48 8b 86 d0 0a 00 00        	movq	0xad0(%rsi), %rax
1453f3fd0: 4a 89 1c f0                 	movq	%rbx, (%rax,%r14,8)
1453f3fd4: 49 ff c6                    	incq	%r14
1453f3fd7: 4c 89 b6 d8 0a 00 00        	movq	%r14, 0xad8(%rsi)
1453f3fde: 48 89 f9                    	movq	%rdi, %rcx
1453f3fe1: e8 da a8 00 00              	callq	0x1453fe8c0 <.text+0x53fd8c0>
1453f3fe6: e9 1f 0a 00 00              	jmp	0x1453f4a0a <.text+0x53f3a0a>
1453f3feb: 4c 3b b6 c8 0a 00 00        	cmpq	0xac8(%rsi), %r14
1453f3ff2: 75 13                       	jne	0x1453f4007 <.text+0x53f3007>
1453f3ff4: 48 8d 8e c8 0a 00 00        	leaq	0xac8(%rsi), %rcx
1453f3ffb: e8 10 61 49 00              	callq	0x14588a110 <.text+0x5889110>
1453f4000: 48 8b 86 d0 0a 00 00        	movq	0xad0(%rsi), %rax
1453f4007: 4a 89 1c f0                 	movq	%rbx, (%rax,%r14,8)


; core-worker 0x14542a310..0x14542a475

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14542a310: 55                          	pushq	%rbp
14542a311: 41 56                       	pushq	%r14
14542a313: 56                          	pushq	%rsi
14542a314: 57                          	pushq	%rdi
14542a315: 53                          	pushq	%rbx
14542a316: 48 81 ec 90 00 00 00        	subq	$0x90, %rsp
14542a31d: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
14542a325: 66 44 0f 29 45 00           	movapd	%xmm8, (%rbp)
14542a32b: 66 0f 29 7d f0              	movapd	%xmm7, -0x10(%rbp)
14542a330: 66 0f 7f 75 e0              	movdqa	%xmm6, -0x20(%rbp)
14542a335: 48 c7 45 d8 fe ff ff ff     	movq	$-0x2, -0x28(%rbp)
14542a33d: 48 89 4d c0                 	movq	%rcx, -0x40(%rbp)
14542a341: e8 ca 79 27 00              	callq	0x1456a1d10 <.text+0x56a0d10>
14542a346: 90                          	nop
14542a347: 48 89 45 a8                 	movq	%rax, -0x58(%rbp)
14542a34b: 89 55 b0                    	movl	%edx, -0x50(%rbp)
14542a34e: b3 01                       	movb	$0x1, %bl
14542a350: 48 8d 75 a8                 	leaq	-0x58(%rbp), %rsi
14542a354: f3 0f 7e 35 64 de 47 00     	movq	0x47de64(%rip), %xmm6   # 0x1458a81c0
14542a35c: 66 0f 28 3d 6c de 47 00     	movapd	0x47de6c(%rip), %xmm7   # 0x1458a81d0
14542a364: f2 44 0f 10 05 2b 64 49 00  	movsd	0x49642b(%rip), %xmm8   # 0x1458c0798
14542a36d: eb 1a                       	jmp	0x14542a389 <.text+0x5429389>
14542a36f: 90                          	nop
14542a370: 31 c0                       	xorl	%eax, %eax
14542a372: 86 07                       	xchgb	%al, (%rdi)
14542a374: 3c 02                       	cmpb	$0x2, %al
14542a376: 0f 84 eb 00 00 00           	je	0x14542a467 <.text+0x5429467>
14542a37c: 31 c9                       	xorl	%ecx, %ecx
14542a37e: ba 40 78 7d 01              	movl	$0x17d7840, %edx        # imm = 0x17D7840
14542a383: e8 08 a6 28 00              	callq	0x1456b4990 <.text+0x56b3990>
14542a388: 90                          	nop
14542a389: 4c 8b 75 c0                 	movq	-0x40(%rbp), %r14
14542a38d: 49 8d 7e 10                 	leaq	0x10(%r14), %rdi
14542a391: 31 c0                       	xorl	%eax, %eax
14542a393: f0                          	lock
14542a394: 41 0f b0 5e 10              	cmpxchgb	%bl, 0x10(%r14)
14542a399: 0f 85 aa 00 00 00           	jne	0x14542a449 <.text+0x5429449>
14542a39f: 48 8b 05 ea 28 38 02        	movq	0x23828ea(%rip), %rax   # 0x1477acc90
14542a3a6: 48 8b 00                    	movq	(%rax), %rax
14542a3a9: 48 d1 e0                    	shlq	%rax
14542a3ac: 48 85 c0                    	testq	%rax, %rax
14542a3af: 48 89 7d b8                 	movq	%rdi, -0x48(%rbp)
14542a3b3: 0f 85 9e 00 00 00           	jne	0x14542a457 <.text+0x5429457>
14542a3b9: c7 45 d4 00 00 00 00        	movl	$0x0, -0x2c(%rbp)
14542a3c0: 41 0f b6 46 11              	movzbl	0x11(%r14), %eax
14542a3c5: 48 89 f1                    	movq	%rsi, %rcx
14542a3c8: 4c 89 75 c8                 	movq	%r14, -0x38(%rbp)
14542a3cc: e8 8f 7a 27 00              	callq	0x1456a1e60 <.text+0x56a0e60>
14542a3d1: 90                          	nop
14542a3d2: 48 8b 4d c8                 	movq	-0x38(%rbp), %rcx
14542a3d6: 48 83 c1 18                 	addq	$0x18, %rcx
14542a3da: 66 48 0f 6e c0              	movq	%rax, %xmm0
14542a3df: 66 0f 62 c6                 	punpckldq	%xmm6, %xmm0    # xmm0 = xmm0[0],xmm6[0],xmm0[1],xmm6[1]
14542a3e3: 66 0f 5c c7                 	subpd	%xmm7, %xmm0
14542a3e7: 66 0f 28 d0                 	movapd	%xmm0, %xmm2
14542a3eb: 66 0f 15 d0                 	unpckhpd	%xmm0, %xmm2            # xmm2 = xmm2[1],xmm0[1]
14542a3ef: f2 0f 58 d0                 	addsd	%xmm0, %xmm2
14542a3f3: 0f 57 c9                    	xorps	%xmm1, %xmm1
14542a3f6: f2 0f 2a ca                 	cvtsi2sd	%edx, %xmm1
14542a3fa: f2 41 0f 5e c8              	divsd	%xmm8, %xmm1
14542a3ff: f2 0f 58 ca                 	addsd	%xmm2, %xmm1
14542a403: e8 68 b7 fb ff              	callq	0x1453e5b70 <.text+0x53e4b70>
14542a408: 90                          	nop
14542a409: 80 7d d4 00                 	cmpb	$0x0, -0x2c(%rbp)
14542a40d: 4c 8b 75 c8                 	movq	-0x38(%rbp), %r14
14542a411: 49 8d 7e 10                 	leaq	0x10(%r14), %rdi
14542a415: 0f 85 55 ff ff ff           	jne	0x14542a370 <.text+0x5429370>
14542a41b: 48 8b 05 6e 28 38 02        	movq	0x238286e(%rip), %rax   # 0x1477acc90
14542a422: 48 8b 00                    	movq	(%rax), %rax
14542a425: 48 d1 e0                    	shlq	%rax
14542a428: 48 85 c0                    	testq	%rax, %rax
14542a42b: 0f 84 3f ff ff ff           	je	0x14542a370 <.text+0x5429370>
14542a431: e8 8a 8b 47 00              	callq	0x1458a2fc0 <.text+0x58a1fc0>
14542a436: 90                          	nop
14542a437: 84 c0                       	testb	%al, %al
14542a439: 0f 85 31 ff ff ff           	jne	0x14542a370 <.text+0x5429370>
14542a43f: 41 c6 46 11 01              	movb	$0x1, 0x11(%r14)
14542a444: e9 27 ff ff ff              	jmp	0x14542a370 <.text+0x5429370>
14542a449: 48 89 f9                    	movq	%rdi, %rcx
14542a44c: e8 df 7d 47 00              	callq	0x1458a2230 <.text+0x58a1230>
14542a451: 90                          	nop
14542a452: e9 48 ff ff ff              	jmp	0x14542a39f <.text+0x542939f>
14542a457: e8 64 8b 47 00              	callq	0x1458a2fc0 <.text+0x58a1fc0>
14542a45c: 90                          	nop
14542a45d: 34 01                       	xorb	$0x1, %al
14542a45f: 89 45 d4                    	movl	%eax, -0x2c(%rbp)
14542a462: e9 59 ff ff ff              	jmp	0x14542a3c0 <.text+0x54293c0>
14542a467: 48 89 f9                    	movq	%rdi, %rcx
14542a46a: e8 81 7e 47 00              	callq	0x1458a22f0 <.text+0x58a12f0>
14542a46f: 90                          	nop
14542a470: e9 07 ff ff ff              	jmp	0x14542a37c <.text+0x542937c>


; ordinary-writer 0x145421430..0x14542156c

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145421430: 55                          	pushq	%rbp
145421431: 56                          	pushq	%rsi
145421432: 57                          	pushq	%rdi
145421433: 53                          	pushq	%rbx
145421434: 48 83 ec 78                 	subq	$0x78, %rsp
145421438: 48 8d 6c 24 70              	leaq	0x70(%rsp), %rbp
14542143d: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
145421445: 48 89 d7                    	movq	%rdx, %rdi
145421448: 48 89 cb                    	movq	%rcx, %rbx
14542144b: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
14542144f: e8 cc fd ff ff              	callq	0x145421220 <.text+0x5420220>
145421454: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
145421458: 48 83 f8 ff                 	cmpq	$-0x1, %rax
14542145c: 0f 84 01 01 00 00           	je	0x145421563 <.text+0x5420563>
145421462: 48 89 45 f8                 	movq	%rax, -0x8(%rbp)
145421466: 48 8b 4d d8                 	movq	-0x28(%rbp), %rcx
14542146a: 48 8b 75 e0                 	movq	-0x20(%rbp), %rsi
14542146e: 48 89 4d f0                 	movq	%rcx, -0x10(%rbp)
145421472: 48 89 f2                    	movq	%rsi, %rdx
145421475: e8 86 34 28 00              	callq	0x1456a4900 <.text+0x56a3900>
14542147a: 90                          	nop
14542147b: 48 85 c0                    	testq	%rax, %rax
14542147e: 74 40                       	je	0x1454214c0 <.text+0x54204c0>
145421480: 49 89 d0                    	movq	%rdx, %r8
145421483: c6 45 d0 01                 	movb	$0x1, -0x30(%rbp)
145421487: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
14542148b: 48 89 c2                    	movq	%rax, %rdx
14542148e: e8 7d a6 28 00              	callq	0x1456abb10 <.text+0x56aab10>
145421493: 90                          	nop
145421494: 48 85 c0                    	testq	%rax, %rax
145421497: 74 27                       	je	0x1454214c0 <.text+0x54204c0>
145421499: 89 c1                       	movl	%eax, %ecx
14542149b: 83 e1 03                    	andl	$0x3, %ecx
14542149e: 8d 51 fe                    	leal	-0x2(%rcx), %edx
1454214a1: 83 fa 02                    	cmpl	$0x2, %edx
1454214a4: 72 1a                       	jb	0x1454214c0 <.text+0x54204c0>
1454214a6: 48 85 c9                    	testq	%rcx, %rcx
1454214a9: 74 15                       	je	0x1454214c0 <.text+0x54204c0>
1454214ab: 48 ff c8                    	decq	%rax
1454214ae: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
1454214b2: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
1454214b6: c6 45 d0 03                 	movb	$0x3, -0x30(%rbp)
1454214ba: e8 81 b6 2b 00              	callq	0x1456dcb40 <.text+0x56dbb40>
1454214bf: 90                          	nop
1454214c0: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
1454214c4: 48 89 f2                    	movq	%rsi, %rdx
1454214c7: 49 89 d8                    	movq	%rbx, %r8
1454214ca: 49 89 f9                    	movq	%rdi, %r9
1454214cd: e8 ee 8f 29 00              	callq	0x1456ba4c0 <.text+0x56b94c0>
1454214d2: 90                          	nop
1454214d3: 48 85 c0                    	testq	%rax, %rax
1454214d6: 74 72                       	je	0x14542154a <.text+0x542054a>
1454214d8: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
1454214dc: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
1454214e0: 48 89 45 b8                 	movq	%rax, -0x48(%rbp)
1454214e4: 48 89 75 c0                 	movq	%rsi, -0x40(%rbp)
1454214e8: 48 8d 45 b8                 	leaq	-0x48(%rbp), %rax
1454214ec: 48 89 45 d0                 	movq	%rax, -0x30(%rbp)
1454214f0: 48 8d 05 59 b5 29 00        	leaq	0x29b559(%rip), %rax    # 0x1456bca50 <.text+0x56bba50>
1454214f7: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
1454214fb: 48 8d 45 c8                 	leaq	-0x38(%rbp), %rax
1454214ff: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
145421503: 48 8d 05 06 99 2b 00        	leaq	0x2b9906(%rip), %rax    # 0x1456dae10 <.text+0x56d9e10>
14542150a: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
14542150e: 48 8d 0d 8a 38 47 01        	leaq	0x147388a(%rip), %rcx   # 0x146894d9f
145421515: 48 8d 55 d0                 	leaq	-0x30(%rbp), %rdx
145421519: e8 82 22 29 00              	callq	0x1456b37a0 <.text+0x56b27a0>
14542151e: 90                          	nop
14542151f: 48 8b 45 c8                 	movq	-0x38(%rbp), %rax
145421523: 89 c1                       	movl	%eax, %ecx
145421525: 83 e1 03                    	andl	$0x3, %ecx
145421528: 8d 51 fe                    	leal	-0x2(%rcx), %edx
14542152b: 83 fa 02                    	cmpl	$0x2, %edx
14542152e: 72 1a                       	jb	0x14542154a <.text+0x542054a>
145421530: 48 85 c9                    	testq	%rcx, %rcx
145421533: 74 15                       	je	0x14542154a <.text+0x542054a>
145421535: 48 ff c8                    	decq	%rax
145421538: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
14542153c: 48 89 45 d8                 	movq	%rax, -0x28(%rbp)
145421540: c6 45 d0 03                 	movb	$0x3, -0x30(%rbp)
145421544: e8 f7 b5 2b 00              	callq	0x1456dcb40 <.text+0x56dbb40>
145421549: 90                          	nop
14542154a: 48 8b 55 f8                 	movq	-0x8(%rbp), %rdx
14542154e: 48 85 d2                    	testq	%rdx, %rdx
145421551: 74 10                       	je	0x145421563 <.text+0x5420563>
145421553: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145421559: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
14542155d: e8 6e 0c be fa              	callq	0x1400021d0 <.text+0x11d0>
145421562: 90                          	nop
145421563: 48 83 c4 78                 	addq	$0x78, %rsp
145421567: 5b                          	popq	%rbx
145421568: 5f                          	popq	%rdi
145421569: 5e                          	popq	%rsi
14542156a: 5d                          	popq	%rbp
14542156b: c3                          	retq

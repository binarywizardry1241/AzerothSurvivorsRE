; Supplied0.92.0 EXE SHA-256 47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2
; Original Windows x86_64 instructions; labels below are analyst descriptions.

; Picker default loads account, uses Pick or default; normalizes, clamps zone and replaces Hero with a random name

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401120b0: 55                          	pushq	%rbp
1401120b1: 41 56                       	pushq	%r14
1401120b3: 56                          	pushq	%rsi
1401120b4: 57                          	pushq	%rdi
1401120b5: 53                          	pushq	%rbx
1401120b6: 48 81 ec c0 02 00 00        	subq	$0x2c0, %rsp            # imm = 0x2C0
1401120bd: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1401120c5: 48 c7 85 38 02 00 00 fe ff ff ff    	movq	$-0x2, 0x238(%rbp)
1401120d0: 48 89 ce                    	movq	%rcx, %rsi
1401120d3: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1401120d7: e8 24 7c 2e 05              	callq	0x1453f9d00 <.text+0x53f8d00>
1401120dc: 48 83 bd e0 00 00 00 ff     	cmpq	$-0x1, 0xe0(%rbp)
1401120e4: 0f 84 f0 00 00 00           	je	0x1401121da <.text+0x1111da>
1401120ea: 48 8d 95 e0 00 00 00        	leaq	0xe0(%rbp), %rdx
1401120f1: 8a 9d 18 01 00 00           	movb	0x118(%rbp), %bl
1401120f7: 40 8a bd 19 01 00 00        	movb	0x119(%rbp), %dil
1401120fe: 44 8a b5 1a 01 00 00        	movb	0x11a(%rbp), %r14b
140112105: 48 8d 8d d8 01 00 00        	leaq	0x1d8(%rbp), %rcx
14011210c: e8 4f 7f 5b 05              	callq	0x1456ca060 <.text+0x56c9060>
140112111: 90                          	nop
140112112: 48 8d 95 f8 00 00 00        	leaq	0xf8(%rbp), %rdx
140112119: 48 8d 8d 60 01 00 00        	leaq	0x160(%rbp), %rcx
140112120: e8 3b 7f 5b 05              	callq	0x1456ca060 <.text+0x56c9060>
140112125: 90                          	nop
140112126: 0f b6 85 1f 01 00 00        	movzbl	0x11f(%rbp), %eax
14011212d: 88 85 2f 02 00 00           	movb	%al, 0x22f(%rbp)
140112133: 8b 85 1b 01 00 00           	movl	0x11b(%rbp), %eax
140112139: 89 85 2b 02 00 00           	movl	%eax, 0x22b(%rbp)
14011213f: 48 8b 85 10 01 00 00        	movq	0x110(%rbp), %rax
140112146: 0f 10 85 d8 01 00 00        	movups	0x1d8(%rbp), %xmm0
14011214d: 0f 29 85 a0 01 00 00        	movaps	%xmm0, 0x1a0(%rbp)
140112154: 48 8b 8d e8 01 00 00        	movq	0x1e8(%rbp), %rcx
14011215b: 48 89 8d b0 01 00 00        	movq	%rcx, 0x1b0(%rbp)
140112162: 48 8b 8d 70 01 00 00        	movq	0x170(%rbp), %rcx
140112169: 48 89 8d c8 01 00 00        	movq	%rcx, 0x1c8(%rbp)
140112170: 0f 10 8d 60 01 00 00        	movups	0x160(%rbp), %xmm1
140112177: 0f 11 8d b8 01 00 00        	movups	%xmm1, 0x1b8(%rbp)
14011217e: 0f 29 85 f0 01 00 00        	movaps	%xmm0, 0x1f0(%rbp)
140112185: 48 8b 8d b0 01 00 00        	movq	0x1b0(%rbp), %rcx
14011218c: 48 89 8d 00 02 00 00        	movq	%rcx, 0x200(%rbp)
140112193: 48 8b 8d b8 01 00 00        	movq	0x1b8(%rbp), %rcx
14011219a: 48 89 8d 08 02 00 00        	movq	%rcx, 0x208(%rbp)
1401121a1: 48 8b 8d c0 01 00 00        	movq	0x1c0(%rbp), %rcx
1401121a8: 48 89 8d 10 02 00 00        	movq	%rcx, 0x210(%rbp)
1401121af: 48 8b 8d c8 01 00 00        	movq	0x1c8(%rbp), %rcx
1401121b6: 48 89 8d 18 02 00 00        	movq	%rcx, 0x218(%rbp)
1401121bd: 48 89 85 20 02 00 00        	movq	%rax, 0x220(%rbp)
1401121c4: 88 9d 28 02 00 00           	movb	%bl, 0x228(%rbp)
1401121ca: 40 88 bd 29 02 00 00        	movb	%dil, 0x229(%rbp)
1401121d1: 44 88 b5 2a 02 00 00        	movb	%r14b, 0x22a(%rbp)
1401121d8: eb 0d                       	jmp	0x1401121e7 <.text+0x1111e7>
1401121da: 48 8d 8d f0 01 00 00        	leaq	0x1f0(%rbp), %rcx
1401121e1: e8 da 12 2f 05              	callq	0x1454034c0 <.text+0x54024c0>
1401121e6: 90                          	nop
1401121e7: 48 8d 8d 60 01 00 00        	leaq	0x160(%rbp), %rcx
1401121ee: 48 8d 95 f0 01 00 00        	leaq	0x1f0(%rbp), %rdx
1401121f5: e8 e6 05 2f 05              	callq	0x1454027e0 <.text+0x54017e0>
1401121fa: 90                          	nop
1401121fb: 48 8d 8d f0 01 00 00        	leaq	0x1f0(%rbp), %rcx
140112202: 48 8d 55 a8                 	leaq	-0x58(%rbp), %rdx
140112206: 4c 8d 85 60 01 00 00        	leaq	0x160(%rbp), %r8
14011220d: e8 1e 6f 2e 05              	callq	0x1453f9130 <.text+0x53f8130>
140112212: 90                          	nop
140112213: 48 83 bd 00 02 00 00 04     	cmpq	$0x4, 0x200(%rbp)
14011221b: 75 52                       	jne	0x14011226f <.text+0x11126f>
14011221d: 48 8b bd f8 01 00 00        	movq	0x1f8(%rbp), %rdi
140112224: 81 3f 48 65 72 6f           	cmpl	$0x6f726548, (%rdi)     # imm = 0x6F726548
14011222a: 75 43                       	jne	0x14011226f <.text+0x11126f>
14011222c: 48 8d 8d 60 01 00 00        	leaq	0x160(%rbp), %rcx
140112233: e8 b8 84 00 00              	callq	0x14011a6f0 <.text+0x1196f0>
140112238: 90                          	nop
140112239: 48 8b 95 f0 01 00 00        	movq	0x1f0(%rbp), %rdx
140112240: 48 85 d2                    	testq	%rdx, %rdx
140112243: 74 0e                       	je	0x140112253 <.text+0x111253>
140112245: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14011224b: 48 89 f9                    	movq	%rdi, %rcx
14011224e: e8 7d ff ee ff              	callq	0x1400021d0 <.text+0x11d0>
140112253: 48 8b 85 70 01 00 00        	movq	0x170(%rbp), %rax
14011225a: 48 89 85 00 02 00 00        	movq	%rax, 0x200(%rbp)
140112261: 0f 10 85 60 01 00 00        	movups	0x160(%rbp), %xmm0
140112268: 0f 29 85 f0 01 00 00        	movaps	%xmm0, 0x1f0(%rbp)
14011226f: 0f 28 85 f0 01 00 00        	movaps	0x1f0(%rbp), %xmm0
140112276: 48 8b 85 00 02 00 00        	movq	0x200(%rbp), %rax
14011227d: 48 8b 8d 08 02 00 00        	movq	0x208(%rbp), %rcx
140112284: 0f 28 8d 10 02 00 00        	movaps	0x210(%rbp), %xmm1
14011228b: 0f 28 95 20 02 00 00        	movaps	0x220(%rbp), %xmm2
140112292: 0f 11 56 30                 	movups	%xmm2, 0x30(%rsi)
140112296: 0f 11 4e 20                 	movups	%xmm1, 0x20(%rsi)
14011229a: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
14011229e: 48 89 4e 18                 	movq	%rcx, 0x18(%rsi)
1401122a2: 0f 11 06                    	movups	%xmm0, (%rsi)
1401122a5: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1401122a9: e8 f2 e5 f1 ff              	callq	0x1400308a0 <.text+0x2f8a0>
1401122ae: 48 89 f0                    	movq	%rsi, %rax
1401122b1: 48 81 c4 c0 02 00 00        	addq	$0x2c0, %rsp            # imm = 0x2C0
1401122b8: 5b                          	popq	%rbx
1401122b9: 5f                          	popq	%rdi
1401122ba: 5e                          	popq	%rsi
1401122bb: 41 5e                       	popq	%r14
1401122bd: 5d                          	popq	%rbp
1401122be: c3                          	retq


; Active startup account loader; missing/read error, sealed, damaged and legacy branches

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453f9d00: 55                          	pushq	%rbp
1453f9d01: 41 57                       	pushq	%r15
1453f9d03: 41 56                       	pushq	%r14
1453f9d05: 56                          	pushq	%rsi
1453f9d06: 57                          	pushq	%rdi
1453f9d07: 53                          	pushq	%rbx
1453f9d08: 48 81 ec a8 00 00 00        	subq	$0xa8, %rsp
1453f9d0f: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1453f9d17: 48 c7 45 20 fe ff ff ff     	movq	$-0x2, 0x20(%rbp)
1453f9d1f: 48 89 ce                    	movq	%rcx, %rsi
1453f9d22: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
1453f9d26: e8 05 76 02 00              	callq	0x145421330 <.text+0x5420330>
1453f9d2b: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
1453f9d2f: 48 83 f8 ff                 	cmpq	$-0x1, %rax
1453f9d33: 0f 84 94 00 00 00           	je	0x1453f9dcd <.text+0x53f8dcd>
1453f9d39: 48 89 45 08                 	movq	%rax, 0x8(%rbp)
1453f9d3d: 48 8b 4d f8                 	movq	-0x8(%rbp), %rcx
1453f9d41: 48 8b 7d 00                 	movq	(%rbp), %rdi
1453f9d45: 48 89 4d 18                 	movq	%rcx, 0x18(%rbp)
1453f9d49: 48 89 fa                    	movq	%rdi, %rdx
1453f9d4c: e8 1f 53 c5 fb              	callq	0x14104f070 <.text+0x104e070>
1453f9d51: 90                          	nop
1453f9d52: 48 83 fa 05                 	cmpq	$0x5, %rdx
1453f9d56: 72 1d                       	jb	0x1453f9d75 <.text+0x53f8d75>
1453f9d58: 8b 0d ac 90 4b 01           	movl	0x14b90ac(%rip), %ecx   # 0x1468b2e0a
1453f9d5e: 33 08                       	xorl	(%rax), %ecx
1453f9d60: 0f b6 15 a7 90 4b 01        	movzbl	0x14b90a7(%rip), %edx   # 0x1468b2e0e
1453f9d67: 32 50 04                    	xorb	0x4(%rax), %dl
1453f9d6a: 0f b6 c2                    	movzbl	%dl, %eax
1453f9d6d: 09 c8                       	orl	%ecx, %eax
1453f9d6f: 0f 84 bd 01 00 00           	je	0x1453f9f32 <.text+0x53f8f32>
1453f9d75: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453f9d79: 48 89 fa                    	movq	%rdi, %rdx
1453f9d7c: e8 4f 12 d1 fa              	callq	0x14010afd0 <.text+0x109fd0>
1453f9d81: 90                          	nop
1453f9d82: 48 85 d2                    	testq	%rdx, %rdx
1453f9d85: 0f 84 6c 01 00 00           	je	0x1453f9ef7 <.text+0x53f8ef7>
1453f9d8b: 48 8d 15 96 1f 2e 01        	leaq	0x12e1f96(%rip), %rdx   # 0x1466dbd28
1453f9d92: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
1453f9d96: 41 b8 11 00 00 00           	movl	$0x11, %r8d
1453f9d9c: e8 7f 78 02 00              	callq	0x145421620 <.text+0x5420620>
1453f9da1: 90                          	nop
1453f9da2: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
1453f9da6: 48 83 fa ff                 	cmpq	$-0x1, %rdx
1453f9daa: 0f 84 2e 01 00 00           	je	0x1453f9ede <.text+0x53f8ede>
1453f9db0: 48 85 d2                    	testq	%rdx, %rdx
1453f9db3: 0f 84 3e 01 00 00           	je	0x1453f9ef7 <.text+0x53f8ef7>
1453f9db9: 48 8b 4d f8                 	movq	-0x8(%rbp), %rcx
1453f9dbd: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f9dc3: e8 08 84 c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f9dc8: e9 2a 01 00 00              	jmp	0x1453f9ef7 <.text+0x53f8ef7>
1453f9dcd: 0f 57 c0                    	xorps	%xmm0, %xmm0
1453f9dd0: 0f 11 86 98 01 00 00        	movups	%xmm0, 0x198(%rsi)
1453f9dd7: 0f 11 86 88 01 00 00        	movups	%xmm0, 0x188(%rsi)
1453f9dde: 0f 11 86 78 01 00 00        	movups	%xmm0, 0x178(%rsi)
1453f9de5: 48 c7 86 a8 01 00 00 00 00 00 00    	movq	$0x0, 0x1a8(%rsi)
1453f9df0: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
1453f9df7: 48 c7 46 08 08 00 00 00     	movq	$0x8, 0x8(%rsi)
1453f9dff: 0f 11 46 10                 	movups	%xmm0, 0x10(%rsi)
1453f9e03: 48 c7 86 38 01 00 00 ff ff ff ff    	movq	$-0x1, 0x138(%rsi)
1453f9e0e: 48 c7 46 20 08 00 00 00     	movq	$0x8, 0x20(%rsi)
1453f9e16: 0f 11 46 28                 	movups	%xmm0, 0x28(%rsi)
1453f9e1a: 48 c7 46 38 04 00 00 00     	movq	$0x4, 0x38(%rsi)
1453f9e22: 0f 11 46 40                 	movups	%xmm0, 0x40(%rsi)
1453f9e26: 48 c7 46 50 04 00 00 00     	movq	$0x4, 0x50(%rsi)
1453f9e2e: 0f 11 46 58                 	movups	%xmm0, 0x58(%rsi)
1453f9e32: 48 c7 46 68 08 00 00 00     	movq	$0x8, 0x68(%rsi)
1453f9e3a: 0f 11 46 70                 	movups	%xmm0, 0x70(%rsi)
1453f9e3e: 48 c7 86 80 00 00 00 08 00 00 00    	movq	$0x8, 0x80(%rsi)
1453f9e49: 0f 11 86 88 00 00 00        	movups	%xmm0, 0x88(%rsi)
1453f9e50: 48 c7 86 98 00 00 00 08 00 00 00    	movq	$0x8, 0x98(%rsi)
1453f9e5b: 0f 11 86 a0 00 00 00        	movups	%xmm0, 0xa0(%rsi)
1453f9e62: 48 c7 86 b0 00 00 00 08 00 00 00    	movq	$0x8, 0xb0(%rsi)
1453f9e6d: 0f 11 86 b8 00 00 00        	movups	%xmm0, 0xb8(%rsi)
1453f9e74: 48 c7 86 c8 00 00 00 08 00 00 00    	movq	$0x8, 0xc8(%rsi)
1453f9e7f: 0f 11 86 d0 00 00 00        	movups	%xmm0, 0xd0(%rsi)
1453f9e86: 48 c7 86 e0 00 00 00 08 00 00 00    	movq	$0x8, 0xe0(%rsi)
1453f9e91: 0f 11 86 e8 00 00 00        	movups	%xmm0, 0xe8(%rsi)
1453f9e98: 48 c7 86 f8 00 00 00 04 00 00 00    	movq	$0x4, 0xf8(%rsi)
1453f9ea3: c7 86 b0 01 00 00 00 00 00 00       	movl	$0x0, 0x1b0(%rsi)
1453f9ead: 0f 11 86 00 01 00 00        	movups	%xmm0, 0x100(%rsi)
1453f9eb4: 48 c7 86 10 01 00 00 08 00 00 00    	movq	$0x8, 0x110(%rsi)
1453f9ebf: 0f 11 86 18 01 00 00        	movups	%xmm0, 0x118(%rsi)
1453f9ec6: 48 c7 86 28 01 00 00 01 00 00 00    	movq	$0x1, 0x128(%rsi)
1453f9ed1: 48 c7 86 30 01 00 00 00 00 00 00    	movq	$0x0, 0x130(%rsi)
1453f9edc: eb 41                       	jmp	0x1453f9f1f <.text+0x53f8f1f>
1453f9ede: 48 8d 0d 43 1e 2e 01        	leaq	0x12e1e43(%rip), %rcx   # 0x1466dbd28
1453f9ee5: ba 11 00 00 00              	movl	$0x11, %edx
1453f9eea: 4c 8b 45 18                 	movq	0x18(%rbp), %r8
1453f9eee: 49 89 f9                    	movq	%rdi, %r9
1453f9ef1: e8 fa 6d 02 00              	callq	0x145420cf0 <.text+0x541fcf0>
1453f9ef6: 90                          	nop
1453f9ef7: 48 89 f1                    	movq	%rsi, %rcx
1453f9efa: 48 8b 55 18                 	movq	0x18(%rbp), %rdx
1453f9efe: 49 89 f8                    	movq	%rdi, %r8
1453f9f01: e8 fa 0b 00 00              	callq	0x1453fab00 <.text+0x53f9b00>
1453f9f06: 90                          	nop
1453f9f07: 48 8b 55 08                 	movq	0x8(%rbp), %rdx
1453f9f0b: 48 85 d2                    	testq	%rdx, %rdx
1453f9f0e: 74 0f                       	je	0x1453f9f1f <.text+0x53f8f1f>
1453f9f10: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f9f16: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453f9f1a: e8 b1 82 c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f9f1f: 48 89 f0                    	movq	%rsi, %rax
1453f9f22: 48 81 c4 a8 00 00 00        	addq	$0xa8, %rsp
1453f9f29: 5b                          	popq	%rbx
1453f9f2a: 5f                          	popq	%rdi
1453f9f2b: 5e                          	popq	%rsi
1453f9f2c: 41 5e                       	popq	%r14
1453f9f2e: 41 5f                       	popq	%r15
1453f9f30: 5d                          	popq	%rbp
1453f9f31: c3                          	retq
1453f9f32: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1453f9f36: 48 8b 55 18                 	movq	0x18(%rbp), %rdx
1453f9f3a: 49 89 f8                    	movq	%rdi, %r8
1453f9f3d: e8 ae ca 05 00              	callq	0x1454569f0 <.text+0x54559f0>
1453f9f42: 90                          	nop
1453f9f43: 48 8b 45 a8                 	movq	-0x58(%rbp), %rax
1453f9f47: 48 83 f8 ff                 	cmpq	$-0x1, %rax
1453f9f4b: 74 39                       	je	0x1453f9f86 <.text+0x53f8f86>
1453f9f4d: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1453f9f51: 48 8b 55 b0                 	movq	-0x50(%rbp), %rdx
1453f9f55: 4c 8b 45 b8                 	movq	-0x48(%rbp), %r8
1453f9f59: 48 89 f1                    	movq	%rsi, %rcx
1453f9f5c: 48 89 55 e8                 	movq	%rdx, -0x18(%rbp)
1453f9f60: e8 9b 0b 00 00              	callq	0x1453fab00 <.text+0x53f9b00>
1453f9f65: 90                          	nop
1453f9f66: 48 8b 55 10                 	movq	0x10(%rbp), %rdx
1453f9f6a: 48 85 d2                    	testq	%rdx, %rdx
1453f9f6d: 48 8b 7d 08                 	movq	0x8(%rbp), %rdi
1453f9f71: 0f 84 6a 05 00 00           	je	0x1453fa4e1 <.text+0x53f94e1>
1453f9f77: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f9f7d: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
1453f9f81: e9 56 05 00 00              	jmp	0x1453fa4dc <.text+0x53f94dc>
1453f9f86: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f9f8c: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453f9f90: 48 89 fa                    	movq	%rdi, %rdx
1453f9f93: e8 38 eb ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453f9f98: 90                          	nop
1453f9f99: a8 01                       	testb	$0x1, %al
1453f9f9b: 0f 85 16 03 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453f9fa1: 41 b8 02 00 00 00           	movl	$0x2, %r8d
1453f9fa7: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453f9fab: 48 89 fa                    	movq	%rdi, %rdx
1453f9fae: e8 1d eb ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453f9fb3: 90                          	nop
1453f9fb4: a8 01                       	testb	$0x1, %al
1453f9fb6: 0f 85 fb 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453f9fbc: 41 b8 03 00 00 00           	movl	$0x3, %r8d
1453f9fc2: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453f9fc6: 48 89 fa                    	movq	%rdi, %rdx
1453f9fc9: e8 02 eb ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453f9fce: 90                          	nop
1453f9fcf: a8 01                       	testb	$0x1, %al
1453f9fd1: 0f 85 e0 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453f9fd7: 41 b8 04 00 00 00           	movl	$0x4, %r8d
1453f9fdd: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453f9fe1: 48 89 fa                    	movq	%rdi, %rdx
1453f9fe4: e8 e7 ea ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453f9fe9: 90                          	nop
1453f9fea: a8 01                       	testb	$0x1, %al
1453f9fec: 0f 85 c5 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453f9ff2: 41 b8 05 00 00 00           	movl	$0x5, %r8d
1453f9ff8: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453f9ffc: 48 89 fa                    	movq	%rdi, %rdx
1453f9fff: e8 cc ea ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa004: 90                          	nop
1453fa005: a8 01                       	testb	$0x1, %al
1453fa007: 0f 85 aa 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa00d: 41 b8 06 00 00 00           	movl	$0x6, %r8d
1453fa013: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa017: 48 89 fa                    	movq	%rdi, %rdx
1453fa01a: e8 b1 ea ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa01f: 90                          	nop
1453fa020: a8 01                       	testb	$0x1, %al
1453fa022: 0f 85 8f 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa028: 41 b8 07 00 00 00           	movl	$0x7, %r8d
1453fa02e: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa032: 48 89 fa                    	movq	%rdi, %rdx
1453fa035: e8 96 ea ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa03a: 90                          	nop
1453fa03b: a8 01                       	testb	$0x1, %al
1453fa03d: 0f 85 74 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa043: 41 b8 08 00 00 00           	movl	$0x8, %r8d
1453fa049: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa04d: 48 89 fa                    	movq	%rdi, %rdx
1453fa050: e8 7b ea ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa055: 90                          	nop
1453fa056: a8 01                       	testb	$0x1, %al
1453fa058: 0f 85 59 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa05e: 41 b8 09 00 00 00           	movl	$0x9, %r8d
1453fa064: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa068: 48 89 fa                    	movq	%rdi, %rdx
1453fa06b: e8 60 ea ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa070: 90                          	nop
1453fa071: a8 01                       	testb	$0x1, %al
1453fa073: 0f 85 3e 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa079: 41 b8 0a 00 00 00           	movl	$0xa, %r8d
1453fa07f: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa083: 48 89 fa                    	movq	%rdi, %rdx
1453fa086: e8 45 ea ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa08b: 90                          	nop
1453fa08c: a8 01                       	testb	$0x1, %al
1453fa08e: 0f 85 23 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa094: 41 b8 0b 00 00 00           	movl	$0xb, %r8d
1453fa09a: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa09e: 48 89 fa                    	movq	%rdi, %rdx
1453fa0a1: e8 2a ea ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa0a6: 90                          	nop
1453fa0a7: a8 01                       	testb	$0x1, %al
1453fa0a9: 0f 85 08 02 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa0af: 41 b8 0c 00 00 00           	movl	$0xc, %r8d
1453fa0b5: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa0b9: 48 89 fa                    	movq	%rdi, %rdx
1453fa0bc: e8 0f ea ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa0c1: 90                          	nop
1453fa0c2: a8 01                       	testb	$0x1, %al
1453fa0c4: 0f 85 ed 01 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa0ca: 41 b8 0d 00 00 00           	movl	$0xd, %r8d
1453fa0d0: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa0d4: 48 89 fa                    	movq	%rdi, %rdx
1453fa0d7: e8 f4 e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa0dc: 90                          	nop
1453fa0dd: a8 01                       	testb	$0x1, %al
1453fa0df: 0f 85 d2 01 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa0e5: 41 b8 0e 00 00 00           	movl	$0xe, %r8d
1453fa0eb: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa0ef: 48 89 fa                    	movq	%rdi, %rdx
1453fa0f2: e8 d9 e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa0f7: 90                          	nop
1453fa0f8: a8 01                       	testb	$0x1, %al
1453fa0fa: 0f 85 b7 01 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa100: 41 b8 0f 00 00 00           	movl	$0xf, %r8d
1453fa106: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa10a: 48 89 fa                    	movq	%rdi, %rdx
1453fa10d: e8 be e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa112: 90                          	nop
1453fa113: a8 01                       	testb	$0x1, %al
1453fa115: 0f 85 9c 01 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa11b: 41 b8 10 00 00 00           	movl	$0x10, %r8d
1453fa121: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa125: 48 89 fa                    	movq	%rdi, %rdx
1453fa128: e8 a3 e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa12d: 90                          	nop
1453fa12e: a8 01                       	testb	$0x1, %al
1453fa130: 0f 85 81 01 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa136: 41 b8 11 00 00 00           	movl	$0x11, %r8d
1453fa13c: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa140: 48 89 fa                    	movq	%rdi, %rdx
1453fa143: e8 88 e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa148: 90                          	nop
1453fa149: a8 01                       	testb	$0x1, %al
1453fa14b: 0f 85 66 01 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa151: 41 b8 12 00 00 00           	movl	$0x12, %r8d
1453fa157: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa15b: 48 89 fa                    	movq	%rdi, %rdx
1453fa15e: e8 6d e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa163: 90                          	nop
1453fa164: a8 01                       	testb	$0x1, %al
1453fa166: 0f 85 4b 01 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa16c: 41 b8 13 00 00 00           	movl	$0x13, %r8d
1453fa172: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa176: 48 89 fa                    	movq	%rdi, %rdx
1453fa179: e8 52 e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa17e: 90                          	nop
1453fa17f: a8 01                       	testb	$0x1, %al
1453fa181: 0f 85 30 01 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa187: 41 b8 14 00 00 00           	movl	$0x14, %r8d
1453fa18d: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa191: 48 89 fa                    	movq	%rdi, %rdx
1453fa194: e8 37 e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa199: 90                          	nop
1453fa19a: a8 01                       	testb	$0x1, %al
1453fa19c: 0f 85 15 01 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa1a2: 41 b8 15 00 00 00           	movl	$0x15, %r8d
1453fa1a8: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa1ac: 48 89 fa                    	movq	%rdi, %rdx
1453fa1af: e8 1c e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa1b4: 90                          	nop
1453fa1b5: a8 01                       	testb	$0x1, %al
1453fa1b7: 0f 85 fa 00 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa1bd: 41 b8 16 00 00 00           	movl	$0x16, %r8d
1453fa1c3: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa1c7: 48 89 fa                    	movq	%rdi, %rdx
1453fa1ca: e8 01 e9 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa1cf: 90                          	nop
1453fa1d0: a8 01                       	testb	$0x1, %al
1453fa1d2: 0f 85 df 00 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa1d8: 41 b8 17 00 00 00           	movl	$0x17, %r8d
1453fa1de: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa1e2: 48 89 fa                    	movq	%rdi, %rdx
1453fa1e5: e8 e6 e8 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa1ea: 90                          	nop
1453fa1eb: a8 01                       	testb	$0x1, %al
1453fa1ed: 0f 85 c4 00 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa1f3: 41 b8 18 00 00 00           	movl	$0x18, %r8d
1453fa1f9: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa1fd: 48 89 fa                    	movq	%rdi, %rdx
1453fa200: e8 cb e8 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa205: 90                          	nop
1453fa206: a8 01                       	testb	$0x1, %al
1453fa208: 0f 85 a9 00 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa20e: 41 b8 19 00 00 00           	movl	$0x19, %r8d
1453fa214: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa218: 48 89 fa                    	movq	%rdi, %rdx
1453fa21b: e8 b0 e8 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa220: 90                          	nop
1453fa221: a8 01                       	testb	$0x1, %al
1453fa223: 0f 85 8e 00 00 00           	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa229: 41 b8 1a 00 00 00           	movl	$0x1a, %r8d
1453fa22f: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa233: 48 89 fa                    	movq	%rdi, %rdx
1453fa236: e8 95 e8 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa23b: 90                          	nop
1453fa23c: a8 01                       	testb	$0x1, %al
1453fa23e: 75 77                       	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa240: 41 b8 1b 00 00 00           	movl	$0x1b, %r8d
1453fa246: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa24a: 48 89 fa                    	movq	%rdi, %rdx
1453fa24d: e8 7e e8 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa252: 90                          	nop
1453fa253: a8 01                       	testb	$0x1, %al
1453fa255: 75 60                       	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa257: 41 b8 1c 00 00 00           	movl	$0x1c, %r8d
1453fa25d: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa261: 48 89 fa                    	movq	%rdi, %rdx
1453fa264: e8 67 e8 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa269: 90                          	nop
1453fa26a: a8 01                       	testb	$0x1, %al
1453fa26c: 75 49                       	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa26e: 41 b8 1d 00 00 00           	movl	$0x1d, %r8d
1453fa274: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa278: 48 89 fa                    	movq	%rdi, %rdx
1453fa27b: e8 50 e8 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa280: 90                          	nop
1453fa281: a8 01                       	testb	$0x1, %al
1453fa283: 75 32                       	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa285: 41 b8 1e 00 00 00           	movl	$0x1e, %r8d
1453fa28b: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa28f: 48 89 fa                    	movq	%rdi, %rdx
1453fa292: e8 39 e8 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa297: 90                          	nop
1453fa298: a8 01                       	testb	$0x1, %al
1453fa29a: 75 1b                       	jne	0x1453fa2b7 <.text+0x53f92b7>
1453fa29c: 41 b8 1f 00 00 00           	movl	$0x1f, %r8d
1453fa2a2: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa2a6: 48 89 fa                    	movq	%rdi, %rdx
1453fa2a9: e8 22 e8 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa2ae: 90                          	nop
1453fa2af: a8 01                       	testb	$0x1, %al
1453fa2b1: 0f 84 45 02 00 00           	je	0x1453fa4fc <.text+0x53f94fc>
1453fa2b7: 48 89 d3                    	movq	%rdx, %rbx
1453fa2ba: 48 89 5d d8                 	movq	%rbx, -0x28(%rbp)
1453fa2be: 4c 8d 75 d8                 	leaq	-0x28(%rbp), %r14
1453fa2c2: 4c 89 75 c0                 	movq	%r14, -0x40(%rbp)
1453fa2c6: 4c 8d 3d 83 28 2e 00        	leaq	0x2e2883(%rip), %r15    # 0x1456dcb50 <.text+0x56dbb50>
1453fa2cd: 4c 89 7d c8                 	movq	%r15, -0x38(%rbp)
1453fa2d1: 48 8d 15 d8 19 2e 01        	leaq	0x12e19d8(%rip), %rdx   # 0x1466dbcb0
1453fa2d8: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
1453fa2dc: 4c 8d 45 c0                 	leaq	-0x40(%rbp), %r8
1453fa2e0: e8 bb f8 2c 00              	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453fa2e5: 90                          	nop
1453fa2e6: 48 8b 4d f8                 	movq	-0x8(%rbp), %rcx
1453fa2ea: 48 8b 55 00                 	movq	(%rbp), %rdx
1453fa2ee: 48 89 4d 10                 	movq	%rcx, 0x10(%rbp)
1453fa2f2: 4c 8b 45 18                 	movq	0x18(%rbp), %r8
1453fa2f6: 49 89 f9                    	movq	%rdi, %r9
1453fa2f9: e8 f2 69 02 00              	callq	0x145420cf0 <.text+0x541fcf0>
1453fa2fe: 90                          	nop
1453fa2ff: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
1453fa303: 48 85 d2                    	testq	%rdx, %rdx
1453fa306: 74 0f                       	je	0x1453fa317 <.text+0x53f9317>
1453fa308: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453fa30e: 48 8b 4d 10                 	movq	0x10(%rbp), %rcx
1453fa312: e8 b9 7e c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453fa317: 48 89 5d d8                 	movq	%rbx, -0x28(%rbp)
1453fa31b: 4c 89 75 f0                 	movq	%r14, -0x10(%rbp)
1453fa31f: 4c 89 7d f8                 	movq	%r15, -0x8(%rbp)
1453fa323: 48 8d 15 86 19 2e 01        	leaq	0x12e1986(%rip), %rdx   # 0x1466dbcb0
1453fa32a: 48 8d 7d c0                 	leaq	-0x40(%rbp), %rdi
1453fa32e: 4c 8d 45 f0                 	leaq	-0x10(%rbp), %r8
1453fa332: 48 89 f9                    	movq	%rdi, %rcx
1453fa335: e8 66 f8 2c 00              	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453fa33a: 90                          	nop
1453fa33b: 48 89 7d d8                 	movq	%rdi, -0x28(%rbp)
1453fa33f: 48 8d 05 9a 7d c0 fa        	leaq	-0x53f8266(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1453fa346: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1453fa34a: 48 8d 15 e8 19 2e 01        	leaq	0x12e19e8(%rip), %rdx   # 0x1466dbd39
1453fa351: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
1453fa355: 48 8d 7d d8                 	leaq	-0x28(%rbp), %rdi
1453fa359: 49 89 f8                    	movq	%rdi, %r8
1453fa35c: e8 3f f8 2c 00              	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453fa361: 90                          	nop
1453fa362: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
1453fa366: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
1453fa36a: 48 8b 4d f8                 	movq	-0x8(%rbp), %rcx
1453fa36e: 48 8b 45 00                 	movq	(%rbp), %rax
1453fa372: 48 89 4d e8                 	movq	%rcx, -0x18(%rbp)
1453fa376: 48 89 4d d8                 	movq	%rcx, -0x28(%rbp)
1453fa37a: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1453fa37e: 48 89 7d f0                 	movq	%rdi, -0x10(%rbp)
1453fa382: 48 8d 05 37 7d c0 fa        	leaq	-0x53f82c9(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1453fa389: 48 89 45 f8                 	movq	%rax, -0x8(%rbp)
1453fa38d: 48 8d 0d 22 64 2e 01        	leaq	0x12e6422(%rip), %rcx   # 0x1466e07b6
1453fa394: 48 8d 55 f0                 	leaq	-0x10(%rbp), %rdx
1453fa398: e8 03 94 2b 00              	callq	0x1456b37a0 <.text+0x56b27a0>
1453fa39d: 90                          	nop
1453fa39e: 48 8b 55 10                 	movq	0x10(%rbp), %rdx
1453fa3a2: 48 85 d2                    	testq	%rdx, %rdx
1453fa3a5: 74 0f                       	je	0x1453fa3b6 <.text+0x53f93b6>
1453fa3a7: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453fa3ad: 48 8b 4d e8                 	movq	-0x18(%rbp), %rcx
1453fa3b1: e8 1a 7e c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453fa3b6: 0f 57 c0                    	xorps	%xmm0, %xmm0
1453fa3b9: 0f 11 86 98 01 00 00        	movups	%xmm0, 0x198(%rsi)
1453fa3c0: 0f 11 86 88 01 00 00        	movups	%xmm0, 0x188(%rsi)
1453fa3c7: 0f 11 86 78 01 00 00        	movups	%xmm0, 0x178(%rsi)
1453fa3ce: 48 c7 86 a8 01 00 00 00 00 00 00    	movq	$0x0, 0x1a8(%rsi)
1453fa3d9: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
1453fa3e0: 48 c7 46 08 08 00 00 00     	movq	$0x8, 0x8(%rsi)
1453fa3e8: 0f 11 46 10                 	movups	%xmm0, 0x10(%rsi)
1453fa3ec: 48 c7 86 38 01 00 00 ff ff ff ff    	movq	$-0x1, 0x138(%rsi)
1453fa3f7: 48 c7 46 20 08 00 00 00     	movq	$0x8, 0x20(%rsi)
1453fa3ff: 0f 11 46 28                 	movups	%xmm0, 0x28(%rsi)
1453fa403: 48 c7 46 38 04 00 00 00     	movq	$0x4, 0x38(%rsi)
1453fa40b: 0f 11 46 40                 	movups	%xmm0, 0x40(%rsi)
1453fa40f: 48 c7 46 50 04 00 00 00     	movq	$0x4, 0x50(%rsi)
1453fa417: 0f 11 46 58                 	movups	%xmm0, 0x58(%rsi)
1453fa41b: 48 c7 46 68 08 00 00 00     	movq	$0x8, 0x68(%rsi)
1453fa423: 0f 11 46 70                 	movups	%xmm0, 0x70(%rsi)
1453fa427: 48 c7 86 80 00 00 00 08 00 00 00    	movq	$0x8, 0x80(%rsi)
1453fa432: 0f 11 86 88 00 00 00        	movups	%xmm0, 0x88(%rsi)
1453fa439: 48 c7 86 98 00 00 00 08 00 00 00    	movq	$0x8, 0x98(%rsi)
1453fa444: 0f 11 86 a0 00 00 00        	movups	%xmm0, 0xa0(%rsi)
1453fa44b: 48 c7 86 b0 00 00 00 08 00 00 00    	movq	$0x8, 0xb0(%rsi)
1453fa456: 0f 11 86 b8 00 00 00        	movups	%xmm0, 0xb8(%rsi)
1453fa45d: 48 c7 86 c8 00 00 00 08 00 00 00    	movq	$0x8, 0xc8(%rsi)
1453fa468: 0f 11 86 d0 00 00 00        	movups	%xmm0, 0xd0(%rsi)
1453fa46f: 48 c7 86 e0 00 00 00 08 00 00 00    	movq	$0x8, 0xe0(%rsi)
1453fa47a: 0f 11 86 e8 00 00 00        	movups	%xmm0, 0xe8(%rsi)
1453fa481: 48 c7 86 f8 00 00 00 04 00 00 00    	movq	$0x4, 0xf8(%rsi)
1453fa48c: c7 86 b0 01 00 00 00 00 00 00       	movl	$0x0, 0x1b0(%rsi)
1453fa496: 0f 11 86 00 01 00 00        	movups	%xmm0, 0x100(%rsi)
1453fa49d: 48 c7 86 10 01 00 00 08 00 00 00    	movq	$0x8, 0x110(%rsi)
1453fa4a8: 0f 11 86 18 01 00 00        	movups	%xmm0, 0x118(%rsi)
1453fa4af: 48 c7 86 28 01 00 00 01 00 00 00    	movq	$0x1, 0x128(%rsi)
1453fa4ba: 48 c7 86 30 01 00 00 00 00 00 00    	movq	$0x0, 0x130(%rsi)
1453fa4c5: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1453fa4c9: 48 85 d2                    	testq	%rdx, %rdx
1453fa4cc: 48 8b 7d 08                 	movq	0x8(%rbp), %rdi
1453fa4d0: 74 0f                       	je	0x1453fa4e1 <.text+0x53f94e1>
1453fa4d2: 48 8b 4d c8                 	movq	-0x38(%rbp), %rcx
1453fa4d6: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453fa4dc: e8 ef 7c c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453fa4e1: 48 85 ff                    	testq	%rdi, %rdi
1453fa4e4: 0f 84 35 fa ff ff           	je	0x1453f9f1f <.text+0x53f8f1f>
1453fa4ea: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453fa4f0: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa4f4: 48 89 fa                    	movq	%rdi, %rdx
1453fa4f7: e9 1e fa ff ff              	jmp	0x1453f9f1a <.text+0x53f8f1a>
1453fa4fc: bb 20 00 00 00              	movl	$0x20, %ebx
1453fa501: 41 b8 20 00 00 00           	movl	$0x20, %r8d
1453fa507: 48 8b 4d 18                 	movq	0x18(%rbp), %rcx
1453fa50b: 48 89 fa                    	movq	%rdi, %rdx
1453fa50e: e8 bd e5 ff ff              	callq	0x1453f8ad0 <.text+0x53f7ad0>
1453fa513: 90                          	nop
1453fa514: a8 01                       	testb	$0x1, %al
1453fa516: 48 0f 45 da                 	cmovneq	%rdx, %rbx
1453fa51a: e9 9b fd ff ff              	jmp	0x1453fa2ba <.text+0x53f92ba>


; Active reader converts every IO/UTF8 read error into None without logging

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145421330: 55                          	pushq	%rbp
145421331: 56                          	pushq	%rsi
145421332: 48 83 ec 68                 	subq	$0x68, %rsp
145421336: 48 8d 6c 24 60              	leaq	0x60(%rsp), %rbp
14542133b: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
145421343: 48 89 ce                    	movq	%rcx, %rsi
145421346: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
14542134a: e8 d1 fe ff ff              	callq	0x145421220 <.text+0x5420220>
14542134f: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
145421353: 48 83 f8 ff                 	cmpq	$-0x1, %rax
145421357: 74 4a                       	je	0x1454213a3 <.text+0x54203a3>
145421359: 48 89 45 f8                 	movq	%rax, -0x8(%rbp)
14542135d: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx
145421361: 4c 8b 45 e0                 	movq	-0x20(%rbp), %r8
145421365: 48 8d 4d d0                 	leaq	-0x30(%rbp), %rcx
145421369: 48 89 55 f0                 	movq	%rdx, -0x10(%rbp)
14542136d: e8 8e 8c 29 00              	callq	0x1456ba000 <.text+0x56b9000>
145421372: 90                          	nop
145421373: 48 8b 55 f8                 	movq	-0x8(%rbp), %rdx
145421377: 48 85 d2                    	testq	%rdx, %rdx
14542137a: 74 0f                       	je	0x14542138b <.text+0x542038b>
14542137c: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145421382: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
145421386: e8 45 0e be fa              	callq	0x1400021d0 <.text+0x11d0>
14542138b: 48 83 7d d0 ff              	cmpq	$-0x1, -0x30(%rbp)
145421390: 74 1a                       	je	0x1454213ac <.text+0x54203ac>
145421392: 48 8b 45 e0                 	movq	-0x20(%rbp), %rax
145421396: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
14542139a: 0f 10 45 d0                 	movups	-0x30(%rbp), %xmm0
14542139e: 0f 11 06                    	movups	%xmm0, (%rsi)
1454213a1: eb 3a                       	jmp	0x1454213dd <.text+0x54203dd>
1454213a3: 48 c7 06 ff ff ff ff        	movq	$-0x1, (%rsi)
1454213aa: eb 31                       	jmp	0x1454213dd <.text+0x54203dd>
1454213ac: 48 c7 06 ff ff ff ff        	movq	$-0x1, (%rsi)
1454213b3: 48 8b 45 d8                 	movq	-0x28(%rbp), %rax
1454213b7: 89 c1                       	movl	%eax, %ecx
1454213b9: 83 e1 03                    	andl	$0x3, %ecx
1454213bc: 8d 51 fe                    	leal	-0x2(%rcx), %edx
1454213bf: 83 fa 02                    	cmpl	$0x2, %edx
1454213c2: 72 19                       	jb	0x1454213dd <.text+0x54203dd>
1454213c4: 48 85 c9                    	testq	%rcx, %rcx
1454213c7: 74 14                       	je	0x1454213dd <.text+0x54203dd>
1454213c9: 48 ff c8                    	decq	%rax
1454213cc: 48 8d 4d c8                 	leaq	-0x38(%rbp), %rcx
1454213d0: 48 89 45 c8                 	movq	%rax, -0x38(%rbp)
1454213d4: c6 45 c0 03                 	movb	$0x3, -0x40(%rbp)
1454213d8: e8 63 b7 2b 00              	callq	0x1456dcb40 <.text+0x56dbb40>
1454213dd: 48 89 f0                    	movq	%rsi, %rax
1454213e0: 48 83 c4 68                 	addq	$0x68, %rsp
1454213e4: 5e                          	popq	%rsi
1454213e5: 5d                          	popq	%rbp
1454213e6: c3                          	retq


; Read-to-string implementation; UTF8 validator error uses static146ae1428

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1456ba000: 55                          	pushq	%rbp
1456ba001: 56                          	pushq	%rsi
1456ba002: 57                          	pushq	%rdi
1456ba003: 53                          	pushq	%rbx
1456ba004: 48 81 ec c8 00 00 00        	subq	$0xc8, %rsp
1456ba00b: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
1456ba013: 48 c7 45 40 fe ff ff ff     	movq	$-0x2, 0x40(%rbp)
1456ba01b: 4c 89 c0                    	movq	%r8, %rax
1456ba01e: 48 89 ce                    	movq	%rcx, %rsi
1456ba021: c7 45 a8 00 00 00 00        	movl	$0x0, -0x58(%rbp)
1456ba028: 48 c7 45 b0 00 00 00 00     	movq	$0x0, -0x50(%rbp)
1456ba030: c7 45 b8 07 00 00 00        	movl	$0x7, -0x48(%rbp)
1456ba037: 48 c7 45 bc 00 00 00 00     	movq	$0x0, -0x44(%rbp)
1456ba03f: 48 c7 45 c1 00 00 00 00     	movq	$0x0, -0x3f(%rbp)
1456ba047: c6 45 c0 01                 	movb	$0x1, -0x40(%rbp)
1456ba04b: 4c 8d 45 a8                 	leaq	-0x58(%rbp), %r8
1456ba04f: 48 89 d1                    	movq	%rdx, %rcx
1456ba052: 48 89 c2                    	movq	%rax, %rdx
1456ba055: e8 56 c8 fe ff              	callq	0x1456a68b0 <.text+0x56a58b0>
1456ba05a: a8 01                       	testb	$0x1, %al
1456ba05c: 74 10                       	je	0x1456ba06e <.text+0x56b906e>
1456ba05e: 48 89 56 08                 	movq	%rdx, 0x8(%rsi)
1456ba062: 48 c7 06 ff ff ff ff        	movq	$-0x1, (%rsi)
1456ba069: e9 5d 01 00 00              	jmp	0x1456ba1cb <.text+0x56b91cb>
1456ba06e: 48 89 55 20                 	movq	%rdx, 0x20(%rbp)
1456ba072: 48 89 55 00                 	movq	%rdx, (%rbp)
1456ba076: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1456ba07a: 48 89 ea                    	movq	%rbp, %rdx
1456ba07d: e8 3e c9 fe ff              	callq	0x1456a69c0 <.text+0x56a59c0>
1456ba082: 90                          	nop
1456ba083: 83 7d a8 02                 	cmpl	$0x2, -0x58(%rbp)
1456ba087: 75 2f                       	jne	0x1456ba0b8 <.text+0x56b90b8>
1456ba089: 48 8b 45 b0                 	movq	-0x50(%rbp), %rax
1456ba08d: 89 c1                       	movl	%eax, %ecx
1456ba08f: 83 e1 03                    	andl	$0x3, %ecx
1456ba092: 8d 51 fe                    	leal	-0x2(%rcx), %edx
1456ba095: 83 fa 02                    	cmpl	$0x2, %edx
1456ba098: 72 1a                       	jb	0x1456ba0b4 <.text+0x56b90b4>
1456ba09a: 48 85 c9                    	testq	%rcx, %rcx
1456ba09d: 74 15                       	je	0x1456ba0b4 <.text+0x56b90b4>
1456ba09f: 48 ff c8                    	decq	%rax
1456ba0a2: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1456ba0a6: 48 89 45 b0                 	movq	%rax, -0x50(%rbp)
1456ba0aa: c6 45 a8 03                 	movb	$0x3, -0x58(%rbp)
1456ba0ae: e8 8d 2a 02 00              	callq	0x1456dcb40 <.text+0x56dbb40>
1456ba0b3: 90                          	nop
1456ba0b4: 31 ff                       	xorl	%edi, %edi
1456ba0b6: eb 09                       	jmp	0x1456ba0c1 <.text+0x56b90c1>
1456ba0b8: 48 8b 5d e0                 	movq	-0x20(%rbp), %rbx
1456ba0bc: bf 01 00 00 00              	movl	$0x1, %edi
1456ba0c1: 48 c7 45 28 00 00 00 00     	movq	$0x0, 0x28(%rbp)
1456ba0c9: 48 c7 45 30 01 00 00 00     	movq	$0x1, 0x30(%rbp)
1456ba0d1: 48 c7 45 38 00 00 00 00     	movq	$0x0, 0x38(%rbp)
1456ba0d9: 48 85 ff                    	testq	%rdi, %rdi
1456ba0dc: 48 89 da                    	movq	%rbx, %rdx
1456ba0df: 48 0f 44 d7                 	cmoveq	%rdi, %rdx
1456ba0e3: 48 8d 4d 28                 	leaq	0x28(%rbp), %rcx
1456ba0e7: e8 34 d7 00 00              	callq	0x1456c7820 <.text+0x56c6820>
1456ba0ec: 90                          	nop
1456ba0ed: 48 83 f8 ff                 	cmpq	$-0x1, %rax
1456ba0f1: 74 10                       	je	0x1456ba103 <.text+0x56b9103>
1456ba0f3: 48 b9 03 00 00 00 26 00 00 00       	movabsq	$0x2600000003, %rcx # imm = 0x2600000003
1456ba0fd: 48 8b 7d 20                 	movq	0x20(%rbp), %rdi
1456ba101: eb 72                       	jmp	0x1456ba175 <.text+0x56b9175>
1456ba103: 48 8b 45 38                 	movq	0x38(%rbp), %rax
1456ba107: 48 89 45 08                 	movq	%rax, 0x8(%rbp)
1456ba10b: 48 89 e9                    	movq	%rbp, %rcx
1456ba10e: 48 8d 55 28                 	leaq	0x28(%rbp), %rdx
1456ba112: 49 89 f8                    	movq	%rdi, %r8
1456ba115: 49 89 d9                    	movq	%rbx, %r9
1456ba118: e8 23 46 fe ff              	callq	0x14569e740 <.text+0x569d740>
1456ba11d: 48 89 45 18                 	movq	%rax, 0x18(%rbp)
1456ba121: 48 89 55 10                 	movq	%rdx, 0x10(%rbp)
1456ba125: 48 8b 7d 38                 	movq	0x38(%rbp), %rdi
1456ba129: 49 89 f8                    	movq	%rdi, %r8
1456ba12c: 48 8b 45 08                 	movq	0x8(%rbp), %rax
1456ba130: 49 29 c0                    	subq	%rax, %r8
1456ba133: 48 8b 55 30                 	movq	0x30(%rbp), %rdx
1456ba137: 48 01 c2                    	addq	%rax, %rdx
1456ba13a: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
1456ba13e: e8 7d 86 01 00              	callq	0x1456d27c0 <.text+0x56d17c0>
1456ba143: 90                          	nop
1456ba144: 48 83 7d a8 00              	cmpq	$0x0, -0x58(%rbp)
1456ba149: 74 4f                       	je	0x1456ba19a <.text+0x56b919a>
1456ba14b: 48 8d 05 d6 72 42 01        	leaq	0x14272d6(%rip), %rax   # 0x146ae1428
1456ba152: f6 45 18 01                 	testb	$0x1, 0x18(%rbp)
1456ba156: 48 8b 4d 10                 	movq	0x10(%rbp), %rcx
1456ba15a: 48 0f 44 c8                 	cmoveq	%rax, %rcx
1456ba15e: ba 01 00 00 00              	movl	$0x1, %edx
1456ba163: 48 8b 7d 20                 	movq	0x20(%rbp), %rdi
1456ba167: 48 8b 45 08                 	movq	0x8(%rbp), %rax
1456ba16b: 48 89 45 38                 	movq	%rax, 0x38(%rbp)
1456ba16f: 48 83 fa 01                 	cmpq	$0x1, %rdx
1456ba173: 75 3e                       	jne	0x1456ba1b3 <.text+0x56b91b3>
1456ba175: 48 89 4e 08                 	movq	%rcx, 0x8(%rsi)
1456ba179: 48 c7 06 ff ff ff ff        	movq	$-0x1, (%rsi)
1456ba180: 48 8b 55 28                 	movq	0x28(%rbp), %rdx
1456ba184: 48 85 d2                    	testq	%rdx, %rdx
1456ba187: 74 39                       	je	0x1456ba1c2 <.text+0x56b91c2>
1456ba189: 48 8b 4d 30                 	movq	0x30(%rbp), %rcx
1456ba18d: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1456ba193: e8 38 80 94 fa              	callq	0x1400021d0 <.text+0x11d0>
1456ba198: eb 28                       	jmp	0x1456ba1c2 <.text+0x56b91c2>
1456ba19a: 48 89 f8                    	movq	%rdi, %rax
1456ba19d: 48 8b 7d 20                 	movq	0x20(%rbp), %rdi
1456ba1a1: 48 8b 4d 10                 	movq	0x10(%rbp), %rcx
1456ba1a5: 48 8b 55 18                 	movq	0x18(%rbp), %rdx
1456ba1a9: 48 89 45 38                 	movq	%rax, 0x38(%rbp)
1456ba1ad: 48 83 fa 01                 	cmpq	$0x1, %rdx
1456ba1b1: 74 c2                       	je	0x1456ba175 <.text+0x56b9175>
1456ba1b3: 48 8b 45 38                 	movq	0x38(%rbp), %rax
1456ba1b7: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1456ba1bb: 0f 10 45 28                 	movups	0x28(%rbp), %xmm0
1456ba1bf: 0f 11 06                    	movups	%xmm0, (%rsi)
1456ba1c2: 48 89 f9                    	movq	%rdi, %rcx
1456ba1c5: ff 15 cd b8 1e 00           	callq	*0x1eb8cd(%rip)         # 0x1458a5a98
1456ba1cb: 48 89 f0                    	movq	%rsi, %rax
1456ba1ce: 48 81 c4 c8 00 00 00        	addq	$0xc8, %rsp
1456ba1d5: 5b                          	popq	%rbx
1456ba1d6: 5f                          	popq	%rdi
1456ba1d7: 5e                          	popq	%rsi
1456ba1d8: 5d                          	popq	%rbp
1456ba1d9: c3                          	retq


; Numbered unreadable-backup slot availability/equality helper

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453f8ad0: 55                          	pushq	%rbp
1453f8ad1: 41 57                       	pushq	%r15
1453f8ad3: 41 56                       	pushq	%r14
1453f8ad5: 56                          	pushq	%rsi
1453f8ad6: 57                          	pushq	%rdi
1453f8ad7: 53                          	pushq	%rbx
1453f8ad8: 48 83 ec 68                 	subq	$0x68, %rsp
1453f8adc: 48 8d 6c 24 60              	leaq	0x60(%rsp), %rbp
1453f8ae1: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
1453f8ae9: 4c 89 c6                    	movq	%r8, %rsi
1453f8aec: 48 89 d7                    	movq	%rdx, %rdi
1453f8aef: 48 89 cb                    	movq	%rcx, %rbx
1453f8af2: 4c 89 45 d8                 	movq	%r8, -0x28(%rbp)
1453f8af6: 48 8d 45 d8                 	leaq	-0x28(%rbp), %rax
1453f8afa: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
1453f8afe: 48 8d 05 4b 40 2e 00        	leaq	0x2e404b(%rip), %rax    # 0x1456dcb50 <.text+0x56dbb50>
1453f8b05: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
1453f8b09: 48 8d 15 a0 31 2e 01        	leaq	0x12e31a0(%rip), %rdx   # 0x1466dbcb0
1453f8b10: 48 8d 4d c0                 	leaq	-0x40(%rbp), %rcx
1453f8b14: 4c 8d 45 e0                 	leaq	-0x20(%rbp), %r8
1453f8b18: e8 83 10 2d 00              	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453f8b1d: 48 8b 55 c8                 	movq	-0x38(%rbp), %rdx
1453f8b21: 4c 8b 45 d0                 	movq	-0x30(%rbp), %r8
1453f8b25: 48 8d 4d e0                 	leaq	-0x20(%rbp), %rcx
1453f8b29: 48 89 55 f8                 	movq	%rdx, -0x8(%rbp)
1453f8b2d: e8 ee 8a 02 00              	callq	0x145421620 <.text+0x5420620>
1453f8b32: 90                          	nop
1453f8b33: 4c 8b 75 e0                 	movq	-0x20(%rbp), %r14
1453f8b37: 49 83 fe ff                 	cmpq	$-0x1, %r14
1453f8b3b: 74 27                       	je	0x1453f8b64 <.text+0x53f7b64>
1453f8b3d: 4c 8b 7d e8                 	movq	-0x18(%rbp), %r15
1453f8b41: 48 39 7d f0                 	cmpq	%rdi, -0x10(%rbp)
1453f8b45: 75 24                       	jne	0x1453f8b6b <.text+0x53f7b6b>
1453f8b47: 4c 89 f9                    	movq	%r15, %rcx
1453f8b4a: 48 89 da                    	movq	%rbx, %rdx
1453f8b4d: 49 89 f8                    	movq	%rdi, %r8
1453f8b50: e8 a2 be 31 00              	callq	0x1457149f7 <.text+0x57139f7>
1453f8b55: 31 ff                       	xorl	%edi, %edi
1453f8b57: 85 c0                       	testl	%eax, %eax
1453f8b59: 40 0f 94 c7                 	sete	%dil
1453f8b5d: 4d 85 f6                    	testq	%r14, %r14
1453f8b60: 75 10                       	jne	0x1453f8b72 <.text+0x53f7b72>
1453f8b62: eb 1f                       	jmp	0x1453f8b83 <.text+0x53f7b83>
1453f8b64: bf 01 00 00 00              	movl	$0x1, %edi
1453f8b69: eb 18                       	jmp	0x1453f8b83 <.text+0x53f7b83>
1453f8b6b: 31 ff                       	xorl	%edi, %edi
1453f8b6d: 4d 85 f6                    	testq	%r14, %r14
1453f8b70: 74 11                       	je	0x1453f8b83 <.text+0x53f7b83>
1453f8b72: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f8b78: 4c 89 f9                    	movq	%r15, %rcx
1453f8b7b: 4c 89 f2                    	movq	%r14, %rdx
1453f8b7e: e8 4d 96 c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f8b83: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
1453f8b87: 48 85 d2                    	testq	%rdx, %rdx
1453f8b8a: 74 0f                       	je	0x1453f8b9b <.text+0x53f7b9b>
1453f8b8c: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f8b92: 48 8b 4d f8                 	movq	-0x8(%rbp), %rcx
1453f8b96: e8 35 96 c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f8b9b: 48 89 f8                    	movq	%rdi, %rax
1453f8b9e: 48 89 f2                    	movq	%rsi, %rdx
1453f8ba1: 48 83 c4 68                 	addq	$0x68, %rsp
1453f8ba5: 5b                          	popq	%rbx
1453f8ba6: 5f                          	popq	%rdi
1453f8ba7: 5e                          	popq	%rsi
1453f8ba8: 41 5e                       	popq	%r14
1453f8baa: 41 5f                       	popq	%r15
1453f8bac: 5d                          	popq	%rbp
1453f8bad: c3                          	retq


; Auxiliary .txt writer ignores directory-create and write errors

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145420cf0: 55                          	pushq	%rbp
145420cf1: 56                          	pushq	%rsi
145420cf2: 57                          	pushq	%rdi
145420cf3: 53                          	pushq	%rbx
145420cf4: 48 81 ec 98 00 00 00        	subq	$0x98, %rsp
145420cfb: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
145420d03: 48 c7 45 10 fe ff ff ff     	movq	$-0x2, 0x10(%rbp)
145420d0b: 4c 89 ce                    	movq	%r9, %rsi
145420d0e: 4c 89 c7                    	movq	%r8, %rdi
145420d11: 48 89 4d b0                 	movq	%rcx, -0x50(%rbp)
145420d15: 48 89 55 b8                 	movq	%rdx, -0x48(%rbp)
145420d19: 48 8d 4d e8                 	leaq	-0x18(%rbp), %rcx
145420d1d: e8 0e 02 00 00              	callq	0x145420f30 <.text+0x541ff30>
145420d22: 48 8b 45 e8                 	movq	-0x18(%rbp), %rax
145420d26: 48 83 f8 ff                 	cmpq	$-0x1, %rax
145420d2a: 0f 84 27 01 00 00           	je	0x145420e57 <.text+0x541fe57>
145420d30: 48 89 45 e0                 	movq	%rax, -0x20(%rbp)
145420d34: 48 8b 55 f0                 	movq	-0x10(%rbp), %rdx
145420d38: 48 8b 5d f8                 	movq	-0x8(%rbp), %rbx
145420d3c: c6 45 e8 01                 	movb	$0x1, -0x18(%rbp)
145420d40: 48 8d 4d e8                 	leaq	-0x18(%rbp), %rcx
145420d44: 48 89 55 d8                 	movq	%rdx, -0x28(%rbp)
145420d48: 49 89 d8                    	movq	%rbx, %r8
145420d4b: e8 c0 ad 28 00              	callq	0x1456abb10 <.text+0x56aab10>
145420d50: 90                          	nop
145420d51: 48 85 c0                    	testq	%rax, %rax
145420d54: 74 27                       	je	0x145420d7d <.text+0x541fd7d>
145420d56: 89 c1                       	movl	%eax, %ecx
145420d58: 83 e1 03                    	andl	$0x3, %ecx
145420d5b: 8d 51 fe                    	leal	-0x2(%rcx), %edx
145420d5e: 83 fa 02                    	cmpl	$0x2, %edx
145420d61: 72 1a                       	jb	0x145420d7d <.text+0x541fd7d>
145420d63: 48 85 c9                    	testq	%rcx, %rcx
145420d66: 74 15                       	je	0x145420d7d <.text+0x541fd7d>
145420d68: 48 ff c8                    	decq	%rax
145420d6b: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
145420d6f: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
145420d73: c6 45 e8 03                 	movb	$0x3, -0x18(%rbp)
145420d77: e8 c4 bd 2b 00              	callq	0x1456dcb40 <.text+0x56dbb40>
145420d7c: 90                          	nop
145420d7d: 48 8d 45 b0                 	leaq	-0x50(%rbp), %rax
145420d81: 48 89 45 e8                 	movq	%rax, -0x18(%rbp)
145420d85: 48 8d 05 34 13 be fa        	leaq	-0x541eccc(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145420d8c: 48 89 45 f0                 	movq	%rax, -0x10(%rbp)
145420d90: 48 8d 15 d1 3f 47 01        	leaq	0x1473fd1(%rip), %rdx   # 0x146894d68
145420d97: 48 8d 4d c0                 	leaq	-0x40(%rbp), %rcx
145420d9b: 4c 8d 45 e8                 	leaq	-0x18(%rbp), %r8
145420d9f: e8 fc 8d 2a 00              	callq	0x1456c9ba0 <.text+0x56c8ba0>
145420da4: 90                          	nop
145420da5: 4c 8b 4d c8                 	movq	-0x38(%rbp), %r9
145420da9: 48 8b 45 d0                 	movq	-0x30(%rbp), %rax
145420dad: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
145420db2: 48 8d 4d e8                 	leaq	-0x18(%rbp), %rcx
145420db6: 48 8b 55 d8                 	movq	-0x28(%rbp), %rdx
145420dba: 49 89 d8                    	movq	%rbx, %r8
145420dbd: 4c 89 4d 08                 	movq	%r9, 0x8(%rbp)
145420dc1: e8 0a 3a 28 00              	callq	0x1456a47d0 <.text+0x56a37d0>
145420dc6: 90                          	nop
145420dc7: 48 8b 55 c0                 	movq	-0x40(%rbp), %rdx
145420dcb: 48 85 d2                    	testq	%rdx, %rdx
145420dce: 74 0f                       	je	0x145420ddf <.text+0x541fddf>
145420dd0: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145420dd6: 48 8b 4d 08                 	movq	0x8(%rbp), %rcx
145420dda: e8 f1 13 be fa              	callq	0x1400021d0 <.text+0x11d0>
145420ddf: 48 8b 4d f0                 	movq	-0x10(%rbp), %rcx
145420de3: 48 8b 55 f8                 	movq	-0x8(%rbp), %rdx
145420de7: 48 89 4d 08                 	movq	%rcx, 0x8(%rbp)
145420deb: 49 89 f8                    	movq	%rdi, %r8
145420dee: 49 89 f1                    	movq	%rsi, %r9
145420df1: e8 ca 96 29 00              	callq	0x1456ba4c0 <.text+0x56b94c0>
145420df6: 90                          	nop
145420df7: 48 89 c6                    	movq	%rax, %rsi
145420dfa: 48 8b 55 e8                 	movq	-0x18(%rbp), %rdx
145420dfe: 48 85 d2                    	testq	%rdx, %rdx
145420e01: 74 0f                       	je	0x145420e12 <.text+0x541fe12>
145420e03: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145420e09: 48 8b 4d 08                 	movq	0x8(%rbp), %rcx
145420e0d: e8 be 13 be fa              	callq	0x1400021d0 <.text+0x11d0>
145420e12: 48 85 f6                    	testq	%rsi, %rsi
145420e15: 74 27                       	je	0x145420e3e <.text+0x541fe3e>
145420e17: 89 f0                       	movl	%esi, %eax
145420e19: 83 e0 03                    	andl	$0x3, %eax
145420e1c: 8d 48 fe                    	leal	-0x2(%rax), %ecx
145420e1f: 83 f9 02                    	cmpl	$0x2, %ecx
145420e22: 72 1a                       	jb	0x145420e3e <.text+0x541fe3e>
145420e24: 48 85 c0                    	testq	%rax, %rax
145420e27: 74 15                       	je	0x145420e3e <.text+0x541fe3e>
145420e29: 48 ff ce                    	decq	%rsi
145420e2c: 48 8d 4d f0                 	leaq	-0x10(%rbp), %rcx
145420e30: 48 89 75 f0                 	movq	%rsi, -0x10(%rbp)
145420e34: c6 45 e8 03                 	movb	$0x3, -0x18(%rbp)
145420e38: e8 03 bd 2b 00              	callq	0x1456dcb40 <.text+0x56dbb40>
145420e3d: 90                          	nop
145420e3e: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
145420e42: 48 85 d2                    	testq	%rdx, %rdx
145420e45: 74 10                       	je	0x145420e57 <.text+0x541fe57>
145420e47: 41 b8 01 00 00 00           	movl	$0x1, %r8d
145420e4d: 48 8b 4d d8                 	movq	-0x28(%rbp), %rcx
145420e51: e8 7a 13 be fa              	callq	0x1400021d0 <.text+0x11d0>
145420e56: 90                          	nop
145420e57: 48 81 c4 98 00 00 00        	addq	$0x98, %rsp
145420e5e: 5b                          	popq	%rbx
145420e5f: 5f                          	popq	%rdi
145420e60: 5e                          	popq	%rsi
145420e61: 5d                          	popq	%rbp
145420e62: c3                          	retq


; Auxiliary .txt reader

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145421620: 55                          	pushq	%rbp
145421621: 56                          	pushq	%rsi
145421622: 57                          	pushq	%rdi
145421623: 48 81 ec d0 00 00 00        	subq	$0xd0, %rsp
14542162a: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
145421632: 48 c7 45 48 fe ff ff ff     	movq	$-0x2, 0x48(%rbp)
14542163a: 48 89 ce                    	movq	%rcx, %rsi
14542163d: 48 89 55 d0                 	movq	%rdx, -0x30(%rbp)
145421641: 4c 89 45 d8                 	movq	%r8, -0x28(%rbp)
145421645: 48 8d 4d 10                 	leaq	0x10(%rbp), %rcx
145421649: e8 e2 f8 ff ff              	callq	0x145420f30 <.text+0x541ff30>
14542164e: 48 8b 45 10                 	movq	0x10(%rbp), %rax
145421652: 48 83 f8 ff                 	cmpq	$-0x1, %rax
145421656: 0f 84 b8 00 00 00           	je	0x145421714 <.text+0x5420714>
14542165c: 48 89 45 38                 	movq	%rax, 0x38(%rbp)
145421660: 48 8b 45 18                 	movq	0x18(%rbp), %rax
145421664: 48 89 45 30                 	movq	%rax, 0x30(%rbp)
145421668: 48 8b 7d 20                 	movq	0x20(%rbp), %rdi
14542166c: 48 8d 45 d0                 	leaq	-0x30(%rbp), %rax
145421670: 48 89 45 10                 	movq	%rax, 0x10(%rbp)
145421674: 48 8d 05 45 0a be fa        	leaq	-0x541f5bb(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14542167b: 48 89 45 18                 	movq	%rax, 0x18(%rbp)
14542167f: 48 8d 15 e2 36 47 01        	leaq	0x14736e2(%rip), %rdx   # 0x146894d68
145421686: 48 8d 4d e0                 	leaq	-0x20(%rbp), %rcx
14542168a: 4c 8d 45 10                 	leaq	0x10(%rbp), %r8
14542168e: e8 0d 85 2a 00              	callq	0x1456c9ba0 <.text+0x56c8ba0>
145421693: 90                          	nop
145421694: 4c 8b 4d e8                 	movq	-0x18(%rbp), %r9
145421698: 48 8b 45 f0                 	movq	-0x10(%rbp), %rax
14542169c: 48 89 44 24 20              	movq	%rax, 0x20(%rsp)
1454216a1: 48 8d 4d b0                 	leaq	-0x50(%rbp), %rcx
1454216a5: 48 8b 55 30                 	movq	0x30(%rbp), %rdx
1454216a9: 49 89 f8                    	movq	%rdi, %r8
1454216ac: 4c 89 4d 40                 	movq	%r9, 0x40(%rbp)
1454216b0: e8 1b 31 28 00              	callq	0x1456a47d0 <.text+0x56a37d0>
1454216b5: 90                          	nop
1454216b6: 48 8b 55 e0                 	movq	-0x20(%rbp), %rdx
1454216ba: 48 85 d2                    	testq	%rdx, %rdx
1454216bd: 74 0f                       	je	0x1454216ce <.text+0x54206ce>
1454216bf: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454216c5: 48 8b 4d 40                 	movq	0x40(%rbp), %rcx
1454216c9: e8 02 0b be fa              	callq	0x1400021d0 <.text+0x11d0>
1454216ce: 48 8b 55 b8                 	movq	-0x48(%rbp), %rdx
1454216d2: 4c 8b 45 c0                 	movq	-0x40(%rbp), %r8
1454216d6: 48 8d 4d f8                 	leaq	-0x8(%rbp), %rcx
1454216da: 48 89 55 40                 	movq	%rdx, 0x40(%rbp)
1454216de: e8 1d 89 29 00              	callq	0x1456ba000 <.text+0x56b9000>
1454216e3: 90                          	nop
1454216e4: 48 8b 55 b0                 	movq	-0x50(%rbp), %rdx
1454216e8: 48 85 d2                    	testq	%rdx, %rdx
1454216eb: 74 0f                       	je	0x1454216fc <.text+0x54206fc>
1454216ed: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454216f3: 48 8b 4d 40                 	movq	0x40(%rbp), %rcx
1454216f7: e8 d4 0a be fa              	callq	0x1400021d0 <.text+0x11d0>
1454216fc: 48 83 7d f8 ff              	cmpq	$-0x1, -0x8(%rbp)
145421701: 74 1a                       	je	0x14542171d <.text+0x542071d>
145421703: 48 8b 45 08                 	movq	0x8(%rbp), %rax
145421707: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
14542170b: 0f 10 45 f8                 	movups	-0x8(%rbp), %xmm0
14542170f: 0f 11 06                    	movups	%xmm0, (%rsi)
145421712: eb 3b                       	jmp	0x14542174f <.text+0x542074f>
145421714: 48 c7 06 ff ff ff ff        	movq	$-0x1, (%rsi)
14542171b: eb 4a                       	jmp	0x145421767 <.text+0x5420767>
14542171d: 48 c7 06 ff ff ff ff        	movq	$-0x1, (%rsi)
145421724: 48 8b 45 00                 	movq	(%rbp), %rax
145421728: 89 c1                       	movl	%eax, %ecx
14542172a: 83 e1 03                    	andl	$0x3, %ecx
14542172d: 8d 51 fe                    	leal	-0x2(%rcx), %edx
145421730: 83 fa 02                    	cmpl	$0x2, %edx
145421733: 72 1a                       	jb	0x14542174f <.text+0x542074f>
145421735: 48 85 c9                    	testq	%rcx, %rcx
145421738: 74 15                       	je	0x14542174f <.text+0x542074f>
14542173a: 48 ff c8                    	decq	%rax
14542173d: 48 8d 4d 18                 	leaq	0x18(%rbp), %rcx
145421741: 48 89 45 18                 	movq	%rax, 0x18(%rbp)
145421745: c6 45 10 03                 	movb	$0x3, 0x10(%rbp)
145421749: e8 f2 b3 2b 00              	callq	0x1456dcb40 <.text+0x56dbb40>
14542174e: 90                          	nop
14542174f: 48 8b 55 38                 	movq	0x38(%rbp), %rdx
145421753: 48 85 d2                    	testq	%rdx, %rdx
145421756: 74 0f                       	je	0x145421767 <.text+0x5420767>
145421758: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14542175e: 48 8b 4d 30                 	movq	0x30(%rbp), %rcx
145421762: e8 69 0a be fa              	callq	0x1400021d0 <.text+0x11d0>
145421767: 48 89 f0                    	movq	%rsi, %rax
14542176a: 48 81 c4 d0 00 00 00        	addq	$0xd0, %rsp
145421771: 5f                          	popq	%rdi
145421772: 5e                          	popq	%rsi
145421773: 5d                          	popq	%rbp
145421774: c3                          	retq


; No-Pick default: Human Warrior male, zero appearance, Hero/elwynn,100% modifiers

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454034c0: 55                          	pushq	%rbp
1454034c1: 56                          	pushq	%rsi
1454034c2: 57                          	pushq	%rdi
1454034c3: 48 83 ec 30                 	subq	$0x30, %rsp
1454034c7: 48 8d 6c 24 30              	leaq	0x30(%rsp), %rbp
1454034cc: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
1454034d4: 48 89 ce                    	movq	%rcx, %rsi
1454034d7: e8 24 ed bf fa              	callq	0x140002200 <.text+0x1200>
1454034dc: b9 04 00 00 00              	movl	$0x4, %ecx
1454034e1: ba 01 00 00 00              	movl	$0x1, %edx
1454034e6: e8 d5 ec bf fa              	callq	0x1400021c0 <.text+0x11c0>
1454034eb: 48 85 c0                    	testq	%rax, %rax
1454034ee: 0f 84 8a 00 00 00           	je	0x14540357e <.text+0x540257e>
1454034f4: 48 89 c7                    	movq	%rax, %rdi
1454034f7: c7 00 48 65 72 6f           	movl	$0x6f726548, (%rax)     # imm = 0x6F726548
1454034fd: e8 fe ec bf fa              	callq	0x140002200 <.text+0x1200>
145403502: b9 06 00 00 00              	movl	$0x6, %ecx
145403507: ba 01 00 00 00              	movl	$0x1, %edx
14540350c: e8 af ec bf fa              	callq	0x1400021c0 <.text+0x11c0>
145403511: 48 85 c0                    	testq	%rax, %rax
145403514: 74 79                       	je	0x14540358f <.text+0x540258f>
145403516: 0f b7 0d ff 9c 2c 01        	movzwl	0x12c9cff(%rip), %ecx   # 0x1466cd21c
14540351d: 66 89 48 04                 	movw	%cx, 0x4(%rax)
145403521: 8b 0d f1 9c 2c 01           	movl	0x12c9cf1(%rip), %ecx   # 0x1466cd218
145403527: 89 08                       	movl	%ecx, (%rax)
145403529: c7 46 3b 00 00 00 00        	movl	$0x0, 0x3b(%rsi)
145403530: c6 46 3f 00                 	movb	$0x0, 0x3f(%rsi)
145403534: 66 c7 46 38 01 01           	movw	$0x101, 0x38(%rsi)      # imm = 0x101
14540353a: c6 46 3a 00                 	movb	$0x0, 0x3a(%rsi)
14540353e: 48 c7 06 04 00 00 00        	movq	$0x4, (%rsi)
145403545: 48 89 7e 08                 	movq	%rdi, 0x8(%rsi)
145403549: 48 c7 46 10 04 00 00 00     	movq	$0x4, 0x10(%rsi)
145403551: 48 c7 46 18 06 00 00 00     	movq	$0x6, 0x18(%rsi)
145403559: 48 89 46 20                 	movq	%rax, 0x20(%rsi)
14540355d: 48 c7 46 28 06 00 00 00     	movq	$0x6, 0x28(%rsi)
145403565: 48 b8 64 00 64 00 64 00 64 00       	movabsq	$0x64006400640064, %rax # imm = 0x64006400640064
14540356f: 48 89 46 30                 	movq	%rax, 0x30(%rsi)
145403573: 48 89 f0                    	movq	%rsi, %rax
145403576: 48 83 c4 30                 	addq	$0x30, %rsp
14540357a: 5f                          	popq	%rdi
14540357b: 5e                          	popq	%rsi
14540357c: 5d                          	popq	%rbp
14540357d: c3                          	retq
14540357e: b9 01 00 00 00              	movl	$0x1, %ecx
145403583: ba 04 00 00 00              	movl	$0x4, %edx
145403588: e8 fe 05 4a 00              	callq	0x1458a3b8b <.text+0x58a2b8b>
14540358d: 0f 0b                       	ud2
14540358f: 48 89 7d f0                 	movq	%rdi, -0x10(%rbp)
145403593: b9 01 00 00 00              	movl	$0x1, %ecx
145403598: ba 06 00 00 00              	movl	$0x6, %edx
14540359d: e8 e9 05 4a 00              	callq	0x1458a3b8b <.text+0x58a2b8b>
1454035a2: 90                          	nop
1454035a3: 0f 0b                       	ud2


; Full Pick normalizer, including class/race, name, canonical zone, appearance helper and modifier steps

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454027e0: 55                          	pushq	%rbp
1454027e1: 41 57                       	pushq	%r15
1454027e3: 41 56                       	pushq	%r14
1454027e5: 41 55                       	pushq	%r13
1454027e7: 41 54                       	pushq	%r12
1454027e9: 56                          	pushq	%rsi
1454027ea: 57                          	pushq	%rdi
1454027eb: 53                          	pushq	%rbx
1454027ec: 48 83 ec 58                 	subq	$0x58, %rsp
1454027f0: 48 8d 6c 24 50              	leaq	0x50(%rsp), %rbp
1454027f5: 48 c7 45 00 fe ff ff ff     	movq	$-0x2, (%rbp)
1454027fd: 49 89 d6                    	movq	%rdx, %r14
145402800: 48 89 ce                    	movq	%rcx, %rsi
145402803: 0f b6 42 38                 	movzbl	0x38(%rdx), %eax
145402807: 04 fe                       	addb	$-0x2, %al
145402809: 3c 0a                       	cmpb	$0xa, %al
14540280b: 73 10                       	jae	0x14540281d <.text+0x540181d>
14540280d: 0f b6 c0                    	movzbl	%al, %eax
145402810: 48 8d 0d d1 98 2d 01        	leaq	0x12d98d1(%rip), %rcx   # 0x1466dc0e8
145402817: 48 8b 04 c1                 	movq	(%rcx,%rax,8), %rax
14540281b: eb 07                       	jmp	0x145402824 <.text+0x5401824>
14540281d: 48 8d 05 34 20 2d 01        	leaq	0x12d2034(%rip), %rax   # 0x1466d4858
145402824: 0f b6 80 8c 00 00 00        	movzbl	0x8c(%rax), %eax
14540282b: 41 88 46 38                 	movb	%al, 0x38(%r14)
14540282f: fe c8                       	decb	%al
145402831: 3c 0b                       	cmpb	$0xb, %al
145402833: 73 1e                       	jae	0x145402853 <.text+0x5401853>
145402835: 0f b6 c0                    	movzbl	%al, %eax
145402838: c1 e0 03                    	shll	$0x3, %eax
14540283b: 48 8d 0d f6 98 2d 01        	leaq	0x12d98f6(%rip), %rcx   # 0x1466dc138
145402842: 48 8b 0c 08                 	movq	(%rax,%rcx), %rcx
145402846: 48 8d 15 43 99 2d 01        	leaq	0x12d9943(%rip), %rdx   # 0x1466dc190
14540284d: 48 8b 04 10                 	movq	(%rax,%rdx), %rax
145402851: eb 0c                       	jmp	0x14540285f <.text+0x540185f>
145402853: 48 8d 05 97 94 2d 01        	leaq	0x12d9497(%rip), %rax   # 0x1466dbcf1
14540285a: b9 01 00 00 00              	movl	$0x1, %ecx
14540285f: 41 0f b6 5e 39              	movzbl	0x39(%r14), %ebx
145402864: 31 d2                       	xorl	%edx, %edx
145402866: 66 2e 0f 1f 84 00 00 00 00 00       	nopw	%cs:(%rax,%rax)
145402870: 38 1c 10                    	cmpb	%bl, (%rax,%rdx)
145402873: 74 0f                       	je	0x145402884 <.text+0x5401884>
145402875: 48 ff c2                    	incq	%rdx
145402878: 48 39 d1                    	cmpq	%rdx, %rcx
14540287b: 75 f3                       	jne	0x145402870 <.text+0x5401870>
14540287d: 0f b6 18                    	movzbl	(%rax), %ebx
145402880: 41 88 5e 39                 	movb	%bl, 0x39(%r14)
145402884: 41 80 7e 3a 00              	cmpb	$0x0, 0x3a(%r14)
145402889: 41 0f 95 46 3a              	setne	0x3a(%r14)
14540288e: 0f 95 45 ff                 	setne	-0x1(%rbp)
145402892: 4d 8b 7e 20                 	movq	0x20(%r14), %r15
145402896: 49 8b 56 28                 	movq	0x28(%r14), %rdx
14540289a: 4c 89 f9                    	movq	%r15, %rcx
14540289d: e8 3e fb fd ff              	callq	0x1453e23e0 <.text+0x53e13e0>
1454028a2: 48 69 c0 b8 00 00 00        	imulq	$0xb8, %rax, %rax
1454028a9: 48 8d 0d 58 01 2d 01        	leaq	0x12d0158(%rip), %rcx   # 0x1466d2a08
1454028b0: 4c 89 f7                    	movq	%r14, %rdi
1454028b3: 4c 8b 6c 08 08              	movq	0x8(%rax,%rcx), %r13
1454028b8: 4c 8b 74 08 10              	movq	0x10(%rax,%rcx), %r14
1454028bd: e8 3e f9 bf fa              	callq	0x140002200 <.text+0x1200>
1454028c2: ba 01 00 00 00              	movl	$0x1, %edx
1454028c7: 4c 89 f1                    	movq	%r14, %rcx
1454028ca: e8 f1 f8 bf fa              	callq	0x1400021c0 <.text+0x11c0>
1454028cf: 48 85 c0                    	testq	%rax, %rax
1454028d2: 48 89 7d f0                 	movq	%rdi, -0x10(%rbp)
1454028d6: 0f 84 60 02 00 00           	je	0x145402b3c <.text+0x5401b3c>
1454028dc: 49 89 c4                    	movq	%rax, %r12
1454028df: 48 89 c1                    	movq	%rax, %rcx
1454028e2: 4c 89 ea                    	movq	%r13, %rdx
1454028e5: 4d 89 f0                    	movq	%r14, %r8
1454028e8: e8 10 21 31 00              	callq	0x1457149fd <.text+0x57139fd>
1454028ed: 48 8b 57 18                 	movq	0x18(%rdi), %rdx
1454028f1: 48 85 d2                    	testq	%rdx, %rdx
1454028f4: 74 0e                       	je	0x145402904 <.text+0x5401904>
1454028f6: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1454028fc: 4c 89 f9                    	movq	%r15, %rcx
1454028ff: e8 cc f8 bf fa              	callq	0x1400021d0 <.text+0x11d0>
145402904: 4c 89 77 18                 	movq	%r14, 0x18(%rdi)
145402908: 4c 89 67 20                 	movq	%r12, 0x20(%rdi)
14540290c: 4c 89 77 28                 	movq	%r14, 0x28(%rdi)
145402910: 4c 8b 77 08                 	movq	0x8(%rdi), %r14
145402914: 4c 8b 47 10                 	movq	0x10(%rdi), %r8
145402918: 48 8d 4d d8                 	leaq	-0x28(%rbp), %rcx
14540291c: 4c 89 f2                    	movq	%r14, %rdx
14540291f: e8 bc 06 00 00              	callq	0x145402fe0 <.text+0x5401fe0>
145402924: 90                          	nop
145402925: 48 8b 7d f0                 	movq	-0x10(%rbp), %rdi
145402929: 4c 8b 6d d8                 	movq	-0x28(%rbp), %r13
14540292d: 49 83 fd ff                 	cmpq	$-0x1, %r13
145402931: 0f 84 c6 01 00 00           	je	0x145402afd <.text+0x5401afd>
145402937: 4c 8b 7d e0                 	movq	-0x20(%rbp), %r15
14540293b: 4c 8b 65 e8                 	movq	-0x18(%rbp), %r12
14540293f: 48 8b 17                    	movq	(%rdi), %rdx
145402942: 48 85 d2                    	testq	%rdx, %rdx
145402945: 74 0e                       	je	0x145402955 <.text+0x5401955>
145402947: 41 b8 01 00 00 00           	movl	$0x1, %r8d
14540294d: 4c 89 f1                    	movq	%r14, %rcx
145402950: e8 7b f8 bf fa              	callq	0x1400021d0 <.text+0x11d0>
145402955: 4c 89 2f                    	movq	%r13, (%rdi)
145402958: 4c 89 7f 08                 	movq	%r15, 0x8(%rdi)
14540295c: 4c 89 67 10                 	movq	%r12, 0x10(%rdi)
145402960: 8b 47 3b                    	movl	0x3b(%rdi), %eax
145402963: 0f b6 4f 3f                 	movzbl	0x3f(%rdi), %ecx
145402967: 48 c1 e1 20                 	shlq	$0x20, %rcx
14540296b: 48 09 c1                    	orq	%rax, %rcx
14540296e: 89 da                       	movl	%ebx, %edx
145402970: 44 0f b6 45 ff              	movzbl	-0x1(%rbp), %r8d
145402975: e8 76 bd 04 00              	callq	0x14544e6f0 <.text+0x544d6f0>
14540297a: 90                          	nop
14540297b: 48 8b 7d f0                 	movq	-0x10(%rbp), %rdi
14540297f: 89 47 3b                    	movl	%eax, 0x3b(%rdi)
145402982: 48 c1 e8 20                 	shrq	$0x20, %rax
145402986: 88 47 3f                    	movb	%al, 0x3f(%rdi)
145402989: 48 8b 47 30                 	movq	0x30(%rdi), %rax
14540298d: 48 89 c2                    	movq	%rax, %rdx
145402990: 48 c1 ea 20                 	shrq	$0x20, %rdx
145402994: 0f b7 ca                    	movzwl	%dx, %ecx
145402997: 81 f9 2c 01 00 00           	cmpl	$0x12c, %ecx            # imm = 0x12C
14540299d: 41 b8 2c 01 00 00           	movl	$0x12c, %r8d            # imm = 0x12C
1454029a3: 44 0f 42 c2                 	cmovbl	%edx, %r8d
1454029a7: 41 83 c0 9c                 	addl	$-0x64, %r8d
1454029ab: 31 c9                       	xorl	%ecx, %ecx
1454029ad: 66 83 fa 64                 	cmpw	$0x64, %dx
1454029b1: 44 0f 42 c1                 	cmovbl	%ecx, %r8d
1454029b5: 41 0f b7 d0                 	movzwl	%r8w, %edx
1454029b9: 69 d2 cd cc 00 00           	imull	$0xcccd, %edx, %edx     # imm = 0xCCCD
1454029bf: c1 ea 12                    	shrl	$0x12, %edx
1454029c2: 83 e2 fe                    	andl	$-0x2, %edx
1454029c5: 8d 14 92                    	leal	(%rdx,%rdx,4), %edx
1454029c8: 83 c2 64                    	addl	$0x64, %edx
1454029cb: 41 89 c0                    	movl	%eax, %r8d
1454029ce: 41 c1 e8 10                 	shrl	$0x10, %r8d
1454029d2: 45 89 c2                    	movl	%r8d, %r10d
1454029d5: 41 81 f8 f4 01 00 00        	cmpl	$0x1f4, %r8d            # imm = 0x1F4
1454029dc: 41 b9 f4 01 00 00           	movl	$0x1f4, %r9d            # imm = 0x1F4
1454029e2: 45 0f 43 c1                 	cmovael	%r9d, %r8d
1454029e6: 41 83 c0 9c                 	addl	$-0x64, %r8d
1454029ea: 66 41 83 fa 64              	cmpw	$0x64, %r10w
1454029ef: 44 0f 42 c1                 	cmovbl	%ecx, %r8d
1454029f3: 45 0f b7 d0                 	movzwl	%r8w, %r10d
1454029f7: 45 69 d2 af 47 00 00        	imull	$0x47af, %r10d, %r10d   # imm = 0x47AF
1454029fe: 41 c1 ea 10                 	shrl	$0x10, %r10d
145402a02: 45 29 d0                    	subl	%r10d, %r8d
145402a05: 45 0f b7 c0                 	movzwl	%r8w, %r8d
145402a09: 41 d1 e8                    	shrl	%r8d
145402a0c: 45 01 d0                    	addl	%r10d, %r8d
145402a0f: 41 c1 e8 04                 	shrl	$0x4, %r8d
145402a13: 47 8d 04 80                 	leal	(%r8,%r8,4), %r8d
145402a17: 47 8d 04 80                 	leal	(%r8,%r8,4), %r8d
145402a1b: 41 c1 e0 10                 	shll	$0x10, %r8d
145402a1f: 44 0f b7 d0                 	movzwl	%ax, %r10d
145402a23: 41 81 fa f4 01 00 00        	cmpl	$0x1f4, %r10d           # imm = 0x1F4
145402a2a: 44 0f 42 c8                 	cmovbl	%eax, %r9d
145402a2e: 41 83 c1 9c                 	addl	$-0x64, %r9d
145402a32: 66 83 f8 64                 	cmpw	$0x64, %ax
145402a36: 44 0f 42 c9                 	cmovbl	%ecx, %r9d
145402a3a: 45 0f b7 d1                 	movzwl	%r9w, %r10d
145402a3e: 45 69 d2 af 47 00 00        	imull	$0x47af, %r10d, %r10d   # imm = 0x47AF
145402a45: 41 c1 ea 10                 	shrl	$0x10, %r10d
145402a49: 45 29 d1                    	subl	%r10d, %r9d
145402a4c: 45 0f b7 c9                 	movzwl	%r9w, %r9d
145402a50: 41 d1 e9                    	shrl	%r9d
145402a53: 45 01 d1                    	addl	%r10d, %r9d
145402a56: 41 c1 e9 04                 	shrl	$0x4, %r9d
145402a5a: 47 8d 0c 89                 	leal	(%r9,%r9,4), %r9d
145402a5e: 47 8d 0c 89                 	leal	(%r9,%r9,4), %r9d
145402a62: 41 83 c1 64                 	addl	$0x64, %r9d
145402a66: 49 89 c2                    	movq	%rax, %r10
145402a69: 49 c1 ea 30                 	shrq	$0x30, %r10
145402a6d: 48 c1 e8 32                 	shrq	$0x32, %rax
145402a71: 41 81 fa 96 00 00 00        	cmpl	$0x96, %r10d
145402a78: 41 bb 96 00 00 00           	movl	$0x96, %r11d
145402a7e: 45 0f 42 da                 	cmovbl	%r10d, %r11d
145402a82: 41 83 c3 9c                 	addl	$-0x64, %r11d
145402a86: 83 f8 19                    	cmpl	$0x19, %eax
145402a89: 44 0f 42 d9                 	cmovbl	%ecx, %r11d
145402a8d: 41 0f b7 c3                 	movzwl	%r11w, %eax
145402a91: 69 c0 cd cc 00 00           	imull	$0xcccd, %eax, %eax     # imm = 0xCCCD
145402a97: c1 e8 12                    	shrl	$0x12, %eax
145402a9a: 8d 04 80                    	leal	(%rax,%rax,4), %eax
145402a9d: 83 c0 64                    	addl	$0x64, %eax
145402aa0: 48 c1 e0 30                 	shlq	$0x30, %rax
145402aa4: 0f b7 ca                    	movzwl	%dx, %ecx
145402aa7: 48 c1 e1 20                 	shlq	$0x20, %rcx
145402aab: 48 09 c1                    	orq	%rax, %rcx
145402aae: 41 81 c0 00 00 64 00        	addl	$0x640000, %r8d         # imm = 0x640000
145402ab5: 49 09 c8                    	orq	%rcx, %r8
145402ab8: 41 0f b7 c1                 	movzwl	%r9w, %eax
145402abc: 4c 09 c0                    	orq	%r8, %rax
145402abf: 48 89 47 30                 	movq	%rax, 0x30(%rdi)
145402ac3: 0f 10 07                    	movups	(%rdi), %xmm0
145402ac6: 0f 10 4f 10                 	movups	0x10(%rdi), %xmm1
145402aca: 0f 10 57 20                 	movups	0x20(%rdi), %xmm2
145402ace: 0f 11 56 20                 	movups	%xmm2, 0x20(%rsi)
145402ad2: 0f 11 4e 10                 	movups	%xmm1, 0x10(%rsi)
145402ad6: 0f 11 06                    	movups	%xmm0, (%rsi)
145402ad9: 48 8b 47 30                 	movq	0x30(%rdi), %rax
145402add: 48 89 46 30                 	movq	%rax, 0x30(%rsi)
145402ae1: 48 8b 47 38                 	movq	0x38(%rdi), %rax
145402ae5: 48 89 46 38                 	movq	%rax, 0x38(%rsi)
145402ae9: 48 89 f0                    	movq	%rsi, %rax
145402aec: 48 83 c4 58                 	addq	$0x58, %rsp
145402af0: 5b                          	popq	%rbx
145402af1: 5f                          	popq	%rdi
145402af2: 5e                          	popq	%rsi
145402af3: 41 5c                       	popq	%r12
145402af5: 41 5d                       	popq	%r13
145402af7: 41 5e                       	popq	%r14
145402af9: 41 5f                       	popq	%r15
145402afb: 5d                          	popq	%rbp
145402afc: c3                          	retq
145402afd: e8 fe f6 bf fa              	callq	0x140002200 <.text+0x1200>
145402b02: 41 bc 04 00 00 00           	movl	$0x4, %r12d
145402b08: b9 04 00 00 00              	movl	$0x4, %ecx
145402b0d: ba 01 00 00 00              	movl	$0x1, %edx
145402b12: e8 a9 f6 bf fa              	callq	0x1400021c0 <.text+0x11c0>
145402b17: 48 85 c0                    	testq	%rax, %rax
145402b1a: 74 30                       	je	0x145402b4c <.text+0x5401b4c>
145402b1c: 49 89 c7                    	movq	%rax, %r15
145402b1f: c7 00 48 65 72 6f           	movl	$0x6f726548, (%rax)     # imm = 0x6F726548
145402b25: 41 bd 04 00 00 00           	movl	$0x4, %r13d
145402b2b: 48 8b 17                    	movq	(%rdi), %rdx
145402b2e: 48 85 d2                    	testq	%rdx, %rdx
145402b31: 0f 85 10 fe ff ff           	jne	0x145402947 <.text+0x5401947>
145402b37: e9 19 fe ff ff              	jmp	0x145402955 <.text+0x5401955>
145402b3c: b9 01 00 00 00              	movl	$0x1, %ecx
145402b41: 4c 89 f2                    	movq	%r14, %rdx
145402b44: e8 42 10 4a 00              	callq	0x1458a3b8b <.text+0x58a2b8b>
145402b49: 90                          	nop
145402b4a: eb 10                       	jmp	0x145402b5c <.text+0x5401b5c>
145402b4c: b9 01 00 00 00              	movl	$0x1, %ecx
145402b51: ba 04 00 00 00              	movl	$0x4, %edx
145402b56: e8 30 10 4a 00              	callq	0x1458a3b8b <.text+0x58a2b8b>
145402b5b: 90                          	nop
145402b5c: 0f 0b                       	ud2


; Class-unlock zone clamp

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453f9130: 55                          	pushq	%rbp
1453f9131: 41 57                       	pushq	%r15
1453f9133: 41 56                       	pushq	%r14
1453f9135: 41 54                       	pushq	%r12
1453f9137: 56                          	pushq	%rsi
1453f9138: 57                          	pushq	%rdi
1453f9139: 53                          	pushq	%rbx
1453f913a: 48 83 ec 30                 	subq	$0x30, %rsp
1453f913e: 48 8d 6c 24 30              	leaq	0x30(%rsp), %rbp
1453f9143: 48 c7 45 f8 fe ff ff ff     	movq	$-0x2, -0x8(%rbp)
1453f914b: 4d 89 c4                    	movq	%r8, %r12
1453f914e: 48 89 d3                    	movq	%rdx, %rbx
1453f9151: 48 89 ce                    	movq	%rcx, %rsi
1453f9154: 45 0f b6 70 38              	movzbl	0x38(%r8), %r14d
1453f9159: 49 8b 78 20                 	movq	0x20(%r8), %rdi
1453f915d: 49 8b 50 28                 	movq	0x28(%r8), %rdx
1453f9161: 48 89 f9                    	movq	%rdi, %rcx
1453f9164: e8 77 92 fe ff              	callq	0x1453e23e0 <.text+0x53e13e0>
1453f9169: 48 8b 4b 20                 	movq	0x20(%rbx), %rcx
1453f916d: 48 8b 53 28                 	movq	0x28(%rbx), %rdx
1453f9171: 48 c1 e2 04                 	shlq	$0x4, %rdx
1453f9175: 45 31 c0                    	xorl	%r8d, %r8d
1453f9178: 0f 1f 84 00 00 00 00 00     	nopl	(%rax,%rax)
1453f9180: 4c 39 c2                    	cmpq	%r8, %rdx
1453f9183: 74 37                       	je	0x1453f91bc <.text+0x53f81bc>
1453f9185: 4d 8d 48 10                 	leaq	0x10(%r8), %r9
1453f9189: 46 38 34 01                 	cmpb	%r14b, (%rcx,%r8)
1453f918d: 4d 89 c8                    	movq	%r9, %r8
1453f9190: 75 ee                       	jne	0x1453f9180 <.text+0x53f8180>
1453f9192: 4e 8b 44 09 f8              	movq	-0x8(%rcx,%r9), %r8
1453f9197: 49 83 f8 09                 	cmpq	$0x9, %r8
1453f919b: 41 b9 09 00 00 00           	movl	$0x9, %r9d
1453f91a1: 4d 0f 42 c8                 	cmovbq	%r8, %r9
1453f91a5: 4d 85 c0                    	testq	%r8, %r8
1453f91a8: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f91ae: 4d 0f 45 c1                 	cmovneq	%r9, %r8
1453f91b2: 4c 39 c0                    	cmpq	%r8, %rax
1453f91b5: 73 14                       	jae	0x1453f91cb <.text+0x53f81cb>
1453f91b7: e9 af 00 00 00              	jmp	0x1453f926b <.text+0x53f826b>
1453f91bc: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f91c2: 4c 39 c0                    	cmpq	%r8, %rax
1453f91c5: 0f 82 a0 00 00 00           	jb	0x1453f926b <.text+0x53f826b>
1453f91cb: 31 c0                       	xorl	%eax, %eax
1453f91cd: 45 31 c0                    	xorl	%r8d, %r8d
1453f91d0: 4c 39 c2                    	cmpq	%r8, %rdx
1453f91d3: 74 2b                       	je	0x1453f9200 <.text+0x53f8200>
1453f91d5: 4d 8d 48 10                 	leaq	0x10(%r8), %r9
1453f91d9: 46 38 34 01                 	cmpb	%r14b, (%rcx,%r8)
1453f91dd: 4d 89 c8                    	movq	%r9, %r8
1453f91e0: 75 ee                       	jne	0x1453f91d0 <.text+0x53f81d0>
1453f91e2: 4a 8b 4c 09 f8              	movq	-0x8(%rcx,%r9), %rcx
1453f91e7: 48 85 c9                    	testq	%rcx, %rcx
1453f91ea: 74 12                       	je	0x1453f91fe <.text+0x53f81fe>
1453f91ec: 48 83 f9 09                 	cmpq	$0x9, %rcx
1453f91f0: b8 09 00 00 00              	movl	$0x9, %eax
1453f91f5: 48 0f 42 c1                 	cmovbq	%rcx, %rax
1453f91f9: 48 ff c8                    	decq	%rax
1453f91fc: eb 02                       	jmp	0x1453f9200 <.text+0x53f8200>
1453f91fe: 31 c0                       	xorl	%eax, %eax
1453f9200: 48 69 c0 b8 00 00 00        	imulq	$0xb8, %rax, %rax
1453f9207: 48 8d 0d fa 97 2d 01        	leaq	0x12d97fa(%rip), %rcx   # 0x1466d2a08
1453f920e: 4c 8b 7c 08 08              	movq	0x8(%rax,%rcx), %r15
1453f9213: 48 8b 5c 08 10              	movq	0x10(%rax,%rcx), %rbx
1453f9218: e8 e3 8f c0 fa              	callq	0x140002200 <.text+0x1200>
1453f921d: ba 01 00 00 00              	movl	$0x1, %edx
1453f9222: 48 89 d9                    	movq	%rbx, %rcx
1453f9225: e8 96 8f c0 fa              	callq	0x1400021c0 <.text+0x11c0>
1453f922a: 48 85 c0                    	testq	%rax, %rax
1453f922d: 0f 84 80 00 00 00           	je	0x1453f92b3 <.text+0x53f82b3>
1453f9233: 49 89 c6                    	movq	%rax, %r14
1453f9236: 48 89 c1                    	movq	%rax, %rcx
1453f9239: 4c 89 fa                    	movq	%r15, %rdx
1453f923c: 49 89 d8                    	movq	%rbx, %r8
1453f923f: e8 b9 b7 31 00              	callq	0x1457149fd <.text+0x57139fd>
1453f9244: 49 8b 54 24 18              	movq	0x18(%r12), %rdx
1453f9249: 48 85 d2                    	testq	%rdx, %rdx
1453f924c: 74 0e                       	je	0x1453f925c <.text+0x53f825c>
1453f924e: 41 b8 01 00 00 00           	movl	$0x1, %r8d
1453f9254: 48 89 f9                    	movq	%rdi, %rcx
1453f9257: e8 74 8f c0 fa              	callq	0x1400021d0 <.text+0x11d0>
1453f925c: 49 89 5c 24 18              	movq	%rbx, 0x18(%r12)
1453f9261: 4d 89 74 24 20              	movq	%r14, 0x20(%r12)
1453f9266: 49 89 5c 24 28              	movq	%rbx, 0x28(%r12)
1453f926b: 41 0f 10 04 24              	movups	(%r12), %xmm0
1453f9270: 49 8b 44 24 10              	movq	0x10(%r12), %rax
1453f9275: 49 8b 4c 24 18              	movq	0x18(%r12), %rcx
1453f927a: 49 8b 54 24 20              	movq	0x20(%r12), %rdx
1453f927f: 4d 8b 44 24 28              	movq	0x28(%r12), %r8
1453f9284: 41 0f 10 4c 24 30           	movups	0x30(%r12), %xmm1
1453f928a: 0f 11 4e 30                 	movups	%xmm1, 0x30(%rsi)
1453f928e: 48 89 56 20                 	movq	%rdx, 0x20(%rsi)
1453f9292: 4c 89 46 28                 	movq	%r8, 0x28(%rsi)
1453f9296: 48 89 46 10                 	movq	%rax, 0x10(%rsi)
1453f929a: 48 89 4e 18                 	movq	%rcx, 0x18(%rsi)
1453f929e: 0f 11 06                    	movups	%xmm0, (%rsi)
1453f92a1: 48 89 f0                    	movq	%rsi, %rax
1453f92a4: 48 83 c4 30                 	addq	$0x30, %rsp
1453f92a8: 5b                          	popq	%rbx
1453f92a9: 5f                          	popq	%rdi
1453f92aa: 5e                          	popq	%rsi
1453f92ab: 41 5c                       	popq	%r12
1453f92ad: 41 5e                       	popq	%r14
1453f92af: 41 5f                       	popq	%r15
1453f92b1: 5d                          	popq	%rbp
1453f92b2: c3                          	retq
1453f92b3: 4c 89 65 f0                 	movq	%r12, -0x10(%rbp)
1453f92b7: b9 01 00 00 00              	movl	$0x1, %ecx
1453f92bc: 48 89 da                    	movq	%rbx, %rdx
1453f92bf: e8 c7 a8 4a 00              	callq	0x1458a3b8b <.text+0x58a2b8b>
1453f92c4: 90                          	nop
1453f92c5: 0f 0b                       	ud2


; Leaf zone-index getter

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453e23e0: 48 83 c2 fe                 	addq	$-0x2, %rdx
1453e23e4: 48 83 fa 06                 	cmpq	$0x6, %rdx
1453e23e8: 77 46                       	ja	0x1453e2430 <.text+0x53e1430>
1453e23ea: 48 8d 05 bb 7f 2f 01        	leaq	0x12f7fbb(%rip), %rax   # 0x1466da3ac
1453e23f1: 48 63 14 90                 	movslq	(%rax,%rdx,4), %rdx
1453e23f5: 48 01 c2                    	addq	%rax, %rdx
1453e23f8: ff e2                       	jmpq	*%rdx
1453e23fa: 66 81 39 61 62              	cmpw	$0x6261, (%rcx)         # imm = 0x6261
1453e23ff: 0f 84 aa 00 00 00           	je	0x1453e24af <.text+0x53e14af>
1453e2405: 66 81 39 61 76              	cmpw	$0x7661, (%rcx)         # imm = 0x7661
1453e240a: 0f 84 ab 00 00 00           	je	0x1453e24bb <.text+0x53e14bb>
1453e2410: 31 c0                       	xorl	%eax, %eax
1453e2412: 66 81 39 61 71              	cmpw	$0x7161, (%rcx)         # imm = 0x7161
1453e2417: 0f 94 c0                    	sete	%al
1453e241a: c1 e0 03                    	shll	$0x3, %eax
1453e241d: c3                          	retq
1453e241e: b8 61 72 65 6e              	movl	$0x6e657261, %eax       # imm = 0x6E657261
1453e2423: 33 01                       	xorl	(%rcx), %eax
1453e2425: 0f b6 49 04                 	movzbl	0x4(%rcx), %ecx
1453e2429: 83 f1 61                    	xorl	$0x61, %ecx
1453e242c: 09 c1                       	orl	%eax, %ecx
1453e242e: 74 79                       	je	0x1453e24a9 <.text+0x53e14a9>
1453e2430: 31 c0                       	xorl	%eax, %eax
1453e2432: c3                          	retq
1453e2433: 48 b8 64 75 73 6b 77 6f 6f 64       	movabsq	$0x646f6f776b737564, %rax # imm = 0x646F6F776B737564
1453e243d: 48 39 01                    	cmpq	%rax, (%rcx)
1453e2440: 75 ee                       	jne	0x1453e2430 <.text+0x53e1430>
1453e2442: b8 01 00 00 00              	movl	$0x1, %eax
1453e2447: c3                          	retq
1453e2448: 0f b7 01                    	movzwl	(%rcx), %eax
1453e244b: 35 77 73 00 00              	xorl	$0x7377, %eax           # imm = 0x7377
1453e2450: 0f b6 51 02                 	movzbl	0x2(%rcx), %edx
1453e2454: 83 f2 67                    	xorl	$0x67, %edx
1453e2457: 66 09 c2                    	orw	%ax, %dx
1453e245a: 74 59                       	je	0x1453e24b5 <.text+0x53e14b5>
1453e245c: 0f b7 01                    	movzwl	(%rcx), %eax
1453e245f: 35 62 72 00 00              	xorl	$0x7262, %eax           # imm = 0x7262
1453e2464: 0f b6 49 02                 	movzbl	0x2(%rcx), %ecx
1453e2468: 83 f1 6d                    	xorl	$0x6d, %ecx
1453e246b: 31 d2                       	xorl	%edx, %edx
1453e246d: 66 09 c1                    	orw	%ax, %cx
1453e2470: b8 07 00 00 00              	movl	$0x7, %eax
1453e2475: 48 0f 45 c2                 	cmovneq	%rdx, %rax
1453e2479: c3                          	retq
1453e247a: b8 65 6c 77 79              	movl	$0x79776c65, %eax       # imm = 0x79776C65
1453e247f: 33 01                       	xorl	(%rcx), %eax
1453e2481: 0f b7 49 04                 	movzwl	0x4(%rcx), %ecx
1453e2485: 81 f1 6e 6e 00 00           	xorl	$0x6e6e, %ecx           # imm = 0x6E6E
1453e248b: 09 c1                       	orl	%eax, %ecx
1453e248d: 31 c0                       	xorl	%eax, %eax
1453e248f: c3                          	retq
1453e2490: b8 66 65 72 61              	movl	$0x61726566, %eax       # imm = 0x61726566
1453e2495: 33 01                       	xorl	(%rcx), %eax
1453e2497: ba 61 6c 61 73              	movl	$0x73616c61, %edx       # imm = 0x73616C61
1453e249c: 33 51 03                    	xorl	0x3(%rcx), %edx
1453e249f: 09 c2                       	orl	%eax, %edx
1453e24a1: 75 8d                       	jne	0x1453e2430 <.text+0x53e1430>
1453e24a3: b8 04 00 00 00              	movl	$0x4, %eax
1453e24a8: c3                          	retq
1453e24a9: b8 05 00 00 00              	movl	$0x5, %eax
1453e24ae: c3                          	retq
1453e24af: b8 03 00 00 00              	movl	$0x3, %eax
1453e24b4: c3                          	retq
1453e24b5: b8 02 00 00 00              	movl	$0x2, %eax
1453e24ba: c3                          	retq
1453e24bb: b8 06 00 00 00              	movl	$0x6, %eax
1453e24c0: c3                          	retq

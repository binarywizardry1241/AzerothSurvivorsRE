; TargetSHA256 47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2
; All instructions read from original PE; no target code execution.

; Value expected-type vtable leaf and exact a string formatter

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140d18a20: e9 eb d7 95 04              	jmp	0x145676210 <.text+0x5675210>


; Expected formatter writes literal146ad6c5b, len8

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145676210: 48 89 d1                    	movq	%rdx, %rcx
145676213: 48 8d 15 41 0a 46 01        	leaq	0x1460a41(%rip), %rdx   # 0x146ad6c5b
14567621a: 41 b8 08 00 00 00           	movl	$0x8, %r8d
145676220: e9 3b ac 05 00              	jmp	0x1456d0e60 <.text+0x56cfe60>


; Invalid-type constructor always emits error tag0

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1457424c0: 56                          	pushq	%rsi
1457424c1: 48 83 ec 50                 	subq	$0x50, %rsp
1457424c5: 48 89 ce                    	movq	%rcx, %rsi
1457424c8: 4c 89 44 24 20              	movq	%r8, 0x20(%rsp)
1457424cd: 4c 89 4c 24 28              	movq	%r9, 0x28(%rsp)
1457424d2: 48 89 54 24 30              	movq	%rdx, 0x30(%rsp)
1457424d7: 48 8d 05 f2 35 f3 ff        	leaq	-0xcca0e(%rip), %rax    # 0x145675ad0 <.text+0x5674ad0>
1457424de: 48 89 44 24 38              	movq	%rax, 0x38(%rsp)
1457424e3: 48 8d 44 24 20              	leaq	0x20(%rsp), %rax
1457424e8: 48 89 44 24 40              	movq	%rax, 0x40(%rsp)
1457424ed: 48 8d 05 4c db 1c fb        	leaq	-0x4e324b4(%rip), %rax  # 0x140910040 <.text+0x90f040>
1457424f4: 48 89 44 24 48              	movq	%rax, 0x48(%rsp)
1457424f9: 48 83 c1 18                 	addq	$0x18, %rcx
1457424fd: 48 8d 15 b4 57 2e 00        	leaq	0x2e57b4(%rip), %rdx    # 0x145a27cb8
145742504: 4c 8d 44 24 30              	leaq	0x30(%rsp), %r8
145742509: e8 92 76 f8 ff              	callq	0x1456c9ba0 <.text+0x56c8ba0>
14574250e: 48 c7 06 00 00 00 00        	movq	$0x0, (%rsi)
145742515: 48 c7 46 30 00 00 00 00     	movq	$0x0, 0x30(%rsi)
14574251d: 48 c7 46 38 08 00 00 00     	movq	$0x8, 0x38(%rsi)
145742525: 48 c7 46 40 00 00 00 00     	movq	$0x0, 0x40(%rsi)
14574252d: 48 c7 46 48 ff ff ff ff     	movq	$-0x1, 0x48(%rsi)
145742535: 48 89 f0                    	movq	%rsi, %rax
145742538: 48 83 c4 50                 	addq	$0x50, %rsp
14574253c: 5e                          	popq	%rsi
14574253d: c3                          	retq


; String value dispatch and success

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140c9152e: 4c 8b 8d 80 01 00 00        	movq	0x180(%rbp), %r9
140c91535: 49 8b 01                    	movq	(%r9), %rax
140c91538: 48 89 c1                    	movq	%rax, %rcx
140c9153b: 48 83 e9 08                 	subq	$0x8, %rcx
140c9153f: ba 01 00 00 00              	movl	$0x1, %edx
140c91544: 48 0f 43 d1                 	cmovaeq	%rcx, %rdx
140c91548: 48 8d 0d 39 74 d9 04        	leaq	0x4d97439(%rip), %rcx   # 0x145a28988
140c9154f: 48 63 14 91                 	movslq	(%rcx,%rdx,4), %rdx
140c91553: 48 01 ca                    	addq	%rcx, %rdx
140c91556: ff e2                       	jmpq	*%rdx


; String success consumes24-byte String and emits result tag2

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140c9175a: 49 8b 51 20                 	movq	0x20(%r9), %rdx
140c9175e: 49 8b 49 28                 	movq	0x28(%r9), %rcx
140c91762: 4d 8b 71 38                 	movq	0x38(%r9), %r14
140c91766: 4d 8b 79 40                 	movq	0x40(%r9), %r15
140c9176a: 49 8b 79 50                 	movq	0x50(%r9), %rdi
140c9176e: 49 8b 59 58                 	movq	0x58(%r9), %rbx
140c91772: 49 8b 41 18                 	movq	0x18(%r9), %rax
140c91776: 48 89 85 b0 00 00 00        	movq	%rax, 0xb0(%rbp)
140c9177d: 41 0f 10 41 08              	movups	0x8(%r9), %xmm0
140c91782: 0f 29 85 a0 00 00 00        	movaps	%xmm0, 0xa0(%rbp)
140c91789: 48 83 fa ff                 	cmpq	$-0x1, %rdx
140c9178d: 74 10                       	je	0x140c9179f <.text+0xc9079f>
140c9178f: 48 85 d2                    	testq	%rdx, %rdx
140c91792: 7e 0b                       	jle	0x140c9179f <.text+0xc9079f>
140c91794: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140c9179a: e8 31 0a 37 ff              	callq	0x1400021d0 <.text+0x11d0>
140c9179f: 49 83 fe ff                 	cmpq	$-0x1, %r14
140c917a3: 74 16                       	je	0x140c917bb <.text+0xc907bb>
140c917a5: 4d 85 f6                    	testq	%r14, %r14
140c917a8: 7e 11                       	jle	0x140c917bb <.text+0xc907bb>
140c917aa: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140c917b0: 4c 89 f9                    	movq	%r15, %rcx
140c917b3: 4c 89 f2                    	movq	%r14, %rdx
140c917b6: e8 15 0a 37 ff              	callq	0x1400021d0 <.text+0x11d0>
140c917bb: 48 83 ff ff                 	cmpq	$-0x1, %rdi
140c917bf: 74 16                       	je	0x140c917d7 <.text+0xc907d7>
140c917c1: 48 85 ff                    	testq	%rdi, %rdi
140c917c4: 7e 11                       	jle	0x140c917d7 <.text+0xc907d7>
140c917c6: 41 b8 01 00 00 00           	movl	$0x1, %r8d
140c917cc: 48 89 d9                    	movq	%rbx, %rcx
140c917cf: 48 89 fa                    	movq	%rdi, %rdx
140c917d2: e8 f9 09 37 ff              	callq	0x1400021d0 <.text+0x11d0>
140c917d7: 48 8b 85 b0 00 00 00        	movq	0xb0(%rbp), %rax
140c917de: 48 89 45 58                 	movq	%rax, 0x58(%rbp)
140c917e2: 0f 28 85 a0 00 00 00        	movaps	0xa0(%rbp), %xmm0
140c917e9: 0f 11 45 48                 	movups	%xmm0, 0x48(%rbp)
140c917ed: 48 c7 45 40 02 00 00 00     	movq	$0x2, 0x40(%rbp)
140c917f5: b0 01                       	movb	$0x1, %al
140c917f7: 31 db                       	xorl	%ebx, %ebx
140c917f9: b1 01                       	movb	$0x1, %cl
140c917fb: b2 01                       	movb	$0x1, %dl
140c917fd: 41 b0 01                    	movb	$0x1, %r8b
140c91800: 41 b1 01                    	movb	$0x1, %r9b
140c91803: 41 b2 01                    	movb	$0x1, %r10b
140c91806: 41 b3 01                    	movb	$0x1, %r11b
140c91809: 40 b7 01                    	movb	$0x1, %dil
140c9180c: 83 7d 40 02                 	cmpl	$0x2, 0x40(%rbp)
140c91810: 0f 84 0b ff ff ff           	je	0x140c91721 <.text+0xc90721>


; DateTime rejects as map, expected a string

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140c9199a: c6 85 a0 00 00 00 0b        	movb	$0xb, 0xa0(%rbp)
140c919a1: c6 85 97 01 00 00 01        	movb	$0x1, 0x197(%rbp)
140c919a8: c6 85 96 01 00 00 01        	movb	$0x1, 0x196(%rbp)
140c919af: c6 85 95 01 00 00 01        	movb	$0x1, 0x195(%rbp)
140c919b6: c6 85 94 01 00 00 01        	movb	$0x1, 0x194(%rbp)
140c919bd: c6 85 93 01 00 00 00        	movb	$0x0, 0x193(%rbp)
140c919c4: c6 85 92 01 00 00 01        	movb	$0x1, 0x192(%rbp)
140c919cb: c6 85 91 01 00 00 01        	movb	$0x1, 0x191(%rbp)
140c919d2: c6 85 90 01 00 00 01        	movb	$0x1, 0x190(%rbp)
140c919d9: c6 85 8f 01 00 00 01        	movb	$0x1, 0x18f(%rbp)
140c919e0: 4c 8d 0d 91 a2 d8 04        	leaq	0x4d8a291(%rip), %r9    # 0x145a1bc78
140c919e7: 48 8d 4d 40                 	leaq	0x40(%rbp), %rcx
140c919eb: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
140c919f2: 4c 8d 85 8e 01 00 00        	leaq	0x18e(%rbp), %r8
140c919f9: e8 c2 0a ab 04              	callq	0x1457424c0 <.text+0x57414c0>
140c919fe: 90                          	nop
140c919ff: b0 01                       	movb	$0x1, %al
140c91a01: 45 31 c9                    	xorl	%r9d, %r9d
140c91a04: b1 01                       	movb	$0x1, %cl
140c91a06: b2 01                       	movb	$0x1, %dl
140c91a08: 41 b0 01                    	movb	$0x1, %r8b
140c91a0b: e9 fc fc ff ff              	jmp	0x140c9170c <.text+0xc9070c>


; Float rejects, expected a string

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140c91a83: f2 0f 11 b5 a8 00 00 00     	movsd	%xmm6, 0xa8(%rbp)
140c91a8b: c6 85 a0 00 00 00 03        	movb	$0x3, 0xa0(%rbp)
140c91a92: c6 85 97 01 00 00 01        	movb	$0x1, 0x197(%rbp)
140c91a99: c6 85 96 01 00 00 01        	movb	$0x1, 0x196(%rbp)
140c91aa0: c6 85 95 01 00 00 01        	movb	$0x1, 0x195(%rbp)
140c91aa7: c6 85 94 01 00 00 01        	movb	$0x1, 0x194(%rbp)
140c91aae: c6 85 93 01 00 00 01        	movb	$0x1, 0x193(%rbp)
140c91ab5: c6 85 92 01 00 00 01        	movb	$0x1, 0x192(%rbp)
140c91abc: c6 85 91 01 00 00 00        	movb	$0x0, 0x191(%rbp)
140c91ac3: c6 85 90 01 00 00 01        	movb	$0x1, 0x190(%rbp)
140c91aca: c6 85 8f 01 00 00 01        	movb	$0x1, 0x18f(%rbp)
140c91ad1: 4c 8d 0d a0 a1 d8 04        	leaq	0x4d8a1a0(%rip), %r9    # 0x145a1bc78
140c91ad8: 48 8d 4d 40                 	leaq	0x40(%rbp), %rcx
140c91adc: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
140c91ae3: 4c 8d 85 8e 01 00 00        	leaq	0x18e(%rbp), %r8
140c91aea: e8 d1 09 ab 04              	callq	0x1457424c0 <.text+0x57414c0>
140c91aef: 90                          	nop
140c91af0: b0 01                       	movb	$0x1, %al
140c91af2: 45 31 db                    	xorl	%r11d, %r11d
140c91af5: b1 01                       	movb	$0x1, %cl
140c91af7: b2 01                       	movb	$0x1, %dl
140c91af9: 41 b0 01                    	movb	$0x1, %r8b
140c91afc: 41 b1 01                    	movb	$0x1, %r9b
140c91aff: 41 b2 01                    	movb	$0x1, %r10b
140c91b02: 40 b7 01                    	movb	$0x1, %dil
140c91b05: b3 01                       	movb	$0x1, %bl
140c91b07: 83 7d 40 02                 	cmpl	$0x2, 0x40(%rbp)
140c91b0b: 0f 84 10 fc ff ff           	je	0x140c91721 <.text+0xc90721>
140c91b11: e9 00 fd ff ff              	jmp	0x140c91816 <.text+0xc90816>


; Bool rejects, expected a string

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140c91b88: 44 88 a5 a1 00 00 00        	movb	%r12b, 0xa1(%rbp)
140c91b8f: c6 85 a0 00 00 00 00        	movb	$0x0, 0xa0(%rbp)
140c91b96: c6 85 97 01 00 00 01        	movb	$0x1, 0x197(%rbp)
140c91b9d: c6 85 96 01 00 00 01        	movb	$0x1, 0x196(%rbp)
140c91ba4: c6 85 95 01 00 00 01        	movb	$0x1, 0x195(%rbp)
140c91bab: c6 85 94 01 00 00 01        	movb	$0x1, 0x194(%rbp)
140c91bb2: c6 85 93 01 00 00 01        	movb	$0x1, 0x193(%rbp)
140c91bb9: c6 85 92 01 00 00 00        	movb	$0x0, 0x192(%rbp)
140c91bc0: c6 85 91 01 00 00 01        	movb	$0x1, 0x191(%rbp)
140c91bc7: c6 85 90 01 00 00 01        	movb	$0x1, 0x190(%rbp)
140c91bce: c6 85 8f 01 00 00 01        	movb	$0x1, 0x18f(%rbp)
140c91bd5: 4c 8d 0d 9c a0 d8 04        	leaq	0x4d8a09c(%rip), %r9    # 0x145a1bc78
140c91bdc: 48 8d 4d 40                 	leaq	0x40(%rbp), %rcx
140c91be0: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
140c91be7: 4c 8d 85 8e 01 00 00        	leaq	0x18e(%rbp), %r8
140c91bee: e8 cd 08 ab 04              	callq	0x1457424c0 <.text+0x57414c0>
140c91bf3: 90                          	nop
140c91bf4: b0 01                       	movb	$0x1, %al
140c91bf6: 45 31 d2                    	xorl	%r10d, %r10d
140c91bf9: b1 01                       	movb	$0x1, %cl
140c91bfb: b2 01                       	movb	$0x1, %dl
140c91bfd: 41 b0 01                    	movb	$0x1, %r8b
140c91c00: 41 b1 01                    	movb	$0x1, %r9b
140c91c03: e9 07 fb ff ff              	jmp	0x140c9170f <.text+0xc9070f>


; Integer rejects, expected a string

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140c91c79: 4c 89 a5 a8 00 00 00        	movq	%r12, 0xa8(%rbp)
140c91c80: c6 85 a0 00 00 00 02        	movb	$0x2, 0xa0(%rbp)
140c91c87: c6 85 97 01 00 00 01        	movb	$0x1, 0x197(%rbp)
140c91c8e: c6 85 96 01 00 00 01        	movb	$0x1, 0x196(%rbp)
140c91c95: c6 85 95 01 00 00 01        	movb	$0x1, 0x195(%rbp)
140c91c9c: c6 85 94 01 00 00 01        	movb	$0x1, 0x194(%rbp)
140c91ca3: c6 85 93 01 00 00 01        	movb	$0x1, 0x193(%rbp)
140c91caa: c6 85 92 01 00 00 01        	movb	$0x1, 0x192(%rbp)
140c91cb1: c6 85 91 01 00 00 01        	movb	$0x1, 0x191(%rbp)
140c91cb8: c6 85 90 01 00 00 00        	movb	$0x0, 0x190(%rbp)
140c91cbf: c6 85 8f 01 00 00 01        	movb	$0x1, 0x18f(%rbp)
140c91cc6: 4c 8d 0d ab 9f d8 04        	leaq	0x4d89fab(%rip), %r9    # 0x145a1bc78
140c91ccd: 48 8d 4d 40                 	leaq	0x40(%rbp), %rcx
140c91cd1: 48 8d 95 a0 00 00 00        	leaq	0xa0(%rbp), %rdx
140c91cd8: 4c 8d 85 8e 01 00 00        	leaq	0x18e(%rbp), %r8
140c91cdf: e8 dc 07 ab 04              	callq	0x1457424c0 <.text+0x57414c0>
140c91ce4: 90                          	nop
140c91ce5: b0 01                       	movb	$0x1, %al
140c91ce7: 31 ff                       	xorl	%edi, %edi
140c91ce9: b1 01                       	movb	$0x1, %cl
140c91ceb: b2 01                       	movb	$0x1, %dl
140c91ced: 41 b0 01                    	movb	$0x1, %r8b
140c91cf0: 41 b1 01                    	movb	$0x1, %r9b
140c91cf3: 41 b2 01                    	movb	$0x1, %r10b
140c91cf6: 41 b3 01                    	movb	$0x1, %r11b
140c91cf9: b3 01                       	movb	$0x1, %bl
140c91cfb: 83 7d 40 02                 	cmpl	$0x2, 0x40(%rbp)
140c91cff: 0f 84 1c fa ff ff           	je	0x140c91721 <.text+0xc90721>
140c91d05: e9 0c fb ff ff              	jmp	0x140c91816 <.text+0xc90816>


; Sequence/map default visitor rejects via a string vtable

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145741f50: 55                          	pushq	%rbp
145741f51: 56                          	pushq	%rsi
145741f52: 48 81 ec b8 00 00 00        	subq	$0xb8, %rsp
145741f59: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
145741f61: 48 c7 45 30 fe ff ff ff     	movq	$-0x2, 0x30(%rbp)
145741f69: 48 89 55 20                 	movq	%rdx, 0x20(%rbp)
145741f6d: 48 89 ce                    	movq	%rcx, %rsi
145741f70: c6 45 08 0b                 	movb	$0xb, 0x8(%rbp)
145741f74: 4c 8d 0d fd 9c 2d 00        	leaq	0x2d9cfd(%rip), %r9     # 0x145a1bc78
145741f7b: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
145741f7f: 48 8d 55 08                 	leaq	0x8(%rbp), %rdx
145741f83: 4c 8d 45 2f                 	leaq	0x2f(%rbp), %r8
145741f87: e8 34 05 00 00              	callq	0x1457424c0 <.text+0x57414c0>
145741f8c: 90                          	nop
145741f8d: 0f 10 45 f8                 	movups	-0x8(%rbp), %xmm0
145741f91: 0f 11 46 50                 	movups	%xmm0, 0x50(%rsi)
145741f95: 0f 10 45 e8                 	movups	-0x18(%rbp), %xmm0
145741f99: 0f 11 46 40                 	movups	%xmm0, 0x40(%rsi)
145741f9d: 0f 10 45 a8                 	movups	-0x58(%rbp), %xmm0
145741fa1: 0f 10 4d b8                 	movups	-0x48(%rbp), %xmm1
145741fa5: 0f 10 55 c8                 	movups	-0x38(%rbp), %xmm2
145741fa9: 0f 10 5d d8                 	movups	-0x28(%rbp), %xmm3
145741fad: 0f 11 5e 30                 	movups	%xmm3, 0x30(%rsi)
145741fb1: 0f 11 56 20                 	movups	%xmm2, 0x20(%rsi)
145741fb5: 0f 11 4e 10                 	movups	%xmm1, 0x10(%rsi)
145741fb9: 0f 11 06                    	movups	%xmm0, (%rsi)
145741fbc: 48 8b 45 20                 	movq	0x20(%rbp), %rax


; Sequence default visitor

AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145742070: 55                          	pushq	%rbp
145742071: 56                          	pushq	%rsi
145742072: 48 81 ec b8 00 00 00        	subq	$0xb8, %rsp
145742079: 48 8d ac 24 80 00 00 00     	leaq	0x80(%rsp), %rbp
145742081: 48 c7 45 30 fe ff ff ff     	movq	$-0x2, 0x30(%rbp)
145742089: 48 89 55 20                 	movq	%rdx, 0x20(%rbp)
14574208d: 48 89 ce                    	movq	%rcx, %rsi
145742090: c6 45 08 0a                 	movb	$0xa, 0x8(%rbp)
145742094: 4c 8d 0d dd 9b 2d 00        	leaq	0x2d9bdd(%rip), %r9     # 0x145a1bc78
14574209b: 48 8d 4d a8                 	leaq	-0x58(%rbp), %rcx
14574209f: 48 8d 55 08                 	leaq	0x8(%rbp), %rdx
1457420a3: 4c 8d 45 2f                 	leaq	0x2f(%rbp), %r8
1457420a7: e8 14 04 00 00              	callq	0x1457424c0 <.text+0x57414c0>
1457420ac: 90                          	nop
1457420ad: 0f 10 45 f8                 	movups	-0x8(%rbp), %xmm0


; Key String allocation/copy
0x140c8e4ff: CALL 0x1414d0d90
0x140c8e504: NOP
0x140c8e505: MOV RAX, qword ptr [RBP + 0x550]
0x140c8e50c: MOV RCX, qword ptr [RBP + 0x558]
0x140c8e513: MOV RDX, qword ptr [RBP + 0x560]
0x140c8e51a: MOV qword ptr [RBP + 0x398], RAX
0x140c8e521: MOV qword ptr [RBP + 0x3a0], RCX
0x140c8e528: MOV qword ptr [RBP + 0x3a8], RDX
0x140c8e52f: MOV R8D, 0x90
0x140c8e535: MOV RCX, RDI
0x140c8e538: MOV RDX, RSI
0x140c8e53b: CALL 0x1457149fd
0x140c8e540: MOV R12, qword ptr [RBP + 0x3c0]
0x140c8e547: TEST R12, R12
0x140c8e54a: JS 0x140c8e992
0x140c8e550: JZ 0x140c8e5a0
0x140c8e552: MOV RDI, R14
0x140c8e555: MOV R14, qword ptr [RBP + 0x3b8]
0x140c8e55c: CALL 0x140002200
0x140c8e561: MOV EBX, 0x1
0x140c8e566: MOV EDX, 0x1
0x140c8e56b: MOV RCX, R12
0x140c8e56e: CALL 0x1400021c0
0x140c8e573: TEST RAX, RAX
0x140c8e576: JZ 0x140c8e994
0x140c8e57c: MOV qword ptr [RBP + 0x580], RAX
0x140c8e583: MOV RCX, RAX
0x140c8e586: MOV RDX, R14
0x140c8e589: MOV R8, R12
0x140c8e58c: CALL 0x1457149fd
0x140c8e591: MOV R14, RDI
0x140c8e594: LEA RDI, [RBP + 0x3b0]
0x140c8e59b: MOV RBX, R13
0x140c8e59e: JMP 0x140c8e5ac
0x140c8e5a0: MOV EAX, 0x1
0x140c8e5a5: MOV qword ptr [RBP + 0x580], RAX
0x140c8e5ac: MOV byte ptr [RBP + 0x58f], 0x1
0x140c8e5b3: MOV RCX, RDI

; Per-entry String value call/result
0x140c8e6fb: MOV R8D, 0xb0
0x140c8e701: MOV RCX, R15
0x140c8e704: LEA RDX, [RBP + 0x30]
0x140c8e708: CALL 0x1457149fd
0x140c8e70d: MOV byte ptr [RBP + 0x190], 0x0
0x140c8e714: MOV byte ptr [RBP + 0x58e], 0x0
0x140c8e71b: MOV RCX, RSI
0x140c8e71e: MOV RDX, R15
0x140c8e721: CALL 0x140c914b0
0x140c8e726: NOP
0x140c8e727: CMP dword ptr [RBP + 0x480], 0x2
0x140c8e72e: JNZ 0x140c8e750
0x140c8e730: LEA RCX, [RBP + 0x238]
0x140c8e737: CALL 0x140991ec0
0x140c8e73c: MOV RSI, qword ptr [RBP + 0x578]
0x140c8e743: JMP 0x140c8e8e2

; Accepted pair insertion
0x140c8e8d8: CMP RBX, 0x2
0x140c8e8dc: JNZ 0x140c8ea50
0x140c8e8e2: LEA RCX, [RBP + 0x488]
0x140c8e8e9: MOV RAX, qword ptr [RCX + 0x10]
0x140c8e8ed: MOV qword ptr [RBP + 0x450], RAX
0x140c8e8f4: MOVUPS XMM0, xmmword ptr [RCX]
0x140c8e8f7: MOVAPS xmmword ptr [RBP + 0x440], XMM0
0x140c8e8fe: MOV RCX, qword ptr [RBP + 0x568]
0x140c8e905: MOV qword ptr [RBP + 0x398], RCX
0x140c8e90c: MOV RDX, qword ptr [RBP + 0x580]
0x140c8e913: MOV qword ptr [RBP + 0x3a0], RDX
0x140c8e91a: MOV qword ptr [RBP + 0x3a8], RCX
0x140c8e921: MOV qword ptr [RBP + 0x40], RAX
0x140c8e925: MOVAPS xmmword ptr [RBP + 0x30], XMM0
0x140c8e929: MOV R12, R15
0x140c8e92c: MOV RCX, R15
0x140c8e92f: LEA RDX, [RBP + 0x518]
0x140c8e936: LEA R8, [RBP + 0x398]
0x140c8e93d: LEA R9, [RBP + 0x30]
0x140c8e941: CALL 0x140a589e0

; Error return drops whole accumulated map
0x140c8ea50: MOV R14, qword ptr [RBP + 0x530]
0x140c8ea57: LEA R13, [RBP + 0x238]
0x140c8ea5e: MOV RSI, qword ptr [RBP + 0x488]
0x140c8ea65: MOV R12, qword ptr [RBP + 0x490]
0x140c8ea6c: MOV R15, qword ptr [RBP + 0x498]
0x140c8ea73: MOVAPS XMM0, xmmword ptr [RBP + 0x4a0]
0x140c8ea7a: MOVAPS xmmword ptr [RBP + 0x440], XMM0
0x140c8ea81: MOVAPS XMM0, xmmword ptr [RBP + 0x4b0]
0x140c8ea88: MOVAPS xmmword ptr [RBP + 0x450], XMM0
0x140c8ea8f: MOVAPS XMM0, xmmword ptr [RBP + 0x4c0]
0x140c8ea96: MOVAPS xmmword ptr [RBP + 0x460], XMM0
0x140c8ea9d: MOVAPS XMM0, xmmword ptr [RBP + 0x4d0]
0x140c8eaa4: MOVAPS xmmword ptr [RBP + 0x470], XMM0
0x140c8eaab: MOV RDX, qword ptr [RBP + 0x568]
0x140c8eab2: TEST RDX, RDX
0x140c8eab5: JZ 0x140c8eac9
0x140c8eab7: MOV R8D, 0x1
0x140c8eabd: MOV RCX, qword ptr [RBP + 0x580]
0x140c8eac4: CALL 0x1400021d0
0x140c8eac9: MOV RAX, qword ptr [RBP + 0x538]
0x140c8ead0: MOV qword ptr [RAX + 0x10], R12
0x140c8ead4: MOV qword ptr [RAX + 0x18], R15
0x140c8ead8: MOVAPS XMM0, xmmword ptr [RBP + 0x440]
0x140c8eadf: MOVAPS XMM1, xmmword ptr [RBP + 0x450]
0x140c8eae6: MOVAPS XMM2, xmmword ptr [RBP + 0x460]
0x140c8eaed: MOVAPS XMM3, xmmword ptr [RBP + 0x470]
0x140c8eaf4: MOVUPS xmmword ptr [RAX + 0x20], XMM0
0x140c8eaf8: MOVUPS xmmword ptr [RAX + 0x30], XMM1
0x140c8eafc: MOVUPS xmmword ptr [RAX + 0x40], XMM2
0x140c8eb00: MOVUPS xmmword ptr [RAX + 0x50], XMM3
0x140c8eb04: MOV qword ptr [RAX], RBX
0x140c8eb07: MOV qword ptr [RAX + 0x8], RSI
0x140c8eb0b: LEA RCX, [RBP + 0x518]
0x140c8eb12: CALL 0x140a31f80
0x140c8eb17: NOP

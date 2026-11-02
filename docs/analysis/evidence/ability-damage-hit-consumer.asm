
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b7df8: 48 c1 ea 28                 	shrq	$0x28, %rdx
1454b7dfc: 0f 57 c0                    	xorps	%xmm0, %xmm0
1454b7dff: f3 0f 2a c2                 	cvtsi2ss	%edx, %xmm0
1454b7e03: f3 41 0f 59 c0              	mulss	%xmm8, %xmm0
1454b7e08: f3 0f 10 8f 5c 04 00 00     	movss	0x45c(%rdi), %xmm1
1454b7e10: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454b7e13: 77 0b                       	ja	0x1454b7e20 <.text+0x54b6e20>
1454b7e15: 0f 28 fe                    	movaps	%xmm6, %xmm7
1454b7e18: eb 12                       	jmp	0x1454b7e2c <.text+0x54b6e2c>
1454b7e1a: 66 0f 1f 44 00 00           	nopw	(%rax,%rax)
1454b7e20: f3 0f 10 bf 60 04 00 00     	movss	0x460(%rdi), %xmm7
1454b7e28: f3 0f 59 fe                 	mulss	%xmm6, %xmm7
1454b7e2c: 44 8b 4e 40                 	movl	0x40(%rsi), %r9d
1454b7e30: 0f b6 46 74                 	movzbl	0x74(%rsi), %eax
1454b7e34: 0f 2e c8                    	ucomiss	%xmm0, %xmm1
1454b7e37: 0f 97 44 24 28              	seta	0x28(%rsp)
1454b7e3c: 88 44 24 20                 	movb	%al, 0x20(%rsp)
1454b7e40: c6 44 24 30 00              	movb	$0x0, 0x30(%rsp)
1454b7e45: 48 89 f9                    	movq	%rdi, %rcx
1454b7e48: 4c 89 f2                    	movq	%r14, %rdx
1454b7e4b: 0f 28 d7                    	movaps	%xmm7, %xmm2
1454b7e4e: e8 fd b5 fd ff              	callq	0x145493450 <.text+0x5492450>

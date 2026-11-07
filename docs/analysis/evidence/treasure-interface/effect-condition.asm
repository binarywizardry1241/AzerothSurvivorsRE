
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cb900: 48 83 ec 28                 	subq	$0x28, %rsp
1454cb904: 8b 02                       	movl	(%rdx), %eax
1454cb906: 45 0f b6 48 1d              	movzbl	0x1d(%r8), %r9d
1454cb90b: 4c 8d 15 06 ce 52 01        	leaq	0x152ce06(%rip), %r10   # 0x1469f8718
1454cb912: 49 63 04 82                 	movslq	(%r10,%rax,4), %rax
1454cb916: 4c 01 d0                    	addq	%r10, %rax
1454cb919: ff e0                       	jmpq	*%rax
1454cb91b: 45 84 c9                    	testb	%r9b, %r9b
1454cb91e: 0f 84 98 00 00 00           	je	0x1454cb9bc <.text+0x54ca9bc>
1454cb924: 41 80 78 22 00              	cmpb	$0x0, 0x22(%r8)
1454cb929: 0f 84 b8 00 00 00           	je	0x1454cb9e7 <.text+0x54ca9e7>
1454cb92f: e9 88 00 00 00              	jmp	0x1454cb9bc <.text+0x54ca9bc>
1454cb934: 41 80 f9 07                 	cmpb	$0x7, %r9b
1454cb938: 0f 94 c0                    	sete	%al
1454cb93b: 48 83 c4 28                 	addq	$0x28, %rsp
1454cb93f: c3                          	retq
1454cb940: 41 80 f9 01                 	cmpb	$0x1, %r9b
1454cb944: 0f 85 9d 00 00 00           	jne	0x1454cb9e7 <.text+0x54ca9e7>
1454cb94a: eb 70                       	jmp	0x1454cb9bc <.text+0x54ca9bc>
1454cb94c: 41 80 f9 05                 	cmpb	$0x5, %r9b
1454cb950: 0f 85 91 00 00 00           	jne	0x1454cb9e7 <.text+0x54ca9e7>
1454cb956: f3 0f 10 42 04              	movss	0x4(%rdx), %xmm0
1454cb95b: f3 0f 59 81 70 04 00 00     	mulss	0x470(%rcx), %xmm0
1454cb963: 0f 2e 81 18 04 00 00        	ucomiss	0x418(%rcx), %xmm0
1454cb96a: 0f 97 c0                    	seta	%al
1454cb96d: 48 83 c4 28                 	addq	$0x28, %rsp
1454cb971: c3                          	retq
1454cb972: 31 c0                       	xorl	%eax, %eax
1454cb974: 45 84 c9                    	testb	%r9b, %r9b
1454cb977: 75 f4                       	jne	0x1454cb96d <.text+0x54ca96d>
1454cb979: 41 80 78 1f 00              	cmpb	$0x0, 0x1f(%r8)
1454cb97e: 75 3c                       	jne	0x1454cb9bc <.text+0x54ca9bc>
1454cb980: eb eb                       	jmp	0x1454cb96d <.text+0x54ca96d>
1454cb982: 31 c0                       	xorl	%eax, %eax
1454cb984: 45 84 c9                    	testb	%r9b, %r9b
1454cb987: 75 e4                       	jne	0x1454cb96d <.text+0x54ca96d>
1454cb989: 41 80 78 21 00              	cmpb	$0x0, 0x21(%r8)
1454cb98e: 75 2c                       	jne	0x1454cb9bc <.text+0x54ca9bc>
1454cb990: eb db                       	jmp	0x1454cb96d <.text+0x54ca96d>
1454cb992: 41 80 f9 03                 	cmpb	$0x3, %r9b
1454cb996: 75 4f                       	jne	0x1454cb9e7 <.text+0x54ca9e7>
1454cb998: eb 22                       	jmp	0x1454cb9bc <.text+0x54ca9bc>
1454cb99a: 45 84 c9                    	testb	%r9b, %r9b
1454cb99d: 41 0f 94 c1                 	sete	%r9b
1454cb9a1: 45 0a 48 22                 	orb	0x22(%r8), %r9b
1454cb9a5: 31 c0                       	xorl	%eax, %eax
1454cb9a7: 41 f6 c1 01                 	testb	$0x1, %r9b
1454cb9ab: 74 c0                       	je	0x1454cb96d <.text+0x54ca96d>
1454cb9ad: 41 80 78 20 00              	cmpb	$0x0, 0x20(%r8)
1454cb9b2: 75 08                       	jne	0x1454cb9bc <.text+0x54ca9bc>
1454cb9b4: eb b7                       	jmp	0x1454cb96d <.text+0x54ca96d>
1454cb9b6: 41 80 f9 02                 	cmpb	$0x2, %r9b
1454cb9ba: 73 2b                       	jae	0x1454cb9e7 <.text+0x54ca9e7>
1454cb9bc: 48 83 c2 08                 	addq	$0x8, %rdx
1454cb9c0: 41 8b 40 08                 	movl	0x8(%r8), %eax
1454cb9c4: 45 0f b6 48 1c              	movzbl	0x1c(%r8), %r9d
1454cb9c9: 45 0f b6 40 1e              	movzbl	0x1e(%r8), %r8d
1454cb9ce: 44 88 44 24 20              	movb	%r8b, 0x20(%rsp)
1454cb9d3: 41 89 c0                    	movl	%eax, %r8d
1454cb9d6: e8 d5 48 00 00              	callq	0x1454d02b0 <.text+0x54cf2b0>
1454cb9db: 90                          	nop
1454cb9dc: 48 83 c4 28                 	addq	$0x28, %rsp
1454cb9e0: c3                          	retq
1454cb9e1: 41 80 f9 02                 	cmpb	$0x2, %r9b
1454cb9e5: 74 d5                       	je	0x1454cb9bc <.text+0x54ca9bc>
1454cb9e7: 31 c0                       	xorl	%eax, %eax
1454cb9e9: 48 83 c4 28                 	addq	$0x28, %rsp
1454cb9ed: c3                          	retq
1454cb9ee: 41 80 f9 06                 	cmpb	$0x6, %r9b
1454cb9f2: 0f 94 c0                    	sete	%al
1454cb9f5: 48 83 c4 28                 	addq	$0x28, %rsp
1454cb9f9: c3                          	retq
1454cb9fa: 41 80 f9 04                 	cmpb	$0x4, %r9b
1454cb9fe: 0f 94 c0                    	sete	%al
1454cba01: 48 83 c4 28                 	addq	$0x28, %rsp
1454cba05: c3                          	retq

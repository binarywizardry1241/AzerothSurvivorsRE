
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454713e0: 49 8b b4 24 a0 02 00 00     	movq	0x2a0(%r12), %rsi
1454713e8: 48 85 f6                    	testq	%rsi, %rsi
1454713eb: 0f 84 00 09 00 00           	je	0x145471cf1 <.text+0x5470cf1>
1454713f1: 49 8d 84 24 30 05 00 00     	leaq	0x530(%r12), %rax
1454713f9: 48 89 85 e8 02 00 00        	movq	%rax, 0x2e8(%rbp)
145471400: 49 8d 84 24 e0 03 00 00     	leaq	0x3e0(%r12), %rax
145471408: 48 89 85 c8 02 00 00        	movq	%rax, 0x2c8(%rbp)
14547140f: f3 44 0f 10 05 3c f7 42 00  	movss	0x42f73c(%rip), %xmm8   # 0x1458a0b54
145471418: f3 44 0f 10 0d 67 e4 42 00  	movss	0x42e467(%rip), %xmm9   # 0x14589f888
145471421: 45 0f 57 d2                 	xorps	%xmm10, %xmm10
145471425: f3 44 0f 10 1d 16 84 46 00  	movss	0x468416(%rip), %xmm11  # 0x1458d9844
14547142e: f3 44 0f 10 25 35 e9 45 00  	movss	0x45e935(%rip), %xmm12  # 0x1458cfd6c
145471437: f3 44 0f 10 2d d0 80 50 00  	movss	0x5080d0(%rip), %xmm13  # 0x145979510
145471440: f3 44 0f 10 35 17 1d 43 00  	movss	0x431d17(%rip), %xmm14  # 0x1458a3160

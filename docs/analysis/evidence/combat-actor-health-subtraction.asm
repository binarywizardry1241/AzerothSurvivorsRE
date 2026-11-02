
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145493960: 4b 39 bc 3e 88 00 00 00     	cmpq	%rdi, 0x88(%r14,%r15)
145493968: 75 e6                       	jne	0x145493950 <.text+0x5492950>
14549396a: 43 83 7c 3e 68 01           	cmpl	$0x1, 0x68(%r14,%r15)
145493970: 74 de                       	je	0x145493950 <.text+0x5492950>
145493972: f3 44 0f 59 de              	mulss	%xmm6, %xmm11
145493977: f3 44 0f 5f 1d 50 d0 40 00  	maxss	0x40d050(%rip), %xmm11  # 0x1458a09d0
145493980: f3 43 0f 10 9c 3e f0 00 00 00       	movss	0xf0(%r14,%r15), %xmm3
14549398a: f3 43 0f 10 94 3e 28 01 00 00       	movss	0x128(%r14,%r15), %xmm2
145493994: 0f 57 c9                    	xorps	%xmm1, %xmm1
145493997: 0f 28 c3                    	movaps	%xmm3, %xmm0
14549399a: f3 0f 5f c1                 	maxss	%xmm1, %xmm0
14549399e: f3 41 0f 5c db              	subss	%xmm11, %xmm3
1454939a3: f3 43 0f 11 9c 3e f0 00 00 00       	movss	%xmm3, 0xf0(%r14,%r15)

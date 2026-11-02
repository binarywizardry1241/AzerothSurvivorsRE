
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145451160:     	movd	(%rcx), %xmm0
145451164:     	pxor	%xmm1, %xmm1
145451168:     	punpcklwd	%xmm1, %xmm0    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3]
14545116c:     	cvtdq2ps	%xmm0, %xmm0
14545116f:     	movaps	0x12cfe1a(%rip), %xmm2  # 0x146720f90
145451176:     	addps	%xmm2, %xmm0
145451179:     	movaps	0x11d6d60(%rip), %xmm3  # 0x146627ee0
145451180:     	divps	%xmm3, %xmm0
145451183:     	mulps	0x12cfe16(%rip), %xmm0  # 0x146720fa0
14545118a:     	movd	0x4(%rcx), %xmm4
14545118f:     	punpcklwd	%xmm1, %xmm4    # xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1],xmm4[2],xmm1[2],xmm4[3],xmm1[3]
145451193:     	cvtdq2ps	%xmm4, %xmm1
145451196:     	addps	%xmm2, %xmm1
145451199:     	divps	%xmm3, %xmm1
14545119c:     	mulps	0x12cfe0d(%rip), %xmm1  # 0x146720fb0
1454511a3:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1454511a7:     	addss	%xmm0, %xmm2
1454511ab:     	addss	%xmm1, %xmm2
1454511af:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454511b3:     	addss	%xmm2, %xmm0
1454511b7:     	addss	0x49a2c1(%rip), %xmm0   # 0x1458eb480
1454511bf:     	minss	0x4a545d(%rip), %xmm0   # 0x1458f6624
1454511c7:     	retq

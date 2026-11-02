
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14595164f:     	movss	0x478(%rbx), %xmm3
145951657:     	movss	0x47c(%rbx), %xmm6
14595165f:     	movss	0x44(%rcx), %xmm4
145951664:     	movzbl	0x75(%rcx), %ecx
145951668:     	addb	$-0x2, %cl
14595166b:     	cmpb	$0x7, %cl
14595166e:     	jae	0x14595167f <.text+0x595067f>
145951670:     	movzbl	%cl, %ecx
145951673:     	leaq	0x1529afa(%rip), %rdx   # 0x146e7b174
14595167a:     	movss	(%rdx,%rcx,4), %xmm0
14595167f:     	xorps	%xmm2, %xmm2
145951682:     	mulss	%xmm2, %xmm3
145951686:     	xorps	%xmm5, %xmm5
145951689:     	cmpltss	%xmm4, %xmm5
14595168e:     	mulss	0x4226aa(%rip), %xmm4   # 0x145d73d40
145951696:     	andps	%xmm3, %xmm5
145951699:     	mulss	%xmm4, %xmm1
14595169d:     	mulss	%xmm0, %xmm1
1459516a1:     	addss	%xmm5, %xmm1
1459516a5:     	mulss	%xmm1, %xmm6

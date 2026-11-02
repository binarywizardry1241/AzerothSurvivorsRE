
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140a6b970:     	pushq	%rsi
140a6b971:     	subq	$0x50, %rsp
140a6b975:     	movaps	%xmm8, 0x40(%rsp)
140a6b97b:     	movaps	%xmm7, 0x30(%rsp)
140a6b980:     	movaps	%xmm6, 0x20(%rsp)
140a6b985:     	movq	%rcx, %rsi
140a6b988:     	movss	(%rdx), %xmm0
140a6b98c:     	movss	0xc(%rdx), %xmm6
140a6b991:     	movaps	%xmm6, %xmm1
140a6b994:     	mulss	%xmm6, %xmm1
140a6b998:     	movss	0x4e7fae0(%rip), %xmm7  # 0x1458eb480
140a6b9a0:     	addss	%xmm7, %xmm1
140a6b9a4:     	sqrtss	%xmm1, %xmm1
140a6b9a8:     	divss	%xmm1, %xmm0
140a6b9ac:     	mulss	0x4e7fad4(%rip), %xmm0  # 0x1458eb488
140a6b9b4:     	movd	0x4(%rdx), %xmm8
140a6b9ba:     	callq	0x145756e8b <.text+0x5755e8b>
140a6b9bf:     	divss	%xmm0, %xmm7
140a6b9c3:     	movq	%xmm7, %xmm0            # xmm0 = xmm7[0],zero
140a6b9c7:     	divss	%xmm6, %xmm7
140a6b9cb:     	xorps	%xmm1, %xmm1
140a6b9ce:     	xorps	%xmm2, %xmm2
140a6b9d1:     	movss	%xmm7, %xmm2            # xmm2 = xmm7[0],xmm2[1,2,3]
140a6b9d5:     	shufps	$0xe2, %xmm1, %xmm0     # xmm0 = xmm0[2,0],xmm1[2,3]
140a6b9d9:     	movq	%xmm8, %xmm3            # xmm3 = xmm8[0],zero
140a6b9de:     	shufps	$0x84, %xmm3, %xmm1     # xmm1 = xmm1[0,1],xmm3[0,2]
140a6b9e2:     	movaps	%xmm2, (%rsi)
140a6b9e5:     	movaps	%xmm0, 0x10(%rsi)
140a6b9e9:     	movaps	0x4f8bc40(%rip), %xmm0  # 0x1459f7630
140a6b9f0:     	movaps	%xmm0, 0x20(%rsi)
140a6b9f4:     	movaps	%xmm1, 0x30(%rsi)
140a6b9f8:     	movq	%rsi, %rax
140a6b9fb:     	movaps	0x20(%rsp), %xmm6
140a6ba00:     	movaps	0x30(%rsp), %xmm7
140a6ba05:     	movaps	0x40(%rsp), %xmm8
140a6ba0b:     	addq	$0x50, %rsp
140a6ba0f:     	popq	%rsi
140a6ba10:     	retq

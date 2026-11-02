
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14541b8b0:     	xorps	%xmm0, %xmm0
14541b8b3:     	cmpq	$0xd, %rdx
14541b8b7:     	je	0x14541b988 <.text+0x541a988>
14541b8bd:     	cmpq	$0xc, %rdx
14541b8c1:     	je	0x14541b963 <.text+0x541a963>
14541b8c7:     	cmpq	$0x9, %rdx
14541b8cb:     	jne	0x14541b9a8 <.text+0x541a9a8>
14541b8d1:     	movabsq	$0x676172646f6f6c62, %rax # imm = 0x676172646F6F6C62
14541b8db:     	xorq	(%rcx), %rax
14541b8de:     	movzbl	0x8(%rcx), %edx
14541b8e2:     	xorq	$0x65, %rdx
14541b8e6:     	orq	%rax, %rdx
14541b8e9:     	je	0x14541b9b2 <.text+0x541a9b2>
14541b8ef:     	movabsq	$0x7461665f6c616573, %rax # imm = 0x7461665F6C616573
14541b8f9:     	xorq	(%rcx), %rax
14541b8fc:     	movzbl	0x8(%rcx), %edx
14541b900:     	xorq	$0x65, %rdx
14541b904:     	orq	%rax, %rdx
14541b907:     	je	0x14541b97f <.text+0x541a97f>
14541b909:     	movabsq	$0x7269665f6c756f73, %rax # imm = 0x7269665F6C756F73
14541b913:     	xorq	(%rcx), %rax
14541b916:     	movzbl	0x8(%rcx), %edx
14541b91a:     	xorq	$0x65, %rdx
14541b91e:     	movss	0x4dad06(%rip), %xmm1   # 0x1458f662c
14541b926:     	orq	%rax, %rdx
14541b929:     	je	0x14541b95f <.text+0x541a95f>
14541b92b:     	movabsq	$0x6c6577746867696c, %rax # imm = 0x6C6577746867696C
14541b935:     	xorq	(%rcx), %rax
14541b938:     	movzbl	0x8(%rcx), %edx
14541b93c:     	xorq	$0x6c, %rdx
14541b940:     	orq	%rax, %rdx
14541b943:     	je	0x14541b9bb <.text+0x541a9bb>
14541b945:     	movabsq	$0x70726f6d796c6f70, %rax # imm = 0x70726F6D796C6F70
14541b94f:     	xorq	(%rcx), %rax
14541b952:     	movzbl	0x8(%rcx), %ecx
14541b956:     	xorq	$0x68, %rcx
14541b95a:     	orq	%rax, %rcx
14541b95d:     	jne	0x14541b9a8 <.text+0x541a9a8>
14541b95f:     	movaps	%xmm1, %xmm0
14541b962:     	retq
14541b963:     	movabsq	$0x5f737265746e7568, %rax # imm = 0x5F737265746E7568
14541b96d:     	xorq	(%rcx), %rax
14541b970:     	movl	0x8(%rcx), %ecx
14541b973:     	xorq	$0x6b72616d, %rcx       # imm = 0x6B72616D
14541b97a:     	orq	%rax, %rcx
14541b97d:     	jne	0x14541b9a8 <.text+0x541a9a8>
14541b97f:     	movss	0x4dac9d(%rip), %xmm0   # 0x1458f6624
14541b987:     	retq
14541b988:     	movabsq	$0x5f666f5f6c6c6163, %rax # imm = 0x5F666F5F6C6C6163
14541b992:     	xorq	(%rcx), %rax
14541b995:     	movabsq	$0x656d616c665f666f, %rdx # imm = 0x656D616C665F666F
14541b99f:     	xorq	0x5(%rcx), %rdx
14541b9a3:     	orq	%rax, %rdx
14541b9a6:     	je	0x14541b9a9 <.text+0x541a9a9>
14541b9a8:     	retq
14541b9a9:     	movss	0x4e1287(%rip), %xmm0   # 0x1458fcc38
14541b9b1:     	retq
14541b9b2:     	movss	0x4dd446(%rip), %xmm0   # 0x1458f8e00
14541b9ba:     	retq
14541b9bb:     	movss	0x4e0ee9(%rip), %xmm0   # 0x1458fc8ac
14541b9c3:     	retq

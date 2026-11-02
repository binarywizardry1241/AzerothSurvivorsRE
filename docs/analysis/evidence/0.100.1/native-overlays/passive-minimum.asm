
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454536c0:     	xorps	%xmm0, %xmm0
1454536c3:     	cmpq	$0xd, %rdx
1454536c7:     	je	0x145453798 <.text+0x5452798>
1454536cd:     	cmpq	$0xc, %rdx
1454536d1:     	je	0x145453773 <.text+0x5452773>
1454536d7:     	cmpq	$0x9, %rdx
1454536db:     	jne	0x1454537b8 <.text+0x54527b8>
1454536e1:     	movabsq	$0x676172646f6f6c62, %rax # imm = 0x676172646F6F6C62
1454536eb:     	xorq	(%rcx), %rax
1454536ee:     	movzbl	0x8(%rcx), %edx
1454536f2:     	xorq	$0x65, %rdx
1454536f6:     	orq	%rax, %rdx
1454536f9:     	je	0x1454537c2 <.text+0x54527c2>
1454536ff:     	movabsq	$0x7461665f6c616573, %rax # imm = 0x7461665F6C616573
145453709:     	xorq	(%rcx), %rax
14545370c:     	movzbl	0x8(%rcx), %edx
145453710:     	xorq	$0x65, %rdx
145453714:     	orq	%rax, %rdx
145453717:     	je	0x14545378f <.text+0x545278f>
145453719:     	movabsq	$0x7269665f6c756f73, %rax # imm = 0x7269665F6C756F73
145453723:     	xorq	(%rcx), %rax
145453726:     	movzbl	0x8(%rcx), %edx
14545372a:     	xorq	$0x65, %rdx
14545372e:     	movss	0x4bfbc6(%rip), %xmm1   # 0x1459132fc
145453736:     	orq	%rax, %rdx
145453739:     	je	0x14545376f <.text+0x545276f>
14545373b:     	movabsq	$0x6c6577746867696c, %rax # imm = 0x6C6577746867696C
145453745:     	xorq	(%rcx), %rax
145453748:     	movzbl	0x8(%rcx), %edx
14545374c:     	xorq	$0x6c, %rdx
145453750:     	orq	%rax, %rdx
145453753:     	je	0x1454537cb <.text+0x54527cb>
145453755:     	movabsq	$0x70726f6d796c6f70, %rax # imm = 0x70726F6D796C6F70
14545375f:     	xorq	(%rcx), %rax
145453762:     	movzbl	0x8(%rcx), %ecx
145453766:     	xorq	$0x68, %rcx
14545376a:     	orq	%rax, %rcx
14545376d:     	jne	0x1454537b8 <.text+0x54527b8>
14545376f:     	movaps	%xmm1, %xmm0
145453772:     	retq
145453773:     	movabsq	$0x5f737265746e7568, %rax # imm = 0x5F737265746E7568
14545377d:     	xorq	(%rcx), %rax
145453780:     	movl	0x8(%rcx), %ecx
145453783:     	xorq	$0x6b72616d, %rcx       # imm = 0x6B72616D
14545378a:     	orq	%rax, %rcx
14545378d:     	jne	0x1454537b8 <.text+0x54527b8>
14545378f:     	movss	0x4bfb5d(%rip), %xmm0   # 0x1459132f4
145453797:     	retq
145453798:     	movabsq	$0x5f666f5f6c6c6163, %rax # imm = 0x5F666F5F6C6C6163
1454537a2:     	xorq	(%rcx), %rax
1454537a5:     	movabsq	$0x656d616c665f666f, %rdx # imm = 0x656D616C665F666F
1454537af:     	xorq	0x5(%rcx), %rdx
1454537b3:     	orq	%rax, %rdx
1454537b6:     	je	0x1454537b9 <.text+0x54527b9>
1454537b8:     	retq
1454537b9:     	movss	0x4f7c17(%rip), %xmm0   # 0x14594b3d8
1454537c1:     	retq
1454537c2:     	movss	0x4c210a(%rip), %xmm0   # 0x1459158d4
1454537ca:     	retq
1454537cb:     	movss	0x4ec00d(%rip), %xmm0   # 0x14593f7e0
1454537d3:     	retq

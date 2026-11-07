
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14550a0a0:     	movss	0x128(%rcx), %xmm1
14550a0a8:     	xorps	%xmm0, %xmm0
14550a0ab:     	ucomiss	%xmm1, %xmm0
14550a0ae:     	jae	0x14550a0f3 <.text+0x55090f3>
14550a0b0:     	subss	0x124(%rcx), %xmm3
14550a0b8:     	divss	%xmm1, %xmm3
14550a0bc:     	maxss	%xmm3, %xmm0
14550a0c0:     	movss	0x3e13b8(%rip), %xmm1   # 0x1458eb480
14550a0c8:     	minss	%xmm0, %xmm1
14550a0cc:     	movsd	0x10c(%rcx), %xmm2
14550a0d4:     	movsd	0x118(%rcx), %xmm3
14550a0dc:     	subps	%xmm2, %xmm3
14550a0df:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
14550a0e3:     	mulps	%xmm3, %xmm0
14550a0e6:     	addps	%xmm2, %xmm0
14550a0e9:     	movb	$0x3, %al
14550a0eb:     	cmpq	$-0x1, 0x40(%rcx)
14550a0f0:     	jne	0x14550a104 <.text+0x5509104>
14550a0f2:     	retq
14550a0f3:     	movsd	0x118(%rcx), %xmm0
14550a0fb:     	movb	$0x3, %al
14550a0fd:     	cmpq	$-0x1, 0x40(%rcx)
14550a102:     	je	0x14550a0f2 <.text+0x55090f2>
14550a104:     	movss	0xf4(%rcx), %xmm1
14550a10c:     	movss	(%rdx), %xmm2
14550a110:     	cmpb	$0x0, 0x60(%rcx)
14550a114:     	je	0x14550a160 <.text+0x5509160>
14550a116:     	movsd	(%r8), %xmm0
14550a11b:     	movss	0x4(%rdx), %xmm3
14550a120:     	unpcklps	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
14550a123:     	subps	%xmm0, %xmm2
14550a126:     	mulps	%xmm2, %xmm2
14550a129:     	movshdup	%xmm2, %xmm0            # xmm0 = xmm2[1,1,3,3]
14550a12d:     	addss	%xmm2, %xmm0
14550a131:     	sqrtss	%xmm0, %xmm0
14550a135:     	ucomiss	0x14a3234(%rip), %xmm0  # 0x1469ad370
14550a13c:     	jbe	0x14550a0f2 <.text+0x55090f2>
14550a13e:     	movb	$0x0, 0x60(%rcx)
14550a142:     	movss	%xmm1, 0xf0(%rcx)
14550a14a:     	movq	$0x0, 0x10(%rcx)
14550a152:     	movq	$0x0, 0x98(%rcx)
14550a15d:     	movb	$0x2, %al
14550a15f:     	retq
14550a160:     	movss	0xf0(%rcx), %xmm3
14550a168:     	movss	0x4(%rdx), %xmm4
14550a16d:     	unpcklps	%xmm4, %xmm2            # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
14550a170:     	movaps	%xmm0, %xmm4
14550a173:     	subps	%xmm2, %xmm4
14550a176:     	mulps	%xmm4, %xmm4
14550a179:     	movshdup	%xmm4, %xmm2            # xmm2 = xmm4[1,1,3,3]
14550a17d:     	addss	%xmm4, %xmm2
14550a181:     	sqrtss	%xmm2, %xmm2
14550a185:     	movss	0x3ec49f(%rip), %xmm4   # 0x1458f662c
14550a18d:     	ucomiss	%xmm2, %xmm4
14550a190:     	jae	0x14550a19a <.text+0x550919a>
14550a192:     	ucomiss	%xmm3, %xmm1
14550a195:     	ja	0x14550a1c9 <.text+0x55091c9>
14550a197:     	xorl	%eax, %eax
14550a199:     	retq
14550a19a:     	ucomiss	%xmm3, %xmm1
14550a19d:     	ja	0x14550a1c9 <.text+0x55091c9>
14550a19f:     	movsd	(%r8), %xmm1
14550a1a4:     	subps	%xmm1, %xmm0
14550a1a7:     	mulps	%xmm0, %xmm0
14550a1aa:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14550a1ae:     	addss	%xmm0, %xmm1
14550a1b2:     	xorps	%xmm0, %xmm0
14550a1b5:     	sqrtss	%xmm1, %xmm0
14550a1b9:     	movss	0x3eeddf(%rip), %xmm1   # 0x1458f8fa0
14550a1c1:     	ucomiss	%xmm0, %xmm1
14550a1c4:     	jae	0x14550a1c9 <.text+0x55091c9>
14550a1c6:     	xorl	%eax, %eax
14550a1c8:     	retq
14550a1c9:     	movb	$0x1, 0x60(%rcx)
14550a1cd:     	movb	$0x1, %al
14550a1cf:     	retq

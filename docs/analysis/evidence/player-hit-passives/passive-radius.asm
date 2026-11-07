
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f96d0:     	subq	$0x38, %rsp
1454f96d4:     	movaps	%xmm6, 0x20(%rsp)
1454f96d9:     	movq	(%rcx), %rax
1454f96dc:     	movss	0x1c(%rcx), %xmm0
1454f96e1:     	mulss	0x44(%rcx), %xmm0
1454f96e6:     	mulss	0x50(%rax), %xmm0
1454f96eb:     	mulss	0x28(%rdx), %xmm0
1454f96f0:     	movss	0x702d1c(%rip), %xmm1   # 0x145bfc414
1454f96f8:     	ucomiss	%xmm0, %xmm1
1454f96fb:     	jae	0x1454f9722 <.text+0x54f8722>
1454f96fd:     	addss	0x14954cb(%rip), %xmm0  # 0x14698ebd0
1454f9705:     	movss	0x3ff6d3(%rip), %xmm6   # 0x1458f8de0
1454f970d:     	divss	%xmm6, %xmm0
1454f9711:     	callq	0x145756f57 <.text+0x5755f57>
1454f9716:     	mulss	%xmm6, %xmm0
1454f971a:     	addss	0x702cf2(%rip), %xmm0   # 0x145bfc414
1454f9722:     	movaps	0x20(%rsp), %xmm6
1454f9727:     	addq	$0x38, %rsp
1454f972b:     	retq

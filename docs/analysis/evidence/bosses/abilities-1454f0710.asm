
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f0710:     	xorl	%eax, %eax
1454f0712:     	cmpl	$0x847, %ecx            # imm = 0x847
1454f0718:     	jle	0x1454f0757 <.text+0x54ef757>
1454f071a:     	cmpl	$0x35f1, %ecx           # imm = 0x35F1
1454f0720:     	jg	0x1454f0785 <.text+0x54ef785>
1454f0722:     	cmpl	$0x18c6, %ecx           # imm = 0x18C6
1454f0728:     	jle	0x1454f07d9 <.text+0x54ef7d9>
1454f072e:     	cmpl	$0x18c7, %ecx           # imm = 0x18C7
1454f0734:     	je	0x1454f07e9 <.text+0x54ef7e9>
1454f073a:     	cmpl	$0x1fba, %ecx           # imm = 0x1FBA
1454f0740:     	je	0x1454f07e9 <.text+0x54ef7e9>
1454f0746:     	cmpl	$0x2b69, %ecx           # imm = 0x2B69
1454f074c:     	je	0x1454f0807 <.text+0x54ef807>
1454f0752:     	jmp	0x1454f07f6 <.text+0x54ef7f6>
1454f0757:     	cmpl	$0x487, %ecx            # imm = 0x487
1454f075d:     	jle	0x1454f07a7 <.text+0x54ef7a7>
1454f075f:     	cmpl	$0x5e5, %ecx            # imm = 0x5E5
1454f0765:     	jle	0x1454f07c7 <.text+0x54ef7c7>
1454f0767:     	cmpl	$0x5e6, %ecx            # imm = 0x5E6
1454f076d:     	je	0x1454f07e9 <.text+0x54ef7e9>
1454f076f:     	cmpl	$0x690, %ecx            # imm = 0x690
1454f0775:     	je	0x1454f07e9 <.text+0x54ef7e9>
1454f0777:     	cmpl	$0x79d, %ecx            # imm = 0x79D
1454f077d:     	je	0x1454f0807 <.text+0x54ef807>
1454f0783:     	jmp	0x1454f07f6 <.text+0x54ef7f6>
1454f0785:     	cmpl	$0x4211, %ecx           # imm = 0x4211
1454f078b:     	jle	0x1454f07f7 <.text+0x54ef7f7>
1454f078d:     	cmpl	$0x4212, %ecx           # imm = 0x4212
1454f0793:     	je	0x1454f07e9 <.text+0x54ef7e9>
1454f0795:     	cmpl	$0x5045, %ecx           # imm = 0x5045
1454f079b:     	je	0x1454f07e9 <.text+0x54ef7e9>
1454f079d:     	cmpl	$0x67cd, %ecx           # imm = 0x67CD
1454f07a3:     	je	0x1454f07e9 <.text+0x54ef7e9>
1454f07a5:     	jmp	0x1454f07f6 <.text+0x54ef7f6>
1454f07a7:     	cmpl	$0x79, %ecx
1454f07aa:     	jg	0x1454f07b8 <.text+0x54ef7b8>
1454f07ac:     	cmpl	$0xa, %ecx
1454f07af:     	je	0x1454f07e9 <.text+0x54ef7e9>
1454f07b1:     	cmpl	$0x78, %ecx
1454f07b4:     	je	0x1454f0807 <.text+0x54ef807>
1454f07b6:     	jmp	0x1454f07f6 <.text+0x54ef7f6>
1454f07b8:     	cmpl	$0x7a, %ecx
1454f07bb:     	je	0x1454f0807 <.text+0x54ef807>
1454f07bd:     	cmpl	$0x30b, %ecx            # imm = 0x30B
1454f07c3:     	je	0x1454f0815 <.text+0x54ef815>
1454f07c5:     	jmp	0x1454f07f6 <.text+0x54ef7f6>
1454f07c7:     	cmpl	$0x488, %ecx            # imm = 0x488
1454f07cd:     	je	0x1454f0807 <.text+0x54ef807>
1454f07cf:     	cmpl	$0x5a9, %ecx            # imm = 0x5A9
1454f07d5:     	je	0x1454f0807 <.text+0x54ef807>
1454f07d7:     	jmp	0x1454f07f6 <.text+0x54ef7f6>
1454f07d9:     	cmpl	$0x848, %ecx            # imm = 0x848
1454f07df:     	je	0x1454f0815 <.text+0x54ef815>
1454f07e1:     	cmpl	$0x166c, %ecx           # imm = 0x166C
1454f07e7:     	jne	0x1454f07f6 <.text+0x54ef7f6>
1454f07e9:     	movl	$0x1, %eax
1454f07ee:     	movss	0x40860a(%rip), %xmm0   # 0x1458f8e00
1454f07f6:     	retq
1454f07f7:     	cmpl	$0x35f2, %ecx           # imm = 0x35F2
1454f07fd:     	je	0x1454f0807 <.text+0x54ef807>
1454f07ff:     	cmpl	$0x3b85, %ecx           # imm = 0x3B85
1454f0805:     	jne	0x1454f07f6 <.text+0x54ef7f6>
1454f0807:     	movl	$0x1, %eax
1454f080c:     	movss	0x4085cc(%rip), %xmm0   # 0x1458f8de0
1454f0814:     	retq
1454f0815:     	movl	$0x1, %eax
1454f081a:     	movss	0x4085c2(%rip), %xmm0   # 0x1458f8de4
1454f0822:     	retq

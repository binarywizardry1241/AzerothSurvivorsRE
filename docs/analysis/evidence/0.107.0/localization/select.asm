
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458be970:     	cmpq	$0x2, %rdx
1458be974:     	jne	0x1458bea21 <.text+0x58bda21>
1458be97a:     	cmpw	$0x6e65, (%rcx)         # imm = 0x6E65
1458be97f:     	je	0x1458bea21 <.text+0x58bda21>
1458be985:     	cmpw	$0x6c70, (%rcx)         # imm = 0x6C70
1458be98a:     	je	0x1458bea2b <.text+0x58bda2b>
1458be990:     	cmpw	$0x7363, (%rcx)         # imm = 0x7363
1458be995:     	je	0x1458bea38 <.text+0x58bda38>
1458be99b:     	cmpw	$0x6564, (%rcx)         # imm = 0x6564
1458be9a0:     	je	0x1458bea45 <.text+0x58bda45>
1458be9a6:     	cmpw	$0x7470, (%rcx)         # imm = 0x7470
1458be9ab:     	je	0x1458bea52 <.text+0x58bda52>
1458be9b1:     	cmpw	$0x7365, (%rcx)         # imm = 0x7365
1458be9b6:     	je	0x1458bea5f <.text+0x58bda5f>
1458be9bc:     	cmpw	$0x7266, (%rcx)         # imm = 0x7266
1458be9c1:     	je	0x1458bea6c <.text+0x58bda6c>
1458be9c7:     	cmpw	$0x6f72, (%rcx)         # imm = 0x6F72
1458be9cc:     	je	0x1458bea79 <.text+0x58bda79>
1458be9d2:     	cmpw	$0x7274, (%rcx)         # imm = 0x7274
1458be9d7:     	je	0x1458bea86 <.text+0x58bda86>
1458be9dd:     	cmpw	$0x7572, (%rcx)         # imm = 0x7572
1458be9e2:     	je	0x1458bea93 <.text+0x58bda93>
1458be9e8:     	cmpw	$0x6b75, (%rcx)         # imm = 0x6B75
1458be9ed:     	je	0x1458beaa0 <.text+0x58bdaa0>
1458be9f3:     	cmpw	$0x687a, (%rcx)         # imm = 0x687A
1458be9f8:     	je	0x1458beaad <.text+0x58bdaad>
1458be9fe:     	cmpw	$0x616a, (%rcx)         # imm = 0x616A
1458bea03:     	je	0x1458beaba <.text+0x58bdaba>
1458bea09:     	xorl	%edx, %edx
1458bea0b:     	cmpw	$0x6f6b, (%rcx)         # imm = 0x6F6B
1458bea10:     	movl	$0xd, %eax
1458bea15:     	cmovneq	%rdx, %rax
1458bea19:     	movq	%rax, 0x27906b0(%rip)   # 0x14804f0d0
1458bea20:     	retq
1458bea21:     	xorl	%eax, %eax
1458bea23:     	movq	%rax, 0x27906a6(%rip)   # 0x14804f0d0
1458bea2a:     	retq
1458bea2b:     	movl	$0x1, %eax
1458bea30:     	movq	%rax, 0x2790699(%rip)   # 0x14804f0d0
1458bea37:     	retq
1458bea38:     	movl	$0x2, %eax
1458bea3d:     	movq	%rax, 0x279068c(%rip)   # 0x14804f0d0
1458bea44:     	retq
1458bea45:     	movl	$0x3, %eax
1458bea4a:     	movq	%rax, 0x279067f(%rip)   # 0x14804f0d0
1458bea51:     	retq
1458bea52:     	movl	$0x4, %eax
1458bea57:     	movq	%rax, 0x2790672(%rip)   # 0x14804f0d0
1458bea5e:     	retq
1458bea5f:     	movl	$0x5, %eax
1458bea64:     	movq	%rax, 0x2790665(%rip)   # 0x14804f0d0
1458bea6b:     	retq
1458bea6c:     	movl	$0x6, %eax
1458bea71:     	movq	%rax, 0x2790658(%rip)   # 0x14804f0d0
1458bea78:     	retq
1458bea79:     	movl	$0x7, %eax
1458bea7e:     	movq	%rax, 0x279064b(%rip)   # 0x14804f0d0
1458bea85:     	retq
1458bea86:     	movl	$0x8, %eax
1458bea8b:     	movq	%rax, 0x279063e(%rip)   # 0x14804f0d0
1458bea92:     	retq
1458bea93:     	movl	$0x9, %eax
1458bea98:     	movq	%rax, 0x2790631(%rip)   # 0x14804f0d0
1458bea9f:     	retq
1458beaa0:     	movl	$0xa, %eax
1458beaa5:     	movq	%rax, 0x2790624(%rip)   # 0x14804f0d0
1458beaac:     	retq
1458beaad:     	movl	$0xb, %eax
1458beab2:     	movq	%rax, 0x2790617(%rip)   # 0x14804f0d0
1458beab9:     	retq
1458beaba:     	movl	$0xc, %eax
1458beabf:     	movq	%rax, 0x279060a(%rip)   # 0x14804f0d0
1458beac6:     	retq

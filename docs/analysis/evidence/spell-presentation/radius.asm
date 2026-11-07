
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459614e0:     	xorl	%eax, %eax
1459614e2:     	cmpl	$0x847, %ecx            # imm = 0x847
1459614e8:     	jle	0x145961527 <.text+0x5960527>
1459614ea:     	cmpl	$0x35f1, %ecx           # imm = 0x35F1
1459614f0:     	jg	0x145961555 <.text+0x5960555>
1459614f2:     	cmpl	$0x18c6, %ecx           # imm = 0x18C6
1459614f8:     	jle	0x1459615a9 <.text+0x59605a9>
1459614fe:     	cmpl	$0x18c7, %ecx           # imm = 0x18C7
145961504:     	je	0x1459615b9 <.text+0x59605b9>
14596150a:     	cmpl	$0x1fba, %ecx           # imm = 0x1FBA
145961510:     	je	0x1459615b9 <.text+0x59605b9>
145961516:     	cmpl	$0x2b69, %ecx           # imm = 0x2B69
14596151c:     	je	0x1459615d7 <.text+0x59605d7>
145961522:     	jmp	0x1459615c6 <.text+0x59605c6>
145961527:     	cmpl	$0x487, %ecx            # imm = 0x487
14596152d:     	jle	0x145961577 <.text+0x5960577>
14596152f:     	cmpl	$0x5e5, %ecx            # imm = 0x5E5
145961535:     	jle	0x145961597 <.text+0x5960597>
145961537:     	cmpl	$0x5e6, %ecx            # imm = 0x5E6
14596153d:     	je	0x1459615b9 <.text+0x59605b9>
14596153f:     	cmpl	$0x690, %ecx            # imm = 0x690
145961545:     	je	0x1459615b9 <.text+0x59605b9>
145961547:     	cmpl	$0x79d, %ecx            # imm = 0x79D
14596154d:     	je	0x1459615d7 <.text+0x59605d7>
145961553:     	jmp	0x1459615c6 <.text+0x59605c6>
145961555:     	cmpl	$0x4211, %ecx           # imm = 0x4211
14596155b:     	jle	0x1459615c7 <.text+0x59605c7>
14596155d:     	cmpl	$0x4212, %ecx           # imm = 0x4212
145961563:     	je	0x1459615b9 <.text+0x59605b9>
145961565:     	cmpl	$0x5045, %ecx           # imm = 0x5045
14596156b:     	je	0x1459615b9 <.text+0x59605b9>
14596156d:     	cmpl	$0x67cd, %ecx           # imm = 0x67CD
145961573:     	je	0x1459615b9 <.text+0x59605b9>
145961575:     	jmp	0x1459615c6 <.text+0x59605c6>
145961577:     	cmpl	$0x79, %ecx
14596157a:     	jg	0x145961588 <.text+0x5960588>
14596157c:     	cmpl	$0xa, %ecx
14596157f:     	je	0x1459615b9 <.text+0x59605b9>
145961581:     	cmpl	$0x78, %ecx
145961584:     	je	0x1459615d7 <.text+0x59605d7>
145961586:     	jmp	0x1459615c6 <.text+0x59605c6>
145961588:     	cmpl	$0x7a, %ecx
14596158b:     	je	0x1459615d7 <.text+0x59605d7>
14596158d:     	cmpl	$0x30b, %ecx            # imm = 0x30B
145961593:     	je	0x1459615e5 <.text+0x59605e5>
145961595:     	jmp	0x1459615c6 <.text+0x59605c6>
145961597:     	cmpl	$0x488, %ecx            # imm = 0x488
14596159d:     	je	0x1459615d7 <.text+0x59605d7>
14596159f:     	cmpl	$0x5a9, %ecx            # imm = 0x5A9
1459615a5:     	je	0x1459615d7 <.text+0x59605d7>
1459615a7:     	jmp	0x1459615c6 <.text+0x59605c6>
1459615a9:     	cmpl	$0x848, %ecx            # imm = 0x848
1459615af:     	je	0x1459615e5 <.text+0x59605e5>
1459615b1:     	cmpl	$0x166c, %ecx           # imm = 0x166C
1459615b7:     	jne	0x1459615c6 <.text+0x59605c6>
1459615b9:     	movl	$0x1, %eax
1459615be:     	movss	0x40bffa(%rip), %xmm0   # 0x145d6d5c0
1459615c6:     	retq
1459615c7:     	cmpl	$0x35f2, %ecx           # imm = 0x35F2
1459615cd:     	je	0x1459615d7 <.text+0x59605d7>
1459615cf:     	cmpl	$0x3b85, %ecx           # imm = 0x3B85
1459615d5:     	jne	0x1459615c6 <.text+0x59605c6>
1459615d7:     	movl	$0x1, %eax
1459615dc:     	movss	0x40c06c(%rip), %xmm0   # 0x145d6d650
1459615e4:     	retq
1459615e5:     	movl	$0x1, %eax
1459615ea:     	movss	0x41281e(%rip), %xmm0   # 0x145d73e10
1459615f2:     	retq

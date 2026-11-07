
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458753b0:     	addq	$-0x2, %rdx
1458753b4:     	cmpq	$0x6, %rdx
1458753b8:     	ja	0x1458754b8 <.text+0x58744b8>
1458753be:     	leaq	0x133dc93(%rip), %rax   # 0x146bb3058
1458753c5:     	movslq	(%rax,%rdx,4), %rdx
1458753c9:     	addq	%rax, %rdx
1458753cc:     	jmpq	*%rdx
1458753ce:     	cmpw	$0x6261, (%rcx)         # imm = 0x6261
1458753d3:     	je	0x1458754bb <.text+0x58744bb>
1458753d9:     	cmpw	$0x6d73, (%rcx)         # imm = 0x6D73
1458753de:     	je	0x1458754cd <.text+0x58744cd>
1458753e4:     	cmpw	$0x7661, (%rcx)         # imm = 0x7661
1458753e9:     	je	0x1458754d3 <.text+0x58744d3>
1458753ef:     	cmpw	$0x7161, (%rcx)         # imm = 0x7161
1458753f4:     	jne	0x1458754b8 <.text+0x58744b8>
1458753fa:     	movl	$0xa, %eax
1458753ff:     	retq
145875400:     	movl	$0x79776c65, %eax       # imm = 0x79776C65
145875405:     	xorl	(%rcx), %eax
145875407:     	movzwl	0x4(%rcx), %edx
14587540b:     	xorl	$0x6e6e, %edx           # imm = 0x6E6E
145875411:     	orl	%eax, %edx
145875413:     	je	0x1458754b8 <.text+0x58744b8>
145875419:     	movl	$0x6f676e75, %eax       # imm = 0x6F676E75
14587541e:     	xorl	(%rcx), %eax
145875420:     	movzwl	0x4(%rcx), %ecx
145875424:     	xorl	$0x6f72, %ecx           # imm = 0x6F72
14587542a:     	orl	%eax, %ecx
14587542c:     	jne	0x1458754b8 <.text+0x58744b8>
145875432:     	movl	$0x3, %eax
145875437:     	retq
145875438:     	xorl	%edx, %edx
14587543a:     	cmpl	$0x7878616e, (%rcx)     # imm = 0x7878616E
145875440:     	movl	$0xb, %eax
145875445:     	cmovneq	%rdx, %rax
145875449:     	retq
14587544a:     	movl	$0x6e657261, %eax       # imm = 0x6E657261
14587544f:     	xorl	(%rcx), %eax
145875451:     	movzbl	0x4(%rcx), %ecx
145875455:     	xorl	$0x61, %ecx
145875458:     	orl	%eax, %ecx
14587545a:     	jne	0x1458754b8 <.text+0x58744b8>
14587545c:     	movl	$0x6, %eax
145875461:     	retq
145875462:     	movzwl	(%rcx), %eax
145875465:     	xorl	$0x7377, %eax           # imm = 0x7377
14587546a:     	movzbl	0x2(%rcx), %edx
14587546e:     	xorl	$0x67, %edx
145875471:     	orw	%ax, %dx
145875474:     	je	0x1458754c1 <.text+0x58744c1>
145875476:     	movzwl	(%rcx), %eax
145875479:     	xorl	$0x7262, %eax           # imm = 0x7262
14587547e:     	movzbl	0x2(%rcx), %ecx
145875482:     	xorl	$0x6d, %ecx
145875485:     	orw	%ax, %cx
145875488:     	jne	0x1458754b8 <.text+0x58744b8>
14587548a:     	movl	$0x9, %eax
14587548f:     	retq
145875490:     	movl	$0x61726566, %eax       # imm = 0x61726566
145875495:     	xorl	(%rcx), %eax
145875497:     	movl	$0x73616c61, %edx       # imm = 0x73616C61
14587549c:     	xorl	0x3(%rcx), %edx
14587549f:     	orl	%eax, %edx
1458754a1:     	jne	0x1458754b8 <.text+0x58744b8>
1458754a3:     	movl	$0x5, %eax
1458754a8:     	retq
1458754a9:     	movabsq	$0x646f6f776b737564, %rax # imm = 0x646F6F776B737564
1458754b3:     	cmpq	%rax, (%rcx)
1458754b6:     	je	0x1458754c7 <.text+0x58744c7>
1458754b8:     	xorl	%eax, %eax
1458754ba:     	retq
1458754bb:     	movl	$0x4, %eax
1458754c0:     	retq
1458754c1:     	movl	$0x2, %eax
1458754c6:     	retq
1458754c7:     	movl	$0x1, %eax
1458754cc:     	retq
1458754cd:     	movl	$0x7, %eax
1458754d2:     	retq
1458754d3:     	movl	$0x8, %eax
1458754d8:     	retq

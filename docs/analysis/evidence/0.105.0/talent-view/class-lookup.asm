
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145875700:     	addb	$-0x2, %cl
145875703:     	cmpb	$0x9, %cl
145875706:     	ja	0x145875717 <.text+0x5874717>
145875708:     	movzbl	%cl, %eax
14587570b:     	leaq	0x133d81e(%rip), %rcx   # 0x146bb2f30
145875712:     	movq	(%rcx,%rax,8), %rax
145875716:     	retq
145875717:     	leaq	0x133608a(%rip), %rax   # 0x146bab7a8
14587571e:     	retq

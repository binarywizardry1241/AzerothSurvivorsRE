
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454207d0:     	addb	$-0x2, %cl
1454207d3:     	cmpb	$0x9, %cl
1454207d6:     	ja	0x1454207e7 <.text+0x541f7e7>
1454207d8:     	movzbl	%cl, %eax
1454207db:     	leaq	0x1319936(%rip), %rcx   # 0x14673a118
1454207e2:     	movq	(%rcx,%rax,8), %rax
1454207e6:     	retq
1454207e7:     	leaq	0x131505a(%rip), %rax   # 0x146735848
1454207ee:     	retq

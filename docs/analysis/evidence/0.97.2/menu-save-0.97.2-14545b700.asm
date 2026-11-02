
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545b700:     	decb	%cl
14545b702:     	cmpb	$0xa, %cl
14545b705:     	ja	0x14545b716 <.text+0x545a716>
14545b707:     	movzbl	%cl, %eax
14545b70a:     	leaq	0x152fcef(%rip), %rcx   # 0x14698b400
14545b711:     	movq	(%rcx,%rax,8), %rax
14545b715:     	retq
14545b716:     	xorl	%eax, %eax
14545b718:     	retq

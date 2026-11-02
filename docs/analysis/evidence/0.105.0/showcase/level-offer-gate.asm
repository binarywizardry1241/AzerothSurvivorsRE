
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14591ce03:     	cmpb	$0x1, 0xa73(%rsi)
14591ce0a:     	jne	0x14591ce34 <.text+0x591be34>
14591ce0c:     	cmpb	$0x0, 0xa6c(%rsi)
14591ce13:     	jne	0x14591ce34 <.text+0x591be34>
14591ce15:     	cmpb	$0x1, 0xa68(%rsi)
14591ce1c:     	jne	0x14591ce27 <.text+0x591be27>
14591ce1e:     	cmpb	$0x0, 0xa69(%rsi)
14591ce25:     	je	0x14591ce34 <.text+0x591be34>
14591ce27:     	movq	%rsi, %rcx
14591ce2a:     	xorl	%edx, %edx
14591ce2c:     	movb	$0x1, %r8b
14591ce2f:     	callq	0x145951c10 <.text+0x5950c10>

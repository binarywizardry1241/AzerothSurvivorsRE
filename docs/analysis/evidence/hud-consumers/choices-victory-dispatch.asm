
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005c388:     	movl	(%rax), %ecx
14005c38a:     	movl	$0x696f6863, %edx       # imm = 0x696F6863
14005c38f:     	xorl	%edx, %ecx
14005c391:     	movl	0x3(%rax), %edx
14005c394:     	movl	$0x73656369, %r8d       # imm = 0x73656369
14005c39a:     	xorl	%r8d, %edx
14005c39d:     	orl	%ecx, %edx
14005c39f:     	je	0x14005c90b <.text+0x5b90b>
14005c3a5:     	movl	(%rax), %ecx
14005c3a7:     	movl	$0x74636976, %edx       # imm = 0x74636976
14005c3ac:     	xorl	%edx, %ecx
14005c3ae:     	movl	0x3(%rax), %eax
14005c3b1:     	movl	$0x79726f74, %edx       # imm = 0x79726F74
14005c3b6:     	xorl	%edx, %eax
14005c3b8:     	orl	%ecx, %eax
14005c3ba:     	jne	0x14005d500 <.text+0x5c500>
14005c3c0:     	movq	0x258(%rbp), %rax
14005c3c7:     	movb	$0x0, 0xea(%rax)
14005c3ce:     	movq	0x248(%rbp), %rcx
14005c3d5:     	movl	0x274(%rbp), %edx
14005c3db:     	movl	%edx, (%rcx)
14005c3dd:     	cmpb	$-0x1, 0x80(%rax)
14005c3e4:     	je	0x14005c3f3 <.text+0x5b3f3>
14005c3e6:     	movq	0x220(%rbp), %rcx
14005c3ed:     	callq	0x14003c190 <.text+0x3b190>
14005c3f2:     	nop
14005c3f3:     	movq	0x258(%rbp), %rax
14005c3fa:     	movb	$-0x1, 0x80(%rax)
14005c401:     	movq	0x248(%rbp), %rcx
14005c408:     	movl	0x274(%rbp), %edx
14005c40e:     	movl	%edx, (%rcx)
14005c410:     	incl	0xe0(%rax)
14005c416:     	movl	%edx, (%rcx)

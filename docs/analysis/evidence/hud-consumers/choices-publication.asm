
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005c90b:     	movq	0x248(%rbp), %rax
14005c912:     	movl	0x274(%rbp), %ecx
14005c918:     	movl	%ecx, (%rax)
14005c91a:     	movq	0x220(%rbp), %rax
14005c921:     	cmpb	$-0x1, (%rax)
14005c924:     	je	0x14005c933 <.text+0x5b933>
14005c926:     	movq	0x220(%rbp), %rcx
14005c92d:     	callq	0x14003c190 <.text+0x3b190>
14005c932:     	nop
14005c933:     	movdqa	0x170(%rbp), %xmm0
14005c93b:     	movaps	0x180(%rbp), %xmm1
14005c942:     	movq	0x220(%rbp), %rax
14005c949:     	movups	%xmm1, 0x10(%rax)
14005c94d:     	movdqu	%xmm0, (%rax)
14005c951:     	movq	0x248(%rbp), %rax
14005c958:     	movl	0x274(%rbp), %ecx
14005c95e:     	movl	%ecx, (%rax)
14005c960:     	movq	0x258(%rbp), %rax
14005c967:     	incl	0xe0(%rax)

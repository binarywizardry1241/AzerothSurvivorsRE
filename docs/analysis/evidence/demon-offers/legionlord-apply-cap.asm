
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14595db8f:     	movl	0x3f0(%r12), %eax
14595db97:     	incl	%eax
14595db99:     	cmpq	$0x1d, %r14
14595db9d:     	jne	0x14595dbd4 <.text+0x595cbd4>
14595db9f:     	movdqu	0xd(%rbx), %xmm0
14595dba4:     	pcmpeqb	0x12554f4(%rip), %xmm0  # 0x146bb30a0
14595dbac:     	movdqu	(%rbx), %xmm1
14595dbb0:     	pcmpeqb	0x12554f8(%rip), %xmm1  # 0x146bb30b0
14595dbb8:     	pand	%xmm0, %xmm1
14595dbbc:     	cmpl	$0xa, %eax
14595dbbf:     	movl	$0xa, %ecx
14595dbc4:     	cmovbl	%eax, %ecx
14595dbc7:     	pmovmskb	%xmm1, %edx
14595dbcb:     	cmpl	$0xffff, %edx           # imm = 0xFFFF
14595dbd1:     	cmovel	%ecx, %eax
14595dbd4:     	movl	%eax, 0x3f0(%r12)


AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145959d5d:     	cmpq	$-0x1, 0x388(%rsi)
145959d65:     	je	0x145959df3 <.text+0x5958df3>
145959d6b:     	cmpq	$0x1d, 0x398(%rsi)
145959d73:     	jne	0x145959dad <.text+0x5958dad>
145959d75:     	movq	0x390(%rsi), %rax
145959d7c:     	movdqu	(%rax), %xmm0
145959d80:     	movdqu	0xd(%rax), %xmm1
145959d85:     	pcmpeqb	0x1259313(%rip), %xmm1  # 0x146bb30a0
145959d8d:     	pcmpeqb	0x125931b(%rip), %xmm0  # 0x146bb30b0
145959d95:     	pand	%xmm1, %xmm0
145959d99:     	pmovmskb	%xmm0, %eax
145959d9d:     	cmpl	$0xffff, %eax           # imm = 0xFFFF
145959da2:     	jne	0x145959dad <.text+0x5958dad>
145959da4:     	cmpl	$0x9, 0x3f0(%rsi)
145959dab:     	ja	0x145959df3 <.text+0x5958df3>

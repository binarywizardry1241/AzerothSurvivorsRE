
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458a720e:     	leaq	0x1310653(%rip), %rdx   # 0x146bb7868
1458a7215:     	leaq	0xba8(%rbp), %rdi
1458a721c:     	movl	$0x12, %r8d
1458a7222:     	movq	%rdi, %rcx
1458a7225:     	callq	0x145b8d010 <.text+0x5b8c010>
1458a722a:     	nop
1458a722b:     	movq	0xba8(%rbp), %rdx
1458a7232:     	cmpq	$-0x2, %rdx
1458a7236:     	jne	0x1458a7258 <.text+0x58a6258>
1458a7238:     	cmpq	$0x1, 0xbc0(%rbp)
1458a7240:     	jne	0x1458a747e <.text+0x58a647e>
1458a7246:     	movq	0xbb8(%rbp), %rax
1458a724d:     	cmpb	$0x31, (%rax)
1458a7250:     	sete	%al
1458a7253:     	jmp	0x1458a7480 <.text+0x58a6480>
1458a7258:     	movb	$0x0, 0xa24(%rbp)
1458a725f:     	cmpq	$-0x1, %rdx
1458a7263:     	je	0x1458a727a <.text+0x58a627a>
1458a7265:     	testq	%rdx, %rdx
1458a7268:     	je	0x1458a727a <.text+0x58a627a>
1458a726a:     	movq	0x8(%rdi), %rcx
1458a726e:     	movl	$0x1, %r8d
1458a7274:     	callq	0x1400021d0 <.text+0x11d0>
1458a7279:     	nop

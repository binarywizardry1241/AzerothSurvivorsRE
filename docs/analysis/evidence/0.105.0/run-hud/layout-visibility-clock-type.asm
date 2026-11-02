
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402812c0:     	pushq	%rbp
1402812c1:     	pushq	%r14
1402812c3:     	pushq	%rsi
1402812c4:     	pushq	%rdi
1402812c5:     	pushq	%rbx
1402812c6:     	subq	$0xc0, %rsp
1402812cd:     	leaq	0x80(%rsp), %rbp
1402812d5:     	movaps	%xmm6, 0x30(%rbp)
1402812d9:     	movq	$-0x2, 0x28(%rbp)
1402812e1:     	movq	%rdx, %rdi
1402812e4:     	movq	%rcx, %rsi
1402812e7:     	movq	0x18(%rdx), %rcx
1402812eb:     	cmpq	$0x0, 0x30(%rcx)
1402812f0:     	je	0x14028139b <.text+0x28039b>
1402812f6:     	movabsq	$0x4f191e8a8b9a07a0, %rdx # imm = 0x4F191E8A8B9A07A0
140281300:     	movq	0x18(%rcx), %rax
140281304:     	movq	0x20(%rcx), %r8
140281308:     	xorl	%r9d, %r9d
14028130b:     	movdqa	0x5b3e32d(%rip), %xmm0  # 0x145dbf640
140281313:     	pcmpeqd	%xmm1, %xmm1
140281317:     	movdqa	0x5b3e331(%rip), %xmm2  # 0x145dbf650

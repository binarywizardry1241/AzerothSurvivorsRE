
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454988e5:     	movl	0x654(%r14), %esi
1454988ec:     	cmpl	$0x2, %esi
1454988ef:     	jne	0x14549898b <.text+0x549798b>
1454988f5:     	callq	0x140002200 <.text+0x1200>
1454988fa:     	movl	$0x1, %ecx
1454988ff:     	movl	$0x1, %edx
145498904:     	callq	0x1400021c0 <.text+0x11c0>
145498909:     	testq	%rax, %rax
14549890c:     	je	0x14549937a <.text+0x549837a>
145498912:     	movb	$0x7b, (%rax)
145498915:     	movq	$0x1, 0x140(%rbp)
145498920:     	movq	%rax, 0x148(%rbp)
145498927:     	movq	$0x1, 0x150(%rbp)
145498932:     	movb	$0x1, 0x158(%rbp)
145498939:     	movq	$0x1, 0x20(%rsp)
145498942:     	leaq	0x140(%rbp), %rcx
145498949:     	movl	$0x1, %edx
14549894e:     	movl	$0x1, %r8d
145498954:     	movl	$0x1, %r9d
14549895a:     	callq	0x145757d40 <.text+0x5756d40>
14549895f:     	nop
145498960:     	movq	0x148(%rbp), %rax
145498967:     	movb	$0x7d, 0x1(%rax)
14549896b:     	movupd	0x140(%rbp), %xmm0
145498973:     	movapd	%xmm0, 0x80(%rbp)
14549897b:     	movq	$0x2, 0x90(%rbp)
145498986:     	jmp	0x145498bfb <.text+0x5497bfb>
14549898b:     	movss	0x650(%r14), %xmm9
145498994:     	movss	0x658(%r14), %xmm6

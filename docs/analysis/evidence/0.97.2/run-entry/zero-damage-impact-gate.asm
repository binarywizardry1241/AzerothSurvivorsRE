
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a3af0:     	movss	0xe4(%rbp), %xmm7
1454a3af8:     	ucomiss	%xmm8, %xmm7
1454a3afc:     	jbe	0x1454a3b37 <.text+0x54a2b37>
1454a3afe:     	movq	0xc0(%rbp), %rdx
1454a3b05:     	movl	0xe0(%rbp), %r9d
1454a3b0c:     	movzbl	0xeb(%rbp), %eax
1454a3b13:     	movzbl	0xe8(%rbp), %ecx
1454a3b1a:     	movb	%cl, 0x28(%rsp)
1454a3b1e:     	movb	%al, 0x20(%rsp)
1454a3b22:     	movb	$0x0, 0x30(%rsp)
1454a3b27:     	movq	0x368(%rbp), %rcx
1454a3b2e:     	movaps	%xmm7, %xmm2
1454a3b31:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454a3b36:     	nop

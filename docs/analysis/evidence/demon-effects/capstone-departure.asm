
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145904e24:     	movss	0x9ec(%r13), %xmm0
145904e2d:     	addq	%rcx, %rax
145904e30:     	movq	0x70(%r13), %rcx
145904e34:     	movss	(%rcx,%r15,4), %xmm1
145904e3a:     	addss	0x14(%rax), %xmm0
145904e3f:     	movaps	%xmm1, %xmm2
145904e42:     	maxss	%xmm0, %xmm2
145904e46:     	movaps	%xmm2, %xmm0
145904e49:     	cmpunordss	%xmm2, %xmm0
145904e4e:     	movaps	%xmm0, %xmm3
145904e51:     	andnps	%xmm2, %xmm3
145904e54:     	andps	%xmm1, %xmm0
145904e57:     	orps	%xmm3, %xmm0
145904e5a:     	movss	%xmm0, (%rcx,%r15,4)


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cbc77:     	movaps	%xmm11, %xmm0
1454cbc7b:     	subss	0x98(%rdi), %xmm0
1454cbc83:     	movss	0xfc(%rdi), %xmm2
1454cbc8b:     	movaps	%xmm6, %xmm1
1454cbc8e:     	cmpltss	0x9c(%rdi), %xmm1
1454cbc97:     	mulss	%xmm2, %xmm0
1454cbc9b:     	andps	%xmm1, %xmm0
1454cbc9e:     	andnps	%xmm2, %xmm1
1454cbca1:     	orps	%xmm0, %xmm1
1454cbca4:     	movaps	%xmm1, %xmm0
1454cbca7:     	mulss	0x52b825(%rip), %xmm0   # 0x1459f74d4
1454cbcaf:     	testb	$0x1, 0x38(%rdi)
1454cbcb3:     	jne	0x1454cbcb8 <.text+0x54cacb8>
1454cbcb5:     	movaps	%xmm1, %xmm0
1454cbcb8:     	cmpq	$-0x1, 0x18(%rdi)
1454cbcbd:     	jne	0x1454cbcc2 <.text+0x54cacc2>
1454cbcbf:     	movaps	%xmm1, %xmm0

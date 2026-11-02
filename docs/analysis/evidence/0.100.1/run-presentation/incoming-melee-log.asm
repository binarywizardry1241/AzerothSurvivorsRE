
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454de373:     	movq	%r13, %rcx
1454de376:     	movaps	%xmm7, %xmm1
1454de379:     	movq	%r14, %r8
1454de37c:     	movb	$0x1, %r9b
1454de37f:     	callq	0x1454a0910 <.text+0x549f910>
1454de384:     	nop
1454de385:     	cmpq	%rdi, %r12
1454de388:     	je	0x1454de405 <.text+0x54dd405>
1454de38a:     	movss	(%r12), %xmm7
1454de390:     	movaps	%xmm12, %xmm0
1454de394:     	subss	0x490(%r13), %xmm0
1454de39d:     	mulss	%xmm7, %xmm0
1454de3a1:     	maxss	%xmm12, %xmm0
1454de3a6:     	cvttss2si	%xmm0, %rax
1454de3ab:     	ucomiss	%xmm8, %xmm0
1454de3af:     	cmovbl	%r15d, %eax
1454de3b3:     	ucomiss	%xmm13, %xmm0
1454de3b7:     	movl	$0xffffffff, %r9d       # imm = 0xFFFFFFFF
1454de3bd:     	ja	0x1454de3c2 <.text+0x54dd3c2>
1454de3bf:     	movl	%eax, %r9d
1454de3c2:     	movq	0x8(%r12), %r14
1454de3c7:     	movq	0x3e8(%r13), %r8
1454de3ce:     	movb	$0x0, 0x20(%rsp)
1454de3d3:     	movq	%rbx, %rcx
1454de3d6:     	movq	%r14, %rdx
1454de3d9:     	callq	0x14545c690 <.text+0x545b690>
1454de3de:     	nop
1454de3df:     	movq	0x560(%r13), %rsi
1454de3e6:     	cmpq	0x550(%r13), %rsi
1454de3ed:     	jne	0x1454de340 <.text+0x54dd340>
1454de3f3:     	movq	0x290(%rbp), %rcx
1454de3fa:     	callq	0x145774710 <.text+0x5773710>
1454de3ff:     	nop
1454de400:     	jmp	0x1454de340 <.text+0x54dd340>

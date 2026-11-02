
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145950159:     	movss	0x478(%rdi), %xmm1
145950161:     	movss	0x47c(%rdi), %xmm6
145950169:     	movq	0xd0(%rdi), %rax
145950170:     	imulq	$0x78, %rsi, %r13
145950174:     	movq	0x18(%rax,%r13), %rcx
145950179:     	movss	0x44(%r14), %xmm0
14595017f:     	movzbl	0x75(%r14), %r8d
145950184:     	addb	$-0x2, %r8b
145950188:     	cmpb	$0x6, %r8b
14595018c:     	ja	0x1459501a1 <.text+0x594f1a1>
14595018e:     	movzbl	%r8b, %r8d
145950192:     	leaq	0x152afdb(%rip), %r9    # 0x146e7b174
145950199:     	movss	(%r9,%r8,4), %xmm2
14595019f:     	jmp	0x1459501a9 <.text+0x594f1a9>
1459501a1:     	movss	0x41d1c3(%rip), %xmm2   # 0x145d6d36c
1459501a9:     	movl	0x4ac(%rdi), %r11d
1459501b0:     	addq	%r13, %rax
1459501b3:     	mulss	%xmm1, %xmm10
1459501b8:     	xorps	%xmm7, %xmm7
1459501bb:     	xorps	%xmm1, %xmm1
1459501be:     	cmpltss	%xmm0, %xmm1
1459501c3:     	andps	%xmm10, %xmm1
1459501c7:     	mulss	0x423b71(%rip), %xmm0   # 0x145d73d40
1459501cf:     	mulss	%xmm0, %xmm8
1459501d4:     	mulss	%xmm8, %xmm9
1459501d9:     	mulss	%xmm2, %xmm9
1459501de:     	addss	%xmm1, %xmm9
1459501e3:     	mulss	%xmm9, %xmm6
1459501e8:     	mulss	0x2c(%rcx), %xmm6

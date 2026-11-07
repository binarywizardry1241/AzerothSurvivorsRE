
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145987150:     	pushq	%rsi
145987151:     	pushq	%rdi
145987152:     	pushq	%rbx
145987153:     	subq	$0x20, %rsp
145987157:     	movl	%edx, %ebx
145987159:     	movq	%rcx, %rsi
14598715c:     	movl	0x20(%rcx), %edi
14598715f:     	incl	%edi
145987161:     	movl	%edi, 0x20(%rcx)
145987164:     	callq	0x145986de0 <.text+0x5985de0>
145987169:     	movzbl	%bl, %eax
14598716c:     	leaq	0x182d355(%rip), %rcx   # 0x1471b44c8
145987173:     	movslq	(%rcx,%rax,4), %rdx
145987177:     	addq	%rcx, %rdx
14598717a:     	jmpq	*%rdx
14598717c:     	movq	(%rsi), %rcx
14598717f:     	cmpl	$0xa, 0x68(%rcx)
145987183:     	jne	0x1459871f9 <.text+0x59861f9>
145987185:     	movss	0x3c(%rsi), %xmm1
14598718a:     	addss	%xmm0, %xmm1
14598718e:     	movss	%xmm1, 0x3c(%rsi)
145987193:     	jmp	0x14598720b <.text+0x598620b>
145987195:     	movss	0x38(%rsi), %xmm1
14598719a:     	addss	%xmm0, %xmm1
14598719e:     	movss	%xmm1, 0x38(%rsi)
1459871a3:     	jmp	0x14598720b <.text+0x598620b>
1459871a5:     	cvttss2si	%xmm0, %rcx
1459871aa:     	xorl	%edx, %edx
1459871ac:     	xorps	%xmm1, %xmm1
1459871af:     	ucomiss	%xmm1, %xmm0
1459871b2:     	cmovael	%ecx, %edx
1459871b5:     	ucomiss	0x3e66b8(%rip), %xmm0   # 0x145d6d874
1459871bc:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1459871c1:     	cmovbel	%edx, %ecx
1459871c4:     	addl	%ecx, 0x30(%rsi)
1459871c7:     	jmp	0x14598720b <.text+0x598620b>
1459871c9:     	movss	0x34(%rsi), %xmm1
1459871ce:     	addss	%xmm0, %xmm1
1459871d2:     	movss	%xmm1, 0x34(%rsi)
1459871d7:     	jmp	0x14598720b <.text+0x598620b>
1459871d9:     	movss	0x2c(%rsi), %xmm1
1459871de:     	subss	%xmm0, %xmm1
1459871e2:     	movss	%xmm1, 0x2c(%rsi)
1459871e7:     	jmp	0x14598720b <.text+0x598620b>
1459871e9:     	movss	0x40(%rsi), %xmm1
1459871ee:     	addss	%xmm0, %xmm1
1459871f2:     	movss	%xmm1, 0x40(%rsi)
1459871f7:     	jmp	0x14598720b <.text+0x598620b>
1459871f9:     	addss	0x3e616b(%rip), %xmm0   # 0x145d6d36c
145987201:     	mulss	0x28(%rsi), %xmm0
145987206:     	movss	%xmm0, 0x28(%rsi)
14598720b:     	incl	0x8(%rsi,%rax,4)
14598720f:     	xorl	%eax, %eax
145987211:     	subl	$0x2, %edi
145987214:     	cmovbl	%eax, %edi
145987217:     	xorps	%xmm0, %xmm0
14598721a:     	cvtsi2ss	%rdi, %xmm0
14598721f:     	mulss	0x64a511(%rip), %xmm0   # 0x145fd1738
145987227:     	movss	0x3e613d(%rip), %xmm1   # 0x145d6d36c
14598722f:     	addss	%xmm1, %xmm0
145987233:     	movss	0x716a35(%rip), %xmm2   # 0x14609dc70
14598723b:     	divss	%xmm0, %xmm2
14598723f:     	addss	%xmm1, %xmm2
145987243:     	mulss	0x28(%rsi), %xmm2
145987248:     	movss	%xmm2, 0x28(%rsi)
14598724d:     	addq	$0x20, %rsp
145987251:     	popq	%rbx
145987252:     	popq	%rdi
145987253:     	popq	%rsi
145987254:     	retq

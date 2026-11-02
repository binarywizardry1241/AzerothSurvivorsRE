
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145927040:     	pushq	%r14
145927042:     	pushq	%rsi
145927043:     	pushq	%rdi
145927044:     	pushq	%rbp
145927045:     	pushq	%rbx
145927046:     	subq	$0x80, %rsp
14592704d:     	movaps	%xmm7, 0x70(%rsp)
145927052:     	movaps	%xmm6, 0x60(%rsp)
145927057:     	movq	%rdx, %rsi
14592705a:     	movq	%rcx, %rdi
14592705d:     	movss	0x9ec(%rcx), %xmm7
145927065:     	movss	0x74(%rdx), %xmm6
14592706a:     	xorps	%xmm0, %xmm0
14592706d:     	ucomiss	%xmm0, %xmm6
145927070:     	jbe	0x14592709a <.text+0x592609a>
145927072:     	movq	0x50(%rsi), %rdx
145927076:     	movl	0x70(%rsi), %r9d
14592707a:     	movzbl	0x7b(%rsi), %eax
14592707e:     	movzbl	0x78(%rsi), %ecx
145927082:     	movb	%cl, 0x28(%rsp)
145927086:     	movb	%al, 0x20(%rsp)
14592708a:     	movb	$0x0, 0x30(%rsp)
14592708f:     	movq	%rdi, %rcx
145927092:     	movaps	%xmm6, %xmm2
145927095:     	callq	0x145933ec0 <.text+0x5932ec0>
14592709a:     	cmpb	$0x0, 0x10(%rsi)
14592709e:     	je	0x1459270af <.text+0x59260af>
1459270a0:     	movl	0x60(%rsi), %r14d
1459270a4:     	cmpl	$0x5, %r14d
1459270a8:     	je	0x1459270bb <.text+0x59260bb>
1459270aa:     	xorps	%xmm0, %xmm0
1459270ad:     	jmp	0x1459270c0 <.text+0x59260c0>
1459270af:     	movq	0x50(%rsi), %rbx
1459270b3:     	movl	0x70(%rsi), %ebp
1459270b6:     	jmp	0x145927189 <.text+0x5926189>
1459270bb:     	movss	0x64(%rsi), %xmm0
1459270c0:     	movl	0x4bc(%rdi), %ecx
1459270c6:     	cmpl	$0x3, %ecx
1459270c9:     	movl	$0x3, %eax
1459270ce:     	cmovbl	%ecx, %eax
1459270d1:     	movq	0x568(%rdi), %rdx
1459270d8:     	movq	0x50(%rsi), %rbx
1459270dc:     	testq	%rdx, %rdx
1459270df:     	je	0x145927161 <.text+0x5926161>
1459270e5:     	movss	0x14(%rsi), %xmm3
1459270ea:     	movss	0x18(%rsi), %xmm1
1459270ef:     	movl	0x1c(%rsi), %r9d
1459270f3:     	incl	%eax
1459270f5:     	movq	0x560(%rdi), %rcx
1459270fc:     	imulq	$0x160, %rdx, %rdx      # imm = 0x160
145927103:     	jmp	0x145927120 <.text+0x5926120>
145927105:     	nopw	%cs:(%rax,%rax)
145927110:     	addq	$0x160, %rcx            # imm = 0x160
145927117:     	addq	$-0x160, %rdx           # imm = 0xFEA0
14592711e:     	je	0x145927161 <.text+0x5926161>
145927120:     	cmpq	%rbx, 0x88(%rcx)
145927127:     	jne	0x145927110 <.text+0x5926110>
145927129:     	cmpl	$0x1, 0x68(%rcx)
14592712d:     	je	0x145927110 <.text+0x5926110>
14592712f:     	movl	0x70(%rsi), %edx
145927132:     	movzbl	0x7b(%rsi), %r8d
145927137:     	movss	%xmm7, 0x50(%rsp)
14592713d:     	movq	%rax, 0x48(%rsp)
145927142:     	movss	%xmm0, 0x30(%rsp)
145927148:     	movl	%r9d, 0x28(%rsp)
14592714d:     	movss	%xmm1, 0x20(%rsp)
145927153:     	movq	$0x0, 0x38(%rsp)
14592715c:     	callq	0x1458dfd10 <.text+0x58ded10>
145927161:     	movl	0x70(%rsi), %ebp
145927164:     	movq	%rdi, %rcx
145927167:     	movq	%rbx, %rdx
14592716a:     	movl	%ebp, %r8d
14592716d:     	movb	$0x1, %r9b
145927170:     	callq	0x145942bd0 <.text+0x5941bd0>
145927175:     	movq	%rdi, %rcx
145927178:     	movq	%rbx, %rdx
14592717b:     	movl	%ebp, %r8d
14592717e:     	callq	0x145943670 <.text+0x5942670>
145927183:     	cmpl	$0x5, %r14d
145927187:     	je	0x1459271a2 <.text+0x59261a2>
145927189:     	addq	$0x60, %rsi
14592718d:     	movl	%ebp, 0x20(%rsp)
145927191:     	movq	%rdi, %rcx
145927194:     	movq	%rbx, %rdx
145927197:     	movq	%rsi, %r8
14592719a:     	movaps	%xmm6, %xmm3
14592719d:     	callq	0x1459251b0 <.text+0x59241b0>
1459271a2:     	movaps	0x60(%rsp), %xmm6
1459271a7:     	movaps	0x70(%rsp), %xmm7
1459271ac:     	addq	$0x80, %rsp
1459271b3:     	popq	%rbx
1459271b4:     	popq	%rbp
1459271b5:     	popq	%rdi
1459271b6:     	popq	%rsi
1459271b7:     	popq	%r14
1459271b9:     	retq

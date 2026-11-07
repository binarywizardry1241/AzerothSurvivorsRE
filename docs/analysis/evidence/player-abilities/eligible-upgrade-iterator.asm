
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145472190:     	pushq	%r15
145472192:     	pushq	%r14
145472194:     	pushq	%r13
145472196:     	pushq	%r12
145472198:     	pushq	%rsi
145472199:     	pushq	%rdi
14547219a:     	pushq	%rbp
14547219b:     	pushq	%rbx
14547219c:     	subq	$0x68, %rsp
1454721a0:     	movaps	%xmm8, 0x50(%rsp)
1454721a6:     	movaps	%xmm7, 0x40(%rsp)
1454721ab:     	movaps	%xmm6, 0x30(%rsp)
1454721b0:     	movq	(%rcx), %r14
1454721b3:     	movq	0x8(%rcx), %rdi
1454721b7:     	cmpq	%rdi, %r14
1454721ba:     	je	0x1454722f9 <.text+0x54712f9>
1454721c0:     	movq	%rcx, %rsi
1454721c3:     	movq	(%rdx), %r15
1454721c6:     	movq	0x8(%rdx), %r12
1454721ca:     	movq	0x10(%rdx), %r13
1454721ce:     	movq	0x18(%rdx), %rax
1454721d2:     	movq	%rax, 0x28(%rsp)
1454721d7:     	movq	0x20(%rdx), %rbp
1454721db:     	movss	0x486b5d(%rip), %xmm6   # 0x1458f8d40
1454721e3:     	movss	0x47ae25(%rip), %xmm7   # 0x1458ed010
1454721eb:     	movss	0x758cdc(%rip), %xmm8   # 0x145bcaed0
1454721f4:     	jmp	0x145472229 <.text+0x5471229>
1454721f6:     	movq	0x28(%rsp), %rax
1454721fb:     	movq	(%rax), %rax
1454721fe:     	cmpq	$0x0, (%rax)
145472202:     	je	0x145472220 <.text+0x5471220>
145472204:     	movq	(%rbp), %rcx
145472208:     	movq	0x8(%rbp), %rax
14547220c:     	movq	(%rax), %r8
14547220f:     	movl	%ebx, %edx
145472211:     	callq	0x1454f94c0 <.text+0x54f84c0>
145472216:     	ucomiss	%xmm8, %xmm0
14547221a:     	jae	0x1454722fb <.text+0x54712fb>
145472220:     	cmpq	%rdi, %r14
145472223:     	je	0x1454722f9 <.text+0x54712f9>
145472229:     	movq	%r14, %rax
14547222c:     	incq	%r14
14547222f:     	movq	%r14, (%rsi)
145472232:     	movzbl	(%rax), %ebx
145472235:     	movq	(%r15), %rcx
145472238:     	movl	%ebx, %edx
14547223a:     	callq	0x14540da00 <.text+0x540ca00>
14547223f:     	testb	%al, %al
145472241:     	je	0x145472220 <.text+0x5471220>
145472243:     	movzbl	%bl, %eax
145472246:     	movq	(%r12), %rcx
14547224a:     	cmpl	$0x4, %eax
14547224d:     	je	0x145472254 <.text+0x5471254>
14547224f:     	cmpl	$0x1, %eax
145472252:     	jne	0x1454722c0 <.text+0x54712c0>
145472254:     	movq	(%rcx), %rdx
145472257:     	movl	0x68(%rdx), %r8d
14547225b:     	cmpl	$0xc, %r8d
14547225f:     	ja	0x1454722c0 <.text+0x54712c0>
145472261:     	movl	$0x1300, %r9d           # imm = 0x1300
145472267:     	btl	%r8d, %r9d
14547226b:     	jae	0x1454722c0 <.text+0x54712c0>
14547226d:     	cmpb	$0x9, 0x75(%rdx)
145472271:     	jne	0x1454722c0 <.text+0x54712c0>
145472273:     	movq	0x8(%r12), %r8
145472278:     	movss	0x58(%rdx), %xmm0
14547227d:     	mulss	%xmm6, %xmm0
145472281:     	mulss	0x20(%rcx), %xmm0
145472286:     	mulss	0x48(%rcx), %xmm0
14547228b:     	movss	0x48(%rdx), %xmm1
145472290:     	mulss	%xmm6, %xmm1
145472294:     	mulss	0x14(%rcx), %xmm1
145472299:     	mulss	0x3c(%rcx), %xmm1
14547229e:     	mulss	0x8(%r8), %xmm1
1454722a4:     	maxss	%xmm7, %xmm1
1454722a8:     	ucomiss	%xmm1, %xmm0
1454722ab:     	jae	0x145472220 <.text+0x5471220>
1454722b1:     	nopw	%cs:(%rax,%rax)
1454722c0:     	cmpl	$0x2, %eax
1454722c3:     	je	0x1454721f6 <.text+0x54711f6>
1454722c9:     	cmpl	$0x1, %eax
1454722cc:     	jne	0x145472204 <.text+0x5471204>
1454722d2:     	movq	(%r13), %rcx
1454722d6:     	movq	(%rcx), %rax
1454722d9:     	cmpb	$0xb, 0x75(%rax)
1454722dd:     	jne	0x145472204 <.text+0x5471204>
1454722e3:     	movq	0x8(%r13), %rdx
1454722e7:     	callq	0x14541b790 <.text+0x541a790>
1454722ec:     	testb	%al, %al
1454722ee:     	jne	0x145472204 <.text+0x5471204>
1454722f4:     	jmp	0x145472220 <.text+0x5471220>
1454722f9:     	movb	$-0x1, %bl
1454722fb:     	movl	%ebx, %eax
1454722fd:     	movaps	0x30(%rsp), %xmm6
145472302:     	movaps	0x40(%rsp), %xmm7
145472307:     	movaps	0x50(%rsp), %xmm8
14547230d:     	addq	$0x68, %rsp
145472311:     	popq	%rbx
145472312:     	popq	%rbp
145472313:     	popq	%rdi
145472314:     	popq	%rsi
145472315:     	popq	%r12
145472317:     	popq	%r13
145472319:     	popq	%r14
14547231b:     	popq	%r15
14547231d:     	retq

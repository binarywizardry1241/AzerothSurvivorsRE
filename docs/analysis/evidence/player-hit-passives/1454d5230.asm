
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d5230:     	pushq	%r15
1454d5232:     	pushq	%r14
1454d5234:     	pushq	%rsi
1454d5235:     	pushq	%rdi
1454d5236:     	pushq	%rbp
1454d5237:     	pushq	%rbx
1454d5238:     	subq	$0x38, %rsp
1454d523c:     	movaps	%xmm6, 0x20(%rsp)
1454d5241:     	movq	0x2a0(%rcx), %rax
1454d5248:     	testq	%rax, %rax
1454d524b:     	je	0x1454d5429 <.text+0x54d4429>
1454d5251:     	movq	0x298(%rcx), %r10
1454d5258:     	imulq	$0x58, %rax, %rsi
1454d525c:     	xorl	%r11d, %r11d
1454d525f:     	movabsq	$0x6974706d65646572, %rdi # imm = 0x6974706D65646572
1454d5269:     	jmp	0x1454d527d <.text+0x54d427d>
1454d526b:     	nopl	(%rax,%rax)
1454d5270:     	addq	$0x58, %r11
1454d5274:     	cmpq	%r11, %rsi
1454d5277:     	je	0x1454d5429 <.text+0x54d4429>
1454d527d:     	movq	(%r10,%r11), %rax
1454d5281:     	cmpq	$0xa, 0x8(%rax)
1454d5286:     	jne	0x1454d5270 <.text+0x54d4270>
1454d5288:     	movq	(%rax), %rbx
1454d528b:     	movq	(%rbx), %r14
1454d528e:     	xorq	%rdi, %r14
1454d5291:     	movzwl	0x8(%rbx), %ebx
1454d5295:     	xorq	$0x6e6f, %rbx           # imm = 0x6E6F
1454d529c:     	orq	%r14, %rbx
1454d529f:     	jne	0x1454d5270 <.text+0x54d4270>
1454d52a1:     	movq	0x760(%rcx), %rsi
1454d52a8:     	cmpq	$0x3, %rsi
1454d52ac:     	ja	0x1454d5429 <.text+0x54d4429>
1454d52b2:     	movss	0x14(%r10,%r11), %xmm2
1454d52b9:     	movss	0x3c(%r10,%r11), %xmm1
1454d52c0:     	movss	0x50(%r10,%r11), %xmm0
1454d52c7:     	movq	0x898(%rcx), %r10
1454d52ce:     	movq	0x880(%rcx), %r11
1454d52d5:     	movq	0x888(%rcx), %rdi
1454d52dc:     	leaq	(%r10,%r11), %rbx
1454d52e0:     	rolq	$0x17, %rbx
1454d52e4:     	addq	%r11, %rbx
1454d52e7:     	movq	%rdi, %r14
1454d52ea:     	shlq	$0x11, %r14
1454d52ee:     	movq	0x890(%rcx), %r15
1454d52f5:     	xorq	%r11, %r15
1454d52f8:     	xorq	%rdi, %r10
1454d52fb:     	xorq	%r15, %rdi
1454d52fe:     	movq	%rdi, 0x888(%rcx)
1454d5305:     	xorq	%r10, %r11
1454d5308:     	movq	%r11, 0x880(%rcx)
1454d530f:     	xorq	%r14, %r15
1454d5312:     	movq	%r15, 0x890(%rcx)
1454d5319:     	shrq	$0x28, %rbx
1454d531d:     	cvtsi2ss	%ebx, %xmm3
1454d5321:     	rolq	$0x2d, %r10
1454d5325:     	mulss	0x516093(%rip), %xmm3   # 0x1459eb3c0
1454d532d:     	movq	%r10, 0x898(%rcx)
1454d5334:     	movss	0x48(%rax), %xmm4
1454d5339:     	movss	0x4212df(%rip), %xmm5   # 0x1458f6620
1454d5341:     	mulss	%xmm4, %xmm5
1454d5345:     	movss	0x4239f3(%rip), %xmm6   # 0x1458f8d40
1454d534d:     	mulss	%xmm6, %xmm4
1454d5351:     	mulss	%xmm2, %xmm4
1454d5355:     	mulss	%xmm1, %xmm4
1454d5359:     	mulss	0x460(%rcx), %xmm4
1454d5361:     	maxss	0x417ca7(%rip), %xmm4   # 0x1458ed010
1454d5369:     	mulss	%xmm6, %xmm5
1454d536d:     	divss	%xmm4, %xmm5
1454d5371:     	minss	0x416193(%rip), %xmm5   # 0x1458eb50c
1454d5379:     	mulss	%xmm0, %xmm5
1454d537d:     	ucomiss	%xmm5, %xmm3
1454d5380:     	jae	0x1454d5429 <.text+0x54d4429>
1454d5386:     	movss	0x8e4(%rcx), %xmm0
1454d538e:     	movaps	%xmm0, %xmm1
1454d5391:     	maxss	0x7e0(%rcx), %xmm1
1454d5399:     	movaps	%xmm1, %xmm6
1454d539c:     	cmpunordss	%xmm1, %xmm6
1454d53a1:     	movaps	%xmm6, %xmm2
1454d53a4:     	andnps	%xmm1, %xmm2
1454d53a7:     	andps	%xmm0, %xmm6
1454d53aa:     	orps	%xmm2, %xmm6
1454d53ad:     	movaps	%xmm6, %xmm0
1454d53b0:     	addss	0x4160d0(%rip), %xmm0   # 0x1458eb488
1454d53b8:     	movss	%xmm0, 0x7e0(%rcx)
1454d53c0:     	cmpq	0x750(%rcx), %rsi
1454d53c7:     	jne	0x1454d53f0 <.text+0x54d43f0>
1454d53c9:     	leaq	0x750(%rcx), %rax
1454d53d0:     	movq	%rcx, %rdi
1454d53d3:     	movq	%rax, %rcx
1454d53d6:     	movl	%r9d, %ebp
1454d53d9:     	movq	%r8, %r14
1454d53dc:     	movq	%rdx, %rbx
1454d53df:     	callq	0x1457580b0 <.text+0x57570b0>
1454d53e4:     	movq	%rbx, %rdx
1454d53e7:     	movq	%r14, %r8
1454d53ea:     	movl	%ebp, %r9d
1454d53ed:     	movq	%rdi, %rcx
1454d53f0:     	movq	0x758(%rcx), %rax
1454d53f7:     	movq	%rsi, %r10
1454d53fa:     	shlq	$0x5, %r10
1454d53fe:     	movq	%rdx, (%rax,%r10)
1454d5402:     	movss	%xmm6, 0x8(%rax,%r10)
1454d5409:     	movq	(%r8), %rdx
1454d540c:     	movq	%rdx, 0xc(%rax,%r10)
1454d5411:     	movl	0x8(%r8), %edx
1454d5415:     	movl	%edx, 0x14(%rax,%r10)
1454d541a:     	movl	%r9d, 0x18(%rax,%r10)
1454d541f:     	incq	%rsi
1454d5422:     	movq	%rsi, 0x760(%rcx)
1454d5429:     	movaps	0x20(%rsp), %xmm6
1454d542e:     	addq	$0x38, %rsp
1454d5432:     	popq	%rbx
1454d5433:     	popq	%rbp
1454d5434:     	popq	%rdi
1454d5435:     	popq	%rsi
1454d5436:     	popq	%r14
1454d5438:     	popq	%r15
1454d543a:     	retq

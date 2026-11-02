
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454531a0:     	pushq	%rbp
1454531a1:     	pushq	%r15
1454531a3:     	pushq	%r14
1454531a5:     	pushq	%r13
1454531a7:     	pushq	%r12
1454531a9:     	pushq	%rsi
1454531aa:     	pushq	%rdi
1454531ab:     	pushq	%rbx
1454531ac:     	subq	$0x148, %rsp            # imm = 0x148
1454531b3:     	leaq	0x80(%rsp), %rbp
1454531bb:     	movaps	%xmm13, 0xb0(%rbp)
1454531c3:     	movaps	%xmm12, 0xa0(%rbp)
1454531cb:     	movaps	%xmm11, 0x90(%rbp)
1454531d3:     	movaps	%xmm10, 0x80(%rbp)
1454531db:     	movaps	%xmm9, 0x70(%rbp)
1454531e0:     	movaps	%xmm8, 0x60(%rbp)
1454531e5:     	movaps	%xmm7, 0x50(%rbp)
1454531e9:     	movaps	%xmm6, 0x40(%rbp)
1454531ed:     	movq	$-0x2, 0x38(%rbp)
1454531f5:     	movq	%rcx, %rsi
1454531f8:     	movq	(%rdx), %r12
1454531fb:     	cmpq	$0xa, 0x8(%r12)
145453201:     	jne	0x145453223 <.text+0x5452223>
145453203:     	movq	(%r12), %rax
145453207:     	movabsq	$0x6974706d65646572, %rcx # imm = 0x6974706D65646572
145453211:     	xorq	(%rax), %rcx
145453214:     	movzwl	0x8(%rax), %eax
145453218:     	xorq	$0x6e6f, %rax           # imm = 0x6E6F
14545321e:     	orq	%rcx, %rax
145453221:     	je	0x145453273 <.text+0x5452273>
145453223:     	movq	$-0x1, (%rsi)
14545322a:     	movq	%rsi, %rax
14545322d:     	movaps	0x40(%rbp), %xmm6
145453231:     	movaps	0x50(%rbp), %xmm7
145453235:     	movaps	0x60(%rbp), %xmm8
14545323a:     	movaps	0x70(%rbp), %xmm9
14545323f:     	movaps	0x80(%rbp), %xmm10
145453247:     	movaps	0x90(%rbp), %xmm11
14545324f:     	movaps	0xa0(%rbp), %xmm12
145453257:     	movaps	0xb0(%rbp), %xmm13
14545325f:     	addq	$0x148, %rsp            # imm = 0x148
145453266:     	popq	%rbx
145453267:     	popq	%rdi
145453268:     	popq	%rsi
145453269:     	popq	%r12
14545326b:     	popq	%r13
14545326d:     	popq	%r14
14545326f:     	popq	%r15
145453271:     	popq	%rbp
145453272:     	retq
145453273:     	movss	0x14(%rdx), %xmm11
145453279:     	movss	0x3c(%rdx), %xmm8
14545327f:     	movss	0x50(%rdx), %xmm7
145453284:     	movaps	%xmm11, %xmm9
145453288:     	subss	%xmm3, %xmm9
14545328d:     	leaq	0x12eb5eb(%rip), %rdi   # 0x14673e87f
145453294:     	movl	$0x22, %r13d
14545329a:     	movl	$0x22, %edx
14545329f:     	movq	%rdi, %rcx
1454532a2:     	movq	%r8, %r15
1454532a5:     	callq	0x145457cb0 <.text+0x5456cb0>
1454532aa:     	movq	%rax, %r14
1454532ad:     	movq	%rdx, %rbx
1454532b0:     	movss	0x48(%r12), %xmm0
1454532b7:     	movss	0x4c0031(%rip), %xmm6   # 0x1459132f0
1454532bf:     	movaps	%xmm0, %xmm1
1454532c2:     	mulss	%xmm6, %xmm1
1454532c6:     	movss	0x4c5421(%rip), %xmm10  # 0x1459186f0
1454532cf:     	mulss	%xmm10, %xmm1
1454532d4:     	mulss	%xmm10, %xmm0
1454532d9:     	mulss	%xmm11, %xmm0
1454532de:     	mulss	%xmm8, %xmm0
1454532e3:     	movss	0x8(%r15), %xmm11
1454532e9:     	mulss	%xmm11, %xmm0
1454532ee:     	movss	0x4b62e9(%rip), %xmm12  # 0x1459095e0
1454532f7:     	maxss	%xmm12, %xmm0
1454532fc:     	divss	%xmm0, %xmm1
145453300:     	movss	0x4b4213(%rip), %xmm13  # 0x14590751c
145453309:     	minss	%xmm13, %xmm1
14545330e:     	mulss	%xmm7, %xmm1
145453312:     	leaq	0x20(%rbp), %r15
145453316:     	movq	%r15, %rcx
145453319:     	callq	0x14543eb60 <.text+0x543db60>
14545331e:     	movss	0x48(%r12), %xmm0
145453325:     	mulss	%xmm0, %xmm6
145453329:     	mulss	%xmm10, %xmm6
14545332e:     	mulss	%xmm10, %xmm0
145453333:     	mulss	%xmm9, %xmm0
145453338:     	mulss	%xmm8, %xmm0
14545333d:     	mulss	%xmm11, %xmm0
145453342:     	maxss	%xmm12, %xmm0
145453347:     	divss	%xmm0, %xmm6
14545334b:     	minss	%xmm13, %xmm6
145453350:     	mulss	%xmm7, %xmm6
145453354:     	leaq	0x8(%rbp), %r12
145453358:     	movq	%r12, %rcx
14545335b:     	movaps	%xmm6, %xmm1
14545335e:     	callq	0x14543eb60 <.text+0x543db60>
145453363:     	nop
145453364:     	testq	%r14, %r14
145453367:     	cmoveq	%r13, %rbx
14545336b:     	cmovneq	%r14, %rdi
14545336f:     	leaq	0x12eaf9a(%rip), %rax   # 0x14673e310
145453376:     	movq	%rax, -0x38(%rbp)
14545337a:     	movq	$0x6, -0x30(%rbp)
145453382:     	movq	%r15, -0x28(%rbp)
145453386:     	leaq	0x12ead2b(%rip), %rax   # 0x14673e0b8
14545338d:     	movq	%rax, -0x20(%rbp)
145453391:     	leaq	0x12eb509(%rip), %rcx   # 0x14673e8a1
145453398:     	movq	%rcx, -0x18(%rbp)
14545339c:     	movq	$0x5, -0x10(%rbp)
1454533a4:     	movq	%r12, -0x8(%rbp)
1454533a8:     	movq	%rax, (%rbp)
1454533ac:     	movq	$0x2, 0x20(%rsp)
1454533b5:     	leaq	-0x50(%rbp), %rcx
1454533b9:     	leaq	-0x38(%rbp), %r9
1454533bd:     	movq	%rdi, %rdx
1454533c0:     	movq	%rbx, %r8
1454533c3:     	callq	0x145458060 <.text+0x5457060>
1454533c8:     	nop
1454533c9:     	movq	-0x40(%rbp), %rax
1454533cd:     	movq	%rax, 0x10(%rsi)
1454533d1:     	movups	-0x50(%rbp), %xmm0
1454533d5:     	movups	%xmm0, (%rsi)
1454533d8:     	movq	0x8(%rbp), %rdx
1454533dc:     	testq	%rdx, %rdx
1454533df:     	je	0x1454533f0 <.text+0x54523f0>
1454533e1:     	movq	0x10(%rbp), %rcx
1454533e5:     	movl	$0x1, %r8d
1454533eb:     	callq	0x1400021d0 <.text+0x11d0>
1454533f0:     	movq	0x20(%rbp), %rdx
1454533f4:     	testq	%rdx, %rdx
1454533f7:     	je	0x14545322a <.text+0x545222a>
1454533fd:     	movq	0x28(%rbp), %rcx
145453401:     	movl	$0x1, %r8d
145453407:     	callq	0x1400021d0 <.text+0x11d0>
14545340c:     	jmp	0x14545322a <.text+0x545222a>

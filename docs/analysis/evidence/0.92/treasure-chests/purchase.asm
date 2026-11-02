
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a81a0:     	pushq	%rbp
1454a81a1:     	pushq	%r15
1454a81a3:     	pushq	%r14
1454a81a5:     	pushq	%r12
1454a81a7:     	pushq	%rsi
1454a81a8:     	pushq	%rdi
1454a81a9:     	pushq	%rbx
1454a81aa:     	subq	$0xb0, %rsp
1454a81b1:     	leaq	0x80(%rsp), %rbp
1454a81b9:     	movq	$-0x2, 0x28(%rbp)
1454a81c1:     	movq	%rcx, %rsi
1454a81c4:     	movl	0x408(%rcx), %r14d
1454a81cb:     	movl	0x920(%rcx), %r15d
1454a81d2:     	movl	%r14d, %eax
1454a81d5:     	subl	%r15d, %eax
1454a81d8:     	jb	0x1454a82a4 <.text+0x54a72a4>
1454a81de:     	movl	%r15d, %ecx
1454a81e1:     	cvtsi2ss	%rcx, %xmm0
1454a81e6:     	mulss	0x1606aca(%rip), %xmm0  # 0x146aaecb8
1454a81ee:     	addss	0x4118aa(%rip), %xmm0   # 0x1458b9aa0
1454a81f6:     	cvttss2si	%xmm0, %rcx
1454a81fb:     	xorl	%edx, %edx
1454a81fd:     	xorps	%xmm1, %xmm1
1454a8200:     	ucomiss	%xmm1, %xmm0
1454a8203:     	cmovbl	%edx, %ecx
1454a8206:     	movl	%eax, 0x408(%rsi)
1454a820c:     	ucomiss	0x403231(%rip), %xmm0   # 0x1458ab444
1454a8213:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454a8218:     	cmovbel	%ecx, %edx
1454a821b:     	movl	%edx, 0x920(%rsi)
1454a8221:     	imull	$0x2710, %eax, %r8d     # imm = 0x2710
1454a8228:     	movq	0x8a8(%rsi), %rax
1454a822f:     	testq	%rax, %rax
1454a8232:     	je	0x1454a84ae <.text+0x54a74ae>
1454a8238:     	movq	0x8b0(%rsi), %rcx
1454a823f:     	movl	$0x498, %edx            # imm = 0x498
1454a8244:     	movzwl	0x36(%rax), %r10d
1454a8249:     	movl	%r10d, %r11d
1454a824c:     	addl	%r11d, %r11d
1454a824f:     	movq	$-0x1, %r9
1454a8256:     	nopw	%cs:(%rax,%rax)
1454a8260:     	testq	%r11, %r11
1454a8263:     	je	0x1454a8290 <.text+0x54a7290>
1454a8265:     	movzwl	0x3a(%rax,%r9,2), %edi
1454a826b:     	cmpl	%edi, %edx
1454a826d:     	seta	%bl
1454a8270:     	sbbb	$0x0, %bl
1454a8273:     	incq	%r9
1454a8276:     	addq	$-0x2, %r11
1454a827a:     	cmpb	$0x1, %bl
1454a827d:     	je	0x1454a8260 <.text+0x54a7260>
1454a827f:     	movzbl	%bl, %r10d
1454a8283:     	testl	%r10d, %r10d
1454a8286:     	je	0x1454a84a7 <.text+0x54a74a7>
1454a828c:     	jmp	0x1454a8293 <.text+0x54a7293>
1454a828e:     	nop
1454a8290:     	movq	%r10, %r9
1454a8293:     	subq	$0x1, %rcx
1454a8297:     	jb	0x1454a84b0 <.text+0x54a74b0>
1454a829d:     	movq	0x50(%rax,%r9,8), %rax
1454a82a2:     	jmp	0x1454a8244 <.text+0x54a7244>
1454a82a4:     	movss	0x8d4(%rsi), %xmm0
1454a82ac:     	movaps	%xmm0, %xmm1
1454a82af:     	subss	0x92c(%rsi), %xmm1
1454a82b7:     	ucomiss	0x40311e(%rip), %xmm1   # 0x1458ab3dc
1454a82be:     	jbe	0x1454a84eb <.text+0x54a74eb>
1454a82c4:     	leaq	0x920(%rsi), %r12
1454a82cb:     	movss	%xmm0, 0x92c(%rsi)
1454a82d3:     	leaq	0x1607bf6(%rip), %rdi   # 0x146aafed0
1454a82da:     	movl	$0x1a, %ebx
1454a82df:     	movl	$0x1a, %edx
1454a82e4:     	movq	%rdi, %rcx
1454a82e7:     	callq	0x14541f0e0 <.text+0x541e0e0>
1454a82ec:     	testq	%rax, %rax
1454a82ef:     	cmovneq	%rax, %rdi
1454a82f3:     	cmovneq	%rdx, %rbx
1454a82f7:     	leaq	0x1606e1a(%rip), %rax   # 0x146aaf118
1454a82fe:     	movq	%rax, (%rbp)
1454a8302:     	movq	$0x1, 0x8(%rbp)
1454a830a:     	movq	%r12, 0x10(%rbp)
1454a830e:     	leaq	0x1606de3(%rip), %rax   # 0x146aaf0f8
1454a8315:     	movq	%rax, 0x18(%rbp)
1454a8319:     	movq	$0x1, 0x20(%rsp)
1454a8322:     	leaq	-0x30(%rbp), %rcx
1454a8326:     	movq	%rbp, %r9
1454a8329:     	movq	%rdi, %rdx
1454a832c:     	movq	%rbx, %r8
1454a832f:     	callq	0x14541f400 <.text+0x541e400>
1454a8334:     	movq	-0x28(%rbp), %rdx
1454a8338:     	movq	-0x20(%rbp), %rdi
1454a833c:     	movq	%rbp, %rcx
1454a833f:     	movq	%rdx, -0x10(%rbp)
1454a8343:     	movq	%rdi, %r8
1454a8346:     	callq	0x1454378d0 <.text+0x54368d0>
1454a834b:     	nop
1454a834c:     	movq	0x548(%rsi), %rbx
1454a8353:     	cmpq	0x538(%rsi), %rbx
1454a835a:     	jne	0x1454a8369 <.text+0x54a7369>
1454a835c:     	leaq	0x538(%rsi), %rcx
1454a8363:     	callq	0x145717d60 <.text+0x5716d60>
1454a8368:     	nop
1454a8369:     	movq	0x540(%rsi), %rax
1454a8370:     	movq	%rbx, %rcx
1454a8373:     	shlq	$0x5, %rcx
1454a8377:     	movups	(%rbp), %xmm0
1454a837b:     	movups	0x10(%rbp), %xmm1
1454a837f:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a8384:     	movups	%xmm0, (%rax,%rcx)
1454a8388:     	incq	%rbx
1454a838b:     	movq	%rbx, 0x548(%rsi)
1454a8392:     	callq	0x140002200 <.text+0x1200>
1454a8397:     	movl	$0x1, %ecx
1454a839c:     	movl	$0x1, %edx
1454a83a1:     	callq	0x1400021c0 <.text+0x11c0>
1454a83a6:     	testq	%rax, %rax
1454a83a9:     	je	0x1454a852d <.text+0x54a752d>
1454a83af:     	movb	$0x7b, (%rax)
1454a83b2:     	movq	$0x1, (%rbp)
1454a83ba:     	movq	%rax, 0x8(%rbp)
1454a83be:     	movq	$0x1, 0x10(%rbp)
1454a83c6:     	movb	$0x1, 0x18(%rbp)
1454a83ca:     	leaq	0x1607aeb(%rip), %rax   # 0x146aafebc
1454a83d1:     	movq	%rax, 0x20(%rsp)
1454a83d6:     	movq	$0x5, 0x28(%rsp)
1454a83df:     	leaq	0x16072c3(%rip), %r8    # 0x146aaf6a9
1454a83e6:     	leaq	-0x50(%rbp), %rcx
1454a83ea:     	movq	%rbp, %rdx
1454a83ed:     	movl	$0x4, %r9d
1454a83f3:     	callq	0x145426da0 <.text+0x5425da0>
1454a83f8:     	nop
1454a83f9:     	movq	%rdi, 0x28(%rsp)
1454a83fe:     	movq	-0x10(%rbp), %rax
1454a8402:     	movq	%rax, 0x20(%rsp)
1454a8407:     	leaq	0x1607293(%rip), %r8    # 0x146aaf6a1
1454a840e:     	movq	%rbp, %rcx
1454a8411:     	leaq	-0x50(%rbp), %rdx
1454a8415:     	movl	$0x4, %r9d
1454a841b:     	callq	0x145426da0 <.text+0x5425da0>
1454a8420:     	nop
1454a8421:     	movq	(%rbp), %rax
1454a8425:     	movq	0x10(%rbp), %rdi
1454a8429:     	cmpq	%rdi, %rax
1454a842c:     	je	0x1454a8503 <.text+0x54a7503>
1454a8432:     	movq	%rax, -0x8(%rbp)
1454a8436:     	movq	0x8(%rbp), %rax
1454a843a:     	movq	%rax, -0x18(%rbp)
1454a843e:     	movb	$0x7d, (%rax,%rdi)
1454a8442:     	movq	0x560(%rsi), %rbx
1454a8449:     	cmpq	0x550(%rsi), %rbx
1454a8450:     	jne	0x1454a845f <.text+0x54a745f>
1454a8452:     	leaq	0x550(%rsi), %rcx
1454a8459:     	callq	0x145717c10 <.text+0x5716c10>
1454a845e:     	nop
1454a845f:     	incq	%rdi
1454a8462:     	movq	0x558(%rsi), %rax
1454a8469:     	leaq	(%rbx,%rbx,2), %rcx
1454a846d:     	movq	-0x8(%rbp), %rdx
1454a8471:     	movq	%rdx, (%rax,%rcx,8)
1454a8475:     	movq	-0x18(%rbp), %rdx
1454a8479:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454a847e:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454a8483:     	incq	%rbx
1454a8486:     	movq	%rbx, 0x560(%rsi)
1454a848d:     	movq	-0x30(%rbp), %rdx
1454a8491:     	testq	%rdx, %rdx
1454a8494:     	je	0x1454a84eb <.text+0x54a74eb>
1454a8496:     	movl	$0x1, %r8d
1454a849c:     	movq	-0x10(%rbp), %rcx
1454a84a0:     	callq	0x1400021d0 <.text+0x11d0>
1454a84a5:     	jmp	0x1454a84eb <.text+0x54a74eb>
1454a84a7:     	movl	%r8d, 0x8(%rax,%r9,4)
1454a84ac:     	jmp	0x1454a84df <.text+0x54a74df>
1454a84ae:     	xorl	%eax, %eax
1454a84b0:     	leaq	0x8a8(%rsi), %rcx
1454a84b7:     	movq	%rcx, (%rbp)
1454a84bb:     	movq	%rax, 0x8(%rbp)
1454a84bf:     	movq	$0x0, 0x10(%rbp)
1454a84c7:     	movq	%r9, 0x18(%rbp)
1454a84cb:     	movq	$0x498, 0x20(%rbp)      # imm = 0x498
1454a84d3:     	leaq	-0x50(%rbp), %rcx
1454a84d7:     	movq	%rbp, %rdx
1454a84da:     	callq	0x145408070 <.text+0x5407070>
1454a84df:     	incl	0x670(%rsi)
1454a84e5:     	incl	0x8e0(%rsi)
1454a84eb:     	cmpl	%r15d, %r14d
1454a84ee:     	setae	%al
1454a84f1:     	addq	$0xb0, %rsp
1454a84f8:     	popq	%rbx
1454a84f9:     	popq	%rdi
1454a84fa:     	popq	%rsi
1454a84fb:     	popq	%r12
1454a84fd:     	popq	%r14
1454a84ff:     	popq	%r15
1454a8501:     	popq	%rbp
1454a8502:     	retq
1454a8503:     	movq	$0x1, 0x20(%rsp)
1454a850c:     	movq	%rbp, %rcx
1454a850f:     	movl	$0x1, %r8d
1454a8515:     	movl	$0x1, %r9d
1454a851b:     	movq	%rdi, %rdx
1454a851e:     	callq	0x145717840 <.text+0x5716840>
1454a8523:     	nop
1454a8524:     	movq	(%rbp), %rax
1454a8528:     	jmp	0x1454a8432 <.text+0x54a7432>
1454a852d:     	movl	$0x1, %ecx
1454a8532:     	movl	$0x1, %edx
1454a8537:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1454a853c:     	nop
1454a853d:     	ud2

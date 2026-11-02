
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401d1421:     	movaps	0x230(%rbp), %xmm0
1401d1428:     	movaps	%xmm0, 0x300(%rbp)
1401d142f:     	movl	$0x3f733333, 0x310(%rbp) # imm = 0x3F733333
1401d1439:     	leaq	0x520(%rbp), %rcx
1401d1440:     	leaq	0x300(%rbp), %rdx
1401d1447:     	callq	0x144c67100 <.text+0x4c66100>
1401d144c:     	nop
1401d144d:     	movaps	0x520(%rbp), %xmm10
1401d1455:     	leaq	0x300(%rbp), %rcx
1401d145c:     	leaq	0x230(%rbp), %rdx
1401d1463:     	movss	0x5be4a89(%rip), %xmm2  # 0x145db5ef4
1401d146b:     	callq	0x144c6d680 <.text+0x4c6c680>
1401d1470:     	nop
1401d1471:     	movups	0x300(%rbp), %xmm0
1401d1478:     	movaps	%xmm0, 0x520(%rbp)
1401d147f:     	movl	$0x3f400000, 0x530(%rbp) # imm = 0x3F400000
1401d1489:     	leaq	0x300(%rbp), %rcx
1401d1490:     	leaq	0x520(%rbp), %rdx
1401d1497:     	callq	0x144c67100 <.text+0x4c66100>
1401d149c:     	nop
1401d149d:     	movaps	0x300(%rbp), %xmm0
1401d14a4:     	movq	0x5f0(%rbp), %rdi
1401d14ab:     	movl	$0x0, (%rdi)
1401d14b1:     	movl	$0x1, 0x8(%rdi)
1401d14b8:     	movups	%xmm10, 0xc(%rdi)
1401d14bd:     	movq	$0x3f000000, 0x1c(%rdi) # imm = 0x3F000000
1401d14c5:     	movl	$0x1, 0x28(%rdi)
1401d14cc:     	movups	%xmm0, 0x2c(%rdi)
1401d14d0:     	movl	$0x3f000000, 0x3c(%rdi) # imm = 0x3F000000
1401d14d7:     	callq	0x140002200 <.text+0x1200>
1401d14dc:     	movl	$0x48, %ecx
1401d14e1:     	movl	$0x8, %edx
1401d14e6:     	callq	0x1400021c0 <.text+0x11c0>
1401d14eb:     	testq	%rax, %rax
1401d14ee:     	je	0x1401d22ca <.text+0x1d12ca>
1401d14f4:     	movq	%rax, %r14
1401d14f7:     	movaps	%xmm12, %xmm6
1401d14fb:     	movapd	%xmm13, %xmm12
1401d1500:     	movb	%r13b, 0x627(%rbp)
1401d1507:     	movq	$0x2, 0x8(%rax)
1401d150f:     	movq	%rdi, 0x10(%rax)
1401d1513:     	movq	$0x2, 0x18(%rax)
1401d151b:     	movl	$0x3fc90fdb, 0x20(%rax) # imm = 0x3FC90FDB
1401d1522:     	movb	$0x0, 0x24(%rax)
1401d1526:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000

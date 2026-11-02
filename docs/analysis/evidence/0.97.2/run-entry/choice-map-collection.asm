
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145536160:     	pushq	%rbp
145536161:     	pushq	%r15
145536163:     	pushq	%r14
145536165:     	pushq	%rsi
145536166:     	pushq	%rdi
145536167:     	pushq	%rbx
145536168:     	subq	$0x98, %rsp
14553616f:     	leaq	0x80(%rsp), %rbp
145536177:     	movq	$-0x2, 0x10(%rbp)
14553617f:     	movq	0x18(%rdx), %r14
145536183:     	subq	0x8(%rdx), %r14
145536187:     	movabsq	$0x1999999999999980, %rax # imm = 0x1999999999999980
145536191:     	cmpq	%rax, %r14
145536194:     	movq	%rdx, -0x18(%rbp)
145536198:     	jbe	0x1455361ae <.text+0x55351ae>
14553619a:     	xorl	%ebx, %ebx
14553619c:     	movb	$0x1, 0xf(%rbp)
1455361a0:     	movq	%rbx, %rcx
1455361a3:     	movq	%rdi, %rdx
1455361a6:     	callq	0x1458e721b <.text+0x58e621b>
1455361ab:     	nop
1455361ac:     	ud2
1455361ae:     	movq	%rdx, %r15
1455361b1:     	movq	%rcx, %rsi
1455361b4:     	leaq	(%r14,%r14,4), %rdi
1455361b8:     	testq	%rdi, %rdi
1455361bb:     	je	0x1455361df <.text+0x55351df>
1455361bd:     	callq	0x140002200 <.text+0x1200>
1455361c2:     	movl	$0x8, %ebx
1455361c7:     	movl	$0x8, %edx
1455361cc:     	movq	%rdi, %rcx
1455361cf:     	callq	0x1400021c0 <.text+0x11c0>
1455361d4:     	testq	%rax, %rax
1455361d7:     	je	0x14553619c <.text+0x553519c>
1455361d9:     	shrq	$0x5, %r14
1455361dd:     	jmp	0x1455361e7 <.text+0x55351e7>
1455361df:     	movl	$0x8, %eax
1455361e4:     	xorl	%r14d, %r14d
1455361e7:     	movq	%r14, -0x10(%rbp)
1455361eb:     	movq	%rax, -0x8(%rbp)
1455361ef:     	leaq	(%rbp), %rcx
1455361f3:     	movq	$0x0, (%rbp)
1455361fb:     	movups	(%r15), %xmm0
1455361ff:     	movups	0x10(%r15), %xmm1
145536204:     	movaps	%xmm1, -0x50(%rbp)
145536208:     	movaps	%xmm0, -0x60(%rbp)
14553620c:     	movq	0x20(%r15), %rdx
145536210:     	movq	%rcx, -0x38(%rbp)
145536214:     	movq	$0x0, -0x30(%rbp)
14553621c:     	movq	%rax, -0x28(%rbp)
145536220:     	movq	%rdx, -0x20(%rbp)
145536224:     	leaq	-0x60(%rbp), %rcx
145536228:     	leaq	-0x38(%rbp), %rdx
14553622c:     	callq	0x1455452d0 <.text+0x55442d0>
145536231:     	nop
145536232:     	movq	(%rbp), %rax
145536236:     	movq	%rax, 0x10(%rsi)
14553623a:     	movups	-0x10(%rbp), %xmm0
14553623e:     	movups	%xmm0, (%rsi)
145536241:     	movq	%rsi, %rax
145536244:     	addq	$0x98, %rsp
14553624b:     	popq	%rbx
14553624c:     	popq	%rdi
14553624d:     	popq	%rsi
14553624e:     	popq	%r14
145536250:     	popq	%r15
145536252:     	popq	%rbp
145536253:     	retq

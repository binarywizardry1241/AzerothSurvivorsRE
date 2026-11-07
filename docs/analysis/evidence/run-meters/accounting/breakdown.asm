
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f27a0:     	pushq	%r15
1458f27a2:     	pushq	%r14
1458f27a4:     	pushq	%rsi
1458f27a5:     	pushq	%rdi
1458f27a6:     	pushq	%rbx
1458f27a7:     	subq	$0x40, %rsp
1458f27ab:     	movaps	%xmm7, 0x30(%rsp)
1458f27b0:     	movapd	%xmm6, 0x20(%rsp)
1458f27b6:     	movq	%rcx, %rsi
1458f27b9:     	xorl	%ecx, %ecx
1458f27bb:     	cmpb	$0x2, 0x168(%rdx)
1458f27c2:     	movl	$0x8, %eax
1458f27c7:     	je	0x1458f2897 <.text+0x58f1897>
1458f27cd:     	cmpb	$0x2, 0x195(%rdx)
1458f27d4:     	jne	0x1458f2897 <.text+0x58f1897>
1458f27da:     	movapd	%xmm2, %xmm6
1458f27de:     	movq	0x140(%rdx), %rbx
1458f27e5:     	movq	0x148(%rdx), %rdi
1458f27ec:     	movq	0x150(%rdx), %r14
1458f27f3:     	movq	0x158(%rdx), %r15
1458f27fa:     	movss	0x160(%rdx), %xmm7
1458f2802:     	callq	0x140002200 <.text+0x1200>
1458f2807:     	testq	%r14, %r14
1458f280a:     	je	0x1458f2872 <.text+0x58f1872>
1458f280c:     	xorps	%xmm0, %xmm0
1458f280f:     	ucomiss	%xmm0, %xmm7
1458f2812:     	jbe	0x1458f2872 <.text+0x58f1872>
1458f2814:     	movl	$0x30, %ecx
1458f2819:     	movl	$0x8, %edx
1458f281e:     	callq	0x1400021c0 <.text+0x11c0>
1458f2823:     	testq	%rax, %rax
1458f2826:     	je	0x1458f28c9 <.text+0x58f18c9>
1458f282c:     	xorps	%xmm0, %xmm0
1458f282f:     	cvtss2sd	%xmm7, %xmm0
1458f2833:     	movsd	0x4ab575(%rip), %xmm1   # 0x145d9ddb0
1458f283b:     	movaps	%xmm0, %xmm2
1458f283e:     	addsd	%xmm1, %xmm2
1458f2842:     	divsd	%xmm2, %xmm0
1458f2846:     	subsd	%xmm0, %xmm1
1458f284a:     	mulsd	%xmm6, %xmm1
1458f284e:     	mulsd	%xmm6, %xmm0
1458f2852:     	movq	%rbx, (%rax)
1458f2855:     	movq	%rdi, 0x8(%rax)
1458f2859:     	movsd	%xmm1, 0x10(%rax)
1458f285e:     	movq	%r14, 0x18(%rax)
1458f2862:     	movq	%r15, 0x20(%rax)
1458f2866:     	movsd	%xmm0, 0x28(%rax)
1458f286b:     	movl	$0x2, %ecx
1458f2870:     	jmp	0x1458f2897 <.text+0x58f1897>
1458f2872:     	movl	$0x18, %ecx
1458f2877:     	movl	$0x8, %edx
1458f287c:     	callq	0x1400021c0 <.text+0x11c0>
1458f2881:     	testq	%rax, %rax
1458f2884:     	je	0x1458f28b8 <.text+0x58f18b8>
1458f2886:     	movq	%rbx, (%rax)
1458f2889:     	movq	%rdi, 0x8(%rax)
1458f288d:     	movsd	%xmm6, 0x10(%rax)
1458f2892:     	movl	$0x1, %ecx
1458f2897:     	movq	%rcx, (%rsi)
1458f289a:     	movq	%rax, 0x8(%rsi)
1458f289e:     	movq	%rcx, 0x10(%rsi)
1458f28a2:     	movaps	0x20(%rsp), %xmm6
1458f28a7:     	movaps	0x30(%rsp), %xmm7
1458f28ac:     	addq	$0x40, %rsp
1458f28b0:     	popq	%rbx
1458f28b1:     	popq	%rdi
1458f28b2:     	popq	%rsi
1458f28b3:     	popq	%r14
1458f28b5:     	popq	%r15
1458f28b7:     	retq
1458f28b8:     	movl	$0x8, %ecx
1458f28bd:     	movl	$0x18, %edx
1458f28c2:     	callq	0x145d69431 <.text+0x5d68431>
1458f28c7:     	ud2
1458f28c9:     	movl	$0x8, %ecx
1458f28ce:     	movl	$0x30, %edx
1458f28d3:     	callq	0x145d69431 <.text+0x5d68431>
1458f28d8:     	ud2

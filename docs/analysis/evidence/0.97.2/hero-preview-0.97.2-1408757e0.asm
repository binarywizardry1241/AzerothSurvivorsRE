
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1408757e0:     	pushq	%r15
1408757e2:     	pushq	%r14
1408757e4:     	pushq	%r13
1408757e6:     	pushq	%r12
1408757e8:     	pushq	%rsi
1408757e9:     	pushq	%rdi
1408757ea:     	pushq	%rbp
1408757eb:     	pushq	%rbx
1408757ec:     	subq	$0x68, %rsp
1408757f0:     	movl	$0x1, %ebp
1408757f5:     	lock
1408757f6:     	xaddl	%ebp, 0x5b0(%r8)
1408757fe:     	cmpq	$-0x1, 0x108(%rdx)
140875806:     	je	0x140875941 <.text+0x874941>
14087580c:     	movq	%r8, %rbx
14087580f:     	movq	%rdx, %rsi
140875812:     	movq	0x5a0(%r8), %rax
140875819:     	movq	%rax, 0x38(%rsp)
14087581e:     	cmpq	%rax, 0x8(%rdx)
140875822:     	jne	0x14087595b <.text+0x87495b>
140875828:     	movq	0x10(%rsi), %rax
14087582c:     	cmpq	0x218(%rbx), %rax
140875833:     	jae	0x14087598c <.text+0x87498c>
140875839:     	movq	%rcx, %rdi
14087583c:     	movq	0x210(%rbx), %rcx
140875843:     	movq	(%rcx,%rax,8), %rax
140875847:     	testq	%rax, %rax
14087584a:     	je	0x14087598c <.text+0x87498c>
140875850:     	movq	0x1e0(%rbx), %r15
140875857:     	notq	%rax
14087585a:     	imulq	$0x38, %rax, %rax
14087585e:     	cmpb	$0x0, 0x30(%r15,%rax)
140875864:     	je	0x14087598c <.text+0x87498c>
14087586a:     	addq	%rax, %r15
14087586d:     	leaq	0x18(%rsi), %r14
140875871:     	movq	0x10(%r15), %r12
140875875:     	movl	0x5b0(%rbx), %eax
14087587b:     	movl	(%rsi), %r13d
14087587e:     	movq	%r14, %rcx
140875881:     	movq	%rbx, %rdx
140875884:     	callq	0x141288ca0 <.text+0x1287ca0>
140875889:     	movq	%rbx, 0x40(%rsp)
14087588e:     	movq	%r14, 0x38(%rsp)
140875893:     	movl	%r13d, 0x48(%rsp)
140875898:     	movl	%ebp, 0x4c(%rsp)
14087589c:     	leaq	0x58(%rsp), %rcx
1408758a1:     	leaq	0x38(%rsp), %rdx
1408758a6:     	callq	0x14000df80 <.text+0xcf80>
1408758ab:     	cmpb	$0x1, 0x58(%rsp)
1408758b0:     	je	0x140875924 <.text+0x874924>
1408758b2:     	movq	0x60(%rsp), %rax
1408758b7:     	leaq	0xc8(%rax), %rcx
1408758be:     	cmpb	$0x0, 0xb8(%rax)
1408758c5:     	leaq	0xbc(%rax), %rdx
1408758cc:     	cmovneq	%rdx, %rcx
1408758d0:     	movss	(%rcx), %xmm0
1408758d4:     	movl	0xc4(%rax), %ecx
1408758da:     	cvtsi2ss	%rcx, %xmm1
1408758df:     	divss	%xmm0, %xmm1
1408758e3:     	xorps	%xmm2, %xmm2
1408758e6:     	ucomiss	%xmm2, %xmm1
1408758e9:     	jbe	0x140875924 <.text+0x874924>
1408758eb:     	movl	0xc0(%rax), %eax
1408758f1:     	xorps	%xmm2, %xmm2
1408758f4:     	cvtsi2ss	%rax, %xmm2
1408758f9:     	divss	%xmm0, %xmm2
1408758fd:     	divss	%xmm1, %xmm2
140875901:     	movaps	%xmm2, %xmm0
140875904:     	subss	(%r12), %xmm0
14087590a:     	andps	0x509561f(%rip), %xmm0  # 0x14590af30
140875911:     	ucomiss	0x51750e8(%rip), %xmm0  # 0x1459eaa00
140875918:     	jbe	0x140875924 <.text+0x874924>
14087591a:     	movl	%ebp, 0x2c(%r15)
14087591e:     	movss	%xmm2, (%r12)
140875924:     	movl	%ebp, (%rsi)
140875926:     	movq	$-0x3, (%rdi)
14087592d:     	movq	%rdi, %rax
140875930:     	addq	$0x68, %rsp
140875934:     	popq	%rbx
140875935:     	popq	%rbp
140875936:     	popq	%rdi
140875937:     	popq	%rsi
140875938:     	popq	%r12
14087593a:     	popq	%r13
14087593c:     	popq	%r14
14087593e:     	popq	%r15
140875940:     	retq
140875941:     	leaq	0x5199fa8(%rip), %rcx   # 0x145a0f8f0
140875948:     	leaq	0x519a001(%rip), %r8    # 0x145a0f950
14087594f:     	movl	$0x59, %edx
140875954:     	callq	0x1458e74d0 <.text+0x58e64d0>
140875959:     	ud2
14087595b:     	addq	$0x8, %rsi
14087595f:     	leaq	0x519a072(%rip), %rax   # 0x145a0f9d8
140875966:     	movq	%rax, 0x28(%rsp)
14087596b:     	movq	$0xdf, 0x20(%rsp)
140875974:     	leaq	0x5199fed(%rip), %r9    # 0x145a0f968
14087597b:     	leaq	0x38(%rsp), %r8
140875980:     	xorl	%ecx, %ecx
140875982:     	movq	%rsi, %rdx
140875985:     	callq	0x14589fabd <.text+0x589eabd>
14087598a:     	ud2
14087598c:     	addq	$0x4, %rsi
140875990:     	movq	%rsi, 0x38(%rsp)
140875995:     	leaq	0x4783614(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
14087599c:     	movq	%rax, 0x40(%rsp)
1408759a1:     	leaq	0x37(%rsp), %rcx
1408759a6:     	movq	%rcx, 0x48(%rsp)
1408759ab:     	movq	%rax, 0x50(%rsp)
1408759b0:     	leaq	0x51998ab(%rip), %rcx   # 0x145a0f262
1408759b7:     	leaq	0x51999c2(%rip), %r8    # 0x145a0f380
1408759be:     	leaq	0x38(%rsp), %rdx
1408759c3:     	callq	0x1458e7790 <.text+0x58e6790>
1408759c8:     	ud2


AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145496850:     	pushq	%rsi
145496851:     	pushq	%rdi
145496852:     	pushq	%rbx
145496853:     	subq	$0x30, %rsp
145496857:     	movq	0x688(%rcx), %rdi
14549685e:     	testq	%rdi, %rdi
145496861:     	je	0x14549694e <.text+0x549594e>
145496867:     	movq	0x680(%rcx), %rax
14549686e:     	movss	(%rax), %xmm0
145496872:     	ucomiss	0x8d4(%rcx), %xmm0
145496879:     	ja	0x14549694e <.text+0x549594e>
14549687f:     	movq	0x888(%rcx), %r8
145496886:     	movq	0x870(%rcx), %r9
14549688d:     	movq	0x878(%rcx), %r10
145496894:     	leaq	(%r8,%r9), %r11
145496898:     	rolq	$0x17, %r11
14549689c:     	addq	%r9, %r11
14549689f:     	movq	%r10, %rsi
1454968a2:     	shlq	$0x11, %rsi
1454968a6:     	movq	0x880(%rcx), %rbx
1454968ad:     	xorq	%r9, %rbx
1454968b0:     	xorq	%r10, %r8
1454968b3:     	xorq	%rbx, %r10
1454968b6:     	movq	%r10, 0x878(%rcx)
1454968bd:     	xorq	%r8, %r9
1454968c0:     	movq	%r9, 0x870(%rcx)
1454968c7:     	xorq	%rsi, %rbx
1454968ca:     	movq	%rbx, 0x880(%rcx)
1454968d1:     	shrq	$0x28, %r11
1454968d5:     	xorps	%xmm0, %xmm0
1454968d8:     	cvtsi2ss	%r11d, %xmm0
1454968dd:     	rolq	$0x2d, %r8
1454968e1:     	mulss	0x4edc37(%rip), %xmm0   # 0x145984520
1454968e9:     	movq	%r8, 0x888(%rcx)
1454968f0:     	ucomiss	0x411b4d(%rip), %xmm0   # 0x1458a8444
1454968f7:     	jae	0x14549694e <.text+0x549594e>
1454968f9:     	leaq	0x8(%rax), %r9
1454968fd:     	leaq	-0x8(,%rdi,8), %r8
145496905:     	decq	%rdi
145496908:     	movq	%rcx, %rsi
14549690b:     	movq	%rax, %rcx
14549690e:     	movq	%rdx, %rbx
145496911:     	movq	%r9, %rdx
145496914:     	callq	0x1457149f1 <.text+0x57139f1>
145496919:     	movq	%rdi, 0x688(%rsi)
145496920:     	movss	0x8(%rbx), %xmm0
145496925:     	movsd	(%rbx), %xmm1
145496929:     	addps	0x16182f0(%rip), %xmm1  # 0x146aaec20
145496930:     	movlps	%xmm1, 0x20(%rsp)
145496935:     	movss	%xmm0, 0x28(%rsp)
14549693b:     	leaq	0x20(%rsp), %r9
145496940:     	movq	%rsi, %rcx
145496943:     	movl	$0x6, %edx
145496948:     	callq	0x14549d330 <.text+0x549c330>
14549694d:     	nop
14549694e:     	addq	$0x30, %rsp
145496952:     	popq	%rbx
145496953:     	popq	%rdi
145496954:     	popq	%rsi
145496955:     	retq

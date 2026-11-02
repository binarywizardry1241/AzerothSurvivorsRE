
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401661e0:     	pushq	%rbp
1401661e1:     	subq	$0xc0, %rsp
1401661e8:     	leaq	0x80(%rsp), %rbp
1401661f0:     	movq	$-0x2, 0x38(%rbp)
1401661f8:     	movq	0x4(%rcx), %xmm0
1401661fd:     	movd	(%rcx), %xmm1
140166201:     	movzbl	0x30(%rcx), %edx
140166205:     	leaq	0x28(%rcx), %rax
140166209:     	movzbl	0x32(%rcx), %r8d
14016620e:     	addq	$0x2c, %rcx
140166212:     	xorl	%r9d, %r9d
140166215:     	cmpb	$0x1, %r8b
140166219:     	setne	%r9b
14016621d:     	incq	%r9
140166220:     	xorl	%r10d, %r10d
140166223:     	testb	%r8b, %r8b
140166226:     	leaq	0x24(%rbp), %r8
14016622a:     	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
14016622f:     	pslld	$0x1f, %xmm1
140166234:     	psrad	$0x1f, %xmm1
140166239:     	pand	%xmm1, %xmm0
14016623d:     	pandn	0x5c4fb8b(%rip), %xmm1  # 0x145db5dd0
140166245:     	por	%xmm0, %xmm1
140166249:     	movq	%xmm1, 0x20(%rbp)
14016624e:     	cmovneq	%r9, %r10
140166252:     	movb	%dl, 0x37(%rbp)
140166255:     	movq	%r10, 0x18(%rbp)
140166259:     	leaq	0x37(%rbp), %rdx
14016625d:     	movq	%rdx, -0x60(%rbp)
140166261:     	leaq	0x5a44648(%rip), %rdx   # 0x145baa8b0 <.text+0x5ba98b0>
140166268:     	movq	%rdx, -0x58(%rbp)
14016626c:     	leaq	0x20(%rbp), %rdx
140166270:     	movq	%rdx, -0x50(%rbp)
140166274:     	leaq	0x5a47005(%rip), %rdx   # 0x145bad280 <.text+0x5bac280>
14016627b:     	movq	%rdx, -0x48(%rbp)
14016627f:     	movq	%r8, -0x40(%rbp)
140166283:     	movq	%rdx, -0x38(%rbp)
140166287:     	movq	%rax, -0x30(%rbp)
14016628b:     	movq	%rdx, -0x28(%rbp)
14016628f:     	movq	%rcx, -0x20(%rbp)
140166293:     	movq	%rdx, -0x18(%rbp)
140166297:     	leaq	0x18(%rbp), %rax
14016629b:     	movq	%rax, -0x10(%rbp)
14016629f:     	leaq	0x5a48bca(%rip), %rax   # 0x145baee70 <.text+0x5bade70>
1401662a6:     	movq	%rax, -0x8(%rbp)
1401662aa:     	leaq	0x5c50411(%rip), %rdx   # 0x145db66c2
1401662b1:     	movq	%rbp, %rcx
1401662b4:     	leaq	-0x60(%rbp), %r8
1401662b8:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1401662bd:     	movq	0x8(%rbp), %r8
1401662c1:     	movq	0x10(%rbp), %r9
1401662c5:     	leaq	0x5c503f1(%rip), %rcx   # 0x145db66bd
1401662cc:     	movl	$0x5, %edx
1401662d1:     	movq	%r8, 0x28(%rbp)
1401662d5:     	callq	0x1458dc8c0 <.text+0x58db8c0>
1401662da:     	nop
1401662db:     	movq	(%rbp), %rdx
1401662df:     	testq	%rdx, %rdx
1401662e2:     	je	0x1401662f4 <.text+0x1652f4>
1401662e4:     	movl	$0x1, %r8d
1401662ea:     	movq	0x28(%rbp), %rcx
1401662ee:     	callq	0x1400021d0 <.text+0x11d0>
1401662f3:     	nop
1401662f4:     	addq	$0xc0, %rsp
1401662fb:     	popq	%rbp
1401662fc:     	retq

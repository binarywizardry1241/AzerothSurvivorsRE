
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f8050:     	pushq	%rsi
1458f8051:     	pushq	%rdi
1458f8052:     	pushq	%rbx
1458f8053:     	subq	$0x70, %rsp
1458f8057:     	movaps	%xmm6, 0x60(%rsp)
1458f805c:     	xorps	%xmm0, %xmm0
1458f805f:     	ucomiss	%xmm1, %xmm0
1458f8062:     	movq	(%r9), %rdx
1458f8065:     	jae	0x1458f808a <.text+0x58f708a>
1458f8067:     	cmpq	$-0x2, %rdx
1458f806b:     	jne	0x1458f80b8 <.text+0x58f70b8>
1458f806d:     	movaps	%xmm1, %xmm6
1458f8070:     	movq	%rcx, %rdi
1458f8073:     	testl	%r8d, %r8d
1458f8076:     	je	0x1458f80dc <.text+0x58f70dc>
1458f8078:     	leaq	0x30(%rsp), %rcx
1458f807d:     	movq	%rdi, %rdx
1458f8080:     	callq	0x1458f2ee0 <.text+0x58f1ee0>
1458f8085:     	jmp	0x1458f812d <.text+0x58f712d>
1458f808a:     	cmpq	$-0x3, %rdx
1458f808e:     	ja	0x1458f815a <.text+0x58f715a>
1458f8094:     	testq	%rdx, %rdx
1458f8097:     	je	0x1458f815a <.text+0x58f715a>
1458f809d:     	movq	0x8(%r9), %rcx
1458f80a1:     	movl	$0x1, %r8d
1458f80a7:     	movaps	0x60(%rsp), %xmm6
1458f80ac:     	addq	$0x70, %rsp
1458f80b0:     	popq	%rbx
1458f80b1:     	popq	%rdi
1458f80b2:     	popq	%rsi
1458f80b3:     	jmp	0x1400021d0 <.text+0x11d0>
1458f80b8:     	movq	%rdx, 0x30(%rsp)
1458f80bd:     	movups	0x8(%r9), %xmm0
1458f80c2:     	movups	0x18(%r9), %xmm2
1458f80c7:     	movups	%xmm0, 0x38(%rsp)
1458f80cc:     	movups	%xmm2, 0x48(%rsp)
1458f80d1:     	movq	0x28(%r9), %rax
1458f80d5:     	movq	%rax, 0x58(%rsp)
1458f80da:     	jmp	0x1458f8133 <.text+0x58f7133>
1458f80dc:     	leaq	0x158120d(%rip), %rsi   # 0x146e792f0
1458f80e3:     	movl	$0x5, %ebx
1458f80e8:     	movl	$0x5, %edx
1458f80ed:     	movq	%rsi, %rcx
1458f80f0:     	callq	0x1458da590 <.text+0x58d9590>
1458f80f5:     	testq	%rax, %rax
1458f80f8:     	cmoveq	%rsi, %rax
1458f80fc:     	cmoveq	%rbx, %rdx
1458f8100:     	movq	$-0x1, 0x30(%rsp)
1458f8109:     	movq	%rax, 0x38(%rsp)
1458f810e:     	movq	%rdx, 0x40(%rsp)
1458f8113:     	leaq	0x15811db(%rip), %rax   # 0x146e792f5
1458f811a:     	movq	%rax, 0x48(%rsp)
1458f811f:     	movq	$0x18, 0x50(%rsp)
1458f8128:     	movb	$0x0, 0x58(%rsp)
1458f812d:     	movq	%rdi, %rcx
1458f8130:     	movaps	%xmm6, %xmm1
1458f8133:     	addq	$0x678, %rcx            # imm = 0x678
1458f813a:     	xorps	%xmm2, %xmm2
1458f813d:     	cvtss2sd	%xmm1, %xmm2
1458f8141:     	movq	$0x0, 0x20(%rsp)
1458f814a:     	leaq	0x30(%rsp), %rdx
1458f814f:     	movl	$0x8, %r9d
1458f8155:     	callq	0x14595f3c0 <.text+0x595e3c0>
1458f815a:     	movaps	0x60(%rsp), %xmm6
1458f815f:     	addq	$0x70, %rsp
1458f8163:     	popq	%rbx
1458f8164:     	popq	%rdi
1458f8165:     	popq	%rsi
1458f8166:     	retq

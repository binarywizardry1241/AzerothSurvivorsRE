; default-disabled
145900d5f:     	movl	$0x0, 0x978(%rbp)

; sink-enable-deadline-and-env
1459021c8:     	cmpl	$0x1, 0x948(%r13)
1459021d0:     	jne	0x145902512 <.text+0x5901512>
1459021d6:     	movss	0xa50(%r13), %xmm0
1459021df:     	ucomiss	%xmm7, %xmm0
1459021e2:     	ja	0x145902512 <.text+0x5901512>
1459021e8:     	addss	0x94c(%r13), %xmm7
1459021f1:     	movss	%xmm7, 0xa50(%r13)
1459021fa:     	leaq	0x1576be8(%rip), %rdx   # 0x146e78de9
145902201:     	leaq	0xa0(%rbp), %rcx
145902208:     	movl	$0x11, %r8d
14590220e:     	callq	0x145b8d010 <.text+0x5b8c010>

; sink-position-and-floor
1459022f9:     	leaq	0x4c8(%r13), %rdi
145902300:     	movq	0x240(%rbp), %r9
145902307:     	testq	%r9, %r9
14590230a:     	je	0x145902330 <.text+0x5901330>
14590230c:     	movq	0x238(%rbp), %r8
145902313:     	movq	0x9a8(%r13), %rcx
14590231a:     	movq	%rcx, %rax
14590231d:     	orq	%r9, %rax
145902320:     	shrq	$0x20, %rax
145902324:     	je	0x145902343 <.text+0x5901343>
145902326:     	movq	%rcx, %rax
145902329:     	xorl	%edx, %edx
14590232b:     	divq	%r9
14590232e:     	jmp	0x14590234a <.text+0x590134a>
145902330:     	leaq	0x4cc(%r13), %rax
145902337:     	movq	0x9a8(%r13), %rcx
14590233e:     	movq	%rdi, %r9
145902341:     	jmp	0x145902356 <.text+0x5901356>
145902343:     	movl	%ecx, %eax
145902345:     	xorl	%edx, %edx
145902347:     	divl	%r9d
14590234a:     	leaq	(%r8,%rdx,8), %r9
14590234e:     	leaq	(%r8,%rdx,8), %rax
145902352:     	addq	$0x4, %rax
145902356:     	movss	(%r9), %xmm7
14590235b:     	movss	(%rax), %xmm8
145902360:     	incq	%rcx
145902363:     	movq	%rcx, 0x9a8(%r13)
14590236a:     	movq	0x950(%r13), %rcx
145902371:     	cmpq	$-0x1, 0x68(%rcx)
145902376:     	je	0x1459024e5 <.text+0x59014e5>
14590237c:     	addq	$0x68, %rcx
145902380:     	movaps	%xmm7, %xmm1
145902383:     	movaps	%xmm8, %xmm2
145902387:     	callq	0x1458cac10 <.text+0x58c9c10>
14590238c:     	nop
14590238d:     	testb	$0x1, %al
14590238f:     	je	0x1459024e5 <.text+0x59014e5>
145902395:     	addss	0x498b23(%rip), %xmm0   # 0x145d9aec0
14590239d:     	movss	%xmm7, 0x2c0(%rbp)
1459023a5:     	movss	%xmm8, 0x2c4(%rbp)
1459023ae:     	movss	%xmm0, 0x2c8(%rbp)

; sink-pending-report-guard
1459024a4:     	movl	$0x1, 0x9b0(%r13)
1459024af:     	movq	0x2c0(%rbp), %rax
1459024b6:     	movq	%rax, 0x9b4(%r13)
1459024bd:     	movl	0x2c8(%rbp), %eax
1459024c3:     	movl	%eax, 0x9bc(%r13)
1459024ca:     	movb	$0xc, 0x9c0(%r13)
1459024d2:     	movl	0x2c8(%rbp), %eax
1459024d8:     	movl	%eax, 0x8(%rdi)
1459024db:     	movq	0x2c0(%rbp), %rax
1459024e2:     	movq	%rax, (%rdi)

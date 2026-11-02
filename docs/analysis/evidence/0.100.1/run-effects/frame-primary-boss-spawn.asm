1454bb099:     	cmpq	$0x5, %rax
1454bb09d:     	jae	0x1454bb0e7 <.text+0x54ba0e7>
1454bb09f:     	movq	0x338(%rbp), %rcx
1454bb0a6:     	movq	0x88(%rcx), %rdx
1454bb0ad:     	imulq	$0x58, %rax, %rcx
1454bb0b1:     	movss	0x68(%rbp), %xmm1
1454bb0b6:     	ucomiss	0x40(%rdx,%rcx), %xmm1
1454bb0bb:     	jb	0x1454bb1b6 <.text+0x54ba1b6>
1454bb0c1:     	addq	%rcx, %rdx
1454bb0c4:     	incq	%rax
1454bb0c7:     	movq	%rax, 0x8d0(%r13)
1454bb0ce:     	movq	%r13, %rcx
1454bb0d1:     	callq	0x1454d11f0 <.text+0x54d01f0>
1454bb0d6:     	nop
1454bb0d7:     	movq	0xa8(%rbp), %rax
1454bb0de:     	movss	(%rax), %xmm0
1454bb0e2:     	jmp	0x1454bb1b6 <.text+0x54ba1b6>

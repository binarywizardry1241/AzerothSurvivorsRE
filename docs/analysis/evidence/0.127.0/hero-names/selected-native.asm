// name-letter
145b20840:     	pushq	%rsi
145b20841:     	subq	$0x20, %rsp
145b20845:     	cmpl	$0x60, %ecx
145b20848:     	jbe	0x145b208a5 <.text+0x5b1f8a5>
145b2084a:     	movb	$0x1, %al
145b2084c:     	cmpl	$0x7b, %ecx
145b2084f:     	jb	0x145b208ae <.text+0x5b1f8ae>
145b20851:     	cmpl	$0xaa, %ecx
145b20857:     	jb	0x145b208b4 <.text+0x5b1f8b4>
145b20859:     	movq	%rcx, %rsi
145b2085c:     	callq	0x14603d250 <.text+0x603c250>
145b20861:     	testb	%al, %al
145b20863:     	je	0x145b208b4 <.text+0x5b1f8b4>
145b20865:     	movq	%rsi, %rcx
145b20868:     	movl	%ecx, %eax
145b2086a:     	andl	$0x1fffc0, %eax         # imm = 0x1FFFC0
145b2086f:     	cmpl	$0xc0, %eax
145b20874:     	movb	$0x1, %al
145b20876:     	je	0x145b208ae <.text+0x5b1f8ae>
145b20878:     	cmpl	$0x453, %ecx            # imm = 0x453
145b2087e:     	jle	0x145b208bc <.text+0x5b1f8bc>
145b20880:     	leal	-0x454(%rcx), %edx
145b20886:     	cmpl	$0x3d, %edx
145b20889:     	ja	0x145b2089b <.text+0x5b1f89b>
145b2088b:     	movabsq	$0x300000000000000d, %r8 # imm = 0x300000000000000D
145b20895:     	btq	%rdx, %r8
145b20899:     	jb	0x145b208ae <.text+0x5b1f8ae>
145b2089b:     	cmpl	$0x3005, %ecx           # imm = 0x3005
145b208a1:     	je	0x145b208ae <.text+0x5b1f8ae>
145b208a3:     	jmp	0x145b208db <.text+0x5b1f8db>
145b208a5:     	addl	$-0x41, %ecx
145b208a8:     	cmpl	$0x1a, %ecx
145b208ab:     	setb	%al
145b208ae:     	addq	$0x20, %rsp
145b208b2:     	popq	%rsi
145b208b3:     	retq
145b208b4:     	xorl	%eax, %eax
145b208b6:     	addq	$0x20, %rsp
145b208ba:     	popq	%rsi
145b208bb:     	retq
145b208bc:     	leal	-0x401(%rcx), %edx
145b208c2:     	cmpl	$0x6, %edx
145b208c5:     	ja	0x145b208d3 <.text+0x5b1f8d3>
145b208c7:     	movl	$0x69, %r8d
145b208cd:     	btl	%edx, %r8d
145b208d1:     	jb	0x145b208ae <.text+0x5b1f8ae>
145b208d3:     	cmpl	$0x451, %ecx            # imm = 0x451
145b208d9:     	je	0x145b208ae <.text+0x5b1f8ae>
145b208db:     	movd	%ecx, %xmm0
145b208df:     	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
145b208e4:     	paddd	0x1523a64(%rip), %xmm0  # 0x147044350
145b208ec:     	leal	-0x4e00(%rcx), %edx
145b208f2:     	cmpl	$0x5200, %edx           # imm = 0x5200
145b208f8:     	setb	%dl
145b208fb:     	leal	-0xf900(%rcx), %r8d
145b20902:     	cmpl	$0x200, %r8d            # imm = 0x200
145b20909:     	setb	%r8b
145b2090d:     	leal	-0xac00(%rcx), %r9d
145b20914:     	cmpl	$0x2ba4, %r9d           # imm = 0x2BA4
145b2091b:     	setb	%r9b
145b2091f:     	pxor	0x6ec969(%rip), %xmm0   # 0x14620d290
145b20927:     	pcmpgtd	0x1523a31(%rip), %xmm0  # 0x147044360
145b2092f:     	movmskps	%xmm0, %r10d
145b20933:     	cmpl	$0xf, %r10d
145b20937:     	setne	%r10b
145b2093b:     	orb	%dl, %r8b
145b2093e:     	orb	%r9b, %r8b
145b20941:     	orb	%r10b, %r8b
145b20944:     	jne	0x145b208ae <.text+0x5b1f8ae>
145b2094a:     	addq	$0x20, %rsp
145b2094e:     	popq	%rsi
145b2094f:     	jmp	0x145b23e90 <.text+0x5b22e90>
// name-validator
145b20960:     	pushq	%r15
145b20962:     	pushq	%r14
145b20964:     	pushq	%rsi
145b20965:     	pushq	%rdi
145b20966:     	pushq	%rbp
145b20967:     	pushq	%rbx
145b20968:     	subq	$0x68, %rsp
145b2096c:     	callq	0x140207170 <.text+0x206170>
145b20971:     	movq	%rax, %rbx
145b20974:     	movq	%rdx, %rdi
145b20977:     	movq	%rax, %rcx
145b2097a:     	cmpq	$0x20, %rdx
145b2097e:     	jae	0x145b20a3a <.text+0x5b1fa3a>
145b20984:     	movq	%rdi, %rdx
145b20987:     	callq	0x14603cbd0 <.text+0x603bbd0>
145b2098c:     	movq	%rax, %rsi
145b2098f:     	testq	%rax, %rax
145b20992:     	je	0x145b20a4e <.text+0x5b1fa4e>
145b20998:     	movq	%rbx, %r14
145b2099b:     	addq	%rdi, %r14
145b2099e:     	movq	%rbx, %r15
145b209a1:     	jmp	0x145b209c8 <.text+0x5b1f9c8>
145b209a3:     	nopw	%cs:(%rax,%rax)
145b209b0:     	incq	%r15
145b209b3:     	movl	%ebp, %ecx
145b209b5:     	callq	0x145b20840 <.text+0x5b1f840>
145b209ba:     	cmpl	$0x20, %ebp
145b209bd:     	sete	%cl
145b209c0:     	orb	%al, %cl
145b209c2:     	je	0x145b20af1 <.text+0x5b1faf1>
145b209c8:     	cmpq	%r14, %r15
145b209cb:     	je	0x145b20a55 <.text+0x5b1fa55>
145b209d1:     	movzbl	(%r15), %ecx
145b209d5:     	movzbl	%cl, %ebp
145b209d8:     	testb	%bpl, %bpl
145b209db:     	jns	0x145b209b0 <.text+0x5b1f9b0>
145b209dd:     	movl	%ebp, %eax
145b209df:     	andl	$0x1f, %eax
145b209e2:     	movzbl	0x1(%r15), %edx
145b209e7:     	andl	$0x3f, %edx
145b209ea:     	cmpb	$-0x21, %bpl
145b209ee:     	jbe	0x145b20a1f <.text+0x5b1fa1f>
145b209f0:     	movzbl	0x2(%r15), %ebp
145b209f5:     	shll	$0x6, %edx
145b209f8:     	andl	$0x3f, %ebp
145b209fb:     	orl	%edx, %ebp
145b209fd:     	cmpb	$-0x10, %cl
145b20a00:     	jb	0x145b20a2c <.text+0x5b1fa2c>
145b20a02:     	movzbl	0x3(%r15), %ecx
145b20a07:     	addq	$0x4, %r15
145b20a0b:     	andl	$0x7, %eax
145b20a0e:     	shll	$0x12, %eax
145b20a11:     	shll	$0x6, %ebp
145b20a14:     	andl	$0x3f, %ecx
145b20a17:     	orl	%ebp, %ecx
145b20a19:     	orl	%eax, %ecx
145b20a1b:     	movl	%ecx, %ebp
145b20a1d:     	jmp	0x145b209b3 <.text+0x5b1f9b3>
145b20a1f:     	addq	$0x2, %r15
145b20a23:     	shll	$0x6, %eax
145b20a26:     	orl	%edx, %eax
145b20a28:     	movl	%eax, %ebp
145b20a2a:     	jmp	0x145b209b3 <.text+0x5b1f9b3>
145b20a2c:     	addq	$0x3, %r15
145b20a30:     	shll	$0xc, %eax
145b20a33:     	orl	%eax, %ebp
145b20a35:     	jmp	0x145b209b3 <.text+0x5b1f9b3>
145b20a3a:     	movq	%rdi, %rdx
145b20a3d:     	callq	0x14603c5b0 <.text+0x603b5b0>
145b20a42:     	movq	%rax, %rsi
145b20a45:     	testq	%rax, %rax
145b20a48:     	jne	0x145b20998 <.text+0x5b1f998>
145b20a4e:     	xorl	%eax, %eax
145b20a50:     	jmp	0x145b20af3 <.text+0x5b1faf3>
145b20a55:     	leaq	0x15251af(%rip), %rcx   # 0x147045c0b
145b20a5c:     	movl	$0x2, %edx
145b20a61:     	movq	%rbx, %r8
145b20a64:     	movq	%rdi, %r9
145b20a67:     	callq	0x145b25170 <.text+0x5b24170>
145b20a6c:     	movl	%eax, %ecx
145b20a6e:     	movb	$0x5, %al
145b20a70:     	testb	%cl, %cl
145b20a72:     	jne	0x145b20af3 <.text+0x5b1faf3>
145b20a74:     	movq	%rbx, 0x20(%rsp)
145b20a79:     	movq	%rdi, 0x28(%rsp)
145b20a7e:     	movq	$0x0, 0x30(%rsp)
145b20a87:     	movq	%rdi, 0x38(%rsp)
145b20a8c:     	movabsq	$0x2000000020, %rax     # imm = 0x2000000020
145b20a96:     	movq	%rax, 0x40(%rsp)
145b20a9b:     	movb	$0x1, 0x48(%rsp)
145b20aa0:     	movq	$-0x1, %r14
145b20aa7:     	leaq	0x50(%rsp), %rdi
145b20aac:     	leaq	0x20(%rsp), %rbx
145b20ab1:     	nopw	%cs:(%rax,%rax)
145b20ac0:     	movq	%rdi, %rcx
145b20ac3:     	movq	%rbx, %rdx
145b20ac6:     	callq	0x145b24730 <.text+0x5b23730>
145b20acb:     	incq	%r14
145b20ace:     	cmpb	$0x0, 0x50(%rsp)
145b20ad3:     	jne	0x145b20ac0 <.text+0x5b1fac0>
145b20ad5:     	movb	$0x4, %al
145b20ad7:     	cmpq	$0x1, %r14
145b20adb:     	ja	0x145b20af3 <.text+0x5b1faf3>
145b20add:     	movb	$0x1, %al
145b20adf:     	cmpq	$0x1, %rsi
145b20ae3:     	je	0x145b20af3 <.text+0x5b1faf3>
145b20ae5:     	xorl	%eax, %eax
145b20ae7:     	cmpq	$0x15, %rsi
145b20aeb:     	sbbl	%eax, %eax
145b20aed:     	orb	$0x2, %al
145b20aef:     	jmp	0x145b20af3 <.text+0x5b1faf3>
145b20af1:     	movb	$0x3, %al
145b20af3:     	addq	$0x68, %rsp
145b20af7:     	popq	%rbx
145b20af8:     	popq	%rbp
145b20af9:     	popq	%rdi
145b20afa:     	popq	%rsi
145b20afb:     	popq	%r14
145b20afd:     	popq	%r15
145b20aff:     	retq
// name-option
145b20be0:     	pushq	%rsi
145b20be1:     	pushq	%rdi
145b20be2:     	pushq	%rbx
145b20be3:     	subq	$0x20, %rsp
145b20be7:     	movq	%r8, %rdi
145b20bea:     	movq	%rdx, %rbx
145b20bed:     	movq	%rcx, %rsi
145b20bf0:     	movq	%rdx, %rcx
145b20bf3:     	movq	%r8, %rdx
145b20bf6:     	callq	0x145b20960 <.text+0x5b1f960>
145b20bfb:     	cmpb	$-0x1, %al
145b20bfd:     	je	0x145b20c08 <.text+0x5b1fc08>
145b20bff:     	movq	$-0x1, (%rsi)
145b20c06:     	jmp	0x145b20c21 <.text+0x5b1fc21>
145b20c08:     	movq	%rbx, %rcx
145b20c0b:     	movq	%rdi, %rdx
145b20c0e:     	callq	0x140207170 <.text+0x206170>
145b20c13:     	movq	%rdx, %r8
145b20c16:     	movq	%rsi, %rcx
145b20c19:     	movq	%rax, %rdx
145b20c1c:     	callq	0x145b20ed0 <.text+0x5b1fed0>
145b20c21:     	movq	%rsi, %rax
145b20c24:     	addq	$0x20, %rsp
145b20c28:     	popq	%rbx
145b20c29:     	popq	%rdi
145b20c2a:     	popq	%rsi
145b20c2b:     	retq
// name-titlecase
145b20ed0:     	pushq	%rbp
145b20ed1:     	pushq	%r15
145b20ed3:     	pushq	%r14
145b20ed5:     	pushq	%r13
145b20ed7:     	pushq	%r12
145b20ed9:     	pushq	%rsi
145b20eda:     	pushq	%rdi
145b20edb:     	pushq	%rbx
145b20edc:     	subq	$0x88, %rsp
145b20ee3:     	leaq	0x80(%rsp), %rbp
145b20eeb:     	movq	$-0x2, (%rbp)
145b20ef3:     	movq	%r8, %rdi
145b20ef6:     	testq	%r8, %r8
145b20ef9:     	jns	0x145b20f0a <.text+0x5b1ff0a>
145b20efb:     	xorl	%esi, %esi
145b20efd:     	movq	%rsi, %rcx
145b20f00:     	movq	%rdi, %rdx
145b20f03:     	callq	0x14620896b <.text+0x620796b>
145b20f08:     	ud2
145b20f0a:     	movq	%rcx, -0x50(%rbp)
145b20f0e:     	je	0x145b211fc <.text+0x5b201fc>
145b20f14:     	movq	%rdx, %rbx
145b20f17:     	callq	0x140002200 <.text+0x1200>
145b20f1c:     	movl	$0x1, %esi
145b20f21:     	movl	$0x1, %edx
145b20f26:     	movq	%rdi, %rcx
145b20f29:     	callq	0x1400021c0 <.text+0x11c0>
145b20f2e:     	testq	%rax, %rax
145b20f31:     	je	0x145b20efd <.text+0x5b1fefd>
145b20f33:     	movq	%rax, %r13
145b20f36:     	movq	%rdi, -0x18(%rbp)
145b20f3a:     	movq	%rax, -0x10(%rbp)
145b20f3e:     	movq	$0x0, -0x8(%rbp)
145b20f46:     	addq	%rbx, %rdi
145b20f49:     	movb	$0x1, %al
145b20f4b:     	xorl	%r14d, %r14d
145b20f4e:     	jmp	0x145b20f79 <.text+0x5b1ff79>
145b20f50:     	orb	$-0x40, %cl
145b20f53:     	movb	%cl, (%r13,%r14)
145b20f58:     	movb	%al, 0x1(%r13,%r14)
145b20f5d:     	movl	$0x2, %eax
145b20f62:     	addq	%rax, %r14
145b20f65:     	movq	%r14, -0x8(%rbp)
145b20f69:     	cmpl	$0x20, %r12d
145b20f6d:     	sete	%al
145b20f70:     	cmpq	%rdi, %rbx
145b20f73:     	je	0x145b21214 <.text+0x5b20214>
145b20f79:     	movzbl	(%rbx), %edx
145b20f7c:     	movzbl	%dl, %r12d
145b20f80:     	testb	%r12b, %r12b
145b20f83:     	js	0x145b20fa0 <.text+0x5b1ffa0>
145b20f85:     	incq	%rbx
145b20f88:     	testb	$0x1, %al
145b20f8a:     	jne	0x145b21010 <.text+0x5b20010>
145b20f90:     	jmp	0x145b21080 <.text+0x5b20080>
145b20f95:     	nopw	%cs:(%rax,%rax)
145b20fa0:     	movl	%r12d, %ecx
145b20fa3:     	andl	$0x1f, %ecx
145b20fa6:     	movzbl	0x1(%rbx), %r8d
145b20fab:     	andl	$0x3f, %r8d
145b20faf:     	cmpb	$-0x21, %r12b
145b20fb3:     	jbe	0x145b20ff4 <.text+0x5b1fff4>
145b20fb5:     	movzbl	0x2(%rbx), %r12d
145b20fba:     	shll	$0x6, %r8d
145b20fbe:     	andl	$0x3f, %r12d
145b20fc2:     	orl	%r8d, %r12d
145b20fc5:     	cmpb	$-0x10, %dl
145b20fc8:     	jb	0x145b2106b <.text+0x5b2006b>
145b20fce:     	movzbl	0x3(%rbx), %edx
145b20fd2:     	addq	$0x4, %rbx
145b20fd6:     	andl	$0x7, %ecx
145b20fd9:     	shll	$0x12, %ecx
145b20fdc:     	shll	$0x6, %r12d
145b20fe0:     	andl	$0x3f, %edx
145b20fe3:     	orl	%r12d, %edx
145b20fe6:     	orl	%ecx, %edx
145b20fe8:     	movl	%edx, %r12d
145b20feb:     	testb	$0x1, %al
145b20fed:     	jne	0x145b21010 <.text+0x5b20010>
145b20fef:     	jmp	0x145b21080 <.text+0x5b20080>
145b20ff4:     	addq	$0x2, %rbx
145b20ff8:     	shll	$0x6, %ecx
145b20ffb:     	orl	%r8d, %ecx
145b20ffe:     	movl	%ecx, %r12d
145b21001:     	testb	$0x1, %al
145b21003:     	je	0x145b21080 <.text+0x5b20080>
145b21005:     	nopw	%cs:(%rax,%rax)
145b21010:     	leaq	-0x24(%rbp), %rcx
145b21014:     	movl	%r12d, %edx
145b21017:     	callq	0x14603d4e0 <.text+0x603c4e0>
145b2101c:     	nop
145b2101d:     	cmpl	$0x1, -0x20(%rbp)
145b21021:     	movl	-0x1c(%rbp), %eax
145b21024:     	movl	$0x2, %ecx
145b21029:     	sbbq	$0x0, %rcx
145b2102d:     	testl	%eax, %eax
145b2102f:     	movl	$0x3, %edx
145b21034:     	cmovneq	%rdx, %rcx
145b21038:     	leaq	-0x38(%rbp), %rdx
145b2103c:     	movl	%eax, 0x8(%rdx)
145b2103f:     	movq	-0x24(%rbp), %rax
145b21043:     	movq	%rax, (%rdx)
145b21046:     	movq	$0x0, -0x48(%rbp)
145b2104e:     	movq	%rcx, -0x40(%rbp)
145b21052:     	leaq	-0x48(%rbp), %rcx
145b21056:     	callq	0x146046180 <.text+0x6045180>
145b2105b:     	nop
145b2105c:     	movl	%eax, %r15d
145b2105f:     	leaq	-0x48(%rbp), %rcx
145b21063:     	callq	0x146046180 <.text+0x6045180>
145b21068:     	nop
145b21069:     	jmp	0x145b210d9 <.text+0x5b200d9>
145b2106b:     	addq	$0x3, %rbx
145b2106f:     	shll	$0xc, %ecx
145b21072:     	orl	%ecx, %r12d
145b21075:     	testb	$0x1, %al
145b21077:     	jne	0x145b21010 <.text+0x5b20010>
145b21079:     	nopl	(%rax)
145b21080:     	leaq	-0x24(%rbp), %rcx
145b21084:     	movl	%r12d, %edx
145b21087:     	callq	0x14603d470 <.text+0x603c470>
145b2108c:     	nop
145b2108d:     	cmpl	$0x1, -0x20(%rbp)
145b21091:     	movl	-0x1c(%rbp), %eax
145b21094:     	movl	$0x2, %ecx
145b21099:     	sbbq	$0x0, %rcx
145b2109d:     	testl	%eax, %eax
145b2109f:     	movl	$0x3, %edx
145b210a4:     	cmovneq	%rdx, %rcx
145b210a8:     	leaq	-0x38(%rbp), %rdx
145b210ac:     	movl	%eax, 0x8(%rdx)
145b210af:     	movq	-0x24(%rbp), %rax
145b210b3:     	movq	%rax, (%rdx)
145b210b6:     	movq	$0x0, -0x48(%rbp)
145b210be:     	movq	%rcx, -0x40(%rbp)
145b210c2:     	leaq	-0x48(%rbp), %rcx
145b210c6:     	callq	0x146046180 <.text+0x6045180>
145b210cb:     	nop
145b210cc:     	movl	%eax, %r15d
145b210cf:     	leaq	-0x48(%rbp), %rcx
145b210d3:     	callq	0x146046180 <.text+0x6045180>
145b210d8:     	nop
145b210d9:     	cmpl	$-0x1, %eax
145b210dc:     	movl	%r12d, %esi
145b210df:     	cmovel	%r15d, %esi
145b210e3:     	cmpl	$-0x1, %r15d
145b210e7:     	cmovel	%r12d, %esi
145b210eb:     	cmpl	$0x80, %esi
145b210f1:     	jae	0x145b21110 <.text+0x5b20110>
145b210f3:     	cmpq	%r14, -0x18(%rbp)
145b210f7:     	je	0x145b211b0 <.text+0x5b201b0>
145b210fd:     	movq	-0x10(%rbp), %r13
145b21101:     	movb	%sil, (%r13,%r14)
145b21106:     	movl	$0x1, %eax
145b2110b:     	jmp	0x145b20f62 <.text+0x5b1ff62>
145b21110:     	cmpl	$0x10000, %esi          # imm = 0x10000
145b21116:     	movl	$0x4, %r8d
145b2111c:     	sbbq	$0x0, %r8
145b21120:     	cmpl	$0x800, %esi            # imm = 0x800
145b21126:     	movl	$0x2, %eax
145b2112b:     	cmovbq	%rax, %r8
145b2112f:     	movq	-0x18(%rbp), %rax
145b21133:     	subq	%r14, %rax
145b21136:     	cmpq	%rax, %r8
145b21139:     	ja	0x145b211d7 <.text+0x5b201d7>
145b2113f:     	movl	%esi, %eax
145b21141:     	andb	$0x3f, %al
145b21143:     	orb	$-0x80, %al
145b21145:     	movl	%esi, %ecx
145b21147:     	shrl	$0x6, %ecx
145b2114a:     	cmpl	$0x800, %esi            # imm = 0x800
145b21150:     	jb	0x145b20f50 <.text+0x5b1ff50>
145b21156:     	andb	$0x3f, %cl
145b21159:     	orb	$-0x80, %cl
145b2115c:     	movl	%esi, %edx
145b2115e:     	shrl	$0xc, %edx
145b21161:     	cmpl	$0xffff, %esi           # imm = 0xFFFF
145b21167:     	ja	0x145b21185 <.text+0x5b20185>
145b21169:     	orb	$-0x20, %dl
145b2116c:     	movb	%dl, (%r13,%r14)
145b21171:     	movb	%cl, 0x1(%r13,%r14)
145b21176:     	movb	%al, 0x2(%r13,%r14)
145b2117b:     	movl	$0x3, %eax
145b21180:     	jmp	0x145b20f62 <.text+0x5b1ff62>
145b21185:     	andb	$0x3f, %dl
145b21188:     	orb	$-0x80, %dl
145b2118b:     	shrl	$0x12, %esi
145b2118e:     	orb	$-0x10, %sil
145b21192:     	movb	%sil, (%r13,%r14)
145b21197:     	movb	%dl, 0x1(%r13,%r14)
145b2119c:     	movb	%cl, 0x2(%r13,%r14)
145b211a1:     	movb	%al, 0x3(%r13,%r14)
145b211a6:     	movl	$0x4, %eax
145b211ab:     	jmp	0x145b20f62 <.text+0x5b1ff62>
145b211b0:     	movq	$0x1, 0x20(%rsp)
145b211b9:     	movl	$0x1, %r8d
145b211bf:     	movl	$0x1, %r9d
145b211c5:     	leaq	-0x18(%rbp), %rcx
145b211c9:     	movq	%r14, %rdx
145b211cc:     	callq	0x146061b30 <.text+0x6060b30>
145b211d1:     	nop
145b211d2:     	jmp	0x145b210fd <.text+0x5b200fd>
145b211d7:     	movq	$0x1, 0x20(%rsp)
145b211e0:     	movl	$0x1, %r9d
145b211e6:     	leaq	-0x18(%rbp), %rcx
145b211ea:     	movq	%r14, %rdx
145b211ed:     	callq	0x146061b30 <.text+0x6060b30>
145b211f2:     	nop
145b211f3:     	movq	-0x10(%rbp), %r13
145b211f7:     	jmp	0x145b2113f <.text+0x5b2013f>
145b211fc:     	movq	$0x0, -0x18(%rbp)
145b21204:     	movq	$0x1, -0x10(%rbp)
145b2120c:     	movq	$0x0, -0x8(%rbp)
145b21214:     	movq	-0x8(%rbp), %rcx
145b21218:     	movq	-0x50(%rbp), %rax
145b2121c:     	movq	%rcx, 0x10(%rax)
145b21220:     	movq	-0x18(%rbp), %rcx
145b21224:     	movq	%rcx, (%rax)
145b21227:     	movq	-0x10(%rbp), %rcx
145b2122b:     	movq	%rcx, 0x8(%rax)
145b2122f:     	addq	$0x88, %rsp
145b21236:     	popq	%rbx
145b21237:     	popq	%rdi
145b21238:     	popq	%rsi
145b21239:     	popq	%r12
145b2123b:     	popq	%r13
145b2123d:     	popq	%r14
145b2123f:     	popq	%r15
145b21241:     	popq	%rbp
145b21242:     	retq
// name-trim
140207170:     	pushq	%rsi
140207171:     	pushq	%rdi
140207172:     	pushq	%rbp
140207173:     	pushq	%rbx
140207174:     	movq	%rcx, %rax
140207177:     	leaq	(%rcx,%rdx), %r8
14020717b:     	testq	%rdx, %rdx
14020717e:     	je	0x1402072c2 <.text+0x2062c2>
140207184:     	movq	0x8457a75(%rip), %r10   # 0x14865ec00
14020718b:     	xorl	%edx, %edx
14020718d:     	movq	%rax, %r9
140207190:     	jmp	0x1402071b9 <.text+0x2061b9>
140207192:     	movzbl	%r11b, %r11d
140207196:     	movzbl	(%r10,%r11), %r11d
14020719b:     	shrb	%r11b
14020719e:     	testb	$0x1, %r11b
1402071a2:     	je	0x1402072c9 <.text+0x2062c9>
1402071a8:     	nopl	(%rax,%rax)
1402071b0:     	cmpq	%r8, %r9
1402071b3:     	je	0x1402072b9 <.text+0x2062b9>
1402071b9:     	movq	%r9, %rsi
1402071bc:     	movq	%rdx, %rcx
1402071bf:     	movzbl	(%r9), %r9d
1402071c3:     	movzbl	%r9b, %r11d
1402071c7:     	testb	%r11b, %r11b
1402071ca:     	js	0x1402071e0 <.text+0x2061e0>
1402071cc:     	leaq	0x1(%rsi), %r9
1402071d0:     	jmp	0x140207240 <.text+0x206240>
1402071d2:     	nopw	%cs:(%rax,%rax)
1402071e0:     	movl	%r11d, %edx
1402071e3:     	andl	$0x1f, %edx
1402071e6:     	movzbl	0x1(%rsi), %edi
1402071ea:     	andl	$0x3f, %edi
1402071ed:     	cmpb	$-0x21, %r11b
1402071f1:     	jbe	0x140207227 <.text+0x206227>
1402071f3:     	movzbl	0x2(%rsi), %r11d
1402071f8:     	shll	$0x6, %edi
1402071fb:     	andl	$0x3f, %r11d
1402071ff:     	orl	%edi, %r11d
140207202:     	cmpb	$-0x10, %r9b
140207206:     	jb	0x140207235 <.text+0x206235>
140207208:     	leaq	0x4(%rsi), %r9
14020720c:     	movzbl	0x3(%rsi), %edi
140207210:     	andl	$0x7, %edx
140207213:     	shll	$0x12, %edx
140207216:     	shll	$0x6, %r11d
14020721a:     	andl	$0x3f, %edi
14020721d:     	orl	%r11d, %edi
140207220:     	orl	%edx, %edi
140207222:     	movl	%edi, %r11d
140207225:     	jmp	0x140207240 <.text+0x206240>
140207227:     	leaq	0x2(%rsi), %r9
14020722b:     	shll	$0x6, %edx
14020722e:     	orl	%edi, %edx
140207230:     	movl	%edx, %r11d
140207233:     	jmp	0x140207240 <.text+0x206240>
140207235:     	leaq	0x3(%rsi), %r9
140207239:     	shll	$0xc, %edx
14020723c:     	orl	%edx, %r11d
14020723f:     	nop
140207240:     	movq	%r9, %rdx
140207243:     	subq	%rsi, %rdx
140207246:     	addq	%rcx, %rdx
140207249:     	leal	-0x9(%r11), %esi
14020724d:     	cmpl	$0x5, %esi
140207250:     	jb	0x1402071b0 <.text+0x2061b0>
140207256:     	cmpl	$0x20, %r11d
14020725a:     	je	0x1402071b0 <.text+0x2061b0>
140207260:     	cmpl	$0x85, %r11d
140207267:     	jb	0x1402072c9 <.text+0x2062c9>
140207269:     	movl	%r11d, %esi
14020726c:     	shrl	$0x8, %esi
14020726f:     	cmpl	$0x1f, %esi
140207272:     	jg	0x14020728d <.text+0x20628d>
140207274:     	testl	%esi, %esi
140207276:     	je	0x1402072ab <.text+0x2062ab>
140207278:     	cmpl	$0x16, %esi
14020727b:     	jne	0x1402072c9 <.text+0x2062c9>
14020727d:     	cmpl	$0x1680, %r11d          # imm = 0x1680
140207284:     	sete	%r11b
140207288:     	jmp	0x14020719e <.text+0x20619e>
14020728d:     	cmpl	$0x20, %esi
140207290:     	je	0x140207192 <.text+0x206192>
140207296:     	cmpl	$0x30, %esi
140207299:     	jne	0x1402072c9 <.text+0x2062c9>
14020729b:     	cmpl	$0x3000, %r11d          # imm = 0x3000
1402072a2:     	sete	%r11b
1402072a6:     	jmp	0x14020719e <.text+0x20619e>
1402072ab:     	movzbl	%r11b, %r11d
1402072af:     	movzbl	(%r10,%r11), %r11d
1402072b4:     	jmp	0x14020719e <.text+0x20619e>
1402072b9:     	xorl	%ecx, %ecx
1402072bb:     	xorl	%edx, %edx
1402072bd:     	jmp	0x1402073de <.text+0x2063de>
1402072c2:     	xorl	%edx, %edx
1402072c4:     	movq	%rax, %r9
1402072c7:     	xorl	%ecx, %ecx
1402072c9:     	cmpq	%r8, %r9
1402072cc:     	je	0x1402073de <.text+0x2063de>
1402072d2:     	movq	0x8457927(%rip), %r10   # 0x14865ec00
1402072d9:     	jmp	0x1402072f9 <.text+0x2062f9>
1402072db:     	movzbl	%sil, %esi
1402072df:     	movzbl	(%r10,%rsi), %ebx
1402072e4:     	shrb	%bl
1402072e6:     	testb	$0x1, %bl
1402072e9:     	je	0x1402073d8 <.text+0x2063d8>
1402072ef:     	nop
1402072f0:     	cmpq	%r8, %r9
1402072f3:     	je	0x1402073de <.text+0x2063de>
1402072f9:     	movq	%r8, %r11
1402072fc:     	movsbl	-0x1(%r8), %esi
140207301:     	testl	%esi, %esi
140207303:     	js	0x140207320 <.text+0x206320>
140207305:     	leaq	-0x1(%r11), %r8
140207309:     	leal	-0x9(%rsi), %edi
14020730c:     	cmpl	$0x5, %edi
14020730f:     	jb	0x1402072f0 <.text+0x2062f0>
140207311:     	jmp	0x14020737c <.text+0x20637c>
140207313:     	nopw	%cs:(%rax,%rax)
140207320:     	movzbl	-0x2(%r11), %edi
140207325:     	cmpb	$-0x40, %dil
140207329:     	jge	0x14020734b <.text+0x20634b>
14020732b:     	movzbl	-0x3(%r11), %ebx
140207330:     	cmpb	$-0x40, %bl
140207333:     	jge	0x140207354 <.text+0x206354>
140207335:     	leaq	-0x4(%r11), %r8
140207339:     	movzbl	-0x4(%r11), %ebp
14020733e:     	andl	$0x7, %ebp
140207341:     	shll	$0x6, %ebp
140207344:     	andl	$0x3f, %ebx
140207347:     	orl	%ebp, %ebx
140207349:     	jmp	0x14020735b <.text+0x20635b>
14020734b:     	leaq	-0x2(%r11), %r8
14020734f:     	andl	$0x1f, %edi
140207352:     	jmp	0x140207363 <.text+0x206363>
140207354:     	leaq	-0x3(%r11), %r8
140207358:     	andl	$0xf, %ebx
14020735b:     	shll	$0x6, %ebx
14020735e:     	andl	$0x3f, %edi
140207361:     	orl	%ebx, %edi
140207363:     	shll	$0x6, %edi
140207366:     	andb	$0x3f, %sil
14020736a:     	movzbl	%sil, %esi
14020736e:     	orl	%edi, %esi
140207370:     	leal	-0x9(%rsi), %edi
140207373:     	cmpl	$0x5, %edi
140207376:     	jb	0x1402072f0 <.text+0x2062f0>
14020737c:     	cmpl	$0x20, %esi
14020737f:     	je	0x1402072f0 <.text+0x2062f0>
140207385:     	cmpl	$0x85, %esi
14020738b:     	jb	0x1402073d8 <.text+0x2063d8>
14020738d:     	movl	%esi, %edi
14020738f:     	shrl	$0x8, %edi
140207392:     	cmpl	$0x1f, %edi
140207395:     	jg	0x1402073ae <.text+0x2063ae>
140207397:     	testl	%edi, %edi
140207399:     	je	0x1402073ca <.text+0x2063ca>
14020739b:     	cmpl	$0x16, %edi
14020739e:     	jne	0x1402073d8 <.text+0x2063d8>
1402073a0:     	cmpl	$0x1680, %esi           # imm = 0x1680
1402073a6:     	sete	%bl
1402073a9:     	jmp	0x1402072e6 <.text+0x2062e6>
1402073ae:     	cmpl	$0x20, %edi
1402073b1:     	je	0x1402072db <.text+0x2062db>
1402073b7:     	cmpl	$0x30, %edi
1402073ba:     	jne	0x1402073d8 <.text+0x2063d8>
1402073bc:     	cmpl	$0x3000, %esi           # imm = 0x3000
1402073c2:     	sete	%bl
1402073c5:     	jmp	0x1402072e6 <.text+0x2062e6>
1402073ca:     	movzbl	%sil, %esi
1402073ce:     	movzbl	(%r10,%rsi), %ebx
1402073d3:     	jmp	0x1402072e6 <.text+0x2062e6>
1402073d8:     	subq	%r9, %rdx
1402073db:     	addq	%r11, %rdx
1402073de:     	subq	%rcx, %rdx
1402073e1:     	addq	%rcx, %rax
1402073e4:     	popq	%rbx
1402073e5:     	popq	%rbp
1402073e6:     	popq	%rdi
1402073e7:     	popq	%rsi
1402073e8:     	retq
// name-words
145b24730:     	pushq	%r15
145b24732:     	pushq	%r14
145b24734:     	pushq	%r13
145b24736:     	pushq	%r12
145b24738:     	pushq	%rsi
145b24739:     	pushq	%rdi
145b2473a:     	pushq	%rbp
145b2473b:     	pushq	%rbx
145b2473c:     	subq	$0x28, %rsp
145b24740:     	movq	%rdx, %rdi
145b24743:     	movq	0x8(%rdx), %r12
145b24747:     	movq	0x18(%rdx), %r15
145b2474b:     	cmpq	%r12, %r15
145b2474e:     	seta	%al
145b24751:     	movq	0x10(%rdx), %r14
145b24755:     	cmpq	%r14, %r15
145b24758:     	setb	%dl
145b2475b:     	orb	%al, %dl
145b2475d:     	jne	0x145b248bb <.text+0x5b238bb>
145b24763:     	movq	(%rdi), %rsi
145b24766:     	movzbl	0x28(%rdi), %ebx
145b2476a:     	movzbl	0x1f(%rdi,%rbx), %ebp
145b2476f:     	cmpq	$0x5, %rbx
145b24773:     	movq	%rcx, 0x20(%rsp)
145b24778:     	jb	0x145b24809 <.text+0x5b23809>
145b2477e:     	movq	%r15, %r8
145b24781:     	subq	%r14, %r8
145b24784:     	leaq	(%rsi,%r14), %rax
145b24788:     	cmpq	$0xf, %r8
145b2478c:     	ja	0x145b247aa <.text+0x5b237aa>
145b2478e:     	xorl	%edx, %edx
145b24790:     	testq	%r8, %r8
145b24793:     	je	0x145b247b6 <.text+0x5b237b6>
145b24795:     	cmpb	%bpl, (%rax,%rdx)
145b24799:     	je	0x145b247ba <.text+0x5b237ba>
145b2479b:     	incq	%rdx
145b2479e:     	cmpq	%rdx, %r8
145b247a1:     	jne	0x145b24795 <.text+0x5b23795>
145b247a3:     	movq	%r8, %rdx
145b247a6:     	xorl	%eax, %eax
145b247a8:     	jmp	0x145b247bf <.text+0x5b237bf>
145b247aa:     	movl	%ebp, %ecx
145b247ac:     	movq	%rax, %rdx
145b247af:     	callq	0x14603cea0 <.text+0x603bea0>
145b247b4:     	jmp	0x145b247bf <.text+0x5b237bf>
145b247b6:     	xorl	%eax, %eax
145b247b8:     	jmp	0x145b247bf <.text+0x5b237bf>
145b247ba:     	movl	$0x1, %eax
145b247bf:     	cmpq	$0x1, %rax
145b247c3:     	jne	0x145b248a9 <.text+0x5b238a9>
145b247c9:     	addq	%rdx, %r14
145b247cc:     	incq	%r14
145b247cf:     	movq	%r14, 0x10(%rdi)
145b247d3:     	cmpq	%rbx, %r14
145b247d6:     	setb	%al
145b247d9:     	cmpq	%r12, %r14
145b247dc:     	seta	%cl
145b247df:     	orb	%al, %cl
145b247e1:     	je	0x145b248d1 <.text+0x5b238d1>
145b247e7:     	cmpq	%r14, %r15
145b247ea:     	movq	0x20(%rsp), %rcx
145b247ef:     	movl	$0x0, %eax
145b247f4:     	jae	0x145b2477e <.text+0x5b2377e>
145b247f6:     	jmp	0x145b248bd <.text+0x5b238bd>
145b247fb:     	nopl	(%rax,%rax)
145b24800:     	cmpq	%r14, %r15
145b24803:     	jb	0x145b248b6 <.text+0x5b238b6>
145b24809:     	movq	%r15, %r8
145b2480c:     	subq	%r14, %r8
145b2480f:     	leaq	(%rsi,%r14), %rax
145b24813:     	cmpq	$0x10, %r8
145b24817:     	jae	0x145b24840 <.text+0x5b23840>
145b24819:     	xorl	%edx, %edx
145b2481b:     	testq	%r8, %r8
145b2481e:     	je	0x145b24831 <.text+0x5b23831>
145b24820:     	cmpb	%bpl, (%rax,%rdx)
145b24824:     	je	0x145b24852 <.text+0x5b23852>
145b24826:     	incq	%rdx
145b24829:     	cmpq	%rdx, %r8
145b2482c:     	jne	0x145b24820 <.text+0x5b23820>
145b2482e:     	movq	%r8, %rdx
145b24831:     	xorl	%eax, %eax
145b24833:     	cmpq	$0x1, %rax
145b24837:     	je	0x145b24860 <.text+0x5b23860>
145b24839:     	jmp	0x145b248a9 <.text+0x5b238a9>
145b2483b:     	nopl	(%rax,%rax)
145b24840:     	movl	%ebp, %ecx
145b24842:     	movq	%rax, %rdx
145b24845:     	callq	0x14603cea0 <.text+0x603bea0>
145b2484a:     	cmpq	$0x1, %rax
145b2484e:     	je	0x145b24860 <.text+0x5b23860>
145b24850:     	jmp	0x145b248a9 <.text+0x5b238a9>
145b24852:     	movl	$0x1, %eax
145b24857:     	cmpq	$0x1, %rax
145b2485b:     	jne	0x145b248a9 <.text+0x5b238a9>
145b2485d:     	nopl	(%rax)
145b24860:     	addq	%rdx, %r14
145b24863:     	incq	%r14
145b24866:     	movq	%r14, 0x10(%rdi)
145b2486a:     	movq	%r14, %r13
145b2486d:     	subq	%rbx, %r13
145b24870:     	setb	%al
145b24873:     	cmpq	%r12, %r14
145b24876:     	seta	%cl
145b24879:     	orb	%al, %cl
145b2487b:     	jne	0x145b24800 <.text+0x5b23800>
145b2487d:     	leaq	(%rsi,%r13), %rcx
145b24881:     	leaq	0x20(%rdi), %rdx
145b24885:     	movq	%rbx, %r8
145b24888:     	callq	0x146061721 <.text+0x6060721>
145b2488d:     	testl	%eax, %eax
145b2488f:     	jne	0x145b24800 <.text+0x5b23800>
145b24895:     	movq	0x20(%rsp), %rcx
145b2489a:     	movq	%r13, 0x8(%rcx)
145b2489e:     	movq	%r14, 0x10(%rcx)
145b248a2:     	movl	$0x1, %eax
145b248a7:     	jmp	0x145b248bd <.text+0x5b238bd>
145b248a9:     	movq	%r15, 0x10(%rdi)
145b248ad:     	xorl	%eax, %eax
145b248af:     	movq	0x20(%rsp), %rcx
145b248b4:     	jmp	0x145b248bd <.text+0x5b238bd>
145b248b6:     	movq	0x20(%rsp), %rcx
145b248bb:     	xorl	%eax, %eax
145b248bd:     	movq	%rax, (%rcx)
145b248c0:     	addq	$0x28, %rsp
145b248c4:     	popq	%rbx
145b248c5:     	popq	%rbp
145b248c6:     	popq	%rdi
145b248c7:     	popq	%rsi
145b248c8:     	popq	%r12
145b248ca:     	popq	%r13
145b248cc:     	popq	%r14
145b248ce:     	popq	%r15
145b248d0:     	retq
145b248d1:     	leaq	0x1521b40(%rip), %r9    # 0x147046418
145b248d8:     	movl	$0x4, %r8d
145b248de:     	xorl	%ecx, %ecx
145b248e0:     	movq	%rbx, %rdx
145b248e3:     	callq	0x146208f10 <.text+0x6207f10>
145b248e8:     	ud2
// name-letter-extra
145b23e90:     	subq	$0x28, %rsp
145b23e94:     	movl	$0x0, 0x24(%rsp)
145b23e9c:     	movl	%ecx, %eax
145b23e9e:     	shrl	$0x6, %eax
145b23ea1:     	cmpl	$0x7ff, %ecx            # imm = 0x7FF
145b23ea7:     	ja	0x145b23ebb <.text+0x5b22ebb>
145b23ea9:     	leaq	0x25(%rsp), %r8
145b23eae:     	orb	$-0x40, %al
145b23eb0:     	movb	%al, 0x24(%rsp)
145b23eb4:     	movl	$0x2, %edx
145b23eb9:     	jmp	0x145b23f0b <.text+0x5b22f0b>
145b23ebb:     	andb	$0x3f, %al
145b23ebd:     	orb	$-0x80, %al
145b23ebf:     	movl	%ecx, %edx
145b23ec1:     	shrl	$0xc, %edx
145b23ec4:     	cmpl	$0xffff, %ecx           # imm = 0xFFFF
145b23eca:     	ja	0x145b23ee3 <.text+0x5b22ee3>
145b23ecc:     	leaq	0x26(%rsp), %r8
145b23ed1:     	orb	$-0x20, %dl
145b23ed4:     	movb	%dl, 0x24(%rsp)
145b23ed8:     	movb	%al, 0x25(%rsp)
145b23edc:     	movl	$0x3, %edx
145b23ee1:     	jmp	0x145b23f0b <.text+0x5b22f0b>
145b23ee3:     	andb	$0x3f, %dl
145b23ee6:     	orb	$-0x80, %dl
145b23ee9:     	movl	%ecx, %r9d
145b23eec:     	shrl	$0x12, %r9d
145b23ef0:     	orb	$-0x10, %r9b
145b23ef4:     	leaq	0x27(%rsp), %r8
145b23ef9:     	movb	%r9b, 0x24(%rsp)
145b23efe:     	movb	%dl, 0x25(%rsp)
145b23f02:     	movb	%al, 0x26(%rsp)
145b23f06:     	movl	$0x4, %edx
145b23f0b:     	andb	$0x3f, %cl
145b23f0e:     	orb	$-0x80, %cl
145b23f11:     	movb	%cl, (%r8)
145b23f14:     	leaq	0x1521c90(%rip), %r8    # 0x147045bab
145b23f1b:     	leaq	0x24(%rsp), %rcx
145b23f20:     	movl	$0x60, %r9d
145b23f26:     	callq	0x145b25170 <.text+0x5b24170>
145b23f2b:     	nop
145b23f2c:     	addq	$0x28, %rsp
145b23f30:     	retq
// name-count-short
14603cbd0:     	testq	%rdx, %rdx
14603cbd3:     	je	0x14603cbe5 <.text+0x603bbe5>
14603cbd5:     	cmpq	$0x4, %rdx
14603cbd9:     	jae	0x14603cbe8 <.text+0x603bbe8>
14603cbdb:     	xorl	%r8d, %r8d
14603cbde:     	xorl	%eax, %eax
14603cbe0:     	jmp	0x14603cc76 <.text+0x603bc76>
14603cbe5:     	xorl	%eax, %eax
14603cbe7:     	retq
14603cbe8:     	movabsq	$0x7ffffffffffffffc, %r8 # imm = 0x7FFFFFFFFFFFFFFC
14603cbf2:     	andq	%rdx, %r8
14603cbf5:     	pxor	%xmm0, %xmm0
14603cbf9:     	xorl	%eax, %eax
14603cbfb:     	movdqa	0x1775ffd(%rip), %xmm1  # 0x1477b2c00
14603cc03:     	movdqa	0x1f6355(%rip), %xmm3   # 0x146232f60
14603cc0b:     	pxor	%xmm2, %xmm2
14603cc0f:     	nop
14603cc10:     	movzwl	(%rcx,%rax), %r9d
14603cc15:     	movd	%r9d, %xmm4
14603cc1a:     	movzwl	0x2(%rcx,%rax), %r9d
14603cc20:     	movd	%r9d, %xmm5
14603cc25:     	pcmpgtb	%xmm1, %xmm4
14603cc29:     	punpcklbw	%xmm4, %xmm4    # xmm4 = xmm4[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
14603cc2d:     	pshuflw	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3,4,5,6,7]
14603cc32:     	pshufd	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3]
14603cc37:     	pand	%xmm3, %xmm4
14603cc3b:     	paddq	%xmm4, %xmm2
14603cc3f:     	pcmpgtb	%xmm1, %xmm5
14603cc43:     	punpcklbw	%xmm5, %xmm5    # xmm5 = xmm5[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
14603cc47:     	pshuflw	$0xd4, %xmm5, %xmm4     # xmm4 = xmm5[0,1,1,3,4,5,6,7]
14603cc4c:     	pshufd	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3]
14603cc51:     	pand	%xmm3, %xmm4
14603cc55:     	paddq	%xmm4, %xmm0
14603cc59:     	addq	$0x4, %rax
14603cc5d:     	cmpq	%rax, %r8
14603cc60:     	jne	0x14603cc10 <.text+0x603bc10>
14603cc62:     	paddq	%xmm2, %xmm0
14603cc66:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
14603cc6b:     	paddq	%xmm0, %xmm1
14603cc6f:     	movq	%xmm1, %rax
14603cc74:     	jmp	0x14603cc88 <.text+0x603bc88>
14603cc76:     	xorl	%r9d, %r9d
14603cc79:     	cmpb	$-0x40, (%rcx,%r8)
14603cc7e:     	setge	%r9b
14603cc82:     	addq	%r9, %rax
14603cc85:     	incq	%r8
14603cc88:     	cmpq	%r8, %rdx
14603cc8b:     	jne	0x14603cc76 <.text+0x603bc76>
14603cc8d:     	retq
// name-count-long
14603c5b0:     	pushq	%r15
14603c5b2:     	pushq	%r14
14603c5b4:     	pushq	%r12
14603c5b6:     	pushq	%rsi
14603c5b7:     	pushq	%rdi
14603c5b8:     	pushq	%rbx
14603c5b9:     	subq	$0x68, %rsp
14603c5bd:     	movdqa	%xmm11, 0x50(%rsp)
14603c5c4:     	movdqa	%xmm10, 0x40(%rsp)
14603c5cb:     	movdqa	%xmm9, 0x30(%rsp)
14603c5d2:     	movdqa	%xmm8, 0x20(%rsp)
14603c5d9:     	movdqa	%xmm7, 0x10(%rsp)
14603c5df:     	movdqa	%xmm6, (%rsp)
14603c5e4:     	leaq	0x7(%rcx), %r9
14603c5e8:     	andq	$-0x8, %r9
14603c5ec:     	movq	%r9, %r10
14603c5ef:     	subq	%rcx, %r10
14603c5f2:     	movq	%rdx, %rax
14603c5f5:     	subq	%r10, %rax
14603c5f8:     	jae	0x14603c60f <.text+0x603b60f>
14603c5fa:     	testq	%rdx, %rdx
14603c5fd:     	je	0x14603c63f <.text+0x603b63f>
14603c5ff:     	cmpq	$0x4, %rdx
14603c603:     	jae	0x14603c646 <.text+0x603b646>
14603c605:     	xorl	%r8d, %r8d
14603c608:     	xorl	%eax, %eax
14603c60a:     	jmp	0x14603cb87 <.text+0x603bb87>
14603c60f:     	movq	%rax, %r8
14603c612:     	shrq	$0x3, %r8
14603c616:     	je	0x14603c5fa <.text+0x603b5fa>
14603c618:     	movl	%eax, %edx
14603c61a:     	andl	$0x7, %edx
14603c61d:     	cmpq	%rcx, %r9
14603c620:     	jne	0x14603c62a <.text+0x603b62a>
14603c622:     	xorl	%r9d, %r9d
14603c625:     	jmp	0x14603c77a <.text+0x603b77a>
14603c62a:     	cmpq	$0x4, %r10
14603c62e:     	jae	0x14603c6d9 <.text+0x603b6d9>
14603c634:     	xorl	%r11d, %r11d
14603c637:     	xorl	%r9d, %r9d
14603c63a:     	jmp	0x14603c764 <.text+0x603b764>
14603c63f:     	xorl	%eax, %eax
14603c641:     	jmp	0x14603cb9b <.text+0x603bb9b>
14603c646:     	movq	%rdx, %r8
14603c649:     	andq	$-0x4, %r8
14603c64d:     	pxor	%xmm0, %xmm0
14603c651:     	xorl	%eax, %eax
14603c653:     	movdqa	0x17765a5(%rip), %xmm1  # 0x1477b2c00
14603c65b:     	movdqa	0x1f68fd(%rip), %xmm3   # 0x146232f60
14603c663:     	pxor	%xmm2, %xmm2
14603c667:     	nopw	(%rax,%rax)
14603c670:     	movzwl	(%rcx,%rax), %r9d
14603c675:     	movd	%r9d, %xmm4
14603c67a:     	movzwl	0x2(%rcx,%rax), %r9d
14603c680:     	movd	%r9d, %xmm5
14603c685:     	pcmpgtb	%xmm1, %xmm4
14603c689:     	punpcklbw	%xmm4, %xmm4    # xmm4 = xmm4[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
14603c68d:     	pshuflw	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3,4,5,6,7]
14603c692:     	pshufd	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3]
14603c697:     	pand	%xmm3, %xmm4
14603c69b:     	paddq	%xmm4, %xmm2
14603c69f:     	pcmpgtb	%xmm1, %xmm5
14603c6a3:     	punpcklbw	%xmm5, %xmm5    # xmm5 = xmm5[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
14603c6a7:     	pshuflw	$0xd4, %xmm5, %xmm4     # xmm4 = xmm5[0,1,1,3,4,5,6,7]
14603c6ac:     	pshufd	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3]
14603c6b1:     	pand	%xmm3, %xmm4
14603c6b5:     	paddq	%xmm4, %xmm0
14603c6b9:     	addq	$0x4, %rax
14603c6bd:     	cmpq	%rax, %r8
14603c6c0:     	jne	0x14603c670 <.text+0x603b670>
14603c6c2:     	paddq	%xmm2, %xmm0
14603c6c6:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
14603c6cb:     	paddq	%xmm0, %xmm1
14603c6cf:     	movq	%xmm1, %rax
14603c6d4:     	jmp	0x14603cb82 <.text+0x603bb82>
14603c6d9:     	movl	%r10d, %r11d
14603c6dc:     	andl	$0x4, %r11d
14603c6e0:     	pxor	%xmm0, %xmm0
14603c6e4:     	xorl	%r9d, %r9d
14603c6e7:     	movdqa	0x1776511(%rip), %xmm1  # 0x1477b2c00
14603c6ef:     	movdqa	0x1f6869(%rip), %xmm3   # 0x146232f60
14603c6f7:     	pxor	%xmm2, %xmm2
14603c6fb:     	nopl	(%rax,%rax)
14603c700:     	movzwl	(%rcx,%r9), %esi
14603c705:     	movd	%esi, %xmm4
14603c709:     	movzwl	0x2(%rcx,%r9), %esi
14603c70f:     	movd	%esi, %xmm5
14603c713:     	pcmpgtb	%xmm1, %xmm4
14603c717:     	punpcklbw	%xmm4, %xmm4    # xmm4 = xmm4[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
14603c71b:     	pshuflw	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3,4,5,6,7]
14603c720:     	pshufd	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3]
14603c725:     	pand	%xmm3, %xmm4
14603c729:     	paddq	%xmm4, %xmm2
14603c72d:     	pcmpgtb	%xmm1, %xmm5
14603c731:     	punpcklbw	%xmm5, %xmm5    # xmm5 = xmm5[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
14603c735:     	pshuflw	$0xd4, %xmm5, %xmm4     # xmm4 = xmm5[0,1,1,3,4,5,6,7]
14603c73a:     	pshufd	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3]
14603c73f:     	pand	%xmm3, %xmm4
14603c743:     	paddq	%xmm4, %xmm0
14603c747:     	addq	$0x4, %r9
14603c74b:     	cmpq	%r9, %r11
14603c74e:     	jne	0x14603c700 <.text+0x603b700>
14603c750:     	paddq	%xmm2, %xmm0
14603c754:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
14603c759:     	paddq	%xmm0, %xmm1
14603c75d:     	movq	%xmm1, %r9
14603c762:     	jmp	0x14603c775 <.text+0x603b775>
14603c764:     	xorl	%esi, %esi
14603c766:     	cmpb	$-0x40, (%rcx,%r11)
14603c76b:     	setge	%sil
14603c76f:     	addq	%rsi, %r9
14603c772:     	incq	%r11
14603c775:     	cmpq	%r11, %r10
14603c778:     	jne	0x14603c764 <.text+0x603b764>
14603c77a:     	addq	%r10, %rcx
14603c77d:     	testq	%rdx, %rdx
14603c780:     	je	0x14603c815 <.text+0x603b815>
14603c786:     	movabsq	$0x7ffffffffffffff8, %r10 # imm = 0x7FFFFFFFFFFFFFF8
14603c790:     	andq	%r10, %rax
14603c793:     	xorl	%esi, %esi
14603c795:     	cmpb	$-0x40, (%rcx,%rax)
14603c799:     	setge	%sil
14603c79d:     	cmpl	$0x1, %edx
14603c7a0:     	je	0x14603c817 <.text+0x603b817>
14603c7a2:     	xorl	%r10d, %r10d
14603c7a5:     	cmpb	$-0x40, 0x1(%rcx,%rax)
14603c7aa:     	setge	%r10b
14603c7ae:     	addq	%r10, %rsi
14603c7b1:     	cmpl	$0x2, %edx
14603c7b4:     	je	0x14603c817 <.text+0x603b817>
14603c7b6:     	xorl	%r10d, %r10d
14603c7b9:     	cmpb	$-0x40, 0x2(%rcx,%rax)
14603c7be:     	setge	%r10b
14603c7c2:     	addq	%r10, %rsi
14603c7c5:     	cmpl	$0x3, %edx
14603c7c8:     	je	0x14603c817 <.text+0x603b817>
14603c7ca:     	xorl	%r10d, %r10d
14603c7cd:     	cmpb	$-0x40, 0x3(%rcx,%rax)
14603c7d2:     	setge	%r10b
14603c7d6:     	addq	%r10, %rsi
14603c7d9:     	cmpl	$0x4, %edx
14603c7dc:     	je	0x14603c817 <.text+0x603b817>
14603c7de:     	xorl	%r10d, %r10d
14603c7e1:     	cmpb	$-0x40, 0x4(%rcx,%rax)
14603c7e6:     	setge	%r10b
14603c7ea:     	addq	%r10, %rsi
14603c7ed:     	cmpl	$0x5, %edx
14603c7f0:     	je	0x14603c817 <.text+0x603b817>
14603c7f2:     	xorl	%r10d, %r10d
14603c7f5:     	cmpb	$-0x40, 0x5(%rcx,%rax)
14603c7fa:     	setge	%r10b
14603c7fe:     	addq	%r10, %rsi
14603c801:     	cmpl	$0x6, %edx
14603c804:     	je	0x14603c817 <.text+0x603b817>
14603c806:     	xorl	%edx, %edx
14603c808:     	cmpb	$-0x40, 0x6(%rcx,%rax)
14603c80d:     	setge	%dl
14603c810:     	addq	%rdx, %rsi
14603c813:     	jmp	0x14603c817 <.text+0x603b817>
14603c815:     	xorl	%esi, %esi
14603c817:     	addq	%r9, %rsi
14603c81a:     	movabsq	$0xff00ff00ff00ff, %r9  # imm = 0xFF00FF00FF00FF
14603c824:     	movabsq	$0x1000100010001, %rdx  # imm = 0x1000100010001
14603c82e:     	pcmpeqd	%xmm0, %xmm0
14603c832:     	movdqa	0x1f52e6(%rip), %xmm1   # 0x146231b20
14603c83a:     	jmp	0x14603c872 <.text+0x603b872>
14603c83c:     	nopl	(%rax)
14603c840:     	xorl	%esi, %esi
14603c842:     	addq	%r10, %rcx
14603c845:     	subq	%r11, %r8
14603c848:     	movl	%r11d, %edi
14603c84b:     	andl	$0x3, %edi
14603c84e:     	movq	%rsi, %rbx
14603c851:     	andq	%r9, %rbx
14603c854:     	shrq	$0x8, %rsi
14603c858:     	andq	%r9, %rsi
14603c85b:     	addq	%rbx, %rsi
14603c85e:     	imulq	%rdx, %rsi
14603c862:     	shrq	$0x30, %rsi
14603c866:     	addq	%rax, %rsi
14603c869:     	testq	%rdi, %rdi
14603c86c:     	jne	0x14603caf0 <.text+0x603baf0>
14603c872:     	movq	%rsi, %rax
14603c875:     	testq	%r8, %r8
14603c878:     	je	0x14603cb9b <.text+0x603bb9b>
14603c87e:     	movq	%rcx, %r10
14603c881:     	cmpq	$0xc0, %r8
14603c888:     	movl	$0xc0, %r11d
14603c88e:     	cmovbq	%r8, %r11
14603c892:     	leal	(,%r11,8), %ecx
14603c89a:     	movl	%ecx, %edi
14603c89c:     	andl	$0x7e0, %edi            # imm = 0x7E0
14603c8a2:     	je	0x14603c840 <.text+0x603b840>
14603c8a4:     	leaq	-0x20(%rcx), %r14
14603c8a8:     	cmpq	$0x60, %r14
14603c8ac:     	jae	0x14603c8c0 <.text+0x603b8c0>
14603c8ae:     	movq	%r10, %rbx
14603c8b1:     	xorl	%esi, %esi
14603c8b3:     	jmp	0x14603ca82 <.text+0x603ba82>
14603c8b8:     	nopl	(%rax,%rax)
14603c8c0:     	shrq	$0x5, %r14
14603c8c4:     	incq	%r14
14603c8c7:     	movq	%r14, %r15
14603c8ca:     	andq	$-0x4, %r15
14603c8ce:     	movq	%r15, %rbx
14603c8d1:     	shlq	$0x5, %rbx
14603c8d5:     	addq	%r10, %rbx
14603c8d8:     	leaq	0x40(%r10), %rsi
14603c8dc:     	pxor	%xmm4, %xmm4
14603c8e0:     	movq	%r15, %r12
14603c8e3:     	pxor	%xmm6, %xmm6
14603c8e7:     	nopw	(%rax,%rax)
14603c8f0:     	movdqu	-0x40(%rsi), %xmm2
14603c8f5:     	movdqu	-0x20(%rsi), %xmm5
14603c8fa:     	movdqa	%xmm2, %xmm3
14603c8fe:     	punpcklqdq	%xmm5, %xmm3    # xmm3 = xmm3[0],xmm5[0]
14603c902:     	movdqa	%xmm3, %xmm7
14603c906:     	pxor	%xmm0, %xmm7
14603c90a:     	psrlq	$0x7, %xmm7
14603c90f:     	psrlq	$0x6, %xmm3
14603c914:     	por	%xmm7, %xmm3
14603c918:     	pand	%xmm1, %xmm3
14603c91c:     	paddq	%xmm4, %xmm3
14603c920:     	movdqu	-0x30(%rsi), %xmm4
14603c925:     	movdqu	-0x10(%rsi), %xmm7
14603c92a:     	punpckhqdq	%xmm5, %xmm2    # xmm2 = xmm2[1],xmm5[1]
14603c92e:     	movdqa	%xmm4, %xmm5
14603c932:     	punpcklqdq	%xmm7, %xmm5    # xmm5 = xmm5[0],xmm7[0]
14603c936:     	punpckhqdq	%xmm7, %xmm4    # xmm4 = xmm4[1],xmm7[1]
14603c93a:     	movdqu	0x30(%rsi), %xmm10
14603c940:     	movdqu	0x20(%rsi), %xmm7
14603c945:     	movdqu	(%rsi), %xmm9
14603c94a:     	movdqa	%xmm9, %xmm8
14603c94f:     	punpcklqdq	%xmm7, %xmm8    # xmm8 = xmm8[0],xmm7[0]
14603c954:     	movdqa	%xmm8, %xmm11
14603c959:     	pxor	%xmm0, %xmm11
14603c95e:     	psrlq	$0x7, %xmm11
14603c964:     	psrlq	$0x6, %xmm8
14603c96a:     	por	%xmm11, %xmm8
14603c96f:     	pand	%xmm1, %xmm8
14603c974:     	paddq	%xmm6, %xmm8
14603c979:     	movdqu	0x10(%rsi), %xmm6
14603c97e:     	punpckhqdq	%xmm7, %xmm9    # xmm9 = xmm9[1],xmm7[1]
14603c983:     	movdqa	%xmm6, %xmm7
14603c987:     	punpcklqdq	%xmm10, %xmm7   # xmm7 = xmm7[0],xmm10[0]
14603c98c:     	punpckhqdq	%xmm10, %xmm6   # xmm6 = xmm6[1],xmm10[1]
14603c991:     	movdqa	%xmm2, %xmm10
14603c996:     	pxor	%xmm0, %xmm10
14603c99b:     	movdqa	%xmm9, %xmm11
14603c9a0:     	pxor	%xmm0, %xmm11
14603c9a5:     	psrlq	$0x7, %xmm10
14603c9ab:     	psrlq	$0x7, %xmm11
14603c9b1:     	psrlq	$0x6, %xmm2
14603c9b6:     	por	%xmm10, %xmm2
14603c9bb:     	psrlq	$0x6, %xmm9
14603c9c1:     	por	%xmm11, %xmm9
14603c9c6:     	pand	%xmm1, %xmm2
14603c9ca:     	pand	%xmm1, %xmm9
14603c9cf:     	movdqa	%xmm5, %xmm10
14603c9d4:     	pxor	%xmm0, %xmm10
14603c9d9:     	movdqa	%xmm7, %xmm11
14603c9de:     	pxor	%xmm0, %xmm11
14603c9e3:     	psrlq	$0x7, %xmm10
14603c9e9:     	psrlq	$0x7, %xmm11
14603c9ef:     	psrlq	$0x6, %xmm5
14603c9f4:     	por	%xmm10, %xmm5
14603c9f9:     	psrlq	$0x6, %xmm7
14603c9fe:     	por	%xmm11, %xmm7
14603ca03:     	pand	%xmm1, %xmm5
14603ca07:     	paddq	%xmm2, %xmm5
14603ca0b:     	paddq	%xmm3, %xmm5
14603ca0f:     	pand	%xmm1, %xmm7
14603ca13:     	paddq	%xmm9, %xmm7
14603ca18:     	paddq	%xmm8, %xmm7
14603ca1d:     	movdqa	%xmm4, %xmm2
14603ca21:     	pxor	%xmm0, %xmm2
14603ca25:     	movdqa	%xmm6, %xmm3
14603ca29:     	pxor	%xmm0, %xmm3
14603ca2d:     	psrlq	$0x7, %xmm2
14603ca32:     	psrlq	$0x7, %xmm3
14603ca37:     	psrlq	$0x6, %xmm4
14603ca3c:     	por	%xmm2, %xmm4
14603ca40:     	psrlq	$0x6, %xmm6
14603ca45:     	por	%xmm3, %xmm6
14603ca49:     	pand	%xmm1, %xmm4
14603ca4d:     	paddq	%xmm5, %xmm4
14603ca51:     	pand	%xmm1, %xmm6
14603ca55:     	paddq	%xmm7, %xmm6
14603ca59:     	subq	$-0x80, %rsi
14603ca5d:     	addq	$-0x4, %r12
14603ca61:     	jne	0x14603c8f0 <.text+0x603b8f0>
14603ca67:     	paddq	%xmm4, %xmm6
14603ca6b:     	pshufd	$0xee, %xmm6, %xmm2     # xmm2 = xmm6[2,3,2,3]
14603ca70:     	paddq	%xmm6, %xmm2
14603ca74:     	movq	%xmm2, %rsi
14603ca79:     	cmpq	%r15, %r14
14603ca7c:     	je	0x14603c842 <.text+0x603b842>
14603ca82:     	addq	%r10, %rdi
14603ca85:     	nopw	%cs:(%rax,%rax)
14603ca90:     	movdqu	(%rbx), %xmm2
14603ca94:     	movdqu	0x10(%rbx), %xmm3
14603ca99:     	movdqa	%xmm2, %xmm4
14603ca9d:     	pxor	%xmm0, %xmm4
14603caa1:     	movdqa	%xmm3, %xmm5
14603caa5:     	pxor	%xmm0, %xmm5
14603caa9:     	psrlq	$0x7, %xmm5
14603caae:     	psrlq	$0x7, %xmm4
14603cab3:     	psrlq	$0x6, %xmm3
14603cab8:     	por	%xmm5, %xmm3
14603cabc:     	psrlq	$0x6, %xmm2
14603cac1:     	por	%xmm4, %xmm2
14603cac5:     	pand	%xmm1, %xmm3
14603cac9:     	pand	%xmm1, %xmm2
14603cacd:     	paddq	%xmm3, %xmm2
14603cad1:     	pshufd	$0xee, %xmm2, %xmm3     # xmm3 = xmm2[2,3,2,3]
14603cad6:     	paddq	%xmm2, %xmm3
14603cada:     	movq	%xmm3, %r14
14603cadf:     	addq	%r14, %rsi
14603cae2:     	addq	$0x20, %rbx
14603cae6:     	cmpq	%rdi, %rbx
14603cae9:     	jne	0x14603ca90 <.text+0x603ba90>
14603caeb:     	jmp	0x14603c842 <.text+0x603b842>
14603caf0:     	andl	$0xfc, %r11d
14603caf7:     	movl	%r11d, %eax
14603cafa:     	movq	(%r10,%rax,8), %rcx
14603cafe:     	movq	%rcx, %rax
14603cb01:     	notq	%rax
14603cb04:     	shrq	$0x7, %rax
14603cb08:     	shrq	$0x6, %rcx
14603cb0c:     	orq	%rax, %rcx
14603cb0f:     	movabsq	$0x101010101010101, %rax # imm = 0x101010101010101
14603cb19:     	andq	%rax, %rcx
14603cb1c:     	cmpl	$0x1, %edi
14603cb1f:     	je	0x14603cb5e <.text+0x603bb5e>
14603cb21:     	movq	0x8(%r10,%r11,8), %r8
14603cb26:     	movq	%r8, %rbx
14603cb29:     	notq	%rbx
14603cb2c:     	shrq	$0x7, %rbx
14603cb30:     	shrq	$0x6, %r8
14603cb34:     	orq	%rbx, %r8
14603cb37:     	andq	%rax, %r8
14603cb3a:     	addq	%r8, %rcx
14603cb3d:     	cmpl	$0x2, %edi
14603cb40:     	je	0x14603cb5e <.text+0x603bb5e>
14603cb42:     	movq	0x10(%r10,%r11,8), %r8
14603cb47:     	movq	%r8, %r10
14603cb4a:     	notq	%r10
14603cb4d:     	shrq	$0x7, %r10
14603cb51:     	shrq	$0x6, %r8
14603cb55:     	orq	%r10, %r8
14603cb58:     	andq	%rax, %r8
14603cb5b:     	addq	%r8, %rcx
14603cb5e:     	andq	%rcx, %r9
14603cb61:     	shrq	$0x8, %rcx
14603cb65:     	movabsq	$0x700ff00ff00ff, %rax  # imm = 0x700FF00FF00FF
14603cb6f:     	andq	%rcx, %rax
14603cb72:     	addq	%r9, %rax
14603cb75:     	imulq	%rdx, %rax
14603cb79:     	shrq	$0x30, %rax
14603cb7d:     	addq	%rsi, %rax
14603cb80:     	jmp	0x14603cb9b <.text+0x603bb9b>
14603cb82:     	cmpq	%r8, %rdx
14603cb85:     	je	0x14603cb9b <.text+0x603bb9b>
14603cb87:     	xorl	%r9d, %r9d
14603cb8a:     	cmpb	$-0x40, (%rcx,%r8)
14603cb8f:     	setge	%r9b
14603cb93:     	addq	%r9, %rax
14603cb96:     	incq	%r8
14603cb99:     	jmp	0x14603cb82 <.text+0x603bb82>
14603cb9b:     	movaps	(%rsp), %xmm6
14603cb9f:     	movaps	0x10(%rsp), %xmm7
14603cba4:     	movaps	0x20(%rsp), %xmm8
14603cbaa:     	movaps	0x30(%rsp), %xmm9
14603cbb0:     	movaps	0x40(%rsp), %xmm10
14603cbb6:     	movaps	0x50(%rsp), %xmm11
14603cbbc:     	addq	$0x68, %rsp
14603cbc0:     	popq	%rbx
14603cbc1:     	popq	%rdi
14603cbc2:     	popq	%rsi
14603cbc3:     	popq	%r12
14603cbc5:     	popq	%r14
14603cbc7:     	popq	%r15
14603cbc9:     	retq
14603cbca:     	int3
14603cbcb:     	int3
14603cbcc:     	int3
14603cbcd:     	int3
14603cbce:     	int3
14603cbcf:     	int3
// unicode-alphabetic
14603d250:     	movl	%ecx, %eax
14603d252:     	shll	$0xb, %eax
14603d255:     	xorl	%edx, %edx
14603d257:     	cmpl	$0x16a39, %ecx          # imm = 0x16A39
14603d25d:     	movl	$0x19, %r9d
14603d263:     	cmovbq	%rdx, %r9
14603d267:     	leaq	0xd(%r9), %r10
14603d26b:     	leaq	0x1778652(%rip), %r8    # 0x1477b58c4
14603d272:     	movl	0x34(%r8,%r9,4), %r11d
14603d277:     	shll	$0xb, %r11d
14603d27b:     	cmpl	%eax, %r11d
14603d27e:     	cmovaq	%r9, %r10
14603d282:     	leaq	0x6(%r10), %r9
14603d286:     	movl	0x18(%r8,%r10,4), %r11d
14603d28b:     	shll	$0xb, %r11d
14603d28f:     	cmpl	%eax, %r11d
14603d292:     	cmovaq	%r10, %r9
14603d296:     	leaq	0x3(%r9), %r10
14603d29a:     	movl	0xc(%r8,%r9,4), %r11d
14603d29f:     	shll	$0xb, %r11d
14603d2a3:     	cmpl	%eax, %r11d
14603d2a6:     	cmovaq	%r9, %r10
14603d2aa:     	leaq	0x2(%r10), %r9
14603d2ae:     	movl	0x8(%r8,%r10,4), %r11d
14603d2b3:     	shll	$0xb, %r11d
14603d2b7:     	cmpl	%eax, %r11d
14603d2ba:     	cmovaq	%r10, %r9
14603d2be:     	leaq	0x1(%r9), %r11
14603d2c2:     	movl	0x4(%r8,%r9,4), %r10d
14603d2c7:     	shll	$0xb, %r10d
14603d2cb:     	cmpl	%eax, %r10d
14603d2ce:     	cmovaq	%r9, %r11
14603d2d2:     	movl	(%r8,%r11,4), %r9d
14603d2d6:     	shll	$0xb, %r9d
14603d2da:     	xorl	%r10d, %r10d
14603d2dd:     	cmpl	%eax, %r9d
14603d2e0:     	sete	%r10b
14603d2e4:     	adcq	%r11, %r10
14603d2e7:     	movl	(%r8,%r10,4), %eax
14603d2eb:     	shrl	$0x15, %eax
14603d2ee:     	movl	$0x5ef, %r9d            # imm = 0x5EF
14603d2f4:     	cmpq	$0x31, %r10
14603d2f8:     	ja	0x14603d308 <.text+0x603c308>
14603d2fa:     	movl	0x4(%r8,%r10,4), %r9d
14603d2ff:     	shrl	$0x15, %r9d
14603d303:     	testq	%r10, %r10
14603d306:     	je	0x14603d312 <.text+0x603c312>
14603d308:     	movl	$0x1fffff, %edx         # imm = 0x1FFFFF
14603d30d:     	andl	-0x4(%r8,%r10,4), %edx
14603d312:     	movq	%rax, %r8
14603d315:     	notq	%r8
14603d318:     	addq	%r9, %r8
14603d31b:     	je	0x14603d348 <.text+0x603c348>
14603d31d:     	subl	%edx, %ecx
14603d31f:     	decq	%r9
14603d322:     	xorl	%r8d, %r8d
14603d325:     	leaq	0x1775914(%rip), %rdx   # 0x1477b2c40
14603d32c:     	nopl	(%rax)
14603d330:     	movl	%r8d, %r10d
14603d333:     	movzbl	(%rax,%rdx), %r8d
14603d338:     	addl	%r10d, %r8d
14603d33b:     	cmpl	%ecx, %r8d
14603d33e:     	ja	0x14603d348 <.text+0x603c348>
14603d340:     	incq	%rax
14603d343:     	cmpq	%rax, %r9
14603d346:     	jne	0x14603d330 <.text+0x603c330>
14603d348:     	andb	$0x1, %al
14603d34a:     	retq
// unicode-case-lookup
14603d350:     	pushq	%rsi
14603d351:     	pushq	%rdi
14603d352:     	pushq	%rbx
14603d353:     	cmpl	$0x20000, %edx          # imm = 0x20000
14603d359:     	jae	0x14603d442 <.text+0x603c442>
14603d35f:     	movl	%edx, %eax
14603d361:     	shrl	$0xb, %eax
14603d364:     	andl	$-0x20, %eax
14603d367:     	movq	0x8(%r8,%rax), %r10
14603d36c:     	testq	%r10, %r10
14603d36f:     	je	0x14603d3d4 <.text+0x603c3d4>
14603d371:     	movq	(%r8,%rax), %r9
14603d375:     	xorl	%r11d, %r11d
14603d378:     	cmpq	$0x1, %r10
14603d37c:     	je	0x14603d3a2 <.text+0x603c3a2>
14603d37e:     	nop
14603d380:     	movq	%r11, %rsi
14603d383:     	movq	%r10, %rdi
14603d386:     	shrq	%rdi
14603d389:     	addq	%rdi, %r11
14603d38c:     	leaq	(%r11,%r11,2), %rbx
14603d390:     	cmpw	%dx, (%r9,%rbx,2)
14603d395:     	cmovaq	%rsi, %r11
14603d399:     	subq	%rdi, %r10
14603d39c:     	cmpq	$0x1, %r10
14603d3a0:     	ja	0x14603d380 <.text+0x603c380>
14603d3a2:     	leaq	(%r11,%r11,2), %r11
14603d3a6:     	movzwl	(%r9,%r11,2), %r10d
14603d3ab:     	cmpw	%dx, %r10w
14603d3af:     	ja	0x14603d3d4 <.text+0x603c3d4>
14603d3b1:     	movzbl	0x2(%r9,%r11,2), %esi
14603d3b7:     	addl	%r10d, %esi
14603d3ba:     	cmpw	%dx, %si
14603d3bd:     	jb	0x14603d3d4 <.text+0x603c3d4>
14603d3bf:     	leaq	(%r9,%r11,2), %r9
14603d3c3:     	movzbl	0x3(%r9), %r11d
14603d3c8:     	xorl	%edx, %r10d
14603d3cb:     	andl	%r11d, %r10d
14603d3ce:     	testb	$0x1, %r10b
14603d3d2:     	je	0x14603d44c <.text+0x603c44c>
14603d3d4:     	addq	%rax, %r8
14603d3d7:     	movq	0x18(%r8), %r9
14603d3db:     	testq	%r9, %r9
14603d3de:     	je	0x14603d442 <.text+0x603c442>
14603d3e0:     	movq	0x10(%r8), %rax
14603d3e4:     	xorl	%r8d, %r8d
14603d3e7:     	cmpq	$0x1, %r9
14603d3eb:     	je	0x14603d40e <.text+0x603c40e>
14603d3ed:     	nopl	(%rax)
14603d3f0:     	movq	%r8, %r10
14603d3f3:     	movq	%r9, %r11
14603d3f6:     	shrq	%r11
14603d3f9:     	addq	%r11, %r8
14603d3fc:     	cmpw	%dx, (%rax,%r8,8)
14603d401:     	cmovaq	%r10, %r8
14603d405:     	subq	%r11, %r9
14603d408:     	cmpq	$0x1, %r9
14603d40c:     	ja	0x14603d3f0 <.text+0x603c3f0>
14603d40e:     	cmpw	%dx, (%rax,%r8,8)
14603d413:     	jne	0x14603d442 <.text+0x603c442>
14603d415:     	movzwl	0x6(%rax,%r8,8), %r9d
14603d41b:     	movl	0x2(%rax,%r8,8), %eax
14603d420:     	movzwl	%ax, %r8d
14603d424:     	shrl	$0x10, %eax
14603d427:     	andl	$0x10000, %edx          # imm = 0x10000
14603d42d:     	orl	%edx, %r8d
14603d430:     	orl	%edx, %eax
14603d432:     	orl	%r9d, %edx
14603d435:     	movl	%r8d, (%rcx)
14603d438:     	movl	%eax, 0x4(%rcx)
14603d43b:     	movl	%edx, 0x8(%rcx)
14603d43e:     	popq	%rbx
14603d43f:     	popq	%rdi
14603d440:     	popq	%rsi
14603d441:     	retq
14603d442:     	movl	$0xffffffff, (%rcx)     # imm = 0xFFFFFFFF
14603d448:     	popq	%rbx
14603d449:     	popq	%rdi
14603d44a:     	popq	%rsi
14603d44b:     	retq
14603d44c:     	movzwl	0x4(%r9), %eax
14603d451:     	addw	%dx, %ax
14603d454:     	andl	$0x10000, %edx          # imm = 0x10000
14603d45a:     	movzwl	%ax, %eax
14603d45d:     	orl	%edx, %eax
14603d45f:     	movl	%eax, (%rcx)
14603d461:     	movq	$0x0, 0x4(%rcx)
14603d469:     	popq	%rbx
14603d46a:     	popq	%rdi
14603d46b:     	popq	%rsi
14603d46c:     	retq
// unicode-lowercase
14603d470:     	pushq	%rbp
14603d471:     	pushq	%rsi
14603d472:     	pushq	%rdi
14603d473:     	subq	$0x30, %rsp
14603d477:     	leaq	0x30(%rsp), %rbp
14603d47c:     	movq	%rcx, %rsi
14603d47f:     	cmpl	$0xc0, %edx
14603d485:     	jae	0x14603d4a1 <.text+0x603c4a1>
14603d487:     	leal	-0x41(%rdx), %eax
14603d48a:     	movl	%edx, %ecx
14603d48c:     	orl	$0x20, %ecx
14603d48f:     	cmpl	$0x1a, %eax
14603d492:     	cmovael	%edx, %ecx
14603d495:     	movl	%ecx, (%rsi)
14603d497:     	movq	$0x0, 0x4(%rsi)
14603d49f:     	jmp	0x14603d4d1 <.text+0x603c4d1>
14603d4a1:     	leaq	0x1778940(%rip), %r8    # 0x1477b5de8
14603d4a8:     	leaq	-0xc(%rbp), %rcx
14603d4ac:     	movq	%rdx, %rdi
14603d4af:     	callq	0x14603d350 <.text+0x603c350>
14603d4b4:     	movl	%edi, (%rsi)
14603d4b6:     	movq	$0x0, 0x4(%rsi)
14603d4be:     	cmpl	$-0x1, -0xc(%rbp)
14603d4c2:     	je	0x14603d4d1 <.text+0x603c4d1>
14603d4c4:     	movl	-0x4(%rbp), %eax
14603d4c7:     	movl	%eax, 0x8(%rsi)
14603d4ca:     	movq	-0xc(%rbp), %rax
14603d4ce:     	movq	%rax, (%rsi)
14603d4d1:     	movq	%rsi, %rax
14603d4d4:     	addq	$0x30, %rsp
14603d4d8:     	popq	%rdi
14603d4d9:     	popq	%rsi
14603d4da:     	popq	%rbp
14603d4db:     	retq
// unicode-uppercase
14603d4e0:     	pushq	%rbp
14603d4e1:     	pushq	%rsi
14603d4e2:     	pushq	%rdi
14603d4e3:     	subq	$0x30, %rsp
14603d4e7:     	leaq	0x30(%rsp), %rbp
14603d4ec:     	movq	%rcx, %rsi
14603d4ef:     	cmpl	$0xb5, %edx
14603d4f5:     	jae	0x14603d511 <.text+0x603c511>
14603d4f7:     	leal	-0x61(%rdx), %eax
14603d4fa:     	movl	%edx, %ecx
14603d4fc:     	andl	$0x5f, %ecx
14603d4ff:     	cmpl	$0x1a, %eax
14603d502:     	cmovael	%edx, %ecx
14603d505:     	movl	%ecx, (%rsi)
14603d507:     	movq	$0x0, 0x4(%rsi)
14603d50f:     	jmp	0x14603d541 <.text+0x603c541>
14603d511:     	leaq	0x17790e0(%rip), %r8    # 0x1477b65f8
14603d518:     	leaq	-0xc(%rbp), %rcx
14603d51c:     	movq	%rdx, %rdi
14603d51f:     	callq	0x14603d350 <.text+0x603c350>
14603d524:     	movl	%edi, (%rsi)
14603d526:     	movq	$0x0, 0x4(%rsi)
14603d52e:     	cmpl	$-0x1, -0xc(%rbp)
14603d532:     	je	0x14603d541 <.text+0x603c541>
14603d534:     	movl	-0x4(%rbp), %eax
14603d537:     	movl	%eax, 0x8(%rsi)
14603d53a:     	movq	-0xc(%rbp), %rax
14603d53e:     	movq	%rax, (%rsi)
14603d541:     	movq	%rsi, %rax
14603d544:     	addq	$0x30, %rsp
14603d548:     	popq	%rdi
14603d549:     	popq	%rsi
14603d54a:     	popq	%rbp
14603d54b:     	retq
// unicode-case-iterator
146046180:     	movq	(%rcx), %rdx
146046183:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
146046188:     	cmpq	%rdx, 0x8(%rcx)
14604618c:     	je	0x146046199 <.text+0x6045199>
14604618e:     	leaq	0x1(%rdx), %rax
146046192:     	movq	%rax, (%rcx)
146046195:     	movl	0x10(%rcx,%rdx,4), %eax
146046199:     	retq
// picker-name-append
1401e0ba0:     	pushq	%r14
1401e0ba2:     	pushq	%rsi
1401e0ba3:     	pushq	%rdi
1401e0ba4:     	pushq	%rbp
1401e0ba5:     	pushq	%rbx
1401e0ba6:     	subq	$0x30, %rsp
1401e0baa:     	movl	%edx, %ebp
1401e0bac:     	movq	%rcx, %rsi
1401e0baf:     	movq	0x8(%rcx), %rbx
1401e0bb3:     	movq	0x10(%rcx), %rdi
1401e0bb7:     	movq	%rbx, %rcx
1401e0bba:     	movq	%rdi, %rdx
1401e0bbd:     	cmpq	$0x20, %rdi
1401e0bc1:     	jae	0x1401e0bca <.text+0x1dfbca>
1401e0bc3:     	callq	0x14603cbd0 <.text+0x603bbd0>
1401e0bc8:     	jmp	0x1401e0bcf <.text+0x1dfbcf>
1401e0bca:     	callq	0x14603c5b0 <.text+0x603b5b0>
1401e0bcf:     	movq	%rax, %r14
1401e0bd2:     	movl	%ebp, %ecx
1401e0bd4:     	callq	0x145b20840 <.text+0x5b1f840>
1401e0bd9:     	testb	%al, %al
1401e0bdb:     	je	0x1401e0c01 <.text+0x1dfc01>
1401e0bdd:     	cmpq	$0x14, %r14
1401e0be1:     	jae	0x1401e0c01 <.text+0x1dfc01>
1401e0be3:     	cmpl	$0x80, %ebp
1401e0be9:     	jae	0x1401e0c43 <.text+0x1dfc43>
1401e0beb:     	cmpq	%rdi, (%rsi)
1401e0bee:     	je	0x1401e0d1f <.text+0x1dfd1f>
1401e0bf4:     	movb	%bpl, (%rbx,%rdi)
1401e0bf8:     	addq	$0x1, %rdi
1401e0bfc:     	jmp	0x1401e0d10 <.text+0x1dfd10>
1401e0c01:     	cmpl	$0x20, %ebp
1401e0c04:     	jne	0x1401e0d14 <.text+0x1dfd14>
1401e0c0a:     	testq	%r14, %r14
1401e0c0d:     	je	0x1401e0d14 <.text+0x1dfd14>
1401e0c13:     	cmpq	$0xf, %rdi
1401e0c17:     	ja	0x1401e0c94 <.text+0x1dfc94>
1401e0c19:     	testq	%rdi, %rdi
1401e0c1c:     	je	0x1401e0c32 <.text+0x1dfc32>
1401e0c1e:     	xorl	%eax, %eax
1401e0c20:     	cmpb	$0x20, (%rbx,%rax)
1401e0c24:     	je	0x1401e0d14 <.text+0x1dfd14>
1401e0c2a:     	incq	%rax
1401e0c2d:     	cmpq	%rax, %rdi
1401e0c30:     	jne	0x1401e0c20 <.text+0x1dfc20>
1401e0c32:     	xorl	%eax, %eax
1401e0c34:     	addq	$-0x13, %r14
1401e0c38:     	cmpq	$-0x14, %r14
1401e0c3c:     	jae	0x1401e0cb2 <.text+0x1dfcb2>
1401e0c3e:     	jmp	0x1401e0d14 <.text+0x1dfd14>
1401e0c43:     	cmpl	$0x10000, %ebp          # imm = 0x10000
1401e0c49:     	movl	$0x4, %eax
1401e0c4e:     	sbbq	$0x0, %rax
1401e0c52:     	cmpl	$0x800, %ebp            # imm = 0x800
1401e0c58:     	movl	$0x2, %r8d
1401e0c5e:     	cmovaeq	%rax, %r8
1401e0c62:     	movq	(%rsi), %rax
1401e0c65:     	subq	%rdi, %rax
1401e0c68:     	cmpq	%rax, %r8
1401e0c6b:     	ja	0x1401e0d48 <.text+0x1dfd48>
1401e0c71:     	movl	%ebp, %eax
1401e0c73:     	andb	$0x3f, %al
1401e0c75:     	orb	$-0x80, %al
1401e0c77:     	movl	%ebp, %ecx
1401e0c79:     	shrl	$0x6, %ecx
1401e0c7c:     	cmpl	$0x800, %ebp            # imm = 0x800
1401e0c82:     	jae	0x1401e0cc8 <.text+0x1dfcc8>
1401e0c84:     	orb	$-0x40, %cl
1401e0c87:     	movb	%cl, (%rbx,%rdi)
1401e0c8a:     	movb	%al, 0x1(%rbx,%rdi)
1401e0c8e:     	addq	$0x2, %rdi
1401e0c92:     	jmp	0x1401e0d10 <.text+0x1dfd10>
1401e0c94:     	movb	$0x20, %cl
1401e0c96:     	movq	%rbx, %rdx
1401e0c99:     	movq	%rdi, %r8
1401e0c9c:     	callq	0x14603cea0 <.text+0x603bea0>
1401e0ca1:     	cmpq	$0x1, %rax
1401e0ca5:     	sete	%al
1401e0ca8:     	addq	$-0x13, %r14
1401e0cac:     	cmpq	$-0x14, %r14
1401e0cb0:     	jb	0x1401e0d14 <.text+0x1dfd14>
1401e0cb2:     	testb	%al, %al
1401e0cb4:     	jne	0x1401e0d14 <.text+0x1dfd14>
1401e0cb6:     	cmpq	%rdi, (%rsi)
1401e0cb9:     	je	0x1401e0d6b <.text+0x1dfd6b>
1401e0cbf:     	movb	$0x20, (%rbx,%rdi)
1401e0cc3:     	incq	%rdi
1401e0cc6:     	jmp	0x1401e0d10 <.text+0x1dfd10>
1401e0cc8:     	andb	$0x3f, %cl
1401e0ccb:     	orb	$-0x80, %cl
1401e0cce:     	movl	%ebp, %edx
1401e0cd0:     	shrl	$0xc, %edx
1401e0cd3:     	cmpl	$0xffff, %ebp           # imm = 0xFFFF
1401e0cd9:     	ja	0x1401e0cef <.text+0x1dfcef>
1401e0cdb:     	orb	$-0x20, %dl
1401e0cde:     	movb	%dl, (%rbx,%rdi)
1401e0ce1:     	movb	%cl, 0x1(%rbx,%rdi)
1401e0ce5:     	movb	%al, 0x2(%rbx,%rdi)
1401e0ce9:     	addq	$0x3, %rdi
1401e0ced:     	jmp	0x1401e0d10 <.text+0x1dfd10>
1401e0cef:     	andb	$0x3f, %dl
1401e0cf2:     	orb	$-0x80, %dl
1401e0cf5:     	shrl	$0x12, %ebp
1401e0cf8:     	orb	$-0x10, %bpl
1401e0cfc:     	movb	%bpl, (%rbx,%rdi)
1401e0d00:     	movb	%dl, 0x1(%rbx,%rdi)
1401e0d04:     	movb	%cl, 0x2(%rbx,%rdi)
1401e0d08:     	movb	%al, 0x3(%rbx,%rdi)
1401e0d0c:     	addq	$0x4, %rdi
1401e0d10:     	movq	%rdi, 0x10(%rsi)
1401e0d14:     	addq	$0x30, %rsp
1401e0d18:     	popq	%rbx
1401e0d19:     	popq	%rbp
1401e0d1a:     	popq	%rdi
1401e0d1b:     	popq	%rsi
1401e0d1c:     	popq	%r14
1401e0d1e:     	retq
1401e0d1f:     	movq	$0x1, 0x20(%rsp)
1401e0d28:     	movl	$0x1, %r8d
1401e0d2e:     	movl	$0x1, %r9d
1401e0d34:     	movq	%rsi, %rcx
1401e0d37:     	movq	%rdi, %rdx
1401e0d3a:     	callq	0x146061b30 <.text+0x6060b30>
1401e0d3f:     	movq	0x8(%rsi), %rbx
1401e0d43:     	jmp	0x1401e0bf4 <.text+0x1dfbf4>
1401e0d48:     	movq	$0x1, 0x20(%rsp)
1401e0d51:     	movl	$0x1, %r9d
1401e0d57:     	movq	%rsi, %rcx
1401e0d5a:     	movq	%rdi, %rdx
1401e0d5d:     	callq	0x146061b30 <.text+0x6060b30>
1401e0d62:     	movq	0x8(%rsi), %rbx
1401e0d66:     	jmp	0x1401e0c71 <.text+0x1dfc71>
1401e0d6b:     	movq	$0x1, 0x20(%rsp)
1401e0d74:     	movl	$0x1, %r8d
1401e0d7a:     	movl	$0x1, %r9d
1401e0d80:     	movq	%rsi, %rcx
1401e0d83:     	movq	%rdi, %rdx
1401e0d86:     	callq	0x146061b30 <.text+0x6060b30>
1401e0d8b:     	movq	0x8(%rsi), %rbx
1401e0d8f:     	jmp	0x1401e0cbf <.text+0x1dfcbf>
// create-name-check
145bc3901:     	movq	%r12, %rdx
145bc3904:     	callq	0x145b20960 <.text+0x5b1f960>
145bc3909:     	nop
145bc390a:     	cmpb	$0x5, %al
145bc390c:     	ja	0x145bc45d9 <.text+0x5bc35d9>
145bc3912:     	movzbl	%al, %eax
145bc3915:     	leaq	0x14c2320(%rip), %rcx   # 0x147085c3c
145bc391c:     	movslq	(%rcx,%rax,4), %rax
145bc3920:     	addq	%rcx, %rax
145bc3923:     	movq	0x3168(%rbp), %r12
145bc392a:     	jmpq	*%rax
145bc392c:     	movb	$0x45, %r15b
145bc392f:     	jmp	0x145bc502d <.text+0x5bc402d>
// create-name-errors
145bc45b1:     	movb	$0x4f, %r15b
145bc45b4:     	jmp	0x145bc502d <.text+0x5bc402d>
145bc45b9:     	movb	$0x47, %r15b
145bc45bc:     	jmp	0x145bc502d <.text+0x5bc402d>
145bc45c1:     	movb	$0x48, %r15b
145bc45c4:     	jmp	0x145bc502d <.text+0x5bc402d>
145bc45c9:     	movb	$0x46, %r15b
145bc45cc:     	jmp	0x145bc502d <.text+0x5bc402d>
145bc45d1:     	movb	$0x50, %r15b
145bc45d4:     	jmp	0x145bc502d <.text+0x5bc402d>

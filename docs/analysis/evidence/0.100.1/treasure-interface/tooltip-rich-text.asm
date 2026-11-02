
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140110890:     	pushq	%rbp
140110891:     	pushq	%r15
140110893:     	pushq	%r14
140110895:     	pushq	%r13
140110897:     	pushq	%r12
140110899:     	pushq	%rsi
14011089a:     	pushq	%rdi
14011089b:     	pushq	%rbx
14011089c:     	subq	$0x188, %rsp            # imm = 0x188
1401108a3:     	leaq	0x80(%rsp), %rbp
1401108ab:     	movq	$-0x2, 0x100(%rbp)
1401108b6:     	movq	%rcx, %rdi
1401108b9:     	movq	(%rcx), %r12
1401108bc:     	movq	0x28(%rcx), %rax
1401108c0:     	movq	%r12, -0x30(%rbp)
1401108c4:     	movups	0x8(%rcx), %xmm0
1401108c8:     	movups	%xmm0, -0x28(%rbp)
1401108cc:     	movups	0x18(%rcx), %xmm0
1401108d0:     	movups	%xmm0, -0x18(%rbp)
1401108d4:     	movq	%rax, -0x8(%rbp)
1401108d8:     	movq	(%rdx), %r14
1401108db:     	movq	0x8(%rdx), %r15
1401108df:     	movq	0x10(%rdx), %rax
1401108e3:     	movq	%rax, %rcx
1401108e6:     	shlq	$0x4, %rcx
1401108ea:     	leaq	(%rcx,%rcx,2), %rsi
1401108ee:     	leaq	(%r15,%rsi), %r8
1401108f2:     	movq	%r15, 0xb8(%rbp)
1401108f9:     	movq	%r15, 0xc0(%rbp)
140110900:     	movq	%r14, 0xc8(%rbp)
140110907:     	movq	%r8, 0xd0(%rbp)
14011090e:     	movq	%r15, %r9
140110911:     	testq	%rax, %rax
140110914:     	je	0x140110a93 <.text+0x10fa93>
14011091a:     	movq	%r8, 0xf8(%rbp)
140110921:     	movq	%r14, 0xe8(%rbp)
140110928:     	movq	%rdi, 0xd8(%rbp)
14011092f:     	movq	0x18(%rdx), %r13
140110933:     	movq	0x20(%rdx), %rdi
140110937:     	leaq	0x8c(%rbp), %rbx
14011093e:     	leaq	0x10(%rbp), %r14
140110942:     	movq	%r15, 0xe0(%rbp)
140110949:     	leaq	0x30(%r15), %r9
14011094d:     	movq	%rbp, %r15
140110950:     	movq	-0x18(%r9), %rax
140110954:     	cmpq	$-0x1, %rax
140110958:     	je	0x140110a70 <.text+0x10fa70>
14011095e:     	leaq	-0x30(%r9), %rcx
140110962:     	movl	0x10(%rcx), %edx
140110965:     	movl	%edx, 0xb0(%rbp)
14011096b:     	movups	(%rcx), %xmm0
14011096e:     	movaps	%xmm0, 0xa0(%rbp)
140110975:     	movups	-0x10(%r9), %xmm0
14011097a:     	movaps	%xmm0, 0x70(%rbp)
14011097e:     	movss	(%rdi), %xmm0
140110982:     	cmpb	$0x1, (%r13)
140110987:     	movq	%r9, 0xf0(%rbp)
14011098e:     	jne	0x1401109b0 <.text+0x10f9b0>
140110990:     	leaq	0x1(%r13), %rdx
140110994:     	movl	(%rdx), %ecx
140110996:     	movl	0x3(%rdx), %edx
140110999:     	movl	%edx, -0x5d(%rbp)
14011099c:     	movl	%ecx, -0x60(%rbp)
14011099f:     	movq	0x8(%r13), %rcx
1401109a3:     	movzbl	0x10(%r13), %r8d
1401109a8:     	movb	$0x1, %dl
1401109aa:     	jmp	0x1401109c0 <.text+0x10f9c0>
1401109ac:     	nopl	(%rax)
1401109b0:     	movq	0x8(%r13), %rcx
1401109b4:     	lock
1401109b5:     	incq	(%rcx)
1401109b8:     	jle	0x140110b1a <.text+0x10fb1a>
1401109be:     	xorl	%edx, %edx
1401109c0:     	movaps	0x70(%rbp), %xmm1
1401109c4:     	movups	%xmm1, (%r14)
1401109c8:     	movl	-0x60(%rbp), %r9d
1401109cc:     	movl	-0x5d(%rbp), %r10d
1401109d0:     	movl	%r10d, 0x2c(%r14)
1401109d4:     	movl	%r9d, 0x29(%r14)
1401109d8:     	movl	0xb0(%rbp), %r9d
1401109df:     	movl	%r9d, 0x10(%rbx)
1401109e3:     	movaps	0xa0(%rbp), %xmm1
1401109ea:     	movups	%xmm1, (%rbx)
1401109ed:     	movq	%rax, 0x8(%rbp)
1401109f1:     	movq	$0x0, 0x20(%rbp)
1401109f9:     	movq	$0x4, 0x28(%rbp)
140110a01:     	movq	$0x0, 0x30(%rbp)
140110a09:     	movb	%dl, 0x38(%rbp)
140110a0c:     	movq	%rcx, 0x40(%rbp)
140110a10:     	movq	%r8, 0x48(%rbp)
140110a14:     	movss	%xmm0, 0x50(%rbp)
140110a19:     	movw	$0x190, 0x54(%rbp)      # imm = 0x190
140110a1f:     	movb	$0x1, 0x56(%rbp)
140110a23:     	movq	0x98(%rbp), %rax
140110a2a:     	movq	%rax, 0x54(%r14)
140110a2e:     	movups	0x8b(%rbp), %xmm0
140110a35:     	movups	%xmm0, 0x47(%r14)
140110a3a:     	movq	%r12, (%rbp)
140110a3e:     	leaq	-0x60(%rbp), %rcx
140110a42:     	leaq	-0x28(%rbp), %rdx
140110a46:     	movq	%r15, %r8
140110a49:     	callq	0x1400db9d0 <.text+0xda9d0>
140110a4e:     	nop
140110a4f:     	movq	0xf0(%rbp), %r9
140110a56:     	addq	$0x30, %r9
140110a5a:     	addq	$-0x30, %rsi
140110a5e:     	jne	0x140110950 <.text+0x10f950>
140110a64:     	movq	0xf8(%rbp), %r8
140110a6b:     	movq	%r8, %r9
140110a6e:     	jmp	0x140110a77 <.text+0x10fa77>
140110a70:     	movq	0xf8(%rbp), %r8
140110a77:     	movq	%r9, 0xc0(%rbp)
140110a7e:     	movq	0xd8(%rbp), %rdi
140110a85:     	movq	0xe0(%rbp), %r15
140110a8c:     	movq	0xe8(%rbp), %r14
140110a93:     	movq	%r8, %rax
140110a96:     	subq	%r9, %rax
140110a99:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
140110aa3:     	mulq	%rcx
140110aa6:     	cmpq	%r9, %r8
140110aa9:     	je	0x140110ae8 <.text+0x10fae8>
140110aab:     	movq	%rdx, %rbx
140110aae:     	shrq	$0x5, %rbx
140110ab2:     	addq	$0x20, %r9
140110ab6:     	jmp	0x140110ac9 <.text+0x10fac9>
140110ab8:     	nopl	(%rax,%rax)
140110ac0:     	addq	$0x30, %r9
140110ac4:     	decq	%rbx
140110ac7:     	je	0x140110ae8 <.text+0x10fae8>
140110ac9:     	movq	-0x8(%r9), %rdx
140110acd:     	testq	%rdx, %rdx
140110ad0:     	je	0x140110ac0 <.text+0x10fac0>
140110ad2:     	movq	(%r9), %rcx
140110ad5:     	movl	$0x1, %r8d
140110adb:     	movq	%r9, %rsi
140110ade:     	callq	0x1400021d0 <.text+0x11d0>
140110ae3:     	movq	%rsi, %r9
140110ae6:     	jmp	0x140110ac0 <.text+0x10fac0>
140110ae8:     	testq	%r14, %r14
140110aeb:     	je	0x140110b03 <.text+0x10fb03>
140110aed:     	shlq	$0x4, %r14
140110af1:     	leaq	(%r14,%r14,2), %rdx
140110af5:     	movl	$0x8, %r8d
140110afb:     	movq	%r15, %rcx
140110afe:     	callq	0x1400021d0 <.text+0x11d0>
140110b03:     	movq	%rdi, %rax
140110b06:     	addq	$0x188, %rsp            # imm = 0x188
140110b0d:     	popq	%rbx
140110b0e:     	popq	%rdi
140110b0f:     	popq	%rsi
140110b10:     	popq	%r12
140110b12:     	popq	%r13
140110b14:     	popq	%r14
140110b16:     	popq	%r15
140110b18:     	popq	%rbp
140110b19:     	retq
140110b1a:     	ud2

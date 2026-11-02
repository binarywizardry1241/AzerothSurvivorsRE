145402904:     	movq	%r14, 0x18(%rdi)
145402908:     	movq	%r12, 0x20(%rdi)
14540290c:     	movq	%r14, 0x28(%rdi)
145402910:     	movq	0x8(%rdi), %r14
145402914:     	movq	0x10(%rdi), %r8
145402918:     	leaq	-0x28(%rbp), %rcx
14540291c:     	movq	%r14, %rdx
14540291f:     	callq	0x145402fe0 <.text+0x5401fe0>
145402924:     	nop
145402925:     	movq	-0x10(%rbp), %rdi
145402929:     	movq	-0x28(%rbp), %r13
14540292d:     	cmpq	$-0x1, %r13
145402931:     	je	0x145402afd <.text+0x5401afd>
145402937:     	movq	-0x20(%rbp), %r15
14540293b:     	movq	-0x18(%rbp), %r12
14540293f:     	movq	(%rdi), %rdx
145402942:     	testq	%rdx, %rdx
145402945:     	je	0x145402955 <.text+0x5401955>
145402947:     	movl	$0x1, %r8d
14540294d:     	movq	%r14, %rcx
145402950:     	callq	0x1400021d0 <.text+0x11d0>
145402955:     	movq	%r13, (%rdi)
145402958:     	movq	%r15, 0x8(%rdi)
14540295c:     	movq	%r12, 0x10(%rdi)
145402960:     	movl	0x3b(%rdi), %eax
145402963:     	movzbl	0x3f(%rdi), %ecx
145402967:     	shlq	$0x20, %rcx
14540296b:     	orq	%rax, %rcx
14540296e:     	movl	%ebx, %edx
145402970:     	movzbl	-0x1(%rbp), %r8d
145402975:     	callq	0x14544e6f0 <.text+0x544d6f0>
14540297a:     	nop
14540297b:     	movq	-0x10(%rbp), %rdi
14540297f:     	movl	%eax, 0x3b(%rdi)
145402982:     	shrq	$0x20, %rax
145402986:     	movb	%al, 0x3f(%rdi)
145402989:     	movq	0x30(%rdi), %rax
14540298d:     	movq	%rax, %rdx
145402990:     	shrq	$0x20, %rdx
145402994:     	movzwl	%dx, %ecx
145402997:     	cmpl	$0x12c, %ecx            # imm = 0x12C
14540299d:     	movl	$0x12c, %r8d            # imm = 0x12C
1454029a3:     	cmovbl	%edx, %r8d
1454029a7:     	addl	$-0x64, %r8d
1454029ab:     	xorl	%ecx, %ecx
1454029ad:     	cmpw	$0x64, %dx
1454029b1:     	cmovbl	%ecx, %r8d
1454029b5:     	movzwl	%r8w, %edx
1454029b9:     	imull	$0xcccd, %edx, %edx     # imm = 0xCCCD
1454029bf:     	shrl	$0x12, %edx
1454029c2:     	andl	$-0x2, %edx
1454029c5:     	leal	(%rdx,%rdx,4), %edx
1454029c8:     	addl	$0x64, %edx
1454029cb:     	movl	%eax, %r8d
1454029ce:     	shrl	$0x10, %r8d
1454029d2:     	movl	%r8d, %r10d
1454029d5:     	cmpl	$0x1f4, %r8d            # imm = 0x1F4
1454029dc:     	movl	$0x1f4, %r9d            # imm = 0x1F4
1454029e2:     	cmovael	%r9d, %r8d
1454029e6:     	addl	$-0x64, %r8d
1454029ea:     	cmpw	$0x64, %r10w
1454029ef:     	cmovbl	%ecx, %r8d
1454029f3:     	movzwl	%r8w, %r10d
1454029f7:     	imull	$0x47af, %r10d, %r10d   # imm = 0x47AF
1454029fe:     	shrl	$0x10, %r10d
145402afd:     	callq	0x140002200 <.text+0x1200>
145402b02:     	movl	$0x4, %r12d
145402b08:     	movl	$0x4, %ecx
145402b0d:     	movl	$0x1, %edx
145402b12:     	callq	0x1400021c0 <.text+0x11c0>
145402b17:     	testq	%rax, %rax
145402b1a:     	je	0x145402b4c <.text+0x5401b4c>
145402b1c:     	movq	%rax, %r15
145402b1f:     	movl	$0x6f726548, (%rax)     # imm = 0x6F726548
145402b25:     	movl	$0x4, %r13d
145402b2b:     	movq	(%rdi), %rdx
145402b2e:     	testq	%rdx, %rdx
145402b31:     	jne	0x145402947 <.text+0x5401947>
145402b37:     	jmp	0x145402955 <.text+0x5401955>
145402b3c:     	movl	$0x1, %ecx
145402b41:     	movq	%r14, %rdx
145402b44:     	callq	0x1458a3b8b <.text+0x58a2b8b>
145402b49:     	nop
145402b4a:     	jmp	0x145402b5c <.text+0x5401b5c>
145402b4c:     	movl	$0x1, %ecx
145402b51:     	movl	$0x4, %edx
145402b56:     	callq	0x1458a3b8b <.text+0x58a2b8b>
145402b5b:     	nop
145402b5c:     	ud2
145402b5e:     	nop
145402b60:     	movq	%rdx, 0x10(%rsp)
145402b65:     	pushq	%rbp
145402b66:     	pushq	%r15
145402b68:     	pushq	%r14
145402b6a:     	pushq	%r13
145402b6c:     	pushq	%r12
145402b6e:     	pushq	%rsi
145402b6f:     	pushq	%rdi
145402b70:     	pushq	%rbx
145402b71:     	subq	$0x28, %rsp
145402b75:     	leaq	0x50(%rdx), %rbp
145402b79:     	movq	-0x10(%rbp), %rcx
145402b7d:     	callq	0x140091ec0 <.text+0x90ec0>
145402b82:     	nop
145402b83:     	addq	$0x28, %rsp
145402b87:     	popq	%rbx
145402b88:     	popq	%rdi
145402b89:     	popq	%rsi
145402b8a:     	popq	%r12
145402b8c:     	popq	%r13
145402b8e:     	popq	%r14
145402b90:     	popq	%r15
145402b92:     	popq	%rbp
145402b93:     	retq
145402b94:     	int3
145402b95:     	int3
145402b96:     	int3
145402b97:     	int3
145402b98:     	int3
145402b99:     	int3
145402b9a:     	int3
145402b9b:     	int3
145402b9c:     	int3
145402b9d:     	int3
145402b9e:     	int3
145402b9f:     	int3
145402ba0:     	pushq	%rbp
145402ba1:     	pushq	%rsi
145402ba2:     	pushq	%rdi
145402ba3:     	subq	$0x200, %rsp            # imm = 0x200
145402baa:     	leaq	0x80(%rsp), %rbp
145402bb2:     	movq	$-0x2, 0x178(%rbp)
145402bbd:     	movq	%rcx, %rsi
145402bc0:     	leaq	-0x60(%rbp), %rdi
145402bc4:     	movq	%rdi, %rcx
145402bc7:     	callq	0x1453f9d00 <.text+0x53f8d00>
145402bcc:     	nop
145402bcd:     	leaq	0x158(%rbp), %rcx
145402bd4:     	movq	%rdi, %rdx
145402bd7:     	callq	0x1453ff1b0 <.text+0x53fe1b0>
145402bdc:     	nop
145402bdd:     	movq	0x160(%rbp), %rdx
145402be4:     	movq	0x168(%rbp), %r8
145402beb:     	movq	%rsi, %rcx
145402bee:     	movq	%rdx, 0x170(%rbp)
145402bf5:     	callq	0x145456e30 <.text+0x5455e30>
145402bfa:     	nop
145402bfb:     	movq	0x158(%rbp), %rdx

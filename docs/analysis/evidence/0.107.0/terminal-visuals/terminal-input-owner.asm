
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14010a880:     	pushq	%rbp
14010a881:     	pushq	%r15
14010a883:     	pushq	%r14
14010a885:     	pushq	%r13
14010a887:     	pushq	%r12
14010a889:     	pushq	%rsi
14010a88a:     	pushq	%rdi
14010a88b:     	pushq	%rbx
14010a88c:     	subq	$0x1c8, %rsp            # imm = 0x1C8
14010a893:     	leaq	0x80(%rsp), %rbp
14010a89b:     	movaps	%xmm7, 0x130(%rbp)
14010a8a2:     	movaps	%xmm6, 0x120(%rbp)
14010a8a9:     	movq	$-0x2, 0x118(%rbp)
14010a8b4:     	movq	0x1b0(%rbp), %rax
14010a8bb:     	movq	(%rdx), %rcx
14010a8be:     	movq	0x8(%rdx), %r15
14010a8c2:     	movl	0x14(%rdx), %r14d
14010a8c6:     	movq	(%r8), %r8
14010a8c9:     	movq	%r8, 0x98(%rbp)
14010a8d0:     	movq	(%r9), %r8
14010a8d3:     	movq	0x10(%r9), %r10
14010a8d7:     	movq	%r10, 0xc8(%rbp)
14010a8de:     	movl	0x1c(%r9), %r9d
14010a8e2:     	movl	%r9d, 0xf4(%rbp)
14010a8e9:     	movq	(%rax), %rax
14010a8ec:     	movq	%rax, 0x90(%rbp)
14010a8f3:     	movq	0xf8(%rcx), %rdi
14010a8fa:     	movq	0x100(%rcx), %rax
14010a901:     	leaq	(%rdi,%rax,4), %rsi
14010a905:     	movq	%rcx, 0xb8(%rbp)
14010a90c:     	movzbl	0x108(%rcx), %ecx
14010a913:     	movl	%r14d, %eax
14010a916:     	subl	0x10(%rdx), %eax
14010a919:     	movl	%ecx, %edx
14010a91b:     	cmpl	$0xc233b000, %eax       # imm = 0xC233B000
14010a920:     	movl	$0xc233b000, %ecx       # imm = 0xC233B000
14010a925:     	cmovbl	%eax, %ecx
14010a928:     	movl	%ecx, 0xec(%rbp)
14010a92e:     	movq	%r8, 0xa0(%rbp)
14010a935:     	leaq	0xa0(%r8), %r9
14010a93c:     	movss	0x5c95ae0(%rip), %xmm6  # 0x145da0424
14010a944:     	movss	0x5c8cb34(%rip), %xmm7  # 0x145d97480
14010a94c:     	xorl	%r13d, %r13d
14010a94f:     	movl	$0x8, %eax
14010a954:     	movq	%rax, 0xc0(%rbp)
14010a95b:     	movq	$0x0, 0xe0(%rbp)
14010a966:     	movq	$0x0, 0x108(%rbp)
14010a971:     	xorl	%ebx, %ebx
14010a973:     	xorl	%r12d, %r12d
14010a976:     	movq	$0x0, 0x100(%rbp)
14010a981:     	movq	$0x0, 0xf8(%rbp)
14010a98c:     	movb	%dl, 0x117(%rbp)
14010a992:     	movq	%r9, 0xd8(%rbp)
14010a999:     	testb	%dl, %dl
14010a99b:     	movl	%r14d, 0xf0(%rbp)
14010a9a2:     	jne	0x14010a9ec <.text+0x1099ec>
14010a9a4:     	movq	0xc0(%rbp), %rdx
14010a9ab:     	jmp	0x14010abca <.text+0x109bca>
14010a9b0:     	movq	$0x0, 0x108(%rbp)
14010a9bb:     	movq	0x128(%r9), %rdx
14010a9c2:     	callq	0x144e493f0 <.text+0x4e483f0>
14010a9c7:     	movq	%rax, %rbx
14010a9ca:     	movq	(%r14), %r13
14010a9cd:     	movl	0xf0(%rbp), %r14d
14010a9d4:     	movl	%r12d, %eax
14010a9d7:     	incl	%r12d
14010a9da:     	movl	%r14d, %ecx
14010a9dd:     	subl	(%rbx,%rax,4), %ecx
14010a9e0:     	cmpl	0xec(%rbp), %ecx
14010a9e6:     	jb	0x14010ad71 <.text+0x109d71>
14010a9ec:     	cmpl	%r13d, %r12d
14010a9ef:     	jne	0x14010a9d4 <.text+0x1099d4>
14010a9f1:     	cmpq	%rsi, %rdi
14010a9f4:     	movq	0xb8(%rbp), %r9
14010a9fb:     	je	0x14010af3d <.text+0x109f3d>
14010aa01:     	movl	(%rdi), %ecx
14010aa03:     	addq	$0x4, %rdi
14010aa07:     	movq	0x1a8(%r15), %rax
14010aa0e:     	leaq	(%rcx,%rcx,8), %rdx
14010aa12:     	cmpq	$0x0, 0x10(%rax,%rdx,8)
14010aa18:     	je	0x14010aa40 <.text+0x109a40>
14010aa1a:     	leaq	(%rax,%rdx,8), %rcx
14010aa1e:     	leaq	(%rax,%rdx,8), %r14
14010aa22:     	addq	$0x10, %r14
14010aa26:     	movq	0x110(%r9), %rdx
14010aa2d:     	movq	0x40(%rcx), %rax
14010aa31:     	cmpq	%rax, %rdx
14010aa34:     	jae	0x14010aab0 <.text+0x109ab0>
14010aa36:     	jmp	0x14010aa7a <.text+0x109a7a>
14010aa38:     	nopl	(%rax,%rax)
14010aa40:     	cmpq	%rsi, %rdi
14010aa43:     	je	0x14010af3d <.text+0x109f3d>
14010aa49:     	movl	(%rdi), %ecx
14010aa4b:     	addq	$0x4, %rdi
14010aa4f:     	movq	0x1a8(%r15), %rax
14010aa56:     	leaq	(%rcx,%rcx,8), %rcx
14010aa5a:     	cmpq	$0x0, 0x10(%rax,%rcx,8)
14010aa60:     	je	0x14010aa40 <.text+0x109a40>
14010aa62:     	leaq	(%rax,%rcx,8), %rcx
14010aa66:     	leaq	0x10(%rcx), %r14
14010aa6a:     	movq	0x110(%r9), %rdx
14010aa71:     	movq	0x40(%rcx), %rax
14010aa75:     	cmpq	%rax, %rdx
14010aa78:     	jae	0x14010aab0 <.text+0x109ab0>
14010aa7a:     	movq	0x38(%rcx), %r8
14010aa7e:     	movq	(%r8,%rdx,8), %rdx
14010aa82:     	testq	%rdx, %rdx
14010aa85:     	je	0x14010aab0 <.text+0x109ab0>
14010aa87:     	movq	0x18(%rcx), %r8
14010aa8b:     	notq	%rdx
14010aa8e:     	leaq	(%rdx,%rdx,2), %rdx
14010aa92:     	shlq	$0x4, %rdx
14010aa96:     	movq	0x10(%r8,%rdx), %rdx
14010aa9b:     	movq	%rdx, 0xf8(%rbp)
14010aaa2:     	movq	0x118(%r9), %rdx
14010aaa9:     	cmpq	%rax, %rdx
14010aaac:     	jb	0x14010aac7 <.text+0x109ac7>
14010aaae:     	jmp	0x14010ab10 <.text+0x109b10>
14010aab0:     	movq	$0x0, 0xf8(%rbp)
14010aabb:     	movq	0x118(%r9), %rdx
14010aac2:     	cmpq	%rax, %rdx
14010aac5:     	jae	0x14010ab10 <.text+0x109b10>
14010aac7:     	movq	0x38(%rcx), %r8
14010aacb:     	movq	(%r8,%rdx,8), %rdx
14010aacf:     	testq	%rdx, %rdx
14010aad2:     	je	0x14010ab10 <.text+0x109b10>
14010aad4:     	movq	0x18(%rcx), %r8
14010aad8:     	notq	%rdx
14010aadb:     	leaq	(%rdx,%rdx,2), %rdx
14010aadf:     	shlq	$0x4, %rdx
14010aae3:     	movq	0x10(%r8,%rdx), %rdx
14010aae8:     	movq	%rdx, 0x100(%rbp)
14010aaef:     	movq	0x120(%r9), %rdx
14010aaf6:     	xorl	%r12d, %r12d
14010aaf9:     	cmpq	%rax, %rdx
14010aafc:     	jae	0x14010a9b0 <.text+0x1099b0>
14010ab02:     	jmp	0x14010ab2e <.text+0x109b2e>
14010ab04:     	nopw	%cs:(%rax,%rax)
14010ab10:     	movq	$0x0, 0x100(%rbp)
14010ab1b:     	movq	0x120(%r9), %rdx
14010ab22:     	xorl	%r12d, %r12d
14010ab25:     	cmpq	%rax, %rdx
14010ab28:     	jae	0x14010a9b0 <.text+0x1099b0>
14010ab2e:     	movq	0x38(%rcx), %rax
14010ab32:     	movq	(%rax,%rdx,8), %rax
14010ab36:     	testq	%rax, %rax
14010ab39:     	je	0x14010a9b0 <.text+0x1099b0>
14010ab3f:     	movq	0x18(%rcx), %rdx
14010ab43:     	notq	%rax
14010ab46:     	leaq	(%rax,%rax,2), %rax
14010ab4a:     	shlq	$0x4, %rax
14010ab4e:     	movq	0x10(%rdx,%rax), %r8
14010ab53:     	movq	%r8, 0xe0(%rbp)
14010ab5a:     	movq	0x28(%rdx,%rax), %rax
14010ab5f:     	movq	%rax, 0xd0(%rbp)
14010ab66:     	movb	$0x1, %al
14010ab68:     	movq	%rax, 0x108(%rbp)
14010ab6f:     	jmp	0x14010a9bb <.text+0x1099bb>
14010ab74:     	nopw	%cs:(%rax,%rax)
14010ab80:     	movq	$0x0, 0x108(%rbp)
14010ab8b:     	movq	0x128(%r9), %rdx
14010ab92:     	callq	0x144e493f0 <.text+0x4e483f0>
14010ab97:     	movq	%rax, %rbx
14010ab9a:     	movq	0x50(%r13), %rdx
14010ab9e:     	movq	(%r14), %r13
14010aba1:     	movl	0xf0(%rbp), %r14d
14010aba8:     	movl	%r12d, %eax
14010abab:     	shlq	$0x4, %rax
14010abaf:     	incl	%r12d
14010abb2:     	movl	0x8(%rdx,%rax), %eax
14010abb6:     	notl	%eax
14010abb8:     	movl	%r14d, %ecx
14010abbb:     	subl	(%rbx,%rax,4), %ecx
14010abbe:     	cmpl	0xec(%rbp), %ecx
14010abc4:     	jb	0x14010adcf <.text+0x109dcf>
14010abca:     	cmpl	%r13d, %r12d
14010abcd:     	jne	0x14010aba8 <.text+0x109ba8>
14010abcf:     	cmpq	%rsi, %rdi
14010abd2:     	movq	0xb8(%rbp), %r9
14010abd9:     	je	0x14010af3d <.text+0x109f3d>
14010abdf:     	movl	(%rdi), %ecx
14010abe1:     	addq	$0x4, %rdi
14010abe5:     	movq	0x108(%r15), %rax
14010abec:     	leaq	(%rcx,%rcx,4), %rcx
14010abf0:     	shlq	$0x5, %rcx
14010abf4:     	cmpq	$0x0, 0x58(%rax,%rcx)
14010abfa:     	je	0x14010ac10 <.text+0x109c10>
14010abfc:     	leaq	(%rax,%rcx), %r13
14010ac00:     	leaq	(%rax,%rcx), %r14
14010ac04:     	addq	$0x58, %r14
14010ac08:     	jmp	0x14010ac3d <.text+0x109c3d>
14010ac0a:     	nopw	(%rax,%rax)
14010ac10:     	cmpq	%rsi, %rdi
14010ac13:     	je	0x14010af3d <.text+0x109f3d>
14010ac19:     	movl	(%rdi), %eax
14010ac1b:     	addq	$0x4, %rdi
14010ac1f:     	movq	0x108(%r15), %r13
14010ac26:     	leaq	(%rax,%rax,4), %rax
14010ac2a:     	shlq	$0x5, %rax
14010ac2e:     	cmpq	$0x0, 0x58(%r13,%rax)
14010ac34:     	je	0x14010ac10 <.text+0x109c10>
14010ac36:     	addq	%rax, %r13
14010ac39:     	leaq	0x58(%r13), %r14
14010ac3d:     	movl	0x94(%r13), %eax
14010ac44:     	movq	0x1a8(%r15), %r8
14010ac4b:     	leaq	(%rax,%rax,8), %rax
14010ac4f:     	leaq	(%r8,%rax,8), %rcx
14010ac53:     	movq	0x110(%r9), %rdx
14010ac5a:     	movq	0x40(%r8,%rax,8), %rax
14010ac5f:     	cmpq	%rax, %rdx
14010ac62:     	jae	0x14010aca0 <.text+0x109ca0>
14010ac64:     	movq	0x38(%rcx), %r8
14010ac68:     	movq	(%r8,%rdx,8), %rdx
14010ac6c:     	testq	%rdx, %rdx
14010ac6f:     	je	0x14010aca0 <.text+0x109ca0>
14010ac71:     	movq	0x18(%rcx), %r8
14010ac75:     	notq	%rdx
14010ac78:     	leaq	(%rdx,%rdx,2), %rdx
14010ac7c:     	shlq	$0x4, %rdx
14010ac80:     	movq	0x10(%r8,%rdx), %rdx
14010ac85:     	movq	%rdx, 0xf8(%rbp)
14010ac8c:     	movq	0x118(%r9), %rdx
14010ac93:     	cmpq	%rax, %rdx
14010ac96:     	jb	0x14010acb7 <.text+0x109cb7>
14010ac98:     	jmp	0x14010ad00 <.text+0x109d00>
14010ac9a:     	nopw	(%rax,%rax)
14010aca0:     	movq	$0x0, 0xf8(%rbp)
14010acab:     	movq	0x118(%r9), %rdx
14010acb2:     	cmpq	%rax, %rdx
14010acb5:     	jae	0x14010ad00 <.text+0x109d00>
14010acb7:     	movq	0x38(%rcx), %rax
14010acbb:     	movq	(%rax,%rdx,8), %rax
14010acbf:     	testq	%rax, %rax
14010acc2:     	je	0x14010ad00 <.text+0x109d00>
14010acc4:     	movq	0x18(%rcx), %rdx
14010acc8:     	notq	%rax
14010accb:     	leaq	(%rax,%rax,2), %rax
14010accf:     	shlq	$0x4, %rax
14010acd3:     	movq	0x10(%rdx,%rax), %rax
14010acd8:     	movq	%rax, 0x100(%rbp)
14010acdf:     	movq	0x120(%r9), %rax
14010ace6:     	xorl	%r12d, %r12d
14010ace9:     	cmpq	0x88(%r13), %rax
14010acf0:     	jae	0x14010ab80 <.text+0x109b80>
14010acf6:     	jmp	0x14010ad22 <.text+0x109d22>
14010acf8:     	nopl	(%rax,%rax)
14010ad00:     	movq	$0x0, 0x100(%rbp)
14010ad0b:     	movq	0x120(%r9), %rax
14010ad12:     	xorl	%r12d, %r12d
14010ad15:     	cmpq	0x88(%r13), %rax
14010ad1c:     	jae	0x14010ab80 <.text+0x109b80>
14010ad22:     	movq	0x80(%r13), %rdx
14010ad29:     	cmpq	$0x0, (%rdx,%rax,8)
14010ad2e:     	je	0x14010ab80 <.text+0x109b80>
14010ad34:     	movq	0x18(%rcx), %rdx
14010ad38:     	movq	0x38(%rcx), %r8
14010ad3c:     	movq	(%r8,%rax,8), %rax
14010ad40:     	notq	%rax
14010ad43:     	leaq	(%rax,%rax,2), %rax
14010ad47:     	shlq	$0x4, %rax
14010ad4b:     	movq	0x10(%rdx,%rax), %r8
14010ad50:     	movq	%r8, 0xe0(%rbp)
14010ad57:     	movq	0x28(%rdx,%rax), %rax
14010ad5c:     	movq	%rax, 0xd0(%rbp)
14010ad63:     	movb	$0x1, %al
14010ad65:     	movq	%rax, 0x108(%rbp)
14010ad6c:     	jmp	0x14010ab8b <.text+0x109b8b>
14010ad71:     	movq	0xf8(%rbp), %rcx
14010ad78:     	leaq	(%rcx,%rax), %rdx
14010ad7c:     	movq	0x100(%rbp), %rcx
14010ad83:     	addq	%rax, %rcx
14010ad86:     	cmpb	$0x1, 0x108(%rbp)
14010ad8d:     	jne	0x14010ae2d <.text+0x109e2d>
14010ad93:     	movq	0xd0(%rbp), %r8
14010ad9a:     	leaq	(%r8,%rax,4), %r8
14010ad9e:     	shlq	$0x5, %rax
14010ada2:     	addq	0xe0(%rbp), %rax
14010ada9:     	movb	$0x1, %r10b
14010adac:     	movq	%r10, 0x108(%rbp)
14010adb3:     	movq	%r8, 0xa8(%rbp)
14010adba:     	cmpb	$0x0, (%rdx)
14010adbd:     	movzbl	0x117(%rbp), %edx
14010adc4:     	jne	0x14010a999 <.text+0x109999>
14010adca:     	jmp	0x14010ae77 <.text+0x109e77>
14010adcf:     	movq	%rdx, 0xc0(%rbp)
14010add6:     	movq	0xf8(%rbp), %rcx
14010addd:     	leaq	(%rcx,%rax), %rdx
14010ade1:     	movq	0x100(%rbp), %rcx
14010ade8:     	addq	%rax, %rcx
14010adeb:     	cmpb	$0x1, 0x108(%rbp)
14010adf2:     	jne	0x14010ae53 <.text+0x109e53>
14010adf4:     	movq	0xd0(%rbp), %r8
14010adfb:     	leaq	(%r8,%rax,4), %r8
14010adff:     	shlq	$0x5, %rax
14010ae03:     	addq	0xe0(%rbp), %rax
14010ae0a:     	movb	$0x1, %r10b
14010ae0d:     	movq	%r10, 0x108(%rbp)
14010ae14:     	movq	%r8, 0xb0(%rbp)
14010ae1b:     	cmpb	$0x0, (%rdx)
14010ae1e:     	movzbl	0x117(%rbp), %edx
14010ae25:     	jne	0x14010a999 <.text+0x109999>
14010ae2b:     	jmp	0x14010ae77 <.text+0x109e77>
14010ae2d:     	movq	$0x0, 0x108(%rbp)
14010ae38:     	movq	0xa8(%rbp), %r8
14010ae3f:     	xorl	%eax, %eax
14010ae41:     	cmpb	$0x0, (%rdx)
14010ae44:     	movzbl	0x117(%rbp), %edx
14010ae4b:     	jne	0x14010a999 <.text+0x109999>
14010ae51:     	jmp	0x14010ae77 <.text+0x109e77>
14010ae53:     	movq	$0x0, 0x108(%rbp)
14010ae5e:     	movq	0xb0(%rbp), %r8
14010ae65:     	xorl	%eax, %eax
14010ae67:     	cmpb	$0x0, (%rdx)
14010ae6a:     	movzbl	0x117(%rbp), %edx
14010ae71:     	jne	0x14010a999 <.text+0x109999>
14010ae77:     	testq	%rax, %rax
14010ae7a:     	je	0x14010aeb5 <.text+0x109eb5>
14010ae7c:     	movl	%r14d, (%r8)
14010ae7f:     	movq	0x90(%rbp), %rdx
14010ae86:     	movss	0x8c(%rdx), %xmm0
14010ae8e:     	movzbl	0x117(%rbp), %edx
14010ae95:     	cmpl	$0x1, 0x18(%rax)
14010ae99:     	jne	0x14010af2c <.text+0x109f2c>
14010ae9f:     	movaps	%xmm0, %xmm1
14010aea2:     	subss	0x1c(%rax), %xmm1
14010aea7:     	ucomiss	%xmm1, %xmm6
14010aeaa:     	ja	0x14010a999 <.text+0x109999>
14010aeb0:     	ucomiss	%xmm1, %xmm7
14010aeb3:     	jbe	0x14010af2c <.text+0x109f2c>
14010aeb5:     	movzbl	(%rcx), %eax
14010aeb8:     	leaq	0x5ca4ed9(%rip), %rcx   # 0x145dafd98
14010aebf:     	movl	(%rcx,%rax,4), %eax
14010aec2:     	movl	%eax, -0x58(%rbp)
14010aec5:     	movq	0x98(%rbp), %rcx
14010aecc:     	leaq	-0x58(%rbp), %rdx
14010aed0:     	callq	0x1400108d0 <.text+0xf8d0>
14010aed5:     	movq	0xc8(%rbp), %rax
14010aedc:     	movl	0xf4(%rbp), %ecx
14010aee2:     	movl	%ecx, (%rax)
14010aee4:     	movq	0xd8(%rbp), %rax
14010aeeb:     	cmpb	$-0x1, (%rax)
14010aeee:     	je	0x14010aefd <.text+0x109efd>
14010aef0:     	movq	0xd8(%rbp), %rcx
14010aef7:     	callq	0x1400faa30 <.text+0xf9a30>
14010aefc:     	nop
14010aefd:     	movq	0xa0(%rbp), %rax
14010af04:     	movb	$-0x1, 0xa0(%rax)
14010af0b:     	movq	0xc8(%rbp), %rcx
14010af12:     	movl	0xf4(%rbp), %edx
14010af18:     	movl	%edx, (%rcx)
14010af1a:     	incl	0xe4(%rax)
14010af20:     	movzbl	0x117(%rbp), %edx
14010af27:     	jmp	0x14010a999 <.text+0x109999>
14010af2c:     	movl	$0x1, 0x18(%rax)
14010af33:     	movss	%xmm0, 0x1c(%rax)
14010af38:     	jmp	0x14010a999 <.text+0x109999>
14010af3d:     	movaps	0x120(%rbp), %xmm6
14010af44:     	movaps	0x130(%rbp), %xmm7
14010af4b:     	addq	$0x1c8, %rsp            # imm = 0x1C8
14010af52:     	popq	%rbx
14010af53:     	popq	%rdi
14010af54:     	popq	%rsi
14010af55:     	popq	%r12
14010af57:     	popq	%r13
14010af59:     	popq	%r14
14010af5b:     	popq	%r15
14010af5d:     	popq	%rbp
14010af5e:     	retq

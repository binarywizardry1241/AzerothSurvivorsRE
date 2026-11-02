
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c0790:     	pushq	%rbp
1400c0791:     	pushq	%r15
1400c0793:     	pushq	%r14
1400c0795:     	pushq	%r13
1400c0797:     	pushq	%r12
1400c0799:     	pushq	%rsi
1400c079a:     	pushq	%rdi
1400c079b:     	pushq	%rbx
1400c079c:     	subq	$0x348, %rsp            # imm = 0x348
1400c07a3:     	leaq	0x80(%rsp), %rbp
1400c07ab:     	movaps	%xmm6, 0x2b0(%rbp)
1400c07b2:     	movq	$-0x2, 0x2a8(%rbp)
1400c07bd:     	movq	%r8, %rbx
1400c07c0:     	movq	%rdx, %rsi
1400c07c3:     	movq	%rcx, %rdi
1400c07c6:     	leaq	0x1f0(%rbp), %rcx
1400c07cd:     	movq	%r8, %rdx
1400c07d0:     	callq	0x14570c440 <.text+0x570b440>
1400c07d5:     	cmpq	$-0x1, 0x48(%rbx)
1400c07da:     	je	0x1400c07ff <.text+0xbf7ff>
1400c07dc:     	leaq	0x48(%rbx), %rdx
1400c07e0:     	movb	$0x1, 0x2a6(%rbp)
1400c07e7:     	leaq	-0x20(%rbp), %rcx
1400c07eb:     	callq	0x14570c440 <.text+0x570b440>
1400c07f0:     	nop
1400c07f1:     	movq	-0x20(%rbp), %rax
1400c07f5:     	movups	-0x18(%rbp), %xmm0
1400c07f9:     	movaps	%xmm0, -0x50(%rbp)
1400c07fd:     	jmp	0x1400c0806 <.text+0xbf806>
1400c07ff:     	movq	$-0x1, %rax
1400c0806:     	movq	%rdi, -0x8(%rbp)
1400c080a:     	movl	$0x41800000, (%rbp)     # imm = 0x41800000
1400c0811:     	movups	0x1f0(%rbp), %xmm0
1400c0818:     	movaps	%xmm0, -0x20(%rbp)
1400c081c:     	movq	0x200(%rbp), %rcx
1400c0823:     	movq	%rcx, -0x10(%rbp)
1400c0827:     	leaq	0x8(%rbp), %r14
1400c082b:     	movq	%rax, 0x8(%rbp)
1400c082f:     	movaps	-0x50(%rbp), %xmm0
1400c0833:     	movaps	%xmm0, 0x10(%rbp)
1400c0837:     	movb	$0x0, 0x2a6(%rbp)
1400c083e:     	movq	%r14, 0x20(%rsp)
1400c0843:     	movss	0x583c059(%rip), %xmm2  # 0x1458fc8a4
1400c084b:     	leaq	-0x20(%rbp), %r9
1400c084f:     	movq	%rsi, %rcx
1400c0852:     	movq	%rdi, %rdx
1400c0855:     	callq	0x1400bd120 <.text+0xbc120>
1400c085a:     	nop
1400c085b:     	cmpq	$-0x1, 0x60(%rbx)
1400c0860:     	je	0x1400c08b7 <.text+0xbf8b7>
1400c0862:     	leaq	0x60(%rbx), %rdx
1400c0866:     	leaq	0x1f0(%rbp), %rcx
1400c086d:     	callq	0x14570c440 <.text+0x570b440>
1400c0872:     	movq	0x1f0(%rbp), %rax
1400c0879:     	movups	0x1f8(%rbp), %xmm0
1400c0880:     	movups	%xmm0, -0x18(%rbp)
1400c0884:     	movq	%rdi, -0x8(%rbp)
1400c0888:     	movl	$0x41500000, (%rbp)     # imm = 0x41500000
1400c088f:     	movq	%rax, -0x20(%rbp)
1400c0893:     	movq	$-0x1, 0x8(%rbp)
1400c089b:     	movq	%r14, 0x20(%rsp)
1400c08a0:     	movss	0x583c000(%rip), %xmm2  # 0x1458fc8a8
1400c08a8:     	leaq	-0x20(%rbp), %r9
1400c08ac:     	movq	%rsi, %rcx
1400c08af:     	movq	%rdi, %rdx
1400c08b2:     	callq	0x1400bd120 <.text+0xbc120>
1400c08b7:     	movq	0x78(%rbx), %rax
1400c08bb:     	movq	0x90(%rbx), %r15
1400c08c2:     	movq	%rax, %rcx
1400c08c5:     	andq	%r15, %rcx
1400c08c8:     	cmpq	$-0x1, %rcx
1400c08cc:     	je	0x1400c097d <.text+0xbf97d>
1400c08d2:     	cmpq	$-0x1, %rax
1400c08d6:     	je	0x1400c0914 <.text+0xbf914>
1400c08d8:     	leaq	0x78(%rbx), %rdx
1400c08dc:     	leaq	0x1f0(%rbp), %rcx
1400c08e3:     	callq	0x14570c440 <.text+0x570b440>
1400c08e8:     	cmpq	$-0x1, %r15
1400c08ec:     	je	0x1400c0925 <.text+0xbf925>
1400c08ee:     	leaq	0x90(%rbx), %rdx
1400c08f5:     	movb	$0x1, 0x2a5(%rbp)
1400c08fc:     	leaq	-0x20(%rbp), %rcx
1400c0900:     	callq	0x14570c440 <.text+0x570b440>
1400c0905:     	nop
1400c0906:     	movq	-0x20(%rbp), %rax
1400c090a:     	movups	-0x18(%rbp), %xmm0
1400c090e:     	movaps	%xmm0, -0x50(%rbp)
1400c0912:     	jmp	0x1400c092c <.text+0xbf92c>
1400c0914:     	movq	$-0x1, 0x1f0(%rbp)
1400c091f:     	cmpq	$-0x1, %r15
1400c0923:     	jne	0x1400c08ee <.text+0xbf8ee>
1400c0925:     	movq	$-0x1, %rax
1400c092c:     	movq	%rdi, -0x8(%rbp)
1400c0930:     	movl	$0x41500000, (%rbp)     # imm = 0x41500000
1400c0937:     	movups	0x1f0(%rbp), %xmm0
1400c093e:     	movaps	%xmm0, -0x20(%rbp)
1400c0942:     	movq	0x200(%rbp), %rcx
1400c0949:     	movq	%rcx, -0x10(%rbp)
1400c094d:     	movq	%rax, 0x8(%rbp)
1400c0951:     	movaps	-0x50(%rbp), %xmm0
1400c0955:     	movaps	%xmm0, 0x10(%rbp)
1400c0959:     	movb	$0x0, 0x2a5(%rbp)
1400c0960:     	movq	%r14, 0x20(%rsp)
1400c0965:     	movss	0x583bf3b(%rip), %xmm2  # 0x1458fc8a8
1400c096d:     	leaq	-0x20(%rbp), %r9
1400c0971:     	movq	%rsi, %rcx
1400c0974:     	movq	%rdi, %rdx
1400c0977:     	callq	0x1400bd120 <.text+0xbc120>
1400c097c:     	nop
1400c097d:     	movq	0x28(%rbx), %r12
1400c0981:     	testq	%r12, %r12
1400c0984:     	je	0x1400c121c <.text+0xc021c>
1400c098a:     	movq	0x20(%rbx), %rbx
1400c098e:     	movl	$0x41500000, 0x26c(%rbp) # imm = 0x41500000
1400c0998:     	movq	$0x0, 0x280(%rbp)
1400c09a3:     	movq	$0x8, 0x288(%rbp)
1400c09ae:     	movq	$0x0, 0x290(%rbp)
1400c09b9:     	movups	0x583d624(%rip), %xmm6  # 0x1458fdfe4
1400c09c0:     	movaps	%xmm6, 0x250(%rbp)
1400c09c7:     	testq	%r12, %r12
1400c09ca:     	je	0x1400c0f17 <.text+0xbff17>
1400c09d0:     	xorl	%r14d, %r14d
1400c09d3:     	jmp	0x1400c09ec <.text+0xbf9ec>
1400c09d5:     	nopw	%cs:(%rax,%rax)
1400c09e0:     	movq	%rax, %r14
1400c09e3:     	cmpq	%r12, %rax
1400c09e6:     	ja	0x1400c0aa0 <.text+0xbfaa0>
1400c09ec:     	movq	%r12, %r8
1400c09ef:     	subq	%r14, %r8
1400c09f2:     	leaq	(%rbx,%r14), %rdx
1400c09f6:     	cmpq	$0x10, %r8
1400c09fa:     	jae	0x1400c0a30 <.text+0xbfa30>
1400c09fc:     	xorl	%r13d, %r13d
1400c09ff:     	testq	%r8, %r8
1400c0a02:     	je	0x1400c0a22 <.text+0xbfa22>
1400c0a04:     	nopw	%cs:(%rax,%rax)
1400c0a10:     	cmpb	$0x7c, (%rdx,%r13)
1400c0a15:     	je	0x1400c0a4a <.text+0xbfa4a>
1400c0a17:     	incq	%r13
1400c0a1a:     	cmpq	%r13, %r8
1400c0a1d:     	jne	0x1400c0a10 <.text+0xbfa10>
1400c0a1f:     	movq	%r8, %r13
1400c0a22:     	xorl	%eax, %eax
1400c0a24:     	cmpq	$0x1, %rax
1400c0a28:     	je	0x1400c0a60 <.text+0xbfa60>
1400c0a2a:     	jmp	0x1400c0aa0 <.text+0xbfaa0>
1400c0a2c:     	nopl	(%rax)
1400c0a30:     	movb	$0x1, 0x2a7(%rbp)
1400c0a37:     	movb	$0x7c, %cl
1400c0a39:     	callq	0x145714db0 <.text+0x5713db0>
1400c0a3e:     	nop
1400c0a3f:     	movq	%rdx, %r13
1400c0a42:     	cmpq	$0x1, %rax
1400c0a46:     	je	0x1400c0a60 <.text+0xbfa60>
1400c0a48:     	jmp	0x1400c0aa0 <.text+0xbfaa0>
1400c0a4a:     	movl	$0x1, %eax
1400c0a4f:     	cmpq	$0x1, %rax
1400c0a53:     	jne	0x1400c0aa0 <.text+0xbfaa0>
1400c0a55:     	nopw	%cs:(%rax,%rax)
1400c0a60:     	leaq	(%r14,%r13), %rax
1400c0a64:     	incq	%rax
1400c0a67:     	addq	%r14, %r13
1400c0a6a:     	cmpq	%r12, %r13
1400c0a6d:     	jae	0x1400c09e0 <.text+0xbf9e0>
1400c0a73:     	movzbl	(%rbx,%r13), %ecx
1400c0a78:     	cmpq	%r12, %rax
1400c0a7b:     	ja	0x1400c0a89 <.text+0xbfa89>
1400c0a7d:     	movq	%rax, %r14
1400c0a80:     	cmpb	$0x7c, %cl
1400c0a83:     	jne	0x1400c09ec <.text+0xbf9ec>
1400c0a89:     	cmpb	$0x7c, %cl
1400c0a8c:     	je	0x1400c0aa3 <.text+0xbfaa3>
1400c0a8e:     	movaps	0x250(%rbp), %xmm0
1400c0a95:     	movaps	%xmm0, -0x20(%rbp)
1400c0a99:     	jmp	0x1400c0af6 <.text+0xbfaf6>
1400c0a9b:     	nopl	(%rax,%rax)
1400c0aa0:     	movq	%r12, %r13
1400c0aa3:     	testq	%r13, %r13
1400c0aa6:     	je	0x1400c0ae0 <.text+0xbfae0>
1400c0aa8:     	movaps	0x250(%rbp), %xmm0
1400c0aaf:     	movaps	%xmm0, -0x20(%rbp)
1400c0ab3:     	cmpq	%r12, %r13
1400c0ab6:     	jae	0x1400c0af0 <.text+0xbfaf0>
1400c0ab8:     	movb	$0x1, %r15b
1400c0abb:     	cmpb	$-0x41, (%rbx,%r13)
1400c0ac0:     	jle	0x1400c1267 <.text+0xc0267>
1400c0ac6:     	testq	%r13, %r13
1400c0ac9:     	js	0x1400c0ef8 <.text+0xbfef8>
1400c0acf:     	jmp	0x1400c0b05 <.text+0xbfb05>
1400c0ad1:     	nopw	%cs:(%rax,%rax)
1400c0ae0:     	xorl	%r8d, %r8d
1400c0ae3:     	jmp	0x1400c0bd0 <.text+0xbfbd0>
1400c0ae8:     	nopl	(%rax,%rax)
1400c0af0:     	jne	0x1400c1267 <.text+0xc0267>
1400c0af6:     	xorl	%r15d, %r15d
1400c0af9:     	movq	%r12, %r13
1400c0afc:     	testq	%r13, %r13
1400c0aff:     	js	0x1400c0ef8 <.text+0xbfef8>
1400c0b05:     	callq	0x140002200 <.text+0x1200>
1400c0b0a:     	movl	$0x1, %r14d
1400c0b10:     	movl	$0x1, %edx
1400c0b15:     	movq	%r13, %rcx
1400c0b18:     	callq	0x1400021c0 <.text+0x11c0>
1400c0b1d:     	testq	%rax, %rax
1400c0b20:     	je	0x1400c12b5 <.text+0xc02b5>
1400c0b26:     	movq	%rax, 0x278(%rbp)
1400c0b2d:     	movq	%rax, %rcx
1400c0b30:     	movq	%rbx, %rdx
1400c0b33:     	movq	%r13, 0x298(%rbp)
1400c0b3a:     	movq	%r13, %r8
1400c0b3d:     	callq	0x145756ddd <.text+0x5755ddd>
1400c0b42:     	movaps	-0x20(%rbp), %xmm0
1400c0b46:     	movaps	%xmm0, 0x1f0(%rbp)
1400c0b4d:     	movq	0x290(%rbp), %r14
1400c0b54:     	cmpq	0x280(%rbp), %r14
1400c0b5b:     	jne	0x1400c0b6a <.text+0xbfb6a>
1400c0b5d:     	leaq	0x280(%rbp), %rcx
1400c0b64:     	callq	0x145758190 <.text+0x5757190>
1400c0b69:     	nop
1400c0b6a:     	movq	0x288(%rbp), %rax
1400c0b71:     	leaq	(%r14,%r14,2), %rcx
1400c0b75:     	shlq	$0x4, %rcx
1400c0b79:     	movl	$0x0, (%rax,%rcx)
1400c0b80:     	movaps	0x1f0(%rbp), %xmm0
1400c0b87:     	movups	%xmm0, 0x4(%rax,%rcx)
1400c0b8c:     	movq	0x298(%rbp), %r8
1400c0b93:     	movq	%r8, 0x18(%rax,%rcx)
1400c0b98:     	movq	0x278(%rbp), %rdx
1400c0b9f:     	movq	%rdx, 0x20(%rax,%rcx)
1400c0ba4:     	movq	%r8, 0x28(%rax,%rcx)
1400c0ba9:     	incq	%r14
1400c0bac:     	movq	%r14, 0x290(%rbp)
1400c0bb3:     	testb	%r15b, %r15b
1400c0bb6:     	je	0x1400c0bc4 <.text+0xbfbc4>
1400c0bb8:     	cmpb	$-0x41, (%rbx,%r8)
1400c0bbd:     	jg	0x1400c0bd0 <.text+0xbfbd0>
1400c0bbf:     	jmp	0x1400c1291 <.text+0xc0291>
1400c0bc4:     	cmpq	%r12, %r8
1400c0bc7:     	jne	0x1400c1291 <.text+0xc0291>
1400c0bcd:     	movq	%r12, %r8
1400c0bd0:     	movq	%r12, %r13
1400c0bd3:     	subq	%r8, %r13
1400c0bd6:     	addq	%r8, %rbx
1400c0bd9:     	cmpq	$0x2, %r13
1400c0bdd:     	jb	0x1400c0bf5 <.text+0xbfbf5>
1400c0bdf:     	cmpw	$0x727c, (%rbx)         # imm = 0x727C
1400c0be4:     	je	0x1400c0cb0 <.text+0xbfcb0>
1400c0bea:     	cmpw	$0x637c, (%rbx)         # imm = 0x637C
1400c0bef:     	je	0x1400c0cc7 <.text+0xbfcc7>
1400c0bf5:     	cmpq	%r8, %r12
1400c0bf8:     	movl	$0x0, %r12d
1400c0bfe:     	je	0x1400c09c7 <.text+0xbf9c7>
1400c0c04:     	callq	0x140002200 <.text+0x1200>
1400c0c09:     	movl	$0x1, %ecx
1400c0c0e:     	movl	$0x1, %edx
1400c0c13:     	callq	0x1400021c0 <.text+0x11c0>
1400c0c18:     	testq	%rax, %rax
1400c0c1b:     	je	0x1400c12c1 <.text+0xc02c1>
1400c0c21:     	movq	%rax, 0x298(%rbp)
1400c0c28:     	movb	$0x7c, (%rax)
1400c0c2b:     	movq	0x290(%rbp), %r14
1400c0c32:     	cmpq	0x280(%rbp), %r14
1400c0c39:     	jne	0x1400c0c48 <.text+0xbfc48>
1400c0c3b:     	leaq	0x280(%rbp), %rcx
1400c0c42:     	callq	0x145758190 <.text+0x5757190>
1400c0c47:     	nop
1400c0c48:     	movq	0x288(%rbp), %rax
1400c0c4f:     	leaq	(%r14,%r14,2), %rcx
1400c0c53:     	shlq	$0x4, %rcx
1400c0c57:     	movl	$0x0, (%rax,%rcx)
1400c0c5e:     	movaps	0x250(%rbp), %xmm0
1400c0c65:     	movups	%xmm0, 0x4(%rax,%rcx)
1400c0c6a:     	movq	$0x1, 0x18(%rax,%rcx)
1400c0c73:     	movq	0x298(%rbp), %rdx
1400c0c7a:     	movq	%rdx, 0x20(%rax,%rcx)
1400c0c7f:     	movq	$0x1, 0x28(%rax,%rcx)
1400c0c88:     	incq	%r14
1400c0c8b:     	movq	%r14, 0x290(%rbp)
1400c0c92:     	cmpq	$0x2, %r13
1400c0c96:     	jb	0x1400c0ca2 <.text+0xbfca2>
1400c0c98:     	cmpb	$-0x40, 0x1(%rbx)
1400c0c9c:     	jl	0x1400c12da <.text+0xc02da>
1400c0ca2:     	decq	%r13
1400c0ca5:     	incq	%rbx
1400c0ca8:     	movq	%r13, %r12
1400c0cab:     	jmp	0x1400c09c7 <.text+0xbf9c7>
1400c0cb0:     	addq	$-0x2, %r13
1400c0cb4:     	addq	$0x2, %rbx
1400c0cb8:     	movaps	%xmm6, 0x250(%rbp)
1400c0cbf:     	movq	%r13, %r12
1400c0cc2:     	jmp	0x1400c09c7 <.text+0xbf9c7>
1400c0cc7:     	leaq	-0x2(%r13), %r15
1400c0ccb:     	cmpq	$0x8, %r15
1400c0ccf:     	jbe	0x1400c0cdd <.text+0xbfcdd>
1400c0cd1:     	cmpb	$-0x40, 0xa(%rbx)
1400c0cd5:     	jl	0x1400c0bf5 <.text+0xbfbf5>
1400c0cdb:     	jmp	0x1400c0ce3 <.text+0xbfce3>
1400c0cdd:     	jne	0x1400c0bf5 <.text+0xbfbf5>
1400c0ce3:     	leaq	0x2(%rbx), %r14
1400c0ce7:     	xorl	%eax, %eax
1400c0ce9:     	nopl	(%rax)
1400c0cf0:     	cmpq	$0x8, %rax
1400c0cf4:     	je	0x1400c0dc4 <.text+0xbfdc4>
1400c0cfa:     	movzbl	(%r14,%rax), %r10d
1400c0cff:     	movzbl	%r10b, %ecx
1400c0d03:     	testb	%cl, %cl
1400c0d05:     	js	0x1400c0d20 <.text+0xbfd20>
1400c0d07:     	incq	%rax
1400c0d0a:     	leal	-0x3a(%rcx), %edx
1400c0d0d:     	cmpl	$-0xb, %edx
1400c0d10:     	jbe	0x1400c0db0 <.text+0xbfdb0>
1400c0d16:     	jmp	0x1400c0cf0 <.text+0xbfcf0>
1400c0d18:     	nopl	(%rax,%rax)
1400c0d20:     	movl	%ecx, %edx
1400c0d22:     	andl	$0x1f, %edx
1400c0d25:     	movzbl	0x1(%r14,%rax), %r9d
1400c0d2b:     	andl	$0x3f, %r9d
1400c0d2f:     	cmpb	$-0x21, %cl
1400c0d32:     	jbe	0x1400c0d77 <.text+0xbfd77>
1400c0d34:     	movzbl	0x2(%r14,%rax), %ecx
1400c0d3a:     	shll	$0x6, %r9d
1400c0d3e:     	andl	$0x3f, %ecx
1400c0d41:     	orl	%r9d, %ecx
1400c0d44:     	cmpb	$-0x10, %r10b
1400c0d48:     	jb	0x1400c0d90 <.text+0xbfd90>
1400c0d4a:     	movzbl	0x3(%r14,%rax), %r9d
1400c0d50:     	addq	$0x4, %rax
1400c0d54:     	andl	$0x7, %edx
1400c0d57:     	shll	$0x12, %edx
1400c0d5a:     	shll	$0x6, %ecx
1400c0d5d:     	andl	$0x3f, %r9d
1400c0d61:     	orl	%ecx, %r9d
1400c0d64:     	orl	%edx, %r9d
1400c0d67:     	movl	%r9d, %ecx
1400c0d6a:     	leal	-0x3a(%rcx), %edx
1400c0d6d:     	cmpl	$-0xb, %edx
1400c0d70:     	jbe	0x1400c0db0 <.text+0xbfdb0>
1400c0d72:     	jmp	0x1400c0cf0 <.text+0xbfcf0>
1400c0d77:     	addq	$0x2, %rax
1400c0d7b:     	shll	$0x6, %edx
1400c0d7e:     	orl	%r9d, %edx
1400c0d81:     	movl	%edx, %ecx
1400c0d83:     	leal	-0x3a(%rcx), %edx
1400c0d86:     	cmpl	$-0xb, %edx
1400c0d89:     	jbe	0x1400c0db0 <.text+0xbfdb0>
1400c0d8b:     	jmp	0x1400c0cf0 <.text+0xbfcf0>
1400c0d90:     	addq	$0x3, %rax
1400c0d94:     	shll	$0xc, %edx
1400c0d97:     	orl	%edx, %ecx
1400c0d99:     	leal	-0x3a(%rcx), %edx
1400c0d9c:     	cmpl	$-0xb, %edx
1400c0d9f:     	ja	0x1400c0cf0 <.text+0xbfcf0>
1400c0da5:     	nopw	%cs:(%rax,%rax)
1400c0db0:     	andl	$-0x21, %ecx
1400c0db3:     	addl	$-0x47, %ecx
1400c0db6:     	cmpl	$-0x6, %ecx
1400c0db9:     	jae	0x1400c0cf0 <.text+0xbfcf0>
1400c0dbf:     	jmp	0x1400c0bf5 <.text+0xbfbf5>
1400c0dc4:     	cmpq	$0x8, %r15
1400c0dc8:     	jb	0x1400c1237 <.text+0xc0237>
1400c0dce:     	cmpb	$-0x40, 0x4(%rbx)
1400c0dd2:     	jl	0x1400c1237 <.text+0xc0237>
1400c0dd8:     	cmpq	$0x8, %r15
1400c0ddc:     	je	0x1400c0de8 <.text+0xbfde8>
1400c0dde:     	cmpb	$-0x41, 0xa(%rbx)
1400c0de2:     	jle	0x1400c1237 <.text+0xc0237>
1400c0de8:     	leaq	0x4(%rbx), %rax
1400c0dec:     	addq	$0xa, %rbx
1400c0df0:     	xorl	%r9d, %r9d
1400c0df3:     	jmp	0x1400c0e15 <.text+0xbfe15>
1400c0df5:     	nopw	%cs:(%rax,%rax)
1400c0e00:     	leaq	0x1(%rdx), %r9
1400c0e04:     	subq	%rbx, %r9
1400c0e07:     	addq	$0x6, %r9
1400c0e0b:     	cmpl	$0x23, %r8d
1400c0e0f:     	jne	0x1400c0ea6 <.text+0xbfea6>
1400c0e15:     	movq	%r9, %rcx
1400c0e18:     	leaq	(%rax,%r9), %rdx
1400c0e1c:     	cmpq	$0x6, %r9
1400c0e20:     	je	0x1400c0ea6 <.text+0xbfea6>
1400c0e26:     	movzbl	(%rdx), %r9d
1400c0e2a:     	movzbl	%r9b, %r8d
1400c0e2e:     	testb	%r8b, %r8b
1400c0e31:     	jns	0x1400c0e00 <.text+0xbfe00>
1400c0e33:     	movl	%r8d, %r10d
1400c0e36:     	andl	$0x1f, %r10d
1400c0e3a:     	movzbl	0x1(%rdx), %r11d
1400c0e3f:     	andl	$0x3f, %r11d
1400c0e43:     	cmpb	$-0x21, %r8b
1400c0e47:     	jbe	0x1400c0e83 <.text+0xbfe83>
1400c0e49:     	movzbl	0x2(%rdx), %r8d
1400c0e4e:     	shll	$0x6, %r11d
1400c0e52:     	andl	$0x3f, %r8d
1400c0e56:     	orl	%r11d, %r8d
1400c0e59:     	cmpb	$-0x10, %r9b
1400c0e5d:     	jb	0x1400c0e96 <.text+0xbfe96>
1400c0e5f:     	leaq	0x4(%rdx), %r9
1400c0e63:     	movzbl	0x3(%rdx), %r11d
1400c0e68:     	andl	$0x7, %r10d
1400c0e6c:     	shll	$0x12, %r10d
1400c0e70:     	shll	$0x6, %r8d
1400c0e74:     	andl	$0x3f, %r11d
1400c0e78:     	orl	%r8d, %r11d
1400c0e7b:     	orl	%r10d, %r11d
1400c0e7e:     	movl	%r11d, %r8d
1400c0e81:     	jmp	0x1400c0e04 <.text+0xbfe04>
1400c0e83:     	leaq	0x2(%rdx), %r9
1400c0e87:     	shll	$0x6, %r10d
1400c0e8b:     	orl	%r11d, %r10d
1400c0e8e:     	movl	%r10d, %r8d
1400c0e91:     	jmp	0x1400c0e04 <.text+0xbfe04>
1400c0e96:     	leaq	0x3(%rdx), %r9
1400c0e9a:     	shll	$0xc, %r10d
1400c0e9e:     	orl	%r10d, %r8d
1400c0ea1:     	jmp	0x1400c0e04 <.text+0xbfe04>
1400c0ea6:     	movl	$0x6, %r8d
1400c0eac:     	subq	%rcx, %r8
1400c0eaf:     	movb	$0x1, 0x2a7(%rbp)
1400c0eb6:     	leaq	-0x20(%rbp), %rcx
1400c0eba:     	callq	0x14018cda0 <.text+0x18bda0>
1400c0ebf:     	nop
1400c0ec0:     	cmpl	$0x1, -0x20(%rbp)
1400c0ec4:     	jne	0x1400c0ecf <.text+0xbfecf>
1400c0ec6:     	movaps	%xmm6, 0x250(%rbp)
1400c0ecd:     	jmp	0x1400c0edd <.text+0xbfedd>
1400c0ecf:     	leaq	-0x1c(%rbp), %rax
1400c0ed3:     	movups	(%rax), %xmm0
1400c0ed6:     	movaps	%xmm0, 0x250(%rbp)
1400c0edd:     	cmpq	$0x8, %r15
1400c0ee1:     	je	0x1400c0eec <.text+0xbfeec>
1400c0ee3:     	cmpb	$-0x40, (%rbx)
1400c0ee6:     	jl	0x1400c1304 <.text+0xc0304>
1400c0eec:     	addq	$-0xa, %r13
1400c0ef0:     	movq	%r13, %r12
1400c0ef3:     	jmp	0x1400c09c7 <.text+0xbf9c7>
1400c0ef8:     	xorl	%r14d, %r14d
1400c0efb:     	movb	$0x1, 0x2a7(%rbp)
1400c0f02:     	movq	%r14, %rcx
1400c0f05:     	movq	0x278(%rbp), %rdx
1400c0f0c:     	callq	0x1458e721b <.text+0x58e621b>
1400c0f11:     	nop
1400c0f12:     	jmp	0x1400c132c <.text+0xc032c>
1400c0f17:     	cmpb	$0x1, (%rsi)
1400c0f1a:     	jne	0x1400c0f3b <.text+0xbff3b>
1400c0f1c:     	movl	0x1(%rsi), %eax
1400c0f1f:     	movl	0x4(%rsi), %ecx
1400c0f22:     	movl	%ecx, 0x273(%rbp)
1400c0f28:     	movl	%eax, 0x270(%rbp)
1400c0f2e:     	movq	0x8(%rsi), %rcx
1400c0f32:     	movzbl	0x10(%rsi), %edx
1400c0f36:     	movb	$0x1, %r8b
1400c0f39:     	jmp	0x1400c0f4c <.text+0xbff4c>
1400c0f3b:     	movq	0x8(%rsi), %rcx
1400c0f3f:     	lock
1400c0f40:     	incq	(%rcx)
1400c0f43:     	jle	0x1400c132c <.text+0xc032c>
1400c0f49:     	xorl	%r8d, %r8d
1400c0f4c:     	movups	0x583cb5d(%rip), %xmm0  # 0x1458fdab0
1400c0f53:     	movaps	%xmm0, 0x1f0(%rbp)
1400c0f5a:     	movq	$0x0, 0x200(%rbp)
1400c0f65:     	movups	0x583cb5c(%rip), %xmm0  # 0x1458fdac8
1400c0f6c:     	movups	%xmm0, 0x208(%rbp)
1400c0f73:     	movq	$0x0, 0x218(%rbp)
1400c0f7e:     	movups	0x583cb5b(%rip), %xmm0  # 0x1458fdae0
1400c0f85:     	movaps	%xmm0, 0x220(%rbp)
1400c0f8c:     	movq	$0x0, 0x230(%rbp)
1400c0f97:     	movups	0x583cb5a(%rip), %xmm0  # 0x1458fdaf8
1400c0f9e:     	movups	%xmm0, 0x238(%rbp)
1400c0fa5:     	movq	$0x0, 0x248(%rbp)
1400c0fb0:     	movq	(%rdi), %rax
1400c0fb3:     	addq	$0x8, %rdi
1400c0fb7:     	movq	$0x0, -0x18(%rbp)
1400c0fbf:     	movq	$0x1, -0x10(%rbp)
1400c0fc7:     	xorps	%xmm0, %xmm0
1400c0fca:     	movups	%xmm0, -0x8(%rbp)
1400c0fce:     	movq	$0x4, 0x8(%rbp)
1400c0fd6:     	movq	$0x0, 0x10(%rbp)
1400c0fde:     	movb	%r8b, 0x18(%rbp)
1400c0fe2:     	movl	0x270(%rbp), %r8d
1400c0fe9:     	movl	0x273(%rbp), %r9d
1400c0ff0:     	movl	%r8d, 0x19(%rbp)
1400c0ff4:     	movl	%r9d, 0x1c(%rbp)
1400c0ff8:     	movq	%rcx, 0x20(%rbp)
1400c0ffc:     	movq	%rdx, 0x28(%rbp)
1400c1000:     	movl	$0x41500000, 0x30(%rbp) # imm = 0x41500000
1400c1007:     	movw	$0x190, 0x34(%rbp)      # imm = 0x190
1400c100d:     	movb	$0x1, 0x36(%rbp)
1400c1011:     	movl	$0x0, 0x38(%rbp)
1400c1018:     	movups	%xmm6, 0x3c(%rbp)
1400c101c:     	movups	0x583c8a9(%rip), %xmm1  # 0x1458fd8cc
1400c1023:     	movups	%xmm1, 0x4c(%rbp)
1400c1027:     	movl	$0x3f59999a, 0x5c(%rbp) # imm = 0x3F59999A
1400c102e:     	movsd	0x5837eda(%rip), %xmm1  # 0x1458f8f10
1400c1036:     	movsd	%xmm1, 0x60(%rbp)
1400c103b:     	movaps	0x240(%rbp), %xmm1
1400c1042:     	movups	%xmm1, 0xb8(%rbp)
1400c1049:     	movaps	0x230(%rbp), %xmm1
1400c1050:     	movups	%xmm1, 0xa8(%rbp)
1400c1057:     	movaps	0x1f0(%rbp), %xmm1
1400c105e:     	movaps	0x200(%rbp), %xmm2
1400c1065:     	movaps	0x210(%rbp), %xmm3
1400c106c:     	movaps	0x220(%rbp), %xmm4
1400c1073:     	movups	%xmm4, 0x98(%rbp)
1400c107a:     	movups	%xmm3, 0x88(%rbp)
1400c1081:     	movups	%xmm2, 0x78(%rbp)
1400c1085:     	movups	%xmm1, 0x68(%rbp)
1400c1089:     	movups	%xmm0, 0xd8(%rbp)
1400c1090:     	movups	%xmm0, 0xc8(%rbp)
1400c1097:     	movq	$0x0, 0xe8(%rbp)
1400c10a2:     	movabsq	$0x42c8000000000002, %rcx # imm = 0x42C8000000000002
1400c10ac:     	movq	%rcx, 0xf0(%rbp)
1400c10b3:     	movups	%xmm0, 0x108(%rbp)
1400c10ba:     	movups	%xmm0, 0xf8(%rbp)
1400c10c1:     	movq	$0x0, 0x118(%rbp)
1400c10cc:     	movups	0x583caa5(%rip), %xmm0  # 0x1458fdb78
1400c10d3:     	movups	%xmm0, 0x130(%rbp)
1400c10da:     	movups	0x583ca87(%rip), %xmm0  # 0x1458fdb68
1400c10e1:     	movups	%xmm0, 0x120(%rbp)
1400c10e8:     	movups	0x583caa9(%rip), %xmm0  # 0x1458fdb98
1400c10ef:     	movups	%xmm0, 0x150(%rbp)
1400c10f6:     	movups	0x583ca8b(%rip), %xmm0  # 0x1458fdb88
1400c10fd:     	movups	%xmm0, 0x140(%rbp)
1400c1104:     	movups	0x583caad(%rip), %xmm0  # 0x1458fdbb8
1400c110b:     	movups	%xmm0, 0x170(%rbp)
1400c1112:     	movups	0x583ca8f(%rip), %xmm0  # 0x1458fdba8
1400c1119:     	movups	%xmm0, 0x160(%rbp)
1400c1120:     	movups	0x583cab1(%rip), %xmm0  # 0x1458fdbd8
1400c1127:     	movups	%xmm0, 0x190(%rbp)
1400c112e:     	movups	0x583ca93(%rip), %xmm0  # 0x1458fdbc8
1400c1135:     	movups	%xmm0, 0x180(%rbp)
1400c113c:     	movaps	0x582a36d(%rip), %xmm0  # 0x1458eb4b0
1400c1143:     	movups	%xmm0, 0x1a0(%rbp)
1400c114a:     	movl	$0x1, 0x1b0(%rbp)
1400c1154:     	movq	$0x0, 0x1b4(%rbp)
1400c115f:     	movb	$0x1, 0x1bc(%rbp)
1400c1166:     	movq	$0x0, 0x1c0(%rbp)
1400c1171:     	movl	$0x3f800000, 0x1c8(%rbp) # imm = 0x3F800000
1400c117b:     	movw	$0x0, 0x1cc(%rbp)
1400c1184:     	movw	$0x0, 0x1d2(%rbp)
1400c118d:     	movl	$0x10000, 0x1ce(%rbp)   # imm = 0x10000
1400c1197:     	movw	$0x0, 0x1d8(%rbp)
1400c11a0:     	movl	$0x10000, 0x1d4(%rbp)   # imm = 0x10000
1400c11aa:     	movl	$0x0, 0x1e2(%rbp)
1400c11b4:     	movq	$0x0, 0x1da(%rbp)
1400c11bf:     	movq	%rax, -0x20(%rbp)
1400c11c3:     	movb	$0x1, 0x2a7(%rbp)
1400c11ca:     	leaq	0x583c23f(%rip), %r9    # 0x1458fd410
1400c11d1:     	leaq	-0x50(%rbp), %rcx
1400c11d5:     	leaq	-0x20(%rbp), %r8
1400c11d9:     	movq	%rdi, %rdx
1400c11dc:     	callq	0x1401f8500 <.text+0x1f7500>
1400c11e1:     	nop
1400c11e2:     	movq	0x290(%rbp), %rax
1400c11e9:     	movq	%rax, -0x10(%rbp)
1400c11ed:     	movups	0x280(%rbp), %xmm0
1400c11f4:     	movaps	%xmm0, -0x20(%rbp)
1400c11f8:     	movq	%rsi, -0x8(%rbp)
1400c11fc:     	leaq	0x26c(%rbp), %rax
1400c1203:     	movq	%rax, (%rbp)
1400c1207:     	movb	$0x0, 0x2a7(%rbp)
1400c120e:     	leaq	-0x50(%rbp), %rcx
1400c1212:     	leaq	-0x20(%rbp), %rdx
1400c1216:     	callq	0x14021ae10 <.text+0x219e10>
1400c121b:     	nop
1400c121c:     	movaps	0x2b0(%rbp), %xmm6
1400c1223:     	addq	$0x348, %rsp            # imm = 0x348
1400c122a:     	popq	%rbx
1400c122b:     	popq	%rdi
1400c122c:     	popq	%rsi
1400c122d:     	popq	%r12
1400c122f:     	popq	%r13
1400c1231:     	popq	%r14
1400c1233:     	popq	%r15
1400c1235:     	popq	%rbp
1400c1236:     	retq
1400c1237:     	movb	$0x1, 0x2a7(%rbp)
1400c123e:     	leaq	0x583d18b(%rip), %rax   # 0x1458fe3d0
1400c1245:     	movq	%rax, 0x20(%rsp)
1400c124a:     	movl	$0x2, %r8d
1400c1250:     	movl	$0x8, %r9d
1400c1256:     	movq	%r14, %rcx
1400c1259:     	movq	%r15, %rdx
1400c125c:     	callq	0x1458e7430 <.text+0x58e6430>
1400c1261:     	nop
1400c1262:     	jmp	0x1400c132c <.text+0xc032c>
1400c1267:     	movb	$0x1, 0x2a7(%rbp)
1400c126e:     	leaq	0x583d12b(%rip), %rax   # 0x1458fe3a0
1400c1275:     	movq	%rax, 0x20(%rsp)
1400c127a:     	movq	%rbx, %rcx
1400c127d:     	movq	%r12, %rdx
1400c1280:     	xorl	%r8d, %r8d
1400c1283:     	movq	%r13, %r9
1400c1286:     	callq	0x1458e7430 <.text+0x58e6430>
1400c128b:     	nop
1400c128c:     	jmp	0x1400c132c <.text+0xc032c>
1400c1291:     	movb	$0x1, 0x2a7(%rbp)
1400c1298:     	leaq	0x583d119(%rip), %rax   # 0x1458fe3b8
1400c129f:     	movq	%rax, 0x20(%rsp)
1400c12a4:     	movq	%rbx, %rcx
1400c12a7:     	movq	%r12, %rdx
1400c12aa:     	movq	%r12, %r9
1400c12ad:     	callq	0x1458e7430 <.text+0x58e6430>
1400c12b2:     	nop
1400c12b3:     	jmp	0x1400c132c <.text+0xc032c>
1400c12b5:     	movq	%r13, 0x278(%rbp)
1400c12bc:     	jmp	0x1400c0efb <.text+0xbfefb>
1400c12c1:     	movb	$0x1, 0x2a7(%rbp)
1400c12c8:     	movl	$0x1, %ecx
1400c12cd:     	movl	$0x1, %edx
1400c12d2:     	callq	0x1458e721b <.text+0x58e621b>
1400c12d7:     	nop
1400c12d8:     	jmp	0x1400c132c <.text+0xc032c>
1400c12da:     	movb	$0x1, 0x2a7(%rbp)
1400c12e1:     	leaq	0x583d118(%rip), %rax   # 0x1458fe400
1400c12e8:     	movq	%rax, 0x20(%rsp)
1400c12ed:     	movl	$0x1, %r8d
1400c12f3:     	movq	%rbx, %rcx
1400c12f6:     	movq	%r13, %rdx
1400c12f9:     	movq	%r13, %r9
1400c12fc:     	callq	0x1458e7430 <.text+0x58e6430>
1400c1301:     	nop
1400c1302:     	jmp	0x1400c132c <.text+0xc032c>
1400c1304:     	movb	$0x1, 0x2a7(%rbp)
1400c130b:     	leaq	0x583d0d6(%rip), %rax   # 0x1458fe3e8
1400c1312:     	movq	%rax, 0x20(%rsp)
1400c1317:     	movl	$0x8, %r8d
1400c131d:     	movq	%r14, %rcx
1400c1320:     	movq	%r15, %rdx
1400c1323:     	movq	%r15, %r9
1400c1326:     	callq	0x1458e7430 <.text+0x58e6430>
1400c132b:     	nop
1400c132c:     	ud2

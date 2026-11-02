
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14023d600:     	pushq	%rbp
14023d601:     	pushq	%r15
14023d603:     	pushq	%r14
14023d605:     	pushq	%r13
14023d607:     	pushq	%r12
14023d609:     	pushq	%rsi
14023d60a:     	pushq	%rdi
14023d60b:     	pushq	%rbx
14023d60c:     	subq	$0x6b8, %rsp            # imm = 0x6B8
14023d613:     	leaq	0x80(%rsp), %rbp
14023d61b:     	movaps	%xmm15, 0x620(%rbp)
14023d623:     	movaps	%xmm14, 0x610(%rbp)
14023d62b:     	movaps	%xmm13, 0x600(%rbp)
14023d633:     	movaps	%xmm12, 0x5f0(%rbp)
14023d63b:     	movaps	%xmm11, 0x5e0(%rbp)
14023d643:     	movaps	%xmm10, 0x5d0(%rbp)
14023d64b:     	movaps	%xmm9, 0x5c0(%rbp)
14023d653:     	movaps	%xmm8, 0x5b0(%rbp)
14023d65b:     	movaps	%xmm7, 0x5a0(%rbp)
14023d662:     	movaps	%xmm6, 0x590(%rbp)
14023d669:     	movq	$-0x2, 0x588(%rbp)
14023d674:     	movq	%rdx, %r15
14023d677:     	movq	%rcx, %r12
14023d67a:     	movq	(%rcx), %r13
14023d67d:     	movq	0x28(%rcx), %rax
14023d681:     	movq	%r13, 0x98(%rbp)
14023d688:     	movups	0x8(%rcx), %xmm0
14023d68c:     	movups	%xmm0, 0xa0(%rbp)
14023d693:     	movups	0x18(%rcx), %xmm0
14023d697:     	movups	%xmm0, 0xb0(%rbp)
14023d69e:     	movq	%rax, 0xc0(%rbp)
14023d6a5:     	movq	(%rdx), %r14
14023d6a8:     	movq	0x8(%rdx), %rsi
14023d6ac:     	leaq	0x1d0(%rbp), %rcx
14023d6b3:     	movq	%rsi, %rdx
14023d6b6:     	callq	0x14570c440 <.text+0x570b440>
14023d6bb:     	cmpb	$0x1, 0x18(%r14)
14023d6c0:     	jne	0x14023d6dd <.text+0x23c6dd>
14023d6c2:     	movl	0x19(%r14), %eax
14023d6c6:     	movl	0x1c(%r14), %ecx
14023d6ca:     	movl	%ecx, -0x5(%rbp)
14023d6cd:     	movl	%eax, -0x8(%rbp)
14023d6d0:     	movq	0x20(%r14), %rax
14023d6d4:     	movzbl	0x28(%r14), %r10d
14023d6d9:     	movb	$0x1, %cl
14023d6db:     	jmp	0x14023d6ed <.text+0x23c6ed>
14023d6dd:     	movq	0x20(%r14), %rax
14023d6e1:     	lock
14023d6e2:     	incq	(%rax)
14023d6e5:     	jle	0x14023ebb9 <.text+0x23dbb9>
14023d6eb:     	xorl	%ecx, %ecx
14023d6ed:     	leaq	0xa0(%rbp), %rdx
14023d6f4:     	movq	0x1e0(%rbp), %r8
14023d6fb:     	movq	%r8, 0x368(%rbp)
14023d702:     	movups	0x1d0(%rbp), %xmm0
14023d709:     	movups	%xmm0, 0x358(%rbp)
14023d710:     	movl	-0x8(%rbp), %r8d
14023d714:     	movl	-0x5(%rbp), %r9d
14023d718:     	movl	%r8d, 0x389(%rbp)
14023d71f:     	movl	%r9d, 0x38c(%rbp)
14023d726:     	movups	0x57016cb(%rip), %xmm0  # 0x14593edf8
14023d72d:     	movups	%xmm0, 0x141(%rbp)
14023d734:     	movl	$0x3f800000, 0x151(%rbp) # imm = 0x3F800000
14023d73e:     	movq	$0x0, 0x370(%rbp)
14023d749:     	movq	$0x4, 0x378(%rbp)
14023d754:     	movq	$0x0, 0x380(%rbp)
14023d75f:     	movb	%cl, 0x388(%rbp)
14023d765:     	movq	%rax, 0x390(%rbp)
14023d76c:     	movq	%r10, 0x398(%rbp)
14023d773:     	movl	$0x42080000, 0x3a0(%rbp) # imm = 0x42080000
14023d77d:     	movw	$0x190, 0x3a4(%rbp)     # imm = 0x190
14023d786:     	movb	$0x1, 0x3a6(%rbp)
14023d78d:     	movq	0x14d(%rbp), %rax
14023d794:     	movq	%rax, 0x3b4(%rbp)
14023d79b:     	movups	0x140(%rbp), %xmm0
14023d7a2:     	movups	%xmm0, 0x3a7(%rbp)
14023d7a9:     	movl	0x56c012d(%rip), %edi   # 0x1458fd8dc
14023d7af:     	movl	%edi, 0x3cc(%rbp)
14023d7b5:     	movups	0x56c0110(%rip), %xmm6  # 0x1458fd8cc
14023d7bc:     	movups	%xmm6, 0x3bc(%rbp)
14023d7c3:     	movsd	0x56bb745(%rip), %xmm7  # 0x1458f8f10
14023d7cb:     	movsd	%xmm7, 0x3d0(%rbp)
14023d7d3:     	movq	%r13, 0x350(%rbp)
14023d7da:     	leaq	0x1d0(%rbp), %rbx
14023d7e1:     	leaq	0x350(%rbp), %r8
14023d7e8:     	movq	%rbx, %rcx
14023d7eb:     	callq	0x1401e8b90 <.text+0x1e7b90>
14023d7f0:     	cmpb	$0x1, 0x3a(%rsi)
14023d7f4:     	jne	0x14023d804 <.text+0x23c804>
14023d7f6:     	leaq	0x5701edd(%rip), %rcx   # 0x14593f6da
14023d7fd:     	movl	$0xd, %edx
14023d802:     	jmp	0x14023d810 <.text+0x23c810>
14023d804:     	leaq	0x5701ec4(%rip), %rcx   # 0x14593f6cf
14023d80b:     	movl	$0xb, %edx
14023d810:     	callq	0x145452350 <.text+0x5451350>
14023d815:     	movq	%rax, 0x140(%rbp)
14023d81c:     	movq	%rdx, 0x148(%rbp)
14023d823:     	movzbl	0x39(%rsi), %ecx
14023d827:     	callq	0x14540eb50 <.text+0x540db50>
14023d82c:     	movq	%rax, %rcx
14023d82f:     	callq	0x14540dd20 <.text+0x540cd20>
14023d834:     	movq	%rax, 0x1d0(%rbp)
14023d83b:     	movq	%rdx, 0x1d8(%rbp)
14023d842:     	leaq	0x140(%rbp), %rax
14023d849:     	movq	%rax, 0x350(%rbp)
14023d850:     	leaq	-0x23b797(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14023d857:     	movq	%rax, 0x358(%rbp)
14023d85e:     	movq	%rbx, 0x360(%rbp)
14023d865:     	movq	%rax, 0x368(%rbp)
14023d86c:     	leaq	0x57041c0(%rip), %rdx   # 0x145941a33
14023d873:     	leaq	0x80(%rbp), %rcx
14023d87a:     	leaq	0x350(%rbp), %r8
14023d881:     	callq	0x14570bf80 <.text+0x570af80>
14023d886:     	cmpb	$0x1, (%r14)
14023d88a:     	jne	0x14023d8ad <.text+0x23c8ad>
14023d88c:     	movl	0x1(%r14), %eax
14023d890:     	movl	0x4(%r14), %ecx
14023d894:     	movl	%ecx, 0x1d3(%rbp)
14023d89a:     	movl	%eax, 0x1d0(%rbp)
14023d8a0:     	movq	0x8(%r14), %rax
14023d8a4:     	movzbl	0x10(%r14), %edx
14023d8a9:     	movb	$0x1, %cl
14023d8ab:     	jmp	0x14023d8bd <.text+0x23c8bd>
14023d8ad:     	movq	0x8(%r14), %rax
14023d8b1:     	lock
14023d8b2:     	incq	(%rax)
14023d8b5:     	jle	0x14023ebb9 <.text+0x23dbb9>
14023d8bb:     	xorl	%ecx, %ecx
14023d8bd:     	movq	0x90(%rbp), %r8
14023d8c4:     	movq	%r8, 0x368(%rbp)
14023d8cb:     	movups	0x80(%rbp), %xmm0
14023d8d2:     	movups	%xmm0, 0x358(%rbp)
14023d8d9:     	movl	0x1d0(%rbp), %r8d
14023d8e0:     	movl	0x1d3(%rbp), %r9d
14023d8e7:     	movl	%r8d, 0x389(%rbp)
14023d8ee:     	movl	%r9d, 0x38c(%rbp)
14023d8f5:     	movups	0x5701a50(%rip), %xmm0  # 0x14593f34c
14023d8fc:     	movups	%xmm0, 0x141(%rbp)
14023d903:     	movl	$0x3f800000, 0x151(%rbp) # imm = 0x3F800000
14023d90d:     	movq	$0x0, 0x370(%rbp)
14023d918:     	movq	$0x4, 0x378(%rbp)
14023d923:     	movq	$0x0, 0x380(%rbp)
14023d92e:     	movb	%cl, 0x388(%rbp)
14023d934:     	movq	%rax, 0x390(%rbp)
14023d93b:     	movq	%rdx, 0x398(%rbp)
14023d942:     	movl	$0x41700000, 0x3a0(%rbp) # imm = 0x41700000
14023d94c:     	movw	$0x190, 0x3a4(%rbp)     # imm = 0x190
14023d955:     	movb	$0x1, 0x3a6(%rbp)
14023d95c:     	movq	0x14d(%rbp), %rax
14023d963:     	movq	%rax, 0x3b4(%rbp)
14023d96a:     	movups	0x140(%rbp), %xmm0
14023d971:     	movups	%xmm0, 0x3a7(%rbp)
14023d978:     	movl	%edi, 0x3cc(%rbp)
14023d97e:     	movups	%xmm6, 0x3bc(%rbp)
14023d985:     	movsd	%xmm7, 0x3d0(%rbp)
14023d98d:     	movq	%r13, 0x350(%rbp)
14023d994:     	leaq	0x1d0(%rbp), %rcx
14023d99b:     	leaq	0x350(%rbp), %r8
14023d9a2:     	leaq	0xa0(%rbp), %rdx
14023d9a9:     	callq	0x1401e8b90 <.text+0x1e7b90>
14023d9ae:     	movq	0x10(%r15), %rsi
14023d9b2:     	movq	0x50(%rsi), %rdx
14023d9b6:     	movq	0x58(%rsi), %r8
14023d9ba:     	movq	%r8, %rcx
14023d9bd:     	subq	%rdx, %rcx
14023d9c0:     	subq	%r8, %rcx
14023d9c3:     	xorl	%r9d, %r9d
14023d9c6:     	jmp	0x14023d9e0 <.text+0x23c9e0>
14023d9c8:     	nopl	(%rax,%rax)
14023d9d0:     	incq	%r9
14023d9d3:     	addq	%rcx, %r9
14023d9d6:     	cmpl	$0x23, %r10d
14023d9da:     	jne	0x14023da6e <.text+0x23ca6e>
14023d9e0:     	cmpq	%r8, %r9
14023d9e3:     	je	0x14023da6b <.text+0x23ca6b>
14023d9e9:     	movq	%r9, %rax
14023d9ec:     	addq	%rdx, %r9
14023d9ef:     	movzbl	(%r9), %ebx
14023d9f3:     	movzbl	%bl, %r10d
14023d9f7:     	testb	%r10b, %r10b
14023d9fa:     	jns	0x14023d9d0 <.text+0x23c9d0>
14023d9fc:     	movl	%r10d, %r11d
14023d9ff:     	andl	$0x1f, %r11d
14023da03:     	movzbl	0x1(%r9), %edi
14023da08:     	andl	$0x3f, %edi
14023da0b:     	cmpb	$-0x21, %r10b
14023da0f:     	jbe	0x14023da48 <.text+0x23ca48>
14023da11:     	movzbl	0x2(%r9), %r10d
14023da16:     	shll	$0x6, %edi
14023da19:     	andl	$0x3f, %r10d
14023da1d:     	orl	%edi, %r10d
14023da20:     	cmpb	$-0x10, %bl
14023da23:     	jb	0x14023da5b <.text+0x23ca5b>
14023da25:     	movzbl	0x3(%r9), %edi
14023da2a:     	addq	$0x4, %r9
14023da2e:     	andl	$0x7, %r11d
14023da32:     	shll	$0x12, %r11d
14023da36:     	shll	$0x6, %r10d
14023da3a:     	andl	$0x3f, %edi
14023da3d:     	orl	%r10d, %edi
14023da40:     	orl	%r11d, %edi
14023da43:     	movl	%edi, %r10d
14023da46:     	jmp	0x14023d9d3 <.text+0x23c9d3>
14023da48:     	addq	$0x2, %r9
14023da4c:     	shll	$0x6, %r11d
14023da50:     	orl	%edi, %r11d
14023da53:     	movl	%r11d, %r10d
14023da56:     	jmp	0x14023d9d3 <.text+0x23c9d3>
14023da5b:     	addq	$0x3, %r9
14023da5f:     	shll	$0xc, %r11d
14023da63:     	orl	%r11d, %r10d
14023da66:     	jmp	0x14023d9d3 <.text+0x23c9d3>
14023da6b:     	movq	%r8, %rax
14023da6e:     	subq	%rax, %r8
14023da71:     	addq	%rax, %rdx
14023da74:     	leaq	0x350(%rbp), %rcx
14023da7b:     	callq	0x14018cda0 <.text+0x18bda0>
14023da80:     	cmpl	$0x1, 0x350(%rbp)
14023da87:     	jne	0x14023da92 <.text+0x23ca92>
14023da89:     	movups	0x56c0554(%rip), %xmm0  # 0x1458fdfe4
14023da90:     	jmp	0x14023da99 <.text+0x23ca99>
14023da92:     	movups	0x354(%rbp), %xmm0
14023da99:     	movaps	%xmm0, 0x140(%rbp)
14023daa0:     	movq	%rsi, %rcx
14023daa3:     	callq	0x14540db60 <.text+0x540cb60>
14023daa8:     	movq	%rdx, %rsi
14023daab:     	testq	%rdx, %rdx
14023daae:     	jns	0x14023dac0 <.text+0x23cac0>
14023dab0:     	xorl	%r15d, %r15d
14023dab3:     	movq	%r15, %rcx
14023dab6:     	movq	%rsi, %rdx
14023dab9:     	callq	0x1458e721b <.text+0x58e621b>
14023dabe:     	ud2
14023dac0:     	movq	%r14, 0x570(%rbp)
14023dac7:     	je	0x14023db28 <.text+0x23cb28>
14023dac9:     	movq	%r15, %rdi
14023dacc:     	movq	%rax, %r14
14023dacf:     	callq	0x140002200 <.text+0x1200>
14023dad4:     	movl	$0x1, %r15d
14023dada:     	movl	$0x1, %edx
14023dadf:     	movq	%rsi, %rcx
14023dae2:     	callq	0x1400021c0 <.text+0x11c0>
14023dae7:     	testq	%rax, %rax
14023daea:     	je	0x14023dab3 <.text+0x23cab3>
14023daec:     	movq	%rax, %rbx
14023daef:     	movq	%rax, %rcx
14023daf2:     	movq	%r14, %rdx
14023daf5:     	movq	%rsi, %r8
14023daf8:     	callq	0x145756ddd <.text+0x5755ddd>
14023dafd:     	movq	0x570(%rbp), %r14
14023db04:     	movq	%rdi, %r15
14023db07:     	cmpb	$0x1, (%r14)
14023db0b:     	jne	0x14023db33 <.text+0x23cb33>
14023db0d:     	movl	0x1(%r14), %eax
14023db11:     	movl	0x4(%r14), %ecx
14023db15:     	movl	%ecx, -0x5(%rbp)
14023db18:     	movl	%eax, -0x8(%rbp)
14023db1b:     	movq	0x8(%r14), %rax
14023db1f:     	movzbl	0x10(%r14), %ecx
14023db24:     	movb	$0x1, %dl
14023db26:     	jmp	0x14023db43 <.text+0x23cb43>
14023db28:     	movl	$0x1, %ebx
14023db2d:     	cmpb	$0x1, (%r14)
14023db31:     	je	0x14023db0d <.text+0x23cb0d>
14023db33:     	movq	0x8(%r14), %rax
14023db37:     	lock
14023db38:     	incq	(%rax)
14023db3b:     	jle	0x14023ebb9 <.text+0x23dbb9>
14023db41:     	xorl	%edx, %edx
14023db43:     	movq	%rsi, 0x350(%rbp)
14023db4a:     	movq	%rbx, 0x358(%rbp)
14023db51:     	movq	%rsi, 0x360(%rbp)
14023db58:     	movq	$0x0, 0x368(%rbp)
14023db63:     	movq	$0x4, 0x370(%rbp)
14023db6e:     	movq	$0x0, 0x378(%rbp)
14023db79:     	movb	%dl, 0x380(%rbp)
14023db7f:     	movl	-0x8(%rbp), %edx
14023db82:     	movl	-0x5(%rbp), %r8d
14023db86:     	movl	%edx, 0x381(%rbp)
14023db8c:     	movl	%r8d, 0x384(%rbp)
14023db93:     	movq	%rax, 0x388(%rbp)
14023db9a:     	movq	%rcx, 0x390(%rbp)
14023dba1:     	movl	$0x41700000, 0x398(%rbp) # imm = 0x41700000
14023dbab:     	movw	$0x190, 0x39c(%rbp)     # imm = 0x190
14023dbb4:     	movb	$0x1, 0x39e(%rbp)
14023dbbb:     	movl	$0x0, 0x3a0(%rbp)
14023dbc5:     	movaps	0x140(%rbp), %xmm0
14023dbcc:     	movups	%xmm0, 0x3a4(%rbp)
14023dbd3:     	leaq	0x1d0(%rbp), %rcx
14023dbda:     	leaq	0x350(%rbp), %rdx
14023dbe1:     	callq	0x1401fdab0 <.text+0x1fcab0>
14023dbe6:     	xorps	%xmm11, %xmm11
14023dbea:     	movups	%xmm11, 0x3d0(%rbp)
14023dbf2:     	movups	%xmm11, 0x3c0(%rbp)
14023dbfa:     	movups	%xmm11, 0x3f0(%rbp)
14023dc02:     	movups	%xmm11, 0x400(%rbp)
14023dc0a:     	movl	$0x0, 0x4d0(%rbp)
14023dc14:     	movw	$0x0, 0x4d4(%rbp)
14023dc1d:     	movups	0x570125c(%rip), %xmm0  # 0x14593ee80
14023dc24:     	movaps	%xmm0, 0x1d0(%rbp)
14023dc2b:     	movq	$0x0, 0x1e0(%rbp)
14023dc36:     	movups	0x570125a(%rip), %xmm10 # 0x14593ee98
14023dc3e:     	movups	%xmm10, 0x1e8(%rbp)
14023dc46:     	movq	$0x0, 0x1f8(%rbp)
14023dc51:     	movups	0x5701258(%rip), %xmm0  # 0x14593eeb0
14023dc58:     	movaps	%xmm0, 0x200(%rbp)
14023dc5f:     	movq	$0x0, 0x210(%rbp)
14023dc6a:     	movups	0x5701256(%rip), %xmm13 # 0x14593eec8
14023dc72:     	movups	%xmm13, 0x218(%rbp)
14023dc7a:     	movq	$0x0, 0x228(%rbp)
14023dc85:     	movq	0x220(%rbp), %rax
14023dc8c:     	movq	%rax, 0x3a8(%rbp)
14023dc93:     	movq	0x228(%rbp), %rax
14023dc9a:     	movq	%rax, 0x3b0(%rbp)
14023dca1:     	movq	0x210(%rbp), %rax
14023dca8:     	movq	%rax, 0x398(%rbp)
14023dcaf:     	movq	0x218(%rbp), %rax
14023dcb6:     	movq	%rax, 0x3a0(%rbp)
14023dcbd:     	movaps	0x1d0(%rbp), %xmm0
14023dcc4:     	movaps	0x1e0(%rbp), %xmm1
14023dccb:     	movaps	0x1f0(%rbp), %xmm2
14023dcd2:     	movaps	0x200(%rbp), %xmm3
14023dcd9:     	movups	%xmm3, 0x388(%rbp)
14023dce0:     	movups	%xmm2, 0x378(%rbp)
14023dce7:     	movups	%xmm1, 0x368(%rbp)
14023dcee:     	movups	%xmm0, 0x358(%rbp)
14023dcf5:     	movq	$0x0, 0x3b8(%rbp)
14023dd00:     	movaps	0x5700b19(%rip), %xmm0  # 0x14593e820
14023dd07:     	movups	%xmm0, 0x3e0(%rbp)
14023dd0e:     	movups	0x5701232(%rip), %xmm14 # 0x14593ef48
14023dd16:     	movups	%xmm14, 0x420(%rbp)
14023dd1e:     	movups	0x5701212(%rip), %xmm15 # 0x14593ef38
14023dd26:     	movups	%xmm15, 0x410(%rbp)
14023dd2e:     	movups	0x5701232(%rip), %xmm9  # 0x14593ef68
14023dd36:     	movups	%xmm9, 0x440(%rbp)
14023dd3e:     	movups	0x5701213(%rip), %xmm6  # 0x14593ef58
14023dd45:     	movups	%xmm6, 0x430(%rbp)
14023dd4c:     	movups	0x5701235(%rip), %xmm7  # 0x14593ef88
14023dd53:     	movups	%xmm7, 0x460(%rbp)
14023dd5a:     	movups	0x5701216(%rip), %xmm8  # 0x14593ef78
14023dd62:     	movups	%xmm8, 0x450(%rbp)
14023dd6a:     	movups	0x5701237(%rip), %xmm0  # 0x14593efa8
14023dd71:     	movups	%xmm0, 0x480(%rbp)
14023dd78:     	movups	0x5701219(%rip), %xmm0  # 0x14593ef98
14023dd7f:     	movups	%xmm0, 0x470(%rbp)
14023dd86:     	movaps	0x56ad722(%rip), %xmm12 # 0x1458eb4b0
14023dd8e:     	movups	%xmm12, 0x490(%rbp)
14023dd96:     	movl	$0x1, 0x4a0(%rbp)
14023dda0:     	movq	$0x0, 0x4a4(%rbp)
14023ddab:     	movb	$0x1, 0x4ac(%rbp)
14023ddb2:     	movq	$0x0, 0x4b6(%rbp)
14023ddbd:     	movq	$0x0, 0x4b0(%rbp)
14023ddc8:     	movw	$0x0, 0x4c2(%rbp)
14023ddd1:     	movl	$0x10000, 0x4be(%rbp)   # imm = 0x10000
14023dddb:     	movw	$0x0, 0x4c8(%rbp)
14023dde4:     	movl	$0x10000, 0x4c4(%rbp)   # imm = 0x10000
14023ddee:     	movw	$0x0, 0x4ce(%rbp)
14023ddf7:     	movl	$0x0, 0x4ca(%rbp)
14023de01:     	movq	%r13, 0x350(%rbp)
14023de08:     	leaq	0xf8(%rbp), %rcx
14023de0f:     	leaq	0x350(%rbp), %r8
14023de16:     	leaq	0xa0(%rbp), %rdx
14023de1d:     	callq	0x1401e3e60 <.text+0x1e2e60>
14023de22:     	movq	0xf8(%rbp), %rdi
14023de29:     	movq	0x120(%rbp), %rax
14023de30:     	movq	%rdi, 0xc8(%rbp)
14023de37:     	movups	0x100(%rbp), %xmm0
14023de3e:     	movups	%xmm0, 0xd0(%rbp)
14023de45:     	movups	0x110(%rbp), %xmm0
14023de4c:     	movups	%xmm0, 0xe0(%rbp)
14023de53:     	movq	%rax, 0xf0(%rbp)
14023de5a:     	movw	$0x0, 0x334(%rbp)
14023de63:     	movb	$0x1, 0x324(%rbp)
14023de6a:     	movabsq	$0x4160000000000002, %rax # imm = 0x4160000000000002
14023de74:     	movq	%rax, 0x238(%rbp)
14023de7b:     	movaps	%xmm11, 0x240(%rbp)
14023de83:     	movaps	0x57009a6(%rip), %xmm0  # 0x14593e830
14023de8a:     	movaps	%xmm0, 0x250(%rbp)
14023de91:     	movabsq	$0x4280000000000001, %rax # imm = 0x4280000000000001
14023de9b:     	movq	%rax, 0x260(%rbp)
14023dea2:     	movq	$0x0, 0x230(%rbp)
14023dead:     	movups	%xmm11, 0x268(%rbp)
14023deb5:     	movups	%xmm11, 0x278(%rbp)
14023debd:     	movl	$0x0, 0x348(%rbp)
14023dec7:     	movw	$0x0, 0x34c(%rbp)
14023ded0:     	movups	%xmm14, 0x298(%rbp)
14023ded8:     	movaps	%xmm9, %xmm0
14023dedc:     	movaps	%xmm8, %xmm9
14023dee0:     	movups	0x5700f98(%rip), %xmm8  # 0x14593ee80
14023dee8:     	movups	0x5700fc0(%rip), %xmm14 # 0x14593eeb0
14023def0:     	movups	%xmm15, 0x288(%rbp)
14023def8:     	movups	%xmm6, 0x2a8(%rbp)
14023deff:     	movups	%xmm0, 0x2b8(%rbp)
14023df06:     	movups	%xmm7, 0x2d8(%rbp)
14023df0d:     	movups	%xmm9, 0x2c8(%rbp)
14023df15:     	movaps	0x5700464(%rip), %xmm0  # 0x14593e380
14023df1c:     	movups	%xmm0, 0x2e8(%rbp)
14023df23:     	movups	%xmm0, 0x2f8(%rbp)
14023df2a:     	movb	$0x0, 0x346(%rbp)
14023df31:     	movl	$0x100, 0x342(%rbp)     # imm = 0x100
14023df3b:     	movq	$0x0, 0x328(%rbp)
14023df46:     	movl	$0x3f800000, 0x330(%rbp) # imm = 0x3F800000
14023df50:     	movups	%xmm12, 0x308(%rbp)
14023df58:     	movl	$0x1, 0x318(%rbp)
14023df62:     	movq	$0x0, 0x31c(%rbp)
14023df6d:     	movb	$0x0, 0x347(%rbp)
14023df74:     	movaps	%xmm8, 0x1d0(%rbp)
14023df7c:     	movq	$0x0, 0x1e0(%rbp)
14023df87:     	movups	%xmm10, 0x1e8(%rbp)
14023df8f:     	movq	$0x0, 0x1f8(%rbp)
14023df9a:     	movaps	%xmm14, 0x200(%rbp)
14023dfa2:     	movq	$0x0, 0x210(%rbp)
14023dfad:     	movups	%xmm13, 0x218(%rbp)
14023dfb5:     	movq	$0x0, 0x228(%rbp)
14023dfc0:     	movw	$0x0, 0x33a(%rbp)
14023dfc9:     	movl	$0x10000, 0x336(%rbp)   # imm = 0x10000
14023dfd3:     	movw	$0x0, 0x340(%rbp)
14023dfdc:     	movl	$0x10000, 0x33c(%rbp)   # imm = 0x10000
14023dfe6:     	callq	0x140002200 <.text+0x1200>
14023dfeb:     	movl	$0x60, %ecx
14023dff0:     	movl	$0x4, %edx
14023dff5:     	callq	0x1400021c0 <.text+0x11c0>
14023dffa:     	testq	%rax, %rax
14023dffd:     	je	0x14023eb70 <.text+0x23db70>
14023e003:     	movq	%r13, 0x578(%rbp)
14023e00a:     	movq	%rax, 0x580(%rbp)
14023e011:     	movaps	0x5700828(%rip), %xmm0  # 0x14593e840
14023e018:     	movups	%xmm0, 0x354(%rbp)
14023e01f:     	movl	$0x0, 0x350(%rbp)
14023e029:     	leaq	0x140(%rbp), %rcx
14023e030:     	leaq	0x350(%rbp), %rdx
14023e037:     	callq	0x144c79aa0 <.text+0x4c78aa0>
14023e03c:     	nop
14023e03d:     	movaps	0x140(%rbp), %xmm11
14023e045:     	movaps	0x5700804(%rip), %xmm0  # 0x14593e850
14023e04c:     	movups	%xmm0, 0x354(%rbp)
14023e053:     	movl	$0x0, 0x350(%rbp)
14023e05d:     	leaq	0x140(%rbp), %rcx
14023e064:     	leaq	0x350(%rbp), %rdx
14023e06b:     	callq	0x144c79aa0 <.text+0x4c78aa0>
14023e070:     	nop
14023e071:     	movaps	0x140(%rbp), %xmm12
14023e079:     	movups	0x5701560(%rip), %xmm0  # 0x14593f5e0
14023e080:     	movaps	%xmm0, 0x350(%rbp)
14023e087:     	movl	$0x0, 0x360(%rbp)
14023e091:     	leaq	0x140(%rbp), %rcx
14023e098:     	leaq	0x350(%rbp), %rdx
14023e09f:     	callq	0x144c79aa0 <.text+0x4c78aa0>
14023e0a4:     	nop
14023e0a5:     	movaps	0x140(%rbp), %xmm0
14023e0ac:     	movq	0x580(%rbp), %r13
14023e0b3:     	movq	$0x2, (%r13)
14023e0bb:     	movl	$0x1, 0x8(%r13)
14023e0c3:     	movups	%xmm11, 0xc(%r13)
14023e0c8:     	movaps	0x5700791(%rip), %xmm1  # 0x14593e860
14023e0cf:     	movups	%xmm1, 0x1c(%r13)
14023e0d4:     	movups	%xmm12, 0x2c(%r13)
14023e0d9:     	movaps	0x56be940(%rip), %xmm1  # 0x1458fca20
14023e0e0:     	movups	%xmm1, 0x3c(%r13)
14023e0e5:     	movups	%xmm0, 0x4c(%r13)
14023e0ea:     	movl	$0x3f000000, 0x5c(%r13) # imm = 0x3F000000
14023e0f2:     	callq	0x140002200 <.text+0x1200>
14023e0f7:     	movl	$0x48, %ecx
14023e0fc:     	movl	$0x8, %edx
14023e101:     	callq	0x1400021c0 <.text+0x11c0>
14023e106:     	testq	%rax, %rax
14023e109:     	je	0x14023eb82 <.text+0x23db82>
14023e10f:     	movq	%rax, %rsi
14023e112:     	movq	%r12, 0x138(%rbp)
14023e119:     	leaq	0xd0(%rbp), %rbx
14023e120:     	movq	$0x3, (%rax)
14023e127:     	movq	%r13, 0x8(%rax)
14023e12b:     	movq	$0x3, 0x10(%rax)
14023e133:     	movups	0x5701716(%rip), %xmm0  # 0x14593f850
14023e13a:     	movups	%xmm0, 0x18(%rax)
14023e13e:     	movq	$0x0, 0x28(%rax)
14023e146:     	movl	$0x8, 0x30(%rax)
14023e14d:     	movb	$0x0, 0x40(%rax)
14023e151:     	leaq	0x358(%rbp), %rcx
14023e158:     	leaq	0x1d0(%rbp), %r12
14023e15f:     	movl	$0x180, %r8d            # imm = 0x180
14023e165:     	movq	%r12, %rdx
14023e168:     	callq	0x145756ddd <.text+0x5755ddd>
14023e16d:     	movq	$0x1, 0x4d8(%rbp)
14023e178:     	movq	%rsi, 0x4e0(%rbp)
14023e17f:     	movq	$0x1, 0x4e8(%rbp)
14023e18a:     	movq	%rdi, 0x350(%rbp)
14023e191:     	leaq	0x1d0(%rbp), %rcx
14023e198:     	leaq	0x350(%rbp), %rsi
14023e19f:     	movq	%rbx, %rdx
14023e1a2:     	movq	%rsi, %r8
14023e1a5:     	callq	0x1401e7230 <.text+0x1e6230>
14023e1aa:     	movaps	%xmm8, 0x140(%rbp)
14023e1b2:     	movq	$0x0, 0x150(%rbp)
14023e1bd:     	movups	0x5700cd3(%rip), %xmm12 # 0x14593ee98
14023e1c5:     	movups	%xmm12, 0x158(%rbp)
14023e1cd:     	movq	$0x0, 0x168(%rbp)
14023e1d8:     	movaps	%xmm14, 0x170(%rbp)
14023e1e0:     	movq	$0x0, 0x180(%rbp)
14023e1eb:     	movups	0x5700cd5(%rip), %xmm13 # 0x14593eec8
14023e1f3:     	movups	%xmm13, 0x188(%rbp)
14023e1fb:     	movq	$0x0, 0x198(%rbp)
14023e206:     	movaps	%xmm8, 0x1d0(%rbp)
14023e20e:     	movaps	%xmm14, 0x200(%rbp)
14023e216:     	movq	0x150(%rbp), %rax
14023e21d:     	movq	%rax, 0x1e0(%rbp)
14023e224:     	movq	0x158(%rbp), %rax
14023e22b:     	movq	%rax, 0x1e8(%rbp)
14023e232:     	movq	0x160(%rbp), %rax
14023e239:     	movq	%rax, 0x1f0(%rbp)
14023e240:     	movq	0x168(%rbp), %rax
14023e247:     	movq	%rax, 0x1f8(%rbp)
14023e24e:     	movq	0x180(%rbp), %rax
14023e255:     	movq	%rax, 0x210(%rbp)
14023e25c:     	movq	0x188(%rbp), %rax
14023e263:     	movq	%rax, 0x218(%rbp)
14023e26a:     	movaps	0x190(%rbp), %xmm0
14023e271:     	movaps	%xmm0, 0x220(%rbp)
14023e278:     	xorps	%xmm11, %xmm11
14023e27c:     	movaps	%xmm11, 0x240(%rbp)
14023e284:     	movaps	%xmm11, 0x230(%rbp)
14023e28c:     	movq	$0x0, 0x250(%rbp)
14023e297:     	movups	%xmm11, 0x400(%rbp)
14023e29f:     	movups	%xmm11, 0x3f0(%rbp)
14023e2a7:     	movq	$0x0, 0x4cc(%rbp)
14023e2b2:     	movw	$0x0, 0x4d4(%rbp)
14023e2bb:     	movups	0x5700f86(%rip), %xmm0  # 0x14593f248
14023e2c2:     	movups	%xmm0, 0x17(%rbp)
14023e2c6:     	movq	$0x46, 0x27(%rbp)
14023e2ce:     	leaq	0x358(%rbp), %rcx
14023e2d5:     	leaq	0x1d0(%rbp), %rdx
14023e2dc:     	movl	$0x88, %r8d
14023e2e2:     	callq	0x145756ddd <.text+0x5755ddd>
14023e2e7:     	movaps	0x56b8172(%rip), %xmm0  # 0x1458f6460
14023e2ee:     	movups	%xmm0, 0x3e0(%rbp)
14023e2f5:     	movups	0x5700c3b(%rip), %xmm13 # 0x14593ef38
14023e2fd:     	movups	%xmm13, 0x410(%rbp)
14023e305:     	movaps	%xmm8, %xmm10
14023e309:     	movaps	%xmm9, %xmm8
14023e30d:     	movaps	%xmm7, %xmm9
14023e311:     	movaps	%xmm6, %xmm7
14023e314:     	movups	0x5700c4d(%rip), %xmm6  # 0x14593ef68
14023e31b:     	movups	0x5700c25(%rip), %xmm14 # 0x14593ef48
14023e323:     	movups	%xmm14, 0x420(%rbp)
14023e32b:     	movups	%xmm7, 0x430(%rbp)
14023e332:     	movups	%xmm6, 0x440(%rbp)
14023e339:     	movups	%xmm8, 0x450(%rbp)
14023e341:     	movups	%xmm9, 0x460(%rbp)
14023e349:     	movups	0x5700c57(%rip), %xmm15 # 0x14593efa8
14023e351:     	movups	%xmm15, 0x480(%rbp)
14023e359:     	movups	0x5700c37(%rip), %xmm12 # 0x14593ef98
14023e361:     	movups	%xmm12, 0x470(%rbp)
14023e369:     	movaps	0x56ad140(%rip), %xmm0  # 0x1458eb4b0
14023e370:     	movups	%xmm0, 0x490(%rbp)
14023e377:     	movl	$0x1, 0x4a0(%rbp)
14023e381:     	movq	$0x0, 0x4a4(%rbp)
14023e38c:     	movb	$0x1, 0x4ac(%rbp)
14023e393:     	movq	$0x0, 0x4b0(%rbp)
14023e39e:     	movl	$0x3f800000, 0x4b8(%rbp) # imm = 0x3F800000
14023e3a8:     	movw	$0x0, 0x4bc(%rbp)
14023e3b1:     	movw	$0x0, 0x4c2(%rbp)
14023e3ba:     	movl	$0x10000, 0x4be(%rbp)   # imm = 0x10000
14023e3c4:     	movabsq	$0x100000000010000, %rax # imm = 0x100000000010000
14023e3ce:     	movq	%rax, 0x4c4(%rbp)
14023e3d5:     	movb	$0x2, 0x4d8(%rbp)
14023e3dc:     	movq	0x27(%rbp), %rax
14023e3e0:     	movq	%rax, 0x508(%rbp)
14023e3e7:     	movups	-0x8(%rbp), %xmm0
14023e3eb:     	movups	0x8(%rbp), %xmm1
14023e3ef:     	movups	0x18(%rbp), %xmm2
14023e3f3:     	movups	%xmm2, 0x4f9(%rbp)
14023e3fa:     	movups	%xmm1, 0x4e9(%rbp)
14023e401:     	movups	%xmm0, 0x4d9(%rbp)
14023e408:     	movabsq	$0x23f800000, %rax      # imm = 0x23F800000
14023e412:     	movq	%rax, 0x520(%rbp)
14023e419:     	movups	0x5700e10(%rip), %xmm0  # 0x14593f230
14023e420:     	movups	%xmm0, 0x510(%rbp)
14023e427:     	movl	$0x0, 0x548(%rbp)
14023e431:     	movw	$0x0, 0x55c(%rbp)
14023e43a:     	movb	$0x2, 0x560(%rbp)
14023e441:     	movq	%rdi, 0x350(%rbp)
14023e448:     	leaq	0x140(%rbp), %rcx
14023e44f:     	leaq	0x350(%rbp), %r8
14023e456:     	movq	%rbx, %rdx
14023e459:     	callq	0x1401eeea0 <.text+0x1edea0>
14023e45e:     	movaps	%xmm11, 0x270(%rbp)
14023e466:     	movaps	%xmm11, 0x260(%rbp)
14023e46e:     	movaps	%xmm11, 0x250(%rbp)
14023e476:     	movaps	%xmm11, 0x240(%rbp)
14023e47e:     	movaps	%xmm11, 0x230(%rbp)
14023e486:     	movq	$0x0, 0x280(%rbp)
14023e491:     	movups	%xmm13, 0x288(%rbp)
14023e499:     	movups	%xmm14, 0x298(%rbp)
14023e4a1:     	movaps	%xmm6, %xmm14
14023e4a5:     	movaps	%xmm7, %xmm6
14023e4a8:     	movaps	%xmm9, %xmm7
14023e4ac:     	movaps	%xmm8, %xmm9
14023e4b0:     	movaps	%xmm10, %xmm8
14023e4b4:     	movups	0x57009f4(%rip), %xmm10 # 0x14593eeb0
14023e4bc:     	movups	%xmm6, 0x2a8(%rbp)
14023e4c3:     	movups	%xmm14, 0x2b8(%rbp)
14023e4cb:     	movups	%xmm9, 0x2c8(%rbp)
14023e4d3:     	movups	%xmm7, 0x2d8(%rbp)
14023e4da:     	movups	%xmm15, 0x2f8(%rbp)
14023e4e2:     	movups	%xmm12, 0x2e8(%rbp)
14023e4ea:     	movaps	%xmm8, 0x1d0(%rbp)
14023e4f2:     	movq	$0x0, 0x1e0(%rbp)
14023e4fd:     	movups	0x5700994(%rip), %xmm0  # 0x14593ee98
14023e504:     	movups	%xmm0, 0x1e8(%rbp)
14023e50b:     	movq	$0x0, 0x1f8(%rbp)
14023e516:     	movaps	%xmm10, 0x200(%rbp)
14023e51e:     	movq	$0x0, 0x210(%rbp)
14023e529:     	movups	0x5700998(%rip), %xmm0  # 0x14593eec8
14023e530:     	movups	%xmm0, 0x218(%rbp)
14023e537:     	movq	$0x0, 0x228(%rbp)
14023e542:     	leaq	0x358(%rbp), %rcx
14023e549:     	leaq	0x1d0(%rbp), %rdx
14023e550:     	movl	$0x138, %r8d            # imm = 0x138
14023e556:     	callq	0x145756ddd <.text+0x5755ddd>
14023e55b:     	movaps	0x56acf4e(%rip), %xmm0  # 0x1458eb4b0
14023e562:     	movups	%xmm0, 0x490(%rbp)
14023e569:     	movl	$0x1, 0x4a0(%rbp)
14023e573:     	movss	0x56be869(%rip), %xmm0  # 0x1458fcde4
14023e57b:     	movlps	%xmm0, 0x4a4(%rbp)
14023e582:     	movb	$0x1, 0x4ac(%rbp)
14023e589:     	movq	$0x0, 0x4b0(%rbp)
14023e594:     	movl	$0x3f800000, 0x4b8(%rbp) # imm = 0x3F800000
14023e59e:     	movw	$0x0, 0x4bc(%rbp)
14023e5a7:     	movl	$0x10000, 0x4be(%rbp)   # imm = 0x10000
14023e5b1:     	movw	$0x0, 0x4c2(%rbp)
14023e5ba:     	movl	$0x10000, 0x4c4(%rbp)   # imm = 0x10000
14023e5c4:     	movw	$0x0, 0x4c8(%rbp)
14023e5cd:     	movq	$0x0, 0x4ca(%rbp)
14023e5d8:     	movl	$0x5, 0x4d2(%rbp)
14023e5e2:     	movq	0x578(%rbp), %rax
14023e5e9:     	movq	%rax, 0x350(%rbp)
14023e5f0:     	leaq	-0x38(%rbp), %rcx
14023e5f4:     	leaq	0x350(%rbp), %r8
14023e5fb:     	leaq	0xa0(%rbp), %rdx
14023e602:     	callq	0x1401e3e60 <.text+0x1e2e60>
14023e607:     	movq	0x18(%r15), %rax
14023e60b:     	movq	%rax, 0x578(%rbp)
14023e612:     	movq	-0x38(%rbp), %rcx
14023e616:     	movq	-0x10(%rbp), %rax
14023e61a:     	movq	%rcx, 0x580(%rbp)
14023e621:     	movq	%rcx, 0xf8(%rbp)
14023e628:     	movups	-0x30(%rbp), %xmm0
14023e62c:     	movups	%xmm0, 0x100(%rbp)
14023e633:     	movups	-0x20(%rbp), %xmm0
14023e637:     	movups	%xmm0, 0x110(%rbp)
14023e63e:     	movq	%rax, 0x120(%rbp)
14023e645:     	movq	$0x0, 0xd8(%rbp)
14023e650:     	movl	$0xc019999a, 0xe0(%rbp) # imm = 0xC019999A
14023e65a:     	movq	$0x1, 0xe8(%rbp)
14023e665:     	movl	$0x4019999a, 0xf0(%rbp) # imm = 0x4019999A
14023e66f:     	leaq	0x1(%r14), %rax
14023e673:     	movq	%rax, 0x130(%rbp)
14023e67a:     	movaps	0x57001ee(%rip), %xmm12 # 0x14593e870
14023e682:     	xorl	%edi, %edi
14023e684:     	cmpq	$0x2, %rdi
14023e688:     	je	0x14023eb07 <.text+0x23db07>
14023e68e:     	movq	%rdi, %rax
14023e691:     	shlq	$0x4, %rax
14023e695:     	leaq	0xd0(%rbp), %rcx
14023e69c:     	movq	0x8(%rcx,%rax), %rbx
14023e6a1:     	movss	0x10(%rcx,%rax), %xmm13
14023e6a8:     	movw	$0x0, 0x334(%rbp)
14023e6b1:     	movb	$0x1, 0x324(%rbp)
14023e6b8:     	movups	%xmm11, 0x78(%r12)
14023e6be:     	movups	%xmm11, 0x68(%r12)
14023e6c4:     	movups	%xmm12, 0x258(%rbp)
14023e6cc:     	movq	$0x0, 0x230(%rbp)
14023e6d7:     	movups	%xmm11, 0xa8(%r12)
14023e6e0:     	movups	%xmm11, 0x98(%r12)
14023e6e9:     	movw	$0x0, 0x17c(%r12)
14023e6f4:     	movl	$0x0, 0x178(%r12)
14023e700:     	movups	0x5700841(%rip), %xmm0  # 0x14593ef48
14023e707:     	movups	%xmm0, 0xc8(%r12)
14023e710:     	movups	0x5700821(%rip), %xmm0  # 0x14593ef38
14023e717:     	movups	%xmm0, 0xb8(%r12)
14023e720:     	movups	%xmm14, 0xe8(%r12)
14023e729:     	movups	%xmm6, 0xd8(%r12)
14023e732:     	movups	%xmm7, 0x108(%r12)
14023e73b:     	movups	%xmm9, 0xf8(%r12)
14023e744:     	movups	%xmm15, 0x128(%r12)
14023e74d:     	movups	0x5700844(%rip), %xmm0  # 0x14593ef98
14023e754:     	movups	%xmm0, 0x118(%r12)
14023e75d:     	movw	$0x0, 0x346(%rbp)
14023e766:     	movl	$0x0, 0x342(%rbp)
14023e770:     	movq	$0x0, 0x328(%rbp)
14023e77b:     	movl	$0x3f800000, 0x330(%rbp) # imm = 0x3F800000
14023e785:     	movaps	0x56acd24(%rip), %xmm0  # 0x1458eb4b0
14023e78c:     	movups	%xmm0, 0x308(%rbp)
14023e793:     	movl	$0x1, 0x318(%rbp)
14023e79d:     	movq	$0x0, 0x31c(%rbp)
14023e7a8:     	movaps	%xmm8, 0x1d0(%rbp)
14023e7b0:     	movq	$0x0, 0x1e0(%rbp)
14023e7bb:     	movups	0x57006d6(%rip), %xmm0  # 0x14593ee98
14023e7c2:     	movups	%xmm0, 0x18(%r12)
14023e7c8:     	movq	$0x0, 0x28(%r12)
14023e7d1:     	movups	%xmm10, 0x30(%r12)
14023e7d7:     	movq	$0x0, 0x40(%r12)
14023e7e0:     	movups	0x57006e1(%rip), %xmm0  # 0x14593eec8
14023e7e7:     	movups	%xmm0, 0x48(%r12)
14023e7ed:     	movq	$0x0, 0x58(%r12)
14023e7f6:     	movl	$0x10000, 0x166(%r12)   # imm = 0x10000
14023e802:     	movw	$0x0, 0x16a(%r12)
14023e80d:     	movw	$0x0, 0x170(%r12)
14023e818:     	movl	$0x10000, 0x16c(%r12)   # imm = 0x10000
14023e824:     	cmpq	$0x1, %rbx
14023e828:     	ja	0x14023eba4 <.text+0x23dba4>
14023e82e:     	movq	%rsi, %r15
14023e831:     	movq	%rbx, %rax
14023e834:     	shlq	$0x4, %rax
14023e838:     	leaq	0x57012d1(%rip), %rcx   # 0x14593fb10
14023e83f:     	movq	(%rax,%rcx), %r13
14023e843:     	movq	0x8(%rax,%rcx), %r14
14023e848:     	callq	0x140002200 <.text+0x1200>
14023e84d:     	movl	$0x1, %edx
14023e852:     	movq	%r14, %rcx
14023e855:     	callq	0x1400021c0 <.text+0x11c0>
14023e85a:     	testq	%rax, %rax
14023e85d:     	je	0x14023eb94 <.text+0x23db94>
14023e863:     	movq	%rax, %rsi
14023e866:     	movq	%rax, %rcx
14023e869:     	movq	%r13, %rdx
14023e86c:     	movq	%r14, %r8
14023e86f:     	callq	0x145756ddd <.text+0x5755ddd>
14023e874:     	movq	%r14, 0x350(%rbp)
14023e87b:     	movq	%rsi, 0x358(%rbp)
14023e882:     	movq	%r14, 0x360(%rbp)
14023e889:     	leaq	0x56af088(%rip), %rax   # 0x1458ed918
14023e890:     	movq	%rax, 0x20(%rsp)
14023e895:     	movl	$0x1, %r9d
14023e89b:     	leaq	-0x50(%rbp), %r14
14023e89f:     	movq	%r14, %rcx
14023e8a2:     	movq	0x578(%rbp), %rdx
14023e8a9:     	movq	%r15, %rsi
14023e8ac:     	movq	%r15, %r8
14023e8af:     	callq	0x1400310a0 <.text+0x300a0>
14023e8b4:     	nop
14023e8b5:     	leaq	-0x8(%rbp), %r13
14023e8b9:     	movq	%r13, %rcx
14023e8bc:     	movq	%r14, %rdx
14023e8bf:     	callq	0x1426f00c0 <.text+0x26ef0c0>
14023e8c4:     	nop
14023e8c5:     	incq	%rdi
14023e8c8:     	movl	$0x180, %r8d            # imm = 0x180
14023e8ce:     	leaq	0x358(%rbp), %rcx
14023e8d5:     	movq	%r12, %rdx
14023e8d8:     	callq	0x145756ddd <.text+0x5755ddd>
14023e8dd:     	movl	$0x88, %r8d
14023e8e3:     	leaq	0x143(%rbp), %rcx
14023e8ea:     	movq	%r13, %rdx
14023e8ed:     	callq	0x145756ddd <.text+0x5755ddd>
14023e8f2:     	movss	%xmm13, 0x4d8(%rbp)
14023e8fb:     	movb	$0x2, 0x4dc(%rbp)
14023e902:     	movl	$0x8b, %r8d
14023e908:     	leaq	0x4dd(%rbp), %rcx
14023e90f:     	leaq	0x140(%rbp), %rdx
14023e916:     	callq	0x145756ddd <.text+0x5755ddd>
14023e91b:     	movq	0x580(%rbp), %rax
14023e922:     	movq	%rax, 0x350(%rbp)
14023e929:     	movq	%r12, %rcx
14023e92c:     	leaq	0x100(%rbp), %rdx
14023e933:     	movq	%rsi, %r8
14023e936:     	callq	0x1401eff40 <.text+0x1eef40>
14023e93b:     	testq	%rbx, %rbx
14023e93e:     	leaq	0x5701203(%rip), %rcx   # 0x14593fb48
14023e945:     	jne	0x14023e684 <.text+0x23d684>
14023e94b:     	movq	%rdi, 0x128(%rbp)
14023e952:     	movl	$0x13, %edx
14023e957:     	callq	0x145452350 <.text+0x5451350>
14023e95c:     	movq	%rdx, %rbx
14023e95f:     	testq	%rdx, %rdx
14023e962:     	js	0x14023eaf8 <.text+0x23daf8>
14023e968:     	je	0x14023e9d1 <.text+0x23d9d1>
14023e96a:     	movq	%rax, %r13
14023e96d:     	callq	0x140002200 <.text+0x1200>
14023e972:     	movl	$0x1, %esi
14023e977:     	movl	$0x1, %edx
14023e97c:     	movq	%rbx, %rcx
14023e97f:     	callq	0x1400021c0 <.text+0x11c0>
14023e984:     	testq	%rax, %rax
14023e987:     	je	0x14023eafa <.text+0x23dafa>
14023e98d:     	movq	%rax, %r14
14023e990:     	movq	%rax, %rcx
14023e993:     	movq	%r13, %rdx
14023e996:     	movq	%rbx, %r8
14023e999:     	callq	0x145756ddd <.text+0x5755ddd>
14023e99e:     	movq	%r15, %rsi
14023e9a1:     	movq	0x570(%rbp), %rdx
14023e9a8:     	cmpb	$0x1, (%rdx)
14023e9ab:     	jne	0x14023e9e3 <.text+0x23d9e3>
14023e9ad:     	movq	0x130(%rbp), %rcx
14023e9b4:     	movl	(%rcx), %eax
14023e9b6:     	movl	0x3(%rcx), %ecx
14023e9b9:     	movl	%ecx, 0x1d3(%rbp)
14023e9bf:     	movl	%eax, 0x1d0(%rbp)
14023e9c5:     	movq	0x8(%rdx), %rax
14023e9c9:     	movzbl	0x10(%rdx), %edx
14023e9cd:     	movb	$0x1, %cl
14023e9cf:     	jmp	0x14023e9f3 <.text+0x23d9f3>
14023e9d1:     	movl	$0x1, %r14d
14023e9d7:     	movq	0x570(%rbp), %rdx
14023e9de:     	cmpb	$0x1, (%rdx)
14023e9e1:     	je	0x14023e9ad <.text+0x23d9ad>
14023e9e3:     	movq	0x8(%rdx), %rax
14023e9e7:     	lock
14023e9e8:     	incq	(%rax)
14023e9eb:     	jle	0x14023ebb9 <.text+0x23dbb9>
14023e9f1:     	xorl	%ecx, %ecx
14023e9f3:     	movl	0x1d0(%rbp), %r8d
14023e9fa:     	movl	0x1d3(%rbp), %r9d
14023ea01:     	leaq	0x358(%rbp), %r10
14023ea08:     	movl	%r9d, 0x34(%r10)
14023ea0c:     	movl	%r8d, 0x31(%r10)
14023ea10:     	movups	0x5700425(%rip), %xmm0  # 0x14593ee3c
14023ea17:     	leaq	0x140(%rbp), %r8
14023ea1e:     	movups	%xmm0, 0x1(%r8)
14023ea23:     	movl	$0x3f800000, 0x11(%r8)  # imm = 0x3F800000
14023ea2b:     	movq	%rbx, 0x358(%rbp)
14023ea32:     	movq	%r14, 0x360(%rbp)
14023ea39:     	movq	%rbx, 0x368(%rbp)
14023ea40:     	movq	$0x0, 0x370(%rbp)
14023ea4b:     	movq	$0x4, 0x378(%rbp)
14023ea56:     	movq	$0x0, 0x380(%rbp)
14023ea61:     	movb	%cl, 0x388(%rbp)
14023ea67:     	movq	%rax, 0x390(%rbp)
14023ea6e:     	movq	%rdx, 0x398(%rbp)
14023ea75:     	movl	$0x41400000, 0x3a0(%rbp) # imm = 0x41400000
14023ea7f:     	movw	$0x190, 0x3a4(%rbp)     # imm = 0x190
14023ea88:     	movb	$0x1, 0x3a6(%rbp)
14023ea8f:     	movq	0x14d(%rbp), %rax
14023ea96:     	movq	%rax, 0x5c(%r10)
14023ea9a:     	movups	0x140(%rbp), %xmm0
14023eaa1:     	movups	%xmm0, 0x4f(%r10)
14023eaa6:     	movl	0x56bee30(%rip), %eax   # 0x1458fd8dc
14023eaac:     	movl	%eax, 0x74(%r10)
14023eab0:     	movups	0x56bee15(%rip), %xmm0  # 0x1458fd8cc
14023eab7:     	movups	%xmm0, 0x64(%r10)
14023eabc:     	movsd	0x56ba44c(%rip), %xmm0  # 0x1458f8f10
14023eac4:     	movsd	%xmm0, 0x3d0(%rbp)
14023eacc:     	movq	0x580(%rbp), %rax
14023ead3:     	movq	%rax, 0x350(%rbp)
14023eada:     	movq	%r12, %rcx
14023eadd:     	leaq	0x100(%rbp), %rdx
14023eae4:     	movq	%rsi, %r8
14023eae7:     	callq	0x1401e8b90 <.text+0x1e7b90>
14023eaec:     	movq	0x128(%rbp), %rdi
14023eaf3:     	jmp	0x14023e684 <.text+0x23d684>
14023eaf8:     	xorl	%esi, %esi
14023eafa:     	movq	%rsi, %rcx
14023eafd:     	movq	%rbx, %rdx
14023eb00:     	callq	0x1458e721b <.text+0x58e621b>
14023eb05:     	ud2
14023eb07:     	movq	0x138(%rbp), %rax
14023eb0e:     	movaps	0x590(%rbp), %xmm6
14023eb15:     	movaps	0x5a0(%rbp), %xmm7
14023eb1c:     	movaps	0x5b0(%rbp), %xmm8
14023eb24:     	movaps	0x5c0(%rbp), %xmm9
14023eb2c:     	movaps	0x5d0(%rbp), %xmm10
14023eb34:     	movaps	0x5e0(%rbp), %xmm11
14023eb3c:     	movaps	0x5f0(%rbp), %xmm12
14023eb44:     	movaps	0x600(%rbp), %xmm13
14023eb4c:     	movaps	0x610(%rbp), %xmm14
14023eb54:     	movaps	0x620(%rbp), %xmm15
14023eb5c:     	addq	$0x6b8, %rsp            # imm = 0x6B8
14023eb63:     	popq	%rbx
14023eb64:     	popq	%rdi
14023eb65:     	popq	%rsi
14023eb66:     	popq	%r12
14023eb68:     	popq	%r13
14023eb6a:     	popq	%r14
14023eb6c:     	popq	%r15
14023eb6e:     	popq	%rbp
14023eb6f:     	retq
14023eb70:     	movl	$0x4, %ecx
14023eb75:     	movl	$0x60, %edx
14023eb7a:     	callq	0x1458e7201 <.text+0x58e6201>
14023eb7f:     	nop
14023eb80:     	jmp	0x14023ebb9 <.text+0x23dbb9>
14023eb82:     	movl	$0x8, %ecx
14023eb87:     	movl	$0x48, %edx
14023eb8c:     	callq	0x1458e7201 <.text+0x58e6201>
14023eb91:     	nop
14023eb92:     	jmp	0x14023ebb9 <.text+0x23dbb9>
14023eb94:     	movl	$0x1, %ecx
14023eb99:     	movq	%r14, %rdx
14023eb9c:     	callq	0x1458e721b <.text+0x58e621b>
14023eba1:     	nop
14023eba2:     	jmp	0x14023ebb9 <.text+0x23dbb9>
14023eba4:     	leaq	0x5700f85(%rip), %r8    # 0x14593fb30
14023ebab:     	movl	$0x2, %edx
14023ebb0:     	movq	%rbx, %rcx
14023ebb3:     	callq	0x1458e75b3 <.text+0x58e65b3>
14023ebb8:     	nop
14023ebb9:     	ud2


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145430740:     	pushq	%rbp
145430741:     	pushq	%r15
145430743:     	pushq	%r14
145430745:     	pushq	%r13
145430747:     	pushq	%r12
145430749:     	pushq	%rsi
14543074a:     	pushq	%rdi
14543074b:     	pushq	%rbx
14543074c:     	subq	$0x458, %rsp            # imm = 0x458
145430753:     	leaq	0x80(%rsp), %rbp
14543075b:     	movaps	%xmm6, 0x3c0(%rbp)
145430762:     	movq	$-0x2, 0x3b8(%rbp)
14543076d:     	movq	%r8, %rsi
145430770:     	movq	%rdx, %rdi
145430773:     	movq	%rcx, 0x18(%rbp)
145430777:     	movq	$0x0, 0x240(%rbp)
145430782:     	movq	%r8, 0x248(%rbp)
145430789:     	movq	%rdx, 0x250(%rbp)
145430790:     	movq	%r8, 0x258(%rbp)
145430797:     	movq	$0x0, 0x260(%rbp)
1454307a2:     	movq	%r8, 0x268(%rbp)
1454307a9:     	movabsq	$0xa0000000a, %rbx      # imm = 0xA0000000A
1454307b3:     	movq	%rbx, 0x270(%rbp)
1454307ba:     	movb	$0x1, 0x278(%rbp)
1454307c1:     	movw	$0x0, 0x280(%rbp)
1454307ca:     	movq	%rbp, %rcx
1454307cd:     	leaq	0x240(%rbp), %r14
1454307d4:     	movq	%r14, %rdx
1454307d7:     	callq	0x145537680 <.text+0x5536680>
1454307dc:     	movq	$0x0, 0x320(%rbp)
1454307e7:     	movq	%rsi, 0x328(%rbp)
1454307ee:     	leaq	0x330(%rbp), %r15
1454307f5:     	movq	%rdi, 0x370(%rbp)
1454307fc:     	movq	%rdi, 0x330(%rbp)
145430803:     	movq	%rsi, 0x338(%rbp)
14543080a:     	movq	$0x0, 0x340(%rbp)
145430815:     	movq	%rsi, 0x378(%rbp)
14543081c:     	movq	%rsi, 0x348(%rbp)
145430823:     	movq	%rbx, 0x350(%rbp)
14543082a:     	movb	$0x1, 0x358(%rbp)
145430831:     	movw	$0x0, 0x360(%rbp)
14543083a:     	leaq	0x220(%rbp), %r12
145430841:     	xorl	%eax, %eax
145430843:     	movq	$-0x1, %rdi
14543084a:     	testb	$0x1, %al
14543084c:     	je	0x145433e66 <.text+0x5432e66>
145430852:     	movq	%rdi, 0x58(%rbp)
145430856:     	movq	$0x0, 0x158(%rbp)
145430861:     	movq	$0x8, 0x160(%rbp)
14543086c:     	movq	$0x0, 0x168(%rbp)
145430877:     	movq	$0x0, 0x320(%rbp)
145430882:     	movq	0x378(%rbp), %rax
145430889:     	movq	%rax, 0x328(%rbp)
145430890:     	leaq	0x330(%rbp), %r14
145430897:     	movq	0x370(%rbp), %rcx
14543089e:     	movq	%rcx, 0x330(%rbp)
1454308a5:     	movq	%rax, 0x338(%rbp)
1454308ac:     	movq	$0x0, 0x340(%rbp)
1454308b7:     	movq	%rax, 0x348(%rbp)
1454308be:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1454308c8:     	movq	%rax, 0x350(%rbp)
1454308cf:     	movb	$0x1, 0x358(%rbp)
1454308d6:     	movw	$0x0, 0x360(%rbp)
1454308df:     	xorl	%eax, %eax
1454308e1:     	leaq	0x240(%rbp), %r15
1454308e8:     	leaq	0x1d8(%rbp), %r12
1454308ef:     	movl	$0x6f6c6e75, %edi       # imm = 0x6F6C6E75
1454308f4:     	leaq	0x130ce4d(%rip), %rbx   # 0x14673d748
1454308fb:     	jmp	0x145430945 <.text+0x542f945>
1454308fd:     	movq	(%rsi), %rax
145430900:     	movl	(%rax), %ecx
145430902:     	xorl	%edi, %ecx
145430904:     	movzwl	0x4(%rax), %eax
145430908:     	xorl	$0x6b63, %eax           # imm = 0x6B63
14543090d:     	orl	%ecx, %eax
14543090f:     	je	0x145430ad2 <.text+0x542fad2>
145430915:     	nopw	%cs:(%rax,%rax)
145430920:     	movq	0x1d8(%rbp), %rdx
145430927:     	testq	%rdx, %rdx
14543092a:     	je	0x14543093e <.text+0x542f93e>
14543092c:     	shlq	$0x4, %rdx
145430930:     	movl	$0x8, %r8d
145430936:     	movq	%rsi, %rcx
145430939:     	callq	0x1400021d0 <.text+0x11d0>
14543093e:     	movzbl	0x361(%rbp), %eax
145430945:     	testb	$0x1, %al
145430947:     	jne	0x14543109d <.text+0x543009d>
14543094d:     	movq	0x330(%rbp), %rsi
145430954:     	movq	%r15, %rcx
145430957:     	movq	%r14, %rdx
14543095a:     	callq	0x14543cad0 <.text+0x543bad0>
14543095f:     	nop
145430960:     	cmpl	$0x1, 0x240(%rbp)
145430967:     	jne	0x145430990 <.text+0x542f990>
145430969:     	movq	0x250(%rbp), %rdx
145430970:     	movq	0x320(%rbp), %rax
145430977:     	movq	%rdx, 0x320(%rbp)
14543097e:     	subq	%rax, %rdx
145430981:     	addq	%rax, %rsi
145430984:     	testq	%rdx, %rdx
145430987:     	jne	0x1454309d2 <.text+0x542f9d2>
145430989:     	jmp	0x145430a00 <.text+0x542fa00>
14543098b:     	nopl	(%rax,%rax)
145430990:     	cmpb	$0x0, 0x361(%rbp)
145430997:     	jne	0x14543109d <.text+0x543009d>
14543099d:     	movb	$0x1, 0x361(%rbp)
1454309a4:     	movq	0x320(%rbp), %rsi
1454309ab:     	movq	0x328(%rbp), %rdx
1454309b2:     	subq	%rsi, %rdx
1454309b5:     	setne	%al
1454309b8:     	orb	0x360(%rbp), %al
1454309be:     	cmpb	$0x1, %al
1454309c0:     	jne	0x14543109d <.text+0x543009d>
1454309c6:     	addq	0x330(%rbp), %rsi
1454309cd:     	testq	%rdx, %rdx
1454309d0:     	je	0x145430a00 <.text+0x542fa00>
1454309d2:     	cmpb	$0xa, -0x1(%rsi,%rdx)
1454309d7:     	jne	0x145430a00 <.text+0x542fa00>
1454309d9:     	movq	%rdx, %rax
1454309dc:     	decq	%rax
1454309df:     	je	0x1454309ee <.text+0x542f9ee>
1454309e1:     	cmpb	$0xd, -0x2(%rsi,%rdx)
1454309e6:     	jne	0x1454309f2 <.text+0x542f9f2>
1454309e8:     	addq	$-0x2, %rdx
1454309ec:     	jmp	0x145430a00 <.text+0x542fa00>
1454309ee:     	xorl	%edx, %edx
1454309f0:     	jmp	0x145430a00 <.text+0x542fa00>
1454309f2:     	movq	%rax, %rdx
1454309f5:     	nopw	%cs:(%rax,%rax)
145430a00:     	movq	%rsi, %rcx
145430a03:     	callq	0x1400a4890 <.text+0xa3890>
145430a08:     	nop
145430a09:     	movq	$0x0, 0x240(%rbp)
145430a14:     	movq	%rdx, 0x248(%rbp)
145430a1b:     	movq	%rax, 0x250(%rbp)
145430a22:     	movq	%rdx, 0x258(%rbp)
145430a29:     	movq	$0x0, 0x260(%rbp)
145430a34:     	movq	%rdx, 0x268(%rbp)
145430a3b:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
145430a45:     	movq	%rax, 0x270(%rbp)
145430a4c:     	movb	$0x1, 0x278(%rbp)
145430a53:     	movw	$0x1, 0x280(%rbp)
145430a5c:     	movq	%r12, %rcx
145430a5f:     	movq	%r15, %rdx
145430a62:     	callq	0x1455393f0 <.text+0x55383f0>
145430a67:     	nop
145430a68:     	movq	0x1e0(%rbp), %rsi
145430a6f:     	cmpq	$0x3, 0x1e8(%rbp)
145430a77:     	jne	0x145430920 <.text+0x542f920>
145430a7d:     	movq	0x8(%rsi), %rax
145430a81:     	cmpq	$0x6, %rax
145430a85:     	je	0x1454308fd <.text+0x542f8fd>
145430a8b:     	cmpq	$0x4, %rax
145430a8f:     	jne	0x145430920 <.text+0x542f920>
145430a95:     	movq	(%rsi), %rax
145430a98:     	cmpl	$0x6e65706f, (%rax)     # imm = 0x6E65706F
145430a9e:     	jne	0x145430920 <.text+0x542f920>
145430aa4:     	movq	0x18(%rsi), %rdx
145430aa8:     	testq	%rdx, %rdx
145430aab:     	je	0x145430920 <.text+0x542f920>
145430ab1:     	movq	0x10(%rsi), %rcx
145430ab5:     	cmpq	$0x1, %rdx
145430ab9:     	jne	0x145430b09 <.text+0x542fb09>
145430abb:     	movzbl	(%rcx), %eax
145430abe:     	cmpl	$0x2b, %eax
145430ac1:     	je	0x145430920 <.text+0x542f920>
145430ac7:     	cmpl	$0x2d, %eax
145430aca:     	je	0x145430920 <.text+0x542f920>
145430ad0:     	jmp	0x145430b0c <.text+0x542fb0c>
145430ad2:     	movq	0x18(%rsi), %r8
145430ad6:     	movb	$0x1, %cl
145430ad8:     	testq	%r8, %r8
145430adb:     	je	0x145430ba7 <.text+0x542fba7>
145430ae1:     	movq	0x10(%rsi), %rdx
145430ae5:     	cmpq	$0x1, %r8
145430ae9:     	jne	0x145430b70 <.text+0x542fb70>
145430aef:     	movzbl	(%rdx), %r9d
145430af3:     	cmpl	$0x2b, %r9d
145430af7:     	je	0x145430ba7 <.text+0x542fba7>
145430afd:     	cmpl	$0x2d, %r9d
145430b01:     	je	0x145430ba7 <.text+0x542fba7>
145430b07:     	jmp	0x145430b74 <.text+0x542fb74>
145430b09:     	movzbl	(%rcx), %eax
145430b0c:     	xorl	%r8d, %r8d
145430b0f:     	cmpb	$0x2b, %al
145430b11:     	sete	%r8b
145430b15:     	movq	%rdx, %rax
145430b18:     	subq	%r8, %rax
145430b1b:     	addq	%r8, %rcx
145430b1e:     	cmpq	$0x3, %rax
145430b22:     	jae	0x145430bb9 <.text+0x542fbb9>
145430b28:     	testq	%rax, %rax
145430b2b:     	je	0x145430d55 <.text+0x542fd55>
145430b31:     	movzbl	(%rcx), %r13d
145430b35:     	addl	$-0x30, %r13d
145430b39:     	cmpl	$0x9, %r13d
145430b3d:     	ja	0x145430920 <.text+0x542f920>
145430b43:     	cmpq	$0x1, %rax
145430b47:     	je	0x145430d58 <.text+0x542fd58>
145430b4d:     	movzbl	0x1(%rcx), %eax
145430b51:     	addl	$-0x30, %eax
145430b54:     	cmpl	$0x9, %eax
145430b57:     	ja	0x145430920 <.text+0x542f920>
145430b5d:     	movzbl	%r13b, %ecx
145430b61:     	addl	%ecx, %ecx
145430b63:     	leal	(%rcx,%rcx,4), %ecx
145430b66:     	addb	%cl, %al
145430b68:     	movl	%eax, %r13d
145430b6b:     	jmp	0x145430d58 <.text+0x542fd58>
145430b70:     	movzbl	(%rdx), %r9d
145430b74:     	xorl	%eax, %eax
145430b76:     	cmpb	$0x2b, %r9b
145430b7a:     	sete	%al
145430b7d:     	movq	%r8, %r9
145430b80:     	subq	%rax, %r9
145430b83:     	addq	%rax, %rdx
145430b86:     	cmpq	$0x3, %r9
145430b8a:     	jae	0x145430c0b <.text+0x542fc0b>
145430b8c:     	testq	%r9, %r9
145430b8f:     	je	0x145430d72 <.text+0x542fd72>
145430b95:     	movzbl	(%rdx), %r13d
145430b99:     	addl	$-0x30, %r13d
145430b9d:     	cmpl	$0x9, %r13d
145430ba1:     	jbe	0x145430e1f <.text+0x542fe1f>
145430ba7:     	movq	0x28(%rsi), %r8
145430bab:     	testq	%r8, %r8
145430bae:     	jne	0x145430c64 <.text+0x542fc64>
145430bb4:     	jmp	0x145430920 <.text+0x542f920>
145430bb9:     	negq	%r8
145430bbc:     	addq	%r8, %rdx
145430bbf:     	negq	%rdx
145430bc2:     	xorl	%r8d, %r8d
145430bc5:     	xorl	%r13d, %r13d
145430bc8:     	movq	%rdx, %rax
145430bcb:     	addq	%r8, %rax
145430bce:     	je	0x145430d58 <.text+0x542fd58>
145430bd4:     	movl	%r13d, %eax
145430bd7:     	movb	$0xa, %r9b
145430bda:     	mulb	%r9b
145430bdd:     	jo	0x145430920 <.text+0x542f920>
145430be3:     	movl	%eax, %r13d
145430be6:     	movzbl	(%rcx,%r8), %r9d
145430beb:     	addl	$-0x30, %r9d
145430bef:     	addb	%r9b, %r13b
145430bf2:     	setb	%al
145430bf5:     	cmpl	$0x9, %r9d
145430bf9:     	ja	0x145430920 <.text+0x542f920>
145430bff:     	incq	%r8
145430c02:     	testb	%al, %al
145430c04:     	je	0x145430bc8 <.text+0x542fbc8>
145430c06:     	jmp	0x145430920 <.text+0x542f920>
145430c0b:     	negq	%rax
145430c0e:     	addq	%rax, %r8
145430c11:     	negq	%r8
145430c14:     	xorl	%r9d, %r9d
145430c17:     	xorl	%r13d, %r13d
145430c1a:     	movq	%r8, %rax
145430c1d:     	addq	%r9, %rax
145430c20:     	setne	%cl
145430c23:     	je	0x145430c57 <.text+0x542fc57>
145430c25:     	movl	%r13d, %eax
145430c28:     	movb	$0xa, %r10b
145430c2b:     	mulb	%r10b
145430c2e:     	jo	0x145430ba7 <.text+0x542fba7>
145430c34:     	movl	%eax, %r13d
145430c37:     	movzbl	(%rdx,%r9), %r10d
145430c3c:     	addl	$-0x30, %r10d
145430c40:     	addb	%r10b, %r13b
145430c43:     	setb	%al
145430c46:     	cmpl	$0x9, %r10d
145430c4a:     	ja	0x145430ba7 <.text+0x542fba7>
145430c50:     	incq	%r9
145430c53:     	testb	%al, %al
145430c55:     	je	0x145430c1a <.text+0x542fc1a>
145430c57:     	movq	0x28(%rsi), %r8
145430c5b:     	testq	%r8, %r8
145430c5e:     	je	0x145430920 <.text+0x542f920>
145430c64:     	movq	0x20(%rsi), %r9
145430c68:     	cmpq	$0x1, %r8
145430c6c:     	jne	0x145430c86 <.text+0x542fc86>
145430c6e:     	movzbl	(%r9), %eax
145430c72:     	cmpl	$0x2b, %eax
145430c75:     	je	0x145430920 <.text+0x542f920>
145430c7b:     	cmpl	$0x2d, %eax
145430c7e:     	je	0x145430920 <.text+0x542f920>
145430c84:     	jmp	0x145430c8a <.text+0x542fc8a>
145430c86:     	movzbl	(%r9), %eax
145430c8a:     	xorl	%r10d, %r10d
145430c8d:     	cmpb	$0x2b, %al
145430c8f:     	sete	%r10b
145430c93:     	movq	%r8, %rdx
145430c96:     	subq	%r10, %rdx
145430c99:     	addq	%r10, %r9
145430c9c:     	movq	%r10, %rax
145430c9f:     	negq	%rax
145430ca2:     	cmpq	$0x11, %rdx
145430ca6:     	jae	0x145430d0f <.text+0x542fd0f>
145430ca8:     	testq	%rdx, %rdx
145430cab:     	je	0x145430d89 <.text+0x542fd89>
145430cb1:     	addq	%rax, %r8
145430cb4:     	negq	%r8
145430cb7:     	xorl	%edx, %edx
145430cb9:     	xorl	%eax, %eax
145430cbb:     	nopl	(%rax,%rax)
145430cc0:     	movzbl	(%r9,%rdx), %r10d
145430cc5:     	addl	$-0x30, %r10d
145430cc9:     	cmpl	$0x9, %r10d
145430ccd:     	ja	0x145430920 <.text+0x542f920>
145430cd3:     	leaq	(%rax,%rax,4), %rax
145430cd7:     	movl	%r10d, %r10d
145430cda:     	leaq	(%r10,%rax,2), %rax
145430cde:     	incq	%rdx
145430ce1:     	movq	%r8, %r10
145430ce4:     	addq	%rdx, %r10
145430ce7:     	jne	0x145430cc0 <.text+0x542fcc0>
145430ce9:     	cmpq	$0x9, %rax
145430ced:     	movl	$0x9, %edx
145430cf2:     	cmovbq	%rax, %rdx
145430cf6:     	testq	%rax, %rax
145430cf9:     	movl	$0x1, %eax
145430cfe:     	cmoveq	%rax, %rdx
145430d02:     	testb	%cl, %cl
145430d04:     	jne	0x145430920 <.text+0x542f920>
145430d0a:     	jmp	0x145430d96 <.text+0x542fd96>
145430d0f:     	addq	%rax, %r8
145430d12:     	negq	%r8
145430d15:     	xorl	%r10d, %r10d
145430d18:     	xorl	%eax, %eax
145430d1a:     	movq	%r8, %rdx
145430d1d:     	addq	%r10, %rdx
145430d20:     	je	0x145430ce9 <.text+0x542fce9>
145430d22:     	movl	$0xa, %edx
145430d27:     	mulq	%rdx
145430d2a:     	jo	0x145430920 <.text+0x542f920>
145430d30:     	movzbl	(%r9,%r10), %r11d
145430d35:     	addl	$-0x30, %r11d
145430d39:     	addq	%r11, %rax
145430d3c:     	setb	%dl
145430d3f:     	cmpl	$0x9, %r11d
145430d43:     	ja	0x145430920 <.text+0x542f920>
145430d49:     	incq	%r10
145430d4c:     	testb	%dl, %dl
145430d4e:     	je	0x145430d1a <.text+0x542fd1a>
145430d50:     	jmp	0x145430920 <.text+0x542f920>
145430d55:     	xorl	%r13d, %r13d
145430d58:     	leaq	0x20(%rsi), %rax
145430d5c:     	leaq	0x28(%rsi), %rcx
145430d60:     	movq	(%rcx), %rcx
145430d63:     	leaq	-0x2(%rcx), %rdx
145430d67:     	cmpq	$0x6, %rdx
145430d6b:     	jbe	0x145430dbb <.text+0x542fdbb>
145430d6d:     	jmp	0x145430920 <.text+0x542f920>
145430d72:     	xorl	%ecx, %ecx
145430d74:     	xorl	%r13d, %r13d
145430d77:     	movq	0x28(%rsi), %r8
145430d7b:     	testq	%r8, %r8
145430d7e:     	jne	0x145430c64 <.text+0x542fc64>
145430d84:     	jmp	0x145430920 <.text+0x542f920>
145430d89:     	movl	$0x1, %edx
145430d8e:     	testb	%cl, %cl
145430d90:     	jne	0x145430920 <.text+0x542f920>
145430d96:     	shlq	$0x4, %rdx
145430d9a:     	leaq	(%rdx,%rbx), %rax
145430d9e:     	addq	$-0x10, %rax
145430da2:     	leaq	(%rdx,%rbx), %rcx
145430da6:     	addq	$-0x8, %rcx
145430daa:     	movq	(%rcx), %rcx
145430dad:     	leaq	-0x2(%rcx), %rdx
145430db1:     	cmpq	$0x6, %rdx
145430db5:     	ja	0x145430920 <.text+0x542f920>
145430dbb:     	movq	(%rax), %rax
145430dbe:     	leaq	0x130d0bb(%rip), %r8    # 0x14673de80
145430dc5:     	movslq	(%r8,%rdx,4), %rdx
145430dc9:     	addq	%r8, %rdx
145430dcc:     	jmpq	*%rdx
145430dce:     	movzwl	0x12fd3e4(%rip), %edx   # 0x14672e1b9
145430dd5:     	cmpw	(%rax), %dx
145430dd8:     	je	0x145430fb6 <.text+0x542ffb6>
145430dde:     	movzwl	0x12ff1f3(%rip), %edx   # 0x14672ffd8
145430de5:     	cmpw	(%rax), %dx
145430de8:     	je	0x145430fe0 <.text+0x542ffe0>
145430dee:     	movzwl	0x12ffc65(%rip), %edx   # 0x146730a5a
145430df5:     	cmpw	(%rax), %dx
145430df8:     	je	0x145430fee <.text+0x542ffee>
145430dfe:     	movzwl	0x13010ea(%rip), %edx   # 0x146731eef
145430e05:     	cmpw	(%rax), %dx
145430e08:     	jne	0x145430f74 <.text+0x542ff74>
145430e0e:     	movq	%rsi, 0x3a8(%rbp)
145430e15:     	movl	$0xb, %esi
145430e1a:     	jmp	0x145430ffa <.text+0x542fffa>
145430e1f:     	cmpq	$0x1, %r9
145430e23:     	jne	0x145430e39 <.text+0x542fe39>
145430e25:     	xorl	%ecx, %ecx
145430e27:     	movq	0x28(%rsi), %r8
145430e2b:     	testq	%r8, %r8
145430e2e:     	jne	0x145430c64 <.text+0x542fc64>
145430e34:     	jmp	0x145430920 <.text+0x542f920>
145430e39:     	movzbl	0x1(%rdx), %eax
145430e3d:     	addl	$-0x30, %eax
145430e40:     	cmpl	$0x9, %eax
145430e43:     	ja	0x145430c57 <.text+0x542fc57>
145430e49:     	movzbl	%r13b, %ecx
145430e4d:     	addl	%ecx, %ecx
145430e4f:     	leal	(%rcx,%rcx,4), %ecx
145430e52:     	addb	%cl, %al
145430e54:     	xorl	%ecx, %ecx
145430e56:     	movl	%eax, %r13d
145430e59:     	jmp	0x145430c57 <.text+0x542fc57>
145430e5e:     	movzwl	0x12fbee9(%rip), %edx   # 0x14672cd4e
145430e65:     	xorw	(%rax), %dx
145430e68:     	movzbl	0x12fbee0(%rip), %r8d   # 0x14672cd50
145430e70:     	xorb	0x2(%rax), %r8b
145430e74:     	movzbl	%r8b, %r8d
145430e78:     	orw	%dx, %r8w
145430e7c:     	je	0x145430fa8 <.text+0x542ffa8>
145430e82:     	movzwl	0x1300590(%rip), %edx   # 0x146731419
145430e89:     	xorw	(%rax), %dx
145430e8c:     	movzbl	0x1300587(%rip), %r8d   # 0x14673141b
145430e94:     	xorb	0x2(%rax), %r8b
145430e98:     	movzbl	%r8b, %r8d
145430e9c:     	orw	%dx, %r8w
145430ea0:     	jne	0x145430f74 <.text+0x542ff74>
145430ea6:     	movq	%rsi, 0x3a8(%rbp)
145430ead:     	movl	$0xa, %esi
145430eb2:     	jmp	0x145430ffa <.text+0x542fffa>
145430eb7:     	movl	0x12faba3(%rip), %edx   # 0x14672ba60
145430ebd:     	xorl	(%rax), %edx
145430ebf:     	movzwl	0x12fab9d(%rip), %r8d   # 0x14672ba64
145430ec7:     	xorw	0x4(%rax), %r8w
145430ecc:     	movzwl	%r8w, %r8d
145430ed0:     	orl	%edx, %r8d
145430ed3:     	je	0x145430fc4 <.text+0x542ffc4>
145430ed9:     	movl	0x12fc8f0(%rip), %edx   # 0x14672d7cf
145430edf:     	xorl	(%rax), %edx
145430ee1:     	movzwl	0x12fc8ea(%rip), %r8d   # 0x14672d7d3
145430ee9:     	xorw	0x4(%rax), %r8w
145430eee:     	movzwl	%r8w, %r8d
145430ef2:     	orl	%edx, %r8d
145430ef5:     	jne	0x145430f18 <.text+0x542ff18>
145430ef7:     	movq	%rsi, 0x3a8(%rbp)
145430efe:     	movl	$0x4, %esi
145430f03:     	jmp	0x145430ffa <.text+0x542fffa>
145430f08:     	movq	0x12fb4bc(%rip), %rdx   # 0x14672c3cb
145430f0f:     	cmpq	(%rax), %rdx
145430f12:     	je	0x145430fd2 <.text+0x542ffd2>
145430f18:     	cmpq	$0x4, %rcx
145430f1c:     	je	0x145430f7e <.text+0x542ff7e>
145430f1e:     	cmpq	$0x5, %rcx
145430f22:     	je	0x145430f57 <.text+0x542ff57>
145430f24:     	cmpq	$0x7, %rcx
145430f28:     	jne	0x145430920 <.text+0x542f920>
145430f2e:     	movl	0x12fdcc4(%rip), %edx   # 0x14672ebf8
145430f34:     	xorl	(%rax), %edx
145430f36:     	movl	0x12fdcbe(%rip), %r8d   # 0x14672ebfb
145430f3d:     	xorl	0x3(%rax), %r8d
145430f41:     	orl	%edx, %r8d
145430f44:     	jne	0x145430f74 <.text+0x542ff74>
145430f46:     	movq	%rsi, 0x3a8(%rbp)
145430f4d:     	movl	$0x6, %esi
145430f52:     	jmp	0x145430ffa <.text+0x542fffa>
145430f57:     	movl	0x12fe641(%rip), %edx   # 0x14672f59e
145430f5d:     	xorl	(%rax), %edx
145430f5f:     	movzbl	0x12fe63b(%rip), %r8d   # 0x14672f5a2
145430f67:     	xorb	0x4(%rax), %r8b
145430f6b:     	movzbl	%r8b, %r8d
145430f6f:     	orl	%edx, %r8d
145430f72:     	je	0x145430f9a <.text+0x542ff9a>
145430f74:     	cmpq	$0x4, %rcx
145430f78:     	jne	0x145430920 <.text+0x542f920>
145430f7e:     	movl	0x1301946(%rip), %ecx   # 0x1467328ca
145430f84:     	cmpl	(%rax), %ecx
145430f86:     	jne	0x145430920 <.text+0x542f920>
145430f8c:     	movq	%rsi, 0x3a8(%rbp)
145430f93:     	movl	$0xc, %esi
145430f98:     	jmp	0x145430ffa <.text+0x542fffa>
145430f9a:     	movq	%rsi, 0x3a8(%rbp)
145430fa1:     	movl	$0x7, %esi
145430fa6:     	jmp	0x145430ffa <.text+0x542fffa>
145430fa8:     	movq	%rsi, 0x3a8(%rbp)
145430faf:     	movl	$0x3, %esi
145430fb4:     	jmp	0x145430ffa <.text+0x542fffa>
145430fb6:     	movq	%rsi, 0x3a8(%rbp)
145430fbd:     	movl	$0x5, %esi
145430fc2:     	jmp	0x145430ffa <.text+0x542fffa>
145430fc4:     	movq	%rsi, 0x3a8(%rbp)
145430fcb:     	movl	$0x1, %esi
145430fd0:     	jmp	0x145430ffa <.text+0x542fffa>
145430fd2:     	movq	%rsi, 0x3a8(%rbp)
145430fd9:     	movl	$0x2, %esi
145430fde:     	jmp	0x145430ffa <.text+0x542fffa>
145430fe0:     	movq	%rsi, 0x3a8(%rbp)
145430fe7:     	movl	$0x8, %esi
145430fec:     	jmp	0x145430ffa <.text+0x542fffa>
145430fee:     	movq	%rsi, 0x3a8(%rbp)
145430ff5:     	movl	$0x9, %esi
145430ffa:     	movq	0x160(%rbp), %rax
145431001:     	movq	0x168(%rbp), %rdi
145431008:     	movq	%rdi, %rbx
14543100b:     	shlq	$0x4, %rbx
14543100f:     	xorl	%ecx, %ecx
145431011:     	nopw	%cs:(%rax,%rax)
145431020:     	cmpq	%rcx, %rbx
145431023:     	je	0x145431045 <.text+0x5430045>
145431025:     	leaq	0x10(%rcx), %rdx
145431029:     	cmpb	%r13b, (%rax,%rcx)
14543102d:     	movq	%rdx, %rcx
145431030:     	jne	0x145431020 <.text+0x5430020>
145431032:     	movq	-0x8(%rax,%rdx), %rcx
145431037:     	cmpq	%rcx, %rsi
14543103a:     	cmovaq	%rsi, %rcx
14543103e:     	movq	%rcx, -0x8(%rax,%rdx)
145431043:     	jmp	0x145431075 <.text+0x5430075>
145431045:     	cmpq	0x158(%rbp), %rdi
14543104c:     	jne	0x145431062 <.text+0x5430062>
14543104e:     	leaq	0x158(%rbp), %rcx
145431055:     	callq	0x145774860 <.text+0x5773860>
14543105a:     	nop
14543105b:     	movq	0x160(%rbp), %rax
145431062:     	movb	%r13b, (%rax,%rbx)
145431066:     	movq	%rsi, 0x8(%rax,%rbx)
14543106b:     	incq	%rdi
14543106e:     	movq	%rdi, 0x168(%rbp)
145431075:     	movq	0x1d8(%rbp), %rdx
14543107c:     	testq	%rdx, %rdx
14543107f:     	movl	$0x6f6c6e75, %edi       # imm = 0x6F6C6E75
145431084:     	leaq	0x130c6bd(%rip), %rbx   # 0x14673d748
14543108b:     	movq	0x3a8(%rbp), %rsi
145431092:     	jne	0x14543092c <.text+0x542f92c>
145431098:     	jmp	0x14543093e <.text+0x542f93e>
14543109d:     	movq	$0x0, 0x240(%rbp)
1454310a8:     	movq	0x378(%rbp), %rax
1454310af:     	movq	%rax, 0x248(%rbp)
1454310b6:     	movq	0x370(%rbp), %rcx
1454310bd:     	movq	%rcx, 0x250(%rbp)
1454310c4:     	movq	%rax, 0x258(%rbp)
1454310cb:     	movq	$0x0, 0x260(%rbp)
1454310d6:     	movq	%rax, 0x268(%rbp)
1454310dd:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1454310e7:     	movq	%rax, 0x270(%rbp)
1454310ee:     	movb	$0x1, 0x278(%rbp)
1454310f5:     	movw	$0x0, 0x280(%rbp)
1454310fe:     	movl	$0xffffffff, 0x2bc(%rbp) # imm = 0xFFFFFFFF
145431108:     	movl	$0xffffffff, 0x304(%rbp) # imm = 0xFFFFFFFF
145431112:     	leaq	0xc8(%rbp), %rcx
145431119:     	leaq	0x240(%rbp), %rdx
145431120:     	callq	0x14553eb30 <.text+0x553db30>
145431125:     	nop
145431126:     	movq	0xd8(%rbp), %r14
14543112d:     	cmpq	$0x2, %r14
145431131:     	jae	0x14543468e <.text+0x543368e>
145431137:     	movq	$0x0, 0x1b8(%rbp)
145431142:     	movq	$0x4, 0x1c0(%rbp)
14543114d:     	movq	$0x0, 0x1c8(%rbp)
145431158:     	movq	$0x0, 0x320(%rbp)
145431163:     	movq	0x378(%rbp), %rax
14543116a:     	movq	%rax, 0x328(%rbp)
145431171:     	movq	0x370(%rbp), %rcx
145431178:     	movq	%rcx, 0x330(%rbp)
14543117f:     	movq	%rax, 0x338(%rbp)
145431186:     	movq	$0x0, 0x340(%rbp)
145431191:     	movq	%rax, 0x348(%rbp)
145431198:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1454311a2:     	movq	%rax, 0x350(%rbp)
1454311a9:     	movb	$0x1, 0x358(%rbp)
1454311b0:     	movw	$0x0, 0x360(%rbp)
1454311b9:     	xorl	%eax, %eax
1454311bb:     	leaq	0x240(%rbp), %r14
1454311c2:     	leaq	0x1d8(%rbp), %r12
1454311c9:     	movl	$0x69757165, %r15d      # imm = 0x69757165
1454311cf:     	leaq	-0x18(%rbp), %rdi
1454311d3:     	xorps	%xmm6, %xmm6
1454311d6:     	testb	$0x1, %al
1454311d8:     	je	0x145431a0f <.text+0x5430a0f>
1454311de:     	movq	$0x0, 0x240(%rbp)
1454311e9:     	movq	0x378(%rbp), %rax
1454311f0:     	movq	%rax, 0x248(%rbp)
1454311f7:     	movq	0x370(%rbp), %rcx
1454311fe:     	movq	%rcx, 0x250(%rbp)
145431205:     	movq	%rax, 0x258(%rbp)
14543120c:     	movq	$0x0, 0x260(%rbp)
145431217:     	movq	%rax, 0x268(%rbp)
14543121e:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145431228:     	movq	%rax, 0x270(%rbp)
14543122f:     	movb	$0x1, 0x278(%rbp)
145431236:     	movw	$0x0, 0x280(%rbp)
14543123f:     	leaq	0x98(%rbp), %rcx
145431246:     	leaq	0x240(%rbp), %rdx
14543124d:     	callq	0x14553b3b0 <.text+0x553a3b0>
145431252:     	nop
145431253:     	movq	$0x0, 0x170(%rbp)
14543125e:     	movq	$0x8, 0x178(%rbp)
145431269:     	movq	$0x0, 0x180(%rbp)
145431274:     	movq	$0x0, 0x1d8(%rbp)
14543127f:     	movq	0x378(%rbp), %rax
145431286:     	movq	%rax, 0x1e0(%rbp)
14543128d:     	leaq	0x1e8(%rbp), %rbx
145431294:     	movq	0x370(%rbp), %rcx
14543129b:     	movq	%rcx, 0x1e8(%rbp)
1454312a2:     	movq	%rax, 0x1f0(%rbp)
1454312a9:     	movq	$0x0, 0x1f8(%rbp)
1454312b4:     	movq	%rax, 0x200(%rbp)
1454312bb:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1454312c5:     	movq	%rax, 0x208(%rbp)
1454312cc:     	movb	$0x1, 0x210(%rbp)
1454312d3:     	movw	$0x0, 0x218(%rbp)
1454312dc:     	leaq	0x348(%rbp), %r14
1454312e3:     	xorl	%eax, %eax
1454312e5:     	leaq	0x240(%rbp), %r15
1454312ec:     	leaq	0x220(%rbp), %r12
1454312f3:     	xorps	%xmm6, %xmm6
1454312f6:     	movb	$0xa, %r13b
1454312f9:     	jmp	0x145431329 <.text+0x5430329>
1454312fb:     	nopl	(%rax,%rax)
145431300:     	movq	0x220(%rbp), %rdx
145431307:     	testq	%rdx, %rdx
14543130a:     	je	0x145431322 <.text+0x5430322>
14543130c:     	shlq	$0x4, %rdx
145431310:     	movl	$0x8, %r8d
145431316:     	movq	0x3a8(%rbp), %rcx
14543131d:     	callq	0x1400021d0 <.text+0x11d0>
145431322:     	movzbl	0x219(%rbp), %eax
145431329:     	testb	$0x1, %al
14543132b:     	jne	0x14543203b <.text+0x543103b>
145431331:     	movq	0x1e8(%rbp), %rsi
145431338:     	movq	%r15, %rcx
14543133b:     	movq	%rbx, %rdx
14543133e:     	callq	0x14543cad0 <.text+0x543bad0>
145431343:     	nop
145431344:     	cmpl	$0x1, 0x240(%rbp)
14543134b:     	jne	0x145431370 <.text+0x5430370>
14543134d:     	movq	0x250(%rbp), %rdx
145431354:     	movq	0x1d8(%rbp), %rax
14543135b:     	movq	%rdx, 0x1d8(%rbp)
145431362:     	subq	%rax, %rdx
145431365:     	addq	%rax, %rsi
145431368:     	testq	%rdx, %rdx
14543136b:     	jne	0x1454313b2 <.text+0x54303b2>
14543136d:     	jmp	0x1454313e0 <.text+0x54303e0>
14543136f:     	nop
145431370:     	cmpb	$0x0, 0x219(%rbp)
145431377:     	jne	0x14543203b <.text+0x543103b>
14543137d:     	movb	$0x1, 0x219(%rbp)
145431384:     	movq	0x1d8(%rbp), %rsi
14543138b:     	movq	0x1e0(%rbp), %rdx
145431392:     	subq	%rsi, %rdx
145431395:     	setne	%al
145431398:     	orb	0x218(%rbp), %al
14543139e:     	cmpb	$0x1, %al
1454313a0:     	jne	0x14543203b <.text+0x543103b>
1454313a6:     	addq	0x1e8(%rbp), %rsi
1454313ad:     	testq	%rdx, %rdx
1454313b0:     	je	0x1454313e0 <.text+0x54303e0>
1454313b2:     	cmpb	$0xa, -0x1(%rsi,%rdx)
1454313b7:     	jne	0x1454313e0 <.text+0x54303e0>
1454313b9:     	movq	%rdx, %rax
1454313bc:     	decq	%rax
1454313bf:     	je	0x1454313ce <.text+0x54303ce>
1454313c1:     	cmpb	$0xd, -0x2(%rsi,%rdx)
1454313c6:     	jne	0x1454313d2 <.text+0x54303d2>
1454313c8:     	addq	$-0x2, %rdx
1454313cc:     	jmp	0x1454313e0 <.text+0x54303e0>
1454313ce:     	xorl	%edx, %edx
1454313d0:     	jmp	0x1454313e0 <.text+0x54303e0>
1454313d2:     	movq	%rax, %rdx
1454313d5:     	nopw	%cs:(%rax,%rax)
1454313e0:     	movq	%rsi, %rcx
1454313e3:     	callq	0x1400a4890 <.text+0xa3890>
1454313e8:     	nop
1454313e9:     	movq	$0x0, 0x240(%rbp)
1454313f4:     	movq	%rdx, 0x248(%rbp)
1454313fb:     	movq	%rax, 0x250(%rbp)
145431402:     	movq	%rdx, 0x258(%rbp)
145431409:     	movq	$0x0, 0x260(%rbp)
145431414:     	movq	%rdx, 0x268(%rbp)
14543141b:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
145431425:     	movq	%rax, 0x270(%rbp)
14543142c:     	movb	$0x1, 0x278(%rbp)
145431433:     	movw	$0x1, 0x280(%rbp)
14543143c:     	movq	%r12, %rcx
14543143f:     	movq	%r15, %rdx
145431442:     	callq	0x1455393f0 <.text+0x55383f0>
145431447:     	nop
145431448:     	movq	0x228(%rbp), %rax
14543144f:     	movq	%rax, 0x3a8(%rbp)
145431456:     	movq	0x230(%rbp), %rdi
14543145d:     	cmpq	$0x2, %rdi
145431461:     	jbe	0x145431300 <.text+0x5430300>
145431467:     	movq	0x3a8(%rbp), %rax
14543146e:     	cmpq	$0x4, 0x8(%rax)
145431473:     	jne	0x145431300 <.text+0x5430300>
145431479:     	movq	0x3a8(%rbp), %rax
145431480:     	movq	(%rax), %rax
145431483:     	cmpl	$0x63657073, (%rax)     # imm = 0x63657073
145431489:     	jne	0x145431300 <.text+0x5430300>
14543148f:     	movq	0x3a8(%rbp), %rax
145431496:     	movq	0x18(%rax), %r8
14543149a:     	testq	%r8, %r8
14543149d:     	je	0x1454314c5 <.text+0x54304c5>
14543149f:     	movq	0x10(%rax), %rdx
1454314a3:     	cmpq	$0x1, %r8
1454314a7:     	jne	0x1454314ce <.text+0x54304ce>
1454314a9:     	movzbl	(%rdx), %eax
1454314ac:     	movb	$0x1, %sil
1454314af:     	movb	$0x1, %cl
1454314b1:     	cmpl	$0x2b, %eax
1454314b4:     	je	0x14543155f <.text+0x543055f>
1454314ba:     	cmpl	$0x2d, %eax
1454314bd:     	je	0x14543155f <.text+0x543055f>
1454314c3:     	jmp	0x1454314d1 <.text+0x54304d1>
1454314c5:     	xorl	%esi, %esi
1454314c7:     	movb	$0x1, %cl
1454314c9:     	jmp	0x14543155f <.text+0x543055f>
1454314ce:     	movzbl	(%rdx), %eax
1454314d1:     	xorl	%ecx, %ecx
1454314d3:     	cmpb	$0x2b, %al
1454314d5:     	sete	%cl
1454314d8:     	movq	%r8, %r9
1454314db:     	subq	%rcx, %r9
1454314de:     	addq	%rcx, %rdx
1454314e1:     	cmpq	$0x3, %r9
1454314e5:     	jae	0x14543150c <.text+0x543050c>
1454314e7:     	testq	%r9, %r9
1454314ea:     	je	0x14543155b <.text+0x543055b>
1454314ec:     	movzbl	(%rdx), %eax
1454314ef:     	addl	$-0x30, %eax
1454314f2:     	movb	$0x1, %sil
1454314f5:     	movb	$0x1, %cl
1454314f7:     	cmpl	$0x9, %eax
1454314fa:     	ja	0x14543155f <.text+0x543055f>
1454314fc:     	cmpq	$0x1, %r9
145431500:     	jne	0x1454316fd <.text+0x54306fd>
145431506:     	xorl	%ecx, %ecx
145431508:     	movl	%eax, %esi
14543150a:     	jmp	0x14543155f <.text+0x543055f>
14543150c:     	negq	%rcx
14543150f:     	addq	%rcx, %r8
145431512:     	negq	%r8
145431515:     	xorl	%r9d, %r9d
145431518:     	xorl	%esi, %esi
14543151a:     	nopw	(%rax,%rax)
145431520:     	movq	%r8, %rax
145431523:     	addq	%r9, %rax
145431526:     	setne	%cl
145431529:     	je	0x14543155f <.text+0x543055f>
14543152b:     	movl	%esi, %eax
14543152d:     	mulb	%r13b
145431530:     	movzbl	(%rdx,%r9), %r10d
145431535:     	jo	0x1454319e7 <.text+0x54309e7>
14543153b:     	movl	%eax, %esi
14543153d:     	movzbl	%r10b, %eax
145431541:     	addl	$-0x30, %eax
145431544:     	cmpl	$0xa, %eax
145431547:     	jae	0x145431556 <.text+0x5430556>
145431549:     	incq	%r9
14543154c:     	addb	%al, %sil
14543154f:     	jae	0x145431520 <.text+0x5430520>
145431551:     	movb	$0x2, %sil
145431554:     	jmp	0x14543155f <.text+0x543055f>
145431556:     	movb	$0x1, %sil
145431559:     	jmp	0x14543155f <.text+0x543055f>
14543155b:     	xorl	%esi, %esi
14543155d:     	xorl	%ecx, %ecx
14543155f:     	movq	0x3a8(%rbp), %rax
145431566:     	movq	0x28(%rax), %r8
14543156a:     	testq	%r8, %r8
14543156d:     	je	0x145431300 <.text+0x5430300>
145431573:     	movq	0x3a8(%rbp), %rax
14543157a:     	movq	0x20(%rax), %rdx
14543157e:     	cmpq	$0x1, %r8
145431582:     	jne	0x14543159b <.text+0x543059b>
145431584:     	movzbl	(%rdx), %eax
145431587:     	cmpl	$0x2b, %eax
14543158a:     	je	0x145431300 <.text+0x5430300>
145431590:     	cmpl	$0x2d, %eax
145431593:     	je	0x145431300 <.text+0x5430300>
145431599:     	jmp	0x14543159e <.text+0x543059e>
14543159b:     	movzbl	(%rdx), %eax
14543159e:     	xorl	%r9d, %r9d
1454315a1:     	cmpb	$0x2b, %al
1454315a3:     	sete	%r9b
1454315a7:     	movq	%r8, %rax
1454315aa:     	subq	%r9, %rax
1454315ad:     	addq	%r9, %rdx
1454315b0:     	cmpq	$0x3, %rax
1454315b4:     	jae	0x145431610 <.text+0x5430610>
1454315b6:     	testq	%rax, %rax
1454315b9:     	je	0x14543165b <.text+0x543065b>
1454315bf:     	movzbl	(%rdx), %r11d
1454315c3:     	addl	$-0x30, %r11d
1454315c7:     	cmpl	$0x9, %r11d
1454315cb:     	ja	0x145431300 <.text+0x5430300>
1454315d1:     	cmpq	$0x1, %rax
1454315d5:     	je	0x1454315f5 <.text+0x54305f5>
1454315d7:     	movzbl	0x1(%rdx), %eax
1454315db:     	addl	$-0x30, %eax
1454315de:     	cmpl	$0x9, %eax
1454315e1:     	ja	0x145431300 <.text+0x5430300>
1454315e7:     	movzbl	%r11b, %edx
1454315eb:     	addl	%edx, %edx
1454315ed:     	leal	(%rdx,%rdx,4), %edx
1454315f0:     	addb	%dl, %al
1454315f2:     	movl	%eax, %r11d
1454315f5:     	testb	%cl, %cl
1454315f7:     	jne	0x145431300 <.text+0x5430300>
1454315fd:     	movb	%sil, 0xb0(%rbp)
145431604:     	cmpb	$0x2, %r11b
145431608:     	ja	0x145431300 <.text+0x5430300>
14543160e:     	jmp	0x14543166d <.text+0x543066d>
145431610:     	negq	%r9
145431613:     	addq	%r9, %r8
145431616:     	negq	%r8
145431619:     	xorl	%r9d, %r9d
14543161c:     	xorl	%r11d, %r11d
14543161f:     	movq	%r8, %rax
145431622:     	addq	%r9, %rax
145431625:     	je	0x1454315f5 <.text+0x54305f5>
145431627:     	movl	%r11d, %eax
14543162a:     	mulb	%r13b
14543162d:     	jo	0x145431300 <.text+0x5430300>
145431633:     	movl	%eax, %r11d
145431636:     	movzbl	(%rdx,%r9), %r10d
14543163b:     	addl	$-0x30, %r10d
14543163f:     	addb	%r10b, %r11b
145431642:     	setb	%al
145431645:     	cmpl	$0x9, %r10d
145431649:     	ja	0x145431300 <.text+0x5430300>
14543164f:     	incq	%r9
145431652:     	testb	%al, %al
145431654:     	je	0x14543161f <.text+0x543061f>
145431656:     	jmp	0x145431300 <.text+0x5430300>
14543165b:     	testb	%cl, %cl
14543165d:     	jne	0x145431300 <.text+0x5430300>
145431663:     	movb	%sil, 0xb0(%rbp)
14543166a:     	xorl	%r11d, %r11d
14543166d:     	movq	0xa0(%rbp), %rax
145431674:     	movq	0xa8(%rbp), %rcx
14543167b:     	shlq	$0x5, %rcx
14543167f:     	xorl	%edx, %edx
145431681:     	nopw	%cs:(%rax,%rax)
145431690:     	cmpq	%rdx, %rcx
145431693:     	je	0x145431725 <.text+0x5430725>
145431699:     	leaq	0x20(%rdx), %r8
14543169d:     	cmpb	%sil, 0x4(%rax,%rdx)
1454316a2:     	movq	%r8, %rdx
1454316a5:     	jne	0x145431690 <.text+0x5430690>
1454316a7:     	movl	-0x20(%rax,%r8), %eax
1454316ac:     	movl	$0x0, 0x398(%rbp)
1454316b6:     	movl	$0x6e, %ecx
1454316bb:     	nopl	(%rax,%rax)
1454316c0:     	leal	-0x1e(%rcx), %edx
1454316c3:     	subl	%edx, %eax
1454316c5:     	jb	0x14543172f <.text+0x543072f>
1454316c7:     	leal	-0xf(%rcx), %edx
1454316ca:     	subl	%edx, %eax
1454316cc:     	jb	0x1454319d0 <.text+0x54309d0>
1454316d2:     	subl	%ecx, %eax
1454316d4:     	jb	0x1454319db <.text+0x54309db>
1454316da:     	movl	0x398(%rbp), %edx
1454316e0:     	addl	$0x3, %edx
1454316e3:     	addl	$0x2d, %ecx
1454316e6:     	movl	%edx, 0x398(%rbp)
1454316ec:     	cmpl	$0x33, %edx
1454316ef:     	jne	0x1454316c0 <.text+0x54306c0>
1454316f1:     	movl	$0x33, 0x398(%rbp)
1454316fb:     	jmp	0x14543172f <.text+0x543072f>
1454316fd:     	movzbl	0x1(%rdx), %edx
145431701:     	addl	$-0x30, %edx
145431704:     	movb	$0x1, %sil
145431707:     	movb	$0x1, %cl
145431709:     	cmpl	$0x9, %edx
14543170c:     	ja	0x14543155f <.text+0x543055f>
145431712:     	movzbl	%al, %eax
145431715:     	addl	%eax, %eax
145431717:     	leal	(%rax,%rax,4), %eax
14543171a:     	addb	%al, %dl
14543171c:     	xorl	%ecx, %ecx
14543171e:     	movl	%edx, %esi
145431720:     	jmp	0x14543155f <.text+0x543055f>
145431725:     	movl	$0x0, 0x398(%rbp)
14543172f:     	movq	$0x0, 0x320(%rbp)
14543173a:     	movq	$0x8, 0x328(%rbp)
145431745:     	leaq	0x330(%rbp), %rax
14543174c:     	movups	%xmm6, (%rax)
14543174f:     	movq	$0x8, 0x340(%rbp)
14543175a:     	movups	%xmm6, (%r14)
14543175e:     	movq	$0x8, 0x358(%rbp)
145431769:     	movq	$0x0, 0x360(%rbp)
145431774:     	movq	0x3a8(%rbp), %rax
14543177b:     	leaq	0x30(%rax), %rbx
14543177f:     	shlq	$0x4, %rdi
145431783:     	addq	%rax, %rdi
145431786:     	movl	$0x3, %r14d
14543178c:     	xorl	%r12d, %r12d
14543178f:     	movl	%r11d, 0x388(%rbp)
145431796:     	jmp	0x1454317be <.text+0x54307be>
145431798:     	nopl	(%rax,%rax)
1454317a0:     	addq	$0x10, %rbx
1454317a4:     	incq	%r12
1454317a7:     	movq	0x250(%rbp), %rax
1454317ae:     	movq	%rax, 0x10(%r13)
1454317b2:     	movups	0x240(%rbp), %xmm0
1454317b9:     	movups	%xmm0, (%r13)
1454317be:     	subq	$0x1, %r14
1454317c2:     	jb	0x1454318c0 <.text+0x54308c0>
1454317c8:     	cmpq	%rdi, %rbx
1454317cb:     	je	0x1454318c0 <.text+0x54308c0>
1454317d1:     	movq	(%rbx), %rax
1454317d4:     	movq	0x8(%rbx), %rcx
1454317d8:     	movb	%sil, 0x120(%rbp)
1454317df:     	leaq	0x120(%rbp), %rdx
1454317e6:     	movq	%rdx, 0x240(%rbp)
1454317ed:     	movq	$0x0, 0x248(%rbp)
1454317f8:     	movq	%rcx, 0x250(%rbp)
1454317ff:     	movq	%rax, 0x258(%rbp)
145431806:     	movq	%rcx, 0x260(%rbp)
14543180d:     	movq	$0x0, 0x268(%rbp)
145431818:     	movq	%rcx, 0x270(%rbp)
14543181f:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
145431829:     	movq	%rax, 0x278(%rbp)
145431830:     	movb	$0x1, 0x280(%rbp)
145431837:     	movw	$0x1, 0x288(%rbp)
145431840:     	movb	$0x1, 0x3a6(%rbp)
145431847:     	leaq	0xe0(%rbp), %r13
14543184e:     	movq	%r13, %rcx
145431851:     	leaq	0x240(%rbp), %r15
145431858:     	movq	%r15, %rdx
14543185b:     	callq	0x145539f60 <.text+0x5538f60>
145431860:     	nop
145431861:     	movb	$0x1, 0x3a6(%rbp)
145431868:     	movq	%r15, %rcx
14543186b:     	movq	%r13, %rdx
14543186e:     	movl	%esi, %r8d
145431871:     	movl	0x398(%rbp), %r9d
145431878:     	callq	0x145483fc0 <.text+0x5482fc0>
14543187d:     	nop
14543187e:     	cmpq	$0x2, %r12
145431882:     	ja	0x145434ad1 <.text+0x5433ad1>
145431888:     	leaq	(%r12,%r12,2), %rax
14543188c:     	leaq	0x320(,%rax,8), %r13
145431894:     	addq	%rbp, %r13
145431897:     	movq	0x320(%rbp,%rax,8), %rdx
14543189f:     	testq	%rdx, %rdx
1454318a2:     	je	0x1454317a0 <.text+0x54307a0>
1454318a8:     	movq	0x8(%r13), %rcx
1454318ac:     	shlq	$0x4, %rdx
1454318b0:     	movl	$0x8, %r8d
1454318b6:     	callq	0x1400021d0 <.text+0x11d0>
1454318bb:     	jmp	0x1454317a0 <.text+0x54307a0>
1454318c0:     	movb	$0x1, 0x3a6(%rbp)
1454318c7:     	leaq	0x170(%rbp), %rcx
1454318ce:     	leaq	0xb0(%rbp), %rdx
1454318d5:     	callq	0x145532510 <.text+0x5531510>
1454318da:     	nop
1454318db:     	movq	0x360(%rbp), %rax
1454318e2:     	leaq	0x248(%rbp), %rcx
1454318e9:     	movq	%rax, 0x40(%rcx)
1454318ed:     	movups	0x320(%rbp), %xmm0
1454318f4:     	movups	0x330(%rbp), %xmm1
1454318fb:     	movups	0x340(%rbp), %xmm2
145431902:     	movups	0x350(%rbp), %xmm3
145431909:     	movups	%xmm3, 0x30(%rcx)
14543190d:     	movups	%xmm2, 0x20(%rcx)
145431911:     	movups	%xmm1, 0x10(%rcx)
145431915:     	movups	%xmm0, (%rcx)
145431918:     	movb	%sil, 0x240(%rbp)
14543191f:     	movl	0x388(%rbp), %eax
145431925:     	movb	%al, 0x241(%rbp)
14543192b:     	movq	0x180(%rbp), %rsi
145431932:     	cmpq	0x170(%rbp), %rsi
145431939:     	jne	0x145431948 <.text+0x5430948>
14543193b:     	leaq	0x170(%rbp), %rcx
145431942:     	callq	0x145780650 <.text+0x577f650>
145431947:     	nop
145431948:     	movq	0x178(%rbp), %rax
14543194f:     	leaq	(%rsi,%rsi,4), %rcx
145431953:     	shlq	$0x4, %rcx
145431957:     	movups	0x280(%rbp), %xmm0
14543195e:     	movups	%xmm0, 0x40(%rax,%rcx)
145431963:     	movups	0x240(%rbp), %xmm0
14543196a:     	movups	0x250(%rbp), %xmm1
145431971:     	movups	0x260(%rbp), %xmm2
145431978:     	movups	0x270(%rbp), %xmm3
14543197f:     	movups	%xmm3, 0x30(%rax,%rcx)
145431984:     	movups	%xmm2, 0x20(%rax,%rcx)
145431989:     	movups	%xmm1, 0x10(%rax,%rcx)
14543198e:     	movups	%xmm0, (%rax,%rcx)
145431992:     	incq	%rsi
145431995:     	movq	%rsi, 0x180(%rbp)
14543199c:     	movq	0x220(%rbp), %rdx
1454319a3:     	testq	%rdx, %rdx
1454319a6:     	leaq	0x1e8(%rbp), %rbx
1454319ad:     	leaq	0x348(%rbp), %r14
1454319b4:     	leaq	0x240(%rbp), %r15
1454319bb:     	leaq	0x220(%rbp), %r12
1454319c2:     	movb	$0xa, %r13b
1454319c5:     	jne	0x14543130c <.text+0x543030c>
1454319cb:     	jmp	0x145431322 <.text+0x5430322>
1454319d0:     	incl	0x398(%rbp)
1454319d6:     	jmp	0x14543172f <.text+0x543072f>
1454319db:     	addl	$0x2, 0x398(%rbp)
1454319e2:     	jmp	0x14543172f <.text+0x543072f>
1454319e7:     	addb	$-0x30, %r10b
1454319eb:     	cmpb	$0xa, %r10b
1454319ef:     	movl	$0x0, %esi
1454319f4:     	adcb	$0x1, %sil
1454319f8:     	movb	$0x1, %cl
1454319fa:     	jmp	0x14543155f <.text+0x543055f>
1454319ff:     	nop
145431a00:     	movzbl	0x361(%rbp), %eax
145431a07:     	testb	$0x1, %al
145431a09:     	jne	0x1454311de <.text+0x54301de>
145431a0f:     	movq	0x330(%rbp), %rsi
145431a16:     	movq	%r14, %rcx
145431a19:     	leaq	0x330(%rbp), %rdx
145431a20:     	callq	0x14543cad0 <.text+0x543bad0>
145431a25:     	nop
145431a26:     	cmpl	$0x1, 0x240(%rbp)
145431a2d:     	jne	0x145431a60 <.text+0x5430a60>
145431a2f:     	movq	0x250(%rbp), %rdx
145431a36:     	movq	0x320(%rbp), %rax
145431a3d:     	movq	%rdx, 0x320(%rbp)
145431a44:     	subq	%rax, %rdx
145431a47:     	addq	%rax, %rsi
145431a4a:     	testq	%rdx, %rdx
145431a4d:     	jne	0x145431aa2 <.text+0x5430aa2>
145431a4f:     	jmp	0x145431ad0 <.text+0x5430ad0>
145431a51:     	nopw	%cs:(%rax,%rax)
145431a60:     	cmpb	$0x0, 0x361(%rbp)
145431a67:     	jne	0x1454311de <.text+0x54301de>
145431a6d:     	movb	$0x1, 0x361(%rbp)
145431a74:     	movq	0x320(%rbp), %rsi
145431a7b:     	movq	0x328(%rbp), %rdx
145431a82:     	subq	%rsi, %rdx
145431a85:     	setne	%al
145431a88:     	orb	0x360(%rbp), %al
145431a8e:     	cmpb	$0x1, %al
145431a90:     	jne	0x1454311de <.text+0x54301de>
145431a96:     	addq	0x330(%rbp), %rsi
145431a9d:     	testq	%rdx, %rdx
145431aa0:     	je	0x145431ad0 <.text+0x5430ad0>
145431aa2:     	cmpb	$0xa, -0x1(%rsi,%rdx)
145431aa7:     	jne	0x145431ad0 <.text+0x5430ad0>
145431aa9:     	movq	%rdx, %rax
145431aac:     	decq	%rax
145431aaf:     	je	0x145431abe <.text+0x5430abe>
145431ab1:     	cmpb	$0xd, -0x2(%rsi,%rdx)
145431ab6:     	jne	0x145431ac2 <.text+0x5430ac2>
145431ab8:     	addq	$-0x2, %rdx
145431abc:     	jmp	0x145431ad0 <.text+0x5430ad0>
145431abe:     	xorl	%edx, %edx
145431ac0:     	jmp	0x145431ad0 <.text+0x5430ad0>
145431ac2:     	movq	%rax, %rdx
145431ac5:     	nopw	%cs:(%rax,%rax)
145431ad0:     	movq	%rsi, %rcx
145431ad3:     	callq	0x1400a4890 <.text+0xa3890>
145431ad8:     	nop
145431ad9:     	movq	$0x0, 0x240(%rbp)
145431ae4:     	movq	%rdx, 0x248(%rbp)
145431aeb:     	movq	%rax, 0x250(%rbp)
145431af2:     	movq	%rdx, 0x258(%rbp)
145431af9:     	movq	$0x0, 0x260(%rbp)
145431b04:     	movq	%rdx, 0x268(%rbp)
145431b0b:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
145431b15:     	movq	%rax, 0x270(%rbp)
145431b1c:     	movb	$0x1, 0x278(%rbp)
145431b23:     	movw	$0x1, 0x280(%rbp)
145431b2c:     	movq	%r12, %rcx
145431b2f:     	movq	%r14, %rdx
145431b32:     	callq	0x1455393f0 <.text+0x55383f0>
145431b37:     	nop
145431b38:     	movq	0x1e0(%rbp), %r11
145431b3f:     	cmpq	$0x3, 0x1e8(%rbp)
145431b47:     	jne	0x145431c40 <.text+0x5430c40>
145431b4d:     	movq	0x8(%r11), %r13
145431b51:     	cmpq	$0x5, %r13
145431b55:     	jne	0x145431b70 <.text+0x5430b70>
145431b57:     	movq	(%r11), %rbx
145431b5a:     	movl	(%rbx), %eax
145431b5c:     	xorl	%r15d, %eax
145431b5f:     	movzbl	0x4(%rbx), %ecx
145431b63:     	xorl	$0x70, %ecx
145431b66:     	orl	%eax, %ecx
145431b68:     	jne	0x145431c40 <.text+0x5430c40>
145431b6e:     	jmp	0x145431b89 <.text+0x5430b89>
145431b70:     	cmpq	$0x4, %r13
145431b74:     	jne	0x145431c40 <.text+0x5430c40>
145431b7a:     	movq	(%r11), %rbx
145431b7d:     	cmpl	$0x6b6f6f6c, (%rbx)     # imm = 0x6B6F6F6C
145431b83:     	jne	0x145431c40 <.text+0x5430c40>
145431b89:     	movq	0x18(%r11), %rdx
145431b8d:     	testq	%rdx, %rdx
145431b90:     	je	0x145431c40 <.text+0x5430c40>
145431b96:     	movq	0x10(%r11), %rcx
145431b9a:     	cmpq	$0x1, %rdx
145431b9e:     	jne	0x145431bba <.text+0x5430bba>
145431ba0:     	movzbl	(%rcx), %r8d
145431ba4:     	cmpl	$0x2b, %r8d
145431ba8:     	je	0x145431c40 <.text+0x5430c40>
145431bae:     	cmpl	$0x2d, %r8d
145431bb2:     	je	0x145431c40 <.text+0x5430c40>
145431bb8:     	jmp	0x145431bbe <.text+0x5430bbe>
145431bba:     	movzbl	(%rcx), %r8d
145431bbe:     	xorl	%eax, %eax
145431bc0:     	cmpb	$0x2b, %r8b
145431bc4:     	sete	%al
145431bc7:     	movq	%rdx, %r8
145431bca:     	subq	%rax, %r8
145431bcd:     	addq	%rax, %rcx
145431bd0:     	cmpq	$0x3, %r8
145431bd4:     	jae	0x145431bff <.text+0x5430bff>
145431bd6:     	testq	%r8, %r8
145431bd9:     	je	0x145431c76 <.text+0x5430c76>
145431bdf:     	movzbl	(%rcx), %eax
145431be2:     	addl	$-0x30, %eax
145431be5:     	cmpl	$0x9, %eax
145431be8:     	ja	0x145431c40 <.text+0x5430c40>
145431bea:     	cmpq	$0x1, %r8
145431bee:     	jne	0x145432016 <.text+0x5431016>
145431bf4:     	movl	%eax, 0x398(%rbp)
145431bfa:     	jmp	0x145431c80 <.text+0x5430c80>
145431bff:     	negq	%rax
145431c02:     	addq	%rax, %rdx
145431c05:     	negq	%rdx
145431c08:     	xorl	%r8d, %r8d
145431c0b:     	xorl	%eax, %eax
145431c0d:     	movq	%rdx, %r9
145431c10:     	addq	%r8, %r9
145431c13:     	je	0x145431bf4 <.text+0x5430bf4>
145431c15:     	movb	$0xa, %r9b
145431c18:     	mulb	%r9b
145431c1b:     	jo	0x145431c40 <.text+0x5430c40>
145431c1d:     	movzbl	(%rcx,%r8), %r10d
145431c22:     	addl	$-0x30, %r10d
145431c26:     	addb	%r10b, %al
145431c29:     	setb	%r9b
145431c2d:     	cmpl	$0x9, %r10d
145431c31:     	ja	0x145431c40 <.text+0x5430c40>
145431c33:     	incq	%r8
145431c36:     	testb	%r9b, %r9b
145431c39:     	je	0x145431c0d <.text+0x5430c0d>
145431c3b:     	nopl	(%rax,%rax)
145431c40:     	movq	0x1d8(%rbp), %rdx
145431c47:     	testq	%rdx, %rdx
145431c4a:     	je	0x145431a00 <.text+0x5430a00>
145431c50:     	shlq	$0x4, %rdx
145431c54:     	movl	$0x8, %r8d
145431c5a:     	movq	%r11, %rcx
145431c5d:     	callq	0x1400021d0 <.text+0x11d0>
145431c62:     	movzbl	0x361(%rbp), %eax
145431c69:     	testb	$0x1, %al
145431c6b:     	je	0x145431a0f <.text+0x5430a0f>
145431c71:     	jmp	0x1454311de <.text+0x54301de>
145431c76:     	movl	$0x0, 0x398(%rbp)
145431c80:     	movq	0x20(%r11), %rax
145431c84:     	movq	%r11, 0x380(%rbp)
145431c8b:     	movq	0x28(%r11), %rcx
145431c8f:     	movq	$0x0, 0x240(%rbp)
145431c9a:     	movq	%rcx, 0x248(%rbp)
145431ca1:     	movq	%rax, 0x250(%rbp)
145431ca8:     	movq	%rcx, 0x258(%rbp)
145431caf:     	movq	$0x0, 0x260(%rbp)
145431cba:     	movq	%rcx, 0x268(%rbp)
145431cc1:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
145431ccb:     	movq	%rax, 0x270(%rbp)
145431cd2:     	movb	$0x1, 0x278(%rbp)
145431cd9:     	movw	$0x1, 0x280(%rbp)
145431ce2:     	movq	%rdi, %rcx
145431ce5:     	movq	%r14, %rdx
145431ce8:     	callq	0x14553bf60 <.text+0x553af60>
145431ced:     	nop
145431cee:     	movq	-0x18(%rbp), %rax
145431cf2:     	movq	%rax, 0x388(%rbp)
145431cf9:     	movq	-0x10(%rbp), %rax
145431cfd:     	movq	%rax, 0x3a8(%rbp)
145431d04:     	movq	-0x8(%rbp), %rdi
145431d08:     	movq	0x1c0(%rbp), %rax
145431d0f:     	movq	0x1c8(%rbp), %rsi
145431d16:     	imulq	$0xe8, %rsi, %r15
145431d1d:     	testq	%rsi, %rsi
145431d20:     	movl	0x398(%rbp), %ecx
145431d26:     	je	0x145431d4d <.text+0x5430d4d>
145431d28:     	xorl	%r8d, %r8d
145431d2b:     	xorl	%edx, %edx
145431d2d:     	nopl	(%rax)
145431d30:     	cmpb	%cl, 0xe4(%rax,%r8)
145431d38:     	je	0x145431eb7 <.text+0x5430eb7>
145431d3e:     	incq	%rdx
145431d41:     	addq	$0xe8, %r8
145431d48:     	cmpq	%r8, %r15
145431d4b:     	jne	0x145431d30 <.text+0x5430d30>
145431d4d:     	leaq	0x244(%rbp), %rdx
145431d54:     	movups	%xmm6, 0x3c(%rdx)
145431d58:     	movups	%xmm6, 0x30(%rdx)
145431d5c:     	movups	%xmm6, 0x20(%rdx)
145431d60:     	movups	%xmm6, 0x10(%rdx)
145431d64:     	movups	%xmm6, (%rdx)
145431d67:     	cmpq	0x1b8(%rbp), %rsi
145431d6e:     	jne	0x145431d91 <.text+0x5430d91>
145431d70:     	movb	$0x1, 0x397(%rbp)
145431d77:     	leaq	0x1b8(%rbp), %rcx
145431d7e:     	callq	0x1458e9b70 <.text+0x58e8b70>
145431d83:     	nop
145431d84:     	movq	0x1c0(%rbp), %rax
145431d8b:     	movl	0x398(%rbp), %ecx
145431d91:     	movl	$0x0, (%rax,%r15)
145431d99:     	movl	$0x0, 0x8(%rax,%r15)
145431da2:     	movl	$0x0, 0x10(%rax,%r15)
145431dab:     	movl	$0x0, 0x18(%rax,%r15)
145431db4:     	movl	$0x0, 0x20(%rax,%r15)
145431dbd:     	movl	$0x0, 0x28(%rax,%r15)
145431dc6:     	movl	$0x0, 0x30(%rax,%r15)
145431dcf:     	movl	$0x0, 0x38(%rax,%r15)
145431dd8:     	movl	$0x0, 0x40(%rax,%r15)
145431de1:     	movl	$0x0, 0x48(%rax,%r15)
145431dea:     	movl	$0x0, 0x50(%rax,%r15)
145431df3:     	movl	$0x0, 0x58(%rax,%r15)
145431dfc:     	movl	$0x0, 0x60(%rax,%r15)
145431e05:     	movl	$0x0, 0x68(%rax,%r15)
145431e0e:     	movl	$0x0, 0x70(%rax,%r15)
145431e17:     	movl	$0x0, 0x78(%rax,%r15)
145431e20:     	movl	$0x0, 0x80(%rax,%r15)
145431e2c:     	movl	$0x0, 0x88(%rax,%r15)
145431e38:     	movl	$0x0, 0x90(%rax,%r15)
145431e44:     	movups	0x280(%rbp), %xmm0
145431e4b:     	movups	%xmm0, 0xd4(%rax,%r15)
145431e54:     	movups	0x240(%rbp), %xmm0
145431e5b:     	movups	0x250(%rbp), %xmm1
145431e62:     	movups	0x260(%rbp), %xmm2
145431e69:     	movups	0x270(%rbp), %xmm3
145431e70:     	movups	%xmm3, 0xc4(%rax,%r15)
145431e79:     	movups	%xmm2, 0xb4(%rax,%r15)
145431e82:     	movups	%xmm1, 0xa4(%rax,%r15)
145431e8b:     	movups	%xmm0, 0x94(%rax,%r15)
145431e94:     	movb	%cl, 0xe4(%rax,%r15)
145431e9c:     	leaq	0x1(%rsi), %rax
145431ea0:     	movq	%rax, 0x1c8(%rbp)
145431ea7:     	testq	%rdi, %rdi
145431eaa:     	movl	$0x69757165, %r15d      # imm = 0x69757165
145431eb0:     	jne	0x145431ec9 <.text+0x5430ec9>
145431eb2:     	jmp	0x145431fd4 <.text+0x5430fd4>
145431eb7:     	movq	%rdx, %rsi
145431eba:     	testq	%rdi, %rdi
145431ebd:     	movl	$0x69757165, %r15d      # imm = 0x69757165
145431ec3:     	je	0x145431fd4 <.text+0x5430fd4>
145431ec9:     	shlq	$0x4, %rdi
145431ecd:     	movq	0x3a8(%rbp), %rax
145431ed4:     	addq	%rax, %rdi
145431ed7:     	cmpq	$0x5, %r13
145431edb:     	jne	0x145431f90 <.text+0x5430f90>
145431ee1:     	movq	0x3a8(%rbp), %rax
145431ee8:     	nopl	(%rax,%rax)
145431ef0:     	movq	(%rax), %rcx
145431ef3:     	movl	0x8(%rax), %r8d
145431ef7:     	movl	(%rbx), %edx
145431ef9:     	xorl	%r15d, %edx
145431efc:     	movzbl	0x4(%rbx), %r9d
145431f01:     	xorl	$0x70, %r9d
145431f05:     	orl	%edx, %r9d
145431f08:     	movq	0x1c8(%rbp), %rdx
145431f0f:     	je	0x145431f50 <.text+0x5430f50>
145431f11:     	cmpq	%rdx, %rsi
145431f14:     	jae	0x145434a72 <.text+0x5433a72>
145431f1a:     	cmpq	$0x12, %rcx
145431f1e:     	ja	0x145434a87 <.text+0x5433a87>
145431f24:     	imulq	$0xe8, %rsi, %rdx
145431f2b:     	addq	0x1c0(%rbp), %rdx
145431f32:     	movl	$0x1, (%rdx,%rcx,8)
145431f39:     	movl	%r8d, 0x4(%rdx,%rcx,8)
145431f3e:     	addq	$0x10, %rax
145431f42:     	cmpq	%rdi, %rax
145431f45:     	jne	0x145431ef0 <.text+0x5430ef0>
145431f47:     	jmp	0x145431fd4 <.text+0x5430fd4>
145431f4c:     	nopl	(%rax)
145431f50:     	cmpq	%rdx, %rsi
145431f53:     	jae	0x145434aeb <.text+0x5433aeb>
145431f59:     	cmpq	$0x12, %rcx
145431f5d:     	ja	0x145434b00 <.text+0x5433b00>
145431f63:     	imulq	$0xe8, %rsi, %rdx
145431f6a:     	addq	0x1c0(%rbp), %rdx
145431f71:     	movl	%r8d, 0x98(%rdx,%rcx,4)
145431f79:     	addq	$0x10, %rax
145431f7d:     	cmpq	%rdi, %rax
145431f80:     	jne	0x145431ef0 <.text+0x5430ef0>
145431f86:     	jmp	0x145431fd4 <.text+0x5430fd4>
145431f88:     	nopl	(%rax,%rax)
145431f90:     	movq	0x1c8(%rbp), %rdx
145431f97:     	cmpq	%rdx, %rsi
145431f9a:     	jae	0x145434a72 <.text+0x5433a72>
145431fa0:     	movq	(%rax), %rcx
145431fa3:     	cmpq	$0x13, %rcx
145431fa7:     	jae	0x145434a87 <.text+0x5433a87>
145431fad:     	movl	0x8(%rax), %edx
145431fb0:     	imulq	$0xe8, %rsi, %r8
145431fb7:     	addq	0x1c0(%rbp), %r8
145431fbe:     	movl	$0x1, (%r8,%rcx,8)
145431fc6:     	movl	%edx, 0x4(%r8,%rcx,8)
145431fcb:     	addq	$0x10, %rax
145431fcf:     	cmpq	%rdi, %rax
145431fd2:     	jne	0x145431f90 <.text+0x5430f90>
145431fd4:     	movq	0x388(%rbp), %rdx
145431fdb:     	testq	%rdx, %rdx
145431fde:     	je	0x145431ff6 <.text+0x5430ff6>
145431fe0:     	shlq	$0x4, %rdx
145431fe4:     	movl	$0x8, %r8d
145431fea:     	movq	0x3a8(%rbp), %rcx
145431ff1:     	callq	0x1400021d0 <.text+0x11d0>
145431ff6:     	movq	0x1d8(%rbp), %rdx
145431ffd:     	testq	%rdx, %rdx
145432000:     	leaq	-0x18(%rbp), %rdi
145432004:     	movq	0x380(%rbp), %r11
14543200b:     	jne	0x145431c50 <.text+0x5430c50>
145432011:     	jmp	0x145431a00 <.text+0x5430a00>
145432016:     	movzbl	0x1(%rcx), %ecx
14543201a:     	addl	$-0x30, %ecx
14543201d:     	cmpl	$0x9, %ecx
145432020:     	ja	0x145431c40 <.text+0x5430c40>
145432026:     	movzbl	%al, %eax
145432029:     	addl	%eax, %eax
14543202b:     	leal	(%rax,%rax,4), %eax
14543202e:     	addb	%al, %cl
145432030:     	movl	%ecx, 0x398(%rbp)
145432036:     	jmp	0x145431c80 <.text+0x5430c80>
14543203b:     	movq	$0x0, 0x1a0(%rbp)
145432046:     	movq	$0x8, 0x1a8(%rbp)
145432051:     	movq	$0x0, 0x1b0(%rbp)
14543205c:     	movq	$0x0, 0x240(%rbp)
145432067:     	movq	0x378(%rbp), %rax
14543206e:     	movq	%rax, 0x248(%rbp)
145432075:     	movq	0x370(%rbp), %rcx
14543207c:     	movq	%rcx, 0x250(%rbp)
145432083:     	movq	%rax, 0x258(%rbp)
14543208a:     	movq	$0x0, 0x260(%rbp)
145432095:     	movq	%rax, 0x268(%rbp)
14543209c:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1454320a6:     	movq	%rax, 0x270(%rbp)
1454320ad:     	movb	$0x1, 0x278(%rbp)
1454320b4:     	movw	$0x0, 0x280(%rbp)
1454320bd:     	xorl	%eax, %eax
1454320bf:     	jmp	0x1454320d7 <.text+0x54310d7>
1454320c1:     	nopw	%cs:(%rax,%rax)
1454320d0:     	movzbl	0x281(%rbp), %eax
1454320d7:     	testb	$0x1, %al
1454320d9:     	jne	0x14543252c <.text+0x543152c>
1454320df:     	movq	0x250(%rbp), %rsi
1454320e6:     	leaq	0x320(%rbp), %rcx
1454320ed:     	leaq	0x250(%rbp), %rdx
1454320f4:     	callq	0x14543cad0 <.text+0x543bad0>
1454320f9:     	nop
1454320fa:     	cmpl	$0x1, 0x320(%rbp)
145432101:     	jne	0x145432130 <.text+0x5431130>
145432103:     	movq	0x330(%rbp), %rdx
14543210a:     	movq	0x240(%rbp), %rax
145432111:     	movq	%rdx, 0x240(%rbp)
145432118:     	subq	%rax, %rdx
14543211b:     	addq	%rax, %rsi
14543211e:     	testq	%rdx, %rdx
145432121:     	jne	0x145432172 <.text+0x5431172>
145432123:     	jmp	0x1454321a0 <.text+0x54311a0>
145432125:     	nopw	%cs:(%rax,%rax)
145432130:     	cmpb	$0x0, 0x281(%rbp)
145432137:     	jne	0x14543252c <.text+0x543152c>
14543213d:     	movb	$0x1, 0x281(%rbp)
145432144:     	movq	0x240(%rbp), %rsi
14543214b:     	movq	0x248(%rbp), %rdx
145432152:     	subq	%rsi, %rdx
145432155:     	setne	%al
145432158:     	orb	0x280(%rbp), %al
14543215e:     	cmpb	$0x1, %al
145432160:     	jne	0x14543252c <.text+0x543152c>
145432166:     	addq	0x250(%rbp), %rsi
14543216d:     	testq	%rdx, %rdx
145432170:     	je	0x1454321a0 <.text+0x54311a0>
145432172:     	cmpb	$0xa, -0x1(%rsi,%rdx)
145432177:     	jne	0x1454321a0 <.text+0x54311a0>
145432179:     	movq	%rdx, %rax
14543217c:     	decq	%rax
14543217f:     	je	0x14543218e <.text+0x543118e>
145432181:     	cmpb	$0xd, -0x2(%rsi,%rdx)
145432186:     	jne	0x145432192 <.text+0x5431192>
145432188:     	addq	$-0x2, %rdx
14543218c:     	jmp	0x1454321a0 <.text+0x54311a0>
14543218e:     	xorl	%edx, %edx
145432190:     	jmp	0x1454321a0 <.text+0x54311a0>
145432192:     	movq	%rax, %rdx
145432195:     	nopw	%cs:(%rax,%rax)
1454321a0:     	movq	%rsi, %rcx
1454321a3:     	callq	0x1400a4890 <.text+0xa3890>
1454321a8:     	nop
1454321a9:     	movq	%rdx, %r15
1454321ac:     	cmpq	$0x5, %rdx
1454321b0:     	jb	0x1454320d0 <.text+0x54310d0>
1454321b6:     	movl	(%rax), %ecx
1454321b8:     	movl	$0x6e656573, %edx       # imm = 0x6E656573
1454321bd:     	xorl	%edx, %ecx
1454321bf:     	movzbl	0x4(%rax), %edx
1454321c3:     	xorl	$0x7c, %edx
1454321c6:     	orl	%ecx, %edx
1454321c8:     	jne	0x1454320d0 <.text+0x54310d0>
1454321ce:     	addq	$-0x5, %r15
1454321d2:     	leaq	0x5(%rax), %rdi
1454321d6:     	addq	$0x6, %rax
1454321da:     	movq	%rax, 0x388(%rbp)
1454321e1:     	movq	$0x0, 0x3a8(%rbp)
1454321ec:     	xorl	%r12d, %r12d
1454321ef:     	xorl	%ebx, %ebx
1454321f1:     	nopw	%cs:(%rax,%rax)
145432200:     	movq	%rbx, 0x398(%rbp)
145432207:     	testb	$0x1, 0x3a8(%rbp)
14543220e:     	jne	0x1454320d0 <.text+0x54310d0>
145432214:     	movb	$0x1, %al
145432216:     	movq	%rax, 0x3a8(%rbp)
14543221d:     	cmpq	%r12, %r15
145432220:     	jae	0x14543223c <.text+0x543123c>
145432222:     	jmp	0x1454322d9 <.text+0x54312d9>
145432227:     	nopw	(%rax,%rax)
145432230:     	movq	%rbx, %r12
145432233:     	cmpq	%rbx, %r15
145432236:     	jb	0x1454322d6 <.text+0x54312d6>
14543223c:     	movq	%r15, %r8
14543223f:     	subq	%r12, %r8
145432242:     	leaq	(%rdi,%r12), %rdx
145432246:     	cmpq	$0x10, %r8
14543224a:     	jae	0x145432280 <.text+0x5431280>
14543224c:     	xorl	%r13d, %r13d
14543224f:     	testq	%r8, %r8
145432252:     	je	0x145432272 <.text+0x5431272>
145432254:     	nopw	%cs:(%rax,%rax)
145432260:     	cmpb	$0x2c, (%rdx,%r13)
145432265:     	je	0x145432293 <.text+0x5431293>
145432267:     	incq	%r13
14543226a:     	cmpq	%r13, %r8
14543226d:     	jne	0x145432260 <.text+0x5431260>
14543226f:     	movq	%r8, %r13
145432272:     	xorl	%eax, %eax
145432274:     	cmpq	$0x1, %rax
145432278:     	je	0x1454322a0 <.text+0x54312a0>
14543227a:     	jmp	0x1454322d1 <.text+0x54312d1>
14543227c:     	nopl	(%rax)
145432280:     	movb	$0x2c, %cl
145432282:     	callq	0x1457311c0 <.text+0x57301c0>
145432287:     	nop
145432288:     	movq	%rdx, %r13
14543228b:     	cmpq	$0x1, %rax
14543228f:     	je	0x1454322a0 <.text+0x54312a0>
145432291:     	jmp	0x1454322d1 <.text+0x54312d1>
145432293:     	movl	$0x1, %eax
145432298:     	cmpq	$0x1, %rax
14543229c:     	jne	0x1454322d1 <.text+0x54312d1>
14543229e:     	nop
1454322a0:     	leaq	(%r12,%r13), %rbx
1454322a4:     	incq	%rbx
1454322a7:     	addq	%r12, %r13
1454322aa:     	cmpq	%r15, %r13
1454322ad:     	jae	0x145432230 <.text+0x5431230>
1454322af:     	cmpb	$0x2c, (%rdi,%r13)
1454322b4:     	jne	0x145432230 <.text+0x5431230>
1454322ba:     	movq	$0x0, 0x3a8(%rbp)
1454322c5:     	movq	%rbx, %r12
1454322c8:     	movq	0x398(%rbp), %rax
1454322cf:     	jmp	0x1454322e6 <.text+0x54312e6>
1454322d1:     	movq	%r15, %r12
1454322d4:     	jmp	0x1454322d9 <.text+0x54312d9>
1454322d6:     	movq	%rbx, %r12
1454322d9:     	movq	0x398(%rbp), %rax
1454322e0:     	movq	%rax, %rbx
1454322e3:     	movq	%r15, %r13
1454322e6:     	subq	%rax, %r13
1454322e9:     	leaq	(%rdi,%rax), %rsi
1454322ed:     	xorl	%r14d, %r14d
1454322f0:     	jmp	0x14543230c <.text+0x543130c>
1454322f2:     	nopw	%cs:(%rax,%rax)
145432300:     	movq	%rcx, %r14
145432303:     	cmpq	%rcx, %r13
145432306:     	jb	0x145432200 <.text+0x5431200>
14543230c:     	movq	%r13, %r8
14543230f:     	subq	%r14, %r8
145432312:     	leaq	(%rsi,%r14), %rax
145432316:     	cmpq	$0x10, %r8
14543231a:     	jae	0x145432350 <.text+0x5431350>
14543231c:     	xorl	%edx, %edx
14543231e:     	testq	%r8, %r8
145432321:     	je	0x145432341 <.text+0x5431341>
145432323:     	nopw	%cs:(%rax,%rax)
145432330:     	cmpb	$0x3d, (%rax,%rdx)
145432334:     	je	0x14543237e <.text+0x543137e>
145432336:     	incq	%rdx
145432339:     	cmpq	%rdx, %r8
14543233c:     	jne	0x145432330 <.text+0x5431330>
14543233e:     	movq	%r8, %rdx
145432341:     	xorl	%eax, %eax
145432343:     	cmpq	$0x1, %rax
145432347:     	je	0x145432365 <.text+0x5431365>
145432349:     	jmp	0x145432200 <.text+0x5431200>
14543234e:     	nop
145432350:     	movb	$0x3d, %cl
145432352:     	movq	%rax, %rdx
145432355:     	callq	0x1457311c0 <.text+0x57301c0>
14543235a:     	nop
14543235b:     	cmpq	$0x1, %rax
14543235f:     	jne	0x145432200 <.text+0x5431200>
145432365:     	leaq	(%rdx,%r14), %rcx
145432369:     	incq	%rcx
14543236c:     	leaq	(%rdx,%r14), %r11
145432370:     	cmpq	%r13, %r11
145432373:     	jae	0x145432300 <.text+0x5431300>
145432375:     	cmpb	$0x3d, (%rsi,%r11)
14543237a:     	jne	0x145432300 <.text+0x5431300>
14543237c:     	jmp	0x14543238e <.text+0x543138e>
14543237e:     	movl	$0x1, %eax
145432383:     	cmpq	$0x1, %rax
145432387:     	je	0x145432365 <.text+0x5431365>
145432389:     	jmp	0x145432200 <.text+0x5431200>
14543238e:     	movq	%r13, %r8
145432391:     	subq	%rcx, %r8
145432394:     	je	0x145432200 <.text+0x5431200>
14543239a:     	addq	%rsi, %rcx
14543239d:     	cmpq	$0x1, %r8
1454323a1:     	jne	0x1454323ba <.text+0x54313ba>
1454323a3:     	movzbl	(%rcx), %eax
1454323a6:     	cmpl	$0x2b, %eax
1454323a9:     	je	0x145432200 <.text+0x5431200>
1454323af:     	cmpl	$0x2d, %eax
1454323b2:     	je	0x145432200 <.text+0x5431200>
1454323b8:     	jmp	0x1454323bd <.text+0x54313bd>
1454323ba:     	movzbl	(%rcx), %eax
1454323bd:     	xorl	%r9d, %r9d
1454323c0:     	cmpb	$0x2b, %al
1454323c2:     	sete	%r9b
1454323c6:     	subq	%r9, %r8
1454323c9:     	cmpq	$0x3, %r8
1454323cd:     	jae	0x14543240f <.text+0x543140f>
1454323cf:     	testq	%r8, %r8
1454323d2:     	je	0x145432467 <.text+0x5431467>
1454323d8:     	movzbl	(%rcx,%r9), %eax
1454323dd:     	addl	$-0x30, %eax
1454323e0:     	cmpl	$0x9, %eax
1454323e3:     	ja	0x145432200 <.text+0x5431200>
1454323e9:     	cmpq	$0x1, %r8
1454323ed:     	je	0x145432469 <.text+0x5431469>
1454323ef:     	movzbl	0x1(%rcx,%r9), %ecx
1454323f5:     	addl	$-0x30, %ecx
1454323f8:     	cmpl	$0x9, %ecx
1454323fb:     	ja	0x145432200 <.text+0x5431200>
145432401:     	movzbl	%al, %eax
145432404:     	addl	%eax, %eax
145432406:     	leal	(%rax,%rax,4), %eax
145432409:     	addb	%al, %cl
14543240b:     	movl	%ecx, %eax
14543240d:     	jmp	0x145432469 <.text+0x5431469>
14543240f:     	movq	0x398(%rbp), %r10
145432416:     	addq	%r9, %r10
145432419:     	negq	%r9
14543241c:     	leaq	(%r9,%r13), %rcx
145432420:     	decq	%rcx
145432423:     	addq	%r14, %rdx
145432426:     	addq	0x388(%rbp), %r10
14543242d:     	xorl	%eax, %eax
14543242f:     	cmpq	%rdx, %rcx
145432432:     	je	0x145432469 <.text+0x5431469>
145432434:     	movb	$0xa, %r8b
145432437:     	mulb	%r8b
14543243a:     	jo	0x145432200 <.text+0x5431200>
145432440:     	movzbl	(%r10,%rdx), %r9d
145432445:     	addl	$-0x30, %r9d
145432449:     	addb	%r9b, %al
14543244c:     	setb	%r8b
145432450:     	cmpl	$0x9, %r9d
145432454:     	ja	0x145432200 <.text+0x5431200>
14543245a:     	incq	%rdx
14543245d:     	testb	%r8b, %r8b
145432460:     	je	0x14543242f <.text+0x543142f>
145432462:     	jmp	0x145432200 <.text+0x5431200>
145432467:     	xorl	%eax, %eax
145432469:     	testq	%r11, %r11
14543246c:     	je	0x145432200 <.text+0x5431200>
145432472:     	js	0x145433143 <.text+0x5432143>
145432478:     	movl	%eax, 0x398(%rbp)
14543247e:     	movq	%r11, %r14
145432481:     	callq	0x140002200 <.text+0x1200>
145432486:     	movl	$0x1, %r13d
14543248c:     	movl	$0x1, %edx
145432491:     	movq	%r14, %rcx
145432494:     	callq	0x1400021c0 <.text+0x11c0>
145432499:     	testq	%rax, %rax
14543249c:     	je	0x145434b17 <.text+0x5433b17>
1454324a2:     	movq	%rax, 0x380(%rbp)
1454324a9:     	movq	%rax, %rcx
1454324ac:     	movq	%rsi, %rdx
1454324af:     	movq	%r14, 0x318(%rbp)
1454324b6:     	movq	%r14, %r8
1454324b9:     	callq	0x1457731ed <.text+0x57721ed>
1454324be:     	movzbl	0x398(%rbp), %esi
1454324c5:     	cmpb	$0x4, %sil
1454324c9:     	movl	$0x4, %eax
1454324ce:     	cmovael	%eax, %esi
1454324d1:     	movq	0x1b0(%rbp), %r14
1454324d8:     	cmpq	0x1a0(%rbp), %r14
1454324df:     	jne	0x1454324ee <.text+0x54314ee>
1454324e1:     	leaq	0x1a0(%rbp), %rcx
1454324e8:     	callq	0x145774710 <.text+0x5773710>
1454324ed:     	nop
1454324ee:     	movq	0x1a8(%rbp), %rax
1454324f5:     	movq	%r14, %rcx
1454324f8:     	shlq	$0x5, %rcx
1454324fc:     	movq	0x318(%rbp), %r8
145432503:     	movq	%r8, (%rax,%rcx)
145432507:     	movq	0x380(%rbp), %rdx
14543250e:     	movq	%rdx, 0x8(%rax,%rcx)
145432513:     	movq	%r8, 0x10(%rax,%rcx)
145432518:     	movb	%sil, 0x18(%rax,%rcx)
14543251d:     	incq	%r14
145432520:     	movq	%r14, 0x1b0(%rbp)
145432527:     	jmp	0x145432200 <.text+0x5431200>
14543252c:     	movq	0x1b0(%rbp), %rsi
145432533:     	cmpq	$0x2, %rsi
145432537:     	jae	0x145434725 <.text+0x5433725>
14543253d:     	leaq	0x1a0(%rbp), %rcx
145432544:     	callq	0x145532000 <.text+0x5531000>
145432549:     	nop
14543254a:     	movq	$0x0, 0x240(%rbp)
145432555:     	movq	0x378(%rbp), %rax
14543255c:     	movq	%rax, 0x248(%rbp)
145432563:     	movq	0x370(%rbp), %rcx
14543256a:     	movq	%rcx, 0x250(%rbp)
145432571:     	movq	%rax, 0x258(%rbp)
145432578:     	movq	$0x0, 0x260(%rbp)
145432583:     	movq	%rax, 0x268(%rbp)
14543258a:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145432594:     	movq	%rax, 0x270(%rbp)
14543259b:     	movb	$0x1, 0x278(%rbp)
1454325a2:     	movw	$0x0, 0x280(%rbp)
1454325ab:     	movl	$0xffffffff, 0x2bc(%rbp) # imm = 0xFFFFFFFF
1454325b5:     	movl	$0xffffffff, 0x304(%rbp) # imm = 0xFFFFFFFF
1454325bf:     	leaq	0x40(%rbp), %rcx
1454325c3:     	leaq	0x240(%rbp), %rdx
1454325ca:     	callq	0x145535b90 <.text+0x5534b90>
1454325cf:     	nop
1454325d0:     	movq	0x50(%rbp), %rdx
1454325d4:     	cmpq	$0x2, %rdx
1454325d8:     	jae	0x145434759 <.text+0x5433759>
1454325de:     	leaq	0x40(%rbp), %rcx
1454325e2:     	callq	0x145531250 <.text+0x5530250>
1454325e7:     	nop
1454325e8:     	movq	$0x0, 0x240(%rbp)
1454325f3:     	movq	0x378(%rbp), %rax
1454325fa:     	movq	%rax, 0x248(%rbp)
145432601:     	movq	0x370(%rbp), %rcx
145432608:     	movq	%rcx, 0x250(%rbp)
14543260f:     	movq	%rax, 0x258(%rbp)
145432616:     	movq	$0x0, 0x260(%rbp)
145432621:     	movq	%rax, 0x268(%rbp)
145432628:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145432632:     	movq	%rax, 0x270(%rbp)
145432639:     	movb	$0x1, 0x278(%rbp)
145432640:     	movw	$0x0, 0x280(%rbp)
145432649:     	movl	$0xffffffff, 0x2bc(%rbp) # imm = 0xFFFFFFFF
145432653:     	movl	$0xffffffff, 0x304(%rbp) # imm = 0xFFFFFFFF
14543265d:     	leaq	0x28(%rbp), %rcx
145432661:     	leaq	0x240(%rbp), %rdx
145432668:     	callq	0x145539cc0 <.text+0x5538cc0>
14543266d:     	nop
14543266e:     	movq	0x38(%rbp), %rsi
145432672:     	cmpq	$0x2, %rsi
145432676:     	jae	0x14543477e <.text+0x543377e>
14543267c:     	leaq	0x28(%rbp), %rcx
145432680:     	callq	0x145532140 <.text+0x5531140>
145432685:     	nop
145432686:     	xorps	%xmm0, %xmm0
145432689:     	movaps	%xmm0, -0x30(%rbp)
14543268d:     	movaps	%xmm0, -0x40(%rbp)
145432691:     	movaps	%xmm0, -0x50(%rbp)
145432695:     	movq	$0x0, -0x20(%rbp)
14543269d:     	movq	$0x0, 0x240(%rbp)
1454326a8:     	movq	0x378(%rbp), %rax
1454326af:     	movq	%rax, 0x248(%rbp)
1454326b6:     	movq	0x370(%rbp), %rcx
1454326bd:     	movq	%rcx, 0x250(%rbp)
1454326c4:     	movq	%rax, 0x258(%rbp)
1454326cb:     	movq	$0x0, 0x260(%rbp)
1454326d6:     	movq	%rax, 0x268(%rbp)
1454326dd:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1454326e7:     	movq	%rax, 0x270(%rbp)
1454326ee:     	movb	$0x1, 0x278(%rbp)
1454326f5:     	movw	$0x0, 0x280(%rbp)
1454326fe:     	xorl	%eax, %eax
145432700:     	jmp	0x145432717 <.text+0x5431717>
145432702:     	nopw	%cs:(%rax,%rax)
145432710:     	movzbl	0x281(%rbp), %eax
145432717:     	testb	$0x1, %al
145432719:     	jne	0x145432bda <.text+0x5431bda>
14543271f:     	movq	0x250(%rbp), %rsi
145432726:     	leaq	0x320(%rbp), %rcx
14543272d:     	leaq	0x250(%rbp), %rdx
145432734:     	callq	0x14543cad0 <.text+0x543bad0>
145432739:     	nop
14543273a:     	cmpl	$0x1, 0x320(%rbp)
145432741:     	jne	0x145432770 <.text+0x5431770>
145432743:     	movq	0x330(%rbp), %rdx
14543274a:     	movq	0x240(%rbp), %rax
145432751:     	movq	%rdx, 0x240(%rbp)
145432758:     	subq	%rax, %rdx
14543275b:     	addq	%rax, %rsi
14543275e:     	testq	%rdx, %rdx
145432761:     	jne	0x1454327b2 <.text+0x54317b2>
145432763:     	jmp	0x1454327e0 <.text+0x54317e0>
145432765:     	nopw	%cs:(%rax,%rax)
145432770:     	cmpb	$0x0, 0x281(%rbp)
145432777:     	jne	0x145432bda <.text+0x5431bda>
14543277d:     	movb	$0x1, 0x281(%rbp)
145432784:     	movq	0x240(%rbp), %rsi
14543278b:     	movq	0x248(%rbp), %rdx
145432792:     	subq	%rsi, %rdx
145432795:     	setne	%al
145432798:     	orb	0x280(%rbp), %al
14543279e:     	cmpb	$0x1, %al
1454327a0:     	jne	0x145432bda <.text+0x5431bda>
1454327a6:     	addq	0x250(%rbp), %rsi
1454327ad:     	testq	%rdx, %rdx
1454327b0:     	je	0x1454327e0 <.text+0x54317e0>
1454327b2:     	cmpb	$0xa, -0x1(%rsi,%rdx)
1454327b7:     	jne	0x1454327e0 <.text+0x54317e0>
1454327b9:     	movq	%rdx, %rax
1454327bc:     	decq	%rax
1454327bf:     	je	0x1454327ce <.text+0x54317ce>
1454327c1:     	cmpb	$0xd, -0x2(%rsi,%rdx)
1454327c6:     	jne	0x1454327d2 <.text+0x54317d2>
1454327c8:     	addq	$-0x2, %rdx
1454327cc:     	jmp	0x1454327e0 <.text+0x54317e0>
1454327ce:     	xorl	%edx, %edx
1454327d0:     	jmp	0x1454327e0 <.text+0x54317e0>
1454327d2:     	movq	%rax, %rdx
1454327d5:     	nopw	%cs:(%rax,%rax)
1454327e0:     	movq	%rsi, %rcx
1454327e3:     	callq	0x1400a4890 <.text+0xa3890>
1454327e8:     	nop
1454327e9:     	movq	%rdx, %r14
1454327ec:     	cmpq	$0x5, %rdx
1454327f0:     	jb	0x145432710 <.text+0x5431710>
1454327f6:     	movl	(%rax), %ecx
1454327f8:     	movl	$0x74617473, %edx       # imm = 0x74617473
1454327fd:     	xorl	%edx, %ecx
1454327ff:     	movzbl	0x4(%rax), %edx
145432803:     	xorl	$0x7c, %edx
145432806:     	orl	%ecx, %edx
145432808:     	jne	0x145432710 <.text+0x5431710>
14543280e:     	addq	$-0x5, %r14
145432812:     	leaq	0x5(%rax), %rdi
145432816:     	addq	$0x6, %rax
14543281a:     	movq	%rax, 0x388(%rbp)
145432821:     	movq	$0x0, 0x398(%rbp)
14543282c:     	xorl	%r12d, %r12d
14543282f:     	movl	$0x0, 0x3a8(%rbp)
145432839:     	nopl	(%rax)
145432840:     	movq	0x398(%rbp), %r13
145432847:     	testb	$0x1, 0x3a8(%rbp)
14543284e:     	jne	0x145432710 <.text+0x5431710>
145432854:     	movb	$0x1, %al
145432856:     	movl	%eax, 0x3a8(%rbp)
14543285c:     	cmpq	%r12, %r14
14543285f:     	jae	0x14543287c <.text+0x543187c>
145432861:     	movq	%r13, 0x398(%rbp)
145432868:     	jmp	0x145432925 <.text+0x5431925>
14543286d:     	nopl	(%rax)
145432870:     	movq	%rax, %r12
145432873:     	cmpq	%rax, %r14
145432876:     	jb	0x14543291b <.text+0x543191b>
14543287c:     	movq	%r14, %r8
14543287f:     	subq	%r12, %r8
145432882:     	leaq	(%rdi,%r12), %rdx
145432886:     	cmpq	$0x10, %r8
14543288a:     	jae	0x1454328c0 <.text+0x54318c0>
14543288c:     	xorl	%esi, %esi
14543288e:     	testq	%r8, %r8
145432891:     	je	0x1454328b1 <.text+0x54318b1>
145432893:     	nopw	%cs:(%rax,%rax)
1454328a0:     	cmpb	$0x2c, (%rdx,%rsi)
1454328a4:     	je	0x1454328d3 <.text+0x54318d3>
1454328a6:     	incq	%rsi
1454328a9:     	cmpq	%rsi, %r8
1454328ac:     	jne	0x1454328a0 <.text+0x54318a0>
1454328ae:     	movq	%r8, %rsi
1454328b1:     	xorl	%eax, %eax
1454328b3:     	cmpq	$0x1, %rax
1454328b7:     	je	0x1454328e0 <.text+0x54318e0>
1454328b9:     	jmp	0x14543290f <.text+0x543190f>
1454328bb:     	nopl	(%rax,%rax)
1454328c0:     	movb	$0x2c, %cl
1454328c2:     	callq	0x1457311c0 <.text+0x57301c0>
1454328c7:     	nop
1454328c8:     	movq	%rdx, %rsi
1454328cb:     	cmpq	$0x1, %rax
1454328cf:     	je	0x1454328e0 <.text+0x54318e0>
1454328d1:     	jmp	0x14543290f <.text+0x543190f>
1454328d3:     	movl	$0x1, %eax
1454328d8:     	cmpq	$0x1, %rax
1454328dc:     	jne	0x14543290f <.text+0x543190f>
1454328de:     	nop
1454328e0:     	leaq	(%rsi,%r12), %rax
1454328e4:     	incq	%rax
1454328e7:     	addq	%r12, %rsi
1454328ea:     	cmpq	%r14, %rsi
1454328ed:     	jae	0x145432870 <.text+0x5431870>
1454328ef:     	cmpb	$0x2c, (%rdi,%rsi)
1454328f3:     	jne	0x145432870 <.text+0x5431870>
1454328f9:     	movl	$0x0, 0x3a8(%rbp)
145432903:     	movq	%rax, 0x398(%rbp)
14543290a:     	movq	%rax, %r12
14543290d:     	jmp	0x145432928 <.text+0x5431928>
14543290f:     	movq	%r13, 0x398(%rbp)
145432916:     	movq	%r14, %r12
145432919:     	jmp	0x145432925 <.text+0x5431925>
14543291b:     	movq	%r13, 0x398(%rbp)
145432922:     	movq	%rax, %r12
145432925:     	movq	%r14, %rsi
145432928:     	subq	%r13, %rsi
14543292b:     	leaq	(%rdi,%r13), %rbx
14543292f:     	xorl	%r15d, %r15d
145432932:     	jmp	0x14543294c <.text+0x543194c>
145432934:     	nopw	%cs:(%rax,%rax)
145432940:     	movq	%rax, %r15
145432943:     	cmpq	%rax, %rsi
145432946:     	jb	0x145432840 <.text+0x5431840>
14543294c:     	movq	%rsi, %r8
14543294f:     	subq	%r15, %r8
145432952:     	leaq	(%rbx,%r15), %rax
145432956:     	cmpq	$0x10, %r8
14543295a:     	jae	0x145432990 <.text+0x5431990>
14543295c:     	xorl	%edx, %edx
14543295e:     	testq	%r8, %r8
145432961:     	je	0x145432981 <.text+0x5431981>
145432963:     	nopw	%cs:(%rax,%rax)
145432970:     	cmpb	$0x3d, (%rax,%rdx)
145432974:     	je	0x1454329bd <.text+0x54319bd>
145432976:     	incq	%rdx
145432979:     	cmpq	%rdx, %r8
14543297c:     	jne	0x145432970 <.text+0x5431970>
14543297e:     	movq	%r8, %rdx
145432981:     	xorl	%eax, %eax
145432983:     	cmpq	$0x1, %rax
145432987:     	je	0x1454329a5 <.text+0x54319a5>
145432989:     	jmp	0x145432840 <.text+0x5431840>
14543298e:     	nop
145432990:     	movb	$0x3d, %cl
145432992:     	movq	%rax, %rdx
145432995:     	callq	0x1457311c0 <.text+0x57301c0>
14543299a:     	nop
14543299b:     	cmpq	$0x1, %rax
14543299f:     	jne	0x145432840 <.text+0x5431840>
1454329a5:     	leaq	(%rdx,%r15), %rax
1454329a9:     	incq	%rax
1454329ac:     	leaq	(%rdx,%r15), %rcx
1454329b0:     	cmpq	%rsi, %rcx
1454329b3:     	jae	0x145432940 <.text+0x5431940>
1454329b5:     	cmpb	$0x3d, (%rbx,%rcx)
1454329b9:     	jne	0x145432940 <.text+0x5431940>
1454329bb:     	jmp	0x1454329cd <.text+0x54319cd>
1454329bd:     	movl	$0x1, %eax
1454329c2:     	cmpq	$0x1, %rax
1454329c6:     	je	0x1454329a5 <.text+0x54319a5>
1454329c8:     	jmp	0x145432840 <.text+0x5431840>
1454329cd:     	xorl	%r8d, %r8d
1454329d0:     	leaq	-0x4(%rcx), %r9
1454329d4:     	cmpq	$0x5, %r9
1454329d8:     	ja	0x145432aa0 <.text+0x5431aa0>
1454329de:     	leaq	0x130b4b7(%rip), %r10   # 0x14673de9c
1454329e5:     	movslq	(%r10,%r9,4), %r9
1454329e9:     	addq	%r10, %r9
1454329ec:     	jmpq	*%r9
1454329ef:     	cmpl	$0x646c6f67, (%rbx)     # imm = 0x646C6F67
1454329f5:     	je	0x145432ab5 <.text+0x5431ab5>
1454329fb:     	cmpl	$0x736e7572, (%rbx)     # imm = 0x736E7572
145432a01:     	je	0x145432ac5 <.text+0x5431ac5>
145432a07:     	cmpl	$0x736e6977, (%rbx)     # imm = 0x736E6977
145432a0d:     	jne	0x145432a9d <.text+0x5431a9d>
145432a13:     	movl	$0x5, %r8d
145432a19:     	jmp	0x145432acb <.text+0x5431acb>
145432a1e:     	movl	(%rbx), %r8d
145432a21:     	movl	$0x73736f62, %r9d       # imm = 0x73736F62
145432a27:     	xorl	%r9d, %r8d
145432a2a:     	movzwl	0x4(%rbx), %r9d
145432a2f:     	xorl	$0x7365, %r9d           # imm = 0x7365
145432a36:     	orl	%r8d, %r9d
145432a39:     	je	0x145432aad <.text+0x5431aad>
145432a3b:     	movl	(%rbx), %r8d
145432a3e:     	movl	$0x68636163, %r9d       # imm = 0x68636163
145432a44:     	xorl	%r9d, %r8d
145432a47:     	movzwl	0x4(%rbx), %r9d
145432a4c:     	xorl	$0x7365, %r9d           # imm = 0x7365
145432a53:     	orl	%r8d, %r9d
145432a56:     	jne	0x145432a9d <.text+0x5431a9d>
145432a58:     	movl	$0x6, %r8d
145432a5e:     	jmp	0x145432acb <.text+0x5431acb>
145432a60:     	movl	(%rbx), %r8d
145432a63:     	movl	$0x6c6c696b, %r9d       # imm = 0x6C6C696B
145432a69:     	xorl	%r9d, %r8d
145432a6c:     	movzbl	0x4(%rbx), %r9d
145432a71:     	xorl	$0x73, %r9d
145432a75:     	orl	%r8d, %r9d
145432a78:     	jne	0x145432a9d <.text+0x5431a9d>
145432a7a:     	xorl	%r8d, %r8d
145432a7d:     	jmp	0x145432acb <.text+0x5431acb>
145432a7f:     	movq	(%rbx), %r8
145432a82:     	movabsq	$0x6e61696472617567, %r9 # imm = 0x6E61696472617567
145432a8c:     	xorq	%r9, %r8
145432a8f:     	movzbl	0x8(%rbx), %r9d
145432a94:     	xorq	$0x73, %r9
145432a98:     	orq	%r8, %r9
145432a9b:     	je	0x145432abd <.text+0x5431abd>
145432a9d:     	xorl	%r8d, %r8d
145432aa0:     	movq	%rsi, %r9
145432aa3:     	subq	%rax, %r9
145432aa6:     	jne	0x145432ae1 <.text+0x5431ae1>
145432aa8:     	jmp	0x145432840 <.text+0x5431840>
145432aad:     	movl	$0x3, %r8d
145432ab3:     	jmp	0x145432acb <.text+0x5431acb>
145432ab5:     	movl	$0x1, %r8d
145432abb:     	jmp	0x145432acb <.text+0x5431acb>
145432abd:     	movl	$0x2, %r8d
145432ac3:     	jmp	0x145432acb <.text+0x5431acb>
145432ac5:     	movl	$0x4, %r8d
145432acb:     	leaq	0x130ae4e(%rip), %r9    # 0x14673d920
145432ad2:     	addq	%r9, %r8
145432ad5:     	movq	%rsi, %r9
145432ad8:     	subq	%rax, %r9
145432adb:     	je	0x145432840 <.text+0x5431840>
145432ae1:     	cmpq	$0x1, %r9
145432ae5:     	jne	0x145432b02 <.text+0x5431b02>
145432ae7:     	movzbl	(%rbx,%rax), %r10d
145432aec:     	cmpl	$0x2b, %r10d
145432af0:     	je	0x145432840 <.text+0x5431840>
145432af6:     	cmpl	$0x2d, %r10d
145432afa:     	je	0x145432840 <.text+0x5431840>
145432b00:     	jmp	0x145432b07 <.text+0x5431b07>
145432b02:     	movzbl	(%rbx,%rax), %r10d
145432b07:     	xorl	%eax, %eax
145432b09:     	cmpb	$0x2b, %r10b
145432b0d:     	sete	%al
145432b10:     	movq	%rax, %r10
145432b13:     	negq	%r10
145432b16:     	subq	%rax, %r9
145432b19:     	cmpq	$0x11, %r9
145432b1d:     	jae	0x145432b69 <.text+0x5431b69>
145432b1f:     	testq	%r9, %r9
145432b22:     	je	0x145432bb5 <.text+0x5431bb5>
145432b28:     	addq	%rax, %r13
145432b2b:     	addq	0x388(%rbp), %r13
145432b32:     	addq	%r15, %rdx
145432b35:     	leaq	(%rsi,%r10), %rcx
145432b39:     	decq	%rcx
145432b3c:     	xorl	%eax, %eax
145432b3e:     	nop
145432b40:     	movzbl	(%r13,%rdx), %r9d
145432b46:     	addl	$-0x30, %r9d
145432b4a:     	cmpl	$0x9, %r9d
145432b4e:     	ja	0x145432840 <.text+0x5431840>
145432b54:     	leaq	(%rax,%rax,4), %rax
145432b58:     	movl	%r9d, %r9d
145432b5b:     	leaq	(%r9,%rax,2), %rax
145432b5f:     	incq	%rdx
145432b62:     	cmpq	%rdx, %rcx
145432b65:     	jne	0x145432b40 <.text+0x5431b40>
145432b67:     	jmp	0x145432bb7 <.text+0x5431bb7>
145432b69:     	leaq	(%rsi,%r10), %r9
145432b6d:     	decq	%r9
145432b70:     	addq	%rax, %r13
145432b73:     	addq	0x388(%rbp), %r13
145432b7a:     	xorl	%eax, %eax
145432b7c:     	cmpq	%rcx, %r9
145432b7f:     	je	0x145432bb7 <.text+0x5431bb7>
145432b81:     	movl	$0xa, %edx
145432b86:     	mulq	%rdx
145432b89:     	jo	0x145432840 <.text+0x5431840>
145432b8f:     	movzbl	(%r13,%rcx), %r10d
145432b95:     	addl	$-0x30, %r10d
145432b99:     	addq	%r10, %rax
145432b9c:     	setb	%dl
145432b9f:     	cmpl	$0x9, %r10d
145432ba3:     	ja	0x145432840 <.text+0x5431840>
145432ba9:     	incq	%rcx
145432bac:     	testb	%dl, %dl
145432bae:     	je	0x145432b7c <.text+0x5431b7c>
145432bb0:     	jmp	0x145432840 <.text+0x5431840>
145432bb5:     	xorl	%eax, %eax
145432bb7:     	testq	%r8, %r8
145432bba:     	je	0x145432840 <.text+0x5431840>
145432bc0:     	movzbl	(%r8), %ecx
145432bc4:     	movq	-0x50(%rbp,%rcx,8), %rdx
145432bc9:     	cmpq	%rdx, %rax
145432bcc:     	cmovaq	%rax, %rdx
145432bd0:     	movq	%rdx, -0x50(%rbp,%rcx,8)
145432bd5:     	jmp	0x145432840 <.text+0x5431840>
145432bda:     	movq	$0x0, 0x140(%rbp)
145432be5:     	movq	$0x8, 0x148(%rbp)
145432bf0:     	movq	$0x0, 0x150(%rbp)
145432bfb:     	movq	$0x0, 0x320(%rbp)
145432c06:     	movq	0x378(%rbp), %rax
145432c0d:     	movq	%rax, 0x328(%rbp)
145432c14:     	leaq	0x330(%rbp), %rsi
145432c1b:     	movq	0x370(%rbp), %rcx
145432c22:     	movq	%rcx, 0x330(%rbp)
145432c29:     	movq	%rax, 0x338(%rbp)
145432c30:     	movq	$0x0, 0x340(%rbp)
145432c3b:     	movq	%rax, 0x348(%rbp)
145432c42:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145432c4c:     	movq	%rax, 0x350(%rbp)
145432c53:     	movb	$0x1, 0x358(%rbp)
145432c5a:     	movw	$0x0, 0x360(%rbp)
145432c63:     	xorl	%eax, %eax
145432c65:     	leaq	0x240(%rbp), %r14
145432c6c:     	leaq	0x1d8(%rbp), %r15
145432c73:     	leaq	0x140(%rbp), %r12
145432c7a:     	movb	$0xa, %bl
145432c7c:     	testb	$0x1, %al
145432c7e:     	je	0x145432e6f <.text+0x5431e6f>
145432c84:     	movq	0x150(%rbp), %rdx
145432c8b:     	cmpq	$0x2, %rdx
145432c8f:     	jae	0x1454347af <.text+0x54337af>
145432c95:     	movq	$0x0, 0x240(%rbp)
145432ca0:     	movq	0x378(%rbp), %rax
145432ca7:     	movq	%rax, 0x248(%rbp)
145432cae:     	movq	0x370(%rbp), %rcx
145432cb5:     	movq	%rcx, 0x250(%rbp)
145432cbc:     	movq	%rax, 0x258(%rbp)
145432cc3:     	movq	$0x0, 0x260(%rbp)
145432cce:     	movq	%rax, 0x268(%rbp)
145432cd5:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145432cdf:     	movq	%rax, 0x270(%rbp)
145432ce6:     	movb	$0x1, 0x278(%rbp)
145432ced:     	movw	$0x0, 0x280(%rbp)
145432cf6:     	movl	$0xffffffff, 0x2bc(%rbp) # imm = 0xFFFFFFFF
145432d00:     	movl	$0xffffffff, 0x304(%rbp) # imm = 0xFFFFFFFF
145432d0a:     	leaq	0xb0(%rbp), %rcx
145432d11:     	leaq	0x240(%rbp), %rdx
145432d18:     	callq	0x145539a20 <.text+0x5538a20>
145432d1d:     	nop
145432d1e:     	movq	0xc0(%rbp), %rsi
145432d25:     	cmpq	$0x2, %rsi
145432d29:     	jae	0x145434872 <.text+0x5433872>
145432d2f:     	leaq	0xb0(%rbp), %rcx
145432d36:     	callq	0x145532140 <.text+0x5531140>
145432d3b:     	nop
145432d3c:     	movq	$0x0, 0x240(%rbp)
145432d47:     	movq	0x378(%rbp), %rax
145432d4e:     	movq	%rax, 0x248(%rbp)
145432d55:     	movq	0x370(%rbp), %rcx
145432d5c:     	movq	%rcx, 0x250(%rbp)
145432d63:     	movq	%rax, 0x258(%rbp)
145432d6a:     	movq	$0x0, 0x260(%rbp)
145432d75:     	movq	%rax, 0x268(%rbp)
145432d7c:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145432d86:     	movq	%rax, 0x270(%rbp)
145432d8d:     	movb	$0x1, 0x278(%rbp)
145432d94:     	movw	$0x0, 0x280(%rbp)
145432d9d:     	movl	$0xffffffff, 0x2bc(%rbp) # imm = 0xFFFFFFFF
145432da7:     	movl	$0xffffffff, 0x304(%rbp) # imm = 0xFFFFFFFF
145432db1:     	leaq	0x120(%rbp), %rcx
145432db8:     	leaq	0x240(%rbp), %rdx
145432dbf:     	callq	0x14553e990 <.text+0x553d990>
145432dc4:     	nop
145432dc5:     	movq	0x130(%rbp), %r14
145432dcc:     	cmpq	$0x2, %r14
145432dd0:     	jae	0x1454348a6 <.text+0x54338a6>
145432dd6:     	movq	$0x0, 0x240(%rbp)
145432de1:     	movq	0x378(%rbp), %rax
145432de8:     	movq	%rax, 0x248(%rbp)
145432def:     	leaq	0x250(%rbp), %rsi
145432df6:     	movq	0x370(%rbp), %rcx
145432dfd:     	movq	%rcx, 0x250(%rbp)
145432e04:     	movq	%rax, 0x258(%rbp)
145432e0b:     	movq	$0x0, 0x260(%rbp)
145432e16:     	movq	%rax, 0x268(%rbp)
145432e1d:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145432e27:     	movq	%rax, 0x270(%rbp)
145432e2e:     	movb	$0x1, 0x278(%rbp)
145432e35:     	movw	$0x0, 0x280(%rbp)
145432e3e:     	xorl	%r13d, %r13d
145432e41:     	leaq	0x320(%rbp), %r14
145432e48:     	movl	$0x65736572, %edi       # imm = 0x65736572
145432e4d:     	movl	$0x7c737465, %ebx       # imm = 0x7C737465
145432e52:     	movl	$0xa, %r12d
145432e58:     	xorl	%eax, %eax
145432e5a:     	jmp	0x145433177 <.text+0x5432177>
145432e5f:     	nop
145432e60:     	movzbl	0x361(%rbp), %eax
145432e67:     	testb	$0x1, %al
145432e69:     	jne	0x145432c84 <.text+0x5431c84>
145432e6f:     	movq	0x330(%rbp), %r13
145432e76:     	movq	%r14, %rcx
145432e79:     	movq	%rsi, %rdx
145432e7c:     	callq	0x14543cad0 <.text+0x543bad0>
145432e81:     	nop
145432e82:     	cmpl	$0x1, 0x240(%rbp)
145432e89:     	jne	0x145432eb0 <.text+0x5431eb0>
145432e8b:     	movq	0x250(%rbp), %rdx
145432e92:     	movq	0x320(%rbp), %rax
145432e99:     	movq	%rdx, 0x320(%rbp)
145432ea0:     	subq	%rax, %rdx
145432ea3:     	addq	%rax, %r13
145432ea6:     	testq	%rdx, %rdx
145432ea9:     	jne	0x145432ef2 <.text+0x5431ef2>
145432eab:     	jmp	0x145432f20 <.text+0x5431f20>
145432ead:     	nopl	(%rax)
145432eb0:     	cmpb	$0x0, 0x361(%rbp)
145432eb7:     	jne	0x145432c84 <.text+0x5431c84>
145432ebd:     	movb	$0x1, 0x361(%rbp)
145432ec4:     	movq	0x320(%rbp), %r13
145432ecb:     	movq	0x328(%rbp), %rdx
145432ed2:     	subq	%r13, %rdx
145432ed5:     	setne	%al
145432ed8:     	orb	0x360(%rbp), %al
145432ede:     	cmpb	$0x1, %al
145432ee0:     	jne	0x145432c84 <.text+0x5431c84>
145432ee6:     	addq	0x330(%rbp), %r13
145432eed:     	testq	%rdx, %rdx
145432ef0:     	je	0x145432f20 <.text+0x5431f20>
145432ef2:     	cmpb	$0xa, -0x1(%r13,%rdx)
145432ef8:     	jne	0x145432f20 <.text+0x5431f20>
145432efa:     	movq	%rdx, %rax
145432efd:     	decq	%rax
145432f00:     	je	0x145432f10 <.text+0x5431f10>
145432f02:     	cmpb	$0xd, -0x2(%r13,%rdx)
145432f08:     	jne	0x145432f14 <.text+0x5431f14>
145432f0a:     	addq	$-0x2, %rdx
145432f0e:     	jmp	0x145432f20 <.text+0x5431f20>
145432f10:     	xorl	%edx, %edx
145432f12:     	jmp	0x145432f20 <.text+0x5431f20>
145432f14:     	movq	%rax, %rdx
145432f17:     	nopw	(%rax,%rax)
145432f20:     	movq	%r13, %rcx
145432f23:     	callq	0x1400a4890 <.text+0xa3890>
145432f28:     	nop
145432f29:     	movq	$0x0, 0x240(%rbp)
145432f34:     	movq	%rdx, 0x248(%rbp)
145432f3b:     	movq	%rax, 0x250(%rbp)
145432f42:     	movq	%rdx, 0x258(%rbp)
145432f49:     	movq	$0x0, 0x260(%rbp)
145432f54:     	movq	%rdx, 0x268(%rbp)
145432f5b:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
145432f65:     	movq	%rax, 0x270(%rbp)
145432f6c:     	movb	$0x1, 0x278(%rbp)
145432f73:     	movw	$0x1, 0x280(%rbp)
145432f7c:     	movq	%r15, %rcx
145432f7f:     	movq	%r14, %rdx
145432f82:     	callq	0x1455393f0 <.text+0x55383f0>
145432f87:     	nop
145432f88:     	movq	0x1e0(%rbp), %rcx
145432f8f:     	cmpq	$0x3, 0x1e8(%rbp)
145432f97:     	jne	0x145432fb0 <.text+0x5431fb0>
145432f99:     	cmpq	$0x4, 0x8(%rcx)
145432f9e:     	jne	0x145432fb0 <.text+0x5431fb0>
145432fa0:     	movq	(%rcx), %rax
145432fa3:     	cmpl	$0x74616562, (%rax)     # imm = 0x74616562
145432fa9:     	je	0x145432fe3 <.text+0x5431fe3>
145432fab:     	nopl	(%rax,%rax)
145432fb0:     	movq	0x1d8(%rbp), %rdx
145432fb7:     	testq	%rdx, %rdx
145432fba:     	je	0x145432e60 <.text+0x5431e60>
145432fc0:     	shlq	$0x4, %rdx
145432fc4:     	movl	$0x8, %r8d
145432fca:     	callq	0x1400021d0 <.text+0x11d0>
145432fcf:     	movzbl	0x361(%rbp), %eax
145432fd6:     	testb	$0x1, %al
145432fd8:     	je	0x145432e6f <.text+0x5431e6f>
145432fde:     	jmp	0x145432c84 <.text+0x5431c84>
145432fe3:     	movq	0x18(%rcx), %rdx
145432fe7:     	testq	%rdx, %rdx
145432fea:     	je	0x145432fb0 <.text+0x5431fb0>
145432fec:     	movq	0x10(%rcx), %r11
145432ff0:     	cmpq	$0x1, %rdx
145432ff4:     	jne	0x145433008 <.text+0x5432008>
145432ff6:     	movzbl	(%r11), %r8d
145432ffa:     	cmpl	$0x2b, %r8d
145432ffe:     	je	0x145432fb0 <.text+0x5431fb0>
145433000:     	cmpl	$0x2d, %r8d
145433004:     	je	0x145432fb0 <.text+0x5431fb0>
145433006:     	jmp	0x14543300c <.text+0x543200c>
145433008:     	movzbl	(%r11), %r8d
14543300c:     	xorl	%eax, %eax
14543300e:     	cmpb	$0x2b, %r8b
145433012:     	sete	%al
145433015:     	movq	%rdx, %r8
145433018:     	subq	%rax, %r8
14543301b:     	addq	%rax, %r11
14543301e:     	cmpq	$0x3, %r8
145433022:     	jae	0x14543305e <.text+0x543205e>
145433024:     	testq	%r8, %r8
145433027:     	je	0x1454330a3 <.text+0x54320a3>
145433029:     	movzbl	(%r11), %eax
14543302d:     	addl	$-0x30, %eax
145433030:     	cmpl	$0x9, %eax
145433033:     	ja	0x145432fb0 <.text+0x5431fb0>
145433039:     	cmpq	$0x1, %r8
14543303d:     	je	0x1454330a5 <.text+0x54320a5>
14543303f:     	movzbl	0x1(%r11), %edx
145433044:     	addl	$-0x30, %edx
145433047:     	cmpl	$0x9, %edx
14543304a:     	ja	0x145432fb0 <.text+0x5431fb0>
145433050:     	movzbl	%al, %eax
145433053:     	addl	%eax, %eax
145433055:     	leal	(%rax,%rax,4), %eax
145433058:     	addb	%al, %dl
14543305a:     	movl	%edx, %eax
14543305c:     	jmp	0x1454330a5 <.text+0x54320a5>
14543305e:     	negq	%rax
145433061:     	addq	%rax, %rdx
145433064:     	negq	%rdx
145433067:     	xorl	%r8d, %r8d
14543306a:     	xorl	%eax, %eax
14543306c:     	movq	%rdx, %r9
14543306f:     	addq	%r8, %r9
145433072:     	je	0x1454330a5 <.text+0x54320a5>
145433074:     	mulb	%bl
145433076:     	jo	0x145432fb0 <.text+0x5431fb0>
14543307c:     	movzbl	(%r11,%r8), %r10d
145433081:     	addl	$-0x30, %r10d
145433085:     	addb	%r10b, %al
145433088:     	setb	%r9b
14543308c:     	cmpl	$0x9, %r10d
145433090:     	ja	0x145432fb0 <.text+0x5431fb0>
145433096:     	incq	%r8
145433099:     	testb	%r9b, %r9b
14543309c:     	je	0x14543306c <.text+0x543206c>
14543309e:     	jmp	0x145432fb0 <.text+0x5431fb0>
1454330a3:     	xorl	%eax, %eax
1454330a5:     	movb	%al, 0xe0(%rbp)
1454330ab:     	movq	0x20(%rcx), %rax
1454330af:     	movq	%rcx, 0x3a8(%rbp)
1454330b6:     	movq	0x28(%rcx), %rcx
1454330ba:     	movq	$0x0, 0x248(%rbp)
1454330c5:     	movq	%rcx, 0x250(%rbp)
1454330cc:     	movq	%rax, 0x258(%rbp)
1454330d3:     	movq	%rcx, 0x260(%rbp)
1454330da:     	movq	$0x0, 0x268(%rbp)
1454330e5:     	movq	%rcx, 0x270(%rbp)
1454330ec:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
1454330f6:     	movq	%rax, 0x278(%rbp)
1454330fd:     	movb	$0x1, 0x280(%rbp)
145433104:     	movw	$0x1, 0x288(%rbp)
14543310d:     	leaq	0xe0(%rbp), %rax
145433114:     	movq	%rax, 0x240(%rbp)
14543311b:     	movq	%r12, %rcx
14543311e:     	movq	%r14, %rdx
145433121:     	callq	0x145532960 <.text+0x5531960>
145433126:     	nop
145433127:     	movq	0x1d8(%rbp), %rdx
14543312e:     	testq	%rdx, %rdx
145433131:     	movq	0x3a8(%rbp), %rcx
145433138:     	jne	0x145432fc0 <.text+0x5431fc0>
14543313e:     	jmp	0x145432e60 <.text+0x5431e60>
145433143:     	xorl	%r13d, %r13d
145433146:     	movq	%r13, %rcx
145433149:     	movq	0x380(%rbp), %rdx
145433150:     	callq	0x14590379b <.text+0x590279b>
145433155:     	nop
145433156:     	jmp	0x145434c0b <.text+0x5433c0b>
14543315b:     	shlq	$0x20, %rax
14543315f:     	testb	$0x1, %al
145433161:     	je	0x14543332e <.text+0x543232e>
145433167:     	nopw	(%rax,%rax)
145433170:     	movzbl	0x281(%rbp), %eax
145433177:     	testb	$0x1, %al
145433179:     	jne	0x145433335 <.text+0x5432335>
14543317f:     	movq	0x250(%rbp), %r15
145433186:     	movq	%r14, %rcx
145433189:     	movq	%rsi, %rdx
14543318c:     	callq	0x14543cad0 <.text+0x543bad0>
145433191:     	nop
145433192:     	cmpl	$0x1, 0x320(%rbp)
145433199:     	jne	0x1454331c0 <.text+0x54321c0>
14543319b:     	movq	0x330(%rbp), %rdx
1454331a2:     	movq	0x240(%rbp), %rax
1454331a9:     	movq	%rdx, 0x240(%rbp)
1454331b0:     	subq	%rax, %rdx
1454331b3:     	addq	%rax, %r15
1454331b6:     	testq	%rdx, %rdx
1454331b9:     	jne	0x145433202 <.text+0x5432202>
1454331bb:     	jmp	0x145433230 <.text+0x5432230>
1454331bd:     	nopl	(%rax)
1454331c0:     	cmpb	$0x0, 0x281(%rbp)
1454331c7:     	jne	0x145433335 <.text+0x5432335>
1454331cd:     	movb	$0x1, 0x281(%rbp)
1454331d4:     	movq	0x240(%rbp), %r15
1454331db:     	movq	0x248(%rbp), %rdx
1454331e2:     	subq	%r15, %rdx
1454331e5:     	setne	%al
1454331e8:     	orb	0x280(%rbp), %al
1454331ee:     	cmpb	$0x1, %al
1454331f0:     	jne	0x145433335 <.text+0x5432335>
1454331f6:     	addq	0x250(%rbp), %r15
1454331fd:     	testq	%rdx, %rdx
145433200:     	je	0x145433230 <.text+0x5432230>
145433202:     	cmpb	$0xa, -0x1(%r15,%rdx)
145433208:     	jne	0x145433230 <.text+0x5432230>
14543320a:     	movq	%rdx, %rax
14543320d:     	decq	%rax
145433210:     	je	0x145433220 <.text+0x5432220>
145433212:     	cmpb	$0xd, -0x2(%r15,%rdx)
145433218:     	jne	0x145433224 <.text+0x5432224>
14543321a:     	addq	$-0x2, %rdx
14543321e:     	jmp	0x145433230 <.text+0x5432230>
145433220:     	xorl	%edx, %edx
145433222:     	jmp	0x145433230 <.text+0x5432230>
145433224:     	movq	%rax, %rdx
145433227:     	nopw	(%rax,%rax)
145433230:     	movq	%r15, %rcx
145433233:     	callq	0x1400a4890 <.text+0xa3890>
145433238:     	nop
145433239:     	cmpq	$0x7, %rdx
14543323d:     	jb	0x145433170 <.text+0x5432170>
145433243:     	movl	(%rax), %ecx
145433245:     	xorl	%edi, %ecx
145433247:     	movl	0x3(%rax), %r8d
14543324b:     	xorl	%ebx, %r8d
14543324e:     	orl	%ecx, %r8d
145433251:     	jne	0x145433170 <.text+0x5432170>
145433257:     	movq	%rdx, %rcx
14543325a:     	subq	$0x7, %rcx
14543325e:     	je	0x145433170 <.text+0x5432170>
145433264:     	leaq	0x7(%rax), %r8
145433268:     	cmpq	$0x8, %rdx
14543326c:     	jne	0x145433286 <.text+0x5432286>
14543326e:     	movzbl	(%r8), %eax
145433272:     	cmpl	$0x2b, %eax
145433275:     	je	0x145433170 <.text+0x5432170>
14543327b:     	cmpl	$0x2d, %eax
14543327e:     	je	0x145433170 <.text+0x5432170>
145433284:     	jmp	0x14543328a <.text+0x543228a>
145433286:     	movzbl	(%r8), %eax
14543328a:     	xorl	%edx, %edx
14543328c:     	cmpb	$0x2b, %al
14543328e:     	sete	%dl
145433291:     	subq	%rdx, %rcx
145433294:     	addq	%rdx, %r8
145433297:     	xorl	%eax, %eax
145433299:     	cmpq	$0x9, %rcx
14543329d:     	jae	0x1454332d7 <.text+0x54322d7>
14543329f:     	testq	%rcx, %rcx
1454332a2:     	je	0x14543315b <.text+0x543215b>
1454332a8:     	xorl	%edx, %edx
1454332aa:     	nopw	(%rax,%rax)
1454332b0:     	movzbl	(%r8,%rdx), %r9d
1454332b5:     	addl	$-0x30, %r9d
1454332b9:     	cmpl	$0x9, %r9d
1454332bd:     	ja	0x145433170 <.text+0x5432170>
1454332c3:     	leal	(%rax,%rax,4), %eax
1454332c6:     	leal	(%r9,%rax,2), %eax
1454332ca:     	incq	%rdx
1454332cd:     	cmpq	%rdx, %rcx
1454332d0:     	jne	0x1454332b0 <.text+0x54322b0>
1454332d2:     	jmp	0x14543315b <.text+0x543215b>
1454332d7:     	xorl	%r9d, %r9d
1454332da:     	cmpq	%r9, %rcx
1454332dd:     	je	0x14543315b <.text+0x543215b>
1454332e3:     	mull	%r12d
1454332e6:     	jo	0x14543330d <.text+0x543230d>
1454332e8:     	movzbl	(%r8,%r9), %r10d
1454332ed:     	addl	$-0x30, %r10d
1454332f1:     	addl	%r10d, %eax
1454332f4:     	setb	%dl
1454332f7:     	cmpl	$0x9, %r10d
1454332fb:     	ja	0x145433170 <.text+0x5432170>
145433301:     	incq	%r9
145433304:     	testb	%dl, %dl
145433306:     	je	0x1454332da <.text+0x54322da>
145433308:     	jmp	0x145433170 <.text+0x5432170>
14543330d:     	movzbl	(%r8,%r9), %ecx
145433312:     	addb	$-0x30, %cl
145433315:     	xorl	%eax, %eax
145433317:     	cmpb	$0xa, %cl
14543331a:     	setb	%al
14543331d:     	shll	$0x8, %eax
145433320:     	addq	$0x101, %rax            # imm = 0x101
145433326:     	testb	$0x1, %al
145433328:     	jne	0x145433170 <.text+0x5432170>
14543332e:     	shrq	$0x20, %rax
145433332:     	movl	%eax, %r13d
145433335:     	movq	$0x0, 0x320(%rbp)
145433340:     	movq	0x378(%rbp), %rax
145433347:     	movq	%rax, 0x328(%rbp)
14543334e:     	leaq	0x330(%rbp), %rsi
145433355:     	movq	0x370(%rbp), %rcx
14543335c:     	movq	%rcx, 0x330(%rbp)
145433363:     	movq	%rax, 0x338(%rbp)
14543336a:     	movq	$0x0, 0x340(%rbp)
145433375:     	movq	%rax, 0x348(%rbp)
14543337c:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145433386:     	movq	%rax, 0x350(%rbp)
14543338d:     	movb	$0x1, 0x358(%rbp)
145433394:     	movw	$0x0, 0x360(%rbp)
14543339d:     	xorl	%eax, %eax
14543339f:     	leaq	0x240(%rbp), %r14
1454333a6:     	movl	$0x73746570, %edi       # imm = 0x73746570
1454333ab:     	movq	%r13, 0x3a8(%rbp)
1454333b2:     	jmp	0x1454333c7 <.text+0x54323c7>
1454333b4:     	nopw	%cs:(%rax,%rax)
1454333c0:     	movzbl	0x361(%rbp), %eax
1454333c7:     	testb	$0x1, %al
1454333c9:     	jne	0x145433541 <.text+0x5432541>
1454333cf:     	movq	0x330(%rbp), %r15
1454333d6:     	movq	%r14, %rcx
1454333d9:     	movq	%rsi, %rdx
1454333dc:     	callq	0x14543cad0 <.text+0x543bad0>
1454333e1:     	nop
1454333e2:     	cmpl	$0x1, 0x240(%rbp)
1454333e9:     	jne	0x145433410 <.text+0x5432410>
1454333eb:     	movq	0x250(%rbp), %rdx
1454333f2:     	movq	0x320(%rbp), %rax
1454333f9:     	movq	%rdx, 0x320(%rbp)
145433400:     	subq	%rax, %rdx
145433403:     	addq	%rax, %r15
145433406:     	testq	%rdx, %rdx
145433409:     	jne	0x145433452 <.text+0x5432452>
14543340b:     	jmp	0x145433480 <.text+0x5432480>
14543340d:     	nopl	(%rax)
145433410:     	cmpb	$0x0, 0x361(%rbp)
145433417:     	jne	0x145433541 <.text+0x5432541>
14543341d:     	movb	$0x1, 0x361(%rbp)
145433424:     	movq	0x320(%rbp), %r15
14543342b:     	movq	0x328(%rbp), %rdx
145433432:     	subq	%r15, %rdx
145433435:     	setne	%al
145433438:     	orb	0x360(%rbp), %al
14543343e:     	cmpb	$0x1, %al
145433440:     	jne	0x145433541 <.text+0x5432541>
145433446:     	addq	0x330(%rbp), %r15
14543344d:     	testq	%rdx, %rdx
145433450:     	je	0x145433480 <.text+0x5432480>
145433452:     	cmpb	$0xa, -0x1(%r15,%rdx)
145433458:     	jne	0x145433480 <.text+0x5432480>
14543345a:     	movq	%rdx, %rax
14543345d:     	decq	%rax
145433460:     	je	0x145433470 <.text+0x5432470>
145433462:     	cmpb	$0xd, -0x2(%r15,%rdx)
145433468:     	jne	0x145433474 <.text+0x5432474>
14543346a:     	addq	$-0x2, %rdx
14543346e:     	jmp	0x145433480 <.text+0x5432480>
145433470:     	xorl	%edx, %edx
145433472:     	jmp	0x145433480 <.text+0x5432480>
145433474:     	movq	%rax, %rdx
145433477:     	nopw	(%rax,%rax)
145433480:     	movq	%r15, %rcx
145433483:     	callq	0x1400a4890 <.text+0xa3890>
145433488:     	nop
145433489:     	cmpq	$0x5, %rdx
14543348d:     	jb	0x1454333c0 <.text+0x54323c0>
145433493:     	movl	(%rax), %ecx
145433495:     	xorl	%edi, %ecx
145433497:     	movzbl	0x4(%rax), %r8d
14543349c:     	xorl	$0x7c, %r8d
1454334a0:     	orl	%ecx, %r8d
1454334a3:     	jne	0x1454333c0 <.text+0x54323c0>
1454334a9:     	addq	$0x5, %rax
1454334ad:     	addq	$-0x5, %rdx
1454334b1:     	movq	$0x2, 0x240(%rbp)
1454334bc:     	movq	$0x0, 0x248(%rbp)
1454334c7:     	movq	%rdx, 0x250(%rbp)
1454334ce:     	movq	%rax, 0x258(%rbp)
1454334d5:     	movq	%rdx, 0x260(%rbp)
1454334dc:     	movq	$0x0, 0x268(%rbp)
1454334e7:     	movq	%rdx, 0x270(%rbp)
1454334ee:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
1454334f8:     	movq	%rax, 0x278(%rbp)
1454334ff:     	movb	$0x1, 0x280(%rbp)
145433506:     	movw	$0x1, 0x288(%rbp)
14543350f:     	leaq	0x1d8(%rbp), %rcx
145433516:     	leaq	0x240(%rbp), %rdx
14543351d:     	callq	0x145535920 <.text+0x5534920>
145433522:     	nop
145433523:     	movups	0x1d8(%rbp), %xmm0
14543352a:     	movaps	%xmm0, 0x220(%rbp)
145433531:     	movq	0x1e8(%rbp), %rax
145433538:     	movq	%rax, 0x230(%rbp)
14543353f:     	jmp	0x145433562 <.text+0x5432562>
145433541:     	movq	$0x0, 0x220(%rbp)
14543354c:     	movq	$0x8, 0x228(%rbp)
145433557:     	movq	$0x0, 0x230(%rbp)
145433562:     	movq	$0x0, 0xe0(%rbp)
14543356d:     	movq	$0x1, 0xe8(%rbp)
145433578:     	movq	$0x0, 0xf0(%rbp)
145433583:     	xorl	%ebx, %ebx
145433585:     	leaq	0x1d8(%rbp), %r14
14543358c:     	leaq	0x240(%rbp), %r15
145433593:     	xorl	%r13d, %r13d
145433596:     	xorl	%esi, %esi
145433598:     	testb	$0x1, %sil
14543359c:     	je	0x14543378d <.text+0x543278d>
1454335a2:     	movq	0x10(%rbp), %rax
1454335a6:     	movq	0x18(%rbp), %rcx
1454335aa:     	movq	%rax, 0x10(%rcx)
1454335ae:     	movups	(%rbp), %xmm0
1454335b2:     	movups	%xmm0, (%rcx)
1454335b5:     	movups	0x58(%rbp), %xmm0
1454335b9:     	movups	0x68(%rbp), %xmm1
1454335bd:     	movups	0x78(%rbp), %xmm2
1454335c1:     	movups	0x88(%rbp), %xmm3
1454335c8:     	movups	%xmm3, 0x180(%rcx)
1454335cf:     	movups	%xmm2, 0x170(%rcx)
1454335d6:     	movups	%xmm1, 0x160(%rcx)
1454335dd:     	movups	%xmm0, 0x150(%rcx)
1454335e4:     	movq	0x168(%rbp), %rax
1454335eb:     	movq	%rax, 0x28(%rcx)
1454335ef:     	movups	0x158(%rbp), %xmm0
1454335f6:     	movups	%xmm0, 0x18(%rcx)
1454335fa:     	movq	0xd8(%rbp), %rax
145433601:     	movq	%rax, 0x40(%rcx)
145433605:     	movups	0xc8(%rbp), %xmm0
14543360c:     	movups	%xmm0, 0x30(%rcx)
145433610:     	movups	0x1b8(%rbp), %xmm0
145433617:     	movups	%xmm0, 0x48(%rcx)
14543361b:     	movq	0x1c8(%rbp), %rax
145433622:     	movq	%rax, 0x58(%rcx)
145433626:     	movups	0x98(%rbp), %xmm0
14543362d:     	movups	%xmm0, 0x60(%rcx)
145433631:     	movq	0xa8(%rbp), %rax
145433638:     	movq	%rax, 0x70(%rcx)
14543363c:     	movups	0x170(%rbp), %xmm0
145433643:     	movups	%xmm0, 0x78(%rcx)
145433647:     	movq	0x180(%rbp), %rax
14543364e:     	movq	%rax, 0x88(%rcx)
145433655:     	movups	0x1a0(%rbp), %xmm0
14543365c:     	movups	%xmm0, 0x90(%rcx)
145433663:     	movq	0x1b0(%rbp), %rax
14543366a:     	movq	%rax, 0xa0(%rcx)
145433671:     	movups	0x40(%rbp), %xmm0
145433675:     	movups	%xmm0, 0xa8(%rcx)
14543367c:     	movq	0x50(%rbp), %rax
145433680:     	movq	%rax, 0xb8(%rcx)
145433687:     	movq	0x38(%rbp), %rax
14543368b:     	movq	%rax, 0xd0(%rcx)
145433692:     	movups	0x28(%rbp), %xmm0
145433696:     	movups	%xmm0, 0xc0(%rcx)
14543369d:     	movq	0x150(%rbp), %rax
1454336a4:     	movq	%rax, 0xe8(%rcx)
1454336ab:     	movups	0x140(%rbp), %xmm0
1454336b2:     	movups	%xmm0, 0xd8(%rcx)
1454336b9:     	movups	0xb0(%rbp), %xmm0
1454336c0:     	movups	%xmm0, 0xf0(%rcx)
1454336c7:     	movq	0xc0(%rbp), %rax
1454336ce:     	movq	%rax, 0x100(%rcx)
1454336d5:     	movups	0x120(%rbp), %xmm0
1454336dc:     	movups	%xmm0, 0x108(%rcx)
1454336e3:     	movq	0x130(%rbp), %rax
1454336ea:     	movq	%rax, 0x118(%rcx)
1454336f1:     	movaps	0x220(%rbp), %xmm0
1454336f8:     	movups	%xmm0, 0x120(%rcx)
1454336ff:     	movq	0x230(%rbp), %rax
145433706:     	movq	%rax, 0x130(%rcx)
14543370d:     	movq	0xf0(%rbp), %rax
145433714:     	movq	%rax, 0x148(%rcx)
14543371b:     	movups	0xe0(%rbp), %xmm0
145433722:     	movups	%xmm0, 0x138(%rcx)
145433729:     	movaps	-0x50(%rbp), %xmm0
14543372d:     	movaps	-0x40(%rbp), %xmm1
145433731:     	movaps	-0x30(%rbp), %xmm2
145433735:     	movups	%xmm0, 0x190(%rcx)
14543373c:     	movups	%xmm1, 0x1a0(%rcx)
145433743:     	movups	%xmm2, 0x1b0(%rcx)
14543374a:     	movq	-0x20(%rbp), %rax
14543374e:     	movq	%rax, 0x1c0(%rcx)
145433755:     	movq	0x3a8(%rbp), %rax
14543375c:     	movl	%eax, 0x1c8(%rcx)
145433762:     	movq	%rcx, %rax
145433765:     	movaps	0x3c0(%rbp), %xmm6
14543376c:     	addq	$0x458, %rsp            # imm = 0x458
145433773:     	popq	%rbx
145433774:     	popq	%rdi
145433775:     	popq	%rsi
145433776:     	popq	%r12
145433778:     	popq	%r13
14543377a:     	popq	%r14
14543377c:     	popq	%r15
14543377e:     	popq	%rbp
14543377f:     	retq
145433780:     	movq	%rdi, %rbx
145433783:     	testb	$0x1, %sil
145433787:     	jne	0x1454335a2 <.text+0x54325a2>
14543378d:     	cmpq	%r13, 0x378(%rbp)
145433794:     	jae	0x1454337b0 <.text+0x54327b0>
145433796:     	movq	%r13, %rdi
145433799:     	movq	0x378(%rbp), %r8
1454337a0:     	jmp	0x14543385a <.text+0x543285a>
1454337a5:     	nopw	%cs:(%rax,%rax)
1454337b0:     	movq	0x378(%rbp), %r8
1454337b7:     	jmp	0x1454337d3 <.text+0x54327d3>
1454337b9:     	nopl	(%rax)
1454337c0:     	movq	%rdi, %r13
1454337c3:     	movq	0x378(%rbp), %r8
1454337ca:     	cmpq	%r8, %rdi
1454337cd:     	ja	0x14543385a <.text+0x543285a>
1454337d3:     	subq	%r13, %r8
1454337d6:     	movq	0x370(%rbp), %rax
1454337dd:     	leaq	(%rax,%r13), %rsi
1454337e1:     	cmpq	$0x10, %r8
1454337e5:     	jae	0x145433810 <.text+0x5432810>
1454337e7:     	xorl	%edx, %edx
1454337e9:     	testq	%r8, %r8
1454337ec:     	je	0x145433801 <.text+0x5432801>
1454337ee:     	nop
1454337f0:     	cmpb	$0xa, (%rsi,%rdx)
1454337f4:     	je	0x14543383c <.text+0x543283c>
1454337f6:     	incq	%rdx
1454337f9:     	cmpq	%rdx, %r8
1454337fc:     	jne	0x1454337f0 <.text+0x54327f0>
1454337fe:     	movq	%r8, %rdx
145433801:     	xorl	%eax, %eax
145433803:     	cmpq	$0x1, %rax
145433807:     	je	0x145433821 <.text+0x5432821>
145433809:     	jmp	0x145433850 <.text+0x5432850>
14543380b:     	nopl	(%rax,%rax)
145433810:     	movb	$0xa, %cl
145433812:     	movq	%rsi, %rdx
145433815:     	callq	0x1457311c0 <.text+0x57301c0>
14543381a:     	nop
14543381b:     	cmpq	$0x1, %rax
14543381f:     	jne	0x145433850 <.text+0x5432850>
145433821:     	leaq	(%rdx,%r13), %rdi
145433825:     	incq	%rdi
145433828:     	addq	%rdx, %r13
14543382b:     	cmpq	0x378(%rbp), %r13
145433832:     	jae	0x1454337c0 <.text+0x54327c0>
145433834:     	cmpb	$0xa, (%rsi,%rdx)
145433838:     	jne	0x1454337c0 <.text+0x54327c0>
14543383a:     	jmp	0x1454338a7 <.text+0x54328a7>
14543383c:     	movl	$0x1, %eax
145433841:     	cmpq	$0x1, %rax
145433845:     	je	0x145433821 <.text+0x5432821>
145433847:     	nopw	(%rax,%rax)
145433850:     	movq	0x378(%rbp), %r8
145433857:     	movq	%r8, %rdi
14543385a:     	movq	%rdi, %r13
14543385d:     	movb	$0x1, %sil
145433860:     	movq	%rbx, %rdi
145433863:     	movq	%r8, %rax
145433866:     	cmpq	%rbx, %r8
145433869:     	je	0x1454335a2 <.text+0x54325a2>
14543386f:     	movq	0x370(%rbp), %r8
145433876:     	leaq	(%r8,%rbx), %rcx
14543387a:     	movq	%rax, %rdx
14543387d:     	subq	%rbx, %rdx
145433880:     	je	0x1454338c0 <.text+0x54328c0>
145433882:     	cmpb	$0xa, -0x1(%r8,%rax)
145433888:     	jne	0x1454338c0 <.text+0x54328c0>
14543388a:     	movq	%rdx, %r8
14543388d:     	decq	%r8
145433890:     	je	0x1454338b1 <.text+0x54328b1>
145433892:     	movq	0x370(%rbp), %r9
145433899:     	cmpb	$0xd, -0x2(%r9,%rax)
14543389f:     	jne	0x1454338b5 <.text+0x54328b5>
1454338a1:     	addq	$-0x2, %rdx
1454338a5:     	jmp	0x1454338c0 <.text+0x54328c0>
1454338a7:     	xorl	%esi, %esi
1454338a9:     	movq	%rdi, %r13
1454338ac:     	movq	%rdi, %rax
1454338af:     	jmp	0x14543386f <.text+0x543286f>
1454338b1:     	xorl	%edx, %edx
1454338b3:     	jmp	0x1454338c0 <.text+0x54328c0>
1454338b5:     	movq	%r8, %rdx
1454338b8:     	nopl	(%rax,%rax)
1454338c0:     	callq	0x1400a4890 <.text+0xa3890>
1454338c5:     	nop
1454338c6:     	movq	$0x0, 0x240(%rbp)
1454338d1:     	movq	%rdx, 0x248(%rbp)
1454338d8:     	movq	%rax, 0x250(%rbp)
1454338df:     	movq	%rdx, 0x258(%rbp)
1454338e6:     	movq	$0x0, 0x260(%rbp)
1454338f1:     	movq	%rdx, 0x268(%rbp)
1454338f8:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
145433902:     	movq	%rax, 0x270(%rbp)
145433909:     	movb	$0x1, 0x278(%rbp)
145433910:     	movw	$0x1, 0x280(%rbp)
145433919:     	movq	%r14, %rcx
14543391c:     	movq	%r15, %rdx
14543391f:     	callq	0x1455393f0 <.text+0x55383f0>
145433924:     	nop
145433925:     	movq	0x1e0(%rbp), %rbx
14543392c:     	cmpq	$0x5, 0x1e8(%rbp)
145433934:     	jne	0x145433950 <.text+0x5432950>
145433936:     	cmpq	$0x4, 0x8(%rbx)
14543393b:     	jne	0x145433950 <.text+0x5432950>
14543393d:     	movq	(%rbx), %rax
145433940:     	cmpl	$0x6f726568, (%rax)     # imm = 0x6F726568
145433946:     	je	0x145433977 <.text+0x5432977>
145433948:     	nopl	(%rax,%rax)
145433950:     	movq	0x1d8(%rbp), %rdx
145433957:     	testq	%rdx, %rdx
14543395a:     	je	0x145433780 <.text+0x5432780>
145433960:     	shlq	$0x4, %rdx
145433964:     	movl	$0x8, %r8d
14543396a:     	movq	%rbx, %rcx
14543396d:     	callq	0x1400021d0 <.text+0x11d0>
145433972:     	jmp	0x145433780 <.text+0x5432780>
145433977:     	movq	0x18(%rbx), %rdx
14543397b:     	testq	%rdx, %rdx
14543397e:     	je	0x145433950 <.text+0x5432950>
145433980:     	movq	0x10(%rbx), %rcx
145433984:     	cmpq	$0x1, %rdx
145433988:     	jne	0x145433999 <.text+0x5432999>
14543398a:     	movzbl	(%rcx), %eax
14543398d:     	cmpl	$0x2b, %eax
145433990:     	je	0x145433950 <.text+0x5432950>
145433992:     	cmpl	$0x2d, %eax
145433995:     	je	0x145433950 <.text+0x5432950>
145433997:     	jmp	0x14543399c <.text+0x543299c>
145433999:     	movzbl	(%rcx), %eax
14543399c:     	xorl	%r8d, %r8d
14543399f:     	cmpb	$0x2b, %al
1454339a1:     	sete	%r8b
1454339a5:     	movq	%rdx, %rax
1454339a8:     	subq	%r8, %rax
1454339ab:     	addq	%r8, %rcx
1454339ae:     	cmpq	$0x3, %rax
1454339b2:     	jae	0x1454339f1 <.text+0x54329f1>
1454339b4:     	testq	%rax, %rax
1454339b7:     	je	0x145433a3f <.text+0x5432a3f>
1454339bd:     	movzbl	(%rcx), %r12d
1454339c1:     	addl	$-0x30, %r12d
1454339c5:     	cmpl	$0x9, %r12d
1454339c9:     	ja	0x145433950 <.text+0x5432950>
1454339cb:     	cmpq	$0x1, %rax
1454339cf:     	je	0x145433a42 <.text+0x5432a42>
1454339d1:     	movzbl	0x1(%rcx), %eax
1454339d5:     	addl	$-0x30, %eax
1454339d8:     	cmpl	$0x9, %eax
1454339db:     	ja	0x145433950 <.text+0x5432950>
1454339e1:     	movzbl	%r12b, %ecx
1454339e5:     	addl	%ecx, %ecx
1454339e7:     	leal	(%rcx,%rcx,4), %ecx
1454339ea:     	addb	%cl, %al
1454339ec:     	movl	%eax, %r12d
1454339ef:     	jmp	0x145433a42 <.text+0x5432a42>
1454339f1:     	negq	%r8
1454339f4:     	addq	%r8, %rdx
1454339f7:     	negq	%rdx
1454339fa:     	xorl	%r8d, %r8d
1454339fd:     	xorl	%r12d, %r12d
145433a00:     	movq	%rdx, %rax
145433a03:     	addq	%r8, %rax
145433a06:     	je	0x145433a42 <.text+0x5432a42>
145433a08:     	movl	%r12d, %eax
145433a0b:     	movb	$0xa, %r9b
145433a0e:     	mulb	%r9b
145433a11:     	jo	0x145433950 <.text+0x5432950>
145433a17:     	movl	%eax, %r12d
145433a1a:     	movzbl	(%rcx,%r8), %r9d
145433a1f:     	addl	$-0x30, %r9d
145433a23:     	addb	%r9b, %r12b
145433a26:     	setb	%al
145433a29:     	cmpl	$0x9, %r9d
145433a2d:     	ja	0x145433950 <.text+0x5432950>
145433a33:     	incq	%r8
145433a36:     	testb	%al, %al
145433a38:     	je	0x145433a00 <.text+0x5432a00>
145433a3a:     	jmp	0x145433950 <.text+0x5432950>
145433a3f:     	xorl	%r12d, %r12d
145433a42:     	movq	0x28(%rbx), %rdx
145433a46:     	testq	%rdx, %rdx
145433a49:     	je	0x145433950 <.text+0x5432950>
145433a4f:     	movq	0x20(%rbx), %rcx
145433a53:     	cmpq	$0x1, %rdx
145433a57:     	jne	0x145433a73 <.text+0x5432a73>
145433a59:     	movzbl	(%rcx), %r8d
145433a5d:     	cmpl	$0x2b, %r8d
145433a61:     	je	0x145433950 <.text+0x5432950>
145433a67:     	cmpl	$0x2d, %r8d
145433a6b:     	je	0x145433950 <.text+0x5432950>
145433a71:     	jmp	0x145433a77 <.text+0x5432a77>
145433a73:     	movzbl	(%rcx), %r8d
145433a77:     	xorl	%eax, %eax
145433a79:     	cmpb	$0x2b, %r8b
145433a7d:     	sete	%al
145433a80:     	movq	%rdx, %r8
145433a83:     	subq	%rax, %r8
145433a86:     	addq	%rax, %rcx
145433a89:     	cmpq	$0x3, %r8
145433a8d:     	jae	0x145433ac7 <.text+0x5432ac7>
145433a8f:     	testq	%r8, %r8
145433a92:     	je	0x145433b10 <.text+0x5432b10>
145433a94:     	movzbl	(%rcx), %eax
145433a97:     	addl	$-0x30, %eax
145433a9a:     	cmpl	$0x9, %eax
145433a9d:     	ja	0x145433950 <.text+0x5432950>
145433aa3:     	cmpq	$0x1, %r8
145433aa7:     	je	0x145433b12 <.text+0x5432b12>
145433aa9:     	movzbl	0x1(%rcx), %ecx
145433aad:     	addl	$-0x30, %ecx
145433ab0:     	cmpl	$0x9, %ecx
145433ab3:     	ja	0x145433950 <.text+0x5432950>
145433ab9:     	movzbl	%al, %eax
145433abc:     	addl	%eax, %eax
145433abe:     	leal	(%rax,%rax,4), %eax
145433ac1:     	addb	%al, %cl
145433ac3:     	movl	%ecx, %eax
145433ac5:     	jmp	0x145433b12 <.text+0x5432b12>
145433ac7:     	negq	%rax
145433aca:     	addq	%rax, %rdx
145433acd:     	negq	%rdx
145433ad0:     	xorl	%r8d, %r8d
145433ad3:     	xorl	%eax, %eax
145433ad5:     	movq	%rdx, %r9
145433ad8:     	addq	%r8, %r9
145433adb:     	je	0x145433b12 <.text+0x5432b12>
145433add:     	movb	$0xa, %r9b
145433ae0:     	mulb	%r9b
145433ae3:     	jo	0x145433950 <.text+0x5432950>
145433ae9:     	movzbl	(%rcx,%r8), %r10d
145433aee:     	addl	$-0x30, %r10d
145433af2:     	addb	%r10b, %al
145433af5:     	setb	%r9b
145433af9:     	cmpl	$0x9, %r10d
145433afd:     	ja	0x145433950 <.text+0x5432950>
145433b03:     	incq	%r8
145433b06:     	testb	%r9b, %r9b
145433b09:     	je	0x145433ad5 <.text+0x5432ad5>
145433b0b:     	jmp	0x145433950 <.text+0x5432950>
145433b10:     	xorl	%eax, %eax
145433b12:     	leal	-0x1(%r12), %ecx
145433b17:     	cmpb	$0xa, %cl
145433b1a:     	ja	0x145433950 <.text+0x5432950>
145433b20:     	movzbl	%cl, %edx
145433b23:     	movl	$0x5df, %ecx            # imm = 0x5DF
145433b28:     	btl	%edx, %ecx
145433b2b:     	jae	0x145433950 <.text+0x5432950>
145433b31:     	shll	$0x3, %edx
145433b34:     	leaq	0x130a195(%rip), %rcx   # 0x14673dcd0
145433b3b:     	movq	(%rdx,%rcx), %rcx
145433b3f:     	leaq	0x130a1e2(%rip), %r8    # 0x14673dd28
145433b46:     	movq	(%rdx,%r8), %rdx
145433b4a:     	xorl	%r8d, %r8d
145433b4d:     	cmpb	%al, (%rcx,%r8)
145433b51:     	je	0x145433b60 <.text+0x5432b60>
145433b53:     	incq	%r8
145433b56:     	cmpq	%r8, %rdx
145433b59:     	jne	0x145433b4d <.text+0x5432b4d>
145433b5b:     	jmp	0x145433950 <.text+0x5432950>
145433b60:     	movq	0x38(%rbx), %rdx
145433b64:     	testq	%rdx, %rdx
145433b67:     	je	0x145433950 <.text+0x5432950>
145433b6d:     	movq	0x30(%rbx), %rcx
145433b71:     	cmpq	$0x1, %rdx
145433b75:     	jne	0x145433b91 <.text+0x5432b91>
145433b77:     	movzbl	(%rcx), %r8d
145433b7b:     	cmpl	$0x2b, %r8d
145433b7f:     	je	0x145433950 <.text+0x5432950>
145433b85:     	cmpl	$0x2d, %r8d
145433b89:     	je	0x145433950 <.text+0x5432950>
145433b8f:     	jmp	0x145433b95 <.text+0x5432b95>
145433b91:     	movzbl	(%rcx), %r8d
145433b95:     	xorl	%r9d, %r9d
145433b98:     	cmpb	$0x2b, %r8b
145433b9c:     	sete	%r9b
145433ba0:     	movq	%rdx, %r8
145433ba3:     	subq	%r9, %r8
145433ba6:     	addq	%r9, %rcx
145433ba9:     	cmpq	$0x3, %r8
145433bad:     	movl	%eax, 0x398(%rbp)
145433bb3:     	jae	0x145433bed <.text+0x5432bed>
145433bb5:     	testq	%r8, %r8
145433bb8:     	je	0x145433c36 <.text+0x5432c36>
145433bba:     	movzbl	(%rcx), %eax
145433bbd:     	addl	$-0x30, %eax
145433bc0:     	cmpl	$0x9, %eax
145433bc3:     	ja	0x145433950 <.text+0x5432950>
145433bc9:     	cmpq	$0x1, %r8
145433bcd:     	je	0x145433c38 <.text+0x5432c38>
145433bcf:     	movzbl	0x1(%rcx), %ecx
145433bd3:     	addl	$-0x30, %ecx
145433bd6:     	cmpl	$0x9, %ecx
145433bd9:     	ja	0x145433950 <.text+0x5432950>
145433bdf:     	movzbl	%al, %eax
145433be2:     	addl	%eax, %eax
145433be4:     	leal	(%rax,%rax,4), %eax
145433be7:     	addb	%al, %cl
145433be9:     	movl	%ecx, %eax
145433beb:     	jmp	0x145433c38 <.text+0x5432c38>
145433bed:     	negq	%r9
145433bf0:     	addq	%r9, %rdx
145433bf3:     	negq	%rdx
145433bf6:     	xorl	%r8d, %r8d
145433bf9:     	xorl	%eax, %eax
145433bfb:     	movq	%rdx, %r9
145433bfe:     	addq	%r8, %r9
145433c01:     	je	0x145433c38 <.text+0x5432c38>
145433c03:     	movb	$0xa, %r9b
145433c06:     	mulb	%r9b
145433c09:     	jo	0x145433950 <.text+0x5432950>
145433c0f:     	movzbl	(%rcx,%r8), %r10d
145433c14:     	addl	$-0x30, %r10d
145433c18:     	addb	%r10b, %al
145433c1b:     	setb	%r9b
145433c1f:     	cmpl	$0x9, %r10d
145433c23:     	ja	0x145433950 <.text+0x5432950>
145433c29:     	incq	%r8
145433c2c:     	testb	%r9b, %r9b
145433c2f:     	je	0x145433bfb <.text+0x5432bfb>
145433c31:     	jmp	0x145433950 <.text+0x5432950>
145433c36:     	xorl	%eax, %eax
145433c38:     	movl	%eax, 0x318(%rbp)
145433c3e:     	testb	%al, %al
145433c40:     	setne	0x380(%rbp)
145433c47:     	movq	0x40(%rbx), %rax
145433c4b:     	movq	%rbx, 0x388(%rbp)
145433c52:     	movq	0x48(%rbx), %rcx
145433c56:     	movq	$0x0, 0x240(%rbp)
145433c61:     	movq	%rcx, 0x248(%rbp)
145433c68:     	movq	%rax, 0x250(%rbp)
145433c6f:     	movq	%rcx, 0x258(%rbp)
145433c76:     	movq	$0x0, 0x260(%rbp)
145433c81:     	movq	%rcx, 0x268(%rbp)
145433c88:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
145433c92:     	movq	%rax, 0x270(%rbp)
145433c99:     	movb	$0x1, 0x278(%rbp)
145433ca0:     	movw	$0x1, 0x280(%rbp)
145433ca9:     	leaq	0x320(%rbp), %rcx
145433cb0:     	movq	%r15, %rdx
145433cb3:     	callq	0x14553d930 <.text+0x553c930>
145433cb8:     	nop
145433cb9:     	cmpq	$0x5, 0x330(%rbp)
145433cc1:     	jne	0x145433d11 <.text+0x5432d11>
145433cc3:     	movq	0x320(%rbp), %rdx
145433cca:     	movq	0x328(%rbp), %rcx
145433cd1:     	movl	(%rcx), %eax
145433cd3:     	movzbl	0x4(%rcx), %r8d
145433cd8:     	shlq	$0x20, %r8
145433cdc:     	orq	%rax, %r8
145433cdf:     	movabsq	$-0x10000000000, %rax   # imm = 0xFFFFFF0000000000
145433ce9:     	movq	0x238(%rbp), %r9
145433cf0:     	andq	%rax, %r9
145433cf3:     	movq	%r9, %rax
145433cf6:     	orq	%r8, %rax
145433cf9:     	testq	%rdx, %rdx
145433cfc:     	je	0x145433d53 <.text+0x5432d53>
145433cfe:     	movl	$0x1, %r8d
145433d04:     	movq	%rax, %rbx
145433d07:     	callq	0x1400021d0 <.text+0x11d0>
145433d0c:     	movq	%rbx, %rax
145433d0f:     	jmp	0x145433d53 <.text+0x5432d53>
145433d11:     	movq	0x320(%rbp), %rdx
145433d18:     	movq	0x328(%rbp), %rax
145433d1f:     	cmpq	$-0x1, %rdx
145433d23:     	je	0x145433d53 <.text+0x5432d53>
145433d25:     	movq	%rax, 0x238(%rbp)
145433d2c:     	testq	%rdx, %rdx
145433d2f:     	movq	0x388(%rbp), %rbx
145433d36:     	je	0x145433950 <.text+0x5432950>
145433d3c:     	movl	$0x1, %r8d
145433d42:     	movq	0x238(%rbp), %rcx
145433d49:     	callq	0x1400021d0 <.text+0x11d0>
145433d4e:     	jmp	0x145433950 <.text+0x5432950>
145433d53:     	movl	0x398(%rbp), %edx
145433d59:     	movzbl	0x380(%rbp), %r8d
145433d61:     	movq	%rax, 0x238(%rbp)
145433d68:     	movq	%rax, %rcx
145433d6b:     	callq	0x145514150 <.text+0x5513150>
145433d70:     	movq	%rax, 0x380(%rbp)
145433d77:     	xorl	%ebx, %ebx
145433d79:     	cmpb	$0x0, 0x318(%rbp)
145433d80:     	setne	%r8b
145433d84:     	movq	0x1d8(%rbp), %rdx
145433d8b:     	testq	%rdx, %rdx
145433d8e:     	je	0x145433db5 <.text+0x5432db5>
145433d90:     	shlq	$0x4, %rdx
145433d94:     	movb	%r8b, 0x318(%rbp)
145433d9b:     	movl	$0x8, %r8d
145433da1:     	movq	0x388(%rbp), %rcx
145433da8:     	callq	0x1400021d0 <.text+0x11d0>
145433dad:     	movzbl	0x318(%rbp), %r8d
145433db5:     	movzbl	%r12b, %eax
145433db9:     	movzbl	0x398(%rbp), %ecx
145433dc0:     	shll	$0x8, %ecx
145433dc3:     	orq	%rax, %rcx
145433dc6:     	movb	%r8b, %bl
145433dc9:     	shll	$0x10, %ebx
145433dcc:     	orq	%rcx, %rbx
145433dcf:     	movq	0x380(%rbp), %r12
145433dd6:     	shlq	$0x18, %r12
145433dda:     	orq	%rbx, %r12
145433ddd:     	movq	%r12, 0x240(%rbp)
145433de4:     	leaq	0xe0(%rbp), %rcx
145433deb:     	movq	%r15, %rdx
145433dee:     	callq	0x145531460 <.text+0x5530460>
145433df3:     	movq	0xf0(%rbp), %rbx
145433dfa:     	cmpq	0xe0(%rbp), %rbx
145433e01:     	jne	0x145433e10 <.text+0x5432e10>
145433e03:     	leaq	0xe0(%rbp), %rcx
145433e0a:     	callq	0x1458e9be0 <.text+0x58e8be0>
145433e0f:     	nop
145433e10:     	movq	0xe8(%rbp), %rax
145433e17:     	movq	%r12, (%rax,%rbx,8)
145433e1b:     	incq	%rbx
145433e1e:     	movq	%rbx, 0xf0(%rbp)
145433e25:     	movq	%rdi, %rbx
145433e28:     	testb	$0x1, %sil
145433e2c:     	je	0x14543378d <.text+0x543278d>
145433e32:     	jmp	0x1454335a2 <.text+0x54325a2>
145433e37:     	cmpq	$-0x1, %rdi
145433e3b:     	jne	0x14543493d <.text+0x543393d>
145433e41:     	nopw	%cs:(%rax,%rax)
145433e50:     	movzbl	0x361(%rbp), %eax
145433e57:     	movq	$-0x1, %rdi
145433e5e:     	testb	$0x1, %al
145433e60:     	jne	0x145430852 <.text+0x542f852>
145433e66:     	movq	0x330(%rbp), %rsi
145433e6d:     	movq	%r14, %rcx
145433e70:     	movq	%r15, %rdx
145433e73:     	callq	0x14543cad0 <.text+0x543bad0>
145433e78:     	nop
145433e79:     	cmpl	$0x1, 0x240(%rbp)
145433e80:     	jne	0x145433eb0 <.text+0x5432eb0>
145433e82:     	movq	0x250(%rbp), %rdx
145433e89:     	movq	0x320(%rbp), %rax
145433e90:     	movq	%rdx, 0x320(%rbp)
145433e97:     	subq	%rax, %rdx
145433e9a:     	addq	%rax, %rsi
145433e9d:     	testq	%rdx, %rdx
145433ea0:     	jne	0x145433ef2 <.text+0x5432ef2>
145433ea2:     	jmp	0x145433f20 <.text+0x5432f20>
145433ea4:     	nopw	%cs:(%rax,%rax)
145433eb0:     	cmpb	$0x0, 0x361(%rbp)
145433eb7:     	jne	0x145430852 <.text+0x542f852>
145433ebd:     	movb	$0x1, 0x361(%rbp)
145433ec4:     	movq	0x320(%rbp), %rsi
145433ecb:     	movq	0x328(%rbp), %rdx
145433ed2:     	subq	%rsi, %rdx
145433ed5:     	setne	%al
145433ed8:     	orb	0x360(%rbp), %al
145433ede:     	cmpb	$0x1, %al
145433ee0:     	jne	0x145430852 <.text+0x542f852>
145433ee6:     	addq	0x330(%rbp), %rsi
145433eed:     	testq	%rdx, %rdx
145433ef0:     	je	0x145433f20 <.text+0x5432f20>
145433ef2:     	cmpb	$0xa, -0x1(%rsi,%rdx)
145433ef7:     	jne	0x145433f20 <.text+0x5432f20>
145433ef9:     	movq	%rdx, %rax
145433efc:     	decq	%rax
145433eff:     	je	0x145433f0e <.text+0x5432f0e>
145433f01:     	cmpb	$0xd, -0x2(%rsi,%rdx)
145433f06:     	jne	0x145433f12 <.text+0x5432f12>
145433f08:     	addq	$-0x2, %rdx
145433f0c:     	jmp	0x145433f20 <.text+0x5432f20>
145433f0e:     	xorl	%edx, %edx
145433f10:     	jmp	0x145433f20 <.text+0x5432f20>
145433f12:     	movq	%rax, %rdx
145433f15:     	nopw	%cs:(%rax,%rax)
145433f20:     	movq	%rsi, %rcx
145433f23:     	callq	0x1400a4890 <.text+0xa3890>
145433f28:     	nop
145433f29:     	movq	$0x0, 0x240(%rbp)
145433f34:     	movq	%rdx, 0x248(%rbp)
145433f3b:     	movq	%rax, 0x250(%rbp)
145433f42:     	movq	%rdx, 0x258(%rbp)
145433f49:     	movq	$0x0, 0x260(%rbp)
145433f54:     	movq	%rdx, 0x268(%rbp)
145433f5b:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
145433f65:     	movq	%rax, 0x270(%rbp)
145433f6c:     	movb	$0x1, 0x278(%rbp)
145433f73:     	movw	$0x1, 0x280(%rbp)
145433f7c:     	movq	%r12, %rcx
145433f7f:     	movq	%r14, %rdx
145433f82:     	callq	0x1455393f0 <.text+0x55383f0>
145433f87:     	nop
145433f88:     	movq	0x230(%rbp), %rdi
145433f8f:     	leaq	-0x6(%rdi), %rax
145433f93:     	cmpq	$0x3, %rax
145433f97:     	jae	0x145434140 <.text+0x5433140>
145433f9d:     	movq	0x228(%rbp), %r11
145433fa4:     	cmpq	$0x4, 0x8(%r11)
145433fa9:     	jne	0x145434140 <.text+0x5433140>
145433faf:     	movq	(%r11), %rax
145433fb2:     	cmpl	$0x6b636970, (%rax)     # imm = 0x6B636970
145433fb8:     	jne	0x145434140 <.text+0x5433140>
145433fbe:     	cmpq	$0x6, %rdi
145433fc2:     	jbe	0x145434064 <.text+0x5433064>
145433fc8:     	movq	0x60(%r11), %rax
145433fcc:     	movq	%r11, 0x3a8(%rbp)
145433fd3:     	movq	0x68(%r11), %rcx
145433fd7:     	movq	$0x0, 0x240(%rbp)
145433fe2:     	movq	%rcx, 0x248(%rbp)
145433fe9:     	movq	%rax, 0x250(%rbp)
145433ff0:     	movq	%rcx, 0x258(%rbp)
145433ff7:     	movq	$0x0, 0x260(%rbp)
145434002:     	movq	%rcx, 0x268(%rbp)
145434009:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
145434013:     	movq	%rax, 0x270(%rbp)
14543401a:     	movb	$0x1, 0x278(%rbp)
145434021:     	movw	$0x1, 0x280(%rbp)
14543402a:     	leaq	0x1d8(%rbp), %rcx
145434031:     	movq	%r14, %rdx
145434034:     	callq	0x14553d930 <.text+0x553c930>
145434039:     	nop
14543403a:     	movq	0x1d8(%rbp), %rdx
145434041:     	movq	0x1e0(%rbp), %rcx
145434048:     	movq	0x1e8(%rbp), %rsi
14543404f:     	movq	0x3a8(%rbp), %r11
145434056:     	movq	0x18(%r11), %r10
14543405a:     	testq	%r10, %r10
14543405d:     	jne	0x14543407a <.text+0x543307a>
14543405f:     	jmp	0x145434128 <.text+0x5433128>
145434064:     	movl	$0x1, %ecx
145434069:     	xorl	%edx, %edx
14543406b:     	xorl	%esi, %esi
14543406d:     	movq	0x18(%r11), %r10
145434071:     	testq	%r10, %r10
145434074:     	je	0x145434128 <.text+0x5433128>
14543407a:     	movq	0x10(%r11), %rbx
14543407e:     	cmpq	$0x1, %r10
145434082:     	jne	0x14543409b <.text+0x543309b>
145434084:     	movzbl	(%rbx), %eax
145434087:     	cmpl	$0x2b, %eax
14543408a:     	je	0x145434128 <.text+0x5433128>
145434090:     	cmpl	$0x2d, %eax
145434093:     	je	0x145434128 <.text+0x5433128>
145434099:     	jmp	0x14543409e <.text+0x543309e>
14543409b:     	movzbl	(%rbx), %eax
14543409e:     	xorl	%r8d, %r8d
1454340a1:     	cmpb	$0x2b, %al
1454340a3:     	sete	%r8b
1454340a7:     	movq	%r10, %rax
1454340aa:     	subq	%r8, %rax
1454340ad:     	addq	%r8, %rbx
1454340b0:     	cmpq	$0x3, %rax
1454340b4:     	jae	0x1454340e3 <.text+0x54330e3>
1454340b6:     	testq	%rax, %rax
1454340b9:     	je	0x145434181 <.text+0x5433181>
1454340bf:     	movzbl	(%rbx), %r13d
1454340c3:     	addl	$-0x30, %r13d
1454340c7:     	cmpl	$0x9, %r13d
1454340cb:     	ja	0x145434128 <.text+0x5433128>
1454340cd:     	cmpq	$0x1, %rax
1454340d1:     	jne	0x14543421b <.text+0x543321b>
1454340d7:     	movq	%rcx, 0x398(%rbp)
1454340de:     	jmp	0x14543418b <.text+0x543318b>
1454340e3:     	negq	%r8
1454340e6:     	addq	%r8, %r10
1454340e9:     	negq	%r10
1454340ec:     	xorl	%r8d, %r8d
1454340ef:     	xorl	%r13d, %r13d
1454340f2:     	movq	%r10, %rax
1454340f5:     	addq	%r8, %rax
1454340f8:     	je	0x14543428e <.text+0x543328e>
1454340fe:     	movl	%r13d, %eax
145434101:     	movb	$0xa, %r9b
145434104:     	mulb	%r9b
145434107:     	jo	0x145434128 <.text+0x5433128>
145434109:     	movl	%eax, %r13d
14543410c:     	movzbl	(%rbx,%r8), %r9d
145434111:     	addl	$-0x30, %r9d
145434115:     	addb	%r9b, %r13b
145434118:     	setb	%al
14543411b:     	cmpl	$0x9, %r9d
14543411f:     	ja	0x145434128 <.text+0x5433128>
145434121:     	incq	%r8
145434124:     	testb	%al, %al
145434126:     	je	0x1454340f2 <.text+0x54330f2>
145434128:     	testq	%rdx, %rdx
14543412b:     	je	0x145434140 <.text+0x5433140>
14543412d:     	movl	$0x1, %r8d
145434133:     	callq	0x1400021d0 <.text+0x11d0>
145434138:     	nopl	(%rax,%rax)
145434140:     	movq	0x220(%rbp), %rdx
145434147:     	testq	%rdx, %rdx
14543414a:     	je	0x145433e50 <.text+0x5432e50>
145434150:     	movq	0x228(%rbp), %rcx
145434157:     	shlq	$0x4, %rdx
14543415b:     	movl	$0x8, %r8d
145434161:     	callq	0x1400021d0 <.text+0x11d0>
145434166:     	movzbl	0x361(%rbp), %eax
14543416d:     	movq	$-0x1, %rdi
145434174:     	testb	$0x1, %al
145434176:     	je	0x145433e66 <.text+0x5432e66>
14543417c:     	jmp	0x145430852 <.text+0x542f852>
145434181:     	movq	%rcx, 0x398(%rbp)
145434188:     	xorl	%r13d, %r13d
14543418b:     	movq	0x28(%r11), %rbx
14543418f:     	testq	%rbx, %rbx
145434192:     	je	0x145434367 <.text+0x5433367>
145434198:     	movq	0x20(%r11), %rcx
14543419c:     	cmpq	$0x1, %rbx
1454341a0:     	jne	0x1454341bc <.text+0x54331bc>
1454341a2:     	movzbl	(%rcx), %r8d
1454341a6:     	cmpl	$0x2b, %r8d
1454341aa:     	je	0x145434367 <.text+0x5433367>
1454341b0:     	cmpl	$0x2d, %r8d
1454341b4:     	je	0x145434367 <.text+0x5433367>
1454341ba:     	jmp	0x1454341c0 <.text+0x54331c0>
1454341bc:     	movzbl	(%rcx), %r8d
1454341c0:     	xorl	%eax, %eax
1454341c2:     	cmpb	$0x2b, %r8b
1454341c6:     	sete	%al
1454341c9:     	movq	%rbx, %r8
1454341cc:     	subq	%rax, %r8
1454341cf:     	addq	%rax, %rcx
1454341d2:     	cmpq	$0x3, %r8
1454341d6:     	jae	0x145434245 <.text+0x5433245>
1454341d8:     	testq	%r8, %r8
1454341db:     	je	0x1454342a4 <.text+0x54332a4>
1454341e1:     	movzbl	(%rcx), %eax
1454341e4:     	addl	$-0x30, %eax
1454341e7:     	cmpl	$0x9, %eax
1454341ea:     	ja	0x145434367 <.text+0x5433367>
1454341f0:     	cmpq	$0x1, %r8
1454341f4:     	je	0x1454342a6 <.text+0x54332a6>
1454341fa:     	movzbl	0x1(%rcx), %ecx
1454341fe:     	addl	$-0x30, %ecx
145434201:     	cmpl	$0x9, %ecx
145434204:     	ja	0x145434367 <.text+0x5433367>
14543420a:     	movzbl	%al, %eax
14543420d:     	addl	%eax, %eax
14543420f:     	leal	(%rax,%rax,4), %eax
145434212:     	addb	%al, %cl
145434214:     	movl	%ecx, %eax
145434216:     	jmp	0x1454342a6 <.text+0x54332a6>
14543421b:     	movzbl	0x1(%rbx), %eax
14543421f:     	addl	$-0x30, %eax
145434222:     	cmpl	$0x9, %eax
145434225:     	ja	0x145434128 <.text+0x5433128>
14543422b:     	movq	%rcx, 0x398(%rbp)
145434232:     	movzbl	%r13b, %ecx
145434236:     	addl	%ecx, %ecx
145434238:     	leal	(%rcx,%rcx,4), %ecx
14543423b:     	addb	%cl, %al
14543423d:     	movl	%eax, %r13d
145434240:     	jmp	0x14543418b <.text+0x543318b>
145434245:     	negq	%rax
145434248:     	addq	%rax, %rbx
14543424b:     	negq	%rbx
14543424e:     	xorl	%r8d, %r8d
145434251:     	xorl	%eax, %eax
145434253:     	movq	%rbx, %r9
145434256:     	addq	%r8, %r9
145434259:     	je	0x1454342a6 <.text+0x54332a6>
14543425b:     	movb	$0xa, %r9b
14543425e:     	mulb	%r9b
145434261:     	jo	0x145434367 <.text+0x5433367>
145434267:     	movzbl	(%rcx,%r8), %r10d
14543426c:     	addl	$-0x30, %r10d
145434270:     	addb	%r10b, %al
145434273:     	setb	%r9b
145434277:     	cmpl	$0x9, %r10d
14543427b:     	ja	0x145434367 <.text+0x5433367>
145434281:     	incq	%r8
145434284:     	testb	%r9b, %r9b
145434287:     	je	0x145434253 <.text+0x5433253>
145434289:     	jmp	0x145434367 <.text+0x5433367>
14543428e:     	movq	%rcx, 0x398(%rbp)
145434295:     	cmpq	$0x2, %rdi
145434299:     	jne	0x14543418b <.text+0x543318b>
14543429f:     	jmp	0x145434bbf <.text+0x5433bbf>
1454342a4:     	xorl	%eax, %eax
1454342a6:     	movq	0x38(%r11), %rbx
1454342aa:     	testq	%rbx, %rbx
1454342ad:     	je	0x145434367 <.text+0x5433367>
1454342b3:     	movq	0x30(%r11), %rcx
1454342b7:     	cmpq	$0x1, %rbx
1454342bb:     	jne	0x1454342d7 <.text+0x54332d7>
1454342bd:     	movzbl	(%rcx), %r8d
1454342c1:     	cmpl	$0x2b, %r8d
1454342c5:     	je	0x145434367 <.text+0x5433367>
1454342cb:     	cmpl	$0x2d, %r8d
1454342cf:     	je	0x145434367 <.text+0x5433367>
1454342d5:     	jmp	0x1454342db <.text+0x54332db>
1454342d7:     	movzbl	(%rcx), %r8d
1454342db:     	xorl	%r9d, %r9d
1454342de:     	cmpb	$0x2b, %r8b
1454342e2:     	sete	%r9b
1454342e6:     	movq	%rbx, %r8
1454342e9:     	subq	%r9, %r8
1454342ec:     	addq	%r9, %rcx
1454342ef:     	cmpq	$0x3, %r8
1454342f3:     	movl	%eax, 0x388(%rbp)
1454342f9:     	jae	0x14543432b <.text+0x543332b>
1454342fb:     	testq	%r8, %r8
1454342fe:     	je	0x14543437c <.text+0x543337c>
145434300:     	movzbl	(%rcx), %eax
145434303:     	addl	$-0x30, %eax
145434306:     	cmpl	$0x9, %eax
145434309:     	ja	0x145434367 <.text+0x5433367>
14543430b:     	cmpq	$0x1, %r8
14543430f:     	je	0x14543437e <.text+0x543337e>
145434311:     	movzbl	0x1(%rcx), %ecx
145434315:     	addl	$-0x30, %ecx
145434318:     	cmpl	$0xa, %ecx
14543431b:     	jae	0x145434367 <.text+0x5433367>
14543431d:     	movzbl	%al, %eax
145434320:     	addl	%eax, %eax
145434322:     	leal	(%rax,%rax,4), %eax
145434325:     	addb	%al, %cl
145434327:     	movl	%ecx, %eax
145434329:     	jmp	0x14543437e <.text+0x543337e>
14543432b:     	negq	%r9
14543432e:     	addq	%r9, %rbx
145434331:     	negq	%rbx
145434334:     	xorl	%r8d, %r8d
145434337:     	xorl	%eax, %eax
145434339:     	movq	%rbx, %r9
14543433c:     	addq	%r8, %r9
14543433f:     	je	0x14543437e <.text+0x543337e>
145434341:     	movb	$0xa, %r9b
145434344:     	mulb	%r9b
145434347:     	jo	0x145434367 <.text+0x5433367>
145434349:     	movzbl	(%rcx,%r8), %r10d
14543434e:     	addl	$-0x30, %r10d
145434352:     	addb	%r10b, %al
145434355:     	setb	%r9b
145434359:     	cmpl	$0x9, %r10d
14543435d:     	ja	0x145434367 <.text+0x5433367>
14543435f:     	incq	%r8
145434362:     	testb	%r9b, %r9b
145434365:     	je	0x145434339 <.text+0x5433339>
145434367:     	testq	%rdx, %rdx
14543436a:     	movq	0x398(%rbp), %rcx
145434371:     	jne	0x14543412d <.text+0x543312d>
145434377:     	jmp	0x145434140 <.text+0x5433140>
14543437c:     	xorl	%eax, %eax
14543437e:     	movl	%eax, 0x318(%rbp)
145434384:     	movq	%rdx, 0x238(%rbp)
14543438b:     	cmpq	$0x4, %rdi
14543438f:     	movq	%r11, 0x3a8(%rbp)
145434396:     	je	0x145434bed <.text+0x5433bed>
14543439c:     	movq	0x40(%r11), %rax
1454343a0:     	movq	%rax, 0x1d0(%rbp)
1454343a7:     	movq	0x48(%r11), %rbx
1454343ab:     	movq	$0x1, 0x20(%rsp)
1454343b4:     	movl	$0x1, %r9d
1454343ba:     	leaq	0x58(%rbp), %rcx
1454343be:     	movq	%rbx, %rdx
1454343c1:     	xorl	%r8d, %r8d
1454343c4:     	callq	0x140188f20 <.text+0x187f20>
1454343c9:     	movq	0x60(%rbp), %rax
1454343cd:     	movq	%rax, 0x188(%rbp)
1454343d4:     	cmpb	$0x0, 0x58(%rbp)
1454343d8:     	jne	0x145434a9e <.text+0x5433a9e>
1454343de:     	movq	0x68(%rbp), %rax
1454343e2:     	testq	%rbx, %rbx
1454343e5:     	movq	%rax, 0x380(%rbp)
1454343ec:     	je	0x145434404 <.text+0x5433404>
1454343ee:     	movq	0x380(%rbp), %rcx
1454343f5:     	movq	0x1d0(%rbp), %rdx
1454343fc:     	movq	%rbx, %r8
1454343ff:     	callq	0x1457731ed <.text+0x57721ed>
145434404:     	movq	%rbx, 0x20(%rbp)
145434408:     	movq	0x3a8(%rbp), %rax
14543440f:     	movq	0x50(%rax), %rcx
145434413:     	movq	%rcx, 0x198(%rbp)
14543441a:     	movq	0x58(%rax), %rbx
14543441e:     	movq	$0x1, 0x20(%rsp)
145434427:     	movl	$0x1, %r9d
14543442d:     	leaq	0x58(%rbp), %rcx
145434431:     	movq	%rbx, %rdx
145434434:     	xorl	%r8d, %r8d
145434437:     	callq	0x140188f20 <.text+0x187f20>
14543443c:     	movzbl	0x58(%rbp), %eax
145434440:     	movq	0x60(%rbp), %rcx
145434444:     	movq	%rcx, 0x190(%rbp)
14543444b:     	movb	%al, 0x36f(%rbp)
145434451:     	testb	%al, %al
145434453:     	jne	0x145434abb <.text+0x5433abb>
145434459:     	movq	0x68(%rbp), %r10
14543445d:     	testq	%rbx, %rbx
145434460:     	movq	%rbx, %r9
145434463:     	movq	%rbx, 0x1d0(%rbp)
14543446a:     	je	0x14543448b <.text+0x543348b>
14543446c:     	movq	%r10, %rcx
14543446f:     	movq	0x198(%rbp), %rdx
145434476:     	movq	%r9, %r8
145434479:     	movq	%r10, %rbx
14543447c:     	callq	0x1457731ed <.text+0x57721ed>
145434481:     	movq	%rbx, %r10
145434484:     	movq	0x1d0(%rbp), %r9
14543448b:     	cmpq	$0x5, %rsi
14543448f:     	jne	0x1454344e9 <.text+0x54334e9>
145434491:     	movq	0x398(%rbp), %rcx
145434498:     	movl	(%rcx), %eax
14543449a:     	movzbl	0x4(%rcx), %edx
14543449e:     	shlq	$0x20, %rdx
1454344a2:     	orq	%rax, %rdx
1454344a5:     	movabsq	$-0x10000000000, %rax   # imm = 0xFFFFFF0000000000
1454344af:     	movq	0x138(%rbp), %rsi
1454344b6:     	andq	%rax, %rsi
1454344b9:     	orq	%rdx, %rsi
1454344bc:     	movq	0x238(%rbp), %rdx
1454344c3:     	testq	%rdx, %rdx
1454344c6:     	je	0x145434502 <.text+0x5433502>
1454344c8:     	movl	$0x1, %r8d
1454344ce:     	movq	%r10, %rbx
1454344d1:     	callq	0x1400021d0 <.text+0x11d0>
1454344d6:     	movq	%rbx, %r10
1454344d9:     	movq	0x1d0(%rbp), %r9
1454344e0:     	movq	%rsi, 0x138(%rbp)
1454344e7:     	jmp	0x14543454d <.text+0x543354d>
1454344e9:     	movq	0x238(%rbp), %rax
1454344f0:     	testq	%rax, %rax
1454344f3:     	je	0x14543450b <.text+0x543350b>
1454344f5:     	movq	0x398(%rbp), %rsi
1454344fc:     	cmpq	$-0x1, %rax
145434500:     	jne	0x14543451b <.text+0x543351b>
145434502:     	movq	%rsi, 0x138(%rbp)
145434509:     	jmp	0x14543454d <.text+0x543354d>
14543450b:     	movq	0x398(%rbp), %rax
145434512:     	movq	%rax, 0x138(%rbp)
145434519:     	jmp	0x14543454b <.text+0x543354b>
14543451b:     	movl	$0x1, %r8d
145434521:     	movq	0x398(%rbp), %rsi
145434528:     	movq	%rsi, %rcx
14543452b:     	movq	0x238(%rbp), %rdx
145434532:     	movq	%r10, %rbx
145434535:     	callq	0x1400021d0 <.text+0x11d0>
14543453a:     	movq	%rbx, %r10
14543453d:     	movq	0x1d0(%rbp), %r9
145434544:     	movq	%rsi, 0x138(%rbp)
14543454b:     	xorl	%esi, %esi
14543454d:     	movl	0x388(%rbp), %ecx
145434553:     	movl	0x318(%rbp), %edx
145434559:     	movq	0x380(%rbp), %r8
145434560:     	movabsq	$0x64006400640064, %rax # imm = 0x64006400640064
14543456a:     	cmpq	$0x8, %rdi
14543456e:     	movq	0x20(%rbp), %rbx
145434572:     	jb	0x1454345b0 <.text+0x54335b0>
145434574:     	movq	%r10, 0x198(%rbp)
14543457b:     	movq	%r9, %rdi
14543457e:     	movq	0x3a8(%rbp), %rax
145434585:     	movq	0x70(%rax), %rcx
145434589:     	movq	0x78(%rax), %rdx
14543458d:     	callq	0x1454512d0 <.text+0x54502d0>
145434592:     	nop
145434593:     	movl	0x388(%rbp), %ecx
145434599:     	movl	0x318(%rbp), %edx
14543459f:     	movq	0x380(%rbp), %r8
1454345a6:     	movq	%rdi, %r9
1454345a9:     	movq	0x198(%rbp), %r10
1454345b0:     	movb	%r13b, 0x278(%rbp)
1454345b7:     	movb	%cl, 0x279(%rbp)
1454345bd:     	movb	%dl, 0x27a(%rbp)
1454345c3:     	movq	0x190(%rbp), %rcx
1454345ca:     	movq	%rcx, 0x240(%rbp)
1454345d1:     	movq	%r10, 0x248(%rbp)
1454345d8:     	movq	%r9, 0x250(%rbp)
1454345df:     	movq	0x188(%rbp), %rcx
1454345e6:     	movq	%rcx, 0x258(%rbp)
1454345ed:     	movq	%r8, 0x260(%rbp)
1454345f4:     	movq	%rbx, 0x268(%rbp)
1454345fb:     	movl	%esi, 0x27b(%rbp)
145434601:     	shrq	$0x20, %rsi
145434605:     	movb	%sil, 0x27f(%rbp)
14543460c:     	movq	%rax, 0x270(%rbp)
145434613:     	movb	$0x0, 0x3a7(%rbp)
14543461a:     	leaq	0x1d8(%rbp), %rcx
145434621:     	movq	%r14, %rdx
145434624:     	callq	0x14543a2a0 <.text+0x54392a0>
145434629:     	nop
14543462a:     	movq	0x1d8(%rbp), %rdi
145434631:     	leaq	0x1e0(%rbp), %rax
145434638:     	movups	(%rax), %xmm0
14543463b:     	movups	0x10(%rax), %xmm1
14543463f:     	movups	0x20(%rax), %xmm2
145434643:     	movaps	%xmm0, 0xe0(%rbp)
14543464a:     	movaps	%xmm1, 0xf0(%rbp)
145434651:     	movaps	%xmm2, 0x100(%rbp)
145434658:     	movq	0x30(%rax), %rax
14543465c:     	movq	%rax, 0x110(%rbp)
145434663:     	movq	0x220(%rbp), %rdx
14543466a:     	testq	%rdx, %rdx
14543466d:     	je	0x145433e37 <.text+0x5432e37>
145434673:     	shlq	$0x4, %rdx
145434677:     	movl	$0x8, %r8d
14543467d:     	movq	0x3a8(%rbp), %rcx
145434684:     	callq	0x1400021d0 <.text+0x11d0>
145434689:     	jmp	0x145433e37 <.text+0x5432e37>
14543468e:     	movq	0xd0(%rbp), %rsi
145434695:     	cmpq	$0x15, %r14
145434699:     	jae	0x145434b23 <.text+0x5433b23>
14543469f:     	leaq	(%rsi,%r14,4), %rax
1454346a3:     	leaq	0x4(%rsi), %rcx
1454346a7:     	movl	$0x4, %edx
1454346ac:     	jmp	0x1454346c1 <.text+0x54336c1>
1454346ae:     	movq	%rsi, %r9
1454346b1:     	movl	%r8d, (%r9)
1454346b4:     	addq	$0x4, %rcx
1454346b8:     	addq	$0x4, %rdx
1454346bc:     	cmpq	%rax, %rcx
1454346bf:     	je	0x1454346ed <.text+0x54336ed>
1454346c1:     	movl	-0x4(%rcx), %r10d
1454346c5:     	movl	(%rcx), %r8d
1454346c8:     	cmpl	%r10d, %r8d
1454346cb:     	jae	0x1454346b4 <.text+0x54336b4>
1454346cd:     	movq	%rdx, %r9
1454346d0:     	movl	%r10d, (%rsi,%r9)
1454346d4:     	cmpq	$0x4, %r9
1454346d8:     	je	0x1454346ae <.text+0x54336ae>
1454346da:     	movl	-0x8(%rsi,%r9), %r10d
1454346df:     	addq	$-0x4, %r9
1454346e3:     	cmpl	%r10d, %r8d
1454346e6:     	jb	0x1454346d0 <.text+0x54336d0>
1454346e8:     	addq	%rsi, %r9
1454346eb:     	jmp	0x1454346b1 <.text+0x54336b1>
1454346ed:     	movq	0xd8(%rbp), %r14
1454346f4:     	cmpq	$0x2, %r14
1454346f8:     	jb	0x145431137 <.text+0x5430137>
1454346fe:     	movq	0xd0(%rbp), %rsi
145434705:     	leaq	-0x1(%r14), %rax
145434709:     	xorl	%edx, %edx
14543470b:     	movl	0x4(%rsi,%rdx,4), %ecx
14543470f:     	cmpl	(%rsi,%rdx,4), %ecx
145434712:     	je	0x145434974 <.text+0x5433974>
145434718:     	incq	%rdx
14543471b:     	cmpq	%rdx, %rax
14543471e:     	jne	0x14543470b <.text+0x543370b>
145434720:     	jmp	0x145431137 <.text+0x5430137>
145434725:     	movq	0x1a8(%rbp), %r14
14543472c:     	cmpq	$0x15, %rsi
145434730:     	jae	0x145434b3b <.text+0x5433b3b>
145434736:     	shlq	$0x5, %rsi
14543473a:     	movl	$0x20, %edi
14543473f:     	leaq	(%r14,%rdi), %rdx
145434743:     	movq	%r14, %rcx
145434746:     	callq	0x1455032b0 <.text+0x55022b0>
14543474b:     	addq	$0x20, %rdi
14543474f:     	cmpq	%rdi, %rsi
145434752:     	jne	0x14543473f <.text+0x543373f>
145434754:     	jmp	0x14543253d <.text+0x543153d>
145434759:     	movq	0x48(%rbp), %rcx
14543475d:     	cmpq	$0x15, %rdx
145434761:     	jae	0x145434b53 <.text+0x5433b53>
145434767:     	leaq	0x3b7(%rbp), %r9
14543476e:     	movl	$0x1, %r8d
145434774:     	callq	0x140ad0670 <.text+0xacf670>
145434779:     	jmp	0x1454325de <.text+0x54315de>
14543477e:     	movq	0x30(%rbp), %r14
145434782:     	cmpq	$0x15, %rsi
145434786:     	jae	0x145434b65 <.text+0x5433b65>
14543478c:     	shlq	$0x5, %rsi
145434790:     	movl	$0x20, %edi
145434795:     	leaq	(%r14,%rdi), %rdx
145434799:     	movq	%r14, %rcx
14543479c:     	callq	0x1455033c0 <.text+0x55023c0>
1454347a1:     	addq	$0x20, %rdi
1454347a5:     	cmpq	%rdi, %rsi
1454347a8:     	jne	0x145434795 <.text+0x5433795>
1454347aa:     	jmp	0x14543267c <.text+0x543167c>
1454347af:     	movq	0x148(%rbp), %rcx
1454347b6:     	cmpq	$0x15, %rdx
1454347ba:     	jae	0x145434b7d <.text+0x5433b7d>
1454347c0:     	leaq	0x3b7(%rbp), %r9
1454347c7:     	movl	$0x1, %r8d
1454347cd:     	callq	0x1455075b0 <.text+0x55065b0>
1454347d2:     	movq	0x150(%rbp), %rcx
1454347d9:     	cmpq	$0x2, %rcx
1454347dd:     	jb	0x145432c95 <.text+0x5431c95>
1454347e3:     	movl	$0x1, %eax
1454347e8:     	movl	$0x20, %edx
1454347ed:     	movq	0x148(%rbp), %r8
1454347f4:     	jmp	0x145434806 <.text+0x5433806>
1454347f6:     	incq	%rax
1454347f9:     	addq	$0x10, %rdx
1454347fd:     	cmpq	%rax, %rcx
145434800:     	je	0x145432c95 <.text+0x5431c95>
145434806:     	movzbl	-0x10(%r8,%rdx), %r9d
14543480c:     	cmpb	-0x20(%r8,%rdx), %r9b
145434811:     	jne	0x1454347f6 <.text+0x54337f6>
145434813:     	movq	-0x18(%r8,%rdx), %r9
145434818:     	cmpq	%r9, -0x8(%r8,%rdx)
14543481d:     	jne	0x1454347f6 <.text+0x54337f6>
14543481f:     	leaq	0x1(%rax), %r9
145434823:     	cmpq	%rcx, %r9
145434826:     	jae	0x145434a66 <.text+0x5433a66>
14543482c:     	shlq	$0x4, %rcx
145434830:     	jmp	0x145434851 <.text+0x5433851>
145434832:     	leaq	(%r8,%rdx), %r10
145434836:     	addq	%r8, %r9
145434839:     	movups	(%r10), %xmm0
14543483d:     	movups	%xmm0, (%r9)
145434841:     	incq	%rax
145434844:     	addq	$0x10, %rdx
145434848:     	cmpq	%rdx, %rcx
14543484b:     	je	0x145434a66 <.text+0x5433a66>
145434851:     	movq	%rax, %r9
145434854:     	shlq	$0x4, %r9
145434858:     	movzbl	(%r8,%rdx), %r10d
14543485d:     	cmpb	-0x10(%r8,%r9), %r10b
145434862:     	jne	0x145434832 <.text+0x5433832>
145434864:     	movq	-0x8(%r8,%r9), %r10
145434869:     	cmpq	%r10, 0x8(%r8,%rdx)
14543486e:     	je	0x145434844 <.text+0x5433844>
145434870:     	jmp	0x145434832 <.text+0x5433832>
145434872:     	movq	0xb8(%rbp), %r14
145434879:     	cmpq	$0x15, %rsi
14543487d:     	jae	0x145434b8f <.text+0x5433b8f>
145434883:     	shlq	$0x5, %rsi
145434887:     	movl	$0x20, %edi
14543488c:     	leaq	(%r14,%rdi), %rdx
145434890:     	movq	%r14, %rcx
145434893:     	callq	0x1455032b0 <.text+0x55022b0>
145434898:     	addq	$0x20, %rdi
14543489c:     	cmpq	%rdi, %rsi
14543489f:     	jne	0x14543488c <.text+0x543388c>
1454348a1:     	jmp	0x145432d2f <.text+0x5431d2f>
1454348a6:     	movq	0x128(%rbp), %rsi
1454348ad:     	cmpq	$0x15, %r14
1454348b1:     	jae	0x145434ba7 <.text+0x5433ba7>
1454348b7:     	leaq	(%rsi,%r14,4), %rax
1454348bb:     	leaq	0x4(%rsi), %rcx
1454348bf:     	movl	$0x4, %edx
1454348c4:     	jmp	0x1454348d9 <.text+0x54338d9>
1454348c6:     	movq	%rsi, %r9
1454348c9:     	movl	%r8d, (%r9)
1454348cc:     	addq	$0x4, %rcx
1454348d0:     	addq	$0x4, %rdx
1454348d4:     	cmpq	%rax, %rcx
1454348d7:     	je	0x145434905 <.text+0x5433905>
1454348d9:     	movl	-0x4(%rcx), %r10d
1454348dd:     	movl	(%rcx), %r8d
1454348e0:     	cmpl	%r10d, %r8d
1454348e3:     	jae	0x1454348cc <.text+0x54338cc>
1454348e5:     	movq	%rdx, %r9
1454348e8:     	movl	%r10d, (%rsi,%r9)
1454348ec:     	cmpq	$0x4, %r9
1454348f0:     	je	0x1454348c6 <.text+0x54338c6>
1454348f2:     	movl	-0x8(%rsi,%r9), %r10d
1454348f7:     	addq	$-0x4, %r9
1454348fb:     	cmpl	%r10d, %r8d
1454348fe:     	jb	0x1454348e8 <.text+0x54338e8>
145434900:     	addq	%rsi, %r9
145434903:     	jmp	0x1454348c9 <.text+0x54338c9>
145434905:     	movq	0x130(%rbp), %r14
14543490c:     	cmpq	$0x2, %r14
145434910:     	jb	0x145432dd6 <.text+0x5431dd6>
145434916:     	movq	0x128(%rbp), %rsi
14543491d:     	leaq	-0x1(%r14), %rax
145434921:     	xorl	%edx, %edx
145434923:     	movl	0x4(%rsi,%rdx,4), %ecx
145434927:     	cmpl	(%rsi,%rdx,4), %ecx
14543492a:     	je	0x1454349ed <.text+0x54339ed>
145434930:     	incq	%rdx
145434933:     	cmpq	%rdx, %rax
145434936:     	jne	0x145434923 <.text+0x5433923>
145434938:     	jmp	0x145432dd6 <.text+0x5431dd6>
14543493d:     	movq	0x110(%rbp), %rax
145434944:     	movq	%rax, 0x90(%rbp)
14543494b:     	movaps	0xe0(%rbp), %xmm0
145434952:     	movaps	0xf0(%rbp), %xmm1
145434959:     	movaps	0x100(%rbp), %xmm2
145434960:     	movups	%xmm2, 0x80(%rbp)
145434967:     	movups	%xmm1, 0x70(%rbp)
14543496b:     	movups	%xmm0, 0x60(%rbp)
14543496f:     	jmp	0x145430852 <.text+0x542f852>
145434974:     	leaq	0x2(%rdx), %rcx
145434978:     	leaq	0x1(%rdx), %rax
14543497c:     	cmpq	%r14, %rcx
14543497f:     	jae	0x1454349ab <.text+0x54339ab>
145434981:     	movl	%r14d, %r9d
145434984:     	subl	%edx, %r9d
145434987:     	leaq	-0x3(%r14), %r8
14543498b:     	testb	$0x1, %r9b
14543498f:     	je	0x1454349a6 <.text+0x54339a6>
145434991:     	movl	0x8(%rsi,%rdx,4), %ecx
145434995:     	cmpl	(%rsi,%rdx,4), %ecx
145434998:     	je	0x1454349a2 <.text+0x54339a2>
14543499a:     	movl	%ecx, 0x4(%rsi,%rdx,4)
14543499e:     	leaq	0x2(%rdx), %rax
1454349a2:     	leaq	0x3(%rdx), %rcx
1454349a6:     	cmpq	%rdx, %r8
1454349a9:     	jne	0x1454349c0 <.text+0x54339c0>
1454349ab:     	movq	%rax, 0xd8(%rbp)
1454349b2:     	jmp	0x145431137 <.text+0x5430137>
1454349b7:     	addq	$0x2, %rcx
1454349bb:     	cmpq	%rcx, %r14
1454349be:     	je	0x1454349ab <.text+0x54339ab>
1454349c0:     	movl	(%rsi,%rcx,4), %edx
1454349c3:     	cmpl	-0x4(%rsi,%rax,4), %edx
1454349c7:     	jne	0x1454349d5 <.text+0x54339d5>
1454349c9:     	movl	0x4(%rsi,%rcx,4), %edx
1454349cd:     	cmpl	-0x4(%rsi,%rax,4), %edx
1454349d1:     	je	0x1454349b7 <.text+0x54339b7>
1454349d3:     	jmp	0x1454349e5 <.text+0x54339e5>
1454349d5:     	movl	%edx, (%rsi,%rax,4)
1454349d8:     	incq	%rax
1454349db:     	movl	0x4(%rsi,%rcx,4), %edx
1454349df:     	cmpl	-0x4(%rsi,%rax,4), %edx
1454349e3:     	je	0x1454349b7 <.text+0x54339b7>
1454349e5:     	movl	%edx, (%rsi,%rax,4)
1454349e8:     	incq	%rax
1454349eb:     	jmp	0x1454349b7 <.text+0x54339b7>
1454349ed:     	leaq	0x2(%rdx), %rcx
1454349f1:     	leaq	0x1(%rdx), %rax
1454349f5:     	cmpq	%r14, %rcx
1454349f8:     	jae	0x145434a24 <.text+0x5433a24>
1454349fa:     	movl	%r14d, %r9d
1454349fd:     	subl	%edx, %r9d
145434a00:     	leaq	-0x3(%r14), %r8
145434a04:     	testb	$0x1, %r9b
145434a08:     	je	0x145434a1f <.text+0x5433a1f>
145434a0a:     	movl	0x8(%rsi,%rdx,4), %ecx
145434a0e:     	cmpl	(%rsi,%rdx,4), %ecx
145434a11:     	je	0x145434a1b <.text+0x5433a1b>
145434a13:     	movl	%ecx, 0x4(%rsi,%rdx,4)
145434a17:     	leaq	0x2(%rdx), %rax
145434a1b:     	leaq	0x3(%rdx), %rcx
145434a1f:     	cmpq	%rdx, %r8
145434a22:     	jne	0x145434a39 <.text+0x5433a39>
145434a24:     	movq	%rax, 0x130(%rbp)
145434a2b:     	jmp	0x145432dd6 <.text+0x5431dd6>
145434a30:     	addq	$0x2, %rcx
145434a34:     	cmpq	%rcx, %r14
145434a37:     	je	0x145434a24 <.text+0x5433a24>
145434a39:     	movl	(%rsi,%rcx,4), %edx
145434a3c:     	cmpl	-0x4(%rsi,%rax,4), %edx
145434a40:     	jne	0x145434a4e <.text+0x5433a4e>
145434a42:     	movl	0x4(%rsi,%rcx,4), %edx
145434a46:     	cmpl	-0x4(%rsi,%rax,4), %edx
145434a4a:     	je	0x145434a30 <.text+0x5433a30>
145434a4c:     	jmp	0x145434a5e <.text+0x5433a5e>
145434a4e:     	movl	%edx, (%rsi,%rax,4)
145434a51:     	incq	%rax
145434a54:     	movl	0x4(%rsi,%rcx,4), %edx
145434a58:     	cmpl	-0x4(%rsi,%rax,4), %edx
145434a5c:     	je	0x145434a30 <.text+0x5433a30>
145434a5e:     	movl	%edx, (%rsi,%rax,4)
145434a61:     	incq	%rax
145434a64:     	jmp	0x145434a30 <.text+0x5433a30>
145434a66:     	movq	%rax, 0x150(%rbp)
145434a6d:     	jmp	0x145432c95 <.text+0x5431c95>
145434a72:     	leaq	0x1308ed7(%rip), %r8    # 0x14673d950
145434a79:     	movq	%rsi, %rcx
145434a7c:     	callq	0x145903b33 <.text+0x5902b33>
145434a81:     	nop
145434a82:     	jmp	0x145434c0b <.text+0x5433c0b>
145434a87:     	leaq	0x1308eda(%rip), %r8    # 0x14673d968
145434a8e:     	movl	$0x13, %edx
145434a93:     	callq	0x145903b33 <.text+0x5902b33>
145434a98:     	nop
145434a99:     	jmp	0x145434c0b <.text+0x5433c0b>
145434a9e:     	movq	0x68(%rbp), %rdx
145434aa2:     	movb	$0x1, 0x3a7(%rbp)
145434aa9:     	movq	0x188(%rbp), %rcx
145434ab0:     	callq	0x14590379b <.text+0x590279b>
145434ab5:     	nop
145434ab6:     	jmp	0x145434c0b <.text+0x5433c0b>
145434abb:     	movq	0x68(%rbp), %rdx
145434abf:     	movq	0x190(%rbp), %rcx
145434ac6:     	callq	0x14590379b <.text+0x590279b>
145434acb:     	nop
145434acc:     	jmp	0x145434c0b <.text+0x5433c0b>
145434ad1:     	leaq	0x1308e50(%rip), %r8    # 0x14673d928
145434ad8:     	movl	$0x3, %edx
145434add:     	movq	%r12, %rcx
145434ae0:     	callq	0x145903b33 <.text+0x5902b33>
145434ae5:     	nop
145434ae6:     	jmp	0x145434c0b <.text+0x5433c0b>
145434aeb:     	leaq	0x1308e8e(%rip), %r8    # 0x14673d980
145434af2:     	movq	%rsi, %rcx
145434af5:     	callq	0x145903b33 <.text+0x5902b33>
145434afa:     	nop
145434afb:     	jmp	0x145434c0b <.text+0x5433c0b>
145434b00:     	leaq	0x1308e91(%rip), %r8    # 0x14673d998
145434b07:     	movl	$0x13, %edx
145434b0c:     	callq	0x145903b33 <.text+0x5902b33>
145434b11:     	nop
145434b12:     	jmp	0x145434c0b <.text+0x5433c0b>
145434b17:     	movq	%r14, 0x380(%rbp)
145434b1e:     	jmp	0x145433146 <.text+0x5432146>
145434b23:     	leaq	0x3b7(%rbp), %r8
145434b2a:     	movq	%rsi, %rcx
145434b2d:     	movq	%r14, %rdx
145434b30:     	callq	0x14506f770 <.text+0x506e770>
145434b35:     	nop
145434b36:     	jmp	0x145434705 <.text+0x5433705>
145434b3b:     	leaq	0x3b7(%rbp), %r8
145434b42:     	movq	%r14, %rcx
145434b45:     	movq	%rsi, %rdx
145434b48:     	callq	0x1454811a0 <.text+0x54801a0>
145434b4d:     	nop
145434b4e:     	jmp	0x14543253d <.text+0x543153d>
145434b53:     	leaq	0x3b7(%rbp), %r8
145434b5a:     	callq	0x145637520 <.text+0x5636520>
145434b5f:     	nop
145434b60:     	jmp	0x1454325de <.text+0x54315de>
145434b65:     	leaq	0x3b7(%rbp), %r8
145434b6c:     	movq	%r14, %rcx
145434b6f:     	movq	%rsi, %rdx
145434b72:     	callq	0x145481340 <.text+0x5480340>
145434b77:     	nop
145434b78:     	jmp	0x14543267c <.text+0x543167c>
145434b7d:     	leaq	0x3b7(%rbp), %r8
145434b84:     	callq	0x145502d30 <.text+0x5501d30>
145434b89:     	nop
145434b8a:     	jmp	0x1454347d2 <.text+0x54337d2>
145434b8f:     	leaq	0x3b7(%rbp), %r8
145434b96:     	movq	%r14, %rcx
145434b99:     	movq	%rsi, %rdx
145434b9c:     	callq	0x1454811a0 <.text+0x54801a0>
145434ba1:     	nop
145434ba2:     	jmp	0x145432d2f <.text+0x5431d2f>
145434ba7:     	leaq	0x3b7(%rbp), %r8
145434bae:     	movq	%rsi, %rcx
145434bb1:     	movq	%r14, %rdx
145434bb4:     	callq	0x14506f770 <.text+0x506e770>
145434bb9:     	nop
145434bba:     	jmp	0x14543491d <.text+0x543391d>
145434bbf:     	movq	%rdx, 0x238(%rbp)
145434bc6:     	movq	%r11, 0x3a8(%rbp)
145434bcd:     	movb	$0x1, 0x3a7(%rbp)
145434bd4:     	leaq	0x1308f25(%rip), %r8    # 0x14673db00
145434bdb:     	movl	$0x2, %ecx
145434be0:     	movl	$0x2, %edx
145434be5:     	callq	0x145903b33 <.text+0x5902b33>
145434bea:     	nop
145434beb:     	jmp	0x145434c0b <.text+0x5433c0b>
145434bed:     	movb	$0x1, 0x3a7(%rbp)
145434bf4:     	leaq	0x1308f1d(%rip), %r8    # 0x14673db18
145434bfb:     	movl	$0x4, %ecx
145434c00:     	movl	$0x4, %edx
145434c05:     	callq	0x145903b33 <.text+0x5902b33>
145434c0a:     	nop
145434c0b:     	ud2

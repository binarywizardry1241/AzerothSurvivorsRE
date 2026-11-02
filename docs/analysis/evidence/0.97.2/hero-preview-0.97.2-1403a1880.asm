
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403a1880:     	pushq	%rbp
1403a1881:     	pushq	%r15
1403a1883:     	pushq	%r14
1403a1885:     	pushq	%r13
1403a1887:     	pushq	%r12
1403a1889:     	pushq	%rsi
1403a188a:     	pushq	%rdi
1403a188b:     	pushq	%rbx
1403a188c:     	subq	$0xb8, %rsp
1403a1893:     	leaq	0x80(%rsp), %rbp
1403a189b:     	movq	$-0x2, 0x30(%rbp)
1403a18a3:     	movq	(%rdx), %rsi
1403a18a6:     	movq	0x8(%rdx), %rdi
1403a18aa:     	movl	0x14(%rdx), %ebx
1403a18ad:     	leaq	-0x40(%rbp), %rcx
1403a18b1:     	callq	0x1407a2100 <.text+0x7a1100>
1403a18b6:     	cmpb	$0x2, -0x40(%rbp)
1403a18ba:     	je	0x1403a1c33 <.text+0x3a0c33>
1403a18c0:     	movl	%ebx, -0x4(%rbp)
1403a18c3:     	movq	-0x30(%rbp), %rax
1403a18c7:     	movq	%rax, 0x20(%rbp)
1403a18cb:     	movupd	-0x40(%rbp), %xmm0
1403a18d0:     	movapd	%xmm0, 0x10(%rbp)
1403a18d5:     	movq	0xf8(%rsi), %r14
1403a18dc:     	movq	0x100(%rsi), %rax
1403a18e3:     	leaq	(%r14,%rax,4), %r15
1403a18e7:     	movq	%rsi, -0x48(%rbp)
1403a18eb:     	movzbl	0x108(%rsi), %ecx
1403a18f2:     	xorl	%r12d, %r12d
1403a18f5:     	movl	$0x8, %eax
1403a18fa:     	movq	%rax, -0x50(%rbp)
1403a18fe:     	movq	$0x0, -0x18(%rbp)
1403a1906:     	xorl	%r13d, %r13d
1403a1909:     	movzbl	0x10(%rbp), %eax
1403a190d:     	movb	%al, (%rbp)
1403a1910:     	movq	0x18(%rbp), %rax
1403a1914:     	movq	%rax, 0x8(%rbp)
1403a1918:     	movzwl	0x11(%rbp), %edx
1403a191c:     	movzbl	0x13(%rbp), %r10d
1403a1921:     	shll	$0x10, %r10d
1403a1925:     	orq	%rdx, %r10
1403a1928:     	movl	0x14(%rbp), %r8d
1403a192c:     	movl	0x18(%rbp), %r11d
1403a1930:     	movl	0x1c(%rbp), %r9d
1403a1934:     	movl	0x20(%rbp), %esi
1403a1937:     	shlq	$0x20, %rsi
1403a193b:     	orq	%r9, %rsi
1403a193e:     	movq	%rsi, -0x58(%rbp)
1403a1942:     	shlq	$0x18, %rsi
1403a1946:     	movl	%r11d, %r9d
1403a1949:     	shrl	$0x8, %r9d
1403a194d:     	orq	%rsi, %r9
1403a1950:     	shlq	$0x38, %r11
1403a1954:     	shlq	$0x18, %r8
1403a1958:     	orq	%r10, %r8
1403a195b:     	orq	%r11, %r8
1403a195e:     	testb	%cl, %cl
1403a1960:     	je	0x1403a19e0 <.text+0x3a09e0>
1403a1966:     	cmpl	%r13d, %r12d
1403a1969:     	jne	0x1403a19d0 <.text+0x3a09d0>
1403a196b:     	nopl	(%rax,%rax)
1403a1970:     	cmpq	%r15, %r14
1403a1973:     	je	0x1403a1c19 <.text+0x3a0c19>
1403a1979:     	movl	(%r14), %r11d
1403a197c:     	addq	$0x4, %r14
1403a1980:     	movq	0x1a8(%rdi), %r10
1403a1987:     	leaq	(%r11,%r11,8), %r11
1403a198b:     	movq	0x10(%r10,%r11,8), %r13
1403a1990:     	testq	%r13, %r13
1403a1993:     	je	0x1403a1970 <.text+0x3a0970>
1403a1995:     	leaq	(%r10,%r11,8), %r10
1403a1999:     	movq	-0x48(%rbp), %rax
1403a199d:     	movq	0x110(%rax), %r11
1403a19a4:     	movq	0x18(%r10), %rsi
1403a19a8:     	movq	0x38(%r10), %r10
1403a19ac:     	movq	(%r10,%r11,8), %r10
1403a19b0:     	notq	%r10
1403a19b3:     	leaq	(%r10,%r10,2), %r10
1403a19b7:     	shlq	$0x4, %r10
1403a19bb:     	movq	0x10(%rsi,%r10), %rax
1403a19c0:     	movq	%rax, -0x18(%rbp)
1403a19c4:     	movq	0x28(%rsi,%r10), %rax
1403a19c9:     	movq	%rax, -0x28(%rbp)
1403a19cd:     	xorl	%r12d, %r12d
1403a19d0:     	movl	%r12d, %r10d
1403a19d3:     	jmp	0x1403a1a82 <.text+0x3a0a82>
1403a19d8:     	nopl	(%rax,%rax)
1403a19e0:     	cmpl	%r13d, %r12d
1403a19e3:     	jne	0x1403a1a6f <.text+0x3a0a6f>
1403a19e9:     	nopl	(%rax)
1403a19f0:     	cmpq	%r15, %r14
1403a19f3:     	je	0x1403a1c19 <.text+0x3a0c19>
1403a19f9:     	movl	(%r14), %r11d
1403a19fc:     	addq	$0x4, %r14
1403a1a00:     	movq	0x108(%rdi), %r10
1403a1a07:     	leaq	(%r11,%r11,4), %r11
1403a1a0b:     	shlq	$0x5, %r11
1403a1a0f:     	movq	0x58(%r10,%r11), %r13
1403a1a14:     	testq	%r13, %r13
1403a1a17:     	je	0x1403a19f0 <.text+0x3a09f0>
1403a1a19:     	addq	%r11, %r10
1403a1a1c:     	movl	0x94(%r10), %r11d
1403a1a23:     	movq	0x1a8(%rdi), %rsi
1403a1a2a:     	leaq	(%r11,%r11,8), %r11
1403a1a2e:     	movq	-0x48(%rbp), %rax
1403a1a32:     	movq	0x110(%rax), %rbx
1403a1a39:     	movq	0x18(%rsi,%r11,8), %r12
1403a1a3e:     	movq	0x38(%rsi,%r11,8), %r11
1403a1a43:     	movq	(%r11,%rbx,8), %r11
1403a1a47:     	notq	%r11
1403a1a4a:     	leaq	(%r11,%r11,2), %r11
1403a1a4e:     	shlq	$0x4, %r11
1403a1a52:     	movq	0x10(%r12,%r11), %rax
1403a1a57:     	movq	%rax, -0x18(%rbp)
1403a1a5b:     	movq	0x28(%r12,%r11), %rax
1403a1a60:     	movq	%rax, -0x28(%rbp)
1403a1a64:     	movq	0x50(%r10), %rax
1403a1a68:     	movq	%rax, -0x50(%rbp)
1403a1a6c:     	xorl	%r12d, %r12d
1403a1a6f:     	movl	%r12d, %r10d
1403a1a72:     	shlq	$0x4, %r10
1403a1a76:     	movq	-0x50(%rbp), %rax
1403a1a7a:     	movl	0x8(%rax,%r10), %r10d
1403a1a7f:     	notl	%r10d
1403a1a82:     	movq	%r10, %r11
1403a1a85:     	shlq	$0x7, %r11
1403a1a89:     	leaq	(%r11,%r10,8), %r11
1403a1a8d:     	addq	-0x18(%rbp), %r11
1403a1a91:     	movq	-0x28(%rbp), %rax
1403a1a95:     	leaq	(%rax,%r10,4), %rsi
1403a1a99:     	incl	%r12d
1403a1a9c:     	cmpb	$0x0, 0x20(%r11)
1403a1aa1:     	je	0x1403a1b00 <.text+0x3a0b00>
1403a1aa3:     	testb	$0x1, (%rbp)
1403a1aa7:     	je	0x1403a1b37 <.text+0x3a0b37>
1403a1aad:     	movq	%rsi, %rdx
1403a1ab0:     	movq	%r11, %rsi
1403a1ab3:     	movq	0x24(%r11), %r11
1403a1ab7:     	movl	0x2c(%rsi), %eax
1403a1aba:     	movzbl	0x30(%rsi), %r10d
1403a1abf:     	shlq	$0x20, %r10
1403a1ac3:     	orq	%rax, %r10
1403a1ac6:     	shldq	$0x18, %r11, %r10
1403a1acb:     	shlq	$0x18, %r11
1403a1acf:     	movzwl	0x21(%rsi), %eax
1403a1ad3:     	movl	%ecx, %ebx
1403a1ad5:     	movzbl	0x23(%rsi), %ecx
1403a1ad9:     	shll	$0x10, %ecx
1403a1adc:     	orq	%rax, %rcx
1403a1adf:     	orq	%r11, %rcx
1403a1ae2:     	xorq	%r8, %rcx
1403a1ae5:     	xorq	%r9, %r10
1403a1ae8:     	orq	%rcx, %r10
1403a1aeb:     	movl	%ebx, %ecx
1403a1aed:     	je	0x1403a195e <.text+0x3a095e>
1403a1af3:     	jmp	0x1403a1b60 <.text+0x3a0b60>
1403a1af5:     	nopw	%cs:(%rax,%rax)
1403a1b00:     	cmpb	$0x1, (%rbp)
1403a1b04:     	je	0x1403a1b58 <.text+0x3a0b58>
1403a1b06:     	movq	0x28(%r11), %r10
1403a1b0a:     	movq	0x68(%r10), %xmm0
1403a1b10:     	movq	0x8(%rbp), %rax
1403a1b14:     	movq	0x68(%rax), %xmm1
1403a1b19:     	pcmpeqd	%xmm0, %xmm1
1403a1b1d:     	pshufd	$0x50, %xmm1, %xmm0     # xmm0 = xmm1[0,0,1,1]
1403a1b22:     	movmskpd	%xmm0, %r10d
1403a1b27:     	cmpl	$0x3, %r10d
1403a1b2b:     	je	0x1403a195e <.text+0x3a095e>
1403a1b31:     	movq	0x8(%rbp), %rax
1403a1b35:     	jmp	0x1403a1b3b <.text+0x3a0b3b>
1403a1b37:     	movq	0x18(%rbp), %rax
1403a1b3b:     	lock
1403a1b3c:     	incq	(%rax)
1403a1b3f:     	jle	0x1403a1c47 <.text+0x3a0c47>
1403a1b45:     	movl	%ecx, %ebx
1403a1b47:     	movq	0x18(%rbp), %rax
1403a1b4b:     	movq	%rax, (%rbp)
1403a1b4f:     	movl	$0x0, 0x8(%rbp)
1403a1b56:     	jmp	0x1403a1ba0 <.text+0x3a0ba0>
1403a1b58:     	movl	%ecx, %ebx
1403a1b5a:     	movzbl	0x20(%rbp), %edx
1403a1b5e:     	jmp	0x1403a1b6e <.text+0x3a0b6e>
1403a1b60:     	movq	%rsi, %r11
1403a1b63:     	movq	%rdx, %rsi
1403a1b66:     	movq	-0x58(%rbp), %rdx
1403a1b6a:     	shrq	$0x20, %rdx
1403a1b6e:     	leaq	0x18(%rbp), %rcx
1403a1b72:     	movl	-0x7(%rcx), %eax
1403a1b75:     	movl	-0x4(%rcx), %ecx
1403a1b78:     	movl	%ecx, -0x3d(%rbp)
1403a1b7b:     	movl	%eax, -0x40(%rbp)
1403a1b7e:     	movq	0x18(%rbp), %rax
1403a1b82:     	movq	%rax, (%rbp)
1403a1b86:     	movzbl	%dl, %eax
1403a1b89:     	movq	-0x20(%rbp), %rcx
1403a1b8d:     	andq	$-0x100, %rcx
1403a1b94:     	orq	%rax, %rcx
1403a1b97:     	movq	%rcx, -0x20(%rbp)
1403a1b9b:     	movb	$0x1, %al
1403a1b9d:     	movl	%eax, 0x8(%rbp)
1403a1ba0:     	movq	%r11, -0x10(%rbp)
1403a1ba4:     	movl	-0x4(%rbp), %eax
1403a1ba7:     	movl	%eax, (%rsi)
1403a1ba9:     	cmpb	$0x0, 0x20(%r11)
1403a1bae:     	jne	0x1403a1bcc <.text+0x3a0bcc>
1403a1bb0:     	movq	-0x10(%rbp), %rax
1403a1bb4:     	movq	0x28(%rax), %rax
1403a1bb8:     	lock
1403a1bb9:     	decq	(%rax)
1403a1bbc:     	jne	0x1403a1bcc <.text+0x3a0bcc>
1403a1bbe:     	movq	-0x10(%rbp), %rax
1403a1bc2:     	leaq	0x28(%rax), %rcx
1403a1bc6:     	callq	0x1449886d0 <.text+0x49876d0>
1403a1bcb:     	nop
1403a1bcc:     	movq	-0x10(%rbp), %rdx
1403a1bd0:     	movl	0x8(%rbp), %eax
1403a1bd3:     	movb	%al, 0x20(%rdx)
1403a1bd6:     	movl	-0x40(%rbp), %eax
1403a1bd9:     	movl	-0x3d(%rbp), %ecx
1403a1bdc:     	movl	%eax, 0x21(%rdx)
1403a1bdf:     	movl	%ecx, 0x24(%rdx)
1403a1be2:     	movq	(%rbp), %rax
1403a1be6:     	movq	%rax, 0x28(%rdx)
1403a1bea:     	movq	-0x20(%rbp), %rax
1403a1bee:     	movq	%rax, 0x30(%rdx)
1403a1bf2:     	movl	$0x0, 0x70(%rdx)
1403a1bf9:     	movl	-0x4(%rbp), %eax
1403a1bfc:     	movl	%eax, (%rsi)
1403a1bfe:     	movupd	0x55ae75e(%rip), %xmm0  # 0x145950364
1403a1c06:     	movupd	%xmm0, 0x38(%rdx)
1403a1c0b:     	movl	$0x3f800000, 0x48(%rdx) # imm = 0x3F800000
1403a1c12:     	movl	%ebx, %ecx
1403a1c14:     	jmp	0x1403a1909 <.text+0x3a0909>
1403a1c19:     	cmpb	$0x0, 0x10(%rbp)
1403a1c1d:     	jne	0x1403a1c33 <.text+0x3a0c33>
1403a1c1f:     	movq	0x18(%rbp), %rax
1403a1c23:     	lock
1403a1c24:     	decq	(%rax)
1403a1c27:     	jne	0x1403a1c33 <.text+0x3a0c33>
1403a1c29:     	leaq	0x18(%rbp), %rcx
1403a1c2d:     	callq	0x1449886d0 <.text+0x49876d0>
1403a1c32:     	nop
1403a1c33:     	addq	$0xb8, %rsp
1403a1c3a:     	popq	%rbx
1403a1c3b:     	popq	%rdi
1403a1c3c:     	popq	%rsi
1403a1c3d:     	popq	%r12
1403a1c3f:     	popq	%r13
1403a1c41:     	popq	%r14
1403a1c43:     	popq	%r15
1403a1c45:     	popq	%rbp
1403a1c46:     	retq
1403a1c47:     	ud2

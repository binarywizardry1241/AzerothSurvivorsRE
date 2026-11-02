
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14008e860:     	pushq	%r15
14008e862:     	pushq	%r14
14008e864:     	pushq	%r13
14008e866:     	pushq	%r12
14008e868:     	pushq	%rsi
14008e869:     	pushq	%rdi
14008e86a:     	pushq	%rbp
14008e86b:     	pushq	%rbx
14008e86c:     	subq	$0x1c8, %rsp            # imm = 0x1C8
14008e873:     	movaps	%xmm6, 0x1b0(%rsp)
14008e87b:     	movq	(%rdx), %r8
14008e87e:     	movq	0x8(%rdx), %rdi
14008e882:     	movl	0x10(%rdx), %r9d
14008e886:     	movl	0x14(%rdx), %eax
14008e889:     	movl	%eax, 0x20(%rsp)
14008e88d:     	leaq	0x108(%rsp), %rcx
14008e895:     	movq	%rdi, %rdx
14008e898:     	movq	%r8, 0x98(%rsp)
14008e8a0:     	callq	0x14003eaf0 <.text+0x3daf0>
14008e8a5:     	movq	0x108(%rsp), %rax
14008e8ad:     	movl	0x114(%rsp), %ebx
14008e8b4:     	movq	0x118(%rsp), %r14
14008e8bc:     	movq	0x120(%rsp), %r15
14008e8c4:     	movq	0x138(%rsp), %rsi
14008e8cc:     	movq	0x148(%rsp), %rcx
14008e8d4:     	movq	%rcx, 0x70(%rsp)
14008e8d9:     	movq	0x158(%rsp), %rcx
14008e8e1:     	movq	%rcx, 0x68(%rsp)
14008e8e6:     	movl	0x164(%rsp), %ecx
14008e8ed:     	movl	%ecx, 0x48(%rsp)
14008e8f1:     	movq	0x168(%rsp), %rbp
14008e8f9:     	movq	0x170(%rsp), %rcx
14008e901:     	movq	%rcx, 0x40(%rsp)
14008e906:     	movq	0x178(%rsp), %rcx
14008e90e:     	movq	%rcx, 0x60(%rsp)
14008e913:     	movq	0x188(%rsp), %rcx
14008e91b:     	movq	%rcx, 0x58(%rsp)
14008e920:     	movl	0x194(%rsp), %ecx
14008e927:     	movl	%ecx, 0x8c(%rsp)
14008e92e:     	movl	%ebx, %ecx
14008e930:     	subl	0x110(%rsp), %ecx
14008e937:     	cmpl	$0xc233b000, %ecx       # imm = 0xC233B000
14008e93d:     	movl	$0xc233b000, %r13d      # imm = 0xC233B000
14008e943:     	cmovbl	%ecx, %r13d
14008e947:     	movzbl	0x198(%rsp), %ecx
14008e94f:     	movq	%rcx, 0x38(%rsp)
14008e954:     	movaps	0x5cdee85(%rip), %xmm6  # 0x145d6d7e0
14008e95b:     	movzbl	0x1a8(%rsp), %r10d
14008e964:     	movl	0x1a0(%rsp), %ecx
14008e96b:     	movl	0x1a4(%rsp), %r12d
14008e973:     	movl	%ebx, 0x4c(%rsp)
14008e977:     	movb	%r10b, 0x37(%rsp)
14008e97c:     	testb	$0x1, %r10b
14008e980:     	je	0x14008ebf9 <.text+0x8dbf9>
14008e986:     	jmp	0x14008e9f2 <.text+0x8d9f2>
14008e988:     	nopl	(%rax,%rax)
14008e990:     	movq	$0x0, 0x38(%rsp)
14008e999:     	movq	0x120(%r10), %r8
14008e9a0:     	movq	(%rax,%r8,8), %rax
14008e9a4:     	notq	%rax
14008e9a7:     	leaq	(%rax,%rax,2), %rax
14008e9ab:     	shlq	$0x4, %rax
14008e9af:     	movq	0x10(%rdx,%rax), %r8
14008e9b4:     	movq	%r8, 0x70(%rsp)
14008e9b9:     	movq	0x28(%rdx,%rax), %rax
14008e9be:     	movq	%rax, 0x68(%rsp)
14008e9c3:     	movq	0x130(%r10), %rdx
14008e9ca:     	callq	0x144e38680 <.text+0x4e37680>
14008e9cf:     	movq	(%rbx), %rcx
14008e9d2:     	movl	0x4c(%rsp), %ebx
14008e9d6:     	movzbl	0x37(%rsp), %r10d
14008e9dc:     	movl	%r12d, %edx
14008e9df:     	incl	%r12d
14008e9e2:     	movl	%ebx, %r8d
14008e9e5:     	subl	(%rax,%rdx,4), %r8d
14008e9e9:     	cmpl	%r13d, %r8d
14008e9ec:     	jb	0x14008ed82 <.text+0x8dd82>
14008e9f2:     	cmpl	%ecx, %r12d
14008e9f5:     	jne	0x14008e9dc <.text+0x8d9dc>
14008e9f7:     	cmpq	%r15, %r14
14008e9fa:     	movq	0x98(%rsp), %r10
14008ea02:     	je	0x14008f062 <.text+0x8e062>
14008ea08:     	movl	(%r14), %ecx
14008ea0b:     	addq	$0x4, %r14
14008ea0f:     	movq	0x1a8(%rdi), %rax
14008ea16:     	leaq	(%rcx,%rcx,8), %rdx
14008ea1a:     	cmpq	$0x0, 0x10(%rax,%rdx,8)
14008ea20:     	je	0x14008ea50 <.text+0x8da50>
14008ea22:     	leaq	(%rax,%rdx,8), %rcx
14008ea26:     	leaq	(%rax,%rdx,8), %rbx
14008ea2a:     	addq	$0x10, %rbx
14008ea2e:     	movq	0x110(%r10), %rax
14008ea35:     	movq	0x40(%rcx), %r8
14008ea39:     	cmpq	%r8, %rax
14008ea3c:     	jae	0x14008ead0 <.text+0x8dad0>
14008ea42:     	jmp	0x14008ea8b <.text+0x8da8b>
14008ea44:     	nopw	%cs:(%rax,%rax)
14008ea50:     	cmpq	%r15, %r14
14008ea53:     	je	0x14008f062 <.text+0x8e062>
14008ea59:     	movl	(%r14), %ecx
14008ea5c:     	addq	$0x4, %r14
14008ea60:     	movq	0x1a8(%rdi), %rax
14008ea67:     	leaq	(%rcx,%rcx,8), %rcx
14008ea6b:     	cmpq	$0x0, 0x10(%rax,%rcx,8)
14008ea71:     	je	0x14008ea50 <.text+0x8da50>
14008ea73:     	leaq	(%rax,%rcx,8), %rcx
14008ea77:     	leaq	0x10(%rcx), %rbx
14008ea7b:     	movq	0x110(%r10), %rax
14008ea82:     	movq	0x40(%rcx), %r8
14008ea86:     	cmpq	%r8, %rax
14008ea89:     	jae	0x14008ead0 <.text+0x8dad0>
14008ea8b:     	movq	0x38(%rcx), %rdx
14008ea8f:     	movq	(%rdx,%rax,8), %rax
14008ea93:     	testq	%rax, %rax
14008ea96:     	je	0x14008ead0 <.text+0x8dad0>
14008ea98:     	movq	0x18(%rcx), %rdx
14008ea9c:     	notq	%rax
14008ea9f:     	leaq	(%rax,%rax,2), %rax
14008eaa3:     	shlq	$0x4, %rax
14008eaa7:     	movq	0x10(%rdx,%rax), %rbp
14008eaac:     	movq	0x118(%r10), %rdx
14008eab3:     	movq	0x38(%rcx), %rax
14008eab7:     	cmpq	%r8, %rdx
14008eaba:     	jb	0x14008eae2 <.text+0x8dae2>
14008eabc:     	movq	0x18(%rcx), %rdx
14008eac0:     	jmp	0x14008eb20 <.text+0x8db20>
14008eac2:     	nopw	%cs:(%rax,%rax)
14008ead0:     	xorl	%ebp, %ebp
14008ead2:     	movq	0x118(%r10), %rdx
14008ead9:     	movq	0x38(%rcx), %rax
14008eadd:     	cmpq	%r8, %rdx
14008eae0:     	jae	0x14008eabc <.text+0x8dabc>
14008eae2:     	movq	(%rax,%rdx,8), %r9
14008eae6:     	movq	0x18(%rcx), %rdx
14008eaea:     	testq	%r9, %r9
14008eaed:     	je	0x14008eb20 <.text+0x8db20>
14008eaef:     	notq	%r9
14008eaf2:     	leaq	(%r9,%r9,2), %r9
14008eaf6:     	shlq	$0x4, %r9
14008eafa:     	movq	0x10(%rdx,%r9), %r9
14008eaff:     	movq	%r9, 0x40(%rsp)
14008eb04:     	movq	0x128(%r10), %r9
14008eb0b:     	xorl	%r12d, %r12d
14008eb0e:     	cmpq	%r8, %r9
14008eb11:     	jae	0x14008e990 <.text+0x8d990>
14008eb17:     	jmp	0x14008eb3c <.text+0x8db3c>
14008eb19:     	nopl	(%rax)
14008eb20:     	movq	$0x0, 0x40(%rsp)
14008eb29:     	movq	0x128(%r10), %r9
14008eb30:     	xorl	%r12d, %r12d
14008eb33:     	cmpq	%r8, %r9
14008eb36:     	jae	0x14008e990 <.text+0x8d990>
14008eb3c:     	movq	(%rax,%r9,8), %r8
14008eb40:     	testq	%r8, %r8
14008eb43:     	je	0x14008e990 <.text+0x8d990>
14008eb49:     	notq	%r8
14008eb4c:     	leaq	(%r8,%r8,2), %r8
14008eb50:     	shlq	$0x4, %r8
14008eb54:     	movq	0x10(%rdx,%r8), %r9
14008eb59:     	movq	%r9, 0x60(%rsp)
14008eb5e:     	movq	0x28(%rdx,%r8), %r8
14008eb63:     	movq	%r8, 0x58(%rsp)
14008eb68:     	movb	$0x1, %r8b
14008eb6b:     	movq	%r8, 0x38(%rsp)
14008eb70:     	jmp	0x14008e999 <.text+0x8d999>
14008eb75:     	nopw	%cs:(%rax,%rax)
14008eb80:     	movq	$0x0, 0x38(%rsp)
14008eb89:     	movq	0x120(%r10), %r8
14008eb90:     	movq	(%rax,%r8,8), %rax
14008eb94:     	notq	%rax
14008eb97:     	leaq	(%rax,%rax,2), %rax
14008eb9b:     	shlq	$0x4, %rax
14008eb9f:     	movq	0x10(%rdx,%rax), %r8
14008eba4:     	movq	%r8, 0x70(%rsp)
14008eba9:     	movq	0x28(%rdx,%rax), %rax
14008ebae:     	movq	%rax, 0x68(%rsp)
14008ebb3:     	movq	0x130(%r10), %rdx
14008ebba:     	callq	0x144e38680 <.text+0x4e37680>
14008ebbf:     	movq	0x50(%rbp), %rdx
14008ebc3:     	movq	(%rbx), %rcx
14008ebc6:     	movl	0x4c(%rsp), %ebx
14008ebca:     	movzbl	0x37(%rsp), %r10d
14008ebd0:     	movq	%r13, %rbp
14008ebd3:     	movl	%esi, %r13d
14008ebd6:     	movq	%rdx, %rsi
14008ebd9:     	movl	%r12d, %edx
14008ebdc:     	shlq	$0x4, %rdx
14008ebe0:     	incl	%r12d
14008ebe3:     	movl	0x8(%rsi,%rdx), %edx
14008ebe7:     	notl	%edx
14008ebe9:     	movl	%ebx, %r8d
14008ebec:     	subl	(%rax,%rdx,4), %r8d
14008ebf0:     	cmpl	%r13d, %r8d
14008ebf3:     	jb	0x14008ee09 <.text+0x8de09>
14008ebf9:     	cmpl	%ecx, %r12d
14008ebfc:     	jne	0x14008ebd9 <.text+0x8dbd9>
14008ebfe:     	cmpq	%r15, %r14
14008ec01:     	movq	0x98(%rsp), %r10
14008ec09:     	je	0x14008f062 <.text+0x8e062>
14008ec0f:     	movl	(%r14), %ecx
14008ec12:     	addq	$0x4, %r14
14008ec16:     	movq	0x108(%rdi), %rax
14008ec1d:     	leaq	(%rcx,%rcx,4), %rcx
14008ec21:     	shlq	$0x5, %rcx
14008ec25:     	cmpq	$0x0, 0x58(%rax,%rcx)
14008ec2b:     	je	0x14008ec40 <.text+0x8dc40>
14008ec2d:     	leaq	(%rax,%rcx), %rbp
14008ec31:     	leaq	(%rax,%rcx), %rbx
14008ec35:     	addq	$0x58, %rbx
14008ec39:     	jmp	0x14008ec6e <.text+0x8dc6e>
14008ec3b:     	nopl	(%rax,%rax)
14008ec40:     	cmpq	%r15, %r14
14008ec43:     	je	0x14008f062 <.text+0x8e062>
14008ec49:     	movl	(%r14), %eax
14008ec4c:     	addq	$0x4, %r14
14008ec50:     	movq	0x108(%rdi), %rbp
14008ec57:     	leaq	(%rax,%rax,4), %rax
14008ec5b:     	shlq	$0x5, %rax
14008ec5f:     	cmpq	$0x0, 0x58(%rbp,%rax)
14008ec65:     	je	0x14008ec40 <.text+0x8dc40>
14008ec67:     	addq	%rax, %rbp
14008ec6a:     	leaq	0x58(%rbp), %rbx
14008ec6e:     	movl	0x94(%rbp), %eax
14008ec74:     	movq	0x1a8(%rdi), %rdx
14008ec7b:     	leaq	(%rax,%rax,8), %r8
14008ec7f:     	leaq	(%rdx,%r8,8), %rcx
14008ec83:     	movq	0x110(%r10), %rax
14008ec8a:     	movq	0x40(%rdx,%r8,8), %rdx
14008ec8f:     	movl	%r13d, %esi
14008ec92:     	cmpq	%rdx, %rax
14008ec95:     	jae	0x14008ecd0 <.text+0x8dcd0>
14008ec97:     	movq	0x38(%rcx), %r8
14008ec9b:     	movq	(%r8,%rax,8), %rax
14008ec9f:     	testq	%rax, %rax
14008eca2:     	je	0x14008ecd0 <.text+0x8dcd0>
14008eca4:     	movq	0x18(%rcx), %r8
14008eca8:     	notq	%rax
14008ecab:     	leaq	(%rax,%rax,2), %rax
14008ecaf:     	shlq	$0x4, %rax
14008ecb3:     	movq	0x10(%r8,%rax), %r13
14008ecb8:     	movq	0x118(%r10), %r8
14008ecbf:     	movq	0x38(%rcx), %rax
14008ecc3:     	cmpq	%rdx, %r8
14008ecc6:     	jb	0x14008ece3 <.text+0x8dce3>
14008ecc8:     	movq	0x18(%rcx), %rdx
14008eccc:     	jmp	0x14008ed20 <.text+0x8dd20>
14008ecce:     	nop
14008ecd0:     	xorl	%r13d, %r13d
14008ecd3:     	movq	0x118(%r10), %r8
14008ecda:     	movq	0x38(%rcx), %rax
14008ecde:     	cmpq	%rdx, %r8
14008ece1:     	jae	0x14008ecc8 <.text+0x8dcc8>
14008ece3:     	movq	(%rax,%r8,8), %r8
14008ece7:     	movq	0x18(%rcx), %rdx
14008eceb:     	testq	%r8, %r8
14008ecee:     	je	0x14008ed20 <.text+0x8dd20>
14008ecf0:     	notq	%r8
14008ecf3:     	leaq	(%r8,%r8,2), %r8
14008ecf7:     	shlq	$0x4, %r8
14008ecfb:     	movq	0x10(%rdx,%r8), %r8
14008ed00:     	movq	%r8, 0x40(%rsp)
14008ed05:     	movq	0x128(%r10), %r8
14008ed0c:     	xorl	%r12d, %r12d
14008ed0f:     	cmpq	0x88(%rbp), %r8
14008ed16:     	jae	0x14008eb80 <.text+0x8db80>
14008ed1c:     	jmp	0x14008ed40 <.text+0x8dd40>
14008ed1e:     	nop
14008ed20:     	movq	$0x0, 0x40(%rsp)
14008ed29:     	movq	0x128(%r10), %r8
14008ed30:     	xorl	%r12d, %r12d
14008ed33:     	cmpq	0x88(%rbp), %r8
14008ed3a:     	jae	0x14008eb80 <.text+0x8db80>
14008ed40:     	movq	0x80(%rbp), %r9
14008ed47:     	cmpq	$0x0, (%r9,%r8,8)
14008ed4c:     	je	0x14008eb80 <.text+0x8db80>
14008ed52:     	movq	(%rax,%r8,8), %r8
14008ed56:     	notq	%r8
14008ed59:     	leaq	(%r8,%r8,2), %r8
14008ed5d:     	shlq	$0x4, %r8
14008ed61:     	movq	0x10(%rdx,%r8), %r9
14008ed66:     	movq	%r9, 0x60(%rsp)
14008ed6b:     	movq	0x28(%rdx,%r8), %r8
14008ed70:     	movq	%r8, 0x58(%rsp)
14008ed75:     	movb	$0x1, %r8b
14008ed78:     	movq	%r8, 0x38(%rsp)
14008ed7d:     	jmp	0x14008eb89 <.text+0x8db89>
14008ed82:     	leaq	(%rdx,%rbp), %r8
14008ed86:     	movq	%r8, 0x90(%rsp)
14008ed8e:     	imulq	$0x2c, %rdx, %r8
14008ed92:     	addq	0x40(%rsp), %r8
14008ed97:     	leaq	(%rdx,%rdx,4), %r9
14008ed9b:     	shlq	$0x4, %r9
14008ed9f:     	addq	0x70(%rsp), %r9
14008eda4:     	movq	0x68(%rsp), %r11
14008eda9:     	leaq	(%r11,%rdx,4), %r11
14008edad:     	movq	%r11, 0x78(%rsp)
14008edb2:     	cmpb	$0x1, 0x38(%rsp)
14008edb7:     	movq	%rbp, 0x80(%rsp)
14008edbf:     	jne	0x14008ef4c <.text+0x8df4c>
14008edc5:     	movq	0x58(%rsp), %r10
14008edca:     	leaq	(%r10,%rdx,4), %rbp
14008edce:     	movzbl	0x37(%rsp), %r10d
14008edd4:     	shlq	$0x5, %rdx
14008edd8:     	addq	0x60(%rsp), %rdx
14008eddd:     	movb	$0x1, %r11b
14008ede0:     	movq	%r11, 0x38(%rsp)
14008ede5:     	movq	%rbp, 0xa8(%rsp)
14008eded:     	movq	%rbp, 0x50(%rsp)
14008edf2:     	movq	0x90(%rsp), %r11
14008edfa:     	cmpb	$0x2, (%r11)
14008edfe:     	je	0x14008ef89 <.text+0x8df89>
14008ee04:     	jmp	0x14008ee8b <.text+0x8de8b>
14008ee09:     	leaq	(%rdx,%rbp), %r8
14008ee0d:     	movq	%r8, 0x90(%rsp)
14008ee15:     	imulq	$0x2c, %rdx, %r8
14008ee19:     	addq	0x40(%rsp), %r8
14008ee1e:     	leaq	(%rdx,%rdx,4), %r9
14008ee22:     	shlq	$0x4, %r9
14008ee26:     	addq	0x70(%rsp), %r9
14008ee2b:     	movq	0x68(%rsp), %r11
14008ee30:     	leaq	(%r11,%rdx,4), %r11
14008ee34:     	movq	%r11, 0x78(%rsp)
14008ee39:     	cmpb	$0x1, 0x38(%rsp)
14008ee3e:     	movq	%rbp, 0x80(%rsp)
14008ee46:     	jne	0x14008ef5f <.text+0x8df5f>
14008ee4c:     	movq	0x58(%rsp), %r10
14008ee51:     	leaq	(%r10,%rdx,4), %rbp
14008ee55:     	movzbl	0x37(%rsp), %r10d
14008ee5b:     	shlq	$0x5, %rdx
14008ee5f:     	addq	0x60(%rsp), %rdx
14008ee64:     	movb	$0x1, %r11b
14008ee67:     	movq	%r11, 0x38(%rsp)
14008ee6c:     	movq	%rbp, 0xa0(%rsp)
14008ee74:     	movq	%rbp, 0x50(%rsp)
14008ee79:     	movq	0x90(%rsp), %r11
14008ee81:     	cmpb	$0x2, (%r11)
14008ee85:     	je	0x14008ef89 <.text+0x8df89>
14008ee8b:     	movl	0x24(%r8), %r11d
14008ee8f:     	movl	%r11d, 0xc0(%rsp)
14008ee97:     	movups	0x14(%r8), %xmm0
14008ee9c:     	movaps	%xmm0, 0xb0(%rsp)
14008eea4:     	movl	0x24(%r8), %r11d
14008eea8:     	leaq	0xc4(%rsp), %rbp
14008eeb0:     	movl	%r11d, 0x10(%rbp)
14008eeb4:     	movups	0x14(%r8), %xmm0
14008eeb9:     	movups	%xmm0, (%rbp)
14008eebd:     	movl	0x24(%r8), %r11d
14008eec1:     	movl	%r11d, 0x24(%rbp)
14008eec5:     	movups	0x14(%r8), %xmm0
14008eeca:     	movups	%xmm0, 0x14(%rbp)
14008eece:     	movl	0x24(%r8), %r11d
14008eed2:     	movl	%r11d, 0x38(%rbp)
14008eed6:     	movups	0x14(%r8), %xmm0
14008eedb:     	movups	%xmm0, 0x28(%rbp)
14008eedf:     	movl	0x48(%rsp), %r11d
14008eee4:     	movq	0x78(%rsp), %rbp
14008eee9:     	movl	%r11d, (%rbp)
14008eeed:     	movaps	0xf0(%rsp), %xmm0
14008eef5:     	movups	%xmm0, 0x40(%r9)
14008eefa:     	movaps	0xb0(%rsp), %xmm0
14008ef02:     	movaps	0xc0(%rsp), %xmm1
14008ef0a:     	movaps	0xd0(%rsp), %xmm2
14008ef12:     	movaps	0xe0(%rsp), %xmm3
14008ef1a:     	movups	%xmm3, 0x30(%r9)
14008ef1f:     	movups	%xmm2, 0x20(%r9)
14008ef24:     	movups	%xmm1, 0x10(%r9)
14008ef29:     	movups	%xmm0, (%r9)
14008ef2d:     	testq	%rdx, %rdx
14008ef30:     	movq	0x80(%rsp), %rbp
14008ef38:     	je	0x14008e97c <.text+0x8d97c>
14008ef3e:     	movss	0x28(%r8), %xmm0
14008ef44:     	xorps	%xmm6, %xmm0
14008ef47:     	jmp	0x14008f03a <.text+0x8e03a>
14008ef4c:     	movq	$0x0, 0x38(%rsp)
14008ef55:     	movq	0xa8(%rsp), %rdx
14008ef5d:     	jmp	0x14008ef70 <.text+0x8df70>
14008ef5f:     	movq	$0x0, 0x38(%rsp)
14008ef68:     	movq	0xa0(%rsp), %rdx
14008ef70:     	movq	%rdx, 0x50(%rsp)
14008ef75:     	xorl	%edx, %edx
14008ef77:     	movq	0x90(%rsp), %r11
14008ef7f:     	cmpb	$0x2, (%r11)
14008ef83:     	jne	0x14008ee8b <.text+0x8de8b>
14008ef89:     	movl	0x10(%r8), %r11d
14008ef8d:     	movl	%r11d, 0xc0(%rsp)
14008ef95:     	movups	(%r8), %xmm0
14008ef99:     	movaps	%xmm0, 0xb0(%rsp)
14008efa1:     	movl	0x10(%r8), %r11d
14008efa5:     	leaq	0xc4(%rsp), %rbp
14008efad:     	movl	%r11d, 0x10(%rbp)
14008efb1:     	movups	(%r8), %xmm0
14008efb5:     	movups	%xmm0, (%rbp)
14008efb9:     	movl	0x10(%r8), %r11d
14008efbd:     	movl	%r11d, 0x24(%rbp)
14008efc1:     	movups	(%r8), %xmm0
14008efc5:     	movups	%xmm0, 0x14(%rbp)
14008efc9:     	movl	0x10(%r8), %r11d
14008efcd:     	movl	%r11d, 0x38(%rbp)
14008efd1:     	movups	(%r8), %xmm0
14008efd5:     	movups	%xmm0, 0x28(%rbp)
14008efd9:     	movl	0x48(%rsp), %r8d
14008efde:     	movq	0x78(%rsp), %r11
14008efe3:     	movl	%r8d, (%r11)
14008efe6:     	movaps	0xf0(%rsp), %xmm0
14008efee:     	movups	%xmm0, 0x40(%r9)
14008eff3:     	movaps	0xb0(%rsp), %xmm0
14008effb:     	movaps	0xc0(%rsp), %xmm1
14008f003:     	movaps	0xd0(%rsp), %xmm2
14008f00b:     	movaps	0xe0(%rsp), %xmm3
14008f013:     	movups	%xmm3, 0x30(%r9)
14008f018:     	movups	%xmm2, 0x20(%r9)
14008f01d:     	movups	%xmm1, 0x10(%r9)
14008f022:     	movups	%xmm0, (%r9)
14008f026:     	xorps	%xmm0, %xmm0
14008f029:     	testq	%rdx, %rdx
14008f02c:     	movq	0x80(%rsp), %rbp
14008f034:     	je	0x14008e97c <.text+0x8d97c>
14008f03a:     	movl	0x8c(%rsp), %r8d
14008f042:     	movq	0x50(%rsp), %r9
14008f047:     	movl	%r8d, (%r9)
14008f04a:     	movq	$0x1, (%rdx)
14008f051:     	movl	$0x1, 0x8(%rdx)
14008f058:     	movss	%xmm0, 0xc(%rdx)
14008f05d:     	jmp	0x14008e97c <.text+0x8d97c>
14008f062:     	movaps	0x1b0(%rsp), %xmm6
14008f06a:     	addq	$0x1c8, %rsp            # imm = 0x1C8
14008f071:     	popq	%rbx
14008f072:     	popq	%rbp
14008f073:     	popq	%rdi
14008f074:     	popq	%rsi
14008f075:     	popq	%r12
14008f077:     	popq	%r13
14008f079:     	popq	%r14
14008f07b:     	popq	%r15
14008f07d:     	retq

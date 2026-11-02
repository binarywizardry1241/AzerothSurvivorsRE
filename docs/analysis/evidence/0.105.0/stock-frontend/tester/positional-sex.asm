
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140001b47:     	leaq	0x48(%rdi), %rdx
140001b4b:     	movq	%rcx, 0x18(%rbp)
140001b4f:     	movq	%rax, 0x10(%rbp)
140001b53:     	movq	0x180(%rbp), %rax
140001b5a:     	movq	%rax, 0x8(%rbp)
140001b5e:     	movq	%r13, (%rbp)
140001b62:     	movq	0x148(%rbp), %rax
140001b69:     	movq	%rax, -0x8(%rbp)
140001b6d:     	movq	0x178(%rbp), %rax
140001b74:     	movq	%rax, -0x10(%rbp)
140001b78:     	leaq	0x80(%rbp), %rcx
140001b7f:     	callq	0x145b9c990 <.text+0x5b9b990>
140001b84:     	nop
140001b85:     	movq	0x80(%rbp), %rax
140001b8c:     	movq	%rax, 0x170(%rbp)
140001b93:     	movq	0x88(%rbp), %rax
140001b9a:     	movq	%rax, 0x78(%rbp)
140001b9e:     	movq	0x90(%rbp), %r13
140001ba5:     	cmpq	$0x4, %r14
140001ba9:     	jbe	0x140001c4e <.text+0xc4e>
140001baf:     	cmpq	$0x6, 0x70(%rdi)
140001bb4:     	jne	0x140001c4e <.text+0xc4e>
140001bba:     	movq	0x68(%rdi), %rax
140001bbe:     	movzbl	(%rax), %ecx
140001bc1:     	leal	-0x41(%rcx), %edx
140001bc4:     	cmpb	$0x1a, %dl
140001bc7:     	setb	%dl
140001bca:     	shlb	$0x5, %dl
140001bcd:     	orb	%cl, %dl
140001bcf:     	cmpb	$0x66, %dl
140001bd2:     	jne	0x140001c4e <.text+0xc4e>
140001bd4:     	movzbl	0x1(%rax), %ecx
140001bd8:     	leal	-0x41(%rcx), %edx
140001bdb:     	cmpb	$0x1a, %dl
140001bde:     	setb	%dl
140001be1:     	shlb	$0x5, %dl
140001be4:     	orb	%cl, %dl
140001be6:     	cmpb	$0x65, %dl
140001be9:     	jne	0x140001c4e <.text+0xc4e>
140001beb:     	movzbl	0x2(%rax), %ecx
140001bef:     	leal	-0x41(%rcx), %edx
140001bf2:     	cmpb	$0x1a, %dl
140001bf5:     	setb	%dl
140001bf8:     	shlb	$0x5, %dl
140001bfb:     	orb	%cl, %dl
140001bfd:     	cmpb	$0x6d, %dl
140001c00:     	jne	0x140001c4e <.text+0xc4e>
140001c02:     	movzbl	0x3(%rax), %ecx
140001c06:     	leal	-0x41(%rcx), %edx
140001c09:     	cmpb	$0x1a, %dl
140001c0c:     	setb	%dl
140001c0f:     	shlb	$0x5, %dl
140001c12:     	orb	%cl, %dl
140001c14:     	cmpb	$0x61, %dl
140001c17:     	jne	0x140001c4e <.text+0xc4e>
140001c19:     	movzbl	0x4(%rax), %ecx
140001c1d:     	leal	-0x41(%rcx), %edx
140001c20:     	cmpb	$0x1a, %dl
140001c23:     	setb	%dl
140001c26:     	shlb	$0x5, %dl
140001c29:     	orb	%cl, %dl
140001c2b:     	cmpb	$0x6c, %dl
140001c2e:     	jne	0x140001c4e <.text+0xc4e>
140001c30:     	movzbl	0x5(%rax), %eax
140001c34:     	leal	-0x41(%rax), %ecx
140001c37:     	cmpb	$0x1a, %cl
140001c3a:     	setb	%cl
140001c3d:     	shlb	$0x5, %cl
140001c40:     	orb	%al, %cl
140001c42:     	cmpb	$0x65, %cl
140001c45:     	sete	%dil
140001c49:     	jmp	0x14000175f <.text+0x75f>
140001c4e:     	xorl	%edi, %edi
140001c50:     	jmp	0x14000175f <.text+0x75f>

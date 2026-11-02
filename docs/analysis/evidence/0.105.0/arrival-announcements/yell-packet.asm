
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458aae00:     	pushq	%rbp
1458aae01:     	pushq	%r15
1458aae03:     	pushq	%r14
1458aae05:     	pushq	%rsi
1458aae06:     	pushq	%rdi
1458aae07:     	pushq	%rbx
1458aae08:     	subq	$0x78, %rsp
1458aae0c:     	leaq	0x70(%rsp), %rbp
1458aae11:     	movq	$-0x2, (%rbp)
1458aae19:     	movq	%r9, %rdi
1458aae1c:     	movq	%r8, %rbx
1458aae1f:     	movq	%rdx, %r14
1458aae22:     	movq	%rcx, %rsi
1458aae25:     	callq	0x140002200 <.text+0x1200>
1458aae2a:     	movl	$0x20, %ecx
1458aae2f:     	movl	$0x1, %edx
1458aae34:     	callq	0x1400021c0 <.text+0x11c0>
1458aae39:     	testq	%rax, %rax
1458aae3c:     	je	0x1458ab134 <.text+0x58aa134>
1458aae42:     	movb	$0xc, (%rax)
1458aae45:     	movl	$0x0, 0x1(%rax)
1458aae4c:     	movq	%r14, 0x5(%rax)
1458aae50:     	movq	$0x20, -0x40(%rbp)
1458aae58:     	movq	%rax, -0x38(%rbp)
1458aae5c:     	movq	$0xd, -0x30(%rbp)
1458aae64:     	movw	$0x96, -0x28(%rbp)
1458aae6a:     	movl	$0xd, %eax
1458aae6f:     	movb	$0x1, %cl
1458aae71:     	testb	%cl, %cl
1458aae73:     	je	0x1458ab05f <.text+0x58aa05f>
1458aae79:     	leal	0x1(%rdi), %ecx
1458aae7c:     	movq	-0x38(%rbp), %rdx
1458aae80:     	movl	%ecx, (%rdx,%rax)
1458aae83:     	addq	$0x4, %rax
1458aae87:     	movq	%rax, -0x30(%rbp)
1458aae8b:     	movq	-0x40(%rbp), %rax
1458aae8f:     	movq	%rax, -0x20(%rbp)
1458aae93:     	movq	-0x38(%rbp), %rax
1458aae97:     	movq	%rax, -0x18(%rbp)
1458aae9b:     	movq	-0x30(%rbp), %rax
1458aae9f:     	movq	%rax, -0x10(%rbp)
1458aaea3:     	movzwl	-0x28(%rbp), %eax
1458aaea7:     	movw	%ax, -0x8(%rbp)
1458aaeab:     	movl	-0x26(%rbp), %eax
1458aaeae:     	movl	%eax, -0x6(%rbp)
1458aaeb1:     	movzwl	-0x22(%rbp), %eax
1458aaeb5:     	movw	%ax, -0x2(%rbp)
1458aaeb9:     	movq	-0x10(%rbp), %r14
1458aaebd:     	movq	-0x20(%rbp), %r15
1458aaec1:     	movq	%r15, %rax
1458aaec4:     	subq	%r14, %rax
1458aaec7:     	cmpq	%rax, %rdi
1458aaeca:     	ja	0x1458ab08c <.text+0x58aa08c>
1458aaed0:     	testq	%rdi, %rdi
1458aaed3:     	je	0x1458aaee7 <.text+0x58a9ee7>
1458aaed5:     	movq	-0x18(%rbp), %rcx
1458aaed9:     	addq	%r14, %rcx
1458aaedc:     	movq	%rbx, %rdx
1458aaedf:     	movq	%rdi, %r8
1458aaee2:     	callq	0x145bc977b <.text+0x5bc877b>
1458aaee7:     	addq	%rdi, %r14
1458aaeea:     	movq	%r14, -0x10(%rbp)
1458aaeee:     	cmpq	%r15, %r14
1458aaef1:     	jne	0x1458aaefd <.text+0x58a9efd>
1458aaef3:     	leaq	-0x20(%rbp), %rcx
1458aaef7:     	callq	0x145d69340 <.text+0x5d68340>
1458aaefc:     	nop
1458aaefd:     	movq	-0x18(%rbp), %rax
1458aaf01:     	movb	$0x0, (%rax,%r14)
1458aaf06:     	incq	%r14
1458aaf09:     	movq	%r14, -0x10(%rbp)
1458aaf0d:     	movaps	-0x20(%rbp), %xmm0
1458aaf11:     	movaps	%xmm0, -0x40(%rbp)
1458aaf15:     	movq	-0x10(%rbp), %rax
1458aaf19:     	movq	%rax, -0x30(%rbp)
1458aaf1d:     	movq	-0x8(%rbp), %rax
1458aaf21:     	movq	%rax, -0x28(%rbp)
1458aaf25:     	movq	-0x30(%rbp), %rdx
1458aaf29:     	movq	-0x40(%rbp), %rax
1458aaf2d:     	subq	%rdx, %rax
1458aaf30:     	cmpq	$0x7, %rax
1458aaf34:     	jbe	0x1458ab0b8 <.text+0x58aa0b8>
1458aaf3a:     	movq	-0x38(%rbp), %rax
1458aaf3e:     	movq	$0x0, (%rax,%rdx)
1458aaf46:     	addq	$0x8, %rdx
1458aaf4a:     	movq	%rdx, -0x30(%rbp)
1458aaf4e:     	movaps	-0x40(%rbp), %xmm0
1458aaf52:     	movaps	%xmm0, -0x20(%rbp)
1458aaf56:     	movq	-0x30(%rbp), %rax
1458aaf5a:     	movq	%rax, -0x10(%rbp)
1458aaf5e:     	movq	-0x28(%rbp), %rax
1458aaf62:     	movq	%rax, -0x8(%rbp)
1458aaf66:     	movq	-0x10(%rbp), %rdx
1458aaf6a:     	movq	-0x20(%rbp), %rax
1458aaf6e:     	subq	%rdx, %rax
1458aaf71:     	cmpq	$0x3, %rax
1458aaf75:     	jbe	0x1458ab0e0 <.text+0x58aa0e0>
1458aaf7b:     	movq	0x68(%rbp), %rdi
1458aaf7f:     	leal	0x1(%rdi), %eax
1458aaf82:     	movq	-0x18(%rbp), %rcx
1458aaf86:     	movl	%eax, (%rcx,%rdx)
1458aaf89:     	addq	$0x4, %rdx
1458aaf8d:     	movq	%rdx, -0x10(%rbp)
1458aaf91:     	movaps	-0x20(%rbp), %xmm0
1458aaf95:     	movaps	%xmm0, -0x40(%rbp)
1458aaf99:     	movq	-0x10(%rbp), %rax
1458aaf9d:     	movq	%rax, -0x30(%rbp)
1458aafa1:     	movq	-0x8(%rbp), %rax
1458aafa5:     	movq	%rax, -0x28(%rbp)
1458aafa9:     	movq	-0x30(%rbp), %rbx
1458aafad:     	movq	-0x40(%rbp), %r14
1458aafb1:     	movq	%r14, %rax
1458aafb4:     	subq	%rbx, %rax
1458aafb7:     	cmpq	%rax, %rdi
1458aafba:     	ja	0x1458ab108 <.text+0x58aa108>
1458aafc0:     	testq	%rdi, %rdi
1458aafc3:     	je	0x1458aafd8 <.text+0x58a9fd8>
1458aafc5:     	movq	0x60(%rbp), %rdx
1458aafc9:     	movq	-0x38(%rbp), %rcx
1458aafcd:     	addq	%rbx, %rcx
1458aafd0:     	movq	%rdi, %r8
1458aafd3:     	callq	0x145bc977b <.text+0x5bc877b>
1458aafd8:     	addq	%rdi, %rbx
1458aafdb:     	movq	%rbx, -0x30(%rbp)
1458aafdf:     	cmpq	%r14, %rbx
1458aafe2:     	jne	0x1458aafee <.text+0x58a9fee>
1458aafe4:     	leaq	-0x40(%rbp), %rcx
1458aafe8:     	callq	0x145d69340 <.text+0x5d68340>
1458aafed:     	nop
1458aafee:     	movq	-0x38(%rbp), %rax
1458aaff2:     	movb	$0x0, (%rax,%rbx)
1458aaff6:     	incq	%rbx
1458aaff9:     	movq	%rbx, -0x30(%rbp)
1458aaffd:     	movaps	-0x40(%rbp), %xmm0
1458ab001:     	movaps	%xmm0, -0x20(%rbp)
1458ab005:     	movq	-0x30(%rbp), %rax
1458ab009:     	movq	%rax, -0x10(%rbp)
1458ab00d:     	movq	-0x28(%rbp), %rax
1458ab011:     	movq	%rax, -0x8(%rbp)
1458ab015:     	movq	-0x10(%rbp), %rdi
1458ab019:     	cmpq	-0x20(%rbp), %rdi
1458ab01d:     	jne	0x1458ab029 <.text+0x58aa029>
1458ab01f:     	leaq	-0x20(%rbp), %rcx
1458ab023:     	callq	0x145d69340 <.text+0x5d68340>
1458ab028:     	nop
1458ab029:     	movq	-0x18(%rbp), %rax
1458ab02d:     	movb	$0x0, (%rax,%rdi)
1458ab031:     	incq	%rdi
1458ab034:     	movq	%rdi, -0x10(%rbp)
1458ab038:     	movaps	-0x20(%rbp), %xmm0
1458ab03c:     	movups	%xmm0, (%rsi)
1458ab03f:     	movq	-0x10(%rbp), %rax
1458ab043:     	movq	%rax, 0x10(%rsi)
1458ab047:     	movq	-0x8(%rbp), %rax
1458ab04b:     	movq	%rax, 0x18(%rsi)
1458ab04f:     	movq	%rsi, %rax
1458ab052:     	addq	$0x78, %rsp
1458ab056:     	popq	%rbx
1458ab057:     	popq	%rdi
1458ab058:     	popq	%rsi
1458ab059:     	popq	%r14
1458ab05b:     	popq	%r15
1458ab05d:     	popq	%rbp
1458ab05e:     	retq
1458ab05f:     	movq	$0x1, 0x20(%rsp)
1458ab068:     	leaq	-0x40(%rbp), %rcx
1458ab06c:     	movl	$0xd, %edx
1458ab071:     	movl	$0x4, %r8d
1458ab077:     	movl	$0x1, %r9d
1458ab07d:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458ab082:     	nop
1458ab083:     	movq	-0x30(%rbp), %rax
1458ab087:     	jmp	0x1458aae79 <.text+0x58a9e79>
1458ab08c:     	movq	$0x1, 0x20(%rsp)
1458ab095:     	leaq	-0x20(%rbp), %rcx
1458ab099:     	movl	$0x1, %r9d
1458ab09f:     	movq	%r14, %rdx
1458ab0a2:     	movq	%rdi, %r8
1458ab0a5:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458ab0aa:     	nop
1458ab0ab:     	movq	-0x20(%rbp), %r15
1458ab0af:     	movq	-0x10(%rbp), %r14
1458ab0b3:     	jmp	0x1458aaed5 <.text+0x58a9ed5>
1458ab0b8:     	movq	$0x1, 0x20(%rsp)
1458ab0c1:     	leaq	-0x40(%rbp), %rcx
1458ab0c5:     	movl	$0x8, %r8d
1458ab0cb:     	movl	$0x1, %r9d
1458ab0d1:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458ab0d6:     	nop
1458ab0d7:     	movq	-0x30(%rbp), %rdx
1458ab0db:     	jmp	0x1458aaf3a <.text+0x58a9f3a>
1458ab0e0:     	movq	$0x1, 0x20(%rsp)
1458ab0e9:     	leaq	-0x20(%rbp), %rcx
1458ab0ed:     	movl	$0x4, %r8d
1458ab0f3:     	movl	$0x1, %r9d
1458ab0f9:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458ab0fe:     	nop
1458ab0ff:     	movq	-0x10(%rbp), %rdx
1458ab103:     	jmp	0x1458aaf7b <.text+0x58a9f7b>
1458ab108:     	movq	$0x1, 0x20(%rsp)
1458ab111:     	leaq	-0x40(%rbp), %rcx
1458ab115:     	movl	$0x1, %r9d
1458ab11b:     	movq	%rbx, %rdx
1458ab11e:     	movq	%rdi, %r8
1458ab121:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458ab126:     	nop
1458ab127:     	movq	-0x40(%rbp), %r14
1458ab12b:     	movq	-0x30(%rbp), %rbx
1458ab12f:     	jmp	0x1458aafc5 <.text+0x58a9fc5>
1458ab134:     	movl	$0x1, %ecx
1458ab139:     	movl	$0x20, %edx
1458ab13e:     	callq	0x145d6944b <.text+0x5d6844b>
1458ab143:     	ud2

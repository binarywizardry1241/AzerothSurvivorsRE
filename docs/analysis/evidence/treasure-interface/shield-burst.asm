
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cd8a7:     	movss	0x200(%rbp), %xmm3
1454cd8af:     	movq	(%rbp), %rcx
1454cd8b3:     	movl	0x8(%rcx), %eax
1454cd8b6:     	movl	%eax, 0x188(%rbp)
1454cd8bc:     	movq	(%rcx), %rax
1454cd8bf:     	movq	%rax, 0x180(%rbp)
1454cd8c6:     	movq	$0x0, 0x28(%rsp)
1454cd8cf:     	movq	$0x8, 0x20(%rsp)
1454cd8d8:     	leaq	0x120(%rbp), %rcx
1454cd8df:     	movq	%r12, %rdx
1454cd8e2:     	leaq	0x180(%rbp), %r8
1454cd8e9:     	callq	0x145500300 <.text+0x54ff300>
1454cd8ee:     	nop
1454cd8ef:     	movq	0x108(%rbp), %rax
1454cd8f6:     	movq	(%rax), %rdx
1454cd8f9:     	movq	0x128(%rbp), %r9
1454cd900:     	movq	0x130(%rbp), %rsi
1454cd907:     	movl	$0x2, 0x98(%rbp)
1454cd911:     	movl	$0x0, 0x50(%rbp)
1454cd918:     	movb	$0x1, 0x1fa(%rbp)
1454cd91f:     	leaq	0x50(%rbp), %rax
1454cd923:     	movq	%rax, 0x30(%rsp)
1454cd928:     	leaq	0x98(%rbp), %rax
1454cd92f:     	movq	%rax, 0x28(%rsp)
1454cd934:     	movq	%rsi, 0x20(%rsp)
1454cd939:     	leaq	0x180(%rbp), %rcx
1454cd940:     	movl	%r13d, %r8d
1454cd943:     	movq	%r9, 0x208(%rbp)
1454cd94a:     	callq	0x145466ab0 <.text+0x5465ab0>
1454cd94f:     	nop
1454cd950:     	movq	0x560(%r12), %rdi
1454cd958:     	cmpq	0x550(%r12), %rdi
1454cd960:     	jne	0x1454cd96f <.text+0x54cc96f>
1454cd962:     	movq	0x110(%rbp), %rcx
1454cd969:     	callq	0x145774710 <.text+0x5773710>
1454cd96e:     	nop
1454cd96f:     	movq	0x558(%r12), %rax
1454cd977:     	movq	%rdi, %rcx
1454cd97a:     	shlq	$0x5, %rcx
1454cd97e:     	movups	0x180(%rbp), %xmm0
1454cd985:     	movups	0x190(%rbp), %xmm1
1454cd98c:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cd991:     	movups	%xmm0, (%rax,%rcx)
1454cd995:     	incq	%rdi
1454cd998:     	movq	%rdi, 0x560(%r12)
1454cd9a0:     	movq	0x120(%rbp), %rax
1454cd9a7:     	movq	%rax, 0x200(%rbp)
1454cd9ae:     	testq	%rsi, %rsi
1454cd9b1:     	je	0x1454cda27 <.text+0x54cca27>
1454cd9b3:     	movd	%ebx, %xmm9
1454cd9b8:     	mulss	%xmm6, %xmm9
1454cd9bd:     	mulss	0x474(%r12), %xmm9
1454cd9c7:     	shlq	$0x3, %rsi
1454cd9cb:     	movzbl	0x129(%r12), %ebx
1454cd9d4:     	xorl	%edi, %edi
1454cd9d6:     	nopw	%cs:(%rax,%rax)
1454cd9e0:     	movq	0x208(%rbp), %rax
1454cd9e7:     	movq	(%rax,%rdi), %rdx
1454cd9eb:     	movb	$0x3, 0x129(%r12)
1454cd9f4:     	movq	%r13, %r9
1454cd9f7:     	testl	%r9d, %r9d
1454cd9fa:     	sete	0x30(%rsp)
1454cd9ff:     	movb	%r15b, 0x20(%rsp)
1454cda04:     	movb	$0x0, 0x28(%rsp)
1454cda09:     	movq	%r12, %rcx
1454cda0c:     	movaps	%xmm9, %xmm2
1454cda10:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454cda15:     	nop
1454cda16:     	movb	%bl, 0x129(%r12)
1454cda1e:     	addq	$0x8, %rdi
1454cda22:     	cmpq	%rdi, %rsi
1454cda25:     	jne	0x1454cd9e0 <.text+0x54cc9e0>
1454cda27:     	movq	0x200(%rbp), %rdx
1454cda2e:     	testq	%rdx, %rdx
1454cda31:     	je	0x1454cda49 <.text+0x54cca49>
1454cda33:     	shlq	$0x3, %rdx
1454cda37:     	movl	$0x8, %r8d
1454cda3d:     	movq	0x208(%rbp), %rcx

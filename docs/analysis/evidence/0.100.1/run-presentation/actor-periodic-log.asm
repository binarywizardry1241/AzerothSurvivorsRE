
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454de810:     	movq	0x10(%rdi), %r12
1454de814:     	movl	0x18(%rdi), %ebx
1454de817:     	movss	0x1c(%rdi), %xmm7
1454de81c:     	movss	0x20(%rdi), %xmm6
1454de821:     	movb	0x24(%rdi), %r14b
1454de825:     	movzbl	%r14b, %eax
1454de829:     	movb	0x25(%rdi), %r15b
1454de82d:     	cvttss2si	%xmm7, %rcx
1454de832:     	ucomiss	%xmm8, %xmm7
1454de836:     	movl	$0x0, %edx
1454de83b:     	cmovbl	%edx, %ecx
1454de83e:     	ucomiss	%xmm13, %xmm7
1454de842:     	movq	0x3e8(%r13), %r8
1454de849:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454de84e:     	cmoval	%edx, %ecx
1454de851:     	movl	%eax, 0x28(%rsp)
1454de855:     	movl	%ecx, 0x20(%rsp)
1454de859:     	leaq	0x1f0(%rbp), %rcx
1454de860:     	movq	%r12, %rdx
1454de863:     	movl	%ebx, %r9d
1454de866:     	callq	0x145464140 <.text+0x5463140>
1454de86b:     	nop
1454de86c:     	movq	0x560(%r13), %rsi
1454de873:     	cmpq	0x550(%r13), %rsi
1454de87a:     	jne	0x1454de889 <.text+0x54dd889>
1454de87c:     	movq	0x290(%rbp), %rcx
1454de883:     	callq	0x145774710 <.text+0x5773710>
1454de888:     	nop
1454de889:     	movq	0x2a0(%rbp), %r13
1454de890:     	movq	0x558(%r13), %rax
1454de897:     	movq	%rsi, %rcx
1454de89a:     	shlq	$0x5, %rcx
1454de89e:     	movups	0x1f0(%rbp), %xmm0
1454de8a5:     	movups	0x200(%rbp), %xmm1
1454de8ac:     	movups	%xmm1, 0x10(%rax,%rcx)
1454de8b1:     	movups	%xmm0, (%rax,%rcx)
1454de8b5:     	incq	%rsi
1454de8b8:     	movq	%rsi, 0x560(%r13)
1454de8bf:     	movb	0x129(%r13), %sil
1454de8c6:     	movb	$0x1, 0x129(%r13)
1454de8ce:     	movups	%xmm9, 0x30(%r13)
1454de8d3:     	movb	%r15b, 0x128(%r13)
1454de8da:     	movb	%r14b, 0x20(%rsp)
1454de8df:     	movb	$0x1, 0x30(%rsp)
1454de8e4:     	movb	$0x0, 0x28(%rsp)
1454de8e9:     	movq	%r13, %rcx
1454de8ec:     	movq	%r12, %rdx
1454de8ef:     	movaps	%xmm7, %xmm2
1454de8f2:     	movl	%ebx, %r9d
1454de8f5:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454de8fa:     	nop
1454de8fb:     	addq	$0x28, %rdi
1454de8ff:     	movb	$0x0, 0x128(%r13)
1454de907:     	movq	$0x0, 0x30(%r13)
1454de90f:     	movb	%sil, 0x129(%r13)

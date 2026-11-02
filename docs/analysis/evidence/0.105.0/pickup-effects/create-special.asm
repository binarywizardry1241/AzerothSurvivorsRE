
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14593a644:     	movl	%r15d, %r13d
14593a647:     	movl	$0x2330, 0x5c(%rbp)     # imm = 0x2330
14593a64e:     	movabsq	$0x3f80000000001767, %r15 # imm = 0x3F80000000001767
14593a658:     	jmp	0x14593a6bd <.text+0x59396bd>
14593a65a:     	movl	%r15d, %r13d
14593a65d:     	movl	$0x232e, 0x5c(%rbp)     # imm = 0x232E
14593a664:     	movabsq	$0x3f8000000000172b, %r15 # imm = 0x3F8000000000172B
14593a66e:     	jmp	0x14593a6bd <.text+0x59396bd>
14593a670:     	movl	%r15d, %r13d
14593a673:     	movl	$0x232c, 0x5c(%rbp)     # imm = 0x232C
14593a67a:     	movabsq	$0x3f19999a00000a36, %r15 # imm = 0x3F19999A00000A36
14593a684:     	jmp	0x14593a6bd <.text+0x59396bd>
14593a686:     	movl	%r15d, %r13d
14593a689:     	movl	$0x232f, 0x5c(%rbp)     # imm = 0x232F
14593a690:     	movabsq	$0x3f8000000000176b, %r15 # imm = 0x3F8000000000176B
14593a69a:     	jmp	0x14593a6bd <.text+0x59396bd>
14593a69c:     	movl	%r15d, %r13d
14593a69f:     	movl	$0x2331, 0x5c(%rbp)     # imm = 0x2331
14593a6a6:     	movabsq	$0x3fa6666600000156, %r15 # imm = 0x3FA6666600000156
14593a6b0:     	jmp	0x14593a6bd <.text+0x59396bd>
14593a6b2:     	movq	%rdi, %rcx
14593a6b5:     	movq	%r8, %rdx
14593a6b8:     	callq	0x145942890 <.text+0x5941890>
14593a6bd:     	movq	0x950(%rdi), %rsi
14593a6c4:     	leaq	0x10(%rsi), %rcx
14593a6c8:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
14593a6cd:     	movaps	%xmm6, %xmm1
14593a6d0:     	movaps	%xmm8, %xmm2
14593a6d4:     	callq	0x1458c7b60 <.text+0x58c6b60>
14593a6d9:     	testb	$0x1, %al
14593a6db:     	je	0x14593a6e2 <.text+0x59396e2>
14593a6dd:     	movaps	%xmm0, %xmm7
14593a6e0:     	jmp	0x14593a712 <.text+0x5939712>
14593a6e2:     	cmpq	$-0x1, 0x68(%rsi)
14593a6e7:     	je	0x14593a70a <.text+0x593970a>
14593a6e9:     	leaq	0x68(%rsi), %rdx
14593a6ed:     	leaq	0x60(%rbp), %rcx
14593a6f1:     	movaps	%xmm6, %xmm2
14593a6f4:     	movaps	%xmm8, %xmm3
14593a6f8:     	callq	0x1458cc950 <.text+0x58cb950>
14593a6fd:     	cmpl	$0x1, 0x60(%rbp)
14593a701:     	jne	0x14593a70a <.text+0x593970a>
14593a703:     	movss	0x6c(%rbp), %xmm7
14593a708:     	jmp	0x14593a712 <.text+0x5939712>
14593a70a:     	movss	0xb8(%rsi), %xmm7
14593a712:     	movl	0x5c(%rbp), %eax
14593a715:     	movl	%eax, 0x20(%rbp)
14593a718:     	movq	%r15, 0x24(%rbp)
14593a71c:     	movlps	%xmm6, 0x60(%rbp)
14593a720:     	movss	%xmm7, 0x68(%rbp)
14593a725:     	movl	$0x0, 0x20(%rsp)
14593a72d:     	leaq	0x20(%rbp), %rdx
14593a731:     	leaq	0x60(%rbp), %r8
14593a735:     	movq	%rdi, %rcx
14593a738:     	movl	%r14d, %r9d
14593a73b:     	callq	0x145944080 <.text+0x5943080>
14593a740:     	movq	%rax, %r14
14593a743:     	movq	$0x0, 0x20(%rbp)
14593a74b:     	movq	$0x8, 0x28(%rbp)
14593a753:     	movq	$0x0, 0x30(%rbp)
14593a75b:     	cmpl	$0x6, %r13d
14593a75f:     	jne	0x14593a855 <.text+0x5939855>
14593a765:     	movq	%r14, -0x38(%rbp)
14593a769:     	movl	%r13d, 0xc(%rbp)
14593a76d:     	movl	%r12d, 0x8(%rbp)
14593a771:     	movabsq	$0xcc700002332, %rax    # imm = 0xCC700002332
14593a77b:     	movq	%rax, -0x30(%rbp)
14593a77f:     	movl	$0x3f800000, -0x28(%rbp) # imm = 0x3F800000
14593a786:     	movabsq	$0x8b800002333, %rax    # imm = 0x8B800002333
14593a790:     	movq	%rax, -0x24(%rbp)
14593a794:     	movl	$0x3fcccccd, -0x1c(%rbp) # imm = 0x3FCCCCCD
14593a79b:     	movq	$0x2, 0x68(%rbp)
14593a7a3:     	leaq	0x70(%rbp), %rbx
14593a7a7:     	movq	-0x30(%rbp), %rax
14593a7ab:     	movq	%rax, 0x70(%rbp)
14593a7af:     	movl	-0x28(%rbp), %eax
14593a7b2:     	movl	%eax, 0x78(%rbp)
14593a7b5:     	movl	-0x24(%rbp), %eax
14593a7b8:     	movl	%eax, 0x7c(%rbp)
14593a7bb:     	movq	-0x20(%rbp), %rax
14593a7bf:     	movq	%rax, 0x80(%rbp)
14593a7c6:     	xorl	%esi, %esi
14593a7c8:     	leaq	-0x18(%rbp), %r15
14593a7cc:     	leaq	0x20(%rbp), %r12
14593a7d0:     	xorl	%eax, %eax
14593a7d2:     	jmp	0x14593a7f2 <.text+0x59397f2>
14593a7d4:     	nopw	%cs:(%rax,%rax)
14593a7e0:     	movq	0x28(%rbp), %rax
14593a7e4:     	movq	%r13, (%rax,%rsi,8)
14593a7e8:     	incq	%rsi
14593a7eb:     	movq	%rsi, 0x30(%rbp)
14593a7ef:     	movq	%r14, %rax
14593a7f2:     	cmpq	$0x2, %rax
14593a7f6:     	je	0x14593a883 <.text+0x5939883>
14593a7fc:     	leaq	0x1(%rax), %r14
14593a800:     	movq	%r14, 0x60(%rbp)
14593a804:     	leaq	(%rax,%rax,2), %rax
14593a808:     	leaq	(%rbx,%rax,4), %rdx
14593a80c:     	movlps	%xmm6, -0x18(%rbp)
14593a810:     	movss	%xmm7, -0x10(%rbp)
14593a815:     	movb	$0x1, 0x96(%rbp)
14593a81c:     	movl	$0x10, 0x20(%rsp)
14593a824:     	movq	%rdi, %rcx
14593a827:     	movq	%r15, %r8
14593a82a:     	movl	$0x5, %r9d
14593a830:     	callq	0x145944080 <.text+0x5943080>
14593a835:     	nop
14593a836:     	movq	%rax, %r13
14593a839:     	movq	0x30(%rbp), %rsi
14593a83d:     	cmpq	0x20(%rbp), %rsi
14593a841:     	jne	0x14593a7e0 <.text+0x59397e0>
14593a843:     	movb	$0x1, 0x96(%rbp)
14593a84a:     	movq	%r12, %rcx
14593a84d:     	callq	0x145bcb370 <.text+0x5bca370>
14593a852:     	nop
14593a853:     	jmp	0x14593a7e0 <.text+0x59397e0>
14593a855:     	movl	$0x8, %eax
14593a85a:     	movq	%rax, 0x10(%rbp)
14593a85e:     	xorl	%esi, %esi
14593a860:     	movq	$0x0, 0x18(%rbp)
14593a868:     	movss	0x9ec(%rdi), %xmm8
14593a871:     	movq	0x5c8(%rdi), %rbx
14593a878:     	cmpq	0x5b8(%rdi), %rbx
14593a87f:     	je	0x14593a8b8 <.text+0x59398b8>
14593a881:     	jmp	0x14593a8c5 <.text+0x59398c5>
14593a883:     	movq	0x20(%rbp), %rax
14593a887:     	movq	%rax, 0x18(%rbp)
14593a88b:     	movq	0x28(%rbp), %rax
14593a88f:     	movq	%rax, 0x10(%rbp)
14593a893:     	movl	0x8(%rbp), %r12d
14593a897:     	movl	0xc(%rbp), %r13d
14593a89b:     	movq	-0x38(%rbp), %r14
14593a89f:     	movss	0x9ec(%rdi), %xmm8
14593a8a8:     	movq	0x5c8(%rdi), %rbx
14593a8af:     	cmpq	0x5b8(%rdi), %rbx
14593a8b6:     	jne	0x14593a8c5 <.text+0x59398c5>
14593a8b8:     	leaq	0x5b8(%rdi), %rcx
14593a8bf:     	callq	0x145bcb450 <.text+0x5bca450>
14593a8c4:     	nop
14593a8c5:     	movq	0x5c0(%rdi), %rax
14593a8cc:     	leaq	(%rbx,%rbx,8), %rcx
14593a8d0:     	movq	0x18(%rbp), %rdx
14593a8d4:     	movq	%rdx, (%rax,%rcx,8)
14593a8d8:     	movq	0x10(%rbp), %rdx
14593a8dc:     	movq	%rdx, 0x8(%rax,%rcx,8)
14593a8e1:     	movq	%rsi, 0x10(%rax,%rcx,8)
14593a8e6:     	movl	$0x0, 0x18(%rax,%rcx,8)
14593a8ee:     	movl	%r13d, 0x20(%rax,%rcx,8)
14593a8f3:     	movl	%r12d, 0x24(%rax,%rcx,8)
14593a8f8:     	movq	%r14, 0x28(%rax,%rcx,8)
14593a8fd:     	movl	0x5c(%rbp), %edx
14593a900:     	movl	%edx, 0x30(%rax,%rcx,8)
14593a904:     	movlps	%xmm6, 0x34(%rax,%rcx,8)
14593a909:     	movss	%xmm7, 0x3c(%rax,%rcx,8)
14593a90f:     	movss	%xmm8, 0x40(%rax,%rcx,8)
14593a916:     	incq	%rbx
14593a919:     	movq	%rbx, 0x5c8(%rdi)

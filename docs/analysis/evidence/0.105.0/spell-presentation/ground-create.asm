
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145926650:     	pushq	%rbp
145926651:     	pushq	%r15
145926653:     	pushq	%r14
145926655:     	pushq	%rsi
145926656:     	pushq	%rdi
145926657:     	pushq	%rbx
145926658:     	subq	$0xf8, %rsp
14592665f:     	leaq	0x80(%rsp), %rbp
145926667:     	movaps	%xmm7, 0x60(%rbp)
14592666b:     	movaps	%xmm6, 0x50(%rbp)
14592666f:     	movq	$-0x2, 0x48(%rbp)
145926677:     	movaps	%xmm3, %xmm6
14592667a:     	movq	%r8, %rbx
14592667d:     	movl	%edx, %r15d
145926680:     	movq	%rcx, %rdi
145926683:     	movl	0xa0c(%rcx), %eax
145926689:     	incl	%eax
14592668b:     	movl	%eax, 0xa0c(%rcx)
145926691:     	movabsq	$-0xf00000000000000, %rsi # imm = 0xF100000000000000
14592669b:     	orq	%rax, %rsi
14592669e:     	movl	%edx, %ecx
1459266a0:     	callq	0x1459614e0 <.text+0x59604e0>
1459266a5:     	testb	$0x1, %al
1459266a7:     	jne	0x1459266b3 <.text+0x59256b3>
1459266a9:     	movss	0x446cbb(%rip), %xmm7   # 0x145d6d36c
1459266b1:     	jmp	0x1459266ba <.text+0x59256ba>
1459266b3:     	movaps	%xmm6, %xmm7
1459266b6:     	divss	%xmm0, %xmm7
1459266ba:     	movq	$0x0, -0x8(%rbp)
1459266c2:     	movq	$0x0, 0x8(%rbp)
1459266ca:     	leaq	-0x8(%rbp), %r14
1459266ce:     	movq	%r14, %rcx
1459266d1:     	xorl	%edx, %edx
1459266d3:     	movq	%rsi, %r8
1459266d6:     	callq	0x1458a8ba0 <.text+0x58a7ba0>
1459266db:     	nop
1459266dc:     	movq	-0x8(%rbp), %rax
1459266e0:     	testq	%rax, %rax
1459266e3:     	je	0x14592674b <.text+0x592574b>
1459266e5:     	movq	(%rbp), %rcx
1459266e9:     	movw	$0x2, %dx
1459266ed:     	movzwl	0x36(%rax), %r9d
1459266f2:     	movl	%r9d, %r10d
1459266f5:     	addl	%r10d, %r10d
1459266f8:     	movq	$-0x1, %r8
1459266ff:     	nop
145926700:     	testq	%r10, %r10
145926703:     	je	0x145926730 <.text+0x5925730>
145926705:     	cmpw	0x3a(%rax,%r8,2), %dx
14592670b:     	seta	%r11b
14592670f:     	sbbb	$0x0, %r11b
145926713:     	incq	%r8
145926716:     	addq	$-0x2, %r10
14592671a:     	cmpb	$0x1, %r11b
14592671e:     	je	0x145926700 <.text+0x5925700>
145926720:     	movzbl	%r11b, %r9d
145926724:     	testl	%r9d, %r9d
145926727:     	je	0x145926740 <.text+0x5925740>
145926729:     	jmp	0x145926733 <.text+0x5925733>
14592672b:     	nopl	(%rax,%rax)
145926730:     	movq	%r9, %r8
145926733:     	subq	$0x1, %rcx
145926737:     	jb	0x14592674d <.text+0x592574d>
145926739:     	movq	0x50(%rax,%r8,8), %rax
14592673e:     	jmp	0x1459266ed <.text+0x59256ed>
145926740:     	movl	$0x41, 0x8(%rax,%r8,4)
145926749:     	jmp	0x14592677d <.text+0x592577d>
14592674b:     	xorl	%eax, %eax
14592674d:     	movq	%r14, 0x10(%rbp)
145926751:     	movq	%rax, 0x18(%rbp)
145926755:     	movq	$0x0, 0x20(%rbp)
14592675d:     	movq	%r8, 0x28(%rbp)
145926761:     	movq	$0x2, 0x30(%rbp)
145926769:     	leaq	-0x28(%rbp), %rcx
14592676d:     	leaq	0x10(%rbp), %rdx
145926771:     	movl	$0x41, %r8d
145926777:     	callq	0x1458e1710 <.text+0x58e0710>
14592677c:     	nop
14592677d:     	movq	-0x8(%rbp), %rax
145926781:     	testq	%rax, %rax
145926784:     	je	0x1459267e7 <.text+0x59257e7>
145926786:     	movq	(%rbp), %rcx
14592678a:     	movw	$0x3, %dx
14592678e:     	movzwl	0x36(%rax), %r9d
145926793:     	movl	%r9d, %r10d
145926796:     	addl	%r10d, %r10d
145926799:     	movq	$-0x1, %r8
1459267a0:     	testq	%r10, %r10
1459267a3:     	je	0x1459267d0 <.text+0x59257d0>
1459267a5:     	cmpw	0x3a(%rax,%r8,2), %dx
1459267ab:     	seta	%r11b
1459267af:     	sbbb	$0x0, %r11b
1459267b3:     	incq	%r8
1459267b6:     	addq	$-0x2, %r10
1459267ba:     	cmpb	$0x1, %r11b
1459267be:     	je	0x1459267a0 <.text+0x59257a0>
1459267c0:     	movzbl	%r11b, %r9d
1459267c4:     	testl	%r9d, %r9d
1459267c7:     	je	0x1459267e0 <.text+0x59257e0>
1459267c9:     	jmp	0x1459267d3 <.text+0x59257d3>
1459267cb:     	nopl	(%rax,%rax)
1459267d0:     	movq	%r9, %r8
1459267d3:     	subq	$0x1, %rcx
1459267d7:     	jb	0x1459267e9 <.text+0x59257e9>
1459267d9:     	movq	0x50(%rax,%r8,8), %rax
1459267de:     	jmp	0x14592678e <.text+0x592578e>
1459267e0:     	movl	%r15d, 0x8(%rax,%r8,4)
1459267e5:     	jmp	0x145926816 <.text+0x5925816>
1459267e7:     	xorl	%eax, %eax
1459267e9:     	movq	%r14, 0x10(%rbp)
1459267ed:     	movq	%rax, 0x18(%rbp)
1459267f1:     	movq	$0x0, 0x20(%rbp)
1459267f9:     	movq	%r8, 0x28(%rbp)
1459267fd:     	movq	$0x3, 0x30(%rbp)
145926805:     	leaq	-0x28(%rbp), %rcx
145926809:     	leaq	0x10(%rbp), %rdx
14592680d:     	movl	%r15d, %r8d
145926810:     	callq	0x1458e1710 <.text+0x58e0710>
145926815:     	nop
145926816:     	movq	-0x8(%rbp), %rax
14592681a:     	testq	%rax, %rax
14592681d:     	je	0x145926889 <.text+0x5925889>
14592681f:     	movq	(%rbp), %rcx
145926823:     	movw	$0x4, %dx
145926827:     	movzwl	0x36(%rax), %r8d
14592682c:     	movl	%r8d, %r10d
14592682f:     	addl	%r10d, %r10d
145926832:     	movq	$-0x1, %r9
145926839:     	nopl	(%rax)
145926840:     	testq	%r10, %r10
145926843:     	je	0x145926870 <.text+0x5925870>
145926845:     	cmpw	0x3a(%rax,%r9,2), %dx
14592684b:     	seta	%r11b
14592684f:     	sbbb	$0x0, %r11b
145926853:     	incq	%r9
145926856:     	addq	$-0x2, %r10
14592685a:     	cmpb	$0x1, %r11b
14592685e:     	je	0x145926840 <.text+0x5925840>
145926860:     	movzbl	%r11b, %r8d
145926864:     	testl	%r8d, %r8d
145926867:     	je	0x145926880 <.text+0x5925880>
145926869:     	jmp	0x145926873 <.text+0x5925873>
14592686b:     	nopl	(%rax,%rax)
145926870:     	movq	%r8, %r9
145926873:     	subq	$0x1, %rcx
145926877:     	jb	0x14592688b <.text+0x592588b>
145926879:     	movq	0x50(%rax,%r9,8), %rax
14592687e:     	jmp	0x145926827 <.text+0x5925827>
145926880:     	movss	%xmm7, 0x8(%rax,%r9,4)
145926887:     	jmp	0x1459268ba <.text+0x59258ba>
145926889:     	xorl	%eax, %eax
14592688b:     	movd	%xmm7, %r8d
145926890:     	movq	%r14, 0x10(%rbp)
145926894:     	movq	%rax, 0x18(%rbp)
145926898:     	movq	$0x0, 0x20(%rbp)
1459268a0:     	movq	%r9, 0x28(%rbp)
1459268a4:     	movq	$0x4, 0x30(%rbp)
1459268ac:     	leaq	-0x28(%rbp), %rcx
1459268b0:     	leaq	0x10(%rbp), %rdx
1459268b4:     	callq	0x1458e1710 <.text+0x58e0710>
1459268b9:     	nop
1459268ba:     	movq	0x460(%rdi), %r8
1459268c1:     	leaq	-0x8(%rbp), %r14
1459268c5:     	movq	%r14, %rcx
1459268c8:     	movw	$0x6, %dx
1459268cc:     	callq	0x1458a8ba0 <.text+0x58a7ba0>
1459268d1:     	nop
1459268d2:     	movq	-0x8(%rbp), %rax
1459268d6:     	testq	%rax, %rax
1459268d9:     	je	0x14592694b <.text+0x592594b>
1459268db:     	movq	(%rbp), %rcx
1459268df:     	movw	$0x8, %dx
1459268e3:     	movzwl	0x36(%rax), %r9d
1459268e8:     	movl	%r9d, %r10d
1459268eb:     	addl	%r10d, %r10d
1459268ee:     	movq	$-0x1, %r8
1459268f5:     	nopw	%cs:(%rax,%rax)
145926900:     	testq	%r10, %r10
145926903:     	je	0x145926930 <.text+0x5925930>
145926905:     	cmpw	0x3a(%rax,%r8,2), %dx
14592690b:     	seta	%r11b
14592690f:     	sbbb	$0x0, %r11b
145926913:     	incq	%r8
145926916:     	addq	$-0x2, %r10
14592691a:     	cmpb	$0x1, %r11b
14592691e:     	je	0x145926900 <.text+0x5925900>
145926920:     	movzbl	%r11b, %r9d
145926924:     	testl	%r9d, %r9d
145926927:     	je	0x145926940 <.text+0x5925940>
145926929:     	jmp	0x145926933 <.text+0x5925933>
14592692b:     	nopl	(%rax,%rax)
145926930:     	movq	%r9, %r8
145926933:     	subq	$0x1, %rcx
145926937:     	jb	0x14592694d <.text+0x592594d>
145926939:     	movq	0x50(%rax,%r8,8), %rax
14592693e:     	jmp	0x1459268e3 <.text+0x59258e3>
145926940:     	movl	$0x1, 0x8(%rax,%r8,4)
145926949:     	jmp	0x14592697d <.text+0x592597d>
14592694b:     	xorl	%eax, %eax
14592694d:     	movq	%r14, 0x10(%rbp)
145926951:     	movq	%rax, 0x18(%rbp)
145926955:     	movq	$0x0, 0x20(%rbp)
14592695d:     	movq	%r8, 0x28(%rbp)
145926961:     	movq	$0x8, 0x30(%rbp)
145926969:     	leaq	-0x28(%rbp), %rcx
14592696d:     	leaq	0x10(%rbp), %rdx
145926971:     	movl	$0x1, %r8d
145926977:     	callq	0x1458e1710 <.text+0x58e0710>
14592697c:     	nop
14592697d:     	movq	-0x8(%rbp), %rax
145926981:     	testq	%rax, %rax
145926984:     	je	0x1459269e7 <.text+0x59259e7>
145926986:     	movq	(%rbp), %rcx
14592698a:     	movw	$0x9, %dx
14592698e:     	movzwl	0x36(%rax), %r9d
145926993:     	movl	%r9d, %r10d
145926996:     	addl	%r10d, %r10d
145926999:     	movq	$-0x1, %r8
1459269a0:     	testq	%r10, %r10
1459269a3:     	je	0x1459269d0 <.text+0x59259d0>
1459269a5:     	cmpw	0x3a(%rax,%r8,2), %dx
1459269ab:     	seta	%r11b
1459269af:     	sbbb	$0x0, %r11b
1459269b3:     	incq	%r8
1459269b6:     	addq	$-0x2, %r10
1459269ba:     	cmpb	$0x1, %r11b
1459269be:     	je	0x1459269a0 <.text+0x59259a0>
1459269c0:     	movzbl	%r11b, %r9d
1459269c4:     	testl	%r9d, %r9d
1459269c7:     	je	0x1459269e0 <.text+0x59259e0>
1459269c9:     	jmp	0x1459269d3 <.text+0x59259d3>
1459269cb:     	nopl	(%rax,%rax)
1459269d0:     	movq	%r9, %r8
1459269d3:     	subq	$0x1, %rcx
1459269d7:     	jb	0x1459269e9 <.text+0x59259e9>
1459269d9:     	movq	0x50(%rax,%r8,8), %rax
1459269de:     	jmp	0x14592698e <.text+0x592598e>
1459269e0:     	movl	%r15d, 0x8(%rax,%r8,4)
1459269e5:     	jmp	0x145926a16 <.text+0x5925a16>
1459269e7:     	xorl	%eax, %eax
1459269e9:     	movq	%r14, 0x10(%rbp)
1459269ed:     	movq	%rax, 0x18(%rbp)
1459269f1:     	movq	$0x0, 0x20(%rbp)
1459269f9:     	movq	%r8, 0x28(%rbp)
1459269fd:     	movq	$0x9, 0x30(%rbp)
145926a05:     	leaq	-0x28(%rbp), %rcx
145926a09:     	leaq	0x10(%rbp), %rdx
145926a0d:     	movl	%r15d, %r8d
145926a10:     	callq	0x1458e1710 <.text+0x58e0710>
145926a15:     	nop
145926a16:     	movq	-0x8(%rbp), %rax
145926a1a:     	testq	%rax, %rax
145926a1d:     	je	0x145926a89 <.text+0x5925a89>
145926a1f:     	movq	(%rbp), %rcx
145926a23:     	movw	$0xa, %dx
145926a27:     	movzwl	0x36(%rax), %r8d
145926a2c:     	movl	%r8d, %r10d
145926a2f:     	addl	%r10d, %r10d
145926a32:     	movq	$-0x1, %r9
145926a39:     	nopl	(%rax)
145926a40:     	testq	%r10, %r10
145926a43:     	je	0x145926a70 <.text+0x5925a70>
145926a45:     	cmpw	0x3a(%rax,%r9,2), %dx
145926a4b:     	seta	%r11b
145926a4f:     	sbbb	$0x0, %r11b
145926a53:     	incq	%r9
145926a56:     	addq	$-0x2, %r10
145926a5a:     	cmpb	$0x1, %r11b
145926a5e:     	je	0x145926a40 <.text+0x5925a40>
145926a60:     	movzbl	%r11b, %r8d
145926a64:     	testl	%r8d, %r8d
145926a67:     	je	0x145926a80 <.text+0x5925a80>
145926a69:     	jmp	0x145926a73 <.text+0x5925a73>
145926a6b:     	nopl	(%rax,%rax)
145926a70:     	movq	%r8, %r9
145926a73:     	subq	$0x1, %rcx
145926a77:     	jb	0x145926a8b <.text+0x5925a8b>
145926a79:     	movq	0x50(%rax,%r9,8), %rax
145926a7e:     	jmp	0x145926a27 <.text+0x5925a27>
145926a80:     	movss	%xmm6, 0x8(%rax,%r9,4)
145926a87:     	jmp	0x145926aba <.text+0x5925aba>
145926a89:     	xorl	%eax, %eax
145926a8b:     	movd	%xmm6, %r8d
145926a90:     	movq	%r14, 0x10(%rbp)
145926a94:     	movq	%rax, 0x18(%rbp)
145926a98:     	movq	$0x0, 0x20(%rbp)
145926aa0:     	movq	%r9, 0x28(%rbp)
145926aa4:     	movq	$0xa, 0x30(%rbp)
145926aac:     	leaq	-0x28(%rbp), %rcx
145926ab0:     	leaq	0x10(%rbp), %rdx
145926ab4:     	callq	0x1458e1710 <.text+0x58e0710>
145926ab9:     	nop
145926aba:     	movd	(%rbx), %xmm0
145926abe:     	movq	-0x8(%rbp), %rax
145926ac2:     	testq	%rax, %rax
145926ac5:     	je	0x145926b39 <.text+0x5925b39>
145926ac7:     	movq	(%rbp), %rcx
145926acb:     	movw	$0xb, %dx
145926acf:     	movzwl	0x36(%rax), %r8d
145926ad4:     	movl	%r8d, %r10d
145926ad7:     	addl	%r10d, %r10d
145926ada:     	movq	$-0x1, %r9
145926ae1:     	nopw	%cs:(%rax,%rax)
145926af0:     	testq	%r10, %r10
145926af3:     	je	0x145926b20 <.text+0x5925b20>
145926af5:     	cmpw	0x3a(%rax,%r9,2), %dx
145926afb:     	seta	%r11b
145926aff:     	sbbb	$0x0, %r11b
145926b03:     	incq	%r9
145926b06:     	addq	$-0x2, %r10
145926b0a:     	cmpb	$0x1, %r11b
145926b0e:     	je	0x145926af0 <.text+0x5925af0>
145926b10:     	movzbl	%r11b, %r8d
145926b14:     	testl	%r8d, %r8d
145926b17:     	je	0x145926b30 <.text+0x5925b30>
145926b19:     	jmp	0x145926b23 <.text+0x5925b23>
145926b1b:     	nopl	(%rax,%rax)
145926b20:     	movq	%r8, %r9
145926b23:     	subq	$0x1, %rcx
145926b27:     	jb	0x145926b3b <.text+0x5925b3b>
145926b29:     	movq	0x50(%rax,%r9,8), %rax
145926b2e:     	jmp	0x145926acf <.text+0x5925acf>
145926b30:     	movd	%xmm0, 0x8(%rax,%r9,4)
145926b37:     	jmp	0x145926b6a <.text+0x5925b6a>
145926b39:     	xorl	%eax, %eax
145926b3b:     	movd	%xmm0, %r8d
145926b40:     	movq	%r14, 0x10(%rbp)
145926b44:     	movq	%rax, 0x18(%rbp)
145926b48:     	movq	$0x0, 0x20(%rbp)
145926b50:     	movq	%r9, 0x28(%rbp)
145926b54:     	movq	$0xb, 0x30(%rbp)
145926b5c:     	leaq	-0x28(%rbp), %rcx
145926b60:     	leaq	0x10(%rbp), %rdx
145926b64:     	callq	0x1458e1710 <.text+0x58e0710>
145926b69:     	nop
145926b6a:     	movd	0x4(%rbx), %xmm0
145926b6f:     	movq	-0x8(%rbp), %rax
145926b73:     	testq	%rax, %rax
145926b76:     	je	0x145926be9 <.text+0x5925be9>
145926b78:     	movq	(%rbp), %rcx
145926b7c:     	movw	$0xc, %dx
145926b80:     	movzwl	0x36(%rax), %r8d
145926b85:     	movl	%r8d, %r10d
145926b88:     	addl	%r10d, %r10d
145926b8b:     	movq	$-0x1, %r9
145926b92:     	nopw	%cs:(%rax,%rax)
145926ba0:     	testq	%r10, %r10
145926ba3:     	je	0x145926bd0 <.text+0x5925bd0>
145926ba5:     	cmpw	0x3a(%rax,%r9,2), %dx
145926bab:     	seta	%r11b
145926baf:     	sbbb	$0x0, %r11b
145926bb3:     	incq	%r9
145926bb6:     	addq	$-0x2, %r10
145926bba:     	cmpb	$0x1, %r11b
145926bbe:     	je	0x145926ba0 <.text+0x5925ba0>
145926bc0:     	movzbl	%r11b, %r8d
145926bc4:     	testl	%r8d, %r8d
145926bc7:     	je	0x145926be0 <.text+0x5925be0>
145926bc9:     	jmp	0x145926bd3 <.text+0x5925bd3>
145926bcb:     	nopl	(%rax,%rax)
145926bd0:     	movq	%r8, %r9
145926bd3:     	subq	$0x1, %rcx
145926bd7:     	jb	0x145926beb <.text+0x5925beb>
145926bd9:     	movq	0x50(%rax,%r9,8), %rax
145926bde:     	jmp	0x145926b80 <.text+0x5925b80>
145926be0:     	movd	%xmm0, 0x8(%rax,%r9,4)
145926be7:     	jmp	0x145926c1a <.text+0x5925c1a>
145926be9:     	xorl	%eax, %eax
145926beb:     	movd	%xmm0, %r8d
145926bf0:     	movq	%r14, 0x10(%rbp)
145926bf4:     	movq	%rax, 0x18(%rbp)
145926bf8:     	movq	$0x0, 0x20(%rbp)
145926c00:     	movq	%r9, 0x28(%rbp)
145926c04:     	movq	$0xc, 0x30(%rbp)
145926c0c:     	leaq	-0x28(%rbp), %rcx
145926c10:     	leaq	0x10(%rbp), %rdx
145926c14:     	callq	0x1458e1710 <.text+0x58e0710>
145926c19:     	nop
145926c1a:     	movd	0x8(%rbx), %xmm0
145926c1f:     	movq	-0x8(%rbp), %rax
145926c23:     	testq	%rax, %rax
145926c26:     	je	0x145926c99 <.text+0x5925c99>
145926c28:     	movq	(%rbp), %rcx
145926c2c:     	movw	$0xd, %dx
145926c30:     	movzwl	0x36(%rax), %r8d
145926c35:     	movl	%r8d, %r10d
145926c38:     	addl	%r10d, %r10d
145926c3b:     	movq	$-0x1, %r9
145926c42:     	nopw	%cs:(%rax,%rax)
145926c50:     	testq	%r10, %r10
145926c53:     	je	0x145926c80 <.text+0x5925c80>
145926c55:     	cmpw	0x3a(%rax,%r9,2), %dx
145926c5b:     	seta	%r11b
145926c5f:     	sbbb	$0x0, %r11b
145926c63:     	incq	%r9
145926c66:     	addq	$-0x2, %r10
145926c6a:     	cmpb	$0x1, %r11b
145926c6e:     	je	0x145926c50 <.text+0x5925c50>
145926c70:     	movzbl	%r11b, %r8d
145926c74:     	testl	%r8d, %r8d
145926c77:     	je	0x145926c90 <.text+0x5925c90>
145926c79:     	jmp	0x145926c83 <.text+0x5925c83>
145926c7b:     	nopl	(%rax,%rax)
145926c80:     	movq	%r8, %r9
145926c83:     	subq	$0x1, %rcx
145926c87:     	jb	0x145926c9b <.text+0x5925c9b>
145926c89:     	movq	0x50(%rax,%r9,8), %rax
145926c8e:     	jmp	0x145926c30 <.text+0x5925c30>
145926c90:     	movd	%xmm0, 0x8(%rax,%r9,4)
145926c97:     	jmp	0x145926cca <.text+0x5925cca>
145926c99:     	xorl	%eax, %eax
145926c9b:     	movd	%xmm0, %r8d
145926ca0:     	movq	%r14, 0x10(%rbp)
145926ca4:     	movq	%rax, 0x18(%rbp)
145926ca8:     	movq	$0x0, 0x20(%rbp)
145926cb0:     	movq	%r9, 0x28(%rbp)
145926cb4:     	movq	$0xd, 0x30(%rbp)
145926cbc:     	leaq	-0x28(%rbp), %rcx
145926cc0:     	leaq	0x10(%rbp), %rdx
145926cc4:     	callq	0x1458e1710 <.text+0x58e0710>
145926cc9:     	nop
145926cca:     	movq	-0x8(%rbp), %rax
145926cce:     	testq	%rax, %rax
145926cd1:     	je	0x145926d3b <.text+0x5925d3b>
145926cd3:     	movq	(%rbp), %rcx
145926cd7:     	movw	$0xe, %dx
145926cdb:     	movzwl	0x36(%rax), %r9d
145926ce0:     	movl	%r9d, %r10d
145926ce3:     	addl	%r10d, %r10d
145926ce6:     	movq	$-0x1, %r8
145926ced:     	nopl	(%rax)
145926cf0:     	testq	%r10, %r10
145926cf3:     	je	0x145926d20 <.text+0x5925d20>
145926cf5:     	cmpw	0x3a(%rax,%r8,2), %dx
145926cfb:     	seta	%r11b
145926cff:     	sbbb	$0x0, %r11b
145926d03:     	incq	%r8
145926d06:     	addq	$-0x2, %r10
145926d0a:     	cmpb	$0x1, %r11b
145926d0e:     	je	0x145926cf0 <.text+0x5925cf0>
145926d10:     	movzbl	%r11b, %r9d
145926d14:     	testl	%r9d, %r9d
145926d17:     	je	0x145926d30 <.text+0x5925d30>
145926d19:     	jmp	0x145926d23 <.text+0x5925d23>
145926d1b:     	nopl	(%rax,%rax)
145926d20:     	movq	%r9, %r8
145926d23:     	subq	$0x1, %rcx
145926d27:     	jb	0x145926d3d <.text+0x5925d3d>
145926d29:     	movq	0x50(%rax,%r8,8), %rax
145926d2e:     	jmp	0x145926cdb <.text+0x5925cdb>
145926d30:     	movl	$0x0, 0x8(%rax,%r8,4)
145926d39:     	jmp	0x145926d6a <.text+0x5925d6a>
145926d3b:     	xorl	%eax, %eax
145926d3d:     	movq	%r14, 0x10(%rbp)
145926d41:     	movq	%rax, 0x18(%rbp)
145926d45:     	movq	$0x0, 0x20(%rbp)
145926d4d:     	movq	%r8, 0x28(%rbp)
145926d51:     	movq	$0xe, 0x30(%rbp)
145926d59:     	leaq	-0x28(%rbp), %rcx
145926d5d:     	leaq	0x10(%rbp), %rdx
145926d61:     	xorl	%r8d, %r8d
145926d64:     	callq	0x1458e1710 <.text+0x58e0710>
145926d69:     	nop
145926d6a:     	movl	$0x0, -0x30(%rbp)
145926d71:     	movq	$0x0, -0x48(%rbp)
145926d79:     	movq	$0x1, -0x40(%rbp)
145926d81:     	movq	$0x0, -0x38(%rbp)
145926d89:     	movb	$0x1, 0x47(%rbp)
145926d8d:     	movq	%r14, 0x28(%rsp)
145926d92:     	movl	$0x0, 0x20(%rsp)
145926d9a:     	leaq	-0x48(%rbp), %rcx
145926d9e:     	movq	%rsi, %rdx
145926da1:     	movb	$0x6, %r8b
145926da4:     	movq	%rbx, %r9
145926da7:     	callq	0x1458a8160 <.text+0x58a7160>
145926dac:     	nop
145926dad:     	movdqu	-0x48(%rbp), %xmm0
145926db2:     	movups	-0x38(%rbp), %xmm1
145926db6:     	movaps	%xmm1, 0x20(%rbp)
145926dba:     	movdqa	%xmm0, 0x10(%rbp)
145926dbf:     	movb	$0x0, 0x47(%rbp)
145926dc3:     	leaq	-0x28(%rbp), %rcx
145926dc7:     	leaq	0x10(%rbp), %rdx
145926dcb:     	callq	0x1458a83c0 <.text+0x58a73c0>
145926dd0:     	nop
145926dd1:     	movq	0x5e0(%rdi), %rbx
145926dd8:     	cmpq	0x5d0(%rdi), %rbx
145926ddf:     	jne	0x145926dee <.text+0x5925dee>
145926de1:     	leaq	0x5d0(%rdi), %rcx
145926de8:     	callq	0x145bcb530 <.text+0x5bca530>
145926ded:     	nop
145926dee:     	movq	0x5d8(%rdi), %rax
145926df5:     	movq	%rbx, %rcx
145926df8:     	shlq	$0x5, %rcx
145926dfc:     	movups	-0x28(%rbp), %xmm0
145926e00:     	movups	-0x18(%rbp), %xmm1
145926e04:     	movups	%xmm1, 0x10(%rax,%rcx)
145926e09:     	movups	%xmm0, (%rax,%rcx)
145926e0d:     	incq	%rbx
145926e10:     	movq	%rbx, 0x5e0(%rdi)
145926e17:     	leaq	-0x8(%rbp), %rcx
145926e1b:     	callq	0x145994a00 <.text+0x5993a00>
145926e20:     	movq	%rsi, %rax
145926e23:     	movaps	0x50(%rbp), %xmm6
145926e27:     	movaps	0x60(%rbp), %xmm7
145926e2b:     	addq	$0xf8, %rsp
145926e32:     	popq	%rbx
145926e33:     	popq	%rdi
145926e34:     	popq	%rsi
145926e35:     	popq	%r14
145926e37:     	popq	%r15
145926e39:     	popq	%rbp
145926e3a:     	retq

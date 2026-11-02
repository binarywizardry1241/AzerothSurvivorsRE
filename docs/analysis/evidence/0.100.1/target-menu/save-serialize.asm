
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145436620:     	pushq	%rbp
145436621:     	pushq	%r15
145436623:     	pushq	%r14
145436625:     	pushq	%r13
145436627:     	pushq	%r12
145436629:     	pushq	%rsi
14543662a:     	pushq	%rdi
14543662b:     	pushq	%rbx
14543662c:     	subq	$0x1a8, %rsp            # imm = 0x1A8
145436633:     	leaq	0x80(%rsp), %rbp
14543663b:     	movq	$-0x2, 0x120(%rbp)
145436646:     	movq	%rcx, -0x58(%rbp)
14543664a:     	movq	$0x0, 0xf8(%rbp)
145436655:     	movq	$0x1, 0x100(%rbp)
145436660:     	movq	$0x0, 0x108(%rbp)
14543666b:     	movq	0x8(%rdx), %rsi
14543666f:     	movq	%rdx, 0xb8(%rbp)
145436676:     	imulq	$0x38, 0x10(%rdx), %rbx
14543667b:     	addq	%rsi, %rbx
14543667e:     	movq	%rbp, %r15
145436681:     	leaq	0x130735b(%rip), %r12   # 0x14673d9e3
145436688:     	jmp	0x145436693 <.text+0x5435693>
14543668a:     	nopw	(%rax,%rax)
145436690:     	movq	%r13, %rsi
145436693:     	cmpq	%rbx, %rsi
145436696:     	je	0x1454368e6 <.text+0x54358e6>
14543669c:     	leaq	0x38(%rsi), %r13
1454366a0:     	leaq	0x33(%rsi), %rdx
1454366a4:     	leaq	0xa0(%rbp), %rcx
1454366ab:     	movq	%r13, %r8
1454366ae:     	callq	0x1455441f0 <.text+0x55431f0>
1454366b3:     	nop
1454366b4:     	movq	0xa8(%rbp), %rdi
1454366bb:     	movq	0xb0(%rbp), %r14
1454366c2:     	movq	$0x1, 0x20(%rsp)
1454366cb:     	movq	%r15, %rcx
1454366ce:     	movq	%rdi, %rdx
1454366d1:     	movq	%r14, %r8
1454366d4:     	leaq	0x1306fb5(%rip), %r9    # 0x14673d690
1454366db:     	callq	0x14546ac40 <.text+0x5469c40>
1454366e0:     	nop
1454366e1:     	leaq	0x32(%rsi), %rax
1454366e5:     	leaq	0x31(%rsi), %rcx
1454366e9:     	leaq	0x30(%rsi), %rdx
1454366ed:     	leaq	0x18(%rsi), %r8
1454366f1:     	movq	0x10(%rbp), %r9
1454366f5:     	movq	%r9, 0xf0(%rbp)
1454366fc:     	movdqu	(%rbp), %xmm0
145436701:     	movdqa	%xmm0, 0xe0(%rbp)
145436709:     	leaq	0x20(%rsi), %r9
14543670d:     	leaq	0x24(%rsi), %r10
145436711:     	leaq	0x28(%rsi), %r11
145436715:     	movq	%r8, (%rbp)
145436719:     	leaq	0x304c20(%rip), %r8     # 0x14573b340 <.text+0x573a340>
145436720:     	movq	%r8, 0x8(%rbp)
145436724:     	movq	%rsi, 0x10(%rbp)
145436728:     	addq	$0x2c, %rsi
14543672c:     	leaq	-0x5434653(%rip), %r8   # 0x1400020e0 <.text+0x10e0>
145436733:     	movq	%r8, 0x18(%rbp)
145436737:     	movq	%rdx, 0x20(%rbp)
14543673b:     	leaq	0x3005de(%rip), %rdx    # 0x145736d20 <.text+0x5735d20>
145436742:     	movq	%rdx, 0x28(%rbp)
145436746:     	movq	%rcx, 0x30(%rbp)
14543674a:     	movq	%rdx, 0x38(%rbp)
14543674e:     	movq	%rax, 0x40(%rbp)
145436752:     	movq	%rdx, 0x48(%rbp)
145436756:     	leaq	0xe0(%rbp), %rax
14543675d:     	movq	%rax, 0x50(%rbp)
145436761:     	movq	%r8, 0x58(%rbp)
145436765:     	movq	%r9, 0x60(%rbp)
145436769:     	leaq	0x303ce0(%rip), %rax    # 0x14573a450 <.text+0x5739450>
145436770:     	movq	%rax, 0x68(%rbp)
145436774:     	movq	%r10, 0x70(%rbp)
145436778:     	movq	%rax, 0x78(%rbp)
14543677c:     	movq	%r11, 0x80(%rbp)
145436783:     	movq	%rax, 0x88(%rbp)
14543678a:     	movq	%rsi, 0x90(%rbp)
145436791:     	movq	%rax, 0x98(%rbp)
145436798:     	leaq	0xc0(%rbp), %rcx
14543679f:     	movq	%r12, %rdx
1454367a2:     	movq	%r15, %r8
1454367a5:     	callq	0x145728390 <.text+0x5727390>
1454367aa:     	nop
1454367ab:     	movq	0xe0(%rbp), %rdx
1454367b2:     	testq	%rdx, %rdx
1454367b5:     	je	0x1454367c9 <.text+0x54357c9>
1454367b7:     	movq	0xe8(%rbp), %rcx
1454367be:     	movl	$0x1, %r8d
1454367c4:     	callq	0x1400021d0 <.text+0x11d0>
1454367c9:     	movq	0xc0(%rbp), %rax
1454367d0:     	movq	%rax, 0x110(%rbp)
1454367d7:     	movq	0xc8(%rbp), %rax
1454367de:     	movq	%rax, 0x118(%rbp)
1454367e5:     	movq	0xd0(%rbp), %rsi
1454367ec:     	movq	0xf8(%rbp), %rax
1454367f3:     	movq	0x108(%rbp), %rdx
1454367fa:     	subq	%rdx, %rax
1454367fd:     	cmpq	%rax, %rsi
145436800:     	ja	0x1454368bb <.text+0x54358bb>
145436806:     	testq	%rsi, %rsi
145436809:     	je	0x14543682b <.text+0x543582b>
14543680b:     	addq	0x100(%rbp), %rdx
145436812:     	movq	%rdx, %rcx
145436815:     	movq	0x118(%rbp), %rdx
14543681c:     	movq	%rsi, %r8
14543681f:     	callq	0x1457731ed <.text+0x57721ed>
145436824:     	movq	0x108(%rbp), %rdx
14543682b:     	addq	%rsi, %rdx
14543682e:     	movq	%rdx, 0x108(%rbp)
145436835:     	movq	0x110(%rbp), %rdx
14543683c:     	testq	%rdx, %rdx
14543683f:     	je	0x145436853 <.text+0x5435853>
145436841:     	movl	$0x1, %r8d
145436847:     	movq	0x118(%rbp), %rcx
14543684e:     	callq	0x1400021d0 <.text+0x11d0>
145436853:     	testq	%r14, %r14
145436856:     	je	0x145436890 <.text+0x5435890>
145436858:     	leaq	0x8(%rdi), %rsi
14543685c:     	jmp	0x145436869 <.text+0x5435869>
14543685e:     	nop
145436860:     	addq	$0x18, %rsi
145436864:     	decq	%r14
145436867:     	je	0x145436890 <.text+0x5435890>
145436869:     	movq	-0x8(%rsi), %rdx
14543686d:     	testq	%rdx, %rdx
145436870:     	je	0x145436860 <.text+0x5435860>
145436872:     	movq	(%rsi), %rcx
145436875:     	movl	$0x1, %r8d
14543687b:     	callq	0x1400021d0 <.text+0x11d0>
145436880:     	jmp	0x145436860 <.text+0x5435860>
145436882:     	nopw	%cs:(%rax,%rax)
145436890:     	movq	0xa0(%rbp), %rax
145436897:     	testq	%rax, %rax
14543689a:     	je	0x145436690 <.text+0x5435690>
1454368a0:     	shlq	$0x3, %rax
1454368a4:     	leaq	(%rax,%rax,2), %rdx
1454368a8:     	movl	$0x8, %r8d
1454368ae:     	movq	%rdi, %rcx
1454368b1:     	callq	0x1400021d0 <.text+0x11d0>
1454368b6:     	jmp	0x145436690 <.text+0x5435690>
1454368bb:     	movq	$0x1, 0x20(%rsp)
1454368c4:     	movl	$0x1, %r9d
1454368ca:     	leaq	0xf8(%rbp), %rcx
1454368d1:     	movq	%rsi, %r8
1454368d4:     	callq	0x1457744b0 <.text+0x57734b0>
1454368d9:     	nop
1454368da:     	movq	0x108(%rbp), %rdx
1454368e1:     	jmp	0x14543680b <.text+0x543580b>
1454368e6:     	movq	0xb8(%rbp), %r14
1454368ed:     	cmpq	$-0x1, 0x150(%r14)
1454368f5:     	je	0x145436af8 <.text+0x5435af8>
1454368fb:     	leaq	0x18b(%r14), %rdx
145436902:     	leaq	0x190(%r14), %r8
145436909:     	leaq	0xa0(%rbp), %rcx
145436910:     	callq	0x1455441f0 <.text+0x55431f0>
145436915:     	nop
145436916:     	movq	0xa8(%rbp), %rsi
14543691d:     	movq	0xb0(%rbp), %rdi
145436924:     	movq	$0x1, 0x20(%rsp)
14543692d:     	leaq	0x1306d5c(%rip), %r9    # 0x14673d690
145436934:     	movq	%rbp, %rcx
145436937:     	movq	%rsi, %rdx
14543693a:     	movq	%rdi, %r8
14543693d:     	callq	0x14546ac40 <.text+0x5469c40>
145436942:     	nop
145436943:     	movq	0x10(%rbp), %rax
145436947:     	movq	%rax, 0xd0(%rbp)
14543694e:     	movdqu	(%rbp), %xmm0
145436953:     	movdqa	%xmm0, 0xc0(%rbp)
14543695b:     	movq	0xb8(%rbp), %r14
145436962:     	leaq	0x180(%r14), %rdx
145436969:     	leaq	0xe0(%rbp), %rbx
145436970:     	movq	%rbx, %rcx
145436973:     	callq	0x145451650 <.text+0x5450650>
145436978:     	nop
145436979:     	leaq	0x150(%r14), %rax
145436980:     	leaq	0x188(%r14), %rcx
145436987:     	leaq	0x189(%r14), %rdx
14543698e:     	leaq	0x18a(%r14), %r8
145436995:     	leaq	0x168(%r14), %r9
14543699c:     	movq	%rcx, (%rbp)
1454369a0:     	leaq	0x300379(%rip), %rcx    # 0x145736d20 <.text+0x5735d20>
1454369a7:     	movq	%rcx, 0x8(%rbp)
1454369ab:     	movq	%rdx, 0x10(%rbp)
1454369af:     	movq	%rcx, 0x18(%rbp)
1454369b3:     	movq	%r8, 0x20(%rbp)
1454369b7:     	movq	%rcx, 0x28(%rbp)
1454369bb:     	movq	%r9, 0x30(%rbp)
1454369bf:     	leaq	-0x54348e6(%rip), %rcx  # 0x1400020e0 <.text+0x10e0>
1454369c6:     	movq	%rcx, 0x38(%rbp)
1454369ca:     	movq	%rax, 0x40(%rbp)
1454369ce:     	movq	%rcx, 0x48(%rbp)
1454369d2:     	leaq	0xc0(%rbp), %rax
1454369d9:     	movq	%rax, 0x50(%rbp)
1454369dd:     	movq	%rcx, 0x58(%rbp)
1454369e1:     	movq	%rbx, 0x60(%rbp)
1454369e5:     	movq	%rcx, 0x68(%rbp)
1454369e9:     	leaq	0x1307140(%rip), %rdx   # 0x14673db30
1454369f0:     	leaq	-0x20(%rbp), %rcx
1454369f4:     	movq	%rbp, %r8
1454369f7:     	callq	0x145728390 <.text+0x5727390>
1454369fc:     	nop
1454369fd:     	movq	0xe0(%rbp), %rdx
145436a04:     	testq	%rdx, %rdx
145436a07:     	je	0x145436a1b <.text+0x5435a1b>
145436a09:     	movq	0xe8(%rbp), %rcx
145436a10:     	movl	$0x1, %r8d
145436a16:     	callq	0x1400021d0 <.text+0x11d0>
145436a1b:     	movq	0xc0(%rbp), %rdx
145436a22:     	testq	%rdx, %rdx
145436a25:     	je	0x145436a39 <.text+0x5435a39>
145436a27:     	movq	0xc8(%rbp), %rcx
145436a2e:     	movl	$0x1, %r8d
145436a34:     	callq	0x1400021d0 <.text+0x11d0>
145436a39:     	testq	%rdi, %rdi
145436a3c:     	je	0x145436a72 <.text+0x5435a72>
145436a3e:     	leaq	0x8(%rsi), %rbx
145436a42:     	jmp	0x145436a59 <.text+0x5435a59>
145436a44:     	nopw	%cs:(%rax,%rax)
145436a50:     	addq	$0x18, %rbx
145436a54:     	decq	%rdi
145436a57:     	je	0x145436a72 <.text+0x5435a72>
145436a59:     	movq	-0x8(%rbx), %rdx
145436a5d:     	testq	%rdx, %rdx
145436a60:     	je	0x145436a50 <.text+0x5435a50>
145436a62:     	movq	(%rbx), %rcx
145436a65:     	movl	$0x1, %r8d
145436a6b:     	callq	0x1400021d0 <.text+0x11d0>
145436a70:     	jmp	0x145436a50 <.text+0x5435a50>
145436a72:     	movq	0xa0(%rbp), %rax
145436a79:     	testq	%rax, %rax
145436a7c:     	je	0x145436a94 <.text+0x5435a94>
145436a7e:     	shlq	$0x3, %rax
145436a82:     	leaq	(%rax,%rax,2), %rdx
145436a86:     	movl	$0x8, %r8d
145436a8c:     	movq	%rsi, %rcx
145436a8f:     	callq	0x1400021d0 <.text+0x11d0>
145436a94:     	movq	-0x18(%rbp), %rdi
145436a98:     	movq	-0x10(%rbp), %rsi
145436a9c:     	movq	0xf8(%rbp), %rax
145436aa3:     	movq	0x108(%rbp), %rdx
145436aaa:     	subq	%rdx, %rax
145436aad:     	cmpq	%rax, %rsi
145436ab0:     	ja	0x1454387f3 <.text+0x54377f3>
145436ab6:     	testq	%rsi, %rsi
145436ab9:     	je	0x145436ad7 <.text+0x5435ad7>
145436abb:     	addq	0x100(%rbp), %rdx
145436ac2:     	movq	%rdx, %rcx
145436ac5:     	movq	%rdi, %rdx
145436ac8:     	movq	%rsi, %r8
145436acb:     	callq	0x1457731ed <.text+0x57721ed>
145436ad0:     	movq	0x108(%rbp), %rdx
145436ad7:     	addq	%rsi, %rdx
145436ada:     	movq	%rdx, 0x108(%rbp)
145436ae1:     	movq	-0x20(%rbp), %rdx
145436ae5:     	testq	%rdx, %rdx
145436ae8:     	je	0x145436af8 <.text+0x5435af8>
145436aea:     	movl	$0x1, %r8d
145436af0:     	movq	%rdi, %rcx
145436af3:     	callq	0x1400021d0 <.text+0x11d0>
145436af8:     	movq	0x20(%r14), %r15
145436afc:     	movq	0x28(%r14), %r12
145436b00:     	shlq	$0x4, %r12
145436b04:     	addq	%r15, %r12
145436b07:     	leaq	0x12fca0a(%rip), %r13   # 0x146733518
145436b0e:     	leaq	0x1306f0b(%rip), %rsi   # 0x14673da20
145436b15:     	movq	%rbp, %rdi
145436b18:     	leaq	0xf8(%rbp), %rbx
145436b1f:     	jmp	0x145436b34 <.text+0x5435b34>
145436b21:     	nopw	%cs:(%rax,%rax)
145436b30:     	addq	$0x10, %r15
145436b34:     	cmpq	%r12, %r15
145436b37:     	je	0x145436c65 <.text+0x5435c65>
145436b3d:     	movzbl	(%r15), %eax
145436b41:     	movb	%al, 0xc0(%rbp)
145436b47:     	movq	0x8(%r15), %rcx
145436b4b:     	cmpq	$0xc, %rcx
145436b4f:     	movl	$0xc, %eax
145436b54:     	cmovbq	%rcx, %rax
145436b58:     	decq	%rax
145436b5b:     	testq	%rcx, %rcx
145436b5e:     	cmoveq	%rcx, %rax
145436b62:     	cmpq	$0xc, %rax
145436b66:     	jae	0x145438ac0 <.text+0x5437ac0>
145436b6c:     	imulq	$0xf0, %rax, %rax
145436b73:     	addq	%r13, %rax
145436b76:     	addq	$0x8, %rax
145436b7a:     	leaq	0xc0(%rbp), %rcx
145436b81:     	movq	%rcx, (%rbp)
145436b85:     	leaq	0x300194(%rip), %rcx    # 0x145736d20 <.text+0x5735d20>
145436b8c:     	movq	%rcx, 0x8(%rbp)
145436b90:     	movq	%rax, 0x10(%rbp)
145436b94:     	leaq	-0x5434adb(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145436b9b:     	movq	%rax, 0x18(%rbp)
145436b9f:     	leaq	0xe0(%rbp), %rcx
145436ba6:     	movq	%rsi, %rdx
145436ba9:     	movq	%rdi, %r8
145436bac:     	callq	0x145728390 <.text+0x5727390>
145436bb1:     	nop
145436bb2:     	movq	0xe0(%rbp), %rax
145436bb9:     	movq	%rax, 0x110(%rbp)
145436bc0:     	movq	0xe8(%rbp), %rax
145436bc7:     	movq	%rax, 0x118(%rbp)
145436bce:     	movq	0xf0(%rbp), %r14
145436bd5:     	movq	0xf8(%rbp), %rax
145436bdc:     	movq	0x108(%rbp), %rdx
145436be3:     	subq	%rdx, %rax
145436be6:     	cmpq	%rax, %r14
145436be9:     	ja	0x145436c41 <.text+0x5435c41>
145436beb:     	testq	%r14, %r14
145436bee:     	je	0x145436c10 <.text+0x5435c10>
145436bf0:     	addq	0x100(%rbp), %rdx
145436bf7:     	movq	%rdx, %rcx
145436bfa:     	movq	0x118(%rbp), %rdx
145436c01:     	movq	%r14, %r8
145436c04:     	callq	0x1457731ed <.text+0x57721ed>
145436c09:     	movq	0x108(%rbp), %rdx
145436c10:     	addq	%r14, %rdx
145436c13:     	movq	%rdx, 0x108(%rbp)
145436c1a:     	movq	0x110(%rbp), %rdx
145436c21:     	testq	%rdx, %rdx
145436c24:     	je	0x145436b30 <.text+0x5435b30>
145436c2a:     	movl	$0x1, %r8d
145436c30:     	movq	0x118(%rbp), %rcx
145436c37:     	callq	0x1400021d0 <.text+0x11d0>
145436c3c:     	jmp	0x145436b30 <.text+0x5435b30>
145436c41:     	movq	$0x1, 0x20(%rsp)
145436c4a:     	movl	$0x1, %r9d
145436c50:     	movq	%rbx, %rcx
145436c53:     	movq	%r14, %r8
145436c56:     	callq	0x1457744b0 <.text+0x57734b0>
145436c5b:     	nop
145436c5c:     	movq	0x108(%rbp), %rdx
145436c63:     	jmp	0x145436bf0 <.text+0x5435bf0>
145436c65:     	movq	0xb8(%rbp), %r14
145436c6c:     	movq	0x40(%r14), %rax
145436c70:     	testq	%rax, %rax
145436c73:     	je	0x145436de4 <.text+0x5435de4>
145436c79:     	movq	0x38(%r14), %rdx
145436c7d:     	leaq	(%rdx,%rax,4), %r8
145436c81:     	leaq	0xc0(%rbp), %rcx
145436c88:     	callq	0x1455443c0 <.text+0x55433c0>
145436c8d:     	nop
145436c8e:     	movq	0xc8(%rbp), %rsi
145436c95:     	movq	0xd0(%rbp), %rdi
145436c9c:     	movq	$0x1, 0x20(%rsp)
145436ca5:     	leaq	0x13069e4(%rip), %r9    # 0x14673d690
145436cac:     	movq	%rbp, %rcx
145436caf:     	movq	%rsi, %rdx
145436cb2:     	movq	%rdi, %r8
145436cb5:     	callq	0x14546ac40 <.text+0x5469c40>
145436cba:     	nop
145436cbb:     	movq	0x10(%rbp), %rax
145436cbf:     	movq	%rax, 0xf0(%rbp)
145436cc6:     	movdqu	(%rbp), %xmm0
145436ccb:     	movdqa	%xmm0, 0xe0(%rbp)
145436cd3:     	leaq	0xe0(%rbp), %rax
145436cda:     	movq	%rax, 0xa0(%rbp)
145436ce1:     	leaq	-0x5434c08(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145436ce8:     	movq	%rax, 0xa8(%rbp)
145436cef:     	leaq	0x1306d37(%rip), %rdx   # 0x14673da2d
145436cf6:     	movq	%rbp, %rcx
145436cf9:     	leaq	0xa0(%rbp), %r8
145436d00:     	callq	0x145728390 <.text+0x5727390>
145436d05:     	nop
145436d06:     	movq	0xe0(%rbp), %rdx
145436d0d:     	testq	%rdx, %rdx
145436d10:     	je	0x145436d24 <.text+0x5435d24>
145436d12:     	movq	0xe8(%rbp), %rcx
145436d19:     	movl	$0x1, %r8d
145436d1f:     	callq	0x1400021d0 <.text+0x11d0>
145436d24:     	movq	(%rbp), %r15
145436d28:     	movq	0x8(%rbp), %r12
145436d2c:     	movq	0x10(%rbp), %rbx
145436d30:     	movq	0xf8(%rbp), %rax
145436d37:     	movq	0x108(%rbp), %rdx
145436d3e:     	subq	%rdx, %rax
145436d41:     	cmpq	%rax, %rbx
145436d44:     	movq	0xb8(%rbp), %r14
145436d4b:     	ja	0x14543882c <.text+0x543782c>
145436d51:     	testq	%rbx, %rbx
145436d54:     	je	0x145436d72 <.text+0x5435d72>
145436d56:     	addq	0x100(%rbp), %rdx
145436d5d:     	movq	%rdx, %rcx
145436d60:     	movq	%r12, %rdx
145436d63:     	movq	%rbx, %r8
145436d66:     	callq	0x1457731ed <.text+0x57721ed>
145436d6b:     	movq	0x108(%rbp), %rdx
145436d72:     	addq	%rbx, %rdx
145436d75:     	movq	%rdx, 0x108(%rbp)
145436d7c:     	testq	%r15, %r15
145436d7f:     	je	0x145436d92 <.text+0x5435d92>
145436d81:     	movl	$0x1, %r8d
145436d87:     	movq	%r12, %rcx
145436d8a:     	movq	%r15, %rdx
145436d8d:     	callq	0x1400021d0 <.text+0x11d0>
145436d92:     	testq	%rdi, %rdi
145436d95:     	je	0x145436dc2 <.text+0x5435dc2>
145436d97:     	leaq	0x8(%rsi), %rbx
145436d9b:     	jmp	0x145436da9 <.text+0x5435da9>
145436d9d:     	nopl	(%rax)
145436da0:     	addq	$0x18, %rbx
145436da4:     	decq	%rdi
145436da7:     	je	0x145436dc2 <.text+0x5435dc2>
145436da9:     	movq	-0x8(%rbx), %rdx
145436dad:     	testq	%rdx, %rdx
145436db0:     	je	0x145436da0 <.text+0x5435da0>
145436db2:     	movq	(%rbx), %rcx
145436db5:     	movl	$0x1, %r8d
145436dbb:     	callq	0x1400021d0 <.text+0x11d0>
145436dc0:     	jmp	0x145436da0 <.text+0x5435da0>
145436dc2:     	movq	0xc0(%rbp), %rax
145436dc9:     	testq	%rax, %rax
145436dcc:     	je	0x145436de4 <.text+0x5435de4>
145436dce:     	shlq	$0x3, %rax
145436dd2:     	leaq	(%rax,%rax,2), %rdx
145436dd6:     	movl	$0x8, %r8d
145436ddc:     	movq	%rsi, %rcx
145436ddf:     	callq	0x1400021d0 <.text+0x11d0>
145436de4:     	imulq	$0xe8, 0x58(%r14), %rax
145436dec:     	movq	0x50(%r14), %r13
145436df0:     	addq	%r13, %rax
145436df3:     	movq	%rax, 0x118(%rbp)
145436dfa:     	movq	%rbp, %r12
145436dfd:     	jmp	0x145436e07 <.text+0x5435e07>
145436dff:     	nop
145436e00:     	addq	$0xe8, %r13
145436e07:     	cmpq	0x118(%rbp), %r13
145436e0e:     	je	0x14543722a <.text+0x543622a>
145436e14:     	leaq	0x98(%r13), %rsi
145436e1b:     	leaq	0xe4(%r13), %rax
145436e22:     	movb	0xe4(%r13), %r15b
145436e29:     	leaq	0x1306b10(%rip), %rcx   # 0x14673d940
145436e30:     	movq	%rcx, -0x20(%rbp)
145436e34:     	movq	$0x5, -0x18(%rbp)
145436e3c:     	movb	%r15b, -0x28(%rbp)
145436e40:     	movq	%rsi, (%rbp)
145436e44:     	movq	%rax, 0x8(%rbp)
145436e48:     	movq	$0x0, 0x10(%rbp)
145436e50:     	leaq	0xc0(%rbp), %rcx
145436e57:     	movq	%r12, %rdx
145436e5a:     	callq	0x145534650 <.text+0x5533650>
145436e5f:     	nop
145436e60:     	movq	0xc8(%rbp), %rdi
145436e67:     	movq	0xd0(%rbp), %rbx
145436e6e:     	movq	$0x1, 0x20(%rsp)
145436e77:     	movq	%r12, %rcx
145436e7a:     	movq	%rdi, %rdx
145436e7d:     	movq	%rbx, %r8
145436e80:     	leaq	0x1306809(%rip), %r9    # 0x14673d690
145436e87:     	callq	0x14546ac40 <.text+0x5469c40>
145436e8c:     	nop
145436e8d:     	movq	0x10(%rbp), %rax
145436e91:     	movq	%rax, 0xf0(%rbp)
145436e98:     	movdqu	(%rbp), %xmm0
145436e9d:     	movdqa	%xmm0, 0xe0(%rbp)
145436ea5:     	leaq	-0x20(%rbp), %rax
145436ea9:     	movq	%rax, (%rbp)
145436ead:     	leaq	-0x5434df4(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145436eb4:     	movq	%rax, 0x8(%rbp)
145436eb8:     	leaq	-0x28(%rbp), %rax
145436ebc:     	movq	%rax, 0x10(%rbp)
145436ec0:     	leaq	0x2ffe59(%rip), %rax    # 0x145736d20 <.text+0x5735d20>
145436ec7:     	movq	%rax, 0x18(%rbp)
145436ecb:     	leaq	0xe0(%rbp), %rax
145436ed2:     	movq	%rax, 0x20(%rbp)
145436ed6:     	leaq	-0x5434dfd(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145436edd:     	movq	%rax, 0x28(%rbp)
145436ee1:     	leaq	0xa0(%rbp), %rcx
145436ee8:     	leaq	0x13067a2(%rip), %rdx   # 0x14673d691
145436eef:     	movq	%r12, %r8
145436ef2:     	callq	0x145728390 <.text+0x5727390>
145436ef7:     	nop
145436ef8:     	movq	0xe0(%rbp), %rdx
145436eff:     	testq	%rdx, %rdx
145436f02:     	je	0x145436f16 <.text+0x5435f16>
145436f04:     	movq	0xe8(%rbp), %rcx
145436f0b:     	movl	$0x1, %r8d
145436f11:     	callq	0x1400021d0 <.text+0x11d0>
145436f16:     	testq	%rbx, %rbx
145436f19:     	je	0x145436f60 <.text+0x5435f60>
145436f1b:     	leaq	0x8(%rdi), %r14
145436f1f:     	jmp	0x145436f39 <.text+0x5435f39>
145436f21:     	nopw	%cs:(%rax,%rax)
145436f30:     	addq	$0x18, %r14
145436f34:     	decq	%rbx
145436f37:     	je	0x145436f60 <.text+0x5435f60>
145436f39:     	movq	-0x8(%r14), %rdx
145436f3d:     	testq	%rdx, %rdx
145436f40:     	je	0x145436f30 <.text+0x5435f30>
145436f42:     	movq	(%r14), %rcx
145436f45:     	movl	$0x1, %r8d
145436f4b:     	callq	0x1400021d0 <.text+0x11d0>
145436f50:     	jmp	0x145436f30 <.text+0x5435f30>
145436f52:     	nopw	%cs:(%rax,%rax)
145436f60:     	movq	0xc0(%rbp), %rax
145436f67:     	testq	%rax, %rax
145436f6a:     	je	0x145436f82 <.text+0x5435f82>
145436f6c:     	shlq	$0x3, %rax
145436f70:     	leaq	(%rax,%rax,2), %rdx
145436f74:     	movl	$0x8, %r8d
145436f7a:     	movq	%rdi, %rcx
145436f7d:     	callq	0x1400021d0 <.text+0x11d0>
145436f82:     	movq	0xa8(%rbp), %rbx
145436f89:     	movq	0xb0(%rbp), %rdi
145436f90:     	movq	0xf8(%rbp), %rax
145436f97:     	movq	0x108(%rbp), %rdx
145436f9e:     	subq	%rdx, %rax
145436fa1:     	cmpq	%rax, %rdi
145436fa4:     	ja	0x1454371b8 <.text+0x54361b8>
145436faa:     	testq	%rdi, %rdi
145436fad:     	je	0x145436fcb <.text+0x5435fcb>
145436faf:     	addq	0x100(%rbp), %rdx
145436fb6:     	movq	%rdx, %rcx
145436fb9:     	movq	%rbx, %rdx
145436fbc:     	movq	%rdi, %r8
145436fbf:     	callq	0x1457731ed <.text+0x57721ed>
145436fc4:     	movq	0x108(%rbp), %rdx
145436fcb:     	addq	%rdi, %rdx
145436fce:     	movq	%rdx, 0x108(%rbp)
145436fd5:     	movq	0xa0(%rbp), %rdx
145436fdc:     	testq	%rdx, %rdx
145436fdf:     	je	0x145436fef <.text+0x5435fef>
145436fe1:     	movl	$0x1, %r8d
145436fe7:     	movq	%rbx, %rcx
145436fea:     	callq	0x1400021d0 <.text+0x11d0>
145436fef:     	leaq	0x130694f(%rip), %rax   # 0x14673d945
145436ff6:     	movq	%rax, -0x20(%rbp)
145436ffa:     	movq	$0x4, -0x18(%rbp)
145437002:     	movb	%r15b, -0x28(%rbp)
145437006:     	movq	%r13, (%rbp)
14543700a:     	movq	%rsi, 0x8(%rbp)
14543700e:     	movq	$0x0, 0x10(%rbp)
145437016:     	leaq	0xc0(%rbp), %rcx
14543701d:     	movq	%r12, %rdx
145437020:     	callq	0x145534340 <.text+0x5533340>
145437025:     	nop
145437026:     	movq	0xc8(%rbp), %rdi
14543702d:     	movq	0xd0(%rbp), %rbx
145437034:     	movq	$0x1, 0x20(%rsp)
14543703d:     	movq	%r12, %rcx
145437040:     	movq	%rdi, %rdx
145437043:     	movq	%rbx, %r8
145437046:     	leaq	0x1306643(%rip), %r9    # 0x14673d690
14543704d:     	callq	0x14546ac40 <.text+0x5469c40>
145437052:     	nop
145437053:     	movq	0x10(%rbp), %rax
145437057:     	movq	%rax, 0xf0(%rbp)
14543705e:     	movdqu	(%rbp), %xmm0
145437063:     	movdqa	%xmm0, 0xe0(%rbp)
14543706b:     	leaq	-0x20(%rbp), %rax
14543706f:     	movq	%rax, (%rbp)
145437073:     	leaq	-0x5434fba(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14543707a:     	movq	%rax, 0x8(%rbp)
14543707e:     	leaq	-0x28(%rbp), %rax
145437082:     	movq	%rax, 0x10(%rbp)
145437086:     	leaq	0x2ffc93(%rip), %rax    # 0x145736d20 <.text+0x5735d20>
14543708d:     	movq	%rax, 0x18(%rbp)
145437091:     	leaq	0xe0(%rbp), %rax
145437098:     	movq	%rax, 0x20(%rbp)
14543709c:     	leaq	-0x5434fc3(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454370a3:     	movq	%rax, 0x28(%rbp)
1454370a7:     	leaq	0xa0(%rbp), %rcx
1454370ae:     	leaq	0x13065dc(%rip), %rdx   # 0x14673d691
1454370b5:     	movq	%r12, %r8
1454370b8:     	callq	0x145728390 <.text+0x5727390>
1454370bd:     	nop
1454370be:     	movq	0xe0(%rbp), %rdx
1454370c5:     	testq	%rdx, %rdx
1454370c8:     	je	0x1454370dc <.text+0x54360dc>
1454370ca:     	movq	0xe8(%rbp), %rcx
1454370d1:     	movl	$0x1, %r8d
1454370d7:     	callq	0x1400021d0 <.text+0x11d0>
1454370dc:     	testq	%rbx, %rbx
1454370df:     	movq	0xb8(%rbp), %r14
1454370e6:     	je	0x145437120 <.text+0x5436120>
1454370e8:     	leaq	0x8(%rdi), %rsi
1454370ec:     	jmp	0x1454370f9 <.text+0x54360f9>
1454370ee:     	nop
1454370f0:     	addq	$0x18, %rsi
1454370f4:     	decq	%rbx
1454370f7:     	je	0x145437120 <.text+0x5436120>
1454370f9:     	movq	-0x8(%rsi), %rdx
1454370fd:     	testq	%rdx, %rdx
145437100:     	je	0x1454370f0 <.text+0x54360f0>
145437102:     	movq	(%rsi), %rcx
145437105:     	movl	$0x1, %r8d
14543710b:     	callq	0x1400021d0 <.text+0x11d0>
145437110:     	jmp	0x1454370f0 <.text+0x54360f0>
145437112:     	nopw	%cs:(%rax,%rax)
145437120:     	movq	0xc0(%rbp), %rax
145437127:     	testq	%rax, %rax
14543712a:     	je	0x145437142 <.text+0x5436142>
14543712c:     	shlq	$0x3, %rax
145437130:     	leaq	(%rax,%rax,2), %rdx
145437134:     	movl	$0x8, %r8d
14543713a:     	movq	%rdi, %rcx
14543713d:     	callq	0x1400021d0 <.text+0x11d0>
145437142:     	movq	0xa8(%rbp), %rsi
145437149:     	movq	0xb0(%rbp), %rdi
145437150:     	movq	0xf8(%rbp), %rax
145437157:     	movq	0x108(%rbp), %rdx
14543715e:     	subq	%rdx, %rax
145437161:     	cmpq	%rax, %rdi
145437164:     	ja	0x1454371f1 <.text+0x54361f1>
14543716a:     	testq	%rdi, %rdi
14543716d:     	je	0x14543718b <.text+0x543618b>
14543716f:     	addq	0x100(%rbp), %rdx
145437176:     	movq	%rdx, %rcx
145437179:     	movq	%rsi, %rdx
14543717c:     	movq	%rdi, %r8
14543717f:     	callq	0x1457731ed <.text+0x57721ed>
145437184:     	movq	0x108(%rbp), %rdx
14543718b:     	addq	%rdi, %rdx
14543718e:     	movq	%rdx, 0x108(%rbp)
145437195:     	movq	0xa0(%rbp), %rdx
14543719c:     	testq	%rdx, %rdx
14543719f:     	je	0x145436e00 <.text+0x5435e00>
1454371a5:     	movl	$0x1, %r8d
1454371ab:     	movq	%rsi, %rcx
1454371ae:     	callq	0x1400021d0 <.text+0x11d0>
1454371b3:     	jmp	0x145436e00 <.text+0x5435e00>
1454371b8:     	movq	%rbx, 0x110(%rbp)
1454371bf:     	movq	$0x1, 0x20(%rsp)
1454371c8:     	movl	$0x1, %r9d
1454371ce:     	leaq	0xf8(%rbp), %rcx
1454371d5:     	movq	%rdi, %r8
1454371d8:     	callq	0x1457744b0 <.text+0x57734b0>
1454371dd:     	nop
1454371de:     	movq	0x108(%rbp), %rdx
1454371e5:     	movq	0x110(%rbp), %rbx
1454371ec:     	jmp	0x145436faf <.text+0x5435faf>
1454371f1:     	movq	%rsi, 0x110(%rbp)
1454371f8:     	movq	$0x1, 0x20(%rsp)
145437201:     	movl	$0x1, %r9d
145437207:     	leaq	0xf8(%rbp), %rcx
14543720e:     	movq	%rdi, %r8
145437211:     	callq	0x1457744b0 <.text+0x57734b0>
145437216:     	nop
145437217:     	movq	0x108(%rbp), %rdx
14543721e:     	movq	0x110(%rbp), %rsi
145437225:     	jmp	0x14543716f <.text+0x543616f>
14543722a:     	movq	0x68(%r14), %r15
14543722e:     	movq	0x70(%r14), %r14
145437232:     	shlq	$0x5, %r14
145437236:     	addq	%r15, %r14
145437239:     	leaq	-0x4fa0260(%rip), %r13  # 0x140496fe0 <.text+0x495fe0>
145437240:     	leaq	0x13067f1(%rip), %rsi   # 0x14673da38
145437247:     	leaq	0xc0(%rbp), %rdi
14543724e:     	movq	%rbp, %rbx
145437251:     	jmp	0x145437264 <.text+0x5436264>
145437253:     	nopw	%cs:(%rax,%rax)
145437260:     	addq	$0x20, %r15
145437264:     	cmpq	%r14, %r15
145437267:     	je	0x1454373a9 <.text+0x54363a9>
14543726d:     	leaq	0x4(%r15), %rax
145437271:     	movq	%rax, -0x20(%rbp)
145437275:     	movq	%r15, 0xa0(%rbp)
14543727c:     	leaq	0x8(%r15), %rdx
145437280:     	leaq	0xe0(%rbp), %rcx
145437287:     	callq	0x145483ec0 <.text+0x5482ec0>
14543728c:     	nop
14543728d:     	leaq	-0x20(%rbp), %rax
145437291:     	movq	%rax, (%rbp)
145437295:     	movq	%r13, 0x8(%rbp)
145437299:     	leaq	0xa0(%rbp), %rax
1454372a0:     	movq	%rax, 0x10(%rbp)
1454372a4:     	leaq	-0x536d22b(%rip), %rax  # 0x1400ca080 <.text+0xc9080>
1454372ab:     	movq	%rax, 0x18(%rbp)
1454372af:     	leaq	0xe0(%rbp), %rax
1454372b6:     	movq	%rax, 0x20(%rbp)
1454372ba:     	leaq	-0x54351e1(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454372c1:     	movq	%rax, 0x28(%rbp)
1454372c5:     	movq	%rdi, %rcx
1454372c8:     	movq	%rsi, %rdx
1454372cb:     	movq	%rbx, %r8
1454372ce:     	callq	0x145728390 <.text+0x5727390>
1454372d3:     	nop
1454372d4:     	movq	0xe0(%rbp), %rdx
1454372db:     	testq	%rdx, %rdx
1454372de:     	je	0x1454372f2 <.text+0x54362f2>
1454372e0:     	movq	0xe8(%rbp), %rcx
1454372e7:     	movl	$0x1, %r8d
1454372ed:     	callq	0x1400021d0 <.text+0x11d0>
1454372f2:     	movq	0xc0(%rbp), %rax
1454372f9:     	movq	%rax, 0x110(%rbp)
145437300:     	movq	0xc8(%rbp), %rax
145437307:     	movq	%rax, 0x118(%rbp)
14543730e:     	movq	0xd0(%rbp), %r12
145437315:     	movq	0xf8(%rbp), %rax
14543731c:     	movq	0x108(%rbp), %rdx
145437323:     	subq	%rdx, %rax
145437326:     	cmpq	%rax, %r12
145437329:     	ja	0x145437381 <.text+0x5436381>
14543732b:     	testq	%r12, %r12
14543732e:     	je	0x145437350 <.text+0x5436350>
145437330:     	addq	0x100(%rbp), %rdx
145437337:     	movq	%rdx, %rcx
14543733a:     	movq	0x118(%rbp), %rdx
145437341:     	movq	%r12, %r8
145437344:     	callq	0x1457731ed <.text+0x57721ed>
145437349:     	movq	0x108(%rbp), %rdx
145437350:     	addq	%r12, %rdx
145437353:     	movq	%rdx, 0x108(%rbp)
14543735a:     	movq	0x110(%rbp), %rdx
145437361:     	testq	%rdx, %rdx
145437364:     	je	0x145437260 <.text+0x5436260>
14543736a:     	movl	$0x1, %r8d
145437370:     	movq	0x118(%rbp), %rcx
145437377:     	callq	0x1400021d0 <.text+0x11d0>
14543737c:     	jmp	0x145437260 <.text+0x5436260>
145437381:     	movq	$0x1, 0x20(%rsp)
14543738a:     	movl	$0x1, %r9d
145437390:     	leaq	0xf8(%rbp), %rcx
145437397:     	movq	%r12, %r8
14543739a:     	callq	0x1457744b0 <.text+0x57734b0>
14543739f:     	nop
1454373a0:     	movq	0x108(%rbp), %rdx
1454373a7:     	jmp	0x145437330 <.text+0x5436330>
1454373a9:     	movq	0xb8(%rbp), %rax
1454373b0:     	movq	0x80(%rax), %r14
1454373b7:     	movq	0x88(%rax), %rax
1454373be:     	leaq	(%rax,%rax,4), %r15
1454373c2:     	shlq	$0x4, %r15
1454373c6:     	addq	%r14, %r15
1454373c9:     	movq	%rbp, %rsi
1454373cc:     	jmp	0x1454373d4 <.text+0x54363d4>
1454373ce:     	nop
1454373d0:     	addq	$0x50, %r14
1454373d4:     	cmpq	%r15, %r14
1454373d7:     	je	0x145437676 <.text+0x5436676>
1454373dd:     	movq	%r14, -0x28(%rbp)
1454373e1:     	leaq	0x1(%r14), %rax
1454373e5:     	movq	%rax, -0x20(%rbp)
1454373e9:     	callq	0x140002200 <.text+0x1200>
1454373ee:     	movl	$0x48, %ecx
1454373f3:     	movl	$0x8, %edx
1454373f8:     	callq	0x1400021c0 <.text+0x11c0>
1454373fd:     	testq	%rax, %rax
145437400:     	je	0x145438adb <.text+0x5437adb>
145437406:     	movq	%rax, %rdi
145437409:     	leaq	0x8(%r14), %rdx
14543740d:     	movq	$0x3, 0xe0(%rbp)
145437418:     	movq	%rax, 0xe8(%rbp)
14543741f:     	movq	$0x0, -0x30(%rbp)
145437427:     	movq	%rsi, %rcx
14543742a:     	callq	0x145483ec0 <.text+0x5482ec0>
14543742f:     	nop
145437430:     	movq	0x10(%rbp), %rax
145437434:     	movq	%rax, 0x10(%rdi)
145437438:     	movdqu	(%rbp), %xmm0
14543743d:     	movdqu	%xmm0, (%rdi)
145437441:     	leaq	0x20(%r14), %rdx
145437445:     	movq	$0x1, -0x30(%rbp)
14543744d:     	movq	%rsi, %rcx
145437450:     	callq	0x145483ec0 <.text+0x5482ec0>
145437455:     	nop
145437456:     	movq	0x10(%rbp), %rax
14543745a:     	movq	%rax, 0x28(%rdi)
14543745e:     	movdqu	(%rbp), %xmm0
145437463:     	movdqu	%xmm0, 0x18(%rdi)
145437468:     	leaq	0x38(%r14), %rdx
14543746c:     	movq	$0x2, -0x30(%rbp)
145437474:     	movq	%rsi, %rcx
145437477:     	callq	0x145483ec0 <.text+0x5482ec0>
14543747c:     	nop
14543747d:     	movq	0x10(%rbp), %rax
145437481:     	movq	%rax, 0x40(%rdi)
145437485:     	movups	(%rbp), %xmm0
145437489:     	movups	%xmm0, 0x30(%rdi)
14543748d:     	movdqu	0xe0(%rbp), %xmm0
145437495:     	movdqa	%xmm0, 0xa0(%rbp)
14543749d:     	movq	$0x3, 0xb0(%rbp)
1454374a8:     	movq	0xa8(%rbp), %rdi
1454374af:     	movl	$0x3, %r12d
1454374b5:     	movq	$0x1, 0x20(%rsp)
1454374be:     	movl	$0x3, %r8d
1454374c4:     	movq	%rsi, %rcx
1454374c7:     	movq	%rdi, %rdx
1454374ca:     	leaq	0x1306579(%rip), %r9    # 0x14673da4a
1454374d1:     	callq	0x14546ac40 <.text+0x5469c40>
1454374d6:     	nop
1454374d7:     	movq	0x10(%rbp), %rax
1454374db:     	movq	%rax, 0xf0(%rbp)
1454374e2:     	movdqu	(%rbp), %xmm0
1454374e7:     	movdqa	%xmm0, 0xe0(%rbp)
1454374ef:     	leaq	-0x28(%rbp), %rax
1454374f3:     	movq	%rax, (%rbp)
1454374f7:     	movq	%r13, 0x8(%rbp)
1454374fb:     	leaq	-0x20(%rbp), %rax
1454374ff:     	movq	%rax, 0x10(%rbp)
145437503:     	movq	%r13, 0x18(%rbp)
145437507:     	leaq	0xe0(%rbp), %rax
14543750e:     	movq	%rax, 0x20(%rbp)
145437512:     	leaq	-0x5435439(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145437519:     	movq	%rax, 0x28(%rbp)
14543751d:     	leaq	0xc0(%rbp), %rcx
145437524:     	leaq	0x1306520(%rip), %rdx   # 0x14673da4b
14543752b:     	movq	%rsi, %r8
14543752e:     	callq	0x145728390 <.text+0x5727390>
145437533:     	nop
145437534:     	movq	0xe0(%rbp), %rdx
14543753b:     	testq	%rdx, %rdx
14543753e:     	je	0x145437552 <.text+0x5436552>
145437540:     	movq	0xe8(%rbp), %rcx
145437547:     	movl	$0x1, %r8d
14543754d:     	callq	0x1400021d0 <.text+0x11d0>
145437552:     	movq	0xc0(%rbp), %rax
145437559:     	movq	%rax, 0x110(%rbp)
145437560:     	movq	0xc8(%rbp), %rax
145437567:     	movq	%rax, 0x118(%rbp)
14543756e:     	movq	0xd0(%rbp), %rbx
145437575:     	movq	0xf8(%rbp), %rax
14543757c:     	movq	0x108(%rbp), %rdx
145437583:     	subq	%rdx, %rax
145437586:     	cmpq	%rax, %rbx
145437589:     	ja	0x14543764b <.text+0x543664b>
14543758f:     	testq	%rbx, %rbx
145437592:     	je	0x1454375b4 <.text+0x54365b4>
145437594:     	addq	0x100(%rbp), %rdx
14543759b:     	movq	%rdx, %rcx
14543759e:     	movq	0x118(%rbp), %rdx
1454375a5:     	movq	%rbx, %r8
1454375a8:     	callq	0x1457731ed <.text+0x57721ed>
1454375ad:     	movq	0x108(%rbp), %rdx
1454375b4:     	addq	%rbx, %rdx
1454375b7:     	movq	%rdx, 0x108(%rbp)
1454375be:     	movq	0x110(%rbp), %rdx
1454375c5:     	testq	%rdx, %rdx
1454375c8:     	je	0x1454375dc <.text+0x54365dc>
1454375ca:     	movl	$0x1, %r8d
1454375d0:     	movq	0x118(%rbp), %rcx
1454375d7:     	callq	0x1400021d0 <.text+0x11d0>
1454375dc:     	testq	%r12, %r12
1454375df:     	je	0x145437620 <.text+0x5436620>
1454375e1:     	leaq	0x8(%rdi), %rbx
1454375e5:     	jmp	0x1454375f9 <.text+0x54365f9>
1454375e7:     	nopw	(%rax,%rax)
1454375f0:     	addq	$0x18, %rbx
1454375f4:     	decq	%r12
1454375f7:     	je	0x145437620 <.text+0x5436620>
1454375f9:     	movq	-0x8(%rbx), %rdx
1454375fd:     	testq	%rdx, %rdx
145437600:     	je	0x1454375f0 <.text+0x54365f0>
145437602:     	movq	(%rbx), %rcx
145437605:     	movl	$0x1, %r8d
14543760b:     	callq	0x1400021d0 <.text+0x11d0>
145437610:     	jmp	0x1454375f0 <.text+0x54365f0>
145437612:     	nopw	%cs:(%rax,%rax)
145437620:     	movq	0xa0(%rbp), %rax
145437627:     	testq	%rax, %rax
14543762a:     	je	0x1454373d0 <.text+0x54363d0>
145437630:     	shlq	$0x3, %rax
145437634:     	leaq	(%rax,%rax,2), %rdx
145437638:     	movl	$0x8, %r8d
14543763e:     	movq	%rdi, %rcx
145437641:     	callq	0x1400021d0 <.text+0x11d0>
145437646:     	jmp	0x1454373d0 <.text+0x54363d0>
14543764b:     	movq	$0x1, 0x20(%rsp)
145437654:     	movl	$0x1, %r9d
14543765a:     	leaq	0xf8(%rbp), %rcx
145437661:     	movq	%rbx, %r8
145437664:     	callq	0x1457744b0 <.text+0x57734b0>
145437669:     	nop
14543766a:     	movq	0x108(%rbp), %rdx
145437671:     	jmp	0x145437594 <.text+0x5436594>
145437676:     	movq	0xb8(%rbp), %r14
14543767d:     	movq	0xa0(%r14), %r8
145437684:     	testq	%r8, %r8
145437687:     	je	0x145437804 <.text+0x5436804>
14543768d:     	movq	0x98(%r14), %rdx
145437694:     	shlq	$0x5, %r8
145437698:     	addq	%rdx, %r8
14543769b:     	leaq	0xc0(%rbp), %rcx
1454376a2:     	callq	0x1455439b0 <.text+0x55429b0>
1454376a7:     	nop
1454376a8:     	movq	0xc8(%rbp), %rsi
1454376af:     	movq	0xd0(%rbp), %rdi
1454376b6:     	movq	$0x1, 0x20(%rsp)
1454376bf:     	leaq	0x1305fca(%rip), %r9    # 0x14673d690
1454376c6:     	movq	%rbp, %rcx
1454376c9:     	movq	%rsi, %rdx
1454376cc:     	movq	%rdi, %r8
1454376cf:     	callq	0x14546ac40 <.text+0x5469c40>
1454376d4:     	nop
1454376d5:     	movq	0x10(%rbp), %rax
1454376d9:     	movq	%rax, 0xf0(%rbp)
1454376e0:     	movdqu	(%rbp), %xmm0
1454376e5:     	movdqa	%xmm0, 0xe0(%rbp)
1454376ed:     	leaq	0xe0(%rbp), %rax
1454376f4:     	movq	%rax, 0xa0(%rbp)
1454376fb:     	leaq	-0x5435622(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145437702:     	movq	%rax, 0xa8(%rbp)
145437709:     	leaq	0x130634b(%rip), %rdx   # 0x14673da5b
145437710:     	movq	%rbp, %rcx
145437713:     	leaq	0xa0(%rbp), %r8
14543771a:     	callq	0x145728390 <.text+0x5727390>
14543771f:     	nop
145437720:     	movq	0xe0(%rbp), %rdx
145437727:     	testq	%rdx, %rdx
14543772a:     	je	0x14543773e <.text+0x543673e>
14543772c:     	movq	0xe8(%rbp), %rcx
145437733:     	movl	$0x1, %r8d
145437739:     	callq	0x1400021d0 <.text+0x11d0>
14543773e:     	movq	(%rbp), %r15
145437742:     	movq	0x8(%rbp), %r12
145437746:     	movq	0x10(%rbp), %rbx
14543774a:     	movq	0xf8(%rbp), %rax
145437751:     	movq	0x108(%rbp), %rdx
145437758:     	subq	%rdx, %rax
14543775b:     	cmpq	%rax, %rbx
14543775e:     	movq	0xb8(%rbp), %r14
145437765:     	ja	0x145438873 <.text+0x5437873>
14543776b:     	testq	%rbx, %rbx
14543776e:     	je	0x14543778c <.text+0x543678c>
145437770:     	addq	0x100(%rbp), %rdx
145437777:     	movq	%rdx, %rcx
14543777a:     	movq	%r12, %rdx
14543777d:     	movq	%rbx, %r8
145437780:     	callq	0x1457731ed <.text+0x57721ed>
145437785:     	movq	0x108(%rbp), %rdx
14543778c:     	addq	%rbx, %rdx
14543778f:     	movq	%rdx, 0x108(%rbp)
145437796:     	testq	%r15, %r15
145437799:     	je	0x1454377ac <.text+0x54367ac>
14543779b:     	movl	$0x1, %r8d
1454377a1:     	movq	%r12, %rcx
1454377a4:     	movq	%r15, %rdx
1454377a7:     	callq	0x1400021d0 <.text+0x11d0>
1454377ac:     	testq	%rdi, %rdi
1454377af:     	je	0x1454377e2 <.text+0x54367e2>
1454377b1:     	leaq	0x8(%rsi), %rbx
1454377b5:     	jmp	0x1454377c9 <.text+0x54367c9>
1454377b7:     	nopw	(%rax,%rax)
1454377c0:     	addq	$0x18, %rbx
1454377c4:     	decq	%rdi
1454377c7:     	je	0x1454377e2 <.text+0x54367e2>
1454377c9:     	movq	-0x8(%rbx), %rdx
1454377cd:     	testq	%rdx, %rdx
1454377d0:     	je	0x1454377c0 <.text+0x54367c0>
1454377d2:     	movq	(%rbx), %rcx
1454377d5:     	movl	$0x1, %r8d
1454377db:     	callq	0x1400021d0 <.text+0x11d0>
1454377e0:     	jmp	0x1454377c0 <.text+0x54367c0>
1454377e2:     	movq	0xc0(%rbp), %rax
1454377e9:     	testq	%rax, %rax
1454377ec:     	je	0x145437804 <.text+0x5436804>
1454377ee:     	shlq	$0x3, %rax
1454377f2:     	leaq	(%rax,%rax,2), %rdx
1454377f6:     	movl	$0x8, %r8d
1454377fc:     	movq	%rsi, %rcx
1454377ff:     	callq	0x1400021d0 <.text+0x11d0>
145437804:     	movq	0xb8(%r14), %r8
14543780b:     	testq	%r8, %r8
14543780e:     	je	0x14543790b <.text+0x543690b>
145437814:     	movq	0xb0(%r14), %rdx
14543781b:     	movq	$0x1, 0x20(%rsp)
145437824:     	leaq	0x1305e65(%rip), %r9    # 0x14673d690
14543782b:     	movq	%rbp, %rcx
14543782e:     	callq	0x14546ac40 <.text+0x5469c40>
145437833:     	nop
145437834:     	movq	0x10(%rbp), %rax
145437838:     	movq	%rax, 0xf0(%rbp)
14543783f:     	movdqu	(%rbp), %xmm0
145437844:     	movdqa	%xmm0, 0xe0(%rbp)
14543784c:     	leaq	0xe0(%rbp), %rax
145437853:     	movq	%rax, 0xc0(%rbp)
14543785a:     	leaq	-0x5435781(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145437861:     	movq	%rax, 0xc8(%rbp)
145437868:     	leaq	0x13061f6(%rip), %rdx   # 0x14673da65
14543786f:     	movq	%rbp, %rcx
145437872:     	leaq	0xc0(%rbp), %r8
145437879:     	callq	0x145728390 <.text+0x5727390>
14543787e:     	nop
14543787f:     	movq	0xe0(%rbp), %rdx
145437886:     	testq	%rdx, %rdx
145437889:     	je	0x14543789d <.text+0x543689d>
14543788b:     	movq	0xe8(%rbp), %rcx
145437892:     	movl	$0x1, %r8d
145437898:     	callq	0x1400021d0 <.text+0x11d0>
14543789d:     	movq	(%rbp), %rdi
1454378a1:     	movq	0x8(%rbp), %rbx
1454378a5:     	movq	0x10(%rbp), %rsi
1454378a9:     	movq	0xf8(%rbp), %rax
1454378b0:     	movq	0x108(%rbp), %rdx
1454378b7:     	subq	%rdx, %rax
1454378ba:     	cmpq	%rax, %rsi
1454378bd:     	ja	0x1454388ba <.text+0x54378ba>
1454378c3:     	testq	%rsi, %rsi
1454378c6:     	movq	0xb8(%rbp), %r14
1454378cd:     	je	0x1454378eb <.text+0x54368eb>
1454378cf:     	addq	0x100(%rbp), %rdx
1454378d6:     	movq	%rdx, %rcx
1454378d9:     	movq	%rbx, %rdx
1454378dc:     	movq	%rsi, %r8
1454378df:     	callq	0x1457731ed <.text+0x57721ed>
1454378e4:     	movq	0x108(%rbp), %rdx
1454378eb:     	addq	%rsi, %rdx
1454378ee:     	movq	%rdx, 0x108(%rbp)
1454378f5:     	testq	%rdi, %rdi
1454378f8:     	je	0x14543790b <.text+0x543690b>
1454378fa:     	movl	$0x1, %r8d
145437900:     	movq	%rbx, %rcx
145437903:     	movq	%rdi, %rdx
145437906:     	callq	0x1400021d0 <.text+0x11d0>
14543790b:     	movq	0xd0(%r14), %r8
145437912:     	testq	%r8, %r8
145437915:     	je	0x145437a94 <.text+0x5436a94>
14543791b:     	movq	0xc8(%r14), %rdx
145437922:     	shlq	$0x5, %r8
145437926:     	addq	%rdx, %r8
145437929:     	leaq	0xc0(%rbp), %rcx
145437930:     	callq	0x145543cf0 <.text+0x5542cf0>
145437935:     	nop
145437936:     	movq	0xc8(%rbp), %rsi
14543793d:     	movq	0xd0(%rbp), %rdi
145437944:     	movq	$0x1, 0x20(%rsp)
14543794d:     	leaq	0x1305d3c(%rip), %r9    # 0x14673d690
145437954:     	movq	%rbp, %rcx
145437957:     	movq	%rsi, %rdx
14543795a:     	movq	%rdi, %r8
14543795d:     	callq	0x14546ac40 <.text+0x5469c40>
145437962:     	nop
145437963:     	movq	0x10(%rbp), %rax
145437967:     	movq	%rax, 0xf0(%rbp)
14543796e:     	movdqu	(%rbp), %xmm0
145437973:     	movdqa	%xmm0, 0xe0(%rbp)
14543797b:     	leaq	0xe0(%rbp), %rax
145437982:     	movq	%rax, 0xa0(%rbp)
145437989:     	leaq	-0x54358b0(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145437990:     	movq	%rax, 0xa8(%rbp)
145437997:     	leaq	0x13060d0(%rip), %rdx   # 0x14673da6e
14543799e:     	movq	%rbp, %rcx
1454379a1:     	leaq	0xa0(%rbp), %r8
1454379a8:     	callq	0x145728390 <.text+0x5727390>
1454379ad:     	nop
1454379ae:     	movq	0xe0(%rbp), %rdx
1454379b5:     	testq	%rdx, %rdx
1454379b8:     	je	0x1454379cc <.text+0x54369cc>
1454379ba:     	movq	0xe8(%rbp), %rcx
1454379c1:     	movl	$0x1, %r8d
1454379c7:     	callq	0x1400021d0 <.text+0x11d0>
1454379cc:     	movq	(%rbp), %r15
1454379d0:     	movq	0x8(%rbp), %r12
1454379d4:     	movq	0x10(%rbp), %rbx
1454379d8:     	movq	0xf8(%rbp), %rax
1454379df:     	movq	0x108(%rbp), %rdx
1454379e6:     	subq	%rdx, %rax
1454379e9:     	cmpq	%rax, %rbx
1454379ec:     	movq	0xb8(%rbp), %r14
1454379f3:     	ja	0x145438908 <.text+0x5437908>
1454379f9:     	testq	%rbx, %rbx
1454379fc:     	je	0x145437a1a <.text+0x5436a1a>
1454379fe:     	addq	0x100(%rbp), %rdx
145437a05:     	movq	%rdx, %rcx
145437a08:     	movq	%r12, %rdx
145437a0b:     	movq	%rbx, %r8
145437a0e:     	callq	0x1457731ed <.text+0x57721ed>
145437a13:     	movq	0x108(%rbp), %rdx
145437a1a:     	addq	%rbx, %rdx
145437a1d:     	movq	%rdx, 0x108(%rbp)
145437a24:     	testq	%r15, %r15
145437a27:     	je	0x145437a3a <.text+0x5436a3a>
145437a29:     	movl	$0x1, %r8d
145437a2f:     	movq	%r12, %rcx
145437a32:     	movq	%r15, %rdx
145437a35:     	callq	0x1400021d0 <.text+0x11d0>
145437a3a:     	testq	%rdi, %rdi
145437a3d:     	je	0x145437a72 <.text+0x5436a72>
145437a3f:     	leaq	0x8(%rsi), %rbx
145437a43:     	jmp	0x145437a59 <.text+0x5436a59>
145437a45:     	nopw	%cs:(%rax,%rax)
145437a50:     	addq	$0x18, %rbx
145437a54:     	decq	%rdi
145437a57:     	je	0x145437a72 <.text+0x5436a72>
145437a59:     	movq	-0x8(%rbx), %rdx
145437a5d:     	testq	%rdx, %rdx
145437a60:     	je	0x145437a50 <.text+0x5436a50>
145437a62:     	movq	(%rbx), %rcx
145437a65:     	movl	$0x1, %r8d
145437a6b:     	callq	0x1400021d0 <.text+0x11d0>
145437a70:     	jmp	0x145437a50 <.text+0x5436a50>
145437a72:     	movq	0xc0(%rbp), %rax
145437a79:     	testq	%rax, %rax
145437a7c:     	je	0x145437a94 <.text+0x5436a94>
145437a7e:     	shlq	$0x3, %rax
145437a82:     	leaq	(%rax,%rax,2), %rdx
145437a86:     	movl	$0x8, %r8d
145437a8c:     	movq	%rsi, %rcx
145437a8f:     	callq	0x1400021d0 <.text+0x11d0>
145437a94:     	cmpq	$0x0, 0x190(%r14)
145437a9c:     	jne	0x145437ade <.text+0x5436ade>
145437a9e:     	cmpq	$0x0, 0x198(%r14)
145437aa6:     	jne	0x145437ade <.text+0x5436ade>
145437aa8:     	cmpq	$0x0, 0x1a0(%r14)
145437ab0:     	jne	0x145437ade <.text+0x5436ade>
145437ab2:     	cmpq	$0x0, 0x1a8(%r14)
145437aba:     	jne	0x145437ade <.text+0x5436ade>
145437abc:     	cmpq	$0x0, 0x1b0(%r14)
145437ac4:     	jne	0x145437ade <.text+0x5436ade>
145437ac6:     	cmpq	$0x0, 0x1b8(%r14)
145437ace:     	jne	0x145437ade <.text+0x5436ade>
145437ad0:     	cmpq	$0x0, 0x1c0(%r14)
145437ad8:     	je	0x145437c64 <.text+0x5436c64>
145437ade:     	leaq	0x1305e3b(%rip), %rax   # 0x14673d920
145437ae5:     	movq	%rax, (%rbp)
145437ae9:     	leaq	0x1305e37(%rip), %rax   # 0x14673d927
145437af0:     	movq	%rax, 0x8(%rbp)
145437af4:     	movq	%r14, 0x10(%rbp)
145437af8:     	leaq	0xc0(%rbp), %rcx
145437aff:     	movq	%rbp, %rdx
145437b02:     	callq	0x1455435d0 <.text+0x55425d0>
145437b07:     	nop
145437b08:     	movq	0xc8(%rbp), %rsi
145437b0f:     	movq	0xd0(%rbp), %rdi
145437b16:     	movq	$0x1, 0x20(%rsp)
145437b1f:     	leaq	0x1305b6a(%rip), %r9    # 0x14673d690
145437b26:     	movq	%rbp, %rcx
145437b29:     	movq	%rsi, %rdx
145437b2c:     	movq	%rdi, %r8
145437b2f:     	callq	0x14546ac40 <.text+0x5469c40>
145437b34:     	nop
145437b35:     	movq	0x10(%rbp), %rax
145437b39:     	movq	%rax, 0xf0(%rbp)
145437b40:     	movdqu	(%rbp), %xmm0
145437b45:     	movdqa	%xmm0, 0xe0(%rbp)
145437b4d:     	leaq	0xe0(%rbp), %rax
145437b54:     	movq	%rax, 0xa0(%rbp)
145437b5b:     	leaq	-0x5435a82(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145437b62:     	movq	%rax, 0xa8(%rbp)
145437b69:     	leaq	0x1305f09(%rip), %rdx   # 0x14673da79
145437b70:     	movq	%rbp, %rcx
145437b73:     	leaq	0xa0(%rbp), %r8
145437b7a:     	callq	0x145728390 <.text+0x5727390>
145437b7f:     	nop
145437b80:     	movq	0xe0(%rbp), %rdx
145437b87:     	testq	%rdx, %rdx
145437b8a:     	je	0x145437b9e <.text+0x5436b9e>
145437b8c:     	movq	0xe8(%rbp), %rcx
145437b93:     	movl	$0x1, %r8d
145437b99:     	callq	0x1400021d0 <.text+0x11d0>
145437b9e:     	movq	(%rbp), %r15
145437ba2:     	movq	0x8(%rbp), %r12
145437ba6:     	movq	0x10(%rbp), %rbx
145437baa:     	movq	0xf8(%rbp), %rax
145437bb1:     	movq	0x108(%rbp), %rdx
145437bb8:     	subq	%rdx, %rax
145437bbb:     	cmpq	%rax, %rbx
145437bbe:     	movq	0xb8(%rbp), %r14
145437bc5:     	ja	0x145438a79 <.text+0x5437a79>
145437bcb:     	testq	%rbx, %rbx
145437bce:     	je	0x145437bec <.text+0x5436bec>
145437bd0:     	addq	0x100(%rbp), %rdx
145437bd7:     	movq	%rdx, %rcx
145437bda:     	movq	%r12, %rdx
145437bdd:     	movq	%rbx, %r8
145437be0:     	callq	0x1457731ed <.text+0x57721ed>
145437be5:     	movq	0x108(%rbp), %rdx
145437bec:     	addq	%rbx, %rdx
145437bef:     	movq	%rdx, 0x108(%rbp)
145437bf6:     	testq	%r15, %r15
145437bf9:     	je	0x145437c0c <.text+0x5436c0c>
145437bfb:     	movl	$0x1, %r8d
145437c01:     	movq	%r12, %rcx
145437c04:     	movq	%r15, %rdx
145437c07:     	callq	0x1400021d0 <.text+0x11d0>
145437c0c:     	testq	%rdi, %rdi
145437c0f:     	je	0x145437c42 <.text+0x5436c42>
145437c11:     	leaq	0x8(%rsi), %rbx
145437c15:     	jmp	0x145437c29 <.text+0x5436c29>
145437c17:     	nopw	(%rax,%rax)
145437c20:     	addq	$0x18, %rbx
145437c24:     	decq	%rdi
145437c27:     	je	0x145437c42 <.text+0x5436c42>
145437c29:     	movq	-0x8(%rbx), %rdx
145437c2d:     	testq	%rdx, %rdx
145437c30:     	je	0x145437c20 <.text+0x5436c20>
145437c32:     	movq	(%rbx), %rcx
145437c35:     	movl	$0x1, %r8d
145437c3b:     	callq	0x1400021d0 <.text+0x11d0>
145437c40:     	jmp	0x145437c20 <.text+0x5436c20>
145437c42:     	movq	0xc0(%rbp), %rax
145437c49:     	testq	%rax, %rax
145437c4c:     	je	0x145437c64 <.text+0x5436c64>
145437c4e:     	shlq	$0x3, %rax
145437c52:     	leaq	(%rax,%rax,2), %rdx
145437c56:     	movl	$0x8, %r8d
145437c5c:     	movq	%rsi, %rcx
145437c5f:     	callq	0x1400021d0 <.text+0x11d0>
145437c64:     	movq	0xe0(%r14), %rax
145437c6b:     	movq	%rax, -0x8(%rbp)
145437c6f:     	movq	0xe8(%r14), %rsi
145437c76:     	testq	%rsi, %rsi
145437c79:     	je	0x145437ca6 <.text+0x5436ca6>
145437c7b:     	callq	0x140002200 <.text+0x1200>
145437c80:     	movl	$0x1, %edx
145437c85:     	movq	%rsi, %rcx
145437c88:     	callq	0x1400021c0 <.text+0x11c0>
145437c8d:     	testq	%rax, %rax
145437c90:     	je	0x145438aed <.text+0x5437aed>
145437c96:     	movq	%rax, %rbx
145437c99:     	cmpq	$0x4, %rsi
145437c9d:     	jae	0x145437cb3 <.text+0x5436cb3>
145437c9f:     	xorl	%eax, %eax
145437ca1:     	jmp	0x145437e0d <.text+0x5436e0d>
145437ca6:     	movl	$0x1, %ebx
145437cab:     	xorl	%r12d, %r12d
145437cae:     	jmp	0x145437ea3 <.text+0x5436ea3>
145437cb3:     	cmpq	$0x10, %rsi
145437cb7:     	jae	0x145437cc0 <.text+0x5436cc0>
145437cb9:     	xorl	%eax, %eax
145437cbb:     	jmp	0x145437da8 <.text+0x5436da8>
145437cc0:     	movq	%rsi, %rax
145437cc3:     	andq	$-0x10, %rax
145437cc7:     	movq	-0x8(%rbp), %rcx
145437ccb:     	addq	$0xf0, %rcx
145437cd2:     	xorl	%edx, %edx
145437cd4:     	nopw	%cs:(%rax,%rax)
145437ce0:     	movd	(%rcx), %xmm0
145437ce4:     	movd	-0x10(%rcx), %xmm1
145437ce9:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
145437ced:     	movd	-0x20(%rcx), %xmm0
145437cf2:     	movd	-0x30(%rcx), %xmm2
145437cf7:     	punpcklbw	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3],xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
145437cfb:     	punpcklwd	%xmm1, %xmm2    # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1],xmm2[2],xmm1[2],xmm2[3],xmm1[3]
145437cff:     	movd	-0x40(%rcx), %xmm0
145437d04:     	movd	-0x50(%rcx), %xmm1
145437d09:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
145437d0d:     	movd	-0x60(%rcx), %xmm0
145437d12:     	movd	-0x70(%rcx), %xmm3
145437d17:     	punpcklbw	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1],xmm3[2],xmm0[2],xmm3[3],xmm0[3],xmm3[4],xmm0[4],xmm3[5],xmm0[5],xmm3[6],xmm0[6],xmm3[7],xmm0[7]
145437d1b:     	punpcklwd	%xmm1, %xmm3    # xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1],xmm3[2],xmm1[2],xmm3[3],xmm1[3]
145437d1f:     	punpckldq	%xmm2, %xmm3    # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
145437d23:     	movd	-0x80(%rcx), %xmm0
145437d28:     	movd	-0x90(%rcx), %xmm1
145437d30:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
145437d34:     	movd	-0xa0(%rcx), %xmm0
145437d3c:     	movd	-0xb0(%rcx), %xmm2
145437d44:     	punpcklbw	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3],xmm2[4],xmm0[4],xmm2[5],xmm0[5],xmm2[6],xmm0[6],xmm2[7],xmm0[7]
145437d48:     	punpcklwd	%xmm1, %xmm2    # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1],xmm2[2],xmm1[2],xmm2[3],xmm1[3]
145437d4c:     	movd	-0xc0(%rcx), %xmm0
145437d54:     	movd	-0xd0(%rcx), %xmm1
145437d5c:     	punpcklbw	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3],xmm1[4],xmm0[4],xmm1[5],xmm0[5],xmm1[6],xmm0[6],xmm1[7],xmm0[7]
145437d60:     	movd	-0xe0(%rcx), %xmm0
145437d68:     	movd	-0xf0(%rcx), %xmm4
145437d70:     	punpcklbw	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1],xmm4[2],xmm0[2],xmm4[3],xmm0[3],xmm4[4],xmm0[4],xmm4[5],xmm0[5],xmm4[6],xmm0[6],xmm4[7],xmm0[7]
145437d74:     	punpcklwd	%xmm1, %xmm4    # xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1],xmm4[2],xmm1[2],xmm4[3],xmm1[3]
145437d78:     	punpckldq	%xmm2, %xmm4    # xmm4 = xmm4[0],xmm2[0],xmm4[1],xmm2[1]
145437d7c:     	punpcklqdq	%xmm3, %xmm4    # xmm4 = xmm4[0],xmm3[0]
145437d80:     	movdqu	%xmm4, (%rbx,%rdx)
145437d85:     	addq	$0x10, %rdx
145437d89:     	addq	$0x100, %rcx            # imm = 0x100
145437d90:     	cmpq	%rdx, %rax
145437d93:     	jne	0x145437ce0 <.text+0x5436ce0>
145437d99:     	cmpq	%rax, %rsi
145437d9c:     	je	0x145437e32 <.text+0x5436e32>
145437da2:     	testb	$0xc, %sil
145437da6:     	je	0x145437e0d <.text+0x5436e0d>
145437da8:     	movq	%rax, %rcx
145437dab:     	movq	%rsi, %rax
145437dae:     	andq	$-0x4, %rax
145437db2:     	movq	%rcx, %rdx
145437db5:     	shlq	$0x4, %rdx
145437db9:     	movq	-0x8(%rbp), %r8
145437dbd:     	addq	%r8, %rdx
145437dc0:     	addq	$0x30, %rdx
145437dc4:     	nopw	%cs:(%rax,%rax)
145437dd0:     	movzbl	-0x30(%rdx), %r8d
145437dd5:     	movzbl	-0x20(%rdx), %r9d
145437dda:     	movzbl	-0x10(%rdx), %r10d
145437ddf:     	shll	$0x8, %r9d
145437de3:     	orl	%r8d, %r9d
145437de6:     	shll	$0x10, %r10d
145437dea:     	orl	%r9d, %r10d
145437ded:     	movl	(%rdx), %r8d
145437df0:     	shll	$0x18, %r8d
145437df4:     	orl	%r10d, %r8d
145437df7:     	movl	%r8d, (%rbx,%rcx)
145437dfb:     	addq	$0x4, %rcx
145437dff:     	addq	$0x40, %rdx
145437e03:     	cmpq	%rcx, %rax
145437e06:     	jne	0x145437dd0 <.text+0x5436dd0>
145437e08:     	cmpq	%rax, %rsi
145437e0b:     	je	0x145437e32 <.text+0x5436e32>
145437e0d:     	movq	%rax, %rcx
145437e10:     	shlq	$0x4, %rcx
145437e14:     	addq	-0x8(%rbp), %rcx
145437e18:     	nopl	(%rax,%rax)
145437e20:     	movzbl	(%rcx), %edx
145437e23:     	movb	%dl, (%rbx,%rax)
145437e26:     	incq	%rax
145437e29:     	addq	$0x10, %rcx
145437e2d:     	cmpq	%rax, %rsi
145437e30:     	jne	0x145437e20 <.text+0x5436e20>
145437e32:     	movl	$0x1, %r12d
145437e38:     	cmpq	$0x1, %rsi
145437e3c:     	je	0x145437ea3 <.text+0x5436ea3>
145437e3e:     	leaq	-0x1(%rsi), %rax
145437e42:     	xorl	%ecx, %ecx
145437e44:     	nopw	%cs:(%rax,%rax)
145437e50:     	movzbl	0x1(%rbx,%rcx), %edx
145437e55:     	cmpb	(%rbx,%rcx), %dl
145437e58:     	je	0x145437e67 <.text+0x5436e67>
145437e5a:     	incq	%rcx
145437e5d:     	cmpq	%rcx, %rax
145437e60:     	jne	0x145437e50 <.text+0x5436e50>
145437e62:     	movq	%rsi, %r12
145437e65:     	jmp	0x145437ea3 <.text+0x5436ea3>
145437e67:     	leaq	0x2(%rcx), %rax
145437e6b:     	leaq	0x1(%rcx), %r12
145437e6f:     	cmpq	%rsi, %rax
145437e72:     	jae	0x145437ea3 <.text+0x5436ea3>
145437e74:     	movl	%esi, %r8d
145437e77:     	subl	%ecx, %r8d
145437e7a:     	leaq	-0x3(%rsi), %rdx
145437e7e:     	testb	$0x1, %r8b
145437e82:     	je	0x145437e9a <.text+0x5436e9a>
145437e84:     	movzbl	0x2(%rbx,%rcx), %eax
145437e89:     	cmpb	(%rbx,%rcx), %al
145437e8c:     	je	0x145437e96 <.text+0x5436e96>
145437e8e:     	movb	%al, 0x1(%rbx,%rcx)
145437e92:     	leaq	0x2(%rcx), %r12
145437e96:     	leaq	0x3(%rcx), %rax
145437e9a:     	cmpq	%rcx, %rdx
145437e9d:     	jne	0x14543809d <.text+0x543709d>
145437ea3:     	leaq	0x1c8(%r14), %rax
145437eaa:     	movq	%rax, -0x50(%rbp)
145437eae:     	movq	%rsi, -0x40(%rbp)
145437eb2:     	shlq	$0x4, %rsi
145437eb6:     	addq	-0x8(%rbp), %rsi
145437eba:     	addq	%rbx, %r12
145437ebd:     	movq	%rbp, %rdi
145437ec0:     	leaq	0x1305bfb(%rip), %r14   # 0x14673dac2
145437ec7:     	leaq	0xc0(%rbp), %r15
145437ece:     	movq	%rbx, -0x38(%rbp)
145437ed2:     	jmp	0x145437ee3 <.text+0x5436ee3>
145437ed4:     	nopw	%cs:(%rax,%rax)
145437ee0:     	incq	%rbx
145437ee3:     	cmpq	%r12, %rbx
145437ee6:     	je	0x1454380dc <.text+0x54370dc>
145437eec:     	movzbl	(%rbx), %eax
145437eef:     	movb	%al, -0x20(%rbp)
145437ef2:     	movq	-0x8(%rbp), %rax
145437ef6:     	movq	%rax, (%rbp)
145437efa:     	movq	%rsi, 0x8(%rbp)
145437efe:     	leaq	-0x20(%rbp), %rax
145437f02:     	movq	%rax, 0x10(%rbp)
145437f06:     	leaq	0xa0(%rbp), %rcx
145437f0d:     	movq	%rdi, %rdx
145437f10:     	callq	0x145539670 <.text+0x5538670>
145437f15:     	nop
145437f16:     	movq	0xa8(%rbp), %rdx
145437f1d:     	movq	0xb0(%rbp), %r8
145437f24:     	movq	$0x1, 0x20(%rsp)
145437f2d:     	movq	%rdi, %rcx
145437f30:     	movq	%rdx, -0x48(%rbp)
145437f34:     	leaq	0x1305755(%rip), %r9    # 0x14673d690
145437f3b:     	callq	0x14546b200 <.text+0x546a200>
145437f40:     	nop
145437f41:     	movq	0x10(%rbp), %rax
145437f45:     	movq	%rax, 0xf0(%rbp)
145437f4c:     	movdqu	(%rbp), %xmm0
145437f51:     	movdqa	%xmm0, 0xe0(%rbp)
145437f59:     	leaq	-0x20(%rbp), %rax
145437f5d:     	movq	%rax, (%rbp)
145437f61:     	leaq	0x2fedb8(%rip), %rax    # 0x145736d20 <.text+0x5735d20>
145437f68:     	movq	%rax, 0x8(%rbp)
145437f6c:     	leaq	0xe0(%rbp), %rax
145437f73:     	movq	%rax, 0x10(%rbp)
145437f77:     	leaq	-0x5435e9e(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145437f7e:     	movq	%rax, 0x18(%rbp)
145437f82:     	movq	%r15, %rcx
145437f85:     	movq	%r14, %rdx
145437f88:     	movq	%rdi, %r8
145437f8b:     	callq	0x145728390 <.text+0x5727390>
145437f90:     	nop
145437f91:     	movq	0xe0(%rbp), %rdx
145437f98:     	testq	%rdx, %rdx
145437f9b:     	je	0x145437faf <.text+0x5436faf>
145437f9d:     	movq	0xe8(%rbp), %rcx
145437fa4:     	movl	$0x1, %r8d
145437faa:     	callq	0x1400021d0 <.text+0x11d0>
145437faf:     	movq	0xc0(%rbp), %rax
145437fb6:     	movq	%rax, 0x110(%rbp)
145437fbd:     	movq	0xc8(%rbp), %rax
145437fc4:     	movq	%rax, 0x118(%rbp)
145437fcb:     	movq	0xd0(%rbp), %r13
145437fd2:     	movq	0xf8(%rbp), %rax
145437fd9:     	movq	0x108(%rbp), %rdx
145437fe0:     	subq	%rdx, %rax
145437fe3:     	cmpq	%rax, %r13
145437fe6:     	ja	0x14543805d <.text+0x543705d>
145437fe8:     	testq	%r13, %r13
145437feb:     	je	0x14543800d <.text+0x543700d>
145437fed:     	addq	0x100(%rbp), %rdx
145437ff4:     	movq	%rdx, %rcx
145437ff7:     	movq	0x118(%rbp), %rdx
145437ffe:     	movq	%r13, %r8
145438001:     	callq	0x1457731ed <.text+0x57721ed>
145438006:     	movq	0x108(%rbp), %rdx
14543800d:     	addq	%r13, %rdx
145438010:     	movq	%rdx, 0x108(%rbp)
145438017:     	movq	0x110(%rbp), %rdx
14543801e:     	testq	%rdx, %rdx
145438021:     	je	0x145438035 <.text+0x5437035>
145438023:     	movl	$0x1, %r8d
145438029:     	movq	0x118(%rbp), %rcx
145438030:     	callq	0x1400021d0 <.text+0x11d0>
145438035:     	movq	0xa0(%rbp), %rdx
14543803c:     	testq	%rdx, %rdx
14543803f:     	je	0x145437ee0 <.text+0x5436ee0>
145438045:     	shlq	$0x4, %rdx
145438049:     	movl	$0x8, %r8d
14543804f:     	movq	-0x48(%rbp), %rcx
145438053:     	callq	0x1400021d0 <.text+0x11d0>
145438058:     	jmp	0x145437ee0 <.text+0x5436ee0>
14543805d:     	movq	$0x1, 0x20(%rsp)
145438066:     	movl	$0x1, %r9d
14543806c:     	leaq	0xf8(%rbp), %rcx
145438073:     	movq	%r13, %r8
145438076:     	callq	0x1457744b0 <.text+0x57734b0>
14543807b:     	nop
14543807c:     	movq	0x108(%rbp), %rdx
145438083:     	jmp	0x145437fed <.text+0x5436fed>
145438088:     	nopl	(%rax,%rax)
145438090:     	addq	$0x2, %rax
145438094:     	cmpq	%rax, %rsi
145438097:     	je	0x145437ea3 <.text+0x5436ea3>
14543809d:     	movzbl	(%rbx,%rax), %ecx
1454380a1:     	cmpb	-0x1(%rbx,%r12), %cl
1454380a6:     	jne	0x1454380c0 <.text+0x54370c0>
1454380a8:     	movzbl	0x1(%rbx,%rax), %ecx
1454380ad:     	cmpb	-0x1(%rbx,%r12), %cl
1454380b2:     	je	0x145438090 <.text+0x5437090>
1454380b4:     	jmp	0x1454380d3 <.text+0x54370d3>
1454380b6:     	nopw	%cs:(%rax,%rax)
1454380c0:     	movb	%cl, (%rbx,%r12)
1454380c4:     	incq	%r12
1454380c7:     	movzbl	0x1(%rbx,%rax), %ecx
1454380cc:     	cmpb	-0x1(%rbx,%r12), %cl
1454380d1:     	je	0x145438090 <.text+0x5437090>
1454380d3:     	movb	%cl, (%rbx,%r12)
1454380d7:     	incq	%r12
1454380da:     	jmp	0x145438090 <.text+0x5437090>
1454380dc:     	movq	-0x40(%rbp), %rdx
1454380e0:     	testq	%rdx, %rdx
1454380e3:     	je	0x1454380f4 <.text+0x54370f4>
1454380e5:     	movl	$0x1, %r8d
1454380eb:     	movq	-0x38(%rbp), %rcx
1454380ef:     	callq	0x1400021d0 <.text+0x11d0>
1454380f4:     	movq	0xb8(%rbp), %r14
1454380fb:     	movq	0x100(%r14), %r8
145438102:     	testq	%r8, %r8
145438105:     	je	0x145438284 <.text+0x5437284>
14543810b:     	movq	0xf8(%r14), %rdx
145438112:     	shlq	$0x5, %r8
145438116:     	addq	%rdx, %r8
145438119:     	leaq	0xc0(%rbp), %rcx
145438120:     	callq	0x145543b50 <.text+0x5542b50>
145438125:     	nop
145438126:     	movq	0xc8(%rbp), %rsi
14543812d:     	movq	0xd0(%rbp), %rdi
145438134:     	movq	$0x1, 0x20(%rsp)
14543813d:     	leaq	0x130554c(%rip), %r9    # 0x14673d690
145438144:     	movq	%rbp, %rcx
145438147:     	movq	%rsi, %rdx
14543814a:     	movq	%rdi, %r8
14543814d:     	callq	0x14546ac40 <.text+0x5469c40>
145438152:     	nop
145438153:     	movq	0x10(%rbp), %rax
145438157:     	movq	%rax, 0xf0(%rbp)
14543815e:     	movdqu	(%rbp), %xmm0
145438163:     	movdqa	%xmm0, 0xe0(%rbp)
14543816b:     	leaq	0xe0(%rbp), %rax
145438172:     	movq	%rax, 0xa0(%rbp)
145438179:     	leaq	-0x54360a0(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145438180:     	movq	%rax, 0xa8(%rbp)
145438187:     	leaq	0x13058f5(%rip), %rdx   # 0x14673da83
14543818e:     	movq	%rbp, %rcx
145438191:     	leaq	0xa0(%rbp), %r8
145438198:     	callq	0x145728390 <.text+0x5727390>
14543819d:     	nop
14543819e:     	movq	0xe0(%rbp), %rdx
1454381a5:     	testq	%rdx, %rdx
1454381a8:     	je	0x1454381bc <.text+0x54371bc>
1454381aa:     	movq	0xe8(%rbp), %rcx
1454381b1:     	movl	$0x1, %r8d
1454381b7:     	callq	0x1400021d0 <.text+0x11d0>
1454381bc:     	movq	(%rbp), %r15
1454381c0:     	movq	0x8(%rbp), %r12
1454381c4:     	movq	0x10(%rbp), %rbx
1454381c8:     	movq	0xf8(%rbp), %rax
1454381cf:     	movq	0x108(%rbp), %rdx
1454381d6:     	subq	%rdx, %rax
1454381d9:     	cmpq	%rax, %rbx
1454381dc:     	movq	0xb8(%rbp), %r14
1454381e3:     	ja	0x14543894f <.text+0x543794f>
1454381e9:     	testq	%rbx, %rbx
1454381ec:     	je	0x14543820a <.text+0x543720a>
1454381ee:     	addq	0x100(%rbp), %rdx
1454381f5:     	movq	%rdx, %rcx
1454381f8:     	movq	%r12, %rdx
1454381fb:     	movq	%rbx, %r8
1454381fe:     	callq	0x1457731ed <.text+0x57721ed>
145438203:     	movq	0x108(%rbp), %rdx
14543820a:     	addq	%rbx, %rdx
14543820d:     	movq	%rdx, 0x108(%rbp)
145438214:     	testq	%r15, %r15
145438217:     	je	0x14543822a <.text+0x543722a>
145438219:     	movl	$0x1, %r8d
14543821f:     	movq	%r12, %rcx
145438222:     	movq	%r15, %rdx
145438225:     	callq	0x1400021d0 <.text+0x11d0>
14543822a:     	testq	%rdi, %rdi
14543822d:     	je	0x145438262 <.text+0x5437262>
14543822f:     	leaq	0x8(%rsi), %rbx
145438233:     	jmp	0x145438249 <.text+0x5437249>
145438235:     	nopw	%cs:(%rax,%rax)
145438240:     	addq	$0x18, %rbx
145438244:     	decq	%rdi
145438247:     	je	0x145438262 <.text+0x5437262>
145438249:     	movq	-0x8(%rbx), %rdx
14543824d:     	testq	%rdx, %rdx
145438250:     	je	0x145438240 <.text+0x5437240>
145438252:     	movq	(%rbx), %rcx
145438255:     	movl	$0x1, %r8d
14543825b:     	callq	0x1400021d0 <.text+0x11d0>
145438260:     	jmp	0x145438240 <.text+0x5437240>
145438262:     	movq	0xc0(%rbp), %rax
145438269:     	testq	%rax, %rax
14543826c:     	je	0x145438284 <.text+0x5437284>
14543826e:     	shlq	$0x3, %rax
145438272:     	leaq	(%rax,%rax,2), %rdx
145438276:     	movl	$0x8, %r8d
14543827c:     	movq	%rsi, %rcx
14543827f:     	callq	0x1400021d0 <.text+0x11d0>
145438284:     	movq	0x118(%r14), %rax
14543828b:     	testq	%rax, %rax
14543828e:     	je	0x145438404 <.text+0x5437404>
145438294:     	movq	0x110(%r14), %rdx
14543829b:     	leaq	(%rdx,%rax,4), %r8
14543829f:     	leaq	0xc0(%rbp), %rcx
1454382a6:     	callq	0x1455443c0 <.text+0x55433c0>
1454382ab:     	nop
1454382ac:     	movq	0xc8(%rbp), %rsi
1454382b3:     	movq	0xd0(%rbp), %rdi
1454382ba:     	movq	$0x1, 0x20(%rsp)
1454382c3:     	leaq	0x13053c6(%rip), %r9    # 0x14673d690
1454382ca:     	movq	%rbp, %rcx
1454382cd:     	movq	%rsi, %rdx
1454382d0:     	movq	%rdi, %r8
1454382d3:     	callq	0x14546ac40 <.text+0x5469c40>
1454382d8:     	nop
1454382d9:     	movq	0x10(%rbp), %rax
1454382dd:     	movq	%rax, 0xf0(%rbp)
1454382e4:     	movdqu	(%rbp), %xmm0
1454382e9:     	movdqa	%xmm0, 0xe0(%rbp)
1454382f1:     	leaq	0xe0(%rbp), %rax
1454382f8:     	movq	%rax, 0xa0(%rbp)
1454382ff:     	leaq	-0x5436226(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145438306:     	movq	%rax, 0xa8(%rbp)
14543830d:     	leaq	0x1305779(%rip), %rdx   # 0x14673da8d
145438314:     	movq	%rbp, %rcx
145438317:     	leaq	0xa0(%rbp), %r8
14543831e:     	callq	0x145728390 <.text+0x5727390>
145438323:     	nop
145438324:     	movq	0xe0(%rbp), %rdx
14543832b:     	testq	%rdx, %rdx
14543832e:     	je	0x145438342 <.text+0x5437342>
145438330:     	movq	0xe8(%rbp), %rcx
145438337:     	movl	$0x1, %r8d
14543833d:     	callq	0x1400021d0 <.text+0x11d0>
145438342:     	movq	(%rbp), %r15
145438346:     	movq	0x8(%rbp), %r12
14543834a:     	movq	0x10(%rbp), %rbx
14543834e:     	movq	0xf8(%rbp), %rax
145438355:     	movq	0x108(%rbp), %rdx
14543835c:     	subq	%rdx, %rax
14543835f:     	cmpq	%rax, %rbx
145438362:     	movq	0xb8(%rbp), %r14
145438369:     	ja	0x145438996 <.text+0x5437996>
14543836f:     	testq	%rbx, %rbx
145438372:     	je	0x145438390 <.text+0x5437390>
145438374:     	addq	0x100(%rbp), %rdx
14543837b:     	movq	%rdx, %rcx
14543837e:     	movq	%r12, %rdx
145438381:     	movq	%rbx, %r8
145438384:     	callq	0x1457731ed <.text+0x57721ed>
145438389:     	movq	0x108(%rbp), %rdx
145438390:     	addq	%rbx, %rdx
145438393:     	movq	%rdx, 0x108(%rbp)
14543839a:     	testq	%r15, %r15
14543839d:     	je	0x1454383b0 <.text+0x54373b0>
14543839f:     	movl	$0x1, %r8d
1454383a5:     	movq	%r12, %rcx
1454383a8:     	movq	%r15, %rdx
1454383ab:     	callq	0x1400021d0 <.text+0x11d0>
1454383b0:     	testq	%rdi, %rdi
1454383b3:     	je	0x1454383e2 <.text+0x54373e2>
1454383b5:     	leaq	0x8(%rsi), %rbx
1454383b9:     	jmp	0x1454383c9 <.text+0x54373c9>
1454383bb:     	nopl	(%rax,%rax)
1454383c0:     	addq	$0x18, %rbx
1454383c4:     	decq	%rdi
1454383c7:     	je	0x1454383e2 <.text+0x54373e2>
1454383c9:     	movq	-0x8(%rbx), %rdx
1454383cd:     	testq	%rdx, %rdx
1454383d0:     	je	0x1454383c0 <.text+0x54373c0>
1454383d2:     	movq	(%rbx), %rcx
1454383d5:     	movl	$0x1, %r8d
1454383db:     	callq	0x1400021d0 <.text+0x11d0>
1454383e0:     	jmp	0x1454383c0 <.text+0x54373c0>
1454383e2:     	movq	0xc0(%rbp), %rax
1454383e9:     	testq	%rax, %rax
1454383ec:     	je	0x145438404 <.text+0x5437404>
1454383ee:     	shlq	$0x3, %rax
1454383f2:     	leaq	(%rax,%rax,2), %rdx
1454383f6:     	movl	$0x8, %r8d
1454383fc:     	movq	%rsi, %rcx
1454383ff:     	callq	0x1400021d0 <.text+0x11d0>
145438404:     	movq	0x130(%r14), %r8
14543840b:     	testq	%r8, %r8
14543840e:     	je	0x14543850b <.text+0x543750b>
145438414:     	movq	0x128(%r14), %rdx
14543841b:     	movq	$0x1, 0x20(%rsp)
145438424:     	leaq	0x1305265(%rip), %r9    # 0x14673d690
14543842b:     	movq	%rbp, %rcx
14543842e:     	callq	0x14546ac40 <.text+0x5469c40>
145438433:     	nop
145438434:     	movq	0x10(%rbp), %rax
145438438:     	movq	%rax, 0xf0(%rbp)
14543843f:     	movdqu	(%rbp), %xmm0
145438444:     	movdqa	%xmm0, 0xe0(%rbp)
14543844c:     	leaq	0xe0(%rbp), %rax
145438453:     	movq	%rax, 0xc0(%rbp)
14543845a:     	leaq	-0x5436381(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145438461:     	movq	%rax, 0xc8(%rbp)
145438468:     	leaq	0x130562a(%rip), %rdx   # 0x14673da99
14543846f:     	movq	%rbp, %rcx
145438472:     	leaq	0xc0(%rbp), %r8
145438479:     	callq	0x145728390 <.text+0x5727390>
14543847e:     	nop
14543847f:     	movq	0xe0(%rbp), %rdx
145438486:     	testq	%rdx, %rdx
145438489:     	je	0x14543849d <.text+0x543749d>
14543848b:     	movq	0xe8(%rbp), %rcx
145438492:     	movl	$0x1, %r8d
145438498:     	callq	0x1400021d0 <.text+0x11d0>
14543849d:     	movq	(%rbp), %rdi
1454384a1:     	movq	0x8(%rbp), %rbx
1454384a5:     	movq	0x10(%rbp), %rsi
1454384a9:     	movq	0xf8(%rbp), %rax
1454384b0:     	movq	0x108(%rbp), %rdx
1454384b7:     	subq	%rdx, %rax
1454384ba:     	cmpq	%rax, %rsi
1454384bd:     	ja	0x1454389dd <.text+0x54379dd>
1454384c3:     	testq	%rsi, %rsi
1454384c6:     	movq	0xb8(%rbp), %r14
1454384cd:     	je	0x1454384eb <.text+0x54374eb>
1454384cf:     	addq	0x100(%rbp), %rdx
1454384d6:     	movq	%rdx, %rcx
1454384d9:     	movq	%rbx, %rdx
1454384dc:     	movq	%rsi, %r8
1454384df:     	callq	0x1457731ed <.text+0x57721ed>
1454384e4:     	movq	0x108(%rbp), %rdx
1454384eb:     	addq	%rsi, %rdx
1454384ee:     	movq	%rdx, 0x108(%rbp)
1454384f5:     	testq	%rdi, %rdi
1454384f8:     	je	0x14543850b <.text+0x543750b>
1454384fa:     	movl	$0x1, %r8d
145438500:     	movq	%rbx, %rcx
145438503:     	movq	%rdi, %rdx
145438506:     	callq	0x1400021d0 <.text+0x11d0>
14543850b:     	movq	-0x50(%rbp), %rax
14543850f:     	cmpl	$0x0, (%rax)
145438512:     	je	0x1454385b2 <.text+0x54375b2>
145438518:     	movq	%rax, 0xe0(%rbp)
14543851f:     	leaq	0x301f2a(%rip), %rax    # 0x14573a450 <.text+0x5739450>
145438526:     	movq	%rax, 0xe8(%rbp)
14543852d:     	leaq	0x130556f(%rip), %rdx   # 0x14673daa3
145438534:     	movq	%rbp, %rcx
145438537:     	leaq	0xe0(%rbp), %r8
14543853e:     	callq	0x145728390 <.text+0x5727390>
145438543:     	nop
145438544:     	movq	(%rbp), %rdi
145438548:     	movq	0x8(%rbp), %rbx
14543854c:     	movq	0x10(%rbp), %rsi
145438550:     	movq	0xf8(%rbp), %rax
145438557:     	movq	0x108(%rbp), %rdx
14543855e:     	subq	%rdx, %rax
145438561:     	cmpq	%rax, %rsi
145438564:     	ja	0x145438a2b <.text+0x5437a2b>
14543856a:     	testq	%rsi, %rsi
14543856d:     	movq	0xb8(%rbp), %r14
145438574:     	je	0x145438592 <.text+0x5437592>
145438576:     	addq	0x100(%rbp), %rdx
14543857d:     	movq	%rdx, %rcx
145438580:     	movq	%rbx, %rdx
145438583:     	movq	%rsi, %r8
145438586:     	callq	0x1457731ed <.text+0x57721ed>
14543858b:     	movq	0x108(%rbp), %rdx
145438592:     	addq	%rsi, %rdx
145438595:     	movq	%rdx, 0x108(%rbp)
14543859c:     	testq	%rdi, %rdi
14543859f:     	je	0x1454385b2 <.text+0x54375b2>
1454385a1:     	movl	$0x1, %r8d
1454385a7:     	movq	%rbx, %rcx
1454385aa:     	movq	%rdi, %rdx
1454385ad:     	callq	0x1400021d0 <.text+0x11d0>
1454385b2:     	movq	0x140(%r14), %rdi
1454385b9:     	movq	0x148(%r14), %rax
1454385c0:     	leaq	(%rdi,%rax,8), %r15
1454385c4:     	movq	%rbp, %r14
1454385c7:     	leaq	0xc0(%rbp), %r12
1454385ce:     	jmp	0x1454385d3 <.text+0x54375d3>
1454385d0:     	movq	%r13, %rdi
1454385d3:     	cmpq	%r15, %rdi
1454385d6:     	je	0x1454387c6 <.text+0x54377c6>
1454385dc:     	leaq	0x8(%rdi), %r13
1454385e0:     	leaq	0x3(%rdi), %rdx
1454385e4:     	leaq	0xa0(%rbp), %rcx
1454385eb:     	movq	%r13, %r8
1454385ee:     	callq	0x1455441f0 <.text+0x55431f0>
1454385f3:     	nop
1454385f4:     	movq	0xa8(%rbp), %rbx
1454385fb:     	movq	0xb0(%rbp), %rsi
145438602:     	movq	$0x1, 0x20(%rsp)
14543860b:     	movq	%r14, %rcx
14543860e:     	movq	%rbx, %rdx
145438611:     	movq	%rsi, %r8
145438614:     	leaq	0x1305075(%rip), %r9    # 0x14673d690
14543861b:     	callq	0x14546ac40 <.text+0x5469c40>
145438620:     	nop
145438621:     	leaq	0x2(%rdi), %rax
145438625:     	movq	0x10(%rbp), %rcx
145438629:     	movq	%rcx, 0xf0(%rbp)
145438630:     	movdqu	(%rbp), %xmm0
145438635:     	movdqa	%xmm0, 0xe0(%rbp)
14543863d:     	movq	%rdi, (%rbp)
145438641:     	incq	%rdi
145438644:     	leaq	0x2fe6d5(%rip), %rcx    # 0x145736d20 <.text+0x5735d20>
14543864b:     	movq	%rcx, 0x8(%rbp)
14543864f:     	movq	%rdi, 0x10(%rbp)
145438653:     	movq	%rcx, 0x18(%rbp)
145438657:     	movq	%rax, 0x20(%rbp)
14543865b:     	movq	%rcx, 0x28(%rbp)
14543865f:     	leaq	0xe0(%rbp), %rax
145438666:     	movq	%rax, 0x30(%rbp)
14543866a:     	leaq	-0x5436591(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145438671:     	movq	%rax, 0x38(%rbp)
145438675:     	movq	%r12, %rcx
145438678:     	leaq	0x1305430(%rip), %rdx   # 0x14673daaf
14543867f:     	movq	%r14, %r8
145438682:     	callq	0x145728390 <.text+0x5727390>
145438687:     	nop
145438688:     	movq	0xe0(%rbp), %rdx
14543868f:     	testq	%rdx, %rdx
145438692:     	je	0x1454386a6 <.text+0x54376a6>
145438694:     	movq	0xe8(%rbp), %rcx
14543869b:     	movl	$0x1, %r8d
1454386a1:     	callq	0x1400021d0 <.text+0x11d0>
1454386a6:     	movq	0xc0(%rbp), %rax
1454386ad:     	movq	%rax, 0x110(%rbp)
1454386b4:     	movq	0xc8(%rbp), %rax
1454386bb:     	movq	%rax, 0x118(%rbp)
1454386c2:     	movq	0xd0(%rbp), %rdi
1454386c9:     	movq	0xf8(%rbp), %rax
1454386d0:     	movq	0x108(%rbp), %rdx
1454386d7:     	subq	%rdx, %rax
1454386da:     	cmpq	%rax, %rdi
1454386dd:     	ja	0x14543879b <.text+0x543779b>
1454386e3:     	testq	%rdi, %rdi
1454386e6:     	je	0x145438708 <.text+0x5437708>
1454386e8:     	addq	0x100(%rbp), %rdx
1454386ef:     	movq	%rdx, %rcx
1454386f2:     	movq	0x118(%rbp), %rdx
1454386f9:     	movq	%rdi, %r8
1454386fc:     	callq	0x1457731ed <.text+0x57721ed>
145438701:     	movq	0x108(%rbp), %rdx
145438708:     	addq	%rdi, %rdx
14543870b:     	movq	%rdx, 0x108(%rbp)
145438712:     	movq	0x110(%rbp), %rdx
145438719:     	testq	%rdx, %rdx
14543871c:     	je	0x145438730 <.text+0x5437730>
14543871e:     	movl	$0x1, %r8d
145438724:     	movq	0x118(%rbp), %rcx
14543872b:     	callq	0x1400021d0 <.text+0x11d0>
145438730:     	testq	%rsi, %rsi
145438733:     	je	0x145438770 <.text+0x5437770>
145438735:     	leaq	0x8(%rbx), %rdi
145438739:     	jmp	0x145438749 <.text+0x5437749>
14543873b:     	nopl	(%rax,%rax)
145438740:     	addq	$0x18, %rdi
145438744:     	decq	%rsi
145438747:     	je	0x145438770 <.text+0x5437770>
145438749:     	movq	-0x8(%rdi), %rdx
14543874d:     	testq	%rdx, %rdx
145438750:     	je	0x145438740 <.text+0x5437740>
145438752:     	movq	(%rdi), %rcx
145438755:     	movl	$0x1, %r8d
14543875b:     	callq	0x1400021d0 <.text+0x11d0>
145438760:     	jmp	0x145438740 <.text+0x5437740>
145438762:     	nopw	%cs:(%rax,%rax)
145438770:     	movq	0xa0(%rbp), %rax
145438777:     	testq	%rax, %rax
14543877a:     	je	0x1454385d0 <.text+0x54375d0>
145438780:     	shlq	$0x3, %rax
145438784:     	leaq	(%rax,%rax,2), %rdx
145438788:     	movl	$0x8, %r8d
14543878e:     	movq	%rbx, %rcx
145438791:     	callq	0x1400021d0 <.text+0x11d0>
145438796:     	jmp	0x1454385d0 <.text+0x54375d0>
14543879b:     	movq	$0x1, 0x20(%rsp)
1454387a4:     	movl	$0x1, %r9d
1454387aa:     	leaq	0xf8(%rbp), %rcx
1454387b1:     	movq	%rdi, %r8
1454387b4:     	callq	0x1457744b0 <.text+0x57734b0>
1454387b9:     	nop
1454387ba:     	movq	0x108(%rbp), %rdx
1454387c1:     	jmp	0x1454386e8 <.text+0x54376e8>
1454387c6:     	movq	0x108(%rbp), %rcx
1454387cd:     	movq	-0x58(%rbp), %rax
1454387d1:     	movq	%rcx, 0x10(%rax)
1454387d5:     	movups	0xf8(%rbp), %xmm0
1454387dc:     	movups	%xmm0, (%rax)
1454387df:     	addq	$0x1a8, %rsp            # imm = 0x1A8
1454387e6:     	popq	%rbx
1454387e7:     	popq	%rdi
1454387e8:     	popq	%rsi
1454387e9:     	popq	%r12
1454387eb:     	popq	%r13
1454387ed:     	popq	%r14
1454387ef:     	popq	%r15
1454387f1:     	popq	%rbp
1454387f2:     	retq
1454387f3:     	movq	%rdi, 0x118(%rbp)
1454387fa:     	movq	$0x1, 0x20(%rsp)
145438803:     	leaq	0xf8(%rbp), %rcx
14543880a:     	movl	$0x1, %r9d
145438810:     	movq	%rsi, %r8
145438813:     	callq	0x1457744b0 <.text+0x57734b0>
145438818:     	nop
145438819:     	movq	0x108(%rbp), %rdx
145438820:     	movq	0x118(%rbp), %rdi
145438827:     	jmp	0x145436abb <.text+0x5435abb>
14543882c:     	movq	%r12, 0x110(%rbp)
145438833:     	movq	%r15, 0x118(%rbp)
14543883a:     	movq	$0x1, 0x20(%rsp)
145438843:     	leaq	0xf8(%rbp), %rcx
14543884a:     	movl	$0x1, %r9d
145438850:     	movq	%rbx, %r8
145438853:     	callq	0x1457744b0 <.text+0x57734b0>
145438858:     	nop
145438859:     	movq	0x108(%rbp), %rdx
145438860:     	movq	0x118(%rbp), %r15
145438867:     	movq	0x110(%rbp), %r12
14543886e:     	jmp	0x145436d56 <.text+0x5435d56>
145438873:     	movq	%r12, 0x110(%rbp)
14543887a:     	movq	%r15, 0x118(%rbp)
145438881:     	movq	$0x1, 0x20(%rsp)
14543888a:     	leaq	0xf8(%rbp), %rcx
145438891:     	movl	$0x1, %r9d
145438897:     	movq	%rbx, %r8
14543889a:     	callq	0x1457744b0 <.text+0x57734b0>
14543889f:     	nop
1454388a0:     	movq	0x108(%rbp), %rdx
1454388a7:     	movq	0x118(%rbp), %r15
1454388ae:     	movq	0x110(%rbp), %r12
1454388b5:     	jmp	0x145437770 <.text+0x5436770>
1454388ba:     	movq	%rbx, 0x110(%rbp)
1454388c1:     	movq	%rdi, 0x118(%rbp)
1454388c8:     	movq	$0x1, 0x20(%rsp)
1454388d1:     	leaq	0xf8(%rbp), %rcx
1454388d8:     	movl	$0x1, %r9d
1454388de:     	movq	%rsi, %r8
1454388e1:     	callq	0x1457744b0 <.text+0x57734b0>
1454388e6:     	nop
1454388e7:     	movq	0xb8(%rbp), %r14
1454388ee:     	movq	0x108(%rbp), %rdx
1454388f5:     	movq	0x118(%rbp), %rdi
1454388fc:     	movq	0x110(%rbp), %rbx
145438903:     	jmp	0x1454378cf <.text+0x54368cf>
145438908:     	movq	%r12, 0x110(%rbp)
14543890f:     	movq	%r15, 0x118(%rbp)
145438916:     	movq	$0x1, 0x20(%rsp)
14543891f:     	leaq	0xf8(%rbp), %rcx
145438926:     	movl	$0x1, %r9d
14543892c:     	movq	%rbx, %r8
14543892f:     	callq	0x1457744b0 <.text+0x57734b0>
145438934:     	nop
145438935:     	movq	0x108(%rbp), %rdx
14543893c:     	movq	0x118(%rbp), %r15
145438943:     	movq	0x110(%rbp), %r12
14543894a:     	jmp	0x1454379fe <.text+0x54369fe>
14543894f:     	movq	%r12, 0x110(%rbp)
145438956:     	movq	%r15, 0x118(%rbp)
14543895d:     	movq	$0x1, 0x20(%rsp)
145438966:     	leaq	0xf8(%rbp), %rcx
14543896d:     	movl	$0x1, %r9d
145438973:     	movq	%rbx, %r8
145438976:     	callq	0x1457744b0 <.text+0x57734b0>
14543897b:     	nop
14543897c:     	movq	0x108(%rbp), %rdx
145438983:     	movq	0x118(%rbp), %r15
14543898a:     	movq	0x110(%rbp), %r12
145438991:     	jmp	0x1454381ee <.text+0x54371ee>
145438996:     	movq	%r12, 0x110(%rbp)
14543899d:     	movq	%r15, 0x118(%rbp)
1454389a4:     	movq	$0x1, 0x20(%rsp)
1454389ad:     	leaq	0xf8(%rbp), %rcx
1454389b4:     	movl	$0x1, %r9d
1454389ba:     	movq	%rbx, %r8
1454389bd:     	callq	0x1457744b0 <.text+0x57734b0>
1454389c2:     	nop
1454389c3:     	movq	0x108(%rbp), %rdx
1454389ca:     	movq	0x118(%rbp), %r15
1454389d1:     	movq	0x110(%rbp), %r12
1454389d8:     	jmp	0x145438374 <.text+0x5437374>
1454389dd:     	movq	%rbx, 0x110(%rbp)
1454389e4:     	movq	%rdi, 0x118(%rbp)
1454389eb:     	movq	$0x1, 0x20(%rsp)
1454389f4:     	leaq	0xf8(%rbp), %rcx
1454389fb:     	movl	$0x1, %r9d
145438a01:     	movq	%rsi, %r8
145438a04:     	callq	0x1457744b0 <.text+0x57734b0>
145438a09:     	nop
145438a0a:     	movq	0xb8(%rbp), %r14
145438a11:     	movq	0x108(%rbp), %rdx
145438a18:     	movq	0x118(%rbp), %rdi
145438a1f:     	movq	0x110(%rbp), %rbx
145438a26:     	jmp	0x1454384cf <.text+0x54374cf>
145438a2b:     	movq	%rbx, 0x110(%rbp)
145438a32:     	movq	%rdi, 0x118(%rbp)
145438a39:     	movq	$0x1, 0x20(%rsp)
145438a42:     	leaq	0xf8(%rbp), %rcx
145438a49:     	movl	$0x1, %r9d
145438a4f:     	movq	%rsi, %r8
145438a52:     	callq	0x1457744b0 <.text+0x57734b0>
145438a57:     	nop
145438a58:     	movq	0x108(%rbp), %rdx
145438a5f:     	movq	0xb8(%rbp), %r14
145438a66:     	movq	0x118(%rbp), %rdi
145438a6d:     	movq	0x110(%rbp), %rbx
145438a74:     	jmp	0x145438576 <.text+0x5437576>
145438a79:     	movq	%r12, 0x110(%rbp)
145438a80:     	movq	%r15, 0x118(%rbp)
145438a87:     	movq	$0x1, 0x20(%rsp)
145438a90:     	leaq	0xf8(%rbp), %rcx
145438a97:     	movl	$0x1, %r9d
145438a9d:     	movq	%rbx, %r8
145438aa0:     	callq	0x1457744b0 <.text+0x57734b0>
145438aa5:     	nop
145438aa6:     	movq	0x108(%rbp), %rdx
145438aad:     	movq	0x118(%rbp), %r15
145438ab4:     	movq	0x110(%rbp), %r12
145438abb:     	jmp	0x145437bd0 <.text+0x5436bd0>
145438ac0:     	leaq	0x1304f41(%rip), %r8    # 0x14673da08
145438ac7:     	movl	$0xc, %edx
145438acc:     	movq	$-0x1, %rcx
145438ad3:     	callq	0x145903b33 <.text+0x5902b33>
145438ad8:     	nop
145438ad9:     	jmp	0x145438afb <.text+0x5437afb>
145438adb:     	movl	$0x8, %ecx
145438ae0:     	movl	$0x48, %edx
145438ae5:     	callq	0x14590379b <.text+0x590279b>
145438aea:     	nop
145438aeb:     	jmp	0x145438afb <.text+0x5437afb>
145438aed:     	movl	$0x1, %ecx
145438af2:     	movq	%rsi, %rdx
145438af5:     	callq	0x14590379b <.text+0x590279b>
145438afa:     	nop
145438afb:     	ud2

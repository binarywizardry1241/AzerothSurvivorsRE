
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458bd6f0:     	pushq	%rbp
1458bd6f1:     	pushq	%r15
1458bd6f3:     	pushq	%r14
1458bd6f5:     	pushq	%r13
1458bd6f7:     	pushq	%r12
1458bd6f9:     	pushq	%rsi
1458bd6fa:     	pushq	%rdi
1458bd6fb:     	pushq	%rbx
1458bd6fc:     	subq	$0x188, %rsp            # imm = 0x188
1458bd703:     	leaq	0x80(%rsp), %rbp
1458bd70b:     	movq	$-0x2, 0x100(%rbp)
1458bd716:     	movq	%rcx, %rsi
1458bd719:     	leal	-0x15f91(%rdx), %ecx
1458bd71f:     	cmpl	$0x18, %ecx
1458bd722:     	setb	%al
1458bd725:     	movl	$0xfffc3f, %r8d         # imm = 0xFFFC3F
1458bd72b:     	shrl	%cl, %r8d
1458bd72e:     	andb	%al, %r8b
1458bd731:     	cmpb	$0x1, %r8b
1458bd735:     	jne	0x1458bd7da <.text+0x58bc7da>
1458bd73b:     	movl	%ecx, %eax
1458bd73d:     	leaq	0x1301814(%rip), %rcx   # 0x146bbef58
1458bd744:     	movq	(%rcx,%rax,8), %r13
1458bd748:     	leaq	0x30(%r13), %rax
1458bd74c:     	movl	0x30(%r13), %r12d
1458bd750:     	movq	%rax, 0xb8(%rbp)
1458bd757:     	leaq	0x2f0822(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
1458bd75e:     	movq	%rax, 0xc0(%rbp)
1458bd765:     	leaq	0x12fc814(%rip), %rdx   # 0x146bb9f80
1458bd76c:     	leaq	0x10(%rbp), %rcx
1458bd770:     	leaq	0xb8(%rbp), %r8
1458bd777:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458bd77c:     	movq	0x18(%rbp), %rcx
1458bd780:     	movq	0x20(%rbp), %rdx
1458bd784:     	movq	(%r13), %rbx
1458bd788:     	movq	0x8(%r13), %r15
1458bd78c:     	movq	%rcx, 0xf0(%rbp)
1458bd793:     	callq	0x1458da590 <.text+0x58d9590>
1458bd798:     	nop
1458bd799:     	movq	%rax, %r14
1458bd79c:     	movq	%rdx, %rdi
1458bd79f:     	movq	0x10(%rbp), %rdx
1458bd7a3:     	testq	%rdx, %rdx
1458bd7a6:     	je	0x1458bd7ba <.text+0x58bc7ba>
1458bd7a8:     	movl	$0x1, %r8d
1458bd7ae:     	movq	0xf0(%rbp), %rcx
1458bd7b5:     	callq	0x1400021d0 <.text+0x11d0>
1458bd7ba:     	testq	%r14, %r14
1458bd7bd:     	cmovneq	%r14, %rbx
1458bd7c1:     	cmoveq	%r15, %rdi
1458bd7c5:     	testq	%rdi, %rdi
1458bd7c8:     	jns	0x1458bd805 <.text+0x58bc805>
1458bd7ca:     	xorl	%r15d, %r15d
1458bd7cd:     	movq	%r15, %rcx
1458bd7d0:     	movq	%rdi, %rdx
1458bd7d3:     	callq	0x145d6944b <.text+0x5d6844b>
1458bd7d8:     	ud2
1458bd7da:     	leal	-0x1(%rdx), %eax
1458bd7dd:     	cmpl	$0x1869f, %eax          # imm = 0x1869F
1458bd7e2:     	jae	0x1458bd7f1 <.text+0x58bc7f1>
1458bd7e4:     	movq	%rsi, %rcx
1458bd7e7:     	callq	0x1458bcca0 <.text+0x58bbca0>
1458bd7ec:     	jmp	0x1458bd990 <.text+0x58bc990>
1458bd7f1:     	cmpl	$0x186a0, %edx          # imm = 0x186A0
1458bd7f7:     	jae	0x1458bd83e <.text+0x58bc83e>
1458bd7f9:     	movq	$-0x1, (%rsi)
1458bd800:     	jmp	0x1458bd990 <.text+0x58bc990>
1458bd805:     	je	0x1458bd929 <.text+0x58bc929>
1458bd80b:     	callq	0x140002200 <.text+0x1200>
1458bd810:     	movl	$0x1, %r15d
1458bd816:     	movl	$0x1, %edx
1458bd81b:     	movq	%rdi, %rcx
1458bd81e:     	callq	0x1400021c0 <.text+0x11c0>
1458bd823:     	testq	%rax, %rax
1458bd826:     	je	0x1458bd7cd <.text+0x58bc7cd>
1458bd828:     	movq	%rax, %r14
1458bd82b:     	movq	%rax, %rcx
1458bd82e:     	movq	%rbx, %rdx
1458bd831:     	movq	%rdi, %r8
1458bd834:     	callq	0x145bc977b <.text+0x5bc877b>
1458bd839:     	jmp	0x1458bd92f <.text+0x58bc92f>
1458bd83e:     	leal	-0x186a0(%rdx), %eax
1458bd844:     	imulq	$0x51eb851f, %rax, %r12 # imm = 0x51EB851F
1458bd84b:     	shrq	$0x25, %r12
1458bd84f:     	imulq	$0x1999999a, %r12, %rcx # imm = 0x1999999A
1458bd856:     	shrq	$0x20, %rcx
1458bd85a:     	addl	%ecx, %ecx
1458bd85c:     	leal	(%rcx,%rcx,4), %ecx
1458bd85f:     	subl	%ecx, %r12d
1458bd862:     	movq	%r12, -0x40(%rbp)
1458bd866:     	imull	$0xcccccccd, %eax, %ecx # imm = 0xCCCCCCCD
1458bd86c:     	rorl	%ecx
1458bd86e:     	cmpl	$0x19999999, %ecx       # imm = 0x19999999
1458bd874:     	ja	0x1458bd7f9 <.text+0x58bc7f9>
1458bd876:     	cmpl	$0x2edf, %eax           # imm = 0x2EDF
1458bd87b:     	ja	0x1458bd7f9 <.text+0x58bc7f9>
1458bd881:     	movl	$0xcccccccd, %r15d      # imm = 0xCCCCCCCD
1458bd887:     	imulq	%rax, %r15
1458bd88b:     	shrq	$0x23, %r15
1458bd88f:     	imulq	$0x1999999a, %r15, %rcx # imm = 0x1999999A
1458bd896:     	shrq	$0x20, %rcx
1458bd89a:     	addl	%ecx, %ecx
1458bd89c:     	leal	(%rcx,%rcx,4), %ecx
1458bd89f:     	subl	%ecx, %r15d
1458bd8a2:     	cmpl	$0x7, %r15d
1458bd8a6:     	jae	0x1458bd7f9 <.text+0x58bc7f9>
1458bd8ac:     	imulq	$0x10624dd3, %rax, %rdi # imm = 0x10624DD3
1458bd8b3:     	shrq	$0x26, %rdi
1458bd8b7:     	leal	-0x1(%rdi), %eax
1458bd8ba:     	cmpb	$0xa, %al
1458bd8bc:     	ja	0x1458bd7f9 <.text+0x58bc7f9>
1458bd8c2:     	movzbl	%al, %eax
1458bd8c5:     	movl	$0x5df, %ecx            # imm = 0x5DF
1458bd8ca:     	btl	%eax, %ecx
1458bd8cd:     	jae	0x1458bd7f9 <.text+0x58bc7f9>
1458bd8d3:     	leaq	0x13019ce(%rip), %rcx   # 0x146bbf2a8
1458bd8da:     	movq	(%rcx,%rax,8), %rbx
1458bd8de:     	cmpl	$0x6, %r15d
1458bd8e2:     	movl	$0x5, %eax
1458bd8e7:     	cmovnel	%r15d, %eax
1458bd8eb:     	movq	%rax, 0xd0(%rbp)
1458bd8f2:     	cmpl	$0x5, %eax
1458bd8f5:     	jne	0x1458bd9a7 <.text+0x58bc9a7>
1458bd8fb:     	movq	%rdx, %r14
1458bd8fe:     	movl	%edi, %ecx
1458bd900:     	callq	0x1458bead0 <.text+0x58bdad0>
1458bd905:     	testq	%rax, %rax
1458bd908:     	je	0x1458bd7f9 <.text+0x58bc7f9>
1458bd90e:     	movq	%rax, %r13
1458bd911:     	xorl	%eax, %eax
1458bd913:     	cmpl	$0x6, %r15d
1458bd917:     	sete	%al
1458bd91a:     	movq	%rax, 0xf0(%rbp)
1458bd921:     	movq	%r14, %rdx
1458bd924:     	jmp	0x1458bd9aa <.text+0x58bc9aa>
1458bd929:     	movl	$0x1, %r14d
1458bd92f:     	movl	0x34(%r13), %eax
1458bd933:     	cmpq	$0x1, 0x20(%r13)
1458bd938:     	movl	$0x2, %ecx
1458bd93d:     	sbbq	$0x0, %rcx
1458bd941:     	movq	%rdi, (%rsi)
1458bd944:     	movq	%r14, 0x8(%rsi)
1458bd948:     	movq	%rdi, 0x10(%rsi)
1458bd94c:     	movq	$0x0, 0x18(%rsi)
1458bd954:     	movq	$0x4, 0x20(%rsi)
1458bd95c:     	movq	$0x0, 0x28(%rsi)
1458bd964:     	movq	%rcx, 0x30(%rsi)
1458bd968:     	movq	$0x0, 0x38(%rsi)
1458bd970:     	movq	$0x0, 0x48(%rsi)
1458bd978:     	movl	%r12d, 0x50(%rsi)
1458bd97c:     	movl	%eax, 0x54(%rsi)
1458bd97f:     	movaps	0x12fb9ca(%rip), %xmm0  # 0x146bb9350
1458bd986:     	movups	%xmm0, 0x58(%rsi)
1458bd98a:     	movw	$0x12, 0x68(%rsi)
1458bd990:     	movq	%rsi, %rax
1458bd993:     	addq	$0x188, %rsp            # imm = 0x188
1458bd99a:     	popq	%rbx
1458bd99b:     	popq	%rdi
1458bd99c:     	popq	%rsi
1458bd99d:     	popq	%r12
1458bd99f:     	popq	%r13
1458bd9a1:     	popq	%r14
1458bd9a3:     	popq	%r15
1458bd9a5:     	popq	%rbp
1458bd9a6:     	retq
1458bd9a7:     	xorl	%r13d, %r13d
1458bd9aa:     	movq	$0x0, -0x30(%rbp)
1458bd9b2:     	movq	$0x4, -0x28(%rbp)
1458bd9ba:     	movq	$0x0, -0x20(%rbp)
1458bd9c2:     	cmpl	$0x8, %r12d
1458bd9c6:     	jae	0x1458bdd90 <.text+0x58bcd90>
1458bd9cc:     	movq	%rdx, -0x38(%rbp)
1458bd9d0:     	movzbl	0x128(%rbx), %eax
1458bd9d7:     	decb	%al
1458bd9d9:     	movzbl	%al, %eax
1458bd9dc:     	shll	$0x3, %eax
1458bd9df:     	leaq	0x1301632(%rip), %rcx   # 0x146bbf018
1458bd9e6:     	movq	(%rax,%rcx), %rcx
1458bd9ea:     	leaq	0x1301647(%rip), %rdx   # 0x146bbf038
1458bd9f1:     	movq	(%rax,%rdx), %rax
1458bd9f5:     	movq	%rcx, 0x98(%rbp)
1458bd9fc:     	movq	%rax, 0xa0(%rbp)
1458bda03:     	leaq	0x98(%rbp), %rax
1458bda0a:     	movq	%rax, 0x10(%rbp)
1458bda0e:     	leaq	-0x58bb955(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458bda15:     	movq	%rax, 0x18(%rbp)
1458bda19:     	leaq	-0x40(%rbp), %rax
1458bda1d:     	movq	%rax, 0x20(%rbp)
1458bda21:     	leaq	0x2f1448(%rip), %rax    # 0x145baee70 <.text+0x5bade70>
1458bda28:     	movq	%rax, 0x28(%rbp)
1458bda2c:     	movb	$0x1, 0xff(%rbp)
1458bda33:     	movb	$0x1, 0xfe(%rbp)
1458bda3a:     	leaq	0x12fdd15(%rip), %rdx   # 0x146bbb756
1458bda41:     	leaq	0xb8(%rbp), %rcx
1458bda48:     	leaq	0x10(%rbp), %r8
1458bda4c:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458bda51:     	nop
1458bda52:     	movq	%r13, -0x8(%rbp)
1458bda56:     	movq	%rbx, 0xe0(%rbp)
1458bda5d:     	movzbl	0x128(%rbx), %eax
1458bda64:     	decb	%al
1458bda66:     	movzbl	%al, %eax
1458bda69:     	shll	$0x3, %eax
1458bda6c:     	leaq	0x13015e5(%rip), %rcx   # 0x146bbf058
1458bda73:     	movq	(%rax,%rcx), %rcx
1458bda77:     	movq	%rcx, 0xe8(%rbp)
1458bda7e:     	leaq	0x13015f3(%rip), %rdx   # 0x146bbf078
1458bda85:     	movq	(%rax,%rdx), %rcx
1458bda89:     	movq	%rcx, 0xd8(%rbp)
1458bda90:     	leaq	0x1301601(%rip), %r8    # 0x146bbf098
1458bda97:     	movq	(%rax,%r8), %rcx
1458bda9b:     	movq	%rcx, (%rbp)
1458bda9f:     	leaq	0x1301612(%rip), %r9    # 0x146bbf0b8
1458bdaa6:     	movq	(%rax,%r9), %rcx
1458bdaaa:     	movq	%rcx, 0x8(%rbp)
1458bdaae:     	leaq	0x1301623(%rip), %r10   # 0x146bbf0d8
1458bdab5:     	movq	(%rax,%r10), %rcx
1458bdab9:     	movq	%rcx, -0x18(%rbp)
1458bdabd:     	leaq	0x1301634(%rip), %r11   # 0x146bbf0f8
1458bdac4:     	movq	(%rax,%r11), %rcx
1458bdac8:     	movq	%rcx, -0x10(%rbp)
1458bdacc:     	leaq	0x1301645(%rip), %r14   # 0x146bbf118
1458bdad3:     	movq	(%rax,%r14), %r14
1458bdad7:     	leaq	0x130165a(%rip), %r15   # 0x146bbf138
1458bdade:     	movq	(%rax,%r15), %r15
1458bdae2:     	leaq	0x130166f(%rip), %r13   # 0x146bbf158
1458bdae9:     	movq	(%rax,%r13), %r13
1458bdaed:     	leaq	0x1301684(%rip), %rbx   # 0x146bbf178
1458bdaf4:     	movq	(%rax,%rbx), %rbx
1458bdaf8:     	leaq	0x1301699(%rip), %rcx   # 0x146bbf198
1458bdaff:     	movq	(%rax,%rcx), %rcx
1458bdb03:     	leaq	0x13016ae(%rip), %rdx   # 0x146bbf1b8
1458bdb0a:     	movq	(%rax,%rdx), %rdx
1458bdb0e:     	leaq	0x13016c3(%rip), %r8    # 0x146bbf1d8
1458bdb15:     	movq	(%rax,%r8), %r8
1458bdb19:     	leaq	0x13016d8(%rip), %r9    # 0x146bbf1f8
1458bdb20:     	movq	(%rax,%r9), %r9
1458bdb24:     	leaq	0x13016ed(%rip), %r10   # 0x146bbf218
1458bdb2b:     	movq	(%rax,%r10), %r10
1458bdb2f:     	leaq	0x1301702(%rip), %r11   # 0x146bbf238
1458bdb36:     	movq	(%rax,%r11), %rax
1458bdb3a:     	movq	0xe8(%rbp), %r11
1458bdb41:     	movq	%r11, 0x10(%rbp)
1458bdb45:     	movq	0xd8(%rbp), %r11
1458bdb4c:     	movq	%r11, 0x18(%rbp)
1458bdb50:     	movq	(%rbp), %r11
1458bdb54:     	movq	%r11, 0x20(%rbp)
1458bdb58:     	movq	0x8(%rbp), %r11
1458bdb5c:     	movq	%r11, 0x28(%rbp)
1458bdb60:     	movq	-0x18(%rbp), %r11
1458bdb64:     	movq	%r11, 0x30(%rbp)
1458bdb68:     	movq	-0x10(%rbp), %r11
1458bdb6c:     	movq	%r11, 0x38(%rbp)
1458bdb70:     	movq	%r14, 0x40(%rbp)
1458bdb74:     	movq	%r15, 0x48(%rbp)
1458bdb78:     	movq	%r13, 0x50(%rbp)
1458bdb7c:     	movq	%rbx, 0x58(%rbp)
1458bdb80:     	movq	%rcx, 0x60(%rbp)
1458bdb84:     	movq	%rdx, 0x68(%rbp)
1458bdb88:     	movq	0xb8(%rbp), %rcx
1458bdb8f:     	movq	%rcx, 0xe8(%rbp)
1458bdb96:     	movq	%r8, 0x70(%rbp)
1458bdb9a:     	movq	0xc0(%rbp), %rcx
1458bdba1:     	movq	%r9, 0x78(%rbp)
1458bdba5:     	movq	0xc8(%rbp), %rdx
1458bdbac:     	movq	%r10, 0x80(%rbp)
1458bdbb3:     	movq	%rax, 0x88(%rbp)
1458bdbba:     	movq	%r12, %rax
1458bdbbd:     	shlq	$0x4, %rax
1458bdbc1:     	movq	0x10(%rbp,%rax), %r15
1458bdbc6:     	movq	0x18(%rbp,%rax), %r14
1458bdbcb:     	movq	%rcx, 0xd8(%rbp)
1458bdbd2:     	callq	0x1458da590 <.text+0x58d9590>
1458bdbd7:     	nop
1458bdbd8:     	testq	%rax, %rax
1458bdbdb:     	cmovneq	%rax, %r15
1458bdbdf:     	cmoveq	%r14, %rdx
1458bdbe3:     	movq	%r15, -0x50(%rbp)
1458bdbe7:     	movq	%rdx, -0x48(%rbp)
1458bdbeb:     	movq	0xe8(%rbp), %rdx
1458bdbf2:     	testq	%rdx, %rdx
1458bdbf5:     	movq	-0x8(%rbp), %rbx
1458bdbf9:     	je	0x1458bdc0d <.text+0x58bcc0d>
1458bdbfb:     	movl	$0x1, %r8d
1458bdc01:     	movq	0xd8(%rbp), %rcx
1458bdc08:     	callq	0x1400021d0 <.text+0x11d0>
1458bdc0d:     	testq	%rbx, %rbx
1458bdc10:     	movq	0xe0(%rbp), %r14
1458bdc17:     	je	0x1458bdee0 <.text+0x58bcee0>
1458bdc1d:     	movq	0xf0(%rbp), %r15
1458bdc24:     	shlq	$0x4, %r15
1458bdc28:     	addq	%rbx, %r15
1458bdc2b:     	movq	%r15, 0xb8(%rbp)
1458bdc32:     	leaq	-0x58bbb79(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458bdc39:     	movq	%rax, 0xc0(%rbp)
1458bdc40:     	movb	$0x1, 0xff(%rbp)
1458bdc47:     	movb	$0x1, 0xfe(%rbp)
1458bdc4e:     	leaq	0x12fdad6(%rip), %rdx   # 0x146bbb72b
1458bdc55:     	leaq	0x10(%rbp), %rcx
1458bdc59:     	leaq	0xb8(%rbp), %r8
1458bdc60:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458bdc65:     	nop
1458bdc66:     	movq	0x10(%rbp), %rax
1458bdc6a:     	movq	%rax, 0xe8(%rbp)
1458bdc71:     	movq	0x18(%rbp), %rcx
1458bdc75:     	movq	0x20(%rbp), %rdx
1458bdc79:     	movq	(%r15), %r14
1458bdc7c:     	movq	0x8(%r15), %r15
1458bdc80:     	movq	%rcx, 0xd8(%rbp)
1458bdc87:     	callq	0x1458da590 <.text+0x58d9590>
1458bdc8c:     	nop
1458bdc8d:     	testq	%rax, %rax
1458bdc90:     	cmovneq	%rax, %r14
1458bdc94:     	cmoveq	%r15, %rdx
1458bdc98:     	movq	%r14, 0x98(%rbp)
1458bdc9f:     	movq	%rdx, 0xa0(%rbp)
1458bdca6:     	movq	0xe8(%rbp), %rdx
1458bdcad:     	testq	%rdx, %rdx
1458bdcb0:     	je	0x1458bdcc4 <.text+0x58bccc4>
1458bdcb2:     	movl	$0x1, %r8d
1458bdcb8:     	movq	0xd8(%rbp), %rcx
1458bdcbf:     	callq	0x1400021d0 <.text+0x11d0>
1458bdcc4:     	leaq	0x12fff5d(%rip), %rax   # 0x146bbdc28
1458bdccb:     	movq	%rax, 0x10(%rbp)
1458bdccf:     	movq	$0x4, 0x18(%rbp)
1458bdcd7:     	leaq	-0x50(%rbp), %rax
1458bdcdb:     	movq	%rax, 0x20(%rbp)
1458bdcdf:     	leaq	0x12fff22(%rip), %rax   # 0x146bbdc08
1458bdce6:     	movq	%rax, 0x28(%rbp)
1458bdcea:     	leaq	0x12fff3b(%rip), %rcx   # 0x146bbdc2c
1458bdcf1:     	movq	%rcx, 0x30(%rbp)
1458bdcf5:     	movq	$0x3, 0x38(%rbp)
1458bdcfd:     	leaq	0x98(%rbp), %rcx
1458bdd04:     	movq	%rcx, 0x40(%rbp)
1458bdd08:     	movq	%rax, 0x48(%rbp)
1458bdd0c:     	movb	$0x1, 0xff(%rbp)
1458bdd13:     	movb	$0x1, 0xfe(%rbp)
1458bdd1a:     	movq	$0x2, 0x20(%rsp)
1458bdd23:     	leaq	0x12fff05(%rip), %rdx   # 0x146bbdc2f
1458bdd2a:     	leaq	0xb8(%rbp), %rcx
1458bdd31:     	leaq	0x10(%rbp), %r9
1458bdd35:     	movl	$0x10, %r8d
1458bdd3b:     	callq	0x1458da540 <.text+0x58d9540>
1458bdd40:     	nop
1458bdd41:     	movq	0xe0(%rbp), %r14
1458bdd48:     	movq	0xf0(%rbp), %rax
1458bdd4f:     	shlq	$0x5, %rax
1458bdd53:     	addq	%rax, %rbx
1458bdd56:     	movl	0x30(%rbx,%r12,4), %r8d
1458bdd5b:     	testl	%r8d, %r8d
1458bdd5e:     	jne	0x1458bdd68 <.text+0x58bcd68>
1458bdd60:     	movl	0xe8(%r14,%r12,4), %r8d
1458bdd68:     	movq	0xb8(%rbp), %rax
1458bdd6f:     	movq	%rax, 0xf0(%rbp)
1458bdd76:     	movq	0xc0(%rbp), %rdx
1458bdd7d:     	movq	0xc8(%rbp), %rax
1458bdd84:     	movq	%rax, 0xd8(%rbp)
1458bdd8b:     	jmp	0x1458be171 <.text+0x58bd171>
1458bdd90:     	leaq	-0x8(%r12), %rax
1458bdd95:     	cmpq	0x80(%rbx), %rax
1458bdd9c:     	jae	0x1458bd7f9 <.text+0x58bc7f9>
1458bdda2:     	leaq	(%rax,%rax,8), %r15
1458bdda6:     	shlq	$0x4, %r15
1458bddaa:     	addq	0x78(%rbx), %r15
1458bddae:     	testq	%r13, %r13
1458bddb1:     	je	0x1458bdf0d <.text+0x58bcf0d>
1458bddb7:     	cmpq	0x28(%r13), %rax
1458bddbb:     	jae	0x1458bd7f9 <.text+0x58bc7f9>
1458bddc1:     	movq	%rdx, -0x38(%rbp)
1458bddc5:     	leaq	(%rax,%rax,2), %rax
1458bddc9:     	shlq	$0x4, %rax
1458bddcd:     	addq	0x20(%r13), %rax
1458bddd1:     	movq	0xf0(%rbp), %rcx
1458bddd8:     	leaq	(%rcx,%rcx,2), %rcx
1458bdddc:     	movl	(%rax,%rcx,8), %edx
1458bdddf:     	movl	%edx, 0xe8(%rbp)
1458bdde5:     	movups	0x8(%rax,%rcx,8), %xmm0
1458bddea:     	movups	%xmm0, 0x98(%rbp)
1458bddf1:     	leaq	0x98(%rbp), %rax
1458bddf8:     	movq	%rax, 0xb8(%rbp)
1458bddff:     	leaq	-0x58bbd46(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458bde06:     	movq	%rax, 0xc0(%rbp)
1458bde0d:     	movb	$0x1, 0xff(%rbp)
1458bde14:     	movb	$0x1, 0xfe(%rbp)
1458bde1b:     	leaq	0x12fd8fb(%rip), %rdx   # 0x146bbb71d
1458bde22:     	leaq	0x10(%rbp), %rcx
1458bde26:     	leaq	0xb8(%rbp), %r8
1458bde2d:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458bde32:     	nop
1458bde33:     	movq	0x10(%rbp), %rax
1458bde37:     	movq	%rax, 0xe0(%rbp)
1458bde3e:     	movq	0x18(%rbp), %rcx
1458bde42:     	movq	0x20(%rbp), %rdx
1458bde46:     	movq	0x98(%rbp), %r14
1458bde4d:     	movq	0xa0(%rbp), %rbx
1458bde54:     	movq	%rcx, 0xd8(%rbp)
1458bde5b:     	callq	0x1458da590 <.text+0x58d9590>
1458bde60:     	nop
1458bde61:     	testq	%rax, %rax
1458bde64:     	cmovneq	%rax, %r14
1458bde68:     	cmoveq	%rbx, %rdx
1458bde6c:     	movq	%rdx, %rbx
1458bde6f:     	movq	$0x1, 0x20(%rsp)
1458bde78:     	leaq	0x10(%rbp), %rcx
1458bde7c:     	movl	$0x1, %r9d
1458bde82:     	xorl	%r8d, %r8d
1458bde85:     	callq	0x14023ff50 <.text+0x23ef50>
1458bde8a:     	movq	0x18(%rbp), %rax
1458bde8e:     	movq	%rax, 0xf0(%rbp)
1458bde95:     	cmpl	$0x1, 0x10(%rbp)
1458bde99:     	je	0x1458be6b5 <.text+0x58bd6b5>
1458bde9f:     	movq	0x20(%rbp), %r13
1458bdea3:     	testq	%rbx, %rbx
1458bdea6:     	je	0x1458bdeb6 <.text+0x58bceb6>
1458bdea8:     	movq	%r13, %rcx
1458bdeab:     	movq	%r14, %rdx
1458bdeae:     	movq	%rbx, %r8
1458bdeb1:     	callq	0x145bc977b <.text+0x5bc877b>
1458bdeb6:     	movq	0xe0(%rbp), %rdx
1458bdebd:     	testq	%rdx, %rdx
1458bdec0:     	je	0x1458bded4 <.text+0x58bced4>
1458bdec2:     	movl	$0x1, %r8d
1458bdec8:     	movq	0xd8(%rbp), %rcx
1458bdecf:     	callq	0x1400021d0 <.text+0x11d0>
1458bded4:     	movq	0xd0(%rbp), %rcx
1458bdedb:     	jmp	0x1458be3ab <.text+0x58bd3ab>
1458bdee0:     	movq	0xd0(%rbp), %rcx
1458bdee7:     	cmpq	$0x5, %rcx
1458bdeeb:     	jae	0x1458be6c8 <.text+0x58bd6c8>
1458bdef1:     	leaq	(%rcx,%rcx,2), %rax
1458bdef5:     	leal	-0x2(%rdi), %ecx
1458bdef8:     	cmpb	$0x9, %cl
1458bdefb:     	ja	0x1458bdf30 <.text+0x58bcf30>
1458bdefd:     	movzbl	%cl, %ecx
1458bdf00:     	leaq	0x1301351(%rip), %rdx   # 0x146bbf258
1458bdf07:     	movq	(%rdx,%rcx,8), %rcx
1458bdf0b:     	jmp	0x1458bdf37 <.text+0x58bcf37>
1458bdf0d:     	leal	-0x2(%rdi), %ecx
1458bdf10:     	cmpb	$0x9, %cl
1458bdf13:     	movq	%rdx, -0x38(%rbp)
1458bdf17:     	ja	0x1458be265 <.text+0x58bd265>
1458bdf1d:     	movzbl	%cl, %ecx
1458bdf20:     	leaq	0x1301331(%rip), %rdx   # 0x146bbf258
1458bdf27:     	movq	(%rdx,%rcx,8), %rcx
1458bdf2b:     	jmp	0x1458be26c <.text+0x58bd26c>
1458bdf30:     	leaq	0x12ed871(%rip), %rcx   # 0x146bab7a8
1458bdf37:     	movq	(%r14,%rax,8), %rbx
1458bdf3b:     	movq	0x8(%r14,%rax,8), %r15
1458bdf40:     	movb	0x10(%r14,%rax,8), %r13b
1458bdf45:     	addq	$0x10, %rcx
1458bdf49:     	movq	%rcx, 0x10(%rbp)
1458bdf4d:     	leaq	-0x58bbe94(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458bdf54:     	movq	%rax, 0x18(%rbp)
1458bdf58:     	leaq	0xd0(%rbp), %rax
1458bdf5f:     	movq	%rax, 0x20(%rbp)
1458bdf63:     	leaq	0x2f0f06(%rip), %rax    # 0x145baee70 <.text+0x5bade70>
1458bdf6a:     	movq	%rax, 0x28(%rbp)
1458bdf6e:     	movb	$0x1, 0xff(%rbp)
1458bdf75:     	movb	$0x1, 0xfe(%rbp)
1458bdf7c:     	leaq	0x12fd790(%rip), %rdx   # 0x146bbb713
1458bdf83:     	leaq	0xb8(%rbp), %rcx
1458bdf8a:     	leaq	0x10(%rbp), %r8
1458bdf8e:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458bdf93:     	nop
1458bdf94:     	movq	0xb8(%rbp), %rax
1458bdf9b:     	movq	%rax, 0xf0(%rbp)
1458bdfa2:     	movq	0xc0(%rbp), %rcx
1458bdfa9:     	movq	0xc8(%rbp), %rdx
1458bdfb0:     	movq	%rcx, 0xe8(%rbp)
1458bdfb7:     	callq	0x1458da590 <.text+0x58d9590>
1458bdfbc:     	nop
1458bdfbd:     	testq	%rax, %rax
1458bdfc0:     	cmovneq	%rax, %rbx
1458bdfc4:     	cmoveq	%r15, %rdx
1458bdfc8:     	movq	%rbx, 0x98(%rbp)
1458bdfcf:     	movq	%rdx, 0xa0(%rbp)
1458bdfd6:     	movq	0xf0(%rbp), %rdx
1458bdfdd:     	testq	%rdx, %rdx
1458bdfe0:     	je	0x1458bdff4 <.text+0x58bcff4>
1458bdfe2:     	movl	$0x1, %r8d
1458bdfe8:     	movq	0xe8(%rbp), %rcx
1458bdfef:     	callq	0x1400021d0 <.text+0x11d0>
1458bdff4:     	leaq	0x12ffc2d(%rip), %rax   # 0x146bbdc28
1458bdffb:     	testb	%r13b, %r13b
1458bdffe:     	je	0x1458be078 <.text+0x58bd078>
1458be000:     	movq	%rax, 0x10(%rbp)
1458be004:     	movq	$0x4, 0x18(%rbp)
1458be00c:     	leaq	-0x50(%rbp), %rax
1458be010:     	movq	%rax, 0x20(%rbp)
1458be014:     	leaq	0x12ffbed(%rip), %rax   # 0x146bbdc08
1458be01b:     	movq	%rax, 0x28(%rbp)
1458be01f:     	leaq	0x12ffc06(%rip), %rcx   # 0x146bbdc2c
1458be026:     	movq	%rcx, 0x30(%rbp)
1458be02a:     	movq	$0x3, 0x38(%rbp)
1458be032:     	leaq	0x98(%rbp), %rcx
1458be039:     	movq	%rcx, 0x40(%rbp)
1458be03d:     	movq	%rax, 0x48(%rbp)
1458be041:     	movb	$0x1, 0xff(%rbp)
1458be048:     	movb	$0x1, 0xfe(%rbp)
1458be04f:     	movq	$0x2, 0x20(%rsp)
1458be058:     	leaq	0x12ffbf9(%rip), %rdx   # 0x146bbdc58
1458be05f:     	leaq	0xb8(%rbp), %rcx
1458be066:     	leaq	0x10(%rbp), %r9
1458be06a:     	movl	$0xc, %r8d
1458be070:     	callq	0x1458da540 <.text+0x58d9540>
1458be075:     	nop
1458be076:     	jmp	0x1458be0ee <.text+0x58bd0ee>
1458be078:     	movq	%rax, 0x10(%rbp)
1458be07c:     	movq	$0x4, 0x18(%rbp)
1458be084:     	leaq	-0x50(%rbp), %rax
1458be088:     	movq	%rax, 0x20(%rbp)
1458be08c:     	leaq	0x12ffb75(%rip), %rax   # 0x146bbdc08
1458be093:     	movq	%rax, 0x28(%rbp)
1458be097:     	leaq	0x12ffb8e(%rip), %rcx   # 0x146bbdc2c
1458be09e:     	movq	%rcx, 0x30(%rbp)
1458be0a2:     	movq	$0x3, 0x38(%rbp)
1458be0aa:     	leaq	0x98(%rbp), %rcx
1458be0b1:     	movq	%rcx, 0x40(%rbp)
1458be0b5:     	movq	%rax, 0x48(%rbp)
1458be0b9:     	movb	$0x1, 0xff(%rbp)
1458be0c0:     	movb	$0x1, 0xfe(%rbp)
1458be0c7:     	movq	$0x2, 0x20(%rsp)
1458be0d0:     	leaq	0x12ffb58(%rip), %rdx   # 0x146bbdc2f
1458be0d7:     	leaq	0xb8(%rbp), %rcx
1458be0de:     	leaq	0x10(%rbp), %r9
1458be0e2:     	movl	$0x10, %r8d
1458be0e8:     	callq	0x1458da540 <.text+0x58d9540>
1458be0ed:     	nop
1458be0ee:     	movq	0xb8(%rbp), %rcx
1458be0f5:     	movq	0xc0(%rbp), %r8
1458be0fc:     	movq	0xc8(%rbp), %rax
1458be103:     	movq	%rax, 0xd8(%rbp)
1458be10a:     	leaq	0xd0(%rbp), %rax
1458be111:     	movq	%rax, 0x10(%rbp)
1458be115:     	movq	$0x0, 0x18(%rbp)
1458be11d:     	movq	$0x5, 0x20(%rbp)
1458be125:     	leaq	0x28(%rbp), %rdx
1458be129:     	movq	%r14, 0x28(%rbp)
1458be12d:     	leaq	-0x40(%rbp), %rax
1458be131:     	movq	%rax, 0x30(%rbp)
1458be135:     	movq	%r8, %rbx
1458be138:     	movq	%r8, 0xb0(%rbp)
1458be13f:     	movq	%rcx, 0xf0(%rbp)
1458be146:     	movq	%rcx, 0xa8(%rbp)
1458be14d:     	movb	$0x0, 0xff(%rbp)
1458be154:     	movb	$0x1, 0xfe(%rbp)
1458be15b:     	leaq	0x10(%rbp), %rcx
1458be15f:     	callq	0x1459b27c0 <.text+0x59b17c0>
1458be164:     	nop
1458be165:     	xorl	%r8d, %r8d
1458be168:     	testb	$0x1, %al
1458be16a:     	cmovnel	%edx, %r8d
1458be16e:     	movq	%rbx, %rdx
1458be171:     	movzbl	0x128(%r14), %ebx
1458be179:     	cmpl	$0x2, %r12d
1458be17d:     	movl	%r8d, 0xe8(%rbp)
1458be184:     	jne	0x1458be218 <.text+0x58bd218>
1458be18a:     	cmpb	$0x1, %bl
1458be18d:     	jne	0x1458be218 <.text+0x58bd218>
1458be193:     	leaq	0x12ffaea(%rip), %rax   # 0x146bbdc84
1458be19a:     	movzbl	(%r12,%rax), %eax
1458be19f:     	movb	%al, (%rbp)
1458be1a2:     	movl	$0x2, %eax
1458be1a7:     	leaq	0x12ffafe(%rip), %rcx   # 0x146bbdcac
1458be1ae:     	movl	$0x14, 0x8(%rbp)
1458be1b5:     	leaq	(%rcx,%rax,8), %rax
1458be1b9:     	movq	%rcx, 0x10(%rbp)
1458be1bd:     	movq	%rax, 0x18(%rbp)
1458be1c1:     	leaq	0xd0(%rbp), %rax
1458be1c8:     	movq	%rax, 0x20(%rbp)
1458be1cc:     	movq	%rdx, 0xe0(%rbp)
1458be1d3:     	movq	%rdx, 0xb0(%rbp)
1458be1da:     	movq	0xf0(%rbp), %rax
1458be1e1:     	movq	%rax, 0xa8(%rbp)
1458be1e8:     	movb	$0x0, 0xff(%rbp)
1458be1ef:     	movb	$0x1, 0xfe(%rbp)
1458be1f6:     	leaq	-0x30(%rbp), %rcx
1458be1fa:     	leaq	0x10(%rbp), %rdx
1458be1fe:     	callq	0x1459963f0 <.text+0x59953f0>
1458be203:     	nop
1458be204:     	movzbl	%bl, %eax
1458be207:     	movl	%eax, -0x18(%rbp)
1458be20a:     	xorl	%ebx, %ebx
1458be20c:     	movl	$0x4, -0x10(%rbp)
1458be213:     	jmp	0x1458be446 <.text+0x58bd446>
1458be218:     	leaq	0x12ffa45(%rip), %rax   # 0x146bbdc64
1458be21f:     	movl	(%rax,%r12,4), %r10d
1458be223:     	leaq	0x12ffa5a(%rip), %rax   # 0x146bbdc84
1458be22a:     	movzbl	(%r12,%rax), %r9d
1458be22f:     	cmpl	$0x6, %r12d
1458be233:     	movb	%r9b, (%rbp)
1458be237:     	movl	%r10d, 0x8(%rbp)
1458be23b:     	ja	0x1458be65e <.text+0x58bd65e>
1458be241:     	movl	%r12d, %eax
1458be244:     	leaq	0x13016b5(%rip), %rcx   # 0x146bbf900
1458be24b:     	movslq	(%rcx,%rax,4), %rax
1458be24f:     	addq	%rcx, %rax
1458be252:     	jmpq	*%rax
1458be254:     	movl	$0x2, %eax
1458be259:     	leaq	0x12ffa2c(%rip), %rcx   # 0x146bbdc8c
1458be260:     	jmp	0x1458be1b5 <.text+0x58bd1b5>
1458be265:     	leaq	0x12ed53c(%rip), %rcx   # 0x146bab7a8
1458be26c:     	addq	$0x10, %rcx
1458be270:     	movq	%rax, 0x98(%rbp)
1458be277:     	movq	%rcx, 0x10(%rbp)
1458be27b:     	leaq	-0x58bc1c2(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458be282:     	movq	%rax, 0x18(%rbp)
1458be286:     	leaq	0x98(%rbp), %rax
1458be28d:     	movq	%rax, 0x20(%rbp)
1458be291:     	leaq	0x2f0bd8(%rip), %rax    # 0x145baee70 <.text+0x5bade70>
1458be298:     	movq	%rax, 0x28(%rbp)
1458be29c:     	leaq	0xd0(%rbp), %rcx
1458be2a3:     	movq	%rcx, 0x30(%rbp)
1458be2a7:     	movq	%rax, 0x38(%rbp)
1458be2ab:     	movb	$0x1, 0xff(%rbp)
1458be2b2:     	movb	$0x1, 0xfe(%rbp)
1458be2b9:     	leaq	0x12fd443(%rip), %rdx   # 0x146bbb703
1458be2c0:     	leaq	0xb8(%rbp), %rcx
1458be2c7:     	leaq	0x10(%rbp), %r8
1458be2cb:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458be2d0:     	nop
1458be2d1:     	movq	0xb8(%rbp), %rax
1458be2d8:     	movq	%rax, 0xe0(%rbp)
1458be2df:     	movq	0xc0(%rbp), %rax
1458be2e6:     	movq	0xd0(%rbp), %rcx
1458be2ed:     	cmpq	$0x4, %rcx
1458be2f1:     	movq	%rax, 0xe8(%rbp)
1458be2f8:     	ja	0x1458be6ea <.text+0x58bd6ea>
1458be2fe:     	movq	0xc8(%rbp), %rdx
1458be305:     	shlq	$0x4, %rcx
1458be309:     	movq	0x8(%r15,%rcx), %r14
1458be30e:     	movq	0x10(%r15,%rcx), %rbx
1458be313:     	movq	%rax, %rcx
1458be316:     	callq	0x1458da590 <.text+0x58d9590>
1458be31b:     	nop
1458be31c:     	testq	%rax, %rax
1458be31f:     	cmovneq	%rax, %r14
1458be323:     	cmoveq	%rbx, %rdx
1458be327:     	movq	%rdx, %rbx
1458be32a:     	movq	$0x1, 0x20(%rsp)
1458be333:     	leaq	0x10(%rbp), %rcx
1458be337:     	movl	$0x1, %r9d
1458be33d:     	xorl	%r8d, %r8d
1458be340:     	callq	0x14023ff50 <.text+0x23ef50>
1458be345:     	movq	0x18(%rbp), %rax
1458be349:     	movq	%rax, 0xf0(%rbp)
1458be350:     	cmpl	$0x1, 0x10(%rbp)
1458be354:     	je	0x1458be6a2 <.text+0x58bd6a2>
1458be35a:     	movq	0x20(%rbp), %r13
1458be35e:     	testq	%rbx, %rbx
1458be361:     	je	0x1458be371 <.text+0x58bd371>
1458be363:     	movq	%r13, %rcx
1458be366:     	movq	%r14, %rdx
1458be369:     	movq	%rbx, %r8
1458be36c:     	callq	0x145bc977b <.text+0x5bc877b>
1458be371:     	movq	0xe0(%rbp), %rdx
1458be378:     	testq	%rdx, %rdx
1458be37b:     	je	0x1458be38f <.text+0x58bd38f>
1458be37d:     	movl	$0x1, %r8d
1458be383:     	movq	0xe8(%rbp), %rcx
1458be38a:     	callq	0x1400021d0 <.text+0x11d0>
1458be38f:     	movq	0xd0(%rbp), %rcx
1458be396:     	cmpq	$0x4, %rcx
1458be39a:     	ja	0x1458be6fe <.text+0x58bd6fe>
1458be3a0:     	movl	0x78(%r15,%rcx,4), %eax
1458be3a5:     	movl	%eax, 0xe8(%rbp)
1458be3ab:     	cmpl	$0x1, (%r15)
1458be3af:     	movq	%rbx, 0xd8(%rbp)
1458be3b6:     	jne	0x1458be3c9 <.text+0x58bd3c9>
1458be3b8:     	cmpq	$0x4, %rcx
1458be3bc:     	jne	0x1458be3c9 <.text+0x58bd3c9>
1458be3be:     	leaq	0x4(%r15), %rax
1458be3c2:     	movl	$0x1, %ebx
1458be3c7:     	jmp	0x1458be3d1 <.text+0x58bd3d1>
1458be3c9:     	leaq	0x6c(%r15), %rax
1458be3cd:     	movl	0x74(%r15), %ebx
1458be3d1:     	movl	0x68(%r15), %ecx
1458be3d5:     	movl	%ecx, -0x10(%rbp)
1458be3d8:     	movl	(%rax), %eax
1458be3da:     	movl	%eax, -0x18(%rbp)
1458be3dd:     	movl	0x70(%r15), %eax
1458be3e1:     	movl	%eax, 0x8(%rbp)
1458be3e4:     	movzbl	0x8c(%r15), %eax
1458be3ec:     	movb	%al, (%rbp)
1458be3ef:     	movq	0x58(%r15), %rax
1458be3f3:     	movq	0x60(%r15), %rcx
1458be3f7:     	leaq	(%rax,%rcx,8), %rcx
1458be3fb:     	movq	%rax, 0x10(%rbp)
1458be3ff:     	movq	%rcx, 0x18(%rbp)
1458be403:     	leaq	0xd0(%rbp), %rax
1458be40a:     	movq	%rax, 0x20(%rbp)
1458be40e:     	movq	%r13, 0xe0(%rbp)
1458be415:     	movq	%r13, 0xb0(%rbp)
1458be41c:     	movq	0xf0(%rbp), %rax
1458be423:     	movq	%rax, 0xa8(%rbp)
1458be42a:     	movb	$0x0, 0xff(%rbp)
1458be431:     	movb	$0x1, 0xfe(%rbp)
1458be438:     	leaq	-0x30(%rbp), %rcx
1458be43c:     	leaq	0x10(%rbp), %rdx
1458be440:     	callq	0x145996470 <.text+0x5995470>
1458be445:     	nop
1458be446:     	cmpq	$0x0, 0xd0(%rbp)
1458be44e:     	je	0x1458be589 <.text+0x58bd589>
1458be454:     	movl	%ebx, -0x8(%rbp)
1458be457:     	leal	(%rdi,%rdi,2), %r14d
1458be45b:     	addl	%r12d, %r14d
1458be45e:     	andl	$0x7, %r14d
1458be462:     	movl	%r14d, %eax
1458be465:     	shll	$0x4, %eax
1458be468:     	leaq	0x12ff895(%rip), %rcx   # 0x146bbdd04
1458be46f:     	leaq	(%rcx,%rax), %rdx
1458be473:     	addq	%rcx, %rax
1458be476:     	addq	$0x10, %rax
1458be47a:     	movq	%rdx, 0x10(%rbp)
1458be47e:     	movq	%rax, 0x18(%rbp)
1458be482:     	leaq	0xd0(%rbp), %rax
1458be489:     	movq	%rax, 0x20(%rbp)
1458be48d:     	movq	0xe0(%rbp), %rax
1458be494:     	movq	%rax, 0xb0(%rbp)
1458be49b:     	movq	0xf0(%rbp), %rax
1458be4a2:     	movq	%rax, 0xa8(%rbp)
1458be4a9:     	movb	$0x0, 0xff(%rbp)
1458be4b0:     	movb	$0x1, 0xfe(%rbp)
1458be4b7:     	leaq	-0x30(%rbp), %rcx
1458be4bb:     	leaq	0x10(%rbp), %rdx
1458be4bf:     	callq	0x1459964f0 <.text+0x59954f0>
1458be4c4:     	nop
1458be4c5:     	movq	0xd0(%rbp), %r8
1458be4cc:     	movq	0xe0(%rbp), %rax
1458be4d3:     	movq	%rax, 0xb0(%rbp)
1458be4da:     	movq	0xf0(%rbp), %rax
1458be4e1:     	movq	%rax, 0xa8(%rbp)
1458be4e8:     	movb	$0x0, 0xff(%rbp)
1458be4ef:     	movb	$0x1, 0xfe(%rbp)
1458be4f6:     	movl	%edi, %ecx
1458be4f8:     	movq	%r14, %rdx
1458be4fb:     	callq	0x1458bb9e0 <.text+0x58ba9e0>
1458be500:     	nop
1458be501:     	movq	%rax, %r15
1458be504:     	movq	%rdx, %r14
1458be507:     	movq	0xd0(%rbp), %r13
1458be50e:     	cmpq	$0x4, %r13
1458be512:     	jne	0x1458be584 <.text+0x58bd584>
1458be514:     	cmpl	$0x8, %r12d
1458be518:     	movabsq	$0x10000000b, %rax      # imm = 0x10000000B
1458be522:     	movabsq	$0x3d2c08310000000c, %r13 # imm = 0x3D2C08310000000C
1458be52c:     	cmovaeq	%rax, %r13
1458be530:     	movq	-0x20(%rbp), %rbx
1458be534:     	cmpq	-0x30(%rbp), %rbx
1458be538:     	jne	0x1458be56e <.text+0x58bd56e>
1458be53a:     	movq	0xe0(%rbp), %rax
1458be541:     	movq	%rax, 0xb0(%rbp)
1458be548:     	movq	0xf0(%rbp), %rax
1458be54f:     	movq	%rax, 0xa8(%rbp)
1458be556:     	movb	$0x0, 0xff(%rbp)
1458be55d:     	movb	$0x1, 0xfe(%rbp)
1458be564:     	leaq	-0x30(%rbp), %rcx
1458be568:     	callq	0x145bfb120 <.text+0x5bfa120>
1458be56d:     	nop
1458be56e:     	movq	-0x28(%rbp), %rax
1458be572:     	movq	%r13, (%rax,%rbx,8)
1458be576:     	incq	%rbx
1458be579:     	movq	%rbx, -0x20(%rbp)
1458be57d:     	movq	0xd0(%rbp), %r13
1458be584:     	movl	-0x8(%rbp), %ebx
1458be587:     	jmp	0x1458be58f <.text+0x58bd58f>
1458be589:     	xorl	%r13d, %r13d
1458be58c:     	xorl	%r15d, %r15d
1458be58f:     	movq	-0x20(%rbp), %rax
1458be593:     	movq	%rax, 0x20(%rbp)
1458be597:     	movups	-0x30(%rbp), %xmm0
1458be59b:     	movaps	%xmm0, 0x10(%rbp)
1458be59f:     	leaq	0xb8(%rbp), %rcx
1458be5a6:     	leaq	0x10(%rbp), %rdx
1458be5aa:     	callq	0x1458b8e20 <.text+0x58b7e20>
1458be5af:     	nop
1458be5b0:     	movq	0xd8(%rbp), %rcx
1458be5b7:     	movq	0xc8(%rbp), %rax
1458be5be:     	movq	%rax, 0x28(%rsi)
1458be5c2:     	movups	0xb8(%rbp), %xmm0
1458be5c9:     	movups	%xmm0, 0x18(%rsi)
1458be5cd:     	movq	0xf0(%rbp), %rax
1458be5d4:     	movq	%rax, (%rsi)
1458be5d7:     	movq	0xe0(%rbp), %rax
1458be5de:     	movq	%rax, 0x8(%rsi)
1458be5e2:     	movq	%rcx, 0x10(%rsi)
1458be5e6:     	movq	%r13, 0x30(%rsi)
1458be5ea:     	movq	%r15, 0x38(%rsi)
1458be5ee:     	movq	%r14, 0x40(%rsi)
1458be5f2:     	movq	%r12, 0x48(%rsi)
1458be5f6:     	movq	-0x38(%rbp), %rax
1458be5fa:     	movl	%eax, 0x50(%rsi)
1458be5fd:     	movl	0xe8(%rbp), %eax
1458be603:     	movl	%eax, 0x54(%rsi)
1458be606:     	movl	-0x10(%rbp), %eax
1458be609:     	movl	%eax, 0x58(%rsi)
1458be60c:     	movl	-0x18(%rbp), %eax
1458be60f:     	movl	%eax, 0x5c(%rsi)
1458be612:     	movl	0x8(%rbp), %eax
1458be615:     	movl	%eax, 0x60(%rsi)
1458be618:     	movl	%ebx, 0x64(%rsi)
1458be61b:     	movzbl	(%rbp), %eax
1458be61f:     	movb	%al, 0x68(%rsi)
1458be622:     	movb	%dil, 0x69(%rsi)
1458be626:     	jmp	0x1458bd990 <.text+0x58bc990>
1458be62b:     	movl	$0x2, %eax
1458be630:     	leaq	0x12ff695(%rip), %rcx   # 0x146bbdccc
1458be637:     	jmp	0x1458be1b5 <.text+0x58bd1b5>
1458be63c:     	movl	$0x2, %eax
1458be641:     	leaq	0x12ff664(%rip), %rcx   # 0x146bbdcac
1458be648:     	jmp	0x1458be1b5 <.text+0x58bd1b5>
1458be64d:     	movl	$0x2, %eax
1458be652:     	leaq	0x12ff663(%rip), %rcx   # 0x146bbdcbc
1458be659:     	jmp	0x1458be1b5 <.text+0x58bd1b5>
1458be65e:     	movl	$0x3, %eax
1458be663:     	leaq	0x12ff682(%rip), %rcx   # 0x146bbdcec
1458be66a:     	jmp	0x1458be1b5 <.text+0x58bd1b5>
1458be66f:     	movl	$0x2, %eax
1458be674:     	leaq	0x12ff621(%rip), %rcx   # 0x146bbdc9c
1458be67b:     	jmp	0x1458be1b5 <.text+0x58bd1b5>
1458be680:     	movl	$0x1, %eax
1458be685:     	leaq	0x12ff650(%rip), %rcx   # 0x146bbdcdc
1458be68c:     	jmp	0x1458be1b5 <.text+0x58bd1b5>
1458be691:     	movl	$0x1, %eax
1458be696:     	leaq	0x12ff647(%rip), %rcx   # 0x146bbdce4
1458be69d:     	jmp	0x1458be1b5 <.text+0x58bd1b5>
1458be6a2:     	movq	0x20(%rbp), %rdx
1458be6a6:     	movq	0xf0(%rbp), %rcx
1458be6ad:     	callq	0x145d6944b <.text+0x5d6844b>
1458be6b2:     	nop
1458be6b3:     	jmp	0x1458be733 <.text+0x58bd733>
1458be6b5:     	movq	0x20(%rbp), %rdx
1458be6b9:     	movq	0xf0(%rbp), %rcx
1458be6c0:     	callq	0x145d6944b <.text+0x5d6844b>
1458be6c5:     	nop
1458be6c6:     	jmp	0x1458be733 <.text+0x58bd733>
1458be6c8:     	movb	$0x1, 0xff(%rbp)
1458be6cf:     	movb	$0x1, 0xfe(%rbp)
1458be6d6:     	leaq	0x12ff563(%rip), %r8    # 0x146bbdc40
1458be6dd:     	movl	$0x5, %edx
1458be6e2:     	callq	0x145d697e3 <.text+0x5d687e3>
1458be6e7:     	nop
1458be6e8:     	jmp	0x1458be733 <.text+0x58bd733>
1458be6ea:     	leaq	0x12ff4e7(%rip), %r8    # 0x146bbdbd8
1458be6f1:     	movl	$0x5, %edx
1458be6f6:     	callq	0x145d697e3 <.text+0x5d687e3>
1458be6fb:     	nop
1458be6fc:     	jmp	0x1458be733 <.text+0x58bd733>
1458be6fe:     	movq	%r13, 0xb0(%rbp)
1458be705:     	movq	0xf0(%rbp), %rax
1458be70c:     	movq	%rax, 0xa8(%rbp)
1458be713:     	movb	$0x0, 0xff(%rbp)
1458be71a:     	movb	$0x1, 0xfe(%rbp)
1458be721:     	leaq	0x12ff4c8(%rip), %r8    # 0x146bbdbf0
1458be728:     	movl	$0x5, %edx
1458be72d:     	callq	0x145d697e3 <.text+0x5d687e3>
1458be732:     	nop
1458be733:     	ud2

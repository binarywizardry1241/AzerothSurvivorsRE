// soul-link-grant
145c88de0:     	testq	%rdx, %rdx
145c88de3:     	je	0x145c88840 <.text+0x5c87840>
145c88de9:     	movq	0x8f0(%rbx), %rax
145c88df0:     	cmpq	$0x1, %rdx
145c88df4:     	jne	0x145c88dfe <.text+0x5c87dfe>
145c88df6:     	xorl	%ecx, %ecx
145c88df8:     	movaps	%xmm11, %xmm0
145c88dfc:     	jmp	0x145c88e59 <.text+0x5c87e59>
145c88dfe:     	movq	%rdx, %r8
145c88e01:     	andq	$-0x2, %r8
145c88e05:     	leaq	0x44(%rax), %r9
145c88e09:     	xorl	%ecx, %ecx
145c88e0b:     	movaps	%xmm11, %xmm0
145c88e0f:     	jmp	0x145c88e2d <.text+0x5c87e2d>
145c88e11:     	nopw	%cs:(%rax,%rax)
145c88e20:     	addq	$0x2, %rcx
145c88e24:     	subq	$-0x80, %r9
145c88e28:     	cmpq	%rcx, %r8
145c88e2b:     	je	0x145c88e54 <.text+0x5c87e54>
145c88e2d:     	cmpb	$0x20, -0x44(%r9)
145c88e32:     	je	0x145c88e40 <.text+0x5c87e40>
145c88e34:     	cmpb	$0x20, -0x4(%r9)
145c88e39:     	jne	0x145c88e20 <.text+0x5c87e20>
145c88e3b:     	jmp	0x145c88e4d <.text+0x5c87e4d>
145c88e3d:     	nopl	(%rax)
145c88e40:     	addss	-0x40(%r9), %xmm0
145c88e46:     	cmpb	$0x20, -0x4(%r9)
145c88e4b:     	jne	0x145c88e20 <.text+0x5c87e20>
145c88e4d:     	addss	(%r9), %xmm0
145c88e52:     	jmp	0x145c88e20 <.text+0x5c87e20>
145c88e54:     	testb	$0x1, %dl
145c88e57:     	je	0x145c88e69 <.text+0x5c87e69>
145c88e59:     	shlq	$0x6, %rcx
145c88e5d:     	cmpb	$0x20, (%rax,%rcx)
145c88e61:     	jne	0x145c88e69 <.text+0x5c87e69>
145c88e63:     	addss	0x4(%rax,%rcx), %xmm0
145c88e69:     	ucomiss	%xmm0, %xmm9
145c88e6d:     	jae	0x145c88840 <.text+0x5c87840>
145c88e73:     	movss	0x4c8(%rbx), %xmm1
145c88e7b:     	mulss	0x5cfded(%rip), %xmm1   # 0x146258c70
145c88e83:     	mulss	%xmm0, %xmm7
145c88e87:     	movss	0x1a8(%rbx), %xmm0
145c88e8f:     	subss	%xmm0, %xmm1
145c88e93:     	maxss	%xmm9, %xmm1
145c88e98:     	minss	%xmm1, %xmm7
145c88e9c:     	ucomiss	%xmm9, %xmm7
145c88ea0:     	jbe	0x145c88840 <.text+0x5c87840>
145c88ea6:     	addss	%xmm7, %xmm0
145c88eaa:     	movss	%xmm0, 0x1a8(%rbx)
145c88eb2:     	addss	0x53c(%rbx), %xmm7
145c88eba:     	movss	%xmm7, 0x53c(%rbx)
145c88ec2:     	jmp	0x145c88840 <.text+0x5c87840>
// soul-link-clamp
145c70e16:     	movss	0x4c8(%rsi), %xmm0
145c70e1e:     	mulss	0x5e7e4a(%rip), %xmm0   # 0x146258c70
145c70e26:     	movss	0x1a8(%rsi), %xmm1
145c70e2e:     	ucomiss	%xmm0, %xmm1
145c70e31:     	jbe	0x145c70e5a <.text+0x5c6fe5a>
145c70e33:     	subss	%xmm0, %xmm1
145c70e37:     	movss	%xmm0, 0x1a8(%rsi)
145c70e3f:     	movss	0x53c(%rsi), %xmm0
145c70e47:     	subss	%xmm1, %xmm0
145c70e4b:     	xorps	%xmm1, %xmm1
145c70e4e:     	maxss	%xmm1, %xmm0
145c70e52:     	movss	%xmm0, 0x53c(%rsi)
// gate-draw-create
145c7067f:     	leaq	0xc8(%rbp), %rcx
145c70686:     	leaq	0x1c8(%rsi), %rdx
145c7068d:     	callq	0x145b525d0 <.text+0x5b515d0>
145c70692:     	nop
145c70693:     	movq	0xd8(%rbp), %r14
145c7069a:     	bsrq	%r14, %rcx
145c7069e:     	notl	%ecx
145c706a0:     	movq	%r14, %rdx
145c706a3:     	shlq	%cl, %rdx
145c706a6:     	movq	0xd0(%rbp), %rax
145c706ad:     	decq	%rdx
145c706b0:     	movq	%rdx, 0x18(%rbp)
145c706b4:     	movq	%rax, 0x48(%rbp)
145c706b8:     	leaq	(%rax,%r14,8), %rax
145c706bc:     	movq	%rax, 0x20(%rbp)
145c706c0:     	movl	$0x0, -0x40(%rbp)
145c706c7:     	jmp	0x145c706e9 <.text+0x5c6f6e9>
145c706c9:     	movq	%rdi, 0x20(%rsp)
145c706ce:     	movl	$0x3f800000, 0x28(%rsp) # imm = 0x3F800000
145c706d6:     	movq	%rsi, %rcx
145c706d9:     	movl	$0x1, %r8d
145c706df:     	movdqa	%xmm7, %xmm3
145c706e3:     	callq	0x145c8b5b0 <.text+0x5c8a5b0>
145c706e8:     	nop
145c706e9:     	movl	-0x40(%rbp), %eax
145c706ec:     	cmpl	0x2c(%rbp), %eax
145c706ef:     	jae	0x145c709ed <.text+0x5c6f9ed>
145c706f5:     	movq	0xd0(%rsi), %rcx
145c706fc:     	movq	0xd8(%rsi), %r8
145c70703:     	testq	%r8, %r8
145c70706:     	je	0x145c707b6 <.text+0x5c6f7b6>
145c7070c:     	cmpq	$0x1, %r8
145c70710:     	jne	0x145c70718 <.text+0x5c6f718>
145c70712:     	xorl	%edx, %edx
145c70714:     	xorl	%eax, %eax
145c70716:     	jmp	0x145c7078a <.text+0x5c6f78a>
145c70718:     	movq	%r8, %r9
145c7071b:     	andq	$-0x2, %r9
145c7071f:     	leaq	0x98(%rcx), %r10
145c70726:     	xorl	%edx, %edx
145c70728:     	xorl	%eax, %eax
145c7072a:     	jmp	0x145c7074a <.text+0x5c6f74a>
145c7072c:     	nopl	(%rax)
145c70730:     	addq	%r11, %rax
145c70733:     	addq	%r15, %rax
145c70736:     	addq	$0x2, %rdx
145c7073a:     	addq	$0x100, %r10            # imm = 0x100
145c70741:     	cmpq	%rdx, %r9
145c70744:     	leaq	0x58(%rbp), %rbx
145c70748:     	je	0x145c70784 <.text+0x5c6f784>
145c7074a:     	movq	-0x80(%r10), %r11
145c7074e:     	movzbl	0x39(%r11), %r15d
145c70753:     	decb	%r15b
145c70756:     	movl	$0x0, %r11d
145c7075c:     	cmpb	$0x4, %r15b
145c70760:     	jae	0x145c70769 <.text+0x5c6f769>
145c70762:     	movq	-0x98(%r10), %r11
145c70769:     	movq	(%r10), %r15
145c7076c:     	movzbl	0x39(%r15), %ebx
145c70771:     	decb	%bl
145c70773:     	movl	$0x0, %r15d
145c70779:     	cmpb	$0x4, %bl
145c7077c:     	jae	0x145c70730 <.text+0x5c6f730>
145c7077e:     	movq	-0x18(%r10), %r15
145c70782:     	jmp	0x145c70730 <.text+0x5c6f730>
145c70784:     	testb	$0x1, %r8b
145c70788:     	je	0x145c707ac <.text+0x5c6f7ac>
145c7078a:     	shlq	$0x7, %rdx
145c7078e:     	movq	0x18(%rcx,%rdx), %r9
145c70793:     	movzbl	0x39(%r9), %r9d
145c70798:     	decb	%r9b
145c7079b:     	cmpb	$0x4, %r9b
145c7079f:     	jae	0x145c707a7 <.text+0x5c6f7a7>
145c707a1:     	movq	(%rcx,%rdx), %rdx
145c707a5:     	jmp	0x145c707a9 <.text+0x5c6f7a9>
145c707a7:     	xorl	%edx, %edx
145c707a9:     	addq	%rdx, %rax
145c707ac:     	cmpq	$0xb, %rax
145c707b0:     	ja	0x145c709ed <.text+0x5c6f9ed>
145c707b6:     	testq	%r14, %r14
145c707b9:     	je	0x145c73e1e <.text+0x5c72e1e>
145c707bf:     	movq	%r14, %r13
145c707c2:     	incl	-0x40(%rbp)
145c707c5:     	movq	0xc20(%rsi), %r11
145c707cc:     	movq	0xc28(%rsi), %r9
145c707d3:     	movq	0xc38(%rsi), %r15
145c707da:     	movq	0xc30(%rsi), %r10
145c707e1:     	movq	0x18(%rbp), %r14
145c707e5:     	nopw	%cs:(%rax,%rax)
145c707f0:     	leaq	(%r11,%r15), %rax
145c707f4:     	rolq	$0x17, %rax
145c707f8:     	addq	%r11, %rax
145c707fb:     	movq	%r9, %rbx
145c707fe:     	shlq	$0x11, %rbx
145c70802:     	xorq	%r11, %r10
145c70805:     	xorq	%r9, %r15
145c70808:     	xorq	%r15, %r11
145c7080b:     	rolq	$0x2d, %r15
145c7080f:     	xorq	%r10, %r9
145c70812:     	mulq	%r13
145c70815:     	xorq	%rbx, %r10
145c70818:     	cmpq	%rax, %r14
145c7081b:     	jb	0x145c707f0 <.text+0x5c6f7f0>
145c7081d:     	movq	%r11, 0xc20(%rsi)
145c70824:     	movq	%r15, 0xc38(%rsi)
145c7082b:     	movq	%r9, 0xc28(%rsi)
145c70832:     	movq	%r10, 0xc30(%rsi)
145c70839:     	cmpq	%rdx, %r13
145c7083c:     	movq	%r13, %r14
145c7083f:     	jbe	0x145c73f6e <.text+0x5c72f6e>
145c70845:     	movq	0x48(%rbp), %rax
145c70849:     	movq	(%rax,%rdx,8), %rdx
145c7084d:     	testq	%r8, %r8
145c70850:     	leaq	0x58(%rbp), %rbx
145c70854:     	leaq	0x1(%rdi), %r13
145c70858:     	je	0x145c706c9 <.text+0x5c6f6c9>
145c7085e:     	movl	0x20(%rdx), %eax
145c70861:     	xorl	%r9d, %r9d
145c70864:     	jmp	0x145c7087f <.text+0x5c6f87f>
145c70866:     	nopw	%cs:(%rax,%rax)
145c70870:     	xorl	%r10d, %r10d
145c70873:     	addq	%r10, %r9
145c70876:     	subq	$-0x80, %rcx
145c7087a:     	decq	%r8
145c7087d:     	je	0x145c708ab <.text+0x5c6f8ab>
145c7087f:     	movq	0x18(%rcx), %r11
145c70883:     	movzbl	0x39(%r11), %r10d
145c70888:     	addb	$-0x5, %r10b
145c7088c:     	cmpb	$-0x4, %r10b
145c70890:     	jb	0x145c70870 <.text+0x5c6f870>
145c70892:     	cmpq	$0x0, (%rcx)
145c70896:     	movl	$0x0, %r10d
145c7089c:     	je	0x145c70873 <.text+0x5c6f873>
145c7089e:     	xorl	%r10d, %r10d
145c708a1:     	cmpl	%eax, 0x20(%r11)
145c708a5:     	sete	%r10b
145c708a9:     	jmp	0x145c70873 <.text+0x5c6f873>
145c708ab:     	cmpl	$0x252e, %eax           # imm = 0x252E
145c708b0:     	movl	$0xc, %ecx
145c708b5:     	movl	$0x6, %r8d
145c708bb:     	cmoveq	%r8, %rcx
145c708bf:     	cmpl	$0x252f, %eax           # imm = 0x252F
145c708c4:     	movl	$0x4, %eax
145c708c9:     	cmoveq	%rax, %rcx
145c708cd:     	cmpq	%rcx, %r9
145c708d0:     	jb	0x145c706c9 <.text+0x5c6f6c9>
145c708d6:     	movq	0x48(%rbp), %rax
145c708da:     	movq	%rax, 0x58(%rbp)
145c708de:     	movq	0x20(%rbp), %rax
145c708e2:     	movq	%rax, 0x60(%rbp)
145c708e6:     	movq	%rsi, 0x68(%rbp)
145c708ea:     	leaq	0xe0(%rbp), %rcx
145c708f1:     	movq	%rbx, %rdx
145c708f4:     	callq	0x145cf2080 <.text+0x5cf1080>
145c708f9:     	nop
145c708fa:     	movq	0xf0(%rbp), %r9
145c70901:     	testq	%r9, %r9
145c70904:     	je	0x145c709cb <.text+0x5c6f9cb>
145c7090a:     	movq	0xe8(%rbp), %rax
145c70911:     	movq	%rax, 0x30(%rbp)
145c70915:     	bsrq	%r9, %rcx
145c70919:     	notl	%ecx
145c7091b:     	movq	%r9, %r8
145c7091e:     	shlq	%cl, %r8
145c70921:     	decq	%r8
145c70924:     	movq	0xc20(%rsi), %r11
145c7092b:     	movq	0xc28(%rsi), %rcx
145c70932:     	movq	0xc38(%rsi), %r15
145c70939:     	movq	0xc30(%rsi), %r10
145c70940:     	leaq	(%r11,%r15), %rax
145c70944:     	rolq	$0x17, %rax
145c70948:     	addq	%r11, %rax
145c7094b:     	movq	%rcx, %rbx
145c7094e:     	shlq	$0x11, %rbx
145c70952:     	xorq	%r11, %r10
145c70955:     	xorq	%rcx, %r15
145c70958:     	xorq	%r15, %r11
145c7095b:     	rolq	$0x2d, %r15
145c7095f:     	xorq	%r10, %rcx
145c70962:     	mulq	%r9
145c70965:     	xorq	%rbx, %r10
145c70968:     	cmpq	%rax, %r8
145c7096b:     	jb	0x145c70940 <.text+0x5c6f940>
145c7096d:     	movq	%r11, 0xc20(%rsi)
145c70974:     	movq	%r15, 0xc38(%rsi)
145c7097b:     	movq	%rcx, 0xc28(%rsi)
145c70982:     	movq	%r10, 0xc30(%rsi)
145c70989:     	cmpq	%rdx, %r9
145c7098c:     	jbe	0x145c73fca <.text+0x5c72fca>
145c70992:     	movq	0x30(%rbp), %rcx
145c70996:     	movq	(%rcx,%rdx,8), %rdx
145c7099a:     	movq	0xe0(%rbp), %rax
145c709a1:     	testq	%rax, %rax
145c709a4:     	leaq	0x58(%rbp), %rbx
145c709a8:     	je	0x145c706c9 <.text+0x5c6f6c9>
145c709ae:     	shlq	$0x3, %rax
145c709b2:     	movl	$0x8, %r8d
145c709b8:     	movq	%rdx, %r15
145c709bb:     	movq	%rax, %rdx
145c709be:     	callq	0x1400021d0 <.text+0x11d0>
145c709c3:     	movq	%r15, %rdx
145c709c6:     	jmp	0x145c706c9 <.text+0x5c6f6c9>
145c709cb:     	movq	0xe0(%rbp), %rdx
145c709d2:     	testq	%rdx, %rdx
145c709d5:     	je	0x145c709ed <.text+0x5c6f9ed>
145c709d7:     	movq	0xe8(%rbp), %rcx
145c709de:     	shlq	$0x3, %rdx
145c709e2:     	movl	$0x8, %r8d
145c709e8:     	callq	0x1400021d0 <.text+0x11d0>
// gate-fallback-filter
145cf2080:     	pushq	%rbp
145cf2081:     	pushq	%r15
145cf2083:     	pushq	%r14
145cf2085:     	pushq	%r13
145cf2087:     	pushq	%r12
145cf2089:     	pushq	%rsi
145cf208a:     	pushq	%rdi
145cf208b:     	pushq	%rbx
145cf208c:     	subq	$0x58, %rsp
145cf2090:     	leaq	0x50(%rsp), %rbp
145cf2095:     	movq	$-0x2, (%rbp)
145cf209d:     	movq	(%rdx), %r8
145cf20a0:     	movq	0x8(%rdx), %r14
145cf20a4:     	movq	0x10(%rdx), %r15
145cf20a8:     	movl	$0x6, %eax
145cf20ad:     	movl	$0x4, %r13d
145cf20b3:     	jmp	0x145cf20e4 <.text+0x5cf10e4>
145cf20b5:     	nopw	%cs:(%rax,%rax)
145cf20c0:     	cmpl	$0x252e, %r10d          # imm = 0x252E
145cf20c7:     	movl	$0xc, %r11d
145cf20cd:     	cmoveq	%rax, %r11
145cf20d1:     	cmpl	$0x252f, %r10d          # imm = 0x252F
145cf20d8:     	cmoveq	%r13, %r11
145cf20dc:     	movq	%r12, %r8
145cf20df:     	cmpq	%r11, %r9
145cf20e2:     	jb	0x145cf2157 <.text+0x5cf1157>
145cf20e4:     	cmpq	%r14, %r8
145cf20e7:     	je	0x145cf2296 <.text+0x5cf1296>
145cf20ed:     	leaq	0x8(%r8), %r12
145cf20f1:     	movq	%r12, (%rdx)
145cf20f4:     	movq	(%r8), %rsi
145cf20f7:     	movq	0xd8(%r15), %r8
145cf20fe:     	testq	%r8, %r8
145cf2101:     	je	0x145cf2157 <.text+0x5cf1157>
145cf2103:     	movq	0xd0(%r15), %r11
145cf210a:     	movl	0x20(%rsi), %r10d
145cf210e:     	xorl	%r9d, %r9d
145cf2111:     	jmp	0x145cf212e <.text+0x5cf112e>
145cf2113:     	nopw	%cs:(%rax,%rax)
145cf2120:     	xorl	%edi, %edi
145cf2122:     	addq	%rdi, %r9
145cf2125:     	subq	$-0x80, %r11
145cf2129:     	decq	%r8
145cf212c:     	je	0x145cf20c0 <.text+0x5cf10c0>
145cf212e:     	movq	0x18(%r11), %rbx
145cf2132:     	movzbl	0x39(%rbx), %edi
145cf2136:     	addb	$-0x5, %dil
145cf213a:     	cmpb	$-0x4, %dil
145cf213e:     	jb	0x145cf2120 <.text+0x5cf1120>
145cf2140:     	cmpq	$0x0, (%r11)
145cf2144:     	movl	$0x0, %edi
145cf2149:     	je	0x145cf2122 <.text+0x5cf1122>
145cf214b:     	xorl	%edi, %edi
145cf214d:     	cmpl	%r10d, 0x20(%rbx)
145cf2151:     	sete	%dil
145cf2155:     	jmp	0x145cf2122 <.text+0x5cf1122>
145cf2157:     	movq	%rcx, -0x20(%rbp)
145cf215b:     	callq	0x140002200 <.text+0x1200>
145cf2160:     	movl	$0x20, %ecx
145cf2165:     	movl	$0x8, %edx
145cf216a:     	callq	0x1400021c0 <.text+0x11c0>
145cf216f:     	testq	%rax, %rax
145cf2172:     	je	0x145cf22c1 <.text+0x5cf12c1>
145cf2178:     	movq	%rsi, (%rax)
145cf217b:     	movq	$0x4, -0x18(%rbp)
145cf2183:     	movq	%rax, -0x10(%rbp)
145cf2187:     	movl	$0x1, %edi
145cf218c:     	movl	$0x6, %r13d
145cf2192:     	movl	$0x4, %ebx
145cf2197:     	jmp	0x145cf21ab <.text+0x5cf11ab>
145cf2199:     	nopl	(%rax)
145cf21a0:     	movq	-0x10(%rbp), %rax
145cf21a4:     	movq	%rsi, (%rax,%rdi,8)
145cf21a8:     	incq	%rdi
145cf21ab:     	movq	%rdi, -0x8(%rbp)
145cf21af:     	jmp	0x145cf21de <.text+0x5cf11de>
145cf21b1:     	nopw	%cs:(%rax,%rax)
145cf21c0:     	cmpl	$0x252e, %edx           # imm = 0x252E
145cf21c6:     	movl	$0xc, %ecx
145cf21cb:     	cmoveq	%r13, %rcx
145cf21cf:     	cmpl	$0x252f, %edx           # imm = 0x252F
145cf21d5:     	cmoveq	%rbx, %rcx
145cf21d9:     	cmpq	%rcx, %r8
145cf21dc:     	jb	0x145cf2250 <.text+0x5cf1250>
145cf21de:     	cmpq	%r14, %r12
145cf21e1:     	je	0x145cf2281 <.text+0x5cf1281>
145cf21e7:     	movq	(%r12), %rsi
145cf21eb:     	addq	$0x8, %r12
145cf21ef:     	movq	0xd8(%r15), %rcx
145cf21f6:     	testq	%rcx, %rcx
145cf21f9:     	je	0x145cf2250 <.text+0x5cf1250>
145cf21fb:     	movq	0xd0(%r15), %r9
145cf2202:     	movl	0x20(%rsi), %edx
145cf2205:     	xorl	%r8d, %r8d
145cf2208:     	jmp	0x145cf221f <.text+0x5cf121f>
145cf220a:     	nopw	(%rax,%rax)
145cf2210:     	xorl	%r10d, %r10d
145cf2213:     	addq	%r10, %r8
145cf2216:     	subq	$-0x80, %r9
145cf221a:     	decq	%rcx
145cf221d:     	je	0x145cf21c0 <.text+0x5cf11c0>
145cf221f:     	movq	0x18(%r9), %r11
145cf2223:     	movzbl	0x39(%r11), %r10d
145cf2228:     	addb	$-0x5, %r10b
145cf222c:     	cmpb	$-0x4, %r10b
145cf2230:     	jb	0x145cf2210 <.text+0x5cf1210>
145cf2232:     	cmpq	$0x0, (%r9)
145cf2236:     	movl	$0x0, %r10d
145cf223c:     	je	0x145cf2213 <.text+0x5cf1213>
145cf223e:     	xorl	%r10d, %r10d
145cf2241:     	cmpl	%edx, 0x20(%r11)
145cf2245:     	sete	%r10b
145cf2249:     	jmp	0x145cf2213 <.text+0x5cf1213>
145cf224b:     	nopl	(%rax,%rax)
145cf2250:     	cmpq	-0x18(%rbp), %rdi
145cf2254:     	jne	0x145cf21a4 <.text+0x5cf11a4>
145cf225a:     	movq	$0x8, 0x20(%rsp)
145cf2263:     	movl	$0x1, %r8d
145cf2269:     	movl	$0x8, %r9d
145cf226f:     	leaq	-0x18(%rbp), %rcx
145cf2273:     	movq	%rdi, %rdx
145cf2276:     	callq	0x146061b30 <.text+0x6060b30>
145cf227b:     	nop
145cf227c:     	jmp	0x145cf21a0 <.text+0x5cf11a0>
145cf2281:     	movq	-0x8(%rbp), %rax
145cf2285:     	movq	-0x20(%rbp), %rcx
145cf2289:     	movq	%rax, 0x10(%rcx)
145cf228d:     	movups	-0x18(%rbp), %xmm0
145cf2291:     	movups	%xmm0, (%rcx)
145cf2294:     	jmp	0x145cf22ad <.text+0x5cf12ad>
145cf2296:     	movq	$0x0, (%rcx)
145cf229d:     	movq	$0x8, 0x8(%rcx)
145cf22a5:     	movq	$0x0, 0x10(%rcx)
145cf22ad:     	movq	%rcx, %rax
145cf22b0:     	addq	$0x58, %rsp
145cf22b4:     	popq	%rbx
145cf22b5:     	popq	%rdi
145cf22b6:     	popq	%rsi
145cf22b7:     	popq	%r12
145cf22b9:     	popq	%r13
145cf22bb:     	popq	%r14
145cf22bd:     	popq	%r15
145cf22bf:     	popq	%rbp
145cf22c0:     	retq
145cf22c1:     	movl	$0x8, %ecx
145cf22c6:     	movl	$0x20, %edx
145cf22cb:     	callq	0x14620896b <.text+0x620796b>
145cf22d0:     	ud2

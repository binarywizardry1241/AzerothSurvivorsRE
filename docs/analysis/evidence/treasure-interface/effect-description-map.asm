
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455526c0:     	pushq	%rbp
1455526c1:     	pushq	%r15
1455526c3:     	pushq	%r14
1455526c5:     	pushq	%r13
1455526c7:     	pushq	%r12
1455526c9:     	pushq	%rsi
1455526ca:     	pushq	%rdi
1455526cb:     	pushq	%rbx
1455526cc:     	subq	$0x1e8, %rsp            # imm = 0x1E8
1455526d3:     	leaq	0x80(%rsp), %rbp
1455526db:     	movaps	%xmm12, 0x150(%rbp)
1455526e3:     	movaps	%xmm11, 0x140(%rbp)
1455526eb:     	movaps	%xmm10, 0x130(%rbp)
1455526f3:     	movaps	%xmm9, 0x120(%rbp)
1455526fb:     	movaps	%xmm8, 0x110(%rbp)
145552703:     	movaps	%xmm7, 0x100(%rbp)
14555270a:     	movaps	%xmm6, 0xf0(%rbp)
145552711:     	movq	$-0x2, 0xe8(%rbp)
14555271c:     	cmpq	%rdx, %rcx
14555271f:     	je	0x14555536d <.text+0x555436d>
145552725:     	subq	%rcx, %rdx
145552728:     	shrq	$0x6, %rdx
14555272c:     	leaq	0xd0(%rbp), %r10
145552733:     	movss	0x3b4d55(%rip), %xmm6   # 0x145907490
14555273b:     	movss	0x3b4dc9(%rip), %xmm7   # 0x14590750c
145552743:     	movss	0x3b4df0(%rip), %xmm8   # 0x14590753c
14555274c:     	xorps	%xmm9, %xmm9
145552750:     	movss	0x3b4dd3(%rip), %xmm10  # 0x14590752c
145552759:     	xorl	%esi, %esi
14555275b:     	movq	%r8, -0x48(%rbp)
14555275f:     	movq	%rcx, -0x50(%rbp)
145552763:     	movq	%rdx, -0x58(%rbp)
145552767:     	jmp	0x1455527c8 <.text+0x55517c8>
145552769:     	nopl	(%rax)
145552770:     	movzbl	0x8(%r13), %edx
145552775:     	movss	0x4(%r13), %xmm2
14555277b:     	leaq	0x58(%rbp), %rcx
14555277f:     	callq	0x14542af40 <.text+0x5429f40>
145552784:     	nop
145552785:     	movq	-0x48(%rbp), %r9
145552789:     	movq	0x8(%r9), %rax
14555278d:     	movq	0x10(%r9), %rcx
145552791:     	leaq	(%rax,%rax,2), %rdx
145552795:     	movq	0x68(%rbp), %r8
145552799:     	movq	%r8, 0x10(%rcx,%rdx,8)
14555279e:     	movups	0x58(%rbp), %xmm0
1455527a2:     	movups	%xmm0, (%rcx,%rdx,8)
1455527a6:     	incq	%rax
1455527a9:     	movq	%rax, 0x8(%r9)
1455527ad:     	incq	%rsi
1455527b0:     	movq	-0x58(%rbp), %rdx
1455527b4:     	cmpq	%rdx, %rsi
1455527b7:     	movq	-0x50(%rbp), %rcx
1455527bb:     	leaq	0xd0(%rbp), %r10
1455527c2:     	je	0x145555379 <.text+0x5554379>
1455527c8:     	movq	%rsi, %rax
1455527cb:     	shlq	$0x6, %rax
1455527cf:     	leaq	(%rcx,%rax), %r13
1455527d3:     	movzbl	(%rcx,%rax), %eax
1455527d7:     	subb	$0x1e, %al
1455527d9:     	movzbl	%al, %eax
1455527dc:     	movl	$0x2, %ecx
1455527e1:     	cmovbl	%ecx, %eax
1455527e4:     	testb	%al, %al
1455527e6:     	je	0x145552770 <.text+0x5551770>
1455527e8:     	movzbl	%al, %eax
1455527eb:     	cmpl	$0x1, %eax
1455527ee:     	jne	0x1455529a0 <.text+0x55519a0>
1455527f4:     	leaq	0x8(%r13), %rbx
1455527f8:     	movq	%r10, %rcx
1455527fb:     	movzbl	0x24(%r13), %edi
145552800:     	movss	0x20(%r13), %xmm11
145552806:     	movq	%rbx, %rdx
145552809:     	callq	0x14542be00 <.text+0x542ae00>
14555280e:     	nop
14555280f:     	movl	%edi, %eax
145552811:     	leaq	0x17e4e94(%rip), %rcx   # 0x146d376ac
145552818:     	movslq	(%rcx,%rax,4), %rax
14555281c:     	addq	%rcx, %rax
14555281f:     	jmpq	*%rax
145552821:     	cmpb	$0x1, (%rbx)
145552824:     	jne	0x1455530bc <.text+0x55520bc>
14555282a:     	movq	0x10(%r13), %rbx
14555282e:     	movq	0x18(%r13), %r14
145552832:     	movq	%rbx, -0x10(%rbp)
145552836:     	movq	%r14, -0x8(%rbp)
14555283a:     	movl	$0x75, %edi
14555283f:     	jmp	0x145552861 <.text+0x5551861>
145552841:     	nopw	%cs:(%rax,%rax)
145552850:     	addq	$0x78, %rdi
145552854:     	cmpq	$0x34f5, %rdi           # imm = 0x34F5
14555285b:     	je	0x14555541b <.text+0x555441b>
145552861:     	leaq	0x11e42e0(%rip), %r15   # 0x146736b48
145552868:     	cmpq	%r14, -0x6d(%rdi,%r15)
14555286d:     	jne	0x145552850 <.text+0x5551850>
14555286f:     	movq	-0x75(%rdi,%r15), %rcx
145552874:     	movq	%rbx, %rdx
145552877:     	movq	%r14, %r8
14555287a:     	callq	0x1457731e7 <.text+0x57721e7>
14555287f:     	testl	%eax, %eax
145552881:     	jne	0x145552850 <.text+0x5551850>
145552883:     	cmpb	$0x9, (%rdi,%r15)
145552888:     	jne	0x1455530bc <.text+0x55520bc>
14555288e:     	leaq	0x11e42b3(%rip), %rax   # 0x146736b48
145552895:     	movl	-0xd(%rdi,%rax), %eax
145552899:     	cmpl	$0x6, %eax
14555289c:     	je	0x145554d76 <.text+0x5553d76>
1455528a2:     	cmpl	$0x7, %eax
1455528a5:     	jne	0x1455530bc <.text+0x55520bc>
1455528ab:     	movl	$0x12, %edx
1455528b0:     	leaq	0x17e45f7(%rip), %rcx   # 0x146d36eae
1455528b7:     	callq	0x145457cb0 <.text+0x5456cb0>
1455528bc:     	nop
1455528bd:     	leaq	0xd0(%rbp), %r15
1455528c4:     	leaq	0x58(%rbp), %r12
1455528c8:     	leaq	-0x10(%rbp), %r13
1455528cc:     	leaq	0x70(%rbp), %rdi
1455528d0:     	movq	%rax, %r14
1455528d3:     	movq	%rdx, %rbx
1455528d6:     	addss	%xmm6, %xmm11
1455528db:     	sqrtss	%xmm11, %xmm0
1455528e0:     	addss	%xmm7, %xmm0
1455528e4:     	mulss	%xmm8, %xmm0
1455528e9:     	movss	%xmm0, 0x58(%rbp)
1455528ee:     	movq	%r12, 0x70(%rbp)
1455528f2:     	leaq	0x1e6df7(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1455528f9:     	movq	%rax, 0x78(%rbp)
1455528fd:     	movq	%r13, %rcx
145552900:     	leaq	0x11e7e2a(%rip), %rdx   # 0x14673a731
145552907:     	movq	%rdi, %r8
14555290a:     	callq	0x145728390 <.text+0x5727390>
14555290f:     	nop
145552910:     	testq	%r14, %r14
145552913:     	movl	$0x12, %eax
145552918:     	cmoveq	%rax, %rbx
14555291c:     	leaq	0x17e458b(%rip), %rax   # 0x146d36eae
145552923:     	cmoveq	%rax, %r14
145552927:     	leaq	0x17e42ed(%rip), %rax   # 0x146d36c1b
14555292e:     	movq	%rax, 0x70(%rbp)
145552932:     	movq	$0x3, 0x78(%rbp)
14555293a:     	movq	%r15, 0x80(%rbp)
145552941:     	leaq	0x17e3750(%rip), %rax   # 0x146d36098
145552948:     	movq	%rax, 0x88(%rbp)
14555294f:     	leaq	0x17e435f(%rip), %rcx   # 0x146d36cb5
145552956:     	movq	%rcx, 0x90(%rbp)
14555295d:     	movq	$0x1, 0x98(%rbp)
145552968:     	movq	%r13, 0xa0(%rbp)
14555296f:     	movq	%rax, 0xa8(%rbp)
145552976:     	movq	$0x2, 0x20(%rsp)
14555297f:     	movq	%r12, %rcx
145552982:     	movq	%r14, %rdx
145552985:     	movq	%rbx, %r8
145552988:     	movq	%rdi, %r9
14555298b:     	callq	0x145458060 <.text+0x5457060>
145552990:     	nop
145552991:     	jmp	0x145554820 <.text+0x5553820>
145552996:     	nopw	%cs:(%rax,%rax)
1455529a0:     	movups	(%r13), %xmm0
1455529a5:     	movups	0x10(%r13), %xmm1
1455529aa:     	movups	0x20(%r13), %xmm2
1455529af:     	movups	0x30(%r13), %xmm3
1455529b4:     	movaps	%xmm3, 0x20(%rbp)
1455529b8:     	movaps	%xmm2, 0x10(%rbp)
1455529bc:     	movaps	%xmm1, (%rbp)
1455529c0:     	movaps	%xmm0, -0x10(%rbp)
1455529c4:     	movzbl	-0x10(%rbp), %eax
1455529c8:     	addl	$-0x3, %eax
1455529cb:     	cmpl	$0x14, %eax
1455529ce:     	ja	0x145553aa9 <.text+0x5552aa9>
1455529d4:     	leaq	0x17e4c7d(%rip), %rcx   # 0x146d37658
1455529db:     	movslq	(%rcx,%rax,4), %rax
1455529df:     	addq	%rcx, %rax
1455529e2:     	jmpq	*%rax
1455529e4:     	cmpl	$0xa, (%rbp)
1455529e8:     	jne	0x145553aa9 <.text+0x5552aa9>
1455529ee:     	movss	-0xc(%rbp), %xmm11
1455529f4:     	movss	-0x8(%rbp), %xmm0
1455529f9:     	movss	%xmm0, 0x40(%rbp)
1455529fe:     	movl	$0x53, %edx
145552a03:     	leaq	0x17e45a0(%rip), %rcx   # 0x146d36faa
145552a0a:     	callq	0x145457cb0 <.text+0x5456cb0>
145552a0f:     	nop
145552a10:     	movq	%rax, %r12
145552a13:     	movq	%rdx, %rbx
145552a16:     	mulss	%xmm8, %xmm11
145552a1b:     	movss	%xmm11, 0xd0(%rbp)
145552a24:     	leaq	0xd0(%rbp), %rax
145552a2b:     	movq	%rax, 0x70(%rbp)
145552a2f:     	leaq	0x1e6cba(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145552a36:     	movq	%rax, 0x78(%rbp)
145552a3a:     	leaq	0x58(%rbp), %rcx
145552a3e:     	leaq	0x11e7cec(%rip), %rdx   # 0x14673a731
145552a45:     	leaq	0x70(%rbp), %r8
145552a49:     	callq	0x145728390 <.text+0x5727390>
145552a4e:     	nop
145552a4f:     	leaq	0x40(%rbp), %rax
145552a53:     	movq	%rax, 0xd0(%rbp)
145552a5a:     	leaq	0x1e6c8f(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145552a61:     	movq	%rax, 0xd8(%rbp)
145552a68:     	leaq	0x70(%rbp), %r14
145552a6c:     	movq	%r14, %rcx
145552a6f:     	leaq	0x17e3618(%rip), %rdx   # 0x146d3608e
145552a76:     	leaq	0xd0(%rbp), %rdi
145552a7d:     	movq	%rdi, %r8
145552a80:     	callq	0x145728390 <.text+0x5727390>
145552a85:     	nop
145552a86:     	testq	%r12, %r12
145552a89:     	movl	$0x53, %eax
145552a8e:     	cmoveq	%rax, %rbx
145552a92:     	leaq	0x17e4511(%rip), %rax   # 0x146d36faa
145552a99:     	cmoveq	%rax, %r12
145552a9d:     	movups	0x70(%rbp), %xmm0
145552aa1:     	movaps	%xmm0, 0xd0(%rbp)
145552aa8:     	movq	0x80(%rbp), %rax
145552aaf:     	movq	%rax, 0xe0(%rbp)
145552ab6:     	leaq	0x17e4540(%rip), %rax   # 0x146d36ffd
145552abd:     	movq	%rax, 0x70(%rbp)
145552ac1:     	movq	$0x4, 0x78(%rbp)
145552ac9:     	leaq	0x58(%rbp), %rax
145552acd:     	movq	%rax, 0x80(%rbp)
145552ad4:     	leaq	0x17e35bd(%rip), %rax   # 0x146d36098
145552adb:     	movq	%rax, 0x88(%rbp)
145552ae2:     	leaq	0x17e4518(%rip), %rcx   # 0x146d37001
145552ae9:     	movq	%rcx, 0x90(%rbp)
145552af0:     	movq	$0x6, 0x98(%rbp)
145552afb:     	movq	%rdi, 0xa0(%rbp)
145552b02:     	movq	%rax, 0xa8(%rbp)
145552b09:     	movq	$0x2, 0x20(%rsp)
145552b12:     	leaq	-0x30(%rbp), %rdi
145552b16:     	movq	%rdi, %rcx
145552b19:     	movq	%r12, %rdx
145552b1c:     	movq	%rbx, %r8
145552b1f:     	movq	%r14, %r9
145552b22:     	callq	0x145458060 <.text+0x5457060>
145552b27:     	nop
145552b28:     	jmp	0x145554984 <.text+0x5553984>
145552b2d:     	movl	$0x14, %edx
145552b32:     	leaq	0x17e43e3(%rip), %rcx   # 0x146d36f1c
145552b39:     	callq	0x145457cb0 <.text+0x5456cb0>
145552b3e:     	nop
145552b3f:     	leaq	0xd0(%rbp), %rdi
145552b46:     	leaq	0x58(%rbp), %r12
145552b4a:     	leaq	-0x10(%rbp), %r13
145552b4e:     	leaq	0x70(%rbp), %r15
145552b52:     	movq	%rax, %r14
145552b55:     	movq	%rdx, %rbx
145552b58:     	mulss	%xmm8, %xmm11
145552b5d:     	movss	%xmm11, 0x58(%rbp)
145552b63:     	movq	%r12, 0x70(%rbp)
145552b67:     	leaq	0x1e6b82(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145552b6e:     	movq	%rax, 0x78(%rbp)
145552b72:     	movq	%r13, %rcx
145552b75:     	leaq	0x11e7bb5(%rip), %rdx   # 0x14673a731
145552b7c:     	movq	%r15, %r8
145552b7f:     	callq	0x145728390 <.text+0x5727390>
145552b84:     	nop
145552b85:     	testq	%r14, %r14
145552b88:     	movl	$0x14, %eax
145552b8d:     	cmoveq	%rax, %rbx
145552b91:     	leaq	0x17e4384(%rip), %rax   # 0x146d36f1c
145552b98:     	cmoveq	%rax, %r14
145552b9c:     	leaq	0x17e4078(%rip), %rax   # 0x146d36c1b
145552ba3:     	movq	%rax, 0x70(%rbp)
145552ba7:     	movq	$0x3, 0x78(%rbp)
145552baf:     	movq	%rdi, 0x80(%rbp)
145552bb6:     	leaq	0x17e34db(%rip), %rax   # 0x146d36098
145552bbd:     	movq	%rax, 0x88(%rbp)
145552bc4:     	leaq	0x17e409f(%rip), %rcx   # 0x146d36c6a
145552bcb:     	movq	%rcx, 0x90(%rbp)
145552bd2:     	movq	$0x1, 0x98(%rbp)
145552bdd:     	movq	%r13, 0xa0(%rbp)
145552be4:     	movq	%rax, 0xa8(%rbp)
145552beb:     	movq	$0x2, 0x20(%rsp)
145552bf4:     	movq	%r12, %rcx
145552bf7:     	movq	%r14, %rdx
145552bfa:     	movq	%rbx, %r8
145552bfd:     	movq	%r15, %r9
145552c00:     	callq	0x145458060 <.text+0x5457060>
145552c05:     	nop
145552c06:     	jmp	0x145554820 <.text+0x5553820>
145552c0b:     	cvttss2si	%xmm11, %rax
145552c10:     	ucomiss	%xmm9, %xmm11
145552c14:     	movl	$0x0, %ecx
145552c19:     	cmovbl	%ecx, %eax
145552c1c:     	ucomiss	%xmm10, %xmm11
145552c20:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
145552c25:     	cmoval	%ecx, %eax
145552c28:     	movl	%eax, -0x10(%rbp)
145552c2b:     	cmpl	$0x1, %eax
145552c2e:     	jne	0x14555319a <.text+0x555219a>
145552c34:     	movl	$0x12, %edx
145552c39:     	leaq	0x17e42a7(%rip), %rcx   # 0x146d36ee7
145552c40:     	callq	0x145457cb0 <.text+0x5456cb0>
145552c45:     	movq	%rdx, %r8
145552c48:     	leaq	0xd0(%rbp), %rdx
145552c4f:     	leaq	0x58(%rbp), %rcx
145552c53:     	leaq	-0x10(%rbp), %r10
145552c57:     	leaq	0x70(%rbp), %r9
145552c5b:     	testq	%rax, %rax
145552c5e:     	leaq	0x17e4282(%rip), %r11   # 0x146d36ee7
145552c65:     	cmoveq	%r11, %rax
145552c69:     	movl	$0x12, %r11d
145552c6f:     	cmoveq	%r11, %r8
145552c73:     	leaq	0x17e3fa1(%rip), %r11   # 0x146d36c1b
145552c7a:     	movq	%r11, 0x70(%rbp)
145552c7e:     	movq	$0x3, 0x78(%rbp)
145552c86:     	movq	%rdx, 0x80(%rbp)
145552c8d:     	leaq	0x17e3404(%rip), %rdx   # 0x146d36098
145552c94:     	movq	%rdx, 0x88(%rbp)
145552c9b:     	leaq	0x17e3e3e(%rip), %rdx   # 0x146d36ae0
145552ca2:     	movq	%rdx, 0x90(%rbp)
145552ca9:     	movq	$0x1, 0x98(%rbp)
145552cb4:     	movq	%r10, 0xa0(%rbp)
145552cbb:     	leaq	0x17e3dfe(%rip), %rdx   # 0x146d36ac0
145552cc2:     	movq	%rdx, 0xa8(%rbp)
145552cc9:     	movq	$0x2, 0x20(%rsp)
145552cd2:     	movq	%rax, %rdx
145552cd5:     	callq	0x145458060 <.text+0x5457060>
145552cda:     	nop
145552cdb:     	jmp	0x145554838 <.text+0x5553838>
145552ce0:     	movl	$0x10, %edx
145552ce5:     	leaq	0x17e4220(%rip), %rcx   # 0x146d36f0c
145552cec:     	callq	0x145457cb0 <.text+0x5456cb0>
145552cf1:     	nop
145552cf2:     	leaq	0xd0(%rbp), %rdi
145552cf9:     	leaq	0x58(%rbp), %r12
145552cfd:     	leaq	-0x10(%rbp), %r13
145552d01:     	leaq	0x70(%rbp), %r15
145552d05:     	movq	%rax, %r14
145552d08:     	movq	%rdx, %rbx
145552d0b:     	mulss	%xmm8, %xmm11
145552d10:     	movss	%xmm11, 0x58(%rbp)
145552d16:     	movq	%r12, 0x70(%rbp)
145552d1a:     	leaq	0x1e69cf(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145552d21:     	movq	%rax, 0x78(%rbp)
145552d25:     	movq	%r13, %rcx
145552d28:     	leaq	0x11e7a02(%rip), %rdx   # 0x14673a731
145552d2f:     	movq	%r15, %r8
145552d32:     	callq	0x145728390 <.text+0x5727390>
145552d37:     	nop
145552d38:     	testq	%r14, %r14
145552d3b:     	movl	$0x10, %eax
145552d40:     	cmoveq	%rax, %rbx
145552d44:     	leaq	0x17e41c1(%rip), %rax   # 0x146d36f0c
145552d4b:     	cmoveq	%rax, %r14
145552d4f:     	leaq	0x17e3ec5(%rip), %rax   # 0x146d36c1b
145552d56:     	movq	%rax, 0x70(%rbp)
145552d5a:     	movq	$0x3, 0x78(%rbp)
145552d62:     	movq	%rdi, 0x80(%rbp)
145552d69:     	leaq	0x17e3328(%rip), %rax   # 0x146d36098
145552d70:     	movq	%rax, 0x88(%rbp)
145552d77:     	leaq	0x17e3eec(%rip), %rcx   # 0x146d36c6a
145552d7e:     	movq	%rcx, 0x90(%rbp)
145552d85:     	movq	$0x1, 0x98(%rbp)
145552d90:     	movq	%r13, 0xa0(%rbp)
145552d97:     	movq	%rax, 0xa8(%rbp)
145552d9e:     	movq	$0x2, 0x20(%rsp)
145552da7:     	movq	%r12, %rcx
145552daa:     	movq	%r14, %rdx
145552dad:     	movq	%rbx, %r8
145552db0:     	movq	%r15, %r9
145552db3:     	callq	0x145458060 <.text+0x5457060>
145552db8:     	nop
145552db9:     	jmp	0x145554820 <.text+0x5553820>
145552dbe:     	movl	$0x14, %edx
145552dc3:     	leaq	0x17e4109(%rip), %rcx   # 0x146d36ed3
145552dca:     	callq	0x145457cb0 <.text+0x5456cb0>
145552dcf:     	nop
145552dd0:     	leaq	0xd0(%rbp), %rdi
145552dd7:     	leaq	0x58(%rbp), %r12
145552ddb:     	leaq	-0x10(%rbp), %r13
145552ddf:     	leaq	0x70(%rbp), %r15
145552de3:     	movq	%rax, %r14
145552de6:     	movq	%rdx, %rbx
145552de9:     	mulss	%xmm8, %xmm11
145552dee:     	movss	%xmm11, 0x58(%rbp)
145552df4:     	movq	%r12, 0x70(%rbp)
145552df8:     	leaq	0x1e68f1(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145552dff:     	movq	%rax, 0x78(%rbp)
145552e03:     	movq	%r13, %rcx
145552e06:     	leaq	0x11e7924(%rip), %rdx   # 0x14673a731
145552e0d:     	movq	%r15, %r8
145552e10:     	callq	0x145728390 <.text+0x5727390>
145552e15:     	nop
145552e16:     	testq	%r14, %r14
145552e19:     	movl	$0x14, %eax
145552e1e:     	cmoveq	%rax, %rbx
145552e22:     	leaq	0x17e40aa(%rip), %rax   # 0x146d36ed3
145552e29:     	cmoveq	%rax, %r14
145552e2d:     	leaq	0x17e3de7(%rip), %rax   # 0x146d36c1b
145552e34:     	movq	%rax, 0x70(%rbp)
145552e38:     	movq	$0x3, 0x78(%rbp)
145552e40:     	movq	%rdi, 0x80(%rbp)
145552e47:     	leaq	0x17e324a(%rip), %rax   # 0x146d36098
145552e4e:     	movq	%rax, 0x88(%rbp)
145552e55:     	leaq	0x17e3e0e(%rip), %rcx   # 0x146d36c6a
145552e5c:     	movq	%rcx, 0x90(%rbp)
145552e63:     	movq	$0x1, 0x98(%rbp)
145552e6e:     	movq	%r13, 0xa0(%rbp)
145552e75:     	movq	%rax, 0xa8(%rbp)
145552e7c:     	movq	$0x2, 0x20(%rsp)
145552e85:     	movq	%r12, %rcx
145552e88:     	movq	%r14, %rdx
145552e8b:     	movq	%rbx, %r8
145552e8e:     	movq	%r15, %r9
145552e91:     	callq	0x145458060 <.text+0x5457060>
145552e96:     	nop
145552e97:     	jmp	0x145554820 <.text+0x5553820>
145552e9c:     	movl	$0x23, %edx
145552ea1:     	leaq	0x17e4088(%rip), %rcx   # 0x146d36f30
145552ea8:     	callq	0x145457cb0 <.text+0x5456cb0>
145552ead:     	nop
145552eae:     	leaq	0xd0(%rbp), %rdi
145552eb5:     	leaq	0x58(%rbp), %r12
145552eb9:     	leaq	-0x10(%rbp), %r13
145552ebd:     	leaq	0x70(%rbp), %r15
145552ec1:     	movq	%rax, %r14
145552ec4:     	movq	%rdx, %rbx
145552ec7:     	mulss	%xmm8, %xmm11
145552ecc:     	movss	%xmm11, 0x58(%rbp)
145552ed2:     	movq	%r12, 0x70(%rbp)
145552ed6:     	leaq	0x1e6813(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145552edd:     	movq	%rax, 0x78(%rbp)
145552ee1:     	movq	%r13, %rcx
145552ee4:     	leaq	0x11e7846(%rip), %rdx   # 0x14673a731
145552eeb:     	movq	%r15, %r8
145552eee:     	callq	0x145728390 <.text+0x5727390>
145552ef3:     	nop
145552ef4:     	testq	%r14, %r14
145552ef7:     	movl	$0x23, %eax
145552efc:     	cmoveq	%rax, %rbx
145552f00:     	leaq	0x17e4029(%rip), %rax   # 0x146d36f30
145552f07:     	cmoveq	%rax, %r14
145552f0b:     	leaq	0x17e3d09(%rip), %rax   # 0x146d36c1b
145552f12:     	movq	%rax, 0x70(%rbp)
145552f16:     	movq	$0x3, 0x78(%rbp)
145552f1e:     	movq	%rdi, 0x80(%rbp)
145552f25:     	leaq	0x17e316c(%rip), %rax   # 0x146d36098
145552f2c:     	movq	%rax, 0x88(%rbp)
145552f33:     	leaq	0x17e3d30(%rip), %rcx   # 0x146d36c6a
145552f3a:     	movq	%rcx, 0x90(%rbp)
145552f41:     	movq	$0x1, 0x98(%rbp)
145552f4c:     	movq	%r13, 0xa0(%rbp)
145552f53:     	movq	%rax, 0xa8(%rbp)
145552f5a:     	movq	$0x2, 0x20(%rsp)
145552f63:     	movq	%r12, %rcx
145552f66:     	movq	%r14, %rdx
145552f69:     	movq	%rbx, %r8
145552f6c:     	movq	%r15, %r9
145552f6f:     	callq	0x145458060 <.text+0x5457060>
145552f74:     	nop
145552f75:     	jmp	0x145554820 <.text+0x5553820>
145552f7a:     	cmpb	$0x1, (%rbx)
145552f7d:     	jne	0x145554740 <.text+0x5553740>
145552f83:     	movq	0x10(%r13), %rbx
145552f87:     	movq	0x18(%r13), %r12
145552f8b:     	movq	%rbx, -0x10(%rbp)
145552f8f:     	movq	%r12, -0x8(%rbp)
145552f93:     	xorl	%edi, %edi
145552f95:     	jmp	0x145552fb1 <.text+0x5551fb1>
145552f97:     	nopw	(%rax,%rax)
145552fa0:     	addq	$0x78, %rdi
145552fa4:     	cmpq	$0x3480, %rdi           # imm = 0x3480
145552fab:     	je	0x1455553eb <.text+0x55543eb>
145552fb1:     	leaq	0x11e3b90(%rip), %r14   # 0x146736b48
145552fb8:     	cmpq	%r12, 0x8(%rdi,%r14)
145552fbd:     	jne	0x145552fa0 <.text+0x5551fa0>
145552fbf:     	movq	(%rdi,%r14), %rcx
145552fc3:     	movq	%rbx, %rdx
145552fc6:     	movq	%r12, %r8
145552fc9:     	callq	0x1457731e7 <.text+0x57721e7>
145552fce:     	testl	%eax, %eax
145552fd0:     	jne	0x145552fa0 <.text+0x5551fa0>
145552fd2:     	cmpb	$0xb, 0x75(%rdi,%r14)
145552fd8:     	jne	0x1455545ff <.text+0x55535ff>
145552fde:     	movl	$0x15, %edx
145552fe3:     	leaq	0x17e3fab(%rip), %rcx   # 0x146d36f95
145552fea:     	callq	0x145457cb0 <.text+0x5456cb0>
145552fef:     	nop
145552ff0:     	leaq	0xd0(%rbp), %rdi
145552ff7:     	leaq	0x58(%rbp), %r12
145552ffb:     	leaq	-0x10(%rbp), %r13
145552fff:     	leaq	0x70(%rbp), %r15
145553003:     	movq	%rax, %r14
145553006:     	movq	%rdx, %rbx
145553009:     	mulss	%xmm8, %xmm11
14555300e:     	movss	%xmm11, 0x58(%rbp)
145553014:     	movq	%r12, 0x70(%rbp)
145553018:     	leaq	0x1e66d1(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
14555301f:     	movq	%rax, 0x78(%rbp)
145553023:     	movq	%r13, %rcx
145553026:     	leaq	0x11e7704(%rip), %rdx   # 0x14673a731
14555302d:     	movq	%r15, %r8
145553030:     	callq	0x145728390 <.text+0x5727390>
145553035:     	nop
145553036:     	testq	%r14, %r14
145553039:     	movl	$0x15, %eax
14555303e:     	cmoveq	%rax, %rbx
145553042:     	leaq	0x17e3f4c(%rip), %rax   # 0x146d36f95
145553049:     	cmoveq	%rax, %r14
14555304d:     	leaq	0x17e3bc7(%rip), %rax   # 0x146d36c1b
145553054:     	movq	%rax, 0x70(%rbp)
145553058:     	movq	$0x3, 0x78(%rbp)
145553060:     	movq	%rdi, 0x80(%rbp)
145553067:     	leaq	0x17e302a(%rip), %rax   # 0x146d36098
14555306e:     	movq	%rax, 0x88(%rbp)
145553075:     	leaq	0x17e3bee(%rip), %rcx   # 0x146d36c6a
14555307c:     	movq	%rcx, 0x90(%rbp)
145553083:     	movq	$0x1, 0x98(%rbp)
14555308e:     	movq	%r13, 0xa0(%rbp)
145553095:     	movq	%rax, 0xa8(%rbp)
14555309c:     	movq	$0x2, 0x20(%rsp)
1455530a5:     	movq	%r12, %rcx
1455530a8:     	movq	%r14, %rdx
1455530ab:     	movq	%rbx, %r8
1455530ae:     	movq	%r15, %r9
1455530b1:     	callq	0x145458060 <.text+0x5457060>
1455530b6:     	nop
1455530b7:     	jmp	0x145554820 <.text+0x5553820>
1455530bc:     	movl	$0x12, %edx
1455530c1:     	leaq	0x17e3dd4(%rip), %rcx   # 0x146d36e9c
1455530c8:     	callq	0x145457cb0 <.text+0x5456cb0>
1455530cd:     	nop
1455530ce:     	leaq	0xd0(%rbp), %rdi
1455530d5:     	leaq	0x58(%rbp), %r12
1455530d9:     	leaq	-0x10(%rbp), %r13
1455530dd:     	leaq	0x70(%rbp), %r15
1455530e1:     	movq	%rax, %r14
1455530e4:     	movq	%rdx, %rbx
1455530e7:     	mulss	%xmm8, %xmm11
1455530ec:     	movss	%xmm11, 0x58(%rbp)
1455530f2:     	movq	%r12, 0x70(%rbp)
1455530f6:     	leaq	0x1e65f3(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1455530fd:     	movq	%rax, 0x78(%rbp)
145553101:     	movq	%r13, %rcx
145553104:     	leaq	0x11e7626(%rip), %rdx   # 0x14673a731
14555310b:     	movq	%r15, %r8
14555310e:     	callq	0x145728390 <.text+0x5727390>
145553113:     	nop
145553114:     	testq	%r14, %r14
145553117:     	movl	$0x12, %eax
14555311c:     	cmoveq	%rax, %rbx
145553120:     	leaq	0x17e3d75(%rip), %rax   # 0x146d36e9c
145553127:     	cmoveq	%rax, %r14
14555312b:     	leaq	0x17e3ae9(%rip), %rax   # 0x146d36c1b
145553132:     	movq	%rax, 0x70(%rbp)
145553136:     	movq	$0x3, 0x78(%rbp)
14555313e:     	movq	%rdi, 0x80(%rbp)
145553145:     	leaq	0x17e2f4c(%rip), %rax   # 0x146d36098
14555314c:     	movq	%rax, 0x88(%rbp)
145553153:     	leaq	0x17e3b10(%rip), %rcx   # 0x146d36c6a
14555315a:     	movq	%rcx, 0x90(%rbp)
145553161:     	movq	$0x1, 0x98(%rbp)
14555316c:     	movq	%r13, 0xa0(%rbp)
145553173:     	movq	%rax, 0xa8(%rbp)
14555317a:     	movq	$0x2, 0x20(%rsp)
145553183:     	movq	%r12, %rcx
145553186:     	movq	%r14, %rdx
145553189:     	movq	%rbx, %r8
14555318c:     	movq	%r15, %r9
14555318f:     	callq	0x145458060 <.text+0x5457060>
145553194:     	nop
145553195:     	jmp	0x145554820 <.text+0x5553820>
14555319a:     	movl	$0x13, %edx
14555319f:     	leaq	0x17e3d53(%rip), %rcx   # 0x146d36ef9
1455531a6:     	callq	0x145457cb0 <.text+0x5456cb0>
1455531ab:     	movq	%rdx, %r8
1455531ae:     	leaq	0xd0(%rbp), %rdx
1455531b5:     	leaq	0x58(%rbp), %rcx
1455531b9:     	leaq	-0x10(%rbp), %r10
1455531bd:     	leaq	0x70(%rbp), %r11
1455531c1:     	testq	%rax, %rax
1455531c4:     	leaq	0x17e3d2e(%rip), %r9    # 0x146d36ef9
1455531cb:     	cmoveq	%r9, %rax
1455531cf:     	movl	$0x13, %r9d
1455531d5:     	cmoveq	%r9, %r8
1455531d9:     	leaq	0x17e3a3b(%rip), %r9    # 0x146d36c1b
1455531e0:     	movq	%r9, 0x70(%rbp)
1455531e4:     	movq	$0x3, 0x78(%rbp)
1455531ec:     	movq	%rdx, 0x80(%rbp)
1455531f3:     	leaq	0x17e2e9e(%rip), %rdx   # 0x146d36098
1455531fa:     	movq	%rdx, 0x88(%rbp)
145553201:     	leaq	0x17e38d8(%rip), %rdx   # 0x146d36ae0
145553208:     	movq	%rdx, 0x90(%rbp)
14555320f:     	movq	$0x1, 0x98(%rbp)
14555321a:     	movq	%r10, 0xa0(%rbp)
145553221:     	leaq	0x17e3898(%rip), %rdx   # 0x146d36ac0
145553228:     	movq	%rdx, 0xa8(%rbp)
14555322f:     	movq	$0x2, 0x20(%rsp)
145553238:     	movq	%rax, %rdx
14555323b:     	movq	%r11, %r9
14555323e:     	callq	0x145458060 <.text+0x5457060>
145553243:     	nop
145553244:     	jmp	0x145554838 <.text+0x5553838>
145553249:     	movss	-0xc(%rbp), %xmm0
14555324e:     	movss	-0x8(%rbp), %xmm11
145553254:     	movss	%xmm0, 0x40(%rbp)
145553259:     	movl	$0x47, %edx
14555325e:     	leaq	0x17e4186(%rip), %rcx   # 0x146d373eb
145553265:     	callq	0x145457cb0 <.text+0x5456cb0>
14555326a:     	nop
14555326b:     	movq	%rax, %r12
14555326e:     	movq	%rdx, %rbx
145553271:     	mulss	%xmm8, %xmm11
145553276:     	movss	%xmm11, 0xd0(%rbp)
14555327f:     	leaq	0xd0(%rbp), %rax
145553286:     	movq	%rax, 0x70(%rbp)
14555328a:     	leaq	0x1e645f(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145553291:     	movq	%rax, 0x78(%rbp)
145553295:     	leaq	0x58(%rbp), %rcx
145553299:     	leaq	0x11e7491(%rip), %rdx   # 0x14673a731
1455532a0:     	leaq	0x70(%rbp), %r8
1455532a4:     	callq	0x145728390 <.text+0x5727390>
1455532a9:     	nop
1455532aa:     	leaq	0x40(%rbp), %rax
1455532ae:     	movq	%rax, 0xd0(%rbp)
1455532b5:     	leaq	0x1e6434(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1455532bc:     	movq	%rax, 0xd8(%rbp)
1455532c3:     	leaq	0x70(%rbp), %r14
1455532c7:     	movq	%r14, %rcx
1455532ca:     	leaq	0x17e2dbd(%rip), %rdx   # 0x146d3608e
1455532d1:     	leaq	0xd0(%rbp), %rdi
1455532d8:     	movq	%rdi, %r8
1455532db:     	callq	0x145728390 <.text+0x5727390>
1455532e0:     	nop
1455532e1:     	testq	%r12, %r12
1455532e4:     	movl	$0x47, %eax
1455532e9:     	cmoveq	%rax, %rbx
1455532ed:     	leaq	0x17e40f7(%rip), %rax   # 0x146d373eb
1455532f4:     	cmoveq	%rax, %r12
1455532f8:     	movups	0x70(%rbp), %xmm0
1455532fc:     	movaps	%xmm0, 0xd0(%rbp)
145553303:     	movq	0x80(%rbp), %rax
14555330a:     	movq	%rax, 0xe0(%rbp)
145553311:     	leaq	0x17e411a(%rip), %rax   # 0x146d37432
145553318:     	movq	%rax, 0x70(%rbp)
14555331c:     	movq	$0x4, 0x78(%rbp)
145553324:     	leaq	0x58(%rbp), %rax
145553328:     	movq	%rax, 0x80(%rbp)
14555332f:     	leaq	0x17e2d62(%rip), %rax   # 0x146d36098
145553336:     	movq	%rax, 0x88(%rbp)
14555333d:     	leaq	0x17e40f2(%rip), %rcx   # 0x146d37436
145553344:     	movq	%rcx, 0x90(%rbp)
14555334b:     	movq	$0x2, 0x98(%rbp)
145553356:     	movq	%rdi, 0xa0(%rbp)
14555335d:     	movq	%rax, 0xa8(%rbp)
145553364:     	movq	$0x2, 0x20(%rsp)
14555336d:     	leaq	-0x30(%rbp), %rdi
145553371:     	movq	%rdi, %rcx
145553374:     	movq	%r12, %rdx
145553377:     	movq	%rbx, %r8
14555337a:     	movq	%r14, %r9
14555337d:     	callq	0x145458060 <.text+0x5457060>
145553382:     	nop
145553383:     	jmp	0x145554984 <.text+0x5553984>
145553388:     	movl	-0xc(%rbp), %eax
14555338b:     	movl	%eax, 0x58(%rbp)
14555338e:     	movl	$0x2f, %edx
145553393:     	leaq	0x17e3fab(%rip), %rcx   # 0x146d37345
14555339a:     	callq	0x145457cb0 <.text+0x5456cb0>
14555339f:     	nop
1455533a0:     	movq	%rax, %r14
1455533a3:     	movq	%rdx, %rbx
1455533a6:     	addq	$0x8, %r13
1455533aa:     	leaq	0xd0(%rbp), %rcx
1455533b1:     	movq	%r13, %rdx
1455533b4:     	callq	0x14542be00 <.text+0x542ae00>
1455533b9:     	nop
1455533ba:     	testq	%r14, %r14
1455533bd:     	movl	$0x2f, %eax
1455533c2:     	cmoveq	%rax, %rbx
1455533c6:     	leaq	0x17e3f78(%rip), %rax   # 0x146d37345
1455533cd:     	cmoveq	%rax, %r14
1455533d1:     	leaq	0x17e3843(%rip), %rax   # 0x146d36c1b
1455533d8:     	movq	%rax, 0x70(%rbp)
1455533dc:     	movq	$0x3, 0x78(%rbp)
1455533e4:     	leaq	0xd0(%rbp), %rax
1455533eb:     	movq	%rax, 0x80(%rbp)
1455533f2:     	leaq	0x17e2c9f(%rip), %rax   # 0x146d36098
1455533f9:     	movq	%rax, 0x88(%rbp)
145553400:     	leaq	0x17e36d9(%rip), %rax   # 0x146d36ae0
145553407:     	movq	%rax, 0x90(%rbp)
14555340e:     	movq	$0x1, 0x98(%rbp)
145553419:     	leaq	0x58(%rbp), %rax
14555341d:     	movq	%rax, 0xa0(%rbp)
145553424:     	leaq	0x17e3695(%rip), %rax   # 0x146d36ac0
14555342b:     	movq	%rax, 0xa8(%rbp)
145553432:     	movq	$0x2, 0x20(%rsp)
14555343b:     	leaq	-0x30(%rbp), %rdi
14555343f:     	movq	%rdi, %rcx
145553442:     	movq	%r14, %rdx
145553445:     	movq	%rbx, %r8
145553448:     	leaq	0x70(%rbp), %r9
14555344c:     	callq	0x145458060 <.text+0x5457060>
145553451:     	nop
145553452:     	jmp	0x14555532b <.text+0x555432b>
145553457:     	movl	(%rbp), %eax
14555345a:     	cmpl	$0x1, %eax
14555345d:     	je	0x145553468 <.text+0x5552468>
14555345f:     	cmpl	$0x7, %eax
145553462:     	jne	0x145553aa9 <.text+0x5552aa9>
145553468:     	cmpb	$0x1, 0x8(%rbp)
14555346c:     	jne	0x145553aa9 <.text+0x5552aa9>
145553472:     	movq	0x10(%rbp), %rbx
145553476:     	movq	0x18(%rbp), %r14
14555347a:     	movss	-0xc(%rbp), %xmm11
145553480:     	movl	$0x36, %edx
145553485:     	leaq	0x17e3f29(%rip), %rcx   # 0x146d373b5
14555348c:     	callq	0x145457cb0 <.text+0x5456cb0>
145553491:     	nop
145553492:     	movq	%rax, %r12
145553495:     	movq	%rdx, %r13
145553498:     	testq	%rax, %rax
14555349b:     	leaq	0x17e3f13(%rip), %rax   # 0x146d373b5
1455534a2:     	cmoveq	%rax, %r12
1455534a6:     	movl	$0x36, %eax
1455534ab:     	cmoveq	%rax, %r13
1455534af:     	movq	%rbx, 0xd0(%rbp)
1455534b6:     	movq	%r14, 0xd8(%rbp)
1455534bd:     	xorl	%edi, %edi
1455534bf:     	jmp	0x1455534e1 <.text+0x55524e1>
1455534c1:     	nopw	%cs:(%rax,%rax)
1455534d0:     	addq	$0x78, %rdi
1455534d4:     	cmpq	$0x3480, %rdi           # imm = 0x3480
1455534db:     	je	0x1455554e1 <.text+0x55544e1>
1455534e1:     	leaq	0x11e3660(%rip), %r15   # 0x146736b48
1455534e8:     	cmpq	%r14, 0x8(%rdi,%r15)
1455534ed:     	jne	0x1455534d0 <.text+0x55524d0>
1455534ef:     	movq	(%rdi,%r15), %rcx
1455534f3:     	movq	%rbx, %rdx
1455534f6:     	movq	%r14, %r8
1455534f9:     	callq	0x1457731e7 <.text+0x57721e7>
1455534fe:     	testl	%eax, %eax
145553500:     	jne	0x1455534d0 <.text+0x55524d0>
145553502:     	leaq	(%r15,%rdi), %rax
145553506:     	movq	%rax, 0xd0(%rbp)
14555350d:     	leaq	-0x5551454(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145553514:     	movq	%rax, 0xd8(%rbp)
14555351b:     	leaq	0x70(%rbp), %rcx
14555351f:     	leaq	0x11d83e1(%rip), %rdx   # 0x14672b907
145553526:     	leaq	0xd0(%rbp), %r8
14555352d:     	callq	0x145728390 <.text+0x5727390>
145553532:     	nop
145553533:     	movq	%r13, %r15
145553536:     	movq	0x78(%rbp), %rcx
14555353a:     	movq	0x80(%rbp), %rdx
145553541:     	leaq	0x11e3600(%rip), %rax   # 0x146736b48
145553548:     	movq	0x10(%rdi,%rax), %r13
14555354d:     	movq	0x18(%rdi,%rax), %rdi
145553552:     	movq	%rcx, -0x18(%rbp)
145553556:     	callq	0x145457cb0 <.text+0x5456cb0>
14555355b:     	nop
14555355c:     	movq	%rax, %r14
14555355f:     	movq	%rdx, %rbx
145553562:     	movq	0x70(%rbp), %rdx
145553566:     	testq	%rdx, %rdx
145553569:     	je	0x14555357a <.text+0x555257a>
14555356b:     	movl	$0x1, %r8d
145553571:     	movq	-0x18(%rbp), %rcx
145553575:     	callq	0x1400021d0 <.text+0x11d0>
14555357a:     	testq	%r14, %r14
14555357d:     	cmovneq	%r14, %r13
145553581:     	cmoveq	%rdi, %rbx
145553585:     	movq	%r13, 0x58(%rbp)
145553589:     	movq	%rbx, 0x60(%rbp)
14555358d:     	mulss	%xmm8, %xmm11
145553592:     	movss	%xmm11, 0x40(%rbp)
145553598:     	leaq	0x40(%rbp), %rax
14555359c:     	movq	%rax, 0x70(%rbp)
1455535a0:     	leaq	0x1e6149(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1455535a7:     	movq	%rax, 0x78(%rbp)
1455535ab:     	leaq	0xd0(%rbp), %rcx
1455535b2:     	leaq	0x11e7178(%rip), %rdx   # 0x14673a731
1455535b9:     	leaq	0x70(%rbp), %r8
1455535bd:     	callq	0x145728390 <.text+0x5727390>
1455535c2:     	nop
1455535c3:     	movq	%r15, %r8
1455535c6:     	leaq	0x17e3c73(%rip), %rax   # 0x146d37240
1455535cd:     	movq	%rax, 0x70(%rbp)
1455535d1:     	movq	$0x5, 0x78(%rbp)
1455535d9:     	leaq	0x58(%rbp), %rax
1455535dd:     	movq	%rax, 0x80(%rbp)
1455535e4:     	leaq	0x17e3c35(%rip), %rax   # 0x146d37220
1455535eb:     	movq	%rax, 0x88(%rbp)
1455535f2:     	leaq	0x17e3a04(%rip), %rax   # 0x146d36ffd
1455535f9:     	movq	%rax, 0x90(%rbp)
145553600:     	movq	$0x4, 0x98(%rbp)
14555360b:     	leaq	0xd0(%rbp), %rax
145553612:     	movq	%rax, 0xa0(%rbp)
145553619:     	leaq	0x17e2a78(%rip), %rax   # 0x146d36098
145553620:     	movq	%rax, 0xa8(%rbp)
145553627:     	movq	$0x2, 0x20(%rsp)
145553630:     	leaq	-0x30(%rbp), %rdi
145553634:     	movq	%rdi, %rcx
145553637:     	movq	%r12, %rdx
14555363a:     	leaq	0x70(%rbp), %r9
14555363e:     	callq	0x145458060 <.text+0x5457060>
145553643:     	nop
145553644:     	jmp	0x14555532b <.text+0x555432b>
145553649:     	movl	-0xc(%rbp), %eax
14555364c:     	addq	$0x10, %r13
145553650:     	cmpl	$0x1, %eax
145553653:     	jne	0x14555485f <.text+0x555385f>
145553659:     	movss	-0x8(%rbp), %xmm11
14555365f:     	movl	$0x26, %edx
145553664:     	leaq	0x17e39d2(%rip), %rcx   # 0x146d3703d
14555366b:     	callq	0x145457cb0 <.text+0x5456cb0>
145553670:     	nop
145553671:     	movq	%rax, %r12
145553674:     	movq	%rdx, %rbx
145553677:     	leaq	0x58(%rbp), %rcx
14555367b:     	movq	%r13, %rdx
14555367e:     	callq	0x14542bff0 <.text+0x542aff0>
145553683:     	nop
145553684:     	mulss	%xmm8, %xmm11
145553689:     	movss	%xmm11, 0x40(%rbp)
14555368f:     	leaq	0x40(%rbp), %rax
145553693:     	movq	%rax, 0x70(%rbp)
145553697:     	leaq	0x1e6052(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
14555369e:     	movq	%rax, 0x78(%rbp)
1455536a2:     	leaq	0xd0(%rbp), %rdi
1455536a9:     	movq	%rdi, %rcx
1455536ac:     	leaq	0x11e707e(%rip), %rdx   # 0x14673a731
1455536b3:     	leaq	0x70(%rbp), %r14
1455536b7:     	movq	%r14, %r8
1455536ba:     	callq	0x145728390 <.text+0x5727390>
1455536bf:     	nop
1455536c0:     	testq	%r12, %r12
1455536c3:     	movl	$0x26, %eax
1455536c8:     	cmoveq	%rax, %rbx
1455536cc:     	leaq	0x17e396a(%rip), %rax   # 0x146d3703d
1455536d3:     	cmoveq	%rax, %r12
1455536d7:     	leaq	0x17e395b(%rip), %rax   # 0x146d37039
1455536de:     	movq	%rax, 0x70(%rbp)
1455536e2:     	movq	$0x4, 0x78(%rbp)
1455536ea:     	leaq	0x58(%rbp), %rax
1455536ee:     	movq	%rax, 0x80(%rbp)
1455536f5:     	leaq	0x17e299c(%rip), %rax   # 0x146d36098
1455536fc:     	movq	%rax, 0x88(%rbp)
145553703:     	leaq	0x17e38f3(%rip), %rcx   # 0x146d36ffd
14555370a:     	movq	%rcx, 0x90(%rbp)
145553711:     	movq	$0x4, 0x98(%rbp)
14555371c:     	movq	%rdi, 0xa0(%rbp)
145553723:     	movq	%rax, 0xa8(%rbp)
14555372a:     	movq	$0x2, 0x20(%rsp)
145553733:     	leaq	-0x30(%rbp), %rdi
145553737:     	movq	%rdi, %rcx
14555373a:     	movq	%r12, %rdx
14555373d:     	movq	%rbx, %r8
145553740:     	movq	%r14, %r9
145553743:     	callq	0x145458060 <.text+0x5457060>
145553748:     	nop
145553749:     	jmp	0x145554984 <.text+0x5553984>
14555374e:     	movss	-0x8(%rbp), %xmm11
145553754:     	movss	-0x4(%rbp), %xmm0
145553759:     	movss	%xmm0, 0x3c(%rbp)
14555375e:     	movl	$0x34, %edx
145553763:     	leaq	0x17e3a15(%rip), %rcx   # 0x146d3717f
14555376a:     	callq	0x145457cb0 <.text+0x5456cb0>
14555376f:     	nop
145553770:     	movq	%rax, %rbx
145553773:     	movq	%rdx, %r12
145553776:     	addq	$0x10, %r13
14555377a:     	testq	%rax, %rax
14555377d:     	leaq	0x17e39fb(%rip), %rax   # 0x146d3717f
145553784:     	cmoveq	%rax, %rbx
145553788:     	movl	$0x34, %eax
14555378d:     	cmoveq	%rax, %r12
145553791:     	leaq	0x40(%rbp), %rcx
145553795:     	movq	%r13, %rdx
145553798:     	callq	0x14542bff0 <.text+0x542aff0>
14555379d:     	nop
14555379e:     	mulss	%xmm8, %xmm11
1455537a3:     	movss	%xmm11, 0xd0(%rbp)
1455537ac:     	leaq	0xd0(%rbp), %rdi
1455537b3:     	movq	%rdi, 0x70(%rbp)
1455537b7:     	leaq	0x1e5f32(%rip), %r13    # 0x1457396f0 <.text+0x57386f0>
1455537be:     	movq	%r13, 0x78(%rbp)
1455537c2:     	leaq	0x58(%rbp), %r15
1455537c6:     	movq	%r15, %rcx
1455537c9:     	leaq	0x11e6f61(%rip), %rdx   # 0x14673a731
1455537d0:     	leaq	0x70(%rbp), %r14
1455537d4:     	movq	%r14, %r8
1455537d7:     	callq	0x145728390 <.text+0x5727390>
1455537dc:     	nop
1455537dd:     	leaq	0x3c(%rbp), %rax
1455537e1:     	movq	%rax, 0xd0(%rbp)
1455537e8:     	movq	%r13, 0xd8(%rbp)
1455537ef:     	movq	%r14, %rcx
1455537f2:     	leaq	0x17e2895(%rip), %rdx   # 0x146d3608e
1455537f9:     	movq	%rdi, %r8
1455537fc:     	callq	0x145728390 <.text+0x5727390>
145553801:     	nop
145553802:     	movups	0x70(%rbp), %xmm0
145553806:     	movaps	%xmm0, 0xd0(%rbp)
14555380d:     	movq	0x80(%rbp), %rax
145553814:     	movq	%rax, 0xe0(%rbp)
14555381b:     	leaq	0x17e3817(%rip), %rax   # 0x146d37039
145553822:     	movq	%rax, 0x70(%rbp)
145553826:     	movq	$0x4, 0x78(%rbp)
14555382e:     	leaq	0x40(%rbp), %rax
145553832:     	movq	%rax, 0x80(%rbp)
145553839:     	leaq	0x17e2858(%rip), %rax   # 0x146d36098
145553840:     	movq	%rax, 0x88(%rbp)
145553847:     	leaq	0x17e37af(%rip), %rcx   # 0x146d36ffd
14555384e:     	movq	%rcx, 0x90(%rbp)
145553855:     	movq	$0x4, 0x98(%rbp)
145553860:     	movq	%r15, 0xa0(%rbp)
145553867:     	movq	%rax, 0xa8(%rbp)
14555386e:     	leaq	0x17e393e(%rip), %rcx   # 0x146d371b3
145553875:     	movq	%rcx, 0xb0(%rbp)
14555387c:     	movq	$0x3, 0xb8(%rbp)
145553887:     	movq	%rdi, 0xc0(%rbp)
14555388e:     	movq	%rax, 0xc8(%rbp)
145553895:     	movq	$0x3, 0x20(%rsp)
14555389e:     	leaq	-0x30(%rbp), %rdi
1455538a2:     	movq	%rdi, %rcx
1455538a5:     	movq	%rbx, %rdx
1455538a8:     	movq	%r12, %r8
1455538ab:     	movq	%r14, %r9
1455538ae:     	callq	0x145458060 <.text+0x5457060>
1455538b3:     	nop
1455538b4:     	jmp	0x145554189 <.text+0x5553189>
1455538b9:     	cmpl	$0x7, (%rbp)
1455538bd:     	jne	0x145553aa9 <.text+0x5552aa9>
1455538c3:     	cmpb	$0xe, -0xf(%rbp)
1455538c7:     	jne	0x145553aa9 <.text+0x5552aa9>
1455538cd:     	cmpb	$0x1, 0x8(%rbp)
1455538d1:     	jne	0x145553aa9 <.text+0x5552aa9>
1455538d7:     	movq	0x10(%rbp), %rbx
1455538db:     	movq	0x18(%rbp), %r14
1455538df:     	movss	-0xc(%rbp), %xmm11
1455538e5:     	movl	$0x41, %edx
1455538ea:     	leaq	0x17e3a83(%rip), %rcx   # 0x146d37374
1455538f1:     	callq	0x145457cb0 <.text+0x5456cb0>
1455538f6:     	nop
1455538f7:     	movq	%rax, %r12
1455538fa:     	movq	%rdx, %r13
1455538fd:     	testq	%rax, %rax
145553900:     	leaq	0x17e3a6d(%rip), %rax   # 0x146d37374
145553907:     	cmoveq	%rax, %r12
14555390b:     	movl	$0x41, %eax
145553910:     	cmoveq	%rax, %r13
145553914:     	movq	%rbx, 0xd0(%rbp)
14555391b:     	movq	%r14, 0xd8(%rbp)
145553922:     	xorl	%edi, %edi
145553924:     	jmp	0x145553941 <.text+0x5552941>
145553926:     	nopw	%cs:(%rax,%rax)
145553930:     	addq	$0x78, %rdi
145553934:     	cmpq	$0x3480, %rdi           # imm = 0x3480
14555393b:     	je	0x1455554ae <.text+0x55544ae>
145553941:     	leaq	0x11e3200(%rip), %r15   # 0x146736b48
145553948:     	cmpq	%r14, 0x8(%rdi,%r15)
14555394d:     	jne	0x145553930 <.text+0x5552930>
14555394f:     	movq	(%rdi,%r15), %rcx
145553953:     	movq	%rbx, %rdx
145553956:     	movq	%r14, %r8
145553959:     	callq	0x1457731e7 <.text+0x57721e7>
14555395e:     	testl	%eax, %eax
145553960:     	jne	0x145553930 <.text+0x5552930>
145553962:     	leaq	(%r15,%rdi), %rax
145553966:     	movq	%rax, 0xd0(%rbp)
14555396d:     	leaq	-0x55518b4(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145553974:     	movq	%rax, 0xd8(%rbp)
14555397b:     	leaq	0x70(%rbp), %rcx
14555397f:     	leaq	0x11d7f81(%rip), %rdx   # 0x14672b907
145553986:     	leaq	0xd0(%rbp), %r8
14555398d:     	callq	0x145728390 <.text+0x5727390>
145553992:     	nop
145553993:     	movq	%r13, %r15
145553996:     	movq	0x78(%rbp), %rcx
14555399a:     	movq	0x80(%rbp), %rdx
1455539a1:     	leaq	0x11e31a0(%rip), %rax   # 0x146736b48
1455539a8:     	movq	0x10(%rdi,%rax), %r13
1455539ad:     	movq	0x18(%rdi,%rax), %rdi
1455539b2:     	movq	%rcx, -0x18(%rbp)
1455539b6:     	callq	0x145457cb0 <.text+0x5456cb0>
1455539bb:     	nop
1455539bc:     	movq	%rax, %r14
1455539bf:     	movq	%rdx, %rbx
1455539c2:     	movq	0x70(%rbp), %rdx
1455539c6:     	testq	%rdx, %rdx
1455539c9:     	je	0x1455539da <.text+0x55529da>
1455539cb:     	movl	$0x1, %r8d
1455539d1:     	movq	-0x18(%rbp), %rcx
1455539d5:     	callq	0x1400021d0 <.text+0x11d0>
1455539da:     	testq	%r14, %r14
1455539dd:     	cmovneq	%r14, %r13
1455539e1:     	cmoveq	%rdi, %rbx
1455539e5:     	movq	%r13, 0x58(%rbp)
1455539e9:     	movq	%rbx, 0x60(%rbp)
1455539ed:     	mulss	%xmm8, %xmm11
1455539f2:     	movss	%xmm11, 0x40(%rbp)
1455539f8:     	leaq	0x40(%rbp), %rax
1455539fc:     	movq	%rax, 0x70(%rbp)
145553a00:     	leaq	0x1e5ce9(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145553a07:     	movq	%rax, 0x78(%rbp)
145553a0b:     	leaq	0xd0(%rbp), %rcx
145553a12:     	leaq	0x11e6d18(%rip), %rdx   # 0x14673a731
145553a19:     	leaq	0x70(%rbp), %r8
145553a1d:     	callq	0x145728390 <.text+0x5727390>
145553a22:     	nop
145553a23:     	movq	%r15, %r8
145553a26:     	leaq	0x17e3813(%rip), %rax   # 0x146d37240
145553a2d:     	movq	%rax, 0x70(%rbp)
145553a31:     	movq	$0x5, 0x78(%rbp)
145553a39:     	leaq	0x58(%rbp), %rax
145553a3d:     	movq	%rax, 0x80(%rbp)
145553a44:     	leaq	0x17e37d5(%rip), %rax   # 0x146d37220
145553a4b:     	movq	%rax, 0x88(%rbp)
145553a52:     	leaq	0x17e265f(%rip), %rax   # 0x146d360b8
145553a59:     	movq	%rax, 0x90(%rbp)
145553a60:     	movq	$0x1, 0x98(%rbp)
145553a6b:     	leaq	0xd0(%rbp), %rax
145553a72:     	movq	%rax, 0xa0(%rbp)
145553a79:     	leaq	0x17e2618(%rip), %rax   # 0x146d36098
145553a80:     	movq	%rax, 0xa8(%rbp)
145553a87:     	movq	$0x2, 0x20(%rsp)
145553a90:     	leaq	-0x30(%rbp), %rdi
145553a94:     	movq	%rdi, %rcx
145553a97:     	movq	%r12, %rdx
145553a9a:     	leaq	0x70(%rbp), %r9
145553a9e:     	callq	0x145458060 <.text+0x5457060>
145553aa3:     	nop
145553aa4:     	jmp	0x14555532b <.text+0x555432b>
145553aa9:     	movl	$0xe, %edx
145553aae:     	leaq	0x17e39d3(%rip), %rcx   # 0x146d37488
145553ab5:     	callq	0x145457cb0 <.text+0x5456cb0>
145553aba:     	nop
145553abb:     	movq	%rdx, %rbx
145553abe:     	testq	%rax, %rax
145553ac1:     	leaq	0x17e39c0(%rip), %rcx   # 0x146d37488
145553ac8:     	cmoveq	%rcx, %rax
145553acc:     	movl	$0xe, %ecx
145553ad1:     	cmoveq	%rcx, %rbx
145553ad5:     	testq	%rbx, %rbx
145553ad8:     	js	0x1455553c9 <.text+0x55543c9>
145553ade:     	je	0x145554b9f <.text+0x5553b9f>
145553ae4:     	movq	%rax, %r14
145553ae7:     	callq	0x140002200 <.text+0x1200>
145553aec:     	movl	$0x1, %edx
145553af1:     	movq	%rbx, %rcx
145553af4:     	callq	0x1400021c0 <.text+0x11c0>
145553af9:     	testq	%rax, %rax
145553afc:     	je	0x145555571 <.text+0x5554571>
145553b02:     	movq	%rax, %rdi
145553b05:     	movq	%rax, %rcx
145553b08:     	movq	%r14, %rdx
145553b0b:     	movq	%rbx, %r8
145553b0e:     	callq	0x1457731ed <.text+0x57721ed>
145553b13:     	movq	%rdi, %rax
145553b16:     	jmp	0x145554ba4 <.text+0x5553ba4>
145553b1b:     	movss	-0xc(%rbp), %xmm11
145553b21:     	movss	-0x8(%rbp), %xmm0
145553b26:     	movss	%xmm0, 0x3c(%rbp)
145553b2b:     	movl	$0x32, %edx
145553b30:     	leaq	0x17e34d0(%rip), %rcx   # 0x146d37007
145553b37:     	callq	0x145457cb0 <.text+0x5456cb0>
145553b3c:     	nop
145553b3d:     	movq	%rax, %rbx
145553b40:     	movq	%rdx, %r12
145553b43:     	addq	$0x18, %r13
145553b47:     	testq	%rax, %rax
145553b4a:     	leaq	0x17e34b6(%rip), %rax   # 0x146d37007
145553b51:     	cmoveq	%rax, %rbx
145553b55:     	movl	$0x32, %eax
145553b5a:     	cmoveq	%rax, %r12
145553b5e:     	leaq	0x40(%rbp), %rcx
145553b62:     	movq	%r13, %rdx
145553b65:     	callq	0x14542bff0 <.text+0x542aff0>
145553b6a:     	nop
145553b6b:     	mulss	%xmm8, %xmm11
145553b70:     	movss	%xmm11, 0xd0(%rbp)
145553b79:     	leaq	0xd0(%rbp), %rdi
145553b80:     	movq	%rdi, 0x70(%rbp)
145553b84:     	leaq	0x1e5b65(%rip), %r13    # 0x1457396f0 <.text+0x57386f0>
145553b8b:     	movq	%r13, 0x78(%rbp)
145553b8f:     	leaq	0x58(%rbp), %r15
145553b93:     	movq	%r15, %rcx
145553b96:     	leaq	0x11e6b94(%rip), %rdx   # 0x14673a731
145553b9d:     	leaq	0x70(%rbp), %r14
145553ba1:     	movq	%r14, %r8
145553ba4:     	callq	0x145728390 <.text+0x5727390>
145553ba9:     	nop
145553baa:     	leaq	0x3c(%rbp), %rax
145553bae:     	movq	%rax, 0xd0(%rbp)
145553bb5:     	movq	%r13, 0xd8(%rbp)
145553bbc:     	movq	%r14, %rcx
145553bbf:     	leaq	0x17e24c8(%rip), %rdx   # 0x146d3608e
145553bc6:     	movq	%rdi, %r8
145553bc9:     	callq	0x145728390 <.text+0x5727390>
145553bce:     	nop
145553bcf:     	movups	0x70(%rbp), %xmm0
145553bd3:     	movaps	%xmm0, 0xd0(%rbp)
145553bda:     	movq	0x80(%rbp), %rax
145553be1:     	movq	%rax, 0xe0(%rbp)
145553be8:     	leaq	0x17e344a(%rip), %rax   # 0x146d37039
145553bef:     	movq	%rax, 0x70(%rbp)
145553bf3:     	movq	$0x4, 0x78(%rbp)
145553bfb:     	leaq	0x40(%rbp), %rax
145553bff:     	movq	%rax, 0x80(%rbp)
145553c06:     	leaq	0x17e248b(%rip), %rax   # 0x146d36098
145553c0d:     	movq	%rax, 0x88(%rbp)
145553c14:     	leaq	0x17e33e2(%rip), %rcx   # 0x146d36ffd
145553c1b:     	movq	%rcx, 0x90(%rbp)
145553c22:     	movq	$0x4, 0x98(%rbp)
145553c2d:     	movq	%r15, 0xa0(%rbp)
145553c34:     	movq	%rax, 0xa8(%rbp)
145553c3b:     	leaq	0x17e33bf(%rip), %rcx   # 0x146d37001
145553c42:     	movq	%rcx, 0xb0(%rbp)
145553c49:     	movq	$0x6, 0xb8(%rbp)
145553c54:     	movq	%rdi, 0xc0(%rbp)
145553c5b:     	movq	%rax, 0xc8(%rbp)
145553c62:     	movq	$0x3, 0x20(%rsp)
145553c6b:     	leaq	-0x30(%rbp), %rdi
145553c6f:     	movq	%rdi, %rcx
145553c72:     	movq	%rbx, %rdx
145553c75:     	movq	%r12, %r8
145553c78:     	movq	%r14, %r9
145553c7b:     	callq	0x145458060 <.text+0x5457060>
145553c80:     	nop
145553c81:     	jmp	0x145554189 <.text+0x5553189>
145553c86:     	movl	$0x2a, %edx
145553c8b:     	leaq	0x17e3524(%rip), %rcx   # 0x146d371b6
145553c92:     	callq	0x145457cb0 <.text+0x5456cb0>
145553c97:     	nop
145553c98:     	movq	%rax, %r14
145553c9b:     	movq	%rdx, %rbx
145553c9e:     	addq	$0x8, %r13
145553ca2:     	leaq	0xd0(%rbp), %rcx
145553ca9:     	movq	%r13, %rdx
145553cac:     	callq	0x14542be00 <.text+0x542ae00>
145553cb1:     	nop
145553cb2:     	testq	%r14, %r14
145553cb5:     	movl	$0x2a, %eax
145553cba:     	cmoveq	%rax, %rbx
145553cbe:     	leaq	0x17e34f1(%rip), %rax   # 0x146d371b6
145553cc5:     	cmoveq	%rax, %r14
145553cc9:     	leaq	0x17e2f4b(%rip), %rax   # 0x146d36c1b
145553cd0:     	movq	%rax, 0x70(%rbp)
145553cd4:     	movq	$0x3, 0x78(%rbp)
145553cdc:     	leaq	0xd0(%rbp), %rax
145553ce3:     	movq	%rax, 0x80(%rbp)
145553cea:     	leaq	0x17e23a7(%rip), %rax   # 0x146d36098
145553cf1:     	movq	%rax, 0x88(%rbp)
145553cf8:     	movq	$0x1, 0x20(%rsp)
145553d01:     	leaq	-0x30(%rbp), %rdi
145553d05:     	movq	%rdi, %rcx
145553d08:     	movq	%r14, %rdx
145553d0b:     	movq	%rbx, %r8
145553d0e:     	leaq	0x70(%rbp), %r9
145553d12:     	callq	0x145458060 <.text+0x5457060>
145553d17:     	nop
145553d18:     	jmp	0x14555532b <.text+0x555432b>
145553d1d:     	movss	-0xc(%rbp), %xmm11
145553d23:     	cmpb	$0x1, 0x8(%rbp)
145553d27:     	jne	0x1455549b8 <.text+0x55539b8>
145553d2d:     	movq	0x10(%rbp), %rbx
145553d31:     	movq	0x18(%rbp), %r13
145553d35:     	cmpb	$0x0, -0xf(%rbp)
145553d39:     	je	0x145554bb5 <.text+0x5553bb5>
145553d3f:     	movl	$0x4c, %edx
145553d44:     	leaq	0x17e34fa(%rip), %rcx   # 0x146d37245
145553d4b:     	callq	0x145457cb0 <.text+0x5456cb0>
145553d50:     	nop
145553d51:     	movq	%rax, %r12
145553d54:     	movq	%rdx, %r15
145553d57:     	testq	%rax, %rax
145553d5a:     	leaq	0x17e34e4(%rip), %rax   # 0x146d37245
145553d61:     	cmoveq	%rax, %r12
145553d65:     	movl	$0x4c, %eax
145553d6a:     	cmoveq	%rax, %r15
145553d6e:     	movq	%rbx, 0xd0(%rbp)
145553d75:     	movq	%r13, 0xd8(%rbp)
145553d7c:     	xorl	%edi, %edi
145553d7e:     	jmp	0x145553d91 <.text+0x5552d91>
145553d80:     	addq	$0x78, %rdi
145553d84:     	cmpq	$0x3480, %rdi           # imm = 0x3480
145553d8b:     	je	0x145555541 <.text+0x5554541>
145553d91:     	leaq	0x11e2db0(%rip), %r14   # 0x146736b48
145553d98:     	cmpq	%r13, 0x8(%rdi,%r14)
145553d9d:     	jne	0x145553d80 <.text+0x5552d80>
145553d9f:     	movq	(%rdi,%r14), %rcx
145553da3:     	movq	%rbx, %rdx
145553da6:     	movq	%r13, %r8
145553da9:     	callq	0x1457731e7 <.text+0x57721e7>
145553dae:     	testl	%eax, %eax
145553db0:     	jne	0x145553d80 <.text+0x5552d80>
145553db2:     	leaq	(%r14,%rdi), %rax
145553db6:     	movq	%rax, 0xd0(%rbp)
145553dbd:     	leaq	-0x5551d04(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145553dc4:     	movq	%rax, 0xd8(%rbp)
145553dcb:     	leaq	0x70(%rbp), %rcx
145553dcf:     	leaq	0x11d7b31(%rip), %rdx   # 0x14672b907
145553dd6:     	leaq	0xd0(%rbp), %r8
145553ddd:     	callq	0x145728390 <.text+0x5727390>
145553de2:     	nop
145553de3:     	movq	0x78(%rbp), %rcx
145553de7:     	movq	0x80(%rbp), %rdx
145553dee:     	leaq	0x11e2d53(%rip), %rax   # 0x146736b48
145553df5:     	movq	0x10(%rdi,%rax), %r13
145553dfa:     	movq	0x18(%rdi,%rax), %rdi
145553dff:     	movq	%rcx, -0x18(%rbp)
145553e03:     	callq	0x145457cb0 <.text+0x5456cb0>
145553e08:     	nop
145553e09:     	movq	%rax, %r14
145553e0c:     	movq	%rdx, %rbx
145553e0f:     	movq	0x70(%rbp), %rdx
145553e13:     	testq	%rdx, %rdx
145553e16:     	je	0x145553e27 <.text+0x5552e27>
145553e18:     	movl	$0x1, %r8d
145553e1e:     	movq	-0x18(%rbp), %rcx
145553e22:     	callq	0x1400021d0 <.text+0x11d0>
145553e27:     	testq	%r14, %r14
145553e2a:     	cmovneq	%r14, %r13
145553e2e:     	cmoveq	%rdi, %rbx
145553e32:     	movq	%r13, 0x58(%rbp)
145553e36:     	movq	%rbx, 0x60(%rbp)
145553e3a:     	mulss	%xmm8, %xmm11
145553e3f:     	movss	%xmm11, 0x40(%rbp)
145553e45:     	leaq	0x40(%rbp), %rax
145553e49:     	movq	%rax, 0x70(%rbp)
145553e4d:     	leaq	0x1e589c(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145553e54:     	movq	%rax, 0x78(%rbp)
145553e58:     	leaq	0xd0(%rbp), %rcx
145553e5f:     	leaq	0x11e68cb(%rip), %rdx   # 0x14673a731
145553e66:     	leaq	0x70(%rbp), %r8
145553e6a:     	callq	0x145728390 <.text+0x5727390>
145553e6f:     	nop
145553e70:     	leaq	0x17e33c9(%rip), %rax   # 0x146d37240
145553e77:     	movq	%rax, 0x70(%rbp)
145553e7b:     	movq	$0x5, 0x78(%rbp)
145553e83:     	leaq	0x58(%rbp), %rax
145553e87:     	movq	%rax, 0x80(%rbp)
145553e8e:     	leaq	0x17e338b(%rip), %rax   # 0x146d37220
145553e95:     	movq	%rax, 0x88(%rbp)
145553e9c:     	leaq	0x17e315a(%rip), %rax   # 0x146d36ffd
145553ea3:     	movq	%rax, 0x90(%rbp)
145553eaa:     	movq	$0x4, 0x98(%rbp)
145553eb5:     	leaq	0xd0(%rbp), %rax
145553ebc:     	movq	%rax, 0xa0(%rbp)
145553ec3:     	leaq	0x17e21ce(%rip), %rax   # 0x146d36098
145553eca:     	movq	%rax, 0xa8(%rbp)
145553ed1:     	movq	$0x2, 0x20(%rsp)
145553eda:     	leaq	-0x30(%rbp), %rdi
145553ede:     	movq	%rdi, %rcx
145553ee1:     	movq	%r12, %rdx
145553ee4:     	movq	%r15, %r8
145553ee7:     	leaq	0x70(%rbp), %r9
145553eeb:     	callq	0x145458060 <.text+0x5457060>
145553ef0:     	nop
145553ef1:     	jmp	0x14555532b <.text+0x555432b>
145553ef6:     	movss	-0xc(%rbp), %xmm11
145553efc:     	movl	$0x30, %edx
145553f01:     	leaq	0x17e3530(%rip), %rcx   # 0x146d37438
145553f08:     	callq	0x145457cb0 <.text+0x5456cb0>
145553f0d:     	nop
145553f0e:     	movq	%rax, %r14
145553f11:     	movq	%rdx, %rbx
145553f14:     	mulss	%xmm8, %xmm11
145553f19:     	movss	%xmm11, 0x58(%rbp)
145553f1f:     	leaq	0x58(%rbp), %rax
145553f23:     	movq	%rax, 0x70(%rbp)
145553f27:     	leaq	0x1e57c2(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145553f2e:     	movq	%rax, 0x78(%rbp)
145553f32:     	leaq	0xd0(%rbp), %rcx
145553f39:     	leaq	0x11e67f1(%rip), %rdx   # 0x14673a731
145553f40:     	leaq	0x70(%rbp), %r8
145553f44:     	callq	0x145728390 <.text+0x5727390>
145553f49:     	nop
145553f4a:     	testq	%r14, %r14
145553f4d:     	movl	$0x30, %eax
145553f52:     	cmoveq	%rax, %rbx
145553f56:     	leaq	0x17e34db(%rip), %rax   # 0x146d37438
145553f5d:     	cmoveq	%rax, %r14
145553f61:     	leaq	0x17e3095(%rip), %rax   # 0x146d36ffd
145553f68:     	movq	%rax, 0x70(%rbp)
145553f6c:     	movq	$0x4, 0x78(%rbp)
145553f74:     	leaq	0xd0(%rbp), %rax
145553f7b:     	movq	%rax, 0x80(%rbp)
145553f82:     	leaq	0x17e210f(%rip), %rax   # 0x146d36098
145553f89:     	movq	%rax, 0x88(%rbp)
145553f90:     	movq	$0x1, 0x20(%rsp)
145553f99:     	leaq	-0x30(%rbp), %rdi
145553f9d:     	movq	%rdi, %rcx
145553fa0:     	movq	%r14, %rdx
145553fa3:     	movq	%rbx, %r8
145553fa6:     	leaq	0x70(%rbp), %r9
145553faa:     	callq	0x145458060 <.text+0x5457060>
145553faf:     	nop
145553fb0:     	jmp	0x14555532b <.text+0x555432b>
145553fb5:     	movl	$0x20, %edx
145553fba:     	leaq	0x17e34a7(%rip), %rcx   # 0x146d37468
145553fc1:     	callq	0x145457cb0 <.text+0x5456cb0>
145553fc6:     	nop
145553fc7:     	movq	%rdx, %rbx
145553fca:     	testq	%rax, %rax
145553fcd:     	leaq	0x17e3494(%rip), %rcx   # 0x146d37468
145553fd4:     	cmoveq	%rcx, %rax
145553fd8:     	movl	$0x20, %ecx
145553fdd:     	cmoveq	%rcx, %rbx
145553fe1:     	testq	%rbx, %rbx
145553fe4:     	js	0x1455553da <.text+0x55543da>
145553fea:     	je	0x145554e61 <.text+0x5553e61>
145553ff0:     	movq	%rax, %r14
145553ff3:     	callq	0x140002200 <.text+0x1200>
145553ff8:     	movl	$0x1, %edx
145553ffd:     	movq	%rbx, %rcx
145554000:     	callq	0x1400021c0 <.text+0x11c0>
145554005:     	testq	%rax, %rax
145554008:     	je	0x14555557f <.text+0x555457f>
14555400e:     	movq	%rax, %rdi
145554011:     	movq	%rax, %rcx
145554014:     	movq	%r14, %rdx
145554017:     	movq	%rbx, %r8
14555401a:     	callq	0x1457731ed <.text+0x57721ed>
14555401f:     	movq	%rdi, %rax
145554022:     	jmp	0x145554e66 <.text+0x5553e66>
145554027:     	movss	-0xc(%rbp), %xmm12
14555402d:     	movss	-0x4(%rbp), %xmm11
145554033:     	movl	$0x35, %edx
145554038:     	leaq	0x17e304e(%rip), %rcx   # 0x146d3708d
14555403f:     	callq	0x145457cb0 <.text+0x5456cb0>
145554044:     	nop
145554045:     	movq	%rax, %rbx
145554048:     	movq	%rdx, %r12
14555404b:     	testq	%rax, %rax
14555404e:     	leaq	0x17e3038(%rip), %rax   # 0x146d3708d
145554055:     	cmoveq	%rax, %rbx
145554059:     	movl	$0x35, %eax
14555405e:     	cmoveq	%rax, %r12
145554062:     	minss	%xmm6, %xmm12
145554067:     	mulss	%xmm8, %xmm12
14555406c:     	movss	%xmm12, 0xd0(%rbp)
145554075:     	leaq	0xd0(%rbp), %rax
14555407c:     	movq	%rax, 0x70(%rbp)
145554080:     	leaq	0x1e5669(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554087:     	movq	%rax, 0x78(%rbp)
14555408b:     	leaq	0x40(%rbp), %rcx
14555408f:     	leaq	0x11e669b(%rip), %rdx   # 0x14673a731
145554096:     	leaq	0x70(%rbp), %r8
14555409a:     	callq	0x145728390 <.text+0x5727390>
14555409f:     	nop
1455540a0:     	addq	$0x10, %r13
1455540a4:     	leaq	0x58(%rbp), %rcx
1455540a8:     	movq	%r13, %rdx
1455540ab:     	callq	0x14542bff0 <.text+0x542aff0>
1455540b0:     	nop
1455540b1:     	mulss	%xmm8, %xmm11
1455540b6:     	movss	%xmm11, -0x30(%rbp)
1455540bc:     	leaq	-0x30(%rbp), %r15
1455540c0:     	movq	%r15, 0x70(%rbp)
1455540c4:     	leaq	0x1e5625(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1455540cb:     	movq	%rax, 0x78(%rbp)
1455540cf:     	leaq	0xd0(%rbp), %rdi
1455540d6:     	movq	%rdi, %rcx
1455540d9:     	leaq	0x11e6651(%rip), %rdx   # 0x14673a731
1455540e0:     	leaq	0x70(%rbp), %r14
1455540e4:     	movq	%r14, %r8
1455540e7:     	callq	0x145728390 <.text+0x5727390>
1455540ec:     	nop
1455540ed:     	leaq	0x17e2fce(%rip), %rax   # 0x146d370c2
1455540f4:     	movq	%rax, 0x70(%rbp)
1455540f8:     	movq	$0x6, 0x78(%rbp)
145554100:     	leaq	0x40(%rbp), %rax
145554104:     	movq	%rax, 0x80(%rbp)
14555410b:     	leaq	0x17e1f86(%rip), %rcx   # 0x146d36098
145554112:     	movq	%rcx, 0x88(%rbp)
145554119:     	leaq	0x17e2f19(%rip), %rax   # 0x146d37039
145554120:     	movq	%rax, 0x90(%rbp)
145554127:     	movq	$0x4, 0x98(%rbp)
145554132:     	leaq	0x58(%rbp), %rax
145554136:     	movq	%rax, 0xa0(%rbp)
14555413d:     	movq	%rcx, 0xa8(%rbp)
145554144:     	leaq	0x17e2eb2(%rip), %rax   # 0x146d36ffd
14555414b:     	movq	%rax, 0xb0(%rbp)
145554152:     	movq	$0x4, 0xb8(%rbp)
14555415d:     	movq	%rdi, 0xc0(%rbp)
145554164:     	movq	%rcx, 0xc8(%rbp)
14555416b:     	movq	$0x3, 0x20(%rsp)
145554174:     	movq	%r15, %rcx
145554177:     	movq	%rbx, %rdx
14555417a:     	movq	%r12, %r8
14555417d:     	movq	%r14, %r9
145554180:     	callq	0x145458060 <.text+0x5457060>
145554185:     	nop
145554186:     	movq	%r15, %rdi
145554189:     	movq	0xd0(%rbp), %rdx
145554190:     	testq	%rdx, %rdx
145554193:     	je	0x1455541a7 <.text+0x55531a7>
145554195:     	movq	0xd8(%rbp), %rcx
14555419c:     	movl	$0x1, %r8d
1455541a2:     	callq	0x1400021d0 <.text+0x11d0>
1455541a7:     	movq	0x58(%rbp), %rdx
1455541ab:     	testq	%rdx, %rdx
1455541ae:     	je	0x1455541bf <.text+0x55531bf>
1455541b0:     	movq	0x60(%rbp), %rcx
1455541b4:     	movl	$0x1, %r8d
1455541ba:     	callq	0x1400021d0 <.text+0x11d0>
1455541bf:     	movq	0x40(%rbp), %rdx
1455541c3:     	testq	%rdx, %rdx
1455541c6:     	je	0x145555349 <.text+0x5554349>
1455541cc:     	movq	0x48(%rbp), %rcx
1455541d0:     	jmp	0x14555533e <.text+0x555433e>
1455541d5:     	movl	-0x8(%rbp), %eax
1455541d8:     	movl	0x8(%rbp), %ecx
1455541db:     	xorl	$0x8, %ecx
1455541de:     	movl	%eax, %edx
1455541e0:     	xorl	$0x3, %edx
1455541e3:     	orl	%ecx, %edx
1455541e5:     	jne	0x145554a71 <.text+0x5553a71>
1455541eb:     	movss	-0xc(%rbp), %xmm11
1455541f1:     	movss	-0x4(%rbp), %xmm0
1455541f6:     	movss	%xmm0, 0x40(%rbp)
1455541fb:     	movl	$0x34, %edx
145554200:     	leaq	0x17e2ec1(%rip), %rcx   # 0x146d370c8
145554207:     	callq	0x145457cb0 <.text+0x5456cb0>
14555420c:     	nop
14555420d:     	movq	%rax, %r12
145554210:     	movq	%rdx, %rbx
145554213:     	minss	%xmm6, %xmm11
145554218:     	mulss	%xmm8, %xmm11
14555421d:     	movss	%xmm11, 0xd0(%rbp)
145554226:     	leaq	0xd0(%rbp), %rax
14555422d:     	movq	%rax, 0x70(%rbp)
145554231:     	leaq	0x1e54b8(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554238:     	movq	%rax, 0x78(%rbp)
14555423c:     	leaq	0x58(%rbp), %rcx
145554240:     	leaq	0x11e64ea(%rip), %rdx   # 0x14673a731
145554247:     	leaq	0x70(%rbp), %r8
14555424b:     	callq	0x145728390 <.text+0x5727390>
145554250:     	nop
145554251:     	leaq	0x40(%rbp), %rax
145554255:     	movq	%rax, 0xd0(%rbp)
14555425c:     	leaq	0x1e548d(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554263:     	movq	%rax, 0xd8(%rbp)
14555426a:     	leaq	0x70(%rbp), %r14
14555426e:     	movq	%r14, %rcx
145554271:     	leaq	0x17e2e84(%rip), %rdx   # 0x146d370fc
145554278:     	leaq	0xd0(%rbp), %rdi
14555427f:     	movq	%rdi, %r8
145554282:     	callq	0x145728390 <.text+0x5727390>
145554287:     	nop
145554288:     	testq	%r12, %r12
14555428b:     	movl	$0x34, %eax
145554290:     	cmoveq	%rax, %rbx
145554294:     	leaq	0x17e2e2d(%rip), %rax   # 0x146d370c8
14555429b:     	cmoveq	%rax, %r12
14555429f:     	movups	0x70(%rbp), %xmm0
1455542a3:     	movaps	%xmm0, 0xd0(%rbp)
1455542aa:     	movq	0x80(%rbp), %rax
1455542b1:     	movq	%rax, 0xe0(%rbp)
1455542b8:     	leaq	0x17e2e03(%rip), %rax   # 0x146d370c2
1455542bf:     	movq	%rax, 0x70(%rbp)
1455542c3:     	movq	$0x6, 0x78(%rbp)
1455542cb:     	leaq	0x58(%rbp), %rax
1455542cf:     	movq	%rax, 0x80(%rbp)
1455542d6:     	leaq	0x17e1dbb(%rip), %rax   # 0x146d36098
1455542dd:     	movq	%rax, 0x88(%rbp)
1455542e4:     	leaq	0x17e2e19(%rip), %rcx   # 0x146d37104
1455542eb:     	movq	%rcx, 0x90(%rbp)
1455542f2:     	movq	$0x1, 0x98(%rbp)
1455542fd:     	movq	%rdi, 0xa0(%rbp)
145554304:     	movq	%rax, 0xa8(%rbp)
14555430b:     	movq	$0x2, 0x20(%rsp)
145554314:     	leaq	-0x30(%rbp), %rdi
145554318:     	movq	%rdi, %rcx
14555431b:     	movq	%r12, %rdx
14555431e:     	movq	%rbx, %r8
145554321:     	movq	%r14, %r9
145554324:     	callq	0x145458060 <.text+0x5457060>
145554329:     	nop
14555432a:     	jmp	0x145554984 <.text+0x5553984>
14555432f:     	movq	-0x8(%rbp), %rbx
145554333:     	movq	(%rbp), %r14
145554337:     	movss	-0xc(%rbp), %xmm11
14555433d:     	movl	$0x37, %edx
145554342:     	leaq	0x17e2fc5(%rip), %rcx   # 0x146d3730e
145554349:     	callq	0x145457cb0 <.text+0x5456cb0>
14555434e:     	nop
14555434f:     	movq	%rax, %r13
145554352:     	movq	%rdx, %r12
145554355:     	testq	%rax, %rax
145554358:     	leaq	0x17e2faf(%rip), %rax   # 0x146d3730e
14555435f:     	cmoveq	%rax, %r13
145554363:     	movl	$0x37, %eax
145554368:     	cmoveq	%rax, %r12
14555436c:     	movq	%rbx, 0xd0(%rbp)
145554373:     	movq	%r14, 0xd8(%rbp)
14555437a:     	xorl	%edi, %edi
14555437c:     	jmp	0x145554391 <.text+0x5553391>
14555437e:     	nop
145554380:     	addq	$0x78, %rdi
145554384:     	cmpq	$0x3480, %rdi           # imm = 0x3480
14555438b:     	je	0x14555544b <.text+0x555444b>
145554391:     	leaq	0x11e27b0(%rip), %r15   # 0x146736b48
145554398:     	cmpq	%r14, 0x8(%rdi,%r15)
14555439d:     	jne	0x145554380 <.text+0x5553380>
14555439f:     	movq	(%rdi,%r15), %rcx
1455543a3:     	movq	%rbx, %rdx
1455543a6:     	movq	%r14, %r8
1455543a9:     	callq	0x1457731e7 <.text+0x57721e7>
1455543ae:     	testl	%eax, %eax
1455543b0:     	jne	0x145554380 <.text+0x5553380>
1455543b2:     	leaq	(%r15,%rdi), %rax
1455543b6:     	movq	%rax, 0xd0(%rbp)
1455543bd:     	leaq	-0x5552304(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1455543c4:     	movq	%rax, 0xd8(%rbp)
1455543cb:     	leaq	0x70(%rbp), %rcx
1455543cf:     	leaq	0x11d7531(%rip), %rdx   # 0x14672b907
1455543d6:     	leaq	0xd0(%rbp), %r8
1455543dd:     	callq	0x145728390 <.text+0x5727390>
1455543e2:     	nop
1455543e3:     	movq	%r12, %r15
1455543e6:     	movq	0x78(%rbp), %rcx
1455543ea:     	movq	0x80(%rbp), %rdx
1455543f1:     	leaq	0x11e2750(%rip), %rax   # 0x146736b48
1455543f8:     	movq	0x10(%rdi,%rax), %r12
1455543fd:     	movq	0x18(%rdi,%rax), %rdi
145554402:     	movq	%rcx, -0x18(%rbp)
145554406:     	callq	0x145457cb0 <.text+0x5456cb0>
14555440b:     	nop
14555440c:     	movq	%rax, %r14
14555440f:     	movq	%rdx, %rbx
145554412:     	movq	0x70(%rbp), %rdx
145554416:     	testq	%rdx, %rdx
145554419:     	je	0x14555442a <.text+0x555342a>
14555441b:     	movl	$0x1, %r8d
145554421:     	movq	-0x18(%rbp), %rcx
145554425:     	callq	0x1400021d0 <.text+0x11d0>
14555442a:     	testq	%r14, %r14
14555442d:     	cmovneq	%r14, %r12
145554431:     	cmoveq	%rdi, %rbx
145554435:     	movq	%r12, 0x58(%rbp)
145554439:     	movq	%rbx, 0x60(%rbp)
14555443d:     	mulss	%xmm8, %xmm11
145554442:     	movss	%xmm11, 0x40(%rbp)
145554448:     	leaq	0x40(%rbp), %rax
14555444c:     	movq	%rax, 0x70(%rbp)
145554450:     	leaq	0x1e5299(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554457:     	movq	%rax, 0x78(%rbp)
14555445b:     	leaq	0xd0(%rbp), %rcx
145554462:     	leaq	0x11e62c8(%rip), %rdx   # 0x14673a731
145554469:     	leaq	0x70(%rbp), %r8
14555446d:     	callq	0x145728390 <.text+0x5727390>
145554472:     	nop
145554473:     	movq	%r15, %r8
145554476:     	leaq	0x17e2dc3(%rip), %rax   # 0x146d37240
14555447d:     	movq	%rax, 0x70(%rbp)
145554481:     	movq	$0x5, 0x78(%rbp)
145554489:     	leaq	0x58(%rbp), %rax
14555448d:     	movq	%rax, 0x80(%rbp)
145554494:     	leaq	0x17e2d85(%rip), %rax   # 0x146d37220
14555449b:     	movq	%rax, 0x88(%rbp)
1455544a2:     	leaq	0x17e2b54(%rip), %rax   # 0x146d36ffd
1455544a9:     	movq	%rax, 0x90(%rbp)
1455544b0:     	movq	$0x4, 0x98(%rbp)
1455544bb:     	leaq	0xd0(%rbp), %rax
1455544c2:     	movq	%rax, 0xa0(%rbp)
1455544c9:     	leaq	0x17e1bc8(%rip), %rax   # 0x146d36098
1455544d0:     	movq	%rax, 0xa8(%rbp)
1455544d7:     	movq	$0x2, 0x20(%rsp)
1455544e0:     	leaq	-0x30(%rbp), %rdi
1455544e4:     	movq	%rdi, %rcx
1455544e7:     	movq	%r13, %rdx
1455544ea:     	leaq	0x70(%rbp), %r9
1455544ee:     	callq	0x145458060 <.text+0x5457060>
1455544f3:     	nop
1455544f4:     	jmp	0x14555532b <.text+0x555432b>
1455544f9:     	movl	-0xc(%rbp), %r14d
1455544fd:     	movss	-0x8(%rbp), %xmm11
145554503:     	movl	$0x46, %edx
145554508:     	leaq	0x17e2db9(%rip), %rcx   # 0x146d372c8
14555450f:     	callq	0x145457cb0 <.text+0x5456cb0>
145554514:     	nop
145554515:     	movq	%rax, %rbx
145554518:     	movq	%rdx, %r12
14555451b:     	testq	%rax, %rax
14555451e:     	leaq	0x17e2da3(%rip), %rax   # 0x146d372c8
145554525:     	cmoveq	%rax, %rbx
145554529:     	movl	$0x46, %eax
14555452e:     	cmoveq	%rax, %r12
145554532:     	movl	%r14d, %ecx
145554535:     	callq	0x14542a4a0 <.text+0x54294a0>
14555453a:     	nop
14555453b:     	movq	%rax, 0x58(%rbp)
14555453f:     	movq	%rdx, 0x60(%rbp)
145554543:     	mulss	%xmm8, %xmm11
145554548:     	movss	%xmm11, 0x40(%rbp)
14555454e:     	leaq	0x40(%rbp), %rax
145554552:     	movq	%rax, 0x70(%rbp)
145554556:     	leaq	0x1e5193(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
14555455d:     	movq	%rax, 0x78(%rbp)
145554561:     	leaq	0xd0(%rbp), %rcx
145554568:     	leaq	0x11e61c2(%rip), %rdx   # 0x14673a731
14555456f:     	leaq	0x70(%rbp), %r8
145554573:     	callq	0x145728390 <.text+0x5727390>
145554578:     	nop
145554579:     	leaq	0x17e2cc0(%rip), %rax   # 0x146d37240
145554580:     	movq	%rax, 0x70(%rbp)
145554584:     	movq	$0x5, 0x78(%rbp)
14555458c:     	leaq	0x58(%rbp), %rax
145554590:     	movq	%rax, 0x80(%rbp)
145554597:     	leaq	0x17e2c82(%rip), %rax   # 0x146d37220
14555459e:     	movq	%rax, 0x88(%rbp)
1455545a5:     	leaq	0x17e2a51(%rip), %rax   # 0x146d36ffd
1455545ac:     	movq	%rax, 0x90(%rbp)
1455545b3:     	movq	$0x4, 0x98(%rbp)
1455545be:     	leaq	0xd0(%rbp), %rax
1455545c5:     	movq	%rax, 0xa0(%rbp)
1455545cc:     	leaq	0x17e1ac5(%rip), %rax   # 0x146d36098
1455545d3:     	movq	%rax, 0xa8(%rbp)
1455545da:     	movq	$0x2, 0x20(%rsp)
1455545e3:     	leaq	-0x30(%rbp), %rdi
1455545e7:     	movq	%rdi, %rcx
1455545ea:     	movq	%rbx, %rdx
1455545ed:     	movq	%r12, %r8
1455545f0:     	leaq	0x70(%rbp), %r9
1455545f4:     	callq	0x145458060 <.text+0x5457060>
1455545f9:     	nop
1455545fa:     	jmp	0x14555532b <.text+0x555432b>
1455545ff:     	movq	%rbx, -0x10(%rbp)
145554603:     	movq	%r12, -0x8(%rbp)
145554607:     	xorl	%edi, %edi
145554609:     	leaq	0x58(%rbp), %r13
14555460d:     	jmp	0x145554621 <.text+0x5553621>
14555460f:     	nop
145554610:     	addq	$0x78, %rdi
145554614:     	cmpq	$0x3480, %rdi           # imm = 0x3480
14555461b:     	je	0x14555547e <.text+0x555447e>
145554621:     	leaq	0x11e2520(%rip), %r14   # 0x146736b48
145554628:     	cmpq	%r12, 0x8(%rdi,%r14)
14555462d:     	jne	0x145554610 <.text+0x5553610>
14555462f:     	movq	(%rdi,%r14), %rcx
145554633:     	movq	%rbx, %rdx
145554636:     	movq	%r12, %r8
145554639:     	callq	0x1457731e7 <.text+0x57721e7>
14555463e:     	testl	%eax, %eax
145554640:     	jne	0x145554610 <.text+0x5553610>
145554642:     	movl	0x68(%rdi,%r14), %eax
145554647:     	cmpl	$0x3, %eax
14555464a:     	je	0x145554f59 <.text+0x5553f59>
145554650:     	cmpl	$0x7, %eax
145554653:     	je	0x145554e7f <.text+0x5553e7f>
145554659:     	cmpl	$0xa, %eax
14555465c:     	jne	0x145554740 <.text+0x5553740>
145554662:     	movl	$0x15, %edx
145554667:     	leaq	0x17e28fe(%rip), %rcx   # 0x146d36f6c
14555466e:     	callq	0x145457cb0 <.text+0x5456cb0>
145554673:     	nop
145554674:     	leaq	0xd0(%rbp), %rdi
14555467b:     	leaq	0x58(%rbp), %r12
14555467f:     	leaq	-0x10(%rbp), %r13
145554683:     	leaq	0x70(%rbp), %r15
145554687:     	movq	%rax, %r14
14555468a:     	movq	%rdx, %rbx
14555468d:     	mulss	%xmm8, %xmm11
145554692:     	movss	%xmm11, 0x58(%rbp)
145554698:     	movq	%r12, 0x70(%rbp)
14555469c:     	leaq	0x1e504d(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1455546a3:     	movq	%rax, 0x78(%rbp)
1455546a7:     	movq	%r13, %rcx
1455546aa:     	leaq	0x11e6080(%rip), %rdx   # 0x14673a731
1455546b1:     	movq	%r15, %r8
1455546b4:     	callq	0x145728390 <.text+0x5727390>
1455546b9:     	nop
1455546ba:     	testq	%r14, %r14
1455546bd:     	movl	$0x15, %eax
1455546c2:     	cmoveq	%rax, %rbx
1455546c6:     	leaq	0x17e289f(%rip), %rax   # 0x146d36f6c
1455546cd:     	cmoveq	%rax, %r14
1455546d1:     	leaq	0x17e2543(%rip), %rax   # 0x146d36c1b
1455546d8:     	movq	%rax, 0x70(%rbp)
1455546dc:     	movq	$0x3, 0x78(%rbp)
1455546e4:     	movq	%rdi, 0x80(%rbp)
1455546eb:     	leaq	0x17e19a6(%rip), %rax   # 0x146d36098
1455546f2:     	movq	%rax, 0x88(%rbp)
1455546f9:     	leaq	0x17e256a(%rip), %rcx   # 0x146d36c6a
145554700:     	movq	%rcx, 0x90(%rbp)
145554707:     	movq	$0x1, 0x98(%rbp)
145554712:     	movq	%r13, 0xa0(%rbp)
145554719:     	movq	%rax, 0xa8(%rbp)
145554720:     	movq	$0x2, 0x20(%rsp)
145554729:     	movq	%r12, %rcx
14555472c:     	movq	%r14, %rdx
14555472f:     	movq	%rbx, %r8
145554732:     	movq	%r15, %r9
145554735:     	callq	0x145458060 <.text+0x5457060>
14555473a:     	nop
14555473b:     	jmp	0x145554820 <.text+0x5553820>
145554740:     	movl	$0x14, %edx
145554745:     	leaq	0x17e2835(%rip), %rcx   # 0x146d36f81
14555474c:     	callq	0x145457cb0 <.text+0x5456cb0>
145554751:     	nop
145554752:     	leaq	0xd0(%rbp), %rdi
145554759:     	leaq	0x58(%rbp), %r12
14555475d:     	leaq	-0x10(%rbp), %r13
145554761:     	leaq	0x70(%rbp), %r15
145554765:     	movq	%rax, %r14
145554768:     	movq	%rdx, %rbx
14555476b:     	mulss	%xmm8, %xmm11
145554770:     	movss	%xmm11, 0x58(%rbp)
145554776:     	movq	%r12, 0x70(%rbp)
14555477a:     	leaq	0x1e4f6f(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554781:     	movq	%rax, 0x78(%rbp)
145554785:     	movq	%r13, %rcx
145554788:     	leaq	0x11e5fa2(%rip), %rdx   # 0x14673a731
14555478f:     	movq	%r15, %r8
145554792:     	callq	0x145728390 <.text+0x5727390>
145554797:     	nop
145554798:     	testq	%r14, %r14
14555479b:     	movl	$0x14, %eax
1455547a0:     	cmoveq	%rax, %rbx
1455547a4:     	leaq	0x17e27d6(%rip), %rax   # 0x146d36f81
1455547ab:     	cmoveq	%rax, %r14
1455547af:     	leaq	0x17e2465(%rip), %rax   # 0x146d36c1b
1455547b6:     	movq	%rax, 0x70(%rbp)
1455547ba:     	movq	$0x3, 0x78(%rbp)
1455547c2:     	movq	%rdi, 0x80(%rbp)
1455547c9:     	leaq	0x17e18c8(%rip), %rax   # 0x146d36098
1455547d0:     	movq	%rax, 0x88(%rbp)
1455547d7:     	leaq	0x17e248c(%rip), %rcx   # 0x146d36c6a
1455547de:     	movq	%rcx, 0x90(%rbp)
1455547e5:     	movq	$0x1, 0x98(%rbp)
1455547f0:     	movq	%r13, 0xa0(%rbp)
1455547f7:     	movq	%rax, 0xa8(%rbp)
1455547fe:     	movq	$0x2, 0x20(%rsp)
145554807:     	movq	%r12, %rcx
14555480a:     	movq	%r14, %rdx
14555480d:     	movq	%rbx, %r8
145554810:     	movq	%r15, %r9
145554813:     	callq	0x145458060 <.text+0x5457060>
145554818:     	nop
145554819:     	nopl	(%rax)
145554820:     	movq	-0x10(%rbp), %rdx
145554824:     	testq	%rdx, %rdx
145554827:     	je	0x145554838 <.text+0x5553838>
145554829:     	movq	-0x8(%rbp), %rcx
14555482d:     	movl	$0x1, %r8d
145554833:     	callq	0x1400021d0 <.text+0x11d0>
145554838:     	movq	0xd0(%rbp), %rdx
14555483f:     	testq	%rdx, %rdx
145554842:     	je	0x145552785 <.text+0x5551785>
145554848:     	movq	0xd8(%rbp), %rcx
14555484f:     	movl	$0x1, %r8d
145554855:     	callq	0x1400021d0 <.text+0x11d0>
14555485a:     	jmp	0x145552785 <.text+0x5551785>
14555485f:     	movl	%eax, 0x3c(%rbp)
145554862:     	movss	-0x8(%rbp), %xmm11
145554868:     	movl	$0x2a, %edx
14555486d:     	leaq	0x17e27ef(%rip), %rcx   # 0x146d37063
145554874:     	callq	0x145457cb0 <.text+0x5456cb0>
145554879:     	nop
14555487a:     	movq	%rax, %r12
14555487d:     	movq	%rdx, %rbx
145554880:     	leaq	0x58(%rbp), %rcx
145554884:     	movq	%r13, %rdx
145554887:     	callq	0x14542bff0 <.text+0x542aff0>
14555488c:     	nop
14555488d:     	mulss	%xmm8, %xmm11
145554892:     	movss	%xmm11, 0x40(%rbp)
145554898:     	leaq	0x40(%rbp), %rax
14555489c:     	movq	%rax, 0x70(%rbp)
1455548a0:     	leaq	0x1e4e49(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1455548a7:     	movq	%rax, 0x78(%rbp)
1455548ab:     	leaq	0xd0(%rbp), %rdi
1455548b2:     	movq	%rdi, %rcx
1455548b5:     	leaq	0x11e5e75(%rip), %rdx   # 0x14673a731
1455548bc:     	leaq	0x70(%rbp), %r14
1455548c0:     	movq	%r14, %r8
1455548c3:     	callq	0x145728390 <.text+0x5727390>
1455548c8:     	nop
1455548c9:     	testq	%r12, %r12
1455548cc:     	movl	$0x2a, %eax
1455548d1:     	cmoveq	%rax, %rbx
1455548d5:     	leaq	0x17e2787(%rip), %rax   # 0x146d37063
1455548dc:     	cmoveq	%rax, %r12
1455548e0:     	leaq	0x17e2752(%rip), %rax   # 0x146d37039
1455548e7:     	movq	%rax, 0x70(%rbp)
1455548eb:     	movq	$0x4, 0x78(%rbp)
1455548f3:     	leaq	0x58(%rbp), %rax
1455548f7:     	movq	%rax, 0x80(%rbp)
1455548fe:     	leaq	0x17e1793(%rip), %rax   # 0x146d36098
145554905:     	movq	%rax, 0x88(%rbp)
14555490c:     	leaq	0x17e21cd(%rip), %rcx   # 0x146d36ae0
145554913:     	movq	%rcx, 0x90(%rbp)
14555491a:     	movq	$0x1, 0x98(%rbp)
145554925:     	leaq	0x3c(%rbp), %rcx
145554929:     	movq	%rcx, 0xa0(%rbp)
145554930:     	leaq	0x17e2189(%rip), %rcx   # 0x146d36ac0
145554937:     	movq	%rcx, 0xa8(%rbp)
14555493e:     	leaq	0x17e26b8(%rip), %rcx   # 0x146d36ffd
145554945:     	movq	%rcx, 0xb0(%rbp)
14555494c:     	movq	$0x4, 0xb8(%rbp)
145554957:     	movq	%rdi, 0xc0(%rbp)
14555495e:     	movq	%rax, 0xc8(%rbp)
145554965:     	movq	$0x3, 0x20(%rsp)
14555496e:     	leaq	-0x30(%rbp), %rdi
145554972:     	movq	%rdi, %rcx
145554975:     	movq	%r12, %rdx
145554978:     	movq	%rbx, %r8
14555497b:     	movq	%r14, %r9
14555497e:     	callq	0x145458060 <.text+0x5457060>
145554983:     	nop
145554984:     	movq	0xd0(%rbp), %rdx
14555498b:     	testq	%rdx, %rdx
14555498e:     	je	0x1455549a2 <.text+0x55539a2>
145554990:     	movq	0xd8(%rbp), %rcx
145554997:     	movl	$0x1, %r8d
14555499d:     	callq	0x1400021d0 <.text+0x11d0>
1455549a2:     	movq	0x58(%rbp), %rdx
1455549a6:     	testq	%rdx, %rdx
1455549a9:     	je	0x145555349 <.text+0x5554349>
1455549af:     	movq	0x60(%rbp), %rcx
1455549b3:     	jmp	0x14555533e <.text+0x555433e>
1455549b8:     	movl	$0x37, %edx
1455549bd:     	leaq	0x17e28cd(%rip), %rcx   # 0x146d37291
1455549c4:     	callq	0x145457cb0 <.text+0x5456cb0>
1455549c9:     	nop
1455549ca:     	movq	%rax, %r14
1455549cd:     	movq	%rdx, %rbx
1455549d0:     	mulss	%xmm8, %xmm11
1455549d5:     	movss	%xmm11, 0x58(%rbp)
1455549db:     	leaq	0x58(%rbp), %rax
1455549df:     	movq	%rax, 0x70(%rbp)
1455549e3:     	leaq	0x1e4d06(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1455549ea:     	movq	%rax, 0x78(%rbp)
1455549ee:     	leaq	0xd0(%rbp), %rcx
1455549f5:     	leaq	0x11e5d35(%rip), %rdx   # 0x14673a731
1455549fc:     	leaq	0x70(%rbp), %r8
145554a00:     	callq	0x145728390 <.text+0x5727390>
145554a05:     	nop
145554a06:     	testq	%r14, %r14
145554a09:     	movl	$0x37, %eax
145554a0e:     	cmoveq	%rax, %rbx
145554a12:     	leaq	0x17e2878(%rip), %rax   # 0x146d37291
145554a19:     	cmoveq	%rax, %r14
145554a1d:     	leaq	0x17e25d9(%rip), %rax   # 0x146d36ffd
145554a24:     	movq	%rax, 0x70(%rbp)
145554a28:     	movq	$0x4, 0x78(%rbp)
145554a30:     	leaq	0xd0(%rbp), %rax
145554a37:     	movq	%rax, 0x80(%rbp)
145554a3e:     	leaq	0x17e1653(%rip), %rax   # 0x146d36098
145554a45:     	movq	%rax, 0x88(%rbp)
145554a4c:     	movq	$0x1, 0x20(%rsp)
145554a55:     	leaq	-0x30(%rbp), %rdi
145554a59:     	movq	%rdi, %rcx
145554a5c:     	movq	%r14, %rdx
145554a5f:     	movq	%rbx, %r8
145554a62:     	leaq	0x70(%rbp), %r9
145554a66:     	callq	0x145458060 <.text+0x5457060>
145554a6b:     	nop
145554a6c:     	jmp	0x14555532b <.text+0x555432b>
145554a71:     	addq	$0x18, %r13
145554a75:     	movss	-0x4(%rbp), %xmm11
145554a7b:     	cmpl	$-0x1, %eax
145554a7e:     	je	0x14555513c <.text+0x555413c>
145554a84:     	cmpl	$0x2, %eax
145554a87:     	je	0x145555033 <.text+0x5554033>
145554a8d:     	cmpl	$0x3, %eax
145554a90:     	jne	0x14555529d <.text+0x555429d>
145554a96:     	movss	%xmm11, 0x40(%rbp)
145554a9c:     	movl	$0x17, %edx
145554aa1:     	leaq	0x17e2674(%rip), %rcx   # 0x146d3711c
145554aa8:     	callq	0x145457cb0 <.text+0x5456cb0>
145554aad:     	nop
145554aae:     	movq	%rax, %r12
145554ab1:     	movq	%rdx, %rbx
145554ab4:     	leaq	0x58(%rbp), %rcx
145554ab8:     	movq	%r13, %rdx
145554abb:     	callq	0x14542bff0 <.text+0x542aff0>
145554ac0:     	nop
145554ac1:     	leaq	0x40(%rbp), %rax
145554ac5:     	movq	%rax, 0xd0(%rbp)
145554acc:     	leaq	0x1e4c1d(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554ad3:     	movq	%rax, 0xd8(%rbp)
145554ada:     	leaq	0x70(%rbp), %r14
145554ade:     	movq	%r14, %rcx
145554ae1:     	leaq	0x17e2614(%rip), %rdx   # 0x146d370fc
145554ae8:     	leaq	0xd0(%rbp), %rdi
145554aef:     	movq	%rdi, %r8
145554af2:     	callq	0x145728390 <.text+0x5727390>
145554af7:     	nop
145554af8:     	testq	%r12, %r12
145554afb:     	movl	$0x17, %eax
145554b00:     	cmoveq	%rax, %rbx
145554b04:     	leaq	0x17e2611(%rip), %rax   # 0x146d3711c
145554b0b:     	cmoveq	%rax, %r12
145554b0f:     	movups	0x70(%rbp), %xmm0
145554b13:     	movaps	%xmm0, 0xd0(%rbp)
145554b1a:     	movq	0x80(%rbp), %rax
145554b21:     	movq	%rax, 0xe0(%rbp)
145554b28:     	leaq	0x17e250a(%rip), %rax   # 0x146d37039
145554b2f:     	movq	%rax, 0x70(%rbp)
145554b33:     	movq	$0x4, 0x78(%rbp)
145554b3b:     	leaq	0x58(%rbp), %rax
145554b3f:     	movq	%rax, 0x80(%rbp)
145554b46:     	leaq	0x17e154b(%rip), %rax   # 0x146d36098
145554b4d:     	movq	%rax, 0x88(%rbp)
145554b54:     	leaq	0x17e25a9(%rip), %rcx   # 0x146d37104
145554b5b:     	movq	%rcx, 0x90(%rbp)
145554b62:     	movq	$0x1, 0x98(%rbp)
145554b6d:     	movq	%rdi, 0xa0(%rbp)
145554b74:     	movq	%rax, 0xa8(%rbp)
145554b7b:     	movq	$0x2, 0x20(%rsp)
145554b84:     	leaq	-0x30(%rbp), %rdi
145554b88:     	movq	%rdi, %rcx
145554b8b:     	movq	%r12, %rdx
145554b8e:     	movq	%rbx, %r8
145554b91:     	movq	%r14, %r9
145554b94:     	callq	0x145458060 <.text+0x5457060>
145554b99:     	nop
145554b9a:     	jmp	0x145554984 <.text+0x5553984>
145554b9f:     	movl	$0x1, %eax
145554ba4:     	leaq	-0x30(%rbp), %rdi
145554ba8:     	movq	%rbx, -0x30(%rbp)
145554bac:     	movq	%rax, -0x40(%rbp)
145554bb0:     	jmp	0x145554e72 <.text+0x5553e72>
145554bb5:     	movl	$0x3c, %edx
145554bba:     	leaq	0x17e261f(%rip), %rcx   # 0x146d371e0
145554bc1:     	callq	0x145457cb0 <.text+0x5456cb0>
145554bc6:     	nop
145554bc7:     	movq	%rax, %r12
145554bca:     	movq	%rdx, %r15
145554bcd:     	testq	%rax, %rax
145554bd0:     	leaq	0x17e2609(%rip), %rax   # 0x146d371e0
145554bd7:     	cmoveq	%rax, %r12
145554bdb:     	movl	$0x3c, %eax
145554be0:     	cmoveq	%rax, %r15
145554be4:     	movq	%rbx, 0xd0(%rbp)
145554beb:     	movq	%r13, 0xd8(%rbp)
145554bf2:     	xorl	%edi, %edi
145554bf4:     	jmp	0x145554c11 <.text+0x5553c11>
145554bf6:     	nopw	%cs:(%rax,%rax)
145554c00:     	addq	$0x78, %rdi
145554c04:     	cmpq	$0x3480, %rdi           # imm = 0x3480
145554c0b:     	je	0x145555511 <.text+0x5554511>
145554c11:     	leaq	0x11e1f30(%rip), %r14   # 0x146736b48
145554c18:     	cmpq	%r13, 0x8(%rdi,%r14)
145554c1d:     	jne	0x145554c00 <.text+0x5553c00>
145554c1f:     	movq	(%rdi,%r14), %rcx
145554c23:     	movq	%rbx, %rdx
145554c26:     	movq	%r13, %r8
145554c29:     	callq	0x1457731e7 <.text+0x57721e7>
145554c2e:     	testl	%eax, %eax
145554c30:     	jne	0x145554c00 <.text+0x5553c00>
145554c32:     	leaq	(%r14,%rdi), %rax
145554c36:     	movq	%rax, 0xd0(%rbp)
145554c3d:     	leaq	-0x5552b84(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145554c44:     	movq	%rax, 0xd8(%rbp)
145554c4b:     	leaq	0x70(%rbp), %rcx
145554c4f:     	leaq	0x11d6cb1(%rip), %rdx   # 0x14672b907
145554c56:     	leaq	0xd0(%rbp), %r8
145554c5d:     	callq	0x145728390 <.text+0x5727390>
145554c62:     	nop
145554c63:     	movq	0x78(%rbp), %rcx
145554c67:     	movq	0x80(%rbp), %rdx
145554c6e:     	leaq	0x11e1ed3(%rip), %rax   # 0x146736b48
145554c75:     	movq	0x10(%rdi,%rax), %r13
145554c7a:     	movq	0x18(%rdi,%rax), %rdi
145554c7f:     	movq	%rcx, -0x18(%rbp)
145554c83:     	callq	0x145457cb0 <.text+0x5456cb0>
145554c88:     	nop
145554c89:     	movq	%rax, %r14
145554c8c:     	movq	%rdx, %rbx
145554c8f:     	movq	0x70(%rbp), %rdx
145554c93:     	testq	%rdx, %rdx
145554c96:     	je	0x145554ca7 <.text+0x5553ca7>
145554c98:     	movl	$0x1, %r8d
145554c9e:     	movq	-0x18(%rbp), %rcx
145554ca2:     	callq	0x1400021d0 <.text+0x11d0>
145554ca7:     	testq	%r14, %r14
145554caa:     	cmovneq	%r14, %r13
145554cae:     	cmoveq	%rdi, %rbx
145554cb2:     	movq	%r13, 0x58(%rbp)
145554cb6:     	movq	%rbx, 0x60(%rbp)
145554cba:     	mulss	%xmm8, %xmm11
145554cbf:     	movss	%xmm11, 0x40(%rbp)
145554cc5:     	leaq	0x40(%rbp), %rax
145554cc9:     	movq	%rax, 0x70(%rbp)
145554ccd:     	leaq	0x1e4a1c(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554cd4:     	movq	%rax, 0x78(%rbp)
145554cd8:     	leaq	0xd0(%rbp), %rcx
145554cdf:     	leaq	0x11e5a4b(%rip), %rdx   # 0x14673a731
145554ce6:     	leaq	0x70(%rbp), %r8
145554cea:     	callq	0x145728390 <.text+0x5727390>
145554cef:     	nop
145554cf0:     	leaq	0x17e2549(%rip), %rax   # 0x146d37240
145554cf7:     	movq	%rax, 0x70(%rbp)
145554cfb:     	movq	$0x5, 0x78(%rbp)
145554d03:     	leaq	0x58(%rbp), %rax
145554d07:     	movq	%rax, 0x80(%rbp)
145554d0e:     	leaq	0x17e250b(%rip), %rax   # 0x146d37220
145554d15:     	movq	%rax, 0x88(%rbp)
145554d1c:     	leaq	0x17e22da(%rip), %rax   # 0x146d36ffd
145554d23:     	movq	%rax, 0x90(%rbp)
145554d2a:     	movq	$0x4, 0x98(%rbp)
145554d35:     	leaq	0xd0(%rbp), %rax
145554d3c:     	movq	%rax, 0xa0(%rbp)
145554d43:     	leaq	0x17e134e(%rip), %rax   # 0x146d36098
145554d4a:     	movq	%rax, 0xa8(%rbp)
145554d51:     	movq	$0x2, 0x20(%rsp)
145554d5a:     	leaq	-0x30(%rbp), %rdi
145554d5e:     	movq	%rdi, %rcx
145554d61:     	movq	%r12, %rdx
145554d64:     	movq	%r15, %r8
145554d67:     	leaq	0x70(%rbp), %r9
145554d6b:     	callq	0x145458060 <.text+0x5457060>
145554d70:     	nop
145554d71:     	jmp	0x14555532b <.text+0x555432b>
145554d76:     	movl	$0x13, %edx
145554d7b:     	leaq	0x17e213e(%rip), %rcx   # 0x146d36ec0
145554d82:     	callq	0x145457cb0 <.text+0x5456cb0>
145554d87:     	nop
145554d88:     	leaq	0xd0(%rbp), %r15
145554d8f:     	leaq	0x58(%rbp), %r12
145554d93:     	leaq	-0x10(%rbp), %r13
145554d97:     	leaq	0x70(%rbp), %rdi
145554d9b:     	movq	%rax, %r14
145554d9e:     	movq	%rdx, %rbx
145554da1:     	addss	%xmm6, %xmm11
145554da6:     	sqrtss	%xmm11, %xmm0
145554dab:     	addss	%xmm7, %xmm0
145554daf:     	mulss	%xmm8, %xmm0
145554db4:     	movss	%xmm0, 0x58(%rbp)
145554db9:     	movq	%r12, 0x70(%rbp)
145554dbd:     	leaq	0x1e492c(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554dc4:     	movq	%rax, 0x78(%rbp)
145554dc8:     	movq	%r13, %rcx
145554dcb:     	leaq	0x11e595f(%rip), %rdx   # 0x14673a731
145554dd2:     	movq	%rdi, %r8
145554dd5:     	callq	0x145728390 <.text+0x5727390>
145554dda:     	nop
145554ddb:     	testq	%r14, %r14
145554dde:     	movl	$0x13, %eax
145554de3:     	cmoveq	%rax, %rbx
145554de7:     	leaq	0x17e20d2(%rip), %rax   # 0x146d36ec0
145554dee:     	cmoveq	%rax, %r14
145554df2:     	leaq	0x17e1e22(%rip), %rax   # 0x146d36c1b
145554df9:     	movq	%rax, 0x70(%rbp)
145554dfd:     	movq	$0x3, 0x78(%rbp)
145554e05:     	movq	%r15, 0x80(%rbp)
145554e0c:     	leaq	0x17e1285(%rip), %rax   # 0x146d36098
145554e13:     	movq	%rax, 0x88(%rbp)
145554e1a:     	leaq	0x17e1e94(%rip), %rcx   # 0x146d36cb5
145554e21:     	movq	%rcx, 0x90(%rbp)
145554e28:     	movq	$0x1, 0x98(%rbp)
145554e33:     	movq	%r13, 0xa0(%rbp)
145554e3a:     	movq	%rax, 0xa8(%rbp)
145554e41:     	movq	$0x2, 0x20(%rsp)
145554e4a:     	movq	%r12, %rcx
145554e4d:     	movq	%r14, %rdx
145554e50:     	movq	%rbx, %r8
145554e53:     	movq	%rdi, %r9
145554e56:     	callq	0x145458060 <.text+0x5457060>
145554e5b:     	nop
145554e5c:     	jmp	0x145554820 <.text+0x5553820>
145554e61:     	movl	$0x1, %eax
145554e66:     	leaq	-0x30(%rbp), %rdi
145554e6a:     	movq	%rbx, -0x30(%rbp)
145554e6e:     	movq	%rax, -0x38(%rbp)
145554e72:     	movq	%rax, -0x28(%rbp)
145554e76:     	movq	%rbx, -0x20(%rbp)
145554e7a:     	jmp	0x145555349 <.text+0x5554349>
145554e7f:     	movl	$0x12, %edx
145554e84:     	leaq	0x17e2023(%rip), %rcx   # 0x146d36eae
145554e8b:     	callq	0x145457cb0 <.text+0x5456cb0>
145554e90:     	nop
145554e91:     	leaq	0xd0(%rbp), %rdi
145554e98:     	leaq	-0x10(%rbp), %r12
145554e9c:     	leaq	0x70(%rbp), %r15
145554ea0:     	movq	%rax, %r14
145554ea3:     	movq	%rdx, %rbx
145554ea6:     	mulss	%xmm8, %xmm11
145554eab:     	movss	%xmm11, 0x58(%rbp)
145554eb1:     	movq	%r13, 0x70(%rbp)
145554eb5:     	leaq	0x1e4834(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554ebc:     	movq	%rax, 0x78(%rbp)
145554ec0:     	movq	%r12, %rcx
145554ec3:     	leaq	0x11e5867(%rip), %rdx   # 0x14673a731
145554eca:     	movq	%r15, %r8
145554ecd:     	callq	0x145728390 <.text+0x5727390>
145554ed2:     	nop
145554ed3:     	testq	%r14, %r14
145554ed6:     	movl	$0x12, %eax
145554edb:     	cmoveq	%rax, %rbx
145554edf:     	leaq	0x17e1fc8(%rip), %rax   # 0x146d36eae
145554ee6:     	cmoveq	%rax, %r14
145554eea:     	leaq	0x17e1d2a(%rip), %rax   # 0x146d36c1b
145554ef1:     	movq	%rax, 0x70(%rbp)
145554ef5:     	movq	$0x3, 0x78(%rbp)
145554efd:     	movq	%rdi, 0x80(%rbp)
145554f04:     	leaq	0x17e118d(%rip), %rax   # 0x146d36098
145554f0b:     	movq	%rax, 0x88(%rbp)
145554f12:     	leaq	0x17e1d9c(%rip), %rcx   # 0x146d36cb5
145554f19:     	movq	%rcx, 0x90(%rbp)
145554f20:     	movq	$0x1, 0x98(%rbp)
145554f2b:     	movq	%r12, 0xa0(%rbp)
145554f32:     	movq	%rax, 0xa8(%rbp)
145554f39:     	movq	$0x2, 0x20(%rsp)
145554f42:     	movq	%r13, %rcx
145554f45:     	movq	%r14, %rdx
145554f48:     	movq	%rbx, %r8
145554f4b:     	movq	%r15, %r9
145554f4e:     	callq	0x145458060 <.text+0x5457060>
145554f53:     	nop
145554f54:     	jmp	0x145554820 <.text+0x5553820>
145554f59:     	movl	$0x19, %edx
145554f5e:     	leaq	0x17e1fee(%rip), %rcx   # 0x146d36f53
145554f65:     	callq	0x145457cb0 <.text+0x5456cb0>
145554f6a:     	nop
145554f6b:     	leaq	0xd0(%rbp), %rdi
145554f72:     	leaq	-0x10(%rbp), %r12
145554f76:     	leaq	0x70(%rbp), %r15
145554f7a:     	movq	%rax, %r14
145554f7d:     	movq	%rdx, %rbx
145554f80:     	mulss	%xmm8, %xmm11
145554f85:     	movss	%xmm11, 0x58(%rbp)
145554f8b:     	movq	%r13, 0x70(%rbp)
145554f8f:     	leaq	0x1e475a(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145554f96:     	movq	%rax, 0x78(%rbp)
145554f9a:     	movq	%r12, %rcx
145554f9d:     	leaq	0x11e578d(%rip), %rdx   # 0x14673a731
145554fa4:     	movq	%r15, %r8
145554fa7:     	callq	0x145728390 <.text+0x5727390>
145554fac:     	nop
145554fad:     	testq	%r14, %r14
145554fb0:     	movl	$0x19, %eax
145554fb5:     	cmoveq	%rax, %rbx
145554fb9:     	leaq	0x17e1f93(%rip), %rax   # 0x146d36f53
145554fc0:     	cmoveq	%rax, %r14
145554fc4:     	leaq	0x17e1c50(%rip), %rax   # 0x146d36c1b
145554fcb:     	movq	%rax, 0x70(%rbp)
145554fcf:     	movq	$0x3, 0x78(%rbp)
145554fd7:     	movq	%rdi, 0x80(%rbp)
145554fde:     	leaq	0x17e10b3(%rip), %rax   # 0x146d36098
145554fe5:     	movq	%rax, 0x88(%rbp)
145554fec:     	leaq	0x17e1c77(%rip), %rcx   # 0x146d36c6a
145554ff3:     	movq	%rcx, 0x90(%rbp)
145554ffa:     	movq	$0x1, 0x98(%rbp)
145555005:     	movq	%r12, 0xa0(%rbp)
14555500c:     	movq	%rax, 0xa8(%rbp)
145555013:     	movq	$0x2, 0x20(%rsp)
14555501c:     	movq	%r13, %rcx
14555501f:     	movq	%r14, %rdx
145555022:     	movq	%rbx, %r8
145555025:     	movq	%r15, %r9
145555028:     	callq	0x145458060 <.text+0x5457060>
14555502d:     	nop
14555502e:     	jmp	0x145554820 <.text+0x5553820>
145555033:     	movss	%xmm11, 0x40(%rbp)
145555039:     	movl	$0x17, %edx
14555503e:     	leaq	0x17e20c0(%rip), %rcx   # 0x146d37105
145555045:     	callq	0x145457cb0 <.text+0x5456cb0>
14555504a:     	nop
14555504b:     	movq	%rax, %r12
14555504e:     	movq	%rdx, %rbx
145555051:     	leaq	0x58(%rbp), %rcx
145555055:     	movq	%r13, %rdx
145555058:     	callq	0x14542bff0 <.text+0x542aff0>
14555505d:     	nop
14555505e:     	leaq	0x40(%rbp), %rax
145555062:     	movq	%rax, 0xd0(%rbp)
145555069:     	leaq	0x1e4680(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145555070:     	movq	%rax, 0xd8(%rbp)
145555077:     	leaq	0x70(%rbp), %r14
14555507b:     	movq	%r14, %rcx
14555507e:     	leaq	0x17e2077(%rip), %rdx   # 0x146d370fc
145555085:     	leaq	0xd0(%rbp), %rdi
14555508c:     	movq	%rdi, %r8
14555508f:     	callq	0x145728390 <.text+0x5727390>
145555094:     	nop
145555095:     	testq	%r12, %r12
145555098:     	movl	$0x17, %eax
14555509d:     	cmoveq	%rax, %rbx
1455550a1:     	leaq	0x17e205d(%rip), %rax   # 0x146d37105
1455550a8:     	cmoveq	%rax, %r12
1455550ac:     	movups	0x70(%rbp), %xmm0
1455550b0:     	movaps	%xmm0, 0xd0(%rbp)
1455550b7:     	movq	0x80(%rbp), %rax
1455550be:     	movq	%rax, 0xe0(%rbp)
1455550c5:     	leaq	0x17e1f6d(%rip), %rax   # 0x146d37039
1455550cc:     	movq	%rax, 0x70(%rbp)
1455550d0:     	movq	$0x4, 0x78(%rbp)
1455550d8:     	leaq	0x58(%rbp), %rax
1455550dc:     	movq	%rax, 0x80(%rbp)
1455550e3:     	leaq	0x17e0fae(%rip), %rax   # 0x146d36098
1455550ea:     	movq	%rax, 0x88(%rbp)
1455550f1:     	leaq	0x17e200c(%rip), %rcx   # 0x146d37104
1455550f8:     	movq	%rcx, 0x90(%rbp)
1455550ff:     	movq	$0x1, 0x98(%rbp)
14555510a:     	movq	%rdi, 0xa0(%rbp)
145555111:     	movq	%rax, 0xa8(%rbp)
145555118:     	movq	$0x2, 0x20(%rsp)
145555121:     	leaq	-0x30(%rbp), %rdi
145555125:     	movq	%rdi, %rcx
145555128:     	movq	%r12, %rdx
14555512b:     	movq	%rbx, %r8
14555512e:     	movq	%r14, %r9
145555131:     	callq	0x145458060 <.text+0x5457060>
145555136:     	nop
145555137:     	jmp	0x145554984 <.text+0x5553984>
14555513c:     	movss	(%rbp), %xmm0
145555141:     	movss	%xmm0, 0x3c(%rbp)
145555146:     	movl	$0x37, %edx
14555514b:     	leaq	0x17e1ff6(%rip), %rcx   # 0x146d37148
145555152:     	callq	0x145457cb0 <.text+0x5456cb0>
145555157:     	nop
145555158:     	movq	%rax, %rbx
14555515b:     	movq	%rdx, %r12
14555515e:     	testq	%rax, %rax
145555161:     	leaq	0x17e1fe0(%rip), %rax   # 0x146d37148
145555168:     	cmoveq	%rax, %rbx
14555516c:     	movl	$0x37, %eax
145555171:     	cmoveq	%rax, %r12
145555175:     	leaq	0x40(%rbp), %rcx
145555179:     	movq	%r13, %rdx
14555517c:     	callq	0x14542bff0 <.text+0x542aff0>
145555181:     	nop
145555182:     	mulss	%xmm8, %xmm11
145555187:     	movss	%xmm11, 0xd0(%rbp)
145555190:     	leaq	0xd0(%rbp), %rdi
145555197:     	movq	%rdi, 0x70(%rbp)
14555519b:     	leaq	0x1e454e(%rip), %r13    # 0x1457396f0 <.text+0x57386f0>
1455551a2:     	movq	%r13, 0x78(%rbp)
1455551a6:     	leaq	0x58(%rbp), %r15
1455551aa:     	movq	%r15, %rcx
1455551ad:     	leaq	0x11e557d(%rip), %rdx   # 0x14673a731
1455551b4:     	leaq	0x70(%rbp), %r14
1455551b8:     	movq	%r14, %r8
1455551bb:     	callq	0x145728390 <.text+0x5727390>
1455551c0:     	nop
1455551c1:     	leaq	0x3c(%rbp), %rax
1455551c5:     	movq	%rax, 0xd0(%rbp)
1455551cc:     	movq	%r13, 0xd8(%rbp)
1455551d3:     	movq	%r14, %rcx
1455551d6:     	leaq	0x17e0eb1(%rip), %rdx   # 0x146d3608e
1455551dd:     	movq	%rdi, %r8
1455551e0:     	callq	0x145728390 <.text+0x5727390>
1455551e5:     	nop
1455551e6:     	movups	0x70(%rbp), %xmm0
1455551ea:     	movaps	%xmm0, 0xd0(%rbp)
1455551f1:     	movq	0x80(%rbp), %rax
1455551f8:     	movq	%rax, 0xe0(%rbp)
1455551ff:     	leaq	0x17e1e33(%rip), %rax   # 0x146d37039
145555206:     	movq	%rax, 0x70(%rbp)
14555520a:     	movq	$0x4, 0x78(%rbp)
145555212:     	leaq	0x40(%rbp), %rax
145555216:     	movq	%rax, 0x80(%rbp)
14555521d:     	leaq	0x17e0e74(%rip), %rax   # 0x146d36098
145555224:     	movq	%rax, 0x88(%rbp)
14555522b:     	leaq	0x17e1a38(%rip), %rcx   # 0x146d36c6a
145555232:     	movq	%rcx, 0x90(%rbp)
145555239:     	movq	$0x1, 0x98(%rbp)
145555244:     	movq	%r15, 0xa0(%rbp)
14555524b:     	movq	%rax, 0xa8(%rbp)
145555252:     	leaq	0x17e1eab(%rip), %rcx   # 0x146d37104
145555259:     	movq	%rcx, 0xb0(%rbp)
145555260:     	movq	$0x1, 0xb8(%rbp)
14555526b:     	movq	%rdi, 0xc0(%rbp)
145555272:     	movq	%rax, 0xc8(%rbp)
145555279:     	movq	$0x3, 0x20(%rsp)
145555282:     	leaq	-0x30(%rbp), %rdi
145555286:     	movq	%rdi, %rcx
145555289:     	movq	%rbx, %rdx
14555528c:     	movq	%r12, %r8
14555528f:     	movq	%r14, %r9
145555292:     	callq	0x145458060 <.text+0x5457060>
145555297:     	nop
145555298:     	jmp	0x145554189 <.text+0x5553189>
14555529d:     	movl	$0x15, %edx
1455552a2:     	leaq	0x17e1e8a(%rip), %rcx   # 0x146d37133
1455552a9:     	callq	0x145457cb0 <.text+0x5456cb0>
1455552ae:     	nop
1455552af:     	movq	%rax, %r14
1455552b2:     	movq	%rdx, %rbx
1455552b5:     	leaq	0xd0(%rbp), %rcx
1455552bc:     	movq	%r13, %rdx
1455552bf:     	callq	0x14542bff0 <.text+0x542aff0>
1455552c4:     	nop
1455552c5:     	testq	%r14, %r14
1455552c8:     	movl	$0x15, %eax
1455552cd:     	cmoveq	%rax, %rbx
1455552d1:     	leaq	0x17e1e5b(%rip), %rax   # 0x146d37133
1455552d8:     	cmoveq	%rax, %r14
1455552dc:     	leaq	0x17e1d56(%rip), %rax   # 0x146d37039
1455552e3:     	movq	%rax, 0x70(%rbp)
1455552e7:     	movq	$0x4, 0x78(%rbp)
1455552ef:     	leaq	0xd0(%rbp), %rax
1455552f6:     	movq	%rax, 0x80(%rbp)
1455552fd:     	leaq	0x17e0d94(%rip), %rax   # 0x146d36098
145555304:     	movq	%rax, 0x88(%rbp)
14555530b:     	movq	$0x1, 0x20(%rsp)
145555314:     	leaq	-0x30(%rbp), %rdi
145555318:     	movq	%rdi, %rcx
14555531b:     	movq	%r14, %rdx
14555531e:     	movq	%rbx, %r8
145555321:     	leaq	0x70(%rbp), %r9
145555325:     	callq	0x145458060 <.text+0x5457060>
14555532a:     	nop
14555532b:     	movq	0xd0(%rbp), %rdx
145555332:     	testq	%rdx, %rdx
145555335:     	je	0x145555349 <.text+0x5554349>
145555337:     	movq	0xd8(%rbp), %rcx
14555533e:     	movl	$0x1, %r8d
145555344:     	callq	0x1400021d0 <.text+0x11d0>
145555349:     	leaq	0x70(%rbp), %rcx
14555534d:     	movq	%rdi, %rdx
145555350:     	callq	0x14542a910 <.text+0x5429910>
145555355:     	nop
145555356:     	leaq	0x58(%rbp), %rcx
14555535a:     	leaq	-0x10(%rbp), %rdx
14555535e:     	leaq	0x70(%rbp), %r8
145555362:     	callq	0x14542ab60 <.text+0x5429b60>
145555367:     	nop
145555368:     	jmp	0x145552785 <.text+0x5551785>
14555536d:     	movq	(%r8), %rax
145555370:     	movq	0x8(%r8), %rcx
145555374:     	movq	%rcx, (%rax)
145555377:     	jmp	0x14555537f <.text+0x555437f>
145555379:     	movq	(%r9), %rcx
14555537c:     	movq	%rax, (%rcx)
14555537f:     	movaps	0xf0(%rbp), %xmm6
145555386:     	movaps	0x100(%rbp), %xmm7
14555538d:     	movaps	0x110(%rbp), %xmm8
145555395:     	movaps	0x120(%rbp), %xmm9
14555539d:     	movaps	0x130(%rbp), %xmm10
1455553a5:     	movaps	0x140(%rbp), %xmm11
1455553ad:     	movaps	0x150(%rbp), %xmm12
1455553b5:     	addq	$0x1e8, %rsp            # imm = 0x1E8
1455553bc:     	popq	%rbx
1455553bd:     	popq	%rdi
1455553be:     	popq	%rsi
1455553bf:     	popq	%r12
1455553c1:     	popq	%r13
1455553c3:     	popq	%r14
1455553c5:     	popq	%r15
1455553c7:     	popq	%rbp
1455553c8:     	retq
1455553c9:     	xorl	%ecx, %ecx
1455553cb:     	movq	-0x40(%rbp), %rdx
1455553cf:     	callq	0x14590379b <.text+0x590279b>
1455553d4:     	nop
1455553d5:     	jmp	0x14555556f <.text+0x555456f>
1455553da:     	xorl	%ecx, %ecx
1455553dc:     	movq	-0x38(%rbp), %rdx
1455553e0:     	callq	0x14590379b <.text+0x590279b>
1455553e5:     	nop
1455553e6:     	jmp	0x14555556f <.text+0x555456f>
1455553eb:     	leaq	-0x10(%rbp), %rax
1455553ef:     	movq	%rax, 0x70(%rbp)
1455553f3:     	leaq	-0x555333a(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1455553fa:     	movq	%rax, 0x78(%rbp)
1455553fe:     	leaq	0x11e0953(%rip), %rcx   # 0x146735d58
145555405:     	leaq	0x11e095c(%rip), %r8    # 0x146735d68
14555540c:     	leaq	0x70(%rbp), %rdx
145555410:     	callq	0x145903d10 <.text+0x5902d10>
145555415:     	nop
145555416:     	jmp	0x14555556f <.text+0x555456f>
14555541b:     	leaq	-0x10(%rbp), %rax
14555541f:     	movq	%rax, 0x70(%rbp)
145555423:     	leaq	-0x555336a(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14555542a:     	movq	%rax, 0x78(%rbp)
14555542e:     	leaq	0x11e0923(%rip), %rcx   # 0x146735d58
145555435:     	leaq	0x11e092c(%rip), %r8    # 0x146735d68
14555543c:     	leaq	0x70(%rbp), %rdx
145555440:     	callq	0x145903d10 <.text+0x5902d10>
145555445:     	nop
145555446:     	jmp	0x14555556f <.text+0x555456f>
14555544b:     	leaq	0xd0(%rbp), %rax
145555452:     	movq	%rax, 0x70(%rbp)
145555456:     	leaq	-0x555339d(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14555545d:     	movq	%rax, 0x78(%rbp)
145555461:     	leaq	0x11e08f0(%rip), %rcx   # 0x146735d58
145555468:     	leaq	0x11e08f9(%rip), %r8    # 0x146735d68
14555546f:     	leaq	0x70(%rbp), %rdx
145555473:     	callq	0x145903d10 <.text+0x5902d10>
145555478:     	nop
145555479:     	jmp	0x14555556f <.text+0x555456f>
14555547e:     	leaq	-0x10(%rbp), %rax
145555482:     	movq	%rax, 0x70(%rbp)
145555486:     	leaq	-0x55533cd(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14555548d:     	movq	%rax, 0x78(%rbp)
145555491:     	leaq	0x11e08c0(%rip), %rcx   # 0x146735d58
145555498:     	leaq	0x11e08c9(%rip), %r8    # 0x146735d68
14555549f:     	leaq	0x70(%rbp), %rdx
1455554a3:     	callq	0x145903d10 <.text+0x5902d10>
1455554a8:     	nop
1455554a9:     	jmp	0x14555556f <.text+0x555456f>
1455554ae:     	leaq	0xd0(%rbp), %rax
1455554b5:     	movq	%rax, 0x70(%rbp)
1455554b9:     	leaq	-0x5553400(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1455554c0:     	movq	%rax, 0x78(%rbp)
1455554c4:     	leaq	0x11e088d(%rip), %rcx   # 0x146735d58
1455554cb:     	leaq	0x11e0896(%rip), %r8    # 0x146735d68
1455554d2:     	leaq	0x70(%rbp), %rdx
1455554d6:     	callq	0x145903d10 <.text+0x5902d10>
1455554db:     	nop
1455554dc:     	jmp	0x14555556f <.text+0x555456f>
1455554e1:     	leaq	0xd0(%rbp), %rax
1455554e8:     	movq	%rax, 0x70(%rbp)
1455554ec:     	leaq	-0x5553433(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1455554f3:     	movq	%rax, 0x78(%rbp)
1455554f7:     	leaq	0x11e085a(%rip), %rcx   # 0x146735d58
1455554fe:     	leaq	0x11e0863(%rip), %r8    # 0x146735d68
145555505:     	leaq	0x70(%rbp), %rdx
145555509:     	callq	0x145903d10 <.text+0x5902d10>
14555550e:     	nop
14555550f:     	jmp	0x14555556f <.text+0x555456f>
145555511:     	leaq	0xd0(%rbp), %rax
145555518:     	movq	%rax, 0x70(%rbp)
14555551c:     	leaq	-0x5553463(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145555523:     	movq	%rax, 0x78(%rbp)
145555527:     	leaq	0x11e082a(%rip), %rcx   # 0x146735d58
14555552e:     	leaq	0x11e0833(%rip), %r8    # 0x146735d68
145555535:     	leaq	0x70(%rbp), %rdx
145555539:     	callq	0x145903d10 <.text+0x5902d10>
14555553e:     	nop
14555553f:     	jmp	0x14555556f <.text+0x555456f>
145555541:     	leaq	0xd0(%rbp), %rax
145555548:     	movq	%rax, 0x70(%rbp)
14555554c:     	leaq	-0x5553493(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145555553:     	movq	%rax, 0x78(%rbp)
145555557:     	leaq	0x11e07fa(%rip), %rcx   # 0x146735d58
14555555e:     	leaq	0x11e0803(%rip), %r8    # 0x146735d68
145555565:     	leaq	0x70(%rbp), %rdx
145555569:     	callq	0x145903d10 <.text+0x5902d10>
14555556e:     	nop
14555556f:     	ud2
145555571:     	movq	%rbx, -0x40(%rbp)
145555575:     	movl	$0x1, %ecx
14555557a:     	jmp	0x1455553cb <.text+0x55543cb>
14555557f:     	movq	%rbx, -0x38(%rbp)
145555583:     	movl	$0x1, %ecx
145555588:     	jmp	0x1455553dc <.text+0x55543dc>

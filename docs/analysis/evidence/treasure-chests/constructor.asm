
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145472810:     	pushq	%rbp
145472811:     	pushq	%r15
145472813:     	pushq	%r14
145472815:     	pushq	%r13
145472817:     	pushq	%r12
145472819:     	pushq	%rsi
14547281a:     	pushq	%rdi
14547281b:     	pushq	%rbx
14547281c:     	subq	$0xca8, %rsp            # imm = 0xCA8
145472823:     	leaq	0x80(%rsp), %rbp
14547282b:     	movaps	%xmm15, 0xc10(%rbp)
145472833:     	movaps	%xmm14, 0xc00(%rbp)
14547283b:     	movaps	%xmm13, 0xbf0(%rbp)
145472843:     	movaps	%xmm12, 0xbe0(%rbp)
14547284b:     	movaps	%xmm11, 0xbd0(%rbp)
145472853:     	movaps	%xmm10, 0xbc0(%rbp)
14547285b:     	movaps	%xmm9, 0xbb0(%rbp)
145472863:     	movaps	%xmm8, 0xba0(%rbp)
14547286b:     	movaps	%xmm7, 0xb90(%rbp)
145472872:     	movaps	%xmm6, 0xb80(%rbp)
145472879:     	movq	$-0x2, 0xb78(%rbp)
145472884:     	movq	%rdx, %rsi
145472887:     	movq	%r8, 0xb50(%rbp)
14547288e:     	movq	%r8, 0xa98(%rbp)
145472895:     	movzbl	0x16c(%rdx), %edx
14547289c:     	leal	-0x2(%rdx), %eax
14547289f:     	cmpb	$0x9, %al
1454728a1:     	movq	%rcx, 0xa80(%rbp)
1454728a8:     	movq	%rdx, 0xb60(%rbp)
1454728af:     	ja	0x1454728c1 <.text+0x54718c1>
1454728b1:     	movzbl	%al, %eax
1454728b4:     	leaq	0x163e755(%rip), %rcx   # 0x146ab1010
1454728bb:     	movq	(%rcx,%rax,8), %rbx
1454728bf:     	jmp	0x1454728c8 <.text+0x54718c8>
1454728c1:     	leaq	0x1261f90(%rip), %rbx   # 0x1466d4858
1454728c8:     	movl	0xec(%rsi), %r12d
1454728cf:     	movq	0xf8(%rsi), %rcx
1454728d6:     	movq	0x100(%rsi), %rdx
1454728dd:     	callq	0x1453e23e0 <.text+0x53e13e0>
1454728e2:     	movq	%rax, %r14
1454728e5:     	movq	%rsi, 0xb58(%rbp)
1454728ec:     	leaq	0x18(%rsi), %rdx
1454728f0:     	movb	$0x1, 0xb74(%rbp)
1454728f7:     	leaq	-0x58(%rbp), %rcx
1454728fb:     	callq	0x1453f6bd0 <.text+0x53f5bd0>
145472900:     	nop
145472901:     	imulq	$0xb8, %r14, %rax
145472908:     	leaq	0x12600f9(%rip), %r13   # 0x1466d2a08
14547290f:     	addq	%rax, %r13
145472912:     	movq	0x40(%rbx), %r14
145472916:     	movq	0x48(%rbx), %r15
14547291a:     	movq	%r14, 0xad0(%rbp)
145472921:     	movq	%r15, 0xad8(%rbp)
145472928:     	xorl	%edi, %edi
14547292a:     	leaq	0x12631ef(%rip), %rsi   # 0x1466d5b20
145472931:     	jmp	0x145472951 <.text+0x5471951>
145472933:     	nopw	%cs:(%rax,%rax)
145472940:     	addq	$0x78, %rdi
145472944:     	cmpq	$0x3408, %rdi           # imm = 0x3408
14547294b:     	je	0x145473a93 <.text+0x5472a93>
145472951:     	cmpq	%r15, 0x8(%rdi,%rsi)
145472956:     	jne	0x145472940 <.text+0x5471940>
145472958:     	movq	(%rdi,%rsi), %rcx
14547295c:     	movq	%r14, %rdx
14547295f:     	movq	%r15, %r8
145472962:     	callq	0x1457149f7 <.text+0x57139f7>
145472967:     	testl	%eax, %eax
145472969:     	jne	0x145472940 <.text+0x5471940>
14547296b:     	movq	0xb58(%rbp), %rax
145472972:     	movzbl	0x16d(%rax), %r14d
14547297a:     	leal	-0x2(%r14), %eax
14547297e:     	cmpb	$0x6, %al
145472980:     	movq	%rbx, 0xb68(%rbp)
145472987:     	movl	%r12d, 0xacc(%rbp)
14547298e:     	ja	0x1454729a0 <.text+0x54719a0>
145472990:     	movzbl	%al, %eax
145472993:     	leaq	0x163e63e(%rip), %rcx   # 0x146ab0fd8
14547299a:     	movq	(%rcx,%rax,8), %rax
14547299e:     	jmp	0x1454729a7 <.text+0x54719a7>
1454729a0:     	leaq	0x1260d59(%rip), %rax   # 0x1466d3700
1454729a7:     	addq	%rsi, %rdi
1454729aa:     	movq	0x30(%rax), %r15
1454729ae:     	movq	0x38(%rax), %r12
1454729b2:     	movq	%r15, 0xad0(%rbp)
1454729b9:     	movq	%r12, 0xad8(%rbp)
1454729c0:     	xorl	%ebx, %ebx
1454729c2:     	jmp	0x1454729e1 <.text+0x54719e1>
1454729c4:     	nopw	%cs:(%rax,%rax)
1454729d0:     	addq	$0x78, %rbx
1454729d4:     	cmpq	$0x3408, %rbx           # imm = 0x3408
1454729db:     	je	0x145473ad1 <.text+0x5472ad1>
1454729e1:     	cmpq	%r12, 0x8(%rbx,%rsi)
1454729e6:     	jne	0x1454729d0 <.text+0x54719d0>
1454729e8:     	movq	(%rbx,%rsi), %rcx
1454729ec:     	movq	%r15, %rdx
1454729ef:     	movq	%r12, %r8
1454729f2:     	callq	0x1457149f7 <.text+0x57139f7>
1454729f7:     	testl	%eax, %eax
1454729f9:     	jne	0x1454729d0 <.text+0x54719d0>
1454729fb:     	movsd	0x98(%r13), %xmm6
145472a04:     	movshdup	%xmm6, %xmm2            # xmm2 = xmm6[1,1,3,3]
145472a08:     	movq	0xb50(%rbp), %rax
145472a0f:     	leaq	0x10(%rax), %rcx
145472a13:     	movb	$0x1, 0xb76(%rbp)
145472a1a:     	movb	$0x1, 0xb75(%rbp)
145472a21:     	movaps	%xmm6, %xmm1
145472a24:     	callq	0x1453f66f0 <.text+0x53f56f0>
145472a29:     	nop
145472a2a:     	movaps	%xmm0, %xmm7
145472a2d:     	testb	$0x1, %al
145472a2f:     	jne	0x145472a3d <.text+0x5471a3d>
145472a31:     	movq	0xb50(%rbp), %rax
145472a38:     	movss	0x68(%rax), %xmm7
145472a3d:     	movq	0xb58(%rbp), %rax
145472a44:     	movq	0x110(%rax), %rdx
145472a4b:     	movb	$0x1, 0xb76(%rbp)
145472a52:     	movb	$0x1, 0xb75(%rbp)
145472a59:     	leaq	0x8(%rbp), %rcx
145472a5d:     	callq	0x1454d7680 <.text+0x54d6680>
145472a62:     	nop
145472a63:     	movq	0xb58(%rbp), %r15
145472a6a:     	movq	0x108(%r15), %r12
145472a71:     	movss	0xa4(%r13), %xmm10
145472a7a:     	movq	0xb68(%rbp), %rax
145472a81:     	movss	0x80(%rax), %xmm9
145472a8a:     	callq	0x140002200 <.text+0x1200>
145472a8f:     	movl	$0x58, %ecx
145472a94:     	movl	$0x8, %edx
145472a99:     	callq	0x1400021c0 <.text+0x11c0>
145472a9e:     	testq	%rax, %rax
145472aa1:     	je	0x145473a5b <.text+0x5472a5b>
145472aa7:     	movq	%rdi, (%rax)
145472aaa:     	movl	$0x1, 0x8(%rax)
145472ab1:     	movsd	0x44da86(%rip), %xmm12  # 0x1458c0540
145472aba:     	movsd	%xmm12, 0xc(%rax)
145472ac0:     	movq	$0x3f800000, 0x14(%rax) # imm = 0x3F800000
145472ac8:     	movsd	0x437f3f(%rip), %xmm13  # 0x1458aaa10
145472ad1:     	movsd	%xmm13, 0x1c(%rax)
145472ad7:     	xorps	%xmm0, %xmm0
145472ada:     	movups	%xmm0, 0x24(%rax)
145472ade:     	movl	$0x0, 0x34(%rax)
145472ae5:     	movsd	%xmm13, 0x38(%rax)
145472aeb:     	movl	$0x0, 0x40(%rax)
145472af2:     	movaps	0x44da56(%rip), %xmm11  # 0x1458c0550
145472afa:     	movq	%rax, 0xaa0(%rbp)
145472b01:     	movups	%xmm11, 0x44(%rax)
145472b06:     	movq	$0x0, 0xb30(%rbp)
145472b11:     	movq	$0x8, 0xb38(%rbp)
145472b1c:     	movq	$0x0, 0xb40(%rbp)
145472b27:     	movq	%r15, %rax
145472b2a:     	addq	$0x120, %r15            # imm = 0x120
145472b31:     	addq	$0x30, %rax
145472b35:     	movq	%rax, 0x20(%rsp)
145472b3a:     	leaq	0xad0(%rbp), %rcx
145472b41:     	movl	%r14d, %edx
145472b44:     	movq	0xb60(%rbp), %r8
145472b4b:     	movq	%r15, %r9
145472b4e:     	callq	0x1453dfcf0 <.text+0x53decf0>
145472b53:     	nop
145472b54:     	leaq	0xaa8(%rbp), %rcx
145472b5b:     	movq	%r15, %rdx
145472b5e:     	callq	0x1453e12f0 <.text+0x53e02f0>
145472b63:     	nop
145472b64:     	addq	%rbx, %rsi
145472b67:     	movq	0xb68(%rbp), %rbx
145472b6e:     	movss	0x80(%rbx), %xmm15
145472b77:     	movss	0x84(%rbx), %xmm14
145472b80:     	movq	0xb58(%rbp), %rdx
145472b87:     	movl	0xe8(%rdx), %edi
145472b8d:     	addl	$0x3, %edi
145472b90:     	movq	$-0x1, 0x330(%rbp)
145472b9b:     	movups	0xb30(%rbp), %xmm0
145472ba2:     	movups	%xmm0, 0x2e8(%rbp)
145472ba9:     	movq	0xb40(%rbp), %rax
145472bb0:     	movq	%rax, 0x2f8(%rbp)
145472bb7:     	movups	0xad0(%rbp), %xmm0
145472bbe:     	movups	0xae0(%rbp), %xmm1
145472bc5:     	movups	0xaf0(%rbp), %xmm2
145472bcc:     	movups	0xb00(%rbp), %xmm3
145472bd3:     	movups	%xmm0, 0x434(%rbp)
145472bda:     	movups	%xmm1, 0x444(%rbp)
145472be1:     	movups	%xmm2, 0x454(%rbp)
145472be8:     	movups	%xmm3, 0x464(%rbp)
145472bef:     	movups	0xb0c(%rbp), %xmm0
145472bf6:     	movups	%xmm0, 0x470(%rbp)
145472bfd:     	movups	0xaa8(%rbp), %xmm0
145472c04:     	movups	%xmm0, 0x300(%rbp)
145472c0b:     	movq	0xab8(%rbp), %rax
145472c12:     	movq	%rax, 0x310(%rbp)
145472c19:     	xorps	%xmm8, %xmm8
145472c1d:     	movups	%xmm8, 0x3c4(%rbp)
145472c25:     	movl	$0x0, 0x3d4(%rbp)
145472c2f:     	leaq	0x140(%rbp), %rcx
145472c36:     	movl	$0x178, %r8d            # imm = 0x178
145472c3c:     	callq	0x1457149fd <.text+0x57139fd>
145472c41:     	movaps	%xmm8, 0xa60(%rbp)
145472c49:     	movq	$0x0, 0xa70(%rbp)
145472c54:     	movups	%xmm8, 0x980(%rbp)
145472c5c:     	movups	%xmm8, 0xb34(%rbp)
145472c64:     	movups	%xmm8, 0xb40(%rbp)
145472c6c:     	movaps	%xmm8, 0xa40(%rbp)
145472c74:     	movaps	%xmm8, 0xa50(%rbp)
145472c7c:     	movl	$0x0, 0xa90(%rbp)
145472c86:     	movq	$0x0, 0xa88(%rbp)
145472c91:     	movups	-0x8(%rbp), %xmm0
145472c95:     	movaps	%xmm0, 0xb20(%rbp)
145472c9c:     	movups	-0x18(%rbp), %xmm0
145472ca0:     	movaps	%xmm0, 0xb10(%rbp)
145472ca7:     	movups	-0x58(%rbp), %xmm0
145472cab:     	movups	-0x48(%rbp), %xmm1
145472caf:     	movups	-0x38(%rbp), %xmm2
145472cb3:     	movups	-0x28(%rbp), %xmm3
145472cb7:     	movaps	%xmm3, 0xb00(%rbp)
145472cbe:     	movaps	%xmm2, 0xaf0(%rbp)
145472cc5:     	movaps	%xmm1, 0xae0(%rbp)
145472ccc:     	movaps	%xmm0, 0xad0(%rbp)
145472cd3:     	movaps	%xmm8, 0x9e0(%rbp)
145472cdb:     	movaps	%xmm8, 0x9f0(%rbp)
145472ce3:     	movaps	%xmm8, 0xa00(%rbp)
145472ceb:     	movaps	%xmm8, 0xa10(%rbp)
145472cf3:     	movaps	%xmm8, 0xa20(%rbp)
145472cfb:     	movaps	%xmm8, 0xa30(%rbp)
145472d03:     	movaps	%xmm8, 0x990(%rbp)
145472d0b:     	movups	%xmm8, 0xab0(%rbp)
145472d13:     	movups	%xmm8, 0xabc(%rbp)
145472d1b:     	movaps	%xmm8, 0x9a0(%rbp)
145472d23:     	movaps	%xmm8, 0x9b0(%rbp)
145472d2b:     	movaps	%xmm8, 0x9c0(%rbp)
145472d33:     	movaps	%xmm8, 0x9d0(%rbp)
145472d3b:     	movups	0x8(%rbp), %xmm0
145472d3f:     	movups	0x18(%rbp), %xmm1
145472d43:     	movups	%xmm1, 0x8a8(%rbp)
145472d4a:     	movups	%xmm0, 0x898(%rbp)
145472d51:     	movb	$0x0, 0x976(%rbp)
145472d58:     	movq	$0x1, 0x2b8(%rbp)
145472d63:     	movq	0xaa0(%rbp), %rax
145472d6a:     	movq	%rax, 0x2c0(%rbp)
145472d71:     	movq	$0x1, 0x2c8(%rbp)
145472d7c:     	movq	$0x0, 0x2d0(%rbp)
145472d87:     	movq	$0x8, 0x2d8(%rbp)
145472d92:     	movq	$0x0, 0x2e0(%rbp)
145472d9d:     	movq	$0x0, 0x318(%rbp)
145472da8:     	movq	$0x4, 0x320(%rbp)
145472db3:     	movq	$0x0, 0x328(%rbp)
145472dbe:     	movq	%rsi, 0x3a0(%rbp)
145472dc5:     	movl	$0x1, 0x3a8(%rbp)
145472dcf:     	movsd	%xmm12, 0x3ac(%rbp)
145472dd8:     	movq	$0x3f800000, 0x3b4(%rbp) # imm = 0x3F800000
145472de3:     	movsd	%xmm13, 0x3bc(%rbp)
145472dec:     	movsd	%xmm13, 0x3d8(%rbp)
145472df5:     	movl	$0x0, 0x3e0(%rbp)
145472dff:     	movups	%xmm11, 0x3e4(%rbp)
145472e07:     	movq	%r12, 0x3f8(%rbp)
145472e0e:     	movl	$0x0, 0x400(%rbp)
145472e18:     	movsd	0x5674c0(%rip), %xmm0   # 0x1459da2e0
145472e20:     	movsd	%xmm0, 0x404(%rbp)
145472e28:     	movl	$0x0, 0x40c(%rbp)
145472e32:     	movlps	%xmm6, 0x410(%rbp)
145472e39:     	movss	%xmm7, 0x418(%rbp)
145472e41:     	movss	%xmm10, 0x41c(%rbp)
145472e4a:     	movq	$0x1, 0x420(%rbp)
145472e55:     	movss	%xmm9, 0x428(%rbp)
145472e5e:     	movq	$0x0, 0x42c(%rbp)
145472e69:     	movss	%xmm15, 0x480(%rbp)
145472e72:     	movaps	0x163bb27(%rip), %xmm0  # 0x146aae9a0
145472e79:     	movups	%xmm0, 0x484(%rbp)
145472e80:     	movsd	0x163bb28(%rip), %xmm0  # 0x146aae9b0
145472e88:     	movsd	%xmm0, 0x494(%rbp)
145472e90:     	movl	$0x3f800000, 0x49c(%rbp) # imm = 0x3F800000
145472e9a:     	movss	%xmm14, 0x4a0(%rbp)
145472ea3:     	movups	%xmm11, 0x4a4(%rbp)
145472eab:     	movups	%xmm8, 0x4c4(%rbp)
145472eb3:     	movups	%xmm8, 0x4b4(%rbp)
145472ebb:     	movl	%edi, 0x4d4(%rbp)
145472ec1:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
145472ecb:     	movq	%rax, 0x4d8(%rbp)
145472ed2:     	movsd	0x163bae6(%rip), %xmm0  # 0x146aae9c0
145472eda:     	movsd	%xmm0, 0x4e0(%rbp)
145472ee2:     	movq	$0x0, 0x4e8(%rbp)
145472eed:     	movq	$0x8, 0x4f0(%rbp)
145472ef8:     	movups	%xmm8, 0x4f8(%rbp)
145472f00:     	movq	$0x8, 0x508(%rbp)
145472f0b:     	movups	%xmm8, 0x510(%rbp)
145472f13:     	movq	$0x8, 0x520(%rbp)
145472f1e:     	movups	%xmm8, 0x528(%rbp)
145472f26:     	movq	$0x8, 0x538(%rbp)
145472f31:     	movups	%xmm8, 0x540(%rbp)
145472f39:     	movq	$0x8, 0x550(%rbp)
145472f44:     	movq	$0x0, 0x558(%rbp)
145472f4f:     	movq	0xb50(%rbp), %rax
145472f56:     	movq	%rax, 0x890(%rbp)
145472f5d:     	movq	$0x0, 0x8b8(%rbp)
145472f68:     	movq	$0x0, 0x8fc(%rbp)
145472f73:     	movq	$0x0, 0x560(%rbp)
145472f7e:     	movq	$0x8, 0x568(%rbp)
145472f89:     	movups	%xmm8, 0x570(%rbp)
145472f91:     	movq	$0x8, 0x580(%rbp)
145472f9c:     	movups	%xmm8, 0x588(%rbp)
145472fa4:     	movq	$0x8, 0x598(%rbp)
145472faf:     	movups	%xmm8, 0x5a0(%rbp)
145472fb7:     	movups	%xmm8, 0x904(%rbp)
145472fbf:     	movq	$0x8, 0x5b0(%rbp)
145472fca:     	movq	$0x0, 0x28(%rbp)
145472fd2:     	movabsq	$0x232800000000, %rax   # imm = 0x232800000000
145472fdc:     	movq	%rax, 0x914(%rbp)
145472fe3:     	movups	%xmm8, 0x5b8(%rbp)
145472feb:     	movq	$0x4, 0x5c8(%rbp)
145472ff6:     	movups	%xmm8, 0x5d0(%rbp)
145472ffe:     	movq	$0x8, 0x5e0(%rbp)
145473009:     	movq	$0x0, 0x5e8(%rbp)
145473014:     	movq	$0x0, 0x38(%rbp)
14547301c:     	movl	$0x0, 0x860(%rbp)
145473026:     	movq	$0x0, 0x868(%rbp)
145473031:     	movq	$0x1, 0x870(%rbp)
14547303c:     	movq	$0x0, 0x878(%rbp)
145473047:     	movq	$0x0, 0x5f0(%rbp)
145473052:     	movq	$0x8, 0x5f8(%rbp)
14547305d:     	movaps	0xa40(%rbp), %xmm0
145473064:     	movups	%xmm0, 0x600(%rbp)
14547306b:     	movq	$0x8, 0x610(%rbp)
145473076:     	movaps	0xa50(%rbp), %xmm0
14547307d:     	movups	%xmm0, 0x618(%rbp)
145473084:     	movq	$0x8, 0x628(%rbp)
14547308f:     	movq	$0x0, 0x630(%rbp)
14547309a:     	movaps	0xa60(%rbp), %xmm0
1454730a1:     	movups	%xmm0, 0x638(%rbp)
1454730a8:     	movq	0xa70(%rbp), %rax
1454730af:     	movq	%rax, 0x648(%rbp)
1454730b6:     	movq	0x988(%rbp), %rax
1454730bd:     	movq	%rax, 0x660(%rbp)
1454730c4:     	movups	0x978(%rbp), %xmm0
1454730cb:     	movups	%xmm0, 0x650(%rbp)
1454730d2:     	movq	$0x0, 0x670(%rbp)
1454730dd:     	movl	$0x2, 0x67c(%rbp)
1454730e7:     	movups	0xb30(%rbp), %xmm0
1454730ee:     	movups	0xb40(%rbp), %xmm1
1454730f5:     	movups	%xmm1, 0x690(%rbp)
1454730fc:     	movups	%xmm0, 0x680(%rbp)
145473103:     	movabsq	$0x10000000a, %rax      # imm = 0x10000000A
14547310d:     	movq	%rax, 0x91c(%rbp)
145473114:     	movss	0x435494(%rip), %xmm0   # 0x1458a85b0
14547311c:     	movlps	%xmm0, 0x924(%rbp)
145473123:     	movl	$0x42700000, 0x92c(%rbp) # imm = 0x42700000
14547312d:     	movb	$-0x1, 0x975(%rbp)
145473134:     	movq	$0x0, 0x8c0(%rbp)
14547313f:     	movl	0xa90(%rbp), %eax
145473145:     	movl	%eax, 0x938(%rbp)
14547314b:     	movq	0xa88(%rbp), %rax
145473152:     	movq	%rax, 0x930(%rbp)
145473159:     	movsd	0x163b86f(%rip), %xmm0  # 0x146aae9d0
145473161:     	movsd	%xmm0, 0x93c(%rbp)
145473169:     	movabsq	$0x1442700000, %rax     # imm = 0x1442700000
145473173:     	movq	%rax, 0x944(%rbp)
14547317a:     	movq	$0x0, 0x6a0(%rbp)
145473185:     	movq	$0x4, 0x6a8(%rbp)
145473190:     	movq	$0x0, 0x6b0(%rbp)
14547319b:     	movl	$0x0, 0x880(%rbp)
1454731a5:     	movl	$0x0, 0x888(%rbp)
1454731af:     	movq	$0x0, 0x8e0(%rbp)
1454731ba:     	movups	%xmm8, 0x8c8(%rbp)
1454731c2:     	movq	$0x0, 0x6b8(%rbp)
1454731cd:     	movq	$0x4, 0x6c0(%rbp)
1454731d8:     	movups	%xmm8, 0x6c8(%rbp)
1454731e0:     	movq	$0x4, 0x6d8(%rbp)
1454731eb:     	movq	$0x0, 0x6e0(%rbp)
1454731f6:     	movl	$0x0, 0x968(%rbp)
145473200:     	movl	$0x0, 0x8e8(%rbp)
14547320a:     	movaps	0x163b7cf(%rip), %xmm0  # 0x146aae9e0
145473211:     	movups	%xmm0, 0x94c(%rbp)
145473218:     	movb	$0x0, 0x970(%rbp)
14547321f:     	movl	$0x0, 0x96c(%rbp)
145473229:     	movaps	0xb20(%rbp), %xmm0
145473230:     	movups	%xmm0, 0x738(%rbp)
145473237:     	movaps	0xb10(%rbp), %xmm0
14547323e:     	movups	%xmm0, 0x728(%rbp)
145473245:     	movaps	0xad0(%rbp), %xmm0
14547324c:     	movaps	0xae0(%rbp), %xmm1
145473253:     	movaps	0xaf0(%rbp), %xmm2
14547325a:     	movaps	0xb00(%rbp), %xmm3
145473261:     	movups	%xmm3, 0x718(%rbp)
145473268:     	movups	%xmm2, 0x708(%rbp)
14547326f:     	movups	%xmm1, 0x6f8(%rbp)
145473276:     	movups	%xmm0, 0x6e8(%rbp)
14547327d:     	movq	$0x0, 0x48(%rbp)
145473285:     	movq	$0x0, 0x58(%rbp)
14547328d:     	movq	$0x0, 0x68(%rbp)
145473295:     	movq	$0x0, 0x78(%rbp)
14547329d:     	movq	$0x8, 0x80(%rbp)
1454732a8:     	movaps	0x9e0(%rbp), %xmm0
1454732af:     	movups	%xmm0, 0x88(%rbp)
1454732b6:     	movq	$0x4, 0x98(%rbp)
1454732c1:     	movaps	0x9f0(%rbp), %xmm0
1454732c8:     	movups	%xmm0, 0xa0(%rbp)
1454732cf:     	movq	$0x4, 0xb0(%rbp)
1454732da:     	movaps	0xa00(%rbp), %xmm0
1454732e1:     	movups	%xmm0, 0xb8(%rbp)
1454732e8:     	movq	$0x8, 0xc8(%rbp)
1454732f3:     	movaps	0xa10(%rbp), %xmm0
1454732fa:     	movups	%xmm0, 0xd0(%rbp)
145473301:     	movq	$0x8, 0xe0(%rbp)
14547330c:     	movaps	0xa20(%rbp), %xmm0
145473313:     	movups	%xmm0, 0xe8(%rbp)
14547331a:     	movq	$0x8, 0xf8(%rbp)
145473325:     	movaps	0xa30(%rbp), %xmm0
14547332c:     	movups	%xmm0, 0x100(%rbp)
145473333:     	movq	$0x4, 0x110(%rbp)
14547333e:     	movq	$0x0, 0x748(%rbp)
145473349:     	movups	%xmm8, 0x128(%rbp)
145473351:     	movups	%xmm8, 0x118(%rbp)
145473359:     	movb	$0x0, 0x138(%rbp)
145473360:     	movq	$0x8, 0x750(%rbp)
14547336b:     	movaps	0x990(%rbp), %xmm0
145473372:     	movups	%xmm0, 0x758(%rbp)
145473379:     	movq	$0x8, 0x768(%rbp)
145473384:     	movaps	0x9a0(%rbp), %xmm0
14547338b:     	movups	%xmm0, 0x770(%rbp)
145473392:     	movq	$0x8, 0x780(%rbp)
14547339d:     	movaps	0x9b0(%rbp), %xmm0
1454733a4:     	movups	%xmm0, 0x788(%rbp)
1454733ab:     	movq	$0x8, 0x798(%rbp)
1454733b6:     	movaps	0x9c0(%rbp), %xmm0
1454733bd:     	movups	%xmm0, 0x7a0(%rbp)
1454733c4:     	movq	$0x8, 0x7b0(%rbp)
1454733cf:     	movaps	0x9d0(%rbp), %xmm0
1454733d6:     	movups	%xmm0, 0x7b8(%rbp)
1454733dd:     	movq	$0x8, 0x7c8(%rbp)
1454733e8:     	movups	%xmm8, 0x7d0(%rbp)
1454733f0:     	movl	$0x0, 0x7e0(%rbp)
1454733fa:     	movl	0xac8(%rbp), %eax
145473400:     	movl	%eax, 0x804(%rbp)
145473406:     	movups	0xaa8(%rbp), %xmm0
14547340d:     	movups	0xab8(%rbp), %xmm1
145473414:     	movups	%xmm1, 0x7f4(%rbp)
14547341b:     	movups	%xmm0, 0x7e4(%rbp)
145473422:     	movq	$0x0, 0x80d(%rbp)
14547342d:     	movq	$0x0, 0x808(%rbp)
145473438:     	movl	$0x3f800000, 0x95c(%rbp) # imm = 0x3F800000
145473442:     	movq	$0x0, 0x818(%rbp)
14547344d:     	movq	$0x8, 0x820(%rbp)
145473458:     	movups	%xmm8, 0x828(%rbp)
145473460:     	movq	$0x8, 0x838(%rbp)
14547346b:     	movq	$0x0, 0x840(%rbp)
145473476:     	movl	0xacc(%rbp), %eax
14547347c:     	movl	%eax, 0x960(%rbp)
145473482:     	movl	$0xff000000, 0x971(%rbp) # imm = 0xFF000000
14547348c:     	movq	$0x0, 0x848(%rbp)
145473497:     	movq	$0x8, 0x850(%rbp)
1454734a2:     	movq	$0x0, 0x858(%rbp)
1454734ad:     	movl	$0x0, 0x964(%rbp)
1454734b7:     	callq	0x140002200 <.text+0x1200>
1454734bc:     	movl	$0x10, %ecx
1454734c1:     	movl	$0x8, %edx
1454734c6:     	callq	0x1400021c0 <.text+0x11c0>
1454734cb:     	testq	%rax, %rax
1454734ce:     	je	0x145473a7e <.text+0x5472a7e>
1454734d4:     	movq	0x720(%rbp), %rdx
1454734db:     	movq	0x728(%rbp), %rcx
1454734e2:     	movq	%rcx, %r8
1454734e5:     	shlq	$0x6, %r8
1454734e9:     	testq	%rcx, %rcx
1454734ec:     	je	0x14547351b <.text+0x547251b>
1454734ee:     	xorl	%ecx, %ecx
1454734f0:     	xorl	%r9d, %r9d
1454734f3:     	nopw	%cs:(%rax,%rax)
145473500:     	cmpb	$0x1c, (%rdx,%r9)
145473505:     	je	0x145473a43 <.text+0x5472a43>
14547350b:     	addq	$0x40, %r9
14547350f:     	cmpq	%r9, %r8
145473512:     	jne	0x145473500 <.text+0x5472500>
145473514:     	testq	%rcx, %rcx
145473517:     	je	0x145473522 <.text+0x5472522>
145473519:     	jmp	0x14547352a <.text+0x547252a>
14547351b:     	xorl	%ecx, %ecx
14547351d:     	testq	%rcx, %rcx
145473520:     	jne	0x14547352a <.text+0x547252a>
145473522:     	movq	0x40(%rbx), %rcx
145473526:     	movq	0x48(%rbx), %r9
14547352a:     	movq	%rcx, (%rax)
14547352d:     	movq	%r9, 0x8(%rax)
145473531:     	movq	$0x1, 0xb30(%rbp)
14547353c:     	movq	%rax, 0xb38(%rbp)
145473543:     	movq	$0x1, 0xb40(%rbp)
14547354e:     	addq	%rdx, %r8
145473551:     	movb	$0x1, 0xb77(%rbp)
145473558:     	leaq	0xad0(%rbp), %rcx
14547355f:     	callq	0x1454dec80 <.text+0x54ddc80>
145473564:     	nop
145473565:     	movq	0xad0(%rbp), %rax
14547356c:     	movq	%rax, 0xb60(%rbp)
145473573:     	movq	0xad8(%rbp), %rax
14547357a:     	movq	%rax, 0xb68(%rbp)
145473581:     	movq	0xae0(%rbp), %rcx
145473588:     	testq	%rcx, %rcx
14547358b:     	je	0x145473658 <.text+0x5472658>
145473591:     	movq	%rcx, %rax
145473594:     	shlq	$0x4, %rax
145473598:     	movq	0xb68(%rbp), %r12
14547359f:     	addq	%r12, %rax
1454735a2:     	movq	%rax, 0xb50(%rbp)
1454735a9:     	movq	0xb40(%rbp), %r15
1454735b0:     	jmp	0x1454735e0 <.text+0x54725e0>
1454735b2:     	nopw	%cs:(%rax,%rax)
1454735c0:     	movq	%rbx, (%rdi,%r13)
1454735c4:     	movq	%r14, 0x8(%rdi,%r13)
1454735c9:     	incq	%r15
1454735cc:     	movq	%r15, 0xb40(%rbp)
1454735d3:     	addq	$0x10, %r12
1454735d7:     	cmpq	0xb50(%rbp), %r12
1454735de:     	je	0x145473658 <.text+0x5472658>
1454735e0:     	movq	(%r12), %rbx
1454735e4:     	movq	0x8(%r12), %r14
1454735e9:     	movq	0xb38(%rbp), %rdi
1454735f0:     	movq	%r15, %r13
1454735f3:     	shlq	$0x4, %r13
1454735f7:     	testq	%r15, %r15
1454735fa:     	je	0x145473636 <.text+0x5472636>
1454735fc:     	xorl	%esi, %esi
1454735fe:     	jmp	0x145473609 <.text+0x5472609>
145473600:     	addq	$0x10, %rsi
145473604:     	cmpq	%rsi, %r13
145473607:     	je	0x145473630 <.text+0x5472630>
145473609:     	cmpq	%r14, 0x8(%rdi,%rsi)
14547360e:     	jne	0x145473600 <.text+0x5472600>
145473610:     	movq	(%rdi,%rsi), %rcx
145473614:     	movq	%rbx, %rdx
145473617:     	movq	%r14, %r8
14547361a:     	callq	0x1457149f7 <.text+0x57139f7>
14547361f:     	testl	%eax, %eax
145473621:     	jne	0x145473600 <.text+0x5472600>
145473623:     	jmp	0x1454735d3 <.text+0x54725d3>
145473625:     	nopw	%cs:(%rax,%rax)
145473630:     	cmpq	$0x5, %r15
145473634:     	ja	0x1454735d3 <.text+0x54725d3>
145473636:     	cmpq	0xb30(%rbp), %r15
14547363d:     	jne	0x1454735c0 <.text+0x54725c0>
14547363f:     	leaq	0xb30(%rbp), %rcx
145473646:     	callq	0x145717eb0 <.text+0x5716eb0>
14547364b:     	nop
14547364c:     	movq	0xb38(%rbp), %rdi
145473653:     	jmp	0x1454735c0 <.text+0x54725c0>
145473658:     	movq	0xb60(%rbp), %rdx
14547365f:     	testq	%rdx, %rdx
145473662:     	je	0x14547367a <.text+0x547267a>
145473664:     	shlq	$0x4, %rdx
145473668:     	movl	$0x8, %r8d
14547366e:     	movq	0xb68(%rbp), %rcx
145473675:     	callq	0x1400021d0 <.text+0x11d0>
14547367a:     	movq	0xb30(%rbp), %rax
145473681:     	movq	0xb38(%rbp), %rcx
145473688:     	movq	0xb40(%rbp), %rdx
14547368f:     	shlq	$0x4, %rdx
145473693:     	addq	%rcx, %rdx
145473696:     	movq	%rcx, 0xad0(%rbp)
14547369d:     	movq	%rcx, 0xad8(%rbp)
1454736a4:     	movq	%rax, 0xae0(%rbp)
1454736ab:     	movq	%rdx, 0xae8(%rbp)
1454736b2:     	leaq	0x28(%rbp), %rsi
1454736b6:     	movq	%rsi, 0xaf0(%rbp)
1454736bd:     	movb	$0x0, 0xb77(%rbp)
1454736c4:     	leaq	0xaa8(%rbp), %rcx
1454736cb:     	leaq	0xad0(%rbp), %rdx
1454736d2:     	callq	0x1454ea820 <.text+0x54e9820>
1454736d7:     	nop
1454736d8:     	leaq	0x2b8(%rbp), %rdi
1454736df:     	movq	0x2b8(%rbp), %rax
1454736e6:     	testq	%rax, %rax
1454736e9:     	je	0x145473701 <.text+0x5472701>
1454736eb:     	movq	0x2c0(%rbp), %rcx
1454736f2:     	imulq	$0x58, %rax, %rdx
1454736f6:     	movl	$0x8, %r8d
1454736fc:     	callq	0x1400021d0 <.text+0x11d0>
145473701:     	movq	0xab8(%rbp), %rax
145473708:     	movq	%rax, 0x10(%rdi)
14547370c:     	movups	0xaa8(%rbp), %xmm0
145473713:     	movups	%xmm0, (%rdi)
145473716:     	movq	0x728(%rbp), %rdi
14547371d:     	leaq	(,%rdi,4), %rbx
145473725:     	testq	%rdi, %rdi
145473728:     	je	0x145473a0d <.text+0x5472a0d>
14547372e:     	callq	0x140002200 <.text+0x1200>
145473733:     	movl	$0x4, %edx
145473738:     	movq	%rbx, %rcx
14547373b:     	callq	0x1400021f0 <.text+0x11f0>
145473740:     	testq	%rax, %rax
145473743:     	je	0x145473b0f <.text+0x5472b0f>
145473749:     	movq	%rax, %r14
14547374c:     	movq	0x90(%rbp), %rdx
145473753:     	testq	%rdx, %rdx
145473756:     	je	0x14547376e <.text+0x547276e>
145473758:     	movq	0x98(%rbp), %rcx
14547375f:     	shlq	$0x2, %rdx
145473763:     	movl	$0x4, %r8d
145473769:     	callq	0x1400021d0 <.text+0x11d0>
14547376e:     	movq	%rdi, 0x90(%rbp)
145473775:     	movq	%r14, 0x98(%rbp)
14547377c:     	movq	%rdi, 0xa0(%rbp)
145473783:     	testq	%rdi, %rdi
145473786:     	je	0x145473a28 <.text+0x5472a28>
14547378c:     	callq	0x140002200 <.text+0x1200>
145473791:     	movl	$0x4, %edx
145473796:     	movq	%rbx, %rcx
145473799:     	callq	0x1400021f0 <.text+0x11f0>
14547379e:     	testq	%rax, %rax
1454737a1:     	je	0x145473b26 <.text+0x5472b26>
1454737a7:     	movq	%rax, %r14
1454737aa:     	movq	0xa8(%rbp), %rdx
1454737b1:     	testq	%rdx, %rdx
1454737b4:     	je	0x1454737cc <.text+0x54727cc>
1454737b6:     	movq	0xb0(%rbp), %rcx
1454737bd:     	shlq	$0x2, %rdx
1454737c1:     	movl	$0x4, %r8d
1454737c7:     	callq	0x1400021d0 <.text+0x11d0>
1454737cc:     	movq	%rdi, 0xa8(%rbp)
1454737d3:     	movq	%r14, 0xb0(%rbp)
1454737da:     	movq	%rdi, 0xb8(%rbp)
1454737e1:     	movq	$0x0, 0xad0(%rbp)
1454737ec:     	movq	$0x4, 0xad8(%rbp)
1454737f7:     	movq	$0x0, 0xae0(%rbp)
145473802:     	movb	$0x0, 0xb77(%rbp)
145473809:     	leaq	0xaa8(%rbp), %rcx
145473810:     	leaq	0xad0(%rbp), %rdx
145473817:     	movq	%rdi, %r8
14547381a:     	callq	0x144b893e0 <.text+0x4b883e0>
14547381f:     	nop
145473820:     	movq	0xd0(%rbp), %rdi
145473827:     	testq	%rdi, %rdi
14547382a:     	je	0x145473866 <.text+0x5472866>
14547382c:     	movq	0xc8(%rbp), %rbx
145473833:     	addq	$0x8, %rbx
145473837:     	jmp	0x145473849 <.text+0x5472849>
145473839:     	nopl	(%rax)
145473840:     	addq	$0x18, %rbx
145473844:     	decq	%rdi
145473847:     	je	0x145473866 <.text+0x5472866>
145473849:     	movq	-0x8(%rbx), %rdx
14547384d:     	testq	%rdx, %rdx
145473850:     	je	0x145473840 <.text+0x5472840>
145473852:     	movq	(%rbx), %rcx
145473855:     	shlq	$0x2, %rdx
145473859:     	movl	$0x4, %r8d
14547385f:     	callq	0x1400021d0 <.text+0x11d0>
145473864:     	jmp	0x145473840 <.text+0x5472840>
145473866:     	leaq	0xc0(%rbp), %rdi
14547386d:     	movq	0xc0(%rbp), %rax
145473874:     	testq	%rax, %rax
145473877:     	je	0x145473893 <.text+0x5472893>
145473879:     	movq	0xc8(%rbp), %rcx
145473880:     	shlq	$0x3, %rax
145473884:     	leaq	(%rax,%rax,2), %rdx
145473888:     	movl	$0x8, %r8d
14547388e:     	callq	0x1400021d0 <.text+0x11d0>
145473893:     	movq	0xab8(%rbp), %rax
14547389a:     	movq	%rax, 0x10(%rdi)
14547389e:     	movups	0xaa8(%rbp), %xmm0
1454738a5:     	movups	%xmm0, (%rdi)
1454738a8:     	movq	0x720(%rbp), %rdx
1454738af:     	movq	0x728(%rbp), %r8
1454738b6:     	shlq	$0x6, %r8
1454738ba:     	addq	%rdx, %r8
1454738bd:     	movb	$0x0, 0xb77(%rbp)
1454738c4:     	leaq	0xad0(%rbp), %rcx
1454738cb:     	callq	0x1454df930 <.text+0x54de930>
1454738d0:     	nop
1454738d1:     	movq	0xad0(%rbp), %rax
1454738d8:     	movq	0xad8(%rbp), %rcx
1454738df:     	movq	0xae0(%rbp), %rdx
1454738e6:     	leaq	(%rdx,%rdx,2), %rdx
1454738ea:     	leaq	(%rcx,%rdx,8), %rdx
1454738ee:     	movq	%rcx, 0xad0(%rbp)
1454738f5:     	movq	%rcx, 0xad8(%rbp)
1454738fc:     	movq	%rax, 0xae0(%rbp)
145473903:     	movq	%rdx, 0xae8(%rbp)
14547390a:     	movq	%rsi, 0xaf0(%rbp)
145473911:     	movb	$0x0, 0xb77(%rbp)
145473918:     	leaq	0xaa8(%rbp), %rcx
14547391f:     	leaq	0xad0(%rbp), %rdx
145473926:     	callq	0x1454eabc0 <.text+0x54e9bc0>
14547392b:     	nop
14547392c:     	leaq	0xd8(%rbp), %rsi
145473933:     	movq	0xd8(%rbp), %rax
14547393a:     	testq	%rax, %rax
14547393d:     	je	0x145473959 <.text+0x5472959>
14547393f:     	movq	0xe0(%rbp), %rcx
145473946:     	shlq	$0x5, %rax
14547394a:     	leaq	(%rax,%rax,2), %rdx
14547394e:     	movl	$0x8, %r8d
145473954:     	callq	0x1400021d0 <.text+0x11d0>
145473959:     	movq	0xab8(%rbp), %rax
145473960:     	movq	%rax, 0x10(%rsi)
145473964:     	movups	0xaa8(%rbp), %xmm0
14547396b:     	movups	%xmm0, (%rsi)
14547396e:     	movb	$0x0, 0xb77(%rbp)
145473975:     	leaq	0x28(%rbp), %rcx
145473979:     	callq	0x14546be80 <.text+0x546ae80>
14547397e:     	nop
14547397f:     	movss	0x480(%rbp), %xmm0
145473987:     	movss	%xmm0, 0x428(%rbp)
14547398f:     	leaq	0x28(%rbp), %rdx
145473993:     	movl	$0x950, %r8d            # imm = 0x950
145473999:     	movq	0xa80(%rbp), %rsi
1454739a0:     	movq	%rsi, %rcx
1454739a3:     	callq	0x1457149fd <.text+0x57139fd>
1454739a8:     	movq	%rsi, %rax
1454739ab:     	movaps	0xb80(%rbp), %xmm6
1454739b2:     	movaps	0xb90(%rbp), %xmm7
1454739b9:     	movaps	0xba0(%rbp), %xmm8
1454739c1:     	movaps	0xbb0(%rbp), %xmm9
1454739c9:     	movaps	0xbc0(%rbp), %xmm10
1454739d1:     	movaps	0xbd0(%rbp), %xmm11
1454739d9:     	movaps	0xbe0(%rbp), %xmm12
1454739e1:     	movaps	0xbf0(%rbp), %xmm13
1454739e9:     	movaps	0xc00(%rbp), %xmm14
1454739f1:     	movaps	0xc10(%rbp), %xmm15
1454739f9:     	addq	$0xca8, %rsp            # imm = 0xCA8
145473a00:     	popq	%rbx
145473a01:     	popq	%rdi
145473a02:     	popq	%rsi
145473a03:     	popq	%r12
145473a05:     	popq	%r13
145473a07:     	popq	%r14
145473a09:     	popq	%r15
145473a0b:     	popq	%rbp
145473a0c:     	retq
145473a0d:     	movl	$0x4, %r14d
145473a13:     	movq	0x90(%rbp), %rdx
145473a1a:     	testq	%rdx, %rdx
145473a1d:     	jne	0x145473758 <.text+0x5472758>
145473a23:     	jmp	0x14547376e <.text+0x547276e>
145473a28:     	movl	$0x4, %r14d
145473a2e:     	movq	0xa8(%rbp), %rdx
145473a35:     	testq	%rdx, %rdx
145473a38:     	jne	0x1454737b6 <.text+0x54727b6>
145473a3e:     	jmp	0x1454737cc <.text+0x54727cc>
145473a43:     	movq	0x8(%rdx,%r9), %rcx
145473a48:     	movq	0x10(%rdx,%r9), %r9
145473a4d:     	testq	%rcx, %rcx
145473a50:     	je	0x145473522 <.text+0x5472522>
145473a56:     	jmp	0x14547352a <.text+0x547252a>
145473a5b:     	movb	$0x1, 0xb76(%rbp)
145473a62:     	movb	$0x1, 0xb75(%rbp)
145473a69:     	movl	$0x8, %ecx
145473a6e:     	movl	$0x58, %edx
145473a73:     	callq	0x1458a3b71 <.text+0x58a2b71>
145473a78:     	nop
145473a79:     	jmp	0x145473b3b <.text+0x5472b3b>
145473a7e:     	movl	$0x8, %ecx
145473a83:     	movl	$0x10, %edx
145473a88:     	callq	0x1458a3b71 <.text+0x58a2b71>
145473a8d:     	nop
145473a8e:     	jmp	0x145473b3b <.text+0x5472b3b>
145473a93:     	leaq	0xad0(%rbp), %rax
145473a9a:     	movq	%rax, 0x28(%rbp)
145473a9e:     	leaq	-0x54719e5(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145473aa5:     	movq	%rax, 0x30(%rbp)
145473aa9:     	movb	$0x1, 0xb76(%rbp)
145473ab0:     	movb	$0x1, 0xb75(%rbp)
145473ab7:     	leaq	0x12612aa(%rip), %rcx   # 0x1466d4d68
145473abe:     	leaq	0x12612b3(%rip), %r8    # 0x1466d4d78
145473ac5:     	leaq	0x28(%rbp), %rdx
145473ac9:     	callq	0x1458a4100 <.text+0x58a3100>
145473ace:     	nop
145473acf:     	jmp	0x145473b3b <.text+0x5472b3b>
145473ad1:     	leaq	0xad0(%rbp), %rax
145473ad8:     	movq	%rax, 0x28(%rbp)
145473adc:     	leaq	-0x5471a23(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145473ae3:     	movq	%rax, 0x30(%rbp)
145473ae7:     	movb	$0x1, 0xb76(%rbp)
145473aee:     	movb	$0x1, 0xb75(%rbp)
145473af5:     	leaq	0x126126c(%rip), %rcx   # 0x1466d4d68
145473afc:     	leaq	0x1261275(%rip), %r8    # 0x1466d4d78
145473b03:     	leaq	0x28(%rbp), %rdx
145473b07:     	callq	0x1458a4100 <.text+0x58a3100>
145473b0c:     	nop
145473b0d:     	jmp	0x145473b3b <.text+0x5472b3b>
145473b0f:     	movb	$0x0, 0xb77(%rbp)
145473b16:     	movl	$0x4, %ecx
145473b1b:     	movq	%rbx, %rdx
145473b1e:     	callq	0x1458a3b8b <.text+0x58a2b8b>
145473b23:     	nop
145473b24:     	jmp	0x145473b3b <.text+0x5472b3b>
145473b26:     	movb	$0x0, 0xb77(%rbp)
145473b2d:     	movl	$0x4, %ecx
145473b32:     	movq	%rbx, %rdx
145473b35:     	callq	0x1458a3b8b <.text+0x58a2b8b>
145473b3a:     	nop
145473b3b:     	ud2

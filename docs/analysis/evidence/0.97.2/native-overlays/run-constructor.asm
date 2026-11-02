
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14549bb90:     	pushq	%rbp
14549bb91:     	pushq	%r15
14549bb93:     	pushq	%r14
14549bb95:     	pushq	%r13
14549bb97:     	pushq	%r12
14549bb99:     	pushq	%rsi
14549bb9a:     	pushq	%rdi
14549bb9b:     	pushq	%rbx
14549bb9c:     	subq	$0xcb8, %rsp            # imm = 0xCB8
14549bba3:     	leaq	0x80(%rsp), %rbp
14549bbab:     	movaps	%xmm15, 0xc20(%rbp)
14549bbb3:     	movaps	%xmm14, 0xc10(%rbp)
14549bbbb:     	movaps	%xmm13, 0xc00(%rbp)
14549bbc3:     	movaps	%xmm12, 0xbf0(%rbp)
14549bbcb:     	movaps	%xmm11, 0xbe0(%rbp)
14549bbd3:     	movaps	%xmm10, 0xbd0(%rbp)
14549bbdb:     	movaps	%xmm9, 0xbc0(%rbp)
14549bbe3:     	movaps	%xmm8, 0xbb0(%rbp)
14549bbeb:     	movaps	%xmm7, 0xba0(%rbp)
14549bbf2:     	movaps	%xmm6, 0xb90(%rbp)
14549bbf9:     	movq	$-0x2, 0xb88(%rbp)
14549bc04:     	movq	%r8, 0xb40(%rbp)
14549bc0b:     	movq	%rdx, %rsi
14549bc0e:     	movq	%r8, 0xaa8(%rbp)
14549bc15:     	movzbl	0x16c(%rdx), %edx
14549bc1c:     	leal	-0x2(%rdx), %eax
14549bc1f:     	cmpb	$0x9, %al
14549bc21:     	movq	%rcx, 0xa90(%rbp)
14549bc28:     	movq	%rdx, 0xb68(%rbp)
14549bc2f:     	ja	0x14549bc41 <.text+0x549ac41>
14549bc31:     	movzbl	%al, %eax
14549bc34:     	leaq	0x1510ded(%rip), %rcx   # 0x1469aca28
14549bc3b:     	movq	(%rcx,%rax,8), %rdi
14549bc3f:     	jmp	0x14549bc48 <.text+0x549ac48>
14549bc41:     	leaq	0x127cb20(%rip), %rdi   # 0x146718768
14549bc48:     	movl	0xec(%rsi), %r12d
14549bc4f:     	movq	0xf8(%rsi), %rcx
14549bc56:     	movq	0x100(%rsi), %rdx
14549bc5d:     	callq	0x14540e820 <.text+0x540d820>
14549bc62:     	movq	%rax, %r14
14549bc65:     	movq	%rsi, 0xb78(%rbp)
14549bc6c:     	leaq	0x18(%rsi), %rdx
14549bc70:     	movb	$0x1, 0xb84(%rbp)
14549bc77:     	leaq	-0x58(%rbp), %rcx
14549bc7b:     	callq	0x145415d10 <.text+0x5414d10>
14549bc80:     	nop
14549bc81:     	imulq	$0xf0, %r14, %rax
14549bc88:     	leaq	0x127a7a9(%rip), %r13   # 0x146716438
14549bc8f:     	addq	%rax, %r13
14549bc92:     	movq	0x40(%rdi), %r14
14549bc96:     	movq	%rdi, 0xb70(%rbp)
14549bc9d:     	movq	0x48(%rdi), %r15
14549bca1:     	movq	%r14, 0xae0(%rbp)
14549bca8:     	movq	%r15, 0xae8(%rbp)
14549bcaf:     	xorl	%ebx, %ebx
14549bcb1:     	leaq	0x127ddb0(%rip), %rsi   # 0x146719a68
14549bcb8:     	jmp	0x14549bcd1 <.text+0x549acd1>
14549bcba:     	nopw	(%rax,%rax)
14549bcc0:     	addq	$0x78, %rbx
14549bcc4:     	cmpq	$0x3480, %rbx           # imm = 0x3480
14549bccb:     	je	0x14549ce53 <.text+0x549be53>
14549bcd1:     	cmpq	%r15, 0x8(%rbx,%rsi)
14549bcd6:     	jne	0x14549bcc0 <.text+0x549acc0>
14549bcd8:     	movq	(%rbx,%rsi), %rcx
14549bcdc:     	movq	%r14, %rdx
14549bcdf:     	movq	%r15, %r8
14549bce2:     	callq	0x145756dd7 <.text+0x5755dd7>
14549bce7:     	testl	%eax, %eax
14549bce9:     	jne	0x14549bcc0 <.text+0x549acc0>
14549bceb:     	movq	0xb78(%rbp), %rax
14549bcf2:     	movzbl	0x16d(%rax), %r14d
14549bcfa:     	leal	-0x2(%r14), %eax
14549bcfe:     	cmpb	$0x6, %al
14549bd00:     	movl	%r12d, 0xadc(%rbp)
14549bd07:     	ja	0x14549bd19 <.text+0x549ad19>
14549bd09:     	movzbl	%al, %eax
14549bd0c:     	leaq	0x1510cdd(%rip), %rcx   # 0x1469ac9f0
14549bd13:     	movq	(%rcx,%rax,8), %rax
14549bd17:     	jmp	0x14549bd20 <.text+0x549ad20>
14549bd19:     	leaq	0x127b8d8(%rip), %rax   # 0x1467175f8
14549bd20:     	addq	%rsi, %rbx
14549bd23:     	movq	0x30(%rax), %r15
14549bd27:     	movq	0x38(%rax), %r12
14549bd2b:     	movq	%r15, 0xae0(%rbp)
14549bd32:     	movq	%r12, 0xae8(%rbp)
14549bd39:     	xorl	%edi, %edi
14549bd3b:     	jmp	0x14549bd51 <.text+0x549ad51>
14549bd3d:     	nopl	(%rax)
14549bd40:     	addq	$0x78, %rdi
14549bd44:     	cmpq	$0x3480, %rdi           # imm = 0x3480
14549bd4b:     	je	0x14549ce91 <.text+0x549be91>
14549bd51:     	cmpq	%r12, 0x8(%rdi,%rsi)
14549bd56:     	jne	0x14549bd40 <.text+0x549ad40>
14549bd58:     	movq	(%rdi,%rsi), %rcx
14549bd5c:     	movq	%r15, %rdx
14549bd5f:     	movq	%r12, %r8
14549bd62:     	callq	0x145756dd7 <.text+0x5755dd7>
14549bd67:     	testl	%eax, %eax
14549bd69:     	jne	0x14549bd40 <.text+0x549ad40>
14549bd6b:     	movsd	0xc8(%r13), %xmm6
14549bd74:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
14549bd79:     	movq	0xb40(%rbp), %r15
14549bd80:     	leaq	0x10(%r15), %rcx
14549bd84:     	movb	$0x1, 0xb86(%rbp)
14549bd8b:     	movb	$0x1, 0xb85(%rbp)
14549bd92:     	movaps	%xmm6, %xmm1
14549bd95:     	movaps	%xmm8, %xmm2
14549bd99:     	callq	0x1454627f0 <.text+0x54617f0>
14549bd9e:     	nop
14549bd9f:     	testb	$0x1, %al
14549bda1:     	je	0x14549bda8 <.text+0x549ada8>
14549bda3:     	movaps	%xmm0, %xmm7
14549bda6:     	jmp	0x14549bde8 <.text+0x549ade8>
14549bda8:     	cmpq	$-0x1, 0x68(%r15)
14549bdad:     	je	0x14549bddf <.text+0x549addf>
14549bdaf:     	leaq	0x68(%r15), %rdx
14549bdb3:     	movb	$0x1, 0xb86(%rbp)
14549bdba:     	movb	$0x1, 0xb85(%rbp)
14549bdc1:     	leaq	0x28(%rbp), %rcx
14549bdc5:     	movaps	%xmm6, %xmm2
14549bdc8:     	movaps	%xmm8, %xmm3
14549bdcc:     	callq	0x145467bf0 <.text+0x5466bf0>
14549bdd1:     	nop
14549bdd2:     	cmpl	$0x1, 0x28(%rbp)
14549bdd6:     	jne	0x14549bddf <.text+0x549addf>
14549bdd8:     	movss	0x34(%rbp), %xmm7
14549bddd:     	jmp	0x14549bde8 <.text+0x549ade8>
14549bddf:     	movss	0x90(%r15), %xmm7
14549bde8:     	movq	0xb78(%rbp), %rax
14549bdef:     	movq	0x110(%rax), %rdx
14549bdf6:     	movb	$0x1, 0xb86(%rbp)
14549bdfd:     	movb	$0x1, 0xb85(%rbp)
14549be04:     	leaq	0x8(%rbp), %rcx
14549be08:     	callq	0x14550a2b0 <.text+0x55092b0>
14549be0d:     	nop
14549be0e:     	movq	0xb78(%rbp), %r15
14549be15:     	movq	0x108(%r15), %r12
14549be1c:     	movss	0xd4(%r13), %xmm10
14549be25:     	movq	0xb70(%rbp), %rax
14549be2c:     	movss	0x80(%rax), %xmm9
14549be35:     	callq	0x140002200 <.text+0x1200>
14549be3a:     	movl	$0x58, %ecx
14549be3f:     	movl	$0x8, %edx
14549be44:     	callq	0x1400021c0 <.text+0x11c0>
14549be49:     	testq	%rax, %rax
14549be4c:     	je	0x14549ce1b <.text+0x549be1b>
14549be52:     	movq	%rbx, (%rax)
14549be55:     	movl	$0x1, 0x8(%rax)
14549be5c:     	movsd	0x45cebb(%rip), %xmm12  # 0x1458f8d20
14549be65:     	movsd	%xmm12, 0xc(%rax)
14549be6b:     	movq	$0x3f800000, 0x14(%rax) # imm = 0x3F800000
14549be73:     	movsd	0x44f6c4(%rip), %xmm13  # 0x1458eb540
14549be7c:     	movsd	%xmm13, 0x1c(%rax)
14549be82:     	xorps	%xmm0, %xmm0
14549be85:     	movups	%xmm0, 0x24(%rax)
14549be89:     	movl	$0x0, 0x34(%rax)
14549be90:     	movsd	%xmm13, 0x38(%rax)
14549be96:     	movl	$0x0, 0x40(%rax)
14549be9d:     	movaps	0x45ce8b(%rip), %xmm11  # 0x1458f8d30
14549bea5:     	movq	%rax, 0xab0(%rbp)
14549beac:     	movups	%xmm11, 0x44(%rax)
14549beb1:     	movq	$0x0, 0xb48(%rbp)
14549bebc:     	movq	$0x8, 0xb50(%rbp)
14549bec7:     	movq	$0x0, 0xb58(%rbp)
14549bed2:     	movq	%r15, %rax
14549bed5:     	addq	$0x120, %r15            # imm = 0x120
14549bedc:     	addq	$0x30, %rax
14549bee0:     	movq	%rax, 0x20(%rsp)
14549bee5:     	leaq	0xae0(%rbp), %rcx
14549beec:     	movl	%r14d, %edx
14549beef:     	movq	0xb68(%rbp), %r8
14549bef6:     	movq	%r15, %r9
14549bef9:     	callq	0x145459e90 <.text+0x5458e90>
14549befe:     	nop
14549beff:     	leaq	0xab8(%rbp), %rcx
14549bf06:     	movq	%r15, %rdx
14549bf09:     	callq	0x14545b740 <.text+0x545a740>
14549bf0e:     	nop
14549bf0f:     	addq	%rdi, %rsi
14549bf12:     	movq	0xb70(%rbp), %rbx
14549bf19:     	movss	0x80(%rbx), %xmm15
14549bf22:     	movss	0x84(%rbx), %xmm14
14549bf2b:     	movq	0xb78(%rbp), %rdx
14549bf32:     	movl	0xe8(%rdx), %edi
14549bf38:     	addl	$0x3, %edi
14549bf3b:     	movq	$-0x1, 0x330(%rbp)
14549bf46:     	movups	0xb48(%rbp), %xmm0
14549bf4d:     	movups	%xmm0, 0x2e8(%rbp)
14549bf54:     	movq	0xb58(%rbp), %rax
14549bf5b:     	movq	%rax, 0x2f8(%rbp)
14549bf62:     	movups	0xae0(%rbp), %xmm0
14549bf69:     	movups	0xaf0(%rbp), %xmm1
14549bf70:     	movups	0xb00(%rbp), %xmm2
14549bf77:     	movups	0xb10(%rbp), %xmm3
14549bf7e:     	movups	%xmm0, 0x434(%rbp)
14549bf85:     	movups	%xmm1, 0x444(%rbp)
14549bf8c:     	movups	%xmm2, 0x454(%rbp)
14549bf93:     	movups	%xmm3, 0x464(%rbp)
14549bf9a:     	movups	0xb1c(%rbp), %xmm0
14549bfa1:     	movups	%xmm0, 0x470(%rbp)
14549bfa8:     	movups	0xab8(%rbp), %xmm0
14549bfaf:     	movups	%xmm0, 0x300(%rbp)
14549bfb6:     	movq	0xac8(%rbp), %rax
14549bfbd:     	movq	%rax, 0x310(%rbp)
14549bfc4:     	xorps	%xmm8, %xmm8
14549bfc8:     	movups	%xmm8, 0x3c4(%rbp)
14549bfd0:     	movl	$0x0, 0x3d4(%rbp)
14549bfda:     	leaq	0x140(%rbp), %rcx
14549bfe1:     	movl	$0x178, %r8d            # imm = 0x178
14549bfe7:     	callq	0x145756ddd <.text+0x5755ddd>
14549bfec:     	movaps	%xmm8, 0xa70(%rbp)
14549bff4:     	movq	$0x0, 0xa80(%rbp)
14549bfff:     	movups	%xmm8, 0x990(%rbp)
14549c007:     	movups	%xmm8, 0xb4c(%rbp)
14549c00f:     	movups	%xmm8, 0xb58(%rbp)
14549c017:     	movaps	%xmm8, 0xa50(%rbp)
14549c01f:     	movaps	%xmm8, 0xa60(%rbp)
14549c027:     	movl	$0x0, 0xaa0(%rbp)
14549c031:     	movq	$0x0, 0xa98(%rbp)
14549c03c:     	movups	-0x8(%rbp), %xmm0
14549c040:     	movaps	%xmm0, 0xb30(%rbp)
14549c047:     	movups	-0x18(%rbp), %xmm0
14549c04b:     	movaps	%xmm0, 0xb20(%rbp)
14549c052:     	movups	-0x58(%rbp), %xmm0
14549c056:     	movups	-0x48(%rbp), %xmm1
14549c05a:     	movups	-0x38(%rbp), %xmm2
14549c05e:     	movups	-0x28(%rbp), %xmm3
14549c062:     	movaps	%xmm3, 0xb10(%rbp)
14549c069:     	movaps	%xmm2, 0xb00(%rbp)
14549c070:     	movaps	%xmm1, 0xaf0(%rbp)
14549c077:     	movaps	%xmm0, 0xae0(%rbp)
14549c07e:     	movaps	%xmm8, 0x9f0(%rbp)
14549c086:     	movaps	%xmm8, 0xa00(%rbp)
14549c08e:     	movaps	%xmm8, 0xa10(%rbp)
14549c096:     	movaps	%xmm8, 0xa20(%rbp)
14549c09e:     	movaps	%xmm8, 0xa30(%rbp)
14549c0a6:     	movaps	%xmm8, 0xa40(%rbp)
14549c0ae:     	movaps	%xmm8, 0x9a0(%rbp)
14549c0b6:     	movups	%xmm8, 0xac0(%rbp)
14549c0be:     	movups	%xmm8, 0xacc(%rbp)
14549c0c6:     	movaps	%xmm8, 0x9b0(%rbp)
14549c0ce:     	movaps	%xmm8, 0x9c0(%rbp)
14549c0d6:     	movaps	%xmm8, 0x9d0(%rbp)
14549c0de:     	movaps	%xmm8, 0x9e0(%rbp)
14549c0e6:     	movups	0x8(%rbp), %xmm0
14549c0ea:     	movups	0x18(%rbp), %xmm1
14549c0ee:     	movups	%xmm1, 0x8b8(%rbp)
14549c0f5:     	movups	%xmm0, 0x8a8(%rbp)
14549c0fc:     	movb	$0x0, 0x987(%rbp)
14549c103:     	movq	$0x1, 0x2b8(%rbp)
14549c10e:     	movq	0xab0(%rbp), %rax
14549c115:     	movq	%rax, 0x2c0(%rbp)
14549c11c:     	movq	$0x1, 0x2c8(%rbp)
14549c127:     	movq	$0x0, 0x2d0(%rbp)
14549c132:     	movq	$0x8, 0x2d8(%rbp)
14549c13d:     	movq	$0x0, 0x2e0(%rbp)
14549c148:     	movq	$0x0, 0x318(%rbp)
14549c153:     	movq	$0x4, 0x320(%rbp)
14549c15e:     	movq	$0x0, 0x328(%rbp)
14549c169:     	movq	%rsi, 0x3a0(%rbp)
14549c170:     	movl	$0x1, 0x3a8(%rbp)
14549c17a:     	movsd	%xmm12, 0x3ac(%rbp)
14549c183:     	movq	$0x3f800000, 0x3b4(%rbp) # imm = 0x3F800000
14549c18e:     	movsd	%xmm13, 0x3bc(%rbp)
14549c197:     	movsd	%xmm13, 0x3d8(%rbp)
14549c1a0:     	movl	$0x0, 0x3e0(%rbp)
14549c1aa:     	movups	%xmm11, 0x3e4(%rbp)
14549c1b2:     	movq	%r12, 0x3f8(%rbp)
14549c1b9:     	movl	$0x0, 0x400(%rbp)
14549c1c3:     	movsd	0x52bcf5(%rip), %xmm0   # 0x1459c7ec0
14549c1cb:     	movsd	%xmm0, 0x404(%rbp)
14549c1d3:     	movl	$0x0, 0x40c(%rbp)
14549c1dd:     	movlps	%xmm6, 0x410(%rbp)
14549c1e4:     	movss	%xmm7, 0x418(%rbp)
14549c1ec:     	movss	%xmm10, 0x41c(%rbp)
14549c1f5:     	movq	$0x1, 0x420(%rbp)
14549c200:     	movss	%xmm9, 0x428(%rbp)
14549c209:     	movq	$0x0, 0x42c(%rbp)
14549c214:     	movss	%xmm15, 0x480(%rbp)
14549c21d:     	movaps	0x150e0bc(%rip), %xmm0  # 0x1469aa2e0
14549c224:     	movups	%xmm0, 0x484(%rbp)
14549c22b:     	movsd	0x150e0bd(%rip), %xmm0  # 0x1469aa2f0
14549c233:     	movsd	%xmm0, 0x494(%rbp)
14549c23b:     	movl	$0x3f800000, 0x49c(%rbp) # imm = 0x3F800000
14549c245:     	movss	%xmm14, 0x4a0(%rbp)
14549c24e:     	movups	%xmm11, 0x4a4(%rbp)
14549c256:     	movups	%xmm8, 0x4c4(%rbp)
14549c25e:     	movups	%xmm8, 0x4b4(%rbp)
14549c266:     	movl	%edi, 0x4d4(%rbp)
14549c26c:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
14549c276:     	movq	%rax, 0x4d8(%rbp)
14549c27d:     	movsd	0x150e07b(%rip), %xmm0  # 0x1469aa300
14549c285:     	movsd	%xmm0, 0x4e0(%rbp)
14549c28d:     	movq	$0x0, 0x4e8(%rbp)
14549c298:     	movq	$0x8, 0x4f0(%rbp)
14549c2a3:     	movups	%xmm8, 0x4f8(%rbp)
14549c2ab:     	movq	$0x8, 0x508(%rbp)
14549c2b6:     	movups	%xmm8, 0x510(%rbp)
14549c2be:     	movq	$0x8, 0x520(%rbp)
14549c2c9:     	movups	%xmm8, 0x528(%rbp)
14549c2d1:     	movq	$0x8, 0x538(%rbp)
14549c2dc:     	movups	%xmm8, 0x540(%rbp)
14549c2e4:     	movq	$0x8, 0x550(%rbp)
14549c2ef:     	movq	$0x0, 0x558(%rbp)
14549c2fa:     	movq	0xb40(%rbp), %rax
14549c301:     	movq	%rax, 0x8a0(%rbp)
14549c308:     	movq	$0x0, 0x8c8(%rbp)
14549c313:     	movq	$0x0, 0x90c(%rbp)
14549c31e:     	movq	$0x0, 0x560(%rbp)
14549c329:     	movq	$0x8, 0x568(%rbp)
14549c334:     	movups	%xmm8, 0x570(%rbp)
14549c33c:     	movq	$0x8, 0x580(%rbp)
14549c347:     	movups	%xmm8, 0x588(%rbp)
14549c34f:     	movq	$0x8, 0x598(%rbp)
14549c35a:     	movups	%xmm8, 0x5a0(%rbp)
14549c362:     	movups	%xmm8, 0x914(%rbp)
14549c36a:     	movq	$0x8, 0x5b0(%rbp)
14549c375:     	movq	$0x0, 0x28(%rbp)
14549c37d:     	movabsq	$0x232800000000, %rax   # imm = 0x232800000000
14549c387:     	movq	%rax, 0x924(%rbp)
14549c38e:     	movups	%xmm8, 0x5b8(%rbp)
14549c396:     	movq	$0x4, 0x5c8(%rbp)
14549c3a1:     	movups	%xmm8, 0x5d0(%rbp)
14549c3a9:     	movq	$0x8, 0x5e0(%rbp)
14549c3b4:     	movq	$0x0, 0x5e8(%rbp)
14549c3bf:     	movq	$0x0, 0x38(%rbp)
14549c3c7:     	movl	$0x0, 0x860(%rbp)
14549c3d1:     	movq	$0x0, 0x868(%rbp)
14549c3dc:     	movq	$0x1, 0x870(%rbp)
14549c3e7:     	movq	$0x0, 0x878(%rbp)
14549c3f2:     	movq	$0x0, 0x5f0(%rbp)
14549c3fd:     	movq	$0x8, 0x5f8(%rbp)
14549c408:     	movaps	0xa50(%rbp), %xmm0
14549c40f:     	movups	%xmm0, 0x600(%rbp)
14549c416:     	movq	$0x8, 0x610(%rbp)
14549c421:     	movaps	0xa60(%rbp), %xmm0
14549c428:     	movups	%xmm0, 0x618(%rbp)
14549c42f:     	movq	$0x8, 0x628(%rbp)
14549c43a:     	movq	$0x0, 0x630(%rbp)
14549c445:     	movaps	0xa70(%rbp), %xmm0
14549c44c:     	movups	%xmm0, 0x638(%rbp)
14549c453:     	movq	0xa80(%rbp), %rax
14549c45a:     	movq	%rax, 0x648(%rbp)
14549c461:     	movq	0x998(%rbp), %rax
14549c468:     	movq	%rax, 0x660(%rbp)
14549c46f:     	movups	0x988(%rbp), %xmm0
14549c476:     	movups	%xmm0, 0x650(%rbp)
14549c47d:     	movq	$0x0, 0x670(%rbp)
14549c488:     	movl	$0x2, 0x67c(%rbp)
14549c492:     	movups	0xb48(%rbp), %xmm0
14549c499:     	movups	0xb58(%rbp), %xmm1
14549c4a0:     	movups	%xmm1, 0x690(%rbp)
14549c4a7:     	movups	%xmm0, 0x680(%rbp)
14549c4ae:     	movabsq	$0x10000000a, %rax      # imm = 0x10000000A
14549c4b8:     	movq	%rax, 0x92c(%rbp)
14549c4bf:     	movss	0x45a165(%rip), %xmm0   # 0x1458f662c
14549c4c7:     	movlps	%xmm0, 0x934(%rbp)
14549c4ce:     	movl	$0x42700000, 0x93c(%rbp) # imm = 0x42700000
14549c4d8:     	movb	$-0x1, 0x986(%rbp)
14549c4df:     	movq	$0x0, 0x8d0(%rbp)
14549c4ea:     	movl	0xaa0(%rbp), %eax
14549c4f0:     	movl	%eax, 0x948(%rbp)
14549c4f6:     	movq	0xa98(%rbp), %rax
14549c4fd:     	movq	%rax, 0x940(%rbp)
14549c504:     	movsd	0x150de04(%rip), %xmm0  # 0x1469aa310
14549c50c:     	movsd	%xmm0, 0x94c(%rbp)
14549c514:     	movabsq	$0x1442700000, %rax     # imm = 0x1442700000
14549c51e:     	movq	%rax, 0x954(%rbp)
14549c525:     	movq	$0x0, 0x6a0(%rbp)
14549c530:     	movq	$0x4, 0x6a8(%rbp)
14549c53b:     	movq	$0x0, 0x6b0(%rbp)
14549c546:     	movl	$0x0, 0x880(%rbp)
14549c550:     	movl	$0x0, 0x888(%rbp)
14549c55a:     	movq	$0x0, 0x8f0(%rbp)
14549c565:     	movups	%xmm8, 0x8d8(%rbp)
14549c56d:     	movq	$0x0, 0x6b8(%rbp)
14549c578:     	movq	$0x4, 0x6c0(%rbp)
14549c583:     	movups	%xmm8, 0x6c8(%rbp)
14549c58b:     	movq	$0x4, 0x6d8(%rbp)
14549c596:     	movq	$0x0, 0x6e0(%rbp)
14549c5a1:     	movl	$0x0, 0x978(%rbp)
14549c5ab:     	movb	$0x0, 0x97c(%rbp)
14549c5b2:     	movl	$0x0, 0x8f8(%rbp)
14549c5bc:     	movl	$0x0, 0x890(%rbp)
14549c5c6:     	movl	$0x0, 0x898(%rbp)
14549c5d0:     	movaps	0x150dd49(%rip), %xmm0  # 0x1469aa320
14549c5d7:     	movups	%xmm0, 0x95c(%rbp)
14549c5de:     	movb	$0x0, 0x981(%rbp)
14549c5e5:     	movl	$0x0, 0x97d(%rbp)
14549c5ef:     	movaps	0xb30(%rbp), %xmm0
14549c5f6:     	movups	%xmm0, 0x738(%rbp)
14549c5fd:     	movaps	0xb20(%rbp), %xmm0
14549c604:     	movups	%xmm0, 0x728(%rbp)
14549c60b:     	movaps	0xae0(%rbp), %xmm0
14549c612:     	movaps	0xaf0(%rbp), %xmm1
14549c619:     	movaps	0xb00(%rbp), %xmm2
14549c620:     	movaps	0xb10(%rbp), %xmm3
14549c627:     	movups	%xmm3, 0x718(%rbp)
14549c62e:     	movups	%xmm2, 0x708(%rbp)
14549c635:     	movups	%xmm1, 0x6f8(%rbp)
14549c63c:     	movups	%xmm0, 0x6e8(%rbp)
14549c643:     	movq	$0x0, 0x48(%rbp)
14549c64b:     	movq	$0x0, 0x58(%rbp)
14549c653:     	movq	$0x0, 0x68(%rbp)
14549c65b:     	movq	$0x0, 0x78(%rbp)
14549c663:     	movq	$0x8, 0x80(%rbp)
14549c66e:     	movaps	0x9f0(%rbp), %xmm0
14549c675:     	movups	%xmm0, 0x88(%rbp)
14549c67c:     	movq	$0x4, 0x98(%rbp)
14549c687:     	movaps	0xa00(%rbp), %xmm0
14549c68e:     	movups	%xmm0, 0xa0(%rbp)
14549c695:     	movq	$0x4, 0xb0(%rbp)
14549c6a0:     	movaps	0xa10(%rbp), %xmm0
14549c6a7:     	movups	%xmm0, 0xb8(%rbp)
14549c6ae:     	movq	$0x8, 0xc8(%rbp)
14549c6b9:     	movaps	0xa20(%rbp), %xmm0
14549c6c0:     	movups	%xmm0, 0xd0(%rbp)
14549c6c7:     	movq	$0x8, 0xe0(%rbp)
14549c6d2:     	movaps	0xa30(%rbp), %xmm0
14549c6d9:     	movups	%xmm0, 0xe8(%rbp)
14549c6e0:     	movq	$0x8, 0xf8(%rbp)
14549c6eb:     	movaps	0xa40(%rbp), %xmm0
14549c6f2:     	movups	%xmm0, 0x100(%rbp)
14549c6f9:     	movq	$0x4, 0x110(%rbp)
14549c704:     	movq	$0x0, 0x748(%rbp)
14549c70f:     	movups	%xmm8, 0x128(%rbp)
14549c717:     	movups	%xmm8, 0x118(%rbp)
14549c71f:     	movw	$0x0, 0x138(%rbp)
14549c728:     	movq	$0x8, 0x750(%rbp)
14549c733:     	movaps	0x9a0(%rbp), %xmm0
14549c73a:     	movups	%xmm0, 0x758(%rbp)
14549c741:     	movq	$0x8, 0x768(%rbp)
14549c74c:     	movaps	0x9b0(%rbp), %xmm0
14549c753:     	movups	%xmm0, 0x770(%rbp)
14549c75a:     	movq	$0x8, 0x780(%rbp)
14549c765:     	movaps	0x9c0(%rbp), %xmm0
14549c76c:     	movups	%xmm0, 0x788(%rbp)
14549c773:     	movq	$0x8, 0x798(%rbp)
14549c77e:     	movaps	0x9d0(%rbp), %xmm0
14549c785:     	movups	%xmm0, 0x7a0(%rbp)
14549c78c:     	movq	$0x8, 0x7b0(%rbp)
14549c797:     	movaps	0x9e0(%rbp), %xmm0
14549c79e:     	movups	%xmm0, 0x7b8(%rbp)
14549c7a5:     	movq	$0x8, 0x7c8(%rbp)
14549c7b0:     	movups	%xmm8, 0x7d0(%rbp)
14549c7b8:     	movl	$0x0, 0x7e0(%rbp)
14549c7c2:     	movl	0xad8(%rbp), %eax
14549c7c8:     	movl	%eax, 0x804(%rbp)
14549c7ce:     	movups	0xab8(%rbp), %xmm0
14549c7d5:     	movups	0xac8(%rbp), %xmm1
14549c7dc:     	movups	%xmm1, 0x7f4(%rbp)
14549c7e3:     	movups	%xmm0, 0x7e4(%rbp)
14549c7ea:     	movq	$0x0, 0x80d(%rbp)
14549c7f5:     	movq	$0x0, 0x808(%rbp)
14549c800:     	movl	$0x3f800000, 0x96c(%rbp) # imm = 0x3F800000
14549c80a:     	movq	$0x0, 0x818(%rbp)
14549c815:     	movq	$0x8, 0x820(%rbp)
14549c820:     	movups	%xmm8, 0x828(%rbp)
14549c828:     	movq	$0x8, 0x838(%rbp)
14549c833:     	movq	$0x0, 0x840(%rbp)
14549c83e:     	movl	0xadc(%rbp), %eax
14549c844:     	movl	%eax, 0x970(%rbp)
14549c84a:     	movl	$0xff000000, 0x982(%rbp) # imm = 0xFF000000
14549c854:     	movq	$0x0, 0x848(%rbp)
14549c85f:     	movq	$0x8, 0x850(%rbp)
14549c86a:     	movq	$0x0, 0x858(%rbp)
14549c875:     	movl	$0x0, 0x974(%rbp)
14549c87f:     	callq	0x140002200 <.text+0x1200>
14549c884:     	movl	$0x10, %ecx
14549c889:     	movl	$0x8, %edx
14549c88e:     	callq	0x1400021c0 <.text+0x11c0>
14549c893:     	testq	%rax, %rax
14549c896:     	je	0x14549ce3e <.text+0x549be3e>
14549c89c:     	movq	0x720(%rbp), %rdx
14549c8a3:     	movq	0x728(%rbp), %rcx
14549c8aa:     	movq	%rcx, %r8
14549c8ad:     	shlq	$0x6, %r8
14549c8b1:     	testq	%rcx, %rcx
14549c8b4:     	je	0x14549c8db <.text+0x549b8db>
14549c8b6:     	xorl	%ecx, %ecx
14549c8b8:     	xorl	%r9d, %r9d
14549c8bb:     	nopl	(%rax,%rax)
14549c8c0:     	cmpb	$0x1c, (%rdx,%r9)
14549c8c5:     	je	0x14549ce03 <.text+0x549be03>
14549c8cb:     	addq	$0x40, %r9
14549c8cf:     	cmpq	%r9, %r8
14549c8d2:     	jne	0x14549c8c0 <.text+0x549b8c0>
14549c8d4:     	testq	%rcx, %rcx
14549c8d7:     	je	0x14549c8e2 <.text+0x549b8e2>
14549c8d9:     	jmp	0x14549c8ea <.text+0x549b8ea>
14549c8db:     	xorl	%ecx, %ecx
14549c8dd:     	testq	%rcx, %rcx
14549c8e0:     	jne	0x14549c8ea <.text+0x549b8ea>
14549c8e2:     	movq	0x40(%rbx), %rcx
14549c8e6:     	movq	0x48(%rbx), %r9
14549c8ea:     	movq	%rcx, (%rax)
14549c8ed:     	movq	%r9, 0x8(%rax)
14549c8f1:     	movq	$0x1, 0xb48(%rbp)
14549c8fc:     	movq	%rax, 0xb50(%rbp)
14549c903:     	movq	$0x1, 0xb58(%rbp)
14549c90e:     	addq	%rdx, %r8
14549c911:     	movb	$0x1, 0xb87(%rbp)
14549c918:     	leaq	0xae0(%rbp), %rcx
14549c91f:     	callq	0x14552a8f0 <.text+0x55298f0>
14549c924:     	nop
14549c925:     	movq	0xae0(%rbp), %rax
14549c92c:     	movq	%rax, 0xb68(%rbp)
14549c933:     	movq	0xae8(%rbp), %rax
14549c93a:     	movq	%rax, 0xb70(%rbp)
14549c941:     	movq	0xaf0(%rbp), %rcx
14549c948:     	testq	%rcx, %rcx
14549c94b:     	je	0x14549ca18 <.text+0x549ba18>
14549c951:     	movq	%rcx, %rax
14549c954:     	shlq	$0x4, %rax
14549c958:     	movq	0xb70(%rbp), %r12
14549c95f:     	addq	%r12, %rax
14549c962:     	movq	%rax, 0xb40(%rbp)
14549c969:     	movq	0xb58(%rbp), %r15
14549c970:     	jmp	0x14549c9a0 <.text+0x549b9a0>
14549c972:     	nopw	%cs:(%rax,%rax)
14549c980:     	movq	%rbx, (%rdi,%r13)
14549c984:     	movq	%r14, 0x8(%rdi,%r13)
14549c989:     	incq	%r15
14549c98c:     	movq	%r15, 0xb58(%rbp)
14549c993:     	addq	$0x10, %r12
14549c997:     	cmpq	0xb40(%rbp), %r12
14549c99e:     	je	0x14549ca18 <.text+0x549ba18>
14549c9a0:     	movq	(%r12), %rbx
14549c9a4:     	movq	0x8(%r12), %r14
14549c9a9:     	movq	0xb50(%rbp), %rdi
14549c9b0:     	movq	%r15, %r13
14549c9b3:     	shlq	$0x4, %r13
14549c9b7:     	testq	%r15, %r15
14549c9ba:     	je	0x14549c9f6 <.text+0x549b9f6>
14549c9bc:     	xorl	%esi, %esi
14549c9be:     	jmp	0x14549c9c9 <.text+0x549b9c9>
14549c9c0:     	addq	$0x10, %rsi
14549c9c4:     	cmpq	%rsi, %r13
14549c9c7:     	je	0x14549c9f0 <.text+0x549b9f0>
14549c9c9:     	cmpq	%r14, 0x8(%rdi,%rsi)
14549c9ce:     	jne	0x14549c9c0 <.text+0x549b9c0>
14549c9d0:     	movq	(%rdi,%rsi), %rcx
14549c9d4:     	movq	%rbx, %rdx
14549c9d7:     	movq	%r14, %r8
14549c9da:     	callq	0x145756dd7 <.text+0x5755dd7>
14549c9df:     	testl	%eax, %eax
14549c9e1:     	jne	0x14549c9c0 <.text+0x549b9c0>
14549c9e3:     	jmp	0x14549c993 <.text+0x549b993>
14549c9e5:     	nopw	%cs:(%rax,%rax)
14549c9f0:     	cmpq	$0x5, %r15
14549c9f4:     	ja	0x14549c993 <.text+0x549b993>
14549c9f6:     	cmpq	0xb48(%rbp), %r15
14549c9fd:     	jne	0x14549c980 <.text+0x549b980>
14549c9ff:     	leaq	0xb48(%rbp), %rcx
14549ca06:     	callq	0x145758200 <.text+0x5757200>
14549ca0b:     	nop
14549ca0c:     	movq	0xb50(%rbp), %rdi
14549ca13:     	jmp	0x14549c980 <.text+0x549b980>
14549ca18:     	movq	0xb68(%rbp), %rdx
14549ca1f:     	testq	%rdx, %rdx
14549ca22:     	je	0x14549ca3a <.text+0x549ba3a>
14549ca24:     	shlq	$0x4, %rdx
14549ca28:     	movl	$0x8, %r8d
14549ca2e:     	movq	0xb70(%rbp), %rcx
14549ca35:     	callq	0x1400021d0 <.text+0x11d0>
14549ca3a:     	movq	0xb48(%rbp), %rax
14549ca41:     	movq	0xb50(%rbp), %rcx
14549ca48:     	movq	0xb58(%rbp), %rdx
14549ca4f:     	shlq	$0x4, %rdx
14549ca53:     	addq	%rcx, %rdx
14549ca56:     	movq	%rcx, 0xae0(%rbp)
14549ca5d:     	movq	%rcx, 0xae8(%rbp)
14549ca64:     	movq	%rax, 0xaf0(%rbp)
14549ca6b:     	movq	%rdx, 0xaf8(%rbp)
14549ca72:     	leaq	0x28(%rbp), %rsi
14549ca76:     	movq	%rsi, 0xb00(%rbp)
14549ca7d:     	movb	$0x0, 0xb87(%rbp)
14549ca84:     	leaq	0xab8(%rbp), %rcx
14549ca8b:     	leaq	0xae0(%rbp), %rdx
14549ca92:     	callq	0x1455362e0 <.text+0x55352e0>
14549ca97:     	nop
14549ca98:     	leaq	0x2b8(%rbp), %rdi
14549ca9f:     	movq	0x2b8(%rbp), %rax
14549caa6:     	testq	%rax, %rax
14549caa9:     	je	0x14549cac1 <.text+0x549bac1>
14549caab:     	movq	0x2c0(%rbp), %rcx
14549cab2:     	imulq	$0x58, %rax, %rdx
14549cab6:     	movl	$0x8, %r8d
14549cabc:     	callq	0x1400021d0 <.text+0x11d0>
14549cac1:     	movq	0xac8(%rbp), %rax
14549cac8:     	movq	%rax, 0x10(%rdi)
14549cacc:     	movups	0xab8(%rbp), %xmm0
14549cad3:     	movups	%xmm0, (%rdi)
14549cad6:     	movq	0x728(%rbp), %rdi
14549cadd:     	leaq	(,%rdi,4), %rbx
14549cae5:     	testq	%rdi, %rdi
14549cae8:     	je	0x14549cdcd <.text+0x549bdcd>
14549caee:     	callq	0x140002200 <.text+0x1200>
14549caf3:     	movl	$0x4, %edx
14549caf8:     	movq	%rbx, %rcx
14549cafb:     	callq	0x1400021f0 <.text+0x11f0>
14549cb00:     	testq	%rax, %rax
14549cb03:     	je	0x14549cecf <.text+0x549becf>
14549cb09:     	movq	%rax, %r14
14549cb0c:     	movq	0x90(%rbp), %rdx
14549cb13:     	testq	%rdx, %rdx
14549cb16:     	je	0x14549cb2e <.text+0x549bb2e>
14549cb18:     	movq	0x98(%rbp), %rcx
14549cb1f:     	shlq	$0x2, %rdx
14549cb23:     	movl	$0x4, %r8d
14549cb29:     	callq	0x1400021d0 <.text+0x11d0>
14549cb2e:     	movq	%rdi, 0x90(%rbp)
14549cb35:     	movq	%r14, 0x98(%rbp)
14549cb3c:     	movq	%rdi, 0xa0(%rbp)
14549cb43:     	testq	%rdi, %rdi
14549cb46:     	je	0x14549cde8 <.text+0x549bde8>
14549cb4c:     	callq	0x140002200 <.text+0x1200>
14549cb51:     	movl	$0x4, %edx
14549cb56:     	movq	%rbx, %rcx
14549cb59:     	callq	0x1400021f0 <.text+0x11f0>
14549cb5e:     	testq	%rax, %rax
14549cb61:     	je	0x14549cee6 <.text+0x549bee6>
14549cb67:     	movq	%rax, %r14
14549cb6a:     	movq	0xa8(%rbp), %rdx
14549cb71:     	testq	%rdx, %rdx
14549cb74:     	je	0x14549cb8c <.text+0x549bb8c>
14549cb76:     	movq	0xb0(%rbp), %rcx
14549cb7d:     	shlq	$0x2, %rdx
14549cb81:     	movl	$0x4, %r8d
14549cb87:     	callq	0x1400021d0 <.text+0x11d0>
14549cb8c:     	movq	%rdi, 0xa8(%rbp)
14549cb93:     	movq	%r14, 0xb0(%rbp)
14549cb9a:     	movq	%rdi, 0xb8(%rbp)
14549cba1:     	movq	$0x0, 0xae0(%rbp)
14549cbac:     	movq	$0x4, 0xae8(%rbp)
14549cbb7:     	movq	$0x0, 0xaf0(%rbp)
14549cbc2:     	movb	$0x0, 0xb87(%rbp)
14549cbc9:     	leaq	0xab8(%rbp), %rcx
14549cbd0:     	leaq	0xae0(%rbp), %rdx
14549cbd7:     	movq	%rdi, %r8
14549cbda:     	callq	0x145525180 <.text+0x5524180>
14549cbdf:     	nop
14549cbe0:     	movq	0xd0(%rbp), %rdi
14549cbe7:     	testq	%rdi, %rdi
14549cbea:     	je	0x14549cc26 <.text+0x549bc26>
14549cbec:     	movq	0xc8(%rbp), %rbx
14549cbf3:     	addq	$0x8, %rbx
14549cbf7:     	jmp	0x14549cc09 <.text+0x549bc09>
14549cbf9:     	nopl	(%rax)
14549cc00:     	addq	$0x18, %rbx
14549cc04:     	decq	%rdi
14549cc07:     	je	0x14549cc26 <.text+0x549bc26>
14549cc09:     	movq	-0x8(%rbx), %rdx
14549cc0d:     	testq	%rdx, %rdx
14549cc10:     	je	0x14549cc00 <.text+0x549bc00>
14549cc12:     	movq	(%rbx), %rcx
14549cc15:     	shlq	$0x2, %rdx
14549cc19:     	movl	$0x4, %r8d
14549cc1f:     	callq	0x1400021d0 <.text+0x11d0>
14549cc24:     	jmp	0x14549cc00 <.text+0x549bc00>
14549cc26:     	leaq	0xc0(%rbp), %rdi
14549cc2d:     	movq	0xc0(%rbp), %rax
14549cc34:     	testq	%rax, %rax
14549cc37:     	je	0x14549cc53 <.text+0x549bc53>
14549cc39:     	movq	0xc8(%rbp), %rcx
14549cc40:     	shlq	$0x3, %rax
14549cc44:     	leaq	(%rax,%rax,2), %rdx
14549cc48:     	movl	$0x8, %r8d
14549cc4e:     	callq	0x1400021d0 <.text+0x11d0>
14549cc53:     	movq	0xac8(%rbp), %rax
14549cc5a:     	movq	%rax, 0x10(%rdi)
14549cc5e:     	movups	0xab8(%rbp), %xmm0
14549cc65:     	movups	%xmm0, (%rdi)
14549cc68:     	movq	0x720(%rbp), %rdx
14549cc6f:     	movq	0x728(%rbp), %r8
14549cc76:     	shlq	$0x6, %r8
14549cc7a:     	addq	%rdx, %r8
14549cc7d:     	movb	$0x0, 0xb87(%rbp)
14549cc84:     	leaq	0xae0(%rbp), %rcx
14549cc8b:     	callq	0x14552b5a0 <.text+0x552a5a0>
14549cc90:     	nop
14549cc91:     	movq	0xae0(%rbp), %rax
14549cc98:     	movq	0xae8(%rbp), %rcx
14549cc9f:     	movq	0xaf0(%rbp), %rdx
14549cca6:     	leaq	(%rdx,%rdx,2), %rdx
14549ccaa:     	leaq	(%rcx,%rdx,8), %rdx
14549ccae:     	movq	%rcx, 0xae0(%rbp)
14549ccb5:     	movq	%rcx, 0xae8(%rbp)
14549ccbc:     	movq	%rax, 0xaf0(%rbp)
14549ccc3:     	movq	%rdx, 0xaf8(%rbp)
14549ccca:     	movq	%rsi, 0xb00(%rbp)
14549ccd1:     	movb	$0x0, 0xb87(%rbp)
14549ccd8:     	leaq	0xab8(%rbp), %rcx
14549ccdf:     	leaq	0xae0(%rbp), %rdx
14549cce6:     	callq	0x145536680 <.text+0x5535680>
14549cceb:     	nop
14549ccec:     	leaq	0xd8(%rbp), %rsi
14549ccf3:     	movq	0xd8(%rbp), %rax
14549ccfa:     	testq	%rax, %rax
14549ccfd:     	je	0x14549cd19 <.text+0x549bd19>
14549ccff:     	movq	0xe0(%rbp), %rcx
14549cd06:     	shlq	$0x5, %rax
14549cd0a:     	leaq	(%rax,%rax,2), %rdx
14549cd0e:     	movl	$0x8, %r8d
14549cd14:     	callq	0x1400021d0 <.text+0x11d0>
14549cd19:     	movq	0xac8(%rbp), %rax
14549cd20:     	movq	%rax, 0x10(%rsi)
14549cd24:     	movups	0xab8(%rbp), %xmm0
14549cd2b:     	movups	%xmm0, (%rsi)
14549cd2e:     	movb	$0x0, 0xb87(%rbp)
14549cd35:     	leaq	0x28(%rbp), %rcx
14549cd39:     	callq	0x1454950d0 <.text+0x54940d0>
14549cd3e:     	nop
14549cd3f:     	movss	0x480(%rbp), %xmm0
14549cd47:     	movss	%xmm0, 0x428(%rbp)
14549cd4f:     	leaq	0x28(%rbp), %rdx
14549cd53:     	movl	$0x960, %r8d            # imm = 0x960
14549cd59:     	movq	0xa90(%rbp), %rsi
14549cd60:     	movq	%rsi, %rcx
14549cd63:     	callq	0x145756ddd <.text+0x5755ddd>
14549cd68:     	movq	%rsi, %rax
14549cd6b:     	movaps	0xb90(%rbp), %xmm6
14549cd72:     	movaps	0xba0(%rbp), %xmm7
14549cd79:     	movaps	0xbb0(%rbp), %xmm8
14549cd81:     	movaps	0xbc0(%rbp), %xmm9
14549cd89:     	movaps	0xbd0(%rbp), %xmm10
14549cd91:     	movaps	0xbe0(%rbp), %xmm11
14549cd99:     	movaps	0xbf0(%rbp), %xmm12
14549cda1:     	movaps	0xc00(%rbp), %xmm13
14549cda9:     	movaps	0xc10(%rbp), %xmm14
14549cdb1:     	movaps	0xc20(%rbp), %xmm15
14549cdb9:     	addq	$0xcb8, %rsp            # imm = 0xCB8
14549cdc0:     	popq	%rbx
14549cdc1:     	popq	%rdi
14549cdc2:     	popq	%rsi
14549cdc3:     	popq	%r12
14549cdc5:     	popq	%r13
14549cdc7:     	popq	%r14
14549cdc9:     	popq	%r15
14549cdcb:     	popq	%rbp
14549cdcc:     	retq
14549cdcd:     	movl	$0x4, %r14d
14549cdd3:     	movq	0x90(%rbp), %rdx
14549cdda:     	testq	%rdx, %rdx
14549cddd:     	jne	0x14549cb18 <.text+0x549bb18>
14549cde3:     	jmp	0x14549cb2e <.text+0x549bb2e>
14549cde8:     	movl	$0x4, %r14d
14549cdee:     	movq	0xa8(%rbp), %rdx
14549cdf5:     	testq	%rdx, %rdx
14549cdf8:     	jne	0x14549cb76 <.text+0x549bb76>
14549cdfe:     	jmp	0x14549cb8c <.text+0x549bb8c>
14549ce03:     	movq	0x8(%rdx,%r9), %rcx
14549ce08:     	movq	0x10(%rdx,%r9), %r9
14549ce0d:     	testq	%rcx, %rcx
14549ce10:     	je	0x14549c8e2 <.text+0x549b8e2>
14549ce16:     	jmp	0x14549c8ea <.text+0x549b8ea>
14549ce1b:     	movb	$0x1, 0xb86(%rbp)
14549ce22:     	movb	$0x1, 0xb85(%rbp)
14549ce29:     	movl	$0x8, %ecx
14549ce2e:     	movl	$0x58, %edx
14549ce33:     	callq	0x1458e7201 <.text+0x58e6201>
14549ce38:     	nop
14549ce39:     	jmp	0x14549cefb <.text+0x549befb>
14549ce3e:     	movl	$0x8, %ecx
14549ce43:     	movl	$0x10, %edx
14549ce48:     	callq	0x1458e7201 <.text+0x58e6201>
14549ce4d:     	nop
14549ce4e:     	jmp	0x14549cefb <.text+0x549befb>
14549ce53:     	leaq	0xae0(%rbp), %rax
14549ce5a:     	movq	%rax, 0x28(%rbp)
14549ce5e:     	leaq	-0x549ada5(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14549ce65:     	movq	%rax, 0x30(%rbp)
14549ce69:     	movb	$0x1, 0xb86(%rbp)
14549ce70:     	movb	$0x1, 0xb85(%rbp)
14549ce77:     	leaq	0x127bdfa(%rip), %rcx   # 0x146718c78
14549ce7e:     	leaq	0x127be03(%rip), %r8    # 0x146718c88
14549ce85:     	leaq	0x28(%rbp), %rdx
14549ce89:     	callq	0x1458e7790 <.text+0x58e6790>
14549ce8e:     	nop
14549ce8f:     	jmp	0x14549cefb <.text+0x549befb>
14549ce91:     	leaq	0xae0(%rbp), %rax
14549ce98:     	movq	%rax, 0x28(%rbp)
14549ce9c:     	leaq	-0x549ade3(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14549cea3:     	movq	%rax, 0x30(%rbp)
14549cea7:     	movb	$0x1, 0xb86(%rbp)
14549ceae:     	movb	$0x1, 0xb85(%rbp)
14549ceb5:     	leaq	0x127bdbc(%rip), %rcx   # 0x146718c78
14549cebc:     	leaq	0x127bdc5(%rip), %r8    # 0x146718c88
14549cec3:     	leaq	0x28(%rbp), %rdx
14549cec7:     	callq	0x1458e7790 <.text+0x58e6790>
14549cecc:     	nop
14549cecd:     	jmp	0x14549cefb <.text+0x549befb>
14549cecf:     	movb	$0x0, 0xb87(%rbp)
14549ced6:     	movl	$0x4, %ecx
14549cedb:     	movq	%rbx, %rdx
14549cede:     	callq	0x1458e721b <.text+0x58e621b>
14549cee3:     	nop
14549cee4:     	jmp	0x14549cefb <.text+0x549befb>
14549cee6:     	movb	$0x0, 0xb87(%rbp)
14549ceed:     	movl	$0x4, %ecx
14549cef2:     	movq	%rbx, %rdx
14549cef5:     	callq	0x1458e721b <.text+0x58e621b>
14549cefa:     	nop
14549cefb:     	ud2

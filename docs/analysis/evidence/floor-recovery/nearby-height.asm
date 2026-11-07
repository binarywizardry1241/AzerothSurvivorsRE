
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455266f0:     	pushq	%r15
1455266f2:     	pushq	%r14
1455266f4:     	pushq	%r13
1455266f6:     	pushq	%r12
1455266f8:     	pushq	%rsi
1455266f9:     	pushq	%rdi
1455266fa:     	pushq	%rbp
1455266fb:     	pushq	%rbx
1455266fc:     	subq	$0xf8, %rsp
145526703:     	movaps	%xmm15, 0xe0(%rsp)
14552670c:     	movaps	%xmm14, 0xd0(%rsp)
145526715:     	movaps	%xmm13, 0xc0(%rsp)
14552671e:     	movaps	%xmm12, 0xb0(%rsp)
145526727:     	movaps	%xmm11, 0xa0(%rsp)
145526730:     	movaps	%xmm10, 0x90(%rsp)
145526739:     	movaps	%xmm9, 0x80(%rsp)
145526742:     	movaps	%xmm8, 0x70(%rsp)
145526748:     	movaps	%xmm7, 0x60(%rsp)
14552674d:     	movaps	%xmm6, 0x50(%rsp)
145526752:     	movss	%xmm2, 0x30(%rsp)
145526758:     	cvttss2si	%xmm3, %eax
14552675c:     	ucomiss	0x4bea7d(%rip), %xmm3   # 0x1459e51e0
145526763:     	movl	$0x7fffffff, %ebp       # imm = 0x7FFFFFFF
145526768:     	cmovbel	%eax, %ebp
14552676b:     	xorl	%esi, %esi
14552676d:     	ucomiss	%xmm3, %xmm3
145526770:     	cmovpl	%esi, %ebp
145526773:     	movl	%ebp, %eax
145526775:     	negl	%eax
145526777:     	movl	%eax, 0x2c(%rsp)
14552677b:     	cmpl	%eax, %ebp
14552677d:     	jge	0x1455267e8 <.text+0x55257e8>
14552677f:     	movl	%esi, %eax
145526781:     	movaps	%xmm9, %xmm0
145526785:     	movaps	0x50(%rsp), %xmm6
14552678a:     	movaps	0x60(%rsp), %xmm7
14552678f:     	movaps	0x70(%rsp), %xmm8
145526795:     	movaps	0x80(%rsp), %xmm9
14552679e:     	movaps	0x90(%rsp), %xmm10
1455267a7:     	movaps	0xa0(%rsp), %xmm11
1455267b0:     	movaps	0xb0(%rsp), %xmm12
1455267b9:     	movaps	0xc0(%rsp), %xmm13
1455267c2:     	movaps	0xd0(%rsp), %xmm14
1455267cb:     	movaps	0xe0(%rsp), %xmm15
1455267d4:     	addq	$0xf8, %rsp
1455267db:     	popq	%rbx
1455267dc:     	popq	%rbp
1455267dd:     	popq	%rdi
1455267de:     	popq	%rsi
1455267df:     	popq	%r12
1455267e1:     	popq	%r13
1455267e3:     	popq	%r14
1455267e5:     	popq	%r15
1455267e7:     	retq
1455267e8:     	movaps	%xmm3, %xmm6
1455267eb:     	movaps	%xmm1, %xmm8
1455267ef:     	movq	%rcx, %r12
1455267f2:     	movq	0x70(%rcx), %r9
1455267f6:     	testq	%r9, %r9
1455267f9:     	js	0x145526a66 <.text+0x5525a66>
1455267ff:     	xorps	%xmm12, %xmm12
145526803:     	cvtsi2ss	%r9, %xmm12
145526808:     	movzbl	0xac(%r12), %eax
145526811:     	movq	0x98(%r12), %r8
145526819:     	testq	%r8, %r8
14552681c:     	jns	0x145526a99 <.text+0x5525a99>
145526822:     	movq	%r8, %rcx
145526825:     	shrq	%rcx
145526828:     	movl	%r8d, %edx
14552682b:     	andl	$0x1, %edx
14552682e:     	orq	%rcx, %rdx
145526831:     	cvtsi2ss	%rdx, %xmm13
145526836:     	addss	%xmm13, %xmm13
14552683b:     	testb	$0x1, %al
14552683d:     	jne	0x145526aa6 <.text+0x5525aa6>
145526843:     	cmpq	$-0x1, 0x58(%r12)
145526849:     	je	0x145526b5e <.text+0x5525b5e>
14552684f:     	movq	%r9, 0x48(%rsp)
145526854:     	movss	0x78(%r12), %xmm13
14552685b:     	movss	0x7c(%r12), %xmm0
145526862:     	movss	%xmm0, 0x34(%rsp)
145526868:     	movq	0x60(%r12), %rax
14552686d:     	movq	%rax, 0x40(%rsp)
145526872:     	movq	0x68(%r12), %rax
145526877:     	movq	%rax, 0x38(%rsp)
14552687c:     	xorl	%esi, %esi
14552687e:     	movss	0x3e0959(%rip), %xmm15  # 0x1459071e0
145526887:     	xorps	%xmm7, %xmm7
14552688a:     	movss	0x3e0951(%rip), %xmm14  # 0x1459071e4
145526893:     	movl	0x2c(%rsp), %r13d
145526898:     	nopl	(%rax,%rax)
1455268a0:     	xorps	%xmm10, %xmm10
1455268a4:     	cvtsi2ss	%r13d, %xmm10
1455268a9:     	xorl	%edi, %edi
1455268ab:     	cmpl	%ebp, %r13d
1455268ae:     	movaps	%xmm10, %xmm0
1455268b2:     	addss	%xmm8, %xmm0
1455268b7:     	subss	%xmm13, %xmm0
1455268bc:     	addss	%xmm0, %xmm0
1455268c0:     	cvttss2si	%xmm0, %rax
1455268c5:     	setl	%r15b
1455268c9:     	movq	%rax, %rcx
1455268cc:     	sarq	$0x3f, %rcx
1455268d0:     	movaps	%xmm0, %xmm1
1455268d3:     	subss	%xmm15, %xmm1
1455268d8:     	cvttss2si	%xmm1, %rdx
1455268dd:     	andq	%rcx, %rdx
1455268e0:     	orq	%rax, %rdx
1455268e3:     	ucomiss	%xmm7, %xmm0
1455268e6:     	movl	$0x0, %r14d
1455268ec:     	cmovaeq	%rdx, %r14
1455268f0:     	ucomiss	%xmm14, %xmm0
1455268f4:     	movq	$-0x1, %rax
1455268fb:     	cmovaq	%rax, %r14
1455268ff:     	ucomiss	%xmm12, %xmm0
145526903:     	jae	0x145526a10 <.text+0x5525a10>
145526909:     	ucomiss	%xmm0, %xmm7
14552690c:     	ja	0x145526a10 <.text+0x5525a10>
145526912:     	xorl	%ebx, %ebx
145526914:     	movl	0x2c(%rsp), %r12d
145526919:     	movl	%r12d, %eax
14552691c:     	nopl	(%rax)
145526920:     	testb	$0x1, %bl
145526923:     	jne	0x145526a49 <.text+0x5525a49>
145526929:     	cmpl	%ebp, %eax
14552692b:     	jg	0x145526a49 <.text+0x5525a49>
145526931:     	setge	%bl
145526934:     	setl	%cl
145526937:     	movzbl	%cl, %r12d
14552693b:     	addl	%eax, %r12d
14552693e:     	xorps	%xmm11, %xmm11
145526942:     	cvtsi2ss	%eax, %xmm11
145526947:     	movaps	%xmm10, %xmm0
14552694b:     	movaps	%xmm11, %xmm1
14552694f:     	callq	0x145773277 <.text+0x5772277>
145526954:     	ucomiss	%xmm6, %xmm0
145526957:     	movl	%r12d, %eax
14552695a:     	ja	0x145526920 <.text+0x5525920>
14552695c:     	addss	0x30(%rsp), %xmm11
145526963:     	subss	0x34(%rsp), %xmm11
14552696a:     	addss	%xmm11, %xmm11
14552696f:     	ucomiss	%xmm11, %xmm7
145526973:     	ja	0x145526919 <.text+0x5525919>
145526975:     	ucomiss	%xmm12, %xmm11
145526979:     	jae	0x145526919 <.text+0x5525919>
14552697b:     	cvttss2si	%xmm11, %rax
145526980:     	movq	%rax, %rcx
145526983:     	sarq	$0x3f, %rcx
145526987:     	movaps	%xmm11, %xmm0
14552698b:     	subss	%xmm15, %xmm0
145526990:     	cvttss2si	%xmm0, %rdx
145526995:     	andq	%rcx, %rdx
145526998:     	orq	%rax, %rdx
14552699b:     	ucomiss	%xmm7, %xmm11
14552699f:     	movl	$0x0, %ecx
1455269a4:     	cmovaeq	%rdx, %rcx
1455269a8:     	ucomiss	%xmm14, %xmm11
1455269ac:     	movq	$-0x1, %rax
1455269b3:     	cmovaq	%rax, %rcx
1455269b7:     	imulq	0x48(%rsp), %rcx
1455269bd:     	addq	%r14, %rcx
1455269c0:     	cmpq	0x38(%rsp), %rcx
1455269c5:     	jae	0x145526efe <.text+0x5525efe>
1455269cb:     	movq	0x40(%rsp), %rax
1455269d0:     	movss	(%rax,%rcx,4), %xmm0
1455269d5:     	ucomiss	%xmm0, %xmm0
1455269d8:     	jp	0x145526919 <.text+0x5525919>
1455269de:     	testb	$0x1, %sil
1455269e2:     	je	0x145526a01 <.text+0x5525a01>
1455269e4:     	movaps	%xmm9, %xmm1
1455269e8:     	minss	%xmm0, %xmm1
1455269ec:     	movaps	%xmm1, %xmm0
1455269ef:     	cmpunordss	%xmm1, %xmm0
1455269f4:     	movaps	%xmm0, %xmm2
1455269f7:     	andnps	%xmm1, %xmm2
1455269fa:     	andps	%xmm9, %xmm0
1455269fe:     	orps	%xmm2, %xmm0
145526a01:     	movl	$0x1, %esi
145526a06:     	movaps	%xmm0, %xmm9
145526a0a:     	jmp	0x145526919 <.text+0x5525919>
145526a0f:     	nop
145526a10:     	xorl	%ebx, %ebx
145526a12:     	movl	0x2c(%rsp), %eax
145526a16:     	testb	$0x1, %bl
145526a19:     	jne	0x145526a49 <.text+0x5525a49>
145526a1b:     	nopl	(%rax,%rax)
145526a20:     	cmpl	%ebp, %eax
145526a22:     	jg	0x145526a49 <.text+0x5525a49>
145526a24:     	setge	%bl
145526a27:     	setl	%cl
145526a2a:     	movzbl	%cl, %r14d
145526a2e:     	addl	%eax, %r14d
145526a31:     	xorps	%xmm1, %xmm1
145526a34:     	cvtsi2ss	%eax, %xmm1
145526a38:     	movaps	%xmm10, %xmm0
145526a3c:     	callq	0x145773277 <.text+0x5772277>
145526a41:     	movl	%r14d, %eax
145526a44:     	testb	$0x1, %bl
145526a47:     	je	0x145526a20 <.text+0x5525a20>
145526a49:     	cmpl	%ebp, %r13d
145526a4c:     	jge	0x14552677f <.text+0x552577f>
145526a52:     	movb	%r15b, %dil
145526a55:     	addl	%edi, %r13d
145526a58:     	cmpl	%ebp, %r13d
145526a5b:     	jle	0x1455268a0 <.text+0x55258a0>
145526a61:     	jmp	0x14552677f <.text+0x552577f>
145526a66:     	movq	%r9, %rax
145526a69:     	shrq	%rax
145526a6c:     	movl	%r9d, %ecx
145526a6f:     	andl	$0x1, %ecx
145526a72:     	orq	%rax, %rcx
145526a75:     	cvtsi2ss	%rcx, %xmm12
145526a7a:     	addss	%xmm12, %xmm12
145526a7f:     	movzbl	0xac(%r12), %eax
145526a88:     	movq	0x98(%r12), %r8
145526a90:     	testq	%r8, %r8
145526a93:     	js	0x145526822 <.text+0x5525822>
145526a99:     	cvtsi2ss	%r8, %xmm13
145526a9e:     	testb	$0x1, %al
145526aa0:     	je	0x145526843 <.text+0x5525843>
145526aa6:     	movss	0xa8(%r12), %xmm8
145526ab0:     	xorl	%esi, %esi
145526ab2:     	movl	0x2c(%rsp), %edi
145526ab6:     	nopw	%cs:(%rax,%rax)
145526ac0:     	xorps	%xmm7, %xmm7
145526ac3:     	cvtsi2ss	%edi, %xmm7
145526ac7:     	xorl	%ebx, %ebx
145526ac9:     	movl	0x2c(%rsp), %eax
145526acd:     	nopl	(%rax)
145526ad0:     	testb	$0x1, %bl
145526ad3:     	jne	0x145526b40 <.text+0x5525b40>
145526ad5:     	cmpl	%ebp, %eax
145526ad7:     	jg	0x145526b40 <.text+0x5525b40>
145526ad9:     	setge	%bl
145526adc:     	setl	%cl
145526adf:     	movzbl	%cl, %r14d
145526ae3:     	addl	%eax, %r14d
145526ae6:     	xorps	%xmm1, %xmm1
145526ae9:     	cvtsi2ss	%eax, %xmm1
145526aed:     	movaps	%xmm7, %xmm0
145526af0:     	callq	0x145773277 <.text+0x5772277>
145526af5:     	ucomiss	%xmm6, %xmm0
145526af8:     	movl	%r14d, %eax
145526afb:     	ja	0x145526ad0 <.text+0x5525ad0>
145526afd:     	testb	$0x1, %sil
145526b01:     	jne	0x145526b09 <.text+0x5525b09>
145526b03:     	movaps	%xmm8, %xmm9
145526b07:     	jmp	0x145526b2b <.text+0x5525b2b>
145526b09:     	movaps	%xmm9, %xmm0
145526b0d:     	minss	%xmm8, %xmm0
145526b12:     	movaps	%xmm0, %xmm1
145526b15:     	cmpunordss	%xmm0, %xmm1
145526b1a:     	movaps	%xmm1, %xmm2
145526b1d:     	andnps	%xmm0, %xmm2
145526b20:     	andps	%xmm9, %xmm1
145526b24:     	orps	%xmm2, %xmm1
145526b27:     	movaps	%xmm1, %xmm9
145526b2b:     	movl	$0x1, %esi
145526b30:     	movl	%r14d, %eax
145526b33:     	jmp	0x145526ad0 <.text+0x5525ad0>
145526b35:     	nopw	%cs:(%rax,%rax)
145526b40:     	xorl	%eax, %eax
145526b42:     	cmpl	%ebp, %edi
145526b44:     	setl	%cl
145526b47:     	jge	0x14552677f <.text+0x552577f>
145526b4d:     	movb	%cl, %al
145526b4f:     	addl	%eax, %edi
145526b51:     	cmpl	%ebp, %edi
145526b53:     	jle	0x145526ac0 <.text+0x5525ac0>
145526b59:     	jmp	0x14552677f <.text+0x552577f>
145526b5e:     	cmpq	$-0x1, 0x80(%r12)
145526b67:     	je	0x145526e29 <.text+0x5525e29>
145526b6d:     	movq	%r8, 0x48(%rsp)
145526b72:     	movss	0xa0(%r12), %xmm14
145526b7c:     	movss	0xa4(%r12), %xmm7
145526b86:     	movq	0x90(%r12), %rax
145526b8e:     	movq	%rax, 0x38(%rsp)
145526b93:     	movq	0x88(%r12), %rax
145526b9b:     	movq	%rax, 0x40(%rsp)
145526ba0:     	xorl	%esi, %esi
145526ba2:     	xorps	%xmm15, %xmm15
145526ba6:     	movq	$-0x1, %r13
145526bad:     	movl	0x2c(%rsp), %r14d
145526bb2:     	nopw	%cs:(%rax,%rax)
145526bc0:     	xorl	%edi, %edi
145526bc2:     	xorps	%xmm10, %xmm10
145526bc6:     	cvtsi2ss	%r14d, %xmm10
145526bcb:     	cmpl	%ebp, %r14d
145526bce:     	movaps	%xmm10, %xmm11
145526bd2:     	addss	%xmm8, %xmm11
145526bd7:     	movaps	%xmm11, %xmm0
145526bdb:     	subss	%xmm14, %xmm0
145526be0:     	addss	%xmm0, %xmm0
145526be4:     	cvttss2si	%xmm0, %rax
145526be9:     	setl	0x34(%rsp)
145526bee:     	movq	%rax, %rcx
145526bf1:     	sarq	$0x3f, %rcx
145526bf5:     	movaps	%xmm0, %xmm1
145526bf8:     	subss	0x3e05e0(%rip), %xmm1   # 0x1459071e0
145526c00:     	cvttss2si	%xmm1, %rdx
145526c05:     	andq	%rcx, %rdx
145526c08:     	orq	%rax, %rdx
145526c0b:     	ucomiss	%xmm15, %xmm0
145526c0f:     	movl	$0x0, %r15d
145526c15:     	cmovaeq	%rdx, %r15
145526c19:     	ucomiss	0x3e05c4(%rip), %xmm0   # 0x1459071e4
145526c20:     	cmovaq	%r13, %r15
145526c24:     	ucomiss	%xmm13, %xmm0
145526c28:     	jae	0x145526d60 <.text+0x5525d60>
145526c2e:     	ucomiss	%xmm0, %xmm15
145526c32:     	ja	0x145526d60 <.text+0x5525d60>
145526c38:     	xorl	%r13d, %r13d
145526c3b:     	movl	0x2c(%rsp), %ebx
145526c3f:     	movl	%ebx, %eax
145526c41:     	nopw	%cs:(%rax,%rax)
145526c50:     	testb	$0x1, %r13b
145526c54:     	jne	0x145526e00 <.text+0x5525e00>
145526c5a:     	cmpl	%ebp, %eax
145526c5c:     	jg	0x145526e00 <.text+0x5525e00>
145526c62:     	setge	%r13b
145526c66:     	setl	%cl
145526c69:     	movzbl	%cl, %ebx
145526c6c:     	addl	%eax, %ebx
145526c6e:     	xorps	%xmm12, %xmm12
145526c72:     	cvtsi2ss	%eax, %xmm12
145526c77:     	movaps	%xmm10, %xmm0
145526c7b:     	movaps	%xmm12, %xmm1
145526c7f:     	callq	0x145773277 <.text+0x5772277>
145526c84:     	ucomiss	%xmm6, %xmm0
145526c87:     	movl	%ebx, %eax
145526c89:     	ja	0x145526c50 <.text+0x5525c50>
145526c8b:     	addss	0x30(%rsp), %xmm12
145526c92:     	movq	%r12, %rcx
145526c95:     	movaps	%xmm11, %xmm1
145526c99:     	movaps	%xmm12, %xmm2
145526c9d:     	callq	0x1455264f0 <.text+0x55254f0>
145526ca2:     	cmpl	$0x1, %eax
145526ca5:     	jne	0x145526c3f <.text+0x5525c3f>
145526ca7:     	subss	%xmm7, %xmm12
145526cac:     	addss	%xmm12, %xmm12
145526cb1:     	ucomiss	%xmm12, %xmm15
145526cb5:     	ja	0x145526d2b <.text+0x5525d2b>
145526cb7:     	ucomiss	%xmm13, %xmm12
145526cbb:     	jae	0x145526d2b <.text+0x5525d2b>
145526cbd:     	cvttss2si	%xmm12, %rax
145526cc2:     	movq	%rax, %rcx
145526cc5:     	sarq	$0x3f, %rcx
145526cc9:     	movaps	%xmm12, %xmm1
145526ccd:     	subss	0x3e050b(%rip), %xmm1   # 0x1459071e0
145526cd5:     	cvttss2si	%xmm1, %rdx
145526cda:     	andq	%rcx, %rdx
145526cdd:     	orq	%rax, %rdx
145526ce0:     	ucomiss	%xmm15, %xmm12
145526ce4:     	movl	$0x0, %ecx
145526ce9:     	cmovaeq	%rdx, %rcx
145526ced:     	ucomiss	0x3e04ef(%rip), %xmm12  # 0x1459071e4
145526cf5:     	movq	$-0x1, %rax
145526cfc:     	cmovaq	%rax, %rcx
145526d00:     	imulq	0x48(%rsp), %rcx
145526d06:     	addq	%r15, %rcx
145526d09:     	cmpq	0x38(%rsp), %rcx
145526d0e:     	jae	0x145526f11 <.text+0x5525f11>
145526d14:     	movq	0x40(%rsp), %rax
145526d19:     	movss	(%rax,%rcx,4), %xmm1
145526d1e:     	ucomiss	%xmm1, %xmm1
145526d21:     	jp	0x145526d2b <.text+0x5525d2b>
145526d23:     	ucomiss	%xmm0, %xmm1
145526d26:     	jbe	0x145526d2b <.text+0x5525d2b>
145526d28:     	movaps	%xmm1, %xmm0
145526d2b:     	testb	$0x1, %sil
145526d2f:     	je	0x145526d4e <.text+0x5525d4e>
145526d31:     	movaps	%xmm9, %xmm1
145526d35:     	minss	%xmm0, %xmm1
145526d39:     	movaps	%xmm1, %xmm0
145526d3c:     	cmpunordss	%xmm1, %xmm0
145526d41:     	movaps	%xmm0, %xmm2
145526d44:     	andnps	%xmm1, %xmm2
145526d47:     	andps	%xmm9, %xmm0
145526d4b:     	orps	%xmm2, %xmm0
145526d4e:     	movl	$0x1, %esi
145526d53:     	movaps	%xmm0, %xmm9
145526d57:     	jmp	0x145526c3f <.text+0x5525c3f>
145526d5c:     	nopl	(%rax)
145526d60:     	xorl	%ebx, %ebx
145526d62:     	movl	0x2c(%rsp), %r15d
145526d67:     	movl	%r15d, %eax
145526d6a:     	nopw	(%rax,%rax)
145526d70:     	testb	$0x1, %bl
145526d73:     	jne	0x145526e07 <.text+0x5525e07>
145526d79:     	cmpl	%ebp, %eax
145526d7b:     	jg	0x145526e07 <.text+0x5525e07>
145526d81:     	setge	%bl
145526d84:     	setl	%cl
145526d87:     	movzbl	%cl, %r15d
145526d8b:     	addl	%eax, %r15d
145526d8e:     	xorps	%xmm12, %xmm12
145526d92:     	cvtsi2ss	%eax, %xmm12
145526d97:     	movaps	%xmm10, %xmm0
145526d9b:     	movaps	%xmm12, %xmm1
145526d9f:     	callq	0x145773277 <.text+0x5772277>
145526da4:     	ucomiss	%xmm6, %xmm0
145526da7:     	movl	%r15d, %eax
145526daa:     	ja	0x145526d70 <.text+0x5525d70>
145526dac:     	addss	0x30(%rsp), %xmm12
145526db3:     	movq	%r12, %rcx
145526db6:     	movaps	%xmm11, %xmm1
145526dba:     	movaps	%xmm12, %xmm2
145526dbe:     	callq	0x1455264f0 <.text+0x55254f0>
145526dc3:     	cmpl	$0x1, %eax
145526dc6:     	jne	0x145526d67 <.text+0x5525d67>
145526dc8:     	testb	$0x1, %sil
145526dcc:     	je	0x145526deb <.text+0x5525deb>
145526dce:     	movaps	%xmm9, %xmm1
145526dd2:     	minss	%xmm0, %xmm1
145526dd6:     	movaps	%xmm1, %xmm0
145526dd9:     	cmpunordss	%xmm1, %xmm0
145526dde:     	movaps	%xmm0, %xmm2
145526de1:     	andnps	%xmm1, %xmm2
145526de4:     	andps	%xmm9, %xmm0
145526de8:     	orps	%xmm2, %xmm0
145526deb:     	movaps	%xmm0, %xmm9
145526def:     	movl	$0x1, %esi
145526df4:     	jmp	0x145526d67 <.text+0x5525d67>
145526df9:     	nopl	(%rax)
145526e00:     	movq	$-0x1, %r13
145526e07:     	cmpl	%ebp, %r14d
145526e0a:     	jge	0x14552677f <.text+0x552577f>
145526e10:     	movzbl	0x34(%rsp), %eax
145526e15:     	movb	%al, %dil
145526e18:     	addl	%edi, %r14d
145526e1b:     	cmpl	%ebp, %r14d
145526e1e:     	jle	0x145526bc0 <.text+0x5525bc0>
145526e24:     	jmp	0x14552677f <.text+0x552577f>
145526e29:     	xorl	%esi, %esi
145526e2b:     	movl	0x2c(%rsp), %edi
145526e2f:     	nop
145526e30:     	xorps	%xmm10, %xmm10
145526e34:     	cvtsi2ss	%edi, %xmm10
145526e39:     	movaps	%xmm8, %xmm11
145526e3d:     	addss	%xmm10, %xmm11
145526e42:     	xorl	%ebx, %ebx
145526e44:     	movl	0x2c(%rsp), %r14d
145526e49:     	movl	%r14d, %eax
145526e4c:     	nopl	(%rax)
145526e50:     	testb	$0x1, %bl
145526e53:     	jne	0x145526ee0 <.text+0x5525ee0>
145526e59:     	cmpl	%ebp, %eax
145526e5b:     	jg	0x145526ee0 <.text+0x5525ee0>
145526e61:     	setge	%bl
145526e64:     	setl	%cl
145526e67:     	movzbl	%cl, %r14d
145526e6b:     	addl	%eax, %r14d
145526e6e:     	xorps	%xmm12, %xmm12
145526e72:     	cvtsi2ss	%eax, %xmm12
145526e77:     	movaps	%xmm10, %xmm0
145526e7b:     	movaps	%xmm12, %xmm1
145526e7f:     	callq	0x145773277 <.text+0x5772277>
145526e84:     	ucomiss	%xmm6, %xmm0
145526e87:     	movl	%r14d, %eax
145526e8a:     	ja	0x145526e50 <.text+0x5525e50>
145526e8c:     	addss	0x30(%rsp), %xmm12
145526e93:     	movq	%r12, %rcx
145526e96:     	movaps	%xmm11, %xmm1
145526e9a:     	movaps	%xmm12, %xmm2
145526e9e:     	callq	0x1455264f0 <.text+0x55254f0>
145526ea3:     	cmpl	$0x1, %eax
145526ea6:     	jne	0x145526e49 <.text+0x5525e49>
145526ea8:     	testb	$0x1, %sil
145526eac:     	je	0x145526ecb <.text+0x5525ecb>
145526eae:     	movaps	%xmm9, %xmm1
145526eb2:     	minss	%xmm0, %xmm1
145526eb6:     	movaps	%xmm1, %xmm0
145526eb9:     	cmpunordss	%xmm1, %xmm0
145526ebe:     	movaps	%xmm0, %xmm2
145526ec1:     	andnps	%xmm1, %xmm2
145526ec4:     	andps	%xmm9, %xmm0
145526ec8:     	orps	%xmm2, %xmm0
145526ecb:     	movaps	%xmm0, %xmm9
145526ecf:     	movl	$0x1, %esi
145526ed4:     	jmp	0x145526e49 <.text+0x5525e49>
145526ed9:     	nopl	(%rax)
145526ee0:     	xorl	%eax, %eax
145526ee2:     	cmpl	%ebp, %edi
145526ee4:     	setl	%cl
145526ee7:     	jge	0x14552677f <.text+0x552577f>
145526eed:     	movb	%cl, %al
145526eef:     	addl	%eax, %edi
145526ef1:     	cmpl	%ebp, %edi
145526ef3:     	jle	0x145526e30 <.text+0x5525e30>
145526ef9:     	jmp	0x14552677f <.text+0x552577f>
145526efe:     	leaq	0x180e05b(%rip), %r8    # 0x146d34f60
145526f05:     	movq	0x38(%rsp), %rdx
145526f0a:     	callq	0x145903b33 <.text+0x5902b33>
145526f0f:     	ud2
145526f11:     	leaq	0x180de90(%rip), %r8    # 0x146d34da8
145526f18:     	movq	0x38(%rsp), %rdx
145526f1d:     	callq	0x145903b33 <.text+0x5902b33>
145526f22:     	ud2

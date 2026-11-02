
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400925b0:     	pushq	%r15
1400925b2:     	pushq	%r14
1400925b4:     	pushq	%r13
1400925b6:     	pushq	%r12
1400925b8:     	pushq	%rsi
1400925b9:     	pushq	%rdi
1400925ba:     	pushq	%rbp
1400925bb:     	pushq	%rbx
1400925bc:     	subq	$0x358, %rsp            # imm = 0x358
1400925c3:     	movaps	%xmm7, 0x340(%rsp)
1400925cb:     	movaps	%xmm6, 0x330(%rsp)
1400925d3:     	movq	0x3d0(%rsp), %rsi
1400925db:     	movq	0x3e0(%rsp), %rax
1400925e3:     	movq	0x3d8(%rsp), %rcx
1400925eb:     	movq	0x3c8(%rsp), %r10
1400925f3:     	movq	0x3c0(%rsp), %r11
1400925fb:     	movq	0x20(%rdx), %rdi
1400925ff:     	movq	%rdi, 0x60(%rsp)
140092604:     	movups	(%rdx), %xmm0
140092607:     	movups	0x10(%rdx), %xmm1
14009260b:     	movaps	%xmm1, 0x50(%rsp)
140092610:     	movaps	%xmm0, 0x40(%rsp)
140092615:     	movups	(%r8), %xmm0
140092619:     	movups	0x10(%r8), %xmm1
14009261e:     	movups	%xmm1, 0x78(%rsp)
140092623:     	movups	%xmm0, 0x68(%rsp)
140092628:     	movups	(%r9), %xmm0
14009262c:     	movups	0x10(%r9), %xmm1
140092631:     	movaps	%xmm1, 0xf0(%rsp)
140092639:     	movaps	%xmm0, 0xe0(%rsp)
140092641:     	movups	(%r11), %xmm0
140092645:     	movups	0x10(%r11), %xmm1
14009264a:     	movups	%xmm1, 0x98(%rsp)
140092652:     	movups	%xmm0, 0x88(%rsp)
14009265a:     	movups	(%r10), %xmm0
14009265e:     	movups	%xmm0, 0xa8(%rsp)
140092666:     	movq	0x10(%r10), %rdx
14009266a:     	movq	%rdx, 0xb8(%rsp)
140092672:     	movq	%rsi, 0xc0(%rsp)
14009267a:     	movq	0x10(%rcx), %rdx
14009267e:     	movq	%rdx, 0xd8(%rsp)
140092686:     	movups	(%rcx), %xmm0
140092689:     	movups	%xmm0, 0xc8(%rsp)
140092691:     	movups	(%rax), %xmm0
140092694:     	movups	0x10(%rax), %xmm1
140092698:     	movaps	%xmm1, 0x110(%rsp)
1400926a0:     	movaps	%xmm0, 0x100(%rsp)
1400926a8:     	movq	0x88(%rsp), %rax
1400926b0:     	movq	0x100(%rsp), %rdx
1400926b8:     	movss	0x5c(%rax), %xmm6
1400926bd:     	movl	0x84(%rsp), %eax
1400926c4:     	movq	0x78(%rsp), %rcx
1400926c9:     	cmpb	$0x0, (%rdx)
1400926cc:     	je	0x140092895 <.text+0x91895>
1400926d2:     	movl	%eax, (%rcx)
1400926d4:     	movq	0x68(%rsp), %rdi
1400926d9:     	movq	0x10(%rdi), %r8
1400926dd:     	testq	%r8, %r8
1400926e0:     	je	0x140092778 <.text+0x91778>
1400926e6:     	movq	0x8(%rdi), %rdx
1400926ea:     	shlq	$0x5, %r8
1400926ee:     	leaq	-0x20(%r8), %r11
1400926f2:     	movl	%r11d, %ebx
1400926f5:     	notl	%ebx
1400926f7:     	movq	%rdx, %r10
1400926fa:     	testb	$-0x20, %bl
1400926fd:     	je	0x14009271f <.text+0x9171f>
1400926ff:     	movl	%r11d, %ebx
140092702:     	shrl	$0x5, %ebx
140092705:     	incl	%ebx
140092707:     	andl	$0x7, %ebx
14009270a:     	negq	%rbx
14009270d:     	movq	%rdx, %r10
140092710:     	movss	%xmm6, 0x1c(%r10)
140092716:     	addq	$0x20, %r10
14009271a:     	incq	%rbx
14009271d:     	jne	0x140092710 <.text+0x91710>
14009271f:     	cmpq	$0xe0, %r11
140092726:     	jb	0x140092778 <.text+0x91778>
140092728:     	addq	%r8, %rdx
14009272b:     	nopl	(%rax,%rax)
140092730:     	movss	%xmm6, 0x1c(%r10)
140092736:     	movss	%xmm6, 0x3c(%r10)
14009273c:     	movss	%xmm6, 0x5c(%r10)
140092742:     	movss	%xmm6, 0x7c(%r10)
140092748:     	movss	%xmm6, 0x9c(%r10)
140092751:     	movss	%xmm6, 0xbc(%r10)
14009275a:     	movss	%xmm6, 0xdc(%r10)
140092763:     	movss	%xmm6, 0xfc(%r10)
14009276c:     	addq	$0x100, %r10            # imm = 0x100
140092773:     	cmpq	%rdx, %r10
140092776:     	jne	0x140092730 <.text+0x91730>
140092778:     	movl	%eax, (%rcx)
14009277a:     	movq	0x10(%rdi), %r15
14009277e:     	testq	%r15, %r15
140092781:     	je	0x1400928a9 <.text+0x918a9>
140092787:     	movq	0x8(%rdi), %r14
14009278b:     	leaq	0x20(%r14), %r12
14009278f:     	xorl	%ebx, %ebx
140092791:     	movss	0x5880b63(%rip), %xmm7  # 0x1459132fc
140092799:     	nopl	(%rax)
1400927a0:     	movaps	%xmm6, %xmm0
1400927a3:     	subss	-0x4(%r12), %xmm0
1400927aa:     	ucomiss	%xmm0, %xmm7
1400927ad:     	jbe	0x14009309e <.text+0x9209e>
1400927b3:     	incq	%rbx
1400927b6:     	addq	$0x20, %r12
1400927ba:     	cmpq	%rbx, %r15
1400927bd:     	jne	0x1400927a0 <.text+0x917a0>
1400927bf:     	cmpq	$0x0, 0xe0(%rsp)
1400927c8:     	je	0x140093141 <.text+0x92141>
1400927ce:     	movups	(%r9), %xmm0
1400927d2:     	movups	0x10(%r9), %xmm1
1400927d7:     	movaps	%xmm1, 0x190(%rsp)
1400927df:     	movaps	%xmm0, 0x180(%rsp)
1400927e7:     	testq	%r15, %r15
1400927ea:     	je	0x1400928d1 <.text+0x918d1>
1400927f0:     	movq	%r15, %rax
1400927f3:     	shlq	$0x5, %rax
1400927f7:     	addq	0x8(%rdi), %rax
1400927fb:     	cmpq	$0x20, %rax
1400927ff:     	je	0x14009296d <.text+0x9196d>
140092805:     	movss	-0x4(%rax), %xmm0
14009280a:     	mulss	0x5883106(%rip), %xmm0  # 0x145915918
140092812:     	cvttss2si	%xmm0, %rax
140092817:     	movq	%rax, %rcx
14009281a:     	sarq	$0x3f, %rcx
14009281e:     	movaps	%xmm0, %xmm1
140092821:     	subss	0x58749b7(%rip), %xmm1  # 0x1459071e0
140092829:     	cvttss2si	%xmm1, %rdx
14009282e:     	andq	%rcx, %rdx
140092831:     	orq	%rax, %rdx
140092834:     	xorl	%ecx, %ecx
140092836:     	xorps	%xmm1, %xmm1
140092839:     	ucomiss	%xmm1, %xmm0
14009283c:     	cmovaeq	%rdx, %rcx
140092840:     	ucomiss	0x587499d(%rip), %xmm0  # 0x1459071e4
140092847:     	movq	$-0x1, %rax
14009284e:     	cmovbeq	%rcx, %rax
140092852:     	addq	%rax, %r15
140092855:     	cmpq	(%rsi), %r15
140092858:     	je	0x1400928de <.text+0x918de>
14009285e:     	movq	0xa8(%rsp), %rax
140092866:     	movq	0xb0(%rsp), %rbx
14009286e:     	movq	0xf8(%rax), %r14
140092875:     	movq	0x100(%rax), %rcx
14009287c:     	cmpb	$0x0, 0x108(%rax)
140092883:     	movq	%r15, (%rsi)
140092886:     	leaq	(%r14,%rcx,4), %r15
14009288a:     	jne	0x140092987 <.text+0x91987>
140092890:     	jmp	0x140092a99 <.text+0x91a99>
140092895:     	movq	0x68(%rsp), %rdi
14009289a:     	movl	%eax, (%rcx)
14009289c:     	movq	0x10(%rdi), %r15
1400928a0:     	testq	%r15, %r15
1400928a3:     	jne	0x140092787 <.text+0x91787>
1400928a9:     	cmpq	$0x0, 0xe0(%rsp)
1400928b2:     	je	0x140093141 <.text+0x92141>
1400928b8:     	movups	(%r9), %xmm0
1400928bc:     	movups	0x10(%r9), %xmm1
1400928c1:     	movaps	%xmm1, 0x190(%rsp)
1400928c9:     	movaps	%xmm0, 0x180(%rsp)
1400928d1:     	xorl	%r15d, %r15d
1400928d4:     	xorl	%eax, %eax
1400928d6:     	addq	%rax, %r15
1400928d9:     	cmpq	(%rsi), %r15
1400928dc:     	jne	0x14009285e <.text+0x9185e>
1400928de:     	movq	0xa8(%rsp), %rcx
1400928e6:     	movq	0xb0(%rsp), %rbx
1400928ee:     	movq	0xf8(%rcx), %r14
1400928f5:     	movq	0x100(%rcx), %rax
1400928fc:     	cmpb	$0x0, 0x108(%rcx)
140092903:     	je	0x140092935 <.text+0x91935>
140092905:     	leaq	(,%rax,4), %rcx
14009290d:     	xorl	%edx, %edx
14009290f:     	nop
140092910:     	cmpq	%rdx, %rcx
140092913:     	je	0x140092980 <.text+0x91980>
140092915:     	movl	(%r14,%rdx), %r8d
140092919:     	movq	0x1a8(%rbx), %r9
140092920:     	leaq	(%r8,%r8,8), %r8
140092924:     	addq	$0x4, %rdx
140092928:     	cmpq	$0x0, 0x10(%r9,%r8,8)
14009292e:     	je	0x140092910 <.text+0x91910>
140092930:     	jmp	0x140092e45 <.text+0x91e45>
140092935:     	leaq	(,%rax,4), %rcx
14009293d:     	xorl	%edx, %edx
14009293f:     	nop
140092940:     	cmpq	%rdx, %rcx
140092943:     	je	0x140092a92 <.text+0x91a92>
140092949:     	movl	(%r14,%rdx), %r8d
14009294d:     	movq	0x108(%rbx), %r9
140092954:     	leaq	(%r8,%r8,4), %r8
140092958:     	shlq	$0x5, %r8
14009295c:     	addq	$0x4, %rdx
140092960:     	cmpq	$0x0, 0x58(%r9,%r8)
140092966:     	je	0x140092940 <.text+0x91940>
140092968:     	jmp	0x140092e45 <.text+0x91e45>
14009296d:     	xorl	%eax, %eax
14009296f:     	addq	%rax, %r15
140092972:     	cmpq	(%rsi), %r15
140092975:     	je	0x1400928de <.text+0x918de>
14009297b:     	jmp	0x14009285e <.text+0x9185e>
140092980:     	movq	%r15, (%rsi)
140092983:     	leaq	(%r14,%rax,4), %r15
140092987:     	movq	0x50(%rsp), %r12
14009298c:     	movq	0x60(%rsp), %r10
140092991:     	movq	0x58(%rsp), %r8
140092996:     	movq	0x40(%rsp), %r9
14009299b:     	movq	0x48(%rsp), %rdi
1400929a0:     	movl	$0x8, %ebp
1400929a5:     	xorl	%r13d, %r13d
1400929a8:     	leaq	0x58842e1(%rip), %rdx   # 0x145916c90
1400929af:     	leaq	0x1a0(%rsp), %rcx
1400929b7:     	xorl	%esi, %esi
1400929b9:     	cmpl	%r13d, %esi
1400929bc:     	je	0x1400929e0 <.text+0x919e0>
1400929be:     	nop
1400929c0:     	movl	%esi, %eax
1400929c2:     	incl	%esi
1400929c4:     	movq	(%rbp,%rax,8), %rax
1400929c9:     	testl	%eax, %eax
1400929cb:     	jne	0x140092a11 <.text+0x91a11>
1400929cd:     	cmpl	%r13d, %esi
1400929d0:     	jne	0x1400929c0 <.text+0x919c0>
1400929d2:     	nopw	%cs:(%rax,%rax)
1400929e0:     	cmpq	%r15, %r14
1400929e3:     	je	0x140092ba5 <.text+0x91ba5>
1400929e9:     	movl	(%r14), %r11d
1400929ec:     	addq	$0x4, %r14
1400929f0:     	movq	0x1a8(%rbx), %rax
1400929f7:     	leaq	(%r11,%r11,8), %r11
1400929fb:     	movq	0x10(%rax,%r11,8), %r13
140092a00:     	testq	%r13, %r13
140092a03:     	je	0x1400929e0 <.text+0x919e0>
140092a05:     	leaq	(%rax,%r11,8), %rax
140092a09:     	movq	0x8(%rax), %rbp
140092a0d:     	xorl	%esi, %esi
140092a0f:     	jmp	0x1400929c0 <.text+0x919c0>
140092a11:     	testq	%r12, %r12
140092a14:     	movq	0x20(%rsp), %r11
140092a19:     	cmovneq	%r10, %r11
140092a1d:     	movq	%rax, 0x1a0(%rsp)
140092a25:     	movq	%r9, 0x1a8(%rsp)
140092a2d:     	movq	%rdi, 0x1b0(%rsp)
140092a35:     	movq	%r12, 0x1b8(%rsp)
140092a3d:     	movq	%r8, 0x1c0(%rsp)
140092a45:     	movq	%r11, 0x20(%rsp)
140092a4a:     	movq	%r11, 0x1c8(%rsp)
140092a52:     	movq	%r10, 0x38(%rsp)
140092a57:     	movq	%r8, 0x30(%rsp)
140092a5c:     	movq	%r9, 0x28(%rsp)
140092a61:     	callq	0x144e74f30 <.text+0x4e73f30>
140092a66:     	leaq	0x1a0(%rsp), %rcx
140092a6e:     	leaq	0x588421b(%rip), %rdx   # 0x145916c90
140092a75:     	movq	0x28(%rsp), %r9
140092a7a:     	movq	0x30(%rsp), %r8
140092a7f:     	movq	0x38(%rsp), %r10
140092a84:     	cmpl	%r13d, %esi
140092a87:     	je	0x1400929e0 <.text+0x919e0>
140092a8d:     	jmp	0x1400929c0 <.text+0x919c0>
140092a92:     	movq	%r15, (%rsi)
140092a95:     	leaq	(%r14,%rax,4), %r15
140092a99:     	movq	0x50(%rsp), %r12
140092a9e:     	movq	0x60(%rsp), %r10
140092aa3:     	movq	0x58(%rsp), %r8
140092aa8:     	movq	0x40(%rsp), %r9
140092aad:     	movq	0x48(%rsp), %rdi
140092ab2:     	movl	$0x8, %ebp
140092ab7:     	xorl	%r13d, %r13d
140092aba:     	leaq	0x58841cf(%rip), %rdx   # 0x145916c90
140092ac1:     	leaq	0x1a0(%rsp), %rcx
140092ac9:     	xorl	%esi, %esi
140092acb:     	cmpl	%r13d, %esi
140092ace:     	je	0x140092af0 <.text+0x91af0>
140092ad0:     	movl	%esi, %eax
140092ad2:     	shlq	$0x4, %rax
140092ad6:     	incl	%esi
140092ad8:     	movq	(%rbp,%rax), %rax
140092add:     	testl	%eax, %eax
140092adf:     	jne	0x140092b24 <.text+0x91b24>
140092ae1:     	cmpl	%r13d, %esi
140092ae4:     	jne	0x140092ad0 <.text+0x91ad0>
140092ae6:     	nopw	%cs:(%rax,%rax)
140092af0:     	cmpq	%r15, %r14
140092af3:     	je	0x140092ba5 <.text+0x91ba5>
140092af9:     	movl	(%r14), %r11d
140092afc:     	addq	$0x4, %r14
140092b00:     	movq	0x108(%rbx), %rax
140092b07:     	leaq	(%r11,%r11,4), %r11
140092b0b:     	shlq	$0x5, %r11
140092b0f:     	movq	0x58(%rax,%r11), %r13
140092b14:     	testq	%r13, %r13
140092b17:     	je	0x140092af0 <.text+0x91af0>
140092b19:     	addq	%r11, %rax
140092b1c:     	movq	0x50(%rax), %rbp
140092b20:     	xorl	%esi, %esi
140092b22:     	jmp	0x140092ad0 <.text+0x91ad0>
140092b24:     	testq	%r12, %r12
140092b27:     	movq	0x20(%rsp), %r11
140092b2c:     	cmovneq	%r10, %r11
140092b30:     	movq	%rax, 0x1a0(%rsp)
140092b38:     	movq	%r9, 0x1a8(%rsp)
140092b40:     	movq	%rdi, 0x1b0(%rsp)
140092b48:     	movq	%r12, 0x1b8(%rsp)
140092b50:     	movq	%r8, 0x1c0(%rsp)
140092b58:     	movq	%r11, 0x20(%rsp)
140092b5d:     	movq	%r11, 0x1c8(%rsp)
140092b65:     	movq	%r10, 0x38(%rsp)
140092b6a:     	movq	%r8, 0x30(%rsp)
140092b6f:     	movq	%r9, 0x28(%rsp)
140092b74:     	callq	0x144e74f30 <.text+0x4e73f30>
140092b79:     	leaq	0x1a0(%rsp), %rcx
140092b81:     	leaq	0x5884108(%rip), %rdx   # 0x145916c90
140092b88:     	movq	0x28(%rsp), %r9
140092b8d:     	movq	0x30(%rsp), %r8
140092b92:     	movq	0x38(%rsp), %r10
140092b97:     	cmpl	%r13d, %esi
140092b9a:     	je	0x140092af0 <.text+0x91af0>
140092ba0:     	jmp	0x140092ad0 <.text+0x91ad0>
140092ba5:     	leaq	0x68(%rsp), %rsi
140092baa:     	movups	0x5883cff(%rip), %xmm0  # 0x1459168b0
140092bb1:     	movaps	%xmm0, 0x120(%rsp)
140092bb9:     	movq	$0x0, 0x130(%rsp)
140092bc5:     	movups	0x5883cfc(%rip), %xmm1  # 0x1459168c8
140092bcc:     	movups	%xmm1, 0x138(%rsp)
140092bd4:     	movq	$0x0, 0x148(%rsp)
140092be0:     	movups	0x5883cf9(%rip), %xmm1  # 0x1459168e0
140092be7:     	movaps	%xmm1, 0x150(%rsp)
140092bef:     	movq	$0x0, 0x160(%rsp)
140092bfb:     	movups	0x5883cf6(%rip), %xmm2  # 0x1459168f8
140092c02:     	movups	%xmm2, 0x168(%rsp)
140092c0a:     	movq	$0x0, 0x178(%rsp)
140092c16:     	movaps	%xmm0, 0x1a0(%rsp)
140092c1e:     	movaps	%xmm1, 0x1d0(%rsp)
140092c26:     	movq	0x130(%rsp), %rax
140092c2e:     	movq	%rax, 0x1b0(%rsp)
140092c36:     	movq	0x138(%rsp), %rax
140092c3e:     	movq	%rax, 0x1b8(%rsp)
140092c46:     	movq	0x140(%rsp), %rax
140092c4e:     	movq	%rax, 0x1c0(%rsp)
140092c56:     	movq	0x148(%rsp), %rax
140092c5e:     	movq	%rax, 0x1c8(%rsp)
140092c66:     	movq	0x160(%rsp), %rax
140092c6e:     	movq	%rax, 0x1e0(%rsp)
140092c76:     	movq	0x168(%rsp), %rax
140092c7e:     	movq	%rax, 0x1e8(%rsp)
140092c86:     	movaps	0x170(%rsp), %xmm0
140092c8e:     	movaps	%xmm0, 0x1f0(%rsp)
140092c96:     	xorps	%xmm0, %xmm0
140092c99:     	movaps	%xmm0, 0x200(%rsp)
140092ca1:     	movq	$0x0, 0x210(%rsp)
140092cad:     	movsd	0x5882c6b(%rip), %xmm1  # 0x145915920
140092cb5:     	movups	%xmm1, 0x218(%rsp)
140092cbd:     	movabsq	$0x42c8000000000002, %rax # imm = 0x42C8000000000002
140092cc7:     	movq	%rax, 0x228(%rsp)
140092ccf:     	movaps	%xmm0, 0x240(%rsp)
140092cd7:     	movaps	%xmm0, 0x230(%rsp)
140092cdf:     	movq	$0x0, 0x250(%rsp)
140092ceb:     	movups	0x5883c86(%rip), %xmm0  # 0x145916978
140092cf2:     	movups	%xmm0, 0x268(%rsp)
140092cfa:     	movups	0x5883c67(%rip), %xmm0  # 0x145916968
140092d01:     	movups	%xmm0, 0x258(%rsp)
140092d09:     	movups	0x5883c88(%rip), %xmm0  # 0x145916998
140092d10:     	movups	%xmm0, 0x288(%rsp)
140092d18:     	movups	0x5883c69(%rip), %xmm0  # 0x145916988
140092d1f:     	movups	%xmm0, 0x278(%rsp)
140092d27:     	movups	0x5883c8a(%rip), %xmm0  # 0x1459169b8
140092d2e:     	movups	%xmm0, 0x2a8(%rsp)
140092d36:     	movups	0x5883c6b(%rip), %xmm0  # 0x1459169a8
140092d3d:     	movups	%xmm0, 0x298(%rsp)
140092d45:     	movups	0x5883c8c(%rip), %xmm0  # 0x1459169d8
140092d4c:     	movups	%xmm0, 0x2c8(%rsp)
140092d54:     	movups	0x5883c6d(%rip), %xmm0  # 0x1459169c8
140092d5b:     	movups	%xmm0, 0x2b8(%rsp)
140092d63:     	movaps	0x58745a6(%rip), %xmm0  # 0x145907310
140092d6a:     	movups	%xmm0, 0x2d8(%rsp)
140092d72:     	movl	$0x1, 0x2e8(%rsp)
140092d7d:     	movq	$0x0, 0x2ec(%rsp)
140092d89:     	movb	$0x1, 0x2f4(%rsp)
140092d91:     	movq	$0x0, 0x2f8(%rsp)
140092d9d:     	movl	$0x3f800000, 0x300(%rsp) # imm = 0x3F800000
140092da8:     	movw	$0x0, 0x304(%rsp)
140092db2:     	movw	$0x0, 0x30a(%rsp)
140092dbc:     	movl	$0x10000, 0x306(%rsp)   # imm = 0x10000
140092dc7:     	movw	$0x0, 0x310(%rsp)
140092dd1:     	movl	$0x10000, 0x30c(%rsp)   # imm = 0x10000
140092ddc:     	movabsq	$0x100000100, %rax      # imm = 0x100000100
140092de6:     	movq	%rax, 0x312(%rsp)
140092dee:     	movl	$0x5, 0x31a(%rsp)
140092df9:     	movl	$0x1004, 0x320(%rsp)    # imm = 0x1004
140092e04:     	movw	$0x0, 0x324(%rsp)
140092e0e:     	leaq	0x5883e63(%rip), %r9    # 0x145916c78
140092e15:     	leaq	0x120(%rsp), %rdi
140092e1d:     	leaq	0x40(%rsp), %rdx
140092e22:     	leaq	0x1a0(%rsp), %r8
140092e2a:     	movq	%rdi, %rcx
140092e2d:     	callq	0x1400ec6a0 <.text+0xeb6a0>
140092e32:     	leaq	0x180(%rsp), %r8
140092e3a:     	movq	%rdi, %rcx
140092e3d:     	movq	%rsi, %rdx
140092e40:     	callq	0x1401034a0 <.text+0x1024a0>
140092e45:     	movq	0xc8(%rsp), %rax
140092e4d:     	movq	0xd0(%rsp), %rcx
140092e55:     	movl	0xdc(%rsp), %edx
140092e5c:     	movq	0xf8(%rax), %r8
140092e63:     	movq	0x100(%rax), %r9
140092e6a:     	leaq	(%r8,%r9,4), %r9
140092e6e:     	movzbl	0x108(%rax), %r10d
140092e76:     	xorl	%r11d, %r11d
140092e79:     	movl	$0x8, %esi
140092e7e:     	movss	0x5880476(%rip), %xmm0  # 0x1459132fc
140092e86:     	movss	0x5880462(%rip), %xmm1  # 0x1459132f0
140092e8e:     	movss	0x58745fa(%rip), %xmm2  # 0x145907490
140092e96:     	movss	0x5882a92(%rip), %xmm3  # 0x145915930
140092e9e:     	movss	0x5874662(%rip), %xmm4  # 0x145907508
140092ea6:     	xorl	%ebx, %ebx
140092ea8:     	xorl	%edi, %edi
140092eaa:     	xorl	%ebp, %ebp
140092eac:     	jmp	0x140092eea <.text+0x91eea>
140092eae:     	nop
140092eb0:     	divss	%xmm1, %xmm5
140092eb4:     	movaps	%xmm5, %xmm7
140092eb7:     	xorps	%xmm5, %xmm5
140092eba:     	maxss	%xmm7, %xmm5
140092ebe:     	incl	%ebp
140092ec0:     	movaps	%xmm2, %xmm7
140092ec3:     	minss	%xmm5, %xmm7
140092ec7:     	movups	(%r13), %xmm5
140092ecc:     	movaps	%xmm5, 0x1a0(%rsp)
140092ed4:     	movl	%edx, (%r12)
140092ed8:     	movaps	0x1a0(%rsp), %xmm5
140092ee0:     	movups	%xmm5, (%r15)
140092ee4:     	movss	%xmm7, 0x10(%r15)
140092eea:     	testb	%r10b, %r10b
140092eed:     	je	0x140092f70 <.text+0x91f70>
140092ef3:     	cmpl	%r11d, %ebp
140092ef6:     	jne	0x140093014 <.text+0x92014>
140092efc:     	nopl	(%rax)
140092f00:     	cmpq	%r9, %r8
140092f03:     	je	0x140093141 <.text+0x92141>
140092f09:     	movl	(%r8), %r11d
140092f0c:     	addq	$0x4, %r8
140092f10:     	movq	0x1a8(%rcx), %rdi
140092f17:     	leaq	(%r11,%r11,8), %rbx
140092f1b:     	movq	0x10(%rdi,%rbx,8), %r11
140092f20:     	testq	%r11, %r11
140092f23:     	je	0x140092f00 <.text+0x91f00>
140092f25:     	leaq	(%rdi,%rbx,8), %r15
140092f29:     	movq	0x118(%rax), %rdi
140092f30:     	movq	0x18(%r15), %r14
140092f34:     	movq	0x38(%r15), %rbx
140092f38:     	cmpq	0x40(%r15), %rdi
140092f3c:     	jae	0x140092ff0 <.text+0x91ff0>
140092f42:     	movq	(%rbx,%rdi,8), %rdi
140092f46:     	testq	%rdi, %rdi
140092f49:     	je	0x140092ff0 <.text+0x91ff0>
140092f4f:     	notq	%rdi
140092f52:     	leaq	(%rdi,%rdi,2), %rdi
140092f56:     	shlq	$0x4, %rdi
140092f5a:     	movq	0x10(%r14,%rdi), %rdi
140092f5f:     	jmp	0x140092ff2 <.text+0x91ff2>
140092f64:     	nopw	%cs:(%rax,%rax)
140092f70:     	cmpl	%r11d, %ebp
140092f73:     	jne	0x140093041 <.text+0x92041>
140092f79:     	nopl	(%rax)
140092f80:     	cmpq	%r9, %r8
140092f83:     	je	0x140093141 <.text+0x92141>
140092f89:     	movl	(%r8), %r11d
140092f8c:     	addq	$0x4, %r8
140092f90:     	movq	0x108(%rcx), %rsi
140092f97:     	leaq	(%r11,%r11,4), %rdi
140092f9b:     	shlq	$0x5, %rdi
140092f9f:     	movq	0x58(%rsi,%rdi), %r11
140092fa4:     	testq	%r11, %r11
140092fa7:     	je	0x140092f80 <.text+0x91f80>
140092fa9:     	addq	%rdi, %rsi
140092fac:     	movl	0x94(%rsi), %edi
140092fb2:     	movq	0x1a8(%rcx), %r15
140092fb9:     	leaq	(%rdi,%rdi,8), %r12
140092fbd:     	movq	0x118(%rax), %rdi
140092fc4:     	movq	0x18(%r15,%r12,8), %r14
140092fc9:     	movq	0x38(%r15,%r12,8), %rbx
140092fce:     	cmpq	0x40(%r15,%r12,8), %rdi
140092fd3:     	jae	0x140093019 <.text+0x92019>
140092fd5:     	movq	(%rbx,%rdi,8), %rdi
140092fd9:     	testq	%rdi, %rdi
140092fdc:     	je	0x140093019 <.text+0x92019>
140092fde:     	notq	%rdi
140092fe1:     	leaq	(%rdi,%rdi,2), %rdi
140092fe5:     	shlq	$0x4, %rdi
140092fe9:     	movq	0x10(%r14,%rdi), %rdi
140092fee:     	jmp	0x14009301b <.text+0x9201b>
140092ff0:     	xorl	%edi, %edi
140092ff2:     	movq	0x110(%rax), %r15
140092ff9:     	movq	(%rbx,%r15,8), %rbx
140092ffd:     	notq	%rbx
140093000:     	leaq	(%rbx,%rbx,2), %r15
140093004:     	shlq	$0x4, %r15
140093008:     	movq	0x10(%r14,%r15), %rbx
14009300d:     	movq	0x28(%r14,%r15), %r14
140093012:     	xorl	%ebp, %ebp
140093014:     	movl	%ebp, %r13d
140093017:     	jmp	0x140093050 <.text+0x92050>
140093019:     	xorl	%edi, %edi
14009301b:     	movq	0x110(%rax), %r15
140093022:     	movq	(%rbx,%r15,8), %rbx
140093026:     	notq	%rbx
140093029:     	leaq	(%rbx,%rbx,2), %r15
14009302d:     	shlq	$0x4, %r15
140093031:     	movq	0x10(%r14,%r15), %rbx
140093036:     	movq	0x28(%r14,%r15), %r14
14009303b:     	movq	0x50(%rsi), %rsi
14009303f:     	xorl	%ebp, %ebp
140093041:     	movl	%ebp, %r15d
140093044:     	shlq	$0x4, %r15
140093048:     	movl	0x8(%rsi,%r15), %r13d
14009304d:     	notl	%r13d
140093050:     	leaq	(,%r13,4), %r15
140093058:     	addq	%r13, %r15
14009305b:     	leaq	(%rbx,%r15,4), %r15
14009305f:     	leaq	(%r14,%r13,4), %r12
140093063:     	leaq	(%r13,%r13,2), %r13
140093068:     	leaq	(%rdi,%r13,8), %r13
14009306c:     	movaps	%xmm6, %xmm5
14009306f:     	subss	0x14(%r13), %xmm5
140093075:     	divss	%xmm0, %xmm5
140093079:     	ucomiss	%xmm5, %xmm1
14009307c:     	ja	0x140092eb0 <.text+0x91eb0>
140093082:     	ucomiss	%xmm3, %xmm5
140093085:     	movaps	%xmm2, %xmm7
140093088:     	jbe	0x140092eb7 <.text+0x91eb7>
14009308e:     	movaps	%xmm2, %xmm7
140093091:     	subss	%xmm5, %xmm7
140093095:     	mulss	%xmm4, %xmm7
140093099:     	jmp	0x140092eb7 <.text+0x91eb7>
14009309e:     	movq	-0x20(%r12), %rdx
1400930a3:     	testq	%rdx, %rdx
1400930a6:     	je	0x1400930be <.text+0x920be>
1400930a8:     	movq	-0x18(%r12), %rcx
1400930ad:     	movl	$0x1, %r8d
1400930b3:     	movq	%r9, %r13
1400930b6:     	callq	0x1400021d0 <.text+0x11d0>
1400930bb:     	movq	%r13, %r9
1400930be:     	leaq	0x1(%rbx), %rax
1400930c2:     	cmpq	%r15, %rax
1400930c5:     	jae	0x14009312b <.text+0x9212b>
1400930c7:     	movq	%rbx, %r13
1400930ca:     	notq	%r13
1400930cd:     	addq	%r15, %r13
1400930d0:     	jmp	0x1400930fb <.text+0x920fb>
1400930d2:     	movq	%rbx, %rax
1400930d5:     	shlq	$0x5, %rax
1400930d9:     	movups	(%r12), %xmm0
1400930de:     	movups	0x10(%r12), %xmm1
1400930e4:     	movups	%xmm1, 0x10(%r14,%rax)
1400930ea:     	movups	%xmm0, (%r14,%rax)
1400930ef:     	incq	%rbx
1400930f2:     	addq	$0x20, %r12
1400930f6:     	decq	%r13
1400930f9:     	je	0x14009312b <.text+0x9212b>
1400930fb:     	movaps	%xmm6, %xmm0
1400930fe:     	subss	0x1c(%r12), %xmm0
140093105:     	ucomiss	%xmm0, %xmm7
140093108:     	ja	0x1400930d2 <.text+0x920d2>
14009310a:     	movq	(%r12), %rdx
14009310e:     	testq	%rdx, %rdx
140093111:     	je	0x1400930f2 <.text+0x920f2>
140093113:     	movq	0x8(%r12), %rcx
140093118:     	movl	$0x1, %r8d
14009311e:     	movq	%r9, %r15
140093121:     	callq	0x1400021d0 <.text+0x11d0>
140093126:     	movq	%r15, %r9
140093129:     	jmp	0x1400930f2 <.text+0x920f2>
14009312b:     	movq	%rbx, 0x10(%rdi)
14009312f:     	movq	%rbx, %r15
140093132:     	cmpq	$0x0, 0xe0(%rsp)
14009313b:     	jne	0x1400927ce <.text+0x917ce>
140093141:     	movaps	0x330(%rsp), %xmm6
140093149:     	movaps	0x340(%rsp), %xmm7
140093151:     	addq	$0x358, %rsp            # imm = 0x358
140093158:     	popq	%rbx
140093159:     	popq	%rbp
14009315a:     	popq	%rdi
14009315b:     	popq	%rsi
14009315c:     	popq	%r12
14009315e:     	popq	%r13
140093160:     	popq	%r14
140093162:     	popq	%r15
140093164:     	retq

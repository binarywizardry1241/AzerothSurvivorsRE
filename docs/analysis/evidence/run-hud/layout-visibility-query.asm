
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403908b0:     	pushq	%rbp
1403908b1:     	pushq	%r15
1403908b3:     	pushq	%r14
1403908b5:     	pushq	%r13
1403908b7:     	pushq	%r12
1403908b9:     	pushq	%rsi
1403908ba:     	pushq	%rdi
1403908bb:     	pushq	%rbx
1403908bc:     	subq	$0x378, %rsp            # imm = 0x378
1403908c3:     	leaq	0x80(%rsp), %rbp
1403908cb:     	movq	$-0x2, 0x2f0(%rbp)
1403908d6:     	movq	%rdx, %rdi
1403908d9:     	movq	%rcx, 0x2e0(%rbp)
1403908e0:     	movq	%rdx, %rcx
1403908e3:     	callq	0x14029b440 <.text+0x29a440>
1403908e8:     	movq	%rax, 0x2b8(%rbp)
1403908ef:     	movq	%rdi, %rcx
1403908f2:     	callq	0x1402a38d0 <.text+0x2a28d0>
1403908f7:     	movq	%rax, 0x2c8(%rbp)
1403908fe:     	movq	%rdi, %rcx
140390901:     	callq	0x1402a1de0 <.text+0x2a0de0>
140390906:     	movq	%rax, 0x2d0(%rbp)
14039090d:     	movq	%rdi, %rcx
140390910:     	callq	0x1402a5e70 <.text+0x2a4e70>
140390915:     	movq	%rax, 0x2d8(%rbp)
14039091c:     	movq	%rdi, %rcx
14039091f:     	callq	0x1402a63d0 <.text+0x2a53d0>
140390924:     	movq	%rax, 0x2c0(%rbp)
14039092b:     	movq	%rdi, %rcx
14039092e:     	callq	0x1402a0860 <.text+0x29f860>
140390933:     	movq	%rax, %rsi
140390936:     	movq	%rdi, %rcx
140390939:     	callq	0x1402a38d0 <.text+0x2a28d0>
14039093e:     	movq	%rax, %r14
140390941:     	movq	%rdi, %rcx
140390944:     	callq	0x1402a1de0 <.text+0x2a0de0>
140390949:     	movq	%rax, %r15
14039094c:     	movq	%rdi, %rcx
14039094f:     	callq	0x1402a5e70 <.text+0x2a4e70>
140390954:     	movq	%rax, %r12
140390957:     	movq	%rdi, %rcx
14039095a:     	callq	0x1402a2e00 <.text+0x2a1e00>
14039095f:     	movq	%rax, %rbx
140390962:     	movq	%rdi, %rcx
140390965:     	callq	0x14029fd90 <.text+0x29ed90>
14039096a:     	movq	%rax, %r13
14039096d:     	movq	%rdi, %rcx
140390970:     	callq	0x1402a5910 <.text+0x2a4910>
140390975:     	movq	0x2c0(%rbp), %rcx
14039097c:     	movq	%rcx, 0x278(%rbp)
140390983:     	movq	%rsi, 0x280(%rbp)
14039098a:     	movq	%r14, 0x288(%rbp)
140390991:     	movq	%r15, 0x290(%rbp)
140390998:     	movq	%r12, 0x298(%rbp)
14039099f:     	movq	%rbx, 0x2a0(%rbp)
1403909a6:     	movq	0x2b8(%rbp), %rbx
1403909ad:     	movq	%r13, 0x2a8(%rbp)
1403909b4:     	movq	%rax, 0x2b0(%rbp)
1403909bb:     	leaq	0x58(%rbp), %rcx
1403909bf:     	callq	0x144e68fa0 <.text+0x4e67fa0>
1403909c4:     	movzbl	0xe8(%rbp), %eax
1403909cb:     	cmpq	0x80(%rbp), %rbx
1403909d2:     	jae	0x140390b3f <.text+0x38fb3f>
1403909d8:     	movq	0x70(%rbp), %rcx
1403909dc:     	movq	%rbx, %rdx
1403909df:     	shrq	$0x6, %rdx
1403909e3:     	movq	(%rcx,%rdx,8), %rcx
1403909e7:     	btq	%rbx, %rcx
1403909eb:     	sbbb	$0x0, %al
1403909ed:     	jne	0x140390b47 <.text+0x38fb47>
1403909f3:     	movb	$0x1, 0x2ef(%rbp)
1403909fa:     	leaq	0x58(%rbp), %rcx
1403909fe:     	movq	%rbx, %rdx
140390a01:     	callq	0x144e62910 <.text+0x4e61910>
140390a06:     	nop
140390a07:     	movq	0x2c8(%rbp), %r14
140390a0e:     	movq	0x2d0(%rbp), %r15
140390a15:     	movq	0x2d8(%rbp), %r12
140390a1c:     	leaq	0x70(%rbp), %rsi
140390a20:     	movb	$0x1, 0x2ef(%rbp)
140390a27:     	movq	%rsi, %rcx
140390a2a:     	movq	%r14, %rdx
140390a2d:     	callq	0x144e61a00 <.text+0x4e60a00>
140390a32:     	nop
140390a33:     	movb	$0x1, 0x2ef(%rbp)
140390a3a:     	movq	%rsi, %rcx
140390a3d:     	movq	%r15, %rdx
140390a40:     	callq	0x144e61a00 <.text+0x4e60a00>
140390a45:     	nop
140390a46:     	movb	$0x1, 0x2ef(%rbp)
140390a4d:     	movq	%rsi, %rcx
140390a50:     	movq	%r12, %rdx
140390a53:     	callq	0x144e61a00 <.text+0x4e60a00>
140390a58:     	nop
140390a59:     	movb	$0x1, 0x2ef(%rbp)
140390a60:     	leaq	-0x58(%rbp), %rcx
140390a64:     	callq	0x144e68fa0 <.text+0x4e67fa0>
140390a69:     	nop
140390a6a:     	leaq	0x278(%rbp), %rcx
140390a71:     	leaq	-0x58(%rbp), %rdx
140390a75:     	callq	0x14027e020 <.text+0x27d020>
140390a7a:     	nop
140390a7b:     	leaq	0x58(%rbp), %rcx
140390a7f:     	leaq	-0x58(%rbp), %rdx
140390a83:     	callq	0x144e629e0 <.text+0x4e619e0>
140390a88:     	nop
140390a89:     	movb	$0x1, %r13b
140390a8c:     	cmpq	$0x0, 0x90(%rdi)
140390a94:     	je	0x140390be1 <.text+0x38fbe1>
140390a9a:     	movq	0x78(%rdi), %rax
140390a9e:     	movq	0x80(%rdi), %rcx
140390aa5:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
140390aaf:     	xorl	%r8d, %r8d
140390ab2:     	movdqa	0x5a32456(%rip), %xmm0  # 0x145dc2f10
140390aba:     	pcmpeqd	%xmm1, %xmm1
140390abe:     	movdqa	0x5a3cf6a(%rip), %xmm2  # 0x145dcda30
140390ac6:     	andq	%rcx, %rdx
140390ac9:     	movdqu	(%rax,%rdx), %xmm3
140390ace:     	movdqa	%xmm3, %xmm4
140390ad2:     	pcmpeqb	%xmm0, %xmm4
140390ad6:     	pmovmskb	%xmm4, %r9d
140390adb:     	testl	%r9d, %r9d
140390ade:     	je	0x140390b20 <.text+0x38fb20>
140390ae0:     	tzcntl	%r9d, %r10d
140390ae5:     	addq	%rdx, %r10
140390ae8:     	andq	%rcx, %r10
140390aeb:     	negq	%r10
140390aee:     	leaq	(%r10,%r10,2), %r10
140390af2:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140390af9:     	pcmpeqb	%xmm2, %xmm4
140390afd:     	pmovmskb	%xmm4, %r11d
140390b02:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140390b09:     	je	0x140390b87 <.text+0x38fb87>
140390b0b:     	leal	-0x1(%r9), %r10d
140390b0f:     	andw	%r9w, %r10w
140390b13:     	movl	%r10d, %r9d
140390b16:     	jne	0x140390ae0 <.text+0x38fae0>
140390b18:     	nopl	(%rax,%rax)
140390b20:     	pcmpeqb	%xmm1, %xmm3
140390b24:     	pmovmskb	%xmm3, %r9d
140390b29:     	testl	%r9d, %r9d
140390b2c:     	jne	0x140390be1 <.text+0x38fbe1>
140390b32:     	addq	%r8, %rdx
140390b35:     	addq	$0x10, %rdx
140390b39:     	addq	$0x10, %r8
140390b3d:     	jmp	0x140390ac6 <.text+0x38fac6>
140390b3f:     	testb	%al, %al
140390b41:     	je	0x1403909f3 <.text+0x38f9f3>
140390b47:     	leaq	0x2ee(%rbp), %rax
140390b4e:     	movq	%rax, 0x108(%rbp)
140390b55:     	leaq	0x4c55b14(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
140390b5c:     	movq	%rax, 0x110(%rbp)
140390b63:     	movb	$0x1, 0x2ef(%rbp)
140390b6a:     	leaq	0x5a1ae8f(%rip), %rcx   # 0x145daba00
140390b71:     	leaq	0x5a1aef0(%rip), %r8    # 0x145daba68
140390b78:     	leaq	0x108(%rbp), %rdx
140390b7f:     	callq	0x145d699c0 <.text+0x5d689c0>
140390b84:     	nop
140390b85:     	ud2
140390b87:     	leaq	(%rax,%r10,8), %rax
140390b8b:     	movq	-0x8(%rax), %rax
140390b8f:     	cmpq	0x218(%rdi), %rax
140390b96:     	jae	0x140390be1 <.text+0x38fbe1>
140390b98:     	movq	0x210(%rdi), %rcx
140390b9f:     	movq	(%rcx,%rax,8), %rcx
140390ba3:     	testq	%rcx, %rcx
140390ba6:     	je	0x140390be1 <.text+0x38fbe1>
140390ba8:     	movq	0x1e0(%rdi), %rax
140390baf:     	notq	%rcx
140390bb2:     	imulq	$0x38, %rcx, %rcx
140390bb6:     	cmpb	$0x1, 0x30(%rax,%rcx)
140390bbb:     	jne	0x140390be1 <.text+0x38fbe1>
140390bbd:     	addq	%rcx, %rax
140390bc0:     	movq	0x10(%rax), %rsi
140390bc4:     	leaq	0x58(%rbp), %rdx
140390bc8:     	movq	%rsi, %rcx
140390bcb:     	callq	0x144df2410 <.text+0x4df1410>
140390bd0:     	nop
140390bd1:     	leaq	0x40(%rdi), %rdx
140390bd5:     	movq	%rsi, %rcx
140390bd8:     	callq	0x144df2570 <.text+0x4df1570>
140390bdd:     	nop
140390bde:     	movl	%eax, %r13d
140390be1:     	movq	0x5a0(%rdi), %rsi
140390be8:     	leaq	0x148(%rbp), %rcx
140390bef:     	leaq	0x58(%rbp), %rdx
140390bf3:     	movl	$0xb0, %r8d
140390bf9:     	callq	0x145bc977b <.text+0x5bc877b>
140390bfe:     	movq	%rsi, 0x108(%rbp)
140390c05:     	movl	$0x0, 0x110(%rbp)
140390c0f:     	movq	$0x10, 0x118(%rbp)
140390c1a:     	pxor	%xmm0, %xmm0
140390c1e:     	movdqu	%xmm0, 0x120(%rbp)
140390c26:     	movq	$0x10, 0x130(%rbp)
140390c31:     	movdqu	%xmm0, 0x138(%rbp)
140390c39:     	movq	$0x0, 0x1f8(%rbp)
140390c44:     	movq	$0x4, 0x200(%rbp)
140390c4f:     	movq	$0x0, 0x208(%rbp)
140390c5a:     	movb	%r13b, 0x210(%rbp)
140390c61:     	movq	%rbx, 0x218(%rbp)
140390c68:     	movq	%r14, 0x220(%rbp)
140390c6f:     	movq	%r15, 0x228(%rbp)
140390c76:     	movq	%r12, 0x230(%rbp)
140390c7d:     	movdqu	0x278(%rbp), %xmm0
140390c85:     	movdqu	0x288(%rbp), %xmm1
140390c8d:     	movdqu	0x298(%rbp), %xmm2
140390c95:     	movdqu	0x2a8(%rbp), %xmm3
140390c9d:     	movdqu	%xmm0, 0x238(%rbp)
140390ca5:     	movdqu	%xmm1, 0x248(%rbp)
140390cad:     	movdqu	%xmm2, 0x258(%rbp)
140390cb5:     	movdqu	%xmm3, 0x268(%rbp)
140390cbd:     	movb	$0x0, 0x2ef(%rbp)
140390cc4:     	leaq	-0x58(%rbp), %rcx
140390cc8:     	callq	0x1403721e0 <.text+0x3711e0>
140390ccd:     	nop
140390cce:     	leaq	0x108(%rbp), %rcx
140390cd5:     	movq	%rdi, %rdx
140390cd8:     	callq	0x140390490 <.text+0x38f490>
140390cdd:     	nop
140390cde:     	leaq	0x108(%rbp), %rdx
140390ce5:     	movl	$0x170, %r8d            # imm = 0x170
140390ceb:     	movq	0x2e0(%rbp), %rsi
140390cf2:     	movq	%rsi, %rcx
140390cf5:     	callq	0x145bc977b <.text+0x5bc877b>
140390cfa:     	movq	%rsi, %rax
140390cfd:     	addq	$0x378, %rsp            # imm = 0x378
140390d04:     	popq	%rbx
140390d05:     	popq	%rdi
140390d06:     	popq	%rsi
140390d07:     	popq	%r12
140390d09:     	popq	%r13
140390d0b:     	popq	%r14
140390d0d:     	popq	%r15
140390d0f:     	popq	%rbp
140390d10:     	retq

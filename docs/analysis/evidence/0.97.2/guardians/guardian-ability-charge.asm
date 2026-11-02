
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cd7a8:     	movss	0x90(%rsi), %xmm8
1454cd7b1:     	jmp	0x1454cd7cd <.text+0x54cc7cd>
1454cd7b3:     	movss	0x90(%rsi), %xmm6
1454cd7bb:     	jmp	0x1454cd8e5 <.text+0x54cc8e5>
1454cd7c0:     	movss	0x90(%rsi), %xmm8
1454cd7c9:     	movaps	%xmm14, %xmm2
1454cd7cd:     	movq	0x2a0(%rbp), %rax
1454cd7d4:     	movq	0x878(%rax), %rcx
1454cd7db:     	cmpq	$-0x1, 0x40(%rcx)
1454cd7e0:     	movshdup	%xmm6, %xmm9            # xmm9 = xmm6[1,1,3,3]
1454cd7e5:     	je	0x1454cd9cc <.text+0x54cc9cc>
1454cd7eb:     	addq	$0x40, %rcx
1454cd7ef:     	movd	%xmm6, %edx
1454cd7f3:     	movd	%xmm9, %eax
1454cd7f8:     	shlq	$0x20, %rax
1454cd7fc:     	orq	%rax, %rdx
1454cd7ff:     	movd	%xmm2, %r8d
1454cd804:     	movd	%xmm10, %eax
1454cd809:     	shlq	$0x20, %rax
1454cd80d:     	orq	%rax, %r8
1454cd810:     	callq	0x14545e830 <.text+0x545d830>
1454cd815:     	nop
1454cd816:     	ucomiss	%xmm12, %xmm0
1454cd81a:     	jae	0x1454cd864 <.text+0x54cc864>
1454cd81c:     	movaps	%xmm6, %xmm1
1454cd81f:     	subps	%xmm14, %xmm1
1454cd823:     	mulps	%xmm1, %xmm1
1454cd826:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
1454cd82a:     	addss	%xmm1, %xmm2
1454cd82e:     	xorps	%xmm1, %xmm1
1454cd831:     	sqrtss	%xmm2, %xmm1
1454cd835:     	movss	0x41dc4b(%rip), %xmm2   # 0x1458eb488
1454cd83d:     	maxss	%xmm2, %xmm1
1454cd841:     	divss	%xmm1, %xmm2
1454cd845:     	subss	%xmm2, %xmm0
1454cd849:     	xorps	%xmm1, %xmm1
1454cd84c:     	maxss	%xmm1, %xmm0
1454cd850:     	subps	%xmm6, %xmm14
1454cd854:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454cd858:     	mulps	%xmm14, %xmm0
1454cd85c:     	addps	%xmm6, %xmm0
1454cd85f:     	movaps	%xmm0, %xmm1
1454cd862:     	jmp	0x1454cd868 <.text+0x54cc868>
1454cd864:     	movaps	%xmm14, %xmm1
1454cd868:     	movshdup	%xmm1, %xmm10           # xmm10 = xmm1[1,1,3,3]
1454cd86d:     	movq	0x2a0(%rbp), %rax
1454cd874:     	movq	0x878(%rax), %rsi
1454cd87b:     	leaq	0x10(%rsi), %rcx
1454cd87f:     	movaps	%xmm1, %xmm14
1454cd883:     	movaps	%xmm10, %xmm2
1454cd887:     	callq	0x1454627f0 <.text+0x54617f0>
1454cd88c:     	nop
1454cd88d:     	testb	$0x1, %al
1454cd88f:     	je	0x1454cd89a <.text+0x54cc89a>
1454cd891:     	movaps	%xmm0, %xmm8
1454cd895:     	jmp	0x1454cd9c8 <.text+0x54cc9c8>
1454cd89a:     	cmpq	$-0x1, 0x68(%rsi)
1454cd89f:     	movaps	%xmm14, %xmm2
1454cd8a3:     	je	0x1454cd9b4 <.text+0x54cc9b4>
1454cd8a9:     	leaq	0x68(%rsi), %rdx
1454cd8ad:     	leaq	0x1f0(%rbp), %rcx
1454cd8b4:     	movaps	%xmm10, %xmm3
1454cd8b8:     	callq	0x145467bf0 <.text+0x5466bf0>
1454cd8bd:     	nop
1454cd8be:     	cmpl	$0x1, 0x1f0(%rbp)
1454cd8c5:     	jne	0x1454cd9bf <.text+0x54cc9bf>
1454cd8cb:     	movss	0x1fc(%rbp), %xmm8
1454cd8d4:     	jmp	0x1454cd9c8 <.text+0x54cc9c8>
1454cd8d9:     	movss	0x90(%rsi), %xmm6
1454cd8e1:     	movaps	%xmm14, %xmm2
1454cd8e5:     	movlps	%xmm2, 0x1f0(%rbp)
1454cd8ec:     	movss	%xmm6, 0x1f8(%rbp)
1454cd8f4:     	movq	0x2a0(%rbp), %rcx
1454cd8fb:     	movl	%r15d, %edx
1454cd8fe:     	leaq	0x1f0(%rbp), %r8
1454cd905:     	movaps	%xmm8, %xmm3
1454cd909:     	callq	0x1454eeaa0 <.text+0x54edaa0>
1454cd90e:     	nop
1454cd90f:     	movq	%rax, %rbx
1454cd912:     	movq	0x2a0(%rbp), %rax
1454cd919:     	movq	0x4e8(%rax), %rsi
1454cd920:     	cmpq	0x4d8(%rax), %rsi
1454cd927:     	jne	0x1454cd936 <.text+0x54cc936>
1454cd929:     	movq	0x148(%rbp), %rcx
1454cd930:     	callq	0x14575b510 <.text+0x575a510>
1454cd935:     	nop
1454cd936:     	mulss	%xmm7, %xmm11
1454cd93b:     	movaps	0x240(%rbp), %xmm1
1454cd942:     	addss	%xmm1, %xmm10
1454cd947:     	movq	0x2a0(%rbp), %rdx
1454cd94e:     	movq	0x4e0(%rdx), %rax
1454cd955:     	imulq	$0x58, %rsi, %rcx
1454cd959:     	movq	$0x1, (%rax,%rcx)
1454cd961:     	movq	%r13, 0x8(%rax,%rcx)
1454cd966:     	movl	%r14d, 0x10(%rax,%rcx)
1454cd96b:     	movq	%rbx, 0x18(%rax,%rcx)
1454cd970:     	movl	$0x0, 0x20(%rax,%rcx)
1454cd978:     	movlps	%xmm14, 0x2c(%rax,%rcx)
1454cd97e:     	movss	%xmm6, 0x34(%rax,%rcx)
1454cd984:     	movss	%xmm8, 0x38(%rax,%rcx)
1454cd98b:     	movl	%r15d, 0x3c(%rax,%rcx)
1454cd990:     	movaps	0x42b3d9(%rip), %xmm0   # 0x1458f8d70
1454cd997:     	movss	%xmm1, %xmm0            # xmm0 = xmm1[0],xmm0[1,2,3]
1454cd99b:     	movlps	%xmm0, 0x40(%rax,%rcx)
1454cd9a0:     	movl	$0x0, 0x48(%rax,%rcx)
1454cd9a8:     	movss	%xmm11, 0x4c(%rax,%rcx)
1454cd9af:     	jmp	0x1454cdcf5 <.text+0x54cccf5>
1454cd9b4:     	movss	0x90(%rsi), %xmm8
1454cd9bd:     	jmp	0x1454cd9cc <.text+0x54cc9cc>
1454cd9bf:     	movss	0x90(%rsi), %xmm8
1454cd9c8:     	movaps	%xmm14, %xmm2
1454cd9cc:     	movaps	%xmm6, %xmm0
1454cd9cf:     	movaps	%xmm2, %xmm14
1454cd9d3:     	subss	%xmm2, %xmm0
1454cd9d7:     	movaps	%xmm9, %xmm1
1454cd9db:     	subss	%xmm10, %xmm1
1454cd9e0:     	mulss	%xmm0, %xmm0
1454cd9e4:     	mulss	%xmm1, %xmm1
1454cd9e8:     	addss	%xmm0, %xmm1
1454cd9ec:     	xorps	%xmm10, %xmm10
1454cd9f0:     	sqrtss	%xmm1, %xmm10
1454cd9f5:     	divss	0x470896(%rip), %xmm10  # 0x14593e294
1454cd9fe:     	maxss	0x55cb99(%rip), %xmm10  # 0x145a2a5a0
1454cda07:     	movq	0x2a0(%rbp), %rax
1454cda0e:     	movq	0x3d0(%rax), %rax
1454cda15:     	movq	%rax, 0x130(%rbp)
1454cda1c:     	movq	%rax, 0x198(%rbp)
1454cda23:     	movl	$0x0, 0x190(%rbp)
1454cda2d:     	movl	$0x0, 0x1b8(%rbp)
1454cda37:     	leaq	0x1b8(%rbp), %rax
1454cda3e:     	movq	%rax, 0x30(%rsp)
1454cda43:     	leaq	0x190(%rbp), %rax
1454cda4a:     	movq	%rax, 0x28(%rsp)
1454cda4f:     	movq	$0x1, 0x20(%rsp)
1454cda58:     	leaq	0x1f0(%rbp), %rcx
1454cda5f:     	movq	%r13, %rdx
1454cda62:     	movl	%r15d, %r8d
1454cda65:     	leaq	0x130(%rbp), %r9
1454cda6c:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454cda71:     	nop
1454cda72:     	movq	0x2a0(%rbp), %rax
1454cda79:     	movq	0x548(%rax), %rsi
1454cda80:     	cmpq	0x538(%rax), %rsi
1454cda87:     	jne	0x1454cda96 <.text+0x54cca96>
1454cda89:     	movq	0x290(%rbp), %rcx
1454cda90:     	callq	0x1457580b0 <.text+0x57570b0>
1454cda95:     	nop
1454cda96:     	movq	0x2a0(%rbp), %rdx
1454cda9d:     	movq	0x540(%rdx), %rax
1454cdaa4:     	movq	%rsi, %rcx
1454cdaa7:     	shlq	$0x5, %rcx
1454cdaab:     	movups	0x1f0(%rbp), %xmm0
1454cdab2:     	movups	0x200(%rbp), %xmm1
1454cdab9:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cdabe:     	movups	%xmm0, (%rax,%rcx)
1454cdac2:     	incq	%rsi
1454cdac5:     	movq	%rsi, 0x548(%rdx)
1454cdacc:     	movq	0x878(%rdx), %rcx
1454cdad3:     	addq	$0x10, %rcx
1454cdad7:     	movaps	%xmm6, %xmm1
1454cdada:     	movaps	%xmm9, %xmm2
1454cdade:     	callq	0x1454627f0 <.text+0x54617f0>
1454cdae3:     	nop
1454cdae4:     	movaps	%xmm0, %xmm9
1454cdae8:     	testb	$0x1, %al
1454cdaea:     	jne	0x1454cdaf0 <.text+0x54ccaf0>
1454cdaec:     	movaps	%xmm11, %xmm9
1454cdaf0:     	movq	0x2a0(%rbp), %rdx
1454cdaf7:     	movl	0x908(%rdx), %eax
1454cdafd:     	incl	%eax
1454cdaff:     	movaps	%xmm10, %xmm0
1454cdb03:     	mulss	0x463405(%rip), %xmm0   # 0x145930f10
1454cdb0b:     	cvttss2si	%xmm0, %rcx
1454cdb10:     	xorps	%xmm1, %xmm1
1454cdb13:     	ucomiss	%xmm1, %xmm0
1454cdb16:     	movl	$0x0, %r8d
1454cdb1c:     	cmovbl	%r8d, %ecx
1454cdb20:     	ucomiss	0x41d9f5(%rip), %xmm0   # 0x1458eb51c
1454cdb27:     	movl	%eax, 0x908(%rdx)
1454cdb2d:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454cdb32:     	cmoval	%edx, %ecx
1454cdb35:     	movlps	%xmm14, 0x1b8(%rbp)
1454cdb3d:     	movss	%xmm8, 0x1c0(%rbp)
1454cdb46:     	movlpd	%xmm6, 0x190(%rbp)
1454cdb4e:     	movss	%xmm9, 0x198(%rbp)
1454cdb57:     	movl	%ecx, 0x28(%rsp)
1454cdb5b:     	movl	%eax, 0x20(%rsp)
1454cdb5f:     	leaq	0x1f0(%rbp), %rcx
1454cdb66:     	movq	%r13, %rdx
1454cdb69:     	leaq	0x190(%rbp), %r8
1454cdb70:     	leaq	0x1b8(%rbp), %r9
1454cdb77:     	callq	0x145440d40 <.text+0x543fd40>
1454cdb7c:     	nop
1454cdb7d:     	movq	0x2a0(%rbp), %rax
1454cdb84:     	movq	0x548(%rax), %rsi
1454cdb8b:     	cmpq	0x538(%rax), %rsi
1454cdb92:     	jne	0x1454cdba1 <.text+0x54ccba1>
1454cdb94:     	movq	0x290(%rbp), %rcx
1454cdb9b:     	callq	0x1457580b0 <.text+0x57570b0>
1454cdba0:     	nop
1454cdba1:     	movq	0x2a0(%rbp), %rdx
1454cdba8:     	movq	0x540(%rdx), %rax
1454cdbaf:     	movq	%rsi, %rcx
1454cdbb2:     	shlq	$0x5, %rcx
1454cdbb6:     	movups	0x1f0(%rbp), %xmm0
1454cdbbd:     	movups	0x200(%rbp), %xmm1
1454cdbc4:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cdbc9:     	movups	%xmm0, (%rax,%rcx)
1454cdbcd:     	incq	%rsi
1454cdbd0:     	movq	%rsi, 0x548(%rdx)
1454cdbd7:     	cmpq	0x4d0(%rdx), %r12
1454cdbde:     	jae	0x1454cdc58 <.text+0x54ccc58>
1454cdbe0:     	movq	0x4c8(%rdx), %rax
1454cdbe7:     	movlpd	%xmm6, 0x10c(%rax,%rbx)
1454cdbf0:     	movss	%xmm9, 0x114(%rax,%rbx)
1454cdbfa:     	movlps	%xmm14, 0x118(%rax,%rbx)
1454cdc03:     	movss	%xmm8, 0x120(%rax,%rbx)
1454cdc0d:     	movaps	0x240(%rbp), %xmm0
1454cdc14:     	movss	%xmm0, 0x124(%rax,%rbx)
1454cdc1d:     	movss	%xmm10, 0x128(%rax,%rbx)
1454cdc27:     	addss	%xmm10, %xmm0
1454cdc2c:     	movaps	%xmm0, %xmm1
1454cdc2f:     	unpcklps	%xmm10, %xmm1           # xmm1 = xmm1[0],xmm10[0],xmm1[1],xmm10[1]
1454cdc33:     	addps	0x14dc9a6(%rip), %xmm1  # 0x1469aa5e0
1454cdc3a:     	movlps	%xmm1, 0x12c(%rax,%rbx)
1454cdc42:     	movaps	%xmm0, %xmm10
1454cdc46:     	movq	0x4e8(%rdx), %rsi
1454cdc4d:     	cmpq	0x4d8(%rdx), %rsi
1454cdc54:     	je	0x1454cdc71 <.text+0x54ccc71>
1454cdc56:     	jmp	0x1454cdc7e <.text+0x54ccc7e>
1454cdc58:     	addss	0x240(%rbp), %xmm10
1454cdc61:     	movq	0x4e8(%rdx), %rsi
1454cdc68:     	cmpq	0x4d8(%rdx), %rsi
1454cdc6f:     	jne	0x1454cdc7e <.text+0x54ccc7e>
1454cdc71:     	movq	0x148(%rbp), %rcx
1454cdc78:     	callq	0x14575b510 <.text+0x575a510>
1454cdc7d:     	nop
1454cdc7e:     	addss	%xmm7, %xmm7
1454cdc82:     	movq	0x2a0(%rbp), %rdx
1454cdc89:     	movq	0x4e0(%rdx), %rax
1454cdc90:     	imulq	$0x58, %rsi, %rcx
1454cdc94:     	movq	$0x1, (%rax,%rcx)
1454cdc9c:     	movq	%r13, 0x8(%rax,%rcx)
1454cdca1:     	movl	$0x18c7, 0x10(%rax,%rcx) # imm = 0x18C7
1454cdca9:     	movq	$0x0, 0x18(%rax,%rcx)
1454cdcb2:     	movl	$0x0, 0x20(%rax,%rcx)
1454cdcba:     	movlps	%xmm14, 0x2c(%rax,%rcx)
1454cdcc0:     	movss	%xmm8, 0x34(%rax,%rcx)
1454cdcc7:     	movq	$0x40900000, 0x38(%rax,%rcx) # imm = 0x40900000
1454cdcd0:     	movaps	0x42b099(%rip), %xmm0   # 0x1458f8d70
1454cdcd7:     	movaps	0x240(%rbp), %xmm1
1454cdcde:     	movss	%xmm1, %xmm0            # xmm0 = xmm1[0],xmm0[1,2,3]
1454cdce2:     	movlps	%xmm0, 0x40(%rax,%rcx)
1454cdce7:     	movl	$0x0, 0x48(%rax,%rcx)
1454cdcef:     	movss	%xmm7, 0x4c(%rax,%rcx)
1454cdcf5:     	movss	%xmm10, 0x50(%rax,%rcx)
1454cdcfc:     	movb	$0x0, 0x54(%rax,%rcx)
1454cdd01:     	incq	%rsi
1454cdd04:     	movq	%rsi, 0x4e8(%rdx)
1454cdd0b:     	jmp	0x1454ccbb0 <.text+0x54cbbb0>

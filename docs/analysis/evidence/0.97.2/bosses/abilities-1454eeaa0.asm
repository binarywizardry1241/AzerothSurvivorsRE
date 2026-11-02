
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454eeaa0:     	pushq	%rbp
1454eeaa1:     	pushq	%r15
1454eeaa3:     	pushq	%r14
1454eeaa5:     	pushq	%rsi
1454eeaa6:     	pushq	%rdi
1454eeaa7:     	pushq	%rbx
1454eeaa8:     	subq	$0xf8, %rsp
1454eeaaf:     	leaq	0x80(%rsp), %rbp
1454eeab7:     	movaps	%xmm7, 0x60(%rbp)
1454eeabb:     	movaps	%xmm6, 0x50(%rbp)
1454eeabf:     	movq	$-0x2, 0x48(%rbp)
1454eeac7:     	movaps	%xmm3, %xmm6
1454eeaca:     	movq	%r8, %rbx
1454eeacd:     	movl	%edx, %r15d
1454eead0:     	movq	%rcx, %rdi
1454eead3:     	movl	0x904(%rcx), %eax
1454eead9:     	incl	%eax
1454eeadb:     	movl	%eax, 0x904(%rcx)
1454eeae1:     	movabsq	$-0xf00000000000000, %rsi # imm = 0xF100000000000000
1454eeaeb:     	orq	%rax, %rsi
1454eeaee:     	movl	%edx, %ecx
1454eeaf0:     	callq	0x1454f0710 <.text+0x54ef710>
1454eeaf5:     	testb	$0x1, %al
1454eeaf7:     	jne	0x1454eeb03 <.text+0x54edb03>
1454eeaf9:     	movss	0x3fc97f(%rip), %xmm7   # 0x1458eb480
1454eeb01:     	jmp	0x1454eeb0a <.text+0x54edb0a>
1454eeb03:     	movaps	%xmm6, %xmm7
1454eeb06:     	divss	%xmm0, %xmm7
1454eeb0a:     	movq	$0x0, -0x8(%rbp)
1454eeb12:     	movq	$0x0, 0x8(%rbp)
1454eeb1a:     	leaq	-0x8(%rbp), %r14
1454eeb1e:     	movq	%r14, %rcx
1454eeb21:     	xorl	%edx, %edx
1454eeb23:     	movq	%rsi, %r8
1454eeb26:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454eeb2b:     	nop
1454eeb2c:     	movq	-0x8(%rbp), %rax
1454eeb30:     	testq	%rax, %rax
1454eeb33:     	je	0x1454eeb9b <.text+0x54edb9b>
1454eeb35:     	movq	(%rbp), %rcx
1454eeb39:     	movw	$0x2, %dx
1454eeb3d:     	movzwl	0x36(%rax), %r9d
1454eeb42:     	movl	%r9d, %r10d
1454eeb45:     	addl	%r10d, %r10d
1454eeb48:     	movq	$-0x1, %r8
1454eeb4f:     	nop
1454eeb50:     	testq	%r10, %r10
1454eeb53:     	je	0x1454eeb80 <.text+0x54edb80>
1454eeb55:     	cmpw	0x3a(%rax,%r8,2), %dx
1454eeb5b:     	seta	%r11b
1454eeb5f:     	sbbb	$0x0, %r11b
1454eeb63:     	incq	%r8
1454eeb66:     	addq	$-0x2, %r10
1454eeb6a:     	cmpb	$0x1, %r11b
1454eeb6e:     	je	0x1454eeb50 <.text+0x54edb50>
1454eeb70:     	movzbl	%r11b, %r9d
1454eeb74:     	testl	%r9d, %r9d
1454eeb77:     	je	0x1454eeb90 <.text+0x54edb90>
1454eeb79:     	jmp	0x1454eeb83 <.text+0x54edb83>
1454eeb7b:     	nopl	(%rax,%rax)
1454eeb80:     	movq	%r9, %r8
1454eeb83:     	subq	$0x1, %rcx
1454eeb87:     	jb	0x1454eeb9d <.text+0x54edb9d>
1454eeb89:     	movq	0x50(%rax,%r8,8), %rax
1454eeb8e:     	jmp	0x1454eeb3d <.text+0x54edb3d>
1454eeb90:     	movl	$0x41, 0x8(%rax,%r8,4)
1454eeb99:     	jmp	0x1454eebcd <.text+0x54edbcd>
1454eeb9b:     	xorl	%eax, %eax
1454eeb9d:     	movq	%r14, 0x10(%rbp)
1454eeba1:     	movq	%rax, 0x18(%rbp)
1454eeba5:     	movq	$0x0, 0x20(%rbp)
1454eebad:     	movq	%r8, 0x28(%rbp)
1454eebb1:     	movq	$0x2, 0x30(%rbp)
1454eebb9:     	leaq	-0x28(%rbp), %rcx
1454eebbd:     	leaq	0x10(%rbp), %rdx
1454eebc1:     	movl	$0x41, %r8d
1454eebc7:     	callq	0x145427a50 <.text+0x5426a50>
1454eebcc:     	nop
1454eebcd:     	movq	-0x8(%rbp), %rax
1454eebd1:     	testq	%rax, %rax
1454eebd4:     	je	0x1454eec37 <.text+0x54edc37>
1454eebd6:     	movq	(%rbp), %rcx
1454eebda:     	movw	$0x3, %dx
1454eebde:     	movzwl	0x36(%rax), %r9d
1454eebe3:     	movl	%r9d, %r10d
1454eebe6:     	addl	%r10d, %r10d
1454eebe9:     	movq	$-0x1, %r8
1454eebf0:     	testq	%r10, %r10
1454eebf3:     	je	0x1454eec20 <.text+0x54edc20>
1454eebf5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454eebfb:     	seta	%r11b
1454eebff:     	sbbb	$0x0, %r11b
1454eec03:     	incq	%r8
1454eec06:     	addq	$-0x2, %r10
1454eec0a:     	cmpb	$0x1, %r11b
1454eec0e:     	je	0x1454eebf0 <.text+0x54edbf0>
1454eec10:     	movzbl	%r11b, %r9d
1454eec14:     	testl	%r9d, %r9d
1454eec17:     	je	0x1454eec30 <.text+0x54edc30>
1454eec19:     	jmp	0x1454eec23 <.text+0x54edc23>
1454eec1b:     	nopl	(%rax,%rax)
1454eec20:     	movq	%r9, %r8
1454eec23:     	subq	$0x1, %rcx
1454eec27:     	jb	0x1454eec39 <.text+0x54edc39>
1454eec29:     	movq	0x50(%rax,%r8,8), %rax
1454eec2e:     	jmp	0x1454eebde <.text+0x54edbde>
1454eec30:     	movl	%r15d, 0x8(%rax,%r8,4)
1454eec35:     	jmp	0x1454eec66 <.text+0x54edc66>
1454eec37:     	xorl	%eax, %eax
1454eec39:     	movq	%r14, 0x10(%rbp)
1454eec3d:     	movq	%rax, 0x18(%rbp)
1454eec41:     	movq	$0x0, 0x20(%rbp)
1454eec49:     	movq	%r8, 0x28(%rbp)
1454eec4d:     	movq	$0x3, 0x30(%rbp)
1454eec55:     	leaq	-0x28(%rbp), %rcx
1454eec59:     	leaq	0x10(%rbp), %rdx
1454eec5d:     	movl	%r15d, %r8d
1454eec60:     	callq	0x145427a50 <.text+0x5426a50>
1454eec65:     	nop
1454eec66:     	movq	-0x8(%rbp), %rax
1454eec6a:     	testq	%rax, %rax
1454eec6d:     	je	0x1454eecd9 <.text+0x54edcd9>
1454eec6f:     	movq	(%rbp), %rcx
1454eec73:     	movw	$0x4, %dx
1454eec77:     	movzwl	0x36(%rax), %r8d
1454eec7c:     	movl	%r8d, %r10d
1454eec7f:     	addl	%r10d, %r10d
1454eec82:     	movq	$-0x1, %r9
1454eec89:     	nopl	(%rax)
1454eec90:     	testq	%r10, %r10
1454eec93:     	je	0x1454eecc0 <.text+0x54edcc0>
1454eec95:     	cmpw	0x3a(%rax,%r9,2), %dx
1454eec9b:     	seta	%r11b
1454eec9f:     	sbbb	$0x0, %r11b
1454eeca3:     	incq	%r9
1454eeca6:     	addq	$-0x2, %r10
1454eecaa:     	cmpb	$0x1, %r11b
1454eecae:     	je	0x1454eec90 <.text+0x54edc90>
1454eecb0:     	movzbl	%r11b, %r8d
1454eecb4:     	testl	%r8d, %r8d
1454eecb7:     	je	0x1454eecd0 <.text+0x54edcd0>
1454eecb9:     	jmp	0x1454eecc3 <.text+0x54edcc3>
1454eecbb:     	nopl	(%rax,%rax)
1454eecc0:     	movq	%r8, %r9
1454eecc3:     	subq	$0x1, %rcx
1454eecc7:     	jb	0x1454eecdb <.text+0x54edcdb>
1454eecc9:     	movq	0x50(%rax,%r9,8), %rax
1454eecce:     	jmp	0x1454eec77 <.text+0x54edc77>
1454eecd0:     	movss	%xmm7, 0x8(%rax,%r9,4)
1454eecd7:     	jmp	0x1454eed0a <.text+0x54edd0a>
1454eecd9:     	xorl	%eax, %eax
1454eecdb:     	movd	%xmm7, %r8d
1454eece0:     	movq	%r14, 0x10(%rbp)
1454eece4:     	movq	%rax, 0x18(%rbp)
1454eece8:     	movq	$0x0, 0x20(%rbp)
1454eecf0:     	movq	%r9, 0x28(%rbp)
1454eecf4:     	movq	$0x4, 0x30(%rbp)
1454eecfc:     	leaq	-0x28(%rbp), %rcx
1454eed00:     	leaq	0x10(%rbp), %rdx
1454eed04:     	callq	0x145427a50 <.text+0x5426a50>
1454eed09:     	nop
1454eed0a:     	movq	0x3d0(%rdi), %r8
1454eed11:     	leaq	-0x8(%rbp), %r14
1454eed15:     	movq	%r14, %rcx
1454eed18:     	movw	$0x6, %dx
1454eed1c:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454eed21:     	nop
1454eed22:     	movq	-0x8(%rbp), %rax
1454eed26:     	testq	%rax, %rax
1454eed29:     	je	0x1454eed9b <.text+0x54edd9b>
1454eed2b:     	movq	(%rbp), %rcx
1454eed2f:     	movw	$0x8, %dx
1454eed33:     	movzwl	0x36(%rax), %r9d
1454eed38:     	movl	%r9d, %r10d
1454eed3b:     	addl	%r10d, %r10d
1454eed3e:     	movq	$-0x1, %r8
1454eed45:     	nopw	%cs:(%rax,%rax)
1454eed50:     	testq	%r10, %r10
1454eed53:     	je	0x1454eed80 <.text+0x54edd80>
1454eed55:     	cmpw	0x3a(%rax,%r8,2), %dx
1454eed5b:     	seta	%r11b
1454eed5f:     	sbbb	$0x0, %r11b
1454eed63:     	incq	%r8
1454eed66:     	addq	$-0x2, %r10
1454eed6a:     	cmpb	$0x1, %r11b
1454eed6e:     	je	0x1454eed50 <.text+0x54edd50>
1454eed70:     	movzbl	%r11b, %r9d
1454eed74:     	testl	%r9d, %r9d
1454eed77:     	je	0x1454eed90 <.text+0x54edd90>
1454eed79:     	jmp	0x1454eed83 <.text+0x54edd83>
1454eed7b:     	nopl	(%rax,%rax)
1454eed80:     	movq	%r9, %r8
1454eed83:     	subq	$0x1, %rcx
1454eed87:     	jb	0x1454eed9d <.text+0x54edd9d>
1454eed89:     	movq	0x50(%rax,%r8,8), %rax
1454eed8e:     	jmp	0x1454eed33 <.text+0x54edd33>
1454eed90:     	movl	$0x1, 0x8(%rax,%r8,4)
1454eed99:     	jmp	0x1454eedcd <.text+0x54eddcd>
1454eed9b:     	xorl	%eax, %eax
1454eed9d:     	movq	%r14, 0x10(%rbp)
1454eeda1:     	movq	%rax, 0x18(%rbp)
1454eeda5:     	movq	$0x0, 0x20(%rbp)
1454eedad:     	movq	%r8, 0x28(%rbp)
1454eedb1:     	movq	$0x8, 0x30(%rbp)
1454eedb9:     	leaq	-0x28(%rbp), %rcx
1454eedbd:     	leaq	0x10(%rbp), %rdx
1454eedc1:     	movl	$0x1, %r8d
1454eedc7:     	callq	0x145427a50 <.text+0x5426a50>
1454eedcc:     	nop
1454eedcd:     	movq	-0x8(%rbp), %rax
1454eedd1:     	testq	%rax, %rax
1454eedd4:     	je	0x1454eee37 <.text+0x54ede37>
1454eedd6:     	movq	(%rbp), %rcx
1454eedda:     	movw	$0x9, %dx
1454eedde:     	movzwl	0x36(%rax), %r9d
1454eede3:     	movl	%r9d, %r10d
1454eede6:     	addl	%r10d, %r10d
1454eede9:     	movq	$-0x1, %r8
1454eedf0:     	testq	%r10, %r10
1454eedf3:     	je	0x1454eee20 <.text+0x54ede20>
1454eedf5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454eedfb:     	seta	%r11b
1454eedff:     	sbbb	$0x0, %r11b
1454eee03:     	incq	%r8
1454eee06:     	addq	$-0x2, %r10
1454eee0a:     	cmpb	$0x1, %r11b
1454eee0e:     	je	0x1454eedf0 <.text+0x54eddf0>
1454eee10:     	movzbl	%r11b, %r9d
1454eee14:     	testl	%r9d, %r9d
1454eee17:     	je	0x1454eee30 <.text+0x54ede30>
1454eee19:     	jmp	0x1454eee23 <.text+0x54ede23>
1454eee1b:     	nopl	(%rax,%rax)
1454eee20:     	movq	%r9, %r8
1454eee23:     	subq	$0x1, %rcx
1454eee27:     	jb	0x1454eee39 <.text+0x54ede39>
1454eee29:     	movq	0x50(%rax,%r8,8), %rax
1454eee2e:     	jmp	0x1454eedde <.text+0x54eddde>
1454eee30:     	movl	%r15d, 0x8(%rax,%r8,4)
1454eee35:     	jmp	0x1454eee66 <.text+0x54ede66>
1454eee37:     	xorl	%eax, %eax
1454eee39:     	movq	%r14, 0x10(%rbp)
1454eee3d:     	movq	%rax, 0x18(%rbp)
1454eee41:     	movq	$0x0, 0x20(%rbp)
1454eee49:     	movq	%r8, 0x28(%rbp)
1454eee4d:     	movq	$0x9, 0x30(%rbp)
1454eee55:     	leaq	-0x28(%rbp), %rcx
1454eee59:     	leaq	0x10(%rbp), %rdx
1454eee5d:     	movl	%r15d, %r8d
1454eee60:     	callq	0x145427a50 <.text+0x5426a50>
1454eee65:     	nop
1454eee66:     	movq	-0x8(%rbp), %rax
1454eee6a:     	testq	%rax, %rax
1454eee6d:     	je	0x1454eeed9 <.text+0x54eded9>
1454eee6f:     	movq	(%rbp), %rcx
1454eee73:     	movw	$0xa, %dx
1454eee77:     	movzwl	0x36(%rax), %r8d
1454eee7c:     	movl	%r8d, %r10d
1454eee7f:     	addl	%r10d, %r10d
1454eee82:     	movq	$-0x1, %r9
1454eee89:     	nopl	(%rax)
1454eee90:     	testq	%r10, %r10
1454eee93:     	je	0x1454eeec0 <.text+0x54edec0>
1454eee95:     	cmpw	0x3a(%rax,%r9,2), %dx
1454eee9b:     	seta	%r11b
1454eee9f:     	sbbb	$0x0, %r11b
1454eeea3:     	incq	%r9
1454eeea6:     	addq	$-0x2, %r10
1454eeeaa:     	cmpb	$0x1, %r11b
1454eeeae:     	je	0x1454eee90 <.text+0x54ede90>
1454eeeb0:     	movzbl	%r11b, %r8d
1454eeeb4:     	testl	%r8d, %r8d
1454eeeb7:     	je	0x1454eeed0 <.text+0x54eded0>
1454eeeb9:     	jmp	0x1454eeec3 <.text+0x54edec3>
1454eeebb:     	nopl	(%rax,%rax)
1454eeec0:     	movq	%r8, %r9
1454eeec3:     	subq	$0x1, %rcx
1454eeec7:     	jb	0x1454eeedb <.text+0x54ededb>
1454eeec9:     	movq	0x50(%rax,%r9,8), %rax
1454eeece:     	jmp	0x1454eee77 <.text+0x54ede77>
1454eeed0:     	movss	%xmm6, 0x8(%rax,%r9,4)
1454eeed7:     	jmp	0x1454eef0a <.text+0x54edf0a>
1454eeed9:     	xorl	%eax, %eax
1454eeedb:     	movd	%xmm6, %r8d
1454eeee0:     	movq	%r14, 0x10(%rbp)
1454eeee4:     	movq	%rax, 0x18(%rbp)
1454eeee8:     	movq	$0x0, 0x20(%rbp)
1454eeef0:     	movq	%r9, 0x28(%rbp)
1454eeef4:     	movq	$0xa, 0x30(%rbp)
1454eeefc:     	leaq	-0x28(%rbp), %rcx
1454eef00:     	leaq	0x10(%rbp), %rdx
1454eef04:     	callq	0x145427a50 <.text+0x5426a50>
1454eef09:     	nop
1454eef0a:     	movd	(%rbx), %xmm0
1454eef0e:     	movq	-0x8(%rbp), %rax
1454eef12:     	testq	%rax, %rax
1454eef15:     	je	0x1454eef89 <.text+0x54edf89>
1454eef17:     	movq	(%rbp), %rcx
1454eef1b:     	movw	$0xb, %dx
1454eef1f:     	movzwl	0x36(%rax), %r8d
1454eef24:     	movl	%r8d, %r10d
1454eef27:     	addl	%r10d, %r10d
1454eef2a:     	movq	$-0x1, %r9
1454eef31:     	nopw	%cs:(%rax,%rax)
1454eef40:     	testq	%r10, %r10
1454eef43:     	je	0x1454eef70 <.text+0x54edf70>
1454eef45:     	cmpw	0x3a(%rax,%r9,2), %dx
1454eef4b:     	seta	%r11b
1454eef4f:     	sbbb	$0x0, %r11b
1454eef53:     	incq	%r9
1454eef56:     	addq	$-0x2, %r10
1454eef5a:     	cmpb	$0x1, %r11b
1454eef5e:     	je	0x1454eef40 <.text+0x54edf40>
1454eef60:     	movzbl	%r11b, %r8d
1454eef64:     	testl	%r8d, %r8d
1454eef67:     	je	0x1454eef80 <.text+0x54edf80>
1454eef69:     	jmp	0x1454eef73 <.text+0x54edf73>
1454eef6b:     	nopl	(%rax,%rax)
1454eef70:     	movq	%r8, %r9
1454eef73:     	subq	$0x1, %rcx
1454eef77:     	jb	0x1454eef8b <.text+0x54edf8b>
1454eef79:     	movq	0x50(%rax,%r9,8), %rax
1454eef7e:     	jmp	0x1454eef1f <.text+0x54edf1f>
1454eef80:     	movd	%xmm0, 0x8(%rax,%r9,4)
1454eef87:     	jmp	0x1454eefba <.text+0x54edfba>
1454eef89:     	xorl	%eax, %eax
1454eef8b:     	movd	%xmm0, %r8d
1454eef90:     	movq	%r14, 0x10(%rbp)
1454eef94:     	movq	%rax, 0x18(%rbp)
1454eef98:     	movq	$0x0, 0x20(%rbp)
1454eefa0:     	movq	%r9, 0x28(%rbp)
1454eefa4:     	movq	$0xb, 0x30(%rbp)
1454eefac:     	leaq	-0x28(%rbp), %rcx
1454eefb0:     	leaq	0x10(%rbp), %rdx
1454eefb4:     	callq	0x145427a50 <.text+0x5426a50>
1454eefb9:     	nop
1454eefba:     	movd	0x4(%rbx), %xmm0
1454eefbf:     	movq	-0x8(%rbp), %rax
1454eefc3:     	testq	%rax, %rax
1454eefc6:     	je	0x1454ef039 <.text+0x54ee039>
1454eefc8:     	movq	(%rbp), %rcx
1454eefcc:     	movw	$0xc, %dx
1454eefd0:     	movzwl	0x36(%rax), %r8d
1454eefd5:     	movl	%r8d, %r10d
1454eefd8:     	addl	%r10d, %r10d
1454eefdb:     	movq	$-0x1, %r9
1454eefe2:     	nopw	%cs:(%rax,%rax)
1454eeff0:     	testq	%r10, %r10
1454eeff3:     	je	0x1454ef020 <.text+0x54ee020>
1454eeff5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454eeffb:     	seta	%r11b
1454eefff:     	sbbb	$0x0, %r11b
1454ef003:     	incq	%r9
1454ef006:     	addq	$-0x2, %r10
1454ef00a:     	cmpb	$0x1, %r11b
1454ef00e:     	je	0x1454eeff0 <.text+0x54edff0>
1454ef010:     	movzbl	%r11b, %r8d
1454ef014:     	testl	%r8d, %r8d
1454ef017:     	je	0x1454ef030 <.text+0x54ee030>
1454ef019:     	jmp	0x1454ef023 <.text+0x54ee023>
1454ef01b:     	nopl	(%rax,%rax)
1454ef020:     	movq	%r8, %r9
1454ef023:     	subq	$0x1, %rcx
1454ef027:     	jb	0x1454ef03b <.text+0x54ee03b>
1454ef029:     	movq	0x50(%rax,%r9,8), %rax
1454ef02e:     	jmp	0x1454eefd0 <.text+0x54edfd0>
1454ef030:     	movd	%xmm0, 0x8(%rax,%r9,4)
1454ef037:     	jmp	0x1454ef06a <.text+0x54ee06a>
1454ef039:     	xorl	%eax, %eax
1454ef03b:     	movd	%xmm0, %r8d
1454ef040:     	movq	%r14, 0x10(%rbp)
1454ef044:     	movq	%rax, 0x18(%rbp)
1454ef048:     	movq	$0x0, 0x20(%rbp)
1454ef050:     	movq	%r9, 0x28(%rbp)
1454ef054:     	movq	$0xc, 0x30(%rbp)
1454ef05c:     	leaq	-0x28(%rbp), %rcx
1454ef060:     	leaq	0x10(%rbp), %rdx
1454ef064:     	callq	0x145427a50 <.text+0x5426a50>
1454ef069:     	nop
1454ef06a:     	movd	0x8(%rbx), %xmm0
1454ef06f:     	movq	-0x8(%rbp), %rax
1454ef073:     	testq	%rax, %rax
1454ef076:     	je	0x1454ef0e9 <.text+0x54ee0e9>
1454ef078:     	movq	(%rbp), %rcx
1454ef07c:     	movw	$0xd, %dx
1454ef080:     	movzwl	0x36(%rax), %r8d
1454ef085:     	movl	%r8d, %r10d
1454ef088:     	addl	%r10d, %r10d
1454ef08b:     	movq	$-0x1, %r9
1454ef092:     	nopw	%cs:(%rax,%rax)
1454ef0a0:     	testq	%r10, %r10
1454ef0a3:     	je	0x1454ef0d0 <.text+0x54ee0d0>
1454ef0a5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454ef0ab:     	seta	%r11b
1454ef0af:     	sbbb	$0x0, %r11b
1454ef0b3:     	incq	%r9
1454ef0b6:     	addq	$-0x2, %r10
1454ef0ba:     	cmpb	$0x1, %r11b
1454ef0be:     	je	0x1454ef0a0 <.text+0x54ee0a0>
1454ef0c0:     	movzbl	%r11b, %r8d
1454ef0c4:     	testl	%r8d, %r8d
1454ef0c7:     	je	0x1454ef0e0 <.text+0x54ee0e0>
1454ef0c9:     	jmp	0x1454ef0d3 <.text+0x54ee0d3>
1454ef0cb:     	nopl	(%rax,%rax)
1454ef0d0:     	movq	%r8, %r9
1454ef0d3:     	subq	$0x1, %rcx
1454ef0d7:     	jb	0x1454ef0eb <.text+0x54ee0eb>
1454ef0d9:     	movq	0x50(%rax,%r9,8), %rax
1454ef0de:     	jmp	0x1454ef080 <.text+0x54ee080>
1454ef0e0:     	movd	%xmm0, 0x8(%rax,%r9,4)
1454ef0e7:     	jmp	0x1454ef11a <.text+0x54ee11a>
1454ef0e9:     	xorl	%eax, %eax
1454ef0eb:     	movd	%xmm0, %r8d
1454ef0f0:     	movq	%r14, 0x10(%rbp)
1454ef0f4:     	movq	%rax, 0x18(%rbp)
1454ef0f8:     	movq	$0x0, 0x20(%rbp)
1454ef100:     	movq	%r9, 0x28(%rbp)
1454ef104:     	movq	$0xd, 0x30(%rbp)
1454ef10c:     	leaq	-0x28(%rbp), %rcx
1454ef110:     	leaq	0x10(%rbp), %rdx
1454ef114:     	callq	0x145427a50 <.text+0x5426a50>
1454ef119:     	nop
1454ef11a:     	movq	-0x8(%rbp), %rax
1454ef11e:     	testq	%rax, %rax
1454ef121:     	je	0x1454ef18b <.text+0x54ee18b>
1454ef123:     	movq	(%rbp), %rcx
1454ef127:     	movw	$0xe, %dx
1454ef12b:     	movzwl	0x36(%rax), %r9d
1454ef130:     	movl	%r9d, %r10d
1454ef133:     	addl	%r10d, %r10d
1454ef136:     	movq	$-0x1, %r8
1454ef13d:     	nopl	(%rax)
1454ef140:     	testq	%r10, %r10
1454ef143:     	je	0x1454ef170 <.text+0x54ee170>
1454ef145:     	cmpw	0x3a(%rax,%r8,2), %dx
1454ef14b:     	seta	%r11b
1454ef14f:     	sbbb	$0x0, %r11b
1454ef153:     	incq	%r8
1454ef156:     	addq	$-0x2, %r10
1454ef15a:     	cmpb	$0x1, %r11b
1454ef15e:     	je	0x1454ef140 <.text+0x54ee140>
1454ef160:     	movzbl	%r11b, %r9d
1454ef164:     	testl	%r9d, %r9d
1454ef167:     	je	0x1454ef180 <.text+0x54ee180>
1454ef169:     	jmp	0x1454ef173 <.text+0x54ee173>
1454ef16b:     	nopl	(%rax,%rax)
1454ef170:     	movq	%r9, %r8
1454ef173:     	subq	$0x1, %rcx
1454ef177:     	jb	0x1454ef18d <.text+0x54ee18d>
1454ef179:     	movq	0x50(%rax,%r8,8), %rax
1454ef17e:     	jmp	0x1454ef12b <.text+0x54ee12b>
1454ef180:     	movl	$0x0, 0x8(%rax,%r8,4)
1454ef189:     	jmp	0x1454ef1ba <.text+0x54ee1ba>
1454ef18b:     	xorl	%eax, %eax
1454ef18d:     	movq	%r14, 0x10(%rbp)
1454ef191:     	movq	%rax, 0x18(%rbp)
1454ef195:     	movq	$0x0, 0x20(%rbp)
1454ef19d:     	movq	%r8, 0x28(%rbp)
1454ef1a1:     	movq	$0xe, 0x30(%rbp)
1454ef1a9:     	leaq	-0x28(%rbp), %rcx
1454ef1ad:     	leaq	0x10(%rbp), %rdx
1454ef1b1:     	xorl	%r8d, %r8d
1454ef1b4:     	callq	0x145427a50 <.text+0x5426a50>
1454ef1b9:     	nop
1454ef1ba:     	movl	$0x0, -0x30(%rbp)
1454ef1c1:     	movq	$0x0, -0x48(%rbp)
1454ef1c9:     	movq	$0x1, -0x40(%rbp)
1454ef1d1:     	movq	$0x0, -0x38(%rbp)
1454ef1d9:     	movb	$0x1, 0x47(%rbp)
1454ef1dd:     	movq	%r14, 0x28(%rsp)
1454ef1e2:     	movl	$0x0, 0x20(%rsp)
1454ef1ea:     	leaq	-0x48(%rbp), %rcx
1454ef1ee:     	movq	%rsi, %rdx
1454ef1f1:     	movb	$0x6, %r8b
1454ef1f4:     	movq	%rbx, %r9
1454ef1f7:     	callq	0x1454ff870 <.text+0x54fe870>
1454ef1fc:     	nop
1454ef1fd:     	movdqu	-0x48(%rbp), %xmm0
1454ef202:     	movups	-0x38(%rbp), %xmm1
1454ef206:     	movaps	%xmm1, 0x20(%rbp)
1454ef20a:     	movdqa	%xmm0, 0x10(%rbp)
1454ef20f:     	movb	$0x0, 0x47(%rbp)
1454ef213:     	leaq	-0x28(%rbp), %rcx
1454ef217:     	leaq	0x10(%rbp), %rdx
1454ef21b:     	callq	0x1454ffad0 <.text+0x54fead0>
1454ef220:     	nop
1454ef221:     	movq	0x548(%rdi), %rbx
1454ef228:     	cmpq	0x538(%rdi), %rbx
1454ef22f:     	jne	0x1454ef23e <.text+0x54ee23e>
1454ef231:     	leaq	0x538(%rdi), %rcx
1454ef238:     	callq	0x1457580b0 <.text+0x57570b0>
1454ef23d:     	nop
1454ef23e:     	movq	0x540(%rdi), %rax
1454ef245:     	movq	%rbx, %rcx
1454ef248:     	shlq	$0x5, %rcx
1454ef24c:     	movups	-0x28(%rbp), %xmm0
1454ef250:     	movups	-0x18(%rbp), %xmm1
1454ef254:     	movups	%xmm1, 0x10(%rax,%rcx)
1454ef259:     	movups	%xmm0, (%rax,%rcx)
1454ef25d:     	incq	%rbx
1454ef260:     	movq	%rbx, 0x548(%rdi)
1454ef267:     	leaq	-0x8(%rbp), %rcx
1454ef26b:     	callq	0x1455127d0 <.text+0x55117d0>
1454ef270:     	movq	%rsi, %rax
1454ef273:     	movaps	0x50(%rbp), %xmm6
1454ef277:     	movaps	0x60(%rbp), %xmm7
1454ef27b:     	addq	$0xf8, %rsp
1454ef282:     	popq	%rbx
1454ef283:     	popq	%rdi
1454ef284:     	popq	%rsi
1454ef285:     	popq	%r14
1454ef287:     	popq	%r15
1454ef289:     	popq	%rbp
1454ef28a:     	retq

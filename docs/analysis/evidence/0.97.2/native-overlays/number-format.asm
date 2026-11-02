
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547ccf0:     	pushq	%rbp
14547ccf1:     	pushq	%r15
14547ccf3:     	pushq	%r14
14547ccf5:     	pushq	%rsi
14547ccf6:     	pushq	%rdi
14547ccf7:     	pushq	%rbx
14547ccf8:     	subq	$0x68, %rsp
14547ccfc:     	leaq	0x60(%rsp), %rbp
14547cd01:     	movq	$-0x2, (%rbp)
14547cd09:     	movq	%rcx, %rsi
14547cd0c:     	movss	%xmm1, -0x4(%rbp)
14547cd11:     	leaq	-0x4(%rbp), %rax
14547cd15:     	ucomiss	0x1511eb8(%rip), %xmm1  # 0x14698ebd4
14547cd1c:     	jae	0x14547cd54 <.text+0x547bd54>
14547cd1e:     	movq	%rax, -0x20(%rbp)
14547cd22:     	leaq	0x2a05b7(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
14547cd29:     	movq	%rax, -0x18(%rbp)
14547cd2d:     	leaq	0x1529b7c(%rip), %rdx   # 0x1469a68b0
14547cd34:     	leaq	-0x38(%rbp), %rcx
14547cd38:     	leaq	-0x20(%rbp), %r8
14547cd3c:     	callq	0x14570bf80 <.text+0x570af80>
14547cd41:     	movq	-0x30(%rbp), %rbx
14547cd45:     	movq	-0x28(%rbp), %rdi
14547cd49:     	cmpq	$0x2, %rdi
14547cd4d:     	jae	0x14547cd7b <.text+0x547bd7b>
14547cd4f:     	xorl	%r14d, %r14d
14547cd52:     	jmp	0x14547cd86 <.text+0x547bd86>
14547cd54:     	movq	%rax, -0x20(%rbp)
14547cd58:     	leaq	0x2a0581(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
14547cd5f:     	movq	%rax, -0x18(%rbp)
14547cd63:     	leaq	0x152c91b(%rip), %rdx   # 0x1469a9685
14547cd6a:     	leaq	-0x20(%rbp), %r8
14547cd6e:     	movq	%rsi, %rcx
14547cd71:     	callq	0x14570bf80 <.text+0x570af80>
14547cd76:     	jmp	0x14547ce37 <.text+0x547be37>
14547cd7b:     	cmpw	$0x302e, -0x2(%rbx,%rdi) # imm = 0x302E
14547cd82:     	sete	%r14b
14547cd86:     	leaq	-0x20(%rbp), %rcx
14547cd8a:     	leaq	-0x38(%rbp), %rdx
14547cd8e:     	callq	0x14570c440 <.text+0x570b440>
14547cd93:     	nop
14547cd94:     	testb	%r14b, %r14b
14547cd97:     	je	0x14547cdb3 <.text+0x547bdb3>
14547cd99:     	addq	$-0x2, %rdi
14547cd9d:     	testq	%rdi, %rdi
14547cda0:     	jns	0x14547cdc4 <.text+0x547bdc4>
14547cda2:     	xorl	%r15d, %r15d
14547cda5:     	movq	%r15, %rcx
14547cda8:     	movq	%rdi, %rdx
14547cdab:     	callq	0x1458e721b <.text+0x58e621b>
14547cdb0:     	nop
14547cdb1:     	ud2
14547cdb3:     	movq	-0x10(%rbp), %rax
14547cdb7:     	movq	%rax, 0x10(%rsi)
14547cdbb:     	movups	-0x20(%rbp), %xmm0
14547cdbf:     	movups	%xmm0, (%rsi)
14547cdc2:     	jmp	0x14547ce1f <.text+0x547be1f>
14547cdc4:     	je	0x14547cdf6 <.text+0x547bdf6>
14547cdc6:     	callq	0x140002200 <.text+0x1200>
14547cdcb:     	movl	$0x1, %r15d
14547cdd1:     	movl	$0x1, %edx
14547cdd6:     	movq	%rdi, %rcx
14547cdd9:     	callq	0x1400021c0 <.text+0x11c0>
14547cdde:     	testq	%rax, %rax
14547cde1:     	je	0x14547cda5 <.text+0x547bda5>
14547cde3:     	movq	%rax, %r14
14547cde6:     	movq	%rax, %rcx
14547cde9:     	movq	%rbx, %rdx
14547cdec:     	movq	%rdi, %r8
14547cdef:     	callq	0x145756ddd <.text+0x5755ddd>
14547cdf4:     	jmp	0x14547cdfc <.text+0x547bdfc>
14547cdf6:     	movl	$0x1, %r14d
14547cdfc:     	movq	%rdi, (%rsi)
14547cdff:     	movq	%r14, 0x8(%rsi)
14547ce03:     	movq	%rdi, 0x10(%rsi)
14547ce07:     	movq	-0x20(%rbp), %rdx
14547ce0b:     	testq	%rdx, %rdx
14547ce0e:     	je	0x14547ce1f <.text+0x547be1f>
14547ce10:     	movq	-0x18(%rbp), %rcx
14547ce14:     	movl	$0x1, %r8d
14547ce1a:     	callq	0x1400021d0 <.text+0x11d0>
14547ce1f:     	movq	-0x38(%rbp), %rdx
14547ce23:     	testq	%rdx, %rdx
14547ce26:     	je	0x14547ce37 <.text+0x547be37>
14547ce28:     	movq	-0x30(%rbp), %rcx
14547ce2c:     	movl	$0x1, %r8d
14547ce32:     	callq	0x1400021d0 <.text+0x11d0>
14547ce37:     	movq	%rsi, %rax
14547ce3a:     	addq	$0x68, %rsp
14547ce3e:     	popq	%rbx
14547ce3f:     	popq	%rdi
14547ce40:     	popq	%rsi
14547ce41:     	popq	%r14
14547ce43:     	popq	%r15
14547ce45:     	popq	%rbp
14547ce46:     	retq

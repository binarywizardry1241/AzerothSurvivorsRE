
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14549ed8b:     	movss	0x384(%r13), %xmm0
14549ed94:     	subss	%xmm6, %xmm0
14549ed98:     	movss	%xmm0, 0x384(%r13)
14549eda1:     	xorps	%xmm1, %xmm1
14549eda4:     	ucomiss	%xmm0, %xmm1
14549eda7:     	jb	0x14549efd3 <.text+0x549dfd3>
14549edad:     	movq	0x378(%r13), %rax
14549edb4:     	movl	0x380(%r13), %ecx
14549edbb:     	movl	0x390(%r13), %edx
14549edc2:     	movl	0x3ac(%r13), %r8d
14549edc9:     	movl	%r8d, 0xd4(%rbp)
14549edd0:     	movups	0x39c(%r13), %xmm1
14549edd8:     	movups	%xmm1, 0xc4(%rbp)
14549eddf:     	movups	0x3b0(%r13), %xmm1
14549ede7:     	movups	0x3bc(%r13), %xmm2
14549edef:     	movups	%xmm2, 0xe4(%rbp)
14549edf6:     	movups	%xmm1, 0xd8(%rbp)
14549edfd:     	movq	%rax, 0xa0(%rbp)
14549ee04:     	movl	%ecx, 0xa8(%rbp)
14549ee0a:     	movss	%xmm0, 0xac(%rbp)
14549ee12:     	movsd	0x388(%r13), %xmm0
14549ee1b:     	movsd	%xmm0, 0xb0(%rbp)
14549ee23:     	movl	%edx, 0xb8(%rbp)
14549ee29:     	movsd	0x394(%r13), %xmm0
14549ee32:     	movsd	%xmm0, 0xbc(%rbp)
14549ee3a:     	movb	%r12b, 0x377(%rbp)
14549ee41:     	leaq	0xa0(%rbp), %rdx
14549ee48:     	movq	%r13, %rcx
14549ee4b:     	callq	0x1454e7a20 <.text+0x54e6a20>
14549ee50:     	nop
14549ee51:     	testb	%al, %al
14549ee53:     	je	0x14549f4e1 <.text+0x549e4e1>
14549ee59:     	movq	0x378(%r13), %rax
14549ee60:     	movss	0x48(%rax), %xmm0
14549ee65:     	mulss	0x459ed3(%rip), %xmm0   # 0x1458f8d40
14549ee6d:     	mulss	0x38c(%r13), %xmm0
14549ee76:     	mulss	0x3b4(%r13), %xmm0
14549ee7f:     	mulss	0x460(%r13), %xmm0
14549ee88:     	maxss	0x44e180(%rip), %xmm0   # 0x1458ed010
14549ee90:     	movss	%xmm0, 0x384(%r13)
14549ee99:     	mulss	0x49206f(%rip), %xmm0   # 0x145930f10
14549eea1:     	cvttss2si	%xmm0, %rcx
14549eea6:     	xorl	%edx, %edx
14549eea8:     	xorps	%xmm1, %xmm1
14549eeab:     	ucomiss	%xmm1, %xmm0
14549eeae:     	cmovael	%ecx, %edx
14549eeb1:     	movl	0x40(%rax), %ebx
14549eeb4:     	ucomiss	0x44c661(%rip), %xmm0   # 0x1458eb51c
14549eebb:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14549eec0:     	cmovbel	%edx, %eax
14549eec3:     	movq	0x3d0(%r13), %rdx
14549eeca:     	movl	%ebx, 0x210(%rbp)
14549eed0:     	movl	%eax, 0x214(%rbp)
14549eed6:     	movb	%r12b, 0x377(%rbp)
14549eedd:     	leaq	0x230(%rbp), %rcx
14549eee4:     	leaq	0x210(%rbp), %r8
14549eeeb:     	movl	$0x1, %r9d
14549eef1:     	callq	0x145442f60 <.text+0x5441f60>
14549eef6:     	nop
14549eef7:     	leaq	0x538(%r13), %rdi
14549eefe:     	movq	0x548(%r13), %rsi
14549ef05:     	cmpq	0x538(%r13), %rsi
14549ef0c:     	jne	0x14549ef17 <.text+0x549df17>
14549ef0e:     	movq	%rdi, %rcx
14549ef11:     	callq	0x1457580b0 <.text+0x57570b0>
14549ef16:     	nop
14549ef17:     	movq	0x540(%r13), %rax
14549ef1e:     	movq	%rsi, %rcx
14549ef21:     	shlq	$0x5, %rcx
14549ef25:     	movups	0x230(%rbp), %xmm0
14549ef2c:     	movups	0x240(%rbp), %xmm1
14549ef33:     	movups	%xmm1, 0x10(%rax,%rcx)
14549ef38:     	movups	%xmm0, (%rax,%rcx)
14549ef3c:     	incq	%rsi
14549ef3f:     	movq	%rsi, 0x548(%r13)
14549ef46:     	movq	0x3d0(%r13), %rsi
14549ef4d:     	callq	0x140002200 <.text+0x1200>
14549ef52:     	movl	$0x20, %ecx
14549ef57:     	movl	$0x1, %edx
14549ef5c:     	callq	0x1400021c0 <.text+0x11c0>
14549ef61:     	testq	%rax, %rax
14549ef64:     	je	0x1454aae66 <.text+0x54a9e66>
14549ef6a:     	movl	%ebx, (%rax)
14549ef6c:     	movq	%rax, 0x358(%rbp)
14549ef73:     	movq	%rsi, 0x4(%rax)
14549ef77:     	movq	0x548(%r13), %rsi
14549ef7e:     	cmpq	0x538(%r13), %rsi
14549ef85:     	jne	0x14549ef90 <.text+0x549df90>
14549ef87:     	movq	%rdi, %rcx
14549ef8a:     	callq	0x1457580b0 <.text+0x57570b0>
14549ef8f:     	nop
14549ef90:     	movq	0x540(%r13), %rax
14549ef97:     	movq	%rsi, %rcx
14549ef9a:     	shlq	$0x5, %rcx
14549ef9e:     	movq	$0x20, (%rax,%rcx)
14549efa6:     	movq	0x358(%rbp), %rdx
14549efad:     	movq	%rdx, 0x8(%rax,%rcx)
14549efb2:     	movq	$0xc, 0x10(%rax,%rcx)
14549efbb:     	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
14549efc2:     	incq	%rsi
14549efc5:     	movq	%rsi, 0x548(%r13)
14549efcc:     	movl	0x340(%rbp), %r12d

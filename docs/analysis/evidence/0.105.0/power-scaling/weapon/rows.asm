
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14599eb80:     	pushq	%rbp
14599eb81:     	pushq	%r15
14599eb83:     	pushq	%r14
14599eb85:     	pushq	%r13
14599eb87:     	pushq	%r12
14599eb89:     	pushq	%rsi
14599eb8a:     	pushq	%rdi
14599eb8b:     	pushq	%rbx
14599eb8c:     	subq	$0xc8, %rsp
14599eb93:     	leaq	0x80(%rsp), %rbp
14599eb9b:     	movaps	%xmm10, 0x30(%rbp)
14599eba0:     	movaps	%xmm9, 0x20(%rbp)
14599eba5:     	movaps	%xmm8, 0x10(%rbp)
14599ebaa:     	movaps	%xmm7, (%rbp)
14599ebae:     	movaps	%xmm6, -0x10(%rbp)
14599ebb2:     	movq	$-0x2, -0x18(%rbp)
14599ebba:     	movq	%rdx, %rbx
14599ebbd:     	movq	%rcx, %rsi
14599ebc0:     	movq	0x8(%rdx), %r14
14599ebc4:     	movq	0x18(%rdx), %r15
14599ebc8:     	cmpq	%r15, %r14
14599ebcb:     	je	0x14599ec25 <.text+0x599dc25>
14599ebcd:     	movq	0x20(%rbx), %r12
14599ebd1:     	movq	0x560(%r12), %rax
14599ebd9:     	imulq	$0x160, 0x568(%r12), %rdx # imm = 0x160
14599ebe5:     	movq	(%r14), %rdi
14599ebe8:     	addq	$0x8, %r14
14599ebec:     	xorl	%ecx, %ecx
14599ebee:     	movq	%rax, %r8
14599ebf1:     	nopw	%cs:(%rax,%rax)
14599ec00:     	cmpq	%rcx, %rdx
14599ec03:     	je	0x14599ec20 <.text+0x599dc20>
14599ec05:     	addq	$0x160, %rcx            # imm = 0x160
14599ec0c:     	cmpq	%rdi, 0x88(%r8)
14599ec13:     	leaq	0x160(%r8), %r8
14599ec1a:     	jne	0x14599ec00 <.text+0x599dc00>
14599ec1c:     	jmp	0x14599ec60 <.text+0x599dc60>
14599ec1e:     	nop
14599ec20:     	cmpq	%r15, %r14
14599ec23:     	jne	0x14599ebe5 <.text+0x599dbe5>
14599ec25:     	movq	$0x0, (%rsi)
14599ec2c:     	movq	$0x8, 0x8(%rsi)
14599ec34:     	movq	$0x0, 0x10(%rsi)
14599ec3c:     	movq	0x10(%rbx), %rdx
14599ec40:     	testq	%rdx, %rdx
14599ec43:     	je	0x14599ef49 <.text+0x599df49>
14599ec49:     	movq	(%rbx), %rcx
14599ec4c:     	shlq	$0x3, %rdx
14599ec50:     	movl	$0x8, %r8d
14599ec56:     	callq	0x1400021d0 <.text+0x11d0>
14599ec5b:     	jmp	0x14599ef49 <.text+0x599df49>
14599ec60:     	movq	%rsi, -0x58(%rbp)
14599ec64:     	movq	%r14, 0x8(%rbx)
14599ec68:     	movq	0x28(%rbx), %r13
14599ec6c:     	movss	-0x20(%rax,%rcx), %xmm1
14599ec72:     	movss	(%r13), %xmm0
14599ec78:     	movb	$0x3, %sil
14599ec7b:     	ucomiss	%xmm0, %xmm1
14599ec7e:     	ja	0x14599ec8d <.text+0x599dc8d>
14599ec80:     	cmpq	$-0x1, -0x148(%rax,%rcx)
14599ec89:     	je	0x14599ece8 <.text+0x599dce8>
14599ec8b:     	xorl	%esi, %esi
14599ec8d:     	movss	-0x38(%rax,%rcx), %xmm2
14599ec93:     	xorps	%xmm1, %xmm1
14599ec96:     	ucomiss	%xmm2, %xmm1
14599ec99:     	jae	0x14599ecfe <.text+0x599dcfe>
14599ec9b:     	subss	-0x3c(%rax,%rcx), %xmm0
14599eca1:     	divss	%xmm2, %xmm0
14599eca5:     	maxss	%xmm0, %xmm1
14599eca9:     	movss	0x3ce6bb(%rip), %xmm0   # 0x145d6d36c
14599ecb1:     	minss	%xmm1, %xmm0
14599ecb5:     	movsd	-0x54(%rax,%rcx), %xmm1
14599ecbb:     	movsd	-0x48(%rax,%rcx), %xmm2
14599ecc1:     	subps	%xmm1, %xmm2
14599ecc4:     	movsldup	%xmm0, %xmm6            # xmm6 = xmm0[0,0,2,2]
14599ecc8:     	mulps	%xmm2, %xmm6
14599eccb:     	addps	%xmm1, %xmm6
14599ecce:     	movss	-0x4c(%rax,%rcx), %xmm1
14599ecd4:     	movss	-0x40(%rax,%rcx), %xmm7
14599ecda:     	subss	%xmm1, %xmm7
14599ecde:     	mulss	%xmm0, %xmm7
14599ece2:     	addss	%xmm1, %xmm7
14599ece6:     	jmp	0x14599ed0a <.text+0x599dd0a>
14599ece8:     	movb	$0x2, %sil
14599eceb:     	subb	-0x4(%rax,%rcx), %sil
14599ecf0:     	movss	-0x38(%rax,%rcx), %xmm2
14599ecf6:     	xorps	%xmm1, %xmm1
14599ecf9:     	ucomiss	%xmm2, %xmm1
14599ecfc:     	jb	0x14599ec9b <.text+0x599dc9b>
14599ecfe:     	movsd	-0x48(%rax,%rcx), %xmm6
14599ed04:     	movss	-0x40(%rax,%rcx), %xmm7
14599ed0a:     	movss	-0x70(%rax,%rcx), %xmm8
14599ed11:     	callq	0x140002200 <.text+0x1200>
14599ed16:     	movl	$0x80, %ecx
14599ed1b:     	movl	$0x8, %edx
14599ed20:     	callq	0x1400021c0 <.text+0x11c0>
14599ed25:     	testq	%rax, %rax
14599ed28:     	movq	%rbx, -0x48(%rbp)
14599ed2c:     	je	0x14599ef77 <.text+0x599df77>
14599ed32:     	movss	%xmm8, (%rax)
14599ed37:     	movlps	%xmm6, 0x4(%rax)
14599ed3b:     	movss	%xmm7, 0xc(%rax)
14599ed40:     	movb	%sil, 0x10(%rax)
14599ed44:     	movq	%rdi, 0x18(%rax)
14599ed48:     	movq	$0x4, -0x38(%rbp)
14599ed50:     	movq	%rax, -0x30(%rbp)
14599ed54:     	movq	$0x1, -0x28(%rbp)
14599ed5c:     	movq	(%rbx), %rcx
14599ed5f:     	movq	%rcx, -0x50(%rbp)
14599ed63:     	movq	0x10(%rbx), %rcx
14599ed67:     	movq	%rcx, -0x20(%rbp)
14599ed6b:     	cmpq	%r15, %r14
14599ed6e:     	je	0x14599ef1a <.text+0x599df1a>
14599ed74:     	movl	$0x1, %edi
14599ed79:     	xorps	%xmm6, %xmm6
14599ed7c:     	movss	0x3ce5e8(%rip), %xmm7   # 0x145d6d36c
14599ed84:     	movq	%rax, -0x40(%rbp)
14599ed88:     	jmp	0x14599edc4 <.text+0x599ddc4>
14599ed8a:     	nopw	(%rax,%rax)
14599ed90:     	movq	%rdi, %rcx
14599ed93:     	shlq	$0x5, %rcx
14599ed97:     	movss	%xmm10, (%rax,%rcx)
14599ed9d:     	movlps	%xmm8, 0x4(%rax,%rcx)
14599eda3:     	movss	%xmm9, 0xc(%rax,%rcx)
14599edaa:     	movb	%sil, 0x10(%rax,%rcx)
14599edaf:     	movq	%rbx, 0x18(%rax,%rcx)
14599edb4:     	incq	%rdi
14599edb7:     	movq	%rdi, -0x28(%rbp)
14599edbb:     	cmpq	%r15, %r14
14599edbe:     	je	0x14599ef1a <.text+0x599df1a>
14599edc4:     	movq	0x560(%r12), %rcx
14599edcc:     	imulq	$0x160, 0x568(%r12), %r8 # imm = 0x160
14599edd8:     	movq	(%r14), %rbx
14599eddb:     	addq	$0x8, %r14
14599eddf:     	xorl	%edx, %edx
14599ede1:     	movq	%rcx, %r9
14599ede4:     	nopw	%cs:(%rax,%rax)
14599edf0:     	cmpq	%rdx, %r8
14599edf3:     	je	0x14599ee10 <.text+0x599de10>
14599edf5:     	addq	$0x160, %rdx            # imm = 0x160
14599edfc:     	cmpq	%rbx, 0x88(%r9)
14599ee03:     	leaq	0x160(%r9), %r9
14599ee0a:     	jne	0x14599edf0 <.text+0x599ddf0>
14599ee0c:     	jmp	0x14599ee20 <.text+0x599de20>
14599ee0e:     	nop
14599ee10:     	cmpq	%r15, %r14
14599ee13:     	jne	0x14599edd8 <.text+0x599ddd8>
14599ee15:     	jmp	0x14599ef1a <.text+0x599df1a>
14599ee1a:     	nopw	(%rax,%rax)
14599ee20:     	movss	-0x20(%rcx,%rdx), %xmm1
14599ee26:     	movss	(%r13), %xmm0
14599ee2c:     	movb	$0x3, %sil
14599ee2f:     	ucomiss	%xmm0, %xmm1
14599ee32:     	ja	0x14599ee41 <.text+0x599de41>
14599ee34:     	cmpq	$-0x1, -0x148(%rcx,%rdx)
14599ee3d:     	je	0x14599eeb3 <.text+0x599deb3>
14599ee3f:     	xorl	%esi, %esi
14599ee41:     	movss	-0x38(%rcx,%rdx), %xmm1
14599ee47:     	ucomiss	%xmm1, %xmm6
14599ee4a:     	jae	0x14599eed0 <.text+0x599ded0>
14599ee50:     	subss	-0x3c(%rcx,%rdx), %xmm0
14599ee56:     	divss	%xmm1, %xmm0
14599ee5a:     	xorps	%xmm1, %xmm1
14599ee5d:     	maxss	%xmm0, %xmm1
14599ee61:     	movaps	%xmm7, %xmm0
14599ee64:     	minss	%xmm1, %xmm0
14599ee68:     	movsd	-0x54(%rcx,%rdx), %xmm1
14599ee6e:     	movsd	-0x48(%rcx,%rdx), %xmm2
14599ee74:     	subps	%xmm1, %xmm2
14599ee77:     	movsldup	%xmm0, %xmm8            # xmm8 = xmm0[0,0,2,2]
14599ee7c:     	mulps	%xmm2, %xmm8
14599ee80:     	addps	%xmm1, %xmm8
14599ee84:     	movss	-0x4c(%rcx,%rdx), %xmm1
14599ee8a:     	movss	-0x40(%rcx,%rdx), %xmm9
14599ee91:     	subss	%xmm1, %xmm9
14599ee96:     	mulss	%xmm0, %xmm9
14599ee9b:     	addss	%xmm1, %xmm9
14599eea0:     	movss	-0x70(%rcx,%rdx), %xmm10
14599eea7:     	cmpq	-0x38(%rbp), %rdi
14599eeab:     	jne	0x14599ed90 <.text+0x599dd90>
14599eeb1:     	jmp	0x14599eeef <.text+0x599deef>
14599eeb3:     	movb	$0x2, %sil
14599eeb6:     	subb	-0x4(%rcx,%rdx), %sil
14599eebb:     	movss	-0x38(%rcx,%rdx), %xmm1
14599eec1:     	ucomiss	%xmm1, %xmm6
14599eec4:     	jb	0x14599ee50 <.text+0x599de50>
14599eec6:     	nopw	%cs:(%rax,%rax)
14599eed0:     	movsd	-0x48(%rcx,%rdx), %xmm8
14599eed7:     	movss	-0x40(%rcx,%rdx), %xmm9
14599eede:     	movss	-0x70(%rcx,%rdx), %xmm10
14599eee5:     	cmpq	-0x38(%rbp), %rdi
14599eee9:     	jne	0x14599ed90 <.text+0x599dd90>
14599eeef:     	movq	$0x20, 0x20(%rsp)
14599eef8:     	movl	$0x1, %r8d
14599eefe:     	movl	$0x8, %r9d
14599ef04:     	leaq	-0x38(%rbp), %rcx
14599ef08:     	movq	%rdi, %rdx
14599ef0b:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14599ef10:     	nop
14599ef11:     	movq	-0x30(%rbp), %rax
14599ef15:     	jmp	0x14599ed90 <.text+0x599dd90>
14599ef1a:     	movq	-0x20(%rbp), %rdx
14599ef1e:     	testq	%rdx, %rdx
14599ef21:     	je	0x14599ef36 <.text+0x599df36>
14599ef23:     	shlq	$0x3, %rdx
14599ef27:     	movl	$0x8, %r8d
14599ef2d:     	movq	-0x50(%rbp), %rcx
14599ef31:     	callq	0x1400021d0 <.text+0x11d0>
14599ef36:     	movq	-0x28(%rbp), %rax
14599ef3a:     	movq	-0x58(%rbp), %rsi
14599ef3e:     	movq	%rax, 0x10(%rsi)
14599ef42:     	movups	-0x38(%rbp), %xmm0
14599ef46:     	movups	%xmm0, (%rsi)
14599ef49:     	movq	%rsi, %rax
14599ef4c:     	movaps	-0x10(%rbp), %xmm6
14599ef50:     	movaps	(%rbp), %xmm7
14599ef54:     	movaps	0x10(%rbp), %xmm8
14599ef59:     	movaps	0x20(%rbp), %xmm9
14599ef5e:     	movaps	0x30(%rbp), %xmm10
14599ef63:     	addq	$0xc8, %rsp
14599ef6a:     	popq	%rbx
14599ef6b:     	popq	%rdi
14599ef6c:     	popq	%rsi
14599ef6d:     	popq	%r12
14599ef6f:     	popq	%r13
14599ef71:     	popq	%r14
14599ef73:     	popq	%r15
14599ef75:     	popq	%rbp
14599ef76:     	retq
14599ef77:     	movq	%rax, -0x40(%rbp)
14599ef7b:     	movl	$0x8, %ecx
14599ef80:     	movl	$0x80, %edx
14599ef85:     	callq	0x145d6944b <.text+0x5d6844b>
14599ef8a:     	nop
14599ef8b:     	ud2

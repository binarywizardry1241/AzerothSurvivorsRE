
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552cb40:     	pushq	%rbp
14552cb41:     	pushq	%r15
14552cb43:     	pushq	%r14
14552cb45:     	pushq	%r13
14552cb47:     	pushq	%r12
14552cb49:     	pushq	%rsi
14552cb4a:     	pushq	%rdi
14552cb4b:     	pushq	%rbx
14552cb4c:     	subq	$0x98, %rsp
14552cb53:     	leaq	0x80(%rsp), %rbp
14552cb5b:     	movq	$-0x2, 0x10(%rbp)
14552cb63:     	movq	%rdx, %rdi
14552cb66:     	leaq	0x38(%rdx), %rax
14552cb6a:     	movq	0x20(%rdx), %rdx
14552cb6e:     	movq	0x28(%rdi), %r10
14552cb72:     	movq	0x30(%rdi), %r15
14552cb76:     	movq	(%rdi), %rbx
14552cb79:     	movq	0x8(%rdi), %r14
14552cb7d:     	movq	0x10(%rdi), %rsi
14552cb81:     	movq	0x18(%rdi), %r8
14552cb85:     	movq	%r8, -0x40(%rbp)
14552cb89:     	leaq	0x1458d80(%rip), %r12   # 0x146985910
14552cb90:     	movq	%r14, -0x8(%rbp)
14552cb94:     	movq	%rcx, -0x30(%rbp)
14552cb98:     	movq	%r10, (%rbp)
14552cb9c:     	testq	%rdx, %rdx
14552cb9f:     	je	0x14552cbe0 <.text+0x552bbe0>
14552cba1:     	addq	$0x58, %rdx
14552cba5:     	nopw	%cs:(%rax,%rax)
14552cbb0:     	movq	%r15, %r13
14552cbb3:     	leaq	-0x58(%rdx), %r8
14552cbb7:     	cmpq	(%rbp), %r8
14552cbbb:     	je	0x14552cbf0 <.text+0x552bbf0>
14552cbbd:     	movq	%rdx, 0x20(%rdi)
14552cbc1:     	leaq	0x1(%r13), %r15
14552cbc5:     	leaq	0x58(%rdx), %r14
14552cbc9:     	cmpb	$0x0, -0x4(%rdx)
14552cbcd:     	movq	%r15, 0x30(%rdi)
14552cbd1:     	movq	%r14, %rdx
14552cbd4:     	jne	0x14552cbb0 <.text+0x552bbb0>
14552cbd6:     	jmp	0x14552cd0b <.text+0x552bd0b>
14552cbdb:     	nopl	(%rax,%rax)
14552cbe0:     	movq	%r15, %r13
14552cbe3:     	testq	%rbx, %rbx
14552cbe6:     	jne	0x14552cc05 <.text+0x552bc05>
14552cbe8:     	jmp	0x14552cf29 <.text+0x552bf29>
14552cbed:     	nopl	(%rax)
14552cbf0:     	movq	$0x0, 0x20(%rdi)
14552cbf8:     	movq	-0x8(%rbp), %r14
14552cbfc:     	testq	%rbx, %rbx
14552cbff:     	je	0x14552cf29 <.text+0x552bf29>
14552cc05:     	leaq	(,%rsi,8), %rdx
14552cc0d:     	xorl	%r8d, %r8d
14552cc10:     	jmp	0x14552cc3b <.text+0x552bc3b>
14552cc12:     	nopw	%cs:(%rax,%rax)
14552cc20:     	leaq	0x1(%r8), %r9
14552cc24:     	leaq	(%rsi,%r8), %r11
14552cc28:     	incq	%r11
14552cc2b:     	movq	%r9, %r8
14552cc2e:     	movq	-0x40(%rbp), %r15
14552cc32:     	cmpq	(%r15), %r10
14552cc35:     	movq	%r11, 0x10(%rdi)
14552cc39:     	je	0x14552cc70 <.text+0x552bc70>
14552cc3b:     	leaq	(%rsi,%r8), %r9
14552cc3f:     	cmpq	%r14, %rbx
14552cc42:     	je	0x14552ccaf <.text+0x552bcaf>
14552cc44:     	addq	$0xf0, %rbx
14552cc4b:     	movq	%rbx, (%rdi)
14552cc4e:     	movl	$0x4, %r10d
14552cc54:     	cmpq	$0xb, %r9
14552cc58:     	ja	0x14552cc20 <.text+0x552bc20>
14552cc5a:     	leaq	(%rdx,%r8,8), %r9
14552cc5e:     	movq	(%r12,%r9), %r10
14552cc62:     	jmp	0x14552cc20 <.text+0x552bc20>
14552cc64:     	nopw	%cs:(%rax,%rax)
14552cc70:     	movq	-0x68(%rbx), %rdx
14552cc74:     	imulq	$0x58, -0x60(%rbx), %r10
14552cc79:     	addq	%rdx, %r10
14552cc7c:     	movq	%rdx, 0x20(%rdi)
14552cc80:     	movq	%r10, 0x28(%rdi)
14552cc84:     	movq	$0x0, 0x30(%rdi)
14552cc8c:     	leaq	(%rsi,%r9), %r8
14552cc90:     	decq	%r8
14552cc93:     	addq	%r9, %rsi
14552cc96:     	movq	%r8, 0x38(%rdi)
14552cc9a:     	xorl	%r15d, %r15d
14552cc9d:     	movq	%r10, (%rbp)
14552cca1:     	testq	%rdx, %rdx
14552cca4:     	jne	0x14552cba1 <.text+0x552bba1>
14552ccaa:     	jmp	0x14552cbe0 <.text+0x552bbe0>
14552ccaf:     	movq	%r9, %rsi
14552ccb2:     	movq	0x40(%rdi), %rdx
14552ccb6:     	testq	%rdx, %rdx
14552ccb9:     	je	0x14552cf38 <.text+0x552bf38>
14552ccbf:     	leaq	0x58(%rdi), %rax
14552ccc3:     	movq	0x48(%rdi), %r8
14552ccc7:     	movq	0x50(%rdi), %r12
14552cccb:     	decq	%r12
14552ccce:     	xorl	%r14d, %r14d
14552ccd1:     	nopw	%cs:(%rax,%rax)
14552cce0:     	cmpq	%r8, %rdx
14552cce3:     	je	0x14552cf38 <.text+0x552bf38>
14552cce9:     	leaq	0x58(%rdx), %r9
14552cced:     	movq	%r9, 0x40(%rdi)
14552ccf1:     	leaq	0x2(%r12), %r10
14552ccf6:     	incq	%r12
14552ccf9:     	cmpb	$0x0, 0x54(%rdx)
14552ccfd:     	movq	%r10, 0x50(%rdi)
14552cd01:     	movq	%r9, %rdx
14552cd04:     	jne	0x14552cce0 <.text+0x552bce0>
14552cd06:     	movq	%r13, %r15
14552cd09:     	jmp	0x14552cd12 <.text+0x552bd12>
14552cd0b:     	addq	$-0x58, %r14
14552cd0f:     	movq	%r13, %r12
14552cd12:     	movq	(%rax), %rax
14552cd15:     	movq	%rax, 0x8(%rbp)
14552cd19:     	callq	0x140002200 <.text+0x1200>
14552cd1e:     	movl	$0x40, %ecx
14552cd23:     	movl	$0x8, %edx
14552cd28:     	callq	0x1400021c0 <.text+0x11c0>
14552cd2d:     	testq	%rax, %rax
14552cd30:     	movq	(%rbp), %r13
14552cd34:     	je	0x14552cf67 <.text+0x552bf67>
14552cd3a:     	movq	0x8(%rbp), %rcx
14552cd3e:     	movq	%rcx, (%rax)
14552cd41:     	movq	%r12, 0x8(%rax)
14552cd45:     	movq	$0x4, -0x20(%rbp)
14552cd4d:     	movq	%rax, -0x18(%rbp)
14552cd51:     	movq	$0x1, -0x10(%rbp)
14552cd59:     	movq	0x38(%rdi), %rcx
14552cd5d:     	movq	%rcx, -0x38(%rbp)
14552cd61:     	movq	0x40(%rdi), %r12
14552cd65:     	movq	0x48(%rdi), %rcx
14552cd69:     	movq	%rcx, -0x50(%rbp)
14552cd6d:     	movq	0x50(%rdi), %rcx
14552cd71:     	movq	%rcx, -0x28(%rbp)
14552cd75:     	movq	0x58(%rdi), %rcx
14552cd79:     	movq	%rcx, -0x48(%rbp)
14552cd7d:     	movl	$0x1, %ecx
14552cd82:     	movq	%rcx, 0x8(%rbp)
14552cd86:     	jmp	0x14552cdaf <.text+0x552bdaf>
14552cd88:     	nopl	(%rax,%rax)
14552cd90:     	movq	%rdx, %rcx
14552cd93:     	shlq	$0x4, %rcx
14552cd97:     	movq	%rdi, (%rax,%rcx)
14552cd9b:     	movq	(%rbp), %r8
14552cd9f:     	movq	%r8, 0x8(%rax,%rcx)
14552cda4:     	incq	%rdx
14552cda7:     	movq	%rdx, 0x8(%rbp)
14552cdab:     	movq	%rdx, -0x10(%rbp)
14552cdaf:     	movq	%r14, %rcx
14552cdb2:     	movq	-0x8(%rbp), %r9
14552cdb6:     	movq	-0x40(%rbp), %r10
14552cdba:     	movq	-0x50(%rbp), %r11
14552cdbe:     	testq	%rcx, %rcx
14552cdc1:     	je	0x14552cdf7 <.text+0x552bdf7>
14552cdc3:     	xorl	%edx, %edx
14552cdc5:     	nopw	%cs:(%rax,%rax)
14552cdd0:     	cmpq	%r13, %rcx
14552cdd3:     	je	0x14552cdf0 <.text+0x552bdf0>
14552cdd5:     	leaq	0x58(%rcx), %r14
14552cdd9:     	decq	%rdx
14552cddc:     	cmpb	$0x0, 0x54(%rcx)
14552cde0:     	movq	%r14, %rcx
14552cde3:     	jne	0x14552cdd0 <.text+0x552bdd0>
14552cde5:     	jmp	0x14552cec0 <.text+0x552bec0>
14552cdea:     	nopw	(%rax,%rax)
14552cdf0:     	subq	%rdx, %r15
14552cdf3:     	movq	-0x8(%rbp), %r9
14552cdf7:     	testq	%rbx, %rbx
14552cdfa:     	je	0x14552cf09 <.text+0x552bf09>
14552ce00:     	leaq	0x1458b09(%rip), %rcx   # 0x146985910
14552ce07:     	leaq	(%rcx,%rsi,8), %rcx
14552ce0b:     	jmp	0x14552ce24 <.text+0x552be24>
14552ce0d:     	nopl	(%rax)
14552ce10:     	addq	$0xf0, %rbx
14552ce17:     	leaq	0x1(%rdx), %rsi
14552ce1b:     	addq	$0x8, %rcx
14552ce1f:     	cmpq	(%r10), %r8
14552ce22:     	je	0x14552ce40 <.text+0x552be40>
14552ce24:     	movq	%rsi, %rdx
14552ce27:     	cmpq	%r9, %rbx
14552ce2a:     	je	0x14552ce60 <.text+0x552be60>
14552ce2c:     	movl	$0x4, %r8d
14552ce32:     	cmpq	$0xb, %rdx
14552ce36:     	ja	0x14552ce10 <.text+0x552be10>
14552ce38:     	movq	(%rcx), %r8
14552ce3b:     	jmp	0x14552ce10 <.text+0x552be10>
14552ce3d:     	nopl	(%rax)
14552ce40:     	imulq	$0x58, -0x60(%rbx), %r13
14552ce45:     	movq	-0x68(%rbx), %rcx
14552ce49:     	addq	%rcx, %r13
14552ce4c:     	movq	%rdx, -0x38(%rbp)
14552ce50:     	xorl	%r15d, %r15d
14552ce53:     	testq	%rcx, %rcx
14552ce56:     	jne	0x14552cdc3 <.text+0x552bdc3>
14552ce5c:     	jmp	0x14552cdf7 <.text+0x552bdf7>
14552ce5e:     	nop
14552ce60:     	movq	%rdx, %rsi
14552ce63:     	testq	%r12, %r12
14552ce66:     	je	0x14552cf14 <.text+0x552bf14>
14552ce6c:     	xorl	%ecx, %ecx
14552ce6e:     	nop
14552ce70:     	cmpq	%r11, %r12
14552ce73:     	je	0x14552cf14 <.text+0x552bf14>
14552ce79:     	leaq	0x58(%r12), %rdx
14552ce7e:     	decq	%rcx
14552ce81:     	cmpb	$0x0, 0x54(%r12)
14552ce87:     	movq	%rdx, %r12
14552ce8a:     	jne	0x14552ce70 <.text+0x552be70>
14552ce8c:     	movq	-0x28(%rbp), %r8
14552ce90:     	subq	%rcx, %r8
14552ce93:     	movq	%r8, -0x28(%rbp)
14552ce97:     	leaq	-0x1(%r8), %rcx
14552ce9b:     	movq	%rcx, (%rbp)
14552ce9f:     	movq	%rdx, %r12
14552cea2:     	xorl	%r14d, %r14d
14552cea5:     	movq	-0x48(%rbp), %rdi
14552cea9:     	movq	0x8(%rbp), %rdx
14552cead:     	cmpq	-0x20(%rbp), %rdx
14552ceb1:     	jne	0x14552cd90 <.text+0x552bd90>
14552ceb7:     	jmp	0x14552cedd <.text+0x552bedd>
14552ceb9:     	nopl	(%rax)
14552cec0:     	subq	%rdx, %r15
14552cec3:     	leaq	-0x1(%r15), %rcx
14552cec7:     	movq	%rcx, (%rbp)
14552cecb:     	movq	-0x38(%rbp), %rdi
14552cecf:     	movq	0x8(%rbp), %rdx
14552ced3:     	cmpq	-0x20(%rbp), %rdx
14552ced7:     	jne	0x14552cd90 <.text+0x552bd90>
14552cedd:     	movq	$0x10, 0x20(%rsp)
14552cee6:     	movl	$0x1, %r8d
14552ceec:     	movl	$0x8, %r9d
14552cef2:     	leaq	-0x20(%rbp), %rcx
14552cef6:     	callq	0x145757d40 <.text+0x5756d40>
14552cefb:     	nop
14552cefc:     	movq	-0x18(%rbp), %rax
14552cf00:     	movq	0x8(%rbp), %rdx
14552cf04:     	jmp	0x14552cd90 <.text+0x552bd90>
14552cf09:     	xorl	%ebx, %ebx
14552cf0b:     	testq	%r12, %r12
14552cf0e:     	jne	0x14552ce6c <.text+0x552be6c>
14552cf14:     	movq	-0x10(%rbp), %rcx
14552cf18:     	movq	-0x30(%rbp), %rax
14552cf1c:     	movq	%rcx, 0x10(%rax)
14552cf20:     	movups	-0x20(%rbp), %xmm0
14552cf24:     	movups	%xmm0, (%rax)
14552cf27:     	jmp	0x14552cf53 <.text+0x552bf53>
14552cf29:     	xorl	%ebx, %ebx
14552cf2b:     	movq	0x40(%rdi), %rdx
14552cf2f:     	testq	%rdx, %rdx
14552cf32:     	jne	0x14552ccbf <.text+0x552bcbf>
14552cf38:     	movq	-0x30(%rbp), %rax
14552cf3c:     	movq	$0x0, (%rax)
14552cf43:     	movq	$0x8, 0x8(%rax)
14552cf4b:     	movq	$0x0, 0x10(%rax)
14552cf53:     	addq	$0x98, %rsp
14552cf5a:     	popq	%rbx
14552cf5b:     	popq	%rdi
14552cf5c:     	popq	%rsi
14552cf5d:     	popq	%r12
14552cf5f:     	popq	%r13
14552cf61:     	popq	%r14
14552cf63:     	popq	%r15
14552cf65:     	popq	%rbp
14552cf66:     	retq
14552cf67:     	movl	$0x8, %ecx
14552cf6c:     	movl	$0x40, %edx
14552cf71:     	callq	0x1458e721b <.text+0x58e621b>
14552cf76:     	ud2


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145439e60:     	pushq	%rbp
145439e61:     	pushq	%r15
145439e63:     	pushq	%r14
145439e65:     	pushq	%r13
145439e67:     	pushq	%r12
145439e69:     	pushq	%rsi
145439e6a:     	pushq	%rdi
145439e6b:     	pushq	%rbx
145439e6c:     	subq	$0x88, %rsp
145439e73:     	leaq	0x80(%rsp), %rbp
145439e7b:     	movq	$-0x2, (%rbp)
145439e83:     	movl	%edx, %ebx
145439e85:     	movq	%rcx, %rsi
145439e88:     	movq	0x10(%r8), %rax
145439e8c:     	movq	%rax, -0x50(%rbp)
145439e90:     	movups	(%r8), %xmm0
145439e94:     	movaps	%xmm0, -0x60(%rbp)
145439e98:     	movq	0x68(%rcx), %r12
145439e9c:     	movq	0x70(%rcx), %r14
145439ea0:     	movq	%r14, %r13
145439ea3:     	shlq	$0x5, %r13
145439ea7:     	xorl	%eax, %eax
145439ea9:     	xorl	%ecx, %ecx
145439eab:     	nopl	(%rax,%rax)
145439eb0:     	cmpq	%rcx, %r13
145439eb3:     	je	0x145439ec8 <.text+0x5438ec8>
145439eb5:     	leaq	0x20(%rcx), %rdx
145439eb9:     	cmpb	%bl, 0x4(%r12,%rcx)
145439ebe:     	movq	%rdx, %rcx
145439ec1:     	jne	0x145439eb0 <.text+0x5438eb0>
145439ec3:     	movl	-0x20(%r12,%rdx), %eax
145439ec8:     	movl	$0x6e, %ecx
145439ecd:     	movl	$0x2, %r9d
145439ed3:     	nopw	%cs:(%rax,%rax)
145439ee0:     	leal	-0x1e(%rcx), %edx
145439ee3:     	subl	%edx, %eax
145439ee5:     	jb	0x145439f09 <.text+0x5438f09>
145439ee7:     	leal	-0xf(%rcx), %edx
145439eea:     	subl	%edx, %eax
145439eec:     	jb	0x145439f0f <.text+0x5438f0f>
145439eee:     	subl	%ecx, %eax
145439ef0:     	jb	0x145439f12 <.text+0x5438f12>
145439ef2:     	addl	$0x2d, %ecx
145439ef5:     	addl	$0x3, %r9d
145439ef9:     	cmpl	$0x36b, %ecx            # imm = 0x36B
145439eff:     	jne	0x145439ee0 <.text+0x5438ee0>
145439f01:     	movl	$0x33, %r9d
145439f07:     	jmp	0x145439f12 <.text+0x5438f12>
145439f09:     	addl	$-0x2, %r9d
145439f0d:     	jmp	0x145439f12 <.text+0x5438f12>
145439f0f:     	decl	%r9d
145439f12:     	leaq	-0x48(%rbp), %rcx
145439f16:     	leaq	-0x60(%rbp), %rdx
145439f1a:     	movl	%ebx, %r8d
145439f1d:     	callq	0x145483fc0 <.text+0x5482fc0>
145439f22:     	movq	0x80(%rsi), %rax
145439f29:     	movq	0x88(%rsi), %rcx
145439f30:     	addq	$-0x4f, %rax
145439f34:     	shlq	$0x4, %rcx
145439f38:     	leaq	(%rcx,%rcx,4), %rcx
145439f3c:     	nopl	(%rax)
145439f40:     	testq	%rcx, %rcx
145439f43:     	je	0x14543a04e <.text+0x543904e>
145439f49:     	leaq	0x50(%rax), %r15
145439f4d:     	addq	$-0x50, %rcx
145439f51:     	cmpb	%bl, 0x4f(%rax)
145439f54:     	movq	%r15, %rax
145439f57:     	jne	0x145439f40 <.text+0x5438f40>
145439f59:     	movq	%r14, -0x18(%rbp)
145439f5d:     	movq	-0x40(%rbp), %rax
145439f61:     	movq	%rax, -0x10(%rbp)
145439f65:     	movq	-0x38(%rbp), %r14
145439f69:     	movq	%r14, %rdi
145439f6c:     	shlq	$0x4, %rdi
145439f70:     	movq	%r14, %rax
145439f73:     	shrq	$0x3c, %rax
145439f77:     	setne	%al
145439f7a:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
145439f84:     	cmpq	%rcx, %rdi
145439f87:     	seta	%cl
145439f8a:     	orb	%al, %cl
145439f8c:     	je	0x145439faa <.text+0x5438faa>
145439f8e:     	xorl	%ecx, %ecx
145439f90:     	movq	-0x10(%rbp), %rax
145439f94:     	movq	%rax, -0x30(%rbp)
145439f98:     	movb	$0x1, -0x1(%rbp)
145439f9c:     	movq	%rdi, %rdx
145439f9f:     	callq	0x14590379b <.text+0x590279b>
145439fa4:     	nop
145439fa5:     	jmp	0x14543a13f <.text+0x543913f>
145439faa:     	testq	%rdi, %rdi
145439fad:     	je	0x14543a10b <.text+0x543910b>
145439fb3:     	callq	0x140002200 <.text+0x1200>
145439fb8:     	movl	$0x8, %edx
145439fbd:     	movq	%rdi, %rcx
145439fc0:     	callq	0x1400021c0 <.text+0x11c0>
145439fc5:     	movl	$0x8, %ecx
145439fca:     	movq	%rax, -0x28(%rbp)
145439fce:     	testq	%rax, %rax
145439fd1:     	je	0x145439f90 <.text+0x5438f90>
145439fd3:     	movq	%r14, -0x20(%rbp)
145439fd7:     	testq	%r14, %r14
145439fda:     	je	0x145439fec <.text+0x5438fec>
145439fdc:     	movq	-0x28(%rbp), %rcx
145439fe0:     	movq	-0x10(%rbp), %rdx
145439fe4:     	movq	%rdi, %r8
145439fe7:     	callq	0x1457731ed <.text+0x57721ed>
145439fec:     	movzbl	(%r15), %edi
145439ff0:     	cmpq	$0x2, %rdi
145439ff4:     	ja	0x14543a12a <.text+0x543912a>
145439ffa:     	leal	(,%rdi,8), %eax
14543a001:     	leaq	(%rax,%rax,2), %rcx
14543a005:     	movq	0x7(%r15,%rcx), %rdx
14543a00a:     	testq	%rdx, %rdx
14543a00d:     	je	0x14543a02f <.text+0x543902f>
14543a00f:     	leaq	(%rdi,%rdi,2), %rax
14543a013:     	movq	%rcx, -0x10(%rbp)
14543a017:     	movq	0xf(%r15,%rax,8), %rcx
14543a01c:     	shlq	$0x4, %rdx
14543a020:     	movl	$0x8, %r8d
14543a026:     	callq	0x1400021d0 <.text+0x11d0>
14543a02b:     	movq	-0x10(%rbp), %rcx
14543a02f:     	movq	-0x20(%rbp), %rax
14543a033:     	movq	%rax, 0x7(%r15,%rcx)
14543a038:     	leaq	(%rdi,%rdi,2), %rax
14543a03c:     	movq	-0x28(%rbp), %rcx
14543a040:     	movq	%rcx, 0xf(%r15,%rax,8)
14543a045:     	movq	%r14, 0x17(%r15,%rax,8)
14543a04a:     	movq	-0x18(%rbp), %r14
14543a04e:     	leaq	0x60(%rsi), %rcx
14543a052:     	xorl	%eax, %eax
14543a054:     	movq	%r12, %rdx
14543a057:     	nopw	(%rax,%rax)
14543a060:     	cmpq	%rax, %r13
14543a063:     	je	0x14543a0a9 <.text+0x54390a9>
14543a065:     	addq	$0x20, %rax
14543a069:     	cmpb	%bl, 0x4(%rdx)
14543a06c:     	leaq	0x20(%rdx), %rdx
14543a070:     	jne	0x14543a060 <.text+0x5439060>
14543a072:     	leaq	(%r12,%rax), %rsi
14543a076:     	addq	$-0x18, %rsi
14543a07a:     	movq	-0x18(%r12,%rax), %rdx
14543a07f:     	testq	%rdx, %rdx
14543a082:     	je	0x14543a098 <.text+0x5439098>
14543a084:     	movq	-0x10(%r12,%rax), %rcx
14543a089:     	shlq	$0x4, %rdx
14543a08d:     	movl	$0x8, %r8d
14543a093:     	callq	0x1400021d0 <.text+0x11d0>
14543a098:     	movq	-0x38(%rbp), %rax
14543a09c:     	movq	%rax, 0x10(%rsi)
14543a0a0:     	movups	-0x48(%rbp), %xmm0
14543a0a4:     	movups	%xmm0, (%rsi)
14543a0a7:     	jmp	0x14543a0f7 <.text+0x54390f7>
14543a0a9:     	movq	-0x48(%rbp), %rdx
14543a0ad:     	movq	-0x40(%rbp), %rax
14543a0b1:     	movq	-0x38(%rbp), %rdi
14543a0b5:     	cmpq	(%rcx), %r14
14543a0b8:     	jne	0x14543a0d4 <.text+0x54390d4>
14543a0ba:     	movq	%rdx, -0x18(%rbp)
14543a0be:     	movq	%rax, -0x10(%rbp)
14543a0c2:     	callq	0x145774710 <.text+0x5773710>
14543a0c7:     	nop
14543a0c8:     	movq	0x68(%rsi), %r12
14543a0cc:     	movq	-0x10(%rbp), %rax
14543a0d0:     	movq	-0x18(%rbp), %rdx
14543a0d4:     	movl	$0x0, (%r12,%r13)
14543a0dc:     	movb	%bl, 0x4(%r12,%r13)
14543a0e1:     	movq	%rdx, 0x8(%r12,%r13)
14543a0e6:     	movq	%rax, 0x10(%r12,%r13)
14543a0eb:     	movq	%rdi, 0x18(%r12,%r13)
14543a0f0:     	incq	%r14
14543a0f3:     	movq	%r14, 0x70(%rsi)
14543a0f7:     	addq	$0x88, %rsp
14543a0fe:     	popq	%rbx
14543a0ff:     	popq	%rdi
14543a100:     	popq	%rsi
14543a101:     	popq	%r12
14543a103:     	popq	%r13
14543a105:     	popq	%r14
14543a107:     	popq	%r15
14543a109:     	popq	%rbp
14543a10a:     	retq
14543a10b:     	movl	$0x8, %eax
14543a110:     	movq	%rax, -0x28(%rbp)
14543a114:     	movq	$0x0, -0x20(%rbp)
14543a11c:     	testq	%r14, %r14
14543a11f:     	jne	0x145439fdc <.text+0x5438fdc>
14543a125:     	jmp	0x145439fec <.text+0x5438fec>
14543a12a:     	leaq	0x13039b7(%rip), %r8    # 0x14673dae8
14543a131:     	movl	$0x3, %edx
14543a136:     	movq	%rdi, %rcx
14543a139:     	callq	0x145903b33 <.text+0x5902b33>
14543a13e:     	nop
14543a13f:     	ud2


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145415f40:     	pushq	%r15
145415f42:     	pushq	%r14
145415f44:     	pushq	%r13
145415f46:     	pushq	%r12
145415f48:     	pushq	%rsi
145415f49:     	pushq	%rdi
145415f4a:     	pushq	%rbp
145415f4b:     	pushq	%rbx
145415f4c:     	subq	$0xb8, %rsp
145415f53:     	movaps	%xmm13, 0xa0(%rsp)
145415f5c:     	movaps	%xmm12, 0x90(%rsp)
145415f65:     	movaps	%xmm11, 0x80(%rsp)
145415f6e:     	movaps	%xmm10, 0x70(%rsp)
145415f74:     	movaps	%xmm9, 0x60(%rsp)
145415f7a:     	movaps	%xmm8, 0x50(%rsp)
145415f80:     	movaps	%xmm7, 0x40(%rsp)
145415f85:     	movaps	%xmm6, 0x30(%rsp)
145415f8a:     	movsd	0x4d55ae(%rip), %xmm0   # 0x1458eb540
145415f92:     	movsd	%xmm0, (%rcx)
145415f96:     	movl	$0x0, 0x8(%rcx)
145415f9d:     	movaps	0x4e2d8c(%rip), %xmm0   # 0x1458f8d30
145415fa4:     	movq	%rcx, 0x28(%rsp)
145415fa9:     	movups	%xmm0, 0xc(%rcx)
145415fad:     	movq	0x28(%rdx), %r15
145415fb1:     	xorps	%xmm7, %xmm7
145415fb4:     	xorps	%xmm6, %xmm6
145415fb7:     	xorps	%xmm8, %xmm8
145415fbb:     	testq	%r15, %r15
145415fbe:     	je	0x145416137 <.text+0x5415137>
145415fc4:     	movq	0x20(%rdx), %r13
145415fc8:     	shlq	$0x5, %r15
145415fcc:     	addq	%r13, %r15
145415fcf:     	movzbl	0x75(%r8), %eax
145415fd4:     	movb	%al, 0x27(%rsp)
145415fd8:     	movzbl	0x74(%r8), %eax
145415fdd:     	movb	%al, 0x26(%rsp)
145415fe1:     	movq	(%r8), %rdi
145415fe4:     	movq	0x8(%r8), %rbx
145415fe8:     	movss	0x4d548f(%rip), %xmm9   # 0x1458eb480
145415ff1:     	xorps	%xmm10, %xmm10
145415ff5:     	movaps	%xmm9, %xmm11
145415ff9:     	movaps	%xmm9, %xmm12
145415ffd:     	movaps	%xmm9, %xmm13
145416001:     	jmp	0x145416019 <.text+0x5415019>
145416003:     	cmpb	%al, 0x27(%rsp)
145416007:     	je	0x145416093 <.text+0x5415093>
14541600d:     	nopl	(%rax)
145416010:     	cmpq	%r15, %r13
145416013:     	je	0x145416137 <.text+0x5415137>
145416019:     	movq	%r13, %r12
14541601c:     	addq	$0x20, %r13
145416020:     	movzbl	(%r12), %ecx
145416025:     	movzbl	0x1(%r12), %eax
14541602b:     	movq	0x8(%r12), %r14
145416030:     	movq	0x10(%r12), %rsi
145416035:     	leaq	0x130a68c(%rip), %rdx   # 0x1467206c8
14541603c:     	movslq	(%rdx,%rcx,4), %rcx
145416040:     	addq	%rdx, %rcx
145416043:     	jmpq	*%rcx
145416045:     	cmpq	%rsi, %rbx
145416048:     	jne	0x145416010 <.text+0x5415010>
14541604a:     	movq	%rdi, %rcx
14541604d:     	movq	%r14, %rdx
145416050:     	movq	%rbx, %r8
145416053:     	callq	0x145756dd7 <.text+0x5755dd7>
145416058:     	testl	%eax, %eax
14541605a:     	jne	0x145416010 <.text+0x5415010>
14541605c:     	jmp	0x145416093 <.text+0x5415093>
14541605e:     	testq	%rsi, %rsi
145416061:     	je	0x145416010 <.text+0x5415010>
145416063:     	shlq	$0x4, %rsi
145416067:     	xorl	%ebp, %ebp
145416069:     	jmp	0x145416079 <.text+0x5415079>
14541606b:     	nopl	(%rax,%rax)
145416070:     	addq	$0x10, %rbp
145416074:     	cmpq	%rbp, %rsi
145416077:     	je	0x145416010 <.text+0x5415010>
145416079:     	cmpq	%rbx, 0x8(%r14,%rbp)
14541607e:     	jne	0x145416070 <.text+0x5415070>
145416080:     	movq	(%r14,%rbp), %rcx
145416084:     	movq	%rdi, %rdx
145416087:     	movq	%rbx, %r8
14541608a:     	callq	0x145756dd7 <.text+0x5755dd7>
14541608f:     	testl	%eax, %eax
145416091:     	jne	0x145416070 <.text+0x5415070>
145416093:     	movss	0x1c(%r12), %xmm0
14541609a:     	movzbl	0x18(%r12), %eax
1454160a0:     	leaq	0x130a63d(%rip), %rcx   # 0x1467206e4
1454160a7:     	movslq	(%rcx,%rax,4), %rax
1454160ab:     	addq	%rcx, %rax
1454160ae:     	jmpq	*%rax
1454160b0:     	addss	%xmm0, %xmm13
1454160b5:     	movq	0x28(%rsp), %rax
1454160ba:     	movss	%xmm13, (%rax)
1454160bf:     	jmp	0x145416010 <.text+0x5415010>
1454160c4:     	cmpb	%al, 0x26(%rsp)
1454160c8:     	jne	0x145416010 <.text+0x5415010>
1454160ce:     	jmp	0x145416093 <.text+0x5415093>
1454160d0:     	addss	%xmm0, %xmm11
1454160d5:     	movq	0x28(%rsp), %rax
1454160da:     	movss	%xmm11, 0x10(%rax)
1454160e0:     	jmp	0x145416010 <.text+0x5415010>
1454160e5:     	addss	%xmm0, %xmm6
1454160e9:     	jmp	0x145416010 <.text+0x5415010>
1454160ee:     	addss	%xmm0, %xmm12
1454160f3:     	movq	0x28(%rsp), %rax
1454160f8:     	movss	%xmm12, 0xc(%rax)
1454160fe:     	jmp	0x145416010 <.text+0x5415010>
145416103:     	addss	%xmm0, %xmm8
145416108:     	jmp	0x145416010 <.text+0x5415010>
14541610d:     	addss	%xmm0, %xmm10
145416112:     	movq	0x28(%rsp), %rax
145416117:     	movss	%xmm10, 0x14(%rax)
14541611d:     	jmp	0x145416010 <.text+0x5415010>
145416122:     	addss	%xmm0, %xmm9
145416127:     	movq	0x28(%rsp), %rax
14541612c:     	movss	%xmm9, 0x18(%rax)
145416132:     	jmp	0x145416010 <.text+0x5415010>
145416137:     	movss	0x4d5341(%rip), %xmm0   # 0x1458eb480
14541613f:     	subss	%xmm8, %xmm0
145416144:     	maxss	0x4f4db0(%rip), %xmm0   # 0x14590aefc
14541614c:     	movq	0x28(%rsp), %rsi
145416151:     	movss	%xmm0, 0x4(%rsi)
145416156:     	movaps	%xmm6, %xmm0
145416159:     	callq	0x145756e1f <.text+0x5755e1f>
14541615e:     	cvttss2si	%xmm0, %rax
145416163:     	xorl	%ecx, %ecx
145416165:     	ucomiss	%xmm7, %xmm0
145416168:     	cmovael	%eax, %ecx
14541616b:     	ucomiss	0x4d53aa(%rip), %xmm0   # 0x1458eb51c
145416172:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
145416177:     	cmovbel	%ecx, %eax
14541617a:     	movl	%eax, 0x8(%rsi)
14541617d:     	movq	%rsi, %rax
145416180:     	movaps	0x30(%rsp), %xmm6
145416185:     	movaps	0x40(%rsp), %xmm7
14541618a:     	movaps	0x50(%rsp), %xmm8
145416190:     	movaps	0x60(%rsp), %xmm9
145416196:     	movaps	0x70(%rsp), %xmm10
14541619c:     	movaps	0x80(%rsp), %xmm11
1454161a5:     	movaps	0x90(%rsp), %xmm12
1454161ae:     	movaps	0xa0(%rsp), %xmm13
1454161b7:     	addq	$0xb8, %rsp
1454161be:     	popq	%rbx
1454161bf:     	popq	%rbp
1454161c0:     	popq	%rdi
1454161c1:     	popq	%rsi
1454161c2:     	popq	%r12
1454161c4:     	popq	%r13
1454161c6:     	popq	%r14
1454161c8:     	popq	%r15
1454161ca:     	retq

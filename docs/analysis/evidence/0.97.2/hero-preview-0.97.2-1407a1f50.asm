
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1407a1f50:     	pushq	%r14
1407a1f52:     	pushq	%rsi
1407a1f53:     	pushq	%rdi
1407a1f54:     	pushq	%rbp
1407a1f55:     	pushq	%rbx
1407a1f56:     	subq	$0x40, %rsp
1407a1f5a:     	movaps	%xmm7, 0x30(%rsp)
1407a1f5f:     	movaps	%xmm6, 0x20(%rsp)
1407a1f64:     	movl	%r9d, %esi
1407a1f67:     	movaps	%xmm2, %xmm6
1407a1f6a:     	movaps	%xmm1, %xmm7
1407a1f6d:     	movq	%rcx, %rdi
1407a1f70:     	movl	0x90(%rsp), %ebp
1407a1f77:     	movl	0x71fdbcb(%rip), %eax   # 0x14799fb48
1407a1f7d:     	testl	%eax, %eax
1407a1f7f:     	jne	0x1407a2030 <.text+0x7a1030>
1407a1f85:     	movb	$0x1, %cl
1407a1f87:     	xorl	%eax, %eax
1407a1f89:     	lock
1407a1f8a:     	cmpxchgb	%cl, 0x71fdad7(%rip)    # 0x14799fa68
1407a1f91:     	jne	0x1407a204e <.text+0x7a104e>
1407a1f97:     	movq	0x7244e0a(%rip), %r14   # 0x1479e6da8
1407a1f9e:     	movq	(%r14), %rax
1407a1fa1:     	shlq	%rax
1407a1fa4:     	testq	%rax, %rax
1407a1fa7:     	jne	0x1407a205f <.text+0x7a105f>
1407a1fad:     	movzbl	0x71fdab5(%rip), %eax   # 0x14799fa69
1407a1fb4:     	leaq	0x71fdadd(%rip), %rcx   # 0x14799fa98
1407a1fbb:     	movl	$0xa4, %r8d
1407a1fc1:     	movq	%rdi, %rdx
1407a1fc4:     	callq	0x145756ddd <.text+0x5755ddd>
1407a1fc9:     	movss	%xmm7, 0x71fdb6b(%rip)  # 0x14799fb3c
1407a1fd1:     	movss	%xmm6, 0x71fdb67(%rip)  # 0x14799fb40
1407a1fd9:     	cmpl	$0x800, %esi            # imm = 0x800
1407a1fdf:     	movl	$0x800, %eax            # imm = 0x800
1407a1fe4:     	cmovael	%eax, %esi
1407a1fe7:     	cmpl	$0x800, %ebp            # imm = 0x800
1407a1fed:     	cmovbl	%ebp, %eax
1407a1ff0:     	movl	%esi, 0x71fda92(%rip)   # 0x14799fa88
1407a1ff6:     	movl	%eax, 0x71fda90(%rip)   # 0x14799fa8c
1407a1ffc:     	movq	(%r14), %rax
1407a1fff:     	shlq	%rax
1407a2002:     	testq	%rax, %rax
1407a2005:     	jne	0x1407a20e2 <.text+0x7a10e2>
1407a200b:     	xorl	%eax, %eax
1407a200d:     	xchgb	%al, 0x71fda55(%rip)    # 0x14799fa68
1407a2013:     	cmpb	$0x2, %al
1407a2015:     	je	0x1407a20c2 <.text+0x7a10c2>
1407a201b:     	movaps	0x20(%rsp), %xmm6
1407a2020:     	movaps	0x30(%rsp), %xmm7
1407a2025:     	addq	$0x40, %rsp
1407a2029:     	popq	%rbx
1407a202a:     	popq	%rbp
1407a202b:     	popq	%rdi
1407a202c:     	popq	%rsi
1407a202d:     	popq	%r14
1407a202f:     	retq
1407a2030:     	leaq	0x71fda31(%rip), %rcx   # 0x14799fa68
1407a2037:     	callq	0x145762bfa <.text+0x5761bfa>
1407a203c:     	movb	$0x1, %cl
1407a203e:     	xorl	%eax, %eax
1407a2040:     	lock
1407a2041:     	cmpxchgb	%cl, 0x71fda20(%rip)    # 0x14799fa68
1407a2048:     	je	0x1407a1f97 <.text+0x7a0f97>
1407a204e:     	leaq	0x71fda13(%rip), %rcx   # 0x14799fa68
1407a2055:     	callq	0x1458e58c0 <.text+0x58e48c0>
1407a205a:     	jmp	0x1407a1f97 <.text+0x7a0f97>
1407a205f:     	callq	0x1458e6650 <.text+0x58e5650>
1407a2064:     	movl	%eax, %ebx
1407a2066:     	movzbl	0x71fd9fc(%rip), %eax   # 0x14799fa69
1407a206d:     	leaq	0x71fda24(%rip), %rcx   # 0x14799fa98
1407a2074:     	movl	$0xa4, %r8d
1407a207a:     	movq	%rdi, %rdx
1407a207d:     	callq	0x145756ddd <.text+0x5755ddd>
1407a2082:     	cmpl	$0x800, %esi            # imm = 0x800
1407a2088:     	movl	$0x800, %eax            # imm = 0x800
1407a208d:     	cmovael	%eax, %esi
1407a2090:     	movss	%xmm7, 0x71fdaa4(%rip)  # 0x14799fb3c
1407a2098:     	cmpl	$0x800, %ebp            # imm = 0x800
1407a209e:     	cmovbl	%ebp, %eax
1407a20a1:     	movss	%xmm6, 0x71fda97(%rip)  # 0x14799fb40
1407a20a9:     	movl	%esi, 0x71fd9d9(%rip)   # 0x14799fa88
1407a20af:     	movl	%eax, 0x71fd9d7(%rip)   # 0x14799fa8c
1407a20b5:     	testb	%bl, %bl
1407a20b7:     	jne	0x1407a1ffc <.text+0x7a0ffc>
1407a20bd:     	jmp	0x1407a200b <.text+0x7a100b>
1407a20c2:     	leaq	0x71fd99f(%rip), %rcx   # 0x14799fa68
1407a20c9:     	movaps	0x20(%rsp), %xmm6
1407a20ce:     	movaps	0x30(%rsp), %xmm7
1407a20d3:     	addq	$0x40, %rsp
1407a20d7:     	popq	%rbx
1407a20d8:     	popq	%rbp
1407a20d9:     	popq	%rdi
1407a20da:     	popq	%rsi
1407a20db:     	popq	%r14
1407a20dd:     	jmp	0x1458e5980 <.text+0x58e4980>
1407a20e2:     	callq	0x1458e6650 <.text+0x58e5650>
1407a20e7:     	testb	%al, %al
1407a20e9:     	jne	0x1407a200b <.text+0x7a100b>
1407a20ef:     	movb	$0x1, 0x71fd973(%rip)   # 0x14799fa69
1407a20f6:     	jmp	0x1407a200b <.text+0x7a100b>

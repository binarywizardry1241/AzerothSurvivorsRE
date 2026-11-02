
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459a9020:     	pushq	%r15
1459a9022:     	pushq	%r14
1459a9024:     	pushq	%r12
1459a9026:     	pushq	%rsi
1459a9027:     	pushq	%rdi
1459a9028:     	pushq	%rbp
1459a9029:     	pushq	%rbx
1459a902a:     	subq	$0x60, %rsp
1459a902e:     	movq	(%rdx), %rbx
1459a9031:     	movq	0x8(%rdx), %rax
1459a9035:     	movq	%rax, %rsi
1459a9038:     	subq	%rbx, %rsi
1459a903b:     	movabsq	$0x7ffffffffffffff8, %r8 # imm = 0x7FFFFFFFFFFFFFF8
1459a9045:     	cmpq	%r8, %rsi
1459a9048:     	jbe	0x1459a9059 <.text+0x59a8059>
1459a904a:     	xorl	%edi, %edi
1459a904c:     	movq	%rdi, %rcx
1459a904f:     	movq	%rsi, %rdx
1459a9052:     	callq	0x145d6944b <.text+0x5d6844b>
1459a9057:     	ud2
1459a9059:     	cmpq	%rbx, %rax
1459a905c:     	je	0x1459a9186 <.text+0x59a8186>
1459a9062:     	movq	%rdx, %r15
1459a9065:     	movq	%rcx, %r14
1459a9068:     	callq	0x140002200 <.text+0x1200>
1459a906d:     	movl	$0x8, %edi
1459a9072:     	movl	$0x8, %edx
1459a9077:     	movq	%rsi, %rcx
1459a907a:     	callq	0x1400021c0 <.text+0x11c0>
1459a907f:     	testq	%rax, %rax
1459a9082:     	je	0x1459a904c <.text+0x59a804c>
1459a9084:     	shrq	$0x6, %rsi
1459a9088:     	movq	0x10(%r15), %rdx
1459a908c:     	movl	$0x25, %r8d
1459a9092:     	leaq	0x27(%rsp), %r9
1459a9097:     	movl	$0xd1, %r10d
1459a909d:     	leaq	0x180c0c4(%rip), %r11   # 0x1471b5168
1459a90a4:     	movq	%rsi, %rdi
1459a90a7:     	movq	%r14, %rcx
1459a90aa:     	jmp	0x1459a912d <.text+0x59a812d>
1459a90af:     	nop
1459a90b0:     	movups	-0x24(%rbx,%r8), %xmm0
1459a90b6:     	movups	-0x15(%rbx,%r8), %xmm1
1459a90bc:     	movups	%xmm1, 0x2f(%rsp)
1459a90c1:     	movaps	%xmm0, 0x20(%rsp)
1459a90c6:     	movss	-0x5(%rbx,%r8), %xmm0
1459a90cd:     	movzbl	-0x1(%rbx,%r8), %r14d
1459a90d3:     	movups	0xb(%rbx,%r8), %xmm1
1459a90d9:     	movups	%xmm1, 0x4b(%rsp)
1459a90de:     	movups	(%rbx,%r8), %xmm1
1459a90e3:     	movaps	%xmm1, 0x40(%rsp)
1459a90e8:     	movb	%bpl, -0x25(%rax,%r8)
1459a90ed:     	movaps	0x20(%rsp), %xmm1
1459a90f2:     	movups	%xmm1, -0x24(%rax,%r8)
1459a90f8:     	movups	0x2f(%rsp), %xmm1
1459a90fd:     	movups	%xmm1, -0x15(%rax,%r8)
1459a9103:     	movss	%xmm0, -0x5(%rax,%r8)
1459a910a:     	movb	%r14b, -0x1(%rax,%r8)
1459a910f:     	movaps	0x40(%rsp), %xmm0
1459a9114:     	movups	%xmm0, (%rax,%r8)
1459a9119:     	movups	0x4b(%rsp), %xmm0
1459a911e:     	movups	%xmm0, 0xb(%rax,%r8)
1459a9124:     	addq	$0x40, %r8
1459a9128:     	decq	%rdi
1459a912b:     	je	0x1459a918d <.text+0x59a818d>
1459a912d:     	movzbl	-0x25(%rbx,%r8), %ebp
1459a9133:     	cmpb	$0x24, %bpl
1459a9137:     	jne	0x1459a90b0 <.text+0x59a80b0>
1459a913d:     	movzbl	-0x1(%rbx,%r8), %r14d
1459a9143:     	movss	-0x5(%rbx,%r8), %xmm1
1459a914a:     	btl	%r14d, %r10d
1459a914e:     	movaps	%xmm1, %xmm0
1459a9151:     	jae	0x1459a915d <.text+0x59a815d>
1459a9153:     	movq	(%r11,%r14,8), %r15
1459a9157:     	movss	0x4(%r15), %xmm0
1459a915d:     	leaq	(%rbx,%r8), %r15
1459a9161:     	addq	$-0x1d, %r15
1459a9165:     	subss	%xmm1, %xmm0
1459a9169:     	mulss	(%rdx), %xmm0
1459a916d:     	addss	%xmm1, %xmm0
1459a9171:     	movq	0x10(%r15), %r12
1459a9175:     	movq	%r12, 0x10(%r9)
1459a9179:     	movups	(%r15), %xmm1
1459a917d:     	movups	%xmm1, (%r9)
1459a9181:     	jmp	0x1459a90e8 <.text+0x59a80e8>
1459a9186:     	movl	$0x8, %eax
1459a918b:     	xorl	%esi, %esi
1459a918d:     	movq	%rsi, (%rcx)
1459a9190:     	movq	%rax, 0x8(%rcx)
1459a9194:     	movq	%rsi, 0x10(%rcx)
1459a9198:     	movq	%rcx, %rax
1459a919b:     	addq	$0x60, %rsp
1459a919f:     	popq	%rbx
1459a91a0:     	popq	%rbp
1459a91a1:     	popq	%rdi
1459a91a2:     	popq	%rsi
1459a91a3:     	popq	%r12
1459a91a5:     	popq	%r14
1459a91a7:     	popq	%r15
1459a91a9:     	retq

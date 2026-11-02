
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459aff60:     	pushq	%rbp
1459aff61:     	pushq	%r15
1459aff63:     	pushq	%r14
1459aff65:     	pushq	%r13
1459aff67:     	pushq	%r12
1459aff69:     	pushq	%rsi
1459aff6a:     	pushq	%rdi
1459aff6b:     	pushq	%rbx
1459aff6c:     	subq	$0x118, %rsp            # imm = 0x118
1459aff73:     	leaq	0x80(%rsp), %rbp
1459aff7b:     	movaps	%xmm6, 0x80(%rbp)
1459aff82:     	movq	$-0x2, 0x78(%rbp)
1459aff8a:     	movq	(%rdx), %rax
1459aff8d:     	movq	%rax, 0x60(%rbp)
1459aff91:     	movq	0x8(%rdx), %r8
1459aff95:     	movq	0x10(%rdx), %r15
1459aff99:     	movq	(%rcx), %r12
1459aff9c:     	movq	0x8(%rcx), %r13
1459affa0:     	subq	%r12, %r13
1459affa3:     	shrq	$0x3, %r13
1459affa7:     	movq	0x10(%rcx), %rax
1459affab:     	cmpq	%rax, %r13
1459affae:     	cmovaeq	%rax, %r13
1459affb2:     	xorl	%edi, %edi
1459affb4:     	leaq	-0x30(%rbp), %rsi
1459affb8:     	xorps	%xmm6, %xmm6
1459affbb:     	leaq	0x1fd2be(%rip), %rbx    # 0x145bad280 <.text+0x5bac280>
1459affc2:     	jmp	0x1459afff0 <.text+0x59aeff0>
1459affc4:     	nopw	%cs:(%rax,%rax)
1459affd0:     	incq	%rdi
1459affd3:     	movq	0x58(%rbp), %r8
1459affd7:     	leaq	(%r8,%r8,2), %rax
1459affdb:     	movq	-0x48(%rbp), %rcx
1459affdf:     	movq	%rcx, 0x10(%r15,%rax,8)
1459affe4:     	movups	-0x58(%rbp), %xmm0
1459affe8:     	movups	%xmm0, (%r15,%rax,8)
1459affed:     	incq	%r8
1459afff0:     	cmpq	%r13, %rdi
1459afff3:     	jae	0x1459b01e6 <.text+0x59af1e6>
1459afff9:     	movq	(%r12,%rdi,8), %r14
1459afffd:     	cmpq	$-0x1, 0x18(%r14)
1459b0002:     	movq	%r8, 0x58(%rbp)
1459b0006:     	je	0x1459b0030 <.text+0x59af030>
1459b0008:     	movq	0x30(%r14), %rax
1459b000c:     	movzbl	0x54(%rax), %eax
1459b0010:     	testq	%rax, %rax
1459b0013:     	leaq	0x1805b4a(%rip), %rcx   # 0x1471b5b64
1459b001a:     	leaq	0x1805b47(%rip), %rdx   # 0x1471b5b68
1459b0021:     	cmovneq	%rdx, %rcx
1459b0025:     	orq	$0x4, %rax
1459b0029:     	jmp	0x1459b0070 <.text+0x59af070>
1459b002b:     	nopl	(%rax,%rax)
1459b0030:     	movl	$0x8, %eax
1459b0035:     	cmpq	$-0x1, 0x40(%r14)
1459b003a:     	leaq	0x1805b10(%rip), %rcx   # 0x1471b5b51
1459b0041:     	jne	0x1459b0070 <.text+0x59af070>
1459b0043:     	movzbl	0x15c(%r14), %edx
1459b004b:     	testq	%rdx, %rdx
1459b004e:     	leaq	0x1805b04(%rip), %rcx   # 0x1471b5b59
1459b0055:     	leaq	0x1805b03(%rip), %rax   # 0x1471b5b5f
1459b005c:     	cmovneq	%rax, %rcx
1459b0060:     	movl	$0x6, %eax
1459b0065:     	subq	%rdx, %rax
1459b0068:     	nopl	(%rax,%rax)
1459b0070:     	movq	%rcx, -0x40(%rbp)
1459b0074:     	movq	%rax, -0x38(%rbp)
1459b0078:     	movl	0x88(%r14), %eax
1459b007f:     	movl	%eax, 0x70(%rbp)
1459b0082:     	movq	%r14, %rcx
1459b0085:     	callq	0x1458dfb70 <.text+0x58deb70>
1459b008a:     	nop
1459b008b:     	movq	$0x0, -0x30(%rbp)
1459b0093:     	movq	$0x1, -0x28(%rbp)
1459b009b:     	movq	$0x0, -0x20(%rbp)
1459b00a3:     	testq	%rdx, %rdx
1459b00a6:     	jne	0x1459b01a4 <.text+0x59af1a4>
1459b00ac:     	addq	%rax, %rdx
1459b00af:     	movq	%rax, %rcx
1459b00b2:     	movq	%rsi, %r8
1459b00b5:     	callq	0x1459b9b70 <.text+0x59b8b70>
1459b00ba:     	nop
1459b00bb:     	movq	-0x20(%rbp), %rax
1459b00bf:     	movq	%rax, 0x50(%rbp)
1459b00c3:     	movups	-0x30(%rbp), %xmm0
1459b00c7:     	movaps	%xmm0, 0x40(%rbp)
1459b00cb:     	movss	0xf0(%r14), %xmm0
1459b00d4:     	maxss	%xmm6, %xmm0
1459b00d8:     	movss	%xmm0, 0x6c(%rbp)
1459b00dd:     	leaq	0xf4(%r14), %rax
1459b00e4:     	movl	$0x38, %ecx
1459b00e9:     	cmpq	$-0x1, 0x18(%r14)
1459b00ee:     	jne	0x1459b0100 <.text+0x59af100>
1459b00f0:     	movl	$0x60, %ecx
1459b00f5:     	cmpq	$-0x1, 0x40(%r14)
1459b00fa:     	je	0x1459b019d <.text+0x59af19d>
1459b0100:     	movzbl	(%r14,%rcx), %ecx
1459b0105:     	movb	%cl, 0x77(%rbp)
1459b0108:     	leaq	-0x40(%rbp), %rcx
1459b010c:     	movq	%rcx, -0x30(%rbp)
1459b0110:     	leaq	-0x59ae057(%rip), %rcx  # 0x1400020c0 <.text+0x10c0>
1459b0117:     	movq	%rcx, -0x28(%rbp)
1459b011b:     	leaq	0x70(%rbp), %rcx
1459b011f:     	movq	%rcx, -0x20(%rbp)
1459b0123:     	leaq	0x1fde56(%rip), %rcx    # 0x145badf80 <.text+0x5bacf80>
1459b012a:     	movq	%rcx, -0x18(%rbp)
1459b012e:     	leaq	0x40(%rbp), %rcx
1459b0132:     	movq	%rcx, -0x10(%rbp)
1459b0136:     	leaq	-0x59ae05d(%rip), %rcx  # 0x1400020e0 <.text+0x10e0>
1459b013d:     	movq	%rcx, -0x8(%rbp)
1459b0141:     	leaq	0x6c(%rbp), %rcx
1459b0145:     	movq	%rcx, (%rbp)
1459b0149:     	movq	%rbx, 0x8(%rbp)
1459b014d:     	movq	%rax, 0x10(%rbp)
1459b0151:     	movq	%rbx, 0x18(%rbp)
1459b0155:     	leaq	0x77(%rbp), %rax
1459b0159:     	movq	%rax, 0x20(%rbp)
1459b015d:     	leaq	0x1fa74c(%rip), %rax    # 0x145baa8b0 <.text+0x5ba98b0>
1459b0164:     	movq	%rax, 0x28(%rbp)
1459b0168:     	leaq	-0x58(%rbp), %rcx
1459b016c:     	leaq	0x18059fa(%rip), %rdx   # 0x1471b5b6d
1459b0173:     	movq	%rsi, %r8
1459b0176:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1459b017b:     	nop
1459b017c:     	movq	0x40(%rbp), %rdx
1459b0180:     	testq	%rdx, %rdx
1459b0183:     	je	0x1459affd0 <.text+0x59aefd0>
1459b0189:     	movq	0x48(%rbp), %rcx
1459b018d:     	movl	$0x1, %r8d
1459b0193:     	callq	0x1400021d0 <.text+0x11d0>
1459b0198:     	jmp	0x1459affd0 <.text+0x59aefd0>
1459b019d:     	xorl	%ecx, %ecx
1459b019f:     	jmp	0x1459b0105 <.text+0x59af105>
1459b01a4:     	movq	%rdx, %r8
1459b01a7:     	shrq	$0x2, %r8
1459b01ab:     	movl	%edx, %ecx
1459b01ad:     	andl	$0x3, %ecx
1459b01b0:     	cmpq	$0x1, %rcx
1459b01b4:     	sbbq	$-0x1, %r8
1459b01b8:     	movq	$0x1, 0x20(%rsp)
1459b01c1:     	movl	$0x1, %r9d
1459b01c7:     	movq	%rsi, %rcx
1459b01ca:     	movq	%rdx, 0x30(%rbp)
1459b01ce:     	xorl	%edx, %edx
1459b01d0:     	movq	%rax, 0x38(%rbp)
1459b01d4:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459b01d9:     	movq	0x30(%rbp), %rdx
1459b01dd:     	movq	0x38(%rbp), %rax
1459b01e1:     	jmp	0x1459b00ac <.text+0x59af0ac>
1459b01e6:     	movq	0x60(%rbp), %rax
1459b01ea:     	movq	%r8, (%rax)
1459b01ed:     	movaps	0x80(%rbp), %xmm6
1459b01f4:     	addq	$0x118, %rsp            # imm = 0x118
1459b01fb:     	popq	%rbx
1459b01fc:     	popq	%rdi
1459b01fd:     	popq	%rsi
1459b01fe:     	popq	%r12
1459b0200:     	popq	%r13
1459b0202:     	popq	%r14
1459b0204:     	popq	%r15
1459b0206:     	popq	%rbp
1459b0207:     	retq

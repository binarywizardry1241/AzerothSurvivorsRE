1454a0af2:     	negq	%r8
1454a0af5:     	xorl	%edx, %edx
1454a0af7:     	movq	%rax, %r9
1454a0afa:     	nopw	(%rax,%rax)
1454a0b00:     	cmpl	$0x7, (%r9)
1454a0b04:     	je	0x1454a1c78 <.text+0x54a0c78>
1454a0b0a:     	incq	%rdx
1454a0b0d:     	addq	$0x18, %r9
1454a0b11:     	movq	%r8, %r10
1454a0b14:     	addq	%rdx, %r10
1454a0b17:     	jne	0x1454a0b00 <.text+0x549fb00>
1454a0b19:     	movq	%r12, %rcx
1454a0b1c:     	callq	0x14549e650 <.text+0x549d650>
1454a0b21:     	movss	0x110(%r12), %xmm1
1454a0b2b:     	addss	%xmm10, %xmm1
1454a0b30:     	movss	0x114(%r12), %xmm0
1454a0b3a:     	movaps	%xmm0, %xmm2

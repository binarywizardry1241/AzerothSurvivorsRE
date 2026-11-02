145c82ffd:     	leaq	0x78(%rsp), %rdx
145c83002:     	movq	%rdi, %rcx
145c83005:     	callq	0x145c7e7e0 <.text+0x5c7d7e0>
145c8300a:     	movq	%rdi, %rcx
145c8300d:     	movq	%rbx, %rdx
145c83010:     	callq	0x145c6cec0 <.text+0x5c6bec0>
145c83015:     	cmpl	$0x1, %eax
145c83018:     	jne	0x145c83210 <.text+0x5c82210>
145c8301e:     	movq	%rdi, %rcx
145c83021:     	movq	%rbx, %rdx
145c83024:     	movq	$-0x1f8, %rax           # imm = 0xFE08
145c8302b:     	addq	0x5b8(%rdi), %rax
145c83032:     	imulq	$0x1f8, 0x5c0(%rdi), %r8 # imm = 0x1F8
145c8303d:     	testq	%r8, %r8
145c83040:     	je	0x145c83149 <.text+0x5c82149>
145c83046:     	leaq	0x1f8(%rax), %r14
145c8304d:     	addq	$-0x1f8, %r8            # imm = 0xFE08
145c83054:     	cmpq	%rdx, 0x2e8(%rax)
145c8305b:     	movq	%r14, %rax
145c8305e:     	jne	0x145c8303d <.text+0x5c8203d>
145c83060:     	movaps	%xmm0, %xmm1
145c83063:     	addss	%xmm6, %xmm1
145c83067:     	movss	%xmm1, 0x1c8(%r14)
145c83070:     	movss	%xmm0, 0x1cc(%r14)

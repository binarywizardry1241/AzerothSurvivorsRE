
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145a1c199:     	movq	0x70(%rbp), %rcx
145a1c19d:     	movups	0x19(%rcx), %xmm0
145a1c1a1:     	movups	0x28(%rcx), %xmm1
145a1c1a5:     	movups	%xmm1, -0x44(%rbp)
145a1c1a9:     	movups	%xmm0, -0x53(%rbp)
145a1c1ad:     	movb	%al, -0x54(%rbp)
145a1c1b0:     	leaq	0x60(%rcx), %rax
145a1c1b4:     	leaq	0x38(%rcx), %rbx
145a1c1b8:     	leaq	-0x54(%rbp), %rcx
145a1c1bc:     	movq	%rcx, -0x20(%rbp)
145a1c1c0:     	movq	$0x20, -0x18(%rbp)
145a1c1c8:     	movq	%rax, -0x10(%rbp)
145a1c1cc:     	movq	$0x14, -0x8(%rbp)
145a1c1d4:     	movq	%rbx, (%rbp)
145a1c1d8:     	movq	$0x28, 0x8(%rbp)
145a1c1e0:     	leaq	-0x34(%rbp), %rcx
145a1c1e4:     	leaq	-0x20(%rbp), %rdx
145a1c1e8:     	movl	$0x3, %r8d
145a1c1ee:     	callq	0x145a1b910 <.text+0x5a1a910>
145a1c1f3:     	nop
145a1c1f4:     	movdqu	(%rdi), %xmm0
145a1c1f8:     	movdqu	-0x34(%rbp), %xmm1
145a1c1fd:     	pcmpeqb	%xmm0, %xmm1
145a1c201:     	movd	0x10(%rdi), %xmm0
145a1c206:     	movd	-0x24(%rbp), %xmm2
145a1c20b:     	pcmpeqb	%xmm0, %xmm2
145a1c20f:     	pand	%xmm1, %xmm2
145a1c213:     	pmovmskb	%xmm2, %eax
145a1c217:     	cmpl	$0xffff, %eax           # imm = 0xFFFF
145a1c21c:     	je	0x145a1c27d <.text+0x5a1b27d>
145a1c21e:     	movl	0x10(%rdi), %eax
145a1c221:     	movl	%eax, -0x10(%rbp)
145a1c224:     	movups	(%rdi), %xmm0
145a1c227:     	movaps	%xmm0, -0x20(%rbp)
145a1c22b:     	movl	-0x24(%rbp), %eax
145a1c22e:     	movl	%eax, 0x4(%rbp)
145a1c231:     	movups	-0x34(%rbp), %xmm1
145a1c235:     	movups	%xmm1, -0xc(%rbp)
145a1c239:     	movups	%xmm0, 0x8(%rsi)
145a1c23d:     	movl	-0x10(%rbp), %eax
145a1c240:     	movl	%eax, 0x18(%rsi)
145a1c243:     	movq	-0xc(%rbp), %rax
145a1c247:     	movq	%rax, 0x1c(%rsi)
145a1c24b:     	movl	-0x4(%rbp), %eax
145a1c24e:     	movl	%eax, 0x24(%rsi)
145a1c251:     	movq	(%rbp), %rax
145a1c255:     	movq	%rax, 0x28(%rsi)
145a1c259:     	movq	$-0x1, (%rsi)
145a1c260:     	movq	0x70(%rbp), %rax
145a1c264:     	movq	(%rax), %rdx
145a1c267:     	testq	%rdx, %rdx
145a1c26a:     	je	0x145a1c2d4 <.text+0x5a1b2d4>
145a1c26c:     	movq	0x8(%rax), %rcx
145a1c270:     	movl	$0x1, %r8d
145a1c276:     	callq	0x1400021d0 <.text+0x11d0>
145a1c27b:     	jmp	0x145a1c2d4 <.text+0x5a1b2d4>

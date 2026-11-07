
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14594f3e2:     	movl	%eax, %edx
14594f3e4:     	andl	$0x3, %edx
14594f3e7:     	cmpq	$0x4, %rax
14594f3eb:     	jae	0x14594f40c <.text+0x594e40c>
14594f3ed:     	movss	0x42187b(%rip), %xmm7   # 0x145d70c70
14594f3f5:     	xorl	%r8d, %r8d
14594f3f8:     	jmp	0x14594f462 <.text+0x594e462>
14594f3fa:     	movss	0x41df69(%rip), %xmm10  # 0x145d6d36c
14594f403:     	movaps	%xmm10, %xmm7
14594f407:     	jmp	0x14594f4a6 <.text+0x594e4a6>
14594f40c:     	movabsq	$0x1fffffffffffffc, %r9 # imm = 0x1FFFFFFFFFFFFFC
14594f416:     	andq	%rax, %r9
14594f419:     	leaq	0x160(%rcx), %r10
14594f420:     	movss	0x421848(%rip), %xmm7   # 0x145d70c70
14594f428:     	xorl	%r8d, %r8d
14594f42b:     	nopl	(%rax,%rax)
14594f430:     	addss	-0x138(%r10), %xmm7
14594f439:     	addss	-0xd0(%r10), %xmm7
14594f442:     	addss	-0x68(%r10), %xmm7
14594f448:     	addss	(%r10), %xmm7
14594f44d:     	addq	$0x4, %r8
14594f451:     	addq	$0x1a0, %r10            # imm = 0x1A0
14594f458:     	cmpq	%r8, %r9
14594f45b:     	jne	0x14594f430 <.text+0x594e430>
14594f45d:     	testq	%rdx, %rdx
14594f460:     	je	0x14594f48f <.text+0x594e48f>
14594f462:     	imulq	$0x68, %r8, %r8
14594f466:     	addq	%r8, %rcx
14594f469:     	addq	$0x28, %rcx
14594f46d:     	imulq	$0x68, %rdx, %rdx
14594f471:     	xorl	%r8d, %r8d
14594f474:     	nopw	%cs:(%rax,%rax)
14594f480:     	addss	(%rcx,%r8), %xmm7
14594f486:     	addq	$0x68, %r8
14594f48a:     	cmpq	%r8, %rdx
14594f48d:     	jne	0x14594f480 <.text+0x594e480>
14594f48f:     	cvtsi2ss	%rax, %xmm0
14594f494:     	divss	%xmm0, %xmm7
14594f498:     	movss	0x41decb(%rip), %xmm10  # 0x145d6d36c
14594f4a1:     	maxss	%xmm10, %xmm7

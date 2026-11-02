
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543fce0:     	movq	0x4f8(%rbp), %rax
14543fce7:     	movq	0xa10(%rax), %rdx
14543fcee:     	cmpq	%rdx, %r14
14543fcf1:     	jae	0x145442382 <.text+0x5441382>
14543fcf7:     	movq	0xa08(%rax), %rdx
14543fcfe:     	addq	%r15, %rdx
14543fd01:     	movq	%r12, %rcx
14543fd04:     	callq	0x1455130a0 <.text+0x55120a0>
14543fd09:     	nop
14543fd0a:     	movq	0x88(%rbp), %rax
14543fd11:     	cmpq	$-0x1, %rax
14543fd15:     	je	0x14543fd80 <.text+0x543ed80>
14543fd17:     	movq	%rax, 0x4e8(%rbp)
14543fd1e:     	movl	0x80(%rbp), %r8d
14543fd25:     	movq	0x90(%rbp), %r9
14543fd2c:     	movq	0x98(%rbp), %rax
14543fd33:     	movq	%rax, 0x20(%rsp)
14543fd38:     	movq	0x4f8(%rbp), %rcx
14543fd3f:     	movq	%r14, %rdx
14543fd42:     	movq	%r9, 0x4d8(%rbp)
14543fd49:     	callq	0x1454440d0 <.text+0x54430d0>
14543fd4e:     	nop
14543fd4f:     	movq	0x4e8(%rbp), %rdx
14543fd56:     	testq	%rdx, %rdx
14543fd59:     	je	0x14543fce0 <.text+0x543ece0>
14543fd5b:     	movl	$0x1, %r8d
14543fd61:     	movq	0x4d8(%rbp), %rcx
14543fd68:     	callq	0x1400021d0 <.text+0x11d0>

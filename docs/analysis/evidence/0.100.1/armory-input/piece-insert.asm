
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140172f90:     	pushq	%rsi
140172f91:     	pushq	%rdi
140172f92:     	subq	$0x318, %rsp            # imm = 0x318
140172f99:     	movq	%rdx, %rsi
140172f9c:     	movq	%rcx, %rdx
140172f9f:     	addq	$0x2f8, (%r8)           # imm = 0x2F8
140172fa6:     	testq	%rsi, %rsi
140172fa9:     	je	0x140172fe2 <.text+0x171fe2>
140172fab:     	leaq	0x20(%rsp), %rdi
140172fb0:     	movl	$0x2f8, %r8d            # imm = 0x2F8
140172fb6:     	movq	%rdi, %rcx
140172fb9:     	callq	0x1457731ed <.text+0x57721ed>
140172fbe:     	movq	%rdi, %rcx
140172fc1:     	movq	%rsi, %rdx
140172fc4:     	callq	0x1400527e0 <.text+0x517e0>
140172fc9:     	movq	%rsi, %rcx
140172fcc:     	callq	0x144e89050 <.text+0x4e88050>
140172fd1:     	movq	%rsi, %rcx
140172fd4:     	addq	$0x318, %rsp            # imm = 0x318
140172fdb:     	popq	%rdi
140172fdc:     	popq	%rsi
140172fdd:     	jmp	0x144e89000 <.text+0x4e88000>
140172fe2:     	leaq	0x20(%rsp), %rsi
140172fe7:     	movl	$0x2f8, %r8d            # imm = 0x2F8
140172fed:     	movq	%rsi, %rcx
140172ff0:     	callq	0x1457731ed <.text+0x57721ed>
140172ff5:     	movq	%rsi, %rcx
140172ff8:     	callq	0x14016a0d0 <.text+0x1690d0>
140172ffd:     	nop
140172ffe:     	addq	$0x318, %rsp            # imm = 0x318
140173005:     	popq	%rdi
140173006:     	popq	%rsi
140173007:     	retq

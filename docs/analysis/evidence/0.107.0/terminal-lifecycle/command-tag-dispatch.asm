Disassembly of section .text:

0000000140001000 <.text>:
1458a562c:     	movq	%rdx, %r9
1458a562f:     	movl	(%rdx), %eax
1458a5631:     	subl	$0x2, %eax
1458a5634:     	movl	$0xb, %edx
1458a5639:     	cmovael	%eax, %edx
1458a563c:     	movq	%rcx, %rsi
1458a563f:     	leaq	0x1343866(%rip), %rax   # 0x146be8eac
1458a5646:     	movslq	(%rax,%rdx,4), %rcx
1458a564a:     	addq	%rax, %rcx
1458a564d:     	jmpq	*%rcx

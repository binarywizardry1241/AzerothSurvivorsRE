
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145486e90:     	movq	0x18(%rcx), %rdx
145486e94:     	movq	(%rcx), %r8
145486e97:     	movq	0x8(%rcx), %r9
145486e9b:     	leaq	(%rdx,%r8), %rax
145486e9f:     	rolq	$0x17, %rax
145486ea3:     	addq	%r8, %rax
145486ea6:     	movq	%r9, %r10
145486ea9:     	shlq	$0x11, %r10
145486ead:     	movq	0x10(%rcx), %r11
145486eb1:     	xorq	%r8, %r11
145486eb4:     	xorq	%r9, %rdx
145486eb7:     	xorq	%r11, %r9
145486eba:     	movq	%r9, 0x8(%rcx)
145486ebe:     	xorq	%rdx, %r8
145486ec1:     	movq	%r8, (%rcx)
145486ec4:     	xorq	%r10, %r11
145486ec7:     	rolq	$0x2d, %rdx
145486ecb:     	movq	%r11, 0x10(%rcx)
145486ecf:     	movq	%rdx, 0x18(%rcx)
145486ed3:     	shrq	$0x20, %rax
145486ed7:     	retq

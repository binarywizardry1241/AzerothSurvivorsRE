
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b4aeb:     	movq	0x358(%rbp), %rax
1454b4af2:     	movl	0x40(%rax), %r9d
1454b4af6:     	movzbl	0x74(%rax), %eax
1454b4afa:     	movzbl	0x129(%r11), %ebx
1454b4b02:     	movb	$0x3, 0x129(%r11)
1454b4b0a:     	movups	0x20(%r11), %xmm7
1454b4b0f:     	movups	0x40(%r11), %xmm8
1454b4b14:     	movq	$0x0, 0x20(%r11)
1454b4b1c:     	movq	$0x0, 0x40(%r11)
1454b4b24:     	ucomiss	%xmm0, %xmm1
1454b4b27:     	ja	0x1454b4b2d <.text+0x54b3b2d>
1454b4b29:     	movaps	%xmm11, %xmm2
1454b4b2d:     	seta	0x28(%rsp)
1454b4b32:     	movb	%al, 0x20(%rsp)
1454b4b36:     	movb	$0x0, 0x30(%rsp)
1454b4b3b:     	movq	0x368(%rbp), %rsi
1454b4b42:     	movq	%rsi, %rcx
1454b4b45:     	movq	%r14, %rdx
1454b4b48:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b4b4d:     	nop
1454b4b4e:     	movb	%bl, 0x129(%rsi)
1454b4b54:     	movups	%xmm7, 0x20(%rsi)
1454b4b58:     	movups	%xmm8, 0x40(%rsi)

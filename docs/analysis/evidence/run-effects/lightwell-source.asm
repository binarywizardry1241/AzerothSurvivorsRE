
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b46a0:     	movl	0x40(%rax), %r9d
1454b46a4:     	movzbl	0x74(%rax), %eax
1454b46a8:     	movzbl	0x129(%r11), %ebx
1454b46b0:     	movb	$0x3, 0x129(%r11)
1454b46b8:     	movups	0x20(%r11), %xmm11
1454b46bd:     	movups	0x40(%r11), %xmm7
1454b46c2:     	movq	$0x0, 0x20(%r11)
1454b46ca:     	movq	$0x0, 0x40(%r11)
1454b46d2:     	ucomiss	%xmm0, %xmm1
1454b46d5:     	ja	0x1454b46db <.text+0x54b36db>
1454b46d7:     	movaps	%xmm15, %xmm2
1454b46db:     	seta	0x28(%rsp)
1454b46e0:     	movb	%al, 0x20(%rsp)
1454b46e4:     	movb	$0x0, 0x30(%rsp)
1454b46e9:     	movq	0x368(%rbp), %rsi
1454b46f0:     	movq	%rsi, %rcx
1454b46f3:     	movq	%r13, %rdx
1454b46f6:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b46fb:     	nop
1454b46fc:     	movq	%r14, 0x340(%rbp)
1454b4703:     	movb	%bl, 0x129(%rsi)
1454b4709:     	movups	%xmm11, 0x20(%rsi)
1454b470e:     	movups	%xmm7, 0x40(%rsi)


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454bf1e0:     	bsrq	%r9, %rcx
1454bf1e4:     	notl	%ecx
1454bf1e6:     	movq	%r9, %r8
1454bf1e9:     	shlq	%cl, %r8
1454bf1ec:     	decq	%r8
1454bf1ef:     	movq	0x880(%rsi), %r11
1454bf1f6:     	movq	0x888(%rsi), %rcx
1454bf1fd:     	movq	0x898(%rsi), %rbx
1454bf204:     	movq	0x890(%rsi), %r10
1454bf20b:     	nopl	(%rax,%rax)
1454bf210:     	leaq	(%r11,%rbx), %rax
1454bf214:     	rolq	$0x17, %rax
1454bf218:     	addq	%r11, %rax
1454bf21b:     	movq	%rcx, %r14
1454bf21e:     	shlq	$0x11, %r14
1454bf222:     	xorq	%r11, %r10
1454bf225:     	xorq	%rcx, %rbx
1454bf228:     	xorq	%rbx, %r11
1454bf22b:     	rolq	$0x2d, %rbx
1454bf22f:     	xorq	%r10, %rcx
1454bf232:     	mulq	%r9
1454bf235:     	xorq	%r14, %r10
1454bf238:     	cmpq	%rax, %r8
1454bf23b:     	jb	0x1454bf210 <.text+0x54be210>
1454bf23d:     	movq	%r11, 0x880(%rsi)
1454bf244:     	movq	%rbx, 0x898(%rsi)
1454bf24b:     	movq	%rcx, 0x888(%rsi)
1454bf252:     	movq	%r10, 0x890(%rsi)

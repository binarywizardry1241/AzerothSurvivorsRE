
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c2219:     	imulq	$0xf0, %rax, %rax
1454c2220:     	leaq	0x1254211(%rip), %rbx   # 0x146716438
1454c2227:     	movq	0x80(%rax,%rbx), %rdx
1454c222f:     	leaq	-0x1(%rdx), %rcx
1454c2233:     	cmpq	%r14, %rcx
1454c2236:     	cmovbq	%rcx, %r14
1454c223a:     	cmpq	%rdx, %r14
1454c223d:     	jae	0x1454c292b <.text+0x54c192b>
1454c2243:     	addq	%rax, %rbx
1454c2246:     	leaq	(%r14,%r14,4), %r15
1454c224a:     	shlq	$0x4, %r15
1454c224e:     	addq	0x78(%rbx), %r15

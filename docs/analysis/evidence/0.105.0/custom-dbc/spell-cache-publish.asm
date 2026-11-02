
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145d4d231:     	subq	$0x58, %rsp
145d4d235:     	movl	0x22b73fd(%rip), %eax   # 0x148004638
145d4d23b:     	testl	%eax, %eax
145d4d23d:     	jne	0x145d4d244 <.text+0x5d4c244>
145d4d23f:     	addq	$0x58, %rsp
145d4d243:     	retq
145d4d244:     	leaq	0x40(%rsp), %rax
145d4d249:     	movq	%rcx, (%rax)
145d4d24c:     	leaq	0x22b73b5(%rip), %rcx   # 0x148004608
145d4d253:     	movq	%rcx, 0x8(%rax)
145d4d257:     	leaq	0x37(%rsp), %rcx
145d4d25c:     	movq	%rcx, 0x10(%rax)
145d4d260:     	leaq	0x38(%rsp), %r8
145d4d265:     	movq	%rax, (%r8)
145d4d268:     	leaq	0xe6c289(%rip), %rax    # 0x146bb94f8
145d4d26f:     	movq	%rax, 0x20(%rsp)
145d4d274:     	leaq	0x22b73bd(%rip), %rcx   # 0x148004638
145d4d27b:     	leaq	0xe6c306(%rip), %r9     # 0x146bb9588
145d4d282:     	movb	$0x1, %dl
145d4d284:     	callq	0x145d67f70 <.text+0x5d66f70>
145d4d289:     	jmp	0x145d4d23f <.text+0x5d4c23f>

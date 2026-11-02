
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145d4d1d7:     	subq	$0x58, %rsp
145d4d1db:     	movl	0x22b741f(%rip), %eax   # 0x148004600
145d4d1e1:     	testl	%eax, %eax
145d4d1e3:     	jne	0x145d4d1ea <.text+0x5d4c1ea>
145d4d1e5:     	addq	$0x58, %rsp
145d4d1e9:     	retq
145d4d1ea:     	leaq	0x40(%rsp), %rax
145d4d1ef:     	movq	%rcx, (%rax)
145d4d1f2:     	leaq	0x22b73d7(%rip), %rcx   # 0x1480045d0
145d4d1f9:     	movq	%rcx, 0x8(%rax)
145d4d1fd:     	leaq	0x37(%rsp), %rcx
145d4d202:     	movq	%rcx, 0x10(%rax)
145d4d206:     	leaq	0x38(%rsp), %r8
145d4d20b:     	movq	%rax, (%r8)
145d4d20e:     	leaq	0xe6c2e3(%rip), %rax    # 0x146bb94f8
145d4d215:     	movq	%rax, 0x20(%rsp)
145d4d21a:     	leaq	0x22b73df(%rip), %rcx   # 0x148004600
145d4d221:     	leaq	0xe6c338(%rip), %r9     # 0x146bb9560
145d4d228:     	movb	$0x1, %dl
145d4d22a:     	callq	0x145d67f70 <.text+0x5d66f70>
145d4d22f:     	jmp	0x145d4d1e5 <.text+0x5d4c1e5>

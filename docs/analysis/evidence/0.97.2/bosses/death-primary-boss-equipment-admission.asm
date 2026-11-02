
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c47cb:     	cmpb	$0x0, 0x958(%rsi)
1454c47d2:     	jne	0x1454c4ab3 <.text+0x54c3ab3>
1454c47d8:     	movq	0x210(%rsi), %rcx
1454c47df:     	movq	0x218(%rsi), %rdx
1454c47e6:     	callq	0x14540e820 <.text+0x540d820>
1454c47eb:     	imulq	$0xf0, %rax, %rcx
1454c47f2:     	leaq	0x1251c3f(%rip), %rax   # 0x146716438
1454c47f9:     	movq	0x88(%rcx,%rax), %rdx
1454c4801:     	movq	0x150(%rbp), %r9
1454c4808:     	cmpq	%r9, %rdx
1454c480b:     	je	0x1454c48c1 <.text+0x54c38c1>
1454c4811:     	leaq	0x58(%rdx), %r8
1454c4815:     	cmpq	%r9, %r8
1454c4818:     	je	0x1454c48c6 <.text+0x54c38c6>
1454c481e:     	leaq	0xb0(%rdx), %r8
1454c4825:     	cmpq	%r9, %r8
1454c4828:     	je	0x1454c48ce <.text+0x54c38ce>
1454c482e:     	leaq	0x108(%rdx), %r8
1454c4835:     	cmpq	%r9, %r8
1454c4838:     	je	0x1454c4922 <.text+0x54c3922>
1454c483e:     	addq	$0x160, %rdx            # imm = 0x160
1454c4845:     	cmpq	%r9, %rdx
1454c4848:     	jne	0x1454c4ab3 <.text+0x54c3ab3>
1454c484e:     	movl	$0x4, %r14d
1454c4854:     	jmp	0x1454c4928 <.text+0x54c3928>

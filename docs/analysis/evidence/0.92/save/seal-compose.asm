
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545718b:     	leaq	0x38(%rbp), %rdi
14545718f:     	movq	%rdi, %rcx
145457192:     	movq	%r14, 0x30(%rbp)
145457196:     	movq	%r14, %rdx
145457199:     	movq	%rsi, %r8
14545719c:     	callq	0x1454560a0 <.text+0x54550a0>
1454571a1:     	nop
1454571a2:     	leaq	0x145bda9(%rip), %rax   # 0x1468b2f52
1454571a9:     	movq	%rax, -0x18(%rbp)
1454571ad:     	movq	$0x3, -0x10(%rbp)
1454571b5:     	movq	%rdi, -0x8(%rbp)
1454571b9:     	movq	$0x10, (%rbp)
1454571c1:     	movq	0x30(%rbp), %rax
1454571c5:     	movq	%rax, 0x8(%rbp)
1454571c9:     	movq	0x18(%rbp), %rax
1454571cd:     	movq	%rax, 0x10(%rbp)
1454571d1:     	leaq	-0x54(%rbp), %rcx
1454571d5:     	leaq	-0x18(%rbp), %rdx
1454571d9:     	callq	0x145456320 <.text+0x5455320>
1454571de:     	nop
1454571df:     	movq	0x18(%rbp), %rsi
1454571e3:     	movq	%rsi, %rbx
1454571e6:     	addq	$0x24, %rbx
1454571ea:     	jns	0x1454571ff <.text+0x54561ff>
1454571ec:     	xorl	%edi, %edi
1454571ee:     	movq	%rdi, %rcx
1454571f1:     	movq	%rbx, %rdx
1454571f4:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1454571f9:     	nop
1454571fa:     	jmp	0x145457aff <.text+0x5456aff>
1454571ff:     	callq	0x140002200 <.text+0x1200>
145457204:     	movl	$0x1, %edi
145457209:     	movl	$0x1, %edx
14545720e:     	movq	%rbx, %rcx
145457211:     	callq	0x1400021c0 <.text+0x11c0>
145457216:     	testq	%rax, %rax
145457219:     	je	0x1454571ee <.text+0x54561ee>
14545721b:     	movq	%rax, %r14
14545721e:     	movups	0x38(%rbp), %xmm0
145457222:     	movups	%xmm0, (%rax)
145457225:     	testq	%rsi, %rsi
145457228:     	movq	0x30(%rbp), %rdx
14545722c:     	je	0x14545723d <.text+0x545623d>
14545722e:     	movq	%r14, %rcx
145457231:     	addq	$0x10, %rcx
145457235:     	movq	%rsi, %r8
145457238:     	callq	0x1457149fd <.text+0x57139fd>
14545723d:     	movl	-0x44(%rbp), %eax
145457240:     	movl	%eax, 0x20(%r14,%rsi)
145457245:     	movups	-0x54(%rbp), %xmm0
145457249:     	movups	%xmm0, 0x10(%r14,%rsi)
14545724f:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
145457259:     	movq	%rbx, %rax
14545725c:     	mulq	%rcx
14545725f:     	addq	%rdx, %rdx
145457262:     	andq	$-0x4, %rdx
145457266:     	leaq	0x4(%rdx), %r15
14545726a:     	movabsq	$0x5555555555555556, %rcx # imm = 0x5555555555555556
145457274:     	cmpq	%rcx, %rax
145457277:     	cmovbq	%rdx, %r15

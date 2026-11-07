
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140335608:     	movq	%rdx, %rcx
14033560b:     	movq	%r8, %rbx
14033560e:     	movq	%rdx, %r14
140335611:     	callq	0x14035a210 <.text+0x359210>
140335616:     	movq	%rdx, %rdi
140335619:     	leaq	-0x10(%rbp), %rcx
14033561d:     	movq	%r14, %rdx
140335620:     	callq	0x14027fa40 <.text+0x27ea40>
140335625:     	movq	$0x1, -0x28(%rbp)
14033562d:     	movq	%rdi, -0x20(%rbp)
140335631:     	movb	$0x1, -0x18(%rbp)
140335635:     	movq	0x48(%rbp), %rax
140335639:     	movq	%rax, 0xc0(%rbp)
140335640:     	movups	0x38(%rbp), %xmm0
140335644:     	movaps	%xmm0, 0xb0(%rbp)
14033564b:     	movups	-0x8(%rbp), %xmm0
14033564f:     	movups	0x8(%rbp), %xmm1
140335653:     	movdqu	0x18(%rbp), %xmm2
140335658:     	movdqu	0x28(%rbp), %xmm3
14033565d:     	movdqa	%xmm3, 0xa0(%rbp)
140335665:     	movdqa	%xmm2, 0x90(%rbp)
14033566d:     	movaps	%xmm1, 0x80(%rbp)
140335674:     	movaps	%xmm0, 0x70(%rbp)
140335678:     	movzbl	-0x18(%rbp), %eax
14033567c:     	movb	%al, 0x60(%rbp)
14033567f:     	movq	-0x17(%rbp), %rax
140335683:     	movq	%rax, 0x61(%rbp)
140335687:     	movl	-0xf(%rbp), %eax
14033568a:     	movl	%eax, 0x69(%rbp)
14033568d:     	movzwl	-0xb(%rbp), %eax
140335691:     	movw	%ax, 0x6d(%rbp)
140335695:     	movzbl	-0x9(%rbp), %eax
140335699:     	movb	%al, 0x6f(%rbp)
14033569c:     	movups	-0x28(%rbp), %xmm0
1403356a0:     	movaps	%xmm0, 0x50(%rbp)
1403356a4:     	leaq	-0x40(%rbp), %r15
1403356a8:     	leaq	0x50(%rbp), %rdx
1403356ac:     	movq	%r15, %rcx
1403356af:     	callq	0x140258250 <.text+0x257250>
1403356b4:     	movq	0x10(%rsi), %rdi
1403356b8:     	movq	0x18(%r14), %rax
1403356bc:     	movq	%rdi, 0x30(%rsp)
1403356c1:     	movq	%r15, 0x28(%rsp)
1403356c6:     	movq	%rax, 0x20(%rsp)
1403356cb:     	leaq	0x5a8fc85(%rip), %rdx   # 0x145dc5357
1403356d2:     	leaq	0x50(%rbp), %rcx
1403356d6:     	movl	$0xc8, %r8d
1403356dc:     	movq	%rbx, %r9
1403356df:     	callq	0x144e6e850 <.text+0x4e6d850>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140336238:     	movq	%rdx, %rcx
14033623b:     	movq	%r8, %rbx
14033623e:     	movq	%rdx, %r14
140336241:     	callq	0x14035a210 <.text+0x359210>
140336246:     	movq	%rdx, %rdi
140336249:     	leaq	-0x18(%rbp), %rcx
14033624d:     	movq	%r14, %rdx
140336250:     	callq	0x1402803e0 <.text+0x27f3e0>
140336255:     	movq	$0x1, -0x30(%rbp)
14033625d:     	movq	%rdi, -0x28(%rbp)
140336261:     	movb	$0x1, -0x20(%rbp)
140336265:     	movups	-0x10(%rbp), %xmm0
140336269:     	movups	(%rbp), %xmm1
14033626d:     	movaps	%xmm1, 0x40(%rbp)
140336271:     	movaps	%xmm0, 0x30(%rbp)
140336275:     	movzbl	-0x20(%rbp), %eax
140336279:     	movb	%al, 0x20(%rbp)
14033627c:     	movq	-0x1f(%rbp), %rax
140336280:     	movq	%rax, 0x21(%rbp)
140336284:     	movl	-0x17(%rbp), %eax
140336287:     	movl	%eax, 0x29(%rbp)
14033628a:     	movzwl	-0x13(%rbp), %eax
14033628e:     	movw	%ax, 0x2d(%rbp)
140336292:     	movzbl	-0x11(%rbp), %eax
140336296:     	movb	%al, 0x2f(%rbp)
140336299:     	movq	-0x30(%rbp), %rax
14033629d:     	movq	%rax, 0x10(%rbp)
1403362a1:     	movq	-0x28(%rbp), %rax
1403362a5:     	movq	%rax, 0x18(%rbp)
1403362a9:     	leaq	-0x48(%rbp), %r15
1403362ad:     	leaq	0x10(%rbp), %rdx
1403362b1:     	movq	%r15, %rcx
1403362b4:     	callq	0x140257d70 <.text+0x256d70>
1403362b9:     	movq	0x10(%rsi), %rdi
1403362bd:     	movq	0x18(%r14), %rax
1403362c1:     	movq	%rdi, 0x30(%rsp)
1403362c6:     	movq	%r15, 0x28(%rsp)
1403362cb:     	movq	%rax, 0x20(%rsp)
1403362d0:     	leaq	0x5a8f428(%rip), %rdx   # 0x145dc56ff
1403362d7:     	leaq	0x10(%rbp), %rcx
1403362db:     	movl	$0x63, %r8d
1403362e1:     	movq	%rbx, %r9
1403362e4:     	callq	0x144e6e850 <.text+0x4e6d850>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403371c8:     	movq	%rdx, %rcx
1403371cb:     	movq	%r8, %rbx
1403371ce:     	movq	%rdx, %r14
1403371d1:     	callq	0x14035a210 <.text+0x359210>
1403371d6:     	movq	%rdx, %rdi
1403371d9:     	leaq	-0x10(%rbp), %rcx
1403371dd:     	movq	%r14, %rdx
1403371e0:     	callq	0x1402812c0 <.text+0x2802c0>
1403371e5:     	movq	$0x1, -0x28(%rbp)
1403371ed:     	movq	%rdi, -0x20(%rbp)
1403371f1:     	movb	$0x1, -0x18(%rbp)
1403371f5:     	movq	0x48(%rbp), %rax
1403371f9:     	movq	%rax, 0xc0(%rbp)
140337200:     	movups	0x38(%rbp), %xmm0
140337204:     	movaps	%xmm0, 0xb0(%rbp)
14033720b:     	movups	-0x8(%rbp), %xmm0
14033720f:     	movups	0x8(%rbp), %xmm1
140337213:     	movdqu	0x18(%rbp), %xmm2
140337218:     	movdqu	0x28(%rbp), %xmm3
14033721d:     	movdqa	%xmm3, 0xa0(%rbp)
140337225:     	movdqa	%xmm2, 0x90(%rbp)
14033722d:     	movaps	%xmm1, 0x80(%rbp)
140337234:     	movaps	%xmm0, 0x70(%rbp)
140337238:     	movzbl	-0x18(%rbp), %eax
14033723c:     	movb	%al, 0x60(%rbp)
14033723f:     	movq	-0x17(%rbp), %rax
140337243:     	movq	%rax, 0x61(%rbp)
140337247:     	movl	-0xf(%rbp), %eax
14033724a:     	movl	%eax, 0x69(%rbp)
14033724d:     	movzwl	-0xb(%rbp), %eax
140337251:     	movw	%ax, 0x6d(%rbp)
140337255:     	movzbl	-0x9(%rbp), %eax
140337259:     	movb	%al, 0x6f(%rbp)
14033725c:     	movups	-0x28(%rbp), %xmm0
140337260:     	movaps	%xmm0, 0x50(%rbp)
140337264:     	leaq	-0x40(%rbp), %r15
140337268:     	leaq	0x50(%rbp), %rdx
14033726c:     	movq	%r15, %rcx
14033726f:     	callq	0x140258250 <.text+0x257250>
140337274:     	movq	0x10(%rsi), %rdi
140337278:     	movq	0x18(%r14), %rax
14033727c:     	movq	%rdi, 0x30(%rsp)
140337281:     	movq	%r15, 0x28(%rsp)
140337286:     	movq	%rax, 0x20(%rsp)
14033728b:     	leaq	0x5a8e80b(%rip), %rdx   # 0x145dc5a9d
140337292:     	leaq	0x50(%rbp), %rcx
140337296:     	movl	$0xc5, %r8d
14033729c:     	movq	%rbx, %r9
14033729f:     	callq	0x144e6e850 <.text+0x4e6d850>

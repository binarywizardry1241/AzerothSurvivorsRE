
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cc206:     	movq	%rdi, 0x1f0(%rbp)
1454cc20d:     	movq	%r14, 0x180(%rbp)
1454cc214:     	movq	%rdx, 0x188(%rbp)
1454cc21b:     	movq	%r10, 0x190(%rbp)
1454cc222:     	movq	%rax, 0x198(%rbp)
1454cc229:     	movq	%r12, %rcx
1454cc22c:     	leaq	0x180(%rbp), %rdx
1454cc233:     	movq	0x178(%rbp), %r8
1454cc23a:     	callq	0x1454cb900 <.text+0x54ca900>
1454cc23f:     	nop
1454cc240:     	testb	%al, %al
1454cc242:     	je	0x1454cc2c8 <.text+0x54cb2c8>
1454cc248:     	movd	%ebx, %xmm0
1454cc24c:     	movq	0x8b8(%r12), %rax
1454cc254:     	movq	0x8a0(%r12), %rcx
1454cc25c:     	movq	0x8a8(%r12), %rdx
1454cc264:     	leaq	(%rax,%rcx), %r8
1454cc268:     	rolq	$0x17, %r8
1454cc26c:     	addq	%rcx, %r8
1454cc26f:     	movq	%rdx, %r9
1454cc272:     	shlq	$0x11, %r9
1454cc276:     	movq	0x8b0(%r12), %r10
1454cc27e:     	xorq	%rcx, %r10
1454cc281:     	xorq	%rdx, %rax
1454cc284:     	xorq	%r10, %rdx
1454cc287:     	movq	%rdx, 0x8a8(%r12)
1454cc28f:     	xorq	%rax, %rcx
1454cc292:     	movq	%rcx, 0x8a0(%r12)
1454cc29a:     	xorq	%r9, %r10
1454cc29d:     	movq	%r10, 0x8b0(%r12)
1454cc2a5:     	rolq	$0x2d, %rax
1454cc2a9:     	shrq	$0x28, %r8
1454cc2ad:     	cvtsi2ss	%r8d, %xmm1
1454cc2b2:     	movq	%rax, 0x8b8(%r12)
1454cc2ba:     	mulss	%xmm14, %xmm1
1454cc2bf:     	ucomiss	%xmm0, %xmm1
1454cc2c2:     	jb	0x1454ce0b4 <.text+0x54cd0b4>
1454cc2c8:     	movq	0x1f0(%rbp), %rcx
1454cc2cf:     	jmp	0x1454cbc6b <.text+0x54cac6b>

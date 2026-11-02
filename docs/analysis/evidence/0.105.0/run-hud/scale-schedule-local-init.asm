
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140059170:     	movq	%rcx, %rax
140059173:     	movl	$0x3dcc5000, %ecx       # imm = 0x3DCC5000
140059178:     	addl	0x5b0(%r8), %ecx
14005917f:     	movl	%ecx, (%rdx)
140059181:     	movb	$0x0, 0x8(%rdx)
140059185:     	movq	$0x10, 0x18(%rax)
14005918d:     	xorps	%xmm0, %xmm0
140059190:     	movups	%xmm0, 0x20(%rax)
140059194:     	movq	$0x10, 0x30(%rax)
14005919c:     	movups	%xmm0, 0x38(%rax)
1400591a0:     	movq	$0x10, 0x48(%rax)
1400591a8:     	movups	%xmm0, 0x50(%rax)
1400591ac:     	movq	$0x10, 0x60(%rax)
1400591b4:     	movups	%xmm0, 0x68(%rax)
1400591b8:     	movq	$0x10, 0x78(%rax)
1400591c0:     	movq	$0x0, (%rax)
1400591c7:     	movups	%xmm0, 0x80(%rax)
1400591ce:     	movl	$0x0, 0x90(%rax)
1400591d8:     	movq	$0x8, 0x8(%rax)
1400591e0:     	movq	$0x0, 0x10(%rax)
1400591e8:     	retq

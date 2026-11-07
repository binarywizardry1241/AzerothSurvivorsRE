
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140336e98:     	movq	%rdx, %rcx
140336e9b:     	movq	%r8, %rbx
140336e9e:     	movq	%rdx, %r14
140336ea1:     	callq	0x14035a210 <.text+0x359210>
140336ea6:     	movq	%rdx, %rdi
140336ea9:     	leaq	-0x18(%rbp), %rcx
140336ead:     	movq	%r14, %rdx
140336eb0:     	callq	0x14028e1f0 <.text+0x28d1f0>
140336eb5:     	movq	$0x1, -0x30(%rbp)
140336ebd:     	movq	%rdi, -0x28(%rbp)
140336ec1:     	movb	$0x1, -0x20(%rbp)
140336ec5:     	movups	0x30(%rbp), %xmm0
140336ec9:     	movaps	%xmm0, 0xa0(%rbp)
140336ed0:     	movups	-0x10(%rbp), %xmm0
140336ed4:     	movups	(%rbp), %xmm1
140336ed8:     	movdqu	0x10(%rbp), %xmm2
140336edd:     	movdqu	0x20(%rbp), %xmm3
140336ee2:     	movdqa	%xmm3, 0x90(%rbp)
140336eea:     	movdqa	%xmm2, 0x80(%rbp)
140336ef2:     	movaps	%xmm1, 0x70(%rbp)
140336ef6:     	movaps	%xmm0, 0x60(%rbp)
140336efa:     	movzbl	-0x20(%rbp), %eax
140336efe:     	movb	%al, 0x50(%rbp)
140336f01:     	movq	-0x1f(%rbp), %rax
140336f05:     	movq	%rax, 0x51(%rbp)
140336f09:     	movl	-0x17(%rbp), %eax
140336f0c:     	movl	%eax, 0x59(%rbp)
140336f0f:     	movzwl	-0x13(%rbp), %eax
140336f13:     	movw	%ax, 0x5d(%rbp)
140336f17:     	movzbl	-0x11(%rbp), %eax
140336f1b:     	movb	%al, 0x5f(%rbp)
140336f1e:     	movups	-0x30(%rbp), %xmm0
140336f22:     	movaps	%xmm0, 0x40(%rbp)
140336f26:     	leaq	-0x48(%rbp), %r15
140336f2a:     	leaq	0x40(%rbp), %rdx
140336f2e:     	movq	%r15, %rcx
140336f31:     	callq	0x14025a740 <.text+0x259740>
140336f36:     	movq	0x10(%rsi), %rdi
140336f3a:     	movq	0x18(%r14), %rax
140336f3e:     	movq	%rdi, 0x30(%rsp)
140336f43:     	movq	%r15, 0x28(%rsp)
140336f48:     	movq	%rax, 0x20(%rsp)
140336f4d:     	leaq	0x5a8ea81(%rip), %rdx   # 0x145dc59d5
140336f54:     	leaq	0x40(%rbp), %rcx
140336f58:     	movl	$0xc8, %r8d
140336f5e:     	movq	%rbx, %r9
140336f61:     	callq	0x144e6e850 <.text+0x4e6d850>

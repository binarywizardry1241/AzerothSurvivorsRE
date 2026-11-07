
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
142645c7e:     	leaq	0xb8(%rdi), %rdx
142645c85:     	leaq	0x8(%rbp), %rcx
142645c89:     	callq	0x1425b89d0 <.text+0x25b79d0>
142645c8e:     	nop
142645c8f:     	callq	0x140002200 <.text+0x1200>
142645c94:     	movl	$0x58, %ecx
142645c99:     	movl	$0x8, %edx
142645c9e:     	callq	0x1400021c0 <.text+0x11c0>
142645ca3:     	testq	%rax, %rax
142645ca6:     	je	0x14264651f <.text+0x264551f>
142645cac:     	movq	0x58(%rbp), %rcx
142645cb0:     	movq	%rcx, 0x50(%rax)
142645cb4:     	movups	0x48(%rbp), %xmm0
142645cb8:     	movups	%xmm0, 0x40(%rax)
142645cbc:     	movups	0x8(%rbp), %xmm0
142645cc0:     	movups	0x18(%rbp), %xmm1
142645cc4:     	movups	0x28(%rbp), %xmm2
142645cc8:     	movups	0x38(%rbp), %xmm3
142645ccc:     	movups	%xmm3, 0x30(%rax)
142645cd0:     	movups	%xmm2, 0x20(%rax)
142645cd4:     	movups	%xmm1, 0x10(%rax)
142645cd8:     	movups	%xmm0, (%rax)
142645cdb:     	leaq	0x3bff79e(%rip), %r13   # 0x146245480
142645ce2:     	movq	%r13, 0x20(%rsp)
142645ce7:     	leaq	0x3c0e090(%rip), %rdx   # 0x146253d7e
142645cee:     	leaq	-0x50(%rbp), %rcx
142645cf2:     	movl	$0x6, %r8d
142645cf8:     	movq	%rax, %r9
142645cfb:     	callq	0x14260c0c0 <.text+0x260b0c0>
142645d00:     	nop

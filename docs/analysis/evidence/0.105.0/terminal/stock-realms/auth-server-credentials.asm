
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145963e3e:     	movq	%rdi, -0x58(%rbp)
145963e42:     	movq	%rsi, 0x60(%rbp)
145963e46:     	movq	%rsi, -0x50(%rbp)
145963e4a:     	movq	%rdi, 0x38(%rbp)
145963e4e:     	movq	%rdi, -0x48(%rbp)
145963e52:     	movq	0x210(%rbp), %rdx
145963e59:     	testq	%rdx, %rdx
145963e5c:     	jle	0x145963e6d <.text+0x5962e6d>
145963e5e:     	movl	$0x1, %r8d
145963e64:     	movq	%rbx, %rcx
145963e67:     	callq	0x1400021d0 <.text+0x11d0>
145963e6c:     	nop
145963e6d:     	leaq	0x150(%rbp), %rcx
145963e74:     	leaq	-0x58(%rbp), %rdx
145963e78:     	callq	0x1458de850 <.text+0x58dd850>
145963e7d:     	nop
145963e7e:     	cmpq	$-0x1, 0x150(%rbp)
145963e86:     	je	0x145963e9f <.text+0x5962e9f>
145963e88:     	movq	0x160(%rbp), %rax
145963e8f:     	movq	%rax, 0x80(%rbp)
145963e96:     	movups	0x150(%rbp), %xmm0
145963e9d:     	jmp	0x145963ed8 <.text+0x5962ed8>
145963e9f:     	movl	$0x1, %r8d
145963ea5:     	movq	%r14, %rcx
145963ea8:     	leaq	0x1517de2(%rip), %rdx   # 0x146e7bc91
145963eaf:     	callq	0x140f5c210 <.text+0xf5b210>
145963eb4:     	nop
145963eb5:     	cmpq	$-0x1, 0x210(%rbp)
145963ebd:     	je	0x145964b8f <.text+0x5963b8f>
145963ec3:     	movq	0x220(%rbp), %rax
145963eca:     	movq	%rax, 0x80(%rbp)
145963ed1:     	movups	0x210(%rbp), %xmm0
145963ed8:     	movaps	%xmm0, 0x70(%rbp)
145963edc:     	leaq	0x150(%rbp), %rcx
145963ee3:     	movq	0x8(%rbp), %rdx
145963ee7:     	callq	0x1458de850 <.text+0x58dd850>
145963eec:     	nop
145963eed:     	cmpq	$-0x1, 0x150(%rbp)
145963ef5:     	je	0x145963f0e <.text+0x5962f0e>
145963ef7:     	movq	0x160(%rbp), %rax
145963efe:     	movq	%rax, 0x140(%rbp)
145963f05:     	movups	0x150(%rbp), %xmm0
145963f0c:     	jmp	0x145963f47 <.text+0x5962f47>
145963f0e:     	movl	$0x1, %r8d
145963f14:     	movq	%r14, %rcx
145963f17:     	leaq	0x1517d73(%rip), %rdx   # 0x146e7bc91
145963f1e:     	callq	0x140f5c210 <.text+0xf5b210>
145963f23:     	nop
145963f24:     	cmpq	$-0x1, 0x210(%rbp)
145963f2c:     	je	0x145964bc9 <.text+0x5963bc9>
145963f32:     	movq	0x220(%rbp), %rax
145963f39:     	movq	%rax, 0x140(%rbp)
145963f40:     	movups	0x210(%rbp), %xmm0
145963f47:     	movaps	%xmm0, 0x130(%rbp)


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
144c6f020:     	pushq	%rsi
144c6f021:     	subq	$0x90, %rsp
144c6f028:     	movaps	%xmm11, 0x80(%rsp)
144c6f031:     	movaps	%xmm10, 0x70(%rsp)
144c6f037:     	movaps	%xmm9, 0x60(%rsp)
144c6f03d:     	movaps	%xmm8, 0x50(%rsp)
144c6f043:     	movaps	%xmm7, 0x40(%rsp)
144c6f048:     	movaps	%xmm6, 0x30(%rsp)
144c6f04d:     	movq	%rcx, %rsi
144c6f050:     	movl	(%rdx), %ecx
144c6f052:     	leaq	0x4(%rdx), %rax
144c6f056:     	leaq	0x1e4fe7b(%rip), %r8    # 0x146abeed8
144c6f05d:     	movslq	(%r8,%rcx,4), %rcx
144c6f061:     	addq	%r8, %rcx
144c6f064:     	jmpq	*%rcx
144c6f066:     	movups	(%rax), %xmm0
144c6f069:     	movups	%xmm0, (%rsi)
144c6f06c:     	jmp	0x144c6f74b <.text+0x4c6e74b>

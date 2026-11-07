
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14000ff8b:     	cmpq	$-0x1, 0x48(%rdi)
14000ff90:     	je	0x14000ffd3 <.text+0xefd3>
14000ff92:     	movq	0x50(%rdi), %rdx
14000ff96:     	movq	0x58(%rdi), %r8
14000ff9a:     	leaq	-0x38(%rbp), %rcx
14000ff9e:     	callq	0x1458912a0 <.text+0x58902a0>
14000ffa3:     	nop
14000ffa4:     	cmpq	$-0x1, -0x38(%rbp)
14000ffa9:     	je	0x14000ffd3 <.text+0xefd3>
14000ffab:     	movq	-0x20(%rbp), %rdx
14000ffaf:     	testq	%rdx, %rdx
14000ffb2:     	je	0x14000ffc3 <.text+0xefc3>
14000ffb4:     	movq	-0x18(%rbp), %rcx
14000ffb8:     	movl	$0x1, %r8d
14000ffbe:     	callq	0x1400021d0 <.text+0x11d0>
14000ffc3:     	movq	-0x28(%rbp), %rax
14000ffc7:     	movq	%rax, -0x10(%rbp)
14000ffcb:     	movups	-0x38(%rbp), %xmm0
14000ffcf:     	movaps	%xmm0, -0x20(%rbp)
14000ffd3:     	movzbl	0x60(%rdi), %eax
14000ffd7:     	movb	%al, 0x12(%rbp)
14000ffda:     	testq	%r14, %r14
14000ffdd:     	cmovneq	%r14, %r15
14000ffe1:     	cmoveq	%r14, %rbx
14000ffe5:     	movq	%r15, %rcx
14000ffe8:     	movq	%rbx, %rdx
14000ffeb:     	callq	0x1458b8140 <.text+0x58b7140>
14000fff0:     	nop
14000fff1:     	movq	%rdx, %r8
14000fff4:     	movq	-0x18(%rbp), %r9
14000fff8:     	movq	-0x10(%rbp), %rcx
14000fffc:     	movq	%rcx, 0x20(%rsp)
140010001:     	leaq	-0x50(%rbp), %rcx
140010005:     	movq	%rax, %rdx
140010008:     	callq	0x145878d40 <.text+0x5877d40>
14001000d:     	nop
14001000e:     	movq	0x10(%rbp), %rax
140010012:     	movq	%rax, 0x48(%rsi)
140010016:     	movaps	-0x20(%rbp), %xmm0
14001001a:     	movaps	-0x10(%rbp), %xmm1
14001001e:     	movaps	(%rbp), %xmm2
140010022:     	movups	%xmm2, 0x38(%rsi)
140010026:     	movups	%xmm1, 0x28(%rsi)
14001002a:     	movups	%xmm0, 0x18(%rsi)
14001002e:     	movups	-0x50(%rbp), %xmm0
140010032:     	movups	%xmm0, (%rsi)
140010035:     	movq	-0x40(%rbp), %rax
140010039:     	movq	%rax, 0x10(%rsi)
14001003d:     	jmp	0x140010063 <.text+0xf063>

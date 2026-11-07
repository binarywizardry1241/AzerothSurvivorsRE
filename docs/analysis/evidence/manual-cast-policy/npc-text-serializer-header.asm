
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545e340:     	pushq	%rbp
14545e341:     	pushq	%r15
14545e343:     	pushq	%r14
14545e345:     	pushq	%r13
14545e347:     	pushq	%r12
14545e349:     	pushq	%rsi
14545e34a:     	pushq	%rdi
14545e34b:     	pushq	%rbx
14545e34c:     	subq	$0xd8, %rsp
14545e353:     	leaq	0x80(%rsp), %rbp
14545e35b:     	movq	$-0x2, 0x50(%rbp)
14545e363:     	movq	%r9, %rdi
14545e366:     	movq	%r8, %rbx
14545e369:     	movl	%edx, %r14d
14545e36c:     	movq	%rcx, %rsi
14545e36f:     	callq	0x140002200 <.text+0x1200>
14545e374:     	movl	$0x20, %ecx
14545e379:     	movl	$0x1, %edx
14545e37e:     	callq	0x1400021c0 <.text+0x11c0>
14545e383:     	testq	%rax, %rax
14545e386:     	je	0x14545ed56 <.text+0x545dd56>
14545e38c:     	movl	%r14d, (%rax)
14545e38f:     	movq	$0x20, 0x10(%rbp)
14545e397:     	movq	%rax, 0x18(%rbp)
14545e39b:     	movw	$0x180, 0x28(%rbp)      # imm = 0x180
14545e3a1:     	movl	$0x3f800000, 0x4(%rax)  # imm = 0x3F800000
14545e3a8:     	movq	$0x8, 0x20(%rbp)

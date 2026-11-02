
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545ff20:     	pushq	%rbp
14545ff21:     	pushq	%r14
14545ff23:     	pushq	%rsi
14545ff24:     	pushq	%rdi
14545ff25:     	pushq	%rbx
14545ff26:     	subq	$0x80, %rsp
14545ff2d:     	leaq	0x80(%rsp), %rbp
14545ff35:     	movq	$-0x2, -0x8(%rbp)
14545ff3d:     	movl	%r9d, %edi
14545ff40:     	movq	%r8, %rbx
14545ff43:     	movq	%rdx, %r14
14545ff46:     	movq	%rcx, %rsi
14545ff49:     	callq	0x140002200 <.text+0x1200>
14545ff4e:     	movl	$0x20, %ecx
14545ff53:     	movl	$0x1, %edx
14545ff58:     	callq	0x1400021c0 <.text+0x11c0>
14545ff5d:     	testq	%rax, %rax
14545ff60:     	je	0x145460058 <.text+0x545f058>
14545ff66:     	movw	$0xdd, -0x10(%rbp)
14545ff6c:     	movq	$0x20, -0x28(%rbp)
14545ff74:     	movq	%rax, -0x20(%rbp)
14545ff78:     	movq	$0x0, -0x18(%rbp)
14545ff80:     	leaq	-0x28(%rbp), %rdx
14545ff84:     	movq	%r14, %rcx
14545ff87:     	callq	0x14551c6a0 <.text+0x551b6a0>
14545ff8c:     	nop
14545ff8d:     	movups	-0x28(%rbp), %xmm0
14545ff91:     	movups	-0x18(%rbp), %xmm1
14545ff95:     	movaps	%xmm1, -0x40(%rbp)
14545ff99:     	movaps	%xmm0, -0x50(%rbp)
14545ff9d:     	leaq	-0x28(%rbp), %rcx
14545ffa1:     	leaq	-0x50(%rbp), %rdx
14545ffa5:     	movq	%rbx, %r8
14545ffa8:     	callq	0x14550db10 <.text+0x550cb10>
14545ffad:     	movq	-0x28(%rbp), %rax
14545ffb1:     	movq	-0x18(%rbp), %rdx
14545ffb5:     	subq	%rdx, %rax
14545ffb8:     	cmpq	$0x3, %rax
14545ffbc:     	jbe	0x145460030 <.text+0x545f030>
14545ffbe:     	movq	-0x20(%rbp), %rax
14545ffc2:     	movl	%edi, (%rax,%rdx)
14545ffc5:     	addq	$0x4, %rdx
14545ffc9:     	movq	%rdx, -0x18(%rbp)
14545ffcd:     	movups	-0x28(%rbp), %xmm0
14545ffd1:     	movaps	%xmm0, -0x50(%rbp)
14545ffd5:     	movq	-0x18(%rbp), %rax
14545ffd9:     	movq	%rax, -0x40(%rbp)
14545ffdd:     	movq	-0x10(%rbp), %rax
14545ffe1:     	movq	%rax, -0x38(%rbp)
14545ffe5:     	movq	-0x40(%rbp), %rdi
14545ffe9:     	cmpq	-0x50(%rbp), %rdi
14545ffed:     	jne	0x14545fff9 <.text+0x545eff9>
14545ffef:     	leaq	-0x50(%rbp), %rcx
14545fff3:     	callq	0x145903690 <.text+0x5902690>
14545fff8:     	nop
14545fff9:     	movq	-0x48(%rbp), %rax
14545fffd:     	movb	$0x1, (%rax,%rdi)
145460001:     	incq	%rdi
145460004:     	movq	%rdi, -0x40(%rbp)
145460008:     	movaps	-0x50(%rbp), %xmm0
14546000c:     	movups	%xmm0, (%rsi)
14546000f:     	movq	-0x40(%rbp), %rax
145460013:     	movq	%rax, 0x10(%rsi)
145460017:     	movq	-0x38(%rbp), %rax
14546001b:     	movq	%rax, 0x18(%rsi)
14546001f:     	movq	%rsi, %rax
145460022:     	addq	$0x80, %rsp
145460029:     	popq	%rbx
14546002a:     	popq	%rdi
14546002b:     	popq	%rsi
14546002c:     	popq	%r14
14546002e:     	popq	%rbp
14546002f:     	retq

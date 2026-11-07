
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145997da0:     	pushq	%r15
145997da2:     	pushq	%r14
145997da4:     	pushq	%r12
145997da6:     	pushq	%rsi
145997da7:     	pushq	%rdi
145997da8:     	pushq	%rbx
145997da9:     	subq	$0xa8, %rsp
145997db0:     	movq	%r9, %rdi
145997db3:     	movq	%r8, %rbx
145997db6:     	movq	0x10(%rdx), %r14
145997dba:     	cmpq	%r14, %r8
145997dbd:     	jae	0x145997eca <.text+0x5996eca>
145997dc3:     	movq	%rdx, %r15
145997dc6:     	movq	%rcx, %rsi
145997dc9:     	movq	0x8(%rdx), %rax
145997dcd:     	movq	%rbx, %rcx
145997dd0:     	shlq	$0x7, %rcx
145997dd4:     	leaq	(%rcx,%rbx,8), %rdx
145997dd8:     	leaq	(%rax,%rdx), %rcx
145997ddc:     	movq	(%rax,%rdx), %r12
145997de0:     	movups	0x78(%rax,%rdx), %xmm0
145997de5:     	movaps	%xmm0, 0x90(%rsp)
145997ded:     	movups	0x68(%rax,%rdx), %xmm0
145997df2:     	movaps	%xmm0, 0x80(%rsp)
145997dfa:     	movups	0x58(%rax,%rdx), %xmm0
145997dff:     	movaps	%xmm0, 0x70(%rsp)
145997e04:     	movups	0x48(%rax,%rdx), %xmm0
145997e09:     	movaps	%xmm0, 0x60(%rsp)
145997e0e:     	movups	0x38(%rax,%rdx), %xmm0
145997e13:     	movaps	%xmm0, 0x50(%rsp)
145997e18:     	movups	0x28(%rax,%rdx), %xmm0
145997e1d:     	movaps	%xmm0, 0x40(%rsp)
145997e22:     	movups	0x18(%rax,%rdx), %xmm0
145997e27:     	movaps	%xmm0, 0x30(%rsp)
145997e2c:     	movups	0x8(%rax,%rdx), %xmm0
145997e31:     	movaps	%xmm0, 0x20(%rsp)
145997e36:     	addq	%rax, %rdx
145997e39:     	addq	$0x88, %rdx
145997e40:     	movq	%rbx, %rax
145997e43:     	notq	%rax
145997e46:     	addq	%r14, %rax
145997e49:     	movq	%rax, %r8
145997e4c:     	shlq	$0x7, %r8
145997e50:     	leaq	(%r8,%rax,8), %r8
145997e54:     	callq	0x145bc978d <.text+0x5bc878d>
145997e59:     	decq	%r14
145997e5c:     	movq	%r14, 0x10(%r15)
145997e60:     	testq	%r12, %r12
145997e63:     	je	0x145997eca <.text+0x5996eca>
145997e65:     	movq	%r12, (%rsi)
145997e68:     	movaps	0x20(%rsp), %xmm0
145997e6d:     	movaps	0x30(%rsp), %xmm1
145997e72:     	movaps	0x40(%rsp), %xmm2
145997e77:     	movaps	0x50(%rsp), %xmm3
145997e7c:     	movups	%xmm0, 0x8(%rsi)
145997e80:     	movups	%xmm1, 0x18(%rsi)
145997e84:     	movups	%xmm2, 0x28(%rsi)
145997e88:     	movups	%xmm3, 0x38(%rsi)
145997e8c:     	movaps	0x60(%rsp), %xmm0
145997e91:     	movups	%xmm0, 0x48(%rsi)
145997e95:     	movaps	0x70(%rsp), %xmm0
145997e9a:     	movups	%xmm0, 0x58(%rsi)
145997e9e:     	movaps	0x80(%rsp), %xmm0
145997ea6:     	movups	%xmm0, 0x68(%rsi)
145997eaa:     	movaps	0x90(%rsp), %xmm0
145997eb2:     	movups	%xmm0, 0x78(%rsi)
145997eb6:     	movq	%rsi, %rax
145997eb9:     	addq	$0xa8, %rsp
145997ec0:     	popq	%rbx
145997ec1:     	popq	%rdi
145997ec2:     	popq	%rsi
145997ec3:     	popq	%r12
145997ec5:     	popq	%r14
145997ec7:     	popq	%r15
145997ec9:     	retq
145997eca:     	movq	%rbx, %rcx
145997ecd:     	movq	%r14, %rdx
145997ed0:     	movq	%rdi, %r8
145997ed3:     	callq	0x145d6951b <.text+0x5d6851b>
145997ed8:     	ud2

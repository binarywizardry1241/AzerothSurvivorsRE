
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f6040:     	pushq	%rbp
1458f6041:     	pushq	%r14
1458f6043:     	pushq	%rsi
1458f6044:     	pushq	%rdi
1458f6045:     	pushq	%rbx
1458f6046:     	subq	$0x70, %rsp
1458f604a:     	leaq	0x70(%rsp), %rbp
1458f604f:     	movq	$-0x2, -0x8(%rbp)
1458f6057:     	movq	%rdx, %rdi
1458f605a:     	movq	%rcx, %rsi
1458f605d:     	leaq	-0x30(%rbp), %rcx
1458f6061:     	callq	0x1459721c0 <.text+0x59711c0>
1458f6066:     	movq	-0x30(%rbp), %rax
1458f606a:     	movq	-0x28(%rbp), %rcx
1458f606e:     	movq	-0x20(%rbp), %rdx
1458f6072:     	shlq	$0x5, %rdx
1458f6076:     	addq	%rcx, %rdx
1458f6079:     	movq	%rcx, -0x30(%rbp)
1458f607d:     	movq	%rcx, -0x28(%rbp)
1458f6081:     	movq	%rax, -0x20(%rbp)
1458f6085:     	movq	%rdx, -0x18(%rbp)
1458f6089:     	movq	%rdi, -0x10(%rbp)
1458f608d:     	leaq	-0x48(%rbp), %rcx
1458f6091:     	leaq	-0x30(%rbp), %rdx
1458f6095:     	callq	0x1458e4220 <.text+0x58e3220>
1458f609a:     	movq	-0x40(%rbp), %rdi
1458f609e:     	movq	-0x38(%rbp), %rbx
1458f60a2:     	movq	$0x1, 0x20(%rsp)
1458f60ab:     	leaq	0x1a39c0f(%rip), %r9    # 0x14732fcc1
1458f60b2:     	leaq	-0x30(%rbp), %rcx
1458f60b6:     	movq	%rdi, %rdx
1458f60b9:     	movq	%rbx, %r8
1458f60bc:     	callq	0x1458c01f0 <.text+0x58bf1f0>
1458f60c1:     	nop
1458f60c2:     	movq	-0x20(%rbp), %rax
1458f60c6:     	movq	%rax, 0x10(%rsi)
1458f60ca:     	movups	-0x30(%rbp), %xmm0
1458f60ce:     	movups	%xmm0, (%rsi)
1458f60d1:     	testq	%rbx, %rbx
1458f60d4:     	je	0x1458f6102 <.text+0x58f5102>
1458f60d6:     	leaq	0x8(%rdi), %r14
1458f60da:     	jmp	0x1458f60e9 <.text+0x58f50e9>
1458f60dc:     	nopl	(%rax)
1458f60e0:     	addq	$0x18, %r14
1458f60e4:     	decq	%rbx
1458f60e7:     	je	0x1458f6102 <.text+0x58f5102>
1458f60e9:     	movq	-0x8(%r14), %rdx
1458f60ed:     	testq	%rdx, %rdx
1458f60f0:     	je	0x1458f60e0 <.text+0x58f50e0>
1458f60f2:     	movq	(%r14), %rcx
1458f60f5:     	movl	$0x1, %r8d
1458f60fb:     	callq	0x1400021d0 <.text+0x11d0>
1458f6100:     	jmp	0x1458f60e0 <.text+0x58f50e0>
1458f6102:     	movq	-0x48(%rbp), %rax
1458f6106:     	testq	%rax, %rax
1458f6109:     	je	0x1458f6121 <.text+0x58f5121>
1458f610b:     	shlq	$0x3, %rax
1458f610f:     	leaq	(%rax,%rax,2), %rdx
1458f6113:     	movl	$0x8, %r8d
1458f6119:     	movq	%rdi, %rcx
1458f611c:     	callq	0x1400021d0 <.text+0x11d0>
1458f6121:     	movq	%rsi, %rax
1458f6124:     	addq	$0x70, %rsp
1458f6128:     	popq	%rbx
1458f6129:     	popq	%rdi
1458f612a:     	popq	%rsi
1458f612b:     	popq	%r14
1458f612d:     	popq	%rbp
1458f612e:     	retq

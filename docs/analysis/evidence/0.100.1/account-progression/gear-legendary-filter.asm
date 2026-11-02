
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455590f0:     	pushq	%rbp
1455590f1:     	pushq	%r15
1455590f3:     	pushq	%r14
1455590f5:     	pushq	%r13
1455590f7:     	pushq	%r12
1455590f9:     	pushq	%rsi
1455590fa:     	pushq	%rdi
1455590fb:     	pushq	%rbx
1455590fc:     	subq	$0xb8, %rsp
145559103:     	leaq	0x80(%rsp), %rbp
14555910b:     	movq	$-0x2, 0x30(%rbp)
145559113:     	movq	%rcx, 0x10(%rbp)
145559117:     	movq	0x10(%rdx), %rax
14555911b:     	movq	%rax, 0x18(%rbp)
14555911f:     	movq	(%rdx), %r13
145559122:     	movq	0x8(%rdx), %r12
145559126:     	movq	%rdx, 0x28(%rbp)
14555912a:     	movq	0x18(%rdx), %rsi
14555912e:     	movq	%r13, 0x20(%rbp)
145559132:     	cmpq	%rsi, %r12
145559135:     	je	0x1455591ad <.text+0x55581ad>
145559137:     	movq	0x20(%rbp), %r13
14555913b:     	jmp	0x145559149 <.text+0x5558149>
14555913d:     	nopl	(%rax)
145559140:     	addq	$0x4, %r12
145559144:     	cmpq	%rsi, %r12
145559147:     	je	0x1455591ad <.text+0x55581ad>
145559149:     	movl	(%r12), %ebx
14555914d:     	leaq	-0x60(%rbp), %rcx
145559151:     	movl	%ebx, %edx
145559153:     	callq	0x14546f110 <.text+0x546e110>
145559158:     	nop
145559159:     	movq	-0x60(%rbp), %rdx
14555915d:     	cmpq	$-0x1, %rdx
145559161:     	je	0x145559140 <.text+0x5558140>
145559163:     	movq	-0x48(%rbp), %r14
145559167:     	movq	-0x40(%rbp), %r15
14555916b:     	movq	-0x30(%rbp), %rdi
14555916f:     	testq	%rdx, %rdx
145559172:     	je	0x145559183 <.text+0x5558183>
145559174:     	movq	-0x58(%rbp), %rcx
145559178:     	movl	$0x1, %r8d
14555917e:     	callq	0x1400021d0 <.text+0x11d0>
145559183:     	testq	%r14, %r14
145559186:     	je	0x14555919d <.text+0x555819d>
145559188:     	shlq	$0x3, %r14
14555918c:     	movl	$0x4, %r8d
145559192:     	movq	%r15, %rcx
145559195:     	movq	%r14, %rdx
145559198:     	callq	0x1400021d0 <.text+0x11d0>
14555919d:     	cmpq	$0x4, %rdi
1455591a1:     	jne	0x145559140 <.text+0x5558140>
1455591a3:     	movl	%ebx, (%r13)
1455591a7:     	addq	$0x4, %r13
1455591ab:     	jmp	0x145559140 <.text+0x5558140>
1455591ad:     	movq	0x20(%rbp), %rdx
1455591b1:     	subq	%rdx, %r13
1455591b4:     	shrq	$0x2, %r13
1455591b8:     	movq	0x10(%rbp), %rax
1455591bc:     	movq	0x18(%rbp), %rcx
1455591c0:     	movq	%rcx, (%rax)
1455591c3:     	movq	%rdx, 0x8(%rax)
1455591c7:     	movq	%r13, 0x10(%rax)
1455591cb:     	addq	$0xb8, %rsp
1455591d2:     	popq	%rbx
1455591d3:     	popq	%rdi
1455591d4:     	popq	%rsi
1455591d5:     	popq	%r12
1455591d7:     	popq	%r13
1455591d9:     	popq	%r14
1455591db:     	popq	%r15
1455591dd:     	popq	%rbp
1455591de:     	retq

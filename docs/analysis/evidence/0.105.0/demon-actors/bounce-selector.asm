
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14594f150:     	pushq	%rsi
14594f151:     	pushq	%rdi
14594f152:     	pushq	%rbx
14594f153:     	subq	$0x80, %rsp
14594f15a:     	movq	%rcx, %rsi
14594f15d:     	addq	$0x1b0, %rdx            # imm = 0x1B0
14594f164:     	leaq	0x20(%rsp), %rcx
14594f169:     	callq	0x1458e3800 <.text+0x58e2800>
14594f16e:     	movq	0x50(%rsp), %rdx
14594f173:     	movq	0x58(%rsp), %rcx
14594f178:     	movq	0x60(%rsp), %r8
14594f17d:     	xorl	%eax, %eax
14594f17f:     	testq	%r8, %r8
14594f182:     	je	0x14594f1e9 <.text+0x594e1e9>
14594f184:     	shlq	$0x6, %r8
14594f188:     	addq	%rcx, %r8
14594f18b:     	movq	%rcx, %r9
14594f18e:     	jmp	0x14594f199 <.text+0x594e199>
14594f190:     	addq	$0x40, %r9
14594f194:     	cmpq	%r8, %r9
14594f197:     	je	0x14594f1e9 <.text+0x594e1e9>
14594f199:     	cmpb	$0x6, (%r9)
14594f19d:     	jne	0x14594f190 <.text+0x594e190>
14594f19f:     	cmpl	$0x0, 0x10(%r9)
14594f1a4:     	jne	0x14594f190 <.text+0x594e190>
14594f1a6:     	cmpb	$0x1, 0x18(%r9)
14594f1ab:     	jne	0x14594f190 <.text+0x594e190>
14594f1ad:     	cmpq	$0xb, 0x28(%r9)
14594f1b2:     	jne	0x14594f190 <.text+0x594e190>
14594f1b4:     	movq	0x20(%r9), %r10
14594f1b8:     	movq	(%r10), %r11
14594f1bb:     	xorq	0x186600a(%rip), %r11   # 0x1471b51cc
14594f1c2:     	movq	0x3(%r10), %r10
14594f1c6:     	xorq	0x1866002(%rip), %r10   # 0x1471b51cf
14594f1cd:     	orq	%r11, %r10
14594f1d0:     	jne	0x14594f190 <.text+0x594e190>
14594f1d2:     	movss	0x8(%r9), %xmm0
14594f1d8:     	movl	0x4(%r9), %eax
14594f1dc:     	movl	%eax, 0x4(%rsi)
14594f1df:     	movss	%xmm0, 0x8(%rsi)
14594f1e4:     	movl	$0x1, %eax
14594f1e9:     	movl	%eax, (%rsi)
14594f1eb:     	testq	%rdx, %rdx
14594f1ee:     	je	0x14594f1ff <.text+0x594e1ff>
14594f1f0:     	shlq	$0x6, %rdx
14594f1f4:     	movl	$0x8, %r8d
14594f1fa:     	callq	0x1400021d0 <.text+0x11d0>
14594f1ff:     	movq	0x20(%rsp), %rdx
14594f204:     	testq	%rdx, %rdx
14594f207:     	je	0x14594f21d <.text+0x594e21d>
14594f209:     	movq	0x28(%rsp), %rcx
14594f20e:     	shlq	$0x3, %rdx
14594f212:     	movl	$0x4, %r8d
14594f218:     	callq	0x1400021d0 <.text+0x11d0>
14594f21d:     	movq	0x38(%rsp), %rdx
14594f222:     	testq	%rdx, %rdx
14594f225:     	je	0x14594f23b <.text+0x594e23b>
14594f227:     	movq	0x40(%rsp), %rcx
14594f22c:     	shlq	$0x5, %rdx
14594f230:     	movl	$0x8, %r8d
14594f236:     	callq	0x1400021d0 <.text+0x11d0>
14594f23b:     	movq	0x70(%rsp), %rsi
14594f240:     	movq	0x78(%rsp), %rdi
14594f245:     	testq	%rdi, %rdi
14594f248:     	je	0x14594f278 <.text+0x594e278>
14594f24a:     	leaq	0x8(%rsi), %rbx
14594f24e:     	jmp	0x14594f259 <.text+0x594e259>
14594f250:     	addq	$0x28, %rbx
14594f254:     	decq	%rdi
14594f257:     	je	0x14594f278 <.text+0x594e278>
14594f259:     	movq	-0x8(%rbx), %rdx
14594f25d:     	cmpq	$-0x1, %rdx
14594f261:     	je	0x14594f250 <.text+0x594e250>
14594f263:     	testq	%rdx, %rdx
14594f266:     	je	0x14594f250 <.text+0x594e250>
14594f268:     	movq	(%rbx), %rcx
14594f26b:     	movl	$0x1, %r8d
14594f271:     	callq	0x1400021d0 <.text+0x11d0>
14594f276:     	jmp	0x14594f250 <.text+0x594e250>
14594f278:     	movq	0x68(%rsp), %rax
14594f27d:     	testq	%rax, %rax
14594f280:     	je	0x14594f2a2 <.text+0x594e2a2>
14594f282:     	shlq	$0x3, %rax
14594f286:     	leaq	(%rax,%rax,4), %rdx
14594f28a:     	movl	$0x8, %r8d
14594f290:     	movq	%rsi, %rcx
14594f293:     	addq	$0x80, %rsp
14594f29a:     	popq	%rbx
14594f29b:     	popq	%rdi
14594f29c:     	popq	%rsi
14594f29d:     	jmp	0x1400021d0 <.text+0x11d0>
14594f2a2:     	addq	$0x80, %rsp
14594f2a9:     	popq	%rbx
14594f2aa:     	popq	%rdi
14594f2ab:     	popq	%rsi
14594f2ac:     	retq

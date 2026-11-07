
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14599d110:     	pushq	%rbp
14599d111:     	pushq	%r15
14599d113:     	pushq	%r14
14599d115:     	pushq	%r13
14599d117:     	pushq	%r12
14599d119:     	pushq	%rsi
14599d11a:     	pushq	%rdi
14599d11b:     	pushq	%rbx
14599d11c:     	subq	$0x48, %rsp
14599d120:     	leaq	0x40(%rsp), %rbp
14599d125:     	movq	$-0x2, (%rbp)
14599d12d:     	movq	%rcx, %rsi
14599d130:     	cmpq	%r8, %rdx
14599d133:     	je	0x14599d1a7 <.text+0x599c1a7>
14599d135:     	movq	%r8, %rdi
14599d138:     	movq	%rdx, %rbx
14599d13b:     	leaq	0x121c5d6(%rip), %rax   # 0x146bb9718
14599d142:     	leaq	0x121c5d4(%rip), %rcx   # 0x146bb971d
14599d149:     	jmp	0x14599d185 <.text+0x599c185>
14599d14b:     	nopl	(%rax,%rax)
14599d150:     	movq	0x30(%rbx), %rdx
14599d154:     	cmpb	$0x0, 0x54(%rdx)
14599d158:     	movq	%rcx, %rdx
14599d15b:     	je	0x14599d1c3 <.text+0x599c1c3>
14599d15d:     	movl	(%rdx), %r8d
14599d160:     	xorl	0x121c5b6(%rip), %r8d   # 0x146bb971d
14599d167:     	movzbl	0x4(%rdx), %edx
14599d16b:     	xorb	0x121c5b0(%rip), %dl    # 0x146bb9721
14599d171:     	movzbl	%dl, %edx
14599d174:     	orl	%r8d, %edx
14599d177:     	je	0x14599d1c3 <.text+0x599c1c3>
14599d179:     	addq	$0x160, %rbx            # imm = 0x160
14599d180:     	cmpq	%rdi, %rbx
14599d183:     	je	0x14599d1a7 <.text+0x599c1a7>
14599d185:     	cmpb	$0x0, 0x68(%rbx)
14599d189:     	jne	0x14599d179 <.text+0x599c179>
14599d18b:     	cmpq	$-0x1, 0x18(%rbx)
14599d190:     	jne	0x14599d150 <.text+0x599c150>
14599d192:     	cmpq	$-0x1, 0x40(%rbx)
14599d197:     	jne	0x14599d1c3 <.text+0x599c1c3>
14599d199:     	cmpb	$0x1, 0x15c(%rbx)
14599d1a0:     	movq	%rax, %rdx
14599d1a3:     	je	0x14599d15d <.text+0x599c15d>
14599d1a5:     	jmp	0x14599d179 <.text+0x599c179>
14599d1a7:     	movq	$0x0, (%rsi)
14599d1ae:     	movq	$0x8, 0x8(%rsi)
14599d1b6:     	movq	$0x0, 0x10(%rsi)
14599d1be:     	jmp	0x14599d2d3 <.text+0x599c2d3>
14599d1c3:     	callq	0x140002200 <.text+0x1200>
14599d1c8:     	movl	$0x20, %ecx
14599d1cd:     	movl	$0x8, %edx
14599d1d2:     	callq	0x1400021c0 <.text+0x11c0>
14599d1d7:     	testq	%rax, %rax
14599d1da:     	je	0x14599d2e7 <.text+0x599c2e7>
14599d1e0:     	movq	%rbx, (%rax)
14599d1e3:     	addq	$0x160, %rbx            # imm = 0x160
14599d1ea:     	movq	$0x4, -0x18(%rbp)
14599d1f2:     	movq	%rax, -0x10(%rbp)
14599d1f6:     	movq	$0x1, -0x8(%rbp)
14599d1fe:     	cmpq	%rdi, %rbx
14599d201:     	je	0x14599d2bc <.text+0x599c2bc>
14599d207:     	movl	$0x1, %r14d
14599d20d:     	leaq	0x121c504(%rip), %r12   # 0x146bb9718
14599d214:     	leaq	-0x18(%rbp), %r15
14599d218:     	leaq	0x121c4fe(%rip), %r13   # 0x146bb971d
14599d21f:     	nop
14599d220:     	cmpb	$0x0, 0x68(%rbx)
14599d224:     	jne	0x14599d268 <.text+0x599c268>
14599d226:     	cmpq	$-0x1, 0x18(%rbx)
14599d22b:     	je	0x14599d23c <.text+0x599c23c>
14599d22d:     	movq	0x30(%rbx), %rcx
14599d231:     	cmpb	$0x0, 0x54(%rcx)
14599d235:     	movq	%r13, %rcx
14599d238:     	jne	0x14599d24f <.text+0x599c24f>
14599d23a:     	jmp	0x14599d276 <.text+0x599c276>
14599d23c:     	cmpq	$-0x1, 0x40(%rbx)
14599d241:     	jne	0x14599d276 <.text+0x599c276>
14599d243:     	cmpb	$0x1, 0x15c(%rbx)
14599d24a:     	movq	%r12, %rcx
14599d24d:     	jne	0x14599d268 <.text+0x599c268>
14599d24f:     	movl	(%rcx), %edx
14599d251:     	xorl	0x121c4c6(%rip), %edx   # 0x146bb971d
14599d257:     	movzbl	0x4(%rcx), %ecx
14599d25b:     	xorb	0x121c4c0(%rip), %cl    # 0x146bb9721
14599d261:     	movzbl	%cl, %ecx
14599d264:     	orl	%edx, %ecx
14599d266:     	je	0x14599d276 <.text+0x599c276>
14599d268:     	addq	$0x160, %rbx            # imm = 0x160
14599d26f:     	cmpq	%rdi, %rbx
14599d272:     	jne	0x14599d220 <.text+0x599c220>
14599d274:     	jmp	0x14599d2bc <.text+0x599c2bc>
14599d276:     	cmpq	-0x18(%rbp), %r14
14599d27a:     	jne	0x14599d2a1 <.text+0x599c2a1>
14599d27c:     	movq	$0x8, 0x20(%rsp)
14599d285:     	movl	$0x1, %r8d
14599d28b:     	movl	$0x8, %r9d
14599d291:     	movq	%r15, %rcx
14599d294:     	movq	%r14, %rdx
14599d297:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14599d29c:     	nop
14599d29d:     	movq	-0x10(%rbp), %rax
14599d2a1:     	movq	%rbx, (%rax,%r14,8)
14599d2a5:     	addq	$0x160, %rbx            # imm = 0x160
14599d2ac:     	incq	%r14
14599d2af:     	movq	%r14, -0x8(%rbp)
14599d2b3:     	cmpq	%rdi, %rbx
14599d2b6:     	jne	0x14599d220 <.text+0x599c220>
14599d2bc:     	movq	-0x8(%rbp), %rax
14599d2c0:     	movq	%rax, 0x10(%rsi)
14599d2c4:     	movq	-0x18(%rbp), %rax
14599d2c8:     	movq	%rax, (%rsi)
14599d2cb:     	movq	-0x10(%rbp), %rax
14599d2cf:     	movq	%rax, 0x8(%rsi)
14599d2d3:     	movq	%rsi, %rax
14599d2d6:     	addq	$0x48, %rsp
14599d2da:     	popq	%rbx
14599d2db:     	popq	%rdi
14599d2dc:     	popq	%rsi
14599d2dd:     	popq	%r12
14599d2df:     	popq	%r13
14599d2e1:     	popq	%r14
14599d2e3:     	popq	%r15
14599d2e5:     	popq	%rbp
14599d2e6:     	retq
14599d2e7:     	movl	$0x8, %ecx
14599d2ec:     	movl	$0x20, %edx
14599d2f1:     	callq	0x145d6944b <.text+0x5d6844b>
14599d2f6:     	ud2

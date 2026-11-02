
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e6190:     	pushq	%r15
1458e6192:     	pushq	%r14
1458e6194:     	pushq	%r12
1458e6196:     	pushq	%rsi
1458e6197:     	pushq	%rdi
1458e6198:     	pushq	%rbx
1458e6199:     	subq	$0x28, %rsp
1458e619d:     	decb	%cl
1458e619f:     	cmpb	$0xa, %cl
1458e61a2:     	ja	0x1458e629b <.text+0x58e529b>
1458e61a8:     	movzbl	%cl, %eax
1458e61ab:     	movl	$0x5df, %ecx            # imm = 0x5DF
1458e61b0:     	btl	%eax, %ecx
1458e61b3:     	jae	0x1458e629b <.text+0x58e529b>
1458e61b9:     	movq	%r8, %rdi
1458e61bc:     	movq	%rdx, %rbx
1458e61bf:     	leaq	0x1591dfa(%rip), %rcx   # 0x146e77fc0
1458e61c6:     	movq	(%rcx,%rax,8), %r15
1458e61ca:     	movq	0x38(%r15), %rax
1458e61ce:     	testq	%rax, %rax
1458e61d1:     	je	0x1458e6208 <.text+0x58e5208>
1458e61d3:     	movq	0x30(%r15), %rsi
1458e61d7:     	imulq	$0x78, %rax, %r12
1458e61db:     	xorl	%r14d, %r14d
1458e61de:     	jmp	0x1458e61ea <.text+0x58e51ea>
1458e61e0:     	addq	$0x78, %rsi
1458e61e4:     	addq	$-0x78, %r12
1458e61e8:     	je	0x1458e6208 <.text+0x58e5208>
1458e61ea:     	cmpq	%rdi, 0x28(%rsi)
1458e61ee:     	jne	0x1458e61e0 <.text+0x58e51e0>
1458e61f0:     	movq	0x20(%rsi), %rcx
1458e61f4:     	movq	%rbx, %rdx
1458e61f7:     	movq	%rdi, %r8
1458e61fa:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e61ff:     	testl	%eax, %eax
1458e6201:     	jne	0x1458e61e0 <.text+0x58e51e0>
1458e6203:     	jmp	0x1458e629d <.text+0x58e529d>
1458e6208:     	movq	0x78(%r15), %rax
1458e620c:     	testq	%rax, %rax
1458e620f:     	je	0x1458e624b <.text+0x58e524b>
1458e6211:     	movq	0x70(%r15), %rsi
1458e6215:     	imulq	$0x78, %rax, %r14
1458e6219:     	jmp	0x1458e622a <.text+0x58e522a>
1458e621b:     	nopl	(%rax,%rax)
1458e6220:     	addq	$0x78, %rsi
1458e6224:     	addq	$-0x78, %r14
1458e6228:     	je	0x1458e624b <.text+0x58e524b>
1458e622a:     	cmpq	%rdi, 0x28(%rsi)
1458e622e:     	jne	0x1458e6220 <.text+0x58e5220>
1458e6230:     	movq	0x20(%rsi), %rcx
1458e6234:     	movq	%rbx, %rdx
1458e6237:     	movq	%rdi, %r8
1458e623a:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e623f:     	testl	%eax, %eax
1458e6241:     	jne	0x1458e6220 <.text+0x58e5220>
1458e6243:     	movl	$0x1, %r14d
1458e6249:     	jmp	0x1458e629d <.text+0x58e529d>
1458e624b:     	movq	0xb8(%r15), %rax
1458e6252:     	testq	%rax, %rax
1458e6255:     	je	0x1458e629b <.text+0x58e529b>
1458e6257:     	movq	0xb0(%r15), %rsi
1458e625e:     	imulq	$0x78, %rax, %r14
1458e6262:     	jmp	0x1458e627a <.text+0x58e527a>
1458e6264:     	nopw	%cs:(%rax,%rax)
1458e6270:     	addq	$0x78, %rsi
1458e6274:     	addq	$-0x78, %r14
1458e6278:     	je	0x1458e62b1 <.text+0x58e52b1>
1458e627a:     	cmpq	%rdi, 0x28(%rsi)
1458e627e:     	jne	0x1458e6270 <.text+0x58e5270>
1458e6280:     	movq	0x20(%rsi), %rcx
1458e6284:     	movq	%rbx, %rdx
1458e6287:     	movq	%rdi, %r8
1458e628a:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e628f:     	testl	%eax, %eax
1458e6291:     	jne	0x1458e6270 <.text+0x58e5270>
1458e6293:     	movl	$0x2, %r14d
1458e6299:     	jmp	0x1458e629d <.text+0x58e529d>
1458e629b:     	xorl	%esi, %esi
1458e629d:     	movq	%r14, %rax
1458e62a0:     	movq	%rsi, %rdx
1458e62a3:     	addq	$0x28, %rsp
1458e62a7:     	popq	%rbx
1458e62a8:     	popq	%rdi
1458e62a9:     	popq	%rsi
1458e62aa:     	popq	%r12
1458e62ac:     	popq	%r14
1458e62ae:     	popq	%r15
1458e62b0:     	retq
1458e62b1:     	movl	$0x2, %r14d
1458e62b7:     	xorl	%esi, %esi
1458e62b9:     	jmp	0x1458e629d <.text+0x58e529d>

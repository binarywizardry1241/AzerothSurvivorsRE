1458b9140:     	pushq	%r14
1458b9142:     	pushq	%rsi
1458b9143:     	pushq	%rdi
1458b9144:     	pushq	%rbp
1458b9145:     	pushq	%rbx
1458b9146:     	subq	$0x20, %rsp
1458b914a:     	movq	%rdx, %rax
1458b914d:     	movq	%rcx, %rsi
1458b9150:     	movl	0x8(%rdx), %edx
1458b9153:     	movl	0xc(%rax), %ebp
1458b9156:     	xorl	%ecx, %ecx
1458b9158:     	movl	%ebp, %r8d
1458b915b:     	subl	%edx, %r8d
1458b915e:     	cmovbl	%ecx, %r8d
1458b9162:     	movq	(%rax), %rdi
1458b9165:     	movl	%r8d, %ecx
1458b9168:     	shrl	%ecx
1458b916a:     	movl	%r8d, %eax
1458b916d:     	andl	$0x1, %eax
1458b9170:     	addq	%rcx, %rax
1458b9173:     	cmpq	$0x0, 0x18(%rsi)
1458b9178:     	cmoveq	%r8, %rax
1458b917c:     	cmpq	0x10(%rsi), %rax
1458b9180:     	ja	0x1458b91f5 <.text+0x58b81f5>
1458b9182:     	cmpl	%ebp, %edx
1458b9184:     	jae	0x1458b91d5 <.text+0x58b81d5>
1458b9186:     	nopw	%cs:(%rax,%rax)
1458b9190:     	movl	0x28(%rdi), %ecx
1458b9193:     	imull	%edx, %ecx
1458b9196:     	leaq	0x18(%rcx), %rax
1458b919a:     	movq	0x10(%rdi), %r8
1458b919e:     	cmpq	%r8, %rax
1458b91a1:     	ja	0x1458b91e0 <.text+0x58b81e0>
1458b91a3:     	leal	0x1(%rdx), %r14d
1458b91a7:     	movq	0x8(%rdi), %rax
1458b91ab:     	movl	0x14(%rax,%rcx), %ebx
1458b91af:     	movq	%rdi, %rcx
1458b91b2:     	movl	$0x1, %r8d
1458b91b8:     	callq	0x145873b10 <.text+0x5872b10>
1458b91bd:     	movq	%rdx, %r9
1458b91c0:     	movq	%rsi, %rcx
1458b91c3:     	movl	%ebx, %edx
1458b91c5:     	movq	%rax, %r8
1458b91c8:     	callq	0x1458ba8b0 <.text+0x58b98b0>
1458b91cd:     	movl	%r14d, %edx
1458b91d0:     	cmpl	%r14d, %ebp
1458b91d3:     	jne	0x1458b9190 <.text+0x58b8190>
1458b91d5:     	addq	$0x20, %rsp
1458b91d9:     	popq	%rbx
1458b91da:     	popq	%rbp
1458b91db:     	popq	%rdi
1458b91dc:     	popq	%rsi
1458b91dd:     	popq	%r14
1458b91df:     	retq
1458b91e0:     	addq	$0x14, %rcx
1458b91e4:     	leaq	0x12e7afd(%rip), %r9    # 0x146ba0ce8
1458b91eb:     	movq	%rax, %rdx
1458b91ee:     	callq	0x145d699f0 <.text+0x5d689f0>
1458b91f3:     	ud2
1458b91f5:     	leaq	0x20(%rsi), %r8
1458b91f9:     	movq	%rsi, %rcx
1458b91fc:     	movq	%rdx, %rbx
1458b91ff:     	movq	%rax, %rdx
1458b9202:     	movb	$0x1, %r9b
1458b9205:     	callq	0x145d4e060 <.text+0x5d4d060>
1458b920a:     	movq	%rbx, %rdx
1458b920d:     	cmpl	%ebp, %edx
1458b920f:     	jb	0x1458b9190 <.text+0x58b8190>
1458b9215:     	jmp	0x1458b91d5 <.text+0x58b81d5>

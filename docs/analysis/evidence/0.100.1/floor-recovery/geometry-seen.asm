
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14546cf80:     	pushq	%r15
14546cf82:     	pushq	%r14
14546cf84:     	pushq	%rsi
14546cf85:     	pushq	%rdi
14546cf86:     	pushq	%rbx
14546cf87:     	subq	$0x30, %rsp
14546cf8b:     	movl	%edx, %esi
14546cf8d:     	movq	%rcx, %rdi
14546cf90:     	movl	%edx, 0x2c(%rsp)
14546cf94:     	leaq	0x20(%rcx), %rbx
14546cf98:     	leaq	0x2c(%rsp), %rdx
14546cf9d:     	movq	%rbx, %rcx
14546cfa0:     	callq	0x140bccc10 <.text+0xbcbc10>
14546cfa5:     	cmpq	$0x0, 0x10(%rdi)
14546cfaa:     	je	0x14546d0c3 <.text+0x546c0c3>
14546cfb0:     	movq	(%rdi), %rdx
14546cfb3:     	movq	0x8(%rdi), %r9
14546cfb7:     	movq	%rax, %r8
14546cfba:     	shrq	$0x39, %r8
14546cfbe:     	movd	%r8d, %xmm0
14546cfc3:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
14546cfc7:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
14546cfcc:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
14546cfd1:     	xorl	%ebx, %ebx
14546cfd3:     	pcmpeqd	%xmm1, %xmm1
14546cfd7:     	xorl	%r11d, %r11d
14546cfda:     	andq	%r9, %rax
14546cfdd:     	movdqu	(%rdx,%rax), %xmm2
14546cfe2:     	movdqa	%xmm2, %xmm3
14546cfe6:     	pcmpeqb	%xmm0, %xmm3
14546cfea:     	pmovmskb	%xmm3, %r14d
14546cfef:     	testl	%r14d, %r14d
14546cff2:     	je	0x14546d030 <.text+0x546c030>
14546cff4:     	tzcntl	%r14d, %ecx
14546cff9:     	addq	%rax, %rcx
14546cffc:     	andq	%r9, %rcx
14546cfff:     	shlq	$0x2, %rcx
14546d003:     	movq	%rdx, %r15
14546d006:     	subq	%rcx, %r15
14546d009:     	movb	$0x1, %cl
14546d00b:     	cmpl	-0x4(%r15), %esi
14546d00f:     	je	0x14546d0b5 <.text+0x546c0b5>
14546d015:     	leal	-0x1(%r14), %ecx
14546d019:     	andw	%r14w, %cx
14546d01d:     	movl	%ecx, %r14d
14546d020:     	jne	0x14546cff4 <.text+0x546bff4>
14546d022:     	nopw	%cs:(%rax,%rax)
14546d030:     	cmpq	$0x1, %rbx
14546d034:     	je	0x14546d049 <.text+0x546c049>
14546d036:     	pmovmskb	%xmm2, %ecx
14546d03a:     	testl	%ecx, %ecx
14546d03c:     	je	0x14546d05c <.text+0x546c05c>
14546d03e:     	tzcntl	%ecx, %r10d
14546d043:     	addq	%rax, %r10
14546d046:     	andq	%r9, %r10
14546d049:     	pcmpeqb	%xmm1, %xmm2
14546d04d:     	pmovmskb	%xmm2, %ecx
14546d051:     	testl	%ecx, %ecx
14546d053:     	jne	0x14546d06e <.text+0x546c06e>
14546d055:     	movl	$0x1, %ebx
14546d05a:     	jmp	0x14546d05e <.text+0x546c05e>
14546d05c:     	xorl	%ebx, %ebx
14546d05e:     	addq	%r11, %rax
14546d061:     	addq	$0x10, %rax
14546d065:     	addq	$0x10, %r11
14546d069:     	jmp	0x14546cfda <.text+0x546bfda>
14546d06e:     	movzbl	(%rdx,%r10), %eax
14546d073:     	testb	%al, %al
14546d075:     	jns	0x14546d0e1 <.text+0x546c0e1>
14546d077:     	andb	$0x1, %al
14546d079:     	leaq	-0x10(%r10), %rcx
14546d07d:     	andq	%r9, %rcx
14546d080:     	movb	%r8b, (%rdx,%r10)
14546d084:     	movb	%r8b, 0x10(%rdx,%rcx)
14546d089:     	movdqu	0x10(%rdi), %xmm0
14546d08e:     	movzbl	%al, %eax
14546d091:     	movd	%eax, %xmm1
14546d095:     	shufpd	$0x2, 0x49a0f2(%rip), %xmm1 # xmm1 = xmm1[0],mem[1]
                                                # 0x145907190
14546d09e:     	psubq	%xmm1, %xmm0
14546d0a2:     	movdqu	%xmm0, 0x10(%rdi)
14546d0a7:     	shlq	$0x2, %r10
14546d0ab:     	negq	%r10
14546d0ae:     	movl	%esi, -0x4(%rdx,%r10)
14546d0b3:     	xorl	%ecx, %ecx
14546d0b5:     	movl	%ecx, %eax
14546d0b7:     	addq	$0x30, %rsp
14546d0bb:     	popq	%rbx
14546d0bc:     	popq	%rdi
14546d0bd:     	popq	%rsi
14546d0be:     	popq	%r14
14546d0c0:     	popq	%r15
14546d0c2:     	retq
14546d0c3:     	movl	$0x1, %edx
14546d0c8:     	movq	%rdi, %rcx
14546d0cb:     	movq	%rbx, %r8
14546d0ce:     	movb	$0x1, %r9b
14546d0d1:     	movq	%rax, %rbx
14546d0d4:     	callq	0x1458fe1c0 <.text+0x58fd1c0>
14546d0d9:     	movq	%rbx, %rax
14546d0dc:     	jmp	0x14546cfb0 <.text+0x546bfb0>
14546d0e1:     	movdqa	(%rdx), %xmm0
14546d0e5:     	pmovmskb	%xmm0, %eax
14546d0e9:     	tzcntl	%eax, %r10d
14546d0ee:     	movzbl	(%rdx,%r10), %eax
14546d0f3:     	jmp	0x14546d077 <.text+0x546c077>

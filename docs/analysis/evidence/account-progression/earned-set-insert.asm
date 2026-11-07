
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145435f00:     	pushq	%rbp
145435f01:     	pushq	%r15
145435f03:     	pushq	%r14
145435f05:     	pushq	%r13
145435f07:     	pushq	%r12
145435f09:     	pushq	%rsi
145435f0a:     	pushq	%rdi
145435f0b:     	pushq	%rbx
145435f0c:     	subq	$0x48, %rsp
145435f10:     	leaq	0x40(%rsp), %rbp
145435f15:     	movq	$-0x2, (%rbp)
145435f1d:     	movq	%r8, %rsi
145435f20:     	movq	%rcx, %r15
145435f23:     	movq	0xb0(%rcx), %r8
145435f2a:     	movq	0xb8(%rcx), %r14
145435f31:     	movq	%r14, %r13
145435f34:     	testq	%r14, %r14
145435f37:     	movq	%rdx, %r12
145435f3a:     	movq	%r8, -0x8(%rbp)
145435f3e:     	je	0x145435fef <.text+0x5434fef>
145435f44:     	movq	%r15, -0x10(%rbp)
145435f48:     	movq	%rsi, %rdi
145435f4b:     	cmpq	$0x1, %r14
145435f4f:     	movq	%r14, -0x18(%rbp)
145435f53:     	jne	0x145435f59 <.text+0x5434f59>
145435f55:     	xorl	%ebx, %ebx
145435f57:     	jmp	0x145435faf <.text+0x5434faf>
145435f59:     	xorl	%ebx, %ebx
145435f5b:     	nopl	(%rax,%rax)
145435f60:     	movq	%rbx, %r13
145435f63:     	movq	%r14, %rsi
145435f66:     	shrq	%rsi
145435f69:     	addq	%rsi, %rbx
145435f6c:     	leaq	(%rbx,%rbx,2), %rax
145435f70:     	movq	0x8(%r8,%rax,8), %rcx
145435f75:     	movq	-0x8(%rbp), %rdx
145435f79:     	movq	0x10(%rdx,%rax,8), %r8
145435f7e:     	movq	%r8, %r15
145435f81:     	subq	%rdi, %r15
145435f84:     	cmovaeq	%rdi, %r8
145435f88:     	movq	%r12, %rdx
145435f8b:     	callq	0x1457731e7 <.text+0x57721e7>
145435f90:     	movq	-0x8(%rbp), %r8
145435f94:     	movq	%r12, %rdx
145435f97:     	cltq
145435f99:     	testl	%eax, %eax
145435f9b:     	cmovneq	%rax, %r15
145435f9f:     	testq	%r15, %r15
145435fa2:     	cmovgq	%r13, %rbx
145435fa6:     	subq	%rsi, %r14
145435fa9:     	cmpq	$0x1, %r14
145435fad:     	ja	0x145435f60 <.text+0x5434f60>
145435faf:     	leaq	(%rbx,%rbx,2), %rax
145435fb3:     	movq	0x8(%r8,%rax,8), %rcx
145435fb8:     	movq	0x10(%r8,%rax,8), %r8
145435fbd:     	movq	%r8, %r13
145435fc0:     	subq	%rdi, %r13
145435fc3:     	cmovaeq	%rdi, %r8
145435fc7:     	callq	0x1457731e7 <.text+0x57721e7>
145435fcc:     	cltq
145435fce:     	testl	%eax, %eax
145435fd0:     	cmovneq	%rax, %r13
145435fd4:     	testq	%r13, %r13
145435fd7:     	je	0x14543604d <.text+0x543504d>
145435fd9:     	movq	%rdi, %rsi
145435fdc:     	shrq	$0x3f, %r13
145435fe0:     	addq	%rbx, %r13
145435fe3:     	movq	-0x10(%rbp), %r15
145435fe7:     	movq	-0x18(%rbp), %r14
145435feb:     	movq	-0x8(%rbp), %r8
145435fef:     	leaq	0xa8(%r15), %rbx
145435ff6:     	testq	%rsi, %rsi
145435ff9:     	jns	0x14543600b <.text+0x543500b>
145435ffb:     	xorl	%r14d, %r14d
145435ffe:     	movq	%r14, %rcx
145436001:     	movq	%rsi, %rdx
145436004:     	callq	0x14590379b <.text+0x590279b>
145436009:     	ud2
14543600b:     	je	0x145436051 <.text+0x5435051>
14543600d:     	movq	%r14, %rdi
145436010:     	callq	0x140002200 <.text+0x1200>
145436015:     	movl	$0x1, %r14d
14543601b:     	movl	$0x1, %edx
145436020:     	movq	%rsi, %rcx
145436023:     	callq	0x1400021c0 <.text+0x11c0>
145436028:     	testq	%rax, %rax
14543602b:     	je	0x145435ffe <.text+0x5434ffe>
14543602d:     	movq	%rax, -0x10(%rbp)
145436031:     	movq	%rax, %rcx
145436034:     	movq	%r12, %rdx
145436037:     	movq	%rsi, %r8
14543603a:     	callq	0x1457731ed <.text+0x57721ed>
14543603f:     	movq	%rdi, %r14
145436042:     	movq	-0x8(%rbp), %r8
145436046:     	cmpq	(%rbx), %r14
145436049:     	je	0x14543605f <.text+0x543505f>
14543604b:     	jmp	0x145436077 <.text+0x5435077>
14543604d:     	xorl	%eax, %eax
14543604f:     	jmp	0x1454360bd <.text+0x54350bd>
145436051:     	movl	$0x1, %eax
145436056:     	movq	%rax, -0x10(%rbp)
14543605a:     	cmpq	(%rbx), %r14
14543605d:     	jne	0x145436077 <.text+0x5435077>
14543605f:     	movq	%rsi, -0x8(%rbp)
145436063:     	movq	%rbx, %rcx
145436066:     	callq	0x1457745c0 <.text+0x57735c0>
14543606b:     	nop
14543606c:     	movq	0xb0(%r15), %r8
145436073:     	movq	-0x8(%rbp), %rsi
145436077:     	leaq	(,%r13,2), %rax
14543607f:     	addq	%r13, %rax
145436082:     	leaq	(%r8,%rax,8), %rdi
145436086:     	movq	%r14, %rax
145436089:     	subq	%r13, %rax
14543608c:     	jbe	0x1454360a2 <.text+0x54350a2>
14543608e:     	leaq	0x18(%rdi), %rcx
145436092:     	shlq	$0x3, %rax
145436096:     	leaq	(%rax,%rax,2), %r8
14543609a:     	movq	%rdi, %rdx
14543609d:     	callq	0x1457731e1 <.text+0x57721e1>
1454360a2:     	movq	%rsi, (%rdi)
1454360a5:     	movq	-0x10(%rbp), %rax
1454360a9:     	movq	%rax, 0x8(%rdi)
1454360ad:     	movq	%rsi, 0x10(%rdi)
1454360b1:     	incq	%r14
1454360b4:     	movq	%r14, 0xb8(%r15)
1454360bb:     	movb	$0x1, %al
1454360bd:     	addq	$0x48, %rsp
1454360c1:     	popq	%rbx
1454360c2:     	popq	%rdi
1454360c3:     	popq	%rsi
1454360c4:     	popq	%r12
1454360c6:     	popq	%r13
1454360c8:     	popq	%r14
1454360ca:     	popq	%r15
1454360cc:     	popq	%rbp
1454360cd:     	retq


AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145400e85:     	movq	0x128(%r14), %rdi
145400e8c:     	movq	0x130(%r14), %rax
145400e93:     	leaq	(%rdi,%rax,8), %r15
145400e97:     	leaq	-0x10(%rbp), %r14
145400e9b:     	leaq	0xb0(%rbp), %r12
145400ea2:     	jmp	0x145400eb3 <.text+0x53ffeb3>
145400ea4:     	nopw	%cs:(%rax,%rax)
145400eb0:     	movq	%r13, %rdi
145400eb3:     	cmpq	%r15, %rdi
145400eb6:     	je	0x1454010a6 <.text+0x54000a6>
145400ebc:     	leaq	0x8(%rdi), %r13
145400ec0:     	leaq	0x3(%rdi), %rdx
145400ec4:     	leaq	0x90(%rbp), %rcx
145400ecb:     	movq	%r13, %r8
145400ece:     	callq	0x1454e9760 <.text+0x54e8760>
145400ed3:     	nop
145400ed4:     	movq	0x98(%rbp), %rbx
145400edb:     	movq	0xa0(%rbp), %rsi
145400ee2:     	movq	$0x1, 0x20(%rsp)
145400eeb:     	movq	%r14, %rcx
145400eee:     	movq	%rbx, %rdx
145400ef1:     	movq	%rsi, %r8
145400ef4:     	leaq	0x12dad11(%rip), %r9    # 0x1466dbc0c
145400efb:     	callq	0x145422a70 <.text+0x5421a70>
145400f00:     	nop
145400f01:     	leaq	0x2(%rdi), %rax
145400f05:     	movq	(%rbp), %rcx
145400f09:     	movq	%rcx, 0xe0(%rbp)
145400f10:     	movdqu	-0x10(%rbp), %xmm0
145400f15:     	movdqa	%xmm0, 0xd0(%rbp)
145400f1d:     	movq	%rdi, -0x10(%rbp)
145400f21:     	incq	%rdi
145400f24:     	leaq	0x2d7605(%rip), %rcx    # 0x1456d8530 <.text+0x56d7530>
145400f2b:     	movq	%rcx, -0x8(%rbp)
145400f2f:     	movq	%rdi, (%rbp)
145400f33:     	movq	%rcx, 0x8(%rbp)
145400f37:     	movq	%rax, 0x10(%rbp)
145400f3b:     	movq	%rcx, 0x18(%rbp)
145400f3f:     	leaq	0xd0(%rbp), %rax
145400f46:     	movq	%rax, 0x20(%rbp)
145400f4a:     	leaq	-0x53fee71(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145400f51:     	movq	%rax, 0x28(%rbp)
145400f55:     	movq	%r12, %rcx
145400f58:     	leaq	0x12daf7b(%rip), %rdx   # 0x1466dbeda
145400f5f:     	movq	%r14, %r8
145400f62:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
145400f67:     	nop
145400f68:     	movq	0xd0(%rbp), %rdx
145400f6f:     	testq	%rdx, %rdx
145400f72:     	je	0x145400f86 <.text+0x53fff86>
145400f74:     	movq	0xd8(%rbp), %rcx
145400f7b:     	movl	$0x1, %r8d
145400f81:     	callq	0x1400021d0 <.text+0x11d0>
145400f86:     	movq	0xb0(%rbp), %rax
145400f8d:     	movq	%rax, 0x100(%rbp)
145400f94:     	movq	0xb8(%rbp), %rax
145400f9b:     	movq	%rax, 0x108(%rbp)
145400fa2:     	movq	0xc0(%rbp), %rdi
145400fa9:     	movq	0xe8(%rbp), %rax
145400fb0:     	movq	0xf8(%rbp), %rdx
145400fb7:     	subq	%rdx, %rax
145400fba:     	cmpq	%rax, %rdi
145400fbd:     	ja	0x14540107b <.text+0x540007b>
145400fc3:     	testq	%rdi, %rdi
145400fc6:     	je	0x145400fe8 <.text+0x53fffe8>
145400fc8:     	addq	0xf0(%rbp), %rdx
145400fcf:     	movq	%rdx, %rcx
145400fd2:     	movq	0x108(%rbp), %rdx
145400fd9:     	movq	%rdi, %r8
145400fdc:     	callq	0x1457149fd <.text+0x57139fd>
145400fe1:     	movq	0xf8(%rbp), %rdx
145400fe8:     	addq	%rdi, %rdx
145400feb:     	movq	%rdx, 0xf8(%rbp)
145400ff2:     	movq	0x100(%rbp), %rdx
145400ff9:     	testq	%rdx, %rdx
145400ffc:     	je	0x145401010 <.text+0x5400010>
145400ffe:     	movl	$0x1, %r8d
145401004:     	movq	0x108(%rbp), %rcx
14540100b:     	callq	0x1400021d0 <.text+0x11d0>
145401010:     	testq	%rsi, %rsi
145401013:     	je	0x145401050 <.text+0x5400050>
145401015:     	leaq	0x8(%rbx), %rdi
145401019:     	jmp	0x145401029 <.text+0x5400029>
14540101b:     	nopl	(%rax,%rax)
145401020:     	addq	$0x18, %rdi
145401024:     	decq	%rsi
145401027:     	je	0x145401050 <.text+0x5400050>
145401029:     	movq	-0x8(%rdi), %rdx
14540102d:     	testq	%rdx, %rdx
145401030:     	je	0x145401020 <.text+0x5400020>
145401032:     	movq	(%rdi), %rcx
145401035:     	movl	$0x1, %r8d
14540103b:     	callq	0x1400021d0 <.text+0x11d0>
145401040:     	jmp	0x145401020 <.text+0x5400020>
145401042:     	nopw	%cs:(%rax,%rax)
145401050:     	movq	0x90(%rbp), %rax
145401057:     	testq	%rax, %rax
14540105a:     	je	0x145400eb0 <.text+0x53ffeb0>
145401060:     	shlq	$0x3, %rax
145401064:     	leaq	(%rax,%rax,2), %rdx
145401068:     	movl	$0x8, %r8d
14540106e:     	movq	%rbx, %rcx
145401071:     	callq	0x1400021d0 <.text+0x11d0>
145401076:     	jmp	0x145400eb0 <.text+0x53ffeb0>
14540107b:     	movq	$0x1, 0x20(%rsp)
145401084:     	movl	$0x1, %r9d
14540108a:     	leaq	0xe8(%rbp), %rcx
145401091:     	movq	%rdi, %r8
145401094:     	callq	0x145717840 <.text+0x5716840>
145401099:     	nop
14540109a:     	movq	0xf8(%rbp), %rdx
1454010a1:     	jmp	0x145400fc8 <.text+0x53fffc8>
1454010a6:     	movq	0xf8(%rbp), %rcx
1454010ad:     	movq	-0x58(%rbp), %rax
1454010b1:     	movq	%rcx, 0x10(%rax)
1454010b5:     	movups	0xe8(%rbp), %xmm0

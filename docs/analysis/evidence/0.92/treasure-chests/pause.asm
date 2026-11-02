
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145487100:     	pushq	%rbp
145487101:     	pushq	%rsi
145487102:     	pushq	%rdi
145487103:     	pushq	%rbx
145487104:     	subq	$0x88, %rsp
14548710b:     	leaq	0x80(%rsp), %rbp
145487113:     	movq	$-0x2, (%rbp)
14548711b:     	cmpb	$0x1, 0x94e(%rcx)
145487122:     	jne	0x145487206 <.text+0x5486206>
145487128:     	movq	%rcx, %rsi
14548712b:     	movb	$0x3, 0x94e(%rcx)
145487132:     	callq	0x145465d90 <.text+0x5464d90>
145487137:     	callq	0x140002200 <.text+0x1200>
14548713c:     	movl	$0x1, %ecx
145487141:     	movl	$0x1, %edx
145487146:     	callq	0x1400021c0 <.text+0x11c0>
14548714b:     	testq	%rax, %rax
14548714e:     	je	0x14548723d <.text+0x548623d>
145487154:     	movb	$0x7b, (%rax)
145487157:     	movq	$0x1, -0x50(%rbp)
14548715f:     	movq	%rax, -0x48(%rbp)
145487163:     	movq	$0x1, -0x40(%rbp)
14548716b:     	movb	$0x1, -0x38(%rbp)
14548716f:     	leaq	0x1627d0f(%rip), %rax   # 0x146aaee85
145487176:     	movq	%rax, 0x20(%rsp)
14548717b:     	movq	$0x6, 0x28(%rsp)
145487184:     	leaq	0x162851e(%rip), %r8    # 0x146aaf6a9
14548718b:     	leaq	-0x30(%rbp), %rcx
14548718f:     	leaq	-0x50(%rbp), %rdx
145487193:     	movl	$0x4, %r9d
145487199:     	callq	0x145426da0 <.text+0x5425da0>
14548719e:     	movq	-0x30(%rbp), %rax
1454871a2:     	movq	-0x20(%rbp), %rdi
1454871a6:     	cmpq	%rdi, %rax
1454871a9:     	je	0x145487212 <.text+0x5486212>
1454871ab:     	movq	%rax, -0x8(%rbp)
1454871af:     	movq	-0x28(%rbp), %rax
1454871b3:     	movq	%rax, -0x10(%rbp)
1454871b7:     	movb	$0x7d, (%rax,%rdi)
1454871bb:     	movq	0x560(%rsi), %rbx
1454871c2:     	cmpq	0x550(%rsi), %rbx
1454871c9:     	jne	0x1454871d8 <.text+0x54861d8>
1454871cb:     	leaq	0x550(%rsi), %rcx
1454871d2:     	callq	0x145717c10 <.text+0x5716c10>
1454871d7:     	nop
1454871d8:     	incq	%rdi
1454871db:     	movq	0x558(%rsi), %rax
1454871e2:     	leaq	(%rbx,%rbx,2), %rcx
1454871e6:     	movq	-0x8(%rbp), %rdx
1454871ea:     	movq	%rdx, (%rax,%rcx,8)
1454871ee:     	movq	-0x10(%rbp), %rdx
1454871f2:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454871f7:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454871fc:     	incq	%rbx
1454871ff:     	movq	%rbx, 0x560(%rsi)
145487206:     	addq	$0x88, %rsp
14548720d:     	popq	%rbx
14548720e:     	popq	%rdi
14548720f:     	popq	%rsi
145487210:     	popq	%rbp
145487211:     	retq
145487212:     	movq	$0x1, 0x20(%rsp)
14548721b:     	leaq	-0x30(%rbp), %rcx
14548721f:     	movl	$0x1, %r8d
145487225:     	movl	$0x1, %r9d
14548722b:     	movq	%rdi, %rdx
14548722e:     	callq	0x145717840 <.text+0x5716840>
145487233:     	nop
145487234:     	movq	-0x30(%rbp), %rax
145487238:     	jmp	0x1454871ab <.text+0x54861ab>
14548723d:     	movl	$0x1, %ecx
145487242:     	movl	$0x1, %edx
145487247:     	callq	0x1458a3b8b <.text+0x58a2b8b>
14548724c:     	ud2

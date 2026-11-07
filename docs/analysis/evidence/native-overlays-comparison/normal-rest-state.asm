
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145492353:     	movzbl	0x28b(%rdi), %r8d
14549235b:     	orl	$0x2000000, %r8d        # imm = 0x2000000
145492362:     	movq	0x28(%rbp), %rax
145492366:     	testq	%rax, %rax
145492369:     	je	0x1454923d7 <.text+0x54913d7>
14549236b:     	movq	0x30(%rbp), %rcx
14549236f:     	movl	$0xc2, %edx
145492374:     	movzwl	0x36(%rax), %r10d
145492379:     	movl	%r10d, %r11d
14549237c:     	addl	%r11d, %r11d
14549237f:     	movq	$-0x1, %r9
145492386:     	nopw	%cs:(%rax,%rax)
145492390:     	testq	%r11, %r11
145492393:     	je	0x1454923c0 <.text+0x54913c0>
145492395:     	movzwl	0x3a(%rax,%r9,2), %esi
14549239b:     	cmpl	%esi, %edx
14549239d:     	seta	%sil
1454923a1:     	sbbb	$0x0, %sil
1454923a5:     	incq	%r9
1454923a8:     	addq	$-0x2, %r11
1454923ac:     	cmpb	$0x1, %sil
1454923b0:     	je	0x145492390 <.text+0x5491390>
1454923b2:     	movzbl	%sil, %r10d
1454923b6:     	testl	%r10d, %r10d
1454923b9:     	je	0x1454923d0 <.text+0x54913d0>
1454923bb:     	jmp	0x1454923c3 <.text+0x54913c3>
1454923bd:     	nopl	(%rax)
1454923c0:     	movq	%r10, %r9
1454923c3:     	subq	$0x1, %rcx
1454923c7:     	jb	0x1454923d9 <.text+0x54913d9>
1454923c9:     	movq	0x50(%rax,%r9,8), %rax
1454923ce:     	jmp	0x145492374 <.text+0x5491374>
1454923d0:     	movl	%r8d, 0x8(%rax,%r9,4)
1454923d5:     	jmp	0x145492403 <.text+0x5491403>
1454923d7:     	xorl	%eax, %eax
1454923d9:     	movq	%rbx, -0x28(%rbp)
1454923dd:     	movq	%rax, -0x20(%rbp)
1454923e1:     	movq	$0x0, -0x18(%rbp)
1454923e9:     	movq	%r9, -0x10(%rbp)
1454923ed:     	movq	$0xc2, -0x8(%rbp)
1454923f5:     	leaq	-0x48(%rbp), %rcx
1454923f9:     	leaq	-0x28(%rbp), %rdx
1454923fd:     	callq	0x145427a50 <.text+0x5426a50>
145492402:     	nop
145492403:     	movq	0x28(%rbp), %rax
145492407:     	testq	%rax, %rax

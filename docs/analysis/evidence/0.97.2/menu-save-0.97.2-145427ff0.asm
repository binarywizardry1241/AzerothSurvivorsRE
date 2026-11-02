
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145427ff0:     	pushq	%rbp
145427ff1:     	pushq	%rsi
145427ff2:     	pushq	%rdi
145427ff3:     	pushq	%rbx
145427ff4:     	subq	$0x218, %rsp            # imm = 0x218
145427ffb:     	leaq	0x80(%rsp), %rbp
145428003:     	movq	$-0x2, 0x190(%rbp)
14542800e:     	movq	%r8, %rdi
145428011:     	movq	%rdx, %rbx
145428014:     	movq	%rcx, %rsi
145428017:     	movq	%rdx, %rcx
14542801a:     	movq	%r8, %rdx
14542801d:     	callq	0x140a9db30 <.text+0xa9cb30>
145428022:     	cmpq	$0x5, %rdx
145428026:     	jb	0x145428041 <.text+0x5427041>
145428028:     	movl	0x1585b66(%rip), %ecx   # 0x1469adb94
14542802e:     	xorl	(%rax), %ecx
145428030:     	movzbl	0x1585b61(%rip), %edx   # 0x1469adb98
145428037:     	xorb	0x4(%rax), %dl
14542803a:     	movzbl	%dl, %eax
14542803d:     	orl	%ecx, %eax
14542803f:     	je	0x14542806a <.text+0x542706a>
145428041:     	leaq	0x12f8bdc(%rip), %rax   # 0x146720c24
145428048:     	movq	%rax, 0x8(%rsi)
14542804c:     	movq	$0xf, 0x10(%rsi)
145428054:     	movq	$-0x1, (%rsi)
14542805b:     	movq	%rsi, %rax
14542805e:     	addq	$0x218, %rsp            # imm = 0x218
145428065:     	popq	%rbx
145428066:     	popq	%rdi
145428067:     	popq	%rsi
145428068:     	popq	%rbp
145428069:     	retq
14542806a:     	leaq	-0x60(%rbp), %rcx
14542806e:     	movq	%rbx, %rdx
145428071:     	movq	%rdi, %r8
145428074:     	callq	0x145502290 <.text+0x5501290>
145428079:     	movq	-0x60(%rbp), %rax
14542807d:     	cmpq	$-0x1, %rax
145428081:     	je	0x14542815b <.text+0x542715b>
145428087:     	movq	%rax, 0x180(%rbp)
14542808e:     	movq	-0x58(%rbp), %rdx
145428092:     	movq	-0x50(%rbp), %r8
145428096:     	leaq	-0x60(%rbp), %rcx
14542809a:     	movq	%rdx, 0x170(%rbp)
1454280a1:     	callq	0x14541f1c0 <.text+0x541e1c0>
1454280a6:     	nop
1454280a7:     	movl	$0x0, 0x150(%rbp)
1454280b1:     	leaq	0x158(%rbp), %rcx
1454280b8:     	callq	0x145454d30 <.text+0x5453d30>
1454280bd:     	nop
1454280be:     	movq	0x158(%rbp), %rax
1454280c5:     	cmpq	$-0x1, %rax
1454280c9:     	je	0x145428118 <.text+0x5427118>
1454280cb:     	movq	%rax, 0x188(%rbp)
1454280d2:     	movq	0x160(%rbp), %r8
1454280d9:     	movq	0x168(%rbp), %r9
1454280e0:     	leaq	0x12f8b58(%rip), %rcx   # 0x146720c3f
1454280e7:     	movl	$0x18, %edx
1454280ec:     	movq	%r8, 0x178(%rbp)
1454280f3:     	callq	0x1454546f0 <.text+0x54536f0>
1454280f8:     	nop
1454280f9:     	movq	0x188(%rbp), %rdx
145428100:     	testq	%rdx, %rdx
145428103:     	je	0x145428118 <.text+0x5427118>
145428105:     	movl	$0x1, %r8d
14542810b:     	movq	0x178(%rbp), %rcx
145428112:     	callq	0x1400021d0 <.text+0x11d0>
145428117:     	nop
145428118:     	leaq	-0x60(%rbp), %rcx
14542811c:     	callq	0x145423790 <.text+0x5422790>
145428121:     	nop
145428122:     	leaq	-0x60(%rbp), %rdx
145428126:     	movl	$0x1b8, %r8d            # imm = 0x1B8
14542812c:     	movq	%rsi, %rcx
14542812f:     	callq	0x145756ddd <.text+0x5755ddd>
145428134:     	movq	0x180(%rbp), %rdx
14542813b:     	testq	%rdx, %rdx
14542813e:     	je	0x14542805b <.text+0x542705b>
145428144:     	movl	$0x1, %r8d
14542814a:     	movq	0x170(%rbp), %rcx
145428151:     	callq	0x1400021d0 <.text+0x11d0>
145428156:     	jmp	0x14542805b <.text+0x542705b>
14542815b:     	leaq	0x12f8ad1(%rip), %rax   # 0x146720c33
145428162:     	movq	%rax, 0x8(%rsi)
145428166:     	movq	$0xc, 0x10(%rsi)
14542816e:     	jmp	0x145428054 <.text+0x5427054>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140287fc0:     	pushq	%r15
140287fc2:     	pushq	%r14
140287fc4:     	pushq	%r13
140287fc6:     	pushq	%r12
140287fc8:     	pushq	%rsi
140287fc9:     	pushq	%rdi
140287fca:     	pushq	%rbp
140287fcb:     	pushq	%rbx
140287fcc:     	subq	$0xc8, %rsp
140287fd3:     	movl	$0x1, %ebp
140287fd8:     	lock
140287fd9:     	xaddl	%ebp, 0x5b0(%r8)
140287fe1:     	cmpq	$-0x1, 0x40(%rdx)
140287fe6:     	je	0x1402881a9 <.text+0x2871a9>
140287fec:     	movq	%r8, %rbx
140287fef:     	movq	%rdx, %rsi
140287ff2:     	movq	0x5a0(%r8), %rax
140287ff9:     	movq	%rax, 0x40(%rsp)
140287ffe:     	cmpq	%rax, 0x2c0(%rdx)
140288005:     	jne	0x1402881c3 <.text+0x2871c3>
14028800b:     	movq	0x140(%rsi), %rax
140288012:     	movq	0x218(%rbx), %r9
140288019:     	cmpq	%r9, %rax
14028801c:     	jae	0x1402881f7 <.text+0x2871f7>
140288022:     	movq	0x210(%rbx), %rdx
140288029:     	movq	(%rdx,%rax,8), %r8
14028802d:     	testq	%r8, %r8
140288030:     	je	0x1402881f7 <.text+0x2871f7>
140288036:     	movq	0x1e0(%rbx), %rax
14028803d:     	notq	%r8
140288040:     	imulq	$0x38, %r8, %r15
140288044:     	cmpb	$0x0, 0x30(%rax,%r15)
14028804a:     	je	0x1402881f7 <.text+0x2871f7>
140288050:     	movq	%rcx, 0xc0(%rsp)
140288058:     	movq	0x148(%rsi), %r8
14028805f:     	cmpq	%r9, %r8
140288062:     	jae	0x1402881f7 <.text+0x2871f7>
140288068:     	movq	(%rdx,%r8,8), %rcx
14028806c:     	testq	%rcx, %rcx
14028806f:     	je	0x1402881f7 <.text+0x2871f7>
140288075:     	notq	%rcx
140288078:     	imulq	$0x38, %rcx, %r13
14028807c:     	cmpb	$0x0, 0x30(%rax,%r13)
140288082:     	je	0x1402881f7 <.text+0x2871f7>
140288088:     	addq	%rax, %r15
14028808b:     	movq	0x10(%r15), %rcx
14028808f:     	movq	%rcx, 0xb8(%rsp)
140288097:     	movl	0x2c8(%rsi), %r12d
14028809e:     	addq	%rax, %r13
1402880a1:     	leaq	0x2c(%r15), %r14
1402880a5:     	addq	$0x28, %r15
1402880a9:     	movq	0x10(%r13), %rdi
1402880ad:     	leaq	0x28(%r13), %rax
1402880b1:     	movq	%rax, 0xb0(%rsp)
1402880b9:     	addq	$0x2c, %r13
1402880bd:     	movq	%rsi, %rcx
1402880c0:     	movq	%rbx, %rdx
1402880c3:     	callq	0x14038f790 <.text+0x38e790>
1402880c8:     	leaq	0x150(%rsi), %rcx
1402880cf:     	movq	%rbx, %rdx
1402880d2:     	callq	0x140390490 <.text+0x38f490>
1402880d7:     	movq	0xb8(%rsp), %rax
1402880df:     	movq	%rax, 0x40(%rsp)
1402880e4:     	movq	%r15, 0x48(%rsp)
1402880e9:     	movq	%r14, 0x50(%rsp)
1402880ee:     	movl	%r12d, 0x58(%rsp)
1402880f3:     	movl	%ebp, 0x5c(%rsp)
1402880f7:     	leaq	0x60(%rsp), %r8
1402880fc:     	movq	%rdi, 0x60(%rsp)
140288101:     	movq	0xb0(%rsp), %rax
140288109:     	movq	%rax, 0x68(%rsp)
14028810e:     	movq	%r13, 0x70(%rsp)
140288113:     	movl	%r12d, 0x78(%rsp)
140288118:     	movl	%ebp, 0x7c(%rsp)
14028811c:     	leaq	0x80(%rsp), %r9
140288124:     	movq	%rsi, 0x80(%rsp)
14028812c:     	movq	%rbx, 0x88(%rsp)
140288134:     	movl	%r12d, 0x90(%rsp)
14028813c:     	movl	%ebp, 0x94(%rsp)
140288143:     	leaq	0x98(%rsp), %rax
14028814b:     	leaq	0x150(%rsi), %rcx
140288152:     	movq	%rcx, 0x98(%rsp)
14028815a:     	movq	%rbx, 0xa0(%rsp)
140288162:     	movl	%r12d, 0xa8(%rsp)
14028816a:     	movl	%ebp, 0xac(%rsp)
140288171:     	movq	%rax, 0x20(%rsp)
140288176:     	leaq	0x40(%rsp), %rdx
14028817b:     	callq	0x14027ca30 <.text+0x27ba30>
140288180:     	movl	%ebp, 0x2c8(%rsi)
140288186:     	movq	0xc0(%rsp), %rax
14028818e:     	movq	$-0x3, (%rax)
140288195:     	addq	$0xc8, %rsp
14028819c:     	popq	%rbx
14028819d:     	popq	%rbp
14028819e:     	popq	%rdi
14028819f:     	popq	%rsi
1402881a0:     	popq	%r12
1402881a2:     	popq	%r13
1402881a4:     	popq	%r14
1402881a6:     	popq	%r15
1402881a8:     	retq
1402881a9:     	leaq	0x5b39540(%rip), %rcx   # 0x145dc16f0
1402881b0:     	leaq	0x5b39599(%rip), %r8    # 0x145dc1750
1402881b7:     	movl	$0x59, %edx
1402881bc:     	callq	0x145d69700 <.text+0x5d68700>
1402881c1:     	ud2
1402881c3:     	addq	$0x2c0, %rsi            # imm = 0x2C0
1402881ca:     	leaq	0x5b39607(%rip), %rax   # 0x145dc17d8
1402881d1:     	movq	%rax, 0x28(%rsp)
1402881d6:     	movq	$0xdf, 0x20(%rsp)
1402881df:     	leaq	0x5b39582(%rip), %r9    # 0x145dc1768
1402881e6:     	leaq	0x40(%rsp), %r8
1402881eb:     	xorl	%ecx, %ecx
1402881ed:     	movq	%rsi, %rdx
1402881f0:     	callq	0x145d18b6d <.text+0x5d17b6d>
1402881f5:     	ud2
1402881f7:     	addq	$0x2cc, %rsi            # imm = 0x2CC
1402881fe:     	movq	%rsi, 0x40(%rsp)
140288203:     	leaq	0x4d5e466(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
14028820a:     	movq	%rax, 0x48(%rsp)
14028820f:     	leaq	0x3f(%rsp), %rcx
140288214:     	movq	%rcx, 0x50(%rsp)
140288219:     	movq	%rax, 0x58(%rsp)
14028821e:     	leaq	0x5b39133(%rip), %rcx   # 0x145dc1358
140288225:     	leaq	0x5b391cc(%rip), %r8    # 0x145dc13f8
14028822c:     	leaq	0x40(%rsp), %rdx
140288231:     	callq	0x145d699c0 <.text+0x5d689c0>
140288236:     	ud2

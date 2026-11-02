Disassembly of section .text:

0000000140001000 <.text>:
1458a20d0:     	pushq	%rbp
1458a20d1:     	pushq	%rsi
1458a20d2:     	pushq	%rdi
1458a20d3:     	pushq	%rbx
1458a20d4:     	subq	$0x88, %rsp
1458a20db:     	leaq	0x80(%rsp), %rbp
1458a20e3:     	movq	$-0x2, (%rbp)
1458a20eb:     	movq	%rcx, %rsi
1458a20ee:     	movq	0xb18(%rcx), %rcx
1458a20f5:     	testq	%rcx, %rcx
1458a20f8:     	je	0x1458a22c9 <.text+0x58a12c9>
1458a20fe:     	movq	0xb10(%rsi), %rax
1458a2105:     	imulq	$0xb0, %rcx, %rcx
1458a210c:     	xorl	%edi, %edi
1458a210e:     	xorl	%ebx, %ebx
1458a2110:     	cmpb	$0x0, 0xa8(%rax,%rbx)
1458a2118:     	jne	0x1458a212e <.text+0x58a112e>
1458a211a:     	incq	%rdi
1458a211d:     	addq	$0xb0, %rbx
1458a2124:     	cmpq	%rbx, %rcx
1458a2127:     	jne	0x1458a2110 <.text+0x58a1110>
1458a2129:     	jmp	0x1458a22c9 <.text+0x58a12c9>
1458a212e:     	movq	%rsi, %rcx
1458a2131:     	callq	0x1458a23f0 <.text+0x58a13f0>
1458a2136:     	cmpl	$0x2, 0x10(%rsi)
1458a213a:     	je	0x1458a214a <.text+0x58a114a>
1458a213c:     	leaq	0x10(%rsi), %rcx
1458a2140:     	movq	%rcx, -0x8(%rbp)
1458a2144:     	callq	0x1458950c0 <.text+0x58940c0>
1458a2149:     	nop
1458a214a:     	movq	$0x2, 0x10(%rsi)
1458a2152:     	movq	0xf18(%rsi), %rdx
1458a2159:     	cmpq	$-0x1, %rdx
1458a215d:     	je	0x1458a2198 <.text+0x58a1198>
1458a215f:     	testq	%rdx, %rdx
1458a2162:     	je	0x1458a2176 <.text+0x58a1176>
1458a2164:     	movq	0xf20(%rsi), %rcx
1458a216b:     	movl	$0x1, %r8d
1458a2171:     	callq	0x1400021d0 <.text+0x11d0>
1458a2176:     	movq	0xf30(%rsi), %rdx
1458a217d:     	testq	%rdx, %rdx
1458a2180:     	je	0x1458a2198 <.text+0x58a1198>
1458a2182:     	movq	0xf38(%rsi), %rcx
1458a2189:     	shlq	$0x4, %rdx
1458a218d:     	movl	$0x8, %r8d
1458a2193:     	callq	0x1400021d0 <.text+0x11d0>
1458a2198:     	movq	$-0x1, 0xf18(%rsi)
1458a21a3:     	movq	0xb18(%rsi), %rdx
1458a21aa:     	cmpq	%rdx, %rdi
1458a21ad:     	jae	0x1458a2303 <.text+0x58a1303>
1458a21b3:     	movq	0xb10(%rsi), %rax
1458a21ba:     	movb	$0x0, 0xa8(%rax,%rbx)
1458a21c2:     	callq	0x140002200 <.text+0x1200>
1458a21c7:     	movl	$0x20, %ecx
1458a21cc:     	movl	$0x1, %edx
1458a21d1:     	callq	0x1400021c0 <.text+0x11c0>
1458a21d6:     	testq	%rax, %rax
1458a21d9:     	je	0x1458a2314 <.text+0x58a1314>
1458a21df:     	movw	$0x4d, -0x18(%rbp)
1458a21e5:     	movq	$0x20, -0x30(%rbp)
1458a21ed:     	movq	%rax, -0x28(%rbp)
1458a21f1:     	movq	$0x0, -0x20(%rbp)
1458a21f9:     	movq	0xb10(%rsi), %rcx
1458a2200:     	movq	0xb18(%rsi), %rdx
1458a2207:     	leaq	-0x30(%rbp), %r9
1458a220b:     	movq	%rdi, %r8
1458a220e:     	callq	0x145897480 <.text+0x5896480>
1458a2213:     	movq	0x1090(%rsi), %rdi
1458a221a:     	movq	0x1098(%rsi), %rsi
1458a2221:     	callq	0x140002200 <.text+0x1200>
1458a2226:     	movl	$0x1, %ecx
1458a222b:     	movl	$0x1, %edx
1458a2230:     	callq	0x1400021c0 <.text+0x11c0>
1458a2235:     	testq	%rax, %rax
1458a2238:     	je	0x1458a2325 <.text+0x58a1325>
1458a223e:     	movb	$0x7b, (%rax)
1458a2241:     	movq	$0x1, -0x30(%rbp)
1458a2249:     	movq	%rax, -0x28(%rbp)
1458a224d:     	movq	$0x1, -0x20(%rbp)
1458a2255:     	movb	$0x1, -0x18(%rbp)
1458a2259:     	leaq	0x1344f48(%rip), %rax   # 0x146be71a8
1458a2260:     	movq	%rax, 0x20(%rsp)
1458a2265:     	movq	$0x6, 0x28(%rsp)
1458a226e:     	leaq	0x1344c8e(%rip), %r8    # 0x146be6f03
1458a2275:     	leaq	-0x50(%rbp), %rcx
1458a2279:     	leaq	-0x30(%rbp), %rdx
1458a227d:     	movl	$0x4, %r9d
1458a2283:     	callq	0x1458bd940 <.text+0x58bc940>
1458a2288:     	movq	-0x50(%rbp), %rax
1458a228c:     	movq	-0x40(%rbp), %r8
1458a2290:     	cmpq	%r8, %rax
1458a2293:     	je	0x1458a22d5 <.text+0x58a12d5>
1458a2295:     	movq	%rax, -0x8(%rbp)
1458a2299:     	movq	-0x48(%rbp), %rdx
1458a229d:     	movb	$0x7d, (%rdx,%r8)
1458a22a2:     	incq	%r8
1458a22a5:     	movq	%rdi, %rcx
1458a22a8:     	movq	%rdx, -0x10(%rbp)
1458a22ac:     	callq	*0x18(%rsi)
1458a22af:     	nop
1458a22b0:     	movq	-0x8(%rbp), %rdx
1458a22b4:     	testq	%rdx, %rdx
1458a22b7:     	je	0x1458a22c9 <.text+0x58a12c9>
1458a22b9:     	movl	$0x1, %r8d
1458a22bf:     	movq	-0x10(%rbp), %rcx
1458a22c3:     	callq	0x1400021d0 <.text+0x11d0>
1458a22c8:     	nop
1458a22c9:     	addq	$0x88, %rsp
1458a22d0:     	popq	%rbx
1458a22d1:     	popq	%rdi
1458a22d2:     	popq	%rsi
1458a22d3:     	popq	%rbp
1458a22d4:     	retq
1458a22d5:     	movq	$0x1, 0x20(%rsp)
1458a22de:     	leaq	-0x50(%rbp), %rcx
1458a22e2:     	movq	%r8, %rdx
1458a22e5:     	movl	$0x1, %r8d
1458a22eb:     	movl	$0x1, %r9d
1458a22f1:     	movq	%rdx, %rbx
1458a22f4:     	callq	0x145bf3940 <.text+0x5bf2940>
1458a22f9:     	nop
1458a22fa:     	movq	-0x50(%rbp), %rax
1458a22fe:     	movq	%rbx, %r8
1458a2301:     	jmp	0x1458a2295 <.text+0x58a1295>
1458a2303:     	leaq	0x1344e86(%rip), %r8    # 0x146be7190
1458a230a:     	movq	%rdi, %rcx
1458a230d:     	callq	0x145d93aa3 <.text+0x5d92aa3>
1458a2312:     	ud2
1458a2314:     	movl	$0x1, %ecx
1458a2319:     	movl	$0x20, %edx
1458a231e:     	callq	0x145d9370b <.text+0x5d9270b>
1458a2323:     	ud2
1458a2325:     	movl	$0x1, %ecx
1458a232a:     	movl	$0x1, %edx
1458a232f:     	callq	0x145d9370b <.text+0x5d9270b>
1458a2334:     	ud2

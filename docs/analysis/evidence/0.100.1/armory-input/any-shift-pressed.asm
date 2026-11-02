
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400320d0:     	pushq	%rsi
1400320d1:     	pushq	%rdi
1400320d2:     	pushq	%rbx
1400320d3:     	subq	$0x50, %rsp
1400320d7:     	movq	0x10(%rdx), %rax
1400320db:     	movq	%rax, 0x48(%rsp)
1400320e0:     	movups	(%rdx), %xmm0
1400320e3:     	movups	%xmm0, 0x38(%rsp)
1400320e8:     	movq	$0x0, 0x28(%rsp)
1400320f1:     	movq	$0x2, 0x30(%rsp)
1400320fa:     	cmpq	$0x0, 0x18(%rcx)
1400320ff:     	je	0x14003216f <.text+0x3116f>
140032101:     	leaq	0x38(%rsp), %r8
140032106:     	movl	0x38(%rsp), %edx
14003210a:     	testq	%rdx, %rdx
14003210d:     	je	0x140032179 <.text+0x31179>
14003210f:     	xorl	%eax, %eax
140032111:     	movabsq	$-0x623f01a31097210f, %rsi # imm = 0x9DC0FE5CEF68DEF1
14003211b:     	xorq	%rsi, %rdx
14003211e:     	movabsq	$-0x3f53d6483683af23, %rdi # imm = 0xC0AC29B7C97C50DD
140032128:     	xorq	%rdi, %rax
14003212b:     	mulq	%rdx
14003212e:     	xorq	%rax, %rdx
140032131:     	movq	%rcx, %rbx
140032134:     	callq	0x140031f60 <.text+0x30f60>
140032139:     	movq	%rax, %rcx
14003213c:     	movb	$0x1, %al
14003213e:     	testq	%rcx, %rcx
140032141:     	jne	0x140032171 <.text+0x31171>
140032143:     	leaq	0x44(%rsp), %r8
140032148:     	movl	0x44(%rsp), %edx
14003214c:     	testq	%rdx, %rdx
14003214f:     	je	0x1400321b8 <.text+0x311b8>
140032151:     	xorl	%eax, %eax
140032153:     	movq	%rbx, %rcx
140032156:     	xorq	%rsi, %rdx
140032159:     	xorq	%rdi, %rax
14003215c:     	mulq	%rdx
14003215f:     	xorq	%rax, %rdx
140032162:     	callq	0x140031f60 <.text+0x30f60>
140032167:     	testq	%rax, %rax
14003216a:     	setne	%al
14003216d:     	jmp	0x140032171 <.text+0x31171>
14003216f:     	xorl	%eax, %eax
140032171:     	addq	$0x50, %rsp
140032175:     	popq	%rbx
140032176:     	popq	%rdi
140032177:     	popq	%rsi
140032178:     	retq
140032179:     	movzwl	0x3e(%rsp), %r9d
14003217f:     	movl	0x40(%rsp), %r10d
140032184:     	movzwl	0x3c(%rsp), %eax
140032189:     	movq	%rax, %rdx
14003218c:     	shlq	$0x20, %rdx
140032190:     	leaq	0x58e0de1(%rip), %r11   # 0x145912f78
140032197:     	movslq	(%r11,%rax,4), %rsi
14003219b:     	addq	%r11, %rsi
14003219e:     	jmpq	*%rsi
1400321a0:     	shlq	$0x20, %r9
1400321a4:     	movq	%r9, %rax
1400321a7:     	jmp	0x140032111 <.text+0x31111>
1400321ac:     	shlq	$0x20, %r10
1400321b0:     	movq	%r10, %rax
1400321b3:     	jmp	0x140032111 <.text+0x31111>
1400321b8:     	movzwl	0x4a(%rsp), %r9d
1400321be:     	movl	0x4c(%rsp), %r10d
1400321c3:     	movzwl	0x48(%rsp), %eax
1400321c8:     	movq	%rax, %rdx
1400321cb:     	shlq	$0x20, %rdx
1400321cf:     	leaq	0x58e0db6(%rip), %rcx   # 0x145912f8c
1400321d6:     	movslq	(%rcx,%rax,4), %r11
1400321da:     	addq	%rcx, %r11
1400321dd:     	movq	%rbx, %rcx
1400321e0:     	jmpq	*%r11
1400321e3:     	shlq	$0x20, %r10
1400321e7:     	movq	%r10, %rax
1400321ea:     	jmp	0x140032156 <.text+0x31156>
1400321ef:     	shlq	$0x20, %r9
1400321f3:     	movq	%r9, %rax
1400321f6:     	jmp	0x140032156 <.text+0x31156>

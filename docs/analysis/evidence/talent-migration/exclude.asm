
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e2070:     	pushq	%r15
1458e2072:     	pushq	%r14
1458e2074:     	pushq	%r13
1458e2076:     	pushq	%r12
1458e2078:     	pushq	%rsi
1458e2079:     	pushq	%rdi
1458e207a:     	pushq	%rbp
1458e207b:     	pushq	%rbx
1458e207c:     	subq	$0x38, %rsp
1458e2080:     	movq	%r9, %rsi
1458e2083:     	movq	%r8, %r14
1458e2086:     	movl	%edx, %ebp
1458e2088:     	movq	%rcx, %rbx
1458e208b:     	movl	%edx, %ecx
1458e208d:     	movq	%r8, %rdx
1458e2090:     	movq	%r9, %r8
1458e2093:     	callq	0x1458e6190 <.text+0x58e5190>
1458e2098:     	testq	%rdx, %rdx
1458e209b:     	je	0x1458e2111 <.text+0x58e1111>
1458e209d:     	movzbl	0x70(%rdx), %edi
1458e20a1:     	cmpb	$0x6, %dil
1458e20a5:     	je	0x1458e20ad <.text+0x58e10ad>
1458e20a7:     	cmpb	$0x1, 0x73(%rdx)
1458e20ab:     	jne	0x1458e2111 <.text+0x58e1111>
1458e20ad:     	decb	%bpl
1458e20b0:     	cmpb	$0xa, %bpl
1458e20b4:     	ja	0x1458e2111 <.text+0x58e1111>
1458e20b6:     	movzbl	%bpl, %ecx
1458e20ba:     	movl	$0x5df, %edx            # imm = 0x5DF
1458e20bf:     	btl	%ecx, %edx
1458e20c2:     	jae	0x1458e2111 <.text+0x58e1111>
1458e20c4:     	leaq	0x1595ef5(%rip), %rdx   # 0x146e77fc0
1458e20cb:     	movq	(%rdx,%rcx,8), %rcx
1458e20cf:     	shlq	$0x6, %rax
1458e20d3:     	movq	0x38(%rcx,%rax), %rdx
1458e20d8:     	testq	%rdx, %rdx
1458e20db:     	je	0x1458e2111 <.text+0x58e1111>
1458e20dd:     	movq	0x10(%rbx), %r12
1458e20e1:     	testq	%r12, %r12
1458e20e4:     	je	0x1458e2111 <.text+0x58e1111>
1458e20e6:     	movq	%r14, 0x28(%rsp)
1458e20eb:     	movq	0x30(%rcx,%rax), %r13
1458e20f0:     	imulq	$0x78, %rdx, %rax
1458e20f4:     	addq	%r13, %rax
1458e20f7:     	movq	%rax, 0x30(%rsp)
1458e20fc:     	movq	0x8(%rbx), %rbp
1458e2100:     	shlq	$0x4, %r12
1458e2104:     	cmpb	$0x6, %dil
1458e2108:     	jne	0x1458e2140 <.text+0x58e1140>
1458e210a:     	xorl	%ebx, %ebx
1458e210c:     	jmp	0x1458e21bf <.text+0x58e11bf>
1458e2111:     	xorl	%ebx, %ebx
1458e2113:     	movq	%rbx, %rax
1458e2116:     	addq	$0x38, %rsp
1458e211a:     	popq	%rbx
1458e211b:     	popq	%rbp
1458e211c:     	popq	%rdi
1458e211d:     	popq	%rsi
1458e211e:     	popq	%r12
1458e2120:     	popq	%r13
1458e2122:     	popq	%r14
1458e2124:     	popq	%r15
1458e2126:     	retq
1458e2127:     	nopw	(%rax,%rax)
1458e2130:     	addq	$0x78, %r13
1458e2134:     	cmpq	0x30(%rsp), %r13
1458e2139:     	movl	$0x0, %ebx
1458e213e:     	je	0x1458e2113 <.text+0x58e1113>
1458e2140:     	cmpb	%dil, 0x70(%r13)
1458e2144:     	jne	0x1458e2130 <.text+0x58e1130>
1458e2146:     	movq	0x28(%r13), %r14
1458e214a:     	cmpq	%rsi, %r14
1458e214d:     	jne	0x1458e2164 <.text+0x58e1164>
1458e214f:     	movq	0x20(%r13), %rcx
1458e2153:     	movq	0x28(%rsp), %rdx
1458e2158:     	movq	%rsi, %r8
1458e215b:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e2160:     	testl	%eax, %eax
1458e2162:     	je	0x1458e2130 <.text+0x58e1130>
1458e2164:     	cmpb	$0x1, 0x73(%r13)
1458e2169:     	jne	0x1458e2130 <.text+0x58e1130>
1458e216b:     	movq	0x20(%r13), %r15
1458e216f:     	xorl	%ebx, %ebx
1458e2171:     	jmp	0x1458e2189 <.text+0x58e1189>
1458e2173:     	nopw	%cs:(%rax,%rax)
1458e2180:     	addq	$0x10, %rbx
1458e2184:     	cmpq	%rbx, %r12
1458e2187:     	je	0x1458e2130 <.text+0x58e1130>
1458e2189:     	movq	(%rbp,%rbx), %rax
1458e218e:     	cmpq	%r14, 0x28(%rax)
1458e2192:     	jne	0x1458e2180 <.text+0x58e1180>
1458e2194:     	movq	0x20(%rax), %rcx
1458e2198:     	movq	%r15, %rdx
1458e219b:     	movq	%r14, %r8
1458e219e:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e21a3:     	testl	%eax, %eax
1458e21a5:     	jne	0x1458e2180 <.text+0x58e1180>
1458e21a7:     	cmpb	$0x0, 0x8(%rbp,%rbx)
1458e21ac:     	je	0x1458e2130 <.text+0x58e1130>
1458e21ae:     	jmp	0x1458e221e <.text+0x58e121e>
1458e21b0:     	addq	$0x78, %r13
1458e21b4:     	cmpq	0x30(%rsp), %r13
1458e21b9:     	je	0x1458e2113 <.text+0x58e1113>
1458e21bf:     	cmpb	$0x6, 0x70(%r13)
1458e21c4:     	jne	0x1458e21b0 <.text+0x58e11b0>
1458e21c6:     	movq	0x20(%r13), %r14
1458e21ca:     	movq	0x28(%r13), %r15
1458e21ce:     	cmpq	%rsi, %r15
1458e21d1:     	jne	0x1458e21e7 <.text+0x58e11e7>
1458e21d3:     	movq	%r14, %rcx
1458e21d6:     	movq	0x28(%rsp), %rdx
1458e21db:     	movq	%rsi, %r8
1458e21de:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e21e3:     	testl	%eax, %eax
1458e21e5:     	je	0x1458e21b0 <.text+0x58e11b0>
1458e21e7:     	xorl	%edi, %edi
1458e21e9:     	jmp	0x1458e21f9 <.text+0x58e11f9>
1458e21eb:     	nopl	(%rax,%rax)
1458e21f0:     	addq	$0x10, %rdi
1458e21f4:     	cmpq	%rdi, %r12
1458e21f7:     	je	0x1458e21b0 <.text+0x58e11b0>
1458e21f9:     	movq	(%rbp,%rdi), %rax
1458e21fe:     	cmpq	%r15, 0x28(%rax)
1458e2202:     	jne	0x1458e21f0 <.text+0x58e11f0>
1458e2204:     	movq	0x20(%rax), %rcx
1458e2208:     	movq	%r14, %rdx
1458e220b:     	movq	%r15, %r8
1458e220e:     	callq	0x145bc9787 <.text+0x5bc8787>
1458e2213:     	testl	%eax, %eax
1458e2215:     	jne	0x1458e21f0 <.text+0x58e11f0>
1458e2217:     	cmpb	$0x0, 0x8(%rbp,%rdi)
1458e221c:     	je	0x1458e21b0 <.text+0x58e11b0>
1458e221e:     	movq	%r13, %rbx
1458e2221:     	jmp	0x1458e2113 <.text+0x58e1113>

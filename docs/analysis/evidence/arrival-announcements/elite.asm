
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14590e0d4:     	movq	0x338(%rbp), %rcx
14590e0db:     	movq	(%rcx,%rax,8), %r14
14590e0df:     	movl	$0x0, 0xa0(%rbp)
14590e0e9:     	leaq	0xa0(%rbp), %r8
14590e0f0:     	movq	%r13, %rcx
14590e0f3:     	movq	%r14, %rdx
14590e0f6:     	callq	0x145932fe0 <.text+0x5931fe0>
14590e0fb:     	nop
14590e0fc:     	movq	0x360(%rbp), %rdx
14590e103:     	cmpq	%rdx, %r14
14590e106:     	jae	0x145911939 <.text+0x5910939>
14590e10c:     	leaq	(%r14,%r14,4), %rsi
14590e110:     	shlq	$0x4, %rsi
14590e114:     	leaq	(%rdi,%rsi), %rax
14590e118:     	addq	$0x20, %rax
14590e11c:     	movq	%rax, 0x2e0(%rbp)
14590e123:     	leaq	0x29fe56(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
14590e12a:     	movq	%rax, 0x2e8(%rbp)
14590e131:     	leaq	0x1292c28(%rip), %rdx   # 0x146ba0d60
14590e138:     	leaq	0xa0(%rbp), %rcx
14590e13f:     	leaq	0x2e0(%rbp), %r8
14590e146:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14590e14b:     	nop
14590e14c:     	addq	%rsi, %rdi
14590e14f:     	movq	0xa8(%rbp), %rcx
14590e156:     	movq	0xb0(%rbp), %rdx
14590e15d:     	movq	0x10(%rdi), %r14
14590e161:     	movq	0x18(%rdi), %rax
14590e165:     	movq	%rax, 0x360(%rbp)
14590e16c:     	movq	%rcx, 0x318(%rbp)
14590e173:     	callq	0x1458da590 <.text+0x58d9590>
14590e178:     	nop
14590e179:     	movq	%rax, %r15
14590e17c:     	movq	%rdx, %rsi
14590e17f:     	movq	0xa0(%rbp), %rdx
14590e186:     	testq	%rdx, %rdx
14590e189:     	je	0x14590e19e <.text+0x590d19e>
14590e18b:     	movl	$0x1, %r8d
14590e191:     	movq	0x318(%rbp), %rcx
14590e198:     	callq	0x1400021d0 <.text+0x11d0>
14590e19d:     	nop
14590e19e:     	leaq	0x156bb43(%rip), %rdi   # 0x146e79ce8
14590e1a5:     	movl	$0xe, %edx
14590e1aa:     	movq	%rdi, %rcx
14590e1ad:     	callq	0x1458da590 <.text+0x58d9590>
14590e1b2:     	nop
14590e1b3:     	movq	0x378(%rbp), %r13
14590e1ba:     	testq	%r15, %r15
14590e1bd:     	cmoveq	0x360(%rbp), %rsi
14590e1c5:     	cmovneq	%r15, %r14
14590e1c9:     	testq	%rax, %rax
14590e1cc:     	cmovneq	%rax, %rdi
14590e1d0:     	movl	$0xe, %eax
14590e1d5:     	cmoveq	%rax, %rdx
14590e1d9:     	movq	%rdx, 0x20(%rsp)
14590e1de:     	leaq	0xa0(%rbp), %rcx
14590e1e5:     	movq	%r14, %rdx
14590e1e8:     	movq	%rsi, %r8
14590e1eb:     	movq	%rdi, %r9
14590e1ee:     	callq	0x1458a9500 <.text+0x58a8500>
14590e1f3:     	nop
14590e1f4:     	movq	0x5e0(%r13), %rsi
14590e1fb:     	cmpq	0x5d0(%r13), %rsi
14590e202:     	jne	0x14590e211 <.text+0x590d211>
14590e204:     	movq	0x350(%rbp), %rcx
14590e20b:     	callq	0x145bcb530 <.text+0x5bca530>
14590e210:     	nop
14590e211:     	movq	0x5d8(%r13), %rax
14590e218:     	movq	%rsi, %rcx
14590e21b:     	shlq	$0x5, %rcx
14590e21f:     	movups	0xa0(%rbp), %xmm0
14590e226:     	movups	0xb0(%rbp), %xmm1
14590e22d:     	movups	%xmm1, 0x10(%rax,%rcx)
14590e232:     	movups	%xmm0, (%rax,%rcx)
14590e236:     	incq	%rsi
14590e239:     	movq	%rsi, 0x5e0(%r13)
14590e240:     	movss	0x9ec(%r13), %xmm0
14590e249:     	movss	0x18(%rbp), %xmm1
14590e24e:     	mulss	0x156a24a(%rip), %xmm1  # 0x146e784a0
14590e256:     	addss	0x156a246(%rip), %xmm1  # 0x146e784a4
14590e25e:     	maxss	0x54da92(%rip), %xmm1   # 0x145e5bcf8
14590e266:     	addss	%xmm0, %xmm1
14590e26a:     	movss	%xmm1, 0xa2c(%r13)

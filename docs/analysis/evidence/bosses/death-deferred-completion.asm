
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454aa103:     	cmpl	$0x0, 0x858(%r13)
1454aa10b:     	movzbl	0x95f(%r13), %eax
1454aa113:     	je	0x1454aa235 <.text+0x54a9235>
1454aa119:     	cmpb	$0x1, %al
1454aa11b:     	jne	0x1454aa235 <.text+0x54a9235>
1454aa121:     	cmpb	$0x0, 0x952(%r13)
1454aa129:     	jne	0x1454aa235 <.text+0x54a9235>
1454aa12f:     	movb	$0x5, 0x95f(%r13)
1454aa137:     	movq	%r13, %rcx
1454aa13a:     	callq	0x145492fd0 <.text+0x5491fd0>
1454aa13f:     	movq	0x3d0(%r13), %rdx
1454aa146:     	movl	0x4b4(%r13), %r8d
1454aa14d:     	leaq	0xa0(%rbp), %rcx
1454aa154:     	callq	0x14543fb70 <.text+0x543eb70>
1454aa159:     	movq	0x548(%r13), %rsi
1454aa160:     	cmpq	0x538(%r13), %rsi
1454aa167:     	jne	0x1454aa176 <.text+0x54a9176>
1454aa169:     	movq	0x340(%rbp), %rcx
1454aa170:     	callq	0x1457580b0 <.text+0x57570b0>
1454aa175:     	nop
1454aa176:     	movq	0x540(%r13), %rax
1454aa17d:     	movq	%rsi, %rcx
1454aa180:     	shlq	$0x5, %rcx
1454aa184:     	movups	0xa0(%rbp), %xmm0
1454aa18b:     	movups	0xb0(%rbp), %xmm1
1454aa192:     	movups	%xmm1, 0x10(%rax,%rcx)
1454aa197:     	movups	%xmm0, (%rax,%rcx)
1454aa19b:     	incq	%rsi
1454aa19e:     	movq	%rsi, 0x548(%r13)
1454aa1a5:     	incl	0x4b4(%r13)
1454aa1ac:     	leaq	0x150062c(%rip), %r8    # 0x1469aa7df
1454aa1b3:     	leaq	0xa0(%rbp), %rcx
1454aa1ba:     	movl	$0x7, %r9d
1454aa1c0:     	movq	%r13, %rdx
1454aa1c3:     	callq	0x1454b6620 <.text+0x54b5620>
1454aa1c8:     	movq	0x560(%r13), %rsi
1454aa1cf:     	cmpq	0x550(%r13), %rsi
1454aa1d6:     	jne	0x1454aa201 <.text+0x54a9201>
1454aa1d8:     	leaq	0x550(%r13), %rcx
1454aa1df:     	movq	0xa0(%rbp), %rax
1454aa1e6:     	movq	%rax, 0x358(%rbp)
1454aa1ed:     	movq	0xa8(%rbp), %rax
1454aa1f4:     	movq	%rax, 0x340(%rbp)
1454aa1fb:     	callq	0x145757f60 <.text+0x5756f60>
1454aa200:     	nop
1454aa201:     	movq	0x558(%r13), %rax
1454aa208:     	leaq	(%rsi,%rsi,2), %rcx
1454aa20c:     	movq	0xb0(%rbp), %rdx
1454aa213:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454aa218:     	movups	0xa0(%rbp), %xmm0
1454aa21f:     	movups	%xmm0, (%rax,%rcx,8)
1454aa223:     	incq	%rsi
1454aa226:     	movq	%rsi, 0x560(%r13)
1454aa22d:     	movzbl	0x95f(%r13), %eax


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401a3020:     	pushq	%rbp
1401a3021:     	pushq	%r15
1401a3023:     	pushq	%r14
1401a3025:     	pushq	%r13
1401a3027:     	pushq	%r12
1401a3029:     	pushq	%rsi
1401a302a:     	pushq	%rdi
1401a302b:     	pushq	%rbx
1401a302c:     	subq	$0x58, %rsp
1401a3030:     	leaq	0x50(%rsp), %rbp
1401a3035:     	movq	$-0x2, (%rbp)
1401a303d:     	movq	%rdx, %rdi
1401a3040:     	movq	%rcx, %rsi
1401a3043:     	movq	(%rdx), %r14
1401a3046:     	movq	0x10(%rdx), %r15
1401a304a:     	cmpq	$-0x1, %r15
1401a304e:     	je	0x1401a307c <.text+0x1a207c>
1401a3050:     	movq	0x20(%rdi), %rax
1401a3054:     	cmpl	$0x2, %r14d
1401a3058:     	jne	0x1401a3087 <.text+0x1a2087>
1401a305a:     	cmpl	$-0x1, %eax
1401a305d:     	je	0x1401a30ac <.text+0x1a20ac>
1401a305f:     	xorl	%r12d, %r12d
1401a3062:     	cmpq	$0x2, %rax
1401a3066:     	cmoveq	%r12, %rax
1401a306a:     	cmpq	$0x2, %r15
1401a306e:     	cmovneq	%r15, %r12
1401a3072:     	addq	%rax, %r12
1401a3075:     	testq	%r12, %r12
1401a3078:     	jne	0x1401a30ba <.text+0x1a20ba>
1401a307a:     	jmp	0x1401a30f8 <.text+0x1a20f8>
1401a307c:     	movq	%r14, %r12
1401a307f:     	cmpl	$0x2, %r14d
1401a3083:     	je	0x1401a30f8 <.text+0x1a20f8>
1401a3085:     	jmp	0x1401a30b5 <.text+0x1a20b5>
1401a3087:     	xorl	%r12d, %r12d
1401a308a:     	cmpl	$-0x1, %eax
1401a308d:     	je	0x1401a30e8 <.text+0x1a20e8>
1401a308f:     	cmpq	$0x2, %rax
1401a3093:     	cmoveq	%r12, %rax
1401a3097:     	cmpq	$0x2, %r15
1401a309b:     	cmovneq	%r15, %r12
1401a309f:     	addq	%rax, %r12
1401a30a2:     	addq	%r14, %r12
1401a30a5:     	testq	%r12, %r12
1401a30a8:     	jne	0x1401a30ba <.text+0x1a20ba>
1401a30aa:     	jmp	0x1401a30f8 <.text+0x1a20f8>
1401a30ac:     	movq	%r15, %r12
1401a30af:     	cmpl	$0x2, %r15d
1401a30b3:     	je	0x1401a30f8 <.text+0x1a20f8>
1401a30b5:     	testq	%r12, %r12
1401a30b8:     	je	0x1401a30f8 <.text+0x1a20f8>
1401a30ba:     	leaq	(,%r12,8), %rbx
1401a30c2:     	callq	0x140002200 <.text+0x1200>
1401a30c7:     	movl	$0x8, %edx
1401a30cc:     	movq	%rbx, %rcx
1401a30cf:     	callq	0x1400021c0 <.text+0x11c0>
1401a30d4:     	testq	%rax, %rax
1401a30d7:     	jne	0x1401a3100 <.text+0x1a2100>
1401a30d9:     	movl	$0x8, %ecx
1401a30de:     	movq	%rbx, %rdx
1401a30e1:     	callq	0x14590379b <.text+0x590279b>
1401a30e6:     	ud2
1401a30e8:     	cmpq	$0x2, %r15
1401a30ec:     	cmovneq	%r15, %r12
1401a30f0:     	addq	%r14, %r12
1401a30f3:     	testq	%r12, %r12
1401a30f6:     	jne	0x1401a30ba <.text+0x1a20ba>
1401a30f8:     	movl	$0x8, %eax
1401a30fd:     	xorl	%r12d, %r12d
1401a3100:     	movq	%r12, -0x18(%rbp)
1401a3104:     	movq	%rax, -0x10(%rbp)
1401a3108:     	movq	$0x0, -0x8(%rbp)
1401a3110:     	movq	0x8(%rdi), %rbx
1401a3114:     	movq	0x18(%rdi), %rcx
1401a3118:     	movq	%rcx, -0x20(%rbp)
1401a311c:     	movq	0x20(%rdi), %r13
1401a3120:     	cmpl	$-0x1, %r15d
1401a3124:     	je	0x1401a314d <.text+0x1a214d>
1401a3126:     	cmpl	$0x2, %r14d
1401a312a:     	jne	0x1401a3158 <.text+0x1a2158>
1401a312c:     	cmpq	$-0x1, %r13
1401a3130:     	je	0x1401a3179 <.text+0x1a2179>
1401a3132:     	xorl	%r8d, %r8d
1401a3135:     	cmpq	$0x2, %r13
1401a3139:     	movq	%r13, %rcx
1401a313c:     	cmoveq	%r8, %rcx
1401a3140:     	cmpq	$0x2, %r15
1401a3144:     	cmovneq	%r15, %r8
1401a3148:     	addq	%rcx, %r8
1401a314b:     	jmp	0x1401a3191 <.text+0x1a2191>
1401a314d:     	movq	%r14, %r8
1401a3150:     	cmpl	$0x2, %r14d
1401a3154:     	jne	0x1401a3191 <.text+0x1a2191>
1401a3156:     	jmp	0x1401a3182 <.text+0x1a2182>
1401a3158:     	xorl	%r8d, %r8d
1401a315b:     	cmpq	$-0x1, %r13
1401a315f:     	je	0x1401a3186 <.text+0x1a2186>
1401a3161:     	cmpq	$0x2, %r13
1401a3165:     	movq	%r13, %rcx
1401a3168:     	cmoveq	%r8, %rcx
1401a316c:     	cmpq	$0x2, %r15
1401a3170:     	cmovneq	%r15, %r8
1401a3174:     	addq	%rcx, %r8
1401a3177:     	jmp	0x1401a318e <.text+0x1a218e>
1401a3179:     	movq	%r15, %r8
1401a317c:     	cmpl	$0x2, %r15d
1401a3180:     	jne	0x1401a3191 <.text+0x1a2191>
1401a3182:     	xorl	%ecx, %ecx
1401a3184:     	jmp	0x1401a31e4 <.text+0x1a21e4>
1401a3186:     	cmpq	$0x2, %r15
1401a318a:     	cmovneq	%r15, %r8
1401a318e:     	addq	%r14, %r8
1401a3191:     	cmpq	%r12, %r8
1401a3194:     	ja	0x1401a3207 <.text+0x1a2207>
1401a3196:     	xorl	%ecx, %ecx
1401a3198:     	cmpl	$-0x1, %r15d
1401a319c:     	je	0x1401a31d7 <.text+0x1a21d7>
1401a319e:     	movq	0x28(%rdi), %rdx
1401a31a2:     	incq	%r13
1401a31a5:     	cmpq	$0x3, %r13
1401a31a9:     	ja	0x1401a31c7 <.text+0x1a21c7>
1401a31ab:     	cmpq	$0x2, %r13
1401a31af:     	je	0x1401a31c7 <.text+0x1a21c7>
1401a31b1:     	testq	$-0x3, %r15
1401a31b8:     	je	0x1401a31d7 <.text+0x1a21d7>
1401a31ba:     	movq	-0x20(%rbp), %rdx
1401a31be:     	movq	%rdx, (%rax,%rcx,8)
1401a31c2:     	incq	%rcx
1401a31c5:     	jmp	0x1401a31d7 <.text+0x1a21d7>
1401a31c7:     	movq	%rdx, (%rax,%rcx,8)
1401a31cb:     	incq	%rcx
1401a31ce:     	testq	$-0x3, %r15
1401a31d5:     	jne	0x1401a31ba <.text+0x1a21ba>
1401a31d7:     	cmpl	$0x1, %r14d
1401a31db:     	jne	0x1401a31e4 <.text+0x1a21e4>
1401a31dd:     	movq	%rbx, (%rax,%rcx,8)
1401a31e1:     	incq	%rcx
1401a31e4:     	movq	%rcx, -0x8(%rbp)
1401a31e8:     	movq	%rcx, 0x10(%rsi)
1401a31ec:     	movups	-0x18(%rbp), %xmm0
1401a31f0:     	movups	%xmm0, (%rsi)
1401a31f3:     	movq	%rsi, %rax
1401a31f6:     	addq	$0x58, %rsp
1401a31fa:     	popq	%rbx
1401a31fb:     	popq	%rdi
1401a31fc:     	popq	%rsi
1401a31fd:     	popq	%r12
1401a31ff:     	popq	%r13
1401a3201:     	popq	%r14
1401a3203:     	popq	%r15
1401a3205:     	popq	%rbp
1401a3206:     	retq
1401a3207:     	movq	$0x8, 0x20(%rsp)
1401a3210:     	leaq	-0x18(%rbp), %rcx
1401a3214:     	movl	$0x8, %r9d
1401a321a:     	xorl	%edx, %edx
1401a321c:     	callq	0x1457744b0 <.text+0x57734b0>
1401a3221:     	nop
1401a3222:     	movq	-0x10(%rbp), %rax
1401a3226:     	movq	-0x8(%rbp), %rcx
1401a322a:     	cmpl	$-0x1, %r15d
1401a322e:     	jne	0x1401a319e <.text+0x1a219e>
1401a3234:     	jmp	0x1401a31d7 <.text+0x1a21d7>

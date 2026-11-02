
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145925e50:     	pushq	%rbp
145925e51:     	pushq	%r15
145925e53:     	pushq	%r14
145925e55:     	pushq	%r13
145925e57:     	pushq	%r12
145925e59:     	pushq	%rsi
145925e5a:     	pushq	%rdi
145925e5b:     	pushq	%rbx
145925e5c:     	subq	$0x118, %rsp            # imm = 0x118
145925e63:     	leaq	0x80(%rsp), %rbp
145925e6b:     	movq	$-0x2, 0x90(%rbp)
145925e76:     	movq	%rdx, %rdi
145925e79:     	movq	%rcx, %r12
145925e7c:     	movss	0x9ec(%rdx), %xmm0
145925e84:     	movss	%xmm0, -0x4(%rbp)
145925e89:     	movq	$0x0, 0x28(%rsp)
145925e92:     	movq	$0x8, 0x20(%rsp)
145925e9b:     	movq	%rbp, %rcx
145925e9e:     	callq	0x145925c80 <.text+0x5924c80>
145925ea3:     	movq	(%rbp), %rax
145925ea7:     	movq	0x8(%rbp), %rcx
145925eab:     	movq	0x10(%rbp), %rdx
145925eaf:     	leaq	(%rcx,%rdx,8), %rdx
145925eb3:     	movq	%rcx, (%rbp)
145925eb7:     	movq	%rcx, 0x8(%rbp)
145925ebb:     	movq	%rax, 0x10(%rbp)
145925ebf:     	movq	%rdx, 0x18(%rbp)
145925ec3:     	movq	%rdi, 0x20(%rbp)
145925ec7:     	leaq	-0x4(%rbp), %rax
145925ecb:     	movq	%rax, 0x28(%rbp)
145925ecf:     	leaq	0x68(%rbp), %rcx
145925ed3:     	movq	%rbp, %rdx
145925ed6:     	callq	0x14599eb80 <.text+0x599db80>
145925edb:     	movq	0x70(%rbp), %r14
145925edf:     	movq	0x78(%rbp), %r13
145925ee3:     	leaq	0x8c(%rbp), %rax
145925eea:     	movq	%rax, (%rbp)
145925eee:     	cmpq	$0x2, %r13
145925ef2:     	jae	0x145926180 <.text+0x5925180>
145925ef8:     	testq	%r13, %r13
145925efb:     	je	0x145925f29 <.text+0x5924f29>
145925efd:     	movq	%r13, %rax
145925f00:     	shlq	$0x5, %rax
145925f04:     	xorl	%esi, %esi
145925f06:     	xorl	%ecx, %ecx
145925f08:     	nopl	(%rax,%rax)
145925f10:     	cmpb	$0x3, 0x10(%r14,%rcx)
145925f16:     	je	0x145925f2b <.text+0x5924f2b>
145925f18:     	incq	%rsi
145925f1b:     	addq	$0x20, %rcx
145925f1f:     	cmpq	%rcx, %rax
145925f22:     	jne	0x145925f10 <.text+0x5924f10>
145925f24:     	movq	%r13, %rsi
145925f27:     	jmp	0x145925f2b <.text+0x5924f2b>
145925f29:     	xorl	%esi, %esi
145925f2b:     	movq	%r13, %rbx
145925f2e:     	subq	%rsi, %rbx
145925f31:     	shlq	$0x5, %rbx
145925f35:     	movq	%r13, %rdi
145925f38:     	movl	$0x8, %eax
145925f3d:     	subq	%rsi, %rdi
145925f40:     	je	0x145925f5d <.text+0x5924f5d>
145925f42:     	callq	0x140002200 <.text+0x1200>
145925f47:     	movl	$0x8, %edx
145925f4c:     	movq	%rbx, %rcx
145925f4f:     	callq	0x1400021c0 <.text+0x11c0>
145925f54:     	testq	%rax, %rax
145925f57:     	je	0x145926372 <.text+0x5925372>
145925f5d:     	movq	%rdi, 0x30(%rbp)
145925f61:     	movq	%rsi, 0x78(%rbp)
145925f65:     	movq	%rsi, %r15
145925f68:     	shlq	$0x5, %r15
145925f6c:     	leaq	(%r14,%r15), %rdx
145925f70:     	movq	%rax, 0x38(%rbp)
145925f74:     	movq	%rax, %rcx
145925f77:     	movq	%rbx, -0x10(%rbp)
145925f7b:     	movq	%rbx, %r8
145925f7e:     	callq	0x145bc977b <.text+0x5bc877b>
145925f83:     	testq	%rsi, %rsi
145925f86:     	je	0x145925fc3 <.text+0x5924fc3>
145925f88:     	movq	%rsi, 0x80(%rbp)
145925f8f:     	xorl	%ebx, %ebx
145925f91:     	xorl	%esi, %esi
145925f93:     	nopw	%cs:(%rax,%rax)
145925fa0:     	cmpb	$0x2, 0x10(%r14,%rsi)
145925fa6:     	je	0x145925fca <.text+0x5924fca>
145925fa8:     	incq	%rbx
145925fab:     	addq	$0x20, %rsi
145925faf:     	cmpq	%rsi, %r15
145925fb2:     	jne	0x145925fa0 <.text+0x5924fa0>
145925fb4:     	movq	0x80(%rbp), %rsi
145925fbb:     	movq	%rsi, %rbx
145925fbe:     	jmp	0x145926144 <.text+0x5925144>
145925fc3:     	xorl	%ebx, %ebx
145925fc5:     	jmp	0x145926144 <.text+0x5925144>
145925fca:     	movq	%r13, 0x60(%rbp)
145925fce:     	movq	%r12, -0x18(%rbp)
145925fd2:     	movl	0xc(%r14,%rsi), %eax
145925fd7:     	movl	%eax, -0x20(%rbp)
145925fda:     	movq	0x4(%r14,%rsi), %rax
145925fdf:     	movq	%rax, -0x28(%rbp)
145925fe3:     	movq	%r15, %r13
145925fe6:     	subq	%rsi, %r13
145925fe9:     	callq	0x140002200 <.text+0x1200>
145925fee:     	movl	$0x8, %edx
145925ff3:     	movq	%r13, %rcx
145925ff6:     	callq	0x1400021c0 <.text+0x11c0>
145925ffb:     	testq	%rax, %rax
145925ffe:     	je	0x145926382 <.text+0x5925382>
145926004:     	movq	%rax, %r12
145926007:     	leaq	(%r14,%rsi), %rdx
14592600b:     	movq	0x80(%rbp), %rdi
145926012:     	subq	%rbx, %rdi
145926015:     	movq	%rbx, 0x78(%rbp)
145926019:     	movq	%rax, %rcx
14592601c:     	movq	%r13, %r8
14592601f:     	callq	0x145bc977b <.text+0x5bc877b>
145926024:     	addq	%r12, %r15
145926027:     	subq	%rsi, %r15
14592602a:     	movq	%r12, -0x48(%rbp)
14592602e:     	movq	%rdi, -0x38(%rbp)
145926032:     	movq	%r12, -0x40(%rbp)
145926036:     	movq	%r15, -0x30(%rbp)
14592603a:     	movb	$0x1, 0x8f(%rbp)
145926041:     	movq	%rbp, %rcx
145926044:     	leaq	-0x48(%rbp), %rdx
145926048:     	leaq	-0x28(%rbp), %r8
14592604c:     	callq	0x1459adf00 <.text+0x59acf00>
145926051:     	nop
145926052:     	movq	(%rbp), %rax
145926056:     	movq	%rax, 0x50(%rbp)
14592605a:     	movq	0x8(%rbp), %rax
14592605e:     	movq	%rax, 0x58(%rbp)
145926062:     	movq	0x10(%rbp), %r12
145926066:     	movq	0x18(%rbp), %rax
14592606a:     	movq	%rax, 0x48(%rbp)
14592606e:     	movq	0x20(%rbp), %rax
145926072:     	movq	%rax, 0x40(%rbp)
145926076:     	movq	0x28(%rbp), %r15
14592607a:     	leaq	0x8c(%rbp), %rax
145926081:     	movq	%rax, (%rbp)
145926085:     	cmpq	$0x2, %r12
145926089:     	jae	0x1459262e7 <.text+0x59252e7>
14592608f:     	movq	0x68(%rbp), %rax
145926093:     	subq	%rbx, %rax
145926096:     	cmpq	%rax, %r12
145926099:     	ja	0x14592630b <.text+0x592530b>
14592609f:     	testq	%r12, %r12
1459260a2:     	je	0x1459260be <.text+0x59250be>
1459260a4:     	movq	%r12, %r8
1459260a7:     	shlq	$0x5, %r8
1459260ab:     	movq	%rbx, %rcx
1459260ae:     	shlq	$0x5, %rcx
1459260b2:     	addq	%r14, %rcx
1459260b5:     	movq	0x58(%rbp), %rdx
1459260b9:     	callq	0x145bc977b <.text+0x5bc877b>
1459260be:     	addq	%r12, %rbx
1459260c1:     	movq	%rbx, 0x78(%rbp)
1459260c5:     	movq	0x50(%rbp), %rdx
1459260c9:     	testq	%rdx, %rdx
1459260cc:     	movq	0x60(%rbp), %r13
1459260d0:     	movq	0x80(%rbp), %rsi
1459260d7:     	je	0x1459260ec <.text+0x59250ec>
1459260d9:     	shlq	$0x5, %rdx
1459260dd:     	movl	$0x8, %r8d
1459260e3:     	movq	0x58(%rbp), %rcx
1459260e7:     	callq	0x1400021d0 <.text+0x11d0>
1459260ec:     	movq	0x68(%rbp), %rax
1459260f0:     	subq	%rbx, %rax
1459260f3:     	cmpq	%rax, %r15
1459260f6:     	movq	-0x18(%rbp), %r12
1459260fa:     	movq	0x40(%rbp), %rdi
1459260fe:     	ja	0x145926337 <.text+0x5925337>
145926104:     	testq	%r15, %r15
145926107:     	je	0x145926122 <.text+0x5925122>
145926109:     	movq	%r15, %r8
14592610c:     	shlq	$0x5, %r8
145926110:     	movq	%rbx, %rcx
145926113:     	shlq	$0x5, %rcx
145926117:     	addq	%r14, %rcx
14592611a:     	movq	%rdi, %rdx
14592611d:     	callq	0x145bc977b <.text+0x5bc877b>
145926122:     	addq	%r15, %rbx
145926125:     	movq	%rbx, 0x78(%rbp)
145926129:     	movq	0x48(%rbp), %rdx
14592612d:     	testq	%rdx, %rdx
145926130:     	je	0x145926144 <.text+0x5925144>
145926132:     	shlq	$0x5, %rdx
145926136:     	movl	$0x8, %r8d
14592613c:     	movq	%rdi, %rcx
14592613f:     	callq	0x1400021d0 <.text+0x11d0>
145926144:     	movq	-0x10(%rbp), %r14
145926148:     	shrq	$0x5, %r14
14592614c:     	movq	0x68(%rbp), %rax
145926150:     	subq	%rbx, %rax
145926153:     	cmpq	%rax, %r14
145926156:     	ja	0x1459261a3 <.text+0x59251a3>
145926158:     	cmpq	%rsi, %r13
14592615b:     	jne	0x1459261dc <.text+0x59251dc>
14592615d:     	leaq	(%rbx,%r14), %rdi
145926161:     	cmpq	%rsi, %r13
145926164:     	jne	0x145926201 <.text+0x5925201>
14592616a:     	movq	0x68(%rbp), %rcx
14592616e:     	movq	0x70(%rbp), %rax
145926172:     	testq	%rdi, %rdi
145926175:     	jne	0x145926229 <.text+0x5925229>
14592617b:     	jmp	0x1459262c1 <.text+0x59252c1>
145926180:     	cmpq	$0x15, %r13
145926184:     	jae	0x145926399 <.text+0x5925399>
14592618a:     	movq	%rbp, %r9
14592618d:     	movl	$0x1, %r8d
145926193:     	movq	%r14, %rcx
145926196:     	movq	%r13, %rdx
145926199:     	callq	0x145982030 <.text+0x5981030>
14592619e:     	jmp	0x145925efd <.text+0x5924efd>
1459261a3:     	movq	%rsi, 0x80(%rbp)
1459261aa:     	movq	%r13, 0x60(%rbp)
1459261ae:     	movq	$0x20, 0x20(%rsp)
1459261b7:     	leaq	0x68(%rbp), %rcx
1459261bb:     	movl	$0x8, %r9d
1459261c1:     	movq	%rbx, %rdx
1459261c4:     	movq	%r14, %r8
1459261c7:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459261cc:     	nop
1459261cd:     	movq	0x78(%rbp), %rbx
1459261d1:     	movq	0x60(%rbp), %r13
1459261d5:     	movq	0x80(%rbp), %rsi
1459261dc:     	movq	%rbx, %rcx
1459261df:     	shlq	$0x5, %rcx
1459261e3:     	addq	0x70(%rbp), %rcx
1459261e7:     	movq	0x38(%rbp), %rdx
1459261eb:     	movq	-0x10(%rbp), %r8
1459261ef:     	callq	0x145bc977b <.text+0x5bc877b>
1459261f4:     	leaq	(%rbx,%r14), %rdi
1459261f8:     	cmpq	%rsi, %r13
1459261fb:     	je	0x14592616a <.text+0x592516a>
145926201:     	movq	0x30(%rbp), %rdx
145926205:     	shlq	$0x5, %rdx
145926209:     	movl	$0x8, %r8d
14592620f:     	movq	0x38(%rbp), %rcx
145926213:     	callq	0x1400021d0 <.text+0x11d0>
145926218:     	movq	0x68(%rbp), %rcx
14592621c:     	movq	0x70(%rbp), %rax
145926220:     	testq	%rdi, %rdi
145926223:     	je	0x1459262c1 <.text+0x59252c1>
145926229:     	leaq	(%rbx,%r14), %r8
14592622d:     	decq	%r8
145926230:     	movl	%edi, %edx
145926232:     	andl	$0x3, %edx
145926235:     	cmpq	$0x3, %r8
145926239:     	jae	0x145926240 <.text+0x5925240>
14592623b:     	xorl	%r8d, %r8d
14592623e:     	jmp	0x145926294 <.text+0x5925294>
145926240:     	movabsq	$0x3fffffffffffffc, %r9 # imm = 0x3FFFFFFFFFFFFFC
14592624a:     	andq	%rdi, %r9
14592624d:     	leaq	0x78(%rax), %r10
145926251:     	xorl	%r8d, %r8d
145926254:     	nopw	%cs:(%rax,%rax)
145926260:     	movq	-0x60(%r10), %r11
145926264:     	movq	%r11, (%rax,%r8,8)
145926268:     	movq	-0x40(%r10), %r11
14592626c:     	movq	%r11, 0x8(%rax,%r8,8)
145926271:     	movq	-0x20(%r10), %r11
145926275:     	movq	%r11, 0x10(%rax,%r8,8)
14592627a:     	movq	(%r10), %r11
14592627d:     	movq	%r11, 0x18(%rax,%r8,8)
145926282:     	addq	$0x4, %r8
145926286:     	subq	$-0x80, %r10
14592628a:     	cmpq	%r8, %r9
14592628d:     	jne	0x145926260 <.text+0x5925260>
14592628f:     	testq	%rdx, %rdx
145926292:     	je	0x1459262c1 <.text+0x59252c1>
145926294:     	leaq	(%rax,%r8,8), %r9
145926298:     	shlq	$0x5, %r8
14592629c:     	addq	%rax, %r8
14592629f:     	addq	$0x18, %r8
1459262a3:     	shll	$0x3, %edx
1459262a6:     	xorl	%r10d, %r10d
1459262a9:     	nopl	(%rax)
1459262b0:     	movq	(%r8,%r10,4), %r11
1459262b4:     	movq	%r11, (%r9,%r10)
1459262b8:     	addq	$0x8, %r10
1459262bc:     	cmpq	%r10, %rdx
1459262bf:     	jne	0x1459262b0 <.text+0x59252b0>
1459262c1:     	shlq	$0x2, %rcx
1459262c5:     	movq	%rcx, (%r12)
1459262c9:     	movq	%rax, 0x8(%r12)
1459262ce:     	movq	%rdi, 0x10(%r12)
1459262d3:     	addq	$0x118, %rsp            # imm = 0x118
1459262da:     	popq	%rbx
1459262db:     	popq	%rdi
1459262dc:     	popq	%rsi
1459262dd:     	popq	%r12
1459262df:     	popq	%r13
1459262e1:     	popq	%r14
1459262e3:     	popq	%r15
1459262e5:     	popq	%rbp
1459262e6:     	retq
1459262e7:     	cmpq	$0x15, %r12
1459262eb:     	jae	0x1459263ad <.text+0x59253ad>
1459262f1:     	movq	%rbp, %r9
1459262f4:     	movl	$0x1, %r8d
1459262fa:     	movq	0x58(%rbp), %rcx
1459262fe:     	movq	%r12, %rdx
145926301:     	callq	0x141578a90 <.text+0x1577a90>
145926306:     	jmp	0x14592608f <.text+0x592508f>
14592630b:     	movq	$0x20, 0x20(%rsp)
145926314:     	leaq	0x68(%rbp), %rcx
145926318:     	movl	$0x8, %r9d
14592631e:     	movq	%rbx, %rdx
145926321:     	movq	%r12, %r8
145926324:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
145926329:     	nop
14592632a:     	movq	0x70(%rbp), %r14
14592632e:     	movq	0x78(%rbp), %rbx
145926332:     	jmp	0x1459260a4 <.text+0x59250a4>
145926337:     	movq	$0x20, 0x20(%rsp)
145926340:     	leaq	0x68(%rbp), %rcx
145926344:     	movl	$0x8, %r9d
14592634a:     	movq	%rbx, %rdx
14592634d:     	movq	%r15, %r8
145926350:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
145926355:     	nop
145926356:     	movq	0x70(%rbp), %r14
14592635a:     	movq	0x78(%rbp), %rbx
14592635e:     	movq	0x60(%rbp), %r13
145926362:     	movq	0x80(%rbp), %rsi
145926369:     	movq	0x40(%rbp), %rdi
14592636d:     	jmp	0x145926109 <.text+0x5925109>
145926372:     	movl	$0x8, %ecx
145926377:     	movq	%rbx, %rdx
14592637a:     	callq	0x145d6944b <.text+0x5d6844b>
14592637f:     	nop
145926380:     	jmp	0x145926397 <.text+0x5925397>
145926382:     	movb	$0x1, 0x8f(%rbp)
145926389:     	movl	$0x8, %ecx
14592638e:     	movq	%r13, %rdx
145926391:     	callq	0x145d6944b <.text+0x5d6844b>
145926396:     	nop
145926397:     	ud2
145926399:     	movq	%rbp, %r8
14592639c:     	movq	%r14, %rcx
14592639f:     	movq	%r13, %rdx
1459263a2:     	callq	0x145988550 <.text+0x5987550>
1459263a7:     	nop
1459263a8:     	jmp	0x145925efd <.text+0x5924efd>
1459263ad:     	movb	$0x0, 0x8e(%rbp)
1459263b4:     	movb	$0x1, 0x8d(%rbp)
1459263bb:     	movq	%rbp, %r8
1459263be:     	movq	0x58(%rbp), %rcx
1459263c2:     	movq	%r12, %rdx
1459263c5:     	callq	0x1459886f0 <.text+0x59876f0>
1459263ca:     	nop
1459263cb:     	jmp	0x14592608f <.text+0x592508f>

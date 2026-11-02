
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454aa235:     	movl	0x8f8(%r13), %edi
1454aa23c:     	testl	%edi, %edi
1454aa23e:     	je	0x1454aa34c <.text+0x54a934c>
1454aa244:     	cmpb	$0x1, %al
1454aa246:     	jne	0x1454aa34c <.text+0x54a934c>
1454aa24c:     	movl	$0x0, 0x8f8(%r13)
1454aa257:     	movss	0x441299(%rip), %xmm6   # 0x1458eb4f8
1454aa25f:     	movss	0x44eb7d(%rip), %xmm7   # 0x1458f8de4
1454aa267:     	movss	0x441298(%rip), %xmm8   # 0x1458eb508
1454aa270:     	xorps	%xmm9, %xmm9
1454aa274:     	movss	0x44129f(%rip), %xmm10  # 0x1458eb51c
1454aa27d:     	jmp	0x1454aa296 <.text+0x54a9296>
1454aa27f:     	nop
1454aa280:     	cmpl	$0x1, %edx
1454aa283:     	adcl	$0x0, %edx
1454aa286:     	movq	%r13, %rcx
1454aa289:     	callq	0x1454b4920 <.text+0x54b3920>
1454aa28e:     	decl	%edi
1454aa290:     	je	0x1454aa321 <.text+0x54a9321>
1454aa296:     	incl	0x8f4(%r13)
1454aa29d:     	movl	0x3f8(%r13), %eax
1454aa2a4:     	cmpl	$0x1, %eax
1454aa2a7:     	adcl	$-0x1, %eax
1454aa2aa:     	xorps	%xmm1, %xmm1
1454aa2ad:     	cvtsi2ss	%rax, %xmm1
1454aa2b2:     	movaps	%xmm1, %xmm0
1454aa2b5:     	mulss	%xmm8, %xmm0
1454aa2ba:     	mulss	%xmm1, %xmm0
1454aa2be:     	mulss	%xmm6, %xmm1
1454aa2c2:     	addss	%xmm7, %xmm1
1454aa2c6:     	addss	%xmm1, %xmm0
1454aa2ca:     	callq	0x145756e1f <.text+0x5755e1f>
1454aa2cf:     	xorl	%edx, %edx
1454aa2d1:     	ucomiss	%xmm9, %xmm0
1454aa2d5:     	movl	$0x0, %eax
1454aa2da:     	jb	0x1454aa300 <.text+0x54a9300>
1454aa2dc:     	cvttss2si	%xmm0, %rax
1454aa2e1:     	ucomiss	%xmm10, %xmm0
1454aa2e5:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454aa2ea:     	jbe	0x1454aa30b <.text+0x54a930b>
1454aa2ec:     	subl	0x3fc(%r13), %ecx
1454aa2f3:     	jb	0x1454aa280 <.text+0x54a9280>
1454aa2f5:     	jmp	0x1454aa31a <.text+0x54a931a>
1454aa2f7:     	nopw	(%rax,%rax)
1454aa300:     	ucomiss	%xmm10, %xmm0
1454aa304:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454aa309:     	ja	0x1454aa2ec <.text+0x54a92ec>
1454aa30b:     	movl	%eax, %ecx
1454aa30d:     	subl	0x3fc(%r13), %ecx
1454aa314:     	jb	0x1454aa280 <.text+0x54a9280>
1454aa31a:     	movl	%ecx, %edx
1454aa31c:     	jmp	0x1454aa280 <.text+0x54a9280>
1454aa321:     	cmpl	$0x0, 0x8f4(%r13)
1454aa329:     	je	0x1454aa34c <.text+0x54a934c>
1454aa32b:     	cmpb	$0x0, 0x958(%r13)
1454aa333:     	jne	0x1454aa34c <.text+0x54a934c>
1454aa335:     	cmpb	$0x1, 0x95f(%r13)
1454aa33d:     	jne	0x1454aa34c <.text+0x54a934c>
1454aa33f:     	movq	%r13, %rcx
1454aa342:     	movb	$0x2, %dl
1454aa344:     	movb	$0x1, %r8b
1454aa347:     	callq	0x1454da5f0 <.text+0x54d95f0>

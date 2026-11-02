
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400a9e60:     	pushq	%rbp
1400a9e61:     	pushq	%r15
1400a9e63:     	pushq	%r14
1400a9e65:     	pushq	%r13
1400a9e67:     	pushq	%r12
1400a9e69:     	pushq	%rsi
1400a9e6a:     	pushq	%rdi
1400a9e6b:     	pushq	%rbx
1400a9e6c:     	subq	$0x4e8, %rsp            # imm = 0x4E8
1400a9e73:     	leaq	0x80(%rsp), %rbp
1400a9e7b:     	movq	$-0x2, 0x460(%rbp)
1400a9e86:     	movq	%r8, %rbx
1400a9e89:     	movq	%rdx, %rsi
1400a9e8c:     	movq	%rcx, %r12
1400a9e8f:     	cmpq	$-0x1, 0xf0(%rdx)
1400a9e97:     	je	0x1400a9ec0 <.text+0xa8ec0>
1400a9e99:     	movq	0x5a0(%rbx), %rax
1400a9ea0:     	movq	%rax, 0x318(%rbp)
1400a9ea7:     	cmpq	%rax, 0x268(%rsi)
1400a9eae:     	jne	0x1400aa500 <.text+0xa9500>
1400a9eb4:     	movq	0x120(%rsi), %r14
1400a9ebb:     	jmp	0x1400aa14f <.text+0xa914f>
1400a9ec0:     	leaq	0x40(%rbx), %rdi
1400a9ec4:     	leaq	0x5a8(%rbx), %r15
1400a9ecb:     	movq	%rdi, 0x330(%rbp)
1400a9ed2:     	movq	%r15, 0x338(%rbp)
1400a9ed9:     	movq	$0x0, 0x318(%rbp)
1400a9ee4:     	movq	$0x8, 0x320(%rbp)
1400a9eef:     	movq	$0x0, 0x328(%rbp)
1400a9efa:     	leaq	0x318(%rbp), %rcx
1400a9f01:     	callq	0x140084d00 <.text+0x83d00>
1400a9f06:     	nop
1400a9f07:     	movq	%rax, %r14
1400a9f0a:     	movq	0x318(%rbp), %rdx
1400a9f11:     	testq	%rdx, %rdx
1400a9f14:     	je	0x1400a9f2c <.text+0xa8f2c>
1400a9f16:     	movq	0x320(%rbp), %rcx
1400a9f1d:     	shlq	$0x3, %rdx
1400a9f21:     	movl	$0x8, %r8d
1400a9f27:     	callq	0x1400021d0 <.text+0x11d0>
1400a9f2c:     	movq	%rdi, 0x330(%rbp)
1400a9f33:     	movq	%r15, 0x338(%rbp)
1400a9f3a:     	movq	$0x0, 0x318(%rbp)
1400a9f45:     	movq	$0x8, 0x320(%rbp)
1400a9f50:     	movq	$0x0, 0x328(%rbp)
1400a9f5b:     	leaq	0x584fb26(%rip), %rdx   # 0x1458f9a88
1400a9f62:     	leaq	0x318(%rbp), %rcx
1400a9f69:     	callq	0x140081da0 <.text+0x80da0>
1400a9f6e:     	nop
1400a9f6f:     	movq	%rax, %r13
1400a9f72:     	movq	0x318(%rbp), %rdx
1400a9f79:     	testq	%rdx, %rdx
1400a9f7c:     	je	0x1400a9f94 <.text+0xa8f94>
1400a9f7e:     	movq	0x320(%rbp), %rcx
1400a9f85:     	shlq	$0x3, %rdx
1400a9f89:     	movl	$0x8, %r8d
1400a9f8f:     	callq	0x1400021d0 <.text+0x11d0>
1400a9f94:     	movq	%rdi, 0x330(%rbp)
1400a9f9b:     	movq	%r15, 0x338(%rbp)
1400a9fa2:     	movq	$0x0, 0x318(%rbp)
1400a9fad:     	movq	$0x8, 0x320(%rbp)
1400a9fb8:     	movq	$0x0, 0x328(%rbp)
1400a9fc3:     	leaq	0x584f426(%rip), %rdx   # 0x1458f93f0
1400a9fca:     	leaq	0x318(%rbp), %rcx
1400a9fd1:     	callq	0x140083e10 <.text+0x82e10>
1400a9fd6:     	movq	%rax, 0x438(%rbp)
1400a9fdd:     	movq	0x318(%rbp), %rdx
1400a9fe4:     	testq	%rdx, %rdx
1400a9fe7:     	je	0x1400a9fff <.text+0xa8fff>
1400a9fe9:     	movq	0x320(%rbp), %rcx
1400a9ff0:     	shlq	$0x3, %rdx
1400a9ff4:     	movl	$0x8, %r8d
1400a9ffa:     	callq	0x1400021d0 <.text+0x11d0>
1400a9fff:     	movq	%rdi, 0x330(%rbp)
1400aa006:     	movq	%r15, 0x338(%rbp)
1400aa00d:     	movq	$0x0, 0x318(%rbp)
1400aa018:     	movq	$0x8, 0x320(%rbp)
1400aa023:     	movq	$0x0, 0x328(%rbp)
1400aa02e:     	leaq	0x584fb83(%rip), %rdx   # 0x1458f9bb8
1400aa035:     	leaq	0x318(%rbp), %rcx
1400aa03c:     	callq	0x140083820 <.text+0x82820>
1400aa041:     	nop
1400aa042:     	movq	%rax, %rdi
1400aa045:     	movq	0x318(%rbp), %rdx
1400aa04c:     	testq	%rdx, %rdx
1400aa04f:     	je	0x1400aa067 <.text+0xa9067>
1400aa051:     	movq	0x320(%rbp), %rcx
1400aa058:     	shlq	$0x3, %rdx
1400aa05c:     	movl	$0x8, %r8d
1400aa062:     	callq	0x1400021d0 <.text+0x11d0>
1400aa067:     	movq	%rdi, 0x450(%rbp)
1400aa06e:     	movq	%r13, 0x448(%rbp)
1400aa075:     	movq	%r12, 0x440(%rbp)
1400aa07c:     	movq	%rbx, %rcx
1400aa07f:     	callq	0x1400a1250 <.text+0xa0250>
1400aa084:     	movq	%rax, %r15
1400aa087:     	leaq	0x1f8(%rbp), %rcx
1400aa08e:     	movq	%rbx, %rdx
1400aa091:     	callq	0x1403228b0 <.text+0x3218b0>
1400aa096:     	nop
1400aa097:     	leaq	0x318(%rbp), %rcx
1400aa09e:     	movq	%rbx, %rdx
1400aa0a1:     	callq	0x14031afb0 <.text+0x319fb0>
1400aa0a6:     	nop
1400aa0a7:     	leaq	-0x48(%rbp), %rdi
1400aa0ab:     	leaq	0x1f8(%rbp), %rdx
1400aa0b2:     	movl	$0x120, %r8d            # imm = 0x120
1400aa0b8:     	movq	%rdi, %rcx
1400aa0bb:     	callq	0x145756ddd <.text+0x5755ddd>
1400aa0c0:     	leaq	0xd8(%rbp), %r12
1400aa0c7:     	leaq	0x318(%rbp), %rdx
1400aa0ce:     	movl	$0x120, %r8d            # imm = 0x120
1400aa0d4:     	movq	%r12, %rcx
1400aa0d7:     	callq	0x145756ddd <.text+0x5755ddd>
1400aa0dc:     	movq	0x5a0(%rbx), %r13
1400aa0e3:     	movl	$0x120, %r8d            # imm = 0x120
1400aa0e9:     	movq	%rsi, %rcx
1400aa0ec:     	movq	%rdi, %rdx
1400aa0ef:     	callq	0x145756ddd <.text+0x5755ddd>
1400aa0f4:     	movq	%r14, 0x120(%rsi)
1400aa0fb:     	movq	0x448(%rbp), %rax
1400aa102:     	movq	%rax, 0x128(%rsi)
1400aa109:     	movq	0x438(%rbp), %rax
1400aa110:     	movq	%rax, 0x130(%rsi)
1400aa117:     	movq	0x450(%rbp), %rax
1400aa11e:     	movq	%rax, 0x138(%rsi)
1400aa125:     	movq	%r15, 0x140(%rsi)
1400aa12c:     	leaq	0x148(%rsi), %rcx
1400aa133:     	movl	$0x120, %r8d            # imm = 0x120
1400aa139:     	movq	%r12, %rdx
1400aa13c:     	callq	0x145756ddd <.text+0x5755ddd>
1400aa141:     	movq	%r13, 0x268(%rsi)
1400aa148:     	movq	0x440(%rbp), %r12
1400aa14f:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
1400aa154:     	addl	0x5b0(%rbx), %eax
1400aa15a:     	movl	%eax, 0x270(%rsi)
1400aa160:     	movq	$0x10, 0x210(%rbp)
1400aa16b:     	xorps	%xmm0, %xmm0
1400aa16e:     	movups	%xmm0, 0x218(%rbp)
1400aa175:     	movq	$0x10, 0x228(%rbp)
1400aa180:     	movups	%xmm0, 0x230(%rbp)
1400aa187:     	movq	$0x10, 0x240(%rbp)
1400aa192:     	movups	%xmm0, 0x248(%rbp)
1400aa199:     	movq	$0x10, 0x258(%rbp)
1400aa1a4:     	movups	%xmm0, 0x260(%rbp)
1400aa1ab:     	movq	$0x10, 0x270(%rbp)
1400aa1b6:     	movq	$0x0, 0x1f8(%rbp)
1400aa1c1:     	movups	%xmm0, 0x278(%rbp)
1400aa1c8:     	movl	$0x0, 0x288(%rbp)
1400aa1d2:     	movq	$0x8, 0x200(%rbp)
1400aa1dd:     	movq	$0x0, 0x208(%rbp)
1400aa1e8:     	leaq	0x1f8(%rbp), %rcx
1400aa1ef:     	movq	%r14, %rdx
1400aa1f2:     	callq	0x144e67870 <.text+0x4e66870>
1400aa1f7:     	nop
1400aa1f8:     	cmpb	$0x0, 0x28b(%rbp)
1400aa1ff:     	jne	0x1400aa3c2 <.text+0xa93c2>
1400aa205:     	movq	0x128(%rsi), %rdx
1400aa20c:     	cmpq	0x268(%rbp), %rdx
1400aa213:     	jae	0x1400aa231 <.text+0xa9231>
1400aa215:     	movq	0x258(%rbp), %rax
1400aa21c:     	movq	%rdx, %rcx
1400aa21f:     	shrq	$0x6, %rcx
1400aa223:     	movq	(%rax,%rcx,8), %rax
1400aa227:     	btq	%rdx, %rax
1400aa22b:     	jb	0x1400aa3c2 <.text+0xa93c2>
1400aa231:     	leaq	0x1f8(%rbp), %rcx
1400aa238:     	callq	0x144e67790 <.text+0x4e66790>
1400aa23d:     	nop
1400aa23e:     	cmpb	$0x0, 0x28b(%rbp)
1400aa245:     	jne	0x1400aa413 <.text+0xa9413>
1400aa24b:     	movq	0x130(%rsi), %rdx
1400aa252:     	cmpq	0x268(%rbp), %rdx
1400aa259:     	jae	0x1400aa277 <.text+0xa9277>
1400aa25b:     	movq	0x258(%rbp), %rax
1400aa262:     	movq	%rdx, %rcx
1400aa265:     	shrq	$0x6, %rcx
1400aa269:     	movq	(%rax,%rcx,8), %rax
1400aa26d:     	btq	%rdx, %rax
1400aa271:     	jb	0x1400aa413 <.text+0xa9413>
1400aa277:     	leaq	0x1f8(%rbp), %rcx
1400aa27e:     	callq	0x144e67790 <.text+0x4e66790>
1400aa283:     	nop
1400aa284:     	cmpb	$0x0, 0x28b(%rbp)
1400aa28b:     	jne	0x1400aa464 <.text+0xa9464>
1400aa291:     	movq	0x138(%rsi), %rdx
1400aa298:     	cmpq	0x268(%rbp), %rdx
1400aa29f:     	jae	0x1400aa2bd <.text+0xa92bd>
1400aa2a1:     	movq	0x258(%rbp), %rax
1400aa2a8:     	movq	%rdx, %rcx
1400aa2ab:     	shrq	$0x6, %rcx
1400aa2af:     	movq	(%rax,%rcx,8), %rax
1400aa2b3:     	btq	%rdx, %rax
1400aa2b7:     	jb	0x1400aa464 <.text+0xa9464>
1400aa2bd:     	leaq	0x1f8(%rbp), %rcx
1400aa2c4:     	callq	0x144e67790 <.text+0x4e66790>
1400aa2c9:     	nop
1400aa2ca:     	cmpb	$0x0, 0x28b(%rbp)
1400aa2d1:     	jne	0x1400aa4b2 <.text+0xa94b2>
1400aa2d7:     	movq	0x140(%rsi), %rdx
1400aa2de:     	cmpq	0x268(%rbp), %rdx
1400aa2e5:     	jae	0x1400aa303 <.text+0xa9303>
1400aa2e7:     	movq	0x258(%rbp), %rax
1400aa2ee:     	movq	%rdx, %rcx
1400aa2f1:     	shrq	$0x6, %rcx
1400aa2f5:     	movq	(%rax,%rcx,8), %rax
1400aa2f9:     	btq	%rdx, %rax
1400aa2fd:     	jb	0x1400aa4b2 <.text+0xa94b2>
1400aa303:     	leaq	0x1f8(%rbp), %rcx
1400aa30a:     	callq	0x144e67790 <.text+0x4e66790>
1400aa30f:     	nop
1400aa310:     	leaq	0x274(%rsi), %r14
1400aa317:     	leaq	0x40(%rsi), %r15
1400aa31b:     	leaq	0x1f8(%rbp), %rdx
1400aa322:     	movq	%r14, %rcx
1400aa325:     	movq	%r15, %r8
1400aa328:     	movq	%rbx, %r9
1400aa32b:     	callq	0x144e1a8a0 <.text+0x4e198a0>
1400aa330:     	nop
1400aa331:     	leaq	0x318(%rbp), %rcx
1400aa338:     	movq	%r15, %rdx
1400aa33b:     	callq	0x144e6c940 <.text+0x4e6b940>
1400aa340:     	nop
1400aa341:     	leaq	0x1f8(%rbp), %rcx
1400aa348:     	leaq	0x318(%rbp), %rdx
1400aa34f:     	callq	0x144e679a0 <.text+0x4e669a0>
1400aa354:     	nop
1400aa355:     	addq	$0x188, %rsi            # imm = 0x188
1400aa35c:     	leaq	0x1f8(%rbp), %rdx
1400aa363:     	movq	%r14, %rcx
1400aa366:     	movq	%rsi, %r8
1400aa369:     	movq	%rbx, %r9
1400aa36c:     	callq	0x144e1a8a0 <.text+0x4e198a0>
1400aa371:     	nop
1400aa372:     	leaq	0x318(%rbp), %rcx
1400aa379:     	movq	%rsi, %rdx
1400aa37c:     	callq	0x144e6c940 <.text+0x4e6b940>
1400aa381:     	nop
1400aa382:     	leaq	0x1f8(%rbp), %rcx
1400aa389:     	leaq	0x318(%rbp), %rdx
1400aa390:     	callq	0x144e679a0 <.text+0x4e669a0>
1400aa395:     	nop
1400aa396:     	leaq	0x1f8(%rbp), %rdx
1400aa39d:     	movl	$0x98, %r8d
1400aa3a3:     	movq	%r12, %rcx
1400aa3a6:     	callq	0x145756ddd <.text+0x5755ddd>
1400aa3ab:     	movq	%r12, %rax
1400aa3ae:     	addq	$0x4e8, %rsp            # imm = 0x4E8
1400aa3b5:     	popq	%rbx
1400aa3b6:     	popq	%rdi
1400aa3b7:     	popq	%rsi
1400aa3b8:     	popq	%r12
1400aa3ba:     	popq	%r13
1400aa3bc:     	popq	%r14
1400aa3be:     	popq	%r15
1400aa3c0:     	popq	%rbp
1400aa3c1:     	retq
1400aa3c2:     	addq	$0x274, %rsi            # imm = 0x274
1400aa3c9:     	leaq	0x45f(%rbp), %rax
1400aa3d0:     	movq	%rax, 0x318(%rbp)
1400aa3d7:     	leaq	0x4f4ebd2(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1400aa3de:     	movq	%rax, 0x320(%rbp)
1400aa3e5:     	movq	%rsi, 0x328(%rbp)
1400aa3ec:     	movq	%rax, 0x330(%rbp)
1400aa3f3:     	leaq	0x5851756(%rip), %rcx   # 0x1458fbb50
1400aa3fa:     	leaq	0x5851867(%rip), %r8    # 0x1458fbc68
1400aa401:     	leaq	0x318(%rbp), %rdx
1400aa408:     	callq	0x1458e7790 <.text+0x58e6790>
1400aa40d:     	nop
1400aa40e:     	jmp	0x1400aa4fe <.text+0xa94fe>
1400aa413:     	addq	$0x274, %rsi            # imm = 0x274
1400aa41a:     	leaq	0x45f(%rbp), %rax
1400aa421:     	movq	%rax, 0x318(%rbp)
1400aa428:     	leaq	0x4f4eb81(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1400aa42f:     	movq	%rax, 0x320(%rbp)
1400aa436:     	movq	%rsi, 0x328(%rbp)
1400aa43d:     	movq	%rax, 0x330(%rbp)
1400aa444:     	leaq	0x5851705(%rip), %rcx   # 0x1458fbb50
1400aa44b:     	leaq	0x5851816(%rip), %r8    # 0x1458fbc68
1400aa452:     	leaq	0x318(%rbp), %rdx
1400aa459:     	callq	0x1458e7790 <.text+0x58e6790>
1400aa45e:     	nop
1400aa45f:     	jmp	0x1400aa4fe <.text+0xa94fe>
1400aa464:     	addq	$0x274, %rsi            # imm = 0x274
1400aa46b:     	leaq	0x45f(%rbp), %rax
1400aa472:     	movq	%rax, 0x318(%rbp)
1400aa479:     	leaq	0x4f4eb30(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1400aa480:     	movq	%rax, 0x320(%rbp)
1400aa487:     	movq	%rsi, 0x328(%rbp)
1400aa48e:     	movq	%rax, 0x330(%rbp)
1400aa495:     	leaq	0x58516b4(%rip), %rcx   # 0x1458fbb50
1400aa49c:     	leaq	0x58517c5(%rip), %r8    # 0x1458fbc68
1400aa4a3:     	leaq	0x318(%rbp), %rdx
1400aa4aa:     	callq	0x1458e7790 <.text+0x58e6790>
1400aa4af:     	nop
1400aa4b0:     	jmp	0x1400aa4fe <.text+0xa94fe>
1400aa4b2:     	addq	$0x274, %rsi            # imm = 0x274
1400aa4b9:     	leaq	0x45f(%rbp), %rax
1400aa4c0:     	movq	%rax, 0x318(%rbp)
1400aa4c7:     	leaq	0x4f4eae2(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1400aa4ce:     	movq	%rax, 0x320(%rbp)
1400aa4d5:     	movq	%rsi, 0x328(%rbp)
1400aa4dc:     	movq	%rax, 0x330(%rbp)
1400aa4e3:     	leaq	0x5851666(%rip), %rcx   # 0x1458fbb50
1400aa4ea:     	leaq	0x5851777(%rip), %r8    # 0x1458fbc68
1400aa4f1:     	leaq	0x318(%rbp), %rdx
1400aa4f8:     	callq	0x1458e7790 <.text+0x58e6790>
1400aa4fd:     	nop
1400aa4fe:     	ud2
1400aa500:     	addq	$0x268, %rsi            # imm = 0x268
1400aa507:     	leaq	0x5851ae2(%rip), %rax   # 0x1458fbff0
1400aa50e:     	movq	%rax, 0x28(%rsp)
1400aa513:     	movq	$0x83, 0x20(%rsp)
1400aa51c:     	leaq	0x5851a85(%rip), %r9    # 0x1458fbfa8
1400aa523:     	leaq	0x318(%rbp), %r8
1400aa52a:     	xorl	%ecx, %ecx
1400aa52c:     	movq	%rsi, %rdx
1400aa52f:     	callq	0x14589fabd <.text+0x589eabd>
1400aa534:     	ud2

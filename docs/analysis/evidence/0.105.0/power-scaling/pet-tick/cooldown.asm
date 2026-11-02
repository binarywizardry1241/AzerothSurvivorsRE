
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14594e0f0:     	pushq	%rbp
14594e0f1:     	pushq	%rsi
14594e0f2:     	pushq	%rdi
14594e0f3:     	pushq	%rbx
14594e0f4:     	subq	$0xf8, %rsp
14594e0fb:     	leaq	0x80(%rsp), %rbp
14594e103:     	movaps	%xmm9, 0x60(%rbp)
14594e108:     	movaps	%xmm8, 0x50(%rbp)
14594e10d:     	movaps	%xmm7, 0x40(%rbp)
14594e111:     	movaps	%xmm6, 0x30(%rbp)
14594e115:     	movq	$-0x2, 0x28(%rbp)
14594e11d:     	movq	0xd8(%rcx), %rax
14594e124:     	cmpq	%rax, %rdx
14594e127:     	jae	0x14594e46e <.text+0x594d46e>
14594e12d:     	movq	0xd0(%rcx), %rax
14594e134:     	imulq	$0x78, %rdx, %rdx
14594e138:     	movq	0x18(%rax,%rdx), %rax
14594e13d:     	movzbl	0x39(%rax), %edx
14594e141:     	testl	%edx, %edx
14594e143:     	je	0x14594e181 <.text+0x594d181>
14594e145:     	movq	0x380(%rcx), %r10
14594e14c:     	testq	%r10, %r10
14594e14f:     	je	0x14594e18b <.text+0x594d18b>
14594e151:     	movss	0x9ec(%rcx), %xmm1
14594e159:     	movss	0x4b8(%rcx), %xmm0
14594e161:     	addss	0x41f203(%rip), %xmm0   # 0x145d6d36c
14594e169:     	movq	0x378(%rcx), %r9
14594e170:     	cmpq	$0x1, %r10
14594e174:     	jne	0x14594e193 <.text+0x594d193>
14594e176:     	xorps	%xmm6, %xmm6
14594e179:     	xorl	%r11d, %r11d
14594e17c:     	jmp	0x14594e1fe <.text+0x594d1fe>
14594e181:     	movss	0x30(%rax), %xmm0
14594e186:     	jmp	0x14594e425 <.text+0x594d425>
14594e18b:     	xorps	%xmm6, %xmm6
14594e18e:     	jmp	0x14594e222 <.text+0x594d222>
14594e193:     	movq	%r10, %rsi
14594e196:     	andq	$-0x2, %rsi
14594e19a:     	leaq	0x28(%r9), %rdi
14594e19e:     	xorps	%xmm6, %xmm6
14594e1a1:     	xorl	%r11d, %r11d
14594e1a4:     	jmp	0x14594e1bd <.text+0x594d1bd>
14594e1a6:     	nopw	%cs:(%rax,%rax)
14594e1b0:     	addq	$0x2, %r11
14594e1b4:     	addq	$0x30, %rdi
14594e1b8:     	cmpq	%r11, %rsi
14594e1bb:     	je	0x14594e1f8 <.text+0x594d1f8>
14594e1bd:     	movss	-0x18(%rdi), %xmm2
14594e1c2:     	ucomiss	%xmm1, %xmm2
14594e1c5:     	jbe	0x14594e1da <.text+0x594d1da>
14594e1c7:     	cmpl	$0xa, -0x28(%rdi)
14594e1cb:     	jne	0x14594e1da <.text+0x594d1da>
14594e1cd:     	movss	-0x20(%rdi), %xmm2
14594e1d2:     	mulss	%xmm0, %xmm2
14594e1d6:     	addss	%xmm2, %xmm6
14594e1da:     	movss	(%rdi), %xmm2
14594e1de:     	ucomiss	%xmm1, %xmm2
14594e1e1:     	jbe	0x14594e1b0 <.text+0x594d1b0>
14594e1e3:     	cmpl	$0xa, -0x10(%rdi)
14594e1e7:     	jne	0x14594e1b0 <.text+0x594d1b0>
14594e1e9:     	movss	-0x8(%rdi), %xmm2
14594e1ee:     	mulss	%xmm0, %xmm2
14594e1f2:     	addss	%xmm2, %xmm6
14594e1f6:     	jmp	0x14594e1b0 <.text+0x594d1b0>
14594e1f8:     	testb	$0x1, %r10b
14594e1fc:     	je	0x14594e222 <.text+0x594d222>
14594e1fe:     	leaq	(%r11,%r11,2), %r10
14594e202:     	movss	0x10(%r9,%r10,8), %xmm2
14594e209:     	ucomiss	%xmm1, %xmm2
14594e20c:     	jbe	0x14594e222 <.text+0x594d222>
14594e20e:     	leaq	(%r9,%r10,8), %r9
14594e212:     	cmpl	$0xa, (%r9)
14594e216:     	jne	0x14594e222 <.text+0x594d222>
14594e218:     	mulss	0x8(%r9), %xmm0
14594e21e:     	addss	%xmm0, %xmm6
14594e222:     	cmpl	$0x5, %edx
14594e225:     	je	0x14594e309 <.text+0x594d309>
14594e22b:     	cmpl	$0x7, %edx
14594e22e:     	jne	0x14594e38f <.text+0x594d38f>
14594e234:     	movq	0x318(%rcx), %rax
14594e23b:     	movq	0x320(%rcx), %r10
14594e242:     	leaq	0x152c70f(%rip), %rdx   # 0x146e7a958
14594e249:     	movq	%rdx, (%rbp)
14594e24d:     	movq	$0xb, 0x8(%rbp)
14594e255:     	xorl	%r11d, %r11d
14594e258:     	leaq	0x125e879(%rip), %rdx   # 0x146bacad8
14594e25f:     	movabsq	$0x625f776f64616873, %r8 # imm = 0x625F776F64616873
14594e269:     	movabsq	$0x746c6f625f776f64, %r9 # imm = 0x746C6F625F776F64
14594e273:     	jmp	0x14594e291 <.text+0x594d291>
14594e275:     	nopw	%cs:(%rax,%rax)
14594e280:     	addq	$0x78, %r11
14594e284:     	cmpq	$0x34f8, %r11           # imm = 0x34F8
14594e28b:     	je	0x14594e443 <.text+0x594d443>
14594e291:     	cmpq	$0xb, 0x8(%r11,%rdx)
14594e297:     	jne	0x14594e280 <.text+0x594d280>
14594e299:     	movq	(%r11,%rdx), %rsi
14594e29d:     	movq	(%rsi), %rdi
14594e2a0:     	xorq	%r8, %rdi
14594e2a3:     	movq	0x3(%rsi), %rsi
14594e2a7:     	xorq	%r9, %rsi
14594e2aa:     	orq	%rdi, %rsi
14594e2ad:     	jne	0x14594e280 <.text+0x594d280>
14594e2af:     	addq	%r11, %rdx
14594e2b2:     	movss	0x41f0b2(%rip), %xmm7   # 0x145d6d36c
14594e2ba:     	testq	%r10, %r10
14594e2bd:     	je	0x14594e3a5 <.text+0x594d3a5>
14594e2c3:     	imulq	$0x68, %r10, %r11
14594e2c7:     	xorl	%r10d, %r10d
14594e2ca:     	jmp	0x14594e2dd <.text+0x594d2dd>
14594e2cc:     	nopl	(%rax)
14594e2d0:     	addq	$0x68, %r10
14594e2d4:     	cmpq	%r10, %r11
14594e2d7:     	je	0x14594e3a5 <.text+0x594d3a5>
14594e2dd:     	movq	(%rax,%r10), %rsi
14594e2e1:     	cmpq	$0xb, 0x8(%rsi)
14594e2e6:     	jne	0x14594e2d0 <.text+0x594d2d0>
14594e2e8:     	movq	(%rsi), %rdi
14594e2eb:     	movq	(%rdi), %rbx
14594e2ee:     	xorq	%r8, %rbx
14594e2f1:     	movq	0x3(%rdi), %rdi
14594e2f5:     	xorq	%r9, %rdi
14594e2f8:     	orq	%rbx, %rdi
14594e2fb:     	jne	0x14594e2d0 <.text+0x594d2d0>
14594e2fd:     	movss	0x2c(%rax,%r10), %xmm7
14594e304:     	jmp	0x14594e3a8 <.text+0x594d3a8>
14594e309:     	movss	0x41f05b(%rip), %xmm0   # 0x145d6d36c
14594e311:     	subss	0x480(%rcx), %xmm0
14594e319:     	xorps	%xmm1, %xmm1
14594e31c:     	maxss	%xmm1, %xmm0
14594e320:     	addss	%xmm0, %xmm6
14594e324:     	movq	0x568(%rcx), %rdx
14594e32b:     	testq	%rdx, %rdx
14594e32e:     	je	0x14594e38f <.text+0x594d38f>
14594e330:     	movq	0x560(%rcx), %rcx
14594e337:     	imulq	$0x160, %rdx, %rdx      # imm = 0x160
14594e33e:     	xorl	%r9d, %r9d
14594e341:     	movss	0x41f3ff(%rip), %xmm0   # 0x145d6d748
14594e349:     	jmp	0x14594e35c <.text+0x594d35c>
14594e34b:     	nopl	(%rax,%rax)
14594e350:     	addq	$0x160, %r9             # imm = 0x160
14594e357:     	cmpq	%r9, %rdx
14594e35a:     	je	0x14594e38f <.text+0x594d38f>
14594e35c:     	cmpq	%r8, 0x88(%rcx,%r9)
14594e364:     	jne	0x14594e350 <.text+0x594d350>
14594e366:     	cmpl	$0x0, 0x68(%rcx,%r9)
14594e36c:     	jne	0x14594e350 <.text+0x594d350>
14594e36e:     	movss	0xf4(%rcx,%r9), %xmm1
14594e378:     	mulss	%xmm0, %xmm1
14594e37c:     	ucomiss	0xf0(%rcx,%r9), %xmm1
14594e385:     	jbe	0x14594e350 <.text+0x594d350>
14594e387:     	addss	0x41f4e9(%rip), %xmm6   # 0x145d6d878
14594e38f:     	movss	0x30(%rax), %xmm0
14594e394:     	addss	0x41efd0(%rip), %xmm6   # 0x145d6d36c
14594e39c:     	divss	%xmm6, %xmm0
14594e3a0:     	jmp	0x14594e425 <.text+0x594d425>
14594e3a5:     	movq	%rdx, %rsi
14594e3a8:     	movq	%rcx, %rbx
14594e3ab:     	leaq	0x1b0(%rcx), %rdx
14594e3b2:     	leaq	-0x60(%rbp), %rdi
14594e3b6:     	movq	%rdi, %rcx
14594e3b9:     	callq	0x1458e3800 <.text+0x58e2800>
14594e3be:     	nop
14594e3bf:     	movq	%rbp, %rcx
14594e3c2:     	movq	%rdi, %rdx
14594e3c5:     	movq	%rsi, %r8
14594e3c8:     	callq	0x1458e3a30 <.text+0x58e2a30>
14594e3cd:     	nop
14594e3ce:     	movss	0x4(%rbp), %xmm8
14594e3d4:     	movss	0x20(%rbp), %xmm9
14594e3da:     	leaq	-0x60(%rbp), %rcx
14594e3de:     	callq	0x1458784e0 <.text+0x58774e0>
14594e3e3:     	movss	0x48(%rsi), %xmm1
14594e3e8:     	mulss	0x425950(%rip), %xmm1   # 0x145d73d40
14594e3f0:     	movaps	%xmm7, %xmm0
14594e3f3:     	mulss	%xmm1, %xmm0
14594e3f7:     	mulss	%xmm8, %xmm0
14594e3fc:     	mulss	0x480(%rbx), %xmm0
14594e404:     	mulss	%xmm9, %xmm0
14594e409:     	maxss	0x425933(%rip), %xmm0   # 0x145d73d44
14594e411:     	addss	0x41ef53(%rip), %xmm6   # 0x145d6d36c
14594e419:     	divss	%xmm6, %xmm0
14594e41d:     	maxss	0x41f32f(%rip), %xmm0   # 0x145d6d754
14594e425:     	movaps	0x30(%rbp), %xmm6
14594e429:     	movaps	0x40(%rbp), %xmm7
14594e42d:     	movaps	0x50(%rbp), %xmm8
14594e432:     	movaps	0x60(%rbp), %xmm9
14594e437:     	addq	$0xf8, %rsp
14594e43e:     	popq	%rbx
14594e43f:     	popq	%rdi
14594e440:     	popq	%rsi
14594e441:     	popq	%rbp
14594e442:     	retq
14594e443:     	movq	%rbp, %rax
14594e446:     	movq	%rax, -0x60(%rbp)
14594e44a:     	leaq	-0x594c391(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14594e451:     	movq	%rax, -0x58(%rbp)
14594e455:     	leaq	0x125d85c(%rip), %rcx   # 0x146babcb8
14594e45c:     	leaq	0x125d865(%rip), %r8    # 0x146babcc8
14594e463:     	leaq	-0x60(%rbp), %rdx
14594e467:     	callq	0x145d699c0 <.text+0x5d689c0>
14594e46c:     	ud2
14594e46e:     	leaq	0x152c4cb(%rip), %r8    # 0x146e7a940
14594e475:     	movq	%rdx, %rcx
14594e478:     	movq	%rax, %rdx
14594e47b:     	callq	0x145d697e3 <.text+0x5d687e3>
14594e480:     	ud2

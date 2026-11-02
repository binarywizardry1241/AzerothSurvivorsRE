; duration
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c6151c:     	movss	0x58(%rsi), %xmm7
145c61521:     	movss	0x5d1bff(%rip), %xmm6   # 0x146233128
145c61529:     	mulss	%xmm7, %xmm6
145c6152d:     	mulss	0x20(%r12), %xmm6
145c61534:     	movss	0x48(%r12), %xmm12
145c6153b:     	mulss	%xmm12, %xmm6
145c61540:     	movq	0x8(%rsi), %rax
145c61544:     	cmpq	$0xd, %rax
145c61548:     	jne	0x145c61575 <.text+0x5c60575>
145c6154a:     	movq	(%rsi), %rcx
145c6154d:     	movabsq	$0x735f656e69766964, %rdx # imm = 0x735F656E69766964
145c61557:     	xorq	(%rcx), %rdx
145c6155a:     	movabsq	$0x646c656968735f65, %r8 # imm = 0x646C656968735F65
145c61564:     	xorq	0x5(%rcx), %r8
145c61568:     	orq	%rdx, %r8
145c6156b:     	jne	0x145c61575 <.text+0x5c60575>
145c6156d:     	minss	0x5d1b7b(%rip), %xmm6   # 0x1462330f0
145c61575:     	maxss	0x5f76f3(%rip), %xmm6   # 0x146258c70

; admission
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c63ad2:     	movss	0x538(%rdi), %xmm0
145c63ada:     	mulss	0x5e8fbd(%rip), %xmm8   # 0x14624caa0
145c63ae3:     	ucomiss	%xmm8, %xmm0
145c63ae7:     	ja	0x145c62237 <.text+0x5c61237>
145c63aed:     	cmpq	$0xd, %rax
145c63af1:     	jne	0x145c63b48 <.text+0x5c62b48>
145c63af3:     	movq	(%rsi), %rax
145c63af6:     	movabsq	$0x735f656e69766964, %rcx # imm = 0x735F656E69766964
145c63b00:     	xorq	(%rax), %rcx
145c63b03:     	movabsq	$0x646c656968735f65, %rdx # imm = 0x646C656968735F65
145c63b0d:     	xorq	0x5(%rax), %rdx
145c63b11:     	orq	%rcx, %rdx
145c63b14:     	jne	0x145c63b48 <.text+0x5c62b48>
145c63b16:     	movss	0x540(%rdi), %xmm0
145c63b1e:     	addss	0x5cf62a(%rip), %xmm0   # 0x146233150
145c63b26:     	ucomiss	%xmm10, %xmm0
145c63b2a:     	ja	0x145c62237 <.text+0x5c61237>
145c63b30:     	movss	%xmm10, 0x540(%rdi)

; cooldown
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c10496:     	movss	0x58(%rax), %xmm1
145c1049b:     	mulss	%xmm9, %xmm1
145c104a0:     	mulss	0x20(%rcx), %xmm1
145c104a5:     	mulss	0x48(%rcx), %xmm1
145c104aa:     	minss	0x622c3e(%rip), %xmm1   # 0x1462330f0
145c104b2:     	movss	0x622c96(%rip), %xmm0   # 0x146233150
145c104ba:     	subss	%xmm1, %xmm0
145c104be:     	nop
145c104c0:     	movss	0x48(%rax), %xmm1
145c104c5:     	mulss	%xmm9, %xmm1
145c104ca:     	mulss	0x14(%rcx), %xmm1
145c104cf:     	mulss	0x3c(%rcx), %xmm1
145c104d4:     	mulss	0x4d0(%rsi), %xmm1
145c104dc:     	movaps	%xmm1, %xmm2
145c104df:     	maxss	%xmm0, %xmm2
145c104e3:     	movaps	%xmm2, %xmm0
145c104e6:     	cmpunordss	%xmm2, %xmm0
145c104eb:     	andps	%xmm0, %xmm1
145c104ee:     	andnps	%xmm2, %xmm0
145c104f1:     	orps	%xmm1, %xmm0
145c104f4:     	cmpl	$0xc, 0x68(%rax)
145c104f8:     	jne	0x145c1054e <.text+0x5c0f54e>
145c104fa:     	movss	0x58(%rax), %xmm1
145c104ff:     	mulss	%xmm9, %xmm1
145c10504:     	mulss	0x20(%rcx), %xmm1
145c10509:     	mulss	0x48(%rcx), %xmm1
145c1050e:     	cmpq	$0xd, %rdx
145c10512:     	jne	0x145c10545 <.text+0x5c0f545>
145c10514:     	movq	(%rax), %rdx
145c10517:     	movq	(%rdx), %r8
145c1051a:     	movabsq	$0x735f656e69766964, %r9 # imm = 0x735F656E69766964
145c10524:     	xorq	%r9, %r8
145c10527:     	movq	0x5(%rdx), %rdx
145c1052b:     	movabsq	$0x646c656968735f65, %r9 # imm = 0x646C656968735F65
145c10535:     	xorq	%r9, %rdx
145c10538:     	orq	%r8, %rdx
145c1053b:     	jne	0x145c10545 <.text+0x5c0f545>
145c1053d:     	minss	0x622bab(%rip), %xmm1   # 0x1462330f0
145c10545:     	maxss	%xmm10, %xmm1
145c1054a:     	addss	%xmm1, %xmm0

; tooltip-duration
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145b57d9a:     	movss	0x58(%r13), %xmm1
145b57da0:     	mulss	0x6db380(%rip), %xmm1   # 0x146233128
145b57da8:     	mulss	0x20(%rdi), %xmm1
145b57dad:     	mulss	0x48(%rdi), %xmm1
145b57db2:     	cmpq	$0xd, 0x8(%r13)
145b57db7:     	jne	0x145b57de5 <.text+0x5b56de5>
145b57db9:     	movq	(%r13), %rax
145b57dbd:     	movabsq	$0x735f656e69766964, %rcx # imm = 0x735F656E69766964
145b57dc7:     	xorq	(%rax), %rcx
145b57dca:     	movabsq	$0x646c656968735f65, %rdx # imm = 0x646C656968735F65
145b57dd4:     	xorq	0x5(%rax), %rdx
145b57dd8:     	orq	%rcx, %rdx
145b57ddb:     	jne	0x145b57de5 <.text+0x5b56de5>
145b57ddd:     	minss	0x6db30b(%rip), %xmm1   # 0x1462330f0

; tooltip-total
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145b5db20:     	movq	0x2f8(%rbp), %rax
145b5db27:     	movq	0x8(%rax), %rax
145b5db2b:     	movss	0x6d5605(%rip), %xmm1   # 0x146233138
145b5db33:     	cmpq	$0xd, %rax
145b5db37:     	je	0x145b5db66 <.text+0x5b5cb66>
145b5db39:     	cmpq	$0x8, %rax
145b5db3d:     	jne	0x145b5db5d <.text+0x5b5cb5d>
145b5db3f:     	movq	0x2f8(%rbp), %rcx
145b5db46:     	movq	(%rcx), %rcx
145b5db49:     	movq	(%rcx), %rcx
145b5db4c:     	cmpq	0x1521585(%rip), %rcx   # 0x14707f0d8
145b5db53:     	jne	0x145b5db5d <.text+0x5b5cb5d>
145b5db55:     	movss	0x6d55c7(%rip), %xmm1   # 0x146233124
145b5db5d:     	movq	0x2f8(%rbp), %r8
145b5db64:     	jmp	0x145b5dbbd <.text+0x5b5cbbd>
145b5db66:     	movq	0x2f8(%rbp), %r8
145b5db6d:     	movq	(%r8), %rcx
145b5db70:     	movq	(%rcx), %rdx
145b5db73:     	xorq	0x1521566(%rip), %rdx   # 0x14707f0e0
145b5db7a:     	movq	0x5(%rcx), %rcx
145b5db7e:     	xorq	0x1521560(%rip), %rcx   # 0x14707f0e5
145b5db85:     	orq	%rdx, %rcx
145b5db88:     	jne	0x145b5dbbd <.text+0x5b5cbbd>
145b5db8a:     	movss	0x58(%r8), %xmm0
145b5db90:     	mulss	0x6d5590(%rip), %xmm0   # 0x146233128
145b5db98:     	movq	0x300(%rbp), %rcx
145b5db9f:     	mulss	0x20(%rcx), %xmm0
145b5dba4:     	mulss	0x48(%rcx), %xmm0
145b5dba9:     	minss	0x6d553f(%rip), %xmm0   # 0x1462330f0
145b5dbb1:     	movss	0x6d5597(%rip), %xmm1   # 0x146233150
145b5dbb9:     	subss	%xmm0, %xmm1
145b5dbbd:     	movss	0x6d5563(%rip), %xmm0   # 0x146233128
145b5dbc5:     	movss	0x48(%r8), %xmm2
145b5dbcb:     	mulss	%xmm0, %xmm2
145b5dbcf:     	movq	0x300(%rbp), %rdx
145b5dbd6:     	mulss	0x14(%rdx), %xmm2
145b5dbdb:     	mulss	0x3c(%rdx), %xmm2
145b5dbe0:     	movq	0x310(%rbp), %rcx
145b5dbe7:     	mulss	0x8(%rcx), %xmm2
145b5dbec:     	movaps	%xmm2, %xmm3
145b5dbef:     	maxss	%xmm1, %xmm3
145b5dbf3:     	movaps	%xmm3, %xmm1
145b5dbf6:     	cmpunordss	%xmm3, %xmm1
145b5dbfb:     	andps	%xmm1, %xmm2
145b5dbfe:     	andnps	%xmm3, %xmm1
145b5dc01:     	mulss	0x58(%r8), %xmm0
145b5dc07:     	mulss	0x20(%rdx), %xmm0
145b5dc0c:     	orps	%xmm2, %xmm1
145b5dc0f:     	mulss	0x48(%rdx), %xmm0
145b5dc14:     	cmpq	$0xd, %rax
145b5dc18:     	jne	0x145b5dc45 <.text+0x5b5cc45>
145b5dc1a:     	movq	(%r8), %rax
145b5dc1d:     	movabsq	$0x735f656e69766964, %rcx # imm = 0x735F656E69766964
145b5dc27:     	xorq	(%rax), %rcx
145b5dc2a:     	movabsq	$0x646c656968735f65, %rdx # imm = 0x646C656968735F65
145b5dc34:     	xorq	0x5(%rax), %rdx
145b5dc38:     	orq	%rcx, %rdx
145b5dc3b:     	jne	0x145b5dc45 <.text+0x5b5cc45>
145b5dc3d:     	minss	0x6d54ab(%rip), %xmm0   # 0x1462330f0
145b5dc45:     	addss	%xmm0, %xmm1

; constructor-timestamp
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c24bfd:     	movsd	0x17b8fab(%rip), %xmm0  # 0x1473ddbb0
145c24c05:     	movsd	%xmm0, 0x54c(%rbp)

; constructor-copy
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c25acf:     	leaq	0x10(%rbp), %rdx
145c25ad3:     	movl	$0xd88, %r8d            # imm = 0xD88
145c25ad9:     	movq	0xf58(%rbp), %rsi
145c25ae0:     	movq	%rsi, %rcx
145c25ae3:     	callq	0x14606171b <.text+0x606071b>

; cooldown-base-floor
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c1044c:     	cmpq	$0xd, %rdx
145c10450:     	je	0x145c10475 <.text+0x5c0f475>
145c10452:     	movaps	%xmm8, %xmm0
145c10456:     	cmpq	$0x8, %rdx
145c1045a:     	jne	0x145c104c0 <.text+0x5c0f4c0>
145c1045c:     	movq	(%rax), %r8
145c1045f:     	movq	(%r8), %r8
145c10462:     	movaps	%xmm15, %xmm0
145c10466:     	cmpq	0x146ec6b(%rip), %r8    # 0x14707f0d8
145c1046d:     	je	0x145c104c0 <.text+0x5c0f4c0>
145c1046f:     	movaps	%xmm8, %xmm0
145c10473:     	jmp	0x145c104c0 <.text+0x5c0f4c0>
145c10475:     	movq	(%rax), %r8
145c10478:     	movq	(%r8), %r9
145c1047b:     	movq	0x5(%r8), %r8
145c1047f:     	xorq	0x146ec5a(%rip), %r9    # 0x14707f0e0
145c10486:     	xorq	0x146ec58(%rip), %r8    # 0x14707f0e5
145c1048d:     	orq	%r9, %r8
145c10490:     	movaps	%xmm8, %xmm0
145c10494:     	jne	0x145c104c0 <.text+0x5c0f4c0>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14596e450:     	pushq	%rsi
14596e451:     	pushq	%rdi
14596e452:     	subq	$0x28, %rsp
14596e456:     	movzbl	%cl, %eax
14596e459:     	decl	%eax
14596e45b:     	cmpl	$0x5, %eax
14596e45e:     	ja	0x14596e4c4 <.text+0x596d4c4>
14596e460:     	leaq	0x1845b59(%rip), %rcx   # 0x1471b3fc0
14596e467:     	movslq	(%rcx,%rax,4), %rax
14596e46b:     	addq	%rcx, %rax
14596e46e:     	jmpq	*%rax
14596e470:     	leaq	0x18448c9(%rip), %rsi   # 0x1471b2d40
14596e477:     	jmp	0x14596e4a5 <.text+0x596d4a5>
14596e479:     	leaq	0x18448d3(%rip), %rsi   # 0x1471b2d53
14596e480:     	jmp	0x14596e4b8 <.text+0x596d4b8>
14596e482:     	leaq	0x18448bf(%rip), %rsi   # 0x1471b2d48
14596e489:     	jmp	0x14596e4b8 <.text+0x596d4b8>
14596e48b:     	leaq	0x18448bc(%rip), %rsi   # 0x1471b2d4e
14596e492:     	movl	$0x5, %edi
14596e497:     	movl	$0x5, %edx
14596e49c:     	jmp	0x14596e4d5 <.text+0x596d4d5>
14596e49e:     	leaq	0x184489f(%rip), %rsi   # 0x1471b2d44
14596e4a5:     	movl	$0x4, %edi
14596e4aa:     	movl	$0x4, %edx
14596e4af:     	jmp	0x14596e4d5 <.text+0x596d4d5>
14596e4b1:     	leaq	0x18448a1(%rip), %rsi   # 0x1471b2d59
14596e4b8:     	movl	$0x6, %edi
14596e4bd:     	movl	$0x6, %edx
14596e4c2:     	jmp	0x14596e4d5 <.text+0x596d4d5>
14596e4c4:     	leaq	0x1844894(%rip), %rsi   # 0x1471b2d5f
14596e4cb:     	movl	$0x8, %edi
14596e4d0:     	movl	$0x8, %edx
14596e4d5:     	movq	%rsi, %rcx
14596e4d8:     	callq	0x1458da590 <.text+0x58d9590>
14596e4dd:     	testq	%rax, %rax
14596e4e0:     	cmoveq	%rdi, %rdx
14596e4e4:     	cmoveq	%rsi, %rax
14596e4e8:     	addq	$0x28, %rsp
14596e4ec:     	popq	%rdi
14596e4ed:     	popq	%rsi
14596e4ee:     	retq

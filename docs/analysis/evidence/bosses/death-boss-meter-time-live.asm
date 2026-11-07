
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145498ab1:     	testb	$0x1, %sil
145498ab5:     	jne	0x145498abb <.text+0x5497abb>
145498ab7:     	movaps	%xmm8, %xmm6
145498abb:     	subss	%xmm9, %xmm6
145498ac0:     	movb	$0x1, 0x172(%rbp)
145498ac7:     	movss	%xmm6, 0x20(%rsp)
145498acd:     	leaq	0x151251e(%rip), %r8    # 0x1469aaff2
145498ad4:     	leaq	0x140(%rbp), %rcx
145498adb:     	leaq	0xf0(%rbp), %rdx
145498ae2:     	movl	$0x4, %r9d
145498ae8:     	callq	0x14544e640 <.text+0x544d640>
145498aed:     	nop
145498aee:     	leaq	0x1512501(%rip), %rdx   # 0x1469aaff6
145498af5:     	leaq	0x140(%rbp), %rcx
145498afc:     	movl	$0x4, %r8d
145498b02:     	callq	0x145451370 <.text+0x5450370>
145498b07:     	nop
145498b08:     	xorl	%r15d, %r15d
145498b0b:     	cmpl	$0x1, %esi
145498b0e:     	sete	%r15b
145498b12:     	orq	$0x4, %r15
145498b16:     	movq	0x140(%rbp), %rax
145498b1d:     	movq	0x150(%rbp), %rdx
145498b24:     	subq	%rdx, %rax
145498b27:     	cmpq	%rax, %r15
145498b2a:     	ja	0x145499175 <.text+0x5498175>
145498b30:     	cmpl	$0x1, %esi
145498b33:     	leaq	0x128a6b4(%rip), %rax   # 0x1467231ee
145498b3a:     	cmovneq	%rax, %r12
145498b3e:     	addq	0x148(%rbp), %rdx
145498b45:     	movq	%rdx, %rcx
145498b48:     	movq	%r12, %rdx
145498b4b:     	movq	%r15, %r8
145498b4e:     	callq	0x145756ddd <.text+0x5755ddd>


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454efe18:     	movq	0x210(%rcx), %rcx
1454efe1f:     	movq	0x218(%rsi), %rdx
1454efe26:     	callq	0x14540e820 <.text+0x540d820>
1454efe2b:     	imulq	$0xf0, %rax, %rcx
1454efe32:     	leaq	0x12265ff(%rip), %rax   # 0x146716438
1454efe39:     	movq	0x80(%rcx,%rax), %rdx
1454efe41:     	cmpq	%rdx, %rdi
1454efe44:     	jae	0x1454eff6e <.text+0x54eef6e>
1454efe4a:     	addq	%rcx, %rax
1454efe4d:     	movq	0x78(%rax), %rcx
1454efe51:     	leaq	(%rdi,%rdi,4), %rdx
1454efe55:     	shlq	$0x4, %rdx
1454efe59:     	movss	0x34(%rcx,%rdx), %xmm6
1454efe5f:     	movss	0x8e4(%rsi), %xmm10
1454efe68:     	movss	0xe0(%rax), %xmm8

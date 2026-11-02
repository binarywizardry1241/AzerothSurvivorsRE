
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454efdf0:     	pushq	%rsi
1454efdf1:     	pushq	%rdi
1454efdf2:     	subq	$0x78, %rsp
1454efdf6:     	movaps	%xmm10, 0x60(%rsp)
1454efdfc:     	movaps	%xmm9, 0x50(%rsp)
1454efe02:     	movaps	%xmm8, 0x40(%rsp)
1454efe08:     	movaps	%xmm7, 0x30(%rsp)
1454efe0d:     	movaps	%xmm6, 0x20(%rsp)
1454efe12:     	movq	%rdx, %rdi
1454efe15:     	movq	%rcx, %rsi
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
1454efe71:     	movss	0x944(%rsi), %xmm9
1454efe7a:     	movss	0x3fb5fe(%rip), %xmm7   # 0x1458eb480
1454efe82:     	cmpl	$0x1, 0x858(%rsi)
1454efe89:     	movaps	%xmm7, %xmm0
1454efe8c:     	jne	0x1454efec2 <.text+0x54eeec2>
1454efe8e:     	cmpb	$0x0, 0x952(%rsi)
1454efe95:     	movaps	%xmm7, %xmm0
1454efe98:     	je	0x1454efec2 <.text+0x54eeec2>
1454efe9a:     	movaps	%xmm10, %xmm1
1454efe9e:     	subss	0x85c(%rsi), %xmm1
1454efea6:     	divss	0x441052(%rip), %xmm1   # 0x145930f00
1454efeae:     	xorps	%xmm0, %xmm0
1454efeb1:     	maxss	%xmm0, %xmm1
1454efeb5:     	movss	0x14ba693(%rip), %xmm0  # 0x1469aa550
1454efebd:     	callq	0x145756e73 <.text+0x5755e73>
1454efec2:     	divss	0x441035(%rip), %xmm10  # 0x145930f00
1454efecb:     	movss	0x40675d(%rip), %xmm1   # 0x1458f6630
1454efed3:     	mulss	%xmm10, %xmm1
1454efed8:     	addss	%xmm7, %xmm1
1454efedc:     	movss	0x14ba74c(%rip), %xmm2  # 0x1469aa630
1454efee4:     	mulss	%xmm10, %xmm2
1454efee9:     	mulss	%xmm10, %xmm2
1454efeee:     	addss	%xmm1, %xmm2
1454efef2:     	mulss	%xmm9, %xmm8
1454efef7:     	xorps	%xmm1, %xmm1
1454efefa:     	sqrtss	%xmm8, %xmm1
1454efeff:     	mulss	%xmm2, %xmm1
1454eff03:     	mulss	%xmm1, %xmm6
1454eff07:     	mulss	0x408e31(%rip), %xmm6   # 0x1458f8d40
1454eff0f:     	mulss	%xmm0, %xmm6
1454eff13:     	movl	0x664(%rsi), %eax
1454eff19:     	xorps	%xmm1, %xmm1
1454eff1c:     	cvtsi2ss	%rax, %xmm1
1454eff21:     	mulss	0x408e1b(%rip), %xmm1   # 0x1458f8d44
1454eff29:     	addss	%xmm7, %xmm1
1454eff2d:     	mulss	%xmm6, %xmm1
1454eff31:     	movzwl	0x234(%rsi), %eax
1454eff38:     	xorps	%xmm0, %xmm0
1454eff3b:     	cvtsi2ss	%eax, %xmm0
1454eff3f:     	divss	0x3fb5e5(%rip), %xmm0   # 0x1458eb52c
1454eff47:     	mulss	%xmm1, %xmm0
1454eff4b:     	movaps	0x20(%rsp), %xmm6
1454eff50:     	movaps	0x30(%rsp), %xmm7
1454eff55:     	movaps	0x40(%rsp), %xmm8
1454eff5b:     	movaps	0x50(%rsp), %xmm9
1454eff61:     	movaps	0x60(%rsp), %xmm10
1454eff67:     	addq	$0x78, %rsp
1454eff6b:     	popq	%rdi
1454eff6c:     	popq	%rsi
1454eff6d:     	retq
1454eff6e:     	leaq	0x14bc933(%rip), %r8    # 0x1469ac8a8
1454eff75:     	movq	%rdi, %rcx
1454eff78:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454eff7d:     	ud2

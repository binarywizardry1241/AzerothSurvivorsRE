
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ef9f0:     	pushq	%rbp
1454ef9f1:     	pushq	%r15
1454ef9f3:     	pushq	%r14
1454ef9f5:     	pushq	%rsi
1454ef9f6:     	pushq	%rdi
1454ef9f7:     	pushq	%rbx
1454ef9f8:     	subq	$0xc8, %rsp
1454ef9ff:     	leaq	0x80(%rsp), %rbp
1454efa07:     	movaps	%xmm12, 0x30(%rbp)
1454efa0c:     	movaps	%xmm11, 0x20(%rbp)
1454efa11:     	movaps	%xmm10, 0x10(%rbp)
1454efa16:     	movaps	%xmm9, (%rbp)
1454efa1b:     	movaps	%xmm8, -0x10(%rbp)
1454efa20:     	movaps	%xmm7, -0x20(%rbp)
1454efa24:     	movaps	%xmm6, -0x30(%rbp)
1454efa28:     	movq	$-0x2, -0x38(%rbp)
1454efa30:     	movq	%rdx, %rdi
1454efa33:     	movq	%rcx, %rsi
1454efa36:     	movq	0x210(%rcx), %rcx
1454efa3d:     	movq	0x218(%rsi), %rdx
1454efa44:     	callq	0x14540e820 <.text+0x540d820>
1454efa49:     	imulq	$0xf0, %rax, %r14
1454efa50:     	leaq	0x12269e1(%rip), %rbx   # 0x146716438
1454efa57:     	movss	0x8e4(%rsi), %xmm6
1454efa5f:     	movaps	%xmm6, %xmm9
1454efa63:     	divss	0x441494(%rip), %xmm9   # 0x145930f00
1454efa6c:     	movss	0x944(%rsi), %xmm10
1454efa75:     	movss	0xe0(%r14,%rbx), %xmm8
1454efa7f:     	movq	0x88(%r14,%rbx), %rdx
1454efa87:     	leaq	0x1b8(%rdx), %r8
1454efa8e:     	leaq	-0x58(%rbp), %rcx
1454efa92:     	callq	0x14552b760 <.text+0x552a760>
1454efa97:     	movq	-0x50(%rbp), %r15
1454efa9b:     	movq	-0x48(%rbp), %rdx
1454efa9f:     	cmpq	$0x1, %rdx
1454efaa3:     	je	0x1454efb5e <.text+0x54eeb5e>
1454efaa9:     	xorps	%xmm11, %xmm11
1454efaad:     	testq	%rdx, %rdx
1454efab0:     	je	0x1454efb64 <.text+0x54eeb64>
1454efab6:     	movss	(%r15), %xmm0
1454efabb:     	ucomiss	%xmm9, %xmm0
1454efabf:     	jae	0x1454efcd4 <.text+0x54eecd4>
1454efac5:     	leaq	(,%rdx,8), %rax
1454efacd:     	xorl	%ecx, %ecx
1454efacf:     	nop
1454efad0:     	movss	(%r15,%rcx,8), %xmm0
1454efad6:     	ucomiss	%xmm9, %xmm0
1454efada:     	jae	0x1454efae9 <.text+0x54eeae9>
1454efadc:     	incq	%rcx
1454efadf:     	addq	$-0x8, %rax
1454efae3:     	jne	0x1454efad0 <.text+0x54eead0>
1454efae5:     	leaq	-0x1(%rdx), %rcx
1454efae9:     	cmpq	$0x1, %rcx
1454efaed:     	adcq	$0x0, %rcx
1454efaf1:     	leaq	-0x1(%rcx), %rax
1454efaf5:     	cmpq	%rdx, %rax
1454efaf8:     	jae	0x1454efd27 <.text+0x54eed27>
1454efafe:     	cmpq	%rdx, %rcx
1454efb01:     	jae	0x1454efd3d <.text+0x54eed3d>
1454efb07:     	movss	-0x8(%r15,%rcx,8), %xmm0
1454efb0e:     	movss	-0x4(%r15,%rcx,8), %xmm1
1454efb15:     	movss	(%r15,%rcx,8), %xmm2
1454efb1b:     	movss	0x4(%r15,%rcx,8), %xmm3
1454efb22:     	subss	%xmm1, %xmm3
1454efb26:     	movaps	%xmm9, %xmm11
1454efb2a:     	subss	%xmm0, %xmm11
1454efb2f:     	mulss	%xmm3, %xmm11
1454efb34:     	subss	%xmm0, %xmm2
1454efb38:     	maxss	0x406b48(%rip), %xmm2   # 0x1458f6688
1454efb40:     	divss	%xmm2, %xmm11
1454efb45:     	addss	%xmm1, %xmm11
1454efb4a:     	addq	%r14, %rbx
1454efb4d:     	movq	0x80(%rbx), %rdx
1454efb54:     	cmpq	%rdx, %rdi
1454efb57:     	jb	0x1454efb77 <.text+0x54eeb77>
1454efb59:     	jmp	0x1454efd11 <.text+0x54eed11>
1454efb5e:     	movss	0x4(%r15), %xmm11
1454efb64:     	addq	%r14, %rbx
1454efb67:     	movq	0x80(%rbx), %rdx
1454efb6e:     	cmpq	%rdx, %rdi
1454efb71:     	jae	0x1454efd11 <.text+0x54eed11>
1454efb77:     	movq	0x78(%rbx), %rax
1454efb7b:     	leaq	(%rdi,%rdi,4), %rcx
1454efb7f:     	shlq	$0x4, %rcx
1454efb83:     	movss	0x30(%rax,%rcx), %xmm12
1454efb8a:     	movss	0x3fb8ee(%rip), %xmm7   # 0x1458eb480
1454efb92:     	cmpl	$0x1, 0x858(%rsi)
1454efb99:     	jne	0x1454efbce <.text+0x54eebce>
1454efb9b:     	cmpb	$0x0, 0x952(%rsi)
1454efba2:     	je	0x1454efbce <.text+0x54eebce>
1454efba4:     	subss	0x85c(%rsi), %xmm6
1454efbac:     	divss	0x44134c(%rip), %xmm6   # 0x145930f00
1454efbb4:     	xorps	%xmm0, %xmm0
1454efbb7:     	maxss	%xmm0, %xmm6
1454efbbb:     	movss	0x14ba971(%rip), %xmm0  # 0x1469aa534
1454efbc3:     	movaps	%xmm6, %xmm1
1454efbc6:     	callq	0x145756e73 <.text+0x5755e73>
1454efbcb:     	movaps	%xmm0, %xmm7
1454efbce:     	movzwl	0x232(%rsi), %edi
1454efbd5:     	movl	0x664(%rsi), %esi
1454efbdb:     	movq	-0x58(%rbp), %rdx
1454efbdf:     	testq	%rdx, %rdx
1454efbe2:     	je	0x1454efbf6 <.text+0x54eebf6>
1454efbe4:     	shlq	$0x3, %rdx
1454efbe8:     	movl	$0x4, %r8d
1454efbee:     	movq	%r15, %rcx
1454efbf1:     	callq	0x1400021d0 <.text+0x11d0>
1454efbf6:     	movzwl	%di, %eax
1454efbf9:     	xorps	%xmm1, %xmm1
1454efbfc:     	cvtsi2ss	%eax, %xmm1
1454efc00:     	divss	0x3fb924(%rip), %xmm1   # 0x1458eb52c
1454efc08:     	mulss	0x3fb913(%rip), %xmm11  # 0x1458eb524
1454efc11:     	mulss	%xmm10, %xmm8
1454efc16:     	mulss	%xmm8, %xmm11
1454efc1b:     	movss	0x3fb8fd(%rip), %xmm0   # 0x1458eb520
1454efc23:     	mulss	%xmm9, %xmm0
1454efc28:     	movss	0x3fb850(%rip), %xmm2   # 0x1458eb480
1454efc30:     	addss	%xmm2, %xmm0
1454efc34:     	movss	0x41b284(%rip), %xmm3   # 0x14590aec0
1454efc3c:     	mulss	%xmm9, %xmm3
1454efc41:     	mulss	%xmm9, %xmm3
1454efc46:     	addss	%xmm0, %xmm3
1454efc4a:     	mulss	%xmm8, %xmm3
1454efc4f:     	mulss	%xmm12, %xmm3
1454efc54:     	mulss	0x44efd4(%rip), %xmm3   # 0x14593ec30
1454efc5c:     	movaps	%xmm11, %xmm0
1454efc60:     	maxss	%xmm3, %xmm0
1454efc64:     	movaps	%xmm0, %xmm3
1454efc67:     	cmpunordss	%xmm0, %xmm3
1454efc6c:     	movaps	%xmm3, %xmm4
1454efc6f:     	andnps	%xmm0, %xmm4
1454efc72:     	andps	%xmm11, %xmm3
1454efc76:     	orps	%xmm4, %xmm3
1454efc79:     	mulss	0x4069ab(%rip), %xmm3   # 0x1458f662c
1454efc81:     	movl	%esi, %eax
1454efc83:     	xorps	%xmm0, %xmm0
1454efc86:     	cvtsi2ss	%rax, %xmm0
1454efc8b:     	mulss	%xmm7, %xmm3
1454efc8f:     	mulss	0x3fd379(%rip), %xmm0   # 0x1458ed010
1454efc97:     	addss	%xmm2, %xmm0
1454efc9b:     	mulss	%xmm3, %xmm0
1454efc9f:     	mulss	%xmm1, %xmm0
1454efca3:     	movaps	-0x30(%rbp), %xmm6
1454efca7:     	movaps	-0x20(%rbp), %xmm7
1454efcab:     	movaps	-0x10(%rbp), %xmm8
1454efcb0:     	movaps	(%rbp), %xmm9
1454efcb5:     	movaps	0x10(%rbp), %xmm10
1454efcba:     	movaps	0x20(%rbp), %xmm11
1454efcbf:     	movaps	0x30(%rbp), %xmm12
1454efcc4:     	addq	$0xc8, %rsp
1454efccb:     	popq	%rbx
1454efccc:     	popq	%rdi
1454efccd:     	popq	%rsi
1454efcce:     	popq	%r14
1454efcd0:     	popq	%r15
1454efcd2:     	popq	%rbp
1454efcd3:     	retq
1454efcd4:     	movss	0x41b21f(%rip), %xmm11  # 0x14590aefc
1454efcdd:     	mulss	%xmm9, %xmm11
1454efce2:     	maxss	0x40699e(%rip), %xmm0   # 0x1458f6688
1454efcea:     	divss	%xmm0, %xmm11
1454efcef:     	addss	0x3fb82c(%rip), %xmm11  # 0x1458eb524
1454efcf8:     	mulss	0x4(%r15), %xmm11
1454efcfe:     	addq	%r14, %rbx
1454efd01:     	movq	0x80(%rbx), %rdx
1454efd08:     	cmpq	%rdx, %rdi
1454efd0b:     	jb	0x1454efb77 <.text+0x54eeb77>
1454efd11:     	movq	%r15, -0x40(%rbp)
1454efd15:     	leaq	0x14bcb5c(%rip), %r8    # 0x1469ac878
1454efd1c:     	movq	%rdi, %rcx
1454efd1f:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454efd24:     	nop
1454efd25:     	jmp	0x1454efd4e <.text+0x54eed4e>
1454efd27:     	movq	%r15, -0x40(%rbp)
1454efd2b:     	leaq	0x14bcb16(%rip), %r8    # 0x1469ac848
1454efd32:     	movq	%rax, %rcx
1454efd35:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454efd3a:     	nop
1454efd3b:     	jmp	0x1454efd4e <.text+0x54eed4e>
1454efd3d:     	movq	%r15, -0x40(%rbp)
1454efd41:     	leaq	0x14bcb18(%rip), %r8    # 0x1469ac860
1454efd48:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454efd4d:     	nop
1454efd4e:     	ud2

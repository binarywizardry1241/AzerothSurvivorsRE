
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14551dc20:     	pushq	%r15
14551dc22:     	pushq	%r14
14551dc24:     	pushq	%r13
14551dc26:     	pushq	%r12
14551dc28:     	pushq	%rsi
14551dc29:     	pushq	%rdi
14551dc2a:     	pushq	%rbp
14551dc2b:     	pushq	%rbx
14551dc2c:     	subq	$0xd8, %rsp
14551dc33:     	movaps	%xmm15, 0xc0(%rsp)
14551dc3c:     	movaps	%xmm14, 0xb0(%rsp)
14551dc45:     	movaps	%xmm13, 0xa0(%rsp)
14551dc4e:     	movaps	%xmm12, 0x90(%rsp)
14551dc57:     	movaps	%xmm11, 0x80(%rsp)
14551dc60:     	movaps	%xmm10, 0x70(%rsp)
14551dc66:     	movaps	%xmm9, 0x60(%rsp)
14551dc6c:     	movaps	%xmm8, 0x50(%rsp)
14551dc72:     	movaps	%xmm7, 0x40(%rsp)
14551dc77:     	movaps	%xmm6, 0x30(%rsp)
14551dc7c:     	movss	0x140(%rsp), %xmm0
14551dc85:     	ucomiss	0x3e9804(%rip), %xmm0   # 0x145907490
14551dc8c:     	jae	0x14551dc95 <.text+0x551cc95>
14551dc8e:     	xorl	%eax, %eax
14551dc90:     	jmp	0x14551e175 <.text+0x551d175>
14551dc95:     	movaps	%xmm2, %xmm6
14551dc98:     	movq	%rdx, %rdi
14551dc9b:     	movq	0x150(%rsp), %r14
14551dca3:     	movss	0x148(%rsp), %xmm13
14551dcad:     	xorps	%xmm0, %xmm0
14551dcb0:     	ucomiss	%xmm13, %xmm0
14551dcb4:     	jae	0x14551dfe4 <.text+0x551cfe4>
14551dcba:     	movq	%rcx, 0x28(%rsp)
14551dcbf:     	movq	0x228(%r14), %rbx
14551dcc6:     	movq	0x230(%r14), %r14
14551dccd:     	unpcklps	%xmm3, %xmm6            # xmm6 = xmm6[0],xmm3[0],xmm6[1],xmm3[1]
14551dcd0:     	movss	0x3e97b7(%rip), %xmm14  # 0x145907490
14551dcd9:     	movss	0x3eb902(%rip), %xmm15  # 0x1459095e4
14551dce2:     	movq	$-0x1, %r12
14551dce9:     	leaq	0x1215828(%rip), %r13   # 0x146733518
14551dcf0:     	jmp	0x14551dd1c <.text+0x551cd1c>
14551dcf2:     	nopw	%cs:(%rax,%rax)
14551dd00:     	addss	0x3e9787(%rip), %xmm14  # 0x145907490
14551dd09:     	movss	0x140(%rsp), %xmm0
14551dd12:     	ucomiss	%xmm14, %xmm0
14551dd16:     	jb	0x14551e16e <.text+0x551d16e>
14551dd1c:     	movaps	%xmm14, %xmm0
14551dd20:     	mulss	%xmm15, %xmm0
14551dd25:     	callq	0x14577327d <.text+0x577227d>
14551dd2a:     	cvttss2si	%xmm0, %rax
14551dd2f:     	movq	%rax, %rcx
14551dd32:     	sarq	$0x3f, %rcx
14551dd36:     	movaps	%xmm0, %xmm1
14551dd39:     	subss	0x3e949f(%rip), %xmm1   # 0x1459071e0
14551dd41:     	cvttss2si	%xmm1, %rbp
14551dd46:     	andq	%rcx, %rbp
14551dd49:     	orq	%rax, %rbp
14551dd4c:     	xorps	%xmm1, %xmm1
14551dd4f:     	ucomiss	%xmm1, %xmm0
14551dd52:     	movl	$0x0, %eax
14551dd57:     	cmovbq	%rax, %rbp
14551dd5b:     	ucomiss	0x3e9482(%rip), %xmm0   # 0x1459071e4
14551dd62:     	cmovaq	%r12, %rbp
14551dd66:     	testq	%rbp, %rbp
14551dd69:     	je	0x14551dd00 <.text+0x551cd00>
14551dd6b:     	js	0x14551dd80 <.text+0x551cd80>
14551dd6d:     	cvtsi2ss	%rbp, %xmm12
14551dd72:     	jmp	0x14551dd98 <.text+0x551cd98>
14551dd74:     	nopw	%cs:(%rax,%rax)
14551dd80:     	movq	%rbp, %rax
14551dd83:     	shrq	%rax
14551dd86:     	movl	%ebp, %ecx
14551dd88:     	andl	$0x1, %ecx
14551dd8b:     	orq	%rax, %rcx
14551dd8e:     	cvtsi2ss	%rcx, %xmm12
14551dd93:     	addss	%xmm12, %xmm12
14551dd98:     	movsldup	%xmm14, %xmm11          # xmm11 = xmm14[0,0,2,2]
14551dd9d:     	xorl	%esi, %esi
14551dd9f:     	jmp	0x14551ddbc <.text+0x551cdbc>
14551dda1:     	nopw	%cs:(%rax,%rax)
14551ddb0:     	incq	%rsi
14551ddb3:     	cmpq	%rbp, %rsi
14551ddb6:     	je	0x14551dd00 <.text+0x551cd00>
14551ddbc:     	testq	%rsi, %rsi
14551ddbf:     	js	0x14551ddd0 <.text+0x551cdd0>
14551ddc1:     	xorps	%xmm8, %xmm8
14551ddc5:     	cvtsi2ss	%rsi, %xmm8
14551ddca:     	jmp	0x14551ddec <.text+0x551cdec>
14551ddcc:     	nopl	(%rax)
14551ddd0:     	movq	%rsi, %rax
14551ddd3:     	shrq	%rax
14551ddd6:     	movl	%esi, %ecx
14551ddd8:     	andl	$0x1, %ecx
14551dddb:     	orq	%rax, %rcx
14551ddde:     	xorps	%xmm8, %xmm8
14551dde2:     	cvtsi2ss	%rcx, %xmm8
14551dde7:     	addss	%xmm8, %xmm8
14551ddec:     	mulss	%xmm15, %xmm8
14551ddf1:     	divss	%xmm12, %xmm8
14551ddf6:     	movaps	%xmm8, %xmm0
14551ddfa:     	callq	0x145773247 <.text+0x5772247>
14551ddff:     	movaps	%xmm0, %xmm7
14551de02:     	movaps	%xmm8, %xmm0
14551de06:     	callq	0x145773235 <.text+0x5772235>
14551de0b:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
14551de0e:     	mulps	%xmm11, %xmm7
14551de12:     	addps	%xmm6, %xmm7
14551de15:     	movq	%rbx, %rcx
14551de18:     	movq	%r14, %rdx
14551de1b:     	callq	0x145420480 <.text+0x541f480>
14551de20:     	imulq	$0xf0, %rax, %rcx
14551de27:     	leaq	(%rcx,%r13), %r15
14551de2b:     	movq	0x60(%rcx,%r13), %rdx
14551de30:     	movshdup	%xmm7, %xmm8            # xmm8 = xmm7[1,1,3,3]
14551de35:     	cmpq	$0x2, %rax
14551de39:     	je	0x14551de44 <.text+0x551ce44>
14551de3b:     	cmpl	$0x7, %eax
14551de3e:     	jne	0x14551def0 <.text+0x551cef0>
14551de44:     	movq	0x58(%r15), %rax
14551de48:     	leaq	-0x1(%rdx), %rcx
14551de4c:     	xorl	%r8d, %r8d
14551de4f:     	xorl	%r9d, %r9d
14551de52:     	jmp	0x14551de6b <.text+0x551ce6b>
14551de54:     	nopw	%cs:(%rax,%rax)
14551de60:     	movq	%r9, %rcx
14551de63:     	incq	%r9
14551de66:     	cmpq	%r9, %rdx
14551de69:     	je	0x14551dee0 <.text+0x551cee0>
14551de6b:     	cmpq	%rdx, %rcx
14551de6e:     	jae	0x14551e1de <.text+0x551d1de>
14551de74:     	movsd	(%rax,%r9,8), %xmm0
14551de7a:     	movss	0x4(%rax,%rcx,8), %xmm1
14551de80:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
14551de84:     	movaps	%xmm8, %xmm3
14551de88:     	cmpltss	%xmm1, %xmm3
14551de8d:     	movaps	%xmm8, %xmm4
14551de91:     	cmpltss	%xmm2, %xmm4
14551de96:     	xorps	%xmm3, %xmm4
14551de99:     	movd	%xmm4, %r10d
14551de9e:     	testb	$0x1, %r10b
14551dea2:     	je	0x14551de60 <.text+0x551ce60>
14551dea4:     	movss	(%rax,%rcx,8), %xmm3
14551dea9:     	movaps	%xmm7, %xmm4
14551deac:     	movss	%xmm3, %xmm4            # xmm4 = xmm3[0],xmm4[1,2,3]
14551deb0:     	subps	%xmm0, %xmm4
14551deb3:     	movshdup	%xmm4, %xmm3            # xmm3 = xmm4[1,1,3,3]
14551deb7:     	mulss	%xmm4, %xmm3
14551debb:     	subss	%xmm2, %xmm1
14551debf:     	divss	%xmm1, %xmm3
14551dec3:     	addss	%xmm0, %xmm3
14551dec7:     	ucomiss	%xmm7, %xmm3
14551deca:     	jbe	0x14551de60 <.text+0x551ce60>
14551decc:     	xorb	$0x1, %r8b
14551ded0:     	jmp	0x14551de60 <.text+0x551ce60>
14551ded2:     	nopw	%cs:(%rax,%rax)
14551dee0:     	testb	$0x1, %r8b
14551dee4:     	je	0x14551ddb0 <.text+0x551cdb0>
14551deea:     	jmp	0x14551df30 <.text+0x551cf30>
14551deec:     	nopl	(%rax)
14551def0:     	movss	0xc8(%r15), %xmm1
14551def9:     	movaps	%xmm7, %xmm0
14551defc:     	subss	%xmm1, %xmm0
14551df00:     	movss	0xcc(%r15), %xmm2
14551df09:     	movaps	%xmm8, %xmm1
14551df0d:     	subss	%xmm2, %xmm1
14551df11:     	callq	0x145773277 <.text+0x5772277>
14551df16:     	movss	0xd8(%r15), %xmm1
14551df1f:     	addss	0x3f78d9(%rip), %xmm1   # 0x145915800
14551df27:     	ucomiss	%xmm1, %xmm0
14551df2a:     	ja	0x14551ddb0 <.text+0x551cdb0>
14551df30:     	movq	%rdi, %rcx
14551df33:     	movaps	%xmm7, %xmm1
14551df36:     	movaps	%xmm8, %xmm2
14551df3a:     	callq	0x14552a140 <.text+0x5529140>
14551df3f:     	cmpl	$0x1, %eax
14551df42:     	jne	0x14551ddb0 <.text+0x551cdb0>
14551df48:     	movaps	%xmm0, %xmm9
14551df4c:     	movaps	%xmm13, %xmm1
14551df50:     	addss	%xmm7, %xmm1
14551df54:     	movaps	%xmm8, %xmm10
14551df58:     	xorps	%xmm0, %xmm0
14551df5b:     	addss	%xmm0, %xmm10
14551df60:     	movq	%rdi, %rcx
14551df63:     	movaps	%xmm10, %xmm2
14551df67:     	callq	0x14552a140 <.text+0x5529140>
14551df6c:     	cmpl	$0x1, %eax
14551df6f:     	jne	0x14551ddb0 <.text+0x551cdb0>
14551df75:     	movaps	%xmm7, %xmm1
14551df78:     	subss	%xmm13, %xmm1
14551df7d:     	movq	%rdi, %rcx
14551df80:     	movaps	%xmm10, %xmm2
14551df84:     	callq	0x14552a140 <.text+0x5529140>
14551df89:     	cmpl	$0x1, %eax
14551df8c:     	jne	0x14551ddb0 <.text+0x551cdb0>
14551df92:     	movaps	%xmm7, %xmm10
14551df96:     	xorps	%xmm0, %xmm0
14551df99:     	addss	%xmm0, %xmm10
14551df9e:     	movaps	%xmm13, %xmm2
14551dfa2:     	addss	%xmm8, %xmm2
14551dfa7:     	movq	%rdi, %rcx
14551dfaa:     	movaps	%xmm10, %xmm1
14551dfae:     	callq	0x14552a140 <.text+0x5529140>
14551dfb3:     	cmpl	$0x1, %eax
14551dfb6:     	jne	0x14551ddb0 <.text+0x551cdb0>
14551dfbc:     	subss	%xmm13, %xmm8
14551dfc1:     	movq	%rdi, %rcx
14551dfc4:     	movaps	%xmm10, %xmm1
14551dfc8:     	movaps	%xmm8, %xmm2
14551dfcc:     	callq	0x14552a140 <.text+0x5529140>
14551dfd1:     	cmpl	$0x1, %eax
14551dfd4:     	jne	0x14551ddb0 <.text+0x551cdb0>
14551dfda:     	movq	0x28(%rsp), %rcx
14551dfdf:     	jmp	0x14551e15d <.text+0x551d15d>
14551dfe4:     	movq	%rcx, %r13
14551dfe7:     	unpcklps	%xmm3, %xmm6            # xmm6 = xmm6[0],xmm3[0],xmm6[1],xmm3[1]
14551dfea:     	movss	0x3e949d(%rip), %xmm10  # 0x145907490
14551dff3:     	movss	0x3eb5e8(%rip), %xmm11  # 0x1459095e4
14551dffc:     	xorl	%esi, %esi
14551dffe:     	movss	0x3e91dd(%rip), %xmm13  # 0x1459071e4
14551e007:     	movq	$-0x1, %rbx
14551e00e:     	movaps	%xmm10, %xmm14
14551e012:     	jmp	0x14551e038 <.text+0x551d038>
14551e014:     	nopw	%cs:(%rax,%rax)
14551e020:     	addss	%xmm10, %xmm14
14551e025:     	movss	0x140(%rsp), %xmm0
14551e02e:     	ucomiss	%xmm14, %xmm0
14551e032:     	jb	0x14551e1d7 <.text+0x551d1d7>
14551e038:     	movaps	%xmm14, %xmm0
14551e03c:     	mulss	%xmm11, %xmm0
14551e041:     	callq	0x14577327d <.text+0x577227d>
14551e046:     	cvttss2si	%xmm0, %rax
14551e04b:     	movq	%rax, %rcx
14551e04e:     	sarq	$0x3f, %rcx
14551e052:     	movaps	%xmm0, %xmm1
14551e055:     	subss	0x3e9183(%rip), %xmm1   # 0x1459071e0
14551e05d:     	cvttss2si	%xmm1, %r15
14551e062:     	andq	%rcx, %r15
14551e065:     	orq	%rax, %r15
14551e068:     	xorps	%xmm1, %xmm1
14551e06b:     	ucomiss	%xmm1, %xmm0
14551e06e:     	cmovbq	%rsi, %r15
14551e072:     	ucomiss	%xmm13, %xmm0
14551e076:     	cmovaq	%rbx, %r15
14551e07a:     	testq	%r15, %r15
14551e07d:     	je	0x14551e020 <.text+0x551d020>
14551e07f:     	js	0x14551e090 <.text+0x551d090>
14551e081:     	xorps	%xmm15, %xmm15
14551e085:     	cvtsi2ss	%r15, %xmm15
14551e08a:     	jmp	0x14551e0ad <.text+0x551d0ad>
14551e08c:     	nopl	(%rax)
14551e090:     	movq	%r15, %rax
14551e093:     	shrq	%rax
14551e096:     	movl	%r15d, %ecx
14551e099:     	andl	$0x1, %ecx
14551e09c:     	orq	%rax, %rcx
14551e09f:     	xorps	%xmm15, %xmm15
14551e0a3:     	cvtsi2ss	%rcx, %xmm15
14551e0a8:     	addss	%xmm15, %xmm15
14551e0ad:     	movsldup	%xmm14, %xmm12          # xmm12 = xmm14[0,0,2,2]
14551e0b2:     	xorl	%r12d, %r12d
14551e0b5:     	jmp	0x14551e0cc <.text+0x551d0cc>
14551e0b7:     	nopw	(%rax,%rax)
14551e0c0:     	incq	%r12
14551e0c3:     	cmpq	%r12, %r15
14551e0c6:     	je	0x14551e020 <.text+0x551d020>
14551e0cc:     	testq	%r12, %r12
14551e0cf:     	js	0x14551e0e0 <.text+0x551d0e0>
14551e0d1:     	xorps	%xmm8, %xmm8
14551e0d5:     	cvtsi2ss	%r12, %xmm8
14551e0da:     	jmp	0x14551e0fd <.text+0x551d0fd>
14551e0dc:     	nopl	(%rax)
14551e0e0:     	movq	%r12, %rax
14551e0e3:     	shrq	%rax
14551e0e6:     	movl	%r12d, %ecx
14551e0e9:     	andl	$0x1, %ecx
14551e0ec:     	orq	%rax, %rcx
14551e0ef:     	xorps	%xmm8, %xmm8
14551e0f3:     	cvtsi2ss	%rcx, %xmm8
14551e0f8:     	addss	%xmm8, %xmm8
14551e0fd:     	mulss	%xmm11, %xmm8
14551e102:     	divss	%xmm15, %xmm8
14551e107:     	movaps	%xmm8, %xmm0
14551e10b:     	callq	0x145773247 <.text+0x5772247>
14551e110:     	movaps	%xmm0, %xmm7
14551e113:     	movaps	%xmm8, %xmm0
14551e117:     	callq	0x145773235 <.text+0x5772235>
14551e11c:     	unpcklps	%xmm0, %xmm7            # xmm7 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
14551e11f:     	mulps	%xmm12, %xmm7
14551e123:     	addps	%xmm6, %xmm7
14551e126:     	movshdup	%xmm7, %xmm8            # xmm8 = xmm7[1,1,3,3]
14551e12b:     	movq	%r14, %rcx
14551e12e:     	movaps	%xmm7, %xmm1
14551e131:     	movaps	%xmm8, %xmm2
14551e135:     	callq	0x14549b9d0 <.text+0x549a9d0>
14551e13a:     	testb	%al, %al
14551e13c:     	jne	0x14551e0c0 <.text+0x551d0c0>
14551e13e:     	movq	%rdi, %rcx
14551e141:     	movaps	%xmm7, %xmm1
14551e144:     	movaps	%xmm8, %xmm2
14551e148:     	callq	0x14552a140 <.text+0x5529140>
14551e14d:     	cmpl	$0x1, %eax
14551e150:     	jne	0x14551e0c0 <.text+0x551d0c0>
14551e156:     	movaps	%xmm0, %xmm9
14551e15a:     	movq	%r13, %rcx
14551e15d:     	movlps	%xmm7, 0x4(%rcx)
14551e161:     	movss	%xmm9, 0xc(%rcx)
14551e167:     	movl	$0x1, %eax
14551e16c:     	jmp	0x14551e175 <.text+0x551d175>
14551e16e:     	xorl	%eax, %eax
14551e170:     	movq	0x28(%rsp), %rcx
14551e175:     	movl	%eax, (%rcx)
14551e177:     	movq	%rcx, %rax
14551e17a:     	movaps	0x30(%rsp), %xmm6
14551e17f:     	movaps	0x40(%rsp), %xmm7
14551e184:     	movaps	0x50(%rsp), %xmm8
14551e18a:     	movaps	0x60(%rsp), %xmm9
14551e190:     	movaps	0x70(%rsp), %xmm10
14551e196:     	movaps	0x80(%rsp), %xmm11
14551e19f:     	movaps	0x90(%rsp), %xmm12
14551e1a8:     	movaps	0xa0(%rsp), %xmm13
14551e1b1:     	movaps	0xb0(%rsp), %xmm14
14551e1ba:     	movaps	0xc0(%rsp), %xmm15
14551e1c3:     	addq	$0xd8, %rsp
14551e1ca:     	popq	%rbx
14551e1cb:     	popq	%rbp
14551e1cc:     	popq	%rdi
14551e1cd:     	popq	%rsi
14551e1ce:     	popq	%r12
14551e1d0:     	popq	%r13
14551e1d2:     	popq	%r14
14551e1d4:     	popq	%r15
14551e1d6:     	retq
14551e1d7:     	xorl	%eax, %eax
14551e1d9:     	movq	%r13, %rcx
14551e1dc:     	jmp	0x14551e175 <.text+0x551d175>
14551e1de:     	leaq	0x120d813(%rip), %r8    # 0x14672b9f8
14551e1e5:     	callq	0x145903b33 <.text+0x5902b33>
14551e1ea:     	ud2

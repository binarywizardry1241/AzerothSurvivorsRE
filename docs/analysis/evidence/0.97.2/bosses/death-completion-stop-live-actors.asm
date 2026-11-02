
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145493030:     	movss	0x8e4(%rcx), %xmm9
145493039:     	movss	0x8e4(%rcx), %xmm10
145493042:     	movq	$0x0, -0x18(%rbp)
14549304a:     	movq	$0x8, -0x10(%rbp)
145493052:     	movq	$0x0, -0x8(%rbp)
14549305a:     	movq	0x4c8(%rcx), %rbx
145493061:     	imulq	$0x160, 0x4d0(%rcx), %rax # imm = 0x160
14549306c:     	addq	%rbx, %rax
14549306f:     	xorl	%r14d, %r14d
145493072:     	xorps	%xmm11, %xmm11
145493076:     	movss	0x458401(%rip), %xmm8   # 0x1458eb480
14549307f:     	leaq	-0x18(%rbp), %rdi
145493083:     	movq	%rax, -0x50(%rbp)
145493087:     	nopw	(%rax,%rax)
145493090:     	addq	$0x160, %rbx            # imm = 0x160
145493097:     	leaq	-0x160(%rbx), %rcx
14549309e:     	cmpq	%rax, %rcx
1454930a1:     	je	0x145493198 <.text+0x5492198>
1454930a7:     	cmpl	$0x0, 0x68(%rcx)
1454930ab:     	jne	0x145493090 <.text+0x5492090>
1454930ad:     	movss	-0x38(%rbx), %xmm0
1454930b2:     	ucomiss	%xmm11, %xmm0
1454930b6:     	jbe	0x145493090 <.text+0x5492090>
1454930b8:     	movss	-0x3c(%rbx), %xmm1
1454930bd:     	movaps	%xmm0, %xmm2
1454930c0:     	addss	%xmm1, %xmm2
1454930c4:     	ucomiss	%xmm9, %xmm2
1454930c8:     	jbe	0x145493090 <.text+0x5492090>
1454930ca:     	movq	%rcx, -0x58(%rbp)
1454930ce:     	movq	0x878(%rsi), %rcx
1454930d5:     	movaps	%xmm9, %xmm2
1454930d9:     	subss	%xmm1, %xmm2
1454930dd:     	divss	%xmm0, %xmm2
1454930e1:     	xorps	%xmm0, %xmm0
1454930e4:     	maxss	%xmm2, %xmm0
1454930e8:     	movaps	%xmm8, %xmm12
1454930ec:     	minss	%xmm0, %xmm12
1454930f1:     	movsd	-0x54(%rbx), %xmm0
1454930f6:     	movsd	-0x48(%rbx), %xmm1
1454930fb:     	subps	%xmm0, %xmm1
1454930fe:     	movsldup	%xmm12, %xmm6           # xmm6 = xmm12[0,0,2,2]
145493103:     	mulps	%xmm1, %xmm6
145493106:     	addps	%xmm0, %xmm6
145493109:     	movshdup	%xmm6, %xmm2            # xmm2 = xmm6[1,1,3,3]
14549310d:     	movss	-0x4c(%rbx), %xmm13
145493113:     	movss	-0x40(%rbx), %xmm14
145493119:     	addq	$0x10, %rcx
14549311d:     	movaps	%xmm6, %xmm1
145493120:     	callq	0x1454627f0 <.text+0x54617f0>
145493125:     	nop
145493126:     	movaps	%xmm0, %xmm7
145493129:     	testb	$0x1, %al
14549312b:     	jne	0x145493140 <.text+0x5492140>
14549312d:     	subss	%xmm13, %xmm14
145493132:     	mulss	%xmm14, %xmm12
145493137:     	addss	%xmm13, %xmm12
14549313c:     	movaps	%xmm12, %xmm7
145493140:     	movlps	%xmm6, -0x54(%rbx)
145493144:     	movss	%xmm7, -0x4c(%rbx)
145493149:     	movlps	%xmm6, -0x48(%rbx)
14549314d:     	movss	%xmm7, -0x40(%rbx)
145493152:     	movlps	%xmm10, -0x3c(%rbx)
145493157:     	movq	-0xd8(%rbx), %r15
14549315e:     	movq	-0x8(%rbp), %r14
145493162:     	cmpq	-0x18(%rbp), %r14
145493166:     	jne	0x145493171 <.text+0x5492171>
145493168:     	movq	%rdi, %rcx
14549316b:     	callq	0x145757f60 <.text+0x5756f60>
145493170:     	nop
145493171:     	movq	-0x10(%rbp), %rax
145493175:     	leaq	(%r14,%r14,2), %rcx
145493179:     	movq	%r15, (%rax,%rcx,8)
14549317d:     	movlps	%xmm6, 0x8(%rax,%rcx,8)
145493182:     	movss	%xmm7, 0x10(%rax,%rcx,8)
145493188:     	incq	%r14
14549318b:     	movq	%r14, -0x8(%rbp)
14549318f:     	movq	-0x50(%rbp), %rax
145493193:     	jmp	0x145493090 <.text+0x5492090>

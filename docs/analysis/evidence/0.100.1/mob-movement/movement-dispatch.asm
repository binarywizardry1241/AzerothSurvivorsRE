
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454de15b:     	leaq	0x28(%rax), %r15
1454de15f:     	movq	(%rax), %r13
1454de162:     	movl	0x10(%rax), %ecx
1454de165:     	movl	%ecx, 0x198(%rbp)
1454de16b:     	movq	0x8(%rax), %rcx
1454de16f:     	movq	%rcx, 0x190(%rbp)
1454de176:     	movsd	0x14(%rax), %xmm7
1454de17b:     	movss	0x1c(%rax), %xmm11
1454de181:     	movss	0x20(%rax), %xmm10
1454de187:     	movq	0x2a0(%rbp), %rax
1454de18e:     	movl	0x958(%rax), %ebx
1454de194:     	incl	%ebx
1454de196:     	movl	%ebx, 0x958(%rax)
1454de19c:     	ucomiss	%xmm10, %xmm9
1454de1a0:     	jae	0x1454de280 <.text+0x54dd280>
1454de1a6:     	movq	0x898(%rax), %rcx
1454de1ad:     	addq	$0x10, %rcx
1454de1b1:     	movsd	0x190(%rbp), %xmm8
1454de1ba:     	movshdup	%xmm8, %xmm2            # xmm2 = xmm8[1,1,3,3]
1454de1bf:     	movaps	%xmm8, %xmm1
1454de1c3:     	callq	0x14552a140 <.text+0x5529140>
1454de1c8:     	nop
1454de1c9:     	testb	$0x1, %al
1454de1cb:     	jne	0x1454de1d5 <.text+0x54dd1d5>
1454de1cd:     	movss	0x198(%rbp), %xmm0
1454de1d5:     	movlps	%xmm8, -0x8(%rbp)
1454de1da:     	movss	%xmm0, (%rbp)
1454de1df:     	movq	0x2a0(%rbp), %rax
1454de1e6:     	movq	0x898(%rax), %rcx
1454de1ed:     	addq	$0x10, %rcx
1454de1f1:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
1454de1f5:     	movaps	%xmm7, %xmm1
1454de1f8:     	callq	0x14552a140 <.text+0x5529140>
1454de1fd:     	nop
1454de1fe:     	testb	$0x1, %al
1454de200:     	jne	0x1454de206 <.text+0x54dd206>
1454de202:     	movaps	%xmm11, %xmm0
1454de206:     	movlps	%xmm7, -0x18(%rbp)
1454de20a:     	mulss	0x437705(%rip), %xmm10  # 0x145915918
1454de213:     	cvttss2si	%xmm10, %rax
1454de218:     	ucomiss	%xmm9, %xmm10
1454de21c:     	movl	$0x0, %ecx
1454de221:     	cmovbl	%ecx, %eax
1454de224:     	movss	%xmm0, -0x10(%rbp)
1454de229:     	ucomiss	%xmm13, %xmm10
1454de22d:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454de232:     	ja	0x1454de236 <.text+0x54dd236>
1454de234:     	movl	%eax, %ecx
1454de236:     	movl	%ecx, 0x28(%rsp)
1454de23a:     	movl	%ebx, 0x20(%rsp)
1454de23e:     	movq	%r14, %rcx
1454de241:     	movq	%r13, %rdx
1454de244:     	leaq	-0x8(%rbp), %r8
1454de248:     	movq	%r12, %r9
1454de24b:     	callq	0x14545b540 <.text+0x545a540>
1454de250:     	nop
1454de251:     	movq	0x2a0(%rbp), %rbx
1454de258:     	movq	0x560(%rbx), %rsi
1454de25f:     	cmpq	0x550(%rbx), %rsi
1454de266:     	jne	0x1454de120 <.text+0x54dd120>
1454de26c:     	movq	0x290(%rbp), %rcx
1454de273:     	callq	0x145774710 <.text+0x5773710>
1454de278:     	nop
1454de279:     	jmp	0x1454de120 <.text+0x54dd120>
1454de27e:     	nop
1454de280:     	movq	0x3e8(%rax), %rax
1454de287:     	movq	%rax, 0x20(%rsp)
1454de28c:     	movq	%r14, %rcx
1454de28f:     	movq	%r13, %rdx
1454de292:     	leaq	0x190(%rbp), %r8
1454de299:     	movl	%ebx, %r9d
1454de29c:     	callq	0x14545b080 <.text+0x545a080>

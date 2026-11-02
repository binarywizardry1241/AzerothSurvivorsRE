
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14550c1f0:     	subq	$0x28, %rsp
14550c1f4:     	movzbl	%dl, %eax
14550c1f7:     	leaq	0x14ecb3a(%rip), %rdx   # 0x1469f8d38
14550c1fe:     	movslq	(%rdx,%rax,4), %r9
14550c202:     	addq	%rdx, %r9
14550c205:     	jmpq	*%r9
14550c208:     	cmpq	$0x5, %r8
14550c20c:     	jae	0x14550c3cf <.text+0x550b3cf>
14550c212:     	movl	0x24(%rcx,%rax,4), %eax
14550c216:     	cvtsi2ss	%rax, %xmm1
14550c21b:     	leaq	0x14ec9fa(%rip), %rax   # 0x1469f8c1c
14550c222:     	mulss	0x3fb26e(%rip), %xmm1   # 0x145907498
14550c22a:     	movss	(%rax,%r8,4), %xmm0
14550c230:     	addss	0x3fb258(%rip), %xmm1   # 0x145907490
14550c238:     	divss	%xmm1, %xmm0
14550c23c:     	addq	$0x28, %rsp
14550c240:     	retq
14550c241:     	cmpq	$0x5, %r8
14550c245:     	jae	0x14550c3bd <.text+0x550b3bd>
14550c24b:     	leaq	0x14eca86(%rip), %rax   # 0x1469f8cd8
14550c252:     	movss	0x433586(%rip), %xmm0   # 0x14593f7e0
14550c25a:     	subss	0x20(%rcx), %xmm0
14550c25f:     	divss	0x40c5d9(%rip), %xmm0   # 0x145918840
14550c267:     	jmp	0x14550c34e <.text+0x550b34e>
14550c26c:     	movq	(%rcx), %r9
14550c26f:     	movl	$0xc, %eax
14550c274:     	cmpb	$0xb, 0x75(%r9)
14550c279:     	jne	0x14550c382 <.text+0x550b382>
14550c27f:     	movq	(%r9), %rdx
14550c282:     	movq	0x8(%r9), %rax
14550c286:     	cmpq	$0xb, %rax
14550c28a:     	je	0x14550c360 <.text+0x550b360>
14550c290:     	cmpq	$0x9, %rax
14550c294:     	jne	0x14550c380 <.text+0x550b380>
14550c29a:     	movabsq	$0x7461665f6c616573, %r9 # imm = 0x7461665F6C616573
14550c2a4:     	xorq	(%rdx), %r9
14550c2a7:     	movzbl	0x8(%rdx), %r10d
14550c2ac:     	xorq	$0x65, %r10
14550c2b0:     	movl	$0x2, %eax
14550c2b5:     	orq	%r9, %r10
14550c2b8:     	je	0x14550c382 <.text+0x550b382>
14550c2be:     	movabsq	$0x7269665f6c756f73, %r9 # imm = 0x7269665F6C756F73
14550c2c8:     	xorq	(%rdx), %r9
14550c2cb:     	movzbl	0x8(%rdx), %r10d
14550c2d0:     	xorq	$0x65, %r10
14550c2d4:     	orq	%r9, %r10
14550c2d7:     	je	0x14550c382 <.text+0x550b382>
14550c2dd:     	movabsq	$0x6c6577746867696c, %r9 # imm = 0x6C6577746867696C
14550c2e7:     	xorq	(%rdx), %r9
14550c2ea:     	movzbl	0x8(%rdx), %edx
14550c2ee:     	xorq	$0x6c, %rdx
14550c2f2:     	orq	%r9, %rdx
14550c2f5:     	jne	0x14550c380 <.text+0x550b380>
14550c2fb:     	jmp	0x14550c382 <.text+0x550b382>
14550c300:     	cmpq	$0x5, %r8
14550c304:     	jae	0x14550c3c6 <.text+0x550b3c6>
14550c30a:     	leaq	0x14ec997(%rip), %rax   # 0x1469f8ca8
14550c311:     	movss	0x40c527(%rip), %xmm0   # 0x145918840
14550c319:     	subss	0x1c(%rcx), %xmm0
14550c31e:     	mulss	0x3fd2ba(%rip), %xmm0   # 0x1459095e0
14550c326:     	jmp	0x14550c34e <.text+0x550b34e>
14550c328:     	cmpq	$0x5, %r8
14550c32c:     	jae	0x14550c3d8 <.text+0x550b3d8>
14550c332:     	leaq	0x14ec90f(%rip), %rax   # 0x1469f8c48
14550c339:     	movss	0x14(%rcx), %xmm0
14550c33e:     	addss	0x14ec7ee(%rip), %xmm0  # 0x1469f8b34
14550c346:     	divss	0x406faa(%rip), %xmm0   # 0x1459132f8
14550c34e:     	xorps	%xmm1, %xmm1
14550c351:     	maxss	%xmm1, %xmm0
14550c355:     	mulss	(%rax,%r8,4), %xmm0
14550c35b:     	addq	$0x28, %rsp
14550c35f:     	retq
14550c360:     	movabsq	$0x665f656972656166, %rax # imm = 0x665F656972656166
14550c36a:     	xorq	(%rdx), %rax
14550c36d:     	movabsq	$0x657269665f656972, %r9 # imm = 0x657269665F656972
14550c377:     	xorq	0x3(%rdx), %r9
14550c37b:     	orq	%rax, %r9
14550c37e:     	je	0x14550c3a9 <.text+0x550b3a9>
14550c380:     	xorl	%eax, %eax
14550c382:     	cmpq	$0x4, %r8
14550c386:     	ja	0x14550c3b4 <.text+0x550b3b4>
14550c388:     	xorl	%edx, %edx
14550c38a:     	subl	0x18(%rcx), %eax
14550c38d:     	leaq	0x14ec8e4(%rip), %rcx   # 0x1469f8c78
14550c394:     	cmovbl	%edx, %eax
14550c397:     	movl	(%rcx,%r8,4), %ecx
14550c39b:     	cmpl	%ecx, %eax
14550c39d:     	cmovael	%ecx, %eax
14550c3a0:     	cvtsi2ss	%eax, %xmm0
14550c3a4:     	addq	$0x28, %rsp
14550c3a8:     	retq
14550c3a9:     	movl	$0x2, %eax
14550c3ae:     	cmpq	$0x4, %r8
14550c3b2:     	jbe	0x14550c388 <.text+0x550b388>
14550c3b4:     	leaq	0x14ec8d5(%rip), %rax   # 0x1469f8c90
14550c3bb:     	jmp	0x14550c3df <.text+0x550b3df>
14550c3bd:     	leaq	0x14ec92c(%rip), %rax   # 0x1469f8cf0
14550c3c4:     	jmp	0x14550c3df <.text+0x550b3df>
14550c3c6:     	leaq	0x14ec8f3(%rip), %rax   # 0x1469f8cc0
14550c3cd:     	jmp	0x14550c3df <.text+0x550b3df>
14550c3cf:     	leaq	0x14ec85a(%rip), %rax   # 0x1469f8c30
14550c3d6:     	jmp	0x14550c3df <.text+0x550b3df>
14550c3d8:     	leaq	0x14ec881(%rip), %rax   # 0x1469f8c60
14550c3df:     	movl	$0x5, %edx
14550c3e4:     	movq	%r8, %rcx
14550c3e7:     	movq	%rax, %r8
14550c3ea:     	callq	0x145903b33 <.text+0x5902b33>
14550c3ef:     	ud2

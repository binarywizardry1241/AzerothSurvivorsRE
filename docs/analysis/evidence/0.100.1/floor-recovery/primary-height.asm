
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552a140:     	pushq	%rsi
14552a141:     	subq	$0x40, %rsp
14552a145:     	movaps	%xmm7, 0x30(%rsp)
14552a14a:     	movaps	%xmm6, 0x20(%rsp)
14552a14f:     	cmpb	$0x0, 0xac(%rcx)
14552a156:     	je	0x14552a16a <.text+0x552916a>
14552a158:     	movss	0xa8(%rcx), %xmm0
14552a160:     	movl	$0x1, %eax
14552a165:     	jmp	0x14552a2fb <.text+0x55292fb>
14552a16a:     	cmpq	$-0x1, 0x58(%rcx)
14552a16f:     	je	0x14552a1ba <.text+0x55291ba>
14552a171:     	movsd	0x78(%rcx), %xmm0
14552a176:     	unpcklps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
14552a179:     	subps	%xmm0, %xmm1
14552a17c:     	addps	%xmm1, %xmm1
14552a17f:     	xorps	%xmm0, %xmm0
14552a182:     	movaps	%xmm1, %xmm2
14552a185:     	cmpltps	%xmm0, %xmm2
14552a189:     	unpcklps	%xmm2, %xmm2            # xmm2 = xmm2[0,0,1,1]
14552a18c:     	movmskpd	%xmm2, %edx
14552a190:     	xorl	%eax, %eax
14552a192:     	testl	%edx, %edx
14552a194:     	jne	0x14552a22e <.text+0x552922e>
14552a19a:     	movq	0x70(%rcx), %rdx
14552a19e:     	testq	%rdx, %rdx
14552a1a1:     	js	0x14552a233 <.text+0x5529233>
14552a1a7:     	xorps	%xmm0, %xmm0
14552a1aa:     	cvtsi2ss	%rdx, %xmm0
14552a1af:     	ucomiss	%xmm0, %xmm1
14552a1b2:     	jb	0x14552a254 <.text+0x5529254>
14552a1b8:     	jmp	0x14552a22e <.text+0x552922e>
14552a1ba:     	movq	%rcx, %rsi
14552a1bd:     	movaps	%xmm1, %xmm6
14552a1c0:     	movaps	%xmm2, %xmm7
14552a1c3:     	callq	0x1455264f0 <.text+0x55254f0>
14552a1c8:     	testb	$0x1, %al
14552a1ca:     	je	0x14552a22c <.text+0x552922c>
14552a1cc:     	movl	$0x1, %eax
14552a1d1:     	cmpq	$-0x1, 0x80(%rsi)
14552a1d9:     	je	0x14552a2fb <.text+0x55292fb>
14552a1df:     	movq	%rsi, %r8
14552a1e2:     	movsd	0xa0(%rsi), %xmm2
14552a1ea:     	movaps	%xmm6, %xmm1
14552a1ed:     	unpcklps	%xmm7, %xmm1            # xmm1 = xmm1[0],xmm7[0],xmm1[1],xmm7[1]
14552a1f0:     	subps	%xmm2, %xmm1
14552a1f3:     	addps	%xmm1, %xmm1
14552a1f6:     	xorps	%xmm2, %xmm2
14552a1f9:     	movaps	%xmm1, %xmm3
14552a1fc:     	cmpltps	%xmm2, %xmm3
14552a200:     	unpcklps	%xmm3, %xmm3            # xmm3 = xmm3[0,0,1,1]
14552a203:     	movmskpd	%xmm3, %ecx
14552a207:     	testl	%ecx, %ecx
14552a209:     	jne	0x14552a2fb <.text+0x55292fb>
14552a20f:     	movq	0x98(%r8), %rdx
14552a216:     	testq	%rdx, %rdx
14552a219:     	js	0x14552a30b <.text+0x552930b>
14552a21f:     	xorps	%xmm3, %xmm3
14552a222:     	cvtsi2ss	%rdx, %xmm3
14552a227:     	jmp	0x14552a327 <.text+0x5529327>
14552a22c:     	xorl	%eax, %eax
14552a22e:     	jmp	0x14552a2fb <.text+0x55292fb>
14552a233:     	movq	%rdx, %r8
14552a236:     	shrq	%r8
14552a239:     	movl	%edx, %r9d
14552a23c:     	andl	$0x1, %r9d
14552a240:     	orq	%r8, %r9
14552a243:     	xorps	%xmm0, %xmm0
14552a246:     	cvtsi2ss	%r9, %xmm0
14552a24b:     	addss	%xmm0, %xmm0
14552a24f:     	ucomiss	%xmm0, %xmm1
14552a252:     	jae	0x14552a22e <.text+0x552922e>
14552a254:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14552a258:     	ucomiss	%xmm0, %xmm2
14552a25b:     	jae	0x14552a2fb <.text+0x55292fb>
14552a261:     	movss	0x3dcf77(%rip), %xmm0   # 0x1459071e0
14552a269:     	movaps	%xmm2, %xmm3
14552a26c:     	subss	%xmm0, %xmm3
14552a270:     	cvttss2si	%xmm3, %rax
14552a275:     	cvttss2si	%xmm2, %r8
14552a27a:     	movq	%r8, %r9
14552a27d:     	sarq	$0x3f, %r9
14552a281:     	andq	%rax, %r9
14552a284:     	orq	%r8, %r9
14552a287:     	xorl	%r8d, %r8d
14552a28a:     	xorps	%xmm3, %xmm3
14552a28d:     	ucomiss	%xmm3, %xmm2
14552a290:     	cmovbq	%r8, %r9
14552a294:     	movss	0x3dcf48(%rip), %xmm4   # 0x1459071e4
14552a29c:     	ucomiss	%xmm4, %xmm2
14552a29f:     	movq	$-0x1, %r10
14552a2a6:     	cmovaq	%r10, %r9
14552a2aa:     	imulq	%r9, %rdx
14552a2ae:     	movaps	%xmm1, %xmm2
14552a2b1:     	subss	%xmm0, %xmm2
14552a2b5:     	cvttss2si	%xmm2, %r9
14552a2ba:     	cvttss2si	%xmm1, %r11
14552a2bf:     	movq	%r11, %rax
14552a2c2:     	sarq	$0x3f, %rax
14552a2c6:     	andq	%r9, %rax
14552a2c9:     	orq	%r11, %rax
14552a2cc:     	ucomiss	%xmm3, %xmm1
14552a2cf:     	cmovbq	%r8, %rax
14552a2d3:     	ucomiss	%xmm4, %xmm1
14552a2d6:     	cmovaq	%r10, %rax
14552a2da:     	addq	%rdx, %rax
14552a2dd:     	movq	0x68(%rcx), %rdx
14552a2e1:     	cmpq	%rdx, %rax
14552a2e4:     	jae	0x14552a3e6 <.text+0x55293e6>
14552a2ea:     	movq	0x60(%rcx), %rcx
14552a2ee:     	movss	(%rcx,%rax,4), %xmm0
14552a2f3:     	xorl	%eax, %eax
14552a2f5:     	ucomiss	%xmm0, %xmm0
14552a2f8:     	setnp	%al
14552a2fb:     	movaps	0x20(%rsp), %xmm6
14552a300:     	movaps	0x30(%rsp), %xmm7
14552a305:     	addq	$0x40, %rsp
14552a309:     	popq	%rsi
14552a30a:     	retq
14552a30b:     	movq	%rdx, %rcx
14552a30e:     	shrq	%rcx
14552a311:     	movl	%edx, %r9d
14552a314:     	andl	$0x1, %r9d
14552a318:     	orq	%rcx, %r9
14552a31b:     	xorps	%xmm3, %xmm3
14552a31e:     	cvtsi2ss	%r9, %xmm3
14552a323:     	addss	%xmm3, %xmm3
14552a327:     	ucomiss	%xmm3, %xmm1
14552a32a:     	jae	0x14552a2fb <.text+0x55292fb>
14552a32c:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14552a330:     	ucomiss	%xmm3, %xmm2
14552a333:     	jae	0x14552a2fb <.text+0x55292fb>
14552a335:     	movss	0x3dcea3(%rip), %xmm3   # 0x1459071e0
14552a33d:     	movaps	%xmm2, %xmm4
14552a340:     	subss	%xmm3, %xmm4
14552a344:     	cvttss2si	%xmm4, %rcx
14552a349:     	cvttss2si	%xmm2, %r9
14552a34e:     	movq	%r9, %r10
14552a351:     	sarq	$0x3f, %r10
14552a355:     	andq	%rcx, %r10
14552a358:     	orq	%r9, %r10
14552a35b:     	xorl	%r9d, %r9d
14552a35e:     	xorps	%xmm4, %xmm4
14552a361:     	ucomiss	%xmm4, %xmm2
14552a364:     	cmovbq	%r9, %r10
14552a368:     	movss	0x3dce74(%rip), %xmm5   # 0x1459071e4
14552a370:     	ucomiss	%xmm5, %xmm2
14552a373:     	movq	$-0x1, %r11
14552a37a:     	cmovaq	%r11, %r10
14552a37e:     	imulq	%r10, %rdx
14552a382:     	movaps	%xmm1, %xmm2
14552a385:     	subss	%xmm3, %xmm2
14552a389:     	cvttss2si	%xmm2, %r10
14552a38e:     	cvttss2si	%xmm1, %rsi
14552a393:     	movq	%rsi, %rcx
14552a396:     	sarq	$0x3f, %rcx
14552a39a:     	andq	%r10, %rcx
14552a39d:     	orq	%rsi, %rcx
14552a3a0:     	ucomiss	%xmm4, %xmm1
14552a3a3:     	cmovbq	%r9, %rcx
14552a3a7:     	ucomiss	%xmm5, %xmm1
14552a3aa:     	cmovaq	%r11, %rcx
14552a3ae:     	addq	%rdx, %rcx
14552a3b1:     	movq	0x90(%r8), %rdx
14552a3b8:     	cmpq	%rdx, %rcx
14552a3bb:     	jae	0x14552a3f7 <.text+0x55293f7>
14552a3bd:     	movq	0x88(%r8), %rdx
14552a3c4:     	movss	(%rdx,%rcx,4), %xmm2
14552a3c9:     	ucomiss	%xmm2, %xmm2
14552a3cc:     	jp	0x14552a2fb <.text+0x55292fb>
14552a3d2:     	movaps	%xmm2, %xmm1
14552a3d5:     	ucomiss	%xmm0, %xmm2
14552a3d8:     	jbe	0x14552a2fb <.text+0x55292fb>
14552a3de:     	movaps	%xmm1, %xmm0
14552a3e1:     	jmp	0x14552a2fb <.text+0x55292fb>
14552a3e6:     	leaq	0x180ab73(%rip), %r8    # 0x146d34f60
14552a3ed:     	movq	%rax, %rcx
14552a3f0:     	callq	0x145903b33 <.text+0x5902b33>
14552a3f5:     	ud2
14552a3f7:     	leaq	0x180a9aa(%rip), %r8    # 0x146d34da8
14552a3fe:     	callq	0x145903b33 <.text+0x5902b33>
14552a403:     	ud2

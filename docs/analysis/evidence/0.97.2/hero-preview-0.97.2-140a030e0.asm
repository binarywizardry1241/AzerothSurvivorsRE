
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140a030e0:     	pushq	%rsi
140a030e1:     	subq	$0x120, %rsp            # imm = 0x120
140a030e8:     	movaps	%xmm15, 0x110(%rsp)
140a030f1:     	movaps	%xmm14, 0x100(%rsp)
140a030fa:     	movaps	%xmm13, 0xf0(%rsp)
140a03103:     	movaps	%xmm12, 0xe0(%rsp)
140a0310c:     	movaps	%xmm11, 0xd0(%rsp)
140a03115:     	movaps	%xmm10, 0xc0(%rsp)
140a0311e:     	movaps	%xmm9, 0xb0(%rsp)
140a03127:     	movaps	%xmm8, 0xa0(%rsp)
140a03130:     	movaps	%xmm7, 0x90(%rsp)
140a03138:     	movaps	%xmm6, 0x80(%rsp)
140a03140:     	movss	%xmm2, 0x2c(%rsp)
140a03146:     	movq	%rcx, %rsi
140a03149:     	xorps	%xmm11, %xmm11
140a0314d:     	testb	$0x1, 0x2c(%rdx)
140a03151:     	je	0x140a0318d <.text+0xa0218d>
140a03153:     	movss	0x54(%rdx), %xmm0
140a03158:     	movss	%xmm0, 0x28(%rsp)
140a0315e:     	movsd	0x4c(%rdx), %xmm10
140a03164:     	movss	0x48(%rdx), %xmm8
140a0316a:     	leaq	0x40(%rdx), %rcx
140a0316e:     	leaq	0x3c(%rdx), %rax
140a03172:     	movss	0x38(%rdx), %xmm14
140a03178:     	movsd	0x30(%rdx), %xmm13
140a0317e:     	addq	$0x44, %rdx
140a03182:     	mulss	0x4ee82fd(%rip), %xmm8  # 0x1458eb488
140a0318b:     	jmp	0x140a031c6 <.text+0xa021c6>
140a0318d:     	leaq	0x68(%rdx), %rax
140a03191:     	leaq	0x6c(%rdx), %rcx
140a03195:     	addq	$0x70, %rdx
140a03199:     	movsd	0x50273ce(%rip), %xmm13 # 0x145a2a570
140a031a2:     	movsd	0x50273d5(%rip), %xmm10 # 0x145a2a580
140a031ab:     	movss	0x50273dd(%rip), %xmm0  # 0x145a2a590
140a031b3:     	movss	%xmm0, 0x28(%rsp)
140a031b9:     	movss	0x50273d2(%rip), %xmm14 # 0x145a2a594
140a031c2:     	xorps	%xmm8, %xmm8
140a031c6:     	movss	(%rdx), %xmm9
140a031cb:     	movd	(%rcx), %xmm15
140a031d0:     	movd	(%rax), %xmm6
140a031d4:     	subss	%xmm14, %xmm9
140a031d9:     	movaps	%xmm9, %xmm12
140a031dd:     	mulss	%xmm9, %xmm12
140a031e2:     	movaps	%xmm8, %xmm0
140a031e6:     	callq	0x145756e2b <.text+0x5755e2b>
140a031eb:     	movaps	%xmm0, %xmm7
140a031ee:     	movaps	%xmm8, %xmm0
140a031f2:     	callq	0x145756e31 <.text+0x5755e31>
140a031f7:     	movlps	%xmm13, 0x60(%rsp)
140a031fd:     	movss	%xmm14, 0x68(%rsp)
140a03204:     	movabsq	$0x3f8000003f800000, %rax # imm = 0x3F8000003F800000
140a0320e:     	movq	%rax, 0x6c(%rsp)
140a03213:     	movl	$0x3f800000, 0x74(%rsp) # imm = 0x3F800000
140a0321b:     	punpckldq	%xmm15, %xmm6   # xmm6 = xmm6[0],xmm15[0],xmm6[1],xmm15[1]
140a03220:     	movq	%xmm6, %xmm1            # xmm1 = xmm6[0],zero
140a03224:     	subps	%xmm13, %xmm1
140a03228:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
140a0322c:     	movaps	%xmm1, %xmm3
140a0322f:     	mulps	%xmm1, %xmm3
140a03232:     	movshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
140a03236:     	addss	%xmm3, %xmm4
140a0323a:     	addss	%xmm12, %xmm4
140a0323f:     	sqrtss	%xmm4, %xmm4
140a03243:     	movss	0x4ee8235(%rip), %xmm3  # 0x1458eb480
140a0324b:     	divss	%xmm4, %xmm3
140a0324f:     	movd	%xmm3, %eax
140a03253:     	testl	%eax, %eax
140a03255:     	setns	%cl
140a03258:     	movl	%eax, %edx
140a0325a:     	andl	$0x7fffffff, %edx       # imm = 0x7FFFFFFF
140a03260:     	addl	$0xff800000, %edx       # imm = 0xFF800000
140a03266:     	cmpl	$0x7f000000, %edx       # imm = 0x7F000000
140a0326c:     	setb	%dl
140a0326f:     	andb	%cl, %dl
140a03271:     	decl	%eax
140a03273:     	cmpl	$0x7fffff, %eax         # imm = 0x7FFFFF
140a03278:     	setb	%al
140a0327b:     	orb	%dl, %al
140a0327d:     	je	0x140a03288 <.text+0xa02288>
140a0327f:     	movaps	%xmm1, %xmm11
140a03283:     	mulss	%xmm3, %xmm11
140a03288:     	mulss	%xmm7, %xmm11
140a0328d:     	movaps	%xmm9, %xmm4
140a03291:     	mulss	%xmm3, %xmm4
140a03295:     	mulss	%xmm3, %xmm2
140a03299:     	unpcklps	%xmm4, %xmm2            # xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
140a0329c:     	movzbl	%al, %eax
140a0329f:     	movd	%eax, %xmm3
140a032a3:     	pshufd	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
140a032a8:     	pslld	$0x1f, %xmm3
140a032ad:     	psrad	$0x1f, %xmm3
140a032b2:     	movq	%xmm2, %xmm2            # xmm2 = xmm2[0],zero
140a032b6:     	pand	%xmm3, %xmm2
140a032ba:     	movsldup	%xmm7, %xmm3            # xmm3 = xmm7[0,0,2,2]
140a032be:     	mulps	%xmm2, %xmm3
140a032c1:     	movaps	%xmm11, %xmm2
140a032c5:     	movlhps	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0]
140a032c8:     	movaps	%xmm2, %xmm4
140a032cb:     	shufps	$0xd8, %xmm3, %xmm4     # xmm4 = xmm4[0,2],xmm3[1,3]
140a032cf:     	shufps	$0xd4, %xmm3, %xmm0     # xmm0 = xmm0[0,1],xmm3[1,3]
140a032d3:     	shufps	$0x28, %xmm0, %xmm2     # xmm2 = xmm2[0,2],xmm0[2,0]
140a032d7:     	movaps	%xmm2, %xmm5
140a032da:     	mulps	%xmm2, %xmm5
140a032dd:     	movaps	%xmm5, %xmm0
140a032e0:     	shufps	$0xaa, %xmm5, %xmm0     # xmm0 = xmm0[2,2],xmm5[2,2]
140a032e4:     	movshdup	%xmm5, %xmm6            # xmm6 = xmm5[1,1,3,3]
140a032e8:     	addss	%xmm5, %xmm6
140a032ec:     	shufps	$0x0, %xmm6, %xmm6      # xmm6 = xmm6[0,0,0,0]
140a032f0:     	addps	%xmm0, %xmm6
140a032f3:     	shufps	$0xff, %xmm5, %xmm5     # xmm5 = xmm5[3,3,3,3]
140a032f7:     	subps	%xmm6, %xmm5
140a032fa:     	movsd	0x4ef5a6e(%rip), %xmm0  # 0x1458f8d70
140a03302:     	mulps	%xmm0, %xmm5
140a03305:     	mulps	%xmm4, %xmm0
140a03308:     	movshdup	%xmm0, %xmm6            # xmm6 = xmm0[1,1,3,3]
140a0330c:     	addss	%xmm0, %xmm6
140a03310:     	movhlps	%xmm0, %xmm0            # xmm0 = xmm0[1,1]
140a03313:     	addss	%xmm6, %xmm0
140a03317:     	addss	%xmm0, %xmm0
140a0331b:     	shufps	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
140a0331f:     	mulps	%xmm4, %xmm0
140a03322:     	addps	%xmm5, %xmm0
140a03325:     	shufps	$0x30, %xmm3, %xmm11    # xmm11 = xmm11[0,0],xmm3[3,0]
140a0332a:     	shufps	$0x84, %xmm11, %xmm3    # xmm3 = xmm3[0,1],xmm11[0,2]
140a0332f:     	mulps	0x4fc4f9a(%rip), %xmm3  # 0x1459c82d0
140a03336:     	shufps	$0xd2, %xmm4, %xmm4     # xmm4 = xmm4[2,0,1,3]
140a0333a:     	movss	0x4ee813e(%rip), %xmm5  # 0x1458eb480
140a03342:     	mulps	%xmm4, %xmm5
140a03345:     	subps	%xmm5, %xmm3
140a03348:     	addps	%xmm2, %xmm2
140a0334b:     	shufps	$0xff, %xmm2, %xmm2     # xmm2 = xmm2[3,3,3,3]
140a0334f:     	mulps	%xmm3, %xmm2
140a03352:     	addps	%xmm0, %xmm2
140a03355:     	movlps	%xmm2, 0x30(%rsp)
140a0335a:     	movhlps	%xmm2, %xmm2            # xmm2 = xmm2[1,1]
140a0335d:     	movss	%xmm2, 0x38(%rsp)
140a03363:     	movlps	%xmm1, 0x40(%rsp)
140a03368:     	movss	%xmm9, 0x48(%rsp)
140a0336f:     	leaq	0x50(%rsp), %rcx
140a03374:     	leaq	0x40(%rsp), %rdx
140a03379:     	leaq	0x30(%rsp), %r8
140a0337e:     	callq	0x140774320 <.text+0x773320>
140a03383:     	callq	0x140002200 <.text+0x1200>
140a03388:     	movl	$0x10, %ecx
140a0338d:     	movl	$0x4, %edx
140a03392:     	callq	0x1400021c0 <.text+0x11c0>
140a03397:     	testq	%rax, %rax
140a0339a:     	je	0x140a0344e <.text+0xa0244e>
140a033a0:     	movlps	%xmm10, (%rax)
140a033a4:     	movss	0x28(%rsp), %xmm0
140a033aa:     	movss	%xmm0, 0x8(%rax)
140a033af:     	movss	0x2c(%rsp), %xmm0
140a033b5:     	movss	%xmm0, 0xc(%rax)
140a033ba:     	movaps	0x50(%rsp), %xmm0
140a033bf:     	movaps	0x60(%rsp), %xmm1
140a033c4:     	movaps	0x70(%rsp), %xmm2
140a033c9:     	movaps	%xmm2, 0x20(%rsi)
140a033cd:     	movaps	%xmm1, 0x10(%rsi)
140a033d1:     	movaps	%xmm0, (%rsi)
140a033d4:     	movl	$0x8, 0x30(%rsi)
140a033db:     	movq	%rax, 0x38(%rsi)
140a033df:     	leaq	0x502efea(%rip), %rax   # 0x145a323d0
140a033e6:     	movq	%rax, 0x40(%rsi)
140a033ea:     	movq	%rsi, %rax
140a033ed:     	movaps	0x80(%rsp), %xmm6
140a033f5:     	movaps	0x90(%rsp), %xmm7
140a033fd:     	movaps	0xa0(%rsp), %xmm8
140a03406:     	movaps	0xb0(%rsp), %xmm9
140a0340f:     	movaps	0xc0(%rsp), %xmm10
140a03418:     	movaps	0xd0(%rsp), %xmm11
140a03421:     	movaps	0xe0(%rsp), %xmm12
140a0342a:     	movaps	0xf0(%rsp), %xmm13
140a03433:     	movaps	0x100(%rsp), %xmm14
140a0343c:     	movaps	0x110(%rsp), %xmm15
140a03445:     	addq	$0x120, %rsp            # imm = 0x120
140a0344c:     	popq	%rsi
140a0344d:     	retq
140a0344e:     	movl	$0x4, %ecx
140a03453:     	movl	$0x10, %edx
140a03458:     	callq	0x1458e7201 <.text+0x58e6201>
140a0345d:     	ud2

14596c1c0:     	push	rbp
14596c1c1:     	push	r15
14596c1c3:     	push	r14
14596c1c5:     	push	r13
14596c1c7:     	push	r12
14596c1c9:     	push	rsi
14596c1ca:     	push	rdi
14596c1cb:     	push	rbx
14596c1cc:     	sub	rsp, 0x228
14596c1d3:     	lea	rbp, [rsp + 0x80]
14596c1db:     	movaps	xmmword ptr [rbp + 0x190], xmm8
14596c1e3:     	movaps	xmmword ptr [rbp + 0x180], xmm7
14596c1ea:     	movaps	xmmword ptr [rbp + 0x170], xmm6
14596c1f1:     	mov	qword ptr [rbp + 0x168], -0x2
14596c1fc:     	mov	r14, r8
14596c1ff:     	mov	rbx, rdx
14596c202:     	mov	rsi, rcx
14596c205:     	mov	r13, qword ptr [rdx]
14596c208:     	movss	xmm2, dword ptr [r8]
14596c20d:     	movss	xmm1, dword ptr [r8 + 0x4]
14596c213:     	movss	xmm0, dword ptr [r13 + 0x44]
14596c219:     	movss	xmm6, dword ptr [rdx + 0x10]
14596c21e:     	movss	xmm7, dword ptr [rdx + 0x38]
14596c223:     	movzx	eax, byte ptr [r13 + 0x75]
14596c228:     	add	al, -0x2
14596c22a:     	cmp	al, 0x6
14596c22c:     	ja	0x14596c23f <.text+0x596b23f>
14596c22e:     	movzx	eax, al
14596c231:     	lea	rcx, [rip + 0x19c6698]  # 0x1473328d0
14596c238:     	movss	xmm3, dword ptr [rcx + 4*rax]
14596c23d:     	jmp	0x14596c247 <.text+0x596b247>
14596c23f:     	movss	xmm3, dword ptr [rip + 0x573c69] # 0x145edfeb0
14596c247:     	mulss	xmm2, dword ptr [rbx + 0x4c]
14596c24c:     	xorps	xmm4, xmm4
14596c24f:     	cmpltss	xmm4, xmm0
14596c254:     	andps	xmm4, xmm2
14596c257:     	mulss	xmm0, dword ptr [rip + 0x57433d] # 0x145ee059c
14596c25f:     	mulss	xmm0, xmm6
14596c263:     	mulss	xmm0, xmm7
14596c267:     	mulss	xmm0, xmm3
14596c26b:     	addss	xmm0, xmm4
14596c26f:     	mulss	xmm1, xmm0
14596c273:     	mov	rcx, rbp
14596c276:     	call	0x1458627d0 <.text+0x58617d0>
14596c27b:     	movss	xmm0, dword ptr [rbx + 0x1c]
14596c280:     	mulss	xmm0, dword ptr [rbx + 0x44]
14596c285:     	mulss	xmm0, dword ptr [r13 + 0x50]
14596c28b:     	mulss	xmm0, dword ptr [r14 + 0x28]
14596c291:     	movss	xmm1, dword ptr [rip + 0x828a9f] # 0x146194d38
14596c299:     	ucomiss	xmm1, xmm0
14596c29c:     	jae	0x14596c2c6 <.text+0x596b2c6>
14596c29e:     	addss	xmm0, dword ptr [rip + 0x16a064e] # 0x14700c8f4
14596c2a6:     	movss	xmm8, dword ptr [rip + 0x5740dd] # 0x145ee038c
14596c2af:     	divss	xmm0, xmm8
14596c2b4:     	call	0x145d1475d <.text+0x5d1375d>
14596c2b9:     	mulss	xmm0, xmm8
14596c2be:     	addss	xmm0, dword ptr [rip + 0x828a72] # 0x146194d38
14596c2c6:     	lea	rcx, [rbp - 0x50]
14596c2ca:     	movaps	xmm1, xmm0
14596c2cd:     	call	0x1458627d0 <.text+0x58617d0>
14596c2d2:     	nop
14596c2d3:     	mov	rcx, rbx
14596c2d6:     	mov	rdx, r14
14596c2d9:     	call	0x14580a670 <.text+0x5809670>
14596c2de:     	mov	qword ptr [rsi], 0x0
14596c2e5:     	mov	qword ptr [rsi + 0x8], 0x1
14596c2ed:     	mov	qword ptr [rsi + 0x10], 0x0
14596c2f5:     	test	al, 0x1
14596c2f7:     	je	0x14596c319 <.text+0x596b319>
14596c2f9:     	lea	rcx, [rbp - 0x20]
14596c2fd:     	movaps	xmm1, xmm0
14596c300:     	call	0x1458627d0 <.text+0x58617d0>
14596c305:     	nop
14596c306:     	mov	rax, qword ptr [r13 + 0x8]
14596c30a:     	add	rax, -0x9
14596c30e:     	cmp	rax, 0x4
14596c312:     	jbe	0x14596c342 <.text+0x596b342>
14596c314:     	jmp	0x14596d886 <.text+0x596c886>
14596c319:     	mov	rax, qword ptr [rsi + 0x10]
14596c31d:     	mov	qword ptr [rbp - 0x10], rax
14596c321:     	mov	rax, qword ptr [rsi]
14596c324:     	mov	qword ptr [rbp - 0x20], rax
14596c328:     	mov	rax, qword ptr [rsi + 0x8]
14596c32c:     	mov	qword ptr [rbp - 0x18], rax
14596c330:     	mov	rax, qword ptr [r13 + 0x8]
14596c334:     	add	rax, -0x9
14596c338:     	cmp	rax, 0x4
14596c33c:     	ja	0x14596d886 <.text+0x596c886>
14596c342:     	lea	rcx, [rip + 0x19c6cbb]  # 0x147333004
14596c349:     	movsxd	rax, dword ptr [rcx + 4*rax]
14596c34d:     	add	rax, rcx
14596c350:     	jmp	rax
14596c352:     	mov	rax, qword ptr [r13]
14596c356:     	movabs	rcx, 0x676172646f6f6c62
14596c360:     	xor	rcx, qword ptr [rax]
14596c363:     	movzx	edx, byte ptr [rax + 0x8]
14596c367:     	xor	rdx, 0x65
14596c36b:     	or	rdx, rcx
14596c36e:     	je	0x14596ca19 <.text+0x596ba19>
14596c374:     	movabs	rcx, 0x7461665f6c616573
14596c37e:     	xor	rcx, qword ptr [rax]
14596c381:     	movzx	edx, byte ptr [rax + 0x8]
14596c385:     	xor	rdx, 0x65
14596c389:     	or	rdx, rcx
14596c38c:     	je	0x14596ca79 <.text+0x596ba79>
14596c392:     	movabs	rcx, 0x6c6577746867696c
14596c39c:     	xor	rcx, qword ptr [rax]
14596c39f:     	movzx	edx, byte ptr [rax + 0x8]
14596c3a3:     	xor	rdx, 0x6c
14596c3a7:     	or	rdx, rcx
14596c3aa:     	je	0x14596cc9e <.text+0x596bc9e>
14596c3b0:     	movabs	rcx, 0x7269665f6c756f73
14596c3ba:     	xor	rcx, qword ptr [rax]
14596c3bd:     	movzx	edx, byte ptr [rax + 0x8]
14596c3c1:     	xor	rdx, 0x65
14596c3c5:     	or	rdx, rcx
14596c3c8:     	je	0x14596cdbf <.text+0x596bdbf>
14596c3ce:     	movabs	rcx, 0x70726f6d796c6f70
14596c3d8:     	xor	rcx, qword ptr [rax]
14596c3db:     	movzx	eax, byte ptr [rax + 0x8]
14596c3df:     	xor	rax, 0x68
14596c3e3:     	or	rax, rcx
14596c3e6:     	jne	0x14596d886 <.text+0x596c886>
14596c3ec:     	lea	rbx, [rip + 0x19c520e]  # 0x147331601
14596c3f3:     	mov	edi, 0x141
14596c3f8:     	mov	edx, 0x141
14596c3fd:     	mov	rcx, rbx
14596c400:     	call	0x1458dff90 <.text+0x58def90>
14596c405:     	nop
14596c406:     	mov	r14, rdx
14596c409:     	test	rax, rax
14596c40c:     	cmovne	rbx, rax
14596c410:     	cmove	r14, rdi
14596c414:     	lea	r13, [rbp + 0x120]
14596c41b:     	movss	xmm1, dword ptr [rip + 0x573aed] # 0x145edff10
14596c423:     	mov	rcx, r13
14596c426:     	call	0x1458627d0 <.text+0x58617d0>
14596c42b:     	nop
14596c42c:     	lea	rdi, [rbp + 0x108]
14596c433:     	movss	xmm1, dword ptr [rip + 0x573f51] # 0x145ee038c
14596c43b:     	mov	rcx, rdi
14596c43e:     	call	0x1458627d0 <.text+0x58617d0>
14596c443:     	nop
14596c444:     	lea	r12, [rbp + 0x150]
14596c44b:     	movss	xmm1, dword ptr [rip + 0x19c31bd] # 0x14732f610
14596c453:     	mov	rcx, r12
14596c456:     	call	0x1458627d0 <.text+0x58617d0>
14596c45b:     	nop
14596c45c:     	lea	rax, [rip + 0x19c519d]  # 0x147331600
14596c463:     	mov	qword ptr [rbp + 0x28], rax
14596c467:     	mov	qword ptr [rbp + 0x30], 0x1
14596c46f:     	mov	qword ptr [rbp + 0x38], r13
14596c473:     	lea	rax, [rip + 0x19c33f6]  # 0x14732f870
14596c47a:     	mov	qword ptr [rbp + 0x40], rax
14596c47e:     	lea	rcx, [rip + 0x19c52bd]  # 0x147331742
14596c485:     	mov	qword ptr [rbp + 0x48], rcx
14596c489:     	mov	qword ptr [rbp + 0x50], 0x2
14596c491:     	lea	rcx, [rbp - 0x20]
14596c495:     	mov	qword ptr [rbp + 0x58], rcx
14596c499:     	mov	qword ptr [rbp + 0x60], rax
14596c49d:     	lea	rcx, [rip + 0x19c52ac]  # 0x147331750
14596c4a4:     	mov	qword ptr [rbp + 0x68], rcx
14596c4a8:     	mov	qword ptr [rbp + 0x70], 0x5
14596c4b0:     	lea	rcx, [rip + 0x19c5291]  # 0x147331748
14596c4b7:     	mov	qword ptr [rbp + 0x78], rcx
14596c4bb:     	lea	rcx, [rip + 0x19c420e]  # 0x1473306d0
14596c4c2:     	mov	qword ptr [rbp + 0x80], rcx
14596c4c9:     	lea	rcx, [rip + 0x19c3fba]  # 0x14733048a
14596c4d0:     	mov	qword ptr [rbp + 0x88], rcx
14596c4d7:     	mov	qword ptr [rbp + 0x90], 0x4
14596c4e2:     	mov	qword ptr [rbp + 0x98], rdi
14596c4e9:     	mov	qword ptr [rbp + 0xa0], rax
14596c4f0:     	lea	rcx, [rip + 0x19c525e]  # 0x147331755
14596c4f7:     	mov	qword ptr [rbp + 0xa8], rcx
14596c4fe:     	mov	qword ptr [rbp + 0xb0], 0x3
14596c509:     	mov	qword ptr [rbp + 0xb8], r12
14596c510:     	mov	qword ptr [rbp + 0xc0], rax
14596c517:     	lea	rcx, [rip + 0x19c39d3]  # 0x14732fef1
14596c51e:     	mov	qword ptr [rbp + 0xc8], rcx
14596c525:     	mov	qword ptr [rbp + 0xd0], 0x3
14596c530:     	mov	rcx, rbp
14596c533:     	mov	qword ptr [rbp + 0xd8], rcx
14596c53a:     	mov	qword ptr [rbp + 0xe0], rax
14596c541:     	lea	rcx, [rip + 0x19c4216]  # 0x14733075e
14596c548:     	mov	qword ptr [rbp + 0xe8], rcx
14596c54f:     	mov	qword ptr [rbp + 0xf0], 0x1
14596c55a:     	lea	rcx, [rbp - 0x50]
14596c55e:     	mov	qword ptr [rbp + 0xf8], rcx
14596c565:     	mov	qword ptr [rbp + 0x100], rax
14596c56c:     	mov	qword ptr [rsp + 0x20], 0x7
14596c575:     	lea	r9, [rbp + 0x28]
14596c579:     	mov	rcx, rsi
14596c57c:     	mov	rdx, rbx
14596c57f:     	mov	r8, r14
14596c582:     	call	0x1458e0370 <.text+0x58df370>
14596c587:     	nop
14596c588:     	jmp	0x14596d4ed <.text+0x596c4ed>
14596c58d:     	mov	rax, qword ptr [r13]
14596c591:     	movabs	rcx, 0x5f666f5f6c6c6163
14596c59b:     	xor	rcx, qword ptr [rax]
14596c59e:     	movabs	rdx, 0x656d616c665f666f
14596c5a8:     	xor	rdx, qword ptr [rax + 0x5]
14596c5ac:     	or	rdx, rcx
14596c5af:     	jne	0x14596d886 <.text+0x596c886>
14596c5b5:     	lea	rdi, [rip + 0x19c53c9]  # 0x147331985
14596c5bc:     	mov	ebx, 0x8b
14596c5c1:     	mov	edx, 0x8b
14596c5c6:     	mov	rcx, rdi
14596c5c9:     	call	0x1458dff90 <.text+0x58def90>
14596c5ce:     	nop
14596c5cf:     	mov	r8, rdx
14596c5d2:     	test	rax, rax
14596c5d5:     	cmovne	rdi, rax
14596c5d9:     	cmove	r8, rbx
14596c5dd:     	lea	rax, [rip + 0x19c390d]  # 0x14732fef1
14596c5e4:     	mov	qword ptr [rbp + 0x28], rax
14596c5e8:     	mov	qword ptr [rbp + 0x30], 0x3
14596c5f0:     	mov	rax, rbp
14596c5f3:     	mov	qword ptr [rbp + 0x38], rax
14596c5f7:     	lea	rax, [rip + 0x19c3272]  # 0x14732f870
14596c5fe:     	mov	qword ptr [rbp + 0x40], rax
14596c602:     	lea	rcx, [rip + 0x19c4155]  # 0x14733075e
14596c609:     	mov	qword ptr [rbp + 0x48], rcx
14596c60d:     	mov	qword ptr [rbp + 0x50], 0x1
14596c615:     	lea	rcx, [rbp - 0x50]
14596c619:     	mov	qword ptr [rbp + 0x58], rcx
14596c61d:     	mov	qword ptr [rbp + 0x60], rax
14596c621:     	lea	rcx, [rip + 0x19c511a]  # 0x147331742
14596c628:     	mov	qword ptr [rbp + 0x68], rcx
14596c62c:     	mov	qword ptr [rbp + 0x70], 0x2
14596c634:     	lea	rcx, [rbp - 0x20]
14596c638:     	mov	qword ptr [rbp + 0x78], rcx
14596c63c:     	mov	qword ptr [rbp + 0x80], rax
14596c643:     	mov	qword ptr [rsp + 0x20], 0x3
14596c64c:     	lea	r9, [rbp + 0x28]
14596c650:     	mov	rcx, rsi
14596c653:     	mov	rdx, rdi
14596c656:     	call	0x1458e0370 <.text+0x58df370>
14596c65b:     	nop
14596c65c:     	jmp	0x14596d886 <.text+0x596c886>
14596c661:     	mov	rax, qword ptr [r13]
14596c665:     	movabs	rcx, 0x665f656972656166
14596c66f:     	xor	rcx, qword ptr [rax]
14596c672:     	movabs	rdx, 0x657269665f656972
14596c67c:     	xor	rdx, qword ptr [rax + 0x3]
14596c680:     	or	rdx, rcx
14596c683:     	jne	0x14596d886 <.text+0x596c886>
14596c689:     	mov	eax, dword ptr [r13 + 0x54]
14596c68d:     	test	eax, eax
14596c68f:     	je	0x14596cb23 <.text+0x596bb23>
14596c695:     	add	eax, dword ptr [rbx + 0x18]
14596c698:     	add	eax, dword ptr [rbx + 0x40]
14596c69b:     	add	eax, dword ptr [r14 + 0x34]
14596c69f:     	je	0x14596cb23 <.text+0x596bb23>
14596c6a5:     	cmp	eax, 0x3
14596c6a8:     	mov	ecx, 0x3
14596c6ad:     	cmovb	ecx, eax
14596c6b0:     	mov	dword ptr [rbp - 0x38], ecx
14596c6b3:     	cmp	eax, 0x1
14596c6b6:     	je	0x14596cb2a <.text+0x596bb2a>
14596c6bc:     	lea	rdi, [rip + 0x19c50a6]  # 0x147331769
14596c6c3:     	mov	ebx, 0x17
14596c6c8:     	mov	edx, 0x17
14596c6cd:     	mov	rcx, rdi
14596c6d0:     	call	0x1458dff90 <.text+0x58def90>
14596c6d5:     	nop
14596c6d6:     	mov	r8, rdx
14596c6d9:     	test	rax, rax
14596c6dc:     	cmovne	rdi, rax
14596c6e0:     	cmove	r8, rbx
14596c6e4:     	lea	rax, [rip + 0x19c37b5]  # 0x14732fea0
14596c6eb:     	mov	qword ptr [rbp + 0x28], rax
14596c6ef:     	mov	qword ptr [rbp + 0x30], 0x1
14596c6f7:     	lea	rax, [rbp - 0x38]
14596c6fb:     	mov	qword ptr [rbp + 0x38], rax
14596c6ff:     	lea	rax, [rip + 0x19c377a]  # 0x14732fe80
14596c706:     	mov	qword ptr [rbp + 0x40], rax
14596c70a:     	mov	qword ptr [rsp + 0x20], 0x1
14596c713:     	lea	rcx, [rbp + 0x138]
14596c71a:     	lea	r9, [rbp + 0x28]
14596c71e:     	mov	rdx, rdi
14596c721:     	call	0x1458e0370 <.text+0x58df370>
14596c726:     	nop
14596c727:     	jmp	0x14596d317 <.text+0x596c317>
14596c72c:     	mov	rax, qword ptr [r13]
14596c730:     	movabs	rcx, 0x5f737265746e7568
14596c73a:     	xor	rcx, qword ptr [rax]
14596c73d:     	mov	eax, dword ptr [rax + 0x8]
14596c740:     	xor	rax, 0x6b72616d
14596c746:     	or	rax, rcx
14596c749:     	jne	0x14596d886 <.text+0x596c886>
14596c74f:     	lea	rbx, [rip + 0x19c5519]  # 0x147331c6f
14596c756:     	mov	edi, 0xf0
14596c75b:     	mov	edx, 0xf0
14596c760:     	mov	rcx, rbx
14596c763:     	call	0x1458dff90 <.text+0x58def90>
14596c768:     	nop
14596c769:     	mov	r14, rdx
14596c76c:     	test	rax, rax
14596c76f:     	cmovne	rbx, rax
14596c773:     	cmove	r14, rdi
14596c777:     	movss	xmm1, dword ptr [r13 + 0x4c]
14596c77d:     	lea	rdi, [rbp + 0x108]
14596c784:     	mov	rcx, rdi
14596c787:     	call	0x1458627d0 <.text+0x58617d0>
14596c78c:     	nop
14596c78d:     	mulss	xmm6, xmm7
14596c791:     	xorps	xmm1, xmm1
14596c794:     	sqrtss	xmm1, xmm6
14596c798:     	mulss	xmm1, dword ptr [rip + 0x573920] # 0x145ee00c0
14596c7a0:     	minss	xmm1, dword ptr [rip + 0x583cd0] # 0x145ef0478
14596c7a8:     	mulss	xmm1, dword ptr [rip + 0x573c10] # 0x145ee03c0
14596c7b0:     	lea	r12, [rbp + 0x150]
14596c7b7:     	mov	rcx, r12
14596c7ba:     	call	0x1458627d0 <.text+0x58617d0>
14596c7bf:     	nop
14596c7c0:     	lea	rax, [rip + 0x19c50e2]  # 0x1473318a9
14596c7c7:     	mov	qword ptr [rbp + 0x28], rax
14596c7cb:     	mov	qword ptr [rbp + 0x30], 0x5
14596c7d3:     	mov	qword ptr [rbp + 0x38], rdi
14596c7d7:     	lea	rax, [rip + 0x19c3092]  # 0x14732f870
14596c7de:     	mov	qword ptr [rbp + 0x40], rax
14596c7e2:     	lea	rcx, [rip + 0x19c4e17]  # 0x147331600
14596c7e9:     	mov	qword ptr [rbp + 0x48], rcx
14596c7ed:     	mov	qword ptr [rbp + 0x50], 0x1
14596c7f5:     	mov	qword ptr [rbp + 0x58], r12
14596c7f9:     	mov	qword ptr [rbp + 0x60], rax
14596c7fd:     	lea	rcx, [rip + 0x19c36ed]  # 0x14732fef1
14596c804:     	mov	qword ptr [rbp + 0x68], rcx
14596c808:     	mov	qword ptr [rbp + 0x70], 0x3
14596c810:     	mov	rcx, rbp
14596c813:     	mov	qword ptr [rbp + 0x78], rcx
14596c817:     	mov	qword ptr [rbp + 0x80], rax
14596c81e:     	lea	rcx, [rip + 0x19c3f39]  # 0x14733075e
14596c825:     	mov	qword ptr [rbp + 0x88], rcx
14596c82c:     	mov	qword ptr [rbp + 0x90], 0x1
14596c837:     	lea	rcx, [rbp - 0x50]
14596c83b:     	mov	qword ptr [rbp + 0x98], rcx
14596c842:     	mov	qword ptr [rbp + 0xa0], rax
14596c849:     	lea	rcx, [rip + 0x19c4ef2]  # 0x147331742
14596c850:     	mov	qword ptr [rbp + 0xa8], rcx
14596c857:     	mov	qword ptr [rbp + 0xb0], 0x2
14596c862:     	lea	rcx, [rbp - 0x20]
14596c866:     	mov	qword ptr [rbp + 0xb8], rcx
14596c86d:     	mov	qword ptr [rbp + 0xc0], rax
14596c874:     	mov	qword ptr [rsp + 0x20], 0x5
14596c87d:     	lea	r9, [rbp + 0x28]
14596c881:     	mov	rcx, rsi
14596c884:     	mov	rdx, rbx
14596c887:     	mov	r8, r14
14596c88a:     	call	0x1458e0370 <.text+0x58df370>
14596c88f:     	nop
14596c890:     	jmp	0x14596d84a <.text+0x596c84a>
14596c895:     	mov	rax, qword ptr [r13]
14596c899:     	movabs	rcx, 0x6974706d65646572
14596c8a3:     	xor	rcx, qword ptr [rax]
14596c8a6:     	movzx	eax, word ptr [rax + 0x8]
14596c8aa:     	xor	rax, 0x6e6f
14596c8b0:     	or	rax, rcx
14596c8b3:     	jne	0x14596d886 <.text+0x596c886>
14596c8b9:     	lea	r12, [rip + 0x19c549f]  # 0x147331d5f
14596c8c0:     	mov	edi, 0xc2
14596c8c5:     	mov	edx, 0xc2
14596c8ca:     	mov	rcx, r12
14596c8cd:     	call	0x1458dff90 <.text+0x58def90>
14596c8d2:     	nop
14596c8d3:     	mov	r15, rdx
14596c8d6:     	test	rax, rax
14596c8d9:     	cmovne	r12, rax
14596c8dd:     	cmove	r15, rdi
14596c8e1:     	movss	xmm2, dword ptr [r13 + 0x48]
14596c8e7:     	movss	xmm0, dword ptr [r14 + 0x8]
14596c8ed:     	movss	xmm3, dword ptr [rip + 0x57735b] # 0x145ee3c50
14596c8f5:     	cmp	qword ptr [r13 + 0x8], 0x8
14596c8fa:     	jne	0x14596c914 <.text+0x596b914>
14596c8fc:     	mov	rax, qword ptr [r13]
14596c900:     	mov	rax, qword ptr [rax]
14596c903:     	cmp	rax, qword ptr [rip + 0x13484e2] # 0x146cb4dec
14596c90a:     	jne	0x14596c914 <.text+0x596b914>
14596c90c:     	movss	xmm3, dword ptr [rip + 0x573a68] # 0x145ee037c
14596c914:     	movss	xmm1, dword ptr [rip + 0x573ca4] # 0x145ee05c0
14596c91c:     	mulss	xmm1, xmm2
14596c920:     	movss	xmm4, dword ptr [rip + 0x573c74] # 0x145ee059c
14596c928:     	mulss	xmm2, xmm4
14596c92c:     	mulss	xmm2, dword ptr [rbx + 0x14]
14596c931:     	mulss	xmm2, dword ptr [rbx + 0x3c]
14596c936:     	mulss	xmm1, xmm4
14596c93a:     	mulss	xmm0, xmm2
14596c93e:     	movaps	xmm2, xmm0
14596c941:     	maxss	xmm2, xmm3
14596c945:     	movaps	xmm3, xmm2
14596c948:     	cmpunordss	xmm3, xmm2
14596c94d:     	andps	xmm0, xmm3
14596c950:     	andnps	xmm3, xmm2
14596c953:     	orps	xmm3, xmm0
14596c956:     	divss	xmm1, xmm3
14596c95a:     	minss	xmm1, dword ptr [rip + 0x57375e] # 0x145ee00c0
14596c962:     	mulss	xmm1, dword ptr [rbx + 0x50]
14596c967:     	mulss	xmm1, dword ptr [rip + 0x573a51] # 0x145ee03c0
14596c96f:     	lea	rdi, [rbp + 0x150]
14596c976:     	mov	rcx, rdi
14596c979:     	call	0x1458627d0 <.text+0x58617d0>
14596c97e:     	nop
14596c97f:     	lea	rax, [rip + 0x19c4c7a]  # 0x147331600
14596c986:     	mov	qword ptr [rbp + 0x28], rax
14596c98a:     	mov	qword ptr [rbp + 0x30], 0x1
14596c992:     	mov	qword ptr [rbp + 0x38], rdi
14596c996:     	lea	rax, [rip + 0x19c2ed3]  # 0x14732f870
14596c99d:     	mov	qword ptr [rbp + 0x40], rax
14596c9a1:     	lea	rcx, [rip + 0x19c3549]  # 0x14732fef1
14596c9a8:     	mov	qword ptr [rbp + 0x48], rcx
14596c9ac:     	mov	qword ptr [rbp + 0x50], 0x3
14596c9b4:     	mov	rcx, rbp
14596c9b7:     	mov	qword ptr [rbp + 0x58], rcx
14596c9bb:     	mov	qword ptr [rbp + 0x60], rax
14596c9bf:     	lea	rcx, [rip + 0x19c3d98]  # 0x14733075e
14596c9c6:     	mov	qword ptr [rbp + 0x68], rcx
14596c9ca:     	mov	qword ptr [rbp + 0x70], 0x1
14596c9d2:     	lea	rcx, [rbp - 0x50]
14596c9d6:     	mov	qword ptr [rbp + 0x78], rcx
14596c9da:     	mov	qword ptr [rbp + 0x80], rax
14596c9e1:     	mov	qword ptr [rsp + 0x20], 0x3
14596c9ea:     	lea	r9, [rbp + 0x28]
14596c9ee:     	mov	rcx, rsi
14596c9f1:     	mov	rdx, r12
14596c9f4:     	mov	r8, r15
14596c9f7:     	call	0x1458e0370 <.text+0x58df370>
14596c9fc:     	nop
14596c9fd:     	mov	rdx, qword ptr [rbp + 0x150]
14596ca04:     	test	rdx, rdx
14596ca07:     	je	0x14596d886 <.text+0x596c886>
14596ca0d:     	mov	rcx, qword ptr [rbp + 0x158]
14596ca14:     	jmp	0x14596d87b <.text+0x596c87b>
14596ca19:     	lea	r12, [rip + 0x19c5401]  # 0x147331e21
14596ca20:     	mov	edi, 0xd4
14596ca25:     	mov	edx, 0xd4
14596ca2a:     	mov	rcx, r12
14596ca2d:     	call	0x1458dff90 <.text+0x58def90>
14596ca32:     	nop
14596ca33:     	mov	r13, rdx
14596ca36:     	test	rax, rax
14596ca39:     	cmovne	r12, rax
14596ca3d:     	cmove	r13, rdi
14596ca41:     	lea	rdi, [rbp + 0x108]
14596ca48:     	movss	xmm1, dword ptr [rip + 0x573860] # 0x145ee02b0
14596ca50:     	mov	rcx, rdi
14596ca53:     	call	0x1458627d0 <.text+0x58617d0>
14596ca58:     	nop
14596ca59:     	mov	rcx, rbx
14596ca5c:     	mov	rdx, r14
14596ca5f:     	call	0x14580a670 <.text+0x5809670>
14596ca64:     	test	al, 0x1
14596ca66:     	jne	0x14596cb70 <.text+0x596bb70>
14596ca6c:     	movss	xmm1, dword ptr [rip + 0x573918] # 0x145ee038c
14596ca74:     	jmp	0x14596cb7c <.text+0x596bb7c>
14596ca79:     	mov	eax, dword ptr [r13 + 0x54]
14596ca7d:     	test	eax, eax
14596ca7f:     	je	0x14596cd3f <.text+0x596bd3f>
14596ca85:     	add	eax, dword ptr [rbx + 0x18]
14596ca88:     	add	eax, dword ptr [rbx + 0x40]
14596ca8b:     	add	eax, dword ptr [r14 + 0x34]
14596ca8f:     	je	0x14596cd3f <.text+0x596bd3f>
14596ca95:     	cmp	eax, 0x3
14596ca98:     	mov	ecx, 0x3
14596ca9d:     	cmovb	ecx, eax
14596caa0:     	mov	dword ptr [rbp + 0x138], ecx
14596caa6:     	cmp	eax, 0x1
14596caa9:     	je	0x14596cd49 <.text+0x596bd49>
14596caaf:     	lea	rdi, [rip + 0x19c5082]  # 0x147331b38
14596cab6:     	mov	r15d, 0x11
14596cabc:     	mov	edx, 0x11
14596cac1:     	mov	rcx, rdi
14596cac4:     	call	0x1458dff90 <.text+0x58def90>
14596cac9:     	nop
14596caca:     	mov	r8, rdx
14596cacd:     	test	rax, rax
14596cad0:     	cmovne	rdi, rax
14596cad4:     	cmove	r8, r15
14596cad8:     	lea	rax, [rip + 0x19c33c1]  # 0x14732fea0
14596cadf:     	mov	qword ptr [rbp + 0x28], rax
14596cae3:     	mov	qword ptr [rbp + 0x30], 0x1
14596caeb:     	lea	rax, [rbp + 0x138]
14596caf2:     	mov	qword ptr [rbp + 0x38], rax
14596caf6:     	lea	rax, [rip + 0x19c3383]  # 0x14732fe80
14596cafd:     	mov	qword ptr [rbp + 0x40], rax
14596cb01:     	mov	qword ptr [rsp + 0x20], 0x1
14596cb0a:     	lea	rcx, [rbp + 0x120]
14596cb11:     	lea	r9, [rbp + 0x28]
14596cb15:     	mov	rdx, rdi
14596cb18:     	call	0x1458e0370 <.text+0x58df370>
14596cb1d:     	nop
14596cb1e:     	jmp	0x14596d711 <.text+0x596c711>
14596cb23:     	mov	dword ptr [rbp - 0x38], 0x1
14596cb2a:     	lea	rdi, [rip + 0x19c4c27]  # 0x147331758
14596cb31:     	mov	r14d, 0x11
14596cb37:     	mov	edx, 0x11
14596cb3c:     	mov	rcx, rdi
14596cb3f:     	call	0x1458dff90 <.text+0x58def90>
14596cb44:     	nop
14596cb45:     	mov	rbx, rdx
14596cb48:     	test	rax, rax
14596cb4b:     	cmovne	rdi, rax
14596cb4f:     	cmove	rbx, r14
14596cb53:     	test	rbx, rbx
14596cb56:     	jns	0x14596cc61 <.text+0x596bc61>
14596cb5c:     	xor	r12d, r12d
14596cb5f:     	mov	rcx, r12
14596cb62:     	mov	rdx, rbx
14596cb65:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14596cb6a:     	nop
14596cb6b:     	jmp	0x14596d93f <.text+0x596c93f>
14596cb70:     	movss	xmm1, dword ptr [rip + 0x573848] # 0x145ee03c0
14596cb78:     	divss	xmm1, xmm0
14596cb7c:     	lea	rbx, [rbp + 0x150]
14596cb83:     	mov	rcx, rbx
14596cb86:     	call	0x1458627d0 <.text+0x58617d0>
14596cb8b:     	nop
14596cb8c:     	lea	rax, [rip + 0x19c5362]  # 0x147331ef5
14596cb93:     	mov	qword ptr [rbp + 0x28], rax
14596cb97:     	mov	qword ptr [rbp + 0x30], 0x4
14596cb9f:     	mov	qword ptr [rbp + 0x38], rdi
14596cba3:     	lea	rax, [rip + 0x19c2cc6]  # 0x14732f870
14596cbaa:     	mov	qword ptr [rbp + 0x40], rax
14596cbae:     	lea	rcx, [rip + 0x19c4d07]  # 0x1473318bc
14596cbb5:     	mov	qword ptr [rbp + 0x48], rcx
14596cbb9:     	mov	qword ptr [rbp + 0x50], 0x7
14596cbc1:     	mov	qword ptr [rbp + 0x58], rbx
14596cbc5:     	mov	qword ptr [rbp + 0x60], rax
14596cbc9:     	lea	rcx, [rip + 0x19c3321]  # 0x14732fef1
14596cbd0:     	mov	qword ptr [rbp + 0x68], rcx
14596cbd4:     	mov	qword ptr [rbp + 0x70], 0x3
14596cbdc:     	mov	rcx, rbp
14596cbdf:     	mov	qword ptr [rbp + 0x78], rcx
14596cbe3:     	mov	qword ptr [rbp + 0x80], rax
14596cbea:     	lea	rcx, [rip + 0x19c3b6d]  # 0x14733075e
14596cbf1:     	mov	qword ptr [rbp + 0x88], rcx
14596cbf8:     	mov	qword ptr [rbp + 0x90], 0x1
14596cc03:     	lea	rcx, [rbp - 0x50]
14596cc07:     	mov	qword ptr [rbp + 0x98], rcx
14596cc0e:     	mov	qword ptr [rbp + 0xa0], rax
14596cc15:     	lea	rcx, [rip + 0x19c4b26]  # 0x147331742
14596cc1c:     	mov	qword ptr [rbp + 0xa8], rcx
14596cc23:     	mov	qword ptr [rbp + 0xb0], 0x2
14596cc2e:     	lea	rcx, [rbp - 0x20]
14596cc32:     	mov	qword ptr [rbp + 0xb8], rcx
14596cc39:     	mov	qword ptr [rbp + 0xc0], rax
14596cc40:     	mov	qword ptr [rsp + 0x20], 0x5
14596cc49:     	lea	r9, [rbp + 0x28]
14596cc4d:     	mov	rcx, rsi
14596cc50:     	mov	rdx, r12
14596cc53:     	mov	r8, r13
14596cc56:     	call	0x1458e0370 <.text+0x58df370>
14596cc5b:     	nop
14596cc5c:     	jmp	0x14596d84a <.text+0x596c84a>
14596cc61:     	je	0x14596d2fc <.text+0x596c2fc>
14596cc67:     	call	0x140002200 <.text+0x1200>
14596cc6c:     	mov	r12d, 0x1
14596cc72:     	mov	edx, 0x1
14596cc77:     	mov	rcx, rbx
14596cc7a:     	call	0x1400021c0 <.text+0x11c0>
14596cc7f:     	test	rax, rax
14596cc82:     	je	0x14596cb5f <.text+0x596bb5f>
14596cc88:     	mov	r14, rax
14596cc8b:     	mov	rcx, rax
14596cc8e:     	mov	rdx, rdi
14596cc91:     	mov	r8, rbx
14596cc94:     	call	0x145d145fb <.text+0x5d135fb>
14596cc99:     	jmp	0x14596d302 <.text+0x596c302>
14596cc9e:     	mov	eax, dword ptr [r13 + 0x54]
14596cca2:     	test	eax, eax
14596cca4:     	je	0x14596ce69 <.text+0x596be69>
14596ccaa:     	add	eax, dword ptr [rbx + 0x18]
14596ccad:     	add	eax, dword ptr [rbx + 0x40]
14596ccb0:     	add	eax, dword ptr [r14 + 0x34]
14596ccb4:     	je	0x14596ce69 <.text+0x596be69>
14596ccba:     	cmp	eax, 0x3
14596ccbd:     	mov	ecx, 0x3
14596ccc2:     	cmovb	ecx, eax
14596ccc5:     	mov	dword ptr [rbp + 0x1c], ecx
14596ccc8:     	cmp	eax, 0x1
14596cccb:     	je	0x14596ce70 <.text+0x596be70>
14596ccd1:     	lea	rdi, [rip + 0x19c4a91]  # 0x147331769
14596ccd8:     	mov	r15d, 0x17
14596ccde:     	mov	edx, 0x17
14596cce3:     	mov	rcx, rdi
14596cce6:     	call	0x1458dff90 <.text+0x58def90>
14596cceb:     	nop
14596ccec:     	mov	r8, rdx
14596ccef:     	test	rax, rax
14596ccf2:     	cmovne	rdi, rax
14596ccf6:     	cmove	r8, r15
14596ccfa:     	lea	rax, [rip + 0x19c319f]  # 0x14732fea0
14596cd01:     	mov	qword ptr [rbp + 0x28], rax
14596cd05:     	mov	qword ptr [rbp + 0x30], 0x1
14596cd0d:     	lea	rax, [rbp + 0x1c]
14596cd11:     	mov	qword ptr [rbp + 0x38], rax
14596cd15:     	lea	rax, [rip + 0x19c3164]  # 0x14732fe80
14596cd1c:     	mov	qword ptr [rbp + 0x40], rax
14596cd20:     	mov	qword ptr [rsp + 0x20], 0x1
14596cd29:     	lea	rcx, [rbp - 0x38]
14596cd2d:     	lea	r9, [rbp + 0x28]
14596cd31:     	mov	rdx, rdi
14596cd34:     	call	0x1458e0370 <.text+0x58df370>
14596cd39:     	nop
14596cd3a:     	jmp	0x14596ceef <.text+0x596beef>
14596cd3f:     	mov	dword ptr [rbp + 0x138], 0x1
14596cd49:     	lea	rdi, [rip + 0x19c4de0]  # 0x147331b30
14596cd50:     	mov	r12d, 0x8
14596cd56:     	mov	edx, 0x8
14596cd5b:     	mov	rcx, rdi
14596cd5e:     	call	0x1458dff90 <.text+0x58def90>
14596cd63:     	nop
14596cd64:     	mov	r15, rdx
14596cd67:     	test	rax, rax
14596cd6a:     	cmovne	rdi, rax
14596cd6e:     	cmove	r15, r12
14596cd72:     	test	r15, r15
14596cd75:     	jns	0x14596cd87 <.text+0x596bd87>
14596cd77:     	xor	ecx, ecx
14596cd79:     	mov	rdx, r15
14596cd7c:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14596cd81:     	nop
14596cd82:     	jmp	0x14596d93f <.text+0x596c93f>
14596cd87:     	je	0x14596d6f6 <.text+0x596c6f6>
14596cd8d:     	call	0x140002200 <.text+0x1200>
14596cd92:     	mov	edx, 0x1
14596cd97:     	mov	rcx, r15
14596cd9a:     	call	0x1400021c0 <.text+0x11c0>
14596cd9f:     	mov	ecx, 0x1
14596cda4:     	test	rax, rax
14596cda7:     	je	0x14596cd79 <.text+0x596bd79>
14596cda9:     	mov	r12, rax
14596cdac:     	mov	rcx, rax
14596cdaf:     	mov	rdx, rdi
14596cdb2:     	mov	r8, r15
14596cdb5:     	call	0x145d145fb <.text+0x5d135fb>
14596cdba:     	jmp	0x14596d6fc <.text+0x596c6fc>
14596cdbf:     	mov	eax, dword ptr [r13 + 0x54]
14596cdc3:     	test	eax, eax
14596cdc5:     	je	0x14596d545 <.text+0x596c545>
14596cdcb:     	add	eax, dword ptr [rbx + 0x18]
14596cdce:     	add	eax, dword ptr [rbx + 0x40]
14596cdd1:     	add	eax, dword ptr [r14 + 0x34]
14596cdd5:     	je	0x14596d545 <.text+0x596c545>
14596cddb:     	cmp	eax, 0x3
14596cdde:     	mov	ecx, 0x3
14596cde3:     	cmovb	ecx, eax
14596cde6:     	mov	dword ptr [rbp + 0x138], ecx
14596cdec:     	cmp	eax, 0x1
14596cdef:     	je	0x14596d54f <.text+0x596c54f>
14596cdf5:     	lea	rdi, [rip + 0x19c4ad9]  # 0x1473318d5
14596cdfc:     	mov	r15d, 0x20
14596ce02:     	mov	edx, 0x20
14596ce07:     	mov	rcx, rdi
14596ce0a:     	call	0x1458dff90 <.text+0x58def90>
14596ce0f:     	nop
14596ce10:     	mov	r8, rdx
14596ce13:     	test	rax, rax
14596ce16:     	cmovne	rdi, rax
14596ce1a:     	cmove	r8, r15
14596ce1e:     	lea	rax, [rip + 0x19c307b]  # 0x14732fea0
14596ce25:     	mov	qword ptr [rbp + 0x28], rax
14596ce29:     	mov	qword ptr [rbp + 0x30], 0x1
14596ce31:     	lea	rax, [rbp + 0x138]
14596ce38:     	mov	qword ptr [rbp + 0x38], rax
14596ce3c:     	lea	rax, [rip + 0x19c303d]  # 0x14732fe80
14596ce43:     	mov	qword ptr [rbp + 0x40], rax
14596ce47:     	mov	qword ptr [rsp + 0x20], 0x1
14596ce50:     	lea	rcx, [rbp + 0x120]
14596ce57:     	lea	r9, [rbp + 0x28]
14596ce5b:     	mov	rdx, rdi
14596ce5e:     	call	0x1458e0370 <.text+0x58df370>
14596ce63:     	nop
14596ce64:     	jmp	0x14596d5d7 <.text+0x596c5d7>
14596ce69:     	mov	dword ptr [rbp + 0x1c], 0x1
14596ce70:     	lea	r15, [rip + 0x19c48e1]  # 0x147331758
14596ce77:     	mov	edi, 0x11
14596ce7c:     	mov	edx, 0x11
14596ce81:     	mov	rcx, r15
14596ce84:     	call	0x1458dff90 <.text+0x58def90>
14596ce89:     	nop
14596ce8a:     	mov	r12, rdx
14596ce8d:     	test	rax, rax
14596ce90:     	cmovne	r15, rax
14596ce94:     	cmove	r12, rdi
14596ce98:     	mov	qword ptr [rsp + 0x20], 0x1
14596cea1:     	lea	rcx, [rbp + 0x28]
14596cea5:     	mov	r9d, 0x1
14596ceab:     	mov	rdx, r12
14596ceae:     	xor	r8d, r8d
14596ceb1:     	call	0x14001c2a0 <.text+0x1b2a0>
14596ceb6:     	mov	rcx, qword ptr [rbp + 0x30]
14596ceba:     	cmp	dword ptr [rbp + 0x28], 0x1
14596cebe:     	je	0x14596d929 <.text+0x596c929>
14596cec4:     	mov	rdi, qword ptr [rbp + 0x38]
14596cec8:     	test	r12, r12
14596cecb:     	je	0x14596cee3 <.text+0x596bee3>
14596cecd:     	mov	qword ptr [rbp + 0x20], rcx
14596ced1:     	mov	rcx, rdi
14596ced4:     	mov	rdx, r15
14596ced7:     	mov	r8, r12
14596ceda:     	call	0x145d145fb <.text+0x5d135fb>
14596cedf:     	mov	rcx, qword ptr [rbp + 0x20]
14596cee3:     	mov	qword ptr [rbp - 0x38], rcx
14596cee7:     	mov	qword ptr [rbp - 0x30], rdi
14596ceeb:     	mov	qword ptr [rbp - 0x28], r12
14596ceef:     	movss	xmm6, dword ptr [r13 + 0x58]
14596cef5:     	mulss	xmm6, dword ptr [rip + 0x57369f] # 0x145ee059c
14596cefd:     	mulss	xmm6, dword ptr [rbx + 0x20]
14596cf02:     	mulss	xmm6, dword ptr [rbx + 0x48]
14596cf07:     	lea	r12, [rip + 0x19c4b02]  # 0x147331a10
14596cf0e:     	mov	r15d, 0xb1
14596cf14:     	mov	edx, 0xb1
14596cf19:     	mov	rcx, r12
14596cf1c:     	call	0x1458dff90 <.text+0x58def90>
14596cf21:     	nop
14596cf22:     	mov	rdi, rdx
14596cf25:     	test	rax, rax
14596cf28:     	cmovne	r12, rax
14596cf2c:     	cmove	rdi, r15
14596cf30:     	mov	dword ptr [rbp + 0x150], 0x41c80000
14596cf3a:     	lea	rax, [rbp + 0x150]
14596cf41:     	mov	qword ptr [rbp + 0x28], rax
14596cf45:     	lea	rax, [rip + 0x38b1b4]   # 0x145cf8100 <.text+0x5cf7100>
14596cf4c:     	mov	qword ptr [rbp + 0x30], rax
14596cf50:     	lea	rdx, [rip + 0x16be41e]  # 0x14702b375
14596cf57:     	lea	rcx, [rbp + 0x120]
14596cf5e:     	lea	r8, [rbp + 0x28]
14596cf62:     	call	0x145ce7350 <.text+0x5ce6350>
14596cf67:     	nop
14596cf68:     	lea	rcx, [rbp + 0x108]
14596cf6f:     	movaps	xmm1, xmm6
14596cf72:     	call	0x1458627d0 <.text+0x58617d0>
14596cf77:     	nop
14596cf78:     	movss	xmm1, dword ptr [r13 + 0x4c]
14596cf7e:     	lea	r15, [rbp + 0x150]
14596cf85:     	mov	rcx, r15
14596cf88:     	call	0x1458627d0 <.text+0x58617d0>
14596cf8d:     	nop
14596cf8e:     	lea	rax, [rip + 0x19c47ad]  # 0x147331742
14596cf95:     	mov	qword ptr [rbp + 0x28], rax
14596cf99:     	mov	qword ptr [rbp + 0x30], 0x2
14596cfa1:     	lea	rax, [rbp - 0x20]
14596cfa5:     	mov	qword ptr [rbp + 0x38], rax
14596cfa9:     	lea	rax, [rip + 0x19c28c0]  # 0x14732f870
14596cfb0:     	mov	qword ptr [rbp + 0x40], rax
14596cfb4:     	lea	rcx, [rip + 0x19c4b06]  # 0x147331ac1
14596cfbb:     	mov	qword ptr [rbp + 0x48], rcx
14596cfbf:     	mov	qword ptr [rbp + 0x50], 0x4
14596cfc7:     	lea	rcx, [rbp + 0x120]
14596cfce:     	mov	qword ptr [rbp + 0x58], rcx
14596cfd2:     	mov	qword ptr [rbp + 0x60], rax
14596cfd6:     	lea	rcx, [rip + 0x19c4ae8]  # 0x147331ac5
14596cfdd:     	mov	qword ptr [rbp + 0x68], rcx
14596cfe1:     	mov	qword ptr [rbp + 0x70], 0x3
14596cfe9:     	lea	rcx, [rbp + 0x108]
14596cff0:     	mov	qword ptr [rbp + 0x78], rcx
14596cff4:     	mov	qword ptr [rbp + 0x80], rax
14596cffb:     	lea	rcx, [rip + 0x19c48a3]  # 0x1473318a5
14596d002:     	mov	qword ptr [rbp + 0x88], rcx
14596d009:     	mov	qword ptr [rbp + 0x90], 0x4
14596d014:     	lea	rcx, [rbp - 0x38]
14596d018:     	mov	qword ptr [rbp + 0x98], rcx
14596d01f:     	mov	qword ptr [rbp + 0xa0], rax
14596d026:     	lea	rcx, [rip + 0x19c487c]  # 0x1473318a9
14596d02d:     	mov	qword ptr [rbp + 0xa8], rcx
14596d034:     	mov	qword ptr [rbp + 0xb0], 0x5
14596d03f:     	mov	qword ptr [rbp + 0xb8], r15
14596d046:     	mov	qword ptr [rbp + 0xc0], rax
14596d04d:     	lea	rcx, [rip + 0x19c2e9d]  # 0x14732fef1
14596d054:     	mov	qword ptr [rbp + 0xc8], rcx
14596d05b:     	mov	qword ptr [rbp + 0xd0], 0x3
14596d066:     	mov	rcx, rbp
14596d069:     	mov	qword ptr [rbp + 0xd8], rcx
14596d070:     	mov	qword ptr [rbp + 0xe0], rax
14596d077:     	mov	qword ptr [rsp + 0x20], 0x6
14596d080:     	lea	rcx, [rbp + 0x138]
14596d087:     	lea	r9, [rbp + 0x28]
14596d08b:     	mov	rdx, r12
14596d08e:     	mov	r8, rdi
14596d091:     	call	0x1458e0370 <.text+0x58df370>
14596d096:     	nop
14596d097:     	mov	rdx, qword ptr [rbp + 0x150]
14596d09e:     	test	rdx, rdx
14596d0a1:     	je	0x14596d0b5 <.text+0x596c0b5>
14596d0a3:     	mov	rcx, qword ptr [rbp + 0x158]
14596d0aa:     	mov	r8d, 0x1
14596d0b0:     	call	0x1400021d0 <.text+0x11d0>
14596d0b5:     	mov	rdx, qword ptr [rbp + 0x108]
14596d0bc:     	test	rdx, rdx
14596d0bf:     	je	0x14596d0d3 <.text+0x596c0d3>
14596d0c1:     	mov	rcx, qword ptr [rbp + 0x110]
14596d0c8:     	mov	r8d, 0x1
14596d0ce:     	call	0x1400021d0 <.text+0x11d0>
14596d0d3:     	mov	rdx, qword ptr [rbp + 0x120]
14596d0da:     	test	rdx, rdx
14596d0dd:     	je	0x14596d0f2 <.text+0x596c0f2>
14596d0df:     	mov	rcx, qword ptr [rbp + 0x128]
14596d0e6:     	mov	r8d, 0x1
14596d0ec:     	call	0x1400021d0 <.text+0x11d0>
14596d0f1:     	nop
14596d0f2:     	lea	r12, [rip + 0x19c49cf]  # 0x147331ac8
14596d0f9:     	mov	edi, 0x26
14596d0fe:     	mov	edx, 0x26
14596d103:     	mov	rcx, r12
14596d106:     	call	0x1458dff90 <.text+0x58def90>
14596d10b:     	nop
14596d10c:     	mov	r13, rdx
14596d10f:     	test	rax, rax
14596d112:     	cmovne	r12, rax
14596d116:     	cmove	r13, rdi
14596d11a:     	mov	rax, qword ptr [rbp + 0x138]
14596d121:     	mov	rdi, qword ptr [rbp + 0x148]
14596d128:     	sub	rax, rdi
14596d12b:     	cmp	r13, rax
14596d12e:     	ja	0x14596d8fb <.text+0x596c8fb>
14596d134:     	test	r13, r13
14596d137:     	je	0x14596d14e <.text+0x596c14e>
14596d139:     	mov	rcx, qword ptr [rbp + 0x140]
14596d140:     	add	rcx, rdi
14596d143:     	mov	rdx, r12
14596d146:     	mov	r8, r13
14596d149:     	call	0x145d145fb <.text+0x5d135fb>
14596d14e:     	add	rdi, r13
14596d151:     	mov	qword ptr [rbp + 0x148], rdi
14596d158:     	mov	rcx, rbx
14596d15b:     	mov	rdx, r14
14596d15e:     	call	0x14580a670 <.text+0x5809670>
14596d163:     	test	al, 0x1
14596d165:     	jne	0x14596d16f <.text+0x596c16f>
14596d167:     	movss	xmm0, dword ptr [rip + 0x5782c1] # 0x145ee5430
14596d16f:     	divss	xmm6, xmm0
14596d173:     	movaps	xmm0, xmm6
14596d176:     	call	0x145d1465b <.text+0x5d1365b>
14596d17b:     	cvttss2si	rax, xmm0
14596d180:     	mov	rcx, rax
14596d183:     	sar	rcx, 0x3f
14596d187:     	movaps	xmm1, xmm0
14596d18a:     	subss	xmm1, dword ptr [rip + 0x57851e] # 0x145ee56b0
14596d192:     	cvttss2si	rdx, xmm1
14596d197:     	and	rdx, rcx
14596d19a:     	or	rdx, rax
14596d19d:     	xor	eax, eax
14596d19f:     	xorps	xmm1, xmm1
14596d1a2:     	ucomiss	xmm0, xmm1
14596d1a5:     	cmovae	rax, rdx
14596d1a9:     	ucomiss	xmm0, dword ptr [rip + 0x578504] # 0x145ee56b4
14596d1b0:     	mov	rcx, -0x1
14596d1b7:     	cmovbe	rcx, rax
14596d1bb:     	cmp	rcx, 0x3
14596d1bf:     	mov	eax, 0x3
14596d1c4:     	cmovb	rax, rcx
14596d1c8:     	test	rcx, rcx
14596d1cb:     	mov	ecx, 0x1
14596d1d0:     	cmovne	rcx, rax
14596d1d4:     	mov	qword ptr [rbp + 0x108], rcx
14596d1db:     	cmp	rcx, 0x1
14596d1df:     	jbe	0x14596d2d1 <.text+0x596c2d1>
14596d1e5:     	cmp	qword ptr [rbp + 0x138], rdi
14596d1ec:     	je	0x14596d941 <.text+0x596c941>
14596d1f2:     	mov	rbx, qword ptr [rbp + 0x140]
14596d1f9:     	mov	byte ptr [rbx + rdi], 0x20
14596d1fd:     	inc	rdi
14596d200:     	mov	qword ptr [rbp + 0x148], rdi
14596d207:     	lea	r14, [rip + 0x19c48e0]  # 0x147331aee
14596d20e:     	mov	r15d, 0x42
14596d214:     	mov	edx, 0x42
14596d219:     	mov	rcx, r14
14596d21c:     	call	0x1458dff90 <.text+0x58def90>
14596d221:     	nop
14596d222:     	mov	r8, rdx
14596d225:     	test	rax, rax
14596d228:     	cmovne	r14, rax
14596d22c:     	cmove	r8, r15
14596d230:     	lea	rax, [rip + 0x19c2c69]  # 0x14732fea0
14596d237:     	mov	qword ptr [rbp + 0x28], rax
14596d23b:     	mov	qword ptr [rbp + 0x30], 0x1
14596d243:     	lea	rax, [rbp + 0x108]
14596d24a:     	mov	qword ptr [rbp + 0x38], rax
14596d24e:     	lea	rax, [rip + 0x19c347b]  # 0x1473306d0
14596d255:     	mov	qword ptr [rbp + 0x40], rax
14596d259:     	mov	qword ptr [rsp + 0x20], 0x1
14596d262:     	lea	rcx, [rbp + 0x150]
14596d269:     	lea	r9, [rbp + 0x28]
14596d26d:     	mov	rdx, r14
14596d270:     	call	0x1458e0370 <.text+0x58df370>
14596d275:     	nop
14596d276:     	mov	r15, qword ptr [rbp + 0x158]
14596d27d:     	mov	r14, qword ptr [rbp + 0x160]
14596d284:     	mov	rax, qword ptr [rbp + 0x138]
14596d28b:     	sub	rax, rdi
14596d28e:     	cmp	r14, rax
14596d291:     	ja	0x14596d972 <.text+0x596c972>
14596d297:     	test	r14, r14
14596d29a:     	je	0x14596d2ad <.text+0x596c2ad>
14596d29c:     	add	rbx, rdi
14596d29f:     	mov	rcx, rbx
14596d2a2:     	mov	rdx, r15
14596d2a5:     	mov	r8, r14
14596d2a8:     	call	0x145d145fb <.text+0x5d135fb>
14596d2ad:     	add	rdi, r14
14596d2b0:     	mov	qword ptr [rbp + 0x148], rdi
14596d2b7:     	mov	rdx, qword ptr [rbp + 0x150]
14596d2be:     	test	rdx, rdx
14596d2c1:     	je	0x14596d2d1 <.text+0x596c2d1>
14596d2c3:     	mov	r8d, 0x1
14596d2c9:     	mov	rcx, r15
14596d2cc:     	call	0x1400021d0 <.text+0x11d0>
14596d2d1:     	mov	rax, qword ptr [rbp + 0x148]
14596d2d8:     	mov	qword ptr [rsi + 0x10], rax
14596d2dc:     	movups	xmm0, xmmword ptr [rbp + 0x138]
14596d2e3:     	movups	xmmword ptr [rsi], xmm0
14596d2e6:     	mov	rdx, qword ptr [rbp - 0x38]
14596d2ea:     	test	rdx, rdx
14596d2ed:     	je	0x14596d886 <.text+0x596c886>
14596d2f3:     	mov	rcx, qword ptr [rbp - 0x30]
14596d2f7:     	jmp	0x14596d87b <.text+0x596c87b>
14596d2fc:     	mov	r14d, 0x1
14596d302:     	mov	qword ptr [rbp + 0x138], rbx
14596d309:     	mov	qword ptr [rbp + 0x140], r14
14596d310:     	mov	qword ptr [rbp + 0x148], rbx
14596d317:     	lea	rbx, [rip + 0x19c4462]  # 0x147331780
14596d31e:     	mov	edi, 0x125
14596d323:     	mov	edx, 0x125
14596d328:     	mov	rcx, rbx
14596d32b:     	call	0x1458dff90 <.text+0x58def90>
14596d330:     	nop
14596d331:     	mov	r14, rdx
14596d334:     	test	rax, rax
14596d337:     	cmovne	rbx, rax
14596d33b:     	cmove	r14, rdi
14596d33f:     	movss	xmm1, dword ptr [r13 + 0x4c]
14596d345:     	lea	r12, [rbp + 0x120]
14596d34c:     	mov	rcx, r12
14596d34f:     	call	0x1458627d0 <.text+0x58617d0>
14596d354:     	nop
14596d355:     	mulss	xmm6, xmm7
14596d359:     	xorps	xmm1, xmm1
14596d35c:     	sqrtss	xmm1, xmm6
14596d360:     	mulss	xmm1, dword ptr [rip + 0x586dd8] # 0x145ef4140
14596d368:     	minss	xmm1, dword ptr [rip + 0x573230] # 0x145ee05a0
14596d370:     	mulss	xmm1, dword ptr [rip + 0x573048] # 0x145ee03c0
14596d378:     	lea	rdi, [rbp + 0x108]
14596d37f:     	mov	rcx, rdi
14596d382:     	call	0x1458627d0 <.text+0x58617d0>
14596d387:     	nop
14596d388:     	lea	r13, [rbp + 0x150]
14596d38f:     	movss	xmm1, dword ptr [rip + 0x578229] # 0x145ee55c0
14596d397:     	mov	rcx, r13
14596d39a:     	call	0x1458627d0 <.text+0x58617d0>
14596d39f:     	nop
14596d3a0:     	lea	rax, [rip + 0x19c44fe]  # 0x1473318a5
14596d3a7:     	mov	qword ptr [rbp + 0x28], rax
14596d3ab:     	mov	qword ptr [rbp + 0x30], 0x4
14596d3b3:     	lea	rax, [rbp + 0x138]
14596d3ba:     	mov	qword ptr [rbp + 0x38], rax
14596d3be:     	lea	rax, [rip + 0x19c24ab]  # 0x14732f870
14596d3c5:     	mov	qword ptr [rbp + 0x40], rax
14596d3c9:     	lea	rcx, [rip + 0x19c44d9]  # 0x1473318a9
14596d3d0:     	mov	qword ptr [rbp + 0x48], rcx
14596d3d4:     	mov	qword ptr [rbp + 0x50], 0x5
14596d3dc:     	mov	qword ptr [rbp + 0x58], r12
14596d3e0:     	mov	qword ptr [rbp + 0x60], rax
14596d3e4:     	lea	rcx, [rip + 0x19c4215]  # 0x147331600
14596d3eb:     	mov	qword ptr [rbp + 0x68], rcx
14596d3ef:     	mov	qword ptr [rbp + 0x70], 0x1
14596d3f7:     	mov	qword ptr [rbp + 0x78], rdi
14596d3fb:     	mov	qword ptr [rbp + 0x80], rax
14596d402:     	lea	rcx, [rip + 0x19c2ae8]  # 0x14732fef1
14596d409:     	mov	qword ptr [rbp + 0x88], rcx
14596d410:     	mov	qword ptr [rbp + 0x90], 0x3
14596d41b:     	mov	rcx, rbp
14596d41e:     	mov	qword ptr [rbp + 0x98], rcx
14596d425:     	mov	qword ptr [rbp + 0xa0], rax
14596d42c:     	lea	rcx, [rip + 0x19c4485]  # 0x1473318b8
14596d433:     	mov	qword ptr [rbp + 0xa8], rcx
14596d43a:     	mov	qword ptr [rbp + 0xb0], 0x4
14596d445:     	lea	rcx, [rip + 0x19c4464]  # 0x1473318b0
14596d44c:     	mov	qword ptr [rbp + 0xb8], rcx
14596d453:     	lea	rcx, [rip + 0x19c3276]  # 0x1473306d0
14596d45a:     	mov	qword ptr [rbp + 0xc0], rcx
14596d461:     	lea	rcx, [rip + 0x19c32f6]  # 0x14733075e
14596d468:     	mov	qword ptr [rbp + 0xc8], rcx
14596d46f:     	mov	qword ptr [rbp + 0xd0], 0x1
14596d47a:     	lea	rcx, [rbp - 0x50]
14596d47e:     	mov	qword ptr [rbp + 0xd8], rcx
14596d485:     	mov	qword ptr [rbp + 0xe0], rax
14596d48c:     	lea	rcx, [rip + 0x19c4429]  # 0x1473318bc
14596d493:     	mov	qword ptr [rbp + 0xe8], rcx
14596d49a:     	mov	qword ptr [rbp + 0xf0], 0x7
14596d4a5:     	mov	qword ptr [rbp + 0xf8], r13
14596d4ac:     	mov	qword ptr [rbp + 0x100], rax
14596d4b3:     	mov	qword ptr [rsp + 0x20], 0x7
14596d4bc:     	lea	r9, [rbp + 0x28]
14596d4c0:     	mov	rcx, rsi
14596d4c3:     	mov	rdx, rbx
14596d4c6:     	mov	r8, r14
14596d4c9:     	call	0x1458e0370 <.text+0x58df370>
14596d4ce:     	nop
14596d4cf:     	mov	rdx, qword ptr [rbp + 0x138]
14596d4d6:     	test	rdx, rdx
14596d4d9:     	je	0x14596d4ed <.text+0x596c4ed>
14596d4db:     	mov	rcx, qword ptr [rbp + 0x140]
14596d4e2:     	mov	r8d, 0x1
14596d4e8:     	call	0x1400021d0 <.text+0x11d0>
14596d4ed:     	mov	rdx, qword ptr [rbp + 0x150]
14596d4f4:     	test	rdx, rdx
14596d4f7:     	je	0x14596d50b <.text+0x596c50b>
14596d4f9:     	mov	rcx, qword ptr [rbp + 0x158]
14596d500:     	mov	r8d, 0x1
14596d506:     	call	0x1400021d0 <.text+0x11d0>
14596d50b:     	mov	rdx, qword ptr [rbp + 0x108]
14596d512:     	test	rdx, rdx
14596d515:     	je	0x14596d529 <.text+0x596c529>
14596d517:     	mov	rcx, qword ptr [rbp + 0x110]
14596d51e:     	mov	r8d, 0x1
14596d524:     	call	0x1400021d0 <.text+0x11d0>
14596d529:     	mov	rdx, qword ptr [rbp + 0x120]
14596d530:     	test	rdx, rdx
14596d533:     	je	0x14596d886 <.text+0x596c886>
14596d539:     	mov	rcx, qword ptr [rbp + 0x128]
14596d540:     	jmp	0x14596d87b <.text+0x596c87b>
14596d545:     	mov	dword ptr [rbp + 0x138], 0x1
14596d54f:     	lea	r15, [rip + 0x19c436d]  # 0x1473318c3
14596d556:     	mov	edi, 0x12
14596d55b:     	mov	edx, 0x12
14596d560:     	mov	rcx, r15
14596d563:     	call	0x1458dff90 <.text+0x58def90>
14596d568:     	nop
14596d569:     	mov	r12, rdx
14596d56c:     	test	rax, rax
14596d56f:     	cmovne	r15, rax
14596d573:     	cmove	r12, rdi
14596d577:     	mov	qword ptr [rsp + 0x20], 0x1
14596d580:     	lea	rcx, [rbp + 0x28]
14596d584:     	mov	r9d, 0x1
14596d58a:     	mov	rdx, r12
14596d58d:     	xor	r8d, r8d
14596d590:     	call	0x14001c2a0 <.text+0x1b2a0>
14596d595:     	mov	rcx, qword ptr [rbp + 0x30]
14596d599:     	cmp	dword ptr [rbp + 0x28], 0x1
14596d59d:     	je	0x14596d935 <.text+0x596c935>
14596d5a3:     	mov	rdi, qword ptr [rbp + 0x38]
14596d5a7:     	test	r12, r12
14596d5aa:     	je	0x14596d5c2 <.text+0x596c5c2>
14596d5ac:     	mov	qword ptr [rbp + 0x20], rcx
14596d5b0:     	mov	rcx, rdi
14596d5b3:     	mov	rdx, r15
14596d5b6:     	mov	r8, r12
14596d5b9:     	call	0x145d145fb <.text+0x5d135fb>
14596d5be:     	mov	rcx, qword ptr [rbp + 0x20]
14596d5c2:     	mov	qword ptr [rbp + 0x120], rcx
14596d5c9:     	mov	qword ptr [rbp + 0x128], rdi
14596d5d0:     	mov	qword ptr [rbp + 0x130], r12
14596d5d7:     	lea	r15, [rip + 0x19c4317]  # 0x1473318f5
14596d5de:     	mov	edi, 0x90
14596d5e3:     	mov	edx, 0x90
14596d5e8:     	mov	rcx, r15
14596d5eb:     	call	0x1458dff90 <.text+0x58def90>
14596d5f0:     	nop
14596d5f1:     	mov	r12, rdx
14596d5f4:     	test	rax, rax
14596d5f7:     	cmovne	r15, rax
14596d5fb:     	cmove	r12, rdi
14596d5ff:     	mov	rcx, rbx
14596d602:     	mov	rdx, r14
14596d605:     	call	0x14580a670 <.text+0x5809670>
14596d60a:     	test	al, 0x1
14596d60c:     	jne	0x14596d618 <.text+0x596c618>
14596d60e:     	movss	xmm0, dword ptr [rip + 0x572f8a] # 0x145ee05a0
14596d616:     	jmp	0x14596d620 <.text+0x596c620>
14596d618:     	divss	xmm0, dword ptr [rip + 0x572be0] # 0x145ee0200
14596d620:     	lea	rbx, [rbp + 0x108]
14596d627:     	mov	rcx, rbx
14596d62a:     	movaps	xmm1, xmm0
14596d62d:     	call	0x1458627d0 <.text+0x58617d0>
14596d632:     	nop
14596d633:     	movss	xmm1, dword ptr [r13 + 0x4c]
14596d639:     	lea	rdi, [rbp + 0x150]
14596d640:     	mov	rcx, rdi
14596d643:     	call	0x1458627d0 <.text+0x58617d0>
14596d648:     	nop
14596d649:     	lea	rax, [rip + 0x19c2e3a]  # 0x14733048a
14596d650:     	mov	qword ptr [rbp + 0x28], rax
14596d654:     	mov	qword ptr [rbp + 0x30], 0x4
14596d65c:     	mov	qword ptr [rbp + 0x38], rbx
14596d660:     	lea	rax, [rip + 0x19c2209]  # 0x14732f870
14596d667:     	mov	qword ptr [rbp + 0x40], rax
14596d66b:     	lea	rcx, [rip + 0x19c4233]  # 0x1473318a5
14596d672:     	mov	qword ptr [rbp + 0x48], rcx
14596d676:     	mov	qword ptr [rbp + 0x50], 0x4
14596d67e:     	lea	rcx, [rbp + 0x120]
14596d685:     	mov	qword ptr [rbp + 0x58], rcx
14596d689:     	mov	qword ptr [rbp + 0x60], rax
14596d68d:     	lea	rcx, [rip + 0x19c4215]  # 0x1473318a9
14596d694:     	mov	qword ptr [rbp + 0x68], rcx
14596d698:     	mov	qword ptr [rbp + 0x70], 0x5
14596d6a0:     	mov	qword ptr [rbp + 0x78], rdi
14596d6a4:     	mov	qword ptr [rbp + 0x80], rax
14596d6ab:     	lea	rcx, [rip + 0x19c283f]  # 0x14732fef1
14596d6b2:     	mov	qword ptr [rbp + 0x88], rcx
14596d6b9:     	mov	qword ptr [rbp + 0x90], 0x3
14596d6c4:     	mov	rcx, rbp
14596d6c7:     	mov	qword ptr [rbp + 0x98], rcx
14596d6ce:     	mov	qword ptr [rbp + 0xa0], rax
14596d6d5:     	mov	qword ptr [rsp + 0x20], 0x4
14596d6de:     	lea	r9, [rbp + 0x28]
14596d6e2:     	mov	rcx, rsi
14596d6e5:     	mov	rdx, r15
14596d6e8:     	mov	r8, r12
14596d6eb:     	call	0x1458e0370 <.text+0x58df370>
14596d6f0:     	nop
14596d6f1:     	jmp	0x14596d82c <.text+0x596c82c>
14596d6f6:     	mov	r12d, 0x1
14596d6fc:     	mov	qword ptr [rbp + 0x120], r15
14596d703:     	mov	qword ptr [rbp + 0x128], r12
14596d70a:     	mov	qword ptr [rbp + 0x130], r15
14596d711:     	lea	r15, [rip + 0x19c4431]  # 0x147331b49
14596d718:     	mov	edi, 0x126
14596d71d:     	mov	edx, 0x126
14596d722:     	mov	rcx, r15
14596d725:     	call	0x1458dff90 <.text+0x58def90>
14596d72a:     	nop
14596d72b:     	mov	r12, rdx
14596d72e:     	test	rax, rax
14596d731:     	cmovne	r15, rax
14596d735:     	cmove	r12, rdi
14596d739:     	mov	rcx, rbx
14596d73c:     	mov	rdx, r14
14596d73f:     	call	0x14580a670 <.text+0x5809670>
14596d744:     	test	al, 0x1
14596d746:     	jne	0x14596d752 <.text+0x596c752>
14596d748:     	movss	xmm1, dword ptr [rip + 0x572b60] # 0x145ee02b0
14596d750:     	jmp	0x14596d75e <.text+0x596c75e>
14596d752:     	movss	xmm1, dword ptr [rip + 0x572aa6] # 0x145ee0200
14596d75a:     	divss	xmm1, xmm0
14596d75e:     	lea	rbx, [rbp + 0x108]
14596d765:     	mov	rcx, rbx
14596d768:     	call	0x1458627d0 <.text+0x58617d0>
14596d76d:     	nop
14596d76e:     	movss	xmm1, dword ptr [r13 + 0x4c]
14596d774:     	lea	rdi, [rbp + 0x150]
14596d77b:     	mov	rcx, rdi
14596d77e:     	call	0x1458627d0 <.text+0x58617d0>
14596d783:     	nop
14596d784:     	lea	rax, [rip + 0x19c4131]  # 0x1473318bc
14596d78b:     	mov	qword ptr [rbp + 0x28], rax
14596d78f:     	mov	qword ptr [rbp + 0x30], 0x7
14596d797:     	mov	qword ptr [rbp + 0x38], rbx
14596d79b:     	lea	rax, [rip + 0x19c20ce]  # 0x14732f870
14596d7a2:     	mov	qword ptr [rbp + 0x40], rax
14596d7a6:     	lea	rcx, [rip + 0x19c40f8]  # 0x1473318a5
14596d7ad:     	mov	qword ptr [rbp + 0x48], rcx
14596d7b1:     	mov	qword ptr [rbp + 0x50], 0x4
14596d7b9:     	lea	rcx, [rbp + 0x120]
14596d7c0:     	mov	qword ptr [rbp + 0x58], rcx
14596d7c4:     	mov	qword ptr [rbp + 0x60], rax
14596d7c8:     	lea	rcx, [rip + 0x19c40da]  # 0x1473318a9
14596d7cf:     	mov	qword ptr [rbp + 0x68], rcx
14596d7d3:     	mov	qword ptr [rbp + 0x70], 0x5
14596d7db:     	mov	qword ptr [rbp + 0x78], rdi
14596d7df:     	mov	qword ptr [rbp + 0x80], rax
14596d7e6:     	lea	rcx, [rip + 0x19c2704]  # 0x14732fef1
14596d7ed:     	mov	qword ptr [rbp + 0x88], rcx
14596d7f4:     	mov	qword ptr [rbp + 0x90], 0x3
14596d7ff:     	mov	rcx, rbp
14596d802:     	mov	qword ptr [rbp + 0x98], rcx
14596d809:     	mov	qword ptr [rbp + 0xa0], rax
14596d810:     	mov	qword ptr [rsp + 0x20], 0x4
14596d819:     	lea	r9, [rbp + 0x28]
14596d81d:     	mov	rcx, rsi
14596d820:     	mov	rdx, r15
14596d823:     	mov	r8, r12
14596d826:     	call	0x1458e0370 <.text+0x58df370>
14596d82b:     	nop
14596d82c:     	mov	rdx, qword ptr [rbp + 0x120]
14596d833:     	test	rdx, rdx
14596d836:     	je	0x14596d84a <.text+0x596c84a>
14596d838:     	mov	rcx, qword ptr [rbp + 0x128]
14596d83f:     	mov	r8d, 0x1
14596d845:     	call	0x1400021d0 <.text+0x11d0>
14596d84a:     	mov	rdx, qword ptr [rbp + 0x150]
14596d851:     	test	rdx, rdx
14596d854:     	je	0x14596d868 <.text+0x596c868>
14596d856:     	mov	rcx, qword ptr [rbp + 0x158]
14596d85d:     	mov	r8d, 0x1
14596d863:     	call	0x1400021d0 <.text+0x11d0>
14596d868:     	mov	rdx, qword ptr [rbp + 0x108]
14596d86f:     	test	rdx, rdx
14596d872:     	je	0x14596d886 <.text+0x596c886>
14596d874:     	mov	rcx, qword ptr [rbp + 0x110]
14596d87b:     	mov	r8d, 0x1
14596d881:     	call	0x1400021d0 <.text+0x11d0>
14596d886:     	mov	rdx, qword ptr [rbp - 0x20]
14596d88a:     	test	rdx, rdx
14596d88d:     	je	0x14596d89e <.text+0x596c89e>
14596d88f:     	mov	rcx, qword ptr [rbp - 0x18]
14596d893:     	mov	r8d, 0x1
14596d899:     	call	0x1400021d0 <.text+0x11d0>
14596d89e:     	mov	rdx, qword ptr [rbp - 0x50]
14596d8a2:     	test	rdx, rdx
14596d8a5:     	je	0x14596d8b6 <.text+0x596c8b6>
14596d8a7:     	mov	rcx, qword ptr [rbp - 0x48]
14596d8ab:     	mov	r8d, 0x1
14596d8b1:     	call	0x1400021d0 <.text+0x11d0>
14596d8b6:     	mov	rdx, qword ptr [rbp]
14596d8ba:     	test	rdx, rdx
14596d8bd:     	je	0x14596d8ce <.text+0x596c8ce>
14596d8bf:     	mov	rcx, qword ptr [rbp + 0x8]
14596d8c3:     	mov	r8d, 0x1
14596d8c9:     	call	0x1400021d0 <.text+0x11d0>
14596d8ce:     	mov	rax, rsi
14596d8d1:     	movaps	xmm6, xmmword ptr [rbp + 0x170]
14596d8d8:     	movaps	xmm7, xmmword ptr [rbp + 0x180]
14596d8df:     	movaps	xmm8, xmmword ptr [rbp + 0x190]
14596d8e7:     	add	rsp, 0x228
14596d8ee:     	pop	rbx
14596d8ef:     	pop	rdi
14596d8f0:     	pop	rsi
14596d8f1:     	pop	r12
14596d8f3:     	pop	r13
14596d8f5:     	pop	r14
14596d8f7:     	pop	r15
14596d8f9:     	pop	rbp
14596d8fa:     	ret
14596d8fb:     	mov	qword ptr [rsp + 0x20], 0x1
14596d904:     	lea	rcx, [rbp + 0x138]
14596d90b:     	mov	r9d, 0x1
14596d911:     	mov	rdx, rdi
14596d914:     	mov	r8, r13
14596d917:     	call	0x145d14a10 <.text+0x5d13a10>
14596d91c:     	nop
14596d91d:     	mov	rdi, qword ptr [rbp + 0x148]
14596d924:     	jmp	0x14596d139 <.text+0x596c139>
14596d929:     	mov	rdx, qword ptr [rbp + 0x38]
14596d92d:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14596d932:     	nop
14596d933:     	jmp	0x14596d93f <.text+0x596c93f>
14596d935:     	mov	rdx, qword ptr [rbp + 0x38]
14596d939:     	call	0x145eb6fcb <.text+0x5eb5fcb>
14596d93e:     	nop
14596d93f:     	ud2
14596d941:     	mov	qword ptr [rsp + 0x20], 0x1
14596d94a:     	lea	rcx, [rbp + 0x138]
14596d951:     	mov	r8d, 0x1
14596d957:     	mov	r9d, 0x1
14596d95d:     	mov	rdx, rdi
14596d960:     	call	0x145d14a10 <.text+0x5d13a10>
14596d965:     	nop
14596d966:     	mov	rdi, qword ptr [rbp + 0x148]
14596d96d:     	jmp	0x14596d1f2 <.text+0x596c1f2>
14596d972:     	mov	qword ptr [rbp + 0x20], r15
14596d976:     	mov	qword ptr [rsp + 0x20], 0x1
14596d97f:     	lea	rcx, [rbp + 0x138]
14596d986:     	mov	r9d, 0x1
14596d98c:     	mov	rdx, rdi
14596d98f:     	mov	r8, r14
14596d992:     	call	0x145d14a10 <.text+0x5d13a10>
14596d997:     	nop
14596d998:     	mov	rbx, qword ptr [rbp + 0x140]
14596d99f:     	mov	rdi, qword ptr [rbp + 0x148]
14596d9a6:     	mov	r15, qword ptr [rbp + 0x20]
14596d9aa:     	jmp	0x14596d29c <.text+0x596c29c>

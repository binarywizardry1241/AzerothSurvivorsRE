
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14594cdc0:     	pushq	%r15
14594cdc2:     	pushq	%r14
14594cdc4:     	pushq	%r13
14594cdc6:     	pushq	%r12
14594cdc8:     	pushq	%rsi
14594cdc9:     	pushq	%rdi
14594cdca:     	pushq	%rbp
14594cdcb:     	pushq	%rbx
14594cdcc:     	subq	$0x188, %rsp            # imm = 0x188
14594cdd3:     	movaps	%xmm15, 0x170(%rsp)
14594cddc:     	movaps	%xmm14, 0x160(%rsp)
14594cde5:     	movaps	%xmm13, 0x150(%rsp)
14594cdee:     	movaps	%xmm12, 0x140(%rsp)
14594cdf7:     	movaps	%xmm11, 0x130(%rsp)
14594ce00:     	movaps	%xmm10, 0x120(%rsp)
14594ce09:     	movaps	%xmm9, 0x110(%rsp)
14594ce12:     	movaps	%xmm8, 0x100(%rsp)
14594ce1b:     	movaps	%xmm7, 0xf0(%rsp)
14594ce23:     	movaps	%xmm6, 0xe0(%rsp)
14594ce2b:     	movq	%rdx, %rsi
14594ce2e:     	movq	%rcx, %r14
14594ce31:     	movq	0xd8(%rcx), %rcx
14594ce38:     	movq	%rcx, 0x70(%rsp)
14594ce3d:     	cmpq	%rcx, %rdx
14594ce40:     	jae	0x14594e0ce <.text+0x594d0ce>
14594ce46:     	movss	0x9ec(%r14), %xmm6
14594ce4f:     	movq	0xd0(%r14), %rdx
14594ce56:     	imulq	$0x78, %rsi, %rcx
14594ce5a:     	leaq	(%rdx,%rcx), %rax
14594ce5e:     	movq	0x18(%rdx,%rcx), %r15
14594ce63:     	movq	%rdx, 0x88(%rsp)
14594ce6b:     	movss	0x5c(%rdx,%rcx), %xmm0
14594ce71:     	xorps	%xmm1, %xmm1
14594ce74:     	ucomiss	%xmm0, %xmm1
14594ce77:     	jae	0x14594ced1 <.text+0x594bed1>
14594ce79:     	movaps	%xmm6, %xmm2
14594ce7c:     	subss	0x58(%rax), %xmm2
14594ce81:     	divss	%xmm0, %xmm2
14594ce85:     	maxss	%xmm2, %xmm1
14594ce89:     	movss	0x4204db(%rip), %xmm3   # 0x145d6d36c
14594ce91:     	minss	%xmm1, %xmm3
14594ce95:     	movsd	0x40(%rax), %xmm2
14594ce9a:     	movsd	0x4c(%rax), %xmm1
14594ce9f:     	movaps	%xmm1, %xmm4
14594cea2:     	subps	%xmm2, %xmm4
14594cea5:     	movsldup	%xmm3, %xmm8            # xmm8 = xmm3[0,0,2,2]
14594ceaa:     	mulps	%xmm4, %xmm8
14594ceae:     	addps	%xmm2, %xmm8
14594ceb2:     	movss	0x48(%rax), %xmm4
14594ceb7:     	movss	0x54(%rax), %xmm2
14594cebc:     	movaps	%xmm2, %xmm9
14594cec0:     	subss	%xmm4, %xmm9
14594cec5:     	mulss	%xmm3, %xmm9
14594ceca:     	addss	%xmm4, %xmm9
14594cecf:     	jmp	0x14594cee4 <.text+0x594bee4>
14594ced1:     	movsd	0x4c(%rax), %xmm8
14594ced7:     	movss	0x54(%rax), %xmm2
14594cedc:     	movaps	%xmm2, %xmm9
14594cee0:     	movaps	%xmm8, %xmm1
14594cee4:     	movsd	0x4c8(%r14), %xmm15
14594ceed:     	movl	0x4d0(%r14), %edi
14594cef4:     	movq	0x28(%rax), %rbx
14594cef8:     	movzbl	0x39(%r15), %ecx
14594cefd:     	cmpl	$0x5, %ecx
14594cf00:     	movq	%r15, 0x60(%rsp)
14594cf05:     	movq	%rbx, 0x80(%rsp)
14594cf0d:     	je	0x14594cf73 <.text+0x594bf73>
14594cf0f:     	cmpl	$0x7, %ecx
14594cf12:     	jne	0x14594d331 <.text+0x594c331>
14594cf18:     	xorps	%xmm3, %xmm3
14594cf1b:     	ucomiss	%xmm0, %xmm3
14594cf1e:     	jae	0x14594d04c <.text+0x594c04c>
14594cf24:     	movaps	%xmm6, %xmm4
14594cf27:     	subss	0x58(%rax), %xmm4
14594cf2c:     	divss	%xmm0, %xmm4
14594cf30:     	maxss	%xmm4, %xmm3
14594cf34:     	movss	0x420430(%rip), %xmm0   # 0x145d6d36c
14594cf3c:     	minss	%xmm3, %xmm0
14594cf40:     	movss	0x48(%rax), %xmm3
14594cf45:     	subss	%xmm3, %xmm2
14594cf49:     	mulss	%xmm0, %xmm2
14594cf4d:     	addss	%xmm3, %xmm2
14594cf51:     	movsd	0x40(%rax), %xmm3
14594cf56:     	subps	%xmm3, %xmm1
14594cf59:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
14594cf5d:     	mulps	%xmm1, %xmm0
14594cf60:     	addps	%xmm3, %xmm0
14594cf63:     	movlps	%xmm0, 0x48(%rsp)
14594cf68:     	movss	%xmm2, 0x50(%rsp)
14594cf6e:     	jmp	0x14594d05c <.text+0x594c05c>
14594cf73:     	movq	0x568(%r14), %rax
14594cf7a:     	testq	%rax, %rax
14594cf7d:     	je	0x14594d331 <.text+0x594c331>
14594cf83:     	movq	0x560(%r14), %rdx
14594cf8a:     	imulq	$0x160, %rax, %rcx      # imm = 0x160
14594cf91:     	xorl	%eax, %eax
14594cf93:     	jmp	0x14594cfaf <.text+0x594bfaf>
14594cf95:     	nopw	%cs:(%rax,%rax)
14594cfa0:     	addq	$0x160, %rax            # imm = 0x160
14594cfa6:     	cmpq	%rax, %rcx
14594cfa9:     	je	0x14594de12 <.text+0x594ce12>
14594cfaf:     	cmpq	%rbx, 0x88(%rdx,%rax)
14594cfb7:     	jne	0x14594cfa0 <.text+0x594bfa0>
14594cfb9:     	cmpb	$0x0, 0x68(%rdx,%rax)
14594cfbe:     	jne	0x14594cfa0 <.text+0x594bfa0>
14594cfc0:     	cmpq	$-0x1, 0x18(%rdx,%rax)
14594cfc6:     	jne	0x14594cfd2 <.text+0x594bfd2>
14594cfc8:     	cmpb	$0x0, 0x15c(%rdx,%rax)
14594cfd0:     	je	0x14594cfa0 <.text+0x594bfa0>
14594cfd2:     	xorl	%eax, %eax
14594cfd4:     	movq	%rdx, %r8
14594cfd7:     	nopw	(%rax,%rax)
14594cfe0:     	cmpq	%rax, %rcx
14594cfe3:     	je	0x14594de12 <.text+0x594ce12>
14594cfe9:     	addq	$0x160, %rax            # imm = 0x160
14594cfef:     	cmpq	%rbx, 0x88(%r8)
14594cff6:     	leaq	0x160(%r8), %r8
14594cffd:     	jne	0x14594cfe0 <.text+0x594bfe0>
14594cfff:     	movss	-0x38(%rdx,%rax), %xmm1
14594d005:     	xorps	%xmm0, %xmm0
14594d008:     	ucomiss	%xmm1, %xmm0
14594d00b:     	jae	0x14594dddb <.text+0x594cddb>
14594d011:     	movaps	%xmm6, %xmm2
14594d014:     	subss	-0x3c(%rdx,%rax), %xmm2
14594d01a:     	divss	%xmm1, %xmm2
14594d01e:     	maxss	%xmm2, %xmm0
14594d022:     	movss	0x420342(%rip), %xmm1   # 0x145d6d36c
14594d02a:     	minss	%xmm0, %xmm1
14594d02e:     	movsd	-0x54(%rdx,%rax), %xmm2
14594d034:     	movsd	-0x48(%rdx,%rax), %xmm3
14594d03a:     	subps	%xmm2, %xmm3
14594d03d:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
14594d041:     	mulps	%xmm3, %xmm0
14594d044:     	addps	%xmm2, %xmm0
14594d047:     	jmp	0x14594dde1 <.text+0x594cde1>
14594d04c:     	movl	0x54(%rax), %ecx
14594d04f:     	movl	%ecx, 0x50(%rsp)
14594d053:     	movq	0x4c(%rax), %rcx
14594d057:     	movq	%rcx, 0x48(%rsp)
14594d05c:     	movq	0x30(%rax), %rbx
14594d060:     	movq	$0x0, 0x28(%rsp)
14594d069:     	movq	$0x8, 0x20(%rsp)
14594d072:     	leaq	0x98(%rsp), %rcx
14594d07a:     	leaq	0x48(%rsp), %r8
14594d07f:     	movss	0x423ba9(%rip), %xmm3   # 0x145d70c30
14594d087:     	movq	%r14, %rdx
14594d08a:     	callq	0x145925c80 <.text+0x5924c80>
14594d08f:     	movq	0xa0(%rsp), %rcx
14594d097:     	movq	0xa8(%rsp), %rax
14594d09f:     	movabsq	$0xffffffffffffff8, %rdx # imm = 0xFFFFFFFFFFFFFF8
14594d0a9:     	andq	%rax, %rdx
14594d0ac:     	xorl	%r8d, %r8d
14594d0af:     	nop
14594d0b0:     	cmpq	%r8, %rdx
14594d0b3:     	je	0x14594d0f2 <.text+0x594c0f2>
14594d0b5:     	cmpq	%rbx, (%rcx,%r8,8)
14594d0b9:     	je	0x14594d10e <.text+0x594c10e>
14594d0bb:     	cmpq	%rbx, 0x8(%rcx,%r8,8)
14594d0c0:     	je	0x14594d10e <.text+0x594c10e>
14594d0c2:     	cmpq	%rbx, 0x10(%rcx,%r8,8)
14594d0c7:     	je	0x14594d10e <.text+0x594c10e>
14594d0c9:     	cmpq	%rbx, 0x18(%rcx,%r8,8)
14594d0ce:     	je	0x14594d10e <.text+0x594c10e>
14594d0d0:     	cmpq	%rbx, 0x20(%rcx,%r8,8)
14594d0d5:     	je	0x14594d10e <.text+0x594c10e>
14594d0d7:     	cmpq	%rbx, 0x28(%rcx,%r8,8)
14594d0dc:     	je	0x14594d10e <.text+0x594c10e>
14594d0de:     	cmpq	%rbx, 0x30(%rcx,%r8,8)
14594d0e3:     	je	0x14594d10e <.text+0x594c10e>
14594d0e5:     	cmpq	%rbx, 0x38(%rcx,%r8,8)
14594d0ea:     	leaq	0x8(%r8), %r8
14594d0ee:     	jne	0x14594d0b0 <.text+0x594c0b0>
14594d0f0:     	jmp	0x14594d10e <.text+0x594c10e>
14594d0f2:     	leal	(,%rax,8), %r8d
14594d0fa:     	andl	$0x38, %r8d
14594d0fe:     	je	0x14594d286 <.text+0x594c286>
14594d104:     	cmpq	%rbx, (%rcx,%rdx,8)
14594d108:     	jne	0x14594d1af <.text+0x594c1af>
14594d10e:     	movq	0x568(%r14), %r8
14594d115:     	testq	%r8, %r8
14594d118:     	je	0x14594d286 <.text+0x594c286>
14594d11e:     	movq	0x560(%r14), %rdx
14594d125:     	imulq	$0x160, %r8, %r8        # imm = 0x160
14594d12c:     	xorl	%r9d, %r9d
14594d12f:     	jmp	0x14594d150 <.text+0x594c150>
14594d131:     	nopw	%cs:(%rax,%rax)
14594d140:     	addq	$0x160, %r9             # imm = 0x160
14594d147:     	cmpq	%r9, %r8
14594d14a:     	je	0x14594d286 <.text+0x594c286>
14594d150:     	cmpq	%rbx, 0x88(%rdx,%r9)
14594d158:     	jne	0x14594d140 <.text+0x594c140>
14594d15a:     	cmpb	$0x0, 0x68(%rdx,%r9)
14594d160:     	jne	0x14594d140 <.text+0x594c140>
14594d162:     	cmpq	$-0x1, 0x18(%rdx,%r9)
14594d168:     	jne	0x14594d175 <.text+0x594c175>
14594d16a:     	cmpb	$0x0, 0x15c(%rdx,%r9)
14594d173:     	je	0x14594d140 <.text+0x594c140>
14594d175:     	movq	%r8, %r9
14594d178:     	movq	%rdx, %r11
14594d17b:     	nopl	(%rax,%rax)
14594d180:     	testq	%r9, %r9
14594d183:     	je	0x14594d230 <.text+0x594c230>
14594d189:     	movq	%r11, %r10
14594d18c:     	addq	$0x160, %r11            # imm = 0x160
14594d193:     	addq	$-0x160, %r9            # imm = 0xFEA0
14594d19a:     	cmpq	%rbx, 0x88(%r10)
14594d1a1:     	jne	0x14594d180 <.text+0x594c180>
14594d1a3:     	cmpq	$-0x1, 0x18(%r10)
14594d1a8:     	je	0x14594d180 <.text+0x594c180>
14594d1aa:     	jmp	0x14594d2f6 <.text+0x594c2f6>
14594d1af:     	cmpl	$0x8, %r8d
14594d1b3:     	je	0x14594d286 <.text+0x594c286>
14594d1b9:     	cmpq	%rbx, 0x8(%rcx,%rdx,8)
14594d1be:     	je	0x14594d10e <.text+0x594c10e>
14594d1c4:     	cmpl	$0x10, %r8d
14594d1c8:     	je	0x14594d286 <.text+0x594c286>
14594d1ce:     	cmpq	%rbx, 0x10(%rcx,%rdx,8)
14594d1d3:     	je	0x14594d10e <.text+0x594c10e>
14594d1d9:     	cmpl	$0x18, %r8d
14594d1dd:     	je	0x14594d286 <.text+0x594c286>
14594d1e3:     	cmpq	%rbx, 0x18(%rcx,%rdx,8)
14594d1e8:     	je	0x14594d10e <.text+0x594c10e>
14594d1ee:     	cmpl	$0x20, %r8d
14594d1f2:     	je	0x14594d286 <.text+0x594c286>
14594d1f8:     	cmpq	%rbx, 0x20(%rcx,%rdx,8)
14594d1fd:     	je	0x14594d10e <.text+0x594c10e>
14594d203:     	cmpl	$0x28, %r8d
14594d207:     	je	0x14594d286 <.text+0x594c286>
14594d209:     	cmpq	%rbx, 0x28(%rcx,%rdx,8)
14594d20e:     	je	0x14594d10e <.text+0x594c10e>
14594d214:     	cmpl	$0x30, %r8d
14594d218:     	je	0x14594d286 <.text+0x594c286>
14594d21a:     	cmpq	%rbx, 0x30(%rcx,%rdx,8)
14594d21f:     	je	0x14594d10e <.text+0x594c10e>
14594d225:     	cmpl	$0x38, %r8d
14594d229:     	je	0x14594d286 <.text+0x594c286>
14594d22b:     	jmp	0x14594d10e <.text+0x594c10e>
14594d230:     	movb	$0x1, %bpl
14594d233:     	testq	%rax, %rax
14594d236:     	je	0x14594d2fd <.text+0x594c2fd>
14594d23c:     	leaq	(%rcx,%rax,8), %r9
14594d240:     	movq	%rcx, %r10
14594d243:     	jmp	0x14594d24e <.text+0x594c24e>
14594d245:     	cmpq	%r9, %r10
14594d248:     	je	0x14594d2fd <.text+0x594c2fd>
14594d24e:     	movq	(%r10), %r11
14594d251:     	addq	$0x8, %r10
14594d255:     	xorl	%r15d, %r15d
14594d258:     	jmp	0x14594d26c <.text+0x594c26c>
14594d25a:     	nopw	(%rax,%rax)
14594d260:     	addq	$0x160, %r15            # imm = 0x160
14594d267:     	cmpq	%r15, %r8
14594d26a:     	je	0x14594d245 <.text+0x594c245>
14594d26c:     	cmpq	%r11, 0x88(%rdx,%r15)
14594d274:     	jne	0x14594d260 <.text+0x594c260>
14594d276:     	cmpl	$0x0, 0x68(%rdx,%r15)
14594d27c:     	jne	0x14594d260 <.text+0x594c260>
14594d27e:     	cmpq	$-0x1, 0x18(%rdx,%r15)
14594d284:     	je	0x14594d260 <.text+0x594c260>
14594d286:     	testq	%rax, %rax
14594d289:     	je	0x14594d2fb <.text+0x594c2fb>
14594d28b:     	movq	0x568(%r14), %r8
14594d292:     	testq	%r8, %r8
14594d295:     	je	0x14594d2fb <.text+0x594c2fb>
14594d297:     	leaq	(%rcx,%rax,8), %rax
14594d29b:     	movq	0x560(%r14), %rdx
14594d2a2:     	imulq	$0x160, %r8, %r8        # imm = 0x160
14594d2a9:     	movq	%rcx, %r9
14594d2ac:     	jmp	0x14594d2b9 <.text+0x594c2b9>
14594d2ae:     	nop
14594d2b0:     	cmpq	%rax, %r9
14594d2b3:     	je	0x14594e076 <.text+0x594d076>
14594d2b9:     	movq	(%r9), %rbx
14594d2bc:     	addq	$0x8, %r9
14594d2c0:     	xorl	%r10d, %r10d
14594d2c3:     	jmp	0x14594d2dc <.text+0x594c2dc>
14594d2c5:     	nopw	%cs:(%rax,%rax)
14594d2d0:     	addq	$0x160, %r10            # imm = 0x160
14594d2d7:     	cmpq	%r10, %r8
14594d2da:     	je	0x14594d2b0 <.text+0x594c2b0>
14594d2dc:     	cmpq	%rbx, 0x88(%rdx,%r10)
14594d2e4:     	jne	0x14594d2d0 <.text+0x594c2d0>
14594d2e6:     	cmpl	$0x0, 0x68(%rdx,%r10)
14594d2ec:     	jne	0x14594d2d0 <.text+0x594c2d0>
14594d2ee:     	cmpq	$-0x1, 0x18(%rdx,%r10)
14594d2f4:     	je	0x14594d2d0 <.text+0x594c2d0>
14594d2f6:     	movb	$0x1, %bpl
14594d2f9:     	jmp	0x14594d2fd <.text+0x594c2fd>
14594d2fb:     	xorl	%ebp, %ebp
14594d2fd:     	movq	0x98(%rsp), %rdx
14594d305:     	testq	%rdx, %rdx
14594d308:     	je	0x14594d319 <.text+0x594c319>
14594d30a:     	shlq	$0x3, %rdx
14594d30e:     	movl	$0x8, %r8d
14594d314:     	callq	0x1400021d0 <.text+0x11d0>
14594d319:     	movl	$0x1, %eax
14594d31e:     	movq	%rax, 0x38(%rsp)
14594d323:     	testb	%bpl, %bpl
14594d326:     	movq	0x60(%rsp), %r15
14594d32b:     	jne	0x14594dd67 <.text+0x594cd67>
14594d331:     	movl	0x34(%r15), %ebp
14594d335:     	testl	%ebp, %ebp
14594d337:     	je	0x14594d348 <.text+0x594c348>
14594d339:     	movlps	%xmm8, 0x48(%rsp)
14594d33f:     	movss	%xmm9, 0x50(%rsp)
14594d346:     	jmp	0x14594d352 <.text+0x594c352>
14594d348:     	movlps	%xmm15, 0x48(%rsp)
14594d34e:     	movl	%edi, 0x50(%rsp)
14594d352:     	movq	$0x0, 0x28(%rsp)
14594d35b:     	movq	$0x8, 0x20(%rsp)
14594d364:     	leaq	0x98(%rsp), %rcx
14594d36c:     	leaq	0x48(%rsp), %r8
14594d371:     	movss	0x450aa7(%rip), %xmm3   # 0x145d9de20
14594d379:     	movq	%r14, %rdx
14594d37c:     	callq	0x145925c80 <.text+0x5924c80>
14594d381:     	movq	0xa8(%rsp), %rax
14594d389:     	testq	%rax, %rax
14594d38c:     	je	0x14594dd3a <.text+0x594cd3a>
14594d392:     	xorl	%ecx, %ecx
14594d394:     	movl	0x4d8(%r14), %edx
14594d39b:     	xorps	%xmm0, %xmm0
14594d39e:     	cvtsi2ss	%rdx, %xmm0
14594d3a3:     	testl	%ebp, %ebp
14594d3a5:     	sete	%cl
14594d3a8:     	addss	0x426964(%rip), %xmm0   # 0x145d73d14
14594d3b0:     	mulss	0x468b3c(%rip), %xmm0   # 0x145db5ef4
14594d3b8:     	movss	0x41ffac(%rip), %xmm1   # 0x145d6d36c
14594d3c0:     	addss	%xmm1, %xmm0
14594d3c4:     	mulss	0x2c(%r15), %xmm0
14594d3ca:     	mulss	0x47c(%r14), %xmm0
14594d3d3:     	movq	0x98(%rsp), %rdx
14594d3db:     	movq	%rdx, 0xc8(%rsp)
14594d3e3:     	movq	0xa0(%rsp), %rdx
14594d3eb:     	leaq	(%rdx,%rax,8), %r8
14594d3ef:     	movq	0x560(%r14), %r9
14594d3f6:     	movq	0x568(%r14), %r10
14594d3fd:     	movq	0x590(%r14), %rbx
14594d404:     	movq	0x598(%r14), %r11
14594d40b:     	leaq	0x152b2ce(%rip), %rax   # 0x146e786e0
14594d412:     	movss	(%rax,%rcx,4), %xmm2
14594d417:     	movss	%xmm2, 0x94(%rsp)
14594d420:     	maxss	%xmm1, %xmm0
14594d424:     	movq	%r11, 0x78(%rsp)
14594d429:     	andq	$-0x2, %r11
14594d42d:     	movq	%r11, 0xd8(%rsp)
14594d435:     	movq	0x70(%rsp), %rdi
14594d43a:     	andq	$-0x2, %rdi
14594d43e:     	movq	%r10, 0x58(%rsp)
14594d443:     	imulq	$0x160, %r10, %r11      # imm = 0x160
14594d44a:     	movq	%rbx, %r10
14594d44d:     	leaq	0xf9(%rbx), %rax
14594d454:     	movq	%rax, 0xb8(%rsp)
14594d45c:     	movq	0x88(%rsp), %rax
14594d464:     	addq	$0xa0, %rax
14594d46a:     	movq	%rax, 0xd0(%rsp)
14594d472:     	movl	$0x20, %r14d
14594d478:     	movq	$0x0, 0x38(%rsp)
14594d481:     	xorps	%xmm3, %xmm3
14594d484:     	movss	0x426984(%rip), %xmm4   # 0x145d73e10
14594d48c:     	movq	%rdx, 0xc0(%rsp)
14594d494:     	movq	%rdx, %rcx
14594d497:     	movq	%r8, 0x30(%rsp)
14594d49c:     	movq	%r10, 0xb0(%rsp)
14594d4a4:     	movl	%ebp, 0x44(%rsp)
14594d4a8:     	jmp	0x14594d4c9 <.text+0x594c4c9>
14594d4aa:     	cmoveq	%r15, %rbx
14594d4ae:     	movl	$0x1, %eax
14594d4b3:     	movq	%rax, 0x38(%rsp)
14594d4b8:     	nopl	(%rax,%rax)
14594d4c0:     	testq	%r14, %r14
14594d4c3:     	je	0x14594dd14 <.text+0x594cd14>
14594d4c9:     	cmpq	%r8, %rcx
14594d4cc:     	je	0x14594dd14 <.text+0x594cd14>
14594d4d2:     	decq	%r14
14594d4d5:     	movq	(%rcx), %r15
14594d4d8:     	addq	$0x8, %rcx
14594d4dc:     	xorl	%r13d, %r13d
14594d4df:     	movq	%r9, %rax
14594d4e2:     	nopw	%cs:(%rax,%rax)
14594d4f0:     	cmpq	%r13, %r11
14594d4f3:     	je	0x14594d4c0 <.text+0x594c4c0>
14594d4f5:     	addq	$0x160, %r13            # imm = 0x160
14594d4fc:     	cmpq	%r15, 0x88(%rax)
14594d503:     	leaq	0x160(%rax), %rax
14594d50a:     	jne	0x14594d4f0 <.text+0x594c4f0>
14594d50c:     	movss	-0x38(%r9,%r13), %xmm9
14594d513:     	ucomiss	%xmm9, %xmm3
14594d517:     	jae	0x14594d560 <.text+0x594c560>
14594d519:     	movaps	%xmm6, %xmm11
14594d51d:     	subss	-0x3c(%r9,%r13), %xmm11
14594d524:     	divss	%xmm9, %xmm11
14594d529:     	xorps	%xmm9, %xmm9
14594d52d:     	maxss	%xmm11, %xmm9
14594d532:     	movaps	%xmm1, %xmm11
14594d536:     	minss	%xmm9, %xmm11
14594d53b:     	movsd	-0x54(%r9,%r13), %xmm9
14594d542:     	movsd	-0x48(%r9,%r13), %xmm12
14594d549:     	subps	%xmm9, %xmm12
14594d54d:     	movsldup	%xmm11, %xmm13          # xmm13 = xmm11[0,0,2,2]
14594d552:     	mulps	%xmm12, %xmm13
14594d556:     	addps	%xmm9, %xmm13
14594d55a:     	testl	%ebp, %ebp
14594d55c:     	jne	0x14594d598 <.text+0x594c598>
14594d55e:     	jmp	0x14594d56b <.text+0x594c56b>
14594d560:     	movsd	-0x48(%r9,%r13), %xmm13
14594d567:     	testl	%ebp, %ebp
14594d569:     	jne	0x14594d598 <.text+0x594c598>
14594d56b:     	movaps	%xmm13, %xmm9
14594d56f:     	subps	%xmm8, %xmm9
14594d573:     	mulps	%xmm9, %xmm9
14594d577:     	movshdup	%xmm9, %xmm11           # xmm11 = xmm9[1,1,3,3]
14594d57c:     	addss	%xmm9, %xmm11
14594d581:     	xorps	%xmm9, %xmm9
14594d585:     	sqrtss	%xmm11, %xmm9
14594d58a:     	ucomiss	0x46a73e(%rip), %xmm9   # 0x145db7cd0
14594d592:     	ja	0x14594d4c0 <.text+0x594c4c0>
14594d598:     	movss	-0x20(%r9,%r13), %xmm9
14594d59f:     	ucomiss	%xmm6, %xmm9
14594d5a3:     	ja	0x14594d4c0 <.text+0x594c4c0>
14594d5a9:     	movq	%r14, 0x68(%rsp)
14594d5ae:     	movq	-0x148(%r9,%r13), %r14
14594d5b6:     	cmpq	$-0x1, %r14
14594d5ba:     	jne	0x14594d6d8 <.text+0x594c6d8>
14594d5c0:     	cmpb	$0x1, -0x4(%r9,%r13)
14594d5c6:     	je	0x14594d6d8 <.text+0x594c6d8>
14594d5cc:     	movss	0x42369b(%rip), %xmm9   # 0x145d70c70
14594d5d5:     	cmpq	$0x0, 0x78(%rsp)
14594d5db:     	je	0x14594d6cc <.text+0x594c6cc>
14594d5e1:     	cmpq	$0x1, 0x78(%rsp)
14594d5e7:     	jne	0x14594d5f9 <.text+0x594c5f9>
14594d5e9:     	xorl	%edx, %edx
14594d5eb:     	movss	0x42367c(%rip), %xmm9   # 0x145d70c70
14594d5f4:     	jmp	0x14594d6a5 <.text+0x594c6a5>
14594d5f9:     	movq	0xb8(%rsp), %r10
14594d601:     	xorl	%edx, %edx
14594d603:     	movss	0x423664(%rip), %xmm9   # 0x145d70c70
14594d60c:     	jmp	0x14594d625 <.text+0x594c625>
14594d60e:     	nop
14594d610:     	addq	$0x2, %rdx
14594d614:     	addq	$0x100, %r10            # imm = 0x100
14594d61b:     	cmpq	%rdx, 0xd8(%rsp)
14594d623:     	je	0x14594d696 <.text+0x594c696>
14594d625:     	testb	$0x1, -0x80(%r10)
14594d62a:     	movaps	%xmm9, %xmm11
14594d62e:     	jne	0x14594d670 <.text+0x594c670>
14594d630:     	movss	-0x85(%r10), %xmm11
14594d639:     	addss	%xmm9, %xmm11
14594d63e:     	cmpq	%r15, -0xa9(%r10)
14594d645:     	je	0x14594d679 <.text+0x594c679>
14594d647:     	testb	$0x1, (%r10)
14594d64b:     	movaps	%xmm9, %xmm11
14594d64f:     	jne	0x14594d687 <.text+0x594c687>
14594d651:     	movss	-0x5(%r10), %xmm11
14594d657:     	addss	%xmm9, %xmm11
14594d65c:     	cmpq	%r15, -0x29(%r10)
14594d660:     	jne	0x14594d610 <.text+0x594c610>
14594d662:     	jmp	0x14594d68d <.text+0x594c68d>
14594d664:     	nopw	%cs:(%rax,%rax)
14594d670:     	cmpq	%r15, -0xa9(%r10)
14594d677:     	jne	0x14594d647 <.text+0x594c647>
14594d679:     	movaps	%xmm11, %xmm9
14594d67d:     	testb	$0x1, (%r10)
14594d681:     	movaps	%xmm9, %xmm11
14594d685:     	je	0x14594d651 <.text+0x594c651>
14594d687:     	cmpq	%r15, -0x29(%r10)
14594d68b:     	jne	0x14594d610 <.text+0x594c610>
14594d68d:     	movaps	%xmm11, %xmm9
14594d691:     	jmp	0x14594d610 <.text+0x594c610>
14594d696:     	testb	$0x1, 0x78(%rsp)
14594d69b:     	movq	0xb0(%rsp), %r10
14594d6a3:     	je	0x14594d6cc <.text+0x594c6cc>
14594d6a5:     	shlq	$0x7, %rdx
14594d6a9:     	testb	$0x1, 0x79(%r10,%rdx)
14594d6af:     	movaps	%xmm9, %xmm11
14594d6b3:     	jne	0x14594d6c1 <.text+0x594c6c1>
14594d6b5:     	movss	0x74(%r10,%rdx), %xmm11
14594d6bc:     	addss	%xmm9, %xmm11
14594d6c1:     	cmpq	%r15, 0x50(%r10,%rdx)
14594d6c6:     	jne	0x14594d6cc <.text+0x594c6cc>
14594d6c8:     	movaps	%xmm11, %xmm9
14594d6cc:     	ucomiss	-0x70(%r9,%r13), %xmm9
14594d6d2:     	jae	0x14594dc60 <.text+0x594cc60>
14594d6d8:     	movaps	%xmm13, %xmm9
14594d6dc:     	movaps	%xmm15, %xmm2
14594d6e0:     	subps	%xmm15, %xmm9
14594d6e4:     	mulps	%xmm9, %xmm9
14594d6e8:     	movshdup	%xmm9, %xmm11           # xmm11 = xmm9[1,1,3,3]
14594d6ed:     	addss	%xmm9, %xmm11
14594d6f2:     	xorps	%xmm15, %xmm15
14594d6f6:     	sqrtss	%xmm11, %xmm15
14594d6fb:     	movaps	%xmm15, %xmm9
14594d6ff:     	divss	0x41fd20(%rip), %xmm9   # 0x145d6d428
14594d708:     	addss	%xmm1, %xmm9
14594d70d:     	movss	0x46af0a(%rip), %xmm12  # 0x145db8620
14594d716:     	movaps	%xmm4, %xmm11
14594d71a:     	cmpq	$-0x1, %r14
14594d71e:     	jne	0x14594d761 <.text+0x594c761>
14594d720:     	cmpb	$0x1, -0x4(%r9,%r13)
14594d726:     	movss	0x44d76d(%rip), %xmm12  # 0x145d9ae9c
14594d72f:     	movss	0x423504(%rip), %xmm11  # 0x145d70c3c
14594d738:     	je	0x14594d761 <.text+0x594c761>
14594d73a:     	movss	-0x70(%r9,%r13), %xmm11
14594d741:     	divss	%xmm0, %xmm11
14594d746:     	movaps	%xmm1, %xmm12
14594d74a:     	maxss	%xmm11, %xmm12
14594d74f:     	movss	0x41fcd4(%rip), %xmm11  # 0x145d6d42c
14594d758:     	minss	%xmm12, %xmm11
14594d75d:     	xorps	%xmm12, %xmm12
14594d761:     	cmpq	$0x1, 0x70(%rsp)
14594d767:     	jne	0x14594d7cb <.text+0x594c7cb>
14594d769:     	xorl	%ebp, %ebp
14594d76b:     	xorl	%r14d, %r14d
14594d76e:     	cmpq	%rsi, %rbp
14594d771:     	je	0x14594d9f5 <.text+0x594c9f5>
14594d777:     	imulq	$0x78, %rbp, %rdx
14594d77b:     	movl	$0x0, %eax
14594d780:     	movq	0x88(%rsp), %r8
14594d788:     	cmpq	%r15, 0x28(%r8,%rdx)
14594d78d:     	movq	0x60(%rsp), %r8
14594d792:     	movq	0x80(%rsp), %r10
14594d79a:     	movl	0x44(%rsp), %ebp
14594d79e:     	jne	0x14594d7b5 <.text+0x594c7b5>
14594d7a0:     	addq	0x88(%rsp), %rdx
14594d7a8:     	movq	0x18(%rdx), %rdx
14594d7ac:     	xorl	%eax, %eax
14594d7ae:     	cmpb	$0x0, 0x39(%rdx)
14594d7b2:     	setne	%al
14594d7b5:     	addq	%rax, %r14
14594d7b8:     	testq	%r14, %r14
14594d7bb:     	js	0x14594d883 <.text+0x594c883>
14594d7c1:     	cvtsi2ss	%r14, %xmm14
14594d7c6:     	jmp	0x14594d89a <.text+0x594c89a>
14594d7cb:     	movq	0xd0(%rsp), %r10
14594d7d3:     	xorl	%edx, %edx
14594d7d5:     	xorl	%r14d, %r14d
14594d7d8:     	jmp	0x14594d7f7 <.text+0x594c7f7>
14594d7da:     	nopw	(%rax,%rax)
14594d7e0:     	xorl	%eax, %eax
14594d7e2:     	addq	%r8, %r14
14594d7e5:     	addq	%rax, %r14
14594d7e8:     	addq	$0xf0, %r10
14594d7ef:     	incq	%rdx
14594d7f2:     	cmpq	%rdi, %rdx
14594d7f5:     	je	0x14594d85e <.text+0x594c85e>
14594d7f7:     	movq	%rdx, %rbp
14594d7fa:     	cmpq	%rdx, %rsi
14594d7fd:     	je	0x14594d850 <.text+0x594c850>
14594d7ff:     	movl	$0x0, %r8d
14594d805:     	cmpq	%r15, -0x78(%r10)
14594d809:     	jne	0x14594d81d <.text+0x594c81d>
14594d80b:     	movq	-0x88(%r10), %rax
14594d812:     	xorl	%r8d, %r8d
14594d815:     	cmpb	$0x0, 0x39(%rax)
14594d819:     	setne	%r8b
14594d81d:     	leaq	0x1(%rbp), %rdx
14594d821:     	cmpq	%rsi, %rdx
14594d824:     	je	0x14594d7e0 <.text+0x594c7e0>
14594d826:     	movl	$0x0, %eax
14594d82b:     	cmpq	%r15, (%r10)
14594d82e:     	jne	0x14594d7e2 <.text+0x594c7e2>
14594d830:     	movq	-0x10(%r10), %r12
14594d834:     	xorl	%eax, %eax
14594d836:     	cmpb	$0x0, 0x39(%r12)
14594d83c:     	setne	%al
14594d83f:     	jmp	0x14594d7e2 <.text+0x594c7e2>
14594d841:     	nopw	%cs:(%rax,%rax)
14594d850:     	xorl	%r8d, %r8d
14594d853:     	leaq	0x1(%rbp), %rdx
14594d857:     	cmpq	%rsi, %rdx
14594d85a:     	jne	0x14594d826 <.text+0x594c826>
14594d85c:     	jmp	0x14594d7e0 <.text+0x594c7e0>
14594d85e:     	testb	$0x1, 0x70(%rsp)
14594d863:     	jne	0x14594d9e8 <.text+0x594c9e8>
14594d869:     	movq	0x60(%rsp), %r8
14594d86e:     	movq	0x80(%rsp), %r10
14594d876:     	movl	0x44(%rsp), %ebp
14594d87a:     	testq	%r14, %r14
14594d87d:     	jns	0x14594d7c1 <.text+0x594c7c1>
14594d883:     	movq	%r14, %rax
14594d886:     	shrq	%rax
14594d889:     	andl	$0x1, %r14d
14594d88d:     	orq	%rax, %r14
14594d890:     	cvtsi2ss	%r14, %xmm14
14594d895:     	addss	%xmm14, %xmm14
14594d89a:     	movss	0x423399(%rip), %xmm10  # 0x145d70c3c
14594d8a3:     	divss	%xmm9, %xmm10
14594d8a8:     	movaps	%xmm13, %xmm9
14594d8ac:     	subps	%xmm8, %xmm9
14594d8b0:     	mulps	%xmm9, %xmm9
14594d8b4:     	movshdup	%xmm9, %xmm7            # xmm7 = xmm9[1,1,3,3]
14594d8b9:     	addss	%xmm9, %xmm7
14594d8be:     	sqrtss	%xmm7, %xmm7
14594d8c2:     	mulss	0x94(%rsp), %xmm7
14594d8cb:     	subss	%xmm7, %xmm10
14594d8d0:     	addss	%xmm12, %xmm10
14594d8d5:     	mulss	0x152ac82(%rip), %xmm14 # 0x146e78560
14594d8de:     	divss	%xmm11, %xmm14
14594d8e3:     	addss	%xmm10, %xmm14
14594d8e8:     	movzbl	0x39(%r8), %eax
14594d8ed:     	leaq	0x152de60(%rip), %rdx   # 0x146e7b754
14594d8f4:     	movslq	(%rdx,%rax,4), %rax
14594d8f8:     	addq	%rdx, %rax
14594d8fb:     	movq	0x68(%rsp), %r14
14594d900:     	jmpq	*%rax
14594d902:     	movq	0x58(%rsp), %r13
14594d907:     	testq	%r13, %r13
14594d90a:     	je	0x14594dc6a <.text+0x594cc6a>
14594d910:     	leaq	0x128(%r9), %rdx
14594d917:     	xorl	%r14d, %r14d
14594d91a:     	movaps	%xmm2, %xmm15
14594d91e:     	jmp	0x14594d935 <.text+0x594c935>
14594d920:     	xorl	%eax, %eax
14594d922:     	addq	%rax, %r14
14594d925:     	addq	$0x160, %rdx            # imm = 0x160
14594d92c:     	decq	%r13
14594d92f:     	je	0x14594d9c3 <.text+0x594c9c3>
14594d935:     	cmpb	$0x0, -0xc0(%rdx)
14594d93c:     	jne	0x14594d920 <.text+0x594c920>
14594d93e:     	movss	(%rdx), %xmm9
14594d943:     	ucomiss	%xmm9, %xmm3
14594d947:     	jae	0x14594d986 <.text+0x594c986>
14594d949:     	movaps	%xmm6, %xmm7
14594d94c:     	subss	-0x4(%rdx), %xmm7
14594d951:     	divss	%xmm9, %xmm7
14594d956:     	xorps	%xmm9, %xmm9
14594d95a:     	maxss	%xmm7, %xmm9
14594d95f:     	movaps	%xmm1, %xmm7
14594d962:     	minss	%xmm9, %xmm7
14594d967:     	movsd	-0x1c(%rdx), %xmm10
14594d96d:     	movsd	-0x10(%rdx), %xmm11
14594d973:     	subps	%xmm10, %xmm11
14594d977:     	movsldup	%xmm7, %xmm9            # xmm9 = xmm7[0,0,2,2]
14594d97c:     	mulps	%xmm11, %xmm9
14594d980:     	addps	%xmm10, %xmm9
14594d984:     	jmp	0x14594d98c <.text+0x594c98c>
14594d986:     	movsd	-0x10(%rdx), %xmm9
14594d98c:     	subps	%xmm13, %xmm9
14594d990:     	mulps	%xmm9, %xmm9
14594d994:     	movshdup	%xmm9, %xmm7            # xmm7 = xmm9[1,1,3,3]
14594d999:     	addss	%xmm9, %xmm7
14594d99e:     	sqrtss	%xmm7, %xmm7
14594d9a2:     	ucomiss	%xmm7, %xmm4
14594d9a5:     	jb	0x14594d920 <.text+0x594c920>
14594d9ab:     	movl	$0x1, %eax
14594d9b0:     	addq	%rax, %r14
14594d9b3:     	addq	$0x160, %rdx            # imm = 0x160
14594d9ba:     	decq	%r13
14594d9bd:     	jne	0x14594d935 <.text+0x594c935>
14594d9c3:     	testq	%r14, %r14
14594d9c6:     	movq	0x30(%rsp), %r8
14594d9cb:     	js	0x14594dc7f <.text+0x594cc7f>
14594d9d1:     	xorps	%xmm9, %xmm9
14594d9d5:     	cvtsi2ss	%r14, %xmm9
14594d9da:     	mulss	0x41fd65(%rip), %xmm9   # 0x145d6d748
14594d9e3:     	jmp	0x14594dcf3 <.text+0x594ccf3>
14594d9e8:     	addq	$0x2, %rbp
14594d9ec:     	cmpq	%rsi, %rbp
14594d9ef:     	jne	0x14594d777 <.text+0x594c777>
14594d9f5:     	xorl	%eax, %eax
14594d9f7:     	movq	0x60(%rsp), %r8
14594d9fc:     	movq	0x80(%rsp), %r10
14594da04:     	movl	0x44(%rsp), %ebp
14594da08:     	addq	%rax, %r14
14594da0b:     	testq	%r14, %r14
14594da0e:     	js	0x14594d883 <.text+0x594c883>
14594da14:     	jmp	0x14594d7c1 <.text+0x594c7c1>
14594da19:     	movss	0x42321b(%rip), %xmm7   # 0x145d70c3c
14594da21:     	divss	%xmm7, %xmm15
14594da26:     	addss	%xmm1, %xmm15
14594da2b:     	divss	%xmm15, %xmm7
14594da30:     	addss	%xmm7, %xmm14
14594da35:     	jmp	0x14594dc23 <.text+0x594cc23>
14594da3a:     	movq	-0x158(%r9,%r13), %rdx
14594da42:     	movq	-0x150(%r9,%r13), %rax
14594da4a:     	shlq	$0x4, %rax
14594da4e:     	leaq	(%rax,%rax,2), %r8
14594da52:     	movaps	%xmm2, %xmm15
14594da56:     	nopw	%cs:(%rax,%rax)
14594da60:     	testq	%r8, %r8
14594da63:     	je	0x14594dca5 <.text+0x594cca5>
14594da69:     	addq	$-0x30, %r8
14594da6d:     	cmpl	$0x15c, 0x10(%rdx)      # imm = 0x15C
14594da74:     	leaq	0x30(%rdx), %rdx
14594da78:     	jne	0x14594da60 <.text+0x594ca60>
14594da7a:     	jmp	0x14594dc27 <.text+0x594cc27>
14594da7f:     	movss	-0x70(%r9,%r13), %xmm7
14594da86:     	movss	-0x6c(%r9,%r13), %xmm9
14594da8d:     	maxss	%xmm1, %xmm9
14594da92:     	divss	%xmm9, %xmm7
14594da97:     	movaps	%xmm1, %xmm9
14594da9b:     	subss	%xmm7, %xmm9
14594daa0:     	mulss	0x44d3f3(%rip), %xmm9   # 0x145d9ae9c
14594daa9:     	addss	%xmm9, %xmm12
14594daae:     	addss	%xmm12, %xmm14
14594dab3:     	movq	-0x158(%r9,%r13), %rdx
14594dabb:     	movq	-0x150(%r9,%r13), %rax
14594dac3:     	shlq	$0x4, %rax
14594dac7:     	leaq	(%rax,%rax,2), %r8
14594dacb:     	movaps	%xmm2, %xmm15
14594dacf:     	nop
14594dad0:     	testq	%r8, %r8
14594dad3:     	je	0x14594dc27 <.text+0x594cc27>
14594dad9:     	addq	$-0x30, %r8
14594dadd:     	cmpl	$0x3d4, 0x10(%rdx)      # imm = 0x3D4
14594dae4:     	leaq	0x30(%rdx), %rdx
14594dae8:     	jne	0x14594dad0 <.text+0x594cad0>
14594daea:     	addss	0x44d3a9(%rip), %xmm14  # 0x145d9ae9c
14594daf3:     	jmp	0x14594dc27 <.text+0x594cc27>
14594daf8:     	movq	0x58(%rsp), %r8
14594dafd:     	testq	%r8, %r8
14594db00:     	je	0x14594dcb3 <.text+0x594ccb3>
14594db06:     	xorl	%r13d, %r13d
14594db09:     	xorl	%r14d, %r14d
14594db0c:     	movaps	%xmm2, %xmm15
14594db10:     	jmp	0x14594db31 <.text+0x594cb31>
14594db12:     	nopw	%cs:(%rax,%rax)
14594db20:     	xorl	%eax, %eax
14594db22:     	addq	%rax, %r14
14594db25:     	incq	%r13
14594db28:     	cmpq	%r8, %r13
14594db2b:     	je	0x14594dcba <.text+0x594ccba>
14594db31:     	imulq	$0x160, %r13, %rdx      # imm = 0x160
14594db38:     	cmpb	$0x0, 0x68(%r9,%rdx)
14594db3e:     	jne	0x14594db20 <.text+0x594cb20>
14594db40:     	addq	%r9, %rdx
14594db43:     	movss	0x128(%rdx), %xmm9
14594db4c:     	ucomiss	%xmm9, %xmm3
14594db50:     	jae	0x14594db98 <.text+0x594cb98>
14594db52:     	movaps	%xmm6, %xmm7
14594db55:     	subss	0x124(%rdx), %xmm7
14594db5d:     	divss	%xmm9, %xmm7
14594db62:     	xorps	%xmm9, %xmm9
14594db66:     	maxss	%xmm7, %xmm9
14594db6b:     	movaps	%xmm1, %xmm7
14594db6e:     	minss	%xmm9, %xmm7
14594db73:     	movsd	0x10c(%rdx), %xmm10
14594db7c:     	movsd	0x118(%rdx), %xmm11
14594db85:     	subps	%xmm10, %xmm11
14594db89:     	movsldup	%xmm7, %xmm9            # xmm9 = xmm7[0,0,2,2]
14594db8e:     	mulps	%xmm11, %xmm9
14594db92:     	addps	%xmm10, %xmm9
14594db96:     	jmp	0x14594dba1 <.text+0x594cba1>
14594db98:     	movsd	0x118(%rdx), %xmm9
14594dba1:     	subps	%xmm13, %xmm9
14594dba5:     	mulps	%xmm9, %xmm9
14594dba9:     	movshdup	%xmm9, %xmm7            # xmm7 = xmm9[1,1,3,3]
14594dbae:     	addss	%xmm9, %xmm7
14594dbb3:     	sqrtss	%xmm7, %xmm7
14594dbb7:     	movss	0x41fa01(%rip), %xmm2   # 0x145d6d5c0
14594dbbf:     	ucomiss	%xmm7, %xmm2
14594dbc2:     	jb	0x14594db20 <.text+0x594cb20>
14594dbc8:     	movq	0x8(%rdx), %r8
14594dbcc:     	movq	0x10(%rdx), %rax
14594dbd0:     	shlq	$0x4, %rax
14594dbd4:     	leaq	(%rax,%rax,2), %rax
14594dbd8:     	nopl	(%rax,%rax)
14594dbe0:     	testq	%rax, %rax
14594dbe3:     	je	0x14594dbfe <.text+0x594cbfe>
14594dbe5:     	addq	$-0x30, %rax
14594dbe9:     	cmpl	$0xac, 0x10(%r8)
14594dbf1:     	leaq	0x30(%r8), %r8
14594dbf5:     	jne	0x14594dbe0 <.text+0x594cbe0>
14594dbf7:     	movl	$0x1, %eax
14594dbfc:     	jmp	0x14594dc00 <.text+0x594cc00>
14594dbfe:     	xorl	%eax, %eax
14594dc00:     	movq	0x58(%rsp), %r8
14594dc05:     	addq	%rax, %r14
14594dc08:     	incq	%r13
14594dc0b:     	cmpq	%r8, %r13
14594dc0e:     	jne	0x14594db31 <.text+0x594cb31>
14594dc14:     	jmp	0x14594dcba <.text+0x594ccba>
14594dc19:     	addss	%xmm12, %xmm12
14594dc1e:     	addss	%xmm12, %xmm14
14594dc23:     	movaps	%xmm2, %xmm15
14594dc27:     	movq	0x30(%rsp), %r8
14594dc2c:     	movaps	%xmm14, %xmm9
14594dc30:     	addss	%xmm1, %xmm9
14594dc35:     	cmpq	%r10, %r15
14594dc38:     	je	0x14594dc3e <.text+0x594cc3e>
14594dc3a:     	movaps	%xmm14, %xmm9
14594dc3e:     	ucomiss	%xmm5, %xmm9
14594dc42:     	setbe	%al
14594dc45:     	testb	%al, 0x38(%rsp)
14594dc49:     	movq	0xb0(%rsp), %r10
14594dc51:     	jne	0x14594d4aa <.text+0x594c4aa>
14594dc57:     	movaps	%xmm9, %xmm5
14594dc5b:     	jmp	0x14594d4aa <.text+0x594c4aa>
14594dc60:     	movq	0x68(%rsp), %r14
14594dc65:     	jmp	0x14594d4c0 <.text+0x594c4c0>
14594dc6a:     	xorl	%r14d, %r14d
14594dc6d:     	movaps	%xmm2, %xmm15
14594dc71:     	testq	%r14, %r14
14594dc74:     	movq	0x30(%rsp), %r8
14594dc79:     	jns	0x14594d9d1 <.text+0x594c9d1>
14594dc7f:     	movq	%r14, %rax
14594dc82:     	shrq	%rax
14594dc85:     	andl	$0x1, %r14d
14594dc89:     	orq	%rax, %r14
14594dc8c:     	xorps	%xmm9, %xmm9
14594dc90:     	cvtsi2ss	%r14, %xmm9
14594dc95:     	addss	%xmm9, %xmm9
14594dc9a:     	mulss	0x41faa5(%rip), %xmm9   # 0x145d6d748
14594dca3:     	jmp	0x14594dcf3 <.text+0x594ccf3>
14594dca5:     	addss	0x422f8a(%rip), %xmm14  # 0x145d70c38
14594dcae:     	jmp	0x14594dc27 <.text+0x594cc27>
14594dcb3:     	xorl	%r14d, %r14d
14594dcb6:     	movaps	%xmm2, %xmm15
14594dcba:     	testq	%r14, %r14
14594dcbd:     	movq	0x30(%rsp), %r8
14594dcc2:     	js	0x14594dccf <.text+0x594cccf>
14594dcc4:     	xorps	%xmm9, %xmm9
14594dcc8:     	cvtsi2ss	%r14, %xmm9
14594dccd:     	jmp	0x14594dcea <.text+0x594ccea>
14594dccf:     	movq	%r14, %rax
14594dcd2:     	shrq	%rax
14594dcd5:     	andl	$0x1, %r14d
14594dcd9:     	orq	%rax, %r14
14594dcdc:     	xorps	%xmm9, %xmm9
14594dce0:     	cvtsi2ss	%r14, %xmm9
14594dce5:     	addss	%xmm9, %xmm9
14594dcea:     	mulss	0x44d219(%rip), %xmm9   # 0x145d9af0c
14594dcf3:     	addss	%xmm9, %xmm14
14594dcf8:     	movq	0x68(%rsp), %r14
14594dcfd:     	movaps	%xmm14, %xmm9
14594dd01:     	addss	%xmm1, %xmm9
14594dd06:     	cmpq	%r10, %r15
14594dd09:     	jne	0x14594dc3a <.text+0x594cc3a>
14594dd0f:     	jmp	0x14594dc3e <.text+0x594cc3e>
14594dd14:     	movq	0xc8(%rsp), %rdx
14594dd1c:     	testq	%rdx, %rdx
14594dd1f:     	je	0x14594dd67 <.text+0x594cd67>
14594dd21:     	shlq	$0x3, %rdx
14594dd25:     	movl	$0x8, %r8d
14594dd2b:     	movq	0xc0(%rsp), %rcx
14594dd33:     	callq	0x1400021d0 <.text+0x11d0>
14594dd38:     	jmp	0x14594dd67 <.text+0x594cd67>
14594dd3a:     	movq	0x98(%rsp), %rdx
14594dd42:     	testq	%rdx, %rdx
14594dd45:     	je	0x14594dd5e <.text+0x594cd5e>
14594dd47:     	movq	0xa0(%rsp), %rcx
14594dd4f:     	shlq	$0x3, %rdx
14594dd53:     	movl	$0x8, %r8d
14594dd59:     	callq	0x1400021d0 <.text+0x11d0>
14594dd5e:     	movq	$0x0, 0x38(%rsp)
14594dd67:     	movq	0x38(%rsp), %rax
14594dd6c:     	movq	%rbx, %rdx
14594dd6f:     	movaps	0xe0(%rsp), %xmm6
14594dd77:     	movaps	0xf0(%rsp), %xmm7
14594dd7f:     	movaps	0x100(%rsp), %xmm8
14594dd88:     	movaps	0x110(%rsp), %xmm9
14594dd91:     	movaps	0x120(%rsp), %xmm10
14594dd9a:     	movaps	0x130(%rsp), %xmm11
14594dda3:     	movaps	0x140(%rsp), %xmm12
14594ddac:     	movaps	0x150(%rsp), %xmm13
14594ddb5:     	movaps	0x160(%rsp), %xmm14
14594ddbe:     	movaps	0x170(%rsp), %xmm15
14594ddc7:     	addq	$0x188, %rsp            # imm = 0x188
14594ddce:     	popq	%rbx
14594ddcf:     	popq	%rbp
14594ddd0:     	popq	%rdi
14594ddd1:     	popq	%rsi
14594ddd2:     	popq	%r12
14594ddd4:     	popq	%r13
14594ddd6:     	popq	%r14
14594ddd8:     	popq	%r15
14594ddda:     	retq
14594dddb:     	movsd	-0x48(%rdx,%rax), %xmm0
14594dde1:     	subps	%xmm15, %xmm0
14594dde5:     	mulps	%xmm0, %xmm0
14594dde8:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14594ddec:     	addss	%xmm0, %xmm1
14594ddf0:     	xorps	%xmm0, %xmm0
14594ddf3:     	sqrtss	%xmm1, %xmm0
14594ddf7:     	movl	$0x1, %eax
14594ddfc:     	movq	%rax, 0x38(%rsp)
14594de01:     	movss	0x450017(%rip), %xmm1   # 0x145d9de20
14594de09:     	ucomiss	%xmm0, %xmm1
14594de0c:     	jae	0x14594dd67 <.text+0x594cd67>
14594de12:     	xorl	%eax, %eax
14594de14:     	xorps	%xmm2, %xmm2
14594de17:     	movss	0x41f54d(%rip), %xmm0   # 0x145d6d36c
14594de1f:     	movss	0x44fff9(%rip), %xmm1   # 0x145d9de20
14594de27:     	jmp	0x14594de6f <.text+0x594ce6f>
14594de29:     	movsd	0x118(%rdx,%rax), %xmm3
14594de32:     	subps	%xmm15, %xmm3
14594de36:     	mulps	%xmm3, %xmm3
14594de39:     	movshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
14594de3d:     	addss	%xmm3, %xmm4
14594de41:     	xorps	%xmm3, %xmm3
14594de44:     	sqrtss	%xmm4, %xmm3
14594de48:     	ucomiss	%xmm3, %xmm1
14594de4b:     	jae	0x14594dee5 <.text+0x594cee5>
14594de51:     	nopw	%cs:(%rax,%rax)
14594de60:     	addq	$0x160, %rax            # imm = 0x160
14594de66:     	cmpq	%rax, %rcx
14594de69:     	je	0x14594d331 <.text+0x594c331>
14594de6f:     	cmpb	$0x0, 0x68(%rdx,%rax)
14594de74:     	jne	0x14594de60 <.text+0x594ce60>
14594de76:     	cmpq	$-0x1, 0x18(%rdx,%rax)
14594de7c:     	jne	0x14594de88 <.text+0x594ce88>
14594de7e:     	cmpb	$0x0, 0x15c(%rdx,%rax)
14594de86:     	je	0x14594de60 <.text+0x594ce60>
14594de88:     	ucomiss	0x140(%rdx,%rax), %xmm6
14594de90:     	jb	0x14594de60 <.text+0x594ce60>
14594de92:     	movss	0x128(%rdx,%rax), %xmm3
14594de9b:     	ucomiss	%xmm3, %xmm2
14594de9e:     	jae	0x14594de29 <.text+0x594ce29>
14594dea0:     	movaps	%xmm6, %xmm4
14594dea3:     	subss	0x124(%rdx,%rax), %xmm4
14594deac:     	divss	%xmm3, %xmm4
14594deb0:     	xorps	%xmm3, %xmm3
14594deb3:     	maxss	%xmm4, %xmm3
14594deb7:     	movaps	%xmm0, %xmm4
14594deba:     	minss	%xmm3, %xmm4
14594debe:     	movsd	0x10c(%rdx,%rax), %xmm5
14594dec7:     	movsd	0x118(%rdx,%rax), %xmm10
14594ded1:     	subps	%xmm5, %xmm10
14594ded5:     	movsldup	%xmm4, %xmm3            # xmm3 = xmm4[0,0,2,2]
14594ded9:     	mulps	%xmm10, %xmm3
14594dedd:     	addps	%xmm5, %xmm3
14594dee0:     	jmp	0x14594de32 <.text+0x594ce32>
14594dee5:     	leaq	-0x160(%rcx), %r9
14594deec:     	leaq	(%rdx,%rax), %r8
14594def0:     	cmpq	%rax, %r9
14594def3:     	je	0x14594e060 <.text+0x594d060>
14594def9:     	subq	%rax, %rcx
14594defc:     	addq	$-0x160, %rcx           # imm = 0xFEA0
14594df03:     	leaq	(%rdx,%rax), %r9
14594df07:     	addq	$0x160, %r9             # imm = 0x160
14594df0e:     	movabsq	$0x2e8ba2e8ba2e8ba3, %rdx # imm = 0x2E8BA2E8BA2E8BA3
14594df18:     	movq	%rcx, %rax
14594df1b:     	mulq	%rdx
14594df1e:     	shrq	$0x6, %rdx
14594df22:     	xorps	%xmm2, %xmm2
14594df25:     	movaps	0x422d74(%rip), %xmm3   # 0x145d70ca0
14594df2c:     	jmp	0x14594df50 <.text+0x594cf50>
14594df2e:     	movq	%rax, %r8
14594df31:     	nopw	%cs:(%rax,%rax)
14594df40:     	addq	$0x160, %r9             # imm = 0x160
14594df47:     	decq	%rdx
14594df4a:     	je	0x14594e060 <.text+0x594d060>
14594df50:     	cmpb	$0x0, 0x68(%r9)
14594df55:     	jne	0x14594df40 <.text+0x594cf40>
14594df57:     	cmpq	$-0x1, 0x18(%r9)
14594df5c:     	jne	0x14594df68 <.text+0x594cf68>
14594df5e:     	cmpb	$0x0, 0x15c(%r9)
14594df66:     	je	0x14594df40 <.text+0x594cf40>
14594df68:     	ucomiss	0x140(%r9), %xmm6
14594df70:     	jb	0x14594df40 <.text+0x594cf40>
14594df72:     	movss	0x128(%r9), %xmm4
14594df7b:     	ucomiss	%xmm4, %xmm2
14594df7e:     	jae	0x14594dfc2 <.text+0x594cfc2>
14594df80:     	movaps	%xmm6, %xmm5
14594df83:     	subss	0x124(%r9), %xmm5
14594df8c:     	divss	%xmm4, %xmm5
14594df90:     	xorps	%xmm4, %xmm4
14594df93:     	maxss	%xmm5, %xmm4
14594df97:     	movaps	%xmm0, %xmm5
14594df9a:     	minss	%xmm4, %xmm5
14594df9e:     	movsd	0x10c(%r9), %xmm8
14594dfa7:     	movsd	0x118(%r9), %xmm9
14594dfb0:     	subps	%xmm8, %xmm9
14594dfb4:     	movsldup	%xmm5, %xmm4            # xmm4 = xmm5[0,0,2,2]
14594dfb8:     	mulps	%xmm9, %xmm4
14594dfbc:     	addps	%xmm8, %xmm4
14594dfc0:     	jmp	0x14594dfcb <.text+0x594cfcb>
14594dfc2:     	movsd	0x118(%r9), %xmm4
14594dfcb:     	subps	%xmm15, %xmm4
14594dfcf:     	mulps	%xmm4, %xmm4
14594dfd2:     	movshdup	%xmm4, %xmm5            # xmm5 = xmm4[1,1,3,3]
14594dfd6:     	addss	%xmm4, %xmm5
14594dfda:     	xorps	%xmm4, %xmm4
14594dfdd:     	sqrtss	%xmm5, %xmm4
14594dfe1:     	ucomiss	%xmm4, %xmm1
14594dfe4:     	jb	0x14594df40 <.text+0x594cf40>
14594dfea:     	movsd	0xf0(%r8), %xmm4
14594dff3:     	movsd	0xf0(%r9), %xmm5
14594dffc:     	movaps	%xmm5, %xmm8
14594e000:     	shufps	$0x11, %xmm4, %xmm8     # xmm8 = xmm8[1,0],xmm4[1,0]
14594e005:     	shufps	$0xe2, %xmm4, %xmm8     # xmm8 = xmm8[2,0],xmm4[2,3]
14594e00a:     	movaps	%xmm8, %xmm9
14594e00e:     	maxps	%xmm3, %xmm9
14594e012:     	movaps	%xmm9, %xmm10
14594e016:     	cmpunordps	%xmm9, %xmm10
14594e01b:     	andps	%xmm10, %xmm8
14594e01f:     	andnps	%xmm9, %xmm10
14594e023:     	orps	%xmm8, %xmm10
14594e027:     	unpcklps	%xmm5, %xmm4            # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
14594e02a:     	divps	%xmm10, %xmm4
14594e02e:     	movaps	%xmm4, %xmm5
14594e031:     	psrad	$0x1f, %xmm5
14594e036:     	psrld	$0x1, %xmm5
14594e03b:     	pxor	%xmm4, %xmm5
14594e03f:     	pshufd	$0x55, %xmm5, %xmm4     # xmm4 = xmm5[1,1,1,1]
14594e044:     	pcmpgtd	%xmm4, %xmm5
14594e048:     	movd	%xmm5, %ecx
14594e04c:     	movq	%r9, %rax
14594e04f:     	testb	$0x1, %cl
14594e052:     	jne	0x14594df2e <.text+0x594cf2e>
14594e058:     	movq	%r8, %rax
14594e05b:     	jmp	0x14594df2e <.text+0x594cf2e>
14594e060:     	movq	0x88(%r8), %rbx
14594e067:     	movl	$0x1, %eax
14594e06c:     	movq	%rax, 0x38(%rsp)
14594e071:     	jmp	0x14594dd67 <.text+0x594cd67>
14594e076:     	movq	%rcx, %r9
14594e079:     	jmp	0x14594e086 <.text+0x594d086>
14594e07b:     	xorl	%ebp, %ebp
14594e07d:     	cmpq	%rax, %r9
14594e080:     	je	0x14594d2fd <.text+0x594c2fd>
14594e086:     	movq	(%r9), %rbx
14594e089:     	addq	$0x8, %r9
14594e08d:     	xorl	%r10d, %r10d
14594e090:     	jmp	0x14594e0ac <.text+0x594d0ac>
14594e092:     	nopw	%cs:(%rax,%rax)
14594e0a0:     	addq	$0x160, %r10            # imm = 0x160
14594e0a7:     	cmpq	%r10, %r8
14594e0aa:     	je	0x14594e07b <.text+0x594d07b>
14594e0ac:     	cmpq	%rbx, 0x88(%rdx,%r10)
14594e0b4:     	jne	0x14594e0a0 <.text+0x594d0a0>
14594e0b6:     	cmpl	$0x0, 0x68(%rdx,%r10)
14594e0bc:     	jne	0x14594e0a0 <.text+0x594d0a0>
14594e0be:     	cmpb	$0x0, 0x15c(%rdx,%r10)
14594e0c7:     	je	0x14594e0a0 <.text+0x594d0a0>
14594e0c9:     	jmp	0x14594d2f6 <.text+0x594c2f6>
14594e0ce:     	leaq	0x152c853(%rip), %r8    # 0x146e7a928
14594e0d5:     	movq	%rsi, %rcx
14594e0d8:     	movq	0x70(%rsp), %rdx
14594e0dd:     	callq	0x145d697e3 <.text+0x5d687e3>
14594e0e2:     	ud2

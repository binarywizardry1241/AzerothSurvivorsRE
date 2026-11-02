
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14012cde0:     	pushq	%rbp
14012cde1:     	pushq	%r15
14012cde3:     	pushq	%r14
14012cde5:     	pushq	%r13
14012cde7:     	pushq	%r12
14012cde9:     	pushq	%rsi
14012cdea:     	pushq	%rdi
14012cdeb:     	pushq	%rbx
14012cdec:     	subq	$0x548, %rsp            # imm = 0x548
14012cdf3:     	leaq	0x80(%rsp), %rbp
14012cdfb:     	movaps	%xmm15, 0x4b0(%rbp)
14012ce03:     	movaps	%xmm14, 0x4a0(%rbp)
14012ce0b:     	movaps	%xmm13, 0x490(%rbp)
14012ce13:     	movaps	%xmm12, 0x480(%rbp)
14012ce1b:     	movaps	%xmm11, 0x470(%rbp)
14012ce23:     	movaps	%xmm10, 0x460(%rbp)
14012ce2b:     	movdqa	%xmm9, 0x450(%rbp)
14012ce34:     	movaps	%xmm8, 0x440(%rbp)
14012ce3c:     	movaps	%xmm7, 0x430(%rbp)
14012ce43:     	movaps	%xmm6, 0x420(%rbp)
14012ce4a:     	movq	$-0x2, 0x418(%rbp)
14012ce55:     	movq	%r9, 0x3c8(%rbp)
14012ce5c:     	movb	%dl, 0x417(%rbp)
14012ce62:     	imulq	$0x78, 0x38(%r8), %rax
14012ce67:     	movq	0x30(%r8), %rdi
14012ce6b:     	addq	%rdi, %rax
14012ce6e:     	movq	%rax, 0x3f8(%rbp)
14012ce75:     	movq	%rcx, 0x3d0(%rbp)
14012ce7c:     	leaq	0x8(%rcx), %rax
14012ce80:     	movq	%rax, 0x3d8(%rbp)
14012ce87:     	movl	$0x2, %eax
14012ce8c:     	movss	0x5c408bf(%rip), %xmm8  # 0x145d6d754
14012ce95:     	movss	0x5c408be(%rip), %xmm10 # 0x145d6d75c
14012ce9e:     	movss	0x5c7c09d(%rip), %xmm11 # 0x145da8f44
14012cea7:     	movss	0x5c408a8(%rip), %xmm12 # 0x145d6d758
14012ceb0:     	xorps	%xmm15, %xmm15
14012ceb4:     	movaps	0x5c40544(%rip), %xmm14 # 0x145d6d400
14012cebc:     	testq	%rax, %rax
14012cebf:     	je	0x14012cef1 <.text+0x12bef1>
14012cec1:     	nopw	%cs:(%rax,%rax)
14012ced0:     	cmpq	$0x2, %rax
14012ced4:     	je	0x14012cf03 <.text+0x12bf03>
14012ced6:     	movq	0x408(%rbp), %rdx
14012cedd:     	testq	%rdx, %rdx
14012cee0:     	jne	0x14012d0dc <.text+0x12c0dc>
14012cee6:     	movq	$0x0, 0x408(%rbp)
14012cef1:     	cmpq	$0x1, %rsi
14012cef5:     	jne	0x14012cf03 <.text+0x12bf03>
14012cef7:     	testq	%r8, %r8
14012cefa:     	jne	0x14012d148 <.text+0x12c148>
14012cf00:     	xorl	%r8d, %r8d
14012cf03:     	movl	$0x2, %eax
14012cf08:     	movq	%rax, 0x400(%rbp)
14012cf0f:     	cmpq	0x3f8(%rbp), %rdi
14012cf16:     	je	0x14012cf50 <.text+0x12bf50>
14012cf18:     	movq	%r8, %r15
14012cf1b:     	leaq	0x160(%rbp), %rcx
14012cf22:     	movq	%rdi, %rdx
14012cf25:     	callq	0x1458e0c50 <.text+0x58dfc50>
14012cf2a:     	movq	0x160(%rbp), %rax
14012cf31:     	cmpq	$0x2, %rax
14012cf35:     	jne	0x14012cf60 <.text+0x12bf60>
14012cf37:     	addq	$0x78, %rdi
14012cf3b:     	xorl	%eax, %eax
14012cf3d:     	movq	%r15, %r8
14012cf40:     	jmp	0x14012d1c0 <.text+0x12c1c0>
14012cf45:     	nopw	%cs:(%rax,%rax)
14012cf50:     	xorl	%eax, %eax
14012cf52:     	jmp	0x14012d1c0 <.text+0x12c1c0>
14012cf57:     	nopw	(%rax,%rax)
14012cf60:     	movq	0x168(%rbp), %rdx
14012cf67:     	movq	0x170(%rbp), %rcx
14012cf6e:     	movq	0x178(%rbp), %r8
14012cf75:     	movq	0x180(%rbp), %r10
14012cf7c:     	movq	0x188(%rbp), %r9
14012cf83:     	nopw	%cs:(%rax,%rax)
14012cf90:     	movq	%r9, %r14
14012cf93:     	movq	%r8, %rsi
14012cf96:     	movq	%rcx, %r12
14012cf99:     	movq	%rdi, %rbx
14012cf9c:     	cmpq	$0x1, %rax
14012cfa0:     	jne	0x14012cfe0 <.text+0x12bfe0>
14012cfa2:     	testq	%rdx, %rdx
14012cfa5:     	je	0x14012d033 <.text+0x12c033>
14012cfab:     	movq	%r10, %r15
14012cfae:     	movq	%rbx, %r13
14012cfb1:     	movzbl	0x417(%rbp), %ecx
14012cfb8:     	movq	%r12, %r8
14012cfbb:     	callq	0x1458e6190 <.text+0x58e5190>
14012cfc0:     	testq	%rdx, %rdx
14012cfc3:     	jne	0x14012d172 <.text+0x12c172>
14012cfc9:     	xorl	%edi, %edi
14012cfcb:     	movq	%r13, %rbx
14012cfce:     	movq	%r15, %r10
14012cfd1:     	cmpq	$0x1, %rsi
14012cfd5:     	movq	%rdi, 0x408(%rbp)
14012cfdc:     	je	0x14012cff0 <.text+0x12bff0>
14012cfde:     	jmp	0x14012d050 <.text+0x12c050>
14012cfe0:     	movq	%rdx, %rdi
14012cfe3:     	cmpq	$0x1, %rsi
14012cfe7:     	movq	%rdi, 0x408(%rbp)
14012cfee:     	jne	0x14012d050 <.text+0x12c050>
14012cff0:     	testq	%r10, %r10
14012cff3:     	je	0x14012d06e <.text+0x12c06e>
14012cff5:     	movq	%rbx, %r13
14012cff8:     	movzbl	0x417(%rbp), %ecx
14012cfff:     	movq	%r10, %rdx
14012d002:     	movq	%r14, %r8
14012d005:     	callq	0x1458e6190 <.text+0x58e5190>
14012d00a:     	testq	%rdx, %rdx
14012d00d:     	jne	0x14012d198 <.text+0x12c198>
14012d013:     	movq	%r12, %r15
14012d016:     	movq	%r14, %r12
14012d019:     	movq	%rsi, %r14
14012d01c:     	xorl	%esi, %esi
14012d01e:     	movq	%r13, %rbx
14012d021:     	leaq	0x78(%rbx), %rdi
14012d025:     	cmpq	0x3f8(%rbp), %rdi
14012d02c:     	jne	0x14012d090 <.text+0x12c090>
14012d02e:     	jmp	0x14012d131 <.text+0x12c131>
14012d033:     	xorl	%edi, %edi
14012d035:     	cmpq	$0x1, %rsi
14012d039:     	movq	%rdi, 0x408(%rbp)
14012d040:     	je	0x14012cff0 <.text+0x12bff0>
14012d042:     	nopw	%cs:(%rax,%rax)
14012d050:     	movq	%r12, %r15
14012d053:     	movq	%r14, %r12
14012d056:     	movq	%rsi, %r14
14012d059:     	movq	%r10, %rsi
14012d05c:     	leaq	0x78(%rbx), %rdi
14012d060:     	cmpq	0x3f8(%rbp), %rdi
14012d067:     	jne	0x14012d090 <.text+0x12c090>
14012d069:     	jmp	0x14012d131 <.text+0x12c131>
14012d06e:     	movq	%r12, %r15
14012d071:     	movq	%r14, %r12
14012d074:     	movq	%rsi, %r14
14012d077:     	xorl	%esi, %esi
14012d079:     	leaq	0x78(%rbx), %rdi
14012d07d:     	cmpq	0x3f8(%rbp), %rdi
14012d084:     	je	0x14012d131 <.text+0x12c131>
14012d08a:     	nopw	(%rax,%rax)
14012d090:     	leaq	0x160(%rbp), %rcx
14012d097:     	movq	%rdi, %rdx
14012d09a:     	callq	0x1458e0c50 <.text+0x58dfc50>
14012d09f:     	movq	0x160(%rbp), %rax
14012d0a6:     	movq	0x168(%rbp), %rdx
14012d0ad:     	movq	0x170(%rbp), %rcx
14012d0b4:     	movq	0x178(%rbp), %r8
14012d0bb:     	movq	0x180(%rbp), %r10
14012d0c2:     	movq	0x188(%rbp), %r9
14012d0c9:     	cmpq	$0x2, %rax
14012d0cd:     	jne	0x14012cf90 <.text+0x12bf90>
14012d0d3:     	movq	%rbx, %r13
14012d0d6:     	addq	$0x78, %rdi
14012d0da:     	jmp	0x14012d138 <.text+0x12c138>
14012d0dc:     	movq	%r8, %r15
14012d0df:     	movzbl	0x417(%rbp), %ecx
14012d0e6:     	movq	%r12, %r8
14012d0e9:     	callq	0x1458e6190 <.text+0x58e5190>
14012d0ee:     	testq	%rdx, %rdx
14012d0f1:     	je	0x14012d729 <.text+0x12c729>
14012d0f7:     	movl	$0x0, %eax
14012d0fc:     	movq	%rax, 0x408(%rbp)
14012d103:     	testq	%r13, %r13
14012d106:     	movq	%r15, %r8
14012d109:     	je	0x14012cef1 <.text+0x12bef1>
14012d10f:     	movq	%rdx, %rbx
14012d112:     	movl	$0x1, %eax
14012d117:     	movq	%rax, 0x400(%rbp)
14012d11e:     	movq	$0x0, 0x408(%rbp)
14012d129:     	movq	%r13, %rax
14012d12c:     	jmp	0x14012d1c0 <.text+0x12c1c0>
14012d131:     	movq	%rbx, %r13
14012d134:     	leaq	0x78(%rbx), %rdi
14012d138:     	movq	%rsi, %r8
14012d13b:     	xorl	%eax, %eax
14012d13d:     	movq	%r14, %rsi
14012d140:     	movq	%r12, %r14
14012d143:     	movq	%r15, %r12
14012d146:     	jmp	0x14012d1c0 <.text+0x12c1c0>
14012d148:     	movzbl	0x417(%rbp), %ecx
14012d14f:     	movq	%r8, %rdx
14012d152:     	movq	%r14, %r8
14012d155:     	callq	0x1458e6190 <.text+0x58e5190>
14012d15a:     	movq	%r13, %rax
14012d15d:     	testq	%rdx, %rdx
14012d160:     	cmoveq	%rdx, %rax
14012d164:     	testq	%rax, %rax
14012d167:     	je	0x14012cf00 <.text+0x12bf00>
14012d16d:     	movq	%rdx, %rbx
14012d170:     	jmp	0x14012d1a2 <.text+0x12c1a2>
14012d172:     	movq	%rdx, %rbx
14012d175:     	leaq	0x78(%r13), %rdi
14012d179:     	movl	$0x1, %eax
14012d17e:     	movq	%rax, 0x400(%rbp)
14012d185:     	movq	$0x0, 0x408(%rbp)
14012d190:     	movq	%r13, %rax
14012d193:     	movq	%r15, %r8
14012d196:     	jmp	0x14012d1c0 <.text+0x12c1c0>
14012d198:     	movq	%rdx, %rbx
14012d19b:     	movq	%r13, %rax
14012d19e:     	leaq	0x78(%r13), %rdi
14012d1a2:     	movl	$0x1, %esi
14012d1a7:     	xorl	%r8d, %r8d
14012d1aa:     	movq	$0x0, 0x400(%rbp)
14012d1b5:     	nopw	%cs:(%rax,%rax)
14012d1c0:     	testq	%rax, %rax
14012d1c3:     	je	0x14012d73c <.text+0x12c73c>
14012d1c9:     	movq	%r8, 0x3c0(%rbp)
14012d1d0:     	movq	%r12, 0x3b0(%rbp)
14012d1d7:     	movq	%r13, 0x3a8(%rbp)
14012d1de:     	movzbl	0x71(%rbx), %ecx
14012d1e2:     	cvtsi2ss	%ecx, %xmm6
14012d1e6:     	addss	%xmm8, %xmm6
14012d1eb:     	movss	0x5c7bd4d(%rip), %xmm0  # 0x145da8f40
14012d1f3:     	mulss	%xmm0, %xmm6
14012d1f7:     	movzbl	0x70(%rbx), %ecx
14012d1fb:     	cvtsi2ss	%ecx, %xmm7
14012d1ff:     	addss	%xmm10, %xmm6
14012d204:     	addss	%xmm8, %xmm7
14012d209:     	mulss	%xmm11, %xmm7
14012d20e:     	addss	%xmm10, %xmm7
14012d213:     	movzbl	0x71(%rax), %ecx
14012d217:     	cvtsi2ss	%ecx, %xmm13
14012d21c:     	addss	%xmm8, %xmm13
14012d221:     	mulss	%xmm0, %xmm13
14012d226:     	addss	%xmm10, %xmm13
14012d22b:     	movzbl	0x70(%rax), %eax
14012d22f:     	cvtsi2ss	%eax, %xmm9
14012d234:     	addss	%xmm8, %xmm9
14012d239:     	mulss	%xmm11, %xmm9
14012d23e:     	addss	%xmm10, %xmm9
14012d243:     	movq	0x20(%rbx), %rdx
14012d247:     	movq	0x28(%rbx), %r8
14012d24b:     	movq	0x3c8(%rbp), %rcx
14012d252:     	callq	0x1458e1f90 <.text+0x58e0f90>
14012d257:     	movl	%eax, %r12d
14012d25a:     	addss	%xmm12, %xmm6
14012d25f:     	addss	%xmm12, %xmm7
14012d264:     	addss	%xmm12, %xmm13
14012d269:     	addss	%xmm12, %xmm9
14012d26e:     	movaps	%xmm13, %xmm0
14012d272:     	subss	%xmm6, %xmm0
14012d276:     	movaps	%xmm9, %xmm1
14012d27a:     	subss	%xmm7, %xmm1
14012d27e:     	movaps	%xmm0, %xmm2
14012d281:     	mulss	%xmm0, %xmm2
14012d285:     	movaps	%xmm1, %xmm3
14012d288:     	mulss	%xmm1, %xmm3
14012d28c:     	addss	%xmm2, %xmm3
14012d290:     	sqrtss	%xmm3, %xmm3
14012d294:     	movss	0x5c400d0(%rip), %xmm2  # 0x145d6d36c
14012d29c:     	divss	%xmm3, %xmm2
14012d2a0:     	movd	%xmm2, %eax
14012d2a4:     	testl	%eax, %eax
14012d2a6:     	setns	%cl
14012d2a9:     	movl	%eax, %edx
14012d2ab:     	andl	$0x7fffffff, %edx       # imm = 0x7FFFFFFF
14012d2b1:     	addl	$0xff800000, %edx       # imm = 0xFF800000
14012d2b7:     	cmpl	$0x7f000000, %edx       # imm = 0x7F000000
14012d2bd:     	setb	%dl
14012d2c0:     	andb	%cl, %dl
14012d2c2:     	decl	%eax
14012d2c4:     	cmpl	$0x7fffff, %eax         # imm = 0x7FFFFF
14012d2c9:     	setb	%al
14012d2cc:     	orb	%dl, %al
14012d2ce:     	xorps	%xmm4, %xmm4
14012d2d1:     	testb	%al, %al
14012d2d3:     	jne	0x14012d2e0 <.text+0x12c2e0>
14012d2d5:     	xorps	%xmm1, %xmm1
14012d2d8:     	jmp	0x14012d2e4 <.text+0x12c2e4>
14012d2da:     	nopw	(%rax,%rax)
14012d2e0:     	mulss	%xmm2, %xmm1
14012d2e4:     	movzbl	0x72(%rbx), %ebx
14012d2e8:     	addss	0x5c7bc90(%rip), %xmm3  # 0x145da8f80
14012d2f0:     	maxss	%xmm4, %xmm3
14012d2f4:     	addss	%xmm13, %xmm6
14012d2f9:     	addss	%xmm9, %xmm7
14012d2fe:     	mulss	%xmm8, %xmm6
14012d303:     	mulss	%xmm8, %xmm7
14012d308:     	addss	0x5c7bc74(%rip), %xmm6  # 0x145da8f84
14012d310:     	movaps	%xmm3, %xmm4
14012d313:     	mulss	%xmm8, %xmm4
14012d318:     	subss	%xmm4, %xmm7
14012d31c:     	movw	$0x0, 0x2c4(%rbp)
14012d325:     	movb	$0x1, 0x2b4(%rbp)
14012d32c:     	movl	$0x1, 0x1c8(%rbp)
14012d336:     	movss	%xmm6, 0x1cc(%rbp)
14012d33e:     	movq	$0x0, 0x1d0(%rbp)
14012d349:     	movl	$0x1, 0x1d8(%rbp)
14012d353:     	movss	%xmm7, 0x1dc(%rbp)
14012d35b:     	movaps	0x5c46abe(%rip), %xmm4  # 0x145d73e20
14012d362:     	movaps	%xmm4, 0x1e0(%rbp)
14012d369:     	movl	$0x1, 0x1f0(%rbp)
14012d373:     	movss	%xmm3, 0x1f4(%rbp)
14012d37b:     	movq	$0x0, 0x1c0(%rbp)
14012d386:     	leaq	0x1f8(%rbp), %rax
14012d38d:     	movups	%xmm15, 0x10(%rax)
14012d392:     	movups	%xmm15, (%rax)
14012d396:     	movw	$0x0, 0xe4(%rax)
14012d39f:     	movl	$0x0, 0xe0(%rax)
14012d3a9:     	movups	0x5c7cad8(%rip), %xmm3  # 0x145da9e88
14012d3b0:     	movups	%xmm3, 0x30(%rax)
14012d3b4:     	movups	0x5c7cabd(%rip), %xmm3  # 0x145da9e78
14012d3bb:     	movups	%xmm3, 0x20(%rax)
14012d3bf:     	movups	0x5c7cae2(%rip), %xmm3  # 0x145da9ea8
14012d3c6:     	movups	%xmm3, 0x50(%rax)
14012d3ca:     	movups	0x5c7cac7(%rip), %xmm3  # 0x145da9e98
14012d3d1:     	movups	%xmm3, 0x40(%rax)
14012d3d5:     	movups	0x5c7caec(%rip), %xmm3  # 0x145da9ec8
14012d3dc:     	movups	%xmm3, 0x70(%rax)
14012d3e0:     	movups	0x5c7cad1(%rip), %xmm3  # 0x145da9eb8
14012d3e7:     	movups	%xmm3, 0x60(%rax)
14012d3eb:     	movups	%xmm14, 0x278(%rbp)
14012d3f3:     	movups	%xmm14, 0x288(%rbp)
14012d3fb:     	movw	$0x0, 0x2d6(%rbp)
14012d404:     	movl	$0x100, 0x2d2(%rbp)     # imm = 0x100
14012d40e:     	movq	$0x0, 0x2b8(%rbp)
14012d419:     	movl	$0x3f800000, 0x2c0(%rbp) # imm = 0x3F800000
14012d423:     	movaps	0x5c3fe36(%rip), %xmm3  # 0x145d6d260
14012d42a:     	movups	%xmm3, 0x298(%rbp)
14012d431:     	movl	$0x1, 0x2a8(%rbp)
14012d43b:     	movq	$0x0, 0x2ac(%rbp)
14012d446:     	movups	0x5c7c973(%rip), %xmm3  # 0x145da9dc0
14012d44d:     	movaps	%xmm3, 0x160(%rbp)
14012d454:     	movq	$0x0, 0x170(%rbp)
14012d45f:     	movups	0x5c7c972(%rip), %xmm3  # 0x145da9dd8
14012d466:     	movups	%xmm3, -0x80(%rax)
14012d46a:     	movq	$0x0, -0x70(%rax)
14012d472:     	movups	0x5c7c977(%rip), %xmm3  # 0x145da9df0
14012d479:     	movups	%xmm3, -0x68(%rax)
14012d47d:     	movq	$0x0, -0x58(%rax)
14012d485:     	movups	0x5c7c97c(%rip), %xmm3  # 0x145da9e08
14012d48c:     	movups	%xmm3, -0x50(%rax)
14012d490:     	movq	$0x0, -0x40(%rax)
14012d498:     	movl	$0x10000, 0xce(%rax)    # imm = 0x10000
14012d4a2:     	movw	$0x0, 0xd2(%rax)
14012d4ab:     	movw	$0x0, 0xd8(%rax)
14012d4b4:     	movl	$0x10000, 0xd4(%rax)    # imm = 0x10000
14012d4be:     	movq	%rsi, 0x3b8(%rbp)
14012d4c5:     	jne	0x14012d4e0 <.text+0x12c4e0>
14012d4c7:     	movss	0x5c437a1(%rip), %xmm0  # 0x145d70c70
14012d4cf:     	jmp	0x14012d4eb <.text+0x12c4eb>
14012d4d1:     	nopw	%cs:(%rax,%rax)
14012d4e0:     	xorps	0x5c402f9(%rip), %xmm2  # 0x145d6d7e0
14012d4e7:     	mulss	%xmm2, %xmm0
14012d4eb:     	callq	0x145bc97ab <.text+0x5bc87ab>
14012d4f0:     	movaps	%xmm0, %xmm7
14012d4f3:     	callq	0x145bc97bd <.text+0x5bc87bd>
14012d4f8:     	movaps	%xmm0, %xmm6
14012d4fb:     	movaps	%xmm7, %xmm0
14012d4fe:     	callq	0x145bc97c3 <.text+0x5bc87c3>
14012d503:     	movaps	%xmm0, %xmm7
14012d506:     	xorl	%esi, %esi
14012d508:     	cmpb	%bl, %r12b
14012d50b:     	setb	%bl
14012d50e:     	jae	0x14012d530 <.text+0x12c530>
14012d510:     	movups	0x5c7d229(%rip), %xmm0  # 0x145daa740
14012d517:     	movaps	%xmm0, 0x3e0(%rbp)
14012d51e:     	movl	$0x3f59999a, 0x3f0(%rbp) # imm = 0x3F59999A
14012d528:     	jmp	0x14012d548 <.text+0x12c548>
14012d52a:     	nopw	(%rax,%rax)
14012d530:     	movups	0x5c7cdb9(%rip), %xmm0  # 0x145daa2f0
14012d537:     	movaps	%xmm0, 0x3e0(%rbp)
14012d53e:     	movl	$0x3f19999a, 0x3f0(%rbp) # imm = 0x3F19999A
14012d548:     	leaq	0x340(%rbp), %r12
14012d54f:     	movq	%r14, %r15
14012d552:     	movq	%r12, %rcx
14012d555:     	leaq	0x3e0(%rbp), %rdx
14012d55c:     	callq	0x144c67100 <.text+0x4c66100>
14012d561:     	nop
14012d562:     	movaps	0x340(%rbp), %xmm0
14012d569:     	movups	%xmm0, 0x398(%rbp)
14012d570:     	movl	$0x1, 0x394(%rbp)
14012d57a:     	movl	$0x40c00000, 0x48(%rsp) # imm = 0x40C00000
14012d582:     	movl	$0x1, 0x40(%rsp)
14012d58a:     	movl	$0x0, 0x38(%rsp)
14012d592:     	movl	$0x1, 0x30(%rsp)
14012d59a:     	movl	$0x0, 0x28(%rsp)
14012d5a2:     	movl	$0x1, 0x20(%rsp)
14012d5aa:     	xorps	%xmm3, %xmm3
14012d5ad:     	movq	%r12, %rcx
14012d5b0:     	leaq	0x394(%rbp), %rdx
14012d5b7:     	movl	$0x1, %r8d
14012d5bd:     	callq	0x142633750 <.text+0x2632750>
14012d5c2:     	nop
14012d5c3:     	movb	%bl, %sil
14012d5c6:     	movd	%esi, %xmm0
14012d5ca:     	pshufd	$0x0, %xmm0, %xmm9      # xmm9 = xmm0[0,0,0,0]
14012d5d0:     	pslld	$0x1f, %xmm9
14012d5d6:     	psrad	$0x1f, %xmm9
14012d5dc:     	movdqa	%xmm9, %xmm0
14012d5e1:     	pandn	0x5c43667(%rip), %xmm0  # 0x145d70c50
14012d5e9:     	pand	0x5c7b99e(%rip), %xmm9  # 0x145da8f90
14012d5f2:     	por	%xmm0, %xmm9
14012d5f7:     	leaq	0x5c7b9a2(%rip), %rax   # 0x145da8fa0
14012d5fe:     	movss	(%rax,%rsi,4), %xmm13
14012d604:     	movl	$0x180, %r8d            # imm = 0x180
14012d60a:     	leaq	-0x30(%rbp), %r14
14012d60e:     	movq	%r14, %rcx
14012d611:     	leaq	0x160(%rbp), %rbx
14012d618:     	movq	%rbx, %rdx
14012d61b:     	callq	0x145bc977b <.text+0x5bc877b>
14012d620:     	movups	0x5c7cd31(%rip), %xmm0  # 0x145daa358
14012d627:     	leaq	0x150(%rbp), %rax
14012d62e:     	movups	%xmm0, (%rax)
14012d631:     	movq	0x350(%rbp), %rax
14012d638:     	leaq	0x37c(%rbp), %rcx
14012d63f:     	movq	%rax, 0x10(%rcx)
14012d643:     	movups	0x340(%rbp), %xmm0
14012d64a:     	movups	%xmm0, (%rcx)
14012d64d:     	movq	0x3d0(%rbp), %rax
14012d654:     	movq	(%rax), %rsi
14012d657:     	movl	$0x190, %r8d            # imm = 0x190
14012d65d:     	leaq	0x168(%rbp), %rcx
14012d664:     	movq	%r14, %rdx
14012d667:     	callq	0x145bc977b <.text+0x5bc877b>
14012d66c:     	movsd	0x5c4362c(%rip), %xmm0  # 0x145d70ca0
14012d674:     	movsd	%xmm0, 0x2f8(%rbp)
14012d67c:     	movss	%xmm7, 0x300(%rbp)
14012d684:     	movss	%xmm6, 0x304(%rbp)
14012d68c:     	movl	$0x0, 0x308(%rbp)
14012d696:     	movq	%xmm9, 0x30c(%rbp)
14012d69f:     	movss	%xmm13, 0x314(%rbp)
14012d6a8:     	movl	$0x3f800000, 0x318(%rbp) # imm = 0x3F800000
14012d6b2:     	movups	0x378(%rbp), %xmm0
14012d6b9:     	movups	0x384(%rbp), %xmm1
14012d6c0:     	leaq	0x1f8(%rbp), %rax
14012d6c7:     	movups	%xmm0, 0x124(%rax)
14012d6ce:     	movups	%xmm1, 0x130(%rax)
14012d6d5:     	movq	%rsi, 0x160(%rbp)
14012d6dc:     	movq	%r12, %rcx
14012d6df:     	movq	0x3d8(%rbp), %rdx
14012d6e6:     	movq	%rbx, %r8
14012d6e9:     	leaq	0x5c408c0(%rip), %r9    # 0x145d6dfb0
14012d6f0:     	callq	0x14018d060 <.text+0x18c060>
14012d6f5:     	movq	%r15, %r14
14012d6f8:     	movq	0x3a8(%rbp), %r13
14012d6ff:     	movq	0x3b0(%rbp), %r12
14012d706:     	movq	0x3b8(%rbp), %rsi
14012d70d:     	movq	0x400(%rbp), %rax
14012d714:     	movq	0x3c0(%rbp), %r8
14012d71b:     	testq	%rax, %rax
14012d71e:     	jne	0x14012ced0 <.text+0x12bed0>
14012d724:     	jmp	0x14012cef1 <.text+0x12bef1>
14012d729:     	movq	$0x0, 0x408(%rbp)
14012d734:     	movq	%r15, %r8
14012d737:     	jmp	0x14012cef1 <.text+0x12bef1>
14012d73c:     	movaps	0x420(%rbp), %xmm6
14012d743:     	movaps	0x430(%rbp), %xmm7
14012d74a:     	movaps	0x440(%rbp), %xmm8
14012d752:     	movaps	0x450(%rbp), %xmm9
14012d75a:     	movaps	0x460(%rbp), %xmm10
14012d762:     	movaps	0x470(%rbp), %xmm11
14012d76a:     	movaps	0x480(%rbp), %xmm12
14012d772:     	movaps	0x490(%rbp), %xmm13
14012d77a:     	movaps	0x4a0(%rbp), %xmm14
14012d782:     	movaps	0x4b0(%rbp), %xmm15
14012d78a:     	addq	$0x548, %rsp            # imm = 0x548
14012d791:     	popq	%rbx
14012d792:     	popq	%rdi
14012d793:     	popq	%rsi
14012d794:     	popq	%r12
14012d796:     	popq	%r13
14012d798:     	popq	%r14
14012d79a:     	popq	%r15
14012d79c:     	popq	%rbp
14012d79d:     	retq

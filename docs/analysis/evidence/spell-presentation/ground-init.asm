
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140599e80:     	pushq	%rbp
140599e81:     	pushq	%r15
140599e83:     	pushq	%r14
140599e85:     	pushq	%r13
140599e87:     	pushq	%r12
140599e89:     	pushq	%rsi
140599e8a:     	pushq	%rdi
140599e8b:     	pushq	%rbx
140599e8c:     	subq	$0x358, %rsp            # imm = 0x358
140599e93:     	leaq	0x80(%rsp), %rbp
140599e9b:     	movaps	%xmm13, 0x2c0(%rbp)
140599ea3:     	movaps	%xmm12, 0x2b0(%rbp)
140599eab:     	movaps	%xmm11, 0x2a0(%rbp)
140599eb3:     	movaps	%xmm10, 0x290(%rbp)
140599ebb:     	movaps	%xmm9, 0x280(%rbp)
140599ec3:     	movaps	%xmm8, 0x270(%rbp)
140599ecb:     	movaps	%xmm7, 0x260(%rbp)
140599ed2:     	movaps	%xmm6, 0x250(%rbp)
140599ed9:     	movq	$-0x2, 0x248(%rbp)
140599ee4:     	movq	0x360(%rbp), %rax
140599eeb:     	movq	0x358(%rbp), %rcx
140599ef2:     	movq	0x350(%rbp), %r10
140599ef9:     	movq	0x348(%rbp), %r11
140599f00:     	movq	0x340(%rbp), %rsi
140599f07:     	movq	0x20(%rdx), %rdi
140599f0b:     	movq	%rdi, -0x30(%rbp)
140599f0f:     	movups	(%rdx), %xmm0
140599f12:     	movups	0x10(%rdx), %xmm1
140599f16:     	movaps	%xmm1, -0x40(%rbp)
140599f1a:     	movaps	%xmm0, -0x50(%rbp)
140599f1e:     	movq	0x10(%r8), %rdx
140599f22:     	movq	%rdx, -0x18(%rbp)
140599f26:     	movups	(%r8), %xmm0
140599f2a:     	movups	%xmm0, -0x28(%rbp)
140599f2e:     	movups	(%r9), %xmm0
140599f32:     	movups	0x10(%r9), %xmm1
140599f37:     	movaps	%xmm1, 0x40(%rbp)
140599f3b:     	movaps	%xmm0, 0x30(%rbp)
140599f3f:     	movups	(%rsi), %xmm0
140599f42:     	movups	0x10(%rsi), %xmm1
140599f46:     	movaps	%xmm1, 0x60(%rbp)
140599f4a:     	movaps	%xmm0, 0x50(%rbp)
140599f4e:     	movups	(%r11), %xmm0
140599f52:     	movups	0x10(%r11), %xmm1
140599f57:     	movaps	%xmm1, 0x80(%rbp)
140599f5e:     	movaps	%xmm0, 0x70(%rbp)
140599f62:     	movups	(%r10), %xmm0
140599f66:     	movups	0x10(%r10), %xmm1
140599f6b:     	movaps	%xmm0, -0x10(%rbp)
140599f6f:     	movaps	%xmm1, (%rbp)
140599f73:     	movups	(%rcx), %xmm0
140599f76:     	movups	0x10(%rcx), %xmm1
140599f7a:     	movaps	%xmm0, 0x10(%rbp)
140599f7e:     	movaps	%xmm1, 0x20(%rbp)
140599f82:     	movups	(%rax), %xmm0
140599f85:     	movups	0x10(%rax), %xmm1
140599f89:     	movaps	%xmm1, 0xa0(%rbp)
140599f90:     	movaps	%xmm0, 0x90(%rbp)
140599f97:     	movq	0x30(%rbp), %rax
140599f9b:     	movq	0x50(%rbp), %rcx
140599f9f:     	movq	%rax, 0x170(%rbp)
140599fa6:     	testq	%rax, %rax
140599fa9:     	sete	%al
140599fac:     	movq	%rcx, 0xb0(%rbp)
140599fb3:     	testq	%rcx, %rcx
140599fb6:     	sete	%cl
140599fb9:     	orb	%al, %cl
140599fbb:     	movq	0x70(%rbp), %rax
140599fbf:     	movq	%rax, 0x140(%rbp)
140599fc6:     	testq	%rax, %rax
140599fc9:     	sete	%al
140599fcc:     	orb	%cl, %al
140599fce:     	je	0x14059a022 <.text+0x599022>
140599fd0:     	movaps	0x250(%rbp), %xmm6
140599fd7:     	movaps	0x260(%rbp), %xmm7
140599fde:     	movaps	0x270(%rbp), %xmm8
140599fe6:     	movaps	0x280(%rbp), %xmm9
140599fee:     	movaps	0x290(%rbp), %xmm10
140599ff6:     	movaps	0x2a0(%rbp), %xmm11
140599ffe:     	movaps	0x2b0(%rbp), %xmm12
14059a006:     	movaps	0x2c0(%rbp), %xmm13
14059a00e:     	addq	$0x358, %rsp            # imm = 0x358
14059a015:     	popq	%rbx
14059a016:     	popq	%rdi
14059a017:     	popq	%rsi
14059a018:     	popq	%r12
14059a01a:     	popq	%r13
14059a01c:     	popq	%r14
14059a01e:     	popq	%r15
14059a020:     	popq	%rbp
14059a021:     	retq
14059a022:     	movq	0x90(%rbp), %rax
14059a029:     	movss	0x57d333a(%rip), %xmm8  # 0x145d6d36c
14059a032:     	movaps	%xmm8, %xmm9
14059a036:     	testq	%rax, %rax
14059a039:     	je	0x14059a063 <.text+0x599063>
14059a03b:     	movl	(%rax), %edx
14059a03d:     	xorl	%eax, %eax
14059a03f:     	cmpl	$0x1, %edx
14059a042:     	sete	%cl
14059a045:     	testl	%edx, %edx
14059a047:     	je	0x14059a05a <.text+0x59905a>
14059a049:     	movb	%cl, %al
14059a04b:     	leaq	0x58b2d96(%rip), %rcx   # 0x145e4cde8
14059a052:     	movss	(%rcx,%rax,4), %xmm9
14059a058:     	jmp	0x14059a063 <.text+0x599063>
14059a05a:     	movss	0x581df5d(%rip), %xmm9  # 0x145db7fc0
14059a063:     	movq	0x80(%rbp), %rax
14059a06a:     	movq	%rax, 0x150(%rbp)
14059a071:     	movl	0x8c(%rbp), %eax
14059a077:     	movl	%eax, 0x1fc(%rbp)
14059a07d:     	movq	-0x28(%rbp), %rdx
14059a081:     	movq	-0x20(%rbp), %r13
14059a085:     	movl	-0x14(%rbp), %ecx
14059a088:     	movq	0xf8(%rdx), %rdi
14059a08f:     	movq	0x100(%rdx), %rax
14059a096:     	leaq	(%rdi,%rax,4), %r15
14059a09a:     	movq	%rdx, 0x130(%rbp)
14059a0a1:     	movzbl	0x108(%rdx), %eax
14059a0a8:     	movb	%al, 0x245(%rbp)
14059a0ae:     	movq	-0x10(%rbp), %rax
14059a0b2:     	movq	%rax, 0x158(%rbp)
14059a0b9:     	movl	0x2c(%rbp), %eax
14059a0bc:     	movl	%eax, 0x164(%rbp)
14059a0c2:     	movl	%ecx, 0x1f4(%rbp)
14059a0c8:     	movl	%ecx, %eax
14059a0ca:     	subl	-0x18(%rbp), %eax
14059a0cd:     	cmpl	$0xc233b000, %eax       # imm = 0xC233B000
14059a0d2:     	movl	$0xc233b000, %ecx       # imm = 0xC233B000
14059a0d7:     	cmovbl	%eax, %ecx
14059a0da:     	movl	%ecx, 0x1f8(%rbp)
14059a0e0:     	movq	0x20(%rbp), %rax
14059a0e4:     	movq	%rax, 0xb8(%rbp)
14059a0eb:     	movss	0x57d3660(%rip), %xmm10 # 0x145d6d754
14059a0f4:     	movss	0x58b2cf3(%rip), %xmm11 # 0x145e4cdf0
14059a0fd:     	movss	0x5800dc6(%rip), %xmm12 # 0x145d9aecc
14059a106:     	movq	0x10(%rbp), %rax
14059a10a:     	movq	%rax, 0x148(%rbp)
14059a111:     	addq	$0x20, %rax
14059a115:     	movq	%rax, 0xc0(%rbp)
14059a11c:     	movl	$0x8, %eax
14059a121:     	movq	%rax, 0x1e8(%rbp)
14059a128:     	movl	$0x8, %r8d
14059a12e:     	movq	$0x0, 0x220(%rbp)
14059a139:     	xorl	%ebx, %ebx
14059a13b:     	xorl	%r9d, %r9d
14059a13e:     	xorl	%r12d, %r12d
14059a141:     	xorl	%esi, %esi
14059a143:     	jmp	0x14059a15a <.text+0x59915a>
14059a145:     	testl	%eax, %eax
14059a147:     	jne	0x14059ad45 <.text+0x599d45>
14059a14d:     	nopl	(%rax)
14059a150:     	movq	0x168(%rbp), %r8
14059a157:     	movq	%r14, %r9
14059a15a:     	cmpb	$0x0, 0x245(%rbp)
14059a161:     	je	0x14059a2e0 <.text+0x5992e0>
14059a167:     	movq	0x1e8(%rbp), %rdx
14059a16e:     	movq	%r8, %r14
14059a171:     	nopw	%cs:(%rax,%rax)
14059a180:     	cmpl	%r12d, %esi
14059a183:     	jne	0x14059a2a1 <.text+0x5992a1>
14059a189:     	cmpq	%r15, %rdi
14059a18c:     	je	0x14059a470 <.text+0x599470>
14059a192:     	movl	(%rdi), %ecx
14059a194:     	addq	$0x4, %rdi
14059a198:     	movq	0x1a8(%r13), %rax
14059a19f:     	leaq	(%rcx,%rcx,8), %rcx
14059a1a3:     	cmpq	$0x0, 0x10(%rax,%rcx,8)
14059a1a9:     	je	0x14059a1c0 <.text+0x5991c0>
14059a1ab:     	leaq	(%rax,%rcx,8), %r12
14059a1af:     	leaq	(%rax,%rcx,8), %rsi
14059a1b3:     	addq	$0x10, %rsi
14059a1b7:     	jmp	0x14059a1eb <.text+0x5991eb>
14059a1b9:     	nopl	(%rax)
14059a1c0:     	cmpq	%r15, %rdi
14059a1c3:     	je	0x14059a470 <.text+0x599470>
14059a1c9:     	movl	(%rdi), %ecx
14059a1cb:     	addq	$0x4, %rdi
14059a1cf:     	movq	0x1a8(%r13), %rax
14059a1d6:     	leaq	(%rcx,%rcx,8), %rcx
14059a1da:     	cmpq	$0x0, 0x10(%rax,%rcx,8)
14059a1e0:     	je	0x14059a1c0 <.text+0x5991c0>
14059a1e2:     	leaq	(%rax,%rcx,8), %r12
14059a1e6:     	leaq	0x10(%r12), %rsi
14059a1eb:     	movq	0x130(%rbp), %r8
14059a1f2:     	movq	0x110(%r8), %rcx
14059a1f9:     	movq	0x40(%r12), %rax
14059a1fe:     	cmpq	%rax, %rcx
14059a201:     	jae	0x14059a240 <.text+0x599240>
14059a203:     	movq	0x38(%r12), %rdx
14059a208:     	movq	(%rdx,%rcx,8), %rcx
14059a20c:     	testq	%rcx, %rcx
14059a20f:     	je	0x14059a240 <.text+0x599240>
14059a211:     	movq	0x18(%r12), %rdx
14059a216:     	notq	%rcx
14059a219:     	leaq	(%rcx,%rcx,2), %rcx
14059a21d:     	shlq	$0x4, %rcx
14059a221:     	movq	0x10(%rdx,%rcx), %rcx
14059a226:     	movq	%rcx, 0x220(%rbp)
14059a22d:     	movq	0x118(%r8), %rcx
14059a234:     	cmpq	%rax, %rcx
14059a237:     	jb	0x14059a257 <.text+0x599257>
14059a239:     	jmp	0x14059a280 <.text+0x599280>
14059a23b:     	nopl	(%rax,%rax)
14059a240:     	movq	$0x0, 0x220(%rbp)
14059a24b:     	movq	0x118(%r8), %rcx
14059a252:     	cmpq	%rax, %rcx
14059a255:     	jae	0x14059a280 <.text+0x599280>
14059a257:     	movq	0x38(%r12), %rax
14059a25c:     	movq	(%rax,%rcx,8), %rax
14059a260:     	testq	%rax, %rax
14059a263:     	je	0x14059a280 <.text+0x599280>
14059a265:     	movq	0x18(%r12), %rcx
14059a26a:     	notq	%rax
14059a26d:     	leaq	(%rax,%rax,2), %rax
14059a271:     	shlq	$0x4, %rax
14059a275:     	movq	0x10(%rcx,%rax), %rbx
14059a27a:     	jmp	0x14059a282 <.text+0x599282>
14059a27c:     	nopl	(%rax)
14059a280:     	xorl	%ebx, %ebx
14059a282:     	movq	0x120(%r8), %rdx
14059a289:     	movq	%r12, %rcx
14059a28c:     	callq	0x144e38110 <.text+0x4e37110>
14059a291:     	movq	%rax, %r9
14059a294:     	movq	0x8(%r12), %rdx
14059a299:     	movq	(%rsi), %r12
14059a29c:     	xorl	%esi, %esi
14059a29e:     	movq	%r14, %r8
14059a2a1:     	movl	%esi, %eax
14059a2a3:     	incl	%esi
14059a2a5:     	movl	0x1f4(%rbp), %ecx
14059a2ab:     	subl	(%r9,%rax,4), %ecx
14059a2af:     	cmpl	0x1f8(%rbp), %ecx
14059a2b5:     	jae	0x14059a180 <.text+0x599180>
14059a2bb:     	movq	(%rdx,%rax,8), %rcx
14059a2bf:     	testl	%ecx, %ecx
14059a2c1:     	je	0x14059a180 <.text+0x599180>
14059a2c7:     	movq	%rdx, 0x1e8(%rbp)
14059a2ce:     	jmp	0x14059a43e <.text+0x59943e>
14059a2d3:     	nopw	%cs:(%rax,%rax)
14059a2e0:     	cmpl	%r12d, %esi
14059a2e3:     	jne	0x14059a40b <.text+0x59940b>
14059a2e9:     	cmpq	%r15, %rdi
14059a2ec:     	je	0x14059a477 <.text+0x599477>
14059a2f2:     	movl	(%rdi), %ecx
14059a2f4:     	addq	$0x4, %rdi
14059a2f8:     	movq	0x108(%r13), %rax
14059a2ff:     	leaq	(%rcx,%rcx,4), %rcx
14059a303:     	shlq	$0x5, %rcx
14059a307:     	cmpq	$0x0, 0x58(%rax,%rcx)
14059a30d:     	je	0x14059a320 <.text+0x599320>
14059a30f:     	leaq	(%rax,%rcx), %rsi
14059a313:     	leaq	(%rax,%rcx), %r12
14059a317:     	addq	$0x58, %r12
14059a31b:     	jmp	0x14059a34d <.text+0x59934d>
14059a31d:     	nopl	(%rax)
14059a320:     	cmpq	%r15, %rdi
14059a323:     	je	0x14059a477 <.text+0x599477>
14059a329:     	movl	(%rdi), %eax
14059a32b:     	addq	$0x4, %rdi
14059a32f:     	movq	0x108(%r13), %rsi
14059a336:     	leaq	(%rax,%rax,4), %rax
14059a33a:     	shlq	$0x5, %rax
14059a33e:     	cmpq	$0x0, 0x58(%rsi,%rax)
14059a344:     	je	0x14059a320 <.text+0x599320>
14059a346:     	addq	%rax, %rsi
14059a349:     	leaq	0x58(%rsi), %r12
14059a34d:     	movl	0x94(%rsi), %eax
14059a353:     	movq	0x1a8(%r13), %r8
14059a35a:     	leaq	(%rax,%rax,8), %rax
14059a35e:     	leaq	(%r8,%rax,8), %rcx
14059a362:     	movq	0x130(%rbp), %r9
14059a369:     	movq	0x110(%r9), %rdx
14059a370:     	movq	0x40(%r8,%rax,8), %rax
14059a375:     	cmpq	%rax, %rdx
14059a378:     	jae	0x14059a3b0 <.text+0x5993b0>
14059a37a:     	movq	0x38(%rcx), %r8
14059a37e:     	movq	(%r8,%rdx,8), %rdx
14059a382:     	testq	%rdx, %rdx
14059a385:     	je	0x14059a3b0 <.text+0x5993b0>
14059a387:     	movq	0x18(%rcx), %r8
14059a38b:     	notq	%rdx
14059a38e:     	leaq	(%rdx,%rdx,2), %rdx
14059a392:     	shlq	$0x4, %rdx
14059a396:     	movq	0x10(%r8,%rdx), %rdx
14059a39b:     	movq	%rdx, 0x220(%rbp)
14059a3a2:     	movq	0x118(%r9), %rdx
14059a3a9:     	cmpq	%rax, %rdx
14059a3ac:     	jb	0x14059a3c7 <.text+0x5993c7>
14059a3ae:     	jmp	0x14059a3f0 <.text+0x5993f0>
14059a3b0:     	movq	$0x0, 0x220(%rbp)
14059a3bb:     	movq	0x118(%r9), %rdx
14059a3c2:     	cmpq	%rax, %rdx
14059a3c5:     	jae	0x14059a3f0 <.text+0x5993f0>
14059a3c7:     	movq	0x38(%rcx), %rax
14059a3cb:     	movq	(%rax,%rdx,8), %rax
14059a3cf:     	testq	%rax, %rax
14059a3d2:     	je	0x14059a3f0 <.text+0x5993f0>
14059a3d4:     	movq	0x18(%rcx), %rdx
14059a3d8:     	notq	%rax
14059a3db:     	leaq	(%rax,%rax,2), %rax
14059a3df:     	shlq	$0x4, %rax
14059a3e3:     	movq	0x10(%rdx,%rax), %rbx
14059a3e8:     	jmp	0x14059a3f2 <.text+0x5993f2>
14059a3ea:     	nopw	(%rax,%rax)
14059a3f0:     	xorl	%ebx, %ebx
14059a3f2:     	movq	0x120(%r9), %rdx
14059a3f9:     	callq	0x144e38110 <.text+0x4e37110>
14059a3fe:     	movq	%rax, %r9
14059a401:     	movq	0x50(%rsi), %r8
14059a405:     	movq	(%r12), %r12
14059a409:     	xorl	%esi, %esi
14059a40b:     	movl	%esi, %ecx
14059a40d:     	shlq	$0x4, %rcx
14059a411:     	incl	%esi
14059a413:     	movl	0x8(%r8,%rcx), %eax
14059a418:     	notl	%eax
14059a41a:     	movl	0x1f4(%rbp), %edx
14059a420:     	subl	(%r9,%rax,4), %edx
14059a424:     	cmpl	0x1f8(%rbp), %edx
14059a42a:     	jae	0x14059a2e0 <.text+0x5992e0>
14059a430:     	addq	%r8, %rcx
14059a433:     	movq	(%rcx), %rcx
14059a436:     	testl	%ecx, %ecx
14059a438:     	je	0x14059a2e0 <.text+0x5992e0>
14059a43e:     	imulq	$0x38, %rax, %rdx
14059a442:     	shlq	$0x4, %rax
14059a446:     	addq	0x220(%rbp), %rax
14059a44d:     	addq	%rbx, %rdx
14059a450:     	movq	%rdx, 0x208(%rbp)
14059a457:     	movq	%rax, 0x138(%rbp)
14059a45e:     	testl	%ecx, %ecx
14059a460:     	jne	0x14059a496 <.text+0x599496>
14059a462:     	jmp	0x140599fd0 <.text+0x598fd0>
14059a467:     	nopw	(%rax,%rax)
14059a470:     	movq	%rdx, 0x1e8(%rbp)
14059a477:     	movabsq	$-0x100000000, %rax     # imm = 0xFFFFFFFF00000000
14059a481:     	movq	0x200(%rbp), %rcx
14059a488:     	andq	%rax, %rcx
14059a48b:     	movl	%r12d, %esi
14059a48e:     	testl	%ecx, %ecx
14059a490:     	je	0x140599fd0 <.text+0x598fd0>
14059a496:     	movq	%rcx, 0x200(%rbp)
14059a49d:     	movq	0x138(%rbp), %rax
14059a4a4:     	cmpb	$0x3, 0xc(%rax)
14059a4a8:     	jne	0x14059a15a <.text+0x59915a>
14059a4ae:     	movq	0x208(%rbp), %rcx
14059a4b5:     	movq	%r8, 0x168(%rbp)
14059a4bc:     	movq	%r9, %r14
14059a4bf:     	callq	0x1459d2b00 <.text+0x59d1b00>
14059a4c4:     	movq	%r14, %r9
14059a4c7:     	movq	0x168(%rbp), %r8
14059a4ce:     	testb	$0x1, %al
14059a4d0:     	je	0x14059a15a <.text+0x59915a>
14059a4d6:     	movl	%edx, 0x1f0(%rbp)
14059a4dc:     	movq	0xb0(%rbp), %rcx
14059a4e3:     	callq	0x145a7b160 <.text+0x5a7a160>
14059a4e8:     	testq	%rax, %rax
14059a4eb:     	je	0x14059a508 <.text+0x599508>
14059a4ed:     	movl	0x104(%rax), %edx
14059a4f3:     	movq	0x170(%rbp), %rcx
14059a4fa:     	callq	0x145a7c300 <.text+0x5a7b300>
14059a4ff:     	testq	%rax, %rax
14059a502:     	jne	0x14059a5e1 <.text+0x5995e1>
14059a508:     	movq	0x7a5ca99(%rip), %rax   # 0x147ff6fa8
14059a50f:     	movq	(%rax), %rax
14059a512:     	cmpq	$0x2, %rax
14059a516:     	jae	0x14059a150 <.text+0x599150>
14059a51c:     	movzbl	0x7a20d65(%rip), %edx   # 0x147fbb288
14059a523:     	movzbl	%dl, %eax
14059a526:     	leal	-0x1(%rax), %ecx
14059a529:     	cmpl	$0x2, %ecx
14059a52c:     	jae	0x14059a145 <.text+0x599145>
14059a532:     	movq	0x7a20d3f(%rip), %rcx   # 0x147fbb278
14059a539:     	callq	0x144c46ce0 <.text+0x4c45ce0>
14059a53e:     	testb	%al, %al
14059a540:     	je	0x14059a150 <.text+0x599150>
14059a546:     	movq	0x7a20d2b(%rip), %rcx   # 0x147fbb278
14059a54d:     	leaq	0x30(%rcx), %rax
14059a551:     	leaq	0x1f0(%rbp), %rdx
14059a558:     	movq	%rdx, 0xd8(%rbp)
14059a55f:     	leaq	0x5613a1a(%rip), %rdx   # 0x145badf80 <.text+0x5bacf80>
14059a566:     	movq	%rdx, 0xe0(%rbp)
14059a56d:     	leaq	0x58bbb94(%rip), %rdx   # 0x145e56108
14059a574:     	movq	%rdx, 0x110(%rbp)
14059a57b:     	leaq	0xd8(%rbp), %rdx
14059a582:     	movq	%rdx, 0x118(%rbp)
14059a589:     	leaq	0x110(%rbp), %rdx
14059a590:     	movq	%rdx, 0x120(%rbp)
14059a597:     	leaq	0x58b29b2(%rip), %rdx   # 0x145e4cf50
14059a59e:     	movq	%rdx, 0x128(%rbp)
14059a5a5:     	movq	$0x1, 0x180(%rbp)
14059a5b0:     	leaq	0x120(%rbp), %rdx
14059a5b7:     	movq	%rdx, 0x188(%rbp)
14059a5be:     	movq	$0x1, 0x190(%rbp)
14059a5c9:     	movq	%rax, 0x198(%rbp)
14059a5d0:     	leaq	0x180(%rbp), %rdx
14059a5d7:     	callq	0x144c48500 <.text+0x4c47500>
14059a5dc:     	jmp	0x14059a150 <.text+0x599150>
14059a5e1:     	movq	%rax, 0x218(%rbp)
14059a5e8:     	movzbl	0x7a6a5a9(%rip), %eax   # 0x148004b98
14059a5ef:     	movb	%al, 0x228(%rbp)
14059a5f5:     	leaq	0x180(%rbp), %rcx
14059a5fc:     	movq	0x208(%rbp), %rdx
14059a603:     	callq	0x1459d2940 <.text+0x59d1940>
14059a608:     	cmpl	$0x1, 0x180(%rbp)
14059a60f:     	jne	0x14059a65a <.text+0x59965a>
14059a611:     	movss	0x190(%rbp), %xmm6
14059a619:     	mulss	%xmm10, %xmm6
14059a61e:     	movq	0x208(%rbp), %rcx
14059a625:     	callq	0x1459cd660 <.text+0x59cc660>
14059a62a:     	testb	$0x1, %al
14059a62c:     	je	0x14059a66d <.text+0x59966d>
14059a62e:     	xorps	%xmm13, %xmm13
14059a632:     	cmpltss	%xmm0, %xmm13
14059a638:     	andps	%xmm13, %xmm0
14059a63c:     	andnps	%xmm8, %xmm13
14059a640:     	orps	%xmm0, %xmm13
14059a644:     	movq	0x218(%rbp), %rax
14059a64b:     	cmpb	$0x0, 0x228(%rbp)
14059a652:     	jne	0x14059a88d <.text+0x59988d>
14059a658:     	jmp	0x14059a685 <.text+0x599685>
14059a65a:     	xorps	%xmm6, %xmm6
14059a65d:     	movq	0x208(%rbp), %rcx
14059a664:     	callq	0x1459cd660 <.text+0x59cc660>
14059a669:     	testb	$0x1, %al
14059a66b:     	jne	0x14059a62e <.text+0x59962e>
14059a66d:     	movaps	%xmm8, %xmm13
14059a671:     	movq	0x218(%rbp), %rax
14059a678:     	cmpb	$0x0, 0x228(%rbp)
14059a67f:     	jne	0x14059a88d <.text+0x59988d>
14059a685:     	cmpl	$0x0, 0x30(%rax)
14059a689:     	je	0x14059a88d <.text+0x59988d>
14059a68f:     	movl	0x34(%rax), %edx
14059a692:     	testl	%edx, %edx
14059a694:     	je	0x14059a88d <.text+0x59988d>
14059a69a:     	movq	0x170(%rbp), %rcx
14059a6a1:     	callq	0x145a7bdc0 <.text+0x5a7adc0>
14059a6a6:     	testq	%rax, %rax
14059a6a9:     	je	0x14059a886 <.text+0x599886>
14059a6af:     	movq	%rax, 0x178(%rbp)
14059a6b6:     	movq	$0x1, 0x20(%rsp)
14059a6bf:     	movl	$0x1, %r9d
14059a6c5:     	leaq	0x180(%rbp), %rcx
14059a6cc:     	movq	%rdx, 0x230(%rbp)
14059a6d3:     	xorl	%r8d, %r8d
14059a6d6:     	callq	0x14023ff50 <.text+0x23ef50>
14059a6db:     	movq	0x188(%rbp), %rax
14059a6e2:     	movq	%rax, 0x210(%rbp)
14059a6e9:     	cmpl	$0x1, 0x180(%rbp)
14059a6f0:     	je	0x14059ad75 <.text+0x599d75>
14059a6f6:     	movq	0x190(%rbp), %r8
14059a6fd:     	movq	0x230(%rbp), %r9
14059a704:     	testq	%r9, %r9
14059a707:     	movq	%r8, 0x238(%rbp)
14059a70e:     	je	0x14059a730 <.text+0x599730>
14059a710:     	movq	%r8, %rcx
14059a713:     	movq	0x178(%rbp), %rdx
14059a71a:     	movq	%r9, %r8
14059a71d:     	callq	0x145bc977b <.text+0x5bc877b>
14059a722:     	movq	0x230(%rbp), %r9
14059a729:     	movq	0x238(%rbp), %r8
14059a730:     	movq	0x150(%rbp), %rax
14059a737:     	movl	0x1fc(%rbp), %ecx
14059a73d:     	movl	%ecx, (%rax)
14059a73f:     	movb	$0x1, 0x247(%rbp)
14059a746:     	movq	0x140(%rbp), %rcx
14059a74d:     	movq	0x158(%rbp), %rdx
14059a754:     	callq	0x140573390 <.text+0x572390>
14059a759:     	nop
14059a75a:     	movq	0x210(%rbp), %rax
14059a761:     	movq	%rax, 0x1b0(%rbp)
14059a768:     	movq	0x238(%rbp), %rax
14059a76f:     	movq	%rax, 0x1b8(%rbp)
14059a776:     	movq	0x230(%rbp), %rax
14059a77d:     	movq	%rax, 0x1c0(%rbp)
14059a784:     	movaps	%xmm6, %xmm0
14059a787:     	callq	0x145bc97bd <.text+0x5bc87bd>
14059a78c:     	movaps	%xmm0, %xmm7
14059a78f:     	movaps	%xmm6, %xmm0
14059a792:     	callq	0x145bc97c3 <.text+0x5bc87c3>
14059a797:     	xorps	%xmm1, %xmm1
14059a79a:     	movss	%xmm0, %xmm1            # xmm1 = xmm0[0],xmm1[1,2,3]
14059a79e:     	xorps	%xmm0, %xmm0
14059a7a1:     	movss	%xmm7, %xmm0            # xmm0 = xmm7[0],xmm0[1,2,3]
14059a7a5:     	shufps	$0x11, %xmm1, %xmm0     # xmm0 = xmm0[1,0],xmm1[1,0]
14059a7a9:     	movl	$0x0, 0x1c8(%rbp)
14059a7b3:     	movw	$0x1, 0x1d0(%rbp)
14059a7bc:     	movb	$0x0, 0x1d2(%rbp)
14059a7c3:     	movaps	%xmm0, 0x180(%rbp)
14059a7ca:     	leaq	0x190(%rbp), %rax
14059a7d1:     	movl	$0x0, 0x8(%rax)
14059a7d8:     	movq	$0x0, (%rax)
14059a7df:     	movss	%xmm13, 0x19c(%rbp)
14059a7e8:     	movss	%xmm13, 0x1a0(%rbp)
14059a7f1:     	movss	%xmm13, 0x1a4(%rbp)
14059a7fa:     	movb	$0x0, 0x1d8(%rbp)
14059a801:     	movb	$0x0, 0x247(%rbp)
14059a808:     	leaq	0xd8(%rbp), %rcx
14059a80f:     	leaq	-0x50(%rbp), %rdx
14059a813:     	leaq	0x180(%rbp), %r8
14059a81a:     	leaq	0x58bb72f(%rip), %r9    # 0x145e55f50
14059a821:     	callq	0x140a82d00 <.text+0xa81d00>
14059a826:     	nop
14059a827:     	movq	0xd8(%rbp), %rdx
14059a82e:     	movq	0x200(%rbp), %rax
14059a835:     	movq	%rax, 0x180(%rbp)
14059a83c:     	movaps	-0x50(%rbp), %xmm1
14059a840:     	movaps	-0x40(%rbp), %xmm0
14059a844:     	movups	%xmm1, 0x188(%rbp)
14059a84b:     	cmpq	$0x0, -0x40(%rbp)
14059a850:     	movq	0xd0(%rbp), %rax
14059a857:     	je	0x14059a85d <.text+0x59985d>
14059a859:     	movq	-0x30(%rbp), %rax
14059a85d:     	movups	%xmm0, 0x198(%rbp)
14059a864:     	movq	%rax, 0xd0(%rbp)
14059a86b:     	movq	%rax, 0x1a8(%rbp)
14059a872:     	movb	$0x0, 0x247(%rbp)
14059a879:     	leaq	0x180(%rbp), %rcx
14059a880:     	callq	0x144e61ed0 <.text+0x4e60ed0>
14059a885:     	nop
14059a886:     	movq	0x218(%rbp), %rax
14059a88d:     	movl	0x38(%rax), %edx
14059a890:     	movq	0x170(%rbp), %rcx
14059a897:     	callq	0x145a7c220 <.text+0x5a7b220>
14059a89c:     	testq	%rax, %rax
14059a89f:     	je	0x14059ab97 <.text+0x599b97>
14059a8a5:     	cmpb	$0x0, 0x60(%rax)
14059a8a9:     	je	0x14059a8ba <.text+0x5998ba>
14059a8ab:     	cmpl	$0x9, 0x74(%rax)
14059a8af:     	jne	0x14059a8ba <.text+0x5998ba>
14059a8b1:     	movq	%rax, %r8
14059a8b4:     	addq	$0x60, %r8
14059a8b8:     	jmp	0x14059a914 <.text+0x599914>
14059a8ba:     	cmpl	$0x1, 0x78(%rax)
14059a8be:     	jne	0x14059a8d2 <.text+0x5998d2>
14059a8c0:     	cmpl	$0x9, 0x8c(%rax)
14059a8c7:     	jne	0x14059a8d2 <.text+0x5998d2>
14059a8c9:     	movq	%rax, %r8
14059a8cc:     	addq	$0x78, %r8
14059a8d0:     	jmp	0x14059a914 <.text+0x599914>
14059a8d2:     	cmpl	$0x1, 0x90(%rax)
14059a8d9:     	jne	0x14059a8f0 <.text+0x5998f0>
14059a8db:     	cmpl	$0x9, 0xa4(%rax)
14059a8e2:     	jne	0x14059a8f0 <.text+0x5998f0>
14059a8e4:     	movq	%rax, %r8
14059a8e7:     	addq	$0x90, %r8
14059a8ee:     	jmp	0x14059a914 <.text+0x599914>
14059a8f0:     	cmpl	$0x1, 0xa8(%rax)
14059a8f7:     	jne	0x14059aaf6 <.text+0x599af6>
14059a8fd:     	cmpl	$0x9, 0xbc(%rax)
14059a904:     	jne	0x14059aaf6 <.text+0x599af6>
14059a90a:     	movq	%rax, %r8
14059a90d:     	addq	$0xa8, %r8
14059a914:     	cmpb	$0x0, 0x228(%rbp)
14059a91b:     	jne	0x14059aaf6 <.text+0x599af6>
14059a921:     	movq	%rax, 0x178(%rbp)
14059a928:     	movss	0x4(%r8), %xmm0
14059a92e:     	addss	%xmm11, %xmm0
14059a933:     	movd	%xmm0, %ecx
14059a937:     	shrl	$0xe, %ecx
14059a93a:     	movzbl	%cl, %ecx
14059a93d:     	cmpl	$0x6, %ecx
14059a940:     	movl	$0x6, %edx
14059a945:     	cmovael	%edx, %ecx
14059a948:     	movss	0x8(%r8), %xmm6
14059a94e:     	shll	$0x4, %ecx
14059a951:     	leaq	0x58bb6f8(%rip), %rax   # 0x145e56050
14059a958:     	movq	(%rcx,%rax), %rdx
14059a95c:     	movq	%rdx, 0x210(%rbp)
14059a963:     	movq	0x8(%rcx,%rax), %rdx
14059a968:     	movq	$0x1, 0x20(%rsp)
14059a971:     	movl	$0x1, %r9d
14059a977:     	leaq	0x180(%rbp), %rcx
14059a97e:     	movq	%rdx, 0x228(%rbp)
14059a985:     	xorl	%r8d, %r8d
14059a988:     	callq	0x14023ff50 <.text+0x23ef50>
14059a98d:     	movq	0x188(%rbp), %rax
14059a994:     	movq	%rax, 0x238(%rbp)
14059a99b:     	cmpl	$0x1, 0x180(%rbp)
14059a9a2:     	je	0x14059ad60 <.text+0x599d60>
14059a9a8:     	movq	0x190(%rbp), %rcx
14059a9af:     	movq	%rcx, 0x230(%rbp)
14059a9b6:     	movq	0x210(%rbp), %rdx
14059a9bd:     	movq	0x228(%rbp), %r8
14059a9c4:     	callq	0x145bc977b <.text+0x5bc877b>
14059a9c9:     	movq	0x150(%rbp), %rax
14059a9d0:     	movl	0x1fc(%rbp), %ecx
14059a9d6:     	movl	%ecx, (%rax)
14059a9d8:     	movb	$0x1, 0x246(%rbp)
14059a9df:     	movq	0x140(%rbp), %rcx
14059a9e6:     	movq	0x158(%rbp), %rdx
14059a9ed:     	movq	0x230(%rbp), %r8
14059a9f4:     	movq	0x228(%rbp), %r9
14059a9fb:     	callq	0x140573390 <.text+0x572390>
14059aa00:     	nop
14059aa01:     	movq	0x200(%rbp), %rax
14059aa08:     	movq	%rax, 0xd8(%rbp)
14059aa0f:     	movaps	-0x50(%rbp), %xmm1
14059aa13:     	movaps	-0x40(%rbp), %xmm0
14059aa17:     	movups	%xmm1, 0xe0(%rbp)
14059aa1e:     	cmpq	$0x0, -0x40(%rbp)
14059aa23:     	movq	0xc8(%rbp), %rax
14059aa2a:     	je	0x14059aa30 <.text+0x599a30>
14059aa2c:     	movq	-0x30(%rbp), %rax
14059aa30:     	movups	%xmm0, 0xf0(%rbp)
14059aa37:     	movq	%rax, 0xc8(%rbp)
14059aa3e:     	movq	%rax, 0x100(%rbp)
14059aa45:     	movq	0x208(%rbp), %rcx
14059aa4c:     	callq	0x1459d28e0 <.text+0x59d18e0>
14059aa51:     	nop
14059aa52:     	testb	$0x1, %al
14059aa54:     	movq	0x228(%rbp), %rdx
14059aa5b:     	jne	0x14059aa60 <.text+0x599a60>
14059aa5d:     	xorps	%xmm0, %xmm0
14059aa60:     	mulss	%xmm9, %xmm6
14059aa65:     	mulss	%xmm13, %xmm13
14059aa6a:     	minss	%xmm12, %xmm13
14059aa6f:     	mulss	%xmm6, %xmm13
14059aa74:     	movq	0x200(%rbp), %rax
14059aa7b:     	movabsq	$-0x61c8864680b583eb, %rcx # imm = 0x9E3779B97F4A7C15
14059aa85:     	xorq	%rcx, %rax
14059aa88:     	movq	0x238(%rbp), %rcx
14059aa8f:     	movq	%rcx, 0x180(%rbp)
14059aa96:     	movq	0x230(%rbp), %rcx
14059aa9d:     	movq	%rcx, 0x188(%rbp)
14059aaa4:     	movq	%rdx, 0x190(%rbp)
14059aaab:     	movq	%rax, 0x198(%rbp)
14059aab2:     	movss	%xmm0, 0x1a0(%rbp)
14059aaba:     	movss	%xmm13, 0x1a4(%rbp)
14059aac3:     	movl	$0x0, 0x1a8(%rbp)
14059aacd:     	movb	$0x0, 0x1b0(%rbp)
14059aad4:     	movb	$0x0, 0x246(%rbp)
14059aadb:     	leaq	0xd8(%rbp), %rcx
14059aae2:     	leaq	0x180(%rbp), %rdx
14059aae9:     	callq	0x140a87870 <.text+0xa86870>
14059aaee:     	nop
14059aaef:     	movq	0x178(%rbp), %rax
14059aaf6:     	cmpb	$0x0, (%rax)
14059aaf9:     	je	0x14059ab97 <.text+0x599b97>
14059aaff:     	movl	0x4(%rax), %r8d
14059ab03:     	movl	0x164(%rbp), %eax
14059ab09:     	movq	0xb8(%rbp), %rcx
14059ab10:     	movl	%eax, (%rcx)
14059ab12:     	movq	0x148(%rbp), %rax
14059ab19:     	movq	0x30(%rax), %r9
14059ab1d:     	movq	0x40(%rax), %r10
14059ab21:     	cmpq	0x20(%rax), %r9
14059ab25:     	jne	0x14059ab5d <.text+0x599b5d>
14059ab27:     	movq	0xc0(%rbp), %rcx
14059ab2e:     	movq	%r9, 0x228(%rbp)
14059ab35:     	movl	%r8d, 0x230(%rbp)
14059ab3c:     	movq	%r10, 0x238(%rbp)
14059ab43:     	callq	0x145bcb530 <.text+0x5bca530>
14059ab48:     	movq	0x238(%rbp), %r10
14059ab4f:     	movl	0x230(%rbp), %r8d
14059ab56:     	movq	0x228(%rbp), %r9
14059ab5d:     	movq	0x148(%rbp), %rdx
14059ab64:     	movq	0x28(%rdx), %rax
14059ab68:     	movq	%r9, %rcx
14059ab6b:     	shlq	$0x5, %rcx
14059ab6f:     	movl	$0x0, (%rax,%rcx)
14059ab76:     	movl	%r8d, 0x4(%rax,%rcx)
14059ab7b:     	movq	0x200(%rbp), %r8
14059ab82:     	movq	%r8, 0x8(%rax,%rcx)
14059ab87:     	movq	%r10, 0x18(%rax,%rcx)
14059ab8c:     	incq	%r9
14059ab8f:     	movq	%r9, 0x30(%rdx)
14059ab93:     	incq	0x40(%rdx)
14059ab97:     	movq	0x7a5c40a(%rip), %rax   # 0x147ff6fa8
14059ab9e:     	movq	(%rax), %rax
14059aba1:     	cmpq	$0x2, %rax
14059aba5:     	jae	0x14059a150 <.text+0x599150>
14059abab:     	movzbl	0x7a206ee(%rip), %edx   # 0x147fbb2a0
14059abb2:     	movzbl	%dl, %eax
14059abb5:     	leal	-0x1(%rax), %ecx
14059abb8:     	cmpl	$0x2, %ecx
14059abbb:     	jae	0x14059ad22 <.text+0x599d22>
14059abc1:     	movq	0x7a206c8(%rip), %rcx   # 0x147fbb290
14059abc8:     	callq	0x144c46ce0 <.text+0x4c45ce0>
14059abcd:     	testb	%al, %al
14059abcf:     	je	0x14059a150 <.text+0x599150>
14059abd5:     	movq	0x218(%rbp), %rcx
14059abdc:     	leaq	0x38(%rcx), %rax
14059abe0:     	movq	%rax, 0x230(%rbp)
14059abe7:     	movq	0x7a206a2(%rip), %rax   # 0x147fbb290
14059abee:     	addq	$0x30, %rax
14059abf2:     	movq	%rax, 0x228(%rbp)
14059abf9:     	leaq	0x30(%rcx), %rax
14059abfd:     	movq	%rax, 0x238(%rbp)
14059ac04:     	addq	$0x34, %rcx
14059ac08:     	movq	%rcx, 0x218(%rbp)
14059ac0f:     	movq	0x208(%rbp), %rcx
14059ac16:     	callq	0x1459d28e0 <.text+0x59d18e0>
14059ac1b:     	movl	%eax, 0x108(%rbp)
14059ac21:     	leaq	0x1f0(%rbp), %rax
14059ac28:     	movq	%rax, 0x180(%rbp)
14059ac2f:     	leaq	0x561334a(%rip), %rax   # 0x145badf80 <.text+0x5bacf80>
14059ac36:     	movq	%rax, 0x188(%rbp)
14059ac3d:     	movq	0x238(%rbp), %rcx
14059ac44:     	movq	%rcx, 0x190(%rbp)
14059ac4b:     	movq	%rax, 0x198(%rbp)
14059ac52:     	movq	0x218(%rbp), %rcx
14059ac59:     	movq	%rcx, 0x1a0(%rbp)
14059ac60:     	movq	%rax, 0x1a8(%rbp)
14059ac67:     	movq	0x230(%rbp), %rcx
14059ac6e:     	movq	%rcx, 0x1b0(%rbp)
14059ac75:     	movss	%xmm0, 0x10c(%rbp)
14059ac7d:     	movq	%rax, 0x1b8(%rbp)
14059ac84:     	leaq	0x108(%rbp), %rax
14059ac8b:     	movq	%rax, 0x1c0(%rbp)
14059ac92:     	leaq	0x112b7(%rip), %rax     # 0x1405abf50 <.text+0x5aaf50>
14059ac99:     	movq	%rax, 0x1c8(%rbp)
14059aca0:     	leaq	0x58bb419(%rip), %rax   # 0x145e560c0
14059aca7:     	movq	%rax, 0x110(%rbp)
14059acae:     	leaq	0x180(%rbp), %rax
14059acb5:     	movq	%rax, 0x118(%rbp)
14059acbc:     	leaq	0x110(%rbp), %rax
14059acc3:     	movq	%rax, 0x120(%rbp)
14059acca:     	leaq	0x58b227f(%rip), %rax   # 0x145e4cf50
14059acd1:     	movq	%rax, 0x128(%rbp)
14059acd8:     	movq	$0x1, 0xd8(%rbp)
14059ace3:     	leaq	0x120(%rbp), %rax
14059acea:     	movq	%rax, 0xe0(%rbp)
14059acf1:     	movq	$0x1, 0xe8(%rbp)
14059acfc:     	movq	0x228(%rbp), %rax
14059ad03:     	movq	%rax, 0xf0(%rbp)
14059ad0a:     	movq	0x7a2057f(%rip), %rcx   # 0x147fbb290
14059ad11:     	leaq	0xd8(%rbp), %rdx
14059ad18:     	callq	0x144c48500 <.text+0x4c47500>
14059ad1d:     	jmp	0x14059a150 <.text+0x599150>
14059ad22:     	testl	%eax, %eax
14059ad24:     	je	0x14059a150 <.text+0x599150>
14059ad2a:     	leaq	0x7a2055f(%rip), %rcx   # 0x147fbb290
14059ad31:     	callq	0x145d15470 <.text+0x5d14470>
14059ad36:     	movl	%eax, %edx
14059ad38:     	testb	%al, %al
14059ad3a:     	jne	0x14059abc1 <.text+0x599bc1>
14059ad40:     	jmp	0x14059a150 <.text+0x599150>
14059ad45:     	leaq	0x7a2052c(%rip), %rcx   # 0x147fbb278
14059ad4c:     	callq	0x145d15470 <.text+0x5d14470>
14059ad51:     	movl	%eax, %edx
14059ad53:     	testb	%al, %al
14059ad55:     	jne	0x14059a532 <.text+0x599532>
14059ad5b:     	jmp	0x14059a150 <.text+0x599150>
14059ad60:     	movq	0x190(%rbp), %rdx
14059ad67:     	movq	0x238(%rbp), %rcx
14059ad6e:     	callq	0x145d6944b <.text+0x5d6844b>
14059ad73:     	ud2
14059ad75:     	movq	0x190(%rbp), %rdx
14059ad7c:     	movq	0x210(%rbp), %rcx
14059ad83:     	callq	0x145d6944b <.text+0x5d6844b>
14059ad88:     	ud2

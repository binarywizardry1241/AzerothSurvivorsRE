
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e6f70:     	pushq	%r15
1454e6f72:     	pushq	%r14
1454e6f74:     	pushq	%r13
1454e6f76:     	pushq	%r12
1454e6f78:     	pushq	%rsi
1454e6f79:     	pushq	%rdi
1454e6f7a:     	pushq	%rbx
1454e6f7b:     	subq	$0x110, %rsp            # imm = 0x110
1454e6f82:     	movaps	%xmm7, 0x100(%rsp)
1454e6f8a:     	movaps	%xmm6, 0xf0(%rsp)
1454e6f92:     	movq	0x2b8(%rcx), %rax
1454e6f99:     	testq	%rax, %rax
1454e6f9c:     	je	0x1454e73b8 <.text+0x54e63b8>
1454e6fa2:     	movq	0x2b0(%rcx), %r8
1454e6fa9:     	imulq	$0x58, %rax, %r10
1454e6fad:     	xorl	%r9d, %r9d
1454e6fb0:     	movabsq	$0x70726f6d796c6f70, %r11 # imm = 0x70726F6D796C6F70
1454e6fba:     	jmp	0x1454e6fcd <.text+0x54e5fcd>
1454e6fbc:     	nopl	(%rax)
1454e6fc0:     	addq	$0x58, %r9
1454e6fc4:     	cmpq	%r9, %r10
1454e6fc7:     	je	0x1454e73b8 <.text+0x54e63b8>
1454e6fcd:     	movq	(%r8,%r9), %r12
1454e6fd1:     	cmpq	$0x9, 0x8(%r12)
1454e6fd7:     	jne	0x1454e6fc0 <.text+0x54e5fc0>
1454e6fd9:     	movq	(%r12), %rax
1454e6fdd:     	movq	(%rax), %rsi
1454e6fe0:     	xorq	%r11, %rsi
1454e6fe3:     	movzbl	0x8(%rax), %edi
1454e6fe7:     	xorq	$0x68, %rdi
1454e6feb:     	orq	%rsi, %rdi
1454e6fee:     	jne	0x1454e6fc0 <.text+0x54e5fc0>
1454e6ff0:     	movl	0x8(%r8,%r9), %r10d
1454e6ff5:     	movss	0x14(%r8,%r9), %xmm0
1454e6ffc:     	movl	0x18(%r8,%r9), %r11d
1454e7001:     	movl	0x34(%r8,%r9), %esi
1454e7006:     	movl	%esi, 0xcc(%rsp)
1454e700d:     	movups	0x24(%r8,%r9), %xmm1
1454e7013:     	movups	%xmm1, 0xbc(%rsp)
1454e701b:     	movups	0x38(%r8,%r9), %xmm1
1454e7021:     	movups	0x44(%r8,%r9), %xmm2
1454e7027:     	movups	%xmm1, 0xd0(%rsp)
1454e702f:     	movups	%xmm2, 0xdc(%rsp)
1454e7037:     	movq	%r12, 0x98(%rsp)
1454e703f:     	movl	%r10d, 0xa0(%rsp)
1454e7047:     	movsd	0xc(%r8,%r9), %xmm1
1454e704e:     	movsd	%xmm1, 0xa4(%rsp)
1454e7057:     	movss	%xmm0, 0xac(%rsp)
1454e7060:     	movl	%r11d, 0xb0(%rsp)
1454e7068:     	movsd	0x1c(%r8,%r9), %xmm0
1454e706f:     	movsd	%xmm0, 0xb4(%rsp)
1454e7078:     	cmpq	$0x2, 0x7c0(%rcx)
1454e7080:     	ja	0x1454e73b8 <.text+0x54e63b8>
1454e7086:     	movss	0x934(%rcx), %xmm6
1454e708e:     	movq	0x748(%rcx), %r9
1454e7095:     	movss	0x521213(%rip), %xmm0   # 0x145a082b0
1454e709d:     	testq	%r9, %r9
1454e70a0:     	je	0x1454e70f4 <.text+0x54e60f4>
1454e70a2:     	movq	0x740(%rcx), %r8
1454e70a9:     	shlq	$0x3, %r9
1454e70ad:     	leaq	(%r9,%r9,2), %r10
1454e70b1:     	xorl	%r9d, %r9d
1454e70b4:     	jmp	0x1454e70c9 <.text+0x54e60c9>
1454e70b6:     	nopw	%cs:(%rax,%rax)
1454e70c0:     	addq	$0x18, %r9
1454e70c4:     	cmpq	%r9, %r10
1454e70c7:     	je	0x1454e70f4 <.text+0x54e60f4>
1454e70c9:     	cmpq	$0x9, 0x8(%r8,%r9)
1454e70cf:     	jne	0x1454e70c0 <.text+0x54e60c0>
1454e70d1:     	movq	(%r8,%r9), %r11
1454e70d5:     	movq	(%r11), %rsi
1454e70d8:     	xorq	(%rax), %rsi
1454e70db:     	movzbl	0x8(%r11), %r11d
1454e70e0:     	xorb	0x8(%rax), %r11b
1454e70e4:     	movzbl	%r11b, %r11d
1454e70e8:     	orq	%rsi, %r11
1454e70eb:     	jne	0x1454e70c0 <.text+0x54e60c0>
1454e70ed:     	movss	0x10(%r8,%r9), %xmm0
1454e70f4:     	ucomiss	%xmm0, %xmm6
1454e70f7:     	jb	0x1454e73b8 <.text+0x54e63b8>
1454e70fd:     	leaq	0x7b0(%rcx), %rsi
1454e7104:     	movq	0x4e0(%rcx), %rax
1454e710b:     	imulq	$0x160, 0x4e8(%rcx), %r9 # imm = 0x160
1454e7116:     	xorl	%r8d, %r8d
1454e7119:     	movq	%rax, %r10
1454e711c:     	nopl	(%rax)
1454e7120:     	cmpq	%r8, %r9
1454e7123:     	je	0x1454e73b8 <.text+0x54e63b8>
1454e7129:     	addq	$0x160, %r8             # imm = 0x160
1454e7130:     	cmpq	%rdx, 0x88(%r10)
1454e7137:     	leaq	0x160(%r10), %r10
1454e713e:     	jne	0x1454e7120 <.text+0x54e6120>
1454e7140:     	cmpb	$0x0, -0xf8(%rax,%r8)
1454e7149:     	jne	0x1454e73b8 <.text+0x54e63b8>
1454e714f:     	cmpq	$-0x1, -0x148(%rax,%r8)
1454e7158:     	jne	0x1454e73b8 <.text+0x54e63b8>
1454e715e:     	cmpq	$-0x1, -0x120(%rax,%r8)
1454e7167:     	jne	0x1454e73b8 <.text+0x54e63b8>
1454e716d:     	ucomiss	-0x20(%rax,%r8), %xmm6
1454e7173:     	jb	0x1454e73b8 <.text+0x54e63b8>
1454e7179:     	leaq	0x8a0(%rcx), %rax
1454e7180:     	movq	%rcx, %rdi
1454e7183:     	movq	%rax, %rcx
1454e7186:     	movq	%rdx, %r13
1454e7189:     	callq	0x145497ad0 <.text+0x5496ad0>
1454e718e:     	shrl	$0x8, %eax
1454e7191:     	xorps	%xmm0, %xmm0
1454e7194:     	cvtsi2ss	%eax, %xmm0
1454e7198:     	mulss	0x521200(%rip), %xmm0   # 0x145a083a0
1454e71a0:     	ucomiss	0x420389(%rip), %xmm0   # 0x145907530
1454e71a7:     	jae	0x1454e73b8 <.text+0x54e63b8>
1454e71ad:     	leaq	0x98(%rsp), %rdx
1454e71b5:     	movq	%rdi, %rcx
1454e71b8:     	callq	0x1454e6b90 <.text+0x54e5b90>
1454e71bd:     	movq	%rdi, %rax
1454e71c0:     	movq	%r13, %r15
1454e71c3:     	movq	$-0x160, %rcx           # imm = 0xFEA0
1454e71ca:     	addq	0x4e0(%rdi), %rcx
1454e71d1:     	imulq	$0x160, 0x4e8(%rdi), %rdx # imm = 0x160
1454e71dc:     	testq	%rdx, %rdx
1454e71df:     	je	0x1454e72ef <.text+0x54e62ef>
1454e71e5:     	leaq	0x160(%rcx), %rbx
1454e71ec:     	addq	$-0x160, %rdx           # imm = 0xFEA0
1454e71f3:     	cmpq	%r15, 0x1e8(%rcx)
1454e71fa:     	movq	%rbx, %rcx
1454e71fd:     	jne	0x1454e71dc <.text+0x54e61dc>
1454e71ff:     	movss	0x42e5f9(%rip), %xmm0   # 0x145915800
1454e7207:     	addss	%xmm6, %xmm0
1454e720b:     	movss	%xmm0, 0x140(%rbx)
1454e7213:     	movl	$0x0, 0x70(%rbx)
1454e721a:     	movss	0x458a52(%rip), %xmm0   # 0x14593fc74
1454e7222:     	addss	%xmm6, %xmm0
1454e7226:     	movss	%xmm0, 0x12c(%rbx)
1454e722e:     	movq	0x898(%rax), %r14
1454e7235:     	addq	$0x10, %r14
1454e7239:     	leaq	0x78(%rsp), %rcx
1454e723e:     	movq	%rbx, %rdx
1454e7241:     	movaps	%xmm6, %xmm2
1454e7244:     	callq	0x145450a50 <.text+0x544fa50>
1454e7249:     	movsd	0x78(%rsp), %xmm7
1454e724f:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
1454e7253:     	movq	%r14, %rcx
1454e7256:     	movaps	%xmm7, %xmm1
1454e7259:     	callq	0x14552a140 <.text+0x5529140>
1454e725e:     	testb	$0x1, %al
1454e7260:     	jne	0x1454e726b <.text+0x54e626b>
1454e7262:     	movss	0x80(%rsp), %xmm0
1454e726b:     	movsd	%xmm7, 0x40(%rsp)
1454e7271:     	movss	%xmm0, 0x48(%rsp)
1454e7277:     	movl	0x48(%rsp), %eax
1454e727b:     	movl	%eax, 0x114(%rbx)
1454e7281:     	movq	0x40(%rsp), %rax
1454e7286:     	movq	%rax, 0x10c(%rbx)
1454e728d:     	movq	0x40(%rsp), %rax
1454e7292:     	movq	%rax, 0x118(%rbx)
1454e7299:     	movl	0x48(%rsp), %eax
1454e729d:     	movl	%eax, 0x120(%rbx)
1454e72a3:     	xorps	%xmm0, %xmm0
1454e72a6:     	movss	%xmm6, %xmm0            # xmm0 = xmm6[0],xmm0[1,2,3]
1454e72aa:     	movlps	%xmm0, 0x124(%rbx)
1454e72b1:     	movl	0x958(%rdi), %r9d
1454e72b8:     	incl	%r9d
1454e72bb:     	movl	%r9d, 0x958(%rdi)
1454e72c2:     	leaq	0x550(%rdi), %rbx
1454e72c9:     	leaq	0x78(%rsp), %r14
1454e72ce:     	leaq	0x40(%rsp), %r8
1454e72d3:     	movq	%r14, %rcx
1454e72d6:     	movq	%r13, %r15
1454e72d9:     	movq	%r13, %rdx
1454e72dc:     	callq	0x14545ff20 <.text+0x545ef20>
1454e72e1:     	movq	%rbx, %rcx
1454e72e4:     	movq	%r14, %rdx
1454e72e7:     	callq	0x140be62c0 <.text+0xbe52c0>
1454e72ec:     	movq	%rdi, %rax
1454e72ef:     	movq	0x7c0(%rax), %rbx
1454e72f6:     	cmpq	0x7b0(%rax), %rbx
1454e72fd:     	jne	0x1454e730d <.text+0x54e630d>
1454e72ff:     	movq	%rsi, %rcx
1454e7302:     	callq	0x145774550 <.text+0x5773550>
1454e7307:     	movq	%rdi, %rax
1454e730a:     	movq	%r13, %r15
1454e730d:     	movq	0x7b8(%rax), %rcx
1454e7314:     	movq	%r15, (%rcx,%rbx,8)
1454e7318:     	incq	%rbx
1454e731b:     	movq	%rbx, 0x7c0(%rax)
1454e7322:     	movss	0x420166(%rip), %xmm3   # 0x145907490
1454e732a:     	movq	%rax, %rdi
1454e732d:     	movq	%rax, %rcx
1454e7330:     	movq	%r15, %rdx
1454e7333:     	movl	$0x358, %r8d            # imm = 0x358
1454e7339:     	callq	0x1454e75f0 <.text+0x54e65f0>
1454e733e:     	leaq	0x550(%rdi), %rbx
1454e7345:     	movq	0x3e8(%rdi), %rdx
1454e734c:     	movl	0x40(%r12), %r8d
1454e7351:     	movq	%r15, 0x50(%rsp)
1454e7356:     	movq	%r15, 0x60(%rsp)
1454e735b:     	movl	$0x0, 0x58(%rsp)
1454e7363:     	movl	$0x0, 0x6c(%rsp)
1454e736b:     	leaq	0x6c(%rsp), %rax
1454e7370:     	movq	%rax, 0x30(%rsp)
1454e7375:     	leaq	0x58(%rsp), %rax
1454e737a:     	movq	%rax, 0x28(%rsp)
1454e737f:     	movq	$0x1, 0x20(%rsp)
1454e7388:     	leaq	0x78(%rsp), %r14
1454e738d:     	leaq	0x50(%rsp), %r9
1454e7392:     	movq	%r14, %rcx
1454e7395:     	callq	0x145466ab0 <.text+0x5465ab0>
1454e739a:     	movq	%rbx, %rcx
1454e739d:     	movq	%r14, %rdx
1454e73a0:     	callq	0x140be62c0 <.text+0xbe52c0>
1454e73a5:     	movl	0x40(%r12), %r8d
1454e73aa:     	movq	%rdi, %rcx
1454e73ad:     	movq	%r15, %rdx
1454e73b0:     	movb	$0x1, %r9b
1454e73b3:     	callq	0x1454e3550 <.text+0x54e2550>
1454e73b8:     	movaps	0xf0(%rsp), %xmm6
1454e73c0:     	movaps	0x100(%rsp), %xmm7
1454e73c8:     	addq	$0x110, %rsp            # imm = 0x110
1454e73cf:     	popq	%rbx
1454e73d0:     	popq	%rdi
1454e73d1:     	popq	%rsi
1454e73d2:     	popq	%r12
1454e73d4:     	popq	%r13
1454e73d6:     	popq	%r14
1454e73d8:     	popq	%r15
1454e73da:     	retq


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1408d8e10:     	pushq	%rbp
1408d8e11:     	pushq	%r15
1408d8e13:     	pushq	%r14
1408d8e15:     	pushq	%r13
1408d8e17:     	pushq	%r12
1408d8e19:     	pushq	%rsi
1408d8e1a:     	pushq	%rdi
1408d8e1b:     	pushq	%rbx
1408d8e1c:     	subq	$0x178, %rsp            # imm = 0x178
1408d8e23:     	leaq	0x80(%rsp), %rbp
1408d8e2b:     	movdqa	%xmm8, 0xe0(%rbp)
1408d8e34:     	movdqa	%xmm7, 0xd0(%rbp)
1408d8e3c:     	movdqa	%xmm6, 0xc0(%rbp)
1408d8e44:     	movq	$-0x2, 0xb8(%rbp)
1408d8e4f:     	movq	%rdx, %rsi
1408d8e52:     	movq	%rcx, %rdi
1408d8e55:     	cmpl	$0x1, 0x18(%rdx)
1408d8e59:     	jne	0x1408d8e6c <.text+0x8d7e6c>
1408d8e5b:     	movq	(%rdi), %rax
1408d8e5e:     	movss	(%rax), %xmm0
1408d8e62:     	ucomiss	0x1c(%rsi), %xmm0
1408d8e66:     	jae	0x1408d9093 <.text+0x8d8093>
1408d8e6c:     	cmpl	$0x0, 0x20(%rsi)
1408d8e70:     	je	0x1408d8f4e <.text+0x8d7f4e>
1408d8e76:     	movq	0x20(%rsi), %rax
1408d8e7a:     	movl	%eax, %ecx
1408d8e7c:     	notl	%ecx
1408d8e7e:     	movq	0x10(%rdi), %rdx
1408d8e82:     	movq	(%rdx), %rdx
1408d8e85:     	shrq	$0x20, %rax
1408d8e89:     	leaq	(%rcx,%rcx,2), %r8
1408d8e8d:     	shlq	$0x3, %r8
1408d8e91:     	addq	0x8(%rdx), %r8
1408d8e95:     	cmpq	0x10(%rdx), %rcx
1408d8e99:     	leaq	0x5614a70(%rip), %rcx   # 0x145eed910
1408d8ea0:     	cmovbq	%r8, %rcx
1408d8ea4:     	movb	$0x1, %r14b
1408d8ea7:     	cmpl	%eax, 0x10(%rcx)
1408d8eaa:     	je	0x1408d97c9 <.text+0x8d87c9>
1408d8eb0:     	cmpb	$0x1, 0x32(%rsi)
1408d8eb4:     	jne	0x1408d91ba <.text+0x8d81ba>
1408d8eba:     	cmpb	$0x0, 0x34(%rsi)
1408d8ebe:     	jne	0x1408d91ba <.text+0x8d81ba>
1408d8ec4:     	movl	$0x0, 0x20(%rsi)
1408d8ecb:     	callq	0x1422a4f70 <.text+0x22a3f70>
1408d8ed0:     	testb	%al, %al
1408d8ed2:     	je	0x1408d8f4e <.text+0x8d7f4e>
1408d8ed4:     	movq	0x18(%rdi), %rax
1408d8ed8:     	movq	%rax, 0x50(%rbp)
1408d8edc:     	leaq	0x45338dd(%rip), %rax   # 0x144e0c7c0 <.text+0x4e0b7c0>
1408d8ee3:     	movq	%rax, 0x58(%rbp)
1408d8ee7:     	movq	%rsi, 0x60(%rbp)
1408d8eeb:     	leaq	-0x8d6e12(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
1408d8ef2:     	movq	%rax, 0x68(%rbp)
1408d8ef6:     	leaq	0x5614398(%rip), %rdx   # 0x145eed295
1408d8efd:     	leaq	0x20(%rbp), %rcx
1408d8f01:     	leaq	0x50(%rbp), %r8
1408d8f05:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1408d8f0a:     	movq	0x20(%rbp), %rax
1408d8f0e:     	movq	%rax, 0xb0(%rbp)
1408d8f15:     	movq	0x28(%rbp), %r8
1408d8f19:     	movq	0x30(%rbp), %r9
1408d8f1d:     	leaq	0x561436f(%rip), %rcx   # 0x145eed293
1408d8f24:     	movl	$0x2, %edx
1408d8f29:     	movq	%r8, 0x10(%rbp)
1408d8f2d:     	callq	0x1422a4be0 <.text+0x22a3be0>
1408d8f32:     	nop
1408d8f33:     	movq	0xb0(%rbp), %rdx
1408d8f3a:     	testq	%rdx, %rdx
1408d8f3d:     	je	0x1408d8f4e <.text+0x8d7f4e>
1408d8f3f:     	movl	$0x1, %r8d
1408d8f45:     	movq	0x10(%rbp), %rcx
1408d8f49:     	callq	0x1400021d0 <.text+0x11d0>
1408d8f4e:     	cmpb	$0x0, 0x32(%rsi)
1408d8f52:     	jne	0x1408d8f75 <.text+0x8d7f75>
1408d8f54:     	cmpl	$0x0, 0x18(%rsi)
1408d8f58:     	jne	0x1408d8f75 <.text+0x8d7f75>
1408d8f5a:     	movq	(%rdi), %rax
1408d8f5d:     	movss	(%rax), %xmm0
1408d8f61:     	addss	0x54946e7(%rip), %xmm0  # 0x145d6d650
1408d8f69:     	movl	$0x1, 0x18(%rsi)
1408d8f70:     	movss	%xmm0, 0x1c(%rsi)
1408d8f75:     	movq	0x20(%rdi), %rbx
1408d8f79:     	movl	0x1c(%rbx), %eax
1408d8f7c:     	movq	0x10(%rbx), %rcx
1408d8f80:     	movl	%eax, (%rcx)
1408d8f82:     	movq	(%rbx), %rcx
1408d8f85:     	movq	0x28(%rdi), %rax
1408d8f89:     	movq	(%rax), %rdx
1408d8f8c:     	movq	0x8(%rsi), %r8
1408d8f90:     	movq	0x10(%rsi), %r9
1408d8f94:     	callq	0x140573390 <.text+0x572390>
1408d8f99:     	movq	(%rbx), %rbx
1408d8f9c:     	movb	$0x1, %r14b
1408d8f9f:     	cmpq	$0x0, 0x18(%rbx)
1408d8fa4:     	je	0x1408d97c9 <.text+0x8d87c9>
1408d8faa:     	leaq	0x32(%rsi), %rax
1408d8fae:     	movq	%rax, 0x10(%rbp)
1408d8fb2:     	leaq	0x20(%rbx), %rcx
1408d8fb6:     	movq	%rsi, %rdx
1408d8fb9:     	callq	0x1402510b0 <.text+0x2500b0>
1408d8fbe:     	movq	%rax, %rcx
1408d8fc1:     	shrq	$0x39, %rcx
1408d8fc5:     	movq	(%rbx), %r12
1408d8fc8:     	movq	0x8(%rbx), %r13
1408d8fcc:     	movd	%ecx, %xmm0
1408d8fd0:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1408d8fd4:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1408d8fd9:     	pshufd	$0x44, %xmm0, %xmm6     # xmm6 = xmm0[0,1,0,1]
1408d8fde:     	movq	0x8(%rsi), %r14
1408d8fe2:     	movq	0x10(%rsi), %r15
1408d8fe6:     	xorl	%edx, %edx
1408d8fe8:     	pcmpeqd	%xmm7, %xmm7
1408d8fec:     	andq	%r13, %rax
1408d8fef:     	movdqu	(%r12,%rax), %xmm8
1408d8ff5:     	movdqa	%xmm8, %xmm0
1408d8ffa:     	pcmpeqb	%xmm6, %xmm0
1408d8ffe:     	pmovmskb	%xmm0, %ebx
1408d9002:     	testl	%ebx, %ebx
1408d9004:     	je	0x1408d9071 <.text+0x8d8071>
1408d9006:     	movq	%rax, 0xa0(%rbp)
1408d900d:     	movq	%rdx, 0xa8(%rbp)
1408d9014:     	tzcntl	%ebx, %ecx
1408d9018:     	addq	%rax, %rcx
1408d901b:     	andq	%r13, %rcx
1408d901e:     	negq	%rcx
1408d9021:     	imulq	$0x348, %rcx, %rax      # imm = 0x348
1408d9028:     	cmpq	-0x338(%r12,%rax), %r15
1408d9030:     	jne	0x1408d9059 <.text+0x8d8059>
1408d9032:     	addq	%r12, %rax
1408d9035:     	movq	%rax, 0xb0(%rbp)
1408d903c:     	movq	-0x340(%rax), %rdx
1408d9043:     	movq	%r14, %rcx
1408d9046:     	movq	%r15, %r8
1408d9049:     	callq	0x145bc9787 <.text+0x5bc8787>
1408d904e:     	movq	0xb0(%rbp), %rcx
1408d9055:     	testl	%eax, %eax
1408d9057:     	je	0x1408d90c7 <.text+0x8d80c7>
1408d9059:     	leal	-0x1(%rbx), %eax
1408d905c:     	andw	%bx, %ax
1408d905f:     	movl	%eax, %ebx
1408d9061:     	movq	0xa0(%rbp), %rax
1408d9068:     	movq	0xa8(%rbp), %rdx
1408d906f:     	jne	0x1408d9014 <.text+0x8d8014>
1408d9071:     	pcmpeqb	%xmm7, %xmm8
1408d9076:     	pmovmskb	%xmm8, %ecx
1408d907b:     	testl	%ecx, %ecx
1408d907d:     	jne	0x1408d97c6 <.text+0x8d87c6>
1408d9083:     	addq	%rdx, %rax
1408d9086:     	addq	$0x10, %rax
1408d908a:     	addq	$0x10, %rdx
1408d908e:     	jmp	0x1408d8fec <.text+0x8d7fec>
1408d9093:     	cmpl	$0x0, 0x20(%rsi)
1408d9097:     	je	0x1408d9261 <.text+0x8d8261>
1408d909d:     	movq	0x20(%rsi), %rbx
1408d90a1:     	movq	0x8(%rdi), %rcx
1408d90a5:     	movq	%rbx, %rdx
1408d90a8:     	callq	0x140576850 <.text+0x575850>
1408d90ad:     	movq	0x10(%rdi), %rcx
1408d90b1:     	movq	0x10(%rcx), %rax
1408d90b5:     	testq	%rax, %rax
1408d90b8:     	je	0x1408d9236 <.text+0x8d8236>
1408d90be:     	movq	0x20(%rcx), %rdx
1408d90c2:     	jmp	0x1408d9236 <.text+0x8d8236>
1408d90c7:     	cmpq	$-0x1, -0x160(%rcx)
1408d90cf:     	je	0x1408d97c6 <.text+0x8d87c6>
1408d90d5:     	movzwl	0x30(%rsi), %eax
1408d90d9:     	cmpw	$-0x1, %ax
1408d90dd:     	movb	$0x1, %r14b
1408d90e0:     	je	0x1408d92e4 <.text+0x8d82e4>
1408d90e6:     	movq	0x30(%rdi), %rcx
1408d90ea:     	cmpb	$0x0, (%rcx)
1408d90ed:     	je	0x1408d97c9 <.text+0x8d87c9>
1408d90f3:     	movq	0x48(%rdi), %rcx
1408d90f7:     	movq	(%rcx), %r8
1408d90fa:     	movq	0x10(%rdi), %rbx
1408d90fe:     	movq	0x18(%rdi), %r15
1408d9102:     	testq	%r8, %r8
1408d9105:     	movq	%r15, 0x18(%rbp)
1408d9109:     	je	0x1408d9308 <.text+0x8d8308>
1408d910f:     	movq	0x50(%rdi), %r14
1408d9113:     	movw	$0x1, 0x70(%rbp)
1408d9119:     	movw	%ax, 0x72(%rbp)
1408d911d:     	movq	$0x1, 0x50(%rbp)
1408d9125:     	movq	$0x0, 0x58(%rbp)
1408d912d:     	movq	$0x2, 0x60(%rbp)
1408d9135:     	movl	$0x13000f, 0x68(%rbp)   # imm = 0x13000F
1408d913c:     	leaq	0x20(%rbp), %rcx
1408d9140:     	leaq	0x50(%rbp), %rdx
1408d9144:     	callq	0x140f8a6c0 <.text+0xf896c0>
1408d9149:     	cmpl	$0x1, 0x20(%rbp)
1408d914d:     	jne	0x1408d9308 <.text+0x8d8308>
1408d9153:     	movzwl	0x24(%rbp), %r12d
1408d9158:     	movzwl	0x28(%rbp), %r9d
1408d915d:     	movq	0x30(%rbp), %rax
1408d9161:     	movq	%rax, -0xa(%rbp)
1408d9165:     	movq	0x2a(%rbp), %rax
1408d9169:     	movq	%rax, -0x10(%rbp)
1408d916d:     	cmpq	$0x0, (%r14)
1408d9171:     	je	0x1408d9308 <.text+0x8d8308>
1408d9177:     	movl	0x1c(%r14), %eax
1408d917b:     	movq	0x10(%r14), %rcx
1408d917f:     	movl	%eax, (%rcx)
1408d9181:     	movq	(%r14), %rcx
1408d9184:     	movq	(%r15), %r8
1408d9187:     	movq	%rbx, %rdx
1408d918a:     	callq	0x1415d4990 <.text+0x15d3990>
1408d918f:     	testl	%eax, %eax
1408d9191:     	je	0x1408d9308 <.text+0x8d8308>
1408d9197:     	movq	%rax, -0x18(%rbp)
1408d919b:     	movl	-0x6(%rbp), %eax
1408d919e:     	movl	%eax, 0x8(%rbp)
1408d91a1:     	movq	-0xe(%rbp), %rax
1408d91a5:     	movq	%rax, (%rbp)
1408d91a9:     	cmpw	$0x13, %r12w
1408d91ae:     	sete	0xa0(%rbp)
1408d91b5:     	jmp	0x1408d9325 <.text+0x8d8325>
1408d91ba:     	callq	0x1422a4f70 <.text+0x22a3f70>
1408d91bf:     	testb	%al, %al
1408d91c1:     	je	0x1408d92dc <.text+0x8d82dc>
1408d91c7:     	movq	0x18(%rdi), %rax
1408d91cb:     	movq	%rax, 0x50(%rbp)
1408d91cf:     	leaq	0x45335ea(%rip), %rax   # 0x144e0c7c0 <.text+0x4e0b7c0>
1408d91d6:     	movq	%rax, 0x58(%rbp)
1408d91da:     	movq	%rsi, 0x60(%rbp)
1408d91de:     	addq	$0x34, %rsi
1408d91e2:     	leaq	-0x8d7109(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
1408d91e9:     	movq	%rax, 0x68(%rbp)
1408d91ed:     	movq	%rsi, 0x70(%rbp)
1408d91f1:     	leaq	0x52d5db8(%rip), %rax   # 0x145baefb0 <.text+0x5badfb0>
1408d91f8:     	movq	%rax, 0x78(%rbp)
1408d91fc:     	leaq	0x56140bb(%rip), %rdx   # 0x145eed2be
1408d9203:     	leaq	0x20(%rbp), %rcx
1408d9207:     	leaq	0x50(%rbp), %r8
1408d920b:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1408d9210:     	movq	0x28(%rbp), %r8
1408d9214:     	movq	0x30(%rbp), %r9
1408d9218:     	leaq	0x5614074(%rip), %rcx   # 0x145eed293
1408d921f:     	movl	$0x2, %edx
1408d9224:     	movq	%r8, 0xb0(%rbp)
1408d922b:     	callq	0x1422a4be0 <.text+0x22a3be0>
1408d9230:     	nop
1408d9231:     	jmp	0x1408d92c1 <.text+0x8d82c1>
1408d9236:     	movq	0x18(%rcx), %r8
1408d923a:     	movups	(%rcx), %xmm0
1408d923d:     	movq	%rbx, 0x50(%rbp)
1408d9241:     	movups	%xmm0, 0x58(%rbp)
1408d9245:     	movq	%rax, 0x68(%rbp)
1408d9249:     	movq	%r8, 0x70(%rbp)
1408d924d:     	movq	%rdx, 0x78(%rbp)
1408d9251:     	leaq	0x5614008(%rip), %rdx   # 0x145eed260
1408d9258:     	leaq	0x50(%rbp), %rcx
1408d925c:     	callq	0x144e5ebd0 <.text+0x4e5dbd0>
1408d9261:     	callq	0x1422a4f70 <.text+0x22a3f70>
1408d9266:     	testb	%al, %al
1408d9268:     	je	0x1408d92dc <.text+0x8d82dc>
1408d926a:     	movq	0x18(%rdi), %rax
1408d926e:     	movq	%rax, 0x50(%rbp)
1408d9272:     	leaq	0x4533547(%rip), %rax   # 0x144e0c7c0 <.text+0x4e0b7c0>
1408d9279:     	movq	%rax, 0x58(%rbp)
1408d927d:     	movq	%rsi, 0x60(%rbp)
1408d9281:     	leaq	-0x8d71a8(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
1408d9288:     	movq	%rax, 0x68(%rbp)
1408d928c:     	leaq	0x5613fe5(%rip), %rdx   # 0x145eed278
1408d9293:     	leaq	0x20(%rbp), %rcx
1408d9297:     	leaq	0x50(%rbp), %r8
1408d929b:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1408d92a0:     	movq	0x28(%rbp), %r8
1408d92a4:     	movq	0x30(%rbp), %r9
1408d92a8:     	leaq	0x5613fe4(%rip), %rcx   # 0x145eed293
1408d92af:     	movl	$0x2, %edx
1408d92b4:     	movq	%r8, 0xb0(%rbp)
1408d92bb:     	callq	0x1422a4be0 <.text+0x22a3be0>
1408d92c0:     	nop
1408d92c1:     	movq	0x20(%rbp), %rdx
1408d92c5:     	testq	%rdx, %rdx
1408d92c8:     	je	0x1408d92dc <.text+0x8d82dc>
1408d92ca:     	movl	$0x1, %r8d
1408d92d0:     	movq	0xb0(%rbp), %rcx
1408d92d7:     	callq	0x1400021d0 <.text+0x11d0>
1408d92dc:     	xorl	%r14d, %r14d
1408d92df:     	jmp	0x1408d97c9 <.text+0x8d87c9>
1408d92e4:     	leaq	0x32(%rsi), %rax
1408d92e8:     	cmpb	$0x0, (%rax)
1408d92eb:     	je	0x1408d93ff <.text+0x8d83ff>
1408d92f1:     	movq	0x38(%rdi), %rax
1408d92f5:     	movq	(%rax), %rcx
1408d92f8:     	movl	0x28(%rsi), %edx
1408d92fb:     	callq	0x140573f60 <.text+0x572f60>
1408d9300:     	movl	%eax, %r15d
1408d9303:     	jmp	0x1408d9402 <.text+0x8d8402>
1408d9308:     	movq	(%r15), %rax
1408d930b:     	movq	%rax, -0x18(%rbp)
1408d930f:     	movl	$0x0, 0x8(%rbp)
1408d9316:     	movq	$0x0, (%rbp)
1408d931e:     	movb	$0x1, 0xa0(%rbp)
1408d9325:     	movq	0x8(%rbx), %rcx
1408d9329:     	movq	%rcx, 0xa8(%rbp)
1408d9330:     	callq	0x144e07d20 <.text+0x4e06d20>
1408d9335:     	movq	%rax, %r15
1408d9338:     	movq	0x10(%rbx), %r14
1408d933c:     	movq	0x18(%rbx), %rdx
1408d9340:     	testq	%r14, %r14
1408d9343:     	movq	%r14, %r13
1408d9346:     	cmoveq	%rdx, %r13
1408d934a:     	movq	(%r13), %rax
1408d934e:     	movq	0x10(%r13), %r12
1408d9352:     	subq	%r12, %rax
1408d9355:     	cmpq	$0x57, %rax
1408d9359:     	jbe	0x1408d9829 <.text+0x8d8829>
1408d935f:     	movq	0x8(%r13), %rax
1408d9363:     	leaq	0x27ed36(%rip), %rcx    # 0x140b580a0 <.text+0xb570a0>
1408d936a:     	movq	%rcx, (%rax,%r12)
1408d936e:     	movaps	0x557397b(%rip), %xmm0  # 0x145e4ccf0
1408d9375:     	movups	%xmm0, 0x8(%rax,%r12)
1408d937b:     	movq	(%rbp), %rcx
1408d937f:     	movq	%rcx, 0x18(%rax,%r12)
1408d9384:     	movl	0x8(%rbp), %ecx
1408d9387:     	movl	%ecx, 0x20(%rax,%r12)
1408d938c:     	movabsq	$0x3f8000003f800000, %rcx # imm = 0x3F8000003F800000
1408d9396:     	movq	%rcx, 0x24(%rax,%r12)
1408d939b:     	movl	$0x3f800000, 0x2c(%rax,%r12) # imm = 0x3F800000
1408d93a4:     	movb	$0x0, 0x38(%rax,%r12)
1408d93aa:     	movq	%r15, 0x48(%rax,%r12)
1408d93af:     	addq	$0x58, %r12
1408d93b3:     	movq	%r12, 0x10(%r13)
1408d93b7:     	movq	(%rbx), %rax
1408d93ba:     	movq	0x20(%rbx), %rcx
1408d93be:     	movq	%r15, 0x50(%rbp)
1408d93c2:     	movq	%rax, 0x58(%rbp)
1408d93c6:     	movq	0xa8(%rbp), %rax
1408d93cd:     	movq	%rax, 0x60(%rbp)
1408d93d1:     	movq	%r14, 0x68(%rbp)
1408d93d5:     	movq	%rdx, 0x70(%rbp)
1408d93d9:     	movq	%rcx, 0x78(%rbp)
1408d93dd:     	leaq	0x50(%rbp), %rcx
1408d93e1:     	callq	0x1415e2420 <.text+0x15e1420>
1408d93e6:     	movq	(%rax), %r12
1408d93e9:     	movq	0x10(%rbx), %rax
1408d93ed:     	testq	%rax, %rax
1408d93f0:     	je	0x1408d951f <.text+0x8d851f>
1408d93f6:     	movq	0x20(%rbx), %rcx
1408d93fa:     	jmp	0x1408d951f <.text+0x8d851f>
1408d93ff:     	xorl	%r15d, %r15d
1408d9402:     	movq	0x10(%rdi), %rbx
1408d9406:     	movq	0x40(%rdi), %rdx
1408d940a:     	leaq	0x50(%rbp), %rcx
1408d940e:     	callq	0x140576520 <.text+0x575520>
1408d9413:     	movq	0x18(%rdi), %rax
1408d9417:     	movq	%rax, 0x18(%rbp)
1408d941b:     	movq	(%rax), %rax
1408d941e:     	movb	$0x0, 0x80(%rbp)
1408d9425:     	movq	%rax, 0x88(%rbp)
1408d942c:     	movb	%r15b, 0x90(%rbp)
1408d9433:     	movq	0x8(%rbx), %rcx
1408d9437:     	movq	%rcx, 0xa0(%rbp)
1408d943e:     	callq	0x144e07d20 <.text+0x4e06d20>
1408d9443:     	movq	0x10(%rbx), %r15
1408d9447:     	movq	0x18(%rbx), %r14
1408d944b:     	testq	%r15, %r15
1408d944e:     	movq	%r15, %r12
1408d9451:     	cmoveq	%r14, %r12
1408d9455:     	movq	(%r12), %rcx
1408d9459:     	movq	0x10(%r12), %r13
1408d945e:     	subq	%r13, %rcx
1408d9461:     	cmpq	$0x67, %rcx
1408d9465:     	jbe	0x1408d97f6 <.text+0x8d87f6>
1408d946b:     	movq	0x8(%r12), %rcx
1408d9470:     	leaq	0x27f8f9(%rip), %rdx    # 0x140b58d70 <.text+0xb57d70>
1408d9477:     	movq	%rdx, (%rcx,%r13)
1408d947b:     	movaps	0x50(%rbp), %xmm0
1408d947f:     	movaps	0x60(%rbp), %xmm1
1408d9483:     	movaps	0x70(%rbp), %xmm2
1408d9487:     	movaps	0x80(%rbp), %xmm3
1408d948e:     	movups	%xmm0, 0x8(%rcx,%r13)
1408d9494:     	movups	%xmm1, 0x18(%rcx,%r13)
1408d949a:     	movups	%xmm2, 0x28(%rcx,%r13)
1408d94a0:     	movups	%xmm3, 0x38(%rcx,%r13)
1408d94a6:     	movaps	0x90(%rbp), %xmm0
1408d94ad:     	movups	%xmm0, 0x48(%rcx,%r13)
1408d94b3:     	movq	%rax, 0x58(%rcx,%r13)
1408d94b8:     	addq	$0x68, %r13
1408d94bc:     	movq	%r13, 0x10(%r12)
1408d94c1:     	movq	(%rbx), %rcx
1408d94c4:     	movq	%rbx, 0xa8(%rbp)
1408d94cb:     	movq	0x20(%rbx), %rdx
1408d94cf:     	movq	%rax, 0x20(%rbp)
1408d94d3:     	movq	%rcx, 0x28(%rbp)
1408d94d7:     	movq	0xa0(%rbp), %rax
1408d94de:     	movq	%rax, 0x30(%rbp)
1408d94e2:     	movq	%r15, 0x38(%rbp)
1408d94e6:     	movq	%r14, 0x40(%rbp)
1408d94ea:     	movq	%rdx, 0x48(%rbp)
1408d94ee:     	leaq	0x20(%rbp), %rcx
1408d94f2:     	callq	0x1415e2420 <.text+0x15e1420>
1408d94f7:     	movq	(%rax), %r12
1408d94fa:     	movb	$0x1, 0xa0(%rbp)
1408d9501:     	movq	0x18(%rbp), %r13
1408d9505:     	movq	0xb0(%rbp), %rax
1408d950c:     	leaq	-0x330(%rax), %r8
1408d9513:     	cmpb	$0x0, 0x33(%rsi)
1408d9517:     	jne	0x1408d95fa <.text+0x8d85fa>
1408d951d:     	jmp	0x1408d956d <.text+0x8d856d>
1408d951f:     	movq	0x18(%rbp), %r13
1408d9523:     	movq	0x18(%rbx), %rdx
1408d9527:     	movq	%rbx, 0xa8(%rbp)
1408d952e:     	movups	(%rbx), %xmm0
1408d9531:     	movq	-0x18(%rbp), %r8
1408d9535:     	movq	%r8, 0x50(%rbp)
1408d9539:     	movups	%xmm0, 0x58(%rbp)
1408d953d:     	movq	%rax, 0x68(%rbp)
1408d9541:     	movq	%rdx, 0x70(%rbp)
1408d9545:     	movq	%rcx, 0x78(%rbp)
1408d9549:     	leaq	0x50(%rbp), %rcx
1408d954d:     	movq	%r12, %rdx
1408d9550:     	callq	0x144e61ed0 <.text+0x4e60ed0>
1408d9555:     	movq	0xb0(%rbp), %rax
1408d955c:     	leaq	-0x330(%rax), %r8
1408d9563:     	cmpb	$0x0, 0x33(%rsi)
1408d9567:     	jne	0x1408d95fa <.text+0x8d85fa>
1408d956d:     	movq	0x58(%rdi), %rax
1408d9571:     	movq	(%r13), %rdx
1408d9575:     	movl	%edx, %ecx
1408d9577:     	notl	%ecx
1408d9579:     	movq	0x8(%rax), %r9
1408d957d:     	leaq	(%rcx,%rcx,2), %r10
1408d9581:     	shlq	$0x3, %r10
1408d9585:     	addq	0x8(%r9), %r10
1408d9589:     	shrq	$0x20, %rdx
1408d958d:     	cmpq	0x10(%r9), %rcx
1408d9591:     	leaq	0x5614378(%rip), %rcx   # 0x145eed910
1408d9598:     	cmovbq	%r10, %rcx
1408d959c:     	cmpl	%edx, 0x10(%rcx)
1408d959f:     	jne	0x1408d95fa <.text+0x8d85fa>
1408d95a1:     	cmpl	$0x0, (%rcx)
1408d95a4:     	je	0x1408d95fa <.text+0x8d85fa>
1408d95a6:     	movq	(%rax), %rax
1408d95a9:     	movq	0x4(%rcx), %rdx
1408d95ad:     	movq	%rdx, %rcx
1408d95b0:     	shrq	$0x20, %rcx
1408d95b4:     	cmpq	%rcx, 0x38(%rax)
1408d95b8:     	jbe	0x1408d95fa <.text+0x8d85fa>
1408d95ba:     	shrq	$0x26, %rdx
1408d95be:     	movq	0x28(%rax), %rax
1408d95c2:     	movq	(%rax,%rdx,8), %rax
1408d95c6:     	btq	%rcx, %rax
1408d95ca:     	jae	0x1408d95fa <.text+0x8d85fa>
1408d95cc:     	movl	0x28(%rsi), %ecx
1408d95cf:     	movzbl	0xa0(%rbp), %edx
1408d95d6:     	movq	%r8, %rbx
1408d95d9:     	callq	0x1407e00a0 <.text+0x7df0a0>
1408d95de:     	movq	%rbx, %r8
1408d95e1:     	testb	$0x1, %al
1408d95e3:     	je	0x1408d95fa <.text+0x8d85fa>
1408d95e5:     	movq	0xa8(%rbp), %rcx
1408d95ec:     	movq	%r12, %rdx
1408d95ef:     	movaps	%xmm0, %xmm2
1408d95f2:     	callq	0x1407e0cc0 <.text+0x7dfcc0>
1408d95f7:     	movq	%rbx, %r8
1408d95fa:     	movq	(%rdi), %r15
1408d95fd:     	movss	(%r15), %xmm3
1408d9602:     	movq	(%r13), %rax
1408d9606:     	movzbl	0x35(%rsi), %ecx
1408d960a:     	movq	0x60(%rdi), %rdx
1408d960e:     	movl	0x1c(%rdx), %r9d
1408d9612:     	movq	0x10(%rdx), %r10
1408d9616:     	movl	%r9d, (%r10)
1408d9619:     	movq	(%rdx), %rdx
1408d961c:     	movq	0x68(%rdi), %r9
1408d9620:     	movl	0x1c(%r9), %r10d
1408d9624:     	movq	0x10(%r9), %r11
1408d9628:     	movl	%r10d, (%r11)
1408d962b:     	movq	(%r9), %r9
1408d962e:     	movq	0x70(%rdi), %r10
1408d9632:     	movl	0x1c(%r10), %r11d
1408d9636:     	movq	0x10(%r10), %rbx
1408d963a:     	movl	%r11d, (%rbx)
1408d963d:     	movq	(%r10), %r10
1408d9640:     	movq	0x78(%rdi), %r11
1408d9644:     	movl	0x1c(%r11), %ebx
1408d9648:     	movq	0x10(%r11), %r14
1408d964c:     	movl	%ebx, (%r14)
1408d964f:     	movq	(%r11), %r11
1408d9652:     	movq	%rdx, 0x50(%rbp)
1408d9656:     	movq	%r9, 0x58(%rbp)
1408d965a:     	movq	%r10, 0x60(%rbp)
1408d965e:     	movq	%r11, 0x68(%rbp)
1408d9662:     	movq	0x80(%rdi), %rdx
1408d9669:     	movq	0x88(%rdi), %r9
1408d9670:     	movq	(%rdx), %rdx
1408d9673:     	movl	0x1c(%r9), %r10d
1408d9677:     	movq	0x10(%r9), %r11
1408d967b:     	movl	%r10d, (%r11)
1408d967e:     	movq	(%r9), %r9
1408d9681:     	movq	%r9, 0x48(%rsp)
1408d9686:     	movq	%rdx, 0x40(%rsp)
1408d968b:     	leaq	0x50(%rbp), %rdx
1408d968f:     	movq	%rdx, 0x38(%rsp)
1408d9694:     	movb	%cl, 0x30(%rsp)
1408d9698:     	movq	%rax, 0x28(%rsp)
1408d969d:     	movzbl	0xa0(%rbp), %eax
1408d96a4:     	movb	%al, 0x20(%rsp)
1408d96a8:     	movw	$0x0, 0x50(%rsp)
1408d96af:     	movq	0xa8(%rbp), %rcx
1408d96b6:     	movq	%r12, %rdx
1408d96b9:     	callq	0x140573fa0 <.text+0x572fa0>
1408d96be:     	movq	%r12, 0x20(%rsi)
1408d96c2:     	cmpb	$0x0, 0x32(%rsi)
1408d96c6:     	jne	0x1408d96fb <.text+0x8d86fb>
1408d96c8:     	movq	0xb0(%rbp), %rax
1408d96cf:     	cmpb	$0x0, -0x100(%rax)
1408d96d6:     	je	0x1408d96e2 <.text+0x8d86e2>
1408d96d8:     	movss	-0xfc(%rax), %xmm0
1408d96e0:     	jmp	0x1408d96ea <.text+0x8d86ea>
1408d96e2:     	movss	0x5493c82(%rip), %xmm0  # 0x145d6d36c
1408d96ea:     	addss	(%r15), %xmm0
1408d96ef:     	movl	$0x1, 0x18(%rsi)
1408d96f6:     	movss	%xmm0, 0x1c(%rsi)
1408d96fb:     	callq	0x1422a4f70 <.text+0x22a3f70>
1408d9700:     	testb	%al, %al
1408d9702:     	je	0x1408d97c6 <.text+0x8d87c6>
1408d9708:     	xorl	%eax, %eax
1408d970a:     	cmpl	$0x1, 0x18(%rsi)
1408d970e:     	jne	0x1408d9724 <.text+0x8d8724>
1408d9710:     	movss	0x1c(%rsi), %xmm0
1408d9715:     	subss	(%r15), %xmm0
1408d971a:     	movss	%xmm0, -0xc(%rbp)
1408d971f:     	movl	$0x1, %eax
1408d9724:     	movl	%eax, -0x10(%rbp)
1408d9727:     	movq	%r13, 0x50(%rbp)
1408d972b:     	leaq	0x453308e(%rip), %rax   # 0x144e0c7c0 <.text+0x4e0b7c0>
1408d9732:     	movq	%rax, 0x58(%rbp)
1408d9736:     	movq	%rsi, 0x60(%rbp)
1408d973a:     	leaq	-0x8d7661(%rip), %rax   # 0x1400020e0 <.text+0x10e0>
1408d9741:     	movq	%rax, 0x68(%rbp)
1408d9745:     	movq	0x10(%rbp), %rax
1408d9749:     	movq	%rax, 0x70(%rbp)
1408d974d:     	leaq	0x52d585c(%rip), %rax   # 0x145baefb0 <.text+0x5badfb0>
1408d9754:     	movq	%rax, 0x78(%rbp)
1408d9758:     	leaq	-0x10(%rbp), %rax
1408d975c:     	movq	%rax, 0x80(%rbp)
1408d9763:     	leaq	0x4fa56(%rip), %rax     # 0x1409291c0 <.text+0x9281c0>
1408d976a:     	movq	%rax, 0x88(%rbp)
1408d9771:     	leaq	0x5613ba8(%rip), %rdx   # 0x145eed320
1408d9778:     	leaq	0x20(%rbp), %rcx
1408d977c:     	leaq	0x50(%rbp), %r8
1408d9780:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1408d9785:     	movq	0x28(%rbp), %r8
1408d9789:     	movq	0x30(%rbp), %r9
1408d978d:     	leaq	0x5613aff(%rip), %rcx   # 0x145eed293
1408d9794:     	movl	$0x2, %edx
1408d9799:     	movq	%r8, 0xb0(%rbp)
1408d97a0:     	callq	0x1422a4be0 <.text+0x22a3be0>
1408d97a5:     	nop
1408d97a6:     	movq	0x20(%rbp), %rdx
1408d97aa:     	testq	%rdx, %rdx
1408d97ad:     	movb	$0x1, %r14b
1408d97b0:     	je	0x1408d97c9 <.text+0x8d87c9>
1408d97b2:     	movl	$0x1, %r8d
1408d97b8:     	movq	0xb0(%rbp), %rcx
1408d97bf:     	callq	0x1400021d0 <.text+0x11d0>
1408d97c4:     	jmp	0x1408d97c9 <.text+0x8d87c9>
1408d97c6:     	movb	$0x1, %r14b
1408d97c9:     	movl	%r14d, %eax
1408d97cc:     	movaps	0xc0(%rbp), %xmm6
1408d97d3:     	movaps	0xd0(%rbp), %xmm7
1408d97da:     	movaps	0xe0(%rbp), %xmm8
1408d97e2:     	addq	$0x178, %rsp            # imm = 0x178
1408d97e9:     	popq	%rbx
1408d97ea:     	popq	%rdi
1408d97eb:     	popq	%rsi
1408d97ec:     	popq	%r12
1408d97ee:     	popq	%r13
1408d97f0:     	popq	%r14
1408d97f2:     	popq	%r15
1408d97f4:     	popq	%rbp
1408d97f5:     	retq
1408d97f6:     	movq	$0x1, 0x20(%rsp)
1408d97ff:     	movl	$0x68, %r8d
1408d9805:     	movl	$0x1, %r9d
1408d980b:     	movq	%r12, %rcx
1408d980e:     	movq	%r13, %rdx
1408d9811:     	movq	%rax, 0xa8(%rbp)
1408d9818:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1408d981d:     	movq	0xa8(%rbp), %rax
1408d9824:     	jmp	0x1408d946b <.text+0x8d846b>
1408d9829:     	movq	$0x1, 0x20(%rsp)
1408d9832:     	movl	$0x58, %r8d
1408d9838:     	movl	$0x1, %r9d
1408d983e:     	movq	%r13, %rcx
1408d9841:     	movq	%rdx, -0x20(%rbp)
1408d9845:     	movq	%r12, %rdx
1408d9848:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1408d984d:     	movq	-0x20(%rbp), %rdx
1408d9851:     	jmp	0x1408d935f <.text+0x8d835f>

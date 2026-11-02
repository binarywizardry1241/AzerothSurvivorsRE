
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14016df34:     	movq	0x78(%rbp), %r15
14016df38:     	movq	0x10(%r15), %rax
14016df3c:     	testq	%rax, %rax
14016df3f:     	je	0x14016dfe4 <.text+0x16cfe4>
14016df45:     	movq	0x8(%r15), %rcx
14016df49:     	shlq	$0x5, %rax
14016df4d:     	movsd	-0x20(%rcx,%rax), %xmm0
14016df53:     	ucomisd	%xmm7, %xmm0
14016df57:     	jbe	0x14016dfe4 <.text+0x16cfe4>
14016df5d:     	movq	0x98(%rbp), %rsi
14016df64:     	jmp	0x14016dffa <.text+0x16cffa>
14016df69:     	xorpd	%xmm9, %xmm9
14016df6e:     	cmpb	$0x2, (%rax)
14016df71:     	jne	0x14016df34 <.text+0x16cf34>
14016df73:     	movq	0x8(%rax), %rcx
14016df77:     	cmpq	$0x2, %rcx
14016df7b:     	je	0x14016df9b <.text+0x16cf9b>
14016df7d:     	cmpl	$0x1, %ecx
14016df80:     	jne	0x14016dfb0 <.text+0x16cfb0>
14016df82:     	xorps	%xmm9, %xmm9
14016df86:     	cvtsi2sdq	0x10(%rax), %xmm9
14016df8c:     	movq	0x78(%rbp), %r15
14016df90:     	movq	0x10(%r15), %rax
14016df94:     	testq	%rax, %rax
14016df97:     	jne	0x14016df45 <.text+0x16cf45>
14016df99:     	jmp	0x14016dfe4 <.text+0x16cfe4>
14016df9b:     	movsd	0x10(%rax), %xmm9
14016dfa1:     	movq	0x78(%rbp), %r15
14016dfa5:     	movq	0x10(%r15), %rax
14016dfa9:     	testq	%rax, %rax
14016dfac:     	jne	0x14016df45 <.text+0x16cf45>
14016dfae:     	jmp	0x14016dfe4 <.text+0x16cfe4>
14016dfb0:     	movsd	0x10(%rax), %xmm0
14016dfb5:     	unpcklps	0x5c060b4(%rip), %xmm0  # xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
                                                # 0x145d74070
14016dfbc:     	subpd	0x5c060bc(%rip), %xmm0  # 0x145d74080
14016dfc4:     	movapd	%xmm0, %xmm9
14016dfc9:     	unpckhpd	%xmm0, %xmm9            # xmm9 = xmm9[1],xmm0[1]
14016dfce:     	addsd	%xmm0, %xmm9
14016dfd3:     	movq	0x78(%rbp), %r15
14016dfd7:     	movq	0x10(%r15), %rax
14016dfdb:     	testq	%rax, %rax
14016dfde:     	jne	0x14016df45 <.text+0x16cf45>
14016dfe4:     	movq	0x98(%rbp), %rsi
14016dfeb:     	movsd	0x30(%rsi), %xmm0
14016dff0:     	ucomisd	%xmm7, %xmm0
14016dff4:     	jbe	0x14016e11c <.text+0x16d11c>
14016dffa:     	movl	0x94(%rbp), %eax
14016e000:     	movq	0x88(%rbp), %rcx
14016e007:     	movl	%eax, (%rcx)
14016e009:     	movq	$0x0, 0x10(%r15)
14016e011:     	movl	0xb4(%rbp), %eax
14016e017:     	movq	0xa8(%rbp), %rcx
14016e01e:     	movl	%eax, (%rcx)
14016e020:     	movq	0x10(%rsi), %rbx
14016e024:     	testq	%rbx, %rbx
14016e027:     	je	0x14016e064 <.text+0x16d064>
14016e029:     	movq	0x8(%rsi), %r12
14016e02d:     	addq	$0x8, %r12
14016e031:     	jmp	0x14016e049 <.text+0x16d049>
14016e033:     	nopw	%cs:(%rax,%rax)
14016e040:     	addq	$0x28, %r12
14016e044:     	decq	%rbx
14016e047:     	je	0x14016e064 <.text+0x16d064>
14016e049:     	movq	-0x8(%r12), %rdx
14016e04e:     	testq	%rdx, %rdx
14016e051:     	je	0x14016e040 <.text+0x16d040>
14016e053:     	movq	(%r12), %rcx
14016e057:     	movl	$0x1, %r8d
14016e05d:     	callq	0x1400021d0 <.text+0x11d0>
14016e062:     	jmp	0x14016e040 <.text+0x16d040>
14016e064:     	movq	(%rsi), %rax
14016e067:     	testq	%rax, %rax
14016e06a:     	je	0x14016e083 <.text+0x16d083>
14016e06c:     	movq	0x8(%rsi), %rcx
14016e070:     	shlq	$0x3, %rax
14016e074:     	leaq	(%rax,%rax,4), %rdx
14016e078:     	movl	$0x8, %r8d
14016e07e:     	callq	0x1400021d0 <.text+0x11d0>
14016e083:     	movq	0x28(%rsi), %rbx
14016e087:     	testq	%rbx, %rbx
14016e08a:     	je	0x14016e0c4 <.text+0x16d0c4>
14016e08c:     	movq	0x20(%rsi), %r12
14016e090:     	addq	$0x8, %r12
14016e094:     	jmp	0x14016e0a9 <.text+0x16d0a9>
14016e096:     	nopw	%cs:(%rax,%rax)
14016e0a0:     	addq	$0x28, %r12
14016e0a4:     	decq	%rbx
14016e0a7:     	je	0x14016e0c4 <.text+0x16d0c4>
14016e0a9:     	movq	-0x8(%r12), %rdx
14016e0ae:     	testq	%rdx, %rdx
14016e0b1:     	je	0x14016e0a0 <.text+0x16d0a0>
14016e0b3:     	movq	(%r12), %rcx
14016e0b7:     	movl	$0x1, %r8d
14016e0bd:     	callq	0x1400021d0 <.text+0x11d0>
14016e0c2:     	jmp	0x14016e0a0 <.text+0x16d0a0>
14016e0c4:     	leaq	0x10(%rsi), %r12
14016e0c8:     	leaq	0x28(%rsi), %rbx
14016e0cc:     	movq	0x18(%rsi), %rax
14016e0d0:     	testq	%rax, %rax
14016e0d3:     	je	0x14016e0ec <.text+0x16d0ec>
14016e0d5:     	movq	0x20(%rsi), %rcx
14016e0d9:     	shlq	$0x3, %rax
14016e0dd:     	leaq	(%rax,%rax,4), %rdx
14016e0e1:     	movl	$0x8, %r8d
14016e0e7:     	callq	0x1400021d0 <.text+0x11d0>
14016e0ec:     	movq	$0x0, (%rsi)
14016e0f3:     	movq	$0x8, 0x8(%rsi)
14016e0fb:     	xorpd	%xmm0, %xmm0
14016e0ff:     	movupd	%xmm0, (%r12)
14016e105:     	movq	$0x8, 0x20(%rsi)
14016e10d:     	movupd	%xmm0, 0x10(%rbx)
14016e112:     	movupd	%xmm0, (%rbx)
14016e116:     	movb	$0x0, 0x20(%rbx)
14016e11a:     	jmp	0x14016e180 <.text+0x16d180>
14016e11c:     	cmpb	$0x0, 0x48(%rsi)
14016e120:     	je	0x14016e180 <.text+0x16d180>
14016e122:     	leaq	0x5c48594(%rip), %rcx   # 0x145db66bd
14016e129:     	movl	$0x5, %edx
14016e12e:     	movq	%r14, %r8
14016e131:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14016e136:     	testq	%rax, %rax
14016e139:     	jne	0x14016e142 <.text+0x16d142>
14016e13b:     	movq	0x7e6c14e(%rip), %rax   # 0x147fda290
14016e142:     	cmpb	$0x4, (%rax)
14016e145:     	jne	0x14016e8c7 <.text+0x16d8c7>
14016e14b:     	movq	0x10(%rax), %rdx
14016e14f:     	movq	0x18(%rax), %r8
14016e153:     	shlq	$0x5, %r8
14016e157:     	addq	%rdx, %r8
14016e15a:     	leaq	0x2c0(%rbp), %rcx
14016e161:     	callq	0x140264110 <.text+0x263110>
14016e166:     	movq	0x2c0(%rbp), %rax
14016e16d:     	movq	0x2c8(%rbp), %rcx
14016e174:     	movq	0x2d0(%rbp), %rdx
14016e17b:     	jmp	0x14016e8d0 <.text+0x16d8d0>
14016e180:     	movupd	0x38(%rsi), %xmm0
14016e185:     	unpcklpd	%xmm8, %xmm6            # xmm6 = xmm6[0],xmm8[0]
14016e18a:     	subpd	%xmm0, %xmm6
14016e18e:     	xorpd	%xmm0, %xmm0
14016e192:     	maxpd	%xmm0, %xmm6
14016e196:     	movapd	%xmm6, 0x130(%rbp)
14016e19e:     	movsd	%xmm9, 0x140(%rbp)
14016e1a7:     	movq	0x10(%r15), %rax
14016e1ab:     	testq	%rax, %rax
14016e1ae:     	je	0x14016e1c0 <.text+0x16d1c0>
14016e1b0:     	movq	0x8(%r15), %rcx
14016e1b4:     	shlq	$0x5, %rax
14016e1b8:     	ucomisd	-0x20(%rcx,%rax), %xmm7
14016e1be:     	jbe	0x14016e222 <.text+0x16d222>
14016e1c0:     	movl	0x94(%rbp), %ebx
14016e1c6:     	movq	0x88(%rbp), %r12
14016e1cd:     	movl	%ebx, (%r12)
14016e1d1:     	movq	0x10(%r15), %r13
14016e1d5:     	cmpq	(%r15), %r13
14016e1d8:     	jne	0x14016e1e2 <.text+0x16d1e2>
14016e1da:     	movq	%r15, %rcx
14016e1dd:     	callq	0x145bcb530 <.text+0x5bca530>
14016e1e2:     	movq	0x8(%r15), %rax
14016e1e6:     	movq	%r13, %rcx
14016e1e9:     	shlq	$0x5, %rcx
14016e1ed:     	movsd	%xmm7, (%rax,%rcx)
14016e1f2:     	movapd	0x130(%rbp), %xmm0
14016e1fa:     	movupd	%xmm0, 0x8(%rax,%rcx)
14016e200:     	movq	0x140(%rbp), %rdx
14016e207:     	movq	%rdx, 0x18(%rax,%rcx)
14016e20c:     	incq	%r13
14016e20f:     	movq	%r13, 0x10(%r15)
14016e213:     	movl	%ebx, (%r12)
14016e217:     	movq	0x10(%r15), %rax
14016e21b:     	testq	%rax, %rax
14016e21e:     	jne	0x14016e23c <.text+0x16d23c>
14016e220:     	jmp	0x14016e283 <.text+0x16d283>
14016e222:     	movl	0x94(%rbp), %ebx
14016e228:     	movq	0x88(%rbp), %r12
14016e22f:     	movl	%ebx, (%r12)
14016e233:     	movq	0x10(%r15), %rax
14016e237:     	testq	%rax, %rax
14016e23a:     	je	0x14016e283 <.text+0x16d283>
14016e23c:     	movq	0x8(%r15), %rcx
14016e240:     	leaq	0x20(%rcx), %r9
14016e244:     	movq	%rax, %rdx
14016e247:     	negq	%rdx
14016e24a:     	xorl	%r8d, %r8d
14016e24d:     	movsd	0x5c47c3b(%rip), %xmm0  # 0x145db5e90
14016e255:     	nopw	%cs:(%rax,%rax)
14016e260:     	movapd	%xmm7, %xmm1
14016e264:     	subsd	-0x20(%r9), %xmm1
14016e26a:     	ucomisd	%xmm1, %xmm0
14016e26e:     	jb	0x14016ee24 <.text+0x16de24>
14016e274:     	incq	%r8
14016e277:     	addq	$0x20, %r9
14016e27b:     	movq	%rdx, %r10
14016e27e:     	addq	%r8, %r10
14016e281:     	jne	0x14016e260 <.text+0x16d260>
14016e283:     	movq	0x18(%rbp), %r8
14016e287:     	movq	0x20(%rbp), %rax
14016e28b:     	movq	0xf8(%r8), %rdx
14016e292:     	movq	0x100(%r8), %rcx
14016e299:     	leaq	(%rdx,%rcx,4), %rcx
14016e29d:     	movzbl	0x108(%r8), %r12d
14016e2a5:     	testb	%r12b, %r12b
14016e2a8:     	je	0x14016e2ba <.text+0x16d2ba>
14016e2aa:     	movl	$0x8, %ebx
14016e2af:     	xorl	%r9d, %r9d
14016e2b2:     	xorl	%r10d, %r10d
14016e2b5:     	xorl	%r8d, %r8d
14016e2b8:     	jmp	0x14016e2f8 <.text+0x16d2f8>
14016e2ba:     	movl	$0x8, %r13d
14016e2c0:     	xorl	%r9d, %r9d
14016e2c3:     	xorl	%r10d, %r10d
14016e2c6:     	xorl	%r8d, %r8d
14016e2c9:     	jmp	0x14016e35c <.text+0x16d35c>
14016e2ce:     	nop
14016e2d0:     	leaq	(%r10,%r13,8), %r8
14016e2d4:     	movq	0x8(%r8), %rbx
14016e2d8:     	xorl	%r10d, %r10d
14016e2db:     	movl	%r11d, %r9d
14016e2de:     	movl	%r10d, %r8d
14016e2e1:     	incl	%r10d
14016e2e4:     	movq	(%rbx,%r8,8), %r11
14016e2e8:     	movq	%r11, %r8
14016e2eb:     	shrq	$0x20, %r8
14016e2ef:     	testl	%r11d, %r11d
14016e2f2:     	jne	0x14016eaea <.text+0x16daea>
14016e2f8:     	cmpl	%r9d, %r10d
14016e2fb:     	jne	0x14016e2de <.text+0x16d2de>
14016e2fd:     	nopl	(%rax)
14016e300:     	cmpq	%rcx, %rdx
14016e303:     	je	0x14016e323 <.text+0x16d323>
14016e305:     	movl	(%rdx), %r11d
14016e308:     	addq	$0x4, %rdx
14016e30c:     	movq	0x1a8(%rax), %r10
14016e313:     	leaq	(%r11,%r11,8), %r13
14016e317:     	movq	0x10(%r10,%r13,8), %r11
14016e31c:     	testq	%r11, %r11
14016e31f:     	je	0x14016e300 <.text+0x16d300>
14016e321:     	jmp	0x14016e2d0 <.text+0x16d2d0>
14016e323:     	movl	$0x8, %r13d
14016e329:     	jmp	0x14016e39c <.text+0x16d39c>
14016e32b:     	nopl	(%rax,%rax)

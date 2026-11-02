// strongest-window
145b760b0:     	subq	$0x38, %rsp
145b760b4:     	movaps	%xmm8, 0x20(%rsp)
145b760ba:     	movaps	%xmm7, 0x10(%rsp)
145b760bf:     	movaps	%xmm6, (%rsp)
145b760c3:     	movss	0x4(%rcx), %xmm4
145b760c8:     	ucomiss	%xmm4, %xmm3
145b760cb:     	jae	0x145b760e2 <.text+0x5b750e2>
145b760cd:     	movss	(%rcx), %xmm7
145b760d1:     	movss	0x8(%rcx), %xmm5
145b760d6:     	movss	0xc(%rcx), %xmm0
145b760db:     	ucomiss	%xmm4, %xmm3
145b760de:     	jb	0x145b76113 <.text+0x5b75113>
145b760e0:     	jmp	0x145b76124 <.text+0x5b75124>
145b760e2:     	movss	0xc(%rcx), %xmm4
145b760e7:     	ucomiss	%xmm3, %xmm4
145b760ea:     	movaps	%xmm3, %xmm0
145b760ed:     	cmpltss	%xmm4, %xmm0
145b760f2:     	movss	0x8(%rcx), %xmm7
145b760f7:     	andps	%xmm0, %xmm7
145b760fa:     	xorps	%xmm0, %xmm0
145b760fd:     	ja	0x145b76102 <.text+0x5b75102>
145b760ff:     	xorps	%xmm4, %xmm4
145b76102:     	movss	%xmm7, (%rcx)
145b76106:     	movss	%xmm4, 0x4(%rcx)
145b7610b:     	xorps	%xmm5, %xmm5
145b7610e:     	ucomiss	%xmm4, %xmm3
145b76111:     	jae	0x145b76124 <.text+0x5b75124>
145b76113:     	ucomiss	%xmm7, %xmm1
145b76116:     	ja	0x145b76124 <.text+0x5b75124>
145b76118:     	ucomiss	%xmm4, %xmm2
145b7611b:     	jbe	0x145b76199 <.text+0x5b75199>
145b7611d:     	ucomiss	%xmm7, %xmm1
145b76120:     	jne	0x145b76199 <.text+0x5b75199>
145b76122:     	jp	0x145b76199 <.text+0x5b75199>
145b76124:     	movss	%xmm1, (%rcx)
145b76128:     	movss	%xmm2, 0x4(%rcx)
145b7612d:     	ucomiss	%xmm2, %xmm0
145b76130:     	jbe	0x145b7617b <.text+0x5b7517b>
145b76132:     	ucomiss	%xmm3, %xmm0
145b76135:     	jbe	0x145b7617b <.text+0x5b7517b>
145b76137:     	ucomiss	%xmm2, %xmm4
145b7613a:     	jbe	0x145b761d7 <.text+0x5b751d7>
145b76140:     	ucomiss	%xmm3, %xmm4
145b76143:     	jbe	0x145b761d7 <.text+0x5b751d7>
145b76149:     	xorps	%xmm6, %xmm6
145b7614c:     	ucomiss	%xmm6, %xmm5
145b7614f:     	jbe	0x145b7620a <.text+0x5b7520a>
145b76155:     	xorps	%xmm1, %xmm1
145b76158:     	ucomiss	%xmm1, %xmm7
145b7615b:     	jbe	0x145b761e3 <.text+0x5b751e3>
145b76161:     	ucomiss	%xmm5, %xmm7
145b76164:     	ja	0x145b76213 <.text+0x5b75213>
145b7616a:     	ucomiss	%xmm0, %xmm4
145b7616d:     	jbe	0x145b761e3 <.text+0x5b751e3>
145b7616f:     	ucomiss	%xmm5, %xmm7
145b76172:     	movaps	%xmm7, %xmm6
145b76175:     	movaps	%xmm4, %xmm8
145b76179:     	jmp	0x145b761d1 <.text+0x5b751d1>
145b7617b:     	xorps	%xmm6, %xmm6
145b7617e:     	ucomiss	%xmm2, %xmm4
145b76181:     	jbe	0x145b761ec <.text+0x5b751ec>
145b76183:     	ucomiss	%xmm3, %xmm4
145b76186:     	jbe	0x145b761ec <.text+0x5b751ec>
145b76188:     	xorps	%xmm0, %xmm0
145b7618b:     	ucomiss	%xmm0, %xmm7
145b7618e:     	xorps	%xmm8, %xmm8
145b76192:     	ja	0x145b76213 <.text+0x5b75213>
145b76194:     	jmp	0x145b7622c <.text+0x5b7522c>
145b76199:     	ucomiss	%xmm3, %xmm0
145b7619c:     	jbe	0x145b761f2 <.text+0x5b751f2>
145b7619e:     	ucomiss	%xmm4, %xmm0
145b761a1:     	jbe	0x145b761f2 <.text+0x5b751f2>
145b761a3:     	ucomiss	%xmm3, %xmm2
145b761a6:     	jbe	0x145b761d7 <.text+0x5b751d7>
145b761a8:     	ucomiss	%xmm4, %xmm2
145b761ab:     	jbe	0x145b761d7 <.text+0x5b751d7>
145b761ad:     	xorps	%xmm6, %xmm6
145b761b0:     	ucomiss	%xmm6, %xmm5
145b761b3:     	jbe	0x145b7621c <.text+0x5b7521c>
145b761b5:     	xorps	%xmm3, %xmm3
145b761b8:     	ucomiss	%xmm3, %xmm1
145b761bb:     	jbe	0x145b761e3 <.text+0x5b751e3>
145b761bd:     	ucomiss	%xmm5, %xmm1
145b761c0:     	ja	0x145b76225 <.text+0x5b75225>
145b761c2:     	ucomiss	%xmm0, %xmm2
145b761c5:     	jbe	0x145b761e3 <.text+0x5b751e3>
145b761c7:     	ucomiss	%xmm5, %xmm1
145b761ca:     	movaps	%xmm1, %xmm6
145b761cd:     	movaps	%xmm2, %xmm8
145b761d1:     	jne	0x145b761e3 <.text+0x5b751e3>
145b761d3:     	jnp	0x145b7622c <.text+0x5b7522c>
145b761d5:     	jmp	0x145b761e3 <.text+0x5b751e3>
145b761d7:     	xorps	%xmm6, %xmm6
145b761da:     	ucomiss	%xmm6, %xmm5
145b761dd:     	xorps	%xmm8, %xmm8
145b761e1:     	jbe	0x145b7622c <.text+0x5b7522c>
145b761e3:     	movaps	%xmm5, %xmm6
145b761e6:     	movaps	%xmm0, %xmm8
145b761ea:     	jmp	0x145b7622c <.text+0x5b7522c>
145b761ec:     	xorps	%xmm8, %xmm8
145b761f0:     	jmp	0x145b7622c <.text+0x5b7522c>
145b761f2:     	xorps	%xmm6, %xmm6
145b761f5:     	ucomiss	%xmm4, %xmm2
145b761f8:     	xorps	%xmm8, %xmm8
145b761fc:     	jbe	0x145b7622c <.text+0x5b7522c>
145b761fe:     	ucomiss	%xmm6, %xmm1
145b76201:     	jbe	0x145b7622c <.text+0x5b7522c>
145b76203:     	ucomiss	%xmm3, %xmm2
145b76206:     	ja	0x145b76225 <.text+0x5b75225>
145b76208:     	jmp	0x145b7622c <.text+0x5b7522c>
145b7620a:     	ucomiss	%xmm6, %xmm7
145b7620d:     	xorps	%xmm8, %xmm8
145b76211:     	jbe	0x145b7622c <.text+0x5b7522c>
145b76213:     	movaps	%xmm7, %xmm6
145b76216:     	movaps	%xmm4, %xmm8
145b7621a:     	jmp	0x145b7622c <.text+0x5b7522c>
145b7621c:     	ucomiss	%xmm6, %xmm1
145b7621f:     	xorps	%xmm8, %xmm8
145b76223:     	jbe	0x145b7622c <.text+0x5b7522c>
145b76225:     	movaps	%xmm1, %xmm6
145b76228:     	movaps	%xmm2, %xmm8
145b7622c:     	movss	%xmm6, 0x8(%rcx)
145b76231:     	movss	%xmm8, 0xc(%rcx)
145b76237:     	movaps	(%rsp), %xmm6
145b7623b:     	movaps	0x10(%rsp), %xmm7
145b76240:     	movaps	0x20(%rsp), %xmm8
145b76246:     	addq	$0x38, %rsp
145b7624a:     	retq
// aura-stat-consumer
145c19060:     	movq	0x3e0(%rsi), %rdx
145c19067:     	testq	%rdx, %rdx
145c1906a:     	je	0x145c1920e <.text+0x5c1820e>
145c19070:     	movss	0xcc0(%rsi), %xmm9
145c19079:     	movq	0x3d8(%rsi), %r9
145c19080:     	movq	%rdx, %r10
145c19083:     	shlq	$0x5, %r10
145c19087:     	leaq	(%r9,%r10), %r11
145c1908b:     	movss	0x619e2d(%rip), %xmm7   # 0x146232ec0
145c19093:     	addss	0x80(%rbp), %xmm7
145c1909b:     	xorl	%edi, %edi
145c1909d:     	movss	0x61a043(%rip), %xmm6   # 0x1462330e8
145c190a5:     	movss	0x61a077(%rip), %xmm1   # 0x146233124
145c190ad:     	xorps	%xmm8, %xmm8
145c190b1:     	movq	%r9, %rbx
145c190b4:     	jmp	0x145c190c9 <.text+0x5c180c9>
145c190b6:     	addss	%xmm6, %xmm3
145c190ba:     	nopw	(%rax,%rax)
145c190c0:     	cmpq	%r11, %rbx
145c190c3:     	je	0x145c1920e <.text+0x5c1820e>
145c190c9:     	movq	%rbx, %r14
145c190cc:     	movq	%rdi, %rcx
145c190cf:     	addq	$0x20, %rbx
145c190d3:     	incq	%rdi
145c190d6:     	ucomiss	0x18(%r14), %xmm9
145c190db:     	jae	0x145c190c0 <.text+0x5c180c0>
145c190dd:     	cmpq	%rdx, %rcx
145c190e0:     	jae	0x145c197fa <.text+0x5c187fa>
145c190e6:     	movq	%rcx, %r15
145c190e9:     	shlq	$0x5, %r15
145c190ed:     	addq	%r9, %r15
145c190f0:     	xorl	%r12d, %r12d
145c190f3:     	xorl	%r13d, %r13d
145c190f6:     	jmp	0x145c19110 <.text+0x5c18110>
145c190f8:     	nopl	(%rax,%rax)
145c19100:     	incq	%r13
145c19103:     	addq	$0x20, %r12
145c19107:     	cmpq	%r12, %r10
145c1910a:     	je	0x145c191a0 <.text+0x5c181a0>
145c19110:     	cmpq	%r13, %rcx
145c19113:     	je	0x145c19100 <.text+0x5c18100>
145c19115:     	movl	0x14(%r9,%r12), %eax
145c1911a:     	cmpl	0x14(%r15), %eax
145c1911e:     	jne	0x145c19100 <.text+0x5c18100>
145c19120:     	cmpl	$0x306, %eax            # imm = 0x306
145c19125:     	je	0x145c19100 <.text+0x5c18100>
145c19127:     	movss	0x18(%r9,%r12), %xmm2
145c1912e:     	ucomiss	%xmm9, %xmm2
145c19132:     	jbe	0x145c19100 <.text+0x5c18100>
145c19134:     	movl	0x8(%r9,%r12), %eax
145c19139:     	movss	0xc(%r9,%r12), %xmm2
145c19140:     	movl	0x8(%r15), %r8d
145c19144:     	movss	0xc(%r15), %xmm15
145c1914a:     	andl	$-0x2, %r8d
145c1914e:     	cmpl	$0x8, %eax
145c19151:     	je	0x145c19158 <.text+0x5c18158>
145c19153:     	cmpl	$0x9, %eax
145c19156:     	jne	0x145c1917e <.text+0x5c1817e>
145c19158:     	cmpl	$0x8, %r8d
145c1915c:     	je	0x145c19162 <.text+0x5c18162>
145c1915e:     	xorps	%xmm15, %xmm15
145c19162:     	ucomiss	%xmm15, %xmm2
145c19166:     	ja	0x145c190c0 <.text+0x5c180c0>
145c1916c:     	cmpq	%rcx, %r13
145c1916f:     	jae	0x145c19100 <.text+0x5c18100>
145c19171:     	ucomiss	%xmm15, %xmm2
145c19175:     	jne	0x145c19100 <.text+0x5c18100>
145c19177:     	jp	0x145c19100 <.text+0x5c18100>
145c19179:     	jmp	0x145c190c0 <.text+0x5c180c0>
145c1917e:     	cmpl	$0x8, %r8d
145c19182:     	jne	0x145c1918e <.text+0x5c1818e>
145c19184:     	ucomiss	%xmm15, %xmm8
145c19188:     	ja	0x145c190c0 <.text+0x5c180c0>
145c1918e:     	xorps	%xmm2, %xmm2
145c19191:     	cmpl	$0x8, %r8d
145c19195:     	je	0x145c1916c <.text+0x5c1816c>
145c19197:     	xorps	%xmm15, %xmm15
145c1919b:     	jmp	0x145c1916c <.text+0x5c1816c>
145c1919d:     	nopl	(%rax)
145c191a0:     	movl	0x8(%r14), %eax
145c191a4:     	cmpl	$0x8, %eax
145c191a7:     	je	0x145c191dd <.text+0x5c181dd>
145c191a9:     	cmpl	$0x9, %eax
145c191ac:     	jne	0x145c191cd <.text+0x5c181cd>
145c191ae:     	movss	0xc(%r14), %xmm2
145c191b4:     	mulss	%xmm7, %xmm2
145c191b8:     	movaps	0xa0(%rbp), %xmm15
145c191c0:     	addss	%xmm2, %xmm15
145c191c5:     	movaps	%xmm15, 0xa0(%rbp)
145c191cd:     	movl	0x14(%r14), %eax
145c191d1:     	cmpl	$0x5b9b, %eax           # imm = 0x5B9B
145c191d6:     	jne	0x145c191fa <.text+0x5c181fa>
145c191d8:     	jmp	0x145c190b6 <.text+0x5c180b6>
145c191dd:     	movss	0xc(%r14), %xmm2
145c191e3:     	mulss	%xmm7, %xmm2
145c191e7:     	addss	%xmm2, %xmm4
145c191eb:     	movl	0x14(%r14), %eax
145c191ef:     	cmpl	$0x5b9b, %eax           # imm = 0x5B9B
145c191f4:     	je	0x145c190b6 <.text+0x5c180b6>
145c191fa:     	cmpl	$0x5bd1, %eax           # imm = 0x5BD1
145c191ff:     	jne	0x145c190c0 <.text+0x5c180c0>
145c19205:     	addss	%xmm1, %xmm4
145c19209:     	jmp	0x145c190c0 <.text+0x5c180c0>
// active-shout-tooltip
145c0c300:     	pushq	%rbp
145c0c301:     	pushq	%r15
145c0c303:     	pushq	%r14
145c0c305:     	pushq	%r13
145c0c307:     	pushq	%r12
145c0c309:     	pushq	%rsi
145c0c30a:     	pushq	%rdi
145c0c30b:     	pushq	%rbx
145c0c30c:     	subq	$0x98, %rsp
145c0c313:     	leaq	0x80(%rsp), %rbp
145c0c31b:     	movaps	%xmm6, (%rbp)
145c0c31f:     	movq	$-0x2, -0x8(%rbp)
145c0c327:     	movss	0xcc0(%rcx), %xmm0
145c0c32f:     	leaq	0x17d2745(%rip), %rax   # 0x1473dea7b
145c0c336:     	movq	%rax, -0x40(%rbp)
145c0c33a:     	movq	$0xc, -0x38(%rbp)
145c0c342:     	xorl	%eax, %eax
145c0c344:     	leaq	0x1431b15(%rip), %r9    # 0x14703de60
145c0c34b:     	movabsq	$0x735f656c74746162, %r10 # imm = 0x735F656C74746162
145c0c355:     	jmp	0x145c0c370 <.text+0x5c0b370>
145c0c357:     	nopw	(%rax,%rax)
145c0c360:     	addq	$0x78, %rax
145c0c364:     	cmpq	$0x34f8, %rax           # imm = 0x34F8
145c0c36a:     	je	0x145c0c63c <.text+0x5c0b63c>
145c0c370:     	cmpq	$0xc, 0x8(%rax,%r9)
145c0c376:     	jne	0x145c0c360 <.text+0x5c0b360>
145c0c378:     	movq	(%rax,%r9), %r11
145c0c37c:     	movq	(%r11), %rsi
145c0c37f:     	xorq	%r10, %rsi
145c0c382:     	movl	0x8(%r11), %r11d
145c0c386:     	xorq	$0x74756f68, %r11       # imm = 0x74756F68
145c0c38d:     	orq	%rsi, %r11
145c0c390:     	jne	0x145c0c360 <.text+0x5c0b360>
145c0c392:     	movq	0x3e0(%rcx), %rsi
145c0c399:     	testq	%rsi, %rsi
145c0c39c:     	je	0x145c0c54b <.text+0x5c0b54b>
145c0c3a2:     	movl	0x40(%rax,%r9), %eax
145c0c3a7:     	movq	0x3d8(%rcx), %r9
145c0c3ae:     	movq	%rsi, %r10
145c0c3b1:     	shlq	$0x5, %r10
145c0c3b5:     	cmpl	$0x306, %eax            # imm = 0x306
145c0c3ba:     	jne	0x145c0c563 <.text+0x5c0b563>
145c0c3c0:     	leaq	0x18(%r9), %rsi
145c0c3c4:     	xorl	%r11d, %r11d
145c0c3c7:     	jmp	0x145c0c3e4 <.text+0x5c0b3e4>
145c0c3c9:     	nopl	(%rax)
145c0c3d0:     	addq	$-0x20, %r11
145c0c3d4:     	addq	$0x20, %rsi
145c0c3d8:     	movq	%r10, %rdi
145c0c3db:     	addq	%r11, %rdi
145c0c3de:     	je	0x145c0c54b <.text+0x5c0b54b>
145c0c3e4:     	cmpl	$0x306, -0x4(%rsi)      # imm = 0x306
145c0c3eb:     	jne	0x145c0c3d0 <.text+0x5c0b3d0>
145c0c3ed:     	movss	(%rsi), %xmm1
145c0c3f1:     	ucomiss	%xmm0, %xmm1
145c0c3f4:     	jbe	0x145c0c3d0 <.text+0x5c0b3d0>
145c0c3f6:     	subq	%r11, %r9
145c0c3f9:     	leaq	0x8(%r9), %rdi
145c0c3fd:     	addq	$0xc, %r9
145c0c401:     	movq	%r9, %r11
145c0c404:     	imulq	$0xb0, %r8, %r8
145c0c40b:     	xorl	%r14d, %r14d
145c0c40e:     	movq	%rdx, %r9
145c0c411:     	nopw	%cs:(%rax,%rax)
145c0c420:     	cmpq	%r14, %r8
145c0c423:     	je	0x145c0c54b <.text+0x5c0b54b>
145c0c429:     	addq	$0xb0, %r14
145c0c430:     	cmpl	%eax, 0xa8(%r9)
145c0c437:     	leaq	0xb0(%r9), %r9
145c0c43e:     	jne	0x145c0c420 <.text+0x5c0b420>
145c0c440:     	cmpl	$0x8, (%rdi)
145c0c443:     	jne	0x145c0c54b <.text+0x5c0b54b>
145c0c449:     	movq	%rdx, %r15
145c0c44c:     	movss	(%r11), %xmm6
145c0c451:     	leaq	0x17d262f(%rip), %rsi   # 0x1473dea87
145c0c458:     	movl	$0x19, %edi
145c0c45d:     	movl	$0x19, %edx
145c0c462:     	movq	%rcx, %rbx
145c0c465:     	movq	%rsi, %rcx
145c0c468:     	callq	0x145be82d0 <.text+0x5be72d0>
145c0c46d:     	testq	%rax, %rax
145c0c470:     	cmovneq	%rax, %rsi
145c0c474:     	cmovneq	%rdx, %rdi
145c0c478:     	movss	0x508(%rbx), %xmm0
145c0c480:     	addss	0x626a38(%rip), %xmm0   # 0x146232ec0
145c0c488:     	mulss	%xmm6, %xmm0
145c0c48c:     	mulss	0x626c64(%rip), %xmm0   # 0x1462330f8
145c0c494:     	movss	%xmm0, -0x58(%rbp)
145c0c499:     	leaq	-0x58(%rbp), %rax
145c0c49d:     	movq	%rax, -0x28(%rbp)
145c0c4a1:     	leaq	0x438d78(%rip), %rax    # 0x146045220 <.text+0x6044220>
145c0c4a8:     	movq	%rax, -0x20(%rbp)
145c0c4ac:     	leaq	0x14633ba(%rip), %rdx   # 0x14706f86d
145c0c4b3:     	leaq	-0x40(%rbp), %rbx
145c0c4b7:     	leaq	-0x28(%rbp), %r8
145c0c4bb:     	movq	%rbx, %rcx
145c0c4be:     	callq	0x146034470 <.text+0x6033470>
145c0c4c3:     	leaq	0x17d25d6(%rip), %rax   # 0x1473deaa0
145c0c4ca:     	movq	%rax, -0x28(%rbp)
145c0c4ce:     	movq	$0x1, -0x20(%rbp)
145c0c4d6:     	movq	%rbx, -0x18(%rbp)
145c0c4da:     	leaq	0x17d1ce7(%rip), %rax   # 0x1473de1c8
145c0c4e1:     	movq	%rax, -0x10(%rbp)
145c0c4e5:     	movq	$0x1, 0x20(%rsp)
145c0c4ee:     	leaq	-0x58(%rbp), %rcx
145c0c4f2:     	leaq	-0x28(%rbp), %r9
145c0c4f6:     	movq	%rsi, %rdx
145c0c4f9:     	movq	%rdi, %r8
145c0c4fc:     	callq	0x145be86b0 <.text+0x5be76b0>
145c0c501:     	nop
145c0c502:     	leaq	(%r15,%r14), %rsi
145c0c506:     	addq	$-0x80, %rsi
145c0c50a:     	movq	-0x80(%r15,%r14), %rdx
145c0c50f:     	testq	%rdx, %rdx
145c0c512:     	je	0x145c0c524 <.text+0x5c0b524>
145c0c514:     	movq	-0x78(%r15,%r14), %rcx
145c0c519:     	movl	$0x1, %r8d
145c0c51f:     	callq	0x1400021d0 <.text+0x11d0>
145c0c524:     	movq	-0x48(%rbp), %rax
145c0c528:     	movq	%rax, 0x10(%rsi)
145c0c52c:     	movups	-0x58(%rbp), %xmm0
145c0c530:     	movups	%xmm0, (%rsi)
145c0c533:     	movq	-0x40(%rbp), %rdx
145c0c537:     	testq	%rdx, %rdx
145c0c53a:     	je	0x145c0c54b <.text+0x5c0b54b>
145c0c53c:     	movq	-0x38(%rbp), %rcx
145c0c540:     	movl	$0x1, %r8d
145c0c546:     	callq	0x1400021d0 <.text+0x11d0>
145c0c54b:     	movaps	(%rbp), %xmm6
145c0c54f:     	addq	$0x98, %rsp
145c0c556:     	popq	%rbx
145c0c557:     	popq	%rdi
145c0c558:     	popq	%rsi
145c0c559:     	popq	%r12
145c0c55b:     	popq	%r13
145c0c55d:     	popq	%r14
145c0c55f:     	popq	%r15
145c0c561:     	popq	%rbp
145c0c562:     	retq
145c0c563:     	xorl	%ebx, %ebx
145c0c565:     	xorps	%xmm1, %xmm1
145c0c568:     	jmp	0x145c0c578 <.text+0x5c0b578>
145c0c56a:     	nopw	(%rax,%rax)
145c0c570:     	incq	%rbx
145c0c573:     	cmpq	%rsi, %rbx
145c0c576:     	je	0x145c0c54b <.text+0x5c0b54b>
145c0c578:     	movq	%rbx, %r11
145c0c57b:     	shlq	$0x5, %r11
145c0c57f:     	cmpl	%eax, 0x14(%r9,%r11)
145c0c584:     	jne	0x145c0c570 <.text+0x5c0b570>
145c0c586:     	addq	%r9, %r11
145c0c589:     	movss	0x18(%r11), %xmm2
145c0c58f:     	ucomiss	%xmm0, %xmm2
145c0c592:     	jbe	0x145c0c570 <.text+0x5c0b570>
145c0c594:     	leaq	0x8(%r11), %rdi
145c0c598:     	addq	$0xc, %r11
145c0c59c:     	xorl	%r14d, %r14d
145c0c59f:     	xorl	%r15d, %r15d
145c0c5a2:     	jmp	0x145c0c5c0 <.text+0x5c0b5c0>
145c0c5a4:     	nopw	%cs:(%rax,%rax)
145c0c5b0:     	incq	%r15
145c0c5b3:     	addq	$0x20, %r14
145c0c5b7:     	cmpq	%r14, %r10
145c0c5ba:     	je	0x145c0c404 <.text+0x5c0b404>
145c0c5c0:     	cmpq	%r15, %rbx
145c0c5c3:     	je	0x145c0c5b0 <.text+0x5c0b5b0>
145c0c5c5:     	cmpl	%eax, 0x14(%r9,%r14)
145c0c5ca:     	jne	0x145c0c5b0 <.text+0x5c0b5b0>
145c0c5cc:     	movss	0x18(%r9,%r14), %xmm2
145c0c5d3:     	ucomiss	%xmm0, %xmm2
145c0c5d6:     	jbe	0x145c0c5b0 <.text+0x5c0b5b0>
145c0c5d8:     	movl	0x8(%r9,%r14), %r13d
145c0c5dd:     	movss	0xc(%r9,%r14), %xmm3
145c0c5e4:     	movl	(%rdi), %r12d
145c0c5e7:     	movss	(%r11), %xmm2
145c0c5ec:     	andl	$-0x2, %r12d
145c0c5f0:     	cmpl	$0x8, %r13d
145c0c5f4:     	je	0x145c0c5fc <.text+0x5c0b5fc>
145c0c5f6:     	cmpl	$0x9, %r13d
145c0c5fa:     	jne	0x145c0c61f <.text+0x5c0b61f>
145c0c5fc:     	cmpl	$0x8, %r12d
145c0c600:     	je	0x145c0c605 <.text+0x5c0b605>
145c0c602:     	xorps	%xmm2, %xmm2
145c0c605:     	ucomiss	%xmm2, %xmm3
145c0c608:     	ja	0x145c0c570 <.text+0x5c0b570>
145c0c60e:     	cmpq	%rbx, %r15
145c0c611:     	jae	0x145c0c5b0 <.text+0x5c0b5b0>
145c0c613:     	ucomiss	%xmm2, %xmm3
145c0c616:     	jne	0x145c0c5b0 <.text+0x5c0b5b0>
145c0c618:     	jp	0x145c0c5b0 <.text+0x5c0b5b0>
145c0c61a:     	jmp	0x145c0c570 <.text+0x5c0b570>
145c0c61f:     	cmpl	$0x8, %r12d
145c0c623:     	jne	0x145c0c62e <.text+0x5c0b62e>
145c0c625:     	ucomiss	%xmm2, %xmm1
145c0c628:     	ja	0x145c0c570 <.text+0x5c0b570>
145c0c62e:     	xorps	%xmm3, %xmm3
145c0c631:     	cmpl	$0x8, %r12d
145c0c635:     	je	0x145c0c60e <.text+0x5c0b60e>
145c0c637:     	xorps	%xmm2, %xmm2
145c0c63a:     	jmp	0x145c0c60e <.text+0x5c0b60e>
145c0c63c:     	leaq	-0x40(%rbp), %rax
145c0c640:     	movq	%rax, -0x28(%rbp)
145c0c644:     	leaq	-0x5c0a58b(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145c0c64b:     	movq	%rax, -0x20(%rbp)
145c0c64f:     	leaq	0x14309f2(%rip), %rcx   # 0x14703d048
145c0c656:     	leaq	0x14309fb(%rip), %r8    # 0x14703d058
145c0c65d:     	leaq	-0x28(%rbp), %rdx
145c0c661:     	callq	0x146208ee0 <.text+0x6207ee0>
145c0c666:     	ud2
// party-aura-producer
145c05c60:     	pushq	%r15
145c05c62:     	pushq	%r14
145c05c64:     	pushq	%rsi
145c05c65:     	pushq	%rdi
145c05c66:     	pushq	%rbp
145c05c67:     	pushq	%rbx
145c05c68:     	subq	$0x48, %rsp
145c05c6c:     	movaps	%xmm6, 0x30(%rsp)
145c05c71:     	cmpb	$0x1, 0xd7e(%rcx)
145c05c78:     	jne	0x145c05d2f <.text+0x5c04d2f>
145c05c7e:     	movq	0xc78(%rcx), %rdi
145c05c85:     	movq	0x4b0(%rcx), %rbx
145c05c8c:     	movl	0x528(%rcx), %eax
145c05c92:     	movl	%eax, 0x28(%rsp)
145c05c96:     	movq	0x520(%rcx), %rax
145c05c9d:     	movq	%rax, 0x20(%rsp)
145c05ca2:     	movq	0xb00(%rcx), %rsi
145c05ca9:     	cmpq	0xaf0(%rcx), %rsi
145c05cb0:     	jne	0x145c05cd7 <.text+0x5c04cd7>
145c05cb2:     	leaq	0xaf0(%rcx), %rax
145c05cb9:     	movq	%rcx, %r14
145c05cbc:     	movq	%rax, %rcx
145c05cbf:     	movq	%r8, %r15
145c05cc2:     	movaps	%xmm3, %xmm6
145c05cc5:     	movl	%edx, %ebp
145c05cc7:     	callq	0x146061e70 <.text+0x6060e70>
145c05ccc:     	movl	%ebp, %edx
145c05cce:     	movaps	%xmm6, %xmm3
145c05cd1:     	movq	%r15, %r8
145c05cd4:     	movq	%r14, %rcx
145c05cd7:     	movq	0xaf8(%rcx), %rax
145c05cde:     	imulq	$0x38, %rsi, %r9
145c05ce2:     	movq	%rdi, (%rax,%r9)
145c05ce6:     	movq	%rbx, 0x8(%rax,%r9)
145c05ceb:     	movq	0x20(%rsp), %r10
145c05cf0:     	movq	%r10, 0x10(%rax,%r9)
145c05cf5:     	movl	0x28(%rsp), %r10d
145c05cfa:     	movl	%r10d, 0x18(%rax,%r9)
145c05cff:     	movl	%edx, 0x1c(%rax,%r9)
145c05d04:     	movl	$0x0, 0x20(%rax,%r9)
145c05d0d:     	movss	%xmm3, 0x24(%rax,%r9)
145c05d14:     	movq	(%r8), %rdx
145c05d17:     	movq	%rdx, 0x28(%rax,%r9)
145c05d1c:     	movl	0x8(%r8), %edx
145c05d20:     	movl	%edx, 0x30(%rax,%r9)
145c05d25:     	incq	%rsi
145c05d28:     	movq	%rsi, 0xb00(%rcx)
145c05d2f:     	movaps	0x30(%rsp), %xmm6
145c05d34:     	addq	$0x48, %rsp
145c05d38:     	popq	%rbx
145c05d39:     	popq	%rbp
145c05d3a:     	popq	%rdi
145c05d3b:     	popq	%rsi
145c05d3c:     	popq	%r14
145c05d3e:     	popq	%r15
145c05d40:     	retq
// self-shout-publication
145c6437c:     	leaq	0x3d0(%rdi), %rcx
145c64383:     	movq	0x3e0(%rdi), %rbx
145c6438a:     	movl	0x40(%rsi), %r14d
145c6438e:     	testq	%rbx, %rbx
145c64391:     	je	0x145c643e1 <.text+0x5c633e1>
145c64393:     	movq	0x3d8(%rdi), %rdx
145c6439a:     	movl	$0x20, %r8d
145c643a0:     	xorl	%eax, %eax
145c643a2:     	jmp	0x145c643bc <.text+0x5c633bc>
145c643a4:     	nopw	%cs:(%rax,%rax)
145c643b0:     	incq	%rax
145c643b3:     	addq	$0x20, %r8
145c643b7:     	cmpq	%rax, %rbx
145c643ba:     	je	0x145c643e3 <.text+0x5c633e3>
145c643bc:     	cmpl	%r14d, -0xc(%rdx,%r8)
145c643c1:     	jne	0x145c643b0 <.text+0x5c633b0>
145c643c3:     	cmpq	$0x0, -0x20(%rdx,%r8)
145c643c9:     	jne	0x145c643b0 <.text+0x5c633b0>
145c643cb:     	leaq	0x1(%rax), %r9
145c643cf:     	cmpq	%rbx, %r9
145c643d2:     	jae	0x145c64686 <.text+0x5c63686>
145c643d8:     	shlq	$0x5, %rbx
145c643dc:     	jmp	0x145c64639 <.text+0x5c63639>
145c643e1:     	xorl	%ebx, %ebx
145c643e3:     	addss	%xmm6, %xmm10
145c643e8:     	cmpq	(%rcx), %rbx
145c643eb:     	jne	0x145c643f2 <.text+0x5c633f2>
145c643ed:     	callq	0x146061ee0 <.text+0x6060ee0>
145c643f2:     	movq	0x3d8(%rdi), %rax
145c643f9:     	movq	%rbx, %rcx
145c643fc:     	shlq	$0x5, %rcx
145c64400:     	movq	$0x0, (%rax,%rcx)
145c64408:     	movq	0x70(%rbp), %rdx
145c6440c:     	movq	%rdx, 0x8(%rax,%rcx)
145c64411:     	movl	0x78(%rbp), %edx
145c64414:     	movl	%edx, 0x10(%rax,%rcx)
145c64418:     	movl	%r14d, 0x14(%rax,%rcx)
145c6441d:     	movss	%xmm10, 0x18(%rax,%rcx)
145c64424:     	movl	$0x0, 0x1c(%rax,%rcx)
145c6442c:     	incq	%rbx
145c6442f:     	movq	%rbx, 0x3e0(%rdi)
145c64436:     	movq	%rdi, %rcx
145c64439:     	callq	0x145c18970 <.text+0x5c17970>
145c6443e:     	movq	%rdi, %rcx
145c64441:     	callq	0x145c0d580 <.text+0x5c0c580>
145c64446:     	movb	$0x1, %al
145c64448:     	cmpq	$0xc, 0x8(%rsi)
145c6444d:     	jne	0x145c64218 <.text+0x5c63218>
145c64453:     	movq	(%rsi), %rcx
145c64456:     	movabsq	$0x735f656c74746162, %rdx # imm = 0x735F656C74746162
145c64460:     	xorq	(%rcx), %rdx
145c64463:     	movl	0x8(%rcx), %ecx
145c64466:     	xorq	$0x74756f68, %rcx       # imm = 0x74756F68
145c6446d:     	orq	%rdx, %rcx
145c64470:     	jne	0x145c64218 <.text+0x5c63218>
145c64476:     	movl	0x40(%rsi), %edx
145c64479:     	leaq	0x70(%rbp), %r8
145c6447d:     	movq	%rdi, %rcx
145c64480:     	movaps	%xmm6, %xmm3
145c64483:     	callq	0x145c05c60 <.text+0x5c04c60>
145c64488:     	jmp	0x145c64216 <.text+0x5c63216>
// party-aura-recipient
145c07c20:     	pushq	%rbp
145c07c21:     	pushq	%r15
145c07c23:     	pushq	%r14
145c07c25:     	pushq	%rsi
145c07c26:     	pushq	%rdi
145c07c27:     	pushq	%rbx
145c07c28:     	subq	$0xb8, %rsp
145c07c2f:     	leaq	0x80(%rsp), %rbp
145c07c37:     	movaps	%xmm8, 0x20(%rbp)
145c07c3c:     	movaps	%xmm7, 0x10(%rbp)
145c07c40:     	movaps	%xmm6, (%rbp)
145c07c44:     	movq	$-0x2, -0x8(%rbp)
145c07c4c:     	movq	%rcx, %rsi
145c07c4f:     	movss	0x4c8(%rcx), %xmm0
145c07c57:     	movss	0x20(%rdx), %xmm6
145c07c5c:     	movaps	%xmm0, %xmm7
145c07c5f:     	mulss	%xmm6, %xmm7
145c07c63:     	movl	0x28(%rdx), %ecx
145c07c66:     	subl	$0xe, %ecx
145c07c69:     	movl	$0x2, %eax
145c07c6e:     	cmovael	%ecx, %eax
145c07c71:     	testl	%eax, %eax
145c07c73:     	je	0x145c07cdb <.text+0x5c06cdb>
145c07c75:     	cmpl	$0x1, %eax
145c07c78:     	jne	0x145c07d73 <.text+0x5c06d73>
145c07c7e:     	movss	0x53c(%rsi), %xmm0
145c07c86:     	addss	%xmm7, %xmm0
145c07c8a:     	movss	%xmm0, 0x53c(%rsi)
145c07c92:     	cmpl	$0x0, 0x4b8(%rsi)
145c07c99:     	movl	0x1c(%rdx), %edi
145c07c9c:     	je	0x145c07f73 <.text+0x5c06f73>
145c07ca2:     	movq	0x3e0(%rsi), %rbx
145c07ca9:     	testq	%rbx, %rbx
145c07cac:     	je	0x145c07f91 <.text+0x5c06f91>
145c07cb2:     	movq	0x3d8(%rsi), %rax
145c07cb9:     	leaq	0x34(%rax), %r8
145c07cbd:     	xorl	%ecx, %ecx
145c07cbf:     	nop
145c07cc0:     	cmpl	%edi, -0x20(%r8)
145c07cc4:     	je	0x145c08272 <.text+0x5c07272>
145c07cca:     	incq	%rcx
145c07ccd:     	addq	$0x20, %r8
145c07cd1:     	cmpq	%rcx, %rbx
145c07cd4:     	jne	0x145c07cc0 <.text+0x5c06cc0>
145c07cd6:     	jmp	0x145c07f93 <.text+0x5c06f93>
145c07cdb:     	movss	0x24(%rdx), %xmm8
145c07ce1:     	xorps	%xmm1, %xmm1
145c07ce4:     	ucomiss	%xmm1, %xmm8
145c07ce8:     	jbe	0x145c07dd7 <.text+0x5c06dd7>
145c07cee:     	movl	0x1c(%rdx), %edi
145c07cf1:     	movq	0x3e0(%rsi), %r14
145c07cf8:     	testq	%r14, %r14
145c07cfb:     	je	0x145c08077 <.text+0x5c07077>
145c07d01:     	movq	0x3d8(%rsi), %rax
145c07d08:     	movq	0x8(%rdx), %rbx
145c07d0c:     	cmpl	$0x306, %edi            # imm = 0x306
145c07d12:     	jne	0x145c08430 <.text+0x5c07430>
145c07d18:     	xorl	%ecx, %ecx
145c07d1a:     	movq	%rax, %rdx
145c07d1d:     	jmp	0x145c07d30 <.text+0x5c06d30>
145c07d1f:     	nop
145c07d20:     	incq	%rcx
145c07d23:     	addq	$0x20, %rdx
145c07d27:     	cmpq	%rcx, %r14
145c07d2a:     	je	0x145c0807e <.text+0x5c0707e>
145c07d30:     	cmpl	$0x306, 0x14(%rdx)      # imm = 0x306
145c07d37:     	jne	0x145c07d20 <.text+0x5c06d20>
145c07d39:     	cmpq	%rbx, (%rdx)
145c07d3c:     	jne	0x145c07d20 <.text+0x5c06d20>
145c07d3e:     	leaq	0x1(%rcx), %rdx
145c07d42:     	cmpq	%r14, %rdx
145c07d45:     	jae	0x145c083b4 <.text+0x5c073b4>
145c07d4b:     	cmpl	$0x306, %edi            # imm = 0x306
145c07d51:     	jne	0x145c08366 <.text+0x5c07366>
145c07d57:     	movq	%rcx, %rdx
145c07d5a:     	notq	%rdx
145c07d5d:     	addq	%r14, %rdx
145c07d60:     	movq	%rcx, %r8
145c07d63:     	shlq	$0x5, %r8
145c07d67:     	addq	%rax, %r8
145c07d6a:     	addq	$0x20, %r8
145c07d6e:     	jmp	0x145c08261 <.text+0x5c07261>
145c07d73:     	movq	0x3e0(%rsi), %r14
145c07d7a:     	testq	%r14, %r14
145c07d7d:     	je	0x145c07ffa <.text+0x5c06ffa>
145c07d83:     	movq	0x3d8(%rsi), %rcx
145c07d8a:     	movl	0x1c(%rdx), %edi
145c07d8d:     	movq	0x8(%rdx), %rbx
145c07d91:     	leaq	0x20(%rcx), %r8
145c07d95:     	xorl	%eax, %eax
145c07d97:     	jmp	0x145c07db0 <.text+0x5c06db0>
145c07d99:     	nopl	(%rax)
145c07da0:     	incq	%rax
145c07da3:     	addq	$0x20, %r8
145c07da7:     	cmpq	%rax, %r14
145c07daa:     	je	0x145c08004 <.text+0x5c07004>
145c07db0:     	cmpl	%edi, -0xc(%r8)
145c07db4:     	jne	0x145c07da0 <.text+0x5c06da0>
145c07db6:     	cmpq	%rbx, -0x20(%r8)
145c07dba:     	jne	0x145c07da0 <.text+0x5c06da0>
145c07dbc:     	leaq	0x1(%rax), %r9
145c07dc0:     	cmpq	%r14, %r9
145c07dc3:     	jae	0x145c082e4 <.text+0x5c072e4>
145c07dc9:     	movq	%rax, %r9
145c07dcc:     	notq	%r9
145c07dcf:     	addq	%r14, %r9
145c07dd2:     	jmp	0x145c081a4 <.text+0x5c071a4>
145c07dd7:     	movss	0x538(%rsi), %xmm1
145c07ddf:     	addss	%xmm1, %xmm7
145c07de3:     	movaps	%xmm7, %xmm2
145c07de6:     	minss	%xmm0, %xmm2
145c07dea:     	movaps	%xmm2, %xmm0
145c07ded:     	cmpunordss	%xmm2, %xmm0
145c07df2:     	andps	%xmm0, %xmm7
145c07df5:     	andnps	%xmm2, %xmm0
145c07df8:     	orps	%xmm7, %xmm0
145c07dfb:     	movss	%xmm0, 0x538(%rsi)
145c07e03:     	subss	%xmm1, %xmm0
145c07e07:     	ucomiss	0x62b0b2(%rip), %xmm0   # 0x146232ec0
145c07e0e:     	jb	0x145c08219 <.text+0x5c07219>
145c07e14:     	movq	0x4b0(%rsi), %rax
145c07e1b:     	movq	0x8(%rdx), %r8
145c07e1f:     	cvttss2si	%xmm0, %rcx
145c07e24:     	xorl	%r14d, %r14d
145c07e27:     	xorps	%xmm7, %xmm7
145c07e2a:     	ucomiss	%xmm7, %xmm0
145c07e2d:     	cmovbl	%r14d, %ecx
145c07e31:     	movl	0x1c(%rdx), %r9d
145c07e35:     	ucomiss	0x644db8(%rip), %xmm0   # 0x14624cbf4
145c07e3c:     	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
145c07e42:     	cmoval	%r15d, %ecx
145c07e46:     	movl	%ecx, 0x20(%rsp)
145c07e4a:     	movb	$0x0, 0x28(%rsp)
145c07e4f:     	leaq	-0x30(%rbp), %rcx
145c07e53:     	movq	%rax, %rdx
145c07e56:     	callq	0x145af8fb0 <.text+0x5af7fb0>
145c07e5b:     	movq	0x680(%rsi), %rdi
145c07e62:     	cmpq	0x670(%rsi), %rdi
145c07e69:     	jne	0x145c07e78 <.text+0x5c06e78>
145c07e6b:     	leaq	0x670(%rsi), %rcx
145c07e72:     	callq	0x146061ee0 <.text+0x6060ee0>
145c07e77:     	nop
145c07e78:     	movq	0x678(%rsi), %rax
145c07e7f:     	movq	%rdi, %rcx
145c07e82:     	shlq	$0x5, %rcx
145c07e86:     	movups	-0x30(%rbp), %xmm0
145c07e8a:     	movups	-0x20(%rbp), %xmm1
145c07e8e:     	movups	%xmm1, 0x10(%rax,%rcx)
145c07e93:     	movups	%xmm0, (%rax,%rcx)
145c07e97:     	incq	%rdi
145c07e9a:     	movq	%rdi, 0x680(%rsi)
145c07ea1:     	movss	0x4c8(%rsi), %xmm6
145c07ea9:     	movss	0x538(%rsi), %xmm0
145c07eb1:     	maxss	%xmm7, %xmm0
145c07eb5:     	callq	0x146061787 <.text+0x6060787>
145c07eba:     	cvttss2si	%xmm0, %rbx
145c07ebf:     	ucomiss	%xmm7, %xmm0
145c07ec2:     	cmovbl	%r14d, %ebx
145c07ec6:     	movss	0x644d25(%rip), %xmm8   # 0x14624cbf4
145c07ecf:     	ucomiss	%xmm8, %xmm0
145c07ed3:     	cmoval	%r15d, %ebx
145c07ed7:     	movaps	%xmm6, %xmm0
145c07eda:     	callq	0x146061787 <.text+0x6060787>
145c07edf:     	cvttss2si	%xmm0, %rdi
145c07ee4:     	ucomiss	%xmm7, %xmm0
145c07ee7:     	cmovbl	%r14d, %edi
145c07eeb:     	ucomiss	%xmm8, %xmm0
145c07eef:     	cmoval	%r15d, %edi
145c07ef3:     	leaq	0xc58(%rsi), %r14
145c07efa:     	movq	0xc58(%rsi), %rax
145c07f01:     	testq	%rax, %rax
145c07f04:     	je	0x145c081b1 <.text+0x5c071b1>
145c07f0a:     	movq	0xc60(%rsi), %rcx
145c07f11:     	movw	$0x16, %dx
145c07f15:     	movzwl	0x36(%rax), %r9d
145c07f1a:     	movl	%r9d, %r10d
145c07f1d:     	addl	%r10d, %r10d
145c07f20:     	movq	$-0x1, %r8
145c07f27:     	nopw	(%rax,%rax)
145c07f30:     	testq	%r10, %r10
145c07f33:     	je	0x145c07f5f <.text+0x5c06f5f>
145c07f35:     	cmpw	0x3a(%rax,%r8,2), %dx
145c07f3b:     	seta	%r11b
145c07f3f:     	sbbb	$0x0, %r11b
145c07f43:     	incq	%r8
145c07f46:     	addq	$-0x2, %r10
145c07f4a:     	cmpb	$0x1, %r11b
145c07f4e:     	je	0x145c07f30 <.text+0x5c06f30>
145c07f50:     	movzbl	%r11b, %r9d
145c07f54:     	testl	%r9d, %r9d
145c07f57:     	je	0x145c080fb <.text+0x5c070fb>
145c07f5d:     	jmp	0x145c07f62 <.text+0x5c06f62>
145c07f5f:     	movq	%r9, %r8
145c07f62:     	subq	$0x1, %rcx
145c07f66:     	jb	0x145c081b3 <.text+0x5c071b3>
145c07f6c:     	movq	0x50(%rax,%r8,8), %rax
145c07f71:     	jmp	0x145c07f15 <.text+0x5c06f15>
145c07f73:     	movl	%edi, 0x4b8(%rsi)
145c07f79:     	movss	%xmm7, 0x4bc(%rsi)
145c07f81:     	movq	0x3e0(%rsi), %rbx
145c07f88:     	testq	%rbx, %rbx
145c07f8b:     	jne	0x145c07cb2 <.text+0x5c06cb2>
145c07f91:     	xorl	%ebx, %ebx
145c07f93:     	movss	0xcc0(%rsi), %xmm7
145c07f9b:     	addss	0x24(%rdx), %xmm7
145c07fa0:     	cmpq	0x3d0(%rsi), %rbx
145c07fa7:     	jne	0x145c07fb5 <.text+0x5c06fb5>
145c07fa9:     	leaq	0x3d0(%rsi), %rcx
145c07fb0:     	callq	0x146061ee0 <.text+0x6060ee0>
145c07fb5:     	movq	0x3d8(%rsi), %rax
145c07fbc:     	movq	%rbx, %rcx
145c07fbf:     	shlq	$0x5, %rcx
145c07fc3:     	movq	$0x0, (%rax,%rcx)
145c07fcb:     	movl	$0x7, 0x8(%rax,%rcx)
145c07fd3:     	movss	%xmm6, 0xc(%rax,%rcx)
145c07fd9:     	movl	%edi, 0x14(%rax,%rcx)
145c07fdd:     	movss	%xmm7, 0x18(%rax,%rcx)
145c07fe3:     	movl	$0x0, 0x1c(%rax,%rcx)
145c07feb:     	incq	%rbx
145c07fee:     	movq	%rbx, 0x3e0(%rsi)
145c07ff5:     	jmp	0x145c080d7 <.text+0x5c070d7>
145c07ffa:     	movl	0x1c(%rdx), %edi
145c07ffd:     	movq	0x8(%rdx), %rbx
145c08001:     	xorl	%r14d, %r14d
145c08004:     	movss	0xcc0(%rsi), %xmm6
145c0800c:     	addss	0x24(%rdx), %xmm6
145c08011:     	addq	$0x28, %rdx
145c08015:     	cmpq	0x3d0(%rsi), %r14
145c0801c:     	jne	0x145c08030 <.text+0x5c07030>
145c0801e:     	leaq	0x3d0(%rsi), %rcx
145c08025:     	movq	%rdx, %r15
145c08028:     	callq	0x146061ee0 <.text+0x6060ee0>
145c0802d:     	movq	%r15, %rdx
145c08030:     	movq	0x3d8(%rsi), %rax
145c08037:     	movq	%r14, %rcx
145c0803a:     	shlq	$0x5, %rcx
145c0803e:     	movq	%rbx, (%rax,%rcx)
145c08042:     	movq	(%rdx), %r8
145c08045:     	movq	%r8, 0x8(%rax,%rcx)
145c0804a:     	movl	0x8(%rdx), %edx
145c0804d:     	movl	%edx, 0x10(%rax,%rcx)
145c08051:     	movl	%edi, 0x14(%rax,%rcx)
145c08055:     	movss	%xmm6, 0x18(%rax,%rcx)
145c0805b:     	movl	$0x0, 0x1c(%rax,%rcx)
145c08063:     	incq	%r14
145c08066:     	movq	%r14, 0x3e0(%rsi)
145c0806d:     	movq	%rsi, %rcx
145c08070:     	callq	0x145c18970 <.text+0x5c17970>
145c08075:     	jmp	0x145c080d7 <.text+0x5c070d7>
145c08077:     	movq	0x8(%rdx), %rbx
145c0807b:     	xorl	%r14d, %r14d
145c0807e:     	addss	0xcc0(%rsi), %xmm8
145c08087:     	cmpq	0x3d0(%rsi), %r14
145c0808e:     	jne	0x145c0809c <.text+0x5c0709c>
145c08090:     	leaq	0x3d0(%rsi), %rcx
145c08097:     	callq	0x146061ee0 <.text+0x6060ee0>
145c0809c:     	movq	0x3d8(%rsi), %rax
145c080a3:     	movq	%r14, %rcx
145c080a6:     	shlq	$0x5, %rcx
145c080aa:     	movq	%rbx, (%rax,%rcx)
145c080ae:     	movl	$0x6, 0x8(%rax,%rcx)
145c080b6:     	movss	%xmm6, 0xc(%rax,%rcx)
145c080bc:     	movl	%edi, 0x14(%rax,%rcx)
145c080c0:     	movss	%xmm8, 0x18(%rax,%rcx)
145c080c7:     	movss	%xmm7, 0x1c(%rax,%rcx)
145c080cd:     	incq	%r14
145c080d0:     	movq	%r14, 0x3e0(%rsi)
145c080d7:     	movq	%rsi, %rcx
145c080da:     	movaps	(%rbp), %xmm6
145c080de:     	movaps	0x10(%rbp), %xmm7
145c080e2:     	movaps	0x20(%rbp), %xmm8
145c080e7:     	addq	$0xb8, %rsp
145c080ee:     	popq	%rbx
145c080ef:     	popq	%rdi
145c080f0:     	popq	%rsi
145c080f1:     	popq	%r14
145c080f3:     	popq	%r15
145c080f5:     	popq	%rbp
145c080f6:     	jmp	0x145c0d580 <.text+0x5c0c580>
145c080fb:     	movl	%ebx, 0x8(%rax,%r8,4)
145c08100:     	movq	(%r14), %rax
145c08103:     	testq	%rax, %rax
145c08106:     	je	0x145c081eb <.text+0x5c071eb>
145c0810c:     	movq	0xc60(%rsi), %rcx
145c08113:     	movw	$0x1c, %dx
145c08117:     	movzwl	0x36(%rax), %r9d
145c0811c:     	movl	%r9d, %r10d
145c0811f:     	addl	%r10d, %r10d
145c08122:     	movq	$-0x1, %r8
145c08129:     	nopl	(%rax)
145c08130:     	testq	%r10, %r10
145c08133:     	je	0x145c0815b <.text+0x5c0715b>
145c08135:     	cmpw	0x3a(%rax,%r8,2), %dx
145c0813b:     	seta	%r11b
145c0813f:     	sbbb	$0x0, %r11b
145c08143:     	incq	%r8
145c08146:     	addq	$-0x2, %r10
145c0814a:     	cmpb	$0x1, %r11b
145c0814e:     	je	0x145c08130 <.text+0x5c07130>
145c08150:     	movzbl	%r11b, %r9d
145c08154:     	testl	%r9d, %r9d
145c08157:     	je	0x145c0816f <.text+0x5c0716f>
145c08159:     	jmp	0x145c0815e <.text+0x5c0715e>
145c0815b:     	movq	%r9, %r8
145c0815e:     	subq	$0x1, %rcx
145c08162:     	jb	0x145c081ed <.text+0x5c071ed>
145c08168:     	movq	0x50(%rax,%r8,8), %rax
145c0816d:     	jmp	0x145c08117 <.text+0x5c07117>
145c0816f:     	movl	%edi, 0x8(%rax,%r8,4)
145c08174:     	jmp	0x145c08219 <.text+0x5c07219>
145c08179:     	movq	%rax, %r10
145c0817c:     	shlq	$0x5, %r10
145c08180:     	movups	(%r8), %xmm0
145c08184:     	movups	0x10(%r8), %xmm1
145c08189:     	movups	%xmm1, 0x10(%rcx,%r10)
145c0818f:     	movups	%xmm0, (%rcx,%r10)
145c08194:     	incq	%rax
145c08197:     	addq	$0x20, %r8
145c0819b:     	decq	%r9
145c0819e:     	je	0x145c082e4 <.text+0x5c072e4>
145c081a4:     	cmpl	%edi, 0x14(%r8)
145c081a8:     	jne	0x145c08179 <.text+0x5c07179>
145c081aa:     	cmpq	%rbx, (%r8)
145c081ad:     	jne	0x145c08179 <.text+0x5c07179>
145c081af:     	jmp	0x145c08197 <.text+0x5c07197>
145c081b1:     	xorl	%eax, %eax
145c081b3:     	movq	%r14, -0x30(%rbp)
145c081b7:     	movq	%rax, -0x28(%rbp)
145c081bb:     	movq	$0x0, -0x20(%rbp)
145c081c3:     	movq	%r8, -0x18(%rbp)
145c081c7:     	movq	$0x16, -0x10(%rbp)
145c081cf:     	leaq	-0x50(%rbp), %rcx
145c081d3:     	leaq	-0x30(%rbp), %rdx
145c081d7:     	movl	%ebx, %r8d
145c081da:     	callq	0x145cc1610 <.text+0x5cc0610>
145c081df:     	movq	(%r14), %rax
145c081e2:     	testq	%rax, %rax
145c081e5:     	jne	0x145c0810c <.text+0x5c0710c>
145c081eb:     	xorl	%eax, %eax
145c081ed:     	movq	%r14, -0x30(%rbp)
145c081f1:     	movq	%rax, -0x28(%rbp)
145c081f5:     	movq	$0x0, -0x20(%rbp)
145c081fd:     	movq	%r8, -0x18(%rbp)
145c08201:     	movq	$0x1c, -0x10(%rbp)
145c08209:     	leaq	-0x50(%rbp), %rcx
145c0820d:     	leaq	-0x30(%rbp), %rdx
145c08211:     	movl	%edi, %r8d
145c08214:     	callq	0x145cc1610 <.text+0x5cc0610>
145c08219:     	movaps	(%rbp), %xmm6
145c0821d:     	movaps	0x10(%rbp), %xmm7
145c08221:     	movaps	0x20(%rbp), %xmm8
145c08226:     	addq	$0xb8, %rsp
145c0822d:     	popq	%rbx
145c0822e:     	popq	%rdi
145c0822f:     	popq	%rsi
145c08230:     	popq	%r14
145c08232:     	popq	%r15
145c08234:     	popq	%rbp
145c08235:     	retq
145c08236:     	movq	%rcx, %r9
145c08239:     	shlq	$0x5, %r9
145c0823d:     	movups	(%r8), %xmm0
145c08241:     	movups	0x10(%r8), %xmm1
145c08246:     	movups	%xmm1, 0x10(%rax,%r9)
145c0824c:     	movups	%xmm0, (%rax,%r9)
145c08251:     	incq	%rcx
145c08254:     	addq	$0x20, %r8
145c08258:     	decq	%rdx
145c0825b:     	je	0x145c083b4 <.text+0x5c073b4>
145c08261:     	cmpl	$0x306, 0x14(%r8)       # imm = 0x306
145c08269:     	jne	0x145c08236 <.text+0x5c07236>
145c0826b:     	cmpq	%rbx, (%r8)
145c0826e:     	jne	0x145c08236 <.text+0x5c07236>
145c08270:     	jmp	0x145c08254 <.text+0x5c07254>
145c08272:     	leaq	0x1(%rcx), %r10
145c08276:     	cmpq	%rbx, %r10
145c08279:     	jae	0x145c082bb <.text+0x5c072bb>
145c0827b:     	leaq	-0x2(%rbx), %r9
145c0827f:     	leal	(%rbx,%rcx), %r14d
145c08283:     	movq	%rcx, %r11
145c08286:     	testb	$0x1, %r14b
145c0828a:     	jne	0x145c082b3 <.text+0x5c072b3>
145c0828c:     	movq	%rcx, %r11
145c0828f:     	cmpl	%edi, (%r8)
145c08292:     	je	0x145c082af <.text+0x5c072af>
145c08294:     	leaq	-0x14(%r8), %r10
145c08298:     	movups	(%r10), %xmm0
145c0829c:     	movups	0x10(%r10), %xmm1
145c082a1:     	movups	%xmm1, -0x24(%r8)
145c082a6:     	movups	%xmm0, -0x34(%r8)
145c082ab:     	leaq	0x1(%rcx), %r11
145c082af:     	leaq	0x2(%rcx), %r10
145c082b3:     	cmpq	%rcx, %r9
145c082b6:     	movq	%r11, %rcx
145c082b9:     	jne	0x145c082f3 <.text+0x5c072f3>
145c082bb:     	movq	%rcx, 0x3e0(%rsi)
145c082c2:     	movq	%rcx, %rbx
145c082c5:     	movss	0xcc0(%rsi), %xmm7
145c082cd:     	addss	0x24(%rdx), %xmm7
145c082d2:     	cmpq	0x3d0(%rsi), %rbx
145c082d9:     	je	0x145c07fa9 <.text+0x5c06fa9>
145c082df:     	jmp	0x145c07fb5 <.text+0x5c06fb5>
145c082e4:     	movq	%rax, 0x3e0(%rsi)
145c082eb:     	movq	%rax, %r14
145c082ee:     	jmp	0x145c08004 <.text+0x5c07004>
145c082f3:     	subq	%r10, %rbx
145c082f6:     	shlq	$0x5, %r10
145c082fa:     	leaq	(%r10,%rax), %r8
145c082fe:     	addq	$0x34, %r8
145c08302:     	movq	%r11, %rcx
145c08305:     	jmp	0x145c08311 <.text+0x5c07311>
145c08307:     	addq	$0x40, %r8
145c0830b:     	addq	$-0x2, %rbx
145c0830f:     	je	0x145c082bb <.text+0x5c072bb>
145c08311:     	cmpl	%edi, -0x20(%r8)
145c08315:     	jne	0x145c0831e <.text+0x5c0731e>
145c08317:     	cmpl	%edi, (%r8)
145c0831a:     	je	0x145c08307 <.text+0x5c07307>
145c0831c:     	jmp	0x145c08345 <.text+0x5c07345>
145c0831e:     	leaq	-0x34(%r8), %r9
145c08322:     	movq	%rcx, %r10
145c08325:     	shlq	$0x5, %r10
145c08329:     	movups	(%r9), %xmm0
145c0832d:     	movups	0x10(%r9), %xmm1
145c08332:     	movups	%xmm1, 0x10(%rax,%r10)
145c08338:     	movups	%xmm0, (%rax,%r10)
145c0833d:     	incq	%rcx
145c08340:     	cmpl	%edi, (%r8)
145c08343:     	je	0x145c08307 <.text+0x5c07307>
145c08345:     	movq	%rcx, %r9
145c08348:     	shlq	$0x5, %r9
145c0834c:     	movups	-0x14(%r8), %xmm0
145c08351:     	movups	-0x4(%r8), %xmm1
145c08356:     	movups	%xmm1, 0x10(%rax,%r9)
145c0835c:     	movups	%xmm0, (%rax,%r9)
145c08361:     	incq	%rcx
145c08364:     	jmp	0x145c08307 <.text+0x5c07307>
145c08366:     	leaq	-0x2(%r14), %r8
145c0836a:     	movl	%ecx, %r9d
145c0836d:     	subl	%r14d, %r9d
145c08370:     	testb	$0x1, %r9b
145c08374:     	jne	0x145c083a9 <.text+0x5c073a9>
145c08376:     	shlq	$0x5, %rdx
145c0837a:     	movq	%rcx, %r9
145c0837d:     	cmpl	%edi, 0x14(%rax,%rdx)
145c08381:     	je	0x145c083a3 <.text+0x5c073a3>
145c08383:     	addq	%rax, %rdx
145c08386:     	movq	%rcx, %r9
145c08389:     	shlq	$0x5, %r9
145c0838d:     	movups	(%rdx), %xmm0
145c08390:     	movups	0x10(%rdx), %xmm1
145c08394:     	movups	%xmm1, 0x10(%rax,%r9)
145c0839a:     	movups	%xmm0, (%rax,%r9)
145c0839f:     	leaq	0x1(%rcx), %r9
145c083a3:     	leaq	0x2(%rcx), %rdx
145c083a7:     	jmp	0x145c083ac <.text+0x5c073ac>
145c083a9:     	movq	%rcx, %r9
145c083ac:     	cmpq	%rcx, %r8
145c083af:     	movq	%r9, %rcx
145c083b2:     	jne	0x145c083c3 <.text+0x5c073c3>
145c083b4:     	movq	%rcx, 0x3e0(%rsi)
145c083bb:     	movq	%rcx, %r14
145c083be:     	jmp	0x145c0807e <.text+0x5c0707e>
145c083c3:     	subq	%rdx, %r14
145c083c6:     	shlq	$0x5, %rdx
145c083ca:     	addq	%rax, %rdx
145c083cd:     	addq	$0x34, %rdx
145c083d1:     	movq	%r9, %rcx
145c083d4:     	jmp	0x145c083e0 <.text+0x5c073e0>
145c083d6:     	addq	$0x40, %rdx
145c083da:     	addq	$-0x2, %r14
145c083de:     	je	0x145c083b4 <.text+0x5c073b4>
145c083e0:     	cmpl	%edi, -0x20(%rdx)
145c083e3:     	jne	0x145c083eb <.text+0x5c073eb>
145c083e5:     	cmpl	%edi, (%rdx)
145c083e7:     	je	0x145c083d6 <.text+0x5c073d6>
145c083e9:     	jmp	0x145c08411 <.text+0x5c07411>
145c083eb:     	leaq	-0x34(%rdx), %r8
145c083ef:     	movq	%rcx, %r9
145c083f2:     	shlq	$0x5, %r9
145c083f6:     	movups	(%r8), %xmm0
145c083fa:     	movups	0x10(%r8), %xmm1
145c083ff:     	movups	%xmm1, 0x10(%rax,%r9)
145c08405:     	movups	%xmm0, (%rax,%r9)
145c0840a:     	incq	%rcx
145c0840d:     	cmpl	%edi, (%rdx)
145c0840f:     	je	0x145c083d6 <.text+0x5c073d6>
145c08411:     	movq	%rcx, %r8
145c08414:     	shlq	$0x5, %r8
145c08418:     	movups	-0x14(%rdx), %xmm0
145c0841c:     	movups	-0x4(%rdx), %xmm1
145c08420:     	movups	%xmm1, 0x10(%rax,%r8)
145c08426:     	movups	%xmm0, (%rax,%r8)
145c0842b:     	incq	%rcx
145c0842e:     	jmp	0x145c083d6 <.text+0x5c073d6>
145c08430:     	leaq	0x14(%rax), %rdx
145c08434:     	xorl	%ecx, %ecx
145c08436:     	cmpl	%edi, (%rdx)
145c08438:     	je	0x145c07d3e <.text+0x5c06d3e>
145c0843e:     	incq	%rcx
145c08441:     	addq	$0x20, %rdx
145c08445:     	cmpq	%rcx, %r14
145c08448:     	jne	0x145c08436 <.text+0x5c07436>
145c0844a:     	jmp	0x145c0807e <.text+0x5c0707e>
// party-recipient-routing
145bfe5b0:     	movq	0xb00(%r13), %rax
145bfe5b7:     	movq	%rax, -0x50(%rbp)
145bfe5bb:     	movups	0xaf0(%r13), %xmm0
145bfe5c3:     	movaps	%xmm0, -0x60(%rbp)
145bfe5c7:     	movq	$0x0, 0xaf0(%r13)
145bfe5d2:     	movq	$0x8, 0xaf8(%r13)
145bfe5dd:     	movq	$0x0, 0xb00(%r13)
145bfe5e8:     	movq	-0x50(%rbp), %rax
145bfe5ec:     	testq	%rax, %rax
145bfe5ef:     	je	0x145bfe7f0 <.text+0x5bfd7f0>
145bfe5f5:     	leaq	-0x60(%rbp), %rcx
145bfe5f9:     	movq	%rcx, 0x1450(%rbp)
145bfe600:     	cmpb	$0x1, 0xd83(%r13)
145bfe608:     	jne	0x145bfe664 <.text+0x5bfd664>
145bfe60a:     	movq	-0x58(%rbp), %rdi
145bfe60e:     	imulq	$0x38, %rax, %rsi
145bfe612:     	addq	%rdi, %rsi
145bfe615:     	movss	0x65d1fb(%rip), %xmm7   # 0x14625b818
145bfe61d:     	jmp	0x145bfe629 <.text+0x5bfd629>
145bfe61f:     	nop
145bfe620:     	addq	$0x38, %rdi
145bfe624:     	cmpq	%rsi, %rdi
145bfe627:     	je	0x145bfe664 <.text+0x5bfd664>
145bfe629:     	movq	(%rdi), %rax
145bfe62c:     	cmpq	0xc78(%r13), %rax
145bfe633:     	je	0x145bfe620 <.text+0x5bfd620>
145bfe635:     	movsd	0x10(%rdi), %xmm0
145bfe63a:     	movsd	0x520(%r13), %xmm1
145bfe643:     	subps	%xmm1, %xmm0
145bfe646:     	mulps	%xmm0, %xmm0
145bfe649:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
145bfe64d:     	addss	%xmm0, %xmm1
145bfe651:     	ucomiss	%xmm1, %xmm7
145bfe654:     	jb	0x145bfe620 <.text+0x5bfd620>
145bfe656:     	movq	%r13, %rcx
145bfe659:     	movq	%rdi, %rdx
145bfe65c:     	callq	0x145c07c20 <.text+0x5c06c20>
145bfe661:     	nop
145bfe662:     	jmp	0x145bfe620 <.text+0x5bfd620>
145bfe664:     	movq	%r13, %rcx
145bfe667:     	callq	0x145c09720 <.text+0x5c08720>
145bfe66c:     	nop
145bfe66d:     	cmpq	$0x0, 0xa58(%r13)
145bfe675:     	je	0x145bfe7f0 <.text+0x5bfd7f0>
145bfe67b:     	movq	0x10(%rbx), %rax
145bfe67f:     	movq	%rax, 0x9d0(%rbp)
145bfe686:     	movups	(%rbx), %xmm0
145bfe689:     	movaps	%xmm0, 0x9c0(%rbp)
145bfe690:     	movq	$0x0, 0xa48(%r13)
145bfe69b:     	movq	$0x8, 0xa50(%r13)
145bfe6a6:     	movq	$0x0, 0xa58(%r13)
145bfe6b1:     	imulq	$0xa18, 0x9d0(%rbp), %rax # imm = 0xA18
145bfe6bc:     	movq	0x9c8(%rbp), %rdx
145bfe6c3:     	addq	%rdx, %rax
145bfe6c6:     	movq	%rax, 0x1498(%rbp)
145bfe6cd:     	xorl	%esi, %esi
145bfe6cf:     	leaq	0x1450(%rbp), %rdi
145bfe6d6:     	cmpq	0x1498(%rbp), %rdx
145bfe6dd:     	movq	%rdx, 0x14a0(%rbp)
145bfe6e4:     	je	0x145bfe759 <.text+0x5bfd759>
145bfe6e6:     	nopw	%cs:(%rax,%rax)
145bfe6f0:     	incq	%rsi
145bfe6f3:     	movq	%r13, %rcx
145bfe6f6:     	callq	0x145c4e0a0 <.text+0x5c4d0a0>
145bfe6fb:     	movq	%rsi, 0xc78(%r13)
145bfe702:     	movq	0x2f0(%r13), %rcx
145bfe709:     	movq	0x2f8(%r13), %rdx
145bfe710:     	movq	%rdi, %r8
145bfe713:     	movq	%r13, %r9
145bfe716:     	callq	0x145be2030 <.text+0x5be1030>
145bfe71b:     	nop
145bfe71c:     	movq	%r13, %rcx
145bfe71f:     	callq	0x145c09720 <.text+0x5c08720>
145bfe724:     	nop
145bfe725:     	movq	0x14a0(%rbp), %rdx
145bfe72c:     	leaq	0xa18(%rdx), %rbx
145bfe733:     	movq	$0x0, 0xc78(%r13)
145bfe73e:     	movq	%r13, %rcx
145bfe741:     	callq	0x145c4e0a0 <.text+0x5c4d0a0>
145bfe746:     	movq	%rbx, %rdx
145bfe749:     	cmpq	0x1498(%rbp), %rdx
145bfe750:     	movq	%rdx, 0x14a0(%rbp)
145bfe757:     	jne	0x145bfe6f0 <.text+0x5bfd6f0>
145bfe759:     	movq	0xa50(%r13), %rcx
145bfe760:     	movq	0xa58(%r13), %rax
145bfe767:     	movq	%rax, 0x1490(%rbp)
145bfe76e:     	movq	$0x0, 0x14b0(%rbp)
145bfe779:     	movq	%rcx, 0x1478(%rbp)
145bfe780:     	movq	0x14b0(%rbp), %rax
145bfe787:     	cmpq	%rax, 0x1490(%rbp)
145bfe78e:     	je	0x145bfe7ac <.text+0x5bfd7ac>
145bfe790:     	incq	%rax
145bfe793:     	movq	%rax, 0x14b0(%rbp)
145bfe79a:     	leaq	0xa18(%rcx), %rsi
145bfe7a1:     	callq	0x145cea0f0 <.text+0x5ce90f0>
145bfe7a6:     	nop
145bfe7a7:     	movq	%rsi, %rcx
145bfe7aa:     	jmp	0x145bfe780 <.text+0x5bfd780>
145bfe7ac:     	movq	0x14a8(%rbp), %rbx
145bfe7b3:     	movq	(%rbx), %rax
145bfe7b6:     	testq	%rax, %rax
145bfe7b9:     	movq	0x1480(%rbp), %r13
145bfe7c0:     	je	0x145bfe7db <.text+0x5bfd7db>
145bfe7c2:     	movq	0xa50(%r13), %rcx
145bfe7c9:     	imulq	$0xa18, %rax, %rdx      # imm = 0xA18
145bfe7d0:     	movl	$0x8, %r8d
145bfe7d6:     	callq	0x1400021d0 <.text+0x11d0>
145bfe7db:     	movq	0x9d0(%rbp), %rax
145bfe7e2:     	movq	%rax, 0x10(%rbx)
145bfe7e6:     	movaps	0x9c0(%rbp), %xmm0
145bfe7ed:     	movups	%xmm0, (%rbx)
// enemy-weakening
145c6910f:     	movq	0x5c0(%rsi), %rax
145c69116:     	testq	%rax, %rax
145c69119:     	je	0x145c68a87 <.text+0x5c67a87>
145c6911f:     	movss	0x4(%r8), %xmm6
145c69125:     	movss	0x8(%r8), %xmm8
145c6912b:     	movq	0x5b8(%rsi), %rbx
145c69132:     	imulq	$0x1f8, %rax, %rax      # imm = 0x1F8
145c69139:     	addq	$0x110, %rbx            # imm = 0x110
145c69140:     	jmp	0x145c69163 <.text+0x5c68163>
145c69142:     	nopw	%cs:(%rax,%rax)
145c69150:     	addq	$0x1f8, %rbx            # imm = 0x1F8
145c69157:     	addq	$-0x1f8, %rax           # imm = 0xFE08
145c6915d:     	je	0x145c68a87 <.text+0x5c67a87>
145c69163:     	cmpq	%rdx, -0x20(%rbx)
145c69167:     	jne	0x145c69150 <.text+0x5c68150>
145c69169:     	cmpl	$0x1, -0x60(%rbx)
145c6916d:     	je	0x145c69150 <.text+0x5c68150>
145c6916f:     	movq	%rdx, %r14
145c69172:     	movaps	%xmm3, %xmm7
145c69175:     	addss	%xmm8, %xmm7
145c6917a:     	movq	%rbx, %rcx
145c6917d:     	movaps	%xmm6, %xmm1
145c69180:     	movaps	%xmm7, %xmm2
145c69183:     	callq	0x145b760b0 <.text+0x5b750b0>
145c69188:     	movss	(%rbx), %xmm0
145c6918c:     	ucomiss	%xmm6, %xmm0
145c6918f:     	jne	0x145c691a8 <.text+0x5c681a8>
145c69191:     	jp	0x145c691a8 <.text+0x5c681a8>
145c69193:     	movss	0x4(%rbx), %xmm0
145c69198:     	ucomiss	%xmm7, %xmm0
145c6919b:     	jne	0x145c691a8 <.text+0x5c681a8>
145c6919d:     	jp	0x145c691a8 <.text+0x5c681a8>
145c6919f:     	movss	%xmm8, 0xb0(%rbx)
145c691a8:     	testl	%edi, %edi
145c691aa:     	je	0x145c68a87 <.text+0x5c67a87>
145c691b0:     	movl	0xac(%rbx), %r8d
// amplification-discriminator
145c771da:     	cmpl	$-0x1, %eax
145c771dd:     	jne	0x145c78a65 <.text+0x5c77a65>
145c771e3:     	movl	$0xa, %edx
145c771e8:     	leaq	0x1768b11(%rip), %rcx   # 0x1473dfd00
145c771ef:     	callq	0x145b059e0 <.text+0x5b049e0>
145c771f4:     	nop
145c771f5:     	movq	0x5c0(%r13), %rdx
145c771fc:     	testq	%rdx, %rdx
145c771ff:     	movl	0x220(%rbp), %r8d
145c77206:     	movq	0x1e0(%rbp), %r9
145c7720d:     	je	0x145c75a10 <.text+0x5c74a10>
145c77213:     	movd	%r12d, %xmm1
145c77218:     	movd	%esi, %xmm2
145c7721c:     	movl	0x40(%rax), %eax
145c7721f:     	movq	0x5b8(%r13), %rcx
145c77226:     	imulq	$0x1f8, %rdx, %rdx      # imm = 0x1F8
145c7722d:     	addq	$0x128, %rcx            # imm = 0x128
145c77234:     	jmp	0x145c77956 <.text+0x5c76956>
// amplification-update
145c77942:     	addq	$0x1f8, %rcx            # imm = 0x1F8
145c77949:     	addq	$-0x1f8, %rdx           # imm = 0xFE08
145c77950:     	je	0x145c75a10 <.text+0x5c74a10>
145c77956:     	cmpq	%r9, -0x38(%rcx)
145c7795a:     	jne	0x145c77942 <.text+0x5c76942>
145c7795c:     	cmpl	$0x1, -0x78(%rcx)
145c77960:     	je	0x145c77942 <.text+0x5c76942>
145c77962:     	addss	%xmm6, %xmm2
145c77966:     	cmpl	%eax, %r8d
145c77969:     	jne	0x145c7916f <.text+0x5c7816f>
145c7796f:     	movaps	%xmm6, %xmm3
145c77972:     	callq	0x145b760b0 <.text+0x5b750b0>
145c77977:     	jmp	0x145c75a10 <.text+0x5c74a10>
// judgement-update
145c7916f:     	movl	%r12d, -0x8(%rcx)
145c79173:     	movss	%xmm2, -0x4(%rcx)
145c79178:     	jmp	0x145c75a10 <.text+0x5c74a10>
// independent-hit-consumers
145c326bf:     	movss	-0xd4(%rax), %xmm2
145c326c7:     	ucomiss	%xmm1, %xmm2
145c326ca:     	jbe	0x145c326d5 <.text+0x5c316d5>
145c326cc:     	addss	-0xd8(%rax), %xmm8
145c326d5:     	movss	-0xcc(%rax), %xmm2
145c326dd:     	movl	$0x128, %ecx            # imm = 0x128
145c326e2:     	ucomiss	%xmm1, %xmm2
145c326e5:     	ja	0x145c326fc <.text+0x5c316fc>
145c326e7:     	movss	-0xc4(%rax), %xmm3
145c326ef:     	xorps	%xmm2, %xmm2
145c326f2:     	movl	$0x130, %ecx            # imm = 0x130
145c326f7:     	ucomiss	%xmm1, %xmm3
145c326fa:     	jbe	0x145c32705 <.text+0x5c31705>
145c326fc:     	movss	-0x1f8(%rcx,%rax), %xmm2
145c32705:     	addss	%xmm2, %xmm8

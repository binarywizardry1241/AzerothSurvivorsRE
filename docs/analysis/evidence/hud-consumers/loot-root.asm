
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140279050:     	pushq	%rbp
140279051:     	pushq	%r15
140279053:     	pushq	%r14
140279055:     	pushq	%r13
140279057:     	pushq	%r12
140279059:     	pushq	%rsi
14027905a:     	pushq	%rdi
14027905b:     	pushq	%rbx
14027905c:     	subq	$0x3d8, %rsp            # imm = 0x3D8
140279063:     	leaq	0x80(%rsp), %rbp
14027906b:     	movaps	%xmm10, 0x340(%rbp)
140279073:     	movaps	%xmm9, 0x330(%rbp)
14027907b:     	movaps	%xmm8, 0x320(%rbp)
140279083:     	movdqa	%xmm7, 0x310(%rbp)
14027908b:     	movaps	%xmm6, 0x300(%rbp)
140279092:     	movq	$-0x2, 0x2f8(%rbp)
14027909d:     	movq	0x3d8(%rbp), %rsi
1402790a4:     	movq	0x3e8(%rbp), %rax
1402790ab:     	movq	0x3e0(%rbp), %rcx
1402790b2:     	movq	0x3d0(%rbp), %r10
1402790b9:     	movq	0x3c8(%rbp), %r11
1402790c0:     	movq	0x3c0(%rbp), %rdi
1402790c7:     	movq	0x20(%rdx), %rbx
1402790cb:     	movq	%rbx, 0x170(%rbp)
1402790d2:     	movups	(%rdx), %xmm0
1402790d5:     	movups	0x10(%rdx), %xmm1
1402790d9:     	movaps	%xmm1, 0x160(%rbp)
1402790e0:     	movaps	%xmm0, 0x150(%rbp)
1402790e7:     	movups	(%r8), %xmm0
1402790eb:     	movups	0x10(%r8), %xmm1
1402790f0:     	movups	%xmm1, 0x188(%rbp)
1402790f7:     	movups	%xmm0, 0x178(%rbp)
1402790fe:     	movups	(%r9), %xmm0
140279102:     	movups	0x10(%r9), %xmm1
140279107:     	movaps	%xmm1, 0x220(%rbp)
14027910e:     	movaps	%xmm0, 0x210(%rbp)
140279115:     	movups	(%rdi), %xmm0
140279118:     	movups	0x10(%rdi), %xmm1
14027911c:     	movups	%xmm1, 0x1a8(%rbp)
140279123:     	movups	%xmm0, 0x198(%rbp)
14027912a:     	movups	(%r11), %xmm0
14027912e:     	movups	0x10(%r11), %xmm1
140279133:     	movups	%xmm0, 0x1b8(%rbp)
14027913a:     	movups	%xmm1, 0x1c8(%rbp)
140279141:     	movups	(%r10), %xmm0
140279145:     	movups	%xmm0, 0x1d8(%rbp)
14027914c:     	movq	0x10(%r10), %rdx
140279150:     	movq	%rdx, 0x1e8(%rbp)
140279157:     	movq	%rsi, 0x1f0(%rbp)
14027915e:     	movq	0x10(%rcx), %rdx
140279162:     	movq	%rdx, 0x208(%rbp)
140279169:     	movups	(%rcx), %xmm0
14027916c:     	movups	%xmm0, 0x1f8(%rbp)
140279173:     	movups	(%rax), %xmm0
140279176:     	movups	0x10(%rax), %xmm1
14027917a:     	movaps	%xmm1, 0x240(%rbp)
140279181:     	movaps	%xmm0, 0x230(%rbp)
140279188:     	movq	0x178(%rbp), %r12
14027918f:     	movq	0x1b8(%rbp), %rax
140279196:     	movss	0x5c(%rax), %xmm6
14027919b:     	cmpb	$-0x1, 0x80(%r12)
1402791a4:     	jne	0x1402791c1 <.text+0x2781c1>
1402791a6:     	cmpb	$0x1, 0xea(%r12)
1402791af:     	je	0x1402791c1 <.text+0x2781c1>
1402791b1:     	movq	0x230(%rbp), %rcx
1402791b8:     	cmpb	$0x0, (%rcx)
1402791bb:     	je	0x14027933f <.text+0x27833f>
1402791c1:     	movss	0x58(%rax), %xmm0
1402791c6:     	movl	0x194(%rbp), %r8d
1402791cd:     	movq	0x188(%rbp), %r10
1402791d4:     	movl	%r8d, (%r10)
1402791d7:     	movq	0x40(%r12), %rax
1402791dc:     	testq	%rax, %rax
1402791df:     	je	0x1402792f1 <.text+0x2782f1>
1402791e5:     	shlq	$0x3, %rax
1402791e9:     	leaq	(%rax,%rax,4), %rdi
1402791ed:     	leaq	-0x28(%rdi), %rcx
1402791f1:     	movabsq	$-0x3333333333333333, %rdx # imm = 0xCCCCCCCCCCCCCCCD
1402791fb:     	movq	%rcx, %rax
1402791fe:     	mulq	%rdx
140279201:     	movq	0x38(%r12), %rax
140279206:     	movq	%rax, %r11
140279209:     	cmpq	$0x78, %rcx
14027920d:     	jb	0x1402792b9 <.text+0x2782b9>
140279213:     	shrq	$0x5, %rdx
140279217:     	incq	%rdx
14027921a:     	movq	%rdx, %rcx
14027921d:     	andq	$-0x4, %rcx
140279221:     	leaq	(%rcx,%rcx,4), %r11
140279225:     	leaq	(%rax,%r11,8), %r11
140279229:     	movaps	%xmm0, %xmm1
14027922c:     	shufps	$0x0, %xmm0, %xmm1      # xmm1 = xmm1[0,0],xmm0[0,0]
140279230:     	movaps	%xmm6, %xmm2
140279233:     	shufps	$0x0, %xmm6, %xmm2      # xmm2 = xmm2[0,0],xmm6[0,0]
140279237:     	leaq	0x98(%rax), %rbx
14027923e:     	movq	%rcx, %r14
140279241:     	nopw	%cs:(%rax,%rax)
140279250:     	movss	-0x78(%rbx), %xmm3
140279255:     	movss	-0x50(%rbx), %xmm4
14027925a:     	unpcklps	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0],xmm3[1],xmm4[1]
14027925d:     	movss	-0x28(%rbx), %xmm4
140279262:     	movss	(%rbx), %xmm5
140279266:     	unpcklps	%xmm5, %xmm4            # xmm4 = xmm4[0],xmm5[0],xmm4[1],xmm5[1]
140279269:     	movlhps	%xmm4, %xmm3            # xmm3 = xmm3[0],xmm4[0]
14027926c:     	addps	%xmm1, %xmm3
14027926f:     	movaps	%xmm3, %xmm4
140279272:     	minps	%xmm2, %xmm4
140279275:     	movaps	%xmm4, %xmm5
140279278:     	cmpunordps	%xmm4, %xmm5
14027927c:     	andps	%xmm5, %xmm3
14027927f:     	andnps	%xmm4, %xmm5
140279282:     	orps	%xmm3, %xmm5
140279285:     	pshufd	$0xf5, %xmm5, %xmm3     # xmm3 = xmm5[1,1,3,3]
14027928a:     	pshufd	$0xee, %xmm5, %xmm4     # xmm4 = xmm5[2,3,2,3]
14027928f:     	pshufd	$0xff, %xmm5, %xmm7     # xmm7 = xmm5[3,3,3,3]
140279294:     	movss	%xmm5, -0x78(%rbx)
140279299:     	movd	%xmm3, -0x50(%rbx)
14027929e:     	movd	%xmm4, -0x28(%rbx)
1402792a3:     	movd	%xmm7, (%rbx)
1402792a7:     	addq	$0xa0, %rbx
1402792ae:     	addq	$-0x4, %r14
1402792b2:     	jne	0x140279250 <.text+0x278250>
1402792b4:     	cmpq	%rcx, %rdx
1402792b7:     	je	0x1402792f1 <.text+0x2782f1>
1402792b9:     	addq	%rdi, %rax
1402792bc:     	nopl	(%rax)
1402792c0:     	movss	0x20(%r11), %xmm1
1402792c6:     	addss	%xmm0, %xmm1
1402792ca:     	movaps	%xmm1, %xmm2
1402792cd:     	minss	%xmm6, %xmm2
1402792d1:     	movaps	%xmm2, %xmm3
1402792d4:     	cmpunordss	%xmm2, %xmm3
1402792d9:     	andps	%xmm3, %xmm1
1402792dc:     	andnps	%xmm2, %xmm3
1402792df:     	orps	%xmm1, %xmm3
1402792e2:     	movss	%xmm3, 0x20(%r11)
1402792e8:     	addq	$0x28, %r11
1402792ec:     	cmpq	%rax, %r11
1402792ef:     	jne	0x1402792c0 <.text+0x2782c0>
1402792f1:     	movl	%r8d, (%r10)
1402792f4:     	movq	0x40(%r12), %rax
1402792f9:     	testq	%rax, %rax
1402792fc:     	je	0x14027935a <.text+0x27835a>
1402792fe:     	movq	0x38(%r12), %rdx
140279303:     	xorl	%edi, %edi
140279305:     	movss	0x5b45333(%rip), %xmm7  # 0x145dbe640
14027930d:     	movq	%rdx, %rcx
140279310:     	movaps	%xmm6, %xmm0
140279313:     	subss	0x20(%rcx), %xmm0
140279318:     	ucomiss	%xmm0, %xmm7
14027931b:     	jbe	0x140279bf0 <.text+0x278bf0>
140279321:     	incq	%rdi
140279324:     	addq	$0x28, %rcx
140279328:     	cmpq	%rdi, %rax
14027932b:     	jne	0x140279310 <.text+0x278310>
14027932d:     	movq	%rax, %rdi
140279330:     	cmpq	$0x0, 0x210(%rbp)
140279338:     	jne	0x14027936a <.text+0x27836a>
14027933a:     	jmp	0x140279cb3 <.text+0x278cb3>
14027933f:     	movl	0x194(%rbp), %r8d
140279346:     	movq	0x188(%rbp), %r10
14027934d:     	movl	%r8d, (%r10)
140279350:     	movq	0x40(%r12), %rax
140279355:     	testq	%rax, %rax
140279358:     	jne	0x1402792fe <.text+0x2782fe>
14027935a:     	xorl	%edi, %edi
14027935c:     	cmpq	$0x0, 0x210(%rbp)
140279364:     	je	0x140279cb3 <.text+0x278cb3>
14027936a:     	movups	(%r9), %xmm0
14027936e:     	movups	0x10(%r9), %xmm1
140279373:     	movaps	%xmm1, -0x50(%rbp)
140279377:     	movaps	%xmm0, -0x60(%rbp)
14027937b:     	movl	0x28(%r12), %eax
140279380:     	cmpq	(%rsi), %rdi
140279383:     	jne	0x140279429 <.text+0x278429>
140279389:     	cmpl	%eax, 0x8(%rsi)
14027938c:     	jne	0x140279429 <.text+0x278429>
140279392:     	movq	0x1d8(%rbp), %rcx
140279399:     	movq	0x1e0(%rbp), %rbx
1402793a0:     	movq	0xf8(%rcx), %r14
1402793a7:     	movq	0x100(%rcx), %rdx
1402793ae:     	movzbl	0x108(%rcx), %ecx
1402793b5:     	leaq	(,%rdx,4), %r8
1402793bd:     	xorl	%r9d, %r9d
1402793c0:     	testb	%cl, %cl
1402793c2:     	je	0x140279400 <.text+0x278400>
1402793c4:     	nopw	%cs:(%rax,%rax)
1402793d0:     	cmpq	%r9, %r8
1402793d3:     	je	0x14027944e <.text+0x27844e>
1402793d5:     	movl	(%r14,%r9), %r10d
1402793d9:     	movq	0x1a8(%rbx), %r11
1402793e0:     	leaq	(%r10,%r10,8), %r10
1402793e4:     	addq	$0x4, %r9
1402793e8:     	cmpq	$0x0, 0x10(%r11,%r10,8)
1402793ee:     	je	0x1402793d0 <.text+0x2783d0>
1402793f0:     	jmp	0x14027989b <.text+0x27889b>
1402793f5:     	nopw	%cs:(%rax,%rax)
140279400:     	cmpq	%r9, %r8
140279403:     	je	0x14027944e <.text+0x27844e>
140279405:     	movl	(%r14,%r9), %r10d
140279409:     	movq	0x108(%rbx), %r11
140279410:     	leaq	(%r10,%r10,4), %r10
140279414:     	shlq	$0x5, %r10
140279418:     	addq	$0x4, %r9
14027941c:     	cmpq	$0x0, 0x58(%r11,%r10)
140279422:     	je	0x140279400 <.text+0x278400>
140279424:     	jmp	0x14027989b <.text+0x27889b>
140279429:     	movq	0x1d8(%rbp), %rcx
140279430:     	movq	0x1e0(%rbp), %rbx
140279437:     	movq	0xf8(%rcx), %r14
14027943e:     	movq	0x100(%rcx), %rdx
140279445:     	movzbl	0x108(%rcx), %ecx
14027944c:     	jmp	0x140279457 <.text+0x278457>
14027944e:     	testq	%rdi, %rdi
140279451:     	je	0x14027989b <.text+0x27889b>
140279457:     	movq	%rdi, (%rsi)
14027945a:     	movl	%eax, 0x8(%rsi)
14027945d:     	leaq	(%r14,%rdx,4), %r15
140279461:     	movq	0x160(%rbp), %rdx
140279468:     	movq	0x170(%rbp), %r8
14027946f:     	movq	0x168(%rbp), %r9
140279476:     	movq	0x150(%rbp), %r10
14027947d:     	movq	0x158(%rbp), %r11
140279484:     	movl	$0x8, %edi
140279489:     	xorl	%esi, %esi
14027948b:     	xorl	%r13d, %r13d
14027948e:     	testb	%cl, %cl
140279490:     	jne	0x1402794b0 <.text+0x2784b0>
140279492:     	jmp	0x140279594 <.text+0x278594>
140279497:     	leaq	(%rax,%rcx,8), %rax
14027949b:     	movq	0x8(%rax), %rdi
14027949f:     	xorl	%r13d, %r13d
1402794a2:     	movl	%r13d, %eax
1402794a5:     	incl	%r13d
1402794a8:     	movq	(%rdi,%rax,8), %rax
1402794ac:     	testl	%eax, %eax
1402794ae:     	jne	0x1402794e7 <.text+0x2784e7>
1402794b0:     	cmpl	%esi, %r13d
1402794b3:     	jne	0x1402794a2 <.text+0x2784a2>
1402794b5:     	nopw	%cs:(%rax,%rax)
1402794c0:     	cmpq	%r15, %r14
1402794c3:     	je	0x14027965c <.text+0x27865c>
1402794c9:     	movl	(%r14), %ecx
1402794cc:     	addq	$0x4, %r14
1402794d0:     	movq	0x1a8(%rbx), %rax
1402794d7:     	leaq	(%rcx,%rcx,8), %rcx
1402794db:     	movq	0x10(%rax,%rcx,8), %rsi
1402794e0:     	testq	%rsi, %rsi
1402794e3:     	je	0x1402794c0 <.text+0x2784c0>
1402794e5:     	jmp	0x140279497 <.text+0x278497>
1402794e7:     	testq	%rdx, %rdx
1402794ea:     	movq	0x2c8(%rbp), %rcx
1402794f1:     	cmovneq	%r8, %rcx
1402794f5:     	movq	%rax, -0x40(%rbp)
1402794f9:     	movq	%r10, -0x38(%rbp)
1402794fd:     	movq	%r11, -0x30(%rbp)
140279501:     	movq	%rdx, -0x28(%rbp)
140279505:     	movq	%r9, -0x20(%rbp)
140279509:     	movq	%rcx, 0x2c8(%rbp)
140279510:     	movq	%rcx, -0x18(%rbp)
140279514:     	leaq	-0x40(%rbp), %rcx
140279518:     	movq	%rdx, 0x2e0(%rbp)
14027951f:     	leaq	0x5b470e2(%rip), %rdx   # 0x145dc0608
140279526:     	movq	%r8, 0x2f0(%rbp)
14027952d:     	movq	%r9, 0x2e8(%rbp)
140279534:     	movq	%r10, 0x2d8(%rbp)
14027953b:     	movq	%r11, 0x2d0(%rbp)
140279542:     	callq	0x144e5ebd0 <.text+0x4e5dbd0>
140279547:     	movq	0x2d0(%rbp), %r11
14027954e:     	movq	0x2d8(%rbp), %r10
140279555:     	movq	0x2e8(%rbp), %r9
14027955c:     	movq	0x2f0(%rbp), %r8
140279563:     	movq	0x2e0(%rbp), %rdx
14027956a:     	cmpl	%esi, %r13d
14027956d:     	je	0x1402794c0 <.text+0x2784c0>
140279573:     	jmp	0x1402794a2 <.text+0x2784a2>
140279578:     	addq	%rcx, %rax
14027957b:     	movq	0x50(%rax), %rdi
14027957f:     	xorl	%r13d, %r13d
140279582:     	movl	%r13d, %eax
140279585:     	shlq	$0x4, %rax
140279589:     	incl	%r13d
14027958c:     	movq	(%rdi,%rax), %rax
140279590:     	testl	%eax, %eax
140279592:     	jne	0x1402795cb <.text+0x2785cb>
140279594:     	cmpl	%esi, %r13d
140279597:     	jne	0x140279582 <.text+0x278582>
140279599:     	nopl	(%rax)
1402795a0:     	cmpq	%r15, %r14
1402795a3:     	je	0x14027965c <.text+0x27865c>
1402795a9:     	movl	(%r14), %ecx
1402795ac:     	addq	$0x4, %r14
1402795b0:     	movq	0x108(%rbx), %rax
1402795b7:     	leaq	(%rcx,%rcx,4), %rcx
1402795bb:     	shlq	$0x5, %rcx
1402795bf:     	movq	0x58(%rax,%rcx), %rsi
1402795c4:     	testq	%rsi, %rsi
1402795c7:     	je	0x1402795a0 <.text+0x2785a0>
1402795c9:     	jmp	0x140279578 <.text+0x278578>
1402795cb:     	testq	%rdx, %rdx
1402795ce:     	movq	0x2c8(%rbp), %rcx
1402795d5:     	cmovneq	%r8, %rcx
1402795d9:     	movq	%rax, -0x40(%rbp)
1402795dd:     	movq	%r10, -0x38(%rbp)
1402795e1:     	movq	%r11, -0x30(%rbp)
1402795e5:     	movq	%rdx, -0x28(%rbp)
1402795e9:     	movq	%r9, -0x20(%rbp)
1402795ed:     	movq	%rcx, 0x2c8(%rbp)
1402795f4:     	movq	%rcx, -0x18(%rbp)
1402795f8:     	leaq	-0x40(%rbp), %rcx
1402795fc:     	movq	%rdx, 0x2e0(%rbp)
140279603:     	leaq	0x5b46ffe(%rip), %rdx   # 0x145dc0608
14027960a:     	movq	%r8, 0x2f0(%rbp)
140279611:     	movq	%r9, 0x2e8(%rbp)
140279618:     	movq	%r10, 0x2d8(%rbp)
14027961f:     	movq	%r11, 0x2d0(%rbp)
140279626:     	callq	0x144e5ebd0 <.text+0x4e5dbd0>
14027962b:     	movq	0x2d0(%rbp), %r11
140279632:     	movq	0x2d8(%rbp), %r10
140279639:     	movq	0x2e8(%rbp), %r9
140279640:     	movq	0x2f0(%rbp), %r8
140279647:     	movq	0x2e0(%rbp), %rdx
14027964e:     	cmpl	%esi, %r13d
140279651:     	je	0x1402795a0 <.text+0x2785a0>
140279657:     	jmp	0x140279582 <.text+0x278582>
14027965c:     	cmpq	$0x0, 0x40(%r12)
140279662:     	je	0x140279cb3 <.text+0x278cb3>
140279668:     	leaq	0x178(%rbp), %rdi
14027966f:     	leaq	0x198(%rbp), %rbx
140279676:     	movups	0x5b46d93(%rip), %xmm0  # 0x145dc0410
14027967d:     	movaps	%xmm0, 0x250(%rbp)
140279684:     	movq	$0x0, 0x260(%rbp)
14027968f:     	movups	0x5b46d92(%rip), %xmm1  # 0x145dc0428
140279696:     	movups	%xmm1, 0x268(%rbp)
14027969d:     	movq	$0x0, 0x278(%rbp)
1402796a8:     	movups	0x5b46d91(%rip), %xmm1  # 0x145dc0440
1402796af:     	movaps	%xmm1, 0x280(%rbp)
1402796b6:     	movq	$0x0, 0x290(%rbp)
1402796c1:     	movups	0x5b46d90(%rip), %xmm2  # 0x145dc0458
1402796c8:     	movups	%xmm2, 0x298(%rbp)
1402796cf:     	movq	$0x0, 0x2a8(%rbp)
1402796da:     	movaps	%xmm0, -0x40(%rbp)
1402796de:     	movaps	%xmm1, -0x10(%rbp)
1402796e2:     	movq	0x260(%rbp), %rax
1402796e9:     	movq	%rax, -0x30(%rbp)
1402796ed:     	movq	0x268(%rbp), %rax
1402796f4:     	movq	%rax, -0x28(%rbp)
1402796f8:     	movq	0x270(%rbp), %rax
1402796ff:     	movq	%rax, -0x20(%rbp)
140279703:     	movq	0x278(%rbp), %rax
14027970a:     	movq	%rax, -0x18(%rbp)
14027970e:     	movq	0x290(%rbp), %rax
140279715:     	movq	%rax, (%rbp)
140279719:     	movq	0x298(%rbp), %rax
140279720:     	movq	%rax, 0x8(%rbp)
140279724:     	movaps	0x2a0(%rbp), %xmm0
14027972b:     	movaps	%xmm0, 0x10(%rbp)
14027972f:     	xorps	%xmm0, %xmm0
140279732:     	movaps	%xmm0, 0x20(%rbp)
140279736:     	movaps	0x5b45e33(%rip), %xmm1  # 0x145dbf570
14027973d:     	movaps	%xmm1, 0x30(%rbp)
140279741:     	movaps	%xmm0, 0x60(%rbp)
140279745:     	movaps	%xmm0, 0x50(%rbp)
140279749:     	movaps	%xmm0, 0x40(%rbp)
14027974d:     	movq	$0x0, 0x70(%rbp)
140279755:     	movups	0x5b46d7c(%rip), %xmm0  # 0x145dc04d8
14027975c:     	movups	%xmm0, 0x88(%rbp)
140279763:     	movups	0x5b46d5e(%rip), %xmm0  # 0x145dc04c8
14027976a:     	movups	%xmm0, 0x78(%rbp)
14027976e:     	movups	0x5b46d83(%rip), %xmm0  # 0x145dc04f8
140279775:     	movups	%xmm0, 0xa8(%rbp)
14027977c:     	movups	0x5b46d65(%rip), %xmm0  # 0x145dc04e8
140279783:     	movups	%xmm0, 0x98(%rbp)
14027978a:     	movups	0x5b46d87(%rip), %xmm0  # 0x145dc0518
140279791:     	movups	%xmm0, 0xc8(%rbp)
140279798:     	movups	0x5b46d69(%rip), %xmm0  # 0x145dc0508
14027979f:     	movups	%xmm0, 0xb8(%rbp)
1402797a6:     	movups	0x5b46d8b(%rip), %xmm0  # 0x145dc0538
1402797ad:     	movups	%xmm0, 0xe8(%rbp)
1402797b4:     	movups	0x5b46d6d(%rip), %xmm0  # 0x145dc0528
1402797bb:     	movups	%xmm0, 0xd8(%rbp)
1402797c2:     	movaps	0x5af3ce7(%rip), %xmm0  # 0x145d6d4b0
1402797c9:     	movups	%xmm0, 0xf8(%rbp)
1402797d0:     	movl	$0x1, 0x108(%rbp)
1402797da:     	movq	$0x0, 0x10c(%rbp)
1402797e5:     	movb	$0x1, 0x114(%rbp)
1402797ec:     	movq	$0x0, 0x118(%rbp)
1402797f7:     	movl	$0x3f800000, 0x120(%rbp) # imm = 0x3F800000
140279801:     	movw	$0x0, 0x124(%rbp)
14027980a:     	movw	$0x0, 0x12a(%rbp)
140279813:     	movl	$0x10000, 0x126(%rbp)   # imm = 0x10000
14027981d:     	movw	$0x0, 0x130(%rbp)
140279826:     	movl	$0x10000, 0x12c(%rbp)   # imm = 0x10000
140279830:     	movabsq	$0x100000100, %rax      # imm = 0x100000100
14027983a:     	movq	%rax, 0x132(%rbp)
140279841:     	movl	$0x2, 0x13a(%rbp)
14027984b:     	movl	$0x17d4, 0x140(%rbp)    # imm = 0x17D4
140279855:     	movw	$0x0, 0x144(%rbp)
14027985e:     	leaq	0x5b46d8b(%rip), %r9    # 0x145dc05f0
140279865:     	leaq	0x250(%rbp), %rsi
14027986c:     	leaq	0x150(%rbp), %rdx
140279873:     	leaq	-0x40(%rbp), %r8
140279877:     	movq	%rsi, %rcx
14027987a:     	callq	0x1401a00e0 <.text+0x19f0e0>
14027987f:     	movq	%rdi, -0x40(%rbp)
140279883:     	movq	%rbx, -0x38(%rbp)
140279887:     	leaq	-0x60(%rbp), %rax
14027988b:     	movq	%rax, -0x30(%rbp)
14027988f:     	leaq	-0x40(%rbp), %rdx
140279893:     	movq	%rsi, %rcx
140279896:     	callq	0x1401b2970 <.text+0x1b1970>
14027989b:     	movq	0x1f8(%rbp), %rax
1402798a2:     	movq	0x200(%rbp), %rcx
1402798a9:     	movl	0x20c(%rbp), %edx
1402798af:     	movq	0xf8(%rax), %r8
1402798b6:     	movq	0x100(%rax), %r9
1402798bd:     	leaq	(%r8,%r9,4), %r9
1402798c1:     	movzbl	0x108(%rax), %r10d
1402798c9:     	movb	%r10b, 0x2e0(%rbp)
1402798d0:     	xorl	%r15d, %r15d
1402798d3:     	movl	$0x8, %r10d
1402798d9:     	movq	%r10, 0x2d0(%rbp)
1402798e0:     	movss	0x5b44d58(%rip), %xmm0  # 0x145dbe640
1402798e8:     	movss	0x5afa458(%rip), %xmm1  # 0x145d73d48
1402798f0:     	movss	0x5af3a74(%rip), %xmm2  # 0x145d6d36c
1402798f8:     	movss	0x5b45c80(%rip), %xmm3  # 0x145dbf580
140279900:     	movss	0x5b2f71c(%rip), %xmm4  # 0x145da9024
140279908:     	movss	0x5af3b14(%rip), %xmm5  # 0x145d6d424
140279910:     	movss	0x5b45c6c(%rip), %xmm7  # 0x145dbf584
140279918:     	xorl	%ebx, %ebx
14027991a:     	xorl	%r13d, %r13d
14027991d:     	xorl	%r11d, %r11d
140279920:     	movq	$0x0, 0x2f0(%rbp)
14027992b:     	jmp	0x140279964 <.text+0x278964>
14027992d:     	nopl	(%rax)
140279930:     	xorps	%xmm8, %xmm8
140279934:     	maxss	%xmm9, %xmm8
140279939:     	incl	%r13d
14027993c:     	movaps	%xmm2, %xmm9
140279940:     	minss	%xmm8, %xmm9
140279945:     	mulss	%xmm7, %xmm9
14027994a:     	movups	(%r10), %xmm8
14027994e:     	movaps	%xmm8, -0x40(%rbp)
140279953:     	movl	%edx, (%rsi)
140279955:     	movaps	-0x40(%rbp), %xmm8
14027995a:     	movups	%xmm8, (%r10)
14027995e:     	movss	%xmm9, 0x10(%r10)
140279964:     	cmpb	$0x0, 0x2e0(%rbp)
14027996b:     	je	0x1402799f0 <.text+0x2789f0>
140279971:     	cmpl	%r11d, %r13d
140279974:     	jne	0x140279ad8 <.text+0x278ad8>
14027997a:     	nopw	(%rax,%rax)
140279980:     	cmpq	%r9, %r8
140279983:     	je	0x140279cb3 <.text+0x278cb3>
140279989:     	movl	(%r8), %r11d
14027998c:     	addq	$0x4, %r8
140279990:     	movq	0x1a8(%rcx), %r10
140279997:     	leaq	(%r11,%r11,8), %rsi
14027999b:     	movq	0x10(%r10,%rsi,8), %r11
1402799a0:     	testq	%r11, %r11
1402799a3:     	je	0x140279980 <.text+0x278980>
1402799a5:     	leaq	(%r10,%rsi,8), %rbx
1402799a9:     	movq	0x18(%rbx), %r10
1402799ad:     	movq	0x38(%rbx), %rsi
1402799b1:     	movq	0x120(%rax), %rdi
1402799b8:     	cmpq	0x40(%rbx), %rdi
1402799bc:     	jae	0x140279a7c <.text+0x278a7c>
1402799c2:     	movq	(%rsi,%rdi,8), %rdi
1402799c6:     	testq	%rdi, %rdi
1402799c9:     	je	0x140279a7c <.text+0x278a7c>
1402799cf:     	notq	%rdi
1402799d2:     	leaq	(%rdi,%rdi,2), %rdi
1402799d6:     	shlq	$0x4, %rdi
1402799da:     	movq	0x10(%r10,%rdi), %rdi
1402799df:     	movq	%rdi, 0x2f0(%rbp)
1402799e6:     	jmp	0x140279a87 <.text+0x278a87>
1402799eb:     	nopl	(%rax,%rax)
1402799f0:     	cmpl	%r11d, %r13d
1402799f3:     	jne	0x140279b44 <.text+0x278b44>
1402799f9:     	nopl	(%rax)
140279a00:     	cmpq	%r9, %r8
140279a03:     	je	0x140279cb3 <.text+0x278cb3>
140279a09:     	movl	(%r8), %r11d
140279a0c:     	addq	$0x4, %r8
140279a10:     	movq	0x108(%rcx), %r10
140279a17:     	leaq	(%r11,%r11,4), %rsi
140279a1b:     	shlq	$0x5, %rsi
140279a1f:     	movq	0x58(%r10,%rsi), %r11
140279a24:     	testq	%r11, %r11
140279a27:     	je	0x140279a00 <.text+0x278a00>
140279a29:     	addq	%rsi, %r10
140279a2c:     	movl	0x94(%r10), %esi
140279a33:     	movq	0x1a8(%rcx), %r14
140279a3a:     	leaq	(%rsi,%rsi,8), %r15
140279a3e:     	movq	0x18(%r14,%r15,8), %rsi
140279a43:     	movq	0x38(%r14,%r15,8), %rdi
140279a48:     	movq	0x120(%rax), %rbx
140279a4f:     	cmpq	0x40(%r14,%r15,8), %rbx
140279a54:     	jae	0x140279add <.text+0x278add>
140279a5a:     	movq	(%rdi,%rbx,8), %rbx
140279a5e:     	testq	%rbx, %rbx
140279a61:     	je	0x140279add <.text+0x278add>
140279a63:     	notq	%rbx
140279a66:     	leaq	(%rbx,%rbx,2), %rbx
140279a6a:     	shlq	$0x4, %rbx
140279a6e:     	movq	0x10(%rsi,%rbx), %rbx
140279a73:     	movq	%rbx, 0x2f0(%rbp)
140279a7a:     	jmp	0x140279ae8 <.text+0x278ae8>
140279a7c:     	movq	$0x0, 0x2f0(%rbp)
140279a87:     	movq	0x110(%rax), %rdi
140279a8e:     	movq	0x118(%rax), %r14
140279a95:     	movq	(%rsi,%rdi,8), %rdi
140279a99:     	notq	%rdi
140279a9c:     	leaq	(%rdi,%rdi,2), %rdi
140279aa0:     	shlq	$0x4, %rdi
140279aa4:     	movq	0x10(%r10,%rdi), %rbx
140279aa9:     	movq	0x28(%r10,%rdi), %rdi
140279aae:     	movq	%rdi, 0x2e8(%rbp)
140279ab5:     	movq	(%rsi,%r14,8), %rsi
140279ab9:     	notq	%rsi
140279abc:     	leaq	(%rsi,%rsi,2), %rsi
140279ac0:     	shlq	$0x4, %rsi
140279ac4:     	movq	0x10(%r10,%rsi), %r15
140279ac9:     	movq	0x28(%r10,%rsi), %r10
140279ace:     	movq	%r10, 0x2d8(%rbp)
140279ad5:     	xorl	%r13d, %r13d
140279ad8:     	movl	%r13d, %r12d
140279adb:     	jmp	0x140279b5a <.text+0x278b5a>
140279add:     	movq	$0x0, 0x2f0(%rbp)
140279ae8:     	movq	0x110(%rax), %rbx
140279aef:     	movq	0x118(%rax), %r14
140279af6:     	movq	(%rdi,%rbx,8), %rbx
140279afa:     	notq	%rbx
140279afd:     	leaq	(%rbx,%rbx,2), %r15
140279b01:     	shlq	$0x4, %r15
140279b05:     	movq	0x10(%rsi,%r15), %rbx
140279b0a:     	movq	0x28(%rsi,%r15), %r15
140279b0f:     	movq	%r15, 0x2e8(%rbp)
140279b16:     	movq	(%rdi,%r14,8), %rdi
140279b1a:     	notq	%rdi
140279b1d:     	leaq	(%rdi,%rdi,2), %rdi
140279b21:     	shlq	$0x4, %rdi
140279b25:     	movq	0x10(%rsi,%rdi), %r15
140279b2a:     	movq	0x28(%rsi,%rdi), %rsi
140279b2f:     	movq	%rsi, 0x2d8(%rbp)
140279b36:     	movq	0x50(%r10), %r10
140279b3a:     	movq	%r10, 0x2d0(%rbp)
140279b41:     	xorl	%r13d, %r13d
140279b44:     	movl	%r13d, %r10d
140279b47:     	shlq	$0x4, %r10
140279b4b:     	movq	0x2d0(%rbp), %rsi
140279b52:     	movl	0x8(%rsi,%r10), %r12d
140279b57:     	notl	%r12d
140279b5a:     	movq	0x2e8(%rbp), %r10
140279b61:     	leaq	(%r10,%r12,4), %r14
140279b65:     	leaq	(%r12,%r12,4), %r10
140279b69:     	movq	0x2d8(%rbp), %rsi
140279b70:     	leaq	(%rsi,%r12,4), %rsi
140279b74:     	movq	0x2f0(%rbp), %rdi
140279b7b:     	leaq	(%rdi,%r12,4), %rdi
140279b7f:     	shlq	$0x5, %r12
140279b83:     	addq	%rbx, %r12
140279b86:     	leaq	(%r15,%r10,4), %r10
140279b8a:     	movaps	%xmm6, %xmm8
140279b8e:     	subss	(%rdi), %xmm8
140279b93:     	divss	%xmm0, %xmm8
140279b98:     	movaps	%xmm8, %xmm9
140279b9c:     	divss	%xmm1, %xmm9
140279ba1:     	minss	%xmm2, %xmm9
140279ba6:     	movaps	%xmm2, %xmm10
140279baa:     	subss	%xmm9, %xmm10
140279baf:     	mulss	%xmm3, %xmm10
140279bb4:     	movl	%edx, (%r14)
140279bb7:     	movl	$0x1, (%r12)
140279bbf:     	movss	%xmm10, 0x4(%r12)
140279bc6:     	movq	$0x1, 0x8(%r12)
140279bcf:     	ucomiss	%xmm4, %xmm8
140279bd3:     	movaps	%xmm2, %xmm9
140279bd7:     	jbe	0x140279930 <.text+0x278930>
140279bdd:     	movaps	%xmm2, %xmm9
140279be1:     	subss	%xmm8, %xmm9
140279be6:     	divss	%xmm5, %xmm9
140279beb:     	jmp	0x140279930 <.text+0x278930>
140279bf0:     	movq	%rdx, 0x2f0(%rbp)
140279bf7:     	movq	%rax, 0x2e0(%rbp)
140279bfe:     	movq	%r12, 0x2e8(%rbp)
140279c05:     	leaq	0x1(%rdi), %rbx
140279c09:     	movq	%rbx, 0x2c0(%rbp)
140279c10:     	movq	%rdi, 0x2b8(%rbp)
140279c17:     	movq	%r9, %r14
140279c1a:     	callq	0x140246d50 <.text+0x245d50>
140279c1f:     	nop
140279c20:     	movq	%r14, %r9
140279c23:     	nopw	%cs:(%rax,%rax)
140279c30:     	cmpq	0x2e0(%rbp), %rbx
140279c37:     	jae	0x140279c99 <.text+0x278c99>
140279c39:     	leaq	(%rbx,%rbx,4), %rax
140279c3d:     	movq	0x2f0(%rbp), %r8
140279c44:     	leaq	(%r8,%rax,8), %rcx
140279c48:     	movaps	%xmm6, %xmm0
140279c4b:     	subss	0x20(%r8,%rax,8), %xmm0
140279c52:     	ucomiss	%xmm0, %xmm7
140279c55:     	ja	0x140279c72 <.text+0x278c72>
140279c57:     	incq	%rbx
140279c5a:     	movq	%rbx, 0x2c0(%rbp)
140279c61:     	movq	%rdi, 0x2b8(%rbp)
140279c68:     	callq	0x140246d50 <.text+0x245d50>
140279c6d:     	movq	%r14, %r9
140279c70:     	jmp	0x140279c30 <.text+0x278c30>
140279c72:     	leaq	(%rdi,%rdi,4), %rax
140279c76:     	movq	0x20(%rcx), %rdx
140279c7a:     	movq	%rdx, 0x20(%r8,%rax,8)
140279c7f:     	movups	(%rcx), %xmm0
140279c82:     	movups	0x10(%rcx), %xmm1
140279c86:     	movups	%xmm1, 0x10(%r8,%rax,8)
140279c8c:     	movups	%xmm0, (%r8,%rax,8)
140279c91:     	incq	%rdi
140279c94:     	incq	%rbx
140279c97:     	jmp	0x140279c30 <.text+0x278c30>
140279c99:     	movq	0x2e8(%rbp), %r12
140279ca0:     	movq	%rdi, 0x40(%r12)
140279ca5:     	cmpq	$0x0, 0x210(%rbp)
140279cad:     	jne	0x14027936a <.text+0x27836a>
140279cb3:     	movaps	0x300(%rbp), %xmm6
140279cba:     	movaps	0x310(%rbp), %xmm7
140279cc1:     	movaps	0x320(%rbp), %xmm8
140279cc9:     	movaps	0x330(%rbp), %xmm9
140279cd1:     	movaps	0x340(%rbp), %xmm10
140279cd9:     	addq	$0x3d8, %rsp            # imm = 0x3D8
140279ce0:     	popq	%rbx
140279ce1:     	popq	%rdi
140279ce2:     	popq	%rsi
140279ce3:     	popq	%r12
140279ce5:     	popq	%r13
140279ce7:     	popq	%r14
140279ce9:     	popq	%r15
140279ceb:     	popq	%rbp
140279cec:     	retq


AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ded40:     	pushq	%rbp
1454ded41:     	pushq	%r15
1454ded43:     	pushq	%r14
1454ded45:     	pushq	%r13
1454ded47:     	pushq	%r12
1454ded49:     	pushq	%rsi
1454ded4a:     	pushq	%rdi
1454ded4b:     	pushq	%rbx
1454ded4c:     	subq	$0x2e8, %rsp            # imm = 0x2E8
1454ded53:     	leaq	0x80(%rsp), %rbp
1454ded5b:     	movaps	%xmm6, 0x250(%rbp)
1454ded62:     	movq	$-0x2, 0x248(%rbp)
1454ded6d:     	movq	%r9, %rbx
1454ded70:     	movq	%rdx, %r14
1454ded73:     	movq	%rcx, %r13
1454ded76:     	movq	%r9, 0x158(%rbp)
1454ded7d:     	movups	0x494(%rdx), %xmm0
1454ded84:     	movups	%xmm0, -0x14(%rbp)
1454ded88:     	movups	0x458(%rdx), %xmm0
1454ded8f:     	movups	0x468(%rdx), %xmm1
1454ded96:     	movups	0x478(%rdx), %xmm2
1454ded9d:     	movups	0x488(%rdx), %xmm3
1454deda4:     	movaps	%xmm3, -0x20(%rbp)
1454deda8:     	movaps	%xmm2, -0x30(%rbp)
1454dedac:     	movaps	%xmm1, -0x40(%rbp)
1454dedb0:     	movq	(%r8), %rcx
1454dedb3:     	movabsq	$-0x8000000000000000, %rdx # imm = 0x8000000000000000
1454dedbd:     	movq	%rcx, %rax
1454dedc0:     	xorq	%rdx, %rax
1454dedc3:     	movq	%rcx, 0x98(%rbp)
1454dedca:     	testq	%rcx, %rcx
1454dedcd:     	movl	$0x1, %ecx
1454dedd2:     	cmovsq	%rax, %rcx
1454dedd6:     	movaps	%xmm0, -0x50(%rbp)
1454dedda:     	leaq	0x14ce077(%rip), %rax   # 0x1469ace58
1454dede1:     	movslq	(%rax,%rcx,4), %rcx
1454dede5:     	addq	%rax, %rcx
1454dede8:     	movq	%r8, 0x150(%rbp)
1454dedef:     	jmpq	*%rcx
1454dedf1:     	movq	%r13, 0x1f8(%rbp)
1454dedf8:     	movq	0x8(%r8), %rdi
1454dedfc:     	movq	0x10(%r8), %rbx
1454dee00:     	movq	%rdi, 0xe0(%rbp)
1454dee07:     	movq	%rbx, 0xe8(%rbp)
1454dee0e:     	xorl	%r15d, %r15d
1454dee11:     	leaq	0x123ac50(%rip), %r13   # 0x146719a68
1454dee18:     	jmp	0x1454dee31 <.text+0x54dde31>
1454dee1a:     	nopw	(%rax,%rax)
1454dee20:     	addq	$0x78, %r15
1454dee24:     	cmpq	$0x3480, %r15           # imm = 0x3480
1454dee2b:     	je	0x1454e0971 <.text+0x54df971>
1454dee31:     	cmpq	%rbx, 0x8(%r15,%r13)
1454dee36:     	jne	0x1454dee20 <.text+0x54dde20>
1454dee38:     	movq	(%r15,%r13), %rcx
1454dee3c:     	movq	%rdi, %rdx
1454dee3f:     	movq	%rbx, %r8
1454dee42:     	callq	0x145756dd7 <.text+0x5755dd7>
1454dee47:     	testl	%eax, %eax
1454dee49:     	jne	0x1454dee20 <.text+0x54dde20>
1454dee4b:     	xorps	%xmm0, %xmm0
1454dee4e:     	movups	%xmm0, 0x104(%rbp)
1454dee55:     	movl	$0x0, 0x114(%rbp)
1454dee5f:     	leaq	(%r15,%r13), %r8
1454dee63:     	movq	%r8, 0xe0(%rbp)
1454dee6a:     	movl	$0x1, 0xe8(%rbp)
1454dee74:     	movsd	0x419ea4(%rip), %xmm0   # 0x1458f8d20
1454dee7c:     	movsd	%xmm0, 0xec(%rbp)
1454dee84:     	movq	$0x3f800000, 0xf4(%rbp) # imm = 0x3F800000
1454dee8f:     	movsd	0x40c6a9(%rip), %xmm0   # 0x1458eb540
1454dee97:     	movsd	%xmm0, 0xfc(%rbp)
1454dee9f:     	leaq	0x118(%rbp), %rcx
1454deea6:     	movsd	%xmm0, 0x118(%rbp)
1454deeae:     	movl	$0x0, 0x120(%rbp)
1454deeb8:     	movaps	0x419e71(%rip), %xmm0   # 0x1458f8d30
1454deebf:     	movups	%xmm0, 0x124(%rbp)
1454deec6:     	addq	$0x6c0, %r14            # imm = 0x6C0
1454deecd:     	movb	$0x1, 0x247(%rbp)
1454deed4:     	movq	%r14, %rdx
1454deed7:     	callq	0x145415f40 <.text+0x5414f40>
1454deedc:     	nop
1454deedd:     	movq	0x158(%rbp), %r8
1454deee4:     	movb	$0x1, 0x247(%rbp)
1454deeeb:     	leaq	0x168(%rbp), %rcx
1454deef2:     	leaq	0xe0(%rbp), %rdx
1454deef9:     	callq	0x14540f1c0 <.text+0x540e1c0>
1454deefe:     	nop
1454deeff:     	movq	0x1b8(%rbp), %rax
1454def06:     	movq	%rax, 0x130(%rbp)
1454def0d:     	movups	0x1a8(%rbp), %xmm0
1454def14:     	movaps	%xmm0, 0x120(%rbp)
1454def1b:     	movups	0x168(%rbp), %xmm0
1454def22:     	movups	0x178(%rbp), %xmm1
1454def29:     	movups	0x188(%rbp), %xmm2
1454def30:     	movups	0x198(%rbp), %xmm3
1454def37:     	movaps	%xmm3, 0x110(%rbp)
1454def3e:     	movaps	%xmm2, 0x100(%rbp)
1454def45:     	movaps	%xmm1, 0xf0(%rbp)
1454def4c:     	movaps	%xmm0, 0xe0(%rbp)
1454def53:     	movq	0x1c0(%rbp), %rax
1454def5a:     	movq	%rax, 0x200(%rbp)
1454def61:     	movq	0x1c8(%rbp), %rax
1454def68:     	movq	%rax, 0x160(%rbp)
1454def6f:     	movq	0x1d0(%rbp), %rsi
1454def76:     	movb	$0x1, 0x21f(%rbp)
1454def7d:     	leaq	0x80(%rbp), %rcx
1454def84:     	leaq	0xe0(%rbp), %rdx
1454def8b:     	leaq	-0x50(%rbp), %r8
1454def8f:     	callq	0x145476fe0 <.text+0x5475fe0>
1454def94:     	nop
1454def95:     	callq	0x140002200 <.text+0x1200>
1454def9a:     	movl	$0x18, %ecx
1454def9f:     	movl	$0x8, %edx
1454defa4:     	callq	0x1400021c0 <.text+0x11c0>
1454defa9:     	movq	%rax, 0x238(%rbp)
1454defb0:     	testq	%rax, %rax
1454defb3:     	je	0x1454e0923 <.text+0x54df923>
1454defb9:     	leaq	0x168(%rbp), %rcx
1454defc0:     	leaq	0x80(%rbp), %rdx
1454defc7:     	callq	0x14570c440 <.text+0x570b440>
1454defcc:     	nop
1454defcd:     	movq	0x178(%rbp), %rax
1454defd4:     	movq	0x238(%rbp), %rcx
1454defdb:     	movq	%rax, 0x10(%rcx)
1454defdf:     	movups	0x168(%rbp), %xmm0
1454defe6:     	movups	%xmm0, (%rcx)
1454defe9:     	movq	$0x1, 0xa8(%rbp)
1454deff4:     	movq	%rcx, 0xb0(%rbp)
1454deffb:     	movq	$0x1, 0xb8(%rbp)
1454df006:     	movq	0x90(%rbp), %rax
1454df00d:     	movq	%rax, 0xd0(%rbp)
1454df014:     	movups	0x80(%rbp), %xmm0
1454df01b:     	movaps	%xmm0, 0xc0(%rbp)
1454df022:     	cmpq	$-0x1, 0x200(%rbp)
1454df02a:     	sete	0x1d8(%rbp)
1454df031:     	je	0x1454df14e <.text+0x54de14e>
1454df037:     	movq	0x200(%rbp), %rax
1454df03e:     	movq	%rax, 0x1e0(%rbp)
1454df045:     	movq	0x160(%rbp), %rax
1454df04c:     	movq	%rax, 0x1e8(%rbp)
1454df053:     	movq	%rsi, 0x1f0(%rbp)
1454df05a:     	leaq	0xc0(%rbp), %rax
1454df061:     	movq	%rax, 0x168(%rbp)
1454df068:     	leaq	-0x54dcf8f(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454df06f:     	movq	%rax, 0x170(%rbp)
1454df076:     	leaq	0x1e0(%rbp), %rcx
1454df07d:     	movq	%rcx, 0x178(%rbp)
1454df084:     	movq	%rax, 0x180(%rbp)
1454df08b:     	movb	$0x1, 0x20f(%rbp)
1454df092:     	leaq	0x14cd513(%rip), %rdx   # 0x1469ac5ac
1454df099:     	movq	%rbp, %rcx
1454df09c:     	leaq	0x168(%rbp), %r8
1454df0a3:     	callq	0x14570bf80 <.text+0x570af80>
1454df0a8:     	nop
1454df0a9:     	movq	0xc0(%rbp), %rdx
1454df0b0:     	testq	%rdx, %rdx
1454df0b3:     	je	0x1454df0c7 <.text+0x54de0c7>
1454df0b5:     	movq	0xc8(%rbp), %rcx
1454df0bc:     	movl	$0x1, %r8d
1454df0c2:     	callq	0x1400021d0 <.text+0x11d0>
1454df0c7:     	movq	0x10(%rbp), %rax
1454df0cb:     	movq	%rax, 0xd0(%rbp)
1454df0d2:     	movups	(%rbp), %xmm0
1454df0d6:     	movaps	%xmm0, 0xc0(%rbp)
1454df0dd:     	movq	0x1e0(%rbp), %rax
1454df0e4:     	movq	%rax, 0x238(%rbp)
1454df0eb:     	movq	0x1e8(%rbp), %rax
1454df0f2:     	movq	%rax, 0x220(%rbp)
1454df0f9:     	movq	0x1f0(%rbp), %r14
1454df100:     	movq	0xb8(%rbp), %rsi
1454df107:     	cmpq	0xa8(%rbp), %rsi
1454df10e:     	jne	0x1454df11d <.text+0x54de11d>
1454df110:     	leaq	0xa8(%rbp), %rcx
1454df117:     	callq	0x145757f60 <.text+0x5756f60>
1454df11c:     	nop
1454df11d:     	movq	0xb0(%rbp), %rax
1454df124:     	leaq	(%rsi,%rsi,2), %rcx
1454df128:     	movq	0x238(%rbp), %rdx
1454df12f:     	movq	%rdx, (%rax,%rcx,8)
1454df133:     	movq	0x220(%rbp), %rdx
1454df13a:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454df13f:     	movq	%r14, 0x10(%rax,%rcx,8)
1454df144:     	incq	%rsi
1454df147:     	movq	%rsi, 0xb8(%rbp)
1454df14e:     	movb	$0x1, 0x246(%rbp)
1454df155:     	leaq	0x14cd458(%rip), %r12   # 0x1469ac5b4
1454df15c:     	movl	$0xc, %edx
1454df161:     	movq	%r12, %rcx
1454df164:     	callq	0x145452400 <.text+0x5451400>
1454df169:     	movq	%rax, 0x210(%rbp)
1454df170:     	movq	%rdx, 0x228(%rbp)
1454df177:     	leaq	(%r15,%r13), %rax
1454df17b:     	movq	%rax, 0x1e0(%rbp)
1454df182:     	leaq	-0x54dd0c9(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454df189:     	movq	%rax, 0x1e8(%rbp)
1454df190:     	movb	$0x1, 0x246(%rbp)
1454df197:     	leaq	0x122f7b7(%rip), %rdx   # 0x14670e955
1454df19e:     	leaq	0x168(%rbp), %rcx
1454df1a5:     	leaq	0x1e0(%rbp), %r8
1454df1ac:     	callq	0x14570bf80 <.text+0x570af80>
1454df1b1:     	nop
1454df1b2:     	movq	0x170(%rbp), %rcx
1454df1b9:     	movq	0x178(%rbp), %rdx
1454df1c0:     	movq	0x10(%r15,%r13), %rax
1454df1c5:     	movq	%rax, 0x238(%rbp)
1454df1cc:     	movq	0x18(%r15,%r13), %rax
1454df1d1:     	movq	%rax, 0x220(%rbp)
1454df1d8:     	movq	%rcx, 0xa0(%rbp)
1454df1df:     	callq	0x145452400 <.text+0x5451400>
1454df1e4:     	nop
1454df1e5:     	movq	%rax, %rsi
1454df1e8:     	movq	%rdx, %r14
1454df1eb:     	movq	0x168(%rbp), %rdx
1454df1f2:     	testq	%rdx, %rdx
1454df1f5:     	je	0x1454df209 <.text+0x54de209>
1454df1f7:     	movl	$0x1, %r8d
1454df1fd:     	movq	0xa0(%rbp), %rcx
1454df204:     	callq	0x1400021d0 <.text+0x11d0>
1454df209:     	movq	0x210(%rbp), %rcx
1454df210:     	testq	%rcx, %rcx
1454df213:     	movl	$0xc, %eax
1454df218:     	movq	0x228(%rbp), %r8
1454df21f:     	cmoveq	%rax, %r8
1454df223:     	cmovneq	%rcx, %r12
1454df227:     	testq	%rsi, %rsi
1454df22a:     	cmoveq	0x238(%rbp), %rsi
1454df232:     	cmoveq	0x220(%rbp), %r14
1454df23a:     	movq	%rsi, 0x28(%rbp)
1454df23e:     	movq	%r14, 0x30(%rbp)
1454df242:     	leaq	0x14cbdd8(%rip), %rax   # 0x1469ab021
1454df249:     	movq	%rax, 0x168(%rbp)
1454df250:     	movq	$0x5, 0x170(%rbp)
1454df25b:     	leaq	0x28(%rbp), %rax
1454df25f:     	movq	%rax, 0x178(%rbp)
1454df266:     	leaq	0x14cbee3(%rip), %rax   # 0x1469ab150
1454df26d:     	movq	%rax, 0x180(%rbp)
1454df274:     	movb	$0x1, 0x246(%rbp)
1454df27b:     	movq	$0x1, 0x20(%rsp)
1454df284:     	leaq	0x138(%rbp), %rcx
1454df28b:     	leaq	0x168(%rbp), %r9
1454df292:     	movq	%r12, %rdx
1454df295:     	callq	0x145452790 <.text+0x5451790>
1454df29a:     	nop
1454df29b:     	leaq	(%r15,%r13), %rax
1454df29f:     	movq	%rax, 0x18(%rbp)
1454df2a3:     	leaq	-0x54dd1ea(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454df2aa:     	movq	%rax, 0x20(%rbp)
1454df2ae:     	movb	$0x1, 0x234(%rbp)
1454df2b5:     	leaq	0x122f699(%rip), %rdx   # 0x14670e955
1454df2bc:     	leaq	0x1e0(%rbp), %rcx
1454df2c3:     	leaq	0x18(%rbp), %r8
1454df2c7:     	callq	0x14570bf80 <.text+0x570af80>
1454df2cc:     	nop
1454df2cd:     	movq	0x1e8(%rbp), %rcx
1454df2d4:     	movq	0x1f0(%rbp), %rdx
1454df2db:     	movq	%rcx, 0x228(%rbp)
1454df2e2:     	callq	0x145452400 <.text+0x5451400>
1454df2e7:     	nop
1454df2e8:     	movq	0x238(%rbp), %r12
1454df2ef:     	movq	%rax, %rsi
1454df2f2:     	movq	%rdx, %r14
1454df2f5:     	movq	0x1e0(%rbp), %rdx
1454df2fc:     	testq	%rdx, %rdx
1454df2ff:     	je	0x1454df313 <.text+0x54de313>
1454df301:     	movl	$0x1, %r8d
1454df307:     	movq	0x228(%rbp), %rcx
1454df30e:     	callq	0x1400021d0 <.text+0x11d0>
1454df313:     	testq	%rsi, %rsi
1454df316:     	cmovneq	%rsi, %r12
1454df31a:     	cmoveq	0x220(%rbp), %r14
1454df322:     	testq	%r14, %r14
1454df325:     	jns	0x1454dfbf8 <.text+0x54debf8>
1454df32b:     	xorl	%esi, %esi
1454df32d:     	movb	$0x1, 0x234(%rbp)
1454df334:     	movq	%rsi, %rcx
1454df337:     	movq	%r14, %rdx
1454df33a:     	callq	0x1458e721b <.text+0x58e621b>
1454df33f:     	nop
1454df340:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454df345:     	movl	0x8(%r8), %eax
1454df349:     	movl	%eax, 0xc0(%rbp)
1454df34f:     	movb	$0x1, 0x247(%rbp)
1454df356:     	leaq	0x14cd295(%rip), %rdi   # 0x1469ac5f2
1454df35d:     	movl	$0xf, %esi
1454df362:     	movl	$0xf, %edx
1454df367:     	movq	%rdi, %rcx
1454df36a:     	callq	0x145452400 <.text+0x5451400>
1454df36f:     	nop
1454df370:     	testq	%rax, %rax
1454df373:     	cmovneq	%rax, %rdi
1454df377:     	movq	%rdx, %rbx
1454df37a:     	cmoveq	%rsi, %rbx
1454df37e:     	testq	%rbx, %rbx
1454df381:     	jns	0x1454dfaf1 <.text+0x54deaf1>
1454df387:     	xorl	%esi, %esi
1454df389:     	movb	$0x1, 0x247(%rbp)
1454df390:     	movq	%rsi, %rcx
1454df393:     	movq	%rbx, %rdx
1454df396:     	callq	0x1458e721b <.text+0x58e621b>
1454df39b:     	nop
1454df39c:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454df3a1:     	movq	%r13, 0x1f8(%rbp)
1454df3a8:     	movq	0x8(%r8), %rax
1454df3ac:     	movq	%rax, 0x200(%rbp)
1454df3b3:     	movq	0x2b8(%r14), %rax
1454df3ba:     	testq	%rax, %rax
1454df3bd:     	je	0x1454df8d2 <.text+0x54de8d2>
1454df3c3:     	movq	0x2b0(%r14), %r12
1454df3ca:     	shlq	$0x3, %rax
1454df3ce:     	leaq	(%rax,%rax,2), %r13
1454df3d2:     	movq	0x200(%rbp), %rax
1454df3d9:     	movq	(%rax), %rsi
1454df3dc:     	movq	0x8(%rax), %r15
1454df3e0:     	xorl	%edi, %edi
1454df3e2:     	jmp	0x1454df3fd <.text+0x54de3fd>
1454df3e4:     	nopw	%cs:(%rax,%rax)
1454df3f0:     	addq	$0x18, %rdi
1454df3f4:     	cmpq	%rdi, %r13
1454df3f7:     	je	0x1454df8d2 <.text+0x54de8d2>
1454df3fd:     	movq	(%r12,%rdi), %rax
1454df401:     	cmpq	%r15, 0x8(%rax)
1454df405:     	jne	0x1454df3f0 <.text+0x54de3f0>
1454df407:     	movq	(%rax), %rcx
1454df40a:     	movq	%rsi, %rdx
1454df40d:     	movq	%r15, %r8
1454df410:     	callq	0x145756dd7 <.text+0x5755dd7>
1454df415:     	testl	%eax, %eax
1454df417:     	jne	0x1454df3f0 <.text+0x54de3f0>
1454df419:     	movss	0x10(%r12,%rdi), %xmm0
1454df420:     	movl	0x14(%r12,%rdi), %eax
1454df425:     	movss	%xmm0, 0x16c(%rbp)
1454df42d:     	movl	%eax, 0x170(%rbp)
1454df433:     	movl	$0x1, %eax
1454df438:     	jmp	0x1454df8d4 <.text+0x54de8d4>
1454df43d:     	movq	0x8(%r8), %rdi
1454df441:     	cmpq	$-0x1, 0x308(%r14)
1454df449:     	movq	%rdi, 0x1f8(%rbp)
1454df450:     	je	0x1454df477 <.text+0x54de477>
1454df452:     	movq	0x318(%r14), %r8
1454df459:     	cmpq	0x10(%rdi), %r8
1454df45d:     	jne	0x1454df477 <.text+0x54de477>
1454df45f:     	movq	0x8(%rdi), %rdx
1454df463:     	movq	0x310(%r14), %rcx
1454df46a:     	callq	0x145756dd7 <.text+0x5755dd7>
1454df46f:     	testl	%eax, %eax
1454df471:     	je	0x1454dff8a <.text+0x54def8a>
1454df477:     	leaq	0x18(%rdi), %rsi
1454df47b:     	leaq	0xe0(%rbp), %rcx
1454df482:     	movq	%rsi, %rdx
1454df485:     	callq	0x14570c440 <.text+0x570b440>
1454df48a:     	nop
1454df48b:     	leaq	0x168(%rbp), %rcx
1454df492:     	movq	%rsi, %rdx
1454df495:     	callq	0x14570c440 <.text+0x570b440>
1454df49a:     	nop
1454df49b:     	leaq	0x68(%rbp), %rcx
1454df49f:     	movq	0x1f8(%rbp), %rdx
1454df4a6:     	callq	0x145414120 <.text+0x5413120>
1454df4ab:     	nop
1454df4ac:     	movq	0xe0(%rbp), %rax
1454df4b3:     	movq	%rax, 0x200(%rbp)
1454df4ba:     	movq	0xe8(%rbp), %rax
1454df4c1:     	movq	%rax, 0x220(%rbp)
1454df4c8:     	movq	0xf0(%rbp), %r12
1454df4cf:     	movq	0x168(%rbp), %rax
1454df4d6:     	movq	%rax, 0x238(%rbp)
1454df4dd:     	movq	0x170(%rbp), %rax
1454df4e4:     	movq	%rax, 0x228(%rbp)
1454df4eb:     	movq	0x178(%rbp), %r14
1454df4f2:     	movq	0x70(%rbp), %rdx
1454df4f6:     	movq	0x78(%rbp), %r8
1454df4fa:     	movb	$0x1, 0x20d(%rbp)
1454df501:     	movq	$0x2, 0x20(%rsp)
1454df50a:     	leaq	0x14cd0da(%rip), %r9    # 0x1469ac5eb
1454df511:     	leaq	0x168(%rbp), %rcx
1454df518:     	callq	0x145455eb0 <.text+0x5454eb0>
1454df51d:     	nop
1454df51e:     	movq	0x168(%rbp), %rcx
1454df525:     	movq	0x170(%rbp), %rdx
1454df52c:     	movq	0x1f8(%rbp), %rax
1454df533:     	movq	0x50(%rax), %rdi
1454df537:     	testq	%rdi, %rdi
1454df53a:     	jns	0x1454dfb38 <.text+0x54deb38>
1454df540:     	movq	%rdx, 0x1d8(%rbp)
1454df547:     	movq	%rcx, 0x210(%rbp)
1454df54e:     	xorl	%r14d, %r14d
1454df551:     	movq	%r14, %rcx
1454df554:     	movq	%rdi, %rdx
1454df557:     	callq	0x1458e721b <.text+0x58e621b>
1454df55c:     	nop
1454df55d:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454df562:     	movq	%r13, 0x1f8(%rbp)
1454df569:     	movq	0x18(%r8), %rcx
1454df56d:     	movq	0x2a0(%r14), %rdx
1454df574:     	cmpq	%rdx, %rcx
1454df577:     	jae	0x1454e09b1 <.text+0x54df9b1>
1454df57d:     	leaq	0x458(%r14), %rax
1454df584:     	movq	0x298(%r14), %r8
1454df58b:     	movq	%rcx, 0x220(%rbp)
1454df592:     	imulq	$0x58, %rcx, %rdx
1454df596:     	leaq	(%r8,%rdx), %rdi
1454df59a:     	movq	%rbx, 0xe0(%rbp)
1454df5a1:     	movq	(%r8,%rdx), %rcx
1454df5a5:     	movq	0x30(%rcx), %rdx
1454df5a9:     	movq	0x38(%rcx), %r8
1454df5ad:     	addq	%rdx, %r8
1454df5b0:     	movq	%rdx, 0x168(%rbp)
1454df5b7:     	movq	%r8, 0x170(%rbp)
1454df5be:     	movq	%rcx, 0x178(%rbp)
1454df5c5:     	movq	%rdi, 0x180(%rbp)
1454df5cc:     	movq	%rax, 0x188(%rbp)
1454df5d3:     	movq	%rdi, 0x190(%rbp)
1454df5da:     	movq	%rax, 0x198(%rbp)
1454df5e1:     	leaq	0xe0(%rbp), %rax
1454df5e8:     	movq	%rax, 0x1a0(%rbp)
1454df5ef:     	movq	%rdi, 0x1a8(%rbp)
1454df5f6:     	movq	%rax, 0x1b0(%rbp)
1454df5fd:     	movb	$0x1, 0x247(%rbp)
1454df604:     	leaq	0x138(%rbp), %rcx
1454df60b:     	leaq	0x168(%rbp), %rdx
1454df612:     	callq	0x1455292b0 <.text+0x55282b0>
1454df617:     	nop
1454df618:     	movq	0x140(%rbp), %rcx
1454df61f:     	movq	0x148(%rbp), %rsi
1454df626:     	addq	$0x880, %r14            # imm = 0x880
1454df62d:     	movq	%rcx, 0x200(%rbp)
1454df634:     	movq	%rsi, %rdx
1454df637:     	movq	%r14, %r8
1454df63a:     	callq	0x14540ca10 <.text+0x540ba10>
1454df63f:     	nop
1454df640:     	cmpq	$0x4, 0x158(%rbp)
1454df648:     	movl	$0x1, %eax
1454df64d:     	sbbq	$-0x1, %rax
1454df651:     	cmpq	%rsi, %rax
1454df654:     	ja	0x1454df660 <.text+0x54de660>
1454df656:     	movq	%rax, 0x148(%rbp)
1454df65d:     	movq	%rax, %rsi
1454df660:     	movq	0x200(%rbp), %rax
1454df667:     	addq	%rax, %rsi
1454df66a:     	movq	%rax, 0x168(%rbp)
1454df671:     	movq	%rsi, 0x170(%rbp)
1454df678:     	movq	%rdi, 0x178(%rbp)
1454df67f:     	leaq	0x158(%rbp), %rax
1454df686:     	movq	%rax, 0x180(%rbp)
1454df68d:     	leaq	-0x50(%rbp), %rax
1454df691:     	movq	%rax, 0x188(%rbp)
1454df698:     	leaq	0x50(%rbp), %rcx
1454df69c:     	leaq	0x168(%rbp), %rdx
1454df6a3:     	callq	0x1455347d0 <.text+0x55337d0>
1454df6a8:     	nop
1454df6a9:     	movb	$0x1, 0x237(%rbp)
1454df6b0:     	leaq	0x14ccf21(%rip), %rbx   # 0x1469ac5d8
1454df6b7:     	movl	$0x13, %edx
1454df6bc:     	movq	%rbx, %rcx
1454df6bf:     	callq	0x145452400 <.text+0x5451400>
1454df6c4:     	nop
1454df6c5:     	movq	%rax, %r15
1454df6c8:     	movq	%rdx, %r14
1454df6cb:     	movq	(%rdi), %rsi
1454df6ce:     	movq	%rsi, 0xe0(%rbp)
1454df6d5:     	leaq	-0x54dd61c(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454df6dc:     	movq	%rax, 0xe8(%rbp)
1454df6e3:     	movb	$0x1, 0x237(%rbp)
1454df6ea:     	leaq	0x122f264(%rip), %rdx   # 0x14670e955
1454df6f1:     	leaq	0x168(%rbp), %rcx
1454df6f8:     	leaq	0xe0(%rbp), %r8
1454df6ff:     	callq	0x14570bf80 <.text+0x570af80>
1454df704:     	nop
1454df705:     	movq	%rdi, 0x238(%rbp)
1454df70c:     	movq	0x170(%rbp), %rcx
1454df713:     	movq	0x178(%rbp), %rdx
1454df71a:     	movq	0x10(%rsi), %rdi
1454df71e:     	movq	0x18(%rsi), %r13
1454df722:     	movq	%rcx, 0x228(%rbp)
1454df729:     	callq	0x145452400 <.text+0x5451400>
1454df72e:     	nop
1454df72f:     	movq	%rax, %rsi
1454df732:     	movq	%rdx, %r12
1454df735:     	movq	0x168(%rbp), %rdx
1454df73c:     	testq	%rdx, %rdx
1454df73f:     	je	0x1454df753 <.text+0x54de753>
1454df741:     	movl	$0x1, %r8d
1454df747:     	movq	0x228(%rbp), %rcx
1454df74e:     	callq	0x1400021d0 <.text+0x11d0>
1454df753:     	testq	%r15, %r15
1454df756:     	movl	$0x13, %eax
1454df75b:     	cmoveq	%rax, %r14
1454df75f:     	cmovneq	%r15, %rbx
1454df763:     	testq	%rsi, %rsi
1454df766:     	cmovneq	%rsi, %rdi
1454df76a:     	cmoveq	%r13, %r12
1454df76e:     	movq	%rdi, 0xa8(%rbp)
1454df775:     	movq	%r12, 0xb0(%rbp)
1454df77c:     	movq	0x238(%rbp), %r15
1454df783:     	movl	0x8(%r15), %eax
1454df787:     	incl	%eax
1454df789:     	movl	%eax, 0x80(%rbp)
1454df78f:     	leaq	0x14cb88b(%rip), %rax   # 0x1469ab021
1454df796:     	movq	%rax, 0x168(%rbp)
1454df79d:     	movq	$0x5, 0x170(%rbp)
1454df7a8:     	leaq	0xa8(%rbp), %rax
1454df7af:     	movq	%rax, 0x178(%rbp)
1454df7b6:     	leaq	0x14cb993(%rip), %rax   # 0x1469ab150
1454df7bd:     	movq	%rax, 0x180(%rbp)
1454df7c4:     	leaq	0x14cb863(%rip), %rax   # 0x1469ab02e
1454df7cb:     	movq	%rax, 0x188(%rbp)
1454df7d2:     	movq	$0x4, 0x190(%rbp)
1454df7dd:     	leaq	0x80(%rbp), %rax
1454df7e4:     	movq	%rax, 0x198(%rbp)
1454df7eb:     	leaq	0x14cb2ae(%rip), %rax   # 0x1469aaaa0
1454df7f2:     	movq	%rax, 0x1a0(%rbp)
1454df7f9:     	movb	$0x1, 0x237(%rbp)
1454df800:     	movq	$0x2, 0x20(%rsp)
1454df809:     	leaq	0x1e0(%rbp), %rcx
1454df810:     	leaq	0x168(%rbp), %r9
1454df817:     	movq	%rbx, %rdx
1454df81a:     	movq	%r14, %r8
1454df81d:     	callq	0x145452790 <.text+0x5451790>
1454df822:     	nop
1454df823:     	movq	(%r15), %rsi
1454df826:     	movq	%rsi, 0xc0(%rbp)
1454df82d:     	leaq	-0x54dd774(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454df834:     	movq	%rax, 0xc8(%rbp)
1454df83b:     	movb	$0x1, 0x233(%rbp)
1454df842:     	leaq	0x122f10c(%rip), %rdx   # 0x14670e955
1454df849:     	leaq	0xe0(%rbp), %rcx
1454df850:     	leaq	0xc0(%rbp), %r8
1454df857:     	callq	0x14570bf80 <.text+0x570af80>
1454df85c:     	nop
1454df85d:     	movq	0xe8(%rbp), %rcx
1454df864:     	movq	0xf0(%rbp), %rdx
1454df86b:     	movq	0x10(%rsi), %rbx
1454df86f:     	movq	0x18(%rsi), %rdi
1454df873:     	movq	%rcx, 0x228(%rbp)
1454df87a:     	callq	0x145452400 <.text+0x5451400>
1454df87f:     	nop
1454df880:     	movq	%rax, %rsi
1454df883:     	movq	%rdx, %r14
1454df886:     	movq	0xe0(%rbp), %rdx
1454df88d:     	testq	%rdx, %rdx
1454df890:     	je	0x1454df8a4 <.text+0x54de8a4>
1454df892:     	movl	$0x1, %r8d
1454df898:     	movq	0x228(%rbp), %rcx
1454df89f:     	callq	0x1400021d0 <.text+0x11d0>
1454df8a4:     	testq	%rsi, %rsi
1454df8a7:     	cmovneq	%rsi, %rbx
1454df8ab:     	cmoveq	%rdi, %r14
1454df8af:     	testq	%r14, %r14
1454df8b2:     	jns	0x1454dfbaa <.text+0x54debaa>
1454df8b8:     	xorl	%esi, %esi
1454df8ba:     	movb	$0x1, 0x233(%rbp)
1454df8c1:     	movq	%rsi, %rcx
1454df8c4:     	movq	%r14, %rdx
1454df8c7:     	callq	0x1458e721b <.text+0x58e621b>
1454df8cc:     	nop
1454df8cd:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454df8d2:     	xorl	%eax, %eax
1454df8d4:     	movl	%eax, 0x168(%rbp)
1454df8da:     	movb	$0x1, 0x247(%rbp)
1454df8e1:     	leaq	0x168(%rbp), %r8
1454df8e8:     	movq	0x200(%rbp), %rdi
1454df8ef:     	movq	%rdi, %rcx
1454df8f2:     	movq	%rbx, %rdx
1454df8f5:     	callq	0x145412bb0 <.text+0x5411bb0>
1454df8fa:     	nop
1454df8fb:     	movaps	%xmm0, %xmm6
1454df8fe:     	movzbl	0x44(%rdi), %r12d
1454df903:     	cmpb	$0xf, %r12b
1454df907:     	jne	0x1454df925 <.text+0x54de925>
1454df909:     	xorl	%eax, %eax
1454df90b:     	movl	$0x2, %ecx
1454df910:     	subl	0x4a8(%r14), %ecx
1454df917:     	cmovbl	%eax, %ecx
1454df91a:     	xorps	%xmm0, %xmm0
1454df91d:     	cvtsi2ss	%ecx, %xmm0
1454df921:     	minss	%xmm0, %xmm6
1454df925:     	movq	0x2b8(%r14), %rax
1454df92c:     	testq	%rax, %rax
1454df92f:     	je	0x1454dfa45 <.text+0x54dea45>
1454df935:     	movq	0x2b0(%r14), %r14
1454df93c:     	shlq	$0x3, %rax
1454df940:     	leaq	(%rax,%rax,2), %r13
1454df944:     	movq	(%rdi), %rsi
1454df947:     	movq	0x8(%rdi), %rbx
1454df94b:     	xorl	%r15d, %r15d
1454df94e:     	jmp	0x1454df95d <.text+0x54de95d>
1454df950:     	addq	$0x18, %r15
1454df954:     	cmpq	%r15, %r13
1454df957:     	je	0x1454dfa45 <.text+0x54dea45>
1454df95d:     	movq	(%r14,%r15), %rax
1454df961:     	cmpq	%rbx, 0x8(%rax)
1454df965:     	jne	0x1454df950 <.text+0x54de950>
1454df967:     	movq	(%rax), %rcx
1454df96a:     	movq	%rsi, %rdx
1454df96d:     	movq	%rbx, %r8
1454df970:     	callq	0x145756dd7 <.text+0x5755dd7>
1454df975:     	testl	%eax, %eax
1454df977:     	jne	0x1454df950 <.text+0x54de950>
1454df979:     	cmpb	$0xf, %r12b
1454df97d:     	jne	0x1454dffbe <.text+0x54defbe>
1454df983:     	movq	%rdi, 0xe0(%rbp)
1454df98a:     	leaq	-0x54dd8d1(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454df991:     	movq	%rax, 0xe8(%rbp)
1454df998:     	movb	$0x1, 0x247(%rbp)
1454df99f:     	leaq	0x123db7d(%rip), %rdx   # 0x14671d523
1454df9a6:     	leaq	0x168(%rbp), %rcx
1454df9ad:     	leaq	0xe0(%rbp), %r8
1454df9b4:     	callq	0x14570bf80 <.text+0x570af80>
1454df9b9:     	nop
1454df9ba:     	movq	0x170(%rbp), %rcx
1454df9c1:     	movq	0x178(%rbp), %rdx
1454df9c8:     	movq	0x10(%rdi), %r13
1454df9cc:     	movq	0x18(%rdi), %r12
1454df9d0:     	movq	%rcx, 0x238(%rbp)
1454df9d7:     	callq	0x145452400 <.text+0x5451400>
1454df9dc:     	nop
1454df9dd:     	movq	%rax, %rbx
1454df9e0:     	movq	%rdx, %rsi
1454df9e3:     	movq	0x168(%rbp), %rdx
1454df9ea:     	testq	%rdx, %rdx
1454df9ed:     	je	0x1454dfa01 <.text+0x54dea01>
1454df9ef:     	movl	$0x1, %r8d
1454df9f5:     	movq	0x238(%rbp), %rcx
1454df9fc:     	callq	0x1400021d0 <.text+0x11d0>
1454dfa01:     	testq	%rbx, %rbx
1454dfa04:     	cmovneq	%rbx, %r13
1454dfa08:     	cmoveq	%r12, %rsi
1454dfa0c:     	movq	%r13, 0x138(%rbp)
1454dfa13:     	movq	%rsi, 0x140(%rbp)
1454dfa1a:     	movl	0x14(%r14,%r15), %eax
1454dfa1f:     	incl	%eax
1454dfa21:     	cmpl	$0xa, %eax
1454dfa24:     	ja	0x1454e0463 <.text+0x54df463>
1454dfa2a:     	movl	%eax, %eax
1454dfa2c:     	shlq	$0x4, %rax
1454dfa30:     	leaq	0x14cacd1(%rip), %rdx   # 0x1469aa708
1454dfa37:     	movq	(%rax,%rdx), %rcx
1454dfa3b:     	movq	0x8(%rax,%rdx), %rax
1454dfa40:     	jmp	0x1454e046f <.text+0x54df46f>
1454dfa45:     	movq	%rdi, 0xe0(%rbp)
1454dfa4c:     	leaq	-0x54dd993(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454dfa53:     	movq	%rax, 0xe8(%rbp)
1454dfa5a:     	movb	$0x1, 0x247(%rbp)
1454dfa61:     	leaq	0x123dabb(%rip), %rdx   # 0x14671d523
1454dfa68:     	leaq	0x168(%rbp), %rcx
1454dfa6f:     	leaq	0xe0(%rbp), %r8
1454dfa76:     	callq	0x14570bf80 <.text+0x570af80>
1454dfa7b:     	nop
1454dfa7c:     	movq	0x170(%rbp), %rcx
1454dfa83:     	movq	0x178(%rbp), %rdx
1454dfa8a:     	movq	0x10(%rdi), %rbx
1454dfa8e:     	movq	0x18(%rdi), %r14
1454dfa92:     	movq	%rcx, 0x238(%rbp)
1454dfa99:     	callq	0x145452400 <.text+0x5451400>
1454dfa9e:     	nop
1454dfa9f:     	movq	%rax, %rsi
1454dfaa2:     	movq	%rdx, %r15
1454dfaa5:     	movq	0x168(%rbp), %rdx
1454dfaac:     	testq	%rdx, %rdx
1454dfaaf:     	je	0x1454dfac3 <.text+0x54deac3>
1454dfab1:     	movl	$0x1, %r8d
1454dfab7:     	movq	0x238(%rbp), %rcx
1454dfabe:     	callq	0x1400021d0 <.text+0x11d0>
1454dfac3:     	testq	%rsi, %rsi
1454dfac6:     	cmovneq	%rsi, %rbx
1454dfaca:     	cmoveq	%r14, %r15
1454dface:     	testq	%r15, %r15
1454dfad1:     	jns	0x1454dfc3f <.text+0x54dec3f>
1454dfad7:     	xorl	%esi, %esi
1454dfad9:     	movb	$0x1, 0x247(%rbp)
1454dfae0:     	movq	%rsi, %rcx
1454dfae3:     	movq	%r15, %rdx
1454dfae6:     	callq	0x1458e721b <.text+0x58e621b>
1454dfaeb:     	nop
1454dfaec:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454dfaf1:     	movq	%rbx, 0x1f8(%rbp)
1454dfaf8:     	je	0x1454dfc86 <.text+0x54dec86>
1454dfafe:     	callq	0x140002200 <.text+0x1200>
1454dfb03:     	movl	$0x1, %esi
1454dfb08:     	movl	$0x1, %edx
1454dfb0d:     	movq	%rbx, %rcx
1454dfb10:     	callq	0x1400021c0 <.text+0x11c0>
1454dfb15:     	testq	%rax, %rax
1454dfb18:     	je	0x1454df389 <.text+0x54de389>
1454dfb1e:     	movq	%rax, 0x200(%rbp)
1454dfb25:     	movq	%rax, %rcx
1454dfb28:     	movq	%rdi, %rdx
1454dfb2b:     	movq	%rbx, %r8
1454dfb2e:     	callq	0x145756ddd <.text+0x5755ddd>
1454dfb33:     	jmp	0x1454dfc92 <.text+0x54dec92>
1454dfb38:     	movq	0x178(%rbp), %r15
1454dfb3f:     	je	0x1454dfd15 <.text+0x54ded15>
1454dfb45:     	movq	%rdx, 0x1d8(%rbp)
1454dfb4c:     	movq	%rcx, 0x210(%rbp)
1454dfb53:     	movq	%r14, 0x160(%rbp)
1454dfb5a:     	movq	0x48(%rax), %rsi
1454dfb5e:     	callq	0x140002200 <.text+0x1200>
1454dfb63:     	movl	$0x1, %r14d
1454dfb69:     	movl	$0x1, %edx
1454dfb6e:     	movq	%rdi, %rcx
1454dfb71:     	callq	0x1400021c0 <.text+0x11c0>
1454dfb76:     	testq	%rax, %rax
1454dfb79:     	je	0x1454df551 <.text+0x54de551>
1454dfb7f:     	movq	%rax, %rbx
1454dfb82:     	movq	%rax, %rcx
1454dfb85:     	movq	%rsi, %rdx
1454dfb88:     	movq	%rdi, %r8
1454dfb8b:     	callq	0x145756ddd <.text+0x5755ddd>
1454dfb90:     	movq	0x160(%rbp), %r14
1454dfb97:     	movq	0x210(%rbp), %rcx
1454dfb9e:     	movq	0x1d8(%rbp), %rdx
1454dfba5:     	jmp	0x1454dfd1a <.text+0x54ded1a>
1454dfbaa:     	movq	%r14, 0x228(%rbp)
1454dfbb1:     	je	0x1454dfdc4 <.text+0x54dedc4>
1454dfbb7:     	callq	0x140002200 <.text+0x1200>
1454dfbbc:     	movl	$0x1, %esi
1454dfbc1:     	movl	$0x1, %edx
1454dfbc6:     	movq	%r14, %rcx
1454dfbc9:     	callq	0x1400021c0 <.text+0x11c0>
1454dfbce:     	testq	%rax, %rax
1454dfbd1:     	movq	0x1f8(%rbp), %r13
1454dfbd8:     	je	0x1454df8ba <.text+0x54de8ba>
1454dfbde:     	movq	%rax, 0x210(%rbp)
1454dfbe5:     	movq	%rax, %rcx
1454dfbe8:     	movq	%rbx, %rdx
1454dfbeb:     	movq	%r14, %r8
1454dfbee:     	callq	0x145756ddd <.text+0x5755ddd>
1454dfbf3:     	jmp	0x1454dfdd7 <.text+0x54dedd7>
1454dfbf8:     	movq	%r14, 0x238(%rbp)
1454dfbff:     	je	0x1454dfe9f <.text+0x54dee9f>
1454dfc05:     	callq	0x140002200 <.text+0x1200>
1454dfc0a:     	movl	$0x1, %esi
1454dfc0f:     	movl	$0x1, %edx
1454dfc14:     	movq	%r14, %rcx
1454dfc17:     	callq	0x1400021c0 <.text+0x11c0>
1454dfc1c:     	testq	%rax, %rax
1454dfc1f:     	je	0x1454df32d <.text+0x54de32d>
1454dfc25:     	movq	%rax, 0x220(%rbp)
1454dfc2c:     	movq	%rax, %rcx
1454dfc2f:     	movq	%r12, %rdx
1454dfc32:     	movq	%r14, %r8
1454dfc35:     	callq	0x145756ddd <.text+0x5755ddd>
1454dfc3a:     	jmp	0x1454dfeab <.text+0x54deeab>
1454dfc3f:     	movq	%r15, 0x238(%rbp)
1454dfc46:     	je	0x1454dff62 <.text+0x54def62>
1454dfc4c:     	callq	0x140002200 <.text+0x1200>
1454dfc51:     	movl	$0x1, %esi
1454dfc56:     	movl	$0x1, %edx
1454dfc5b:     	movq	%r15, %rcx
1454dfc5e:     	callq	0x1400021c0 <.text+0x11c0>
1454dfc63:     	testq	%rax, %rax
1454dfc66:     	je	0x1454dfad9 <.text+0x54dead9>
1454dfc6c:     	movq	%rax, 0x228(%rbp)
1454dfc73:     	movq	%rax, %rcx
1454dfc76:     	movq	%rbx, %rdx
1454dfc79:     	movq	%r15, %r8
1454dfc7c:     	callq	0x145756ddd <.text+0x5755ddd>
1454dfc81:     	jmp	0x1454dff6e <.text+0x54def6e>
1454dfc86:     	movl	$0x1, %eax
1454dfc8b:     	movq	%rax, 0x200(%rbp)
1454dfc92:     	leaq	0x14cc959(%rip), %rdi   # 0x1469ac5f2
1454dfc99:     	movl	$0xf, %esi
1454dfc9e:     	movl	$0xf, %edx
1454dfca3:     	movq	%rdi, %rcx
1454dfca6:     	callq	0x145452400 <.text+0x5451400>
1454dfcab:     	nop
1454dfcac:     	testq	%rax, %rax
1454dfcaf:     	cmovneq	%rax, %rdi
1454dfcb3:     	cmoveq	%rsi, %rdx
1454dfcb7:     	testq	%rdx, %rdx
1454dfcba:     	movq	%rdx, %rbx
1454dfcbd:     	jns	0x1454dfcd2 <.text+0x54decd2>
1454dfcbf:     	xorl	%esi, %esi
1454dfcc1:     	movq	%rsi, %rcx
1454dfcc4:     	movq	%rbx, %rdx
1454dfcc7:     	callq	0x1458e721b <.text+0x58e621b>
1454dfccc:     	nop
1454dfccd:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454dfcd2:     	movq	%rbx, 0x238(%rbp)
1454dfcd9:     	je	0x1454e0080 <.text+0x54df080>
1454dfcdf:     	callq	0x140002200 <.text+0x1200>
1454dfce4:     	movl	$0x1, %esi
1454dfce9:     	movl	$0x1, %edx
1454dfcee:     	movq	%rbx, %rcx
1454dfcf1:     	callq	0x1400021c0 <.text+0x11c0>
1454dfcf6:     	testq	%rax, %rax
1454dfcf9:     	je	0x1454dfcc1 <.text+0x54decc1>
1454dfcfb:     	movq	%rax, 0x220(%rbp)
1454dfd02:     	movq	%rax, %rcx
1454dfd05:     	movq	%rdi, %rdx
1454dfd08:     	movq	%rbx, %r8
1454dfd0b:     	callq	0x145756ddd <.text+0x5755ddd>
1454dfd10:     	jmp	0x1454e008c <.text+0x54df08c>
1454dfd15:     	movl	$0x1, %ebx
1454dfd1a:     	movabsq	$-0x7ffffffffffffffd, %rax # imm = 0x8000000000000003
1454dfd24:     	movq	%rax, 0x78(%r13)
1454dfd28:     	movq	0x1f8(%rbp), %rax
1454dfd2f:     	movq	%rax, 0x80(%r13)
1454dfd36:     	movq	0x158(%rbp), %rax
1454dfd3d:     	movq	%rax, 0x98(%r13)
1454dfd44:     	movq	0x200(%rbp), %rax
1454dfd4b:     	movq	%rax, (%r13)
1454dfd4f:     	movq	0x220(%rbp), %rax
1454dfd56:     	movq	%rax, 0x8(%r13)
1454dfd5a:     	movq	%r12, 0x10(%r13)
1454dfd5e:     	movq	%rcx, 0x18(%r13)
1454dfd62:     	movq	%rdx, 0x20(%r13)
1454dfd66:     	movq	%r15, 0x28(%r13)
1454dfd6a:     	movq	%rdi, 0x30(%r13)
1454dfd6e:     	movq	%rbx, 0x38(%r13)
1454dfd72:     	movq	%rdi, 0x40(%r13)
1454dfd76:     	movq	0x238(%rbp), %rax
1454dfd7d:     	movq	%rax, 0x48(%r13)
1454dfd81:     	movq	0x228(%rbp), %rax
1454dfd88:     	movq	%rax, 0x50(%r13)
1454dfd8c:     	movq	%r14, 0x58(%r13)
1454dfd90:     	movq	0x78(%rbp), %rax
1454dfd94:     	movq	%rax, 0x70(%r13)
1454dfd98:     	movups	0x68(%rbp), %xmm0
1454dfd9c:     	movups	%xmm0, 0x60(%r13)
1454dfda1:     	movq	0x150(%rbp), %rcx
1454dfda8:     	movabsq	$-0x7ffffffffffffffd, %rax # imm = 0x8000000000000003
1454dfdb2:     	cmpq	%rax, 0x98(%rbp)
1454dfdb9:     	jne	0x1454e0900 <.text+0x54df900>
1454dfdbf:     	jmp	0x1454e0905 <.text+0x54df905>
1454dfdc4:     	movl	$0x1, %eax
1454dfdc9:     	movq	%rax, 0x210(%rbp)
1454dfdd0:     	movq	0x1f8(%rbp), %r13
1454dfdd7:     	movq	0x58(%rbp), %rdx
1454dfddb:     	movq	0x60(%rbp), %r8
1454dfddf:     	movb	$0x1, 0x20e(%rbp)
1454dfde6:     	movq	$0x2, 0x20(%rsp)
1454dfdef:     	leaq	0x14cc7f5(%rip), %r9    # 0x1469ac5eb
1454dfdf6:     	leaq	0xe0(%rbp), %rcx
1454dfdfd:     	callq	0x145455eb0 <.text+0x5454eb0>
1454dfe02:     	nop
1454dfe03:     	movq	0xe0(%rbp), %r12
1454dfe0a:     	movq	0xe8(%rbp), %rdx
1454dfe11:     	movq	(%r15), %rax
1454dfe14:     	movq	0x28(%rax), %rbx
1454dfe18:     	testq	%rbx, %rbx
1454dfe1b:     	movq	0x220(%rbp), %rcx
1454dfe22:     	jns	0x1454dfe46 <.text+0x54dee46>
1454dfe24:     	movq	%rdx, 0x1f8(%rbp)
1454dfe2b:     	xorl	%r15d, %r15d
1454dfe2e:     	movq	%r12, 0x238(%rbp)
1454dfe35:     	movq	%r15, %rcx
1454dfe38:     	movq	%rbx, %rdx
1454dfe3b:     	callq	0x1458e721b <.text+0x58e621b>
1454dfe40:     	nop
1454dfe41:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454dfe46:     	movq	0xf0(%rbp), %rdi
1454dfe4d:     	je	0x1454e0289 <.text+0x54df289>
1454dfe53:     	movq	%rdx, 0x1f8(%rbp)
1454dfe5a:     	movq	0x20(%rax), %rsi
1454dfe5e:     	callq	0x140002200 <.text+0x1200>
1454dfe63:     	movl	$0x1, %r15d
1454dfe69:     	movl	$0x1, %edx
1454dfe6e:     	movq	%rbx, %rcx
1454dfe71:     	callq	0x1400021c0 <.text+0x11c0>
1454dfe76:     	testq	%rax, %rax
1454dfe79:     	je	0x1454dfe2e <.text+0x54dee2e>
1454dfe7b:     	movq	%rax, %r14
1454dfe7e:     	movq	%rax, %rcx
1454dfe81:     	movq	%rsi, %rdx
1454dfe84:     	movq	%rbx, %r8
1454dfe87:     	callq	0x145756ddd <.text+0x5755ddd>
1454dfe8c:     	movq	0x220(%rbp), %rcx
1454dfe93:     	movq	0x1f8(%rbp), %rdx
1454dfe9a:     	jmp	0x1454e028f <.text+0x54df28f>
1454dfe9f:     	movl	$0x1, %eax
1454dfea4:     	movq	%rax, 0x220(%rbp)
1454dfeab:     	movq	0xb8(%rbp), %rax
1454dfeb2:     	movq	%rax, 0x1f0(%rbp)
1454dfeb9:     	movups	0xa8(%rbp), %xmm0
1454dfec0:     	movaps	%xmm0, 0x1e0(%rbp)
1454dfec7:     	movq	0xc0(%rbp), %rcx
1454dfece:     	movq	0xc8(%rbp), %rdx
1454dfed5:     	movq	0x28(%r15,%r13), %r14
1454dfeda:     	testq	%r14, %r14
1454dfedd:     	jns	0x1454dff01 <.text+0x54def01>
1454dfedf:     	movq	%rdx, 0x210(%rbp)
1454dfee6:     	movq	%rcx, 0x228(%rbp)
1454dfeed:     	xorl	%r12d, %r12d
1454dfef0:     	movq	%r12, %rcx
1454dfef3:     	movq	%r14, %rdx
1454dfef6:     	callq	0x1458e721b <.text+0x58e621b>
1454dfefb:     	nop
1454dfefc:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454dff01:     	movq	0xd0(%rbp), %rsi
1454dff08:     	je	0x1454e0319 <.text+0x54df319>
1454dff0e:     	movq	%rdx, 0x210(%rbp)
1454dff15:     	movq	%rcx, 0x228(%rbp)
1454dff1c:     	movq	0x20(%r15,%r13), %r13
1454dff21:     	callq	0x140002200 <.text+0x1200>
1454dff26:     	movl	$0x1, %r12d
1454dff2c:     	movl	$0x1, %edx
1454dff31:     	movq	%r14, %rcx
1454dff34:     	callq	0x1400021c0 <.text+0x11c0>
1454dff39:     	testq	%rax, %rax
1454dff3c:     	je	0x1454dfef0 <.text+0x54deef0>
1454dff3e:     	movq	%rax, %r15
1454dff41:     	movq	%rax, %rcx
1454dff44:     	movq	%r13, %rdx
1454dff47:     	movq	%r14, %r8
1454dff4a:     	callq	0x145756ddd <.text+0x5755ddd>
1454dff4f:     	movq	0x228(%rbp), %rcx
1454dff56:     	movq	0x210(%rbp), %rdx
1454dff5d:     	jmp	0x1454e031f <.text+0x54df31f>
1454dff62:     	movl	$0x1, %eax
1454dff67:     	movq	%rax, 0x228(%rbp)
1454dff6e:     	leaq	0x38(%rbp), %rcx
1454dff72:     	movq	%rdi, %rdx
1454dff75:     	movaps	%xmm6, %xmm2
1454dff78:     	callq	0x145413220 <.text+0x5412220>
1454dff7d:     	nop
1454dff7e:     	movq	0x238(%rbp), %r12
1454dff85:     	jmp	0x1454e0648 <.text+0x54df648>
1454dff8a:     	leaq	0x320(%r14), %rdi
1454dff91:     	movl	0x370(%r14), %eax
1454dff98:     	incl	%eax
1454dff9a:     	cmpl	$0xa, %eax
1454dff9d:     	ja	0x1454e03b1 <.text+0x54df3b1>
1454dffa3:     	movl	%eax, %eax
1454dffa5:     	shlq	$0x4, %rax
1454dffa9:     	leaq	0x14ca758(%rip), %rdx   # 0x1469aa708
1454dffb0:     	movq	(%rax,%rdx), %rcx
1454dffb4:     	movq	0x8(%rax,%rdx), %rax
1454dffb9:     	jmp	0x1454e03bd <.text+0x54df3bd>
1454dffbe:     	movq	%rdi, 0xe0(%rbp)
1454dffc5:     	leaq	-0x54ddf0c(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454dffcc:     	movq	%rax, 0xe8(%rbp)
1454dffd3:     	movb	$0x1, 0x247(%rbp)
1454dffda:     	leaq	0x123d542(%rip), %rdx   # 0x14671d523
1454dffe1:     	leaq	0x168(%rbp), %rcx
1454dffe8:     	leaq	0xe0(%rbp), %r8
1454dffef:     	callq	0x14570bf80 <.text+0x570af80>
1454dfff4:     	nop
1454dfff5:     	movq	0x170(%rbp), %rcx
1454dfffc:     	movq	0x178(%rbp), %rdx
1454e0003:     	movq	0x10(%rdi), %r13
1454e0007:     	movq	0x18(%rdi), %r12
1454e000b:     	movq	%rcx, 0x238(%rbp)
1454e0012:     	callq	0x145452400 <.text+0x5451400>
1454e0017:     	nop
1454e0018:     	movq	%rax, %rbx
1454e001b:     	movq	%rdx, %rsi
1454e001e:     	movq	0x168(%rbp), %rdx
1454e0025:     	testq	%rdx, %rdx
1454e0028:     	je	0x1454e003c <.text+0x54df03c>
1454e002a:     	movl	$0x1, %r8d
1454e0030:     	movq	0x238(%rbp), %rcx
1454e0037:     	callq	0x1400021d0 <.text+0x11d0>
1454e003c:     	testq	%rbx, %rbx
1454e003f:     	cmovneq	%rbx, %r13
1454e0043:     	cmoveq	%r12, %rsi
1454e0047:     	movq	%r13, 0x138(%rbp)
1454e004e:     	movq	%rsi, 0x140(%rbp)
1454e0055:     	movl	0x14(%r14,%r15), %eax
1454e005a:     	incl	%eax
1454e005c:     	cmpl	$0xa, %eax
1454e005f:     	ja	0x1454e0508 <.text+0x54df508>
1454e0065:     	movl	%eax, %eax
1454e0067:     	shlq	$0x4, %rax
1454e006b:     	leaq	0x14ca696(%rip), %rdx   # 0x1469aa708
1454e0072:     	movq	(%rax,%rdx), %rcx
1454e0076:     	movq	0x8(%rax,%rdx), %rax
1454e007b:     	jmp	0x1454e0514 <.text+0x54df514>
1454e0080:     	movl	$0x1, %eax
1454e0085:     	movq	%rax, 0x220(%rbp)
1454e008c:     	leaq	0x14cc56e(%rip), %rdi   # 0x1469ac601
1454e0093:     	movl	$0x9, %esi
1454e0098:     	movl	$0x9, %edx
1454e009d:     	movq	%rdi, %rcx
1454e00a0:     	callq	0x145452400 <.text+0x5451400>
1454e00a5:     	nop
1454e00a6:     	movq	%rdx, %r8
1454e00a9:     	testq	%rax, %rax
1454e00ac:     	cmovneq	%rax, %rdi
1454e00b0:     	cmoveq	%rsi, %r8
1454e00b4:     	leaq	0x14cc54f(%rip), %rbx   # 0x1469ac60a
1454e00bb:     	movq	%rbx, 0xe0(%rbp)
1454e00c2:     	movq	$0x1, 0xe8(%rbp)
1454e00cd:     	leaq	0xc0(%rbp), %r14
1454e00d4:     	movq	%r14, 0xf0(%rbp)
1454e00db:     	leaq	0x14ca9be(%rip), %r15   # 0x1469aaaa0
1454e00e2:     	movq	%r15, 0xf8(%rbp)
1454e00e9:     	movq	$0x1, 0x20(%rsp)
1454e00f2:     	leaq	0x138(%rbp), %rcx
1454e00f9:     	leaq	0xe0(%rbp), %r9
1454e0100:     	movq	%rdi, %rdx
1454e0103:     	callq	0x145452790 <.text+0x5451790>
1454e0108:     	nop
1454e0109:     	callq	0x140002200 <.text+0x1200>
1454e010e:     	movl	$0x18, %ecx
1454e0113:     	movl	$0x8, %edx
1454e0118:     	callq	0x1400021c0 <.text+0x11c0>
1454e011d:     	movq	%rax, 0x228(%rbp)
1454e0124:     	testq	%rax, %rax
1454e0127:     	je	0x1454e095f <.text+0x54df95f>
1454e012d:     	leaq	0x14cc4cd(%rip), %rsi   # 0x1469ac601
1454e0134:     	movl	$0x9, %edi
1454e0139:     	movl	$0x9, %edx
1454e013e:     	movq	%rsi, %rcx
1454e0141:     	callq	0x145452400 <.text+0x5451400>
1454e0146:     	nop
1454e0147:     	movq	%rdx, %r8
1454e014a:     	testq	%rax, %rax
1454e014d:     	cmovneq	%rax, %rsi
1454e0151:     	cmoveq	%rdi, %r8
1454e0155:     	movq	%rbx, 0x168(%rbp)
1454e015c:     	movq	$0x1, 0x170(%rbp)
1454e0167:     	movq	%r14, 0x178(%rbp)
1454e016e:     	movq	%r15, 0x180(%rbp)
1454e0175:     	movq	$0x1, 0x20(%rsp)
1454e017e:     	leaq	0x1e0(%rbp), %rcx
1454e0185:     	leaq	0x168(%rbp), %r9
1454e018c:     	movq	%rsi, %rdx
1454e018f:     	callq	0x145452790 <.text+0x5451790>
1454e0194:     	nop
1454e0195:     	movq	0x1f0(%rbp), %rax
1454e019c:     	movq	0x228(%rbp), %rcx
1454e01a3:     	movq	%rax, 0x10(%rcx)
1454e01a7:     	movups	0x1e0(%rbp), %xmm0
1454e01ae:     	movups	%xmm0, (%rcx)
1454e01b1:     	movq	$0x1, 0x1e0(%rbp)
1454e01bc:     	movq	%rcx, 0x1e8(%rbp)
1454e01c3:     	movq	$0x1, 0x1f0(%rbp)
1454e01ce:     	callq	0x140002200 <.text+0x1200>
1454e01d3:     	movl	$0x10, %ecx
1454e01d8:     	movl	$0x1, %edx
1454e01dd:     	callq	0x1400021c0 <.text+0x11c0>
1454e01e2:     	testq	%rax, %rax
1454e01e5:     	je	0x1454e09c7 <.text+0x54df9c7>
1454e01eb:     	movups	0x14cc419(%rip), %xmm0  # 0x1469ac60b
1454e01f2:     	movups	%xmm0, (%rax)
1454e01f5:     	movl	0xc0(%rbp), %ecx
1454e01fb:     	movabsq	$-0x7ffffffffffffffc, %rdx # imm = 0x8000000000000004
1454e0205:     	movq	%rdx, 0x78(%r13)
1454e0209:     	movl	%ecx, 0x80(%r13)
1454e0210:     	movq	0x158(%rbp), %rcx
1454e0217:     	movq	%rcx, 0x98(%r13)
1454e021e:     	movq	0x1f8(%rbp), %rcx
1454e0225:     	movq	%rcx, (%r13)
1454e0229:     	movq	0x200(%rbp), %rdx
1454e0230:     	movq	%rdx, 0x8(%r13)
1454e0234:     	movq	%rcx, 0x10(%r13)
1454e0238:     	movq	0x148(%rbp), %rcx
1454e023f:     	movq	%rcx, 0x28(%r13)
1454e0243:     	movups	0x138(%rbp), %xmm0
1454e024a:     	movups	%xmm0, 0x18(%r13)
1454e024f:     	movq	$0x10, 0x30(%r13)
1454e0257:     	movq	%rax, 0x38(%r13)
1454e025b:     	movq	$0x10, 0x40(%r13)
1454e0263:     	movq	0x238(%rbp), %rax
1454e026a:     	movq	%rax, 0x48(%r13)
1454e026e:     	movq	0x220(%rbp), %rcx
1454e0275:     	movq	%rcx, 0x50(%r13)
1454e0279:     	movq	%rax, 0x58(%r13)
1454e027d:     	movups	0x1e0(%rbp), %xmm0
1454e0284:     	jmp	0x1454e03a0 <.text+0x54df3a0>
1454e0289:     	movl	$0x1, %r14d
1454e028f:     	movq	0x148(%rbp), %rax
1454e0296:     	movq	%rax, 0x88(%r13)
1454e029d:     	movups	0x138(%rbp), %xmm0
1454e02a4:     	movups	%xmm0, 0x78(%r13)
1454e02a9:     	movq	%rcx, 0x90(%r13)
1454e02b0:     	movq	0x158(%rbp), %rax
1454e02b7:     	movq	%rax, 0x98(%r13)
1454e02be:     	movups	0x1e0(%rbp), %xmm0
1454e02c5:     	movups	%xmm0, (%r13)
1454e02ca:     	movq	0x1f0(%rbp), %rax
1454e02d1:     	movq	%rax, 0x10(%r13)
1454e02d5:     	movq	%r12, 0x18(%r13)
1454e02d9:     	movq	%rdx, 0x20(%r13)
1454e02dd:     	movq	%rdi, 0x28(%r13)
1454e02e1:     	movq	%rbx, 0x30(%r13)
1454e02e5:     	movq	%r14, 0x38(%r13)
1454e02e9:     	movq	%rbx, 0x40(%r13)
1454e02ed:     	movq	0x228(%rbp), %rax
1454e02f4:     	movq	%rax, 0x48(%r13)
1454e02f8:     	movq	0x210(%rbp), %rcx
1454e02ff:     	movq	%rcx, 0x50(%r13)
1454e0303:     	movq	%rax, 0x58(%r13)
1454e0307:     	movups	0x50(%rbp), %xmm0
1454e030b:     	movups	%xmm0, 0x60(%r13)
1454e0310:     	movq	0x60(%rbp), %rax
1454e0314:     	jmp	0x1454e08e2 <.text+0x54df8e2>
1454e0319:     	movl	$0x1, %r15d
1454e031f:     	movq	0x1f8(%rbp), %r13
1454e0326:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
1454e0330:     	movq	%rax, 0x78(%r13)
1454e0334:     	movq	%rdi, 0x80(%r13)
1454e033b:     	movq	%rbx, 0x88(%r13)
1454e0342:     	movq	0x158(%rbp), %rax
1454e0349:     	movq	%rax, 0x98(%r13)
1454e0350:     	movups	0x138(%rbp), %xmm0
1454e0357:     	movups	%xmm0, (%r13)
1454e035c:     	movq	0x148(%rbp), %rax
1454e0363:     	movq	%rax, 0x10(%r13)
1454e0367:     	movq	%rcx, 0x18(%r13)
1454e036b:     	movq	%rdx, 0x20(%r13)
1454e036f:     	movq	%rsi, 0x28(%r13)
1454e0373:     	movq	%r14, 0x30(%r13)
1454e0377:     	movq	%r15, 0x38(%r13)
1454e037b:     	movq	%r14, 0x40(%r13)
1454e037f:     	movq	0x238(%rbp), %rax
1454e0386:     	movq	%rax, 0x48(%r13)
1454e038a:     	movq	0x220(%rbp), %rcx
1454e0391:     	movq	%rcx, 0x50(%r13)
1454e0395:     	movq	%rax, 0x58(%r13)
1454e0399:     	movaps	0x1e0(%rbp), %xmm0
1454e03a0:     	movups	%xmm0, 0x60(%r13)
1454e03a5:     	movq	0x1f0(%rbp), %rax
1454e03ac:     	jmp	0x1454e08e2 <.text+0x54df8e2>
1454e03b1:     	movl	$0x2, %eax
1454e03b6:     	leaq	0x14ca3fb(%rip), %rcx   # 0x1469aa7b8
1454e03bd:     	movq	%rcx, 0x1e0(%rbp)
1454e03c4:     	movq	%rax, 0x1e8(%rbp)
1454e03cb:     	movq	%rdi, 0x168(%rbp)
1454e03d2:     	leaq	-0x54de2f9(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454e03d9:     	movq	%rax, 0x170(%rbp)
1454e03e0:     	leaq	0x1e0(%rbp), %rax
1454e03e7:     	movq	%rax, 0x178(%rbp)
1454e03ee:     	leaq	-0x54de335(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454e03f5:     	movq	%rax, 0x180(%rbp)
1454e03fc:     	leaq	0x14cc1ea(%rip), %rdx   # 0x1469ac5ed
1454e0403:     	leaq	0xe0(%rbp), %rcx
1454e040a:     	leaq	0x168(%rbp), %r8
1454e0411:     	callq	0x14570bf80 <.text+0x570af80>
1454e0416:     	nop
1454e0417:     	movq	0xe0(%rbp), %rax
1454e041e:     	movq	%rax, 0x200(%rbp)
1454e0425:     	movq	0xe8(%rbp), %rax
1454e042c:     	movq	%rax, 0x220(%rbp)
1454e0433:     	movq	0xf0(%rbp), %r12
1454e043a:     	leaq	0x168(%rbp), %rcx
1454e0441:     	movq	%rdi, %rdx
1454e0444:     	callq	0x14570c440 <.text+0x570b440>
1454e0449:     	nop
1454e044a:     	addq	$0x308, %r14            # imm = 0x308
1454e0451:     	leaq	0x68(%rbp), %rcx
1454e0455:     	movq	%r14, %rdx
1454e0458:     	callq	0x145413bc0 <.text+0x5412bc0>
1454e045d:     	nop
1454e045e:     	jmp	0x1454df4cf <.text+0x54de4cf>
1454e0463:     	movl	$0x2, %eax
1454e0468:     	leaq	0x14ca349(%rip), %rcx   # 0x1469aa7b8
1454e046f:     	leaq	-0x54de3b6(%rip), %rdx  # 0x1400020c0 <.text+0x10c0>
1454e0476:     	movq	%rcx, 0x1e0(%rbp)
1454e047d:     	movq	%rax, 0x1e8(%rbp)
1454e0484:     	leaq	0x138(%rbp), %rax
1454e048b:     	movq	%rax, 0x168(%rbp)
1454e0492:     	movq	%rdx, 0x170(%rbp)
1454e0499:     	leaq	0x1e0(%rbp), %rax
1454e04a0:     	movq	%rax, 0x178(%rbp)
1454e04a7:     	movq	%rdx, 0x180(%rbp)
1454e04ae:     	movb	$0x1, 0x247(%rbp)
1454e04b5:     	leaq	0x14cc131(%rip), %rdx   # 0x1469ac5ed
1454e04bc:     	leaq	0xe0(%rbp), %rcx
1454e04c3:     	leaq	0x168(%rbp), %r8
1454e04ca:     	callq	0x14570bf80 <.text+0x570af80>
1454e04cf:     	nop
1454e04d0:     	movq	0xe0(%rbp), %rax
1454e04d7:     	movq	%rax, 0x238(%rbp)
1454e04de:     	movq	0xe8(%rbp), %rax
1454e04e5:     	movq	%rax, 0x228(%rbp)
1454e04ec:     	movq	0xf0(%rbp), %r12
1454e04f3:     	leaq	0x38(%rbp), %rcx
1454e04f7:     	movq	%rdi, %rdx
1454e04fa:     	movaps	%xmm6, %xmm2
1454e04fd:     	callq	0x145413220 <.text+0x5412220>
1454e0502:     	nop
1454e0503:     	jmp	0x1454e0648 <.text+0x54df648>
1454e0508:     	movl	$0x2, %eax
1454e050d:     	leaq	0x14ca2a4(%rip), %rcx   # 0x1469aa7b8
1454e0514:     	leaq	-0x54de45b(%rip), %rdx  # 0x1400020c0 <.text+0x10c0>
1454e051b:     	movq	%rcx, 0x1e0(%rbp)
1454e0522:     	movq	%rax, 0x1e8(%rbp)
1454e0529:     	leaq	0x138(%rbp), %rax
1454e0530:     	movq	%rax, 0x168(%rbp)
1454e0537:     	movq	%rdx, 0x170(%rbp)
1454e053e:     	leaq	0x1e0(%rbp), %rax
1454e0545:     	movq	%rax, 0x178(%rbp)
1454e054c:     	movq	%rdx, 0x180(%rbp)
1454e0553:     	movb	$0x1, 0x247(%rbp)
1454e055a:     	leaq	0x14cc08c(%rip), %rdx   # 0x1469ac5ed
1454e0561:     	leaq	0xe0(%rbp), %rcx
1454e0568:     	leaq	0x168(%rbp), %r8
1454e056f:     	callq	0x14570bf80 <.text+0x570af80>
1454e0574:     	nop
1454e0575:     	movq	0xe0(%rbp), %rax
1454e057c:     	movq	%rax, 0x238(%rbp)
1454e0583:     	movq	0xe8(%rbp), %rax
1454e058a:     	movq	%rax, 0x228(%rbp)
1454e0591:     	movq	0xf0(%rbp), %r12
1454e0598:     	movss	0x10(%r14,%r15), %xmm2
1454e059f:     	leaq	0xe0(%rbp), %rcx
1454e05a6:     	movq	%rdi, %rdx
1454e05a9:     	callq	0x145413220 <.text+0x5412220>
1454e05ae:     	nop
1454e05af:     	movq	0xe8(%rbp), %rax
1454e05b6:     	movq	%rax, 0x220(%rbp)
1454e05bd:     	movq	0xf0(%rbp), %rsi
1454e05c4:     	addss	0x10(%r14,%r15), %xmm6
1454e05cb:     	leaq	0x168(%rbp), %rcx
1454e05d2:     	movq	%rdi, %rdx
1454e05d5:     	movaps	%xmm6, %xmm2
1454e05d8:     	callq	0x145413220 <.text+0x5412220>
1454e05dd:     	nop
1454e05de:     	movq	0x170(%rbp), %r9
1454e05e5:     	movq	0x178(%rbp), %rax
1454e05ec:     	movq	%rax, 0x20(%rsp)
1454e05f1:     	leaq	0x38(%rbp), %rcx
1454e05f5:     	movq	0x220(%rbp), %rdx
1454e05fc:     	movq	%rsi, %r8
1454e05ff:     	movq	%r9, 0x210(%rbp)
1454e0606:     	callq	0x145419540 <.text+0x5418540>
1454e060b:     	nop
1454e060c:     	movq	0x168(%rbp), %rdx
1454e0613:     	testq	%rdx, %rdx
1454e0616:     	je	0x1454e062a <.text+0x54df62a>
1454e0618:     	movl	$0x1, %r8d
1454e061e:     	movq	0x210(%rbp), %rcx
1454e0625:     	callq	0x1400021d0 <.text+0x11d0>
1454e062a:     	movq	0xe0(%rbp), %rdx
1454e0631:     	testq	%rdx, %rdx
1454e0634:     	movq	0x220(%rbp), %rcx
1454e063b:     	je	0x1454e0648 <.text+0x54df648>
1454e063d:     	movl	$0x1, %r8d
1454e0643:     	callq	0x1400021d0 <.text+0x11d0>
1454e0648:     	movq	0x48(%rbp), %rax
1454e064c:     	movq	%rax, 0xf0(%rbp)
1454e0653:     	movups	0x38(%rbp), %xmm0
1454e0657:     	movaps	%xmm0, 0xe0(%rbp)
1454e065e:     	movq	%rdi, 0x1e0(%rbp)
1454e0665:     	leaq	-0x54de5ac(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454e066c:     	movq	%rax, 0x1e8(%rbp)
1454e0673:     	movb	$0x1, 0x232(%rbp)
1454e067a:     	leaq	0x123cea2(%rip), %rdx   # 0x14671d523
1454e0681:     	leaq	0x168(%rbp), %rcx
1454e0688:     	leaq	0x1e0(%rbp), %r8
1454e068f:     	callq	0x14570bf80 <.text+0x570af80>
1454e0694:     	nop
1454e0695:     	movq	0x170(%rbp), %rcx
1454e069c:     	movq	0x178(%rbp), %rdx
1454e06a3:     	movq	0x10(%rdi), %rbx
1454e06a7:     	movq	0x18(%rdi), %r14
1454e06ab:     	movq	%rcx, 0x220(%rbp)
1454e06b2:     	callq	0x145452400 <.text+0x5451400>
1454e06b7:     	nop
1454e06b8:     	movq	%rax, %rsi
1454e06bb:     	movq	%rdx, %r15
1454e06be:     	movq	0x168(%rbp), %rdx
1454e06c5:     	testq	%rdx, %rdx
1454e06c8:     	je	0x1454e06dc <.text+0x54df6dc>
1454e06ca:     	movl	$0x1, %r8d
1454e06d0:     	movq	0x220(%rbp), %rcx
1454e06d7:     	callq	0x1400021d0 <.text+0x11d0>
1454e06dc:     	testq	%rsi, %rsi
1454e06df:     	cmovneq	%rsi, %rbx
1454e06e3:     	cmoveq	%r14, %r15
1454e06e7:     	testq	%r15, %r15
1454e06ea:     	jns	0x1454e0706 <.text+0x54df706>
1454e06ec:     	xorl	%esi, %esi
1454e06ee:     	movb	$0x1, 0x232(%rbp)
1454e06f5:     	movq	%rsi, %rcx
1454e06f8:     	movq	%r15, %rdx
1454e06fb:     	callq	0x1458e721b <.text+0x58e621b>
1454e0700:     	nop
1454e0701:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454e0706:     	je	0x1454e073b <.text+0x54df73b>
1454e0708:     	callq	0x140002200 <.text+0x1200>
1454e070d:     	movl	$0x1, %esi
1454e0712:     	movl	$0x1, %edx
1454e0717:     	movq	%r15, %rcx
1454e071a:     	callq	0x1400021c0 <.text+0x11c0>
1454e071f:     	testq	%rax, %rax
1454e0722:     	je	0x1454e06ee <.text+0x54df6ee>
1454e0724:     	movq	%rax, 0x1d8(%rbp)
1454e072b:     	movq	%rax, %rcx
1454e072e:     	movq	%rbx, %rdx
1454e0731:     	movq	%r15, %r8
1454e0734:     	callq	0x145756ddd <.text+0x5755ddd>
1454e0739:     	jmp	0x1454e0747 <.text+0x54df747>
1454e073b:     	movl	$0x1, %eax
1454e0740:     	movq	%rax, 0x1d8(%rbp)
1454e0747:     	movq	%r15, 0x220(%rbp)
1454e074e:     	callq	0x140002200 <.text+0x1200>
1454e0753:     	movl	$0x18, %ecx
1454e0758:     	movl	$0x8, %edx
1454e075d:     	callq	0x1400021c0 <.text+0x11c0>
1454e0762:     	movq	%rax, 0x210(%rbp)
1454e0769:     	testq	%rax, %rax
1454e076c:     	je	0x1454e0946 <.text+0x54df946>
1454e0772:     	leaq	0x168(%rbp), %rcx
1454e0779:     	leaq	0xe0(%rbp), %rdx
1454e0780:     	callq	0x14570c440 <.text+0x570b440>
1454e0785:     	nop
1454e0786:     	movq	0x178(%rbp), %rax
1454e078d:     	movq	0x210(%rbp), %rcx
1454e0794:     	movq	%rax, 0x10(%rcx)
1454e0798:     	movups	0x168(%rbp), %xmm0
1454e079f:     	movups	%xmm0, (%rcx)
1454e07a2:     	movq	$0x1, 0x168(%rbp)
1454e07ad:     	movq	%rcx, 0x170(%rbp)
1454e07b4:     	movq	$0x1, 0x178(%rbp)
1454e07bf:     	movq	0xe0(%rbp), %rdx
1454e07c6:     	movq	0xe8(%rbp), %r8
1454e07cd:     	movq	0x28(%rdi), %rbx
1454e07d1:     	testq	%rbx, %rbx
1454e07d4:     	jns	0x1454e07f8 <.text+0x54df7f8>
1454e07d6:     	movq	%r8, 0x160(%rbp)
1454e07dd:     	movq	%rdx, 0x210(%rbp)
1454e07e4:     	xorl	%r15d, %r15d
1454e07e7:     	movq	%r15, %rcx
1454e07ea:     	movq	%rbx, %rdx
1454e07ed:     	callq	0x1458e721b <.text+0x58e621b>
1454e07f2:     	nop
1454e07f3:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454e07f8:     	movq	0xf0(%rbp), %r13
1454e07ff:     	je	0x1454e0851 <.text+0x54df851>
1454e0801:     	movq	%r8, 0x160(%rbp)
1454e0808:     	movq	%rdx, 0x210(%rbp)
1454e080f:     	movq	0x20(%rdi), %rsi
1454e0813:     	callq	0x140002200 <.text+0x1200>
1454e0818:     	movl	$0x1, %r15d
1454e081e:     	movl	$0x1, %edx
1454e0823:     	movq	%rbx, %rcx
1454e0826:     	callq	0x1400021c0 <.text+0x11c0>
1454e082b:     	testq	%rax, %rax
1454e082e:     	je	0x1454e07e7 <.text+0x54df7e7>
1454e0830:     	movq	%rax, %r14
1454e0833:     	movq	%rax, %rcx
1454e0836:     	movq	%rsi, %rdx
1454e0839:     	movq	%rbx, %r8
1454e083c:     	callq	0x145756ddd <.text+0x5755ddd>
1454e0841:     	movq	0x210(%rbp), %rdx
1454e0848:     	movq	0x160(%rbp), %r8
1454e084f:     	jmp	0x1454e0857 <.text+0x54df857>
1454e0851:     	movl	$0x1, %r14d
1454e0857:     	movabsq	$-0x7ffffffffffffffe, %rax # imm = 0x8000000000000002
1454e0861:     	movq	0x1f8(%rbp), %rcx
1454e0868:     	movq	%rax, 0x78(%rcx)
1454e086c:     	movq	%rdi, 0x80(%rcx)
1454e0873:     	movq	0x158(%rbp), %rax
1454e087a:     	movq	%rax, 0x98(%rcx)
1454e0881:     	movq	0x238(%rbp), %rax
1454e0888:     	movq	%rax, (%rcx)
1454e088b:     	movq	0x228(%rbp), %rax
1454e0892:     	movq	%rax, 0x8(%rcx)
1454e0896:     	movq	%r12, 0x10(%rcx)
1454e089a:     	movq	%rdx, 0x18(%rcx)
1454e089e:     	movq	%r8, 0x20(%rcx)
1454e08a2:     	movq	%r13, 0x28(%rcx)
1454e08a6:     	movq	%rcx, %r13
1454e08a9:     	movq	%rbx, 0x30(%rcx)
1454e08ad:     	movq	%r14, 0x38(%rcx)
1454e08b1:     	movq	%rbx, 0x40(%rcx)
1454e08b5:     	movq	0x220(%rbp), %rax
1454e08bc:     	movq	%rax, 0x48(%rcx)
1454e08c0:     	movq	0x1d8(%rbp), %rcx
1454e08c7:     	movq	%rcx, 0x50(%r13)
1454e08cb:     	movq	%rax, 0x58(%r13)
1454e08cf:     	movups	0x168(%rbp), %xmm0
1454e08d6:     	movups	%xmm0, 0x60(%r13)
1454e08db:     	movq	0x178(%rbp), %rax
1454e08e2:     	movq	%rax, 0x70(%r13)
1454e08e6:     	movq	0x150(%rbp), %rcx
1454e08ed:     	movabsq	$-0x7ffffffffffffffd, %rax # imm = 0x8000000000000003
1454e08f7:     	cmpq	%rax, 0x98(%rbp)
1454e08fe:     	je	0x1454e0905 <.text+0x54df905>
1454e0900:     	callq	0x145486b10 <.text+0x5485b10>
1454e0905:     	movq	%r13, %rax
1454e0908:     	movaps	0x250(%rbp), %xmm6
1454e090f:     	addq	$0x2e8, %rsp            # imm = 0x2E8
1454e0916:     	popq	%rbx
1454e0917:     	popq	%rdi
1454e0918:     	popq	%rsi
1454e0919:     	popq	%r12
1454e091b:     	popq	%r13
1454e091d:     	popq	%r14
1454e091f:     	popq	%r15
1454e0921:     	popq	%rbp
1454e0922:     	retq
1454e0923:     	movb	$0x1, 0x236(%rbp)
1454e092a:     	movb	$0x1, 0x235(%rbp)
1454e0931:     	movl	$0x8, %ecx
1454e0936:     	movl	$0x18, %edx
1454e093b:     	callq	0x1458e7201 <.text+0x58e6201>
1454e0940:     	nop
1454e0941:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454e0946:     	movb	$0x1, 0x21e(%rbp)
1454e094d:     	movl	$0x8, %ecx
1454e0952:     	movl	$0x18, %edx
1454e0957:     	callq	0x1458e7201 <.text+0x58e6201>
1454e095c:     	nop
1454e095d:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454e095f:     	movl	$0x8, %ecx
1454e0964:     	movl	$0x18, %edx
1454e0969:     	callq	0x1458e7201 <.text+0x58e6201>
1454e096e:     	nop
1454e096f:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454e0971:     	leaq	0xe0(%rbp), %rax
1454e0978:     	movq	%rax, 0x168(%rbp)
1454e097f:     	leaq	-0x54de8c6(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454e0986:     	movq	%rax, 0x170(%rbp)
1454e098d:     	movb	$0x1, 0x247(%rbp)
1454e0994:     	leaq	0x12382dd(%rip), %rcx   # 0x146718c78
1454e099b:     	leaq	0x12382e6(%rip), %r8    # 0x146718c88
1454e09a2:     	leaq	0x168(%rbp), %rdx
1454e09a9:     	callq	0x1458e7790 <.text+0x58e6790>
1454e09ae:     	nop
1454e09af:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454e09b1:     	movb	$0x1, 0x247(%rbp)
1454e09b8:     	leaq	0x14cbc01(%rip), %r8    # 0x1469ac5c0
1454e09bf:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454e09c4:     	nop
1454e09c5:     	jmp	0x1454e09d7 <.text+0x54df9d7>
1454e09c7:     	movl	$0x1, %ecx
1454e09cc:     	movl	$0x10, %edx
1454e09d1:     	callq	0x1458e721b <.text+0x58e621b>
1454e09d6:     	nop
1454e09d7:     	ud2


AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f0f10:     	pushq	%rbp
1454f0f11:     	pushq	%r15
1454f0f13:     	pushq	%r14
1454f0f15:     	pushq	%r13
1454f0f17:     	pushq	%r12
1454f0f19:     	pushq	%rsi
1454f0f1a:     	pushq	%rdi
1454f0f1b:     	pushq	%rbx
1454f0f1c:     	subq	$0x2e8, %rsp            # imm = 0x2E8
1454f0f23:     	leaq	0x80(%rsp), %rbp
1454f0f2b:     	movaps	%xmm6, 0x250(%rbp)
1454f0f32:     	movq	$-0x2, 0x248(%rbp)
1454f0f3d:     	movq	%r9, %rbx
1454f0f40:     	movq	%rdx, %r14
1454f0f43:     	movq	%rcx, %r13
1454f0f46:     	movq	%r9, 0x158(%rbp)
1454f0f4d:     	movups	0x4ac(%rdx), %xmm0
1454f0f54:     	movups	%xmm0, -0x14(%rbp)
1454f0f58:     	movups	0x470(%rdx), %xmm0
1454f0f5f:     	movups	0x480(%rdx), %xmm1
1454f0f66:     	movups	0x490(%rdx), %xmm2
1454f0f6d:     	movups	0x4a0(%rdx), %xmm3
1454f0f74:     	movaps	%xmm3, -0x20(%rbp)
1454f0f78:     	movaps	%xmm2, -0x30(%rbp)
1454f0f7c:     	movaps	%xmm1, -0x40(%rbp)
1454f0f80:     	movq	(%r8), %rcx
1454f0f83:     	movabsq	$-0x8000000000000000, %rdx # imm = 0x8000000000000000
1454f0f8d:     	movq	%rcx, %rax
1454f0f90:     	xorq	%rdx, %rax
1454f0f93:     	movq	%rcx, 0x98(%rbp)
1454f0f9a:     	testq	%rcx, %rcx
1454f0f9d:     	movl	$0x1, %ecx
1454f0fa2:     	cmovsq	%rax, %rcx
1454f0fa6:     	movaps	%xmm0, -0x50(%rbp)
1454f0faa:     	leaq	0x1507943(%rip), %rax   # 0x1469f88f4
1454f0fb1:     	movslq	(%rax,%rcx,4), %rcx
1454f0fb5:     	addq	%rax, %rcx
1454f0fb8:     	movq	%r8, 0x150(%rbp)
1454f0fbf:     	jmpq	*%rcx
1454f0fc1:     	movq	%r13, 0x1f8(%rbp)
1454f0fc8:     	movq	0x8(%r8), %rdi
1454f0fcc:     	movq	0x10(%r8), %rbx
1454f0fd0:     	movq	%rdi, 0xe0(%rbp)
1454f0fd7:     	movq	%rbx, 0xe8(%rbp)
1454f0fde:     	xorl	%r15d, %r15d
1454f0fe1:     	leaq	0x1245b60(%rip), %r13   # 0x146736b48
1454f0fe8:     	jmp	0x1454f1001 <.text+0x54f0001>
1454f0fea:     	nopw	(%rax,%rax)
1454f0ff0:     	addq	$0x78, %r15
1454f0ff4:     	cmpq	$0x3480, %r15           # imm = 0x3480
1454f0ffb:     	je	0x1454f2b41 <.text+0x54f1b41>
1454f1001:     	cmpq	%rbx, 0x8(%r15,%r13)
1454f1006:     	jne	0x1454f0ff0 <.text+0x54efff0>
1454f1008:     	movq	(%r15,%r13), %rcx
1454f100c:     	movq	%rdi, %rdx
1454f100f:     	movq	%rbx, %r8
1454f1012:     	callq	0x1457731e7 <.text+0x57721e7>
1454f1017:     	testl	%eax, %eax
1454f1019:     	jne	0x1454f0ff0 <.text+0x54efff0>
1454f101b:     	xorps	%xmm0, %xmm0
1454f101e:     	movups	%xmm0, 0x104(%rbp)
1454f1025:     	movl	$0x0, 0x114(%rbp)
1454f102f:     	leaq	(%r15,%r13), %r8
1454f1033:     	movq	%r8, 0xe0(%rbp)
1454f103a:     	movl	$0x1, 0xe8(%rbp)
1454f1044:     	movsd	0x427684(%rip), %xmm0   # 0x1459186d0
1454f104c:     	movsd	%xmm0, 0xec(%rbp)
1454f1054:     	movq	$0x3f800000, 0xf4(%rbp) # imm = 0x3F800000
1454f105f:     	movsd	0x4164e9(%rip), %xmm0   # 0x145907550
1454f1067:     	movsd	%xmm0, 0xfc(%rbp)
1454f106f:     	leaq	0x118(%rbp), %rcx
1454f1076:     	movsd	%xmm0, 0x118(%rbp)
1454f107e:     	movl	$0x0, 0x120(%rbp)
1454f1088:     	movaps	0x427651(%rip), %xmm0   # 0x1459186e0
1454f108f:     	movups	%xmm0, 0x124(%rbp)
1454f1096:     	addq	$0x6d8, %r14            # imm = 0x6D8
1454f109d:     	movb	$0x1, 0x247(%rbp)
1454f10a4:     	movq	%r14, %rdx
1454f10a7:     	callq	0x145451c30 <.text+0x5450c30>
1454f10ac:     	nop
1454f10ad:     	movq	0x158(%rbp), %r8
1454f10b4:     	movb	$0x1, 0x247(%rbp)
1454f10bb:     	leaq	0x168(%rbp), %rcx
1454f10c2:     	leaq	0xe0(%rbp), %rdx
1454f10c9:     	callq	0x145420e20 <.text+0x541fe20>
1454f10ce:     	nop
1454f10cf:     	movq	0x1b8(%rbp), %rax
1454f10d6:     	movq	%rax, 0x130(%rbp)
1454f10dd:     	movups	0x1a8(%rbp), %xmm0
1454f10e4:     	movaps	%xmm0, 0x120(%rbp)
1454f10eb:     	movups	0x168(%rbp), %xmm0
1454f10f2:     	movups	0x178(%rbp), %xmm1
1454f10f9:     	movups	0x188(%rbp), %xmm2
1454f1100:     	movups	0x198(%rbp), %xmm3
1454f1107:     	movaps	%xmm3, 0x110(%rbp)
1454f110e:     	movaps	%xmm2, 0x100(%rbp)
1454f1115:     	movaps	%xmm1, 0xf0(%rbp)
1454f111c:     	movaps	%xmm0, 0xe0(%rbp)
1454f1123:     	movq	0x1c0(%rbp), %rax
1454f112a:     	movq	%rax, 0x200(%rbp)
1454f1131:     	movq	0x1c8(%rbp), %rax
1454f1138:     	movq	%rax, 0x160(%rbp)
1454f113f:     	movq	0x1d0(%rbp), %rsi
1454f1146:     	movb	$0x1, 0x21f(%rbp)
1454f114d:     	leaq	0x80(%rbp), %rcx
1454f1154:     	leaq	0xe0(%rbp), %rdx
1454f115b:     	leaq	-0x50(%rbp), %r8
1454f115f:     	callq	0x145487680 <.text+0x5486680>
1454f1164:     	nop
1454f1165:     	callq	0x140002200 <.text+0x1200>
1454f116a:     	movl	$0x18, %ecx
1454f116f:     	movl	$0x8, %edx
1454f1174:     	callq	0x1400021c0 <.text+0x11c0>
1454f1179:     	movq	%rax, 0x238(%rbp)
1454f1180:     	testq	%rax, %rax
1454f1183:     	je	0x1454f2af3 <.text+0x54f1af3>
1454f1189:     	leaq	0x168(%rbp), %rcx
1454f1190:     	leaq	0x80(%rbp), %rdx
1454f1197:     	callq	0x145728850 <.text+0x5727850>
1454f119c:     	nop
1454f119d:     	movq	0x178(%rbp), %rax
1454f11a4:     	movq	0x238(%rbp), %rcx
1454f11ab:     	movq	%rax, 0x10(%rcx)
1454f11af:     	movups	0x168(%rbp), %xmm0
1454f11b6:     	movups	%xmm0, (%rcx)
1454f11b9:     	movq	$0x1, 0xa8(%rbp)
1454f11c4:     	movq	%rcx, 0xb0(%rbp)
1454f11cb:     	movq	$0x1, 0xb8(%rbp)
1454f11d6:     	movq	0x90(%rbp), %rax
1454f11dd:     	movq	%rax, 0xd0(%rbp)
1454f11e4:     	movups	0x80(%rbp), %xmm0
1454f11eb:     	movaps	%xmm0, 0xc0(%rbp)
1454f11f2:     	cmpq	$-0x1, 0x200(%rbp)
1454f11fa:     	sete	0x1d8(%rbp)
1454f1201:     	je	0x1454f131e <.text+0x54f031e>
1454f1207:     	movq	0x200(%rbp), %rax
1454f120e:     	movq	%rax, 0x1e0(%rbp)
1454f1215:     	movq	0x160(%rbp), %rax
1454f121c:     	movq	%rax, 0x1e8(%rbp)
1454f1223:     	movq	%rsi, 0x1f0(%rbp)
1454f122a:     	leaq	0xc0(%rbp), %rax
1454f1231:     	movq	%rax, 0x168(%rbp)
1454f1238:     	leaq	-0x54ef15f(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454f123f:     	movq	%rax, 0x170(%rbp)
1454f1246:     	leaq	0x1e0(%rbp), %rcx
1454f124d:     	movq	%rcx, 0x178(%rbp)
1454f1254:     	movq	%rax, 0x180(%rbp)
1454f125b:     	movb	$0x1, 0x20f(%rbp)
1454f1262:     	leaq	0x1506db3(%rip), %rdx   # 0x1469f801c
1454f1269:     	movq	%rbp, %rcx
1454f126c:     	leaq	0x168(%rbp), %r8
1454f1273:     	callq	0x145728390 <.text+0x5727390>
1454f1278:     	nop
1454f1279:     	movq	0xc0(%rbp), %rdx
1454f1280:     	testq	%rdx, %rdx
1454f1283:     	je	0x1454f1297 <.text+0x54f0297>
1454f1285:     	movq	0xc8(%rbp), %rcx
1454f128c:     	movl	$0x1, %r8d
1454f1292:     	callq	0x1400021d0 <.text+0x11d0>
1454f1297:     	movq	0x10(%rbp), %rax
1454f129b:     	movq	%rax, 0xd0(%rbp)
1454f12a2:     	movups	(%rbp), %xmm0
1454f12a6:     	movaps	%xmm0, 0xc0(%rbp)
1454f12ad:     	movq	0x1e0(%rbp), %rax
1454f12b4:     	movq	%rax, 0x238(%rbp)
1454f12bb:     	movq	0x1e8(%rbp), %rax
1454f12c2:     	movq	%rax, 0x220(%rbp)
1454f12c9:     	movq	0x1f0(%rbp), %r14
1454f12d0:     	movq	0xb8(%rbp), %rsi
1454f12d7:     	cmpq	0xa8(%rbp), %rsi
1454f12de:     	jne	0x1454f12ed <.text+0x54f02ed>
1454f12e0:     	leaq	0xa8(%rbp), %rcx
1454f12e7:     	callq	0x1457745c0 <.text+0x57735c0>
1454f12ec:     	nop
1454f12ed:     	movq	0xb0(%rbp), %rax
1454f12f4:     	leaq	(%rsi,%rsi,2), %rcx
1454f12f8:     	movq	0x238(%rbp), %rdx
1454f12ff:     	movq	%rdx, (%rax,%rcx,8)
1454f1303:     	movq	0x220(%rbp), %rdx
1454f130a:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454f130f:     	movq	%r14, 0x10(%rax,%rcx,8)
1454f1314:     	incq	%rsi
1454f1317:     	movq	%rsi, 0xb8(%rbp)
1454f131e:     	movb	$0x1, 0x246(%rbp)
1454f1325:     	leaq	0x1506cf8(%rip), %r12   # 0x1469f8024
1454f132c:     	movl	$0xc, %edx
1454f1331:     	movq	%r12, %rcx
1454f1334:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f1339:     	movq	%rax, 0x210(%rbp)
1454f1340:     	movq	%rdx, 0x228(%rbp)
1454f1347:     	leaq	(%r15,%r13), %rax
1454f134b:     	movq	%rax, 0x1e0(%rbp)
1454f1352:     	leaq	-0x54ef299(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f1359:     	movq	%rax, 0x1e8(%rbp)
1454f1360:     	movb	$0x1, 0x246(%rbp)
1454f1367:     	leaq	0x123a599(%rip), %rdx   # 0x14672b907
1454f136e:     	leaq	0x168(%rbp), %rcx
1454f1375:     	leaq	0x1e0(%rbp), %r8
1454f137c:     	callq	0x145728390 <.text+0x5727390>
1454f1381:     	nop
1454f1382:     	movq	0x170(%rbp), %rcx
1454f1389:     	movq	0x178(%rbp), %rdx
1454f1390:     	movq	0x10(%r15,%r13), %rax
1454f1395:     	movq	%rax, 0x238(%rbp)
1454f139c:     	movq	0x18(%r15,%r13), %rax
1454f13a1:     	movq	%rax, 0x220(%rbp)
1454f13a8:     	movq	%rcx, 0xa0(%rbp)
1454f13af:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f13b4:     	nop
1454f13b5:     	movq	%rax, %rsi
1454f13b8:     	movq	%rdx, %r14
1454f13bb:     	movq	0x168(%rbp), %rdx
1454f13c2:     	testq	%rdx, %rdx
1454f13c5:     	je	0x1454f13d9 <.text+0x54f03d9>
1454f13c7:     	movl	$0x1, %r8d
1454f13cd:     	movq	0xa0(%rbp), %rcx
1454f13d4:     	callq	0x1400021d0 <.text+0x11d0>
1454f13d9:     	movq	0x210(%rbp), %rcx
1454f13e0:     	testq	%rcx, %rcx
1454f13e3:     	movl	$0xc, %eax
1454f13e8:     	movq	0x228(%rbp), %r8
1454f13ef:     	cmoveq	%rax, %r8
1454f13f3:     	cmovneq	%rcx, %r12
1454f13f7:     	testq	%rsi, %rsi
1454f13fa:     	cmoveq	0x238(%rbp), %rsi
1454f1402:     	cmoveq	0x220(%rbp), %r14
1454f140a:     	movq	%rsi, 0x28(%rbp)
1454f140e:     	movq	%r14, 0x30(%rbp)
1454f1412:     	leaq	0x1504fd7(%rip), %rax   # 0x1469f63f0
1454f1419:     	movq	%rax, 0x168(%rbp)
1454f1420:     	movq	$0x5, 0x170(%rbp)
1454f142b:     	leaq	0x28(%rbp), %rax
1454f142f:     	movq	%rax, 0x178(%rbp)
1454f1436:     	leaq	0x1504f93(%rip), %rax   # 0x1469f63d0
1454f143d:     	movq	%rax, 0x180(%rbp)
1454f1444:     	movb	$0x1, 0x246(%rbp)
1454f144b:     	movq	$0x1, 0x20(%rsp)
1454f1454:     	leaq	0x138(%rbp), %rcx
1454f145b:     	leaq	0x168(%rbp), %r9
1454f1462:     	movq	%r12, %rdx
1454f1465:     	callq	0x145458060 <.text+0x5457060>
1454f146a:     	nop
1454f146b:     	leaq	(%r15,%r13), %rax
1454f146f:     	movq	%rax, 0x18(%rbp)
1454f1473:     	leaq	-0x54ef3ba(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f147a:     	movq	%rax, 0x20(%rbp)
1454f147e:     	movb	$0x1, 0x234(%rbp)
1454f1485:     	leaq	0x123a47b(%rip), %rdx   # 0x14672b907
1454f148c:     	leaq	0x1e0(%rbp), %rcx
1454f1493:     	leaq	0x18(%rbp), %r8
1454f1497:     	callq	0x145728390 <.text+0x5727390>
1454f149c:     	nop
1454f149d:     	movq	0x1e8(%rbp), %rcx
1454f14a4:     	movq	0x1f0(%rbp), %rdx
1454f14ab:     	movq	%rcx, 0x228(%rbp)
1454f14b2:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f14b7:     	nop
1454f14b8:     	movq	0x238(%rbp), %r12
1454f14bf:     	movq	%rax, %rsi
1454f14c2:     	movq	%rdx, %r14
1454f14c5:     	movq	0x1e0(%rbp), %rdx
1454f14cc:     	testq	%rdx, %rdx
1454f14cf:     	je	0x1454f14e3 <.text+0x54f04e3>
1454f14d1:     	movl	$0x1, %r8d
1454f14d7:     	movq	0x228(%rbp), %rcx
1454f14de:     	callq	0x1400021d0 <.text+0x11d0>
1454f14e3:     	testq	%rsi, %rsi
1454f14e6:     	cmovneq	%rsi, %r12
1454f14ea:     	cmoveq	0x220(%rbp), %r14
1454f14f2:     	testq	%r14, %r14
1454f14f5:     	jns	0x1454f1dc8 <.text+0x54f0dc8>
1454f14fb:     	xorl	%esi, %esi
1454f14fd:     	movb	$0x1, 0x234(%rbp)
1454f1504:     	movq	%rsi, %rcx
1454f1507:     	movq	%r14, %rdx
1454f150a:     	callq	0x14590379b <.text+0x590279b>
1454f150f:     	nop
1454f1510:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f1515:     	movl	0x8(%r8), %eax
1454f1519:     	movl	%eax, 0xc0(%rbp)
1454f151f:     	movb	$0x1, 0x247(%rbp)
1454f1526:     	leaq	0x1506b35(%rip), %rdi   # 0x1469f8062
1454f152d:     	movl	$0xf, %esi
1454f1532:     	movl	$0xf, %edx
1454f1537:     	movq	%rdi, %rcx
1454f153a:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f153f:     	nop
1454f1540:     	testq	%rax, %rax
1454f1543:     	cmovneq	%rax, %rdi
1454f1547:     	movq	%rdx, %rbx
1454f154a:     	cmoveq	%rsi, %rbx
1454f154e:     	testq	%rbx, %rbx
1454f1551:     	jns	0x1454f1cc1 <.text+0x54f0cc1>
1454f1557:     	xorl	%esi, %esi
1454f1559:     	movb	$0x1, 0x247(%rbp)
1454f1560:     	movq	%rsi, %rcx
1454f1563:     	movq	%rbx, %rdx
1454f1566:     	callq	0x14590379b <.text+0x590279b>
1454f156b:     	nop
1454f156c:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f1571:     	movq	%r13, 0x1f8(%rbp)
1454f1578:     	movq	0x8(%r8), %rax
1454f157c:     	movq	%rax, 0x200(%rbp)
1454f1583:     	movq	0x2d0(%r14), %rax
1454f158a:     	testq	%rax, %rax
1454f158d:     	je	0x1454f1aa2 <.text+0x54f0aa2>
1454f1593:     	movq	0x2c8(%r14), %r12
1454f159a:     	shlq	$0x3, %rax
1454f159e:     	leaq	(%rax,%rax,2), %r13
1454f15a2:     	movq	0x200(%rbp), %rax
1454f15a9:     	movq	(%rax), %rsi
1454f15ac:     	movq	0x8(%rax), %r15
1454f15b0:     	xorl	%edi, %edi
1454f15b2:     	jmp	0x1454f15cd <.text+0x54f05cd>
1454f15b4:     	nopw	%cs:(%rax,%rax)
1454f15c0:     	addq	$0x18, %rdi
1454f15c4:     	cmpq	%rdi, %r13
1454f15c7:     	je	0x1454f1aa2 <.text+0x54f0aa2>
1454f15cd:     	movq	(%r12,%rdi), %rax
1454f15d1:     	cmpq	%r15, 0x8(%rax)
1454f15d5:     	jne	0x1454f15c0 <.text+0x54f05c0>
1454f15d7:     	movq	(%rax), %rcx
1454f15da:     	movq	%rsi, %rdx
1454f15dd:     	movq	%r15, %r8
1454f15e0:     	callq	0x1457731e7 <.text+0x57721e7>
1454f15e5:     	testl	%eax, %eax
1454f15e7:     	jne	0x1454f15c0 <.text+0x54f05c0>
1454f15e9:     	movss	0x10(%r12,%rdi), %xmm0
1454f15f0:     	movl	0x14(%r12,%rdi), %eax
1454f15f5:     	movss	%xmm0, 0x16c(%rbp)
1454f15fd:     	movl	%eax, 0x170(%rbp)
1454f1603:     	movl	$0x1, %eax
1454f1608:     	jmp	0x1454f1aa4 <.text+0x54f0aa4>
1454f160d:     	movq	0x8(%r8), %rdi
1454f1611:     	cmpq	$-0x1, 0x320(%r14)
1454f1619:     	movq	%rdi, 0x1f8(%rbp)
1454f1620:     	je	0x1454f1647 <.text+0x54f0647>
1454f1622:     	movq	0x330(%r14), %r8
1454f1629:     	cmpq	0x10(%rdi), %r8
1454f162d:     	jne	0x1454f1647 <.text+0x54f0647>
1454f162f:     	movq	0x8(%rdi), %rdx
1454f1633:     	movq	0x328(%r14), %rcx
1454f163a:     	callq	0x1457731e7 <.text+0x57721e7>
1454f163f:     	testl	%eax, %eax
1454f1641:     	je	0x1454f215a <.text+0x54f115a>
1454f1647:     	leaq	0x18(%rdi), %rsi
1454f164b:     	leaq	0xe0(%rbp), %rcx
1454f1652:     	movq	%rsi, %rdx
1454f1655:     	callq	0x145728850 <.text+0x5727850>
1454f165a:     	nop
1454f165b:     	leaq	0x168(%rbp), %rcx
1454f1662:     	movq	%rsi, %rdx
1454f1665:     	callq	0x145728850 <.text+0x5727850>
1454f166a:     	nop
1454f166b:     	leaq	0x68(%rbp), %rcx
1454f166f:     	movq	0x1f8(%rbp), %rdx
1454f1676:     	callq	0x145425910 <.text+0x5424910>
1454f167b:     	nop
1454f167c:     	movq	0xe0(%rbp), %rax
1454f1683:     	movq	%rax, 0x200(%rbp)
1454f168a:     	movq	0xe8(%rbp), %rax
1454f1691:     	movq	%rax, 0x220(%rbp)
1454f1698:     	movq	0xf0(%rbp), %r12
1454f169f:     	movq	0x168(%rbp), %rax
1454f16a6:     	movq	%rax, 0x238(%rbp)
1454f16ad:     	movq	0x170(%rbp), %rax
1454f16b4:     	movq	%rax, 0x228(%rbp)
1454f16bb:     	movq	0x178(%rbp), %r14
1454f16c2:     	movq	0x70(%rbp), %rdx
1454f16c6:     	movq	0x78(%rbp), %r8
1454f16ca:     	movb	$0x1, 0x20d(%rbp)
1454f16d1:     	movq	$0x2, 0x20(%rsp)
1454f16da:     	leaq	0x150697a(%rip), %r9    # 0x1469f805b
1454f16e1:     	leaq	0x168(%rbp), %rcx
1454f16e8:     	callq	0x14546ac40 <.text+0x5469c40>
1454f16ed:     	nop
1454f16ee:     	movq	0x168(%rbp), %rcx
1454f16f5:     	movq	0x170(%rbp), %rdx
1454f16fc:     	movq	0x1f8(%rbp), %rax
1454f1703:     	movq	0x50(%rax), %rdi
1454f1707:     	testq	%rdi, %rdi
1454f170a:     	jns	0x1454f1d08 <.text+0x54f0d08>
1454f1710:     	movq	%rdx, 0x1d8(%rbp)
1454f1717:     	movq	%rcx, 0x210(%rbp)
1454f171e:     	xorl	%r14d, %r14d
1454f1721:     	movq	%r14, %rcx
1454f1724:     	movq	%rdi, %rdx
1454f1727:     	callq	0x14590379b <.text+0x590279b>
1454f172c:     	nop
1454f172d:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f1732:     	movq	%r13, 0x1f8(%rbp)
1454f1739:     	movq	0x18(%r8), %rcx
1454f173d:     	movq	0x2b8(%r14), %rdx
1454f1744:     	cmpq	%rdx, %rcx
1454f1747:     	jae	0x1454f2b81 <.text+0x54f1b81>
1454f174d:     	leaq	0x470(%r14), %rax
1454f1754:     	movq	0x2b0(%r14), %r8
1454f175b:     	movq	%rcx, 0x220(%rbp)
1454f1762:     	imulq	$0x58, %rcx, %rdx
1454f1766:     	leaq	(%r8,%rdx), %rdi
1454f176a:     	movq	%rbx, 0xe0(%rbp)
1454f1771:     	movq	(%r8,%rdx), %rcx
1454f1775:     	movq	0x30(%rcx), %rdx
1454f1779:     	movq	0x38(%rcx), %r8
1454f177d:     	addq	%rdx, %r8
1454f1780:     	movq	%rdx, 0x168(%rbp)
1454f1787:     	movq	%r8, 0x170(%rbp)
1454f178e:     	movq	%rcx, 0x178(%rbp)
1454f1795:     	movq	%rdi, 0x180(%rbp)
1454f179c:     	movq	%rax, 0x188(%rbp)
1454f17a3:     	movq	%rdi, 0x190(%rbp)
1454f17aa:     	movq	%rax, 0x198(%rbp)
1454f17b1:     	leaq	0xe0(%rbp), %rax
1454f17b8:     	movq	%rax, 0x1a0(%rbp)
1454f17bf:     	movq	%rdi, 0x1a8(%rbp)
1454f17c6:     	movq	%rax, 0x1b0(%rbp)
1454f17cd:     	movb	$0x1, 0x247(%rbp)
1454f17d4:     	leaq	0x138(%rbp), %rcx
1454f17db:     	leaq	0x168(%rbp), %rdx
1454f17e2:     	callq	0x145537e80 <.text+0x5536e80>
1454f17e7:     	nop
1454f17e8:     	movq	0x140(%rbp), %rcx
1454f17ef:     	movq	0x148(%rbp), %rsi
1454f17f6:     	addq	$0x8a0, %r14            # imm = 0x8A0
1454f17fd:     	movq	%rcx, 0x200(%rbp)
1454f1804:     	movq	%rsi, %rdx
1454f1807:     	movq	%r14, %r8
1454f180a:     	callq	0x14541f2a0 <.text+0x541e2a0>
1454f180f:     	nop
1454f1810:     	cmpq	$0x4, 0x158(%rbp)
1454f1818:     	movl	$0x1, %eax
1454f181d:     	sbbq	$-0x1, %rax
1454f1821:     	cmpq	%rsi, %rax
1454f1824:     	ja	0x1454f1830 <.text+0x54f0830>
1454f1826:     	movq	%rax, 0x148(%rbp)
1454f182d:     	movq	%rax, %rsi
1454f1830:     	movq	0x200(%rbp), %rax
1454f1837:     	addq	%rax, %rsi
1454f183a:     	movq	%rax, 0x168(%rbp)
1454f1841:     	movq	%rsi, 0x170(%rbp)
1454f1848:     	movq	%rdi, 0x178(%rbp)
1454f184f:     	leaq	0x158(%rbp), %rax
1454f1856:     	movq	%rax, 0x180(%rbp)
1454f185d:     	leaq	-0x50(%rbp), %rax
1454f1861:     	movq	%rax, 0x188(%rbp)
1454f1868:     	leaq	0x50(%rbp), %rcx
1454f186c:     	leaq	0x168(%rbp), %rdx
1454f1873:     	callq	0x1455437a0 <.text+0x55427a0>
1454f1878:     	nop
1454f1879:     	movb	$0x1, 0x237(%rbp)
1454f1880:     	leaq	0x15067c1(%rip), %rbx   # 0x1469f8048
1454f1887:     	movl	$0x13, %edx
1454f188c:     	movq	%rbx, %rcx
1454f188f:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f1894:     	nop
1454f1895:     	movq	%rax, %r15
1454f1898:     	movq	%rdx, %r14
1454f189b:     	movq	(%rdi), %rsi
1454f189e:     	movq	%rsi, 0xe0(%rbp)
1454f18a5:     	leaq	-0x54ef7ec(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f18ac:     	movq	%rax, 0xe8(%rbp)
1454f18b3:     	movb	$0x1, 0x237(%rbp)
1454f18ba:     	leaq	0x123a046(%rip), %rdx   # 0x14672b907
1454f18c1:     	leaq	0x168(%rbp), %rcx
1454f18c8:     	leaq	0xe0(%rbp), %r8
1454f18cf:     	callq	0x145728390 <.text+0x5727390>
1454f18d4:     	nop
1454f18d5:     	movq	%rdi, 0x238(%rbp)
1454f18dc:     	movq	0x170(%rbp), %rcx
1454f18e3:     	movq	0x178(%rbp), %rdx
1454f18ea:     	movq	0x10(%rsi), %rdi
1454f18ee:     	movq	0x18(%rsi), %r13
1454f18f2:     	movq	%rcx, 0x228(%rbp)
1454f18f9:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f18fe:     	nop
1454f18ff:     	movq	%rax, %rsi
1454f1902:     	movq	%rdx, %r12
1454f1905:     	movq	0x168(%rbp), %rdx
1454f190c:     	testq	%rdx, %rdx
1454f190f:     	je	0x1454f1923 <.text+0x54f0923>
1454f1911:     	movl	$0x1, %r8d
1454f1917:     	movq	0x228(%rbp), %rcx
1454f191e:     	callq	0x1400021d0 <.text+0x11d0>
1454f1923:     	testq	%r15, %r15
1454f1926:     	movl	$0x13, %eax
1454f192b:     	cmoveq	%rax, %r14
1454f192f:     	cmovneq	%r15, %rbx
1454f1933:     	testq	%rsi, %rsi
1454f1936:     	cmovneq	%rsi, %rdi
1454f193a:     	cmoveq	%r13, %r12
1454f193e:     	movq	%rdi, 0xa8(%rbp)
1454f1945:     	movq	%r12, 0xb0(%rbp)
1454f194c:     	movq	0x238(%rbp), %r15
1454f1953:     	movl	0x8(%r15), %eax
1454f1957:     	incl	%eax
1454f1959:     	movl	%eax, 0x80(%rbp)
1454f195f:     	leaq	0x1504a8a(%rip), %rax   # 0x1469f63f0
1454f1966:     	movq	%rax, 0x168(%rbp)
1454f196d:     	movq	$0x5, 0x170(%rbp)
1454f1978:     	leaq	0xa8(%rbp), %rax
1454f197f:     	movq	%rax, 0x178(%rbp)
1454f1986:     	leaq	0x1504a43(%rip), %rax   # 0x1469f63d0
1454f198d:     	movq	%rax, 0x180(%rbp)
1454f1994:     	leaq	0x1505116(%rip), %rax   # 0x1469f6ab1
1454f199b:     	movq	%rax, 0x188(%rbp)
1454f19a2:     	movq	$0x4, 0x190(%rbp)
1454f19ad:     	leaq	0x80(%rbp), %rax
1454f19b4:     	movq	%rax, 0x198(%rbp)
1454f19bb:     	leaq	0x1504a8e(%rip), %rax   # 0x1469f6450
1454f19c2:     	movq	%rax, 0x1a0(%rbp)
1454f19c9:     	movb	$0x1, 0x237(%rbp)
1454f19d0:     	movq	$0x2, 0x20(%rsp)
1454f19d9:     	leaq	0x1e0(%rbp), %rcx
1454f19e0:     	leaq	0x168(%rbp), %r9
1454f19e7:     	movq	%rbx, %rdx
1454f19ea:     	movq	%r14, %r8
1454f19ed:     	callq	0x145458060 <.text+0x5457060>
1454f19f2:     	nop
1454f19f3:     	movq	(%r15), %rsi
1454f19f6:     	movq	%rsi, 0xc0(%rbp)
1454f19fd:     	leaq	-0x54ef944(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f1a04:     	movq	%rax, 0xc8(%rbp)
1454f1a0b:     	movb	$0x1, 0x233(%rbp)
1454f1a12:     	leaq	0x1239eee(%rip), %rdx   # 0x14672b907
1454f1a19:     	leaq	0xe0(%rbp), %rcx
1454f1a20:     	leaq	0xc0(%rbp), %r8
1454f1a27:     	callq	0x145728390 <.text+0x5727390>
1454f1a2c:     	nop
1454f1a2d:     	movq	0xe8(%rbp), %rcx
1454f1a34:     	movq	0xf0(%rbp), %rdx
1454f1a3b:     	movq	0x10(%rsi), %rbx
1454f1a3f:     	movq	0x18(%rsi), %rdi
1454f1a43:     	movq	%rcx, 0x228(%rbp)
1454f1a4a:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f1a4f:     	nop
1454f1a50:     	movq	%rax, %rsi
1454f1a53:     	movq	%rdx, %r14
1454f1a56:     	movq	0xe0(%rbp), %rdx
1454f1a5d:     	testq	%rdx, %rdx
1454f1a60:     	je	0x1454f1a74 <.text+0x54f0a74>
1454f1a62:     	movl	$0x1, %r8d
1454f1a68:     	movq	0x228(%rbp), %rcx
1454f1a6f:     	callq	0x1400021d0 <.text+0x11d0>
1454f1a74:     	testq	%rsi, %rsi
1454f1a77:     	cmovneq	%rsi, %rbx
1454f1a7b:     	cmoveq	%rdi, %r14
1454f1a7f:     	testq	%r14, %r14
1454f1a82:     	jns	0x1454f1d7a <.text+0x54f0d7a>
1454f1a88:     	xorl	%esi, %esi
1454f1a8a:     	movb	$0x1, 0x233(%rbp)
1454f1a91:     	movq	%rsi, %rcx
1454f1a94:     	movq	%r14, %rdx
1454f1a97:     	callq	0x14590379b <.text+0x590279b>
1454f1a9c:     	nop
1454f1a9d:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f1aa2:     	xorl	%eax, %eax
1454f1aa4:     	movl	%eax, 0x168(%rbp)
1454f1aaa:     	movb	$0x1, 0x247(%rbp)
1454f1ab1:     	leaq	0x168(%rbp), %r8
1454f1ab8:     	movq	0x200(%rbp), %rdi
1454f1abf:     	movq	%rdi, %rcx
1454f1ac2:     	movq	%rbx, %rdx
1454f1ac5:     	callq	0x145424420 <.text+0x5423420>
1454f1aca:     	nop
1454f1acb:     	movaps	%xmm0, %xmm6
1454f1ace:     	movzbl	0x44(%rdi), %r12d
1454f1ad3:     	cmpb	$0xf, %r12b
1454f1ad7:     	jne	0x1454f1af5 <.text+0x54f0af5>
1454f1ad9:     	xorl	%eax, %eax
1454f1adb:     	movl	$0x2, %ecx
1454f1ae0:     	subl	0x4c0(%r14), %ecx
1454f1ae7:     	cmovbl	%eax, %ecx
1454f1aea:     	xorps	%xmm0, %xmm0
1454f1aed:     	cvtsi2ss	%ecx, %xmm0
1454f1af1:     	minss	%xmm0, %xmm6
1454f1af5:     	movq	0x2d0(%r14), %rax
1454f1afc:     	testq	%rax, %rax
1454f1aff:     	je	0x1454f1c15 <.text+0x54f0c15>
1454f1b05:     	movq	0x2c8(%r14), %r14
1454f1b0c:     	shlq	$0x3, %rax
1454f1b10:     	leaq	(%rax,%rax,2), %r13
1454f1b14:     	movq	(%rdi), %rsi
1454f1b17:     	movq	0x8(%rdi), %rbx
1454f1b1b:     	xorl	%r15d, %r15d
1454f1b1e:     	jmp	0x1454f1b2d <.text+0x54f0b2d>
1454f1b20:     	addq	$0x18, %r15
1454f1b24:     	cmpq	%r15, %r13
1454f1b27:     	je	0x1454f1c15 <.text+0x54f0c15>
1454f1b2d:     	movq	(%r14,%r15), %rax
1454f1b31:     	cmpq	%rbx, 0x8(%rax)
1454f1b35:     	jne	0x1454f1b20 <.text+0x54f0b20>
1454f1b37:     	movq	(%rax), %rcx
1454f1b3a:     	movq	%rsi, %rdx
1454f1b3d:     	movq	%rbx, %r8
1454f1b40:     	callq	0x1457731e7 <.text+0x57721e7>
1454f1b45:     	testl	%eax, %eax
1454f1b47:     	jne	0x1454f1b20 <.text+0x54f0b20>
1454f1b49:     	cmpb	$0xf, %r12b
1454f1b4d:     	jne	0x1454f218e <.text+0x54f118e>
1454f1b53:     	movq	%rdi, 0xe0(%rbp)
1454f1b5a:     	leaq	-0x54efaa1(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f1b61:     	movq	%rax, 0xe8(%rbp)
1454f1b68:     	movb	$0x1, 0x247(%rbp)
1454f1b6f:     	leaq	0x1248925(%rip), %rdx   # 0x14673a49b
1454f1b76:     	leaq	0x168(%rbp), %rcx
1454f1b7d:     	leaq	0xe0(%rbp), %r8
1454f1b84:     	callq	0x145728390 <.text+0x5727390>
1454f1b89:     	nop
1454f1b8a:     	movq	0x170(%rbp), %rcx
1454f1b91:     	movq	0x178(%rbp), %rdx
1454f1b98:     	movq	0x10(%rdi), %r13
1454f1b9c:     	movq	0x18(%rdi), %r12
1454f1ba0:     	movq	%rcx, 0x238(%rbp)
1454f1ba7:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f1bac:     	nop
1454f1bad:     	movq	%rax, %rbx
1454f1bb0:     	movq	%rdx, %rsi
1454f1bb3:     	movq	0x168(%rbp), %rdx
1454f1bba:     	testq	%rdx, %rdx
1454f1bbd:     	je	0x1454f1bd1 <.text+0x54f0bd1>
1454f1bbf:     	movl	$0x1, %r8d
1454f1bc5:     	movq	0x238(%rbp), %rcx
1454f1bcc:     	callq	0x1400021d0 <.text+0x11d0>
1454f1bd1:     	testq	%rbx, %rbx
1454f1bd4:     	cmovneq	%rbx, %r13
1454f1bd8:     	cmoveq	%r12, %rsi
1454f1bdc:     	movq	%r13, 0x138(%rbp)
1454f1be3:     	movq	%rsi, 0x140(%rbp)
1454f1bea:     	movl	0x14(%r14,%r15), %eax
1454f1bef:     	incl	%eax
1454f1bf1:     	cmpl	$0xa, %eax
1454f1bf4:     	ja	0x1454f2633 <.text+0x54f1633>
1454f1bfa:     	movl	%eax, %eax
1454f1bfc:     	shlq	$0x4, %rax
1454f1c00:     	leaq	0x1504451(%rip), %rdx   # 0x1469f6058
1454f1c07:     	movq	(%rax,%rdx), %rcx
1454f1c0b:     	movq	0x8(%rax,%rdx), %rax
1454f1c10:     	jmp	0x1454f263f <.text+0x54f163f>
1454f1c15:     	movq	%rdi, 0xe0(%rbp)
1454f1c1c:     	leaq	-0x54efb63(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f1c23:     	movq	%rax, 0xe8(%rbp)
1454f1c2a:     	movb	$0x1, 0x247(%rbp)
1454f1c31:     	leaq	0x1248863(%rip), %rdx   # 0x14673a49b
1454f1c38:     	leaq	0x168(%rbp), %rcx
1454f1c3f:     	leaq	0xe0(%rbp), %r8
1454f1c46:     	callq	0x145728390 <.text+0x5727390>
1454f1c4b:     	nop
1454f1c4c:     	movq	0x170(%rbp), %rcx
1454f1c53:     	movq	0x178(%rbp), %rdx
1454f1c5a:     	movq	0x10(%rdi), %rbx
1454f1c5e:     	movq	0x18(%rdi), %r14
1454f1c62:     	movq	%rcx, 0x238(%rbp)
1454f1c69:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f1c6e:     	nop
1454f1c6f:     	movq	%rax, %rsi
1454f1c72:     	movq	%rdx, %r15
1454f1c75:     	movq	0x168(%rbp), %rdx
1454f1c7c:     	testq	%rdx, %rdx
1454f1c7f:     	je	0x1454f1c93 <.text+0x54f0c93>
1454f1c81:     	movl	$0x1, %r8d
1454f1c87:     	movq	0x238(%rbp), %rcx
1454f1c8e:     	callq	0x1400021d0 <.text+0x11d0>
1454f1c93:     	testq	%rsi, %rsi
1454f1c96:     	cmovneq	%rsi, %rbx
1454f1c9a:     	cmoveq	%r14, %r15
1454f1c9e:     	testq	%r15, %r15
1454f1ca1:     	jns	0x1454f1e0f <.text+0x54f0e0f>
1454f1ca7:     	xorl	%esi, %esi
1454f1ca9:     	movb	$0x1, 0x247(%rbp)
1454f1cb0:     	movq	%rsi, %rcx
1454f1cb3:     	movq	%r15, %rdx
1454f1cb6:     	callq	0x14590379b <.text+0x590279b>
1454f1cbb:     	nop
1454f1cbc:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f1cc1:     	movq	%rbx, 0x1f8(%rbp)
1454f1cc8:     	je	0x1454f1e56 <.text+0x54f0e56>
1454f1cce:     	callq	0x140002200 <.text+0x1200>
1454f1cd3:     	movl	$0x1, %esi
1454f1cd8:     	movl	$0x1, %edx
1454f1cdd:     	movq	%rbx, %rcx
1454f1ce0:     	callq	0x1400021c0 <.text+0x11c0>
1454f1ce5:     	testq	%rax, %rax
1454f1ce8:     	je	0x1454f1559 <.text+0x54f0559>
1454f1cee:     	movq	%rax, 0x200(%rbp)
1454f1cf5:     	movq	%rax, %rcx
1454f1cf8:     	movq	%rdi, %rdx
1454f1cfb:     	movq	%rbx, %r8
1454f1cfe:     	callq	0x1457731ed <.text+0x57721ed>
1454f1d03:     	jmp	0x1454f1e62 <.text+0x54f0e62>
1454f1d08:     	movq	0x178(%rbp), %r15
1454f1d0f:     	je	0x1454f1ee5 <.text+0x54f0ee5>
1454f1d15:     	movq	%rdx, 0x1d8(%rbp)
1454f1d1c:     	movq	%rcx, 0x210(%rbp)
1454f1d23:     	movq	%r14, 0x160(%rbp)
1454f1d2a:     	movq	0x48(%rax), %rsi
1454f1d2e:     	callq	0x140002200 <.text+0x1200>
1454f1d33:     	movl	$0x1, %r14d
1454f1d39:     	movl	$0x1, %edx
1454f1d3e:     	movq	%rdi, %rcx
1454f1d41:     	callq	0x1400021c0 <.text+0x11c0>
1454f1d46:     	testq	%rax, %rax
1454f1d49:     	je	0x1454f1721 <.text+0x54f0721>
1454f1d4f:     	movq	%rax, %rbx
1454f1d52:     	movq	%rax, %rcx
1454f1d55:     	movq	%rsi, %rdx
1454f1d58:     	movq	%rdi, %r8
1454f1d5b:     	callq	0x1457731ed <.text+0x57721ed>
1454f1d60:     	movq	0x160(%rbp), %r14
1454f1d67:     	movq	0x210(%rbp), %rcx
1454f1d6e:     	movq	0x1d8(%rbp), %rdx
1454f1d75:     	jmp	0x1454f1eea <.text+0x54f0eea>
1454f1d7a:     	movq	%r14, 0x228(%rbp)
1454f1d81:     	je	0x1454f1f94 <.text+0x54f0f94>
1454f1d87:     	callq	0x140002200 <.text+0x1200>
1454f1d8c:     	movl	$0x1, %esi
1454f1d91:     	movl	$0x1, %edx
1454f1d96:     	movq	%r14, %rcx
1454f1d99:     	callq	0x1400021c0 <.text+0x11c0>
1454f1d9e:     	testq	%rax, %rax
1454f1da1:     	movq	0x1f8(%rbp), %r13
1454f1da8:     	je	0x1454f1a8a <.text+0x54f0a8a>
1454f1dae:     	movq	%rax, 0x210(%rbp)
1454f1db5:     	movq	%rax, %rcx
1454f1db8:     	movq	%rbx, %rdx
1454f1dbb:     	movq	%r14, %r8
1454f1dbe:     	callq	0x1457731ed <.text+0x57721ed>
1454f1dc3:     	jmp	0x1454f1fa7 <.text+0x54f0fa7>
1454f1dc8:     	movq	%r14, 0x238(%rbp)
1454f1dcf:     	je	0x1454f206f <.text+0x54f106f>
1454f1dd5:     	callq	0x140002200 <.text+0x1200>
1454f1dda:     	movl	$0x1, %esi
1454f1ddf:     	movl	$0x1, %edx
1454f1de4:     	movq	%r14, %rcx
1454f1de7:     	callq	0x1400021c0 <.text+0x11c0>
1454f1dec:     	testq	%rax, %rax
1454f1def:     	je	0x1454f14fd <.text+0x54f04fd>
1454f1df5:     	movq	%rax, 0x220(%rbp)
1454f1dfc:     	movq	%rax, %rcx
1454f1dff:     	movq	%r12, %rdx
1454f1e02:     	movq	%r14, %r8
1454f1e05:     	callq	0x1457731ed <.text+0x57721ed>
1454f1e0a:     	jmp	0x1454f207b <.text+0x54f107b>
1454f1e0f:     	movq	%r15, 0x238(%rbp)
1454f1e16:     	je	0x1454f2132 <.text+0x54f1132>
1454f1e1c:     	callq	0x140002200 <.text+0x1200>
1454f1e21:     	movl	$0x1, %esi
1454f1e26:     	movl	$0x1, %edx
1454f1e2b:     	movq	%r15, %rcx
1454f1e2e:     	callq	0x1400021c0 <.text+0x11c0>
1454f1e33:     	testq	%rax, %rax
1454f1e36:     	je	0x1454f1ca9 <.text+0x54f0ca9>
1454f1e3c:     	movq	%rax, 0x228(%rbp)
1454f1e43:     	movq	%rax, %rcx
1454f1e46:     	movq	%rbx, %rdx
1454f1e49:     	movq	%r15, %r8
1454f1e4c:     	callq	0x1457731ed <.text+0x57721ed>
1454f1e51:     	jmp	0x1454f213e <.text+0x54f113e>
1454f1e56:     	movl	$0x1, %eax
1454f1e5b:     	movq	%rax, 0x200(%rbp)
1454f1e62:     	leaq	0x15061f9(%rip), %rdi   # 0x1469f8062
1454f1e69:     	movl	$0xf, %esi
1454f1e6e:     	movl	$0xf, %edx
1454f1e73:     	movq	%rdi, %rcx
1454f1e76:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f1e7b:     	nop
1454f1e7c:     	testq	%rax, %rax
1454f1e7f:     	cmovneq	%rax, %rdi
1454f1e83:     	cmoveq	%rsi, %rdx
1454f1e87:     	testq	%rdx, %rdx
1454f1e8a:     	movq	%rdx, %rbx
1454f1e8d:     	jns	0x1454f1ea2 <.text+0x54f0ea2>
1454f1e8f:     	xorl	%esi, %esi
1454f1e91:     	movq	%rsi, %rcx
1454f1e94:     	movq	%rbx, %rdx
1454f1e97:     	callq	0x14590379b <.text+0x590279b>
1454f1e9c:     	nop
1454f1e9d:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f1ea2:     	movq	%rbx, 0x238(%rbp)
1454f1ea9:     	je	0x1454f2250 <.text+0x54f1250>
1454f1eaf:     	callq	0x140002200 <.text+0x1200>
1454f1eb4:     	movl	$0x1, %esi
1454f1eb9:     	movl	$0x1, %edx
1454f1ebe:     	movq	%rbx, %rcx
1454f1ec1:     	callq	0x1400021c0 <.text+0x11c0>
1454f1ec6:     	testq	%rax, %rax
1454f1ec9:     	je	0x1454f1e91 <.text+0x54f0e91>
1454f1ecb:     	movq	%rax, 0x220(%rbp)
1454f1ed2:     	movq	%rax, %rcx
1454f1ed5:     	movq	%rdi, %rdx
1454f1ed8:     	movq	%rbx, %r8
1454f1edb:     	callq	0x1457731ed <.text+0x57721ed>
1454f1ee0:     	jmp	0x1454f225c <.text+0x54f125c>
1454f1ee5:     	movl	$0x1, %ebx
1454f1eea:     	movabsq	$-0x7ffffffffffffffd, %rax # imm = 0x8000000000000003
1454f1ef4:     	movq	%rax, 0x78(%r13)
1454f1ef8:     	movq	0x1f8(%rbp), %rax
1454f1eff:     	movq	%rax, 0x80(%r13)
1454f1f06:     	movq	0x158(%rbp), %rax
1454f1f0d:     	movq	%rax, 0x98(%r13)
1454f1f14:     	movq	0x200(%rbp), %rax
1454f1f1b:     	movq	%rax, (%r13)
1454f1f1f:     	movq	0x220(%rbp), %rax
1454f1f26:     	movq	%rax, 0x8(%r13)
1454f1f2a:     	movq	%r12, 0x10(%r13)
1454f1f2e:     	movq	%rcx, 0x18(%r13)
1454f1f32:     	movq	%rdx, 0x20(%r13)
1454f1f36:     	movq	%r15, 0x28(%r13)
1454f1f3a:     	movq	%rdi, 0x30(%r13)
1454f1f3e:     	movq	%rbx, 0x38(%r13)
1454f1f42:     	movq	%rdi, 0x40(%r13)
1454f1f46:     	movq	0x238(%rbp), %rax
1454f1f4d:     	movq	%rax, 0x48(%r13)
1454f1f51:     	movq	0x228(%rbp), %rax
1454f1f58:     	movq	%rax, 0x50(%r13)
1454f1f5c:     	movq	%r14, 0x58(%r13)
1454f1f60:     	movq	0x78(%rbp), %rax
1454f1f64:     	movq	%rax, 0x70(%r13)
1454f1f68:     	movups	0x68(%rbp), %xmm0
1454f1f6c:     	movups	%xmm0, 0x60(%r13)
1454f1f71:     	movq	0x150(%rbp), %rcx
1454f1f78:     	movabsq	$-0x7ffffffffffffffd, %rax # imm = 0x8000000000000003
1454f1f82:     	cmpq	%rax, 0x98(%rbp)
1454f1f89:     	jne	0x1454f2ad0 <.text+0x54f1ad0>
1454f1f8f:     	jmp	0x1454f2ad5 <.text+0x54f1ad5>
1454f1f94:     	movl	$0x1, %eax
1454f1f99:     	movq	%rax, 0x210(%rbp)
1454f1fa0:     	movq	0x1f8(%rbp), %r13
1454f1fa7:     	movq	0x58(%rbp), %rdx
1454f1fab:     	movq	0x60(%rbp), %r8
1454f1faf:     	movb	$0x1, 0x20e(%rbp)
1454f1fb6:     	movq	$0x2, 0x20(%rsp)
1454f1fbf:     	leaq	0x1506095(%rip), %r9    # 0x1469f805b
1454f1fc6:     	leaq	0xe0(%rbp), %rcx
1454f1fcd:     	callq	0x14546ac40 <.text+0x5469c40>
1454f1fd2:     	nop
1454f1fd3:     	movq	0xe0(%rbp), %r12
1454f1fda:     	movq	0xe8(%rbp), %rdx
1454f1fe1:     	movq	(%r15), %rax
1454f1fe4:     	movq	0x28(%rax), %rbx
1454f1fe8:     	testq	%rbx, %rbx
1454f1feb:     	movq	0x220(%rbp), %rcx
1454f1ff2:     	jns	0x1454f2016 <.text+0x54f1016>
1454f1ff4:     	movq	%rdx, 0x1f8(%rbp)
1454f1ffb:     	xorl	%r15d, %r15d
1454f1ffe:     	movq	%r12, 0x238(%rbp)
1454f2005:     	movq	%r15, %rcx
1454f2008:     	movq	%rbx, %rdx
1454f200b:     	callq	0x14590379b <.text+0x590279b>
1454f2010:     	nop
1454f2011:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f2016:     	movq	0xf0(%rbp), %rdi
1454f201d:     	je	0x1454f2459 <.text+0x54f1459>
1454f2023:     	movq	%rdx, 0x1f8(%rbp)
1454f202a:     	movq	0x20(%rax), %rsi
1454f202e:     	callq	0x140002200 <.text+0x1200>
1454f2033:     	movl	$0x1, %r15d
1454f2039:     	movl	$0x1, %edx
1454f203e:     	movq	%rbx, %rcx
1454f2041:     	callq	0x1400021c0 <.text+0x11c0>
1454f2046:     	testq	%rax, %rax
1454f2049:     	je	0x1454f1ffe <.text+0x54f0ffe>
1454f204b:     	movq	%rax, %r14
1454f204e:     	movq	%rax, %rcx
1454f2051:     	movq	%rsi, %rdx
1454f2054:     	movq	%rbx, %r8
1454f2057:     	callq	0x1457731ed <.text+0x57721ed>
1454f205c:     	movq	0x220(%rbp), %rcx
1454f2063:     	movq	0x1f8(%rbp), %rdx
1454f206a:     	jmp	0x1454f245f <.text+0x54f145f>
1454f206f:     	movl	$0x1, %eax
1454f2074:     	movq	%rax, 0x220(%rbp)
1454f207b:     	movq	0xb8(%rbp), %rax
1454f2082:     	movq	%rax, 0x1f0(%rbp)
1454f2089:     	movups	0xa8(%rbp), %xmm0
1454f2090:     	movaps	%xmm0, 0x1e0(%rbp)
1454f2097:     	movq	0xc0(%rbp), %rcx
1454f209e:     	movq	0xc8(%rbp), %rdx
1454f20a5:     	movq	0x28(%r15,%r13), %r14
1454f20aa:     	testq	%r14, %r14
1454f20ad:     	jns	0x1454f20d1 <.text+0x54f10d1>
1454f20af:     	movq	%rdx, 0x210(%rbp)
1454f20b6:     	movq	%rcx, 0x228(%rbp)
1454f20bd:     	xorl	%r12d, %r12d
1454f20c0:     	movq	%r12, %rcx
1454f20c3:     	movq	%r14, %rdx
1454f20c6:     	callq	0x14590379b <.text+0x590279b>
1454f20cb:     	nop
1454f20cc:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f20d1:     	movq	0xd0(%rbp), %rsi
1454f20d8:     	je	0x1454f24e9 <.text+0x54f14e9>
1454f20de:     	movq	%rdx, 0x210(%rbp)
1454f20e5:     	movq	%rcx, 0x228(%rbp)
1454f20ec:     	movq	0x20(%r15,%r13), %r13
1454f20f1:     	callq	0x140002200 <.text+0x1200>
1454f20f6:     	movl	$0x1, %r12d
1454f20fc:     	movl	$0x1, %edx
1454f2101:     	movq	%r14, %rcx
1454f2104:     	callq	0x1400021c0 <.text+0x11c0>
1454f2109:     	testq	%rax, %rax
1454f210c:     	je	0x1454f20c0 <.text+0x54f10c0>
1454f210e:     	movq	%rax, %r15
1454f2111:     	movq	%rax, %rcx
1454f2114:     	movq	%r13, %rdx
1454f2117:     	movq	%r14, %r8
1454f211a:     	callq	0x1457731ed <.text+0x57721ed>
1454f211f:     	movq	0x228(%rbp), %rcx
1454f2126:     	movq	0x210(%rbp), %rdx
1454f212d:     	jmp	0x1454f24ef <.text+0x54f14ef>
1454f2132:     	movl	$0x1, %eax
1454f2137:     	movq	%rax, 0x228(%rbp)
1454f213e:     	leaq	0x38(%rbp), %rcx
1454f2142:     	movq	%rdi, %rdx
1454f2145:     	movaps	%xmm6, %xmm2
1454f2148:     	callq	0x145424a90 <.text+0x5423a90>
1454f214d:     	nop
1454f214e:     	movq	0x238(%rbp), %r12
1454f2155:     	jmp	0x1454f2818 <.text+0x54f1818>
1454f215a:     	leaq	0x338(%r14), %rdi
1454f2161:     	movl	0x388(%r14), %eax
1454f2168:     	incl	%eax
1454f216a:     	cmpl	$0xa, %eax
1454f216d:     	ja	0x1454f2581 <.text+0x54f1581>
1454f2173:     	movl	%eax, %eax
1454f2175:     	shlq	$0x4, %rax
1454f2179:     	leaq	0x1503ed8(%rip), %rdx   # 0x1469f6058
1454f2180:     	movq	(%rax,%rdx), %rcx
1454f2184:     	movq	0x8(%rax,%rdx), %rax
1454f2189:     	jmp	0x1454f258d <.text+0x54f158d>
1454f218e:     	movq	%rdi, 0xe0(%rbp)
1454f2195:     	leaq	-0x54f00dc(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f219c:     	movq	%rax, 0xe8(%rbp)
1454f21a3:     	movb	$0x1, 0x247(%rbp)
1454f21aa:     	leaq	0x12482ea(%rip), %rdx   # 0x14673a49b
1454f21b1:     	leaq	0x168(%rbp), %rcx
1454f21b8:     	leaq	0xe0(%rbp), %r8
1454f21bf:     	callq	0x145728390 <.text+0x5727390>
1454f21c4:     	nop
1454f21c5:     	movq	0x170(%rbp), %rcx
1454f21cc:     	movq	0x178(%rbp), %rdx
1454f21d3:     	movq	0x10(%rdi), %r13
1454f21d7:     	movq	0x18(%rdi), %r12
1454f21db:     	movq	%rcx, 0x238(%rbp)
1454f21e2:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f21e7:     	nop
1454f21e8:     	movq	%rax, %rbx
1454f21eb:     	movq	%rdx, %rsi
1454f21ee:     	movq	0x168(%rbp), %rdx
1454f21f5:     	testq	%rdx, %rdx
1454f21f8:     	je	0x1454f220c <.text+0x54f120c>
1454f21fa:     	movl	$0x1, %r8d
1454f2200:     	movq	0x238(%rbp), %rcx
1454f2207:     	callq	0x1400021d0 <.text+0x11d0>
1454f220c:     	testq	%rbx, %rbx
1454f220f:     	cmovneq	%rbx, %r13
1454f2213:     	cmoveq	%r12, %rsi
1454f2217:     	movq	%r13, 0x138(%rbp)
1454f221e:     	movq	%rsi, 0x140(%rbp)
1454f2225:     	movl	0x14(%r14,%r15), %eax
1454f222a:     	incl	%eax
1454f222c:     	cmpl	$0xa, %eax
1454f222f:     	ja	0x1454f26d8 <.text+0x54f16d8>
1454f2235:     	movl	%eax, %eax
1454f2237:     	shlq	$0x4, %rax
1454f223b:     	leaq	0x1503e16(%rip), %rdx   # 0x1469f6058
1454f2242:     	movq	(%rax,%rdx), %rcx
1454f2246:     	movq	0x8(%rax,%rdx), %rax
1454f224b:     	jmp	0x1454f26e4 <.text+0x54f16e4>
1454f2250:     	movl	$0x1, %eax
1454f2255:     	movq	%rax, 0x220(%rbp)
1454f225c:     	leaq	0x1505e0e(%rip), %rdi   # 0x1469f8071
1454f2263:     	movl	$0x9, %esi
1454f2268:     	movl	$0x9, %edx
1454f226d:     	movq	%rdi, %rcx
1454f2270:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f2275:     	nop
1454f2276:     	movq	%rdx, %r8
1454f2279:     	testq	%rax, %rax
1454f227c:     	cmovneq	%rax, %rdi
1454f2280:     	cmoveq	%rsi, %r8
1454f2284:     	leaq	0x1505def(%rip), %rbx   # 0x1469f807a
1454f228b:     	movq	%rbx, 0xe0(%rbp)
1454f2292:     	movq	$0x1, 0xe8(%rbp)
1454f229d:     	leaq	0xc0(%rbp), %r14
1454f22a4:     	movq	%r14, 0xf0(%rbp)
1454f22ab:     	leaq	0x150419e(%rip), %r15   # 0x1469f6450
1454f22b2:     	movq	%r15, 0xf8(%rbp)
1454f22b9:     	movq	$0x1, 0x20(%rsp)
1454f22c2:     	leaq	0x138(%rbp), %rcx
1454f22c9:     	leaq	0xe0(%rbp), %r9
1454f22d0:     	movq	%rdi, %rdx
1454f22d3:     	callq	0x145458060 <.text+0x5457060>
1454f22d8:     	nop
1454f22d9:     	callq	0x140002200 <.text+0x1200>
1454f22de:     	movl	$0x18, %ecx
1454f22e3:     	movl	$0x8, %edx
1454f22e8:     	callq	0x1400021c0 <.text+0x11c0>
1454f22ed:     	movq	%rax, 0x228(%rbp)
1454f22f4:     	testq	%rax, %rax
1454f22f7:     	je	0x1454f2b2f <.text+0x54f1b2f>
1454f22fd:     	leaq	0x1505d6d(%rip), %rsi   # 0x1469f8071
1454f2304:     	movl	$0x9, %edi
1454f2309:     	movl	$0x9, %edx
1454f230e:     	movq	%rsi, %rcx
1454f2311:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f2316:     	nop
1454f2317:     	movq	%rdx, %r8
1454f231a:     	testq	%rax, %rax
1454f231d:     	cmovneq	%rax, %rsi
1454f2321:     	cmoveq	%rdi, %r8
1454f2325:     	movq	%rbx, 0x168(%rbp)
1454f232c:     	movq	$0x1, 0x170(%rbp)
1454f2337:     	movq	%r14, 0x178(%rbp)
1454f233e:     	movq	%r15, 0x180(%rbp)
1454f2345:     	movq	$0x1, 0x20(%rsp)
1454f234e:     	leaq	0x1e0(%rbp), %rcx
1454f2355:     	leaq	0x168(%rbp), %r9
1454f235c:     	movq	%rsi, %rdx
1454f235f:     	callq	0x145458060 <.text+0x5457060>
1454f2364:     	nop
1454f2365:     	movq	0x1f0(%rbp), %rax
1454f236c:     	movq	0x228(%rbp), %rcx
1454f2373:     	movq	%rax, 0x10(%rcx)
1454f2377:     	movups	0x1e0(%rbp), %xmm0
1454f237e:     	movups	%xmm0, (%rcx)
1454f2381:     	movq	$0x1, 0x1e0(%rbp)
1454f238c:     	movq	%rcx, 0x1e8(%rbp)
1454f2393:     	movq	$0x1, 0x1f0(%rbp)
1454f239e:     	callq	0x140002200 <.text+0x1200>
1454f23a3:     	movl	$0x10, %ecx
1454f23a8:     	movl	$0x1, %edx
1454f23ad:     	callq	0x1400021c0 <.text+0x11c0>
1454f23b2:     	testq	%rax, %rax
1454f23b5:     	je	0x1454f2b97 <.text+0x54f1b97>
1454f23bb:     	movups	0x1505cb9(%rip), %xmm0  # 0x1469f807b
1454f23c2:     	movups	%xmm0, (%rax)
1454f23c5:     	movl	0xc0(%rbp), %ecx
1454f23cb:     	movabsq	$-0x7ffffffffffffffc, %rdx # imm = 0x8000000000000004
1454f23d5:     	movq	%rdx, 0x78(%r13)
1454f23d9:     	movl	%ecx, 0x80(%r13)
1454f23e0:     	movq	0x158(%rbp), %rcx
1454f23e7:     	movq	%rcx, 0x98(%r13)
1454f23ee:     	movq	0x1f8(%rbp), %rcx
1454f23f5:     	movq	%rcx, (%r13)
1454f23f9:     	movq	0x200(%rbp), %rdx
1454f2400:     	movq	%rdx, 0x8(%r13)
1454f2404:     	movq	%rcx, 0x10(%r13)
1454f2408:     	movq	0x148(%rbp), %rcx
1454f240f:     	movq	%rcx, 0x28(%r13)
1454f2413:     	movups	0x138(%rbp), %xmm0
1454f241a:     	movups	%xmm0, 0x18(%r13)
1454f241f:     	movq	$0x10, 0x30(%r13)
1454f2427:     	movq	%rax, 0x38(%r13)
1454f242b:     	movq	$0x10, 0x40(%r13)
1454f2433:     	movq	0x238(%rbp), %rax
1454f243a:     	movq	%rax, 0x48(%r13)
1454f243e:     	movq	0x220(%rbp), %rcx
1454f2445:     	movq	%rcx, 0x50(%r13)
1454f2449:     	movq	%rax, 0x58(%r13)
1454f244d:     	movups	0x1e0(%rbp), %xmm0
1454f2454:     	jmp	0x1454f2570 <.text+0x54f1570>
1454f2459:     	movl	$0x1, %r14d
1454f245f:     	movq	0x148(%rbp), %rax
1454f2466:     	movq	%rax, 0x88(%r13)
1454f246d:     	movups	0x138(%rbp), %xmm0
1454f2474:     	movups	%xmm0, 0x78(%r13)
1454f2479:     	movq	%rcx, 0x90(%r13)
1454f2480:     	movq	0x158(%rbp), %rax
1454f2487:     	movq	%rax, 0x98(%r13)
1454f248e:     	movups	0x1e0(%rbp), %xmm0
1454f2495:     	movups	%xmm0, (%r13)
1454f249a:     	movq	0x1f0(%rbp), %rax
1454f24a1:     	movq	%rax, 0x10(%r13)
1454f24a5:     	movq	%r12, 0x18(%r13)
1454f24a9:     	movq	%rdx, 0x20(%r13)
1454f24ad:     	movq	%rdi, 0x28(%r13)
1454f24b1:     	movq	%rbx, 0x30(%r13)
1454f24b5:     	movq	%r14, 0x38(%r13)
1454f24b9:     	movq	%rbx, 0x40(%r13)
1454f24bd:     	movq	0x228(%rbp), %rax
1454f24c4:     	movq	%rax, 0x48(%r13)
1454f24c8:     	movq	0x210(%rbp), %rcx
1454f24cf:     	movq	%rcx, 0x50(%r13)
1454f24d3:     	movq	%rax, 0x58(%r13)
1454f24d7:     	movups	0x50(%rbp), %xmm0
1454f24db:     	movups	%xmm0, 0x60(%r13)
1454f24e0:     	movq	0x60(%rbp), %rax
1454f24e4:     	jmp	0x1454f2ab2 <.text+0x54f1ab2>
1454f24e9:     	movl	$0x1, %r15d
1454f24ef:     	movq	0x1f8(%rbp), %r13
1454f24f6:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
1454f2500:     	movq	%rax, 0x78(%r13)
1454f2504:     	movq	%rdi, 0x80(%r13)
1454f250b:     	movq	%rbx, 0x88(%r13)
1454f2512:     	movq	0x158(%rbp), %rax
1454f2519:     	movq	%rax, 0x98(%r13)
1454f2520:     	movups	0x138(%rbp), %xmm0
1454f2527:     	movups	%xmm0, (%r13)
1454f252c:     	movq	0x148(%rbp), %rax
1454f2533:     	movq	%rax, 0x10(%r13)
1454f2537:     	movq	%rcx, 0x18(%r13)
1454f253b:     	movq	%rdx, 0x20(%r13)
1454f253f:     	movq	%rsi, 0x28(%r13)
1454f2543:     	movq	%r14, 0x30(%r13)
1454f2547:     	movq	%r15, 0x38(%r13)
1454f254b:     	movq	%r14, 0x40(%r13)
1454f254f:     	movq	0x238(%rbp), %rax
1454f2556:     	movq	%rax, 0x48(%r13)
1454f255a:     	movq	0x220(%rbp), %rcx
1454f2561:     	movq	%rcx, 0x50(%r13)
1454f2565:     	movq	%rax, 0x58(%r13)
1454f2569:     	movaps	0x1e0(%rbp), %xmm0
1454f2570:     	movups	%xmm0, 0x60(%r13)
1454f2575:     	movq	0x1f0(%rbp), %rax
1454f257c:     	jmp	0x1454f2ab2 <.text+0x54f1ab2>
1454f2581:     	movl	$0x2, %eax
1454f2586:     	leaq	0x1503b7b(%rip), %rcx   # 0x1469f6108
1454f258d:     	movq	%rcx, 0x1e0(%rbp)
1454f2594:     	movq	%rax, 0x1e8(%rbp)
1454f259b:     	movq	%rdi, 0x168(%rbp)
1454f25a2:     	leaq	-0x54f04c9(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454f25a9:     	movq	%rax, 0x170(%rbp)
1454f25b0:     	leaq	0x1e0(%rbp), %rax
1454f25b7:     	movq	%rax, 0x178(%rbp)
1454f25be:     	leaq	-0x54f0505(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f25c5:     	movq	%rax, 0x180(%rbp)
1454f25cc:     	leaq	0x1505a8a(%rip), %rdx   # 0x1469f805d
1454f25d3:     	leaq	0xe0(%rbp), %rcx
1454f25da:     	leaq	0x168(%rbp), %r8
1454f25e1:     	callq	0x145728390 <.text+0x5727390>
1454f25e6:     	nop
1454f25e7:     	movq	0xe0(%rbp), %rax
1454f25ee:     	movq	%rax, 0x200(%rbp)
1454f25f5:     	movq	0xe8(%rbp), %rax
1454f25fc:     	movq	%rax, 0x220(%rbp)
1454f2603:     	movq	0xf0(%rbp), %r12
1454f260a:     	leaq	0x168(%rbp), %rcx
1454f2611:     	movq	%rdi, %rdx
1454f2614:     	callq	0x145728850 <.text+0x5727850>
1454f2619:     	nop
1454f261a:     	addq	$0x320, %r14            # imm = 0x320
1454f2621:     	leaq	0x68(%rbp), %rcx
1454f2625:     	movq	%r14, %rdx
1454f2628:     	callq	0x1454253b0 <.text+0x54243b0>
1454f262d:     	nop
1454f262e:     	jmp	0x1454f169f <.text+0x54f069f>
1454f2633:     	movl	$0x2, %eax
1454f2638:     	leaq	0x1503ac9(%rip), %rcx   # 0x1469f6108
1454f263f:     	leaq	-0x54f0586(%rip), %rdx  # 0x1400020c0 <.text+0x10c0>
1454f2646:     	movq	%rcx, 0x1e0(%rbp)
1454f264d:     	movq	%rax, 0x1e8(%rbp)
1454f2654:     	leaq	0x138(%rbp), %rax
1454f265b:     	movq	%rax, 0x168(%rbp)
1454f2662:     	movq	%rdx, 0x170(%rbp)
1454f2669:     	leaq	0x1e0(%rbp), %rax
1454f2670:     	movq	%rax, 0x178(%rbp)
1454f2677:     	movq	%rdx, 0x180(%rbp)
1454f267e:     	movb	$0x1, 0x247(%rbp)
1454f2685:     	leaq	0x15059d1(%rip), %rdx   # 0x1469f805d
1454f268c:     	leaq	0xe0(%rbp), %rcx
1454f2693:     	leaq	0x168(%rbp), %r8
1454f269a:     	callq	0x145728390 <.text+0x5727390>
1454f269f:     	nop
1454f26a0:     	movq	0xe0(%rbp), %rax
1454f26a7:     	movq	%rax, 0x238(%rbp)
1454f26ae:     	movq	0xe8(%rbp), %rax
1454f26b5:     	movq	%rax, 0x228(%rbp)
1454f26bc:     	movq	0xf0(%rbp), %r12
1454f26c3:     	leaq	0x38(%rbp), %rcx
1454f26c7:     	movq	%rdi, %rdx
1454f26ca:     	movaps	%xmm6, %xmm2
1454f26cd:     	callq	0x145424a90 <.text+0x5423a90>
1454f26d2:     	nop
1454f26d3:     	jmp	0x1454f2818 <.text+0x54f1818>
1454f26d8:     	movl	$0x2, %eax
1454f26dd:     	leaq	0x1503a24(%rip), %rcx   # 0x1469f6108
1454f26e4:     	leaq	-0x54f062b(%rip), %rdx  # 0x1400020c0 <.text+0x10c0>
1454f26eb:     	movq	%rcx, 0x1e0(%rbp)
1454f26f2:     	movq	%rax, 0x1e8(%rbp)
1454f26f9:     	leaq	0x138(%rbp), %rax
1454f2700:     	movq	%rax, 0x168(%rbp)
1454f2707:     	movq	%rdx, 0x170(%rbp)
1454f270e:     	leaq	0x1e0(%rbp), %rax
1454f2715:     	movq	%rax, 0x178(%rbp)
1454f271c:     	movq	%rdx, 0x180(%rbp)
1454f2723:     	movb	$0x1, 0x247(%rbp)
1454f272a:     	leaq	0x150592c(%rip), %rdx   # 0x1469f805d
1454f2731:     	leaq	0xe0(%rbp), %rcx
1454f2738:     	leaq	0x168(%rbp), %r8
1454f273f:     	callq	0x145728390 <.text+0x5727390>
1454f2744:     	nop
1454f2745:     	movq	0xe0(%rbp), %rax
1454f274c:     	movq	%rax, 0x238(%rbp)
1454f2753:     	movq	0xe8(%rbp), %rax
1454f275a:     	movq	%rax, 0x228(%rbp)
1454f2761:     	movq	0xf0(%rbp), %r12
1454f2768:     	movss	0x10(%r14,%r15), %xmm2
1454f276f:     	leaq	0xe0(%rbp), %rcx
1454f2776:     	movq	%rdi, %rdx
1454f2779:     	callq	0x145424a90 <.text+0x5423a90>
1454f277e:     	nop
1454f277f:     	movq	0xe8(%rbp), %rax
1454f2786:     	movq	%rax, 0x220(%rbp)
1454f278d:     	movq	0xf0(%rbp), %rsi
1454f2794:     	addss	0x10(%r14,%r15), %xmm6
1454f279b:     	leaq	0x168(%rbp), %rcx
1454f27a2:     	movq	%rdi, %rdx
1454f27a5:     	movaps	%xmm6, %xmm2
1454f27a8:     	callq	0x145424a90 <.text+0x5423a90>
1454f27ad:     	nop
1454f27ae:     	movq	0x170(%rbp), %r9
1454f27b5:     	movq	0x178(%rbp), %rax
1454f27bc:     	movq	%rax, 0x20(%rsp)
1454f27c1:     	leaq	0x38(%rbp), %rcx
1454f27c5:     	movq	0x220(%rbp), %rdx
1454f27cc:     	movq	%rsi, %r8
1454f27cf:     	movq	%r9, 0x210(%rbp)
1454f27d6:     	callq	0x14542a5f0 <.text+0x54295f0>
1454f27db:     	nop
1454f27dc:     	movq	0x168(%rbp), %rdx
1454f27e3:     	testq	%rdx, %rdx
1454f27e6:     	je	0x1454f27fa <.text+0x54f17fa>
1454f27e8:     	movl	$0x1, %r8d
1454f27ee:     	movq	0x210(%rbp), %rcx
1454f27f5:     	callq	0x1400021d0 <.text+0x11d0>
1454f27fa:     	movq	0xe0(%rbp), %rdx
1454f2801:     	testq	%rdx, %rdx
1454f2804:     	movq	0x220(%rbp), %rcx
1454f280b:     	je	0x1454f2818 <.text+0x54f1818>
1454f280d:     	movl	$0x1, %r8d
1454f2813:     	callq	0x1400021d0 <.text+0x11d0>
1454f2818:     	movq	0x48(%rbp), %rax
1454f281c:     	movq	%rax, 0xf0(%rbp)
1454f2823:     	movups	0x38(%rbp), %xmm0
1454f2827:     	movaps	%xmm0, 0xe0(%rbp)
1454f282e:     	movq	%rdi, 0x1e0(%rbp)
1454f2835:     	leaq	-0x54f077c(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f283c:     	movq	%rax, 0x1e8(%rbp)
1454f2843:     	movb	$0x1, 0x232(%rbp)
1454f284a:     	leaq	0x1247c4a(%rip), %rdx   # 0x14673a49b
1454f2851:     	leaq	0x168(%rbp), %rcx
1454f2858:     	leaq	0x1e0(%rbp), %r8
1454f285f:     	callq	0x145728390 <.text+0x5727390>
1454f2864:     	nop
1454f2865:     	movq	0x170(%rbp), %rcx
1454f286c:     	movq	0x178(%rbp), %rdx
1454f2873:     	movq	0x10(%rdi), %rbx
1454f2877:     	movq	0x18(%rdi), %r14
1454f287b:     	movq	%rcx, 0x220(%rbp)
1454f2882:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f2887:     	nop
1454f2888:     	movq	%rax, %rsi
1454f288b:     	movq	%rdx, %r15
1454f288e:     	movq	0x168(%rbp), %rdx
1454f2895:     	testq	%rdx, %rdx
1454f2898:     	je	0x1454f28ac <.text+0x54f18ac>
1454f289a:     	movl	$0x1, %r8d
1454f28a0:     	movq	0x220(%rbp), %rcx
1454f28a7:     	callq	0x1400021d0 <.text+0x11d0>
1454f28ac:     	testq	%rsi, %rsi
1454f28af:     	cmovneq	%rsi, %rbx
1454f28b3:     	cmoveq	%r14, %r15
1454f28b7:     	testq	%r15, %r15
1454f28ba:     	jns	0x1454f28d6 <.text+0x54f18d6>
1454f28bc:     	xorl	%esi, %esi
1454f28be:     	movb	$0x1, 0x232(%rbp)
1454f28c5:     	movq	%rsi, %rcx
1454f28c8:     	movq	%r15, %rdx
1454f28cb:     	callq	0x14590379b <.text+0x590279b>
1454f28d0:     	nop
1454f28d1:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f28d6:     	je	0x1454f290b <.text+0x54f190b>
1454f28d8:     	callq	0x140002200 <.text+0x1200>
1454f28dd:     	movl	$0x1, %esi
1454f28e2:     	movl	$0x1, %edx
1454f28e7:     	movq	%r15, %rcx
1454f28ea:     	callq	0x1400021c0 <.text+0x11c0>
1454f28ef:     	testq	%rax, %rax
1454f28f2:     	je	0x1454f28be <.text+0x54f18be>
1454f28f4:     	movq	%rax, 0x1d8(%rbp)
1454f28fb:     	movq	%rax, %rcx
1454f28fe:     	movq	%rbx, %rdx
1454f2901:     	movq	%r15, %r8
1454f2904:     	callq	0x1457731ed <.text+0x57721ed>
1454f2909:     	jmp	0x1454f2917 <.text+0x54f1917>
1454f290b:     	movl	$0x1, %eax
1454f2910:     	movq	%rax, 0x1d8(%rbp)
1454f2917:     	movq	%r15, 0x220(%rbp)
1454f291e:     	callq	0x140002200 <.text+0x1200>
1454f2923:     	movl	$0x18, %ecx
1454f2928:     	movl	$0x8, %edx
1454f292d:     	callq	0x1400021c0 <.text+0x11c0>
1454f2932:     	movq	%rax, 0x210(%rbp)
1454f2939:     	testq	%rax, %rax
1454f293c:     	je	0x1454f2b16 <.text+0x54f1b16>
1454f2942:     	leaq	0x168(%rbp), %rcx
1454f2949:     	leaq	0xe0(%rbp), %rdx
1454f2950:     	callq	0x145728850 <.text+0x5727850>
1454f2955:     	nop
1454f2956:     	movq	0x178(%rbp), %rax
1454f295d:     	movq	0x210(%rbp), %rcx
1454f2964:     	movq	%rax, 0x10(%rcx)
1454f2968:     	movups	0x168(%rbp), %xmm0
1454f296f:     	movups	%xmm0, (%rcx)
1454f2972:     	movq	$0x1, 0x168(%rbp)
1454f297d:     	movq	%rcx, 0x170(%rbp)
1454f2984:     	movq	$0x1, 0x178(%rbp)
1454f298f:     	movq	0xe0(%rbp), %rdx
1454f2996:     	movq	0xe8(%rbp), %r8
1454f299d:     	movq	0x28(%rdi), %rbx
1454f29a1:     	testq	%rbx, %rbx
1454f29a4:     	jns	0x1454f29c8 <.text+0x54f19c8>
1454f29a6:     	movq	%r8, 0x160(%rbp)
1454f29ad:     	movq	%rdx, 0x210(%rbp)
1454f29b4:     	xorl	%r15d, %r15d
1454f29b7:     	movq	%r15, %rcx
1454f29ba:     	movq	%rbx, %rdx
1454f29bd:     	callq	0x14590379b <.text+0x590279b>
1454f29c2:     	nop
1454f29c3:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f29c8:     	movq	0xf0(%rbp), %r13
1454f29cf:     	je	0x1454f2a21 <.text+0x54f1a21>
1454f29d1:     	movq	%r8, 0x160(%rbp)
1454f29d8:     	movq	%rdx, 0x210(%rbp)
1454f29df:     	movq	0x20(%rdi), %rsi
1454f29e3:     	callq	0x140002200 <.text+0x1200>
1454f29e8:     	movl	$0x1, %r15d
1454f29ee:     	movl	$0x1, %edx
1454f29f3:     	movq	%rbx, %rcx
1454f29f6:     	callq	0x1400021c0 <.text+0x11c0>
1454f29fb:     	testq	%rax, %rax
1454f29fe:     	je	0x1454f29b7 <.text+0x54f19b7>
1454f2a00:     	movq	%rax, %r14
1454f2a03:     	movq	%rax, %rcx
1454f2a06:     	movq	%rsi, %rdx
1454f2a09:     	movq	%rbx, %r8
1454f2a0c:     	callq	0x1457731ed <.text+0x57721ed>
1454f2a11:     	movq	0x210(%rbp), %rdx
1454f2a18:     	movq	0x160(%rbp), %r8
1454f2a1f:     	jmp	0x1454f2a27 <.text+0x54f1a27>
1454f2a21:     	movl	$0x1, %r14d
1454f2a27:     	movabsq	$-0x7ffffffffffffffe, %rax # imm = 0x8000000000000002
1454f2a31:     	movq	0x1f8(%rbp), %rcx
1454f2a38:     	movq	%rax, 0x78(%rcx)
1454f2a3c:     	movq	%rdi, 0x80(%rcx)
1454f2a43:     	movq	0x158(%rbp), %rax
1454f2a4a:     	movq	%rax, 0x98(%rcx)
1454f2a51:     	movq	0x238(%rbp), %rax
1454f2a58:     	movq	%rax, (%rcx)
1454f2a5b:     	movq	0x228(%rbp), %rax
1454f2a62:     	movq	%rax, 0x8(%rcx)
1454f2a66:     	movq	%r12, 0x10(%rcx)
1454f2a6a:     	movq	%rdx, 0x18(%rcx)
1454f2a6e:     	movq	%r8, 0x20(%rcx)
1454f2a72:     	movq	%r13, 0x28(%rcx)
1454f2a76:     	movq	%rcx, %r13
1454f2a79:     	movq	%rbx, 0x30(%rcx)
1454f2a7d:     	movq	%r14, 0x38(%rcx)
1454f2a81:     	movq	%rbx, 0x40(%rcx)
1454f2a85:     	movq	0x220(%rbp), %rax
1454f2a8c:     	movq	%rax, 0x48(%rcx)
1454f2a90:     	movq	0x1d8(%rbp), %rcx
1454f2a97:     	movq	%rcx, 0x50(%r13)
1454f2a9b:     	movq	%rax, 0x58(%r13)
1454f2a9f:     	movups	0x168(%rbp), %xmm0
1454f2aa6:     	movups	%xmm0, 0x60(%r13)
1454f2aab:     	movq	0x178(%rbp), %rax
1454f2ab2:     	movq	%rax, 0x70(%r13)
1454f2ab6:     	movq	0x150(%rbp), %rcx
1454f2abd:     	movabsq	$-0x7ffffffffffffffd, %rax # imm = 0x8000000000000003
1454f2ac7:     	cmpq	%rax, 0x98(%rbp)
1454f2ace:     	je	0x1454f2ad5 <.text+0x54f1ad5>
1454f2ad0:     	callq	0x145497750 <.text+0x5496750>
1454f2ad5:     	movq	%r13, %rax
1454f2ad8:     	movaps	0x250(%rbp), %xmm6
1454f2adf:     	addq	$0x2e8, %rsp            # imm = 0x2E8
1454f2ae6:     	popq	%rbx
1454f2ae7:     	popq	%rdi
1454f2ae8:     	popq	%rsi
1454f2ae9:     	popq	%r12
1454f2aeb:     	popq	%r13
1454f2aed:     	popq	%r14
1454f2aef:     	popq	%r15
1454f2af1:     	popq	%rbp
1454f2af2:     	retq
1454f2af3:     	movb	$0x1, 0x236(%rbp)
1454f2afa:     	movb	$0x1, 0x235(%rbp)
1454f2b01:     	movl	$0x8, %ecx
1454f2b06:     	movl	$0x18, %edx
1454f2b0b:     	callq	0x145903781 <.text+0x5902781>
1454f2b10:     	nop
1454f2b11:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f2b16:     	movb	$0x1, 0x21e(%rbp)
1454f2b1d:     	movl	$0x8, %ecx
1454f2b22:     	movl	$0x18, %edx
1454f2b27:     	callq	0x145903781 <.text+0x5902781>
1454f2b2c:     	nop
1454f2b2d:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f2b2f:     	movl	$0x8, %ecx
1454f2b34:     	movl	$0x18, %edx
1454f2b39:     	callq	0x145903781 <.text+0x5902781>
1454f2b3e:     	nop
1454f2b3f:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f2b41:     	leaq	0xe0(%rbp), %rax
1454f2b48:     	movq	%rax, 0x168(%rbp)
1454f2b4f:     	leaq	-0x54f0a96(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f2b56:     	movq	%rax, 0x170(%rbp)
1454f2b5d:     	movb	$0x1, 0x247(%rbp)
1454f2b64:     	leaq	0x12431ed(%rip), %rcx   # 0x146735d58
1454f2b6b:     	leaq	0x12431f6(%rip), %r8    # 0x146735d68
1454f2b72:     	leaq	0x168(%rbp), %rdx
1454f2b79:     	callq	0x145903d10 <.text+0x5902d10>
1454f2b7e:     	nop
1454f2b7f:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f2b81:     	movb	$0x1, 0x247(%rbp)
1454f2b88:     	leaq	0x15054a1(%rip), %r8    # 0x1469f8030
1454f2b8f:     	callq	0x145903b33 <.text+0x5902b33>
1454f2b94:     	nop
1454f2b95:     	jmp	0x1454f2ba7 <.text+0x54f1ba7>
1454f2b97:     	movl	$0x1, %ecx
1454f2b9c:     	movl	$0x10, %edx
1454f2ba1:     	callq	0x14590379b <.text+0x590279b>
1454f2ba6:     	nop
1454f2ba7:     	ud2

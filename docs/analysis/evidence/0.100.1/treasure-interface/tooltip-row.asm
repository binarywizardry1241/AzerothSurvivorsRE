
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401f10b0:     	pushq	%rbp
1401f10b1:     	pushq	%rsi
1401f10b2:     	subq	$0x258, %rsp            # imm = 0x258
1401f10b9:     	leaq	0x80(%rsp), %rbp
1401f10c1:     	movq	$-0x2, 0x1d0(%rbp)
1401f10cc:     	movq	%r9, 0x1c0(%rbp)
1401f10d3:     	movq	%rcx, %rsi
1401f10d6:     	movss	%xmm2, 0x1c8(%rbp)
1401f10de:     	movups	0x575aebb(%rip), %xmm0  # 0x14594bfa0
1401f10e5:     	movaps	%xmm0, 0x160(%rbp)
1401f10ec:     	movq	$0x0, 0x170(%rbp)
1401f10f7:     	movups	0x575aeba(%rip), %xmm1  # 0x14594bfb8
1401f10fe:     	movups	%xmm1, 0x178(%rbp)
1401f1105:     	movq	$0x0, 0x188(%rbp)
1401f1110:     	movups	0x575aeb9(%rip), %xmm1  # 0x14594bfd0
1401f1117:     	movaps	%xmm1, 0x190(%rbp)
1401f111e:     	movq	$0x0, 0x1a0(%rbp)
1401f1129:     	movups	0x575aeb8(%rip), %xmm2  # 0x14594bfe8
1401f1130:     	movups	%xmm2, 0x1a8(%rbp)
1401f1137:     	movq	$0x0, 0x1b8(%rbp)
1401f1142:     	movq	(%rdx), %rax
1401f1145:     	addq	$0x8, %rdx
1401f1149:     	movq	0x1b0(%rbp), %rcx
1401f1150:     	movq	%rcx, 0x28(%rbp)
1401f1154:     	movq	0x1b8(%rbp), %rcx
1401f115b:     	movq	%rcx, 0x30(%rbp)
1401f115f:     	movq	0x1a0(%rbp), %rcx
1401f1166:     	movq	%rcx, 0x18(%rbp)
1401f116a:     	movq	0x1a8(%rbp), %rcx
1401f1171:     	movq	%rcx, 0x20(%rbp)
1401f1175:     	movups	%xmm1, 0x8(%rbp)
1401f1179:     	movaps	0x180(%rbp), %xmm1
1401f1180:     	movups	%xmm1, -0x8(%rbp)
1401f1184:     	movaps	0x170(%rbp), %xmm1
1401f118b:     	movups	%xmm1, -0x18(%rbp)
1401f118f:     	movups	%xmm0, -0x28(%rbp)
1401f1193:     	xorps	%xmm0, %xmm0
1401f1196:     	movups	%xmm0, 0x38(%rbp)
1401f119a:     	movups	%xmm0, 0x48(%rbp)
1401f119e:     	movq	$0x0, 0x58(%rbp)
1401f11a6:     	movabsq	$0x42c8000000000002, %rcx # imm = 0x42C8000000000002
1401f11b0:     	movq	%rcx, 0x60(%rbp)
1401f11b4:     	movups	%xmm0, 0x68(%rbp)
1401f11b8:     	movups	%xmm0, 0x78(%rbp)
1401f11bc:     	movq	$0x0, 0x88(%rbp)
1401f11c7:     	movups	0x575ae9a(%rip), %xmm0  # 0x14594c068
1401f11ce:     	movups	%xmm0, 0xa0(%rbp)
1401f11d5:     	movups	0x575ae7c(%rip), %xmm0  # 0x14594c058
1401f11dc:     	movups	%xmm0, 0x90(%rbp)
1401f11e3:     	movups	0x575ae8e(%rip), %xmm0  # 0x14594c078
1401f11ea:     	movups	%xmm0, 0xb0(%rbp)
1401f11f1:     	movups	0x575ae90(%rip), %xmm0  # 0x14594c088
1401f11f8:     	movups	%xmm0, 0xc0(%rbp)
1401f11ff:     	movups	0x575ae92(%rip), %xmm0  # 0x14594c098
1401f1206:     	movups	%xmm0, 0xd0(%rbp)
1401f120d:     	movups	0x575ae94(%rip), %xmm0  # 0x14594c0a8
1401f1214:     	movups	%xmm0, 0xe0(%rbp)
1401f121b:     	movups	0x575ae96(%rip), %xmm0  # 0x14594c0b8
1401f1222:     	movups	%xmm0, 0xf0(%rbp)
1401f1229:     	movups	0x575ae98(%rip), %xmm0  # 0x14594c0c8
1401f1230:     	movups	%xmm0, 0x100(%rbp)
1401f1237:     	movaps	0x5716282(%rip), %xmm0  # 0x1459074c0
1401f123e:     	movups	%xmm0, 0x110(%rbp)
1401f1245:     	movl	$0x1, 0x120(%rbp)
1401f124f:     	movss	0x57162b9(%rip), %xmm0  # 0x145907510
1401f1257:     	movlps	%xmm0, 0x124(%rbp)
1401f125e:     	movb	$0x1, 0x12c(%rbp)
1401f1265:     	movq	$0x0, 0x130(%rbp)
1401f1270:     	movl	$0x3f800000, 0x138(%rbp) # imm = 0x3F800000
1401f127a:     	movw	$0x0, 0x13c(%rbp)
1401f1283:     	movw	$0x0, 0x142(%rbp)
1401f128c:     	movl	$0x10000, 0x13e(%rbp)   # imm = 0x10000
1401f1296:     	movw	$0x0, 0x148(%rbp)
1401f129f:     	movl	$0x10000, 0x144(%rbp)   # imm = 0x10000
1401f12a9:     	movq	$0x0, 0x14a(%rbp)
1401f12b4:     	movl	$0x7000006, 0x152(%rbp) # imm = 0x7000006
1401f12be:     	movq	%rax, -0x30(%rbp)
1401f12c2:     	movb	$0x1, 0x1cf(%rbp)
1401f12c9:     	leaq	0x575a918(%rip), %r9    # 0x14594bbe8
1401f12d0:     	leaq	-0x60(%rbp), %rcx
1401f12d4:     	leaq	-0x30(%rbp), %r8
1401f12d8:     	callq	0x1400d7270 <.text+0xd6270>
1401f12dd:     	nop
1401f12de:     	movq	%rsi, (%rbp)
1401f12e2:     	leaq	0x1c8(%rbp), %rax
1401f12e9:     	movq	%rax, 0x8(%rbp)
1401f12ed:     	movq	0x1c0(%rbp), %rax
1401f12f4:     	movups	(%rax), %xmm0
1401f12f7:     	movaps	%xmm0, -0x30(%rbp)
1401f12fb:     	movq	0x10(%rax), %rax
1401f12ff:     	movq	%rax, -0x20(%rbp)
1401f1303:     	movq	0x210(%rbp), %rax
1401f130a:     	movups	(%rax), %xmm0
1401f130d:     	movups	%xmm0, -0x18(%rbp)
1401f1311:     	movq	0x10(%rax), %rax
1401f1315:     	movq	%rax, -0x8(%rbp)
1401f1319:     	movb	$0x0, 0x1cf(%rbp)
1401f1320:     	leaq	-0x60(%rbp), %rcx
1401f1324:     	leaq	-0x30(%rbp), %rdx
1401f1328:     	callq	0x1400f2200 <.text+0xf1200>
1401f132d:     	nop
1401f132e:     	addq	$0x258, %rsp            # imm = 0x258
1401f1335:     	popq	%rsi
1401f1336:     	popq	%rbp
1401f1337:     	retq

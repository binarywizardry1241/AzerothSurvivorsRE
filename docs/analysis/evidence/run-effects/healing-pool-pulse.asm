
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b110c:     	movq	0x718(%r13), %rdx
1454b1113:     	testq	%rdx, %rdx
1454b1116:     	je	0x1454b13bb <.text+0x54b03bb>
1454b111c:     	movss	0x934(%r13), %xmm0
1454b1125:     	movq	0x710(%r13), %rax
1454b112c:     	shlq	$0x6, %rdx
1454b1130:     	xorl	%ecx, %ecx
1454b1132:     	xorl	%ebx, %ebx
1454b1134:     	nopw	%cs:(%rax,%rax)
1454b1140:     	cmpb	$0x15, (%rax,%rcx)
1454b1144:     	je	0x1454b1157 <.text+0x54b0157>
1454b1146:     	incq	%rbx
1454b1149:     	addq	$0x40, %rcx
1454b114d:     	cmpq	%rcx, %rdx
1454b1150:     	jne	0x1454b1140 <.text+0x54b0140>
1454b1152:     	jmp	0x1454b13bb <.text+0x54b03bb>
1454b1157:     	movss	0x124(%r13), %xmm1
1454b1160:     	ucomiss	%xmm0, %xmm1
1454b1163:     	ja	0x1454b13bb <.text+0x54b03bb>
1454b1169:     	movss	0x120(%r13), %xmm8
1454b1172:     	movss	0x456316(%rip), %xmm1   # 0x145907490
1454b117a:     	ucomiss	%xmm8, %xmm1
1454b117e:     	ja	0x1454b13bb <.text+0x54b03bb>
1454b1184:     	movss	0x4(%rax,%rcx), %xmm7
1454b118a:     	movl	0xc(%rax,%rcx), %edi
1454b118e:     	movss	0x8(%rax,%rcx), %xmm3
1454b1194:     	addss	0x4562f4(%rip), %xmm0   # 0x145907490
1454b119c:     	movss	%xmm0, 0x124(%r13)
1454b11a5:     	movl	$0x0, 0x120(%r13)
1454b11b0:     	movl	0x408(%r13), %eax
1454b11b7:     	movl	%eax, 0xb8(%rbp)
1454b11bd:     	movq	0x400(%r13), %rax
1454b11c4:     	movq	%rax, 0xb0(%rbp)
1454b11cb:     	movq	$0x0, 0x28(%rsp)
1454b11d4:     	movq	$0x8, 0x20(%rsp)
1454b11dd:     	leaq	0x240(%rbp), %rcx
1454b11e4:     	leaq	0xb0(%rbp), %r8
1454b11eb:     	movq	%r13, %rdx
1454b11ee:     	callq	0x145500300 <.text+0x54ff300>
1454b11f3:     	testl	%edi, %edi
1454b11f5:     	je	0x1454b12f7 <.text+0x54b02f7>
1454b11fb:     	movq	0x3e8(%r13), %rdx
1454b1202:     	movq	0x248(%rbp), %r9
1454b1209:     	movq	0x250(%rbp), %r14
1454b1210:     	movl	$0x2, 0x2b8(%rbp)
1454b121a:     	movl	$0x0, 0x2f0(%rbp)
1454b1224:     	movq	%r9, 0x20(%rbp)
1454b1228:     	movb	$0x1, 0x327(%rbp)
1454b122f:     	leaq	0x2f0(%rbp), %rax
1454b1236:     	movq	%rax, 0x30(%rsp)
1454b123b:     	leaq	0x2b8(%rbp), %rax
1454b1242:     	movq	%rax, 0x28(%rsp)
1454b1247:     	movq	%r14, 0x20(%rsp)
1454b124c:     	leaq	0xb0(%rbp), %rcx
1454b1253:     	movl	%edi, %r8d
1454b1256:     	movq	%r9, 0x358(%rbp)
1454b125d:     	callq	0x145466ab0 <.text+0x5465ab0>
1454b1262:     	nop
1454b1263:     	movq	0x560(%r13), %rsi
1454b126a:     	cmpq	0x550(%r13), %rsi
1454b1271:     	jne	0x1454b1280 <.text+0x54b0280>
1454b1273:     	leaq	0x550(%r13), %rcx
1454b127a:     	callq	0x145774710 <.text+0x5773710>
1454b127f:     	nop
1454b1280:     	movq	0x558(%r13), %rax
1454b1287:     	movq	%rsi, %rcx
1454b128a:     	shlq	$0x5, %rcx
1454b128e:     	movups	0xb0(%rbp), %xmm0
1454b1295:     	movups	0xc0(%rbp), %xmm1
1454b129c:     	movups	%xmm1, 0x10(%rax,%rcx)
1454b12a1:     	movups	%xmm0, (%rax,%rcx)
1454b12a5:     	incq	%rsi
1454b12a8:     	movq	%rsi, 0x560(%r13)
1454b12af:     	jmp	0x1454b130c <.text+0x54b030c>
1454b12b1:     	movl	$0x3f000000, 0x39c(%r13) # imm = 0x3F000000
1454b12bc:     	movq	0x2b8(%rbp), %rdx
1454b12c3:     	testq	%rdx, %rdx
1454b12c6:     	jne	0x1454b0d9f <.text+0x54afd9f>
1454b12cc:     	jmp	0x1454b0db5 <.text+0x54afdb5>
1454b12d1:     	movss	0x45625f(%rip), %xmm0   # 0x145907538
1454b12d9:     	movss	%xmm0, 0x4bc(%r13)
1454b12e2:     	movq	0x240(%rbp), %rdx
1454b12e9:     	testq	%rdx, %rdx
1454b12ec:     	jne	0x1454b020c <.text+0x54af20c>
1454b12f2:     	jmp	0x1454b021b <.text+0x54af21b>
1454b12f7:     	movq	0x248(%rbp), %rax
1454b12fe:     	movq	%rax, 0x358(%rbp)
1454b1305:     	movq	0x250(%rbp), %r14
1454b130c:     	movups	0x20(%r13), %xmm9
1454b1311:     	movq	$0x1, 0x20(%r13)
1454b1319:     	movq	%rbx, 0x28(%r13)
1454b131d:     	movq	0x240(%rbp), %rax
1454b1324:     	movq	%rax, 0x340(%rbp)
1454b132b:     	testq	%r14, %r14
1454b132e:     	je	0x1454b1394 <.text+0x54b0394>
1454b1330:     	shlq	$0x3, %r14
1454b1334:     	mulss	%xmm8, %xmm7
1454b1339:     	movzbl	0x129(%r13), %ebx
1454b1341:     	xorl	%edi, %edi
1454b1343:     	nopw	%cs:(%rax,%rax)
1454b1350:     	movq	0x358(%rbp), %rax
1454b1357:     	movq	(%rax,%rdi), %rdx
1454b135b:     	movb	$0x3, 0x129(%r13)
1454b1363:     	movb	$0x0, 0x30(%rsp)
1454b1368:     	movb	$0x0, 0x28(%rsp)
1454b136d:     	movb	$0x3, 0x20(%rsp)
1454b1372:     	movq	%r13, %rcx
1454b1375:     	movaps	%xmm7, %xmm2
1454b1378:     	movl	$0x2e4, %r9d            # imm = 0x2E4
1454b137e:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454b1383:     	nop
1454b1384:     	movb	%bl, 0x129(%r13)
1454b138b:     	addq	$0x8, %rdi
1454b138f:     	cmpq	%rdi, %r14
1454b1392:     	jne	0x1454b1350 <.text+0x54b0350>
1454b1394:     	movq	0x340(%rbp), %rdx
1454b139b:     	testq	%rdx, %rdx
1454b139e:     	je	0x1454b13b6 <.text+0x54b03b6>
1454b13a0:     	shlq	$0x3, %rdx
1454b13a4:     	movl	$0x8, %r8d
1454b13aa:     	movq	0x358(%rbp), %rcx
1454b13b1:     	callq	0x1400021d0 <.text+0x11d0>
1454b13b6:     	movups	%xmm9, 0x20(%r13)

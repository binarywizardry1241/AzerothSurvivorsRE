
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145501240:     	pushq	%r15
145501242:     	pushq	%r14
145501244:     	pushq	%rsi
145501245:     	pushq	%rdi
145501246:     	pushq	%rbx
145501247:     	subq	$0x20, %rsp
14550124b:     	movq	%r8, %rsi
14550124e:     	movl	%edx, %ebx
145501250:     	movl	%ecx, %edi
145501252:     	callq	0x145501470 <.text+0x5500470>
145501257:     	movl	$0x1, %r14d
14550125d:     	testq	%rax, %rax
145501260:     	je	0x1455012e0 <.text+0x55002e0>
145501262:     	movq	%rax, %rcx
145501265:     	movl	%edi, %edx
145501267:     	movl	%ebx, %r8d
14550126a:     	callq	0x145625c70 <.text+0x5624c70>
14550126f:     	movl	$0x1, %edi
145501274:     	movl	$0x1, %ebx
145501279:     	movl	$0x1, %r15d
14550127f:     	movl	$0x1, %r11d
145501285:     	testb	$0x1, %al
145501287:     	je	0x1455012f6 <.text+0x55002f6>
145501289:     	movl	%eax, %ecx
14550128b:     	shrl	$0x8, %ecx
14550128e:     	movl	%eax, %edx
145501290:     	shrl	$0x10, %edx
145501293:     	movl	%eax, %r8d
145501296:     	shrl	$0x18, %r8d
14550129a:     	movq	%rax, %r9
14550129d:     	shrq	$0x20, %r9
1455012a1:     	shrq	$0x28, %rax
1455012a5:     	cmpb	$0x1, %cl
1455012a8:     	adcl	$0x0, %ecx
1455012ab:     	movzbl	%cl, %r14d
1455012af:     	cmpb	$0x1, %dl
1455012b2:     	adcl	$0x0, %edx
1455012b5:     	movzbl	%dl, %edi
1455012b8:     	cmpb	$0x1, %r8b
1455012bc:     	adcl	$0x0, %r8d
1455012c0:     	movzbl	%r8b, %ebx
1455012c4:     	cmpb	$0x2, %r9b
1455012c8:     	movl	$0x1, %ecx
1455012cd:     	cmovbl	%ecx, %r9d
1455012d1:     	movzbl	%r9b, %r15d
1455012d5:     	cmpb	$0x2, %al
1455012d7:     	cmovbl	%ecx, %eax
1455012da:     	movzbl	%al, %r11d
1455012de:     	jmp	0x1455012f6 <.text+0x55002f6>
1455012e0:     	movl	$0x1, %edi
1455012e5:     	movl	$0x1, %ebx
1455012ea:     	movl	$0x1, %r15d
1455012f0:     	movl	$0x1, %r11d
1455012f6:     	movabsq	$-0x61c8864680b583eb, %rax # imm = 0x9E3779B97F4A7C15
145501300:     	xorq	%rax, %rsi
145501303:     	movq	%rsi, %rax
145501306:     	shlq	$0xd, %rax
14550130a:     	xorq	%rsi, %rax
14550130d:     	movq	%rax, %rdx
145501310:     	shrq	$0x7, %rdx
145501314:     	xorq	%rax, %rdx
145501317:     	movq	%rdx, %rcx
14550131a:     	shlq	$0x11, %rcx
14550131e:     	xorq	%rdx, %rcx
145501321:     	movq	%rcx, %rax
145501324:     	shlq	$0xd, %rax
145501328:     	xorq	%rcx, %rax
14550132b:     	movq	%rax, %rdx
14550132e:     	shrq	$0x7, %rdx
145501332:     	xorq	%rax, %rdx
145501335:     	movq	%rdx, %r8
145501338:     	shlq	$0x11, %r8
14550133c:     	xorq	%rdx, %r8
14550133f:     	movq	%r8, %rax
145501342:     	shlq	$0xd, %rax
145501346:     	xorq	%r8, %rax
145501349:     	movq	%rax, %rdx
14550134c:     	shrq	$0x7, %rdx
145501350:     	xorq	%rax, %rdx
145501353:     	movq	%rdx, %r9
145501356:     	shlq	$0x11, %r9
14550135a:     	xorq	%rdx, %r9
14550135d:     	movq	%r9, %rax
145501360:     	shlq	$0xd, %rax
145501364:     	xorq	%r9, %rax
145501367:     	movq	%rax, %rdx
14550136a:     	shrq	$0x7, %rdx
14550136e:     	xorq	%rax, %rdx
145501371:     	movq	%rdx, %r10
145501374:     	shlq	$0x11, %r10
145501378:     	xorq	%rdx, %r10
14550137b:     	movq	%r10, %rax
14550137e:     	shlq	$0xd, %rax
145501382:     	xorq	%r10, %rax
145501385:     	movq	%rax, %rdx
145501388:     	shrq	$0x7, %rdx
14550138c:     	xorq	%rax, %rdx
14550138f:     	movq	%rdx, %rax
145501392:     	shlq	$0x11, %rax
145501396:     	xorq	%rdx, %rax
145501399:     	xorl	%edx, %edx
14550139b:     	divq	%r11
14550139e:     	movq	%rdx, %r11
1455013a1:     	movq	%r10, %rax
1455013a4:     	xorl	%edx, %edx
1455013a6:     	divq	%r15
1455013a9:     	movq	%rdx, %r10
1455013ac:     	movq	%r9, %rax
1455013af:     	xorl	%edx, %edx
1455013b1:     	divq	%rbx
1455013b4:     	movq	%rdx, %r9
1455013b7:     	movq	%r8, %rax
1455013ba:     	xorl	%edx, %edx
1455013bc:     	divq	%rdi
1455013bf:     	movq	%rdx, %r8
1455013c2:     	movq	%rcx, %rax
1455013c5:     	xorl	%edx, %edx
1455013c7:     	divq	%r14
1455013ca:     	shlq	$0x20, %r11
1455013ce:     	shll	$0x18, %r10d
1455013d2:     	orq	%r11, %r10
1455013d5:     	shll	$0x10, %r9d
1455013d9:     	shll	$0x8, %r8d
1455013dd:     	orq	%r9, %r8
1455013e0:     	orq	%rdx, %r8
1455013e3:     	orq	%r10, %r8
1455013e6:     	movq	%r8, %rax
1455013e9:     	addq	$0x20, %rsp
1455013ed:     	popq	%rbx
1455013ee:     	popq	%rdi
1455013ef:     	popq	%rsi
1455013f0:     	popq	%r14
1455013f2:     	popq	%r15
1455013f4:     	retq

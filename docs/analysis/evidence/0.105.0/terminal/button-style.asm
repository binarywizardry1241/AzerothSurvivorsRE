
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140012180:     	pushq	%rbp
140012181:     	pushq	%rsi
140012182:     	pushq	%rdi
140012183:     	subq	$0xc0, %rsp
14001218a:     	leaq	0x80(%rsp), %rbp
140012192:     	movaps	%xmm6, 0x30(%rbp)
140012196:     	movq	$-0x2, 0x28(%rbp)
14001219e:     	movq	%rcx, %rsi
1400121a1:     	movups	0x5d5cbd4(%rip), %xmm0  # 0x145d6ed7c
1400121a8:     	movaps	%xmm0, -0x60(%rbp)
1400121ac:     	movl	$0x3f800000, -0x50(%rbp) # imm = 0x3F800000
1400121b3:     	movups	%xmm0, -0x4c(%rbp)
1400121b7:     	movl	$0x3f800000, -0x3c(%rbp) # imm = 0x3F800000
1400121be:     	movups	%xmm0, -0x38(%rbp)
1400121c2:     	movl	$0x3f800000, -0x28(%rbp) # imm = 0x3F800000
1400121c9:     	movups	%xmm0, -0x24(%rbp)
1400121cd:     	movl	$0x3f800000, -0x14(%rbp) # imm = 0x3F800000
1400121d4:     	callq	0x140002200 <.text+0x1200>
1400121d9:     	movl	$0x40, %ecx
1400121de:     	movl	$0x4, %edx
1400121e3:     	callq	0x1400021c0 <.text+0x11c0>
1400121e8:     	testq	%rax, %rax
1400121eb:     	je	0x140012302 <.text+0x11302>
1400121f1:     	movq	%rax, 0x20(%rbp)
1400121f5:     	movaps	0x5d5b044(%rip), %xmm0  # 0x145d6d240
1400121fc:     	movups	%xmm0, 0x10(%rbp)
140012200:     	movl	$0x0, 0xc(%rbp)
140012207:     	leaq	-0x10(%rbp), %rcx
14001220b:     	leaq	0xc(%rbp), %rdx
14001220f:     	callq	0x144c67100 <.text+0x4c66100>
140012214:     	nop
140012215:     	movaps	-0x10(%rbp), %xmm6
140012219:     	movaps	0x5d5b030(%rip), %xmm0  # 0x145d6d250
140012220:     	movups	%xmm0, 0x10(%rbp)
140012224:     	movl	$0x0, 0xc(%rbp)
14001222b:     	leaq	-0x10(%rbp), %rcx
14001222f:     	leaq	0xc(%rbp), %rdx
140012233:     	callq	0x144c67100 <.text+0x4c66100>
140012238:     	nop
140012239:     	movaps	-0x10(%rbp), %xmm0
14001223d:     	movq	0x20(%rbp), %rdi
140012241:     	movl	$0x0, (%rdi)
140012247:     	movl	$0x1, 0x8(%rdi)
14001224e:     	movups	%xmm6, 0xc(%rdi)
140012252:     	movq	$0x3f000000, 0x1c(%rdi) # imm = 0x3F000000
14001225a:     	movl	$0x1, 0x28(%rdi)
140012261:     	movups	%xmm0, 0x2c(%rdi)
140012265:     	movl	$0x3f000000, 0x3c(%rdi) # imm = 0x3F000000
14001226c:     	callq	0x140002200 <.text+0x1200>
140012271:     	movl	$0x48, %ecx
140012276:     	movl	$0x8, %edx
14001227b:     	callq	0x1400021c0 <.text+0x11c0>
140012280:     	testq	%rax, %rax
140012283:     	je	0x140012313 <.text+0x11313>
140012289:     	movq	$0x2, 0x8(%rax)
140012291:     	movq	%rdi, 0x10(%rax)
140012295:     	movq	$0x2, 0x18(%rax)
14001229d:     	movl	$0x40490fdb, 0x20(%rax) # imm = 0x40490FDB
1400122a4:     	movb	$0x0, 0x24(%rax)
1400122a8:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
1400122b2:     	movq	%rcx, (%rax)
1400122b5:     	movq	$0x1, 0x50(%rsi)
1400122bd:     	movq	%rax, 0x58(%rsi)
1400122c1:     	movq	$0x1, 0x60(%rsi)
1400122c9:     	movaps	-0x60(%rbp), %xmm0
1400122cd:     	movaps	-0x50(%rbp), %xmm1
1400122d1:     	movaps	-0x40(%rbp), %xmm2
1400122d5:     	movaps	-0x30(%rbp), %xmm3
1400122d9:     	movups	%xmm0, (%rsi)
1400122dc:     	movups	%xmm1, 0x10(%rsi)
1400122e0:     	movups	%xmm2, 0x20(%rsi)
1400122e4:     	movups	%xmm3, 0x30(%rsi)
1400122e8:     	movaps	-0x20(%rbp), %xmm0
1400122ec:     	movups	%xmm0, 0x40(%rsi)
1400122f0:     	movq	%rsi, %rax
1400122f3:     	movaps	0x30(%rbp), %xmm6
1400122f7:     	addq	$0xc0, %rsp
1400122fe:     	popq	%rdi
1400122ff:     	popq	%rsi
140012300:     	popq	%rbp
140012301:     	retq
140012302:     	movl	$0x4, %ecx
140012307:     	movl	$0x40, %edx
14001230c:     	callq	0x145d69431 <.text+0x5d68431>
140012311:     	ud2
140012313:     	movl	$0x8, %ecx
140012318:     	movl	$0x48, %edx
14001231d:     	callq	0x145d69431 <.text+0x5d68431>
140012322:     	nop
140012323:     	ud2

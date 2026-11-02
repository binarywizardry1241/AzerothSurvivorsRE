
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d71c0:     	pushq	%rsi
1454d71c1:     	subq	$0x20, %rsp
1454d71c5:     	ucomiss	%xmm1, %xmm2
1454d71c8:     	jbe	0x1454d7306 <.text+0x54d6306>
1454d71ce:     	movaps	%xmm2, %xmm3
1454d71d1:     	subss	%xmm1, %xmm3
1454d71d5:     	movd	%xmm3, %r10d
1454d71da:     	movl	%r10d, %eax
1454d71dd:     	andl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
1454d71e2:     	cmpl	$0x7f7fffff, %eax       # imm = 0x7F7FFFFF
1454d71e7:     	jg	0x1454d7320 <.text+0x54d6320>
1454d71ed:     	movq	(%rcx), %r8
1454d71f0:     	movq	0x8(%rcx), %rax
1454d71f4:     	movq	0x18(%rcx), %r9
1454d71f8:     	movq	0x10(%rcx), %rdx
1454d71fc:     	movd	%xmm1, %esi
1454d7200:     	andl	$0x7fffffff, %esi       # imm = 0x7FFFFFFF
1454d7206:     	movd	%xmm2, %r11d
1454d720b:     	andl	$0x7fffffff, %r11d      # imm = 0x7FFFFFFF
1454d7212:     	cmpl	$0x7f800000, %r11d      # imm = 0x7F800000
1454d7219:     	setl	%r11b
1454d721d:     	cmpl	$0x7f7fffff, %esi       # imm = 0x7F7FFFFF
1454d7223:     	jg	0x1454d72a7 <.text+0x54d62a7>
1454d7229:     	testb	%r11b, %r11b
1454d722c:     	je	0x1454d72a7 <.text+0x54d62a7>
1454d722e:     	movss	0x3d132e(%rip), %xmm3   # 0x1458a8564
1454d7236:     	nopw	%cs:(%rax,%rax)
1454d7240:     	leaq	(%r8,%r9), %r11
1454d7244:     	rolq	$0x17, %r11
1454d7248:     	addq	%r8, %r11
1454d724b:     	movq	%rax, %rsi
1454d724e:     	shlq	$0x11, %rsi
1454d7252:     	xorq	%r8, %rdx
1454d7255:     	xorq	%rax, %r9
1454d7258:     	xorq	%rdx, %rax
1454d725b:     	xorq	%r9, %r8
1454d725e:     	xorq	%rsi, %rdx
1454d7261:     	rolq	$0x2d, %r9
1454d7265:     	shrq	$0x29, %r11
1454d7269:     	orl	$0x3f800000, %r11d      # imm = 0x3F800000
1454d7270:     	movd	%r11d, %xmm4
1454d7275:     	addss	%xmm3, %xmm4
1454d7279:     	movd	%r10d, %xmm0
1454d727e:     	mulss	%xmm4, %xmm0
1454d7282:     	addss	%xmm1, %xmm0
1454d7286:     	ucomiss	%xmm0, %xmm2
1454d7289:     	ja	0x1454d72f1 <.text+0x54d62f1>
1454d728b:     	movl	%r10d, %r11d
1454d728e:     	andl	$0x7fffffff, %r11d      # imm = 0x7FFFFFFF
1454d7295:     	xorl	%esi, %esi
1454d7297:     	cmpl	$0x7f800000, %r11d      # imm = 0x7F800000
1454d729e:     	setge	%sil
1454d72a2:     	subl	%esi, %r10d
1454d72a5:     	jmp	0x1454d7240 <.text+0x54d6240>
1454d72a7:     	leaq	(%r8,%r9), %r10
1454d72ab:     	rolq	$0x17, %r10
1454d72af:     	addq	%r8, %r10
1454d72b2:     	movq	%rax, %r11
1454d72b5:     	shlq	$0x11, %r11
1454d72b9:     	xorq	%r8, %rdx
1454d72bc:     	xorq	%rax, %r9
1454d72bf:     	xorq	%rdx, %rax
1454d72c2:     	xorq	%r9, %r8
1454d72c5:     	xorq	%r11, %rdx
1454d72c8:     	rolq	$0x2d, %r9
1454d72cc:     	shrq	$0x29, %r10
1454d72d0:     	orl	$0x3f800000, %r10d      # imm = 0x3F800000
1454d72d7:     	movd	%r10d, %xmm0
1454d72dc:     	addss	0x3d1280(%rip), %xmm0   # 0x1458a8564
1454d72e4:     	mulss	%xmm3, %xmm0
1454d72e8:     	addss	%xmm1, %xmm0
1454d72ec:     	ucomiss	%xmm0, %xmm2
1454d72ef:     	jbe	0x1454d72a7 <.text+0x54d62a7>
1454d72f1:     	movq	%r8, (%rcx)
1454d72f4:     	movq	%r9, 0x18(%rcx)
1454d72f8:     	movq	%rax, 0x8(%rcx)
1454d72fc:     	movq	%rdx, 0x10(%rcx)
1454d7300:     	addq	$0x20, %rsp
1454d7304:     	popq	%rsi
1454d7305:     	retq
1454d7306:     	leaq	0x15da748(%rip), %rcx   # 0x146ab1a55
1454d730d:     	leaq	0x15da7bc(%rip), %r8    # 0x146ab1ad0
1454d7314:     	movl	$0x19, %edx
1454d7319:     	callq	0x1458a40e0 <.text+0x58a30e0>
1454d731e:     	ud2
1454d7320:     	leaq	0x15da701(%rip), %rcx   # 0x146ab1a28
1454d7327:     	leaq	0x15da6e2(%rip), %r8    # 0x146ab1a10
1454d732e:     	movl	$0x2d, %edx
1454d7333:     	callq	0x1458a40e0 <.text+0x58a30e0>
1454d7338:     	ud2
